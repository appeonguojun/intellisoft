$PBExportHeader$w_get_email_address_message.srw
forward
global type w_get_email_address_message from w_email_subject
end type
type dw_email from datawindow within w_get_email_address_message
end type
type cb_3 from commandbutton within w_get_email_address_message
end type
type cb_4 from commandbutton within w_get_email_address_message
end type
type sle_subject from singlelineedit within w_get_email_address_message
end type
type st_3 from statictext within w_get_email_address_message
end type
end forward

global type w_get_email_address_message from w_email_subject
integer width = 2267
integer height = 1804
dw_email dw_email
cb_3 cb_3
cb_4 cb_4
sle_subject sle_subject
st_3 st_3
end type
global w_get_email_address_message w_get_email_address_message

on w_get_email_address_message.create
int iCurrent
call super::create
this.dw_email=create dw_email
this.cb_3=create cb_3
this.cb_4=create cb_4
this.sle_subject=create sle_subject
this.st_3=create st_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_email
this.Control[iCurrent+2]=this.cb_3
this.Control[iCurrent+3]=this.cb_4
this.Control[iCurrent+4]=this.sle_subject
this.Control[iCurrent+5]=this.st_3
end on

on w_get_email_address_message.destroy
call super::destroy
destroy(this.dw_email)
destroy(this.cb_3)
destroy(this.cb_4)
destroy(this.sle_subject)
destroy(this.st_3)
end on

type cb_2 from w_email_subject`cb_2 within w_get_email_address_message
integer x = 1637
integer y = 1568
integer height = 84
integer taborder = 50
string text = "&Cancel"
end type

type cb_1 from w_email_subject`cb_1 within w_get_email_address_message
integer x = 1358
integer y = 1568
integer height = 84
integer taborder = 40
string text = "&Ok"
boolean default = false
end type

event cb_1::clicked;IF IsNull( dw_email.GetText() ) THEN
	MessageBox("Invalid Email", "Invalid Email Entered." )
	Return -1
END IF
IF IsNull( mle_1.Text ) or mle_1.Text = "" THEN
	MessageBox("No Message", "Please enter a message." )
	Return -1
END IF
CloseWithReturn( Parent, dw_email.GetText() + "*" + mle_1.Text + "**" + sle_subject.text)
end event

type st_2 from w_email_subject`st_2 within w_get_email_address_message
integer x = 69
integer y = 400
integer height = 64
string text = "Message"
end type

type mle_1 from w_email_subject`mle_1 within w_get_email_address_message
integer x = 69
integer y = 476
integer height = 1044
end type

type st_1 from w_email_subject`st_1 within w_get_email_address_message
integer x = 69
integer y = 52
integer width = 311
integer height = 60
string text = "Send To"
alignment alignment = left!
end type

type sle_1 from w_email_subject`sle_1 within w_get_email_address_message
boolean visible = false
integer x = 64
integer y = 1256
end type

type dw_email from datawindow within w_get_email_address_message
integer x = 64
integer y = 116
integer width = 1838
integer height = 124
integer taborder = 30
boolean bringtotop = true
string dataobject = "d_get_email"
boolean border = false
boolean livescroll = true
end type

event constructor;This.SetTransObject( sqlca )
This.InsertRow( 1 )
end event

type cb_3 from commandbutton within w_get_email_address_message
integer x = 1906
integer y = 120
integer width = 238
integer height = 84
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Add"
boolean cancel = true
end type

event clicked;string mes

Open( w_add_email_contact_info )
IF Message.StringParm = "Cancel" THEN
	Return 
ELSE
	mes = Message.StringParm
	//dw_email.retrieve()
	//dw_email.insertrow(1)
	dw_email.SetItem( 1, "email", Message.StringParm )
	
END IF
end event

type cb_4 from commandbutton within w_get_email_address_message
integer x = 1920
integer y = 1568
integer width = 247
integer height = 84
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Help"
boolean cancel = true
end type

event clicked;MessageBox("Help", "To Edit or Delete an email go to the Lookup Painter and Select the Email Contacts lookup type.")
end event

type sle_subject from singlelineedit within w_get_email_address_message
integer x = 64
integer y = 284
integer width = 1810
integer height = 92
integer taborder = 70
boolean bringtotop = true
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

type st_3 from statictext within w_get_email_address_message
integer x = 73
integer y = 220
integer width = 247
integer height = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Subject"
boolean focusrectangle = false
end type

