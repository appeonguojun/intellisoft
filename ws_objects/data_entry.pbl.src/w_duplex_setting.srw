$PBExportHeader$w_duplex_setting.srw
forward
global type w_duplex_setting from window
end type
type st_1 from statictext within w_duplex_setting
end type
type cb_3 from commandbutton within w_duplex_setting
end type
type cb_2 from commandbutton within w_duplex_setting
end type
type cb_1 from commandbutton within w_duplex_setting
end type
end forward

global type w_duplex_setting from window
integer x = 1189
integer y = 556
integer width = 2062
integer height = 576
boolean titlebar = true
string title = "Duplex Setting"
windowtype windowtype = response!
long backcolor = 80269524
st_1 st_1
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
end type
global w_duplex_setting w_duplex_setting

on w_duplex_setting.create
this.st_1=create st_1
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.Control[]={this.st_1,&
this.cb_3,&
this.cb_2,&
this.cb_1}
end on

on w_duplex_setting.destroy
destroy(this.st_1)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
end on

event open;gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17

end event

type st_1 from statictext within w_duplex_setting
integer x = 50
integer y = 88
integer width = 1920
integer height = 188
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Do you wish to set the scanner setting as Duplex (Two-sided if you scanner is capable), Single or None.  If unsure select None. "
boolean focusrectangle = false
end type

type cb_3 from commandbutton within w_duplex_setting
integer x = 1760
integer y = 304
integer width = 247
integer height = 84
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "None"
end type

event clicked;closewithreturn(parent,0)
end event

type cb_2 from commandbutton within w_duplex_setting
integer x = 1481
integer y = 304
integer width = 247
integer height = 84
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Single"
boolean default = true
end type

event clicked;closewithreturn(parent,1)
end event

type cb_1 from commandbutton within w_duplex_setting
integer x = 1207
integer y = 304
integer width = 247
integer height = 84
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Duplex"
end type

event clicked;closewithreturn(parent,2)
end event

