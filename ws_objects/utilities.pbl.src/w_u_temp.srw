$PBExportHeader$w_u_temp.srw
forward
global type w_u_temp from window
end type
type sle_1 from singlelineedit within w_u_temp
end type
type cb_1 from commandbutton within w_u_temp
end type
end forward

global type w_u_temp from window
integer x = 1056
integer y = 484
integer width = 1554
integer height = 556
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
sle_1 sle_1
cb_1 cb_1
end type
global w_u_temp w_u_temp

on w_u_temp.create
this.sle_1=create sle_1
this.cb_1=create cb_1
this.Control[]={this.sle_1,&
this.cb_1}
end on

on w_u_temp.destroy
destroy(this.sle_1)
destroy(this.cb_1)
end on

event open;gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17

end event

type sle_1 from singlelineedit within w_u_temp
integer x = 283
integer y = 80
integer width = 869
integer height = 92
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type cb_1 from commandbutton within w_u_temp
integer x = 549
integer y = 276
integer width = 247
integer height = 108
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "none"
end type

event clicked;

if fileexists(sle_1.text) then
	messagebox("TEST","OK")
else
	messagebox("TEST","Failed")
end if
end event

