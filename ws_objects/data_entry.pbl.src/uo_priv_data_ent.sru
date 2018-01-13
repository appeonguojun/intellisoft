$PBExportHeader$uo_priv_data_ent.sru
forward
global type uo_priv_data_ent from userobject
end type
type dw_select from u_dw within uo_priv_data_ent
end type
type st_recs from statictext within uo_priv_data_ent
end type
type dw_status_sel from datawindow within uo_priv_data_ent
end type
type gb_5 from groupbox within uo_priv_data_ent
end type
type gb_1 from groupbox within uo_priv_data_ent
end type
type dw_clin_sel from datawindow within uo_priv_data_ent
end type
type tab_1 from tab within uo_priv_data_ent
end type
type tabpage_browse from userobject within tab_1
end type
type dw_browse from u_dw within tabpage_browse
end type
type st_1 from statictext within tabpage_browse
end type
type r_1 from rectangle within tabpage_browse
end type
type gb_4 from groupbox within tabpage_browse
end type
type gb_3 from groupbox within tabpage_browse
end type
type r_2 from rectangle within tabpage_browse
end type
type r_5 from rectangle within tabpage_browse
end type
type r_6 from rectangle within tabpage_browse
end type
type tabpage_browse from userobject within tab_1
dw_browse dw_browse
st_1 st_1
r_1 r_1
gb_4 gb_4
gb_3 gb_3
r_2 r_2
r_5 r_5
r_6 r_6
end type
type tabpage_detail from userobject within tab_1
end type
type dw_detail from u_dw within tabpage_detail
end type
type st_2 from statictext within tabpage_detail
end type
type r_3 from rectangle within tabpage_detail
end type
type gb_2 from groupbox within tabpage_detail
end type
type r_7 from rectangle within tabpage_detail
end type
type tabpage_detail from userobject within tab_1
dw_detail dw_detail
st_2 st_2
r_3 r_3
gb_2 gb_2
r_7 r_7
end type
type tabpage_exp_priv from userobject within tab_1
end type
type cb_1 from commandbutton within tabpage_exp_priv
end type
type dw_expired from u_dw within tabpage_exp_priv
end type
type cb_renew from commandbutton within tabpage_exp_priv
end type
type tabpage_exp_priv from userobject within tab_1
cb_1 cb_1
dw_expired dw_expired
cb_renew cb_renew
end type
type tab_1 from tab within uo_priv_data_ent
tabpage_browse tabpage_browse
tabpage_detail tabpage_detail
tabpage_exp_priv tabpage_exp_priv
end type
type rb_curr from radiobutton within uo_priv_data_ent
end type
type rb_hist from radiobutton within uo_priv_data_ent
end type
type rb_both from radiobutton within uo_priv_data_ent
end type
end forward

global type uo_priv_data_ent from userobject
integer width = 3589
integer height = 1716
long backcolor = 79741120
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event pfc_cst_priv_batch ( )
dw_select dw_select
st_recs st_recs
dw_status_sel dw_status_sel
gb_5 gb_5
gb_1 gb_1
dw_clin_sel dw_clin_sel
tab_1 tab_1
rb_curr rb_curr
rb_hist rb_hist
rb_both rb_both
end type
global uo_priv_data_ent uo_priv_data_ent

type variables
long il_prac
long il_facil
long il_clin
long il_core

string is_clinfilter = ""
string is_currfilter = ""
string is_statusfilter = ""
string is_browsefilter
end variables

forward prototypes
public function integer of_browse_filter ()
public function integer of_print ()
public function integer of_get_facility_data ()
public function integer of_retrieve_priv (long ai_pracid)
public function integer of_priv_batch (string as_type, integer al_prac, integer ai_facil)
end prototypes

event pfc_cst_priv_batch();of_priv_batch("U",il_prac,il_facil)

end event

public function integer of_browse_filter ();string ls_filter = ""
integer li_rtnval

ls_filter = is_clinfilter

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 01.20.2006 By: LeiWei
//$<reason> Fix a defect
//if ls_filter = "" then 
//	ls_filter = is_currfilter
//elseif ls_filter <> "" then 	
//	ls_filter = ls_filter + " and " + is_currfilter
//end if
if isnull(ls_filter) then ls_filter = ""
if isnull(is_currfilter) then is_currfilter = ""
if isnull(is_statusfilter) then is_statusfilter = ""

if ls_filter = "" then 
	ls_filter = is_currfilter
elseif ls_filter <> "" then 	
	if is_currfilter <> "" then
		ls_filter = ls_filter + " and " + is_currfilter
	end if
end if
//---------------------------- APPEON END ----------------------------

//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 11.21.2005 By: Cao YongWang
//$<reason> Fix a defect
//if is_statusfilter <> "" then
//	ls_filter = ls_filter + " and " + is_statusfilter
//end if
if is_statusfilter <> "" then
	If ls_filter <> "" Then
		ls_filter = ls_filter + " and " + is_statusfilter
	Else
		ls_filter = is_statusfilter
	End If
end if
//---------------------------- APPEON END ----------------------------

//messagebox("filter",ls_filter)
//li_rtnval = 
tab_1.tabpage_browse.dw_browse.setfilter(ls_filter)  
tab_1.tabpage_detail.dw_detail.setfilter(ls_filter)
//if li_rtnval = 1 then
	tab_1.tabpage_browse.dw_browse.filter()
	tab_1.tabpage_detail.dw_detail.filter()
//end if
//tab_1.tabpage_browse.dw_browse.sort()
st_recs.Text = "Record " + String( 1 ) + " of " + String( tab_1.tabpage_browse.dw_browse.RowCount() )

return 0
tab_1.selecttab (1)
tab_1.tabpage_detail.dw_detail.reset()

end function

public function integer of_print ();openwithparm(w_renew_priv_form,il_prac)
//openwithparm(w_renew_priv_form,il_facil)

return 0
end function

public function integer of_get_facility_data ();Integer li_found

li_found = dw_select.Find("parent_facility_id = " + String( gi_parent_facility ), 1, 1000 )

IF li_found > 0 THEN
	dw_select.ScrollToRow( li_found )
	dw_select.SetRow( li_found )
	dw_select.SelectRow( 0, False )
	dw_select.SelectRow( li_found, True )
//	of_retrieve_detail( li_found )	
END IF

Return 0
end function

public function integer of_retrieve_priv (long ai_pracid);//debugbreak()
integer	li_row
	dw_select.settransobject(sqlca)
	dw_select.reset()	
	il_prac = ai_pracid
	dw_select.retrieve(ai_pracid,gs_user_id)

Return 0
end function

public function integer of_priv_batch (string as_type, integer al_prac, integer ai_facil);long prac[]

long app[]
integer facil[]
gs_batch_search lst_sent

prac[1] = al_prac
if as_type = "U" then
	app[1] = 2
elseif as_type = "R" then
	app[1] = 1
end if
facil[1] = ai_facil
lst_sent.li_prac_id[] = prac[]
lst_sent.ll_app[] = app[]
lst_sent.ll_facility[] = facil[]

openwithparm(w_batch_privilege_update,lst_sent)

return 1
end function

on uo_priv_data_ent.create
this.dw_select=create dw_select
this.st_recs=create st_recs
this.dw_status_sel=create dw_status_sel
this.gb_5=create gb_5
this.gb_1=create gb_1
this.dw_clin_sel=create dw_clin_sel
this.tab_1=create tab_1
this.rb_curr=create rb_curr
this.rb_hist=create rb_hist
this.rb_both=create rb_both
this.Control[]={this.dw_select,&
this.st_recs,&
this.dw_status_sel,&
this.gb_5,&
this.gb_1,&
this.dw_clin_sel,&
this.tab_1,&
this.rb_curr,&
this.rb_hist,&
this.rb_both}
end on

on uo_priv_data_ent.destroy
destroy(this.dw_select)
destroy(this.st_recs)
destroy(this.dw_status_sel)
destroy(this.gb_5)
destroy(this.gb_1)
destroy(this.dw_clin_sel)
destroy(this.tab_1)
destroy(this.rb_curr)
destroy(this.rb_hist)
destroy(this.rb_both)
end on

type dw_select from u_dw within uo_priv_data_ent
integer x = 14
integer y = 28
integer width = 768
integer height = 1632
integer taborder = 40
boolean titlebar = true
string title = "Select Facility"
string dataobject = "d_pd_affil_status_orgs"
borderstyle borderstyle = stylebox!
end type

event clicked;call super::clicked;Integer li_row

li_row = This.GetClickedRow( )

IF li_row = 0 THEN
	tab_1.tabpage_detail.dw_detail.SetFocus( )
	Return -1
END IF

This.SelectRow( 0, False )
This.SelectRow( li_row, True )
This.ScrollToRow( li_row )
This.SetRow( li_row )


long ll_core



end event

event rowfocuschanged;call super::rowfocuschanged;//debugbreak()
//traceopen("c:\tracefile",clock!)
//TraceEnableActivity(ActESQL!)
//Tracebegin("startttttt")
//messagebox("","RFC")
Integer li_row
integer r
integer r2
li_row = dw_select.getrow()
if li_row < 1 then return
gi_facil_change = dw_select.getitemnumber(li_row,"parent_facility_id")
il_facil = gi_facil_change
tab_1.tabpage_browse.dw_browse.settransobject(sqlca)
//tab_1.tabpage_detail.dw_detail.settransobject(sqlca)
//tab_1.tabpage_detail.dw_detail.retrieve(gl_prac_id,gi_facil_change)
//r = tab_1.tabpage_browse.dw_browse.retrieve(gl_prac_id,gi_facil_change)
	r = 	tab_1.tabpage_detail.dw_detail.settransobject(sqlca)
		tab_1.tabpage_detail.dw_detail.retrieve(il_prac,gi_facil_change)//added 12-12-00 maha
		tab_1.tabpage_detail.dw_detail.ShareData( tab_1.tabpage_browse.dw_browse )
		tab_1.tabpage_detail.dw_detail.setrow(1)
		tab_1.tabpage_detail.dw_detail.scrolltorow(1)
if r > 0 then
	tab_1.tabpage_browse.dw_browse.setrow(1)
	tab_1.tabpage_browse.dw_browse.selectrow(0,false)
	tab_1.tabpage_browse.dw_browse.selectrow(1,true)	
end if
tab_1.tabpage_browse.dw_browse.setfocus() //moved from if above 022703
tab_1.tabpage_exp_priv.dw_expired.settransobject(sqlca)
//r2 = tab_1.tabpage_exp_priv.dw_expired.Retrieve(gl_prac_id,gi_facil_change)
if r2 > 0 then
	tab_1.tabpage_exp_priv.enabled = true
else 
	tab_1.tabpage_exp_priv.enabled = false
end if
//set dw clin dropdown
dw_clin_sel.settransobject(sqlca)
DataWindowChild dwchild

//dw_clin_sel.retrieve()

dw_clin_sel.insertrow(1)
dw_clin_sel.GetChild( "clinical_area_description", dwchild )
dwchild.settransobject(sqlca)
dwchild.retrieve(gi_facil_change)

dwchild.insertrow(1)
dwchild.setitem(1,"clinical_area_description","All")
dwchild.setitem(1,"clinical_area_id","0")

of_browse_filter()

if this.rowcount() > 0 then
//cb_add.enabled = true
end if
//Traceend()

end event

event retrieveend;call super::retrieveend;of_get_facility_data()
end event

type st_recs from statictext within uo_priv_data_ent
integer x = 3214
integer y = 1588
integer width = 357
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 79741120
boolean enabled = false
string text = "Record 1 of 1"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_status_sel from datawindow within uo_priv_data_ent
integer x = 2807
integer y = 148
integer width = 672
integer height = 92
integer taborder = 50
string dataobject = "d_dddw_priv_status"
boolean border = false
boolean livescroll = true
end type

event constructor;dw_status_sel.settransobject(sqlca)
DataWindowChild dwchild

//dw_status_sel.retrieve()


dw_status_sel.InsertRow( 1 )
This.GetChild( "status_code", dwchild )
dwchild.settransobject(sqlca)

//dwchild.retrieve()


dwchild.InsertRow( 1 )
dwchild.SetItem( 1, "code", "All" )
dwchild.SetItem( 1, "lookup_code", "0" )




end event

event itemchanged;integer li_row
long ll_status

ll_status = long(data) //Start Code Change ---- 06.08.2007 #V7 maha corrected from integer

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> UM-01
//$<add> 01.20.2006 By: LeiWei
//$<reason> Appeon deals with NULL value differently from that in PowerBuidler.
//$<modification> Set ll_status to 0 if it is null. 
If Isnull(ll_status) Then ll_status = 0
//---------------------------- APPEON END ----------------------------

is_statusfilter = "status_code = " + string(ll_status)
if ll_status = 0 then is_statusfilter = ""

of_browse_filter()

//messagebox("filter",is_browsefilter)

end event

type gb_5 from groupbox within uo_priv_data_ent
integer x = 2770
integer y = 92
integer width = 736
integer height = 172
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 79741120
string text = "Select Status"
end type

type gb_1 from groupbox within uo_priv_data_ent
integer x = 855
integer y = 92
integer width = 1065
integer height = 172
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 79741120
string text = "Select Clinical Area"
end type

type dw_clin_sel from datawindow within uo_priv_data_ent
integer x = 887
integer y = 148
integer width = 1019
integer height = 104
integer taborder = 30
boolean bringtotop = true
string dataobject = "d_dddw_clin_area"
boolean border = false
boolean livescroll = true
end type

event itemchanged;integer li_row

il_clin = integer(data)

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> UM-02
//$<add> 01.20.2006 By: LeiWei
//$<reason> Appeon deals with NULL value differently from that in PowerBuidler.
//$<modification> Set ll_status to 0 if it is null. 
If Isnull(il_clin) Then il_clin = 0
//---------------------------- APPEON END ----------------------------

is_clinfilter = "priv_core_clinical_area_id = " + string(il_clin)
if il_clin = 0 then is_clinfilter = "" 
if isnull(il_clin) then is_clinfilter = ""
of_browse_filter()
//messagebox("filter",is_browsefilter)

end event

type tab_1 from tab within uo_priv_data_ent
integer x = 800
integer y = 24
integer width = 2766
integer height = 1628
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 79741120
boolean raggedright = true
tabposition tabposition = tabsonbottom!
integer selectedtab = 1
tabpage_browse tabpage_browse
tabpage_detail tabpage_detail
tabpage_exp_priv tabpage_exp_priv
end type

on tab_1.create
this.tabpage_browse=create tabpage_browse
this.tabpage_detail=create tabpage_detail
this.tabpage_exp_priv=create tabpage_exp_priv
this.Control[]={this.tabpage_browse,&
this.tabpage_detail,&
this.tabpage_exp_priv}
end on

on tab_1.destroy
destroy(this.tabpage_browse)
destroy(this.tabpage_detail)
destroy(this.tabpage_exp_priv)
end on

event selectionchanged;long ll_area
integer ll_core
integer li_end
integer li_row

if newindex = 2 then
	if tab_1.tabpage_browse.dw_browse.rowcount() = 0 then return
		//ll_area = tab_1.tabpage_browse.dw_browse.getitemnumber(tab_1.tabpage_browse.dw_browse.getrow(),"pd_priv_list_clinical_area_id")//removed 12-12-00 maha
		//messagebox("ll_core", ll_core)
	li_row = tab_1.tabpage_browse.dw_browse.getrow()
	//ll_core = tab_1.tabpage_browse.dw_browse.getitemnumber(tab_1.tabpage_browse.dw_browse.getrow(),"priv_core_procd_procd_name")
	//li_end = tab_1.tabpage_detail.dw_detail.rowcount() + 1
	//li_row = tab_1.tabpage_detail.dw_detail.find( "priv_core_id = " + string(ll_core), 1, li_end )

	tab_1.tabpage_detail.dw_detail.ScrollToRow( li_row )
	tab_1.tabpage_detail.dw_detail.SetRow( li_row )
	tab_1.tabpage_detail.dw_detail.setfocus()
	tab_1.tabpage_detail.dw_detail.setcolumn("status_code")
	st_recs.Text = "Record " + string(li_row) + " of " + String(tab_1.tabpage_detail.dw_detail.RowCount())
end if

if newindex = 1 then 
st_recs.Text = "Record " + String(tab_1.tabpage_browse.dw_browse.getrow()) + " of " + String(tab_1.tabpage_browse.dw_browse.RowCount())
end if

if newindex = 3 then
	rb_both.visible = false
	rb_curr.visible = false
	rb_hist.visible = false
	gb_1.visible = false
	gb_5.visible = false
	dw_clin_sel.visible = false
	dw_status_sel.visible = false
	tab_1.tabpage_exp_priv.cb_renew.visible = true
	st_recs.Text = "Record " + String(tab_1.tabpage_exp_priv.dw_expired.getrow()) + " of " + String(tab_1.tabpage_exp_priv.dw_expired.RowCount())
else
	rb_both.visible = true
	rb_curr.visible = true
	rb_hist.visible = true
	gb_1.visible = true
	gb_5.visible = true
	dw_clin_sel.visible = true
	dw_status_sel.visible = true
	tab_1.tabpage_exp_priv.cb_renew.visible = false
end if 
end event

type tabpage_browse from userobject within tab_1
integer x = 18
integer y = 16
integer width = 2729
integer height = 1500
long backcolor = 79741120
string text = "Browse"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "Justify!"
long picturemaskcolor = 553648127
dw_browse dw_browse
st_1 st_1
r_1 r_1
gb_4 gb_4
gb_3 gb_3
r_2 r_2
r_5 r_5
r_6 r_6
end type

on tabpage_browse.create
this.dw_browse=create dw_browse
this.st_1=create st_1
this.r_1=create r_1
this.gb_4=create gb_4
this.gb_3=create gb_3
this.r_2=create r_2
this.r_5=create r_5
this.r_6=create r_6
this.Control[]={this.dw_browse,&
this.st_1,&
this.r_1,&
this.gb_4,&
this.gb_3,&
this.r_2,&
this.r_5,&
this.r_6}
end on

on tabpage_browse.destroy
destroy(this.dw_browse)
destroy(this.st_1)
destroy(this.r_1)
destroy(this.gb_4)
destroy(this.gb_3)
destroy(this.r_2)
destroy(this.r_5)
destroy(this.r_6)
end on

type dw_browse from u_dw within tabpage_browse
integer x = 9
integer y = 256
integer width = 2693
integer height = 1220
integer taborder = 11
string dataobject = "d_priv_brow_clin_area"
boolean hscrollbar = true
boolean livescroll = false
end type

event clicked;call super::clicked;
Integer li_row

li_row = This.GetClickedRow( )

IF li_row < 1 THEN
	Return
END IF


This.ScrollToRow( li_row )
This.SetRow( li_row )
//this.selectrow(0,false)
//this.selectrow(li_row,true)

end event

event doubleclicked;call super::doubleclicked;
long ll_core
integer li_row
integer li_end

if this.rowcount() > 0 then
	tab_1.selecttab (2)
	
end if
end event

event rowfocuschanged;call super::rowfocuschanged;
//IF tab_1.tabpage_detail.dw_detail.RowCount() >= currentrow THEN
	//tab_1.tabpage_detail.dw_detail.SetRow( currentrow )
	//tab_1.tabpage_detail.dw_detail.ScrollToRow( currentrow )
//END IF
this.selectrow(0,false)
this.selectrow(this.getrow(),true)

st_recs.Text = "Record " + String(This.GetRow()) + " of " + String(This.RowCount())
end event

event pfc_addrow;call super::pfc_addrow;
tab_1.tabpage_detail.dw_detail.setfocus()

return 1
end event

event pfc_deleterow;
integer res

res = messagebox("Delete","Are you sure you wish to delete the selected privilege?",Question!,yesno!,2)

if res = 1 then
	this.deleterow(this.getrow())
end if

this.update()

return 0
end event

type st_1 from statictext within tabpage_browse
integer x = 96
integer y = 4
integer width = 137
integer height = 76
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 79741120
boolean enabled = false
string text = "Filter"
boolean focusrectangle = false
end type

type r_1 from rectangle within tabpage_browse
long linecolor = 67108864
integer linethickness = 4
long fillcolor = 79741120
integer x = 1902
integer y = 212
integer width = 41
integer height = 52
end type

type gb_4 from groupbox within tabpage_browse
integer x = 1115
integer y = 52
integer width = 809
integer height = 172
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "Record Status"
end type

type gb_3 from groupbox within tabpage_browse
integer x = 1792
integer y = 1676
integer width = 2629
integer height = 260
integer taborder = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 79741120
string text = "Filter"
end type

type r_2 from rectangle within tabpage_browse
long linecolor = 33554432
integer linethickness = 4
long fillcolor = 79741120
integer x = 1888
integer y = 2312
integer width = 2606
integer height = 224
end type

type r_5 from rectangle within tabpage_browse
integer linethickness = 4
long fillcolor = 80269524
integer x = 9
integer y = 36
integer width = 2697
integer height = 204
end type

type r_6 from rectangle within tabpage_browse
long linecolor = 79741120
integer linethickness = 4
long fillcolor = 80269524
integer x = 832
integer y = 1476
integer width = 165
integer height = 144
end type

type tabpage_detail from userobject within tab_1
integer x = 18
integer y = 16
integer width = 2729
integer height = 1500
long backcolor = 79741120
string text = "Detail"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "DataWindow5!"
long picturemaskcolor = 553648127
dw_detail dw_detail
st_2 st_2
r_3 r_3
gb_2 gb_2
r_7 r_7
end type

on tabpage_detail.create
this.dw_detail=create dw_detail
this.st_2=create st_2
this.r_3=create r_3
this.gb_2=create gb_2
this.r_7=create r_7
this.Control[]={this.dw_detail,&
this.st_2,&
this.r_3,&
this.gb_2,&
this.r_7}
end on

on tabpage_detail.destroy
destroy(this.dw_detail)
destroy(this.st_2)
destroy(this.r_3)
destroy(this.gb_2)
destroy(this.r_7)
end on

type dw_detail from u_dw within tabpage_detail
integer y = 264
integer width = 2697
integer height = 1200
integer taborder = 11
string dataobject = "d_priv_list_d_entry"
end type

event clicked;call super::clicked;
Integer li_row

li_row = This.GetClickedRow( )

IF li_row < 1 THEN
	Return
END IF


This.ScrollToRow( li_row )
This.SetRow( li_row )



end event

event constructor;call super::constructor;This.SetRowFocusIndicator( Hand! )

this.of_SetDropDownCalendar( TRUE )
this.iuo_calendar.of_Register(this.iuo_calendar.DDLB)

end event

event pfc_addrow;call super::pfc_addrow;
integer li_rows
integer li_newrow
long ll_recno
long ll_procd
long ll_core
integer li_ir_stat
string ls_procd
long ll_clin
string ls_clin
string ls_core
integer r
g_str_clin_info lstr_priv
integer li_rowcount
long ll_code
integer checkrow
integer res
date ld_start
date ld_end
date nulldate

tab_1.selecttab (2)

//Start Code Change ----02.28.2008 #V8 maha - modified to allow granted selects in add screen (lehigh)
//openwithparm(w_clin_area_select,"P*" + string(il_facil))
openwithparm(w_clin_area_select,"P*" + string(il_facil) + "@" + string(il_prac) )
//End Code Change---02.28.2008

setnull(nulldate)
lstr_priv = message.powerobjectparm
//debugbreak()
if isnull(lstr_priv) then return 0

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 03.23.2006 By: Liang QingShi
//$<reason> Fix a defect.
if upperbound(lstr_priv.priv_ids[]) <= 0 then 
	of_browse_filter()
	return 0
end if
//---------------------------- APPEON END ----------------------------

li_rowcount = lstr_priv.row_count
//messagebox("li_rowcount",li_rowcount)
ll_clin = lstr_priv.clin_id
ll_code = lstr_priv.stat
li_ir_stat = lstr_priv.appnt
//messagebox("start",string(lstr_priv.dstart))
//messagebox("end",string(lstr_priv.dend))
if string(lstr_priv.dstart) = "1/1/1900" then
	//messagebox("1/1/1900","1/1/1900")
	ld_start = nulldate
else
	//messagebox("1/1/1900","else")
	ld_start = lstr_priv.dstart
end if
if string(lstr_priv.dend) = "1/1/1900" then
	ld_end  = nulldate
else
	ld_end = lstr_priv.dend
end if


tab_1.tabpage_detail.dw_detail.settransobject(sqlca)
tab_1.tabpage_detail.dw_detail.reset()
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-01
//$<modify> 02.17.2006 By: Cao YongWang
//$<reason> Performance tuning.
//$<modification> 1)Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.
//$<modification> 2)Use a datastore to retrieve data from the database instead of using SQLs in the loops in PT-03.

n_ds lds_prac
long ll_find

lds_prac = create n_ds
lds_prac.dataobject = "d_priv_core_procd_all"
lds_prac.of_settransobject(SQLCA)

gnv_appeondb.of_startqueue()
lds_prac.retrieve(lstr_priv.priv_ids[])	
//---------------------------- APPEON END ----------------------------

	
SELECT Max( pd_priv_list.rec_id )
	INTO :ll_recno  
	FROM pd_priv_list;
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-02
//$<modify> 02.17.2006 By: Cao YongWang
//$<reason> Performance tuning.
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.
gnv_appeondb.of_commitqueue()
//---------------------------- APPEON END ----------------------------

if isnull(ll_recno) then ll_recno = 0

for r = 1 to li_rowcount
	checkrow = 0
	ll_procd = lstr_priv.priv_ids[r]
	//check to see if already exists //check removed 092503 maha
//	select pd_priv_list.rec_id
//	into :checkrow
//	from pd_priv_list
//	where pd_priv_list.procd_id = :ll_procd and pd_priv_list.prac_id = :gl_prac_id and pd_priv_list.facility_id = :gi_facil_change and pd_priv_list.active_status = 1;
//	//checkrow = this.find("procd_id = " + string(ll_procd),1,this.rowcount())
//	//messagebox("checkrow",checkrow)
//	if checkrow > 0 then
//		continue
//	end if
	//create new row
	tab_1.tabpage_detail.dw_detail.insertrow (r)	
		
 
	
	ll_recno++
	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> PT-03
	//$<modify> 02.17.2006 By: Cao YongWang
	//$<reason> Performance tuning.
	//$<modification> 1)Comment out the following SQL statements and use a datastore in PT-01 to retrieve data from database.
	//$<modification> 2)Write script to retrieve data from a cache (PT-01) instead of from the database.
	
	/*
	SELECT priv_core_procd.priv_core_id 
	INTO :ll_core  
	FROM priv_core_procd
	where priv_core_procd.procd_id = :ll_procd;
	*/
	ll_find = lds_prac.find("priv_core_procd_procd_id="+string(ll_procd),1,lds_prac.rowcount())
	If ll_find > 0 then ll_core = lds_prac.getitemnumber(ll_find , 'priv_core_procd_priv_core_id')
	//---------------------------- APPEON END ----------------------------

	//messagebox("ll_core ",ll_core )
	tab_1.tabpage_detail.dw_detail.setitem(r,"rec_id",ll_recno)
	tab_1.tabpage_detail.dw_detail.setitem(r,"facility_id",gi_facil_change)
	tab_1.tabpage_detail.dw_detail.setitem(r,"prac_id",gl_prac_id)
//	il_clin = dw_store.getitemnumber(li_newrow,"priv_core_clinical_area_id")
	tab_1.tabpage_detail.dw_detail.setitem(r,"clinical_area_id",ll_clin)
	tab_1.tabpage_detail.dw_detail.setitem(r,"priv_core_id",ll_core)
	tab_1.tabpage_detail.dw_detail.setitem(r,"procd_id",ll_procd)
	tab_1.tabpage_detail.dw_detail.setitem(r,"active_status",1)
	tab_1.tabpage_detail.dw_detail.Setitem(r,"ir_code",li_ir_stat)
	if string(lstr_priv.dstart) <> "1/1/1900" then
		tab_1.tabpage_detail.dw_detail.Setitem(r,"start_date",ld_start)
	end if
	if string(lstr_priv.dend) <> "1/1/1900" then
		tab_1.tabpage_detail.dw_detail.Setitem(r,"end_date",ld_end)
	end if
	//tab_1.tabpage_detail.dw_detail.Settext("Inital")
	
	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> PT-04
	//$<modify> 02.17.2006 By: Cao YongWang
	//$<reason> Performance tuning.
	//$<modification> Write script to retrieve data from a cache instead of from the database.
	/*
	SELECT priv_core.priv_core_description 
	INTO :ls_core  
	FROM priv_core,priv_core_procd
	WHERE priv_core.priv_core_id = priv_core_procd.priv_core_id AND priv_core_procd.procd_id = :ll_procd;
	//messagebox("ls_core ", ls_core )
	SELECT priv_core_procd.core_procd_description 
	INTO :ls_procd  
	FROM priv_core_procd
	WHERE priv_core_procd.procd_id = :ll_procd;
	*/
	If ll_find > 0 then 
		ls_core = lds_prac.GetItemString(ll_find , 'priv_core_priv_core_description')
		ls_procd = lds_prac.GetItemString(ll_find , 'priv_core_procd_core_procd_description')
	End If
	//---------------------------- APPEON END ----------------------------

	//ls_procd = dw_store.getitemstring(li_newrow,"core_procd_description")
	tab_1.tabpage_detail.dw_detail.setitem(r,"pd_priv_list_priv_text",ls_procd)
//	select code_lookup.lookup_code
//	into :ll_code
//	from code_lookup
//	where code_lookup.lookup_name = 'Privilege Status' and code = 'REQST';
	tab_1.tabpage_detail.dw_detail.setitem(r,"status_code",ll_code)
	tab_1.tabpage_detail.dw_detail.setitem(r,"enter_date",datetime(today(),now()))
	//ls_core = dw_store.getitemstring(li_newrow,"priv_core_priv_core_description")
	tab_1.tabpage_detail.dw_detail.setitem(r,"priv_core_priv_core_description",ls_core)
	
NEXT
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-05
//$<add> 02.17.2006 By: Cao YongWang
//$<reason> Performance tuning.
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

gnv_appeondb.of_startqueue()
//---------------------------- APPEON END ----------------------------

this.update()
commit using sqlca;
//messagebox("","")
//--------------------------- APPEON BEGIN ---------------------------
//$<comment> 2006-07-05 By: Liu Hongxin
//$<reason> Fix Bug: Overlap with the next clause.
/*
this.retrieve(gl_prac_id,gi_facil_change)
*/
//---------------------------- APPEON END ----------------------------

tab_1.tabpage_browse.dw_browse.retrieve(gl_prac_id,gi_facil_change)
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-06
//$<add> 02.17.2006 By: Cao YongWang
//$<reason> Performance tuning.
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.
gnv_appeondb.of_commitqueue()
//---------------------------- APPEON END ----------------------------

st_recs.Text = "Record " + string(1) + " of " + String(this.RowCount())


//
//integer li_rows
//integer li_newrow
//long ll_recno
//long ll_procd
//long ll_core
//integer li_ir_stat
//string ls_procd
//long ll_clin
//string ls_clin
//string ls_core
//integer r
//g_str_clin_info lstr_priv
//integer li_rowcount
//long ll_code
//integer checkrow
//integer res
//
//open(w_clin_area_select)
//
//debugbreak()
//lstr_priv = message.powerobjectparm
//
//if isnull(lstr_priv) then return -1
//
//
//li_rowcount = lstr_priv.row_count
////messagebox("li_rowcount",li_rowcount)
//ll_clin = lstr_priv.clin_id
//li_ir_stat = lstr_priv.appnt
////messagebox("li_ir_stat",li_ir_stat)
//tab_1.selecttab (2)
////this.settransobject(sqlca)
//
//for r = 1 to li_rowcount
//	ll_procd = lstr_priv.priv_ids[r]
//	//check to see if already exists
//	checkrow = this.find("procd_id = " + string(ll_procd),1,this.rowcount())
//	//messagebox("checkrow",checkrow)
//	if checkrow > 0 then
//		continue
//	end if
//	//create new row
//	this.insertrow (li_newrow)
//	this.setrow (li_newrow)
//	this.scrolltorow (li_newrow)
//			
//	SELECT Max( pd_priv_list.rec_id )
//	INTO :ll_recno  
//	FROM pd_priv_list;
//	if isnull(ll_recno) then ll_recno = 0 
//	ll_recno = ll_recno + r
//	//messagebox("ll_recno",ll_recno)
//	SELECT priv_core_procd.priv_core_id 
//	INTO :ll_core  
//	FROM priv_core_procd
//	where priv_core_procd.procd_id = :ll_procd;
//	//messagebox("ll_core ",ll_core )
//	this.setitem(li_newrow,"rec_id",ll_recno)
//	this.setitem(li_newrow,"facility_id",gi_facil_change)
//	this.setitem(li_newrow,"prac_id",gl_prac_id)
//	this.setitem(li_newrow,"clinical_area_id",ll_clin)
//	this.setitem(li_newrow,"priv_core_id",ll_core)
//	this.setitem(li_newrow,"procd_id",ll_procd)
//	this.setitem(li_newrow,"active_status",1)
//	this.Setitem(li_newrow,"ir_code",1)
//
//
//	SELECT priv_core.priv_core_description 
//	INTO :ls_core  
//	FROM priv_core,priv_core_procd
//	WHERE priv_core.priv_core_id = priv_core_procd.priv_core_id AND priv_core_procd.procd_id = :ll_procd;
//	//messagebox("ls_core ",ls_core )
//	SELECT priv_core_procd.core_procd_description 
//	INTO :ls_procd  
//	FROM priv_core_procd
//	WHERE priv_core_procd.procd_id = :ll_procd;
//	SELECT priv_clinical_area.clinical_area_description 
//	INTO :ls_clin  
//	FROM priv_clinical_area
//	WHERE priv_clinical_area.clinical_area_id = :ll_clin;
//	
//	this.setitem(li_newrow,"priv_core_procd_procd_name",ls_procd)
//	//this.setitem(li_newrow,"priv_clinical_area_clinical_area_description",ls_clin)
//
//	select code_lookup.lookup_code
//	into :ll_code
//	from code_lookup
//	where code_lookup.lookup_name = 'Privilege Status' and code = 'REQST';
//		//messagebox("ll_code ",ll_code )
//		//messagebox("ls_core ",ls_core )
//	this.setitem(li_newrow,"status_code",ll_code)//24477
//	this.setitem(li_newrow,"priv_core_priv_core_description",ls_core)
//	
//NEXT
//this.settransobject(sqlca)
//res = this.update()
//messagebox("update",res)
//commit using sqlca;
//
//tab_1.tabpage_browse.dw_browse.retrieve(gl_prac_id,gi_facil_change)
////tab_1.tabpage_browse.dw_browse.setfocus()
//
return 1
end event

event pfc_deleterow;
integer res

res = messagebox("Delete","Are you sure you wish to delete the selected privilege?",Question!,yesno!,2)

if res = 1 then
	this.deleterow(this.getrow())
end if
this.update()

st_recs.Text = "Record " + String(This.GetRow()) + " of " + String(This.RowCount())
return 0
end event

event rowfocuschanged;call super::rowfocuschanged;st_recs.Text = "Record " + String(This.GetRow()) + " of " + String(This.RowCount())
end event

event pfc_postupdate;call super::pfc_postupdate;tab_1.tabpage_browse.dw_browse.retrieve(gl_prac_id,gi_facil_change)
return 1
end event

event rbuttondown;call super::rbuttondown;integer col
integer ret
datetime dtn
string colname
STRING DT

setnull(dtn)

col = this.getclickedcolumn()
colname = this.getcolumnname() 

if this.Describe( colname + ".ColType") = "datetime" THEN
	//messagebox("dt","dt")
	ret = messagebox("Set Null?","Would you like to set this Date to null?",question!,yesno!,2 )
	if ret = 1 then
		this.setitem(row,col,dtn)
	end if
END IF
end event

event retrieveend;call super::retrieveend;//--------------------------- APPEON BEGIN ---------------------------
//$<add> 04/11/2008 By: Ken.Guo
//$<reason> For Workaround APB Bug26914. Refresh ShareData DW's ComputerColumn UI. 
If This.Rowcount() > 0 Then
	This.Object.priv_clinical_area_clinical_area_descrip[1] = This.Object.priv_clinical_area_clinical_area_descrip[1] 
End If
//---------------------------- APPEON END ----------------------------

end event

type st_2 from statictext within tabpage_detail
integer x = 96
integer y = 4
integer width = 137
integer height = 76
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 79741120
boolean enabled = false
string text = "Filter"
boolean focusrectangle = false
end type

type r_3 from rectangle within tabpage_detail
long linecolor = 33554432
integer linethickness = 4
long fillcolor = 79741120
integer x = 22848
integer width = 2286
integer height = 228
end type

type gb_2 from groupbox within tabpage_detail
integer x = 1115
integer y = 52
integer width = 805
integer height = 172
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "Record Status"
end type

type r_7 from rectangle within tabpage_detail
integer linethickness = 4
long fillcolor = 80269524
integer x = 14
integer y = 36
integer width = 2683
integer height = 208
end type

type tabpage_exp_priv from userobject within tab_1
integer x = 18
integer y = 16
integer width = 2729
integer height = 1500
boolean enabled = false
long backcolor = 79741120
string text = "Expiring"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "PasteStatement!"
long picturemaskcolor = 553648127
cb_1 cb_1
dw_expired dw_expired
cb_renew cb_renew
end type

on tabpage_exp_priv.create
this.cb_1=create cb_1
this.dw_expired=create dw_expired
this.cb_renew=create cb_renew
this.Control[]={this.cb_1,&
this.dw_expired,&
this.cb_renew}
end on

on tabpage_exp_priv.destroy
destroy(this.cb_1)
destroy(this.dw_expired)
destroy(this.cb_renew)
end on

type cb_1 from commandbutton within tabpage_exp_priv
boolean visible = false
integer x = 1755
integer y = 24
integer width = 480
integer height = 84
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Print Request Sheet"
end type

event clicked;open(w_renew_priv_form)
end event

type dw_expired from u_dw within tabpage_exp_priv
integer x = 5
integer y = 244
integer width = 2697
integer height = 1212
integer taborder = 11
string dataobject = "d_priv_list_expired"
end type

event clicked;call super::clicked;
Integer li_row

li_row = This.GetClickedRow( )

IF li_row < 1 THEN
	Return
END IF


This.ScrollToRow( li_row )
This.SetRow( li_row )

end event

event constructor;call super::constructor;This.SetRowFocusIndicator( Hand! )
end event

event rowfocuschanged;call super::rowfocuschanged;
st_recs.Text = "Record " + String(This.GetRow()) + " of " + String(This.RowCount())
end event

type cb_renew from commandbutton within tabpage_exp_priv
boolean visible = false
integer x = 2254
integer y = 24
integer width = 421
integer height = 84
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Renew Privileges"
end type

event clicked;//integer i
//integer rcount
//integer n
//integer checkrow
//integer li_rows
//integer li_newrow
//long ll_recno
//long ll_procd
//long ll_core
//integer li_ir_stat
//string ls_procd
//long ll_clin
//string ls_core
//integer r
//long prac[]
//long app[]
//integer facil[]
//gs_batch_search lst_sent
//
//prac[1] = il_prac
//app[1] = 1
//facil[1] = il_facil
//lst_sent.li_prac_id[] = prac[]
//lst_sent.ll_app[] = app[]
//lst_sent.ll_facility[] = facil[]
//
//openwithparm(w_batch_privilege_update,lst_sent)
of_priv_batch("R",il_prac,il_facil)
//
//lstr_priv = message.powerobjectparm
//
//if isnull(lstr_priv) then return
//
//li_rowcount = lstr_priv.row_count
//if li_rowcount < 1 then return
////messagebox("li_rowcount",li_rowcount)
//ll_clin = lstr_priv.clin_id
//li_ir_stat = lstr_priv.appnt
////messagebox("li_ir_stat",li_ir_stat)
//
//tab_1.tabpage_detail.dw_detail.settransobject(sqlca)
//tab_1.tabpage_detail.dw_detail.reset()
//
//for r = 1 to li_rowcount
//	checkrow = 0
//	ll_procd = lstr_priv.priv_ids[r]
////update status if record already exists
//	select pd_priv_list.rec_id
//	into :checkrow
//	from pd_priv_list
//	where pd_priv_list.procd_id = :ll_procd and pd_priv_list.prac_id = :gl_prac_id and pd_priv_list.facility_id = :gi_facil_change and pd_priv_list.active_status = 1;
////checkrow = tab_1.tabpage_detail.dw_detail.find("procd_id = " + string(ll_procd),1,tab_1.tabpage_detail.dw_detail.rowcount())
//if checkrow > 0 then
//	update pd_priv_list
//	set active_status = 0
//	where pd_priv_list.rec_id = :checkrow;
//end if
//
//	//create new row
//	tab_1.tabpage_detail.dw_detail.insertrow (r)	
//		
//	SELECT Max( pd_priv_list.rec_id )
//	INTO :ll_recno  
//	FROM pd_priv_list;
//	if isnull(ll_recno) then ll_recno = 0 
//	//messagebox("ll_recno",ll_recno)
//	ll_recno = ll_recno + r
//	//messagebox("ll_recno",ll_recno)
//	SELECT priv_core_procd.priv_core_id 
//	INTO :ll_core  
//	FROM priv_core_procd
//	where priv_core_procd.procd_id = :ll_procd;
//	//messagebox("ll_core ",ll_core )
//	tab_1.tabpage_detail.dw_detail.setitem(r,"rec_id",ll_recno)
//	tab_1.tabpage_detail.dw_detail.setitem(r,"facility_id",gi_facil_change)
//	tab_1.tabpage_detail.dw_detail.setitem(r,"prac_id",gl_prac_id)
////	il_clin = dw_store.getitemnumber(li_newrow,"priv_core_clinical_area_id")
//	tab_1.tabpage_detail.dw_detail.setitem(r,"clinical_area_id",ll_clin)
//	tab_1.tabpage_detail.dw_detail.setitem(r,"priv_core_id",ll_core)
//	tab_1.tabpage_detail.dw_detail.setitem(r,"procd_id",ll_procd)
//	tab_1.tabpage_detail.dw_detail.setitem(r,"active_status",1)
//	tab_1.tabpage_detail.dw_detail.Setitem(r,"ir_code",2)
//	//tab_1.tabpage_detail.dw_detail.Settext("Inital")
//
//	SELECT priv_core.priv_core_description 
//	INTO :ls_core  
//	FROM priv_core,priv_core_procd
//	WHERE priv_core.priv_core_id = priv_core_procd.priv_core_id AND priv_core_procd.procd_id = :ll_procd;
//	//messagebox("ls_core ", ls_core )
//
//	select code_lookup.lookup_code
//	into :ll_code
//	from code_lookup
//	where code_lookup.lookup_name = 'Privilege Status' and code = 'REQST';
//	tab_1.tabpage_detail.dw_detail.setitem(r,"status_code",ll_code)
//	//ls_core = dw_store.getitemstring(li_newrow,"priv_core_priv_core_description")
//	tab_1.tabpage_detail.dw_detail.setitem(r,"priv_core_priv_core_description",ls_core)
//	
//NEXT
//tab_1.tabpage_detail.dw_detail.update()
//commit using sqlca;
//
//tab_1.tabpage_browse.dw_browse.retrieve(gl_prac_id,gi_facil_change)
//tab_1.tabpage_detail.dw_detail.retrieve(gl_prac_id,gi_facil_change)
//
//
//if tab_1.tabpage_exp_priv.dw_expired.retrieve(gl_prac_id,gi_facil_change) > 0 then
//	tab_1.selecttab (3)
//else
//	tab_1.tabpage_exp_priv.enabled = false 
//end if
//
end event

type rb_curr from radiobutton within uo_priv_data_ent
integer x = 1984
integer y = 148
integer width = 247
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 79741120
string text = "Current"
boolean checked = true
end type

event clicked;integer li_row
long ll_status

ll_status = 1

is_currfilter = "active_status = " + string(ll_status)
if ll_status = 0 then is_currfilter = ""


of_browse_filter()

//messagebox("filter",is_browsefilter)

end event

event constructor;integer li_row
long ll_status

ll_status = 1

is_currfilter = "active_status = " + string(ll_status)

//messagebox("is_currfilter",is_currfilter)
of_browse_filter()

end event

type rb_hist from radiobutton within uo_priv_data_ent
integer x = 2258
integer y = 148
integer width = 247
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "History"
end type

event clicked;integer li_row
long ll_status

ll_status = 0

is_currfilter = "active_status = " + string(ll_status)


of_browse_filter()

//messagebox("is_currfilter",is_currfilter)
end event

type rb_both from radiobutton within uo_priv_data_ent
integer x = 2501
integer y = 148
integer width = 219
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Both"
end type

event clicked;integer li_row
long ll_status



//is_currfilter = "(active_status = 1 or active_status = 0)"
is_currfilter = ""

of_browse_filter()

//messagebox("is_currfilter",is_currfilter)
end event

