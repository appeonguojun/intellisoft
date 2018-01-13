$PBExportHeader$w_get_ssn.srw
forward
global type w_get_ssn from window
end type
type sle_1 from singlelineedit within w_get_ssn
end type
type cb_1 from commandbutton within w_get_ssn
end type
end forward

global type w_get_ssn from window
integer x = 823
integer y = 360
integer width = 1056
integer height = 464
boolean titlebar = true
string title = "Enter SSN"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
sle_1 sle_1
cb_1 cb_1
end type
global w_get_ssn w_get_ssn

on w_get_ssn.create
this.sle_1=create sle_1
this.cb_1=create cb_1
this.Control[]={this.sle_1,&
this.cb_1}
end on

on w_get_ssn.destroy
destroy(this.sle_1)
destroy(this.cb_1)
end on

event open;gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17

end event

type sle_1 from singlelineedit within w_get_ssn
integer x = 151
integer y = 64
integer width = 681
integer height = 92
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type cb_1 from commandbutton within w_get_ssn
integer x = 357
integer y = 212
integer width = 247
integer height = 84
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "OK"
end type

event clicked;string ssn


ssn = sle_1.text

if len(ssn) = 0 then
	messagebox("","Please enter SSN")
	return
end if

closewithreturn(parent,ssn)
end event

