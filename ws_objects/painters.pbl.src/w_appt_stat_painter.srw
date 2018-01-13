$PBExportHeader$w_appt_stat_painter.srw
forward
global type w_appt_stat_painter from window
end type
type cb_close from commandbutton within w_appt_stat_painter
end type
type cb_1 from commandbutton within w_appt_stat_painter
end type
type dw_1 from datawindow within w_appt_stat_painter
end type
end forward

global type w_appt_stat_painter from window
integer x = 1189
integer y = 556
integer width = 2341
integer height = 1844
boolean titlebar = true
string title = "Appointment Status Label Painter"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
cb_close cb_close
cb_1 cb_1
dw_1 dw_1
end type
global w_appt_stat_painter w_appt_stat_painter

event open;dw_1.settransobject(sqlca)
dw_1.retrieve()

gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17

end event

on w_appt_stat_painter.create
this.cb_close=create cb_close
this.cb_1=create cb_1
this.dw_1=create dw_1
this.Control[]={this.cb_close,&
this.cb_1,&
this.dw_1}
end on

on w_appt_stat_painter.destroy
destroy(this.cb_close)
destroy(this.cb_1)
destroy(this.dw_1)
end on

type cb_close from commandbutton within w_appt_stat_painter
integer x = 1989
integer y = 24
integer width = 247
integer height = 84
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Close"
end type

event clicked;close(parent)
end event

type cb_1 from commandbutton within w_appt_stat_painter
integer x = 1710
integer y = 24
integer width = 247
integer height = 84
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Save"
end type

event clicked;dw_1.update()
end event

type dw_1 from datawindow within w_appt_stat_painter
integer x = 41
integer y = 128
integer width = 2194
integer height = 1480
integer taborder = 10
string dataobject = "d_affil_stat_painter"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

