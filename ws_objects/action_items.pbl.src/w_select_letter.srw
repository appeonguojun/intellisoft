$PBExportHeader$w_select_letter.srw
forward
global type w_select_letter from window
end type
type cb_2 from commandbutton within w_select_letter
end type
type cb_1 from commandbutton within w_select_letter
end type
type dw_1 from datawindow within w_select_letter
end type
end forward

global type w_select_letter from window
integer x = 1038
integer y = 952
integer width = 1134
integer height = 616
boolean titlebar = true
string title = "Select Letter Name"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 79680469
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
end type
global w_select_letter w_select_letter

type variables
string is_name
end variables

on w_select_letter.create
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
this.Control[]={this.cb_2,&
this.cb_1,&
this.dw_1}
end on

on w_select_letter.destroy
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
end on

event open;dw_1.settransobject(sqlca)

//--------------------------- APPEON BEGIN ---------------------------
//$<comment> 08.28.2006 By: LeiWei
//$<reason> Fix a defect.
//dw_1.retrieve()
//---------------------------- APPEON END ----------------------------

dw_1.insertrow(1)

gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17

end event

type cb_2 from commandbutton within w_select_letter
integer x = 571
integer y = 228
integer width = 247
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

event clicked;closewithreturn(parent,"C")
end event

type cb_1 from commandbutton within w_select_letter
integer x = 293
integer y = 228
integer width = 247
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

event clicked;closewithreturn(parent,is_name)
end event

type dw_1 from datawindow within w_select_letter
integer x = 123
integer y = 92
integer width = 905
integer height = 88
integer taborder = 10
string dataobject = "d_letter_selection"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;is_name = data

//messagebox("",is_name)
end event

