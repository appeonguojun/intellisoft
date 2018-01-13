$PBExportHeader$w_click_message.srw
forward
global type w_click_message from w_popup
end type
type st_1 from statictext within w_click_message
end type
end forward

global type w_click_message from w_popup
int X=590
int Y=224
int Width=2446
int Height=144
WindowType WindowType=child!
boolean TitleBar=false
boolean ControlMenu=false
boolean MinBox=false
boolean MaxBox=false
boolean Resizable=false
st_1 st_1
end type
global w_click_message w_click_message

on w_click_message.create
int iCurrent
call super::create
this.st_1=create st_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
end on

on w_click_message.destroy
call super::destroy
destroy(this.st_1)
end on

type st_1 from statictext within w_click_message
int X=41
int Y=36
int Width=2117
int Height=76
boolean Enabled=false
boolean BringToTop=true
string Text=" Click the position on the image where you want to place copy of fields."
boolean FocusRectangle=false
long TextColor=255
long BackColor=67108864
int TextSize=-10
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

