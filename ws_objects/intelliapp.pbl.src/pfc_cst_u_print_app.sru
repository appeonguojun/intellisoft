$PBExportHeader$pfc_cst_u_print_app.sru
forward
global type pfc_cst_u_print_app from pfc_cst_u_create_app2
end type
type tab_1 from tab within pfc_cst_u_print_app
end type
type tabpage_pl from userobject within tab_1
end type
type cb_add from commandbutton within tabpage_pl
end type
type cb_4 from commandbutton within tabpage_pl
end type
type cb_9 from commandbutton within tabpage_pl
end type
type cb_10 from commandbutton within tabpage_pl
end type
type cb_batch_search from commandbutton within tabpage_pl
end type
type dw_print from u_dw within tabpage_pl
end type
type tabpage_pl from userobject within tab_1
cb_add cb_add
cb_4 cb_4
cb_9 cb_9
cb_10 cb_10
cb_batch_search cb_batch_search
dw_print dw_print
end type
type tabpage_sd from userobject within tab_1
end type
type dw_image_defaults from u_dw within tabpage_sd
end type
type st_5 from statictext within tabpage_sd
end type
type st_4 from statictext within tabpage_sd
end type
type st_3 from statictext within tabpage_sd
end type
type rb_no_print from radiobutton within tabpage_sd
end type
type rb_selected_image from radiobutton within tabpage_sd
end type
type rb_app_default from radiobutton within tabpage_sd
end type
type dw_image_list from u_dw within tabpage_sd
end type
type cb_11 from commandbutton within tabpage_sd
end type
type ole_sd from olecustomcontrol within tabpage_sd
end type
type dw_sd from u_dw within tabpage_sd
end type
type cb_15 from commandbutton within tabpage_sd
end type
type gb_1 from groupbox within tabpage_sd
end type
type tabpage_sd from userobject within tab_1
dw_image_defaults dw_image_defaults
st_5 st_5
st_4 st_4
st_3 st_3
rb_no_print rb_no_print
rb_selected_image rb_selected_image
rb_app_default rb_app_default
dw_image_list dw_image_list
cb_11 cb_11
ole_sd ole_sd
dw_sd dw_sd
cb_15 cb_15
gb_1 gb_1
end type
type tabpage_net_dev from userobject within tab_1
end type
type dw_ai_copy from u_dw within tabpage_net_dev
end type
type dw_net_dev1 from u_dw within tabpage_net_dev
end type
type cb_7 from commandbutton within tabpage_net_dev
end type
type cb_8 from commandbutton within tabpage_net_dev
end type
type cb_12 from commandbutton within tabpage_net_dev
end type
type tabpage_net_dev from userobject within tab_1
dw_ai_copy dw_ai_copy
dw_net_dev1 dw_net_dev1
cb_7 cb_7
cb_8 cb_8
cb_12 cb_12
end type
type tabpage_gen from userobject within tab_1
end type
type cbx_use_def_printer from checkbox within tabpage_gen
end type
type cb_5 from commandbutton within tabpage_gen
end type
type cb_6 from commandbutton within tabpage_gen
end type
type cbx_exceptions from checkbox within tabpage_gen
end type
type cb_13 from commandbutton within tabpage_gen
end type
type cb_14 from commandbutton within tabpage_gen
end type
type st_app from statictext within tabpage_gen
end type
type cb_16 from commandbutton within tabpage_gen
end type
type tabpage_gen from userobject within tab_1
cbx_use_def_printer cbx_use_def_printer
cb_5 cb_5
cb_6 cb_6
cbx_exceptions cbx_exceptions
cb_13 cb_13
cb_14 cb_14
st_app st_app
cb_16 cb_16
end type
type tab_1 from tab within pfc_cst_u_print_app
tabpage_pl tabpage_pl
tabpage_sd tabpage_sd
tabpage_net_dev tabpage_net_dev
tabpage_gen tabpage_gen
end type
end forward

global type pfc_cst_u_print_app from pfc_cst_u_create_app2
integer width = 3534
integer height = 2028
tab_1 tab_1
end type
global pfc_cst_u_print_app pfc_cst_u_print_app

type variables
Boolean ib_connected = False
Boolean ib_open_from_prac_folder = False

integer ii_batch_button
boolean ib_no_dialog
integer ii_open_from_dash = -1
long	  ii_due_days[]

long ii_rec_id			//Added by Scofield on 2008-07-09

end variables

forward prototypes
public function integer of_from_prac_folder (long al_prac_id)
public function integer of_print (integer ai_from_page, integer ai_to_page, integer ai_copies, integer ai_print_exceptions)
private subroutine of_clean_up (integer ai_image_storage_type)
protected function integer of_print_email_app (string ai_print_or_email)
public function integer of_action_item_create (long al_prac, integer al_facility, long al_app)
public function integer of_copy_ai_values (integer ai_row)
public subroutine of_saveimage ()
public subroutine of_set_default_image_types ()
end prototypes

public function integer of_from_prac_folder (long al_prac_id);
Long ll_rec_id
Long ll_action_type
Long ll_action_status
Integer li_facility_id
Integer li_app_id
Integer li_cnt
Integer i
Integer li_nr
String ls_full_name
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-01
//$<add> 03.31.2006 By: Cao YongWang
//$<reason> Performance tuning.
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

gnv_appeondb.of_startqueue()
//---------------------------- APPEON END ----------------------------

SELECT v_full_name.full_name  
INTO :ls_full_name  
FROM v_full_name  
WHERE v_full_name.prac_id = :al_prac_id   ;
IF SQLCA.SQLCODE = -1 THEN
	MessageBox("Database Error", SQLCA.SQLCODE )
	RETURN -1
END IF

SELECT lookup_code INTO :ll_action_type FROM code_lookup WHERE lookup_name = 'Action Type' AND code = 'App Out To MD';		
IF SQLCA.SQLCODE = 100 THEN
	MessageBox("Error", "You need to add 'App Out To MD' to the Action Type lookup table." )
	Return -1
END IF

SELECT lookup_code INTO :ll_action_status FROM code_lookup WHERE lookup_name = 'Action Status' AND code = 'Incomplete';
IF SQLCA.SQLCODE = 100 THEN
		MessageBox("Error", "You will need to add 'Incomplete' to the Action Status lookup table." )
		Return -1
END IF

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-02
//$<add> 03.31.2006 By: Cao YongWang
//$<reason> Performance tuning.
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.
gnv_appeondb.of_commitqueue()
//---------------------------- APPEON END ----------------------------

DECLARE lc_apps_to_print CURSOR FOR  	 
SELECT net_dev_action_items.rec_id,   
       net_dev_action_items.facility_id,   
       net_dev_action_items.app_id  
FROM net_dev_action_items  
WHERE ( net_dev_action_items.prac_id = :al_prac_id ) AND  
      ( net_dev_action_items.action_type = :ll_action_type ) AND  
      ( net_dev_action_items.action_status = :ll_action_status )   ;

OPEN lc_apps_to_print;

IF SQLCA.SQLCODE = -1 THEN
	MessageBox("Database Error", SQLCA.SQLCODE )
	RETURN -1
END IF	

FETCH lc_apps_to_print INTO :ll_rec_id, :li_facility_id, :li_app_id  ;

DO WHILE SQLCA.SQLCODE = 0
	
	li_nr = tab_1.tabpage_pl.dw_print.InsertRow( 0 )
	tab_1.tabpage_pl.dw_print.SetItem( li_nr, "rec_id", ll_rec_id )		//Added by Scofield on 2008-07-09
	tab_1.tabpage_pl.dw_print.SetItem( li_nr, "prac_name", ls_full_name )
	tab_1.tabpage_pl.dw_print.SetItem( li_nr, "prac_id", al_prac_id )
	tab_1.tabpage_pl.dw_print.SetItem( li_nr, "facility_id", li_facility_id )
	tab_1.tabpage_pl.dw_print.SetItem( li_nr, "app_id", li_app_id )

	FETCH lc_apps_to_print INTO :ll_rec_id, :li_facility_id, :li_app_id  ;	
	
LOOP

CLOSE lc_apps_to_print;

tab_1.tabpage_pl.dw_print.SetRow( li_nr )
tab_1.tabpage_pl.dw_print.ScrollToRow( li_nr )

tab_1.tabpage_pl.dw_print.SetFocus()


Return 0
end function

public function integer of_print (integer ai_from_page, integer ai_to_page, integer ai_copies, integer ai_print_exceptions);/******************************************************************************************************************
**  [PUBLIC]   : OF_PRINT( /*integer ai_from_page*/, /*integer ai_to_page*/, /*integer ai_copies*/, /*integer ai_print_exceptions */)
**==================================================================================================================
**  Purpose   	: PRINT THE IMAGE USING THE ocx PRINT DIALOG
**==================================================================================================================
**  Arguments 	: [integer] ai_from_page
**  Arguments 	: [integer] ai_to_page
**  Arguments 	: [integer] ai_copies
**  Arguments 	: [integer] ai_print_exceptions
**==================================================================================================================
**  Returns   	: [none]   
**==================================================================================================================
**  Notes     	: 	   
**==================================================================================================================
**  Created By	: ??
**==================================================================================================================
**  Modification Log
**   Changed By             Change Date                                               Reason
** ------------------------------------------------------------------------------------------------------------------
** Michael B. Skinner    28  December 2005                                    Changed printing to use 
**																										inv_image_functions.of_print function      
********************************************************************************************************************/


Integer i
Integer li_retval

ole_edit.Object.Page(1)
ole_edit.Object.Display()

IF ai_to_page = 99 or ai_to_page > ole_edit.Object.PageCount() THEN 
	ai_to_page = ole_edit.Object.PageCount()
END IF

FOR i = 1 TO ai_copies
	try
		  if ib_no_dialog then
			   ole_edit.object.PrintImage()
		   else 
		   	ole_admin.object.image = ole_edit.object.image
         		inv_image_functions.of_print( ole_admin, ole_edit, Handle(this), '',ai_from_page, ai_to_page)
			//Start Code Change ---- 05.09.2007 #V7 maha  added so that when printing a batch of apps, you don't get the print dialog box for every one
			ib_no_dialog = true
			tab_1.tabpage_gen.cbx_use_def_printer.checked = true
			//End Code Change---05.09.2007
	     end if 
   catch (runtimeerror e)
		
   end try
NEXT

IF ai_print_exceptions = 1 THEN
	dw_exceptions.Print()
END IF

Return 0
end function

private subroutine of_clean_up (integer ai_image_storage_type);//////////////////////////////////////////////////////////////////////
// $<function>pfc_cst_u_print_app.of_clean_up()
// $<arguments> value	integer	ai_image_storage_type
// $<returns> (none)
// $<description>For replace the goto clean_up statement
//////////////////////////////////////////////////////////////////////
// $<add> 01.13.2006 by Wang Chao
//////////////////////////////////////////////////////////////////////

IF ai_image_storage_type = 1 AND IsValid( pfc_cst_nv_image_functions ) THEN
	Destroy pfc_cst_nv_image_functions
END IF

gi_burn_annos	= 0
tab_1.tabpage_sd.dw_image_list.SetFilter( "" )
tab_1.tabpage_sd.dw_image_list.Filter()

tab_1.tabpage_net_dev.dw_net_dev1.Event Constructor()

COMMIT USING SQLCA;

tab_1.tabpage_pl.dw_print.Reset()
tab_1.tabpage_sd.dw_sd.Reset()
tab_1.tabpage_sd.dw_image_list.Retrieve()

//ole_edit.SetRedraw( True )

tab_1.tabpage_gen.st_app.Text = "Complete"

IF ib_open_from_prac_folder THEN
	IF IsValid( w_prac_data_1 ) THEN
		w_prac_data_1.Event pfc_cst_refresh_net_dev_ai()
	ELSEIF IsValid( w_prac_data_intelliapp ) THEN
		w_prac_data_intelliapp.Event pfc_cst_refresh_net_dev_ai()
	END IF
END IF

gi_burn_annos	= 0


end subroutine

protected function integer of_print_email_app (string ai_print_or_email);Integer li_screen_id
Long li_seq_no
Integer li_pagecount
Integer li_num_days_app_rcvd_prac
Integer li_image_storage_type
Integer f
Integer li_cnt
Integer li_app_rcvd_prac_cnt
Long ll_incompleted_action_status
Long ll_pending_action_status
Long ll_rec_id 
Long ll_next_id
Long	ll_action_type
Long	ll_action_status
Long	ll_action_dept
long ll_getaction //maha 06.1807
DateTime ldt_today
DateTime	ldt_action_dt
DateTime	ldt_next_action_dt
Date ld_due_date
String ls_num_days_app_rcvd_prac
String ls_facility_name[]
String ls_attachments[]
String ls_cover_page
String ls_cover_message
String ls_subject
String ls_fax[]
String ls_app_type
String ls_emp_mail_login
String ls_action_notes
String ls_image_path
String	ls_action_user
String ls_app_image_name
String ls_name
String ls_app_nm
String ls_email_address
String ls_notetext
string ls_appnd_files[] //maha 06.18.07
string ls_Attach
Integer li_app_rcvd_prac
Integer li_num_pages
Integer li_start_page
Integer li_to_page
Integer li_image_type_count
Integer li_prac_image_cnt
 Integer m
Integer z
Integer li_image_type_id
Integer li_image_count
Integer li_image_cnt //maha 021904
Integer li_nd_row_cnt
Integer a
Integer li_rc
Integer i
Integer li_from_page
Integer li_print_exceptions
Integer li_found
integer fc //maha 06.18.07
integer fcn //maha 06.18.07
integer li_email_choice//Start Code Change ----10.06.2008 #V85 maha
String ls_errtext,ls_Rtn
// mskinner  23 March 2006 - begin
boolean ib_skip_code /* skip the rest of the code*/
// mskinner  23 March 2006 - end
DataWindowChild dwchild
gs_pass_ids  lg_pass_ids

long ll_StAppImgInDB			//Added by Scofield on 2008-07-09

ldt_today = DateTime( Today(), Now( ))

tab_1.tabpage_pl.dw_print.AcceptText()
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-03
//$<modify> 03.31.2006 By: Cao YongWang
//$<reason> Performance tuning.
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance. 


/*
select lookup_code into :ll_pending_action_status from code_lookup where lookup_name = 'Action Status' and code = 'Pending';
IF SQLCA.SQLCODE = 100 THEN
	MessageBox("Error", "You will need to add an 'Complete' code to the Action Status lookup table." )
	GOTO CLEAN_UP
END IF

select lookup_code into :ll_incompleted_action_status from code_lookup where lookup_name = 'Action Status' and code = 'Incomplete';
IF SQLCA.SQLCODE = 100 THEN
	MessageBox("Error", "You will need to add an 'Complete' code to the Action Status lookup table." )

	GOTO CLEAN_UP

END IF
*/
gnv_appeondb.of_startqueue( )

select lookup_code into :ll_pending_action_status from code_lookup where lookup_name = 'Action Status' and code = 'Pending';
select lookup_code into :ll_incompleted_action_status from code_lookup where lookup_name = 'Action Status' and code = 'Incomplete';


datastore lds_facility,lds_pd_address
long ll_rowcount1,ll_rowcount2,ll_find
lds_facility = create datastore
lds_pd_address = create datastore
lds_facility.dataobject = 'd_g_facility'
lds_pd_address.dataobject = 'd_pd_address_pd_address_link'
lds_facility.settransobject(sqlca)
ll_rowcount1 = lds_facility.retrieve()
lds_pd_address.settransobject(sqlca)
ll_rowcount2 = lds_pd_address.retrieve()

datastore lds_pd_affil_stat,lds_net_dev_action_items
long ll_rowcount3,ll_rowcount4,ll_action_status1
lds_pd_affil_stat = create datastore
lds_net_dev_action_items = create datastore
lds_pd_affil_stat.dataobject = 'd_pd_affil_stat'
lds_net_dev_action_items.dataobject = 'd_net_dev_action_items_count'
tab_1.tabpage_sd.dw_sd.dataobject = 'd_pd_image_list_all'
lds_pd_affil_stat.settransobject(sqlca)
ll_rowcount3 = lds_pd_affil_stat.retrieve()
lds_net_dev_action_items.settransobject(sqlca)
ll_rowcount4 = lds_net_dev_action_items.retrieve()
tab_1.tabpage_sd.dw_sd.settransobject(sqlca)
tab_1.tabpage_sd.dw_sd.retrieve()

select custom_3 into :ls_num_days_app_rcvd_prac from code_lookup where lookup_name = 'Action Type' and code = 'App Rcvd Prac';

select lookup_code into :ll_action_type from code_lookup where lookup_name = 'Action Type' and code = 'App Out To MD';

select lookup_code into :ll_action_status1 from code_lookup where lookup_name = 'Action Status' and code = 'Complete';

gnv_appeondb.of_commitqueue( )

IF isnull(ll_pending_action_status) or ll_pending_action_status = 0 THEN
	MessageBox("Error", "You will need to add a 'Pending' code to the Action Status lookup table." )//Start Code Change ---- 12.18.2006 #V7 maha corrected message
	of_clean_up(li_image_storage_type)
	Return 1
END IF
IF isnull(ll_incompleted_action_status) or ll_incompleted_action_status = 0 THEN
	MessageBox("Error", "You will need to add an 'Incomplete' code to the Action Status lookup table." )//Start Code Change ---- 12.18.2006 #V7 maha corrected message
	of_clean_up(li_image_storage_type)
	Return 1
END IF

//IF isnull(ls_num_days_app_rcvd_prac) or ls_num_days_app_rcvd_prac = '' THEN   //Start Code Change ---- 04.12.2007 #V7 maha removed redundant and bad message
//	MessageBox("Lookup missing", "You will need to add a 'App Rcvd Prac' code to the Action Type lookup table." )
//END IF
IF isnull(ll_action_type) or ll_action_type = 0 THEN
	MessageBox("Error", "You will need to add an 'App Out To MD' code to the Action Type lookup table." )
	of_clean_up(li_image_storage_type)
	Return 1
END IF
IF isnull(ll_action_status1) or ll_action_status1 = 0 THEN
	MessageBox("Error", "You will need to add an 'Complete' code to the Action Status lookup table." )
	of_clean_up(li_image_storage_type)
	Return 1
END IF


IF Len( ls_num_days_app_rcvd_prac ) = 0 OR IsNull( ls_num_days_app_rcvd_prac ) THEN
	MessageBox("Next Due Date", "The NEXT due date field will be set to 30 days from today for follow up.  To set a default (and remove this message), go to your Action Type lookup table (Lookup Painter)and change the Follow Up Days field to the number of days that you want to wait until your next follow up.")
	li_num_days_app_rcvd_prac = 30
ELSE
	li_num_days_app_rcvd_prac = Integer( ls_num_days_app_rcvd_prac )
END IF

//Start Code Change ---- 06.18.2007 #V7 maha  getting due days for each action
for i = 1 to tab_1.tabpage_net_dev.dw_net_dev1.rowcount()  //get array of action_items
	ll_getaction = tab_1.tabpage_net_dev.dw_net_dev1.getitemnumber(i,"action_type")
	ii_due_days[ i ] = long(gnv_data.of_getitem("code_lookup" , "custom_3","lookup_code = " + string(ll_getaction)))
	if ii_due_days[ i ] = 0 then ii_due_days[ i ] = 30
	//messagebox("",string(ii_due_days[ i ]))
next
//End Code Change---06.18.2007

ll_rowcount1 = lds_facility.rowcount()
ll_rowcount2 = lds_pd_address.rowcount()
ll_rowcount3 = lds_pd_affil_stat.rowcount()
ll_rowcount4 = lds_net_dev_action_items.rowcount()
//---------------------------- APPEON END ----------------------------



li_rc = tab_1.tabpage_pl.dw_print.RowCount()
IF ai_print_or_email = "E" THEN
	li_email_choice = of_get_app_setting("set_56","I")//Start Code Change ----10.06.2008 #V85 maha
	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> PT-04
	//$<modify> 02.08.2006 By: Liang QingShi
	//$<reason> Performance tuning 
	//$<modification> Write script to retrieve data from a cache instead of from the database.
	/*
	 SELECT email_id INTO :ls_emp_mail_login FROM security_users WHERE user_id = :gs_user_id;	
	*/
	ls_emp_mail_login= gnv_data.of_getitem("security_users","email_id","upper(user_id) = " + "'" + upper(gs_user_id) + "'")
	//---------------------------- APPEON END ----------------------------

	IF ls_emp_mail_login = "" OR IsNull( ls_emp_mail_login ) THEN
		MessageBox("", "You must setup an email login in the Security User Painter for user: " + gs_user_id )
		gi_burn_annos	= 0
		Return -1
	END IF

	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> PT-05
	//$<modify> 02.08.2006 By: Liang QingShi
	//$<reason> Performance tuning 
	//$<modification> Write script to retrieve data from a cache instead of from the database.	
	
	/*
		FOR i = 1 TO li_rc
			IF tab_1.tabpage_pl.dw_print.GetItemNumber( i, "selected" )	= 0 THEN
				CONTINUE
			END IF		
			st_name.Text = tab_1.tabpage_pl.dw_print.GetItemString( i, "prac_name" )	
			ii_prac_id = tab_1.tabpage_pl.dw_print.GetItemNumber( i, "prac_id" )
			ii_facility_id  = tab_1.tabpage_pl.dw_print.GetItemNumber( i, "facility_id" ) 		
	
			SELECT facility_name
			INTO :ls_facility_name[i]
			FROM facility
			WHERE facility_id = :ii_facility_id;
			IF SQLCA.SQLCODE = -1 THEN
				MessageBox("Database Error", SQLCA.SQLERRTEXT )
				GOTO CLEAN_UP
			END IF
					
			SELECT pd_address.e_mail_address  
	     	INTO :ls_email_address  
		   FROM pd_address,   
	     	     pd_address_link  
		   WHERE ( pd_address.rec_id = pd_address_link.address_id ) and  
	     	      ( ( pd_address_link.mailing = 1 ) AND  
		         ( pd_address_link.prac_id = :ii_prac_id ) AND
				   ( pd_address_link.facility_id = :ii_facility_id) )  ;
			IF SQLCA.SQLCODE = -1 THEN
				MessageBox("Database Error", SQLCA.SQLERRTEXT )
				GOTO CLEAN_UP
			ELSEIF SQLCA.SQLCODE = 100 THEN
				MessageBox( "No Mailing Address", "To send an EMAIL to " + st_name.Text + " there must be a MAILING address entered in the address screen of the Practitioner Folder for the " + ls_facility_name[i] + " Facility." )
				gi_burn_annos	= 0
				Return -1
			ELSEIF ls_email_address = "" OR IsNull( ls_email_address ) THEN
				MessageBox( "No Email Address", "To send an EMAIL to " + st_name.Text + " there must be an EMAIL address entered in the office address record that is marked as a MAILING address for the " + ls_facility_name[i] + " facility." )						
				Return -1
			END IF	
		END FOR
   */
	FOR i = 1 TO li_rc
		IF tab_1.tabpage_pl.dw_print.GetItemNumber( i, "selected" )	= 0 THEN
			CONTINUE
		END IF		
		st_name.Text = tab_1.tabpage_pl.dw_print.GetItemString( i, "prac_name" )	
		ii_prac_id = tab_1.tabpage_pl.dw_print.GetItemNumber( i, "prac_id" )
		ii_facility_id  = tab_1.tabpage_pl.dw_print.GetItemNumber( i, "facility_id" ) 
		
		ll_find = lds_facility.find("facility_id = " + string(ii_facility_id),1,ll_rowcount1)
		if ll_find > 0 then
			ls_facility_name[i] = lds_facility.getitemstring(ll_find,'facility_name')
		else
			MessageBox("Database Error", 'No Find facility name' )
			of_clean_up(li_image_storage_type)
			Return 1
		END IF
		
		ll_find = lds_pd_address.find("pd_address_link_prac_id = " + string(ii_prac_id) + " and pd_address_link_facility_id = " + string(ii_facility_id),1,ll_rowcount2)
		if ll_find > 0 then
			ls_email_address = lds_pd_address.getitemstring(ll_find,'pd_address_e_mail_address')
			IF ls_email_address = "" OR IsNull( ls_email_address ) THEN
				MessageBox( "No Email Address", "To send an EMAIL to " + st_name.Text + " there must be an EMAIL address entered in the office address record that is marked as a MAILING address for the " + ls_facility_name[i] + " facility." )						
				Return -1
			END IF
		else
			MessageBox( "No Mailing Address", "To send an EMAIL to " + st_name.Text + " there must be a MAILING address entered in the address screen of the Practitioner Folder for the " + ls_facility_name[i] + " Facility." )
			gi_burn_annos	= 0
			Return -1
		END IF	
	END FOR

	//---------------------------- APPEON END ----------------------------
	
	OpenWithParm( w_fax_win, "Apps" + "-" + "Email")
	IF Message.StringParm = "Cancel" THEN
		gi_burn_annos	= 0		
		Return -1
	END IF
	lg_pass_ids = Message.PowerObjectParm

	//is_cover_page = lg_pass_ids.s_fax_cover
	ls_notetext = lg_pass_ids.s_fax_message 
	ls_subject = lg_pass_ids.s_fax_subject		
	
	//Open( w_email_subject )
	//IF Message.StringParm = "Cancel" THEN
	//	gi_burn_annos	= 0
	//	Return -1
	//END IF
	//ls_subject = Mid( Message.StringParm, 1, POS( Message.StringParm, "*" ) -1)
	//ls_notetext = Mid( Message.StringParm, POS( Message.StringParm, "*" ) +1, 4000)	
ELSEIF ai_print_or_email = "F" THEN
	
	//delete any left over faxes
	FOR f = 1 TO 10000
		li_cnt = 0
		IF FileExists( gs_dir_path + gs_DefDirName + "\Fax\fax_" + String( f )+ ".doc" ) THEN
			li_cnt++
		   FileDelete( gs_dir_path + gs_DefDirName + "\Fax\fax_" + String( f )+ ".doc" )
		END IF
		IF FileExists( gs_dir_path + gs_DefDirName + "\Fax\fax_a_" + String( f )+ ".tif" ) THEN
			li_cnt++		
			FileDelete( gs_dir_path + gs_DefDirName + "\Fax\fax_a_" + String( f )+ ".tif" )			
		END IF
		IF FileExists( gs_dir_path + gs_DefDirName + "\Fax\app_" + String( f )+ ".tif" ) THEN
			li_cnt++		
			FileDelete( gs_dir_path + gs_DefDirName + "\Fax\app_" + String( f )+ ".tif" )			
		END IF
		IF FileExists( gs_dir_path + gs_DefDirName + "\Fax\image_" + String( f )+ ".tif" ) THEN		
			li_cnt++		
			FileDelete( gs_dir_path + gs_DefDirName + "\Fax\image_" + String( f )+ ".tif" )					
		END IF
		IF li_cnt = 0 THEN
			Exit
		END IF
	END FOR

	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> PT-06
	//$<modify> 02.08.2006 By: Liang QingShi
	//$<reason> Performance tuning 
	//$<modification> Write script to retrieve data from a cache instead of from the database.
 	/*
		FOR i = 1 TO li_rc
			IF tab_1.tabpage_pl.dw_print.GetItemNumber( i, "selected" )	= 0 THEN
				CONTINUE
			END IF		
			st_name.Text = tab_1.tabpage_pl.dw_print.GetItemString( i, "prac_name" )	
			ii_prac_id = tab_1.tabpage_pl.dw_print.GetItemNumber( i, "prac_id" )
			ii_facility_id  = tab_1.tabpage_pl.dw_print.GetItemNumber( i, "facility_id" ) 		
			SELECT facility_name
			INTO :ls_facility_name[i]
			FROM facility
			WHERE facility_id = :ii_facility_id;
			IF SQLCA.SQLCODE = -1 THEN
				MessageBox("Database Error", SQLCA.SQLERRTEXT )
				GOTO CLEAN_UP
				of_clean_up(li_image_storage_type)
				Return 1
			END IF
			
			SELECT pd_address.fax
	     	INTO :ls_fax[i]
		   FROM pd_address,   
	     	     pd_address_link  
		   WHERE ( pd_address.rec_id = pd_address_link.address_id ) and  
	     	      ( ( pd_address_link.mailing = 1 ) AND  
		         ( pd_address_link.prac_id = :ii_prac_id ) AND
				   ( pd_address_link.facility_id = :ii_facility_id) )  ;
			IF SQLCA.SQLCODE = -1 THEN
				MessageBox("Database Error", SQLCA.SQLERRTEXT )
				GOTO CLEAN_UP
				of_clean_up(li_image_storage_type)
				Return 1
			ELSEIF SQLCA.SQLCODE = 100 THEN
				MessageBox( "No Mailing Address", "To send a FAX to " + st_name.Text + " there must be a MAILING address entered in the address screen of the Practitioner Folder for the " + ls_facility_name[i] + " Facility." )
				gi_burn_annos	= 0
				Return -1
			ELSEIF IsNull( ls_fax[i] ) OR ls_fax[i] = ""  THEN
				MessageBox( "No Fax Number", "To send a FAX to " + st_name.Text + " there must be a FAX number entered in the office address record that is marked as a MAILING address for the " + ls_facility_name[i] + " facility." )			
				Return -1
			END IF	
		END FOR
	*/
	FOR i = 1 TO li_rc
		IF tab_1.tabpage_pl.dw_print.GetItemNumber( i, "selected" )	= 0 THEN
			CONTINUE
		END IF		
		st_name.Text = tab_1.tabpage_pl.dw_print.GetItemString( i, "prac_name" )	
		ii_prac_id = tab_1.tabpage_pl.dw_print.GetItemNumber( i, "prac_id" )
		ii_facility_id  = tab_1.tabpage_pl.dw_print.GetItemNumber( i, "facility_id" ) 

		ll_find = lds_facility.find("facility_id = " + string(ii_facility_id),1,ll_rowcount1)
		if ll_find > 0 then
			ls_facility_name[i] = lds_facility.getitemstring(ll_find,'facility_name')
		else
			MessageBox("Database Error", 'No Find facility name' )
			of_clean_up(li_image_storage_type)
			Return 1
		END IF

		ll_find = lds_pd_address.find("pd_address_link_prac_id = " + string(ii_prac_id) + " and pd_address_link_facility_id = " + string(ii_facility_id),1,ll_rowcount2)
		if ll_find > 0 then
			ls_fax[i] = lds_pd_address.getitemstring(ll_find,'pd_address_fax')
			IF IsNull( ls_fax[i] ) OR ls_fax[i] = ""  THEN
				MessageBox( "No Fax Number", "To send a FAX to " + st_name.Text + " there must be a FAX number entered in the office address record that is marked as a MAILING address for the " + ls_facility_name[i] + " facility." )			
				Return -1
			END IF	
		else
			MessageBox( "No Mailing Address", "To send a FAX to " + st_name.Text + " there must be a MAILING address entered in the address screen of the Practitioner Folder for the " + ls_facility_name[i] + " Facility." )
			gi_burn_annos	= 0
			Return -1
		END IF	
	END FOR
	//---------------------------- APPEON END ----------------------------	
		
	pfc_cst_nv_fax nv_fax
	nv_fax = CREATE pfc_cst_nv_fax;

	OpenWithParm( w_fax_win, "Apps" )
	IF Message.StringParm = "Cancel" THEN
		Return -1
	END IF

	lg_pass_ids = Message.PowerObjectParm

	ls_cover_page = lg_pass_ids.s_fax_cover
	ls_cover_message = lg_pass_ids.s_fax_message 
	ls_subject = lg_pass_ids.s_fax_subject	
	
END IF

IF NOT ib_connected THEN
	of_connections( "IntelliCred", "0" )
END IF

//PrintSetup()

tab_1.tabpage_pl.dw_print.AcceptText()

IF tab_1.tabpage_gen.cbx_exceptions.Checked THEN
	li_print_exceptions = 1
ELSE
	li_print_exceptions = 0
END IF

tab_1.tabpage_sd.dw_image_list.SetFilter( "selected = 1" )
tab_1.tabpage_sd.dw_image_list.Filter()	
li_image_count = tab_1.tabpage_sd.dw_image_list.RowCount()


IF ai_print_or_email = "E" OR  ai_print_or_email = "F" THEN
	gi_burn_annos	= 1
END IF

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-07
//$<add> 02.08.2006 By: Liang QingShi
//$<reason> Performance optimization
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.
 

li_nd_row_cnt = tab_1.tabpage_net_dev.dw_net_dev1.RowCount()

gnv_appeondb.of_startqueue( )

SELECT record_id,print_id  INTO :ll_rec_id,:ll_next_id  FROM ids  ;
UPDATE ids SET print_id = print_id + :li_rc,record_id = record_id + :li_rc * :li_nd_row_cnt;

gnv_appeondb.of_commitqueue( )

IF IsNull( ll_next_id ) THEN
	ll_next_id = 0
END IF
//---------------------------- APPEON END ----------------------------


FOR i = 1 TO li_rc
	IF tab_1.tabpage_pl.dw_print.GetItemNumber( i, "selected" )	= 0 THEN //maha 042704
		tab_1.tabpage_pl.dw_print.setitemstatus(i,0,primary!,NotModified!)
	else
		li_app_rcvd_prac_cnt = 0
		tab_1.tabpage_gen.st_app.Text = "Generating application " + String( i ) + " of " + String( li_rc )
		//ole_edit.SetRedraw( True )
		ii_rec_id = tab_1.tabpage_pl.dw_print.GetItemNumber( i, "rec_id" )			//Added by Scofield on 2008-07-09
		st_name.Text = tab_1.tabpage_pl.dw_print.GetItemString( i, "prac_name" )	
		ii_prac_id = tab_1.tabpage_pl.dw_print.GetItemNumber( i, "prac_id" )
		ii_app_id  = tab_1.tabpage_pl.dw_print.GetItemNumber( i, "app_id" ) 
		ii_facility_id  = tab_1.tabpage_pl.dw_print.GetItemNumber( i, "facility_id" ) 
		tab_1.tabpage_pl.dw_print.GetChild( "app_id", dwchild )
		li_found = dwchild.Find( "app_hdr_app_id = " + String( ii_app_id ),1, dwchild.RowCount() )
		//maha 0909054 trap added for inactive apps
		if li_found < 1 then
			messagebox("App population error" + string(li_found),"Check to see that the selected application exists and is active.")

			return -1
		end if
		ls_app_nm = dwchild.GetItemString( li_found, "app_hdr_application_name" )
		li_nd_row_cnt = tab_1.tabpage_net_dev.dw_net_dev1.RowCount()
	
		//--------------------------- APPEON BEGIN ---------------------------
		//$<ID> PT-08
		//$<modify> 02.08.2006 By: Liang QingShi
		//$<reason> Performance tuning 
		//$<modification> Write script to retrieve data from a cache instead of from the database.

		/*
			//Get image paths and load up image doc
			SELECT ids.imaging_path , ids.intelliapp_app_path
			  INTO :ls_image_path,:gs_app_image_path  
			  FROM ids;
	
				IF SQLCA.SQLCODE = -1 THEN
					MessageBox("Database Error", SQLCA.SQLERRTEXT )
					GOTO CLEAN_UP
				END IF
		*/
		ls_image_path = gnv_data.of_getitem("ids","imaging_path",false)
		gs_app_image_path = gnv_data.of_getitem("ids","intelliapp_app_path",false)
		//---------------------------- APPEON END ----------------------------
	
		of_set_app_id( ii_app_id  )
		GarbageCollect ( )
		
	
		IF of_load_app( ) = -1 THEN
			//--------------------------- APPEON BEGIN ---------------------------
			//$<ID> UM-01
			//$<modify> 01.13.2006 By: Wang Chao
			//$<reason> The GOTO statement is currently unsupported.
			//$<modification> Encapsulate the script associated with the label into of_clean_up,
			//$<modification> and call the of_clean_up function to provide the same functionality.
			//GOTO CLEAN_UP
			of_clean_up(li_image_storage_type)
			Return 1
			//---------------------------- APPEON END ----------------------------	
		END IF
	
		st_page_num.Text = "Page 1 of " + String( ole_edit.Object.PageCount()	)
	
		IF li_nd_row_cnt > 0 THEN //maha 111401
			//Start Code Change ---- 06.18.2007 #V7 maha
			of_action_item_create( ii_prac_id, ii_facility_id, ii_app_id)
//			FOR a = 1 TO li_nd_row_cnt
//				ll_action_type = tab_1.tabpage_net_dev.dw_net_dev1.GetItemNumber( a, "action_type" )
//				ll_action_status = tab_1.tabpage_net_dev.dw_net_dev1.GetItemNumber( a, "action_status" )
//				ldt_action_dt = tab_1.tabpage_net_dev.dw_net_dev1.GetItemDateTime( a, "action_date" )
//				ldt_next_action_dt = tab_1.tabpage_net_dev.dw_net_dev1.GetItemDateTime( a, "next_action_date" )
//				ls_action_user = tab_1.tabpage_net_dev.dw_net_dev1.GetItemString( a, "action_user" )
//				ls_action_notes = tab_1.tabpage_net_dev.dw_net_dev1.GetItemString( a, "notes" ) 
//				IF Not IsNull( ls_action_notes ) THEN
//					ls_action_notes = ls_action_notes + ls_app_nm
//				ELSE
//					ls_action_notes = ls_app_nm
//				END IF
//				ll_action_dept = tab_1.tabpage_net_dev.dw_net_dev1.GetItemNumber( a, "action_dept" )		
//				
//				//--------------------------- APPEON BEGIN ---------------------------
//				//$<ID> PT-17
//				//$<modify> 02.21.2006 By: Rodger Wu
//				//$<reason> Performance tuning
//				//$<modification> Define a variable to 1)get the first ID; 2)Update the final ID
//				//$<modification> value into database.
//				//$<modification> Comment out the following script to reduce client-server interaction.
//				//$<modification> refer to of_get_id for more information.
//				/*ll_rec_id = gnv_app.of_Get_Id("RECORD_ID")	*/
//				IF ll_rec_id = 0 THEN
//					ll_rec_id = gnv_app.of_Get_Id("RECORD_ID", li_nd_row_cnt) - 1
//				END IF
//				ll_rec_id++
//				//---------------------------- APPEON END ----------------------------
//
//
//				//--------------------------- APPEON BEGIN ---------------------------
//				//$<ID> PT-09
//				//$<modify> 01.18.2006 By: Liang QingShi
//				//$<reason> Performance tuning 
//				//$<modification> Write script to retrieve data from a cache instead of from the database.
//
//				/*
//								SELECT pd_affil_stat.apptmnt_type  
//								INTO :ls_app_type  
//								FROM pd_affil_stat  
//								WHERE ( pd_affil_stat.prac_id = :ii_prac_id ) AND  
//									 ( pd_affil_stat.parent_facility_id = :ii_facility_id ) AND  
//									 ( pd_affil_stat.active_status in ( 1,4 ) )   ; //maha  changed to include pending 07240
//								IF SQLCA.SQLCODE = -1 THEN
//									MessageBox("Sql Error in of_print_email_app", SQLCA.SQLERRTEXT + "~r Check to see if there are multiple Active/Pending records for this practitioner and facility")
//									gi_burn_annos	= 0
//									Return -1
//								END IF
//					
//								li_app_rcvd_prac_cnt = 0
//								SELECT Count( prac_id )
//								INTO :li_app_rcvd_prac_cnt
//								FROM net_dev_action_items
//								WHERE prac_id = :ii_prac_id AND
//										facility_id = :ii_facility_id AND
//										action_type = :ll_action_type AND
//										action_status = :ll_pending_action_status AND
//										app_id = :ii_app_id AND
//										active_status = 1
//								USING SQLCA;
//								IF SQLCA.SQLCODE = -1 THEN
//									MessageBox("Database Error", SQLCA.SQLERRTEXT )
//									GOTO CLEAN_UP
//								END IF
//
//								// get the number of days ahead from today (date you printed app you want to set the due date for the app rcvd
//								select custom_3 into :ls_num_days_app_rcvd_prac from code_lookup where lookup_name = 'Action Type' and code = 'App Rcvd Prac';
//								IF SQLCA.SQLCODE = 100 THEN
//									MessageBox("Lookup missing", "You will need to add a 'App Rcvd Prac' code to the Action Type lookup table." )
//								END IF
//								IF Len( ls_num_days_app_rcvd_prac ) = 0 OR IsNull( ls_num_days_app_rcvd_prac ) THEN
//									MessageBox("Next Due Date", "The NEXT due date field will be set to 30 days from today for follow up.  To set a default (and remove this message), go to your Action Type lookup table (Lookup Painter)and change the Next Follow Up Days field to the number of days that you want to wait until your next follow up.")
//									li_num_days_app_rcvd_prac = 30
//								ELSE
//									li_num_days_app_rcvd_prac = Integer( ls_num_days_app_rcvd_prac )
//								END IF
//				*/
//				//Start Code Change ---- 04.12.2007 #V7 maha
//				string sss
//				sss = "prac_id = " + string(ii_prac_id) + " and parent_facility_id = " + string(ii_facility_id)
//				//messagebox("",sss)
//				ll_find = lds_pd_affil_stat.find(sss,1,ll_rowcount3)
//
//				if ll_find > 0 then
//					ls_app_type = lds_pd_affil_stat.getitemstring(ll_find,'apptmnt_type')
//				else
//					MessageBox("Sql Error in of_print_email_app",  " This practitioner and facility not found:" + sss)
//					gi_burn_annos	= 0
//					//gnv_appeondb.of_commitqueue( )
//					//Return -1
//					continue
//				END IF
//				//End Code Change---04.12.2007
//				li_app_rcvd_prac_cnt = 0
//
//				lds_net_dev_action_items.setfilter("prac_id = " + string(ii_prac_id) + " and facility_id = " + string(ii_facility_id) + " and action_type = " + string(ll_action_type) + " and action_status = " + string(ll_pending_action_status) + " and app_id = " + string(ii_app_id))
//				lds_net_dev_action_items.filter()
//				li_app_rcvd_prac_cnt = lds_net_dev_action_items.rowcount()
//			
//			//---------------------------- APPEON END ----------------------------	
//		
//				
//				ld_due_date = RelativeDate( Today(), li_num_days_app_rcvd_prac )
//	
//				IF li_app_rcvd_prac_cnt = 1 THEN
//					UPDATE net_dev_action_items
//					SET action_date = :ldt_action_dt,
//						 action_status = :ll_incompleted_action_status,
//						 due_date = :ld_due_date
//					WHERE prac_id = :ii_prac_id AND
//						facility_id = :ii_facility_id AND
//						action_type = :ll_action_type AND
//						action_status = :ll_pending_action_status AND
//						app_id = :ii_app_id AND
//						active_status = 1
//					USING SQLCA;
//					IF SQLCA.SQLCODE = -1 THEN
//						MessageBox("Database Error", SQLCA.SQLERRTEXT )
//						//--------------------------- APPEON BEGIN ---------------------------
//						//$<ID> UM-02
//						//$<modify> 01.13.2006 By: Wang Chao
//						//$<reason> The GOTO statement is currently unsupported.
//						//$<modification> Encapsulate the script associated with the label into of_clean_up,
//						//$<modification> and call of_clean_up to provide the same functionality.
//						//GOTO CLEAN_UP
//						of_clean_up(li_image_storage_type)
//						Return 1
//						//---------------------------- APPEON END ----------------------------	
//					END IF
//				ELSEIF li_app_rcvd_prac_cnt = 0 THEN
//
//					INSERT INTO net_dev_action_items  
//					 ( rec_id,   
//						seq_no,
//						prac_id,   
//						action_type,   
//						action_date,   
//						action_dept,   
//						action_user,   
//						next_action_date,   
//						notes,   
//						action_status,   
//						facility_id,
//						active_status,
//						app_type,
//						app_id,
//						due_date)  
//				VALUES (:ll_rec_id,   
//						:ll_rec_id,
//						:ii_prac_id,   
//						:ll_action_type,   
//						null,   
//						:ll_action_dept,   
//						:ls_action_user,   
//						:ldt_next_action_dt,   
//						null,   
//						:ll_action_status,   
//						:ii_facility_id,
//						1,
//						:ls_app_type,
//						:ii_app_id,
//						:ld_due_date)
//					USING SQLCA;
//					IF SQLCA.SQLCODE = -1 THEN
//						MessageBox("Database Error", SQLCA.SQLERRTEXT )
//						//--------------------------- APPEON BEGIN ---------------------------
//						//$<ID> UM-03
//						//$<modify> 01.13.2006 By: Wang Chao
//						//$<reason> The GOTO statement is currently unsupported.
//						//$<modification> Encapsulate the script associated with the label into of_clean_up,
//						//$<modification> and call of_clean_up to provide the same functionality.
//						//GOTO CLEAN_UP
//						of_clean_up(li_image_storage_type)
//						//gnv_appeondb.of_commitqueue( )
//						Return 1
//						//---------------------------- APPEON END ----------------------------	
//					END IF	
//				END IF
//			END FOR
//End Code Change---06.18.2007
		END IF
		
		li_from_page = tab_1.tabpage_pl.dw_print.GetItemNumber( i, "from_page" )
		li_to_page = 99   //dw_print.GetItemNumber( i, "to_page" )
		
		//ole_edit.SetRedraw( False )
		
		//messagebox("", "mem check 1" )
			
		of_setup( ii_app_id, li_from_page  , li_to_page, ii_facility_id )
		
		//	ole_edit.Object.BurnInAnnotations( 0, 2 )		
		//	END IF
		//messagebox("", "mem check 2" )
	
		//--------------------------- APPEON BEGIN ---------------------------
		
		//$<comment> 02.08.2006 By: Liang QingShi
		//$<reason> Performance tuning
		/*
		SELECT ids.print_id  
		INTO :ll_next_id  
		FROM ids  ;
		IF IsNull( ll_next_id ) THEN
			ll_next_id = 0
		END IF
		*/
		//---------------------------- APPEON END ----------------------------
		
		ll_next_id++
		
		//--------------------------- APPEON BEGIN ---------------------------
		//$<comment> 02.08.2006 By: Liang QingShi
		//$<reason> Performance tuning
		/*
		UPDATE ids
		SET print_id = :ll_next_id;
		*/
		//---------------------------- APPEON END ----------------------------
		
		tab_1.tabpage_pl.dw_print.SetItem( i, "print_id", ll_next_id )
		tab_1.tabpage_pl.dw_print.SetItem( i, "from_page", 1 )
		tab_1.tabpage_pl.dw_print.SetItem( i, "to_page", 99 )
		
		//--------------------------- APPEON BEGIN ---------------------------
		//$<ID> PT-10
		//$<comment> 02.08.2006 By: Liang QingShi
		//$<reason> Performance tuning 
		//$<modification> Write script to retrieve data from a cache instead of from the database.
 
		/*
		select lookup_code into :ll_action_type from code_lookup where lookup_name = 'Action Type' and code = 'App Out To MD';
		IF SQLCA.SQLCODE = 100 THEN
			MessageBox("Error", "You will need to add an 'App Out To MD' code to the Action Type lookup table." )
			//GOTO CLEAN_UP
		END IF
		
		select lookup_code into :ll_action_status from code_lookup where lookup_name = 'Action Status' and code = 'Complete';
		IF SQLCA.SQLCODE = 100 THEN
			MessageBox("Error", "You will need to add an 'Complete' code to the Action Status lookup table." )
			//GOTO CLEAN_UP
		END IF
		*/
		ll_action_type=long(gnv_data.of_getitem("code_lookup" , "lookup_code","upper(lookup_name)='ACTION TYPE' and upper(code)='APP OUT TO MD'"))
		ll_action_status=long(gnv_data.of_getitem("code_lookup" , "lookup_code","upper(lookup_name)='ACTION STATUS' and upper(code)='COMPLETE'"))
		//---------------------------- APPEON END ----------------------------
		
		UPDATE net_dev_action_items  
		SET action_status = :ll_action_status,		
		    action_date = :ldt_today,
			 notes = 'Printed Application' //maha 032102 from -111
		WHERE ( net_dev_action_items.prac_id = :ii_prac_id ) AND  
				( net_dev_action_items.facility_id = :ii_facility_id ) AND
				( net_dev_action_items.action_type = :ll_action_type ) and 
				( net_dev_action_items.app_id = :ii_app_id) and //maha 010603
				( net_dev_action_items.active_status = 1);		//maha 010603
		IF SQLCA.SQLCODE = -1 THEN
			MessageBox("Database Error", SQLCA.SQLERRTEXT )
			//--------------------------- APPEON BEGIN ---------------------------
			//$<ID> UM-04
			//$<modify> 01.13.2006 By: Wang Chao
			//$<reason> The GOTO statement is currently unsupported.
			//$<modification> Encapsulate the script associated with the label into of_clean_up,
			//$<modification> and call of_clean_up to provide the same functionality.
			//GOTO CLEAN_UP
			of_clean_up(li_image_storage_type)
			
			Return 1
			//---------------------------- APPEON END ----------------------------	
		END IF
		
		//--------------------------- APPEON BEGIN ---------------------------
		//$<ID> PT-11
		//$<comment> 02.08.2006 By: Liang QingShi
		//$<reason> Performance tuning 
		//$<modification> Write script to retrieve data from a cache instead of from the database.
		/*
		li_prac_image_cnt = tab_1.tabpage_sd.dw_sd.Retrieve( ii_prac_id )
		*/
		/*
		tab_1.tabpage_sd.dw_sd.SetFilter( "pd_images_prac_id = " + String( ii_prac_id ) )
		tab_1.tabpage_sd.dw_sd.Filter( )
		li_prac_image_cnt = tab_1.tabpage_sd.dw_sd.RowCount( )
		*/
		
		//--------------------------- APPEON BEGIN ---------------------------
		//$< Add  > 2007-08-04 By: Scofield
		//$<Reason> Restore Print multi-practitioner at a time
		tab_1.tabpage_sd.dw_sd.SetFilter('')
		tab_1.tabpage_sd.dw_sd.Filter()
		//---------------------------- APPEON END ----------------------------
		li_prac_image_cnt = tab_1.tabpage_sd.dw_sd.Find( "pd_images_prac_id = " + String( ii_prac_id ) , 1, tab_1.tabpage_sd.dw_sd.RowCount())
		//---------------------------- APPEON END ----------------------------
		
		ls_app_image_name = ole_edit.Object.Image()	
		
		IF li_prac_image_cnt > 0 AND li_image_count > 0 THEN
			
//			SELECT image_storage_type
//			INTO :li_image_storage_type
//			FROM icred_settings;
			li_image_storage_type = of_get_app_setting("image_storage_type","I")
//			IF SQLCA.SQLCODE = -1 THEN
//				MessageBox("DB Error", SQLCA.SQLERRTEXT )
//				Return -1
//			END IF
			
			//if supporting docs stored in
			IF li_image_storage_type = 1 THEN
				inv_image_functions = CREATE pfc_cst_nv_image_functions
			ELSE
				li_image_storage_type = 0	
			END IF
					
			IF NOT FileExists( ls_image_path + String( ii_prac_id ) + ".tif"  ) AND li_image_storage_type = 0 THEN
				MessageBox( "Missing File", "There is no " + ls_image_path +  String( ii_prac_id ) + ".tif. " +&
					"The supporting documents for practitioner (" + String( ii_prac_id ) + ") can not be printed." )
			Else
				IF li_image_storage_type <> 1 THEN
					tab_1.tabpage_sd.ole_sd.Object.Image( ls_image_path + String( ii_prac_id ) + ".tif" )
					tab_1.tabpage_sd.ole_sd.Object.Page( 1 )
					tab_1.tabpage_sd.ole_sd.Object.FitTo(3)
					// mskinner  23 March 2006 - begin
					TRY 
						tab_1.tabpage_sd.ole_sd.Object.Display()
					CATCH (RunTimeError RTE)
						//Start Code Change ---- 06.05.2006 #517 maha //clarified message
						MESSAGEBOX("Image Attachment Error ", "The image " + ls_image_path + String( ii_prac_id ) + ".tif" + " could not be displayed prior to attaching to the application.  Check to see if the practitioners images can be viewed." )
					
					ib_skip_code = true
					END TRY
					if ib_skip_code then 
						//--------------------------- APPEON BEGIN ---------------------------
						//$<ID> UM-05
						//$<modify> 01.13.2006 By: Wang Chao
						//$<reason> The GOTO statement is currently unsupported.
						//$<modification> Encapsulate the script associated with the label into of_clean_up,
						//$<modification> and call of_clean_up to provide the same functionality. 
									/*
						//goto CLEAN_Up
						*/
						of_clean_up(li_image_storage_type)
						
						return 1
						//---------------------------- APPEON END ----------------------------
					end if
					// mskinner  23 March 2006 - end
					li_image_cnt = tab_1.tabpage_sd.ole_sd.Object.pagecount()
				END IF
				
				ole_admin.object.Image( ls_app_image_name )

//				SELECT image_storage_type 
//				INTO :li_image_storage_type
//				FROM icred_settings;
//				IF SQLCA.SQLCODE = -1 THEN
//					MessageBox("DB Error", SQLCA.SQLERRTEXT )
//					RETURN -1
//				END IF
				li_image_storage_type = of_get_app_setting("image_storage_type","I")
			
				FOR z = 1 TO li_image_count
					li_image_type_id = tab_1.tabpage_sd.dw_image_list.GetItemNumber( z, "image_type_id" )
					// orig line changed 022703 maha to filter out history records tab_1.tabpage_sd.dw_sd.SetFilter( "pd_images_image_type_id = " + String( li_image_type_id ) )
					
					//--------------------------- APPEON BEGIN ---------------------------
					//$<modify> 2006-09-22 By: Rodger Wu
					//$<reason> Fix a defect.
					
					/* tab_1.tabpage_sd.dw_sd.SetFilter( "pd_images_image_type_id = " + String( li_image_type_id ) + " and active_status = 1" ) */
					
					tab_1.tabpage_sd.dw_sd.SetFilter( "pd_images_image_type_id = " + String( li_image_type_id ) + " and active_status = 1 and pd_images_prac_id = " + String( ii_prac_id ) )
					
					//---------------------------- APPEON END ----------------------------

					tab_1.tabpage_sd.dw_sd.Filter( )
					li_image_type_count = tab_1.tabpage_sd.dw_sd.RowCount( )
					FOR m = 1 TO li_image_type_count				
						//if stored in db then...
						IF li_image_storage_type = 1 THEN
							
							ll_rec_id = tab_1.tabpage_sd.dw_sd.GetItemNumber( m, "pd_images_rec_id" )
							//ii_prac_id = tab_1.tabpage_sd.dw_sd.GetItemNumber( m, "pd_images_prac_id" )	
							//ii_facility_id = tab_1.tabpage_sd.dw_sd.GetItemNumber( m, "pd_images_facility_id" )	
							li_screen_id = tab_1.tabpage_sd.dw_sd.GetItemNumber( m, "pd_images_screen_id" )		
							li_seq_no = tab_1.tabpage_sd.dw_sd.GetItemNumber( m, "pd_images_seq_no" )
							inv_image_functions.of_retrieve_image_from_db( ll_rec_id, ii_prac_id, ii_facility_id, li_screen_id, li_seq_no )
						//Start Code Change ---- 06.18.2007 #V7 maha		rewrote so that multiple images stored in database will be appended
							fc++
							ls_appnd_files[fc] = gs_dir_path + gs_DefDirName + "\Images\" +  String(ll_rec_id) + "_" + String(ii_prac_id) + "_"  + String(ii_facility_id) + "_" + String(li_screen_id) + "_" + String(li_seq_no) + ".tif"
							//--------------------------- APPEON BEGIN ---------------------------
							//$<modify> 2006-09-22 By: Rodger Wu
							//$<reason> Fix a defect.
							/*
							tab_1.tabpage_sd.ole_sd.Object.Image( gs_dir_path + "temp.tif" )
							li_pagecount = tab_1.tabpage_sd.ole_sd.Object.pagecount()
							ole_admin.object.Append( gs_dir_path + "temp.tif", 1 , li_pagecount  )										
							*/
						
//							tab_1.tabpage_sd.ole_sd.Object.Image( gs_dir_path + gs_DefDirName + "\temp.tif" )
//							li_pagecount = tab_1.tabpage_sd.ole_sd.Object.pagecount()
//							ole_admin.object.Append( gs_dir_path + gs_DefDirName + "\temp.tif", 1 , li_pagecount  )
								//--------------------------- APPEON BEGIN ---------------------------
								//$<Add> 08.24.2007 By: Evan
								//$<Reason> Trap added for missing file.															
//								if not FileExists(ls_appnd_files[fc]) then
//									MessageBox("Image Retrieval Error", "Unable to retrieve image file id number" + ls_appnd_files[fc] + " From the database to attach to the application. ")
//									Continue
//								end if
//								//---------------------------- APPEON END ----------------------------
//								
//								tab_1.tabpage_sd.ole_sd.Object.Image( ls_appnd_files[fc] )
//								li_pagecount = tab_1.tabpage_sd.ole_sd.Object.pagecount()
							//Start Code Change ---- 09.17.2007 #V7 maha trap added for missing file
							if not fileexists(ls_appnd_files[fc] ) then
								messagebox("Image Retrieval Error","Unable to retrieve image file id number" + ls_appnd_files[fc] + " From the database to attach to the application. "  )
								continue
							else
								//--------------------------- APPEON BEGIN ---------------------------
								//$<add> 07/09/2007 By: Ken.Guo
								//$<reason> When Image Admin Merge(Append) file, The first image file must be in TIF format, Otherwise PB will runerror.
								If ole_admin.object.pagecount() > 0 and ole_admin.object.FileType <> 1 Then
									Messagebox('Image','The first image file must be in "TIF" format.')
									Continue			
								//---------------------------- APPEON END ----------------------------
								else
									tab_1.tabpage_sd.ole_sd.Object.Image( ls_appnd_files[fc] )
									li_pagecount = tab_1.tabpage_sd.ole_sd.Object.pagecount()
									//--------------------------- APPEON BEGIN ---------------------------
									//$< Add  > 2008-07-15 By: Scofield
									//$<Reason> Verify if the directory has write right for the current user.
									
									ls_Rtn = f_ExaWriteRight(ls_appnd_files[fc])
									if Len(ls_Rtn) > 0 then
										MessageBox(gnv_app.iapp_object.DisplayName,ls_Rtn,Exclamation!)
										Continue
									end if
									//---------------------------- APPEON END ----------------------------

									ole_admin.object.Append( ls_appnd_files[fc] , 1 , li_pagecount  )
								end if
							end if
							//End Code Change---09.17.2007
								
							//	ole_admin.object.Append( ls_appnd_files[fc] , 1 , li_pagecount  )	//Commented By Ken.Guo 07.02.2008 Fixed Bug070101. Repeated script.

							//End Code Change---06.18.2007
							//---------------------------- APPEON END ----------------------------

						ELSE				
							li_start_page = tab_1.tabpage_sd.dw_sd.GetItemNumber( m, "start_page" ) 
							li_num_pages = tab_1.tabpage_sd.dw_sd.GetItemNumber( m, "num_pages" )
							if isnull(li_start_page) or isnull(li_num_pages) then //trap added maha 020105
								MessageBox( "Image Data mismatch", "The image data is missing either the start page or the number of pages for a selected document. " +&
								" Not all of the selected supporting documents for practitioner (" + String( ii_prac_id ) + ") can be printed." )
							elseif li_start_page + li_num_pages - 1 > li_image_cnt then //trap added maha 021904
								MessageBox( "File/Data mismatch", "The image data does not match the  " + ls_image_path +  String( ii_prac_id ) + ".tif file. " +&
								"All the supporting documents for practitioner (" + String( ii_prac_id ) + ") can not be printed." )
							else
								//--------------------------- APPEON BEGIN ---------------------------
								//$<add> 07/09/2007 By: Ken.Guo
								//$<reason> When Image Admin Merge(Append) file, The first image file must be in TIF format, Otherwise PB will runerror.
								If ole_admin.object.pagecount() > 0 and ole_admin.object.FileType <> 1 Then
									Messagebox('Image','The first image file must be in "TIF" format.')
									Return -1			
								End If
								//---------------------------- APPEON END ----------------------------
								//--------------------------- APPEON BEGIN ---------------------------
								//$< Add  > 2008-07-15 By: Scofield
								//$<Reason> Verify if the directory has write right for the current user.
								
								ls_Rtn = f_ExaWriteRight(ls_image_path)
								if Len(ls_Rtn) > 0 then
									MessageBox(gnv_app.iapp_object.DisplayName,ls_Rtn,Exclamation!)
									Return -1
								end if
								//---------------------------- APPEON END ----------------------------

								ole_admin.object.Append( ls_image_path + String( ii_prac_id ) + ".tif", li_start_page , li_num_pages  )			
							end if
						END IF
					END FOR
				END FOR

			END IF
		END IF
	
		IF ai_print_or_email = "F" THEN
			String ls_recipient
			String ls_company
			
			ls_recipient = tab_1.tabpage_pl.dw_print.GetItemString( i, "prac_name" )
			ls_attachments[1] = ls_app_image_name
			ls_company = ""

			IF nv_fax.of_fax( ls_recipient, ls_company,  ls_fax[i], ls_subject, ls_cover_message, ls_attachments, ls_cover_page , ls_errtext)	= -1 THEN	
				Return -1
			END IF
			
			SELECT TOP 1 set_StAppImgInDB INTO :ll_StAppImgInDB FROM icred_settings ;		//Added by Scofield on 2008-09-23
			if ll_StAppImgInDB = 1 then of_SaveImage()												//Added by Scofield on 2008-09-23
		ELSEIF ai_print_or_email = "E" THEN
			//--------------------------- APPEON BEGIN ---------------------------
			//$<modify> 06.11.2008 By: Evan
			//$<reason> Use new email functionality to send email.
			//Start Code Change ----10.06.2008 #V85 maha - readded option to use outlook
			IF li_email_choice = 1 then
				mailSession mSes
				mailReturnCode mRet
				mailMessage mMsg
				mailFileDescription nfile1
				mailFileDescription nfile2
				mailFileDescription nfile3
				mSes = create mailSession
				mRet = mailReturnSuccess!
				mRet = mSes.mailLogon(  mailNewSession!) //maha 042005
				IF mRet <> mailReturnSuccess! THEN
					MessageBox("Mail", 'Logon failed.  Check to make sure you have an email id setup in the user painter.')
					of_clean_up(li_image_storage_type)				
					Return 1
				END IF
				ls_attach = ls_app_image_name
		
				IF Len( ls_attach ) > 0 THEN
					// Populate the attachment object
					nfile1.FileType = MailAttach!
					nfile1.FileName = Mid( ls_attach, 4, 1000 )
					nfile1.PathName = ls_attach
					nfile1.position = 1
					mMsg.AttachmentFile[1] = nfile1	
				END IF	
				mMsg.Subject = ls_subject
				mMsg.NoteText = ls_notetext
					
				ll_find = lds_pd_address.find("pd_address_link_prac_id = " + string(ii_prac_id) + " and pd_address_link_facility_id = " + string(ii_facility_id),1,ll_rowcount2)
				if ll_find > 0 then
					ls_email_address = lds_pd_address.getitemstring(ll_find,'pd_address_e_mail_address')
				else
					MessageBox( "Database Error", "NO find email address. ")
					of_clean_up(li_image_storage_type)				
					Return 1
				END IF
		
				mMsg.Recipient[1].name = ls_email_address	
				mRet = mSes.mailSend(mMsg)	
				IF mRet <> mailReturnSuccess! THEN
					MessageBox("Mail Send", 'Mail not sent')
					mSes.mailLogoff()
					DESTROY mSes
					of_clean_up(li_image_storage_type)				
					Return 1
				END IF			
				mSes.mailLogoff()
				DESTROY mSes
			ELSE
			
				long ll_Return
			
				n_cst_easymail_smtp lnv_mail
	
				// Get email address and attachment
				if Len(ls_app_image_name) > 0 then ls_Attach = ls_app_image_name
				ll_Find = lds_pd_address.Find("pd_address_link_prac_id = " + string(ii_prac_id) + " and pd_address_link_facility_id = " + string(ii_facility_id),1,ll_rowcount2)
				if ll_Find > 0 then
					ls_email_address = lds_pd_address.GetItemString(ll_Find,'pd_address_e_mail_address')
				else
					MessageBox( "Database Error", "NO find email address. ")
					of_clean_up(li_image_storage_type)				
					Return 1
				end if
				
				// Create Email object
				if lnv_mail.of_CreateObject() = -1 then
					//Added by Nova.zhang on 2008-11-07
					f_show_message('create Email object','','','','')
					//MessageBox("Error", "Failed to create Email object!", StopSign!)
					of_clean_up(li_image_storage_type)
					Return 1
				end if
				
				// Send email
				ll_Return = lnv_mail.of_SendText(gs_user_id, ls_email_address, "", "", ls_Subject, ls_NoteText, ls_Attach)
				if ll_Return <> 0 then
					//Added by Nova.zhang on 2008-11-07
					If lnv_Mail.is_sendprotocol = 'SMTP' Then
						f_show_message('error_code_'+string(ll_Return),'%1S%',String(ll_Return),'','')
					Else
						f_show_message('error_code_'+string(ll_Return),'ALL',lnv_Mail.of_getemailerror(ll_Return),'','')
					End If
					//MessageBox("Error Code: " + String(ll_Return), "Failed to send email!~r~n~r~n" + lnv_mail.of_GetEMailError(ll_Return), Exclamation!)
					lnv_mail.of_DeleteObject()
					of_clean_up(li_image_storage_type)
					Return 1
				end if
				lnv_mail.of_DeleteObject()
				//---------------------------- APPEON END ----------------------------
				SELECT TOP 1 set_StAppImgInDB INTO :ll_StAppImgInDB FROM icred_settings ;		//Added by Scofield on 2008-07-09
				if ll_StAppImgInDB = 1 then of_SaveImage()	//Added by Scofield on 2008-07-09
			END IF
			//End Code Change---10.06.2008
		ELSE
			of_print( 1, 99, 1, li_print_exceptions )
			SELECT TOP 1 set_StAppImgInDB INTO :ll_StAppImgInDB FROM icred_settings ;		//Added by Scofield on 2008-07-09
			if ll_StAppImgInDB = 1 then of_SaveImage()												//Added by Scofield on 2008-07-09
		END IF
	end if
END FOR

tab_1.tabpage_pl.dw_print.of_SetUpdateAble( True )
tab_1.tabpage_pl.dw_print.Update()

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-13
//$<add> 02.08.2006 By: Liang QingShi
//$<reason> Performance tuning
//$<modification> Destroy the datastores to release the memory.

destroy lds_facility
destroy lds_pd_address
destroy lds_pd_affil_stat
destroy lds_net_dev_action_items
//---------------------------- APPEON END ----------------------------

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> UM-10
//$<modify> 01.13.2006 By: Wang Chao
//$<reason> The GOTO statement is currently unsupported.
//$<modification> Encapsulate the script associated with the label into of_clean_up,
//$<modification> and call of_clean_up to provide the same functionality.
//GOTO CLEAN_UP
of_clean_up(li_image_storage_type)

of_ImagingWarning()			//Added by Scofield on 2007-09-21
Return 1
//---------------------------- APPEON END ----------------------------	


//--------------------------- APPEON BEGIN ---------------------------
//$<ID> UM-11
//$<comment> 01.13.2006 By: Wang Chao
//$<reason> The GOTO statement is currently unsupported.
//$<modification> Encapsulate the following script into of_clean_up and have the application
//$<modification> call of_clean_up to provide the same functionality.
//CLEAN_UP:
//
//IF li_image_storage_type = 1 AND IsValid( pfc_cst_nv_image_functions ) THEN
//	Destroy pfc_cst_nv_image_functions
//END IF
//
//gi_burn_annos	= 0
//tab_1.tabpage_sd.dw_image_list.SetFilter( "" )
//tab_1.tabpage_sd.dw_image_list.Filter()
//
//tab_1.tabpage_net_dev.dw_net_dev1.Event Constructor()
//
//COMMIT USING SQLCA;
//
//tab_1.tabpage_pl.dw_print.Reset()
//tab_1.tabpage_sd.dw_sd.Reset()
//tab_1.tabpage_sd.dw_image_list.Retrieve()
//
////ole_edit.SetRedraw( True )
//
//tab_1.tabpage_gen.st_app.Text = "Complete"
//
//IF ib_open_from_prac_folder THEN
//	IF IsValid( w_prac_data_1 ) THEN
//		w_prac_data_1.Event pfc_cst_refresh_net_dev_ai()
//	ELSEIF IsValid( w_prac_data_intelliapp ) THEN
//		w_prac_data_intelliapp.Event pfc_cst_refresh_net_dev_ai()
//	END IF
//END IF
//
//DESTROY nv_fax ;
//
//gi_burn_annos	= 0
//
//Return 1
//---------------------------- APPEON END ----------------------------


//ole_edit.SetRedraw( True )


end function

public function integer of_action_item_create (long al_prac, integer al_facility, long al_app);//Created 06.18.07 maha to correct the creation of action items
//will be called for each practitioner application printed

integer i
integer ic
long ll_new
long ll_prac[]
datetime ld_due_date
string ls_find
integer r
u_dw ldw_ai
u_dw ldw_copy

ldw_ai = tab_1.tabpage_net_dev.dw_net_dev1
ldw_copy = tab_1.tabpage_net_dev.dw_ai_copy

ll_prac[1] = al_prac
ldw_copy.retrieve(ll_prac[])

//for each action item in the list create one for the provider
ic = ldw_ai.rowcount( )

if ic = 0 then return 1

for i = 1 to ic
	debugbreak()
	if isnull(ldw_ai.getitemnumber(i,"action_type")) then
		continue
	else
		//see if action type exists
		ls_find = "facility_id = " + string(al_facility)   + " and app_id = " + string(al_app)  + " and action_type = " + string(ldw_ai.getitemnumber(i,"action_type"))
		r = ldw_copy.find(ls_find,1,ldw_copy.rowcount() )	
		//copy unfound  items to the copy dw and modify for the provider
		if r = 0 then
			ldw_ai.rowscopy( i, i,primary!, ldw_copy , 10000, primary!)
			r = ldw_copy.rowcount()
			ldw_copy.setitem(r, "prac_id", al_prac ) 
			ldw_copy.setitem(r, "facility_id", al_facility ) 
			ldw_copy.setitem(r, "app_id", al_app ) 
			ldw_copy.setitem(r, "rec_id", gnv_app.of_Get_Id("RECORD_ID", 1)  ) 
			ld_due_date = ldw_ai.getitemdatetime(i,"action_date")
			if  not isnull(ld_due_date) then
				//set the appropriate due date if the action date is set
				ld_due_date = datetime(RelativeDate( date(ld_due_date), ii_due_days[i]  ),time("00:00:00"))
				ldw_copy.setitem(r, "due_date", ld_due_date ) 
			end if
		end if
	end if
	
next

ldw_copy.update()































return 1
end function

public function integer of_copy_ai_values (integer ai_row);// Code Create ---- 06.18.2007 #V7 maha to copy values from previous row during add

u_dw ldw_ai

ldw_ai = tab_1.tabpage_net_dev.dw_net_dev1
if ldw_ai.rowcount() > 1 then
	ldw_ai.setitem(ai_row,"action_user",ldw_ai.getitemstring(ai_row - 1,"action_user")  )
	ldw_ai.setitem(ai_row,"action_status",ldw_ai.getitemnumber(ai_row - 1,"action_status")  )
	ldw_ai.setitem(ai_row,"action_dept",ldw_ai.getitemnumber(ai_row - 1,"action_dept")  )
	ldw_ai.setitem(ai_row,"action_date",ldw_ai.getitemdatetime(ai_row - 1,"action_date")  )
end if

return 1
	
end function

public subroutine of_saveimage ();//------------------------------------------------------------------------------
// Function: of_SaveImage()
//------------------------------------------------------------------------------
// Description: Save Image to Database
// Arguments:
//		None
// Return Value: 
//		None
//------------------------------------------------------------------------------
// Author:	Scofield		Date: 2008-07-09
//------------------------------------------------------------------------------
// Revision History: 
//				1.0   Initial version
//==============================================================================

String		ls_ImagePath
long			ll_Cnts,ll_FileNo,ll_ReadCnts
Blob			lblb_ImageData,lblb_Buffer
DateTime		ldt_SaveTime

long ll_ImgType = 5

ldt_SaveTime = f_get_server_dtm()

SELECT Count(*) INTO :ll_Cnts FROM net_dev_action_images WHERE rec_id = :ii_rec_id AND prac_id = :ii_prac_id AND app_id = :ii_app_id ;

if ll_Cnts <= 0 then
	INSERT INTO net_dev_action_images(rec_id,prac_id,app_id,image_type,save_date)
		  VALUES (:ii_rec_id,:ii_prac_id,:ii_app_id,:ll_ImgType,:ldt_SaveTime) ;
else
	UPDATE net_dev_action_images
	   SET save_date = :ldt_SaveTime
	 WHERE rec_id = :ii_rec_id AND prac_id = :ii_prac_id AND app_id = :ii_app_id ;
end if

if gi_citrix = 1 then
	ls_ImagePath = of_letter_paths("L")
else
	ls_ImagePath = gs_dir_path + gs_DefDirName + "\" 
end if

ls_ImagePath += String(ii_app_id) + "-" + String(ii_prac_id) + ".tif"

ll_FileNo = FileOpen(ls_ImagePath,StreamMode!,Read!)
if ll_FileNo <= 0 then Return

ll_ReadCnts = FileRead(ll_FileNo,lblb_Buffer)
do while ll_ReadCnts > 0
	lblb_ImageData += lblb_Buffer
	ll_ReadCnts = FileRead(ll_FileNo,lblb_Buffer)
loop

FileClose(ll_FileNo)

UPDATEBLOB net_dev_action_images
       SET image_data = :lblb_ImageData
     WHERE rec_id = :ii_rec_id AND prac_id = :ii_prac_id AND app_id = :ii_app_id ;

COMMIT USING SQLCA ;

end subroutine

public subroutine of_set_default_image_types ();//====================================================================
// Event: pfc_cst_u_print_app.of_set_default_image_types()
//--------------------------------------------------------------------
// Description:set default image types
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  (none)
//--------------------------------------------------------------------
// Author:	Andy		Date: Jul 14,2008
//--------------------------------------------------------------------
//	
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

//$<add> 07.14.2008 by Andy
Long   ll_app_id[],ll_Row
Long   ll_Cnt,ll_Cnt2
Long   ll_Find,ll_image_type

//tab_1.tabpage_pl.dw_print.RowCount() = 1 and 
if tab_1.tabpage_sd.rb_app_default.checked then
	ll_Cnt    = tab_1.tabpage_pl.dw_print.RowCount()
	FOR ll_Row = 1 to ll_Cnt
		ll_app_id[ll_Row] = tab_1.tabpage_pl.dw_print.GetItemNumber(ll_Row,"app_id")
	NEXT
	
	tab_1.tabpage_sd.dw_image_defaults.Reset()
	tab_1.tabpage_sd.dw_image_list.Reset()
	
	gnv_appeondb.of_startqueue( )
	tab_1.tabpage_sd.dw_image_list.Retrieve()
	tab_1.tabpage_sd.dw_image_defaults.Retrieve(ll_app_id)
	gnv_appeondb.of_commitqueue( )
	
	ll_Cnt = tab_1.tabpage_sd.dw_image_defaults.RowCount()
	ll_Cnt2= tab_1.tabpage_sd.dw_image_list.RowCount()
	For ll_Row = 1 to ll_Cnt
		ll_image_type = tab_1.tabpage_sd.dw_image_defaults.GetItemNumber(ll_Row,"image_type")
		ll_Find = tab_1.tabpage_sd.dw_image_list.Find("image_type_id=" + String(ll_image_type),1,ll_Cnt2)
		if ll_Find > 0 then 
			tab_1.tabpage_sd.dw_image_list.SetItem(ll_Find,"selected",1)
		end if
	Next
	if ll_Cnt > 0 then 
		tab_1.tabpage_sd.dw_image_list.modify("DataWindow.ReadOnly=yes")
		tab_1.tabpage_sd.cb_15.enabled = false
	else
		tab_1.tabpage_sd.dw_image_list.modify("DataWindow.ReadOnly=no")
		tab_1.tabpage_sd.cb_15.enabled = true
	end if
end if

end subroutine

on pfc_cst_u_print_app.create
int iCurrent
call super::create
this.tab_1=create tab_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.tab_1
end on

on pfc_cst_u_print_app.destroy
call super::destroy
destroy(this.tab_1)
end on

event constructor;call super::constructor;//select set_13 into :ii_batch_button from icred_settings;

	
////if ii_batch_button = 1 then
	tab_1.tabpage_pl.cb_batch_search.Visible = true
//end if

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-14
//$<add> 02.08.2006 By: Liang QingShi
//$<reason> Performance tuning 
//$<modification> 1)Move it from tab_1.tabpage_sd.dw_image_list.constructor() and 
//$<modification> tab_1.tabpage_net_dev.dw_net_dev1.constructor() due to the usage
//$<modification> of CreateOnDemanc.
//$<modification> 2)Add the Appeon Queue labels to reduce client-server interactions. 

long ll_action_type,ll_action_status,ll_action_dept
DataWindowChild dwchild
tab_1.tabpage_pl.dw_print.settransobject(sqlca)

tab_1.tabpage_sd.dw_image_list.of_SetUpdateAble( False )
tab_1.tabpage_sd.dw_image_list.SetTransObject( SQLCA )

tab_1.tabpage_net_dev.dw_net_dev1.of_SetRowManager( TRUE )
tab_1.tabpage_net_dev.dw_net_dev1.of_SetReqColumn(TRUE)
tab_1.tabpage_net_dev.dw_net_dev1.of_SetTransObject(SQLCA)

tab_1.tabpage_net_dev.dw_net_dev1.Reset()
tab_1.tabpage_net_dev.dw_net_dev1.InsertRow( 0 )
tab_1.tabpage_net_dev.dw_net_dev1.SetFocus( )

tab_1.tabpage_net_dev.dw_net_dev1.of_SetUpdateable( False )
tab_1.tabpage_net_dev.dw_net_dev1.of_SetDropDownCalendar( TRUE )
tab_1.tabpage_net_dev.dw_net_dev1.iuo_calendar.of_Register(tab_1.tabpage_net_dev.dw_net_dev1.iuo_calendar.DDLB)

gnv_appeondb.of_startqueue( )

tab_1.tabpage_sd.dw_image_list.Retrieve()

tab_1.tabpage_net_dev.dw_net_dev1.GetChild( "action_type", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("Action Type")

tab_1.tabpage_net_dev.dw_net_dev1.GetChild( "action_dept", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("Action Department")

tab_1.tabpage_net_dev.dw_net_dev1.GetChild( "action_status", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("Action Status")

tab_1.tabpage_net_dev.dw_net_dev1.GetChild( "action_user", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve( )

tab_1.tabpage_pl.dw_print.GetChild( "facility_id", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve( )
tab_1.tabpage_pl.dw_print.GetChild( "app_id", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve( )


select lookup_code into :ll_action_type from code_lookup where lookup_name = 'Action Type' and code = 'App Rcvd Prac';
select lookup_code into :ll_action_status from code_lookup where lookup_name = 'Action Status' and code = 'Incomplete';
select lookup_code into :ll_action_dept from code_lookup where lookup_name = 'Action Department' and code = 'Credentialing';

gnv_appeondb.of_commitqueue( )

if ll_action_type = 0 then 
	messagebox("Warning", "There is no Action Type with the code of App Rcvd Prac in the Action Type lookup table. This will cause the next Action to be entered to have an action type of 0")
end if

tab_1.tabpage_net_dev.dw_net_dev1.SetItem( 1, "action_status" , ll_action_status )
tab_1.tabpage_net_dev.dw_net_dev1.SetItem( 1, "action_type" , ll_action_type )
tab_1.tabpage_net_dev.dw_net_dev1.SetItem( 1, "action_date" , Today() )
tab_1.tabpage_net_dev.dw_net_dev1.SetItem( 1, "action_user" , gs_user_id )
tab_1.tabpage_net_dev.dw_net_dev1.SetItem( 1, "action_dept" , ll_action_dept )
//---------------------------- APPEON END ----------------------------


end event

type cb_repopulate from pfc_cst_u_create_app2`cb_repopulate within pfc_cst_u_print_app
integer x = 2871
integer taborder = 60
end type

type dw_exceptions from pfc_cst_u_create_app2`dw_exceptions within pfc_cst_u_print_app
end type

type ole_admin from pfc_cst_u_create_app2`ole_admin within pfc_cst_u_print_app
end type

type st_rec from pfc_cst_u_create_app2`st_rec within pfc_cst_u_print_app
integer x = 1253
end type

type st_page_num from pfc_cst_u_create_app2`st_page_num within pfc_cst_u_print_app
integer x = 3013
integer y = 1808
end type

type st_name from pfc_cst_u_create_app2`st_name within pfc_cst_u_print_app
integer x = 9
integer y = 1928
integer width = 1170
long textcolor = 128
long backcolor = 80269524
alignment alignment = center!
end type

type cb_next from pfc_cst_u_create_app2`cb_next within pfc_cst_u_print_app
integer x = 2853
integer y = 1796
integer taborder = 90
boolean enabled = false
end type

type cb_prior from pfc_cst_u_create_app2`cb_prior within pfc_cst_u_print_app
integer x = 2725
integer y = 1796
end type

type cb_2 from pfc_cst_u_create_app2`cb_2 within pfc_cst_u_print_app
integer x = 1294
integer y = 1920
integer width = 617
integer weight = 700
string text = "Populate && Print"
end type

event cb_2::clicked;//Long ll_rec_id 
//Long ll_next_id
//Long ll_prac_id
//Long	ll_action_type
//Long	ll_action_status
//DateTime	ldt_action_dt
//DateTime	ldt_next_action_dt
//String ls_action_notes
//String	ls_action_user
//Long	ll_action_dept
//String ls_name
//Integer li_nd_row_cnt
//Integer a
//Integer li_rc
//Integer i
//Integer li_app_id
//Integer li_from_page
//Integer li_to_page
//Integer li_print_exceptions
//
//of_connections( "IntelliCred", "0" )
//
//PrintSetup()
//
//tab_1.tabpage_pl.dw_print.AcceptText()
//
//li_rc = tab_1.tabpage_pl.dw_print.RowCount()
//
//IF cbx_exceptions.Checked THEN
//	li_print_exceptions = 1
//ELSE
//	li_print_exceptions = 0
//END IF
//
//DataWindowChild dwchild
//Integer li_found
//sTRING LS_APP_NM
//
//FOR i = 1 TO li_rc
//	st_name.Text = tab_1.tabpage_pl.dw_print.GetItemString( i, "prac_name" )
//	ii_prac_id = tab_1.tabpage_pl.dw_print.GetItemNumber( i, "prac_id" )
//	ii_app_id  = tab_1.tabpage_pl.dw_print.GetItemNumber( i, "app_id" ) 
//	ii_facility_id  = tab_1.tabpage_pl.dw_print.GetItemNumber( i, "facility_id" ) 
//	tab_1.tabpage_pl.dw_print.GetChild( "app_id", dwchild )
//	li_found = dwchild.Find( "app_hdr_app_id = " + String( ii_app_id ),1, dwchild.RowCount() )
//	ls_app_nm = dwchild.GetItemString( li_found, "app_hdr_application_name" )
//	li_nd_row_cnt = tab_1.tabpage_net_dev.dw_net_dev1.RowCount()
//	FOR a = 1 TO li_nd_row_cnt
//		ll_action_type = tab_1.tabpage_net_dev.dw_net_dev1.GetItemNumber( a, "action_type" )
//		ll_action_status = tab_1.tabpage_net_dev.dw_net_dev1.GetItemNumber( a, "action_status" )
//		ldt_action_dt = tab_1.tabpage_net_dev.dw_net_dev1.GetItemDateTime( a, "action_date" )
//		ldt_next_action_dt = tab_1.tabpage_net_dev.dw_net_dev1.GetItemDateTime( a, "next_action_date" )
//		ls_action_user = tab_1.tabpage_net_dev.dw_net_dev1.GetItemString( a, "action_user" )
//		ls_action_notes = tab_1.tabpage_net_dev.dw_net_dev1.GetItemString( a, "notes" ) 
//		IF Not IsNull( ls_action_notes ) THEN
//			ls_action_notes = ls_action_notes + ls_app_nm
//		ELSE
//			ls_action_notes = ls_app_nm
//		END IF
//		ll_action_dept = tab_1.tabpage_net_dev.dw_net_dev1.GetItemNumber( a, "action_dept" )		
//		ll_rec_id = gnv_app.of_Get_Id("RECORD_ID")	
//		INSERT INTO net_dev_action_items  
//     	    ( rec_id,   
//          	 prac_id,   
//	           action_type,   
//     	      action_date,   
//          	 action_dept,   
//	           action_user,   
//     	      next_action_date,   
//	           notes,   
//     	      action_status,   
//	           facility_id )  
//		VALUES ( :ll_rec_id,   
//	           :ii_prac_id,   
//     	      :ll_action_type,   
//          	 :ldt_action_dt,   
//	           :ll_action_dept,   
//     	      :ls_action_user,   
//	           :ldt_next_action_dt,   
//     	      :ls_action_notes,   
//	           :ll_action_status,   
//     	      :ii_facility_id )
//		USING SQLCA;
//		IF SQLCA.SQLCODE = -1 THEN
//			MessageBox("Database Error", SQLCA.SQLERRTEXT )
//			Return -1
//		END IF
//	END FOR
//	of_set_app_id( ii_app_id  )
//	of_load_app( )
//	li_from_page = tab_1.tabpage_pl.dw_print.GetItemNumber( i, "from_page" )
//	li_to_page = 99   //dw_print.GetItemNumber( i, "to_page" )
//	of_setup( ii_app_id, li_from_page  , li_to_page, ii_facility_id )
//	of_print( 1, 99, 1, li_print_exceptions )
//     SELECT ids.print_id  
//     INTO :ll_next_id  
//     FROM ids  ;
//	IF IsNull( ll_next_id ) THEN
//		ll_next_id = 0
//	END IF
//	ll_next_id++
//	UPDATE ids
//	SET print_id = :ll_next_id;
//	tab_1.tabpage_pl.dw_print.SetItem( i, "print_id", ll_next_id )
//	tab_1.tabpage_pl.dw_print.SetItem( i, "from_page", 1 )
//	tab_1.tabpage_pl.dw_print.SetItem( i, "to_page", 99 )
//	//dw_print.SetItem( i, "user_id", gs_user_id )
//	//dw_print.SetItem( i, "print_date", today() ) this field needs to be created
//	UPDATE net_dev_action_items  
//     SET action_status = -111
//     WHERE ( net_dev_action_items.prac_id = :ii_prac_id ) AND  
//         ( net_dev_action_items.facility_id = :ii_facility_id ) AND
//	    ( net_dev_action_items.action_type = -3 );
//	IF SQLCA.SQLCODE = -1 THEN
//		MessageBox("Database Error", SQLCA.SQLERRTEXT )
//		Return -1
//	END IF
//END FOR
//
//tab_1.tabpage_net_dev.dw_net_dev1.Event Constructor()
////tab_1.tabpage_net_dev.dw_net_dev1.Reset()
////tab_1.tabpage_net_dev.dw_net_dev1.InsertRow( 0 )
////tab_1.tabpage_net_dev.dw_net_dev1.SetFocus( )
//
//tab_1.tabpage_pl.dw_print.Update()
////dw_print.Reset()
//COMMIT USING SQLCA;
end event

type cb_1 from pfc_cst_u_create_app2`cb_1 within pfc_cst_u_print_app
integer x = 3241
end type

type st_1 from pfc_cst_u_create_app2`st_1 within pfc_cst_u_print_app
integer x = 1175
integer y = 1928
integer width = 1143
long textcolor = 128
long backcolor = 80269524
alignment alignment = center!
end type

type st_2 from pfc_cst_u_create_app2`st_2 within pfc_cst_u_print_app
integer x = 2313
integer y = 1928
integer width = 1147
long textcolor = 128
long backcolor = 80269524
alignment alignment = center!
end type

type ole_edit from pfc_cst_u_create_app2`ole_edit within pfc_cst_u_print_app
integer x = 46
integer y = 192
integer width = 3406
integer height = 1524
end type

type tab_1 from tab within pfc_cst_u_print_app
event create ( )
event destroy ( )
integer x = 14
integer y = 24
integer width = 3474
integer height = 1888
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 79741120
boolean fixedwidth = true
boolean raggedright = true
integer selectedtab = 1
tabpage_pl tabpage_pl
tabpage_sd tabpage_sd
tabpage_net_dev tabpage_net_dev
tabpage_gen tabpage_gen
end type

on tab_1.create
this.tabpage_pl=create tabpage_pl
this.tabpage_sd=create tabpage_sd
this.tabpage_net_dev=create tabpage_net_dev
this.tabpage_gen=create tabpage_gen
this.Control[]={this.tabpage_pl,&
this.tabpage_sd,&
this.tabpage_net_dev,&
this.tabpage_gen}
end on

on tab_1.destroy
destroy(this.tabpage_pl)
destroy(this.tabpage_sd)
destroy(this.tabpage_net_dev)
destroy(this.tabpage_gen)
end on

event selectionchanged;IF newindex = 4 THEN
	ole_edit.Visible = True
	cb_next.Visible = True
	cb_prior.Visible = True
	st_page_num.Visible = True
ELSE
	ole_edit.Visible = False
	cb_next.Visible = False
	cb_prior.Visible = False
	st_page_num.Visible = False
END IF

//$<add> 07.14.2008 by Andy
//Set default image types
if newindex = 2 then of_set_default_image_types()

end event

type tabpage_pl from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 3438
integer height = 1760
long backcolor = 79741120
string text = "Print List"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "ArrangeTables!"
long picturemaskcolor = 553648127
cb_add cb_add
cb_4 cb_4
cb_9 cb_9
cb_10 cb_10
cb_batch_search cb_batch_search
dw_print dw_print
end type

on tabpage_pl.create
this.cb_add=create cb_add
this.cb_4=create cb_4
this.cb_9=create cb_9
this.cb_10=create cb_10
this.cb_batch_search=create cb_batch_search
this.dw_print=create dw_print
this.Control[]={this.cb_add,&
this.cb_4,&
this.cb_9,&
this.cb_10,&
this.cb_batch_search,&
this.dw_print}
end on

on tabpage_pl.destroy
destroy(this.cb_add)
destroy(this.cb_4)
destroy(this.cb_9)
destroy(this.cb_10)
destroy(this.cb_batch_search)
destroy(this.dw_print)
end on

type cb_add from commandbutton within tabpage_pl
integer x = 14
integer y = 1604
integer width = 389
integer height = 84
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Add"
end type

event clicked;Integer li_nr
Integer a
Integer li_app_cnt
Integer li_cnt
Integer i
String ls_name
Long ll_prac_id
gs_pass_ids lgs_app_ids 


gs_search lstr_search

lstr_search.stran_transaction = SQLCA

IF ii_open_from_dash > -1 THEN
	lstr_search.ls_open_for = "INTELLIAPP999"  
ELSE
	lstr_search.ls_open_for = "INTELLIAPP" + String( 1 ) 
END IF

OpenWithParm( w_extended_search_new , lstr_search )

IF Message.DoubleParm = -1 THEN
	Return
END IF

li_cnt = UpperBound( gs_names )
FOR i = 1 TO li_cnt
	li_nr = dw_print.InsertRow( 0 )
	dw_print.SetItem( li_nr, "prac_name", gs_names[i] )
	dw_print.SetItem( li_nr, "prac_id", gl_prac_ids[i] )
	dw_print.SetItem( li_nr, "facility_id", gl_facility_ids[i] )
	dw_print.SetItem( li_nr, "app_id", gi_app_ids[i] )
END FOR

dw_print.SetRow( li_nr )
dw_print.ScrollToRow( li_nr )

dw_print.SetFocus()


end event

type cb_4 from commandbutton within tabpage_pl
integer x = 823
integer y = 1604
integer width = 389
integer height = 84
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Delete"
end type

event clicked;

dw_print.DeleteRow( dw_print.GetRow() )


end event

type cb_9 from commandbutton within tabpage_pl
integer x = 1230
integer y = 1604
integer width = 389
integer height = 84
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Clear"
end type

event clicked;dw_print.Reset()
end event

type cb_10 from commandbutton within tabpage_pl
integer x = 3035
integer y = 1604
integer width = 389
integer height = 84
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Next-->"
end type

event clicked;Integer i
Integer li_rc

IF dw_print.RowCount() = 0 THEN
	MessageBox( "Select Error", "You must select at least one application for printing." )
	dw_print.SetFocus()	
	Return
END IF

li_rc = dw_print.RowCount()

FOR i = 1 TO li_rc
	IF dw_print.GetItemNumber( i, "app_id" ) < 1 THEN
		MessageBox("Select Error", "You must select an application to print." )
		dw_print.SetRow( i )
		dw_print.ScrollToRow( i )
		dw_print.SetColumn( "app_id" )
		dw_print.SetFocus()
		Return
	END IF
END FOR

tab_1.SelectTab( 2 )
end event

type cb_batch_search from commandbutton within tabpage_pl
integer x = 421
integer y = 1604
integer width = 384
integer height = 84
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Batch Select"
end type

event clicked;gs_batch_search lst_search
long i
long ic
long r
long rc
long pracids[]
string names[]
long ll_facil
integer ll_app




openwithparm(w_batch_prac_select_new,"A")


if message.stringparm = "Cancel" then return
//names[] = lst 
lst_search = message.powerobjectparm
pracids[] = lst_search.li_prac_id[]
names[] = lst_search.ls_name[]
ll_facil = lst_search.ll_facility[1]
ll_app = lst_search.ll_app[1]

 ic = upperbound(pracids[]) 
 
FOR i = 1 TO ic
	r = dw_print.InsertRow( 0 )
	dw_print.SetItem( r, "prac_name", names[i] )
	dw_print.SetItem( r, "prac_id",pracids[i] )
	dw_print.SetItem( r, "facility_id", ll_facil )
	dw_print.SetItem( r, "app_id", ll_app )
	dw_print.SetItem( r, "selected", 1 )
END FOR

dw_print.SetRow( r )
dw_print.ScrollToRow( r )

dw_print.SetFocus()


end event

type dw_print from u_dw within tabpage_pl
integer x = 9
integer y = 12
integer width = 3419
integer height = 1564
integer taborder = 10
boolean bringtotop = true
boolean titlebar = true
string title = "Application Print List"
string dataobject = "d_print_apps"
end type

event constructor;This.of_SetUpdateAble( False )
This.of_SetTransObject( SQLCA )
end event

event itemchanged;call super::itemchanged;IF This.GetColumnName() = "app_id" THEN
	datawindowchild dwchild
	Integer li_pages
	This.GetChild( "app_id", dwchild )
	li_pages = dwchild.GetItemNumber( dwchild.GetRow(), "app_hdr_num_pages" )
	This.SetItem( row, "to_page", li_pages )
END IF
end event

event clicked;call super::clicked;long r

r = this.getclickedrow()

this.setrow(r)
end event

type tabpage_sd from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3438
integer height = 1760
long backcolor = 79741120
string text = "Supporting Documents"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "CheckDiff!"
long picturemaskcolor = 553648127
dw_image_defaults dw_image_defaults
st_5 st_5
st_4 st_4
st_3 st_3
rb_no_print rb_no_print
rb_selected_image rb_selected_image
rb_app_default rb_app_default
dw_image_list dw_image_list
cb_11 cb_11
ole_sd ole_sd
dw_sd dw_sd
cb_15 cb_15
gb_1 gb_1
end type

on tabpage_sd.create
this.dw_image_defaults=create dw_image_defaults
this.st_5=create st_5
this.st_4=create st_4
this.st_3=create st_3
this.rb_no_print=create rb_no_print
this.rb_selected_image=create rb_selected_image
this.rb_app_default=create rb_app_default
this.dw_image_list=create dw_image_list
this.cb_11=create cb_11
this.ole_sd=create ole_sd
this.dw_sd=create dw_sd
this.cb_15=create cb_15
this.gb_1=create gb_1
this.Control[]={this.dw_image_defaults,&
this.st_5,&
this.st_4,&
this.st_3,&
this.rb_no_print,&
this.rb_selected_image,&
this.rb_app_default,&
this.dw_image_list,&
this.cb_11,&
this.ole_sd,&
this.dw_sd,&
this.cb_15,&
this.gb_1}
end on

on tabpage_sd.destroy
destroy(this.dw_image_defaults)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.rb_no_print)
destroy(this.rb_selected_image)
destroy(this.rb_app_default)
destroy(this.dw_image_list)
destroy(this.cb_11)
destroy(this.ole_sd)
destroy(this.dw_sd)
destroy(this.cb_15)
destroy(this.gb_1)
end on

type dw_image_defaults from u_dw within tabpage_sd
boolean visible = false
integer x = 517
integer y = 1568
integer width = 1147
integer height = 164
integer taborder = 11
string dataobject = "d_app_image_defaults"
boolean vscrollbar = false
boolean livescroll = false
end type

type st_5 from statictext within tabpage_sd
integer x = 1559
integer y = 784
integer width = 1362
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Do not attach any provider images to the printed Application(s)."
boolean focusrectangle = false
end type

type st_4 from statictext within tabpage_sd
integer x = 1559
integer y = 576
integer width = 978
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Use the Image types selected on this screen."
boolean focusrectangle = false
end type

type st_3 from statictext within tabpage_sd
integer x = 1559
integer y = 264
integer width = 1632
integer height = 152
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "If Image defaults are set up for the Application(s), they will be used for printing images; otherwise, the selected Image types on this screen will be used."
boolean focusrectangle = false
end type

type rb_no_print from radiobutton within tabpage_sd
integer x = 1472
integer y = 708
integer width = 517
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Print No Images:"
end type

event clicked;//$<add> 07.14.2008
tab_1.tabpage_sd.dw_image_list.reset( )
tab_1.tabpage_sd.dw_image_list.retrieve( )

tab_1.tabpage_sd.dw_image_list.modify("DataWindow.ReadOnly=yes")
tab_1.tabpage_sd.cb_15.enabled = false
end event

type rb_selected_image from radiobutton within tabpage_sd
integer x = 1472
integer y = 496
integer width = 631
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Selected image type:"
end type

event clicked;//$<add> 07.14.2008 by Andy
tab_1.tabpage_sd.dw_image_list.modify("DataWindow.ReadOnly=no")
tab_1.tabpage_sd.cb_15.enabled = true
end event

type rb_app_default from radiobutton within tabpage_sd
integer x = 1472
integer y = 184
integer width = 795
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Application Default Priority:"
boolean checked = true
end type

event clicked;//$<add> 07.14.2008 by Andy
of_set_default_image_types()

end event

type dw_image_list from u_dw within tabpage_sd
integer x = 9
integer y = 48
integer width = 1161
integer height = 1528
integer taborder = 90
boolean titlebar = true
string title = "Select Image Type"
string dataobject = "d_image_image_type_list_select"
boolean hscrollbar = true
end type

event clicked;call super::clicked;IF row > 0 THEN
	This.SetRow( row )
END IF
end event

event constructor;//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-15
//$<comment> 02.08.2006 By: Liang QingShi
//$<reason> Performance tuning 
//$<modification> Move the following script to pfc_cst_u_print_app.constructor() due to the
//$<modification> usage of CreateOnDemand.

/*
This.of_SetUpdateAble( False )
This.SetTransObject( SQLCA )
This.Retrieve()
*/

//---------------------------- APPEON END ----------------------------


end event

event retrieveend;call super::retrieveend;IF rowcount > 0 THEN
	This.SelectRow( 1, True )
	This.SetFocus()
	
	Integer i
	Integer li_rc
	
	li_rc = This.RowCount( )
	FOR i = 1 TO li_rc
		IF This.GetItemNumber( i, "link_to_app_id" ) = 1 THEN
			This.SetItem( i, "selected", 1 )
		END IF
	END FOR
END IF
end event

type cb_11 from commandbutton within tabpage_sd
integer x = 3035
integer y = 1608
integer width = 389
integer height = 84
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Next-->"
end type

event clicked;tab_1.SelectTab( 3 )
end event

type ole_sd from olecustomcontrol within tabpage_sd
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
integer x = 1221
integer y = 368
integer width = 1778
integer height = 936
integer taborder = 60
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
string binarykey = "pfc_cst_u_print_app.udo"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
end type

type dw_sd from u_dw within tabpage_sd
boolean visible = false
integer x = 1865
integer y = 32
integer width = 453
integer taborder = 11
boolean bringtotop = true
string dataobject = "d_pd_image_list"
end type

event constructor;call super::constructor;This.SetTransObject( SQLCA )
This.of_SetUpdateAble( False )
end event

type cb_15 from commandbutton within tabpage_sd
integer x = 14
integer y = 1608
integer width = 389
integer height = 84
integer taborder = 50
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Select &All"
end type

event clicked;Integer 	li_rc
Integer 	i
integer	li_Value

//--------------------------- APPEON BEGIN ---------------------------
//$<Modify> 2007-08-10 By: Scofield
//$<Reason> Add the Deselect function

if This.Text = "Select &All" then
	li_Value = 1
	This.Text = "Deselect &All"
else
	li_Value = 0
	This.Text = "Select &All"
end if

li_rc = dw_image_list.RowCount( )
for I = 1 to li_rc
	dw_image_list.SetItem( i, "selected", li_Value )
next
//---------------------------- APPEON END ----------------------------

end event

type gb_1 from groupbox within tabpage_sd
integer x = 1353
integer y = 72
integer width = 1925
integer height = 936
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "Image Printing Options"
end type

type tabpage_net_dev from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 3438
integer height = 1760
long backcolor = 80269524
string text = "Application Status"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
string picturename = "PasteStatement!"
long picturemaskcolor = 553648127
dw_ai_copy dw_ai_copy
dw_net_dev1 dw_net_dev1
cb_7 cb_7
cb_8 cb_8
cb_12 cb_12
end type

on tabpage_net_dev.create
this.dw_ai_copy=create dw_ai_copy
this.dw_net_dev1=create dw_net_dev1
this.cb_7=create cb_7
this.cb_8=create cb_8
this.cb_12=create cb_12
this.Control[]={this.dw_ai_copy,&
this.dw_net_dev1,&
this.cb_7,&
this.cb_8,&
this.cb_12}
end on

on tabpage_net_dev.destroy
destroy(this.dw_ai_copy)
destroy(this.dw_net_dev1)
destroy(this.cb_7)
destroy(this.cb_8)
destroy(this.cb_12)
end on

type dw_ai_copy from u_dw within tabpage_net_dev
boolean visible = false
integer x = 914
integer y = 1624
integer width = 165
integer height = 100
integer taborder = 11
string dataobject = "d_net_dev_action_items_printing"
boolean resizable = true
end type

event constructor;call super::constructor;this.settransobject(sqlca)
end event

type dw_net_dev1 from u_dw within tabpage_net_dev
integer x = 9
integer y = 48
integer width = 2693
integer height = 1548
integer taborder = 11
boolean bringtotop = true
boolean titlebar = true
string title = "Action Items"
string dataobject = "d_net_dev_action_items_printing"
end type

event constructor;call super::constructor;//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-16
//$<comment> 01.18.2006 By: Liang QingShi
//$<reason> Performance tuning 
//$<modification> Move the following script to pfc_cst_u_print_app.constructor()
//$<modification> due to the usage of CreateOnDemand.

/*
long ll_action_type  //maha 101901
long ll_action_status//maha 101901
long ll_action_dept//maha 101901

This.of_SetUpdateable( False )
This.of_SetDropDownCalendar( TRUE )
This.iuo_calendar.of_Register(this.iuo_calendar.DDLB)

dw_net_dev1.Reset()
//dw_net_dev1.InsertRow( 0 )
dw_net_dev1.InsertRow( 0 )
dw_net_dev1.SetFocus( )

DataWindowChild dwchild

This.of_SetRowManager( TRUE )
This.of_SetReqColumn(TRUE)
This.of_SetTransObject(SQLCA)
//This.ShareData( dw_report )

This.GetChild( "action_type", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("Action Type")

This.GetChild( "action_dept", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("Action Department")

This.GetChild( "action_status", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("Action Status")

This.GetChild( "action_user", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve( )


This.of_SetDropDownCalendar( TRUE )
This.iuo_calendar.of_Register(this.iuo_calendar.DDLB)

//This.SetItem( 1, "action_status" , -111 )
//This.SetItem( 1, "action_type" , -3 )
//This.SetItem( 1, "action_date" , Today() )
//This.SetItem( 1, "action_user" , gs_user_id )
//This.SetItem( 1, "action_dept" , -102 )
//\/maha 101901
select lookup_code into :ll_action_type from code_lookup where lookup_name = 'Action Type' and code = 'App Rcvd Prac';
if ll_action_type = 0 then //maha added 012204 other are trapped elsewhere
	messagebox("Warning", "There is no Action Type with the code of App Rcvd Prac in the Action Type lookup table. This will cause the next Action to be entered to have an action type of 0")
end if
select lookup_code into :ll_action_status from code_lookup where lookup_name = 'Action Status' and code = 'Incomplete';
select lookup_code into :ll_action_dept from code_lookup where lookup_name = 'Action Department' and code = 'Credentialing';

This.SetItem( 1, "action_status" , ll_action_status )
This.SetItem( 1, "action_type" , ll_action_type )
This.SetItem( 1, "action_date" , Today() )
This.SetItem( 1, "action_user" , gs_user_id )
This.SetItem( 1, "action_dept" , ll_action_dept )
*/

//---------------------------- APPEON END ----------------------------

//dw_net_dev1.InsertRow( 0 )

////\/maha 101901
//select lookup_code into :ll_action_type from code_lookup where lookup_name = 'Action Type' and code = 'App Out To MD';
//select lookup_code into :ll_action_status from code_lookup where lookup_name = 'Action Status' and code = 'Complete';
//select lookup_code into :ll_action_dept from code_lookup where lookup_name = 'Action Department' and code = 'Credentialing';
////\maha
//This.SetItem( 2, "action_status" , ll_action_status )
//This.SetItem( 2, "action_type" , ll_action_type )
//This.SetItem( 2, "action_date" , Today() )
//This.SetItem( 2, "action_user" , gs_user_id )
//This.SetItem( 2, "action_dept" , ll_action_dept )
//
// MSKINNER 17 DEC 2005 -- BEGIN
THIS.OBJECT.B_NOTES.Visible = FALSE
THIS.OBJECT.BCONTACT.Visible = FALSE
THIS.OBJECT.NOTES.WIDTH = 987
// MSKINNER 17 DEC 2005 -- END 

end event

type cb_7 from commandbutton within tabpage_net_dev
integer x = 9
integer y = 1628
integer width = 389
integer height = 84
integer taborder = 21
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Add"
end type

event clicked;Integer li_nr

li_nr = tab_1.tabpage_net_dev.dw_net_dev1.InsertRow( 0 )
//Start Code Change ---- 06.18.2007 #V7 maha
of_copy_ai_values(li_nr)
//End Code Change---06.18.2007
tab_1.tabpage_net_dev.dw_net_dev1.SetFocus()
tab_1.tabpage_net_dev.dw_net_dev1.ScrollToRow( li_nr )
tab_1.tabpage_net_dev.dw_net_dev1.SetRow( li_nr )
end event

type cb_8 from commandbutton within tabpage_net_dev
integer x = 430
integer y = 1628
integer width = 389
integer height = 84
integer taborder = 31
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Delete"
end type

event clicked;tab_1.tabpage_net_dev.dw_net_dev1.DeleteRow( 0 )
IF tab_1.tabpage_net_dev.dw_net_dev1.RowCount() > 0 THEN
	tab_1.tabpage_net_dev.dw_net_dev1.SetRow( 1 )
	tab_1.tabpage_net_dev.dw_net_dev1.ScrollToRow( 1 )
	tab_1.tabpage_net_dev.dw_net_dev1.SetFocus()
END IF

end event

type cb_12 from commandbutton within tabpage_net_dev
integer x = 3035
integer y = 1608
integer width = 389
integer height = 84
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Next-->"
end type

event clicked;tab_1.SelectTab( 4 )
end event

type tabpage_gen from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 3438
integer height = 1760
long backcolor = 79741120
string text = "Populate & Print"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "RunReport5!"
long picturemaskcolor = 553648127
cbx_use_def_printer cbx_use_def_printer
cb_5 cb_5
cb_6 cb_6
cbx_exceptions cbx_exceptions
cb_13 cb_13
cb_14 cb_14
st_app st_app
cb_16 cb_16
end type

on tabpage_gen.create
this.cbx_use_def_printer=create cbx_use_def_printer
this.cb_5=create cb_5
this.cb_6=create cb_6
this.cbx_exceptions=create cbx_exceptions
this.cb_13=create cb_13
this.cb_14=create cb_14
this.st_app=create st_app
this.cb_16=create cb_16
this.Control[]={this.cbx_use_def_printer,&
this.cb_5,&
this.cb_6,&
this.cbx_exceptions,&
this.cb_13,&
this.cb_14,&
this.st_app,&
this.cb_16}
end on

on tabpage_gen.destroy
destroy(this.cbx_use_def_printer)
destroy(this.cb_5)
destroy(this.cb_6)
destroy(this.cbx_exceptions)
destroy(this.cb_13)
destroy(this.cb_14)
destroy(this.st_app)
destroy(this.cb_16)
end on

type cbx_use_def_printer from checkbox within tabpage_gen
integer x = 2391
integer y = 1584
integer width = 763
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Use Default/Previous Printer"
boolean checked = true
end type

event clicked;




if this.checked then 
	ib_no_dialog = true
else 
	
	ib_no_dialog = false
	
end if 
end event

event constructor;ib_no_dialog = true 
end event

type cb_5 from commandbutton within tabpage_gen
boolean visible = false
integer x = 9
integer y = 1660
integer width = 635
integer height = 84
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Printer &Setup"
end type

event clicked;PrintSetup()
end event

type cb_6 from commandbutton within tabpage_gen
integer y = 1660
integer width = 645
integer height = 84
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Generate Correspondence"
end type

event clicked;Integer li_rc

tab_1.tabpage_pl.dw_print.AcceptText()

li_rc = tab_1.tabpage_pl.dw_print.RowCount()

IF li_rc = 0 THEN
	MessageBox("Correspondence", "You have not selected any practitioners to print applicaton for!" )
	Return
END IF

Long ll_prac_id[]
Integer i
Integer li_cnt
Integer li_temp_facility_id

li_rc = tab_1.tabpage_pl.dw_print.RowCount()
FOR i = 1 TO li_rc
	IF tab_1.tabpage_pl.dw_print.GetItemNumber( i, "selected" ) = 1 THEN	
		li_cnt++
	END IF
END FOR
IF li_cnt = 0 THEN
	MessageBox("Selection Error", "Nothing selected to print." )
	Return -1
END IF	
li_cnt = 0
FOR i = 1 TO li_rc
	IF tab_1.tabpage_pl.dw_print.GetItemNumber( i, "selected" ) = 0 THEN	
		Continue
	END IF
	IF li_cnt = 0 THEN
		li_temp_facility_id = tab_1.tabpage_pl.dw_print.GetItemNumber( i, "facility_id" )
	ELSE
		IF tab_1.tabpage_pl.dw_print.GetItemNumber( i, "facility_id" ) <> li_temp_facility_id THEN
			MessageBox("Selection Error", "You can only print letters for groups of practitioners in the same facility." )
			Return -1
		END IF
	END IF
	li_cnt++
	ll_prac_id[ li_cnt ] = tab_1.tabpage_pl.dw_print.GetItemNumber( i, "prac_id" )
END FOR

Open( w_letter_generator )

ii_facility_id = li_temp_facility_id

//w_letter_generator.of_Net_Dev_Ltr( ll_prac_id[], ii_facility_id )

Return 0


end event

type cbx_exceptions from checkbox within tabpage_gen
integer x = 1632
integer y = 1584
integer width = 672
integer height = 68
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Include exceptions report"
end type

type cb_13 from commandbutton within tabpage_gen
integer x = 649
integer y = 1660
integer width = 402
integer height = 84
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Populate && Print"
end type

event clicked;of_print_email_app( "P" )
end event

type cb_14 from commandbutton within tabpage_gen
integer x = 1463
integer y = 1660
integer width = 402
integer height = 84
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Populate && Email"
end type

event clicked;of_print_email_app( "E" )


end event

type st_app from statictext within tabpage_gen
integer x = 18
integer y = 1600
integer width = 1280
integer height = 60
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
boolean focusrectangle = false
end type

type cb_16 from commandbutton within tabpage_gen
integer x = 1056
integer y = 1660
integer width = 402
integer height = 84
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Populate && Fax"
end type

event clicked;of_print_email_app( "F" )
end event


Start of PowerBuilder Binary Data Section : Do NOT Edit
09pfc_cst_u_print_app.bin 
2B00000600e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe00000006000000000000000000000001000000010000000000001000fffffffe00000000fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdfffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000fffffffe00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
19pfc_cst_u_print_app.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
