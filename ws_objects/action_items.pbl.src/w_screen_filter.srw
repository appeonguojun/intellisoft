$PBExportHeader$w_screen_filter.srw
$PBExportComments$not used 8-03
forward
global type w_screen_filter from window
end type
type cb_2 from commandbutton within w_screen_filter
end type
type cb_1 from commandbutton within w_screen_filter
end type
type dw_1 from datawindow within w_screen_filter
end type
end forward

global type w_screen_filter from window
integer x = 1056
integer y = 484
integer width = 965
integer height = 580
boolean titlebar = true
string title = "Screen Filter"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
end type
global w_screen_filter w_screen_filter

type variables
integer ii_screen
end variables

on w_screen_filter.create
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
this.Control[]={this.cb_2,&
this.cb_1,&
this.dw_1}
end on

on w_screen_filter.destroy
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
end on

event open;dw_1.settransobject(sqlca)
dw_1.retrieve()
dw_1.insertrow(1)
gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17

end event

type cb_2 from commandbutton within w_screen_filter
integer x = 480
integer y = 228
integer width = 201
integer height = 84
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Cancel"
end type

event clicked;closewithreturn(parent,-1)
end event

type cb_1 from commandbutton within w_screen_filter
integer x = 206
integer y = 228
integer width = 247
integer height = 84
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&OK"
end type

event clicked;closewithreturn(parent,ii_screen)
end event

type dw_1 from datawindow within w_screen_filter
integer x = 55
integer y = 68
integer width = 846
integer height = 108
integer taborder = 10
string dataobject = "d_select_screen_name"
boolean border = false
boolean livescroll = true
end type

event itemchanged;ii_screen = integer(data)
end event

