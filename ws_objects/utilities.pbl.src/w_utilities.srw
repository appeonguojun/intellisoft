$PBExportHeader$w_utilities.srw
forward
global type w_utilities from window
end type
type st_3 from statictext within w_utilities
end type
type cb_priv_report from commandbutton within w_utilities
end type
type cb_prem_utl from commandbutton within w_utilities
end type
type cb_appt_painter from commandbutton within w_utilities
end type
type cb_selects from commandbutton within w_utilities
end type
type cb_id_check from commandbutton within w_utilities
end type
type cb_exp_not_comp from commandbutton within w_utilities
end type
type cb_registry from commandbutton within w_utilities
end type
type cb_user_reset from commandbutton within w_utilities
end type
type cb_bd_exp from commandbutton within w_utilities
end type
type cb_comp_info from commandbutton within w_utilities
end type
type cb_requested from commandbutton within w_utilities
end type
type cb_field_ord_chk from commandbutton within w_utilities
end type
type cb_iapp_fix from commandbutton within w_utilities
end type
type cb_test from commandbutton within w_utilities
end type
type cb_multi_affil_check from commandbutton within w_utilities
end type
type cb_dapplications from commandbutton within w_utilities
end type
type cb_dmanual from commandbutton within w_utilities
end type
type cb_dhelp from commandbutton within w_utilities
end type
type cb_print_reset from commandbutton within w_utilities
end type
type cb_add_help from commandbutton within w_utilities
end type
type cb_assignedusers from commandbutton within w_utilities
end type
type cb_oig from commandbutton within w_utilities
end type
type st_2 from statictext within w_utilities
end type
type cb_user_security from commandbutton within w_utilities
end type
type cb_docids from commandbutton within w_utilities
end type
type cb_update_view from commandbutton within w_utilities
end type
type cb_sys_tables from commandbutton within w_utilities
end type
type cb_stat_check from commandbutton within w_utilities
end type
type cb_view_update from commandbutton within w_utilities
end type
type st_1 from statictext within w_utilities
end type
type sle_pass from singlelineedit within w_utilities
end type
type cb_edit_profile from commandbutton within w_utilities
end type
type cb_support_settings from commandbutton within w_utilities
end type
type cb_new_sys_fields from commandbutton within w_utilities
end type
type cb_sys_fields from commandbutton within w_utilities
end type
type cb_sql from commandbutton within w_utilities
end type
type cb_priv_adj from commandbutton within w_utilities
end type
type cb_comm_review_fix from commandbutton within w_utilities
end type
type cb_links from commandbutton within w_utilities
end type
type cb_settings from commandbutton within w_utilities
end type
type cb_10 from commandbutton within w_utilities
end type
type cb_fix from commandbutton within w_utilities
end type
type dw_3 from datawindow within w_utilities
end type
type cb_3 from commandbutton within w_utilities
end type
type cb_2 from commandbutton within w_utilities
end type
type cb_1 from commandbutton within w_utilities
end type
type dw_facilcomm from datawindow within w_utilities
end type
type dw_praccomm from datawindow within w_utilities
end type
type dw_pracaffil from datawindow within w_utilities
end type
type gb_adm from groupbox within w_utilities
end type
type gb_2 from groupbox within w_utilities
end type
type dw_dvfieldcopy from datawindow within w_utilities
end type
type dw_data_view_list from datawindow within w_utilities
end type
type gb_3 from groupbox within w_utilities
end type
type gb_4 from groupbox within w_utilities
end type
type gb_1 from groupbox within w_utilities
end type
end forward

global type w_utilities from window
integer x = 59
integer y = 48
integer width = 3429
integer height = 2324
boolean titlebar = true
string title = "IntelliCred/App Utilities"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 80269524
st_3 st_3
cb_priv_report cb_priv_report
cb_prem_utl cb_prem_utl
cb_appt_painter cb_appt_painter
cb_selects cb_selects
cb_id_check cb_id_check
cb_exp_not_comp cb_exp_not_comp
cb_registry cb_registry
cb_user_reset cb_user_reset
cb_bd_exp cb_bd_exp
cb_comp_info cb_comp_info
cb_requested cb_requested
cb_field_ord_chk cb_field_ord_chk
cb_iapp_fix cb_iapp_fix
cb_test cb_test
cb_multi_affil_check cb_multi_affil_check
cb_dapplications cb_dapplications
cb_dmanual cb_dmanual
cb_dhelp cb_dhelp
cb_print_reset cb_print_reset
cb_add_help cb_add_help
cb_assignedusers cb_assignedusers
cb_oig cb_oig
st_2 st_2
cb_user_security cb_user_security
cb_docids cb_docids
cb_update_view cb_update_view
cb_sys_tables cb_sys_tables
cb_stat_check cb_stat_check
cb_view_update cb_view_update
st_1 st_1
sle_pass sle_pass
cb_edit_profile cb_edit_profile
cb_support_settings cb_support_settings
cb_new_sys_fields cb_new_sys_fields
cb_sys_fields cb_sys_fields
cb_sql cb_sql
cb_priv_adj cb_priv_adj
cb_comm_review_fix cb_comm_review_fix
cb_links cb_links
cb_settings cb_settings
cb_10 cb_10
cb_fix cb_fix
dw_3 dw_3
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
dw_facilcomm dw_facilcomm
dw_praccomm dw_praccomm
dw_pracaffil dw_pracaffil
gb_adm gb_adm
gb_2 gb_2
dw_dvfieldcopy dw_dvfieldcopy
dw_data_view_list dw_data_view_list
gb_3 gb_3
gb_4 gb_4
gb_1 gb_1
end type
global w_utilities w_utilities

forward prototypes
public function integer of_password (string ai_window)
end prototypes

public function integer of_password (string ai_window);string ls_pass

//ls_pass = string(ai_window)
//messagebox("window",ls_pass)

ls_pass = sle_pass.text

if len(ls_pass) < 1 then
	messagebox("Enter Password","You need to enter the correct support password to use this utility.")
	return -1
end if

if ai_window = "w_sql_send" then
	if upper(ls_pass) <> "INTELLISQL" then
		messagebox("Incorrect Password","You must enter the correct support password for the SQL utility.")
		return -1
	end if
elseif upper(ls_pass) <> "INTELLISET" then
	messagebox("Incorrect Password","You must enter the correct support password to use this utility.")
	return -1
end if

return 1
end function

on w_utilities.create
this.st_3=create st_3
this.cb_priv_report=create cb_priv_report
this.cb_prem_utl=create cb_prem_utl
this.cb_appt_painter=create cb_appt_painter
this.cb_selects=create cb_selects
this.cb_id_check=create cb_id_check
this.cb_exp_not_comp=create cb_exp_not_comp
this.cb_registry=create cb_registry
this.cb_user_reset=create cb_user_reset
this.cb_bd_exp=create cb_bd_exp
this.cb_comp_info=create cb_comp_info
this.cb_requested=create cb_requested
this.cb_field_ord_chk=create cb_field_ord_chk
this.cb_iapp_fix=create cb_iapp_fix
this.cb_test=create cb_test
this.cb_multi_affil_check=create cb_multi_affil_check
this.cb_dapplications=create cb_dapplications
this.cb_dmanual=create cb_dmanual
this.cb_dhelp=create cb_dhelp
this.cb_print_reset=create cb_print_reset
this.cb_add_help=create cb_add_help
this.cb_assignedusers=create cb_assignedusers
this.cb_oig=create cb_oig
this.st_2=create st_2
this.cb_user_security=create cb_user_security
this.cb_docids=create cb_docids
this.cb_update_view=create cb_update_view
this.cb_sys_tables=create cb_sys_tables
this.cb_stat_check=create cb_stat_check
this.cb_view_update=create cb_view_update
this.st_1=create st_1
this.sle_pass=create sle_pass
this.cb_edit_profile=create cb_edit_profile
this.cb_support_settings=create cb_support_settings
this.cb_new_sys_fields=create cb_new_sys_fields
this.cb_sys_fields=create cb_sys_fields
this.cb_sql=create cb_sql
this.cb_priv_adj=create cb_priv_adj
this.cb_comm_review_fix=create cb_comm_review_fix
this.cb_links=create cb_links
this.cb_settings=create cb_settings
this.cb_10=create cb_10
this.cb_fix=create cb_fix
this.dw_3=create dw_3
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_facilcomm=create dw_facilcomm
this.dw_praccomm=create dw_praccomm
this.dw_pracaffil=create dw_pracaffil
this.gb_adm=create gb_adm
this.gb_2=create gb_2
this.dw_dvfieldcopy=create dw_dvfieldcopy
this.dw_data_view_list=create dw_data_view_list
this.gb_3=create gb_3
this.gb_4=create gb_4
this.gb_1=create gb_1
this.Control[]={this.st_3,&
this.cb_priv_report,&
this.cb_prem_utl,&
this.cb_appt_painter,&
this.cb_selects,&
this.cb_id_check,&
this.cb_exp_not_comp,&
this.cb_registry,&
this.cb_user_reset,&
this.cb_bd_exp,&
this.cb_comp_info,&
this.cb_requested,&
this.cb_field_ord_chk,&
this.cb_iapp_fix,&
this.cb_test,&
this.cb_multi_affil_check,&
this.cb_dapplications,&
this.cb_dmanual,&
this.cb_dhelp,&
this.cb_print_reset,&
this.cb_add_help,&
this.cb_assignedusers,&
this.cb_oig,&
this.st_2,&
this.cb_user_security,&
this.cb_docids,&
this.cb_update_view,&
this.cb_sys_tables,&
this.cb_stat_check,&
this.cb_view_update,&
this.st_1,&
this.sle_pass,&
this.cb_edit_profile,&
this.cb_support_settings,&
this.cb_new_sys_fields,&
this.cb_sys_fields,&
this.cb_sql,&
this.cb_priv_adj,&
this.cb_comm_review_fix,&
this.cb_links,&
this.cb_settings,&
this.cb_10,&
this.cb_fix,&
this.dw_3,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.dw_facilcomm,&
this.dw_praccomm,&
this.dw_pracaffil,&
this.gb_adm,&
this.gb_2,&
this.dw_dvfieldcopy,&
this.dw_data_view_list,&
this.gb_3,&
this.gb_4,&
this.gb_1}
end on

on w_utilities.destroy
destroy(this.st_3)
destroy(this.cb_priv_report)
destroy(this.cb_prem_utl)
destroy(this.cb_appt_painter)
destroy(this.cb_selects)
destroy(this.cb_id_check)
destroy(this.cb_exp_not_comp)
destroy(this.cb_registry)
destroy(this.cb_user_reset)
destroy(this.cb_bd_exp)
destroy(this.cb_comp_info)
destroy(this.cb_requested)
destroy(this.cb_field_ord_chk)
destroy(this.cb_iapp_fix)
destroy(this.cb_test)
destroy(this.cb_multi_affil_check)
destroy(this.cb_dapplications)
destroy(this.cb_dmanual)
destroy(this.cb_dhelp)
destroy(this.cb_print_reset)
destroy(this.cb_add_help)
destroy(this.cb_assignedusers)
destroy(this.cb_oig)
destroy(this.st_2)
destroy(this.cb_user_security)
destroy(this.cb_docids)
destroy(this.cb_update_view)
destroy(this.cb_sys_tables)
destroy(this.cb_stat_check)
destroy(this.cb_view_update)
destroy(this.st_1)
destroy(this.sle_pass)
destroy(this.cb_edit_profile)
destroy(this.cb_support_settings)
destroy(this.cb_new_sys_fields)
destroy(this.cb_sys_fields)
destroy(this.cb_sql)
destroy(this.cb_priv_adj)
destroy(this.cb_comm_review_fix)
destroy(this.cb_links)
destroy(this.cb_settings)
destroy(this.cb_10)
destroy(this.cb_fix)
destroy(this.dw_3)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_facilcomm)
destroy(this.dw_praccomm)
destroy(this.dw_pracaffil)
destroy(this.gb_adm)
destroy(this.gb_2)
destroy(this.dw_dvfieldcopy)
destroy(this.dw_data_view_list)
destroy(this.gb_3)
destroy(this.gb_4)
destroy(this.gb_1)
end on

event open;
if w_mdi.of_security_access( 1380 ) = 0   then
	cb_settings.enabled = false
	cb_user_reset.enabled = false
	cb_registry.enabled = false
	cb_selects.enabled = false
end if

if gi_iapp_on = 0  then
	cb_dapplications.enabled = false
end if

if gs_user_id = 'user1' then
	cb_test.visible = true
else
	cb_test.visible = false
end if

gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17

end event

event close;//disCONNECT USING SQLCA;
end event

type st_3 from statictext within w_utilities
integer x = 229
integer y = 1420
integer width = 2126
integer height = 172
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "This screen no longer used.  Use w_utilities5"
boolean focusrectangle = false
end type

type cb_priv_report from commandbutton within w_utilities
integer x = 1042
integer y = 932
integer width = 923
integer height = 88
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Privilege Report"
end type

event clicked;integer res
//res = messagebox("This operation:","This utility will add missing facility committees to current appointments.  Used when committees have been added to a facility after the appointments were created.  ~rContinue?",question!,yesno!,2)

Open(w_privilege_report)
end event

type cb_prem_utl from commandbutton within w_utilities
integer x = 1047
integer y = 1040
integer width = 923
integer height = 88
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "iPrem Utilities"
end type

event clicked;integer res
//res = messagebox("This operation:","This utility will add missing facility committees to current appointments.  Used when committees have been added to a facility after the appointments were created.  ~rContinue?",question!,yesno!,2)

//Open(w_premium_sync)
end event

type cb_appt_painter from commandbutton within w_utilities
integer x = 1051
integer y = 1152
integer width = 923
integer height = 88
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Appointment Status Cust Painter"
end type

event clicked;integer res
res = messagebox("This operation:","This utility is a painter for the Appointment Statue detail 2 custom field labels.    ~rContinue?",question!,yesno!,1)

Open(w_appt_stat_painter)

end event

type cb_selects from commandbutton within w_utilities
integer x = 50
integer y = 1936
integer width = 919
integer height = 88
integer taborder = 220
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "SQL Select Statements"
end type

event clicked;integer r
integer rc
integer d
integer m
integer yr
date dob

 r = 	messagebox("About","This will allow a user to run an SQL statement and export the results.~r~rDo you wish to continue?",Question!,yesno!,2)
if r = 2 then return

openwithparm(w_sql_select_only,"P")
end event

type cb_id_check from commandbutton within w_utilities
integer x = 46
integer y = 1264
integer width = 919
integer height = 88
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "IDs Check"
end type

event clicked;integer r

 r = 	messagebox("About","This function will the IDs table to make sure prac_ids, rec_ids, lookup_codes,etc. are in sync.~rWill NOT work for rec_id on custom tables.~rContinue?",Question!,yesno!,2)
if r = 2 then return

open(w_ids_check)


end event

type cb_exp_not_comp from commandbutton within w_utilities
integer x = 46
integer y = 1152
integer width = 919
integer height = 88
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Exp Verififications not Completed "
end type

event clicked;integer r

 r = 	messagebox("About","This function will display an updateable list of all incompleted expiring verifications where the expiration date is beyond today's date.~rFor items beyon 30 days, this could indicate the data record was completed but not the verification.~rContinue?",Question!,yesno!,2)
if r = 2 then return

openwithparm(w_utl_incomplete_exp_verifs,"P")


end event

type cb_registry from commandbutton within w_utilities
integer x = 50
integer y = 1708
integer width = 919
integer height = 88
integer taborder = 210
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Set Registry Path"
end type

event clicked;integer r
integer rc
integer d
integer m
integer yr
date dob

 r = 	messagebox("About","This will set the registry key to allow a user to run the program from other than the C drive.~r~rDo you wish to continue?",Question!,yesno!,2)
if r = 2 then return

openwithparm(w_utl_set_regedit_path,"P")
end event

type cb_user_reset from commandbutton within w_utilities
integer x = 50
integer y = 1824
integer width = 919
integer height = 88
integer taborder = 220
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Reset Expired Password"
end type

event clicked;integer r
integer rc
integer d
integer m
integer yr
date dob

 r = 	messagebox("About","This will reset a user expiration date to today to allow the user to log in and change their password.~r~rDo you wish to continue?",Question!,yesno!,2)
if r = 2 then return

open(w_user_reset)
end event

type cb_bd_exp from commandbutton within w_utilities
integer x = 1038
integer y = 824
integer width = 919
integer height = 88
integer taborder = 200
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "New Board/Specialty Fields"
end type

event clicked;integer r
integer dvid
integer rc
integer v
integer find
integer vc
integer a
long fid = 9810 //expiration date

 r = 	messagebox("About","This function will Copy the new specialty exp date and certified fields to all views, and set the Bd/Spec expiration field to expiration date, and create expiration date data from certificate expires.~r~rContinue?",Question!,yesno!,2)
if r = 2 then return

SetPointer ( hourglass! )
debugbreak()
dw_data_view_list.settransobject(sqlca)
vc = dw_data_view_list.retrieve()
dw_dvfieldcopy.settransobject(sqlca)

for a = 1 to 2
	if a = 2 then fid = 9811 //board certified
	dw_dvfieldcopy.reset()
	rc = dw_dvfieldcopy.retrieve(fid)
	for v = 1 to vc  //go down list of views and add if not found
		dvid = dw_data_view_list.getitemnumber(v,"data_view_id")
		find = dw_dvfieldcopy.Find ( "data_view_id = " + string(dvid), 1, vc )
		if find < 0 then
			messagebox("","bad find")
			return
			end if
		if find = 0 then 
			dw_dvfieldcopy.rowscopy(1,1,primary!,dw_dvfieldcopy,1000,primary!)
			dw_dvfieldcopy.setitem(dw_dvfieldcopy.rowcount(),"data_view_id",dvid)
		end if
	next
	dw_dvfieldcopy.update()
	commit using sqlca;
next
		

//update exp dv field
update data_view_screen set exp_field = 9810 where screen_id =  19;

//update exp data
update pd_board_specialty set expiration_date = string(certification_expires) + '-12-30' + ' 00:00:00' where certification_expires is not null and expiration_date is null;

//update certified
update pd_board_specialty set board_certified = 581 where board_code is not null;
update pd_board_specialty set board_certified = 582 where board_code is null;

SetPointer ( arrow! )
messagebox("Done"," Update Completed")
end event

type cb_comp_info from commandbutton within w_utilities
integer x = 1042
integer y = 716
integer width = 923
integer height = 88
integer taborder = 190
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Company Information"
end type

event clicked;integer res
//res = messagebox("This operation:","This utility will add missing facility committees to current appointments.  Used when committees have been added to a facility after the appointments were created.  ~rContinue?",question!,yesno!,2)

open(w_company_info)






end event

type cb_requested from commandbutton within w_utilities
integer x = 46
integer y = 1040
integer width = 919
integer height = 88
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Set Staff Cat Status "
end type

event clicked;integer r

 r = 	messagebox("About","This function will update the status value for all Staff Category records based on to_date.~rDate  = inactive; no date = active.~r~rContinue?",Question!,yesno!,2)
if r = 2 then return

string ls_sql


update pd_affil_staff_cat set requested = 0 where to_date is not null;
update pd_affil_staff_cat set requested = 1 where to_date is null;
commit using sqlca;

 r = 	messagebox("Requested","Do you want to update the status of records where there is no FROM or TO dates to 'Requested' status?",Question!,yesno!,2)
if r = 1 then 
	update pd_affil_staff_cat set requested = 2 where to_date is null and from_date is null;
	commit using sqlca;
end if

messagebox("Done"," Update Completed")
end event

type cb_field_ord_chk from commandbutton within w_utilities
integer x = 46
integer y = 932
integer width = 919
integer height = 88
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Check Field Order "
end type

event clicked;integer r
integer rc
integer d
integer m
integer yr
date dob

 r = 	messagebox("About","This utility will check for and correct duplicated field orders on the default data view which could cause app populating problems. Continue?",Question!,yesno!,2)
if r = 2 then return

Openwithparm(w_utl_dvf_order_check,"P" )


end event

type cb_iapp_fix from commandbutton within w_utilities
integer x = 46
integer y = 824
integer width = 919
integer height = 88
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Intelliappfix Search"
end type

event clicked;integer r
integer rc
integer d
integer m
integer yr
date dob


Open( w_iapp_fix_login )

if Lower( Message.StringParm ) = "cancel"  THEN
	return
elseIF Lower( Message.StringParm ) = "intelliappfix"  THEN
	Open( w_iapp_find_row )
ELSE
	MessageBox( "Sorry", "Wrong password." )
END IF
end event

type cb_test from commandbutton within w_utilities
integer x = 3118
integer y = 1176
integer width = 247
integer height = 108
integer taborder = 400
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "test"
end type

event clicked;//Open(w_utl_set_regedit_path)
Open(w_question_painter)
//OpenSheetWithParm ( w_invoice_mockup, 2, w_mdi)	
end event

type cb_multi_affil_check from commandbutton within w_utilities
integer x = 50
integer y = 716
integer width = 914
integer height = 88
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Appointment Aberrations Check"
end type

event clicked;integer r
integer rc
integer d
integer m
integer yr
date dob

 r = 	messagebox("About","This utility is for checking for abnormal appointment records for practitioners. Continue?",Question!,yesno!,2)
if r = 2 then return

//messagebox("About","This function not yet complete.")
//return
openwithparm(w_utl_multi_nonhist_check, "P")
end event

type cb_dapplications from commandbutton within w_utilities
integer x = 1042
integer y = 2056
integer width = 923
integer height = 88
integer taborder = 260
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Download Applications"
end type

event clicked;integer r
integer rc
integer d
integer m
integer yr
date dob

 r = 	messagebox("About","This utility is for downloading IntelliApp Applications from the ContractLogix Group Website. Continue?",Question!,yesno!,2)
if r = 2 then return

//messagebox("About","This function not yet complete.")
//return
Openwithparm( w_import_apps,"P" ) //P indicated open from intellicred
end event

type cb_dmanual from commandbutton within w_utilities
integer x = 1042
integer y = 1828
integer width = 923
integer height = 88
integer taborder = 250
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Download Current Manual"
end type

event clicked;integer r
integer rc
integer d
integer m
integer yr
date dob

 r = 	messagebox("About","This utility is for downloading the latest Manual from the ContractLogix Group Website. Continue?",Question!,yesno!,2)
if r = 2 then return

String sle_url
inet iinet_base

messagebox("About","Enter your assigned user name and password for the ContractLogix Group website (was included in the update notification).~r Go to Downloads.  Select the manual you desire and click download.~r SAVE to your computer.")
of_open_web("http://www.intellisoftgroup.com/customer/customer.html")
//GetContextService("Internet", iinet_base)
//iinet_base.HyperlinkToURL("http://www.intellisoftgroup.com/customer/customer.html")

end event

type cb_dhelp from commandbutton within w_utilities
integer x = 1042
integer y = 1712
integer width = 923
integer height = 88
integer taborder = 240
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Download Help Files"
end type

event clicked;integer r
integer rc
integer d
integer m
integer yr
date dob

// r = 	messagebox("About","This utility is for downloading the latest Help files from the Intellisoft Group Website. Continue?",Question!,yesno!,2)
//if r = 2 then return

 r = 	messagebox("About","This utility is for importing Help files. Continue?",Question!,yesno!,2)
if r = 2 then return

//messagebox("About","This function not yet complete.")
//return
openwithparm(w_import_help_files,"P")
end event

type cb_print_reset from commandbutton within w_utilities
integer x = 1042
integer y = 176
integer width = 928
integer height = 88
integer taborder = 140
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Batch Reset Print Flags"
end type

event clicked;integer r
integer rc
integer d
integer m
integer yr
date dob

 r = 	messagebox("About","This utility is for Batch resetting verification print flags When 'Did the letters print ok' is answered yes by mistake. Continue?",Question!,yesno!,2)
if r = 2 then return

//messagebox("About","This function not yet complete.")
//return
open(w_utl_print_reset)
end event

type cb_add_help from commandbutton within w_utilities
integer x = 2071
integer y = 932
integer width = 960
integer height = 88
integer taborder = 340
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Edit Help Files"
end type

event clicked;integer r
string ls_win

ls_win = "w_help_add"

r = of_password(ls_win)
if r = 1 then
	openwithparm(w_help_add,"P")
end if
end event

type cb_assignedusers from commandbutton within w_utilities
integer x = 1042
integer y = 392
integer width = 928
integer height = 88
integer taborder = 160
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Change Assigned Users "
end type

event clicked;integer r
integer rc
integer d
integer m
integer yr
date dob

 r = 	messagebox("About","This utility is for updating the assigned users for Appointments and verifications. Continue?",Question!,yesno!,2)
if r = 2 then return

//messagebox("About","This function not yet complete.")
//return
open(w_user_update_new)
end event

type cb_oig from commandbutton within w_utilities
integer x = 1042
integer y = 284
integer width = 928
integer height = 88
integer taborder = 150
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Update OIG Data"
end type

event clicked;integer r
integer rc
integer d
integer m
integer yr
date dob

 r = 	messagebox("About","This utility is for updating OIG data. Continue?",Question!,yesno!,2)
if r = 2 then return

open(w_import_oig)
end event

type st_2 from statictext within w_utilities
integer x = 3337
integer y = 2072
integer width = 361
integer height = 92
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

event clicked;messagebox("Oh no " + gs_user_id + " !","~nYou have now entered the customer abuse zone; the place where the program abusues the user.~n~n Just remember, you asked for it.")

open (w_user_abuse)
end event

type cb_user_security from commandbutton within w_utilities
integer x = 46
integer y = 608
integer width = 919
integer height = 88
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "User Security Utilities"
end type

event clicked;integer r
integer rc
integer d
integer m
integer yr
date dob

 r = 	messagebox("About","This will clean up user view and facility security.~r~rDo you wish to continue?",Question!,yesno!,2)
if r = 2 then return

open(w_user_security_fix)
end event

type cb_docids from commandbutton within w_utilities
integer x = 46
integer y = 500
integer width = 919
integer height = 88
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Reset Verification Doc Ids"
end type

event clicked;integer r
integer rc
integer d
integer m
integer yr
date dob

 r = 	messagebox("About","This will reset all doc_ids values for all verifications to correct any that have gotten out of sync.~r~rDo you wish to continue?",Question!,yesno!,2)
if r = 2 then return

open(w_doc_id_reset_utility)
end event

type cb_update_view from commandbutton within w_utilities
integer x = 2071
integer y = 824
integer width = 960
integer height = 88
integer taborder = 330
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Update Single View"
end type

event clicked;integer r
string ls_win

ls_win = "w_view_update_utility"

r = of_password(ls_win)
if r = 1 then
	open(w_view_update_utility)
end if
end event

type cb_sys_tables from commandbutton within w_utilities
integer x = 2071
integer y = 500
integer width = 960
integer height = 88
integer taborder = 300
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Modify Sys Tables"
end type

event clicked;integer r
string ls_win

ls_win = "w_sys_field_utility"

r = of_password(ls_win)
if r = 1 then
	open(w_sys_table_utility)
end if
end event

type cb_stat_check from commandbutton within w_utilities
integer x = 46
integer y = 392
integer width = 919
integer height = 88
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Sync Appointment Child Data"
end type

event clicked;integer r
integer rc
integer d
integer m
integer yr
date dob

 r = 	messagebox("About","This utility will check all appointment status records and match the active status/facility id of ~rchild records (Department, Staff Category, Leave, Committees).~r~rDo you wish to continue?",Question!,yesno!,2)
if r = 2 then return

open(w_check_active_stats)
end event

type cb_view_update from commandbutton within w_utilities
integer x = 2075
integer y = 716
integer width = 960
integer height = 88
integer taborder = 320
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "View Update"
end type

event clicked;integer r
string ls_win

ls_win = "w_utl_update_views"

r = of_password(ls_win)
if r = 1 then
	openwithparm(w_utl_update_views,"P")
end if
end event

type st_1 from statictext within w_utilities
integer x = 2304
integer y = 84
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
boolean enabled = false
string text = "Support Password"
boolean focusrectangle = false
end type

type sle_pass from singlelineedit within w_utilities
integer x = 2062
integer y = 180
integer width = 955
integer height = 88
integer taborder = 270
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean password = true
borderstyle borderstyle = stylelowered!
end type

type cb_edit_profile from commandbutton within w_utilities
integer x = 2075
integer y = 608
integer width = 960
integer height = 88
integer taborder = 310
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Edit Profile Data"
end type

event clicked;integer r
string ls_win

ls_win = "w_profile_data_utility"

r = of_password(ls_win)

if r = 1 then
	open(w_profile_data_utility)
end if
end event

type cb_support_settings from commandbutton within w_utilities
integer x = 2066
integer y = 2056
integer width = 960
integer height = 88
integer taborder = 390
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Support Settings"
end type

event clicked;integer r
string ls_win

ls_win = "w_support_settings"

r = of_password(ls_win)

if r = 1 then
	open(w_support_settings)
end if
end event

type cb_new_sys_fields from commandbutton within w_utilities
integer x = 2066
integer y = 392
integer width = 960
integer height = 88
integer taborder = 290
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Add Sys/Screen fields"
end type

event clicked;integer r
string ls_win

ls_win = "w_setup_new_field"

r = of_password(ls_win)
if r = 1 then
	open(w_setup_new_field)
end if
end event

type cb_sys_fields from commandbutton within w_utilities
integer x = 2066
integer y = 284
integer width = 960
integer height = 88
integer taborder = 280
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Modify Screen Name"
end type

event clicked;integer r
string ls_win

ls_win = "w_sys_field_utility"

r = of_password(ls_win)
if r = 1 then
	open(w_sys_field_utility)
end if
end event

type cb_sql from commandbutton within w_utilities
integer x = 2071
integer y = 1040
integer width = 960
integer height = 88
integer taborder = 350
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Run SQL"
end type

event clicked;
integer r
string ls_win

// r = 	messagebox("About","This utility allows the runing of SQL statements. ~r~rDo you wish to continue?",Question!,yesno!,2)
//if r = 2 then return


ls_win = "w_sql_send"

r = of_password(ls_win)

if r = 1 then
	open(w_sql_send)
end if
end event

type cb_priv_adj from commandbutton within w_utilities
integer x = 46
integer y = 284
integer width = 919
integer height = 88
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Adjust Privileges"
end type

event clicked;integer r
integer rc
integer d
integer m
integer yr
date dob

 r = 	messagebox("About","This utility is for adjusting privilege deliniation.~r~rDo you wish to continue?",Question!,yesno!,2)
if r = 2 then return

open(w_privilege_adjustments)
end event

type cb_comm_review_fix from commandbutton within w_utilities
integer x = 1042
integer y = 500
integer width = 923
integer height = 88
integer taborder = 170
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Committee Review Fix"
end type

event clicked;integer r
integer rc
integer d
integer m
integer yr
date dob

 r = 	messagebox("About","This utility is for adding missing committees to active affiliations the have NONE.~r~rDo you wish to continue?",Question!,yesno!,2)
if r = 2 then return

open(w_comm_review_fix)
end event

type cb_links from commandbutton within w_utilities
integer x = 46
integer y = 176
integer width = 919
integer height = 88
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Links Fix Utility"
end type

event clicked;integer r
integer rc
integer d
integer m
integer yr
date dob

 r = 	messagebox("About","This utility is for adding missing address, specialty,of hospital links,as well as for deleting bad ones.~r~rDo you wish to continue?",Question!,yesno!,2)
if r = 2 then return

open(w_link_check_utility)
end event

type cb_settings from commandbutton within w_utilities
integer x = 46
integer y = 2056
integer width = 923
integer height = 88
integer taborder = 230
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Application Settings"
end type

event clicked;	open(w_icred_settings)
	//close(parent)





end event

type cb_10 from commandbutton within w_utilities
integer x = 1042
integer y = 68
integer width = 928
integer height = 88
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Back Up Database"
end type

event clicked;integer res

res = messagebox("This operation:","This utility will allow you to back up your Intellicred datebase.  ~rContinue?",question!,yesno!,2)
if res = 1 then 
	open(w_data_backup)
end if

end event

type cb_fix from commandbutton within w_utilities
integer x = 46
integer y = 68
integer width = 919
integer height = 88
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = " Fix DOB Year"
end type

event clicked;integer r
integer rc
integer d
integer m
integer yr
date dob


 r = 	messagebox("About","This function will correct any prac dob that shows a year greater than 2000",Question!,yesno!,2)
if r = 2 then return
dw_3.settransobject(sqlca)
rc = dw_3.retrieve()
for r = 1 to rc
	 yr = year(date(dw_3.getitemdatetime(r,"date_of_birth"))) 
	 //messagebox("yr",yr)
if yr > 2000 then		
	yr = yr - 100
	//messagebox("yr-100",yr)
	m = month(date(dw_3.getitemdatetime(r,"date_of_birth")))
	d = day(date(dw_3.getitemdatetime(r,"date_of_birth")))
	dob = date(string(yr)  + "/" + string(m) + "/" + string(d))
	//messagebox("",string(dob))
	dw_3.setitem(r,"date_of_birth",datetime(dob))
end if
next

dw_3.update()
commit using sqlca;


	messagebox("done","Completed")
end event

type dw_3 from datawindow within w_utilities
boolean visible = false
integer x = 3099
integer y = 1408
integer width = 247
integer height = 88
integer taborder = 370
string dataobject = "d_fix_dob"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)

end event

type cb_3 from commandbutton within w_utilities
integer x = 3118
integer y = 32
integer width = 274
integer height = 84
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Close"
end type

event clicked;CLOSE(PARENT)
end event

type cb_2 from commandbutton within w_utilities
integer x = 1042
integer y = 608
integer width = 923
integer height = 88
integer taborder = 180
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Update PD Committees"
end type

event clicked;integer res
res = messagebox("This operation:","This utility will add missing facility committees to current appointments.  Used when committees have been added to a facility after the appointments were created.  ~rContinue?",question!,yesno!,2)
if res = 2 then return

integer a
integer ac
integer p
integer pc
integer c
integer cc
integer nr
integer nc
integer li_fac
long ll_commid
long ll_rec
long ll_prac
Long ll_seq
integer comfind
datetime ldt_date

dw_pracaffil.settransobject(sqlca)
ac = dw_pracaffil.retrieve()//a list of all active appointments

for a = 1 to ac
	ll_rec = dw_pracaffil.getitemnumber(a,"rec_id")
	ll_prac = dw_pracaffil.getitemnumber(a,"prac_id")
	li_fac = dw_pracaffil.getitemnumber(a,"parent_facility_id")
	ll_seq = dw_pracaffil.getitemnumber(a,"seq_no")
	ldt_date = dw_pracaffil.getitemdatetime(a,"apptmnt_start_date")
	dw_praccomm.settransobject(sqlca)
	pc = dw_praccomm.retrieve(ll_rec)// a list of comms for the appnt
	dw_facilcomm.settransobject(sqlca)
	cc = dw_facilcomm.retrieve(li_fac)// a list of committees for the facil of the appnt.
	for c = 1 to cc
		comfind = 0
		//messagebox("cc",cc)
		ll_commid = dw_facilcomm.getitemnumber(c,"committee_id")
		for p = 1 to pc
			if ll_commid = dw_praccomm.getitemnumber(p,"committee_id") then 
				comfind = 1
			end if
		next
			if comfind = 0 then
				nr = dw_praccomm.insertrow(0)
				dw_praccomm.setitem(nr,"rec_id",ll_rec)
				dw_praccomm.setitem(nr,"prac_id",ll_prac)
				dw_praccomm.setitem(nr,"facility_id",li_fac)
				dw_praccomm.setitem(nr,"seq_no",ll_seq)
				dw_praccomm.setitem(nr,"committee_id",ll_commid)
				dw_praccomm.setitem(nr,"active_status",1)
				dw_praccomm.setitem(nr,"date_sent_for_review", ldt_date )
				dw_praccomm.setitem(nr,"date_back_from_review", ldt_date )
				if not isnull(ldt_date) then
					dw_praccomm.setitem(nr,"review_results", 615 )//approved	
				end if
				dw_praccomm.update()
				commit using sqlca;
			end if
	next
next
			



messagebox("Done"," Update Completed")






end event

type cb_1 from commandbutton within w_utilities
integer x = 3122
integer y = 132
integer width = 265
integer height = 84
integer taborder = 430
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "About"
end type

event clicked;messagebox("To operate this program :","Click the button for the utility you wish to run. ~rSupport function are intended for IntelliCred technical support only.")

end event

type dw_facilcomm from datawindow within w_utilities
boolean visible = false
integer x = 3205
integer y = 1624
integer width = 46
integer height = 64
integer taborder = 440
string dataobject = "d_comm_of_facil"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_praccomm from datawindow within w_utilities
boolean visible = false
integer x = 3090
integer y = 1536
integer width = 279
integer height = 64
integer taborder = 420
string dataobject = "d_prac_pd_comm"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_pracaffil from datawindow within w_utilities
boolean visible = false
integer x = 3118
integer y = 1540
integer width = 279
integer height = 68
integer taborder = 410
string dataobject = "d_affil_stat_of_prac_all"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type gb_adm from groupbox within w_utilities
integer x = 14
integer y = 1636
integer width = 987
integer height = 548
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "Administrative"
end type

type gb_2 from groupbox within w_utilities
integer x = 1015
integer y = 1636
integer width = 978
integer height = 548
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "Downloads"
end type

type dw_dvfieldcopy from datawindow within w_utilities
boolean visible = false
integer x = 3090
integer y = 460
integer width = 261
integer height = 76
integer taborder = 380
string dataobject = "d_dvf_field_copy"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_data_view_list from datawindow within w_utilities
boolean visible = false
integer x = 3099
integer y = 564
integer width = 283
integer height = 72
integer taborder = 360
string dataobject = "d_data_view_list"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type gb_3 from groupbox within w_utilities
integer x = 14
integer y = 4
integer width = 987
integer height = 1616
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "Data Clean Up"
end type

type gb_4 from groupbox within w_utilities
integer x = 1019
integer y = 4
integer width = 978
integer height = 1616
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "Program Utilities"
end type

type gb_1 from groupbox within w_utilities
integer x = 2025
integer y = 4
integer width = 1042
integer height = 2180
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "Support Utilities"
end type

