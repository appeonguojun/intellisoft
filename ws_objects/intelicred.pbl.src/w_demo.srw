$PBExportHeader$w_demo.srw
forward
global type w_demo from window
end type
type dw_1 from datawindow within w_demo
end type
type cb_4 from commandbutton within w_demo
end type
type cb_3 from commandbutton within w_demo
end type
type cb_2 from commandbutton within w_demo
end type
type cb_1 from commandbutton within w_demo
end type
end forward

global type w_demo from window
integer x = 823
integer y = 360
integer width = 2318
integer height = 1364
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 15780518
dw_1 dw_1
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
end type
global w_demo w_demo

on w_demo.create
this.dw_1=create dw_1
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.Control[]={this.dw_1,&
this.cb_4,&
this.cb_3,&
this.cb_2,&
this.cb_1}
end on

on w_demo.destroy
destroy(this.dw_1)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
end on

event open;gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17

end event

type dw_1 from datawindow within w_demo
integer x = 338
integer y = 296
integer width = 494
integer height = 360
integer taborder = 20
string dataobject = "d_pd_affil_status_cvo_data"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_4 from commandbutton within w_demo
integer x = 55
integer y = 368
integer width = 2149
integer height = 212
integer taborder = 40
integer textsize = -24
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Sample Screen Shots"
end type

type cb_3 from commandbutton within w_demo
integer x = 55
integer y = 940
integer width = 2153
integer height = 212
integer taborder = 30
integer textsize = -24
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Run PcAnywhere Install"
end type

type cb_2 from commandbutton within w_demo
integer x = 55
integer y = 656
integer width = 2153
integer height = 212
integer taborder = 20
integer textsize = -24
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "View Sample Report"
end type

type cb_1 from commandbutton within w_demo
integer x = 55
integer y = 80
integer width = 2153
integer height = 212
integer taborder = 10
integer textsize = -24
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "View Powerpoint Presentation"
end type

event clicked;String ls_val

ls_val = dw_1.Describe( "custom_4.coltype" )
messagebox("", ls_val)


end event

