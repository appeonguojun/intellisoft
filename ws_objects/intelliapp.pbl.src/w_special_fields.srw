$PBExportHeader$w_special_fields.srw
forward
global type w_special_fields from w_popup
end type
type rb_small from radiobutton within w_special_fields
end type
type rb_medium from radiobutton within w_special_fields
end type
type rb_large from radiobutton within w_special_fields
end type
type cbx_bold from checkbox within w_special_fields
end type
type gb_1 from groupbox within w_special_fields
end type
type cb_apply from commandbutton within w_special_fields
end type
type cb_close from commandbutton within w_special_fields
end type
type lb_fields from listbox within w_special_fields
end type
end forward

global type w_special_fields from w_popup
integer x = 1120
integer y = 452
integer width = 974
integer height = 1036
string title = "Special Fields"
rb_small rb_small
rb_medium rb_medium
rb_large rb_large
cbx_bold cbx_bold
gb_1 gb_1
cb_apply cb_apply
cb_close cb_close
lb_fields lb_fields
end type
global w_special_fields w_special_fields

type variables
olecustomcontrol io_image_edit

String is_object_name
end variables

on w_special_fields.create
int iCurrent
call super::create
this.rb_small=create rb_small
this.rb_medium=create rb_medium
this.rb_large=create rb_large
this.cbx_bold=create cbx_bold
this.gb_1=create gb_1
this.cb_apply=create cb_apply
this.cb_close=create cb_close
this.lb_fields=create lb_fields
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rb_small
this.Control[iCurrent+2]=this.rb_medium
this.Control[iCurrent+3]=this.rb_large
this.Control[iCurrent+4]=this.cbx_bold
this.Control[iCurrent+5]=this.gb_1
this.Control[iCurrent+6]=this.cb_apply
this.Control[iCurrent+7]=this.cb_close
this.Control[iCurrent+8]=this.lb_fields
end on

on w_special_fields.destroy
call super::destroy
destroy(this.rb_small)
destroy(this.rb_medium)
destroy(this.rb_large)
destroy(this.cbx_bold)
destroy(this.gb_1)
destroy(this.cb_apply)
destroy(this.cb_close)
destroy(this.lb_fields)
end on

event open;call super::open;is_object_name = "Label-" + String( today() ) + String( Now())
end event

type rb_small from radiobutton within w_special_fields
integer x = 82
integer y = 648
integer width = 247
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Small"
end type

type rb_medium from radiobutton within w_special_fields
integer x = 306
integer y = 648
integer width = 270
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Medium"
boolean checked = true
end type

type rb_large from radiobutton within w_special_fields
integer x = 82
integer y = 756
integer width = 247
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Large"
end type

type cbx_bold from checkbox within w_special_fields
integer x = 315
integer y = 752
integer width = 247
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Bold"
end type

type gb_1 from groupbox within w_special_fields
integer x = 55
integer y = 584
integer width = 544
integer height = 272
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "Font"
end type

type cb_apply from commandbutton within w_special_fields
integer x = 640
integer y = 64
integer width = 247
integer height = 84
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&OK"
boolean default = true
end type

event clicked;Integer li_font_type
Integer li_app_id
Integer li_field_id
Integer li_page
Integer li_bold
String ls_type

IF rb_small.Checked THEN
	li_font_type = 1
ELSEIF rb_medium.Checked THEN
	li_font_type = 2
ELSE
	li_font_type = 3
END IF

IF cbx_bold.Checked THEN
	li_bold = 1
ELSE
	li_bold = 0
END IF

w_train_app.of_add_objects( Upper( lb_fields.SelectedItem() ), li_font_type, li_bold )

Close( Parent )
end event

type cb_close from commandbutton within w_special_fields
integer x = 640
integer y = 168
integer width = 247
integer height = 84
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Cancel"
boolean cancel = true
end type

event clicked;close(parent)
end event

type lb_fields from listbox within w_special_fields
integer x = 55
integer y = 64
integer width = 544
integer height = 496
integer taborder = 10
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean vscrollbar = true
string item[] = {"Todays Date","Current Time","User ID"}
borderstyle borderstyle = stylelowered!
end type

