$PBExportHeader$w_import_loglist.srw
forward
global type w_import_loglist from window
end type
type cb_1 from commandbutton within w_import_loglist
end type
type mle_log from multilineedit within w_import_loglist
end type
end forward

global type w_import_loglist from window
integer width = 2107
integer height = 1136
boolean titlebar = true
string title = "Design Error Information"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_1 cb_1
mle_log mle_log
end type
global w_import_loglist w_import_loglist

on w_import_loglist.create
this.cb_1=create cb_1
this.mle_log=create mle_log
this.Control[]={this.cb_1,&
this.mle_log}
end on

on w_import_loglist.destroy
destroy(this.cb_1)
destroy(this.mle_log)
end on

event open;string ls_Flag
string ls_Message

ls_Flag = Left(Message.StringParm, 4)
ls_Message = Right(Message.StringParm, Len(Message.StringParm) - 4)
mle_log.text = ls_Message

if ls_Flag = "MAP#" then
	this.Title = "Design Error Information"
else
	this.Title = "Error Message"
end if

gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17

end event

type cb_1 from commandbutton within w_import_loglist
integer x = 1586
integer y = 940
integer width = 343
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Close"
boolean default = true
end type

event clicked;Close(Parent)
end event

type mle_log from multilineedit within w_import_loglist
integer x = 18
integer y = 16
integer width = 2062
integer height = 896
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean hscrollbar = true
boolean vscrollbar = true
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

