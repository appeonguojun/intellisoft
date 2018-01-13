$PBExportHeader$pfc_cst_u_facility_setup.sru
forward
global type pfc_cst_u_facility_setup from userobject
end type
type st_step from statictext within pfc_cst_u_facility_setup
end type
type cb_next_tab from u_cb within pfc_cst_u_facility_setup
end type
type cb_user from u_cb within pfc_cst_u_facility_setup
end type
type cb_add from u_cb within pfc_cst_u_facility_setup
end type
type cb_delete from u_cb within pfc_cst_u_facility_setup
end type
type cb_print from u_cb within pfc_cst_u_facility_setup
end type
type cb_save from u_cb within pfc_cst_u_facility_setup
end type
type cb_close from u_cb within pfc_cst_u_facility_setup
end type
type tab_facilty from tab within pfc_cst_u_facility_setup
end type
type tabpage_browse from userobject within tab_facilty
end type
type dw_browse from u_dw within tabpage_browse
end type
type tabpage_browse from userobject within tab_facilty
dw_browse dw_browse
end type
type tabpage_address from userobject within tab_facilty
end type
type tabpage_address from userobject within tab_facilty
end type
type tabpage_return from userobject within tab_facilty
end type
type tabpage_return from userobject within tab_facilty
end type
type tabpage_settings from userobject within tab_facilty
end type
type tabpage_settings from userobject within tab_facilty
end type
type tabpage_npdb from userobject within tab_facilty
end type
type tabpage_npdb from userobject within tab_facilty
end type
type tabpage_verif from userobject within tab_facilty
end type
type cb_2 from commandbutton within tabpage_verif
end type
type dw_verif_rules from u_dw within tabpage_verif
end type
type dw_select_section from u_dw within tabpage_verif
end type
type dw_copy_rules from u_dw within tabpage_verif
end type
type tabpage_verif from userobject within tab_facilty
cb_2 cb_2
dw_verif_rules dw_verif_rules
dw_select_section dw_select_section
dw_copy_rules dw_copy_rules
end type
type tabpage_committee from userobject within tab_facilty
end type
type dw_committee from u_dw within tabpage_committee
end type
type cb_add_committee from u_cb within tabpage_committee
end type
type tabpage_committee from userobject within tab_facilty
dw_committee dw_committee
cb_add_committee cb_add_committee
end type
type tabpage_dept_chair from userobject within tab_facilty
end type
type cb_1 from commandbutton within tabpage_dept_chair
end type
type cb_del_chair1 from u_cb within tabpage_dept_chair
end type
type cb_add_chair1 from u_cb within tabpage_dept_chair
end type
type dw_dc_browse from u_dw within tabpage_dept_chair
end type
type dw_dc_detail from u_dw within tabpage_dept_chair
end type
type tabpage_dept_chair from userobject within tab_facilty
cb_1 cb_1
cb_del_chair1 cb_del_chair1
cb_add_chair1 cb_add_chair1
dw_dc_browse dw_dc_browse
dw_dc_detail dw_dc_detail
end type
type tabpage_workflow from userobject within tab_facilty
end type
type tabpage_workflow from userobject within tab_facilty
end type
type tab_facilty from tab within pfc_cst_u_facility_setup
tabpage_browse tabpage_browse
tabpage_address tabpage_address
tabpage_return tabpage_return
tabpage_settings tabpage_settings
tabpage_npdb tabpage_npdb
tabpage_verif tabpage_verif
tabpage_committee tabpage_committee
tabpage_dept_chair tabpage_dept_chair
tabpage_workflow tabpage_workflow
end type
type dw_detail from u_dw within pfc_cst_u_facility_setup
end type
end forward

global type pfc_cst_u_facility_setup from userobject
integer width = 4027
integer height = 1896
boolean border = true
long backcolor = 67108864
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
st_step st_step
cb_next_tab cb_next_tab
cb_user cb_user
cb_add cb_add
cb_delete cb_delete
cb_print cb_print
cb_save cb_save
cb_close cb_close
tab_facilty tab_facilty
dw_detail dw_detail
end type
global pfc_cst_u_facility_setup pfc_cst_u_facility_setup

type variables
Long il_last_dept_chair
w_response iw_parent_window
Integer il_facility_id
Boolean ib_adding_new = False
Boolean ib_rules_added = True
Boolean ib_fld_error
Boolean ib_tab_change = False
Integer il_last_tab = 2

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-01
//$<add> 01.13.2006 By: Rodger Wu
//$<reason> Performance tuning.
//$<modification> Define a variable to validate whether the application is running
//$<modification> on the Web.
Boolean ib_web = False
Boolean ib_retrieve_wf = False
//---------------------------- APPEON END ----------------------------

end variables

forward prototypes
public function integer of_set_parent_window (w_response aw_parent_window)
public function integer of_retrieve_detail ()
public function integer of_tab_order_off ()
public function integer of_se ()
public subroutine of_retrieve_work_flow ()
public subroutine of_filter_docs (boolean ab_warning)
public subroutine of_setlabel ()
end prototypes

public function integer of_set_parent_window (w_response aw_parent_window);iw_parent_window = aw_parent_window

RETURN 0
end function

public function integer of_retrieve_detail ();tab_facilty.tabpage_browse.dw_browse.of_SetTransObject( SQLCA )
tab_facilty.tabpage_browse.dw_browse.of_SetUpdateAble( False )

tab_facilty.tabpage_verif.dw_verif_rules.of_SetTransObject( SQLCA )
tab_facilty.tabpage_verif.dw_verif_rules.of_SetUpdateAble( True )
tab_facilty.tabpage_verif.dw_verif_rules.of_SetReqColumn( True )

dw_detail.of_SetTransObject( SQLCA )
dw_detail.of_SetUpdateAble( True )
dw_detail.of_SetReqColumn( True )

tab_facilty.tabpage_verif.dw_select_section.of_Setupdateable(False)
tab_facilty.tabpage_verif.dw_select_section.of_SetTransObject( SQLCA )

tab_facilty.tabpage_browse.dw_browse.Retrieve( )

RETURN 0
end function

public function integer of_tab_order_off ();//dw_detail.AcceptText()
//
//dw_detail.SetTabOrder( "facility_name", 0 )
//dw_detail.SetTabOrder( "street", 0 )
//dw_detail.SetTabOrder( "street_2", 0 )
//dw_detail.SetTabOrder( "city", 0 )
//dw_detail.SetTabOrder( "state", 0 )
//dw_detail.SetTabOrder( "zip", 0 )
//dw_detail.SetTabOrder( "phone", 0 )
//dw_detail.SetTabOrder( "ext", 0 )
//dw_detail.SetTabOrder( "fax", 0 )
//dw_detail.SetTabOrder( "contact", 0 )
//dw_detail.SetTabOrder( "web_address", 0 )
//dw_detail.SetTabOrder( "email_address", 0 )
//dw_detail.SetTabOrder( "return_facility_name", 0 )
//dw_detail.SetTabOrder( "return_street", 0 )
//dw_detail.SetTabOrder( "return_street_2", 0 )
//dw_detail.SetTabOrder( "return_city", 0 )
//dw_detail.SetTabOrder( "return_state", 0 )
//dw_detail.SetTabOrder( "return_zip", 0 )
//dw_detail.SetTabOrder( "credentialing_contact_name", 0 )
//dw_detail.SetTabOrder( "credentialing_contact_title", 0 )
//dw_detail.SetTabOrder( "return_phone", 0 )
//dw_detail.SetTabOrder( "return_ext", 0 )
//dw_detail.SetTabOrder( "return_fax", 0 )
//dw_detail.SetTabOrder( "default_data_view_id", 0 )
//dw_detail.SetTabOrder( "npdb_facility_ein", 0 )
//dw_detail.SetTabOrder( "npdb_password", 0 )
//dw_detail.SetTabOrder( "npdb_agent_ein", 0 )
//dw_detail.SetTabOrder( "letter_path", 0 )
//dw_detail.SetTabOrder( "reappointment_query_days", 0 )


RETURN 1
end function

public function integer of_se ();tab_facilty.tabpage_dept_chair.Visible = False
tab_facilty.tabpage_verif.Visible = False
//tab_facilty.tabpage_settings.Visible = False
cb_user.Visible = False
cb_add.Visible = False
cb_delete.Visible = False

cb_print.x = cb_save.x
cb_save.x = cb_user.x

Return 1
end function

public subroutine of_retrieve_work_flow ();//
DataWindowChild ldwc_child

gnv_appeondb.of_startqueue( )

//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 12.18.2006 By: Jervis
//$<reason> 
string ls_module
if of_get_app_setting("set_9","I") = 1 then
	ls_module = "02"
else
	ls_module = "01"
end if


dw_detail.Getchild('wf_expiring_appointment' , ldwc_child)
ldwc_child.settransobject(SQLCA)
ldwc_child.retrieve(ls_module,'004')

dw_detail.Getchild('wf_reappointment_initiated' , ldwc_child)
ldwc_child.settransobject(SQLCA)
ldwc_child.retrieve(ls_module,'005')

dw_detail.Getchild('wf_data_entry_complete' , ldwc_child)
ldwc_child.settransobject(SQLCA)
ldwc_child.retrieve(ls_module,'007')

dw_detail.Getchild('wf_practitioner_status_change' , ldwc_child)
ldwc_child.settransobject(SQLCA)
ldwc_child.retrieve(ls_module,'006')

dw_detail.Getchild('wf_new_practitioner' , ldwc_child)
ldwc_child.settransobject(SQLCA)
ldwc_child.retrieve(ls_module,'003')

dw_detail.Getchild('wf_data_value_comparison' , ldwc_child)
ldwc_child.settransobject(SQLCA)
ldwc_child.retrieve(ls_module,'009')

dw_detail.Getchild('wf_webview_application_complete' , ldwc_child)
ldwc_child.settransobject(SQLCA)
ldwc_child.retrieve(ls_module,'101')

dw_detail.Getchild('wf_webview_application_initiated' , ldwc_child)
ldwc_child.settransobject(SQLCA)
ldwc_child.retrieve(ls_module,'103')

//---------------------------- APPEON END ----------------------------
gnv_appeondb.of_commitqueue()
end subroutine

public subroutine of_filter_docs (boolean ab_warning);//////////////////////////////////////////////////////////////////////
// $<function>pfc_cst_u_facility_setupof_filter_doc()
// $<arguments>
//    value	boolean	ab_warning
// $<returns>   (none)
// $<description> Filter data of the dropdown datawindow for verification 
// $<description> documents and expiration documents.
//////////////////////////////////////////////////////////////////////
// $<add> 06.07.2006 by Rodger Wu
//////////////////////////////////////////////////////////////////////
string ls_letterpath
Integer li_return
datawindowchild ldwc_doc

if gnv_data.of_getitem('icred_settings' ,'set_50' , False ) = '0' and &
			appeongetclienttype() = 'PB' then return;
			
//if ab_warning then
//	if dw_detail.GetItemNumber( 1, "facility_id" ) = 1 then
//		li_return = MessageBox( "IntelliSoft", "  Once you change Letter Path, the three fields of Reappointment Document in this tab, ~r~n" + &
//															"Expiration Letter Name and Verification Letter Name in Verif rule tab need to be reset.~r~n" + &
//															"In addition, All fields of Word Document Name in Letter Painter need to check and reset also. ~r~n~r~n" + &
//															"Are you sure to continue?", Exclamation!, YesNo! )
//	else
//		li_return = MessageBox( "IntelliSoft", "  Once you change Letter Path, the three fields of Reappointment Document in this tab, ~r~n" + &
//															"Expiration Letter Name and Verification Letter Name in Verif rule tab need to be reset.~r~n~r~n" + &
//															"Are you sure to continue?", Exclamation!, YesNo! )		
//	end if
//	if li_return = 2 then
//		dw_detail.SetItem( 1, "letter_path", dw_detail.GetItemString( 1, "letter_path", Primary!, True ))
//		dw_detail.SetItemStatus( 1, "letter_path", Primary!, NotModified! )
//	end if
//end if

ls_letterpath = dw_detail.GetItemString( 1, "letter_path" )

//--------------------------- APPEON BEGIN ---------------------------
//$< Add  > 2007-07-13 By: Scofield
//$<Reason> Prevent popup filter dialog
if Not IsNull(ls_letterpath) then
//---------------------------- APPEON END ----------------------------
	dw_detail.GetChild( "reapp_doc_name", ldwc_doc )
	ldwc_doc.SetFilter( "area_id = " + string( ls_letterpath ))
	ldwc_doc.Filter()
	
	dw_detail.GetChild( "prov_doc_name", ldwc_doc )
	ldwc_doc.SetFilter( "area_id = " + string( ls_letterpath )  )
	ldwc_doc.Filter()
	
	dw_detail.GetChild( "reappah_doc_name", ldwc_doc )
	ldwc_doc.SetFilter( "area_id = " + string( ls_letterpath )  )
	ldwc_doc.Filter()
	
	tab_facilty.tabpage_verif.dw_verif_rules.GetChild( "exp_cred_letter_doc_nm", ldwc_doc )
	ldwc_doc.SetFilter( "area_id = " + string( ls_letterpath )  )
	ldwc_doc.Filter()
	
	tab_facilty.tabpage_verif.dw_verif_rules.GetChild( "init_veif_letter_doc_nm", ldwc_doc )
	ldwc_doc.SetFilter( "area_id = " + string( ls_letterpath ) )
	ldwc_doc.Filter()
end if

end subroutine

public subroutine of_setlabel ();//====================================================================
// Event: of_setlabel()
//--------------------------------------------------------------------
// Description:
// Dynamically modify the Screen title and the Facility detail tab (tabpage_address) label to the facility_label
//--------------------------------------------------------------------
// Arguments:
// 		
//--------------------------------------------------------------------
// Returns:  (none)
//--------------------------------------------------------------------
// Author:	Andy		Date: Jul 07,2008
//--------------------------------------------------------------------
//	
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

String ls_label
SELECT TOP 1 app_stat_facility_label INTO :ls_label FROM icred_settings;	
if isnull(ls_label) or trim(ls_label) = '' then ls_label = 'Facility'
iw_parent_window.Title = ls_label + " Painter"
tab_facilty.tabpage_address.text = ls_label + " Address"
//cb_add.text = '&Add ' + ls_label
//cb_delete.text = '&Delete ' + ls_label
//cb_print.text = '&Print ' + ls_label

end subroutine

on pfc_cst_u_facility_setup.create
this.st_step=create st_step
this.cb_next_tab=create cb_next_tab
this.cb_user=create cb_user
this.cb_add=create cb_add
this.cb_delete=create cb_delete
this.cb_print=create cb_print
this.cb_save=create cb_save
this.cb_close=create cb_close
this.tab_facilty=create tab_facilty
this.dw_detail=create dw_detail
this.Control[]={this.st_step,&
this.cb_next_tab,&
this.cb_user,&
this.cb_add,&
this.cb_delete,&
this.cb_print,&
this.cb_save,&
this.cb_close,&
this.tab_facilty,&
this.dw_detail}
end on

on pfc_cst_u_facility_setup.destroy
destroy(this.st_step)
destroy(this.cb_next_tab)
destroy(this.cb_user)
destroy(this.cb_add)
destroy(this.cb_delete)
destroy(this.cb_print)
destroy(this.cb_save)
destroy(this.cb_close)
destroy(this.tab_facilty)
destroy(this.dw_detail)
end on

event constructor;Integer li_cnt

//Facility address
IF w_mdi.of_security_access( 480 ) = 0 THEN
	tab_facilty.tabpage_address.Visible = False	
	li_cnt++
END IF

//Facility return address
IF w_mdi.of_security_access( 500 ) = 0 THEN
	tab_facilty.tabpage_return.Visible = False	
	li_cnt++	
END IF

//global variables
IF w_mdi.of_security_access( 510 ) = 0 THEN
	tab_facilty.tabpage_settings.Visible = False	
	li_cnt++	
END IF

//verif rules
IF w_mdi.of_security_access( 520 ) = 0 THEN
	tab_facilty.tabpage_verif.Visible = False	
	li_cnt++	
END IF

//credentialing committee
IF w_mdi.of_security_access( 530 ) = 0 THEN
	tab_facilty.tabpage_committee.Visible = False	
	li_cnt++
END IF

//add facility
IF w_mdi.of_security_access( 533 ) = 0 THEN
	cb_add.Enabled = False	
END IF

//delete facility
IF w_mdi.of_security_access( 534 ) = 0 THEN
	cb_delete.Enabled = False	
END IF

IF w_mdi.of_security_access( 900 ) = 0 THEN
	cb_user.Enabled = False
ELSE

END IF												

IF gs_cust_type = "I" THEN
	tab_facilty.tabpage_dept_chair.Visible = False		
END IF

IF li_cnt = 5 THEN
	tab_facilty.tabpage_browse.dw_browse.Enabled = False
END IF


//IF THIS IS INTELLICRED SE TURN SOME TABS OFF

IF gb_se_version THEN
	of_se( )
END IF
//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 06.07.2006 By: LeiWei
//$<reason> To implement the functionality of storing Word templates to both HDD and db.
//$<modification> Two dataobjects are used: 1) d_verification_setup (store templates to local HDD);
//$<modification> 2) d_verification_setup_database (store templates to db).

Integer li_word_storage_type
li_word_storage_type = Integer(gnv_data.of_getitem( "icred_settings", "set_50", FALSE))
IF Isnull(li_word_storage_type) THEN li_word_storage_type = 0
IF Upper( AppeonGetClientType() ) = "PB" AND li_word_storage_type = 0 THEN
	dw_detail.Dataobject = "d_facility_setup"
	tab_facilty.tabpage_verif.dw_verif_rules.Dataobject = "d_verification_setup"
	dw_detail.of_SetTransObject( SQLCA )
	tab_facilty.tabpage_verif.dw_verif_rules.of_SetTransObject( SQLCA )
ELSE	
	dw_detail.Dataobject = "d_facility_setup_database"
	tab_facilty.tabpage_verif.dw_verif_rules.Dataobject = "d_verification_setup_database"
	dw_detail.of_SetTransObject( SQLCA )
	tab_facilty.tabpage_verif.dw_verif_rules.of_SetTransObject( SQLCA )
END IF	
//---------------------------- APPEON END ----------------------------


end event

type st_step from statictext within pfc_cst_u_facility_setup
boolean visible = false
integer x = 3479
integer y = 304
integer width = 357
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
boolean enabled = false
string text = "Step 1 of 6"
boolean focusrectangle = false
end type

type cb_next_tab from u_cb within pfc_cst_u_facility_setup
boolean visible = false
integer x = 3451
integer y = 176
integer width = 411
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string text = " Next-->   "
end type

event clicked;
IF il_last_tab = 7 THEN
	IF tab_facilty.tabpage_committee.dw_committee.RowCount() = 0 THEN
		MessageBox("Committee", "Please enter at least one committee and save." )
		Return -1
	END IF		
	IF cb_save.Event Clicked() = -1 THEN
		Return
	END IF
	ib_adding_new = False
	ib_rules_added = True
	This.Visible = False
	st_step.Visible = False
	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> UM-02
	//$<modify> 03.09.2006 By: LiuHongXin
	//$<reason> SelectTab() is unsupported if a tab page is invisible.
	//$<modification> Add script to set the tab page visible.
	/*
	tab_facilty.selectTab( 2 )
	cb_add.Enabled = True
	cb_delete.Enabled = True
	cb_save.Enabled = True
	cb_print.Enabled = True
	cb_user.Enabled = True
	tab_facilty.tabpage_browse.Visible = True
	tab_facilty.tabpage_address.Visible = True
	*/	
	tab_facilty.tabpage_address.Visible = True
	tab_facilty.selectTab( 2 )
	
	cb_add.Enabled = True
	cb_delete.Enabled = True
	cb_save.Enabled = True
	cb_print.Enabled = True
	cb_user.Enabled = True
	tab_facilty.tabpage_browse.Visible = True
	//---------------------------- APPEON END ----------------------------
	tab_facilty.tabpage_return.Visible = True
	tab_facilty.tabpage_settings.Visible = True
	tab_facilty.tabpage_npdb.Visible = True
	tab_facilty.tabpage_verif.Visible = True
	tab_facilty.tabpage_committee.Visible = True
	//--------------------------- APPEON BEGIN ---------------------------
	//$<add> 03.18.2006 By: Cao YongWang
	//$<reason> Fix a defect.
	//$<reason> Make Dept. Chair tab visible after add new facility. 
	tab_facilty.tabpage_dept_chair.Visible = True
	tab_facilty.tabpage_workflow.Visible = True //Added for Work Flow. 3/11/2006 Henry
	//---------------------------- APPEON END ----------------------------
	
	//--------------------------- APPEON BEGIN ---------------------------
	//$<add> 05.26.2006 By: Liang QingShi
	//$<reason> Fix a defect.
	gnv_data.ids_facility.retrieve()
	//---------------------------- APPEON END ----------------------------

	MessageBox("User Painter", "To assign this facility to a user you need to update the User Painter.")	
	dw_detail.BringToTop = True
	Return
END IF

tab_facilty.SelectTab( il_last_tab )

IF ib_fld_error = True THEN
	This.BringToTop = True
	Return
ELSE
	tab_facilty.tabpage_browse.Visible = False
	tab_facilty.tabpage_address.Visible = False	
	tab_facilty.tabpage_return.Visible = False
	tab_facilty.tabpage_settings.Visible = False
	tab_facilty.tabpage_npdb.Visible = False
	tab_facilty.tabpage_verif.Visible = False
	tab_facilty.tabpage_committee.Visible = False
	il_last_tab ++
	CHOOSE CASE il_last_tab 
		CASE 3
			tab_facilty.tabpage_return.Visible = True
			st_step.Text = "Step 2 of 6"
		CASE 4
			tab_facilty.tabpage_settings.Visible = True
			st_step.Text = "Step 3 of 6"			
		CASE 5
			tab_facilty.tabpage_npdb.Visible = True
			st_step.Text = "Step 4 of 6"			
		CASE 6
			tab_facilty.tabpage_verif.Visible = True	
			st_step.Text = "Step 5 of 6"			
		CASE 7		
			tab_facilty.tabpage_committee.Visible = True
			st_step.Text = "Step 6 of 6"			
			This.Text = "Save"
	END CHOOSE
	tab_facilty.SelectTab( il_last_tab )				
END IF


This.BringToTop = True
st_step.Visible = True
st_step.BringToTop = True







end event

type cb_user from u_cb within pfc_cst_u_facility_setup
integer x = 3022
integer y = 1752
integer width = 407
integer height = 84
integer taborder = 80
string text = "&User Painter"
end type

event clicked;

Open( w_security_user_painter )
end event

type cb_add from u_cb within pfc_cst_u_facility_setup
integer x = 1321
integer y = 1752
integer width = 407
integer height = 84
integer taborder = 40
string text = "&Add Facility"
end type

event clicked;Integer li_nr
Integer i
Integer li_rc
Integer li_facility_id

IF iw_parent_window.Event pfc_save() < 0 THEN
	Return -1
END IF

tab_facilty.SelectTab( 2 )

ib_adding_new = True
ib_rules_added = False

cb_next_tab.Visible = True
cb_next_tab.BringToTop = True
st_step.Visible = True
st_step.BringToTop = True

il_last_tab = 2
tab_facilty.tabpage_browse.Visible = False
tab_facilty.tabpage_return.Visible = False
tab_facilty.tabpage_settings.Visible = False
tab_facilty.tabpage_npdb.Visible = False
tab_facilty.tabpage_verif.Visible = False
tab_facilty.tabpage_committee.Visible = False
tab_facilty.tabpage_dept_chair.Visible = False
tab_facilty.tabpage_workflow.Visible = False //Added for Work Flow. 3/11/2006 Henry

cb_add.Enabled = False
cb_delete.Enabled = False
cb_save.Enabled = False
cb_print.Enabled = False
cb_user.Enabled = False

SELECT Max( facility.facility_id )  
INTO :li_facility_id  
FROM facility ;

li_facility_id ++

il_facility_id = li_facility_id

dw_detail.Reset()

li_nr = dw_detail.InsertRow( 0 )
dw_detail.SetItem( li_nr, "facility_id", li_facility_id)
dw_detail.SetItem( li_nr, "appointment_years", 2)// maha 020801
dw_detail.SetItem( li_nr, "prov_export", 0)// maha 102303
dw_detail.SetItem( li_nr, "reapp_export", 0)// maha 102303
dw_detail.SetItem( li_nr, "reappah_export", 0)// maha 102303
dw_detail.ScrollToRow( li_nr )
dw_detail.SetRow( li_nr )
dw_detail.SetFocus( )

tab_facilty.tabpage_verif.dw_verif_rules.Reset()
tab_facilty.tabpage_committee.dw_committee.Reset()
tab_facilty.tabpage_dept_chair.dw_dc_browse.Reset()
tab_facilty.tabpage_dept_chair.dw_dc_detail.Reset()

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 02.28.2006 By: LiuHongXin
//$<reason> Fix a defect.
if cb_next_tab.Text = "Save" then
	cb_next_tab.Text = ' Next-->'
	st_step.Text = "Step 1 of 6"
end if
//---------------------------- APPEON END ----------------------------

//tab_facilty.tabpage_committee.Enabled = False
//ib_adding_new = False
end event

type cb_delete from u_cb within pfc_cst_u_facility_setup
integer x = 1746
integer y = 1752
integer width = 407
integer height = 84
integer taborder = 50
string text = "&Delete Facility"
end type

event clicked;Integer li_ans
long cnt
integer li_fac

li_fac = dw_detail.GetItemNumber( 1, "facility_id" )
IF li_fac = 1 THEN
	MessageBox("Delete Error", "You can't delete the facility with the facility_id of 1!")
	RETURN -1
END IF

//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 07.26.2007 By: Evan
//$<reason> New feature of import module.
//select count(rec_id) into :cnt from pd_affil_stat where parent_facility_id = :li_fac;
long ll_Count
gnv_appeondb.of_StartQueue()
select count(rec_id) into :cnt from pd_affil_stat where parent_facility_id = :li_fac;
SELECT count(*) INTO :ll_Count FROM import_lookup_mapping A, import_lu_map_fields B
WHERE (A.ilm_id = B.ilm_id) AND
		(A.map_type = 'F') AND
		(is_lu_code = :li_fac);
gnv_appeondb.of_CommitQueue()

if ll_Count > 0 then
	MessageBox("Delete Error", "This facility has " + string(ll_Count) + " Import lookup mapping records connected to it.  You can't delete the facility unless those records are deleted first.")
	Return -1
end if
//---------------------------- APPEON END ----------------------------

IF cnt > 0 THEN //maha 101204
	MessageBox("Delete Error", "This facility has " + string(cnt) + " Appointment records connected to it.  You can't delete the facility unless those records are deleted first.")
	RETURN -1
END IF

li_ans = MessageBox("Delete Row", "Are you sure you want to delete selected Facility?", Question!, YesNo!, 1 )

IF li_ans = 2 THEN
	Return
END IF

iw_parent_window.SetRedraw( False )
//maha 101204 moved to above deleterow

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-02
//$<modify> 02.10.2006 By: owen chen
//$<reason> Performance tuning
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

/*
DELETE 
FROM facility_ver_rules
WHERE facility_id = :il_facility_id;

DELETE 		//maha 102300
FROM committee_lookup
WHERE facility_id = :il_facility_id;

DELETE 		//maha 110600
FROM security_user_facilities
WHERE facility_id = :il_facility_id;
*/

gnv_appeondb.of_startqueue( )

DELETE 
FROM facility_ver_rules
WHERE facility_id = :il_facility_id;

DELETE 		//maha 102300
FROM committee_lookup
WHERE facility_id = :il_facility_id;

DELETE 		//maha 110600
FROM security_user_facilities
WHERE facility_id = :il_facility_id;

gnv_appeondb.of_commitqueue( )

//---------------------------- APPEON END ----------------------------

dw_detail.DeleteRow( 0 )//maha 110600 this line moved to here from line 15 

IF SQLCA.SQLCODE = -1 THEN
	MessageBox("Delete Error", SQLCA.SQLERRTEXT )
	Return -1
END IF


IF iw_parent_window.Event pfc_save( ) < 0 THEN
	Return -1
END IF

tab_facilty.tabpage_browse.dw_browse.Retrieve()

tab_facilty.SelectTab( 1 )

tab_facilty.tabpage_browse.dw_browse.ScrollToRow( 1 )
tab_facilty.tabpage_browse.dw_browse.SetRow( 1 )
tab_facilty.tabpage_browse.dw_browse.SelectRow( 0, False )
tab_facilty.tabpage_browse.dw_browse.SelectRow( 1, True )

tab_facilty.tabpage_browse.dw_browse.SetFocus( )

COMMIT USING SQLCA;

iw_parent_window.SetRedraw( True )

tab_facilty.tabpage_verif.Enabled = True
end event

type cb_print from u_cb within pfc_cst_u_facility_setup
integer x = 2171
integer y = 1752
integer width = 407
integer height = 84
integer taborder = 60
string text = "&Print Facility"
end type

event clicked;dw_detail.Print()
dw_detail.SetFocus( )
end event

type cb_save from u_cb within pfc_cst_u_facility_setup
integer x = 2597
integer y = 1752
integer width = 407
integer height = 84
integer taborder = 70
string text = "&Save"
end type

event clicked;Integer li_find
Integer li_row
Integer li_last_tab
Integer li_last_facility_id
Integer li_retval
Integer li_cr


dw_detail.AcceptText()

li_cr = dw_detail.GetRow()
//--------------------------- APPEON BEGIN ---------------------------
//$<add> 07.07.2006 By: Rodger Wu
//$<reason> fix a defect.
if li_cr < 1 then return;
//---------------------------- APPEON END ----------------------------

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 01.11.2008 By: Evan
//$<reason> Fix BugS122705	about when clicking Add Committee twice, the following error occurs.
long ll_Row
tab_facilty.tabpage_committee.dw_committee.AcceptText()
for ll_Row = 1 to tab_facilty.tabpage_committee.dw_committee.RowCount()
	if IsNull(tab_facilty.tabpage_committee.dw_committee.GetItemString(ll_Row, "committee_name")) then
		MessageBox("Required Field", "Please enter the committee name.")
		tab_facilty.SelectTab( 7 )
		tab_facilty.tabpage_committee.dw_committee.ScrollToRow(ll_Row)
		tab_facilty.tabpage_committee.dw_committee.SetFocus()
		Return -1
	end if
next
//---------------------------- APPEON END ----------------------------

IF IsNull( dw_detail.GetItemString( li_cr, "facility_name" ) ) THEN
	MessageBox("Required Field", "Please enter the facility name." )
	tab_facilty.SelectTab( 2 )
	dw_detail.SetFocus( )	
	dw_detail.SetColumn( "facility_name" )		
	Return -1
END IF

IF IsNull( dw_detail.GetItemString( li_cr, "street" ) )  THEN
	MessageBox("Required Field", "Please enter the street." )
	tab_facilty.SelectTab( 2 )
	dw_detail.SetFocus( )	
	dw_detail.SetColumn( "street" )	
	Return -1	
END IF


IF IsNull( dw_detail.GetItemString( li_cr, "return_facility_name" ) ) THEN
	MessageBox("Required Field", "Please enter the return facility name." )
	tab_facilty.SelectTab( 3 )
	dw_detail.SetFocus( )	
	dw_detail.SetColumn( "return_facility_name" )	
	Return -1	
END IF

IF IsNull( dw_detail.GetItemString( li_cr, "return_street" ) ) THEN
	MessageBox("Required Field", "Please enter the return street." )
	tab_facilty.SelectTab( 3 )
	dw_detail.SetFocus( )	
	dw_detail.SetColumn( "return_street" )	
	Return -1	
END IF

IF IsNull( dw_detail.GetItemNumber( li_cr, "default_data_view_id" ) ) THEN
	MessageBox("Required Field", "Please enter the default data view for this facility." )
	tab_facilty.SelectTab( 4 )
	dw_detail.SetFocus( )	
	dw_detail.SetColumn( "default_data_view_id" )	
	Return -1	
END IF

IF IsNull( dw_detail.GetItemString( li_cr, "letter_path" ) )THEN
	MessageBox("Required Field", "Please enter the default letter path for this facility." )
	tab_facilty.SelectTab( 4 )
	dw_detail.SetFocus( )	
	dw_detail.SetColumn( "letter_path" )	
	Return -1	
END IF

 //maha 071403 to set null check boxe
//if isnull("reapp_export") then dw_detail.setitem(1,"reapp_export",0)
//if isnull("prov_export") then dw_detail.setitem(1,"prov_export",0)
//if isnull("reappah_export") then dw_detail.setitem(1,"reappah_export",0)
//if isnull("oig_auto_lname") then dw_detail.setitem(1,"oig_auto_lname",0)
//if isnull("oig_auto_fname") then dw_detail.setitem(1,"oig_auto_fname",0)
//if isnull("oig_auto_dob") then dw_detail.setitem(1,"oig_auto_dob",0)
//if isnull("dupeset") then dw_detail.setitem(1,"dupeset",0)


li_last_tab = tab_facilty.SelectedTab

li_retval = iw_parent_window.Event pfc_save( )
IF li_retval < 0 THEN
	Return -1
ELSEIF li_retval = 0 THEN
	Return 0
END IF

li_last_facility_id = dw_detail.GetItemNumber( 1, "facility_id" )

iw_parent_window.SetRedraw( False )

tab_facilty.tabpage_browse.dw_browse.Retrieve()
//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 05.15.2006 By: LeiWei
//$<reason> Fix a defect.
//li_row = tab_facilty.tabpage_browse.dw_browse.Find( "facility_id = " + String( li_last_facility_id ), 1, 10000 )
If Isnull(li_last_facility_id) Then
	li_row = 0
Else
	li_row = tab_facilty.tabpage_browse.dw_browse.Find( "facility_id = " + String( li_last_facility_id ), 1, 10000 )
End If
//---------------------------- APPEON END ----------------------------
IF li_row < 1 THEN
	Return -1
END IF
tab_facilty.tabpage_browse.dw_browse.SetRow( li_row )
tab_facilty.tabpage_browse.dw_browse.ScrollToRow( li_row )

IF li_last_tab = 1 OR li_last_tab = 5 THEN
	tab_facilty.tabpage_browse.dw_browse.SetFocus( )
	dw_detail.Visible = False
ELSEIF li_last_tab = 6 THEN
	tab_facilty.tabpage_committee.dw_committee.SetFocus()
	dw_detail.Visible = False
ELSEIF li_last_tab = 8 THEN
	tab_facilty.tabpage_dept_chair.dw_dc_browse.Retrieve( il_facility_id )
	dw_detail.Visible = False
	tab_facilty.tabpage_dept_chair.dw_dc_browse.SelectRow( 0, False )			
	//--------------------------- APPEON BEGIN ---------------------------
	//$<add> 05.15.2006 By: LeiWei
	//$<reason> Fix a defect.
	/*
	li_find = tab_facilty.tabpage_dept_chair.dw_dc_browse.Find( "dept_chair_id = " + String( il_last_dept_chair ), 1, 1000 )
	tab_facilty.tabpage_dept_chair.dw_dc_browse.SelectRow( li_find, True )
	*/
	If Isnull(il_last_dept_chair) Then
		li_find = 0
	Else
		li_find = tab_facilty.tabpage_dept_chair.dw_dc_browse.Find( "dept_chair_id = " + String( il_last_dept_chair ), 1, 1000 )
		tab_facilty.tabpage_dept_chair.dw_dc_browse.SelectRow( li_find, True )
	End If
	//---------------------------- APPEON END ----------------------------
	tab_facilty.tabpage_dept_chair.dw_dc_detail.SetFocus( )	
	tab_facilty.tabpage_dept_chair.dw_dc_detail.Retrieve( il_last_dept_chair )
ELSE
	dw_detail.Visible = True
	dw_detail.SetFocus( )

		IF li_last_tab = 2 THEN
			dw_detail.Object.DataWindow.VerticalScrollPosition='0'
		ELSEIF li_last_tab = 3 THEN
			dw_detail.Object.DataWindow.VerticalScrollPosition='1888'
		ELSEIF li_last_tab = 4 THEN
			dw_detail.Object.DataWindow.VerticalScrollPosition='4190'		
		END IF

END IF

iw_parent_window.SetRedraw( True )

COMMIT USING SQLCA;

IF tab_facilty.tabpage_committee.dw_committee.RowCount() = 0 THEN
	MessageBox("Committee", "Please enter at least one committee and save." )
	tab_facilty.SelectTab( 7 )  //Ken.Guo 2008-03-18  '6' changed to '7'
	tab_facilty.tabpage_committee.Enabled = true //maha 061301
	Return -1
END IF	

tab_facilty.tabpage_verif.Enabled = True
//Added for Work Flow to refersh the cache data. 1/11/2006 Henry
gnv_data.of_retrieve('facility')
tab_facilty.SelectTab( li_last_tab )


//--------------------------- APPEON BEGIN ---------------------------
//$<add> 01/29/2008 By: Ken.Guo
//$<reason> Added it to workaround Web's bug.
//This bug exist in APB 5.1.0306. Later APB version have fixed it.
tab_facilty.Post SelectTab( li_last_tab )
//---------------------------- APPEON END ----------------------------

end event

type cb_close from u_cb within pfc_cst_u_facility_setup
integer x = 3447
integer y = 1752
integer width = 407
integer height = 84
integer taborder = 90
string text = "&Close"
end type

event clicked;Close( iw_parent_window )
end event

type tab_facilty from tab within pfc_cst_u_facility_setup
integer x = 14
integer y = 32
integer width = 3991
integer height = 1832
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 80269524
boolean fixedwidth = true
boolean raggedright = true
alignment alignment = center!
integer selectedtab = 1
tabpage_browse tabpage_browse
tabpage_address tabpage_address
tabpage_return tabpage_return
tabpage_settings tabpage_settings
tabpage_npdb tabpage_npdb
tabpage_verif tabpage_verif
tabpage_committee tabpage_committee
tabpage_dept_chair tabpage_dept_chair
tabpage_workflow tabpage_workflow
end type

event selectionchanging;//IF ib_adding_new = False THEN
//	IF cb_save.Event Clicked() = -1 THEN
//		Return 1
//	END IF
//END IF

//IF newindex = 2 OR newindex = 3 OR newindex = 4 THEN
//	of_tab_order_off()
//END IF

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 01/29/2008 By: Ken.Guo
//$<reason> Added it to workaround Web's bug.
//This bug exist in APB 5.1.0306. Later APB version have fixed it.
If NewIndex > 9 Then Return 0 
//---------------------------- APPEON END ----------------------------


ib_tab_change = True

dw_detail.AcceptText()

Integer li_cr
integer ck

ib_fld_error = False

li_cr = dw_detail.GetRow()

IF oldindex = 2 THEN
	IF IsNull( dw_detail.GetItemString( li_cr, "facility_name" ) ) OR +&
		dw_detail.GetItemString( li_cr, "facility_name" ) = ""	THEN
		MessageBox("Required Field", "Please enter the facility name." )
		dw_detail.SetFocus( )	
		dw_detail.SetColumn( "facility_name" )		
		ib_fld_error = True
		Return 1
	END IF

	IF IsNull( dw_detail.GetItemString( li_cr, "street" ) ) OR +& 
		dw_detail.GetItemString( li_cr, "street" ) = "" THEN
		MessageBox("Required Field", "Please enter the street." )
		dw_detail.SetFocus( )	
		dw_detail.SetColumn( "street" )	
		ib_fld_error = True
		Return 1	
	END IF
ELSEIF oldindex = 3 THEN
	IF IsNull( dw_detail.GetItemString( li_cr, "return_facility_name" ) ) OR +&
		dw_detail.GetItemString( li_cr, "return_facility_name" ) = "" THEN
		MessageBox("Required Field", "Please enter the return facility name." )
		dw_detail.SetFocus( )	
		dw_detail.SetColumn( "return_facility_name" )	
		ib_fld_error = True
		Return 1	
	END IF

	IF IsNull( dw_detail.GetItemString( li_cr, "return_street" ) ) OR + & 
		dw_detail.GetItemString( li_cr, "return_street" ) = "" THEN
		MessageBox("Required Field", "Please enter the return street." )
		dw_detail.SetFocus( )	
		dw_detail.SetColumn( "return_street" )	
		ib_fld_error = True
		Return 1	
	END IF
ELSEIF oldindex = 4 THEN
	IF IsNull( dw_detail.GetItemNumber( li_cr, "default_data_view_id" )) OR +& 
		dw_detail.GetItemNumber( li_cr, "default_data_view_id" ) = 0  THEN
		MessageBox("Required Field", "Please enter the default data view for this facility." )
		dw_detail.SetFocus( )	
		dw_detail.SetColumn( "default_data_view_id" )	
		ib_fld_error = True
		Return 1	
	END IF

	//--------------------------- APPEON BEGIN ---------------------------
	//$<modify> 07.05.2006 By: LeiWei
	//$<reason> Check word templete storage type
	
	/*
	IF IsNull( dw_detail.GetItemString( li_cr, "letter_path" ) ) OR +& 
		dw_detail.GetItemString( li_cr, "letter_path" ) = "" THEN
		MessageBox("Required Field", "Please enter the default letter path for this facility." )
		dw_detail.SetFocus( )	
		dw_detail.SetColumn( "letter_path" )	
		ib_fld_error = True
		Return 1	
	END IF

	IF Right(dw_detail.GetItemString( li_cr, "letter_path" ), 1 ) <> "\" THEN
		MessageBox("Validation Error", "The letter path field must end with the charactor \")
		dw_detail.SetFocus()
		dw_detail.SetColumn( "letter_path" )
		ib_fld_error = True
		Return 1
	END IF
	*/
	
	Integer li_word_storage_type
	
	li_word_storage_type = Integer(gnv_data.of_getitem( "icred_settings", "set_50", FALSE))
	IF Isnull(li_word_storage_type) THEN li_word_storage_type = 0

	IF IsNull( dw_detail.GetItemString( li_cr, "letter_path" ) ) OR +& 
		dw_detail.GetItemString( li_cr, "letter_path" ) = "" THEN
		if Upper( AppeonGetClientType() ) = "WEB" OR li_word_storage_type = 1 then
			MessageBox("Required Field", "Please enter Letter Storage Area for this facility." )
		else
			MessageBox("Required Field", "Please enter the default letter path for this facility." )
		end if
		dw_detail.SetFocus( )	
		dw_detail.SetColumn( "letter_path" )	
		ib_fld_error = True
		Return 1	
	END IF

	IF Upper( AppeonGetClientType() ) = "PB" AND li_word_storage_type = 0 THEN
		IF Right(dw_detail.GetItemString( li_cr, "letter_path" ), 1 ) <> "\" THEN
			MessageBox("Validation Error", "The letter path field must end with the charactor \")
			dw_detail.SetFocus()
			dw_detail.SetColumn( "letter_path" )
			ib_fld_error = True
			Return 1
		END IF
	END IF
	
	//---------------------------- APPEON END ----------------------------

END IF



IF newindex = 1 OR newindex = 6 OR newindex = 7 OR newindex = 8  THEN
	dw_detail.Visible = False
ELSE
	dw_detail.Visible = True	
END IF

	IF newindex = 2 THEN
		Parent.dw_detail.Object.DataWindow.VerticalScrollPosition = 0

//		dw_detail.SetTabOrder( "facility_name", 1 )
//		dw_detail.SetTabOrder( "street", 2 )
//		dw_detail.SetTabOrder( "street_2", 3 )
//		dw_detail.SetTabOrder( "city", 4 )
//		dw_detail.SetTabOrder( "state", 5 )
//		dw_detail.SetTabOrder( "zip", 6 )
//		dw_detail.SetTabOrder( "phone", 7 )
//		dw_detail.SetTabOrder( "ext", 8 )
//		dw_detail.SetTabOrder( "fax", 9 )
//		dw_detail.SetTabOrder( "contact", 10 )
//		dw_detail.SetTabOrder( "web_address", 11 )
//		dw_detail.SetTabOrder( "email_address", 12 )		
//		dw_detail.SetColumn( "facility_name" )		
	ELSEIF newindex = 3 THEN
		dw_detail.Object.DataWindow.VerticalScrollPosition='1888'

//		dw_detail.SetTabOrder( "return_facility_name", 1 )
//		dw_detail.SetTabOrder( "return_street", 2 )
//		dw_detail.SetTabOrder( "return_street_2", 3 )
//		dw_detail.SetTabOrder( "return_city", 4 )
//		dw_detail.SetTabOrder( "return_state", 5 )
//		dw_detail.SetTabOrder( "return_zip", 6 )
//		dw_detail.SetTabOrder( "credentialing_contact_name", 7 )
//		dw_detail.SetTabOrder( "credentialing_contact_title", 8 )
//		dw_detail.SetTabOrder( "return_phone", 9 )
//		dw_detail.SetTabOrder( "return_ext", 10 )
//		dw_detail.SetTabOrder( "return_fax", 11 )
		dw_detail.SetColumn( "return_facility_name" )	
		IF dw_detail.GetItemString( li_cr, "return_facility_name" ) = "" OR +&
		   IsNull( dw_detail.GetItemString( li_cr, "return_facility_name" ) )  THEN
			dw_detail.SetItem( li_cr, "return_facility_name", dw_detail.GetItemString( li_cr, "facility_name" ) )
		END IF
		IF dw_detail.GetItemString( li_cr, "return_street" ) = "" OR +&
		   IsNull( dw_detail.GetItemString( li_cr, "return_street" ) )  THEN
			dw_detail.SetItem( li_cr, "return_street", dw_detail.GetItemString( li_cr, "street" ) )
		END IF		
		IF dw_detail.GetItemString( li_cr, "return_street_2" ) = "" OR +&
		   IsNull( dw_detail.GetItemString( li_cr, "return_street_2" ) )  THEN
			dw_detail.SetItem( li_cr, "return_street_2", dw_detail.GetItemString( li_cr, "street_2" ) )
		END IF		
		IF dw_detail.GetItemString( li_cr, "return_city" ) = "" OR +&
		   IsNull( dw_detail.GetItemString( li_cr, "return_city" ) )  THEN
			dw_detail.SetItem( li_cr, "return_city", dw_detail.GetItemString( li_cr, "city" ) )
		END IF		
		IF dw_detail.GetItemString( li_cr, "return_state" ) = "" OR +&
		   IsNull( dw_detail.GetItemString( li_cr, "return_state" ) )  THEN
			dw_detail.SetItem( li_cr, "return_state", dw_detail.GetItemString( li_cr, "state" ) )
		END IF		
		IF dw_detail.GetItemString( li_cr, "return_zip" ) = "" OR +&
		   IsNull( dw_detail.GetItemString( li_cr, "return_zip" ) )  THEN
			dw_detail.SetItem( li_cr, "return_zip", dw_detail.GetItemString( li_cr, "zip" ) )
		END IF		
		
		
		
	ELSEIF newindex = 4 THEN		
		dw_detail.Object.DataWindow.VerticalScrollPosition='4190'

//		dw_detail.SetTabOrder( "default_data_view_id", 1 )
//		dw_detail.SetTabOrder( "npdb_facility_ein", 2 )
//		dw_detail.SetTabOrder( "npdb_password", 3 )
//		dw_detail.SetTabOrder( "npdb_agent_ein", 4 )
//		dw_detail.SetTabOrder( "letter_path", 5 )
//		dw_detail.SetTabOrder( "reappointment_query_days", 6 )		
		dw_detail.SetColumn( "default_data_view_id" )
		IF ib_adding_new THEN
			datawindowchild dwchild
			dw_detail.GetChild( "default_verif_facility", dwchild )
			dwchild.InsertRow( 1 )
			dwchild.SetItem( 1, "facility_facility_name", dw_detail.GetItemString( dw_detail.GetRow(), "facility_name" ))
			dwchild.SetItem( 1, "facility_id", il_facility_id)			

			dw_detail.GetChild( "default_audit_temp", dwchild )
			dwchild.InsertRow( 1 )
			dwchild.SetItem( 1, "facility_facility_name", dw_detail.GetItemString( dw_detail.GetRow(), "facility_name" ))			
			dwchild.SetItem( 1, "facility_id", il_facility_id ) 						
		END IF
	ELSEIF newindex = 6 THEN

		IF ib_adding_new AND NOT ib_rules_added THEN
			Integer li_rc
			Integer i
			iw_parent_window.Event pfc_save()
			
			IF ib_rules_added = False THEN

				li_rc = tab_facilty.tabpage_verif.dw_copy_rules.RowCount()
				ck = tab_facilty.tabpage_verif.dw_copy_rules.RowsCopy( 1, li_rc, Primary!, tab_facilty.tabpage_verif.dw_verif_rules, 1, Primary! )
				if ck < 1 then
					messagebox("Error creating rules","Unable to create verification rules for this facility.  Contact ContractLogix Technical Support")
				end if
				li_rc = tab_facilty.tabpage_verif.dw_verif_rules.rowcount()
				FOR i = 1 TO li_rc
					tab_facilty.tabpage_verif.dw_verif_rules.SetItem( i, "facility_id", il_facility_id )
				END FOR
	
				//--------------------------- APPEON BEGIN ---------------------------
				//$<ID> PT-03
				//$<comment> 02.13.2006 By: owen chen
				//$<reason> Performance tuning
				//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

				/*
				tab_facilty.tabpage_verif.dw_verif_rules.Update()
				commit using sqlca;
				tab_facilty.tabpage_verif.dw_select_section.Reset()
				tab_facilty.tabpage_verif.dw_select_section.Retrieve( 1 )
				tab_facilty.tabpage_verif.dw_select_section.SelectRow( 1, True )
				*/
				gnv_appeondb.of_startqueue( )
				
				tab_facilty.tabpage_verif.dw_verif_rules.Update()
				commit using sqlca;
				
				gnv_appeondb.of_commitqueue( )
				
				tab_facilty.tabpage_verif.dw_select_section.Reset()
				tab_facilty.tabpage_verif.dw_select_section.Retrieve( 1 )
				tab_facilty.tabpage_verif.dw_select_section.SelectRow( 1, True )
				//---------------------------- APPEON END ----------------------------

				
				IF iw_parent_window.Event pfc_save() < 0 THEN
					Return 1
				END IF		
				ib_rules_added = True
			END IF
			
			ib_rules_added = True			
		END IF
		tab_facilty.tabpage_verif.dw_verif_rules.SetColumn( "required" )
		tab_facilty.tabpage_verif.dw_verif_rules.SetFocus()
	ELSEIF newindex = 7 THEN
		tab_facilty.tabpage_committee.dw_committee.SetColumn( "committee_name" )
		tab_facilty.tabpage_committee.dw_committee.SetFocus()		
	ELSEIF newindex = 5 THEN
		dw_detail.Object.DataWindow.VerticalScrollPosition='5800'
		
		dw_detail.SetColumn( "npdb_query_type" )	
		
	ELSEIF newindex = 9 THEN //Added for Work Flow tab. 18/10/2006 Henry
		dw_detail.Object.DataWindow.VerticalScrollPosition='7680'

		//Retrieve for Work flow DDDW
		If not ib_retrieve_wf Then
			ib_retrieve_wf = true
			of_retrieve_work_flow()
		End If
		
	ELSEIF newindex = 8 THEN
		//dw_dc_browse.Retrieve( il_facility_id )
	END IF


dw_detail.SetFocus()		
end event

on tab_facilty.create
this.tabpage_browse=create tabpage_browse
this.tabpage_address=create tabpage_address
this.tabpage_return=create tabpage_return
this.tabpage_settings=create tabpage_settings
this.tabpage_npdb=create tabpage_npdb
this.tabpage_verif=create tabpage_verif
this.tabpage_committee=create tabpage_committee
this.tabpage_dept_chair=create tabpage_dept_chair
this.tabpage_workflow=create tabpage_workflow
this.Control[]={this.tabpage_browse,&
this.tabpage_address,&
this.tabpage_return,&
this.tabpage_settings,&
this.tabpage_npdb,&
this.tabpage_verif,&
this.tabpage_committee,&
this.tabpage_dept_chair,&
this.tabpage_workflow}
end on

on tab_facilty.destroy
destroy(this.tabpage_browse)
destroy(this.tabpage_address)
destroy(this.tabpage_return)
destroy(this.tabpage_settings)
destroy(this.tabpage_npdb)
destroy(this.tabpage_verif)
destroy(this.tabpage_committee)
destroy(this.tabpage_dept_chair)
destroy(this.tabpage_workflow)
end on

event selectionchanged;ib_tab_change = False
end event

type tabpage_browse from userobject within tab_facilty
integer x = 18
integer y = 112
integer width = 3954
integer height = 1704
long backcolor = 79741120
string text = "Browse"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "DataWindow5!"
long picturemaskcolor = 553648127
dw_browse dw_browse
end type

on tabpage_browse.create
this.dw_browse=create dw_browse
this.Control[]={this.dw_browse}
end on

on tabpage_browse.destroy
destroy(this.dw_browse)
end on

type dw_browse from u_dw within tabpage_browse
integer x = 32
integer y = 36
integer width = 3813
integer height = 1540
integer taborder = 20
string dataobject = "d_facility_setup_browse"
boolean hscrollbar = true
end type

event clicked;call super::clicked;Integer li_row

li_row = This.GetClickedRow( )

IF li_row = 0 THEN
	tab_facilty.tabpage_browse.dw_browse.SetFocus( )
	Return -1
END IF

This.SelectRow( 0, False )
This.SelectRow( li_row, True )
This.ScrollToRow( li_row )
This.SetRow( li_row )
end event

event doubleclicked;tab_facilty.SelectTab( 2 )

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 01/29/2008 By: Ken.Guo
//$<reason> Added it to workaround Web's bug.
//This bug exist in APB 5.1.0306. Later APB version have fixed it.
tab_facilty.Event SelectionChanging(2,1)
tab_facilty.Event SelectionChanging(1,2)
//---------------------------- APPEON END ----------------------------




//tab_facilty.tabpage_dept_chair.dw_dc_browse.Retrieve( This.GetItemNumber( This.GetRow(), "facility_id" ))
//maha moved to rfc event 041404
//IF tab_facilty.tabpage_dept_chair.dw_dc_browse.RowCount( ) = 0 THEN
//	tab_facilty.tabpage_dept_chair.dw_dc_detail.InsertRow( 0 )
//END IF
end event

event retrieveend;call super::retrieveend;Integer li_facility_id

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-04
//$<modify> 02.20.2006 By: owen chen
//$<reason> Performance tuning
//$<modification> Have the application retrieve the database only when
//$<modification> rowcount=1.

/*
IF rowcount > 0 THEN
	li_facility_id = This.GetItemNumber( 1, "facility_id" )	
	dw_detail.Retrieve( li_facility_id )
	il_facility_id = li_facility_id
	IF tab_facilty.tabpage_verif.dw_select_section.RowCount() = 0 THEN
		tab_facilty.tabpage_verif.dw_select_section.Retrieve( 1 )
	END IF
END IF
*/
IF rowcount = 1 THEN
	li_facility_id = This.GetItemNumber( 1, "facility_id" )	
	dw_detail.Retrieve( li_facility_id )
	il_facility_id = li_facility_id
	IF tab_facilty.tabpage_verif.dw_select_section.RowCount() = 0 THEN
		tab_facilty.tabpage_verif.dw_select_section.Retrieve( 1 )
	END IF
END IF
//---------------------------- APPEON END ----------------------------


end event

event rowfocuschanged;call super::rowfocuschanged;IF This.RowCount() > 0 THEN
	il_facility_id = This.GetItemNumber( currentrow, "facility_id" )
	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> PT-05
	//$<modify> 02.10.2006 By: owen chen
	//$<reason> Performance tuning
	//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

	/*
	tab_facilty.tabpage_committee.dw_committee.Retrieve( il_facility_id )
	dw_detail.Retrieve( il_facility_id )
	This.SelectRow( 0, False )
	This.SelectRow( currentrow, True )
	dw_detail.SetFocus()
	iw_parent_window.Title = "Facility Painter  ( " + This.GetItemString( currentrow, "facility_name" ) + " )"
	tab_facilty.tabpage_verif.dw_select_section.Retrieve( 1 )
	//maha moved from doubleclicked event 041404
	tab_facilty.tabpage_dept_chair.dw_dc_browse.Retrieve( This.GetItemNumber( This.GetRow(), "facility_id" ))
	*/

	int li_facilityid
	li_facilityid = This.GetItemNumber( This.GetRow(), "facility_id" )

	tab_facilty.tabpage_verif.dw_select_section.Retrieve( 1 )
	gnv_appeondb.of_startqueue( )

	tab_facilty.tabpage_committee.dw_committee.Retrieve( il_facility_id )
	dw_detail.Retrieve( il_facility_id )

	//maha moved from doubleclicked event 041404
	tab_facilty.tabpage_dept_chair.dw_dc_browse.Insertrow(0)
	tab_facilty.tabpage_dept_chair.dw_dc_browse.Retrieve( li_facilityid )
	gnv_appeondb.of_commitqueue( )
	
	tab_facilty.tabpage_dept_chair.dw_dc_browse.event rowfocuschanged(tab_facilty.tabpage_dept_chair.dw_dc_browse.getrow())
	
	This.SelectRow( 0, False )
	This.SelectRow( currentrow, True )
	dw_detail.SetFocus()
	
	//$<modify> 07.07.2008 by Andy
	String ls_label
	SELECT TOP 1 app_stat_facility_label INTO :ls_label FROM icred_settings;	
	if isnull(ls_label) or trim(ls_label) = '' then ls_label = 'Facility'
	//iw_parent_window.Title = "Facility Painter  ( " + This.GetItemString( currentrow, "facility_name" ) + " )"
	iw_parent_window.Title = ls_label + " Painter  ( " + This.GetItemString( currentrow, "facility_name" ) + " )"
	//end modify 07.07.2008
	//---------------------------- APPEON END ----------------------------
	
	IF tab_facilty.tabpage_dept_chair.dw_dc_browse.RowCount( ) = 0 THEN
		tab_facilty.tabpage_dept_chair.dw_dc_detail.InsertRow( 0 )
	END IF

	//--------------------------- APPEON BEGIN ---------------------------
	//$<add> 06.07.2006 By: Rodger Wu
	//$<reason> Filter data of the dropdown datawindow for verification 
	//$<reason> documents and expiration docuemnts.
	of_filter_docs( False )
	//---------------------------- APPEON END ----------------------------
END IF
end event

type tabpage_address from userobject within tab_facilty
integer x = 18
integer y = 112
integer width = 3954
integer height = 1704
long backcolor = 79741120
string text = "Facility Address"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "Library!"
long picturemaskcolor = 553648127
end type

type tabpage_return from userobject within tab_facilty
integer x = 18
integer y = 112
integer width = 3954
integer height = 1704
long backcolor = 80269524
string text = "Return Address"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
string picturename = "Custom002!"
long picturemaskcolor = 553648127
end type

type tabpage_settings from userobject within tab_facilty
integer x = 18
integer y = 112
integer width = 3954
integer height = 1704
long backcolor = 80269524
string text = "Settings"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
string picturename = "UserObject!"
long picturemaskcolor = 553648127
end type

type tabpage_npdb from userobject within tab_facilty
integer x = 18
integer y = 112
integer width = 3954
integer height = 1704
long backcolor = 80269524
string text = "NPDB/OIG"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
string picturename = "Custom043!"
long picturemaskcolor = 553648127
end type

type tabpage_verif from userobject within tab_facilty
integer x = 18
integer y = 112
integer width = 3954
integer height = 1704
long backcolor = 80269524
string text = "Verif. Rules"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
string picturename = "Custom038!"
long picturemaskcolor = 553648127
cb_2 cb_2
dw_verif_rules dw_verif_rules
dw_select_section dw_select_section
dw_copy_rules dw_copy_rules
end type

on tabpage_verif.create
this.cb_2=create cb_2
this.dw_verif_rules=create dw_verif_rules
this.dw_select_section=create dw_select_section
this.dw_copy_rules=create dw_copy_rules
this.Control[]={this.cb_2,&
this.dw_verif_rules,&
this.dw_select_section,&
this.dw_copy_rules}
end on

on tabpage_verif.destroy
destroy(this.cb_2)
destroy(this.dw_verif_rules)
destroy(this.dw_select_section)
destroy(this.dw_copy_rules)
end on

type cb_2 from commandbutton within tabpage_verif
boolean visible = false
integer x = 1979
integer y = 1304
integer width = 247
integer height = 108
integer taborder = 31
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "set false"
end type

event clicked;ib_rules_added = false
end event

type dw_verif_rules from u_dw within tabpage_verif
integer x = 859
integer y = 48
integer width = 1833
integer height = 1532
integer taborder = 30
string dataobject = "d_verification_setup"
boolean vscrollbar = false
end type

event buttonclicked;string docname, named

integer value

gf_load_dir_path() //Added by Ken.Guo on 2009-03-10
//value = GetFileOpenName("Select File",&
//+ docname, named, "DOC", &
//	+ "Doc Files (*.DOC),*.DOC")			//Added By Mark Lee 08/15/2014
n_getfilename     ln_getfilename
value = ln_getfilename.of_getopenfilename("Select File",&
				+ docname, named, "DOC", &
		 + "Doc Files (*.DOC),*.DOC")
gf_save_dir_path(docname) //Added by Ken.Guo on 2009-03-10
//ChangeDirectory(gs_current_path) //Add by Evan 12/11/2008

IF value = 1 THEN
	IF dwo.name = "exp_letter" THEN
		This.SetItem( row, "exp_cred_letter_doc_nm", named )	
	ELSE
		This.SetItem( row, "init_veif_letter_doc_nm", named )	
	END IF
END IF


end event

event itemchanged;call super::itemchanged;Integer li_screen_id
Integer li_found
String ls_fld_nm
String ls_data
Integer nullval
DataWindowChild dwchild

SetNull( nullval )

IF This.GetColumnName() =  "verify_data" THEN
	//IF data = "N" THEN
	//	This.SetItem( row, "exp_cred_que_letters_days", 0 )
	//END IF
END IF

ls_fld_nm = This.GetColumnName()
IF  ls_fld_nm = "default_verif_means" THEN
	This.GetChild( "default_verif_means", dwchild )
	li_found = dwchild.Find( "lookup_code = " + data, 1, 1000 )
	ls_data = dwchild.GetItemString( li_found, "code" )
	IF Upper( ls_data ) = "IVERIFY" THEN
		li_screen_id = This.GetItemNumber( row, "screen_id" )
		IF li_screen_id <> 4 AND li_screen_id <> 5 AND li_screen_id <> 6 AND li_screen_id <> 7 AND li_screen_id <> 20 THEN
			MessageBox( "iVerify", "iVerify can only be used to verify Education, Training, Licensure, DEA or Board Certification.  Please modify." ) 
		END IF
	END IF
END IF
end event

type dw_select_section from u_dw within tabpage_verif
event pfc_after_select ( )
event ue_goto_status ( )
integer x = 32
integer y = 44
integer width = 745
integer height = 1540
integer taborder = 20
boolean titlebar = true
string title = "Select Data Screen"
string dataobject = "d_data_view_screens_list"
borderstyle borderstyle = stylebox!
end type

event clicked;call super::clicked;Integer li_row

li_row = This.GetClickedRow()

IF li_row > 0 THEN
	//--------------------------- APPEON BEGIN ---------------------------
	//$<comment> 08.03.2006 By: LeiWei
	//$<reason> Fix a defect.
	/*
	This.SelectRow( 0, False )
	This.SelectRow( li_row, True )
	This.ScrollToRow( li_row )
	*/
	//---------------------------- APPEON END ----------------------------
	
	This.SetRow( li_row )
END IF
end event

event retrieveend;call super::retrieveend;Integer li_screen_id

li_screen_id = This.GetItemNumber( 1, "screen_id" )
dw_verif_rules.Retrieve( il_facility_id, li_screen_id )
This.SelectRow( 1, True )

end event

event rowfocuschanged;call super::rowfocuschanged;Integer li_screen_id

IF currentrow > 0 THEN
	IF IsValid(iw_parent_window) /*AND ib_adding_new = False*/ THEN  //Commented By Ken.Guo 05.23.2008.Fixed BugK052101.
		IF iw_parent_window.Event pfc_save( ) < 0 THEN
			Return -1
		END IF
	END IF
	li_screen_id = This.GetItemNumber( currentrow, "screen_id" )
	dw_verif_rules.Retrieve( il_facility_id, li_screen_id )
	
	//--------------------------- APPEON BEGIN ---------------------------
	//$<add> 08.03.2006 By: LeiWei
	//$<reason> Fix a defect.

	This.SelectRow( 0, False )
	This.SelectRow( currentrow, True )
	This.ScrollToRow( currentrow )

	//---------------------------- APPEON END ----------------------------

END IF

end event

event pfc_deleterow;Return 1
end event

event pfc_addrow;Return 1
end event

event pfc_firstpage;RETURN 0
end event

event pfc_lastpage;RETURN 0
end event

event pfc_nextpage;RETURN 0
end event

event pfc_previouspage;RETURN 0
end event

type dw_copy_rules from u_dw within tabpage_verif
boolean visible = false
integer x = 768
integer y = 656
integer width = 352
integer height = 200
integer taborder = 11
string dataobject = "d_facility_rules_all"
boolean vscrollbar = false
end type

event constructor;This.of_SetTransObject( SQLCA )
This.Retrieve( )
end event

type tabpage_committee from userobject within tab_facilty
integer x = 18
integer y = 112
integer width = 3954
integer height = 1704
long backcolor = 79741120
string text = "Committees"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "Picture!"
long picturemaskcolor = 553648127
dw_committee dw_committee
cb_add_committee cb_add_committee
end type

on tabpage_committee.create
this.dw_committee=create dw_committee
this.cb_add_committee=create cb_add_committee
this.Control[]={this.dw_committee,&
this.cb_add_committee}
end on

on tabpage_committee.destroy
destroy(this.dw_committee)
destroy(this.cb_add_committee)
end on

type dw_committee from u_dw within tabpage_committee
integer x = 32
integer y = 44
integer width = 1216
integer height = 540
integer taborder = 11
string dataobject = "d_committee_setup"
end type

event constructor;This.of_SetTransObject( SQLCA )
ib_rmbmenu	= False



end event

event pfc_preupdate;call super::pfc_preupdate;integer i

for i = 1 to this.rowcount()
	if isnull(this.getitemstring(1,"committee_name")) then
		messagebox("Data entry error","Committee on line " + string(1) + " does not have a name.  Please enter name and resave.")
		return -1
	end if
next

return 1
end event

type cb_add_committee from u_cb within tabpage_committee
integer x = 37
integer y = 608
integer width = 407
integer height = 84
integer taborder = 11
boolean bringtotop = true
string text = "&Add Committee"
end type

event clicked;Integer li_nr
Integer li_committee_id

//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 01.11.2008 By: Evan
//$<reason> Fix BugS122705	about when clicking Add Committee twice, the following error occurs.
//if dw_committee.rowcount() > 0 then cb_save.triggerevent(clicked!) //maha 102300
if dw_committee.ModifiedCount() > 0 then
	li_nr = cb_save.Event Clicked()
	if li_nr = -1 then Return
end if
//---------------------------- APPEON END ----------------------------

li_nr = dw_committee.InsertRow( 0 )

SELECT Max( committee_id )  
INTO :li_committee_id  
FROM committee_lookup  ;

li_committee_id++

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-06
//$<comment> 02.13.2006 By: owen chen
//$<reason> Performance tuning
//$<modification> Comment out the following script since the previous script has already
//$<modification> obtained value for li_commitee_id.
/*
li_committee_id = gnv_app.of_get_id("COMMITTEE")
*/
//---------------------------- APPEON END ----------------------------

dw_committee.SetItem( li_nr, "committee_id", li_committee_id)
dw_committee.SetItem( li_nr, "facility_id", il_facility_id)
dw_committee.ScrollToRow( li_nr )
dw_committee.SetRow( li_nr )
dw_committee.SetFocus( )


end event

type tabpage_dept_chair from userobject within tab_facilty
integer x = 18
integer y = 112
integer width = 3954
integer height = 1704
long backcolor = 80269524
string text = "Dept. Chair"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
string picturename = "Custom076!"
long picturemaskcolor = 553648127
cb_1 cb_1
cb_del_chair1 cb_del_chair1
cb_add_chair1 cb_add_chair1
dw_dc_browse dw_dc_browse
dw_dc_detail dw_dc_detail
end type

on tabpage_dept_chair.create
this.cb_1=create cb_1
this.cb_del_chair1=create cb_del_chair1
this.cb_add_chair1=create cb_add_chair1
this.dw_dc_browse=create dw_dc_browse
this.dw_dc_detail=create dw_dc_detail
this.Control[]={this.cb_1,&
this.cb_del_chair1,&
this.cb_add_chair1,&
this.dw_dc_browse,&
this.dw_dc_detail}
end on

on tabpage_dept_chair.destroy
destroy(this.cb_1)
destroy(this.cb_del_chair1)
destroy(this.cb_add_chair1)
destroy(this.dw_dc_browse)
destroy(this.dw_dc_detail)
end on

type cb_1 from commandbutton within tabpage_dept_chair
integer x = 23
integer y = 1428
integer width = 247
integer height = 84
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Sort"
end type

event clicked;string null_str

SetNull(null_str)
dw_dc_browse.SetSort(null_str)
dw_dc_browse.Sort( )

end event

type cb_del_chair1 from u_cb within tabpage_dept_chair
integer x = 2619
integer y = 1424
integer width = 407
integer height = 84
integer taborder = 100
string text = "Delete"
end type

event clicked;call super::clicked;Integer li_ans
Integer li_find


if dw_dc_detail.rowcount() < 1 then return

li_ans = MessageBox("Delete", "Are you sure you want to Delete the current record?", StopSign!, YesNo!, 1 )

IF li_ans = 2 THEN
	Return
END IF

dw_dc_detail.DeleteRow( dw_dc_detail.GetRow( ) )

dw_dc_detail.Update( )

dw_dc_browse.Retrieve( il_facility_id )

dw_dc_browse.SelectRow( 0, False )

if dw_dc_detail.GetRow() < 1 then return

//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 01.18.2006 By: LeiWei
//$<reason> Fix a defect.
//li_find = dw_dc_browse.Find( "dept_chair_id = " + String( dw_dc_detail.GetItemNumber( dw_dc_detail.GetRow(), "dept_chair_id" ) ), 1, 10000 )
Long ll_dept_chair_id
ll_dept_chair_id = dw_dc_detail.GetItemNumber( dw_dc_detail.GetRow(), "dept_chair_id" ) 
If Isnull(ll_dept_chair_id) Then ll_dept_chair_id = 0
li_find = dw_dc_browse.Find( "dept_chair_id = " + String( ll_dept_chair_id ), 1, 10000 )
//---------------------------- APPEON END ----------------------------

dw_dc_browse.SelectRow( li_find, True )
dw_dc_browse.ScrollToRow( li_find )
dw_dc_browse.SetRow( li_find )
end event

type cb_add_chair1 from u_cb within tabpage_dept_chair
integer x = 2194
integer y = 1424
integer width = 407
integer height = 84
integer taborder = 11
string text = "Add"
end type

event clicked;call super::clicked;Integer li_rc

li_rc = dw_dc_detail.InsertRow( 0 )

dw_dc_detail.SetFocus( )

dw_dc_detail.SetColumn( "department_code" )

dw_dc_detail.SetRow( li_rc )
dw_dc_detail.ScrollToRow( li_rc )
end event

type dw_dc_browse from u_dw within tabpage_dept_chair
integer x = 18
integer y = 28
integer width = 2144
integer height = 1380
integer taborder = 11
string dataobject = "d_department_chair_browse"
end type

event retrieveend;call super::retrieveend;//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-07
//$<modify> 02.21.2006 By: owen chen
//$<reason> Performance tuning
//$<modification> Have the application retrieve the database only when rowcount=1 to reduce calls to server.
/*
IF rowcount > 0 THEN
	dw_dc_detail.Retrieve( This.GetItemNumber( 1, "dept_chair_id" ) )
	dw_dc_detail.SetFocus( )
END IF
*/
IF rowcount = 1 THEN
	dw_dc_detail.Retrieve( This.GetItemNumber( 1, "dept_chair_id" ) )
	dw_dc_detail.SetFocus( )
END IF
//---------------------------- APPEON END ----------------------------


end event

event clicked;call super::clicked;IF row > 0 THEN
	This.SelectRow( 0, False )
	This.SelectRow( row, True )	
END IF
end event

event rowfocuschanged;call super::rowfocuschanged;Long 	ll_dept_chair_id

IF currentrow > 0 THEN
	ll_dept_chair_id = This.GetItemNumber( currentrow, "dept_chair_id" )
	dw_dc_detail.Retrieve( 	ll_dept_chair_id  )
	dw_dc_detail.SetFocus( )
	dw_dc_detail.SetColumn( "department_code" )
END IF
end event

event constructor;call super::constructor;This.of_SetUpdateAble( False )
This.SetTransObject( SQLCA )

DataWindowChild dwchild

This.SetTransObject( SQLCA )

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-08
//$<modify> 02.10.2006 By: owen chen
//$<reason> Performance tuning
//$<modification> Write script to retrieve data from a cache instead of from the database.

/*
This.GetChild( "department_code", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("Department")
dwchild.InsertRow( 1 )


This.GetChild( "section_code", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("Section")
dwchild.InsertRow( 1 )
*/

This.GetChild( "department_code", dwchild )
dwchild.SetTransObject( SQLCA )
gnv_data.of_set_dwchild_fromcache("code_lookup" , "upper(lookup_name) = '" + upper('Department') + "'", dwchild)
dwchild.InsertRow( 1 )


This.GetChild( "section_code", dwchild )
dwchild.SetTransObject( SQLCA )
gnv_data.of_set_dwchild_fromcache("code_lookup" , "upper(lookup_name) = '" + upper('Section') + "'", dwchild)
dwchild.InsertRow( 1 )

//---------------------------- APPEON END ----------------------------





end event

type dw_dc_detail from u_dw within tabpage_dept_chair
integer x = 2194
integer y = 28
integer width = 1618
integer height = 1380
integer taborder = 11
string dataobject = "d_department_chair_detail"
boolean vscrollbar = false
end type

event constructor;call super::constructor;DataWindowChild dwchild

This.SetTransObject( SQLCA )

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-09
//$<modify> 02.10.2006 By: owen chen
//$<reason> Performance tuning
//$<modification> Write script to retrieve data from a cache instead of from the database.
/*
This.GetChild( "department_code", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("Department")
dwchild.InsertRow( 1 )


This.GetChild( "section_code", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("Section")
dwchild.InsertRow( 1 )
*/

This.GetChild( "department_code", dwchild )
dwchild.SetTransObject( SQLCA )
gnv_data.of_set_dwchild_fromcache("code_lookup" , "upper(lookup_name) = '" + upper('Department') + "'", dwchild)
dwchild.InsertRow( 1 )


This.GetChild( "section_code", dwchild )
dwchild.SetTransObject( SQLCA )
gnv_data.of_set_dwchild_fromcache("code_lookup" , "upper(lookup_name) = '" + upper('Section') + "'", dwchild)
dwchild.InsertRow( 1 )

//---------------------------- APPEON END ----------------------------




end event

event pfc_preupdate;call super::pfc_preupdate;Long ll_dept_chair_id
Integer i
Integer li_rc

SELECT Max( dept_chair_id )
INTO :ll_dept_chair_id
FROM dept_chair;
IF SQLCA.SQLCODE = -1 THEN
	MessageBox("SQL Error", SQLCA.SQLERRTEXT )
	Return -1
END IF


IF IsNull( ll_dept_chair_id ) THEN
	ll_dept_chair_id = 0
END IF

li_rc = This.RowCount()


FOR i = 1 TO li_rc
	IF This.GetItemStatus( i, 0, Primary! ) = NewModified! THEN
		IF IsNull( This.GetItemNumber( i, "department_code" ) ) THEN
			MessageBox("Required Data", "You must select a Department for the Department Chair Record." )
			This.ScrollToRow( i )
			This.SetRow( i )
			This.SetFocus( )
			tab_facilty.SelectTab( 8 )
			Return -1
		END IF
		IF IsNull( This.GetItemString( i, "name" ) ) THEN
			MessageBox("Required Data", "You must select a chairperson Name for the Department Chair Record." )
			This.ScrollToRow( i )
			This.SetRow( i )
			This.SetFocus( )
			tab_facilty.SelectTab( 8 )
			Return -1
		END IF		
	END IF
END FOR


FOR i = 1 TO li_rc
	IF This.GetItemStatus( i, 0, Primary! ) = NewModified! THEN
		ll_dept_chair_id++
		This.SetItem( i, "dept_chair_id", ll_dept_chair_id )
		This.SetItem( i, "facility_id", il_facility_id )		
	END IF
END FOR

il_last_dept_chair = This.GetItemNumber( This.GetRow( ), "dept_chair_id" )

Return 1
end event

event pfc_postupdate;call super::pfc_postupdate;dw_dc_browse.Retrieve( il_facility_id )

Return 1
end event

event buttonclicked;call super::buttonclicked;//--------------------------- APPEON BEGIN ---------------------------
//$<  Add > 2008-07-29 By: Scofield
//$<Reason> Popup a dialog to input the phone

String	ls_Phone,ls_fax,ls_RetParm

This.AcceptText()
if row > 0 and row <= This.RowCount() then
	if dwo.name = 'b_phone' then
		ls_Phone = This.GetItemString(row,'phone')
		OpenWithParm(w_phonedetail,ls_Phone)
		
		ls_RetParm = Message.StringParm
		
		if ls_RetParm <> 'Cancel' then
			This.SetItem(row,'phone',ls_RetParm)
		end if
		This.SetColumn('phone')
	elseif dwo.name = 'b_fax' then
		ls_fax = This.GetItemString(row,'fax')
		if IsNull(ls_fax) then ls_fax = ""
		OpenWithParm(w_phonedetail,"Fax:" + ls_fax)
		
		ls_RetParm = Message.StringParm
		
		if ls_RetParm <> 'Cancel' then
			This.SetItem(row,'fax',ls_RetParm)
		end if
		This.SetColumn('fax')
	end if
end if
//---------------------------- APPEON END ----------------------------

end event

type tabpage_workflow from userobject within tab_facilty
integer x = 18
integer y = 112
integer width = 3954
integer height = 1704
long backcolor = 80269524
string text = "Work Flow"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
string picturename = "Custom092!"
long picturemaskcolor = 536870912
end type

type dw_detail from u_dw within pfc_cst_u_facility_setup
event ue_scroll ( )
integer x = 59
integer y = 152
integer width = 3831
integer height = 1584
integer taborder = 20
string dataobject = "d_facility_setup"
boolean vscrollbar = false
boolean livescroll = false
end type

event ue_scroll();IF NOT ib_tab_change THEN

	CHOOSE CASE  tab_facilty.SelectedTab 
		CASE 2
			dw_detail.Object.DataWindow.VerticalScrollPosition='0'
			dw_detail.SetColumn( "email_address" )				
		CASE 3
			dw_detail.Object.DataWindow.VerticalScrollPosition='1888'		
			dw_detail.SetColumn( "return_fax" )				
		CASE 4
			dw_detail.Object.DataWindow.VerticalScrollPosition='4190'				
			dw_detail.SetColumn( "work_gap_check" )						
		CASE 5
			dw_detail.Object.DataWindow.VerticalScrollPosition='5800'		
			dw_detail.SetColumn( "npdb_cert_date" )	
		CASE 9 //Added for Work flow. 18/10/2006 Henry
			dw_detail.Object.DataWindow.VerticalScrollPosition='7680'		
			dw_detail.SetColumn( "wf_expiring_appointment" )	
	END CHOOSE

END IF
This.SetRedraw( True )
end event

event pfc_postupdate;call super::pfc_postupdate;//Integer li_rc
//Integer i

//IF ib_rules_added = False THEN
//
//	li_rc = tab_facilty.tabpage_verif.dw_copy_rules.RowCount()
//	tab_facilty.tabpage_verif.dw_copy_rules.RowsCopy( 1, li_rc, Primary!, tab_facilty.tabpage_verif.dw_verif_rules, 1, Primary! )
//	
//	FOR i = 1 TO li_rc
//		tab_facilty.tabpage_verif.dw_verif_rules.SetItem( i, "facility_id", il_facility_id )
//	END FOR
//	
//	li_rc = tab_facilty.tabpage_verif.dw_verif_rules.rowcount()
//	tab_facilty.tabpage_verif.dw_verif_rules.Update()
//	commit using sqlca;
//	tab_facilty.tabpage_verif.dw_select_section.Reset()
//	tab_facilty.tabpage_verif.dw_select_section.Retrieve( 1 )
//	tab_facilty.tabpage_verif.dw_select_section.SelectRow( 1, True )
//	IF iw_parent_window.Event pfc_save() < 0 THEN
//		Return 1
//	END IF		
//	ib_rules_added = True
//	MessageBox("User Painter", "To assign this facility to a user you need to update the User Painter.")
//END IF
//
//string ls_sql
//integer facid
//
//facid = this.getitemnumber(1,"facility_id")
////set verif rules for duplicate letters maha 041801
//if this.getitemnumber(1,"dupeset") = 1 then
//	Update facility_ver_rules 
//	set ver_ltr_doc = 'Y'	
//	where facility_id = :facid and screen_id in (7,10);
//
//else 
//	Update facility_ver_rules 
//	set ver_ltr_doc = 'N'	
//	where facility_id = :facid and screen_id in (7,10);
//end if
// 
// commit using sqlca;


RETURN 1


end event

event pfc_preupdate;call super::pfc_preupdate;long i
long u
long li_rc
long li_rec_id
long li_facility_id
long li_user_cnt
long li_access_rights
n_ds lds_users
String ls_user_id
String ls_version
//Start Code Change ---- 01.25.2007 #V7 maha changed integers to longs


//check to see if security is installed, if it is not then give access to new view
//ls_version = ProfileString(gs_IniFilePathName, "setup", "version", "None")
ls_version = "EE448738514625"
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-10
//$<modify> 03.09.2006 By: LiuHongXin
//$<reason> The Web application does not need to check whether there is an INI file on local machine.
//$<modification> Make an condition that when the application runs on the Web, the application does not check
//$<modification> the local INI file.
/*
IF NOT FileExists( gs_dir_path + gs_DefDirName + "\intellicred.ini" ) THEN
	MessageBox("ini File Error", "No intellicred.ini file found at: " + gs_dir_path + gs_DefDirName + "\intellicred.ini" )
	Return -1
END IF
*/
If appeongetclienttype() = 'PB' Then
	IF NOT FileExists( gs_IniFilePathName ) THEN
		MessageBox("ini File Error", "No intellicred.ini file found at: " + gs_IniFilePathName )
		Return -1
	END IF
END IF
//---------------------------- APPEON END ----------------------------

IF ls_version = "None" THEN
	MessageBox("Error", "Version number not setup.")
	RETURN -1
END IF

IF MID( ls_version, 6, 1) = "7" THEN
	li_access_rights = 0
ELSE
	li_access_rights = 1
END IF


lds_users = CREATE n_ds
lds_users.DataObject = "d_list_of_users"
lds_users.SetTransObject( SQLCA )
li_user_cnt = lds_users.Retrieve( )

li_rc = This.RowCount()

//Start Code Change ---- 03.01.2006 #302 maha
//IF li_rc > 0 THEN
//	IF Right(dw_detail.GetItemString( 1, "letter_path" ), 1 ) <> "\" THEN
//		MessageBox("Validation Error", "The letter path field must end with the charactor \")
//		dw_detail.SetFocus()
//		dw_detail.SetColumn( "letter_path" )
//		Return -1
//	END IF
//END IF

//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 07.05.2006 By: LeiWei
//$<reason> Check word templete storage type

/*
if this.getitemstatus( 1, "letter_path", primary!) = datamodified! then
	this.setitem(1,"letter_path",of_check_path(this.GetItemString( 1, "letter_path" ),1)) 
end if
*/

Integer li_word_storage_type
li_word_storage_type = Integer(gnv_data.of_getitem( "icred_settings", "set_50", FALSE))
IF Isnull(li_word_storage_type) THEN li_word_storage_type = 0
IF Upper( AppeonGetClientType() ) = "PB" AND li_word_storage_type = 0 THEN
	if this.getitemstatus( 1, "letter_path", primary!) = datamodified! then
		this.setitem(1,"letter_path",of_check_path(this.GetItemString( 1, "letter_path" ),1)) 
	end if
END IF

//---------------------------- APPEON END ----------------------------
//End Code Change---03.01.2006



//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 02.21.2006 By: owen chen
//$<reason> Performance tuning
//$<reason> Reduce the frequency of client-server interactions to improve runtime performance.
/*
li_rec_id = gnv_app.of_get_id( "RIGHTS" )	
*/
//li_rec_id = gnv_app.of_get_id( "RIGHTS" ,li_rc*li_user_cnt)	- 1
li_rec_id = gnv_app.of_get_id( "user_facility_id" ,li_rc*li_user_cnt)	- 1 //by alfee 06.12.2007
//---------------------------- APPEON END ----------------------------

//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 02.21.2006 By: owen chen
//$<reason> Performance tuning
//$<reason> Reduce the frequency of client-server interactions to improve runtime performance.

datastore lds_security_user_facility
int li_rowinst
lds_security_user_facility = create datastore
lds_security_user_facility.dataobject = 'd_security_user_facility_forpt'
lds_security_user_facility.settransobject( sqlca)

//---------------------------- APPEON END ----------------------------

FOR i = 1 TO li_rc  
	IF This.GetItemStatus( i, 0, Primary! ) = NewModified! THEN
		li_facility_id = This.GetItemNumber( i, "facility_id" )		
		FOR u = 1 TO li_user_cnt	
			//--------------------------- APPEON BEGIN ---------------------------
			//$<modify> 02.21.2006 By: owen chen
			//$<reason> Performance tuning
			//$<reason> Reduce the frequency of client-server interactions to improve runtime performance.
			/*
			li_rec_id = gnv_app.of_get_id( "RIGHTS" )			
			*/
			li_rec_id ++
			//---------------------------- APPEON END ----------------------------
			
			//--------------------------- APPEON BEGIN ---------------------------
			//$<modify> 02.21.2006 By: owen chen
			//$<reason> Performance tuning
			//$<reason> Reduce the frequency of client-server interactions to improve runtime performance.
			/*
			ls_user_id = lds_users.GetItemString( u, "user_id" )			
					INSERT INTO security_user_facilities  
					  ( user_facility_id,   
						 user_id,   
						 facility_id,   
						 access_rights )  
					VALUES ( :li_rec_id,   
						 :ls_user_id,   
						 :li_facility_id,   
						 :li_access_rights );
					IF SQLCA.SQLCODE = -1 THEN
						MessageBox( "Insert Error", SQLCA.SQLERRTEXT )
						Return -1
					END IF
			*/
			ls_user_id = lds_users.GetItemString( u, "user_id" )
			li_rowinst = lds_security_user_facility.insertrow(0)
			lds_security_user_facility.object.user_facility_id[li_rowinst] = li_rec_id
			lds_security_user_facility.object.user_id[li_rowinst] = ls_user_id
			lds_security_user_facility.object.facility_id[li_rowinst] = li_facility_id
			lds_security_user_facility.object.access_rights[li_rowinst] = li_access_rights
			//---------------------------- APPEON END ----------------------------
	
		END FOR
	END IF
END FOR

//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 02.21.2006 By: owen chen
//$<reason> Performance tuning
//$<reason> Reduce the frequency of client-server interactions to improve runtime performance.
if lds_security_user_facility.update( ) <> 1 then
	MessageBox( "Insert Error", SQLCA.SQLERRTEXT )
	Return -1
end if

DESTROY lds_security_user_facility;

//---------------------------- APPEON END ----------------------------

DESTROY lds_users;

RETURN Success
	
end event

event buttonclicked;call super::buttonclicked;string is_path
string docname, named
integer value
n_getfilename     ln_getfilename

if dwo.name = "usedefault" then
	//--------------------------- APPEON BEGIN ---------------------------
	//$<add> 06.07.2006 By: Rodger Wu
	//$<reason> Open Letter Storage Area Painter for template management.
	/*
	//messagebox("","yes")
	select letter_path
	into :is_path
	from facility
	where facility_id = 1;
	this.setitem(this.getrow(),"letter_path",is_path)
	*/
	
	String ls_letterpath
	datawindowchild ldwc_child

	if gnv_data.of_getitem('icred_settings' ,'set_50' , False ) = '1' or &
		Upper( appeongetclienttype() ) = 'WEB' then
		ls_letterpath = Trim( This.GetItemString( row, "letter_path" ) )
		if Len( ls_letterpath ) > 0 then
			OpenWithParm( w_area_painter, ls_letterpath + "@path" )
		else
			Open( w_area_painter )
		end if
		
		
		// Refresh dddw
		gnv_appeondb.of_startqueue( )
		
		This.Getchild("letter_path",ldwc_child)
		ldwc_child.Settransobject(sqlca)
		ldwc_child.Retrieve( )
		
		This.Getchild("reapp_doc_name",ldwc_child)
		ldwc_child.Settransobject(sqlca)
		ldwc_child.Retrieve( )
		
		This.Getchild("prov_doc_name",ldwc_child)
		ldwc_child.Settransobject(sqlca)
		ldwc_child.Retrieve( )
		
		This.Getchild("reappah_doc_name",ldwc_child)
		ldwc_child.Settransobject(sqlca)
		ldwc_child.Retrieve( )

		tab_facilty.tabpage_verif.dw_verif_rules.Getchild("exp_cred_letter_doc_nm",ldwc_child)
		ldwc_child.Settransobject(sqlca)
		ldwc_child.Retrieve( )

		tab_facilty.tabpage_verif.dw_verif_rules.Getchild("init_veif_letter_doc_nm",ldwc_child)
		ldwc_child.Settransobject(sqlca)
		ldwc_child.Retrieve( )
		
		gnv_appeondb.of_commitqueue( )
	else
		//messagebox("","yes")
		select letter_path
		into :is_path
		from facility
		where facility_id = 1;
		this.setitem(this.getrow(),"letter_path",is_path)
	end if
	//---------------------------- APPEON END ----------------------------
end if
gf_load_dir_path() //Added by Ken.Guo on 2009-03-10
if dwo.name = "brow_re" then
//	value = GetFileOpenName("Select File", &
//	+ docname, named, "DOC", &
//		+ "Doc Files (*.DOC),*.DOC")				//Added By Mark Lee 08/15/2014
	value = ln_getfilename.of_getopenfilename("Select File",&
                + docname, named, "DOC", &   
			 + "Doc Files (*.DOC),*.DOC")	
	this.setitem(this.getrow(),"reapp_doc_name",named)

end if

if dwo.name = "brow_pr" then
//	value = GetFileOpenName("Select File", &
//	+ docname, named, "DOC", &
//		+ "Doc Files (*.DOC),*.DOC")			//Added By Mark Lee 08/15/2014
	value = ln_getfilename.of_getopenfilename("Select File",&
                + docname, named, "DOC", &   
			 + "Doc Files (*.DOC),*.DOC")	
	this.setitem(this.getrow(),"prov_doc_name",named)

end if

if dwo.name = "brow_ah" then
//	value = GetFileOpenName("Select File", &
//	+ docname, named, "DOC", &
//		+ "Doc Files (*.DOC),*.DOC")				//Added By Mark Lee 08/15/2014
	value = ln_getfilename.of_getopenfilename("Select File",&
                + docname, named, "DOC", &   
			 + "Doc Files (*.DOC),*.DOC")	
	this.setitem(this.getrow(),"reappah_doc_name",named)

end if
gf_save_dir_path(docname) //Added by Ken.Guo on 2009-03-10
//ChangeDirectory(gs_current_path) //Add by Evan 12/11/2008

//--------------------------- APPEON BEGIN ---------------------------
//$<  Add > 2008-07-29 By: Scofield
//$<Reason> Popup a dialog to input the phone

String	ls_Phone,ls_fax,ls_RetParm

This.AcceptText()
if row > 0 and row <= This.RowCount() then
	if dwo.name = 'b_phone' then
		ls_Phone = This.GetItemString(row,'phone')
		OpenWithParm(w_phonedetail,ls_Phone)
		
		ls_RetParm = Message.StringParm
		
		if ls_RetParm <> 'Cancel' then
			This.SetItem(row,'phone',ls_RetParm)
		end if
		This.SetColumn('phone')
	elseif dwo.name = 'b_fax' then
		ls_fax = This.GetItemString(row,'fax')
		if IsNull(ls_fax) then ls_fax = ""
		OpenWithParm(w_phonedetail,"Fax:" + ls_fax)
		
		ls_RetParm = Message.StringParm
		
		if ls_RetParm <> 'Cancel' then
			This.SetItem(row,'fax',ls_RetParm)
		end if
		This.SetColumn('fax')
	elseif dwo.name = 'b_rtn_phone' then
		ls_Phone = This.GetItemString(row,'return_phone')
		OpenWithParm(w_phonedetail,ls_Phone)
		
		ls_RetParm = Message.StringParm
		
		if ls_RetParm <> 'Cancel' then
			This.SetItem(row,'return_phone',ls_RetParm)
		end if
		This.SetColumn('return_phone')
	elseif dwo.name = 'b_rtn_fax' then
		ls_fax = This.GetItemString(row,'return_fax')
		if IsNull(ls_fax) then ls_fax = ""
		OpenWithParm(w_phonedetail,"Fax:" + ls_fax)
		
		ls_RetParm = Message.StringParm
		
		if ls_RetParm <> 'Cancel' then
			This.SetItem(row,'return_fax',ls_RetParm)
		end if
		This.SetColumn('return_fax')
	elseif dwo.name = 'b_cert_phone' then
		ls_Phone = This.GetItemString(row,'npdb_cert_phone')
		OpenWithParm(w_phonedetail,ls_Phone)
		
		ls_RetParm = Message.StringParm
		
		if ls_RetParm <> 'Cancel' then
			This.SetItem(row,'npdb_cert_phone',ls_RetParm)
		end if
		This.SetColumn('npdb_cert_phone')
	end if
end if
//---------------------------- APPEON END ----------------------------

end event

event scrollvertical;call super::scrollvertical;
//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 01.16.2006 By: Ye KaiChun
//$<reason> ScrollVertical is used to provide a special display effect.  
//$<reason> This effect has been implemented by VerticalScrollPosition workaround. 

//IF NOT ib_tab_change THEN
//	This.SetRedraw( False )
//	PostEvent( "ue_scroll" )
//END IF

If Upper(appeongetclienttype()) = "PB" Then
	IF NOT ib_tab_change THEN
		This.SetRedraw( False )
		PostEvent( "ue_scroll" )
	END IF
end if

//---------------------------- APPEON END ----------------------------
end event

event itemchanged;call super::itemchanged;//--------------------------- APPEON BEGIN ---------------------------
//$<add> 06.07.2006 By: Rodger Wu
//$<modification> When a letter path is changed, letters in the corresponding letter path will
//$<modification> be changed accordingly.
if dwo.Name = "letter_path" and row > 0 then
	Post of_filter_docs( True )
end if
//---------------------------- APPEON END ----------------------------
end event

