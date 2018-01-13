$PBExportHeader$w_about_intellicred.srw
forward
global type w_about_intellicred from w_response
end type
type st_1 from statictext within w_about_intellicred
end type
type st_version from statictext within w_about_intellicred
end type
type st_build from statictext within w_about_intellicred
end type
end forward

global type w_about_intellicred from w_response
int X=1097
int Y=664
int Width=1490
int Height=668
st_1 st_1
st_version st_version
st_build st_build
end type
global w_about_intellicred w_about_intellicred

event open;call super::open;st_build.Text = "Build: " + gs_build
st_version.Text = "Version: " + gs_version
end event

on w_about_intellicred.create
int iCurrent
call super::create
this.st_1=create st_1
this.st_version=create st_version
this.st_build=create st_build
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.st_version
this.Control[iCurrent+3]=this.st_build
end on

on w_about_intellicred.destroy
call super::destroy
destroy(this.st_1)
destroy(this.st_version)
destroy(this.st_build)
end on

type st_1 from statictext within w_about_intellicred
int X=123
int Y=44
int Width=1198
int Height=76
boolean Enabled=false
boolean BringToTop=true
string Text="IntelliCred For Windows"
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=67108864
int TextSize=-14
int Weight=700
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_version from statictext within w_about_intellicred
int X=123
int Y=260
int Width=869
int Height=76
boolean Enabled=false
boolean BringToTop=true
string Text="Version: 1.5"
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=67108864
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_build from statictext within w_about_intellicred
int X=123
int Y=352
int Width=896
int Height=76
boolean Enabled=false
boolean BringToTop=true
string Text="Build Number: 2"
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=67108864
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

