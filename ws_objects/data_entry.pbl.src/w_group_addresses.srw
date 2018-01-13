$PBExportHeader$w_group_addresses.srw
forward
global type w_group_addresses from w_response
end type
type tab_1 from tab within w_group_addresses
end type
type tabpage_browse from userobject within tab_1
end type
type dw_browse from u_dw within tabpage_browse
end type
type sle_1 from singlelineedit within tabpage_browse
end type
type st_1 from statictext within tabpage_browse
end type
type sle_2 from singlelineedit within tabpage_browse
end type
type sle_3 from singlelineedit within tabpage_browse
end type
type sle_4 from singlelineedit within tabpage_browse
end type
type st_2 from statictext within tabpage_browse
end type
type st_3 from statictext within tabpage_browse
end type
type st_4 from statictext within tabpage_browse
end type
type cb_1 from commandbutton within tabpage_browse
end type
type tabpage_detail from userobject within tab_1
end type
type dw_detail from u_dw within tabpage_detail
end type
type tabpage_browse from userobject within tab_1
dw_browse dw_browse
sle_1 sle_1
st_1 st_1
sle_2 sle_2
sle_3 sle_3
sle_4 sle_4
st_2 st_2
st_3 st_3
st_4 st_4
cb_1 cb_1
end type
type tabpage_detail from userobject within tab_1
dw_detail dw_detail
end type
type tab_1 from tab within w_group_addresses
tabpage_browse tabpage_browse
tabpage_detail tabpage_detail
end type
end forward

global type w_group_addresses from w_response
int X=9
int Y=12
int Width=2907
int Height=2384
tab_1 tab_1
end type
global w_group_addresses w_group_addresses

type variables
pfc_cst_nv_data_entry_functions inv_data_entry

end variables

event open;call super::open;inv_data_entry = CREATE pfc_cst_nv_data_entry_functions

inv_data_entry.of_create_dynamic_dw(0, 1, 2, tab_1.tabpage_detail.dw_detail, tab_1.tabpage_browse.dw_browse, False, 0 )
end event

on w_group_addresses.create
int iCurrent
call super::create
this.tab_1=create tab_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.tab_1
end on

on w_group_addresses.destroy
call super::destroy
destroy(this.tab_1)
end on

type tab_1 from tab within w_group_addresses
int X=32
int Y=36
int Width=2779
int Height=2212
int TabOrder=20
boolean BringToTop=true
boolean RaggedRight=true
int SelectedTab=1
long BackColor=67108864
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
tabpage_browse tabpage_browse
tabpage_detail tabpage_detail
end type

on tab_1.create
this.tabpage_browse=create tabpage_browse
this.tabpage_detail=create tabpage_detail
this.Control[]={this.tabpage_browse,&
this.tabpage_detail}
end on

on tab_1.destroy
destroy(this.tabpage_browse)
destroy(this.tabpage_detail)
end on

type tabpage_browse from userobject within tab_1
int X=18
int Y=100
int Width=2743
int Height=2096
long BackColor=79741120
string Text="Browse"
long TabBackColor=79741120
long TabTextColor=33554432
long PictureMaskColor=536870912
dw_browse dw_browse
sle_1 sle_1
st_1 st_1
sle_2 sle_2
sle_3 sle_3
sle_4 sle_4
st_2 st_2
st_3 st_3
st_4 st_4
cb_1 cb_1
end type

on tabpage_browse.create
this.dw_browse=create dw_browse
this.sle_1=create sle_1
this.st_1=create st_1
this.sle_2=create sle_2
this.sle_3=create sle_3
this.sle_4=create sle_4
this.st_2=create st_2
this.st_3=create st_3
this.st_4=create st_4
this.cb_1=create cb_1
this.Control[]={this.dw_browse,&
this.sle_1,&
this.st_1,&
this.sle_2,&
this.sle_3,&
this.sle_4,&
this.st_2,&
this.st_3,&
this.st_4,&
this.cb_1}
end on

on tabpage_browse.destroy
destroy(this.dw_browse)
destroy(this.sle_1)
destroy(this.st_1)
destroy(this.sle_2)
destroy(this.sle_3)
destroy(this.sle_4)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.st_4)
destroy(this.cb_1)
end on

type dw_browse from u_dw within tabpage_browse
int X=27
int Y=200
int Width=2661
int Height=1860
int TabOrder=11
end type

type sle_1 from singlelineedit within tabpage_browse
int X=27
int Y=84
int Width=997
int Height=92
int TabOrder=21
boolean BringToTop=true
BorderStyle BorderStyle=StyleLowered!
boolean AutoHScroll=false
long TextColor=33554432
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_1 from statictext within tabpage_browse
int X=27
int Y=28
int Width=247
int Height=56
boolean Enabled=false
boolean BringToTop=true
string Text="Name"
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

type sle_2 from singlelineedit within tabpage_browse
int X=1051
int Y=84
int Width=681
int Height=92
int TabOrder=21
boolean BringToTop=true
BorderStyle BorderStyle=StyleLowered!
boolean AutoHScroll=false
long TextColor=33554432
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type sle_3 from singlelineedit within tabpage_browse
int X=1765
int Y=84
int Width=251
int Height=92
int TabOrder=21
boolean BringToTop=true
BorderStyle BorderStyle=StyleLowered!
boolean AutoHScroll=false
long TextColor=33554432
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type sle_4 from singlelineedit within tabpage_browse
int X=2039
int Y=84
int Width=471
int Height=92
int TabOrder=21
boolean BringToTop=true
BorderStyle BorderStyle=StyleLowered!
boolean AutoHScroll=false
long TextColor=33554432
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_2 from statictext within tabpage_browse
int X=1056
int Y=24
int Width=247
int Height=56
boolean Enabled=false
boolean BringToTop=true
string Text="City"
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

type st_3 from statictext within tabpage_browse
int X=1760
int Y=24
int Width=247
int Height=56
boolean Enabled=false
boolean BringToTop=true
string Text="State"
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

type st_4 from statictext within tabpage_browse
int X=2043
int Y=20
int Width=247
int Height=56
boolean Enabled=false
boolean BringToTop=true
string Text="Phone"
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

type cb_1 from commandbutton within tabpage_browse
int X=2537
int Y=80
int Width=151
int Height=84
int TabOrder=31
boolean BringToTop=true
string Text="Go"
int TextSize=-8
int Weight=700
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type tabpage_detail from userobject within tab_1
int X=18
int Y=100
int Width=2743
int Height=2096
long BackColor=79741120
string Text="Detail"
long TabBackColor=79741120
long TabTextColor=33554432
long PictureMaskColor=536870912
dw_detail dw_detail
end type

on tabpage_detail.create
this.dw_detail=create dw_detail
this.Control[]={this.dw_detail}
end on

on tabpage_detail.destroy
destroy(this.dw_detail)
end on

type dw_detail from u_dw within tabpage_detail
int X=23
int Y=48
int Width=2693
int Height=2016
int TabOrder=11
boolean HScrollBar=true
end type

event constructor;This.of_SetRowManager( TRUE )
This.of_SetReqColumn(TRUE)
dw_detail.of_SetDropDownCalendar( TRUE )



end event

