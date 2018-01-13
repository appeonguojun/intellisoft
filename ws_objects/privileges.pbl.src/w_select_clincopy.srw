$PBExportHeader$w_select_clincopy.srw
forward
global type w_select_clincopy from pfc_w_response
end type
type dw_clin from datawindow within w_select_clincopy
end type
type cb_ok from commandbutton within w_select_clincopy
end type
type cb_cancel from commandbutton within w_select_clincopy
end type
type st_1 from statictext within w_select_clincopy
end type
end forward

global type w_select_clincopy from pfc_w_response
int X=713
int Y=324
int Width=1655
int Height=420
boolean TitleBar=true
string Title="Select Privileges"
dw_clin dw_clin
cb_ok cb_ok
cb_cancel cb_cancel
st_1 st_1
end type
global w_select_clincopy w_select_clincopy

type variables
long il_clin_id
end variables

on w_select_clincopy.create
int iCurrent
call super::create
this.dw_clin=create dw_clin
this.cb_ok=create cb_ok
this.cb_cancel=create cb_cancel
this.st_1=create st_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_clin
this.Control[iCurrent+2]=this.cb_ok
this.Control[iCurrent+3]=this.cb_cancel
this.Control[iCurrent+4]=this.st_1
end on

on w_select_clincopy.destroy
call super::destroy
destroy(this.dw_clin)
destroy(this.cb_ok)
destroy(this.cb_cancel)
destroy(this.st_1)
end on

event open;call super::open;integer li_fac
li_fac = message.doubleparm

dw_clin.settransobject(sqlca)
DataWindowChild dwchild
dw_clin.retrieve()
dw_clin.insertrow(1)
dw_clin.GetChild( "clinical_area_description", dwchild )
dwchild.settransobject(sqlca)
dwchild.retrieve(li_fac)
end event

event closequery;//ancestor override
end event

type dw_clin from datawindow within w_select_clincopy
int X=41
int Y=116
int Width=997
int Height=96
int TabOrder=10
boolean BringToTop=true
string DataObject="d_dddw_clin_area"
boolean Border=false
boolean LiveScroll=true
end type

event itemchanged;il_clin_id = long(data)


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

type cb_ok from commandbutton within w_select_clincopy
int X=1088
int Y=120
int Width=247
int Height=84
int TabOrder=20
boolean BringToTop=true
string Text="OK"
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;g_str_general lstr_priv
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



CloseWithReturn( Parent, il_clin_id )
end event

type cb_cancel from commandbutton within w_select_clincopy
int X=1349
int Y=120
int Width=247
int Height=84
int TabOrder=30
boolean BringToTop=true
string Text="Cancel"
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;Closewithreturn(parent,0)

end event

type st_1 from statictext within w_select_clincopy
int X=41
int Y=56
int Width=960
int Height=60
boolean Enabled=false
boolean BringToTop=true
string Text="Select a Clinical Area to which to Copy."
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

