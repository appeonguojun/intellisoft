﻿$PBExportHeader$w_cascadeupdateconfirm.srw
forward
global type w_cascadeupdateconfirm from w_response
end type
type cbx_alwaysupdate from checkbox within w_cascadeupdateconfirm
end type
type cb_no from commandbutton within w_cascadeupdateconfirm
end type
type cb_yes from commandbutton within w_cascadeupdateconfirm
end type
type st_1 from statictext within w_cascadeupdateconfirm
end type
type p_question from picture within w_cascadeupdateconfirm
end type
type st_tip from statictext within w_cascadeupdateconfirm
end type
end forward

global type w_cascadeupdateconfirm from w_response
integer x = 214
integer y = 221
integer width = 1952
integer height = 644
boolean controlmenu = false
long backcolor = 16777215
cbx_alwaysupdate cbx_alwaysupdate
cb_no cb_no
cb_yes cb_yes
st_1 st_1
p_question p_question
st_tip st_tip
end type
global w_cascadeupdateconfirm w_cascadeupdateconfirm

type variables
long	il_AlwaysUpdate

end variables

on w_cascadeupdateconfirm.create
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

on w_cascadeupdateconfirm.destroy
call super::destroy
destroy(this.cbx_alwaysupdate)
destroy(this.cb_no)
destroy(this.cb_yes)
destroy(this.st_1)
destroy(this.p_question)
destroy(this.st_tip)
end on

event open;call super::open;String	ls_Parm,ls_ObjType,ls_Tip

This.Title = gnv_app.iapp_object.DisplayName
ls_Tip = "also exists on the Criteria and Browse screen of the Search tab.~r~n~r~nWould you like to update these screens with your new property settings?"

ls_Parm = Message.StringParm
il_AlwaysUpdate = long(Left(ls_Parm,Pos(ls_Parm,",") - 1))

//Modified By Ken.Guo 2016-04-14
//ls_ObjType = Mid(ls_Parm,Pos(ls_Parm,",") + 1)
String ls_object_name
ls_ObjType = Mid(ls_Parm,Pos(ls_Parm,",") + 1, 1 )
ls_object_name = Mid(ls_Parm,Pos(ls_Parm,",") + 3 )
If ls_object_name <> '' Then
	This.title = 'Update Field - ' +  ls_object_name
Else
	This.title = 'Update Field'
End If

if ls_ObjType = "c" then
	st_Tip.Text = "This field " + ls_Tip
else
	st_Tip.Text = "This text " + ls_Tip
end if

if il_AlwaysUpdate = 10 then
	cbx_AlwaysUpdate.Checked = true
else
	cbx_AlwaysUpdate.Checked = false
end if



//gf_WinCenter(This) //Commented By Ken.Guo 2016-04-14

end event

type cbx_alwaysupdate from checkbox within w_cascadeupdateconfirm
integer x = 50
integer y = 448
integer width = 1129
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = " &Remember my choice and do not ask me again"
end type

event clicked;if This.Checked then
	il_AlwaysUpdate = 10
else
	il_AlwaysUpdate = 0
end if

end event

type cb_no from commandbutton within w_cascadeupdateconfirm
integer x = 1545
integer y = 436
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

type cb_yes from commandbutton within w_cascadeupdateconfirm
integer x = 1193
integer y = 436
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

type st_1 from statictext within w_cascadeupdateconfirm
integer y = 412
integer width = 2062
integer height = 200
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

type p_question from picture within w_cascadeupdateconfirm
integer x = 73
integer y = 60
integer width = 192
integer height = 168
boolean originalsize = true
string picturename = "MsgQuestion.bmp"
boolean focusrectangle = false
boolean map3dcolors = true
end type

type st_tip from statictext within w_cascadeupdateconfirm
integer x = 302
integer y = 76
integer width = 1582
integer height = 308
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
