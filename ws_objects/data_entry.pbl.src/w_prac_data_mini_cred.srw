$PBExportHeader$w_prac_data_mini_cred.srw
forward
global type w_prac_data_mini_cred from w_main
end type
type tab_2 from tab within w_prac_data_mini_cred
end type
type tabpage_4 from userobject within tab_2
end type
type tabpage_5 from userobject within tab_2
end type
type tabpage_6 from userobject within tab_2
end type
type tabpage_7 from userobject within tab_2
end type
type tabpage_4 from userobject within tab_2
end type
type tabpage_5 from userobject within tab_2
end type
type tabpage_6 from userobject within tab_2
end type
type tabpage_7 from userobject within tab_2
end type
type tab_2 from tab within w_prac_data_mini_cred
tabpage_4 tabpage_4
tabpage_5 tabpage_5
tabpage_6 tabpage_6
tabpage_7 tabpage_7
end type
end forward

global type w_prac_data_mini_cred from w_main
int X=9
int Y=12
int Width=3643
int Height=2372
tab_2 tab_2
end type
global w_prac_data_mini_cred w_prac_data_mini_cred

on w_prac_data_mini_cred.create
int iCurrent
call super::create
this.tab_2=create tab_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.tab_2
end on

on w_prac_data_mini_cred.destroy
call super::destroy
destroy(this.tab_2)
end on

type tab_2 from tab within w_prac_data_mini_cred
int X=18
int Y=20
int Width=3470
int Height=2040
int TabOrder=10
boolean BringToTop=true
boolean RaggedRight=true
int SelectedTab=1
long BackColor=67108864
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
tabpage_4 tabpage_4
tabpage_5 tabpage_5
tabpage_6 tabpage_6
tabpage_7 tabpage_7
end type

on tab_2.create
this.tabpage_4=create tabpage_4
this.tabpage_5=create tabpage_5
this.tabpage_6=create tabpage_6
this.tabpage_7=create tabpage_7
this.Control[]={this.tabpage_4,&
this.tabpage_5,&
this.tabpage_6,&
this.tabpage_7}
end on

on tab_2.destroy
destroy(this.tabpage_4)
destroy(this.tabpage_5)
destroy(this.tabpage_6)
destroy(this.tabpage_7)
end on

type tabpage_4 from userobject within tab_2
int X=18
int Y=112
int Width=3433
int Height=1912
long BackColor=79741120
string Text="Search"
long TabBackColor=79741120
long TabTextColor=33554432
long PictureMaskColor=536870912
end type

type tabpage_5 from userobject within tab_2
int X=18
int Y=112
int Width=3433
int Height=1912
long BackColor=79741120
string Text="Credentialing Data"
long TabBackColor=79741120
long TabTextColor=33554432
long PictureMaskColor=536870912
end type

type tabpage_6 from userobject within tab_2
int X=18
int Y=112
int Width=3433
int Height=1912
long BackColor=79741120
string Text="Verification Status"
long TabBackColor=79741120
long TabTextColor=33554432
long PictureMaskColor=536870912
end type

type tabpage_7 from userobject within tab_2
int X=18
int Y=112
int Width=3433
int Height=1912
long BackColor=79741120
string Text="Appointment Status"
long TabBackColor=79741120
long TabTextColor=33554432
long PictureMaskColor=536870912
end type

