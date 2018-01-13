$PBExportHeader$w_batch_add_insurance.srw
forward
global type w_batch_add_insurance from w_master
end type
type dw_select_section from datawindow within w_batch_add_insurance
end type
type dw_table from datawindow within w_batch_add_insurance
end type
type dw_pracs from datawindow within w_batch_add_insurance
end type
type cb_3 from commandbutton within w_batch_add_insurance
end type
type st_2 from statictext within w_batch_add_insurance
end type
type dw_batchlist from datawindow within w_batch_add_insurance
end type
type dw_list from datawindow within w_batch_add_insurance
end type
type rb_ins from radiobutton within w_batch_add_insurance
end type
type rb_add from radiobutton within w_batch_add_insurance
end type
type cb_1 from commandbutton within w_batch_add_insurance
end type
type gb_3 from groupbox within w_batch_add_insurance
end type
type dw_3 from datawindow within w_batch_add_insurance
end type
type dw_2 from datawindow within w_batch_add_insurance
end type
type dw_detail from u_dw within w_batch_add_insurance
end type
type st_1 from statictext within w_batch_add_insurance
end type
type dw_verifww from datawindow within w_batch_add_insurance
end type
type dw_verif from u_dw within w_batch_add_insurance
end type
end forward

global type w_batch_add_insurance from w_master
integer width = 3653
integer height = 2332
string title = "Batch Add Data"
long backcolor = 79680469
boolean ib_disableclosequery = true
dw_select_section dw_select_section
dw_table dw_table
dw_pracs dw_pracs
cb_3 cb_3
st_2 st_2
dw_batchlist dw_batchlist
dw_list dw_list
rb_ins rb_ins
rb_add rb_add
cb_1 cb_1
gb_3 gb_3
dw_3 dw_3
dw_2 dw_2
dw_detail dw_detail
st_1 st_1
dw_verifww dw_verifww
dw_verif dw_verif
end type
global w_batch_add_insurance w_batch_add_insurance

type variables
long il_pracid
long il_pracs[]
integer ii_clinid
integer ii_facid
integer ii_facs[]
integer ii_screen
long il_status
long il_reqst
string is_clin_filter
string is_prac_name
integer ii_message
//--------------------------- APPEON BEGIN ---------------------------
//$<add> 10.17.2006 By: Jack (Inova)
//$<reason> Required Documents Check Box on Data Entry Screen
string is_reference
//---------------------------- APPEON END ----------------------------

end variables

forward prototypes
public function integer of_create_verif (string as_reference)
public function string of_prac_name (long ai_pracid)
end prototypes

public function integer of_create_verif (string as_reference);/*There is an issue with verifications created for facility specific data screens.
If the verifying facility is common across parents, multiple verifs could be connected to the same
verifying facility.  
*///04-2002
Integer li_nr
Integer li_nr2 //maha 010401
Integer li_row_cnt
Integer li_rc
Integer i
Integer r
Integer ll_hc_code
long li_seq_no
Integer li_rsp_rc
Integer li_facility_id
Long ll_default_verif_method
String ls_identifying_number
string ls_facility_name//maha 011001
String ls_doc_id
String ls_priority_user
Integer li_priority
integer li_dupe_check //maha 010401
string ls_primary_check //maha 010901
integer li_isprime //maha 010901
string ls_screen_name //maha 010401
string ls_appt_type = "R" //maha 012401
string ls_verif_data //maha 012401
datetime ld_verifdate //maha 010901
datetime ld_dr //jad 06/03/02
integer resp //maha 010901
integer li_parent_id //maha 020901
integer li_date_check //maha 010901
integer li_fac_ids//maha 011001
integer pc//maha 011001
integer pi//maha 011001
integer li_end_year//maha 012301
integer li_end_month//maha 012301
integer li_end_day// maha 031201
integer li_check_back_years
date ld_hosp_check_date//maha 012201
date ld_data_check_date//maha 031501
integer li_prime_check//maha 012201
string ls_mes //maha 111308
long ll_address_lookup_code
long ll_prac
long ll_rec
string ls_add_type = "A"
string ls_prac
n_ds lds_ver_orgs_facilities
n_ds lds_last_verif_seq_no
n_ds lds_dfl_rsp_code
n_ds lds_parent_facilities//maha 011201
n_ds lds_verif_facilities//maha 011201

ll_address_lookup_code = dw_detail.getitemnumber(1,"carrier_code")
IF ll_address_lookup_code = 0 THEN
	SetNull( ll_address_lookup_code )
END IF

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-01
//$<add> 02.13.2006 By: Wangchao
//$<reason> Performance tuning
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

gnv_appeondb.of_startqueue( )

//---------------------------- APPEON END ----------------------------

ll_prac = dw_detail.GetItemNumber( 1, "prac_id" ) 
ll_rec = dw_detail.GetItemNumber( 1, "rec_id" )
//ls_identifying_number = Mid( as_reference, POS( as_reference, "-") + 2, 100 )
lds_dfl_rsp_code = CREATE n_ds
lds_dfl_rsp_code.DataObject = "d_app_audit_get_hc_dflt_ver_resp_code"
lds_dfl_rsp_code.of_SetTransObject( SQLCA )
lds_dfl_rsp_code.Retrieve( ll_prac, 15, ls_identifying_number )

//get list of verifying facilities //maha 012001
lds_verif_facilities = CREATE n_ds
lds_verif_facilities.DataObject = "d_verifying_orgs_facilities_of_pract"
lds_verif_facilities.of_SetTransObject( SQLCA )


lds_verif_facilities.Retrieve( ll_prac,10 )
//<add> 07/03/2007 by: Andy set sort first
lds_verif_facilities.setsort("verifying_facility A")
lds_verif_facilities.sort()
//end of add

lds_ver_orgs_facilities = CREATE n_ds
lds_ver_orgs_facilities.DataObject = "d_verifying_orgs_facilities_all"
lds_ver_orgs_facilities.of_SetTransObject( SQLCA )
lds_ver_orgs_facilities.retrieve()

lds_parent_facilities = CREATE n_ds
lds_parent_facilities.DataObject = "d_verifying_parents_of_vers_all"
lds_parent_facilities.of_SetTransObject( SQLCA )
lds_parent_facilities.retrieve()

lds_last_verif_seq_no = CREATE n_ds
lds_last_verif_seq_no.DataObject = "d_last_verif_seq_no_all"
lds_last_verif_seq_no.of_SetTransObject( SQLCA )
lds_last_verif_seq_no.retrieve()

gnv_appeondb.of_commitqueue( )

li_rc = lds_verif_facilities.rowcount()
//create verification for each verifying facility //maha 012001
IF li_rc = 0 THEN			//maha message changed 072202 to be more meaningful.
	MessageBox("Error in function of_create_verif of w_batch_add_insurance", "No active affiliation status records found.  Be sure there is an active appointment status record for this practitioner." )//+ "  facility =" + string(ii_facility_id) + "  prac =" + string(al_prac_id) + "  Screen =" + string(al_screen_id))
	//MessageBox("Error", "This practitioner is not in the verification process, therefore no verification records can be added." )
	Return -1
END IF
li_rsp_rc = lds_dfl_rsp_code.rowcount()

//---------------------------- APPEON END ----------------------------

ll_prac = dw_detail.GetItemNumber( 1, "prac_id" ) 
ll_rec = dw_detail.GetItemNumber( 1, "rec_id" )

//<add> 07/03/2007 by: Andy
Integer li_facility_id_first = -1
//end of add

FOR i = 1 TO li_rc//li_ver_fac_cnt
	li_date_check = 0
	li_facility_id = lds_verif_facilities.GetItemNumber( i, "verifying_facility" )
	ls_facility_name = lds_verif_facilities.GetItemstring( i, "facility_name" )
	ls_verif_data = lds_verif_facilities.GetItemstring( i, "verify_data" )
	if ls_verif_data = "N" then continue	
	//MESSAGEBOX("",ls_facility_name)
		//\/maha 010901
		
	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> PT-03
	//$<modify> 02.13.2006 By: Wangchao
	//$<reason> Performance tuning
	//$<modification> Write script to retrieve data from a cache instead of from the database.

	
	/*
	pc = lds_parent_facilities.retrieve(li_facility_id,ll_prac)
	*/
	
	lds_parent_facilities.setfilter('verifying_facility='+string(li_facility_id)+' and prac_id='+string(ll_prac))
	lds_parent_facilities.filter()
	pc=lds_parent_facilities.rowcount()
	
	//---------------------------- APPEON END ----------------------------
	
	if pc < 1 then messagebox("Error","No retrieval on parents of verif facility")
	//checking all parents appttype to see if verif should be created maha 012401
			ls_appt_type = "R"
	for pi = 1 to pc
		if ls_appt_type = "R" and lds_parent_facilities.GetItemstring( pi, "apptmnt_type" )  = "I" then
			ls_appt_type = "I"
		end if
		//checking verifs completed date for all parents		
		ld_verifdate = lds_parent_facilities.GetItemdatetime( pi, "date_verif_completed" )
		if not(isnull(ld_verifdate)) then
			li_date_check = 1		
			exit
		end if
	next
	//if ALL parents are recred and data item is Inital only, don't create.
	if ls_verif_data = "I" and ls_appt_type = "R" then continue

	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> PT-04
	//$<modify> 02.13.2006 By: Wangchao
	//$<reason> Performance tuning
	//$<modification> Write script to retrieve data from a cache instead of from the database.

	
//Start Code Change ---- 10.16.2007 #V7 maha
//because this was poorly implemented and never tested, reverting to original code
	if li_date_check = 1 then
		//Start Code Change ----11.03.2008 #V85 maha = added option for yes or no all
		if ii_message < 2 then // 0 =  no or first time; yes = 1;    3 = yes all;      4 = no all
			ls_prac = of_prac_name(ll_prac)
			ls_mes = "The verification process has been completed for all Appointments for the verifying facility " + ls_facility_name + " for practitioner " + ls_prac + " . Do you want to add the verification item?"
			openwithparm(w_verif_compl_message,ls_mes)
			ii_message = message.doubleparm
			if ii_message = 0 or ii_message = 4 then continue //no or no all
		end if
		//resp = messagebox("Verifications Completed" ,"The verification process has been completed for all Appointments for the verifying facility " + ls_facility_name + " for practitioner " + ls_prac + " . Do you want to add the verification item.",question!,yesno!,2)
		//if resp = 2 then continue
	end if
	//End Code Change---11.13.2008
	
//	long ll_r
//	if li_date_check = 1 then
//			ll_r = lds_prac.find('prac_id='+string(ll_prac),1,lds_prac.rowcount())
//			ls_prac = lds_prac.getitemstring( ll_r,'full_name')
//			resp = messagebox("Verifications Completed" ,"The verification process has been completed for all Appointments for the verifying facility " + ls_facility_name + " for practitioner " + ls_prac + " . Do you want to add the verification item.",question!,yesno!,2)
//		if resp = 2 then continue
//	end if
//End Code Change---10.16.2007	
	//---------------------------- APPEON END ----------------------------
	
	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> PT-05
	//$<modify> 02.13.2006 By: Wangchao
	//$<reason> Performance tuning
	//$<modification> Write script to retrieve data from a cache instead of from the database.

	
	/*
	r = lds_ver_orgs_facilities.Retrieve( li_facility_id, ll_prac, 15 )
	*/
	
	lds_ver_orgs_facilities.setfilter('verifying_facility='+string(li_facility_id)+' and prac_id='+string(ll_prac)+' and screen_id=15')
	lds_ver_orgs_facilities.filter()
	r=lds_ver_orgs_facilities.rowcount()
	
	//---------------------------- APPEON END ----------------------------
	
	if r < 1 then continue
	IF lds_ver_orgs_facilities.GetItemString( r, "verify_data" ) = "N" AND ls_add_type = "A" THEN
			CONTINUE
		END IF

		
		ll_default_verif_method = lds_ver_orgs_facilities.GetItemNumbeR( r, "default_verif_means" )		

	li_nr = dw_verif.InsertRow( 0 )
	ls_priority_user = lds_ver_orgs_facilities.GetItemString( r, "priority_user" )	
	li_priority = lds_ver_orgs_facilities.GetItemNumber( r, "priority" )	
 
	dw_verif.SetItem( li_nr, "prac_id", ll_prac )
	dw_verif.SetItem( li_nr, "rec_id", ll_rec )
	//dw_verif.SetItem( li_nr, "facility_id", li_facility_id )
	dw_verif.SetItem( li_nr, "verif_info_facility_id", li_facility_id )
	dw_verif.SetItem( li_nr, "priority_user", ls_priority_user )
	dw_verif.SetItem( li_nr, "priority", li_priority )
	dw_verif.SetItem( li_nr, "number_sent", 0 )
	dw_verif.SetItem( li_nr, "exp_credential_flag", 0)
	dw_verif.SetItem( li_nr, "active_status", 1)
	dw_verif.SetItem( li_nr, "verif_info_data_status", dw_detail.getitemnumber(1,"active_status") ) //Start Code Change ----08.04.2008 #V85 maha - added data_status update

	//06/03/02
	//added in for IntelliApp only users,  need this entry auto verified so intellicred can gen exp letters when due
	IF Upper( gs_cust_type ) = 'I' THEN
			  dw_verif.SetItem( li_nr, "response_code", 326 )		
			  ld_dr = DateTime( Today(), Now() )
			  dw_verif.SetItem( li_nr, "date_recieved", ld_dr )					  
			  dw_verif.SetItem( li_nr, "user_name", 'System' )					  			  
	END IF	
		
	IF li_rsp_rc = 1 THEN
		dw_verif.SetItem( li_nr, "response_code", lds_dfl_rsp_code.GetItemNumber( 1, "default_ver_response" ))
		dw_verif.SetItem( li_nr, "user_name", ls_priority_user )
		dw_verif.SetItem( li_nr, "date_recieved", Today() )
		
		//--------------------------- APPEON BEGIN ---------------------------
		//$<ID> PT-06
		//$<modify> 02.13.2006 By: Wangchao
		//$<reason> Performance tuning
		//$<modification> Write script to retrieve data from a cache instead of from the database.

		
		/*
		SELECT code_lookup.lookup_code  
      INTO :ll_hc_code  
      FROM code_lookup  
      WHERE code_lookup.code = 'Hard Copy'   ;
		*/
				
		ll_hc_code = Long(gnv_data.of_getitem('code_lookup','lookup_code','code="Hard Copy"'))
		
		//---------------------------- APPEON END ----------------------------

		dw_verif.SetItem( li_nr, "verification_method", ll_hc_code )				

		//added in for IntelliApp only users,  need this entry auto verified so intellicred can gen exp letters when due
		IF Upper( gs_cust_type ) = 'I' THEN
			  dw_verif.SetItem( li_nr, "response_code", 326 )		
			  ld_dr = DateTime( Today(), Now() )
			  dw_verif.SetItem( li_nr, "date_recieved", ld_dr )					  
			  dw_verif.SetItem( li_nr, "user_name", 'System' )					  			  
		END IF
	ELSE
		dw_verif.SetItem( li_nr, "verification_method", ll_default_verif_method )		
	END IF
	//find out the last seq no used

	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> PT-07
	//$<modify> 02.13.2006 By: Wangchao
	//$<reason> Performance tuning
	//$<modification> Write script to retrieve data from a cache instead of from the database.

		
	/*	
	li_row_cnt = lds_last_verif_seq_no.Retrieve( ll_rec, ll_prac, li_facility_id )
	*/
	//<add> 07/03/2007 by: Andy. 
	//attention:set sort first
	if li_facility_id_first = li_facility_id then 
		li_seq_no++
	else
	//end of add
		lds_last_verif_seq_no.setfilter('rec_id='+string(ll_rec)+' and prac_id='+string(ll_prac)+' and facility_id='+string(li_facility_id))
		lds_last_verif_seq_no.filter()
		li_row_cnt = lds_last_verif_seq_no.rowcount()
		
		//---------------------------- APPEON END ----------------------------
		
		IF li_row_cnt < 1 THEN
			li_seq_no = 1 
		ELSE
			li_seq_no = lds_last_verif_seq_no.GetItemNumber( 1, "last_seq_no" ) + 1
		END IF
		if isnull(li_seq_no) then 	li_seq_no = 1	//maha 091900
		//<add> 07/03/2007 by: Andy.
		li_facility_id_first = li_facility_id
	end if
	//end of add
	
	dw_verif.SetItem( li_nr, "seq_no", li_seq_no )
		
	dw_verif.SetItem( li_nr, "screen_id", 15)
	dw_verif.SetItem( li_nr, "reference_value",mid(as_reference,1,100)) //maha added mid 022504 as trap for overlong values.as_reference )
	dw_verif.SetItem( li_nr, "expiration_date", dw_detail.getitemdatetime(1,"coverage_to"))
	dw_verif.SetItem( li_nr, "screen_name", "Insurance" )
	dw_verif.SetItem( li_nr, "address_lookup_code", dw_detail.getitemnumber(1,"carrier_code") )
	ls_doc_id = String( ll_rec ) + "-" + String( ll_prac ) + "-" + String( li_facility_id ) +  "-" + String( li_seq_no )
	dw_verif.SetItem( li_nr, "doc_id", ls_doc_id )
	
	
	//\/maha added for pix last updated 041801
	//check to see if letter should be duplicated

END FOR

dw_verif.SetFocus()
dw_verif.ScrollToRow( li_nr )
dw_verif.SetRow( li_nr )

DESTROY lds_ver_orgs_facilities
DESTROY lds_parent_facilities
DESTROY lds_verif_facilities
DESTROY lds_last_verif_seq_no
DESTROY lds_dfl_rsp_code

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-08
//$<add> 02.14.2006 By: Wangchao
//$<reason> Performance tuning
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

gnv_appeondb.of_startqueue( )

//---------------------------- APPEON END ----------------------------

resp = dw_verif.Update()
if resp < 1 then //maha 072204
	messagebox("Update failure" ,"Update failed in of_add_record of pfc_cst_u_verification_info")
else
	commit using sqlca;
end if

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-09
//$<add> 02.14.2006 By: Wangchao
//$<reason> Performance tuning
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

gnv_appeondb.of_commitqueue( )

//---------------------------- APPEON END ----------------------------

RETURN 1
end function

public function string of_prac_name (long ai_pracid);string ls_prac_name

//_pracs.retrieve(il_pracs[])
select full_name into :ls_prac_name from v_full_name where prac_id = :ai_pracid;
//is_prac_name = ls_prac_name

return  ls_prac_name
end function

event open;call super::open;integer li_facility_id
integer s
integer f
datawindowchild dwchild

//--------------------------- APPEON BEGIN ---------------------------
//$<PT-10>
//$<modify> 02.10.2006 By: Wangchao
//$<reason> Performance tuning
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

/*
il_pracid = message.doubleparm
of_prac_name(il_pracid)

dw_detail.settransobject(sqlca)
dw_detail.GetChild( "carrier_code", dwchild )
dwchild.settransobject(sqlca)
dwchild.retrieve("Insurance Companies")
dwchild.insertrow(1)
dw_detail.GetChild( "claims_made_occurrence", dwchild )
dwchild.settransobject(sqlca)
dwchild.retrieve("Coverage Type")
dwchild.insertrow(1)

dw_select_section.settransobject(sqlca)
s = dw_select_section.retrieve(1)
*/

il_pracid = message.doubleparm

//of_prac_name(il_pracid)

dw_detail.GetChild( "claims_made_occurrence", dwchild )
dwchild.settransobject(sqlca)
gnv_data.of_set_dwchild_fromcache("code_lookup" , "upper(lookup_name) = '" + upper('Coverage Type') + "'", dwchild)
dwchild.insertrow(1)
dw_detail.settransobject(sqlca)
dw_detail.GetChild( "carrier_code", dwchild )
dwchild.settransobject(sqlca)

dw_select_section.settransobject(sqlca)

gnv_appeondb.of_startqueue( )

dwchild.retrieve("Insurance Companies")
dw_select_section.retrieve(1)

gnv_appeondb.of_commitqueue( )

//---------------------------- APPEON END ----------------------------

dwchild.insertrow(1)
s=dw_select_section.rowcount()

dw_select_section.setfilter("screen_id = 15")
dw_select_section.filter()
//if f < 1 then
//	messagebox("Error","No Find")
//else
//	dw_select_section.scrolltorow(f)
//	dw_select_section.setrow(f)
//end if

dw_detail.insertrow(1)
dw_detail.setitem(1,"active_status",1)
dw_verif.settransobject(sqlca)
end event

on w_batch_add_insurance.create
int iCurrent
call super::create
this.dw_select_section=create dw_select_section
this.dw_table=create dw_table
this.dw_pracs=create dw_pracs
this.cb_3=create cb_3
this.st_2=create st_2
this.dw_batchlist=create dw_batchlist
this.dw_list=create dw_list
this.rb_ins=create rb_ins
this.rb_add=create rb_add
this.cb_1=create cb_1
this.gb_3=create gb_3
this.dw_3=create dw_3
this.dw_2=create dw_2
this.dw_detail=create dw_detail
this.st_1=create st_1
this.dw_verifww=create dw_verifww
this.dw_verif=create dw_verif
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_select_section
this.Control[iCurrent+2]=this.dw_table
this.Control[iCurrent+3]=this.dw_pracs
this.Control[iCurrent+4]=this.cb_3
this.Control[iCurrent+5]=this.st_2
this.Control[iCurrent+6]=this.dw_batchlist
this.Control[iCurrent+7]=this.dw_list
this.Control[iCurrent+8]=this.rb_ins
this.Control[iCurrent+9]=this.rb_add
this.Control[iCurrent+10]=this.cb_1
this.Control[iCurrent+11]=this.gb_3
this.Control[iCurrent+12]=this.dw_3
this.Control[iCurrent+13]=this.dw_2
this.Control[iCurrent+14]=this.dw_detail
this.Control[iCurrent+15]=this.st_1
this.Control[iCurrent+16]=this.dw_verifww
this.Control[iCurrent+17]=this.dw_verif
end on

on w_batch_add_insurance.destroy
call super::destroy
destroy(this.dw_select_section)
destroy(this.dw_table)
destroy(this.dw_pracs)
destroy(this.cb_3)
destroy(this.st_2)
destroy(this.dw_batchlist)
destroy(this.dw_list)
destroy(this.rb_ins)
destroy(this.rb_add)
destroy(this.cb_1)
destroy(this.gb_3)
destroy(this.dw_3)
destroy(this.dw_2)
destroy(this.dw_detail)
destroy(this.st_1)
destroy(this.dw_verifww)
destroy(this.dw_verif)
end on

event closequery;
//--------------------------- APPEON BEGIN ---------------------------
//$<add> 2005-11-15 By: Zhang Lingping
//$<reason> The datawindow "dw_batchlist"  does not need save.
dw_batchlist.reset()
return super::event closequery() 
//---------------------------- APPEON END ----------------------------


end event

event pfc_save;/******************************************************************************************************************
**  [PUBLIC]   : 
**==================================================================================================================
**  Purpose   	: 
**==================================================================================================================
**  Arguments 	: [none] 
**==================================================================================================================
**  Returns   	: [none]   
**==================================================================================================================
**  Notes     	: 	   
**==================================================================================================================
**  Created By	: Michael B. Skinner 21 December 2005  © Intellisoftgroup, Inc
**==================================================================================================================
**  Modification Log
**   Changed By             Change Date                                               Reason
** ------------------------------------------------------------------------------------------------------------------
********************************************************************************************************************/

// override
if dw_pracs.rowcount( ) > 0 then 
     super::event pfc_save()
end if

return success
end event

type dw_select_section from datawindow within w_batch_add_insurance
boolean visible = false
integer x = 69
integer y = 1892
integer width = 343
integer height = 300
integer taborder = 120
string dataobject = "d_data_view_screens_list"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_table from datawindow within w_batch_add_insurance
boolean visible = false
integer x = 928
integer y = 88
integer width = 1088
integer height = 92
integer taborder = 90
string dataobject = "d_table_list"
boolean border = false
boolean livescroll = true
end type

event itemchanged;integer r
string find
datawindowchild dwchild

ii_screen = integer(data)

//messagebox("",ii_screen)
//dw_crit1.settransobject(sqlca)
//dw_crit1.retrieve(ii_screen)
//dw_crit1.GetChild( "data_view_fields_screen_id", dwchild )

//is_sql_syntax = inv_data_entry.of_create_dynamic_dw( il_prac_id, ll_data_view_id, ii_screen_id, dw_detail, dw_browse, ib_screen_painter, ii_parent_facility_id )
//is_first_column_detail_1 = inv_data_entry.of_get_first_column()
end event

type dw_pracs from datawindow within w_batch_add_insurance
integer x = 23
integer y = 196
integer width = 846
integer height = 1920
integer taborder = 130
boolean titlebar = true
string title = "Practittoners"
string dataobject = "d_practitioner_list"
boolean livescroll = true
end type

event clicked;integer r

r  = this.getclickedrow()
if r < 1 then return

this.setrow(r)
this.selectrow(0,false)
this.selectrow(r,true)

il_pracid = this.getitemnumber(r,"prac_id")
//messagebox("il_pracid",il_pracid)
//dw_browse.settransobject(sqlca)
//dw_browse.retrieve(il_prac,ii_facil)
//of_retrieve_data(is_ret_type)
end event

type cb_3 from commandbutton within w_batch_add_insurance
integer x = 2619
integer y = 88
integer width = 645
integer height = 84
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "3) Add for Each Practitioner"
end type

event clicked;long recid
long prac
long i
long ic
integer res
//--------------------------- APPEON BEGIN ---------------------------
//$<add> 10.17.2006 By: Jack (Inova)
//$<reason> Required Documents Check Box on Data Entry Screen.
long ll_prac_id[]
long ll_rec_id[]
long ll_screen_id
//---------------------------- APPEON END ----------------------------


dw_detail.accepttext()
//check data
ic = dw_pracs.rowcount()

if ic < 1 then
	messagebox("No practitioners","Please select a Batch list of practitioners.  If no exists create one IntelliBatch first.")
	return
end if
if isnull(dw_detail.getitemnumber(1,"carrier_code")) then
	messagebox("No Insurance Company","Insurance Company required; Please select.")
	dw_detail.setfocus()
	dw_detail.setcolumn("carrier_code")
	return
end if
if isnull(dw_detail.getitemstring(1,"policy_number")) then
	messagebox("No Policy Number","Policy Number required; Please enter.")
	dw_detail.setfocus()
	dw_detail.setcolumn("policy_number")
	return
end if
if isnull(dw_detail.getitemdatetime(1,"coverage_to")) then
	messagebox("No Expiration Date","Expiration Date required; Please enter.")
	dw_detail.setfocus()
	dw_detail.setcolumn("coverage_to")
	return
end if

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-11
//$<modify> 02.21.2006 By: owen chen
//$<reason> Performance tuning
//$<modification> Define a variable to 1)get the first ID; 2)Update the final ID
//$<modification> value into database 

/*
recid = gnv_app.of_get_id( "RECORD_ID" )
*/
recid = gnv_app.of_get_id( "RECORD_ID" ,ic) - 1
//---------------------------- APPEON END ----------------------------

for i = 1 to  ic
	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> PT-12
	//$<modify> 02.21.2006 By: owen chen
	//$<reason> Performance tuning.
	//$<modification> Comment out the following script to reduce client-server interaction.
	//$<modification> refer to PT-11 and of_get_id for more information.
	/*
	recid = gnv_app.of_get_id( "RECORD_ID" )
	*/
	recid ++
	//---------------------------- APPEON END ----------------------------

	prac = dw_pracs.getitemnumber(i,"prac_id")

	dw_detail.SetItemStatus ( 1,0, primary!, Newmodified! )
	dw_detail.setitem(1,"prac_id",prac)
	dw_detail.setitem(1,"rec_id",recid)

	res = dw_detail.triggerevent("pfc_preupdate")
	
	if res = 1 then dw_detail.update()
	//--------------------------- APPEON BEGIN ---------------------------
	//$<add> 10.17.2006 By: Jack (Inova)
	//$<reason> Required Documents Check Box on Data Entry Screen.
	ll_prac_id[i] = prac
	ll_rec_id[i] = recid
	//---------------------------- APPEON END ----------------------------

//for eac prac:
//Done in preupdate event
//add data record
//
//add audit record
//
//add verifications

next
//--------------------------- APPEON BEGIN ---------------------------
//$<add> 10.17.2006 By: Jack (Inova)
//$<reason> Required Documents Check Box on Data Entry Screen.
pfc_cst_nv_data_entry_functions lnv_data_entry
lnv_data_entry = create pfc_cst_nv_data_entry_functions
ll_screen_id = 15
lnv_data_entry.of_create_application_audit_record('New',ll_prac_id,ll_screen_id,ll_rec_id,is_reference)
destroy lnv_data_entry

//---------------------------- APPEON END ----------------------------


messagebox("Batch add","Data added for " + string(ic) + " Practitioners")

end event

type st_2 from statictext within w_batch_add_insurance
integer x = 32
integer y = 120
integer width = 430
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "1) Select Batch List"
boolean focusrectangle = false
end type

type dw_batchlist from datawindow within w_batch_add_insurance
integer x = 27
integer y = 24
integer width = 841
integer height = 84
integer taborder = 70
string dataobject = "d_d_batch_list"
boolean border = false
boolean livescroll = true
end type

event constructor;this.settransobject(sqlca)
this.retrieve()
this.insertrow(1) 
end event

event itemchanged;
long ll_batch
integer i
integer ic

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 2005-11-15 By: Zhang Lingping
//$<reason> The array il_pracs is  not set to null before use it again.
integer ia_null[]

il_pracs[] = ia_null[]

//---------------------------- APPEON END ----------------------------

ll_batch = long(data)


dw_list.settransobject(sqlca)
ic = dw_list.retrieve(ll_batch)

dw_pracs.settransobject(sqlca)
if ic > 0 then
	for i = 1 to ic
		il_pracs[i] = dw_list.getitemnumber(i,"prac_id")
	next
	
	dw_pracs.retrieve(il_pracs[])
//--------------------------- APPEON BEGIN ---------------------------
//$<add> 2005-11-16 By: Liang QingShi
//$<reason> The dw_pracs is not reset.

else
	dw_pracs.reset()
//---------------------------- APPEON END ----------------------------

end if

//dw_list.InsertRow( 1 )
//dw_list.GetChild( "full_name", dwchild )
//dwchild.settransobject(sqlca)
//dwchild.retrieve(ll_batch)

end event

type dw_list from datawindow within w_batch_add_insurance
boolean visible = false
integer x = 471
integer y = 188
integer width = 361
integer height = 80
integer taborder = 100
string dataobject = "d_batch_items_prac_list"
boolean border = false
boolean livescroll = true
end type

event itemchanged;il_pracid = long(data)

//of_prac_name(il_pracid)
end event

type rb_ins from radiobutton within w_batch_add_insurance
integer x = 1335
integer y = 88
integer width = 448
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Insurance"
boolean checked = true
end type

type rb_add from radiobutton within w_batch_add_insurance
boolean visible = false
integer x = 2240
integer y = 140
integer width = 407
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Address"
end type

type cb_1 from commandbutton within w_batch_add_insurance
integer x = 3310
integer y = 88
integer width = 247
integer height = 84
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Close"
end type

event clicked;parent.event pfc_close( )
end event

type gb_3 from groupbox within w_batch_add_insurance
integer x = 1285
integer y = 32
integer width = 1138
integer height = 140
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 67108864
string text = "Select Table"
end type

type dw_3 from datawindow within w_batch_add_insurance
boolean visible = false
integer x = 1705
integer y = 216
integer width = 242
integer height = 56
integer taborder = 110
string dataobject = "d_distinct_clin_for_prac"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_2 from datawindow within w_batch_add_insurance
boolean visible = false
integer x = 2062
integer y = 32
integer width = 265
integer height = 80
integer taborder = 30
string dataobject = "d_prac_priv_list_clin_area"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_detail from u_dw within w_batch_add_insurance
integer x = 901
integer y = 196
integer width = 2674
integer height = 1920
integer taborder = 10
string dataobject = "d_insurance_batchadd"
boolean hscrollbar = true
end type

event pfc_preupdate;call super::pfc_preupdate;String ls_screen_name
String ls_ref_1
String ls_val
String ls_ref_2
String ls_ref_3
String ls_exp_field
String ls_reference
String ls_rec_status
DateTime ldt_exp_date
DateTime ldt_null_date
Long ll_rec_id
Long ll_address_code
Long ll_seq_no
Integer li_table_id
Integer li_facility_specific
Integer li_screen_id
Integer li_current_row
Integer i
Integer li_cnt
Integer li_rec_count
Integer il_last_de_row
Integer il_last_row
Integer p
Long il_rec_id
Long il_prac_id
Long li_found
Integer li_data_cr
Integer li_verif_rc
Integer li_retval
Integer li_year //maha031601
Integer li_month//maha031601
Integer li_validate//maha080803
String ls_type1//maha102501
String ls_type2//maha102501
String ls_type3//maha102501
pfc_cst_nv_data_entry_functions inv_data_entry

inv_data_entry = Create pfc_cst_nv_data_entry_functions

DataWindowChild dwchild

SetNull( ldt_null_date )

dw_detail.AcceptText()

il_last_de_row = dw_detail.GetRow()

li_data_cr = dw_detail.GetRow()
il_last_row = 1 //dw_select_section.getrow()

ls_ref_1 = dw_select_section.GetItemString( il_last_row, "ref_field_1")
ls_ref_2 = dw_select_section.GetItemString( il_last_row, "ref_field_2")
ls_ref_3 = dw_select_section.GetItemString( il_last_row, "ref_field_3")

ls_type1 = dw_select_section.GetItemString( il_last_row, "ref_1_type") //maha102501
ls_type2 = dw_select_section.GetItemString( il_last_row, "ref_2_type")//maha102501
ls_type3 = dw_select_section.GetItemString( il_last_row, "ref_3_type")//maha102501

ls_exp_field = dw_select_section.GetItemString( il_last_row, "exp_field")
//messagebox("ls_exp_field",ls_exp_field)
li_screen_id = dw_select_section.GetItemNumber( il_last_row, "screen_id")
ls_screen_name = dw_select_section.GetItemString( il_last_row, "screen_name")

li_rec_count = dw_detail.RowCount()

If li_rec_count < 1 Then
	Return -1
End If

If li_rec_count < 1 Then
	MessageBox("","Please select a practitioner list")
	Return -1
End If
i = 1
//FOR p = 1 TO li_rec_count

SetNull( ll_address_code )



ls_rec_status = "New"

il_prac_id = dw_pracs.GetItemNumber(i,"prac_id")
ll_rec_id = dw_detail.GetItemNumber( i, "rec_id" )
//debugbreak()	

If ii_screen = 4 Or ii_screen = 15 Or ii_screen = 5 Then
	//IF dw_detail.Describe( "active_status.dddw.name" ) = 'd_code_lookup_active_inactive' THEN
	If dw_detail.GetItemNumber( i, "active_status" ) = 0 Then
		If ls_rec_status = "New" Then
			Return 1
		Else //\/maha 031601
			Update verif_info
				Set active_status = 0
				Where rec_id = :ll_rec_id And active_status = 1;
			Return 1		 //\maha
		End If
	End If
	//END IF
End If


li_table_id = dw_select_section.GetItemNumber( dw_select_section.GetRow(), "table_id" )


//verification data
If Not IsNull( ls_ref_1 ) And ls_ref_1 <> "" Then
	dw_detail.ScrollToRow( i )
	dw_detail.SetRow( i )
	
	//move expiration date to verif info table if there is one
	If Len(ls_exp_field) > 0 Then
		If ls_exp_field = "certification_expires" Then
			ldt_exp_date = DateTime(Date( "12-30-" + String( dw_detail.GetItemNumber( i, ls_exp_field ) ) ),Now()) //maha changed 080101
			//ldt_exp_date = DateTime(Date( "1-1-" + String( dw_detail.GetItemNumber( i, ls_exp_field ) ) ),Now())
		ElseIf ls_exp_field = "cert_expiration_year" Then
			li_month = dw_detail.GetItemNumber( i, "cert_expiration_month" )
			If IsNull(li_month) Then
				ldt_exp_date = DateTime(Date( "12-30-" + String( dw_detail.GetItemNumber( i, ls_exp_field ) ) ),Now()) //maha 061402 fo spec. certs
			Else
				ldt_exp_date = DateTime(Date(String(li_month) + "-28-" + String( dw_detail.GetItemNumber( i, ls_exp_field ) ) ),Now())
			End If
		Else
			ldt_exp_date = dw_detail.GetItemDateTime( i, ls_exp_field )
		End If
	Else
		ldt_exp_date = ldt_null_date
	End If
	
	//get reference 1 data
	
	If dw_detail.Describe(ls_ref_1 + ".ColType") = "!"  Or ls_ref_1 = "" Then //trap for invisible field maha 012104 
		MessageBox("Problem getting reference 1 value for verification","Required Field " + ls_ref_1 + " is invisible.  The verification will not be created.  Contact Customer support for assistance.")
		Return 1
	End If
	li_retval = dw_detail.SetColumn( ls_ref_1 )
	If li_retval = 1 Then
		If IsNull( dw_detail.GetText() ) Or dw_detail.GetText() = "" Then
			SetRedraw( True )
			MessageBox( "Required", "The reference field " + ls_ref_1 + " is required." )
			Return -1
		End If
		li_retval = dw_detail.GetChild(ls_ref_1, dwchild)
		If li_retval = -1 Then
			ls_reference =  dw_detail.GetText()
		Else
			dw_detail.SetColumn( ls_ref_1 )
			li_found = dwchild.Find( "lookup_code = " + dw_detail.GetText(), 1, 100000 )
			//messagebox("li_found",li_found)
			If dw_detail.Describe( ls_ref_1 + ".dddw.displaycolumn") = "code" Then
				ls_reference = dwchild.GetItemString( li_found, "code" )
				
				//IF ls_screen_name = "Licensure" THEN
				If ii_screen = 4 Then
					If dw_detail.Describe("verifying_agency.ColType") = "!" Then //trap for invisible field maha 040403 
						MessageBox("Screen Setup Error"," The verifying_agency field is a required field, and must be visible to enter Licence data.  Please set up in the screen painter")
						Return -1
					Else
						ll_address_code = dw_detail.GetItemNumber( i, "verifying_agency" )
					End If
				Else
					If ls_type1 = "C" Then //maha 050802 
						ll_address_code = Long(dw_detail.GetItemString( i, ls_ref_1 ))//maha 072501
					ElseIf ls_type1 = "N" Then //maha 050802
						ll_address_code = dw_detail.GetItemNumber( i, ls_ref_1 )
					End If
				End If
			ElseIf dw_detail.Describe( ls_ref_1 + ".dddw.displaycolumn") = "entity_name" Then
				ls_reference = dwchild.GetItemString( li_found, "entity_name_original" )
				If ls_type1 = "C" Then //maha 102501 took out specific exceptions and tested field type
					ll_address_code = Long(dw_detail.GetItemString( i, ls_ref_1 ))//maha 072501
				ElseIf ls_type1 = "N" Then //maha 102501
					ll_address_code = dw_detail.GetItemNumber( i, ls_ref_1 )
				End If
			ElseIf dw_detail.Describe( ls_ref_1 + ".dddw.displaycolumn") = "description" Then //maha 110801
				ls_reference = dwchild.GetItemString( li_found, "description" )
				If ls_type1 = "C" Then //maha 102501 took out specific exceptions and tested field type
					ll_address_code = Long(dw_detail.GetItemString( i, ls_ref_1 ))//maha 072501
				ElseIf ls_type1 = "N" Then //maha 102501
					ll_address_code = dw_detail.GetItemNumber( i, ls_ref_1 )
				End If
			Else
				ls_reference = dw_detail.GetText()
			End If
		End If
	Else
		ls_reference = ""
	End If
	
	//get reference 2 data
	If dw_detail.Describe(ls_ref_2 + ".ColType") = "!" Or ls_ref_2 = "" Then //trap for invisible field maha 012104 
		MessageBox("Problem getting reference 2 value for verification","Required Field " + ls_ref_2 + " is invisible.  The verification will not be created.  Contact Customer support for assistance.")
		Return 1
	End If
	li_retval = dw_detail.SetColumn( ls_ref_2 )
	If li_retval = 1 Then
		If IsNull( dw_detail.GetText() ) Or dw_detail.GetText() = "" Then
			SetRedraw( True )
			MessageBox( "Required", "The reference field " + ls_ref_2 + " is required." )
			Return -1
		End If
		li_retval = dw_detail.GetChild(ls_ref_2, dwchild)
		If li_retval = -1 Then
			ls_reference = ls_reference + " - " + dw_detail.GetText()
		Else
			dw_detail.SetColumn( ls_ref_2 )
			li_found = dwchild.Find( "lookup_code = " + dw_detail.GetText(), 1, 100000 )
			If li_found > 0 Then //trap added maha 021704
				If dw_detail.Describe( ls_ref_2 + ".dddw.displaycolumn") = "code" Then
					ls_reference = ls_reference + " - " + dwchild.GetItemString( li_found, "code" )
				ElseIf dw_detail.Describe( ls_ref_2 + ".dddw.displaycolumn") = "description" Then
					ls_reference = ls_reference + " - " + dwchild.GetItemString( li_found, "description" )
				ElseIf dw_detail.Describe( ls_ref_2 + ".dddw.displaycolumn") = "entity_name" Then
					ls_reference = ls_reference + " - " + dwchild.GetItemString( li_found, "entity_name_original" )
					//ll_address_code = dw_detail.GetItemNumber( i, ls_ref_1 )		removed 072501 maha					
				Else
					ls_reference = ls_reference + " - " + dw_detail.GetText()
				End If
			Else
				ls_reference = ls_reference + " - " + ""
			End If
		End If
	Else
		ls_reference = ls_reference + " - " + ""
	End If
	
	ls_reference = Mid(ls_reference,1,100) //maha 022704 4.1.1
	//--------------------------- APPEON BEGIN ---------------------------
	//$<add> 10.17.2006 By: Jack (Inova)
	//$<reason> Required Documents Check Box on Data Entry Screen
	is_reference = ls_reference
	//---------------------------- APPEON END ----------------------------

	If of_create_verif(  ls_reference) = -1 Then
		Return -1
		MessageBox("Error","Error adding verification")
	End If
	
End If
//end if
//next



//if is_screen_name = "Hospital Affiliation" or is_screen_name = "Address" or is_screen_name = "Board/Specialty"then
//IF ii_screen = 10 or ii_screen = 2 or ii_screen = 19  then
//	dw_link_list.bringtotop = True
//end if



//debugbreak()
inv_data_entry.of_field_audit( dw_detail )
//messagebox("","4")
//destroy pfc_cst_u_verification_info
Destroy pfc_cst_nv_data_entry_functions

Return 1


end event

event constructor;call super::constructor;//This.iuo_calendar.of_Register(This.iuo_calendar.DDLB)	
end event

type st_1 from statictext within w_batch_add_insurance
integer x = 905
integer y = 116
integer width = 288
integer height = 64
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
string text = "2) Enter data"
boolean focusrectangle = false
end type

type dw_verifww from datawindow within w_batch_add_insurance
boolean visible = false
integer x = 2958
integer y = 328
integer width = 485
integer height = 208
integer taborder = 40
boolean bringtotop = true
string dataobject = "d_ver_summary_record_view"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_verif from u_dw within w_batch_add_insurance
boolean visible = false
integer x = 2167
integer y = 180
integer taborder = 20
boolean bringtotop = true
string dataobject = "d_ver_summary_record_view"
end type

