$PBExportHeader$w_sync_confirm.srw
forward
global type w_sync_confirm from w_response
end type
type cbx_alwaysupdate from checkbox within w_sync_confirm
end type
type cb_no from commandbutton within w_sync_confirm
end type
type cb_yes from commandbutton within w_sync_confirm
end type
type st_1 from statictext within w_sync_confirm
end type
type p_question from picture within w_sync_confirm
end type
type st_tip from statictext within w_sync_confirm
end type
end forward

global type w_sync_confirm from w_response
integer width = 1838
integer height = 524
boolean controlmenu = false
long backcolor = 16777215
boolean center = false
cbx_alwaysupdate cbx_alwaysupdate
cb_no cb_no
cb_yes cb_yes
st_1 st_1
p_question p_question
st_tip st_tip
end type
global w_sync_confirm w_sync_confirm

type variables
long	il_AlwaysUpdate

end variables

on w_sync_confirm.create
int iCurrent
call super::create
this.cbx_alwaysupdate=create cbx_alwaysupdate
this.cb_no=create cb_no
this.cb_yes=create cb_yes
this.st_1=create st_1
this.p_question=create p_question
this.st_tip=create st_tip
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cbx_alwaysupdate
this.Control[iCurrent+2]=this.cb_no
this.Control[iCurrent+3]=this.cb_yes
this.Control[iCurrent+4]=this.st_1
this.Control[iCurrent+5]=this.p_question
this.Control[iCurrent+6]=this.st_tip
end on

on w_sync_confirm.destroy
call super::destroy
destroy(this.cbx_alwaysupdate)
destroy(this.cb_no)
destroy(this.cb_yes)
destroy(this.st_1)
destroy(this.p_question)
destroy(this.st_tip)
end on

event open;call super::open;String	ls_Parm,ls_ObjType,ls_Tip

This.Title = "Confirm Sync"
ls_Tip = "Do you want to sync the labels and style to the Contract Contact Window?"

ls_Parm = Message.StringParm
il_AlwaysUpdate = long(ls_Parm)

st_Tip.Text = ls_Tip

if il_AlwaysUpdate = 10 then
	cbx_AlwaysUpdate.Checked = true
else
	cbx_AlwaysUpdate.Checked = false
end if

gf_WinCenter(This)

end event

type cbx_alwaysupdate from checkbox within w_sync_confirm
integer x = 50
integer y = 332
integer width = 421
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "&Always Sync"
end type

event clicked;if This.Checked then
	il_AlwaysUpdate = 10
else
	il_AlwaysUpdate = 0
end if

end event

type cb_no from commandbutton within w_sync_confirm
integer x = 1440
integer y = 320
integer width = 343
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&No"
boolean cancel = true
end type

event clicked;CloseWithReturn(Parent,0 + il_AlwaysUpdate)

end event

type cb_yes from commandbutton within w_sync_confirm
integer x = 1065
integer y = 320
integer width = 343
integer height = 92
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&Yes"
boolean default = true
end type

event clicked;CloseWithReturn(Parent,1 + il_AlwaysUpdate)

end event

type st_1 from statictext within w_sync_confirm
integer y = 280
integer width = 1829
integer height = 168
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

type p_question from picture within w_sync_confirm
integer x = 73
integer y = 68
integer width = 192
integer height = 168
boolean originalsize = true
string picturename = "MsgQuestion.bmp"
boolean focusrectangle = false
boolean map3dcolors = true
end type

type st_tip from statictext within w_sync_confirm
integer x = 302
integer y = 76
integer width = 1440
integer height = 160
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
boolean focusrectangle = false
end type

