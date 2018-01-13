$PBExportHeader$w_open_message.srw
forward
global type w_open_message from window
end type
type st_1 from statictext within w_open_message
end type
end forward

global type w_open_message from window
integer width = 1952
integer height = 892
boolean titlebar = true
string title = "Opening"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_1 st_1
end type
global w_open_message w_open_message

on w_open_message.create
this.st_1=create st_1
this.Control[]={this.st_1}
end on

on w_open_message.destroy
destroy(this.st_1)
end on

event open;gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17

end event

type st_1 from statictext within w_open_message
integer x = 274
integer y = 316
integer width = 1335
integer height = 144
integer textsize = -18
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "Getting Data Caches"
alignment alignment = center!
boolean focusrectangle = false
end type

