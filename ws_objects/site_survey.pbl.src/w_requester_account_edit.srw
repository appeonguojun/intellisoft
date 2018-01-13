$PBExportHeader$w_requester_account_edit.srw
forward
global type w_requester_account_edit from w_response
end type
type cb_reset from u_cb within w_requester_account_edit
end type
type cb_generate from u_cb within w_requester_account_edit
end type
type cb_save from u_cb within w_requester_account_edit
end type
type cb_close from u_cb within w_requester_account_edit
end type
type cb_delete from u_cb within w_requester_account_edit
end type
type dw_1 from u_dw within w_requester_account_edit
end type
type tv_requester from treeview within w_requester_account_edit
end type
end forward

global type w_requester_account_edit from w_response
string tag = "Requester Account"
integer width = 3566
integer height = 1448
string title = "Requester Account"
string icon = "AppIcon!"
cb_reset cb_reset
cb_generate cb_generate
cb_save cb_save
cb_close cb_close
cb_delete cb_delete
dw_1 dw_1
tv_requester tv_requester
end type
global w_requester_account_edit w_requester_account_edit

type variables
string is_Type
string is_UserID
n_ds 	ids_user_requester
TreeViewItem itvi_user_requester

n_cst_encrypt in_Encrypt

boolean ib_click_save = false //Added By Jay Chen 11-26-2015
boolean ib_update1,ib_update2,ib_update3,ib_update4,ib_update5
end variables

forward prototypes
public function integer of_createtree (string as_userid)
public function integer of_filter (string as_userid)
public function string of_generate_codecheck (string as_arg)
public function integer of_findusertreeitem (string as_userid)
public function integer of_generate_requester_url ()
public function integer of_advancedsecurity ()
end prototypes

public function integer of_createtree (string as_userid);long i, ll_Root, ll_Handle
TreeViewItem ltvi_Item, ltvi_select

// Get user information
if not isvalid(ids_user_requester) then 
	ids_user_requester = Create n_ds
	ids_user_requester.DataObject = "d_user_requester"
	ids_user_requester.SetTransObject(SQLCA)
end if 
ids_user_requester.reset( )
ids_user_requester.Retrieve()

ltvi_Item.label = "Requester Account"
ltvi_Item.data = ""
ltvi_Item.pictureindex = 1
ltvi_Item.selectedpictureindex = 1
ll_Root = tv_requester.insertitemlast( 0, ltvi_Item)

for i = 1 to ids_user_requester.rowcount( )
	ltvi_Item.label = ids_user_requester.Getitemstring( i, "user_id")
	ltvi_Item.data = ltvi_Item.label
	ltvi_Item.pictureindex = 2
	ltvi_Item.selectedpictureindex = 3
	tv_requester.insertitemlast( ll_Root ,ltvi_Item)
next
tv_requester.expandall( ll_Root)

if isnull(as_userid) or trim(as_userid) = "" then 
	if ids_user_requester.rowcount() > 0 then 
		ll_Handle = of_findusertreeitem( ids_user_requester.Getitemstring(1, "user_id"))
		if ll_Handle > 0 then
			tv_requester.SelectItem(ll_Handle)
		end if 
	end if 
else
	ll_Handle = of_findusertreeitem(as_userid)
	tv_requester.SelectItem(ll_Handle)
end if 

return 1
end function

public function integer of_filter (string as_userid);if Len(as_UserID) > 0 then
	dw_1.SetFilter("user_id = '" + as_UserID + "'")
else
	dw_1.SetFilter("")
end if

dw_1.Filter()
dw_1.SetRow(1)
dw_1.Event RowFocusChanged(1)

Return 1
end function

public function string of_generate_codecheck (string as_arg);long		i, 	ll_check_sn

if isnull(as_arg) or trim(as_arg) = ''  then return ""

//Gen check SN
For i = 1 To Len(as_arg)
	ll_check_sn += Asc(Mid(Lower(as_arg),i,1))
Next

return string(ll_check_sn)


















end function

public function integer of_findusertreeitem (string as_userid);long ll_Handle
TreeViewItem ltvi_User

ll_Handle = tv_requester.FindItem(RootTreeItem!, 0)
ll_Handle = tv_requester.FindItem(ChildTreeItem!, ll_Handle)
tv_requester.GetItem(ll_Handle, ltvi_User)
if String(ltvi_User.Data) = as_UserID then		
	Return ll_Handle
end if

do while ll_Handle > 0
	ll_Handle = tv_requester.FindItem(NextTreeItem!, ll_Handle)
	tv_requester.GetItem(ll_Handle, ltvi_User)
	if String(ltvi_User.Data) = as_UserID then		
		Return ll_Handle
	end if
loop

Return -1
end function

public function integer of_generate_requester_url ();string 		ls_code, ls_url, ls_ip, ls_cachename, ls_ck
long			ll_role_id, ll_day
datetime		ldt_expiration_date
Date			ld_date
string ls_parm,ls_type,ls_id
long ll_pos,ll_pos2

if dw_1.rowcount() > 0 then 
	ll_role_id = dw_1.GetItemNumber(1,"role_id")	
else
	ll_role_id = -100
End if 
ldt_expiration_date	=	f_get_server_dtm()
ls_cachename = gnv_data.of_getitem( "icred_settings","cache_name", false)
ls_url = gnv_data.of_getitem( "icred_settings","ctx_web_link", false)

if isnull(ls_cachename ) or trim(ls_cachename) = '' then 
	messagebox(gnv_app.iapp_object.DisplayName,"The system cannot detect a valid DB Cache Name. ~r~nPlease go to AEM -> Connection Cache to find the valid Cache Name and enter it here manually.")
	return -1
end if

if isnull(ls_url ) or trim(ls_url) = '' then 
	messagebox(gnv_app.iapp_object.DisplayName,"The system cannot detect a valid ContractlogixWeb Link. ~r~nPlease go to AEM -> Connection Cache to find the valid ContractlogixWeb Link and enter it here manually.")
	return -1
end if

Open(w_day_select)
//ll_day = Long(Message.DoubleParm)
//Added By Jay Chen 11-25-2015
ls_parm = message.stringparm
if ls_parm = '-1' then
	ll_day = -1
else
	ll_pos = pos(ls_parm,'#')
	ll_pos2 = pos(ls_parm,'-')
	ll_day = long(left(ls_parm, ll_pos - 1))
	ls_type = mid(ls_parm, ll_pos + 1, 1)
	ls_id = right(ls_parm,len(ls_parm) - ll_pos2)
end if
if isnull(ls_type) or ls_type = '' then ls_type = 'B'
if ls_type = 'B' then ls_id = '' //Added By Jay Chen 12-09-2015
if isnull(ls_id) or ls_id = '' then ls_id = '0'
//end

if not isnull(ll_day)  and ll_day >= 0  then
	if ll_day = 0 then 
		ld_date = relativedate(date(ldt_expiration_date),3650)
	else
		ld_date = relativedate(date(ldt_expiration_date),ll_day)
	end if 
else
	return -1
end if 

//ls_url = AppeonGetIEURL()
//If ls_url <> '' Then
	ls_ck = ls_cachename+"*"+of_day_password(ld_date)+"#"+string(ll_role_id)
	ls_ck =  of_generate_codecheck(ls_ck)
	if right(ls_url,1) <> '/' then ls_url = ls_url + '/'
//	ls_url = Mid(ls_url,1,Len(ls_url) - 1) //Cut last '/'
//	ls_url = Mid(ls_url,1,LastPos(ls_url,'/')) //Cut application root name
	if pos(lower(ls_url),'localhost')  > 0 then
		ls_ip = appeongetclientip()
		ls_url = gnv_string.of_globalreplace(ls_url, 'localhost', ls_ip)
	end if
	ls_url = ls_url+ "ContractRequest/Account/Logon?cachename="+ls_cachename+ &
		"&expirationdate="+string(ld_date,"MMddyyyy")+"&roleid="+string(ll_role_id)+ &
		"&ck=" + ls_ck + "&category=" + ls_type + "&facilityid=" + ls_id
	::Clipboard(ls_url)
	messagebox(gnv_app.iapp_object.DisplayName," The account creation link is copied onto your clipboard now.")	
//End If

return 1 
end function

public function integer of_advancedsecurity ();// Edit advanced security options
// Returns:
//	1 - User has successfully saved advanced security options
// -1 - User has canceled, or an error has occurred
//
//Added by Harry 2017.04.11 Web requester project - merge
dwitemstatus ldws_curr
long ll_advanced_security
string ls_parm, ls_ret

ldws_curr = dw_1.getItemStatus(1, 0, primary!)

IF dw_1.rowCount() = 0 THEN
	return -1
ELSEIF ldws_curr = new! THEN
	messageBox(gnv_app.iapp_object.appname, "You must save the new record before proceeding.")
	return -1
ELSEIF this.event pfc_save()  < 0 THEN
	return -1
END IF

//ls_parm = dw_1.object.user_id[1] + "~t" + string(dw_1.object.advanced_security[1])
ll_advanced_security = dw_1.getItemNumber(1, "advanced_security")
IF isNull(ll_advanced_security) THEN ll_advanced_security = 0

ls_parm = dw_1.getItemString(1, "user_id") + "~t" + string(ll_advanced_security)

openWithParm(w_requester_advanced_security, ls_parm)

ls_ret = message.stringParm

IF lower(ls_ret) = "ok" THEN
	return 1
ELSE
	return -1
END IF

end function

on w_requester_account_edit.create
int iCurrent
call super::create
this.cb_reset=create cb_reset
this.cb_generate=create cb_generate
this.cb_save=create cb_save
this.cb_close=create cb_close
this.cb_delete=create cb_delete
this.dw_1=create dw_1
this.tv_requester=create tv_requester
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_reset
this.Control[iCurrent+2]=this.cb_generate
this.Control[iCurrent+3]=this.cb_save
this.Control[iCurrent+4]=this.cb_close
this.Control[iCurrent+5]=this.cb_delete
this.Control[iCurrent+6]=this.dw_1
this.Control[iCurrent+7]=this.tv_requester
end on

on w_requester_account_edit.destroy
call super::destroy
destroy(this.cb_reset)
destroy(this.cb_generate)
destroy(this.cb_save)
destroy(this.cb_close)
destroy(this.cb_delete)
destroy(this.dw_1)
destroy(this.tv_requester)
end on

event open;call super::open;long 		ll_Handle,ll_LeftIndent,ll_TopIndent
integer 	li_Pos
string 	ls_message

// Get window message (Format: TYPE|USERID)
ls_message = Message.StringParm
li_Pos = Pos(ls_message, "|")
is_Type = Left(ls_message, li_Pos - 1)
is_UserID = Right(ls_message, Len(ls_message) - li_Pos)

dw_1.SetTransObject(SQLCA)
dw_1.Retrieve()

//create tree
of_createtree( "")

if AppeonGetClientType() = 'PB' then
	cb_generate.visible = false
end if 

//Added By Jay Chen 12-02-2015
If w_mdi.of_security_access( 7019 ) = 0 Then 
	dw_1.object.datawindow.readonly = true
	cb_delete.enabled = false
	cb_save.enabled = false
	cb_reset.enabled = false
	If gnv_user_option.of_Get_option_value( gs_user_id, "custom_window_bkcolor_on" ) <> '1' Then //Added By Ken.Guo 2016-03-23
		dw_1.Modify("email.Background.Color='67108864'" )
		dw_1.Modify("contact_type.Background.Color='67108864'" )
		dw_1.Modify("facility_id.Background.Color='67108864'" )
		dw_1.Modify("first_name.Background.Color='67108864'" )
		dw_1.Modify("last_name.Background.Color='67108864'" )
		dw_1.Modify("middle_name.Background.Color='67108864'" )
		dw_1.Modify("phone.Background.Color='67108864'" )
		dw_1.Modify("fax.Background.Color='67108864'" )
		dw_1.Modify("mobilephone.Background.Color='67108864'" )
		dw_1.Modify("notes.Background.Color='67108864'" )
	End If
Else
	dw_1.object.datawindow.readonly = false
	cb_delete.enabled = true
	cb_save.enabled = true
	cb_reset.enabled = true
	If gnv_user_option.of_Get_option_value( gs_user_id, "custom_window_bkcolor_on" ) <> '1' Then
		dw_1.Modify("email.Background.Color='16777215'" )
		dw_1.Modify("contact_type.Background.Color='16777215'" )
		dw_1.Modify("facility_id.Background.Color='16777215'" )
		dw_1.Modify("first_name.Background.Color='16777215'" )
		dw_1.Modify("last_name.Background.Color='16777215'" )
		dw_1.Modify("middle_name.Background.Color='16777215'" )
		dw_1.Modify("phone.Background.Color='16777215'" )
		dw_1.Modify("fax.Background.Color='16777215'" )
		dw_1.Modify("mobilephone.Background.Color='16777215'" )
		dw_1.Modify("notes.Background.Color='16777215'" )
	End If
End If
end event

event close;call super::close;if IsValid(ids_user_requester) then Destroy ids_user_requester
end event

type cb_reset from u_cb within w_requester_account_edit
integer x = 1746
integer y = 1240
integer width = 613
integer taborder = 40
boolean bringtotop = true
fontcharset fontcharset = ansi!
string text = "&Reset Password to 123"
end type

event clicked;call super::clicked;if dw_1.GetRow() <= 0 then Return
if MessageBox("Reset", "Are you sure you want to reset password to 123?", Question!, YesNo!) = 2 then
	Return
end if	

dw_1.setItem(dw_1.GetRow(), "user_password","123")
if dw_1.update() = 1 then
	commit using sqlca;
	messagebox(gnv_app.iapp_object.DisplayName,"The password has been reset to 123.")
else
	rollback using sqlca;
end if 

end event

type cb_generate from u_cb within w_requester_account_edit
integer x = 9
integer y = 1240
integer width = 965
integer taborder = 30
boolean bringtotop = true
string text = "&Generate an Account Creation Link"
end type

event clicked;call super::clicked;of_generate_requester_url()
end event

type cb_save from u_cb within w_requester_account_edit
integer x = 2775
integer y = 1240
integer taborder = 40
boolean bringtotop = true
string text = "&Save"
end type

event clicked;call super::clicked;string 	ls_user_id
boolean lb_success,lb_update1,lb_update2,lb_update3,lb_update4
long ll_email_lookup_code,ll_cnt,ll_contact_id
datastore lds_contact
string ls_name1,ls_name2,ls_name3,ls_email

if dw_1.rowcount( ) > 0  then
	dw_1.accepttext( )
	//Added By Jay Chen 11-26-2015
	ib_click_save = true
	if dw_1.getItemString(dw_1.getrow(),"first_name",primary!,false) <> dw_1.getItemString(dw_1.getrow(),"first_name",primary!,true) then ib_update1 = true
	if dw_1.getItemString(dw_1.getrow(),"middle_name",primary!,false) <> dw_1.getItemString(dw_1.getrow(),"middle_name",primary!,true) then ib_update2 = true
	if dw_1.getItemString(dw_1.getrow(),"last_name",primary!,false) <> dw_1.getItemString(dw_1.getrow(),"last_name",primary!,true) then ib_update3 = true	
	if dw_1.getItemString(dw_1.getrow(),"email",primary!,false) <> dw_1.getItemString(dw_1.getrow(),"email",primary!,true)  then ib_update4 = true	
	if dw_1.getItemNumber(dw_1.getrow(),"facility_id",primary!,false) <> dw_1.getItemNumber(dw_1.getrow(),"facility_id",primary!,true)  then ib_update5 = true
	//end
	if dw_1.event pfc_update( true, true) > 0 then
		ib_click_save = false
	//	ls_user_id = dw_1.getItemString(dw_1.getrow(),"user_id")
	//	of_createtree(ls_user_id)
	else
		messagebox(gnv_app.iapp_object.DisplayName," Failed to save the data!")
		return
	end if 
end if 


end event

type cb_close from u_cb within w_requester_account_edit
integer x = 3159
integer y = 1240
integer taborder = 30
boolean bringtotop = true
string text = "&Close"
boolean cancel = true
end type

event clicked;call super::clicked;Close(Parent)
end event

type cb_delete from u_cb within w_requester_account_edit
integer x = 2391
integer y = 1240
integer taborder = 30
boolean bringtotop = true
fontcharset fontcharset = ansi!
string text = "&Delete"
end type

event clicked;call super::clicked;string 	ls_user_id
long		ll_Handle

if dw_1.GetRow() <= 0 then Return
if MessageBox("Delete", "Are you sure you want to delete the selected record?", Question!, YesNo!) = 2 then
	Return
end if	

ls_user_id  = dw_1.GetItemString(dw_1.getrow(),"user_id")
if dw_1.event pfc_deleterow( ) < 0 then 
	messagebox(gnv_app.iapp_object.DisplayName," Failed to delete the data!")
	return
else
	if dw_1.event pfc_update( true, true)  = 1 then 
//		of_createtree("")
		ll_Handle = of_findusertreeitem(ls_user_id)
		tv_requester.deleteitem( ll_Handle)
		if dw_1.rowcount( ) > 0 then 
			ls_user_id =  dw_1.GetItemString(dw_1.getrow(),"user_id")
			ll_Handle = of_findusertreeitem(ls_user_id)
			tv_requester.selectitem( ll_Handle)
			of_filter(ls_user_id)
			//Added By Jay Chen 11-25-2015 remove requester in ctx_contact
			update ctx_contacts set requester_user_d = '' where requester_user_d = :ls_user_id;
		end if 
	else
		messagebox(gnv_app.iapp_object.DisplayName," Failed to delete the data!")
		return
	end if
end if 
end event

type dw_1 from u_dw within w_requester_account_edit
event ue_processitemchanged ( long al_row,  string as_col,  string as_data )
integer x = 750
integer width = 2779
integer height = 1204
integer taborder = 20
string dataobject = "d_requester_account_edit"
end type

event ue_processitemchanged(long al_row, string as_col, string as_data);//Added by Harry 2017.04.11 Web requester project - merge
// If we're here, then change was rejected by itemchanged and POSTed here
CHOOSE CASE as_col
	CASE "advanced_security"
		IF as_data = "1" THEN
			IF of_advancedSecurity() = 1 THEN
				this.object.advanced_security[al_row] = 1
				/* Database will already have been updated. Reset status. */
				this.resetUpdate()
			END IF
		END IF
END CHOOSE

end event

event constructor;call super::constructor;
This.of_setupdateable( True)
//this.of_SetDropDownCalendar(TRUE)				//clear the message.
end event

event retrieveend;call super::retrieveend;//String		ls_Password	=space(100)
//long		ll_Cycle, ll_pwd_len, ll_Count
//integer li_val
//
//ll_Count = This.RowCount()
//if ll_Count > 0 then 
//	select set_45 into :li_val from icred_settings; 
//	SetPointer(HourGlass!)
//	for ll_Cycle = 1 to ll_Count
//		ls_Password = This.GetItemString(ll_Cycle,"user_password")
//		ll_pwd_len = This.GetItemNumber(ll_Cycle,"pwd_len")
//		if IsNull(ls_Password) then  continue
//	
//		if AppeonGetClientType() = 'WEB' then
//			if ll_pwd_len - len(ls_Password) > 0  then 
//				ls_Password =ls_Password + space(ll_pwd_len - len(ls_Password))
//			end if 
//		end if
//	
//		ls_Password = in_encrypt.of_decrypt_new(ls_Password , li_val)
//		This.SetItem(ll_Cycle,"user_password",ls_Password)
//		This.SetItemStatus(ll_Cycle,"user_password",Primary!,NotModified!)
//	Next
//	SetPointer(Arrow!)
//End if 
//

end event

event updateend;call super::updateend;//
//String	ls_InputPass,ls_DBPass
//long		ll_Cycle,ll_Count,ll_ID
//
//SetPointer(HourGlass!)
//
//ll_Count = This.RowCount()
//for ll_Cycle = 1 to ll_Count
//	ll_ID = This.GetItemNumber(ll_Cycle,"usercode")
//	if IsNull(ll_ID) then CONTINUE
//	
//	SELECT user_password INTO :ls_DBPass FROM user_requester WHERE usercode = :ll_ID ;
//	
//	ls_InputPass = This.GetItemString(ll_Cycle,"user_password")
//	if IsNull(ls_InputPass) then
//		if Not IsNull(ls_DBPass) then
//			UPDATE user_requester SET user_password = NULL WHERE usercode = :ll_ID ;
//			if SQLCA.SQLCode <> 0 then Exit
//		end if
//	else
//		ls_InputPass = in_encrypt.of_Encrypt(ls_InputPass)
//		if IsNull(ls_DBPass) or ls_InputPass <> ls_DBPass then
//			UPDATE user_requester SET user_password = :ls_InputPass WHERE usercode = :ll_ID ;
//			if SQLCA.SQLCode <> 0 then Exit
//		end if
//	end if
//next
//
//if SQLCA.SQLCode = 0 then
//	COMMIT USING SQLCA;
//else
//	MessageBox(gnv_app.iapp_object.DisplayName,SQLCA.SQLErrText,StopSign!)
//	ROLLBACK USING SQLCA;
//end if
//
//SetPointer(Arrow!)


end event

event buttonclicked;call super::buttonclicked;//Added by Harry 2017.04.11 Web requester project - merge
CHOOSE CASE dwo.name
	CASE "b_advanced_security"
		IF parent.of_advancedSecurity() = 1 THEN
			IF this.object.advanced_security[row] = 0 THEN
				/* The Advanced Security window will have set user_requester.advanced_security = 1 */
				this.object.advanced_security[row] = 1
				this.resetUpdate()
			END IF
		END IF
END CHOOSE

//string 		ls_code, ls_url, ls_ip, ls_cachename, ls_ck
//long			ll_role_id
//datetime		ldt_expiration_date
//
//if dwo.name = 'b_generate' then 	
//	ls_code = this.GetItemString(row,"reg_code")	
//	ll_role_id = this.GetItemNumber(row,"role_id")	
//	ldt_expiration_date = this.GetItemDatetime(row, "reg_effective_date")
//	if isnull(ls_code) or trim(ls_code) = '' then		
//		if AppeonGetClientType() = 'PB' then
////			ls_url = gnv_data.of_getitem( "icred_settings","ctx_web_link", false)
////			ls_cachename = gnv_data.of_getitem( "icred_settings","cache_name", false)
////			ls_ck = ls_cachename+"*"+string(ldt_expiration_date,"MMddyyyy")+"#"+string(ll_role_id)
////			ls_ck =  of_generate_codecheck(ls_ck)
////			ls_url = ls_url+ "ContractRequest/Account/Logon?cachename="+ls_cachename+ &
////					"&expirationdate="+string(ldt_expiration_date,"MMddyyyy")+"&roleid="+string(ll_role_id)+ &
////					"&ck=" + ls_ck
////				::Clipboard(ls_url)
////				messagebox(gnv_app.iapp_object.DisplayName,"The current URL is already on the clipboard.")	
//		else
//			if isnull(gs_cachename ) or trim(gs_cachename) = '' then 
//				messagebox(gnv_app.iapp_object.DisplayName,"The system cannot detect a valid DB Cache Name. ~r~nPlease go to AEM -> Connection Cache to find the valid Cache Name and enter it here manually.")
//				return 
//			end if
//			ls_url = AppeonGetIEURL()
//			If ls_url <> '' Then
//				ls_ck = gs_cachename+"*"+string(ldt_expiration_date,"MMddyyyy")+"#"+string(ll_role_id)
//				ls_ck =  of_generate_codecheck(ls_ck)
//				ls_url = Mid(ls_url,1,Len(ls_url) - 1) //Cut last '/'
//				ls_url = Mid(ls_url,1,LastPos(ls_url,'/')) //Cut application root name
//				if pos(lower(ls_url),'localhost')  > 0 then
//					ls_ip = appeongetclientip()
//					ls_url = gnv_string.of_globalreplace(ls_url, 'localhost', ls_ip)
//				end if
//				ls_url = ls_url+ "ContractRequest/Account/Logon?cachename="+gs_cachename+ &
//					"&expirationdate="+string(ldt_expiration_date,"MMddyyyy")+"&roleid="+string(ll_role_id)+ &
//					"&ck=" + ls_ck
//				::Clipboard(ls_url)
//				messagebox(gnv_app.iapp_object.DisplayName,"The current URL is already on the clipboard.")	
//			End If
//		end if  
//	else		
//		messagebox(gnv_app.iapp_object.DisplayName,"The current URL is already on the clipboard.")
//		return
//	end if 	
//elseif dwo.name = 'b_copy' then 
//	ls_url = this.GetItemString(row,"compute_generate")
//	::Clipboard(ls_url)
//	messagebox(gnv_app.iapp_object.DisplayName,"The current URL is already on the clipboard.")
//End if 
end event

event rowfocuschanged;call super::rowfocuschanged;dw_1.ScrollToRow(CurrentRow)

//Added By Jay Chen 11-26-2015
if CurrentRow < 1 then return
string ls_company_type
datawindowchild ldwc
ls_company_type = dw_1.getitemstring(CurrentRow, "contact_type")
if isnull(ls_company_type) then ls_company_type = ''
if ls_company_type <> '' then
	dw_1.getchild("facility_id", ldwc)
	ldwc.settransobject(sqlca)
	ldwc.retrieve()
	ldwc.setfilter("")
	ldwc.filter()
	ldwc.setfilter("contact_type2 = '"+ls_company_type+"' ")
	ldwc.filter()
end if

end event

event pfc_update;call super::pfc_update;string 	ls_user_id
boolean lb_success,lb_update1,lb_update2,lb_update3,lb_update4,lb_update5
long ll_email_lookup_code,ll_cnt,ll_contact_id,ll_facility_id,ll_rec_id,ll_contact_type
datastore lds_contact
string ls_name1,ls_name2,ls_name3,ls_email

if ib_click_save then
	lb_update1 = ib_update1
	lb_update2 = ib_update2
	lb_update3 = ib_update3
	lb_update4 = ib_update4
	lb_update5 = ib_update5
else
	if dw_1.rowcount( ) > 0  then
		dw_1.accepttext( )
		//Added By Jay Chen 11-26-2015
		if dw_1.getItemString(dw_1.getrow(),"first_name",primary!,false) <> dw_1.getItemString(dw_1.getrow(),"first_name",primary!,true) then lb_update1 = true
		if dw_1.getItemString(dw_1.getrow(),"middle_name",primary!,false) <> dw_1.getItemString(dw_1.getrow(),"middle_name",primary!,true) then lb_update2 = true
		if dw_1.getItemString(dw_1.getrow(),"last_name",primary!,false) <> dw_1.getItemString(dw_1.getrow(),"last_name",primary!,true) then lb_update3 = true	
		if dw_1.getItemString(dw_1.getrow(),"email",primary!,false) <> dw_1.getItemString(dw_1.getrow(),"email",primary!,true)  then lb_update4 = true
		if dw_1.getItemNumber(dw_1.getrow(),"facility_id",primary!,false) <> dw_1.getItemNumber(dw_1.getrow(),"facility_id",primary!,true)  then lb_update5 = true
		//end
	end if
end if

//Added By Jay Chen 11-25-2015 sync the requester data to ctx_contact.(only for name and email)
//if lb_success then
	if lb_update1 or lb_update2 or lb_update3 or lb_update4 or lb_update5 then
		select lookup_code into :ll_email_lookup_code from code_lookup where lookup_name = 'Contract Contact VIA' and code = 'EMAIL';
		if isnull(ll_email_lookup_code) then ll_email_lookup_code = 0
		ls_user_id = dw_1.getItemString(dw_1.getrow(),"user_id")
		ls_name1 = dw_1.getItemString(dw_1.getrow(),"first_name")
		ls_name2 = dw_1.getItemString(dw_1.getrow(),"middle_name")
		ls_name3 = dw_1.getItemString(dw_1.getrow(),"last_name")
		ls_email = dw_1.getItemString(dw_1.getrow(),"email")
		ll_facility_id = dw_1.getItemNumber(dw_1.getrow(),"facility_id")
		if isnull(ls_name1) then ls_name1 = ''
		if isnull(ls_name2) then ls_name2 = ''
		if isnull(ls_name3) then ls_name3 = ''
		if isnull(ls_email) then ls_email = ''
		lds_contact = create datastore
		lds_contact.dataobject = 'd_requester_contact_list'
		lds_contact.settransobject(sqlca)
		lds_contact.retrieve(ls_user_id)
		for ll_cnt = 1 to lds_contact.rowcount()
			ll_contact_id = lds_contact.getitemnumber(ll_cnt,"contact_id")
			if lb_update1 then 
				update ctx_contacts set first_name = :ls_name1 where contact_id = :ll_contact_id;
			end if
			if lb_update2 then 
				update ctx_contacts set middle_name = :ls_name2 where contact_id = :ll_contact_id;
			end if
			if lb_update3 then 
				update ctx_contacts set last_name = :ls_name3 where contact_id = :ll_contact_id;
			end if
			if lb_update4 then
				update ctx_contacts_numbers set contact_email = :ls_email where contact_id = :ll_contact_id and via = :ll_email_lookup_code;
			end if
			if lb_update5 then 
				update ctx_contacts set facility_id = :ll_facility_id where contact_id = :ll_contact_id;
			end if
		next
		//Added By Jay Chen 01-22-2016
		if lds_contact.rowcount() = 0 then
			if not isnull(ll_facility_id) and ll_facility_id <> 0 then
				select max(contact_id) into :ll_contact_id from ctx_contacts;
				ll_contact_id++
				select top 1 record_id into :ll_rec_id from ids;
				select lookup_code into :ll_contact_type from code_lookup where lookup_name='contract contact type' AND code='REQUESTER';
				if isnull(ll_contact_type) then
					select top 1 lookup_code_id into :ll_contact_type from ids;
					insert into code_lookup(lookup_code,lookup_name,code,description,modify_date)
					values(:ll_contact_type,'Contract Contact Type','REQUESTER','Requester',getdate());
					ll_contact_type++
					update ids set record_id = :ll_contact_type;
				end if
				insert into ctx_contacts(contact_id,contact_type,first_name,last_name,middle_name,facility_id,record_id,requester_user_d,DefaultTo,status)
				values(:ll_contact_id,:ll_contact_type,:ls_name1,:ls_name2,:ls_name3,:ll_facility_id,:ll_rec_id,:ls_user_id,'0','A');
				ll_rec_id++
				update ids set record_id = :ll_rec_id;
				
				select top 1 record_id into :ll_rec_id from ids; 
				insert into ctx_contacts_numbers(contact_id,via,contact_email,record_id)
				values(:ll_contact_id,:ll_email_lookup_code,:ls_email,:ll_rec_id);
				ll_rec_id++
				update ids set record_id = :ll_rec_id;
			end if
		end if
		//end
		commit;
		destroy lds_contact
	end if
//end if

return 1
end event

event itemchanged;call super::itemchanged;datawindowchild ldwc
string ls_type,ls_facility_name,ls_user_id
long ll_null,ll_facility_id,ll_facility_id_new,ll_cnt

setnull(ll_null)
if row < 1 then return

choose case dwo.name
	// <RP> 3.22.2017 
	CASE "advanced_security"	//Added by Harry 2017.04.11 Web requester project - merge
		IF data = "1" THEN
			/* Reject data here and POST ue_processItemChanged */
			/* Reason: advanced security settings must be set first. */
			this.event post ue_processItemChanged(row, "advanced_security", data)
			return 2
		END IF

	case 'contact_type'
		ls_type = data
		this.getchild("facility_id", ldwc)
		ldwc.settransobject(sqlca)
		ldwc.retrieve()
		ldwc.setfilter("")
		ldwc.filter()
		ldwc.setfilter("contact_type2 = '"+ls_type+"' ")
		ldwc.filter()
		this.setitem(dw_1.getrow(), "facility_id", ll_null)
	case 'facility_id'
		ls_user_id = dw_1.getitemstring(dw_1.getrow(), "user_id")
		SELECT count(*) into :ll_cnt FROM ctx_contacts WHERE requester_user_d = :ls_user_id;
		if ll_cnt > 0 then
			ll_facility_id = dw_1.getitemnumber(dw_1.getrow(), 'facility_id',primary!,true)
			ll_facility_id_new = long(data)
			select facility_name into :ls_facility_name from app_facility where facility_id = :ll_facility_id_new;
			if messagebox('Modify Company Name','The associated contact will be moved to the company "' + ls_facility_name + '". Do you want to continue?',Question!,YesNo!,2) <> 1 then
				dw_1.setitem(dw_1.getrow(), "facility_id",ll_facility_id)
				Return 2
			end if
		end if
end choose
end event

type tv_requester from treeview within w_requester_account_edit
integer x = 9
integer width = 722
integer height = 1204
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

event selectionchanged;if NewHandle > 0 then 
	// Get current item
	dw_1.AcceptText()
	this.GetItem(NewHandle, itvi_user_requester)
	
	// Filter specify user accounts
	//if is_Type = "ALL" then
		of_Filter(String(itvi_user_requester.Data))
	//end if
end if 
end event

