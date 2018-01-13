$PBExportHeader$w_priv_renew_select.srw
forward
global type w_priv_renew_select from pfc_w_response
end type
type dw_clin from datawindow within w_priv_renew_select
end type
type cb_ok from commandbutton within w_priv_renew_select
end type
type cb_cancel from commandbutton within w_priv_renew_select
end type
type st_1 from statictext within w_priv_renew_select
end type
type dw_priv from datawindow within w_priv_renew_select
end type
type cb_all from commandbutton within w_priv_renew_select
end type
type st_2 from statictext within w_priv_renew_select
end type
type rb_ini from radiobutton within w_priv_renew_select
end type
type rb_reap from radiobutton within w_priv_renew_select
end type
end forward

global type w_priv_renew_select from pfc_w_response
int X=713
int Y=324
int Width=2290
int Height=1892
boolean TitleBar=true
string Title="Select Privileges"
dw_clin dw_clin
cb_ok cb_ok
cb_cancel cb_cancel
st_1 st_1
dw_priv dw_priv
cb_all cb_all
st_2 st_2
rb_ini rb_ini
rb_reap rb_reap
end type
global w_priv_renew_select w_priv_renew_select

type variables
long il_clin_id
integer ii_appstat
string is_appstat
end variables

on w_priv_renew_select.create
int iCurrent
call super::create
this.dw_clin=create dw_clin
this.cb_ok=create cb_ok
this.cb_cancel=create cb_cancel
this.st_1=create st_1
this.dw_priv=create dw_priv
this.cb_all=create cb_all
this.st_2=create st_2
this.rb_ini=create rb_ini
this.rb_reap=create rb_reap
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_clin
this.Control[iCurrent+2]=this.cb_ok
this.Control[iCurrent+3]=this.cb_cancel
this.Control[iCurrent+4]=this.st_1
this.Control[iCurrent+5]=this.dw_priv
this.Control[iCurrent+6]=this.cb_all
this.Control[iCurrent+7]=this.st_2
this.Control[iCurrent+8]=this.rb_ini
this.Control[iCurrent+9]=this.rb_reap
end on

on w_priv_renew_select.destroy
call super::destroy
destroy(this.dw_clin)
destroy(this.cb_ok)
destroy(this.cb_cancel)
destroy(this.st_1)
destroy(this.dw_priv)
destroy(this.cb_all)
destroy(this.st_2)
destroy(this.rb_ini)
destroy(this.rb_reap)
end on

event open;call super::open;dw_clin.settransobject(sqlca)
DataWindowChild dwchild
dw_clin.retrieve()
dw_clin.insertrow(1)
dw_clin.GetChild( "clinical_area_description", dwchild )
dwchild.settransobject(sqlca)
dwchild.retrieve(gi_facil_change)

ii_appstat = 1 //"Inital"
end event

event closequery;//ancestor override
end event

type dw_clin from datawindow within w_priv_renew_select
int X=32
int Y=92
int Width=1001
int Height=96
int TabOrder=10
boolean BringToTop=true
string DataObject="d_dddw_clin_area"
boolean Border=false
boolean LiveScroll=true
end type

event itemchanged;il_clin_id = long(data)

dw_priv.settransobject(sqlca)
dw_priv.retrieve(gi_parent_facility,il_clin_id )

st_2.visible = true
end event

event constructor;//integer li_row
//dw_clin.settransobject(sqlca)
//dw_clin.retrieve(gi_facil_change)
//dw_clin.InsertRow( 0 )
//
//
//DataWindowChild dwchild
//
//This.GetChild( "clinical_area_description", dwchild )
//
//
//li_row = dwchild.InsertRow( 1 )
//dwchild.scrolltorow(1)
//dwchild.SetItem( 1, "clinical_area_description", "All" )
//dwchild.SetItem( 1, "clinical_area_id", 0 )
il_clin_id = 0
end event

type cb_ok from commandbutton within w_priv_renew_select
int X=1710
int Y=1608
int Width=247
int Height=96
int TabOrder=20
boolean BringToTop=true
string Text="OK"
boolean Default=true
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;g_str_clin_info lstr_priv
integer li_left
integer li_filtered
integer li_count
integer li_checked
integer i
string f_filter

IF il_clin_id = 0 THEN
	MessageBox("Select Error", "You must first select a Clinical Area." )
	dw_clin.SetFocus( )
	Return 0
END IF
//*sort order of 101 means checkbox is checked
f_filter = "priv_core_procd_sort_order = 101"

li_count = dw_priv.rowcount()

dw_priv.setfilter(f_filter)  
dw_priv.filter ()
li_filtered = dw_priv.filteredcount()
//*getting the number of rows checked

lstr_priv.row_count = li_count - li_filtered

for i  = 1 to lstr_priv.row_count

lstr_priv.priv_ids[i] = dw_priv.getitemnumber(i,"priv_core_procd_procd_id")
lstr_priv.clin_id = dw_priv.getitemnumber(i,"priv_core_clinical_area_id")
next

lstr_priv.appnt = 2

//messagebox("stat",lstr_priv.appnt)

CloseWithReturn( Parent, lstr_priv )
end event

type cb_cancel from commandbutton within w_priv_renew_select
int X=1979
int Y=1608
int Width=247
int Height=96
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

event clicked;g_str_clin_info lstr_priv

Closewithreturn(parent,lstr_priv)
//Close(parent)
end event

type st_1 from statictext within w_priv_renew_select
int X=37
int Y=28
int Width=955
int Height=60
boolean Enabled=false
boolean BringToTop=true
string Text="Select a Clinical Area/Department to renew."
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

type dw_priv from datawindow within w_priv_renew_select
int X=23
int Y=304
int Width=2208
int Height=1280
int TabOrder=50
boolean BringToTop=true
string DataObject="d_priv_add_select"
BorderStyle BorderStyle=StyleLowered!
boolean VScrollBar=true
boolean LiveScroll=true
end type

type cb_all from commandbutton within w_priv_renew_select
int X=23
int Y=1600
int Width=247
int Height=96
int TabOrder=40
boolean BringToTop=true
string Text="Select All"
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;integer li_rowcnt
integer li_row

if dw_priv.rowcount() = 0 then return

 li_rowcnt = dw_priv.rowcount()
 
for li_row = 1 to li_rowcnt
	dw_priv.setitem(li_row, "priv_core_procd_sort_order" ,101)
	
next
 
end event

type st_2 from statictext within w_priv_renew_select
int X=27
int Y=232
int Width=1467
int Height=64
boolean Enabled=false
boolean BringToTop=true
string Text="Click on check boxes to select or deselect privileges."
boolean FocusRectangle=false
long TextColor=128
long BackColor=79741120
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event constructor;this.visible = false

end event

type rb_ini from radiobutton within w_priv_renew_select
int X=1751
int Y=80
int Width=247
int Height=76
boolean Visible=false
boolean BringToTop=true
string Text="Inital"
BorderStyle BorderStyle=StyleLowered!
boolean Checked=true
long TextColor=33554432
long BackColor=79741120
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;ii_appstat = 1//"Inital"
end event

type rb_reap from radiobutton within w_priv_renew_select
int X=1751
int Y=148
int Width=297
int Height=76
boolean Visible=false
boolean BringToTop=true
string Text="Reapply"
BorderStyle BorderStyle=StyleLowered!
long TextColor=33554432
long BackColor=67108864
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;ii_appstat = 2  //"Renew"
end event

