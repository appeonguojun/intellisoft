$PBExportHeader$w_listen.srw
forward
global type w_listen from window
end type
type cb_1 from commandbutton within w_listen
end type
end forward

global type w_listen from window
integer x = 823
integer y = 360
integer width = 2016
integer height = 1208
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
cb_1 cb_1
end type
global w_listen w_listen

on w_listen.create
this.cb_1=create cb_1
this.Control[]={this.cb_1}
end on

on w_listen.destroy
destroy(this.cb_1)
end on

event open;gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17

end event

type cb_1 from commandbutton within w_listen
integer x = 777
integer y = 356
integer width = 247
integer height = 108
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "none"
end type

event clicked;Integer li_retval
//
//transport mytransport
//
//mytransport = create transport
//mytransport.driver = "WinSock"
//mytransport.application = "iverify"
//
//li_retval = mytransport.Listen()
//
//messagebox("", li_retval)
end event

