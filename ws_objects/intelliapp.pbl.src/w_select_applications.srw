$PBExportHeader$w_select_applications.srw
forward
global type w_select_applications from w_response
end type
type dw_1 from u_dw within w_select_applications
end type
type cb_1 from commandbutton within w_select_applications
end type
type cb_2 from commandbutton within w_select_applications
end type
end forward

global type w_select_applications from w_response
int X=233
int Y=124
int Width=3145
int Height=2208
boolean TitleBar=true
string Title="Select Application"
dw_1 dw_1
cb_1 cb_1
cb_2 cb_2
end type
global w_select_applications w_select_applications

on w_select_applications.create
int iCurrent
call super::create
this.dw_1=create dw_1
this.cb_1=create cb_1
this.cb_2=create cb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
this.Control[iCurrent+2]=this.cb_1
this.Control[iCurrent+3]=this.cb_2
end on

on w_select_applications.destroy
call super::destroy
destroy(this.dw_1)
destroy(this.cb_1)
destroy(this.cb_2)
end on

type dw_1 from u_dw within w_select_applications
int X=55
int Y=56
int Width=2706
int Height=1996
int TabOrder=10
boolean BringToTop=true
string DataObject="d_applications"
end type

event constructor;call super::constructor;This.SetTransObject( SQLCA )
This.Retrieve( )
end event

type cb_1 from commandbutton within w_select_applications
int X=2811
int Y=56
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

event clicked;gs_pass_ids lgs_app_ids
Integer li_rc
Integer i
Integer li_cnt

dw_1.AcceptText()

FOR i = 1 TO li_rc
	IF dw_1.GetItemNumber( i, "selected" ) = 1 THEN
		li_cnt++
		lgs_app_ids.i_ids[ li_cnt ] = dw_1.GetItemNumber( i, "app_id" )
	END IF
END FOR


CloseWithReturn( Parent, lgs_app_ids )
end event

type cb_2 from commandbutton within w_select_applications
int X=2811
int Y=160
int Width=247
int Height=84
int TabOrder=30
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

