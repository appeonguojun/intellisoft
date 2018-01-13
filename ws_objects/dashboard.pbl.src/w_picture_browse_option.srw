$PBExportHeader$w_picture_browse_option.srw
forward
global type w_picture_browse_option from window
end type
type cb_4 from commandbutton within w_picture_browse_option
end type
type cb_3 from commandbutton within w_picture_browse_option
end type
type rb_2 from radiobutton within w_picture_browse_option
end type
type rb_1 from radiobutton within w_picture_browse_option
end type
type gb_1 from groupbox within w_picture_browse_option
end type
end forward

global type w_picture_browse_option from window
integer width = 1115
integer height = 680
boolean titlebar = true
string title = "Browse Picture"
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
global w_picture_browse_option w_picture_browse_option

type variables
string is_old_painter_id
end variables

on w_picture_browse_option.create
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

on w_picture_browse_option.destroy
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.gb_1)
end on

event open;//Added By Jay Chen 12-18-2013
is_old_painter_id = message.stringparm
if long(is_old_painter_id) > 0 then
	rb_2.checked = true
	rb_1.checked = false
else
	rb_2.checked = false
	rb_1.checked = true
end if

gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17

end event

type cb_4 from commandbutton within w_picture_browse_option
integer x = 763
integer y = 440
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

type cb_3 from commandbutton within w_picture_browse_option
integer x = 320
integer y = 440
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
	ls_type = 'system'
End If
If rb_2.checked Then
	ls_type = 'painter'
End If

If ls_type = '' Then
	Messagebox('Browse Picture','Please select an action.')
	Return 
End If

CloseWithReturn(Parent, ls_type)

end event

type rb_2 from radiobutton within w_picture_browse_option
integer x = 201
integer y = 268
integer width = 631
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "From Picture Painter"
end type

type rb_1 from radiobutton within w_picture_browse_option
integer x = 201
integer y = 132
integer width = 631
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "From Local  Picture"
boolean checked = true
end type

type gb_1 from groupbox within w_picture_browse_option
integer x = 27
integer y = 24
integer width = 1051
integer height = 392
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Picture Browse Option"
end type

