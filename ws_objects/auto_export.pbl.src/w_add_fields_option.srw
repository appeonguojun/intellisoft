$PBExportHeader$w_add_fields_option.srw
forward
global type w_add_fields_option from window
end type
type cb_4 from commandbutton within w_add_fields_option
end type
type cb_3 from commandbutton within w_add_fields_option
end type
type rb_2 from radiobutton within w_add_fields_option
end type
type rb_1 from radiobutton within w_add_fields_option
end type
type gb_1 from groupbox within w_add_fields_option
end type
end forward

global type w_add_fields_option from window
integer width = 1001
integer height = 524
boolean titlebar = true
string title = "Add Export Column(s)"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_4 cb_4
cb_3 cb_3
rb_2 rb_2
rb_1 rb_1
gb_1 gb_1
end type
global w_add_fields_option w_add_fields_option

type variables

end variables

on w_add_fields_option.create
this.cb_4=create cb_4
this.cb_3=create cb_3
this.rb_2=create rb_2
this.rb_1=create rb_1
this.gb_1=create gb_1
this.Control[]={this.cb_4,&
this.cb_3,&
this.rb_2,&
this.rb_1,&
this.gb_1}
end on

on w_add_fields_option.destroy
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.gb_1)
end on

event open;gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17

end event

type cb_4 from commandbutton within w_add_fields_option
integer x = 654
integer y = 324
integer width = 315
integer height = 92
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

event clicked;CloseWithReturn(Parent, '')
end event

type cb_3 from commandbutton within w_add_fields_option
integer x = 334
integer y = 324
integer width = 315
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&OK"
boolean default = true
end type

event clicked;String ls_type

If rb_1.checked Then
	ls_type = 'manual'
End If
If rb_2.checked Then
	ls_type = 'auto'
End If

If ls_type = '' Then
	Messagebox('Add Export Fields Option','Please select an action.')
	Return 
End If

CloseWithReturn(Parent, ls_type)

end event

type rb_2 from radiobutton within w_add_fields_option
integer x = 114
integer y = 180
integer width = 814
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Select From Screen(s)   "
end type

type rb_1 from radiobutton within w_add_fields_option
integer x = 114
integer y = 92
integer width = 805
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Input Manually     "
boolean checked = true
end type

type gb_1 from groupbox within w_add_fields_option
integer x = 27
integer y = 4
integer width = 942
integer height = 296
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
end type

