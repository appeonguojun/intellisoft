$PBExportHeader$w_get_facility.srw
forward
global type w_get_facility from w_response
end type
type st_1 from statictext within w_get_facility
end type
type dw_select from u_dw within w_get_facility
end type
type cb_select from commandbutton within w_get_facility
end type
type cb_cancel from commandbutton within w_get_facility
end type
end forward

global type w_get_facility from w_response
int X=987
int Y=716
int Width=1975
int Height=412
boolean TitleBar=true
string Title="Select Facility"
boolean ControlMenu=false
st_1 st_1
dw_select dw_select
cb_select cb_select
cb_cancel cb_cancel
end type
global w_get_facility w_get_facility

on w_get_facility.create
int iCurrent
call super::create
this.st_1=create st_1
this.dw_select=create dw_select
this.cb_select=create cb_select
this.cb_cancel=create cb_cancel
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.dw_select
this.Control[iCurrent+3]=this.cb_select
this.Control[iCurrent+4]=this.cb_cancel
end on

on w_get_facility.destroy
call super::destroy
destroy(this.st_1)
destroy(this.dw_select)
destroy(this.cb_select)
destroy(this.cb_cancel)
end on

type st_1 from statictext within w_get_facility
int X=59
int Y=72
int Width=987
int Height=52
boolean Enabled=false
boolean BringToTop=true
string Text="Select facility to copy verification entries to"
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

type dw_select from u_dw within w_get_facility
int X=59
int Y=136
int Width=1321
int Height=88
int TabOrder=10
boolean BringToTop=true
string DataObject="d_select_facility"
boolean Border=false
BorderStyle BorderStyle=StyleBox!
boolean VScrollBar=false
end type

event constructor;This.of_SetTransObject( SQLCA )
This.InsertRow( 0 )
This.of_SetUpdateAble( False )
end event

type cb_select from commandbutton within w_get_facility
int X=1399
int Y=136
int Width=247
int Height=84
int TabOrder=20
boolean BringToTop=true
string Text="&Select"
boolean Default=true
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;IF IsNull( dw_select.GetItemNumber( 1, "facility_id" ) ) THEN
	MessageBox("Select Error", "You must first select a facility." )
	dw_select.SetFocus( )
	Return -1
END IF

CloseWithReturn( Parent, String( dw_select.GetItemNumber( 1, "facility_id" )))
end event

type cb_cancel from commandbutton within w_get_facility
int X=1664
int Y=136
int Width=247
int Height=84
int TabOrder=20
boolean BringToTop=true
string Text="&Cancel"
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

