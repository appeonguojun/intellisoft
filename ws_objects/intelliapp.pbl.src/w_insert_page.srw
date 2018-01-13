$PBExportHeader$w_insert_page.srw
forward
global type w_insert_page from w_response
end type
type cb_ok from commandbutton within w_insert_page
end type
type st_1 from statictext within w_insert_page
end type
type sle_page from singlelineedit within w_insert_page
end type
type cb_cancel from commandbutton within w_insert_page
end type
type sle_copy_page from singlelineedit within w_insert_page
end type
type st_2 from statictext within w_insert_page
end type
type st_3 from statictext within w_insert_page
end type
end forward

global type w_insert_page from w_response
int X=1074
int Y=640
int Width=1051
int Height=696
boolean TitleBar=true
string Title="Insert Page"
boolean ControlMenu=false
cb_ok cb_ok
st_1 st_1
sle_page sle_page
cb_cancel cb_cancel
sle_copy_page sle_copy_page
st_2 st_2
st_3 st_3
end type
global w_insert_page w_insert_page

on w_insert_page.create
int iCurrent
call super::create
this.cb_ok=create cb_ok
this.st_1=create st_1
this.sle_page=create sle_page
this.cb_cancel=create cb_cancel
this.sle_copy_page=create sle_copy_page
this.st_2=create st_2
this.st_3=create st_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_ok
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.sle_page
this.Control[iCurrent+4]=this.cb_cancel
this.Control[iCurrent+5]=this.sle_copy_page
this.Control[iCurrent+6]=this.st_2
this.Control[iCurrent+7]=this.st_3
end on

on w_insert_page.destroy
call super::destroy
destroy(this.cb_ok)
destroy(this.st_1)
destroy(this.sle_page)
destroy(this.cb_cancel)
destroy(this.sle_copy_page)
destroy(this.st_2)
destroy(this.st_3)
end on

type cb_ok from commandbutton within w_insert_page
int X=229
int Y=464
int Width=247
int Height=84
int TabOrder=10
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

event clicked;CloseWithReturn( Parent, sle_page.Text + "-" + sle_copy_page.Text )

end event

type st_1 from statictext within w_insert_page
int X=78
int Y=288
int Width=475
int Height=76
boolean Enabled=false
boolean BringToTop=true
string Text="Insert After Page:"
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

type sle_page from singlelineedit within w_insert_page
int X=480
int Y=280
int Width=165
int Height=92
int TabOrder=20
boolean BringToTop=true
BorderStyle BorderStyle=StyleLowered!
boolean AutoHScroll=false
string Text="0"
long TextColor=33554432
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type cb_cancel from commandbutton within w_insert_page
int X=507
int Y=464
int Width=247
int Height=84
int TabOrder=40
boolean BringToTop=true
string Text="Cancel"
boolean Cancel=true
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;CloseWithReturn( Parent, "Cancel" )
end event

type sle_copy_page from singlelineedit within w_insert_page
int X=485
int Y=136
int Width=165
int Height=92
int TabOrder=30
boolean BringToTop=true
BorderStyle BorderStyle=StyleLowered!
boolean AutoHScroll=false
string Text="0"
long TextColor=33554432
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_2 from statictext within w_insert_page
int X=210
int Y=148
int Width=261
int Height=76
boolean Enabled=false
boolean BringToTop=true
string Text="Copy Page:"
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

type st_3 from statictext within w_insert_page
int X=91
int Y=24
int Width=878
int Height=76
boolean Enabled=false
boolean BringToTop=true
string Text="Set Copy Page to 0 to insert Blank Page"
boolean FocusRectangle=false
long TextColor=128
long BackColor=67108864
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

