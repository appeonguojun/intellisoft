﻿$PBExportHeader$w_mle_text.srw
forward
global type w_mle_text from w_response
end type
type cb_1 from commandbutton within w_mle_text
end type
type cb_2 from commandbutton within w_mle_text
end type
type mle_note from multilineedit within w_mle_text
end type
type cb_3 from commandbutton within w_mle_text
end type
type rte_1 from richtextedit within w_mle_text
end type
type cb_4 from commandbutton within w_mle_text
end type
end forward

global type w_mle_text from w_response
integer x = 946
integer y = 432
integer width = 1426
integer height = 1736
boolean controlmenu = false
long backcolor = 80269524
cb_1 cb_1
cb_2 cb_2
mle_note mle_note
cb_3 cb_3
rte_1 rte_1
cb_4 cb_4
end type
global w_mle_text w_mle_text

on w_mle_text.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.cb_2=create cb_2
this.mle_note=create mle_note
this.cb_3=create cb_3
this.rte_1=create rte_1
this.cb_4=create cb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.cb_2
this.Control[iCurrent+3]=this.mle_note
this.Control[iCurrent+4]=this.cb_3
this.Control[iCurrent+5]=this.rte_1
this.Control[iCurrent+6]=this.cb_4
end on

on w_mle_text.destroy
call super::destroy
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.mle_note)
destroy(this.cb_3)
destroy(this.rte_1)
destroy(this.cb_4)
end on

event open;call super::open;string ls_notes, ls_title

ls_notes = Message.StringParm
if left(ls_notes,10) = '$readonly$' then
	cb_1.visible   = false
	cb_3.visible	 = false
	cb_4.visible  = false
	ls_notes = right(ls_notes, len(ls_notes) - 10 )
	mle_note.displayonly = true									//Added By Mark Lee 10/13/2015
	mle_note.backcolor = 67108864							//Added By Mark Lee 10/15/2015
	cb_2.text = "&Close"
end if

if pos(ls_notes, '$<t***>') > 0 and pos(ls_notes, '<t***>$') > 0 then 
	ls_title = mid(ls_notes, pos(ls_notes, '$<t***>') + 7, pos(ls_notes, '<t***>$') - pos(ls_notes, '$<t***>') - 7)
	ls_notes = right(ls_notes, len(ls_notes) - pos(ls_notes, '<t***>$') - 7 + 1  )
	
	this.title = ls_title
end if 
mle_note.Text = ls_notes

//Added By Mark Lee 10/08/2015
mle_note.setfocus( )
end event

type cb_1 from commandbutton within w_mle_text
integer x = 795
integer y = 1524
integer width = 279
integer height = 84
integer taborder = 10
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&OK"
end type

event clicked;
CloseWithReturn( Parent, mle_note.Text )
end event

type cb_2 from commandbutton within w_mle_text
integer x = 1093
integer y = 1524
integer width = 279
integer height = 84
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Cancel"
boolean cancel = true
end type

event clicked;CloseWithReturn( Parent, "Cancel" )
end event

type mle_note from multilineedit within w_mle_text
integer x = 27
integer y = 32
integer width = 1339
integer height = 1464
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 16777215
boolean vscrollbar = true
boolean autovscroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_3 from commandbutton within w_mle_text
integer x = 201
integer y = 1524
integer width = 279
integer height = 84
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Time Stamp"
end type

event clicked;String ls_text
String ls_current_text
String ls_stamp

ls_stamp = String( Today() ) + " " + String( Now( ), "hh:mm")

ls_current_text = mle_note.Text
IF IsNull( ls_current_text ) THEN
	ls_current_text = ""
END IF

ls_text = ls_current_text + ' ' + ls_stamp

mle_note.Text = ls_text

mle_note.SetFocus( )
end event

type rte_1 from richtextedit within w_mle_text
boolean visible = false
integer x = 521
integer y = 1528
integer width = 215
integer height = 140
integer taborder = 30
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
end type

type cb_4 from commandbutton within w_mle_text
integer x = 498
integer y = 1524
integer width = 279
integer height = 84
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Print"
end type

event clicked;//maha app100505 modified
rte_1.SelectTextAll ( )

mle_note.selecttext(1,len(mle_note.text))
mle_note.Copy()
rte_1.Paste( )

rte_1.Print(1, "", FALSE, TRUE)

//
//rte_1.SelectTextAll ( )
//
//mle_note.Clear()
//
//mle_note.Copy()
//
//rte_1.Paste( )
//
//rte_1.Print(1, "", FALSE, TRUE)
end event

