$PBExportHeader$w_email_subject.srw
forward
global type w_email_subject from window
end type
type cb_2 from commandbutton within w_email_subject
end type
type cb_1 from commandbutton within w_email_subject
end type
type st_2 from statictext within w_email_subject
end type
type mle_1 from multilineedit within w_email_subject
end type
type st_1 from statictext within w_email_subject
end type
type sle_1 from singlelineedit within w_email_subject
end type
end forward

global type w_email_subject from window
integer x = 425
integer y = 368
integer width = 2290
integer height = 1536
boolean titlebar = true
string title = "Email"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 79741120
cb_2 cb_2
cb_1 cb_1
st_2 st_2
mle_1 mle_1
st_1 st_1
sle_1 sle_1
end type
global w_email_subject w_email_subject

on w_email_subject.create
this.cb_2=create cb_2
this.cb_1=create cb_1
this.st_2=create st_2
this.mle_1=create mle_1
this.st_1=create st_1
this.sle_1=create sle_1
this.Control[]={this.cb_2,&
this.cb_1,&
this.st_2,&
this.mle_1,&
this.st_1,&
this.sle_1}
end on

on w_email_subject.destroy
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.st_2)
destroy(this.mle_1)
destroy(this.st_1)
destroy(this.sle_1)
end on

event open;sle_1.SetFocus()
gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17

end event

type cb_2 from commandbutton within w_email_subject
integer x = 1929
integer y = 1280
integer width = 247
integer height = 108
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Cancel"
boolean cancel = true
end type

event clicked;CloseWithReturn( Parent, "Cancel" )
end event

type cb_1 from commandbutton within w_email_subject
integer x = 1655
integer y = 1280
integer width = 247
integer height = 108
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Ok"
boolean default = true
end type

event clicked;CloseWithReturn( Parent, sle_1.Text + "*" + mle_1.Text )
end event

type st_2 from statictext within w_email_subject
integer x = 64
integer y = 268
integer width = 247
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Note:"
boolean focusrectangle = false
end type

type mle_1 from multilineedit within w_email_subject
integer x = 64
integer y = 332
integer width = 2112
integer height = 908
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_email_subject
integer y = 48
integer width = 247
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Subject:"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_1 from singlelineedit within w_email_subject
integer x = 69
integer y = 120
integer width = 2103
integer height = 92
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

