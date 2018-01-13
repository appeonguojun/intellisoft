$PBExportHeader$w_cust_test_account_message.srw
forward
global type w_cust_test_account_message from window
end type
type tab_1 from tab within w_cust_test_account_message
end type
type tabpage_1 from userobject within tab_1
end type
type dw_1 from datawindow within tabpage_1
end type
type tabpage_1 from userobject within tab_1
dw_1 dw_1
end type
type tabpage_2 from userobject within tab_1
end type
type mle_2 from multilineedit within tabpage_2
end type
type tabpage_2 from userobject within tab_1
mle_2 mle_2
end type
type tab_1 from tab within w_cust_test_account_message
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type
type cb_2 from commandbutton within w_cust_test_account_message
end type
type mle_1 from multilineedit within w_cust_test_account_message
end type
type ln_1 from line within w_cust_test_account_message
end type
end forward

global type w_cust_test_account_message from window
integer width = 2254
integer height = 828
boolean titlebar = true
string title = "Test Account Settings"
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
tab_1 tab_1
cb_2 cb_2
mle_1 mle_1
ln_1 ln_1
end type
global w_cust_test_account_message w_cust_test_account_message

type variables
public:
constant integer 		Firstbutton_x = 2171
constant integer 		Firstbutton_Y = 520
constant integer 		Movewidth = 360
constant integer 		Size = 353
integer		ii_buttonclicked
u_cst_message_struct iu_message


end variables

on w_cust_test_account_message.create
this.tab_1=create tab_1
this.cb_2=create cb_2
this.mle_1=create mle_1
this.ln_1=create ln_1
this.Control[]={this.tab_1,&
this.cb_2,&
this.mle_1,&
this.ln_1}
end on

on w_cust_test_account_message.destroy
destroy(this.tab_1)
destroy(this.cb_2)
destroy(this.mle_1)
destroy(this.ln_1)
end on

event open;string ls_pass_flag,ls_error_list
long ll_row
string ls_desc,ls_send_desc

ls_pass_flag = message.stringparm
//Added By Jay Chen 05-28-2014
If gnv_data.of_getitem( 'icred_settings', 'use_web_email', False) = '1' Then 
	ls_desc = "Receive test e-mail message on CLIENT side: "
	ls_send_desc = "Send test e-mail message on SERVER side: "
else
	ls_desc = "Receive test e-mail message: "
	ls_send_desc = "Send test e-mail message: "
end if
				
if ls_pass_flag = '0' then
	mle_1.text = "Some errors occurred while processing the tests. Review the list of errors " +'~r~n'+&
	                   "below for more details."
	if isvalid(w_email_account_edit) then
		IF gnv_data.of_getitem('icred_settings', 'receive_email', False) = '1' Then
			if len(w_email_account_edit.is_test_receive_errtext)  >  0 then
				ll_row = tab_1.tabpage_1.dw_1.insertrow(0)
				tab_1.tabpage_1.dw_1.setitem(ll_row,"desc",ls_desc)
				tab_1.tabpage_1.dw_1.setitem(ll_row,"status","Failed")
				ls_error_list += ls_desc + w_email_account_edit.is_test_receive_errtext +'~r~n'
//				ls_error_list += "Receive test e-mail message: " + w_email_account_edit.is_test_receive_errtext +'~r~n'
			else
				ll_row = tab_1.tabpage_1.dw_1.insertrow(0)
				tab_1.tabpage_1.dw_1.setitem(ll_row,"desc",ls_desc)
				tab_1.tabpage_1.dw_1.setitem(ll_row,"status","Successful")
			end if
		End if
		if len(w_email_account_edit.is_test_send_errtext) > 0 or w_email_account_edit.is_test_send_rtn <> '0' then
			ll_row = tab_1.tabpage_1.dw_1.insertrow(0)
			tab_1.tabpage_1.dw_1.setitem(ll_row,"desc",ls_send_desc)
			tab_1.tabpage_1.dw_1.setitem(ll_row,"status","Failed")
			if len(w_email_account_edit.is_test_send_errtext) > 0 then
				ls_error_list += ls_send_desc + w_email_account_edit.is_test_send_errtext
			end if
		else
			ll_row = tab_1.tabpage_1.dw_1.insertrow(0)
			tab_1.tabpage_1.dw_1.setitem(ll_row,"desc",ls_send_desc)
			tab_1.tabpage_1.dw_1.setitem(ll_row,"status","Successful")
		end if
		tab_1.tabpage_2.mle_2.text = ls_error_list
	end if
else
	mle_1.text = "Account settings test is successfull."
	IF gnv_data.of_getitem('icred_settings', 'receive_email', False) = '1' Then
		ll_row = tab_1.tabpage_1.dw_1.insertrow(0)
		tab_1.tabpage_1.dw_1.setitem(ll_row,"desc",ls_desc)
		tab_1.tabpage_1.dw_1.setitem(ll_row,"status","Successful")
	End if
	ll_row = tab_1.tabpage_1.dw_1.insertrow(0)
	tab_1.tabpage_1.dw_1.setitem(ll_row,"desc",ls_send_desc)
	tab_1.tabpage_1.dw_1.setitem(ll_row,"status","Successful")
end if
gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17


end event

type tab_1 from tab within w_cust_test_account_message
integer x = 23
integer y = 212
integer width = 2176
integer height = 500
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.Control[]={this.tabpage_1,&
this.tabpage_2}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
end on

type tabpage_1 from userobject within tab_1
integer x = 18
integer y = 100
integer width = 2139
integer height = 384
long backcolor = 67108864
string text = "Tasks"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_1 dw_1
end type

on tabpage_1.create
this.dw_1=create dw_1
this.Control[]={this.dw_1}
end on

on tabpage_1.destroy
destroy(this.dw_1)
end on

type dw_1 from datawindow within tabpage_1
integer x = 14
integer y = 16
integer width = 2107
integer height = 352
integer taborder = 40
string title = "none"
string dataobject = "d_test_account_task_list"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

type tabpage_2 from userobject within tab_1
integer x = 18
integer y = 100
integer width = 2139
integer height = 384
long backcolor = 67108864
string text = "Errors"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
mle_2 mle_2
end type

on tabpage_2.create
this.mle_2=create mle_2
this.Control[]={this.mle_2}
end on

on tabpage_2.destroy
destroy(this.mle_2)
end on

type mle_2 from multilineedit within tabpage_2
integer x = 14
integer y = 16
integer width = 2107
integer height = 352
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean border = false
boolean displayonly = true
end type

type cb_2 from commandbutton within w_cust_test_account_message
integer x = 1856
integer y = 40
integer width = 343
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Close"
end type

event clicked;close(parent)
end event

type mle_1 from multilineedit within w_cust_test_account_message
integer x = 18
integer y = 16
integer width = 1801
integer height = 160
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean border = false
boolean displayonly = true
end type

type ln_1 from line within w_cust_test_account_message
integer linethickness = 6
integer beginx = 23
integer beginy = 188
integer endx = 2199
integer endy = 188
end type

