$PBExportHeader$w_dm_checkout_compare.srw
forward
global type w_dm_checkout_compare from w_response
end type
type cbx_4 from checkbox within w_dm_checkout_compare
end type
type cbx_3 from checkbox within w_dm_checkout_compare
end type
type cbx_2 from checkbox within w_dm_checkout_compare
end type
type cbx_1 from checkbox within w_dm_checkout_compare
end type
type cb_4 from commandbutton within w_dm_checkout_compare
end type
type cb_3 from commandbutton within w_dm_checkout_compare
end type
type gb_1 from groupbox within w_dm_checkout_compare
end type
end forward

global type w_dm_checkout_compare from w_response
integer width = 1102
integer height = 772
string title = "Check Out"
cbx_4 cbx_4
cbx_3 cbx_3
cbx_2 cbx_2
cbx_1 cbx_1
cb_4 cb_4
cb_3 cb_3
gb_1 gb_1
end type
global w_dm_checkout_compare w_dm_checkout_compare

type variables
str_add_doc istr_add_doc
end variables

on w_dm_checkout_compare.create
int iCurrent
call super::create
this.cbx_4=create cbx_4
this.cbx_3=create cbx_3
this.cbx_2=create cbx_2
this.cbx_1=create cbx_1
this.cb_4=create cb_4
this.cb_3=create cb_3
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cbx_4
this.Control[iCurrent+2]=this.cbx_3
this.Control[iCurrent+3]=this.cbx_2
this.Control[iCurrent+4]=this.cbx_1
this.Control[iCurrent+5]=this.cb_4
this.Control[iCurrent+6]=this.cb_3
this.Control[iCurrent+7]=this.gb_1
end on

on w_dm_checkout_compare.destroy
call super::destroy
destroy(this.cbx_4)
destroy(this.cbx_3)
destroy(this.cbx_2)
destroy(this.cbx_1)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.gb_1)
end on

event open;call super::open;string ls_parm

ls_parm = message.stringparm
if ls_parm = 'E' then
	this.title = 'Email'
else
	this.title = 'Check Out'
end if
end event

type cbx_4 from checkbox within w_dm_checkout_compare
integer x = 64
integer y = 404
integer width = 992
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Compared Document Converted into PDF"
end type

type cbx_3 from checkbox within w_dm_checkout_compare
integer x = 64
integer y = 304
integer width = 841
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Compared Document"
boolean checked = true
end type

type cbx_2 from checkbox within w_dm_checkout_compare
integer x = 64
integer y = 204
integer width = 841
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Revised Document"
end type

type cbx_1 from checkbox within w_dm_checkout_compare
integer x = 64
integer y = 104
integer width = 841
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Original Document"
end type

type cb_4 from commandbutton within w_dm_checkout_compare
integer x = 695
integer y = 568
integer width = 315
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Cancel"
boolean cancel = true
end type

event clicked;close(parent)
end event

type cb_3 from commandbutton within w_dm_checkout_compare
integer x = 91
integer y = 568
integer width = 315
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&OK"
boolean default = true
end type

event clicked;str_choose_compare_doc lstr_compare

if cbx_1.checked then
	lstr_compare.ib_original = true
end if

if cbx_2.checked then
	lstr_compare.ib_revised = true
end if

if cbx_3.checked then
	lstr_compare.ib_compare_doc = true
end if

if cbx_4.checked then
	lstr_compare.ib_compare_pdf = true
end if

CloseWithReturn(Parent, lstr_compare)

end event

type gb_1 from groupbox within w_dm_checkout_compare
integer x = 23
integer y = 12
integer width = 1042
integer height = 520
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Choose Document"
end type

