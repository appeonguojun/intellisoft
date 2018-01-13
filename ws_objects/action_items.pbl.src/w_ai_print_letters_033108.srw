$PBExportHeader$w_ai_print_letters_033108.srw
forward
global type w_ai_print_letters_033108 from w_response
end type
type cbx_app_printer from checkbox within w_ai_print_letters_033108
end type
type r_bar_outside from rectangle within w_ai_print_letters_033108
end type
type cb_close from u_cb within w_ai_print_letters_033108
end type
type cb_print_all from u_cb within w_ai_print_letters_033108
end type
type cbx_preview from checkbox within w_ai_print_letters_033108
end type
type ole_print from olecustomcontrol within w_ai_print_letters_033108
end type
type dw_parent_facility from u_dw within w_ai_print_letters_033108
end type
type dw_address_cnt from u_dw within w_ai_print_letters_033108
end type
type dw_addr_mail_cnt from u_dw within w_ai_print_letters_033108
end type
type gb_1 from groupbox within w_ai_print_letters_033108
end type
type r_bar from rectangle within w_ai_print_letters_033108
end type
type st_bar from statictext within w_ai_print_letters_033108
end type
type st_apps from statictext within w_ai_print_letters_033108
end type
type ddplb_filter from dropdownpicturelistbox within w_ai_print_letters_033108
end type
type dw_letters from u_dw within w_ai_print_letters_033108
end type
type uo_print_app from pfc_cst_u_create_app2 within w_ai_print_letters_033108
end type
type gb_corro from groupbox within w_ai_print_letters_033108
end type
type dw_corro from u_dw within w_ai_print_letters_033108
end type
type gb_letters from groupbox within w_ai_print_letters_033108
end type
end forward

global type w_ai_print_letters_033108 from w_response
integer x = 23
integer y = 248
integer width = 3154
integer height = 1792
string title = "Print Letters"
boolean controlmenu = false
cbx_app_printer cbx_app_printer
r_bar_outside r_bar_outside
cb_close cb_close
cb_print_all cb_print_all
cbx_preview cbx_preview
ole_print ole_print
dw_parent_facility dw_parent_facility
dw_address_cnt dw_address_cnt
dw_addr_mail_cnt dw_addr_mail_cnt
gb_1 gb_1
r_bar r_bar
st_bar st_bar
st_apps st_apps
ddplb_filter ddplb_filter
dw_letters dw_letters
uo_print_app uo_print_app
gb_corro gb_corro
dw_corro dw_corro
gb_letters gb_letters
end type
global w_ai_print_letters_033108 w_ai_print_letters_033108

type variables
pfc_n_cst_ai_printletters inv_printletters

String is_doc_id[]

u_dw idw_verif_data

Boolean ib_print_letter = True
Boolean ib_print_app = False
Boolean ib_app_faxed = False
Boolean ib_fax_num_email_search = False

Long il_app_id

String is_client_id,is_client_id_arr[]  //Ken.Guo 2007-10-25
end variables

forward prototypes
public function integer of_print_application (boolean ab_fax)
public function integer of_fax_num_email_search ()
public function integer of_buttonclicked (long ai_row)
end prototypes

public function integer of_print_application (boolean ab_fax);Integer li_facility_id
Integer li_rc
Integer i
Integer LI_LAST_NUM_SENT
Integer li_found
String ls_letter_allias
Long ll_prac_id
String ls_doc_id
String ls_image_path
Boolean ib_connected

st_apps.Visible = True

li_rc = dw_letters.RowCount()

uo_print_app.Visible = True

uo_print_app.of_connections( "IntelliCred", "0" )

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-01
//$<modify> 02.20.2006 By: LeiWei
//$<reason> Performance tuning
//$<modification> Write script to retrieve data from a cache instead of from the database.

/*
//Get image paths and load up image doc
SELECT ids.imaging_path , ids.intelliapp_app_path
INTO :ls_image_path,:gs_app_image_path  
FROM ids;
IF SQLCA.SQLCODE = -1 THEN
	MessageBox("Database Error", SQLCA.SQLERRTEXT )
	Return -1
END IF
*/
ls_image_path = gnv_data.of_getitem( "ids", "imaging_path", false )
gs_app_image_path = gnv_data.of_getitem( "ids", "intelliapp_app_path", false )
//---------------------------- APPEON END ----------------------------

uo_print_app.of_set_app_id( il_app_id  )

FOR i = 1 TO li_rc

	ls_letter_allias = dw_letters.GetItemString( i, "letter_alias" )

	IF ls_letter_allias <> "Expiring Appointment Letter" and  ls_letter_allias <> "Expiring Provisional Letter" and  ls_letter_allias <> "Expiring Allied Health Letter" THEN
		CONTINUE 
	END IF

	//GarbageCollect ( )
	IF uo_print_app.of_load_app( ) = -1 THEN
		Return -1
	END IF

	st_apps.Text = "Generating application " + String( i ) + " of " + String( li_rc )

	ll_prac_id = dw_letters.GetItemNumber( i, "prac_id" )
	li_facility_id = dw_letters.GetItemNumber( i, "facility_id" )

	uo_print_app.ii_prac_id = ll_prac_id

	IF uo_print_app.of_setup( il_app_id, 1  , 99, li_facility_id ) = -1 THEN
		CONTINUE
	END IF
	
	IF ab_fax THEN
		uo_print_app.of_save_for_faxing( i )			
	ELSE  //Start Code Change ---- 11.01.2006 #1 maha
		if not cbx_app_printer.checked then
			uo_print_app.ole_edit.object.PrintImage()
		else
			uo_print_app.of_print_all( )	
		end if
		//End Code Change---11.01.2006
	END IF

	IF NOT ib_print_letter THEN
		ls_doc_id = dw_letters.GetItemString( i, "doc_id" )
		li_found = idw_verif_data.Find( "doc_id = '" +  ls_doc_id + "'" , 1, 10000 )	
		li_last_num_sent = idw_verif_data.GetItemNumber( li_found, "number_sent" )
		IF IsNull(li_last_num_sent) THEN
			li_last_num_sent = 0
		END IF
		li_last_num_sent++
		idw_verif_data.SetItem( li_found, "number_sent", li_last_num_sent )
		idw_verif_data.SetItem( li_found, "print_flag", 0 )			
		IF IsNull( idw_verif_data.GetItemDateTime( li_found, "first_sent" ) ) THEN
			idw_verif_data.SetItem( li_found, "first_sent", DateTime(Today(), Now()) )
		END IF
		idw_verif_data.SetItem( li_found, "last_sent", DateTime(Today(), Now()) )
	END IF

	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> PT-02
	//$<comment> 02.20.2006 By: LeiWei
	//$<reason> Performance tuning
	//$<modification> Move the following script out of the loop to PT-03. It is integrated 
	//$<modification> into Appeon Queue labels to reduce client-server interactions.
	 
	/*
	idw_verif_data.Update( )
	COMMIT USING SQLCA;
	*/
	//---------------------------- APPEON END ----------------------------

END FOR

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-03
//$<add> 02.20.2006 By: LeiWei
//$<reason> Performance tuning
//$<modification> Copy the script from PT-02 and add Appeon Queue labels to
//$<ID> reduce client-server interactions.

gnv_appeondb.of_startqueue( )

idw_verif_data.Update( )
COMMIT USING SQLCA;

gnv_appeondb.of_commitqueue( )
//---------------------------- APPEON END ----------------------------

dw_letters.SetItem( dw_letters.GetRow(), "num_printed", li_rc)	
dw_letters.SetItem( dw_letters.GetRow(), "print_status", 1 )		

st_apps.Text = "Done printing applications."

uo_print_app.Visible = False

st_apps.Visible = False

Return 1


end function

public function integer of_fax_num_email_search ();String ls_letter_name
String ls_fax_number
String ls_email
Integer li_rc
Integer L
Long ll_prac_id
Integer li_facility_id
Integer li_grow
Integer li_tick

IF ib_fax_num_email_search THEN
	RETURN 1
END IF

r_bar.Visible = True
r_bar_outside.Visible = True
st_bar.Visible = True

li_rc = dw_letters.RowCount( )

//li_tick = Round( r_bar.Width/li_rc, 0 )
//r_bar.Width = 1	

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-04
//$<add> 03.03.2006 By: LeiWei
//$<reason> Performance tuning
//$<modification> Move the SQLs in the loop in PT-05 here and rewrite the script by
//$<modification> using datastores to cache data from database. Then the subsequent
//$<modification> script directly obtain data from the datatastore.
Long ll_prac_id_arr[], li_facility_id_arr[], ll_i, ll_ic
FOR l = 1 TO li_rc
	ll_prac_id = dw_letters.GetItemNumber( l, "prac_id" )
	li_facility_id = dw_letters.GetItemNumber( l, "facility_id" )		
	ll_prac_id_arr[l] = ll_prac_id
	li_facility_id_arr[l] = li_facility_id
END FOR

IF li_rc > 0 THEN
	Datastore lds_pd_address
	lds_pd_address = Create Datastore
	lds_pd_address.dataobject = "d_pd_address_link_forpt"
	lds_pd_address.Settransobject( SQLCA )
	ll_ic = lds_pd_address.Retrieve(ll_prac_id_arr[], li_facility_id_arr[])
END IF
//---------------------------- APPEON END ----------------------------


FOR l = 1 TO li_rc
	li_grow = li_grow + li_tick
	r_bar.Width = r_bar.width + li_grow 
	//ls_letter_name = Upper( dw_letters.GetItemString( l, "letter_alias" ) )
	ls_letter_name = Upper( dw_letters.GetItemString( l, "letter_name" ) )
	ll_prac_id = dw_letters.GetItemNumber( l, "prac_id" )
	li_facility_id = dw_letters.GetItemNumber( l, "facility_id" )		
	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> PT-05
	//$<modify> 03.03.2006 By: LeiWei
	//$<reason> Performance tuning
	//$<modification> Move the SQLs in the loop to PT-04 and rewrite them to reduce client-server
	//$<modification> interactions.
	/*
	IF ls_letter_name = "EXPIRING APPOINTMENT" OR ls_letter_name = "BASIC INFORMATION" THEN
		SELECT fax, e_mail_address
		INTO :ls_fax_number,
			  :ls_email
		FROM pd_address,
		     pd_address_link
		WHERE (pd_address.rec_id = pd_address_link.address_id ) AND
				(pd_address_link.prac_id = :ll_prac_id ) AND
				(pd_address_link.facility_id = :li_facility_id ) AND
				(pd_address.active_status = 1 ) AND
				(pd_address_link.mailing = 1 );
		IF SQLCA.SQLCODE = -1 THEN
			MessageBox( "SQL Error", SQLCA.SQLERRTEXT )
			Return -1
		END IF
		dw_letters.SetItem( l, "fax_number", ls_fax_number )					
	ELSEIF Mid( ls_letter_name, 1, 8 )  = "EXPIRING" THEN
		SELECT fax, e_mail_address
		INTO :ls_fax_number,
			  :ls_email
		FROM pd_address,
		     pd_address_link
		WHERE (pd_address.rec_id = pd_address_link.address_id ) AND
				(pd_address_link.prac_id = :ll_prac_id ) AND
				(pd_address_link.facility_id = :li_facility_id ) AND
				(pd_address.active_status = 1 ) AND
				(pd_address_link.exp_letters = 1 );
		IF SQLCA.SQLCODE = -1 THEN
			MessageBox( "SQL Error", SQLCA.SQLERRTEXT )
			Return -1
		END IF
		dw_letters.SetItem( l, "fax_number", ls_fax_number )					
		dw_letters.SetItem( l, "email_address", ls_email )							
	END IF		
	*/
	//IF ls_letter_name = "EXPIRING APPOINTMENT" OR ls_letter_name = "BASIC INFORMATION" THEN
	IF dw_letters.GetItemnumber( l, "screen_id" )  = 1 THEN

		ll_i = lds_pd_address.Find("prac_id = "+String(ll_prac_id) + " and facility_id = " + String(li_facility_id)+&
				" and pd_address_link.mailing = 1", 1, ll_ic)
		ls_fax_number = ""
		IF ll_i > 0 THEN	ls_fax_number = lds_pd_address.Getitemstring(ll_i,"pd_address_fax")

		dw_letters.SetItem( l, "fax_number", ls_fax_number )					
	ELSEIF Mid( ls_letter_name, 1, 8 )  = "EXPIRING" THEN
		ll_i = lds_pd_address.Find("prac_id = "+String(ll_prac_id) + " and facility_id = " + String(li_facility_id)+&
				" and pd_address_link.exp_letters = 1", 1, ll_ic)
		ls_fax_number = ""
		ls_email = ""
		IF ll_i > 0 THEN
			ls_fax_number = lds_pd_address.Getitemstring(ll_i,"pd_address_fax")
			ls_email = lds_pd_address.Getitemstring(ll_i,"pd_address_e_mail_address")
		END IF
		
		dw_letters.SetItem( l, "fax_number", ls_fax_number )					
		dw_letters.SetItem( l, "email_address", ls_email )							
	END IF		
	//---------------------------- APPEON END ----------------------------
END FOR

ib_fax_num_email_search = True

r_bar.Visible = False
r_bar_outside.Visible = False
st_bar.Visible = False


Return 0
end function

public function integer of_buttonclicked (long ai_row);//Start Code Change ---- 09-26.2007 #V7 maha
//added as an alternative the the buttonclicked code which remains commented out

Integer li_error = 0
Integer li_rc
Integer li_retval
Integer i
Integer li_facility_id
Integer li_address_cnt
Integer li_parent_id
Integer li_word_storage_type
integer pos 
integer li_screen
integer p
Long ll_prac_id
Boolean lb_print_preview
Boolean lb_print_release = False
Boolean lb_print_priv = False
String ls_print_rule
String ls_sql
String ls_doc_name //name of the document
String ls_letter_allias //displayed letter name
String ls_facility_name
String is_clear_id[]
string style //maha 081601
string doctest
string ls_let_name
string ls_doc_org
Long ll_pracids[]  //maha 040903 for use with export
LONG ll_arr_prac_id[]
DataStore lds_parent_facility
DataStore lds_address_cnt
DataStore lds_addr_mail_cnt


dw_letters.AcceptText()

IF dw_letters.GetItemNumber( ai_row, "print_release" ) = 1  THEN
	lb_print_release = True
END IF

IF dw_letters.GetItemNumber( ai_row, "print_priv" ) = 1  THEN
	lb_print_priv = True
END IF

if dw_letters.getitemstring( ai_row, "letter_style" ) =  "P" then  //if correspondence letter
	ls_let_name = dw_letters.GetItemString( ai_row, "letter_alias" )
else
	ls_let_name = dw_letters.GetItemString( ai_row, "letter" )
end if

ls_letter_allias = dw_letters.GetItemString( ai_row, "letter_alias" )
ls_doc_name = dw_letters.GetItemString( ai_row, "doc_name" )
ls_doc_org = ls_doc_name
li_facility_id = dw_letters.GetItemNumber( ai_row, "facility_id" )
li_screen = dw_letters.GetItemNumber( ai_row, "screen_id" )

li_word_storage_type = Integer(gnv_data.of_getitem( "icred_settings", "set_50", FALSE))
//IF Isnull(li_word_storage_type) THEN li_word_storage_type = 0
//IF Upper( AppeonGetClientType() ) = "PB" AND li_word_storage_type = 0 THEN  //windows hard drive storage
//	ls_doc_name = dw_letters.GetItemString( ai_row, "facility_letter_path" ) + ls_doc_name
//END IF

gnv_appeondb.of_startqueue( )

SELECT facility.facility_name  
INTO :ls_facility_name  
FROM facility  
WHERE facility.facility_id = :li_facility_id; 

IF ls_letter_allias = "Expiring Appointment Letter"  THEN
	SELECT ia_reapp_ai_process, ia_reapp_app
	INTO: ls_print_rule,
	    : il_app_id 
	FROM facility
	WHERE facility_id = :li_facility_id;
	IF SQLCA.SQLCODE = -1 THEN
		MessageBox("SQL ERROR", SQLCA.SQLERRTEXT )
		Return -1
	END IF
elseif ls_letter_allias = "Expiring Provisional Letter" then
	SELECT ia_reapp_ai_process, prov_app_id
	INTO: ls_print_rule,
	    : il_app_id 
	FROM facility
	WHERE facility_id = :li_facility_id;
	IF SQLCA.SQLCODE = -1 THEN
		MessageBox("SQL ERROR", SQLCA.SQLERRTEXT )
		Return -1
	END IF	
elseif ls_letter_allias = "Expiring Allied Health Letter"  then
	SELECT ia_reapp_ai_process, reappah_app_id
	INTO: ls_print_rule,
	    : il_app_id 
	FROM facility
	WHERE facility_id = :li_facility_id;
	IF SQLCA.SQLCODE = -1 THEN
		MessageBox("SQL ERROR", SQLCA.SQLERRTEXT )
		Return -1
	END IF
END IF

gnv_appeondb.of_commitqueue( )

//doctest = dw_letters.GetItemString( ai_row, "init_veif_letter_doc_nm" )
doctest = dw_letters.GetItemString( ai_row, "doc_name" )


//doc name test
//Start Code Change ---- 10.17.2007 #V7 maha  rewrote toinclude all letter types
IF isnull( ls_doc_name)  or len(ls_doc_name) = 0 then
	IF Pos( Upper(ls_letter_allias), "EXPIRING" ) >0  and li_screen > 1 then  //expiring verifications
		messagebox("Setup Problem","There is no Expiring letter name set up for the " + ls_letter_allias + " Screen in the facility painter for the " + ls_facility_name + " facility.")		
	ELSEIF li_screen > 1 then //verifications
		messagebox("Setup Problem","There is no verification letter name set up for the " + ls_letter_allias + " Screen in the facility painter for the " + ls_facility_name + " facility.")
	ELSEIF Pos( Upper(ls_letter_allias), "EXPIRING" ) > 0 then  //Appointment letters
		messagebox("Setup Problem","There is no  letter name set up for the " + ls_letter_allias + "  in the facility painter for the " + ls_facility_name + " facility.")
	ELSE //correspondence
		messagebox("Setup Problem","The is no letter for the" + ls_letter_allias + " Correspondence letter  in the Letter painter.")
	END IF
	return -1
END IF
//End Code Change---10.17.2007

//\/maha 121900 for pix second verification letter
if dw_letters.GetItemnumber( ai_row, "verif_info_verification_id" ) = 2 then
	pos = Pos( Upper(ls_doc_name), ".DOC" )
	pos = pos - 1
	ls_doc_name = Mid ( ls_doc_name, 1 , pos) + "_cc.doc"
end if
//\maha
integer sdf
sdf = dw_letters.GetItemNumber( ai_row, "ctotal_letters" ) 
IF dw_letters.GetItemNumber( ai_row, "ctotal_letters" ) = 0 THEN //the number of letters for this clicked
	MessageBox("Invalid Selection", "All letters for selected letter type have been printed.")
	Return -1
END IF

dw_letters.SetRow(ai_row)

IF cbx_preview.Checked THEN
	lb_print_preview = True
ELSE
	lb_print_preview = False
END IF

li_rc = dw_letters.RowCount()

is_doc_id[] = is_clear_id[]

dw_parent_facility.SetTransObject( SQLCA )
dw_address_cnt.SetTransObject( SQLCA )
dw_addr_mail_cnt.SetTransObject( SQLCA )

//this is wrong all pracs are being retrieved not just the ones for the given letter
FOR i = 1 TO li_rc
	//check each record for document/facility match to get pracs
	if dw_letters.GetItemString( i, "doc_name" ) = ls_doc_name and dw_letters.GetItemNumber( i, "facility_id" ) = li_facility_id then 
		ll_arr_prac_id[i] = dw_letters.GetItemNumber( i, "prac_id" )
	end if
NEXT

lds_parent_facility = Create DataStore
lds_parent_facility.DataObject = "d_get_parent_facility_all_forpt"
lds_parent_facility.settransobject( SQLCA )

lds_address_cnt = Create DataStore
lds_address_cnt.DataObject = "d_get_address_cnt_all_forpt"
lds_address_cnt.settransobject( SQLCA )

lds_addr_mail_cnt = Create DataStore
lds_addr_mail_cnt.DataObject = "d_get_mail_address_cnt_all_forpt"
lds_addr_mail_cnt.settransobject( SQLCA )

gnv_appeondb.of_startqueue( )

lds_parent_facility.Retrieve( ll_arr_prac_id[], li_facility_id )
lds_address_cnt.Retrieve( ll_arr_prac_id[] )
lds_addr_mail_cnt.Retrieve( ll_arr_prac_id[], li_facility_id )

gnv_appeondb.of_commitqueue( )

//---------------------------- APPEON END ----------------------------

FOR i = 1 TO li_rc
	debugbreak()
	doctest = dw_letters.GetItemString( i, "doc_name" )
	IF doctest = ls_doc_org and dw_letters.GetItemNumber( i, "facility_id" ) = li_facility_id then //if match do the code
			
			li_error = 0 //resetting error variable
			ll_prac_id = dw_letters.GetItemNumber( i, "prac_id" )
			
			
			IF Pos( Upper(ls_doc_name), "EXPIRING" ) > 0 THEN
				//expiring cred letters addr link check
				if Pos( Upper(ls_doc_name), "EXPIRING_APPOINT" ) < 1 then //not expiring appointment
	
					lds_parent_facility.SetFilter( "prac_id = " + String(ll_prac_id))
					lds_parent_facility.Filter()
					IF lds_parent_facility.RowCount() > 0 THEN   //there might still be an issue if this returns more than 1 row 111300 maha
						li_parent_id = lds_parent_facility.GetItemNumber( 1, "parent_facility_id" )
					ELSE
						li_parent_id = 0
					END IF
					li_address_cnt = 0
					
					lds_address_cnt.SetFilter( "prac_id = " + String(ll_prac_id))
					lds_address_cnt.Filter()
					IF lds_address_cnt.RowCount() > 0 THEN
						li_address_cnt = lds_address_cnt.GetItemNumber( 1, "address_cnt" )
					ELSE
						li_address_cnt = 0
					END IF

					
					IF li_address_cnt < 1 THEN	
						MessageBox("Expiring Letter", "Check the address link screen to see that Practitioner ID " + String( ll_prac_id ) + " has an Active expiring letter address link selected.")
						li_error = 1
					END IF
				ELSE
			
	
					li_address_cnt = 0
	
					lds_addr_mail_cnt.SetFilter( "prac_id = " + String(ll_prac_id))
					lds_addr_mail_cnt.Filter()
					IF lds_addr_mail_cnt.RowCount() > 0 THEN
						li_address_cnt = lds_addr_mail_cnt.GetItemNumber( 1, "address_cnt" )
					ELSE
						li_address_cnt = 0
					END IF
					//---------------------------- APPEON END ----------------------------
					IF li_address_cnt < 1 THEN
						debugbreak()					
						MessageBox("Expiring Letter", "The Practitioner with the ID of " + String( ll_prac_id ) + " does not have an Active practitioner correspondence address setup in the address link window for the " + ls_facility_name + " facility.")
						li_error = 1
					END IF
					//\maha
				END IF
			END IF
			//IF li_error = 0 THEN //if error = 1 don't add to arrays
			p++
			is_doc_id[ p] = dw_letters.GetItemString( i, "doc_id" )
			ll_pracids[p] = ll_prac_id
			//end if
	ELSE //not the same letter/facility
		//skip
	END IF
END FOR

Destroy lds_parent_facility
Destroy lds_address_cnt
Destroy lds_addr_mail_cnt

//if windows stored on hard drive modify the path
IF Upper( AppeonGetClientType() ) = "PB" AND li_word_storage_type = 0 THEN
	ls_doc_name = dw_letters.GetItemString( ai_row, "facility_letter_path" ) + ls_doc_name
END IF
	
 //this tests to see if the verification was set up as duplicate letter	
if dw_letters.GetItemnumber( ai_row , "verif_info_verification_id" ) = 2 then
	pos = Pos( Upper(ls_doc_name), ".DOC" )
	pos = pos - 1
	doctest = Mid ( ls_doc_name, 1 , pos) + "_cc.doc"
end if

if dw_letters.getitemstring( ai_row, "letter_style" ) =  "P" then  //maha changed to variable 081601
	style = "P"  //corresp letter
else
	style = Upper(Left(dw_letters.GetItemString( ai_row, "letter_style1" ),1))
end if

ls_sql = dw_letters.GetItemString( ai_row, "ver_ltr_sql" )

messagebox(" ls_sql", ls_sql)

IF Upper( ls_print_rule ) = "PRINTAPP" THEN
	ib_print_letter = False		
	ib_print_app = True
ELSEIF Upper( ls_print_rule ) = "PRINTBOTH" THEN
	ib_print_app = True
END IF
//messagebox("ls_let_name",ls_let_name)
li_retval = 0 
IF ib_print_letter THEN

	if dw_letters.getitemstring( ai_row, "letter_alias" ) = "Applications Audit Missing 90 days" then
		inv_printletters.of_missing_info_90_days_print( is_doc_id[], idw_verif_data )
	else
		li_retval = inv_printletters.of_printletters( is_doc_id[], "S", ls_let_name, 	style , idw_verif_data,ls_doc_name, lb_print_preview, ls_sql,ll_pracids[],li_facility_id )
	end if


END IF

IF ib_print_app AND li_retval = 0 AND ib_app_faxed = False THEN
	of_print_application( False )
END IF

return 1			

				


end function

on w_ai_print_letters_033108.create
int iCurrent
call super::create
this.cbx_app_printer=create cbx_app_printer
this.r_bar_outside=create r_bar_outside
this.cb_close=create cb_close
this.cb_print_all=create cb_print_all
this.cbx_preview=create cbx_preview
this.ole_print=create ole_print
this.dw_parent_facility=create dw_parent_facility
this.dw_address_cnt=create dw_address_cnt
this.dw_addr_mail_cnt=create dw_addr_mail_cnt
this.gb_1=create gb_1
this.r_bar=create r_bar
this.st_bar=create st_bar
this.st_apps=create st_apps
this.ddplb_filter=create ddplb_filter
this.dw_letters=create dw_letters
this.uo_print_app=create uo_print_app
this.gb_corro=create gb_corro
this.dw_corro=create dw_corro
this.gb_letters=create gb_letters
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cbx_app_printer
this.Control[iCurrent+2]=this.r_bar_outside
this.Control[iCurrent+3]=this.cb_close
this.Control[iCurrent+4]=this.cb_print_all
this.Control[iCurrent+5]=this.cbx_preview
this.Control[iCurrent+6]=this.ole_print
this.Control[iCurrent+7]=this.dw_parent_facility
this.Control[iCurrent+8]=this.dw_address_cnt
this.Control[iCurrent+9]=this.dw_addr_mail_cnt
this.Control[iCurrent+10]=this.gb_1
this.Control[iCurrent+11]=this.r_bar
this.Control[iCurrent+12]=this.st_bar
this.Control[iCurrent+13]=this.st_apps
this.Control[iCurrent+14]=this.ddplb_filter
this.Control[iCurrent+15]=this.dw_letters
this.Control[iCurrent+16]=this.uo_print_app
this.Control[iCurrent+17]=this.gb_corro
this.Control[iCurrent+18]=this.dw_corro
this.Control[iCurrent+19]=this.gb_letters
end on

on w_ai_print_letters_033108.destroy
call super::destroy
destroy(this.cbx_app_printer)
destroy(this.r_bar_outside)
destroy(this.cb_close)
destroy(this.cb_print_all)
destroy(this.cbx_preview)
destroy(this.ole_print)
destroy(this.dw_parent_facility)
destroy(this.dw_address_cnt)
destroy(this.dw_addr_mail_cnt)
destroy(this.gb_1)
destroy(this.r_bar)
destroy(this.st_bar)
destroy(this.st_apps)
destroy(this.ddplb_filter)
destroy(this.dw_letters)
destroy(this.uo_print_app)
destroy(this.gb_corro)
destroy(this.dw_corro)
destroy(this.gb_letters)
end on

event open;call super::open;Integer rc
Integer i
Long ll_verif_method
String ls_verif_method
gs_pass_ids lstr_ids
string is_doc

lstr_ids = Message.PowerObjectParm
This.Title = This.Title + "  ( " + lstr_ids.s_stringval + " )"
inv_printletters = CREATE pfc_n_cst_ai_printletters
is_doc_id = lstr_ids.s_ids
rc = upperbound(is_doc_id[])
idw_verif_data = lstr_ids.dw


//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 10/25/2007 By: Ken.Guo
//$<reason> For Performance in Web
//rc = dw_letters.Retrieve( is_doc_id )
string ls_client_id
n_cst_array_db ln_cst_array_db_case
If appeongetclienttype() = 'WEB' Then
	ln_cst_array_db_case = Create n_cst_array_db
	If ln_cst_array_db_case.of_array_to_db( lstr_ids.s_ids[], ls_client_id) < 0 Then
		messagebox('Information','Failed to generate letter data, please call support.')
		Destroy ln_cst_array_db_case
		Return
	End If
	dw_letters.dataobject = 'd_ai_print_all_letters_web'
	dw_letters.SetTransObject(SQLCA)	
	dw_letters.Retrieve( ls_client_id )
	is_client_id_arr[1] = ls_client_id
Else
	rc = dw_letters.Retrieve( is_doc_id )	
End If
//---------------------------- APPEON END ----------------------------


//--------------------------- APPEON BEGIN ---------------------------
//$<add> 11.23.2006 By: Jervis
//$<reason> print Correspondence
if gb_workflow then
	rc = upperbound(lstr_ids.s_doc_ids)
	if rc > 0 then
		//--------------------------- APPEON BEGIN ---------------------------
		//$<modify> 10/25/2007 By: Ken.Guo
		//$<reason> For web performance
		//dw_corro.Retrieve(lstr_ids.s_doc_ids)	
		If appeongetclienttype() = 'WEB' Then
			If ln_cst_array_db_case.of_array_to_db(lstr_ids.s_doc_ids[], ls_client_id) < 0 Then
				messagebox('Information','Failed to generate letter data, please call support.')
				Destroy ln_cst_array_db_case
				Return				
			End If
			dw_corro.dataobject = 'd_ai_print_corro_web'
			dw_corro.SetTransObject(SQLCA)	
			gnv_appeondb.of_startqueue()
			dw_corro.Retrieve( ls_client_id )
			ln_cst_array_db_case.of_delete_temp_data(ls_client_id)
			gnv_appeondb.of_commitqueue()					
		Else
			dw_corro.Retrieve(lstr_ids.s_doc_ids[])
		End If
		//---------------------------- APPEON END ----------------------------
		dw_letters.height = gb_corro.y - gb_letters.y - 80
		gb_letters.height = gb_corro.y - gb_letters.y
		uo_print_app.height = dw_letters.height
		
		gb_corro.visible = true
		dw_corro.visible = true
		dw_corro.bringtotop = true
	end if
end if
//---------------------------- APPEON END ----------------------------

If isvalid(ln_cst_array_db_case) Then Destroy ln_cst_array_db_case



end event

event close;call super::close;//idw_verif_data.SetFilter( "" )
//idw_verif_data.Filter( )

end event

type cbx_app_printer from checkbox within w_ai_print_letters_033108
boolean visible = false
integer x = 1088
integer y = 1560
integer width = 498
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Change Appl.Printer"
end type

type r_bar_outside from rectangle within w_ai_print_letters_033108
boolean visible = false
integer linethickness = 4
long fillcolor = 80269524
integer x = 1595
integer y = 1524
integer width = 1015
integer height = 60
end type

type cb_close from u_cb within w_ai_print_letters_033108
integer x = 2757
integer y = 1496
integer height = 84
integer taborder = 80
boolean bringtotop = true
string text = "&Close"
end type

event clicked;debugbreak()
//--------------------------- APPEON BEGIN ---------------------------
//$<add> 10/25/2007 By: Ken.Guo
//$<reason> Destroy temp data
n_cst_array_db ln_cst_array_db_case
If UpperBound(is_client_id_arr[]) > 0 Then
	ln_cst_array_db_case = Create n_cst_array_db
	ln_cst_array_db_case.of_delete_temp_data(is_client_id_arr[])
	Destroy ln_cst_array_db_case
End If
//---------------------------- APPEON END ----------------------------
Close( Parent )
end event

type cb_print_all from u_cb within w_ai_print_letters_033108
boolean visible = false
integer x = 366
integer y = 1728
integer taborder = 60
boolean bringtotop = true
string text = "&Print All"
end type

event clicked;//////updated 051501 maha
//Integer li_error = 0
//Integer li_rc
//integer li_row_cnt
//Integer i
//integer r
//Integer li_facility_id
//Integer li_address_cnt
//Integer li_parent_id
//Long ll_prac_id
//Boolean lb_print_preview
//Boolean lb_print_release = False
//Boolean lb_print_priv = False
//String ls_doc_name
//String ls_sql
//string ls_doc_check
//String ls_facility_name
//String is_clear_id[]
//integer pos //maha 121900
//string doctest
//
//dw_letters.AcceptText()
//
//
//li_row_cnt = dw_letters.RowCount()
//
//IF li_row_cnt = 0 THEN
//	MessageBox("Print", "No letters to print.", Information! )
//	Return -1
//END IF
//
//for r = 1 to li_row_cnt
//
//	IF dw_letters.GetItemNumber( r, "print_status" ) = 1  THEN
//		continue
//	END IF
//	IF dw_letters.GetItemNumber( r, "print_release" ) = 1  THEN
//		lb_print_release = True
//	END IF
//	
//	IF dw_letters.GetItemNumber( r, "print_priv" ) = 1  THEN
//		lb_print_priv = True
//	END IF
//	
//	ls_doc_name = dw_letters.GetItemString( r, "doc_name" )
//	//\/maha 121900 for pix second verification letter
//	if dw_letters.GetItemnumber( r, "verif_info_verification_id" ) = 2 then
//		pos = Pos( Upper(ls_doc_name), ".DOC" )
//		pos = pos - 1
//		ls_doc_name = Mid ( ls_doc_name, 1 , pos) + "_cc.doc"
//	end if
//	//\maha
//	if ls_doc_check = ls_doc_name then 
//		continue
//	else
//		ls_doc_check = ls_doc_name
//	end if
//	IF dw_letters.GetItemNumber( r, "ctotal_letters" ) = 0 THEN
//		MessageBox("Invalid Selection", "All letters for selected letter type have been printed.")
//		Return -1
//	END IF
//	
//	dw_letters.SetRow(r)
//	
//	IF cbx_preview.Checked THEN
//		lb_print_preview = True
//	ELSE
//		lb_print_preview = False
//	END IF
//	
//	li_rc = dw_letters.RowCount()
//	
//	is_doc_id[] = is_clear_id[]
//	
//	dw_parent_facility.SetTransObject( SQLCA )
//	dw_address_cnt.SetTransObject( SQLCA )
//	dw_addr_mail_cnt.SetTransObject( SQLCA )
//	FOR i = 1 TO li_rc
//		li_facility_id = dw_letters.GetItemNumber( i, "facility_id" )
//		SELECT facility.facility_name  
//		INTO :ls_facility_name  
//		FROM facility  
//		WHERE facility.facility_id = :li_facility_id   ;
//		//\/maha 011801
//		doctest = dw_letters.GetItemString( i, "doc_name" )
//		if dw_letters.GetItemnumber( i, "verif_info_verification_id" ) = 2 then
//			pos = Pos( Upper(doctest), ".DOC" )
//			pos = pos - 1
//			doctest = Mid ( doctest, 1 , pos) + "_cc.doc"
//		end if
//			//\maha
//		IF   doctest = ls_doc_name THEN			//line changed 011801 maha
//			ll_prac_id = dw_letters.GetItemNumber( i, "prac_id" )
//			
//			//the following code rechanged 111300 from that of 101000 maha
//			IF Pos( Upper(ls_doc_name), "EXPIRING" ) > 0 THEN
//				//expiring cred letters addr link check
//				if Pos( Upper(ls_doc_name), "EXPIRING_APPOINT" ) < 1 then //not expiring appointment
//					dw_parent_facility.Retrieve( ll_prac_id, li_facility_id )
//					IF dw_parent_facility.RowCount() > 0 THEN   //there might still be an issue if this returns more than 1 row 111300 maha
//						li_parent_id = dw_parent_facility.GetItemNumber( 1, "parent_facility_id" )
//					ELSE
//						li_parent_id = 0
//					END IF
//					li_address_cnt = 0
//					dw_address_cnt.Retrieve( ll_prac_id)
//					IF dw_address_cnt.RowCount() > 0 THEN
//						li_address_cnt = dw_address_cnt.GetItemNumber( 1, "address_cnt" )
//					ELSE
//						li_address_cnt = 0
//					END IF
//					IF li_address_cnt < 1 THEN
//						MessageBox("Expiring Letter", "Check the address link screen to see that Practitioner ID " + String( ll_prac_id ) + " has an expiring letter address link selected for each affiliated facility")
//						li_error = 1
//					END IF
//				ELSE
//			
//				//\/maha 011300  expiring appt letters addr link check
//					li_address_cnt = 0
//					dw_addr_mail_cnt.Retrieve( ll_prac_id, li_facility_id ) //dw changed 032101 maha to check mailing address
//					IF dw_addr_mail_cnt.RowCount() > 0 THEN
//						li_address_cnt = dw_addr_mail_cnt.GetItemNumber( 1, "address_cnt" )
//					ELSE
//						li_address_cnt = 0
//					END IF
//					IF li_address_cnt < 1 THEN
//						MessageBox("Expiring Letter", "The Practitioner with the ID of " + String( ll_prac_id ) + " does not have a practitioner correspondence address setup in the address link window for the " + ls_facility_name + " facility.")
//						li_error = 1
//					END IF
//					//\maha
//				END IF
//			END IF
//			is_doc_id[ i ] = dw_letters.GetItemString( i, "doc_id" )
//		END IF
//	END FOR
//	
//	debugbreak()
//	//IF li_error = 1 THEN
//	//	Return
//	//END IF
//	//messagebox("",dw_letters.GetItemString( row, "doc_name" ))
//	ls_sql = dw_letters.GetItemString( r, "ver_ltr_sql" )	
//	inv_printletters.of_printletters( is_doc_id[], "S", +&
//					dw_letters.GetItemString( r, "letter" ), +&
//					Upper(Left(dw_letters.GetItemString( r, "letter_style1" ),1)), +&
//					idw_verif_data,ls_doc_name, lb_print_preview, ls_sql ) //maha 121900 replaced:dw_letters.GetItemString( row, "doc_name" )with ls_doc nam
//				
//end for
//				
end event

type cbx_preview from checkbox within w_ai_print_letters_033108
integer x = 1088
integer y = 1480
integer width = 389
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Print Preview"
boolean checked = true
end type

type ole_print from olecustomcontrol within w_ai_print_letters_033108
event keydown ( ref integer keycode,  integer shift )
event keyup ( ref integer keycode,  integer shift )
event keypress ( ref integer keyascii )
event mousedown ( integer button,  integer shift,  long ocx_x,  long ocx_y )
event mousemove ( integer button,  integer shift,  long ocx_x,  long ocx_y )
event mouseup ( integer button,  integer shift,  long ocx_x,  long ocx_y )
event click ( )
event dblclick ( )
event ocx_error ( integer number,  ref string description,  long scode,  string source,  string helpfile,  long helpcontext,  ref boolean canceldisplay )
event ocx_close ( )
event markend ( long left,  long top,  long ocx_width,  long ocx_height,  integer marktype,  string groupname )
event toolselected ( integer toolid )
event selectionrectdrawn ( long left,  long top,  long ocx_width,  long ocx_height )
event tooltip ( integer index )
event toolpalettehidden ( long left,  long top )
event scroll ( )
event markselect ( integer button,  integer shift,  long left,  long top,  long ocx_width,  long ocx_height,  integer marktype,  string groupname )
event pastecompleted ( )
event load ( double zoom )
event markmove ( integer marktype,  string groupname )
event pagepropertiesclose ( )
event checkcontinueprinting ( long pagesprinted,  long currentpage,  integer status )
event hyperlinkgotopage ( long page )
event errorsavingundoinformation ( long ocx_error )
event straightenpage ( )
event hyperlinkgotodoc ( string link,  long page,  ref boolean handled )
event editingtextannotation ( boolean editing )
event magnifierstatus ( integer hwnd,  long status,  long magnifierzoom,  long left,  long top,  long ocx_width,  long ocx_height )
event pasteclip ( ref long mode )
event baddocumentfiletype ( long page,  ref boolean errorout,  ref boolean skippage,  ref boolean overwritepage )
event nextpage ( )
event prevpage ( )
event overlayfilenotfound ( ref string overlayfilename,  ref boolean btryagain )
event imagedraganddrop ( )
event zoomchanged ( real zoom )
event readystatechange ( long readystate )
boolean visible = false
integer x = 818
integer y = 1664
integer width = 466
integer height = 144
integer taborder = 70
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
string binarykey = "w_ai_print_letters_033108.win"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
end type

type dw_parent_facility from u_dw within w_ai_print_letters_033108
boolean visible = false
integer x = 859
integer y = 1668
integer width = 165
integer height = 136
integer taborder = 40
boolean bringtotop = true
string dataobject = "d_get_parent_facility"
end type

type dw_address_cnt from u_dw within w_ai_print_letters_033108
boolean visible = false
integer x = 1074
integer y = 1664
integer width = 169
integer height = 136
integer taborder = 20
boolean bringtotop = true
string dataobject = "d_get_address_cnt"
end type

type dw_addr_mail_cnt from u_dw within w_ai_print_letters_033108
boolean visible = false
integer x = 1353
integer y = 1664
integer width = 169
integer height = 136
integer taborder = 90
boolean bringtotop = true
string dataobject = "d_get_mail_address_cnt"
end type

type gb_1 from groupbox within w_ai_print_letters_033108
integer x = 37
integer y = 1456
integer width = 933
integer height = 176
integer taborder = 50
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "Filters"
end type

type r_bar from rectangle within w_ai_print_letters_033108
boolean visible = false
long linecolor = 80269524
integer linethickness = 4
long fillcolor = 255
integer x = 1600
integer y = 1528
integer width = 1006
integer height = 52
end type

type st_bar from statictext within w_ai_print_letters_033108
boolean visible = false
integer x = 1595
integer y = 1464
integer width = 443
integer height = 48
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Processing Records"
boolean focusrectangle = false
end type

type st_apps from statictext within w_ai_print_letters_033108
integer x = 1006
integer y = 1560
integer width = 1655
integer height = 72
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
boolean enabled = false
alignment alignment = center!
boolean focusrectangle = false
end type

type ddplb_filter from dropdownpicturelistbox within w_ai_print_letters_033108
integer x = 69
integer y = 1512
integer width = 869
integer height = 532
integer taborder = 90
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Show All Letters","Faxable Letters","Faxable Letters with NO email","Emailable Letters","Emailable Letters with NO Fax #","Letters with no Fax or Email"}
borderstyle borderstyle = stylelowered!
integer itempictureindex[] = {4,3,3,2,2,1}
string picturename[] = {"Report5!","Globals!","Custom020!","Report!"}
long picturemaskcolor = 553648127
end type

event selectionchanged;of_fax_num_email_search( )
dw_letters.AcceptText()

//show all
IF index = 1 THEN
	dw_letters.SetFilter( "" )
	dw_letters.Filter( )		
//faxable letters	
ELSEIF index = 2 THEN
	dw_letters.SetFilter( "Len( fax_number ) > 0" )
	dw_letters.Filter( )					
//faxable letters	with NO email
ELSEIF index = 3 THEN
	dw_letters.SetFilter( "Len( fax_number ) > 0 AND (Len( email_address ) = 0 OR email_address = '' OR IsNull(email_address))" )
	dw_letters.Filter( )						
//emailable letters
ELSEIF index = 4 THEN
	dw_letters.SetFilter( "Len( email_address ) > 0" )
	dw_letters.Filter( )					
//emailable letters with NO fax	
ELSEIF index = 5 THEN
	dw_letters.SetFilter( "Len( email_address ) > 0 AND (Len( fax_number ) = 0 OR fax_number = '' OR IsNull(fax_number))" )
	dw_letters.Filter( )					
//print only
ELSE
	dw_letters.SetFilter( "(Len( fax_number ) = 0 OR fax_number = '' OR IsNull(fax_number)) AND (Len( email_address ) = 0 OR email_address = '' OR IsNull(email_address))" )
	dw_letters.Filter( )						
END IF

dw_letters.sort()
dw_letters.GroupCalc ( )


	
end event

type dw_letters from u_dw within w_ai_print_letters_033108
integer x = 73
integer y = 68
integer width = 3008
integer height = 1356
integer taborder = 10
string dataobject = "d_ai_print_all_letters_asa"
boolean hscrollbar = true
end type

event constructor;//Start Code Change ---- 12.20.2007 #V8 maha
if gs_dbtype = "ASA" then
	this.dataobject = "d_ai_print_all_letters_asa"
elseif gs_dbtype = "SQL" then
	this.dataobject = "d_ai_print_all_letters"
end if

This.of_SetUpdateAble( False )
This.of_SetTransObject( SQLCA )

end event

event buttonclicked;//Start Code Change ---- 09.26.2007 #V7 maha changed to function to correct but retain orig code
//of_buttonclicked(row)
//return
//End Code Change---09.26.2007

Integer li_error = 0
Integer li_rc
Integer li_retval
Integer i
Integer li_facility_id
Integer li_address_cnt
Integer li_parent_id
Long ll_prac_id
Boolean lb_print_preview
Boolean lb_print_release = False
Boolean lb_print_priv = False
String ls_print_rule
String ls_sql
String ls_doc_name
String ls_letter_allias
String ls_facility_name
String is_clear_id[]
integer pos //maha 121900
string style //maha 081601
string doctest
string ls
Long ll_pracids[]  //maha 040903 for use with export
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-06
//$<add> 02.20.2006 By: LeiWei
//$<reason> Performance tuning
//$<modification> Define the datastores for caching data.
LONG ll_arr_prac_id[]
DataStore lds_parent_facility
DataStore lds_address_cnt
DataStore lds_addr_mail_cnt
String ls_doc_id  //Ken.Guo 10/31/2007

SetPointer(HourGlass!)
//---------------------------- APPEON END ----------------------------

This.AcceptText()

IF This.GetItemNumber( row, "print_release" ) = 1  THEN
	lb_print_release = True
END IF

IF This.GetItemNumber( row, "print_priv" ) = 1  THEN
	lb_print_priv = True
END IF

ls_letter_allias = This.GetItemString( row, "letter_alias" )
ls = This.GetItemString( row, "letter_name" )

ls_doc_name = This.GetItemString( row, "doc_name" )
//--------------------------- APPEON BEGIN ---------------------------
//$<add> 07.05.2006 By: LeiWei
//$<reason> Check word templete storage type
Integer li_word_storage_type
li_word_storage_type = Integer(gnv_data.of_getitem( "icred_settings", "set_50", FALSE))
IF Isnull(li_word_storage_type) THEN li_word_storage_type = 0
IF Upper( AppeonGetClientType() ) = "PB" AND li_word_storage_type = 0 THEN
	ls_doc_name = This.GetItemString( row, "facility_letter_path" ) + ls_doc_name
END IF
//---------------------------- APPEON END ----------------------------

li_facility_id = This.GetItemNumber( row, "facility_id" )//moved from beginning of for maha 040903

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-07
//$<add> 01.17.2006 By: LeiWei
//$<reason> Performance tuning
//$<modification> 1)Copy the script from PT-12 here.
//$<modification> 2)Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.
 
gnv_appeondb.of_startqueue( )

SELECT facility.facility_name  //select moved from beginning of if maha 040903
INTO :ls_facility_name  
FROM facility  
WHERE facility.facility_id = :li_facility_id; 

IF ls_letter_allias = "Expiring Appointment Letter"  THEN
	SELECT ia_reapp_ai_process, ia_reapp_app
	INTO: ls_print_rule,
	    : il_app_id 
	FROM facility
	WHERE facility_id = :li_facility_id;
	IF SQLCA.SQLCODE = -1 THEN
		MessageBox("SQL ERROR", SQLCA.SQLERRTEXT )
		Return -1
	END IF
elseif ls_letter_allias = "Expiring Provisional Letter" then
	SELECT ia_reapp_ai_process, prov_app_id
	INTO: ls_print_rule,
	    : il_app_id 
	FROM facility
	WHERE facility_id = :li_facility_id;
	IF SQLCA.SQLCODE = -1 THEN
		MessageBox("SQL ERROR", SQLCA.SQLERRTEXT )
		Return -1
	END IF	
elseif ls_letter_allias = "Expiring Allied Health Letter"  then
	SELECT ia_reapp_ai_process, reappah_app_id
	INTO: ls_print_rule,
	    : il_app_id 
	FROM facility
	WHERE facility_id = :li_facility_id;
	IF SQLCA.SQLCODE = -1 THEN
		MessageBox("SQL ERROR", SQLCA.SQLERRTEXT )
		Return -1
	END IF
END IF

gnv_appeondb.of_commitqueue( )

//---------------------------- APPEON END ----------------------------

doctest = This.GetItemString( row, "init_veif_letter_doc_nm" )
//Start Code Change ---- 03.27.2006 #346 maha
	//Start Code Change ---- 05.17.2006 #455 maha changed from field letter to letter_name
IF Pos( Upper(ls_doc_name), "EXPIRING" ) < 1  and this.GetItemstring( row, "letter_name") <> "Basic Information" then
	if isnull(doctest) or doctest = "" then
		messagebox("Data Error","There is no verification letter name set up for the " + ls_letter_allias + " Screen in the facility painter for the " + ls_facility_name + " facility.")
		return -1
	end if
end if
//End Code Change---03.27.2006
//\/maha 121900 for pix second verification letter
if This.GetItemnumber( row, "verif_info_verification_id" ) = 2 then
	pos = Pos( Upper(ls_doc_name), ".DOC" )
	pos = pos - 1
	ls_doc_name = Mid ( ls_doc_name, 1 , pos) + "_cc.doc"
end if
//\maha
IF This.GetItemNumber( row, "ctotal_letters" ) = 0 THEN
	MessageBox("Invalid Selection", "All letters for selected letter type have been printed.")
	Return -1
END IF

This.SetRow(row)

IF cbx_preview.Checked THEN
	lb_print_preview = True
ELSE
	lb_print_preview = False
END IF

li_rc = This.RowCount()

is_doc_id[] = is_clear_id[]

dw_parent_facility.SetTransObject( SQLCA )
dw_address_cnt.SetTransObject( SQLCA )
dw_addr_mail_cnt.SetTransObject( SQLCA )

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-08
//$<add> 01.17.2006 By: LeiWei
//$<reason> Performance tuning
//$<modification> 1)Use datastores to cache data from database. Refer to PT-10 for more information.
//$<modification> 2)Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.
FOR i = 1 TO li_rc
	//--------------------------- APPEON BEGIN ---------------------------
	//$<modify> 10/26/2007 By: Ken.Guo
	//$<reason> Suppress repeating values, For retrieve performance.
	//ll_arr_prac_id[i] = This.GetItemNumber( i, "prac_id" )
	If i = 1 Then
		ll_arr_prac_id[UpperBound(ll_arr_prac_id) + 1] = This.GetItemNumber( i, "prac_id" )
	Else
		If ll_arr_prac_id[UpperBound(ll_arr_prac_id)] <> This.GetItemNumber( i, "prac_id" ) Then
			ll_arr_prac_id[UpperBound(ll_arr_prac_id) + 1] = This.GetItemNumber( i, "prac_id" )
		End If
	End If
	//---------------------------- APPEON END ----------------------------
NEXT

lds_parent_facility = Create DataStore
lds_parent_facility.DataObject = "d_get_parent_facility_all_forpt"
lds_parent_facility.settransobject( SQLCA )

lds_address_cnt = Create DataStore
lds_address_cnt.DataObject = "d_get_address_cnt_all_forpt"
lds_address_cnt.settransobject( SQLCA )

lds_addr_mail_cnt = Create DataStore
lds_addr_mail_cnt.DataObject = "d_get_mail_address_cnt_all_forpt"
lds_addr_mail_cnt.settransobject( SQLCA )


//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 10/25/2007 By: Ken.Guo
//$<reason>  For web performance
/*
lds_parent_facility.Retrieve( ll_arr_prac_id[], li_facility_id )
lds_address_cnt.Retrieve( ll_arr_prac_id[] )
lds_addr_mail_cnt.Retrieve( ll_arr_prac_id[], li_facility_id )
*/
n_cst_array_db ln_cst_array_db_case
If AppeonGetclientType() = 'WEB' Then
	If is_client_id = '' Then
		ln_cst_array_db_case = Create n_cst_array_db
		If ln_cst_array_db_case.of_array_to_db(ll_arr_prac_id[], is_client_id) < 0 Then
			messagebox('Information','Failed to generate letter data, please call support.')
			Destroy ln_cst_array_db_case
			Return
		End If
	End If
	lds_parent_facility.DataObject = "d_get_parent_facility_all_forpt_web"
	lds_address_cnt.DataObject = "d_get_address_cnt_all_forpt_web"
	lds_addr_mail_cnt.DataObject = "d_get_mail_address_cnt_all_forpt_web"
	lds_parent_facility.settransobject( SQLCA )
	lds_address_cnt.settransobject( SQLCA )
	lds_addr_mail_cnt.settransobject( SQLCA )
	
	gnv_appeondb.of_startqueue()
	lds_parent_facility.Retrieve(is_client_id, li_facility_id )
	lds_address_cnt.Retrieve(is_client_id )
	lds_addr_mail_cnt.Retrieve(is_client_id, li_facility_id )
	is_client_id_arr[2] = is_client_id
	gnv_appeondb.of_commitqueue()
Else
	gnv_appeondb.of_startqueue()
	lds_parent_facility.Retrieve( ll_arr_prac_id[], li_facility_id )
	lds_address_cnt.Retrieve( ll_arr_prac_id[] )
	lds_addr_mail_cnt.Retrieve( ll_arr_prac_id[], li_facility_id )
	gnv_appeondb.of_commitqueue()
End If
Destroy ln_cst_array_db_case
//---------------------------- APPEON END ----------------------------


//---------------------------- APPEON END ----------------------------

FOR i = 1 TO li_rc
	//li_facility_id = This.GetItemNumber( i, "facility_id" )
	//\/maha 011801
	doctest = This.GetItemString( i, "doc_name" )

	//--------------------------- APPEON BEGIN ---------------------------
	//$<add> 07.05.2006 By: LeiWei
	//$<reason> Check word templete storage type
	IF Upper( AppeonGetClientType() ) = "PB" AND li_word_storage_type = 0 THEN
		doctest = This.GetItemString( row, "facility_letter_path" ) + doctest
	END IF
	//---------------------------- APPEON END ----------------------------

	if This.GetItemnumber( i, "verif_info_verification_id" ) = 2 then //this tests to see if the verification was set up as duplicate letter
		pos = Pos( Upper(doctest), ".DOC" )
		pos = pos - 1
		doctest = Mid ( doctest, 1 , pos) + "_cc.doc"
	end if
		//\maha
	IF   doctest = ls_doc_name THEN			//line chanced 011801 maha
		li_error = 0 //resetting error variable
		ll_prac_id = This.GetItemNumber( i, "prac_id" )
		
		//the following code rechanged 111300 from that of 101000 maha
		IF Pos( Upper(ls_doc_name), "EXPIRING" ) > 0 THEN
			//expiring cred letters addr link check
			if Pos( Upper(ls_doc_name), "EXPIRING_APPOINT" ) < 1 then //not expiring appointment
				//--------------------------- APPEON BEGIN ---------------------------
				//$<ID> PT-09
				//$<modify> 02.21.2006 By: LeiWei
				//$<reason> Performance tuning
				//$<modification> Write script to retrieve data from a cache in PT-09 instead of from the database.

				/*
				dw_parent_facility.Retrieve( ll_prac_id, li_facility_id )
				IF dw_parent_facility.RowCount() > 0 THEN   //there might still be an issue if this returns more than 1 row 111300 maha
					li_parent_id = dw_parent_facility.GetItemNumber( 1, "parent_facility_id" )
				ELSE
					li_parent_id = 0
				END IF

				li_address_cnt = 0
				dw_address_cnt.Retrieve( ll_prac_id)
				IF dw_address_cnt.RowCount() > 0 THEN
					li_address_cnt = dw_address_cnt.GetItemNumber( 1, "address_cnt" )
				ELSE
					li_address_cnt = 0
				END IF
				*/

				lds_parent_facility.SetFilter( "prac_id = " + String(ll_prac_id))
				lds_parent_facility.Filter()
				IF lds_parent_facility.RowCount() > 0 THEN   //there might still be an issue if this returns more than 1 row 111300 maha
					li_parent_id = lds_parent_facility.GetItemNumber( 1, "parent_facility_id" )
				ELSE
					li_parent_id = 0
				END IF
				li_address_cnt = 0
				
				lds_address_cnt.SetFilter( "prac_id = " + String(ll_prac_id))
				lds_address_cnt.Filter()
				IF lds_address_cnt.RowCount() > 0 THEN
					li_address_cnt = lds_address_cnt.GetItemNumber( 1, "address_cnt" )
				ELSE
					li_address_cnt = 0
				END IF
				//---------------------------- APPEON END ----------------------------
				
				IF li_address_cnt < 1 THEN			
					MessageBox("Expiring Letter", "Check the address link screen to see that Practitioner ID " + String( ll_prac_id ) + " has an Active expiring letter address link selected.")
					li_error = 1
				END IF
			ELSE
		
			//\/maha 011300  expiring appt letters addr link check
				li_address_cnt = 0
				//--------------------------- APPEON BEGIN ---------------------------
				//$<ID> PT-10
				//$<modify> 02.21.2006 By: LeiWei
				//$<reason> Performance tuning
				//$<modification> Write script to retrieve data from a cache in PT-09 instead of from the database.
				/*
				dw_addr_mail_cnt.Retrieve( ll_prac_id, li_facility_id ) //dw changed 032101 maha to check mailing address
				IF dw_addr_mail_cnt.RowCount() > 0 THEN
					li_address_cnt = dw_addr_mail_cnt.GetItemNumber( 1, "address_cnt" )
				ELSE
					li_address_cnt = 0
				END IF
				*/
				lds_addr_mail_cnt.SetFilter( "prac_id = " + String(ll_prac_id))
				lds_addr_mail_cnt.Filter()
				IF lds_addr_mail_cnt.RowCount() > 0 THEN
					li_address_cnt = lds_addr_mail_cnt.GetItemNumber( 1, "address_cnt" )
				ELSE
					li_address_cnt = 0
				END IF
				//---------------------------- APPEON END ----------------------------
				IF li_address_cnt < 1 THEN
					MessageBox("Expiring Letter", "The Practitioner with the ID of " + String( ll_prac_id ) + " does not have an Active practitioner correspondence address setup in the address link window for the " + ls_facility_name + " facility.")
					li_error = 1
				END IF
				//\maha
			END IF
		END IF
		IF li_error = 0 THEN //if error = 1 don't add to arrays
			//--------------------------- APPEON BEGIN ---------------------------
			//$<modify> 10/26/2007 By: Ken.Guo
			//$<reason>  For Performance
			/*
			is_doc_id[ i ] = This.GetItemString( i, "doc_id" )
			ll_pracids[ i ] = ll_prac_id		
			*/
			ls_doc_id = This.GetItemString( i, "doc_id" )
			If ls_doc_id <> '' and not isnull(ls_doc_id) Then
				is_doc_id[UpperBound(is_doc_id[]) + 1 ] = This.GetItemString( i, "doc_id" )
			End If
			If UpperBound(ll_pracids[]) = 0 Then
				ll_pracids[UpperBound(ll_pracids[]) + 1 ] = ll_prac_id
			Else
				If ll_pracids[UpperBound(ll_pracids[])] <> ll_prac_id Then
					ll_pracids[UpperBound(ll_pracids[]) + 1 ] = ll_prac_id
				End If
			End If
			//---------------------------- APPEON END ----------------------------		

		end if
	END IF
END FOR

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-11
//$<add> 02.20.2006 By: LeiWei
//$<reason> Performance tuning
//$<modification> Destroy datastores to release memory.
Destroy lds_parent_facility
Destroy lds_address_cnt
Destroy lds_addr_mail_cnt
//---------------------------- APPEON END ----------------------------

if This.getitemstring( row, "letter_style" ) =  "P" then  //maha changed to variable 081601
	style = "P"  //corresp letter
else
	style = Upper(Left(This.GetItemString( row, "letter_style1" ),1))
end if

ls_sql = This.GetItemString( row, "ver_ltr_sql" )

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-12
//$<comment> 02.21.2006 By: LeiWei
//$<reason> Performance tuning
//$<modification> Move the folloiwng script to PT-07. It is integrated into Appeon
//$<modification> Queue labels to reduce client-server interactions.
/*
IF ls_letter_allias = "Expiring Appointment Letter"  THEN
	SELECT ia_reapp_ai_process, ia_reapp_app
	INTO: ls_print_rule,
	    : il_app_id 
	FROM facility
	WHERE facility_id = :li_facility_id;
	IF SQLCA.SQLCODE = -1 THEN
		MessageBox("SQL ERROR", SQLCA.SQLERRTEXT )
		Return -1
	END IF
elseif ls_letter_allias = "Expiring Provisional Letter" then
	SELECT ia_reapp_ai_process, prov_app_id
	INTO: ls_print_rule,
	    : il_app_id 
	FROM facility
	WHERE facility_id = :li_facility_id;
	IF SQLCA.SQLCODE = -1 THEN
		MessageBox("SQL ERROR", SQLCA.SQLERRTEXT )
		Return -1
	END IF	
elseif ls_letter_allias = "Expiring Allied Health Letter"  then
	SELECT ia_reapp_ai_process, reappah_app_id
	INTO: ls_print_rule,
	    : il_app_id 
	FROM facility
	WHERE facility_id = :li_facility_id;
	IF SQLCA.SQLCODE = -1 THEN
		MessageBox("SQL ERROR", SQLCA.SQLERRTEXT )
		Return -1
	END IF
END IF
*/
//---------------------------- APPEON END ----------------------------

IF Upper( ls_print_rule ) = "PRINTAPP" THEN
	ib_print_letter = False		
	ib_print_app = True
ELSEIF Upper( ls_print_rule ) = "PRINTBOTH" THEN
	ib_print_app = True
END IF

li_retval = 0 
IF ib_print_letter THEN
	//messagebox("",This.GetItemString( row, "doc_name" ))

	//--------------------------- APPEON BEGIN ---------------------------
	//$<modify> 2006-10-17 By: Rodger Wu (Inova)
	//$<reason> Add code to allow printing Miss Info Letter 90 days.
	/*
	li_retval = inv_printletters.of_printletters( is_doc_id[], "S", This.GetItemString( row, "letter" ), 	style , idw_verif_data,ls_doc_name, lb_print_preview, ls_sql,ll_pracids[],li_facility_id )
	*/
	if this.getitemstring( row, "letter_alias" ) = "Applications Audit Missing 90 days" then
		inv_printletters.of_missing_info_90_days_print( is_doc_id[], idw_verif_data )
	else
		li_retval = inv_printletters.of_printletters( is_doc_id[], "S", This.GetItemString( row, "letter" ), 	style , idw_verif_data,ls_doc_name, lb_print_preview, ls_sql,ll_pracids[],li_facility_id )
	end if
	//---------------------------- APPEON END ----------------------------

END IF

//IF ls_letter_allias = "Reappointment Letter" THEN
//MessageBox("", "Would you like to print your reappointment application now." )
//END IF

IF ib_print_app AND li_retval = 0 AND ib_app_faxed = False THEN
	of_print_application( False )
END IF

				

				


end event

event retrieveend;call super::retrieveend;Integer i
string ls_ref//maha081501
string ls_lett//maha081501
string ls_print_rule
Long ll_app_id
Integer li_facility_id
Boolean lb_print_app = False
//return 1
//if its a special case letter then pop in the letter name and doc name

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 11/01/2007 By: Ken.Guo
//$<reason> For Web Performance, Setitem slowly,so use dataobject 'd_ai_print_all_letters_web'
//Notice!!! if you modify below script, you must do same modification in 'd_ai_print_all_letters_web' 
If AppeonGetClientType() = 'WEB' Then 
	This.Sort()
	Return 
End If
//---------------------------- APPEON END ----------------------------

FOR i = 1 TO rowcount
	IF Upper(This.GetItemString( i, "letter_name" )) = "EXPIRING BASIC INFORMATION" THEN
		ls_ref = dw_letters.getitemstring(i,"verif_info_reference_value")
		This.SetItem( i, "letter_name", ls_ref )
		//messagebox("","test")
		This.SetItem( i, "letter_alias", ls_ref )
		If ls_ref = "Expiring Appointment Letter" then
			This.SetItem( i, "letter_name", "expiring_appointment" )

			//--------------------------- APPEON BEGIN ---------------------------
			//$<modify> 07.06.2006 By: Rodger Wu
			//$<reason> Letter path will be assigned to doc_name in buttonclicked event.
			
			/* This.SetItem( i, "doc_name", This.GetItemString( i, "facility_letter_path") + This.GetItemString( i,"reapp_doc_name" )) */
			
			This.SetItem( i, "doc_name", This.GetItemString( i,"reapp_doc_name" ))
			cbx_app_printer.visible = true
			//---------------------------- APPEON END ----------------------------
		elseIf ls_ref = "Expiring Allied Health Letter" then
			This.SetItem( i, "letter_name", "expiring_allied_health" )
			
			//--------------------------- APPEON BEGIN ---------------------------
			//$<modify> 07.06.2006 By: Rodger Wu
			//$<reason> Letter path will be assigned to doc_name in buttonclicked event.
			
			/* This.SetItem( i, "doc_name", This.GetItemString( i, "facility_letter_path") + This.GetItemString( i,"reappah_doc_name" )) */
			This.SetItem( i, "doc_name", This.GetItemString( i,"reappah_doc_name" ))
			cbx_app_printer.visible = true
			//---------------------------- APPEON END ----------------------------
		elseIf ls_ref = "Expiring Provisional Letter" then
			This.SetItem( i, "letter_name", "expiring_provisional" )
			
			//--------------------------- APPEON BEGIN ---------------------------
			//$<modify> 07.06.2006 By: Rodger Wu
			//$<reason> Letter path will be assigned to doc_name in buttonclicked event.
			/* This.SetItem( i, "doc_name", This.GetItemString( i, "facility_letter_path") + This.GetItemString( i,"prov_doc_name" )) */
			This.SetItem( i, "doc_name", This.GetItemString( i,"prov_doc_name" ))
			cbx_app_printer.visible = true //Start Code Change ---- 11.01.2006 #1 maha
			//---------------------------- APPEON END ----------------------------
		end if
	elseif dw_letters.getitemstring(i,"letter_name") = "Basic Information" then  //\/maha 081601 correspondence letters
		ls_ref = dw_letters.getitemstring(i,"verif_info_reference_value")
		if len(ls_ref) < 1 then
			ls_ref = "No reference value"
			This.SetItem( i, "letter_alias", ls_ref )
		else
			select document_name into :ls_lett from sys_letters where letter_name = :ls_ref;
			//This.SetItem( i, "letter_alias", ls_ref ) //maha app102505
			//This.SetItem( i, "letter_name", ls_ref ) //Start Code Change ---- 05.17.2006 #454 maha removed
			This.SetItem( i, "letter_alias", ls_ref )
			//--------------------------- APPEON BEGIN ---------------------------
			//$<modify> 07.06.2006 By: Rodger Wu
			//$<reason> Letter path will be assigned to doc_name in buttonclicked event.
			
			/* This.SetItem( i, "doc_name", This.GetItemString( i, "facility_letter_path") + ls_lett )//\maha */
			
			This.SetItem( i, "doc_name", ls_lett )
			//---------------------------- APPEON END ----------------------------
			This.SetItem( i, "letter_style", "P" )
		end if
	END IF
END FOR

//Start Code Change ---- 09.26.2007 #V7 maha
this.sort() //after modifying - resort

end event

type uo_print_app from pfc_cst_u_create_app2 within w_ai_print_letters_033108
boolean visible = false
integer x = 69
integer y = 56
integer width = 3008
integer height = 1356
integer taborder = 30
long backcolor = 80269524
borderstyle borderstyle = stylelowered!
end type

on uo_print_app.destroy
call pfc_cst_u_create_app2::destroy
end on

type gb_corro from groupbox within w_ai_print_letters_033108
boolean visible = false
integer x = 37
integer y = 736
integer width = 3077
integer height = 712
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Correspondence"
end type

type dw_corro from u_dw within w_ai_print_letters_033108
boolean visible = false
integer x = 69
integer y = 796
integer width = 3008
integer height = 620
integer taborder = 30
boolean bringtotop = true
string dataobject = "d_ai_print_corro"
boolean hscrollbar = true
end type

event buttonclicked;//--------------------------- APPEON BEGIN ---------------------------
//$<add> 11.23.2006 By: Jervis
//$<reason> print Correspondence letters
long ll_letter_id
long ll_rec_id[],ll_prac_id[],ll_facility_id[],ll_seq_no[],ll_app_id[]
n_cst_print_letter   lnv_print_letter

if row > 0 and this.GetItemNumber(row,"print_status") = 0 then
	ll_letter_id = this.GetItemNumber(row,"letter_id")
	ll_rec_id[1] = this.GetItemNumber(row,"rec_id")
	ll_prac_id[1] = this.GetItemNumber(row,"prac_id")
	ll_facility_id[1] = this.GetItemNumber(row,"facility_id")
	ll_seq_no[1] = this.GetItemNumber(row,"seq_no")
else
	MessageBox("Message","The letter has been printed!")
	return
end if

if lnv_print_letter.of_print_letter(ll_letter_id,ll_rec_id,ll_prac_id,ll_facility_id,ll_seq_no,ll_app_id) = 1 then
	this.SetItem(row,"print_status",1)
	//refresh data
	idw_verif_data.event pfc_retrieve()
end if
//---------------------------- APPEON END ----------------------------

end event

event constructor;This.of_SetUpdateAble( False )
This.of_SetTransObject( SQLCA )

end event

type gb_letters from groupbox within w_ai_print_letters_033108
integer x = 37
integer width = 3077
integer height = 1448
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Verification Letters "
end type


Start of PowerBuilder Binary Data Section : Do NOT Edit
03w_ai_print_letters_033108.bin 
2B00000600e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe00000006000000000000000000000001000000010000000000001000fffffffe00000000fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdfffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000fffffffe00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
13w_ai_print_letters_033108.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
