$PBExportHeader$w_sql_msg.srw
forward
global type w_sql_msg from window
end type
type st_len from statictext within w_sql_msg
end type
type cb_3 from commandbutton within w_sql_msg
end type
type cb_2 from commandbutton within w_sql_msg
end type
type cb_1 from commandbutton within w_sql_msg
end type
type mle_1 from multilineedit within w_sql_msg
end type
end forward

global type w_sql_msg from window
integer x = 110
integer y = 36
integer width = 3493
integer height = 2340
boolean titlebar = true
string title = "Syntax"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 79680469
boolean center = true
st_len st_len
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
mle_1 mle_1
end type
global w_sql_msg w_sql_msg

event open;mle_1.Text = Message.StringParm
st_len.text = "Length: " + string (len(Message.StringParm))

if pos(Message.StringParm,"IF THIS IS",1) > 0 then
	this.title = 'Invalid Path Information'
end if

//Start Code Change ----08.05.2008 #V85 maha - message from printletter screen.
if pos(Message.StringParm,"LETTER ERRORS:",1) > 0 then
	this.title = 'Letter Data Errors'
end if
//End Code Change---08.05.2008

gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17
end event

on w_sql_msg.create
this.st_len=create st_len
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.mle_1=create mle_1
this.Control[]={this.st_len,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.mle_1}
end on

on w_sql_msg.destroy
destroy(this.st_len)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.mle_1)
end on

type st_len from statictext within w_sql_msg
integer x = 59
integer y = 2100
integer width = 869
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Length"
boolean focusrectangle = false
end type

type cb_3 from commandbutton within w_sql_msg
boolean visible = false
integer x = 2011
integer y = 2100
integer width = 453
integer height = 84
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Print"
end type

event clicked;long Job

Job = PrintOpen( )
Print(Job, "sql")

mle_1.Print(Job, 1,1)

PrintPage(Job)

PrintClose(Job )
end event

type cb_2 from commandbutton within w_sql_msg
integer x = 2491
integer y = 2100
integer width = 453
integer height = 84
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Place on Clipboard"
end type

event clicked;clipboard(mle_1.text)
end event

type cb_1 from commandbutton within w_sql_msg
integer x = 2976
integer y = 2100
integer width = 453
integer height = 84
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Close"
boolean default = true
end type

event clicked;close(parent)
end event

type mle_1 from multilineedit within w_sql_msg
integer x = 46
integer y = 24
integer width = 3374
integer height = 2024
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean vscrollbar = true
end type

