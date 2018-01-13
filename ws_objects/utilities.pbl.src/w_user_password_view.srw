$PBExportHeader$w_user_password_view.srw
forward
global type w_user_password_view from w_response
end type
type dw_user_password_view from u_dw within w_user_password_view
end type
end forward

global type w_user_password_view from w_response
integer x = 214
integer y = 221
integer width = 1326
string title = "View User Password"
dw_user_password_view dw_user_password_view
end type
global w_user_password_view w_user_password_view

on w_user_password_view.create
int iCurrent
call super::create
this.dw_user_password_view=create dw_user_password_view
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_user_password_view
end on

on w_user_password_view.destroy
call super::destroy
destroy(this.dw_user_password_view)
end on

event open;call super::open;if AppeonGetClientType() = "WEB" then
	This.Resize(This.Width + 16,This.Height + 16)
end if

end event

event key;call super::key;if Key = KeyEscape! then CloseWithReturn(This,"")

end event

type dw_user_password_view from u_dw within w_user_password_view
integer x = 23
integer y = 24
integer width = 1271
integer height = 1368
integer taborder = 10
string dataobject = "d_user_password_view"
boolean hscrollbar = true
end type

event constructor;call super::constructor;long		ll_Cycle,ll_RowCnt
String	ls_PassWord

n_cst_encrypt lnvo_Encrypt

This.of_SetUpdateAble(false)

ll_RowCnt = This.Retrieve()
for ll_Cycle = 1 to ll_RowCnt
	ls_PassWord = This.GetItemString(ll_Cycle,'user_password')
	if ls_PassWord <> '123' then
		ls_PassWord = lnvo_Encrypt.of_Decrypt(ls_PassWord)
		if IsNull(ls_PassWord) then ls_PassWord = ''
		This.SetItem(ll_Cycle,"user_password",ls_PassWord)
	end if
next

end event

