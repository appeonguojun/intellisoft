$PBExportHeader$w_exp_letter_painter.srw
forward
global type w_exp_letter_painter from w_response
end type
type dw_1 from u_dw within w_exp_letter_painter
end type
type cb_1 from commandbutton within w_exp_letter_painter
end type
type cb_2 from commandbutton within w_exp_letter_painter
end type
end forward

global type w_exp_letter_painter from w_response
integer x = 773
integer y = 544
integer width = 2025
integer height = 1072
string title = "Expiring Letter Settings"
long backcolor = 81324524
dw_1 dw_1
cb_1 cb_1
cb_2 cb_2
end type
global w_exp_letter_painter w_exp_letter_painter

on w_exp_letter_painter.create
int iCurrent
call super::create
this.dw_1=create dw_1
this.cb_1=create cb_1
this.cb_2=create cb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
this.Control[iCurrent+2]=this.cb_1
this.Control[iCurrent+3]=this.cb_2
end on

on w_exp_letter_painter.destroy
call super::destroy
destroy(this.dw_1)
destroy(this.cb_1)
destroy(this.cb_2)
end on

type dw_1 from u_dw within w_exp_letter_painter
integer x = 37
integer y = 48
integer width = 1906
integer height = 748
integer taborder = 10
boolean bringtotop = true
string dataobject = "d_exp_letter_painter"
end type

event constructor;call super::constructor;This.SetTransObject( SQLCA )
This.Retrieve( )
end event

type cb_1 from commandbutton within w_exp_letter_painter
integer x = 1385
integer y = 812
integer width = 274
integer height = 88
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&OK"
end type

event clicked;Parent.Event pfc_Save()

Close( Parent)
end event

type cb_2 from commandbutton within w_exp_letter_painter
integer x = 1682
integer y = 812
integer width = 274
integer height = 84
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Cancel"
end type

event clicked;Close( Parent )
end event

