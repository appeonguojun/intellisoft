$PBExportHeader$w_function_password.srw
forward
global type w_function_password from window
end type
type cb_cancel from commandbutton within w_function_password
end type
type sle_1 from singlelineedit within w_function_password
end type
type st_1 from statictext within w_function_password
end type
type cb_1 from commandbutton within w_function_password
end type
end forward

global type w_function_password from window
integer x = 1056
integer y = 484
integer width = 1253
integer height = 456
boolean titlebar = true
string title = "Function Password"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
cb_cancel cb_cancel
sle_1 sle_1
st_1 st_1
cb_1 cb_1
end type
global w_function_password w_function_password

on w_function_password.create
this.cb_cancel=create cb_cancel
this.sle_1=create sle_1
this.st_1=create st_1
this.cb_1=create cb_1
this.Control[]={this.cb_cancel,&
this.sle_1,&
this.st_1,&
this.cb_1}
end on

on w_function_password.destroy
destroy(this.cb_cancel)
destroy(this.sle_1)
destroy(this.st_1)
destroy(this.cb_1)
end on

event open;gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17

end event

type cb_cancel from commandbutton within w_function_password
integer x = 864
integer y = 240
integer width = 315
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Cancel"
boolean cancel = true
end type

event clicked;CloseWithReturn(Parent,"")

end event

type sle_1 from singlelineedit within w_function_password
integer x = 55
integer y = 116
integer width = 1125
integer height = 92
integer taborder = 10
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

type st_1 from statictext within w_function_password
integer x = 59
integer y = 28
integer width = 366
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Enter Password"
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_function_password
integer x = 507
integer y = 240
integer width = 315
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&OK"
boolean default = true
end type

event clicked;String ls_Password

ls_Password = sle_1.Text
if IsNull(ls_Password) or ls_Password = "" then
	MessageBox(gnv_app.iapp_object.DisplayName,"Please Enter Password.")
	sle_1.SetFocus()
	Return
end if

CloseWithReturn(Parent,ls_Password)

end event

