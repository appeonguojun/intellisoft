$PBExportHeader$w_null_value.srw
forward
global type w_null_value from window
end type
type st_1 from statictext within w_null_value
end type
type cb_2 from commandbutton within w_null_value
end type
type cb_1 from commandbutton within w_null_value
end type
end forward

global type w_null_value from window
integer x = 823
integer y = 360
integer width = 887
integer height = 560
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
st_1 st_1
cb_2 cb_2
cb_1 cb_1
end type
global w_null_value w_null_value

on w_null_value.create
this.st_1=create st_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.Control[]={this.st_1,&
this.cb_2,&
this.cb_1}
end on

on w_null_value.destroy
destroy(this.st_1)
destroy(this.cb_2)
destroy(this.cb_1)
end on

event open;gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17

end event

type st_1 from statictext within w_null_value
integer x = 133
integer y = 64
integer width = 672
integer height = 120
integer textsize = -14
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Set value null?"
boolean focusrectangle = false
end type

type cb_2 from commandbutton within w_null_value
integer x = 457
integer y = 276
integer width = 247
integer height = 108
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Cancel"
end type

event clicked;closewithreturn(parent,0)
end event

type cb_1 from commandbutton within w_null_value
integer x = 119
integer y = 276
integer width = 247
integer height = 108
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Yes"
end type

event clicked;integer col

col = message.doubleparm




closewithreturn(parent,1)
end event

