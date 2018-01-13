$PBExportHeader$w_get_page_range.srw
forward
global type w_get_page_range from w_response
end type
type st_from from statictext within w_get_page_range
end type
type st_to from statictext within w_get_page_range
end type
type em_from from editmask within w_get_page_range
end type
type em_to from editmask within w_get_page_range
end type
type cb_ok from commandbutton within w_get_page_range
end type
type cb_cancel from commandbutton within w_get_page_range
end type
end forward

global type w_get_page_range from w_response
int X=1083
int Y=388
int Width=727
int Height=592
boolean TitleBar=true
string Title="Page Range"
st_from st_from
st_to st_to
em_from em_from
em_to em_to
cb_ok cb_ok
cb_cancel cb_cancel
end type
global w_get_page_range w_get_page_range

on w_get_page_range.create
int iCurrent
call super::create
this.st_from=create st_from
this.st_to=create st_to
this.em_from=create em_from
this.em_to=create em_to
this.cb_ok=create cb_ok
this.cb_cancel=create cb_cancel
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_from
this.Control[iCurrent+2]=this.st_to
this.Control[iCurrent+3]=this.em_from
this.Control[iCurrent+4]=this.em_to
this.Control[iCurrent+5]=this.cb_ok
this.Control[iCurrent+6]=this.cb_cancel
end on

on w_get_page_range.destroy
call super::destroy
destroy(this.st_from)
destroy(this.st_to)
destroy(this.em_from)
destroy(this.em_to)
destroy(this.cb_ok)
destroy(this.cb_cancel)
end on

type st_from from statictext within w_get_page_range
int X=96
int Y=72
int Width=247
int Height=64
boolean Enabled=false
boolean BringToTop=true
string Text="From"
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

type st_to from statictext within w_get_page_range
int X=407
int Y=72
int Width=247
int Height=76
boolean Enabled=false
boolean BringToTop=true
string Text="To"
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

type em_from from editmask within w_get_page_range
int X=91
int Y=148
int Width=229
int Height=96
int TabOrder=10
boolean BringToTop=true
BorderStyle BorderStyle=StyleLowered!
string Mask="###"
boolean Spin=true
double Increment=1
string MinMax="1~~50"
long TextColor=33554432
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type em_to from editmask within w_get_page_range
int X=407
int Y=148
int Width=229
int Height=96
int TabOrder=20
boolean BringToTop=true
BorderStyle BorderStyle=StyleLowered!
string Mask="###"
boolean Spin=true
double Increment=1
string MinMax="1~~50"
long TextColor=33554432
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type cb_ok from commandbutton within w_get_page_range
int X=87
int Y=324
int Width=265
int Height=84
int TabOrder=30
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

event clicked;Integer li_from
Integer li_to

li_from = Integer( em_from.Text )
li_to = Integer( em_to.Text )

IF li_from < 1 THEN
	MessageBox( "From", "The From value must be at least 1." )
	Return 0
END IF

IF li_to < 1 THEN
	MessageBox( "To", "The To value must be at least 1." )
	Return 0
END IF

IF li_from > li_to THEN
	MessageBox("Invalid Range", "The From value must be less than the To value." )
	Return 0
END IF

CloseWithReturn( Parent, em_from.Text + "-" + em_to.Text )

end event

type cb_cancel from commandbutton within w_get_page_range
int X=370
int Y=324
int Width=265
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

