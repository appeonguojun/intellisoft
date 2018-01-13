$PBExportHeader$w_email_account_edit_for_outlook.srw
forward
global type w_email_account_edit_for_outlook from window
end type
type cb_help from commandbutton within w_email_account_edit_for_outlook
end type
type dw_sysaddr from datawindow within w_email_account_edit_for_outlook
end type
type cb_test from commandbutton within w_email_account_edit_for_outlook
end type
type dw_detail from datawindow within w_email_account_edit_for_outlook
end type
type dw_browse from datawindow within w_email_account_edit_for_outlook
end type
type cb_save from commandbutton within w_email_account_edit_for_outlook
end type
type cb_close from commandbutton within w_email_account_edit_for_outlook
end type
type cb_add from commandbutton within w_email_account_edit_for_outlook
end type
type cb_del from commandbutton within w_email_account_edit_for_outlook
end type
type tv_user from treeview within w_email_account_edit_for_outlook
end type
end forward

global type w_email_account_edit_for_outlook from window
integer width = 2309
integer height = 1328
boolean titlebar = true
string title = "Account Maintenance"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_help cb_help
dw_sysaddr dw_sysaddr
cb_test cb_test
dw_detail dw_detail
dw_browse dw_browse
cb_save cb_save
cb_close cb_close
cb_add cb_add
cb_del cb_del
tv_user tv_user
end type
global w_email_account_edit_for_outlook w_email_account_edit_for_outlook

type variables
string is_Type
string is_UserID
string is_ErrInfo
DataStore ids_User
TreeViewItem itvi_User
boolean ib_DoFilter = true
end variables

forward prototypes
public function integer of_createusertree (string as_userid)
public function integer of_setdefault (long al_currentrow)
public function integer of_findusertreeitem (string as_userid)
public function integer of_filter (string as_userid)
public function integer of_changeuserid (long al_row, string as_olduserid, string as_newuserid)
public function integer of_setrefemail (string as_userid, string as_email)
end prototypes

public function integer of_createusertree (string as_userid);long i, ll_Root
TreeViewItem ltvi_Item

// Get user information
ids_User = Create DataStore
ids_User.DataObject = "d_email_users"
ids_User.SetTransObject(SQLCA)
ids_User.Retrieve()
if Len(as_UserID) > 0 then
	ids_User.SetFilter("user_id = '" + as_UserID + "'")
	ids_User.Filter()
end if

// Get user tree from Ds
ltvi_Item.Label = "User"
ltvi_Item.Data = ""
ltvi_Item.PictureIndex = 1
ltvi_Item.SelectedPictureIndex = 1
ll_Root = tv_user.InsertItemLast(0, ltvi_Item)

for i = 1 to ids_User.RowCount()
	ltvi_Item.Label = ids_User.GetItemString(i, "user_id")
	ltvi_Item.Data = ltvi_Item.Label
	ltvi_Item.PictureIndex = 2
	ltvi_Item.SelectedPictureIndex = 3
	tv_user.InsertItemLast(ll_Root, ltvi_Item)
next
tv_user.ExpandAll(ll_Root)

Return 1
end function

public function integer of_setdefault (long al_currentrow);long ll_Start
long i, ll_End
string ls_UserID

if dw_detail.RowCount() = 1 then Return 1
ls_UserID = dw_detail.GetItemString(al_CurrentRow, "user_id")

ll_Start = 1
ll_End = al_CurrentRow - 1
if ll_End >= ll_Start then
	for i = ll_End to ll_Start step -1
		if dw_detail.GetItemString(i, "user_id") <> ls_UserID then
			Exit
		else
			dw_detail.SetItem(i, "is_default", "N")
		end if	
	next
end if

ll_Start = al_CurrentRow + 1
ll_End = dw_detail.RowCount()
for i = ll_Start to ll_End	
	if dw_detail.GetItemString(i, "user_id") <> ls_UserID then
		Exit
	else
		dw_detail.SetItem(i, "is_default", "N")
	end if	
next

dw_detail.SetItem(al_CurrentRow, "is_default", "Y")
of_SetRefEmail(ls_UserID, dw_detail.object.email[al_CurrentRow])

Return 1
end function

public function integer of_findusertreeitem (string as_userid);long ll_Handle
TreeViewItem ltvi_User

ll_Handle = tv_user.FindItem(RootTreeItem!, 0)
ll_Handle = tv_user.FindItem(ChildTreeItem!, ll_Handle)
tv_user.GetItem(ll_Handle, ltvi_User)
if String(ltvi_User.Data) = as_UserID then		
	Return ll_Handle
end if

do while ll_Handle > 0
	ll_Handle = tv_user.FindItem(NextTreeItem!, ll_Handle)
	tv_user.GetItem(ll_Handle, ltvi_User)
	if String(ltvi_User.Data) = as_UserID then		
		Return ll_Handle
	end if
loop

Return -1
end function

public function integer of_filter (string as_userid);if Len(as_UserID) > 0 then
	dw_browse.SetFilter("user_id = '" + as_UserID + "'")
else
	dw_browse.SetFilter("")
end if

dw_browse.Filter()
dw_browse.SetRow(1)
dw_browse.Event RowFocusChanged(1)

Return 1
end function

public function integer of_changeuserid (long al_row, string as_olduserid, string as_newuserid);long ll_Handle
long ll_FindRow
string ls_Default
string ls_UserFlag = "$USERID$"
boolean lb_ResetDefault = true

ll_Handle = of_FindUserTreeItem(as_NewUserID)
if ll_Handle <= 0 then Return -1

// Reset default
if dw_browse.GetItemString(al_Row, "is_default") = "Y" then
	if al_Row - 1 > 0 then
		if dw_browse.GetItemString(al_Row - 1, "user_id") = as_OldUserID then
			dw_browse.SetItem(al_Row - 1, "is_default", "Y")
			of_SetRefEmail(as_OldUserID, dw_browse.object.email[al_Row - 1])
			lb_ResetDefault = false
		end if
	end if
	if al_Row + 1 <= dw_browse.RowCount() and lb_ResetDefault then
		if dw_browse.GetItemString(al_Row + 1, "user_id") = as_OldUserID then
			dw_browse.SetItem(al_Row + 1, "is_default", "Y")
			of_SetRefEmail(as_OldUserID, dw_browse.object.email[al_Row + 1])
		end if
	end if
	if dw_browse.RowCount() = 1 then
		of_SetRefEmail(as_OldUserID, "")
	end if
end if

// Determine default value
dw_browse.SetItem(al_Row, "user_id", ls_UserFlag)
dw_browse.SetFilter("user_id = '" + as_NewUserID + "' OR user_id = '" + ls_UserFlag + "'")
dw_browse.Filter()
if dw_browse.RowCount() > 1 then
	ls_Default = "N"
else
	ls_Default = "Y"
end if

// Reset user_id and is_default
ll_FindRow = dw_browse.Find("user_id = '" + ls_UserFlag + "'", 1, dw_browse.RowCount())
if ll_FindRow > 0 then
	dw_browse.SetItem(ll_FindRow, "user_id", as_NewUserID)
	dw_browse.SetItem(ll_FindRow, "is_default", ls_Default)
	if ls_Default = "Y" then
		of_SetRefEmail(as_NewUserID, dw_browse.object.email[ll_FindRow])
	end if
	dw_browse.ScrollToRow(ll_FindRow)
	dw_browse.Event RowFocusChanged(ll_FindRow)
end if

// Refresh data
ib_DoFilter = false
tv_user.SelectItem(ll_Handle)
ib_DoFilter = true

Return 1
end function

public function integer of_setrefemail (string as_userid, string as_email);long ll_FindRow

ll_FindRow = ids_User.Find("user_id = '" + as_UserID + "'", 1, ids_User.RowCount())
if ll_FindRow > 0 then
	ids_User.SetItem(ll_FindRow, "email_id", as_Email)
end if

Return 1
end function

on w_email_account_edit_for_outlook.create
this.cb_help=create cb_help
this.dw_sysaddr=create dw_sysaddr
this.cb_test=create cb_test
this.dw_detail=create dw_detail
this.dw_browse=create dw_browse
this.cb_save=create cb_save
this.cb_close=create cb_close
this.cb_add=create cb_add
this.cb_del=create cb_del
this.tv_user=create tv_user
this.Control[]={this.cb_help,&
this.dw_sysaddr,&
this.cb_test,&
this.dw_detail,&
this.dw_browse,&
this.cb_save,&
this.cb_close,&
this.cb_add,&
this.cb_del,&
this.tv_user}
end on

on w_email_account_edit_for_outlook.destroy
destroy(this.cb_help)
destroy(this.dw_sysaddr)
destroy(this.cb_test)
destroy(this.dw_detail)
destroy(this.dw_browse)
destroy(this.cb_save)
destroy(this.cb_close)
destroy(this.cb_add)
destroy(this.cb_del)
destroy(this.tv_user)
end on

event open;long 		ll_Handle,ll_LeftIndent,ll_TopIndent
integer 	li_Pos

// Get window message (Format: TYPE|USERID)
li_Pos = Pos(Message.StringParm, "|")
is_Type = Left(Message.StringParm, li_Pos - 1)
is_UserID = Right(Message.StringParm, Len(Message.StringParm) - li_Pos)

//Begin - Added By Mark Lee 01/09/2014
if gnv_data.of_getItem("icred_settings", "set_56", False) = '1'  then 
	dw_sysaddr.Visible = false
end if 
//End - Added By Mark Lee 01/09/2014

// Create user tree
choose case is_Type
	case "ALL"
		this.Title = "Email Account Maintenance (ALL)"
		of_CreateUserTree("")
		
	case "PERSONAL"
		this.Title = "Email Account Maintenance (" + is_UserID + ")"
		of_CreateUserTree(is_UserID)		
		of_Filter(is_UserID)
		//--------------------------- APPEON BEGIN ---------------------------
		//$< Add  > 2008-01-09 By: Scofield
		//$<Reason> Adjust the interface's appearance.

		tv_user.Visible = false
		dw_sysaddr.Visible = false
		This.Width = This.Width - tv_user.Width + 9
		ll_LeftIndent = tv_user.Width + 9
		dw_browse.x = dw_browse.x - ll_LeftIndent
		dw_detail.x = dw_detail.x - ll_LeftIndent
		cb_test.x = cb_test.x - ll_LeftIndent + 100
		cb_add.x = cb_add.x - ll_LeftIndent
		cb_del.x = cb_del.x - ll_LeftIndent
		cb_save.x = cb_save.x - ll_LeftIndent
		cb_close.x = cb_close.x - ll_LeftIndent
		cb_help.x = cb_help.x - ll_LeftIndent //Add by Evan on 05/05/2008
		
		ll_TopIndent = 250
		This.Height = This.Height - ll_TopIndent
		dw_browse.Height = dw_browse.Height - ll_TopIndent
		dw_detail.y = dw_detail.y - ll_TopIndent
		cb_test.y = cb_test.y - ll_TopIndent
		cb_add.y = cb_add.y - ll_TopIndent
		cb_del.y = cb_del.y - ll_TopIndent
		cb_save.y = cb_save.y - ll_TopIndent
		cb_close.y = cb_close.y - ll_TopIndent
		cb_help.y = cb_help.y - ll_TopIndent //Add by Evan on 05/05/2008
		//---------------------------- APPEON END ----------------------------
	case else
end choose

// Locate specify user
ll_Handle = of_FindUserTreeItem(is_UserID)
tv_user.SelectItem(ll_Handle)

dw_detail.object.user_id.protect = 1
dw_detail.object.user_id.background.color = dw_detail.Object.DataWindow.Color

gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17


end event

event closequery;dw_detail.AcceptText()
if dw_browse.ModifiedCount() + dw_browse.DeletedCount() + dw_sysaddr.ModifiedCount() > 0 then
	if MessageBox("Save data", "Close without saving changes?", Question!, YesNo!) = 2 then Return 1
end if
end event

event close;if IsValid(ids_User) then Destroy ids_User
end event

type cb_help from commandbutton within w_email_account_edit_for_outlook
integer x = 581
integer y = 1404
integer width = 311
integer height = 92
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Help"
end type

event clicked;Open(w_email_help)
end event

type dw_sysaddr from datawindow within w_email_account_edit_for_outlook
boolean visible = false
integer y = 1116
integer width = 965
integer height = 92
integer taborder = 40
string title = "none"
string dataobject = "d_email_pub_addresser"
boolean border = false
boolean livescroll = true
end type

event constructor;DataWindowChild ldwc_Child

this.SetTransObject(SQLCA)
this.Retrieve()

this.GetChild("set_addresser", ldwc_Child)
ldwc_Child.InsertRow(1)

end event

event buttonclicked;if dwo.name = "b_send_help" then		//Added By Mark Lee 01/09/2014
	Messagebox(gnv_app.iapp_object.DisplayName,"When set to All, the system will use the defined profile (System Addresser) to send every email." + &
		"~r~nWhen set to Date Alarm (Default), the system will only use the defined profile (System Addresser) to send Date Alarms.")
		//+ & 		"~r~n~r~nNote: When the system email sending method is Outlook, this setting doesn’t apply." 	
end if
end event

type cb_test from commandbutton within w_email_account_edit_for_outlook
boolean visible = false
integer x = 594
integer y = 1408
integer width = 448
integer height = 92
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Send &test Email "
end type

event clicked;//String	ls_Server,ls_Account,ls_Password,ls_Email
//long		ll_Row,ll_Port,ll_AuthMode,ll_Return
//
//n_cst_easymail_smtp 	lnv_Mail
//
//ll_Row = dw_detail.GetRow()
//if ll_Row <= 0 or ll_Row > dw_detail.RowCount() then return
//
//dw_detail.AcceptText()
//ls_Server = dw_detail.GetItemString(ll_Row,'Server')
//ll_Port = dw_detail.GetItemNumber(ll_Row,'Port')
//ll_AuthMode = dw_detail.GetItemNumber(ll_Row,'AuthMode')
//ls_Account = dw_detail.GetItemString(ll_Row,'Account')
//ls_Password = dw_detail.GetItemString(ll_Row,'Password')
//ls_Email = dw_detail.GetItemString(ll_Row,'Email')
//
//if IsNull(ls_Server) or Trim(ls_Server) = '' then
//	MessageBox(gnv_app.iapp_object.DisplayName,'SMTP Server address can not be null.')
//	dw_detail.SetColumn('Server')
//	dw_detail.SetFocus()
//	return
//end if
//
//if IsNull(ll_Port) then
//	MessageBox(gnv_app.iapp_object.DisplayName,'SMTP Server port can not be null.')
//	dw_detail.SetColumn('Port')
//	dw_detail.SetFocus()
//	return
//end if
//
//if IsNull(ll_AuthMode) then
//	MessageBox(gnv_app.iapp_object.DisplayName,'SMTP Server Secure Password Authentication can not be null.')
//	dw_detail.SetColumn('AuthMode')
//	dw_detail.SetFocus()
//	return
//end if
//
////BEGIN---Modify by Evan on 06/05/2008
//if ll_AuthMode = 1 then
//	if IsNull(ls_Account) or Trim(ls_Account) = '' then
//		MessageBox(gnv_app.iapp_object.DisplayName,'EMail Account can not be null.')
//		dw_detail.SetColumn('Account')
//		dw_detail.SetFocus()
//		return
//	end if
//end if
///*
//if IsNull(ls_Password) then
//	MessageBox(gnv_app.iapp_object.DisplayName,'EMail Password can not be null.')
//	dw_detail.SetColumn('Password')
//	dw_detail.SetFocus()
//	return
//end if
//*/
////END---Modify by Evan on 06/05/2008
//
//if IsNull(ls_Email) or Trim(ls_Email) = '' then
//	MessageBox(gnv_app.iapp_object.DisplayName,'EMail Address can not be null.')
//	dw_detail.SetColumn('Email')
//	dw_detail.SetFocus()
//	return
//end if
//
//if lnv_Mail.of_CreateObject() = -1 then
//	//Added by Nova.zhang on 2008-11-07
//	f_show_message('create Email object','','','','')
//	//MessageBox("Error", "Failed to create Email object!",StopSign!)
//	dw_detail.SetColumn('Server')
//	dw_detail.SetFocus()
//	Return
//end if
//
//Integer li_smtp_ssl
//lnv_Mail.of_SetSmtpInfo(ls_Server, ll_Port, ll_AuthMode,li_smtp_ssl)
//lnv_Mail.of_SetAccountAddress(ls_Account, ls_Password, ls_Email)
//
////Send EMail
//ll_Return = lnv_Mail.of_SendText(ls_Email, '', '','Test Mail', 'Hello,This is a test Mail', '')
//
//if ll_Return = 0 then
//	MessageBox("Congratulation", "Email test is Successfull!")
//else
//	//Added by Nova.zhang on 2008-11-07
//	f_show_message('error_code_'+string(ll_Return),'%1S%',String(ll_Return),'','')
//	//MessageBox("Error Code: " + String(ll_Return), "Email test is Failed!~r~n~r~n" + lnv_Mail.of_GeteMailError(ll_Return),Exclamation!)
//end if
//
//lnv_Mail.of_DeleteObject()
//
end event

type dw_detail from datawindow within w_email_account_edit_for_outlook
event ue_keydown pbm_dwnkey
integer x = 663
integer y = 872
integer width = 1609
integer height = 220
integer taborder = 30
string title = "none"
string dataobject = "d_email_detail_outlook"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event ue_keydown;if Key = KeyDownArrow! or Key = KeyUpArrow! or Key = KeyPageUp! or Key = KeyPageDown! then 
	Return 1
else
	Return 0
end if
end event

event itemerror;Return 1
end event

event itemchanged;string ls_OldUserID

choose case dwo.name
	case "is_default"
		if this.object.is_default[row] = "Y" and Data = "N" then
			Return 2
		else
			of_SetDefault(Row)
		end if
		
	case "user_id"
		ls_OldUserID = this.object.user_id[row]
		Post of_ChangeUserID(Row, ls_OldUserID, Data)
		
	case "email"
		if this.object.is_default[row] = "Y" then
			of_SetRefEmail(this.object.user_id[row], Data)
		end if
end choose

Return 0
end event

event buttonclicked;if dwo.name = "b_test" then // Add by Evan on 2008-03-24
	cb_test.Event Clicked()
end if
end event

event other;if Message.Number = 522 then // Add by Evan on 2008-03-24
	Return 1
end if
end event

type dw_browse from datawindow within w_email_account_edit_for_outlook
integer x = 663
integer y = 12
integer width = 1609
integer height = 844
integer taborder = 20
string title = "none"
string dataobject = "d_email_browse_outlook"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.SetTransObject(SQLCA)
this.Retrieve()
dw_browse.ShareData(dw_detail)
end event

event rowfocuschanged;this.SelectRow(0, false)
this.SelectRow(CurrentRow, true)
dw_detail.ScrollToRow(CurrentRow)
end event

event dberror;is_ErrInfo = SQLErrText
Return 1
end event

type cb_save from commandbutton within w_email_account_edit_for_outlook
integer x = 1490
integer y = 1120
integer width = 357
integer height = 92
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Save"
boolean default = true
end type

event clicked;boolean 	lb_AutoCommit
String	ls_UserId
long		ll_Row

if dw_sysaddr.ModifiedCount() > 0 then
	dw_sysaddr.Update()
end if

if dw_detail.AcceptText() = -1 then Return
if dw_browse.ModifiedCount() + dw_browse.DeletedCount() <= 0 then Return

//--------------------------- APPEON BEGIN ---------------------------
//$< Add  > 2008-01-09 By: Scofield
//$<Reason> Add verify.
ll_Row = dw_detail.GetRow()
if ll_Row <= 0 or ll_Row > dw_detail.RowCount() then return

ls_UserId = dw_detail.GetItemString(ll_Row,'user_id')

if IsNull(ls_UserId) or Trim(ls_UserId) = '' then
	MessageBox(gnv_app.iapp_object.DisplayName,'User id can not be null.')
	dw_detail.SetColumn('user_id')
	dw_detail.SetFocus()
	return
end if
//---------------------------- APPEON END ----------------------------

if dw_browse.Update() = 1 and ids_User.Update() = 1 then
	Commit;
else
	Rollback;
	MessageBox("Error", is_ErrInfo, StopSign!)
end if

dw_detail.object.user_id.protect = 1
dw_detail.object.user_id.background.color = dw_detail.Object.DataWindow.Color

end event

type cb_close from commandbutton within w_email_account_edit_for_outlook
integer x = 1879
integer y = 1120
integer width = 357
integer height = 92
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Close"
boolean cancel = true
end type

event clicked;Close(Parent)
end event

type cb_add from commandbutton within w_email_account_edit_for_outlook
boolean visible = false
integer x = 992
integer y = 1116
integer width = 311
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Add"
end type

event clicked;long ll_FindRow
long ll_InsertRow
string ls_UserID
string ls_Email

// Insert row
dw_detail.AcceptText()
ll_InsertRow = dw_browse.InsertRow(0)

// Set init value
dw_browse.SetItem(ll_InsertRow, "port", 25)
dw_browse.SetItem(ll_InsertRow, "authmode", 1)
if is_Type = "ALL" then
	if Len(String(itvi_User.Data)) > 0 then
		dw_browse.SetItem(ll_InsertRow, "user_id", String(itvi_User.Data))
	else
		dw_browse.SetItem(ll_InsertRow, "user_id", "MASTER")
	end if

	dw_detail.object.user_id.protect = 0
	dw_detail.object.user_id.background.color = RGB(255,255,255)
else
	dw_browse.SetItem(ll_InsertRow, "user_id", is_UserID)
end if
ls_UserID = dw_browse.GetItemString(ll_InsertRow, "user_id")
dw_browse.SetItem(ll_InsertRow, "account", ls_UserID)
ls_Email = ls_UserID + "@"
dw_browse.SetItem(ll_InsertRow, "email", ls_Email)

// Set default
ll_FindRow = dw_browse.Find("user_id='" + ls_UserID + "' and is_default='Y'", 1, dw_browse.RowCount())
if ll_FindRow <= 0 then
	dw_browse.SetItem(ll_InsertRow, "is_default", "Y")
	of_SetRefEmail(ls_UserID, ls_Email)
else
	dw_browse.SetItem(ll_InsertRow, "is_default", "N")
end if

dw_browse.ScrollToRow(ll_InsertRow)
dw_detail.SetColumn("user_id")
dw_detail.SetFocus()
end event

type cb_del from commandbutton within w_email_account_edit_for_outlook
boolean visible = false
integer x = 1312
integer y = 1116
integer width = 311
integer height = 92
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Delete"
end type

event clicked;long ll_FindRow
long ll_DefaultRow
string ls_UserID

if dw_browse.GetRow() <= 0 then Return
if MessageBox("Delete", "Are you sure you want to delete the selected record?", Question!, YesNo!) = 2 then
	Return
end if	

// Delete row
ls_UserID = dw_browse.GetItemString(dw_browse.GetRow(), "user_id")
dw_browse.DeleteRow(0)
dw_browse.Event RowFocusChanged(dw_browse.GetRow())

// Set default
ll_FindRow = dw_browse.Find("user_id='" + ls_UserID + "'", 1, dw_browse.RowCount())
if ll_FindRow > 0 then
	ll_DefaultRow = dw_browse.Find("user_id='" + ls_UserID + "' and is_default='Y'", 1, dw_browse.RowCount())
	if ll_DefaultRow <= 0 then
		dw_browse.SetItem(ll_FindRow, "is_default", "Y")
		of_SetRefEmail(ls_UserID, dw_browse.object.email[ll_FindRow])
	end if
else
	of_SetRefEmail(ls_UserID, "")
end if
end event

type tv_user from treeview within w_email_account_edit_for_outlook
integer x = 9
integer y = 12
integer width = 645
integer height = 1080
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
boolean linesatroot = true
string picturename[] = {"Library!","Custom076!","Custom026!"}
long picturemaskcolor = 12632256
long statepicturemaskcolor = 536870912
end type

event selectionchanged;long i, ll_RowCount

// Get current item
dw_detail.AcceptText()
this.GetItem(NewHandle, itvi_User)

// Filter specify user accounts
if ib_DoFilter and is_Type = "ALL" then
	of_Filter(String(itvi_User.Data))
end if
end event

