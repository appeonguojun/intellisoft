$PBExportHeader$w_feature_checking.srw
forward
global type w_feature_checking from w_master
end type
type cb_refresh from commandbutton within w_feature_checking
end type
type cb_register from commandbutton within w_feature_checking
end type
type cb_cancel from commandbutton within w_feature_checking
end type
type cb_ok from commandbutton within w_feature_checking
end type
type dw_1 from datawindow within w_feature_checking
end type
type st_7 from statictext within w_feature_checking
end type
type gb_1 from groupbox within w_feature_checking
end type
end forward

global type w_feature_checking from w_master
integer width = 3191
integer height = 1480
string title = "Feature Checking"
boolean maxbox = false
boolean resizable = false
boolean center = true
cb_refresh cb_refresh
cb_register cb_register
cb_cancel cb_cancel
cb_ok cb_ok
dw_1 dw_1
st_7 st_7
gb_1 gb_1
end type
global w_feature_checking w_feature_checking

on w_feature_checking.create
int iCurrent
call super::create
this.cb_refresh=create cb_refresh
this.cb_register=create cb_register
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
this.dw_1=create dw_1
this.st_7=create st_7
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_refresh
this.Control[iCurrent+2]=this.cb_register
this.Control[iCurrent+3]=this.cb_cancel
this.Control[iCurrent+4]=this.cb_ok
this.Control[iCurrent+5]=this.dw_1
this.Control[iCurrent+6]=this.st_7
this.Control[iCurrent+7]=this.gb_1
end on

on w_feature_checking.destroy
call super::destroy
destroy(this.cb_refresh)
destroy(this.cb_register)
destroy(this.cb_cancel)
destroy(this.cb_ok)
destroy(this.dw_1)
destroy(this.st_7)
destroy(this.gb_1)
end on

type cb_refresh from commandbutton within w_feature_checking
integer x = 649
integer y = 1252
integer width = 343
integer height = 92
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Refresh"
end type

type cb_register from commandbutton within w_feature_checking
integer x = 41
integer y = 1252
integer width = 571
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Manually Register OCX"
end type

type cb_cancel from commandbutton within w_feature_checking
integer x = 2766
integer y = 1252
integer width = 343
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Cancel"
end type

type cb_ok from commandbutton within w_feature_checking
integer x = 2391
integer y = 1252
integer width = 343
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&OK"
end type

type dw_1 from datawindow within w_feature_checking
integer x = 64
integer y = 208
integer width = 3040
integer height = 940
integer taborder = 20
string title = "none"
string dataobject = "d_ocx_checking"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_7 from statictext within w_feature_checking
integer x = 69
integer y = 44
integer width = 366
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "OS Login user:"
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_feature_checking
integer x = 27
integer y = 136
integer width = 3118
integer height = 1056
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Software/OCX Status"
end type

