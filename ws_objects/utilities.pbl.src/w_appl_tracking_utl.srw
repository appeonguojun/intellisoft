﻿$PBExportHeader$w_appl_tracking_utl.srw
forward
global type w_appl_tracking_utl from window
end type
type cb_export from commandbutton within w_appl_tracking_utl
end type
type cb_print from commandbutton within w_appl_tracking_utl
end type
type cb_sort from commandbutton within w_appl_tracking_utl
end type
type cb_filter from commandbutton within w_appl_tracking_utl
end type
type cb_close from commandbutton within w_appl_tracking_utl
end type
type dw_1 from datawindow within w_appl_tracking_utl
end type
end forward

global type w_appl_tracking_utl from window
integer width = 2661
integer height = 2124
boolean titlebar = true
string title = "Application Modifications"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_export cb_export
cb_print cb_print
cb_sort cb_sort
cb_filter cb_filter
cb_close cb_close
dw_1 dw_1
end type
global w_appl_tracking_utl w_appl_tracking_utl

on w_appl_tracking_utl.create
this.cb_export=create cb_export
this.cb_print=create cb_print
this.cb_sort=create cb_sort
this.cb_filter=create cb_filter
this.cb_close=create cb_close
this.dw_1=create dw_1
this.Control[]={this.cb_export,&
this.cb_print,&
this.cb_sort,&
this.cb_filter,&
this.cb_close,&
this.dw_1}
end on

on w_appl_tracking_utl.destroy
destroy(this.cb_export)
destroy(this.cb_print)
destroy(this.cb_sort)
destroy(this.cb_filter)
destroy(this.cb_close)
destroy(this.dw_1)
end on

event open;dw_1.settransobject(sqlca)
dw_1.retrieve()

gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17

end event

type cb_export from commandbutton within w_appl_tracking_utl
integer x = 805
integer y = 32
integer width = 343
integer height = 84
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Export"
end type

event clicked;dw_1.saveas()
	//restore Directory  
//added by nova 2008-04-29
ChangeDirectory ( gs_dir_path )
end event

type cb_print from commandbutton within w_appl_tracking_utl
integer x = 1161
integer y = 32
integer width = 343
integer height = 84
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Print"
end type

event clicked;dw_1.print()
end event

type cb_sort from commandbutton within w_appl_tracking_utl
integer x = 1522
integer y = 32
integer width = 343
integer height = 84
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Sort"
end type

event clicked;string null_str

SetNull(null_str)

dw_1.SetSort(null_str)

dw_1.Sort( )
end event

type cb_filter from commandbutton within w_appl_tracking_utl
integer x = 1879
integer y = 32
integer width = 343
integer height = 84
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Filter"
end type

event clicked;string null_str

SetNull(null_str)

dw_1.Setfilter(null_str)

dw_1.filter( )
end event

type cb_close from commandbutton within w_appl_tracking_utl
integer x = 2235
integer y = 32
integer width = 343
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

event clicked;Close (Parent)
end event

type dw_1 from datawindow within w_appl_tracking_utl
integer x = 73
integer y = 148
integer width = 2505
integer height = 1808
integer taborder = 10
string title = "none"
string dataobject = "d_app_hdr_audit"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type
