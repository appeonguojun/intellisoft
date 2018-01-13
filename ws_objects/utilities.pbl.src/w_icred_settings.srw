$PBExportHeader$w_icred_settings.srw
forward
global type w_icred_settings from window
end type
type sle_downloadurl from singlelineedit within w_icred_settings
end type
type st_downloadurl from statictext within w_icred_settings
end type
type cb_brow4 from commandbutton within w_icred_settings
end type
type cb_contract_path from commandbutton within w_icred_settings
end type
type dw_users from datawindow within w_icred_settings
end type
type dw_departments from datawindow within w_icred_settings
end type
type cb_brow3 from commandbutton within w_icred_settings
end type
type cb_brow1 from commandbutton within w_icred_settings
end type
type cb_brow2 from commandbutton within w_icred_settings
end type
type dw_2 from datawindow within w_icred_settings
end type
type cb_other_set from commandbutton within w_icred_settings
end type
type cb_2 from commandbutton within w_icred_settings
end type
type cb_1 from commandbutton within w_icred_settings
end type
type dw_1 from datawindow within w_icred_settings
end type
type gb_1 from groupbox within w_icred_settings
end type
end forward

global type w_icred_settings from window
integer x = 677
integer y = 48
integer width = 2647
integer height = 2564
boolean titlebar = true
string title = "Application Settings"
boolean controlmenu = true
boolean minbox = true
long backcolor = 79680469
boolean center = true
event ue_closecontract ( )
event ue_opencontract ( )
sle_downloadurl sle_downloadurl
st_downloadurl st_downloadurl
cb_brow4 cb_brow4
cb_contract_path cb_contract_path
dw_users dw_users
dw_departments dw_departments
cb_brow3 cb_brow3
cb_brow1 cb_brow1
cb_brow2 cb_brow2
dw_2 dw_2
cb_other_set cb_other_set
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
gb_1 gb_1
end type
global w_icred_settings w_icred_settings

type variables
Boolean ib_changed_safemode, ib_changed_unload_addins,ib_change_show_tip,ib_change_filter_com

//Added By Jay Chen 10-30-2015
long	il_CurCtxID	
string is_page_text
DataStore	ids_SearchTemp,ids_SearchDevTemp
Boolean ib_RetrieveStatus
//end

String is_workflow_user_ori //Added By Jay 2016-04-27
String is_web_theme_ori //Added By Jay 2016-06-06.
String is_show_activate_ori//Added By Gavin.Jay 2017-04-19
end variables

forward prototypes
public function integer of_dept_security ()
public function integer of_pre_update ()
public subroutine of_synchronize_data ()
end prototypes

event ue_closecontract();//====================================================================
// Function: ue_closecontract.pfc_cst_u_contract_data_design()
//--------------------------------------------------------------------
// Description: Back the last selected tagpage
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  
//--------------------------------------------------------------------
// Author:	Scofield		Date: 2009-01-13
//--------------------------------------------------------------------
//	Copyright (c) 2002-2009 Appeon, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

long	ll_Row,ll_RowCnt

DataWindow	ldw_Search,ldw_SearDt

il_CurCtxID = gw_Contract.tab_contract_details.tabpage_search.il_ctx_id
is_page_text = gw_Contract.tab_contract_details.tabpage_search.sle_page.text //Added By Jay Chen 05-20-2015
gw_Contract.of_BackupFocusObject(gw_Contract.Control[])

ldw_Search = gw_contract.tab_contract_details.tabpage_search.dw_search
ldw_SearDt = gw_contract.tab_contract_details.tabpage_search.dw_search_det1

//ids_SearchTemp.DataObject = ldw_Search.DataObject
//ids_SearchDevTemp.DataObject = ldw_SearDt.DataObject
//modified by gavins 20120423
if Not IsValid(ids_SearchTemp) then ids_SearchTemp = Create DataStore
if Not IsValid(ids_SearchDevTemp) then ids_SearchDevTemp = Create DataStore
ids_SearchTemp.create( ldw_Search.describe( "datawindow.syntax" )  )
ids_SearchDevTemp.create( ldw_SearDt.describe( "datawindow.syntax" )  )

ldw_Search.RowsCopy(1,ldw_Search.RowCount(),Primary!,ids_SearchTemp,1,Primary!)
ldw_SearDt.RowsCopy(1,ldw_SearDt.RowCount(),Primary!,ids_SearchDevTemp,1,Primary!)

ib_RetrieveStatus = gw_Contract.tab_contract_details.tabpage_search.ib_AutoRetrieve
gw_Contract.tab_contract_details.tabpage_search.ib_AutoRetrieve = false

gw_Contract.TriggerEvent("pfc_close")

end event

event ue_opencontract();//====================================================================
// Function: ue_opencontract.pfc_cst_u_contract_data_design()
//--------------------------------------------------------------------
// Description: Restore select the last selected tabpage
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  
//--------------------------------------------------------------------
// Author:	Scofield		Date: 2009-01-13
//--------------------------------------------------------------------
//	Copyright (c) 2002-2009 Appeon, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

long	ll_Row,ll_RowCnt

DataWindow	ldw_Search,ldw_SearDt

SetPointer(HourGlass!)


gw_Contract.SetRedraw( false)

ldw_Search = gw_contract.tab_contract_details.tabpage_search.dw_search
ldw_SearDt = gw_contract.tab_contract_details.tabpage_search.dw_search_det1

ldw_Search.Reset()
ids_SearchTemp.RowsCopy(1,ids_SearchTemp.RowCount(),Primary!,ldw_Search,1,Primary!)
ids_SearchDevTemp.RowsCopy(1,ids_SearchDevTemp.RowCount(),Primary!,ldw_SearDt,1,Primary!)

gw_Contract.tab_contract_details.tabpage_search.cbx_1.Checked = ib_RetrieveStatus
gw_Contract.tab_contract_details.tabpage_search.ib_autoretrieve = ib_RetrieveStatus
gw_contract.tab_contract_details.tabpage_search.ib_retrieve = true
//Added By Jay Chen 05-20-2015
if ib_RetrieveStatus then gw_Contract.tab_contract_details.tabpage_search.ib_open_with_ctx = true 
gw_Contract.tab_contract_details.tabpage_search.sle_page.text = is_page_text
//end

ll_RowCnt = ldw_SearDt.RowCount()

//Set Tab Enable - jervis 09.26.2010
IF ll_RowCnt < 1 THEN 
	gw_contract.Dynamic Function wf_set_tab_enabled(False)
Else
	gw_contract.Dynamic Function wf_set_tab_enabled(True)
end if


ll_Row = ldw_SearDt.Find("ctx_id = " + String(il_CurCtxID),1,ll_RowCnt)
if ll_Row > 0 then
	ldw_SearDt.ScrollToRow(ll_Row)
	ldw_SearDt.SetRow(ll_Row)
	ldw_SearDt.Event RowFocusChanging(ll_Row,ll_Row)
	ldw_SearDt.Event RowFocusChanged(ll_Row)
end if

gw_Contract.of_RestoreFocusObject(gw_Contract.Control[])

SetPointer(Arrow!)
gw_Contract.SetRedraw( true)

if IsValid(ids_SearchTemp) then destroy ids_SearchTemp
if IsValid(ids_SearchDevTemp) then destroy ids_SearchDevTemp

il_CurCtxID = 0

end event

public function integer of_dept_security ();Integer li_value
Integer li_ans
Integer li_access
Integer li_rec_cnt
Long ll_department
long ll_security_dept_code
long ll_ec
long ll_e
long ll_new
long ll_find
String ls_user_id
string ls_find
n_ds lds_existing
n_ds lds_new

//


		SELECT Count( user_id )
		INTO :li_rec_cnt
		FROM security_user_department;
		IF SQLCA.SQLCODE = -1 THEN
			MessageBox( "SQL Error", SQLCA.SQLERRTEXT )
			RETURN -1
		END IF
		
select max(user_depart_id) into :ll_security_dept_code from security_user_department;
if isnull(ll_security_dept_code) then ll_security_dept_code = 0
		
li_ans = MessageBox( "Department Security", "Are you sure you want to turn the department security feature on?",  question!, YesNo!, 1 )
		
//maha 012606 datastores for testing for and adding records
lds_existing = CREATE n_ds
lds_existing.dataobject = "d_dept_security_all"
lds_existing.settransobject(sqlca)

lds_new = CREATE n_ds
lds_new.dataobject = "d_dept_security_all"
lds_new.settransobject(sqlca)
//debugbreak()
		//if going to turn on then need to scan through departments and create user department security table
IF li_ans = 1 THEN
	Integer li_dept_cnt
	Integer li_user_cnt
	Integer d
	Integer u
	
	gi_dept_security = 1  //Start Code Change ----04.09.2008 #V8 maha - set variable when making this change
	
	li_ans = MessageBox("Access", "Do you want the default department access for all new created records to be turned on?", Question!, YesNo!, 1 )
		IF li_ans = 1 THEN
		li_access = 1
	ELSE
		li_access = 0
	END IF
	
	IF li_access = 0 THEN
		li_ans = MessageBox( "No Access", "When your users login they will have no access to physician data until you go to the User Painter and Grant access to specific departments for each user.", information!, OkCancel!, 1 )
		IF li_ans = 2 THEN
			RETURN -1
		END IF
	END IF
	
	dw_departments.SetTransObject( SQLCA )
	li_dept_cnt = dw_departments.Retrieve( )
	
	dw_users.SetTransObject( SQLCA )
	li_user_cnt = dw_users.Retrieve( )
	
	ll_ec = lds_existing.retrieve() 
	
	//Loop through all users and department and setup department security
	FOR u = 1 TO li_user_cnt
		ls_user_id = dw_users.GetItemString( u, "user_id" )
		FOR d = 1 TO li_dept_cnt
			//ll_security_dept_code ++
			ll_department = dw_departments.GetItemNumber( d, "lookup_code" )
			ls_find = "user_id = '" + ls_user_id + "' and department_id = " + string(ll_department)
			ll_find = lds_existing.Find ( ls_find, 1, ll_ec )
			
			if ll_find = 0 then
				ll_security_dept_code ++
				ll_new = lds_new.insertrow(0)
				lds_new.setitem(ll_new,"user_depart_id",ll_security_dept_code)
				lds_new.setitem(ll_new,"user_id",ls_user_id)
				lds_new.setitem(ll_new,"department_id",ll_department)
				lds_new.setitem(ll_new,"access_rights",li_access)
			elseif ll_find < 0 then
				messagebox("Find error",ls_find)
				return -1
			end if		
			
					
		END FOR
			
	END FOR
			//debugbreak()
	ll_find = lds_new.update()
	if ll_find < 1 then
		rollback;
	else
		COMMIT USING SQLCA;
	end if
	MessageBox( "Department Security", "Department Security data updated.  Go to System->Painters->User Painter to edit access." )  //Start Code Change ----04.09.2008 #V8 maha - moved from outside of if statement

	
else //Start Code Change ----04.09.2008 #V8 maha - reset the value is user says no.
	dw_1.setitem(1,"set_37", 0)
			
END IF
		
destroy lds_existing
destroy lds_new
		

return 1
end function

public function integer of_pre_update ();//Start Code Change ---- 03.01.2006 #303 maha
//function created maha 030106 for \\ checking of path
string s
integer i
string ls_field

dw_2.accepttext()
if dw_2.getitemstatus( 1, 0, primary!) = datamodified! then
	for i = 1 to 5
		choose case i
			case 1
				ls_field = "intelliapp_app_path"
			case 2
				ls_field = "imaging_path"
			case 3
				ls_field = "picture_path"
			case 4
				ls_field = "letter_save_path"
			case 5
				ls_field = "contract_path"
		end choose
		//if dw_2.getitemstatus( 1, i, primary!) = datamodified! then
			s = dw_2.getitemstring(1,ls_field)
			//messagebox("out",s)
			s = of_check_path(s,1)
			//messagebox("in",s)
			dw_2.setitem(1,ls_field,s)
		//end if
	next	
end if

//Added By Ken.Guo 2015-07-16
dw_1.accepttext( )
If dw_1.GetItemNumber(1, 'set_word_safemode', Primary!, true) <> dw_1.GetItemNumber(1, 'set_word_safemode', Primary!, False)  Then
	ib_changed_safemode = True
End if
If dw_1.GetItemNumber(1, 'unload_word_addins', Primary!, true) <> dw_1.GetItemNumber(1, 'unload_word_addins', Primary!, False)  Then
	ib_changed_unload_addins = True
End if
//Added By Jay Chen 07-20-2015
If dw_1.GetItemString(1, 'show_column_tip', Primary!, true) <> dw_1.GetItemString(1, 'show_column_tip', Primary!, False)  Then
	ib_change_show_tip = True
End if
//Added By Jay Chen 10-29-2015
If dw_1.GetItemString(1, 'filter_company_contact', Primary!, true) <> dw_1.GetItemString(1, 'filter_company_contact', Primary!, False)  Then
	ib_change_filter_com = True
End if


return 1
//End Code Change---03.01.2006
end function

public subroutine of_synchronize_data ();//////////////////////////////////////////////////////////////////////
// $<function>w_icred_settings::of_synchronize_data()
// $<arguments>(None)
// $<returns> integer
// $<description>
// $<description> After modified data, synchronize it.
//////////////////////////////////////////////////////////////////////
// $<add> 08.27.2008 by Ken.Guo
//////////////////////////////////////////////////////////////////////

gnv_session.ii_session_refresh_frequency  = dw_1.getitemnumber(1,'session_refresh_frequency') //Added By Ken.Guo 08.27.2008


//Begin - Added By Mark Lee 12/05/2012
gi_test_mode = dw_1.getitemnumber(1,'set_10')

gi_scan_format = dw_1.getitemnumber(1,'set_29')

gi_email_type = dw_1.getitemnumber(1,'set_56')
//End - Added By Mark Lee 12/05/2012


end subroutine

on w_icred_settings.create
this.sle_downloadurl=create sle_downloadurl
this.st_downloadurl=create st_downloadurl
this.cb_brow4=create cb_brow4
this.cb_contract_path=create cb_contract_path
this.dw_users=create dw_users
this.dw_departments=create dw_departments
this.cb_brow3=create cb_brow3
this.cb_brow1=create cb_brow1
this.cb_brow2=create cb_brow2
this.dw_2=create dw_2
this.cb_other_set=create cb_other_set
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
this.gb_1=create gb_1
this.Control[]={this.sle_downloadurl,&
this.st_downloadurl,&
this.cb_brow4,&
this.cb_contract_path,&
this.dw_users,&
this.dw_departments,&
this.cb_brow3,&
this.cb_brow1,&
this.cb_brow2,&
this.dw_2,&
this.cb_other_set,&
this.cb_2,&
this.cb_1,&
this.dw_1,&
this.gb_1}
end on

on w_icred_settings.destroy
destroy(this.sle_downloadurl)
destroy(this.st_downloadurl)
destroy(this.cb_brow4)
destroy(this.cb_contract_path)
destroy(this.dw_users)
destroy(this.dw_departments)
destroy(this.cb_brow3)
destroy(this.cb_brow1)
destroy(this.cb_brow2)
destroy(this.dw_2)
destroy(this.cb_other_set)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
destroy(this.gb_1)
end on

event open;dw_1.settransobject(sqlca)
dw_1.retrieve()

//--------------------------- APPEON BEGIN ---------------------------
//$< Add  > 2008-03-17 By: Scofield
//$<Reason> Insert a blank row for addresser.

DataWindowChild	ldw_Child

dw_1.GetChild('set_addresser',ldw_Child)
ldw_Child.InsertRow(1)
//---------------------------- APPEON END ----------------------------

//Begin - Added By Jay 2016-04-27.
//$<Reason> Insert a Label for Trigger the Web Approve (FileService) workflow with this user
string ls_value
ls_value = gnv_user_option.of_get_option_value('webpage_approve_workflow_trigger_username' )
If IsNull ( ls_value ) Or Trim ( ls_value ) = "" Then
	ls_value = ""
End If

is_workflow_user_ori = ls_value
If dw_1.GetRow() > 0 Then
	dw_1.SetItem ( dw_1.GetRow(), 'workflow_trigger_username', ls_value )
End If
//End - Added By Jay 2016-04-27.

//Begin - Added By Jay 2016-06-06
//$<Reason> Insert a Label for Web Approve page theme
ls_value = gnv_user_option.of_get_option_value('contractlogix-super-master','contract_web_approval_screen')
If IsNull ( ls_value ) Or Trim ( ls_value ) = "" Then	
	ls_value = "0"
	gnv_user_option.of_set_option_value( 'contractlogix-super-master','contract_web_approval_screen',ls_value )
	gnv_user_option.of_save()
End If

is_web_theme_ori = ls_value
If dw_1.GetRow() > 0 Then
	dw_1.SetItem ( dw_1.GetRow(), 'web_approve_page_theme', ls_value )
End If

//Added by gavins 20170907
If dw_1.GetRow() > 0 Then
	dw_1.SetItem ( dw_1.GetRow(), 'proxy_server', "" )
	dw_1.SetItem ( dw_1.GetRow(), 'proxy_port', "" )
	dw_1.SetItem ( dw_1.GetRow(), 'proxy_user', "" )
	dw_1.SetItem ( dw_1.GetRow(), 'proxy_pwd', "" )
	dw_1.SetItem ( dw_1.GetRow(), 'proxy_protocol', "" )
	ls_value = ""
	ls_value = gnv_user_option.of_get_option_value('contractlogix-super-master','email_proxy_server')
	If Len( ls_value)>0 Then dw_1.SetItem ( dw_1.GetRow(), 'proxy_server', ls_value )
	ls_value = gnv_user_option.of_get_option_value('contractlogix-super-master','email_proxy_port')
	If Len( ls_value)>0 Then dw_1.SetItem ( dw_1.GetRow(), 'proxy_port', ls_value )
	ls_value = gnv_user_option.of_get_option_value('contractlogix-super-master','email_proxy_user')
	If Len( ls_value)>0 Then dw_1.SetItem ( dw_1.GetRow(), 'proxy_user', ls_value )
	ls_value = gnv_user_option.of_get_option_value('contractlogix-super-master','email_proxy_password')
	If Len( ls_value)>0 Then dw_1.SetItem ( dw_1.GetRow(), 'proxy_pwd', ls_value )
	ls_value = gnv_user_option.of_get_option_value('contractlogix-super-master','email_proxy_protocol')
	If Len( ls_value)>0 Then dw_1.SetItem ( dw_1.GetRow(), 'proxy_protocol', ls_value )
End If
//End - Added By Jay 2016-06-06

//Commented By Gavin.Jay 2017-06-08
////Begin - Added By Gavin.Jay 2017-04-19  
////$<Reason> Insert a Label for Display the activate and the deactivate buttons on the Office Control
//ls_value = gnv_user_option.of_get_option_value('contractlogix-super-master','office_show_activate_buttons' )
//If IsNull ( ls_value ) Or Trim ( ls_value ) = "" Then
//	ls_value = "0"
//End If
//
//is_show_activate_ori = ls_value
//If dw_1.GetRow() > 0 Then
//	dw_1.SetItem ( dw_1.GetRow(), 'office_show_activate', ls_value )
//End If
////End - Added By Gavin.Jay 2017-04-19


dw_2.settransobject(sqlca)
dw_2.retrieve()
gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17





end event

type sle_downloadurl from singlelineedit within w_icred_settings
integer x = 485
integer y = 2328
integer width = 2016
integer height = 88
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event modified;//////////////////////////////////////////////////////////////////////
// $<event>  Modified()
// $<arguments> None
// $<returns>   Long
// $<description> Set DownloadURL colomn value
//////////////////////////////////////////////////////////////////////
// $<add> 2008-11-13 by Scofield
//////////////////////////////////////////////////////////////////////

String	ls_DownLoadURL
long		ll_Row

ll_Row = dw_1.RowCount()
if ll_Row <= 0 or ll_Row > dw_1.RowCount() then Return

ls_DownLoadURL = Trim(sle_DownLoadURL.Text)
if ls_DownLoadURL <> "" and Right(ls_DownLoadURL,1) <> "/" then ls_DownLoadURL += "/"

dw_1.SetItem(ll_Row,"DownloadURL",ls_DownLoadURL)

end event

type st_downloadurl from statictext within w_icred_settings
integer x = 55
integer y = 2344
integer width = 416
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Download URL:"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_brow4 from commandbutton within w_icred_settings
boolean visible = false
integer x = 2286
integer y = 2148
integer width = 251
integer height = 80
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Browse"
end type

event clicked;
// mskinner 19 aug 2005 -- begin
//string docname, named, path
//
//integer value
//
//value = GetFilesaveName("Select Directory and enter 'Path' as file name",&
//+ docname, named, "DOC", &
//	+ "text Files (*.txt),*.txt")
//
//
//IF value = 1 THEN
//	path = mid(docname,1,pos(docname,named,1) - 1)
//	dw_2.setitem(1,"picture_path",path)
//END IF


string ls_path 

ls_path =  f_browseforfolder('This is used primarily for Citrix setups. Please select a folder where letters wil be saved when run.' ,handle(parent)) 


if f_validstr(ls_path)  then 
    dw_2.object.letter_save_path[1] = ls_path  +"\"
end if
end event

type cb_contract_path from commandbutton within w_icred_settings
boolean visible = false
integer x = 2286
integer y = 2240
integer width = 251
integer height = 80
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Browse"
end type

event clicked;/******************************************************************************************************************
**  [PUBLIC]   : event CLICKED!
**==================================================================================================================
**  Purpose   	: Gets the path from the user,sets the contract path
**==================================================================================================================
**  Arguments 	: [none] 
**==================================================================================================================
**  Returns   	: [none]   
**==================================================================================================================
**  Notes     	: 	   
**==================================================================================================================
**  Created By	: Michael B. Skinner 19 August 2005  © Intellisoftgroup, Inc
**==================================================================================================================
**  Modification Log
**   Changed By             Change Date                                               Reason
** ------------------------------------------------------------------------------------------------------------------
********************************************************************************************************************/

string ls_path 

ls_path =  f_browseforfolder('Please select a folder where you will be storing contract image files.' ,handle(parent))

if f_validstr(ls_path)  then 
   dw_2.object.contract_path[1] = ls_path  +"\"
	// set the path
   //GNV_app.of_set_contract_path(ls_path  +"\" )
end if
end event

type dw_users from datawindow within w_icred_settings
boolean visible = false
integer x = 41
integer y = 16
integer width = 279
integer height = 108
integer taborder = 30
string dataobject = "d_user_list"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_departments from datawindow within w_icred_settings
boolean visible = false
integer x = 325
integer y = 16
integer width = 224
integer height = 108
integer taborder = 20
string dataobject = "d_all_departments"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_brow3 from commandbutton within w_icred_settings
boolean visible = false
integer x = 2286
integer y = 2056
integer width = 251
integer height = 80
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Browse"
end type

event clicked;
// mskinner 19 aug 2005 -- begin
//string docname, named, path
//
//integer value
//
//value = GetFilesaveName("Select Directory and enter 'Path' as file name",&
//+ docname, named, "DOC", &
//	+ "text Files (*.txt),*.txt")
//
//
//IF value = 1 THEN
//	path = mid(docname,1,pos(docname,named,1) - 1)
//	dw_2.setitem(1,"picture_path",path)
//END IF


string ls_path 

ls_path =  f_browseforfolder('Please select a folder where you will be storing the practitioner picture.' ,handle(parent)) 


if f_validstr(ls_path)  then 
    dw_2.object.picture_path[1] = ls_path  +"\"
end if
end event

type cb_brow1 from commandbutton within w_icred_settings
boolean visible = false
integer x = 2286
integer y = 1872
integer width = 251
integer height = 80
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Browse"
end type

event clicked;//string docname, named, path
//
//integer value
//
//value = GetFilesaveName("Select Directory and enter 'Path' as file name",&
//+ docname, named, "DOC", &
//	+ "text Files (*.txt),*.txt")
//
//
//IF value = 1 THEN
//	path = mid(docname,1,pos(docname,named,1) - 1)
//	dw_2.setitem(1,"intelliapp_app_path",path)
//END IF



string ls_path 

ls_path = f_browseforfolder('Please select a folder where you will be storing applications.' ,handle(parent))

if f_validstr(ls_path)  then 

dw_2.object.intelliapp_app_path[1] = ls_path  +"\"

end if

end event

type cb_brow2 from commandbutton within w_icred_settings
boolean visible = false
integer x = 2286
integer y = 1964
integer width = 251
integer height = 80
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Browse"
end type

event clicked;//string docname, named, path
//
//integer value
//
//value = GetFilesaveName("Select Directory and enter 'Path' as file name",&
//+ docname, named, "DOC", &
//	+ "text Files (*.txt),*.txt")
//
//
//IF value = 1 THEN
//	path = mid(docname,1,pos(docname,named,1) - 1)
//	dw_2.setitem(1,"imaging_path",path)
//END IF



string ls_path 

ls_path = f_browseforfolder('Please select a folder where you will be storing practitioner image files.' ,handle(parent))


if f_validstr(ls_path)  then 

dw_2.object.imaging_path[1] = ls_path  +"\"

end if


end event

type dw_2 from datawindow within w_icred_settings
boolean visible = false
integer x = 50
integer y = 1852
integer width = 2249
integer height = 488
integer taborder = 40
string dataobject = "d_util_paths"
boolean border = false
boolean livescroll = true
end type

event updateend;


GNV_app.of_set_contract_path(dw_2.object.contract_path[1] )
end event

type cb_other_set from commandbutton within w_icred_settings
integer x = 1477
integer y = 28
integer width = 453
integer height = 88
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Support Settings"
end type

event clicked;Open(w_utilities_support)

end event

type cb_2 from commandbutton within w_icred_settings
integer x = 2277
integer y = 28
integer width = 302
integer height = 88
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Close"
boolean cancel = true
end type

event clicked;gds_settings.retrieve()
close(parent)
end event

type cb_1 from commandbutton within w_icred_settings
integer x = 1952
integer y = 28
integer width = 302
integer height = 88
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Save"
end type

event clicked;//Start Code Change ---- 03.01.2006 #304 maha
of_pre_update()
//End Code Change---03.01.2006
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-01
//$<add> 04.03.2006 By: Liang QingShi
//$<reason> Performance tuning
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

gnv_appeondb.of_startqueue()
//---------------------------- APPEON END ----------------------------

//Begin - Added By Jay 2016-04-27.
String 	ls_workflow_user, ls_value
ls_workflow_user = dw_1.GetItemString ( dw_1.GetRow(), 'workflow_trigger_username' )
If IsNull ( ls_workflow_user ) Or Trim ( ls_workflow_user )  = '' Then
	ls_workflow_user = ''
End If
If ls_workflow_user <> is_workflow_user_ori Then
	gnv_user_option.of_set_option_value( 'webpage_approve_workflow_trigger_username', ls_workflow_user)
	gnv_user_option.of_system_save()
End If
//End - Added By Jay 2016-04-27.

//Begin - Added By Jay 2016-06-06
String 	ls_web_theme
ls_web_theme = dw_1.GetItemString ( dw_1.GetRow(), 'web_approve_page_theme' )
If IsNull ( ls_web_theme ) Or Trim ( ls_web_theme )  = '' Then
	ls_web_theme = ''
End If
If ls_web_theme <> is_web_theme_ori Then
	gnv_user_option.of_set_option_value( 'contractlogix-super-master','contract_web_approval_screen',ls_web_theme )
	gnv_user_option.of_save()
End If
//End - Added By Jay 2016-06-06

//Begin - Added By Gavin.Jay 2017-04-19
String 	ls_show_activate
ls_show_activate = dw_1.GetItemString ( dw_1.GetRow(), 'office_show_activate' )
If IsNull ( ls_show_activate ) Or Trim ( ls_show_activate )  = '' Then
	ls_show_activate = '0'
End If
If ls_show_activate <> is_show_activate_ori Then
	gnv_user_option.of_set_option_value( 'contractlogix-super-master','office_show_activate_buttons',ls_show_activate )
	gnv_user_option.of_save()
	is_show_activate_ori = ls_show_activate
End If
//End - Added By Gavin.Jay 2017-04-19

ls_value = dw_1.GetItemString ( dw_1.GetRow(), 'proxy_server' )
 gnv_user_option.of_set_option_value('contractlogix-super-master','email_proxy_server', ls_value )
ls_value = dw_1.GetItemString ( dw_1.GetRow(), 'proxy_port' )
 gnv_user_option.of_set_option_value('contractlogix-super-master','email_proxy_port', ls_value )
ls_value = dw_1.GetItemString ( dw_1.GetRow(), 'proxy_user' )
 gnv_user_option.of_set_option_value('contractlogix-super-master','email_proxy_user', ls_value )
ls_value = dw_1.GetItemString ( dw_1.GetRow(), 'proxy_pwd' )
gnv_user_option.of_set_option_value('contractlogix-super-master','email_proxy_password', ls_value )
ls_value = dw_1.GetItemString ( dw_1.GetRow(), 'proxy_protocol' )
 gnv_user_option.of_set_option_value('contractlogix-super-master','email_proxy_protocol', ls_value )

dw_1.update()
dw_2.update()
commit using sqlca;

dw_2.retrieve()

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-02
//$<add> 04.03.2006 By: Liang QingShi
//$<reason> Performance tuning
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

gds_settings.retrieve()
gnv_appeondb.of_commitqueue()
//---------------------------- APPEON END ----------------------------


of_synchronize_data() //Added By Ken.Guo 08.27.2008

gnv_data.of_retrieve("icred_settings")

//Added By Ken.Guo 2015-07-16
Integer li_value, li_showed
If ib_changed_safemode Then
	li_value = dw_1.GetItemNumber(1, 'set_word_safemode')
//	app_filler.of_set_word_safemode(False, li_value)
	Messagebox('Open MS Word in Safe Mode','This function requires that the client has read/write permission to the registry.' +&
					' When you modify this option, it will not take effect until you close all MS Word process on the client machine.'+&
					'~r~nWe suggest that you close CL and make sure all MS Word processes are closed and then restart CL to verify.')
	li_showed = 1
End If
If ib_changed_unload_addins Then
	li_value = dw_1.GetItemNumber(1, 'unload_word_addins')
	app_filler.inv_word_addins.of_set_word_unload_addins(li_value)
	If li_showed = 0 Then
		Messagebox('Do not load Com Add-ins when starting MS Word','This function requires that the client has read/write permission to the registry.' +&
						' When you modify this option, it will not take effect until you close all MS Word process on the client machine.'+&
						'~r~nWe suggest that you close CL and make sure all MS Word processes are closed and then restart CL to verify.')
	End If
End If

ib_changed_safemode = False
ib_changed_unload_addins = False

//Added By Jay Chen 07-20-2015
if ib_change_show_tip then
	Messagebox('Show screen field tips','This option will not take effect until you restart CL.')
	ib_change_show_tip = false
end if

//Added By Jay Chen 10-29-2015
if ib_change_filter_com then
//	Messagebox('Filter out Requested Companies and Contacts','This option will not take effect until you restart CL.')
	gnv_app.inv_dwcache.of_refresh("dddw_contact_company")
	gnv_app.inv_dwcache.of_refresh("dddw_contact_company_search")
	ib_change_filter_com = false
	//Added By Jay Chen 10-30-2015
	if IsValid(gw_Contract) then
		PowerObject lpo_NullParm
		gw_Contract.SetRedraw( false)
		Trigger Event ue_CloseContract()
		gf_OpenContractFolder(lpo_NullParm)
		Post Event ue_OpenContract()
	end if
	close(parent)
	//end
end if


end event

type dw_1 from datawindow within w_icred_settings
integer x = 46
integer y = 136
integer width = 2533
integer height = 2124
integer taborder = 10
string dataobject = "d_icred_set"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;Integer li_value
Integer li_ans
Integer li_access
Integer li_rec_cnt
Long ll_department
Integer ll_security_dept_code
String ls_user_id,	ls_cache_name, ls_msg


//Added By Ken.Guo 2010-08-18. Popup Warning Message and Set Default Group Template.
Long ll_default_id
DatawindowChild ldwc_group_templates
this.accepttext( )					//Added By Mark Lee 12/05/2012
dw_1.getChild('group_email_template',ldwc_group_templates)
Choose Case dwo.name
	Case 'email_alarm_type'
		If data = '2' Then //Group Email Alarm
			If Messagebox('Email Alarm Settings','If you change to Group Alarms that any Date Alarm Emails settings will not be used, but instead the Grouped Email Alarm Template message will be used. ~r~n~r~nAre you sure to make the big change?', Question!, Yesno!) = 2 Then
				This.Post SetItem(Row,'email_alarm_type',1)
			Else
				If Isnull(This.GetItemNumber(Row,'group_email_template') ) Then
					If ldwc_group_templates.RowCount() = 0 Then
						If Messagebox('Email Alarm Settings','There is no Group Email Alarm Template yet, do you want to create it now?', Question!, yesno!)  = 1 Then
							OpenWithParm(w_email_add,'Group_Add')
							If Message.Doubleparm > 0 Then
								ldwc_group_templates.SetTransObject(SQLCA)
								ldwc_group_templates.Retrieve()
								This.SetItem(Row,'group_email_template',Message.Doubleparm)
								This.Post SetColumn('group_email_template')
							End If
						End If
					Else
						Select email_id Into :ll_default_id from wf_email Where email_name = :gs_default_group_name;
						If ldwc_group_templates.Find('Email_id = ' + String(ll_default_id), 1,ldwc_group_templates.RowCount() ) > 0 Then
							This.SetItem(Row,'group_email_template',ll_default_id)
						Else
							Messagebox('Email Alarm Settings','Plase select a Group Email Alarm Template.')	
							This.Post SetColumn('group_email_template')
						End If
					End If
				End If
			End If				
		End If
		//Begin - Added By Mark Lee 08/09/12
	Case 'https'
		If data = '1' Then
			Messagebox('Access Alarm Settings','Please make sure ContractLogix web site supports HTTPS.~r~n If the web site doesn’t support HTTPS, ~r~n you will not be able to access the entire ContractLogix system any more.')	
		End If
		//End - Added By Mark Lee 08/09/12
	//Begin - Added By Mark Lee 11/05/2012
	Case 'set_56'
		If data = '1' Then
			this.event buttonclicked( row,0, this.object.b_email_setting)
		End If
	//End - Added By Mark Lee 11/05/2012		
	case "use_web_email"
		//Added By Mark Lee 08/30/2013
//		ls_msg = "To send emails with the current method, you need to make sure the sender’s email account has email address configured etc." + &
//					"~r~n~r~nNote: This method doesn’t support sending emails with Outlook."
		//Modified By Jay Chen 10-09-2014
		ls_msg = "To send emails with the current method, you need to make sure the sender’s email account has email address configured etc." 
		If data = '1' Then
			Messagebox('Use the Web Service to Send Emails Settings',ls_msg)	
			ls_msg = ""
			//Added By Mark Lee 03/13/2014
			ls_cache_name = this.getItemString( row, 'cache_name')
			if isnull(ls_cache_name) or trim(ls_cache_name) = '' then 		
				if AppeonGetClientType() = 'WEB' then 
					if not isnull(gs_cachename) and trim(gs_cachename) <> ""  then 
						this.setItem( row, 'cache_name', gs_cachename)
					else
						ls_msg = "The current system does not have the DB Cache Name setting. " +  &
							"~r~nPlease go to System -> Utilities -> Web Link Settings to set the Cache Name." + &
							"~r~n~r~nDo you want to open it now?"
					end if 
					
					if len(ls_msg) >  0 then 
						if Messagebox('Use the Web Service to Send Emails Settings',ls_msg , Question!, yesno!) = 1 then 
							Open(w_weblink_settings)	
							// refresh the data, if not will be lose the update data.
							ls_cache_name = gnv_data.of_getitem( 'icred_settings', 'cache_name', False )
							if not isnull(ls_cache_name) and trim(ls_cache_name) <> "" then 
								this.setItem( row, 'cache_name', ls_cache_name)
							end if 
						end if 
					end if 
				else
					// PB
					ls_msg = "The current system does not have the DB Cache Name setting. " +  &
								"~r~nPlease go to System -> Utilities -> Web Link Settings to set the Cache Name."
					Messagebox('Use the Web Service to Send Emails Settings',ls_msg)									
				end if 
			end if 
		end if		
	Case ''
End Choose

//Modified By Mark Lee 12/05/2012
//IF This.GetColumnName() = "set_10" THEN
//	gi_test_mode = this.getitemnumber(1,'set_10')
//end if
//
//IF This.GetColumnName() = "set_29" THEN
//	gi_scan_format = this.getitemnumber(1,'set_29')
//end if
//
////Start Code Change ----10.08.2008 #V85 maha
//IF This.GetColumnName() = "set_56" THEN
//	gi_email_type = this.getitemnumber(1,'set_56')
//end if
////End Code Change---10.08.2008


//changing to department security setting
IF This.GetColumnName() = "set_37" THEN
	li_value = Integer( data )
	IF li_value = 1 THEN
		of_dept_security( ) //maha 012606 changed to function
		
//		SELECT Count( user_id )
//		INTO :li_rec_cnt
//		FROM security_user_department;
//		IF SQLCA.SQLCODE = -1 THEN
//			MessageBox( "SQL Error", SQLCA.SQLERRTEXT )
//			RETURN -1
//		END IF
//	
//		IF li_rec_cnt > 0 THEN
//			li_ans = MessageBox( "Data Exists", "There seems to be data allready in the security_department_table.  Do you want to delete and recreate table?", StopSign!, YesNo!, 2 )
//			IF li_ans = 2 THEN
//				RETURN -1
//			END IF
//		END IF
//	
//		DELETE 
//		FROM security_user_department;
//		IF SQLCA.SQLCODE = -1 THEN
//			MessageBox( "SQL Error", SQLCA.SQLERRTEXT )
//			RETURN -1
//		END IF
//		
//		li_ans = MessageBox( "Department Security", "Are you sure you want to turn the department security feature on?",  StopSign!, YesNo!, 1 )
//		//if going to turn on then need to scan through departments and create user department security table
//		IF li_ans = 1 THEN
//			Integer li_dept_cnt
//			Integer li_user_cnt
//			Integer d
//			Integer u
//			
//			li_ans = MessageBox("Access", "Would you like the default access for all departments to be turned on?", Question!, YesNo!, 1 )
//
//			IF li_ans = 1 THEN
//				li_access = 1
//			ELSE
//				li_access = 0
//			END IF
//			
//			IF li_access = 0 THEN
//				li_ans = MessageBox( "No Access", "When your users login they will have no access to physician data until you go to the User Painter and Grant access to specific departments for each user.", StopSign!, OkCancel!, 1 )
//				IF li_ans = 2 THEN
//					RETURN -1
//				END IF
//			END IF
//			
//			dw_departments.SetTransObject( SQLCA )
//			dw_departments.Retrieve( )
//			li_dept_cnt = dw_departments.RowCount( )
//			dw_users.SetTransObject( SQLCA )
//			dw_users.Retrieve( )
//			li_user_cnt = dw_users.RowCount( )
//			
//			//Loop through all users and department and setup department security
//			FOR u = 1 TO li_user_cnt
//				ls_user_id = dw_users.GetItemString( u, "user_id" )
//				FOR d = 1 TO li_dept_cnt
//					ll_security_dept_code ++
//					ll_department = dw_departments.GetItemNumber( d, "lookup_code" )
//					
//					INSERT INTO security_user_department  
//		         ( user_depart_id,   
//      		     user_id,   
//		           department_id,   
//      		     access_rights )  
//				   VALUES ( :ll_security_dept_code,   
//				            :ls_user_id,   
//				            :ll_department,   
//					         :li_access )  ;
//					IF SQLCA.SQLCODE = -1 THEN
//						MessageBox( "SQL Error", SQLCA.SQLERRTEXT )
//						RETURN -1
//					END IF
//				END FOR
//			END FOR
//			COMMIT USING SQLCA;
//			
//		END IF
//		
//		MessageBox( "Department Security", "Department Security table created.  Go to System->Painters->User Painter to edit access." )
//		
	ELSE
		
	END IF
end if

end event

event retrieveend;//////////////////////////////////////////////////////////////////////
// $<event>  RetrieveEnd()
// $<arguments> long RowCount
// $<returns>   Long
// $<description> Refresh Download URL text
//////////////////////////////////////////////////////////////////////
// $<add> 2008-11-13 by Scofield
//////////////////////////////////////////////////////////////////////

String	ls_DownLoadURL
long		ll_Row

ll_Row = This.RowCount()
if ll_Row <= 0 or ll_Row > this.RowCount() then Return

ls_DownLoadURL = This.GetItemString(ll_Row,"DownloadURL")
if IsNull(ls_DownLoadURL) then Return

sle_DownLoadURL.Text = ls_DownLoadURL

end event

event buttonclicked;If dwo.name = 'b_group_help' Then
	Messagebox('Email Alarm Output Type Help',+&
	'One per Alarm: '+&
	'~r~nIt will create a separate email for each Date Alarm. ~r~n' + &
	'~r~nGroup Alarms into Single Email: '+&
	'~r~nIt will create a single email to each user, and it will put a list of date alarms within the body of email. ')
End If


If dwo.name = 'b_pdfway' Then
	Messagebox('PDF Engine Help',+&
		"Engine 1: No need to install PDF printer.~r~n" + & 
		"Engine 2: Need to install PDF printer but with high definition.")
End If

//Added By Mark Lee 11/05/2012
If dwo.name = 'b_email_setting' Then
	Messagebox('Email Sending Help',+&
		"Easymail: Need to register emsmtp.dll file (default).~r~n" + & 
		"Outlook: Only support plain text email content.~r~n                Security warning message will pop up when sending emails.")
End If

//Added By Jay Chen 03-19-2014
If dwo.name = 'b_mergedata' Then
	Messagebox('Optimize Document Merge Function Help',+&
		"Yes: When the system performs document merge, it will analyze the merge fields used in the document and then only retrieve the fields that are needed using the corresponding export.~r~n" + & 
		"No: When the system performs document merge, it directly retrieve all fields defined in the corresponding export for the current contract.")
End If

//Added By Ken.Guo 2015-07-15
Choose Case dwo.name
	Case 'b_set_word_safemode'
		Messagebox('Option Descriptions',+&
		'Yes: After CL starts, the client machine will use Safe Mode to open Word documents until you exit CL. We suggest that you try this option if CL fails to run due to some MS Word settings.~r~n' + & 
		'No: CL will not modify client machine’s MS Word Safe Mode.')
	Case 'b_unload_word_addins'
		Messagebox('Option Descriptions',+&
		'Yes: After CL starts, the client machine will not load any Com Add-ins to open Word documents until you exit CL. This is mainly used to work around  the issue where some Word Add-ins causing problem with running CL. ~r~n' + & 
		'No: CL will not modify client machine’s MS Word Com Add-ins status.~r~n~r~n' + & 
		'Note: If CL fails to restore the Com Add-ins status or the user fails to set Com Add-ins status in MS Word, you can manually set each Com Add-ins status from System -> Personal Settings ->Manage Com Add-ins of MS  Word.')
	Case 'b_notify_user_dm' //Added By Ken.Guo 2016-04-05
		Messagebox('Help','Prompt the user when the same document is opened and being edited by another user  in Document Manager. This function only works for doc, docx, xls, xlsx, tif and tiff documents.')
End Choose



end event

type gb_1 from groupbox within w_icred_settings
integer x = 41
integer y = 2264
integer width = 2542
integer height = 188
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "Program Paths"
end type

