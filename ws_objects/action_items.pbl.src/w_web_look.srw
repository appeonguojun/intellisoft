$PBExportHeader$w_web_look.srw
forward
global type w_web_look from window
end type
type d_1 from datawindow within w_web_look
end type
end forward

global type w_web_look from window
integer x = 823
integer y = 360
integer width = 3506
integer height = 2008
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 16777215
d_1 d_1
end type
global w_web_look w_web_look

on w_web_look.create
this.d_1=create d_1
this.Control[]={this.d_1}
end on

on w_web_look.destroy
destroy(this.d_1)
end on

event open;gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17

end event

type d_1 from datawindow within w_web_look
integer width = 3424
integer height = 1860
integer taborder = 10
string dataobject = "d_web_blue"
boolean border = false
boolean livescroll = true
end type

