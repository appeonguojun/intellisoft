$PBExportHeader$w_get_field.srw
forward
global type w_get_field from window
end type
type st_1 from statictext within w_get_field
end type
type dw_1 from datawindow within w_get_field
end type
type cb_2 from commandbutton within w_get_field
end type
type cb_1 from commandbutton within w_get_field
end type
end forward

global type w_get_field from window
integer width = 1399
integer height = 608
boolean titlebar = true
string title = "Select Field Name"
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_1 st_1
dw_1 dw_1
cb_2 cb_2
cb_1 cb_1
end type
global w_get_field w_get_field

type variables
string ls_field = "C"
end variables

on w_get_field.create
this.st_1=create st_1
this.dw_1=create dw_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.Control[]={this.st_1,&
this.dw_1,&
this.cb_2,&
this.cb_1}
end on

on w_get_field.destroy
destroy(this.st_1)
destroy(this.dw_1)
destroy(this.cb_2)
destroy(this.cb_1)
end on

event open;dw_1.settransobject(sqlca)
dw_1.retrieve()

gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17

end event

type st_1 from statictext within w_get_field
integer x = 59
integer y = 40
integer width = 1257
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "Select field containing the data to be imported."
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_get_field
integer x = 229
integer y = 148
integer width = 901
integer height = 108
integer taborder = 10
string title = "none"
string dataobject = "d_get_screen_field_name_basic"
boolean border = false
boolean livescroll = true
end type

event itemchanged;ls_field = data
end event

type cb_2 from commandbutton within w_get_field
integer x = 782
integer y = 344
integer width = 343
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

event clicked;closewithreturn(parent,ls_field)
end event

type cb_1 from commandbutton within w_get_field
integer x = 430
integer y = 344
integer width = 343
integer height = 84
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "OK"
end type

event clicked;closewithreturn(parent,ls_field)
end event

