$PBExportHeader$w_salesforcelogin_setting.srw
forward
global type w_salesforcelogin_setting from w_response
end type
type cb_3 from commandbutton within w_salesforcelogin_setting
end type
type dw_1 from datawindow within w_salesforcelogin_setting
end type
type cb_help from commandbutton within w_salesforcelogin_setting
end type
type cb_2 from commandbutton within w_salesforcelogin_setting
end type
type cb_1 from commandbutton within w_salesforcelogin_setting
end type
type gb_1 from groupbox within w_salesforcelogin_setting
end type
end forward

global type w_salesforcelogin_setting from w_response
integer x = 214
integer y = 221
integer width = 1774
integer height = 1100
string title = "Salesforce User Setting"
cb_3 cb_3
dw_1 dw_1
cb_help cb_help
cb_2 cb_2
cb_1 cb_1
gb_1 gb_1
end type
global w_salesforcelogin_setting w_salesforcelogin_setting

type variables
str_sflogin_response   istr_res
end variables

on w_salesforcelogin_setting.create
int iCurrent
call super::create
this.cb_3=create cb_3
this.dw_1=create dw_1
this.cb_help=create cb_help
this.cb_2=create cb_2
this.cb_1=create cb_1
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_3
this.Control[iCurrent+2]=this.dw_1
this.Control[iCurrent+3]=this.cb_help
this.Control[iCurrent+4]=this.cb_2
this.Control[iCurrent+5]=this.cb_1
this.Control[iCurrent+6]=this.gb_1
end on

on w_salesforcelogin_setting.destroy
call super::destroy
destroy(this.cb_3)
destroy(this.dw_1)
destroy(this.cb_help)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.gb_1)
end on

event open;call super::open;long ll_row

dw_1.SetTransObject(SQLCA)
dw_1.Retrieve()

if dw_1.rowcount() = 0 then ll_row = dw_1.insertrow(0)
dw_1.setfocus( )
dw_1.setcolumn("salesforce_user")
end event

type cb_3 from commandbutton within w_salesforcelogin_setting
integer x = 937
integer y = 872
integer width = 343
integer height = 92
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Save"
end type

event clicked;long ll_row
string	ls_sfuser, ls_sfpwd, ls_Token
					
dw_1.accepttext()
ll_row = dw_1.getrow()
if ll_row < 1 then return

ls_sfpwd = dw_1.getitemstring(ll_row, "salesforce_pwd")
ls_sfuser = dw_1.getitemstring(ll_row, "salesforce_user")
ls_Token = dw_1.getitemstring(ll_row, "salesforce_token")
if isnull(ls_sfuser) or trim(ls_sfuser) = ""  Then
	MessageBox( 'tips', 'Please input Salesforce User ID!' )
	dw_1.setfocus()
	dw_1.setcolumn("salesforce_user")
	Return
End If
if isnull(ls_sfpwd) or trim(ls_sfpwd) = ""  Then
	MessageBox( 'tips', 'Please input Salesforce Password!' )
	dw_1.setfocus()
	dw_1.setcolumn("salesforce_pwd")
	Return
End If
if isnull(ls_Token) or trim(ls_Token) = ""  Then
	MessageBox( 'tips', 'Please input Secure Token!' )
	dw_1.setfocus()
	dw_1.setcolumn("salesforce_token")
	Return
End If

dw_1.setitem(ll_row, "update_by", gs_user_id)
dw_1.setitem(ll_row, "update_date", today())

If dw_1.update() = 1 Then
	Commit;
Else
	Rollback;
	Messagebox('Save Error','Failed to save data, please call support.')
	Return -1
End If

Close(Parent)


end event

type dw_1 from datawindow within w_salesforcelogin_setting
integer x = 41
integer y = 68
integer width = 1678
integer height = 796
integer taborder = 20
string title = "none"
string dataobject = "dw_salesforcelogin_setting"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_help from commandbutton within w_salesforcelogin_setting
integer x = 69
integer y = 872
integer width = 343
integer height = 92
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Help"
end type

event clicked;String ls_message
ls_message = &
"Please use your Salesforce user name and password.~r~n~r~n" + &
"To obtain the Security Token, please log into your Salesforce website and get it from: My Settings -> Personal -> Reset My Security Token.~r~n" +&
"When SalesForce URL is empty, the production soap link will be used by default. Users can enter SalesForce sandbox link, ~r~n" + &
"for example: ttps://test.salesforce.com/services/Soap/c/38.0/0DFe00000004E4A"
//Modified by gavins 20161223
Messagebox('Tips',ls_message)
end event

type cb_2 from commandbutton within w_salesforcelogin_setting
integer x = 1371
integer y = 872
integer width = 343
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Cancel"
boolean cancel = true
end type

event clicked;close( parent )
end event

type cb_1 from commandbutton within w_salesforcelogin_setting
integer x = 503
integer y = 872
integer width = 343
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Verify"
boolean default = true
end type

event clicked;string				ls_Result, ls_sfuser, ls_sfpwd, ls_Token, ls_sfurl
Integer			li_Pos,ll_row
n_cst_webapi    ln_api
boolean lb_valid = false

dw_1.accepttext()
ll_row = dw_1.getrow()
if ll_row < 1 then return
ls_sfpwd = dw_1.getitemstring(ll_row, "salesforce_pwd")
ls_sfuser = dw_1.getitemstring(ll_row, "salesforce_user")
ls_Token = dw_1.getitemstring(ll_row, "salesforce_token")
ls_sfurl 	= dw_1.GetItemstring( ll_Row, 'salesforceurl' )  //Added by gavins 20161223
if isnull(ls_sfuser) or trim(ls_sfuser) = ""  Then
	MessageBox( 'tips', 'Please input Salesforce User ID!' )
	dw_1.setfocus()
	dw_1.setcolumn("salesforce_user")
	Return
End If
if isnull(ls_sfpwd) or trim(ls_sfpwd) = ""  Then
	MessageBox( 'tips', 'Please input Salesforce Password!' )
	dw_1.setfocus()
	dw_1.setcolumn("salesforce_pwd")
	Return
End If
if isnull(ls_Token) or trim(ls_Token) = ""  Then
	MessageBox( 'tips', 'Please input Secure Token!' )
	dw_1.setfocus()
	dw_1.setcolumn("salesforce_token")
	Return
End If
If IsNull( ls_sfurl ) Then ls_sfurl = ""

ls_sfuser = trim( ls_sfuser )
ls_sfpwd = ls_sfpwd + ls_Token
ls_Result = ln_api.of_get_salesforce_objects( ls_sfuser, ls_sfpwd,  "", ls_sfurl )  //Modified by gavins 20161223

If Len( ls_Result  ) > 0 Then
	If pos( lower( ls_Result ), '"metadata":') > 0 then
		lb_valid = true
	else
		lb_valid = false
	end if
Else
	lb_valid = false
End If

if lb_valid then
	Messagebox('tips','The salesforce user settings are valid.')
else
	Messagebox('tips','The salesforce user settings are invalid.')
end if
	
end event

type gb_1 from groupbox within w_salesforcelogin_setting
integer x = 18
integer y = 8
integer width = 1714
integer height = 688
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Salesforce User Setting"
end type

