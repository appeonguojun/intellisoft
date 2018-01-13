$PBExportHeader$w_master_password.srw
forward
global type w_master_password from window
end type
type cb_cp from commandbutton within w_master_password
end type
type st_1 from statictext within w_master_password
end type
type cb_close from commandbutton within w_master_password
end type
type em_1 from editmask within w_master_password
end type
type sle_2 from singlelineedit within w_master_password
end type
type cb_go from commandbutton within w_master_password
end type
type gb_1 from groupbox within w_master_password
end type
end forward

global type w_master_password from window
integer width = 1422
integer height = 412
boolean titlebar = true
string title = "Today~'s Password"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 80269524
string icon = "AppIcon!"
boolean center = true
cb_cp cb_cp
st_1 st_1
cb_close cb_close
em_1 em_1
sle_2 sle_2
cb_go cb_go
gb_1 gb_1
end type
global w_master_password w_master_password

on w_master_password.create
this.cb_cp=create cb_cp
this.st_1=create st_1
this.cb_close=create cb_close
this.em_1=create em_1
this.sle_2=create sle_2
this.cb_go=create cb_go
this.gb_1=create gb_1
this.Control[]={this.cb_cp,&
this.st_1,&
this.cb_close,&
this.em_1,&
this.sle_2,&
this.cb_go,&
this.gb_1}
end on

on w_master_password.destroy
destroy(this.cb_cp)
destroy(this.st_1)
destroy(this.cb_close)
destroy(this.em_1)
destroy(this.sle_2)
destroy(this.cb_go)
destroy(this.gb_1)
end on

event open;
if gi_test_mode = 1 then
	em_1.visible = true
	cb_go.visible = true
end if

//em_1.text = string(today())		//Added By Mark Lee 09/16/2013
em_1.text = string(Date(f_get_server_dtm()))
cb_go.triggerevent(clicked!)

gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17

end event

type cb_cp from commandbutton within w_master_password
integer x = 571
integer y = 116
integer width = 343
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Clipboard"
end type

event clicked;clipboard(sle_2.text)
end event

type st_1 from statictext within w_master_password
integer x = 3794
integer y = 48
integer width = 78
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 15780518
boolean focusrectangle = false
end type

event clicked;em_1.visible = true
cb_go.visible = true
end event

type cb_close from commandbutton within w_master_password
integer x = 933
integer y = 116
integer width = 343
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Close"
boolean cancel = true
boolean default = true
end type

event clicked;close(parent)
end event

type em_1 from editmask within w_master_password
boolean visible = false
integer x = 1390
integer y = 464
integer width = 343
integer height = 92
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
end type

type sle_2 from singlelineedit within w_master_password
integer x = 82
integer y = 116
integer width = 448
integer height = 100
integer taborder = 20
integer textsize = -16
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Times New Roman"
long textcolor = 33554432
long backcolor = 16777215
string text = "OOOOOOOO"
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type cb_go from commandbutton within w_master_password
boolean visible = false
integer x = 379
integer y = 372
integer width = 343
integer height = 92
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Go"
end type

event clicked;date 	ld_em

em_1.getdata(ld_em)		//Added By Mark Lee 10/24/2013

sle_2.text = left(of_day_password(ld_em),6)
end event

type gb_1 from groupbox within w_master_password
integer x = 50
integer y = 36
integer width = 1285
integer height = 236
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Password for Master User"
end type

