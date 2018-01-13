$PBExportHeader$uo_filter_lights.sru
forward
global type uo_filter_lights from UserObject
end type
type st_4 from statictext within uo_filter_lights
end type
type r_1 from rectangle within uo_filter_lights
end type
type st_3 from statictext within uo_filter_lights
end type
type st_1 from statictext within uo_filter_lights
end type
type st_2 from statictext within uo_filter_lights
end type
type rr_ir from roundrectangle within uo_filter_lights
end type
type rr_s from roundrectangle within uo_filter_lights
end type
type rr_p from roundrectangle within uo_filter_lights
end type
end forward

global type uo_filter_lights from UserObject
int Width=992
int Height=140
boolean Border=true
long BackColor=67108864
long PictureMaskColor=536870912
long TabTextColor=33554432
long TabBackColor=67108864
st_4 st_4
r_1 r_1
st_3 st_3
st_1 st_1
st_2 st_2
rr_ir rr_ir
rr_s rr_s
rr_p rr_p
end type
global uo_filter_lights uo_filter_lights

on uo_filter_lights.create
this.st_4=create st_4
this.r_1=create r_1
this.st_3=create st_3
this.st_1=create st_1
this.st_2=create st_2
this.rr_ir=create rr_ir
this.rr_s=create rr_s
this.rr_p=create rr_p
this.Control[]={this.st_4,&
this.r_1,&
this.st_3,&
this.st_1,&
this.st_2,&
this.rr_ir,&
this.rr_s,&
this.rr_p}
end on

on uo_filter_lights.destroy
destroy(this.st_4)
destroy(this.r_1)
destroy(this.st_3)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.rr_ir)
destroy(this.rr_s)
destroy(this.rr_p)
end on

type st_4 from statictext within uo_filter_lights
int X=64
int Y=12
int Width=393
int Height=52
boolean Enabled=false
string Text="Addt'l Filter Status"
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

type r_1 from rectangle within uo_filter_lights
int X=14
int Y=40
int Width=955
int Height=88
boolean Enabled=false
int LineThickness=4
long FillColor=80269524
end type

type st_3 from statictext within uo_filter_lights
int X=690
int Y=64
int Width=251
int Height=56
boolean Enabled=false
string Text="Practitioner"
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

type st_1 from statictext within uo_filter_lights
int X=142
int Y=64
int Width=119
int Height=56
boolean Enabled=false
boolean BringToTop=true
string Text="I/R"
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

type st_2 from statictext within uo_filter_lights
int X=379
int Y=64
int Width=174
int Height=52
boolean Enabled=false
boolean BringToTop=true
string Text="Screen"
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

type rr_ir from roundrectangle within uo_filter_lights
int X=27
int Y=64
int Width=101
int Height=52
boolean Enabled=false
int LineThickness=4
int CornerHeight=40
int CornerWidth=46
long FillColor=255
end type

type rr_s from roundrectangle within uo_filter_lights
int X=270
int Y=64
int Width=101
int Height=52
boolean Enabled=false
int LineThickness=4
int CornerHeight=40
int CornerWidth=46
long FillColor=255
end type

type rr_p from roundrectangle within uo_filter_lights
int X=576
int Y=64
int Width=101
int Height=52
boolean Enabled=false
int LineThickness=4
int CornerHeight=40
int CornerWidth=46
long FillColor=255
end type

