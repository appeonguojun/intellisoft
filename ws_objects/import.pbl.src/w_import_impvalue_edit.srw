$PBExportHeader$w_import_impvalue_edit.srw
forward
global type w_import_impvalue_edit from window
end type
type st_1 from statictext within w_import_impvalue_edit
end type
type cb_cancel from commandbutton within w_import_impvalue_edit
end type
type cb_ok from commandbutton within w_import_impvalue_edit
end type
type sle_value from singlelineedit within w_import_impvalue_edit
end type
end forward

global type w_import_impvalue_edit from window
integer width = 1207
integer height = 412
boolean titlebar = true
string title = "Edit"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_1 st_1
cb_cancel cb_cancel
cb_ok cb_ok
sle_value sle_value
end type
global w_import_impvalue_edit w_import_impvalue_edit

type variables
string is_Type
string is_Return = "Cancel!"
end variables

on w_import_impvalue_edit.create
this.st_1=create st_1
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
this.sle_value=create sle_value
this.Control[]={this.st_1,&
this.cb_cancel,&
this.cb_ok,&
this.sle_value}
end on

on w_import_impvalue_edit.destroy
destroy(this.st_1)
destroy(this.cb_cancel)
destroy(this.cb_ok)
destroy(this.sle_value)
end on

event open;string ls_Value
integer li_Pos

// Get window message (Format: TYPE|VALUE)
li_Pos = Pos(Message.StringParm, "|")
is_Type = Left(Message.StringParm, li_Pos - 1)
ls_Value = Right(Message.StringParm, Len(Message.StringParm) - li_Pos)

// Choose case
choose case is_Type
	case "ADD"
		this.Title = "Add"
		
	case "EDIT"
		this.Title = "Edit"
		sle_value.Text = ls_Value
	case else
end choose

gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17

end event

event close;CloseWithReturn(this, is_Return)
end event

type st_1 from statictext within w_import_impvalue_edit
integer x = 27
integer y = 76
integer width = 297
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Import Value:"
boolean focusrectangle = false
end type

type cb_cancel from commandbutton within w_import_impvalue_edit
integer x = 805
integer y = 196
integer width = 343
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Cancel"
boolean cancel = true
end type

event clicked;Close(Parent)
end event

type cb_ok from commandbutton within w_import_impvalue_edit
integer x = 439
integer y = 196
integer width = 343
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

event clicked;if Len(sle_value.Text) > 0 then
	is_Return = sle_value.Text
	Close(Parent)
else
	MessageBox("Prompt", "Please input import value.")
	sle_value.SetFocus()
end if
end event

type sle_value from singlelineedit within w_import_impvalue_edit
integer x = 325
integer y = 56
integer width = 818
integer height = 92
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

