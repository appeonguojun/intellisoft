$PBExportHeader$w_icon_select.srw
forward
global type w_icon_select from w_response
end type
type cb_browse from commandbutton within w_icon_select
end type
type cb_cancel from commandbutton within w_icon_select
end type
type cb_ok from commandbutton within w_icon_select
end type
type ddplb_icon from u_picturebutton_icons within w_icon_select
end type
end forward

global type w_icon_select from w_response
integer x = 214
integer y = 221
integer width = 1806
integer height = 304
string title = "Select Icon "
event ue_syscommand pbm_syscommand
cb_browse cb_browse
cb_cancel cb_cancel
cb_ok cb_ok
ddplb_icon ddplb_icon
end type
global w_icon_select w_icon_select

type variables
Long il_pic_id
end variables

event ue_syscommand;If message.wordparm = 61536 Then
	cb_cancel.Trigger Event Clicked()
End If

end event

on w_icon_select.create
int iCurrent
call super::create
this.cb_browse=create cb_browse
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
this.ddplb_icon=create ddplb_icon
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_browse
this.Control[iCurrent+2]=this.cb_cancel
this.Control[iCurrent+3]=this.cb_ok
this.Control[iCurrent+4]=this.ddplb_icon
end on

on w_icon_select.destroy
call super::destroy
destroy(this.cb_browse)
destroy(this.cb_cancel)
destroy(this.cb_ok)
destroy(this.ddplb_icon)
end on

event open;call super::open;String ls_pre_icon
Str_picture lstr_picture

lstr_picture = Message.PowerObjectParm

If lstr_picture.al_pic_id > 0 Then
	il_pic_id = lstr_picture.al_pic_id
Else
	ddplb_icon.text = lstr_picture.as_pic_file
End If

If lstr_picture.ab_support_picture_painter  Then
	cb_browse.visible = True
Else
	cb_browse.visible = False
End If


//Begin - Added By jay 2016-04-14.
If Isnull (lstr_picture.as_support_ico_type) Or Trim(lstr_picture.as_support_ico_type) = '' Or lstr_picture.as_support_ico_type = '1'  Then
	ddplb_icon.Enabled = True
Else
	ddplb_icon.Enabled = False
End If
//End - Added By jay 2016-04-14.


end event

type cb_browse from commandbutton within w_icon_select
integer x = 709
integer y = 72
integer width = 123
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "..."
end type

event clicked;str_picture lstr_picture

lstr_picture.al_pic_id = il_pic_id
lstr_picture.as_type = 'select'

Post Openwithparm(w_picture_painter, lstr_picture)

Close(Parent)

Return


end event

type cb_cancel from commandbutton within w_icon_select
integer x = 1371
integer y = 68
integer width = 343
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Cancel"
end type

event clicked;str_picture lstr_picture

CloseWithReturn(Parent,lstr_picture)


end event

type cb_ok from commandbutton within w_icon_select
integer x = 1015
integer y = 68
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
end type

event clicked;String ls_icon
str_picture lstr_picture

lstr_picture.as_pic_file = ddplb_icon.text

CloseWithReturn(Parent,lstr_picture)
end event

type ddplb_icon from u_picturebutton_icons within w_icon_select
integer x = 55
integer y = 72
integer taborder = 10
end type

