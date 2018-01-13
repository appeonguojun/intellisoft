﻿$PBExportHeader$w_oig_type.srw
forward
global type w_oig_type from window
end type
type cb_c from commandbutton within w_oig_type
end type
type cb_2 from commandbutton within w_oig_type
end type
type cb_1 from commandbutton within w_oig_type
end type
type st_1 from statictext within w_oig_type
end type
end forward

global type w_oig_type from window
integer x = 1106
integer y = 1044
integer width = 1664
integer height = 608
boolean titlebar = true
string title = "OIG Process Select"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 79680469
cb_c cb_c
cb_2 cb_2
cb_1 cb_1
st_1 st_1
end type
global w_oig_type w_oig_type

type variables
string is_ret = "C"
end variables

on w_oig_type.create
this.cb_c=create cb_c
this.cb_2=create cb_2
this.cb_1=create cb_1
this.st_1=create st_1
this.Control[]={this.cb_c,&
this.cb_2,&
this.cb_1,&
this.st_1}
end on

on w_oig_type.destroy
destroy(this.cb_c)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.st_1)
end on

event open;gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17

end event

type cb_c from commandbutton within w_oig_type
integer x = 1129
integer y = 252
integer width = 288
integer height = 80
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Cancel"
end type

event clicked;is_ret = "C"

Closewithreturn(parent,is_ret)
end event

type cb_2 from commandbutton within w_oig_type
integer x = 681
integer y = 252
integer width = 288
integer height = 80
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Manual"
boolean default = true
end type

event clicked;is_ret = "M"

Closewithreturn(parent,is_ret)
end event

type cb_1 from commandbutton within w_oig_type
integer x = 238
integer y = 252
integer width = 288
integer height = 80
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Automatic"
end type

event clicked;is_ret = "A"

Closewithreturn(parent,is_ret)
end event

type st_1 from statictext within w_oig_type
integer x = 197
integer y = 104
integer width = 1216
integer height = 84
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Select the OIG Process Type"
alignment alignment = center!
boolean focusrectangle = false
end type
