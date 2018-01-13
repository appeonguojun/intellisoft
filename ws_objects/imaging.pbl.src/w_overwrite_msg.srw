$PBExportHeader$w_overwrite_msg.srw
forward
global type w_overwrite_msg from window
end type
type cb_cancel from commandbutton within w_overwrite_msg
end type
type st_1 from statictext within w_overwrite_msg
end type
type cb_append from commandbutton within w_overwrite_msg
end type
type cb_overwrite from commandbutton within w_overwrite_msg
end type
end forward

global type w_overwrite_msg from window
integer x = 663
integer y = 540
integer width = 2331
integer height = 528
boolean titlebar = true
string title = "Scan Image"
windowtype windowtype = response!
long backcolor = 79741120
cb_cancel cb_cancel
st_1 st_1
cb_append cb_append
cb_overwrite cb_overwrite
end type
global w_overwrite_msg w_overwrite_msg

on w_overwrite_msg.create
this.cb_cancel=create cb_cancel
this.st_1=create st_1
this.cb_append=create cb_append
this.cb_overwrite=create cb_overwrite
this.Control[]={this.cb_cancel,&
this.st_1,&
this.cb_append,&
this.cb_overwrite}
end on

on w_overwrite_msg.destroy
destroy(this.cb_cancel)
destroy(this.st_1)
destroy(this.cb_append)
destroy(this.cb_overwrite)
end on

event open;gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17

end event

type cb_cancel from commandbutton within w_overwrite_msg
integer x = 1746
integer y = 236
integer width = 475
integer height = 84
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Cancel"
boolean cancel = true
end type

event clicked;CloseWithReturn( Parent, "C" )
end event

type st_1 from statictext within w_overwrite_msg
integer x = 306
integer y = 72
integer width = 1650
integer height = 88
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "A previously scanned image exists for this record .  "
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_append from commandbutton within w_overwrite_msg
integer x = 590
integer y = 236
integer width = 1125
integer height = 84
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Append and make current image a history image."
end type

event clicked;CloseWithReturn( Parent, "A" )
end event

type cb_overwrite from commandbutton within w_overwrite_msg
integer x = 78
integer y = 236
integer width = 475
integer height = 84
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Overwrite"
boolean default = true
end type

event clicked;CloseWithReturn( Parent, "O" )
end event

