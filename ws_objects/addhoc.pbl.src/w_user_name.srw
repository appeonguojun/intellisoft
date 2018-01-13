$PBExportHeader$w_user_name.srw
forward
global type w_user_name from window
end type
type st_1 from statictext within w_user_name
end type
type sle_1 from singlelineedit within w_user_name
end type
type cb_1 from commandbutton within w_user_name
end type
end forward

global type w_user_name from window
integer x = 1056
integer y = 484
integer width = 1193
integer height = 456
boolean titlebar = true
string title = "Enter user name"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
st_1 st_1
sle_1 sle_1
cb_1 cb_1
end type
global w_user_name w_user_name

on w_user_name.create
this.st_1=create st_1
this.sle_1=create sle_1
this.cb_1=create cb_1
this.Control[]={this.st_1,&
this.sle_1,&
this.cb_1}
end on

on w_user_name.destroy
destroy(this.st_1)
destroy(this.sle_1)
destroy(this.cb_1)
end on

event open;gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17

end event

type st_1 from statictext within w_user_name
integer x = 50
integer y = 32
integer width = 631
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Enter user name"
boolean focusrectangle = false
end type

type sle_1 from singlelineedit within w_user_name
integer x = 55
integer y = 136
integer width = 773
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

type cb_1 from commandbutton within w_user_name
integer x = 869
integer y = 132
integer width = 247
integer height = 108
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "OK"
end type

event clicked;string s

s = sle_1.text

if len(s) < 1 then
	//messagebox("???","Please enter user name")
	messagebox("Userame","Please enter a user name")
	return
end if

gs_user_id = s

close(parent)
end event

