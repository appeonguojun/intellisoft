$PBExportHeader$w_get_record_number.srw
forward
global type w_get_record_number from w_response
end type
type st_1 from statictext within w_get_record_number
end type
type em_rec_no from editmask within w_get_record_number
end type
type cb_ok from commandbutton within w_get_record_number
end type
end forward

global type w_get_record_number from w_response
int X=1134
int Y=700
int Width=1289
int Height=352
boolean TitleBar=true
string Title="Record Number"
boolean ControlMenu=false
st_1 st_1
em_rec_no em_rec_no
cb_ok cb_ok
end type
global w_get_record_number w_get_record_number

event open;call super::open;em_rec_no.Text = Message.StringParm
end event

on w_get_record_number.create
int iCurrent
call super::create
this.st_1=create st_1
this.em_rec_no=create em_rec_no
this.cb_ok=create cb_ok
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.em_rec_no
this.Control[iCurrent+3]=this.cb_ok
end on

on w_get_record_number.destroy
call super::destroy
destroy(this.st_1)
destroy(this.em_rec_no)
destroy(this.cb_ok)
end on

type st_1 from statictext within w_get_record_number
int X=69
int Y=100
int Width=613
int Height=76
boolean Enabled=false
boolean BringToTop=true
string Text="Enter new Record Number:"
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=67108864
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type em_rec_no from editmask within w_get_record_number
int X=667
int Y=84
int Width=247
int Height=88
int TabOrder=10
boolean BringToTop=true
BorderStyle BorderStyle=StyleLowered!
string Mask="##"
boolean Spin=true
string MinMax="1~~99"
long TextColor=33554432
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type cb_ok from commandbutton within w_get_record_number
int X=951
int Y=84
int Width=247
int Height=84
int TabOrder=20
boolean BringToTop=true
string Text="Ok"
boolean Default=true
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;CloseWithReturn ( Parent, em_rec_no.Text )
end event

