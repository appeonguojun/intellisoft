$PBExportHeader$w_utilities_support.srw
forward
global type w_utilities_support from window
end type
type cbx_pbtrace from checkbox within w_utilities_support
end type
type cb_copy_lookup_data from commandbutton within w_utilities_support
end type
type cbx_utility_menu from checkbox within w_utilities_support
end type
type cb_today_password from commandbutton within w_utilities_support
end type
type cb_21 from commandbutton within w_utilities_support
end type
type cb_11 from commandbutton within w_utilities_support
end type
type cb_20 from commandbutton within w_utilities_support
end type
type cb_19 from commandbutton within w_utilities_support
end type
type cb_18 from commandbutton within w_utilities_support
end type
type cb_17 from commandbutton within w_utilities_support
end type
type cb_password from commandbutton within w_utilities_support
end type
type cb_5 from commandbutton within w_utilities_support
end type
type cb_upgrade from commandbutton within w_utilities_support
end type
type cb_16 from commandbutton within w_utilities_support
end type
type cb_15 from commandbutton within w_utilities_support
end type
type cb_14 from commandbutton within w_utilities_support
end type
type cb_13 from commandbutton within w_utilities_support
end type
type cb_lic_up from commandbutton within w_utilities_support
end type
type cb_npdb from commandbutton within w_utilities_support
end type
type cbx_test from checkbox within w_utilities_support
end type
type cb_image_migrate from commandbutton within w_utilities_support
end type
type cb_12 from commandbutton within w_utilities_support
end type
type cb_deletecode from commandbutton within w_utilities_support
end type
type cb_encrypt from commandbutton within w_utilities_support
end type
type cb_new_views from commandbutton within w_utilities_support
end type
type cb_7 from commandbutton within w_utilities_support
end type
type cb_10 from commandbutton within w_utilities_support
end type
type cb_9 from commandbutton within w_utilities_support
end type
type cb_8 from commandbutton within w_utilities_support
end type
type cb_gjg from commandbutton within w_utilities_support
end type
type cb_6 from commandbutton within w_utilities_support
end type
type cb_4 from commandbutton within w_utilities_support
end type
type cb_2 from commandbutton within w_utilities_support
end type
type cb_1 from commandbutton within w_utilities_support
end type
type cbx_pw from checkbox within w_utilities_support
end type
type dw_program from datawindow within w_utilities_support
end type
type cb_tab_order from commandbutton within w_utilities_support
end type
type cb_new_screen from commandbutton within w_utilities_support
end type
type cb_test from commandbutton within w_utilities_support
end type
type cb_add_help from commandbutton within w_utilities_support
end type
type st_2 from statictext within w_utilities_support
end type
type cb_update_view from commandbutton within w_utilities_support
end type
type cb_sys_tables from commandbutton within w_utilities_support
end type
type cb_view_update from commandbutton within w_utilities_support
end type
type cb_edit_profile from commandbutton within w_utilities_support
end type
type cb_new_sys_fields from commandbutton within w_utilities_support
end type
type cb_sys_fields from commandbutton within w_utilities_support
end type
type cb_sql from commandbutton within w_utilities_support
end type
type dw_3 from datawindow within w_utilities_support
end type
type cb_3 from commandbutton within w_utilities_support
end type
type dw_facilcomm from datawindow within w_utilities_support
end type
type dw_praccomm from datawindow within w_utilities_support
end type
type dw_pracaffil from datawindow within w_utilities_support
end type
type dw_dvfieldcopy from datawindow within w_utilities_support
end type
type dw_data_view_list from datawindow within w_utilities_support
end type
type gb_2 from groupbox within w_utilities_support
end type
type cb_support_settings from commandbutton within w_utilities_support
end type
type gb_3 from groupbox within w_utilities_support
end type
type gb_4 from groupbox within w_utilities_support
end type
type gb_1 from groupbox within w_utilities_support
end type
end forward

global type w_utilities_support from window
integer x = 59
integer y = 48
integer width = 3072
integer height = 2880
boolean titlebar = true
string title = "Support Utilities"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 80269524
boolean center = true
cbx_pbtrace cbx_pbtrace
cb_copy_lookup_data cb_copy_lookup_data
cbx_utility_menu cbx_utility_menu
cb_today_password cb_today_password
cb_21 cb_21
cb_11 cb_11
cb_20 cb_20
cb_19 cb_19
cb_18 cb_18
cb_17 cb_17
cb_password cb_password
cb_5 cb_5
cb_upgrade cb_upgrade
cb_16 cb_16
cb_15 cb_15
cb_14 cb_14
cb_13 cb_13
cb_lic_up cb_lic_up
cb_npdb cb_npdb
cbx_test cbx_test
cb_image_migrate cb_image_migrate
cb_12 cb_12
cb_deletecode cb_deletecode
cb_encrypt cb_encrypt
cb_new_views cb_new_views
cb_7 cb_7
cb_10 cb_10
cb_9 cb_9
cb_8 cb_8
cb_gjg cb_gjg
cb_6 cb_6
cb_4 cb_4
cb_2 cb_2
cb_1 cb_1
cbx_pw cbx_pw
dw_program dw_program
cb_tab_order cb_tab_order
cb_new_screen cb_new_screen
cb_test cb_test
cb_add_help cb_add_help
st_2 st_2
cb_update_view cb_update_view
cb_sys_tables cb_sys_tables
cb_view_update cb_view_update
cb_edit_profile cb_edit_profile
cb_new_sys_fields cb_new_sys_fields
cb_sys_fields cb_sys_fields
cb_sql cb_sql
dw_3 dw_3
cb_3 cb_3
dw_facilcomm dw_facilcomm
dw_praccomm dw_praccomm
dw_pracaffil dw_pracaffil
dw_dvfieldcopy dw_dvfieldcopy
dw_data_view_list dw_data_view_list
gb_2 gb_2
cb_support_settings cb_support_settings
gb_3 gb_3
gb_4 gb_4
gb_1 gb_1
end type
global w_utilities_support w_utilities_support

type variables
integer ii_sechange
// mskinner 06 april 2006 -- begin
boolean ib_create_ctx_db
// mskinner 06 april 2006 -- end

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 06.08.2006 By: LeiWei
//$<reason> Define two variable to be used in subsequent script.
Boolean ib_word_storage_to_db
Boolean ib_image_storage_to_db
//---------------------------- APPEON END ----------------------------

Boolean	ib_EncryptChange		//Added by Scofield on 2007-09-07
long		il_EncryptValue		//Added by Scofield on 2007-09-07
string 	is_show_activate_ori //Added By Gavin.Jay 2017-06-08
end variables

forward prototypes
public function integer of_password (string ai_window)
public subroutine of_create_ctx_db ()
public function integer of_generate_pd_account ()
end prototypes

public function integer of_password (string ai_window);//string ls_pass
//
////ls_pass = string(ai_window)
////messagebox("window",ls_pass)
//
//ls_pass = sle_pass.text
//
//if len(ls_pass) < 1 then
//	messagebox("Enter Password","You need to enter the correct support password to use this utility.")
//	return -1
//end if
//
//if ai_window = "w_sql_send" then
//	if upper(ls_pass) <> "INTELLISQL" then
//		messagebox("Incorrect Password","You must enter the correct support password for the SQL utility.")
//		return -1
//	end if
//elseif upper(ls_pass) <> "INTELLISET" then
//	messagebox("Incorrect Password","You must enter the correct support password to use this utility.")
//	return -1
//end if

return 1
end function

public subroutine of_create_ctx_db ();// mskinner 06 april 2006 -- begin
///////////////////////////////////////////////////////
// run the contract sql if it just turned on
/////////////////////////////////////////////////////////



choose case ib_create_ctx_db
		
	case false
			if  (dw_program.getItemNumber(1,'set_cont',primary!,true) <> dw_program.getItemNumber(1,'set_cont')) and &
					dw_program.getItemNumber(1,'set_cont') = 1				then 
				  ib_create_ctx_db = true
			end if 
	case true
		messagebox('Contract Logix', 'The Contract Logix database tables and seed data will now be created. This window will close when the process is done. Click ok to start the update.')
		 n_cst_contract_sql lnv_contract 
		 lnv_contract.of_start_update( )
		 
end choose 
// mskinner 06 april 2006 -- end
end subroutine

public function integer of_generate_pd_account ();//////////////////////////////////////////////////////////////////// //
// $<function>of_generate_pd_account()
// $<returns> integer
// $<description>Generate default account for all Practitioners so that they can access WebView.
// $<description>
//////////////////////////////////////////////////////////////////////
// $<add> 03.08.2007 by Frank.Gui
//////////////////////////////////////////////////////////////////////
datastore   lds_users,lds_prac
Int  ii,kk,li_new,li_default_role,li_Find
String ls_userid

SELECT wv_security_role.role_id
	INTO :li_default_role
	FROM wv_security_role
	Where role_name = 'Practitioner'   ;
	
IF sqlca.SQLCode <> 0 OR IsNull(li_default_role) OR li_default_role < 1 THEN
	//No default Practitioner WebView Security Role, do nothing.
	RETURN 0
END IF

lds_users = CREATE datastore
lds_users.DataObject = 'd_security_users_all'
lds_users.SetTransObject(sqlca)
lds_users.Retrieve()

lds_prac = CREATE datastore
lds_prac.DataObject = 'd_prac_noaccount'
lds_prac.SetTransObject(sqlca)
lds_prac.Retrieve()

FOR ii = 1 TO lds_prac.RowCount()
	//New user id
	IF Len(string(lds_prac.Object.cust_1[ii])) > 0 THEN
		ls_userid = Left(lds_prac.Object.cust_1[ii],10)
	ELSE
		ls_userid = lower(Left(lds_prac.Object.first_name[ii],1))+lower(Left(lds_prac.Object.last_name[ii],9))
	END IF
	//Check duplicate user id
	kk = 0
	li_Find = lds_users.find("user_id='"+ls_userid+"'",1,lds_users.rowcount())
	do while li_find > 0 and kk < 100
		kk++
		ls_userid = left(ls_userid,10 - len(string(kk)))+string(kk)
		li_Find = lds_users.find("user_id='"+ls_userid+"'",1,lds_users.rowcount())
	Loop
	
	IF kk=100 then continue
	
	li_new = lds_users.InsertRow(0)
	lds_users.SetItem(li_new,'user_id',ls_userid)
	lds_users.SetItem(li_new,'prac_id',lds_prac.Object.prac_id[ii])
	lds_users.SetItem(li_new,'wv_role_id',li_default_role)
	lds_users.SetItem(li_new,'user_password','123')
NEXT

destroy lds_prac

if lds_users.update() < 1 then
	kk = -1
else
	kk = 1
end if

destroy lds_users

	
RETURN kk

end function

on w_utilities_support.create
this.cbx_pbtrace=create cbx_pbtrace
this.cb_copy_lookup_data=create cb_copy_lookup_data
this.cbx_utility_menu=create cbx_utility_menu
this.cb_today_password=create cb_today_password
this.cb_21=create cb_21
this.cb_11=create cb_11
this.cb_20=create cb_20
this.cb_19=create cb_19
this.cb_18=create cb_18
this.cb_17=create cb_17
this.cb_password=create cb_password
this.cb_5=create cb_5
this.cb_upgrade=create cb_upgrade
this.cb_16=create cb_16
this.cb_15=create cb_15
this.cb_14=create cb_14
this.cb_13=create cb_13
this.cb_lic_up=create cb_lic_up
this.cb_npdb=create cb_npdb
this.cbx_test=create cbx_test
this.cb_image_migrate=create cb_image_migrate
this.cb_12=create cb_12
this.cb_deletecode=create cb_deletecode
this.cb_encrypt=create cb_encrypt
this.cb_new_views=create cb_new_views
this.cb_7=create cb_7
this.cb_10=create cb_10
this.cb_9=create cb_9
this.cb_8=create cb_8
this.cb_gjg=create cb_gjg
this.cb_6=create cb_6
this.cb_4=create cb_4
this.cb_2=create cb_2
this.cb_1=create cb_1
this.cbx_pw=create cbx_pw
this.dw_program=create dw_program
this.cb_tab_order=create cb_tab_order
this.cb_new_screen=create cb_new_screen
this.cb_test=create cb_test
this.cb_add_help=create cb_add_help
this.st_2=create st_2
this.cb_update_view=create cb_update_view
this.cb_sys_tables=create cb_sys_tables
this.cb_view_update=create cb_view_update
this.cb_edit_profile=create cb_edit_profile
this.cb_new_sys_fields=create cb_new_sys_fields
this.cb_sys_fields=create cb_sys_fields
this.cb_sql=create cb_sql
this.dw_3=create dw_3
this.cb_3=create cb_3
this.dw_facilcomm=create dw_facilcomm
this.dw_praccomm=create dw_praccomm
this.dw_pracaffil=create dw_pracaffil
this.dw_dvfieldcopy=create dw_dvfieldcopy
this.dw_data_view_list=create dw_data_view_list
this.gb_2=create gb_2
this.cb_support_settings=create cb_support_settings
this.gb_3=create gb_3
this.gb_4=create gb_4
this.gb_1=create gb_1
this.Control[]={this.cbx_pbtrace,&
this.cb_copy_lookup_data,&
this.cbx_utility_menu,&
this.cb_today_password,&
this.cb_21,&
this.cb_11,&
this.cb_20,&
this.cb_19,&
this.cb_18,&
this.cb_17,&
this.cb_password,&
this.cb_5,&
this.cb_upgrade,&
this.cb_16,&
this.cb_15,&
this.cb_14,&
this.cb_13,&
this.cb_lic_up,&
this.cb_npdb,&
this.cbx_test,&
this.cb_image_migrate,&
this.cb_12,&
this.cb_deletecode,&
this.cb_encrypt,&
this.cb_new_views,&
this.cb_7,&
this.cb_10,&
this.cb_9,&
this.cb_8,&
this.cb_gjg,&
this.cb_6,&
this.cb_4,&
this.cb_2,&
this.cb_1,&
this.cbx_pw,&
this.dw_program,&
this.cb_tab_order,&
this.cb_new_screen,&
this.cb_test,&
this.cb_add_help,&
this.st_2,&
this.cb_update_view,&
this.cb_sys_tables,&
this.cb_view_update,&
this.cb_edit_profile,&
this.cb_new_sys_fields,&
this.cb_sys_fields,&
this.cb_sql,&
this.dw_3,&
this.cb_3,&
this.dw_facilcomm,&
this.dw_praccomm,&
this.dw_pracaffil,&
this.dw_dvfieldcopy,&
this.dw_data_view_list,&
this.gb_2,&
this.cb_support_settings,&
this.gb_3,&
this.gb_4,&
this.gb_1}
end on

on w_utilities_support.destroy
destroy(this.cbx_pbtrace)
destroy(this.cb_copy_lookup_data)
destroy(this.cbx_utility_menu)
destroy(this.cb_today_password)
destroy(this.cb_21)
destroy(this.cb_11)
destroy(this.cb_20)
destroy(this.cb_19)
destroy(this.cb_18)
destroy(this.cb_17)
destroy(this.cb_password)
destroy(this.cb_5)
destroy(this.cb_upgrade)
destroy(this.cb_16)
destroy(this.cb_15)
destroy(this.cb_14)
destroy(this.cb_13)
destroy(this.cb_lic_up)
destroy(this.cb_npdb)
destroy(this.cbx_test)
destroy(this.cb_image_migrate)
destroy(this.cb_12)
destroy(this.cb_deletecode)
destroy(this.cb_encrypt)
destroy(this.cb_new_views)
destroy(this.cb_7)
destroy(this.cb_10)
destroy(this.cb_9)
destroy(this.cb_8)
destroy(this.cb_gjg)
destroy(this.cb_6)
destroy(this.cb_4)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.cbx_pw)
destroy(this.dw_program)
destroy(this.cb_tab_order)
destroy(this.cb_new_screen)
destroy(this.cb_test)
destroy(this.cb_add_help)
destroy(this.st_2)
destroy(this.cb_update_view)
destroy(this.cb_sys_tables)
destroy(this.cb_view_update)
destroy(this.cb_edit_profile)
destroy(this.cb_new_sys_fields)
destroy(this.cb_sys_fields)
destroy(this.cb_sql)
destroy(this.dw_3)
destroy(this.cb_3)
destroy(this.dw_facilcomm)
destroy(this.dw_praccomm)
destroy(this.dw_pracaffil)
destroy(this.dw_dvfieldcopy)
destroy(this.dw_data_view_list)
destroy(this.gb_2)
destroy(this.cb_support_settings)
destroy(this.gb_3)
destroy(this.gb_4)
destroy(this.gb_1)
end on

event close;if cbx_pw.checked then
	//this.checked = false
	gi_support_pw_on = 1
else
	gi_support_pw_on = 0
end if
// mskinner 06 april 2006 -- begin
//of_create_ctx_db( ) maha removed 050206
// mskinner 06 april 2006 -- end

end event

event open;string ls_mess
Integer li_num

if gi_support_pw_on = 1 then
	Open( w_function_password )
	ls_mess = Lower( Message.StringParm )
	IF ls_mess = "intelliset5"  THEN
		//nothing
	elseIF ls_mess = "intelliset5s"  THEN
		cb_sql.triggerevent(clicked!)
	elseIF ls_mess = "intelliset5saas"  THEN
		//Added By Mark Lee 04/01/2015
		cb_8.triggerevent( clicked!)
		OpenWithParm(w_weblink_settings,"intelliset5saas")
		if isvalid(w_weblink_settings) then close(w_weblink_settings)
		Open(w_multi_dbupdate)
	else
		if trim(ls_mess) <>'' and not isnull(ls_mess) THEN
			MessageBox( "Sorry", "Wrong password." )
		end if
		close(this)
		return
	END IF
end if

//cbx_1.checked = false //maha app081005		//Commented by Scofield on 2008-03-14
dw_program.settransobject(sqlca)
dw_program.retrieve()

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 05.21.2007 By: Jack
//$<reason> Fix a defect.
If dw_program.getitemnumber(1,'set_9') = 4 Then
	dw_program.setitem(1,'set_cont',1)
	dw_program.modIfy("set_cont.protect = 1")						  
	dw_program.modIfy("set_cont.background.color = 67108864")  
End If
//---------------------------- APPEON END ----------------------------
//Start Code Change ----01.28.2008 #V8 maha - moved from dw constructor event
IF gs_dbtype <> 'SQL' THEN
	//This.Modify( "t_48.visible = 0 set_48.visible = 0" )
	dw_program.Modify( "set_48.visible = 0" )
END IF
//End Code Change---01.28.2008

//Begin - Added By Mark Lee 02/20/2013
li_num = dw_program.getitemnumber(1,'access_utility_menu')
If isnull(li_num) or li_num = 0  Then
	cbx_utility_menu.checked = False
Else
	cbx_utility_menu.checked = True	
End If 
//End - Added By Mark Lee 02/20/2013

//Start Code Change ----03.28.2008 #V8 maha
if gi_test_mode = 1 then cbx_test.checked = true

IF AppeonGetClientType() = 'WEB' THEN
	cb_15.enabled=true
	cbx_pbtrace.visible = False 	//Added By Mark Lee 05/14/2013
End if	

//Begin - Added By Mark Lee 05/28/2013
IF  ProfileString(gs_IniFilePathName, "Setup",    "PBTrace", "0")  = '0' Then 
	cbx_pbtrace.checked = False
Else
	cbx_pbtrace.checked = True	
End If 
//End - Added By Mark Lee 05/28/2013

//Begin - //Added By Gavin.Jay 2017-06-08
//$<Reason> Insert a Label for Display the activate and the deactivate buttons on the Office Control
string ls_value

ls_value = gnv_user_option.of_get_option_value('contractlogix-super-master','office_show_activate_buttons' )
If IsNull ( ls_value ) Or Trim ( ls_value ) = "" Then
	ls_value = "0"
End If

is_show_activate_ori = ls_value
If dw_program.GetRow() > 0 Then
	dw_program.SetItem ( dw_program.GetRow(), 'office_show_activate', ls_value )
End If
//End - //Added By Gavin.Jay 2017-06-08

gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17

end event

type cbx_pbtrace from checkbox within w_utilities_support
integer x = 2075
integer y = 1632
integer width = 343
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "PBTrace"
end type

type cb_copy_lookup_data from commandbutton within w_utilities_support
integer x = 1531
integer y = 2404
integer width = 960
integer height = 72
integer taborder = 130
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Copy Lookup Data"
end type

event clicked;//Added By Mark Lee 02/20/2013
OpenWithParm(w_copy_lookup_data,'')
end event

type cbx_utility_menu from checkbox within w_utilities_support
integer x = 1563
integer y = 2492
integer width = 805
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = " Allow Access on Utility Menu "
end type

event clicked;//Added By Mark Lee 02/20/2013
IF this.checked Then
	dw_program.SetItem(1,'access_utility_menu',1)
Else
	dw_program.SetItem(1,'access_utility_menu',0)
End IF 
end event

type cb_today_password from commandbutton within w_utilities_support
integer x = 1531
integer y = 112
integer width = 960
integer height = 72
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Today~'s Password "
end type

event clicked;//Added By Mark Lee 12/11/2012
open(w_master_password)
end event

type cb_21 from commandbutton within w_utilities_support
integer x = 1531
integer y = 904
integer width = 960
integer height = 72
integer taborder = 460
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Set fix fields list for optimize mode"
end type

event clicked;Open(w_set_filedlist)
end event

type cb_11 from commandbutton within w_utilities_support
integer x = 1531
integer y = 1520
integer width = 960
integer height = 72
integer taborder = 360
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "Application General Settings"
end type

event clicked;open(w_icred_gen_settings)
end event

type cb_20 from commandbutton within w_utilities_support
integer x = 1531
integer y = 2164
integer width = 960
integer height = 72
integer taborder = 90
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Copy View and Screen"
end type

event clicked;OpenWithParm(w_CopyView,"")

end event

type cb_19 from commandbutton within w_utilities_support
integer x = 1531
integer y = 2324
integer width = 960
integer height = 72
integer taborder = 100
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Copy Reports Writer"
end type

event clicked;//Add by jervis 03.09.2011
OpenWithParm(w_Copy_reportwriter,"")
end event

type cb_18 from commandbutton within w_utilities_support
integer x = 1531
integer y = 2244
integer width = 960
integer height = 72
integer taborder = 110
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Copy User"
end type

event clicked;//Add by jervis 03.16.2011
OpenWithParm(w_Copyusers,"")
end event

type cb_17 from commandbutton within w_utilities_support
integer x = 1531
integer y = 2084
integer width = 960
integer height = 72
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Copy Role"
end type

event clicked;//Add by jervis 03.16.2011
OpenWithParm(w_Copy_role,"")
end event

type cb_password from commandbutton within w_utilities_support
integer x = 1531
integer y = 816
integer width = 960
integer height = 72
integer taborder = 370
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "User Viewer"
end type

event clicked;String	ls_Password

if gi_support_pw_on = 1 then
	OpenWithParm(w_function_password,"")
	
	ls_Password = Message.StringParm
	if IsNull(ls_Password) or ls_Password = "" then Return
	
	if ls_Password <> "appe0n" then
		MessageBox("Sorry","Wrong password.")
		Return
	end if
end if

OpenWithParm(w_user_password_view,"")

end event

type cb_5 from commandbutton within w_utilities_support
boolean visible = false
integer x = 2341
integer y = 2844
integer width = 288
integer height = 72
integer taborder = 440
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Ken testing"
end type

type cb_upgrade from commandbutton within w_utilities_support
integer x = 1531
integer y = 1432
integer width = 960
integer height = 72
integer taborder = 350
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "Upgrade Email and Notification"
end type

event clicked;Open(w_UpgradeTextToDoc)

end event

type cb_16 from commandbutton within w_utilities_support
boolean visible = false
integer x = 1883
integer y = 2848
integer width = 416
integer height = 72
integer taborder = 430
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Global Paths"
end type

event clicked;string ls_apptype

ls_apptype = AppeonGetClientType() 
messagebox("Paths","gs_dir_path:~r" + gs_dir_path  + "~r~r app.is_application_path:~r" + gnv_app.is_application_path + "~r~r Appeongetclienttype:~r" + ls_apptype)







end event

type cb_15 from commandbutton within w_utilities_support
integer x = 1531
integer y = 728
integer width = 960
integer height = 72
integer taborder = 340
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Multi-DB upgrade"
end type

event clicked;//==============================APPEON BEGIN==========================
//open w_multi-dbupdate
//==============================APPEON END============================

String	ls_Password

if gi_support_pw_on = 1 then
	OpenWithParm(w_function_password,"")
	
	ls_Password = Message.StringParm
	if IsNull(ls_Password) or ls_Password = "" then Return
	
	if ls_Password <> "appe0n" then
		MessageBox("Sorry","Wrong password.")
		Return
	end if
end if

If Messagebox('Warning','Warning! This module will batch upgrade databases. It is intended for ContractLogix technical support only. Continue?',Question!,YesNo!) = 1 Then
	Open(w_multi_dbupdate)
End If


end event

type cb_14 from commandbutton within w_utilities_support
integer x = 1531
integer y = 1344
integer width = 960
integer height = 72
integer taborder = 310
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "Security Builder"
end type

event clicked;//open(w_npi_test)
//open(w_test_character)
open(w_security_builder)
//open(w_image_to_db_conversion_utility)
//open(w_recred_batch)
//open(w_maha_tv_test)







end event

type cb_13 from commandbutton within w_utilities_support
integer x = 1531
integer y = 1256
integer width = 960
integer height = 72
integer taborder = 300
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "CTX Document Import"
end type

event clicked;//Start Code Change ----05.20.2008 #V8 maha - utility to import document files for existing records.
open(w_ctx_import_doc_files)
end event

type cb_lic_up from commandbutton within w_utilities_support
boolean visible = false
integer x = 3314
integer y = 1772
integer width = 960
integer height = 72
integer taborder = 290
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "License ~'Update~'"
end type

event clicked;//Start Code Change ----05.07.2008 #V8 maha - this really does nothing
open(w_lic_update)
end event

type cb_npdb from commandbutton within w_utilities_support
integer x = 1531
integer y = 640
integer width = 960
integer height = 72
integer taborder = 280
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "NPDB Lookups"
end type

event clicked;open(w_npdb_lookups)
end event

type cbx_test from checkbox within w_utilities_support
integer x = 1449
integer y = 1632
integer width = 343
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Test mode"
end type

event clicked;//Start Code Change ----03.28.2008 #V8 maha
if this.checked then
	gi_test_mode = 1
else
	gi_test_mode = 0
end if
end event

type cb_image_migrate from commandbutton within w_utilities_support
boolean visible = false
integer x = 3287
integer y = 1624
integer width = 960
integer height = 72
integer taborder = 270
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Migrate Images to DB"
end type

event clicked;open(w_image_to_db_conversion_utility)
end event

type cb_12 from commandbutton within w_utilities_support
boolean visible = false
integer x = 3273
integer y = 1536
integer width = 960
integer height = 72
integer taborder = 260
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Delete Provider data"
end type

event clicked;open( w_delete_provider_utl)
end event

type cb_deletecode from commandbutton within w_utilities_support
integer x = 1531
integer y = 1168
integer width = 960
integer height = 72
integer taborder = 240
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "Delete Redundant Lookup Records"
end type

event clicked;open(w_utl_delete_code)
end event

type cb_encrypt from commandbutton within w_utilities_support
integer x = 1531
integer y = 464
integer width = 960
integer height = 72
integer taborder = 230
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Encrypt/Unencrypt Update SQL Files"
end type

event clicked;open(w_encrypt_sql_files)
end event

type cb_new_views from commandbutton within w_utilities_support
boolean visible = false
integer x = 3269
integer y = 1236
integer width = 960
integer height = 72
integer taborder = 210
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Update to More Efficient Views"
end type

event clicked;//Start Code Change ---- 09-18.2007 #V7 maha
// Added to replace view update in update code


integer res


res = messagebox("View Update","This function will replace all existing IntelliReport views with new syntax that should be more effecient.  Note: All Existing Standard views will be replaced.  Any previous customizations to existing views will be lost.  Custom non-standard views should not be effected.  Some field names may change.  Continue?", question!, yesno!, 2)
if res = 2 then return

n_cst_view_sql lnvo_sql
//lnvo_sql.of_start_update()

lnvo_sql.of_update_view_v6_1()
lnvo_sql.of_update_view_v6_2()

messagebox("Done","Process Complete")

return 1
end event

type cb_7 from commandbutton within w_utilities_support
boolean visible = false
integer x = 174
integer y = 2848
integer width = 416
integer height = 72
integer taborder = 390
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "maha testing"
end type

event clicked;//open(w_recred_log)
//open(w_test_character)
//open(w_security_builder)
//open(w_image_to_db_conversion_utility)
//open(w_recred_batch)
//open(w_maha_tv_test)
open(w_word_testing)
//pfc_n_cst_ai_printletters ln_pl
//
//ln_pl = create pfc_n_cst_ai_printletters
//ln_pl.of_find_missing_verifs(1,2,0,'I')
//
//
//destroy pfc_n_cst_ai_printletters
end event

type cb_10 from commandbutton within w_utilities_support
boolean visible = false
integer x = 2016
integer y = 992
integer width = 475
integer height = 72
integer taborder = 330
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Disable Full-text"
end type

event clicked;//--------------------------- APPEON BEGIN ---------------------------
//$<add> 11.17.2006 By: Davis
//$<reason> Disables full-text indexing within the current database. 

//String ls_sql
//ls_sql = "exec sp_fulltext_database 'disable'"
//
//EXECUTE IMMEDIATE :ls_sql using sqlca;
//IF len(sqlca.sqlerrtext) > 0 THEN
//	IF handle(getapplication()) = 0 THEN
//		messagebox("Enable Full-Text", string(sqlca.sqlerrtext) )
//	END IF
//ELSE
//	COMMIT;
//END IF

   IF Not Isvalid(gnv_logservice) THEN gnv_logservice = Create n_logservice
	
	n_cst_update_sql lnv_sql
	lnv_sql = Create n_cst_update_sql

	lnv_sql.of_disable_fulltext( )

	Destroy lnv_sql
	Destroy gnv_logservice

//---------------------------- APPEON END ----------------------------

end event

type cb_9 from commandbutton within w_utilities_support
boolean visible = false
integer x = 1536
integer y = 992
integer width = 475
integer height = 72
integer taborder = 320
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Enable Full-text"
end type

event clicked;//--------------------------- APPEON BEGIN ---------------------------
//$<add> 11.17.2006 By: Davis
//$<reason> Enables full-text indexing within the current database. 

//String ls_sql
//ls_sql = "exec sp_fulltext_database 'enable'"
//
//EXECUTE IMMEDIATE :ls_sql using sqlca;
//IF len(sqlca.sqlerrtext) > 0 THEN
//	IF handle(getapplication()) = 0 THEN
//		messagebox("Enable Full-Text", string(sqlca.sqlerrtext) )
//	END IF
//ELSE
//	COMMIT;
//END IF
//modified by nova 2008-04-08
	IF Not Isvalid(gnv_logservice) THEN gnv_logservice = Create n_logservice
	
	n_cst_update_sql lnv_sql
	lnv_sql = Create n_cst_update_sql

	lnv_sql.of_enable_fulltext()

	Destroy lnv_sql
	Destroy gnv_logservice
//---------------------------- APPEON END ----------------------------

end event

type cb_8 from commandbutton within w_utilities_support
integer x = 1531
integer y = 552
integer width = 960
integer height = 72
integer taborder = 250
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Create Full-Text Catalog"
end type

event clicked;//--------------------------- APPEON BEGIN ---------------------------
//$<add> 11.16.2006 By: Davis
//$<reason> Create Full-text Catalog.

//IF MessageBox(parent.title, "Are you sure to create full-text catalog now? This process may take about 10 minutes.", Question!, OkCancel!, 1) = 1 THEN
//	n_cst_contract_sql lnv_sql
//	lnv_sql.of_appeon_create_fulltext_catalog( )
//END IF

//---------------------------- APPEON END ----------------------------


 IF Not Isvalid(gnv_logservice) THEN gnv_logservice = Create n_logservice
	
   n_cst_update_sql lnv_sql
	lnv_sql = Create n_cst_update_sql
  	
//	lnv_sql.of_ver70_release_createfulltext1( )
//	lnv_sql.of_ver85_release_dropfulltext1( )
//	lnv_sql.of_ver85_release_createfulltext1( )
//	lnv_sql.of_ver95_release_dropfulltext1( )	//jervis 10.21.2009
//	lnv_sql.of_ver95_release_createfulltext1( )	//jervis 10.21.2009

	//Added By Mark Lee 01/20/2016
	lnv_sql.of_release_fulltext( )

	Destroy lnv_sql
	destroy gnv_logservice
	
	
	
end event

type cb_gjg from commandbutton within w_utilities_support
boolean visible = false
integer x = 3269
integer y = 1076
integer width = 960
integer height = 72
integer taborder = 190
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "WebCrawler Export"
end type

event clicked;open( w_export_webcrawler)
end event

type cb_6 from commandbutton within w_utilities_support
boolean visible = false
integer x = 3273
integer y = 992
integer width = 960
integer height = 72
integer taborder = 180
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Lookup Painter Filter"
end type

event clicked;//--------------------------- APPEON BEGIN ---------------------------
//$<add> 08.18.2006 By: LeiWei
//$<reason> Making the Contract Module a Standalone Product

Open( w_lookup_painter_filter)

//---------------------------- APPEON END ----------------------------

end event

type cb_4 from commandbutton within w_utilities_support
boolean visible = false
integer x = 603
integer y = 2848
integer width = 416
integer height = 72
integer taborder = 400
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Explorer Testing"
end type

event clicked;open(w_web_browse_ocx)
end event

type cb_2 from commandbutton within w_utilities_support
boolean visible = false
integer x = 1458
integer y = 2848
integer width = 416
integer height = 72
integer taborder = 420
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Encrypt"
end type

event clicked;//open(w_run)
open(w_utl_encrypt)
end event

type cb_1 from commandbutton within w_utilities_support
integer x = 2642
integer y = 56
integer width = 370
integer height = 84
integer taborder = 500
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Save Settings"
end type

event clicked;//--------------------------- APPEON BEGIN ---------------------------
//$< Add  > 2007-09-07 By: Scofield
//$<Reason> Get original Encryption value
long		ll_OriEncry,ll_CurEncry,ll_EmailId[]
long		ll_Cycle,ll_Count
String	ls_UserId[],ls_OriPwd[],ls_CurPwd[],ls_SetPwd[]
String	ls_EmailCurPwd[],ls_EMailPass

n_cst_Encrypt	lnvo_Encrypt
Datastore		lds_UserPass

dw_program.AcceptText()

//Added by Harry 20170322
if dw_program.GetItemStatus(dw_program.GetRow(),'echosign_method', Primary!) = DataModified!	then
	if dw_program.getitemstring(dw_program.GetRow(), 'echosign_method') = 'http' and len(gnv_echosign.is_apicode) > 0 then
		gnv_echosign.is_apicode = "" 
	end if
end if

if ib_EncryptChange then
	if (il_EncryptValue < 126) or (il_EncryptValue > 160) then
		MessageBox(gnv_app.iapp_object.DisplayName,'A valid encryption value must range from 126 to 160. If you set to a value out of this range, your password may become invalid. Please change the encryption value.',Exclamation!)
		dw_program.SetColumn('set_45')
		dw_program.SetFocus()
		return
	end if
	ll_OriEncry = long(gnv_data.of_getitem( "icred_settings", "set_45", FALSE))
	
	lds_UserPass = Create DataStore
	lds_UserPass.DataObject = 'd_user_password'
	lds_UserPass.SetTransObject(SQLCA)
	lds_UserPass.Retrieve()
	
	ll_Count = lds_UserPass.RowCount()
	for ll_Cycle = 1 to ll_Count
		ls_UserId[ll_Cycle] = lds_UserPass.GetItemString(ll_Cycle,'user_id')
		ls_OriPwd[ll_Cycle] = lds_UserPass.GetItemString(ll_Cycle,'user_password')
	
		ls_CurPwd[ll_Cycle] = lnvo_Encrypt.of_Decrypt(ls_OriPwd[ll_Cycle])
	next
	
	lds_UserPass.DataObject = 'd_email_password'
	lds_UserPass.SetTransObject(SQLCA)
	lds_UserPass.Retrieve()
	
	ll_Count = lds_UserPass.RowCount()
	for ll_Cycle = 1 to ll_Count
		ls_EMailPass = lds_UserPass.GetItemString(ll_Cycle,'password')
		if IsNull(ls_EMailPass) then CONTINUE
		
		ll_EmailId[UpperBound(ll_EmailId) + 1] = lds_UserPass.GetItemNumber(ll_Cycle,'id')
		ls_EmailCurPwd[UpperBound(ls_EmailCurPwd) + 1] = lnvo_Encrypt.of_Decrypt(ls_EMailPass)
	next
	
	Destroy lds_UserPass
end if
//---------------------------- APPEON END ----------------------------

// mskinner 06 april 2006 -- begin
//of_create_ctx_db( ) 03.12.2008 By Jervis don't need
// mskinner 06 april 2006 -- end

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 07.04.2006 By: LeiWei
//$<modification> When "Store to DB" is selected in Support Utilities window, the database will be initialized. 
Integer li_image_storage_type1,li_image_storage_type2
Integer li_word_storage_type1,li_word_storage_type2
n_appeon_storage_area lnv_storage_area

li_image_storage_type1 = dw_program.getitemnumber(1,'image_storage_type',Primary!,TRUE)
li_image_storage_type2 = dw_program.getitemnumber(1,'image_storage_type')

li_word_storage_type1 = dw_program.getitemnumber(1,'set_50',Primary!,TRUE)
li_word_storage_type2 = dw_program.getitemnumber(1,'set_50')

IF isnull(li_image_storage_type1) THEN li_image_storage_type1 = 0
IF isnull(li_image_storage_type2) THEN li_image_storage_type2 = 0
IF isnull(li_word_storage_type1) THEN li_word_storage_type1 = 0
IF isnull(li_word_storage_type2) THEN li_word_storage_type2 = 0

IF li_word_storage_type1 <> li_word_storage_type2 THEN
	IF li_word_storage_type2 = 1 THEN
		IF MessageBox("Program settings", "Are you sure to store Word templates to database?", Question!, OkCancel!, 1) = 1 THEN
			lnv_storage_area.of_init_storage_area( )
			// Change the facility->letter_path to the new Area_id (1,2 or whatever)
			gnv_appeondb.of_startqueue( )
			
			UPDATE facility
			SET letter_path = sys_storage_area.area_id
			FROM sys_storage_area
			WHERE facility.letter_path = sys_storage_area.area_doc_path;
			
			COMMIT;
			
			gnv_appeondb.of_commitqueue( )
		ELSE
			dw_program.setitem(1,'set_50',0)
		END IF
	ELSE
		IF MessageBox("Program settings", "Are you sure to store Word templates to hard disk?", Question!, OkCancel!, 1) = 1 THEN
			// Change the facility->letter_path to the new letter_path
			gnv_appeondb.of_startqueue( )
			
			UPDATE facility
			SET letter_path = sys_storage_area.area_doc_path
			FROM sys_storage_area
			WHERE facility.letter_path = convert(varchar(10), sys_storage_area.area_id);
			
			COMMIT;
			
			gnv_appeondb.of_commitqueue( )
		ELSE
			dw_program.setitem(1,'set_50',1)
		END IF
	END IF
END IF

IF li_image_storage_type1=0 AND li_image_storage_type2 = 1 THEN
	IF MessageBox("Program settings", "Are you sure to store the images to dabase?", Question!, OkCancel!, 1) = 1 THEN
		lnv_storage_area.of_init_storage_image( )
		open(w_image_to_db_conversion_utility)
	ELSE
		dw_program.setitem(1,'image_storage_type',0)
	END IF
END IF

//Begin - //Added By Gavin.Jay 2017-06-08
String 	ls_show_activate
ls_show_activate = dw_program.GetItemString ( dw_program.GetRow(), 'office_show_activate' )
If IsNull ( ls_show_activate ) Or Trim ( ls_show_activate )  = '' Then
	ls_show_activate = '0'
End If
If ls_show_activate <> is_show_activate_ori Then
	gnv_user_option.of_set_option_value( 'contractlogix-super-master','office_show_activate_buttons',ls_show_activate )
	gnv_user_option.of_save()
	is_show_activate_ori = ls_show_activate
End If
//End - //Added By Gavin.Jay 2017-06-08

//---------------------------- APPEON END ----------------------------


//---------------------------- APPEON END ----------------------------
//--------------------------- APPEON BEGIN ---------------------------
//$<add> 03.08.2007 By: Frank.Gui
//$<reason> According to Lynne's WebView project:$/Develop Area/IntelliCred/MSA/New Development/WebView/Requirement"/Security Management Difference between WebView and IntelliCred.doc
//          When turn WebView from off to on, add WebView account for all practitioners.
integer li_webview1,li_webview2

li_webview1= dw_program.getitemnumber(1,'set_web',primary!,true)
li_webview2 = dw_program.getitemnumber(1,'set_web')
IF li_webview1<> li_webview2 and li_webview2=1 THEN
	of_generate_pd_account( ) //Do not insert data to security_facilities.
END IF

//---------------------------- APPEON END ----------------------------

dw_program.update()
commit using sqlca;

gds_settings.retrieve()

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 06.08.2006 By: LeiWei
//$<modification> When "Store to DB" is selected in Support Utilities window, the database will be initialized. 
// Refresh global data object
gnv_data.of_retrieve( "icred_settings" )
//---------------------------- APPEON END ----------------------------

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 08.17.2006 By: LeiWei
//$<reason> Making the Contract Module a Standalone Product
Integer li_set_9

li_set_9 = Integer(gnv_data.of_getitem( "icred_settings", "set_9", FALSE))
IF Isnull(li_set_9) THEN li_set_9 = 0
gb_contract_version = li_set_9 = 4

IF Isvalid(w_mdi) THEN
	w_mdi.of_setup_security()
END IF
//---------------------------- APPEON END ----------------------------

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 11.27.2006 By: Jack (Contract Logix Agreement Manager Painters)
//$<reason> Making the Agreement Manager Module a Standalone Product
IF long(gnv_data.of_getitem( "icred_settings", "set_51", FALSE)) = 1 OR long(gnv_data.of_getitem( "icred_settings", "set_51", FALSE)) = 2 THEN
	gb_agreement_manager = True
ELSE
	gb_agreement_manager = False	
END IF

//To Do List: Allen 12.07.2006 //Start Code Change ----12.11.2007 #V8 maha  --removed; in version 8 tdl is user based
//IF long(gnv_data.of_getitem( "icred_settings", "set_49", FALSE)) = 1 THEN
//	gb_ToDoList = True
//ELSE
//	gb_ToDoList = False	
//END IF
//---------------------------- APPEON END ----------------------------

//--------------------------- APPEON BEGIN ---------------------------
//$< Add  > 2007-09-07 By: Scofield
//$<Reason> Change the Encryption value
if ib_EncryptChange then
	ll_CurEncry = long(gnv_data.of_getitem( "icred_settings", "set_45", FALSE))
	
	if ll_OriEncry <> ll_CurEncry then
		ll_Count = UpperBound(ls_UserId)
		
		for ll_Cycle = 1 to ll_Count
			ls_SetPwd[ll_Cycle] = lnvo_Encrypt.of_Encrypt(ls_CurPwd[ll_Cycle])
			Update security_users Set user_password = :ls_SetPwd[ll_Cycle] where user_id = :ls_UserId[ll_Cycle];
		next
		
		ll_Count = UpperBound(ll_EmailId)
		for ll_Cycle = 1 to ll_Count
			ls_EMailPass = lnvo_Encrypt.of_Encrypt(ls_EmailCurPwd[ll_Cycle])
			Update em_smtp_accounts Set Password = :ls_EMailPass where ID = :ll_EmailId[ll_Cycle] ;
		next
		
		COMMIT USING SQLCA;
	end if
end if

ib_EncryptChange = false

//added by nova 2008-03-28
//reaseon:fixed bug BugG031801(WEB Only P2) BugG031802(WEB Only P2)
integer li_set_cont
li_set_cont = integer(gnv_data.of_getitem("icred_settings" , "set_cont" , False))
if li_set_cont = 1 then gnv_app.of_setcontraccache_register( )
if li_set_cont = 1 then //Alfee 05.12.2008
	gb_contract_module = True
else
	gb_contract_module = False
end if
//---------------------------- APPEON END ----------------------------
//Begin - Added By Mark Lee 03/04/2013
IF isvalid(w_utilities_contract) Then 
	li_set_cont = 	dw_program.GetItemNumber(dw_program.GetRow(),'access_utility_menu') 
	If not isnull(li_set_cont) and li_set_cont =  1  Then
		w_utilities_contract.cb_copy_data_in_different_database.Enabled = True 	
	Else
		w_utilities_contract.cb_copy_data_in_different_database.Enabled = False		
	End IF 
End IF 
//End - Added By Mark Lee 03/04/2013

//Begin - Added By Mark Lee 05/28/2013
if cbx_pbtrace.checked then
	SetProfileString(gs_IniFilePathName, "Setup", "PBTrace", "1")
else
	SetProfileString(gs_IniFilePathName, "Setup", "PBTrace", "0")
end if
//End - Added By Mark Lee 05/28/2013

gs_esigntype = lower(gnv_data.of_getitem( 'icred_settings', 'esign_type', False)) //Added By Jay Chen 10-09-2013
gs_echosign_method = lower(gnv_data.of_getitem( 'icred_settings', 'echosign_method', False)) //Added By Jay Chen 02-06-2016



end event

type cbx_pw from checkbox within w_utilities_support
integer x = 1449
integer y = 1704
integer width = 581
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Support Password ON"
end type

event constructor;//--------------------------- APPEON BEGIN ---------------------------
//$< Add  > 2008-03-14 By: Scofield
//$<Reason> init the Support Password ON check box status.

String	ls_dev

ls_dev = ProfileString(gs_IniFilePathName, "setup", "development", "None")
if Integer(ls_dev) > 0 then		//if the current user is developer,support password on function disabled
	cbx_pw.Checked = false
	This.Visible = false
else
	if gi_support_pw_on = 1 then
		cbx_pw.Checked = true
	else
		cbx_pw.Checked = false
	end if
end if

//---------------------------- APPEON END ----------------------------

end event

type dw_program from datawindow within w_utilities_support
integer x = 87
integer y = 80
integer width = 1266
integer height = 2692
integer taborder = 10
string dataobject = "d_support_set"
boolean border = false
boolean livescroll = true
boolean righttoleft = true
end type

event itemchanged;integer 	li_ans
integer 	i,li_Rtn
long		ll_Enabled

this.accepttext()
//Start Code Change ---- 11.10.2006 #1 maha //added auto change to store in database when set to contracts
IF This.GetColumnName() = "set_9" THEN
	i = this.getitemnumber(1,'set_9')
	if i = 1 then //setting for IntelliApp customers
		gs_cust_type = "I"
	elseif i = 2 then
		li_ans = MessageBox( "IntelliCred SE", "Are you sure you want to change this to an IntelliCred SE version?~r If you say YES, selected security settings will be set for all roles.  Corrections will have to be made manually. ", StopSign!, YesNo!, 2 )
		IF li_ans = 1 THEN
			ii_sechange = 1
		else
			ii_sechange = 0
		END IF
	elseif i = 4 then // contracts
		this.setitem(1,"image_storage_type",1)
		this.setitem(1,"set_50",1)
		ib_word_storage_to_db = true
		ib_image_storage_to_db = true
		gs_cust_type = ""
	else
		gs_cust_type = ""
	end if
	//--------------------------- APPEON BEGIN ---------------------------
	//$<add> 05.21.2007 By: Jack
	//$<reason> Fix a defect.
	If i = 4 Then
		this.setitem(1,'set_cont',1)
		this.modIfy("set_cont.protect = 1")						  
		this.modIfy("set_cont.background.color = 67108864")  
	Else
		this.modIfy("set_cont.protect = 0")						  
		this.modIfy("set_cont.background.color = 16777215")  
	End If		
	//---------------------------- APPEON END ----------------------------

end if
//End Code Change---11.10.2006
IF This.GetColumnName() = "set_iauto" THEN
	if this.getitemnumber(1,'set_iauto') = 1 then // has export module
		gi_export_on = 1
	else
		gi_export_on = 0
	end if
end if

IF This.GetColumnName() = "set_ireport" THEN  // has intellireport module
	if this.getitemnumber(1,'set_ireport') = 1 then
		gi_ireport_on = 1
	else
		gi_ireport_on = 0
	end if
end if

IF This.GetColumnName() = "set_iapps" THEN  // has application printing module
	if this.getitemnumber(1,'set_iapps') = 1 then
		gi_iapp_on = 1
	else
		gi_iapp_on = 0
	end if
end if

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 06.06.2006 By: LeiWei
//$<reason> Check word & image change to database module
//$<reason> Bryan

IF This.GetColumnName() = "image_storage_type" THEN  // has storage in database module
	ib_image_storage_to_db = this.getitemnumber(1,'image_storage_type') = 1
END IF

IF This.GetColumnName() = "set_50" THEN  // has storage in database module
	ib_word_storage_to_db = this.getitemnumber(1,'set_50') = 1
END IF

//---------------------------- APPEON END ----------------------------

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 11.22.2006 By: Davis
//$<reason> For Global Search.
IF This.GetColumnName() = "set_9" AND gs_dbtype = "SQL" THEN
	IF data = '4' THEN
		SELECT DATABASEPROPERTY(db_name(),'IsFulltextEnabled') into :ll_Enabled from ids;	//Add by WuZhiJun on 2007-05-18
		IF ll_Enabled = 0 THEN
			IF Messagebox("Global Search", "Would you like to turn Full Text search ON?", Question!, YesNo!, 1) = 1 THEN
				This.Post Setitem( row, "set_48", 1)
				cb_8.event clicked( )
			END IF
		END IF
	END IF
END IF

IF This.GetColumnName() = "set_48" AND gs_dbtype = "SQL" and this.getitemnumber(1,'set_9')=4   THEN
	//--------------------------- APPEON BEGIN ---------------------------
	//$<modified> 2007-05-18 By: Wu ZhiJun
	//$<reason> Fix a bug
	SELECT DATABASEPROPERTY(db_name(),'IsFulltextEnabled') into :ll_Enabled from ids;
	
	IF data = '1' THEN
		IF ll_Enabled = 0 THEN
			li_Rtn = Messagebox("Global Search", "Would you like to turn Full Text search ON?", Question!, YesNo!, 1)
			if li_Rtn = 1 then
				cb_8.event clicked( )
			else
				This.Post Setitem( row, "set_48", 0)
			end if
		END IF
	ELSE
		IF ll_Enabled = 1 THEN
			li_Rtn = Messagebox("Global Search", "Would you like to turn Full Text search OFF?", Question!, YesNo!, 1)
			IF li_Rtn = 1 THEN
				cb_10.event clicked( )
			ELSE
				This.Post Setitem( row, "set_48", 1)
			END IF
		END IF
	END IF
END IF
	//--------------------------- APPEON END -----------------------------
If This.GetColumnName() = 'set_47' Then
	If data = '1' Then
		gb_workflow = true
	Else
		gb_workflow = false
	End If
End If
//---------------------------- APPEON END ----------------------------

//--------------------------- APPEON BEGIN ---------------------------
//$< Add  > 2007-09-07 By: Scofield
//$<Reason> Mark a changed flag for Encryption value

If dwo.name = 'set_45' Then
	ib_EncryptChange = true
	il_EncryptValue = long(data)
end if
//---------------------------- APPEON END ----------------------------

end event

event constructor;//--------------------------- APPEON BEGIN ---------------------------
//$<add> 11.24.2006 By: Davis
//$<reason> For global search.
//Start Code Change ----01.28.2008 #V8 maha moved to open event of window
//IF gs_dbtype <> 'SQL' THEN
//	//This.Modify( "t_48.visible = 0 set_48.visible = 0" )
//	This.Modify( "set_48.visible = 0" )
//END IF

//---------------------------- APPEON END ----------------------------

end event

type cb_tab_order from commandbutton within w_utilities_support
boolean visible = false
integer x = 3264
integer y = 908
integer width = 960
integer height = 72
integer taborder = 170
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Set tab order by Position"
end type

event clicked;//oleobject iole_word
//
//string lpath
//string mpath
//
//lpath = ""
//
//iole_word = CREATE oleobject
//if iole_word.Connecttonewobject("word.application") <> 0 then
//	messagebox('Client Error', 'This application could nbot connect to Microsoft Word. Please make sure it is properly installed.')
//	return -1
//end if
//
//iole_word.Visible = True

//openwithparm(w_tab_order_by_position,"P")
end event

type cb_new_screen from commandbutton within w_utilities_support
boolean visible = false
integer x = 3282
integer y = 816
integer width = 960
integer height = 72
integer taborder = 160
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "New Screen Painter"
end type

event clicked;//integer r
//string ls_win
//
//ls_win = "new screen"
//
//r = of_password(ls_win)
//if r = 1 then
	open(w_new_screen_painter)
//end if
end event

type cb_test from commandbutton within w_utilities_support
boolean visible = false
integer x = 3269
integer y = 1156
integer width = 960
integer height = 72
integer taborder = 200
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Web Crawler Painter"
end type

event clicked;
open(w_web_crawler_painter)
//Open(w_import_painter)
//OpenWithParm ( w_utl_label_strip_quote, "P")	
end event

type cb_add_help from commandbutton within w_utilities_support
integer x = 1531
integer y = 1080
integer width = 960
integer height = 72
integer taborder = 150
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "Edit Help Files"
end type

event clicked;//integer r
//string ls_win
//
//ls_win = "w_help_add"
//
//r = of_password(ls_win)
//if r = 1 then
	openwithparm(w_help_add,"P")
//end if
end event

type st_2 from statictext within w_utilities_support
integer x = 3515
integer y = 2068
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

type cb_update_view from commandbutton within w_utilities_support
integer x = 1531
integer y = 376
integer width = 960
integer height = 72
integer taborder = 140
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Update Single View"
end type

event clicked;//integer r
//string ls_win
//
//ls_win = "w_view_update_utility"
//
//r = of_password(ls_win)
//if r = 1 then
	open(w_view_update_utility)
//end if
end event

type cb_sys_tables from commandbutton within w_utilities_support
boolean visible = false
integer x = 3282
integer y = 416
integer width = 960
integer height = 72
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Modify Sys Tables"
end type

event clicked;//integer r
//string ls_win
//
//ls_win = "w_sys_field_utility"
//
//r = of_password(ls_win)
//if r = 1 then
	open(w_sys_table_utility)
//end if
end event

type cb_view_update from commandbutton within w_utilities_support
integer x = 1531
integer y = 288
integer width = 960
integer height = 72
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "View Update"
end type

event clicked;//integer r
//string ls_win
//
//ls_win = "w_utl_update_views"
//
//r = of_password(ls_win)
//if r = 1 then
	openwithparm(w_utl_update_views,"P")
//end if
end event

type cb_edit_profile from commandbutton within w_utilities_support
boolean visible = false
integer x = 3282
integer y = 496
integer width = 960
integer height = 72
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Edit Profile Data"
end type

event clicked;//integer r
//string ls_win
//
//ls_win = "w_profile_data_utility"
//
//r = of_password(ls_win)
//
//if r = 1 then
	open(w_profile_data_utility)
//end if
end event

type cb_new_sys_fields from commandbutton within w_utilities_support
boolean visible = false
integer x = 3282
integer y = 336
integer width = 960
integer height = 72
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Add Sys/Screen fields"
end type

event clicked;//integer r
//string ls_win
//
//ls_win = "w_setup_new_field"
//
//r = of_password(ls_win)
//if r = 1 then
	open(w_setup_new_field)
//end if
end event

type cb_sys_fields from commandbutton within w_utilities_support
boolean visible = false
integer x = 3282
integer y = 256
integer width = 960
integer height = 72
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Modify Screen Name"
end type

event clicked;//integer r
//string ls_win
//
//ls_win = "w_sys_field_utility"
//
//r = of_password(ls_win)
//if r = 1 then
	open(w_sys_field_utility)
//end if
end event

type cb_sql from commandbutton within w_utilities_support
integer x = 1531
integer y = 200
integer width = 960
integer height = 72
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Run SQL"
end type

event clicked;//
//integer r
//string ls_win
//
//// r = 	messagebox("About","This utility allows the runing of SQL statements. ~r~rDo you wish to continue?",Question!,yesno!,2)
////if r = 2 then return
//
//
//ls_win = "w_sql_send"
//
//r = of_password(ls_win)
//
//if r = 1 then
	open(w_sql_send)
//end if
end event

type dw_3 from datawindow within w_utilities_support
boolean visible = false
integer x = 3547
integer y = 1400
integer width = 247
integer height = 88
integer taborder = 450
string dataobject = "d_fix_dob"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)

end event

type cb_3 from commandbutton within w_utilities_support
integer x = 2647
integer y = 156
integer width = 370
integer height = 84
integer taborder = 520
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Close"
boolean cancel = true
end type

event clicked;CLOSE(PARENT)
end event

type dw_facilcomm from datawindow within w_utilities_support
boolean visible = false
integer x = 3653
integer y = 1616
integer width = 46
integer height = 64
integer taborder = 510
string dataobject = "d_comm_of_facil"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_praccomm from datawindow within w_utilities_support
boolean visible = false
integer x = 3538
integer y = 1528
integer width = 279
integer height = 64
integer taborder = 490
string dataobject = "d_prac_pd_comm"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_pracaffil from datawindow within w_utilities_support
boolean visible = false
integer x = 3566
integer y = 1532
integer width = 279
integer height = 68
integer taborder = 480
string dataobject = "d_affil_stat_of_prac_all"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_dvfieldcopy from datawindow within w_utilities_support
boolean visible = false
integer x = 3538
integer y = 452
integer width = 261
integer height = 76
integer taborder = 470
string dataobject = "d_dvf_field_copy"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_data_view_list from datawindow within w_utilities_support
boolean visible = false
integer x = 3547
integer y = 556
integer width = 283
integer height = 72
integer taborder = 380
string dataobject = "d_data_view_list"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type gb_2 from groupbox within w_utilities_support
integer x = 37
integer y = 28
integer width = 1326
integer height = 2756
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "Program Settings"
end type

type cb_support_settings from commandbutton within w_utilities_support
boolean visible = false
integer x = 1033
integer y = 2848
integer width = 416
integer height = 72
integer taborder = 410
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "New Dashboard"
end type

event clicked;integer r
//string ls_win
//
//ls_win = "w_support_settings"
//
//r = of_password(ls_win)
//
//if r = 1 then
	//open(w_missing_verif_check)
//	r = 2/0
	open(w_dash)
//end if


end event

type gb_3 from groupbox within w_utilities_support
boolean visible = false
integer x = 101
integer y = 2776
integer width = 2551
integer height = 188
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "Testing"
end type

type gb_4 from groupbox within w_utilities_support
integer x = 1445
integer y = 1996
integer width = 1138
integer height = 784
integer taborder = 220
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "Copy data in different Database"
end type

type gb_1 from groupbox within w_utilities_support
integer x = 1445
integer y = 28
integer width = 1138
integer height = 1588
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

