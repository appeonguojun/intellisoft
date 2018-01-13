$PBExportHeader$w_apprun_audit.srw
forward
global type w_apprun_audit from w_sheet
end type
type gb_1 from groupbox within w_apprun_audit
end type
type cb_saveas from commandbutton within w_apprun_audit
end type
type cb_close from commandbutton within w_apprun_audit
end type
type tab_1 from tab within w_apprun_audit
end type
type tabpage_1 from userobject within tab_1
end type
type dw_4 from u_dw within tabpage_1
end type
type dw_1 from u_dw within tabpage_1
end type
type tabpage_1 from userobject within tab_1
dw_4 dw_4
dw_1 dw_1
end type
type tabpage_2 from userobject within tab_1
end type
type dw_5 from u_dw within tabpage_2
end type
type dw_2 from u_dw within tabpage_2
end type
type tabpage_2 from userobject within tab_1
dw_5 dw_5
dw_2 dw_2
end type
type tabpage_3 from userobject within tab_1
end type
type dw_6 from u_dw within tabpage_3
end type
type dw_3 from u_dw within tabpage_3
end type
type tabpage_3 from userobject within tab_1
dw_6 dw_6
dw_3 dw_3
end type
type tab_1 from tab within w_apprun_audit
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
end type
type rb_1 from radiobutton within w_apprun_audit
end type
type rb_2 from radiobutton within w_apprun_audit
end type
end forward

global type w_apprun_audit from w_sheet
integer x = 214
integer y = 221
integer width = 3959
integer height = 2604
string title = "Application Runtime Log"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
gb_1 gb_1
cb_saveas cb_saveas
cb_close cb_close
tab_1 tab_1
rb_1 rb_1
rb_2 rb_2
end type
global w_apprun_audit w_apprun_audit

type variables
n_cst_PowerFilter iu_PowerFilter1,iu_PowerFilter2,iu_PowerFilter3
String is_sort_column
String is_dw1_sql,is_dw2_sql,is_dw3_sql,is_dw4_sql,is_dw5_sql,is_dw6_sql
end variables

on w_apprun_audit.create
int iCurrent
call super::create
this.gb_1=create gb_1
this.cb_saveas=create cb_saveas
this.cb_close=create cb_close
this.tab_1=create tab_1
this.rb_1=create rb_1
this.rb_2=create rb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.gb_1
this.Control[iCurrent+2]=this.cb_saveas
this.Control[iCurrent+3]=this.cb_close
this.Control[iCurrent+4]=this.tab_1
this.Control[iCurrent+5]=this.rb_1
this.Control[iCurrent+6]=this.rb_2
end on

on w_apprun_audit.destroy
call super::destroy
destroy(this.gb_1)
destroy(this.cb_saveas)
destroy(this.cb_close)
destroy(this.tab_1)
destroy(this.rb_1)
destroy(this.rb_2)
end on

event pfc_preopen;call super::pfc_preopen;integer i

this.of_SetResize(true)
this.inv_resize.of_setorigsize(3950, 2512)
for i =  1 to UpperBound(this.Control)
	this.inv_resize.of_Register(this.Control[i], this.inv_resize.scale)
next



end event

event open;call super::open;string ls_dw1_sql,ls_dw2_sql,ls_dw3_sql

is_dw1_sql = tab_1.tabpage_1.dw_1.getsqlselect()
is_dw2_sql = tab_1.tabpage_2.dw_2.getsqlselect()
is_dw3_sql = tab_1.tabpage_3.dw_3.getsqlselect()
is_dw4_sql = is_dw1_sql
is_dw5_sql = is_dw2_sql
is_dw6_sql = is_dw3_sql

ls_dw1_sql = is_dw1_sql + " WHERE debug_date >= getdate() - 10 "
ls_dw2_sql = is_dw2_sql + " WHERE a.calltime >= getdate() - 10 "
ls_dw3_sql = is_dw3_sql + " WHERE ACCESSEDTIME >= getdate() - 10 "
tab_1.tabpage_1.dw_1.setsqlselect(ls_dw1_sql)
tab_1.tabpage_1.dw_4.setsqlselect(ls_dw1_sql)
tab_1.tabpage_2.dw_2.setsqlselect(ls_dw2_sql)
tab_1.tabpage_2.dw_5.setsqlselect(ls_dw2_sql)
tab_1.tabpage_3.dw_3.setsqlselect(ls_dw3_sql)
tab_1.tabpage_3.dw_6.setsqlselect(ls_dw3_sql)

tab_1.tabpage_1.dw_1.settransobject(sqlca)
tab_1.tabpage_2.dw_2.settransobject(sqlca)
tab_1.tabpage_3.dw_3.settransobject(sqlca)

gnv_appeondb.of_startqueue( )
	tab_1.tabpage_1.dw_1.Retrieve()
	tab_1.tabpage_2.dw_2.Retrieve()
	tab_1.tabpage_3.dw_3.Retrieve()
gnv_appeondb.of_commitqueue( )

tab_1.tabpage_1.dw_1.ShareData(tab_1.tabpage_1.dw_4)
tab_1.tabpage_2.dw_2.ShareData(tab_1.tabpage_2.dw_5)
tab_1.tabpage_3.dw_3.ShareData(tab_1.tabpage_3.dw_6)

tab_1.tabpage_1.dw_1.setfocus( )
end event

type gb_1 from groupbox within w_apprun_audit
integer x = 2560
integer y = 2380
integer width = 672
integer height = 112
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
end type

type cb_saveas from commandbutton within w_apprun_audit
integer x = 3241
integer y = 2396
integer width = 343
integer height = 92
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Export..."
end type

event clicked;m_npdb_options NewMenu 
NewMenu = CREATE m_npdb_options
if tab_1.selectedtab = 1 then
	NewMenu.of_setparent(tab_1.tabpage_1.dw_1)
elseif tab_1.selectedtab = 2 then
	NewMenu.of_setparent(tab_1.tabpage_2.dw_2)
else
	NewMenu.of_setparent(tab_1.tabpage_3.dw_3)
end if
NewMenu.m_options.m_mailall.visible = false
NewMenu.m_options.m_printall.visible = false
NewMenu.m_options.m_printcurrent.text = 'Print'
NewMenu.m_options.m_mailcurrent.visible = False
NewMenu.m_options.PopMenu(Parent.pointerx(),Parent.pointerY())
end event

type cb_close from commandbutton within w_apprun_audit
integer x = 3593
integer y = 2396
integer width = 343
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Close"
end type

event clicked;Close(Parent)
end event

type tab_1 from tab within w_apprun_audit
integer width = 3945
integer height = 2468
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 79741120
boolean fixedwidth = true
boolean raggedright = true
boolean focusonbuttondown = true
tabposition tabposition = tabsonbottom!
alignment alignment = center!
integer selectedtab = 1
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.tabpage_3=create tabpage_3
this.Control[]={this.tabpage_1,&
this.tabpage_2,&
this.tabpage_3}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
destroy(this.tabpage_3)
end on

event selectionchanged;//long ll_row
//
//
//
//If newindex = 2 Then
//
//	ll_row = tabpage_detail.dw_1.GetRow()
//	tabpage_browse.dw_browse.ScrollToRow(ll_row)
//	tabpage_browse.dw_browse.SetRow(ll_row)	
//	tabpage_detail.dw_1.SetFocus()
//ElseIf newindex = 3 Then
//	ll_row = tabpage_browse.dw_browse.GetRow()
//	tabpage_detail.dw_1.ScrollToRow(ll_row)
//	tabpage_detail.dw_1.SetRow(ll_row)	
//	tabpage_browse.dw_browse.SetFocus()
//ElseIf newindex = 1 then
//	tab_1.tabpage_alarmlog.dw_alarm.retrieve( )
//End If
//
//
end event

type tabpage_1 from userobject within tab_1
integer x = 18
integer y = 16
integer width = 3909
integer height = 2352
long backcolor = 79741120
string text = "System Log"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
dw_4 dw_4
dw_1 dw_1
end type

on tabpage_1.create
this.dw_4=create dw_4
this.dw_1=create dw_1
this.Control[]={this.dw_4,&
this.dw_1}
end on

on tabpage_1.destroy
destroy(this.dw_4)
destroy(this.dw_1)
end on

type dw_4 from u_dw within tabpage_1
integer y = 1528
integer width = 3895
integer height = 800
integer taborder = 40
string title = "Detail"
string dataobject = "d_view_sysdebug_log_detail"
boolean vscrollbar = false
boolean livescroll = false
end type

event buttonclicked;call super::buttonclicked;long ll_row
ll_row = this.getrow()
if ll_row < 1 then return
tab_1.tabpage_1.dw_1.ScrollToRow(ll_row)
tab_1.tabpage_1.dw_1.SetRow(ll_row)	
end event

event rowfocuschanged;call super::rowfocuschanged;long ll_row
ll_row = currentrow
if ll_row < 1 then return
tab_1.tabpage_1.dw_1.ScrollToRow(ll_row)
tab_1.tabpage_1.dw_1.SetRow(ll_row)	
end event

type dw_1 from u_dw within tabpage_1
event ue_leftbuttonup pbm_dwnlbuttonup
event ue_set_sort ( integer xpos,  integer ypos,  long row,  dwobject dwo,  string as_sort_column )
integer y = 8
integer width = 3895
integer height = 1500
integer taborder = 30
string title = "Browse"
string dataobject = "d_view_sysdebug_log"
boolean hscrollbar = true
boolean livescroll = false
end type

event ue_leftbuttonup;If isvalid(iu_PowerFilter1) Then
//	iu_PowerFilter1.of_reset( ) 
//	iu_PowerFilter1.of_Reset_OriginalFilter( )
	iu_PowerFilter1.event post ue_buttonclicked( dwo.type, dwo.name )
End If
end event

event ue_set_sort(integer xpos, integer ypos, long row, dwobject dwo, string as_sort_column);long ll_i,ll_id,ll_findrow
string ls_sort_column
String ls_sort_syntax
this.setredraw(false)

this.of_setsort( true)
If IsValid (inv_Sort) Then 
	inv_Sort.of_setcolumnheader(True)
	inv_Sort.of_setusedisplay(True)
	inv_Sort.of_build_click_sort_syntax( xpos, ypos, row, dwo )
End If

If GetRow() > 0 Then ll_id = This.GetItemNumber(GetRow(),'id')

//this.SetSort(of_replace_sort(this.inv_sort.of_getsort()))
this.SetSort(this.inv_sort.of_getsort())
This.sort()

ll_findrow = This.Find('id = ' + String(ll_id),1, This.RowCount())
If ll_findrow > 0 Then
	this.SetRow(ll_findrow)
	this.ScrollToRow(ll_findrow)
	tab_1.tabpage_1.dw_4.SetRow(ll_findrow)
	tab_1.tabpage_1.dw_4.ScrollToRow(ll_findrow)
End If

this.setredraw(true)

end event

event constructor;SetTransObject( SQLCA )
This.of_setrowselect(True)	

If Not isvalid(iu_PowerFilter1) Then
	iu_PowerFilter1 = create n_cst_PowerFilter
Else
	iu_PowerFilter1.of_reset( ) 
	iu_PowerFilter1.of_Reset_OriginalFilter( )
End If
iu_PowerFilter1.of_setdw(this)
iu_PowerFilter1.of_SetParentWindow( w_apprun_audit )
iu_PowerFilter1.checked = true
iu_PowerFilter1.of_setoriginalfilter( )
iu_PowerFilter1.event ue_clicked()


end event

event clicked;string ls_objectname,ls_sort_column
ls_objectname = string(dwo.name) 
If row = 0 and this.describe(ls_objectname+".band") = "header" and this.describe(ls_objectname + ".text") <> "!" Then 
	ls_sort_column = left(ls_objectname,len(ls_objectname) - 2)
	is_sort_column = ls_sort_column
	this.event ue_set_sort(xpos,ypos,row,dwo,ls_sort_column)
End If

if row < 1 then return
tab_1.tabpage_1.dw_4.ScrollToRow(row)
tab_1.tabpage_1.dw_4.SetRow(row)	

end event

event rowfocuschanged;call super::rowfocuschanged;long ll_row
ll_row = currentrow
if ll_row < 1 then return
tab_1.tabpage_1.dw_4.ScrollToRow(ll_row)
tab_1.tabpage_1.dw_4.SetRow(ll_row)	
end event

type tabpage_2 from userobject within tab_1
integer x = 18
integer y = 16
integer width = 3909
integer height = 2352
long backcolor = 79741120
string text = "SalesForce Outbound Messages"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
dw_5 dw_5
dw_2 dw_2
end type

on tabpage_2.create
this.dw_5=create dw_5
this.dw_2=create dw_2
this.Control[]={this.dw_5,&
this.dw_2}
end on

on tabpage_2.destroy
destroy(this.dw_5)
destroy(this.dw_2)
end on

type dw_5 from u_dw within tabpage_2
integer y = 1144
integer width = 3895
integer height = 1184
integer taborder = 30
string title = "Detail"
string dataobject = "d_view_notification_log_detail"
boolean vscrollbar = false
end type

event buttonclicked;call super::buttonclicked;long ll_row
ll_row = this.getrow()
if ll_row < 1 then return
tab_1.tabpage_2.dw_2.ScrollToRow(ll_row)
tab_1.tabpage_2.dw_2.SetRow(ll_row)	
end event

event rowfocuschanged;call super::rowfocuschanged;long ll_row
ll_row = currentrow
if ll_row < 1 then return
tab_1.tabpage_2.dw_2.ScrollToRow(ll_row)
tab_1.tabpage_2.dw_2.SetRow(ll_row)	
end event

type dw_2 from u_dw within tabpage_2
event ue_leftbuttonup pbm_dwnlbuttonup
event ue_set_sort ( integer xpos,  integer ypos,  long row,  dwobject dwo,  string as_sort_column )
integer y = 8
integer width = 3895
integer height = 1124
integer taborder = 20
string title = "Browse"
string dataobject = "d_view_notification_log"
boolean hscrollbar = true
end type

event ue_leftbuttonup;If isvalid(iu_PowerFilter2) Then
//	iu_PowerFilter2.of_reset( ) 
//	iu_PowerFilter2.of_Reset_OriginalFilter( )
	iu_PowerFilter2.event post ue_buttonclicked( dwo.type, dwo.name )
End If
end event

event ue_set_sort(integer xpos, integer ypos, long row, dwobject dwo, string as_sort_column);long ll_i,ll_id,ll_findrow
string ls_sort_column
String ls_sort_syntax
this.setredraw(false)

this.of_setsort( true)
If IsValid (inv_Sort) Then 
	inv_Sort.of_setcolumnheader(True)
	inv_Sort.of_setusedisplay(True)
	inv_Sort.of_build_click_sort_syntax( xpos, ypos, row, dwo )
End If

If GetRow() > 0 Then ll_id = This.GetItemNumber(GetRow(),'sys_notifications_pid')

//this.SetSort(of_replace_sort(this.inv_sort.of_getsort()))
this.SetSort(this.inv_sort.of_getsort())
This.sort()

ll_findrow = This.Find('sys_notifications_pid = ' + String(ll_id),1, This.RowCount())
If ll_findrow > 0 Then
	this.SetRow(ll_findrow)
	this.ScrollToRow(ll_findrow)
	tab_1.tabpage_2.dw_5.SetRow(ll_findrow)
	tab_1.tabpage_2.dw_5.ScrollToRow(ll_findrow)
End If

this.setredraw(true)

end event

event constructor;SetTransObject( SQLCA )
This.of_setrowselect(True)	

If Not isvalid(iu_PowerFilter2) Then
	iu_PowerFilter2 = create n_cst_PowerFilter
Else
	iu_PowerFilter2.of_reset( ) 
	iu_PowerFilter2.of_Reset_OriginalFilter( )
End If
iu_PowerFilter2.of_setdw(this)
iu_PowerFilter2.of_SetParentWindow( w_apprun_audit )
iu_PowerFilter2.checked = true
iu_PowerFilter2.of_setoriginalfilter( )
iu_PowerFilter2.event ue_clicked()


end event

event clicked;string ls_objectname,ls_sort_column
ls_objectname = string(dwo.name) 
If row = 0 and this.describe(ls_objectname+".band") = "header" and this.describe(ls_objectname + ".text") <> "!" Then 
	ls_sort_column = left(ls_objectname,len(ls_objectname) - 2)
	is_sort_column = ls_sort_column
	this.event ue_set_sort(xpos,ypos,row,dwo,ls_sort_column)
End If

if row < 1 then return
tab_1.tabpage_2.dw_5.ScrollToRow(row)
tab_1.tabpage_2.dw_5.SetRow(row)	
end event

event rowfocuschanged;call super::rowfocuschanged;long ll_row
ll_row = currentrow
if ll_row < 1 then return
tab_1.tabpage_2.dw_5.ScrollToRow(ll_row)
tab_1.tabpage_2.dw_5.SetRow(ll_row)	
end event

type tabpage_3 from userobject within tab_1
integer x = 18
integer y = 16
integer width = 3909
integer height = 2352
long backcolor = 79741120
string text = "Web API Log"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
dw_6 dw_6
dw_3 dw_3
end type

on tabpage_3.create
this.dw_6=create dw_6
this.dw_3=create dw_3
this.Control[]={this.dw_6,&
this.dw_3}
end on

on tabpage_3.destroy
destroy(this.dw_6)
destroy(this.dw_3)
end on

type dw_6 from u_dw within tabpage_3
integer y = 1528
integer width = 3895
integer height = 800
integer taborder = 40
string title = "Detail"
string dataobject = "d_view_webapi_log_detail"
boolean vscrollbar = false
end type

event buttonclicked;call super::buttonclicked;long ll_row
ll_row = this.getrow()
if ll_row < 1 then return
tab_1.tabpage_3.dw_3.ScrollToRow(ll_row)
tab_1.tabpage_3.dw_3.SetRow(ll_row)	
end event

event rowfocuschanged;call super::rowfocuschanged;long ll_row
ll_row = currentrow
if ll_row < 1 then return
tab_1.tabpage_3.dw_3.ScrollToRow(ll_row)
tab_1.tabpage_3.dw_3.SetRow(ll_row)	
end event

type dw_3 from u_dw within tabpage_3
event ue_leftbuttonup pbm_dwnlbuttonup
event ue_set_sort ( integer xpos,  integer ypos,  long row,  dwobject dwo,  string as_sort_column )
integer y = 8
integer width = 3895
integer height = 1500
integer taborder = 30
string title = "Browse"
string dataobject = "d_view_webapi_log"
boolean hscrollbar = true
end type

event ue_leftbuttonup;If isvalid(iu_PowerFilter3) Then
//	iu_PowerFilter3.of_reset( ) 
//	iu_PowerFilter3.of_Reset_OriginalFilter( )
	iu_PowerFilter3.event post ue_buttonclicked( dwo.type, dwo.name )
End If
end event

event ue_set_sort(integer xpos, integer ypos, long row, dwobject dwo, string as_sort_column);long ll_i,ll_id,ll_findrow
string ls_sort_column
String ls_sort_syntax
this.setredraw(false)

this.of_setsort( true)
If IsValid (inv_Sort) Then 
	inv_Sort.of_setcolumnheader(True)
	inv_Sort.of_setusedisplay(True)
	inv_Sort.of_build_click_sort_syntax( xpos, ypos, row, dwo )
End If

If GetRow() > 0 Then ll_id = This.GetItemNumber(GetRow(),'id')

//this.SetSort(of_replace_sort(this.inv_sort.of_getsort()))
this.SetSort(this.inv_sort.of_getsort())
This.sort()

ll_findrow = This.Find('id = ' + String(ll_id),1, This.RowCount())
If ll_findrow > 0 Then
	this.SetRow(ll_findrow)
	this.ScrollToRow(ll_findrow)
	tab_1.tabpage_3.dw_6.SetRow(ll_findrow)
	tab_1.tabpage_3.dw_6.ScrollToRow(ll_findrow)
End If

this.setredraw(true)

end event

event constructor;SetTransObject( SQLCA )
This.of_setrowselect(True)	

If Not isvalid(iu_PowerFilter3) Then
	iu_PowerFilter3 = create n_cst_PowerFilter
Else
	iu_PowerFilter3.of_reset( ) 
	iu_PowerFilter3.of_Reset_OriginalFilter( )
End If
iu_PowerFilter3.of_setdw(this)
iu_PowerFilter3.of_SetParentWindow( w_apprun_audit )
iu_PowerFilter3.checked = true
iu_PowerFilter3.of_setoriginalfilter( )
iu_PowerFilter3.event ue_clicked()


end event

event clicked;string ls_objectname,ls_sort_column
ls_objectname = string(dwo.name) 
If row = 0 and this.describe(ls_objectname+".band") = "header" and this.describe(ls_objectname + ".text") <> "!" Then 
	ls_sort_column = left(ls_objectname,len(ls_objectname) - 2)
	is_sort_column = ls_sort_column
	this.event ue_set_sort(xpos,ypos,row,dwo,ls_sort_column)
End If

if row < 1 then return
tab_1.tabpage_3.dw_6.ScrollToRow(row)
tab_1.tabpage_3.dw_6.SetRow(row)	
end event

event rowfocuschanged;call super::rowfocuschanged;long ll_row
ll_row = currentrow
if ll_row < 1 then return
tab_1.tabpage_3.dw_6.ScrollToRow(ll_row)
tab_1.tabpage_3.dw_6.SetRow(ll_row)	
end event

type rb_1 from radiobutton within w_apprun_audit
integer x = 2601
integer y = 2416
integer width = 421
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Latest 10 Days  "
boolean checked = true
end type

event clicked;string ls_dw1_sql,ls_dw2_sql,ls_dw3_sql

if this.checked then
	ls_dw1_sql = is_dw1_sql + " WHERE debug_date >= getdate() - 10 "
	ls_dw2_sql = is_dw2_sql + " WHERE a.calltime >= getdate() - 10 "
	ls_dw3_sql = is_dw3_sql + " WHERE ACCESSEDTIME >= getdate() - 10 "
	tab_1.tabpage_1.dw_1.setsqlselect(ls_dw1_sql)
	tab_1.tabpage_1.dw_4.setsqlselect(ls_dw1_sql)
	tab_1.tabpage_2.dw_2.setsqlselect(ls_dw2_sql)
	tab_1.tabpage_2.dw_5.setsqlselect(ls_dw2_sql)
	tab_1.tabpage_3.dw_3.setsqlselect(ls_dw3_sql)
	tab_1.tabpage_3.dw_6.setsqlselect(ls_dw3_sql)
	tab_1.tabpage_1.dw_1.settransobject(sqlca)
	tab_1.tabpage_2.dw_2.settransobject(sqlca)
	tab_1.tabpage_3.dw_3.settransobject(sqlca)
	gnv_appeondb.of_startqueue( )
		tab_1.tabpage_1.dw_1.Retrieve()
		tab_1.tabpage_2.dw_2.Retrieve()
		tab_1.tabpage_3.dw_3.Retrieve()
	gnv_appeondb.of_commitqueue( )

	tab_1.tabpage_1.dw_1.ShareData(tab_1.tabpage_1.dw_4)
	tab_1.tabpage_2.dw_2.ShareData(tab_1.tabpage_2.dw_5)
	tab_1.tabpage_3.dw_3.ShareData(tab_1.tabpage_3.dw_6)
end if
end event

type rb_2 from radiobutton within w_apprun_audit
integer x = 3035
integer y = 2416
integer width = 183
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "All "
end type

event clicked;string ls_dw1_sql,ls_dw2_sql,ls_dw3_sql

if this.checked then
	ls_dw1_sql = is_dw1_sql 
	ls_dw2_sql = is_dw2_sql 
	ls_dw3_sql = is_dw3_sql 
	tab_1.tabpage_1.dw_1.setsqlselect(ls_dw1_sql)
	tab_1.tabpage_1.dw_4.setsqlselect(ls_dw1_sql)
	tab_1.tabpage_2.dw_2.setsqlselect(ls_dw2_sql)
	tab_1.tabpage_2.dw_5.setsqlselect(ls_dw2_sql)
	tab_1.tabpage_3.dw_3.setsqlselect(ls_dw3_sql)
	tab_1.tabpage_3.dw_6.setsqlselect(ls_dw3_sql)
	tab_1.tabpage_1.dw_1.settransobject(sqlca)
	tab_1.tabpage_2.dw_2.settransobject(sqlca)
	tab_1.tabpage_3.dw_3.settransobject(sqlca)
	gnv_appeondb.of_startqueue( )
		tab_1.tabpage_1.dw_1.Retrieve()
		tab_1.tabpage_2.dw_2.Retrieve()
		tab_1.tabpage_3.dw_3.Retrieve()
	gnv_appeondb.of_commitqueue( )

	tab_1.tabpage_1.dw_1.ShareData(tab_1.tabpage_1.dw_4)
	tab_1.tabpage_2.dw_2.ShareData(tab_1.tabpage_2.dw_5)
	tab_1.tabpage_3.dw_3.ShareData(tab_1.tabpage_3.dw_6)
end if
end event

