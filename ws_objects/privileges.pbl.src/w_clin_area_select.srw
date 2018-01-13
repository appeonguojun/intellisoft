﻿$PBExportHeader$w_clin_area_select.srw
forward
global type w_clin_area_select from pfc_w_response
end type
type dw_clin from datawindow within w_clin_area_select
end type
type cb_ok from commandbutton within w_clin_area_select
end type
type cb_cancel from commandbutton within w_clin_area_select
end type
type st_1 from statictext within w_clin_area_select
end type
type dw_priv from datawindow within w_clin_area_select
end type
type cb_all from commandbutton within w_clin_area_select
end type
type rb_ini from radiobutton within w_clin_area_select
end type
type rb_reap from radiobutton within w_clin_area_select
end type
type dw_status from datawindow within w_clin_area_select
end type
type st_3 from statictext within w_clin_area_select
end type
type em_s from editmask within w_clin_area_select
end type
type em_e from editmask within w_clin_area_select
end type
type st_4 from statictext within w_clin_area_select
end type
type st_5 from statictext within w_clin_area_select
end type
type gb_1 from groupbox within w_clin_area_select
end type
end forward

global type w_clin_area_select from pfc_w_response
integer x = 91
integer y = 96
integer width = 3305
integer height = 2200
string title = "Select Privileges"
long backcolor = 80269524
dw_clin dw_clin
cb_ok cb_ok
cb_cancel cb_cancel
st_1 st_1
dw_priv dw_priv
cb_all cb_all
rb_ini rb_ini
rb_reap rb_reap
dw_status dw_status
st_3 st_3
em_s em_s
em_e em_e
st_4 st_4
st_5 st_5
gb_1 gb_1
end type
global w_clin_area_select w_clin_area_select

type variables
long il_clin_id
integer ii_appstat
string is_appstat
long il_stat
integer ii_close = 0
long ii_facil
long il_prac //maha022708
datastore ids_prac_privs
end variables

on w_clin_area_select.create
int iCurrent
call super::create
this.dw_clin=create dw_clin
this.cb_ok=create cb_ok
this.cb_cancel=create cb_cancel
this.st_1=create st_1
this.dw_priv=create dw_priv
this.cb_all=create cb_all
this.rb_ini=create rb_ini
this.rb_reap=create rb_reap
this.dw_status=create dw_status
this.st_3=create st_3
this.em_s=create em_s
this.em_e=create em_e
this.st_4=create st_4
this.st_5=create st_5
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_clin
this.Control[iCurrent+2]=this.cb_ok
this.Control[iCurrent+3]=this.cb_cancel
this.Control[iCurrent+4]=this.st_1
this.Control[iCurrent+5]=this.dw_priv
this.Control[iCurrent+6]=this.cb_all
this.Control[iCurrent+7]=this.rb_ini
this.Control[iCurrent+8]=this.rb_reap
this.Control[iCurrent+9]=this.dw_status
this.Control[iCurrent+10]=this.st_3
this.Control[iCurrent+11]=this.em_s
this.Control[iCurrent+12]=this.em_e
this.Control[iCurrent+13]=this.st_4
this.Control[iCurrent+14]=this.st_5
this.Control[iCurrent+15]=this.gb_1
end on

on w_clin_area_select.destroy
call super::destroy
destroy(this.dw_clin)
destroy(this.cb_ok)
destroy(this.cb_cancel)
destroy(this.st_1)
destroy(this.dw_priv)
destroy(this.cb_all)
destroy(this.rb_ini)
destroy(this.rb_reap)
destroy(this.dw_status)
destroy(this.st_3)
destroy(this.em_s)
destroy(this.em_e)
destroy(this.st_4)
destroy(this.st_5)
destroy(this.gb_1)
end on

event open;call super::open;string ls_from
string ls_val //maha 022708
integer f
long req


ls_val = message.stringparm
//format P*1@234
ls_from = mid(ls_val,1,1)

//Start Code Change ----02.27.2008 #V8 maha - added code for pre checking granted privileges
ii_facil = integer(mid(ls_val,3,pos(ls_val,"@") - 3))
il_prac = long(mid(ls_val,pos(ls_val,"@") + 1))

ids_prac_privs = create datastore

ids_prac_privs.dataobject = "d_prac_priv_granted_4_area"
ids_prac_privs.settransobject(sqlca)
//ids_prac_privs.retrieve( ll_prac)
//End Code Change---02.27.2008

dw_clin.settransobject(sqlca)
DataWindowChild dwchild

dw_clin.GetChild( "clinical_area_description", dwchild )
dwchild.settransobject(sqlca)
dw_status.settransobject(sqlca)
ii_appstat = 2 //"Recred"

gnv_appeondb.of_startqueue()
	dw_clin.retrieve()
	dwchild.retrieve(ii_facil)
	dw_status.retrieve()
gnv_appeondb.of_commitqueue()

dw_clin.insertrow(1)
dw_status.insertrow(1)

dw_status.GetChild( "status_code", dwchild )
f = dwchild.find("code = 'REQST'",1,dwchild.rowcount())

req = dwchild.getitemnumber(f,"lookup_code")

dw_status.setitem(1,"status_code",req)
	
if ls_from = "B" then	//Start Code Change ----03.25.2008 #V8 maha - moved down from the set child
	em_e.Visible = false
	em_s.Visible = false
	st_3.Visible = false
	st_4.Visible = false
	st_5.Visible = false
	dw_status.enabled = false
end if
end event

event closequery;//ancestor override
if ii_close = 0 then
	cb_cancel.triggerevent(clicked!)
end if
end event

event close;call super::close;//Start Code Change ----02.27.2008 #V8 maha
destroy ids_prac_privs
//End Code Change---02.27.2008
end event

type dw_clin from datawindow within w_clin_area_select
integer x = 50
integer y = 124
integer width = 1010
integer height = 88
integer taborder = 10
boolean bringtotop = true
string dataobject = "d_dddw_clin_area"
boolean border = false
boolean livescroll = true
end type

event itemchanged;//Start Code Change ----02.27.2008 #V8 maha
integer pc
integer rc
integer r
integer p
long ll_proced

il_clin_id = long(data)

dw_priv.settransobject(sqlca)

rc = dw_priv.retrieve(ii_facil,il_clin_id ) //corrected variable 01-09-01 maha
pc = ids_prac_privs.retrieve( il_prac,il_clin_id,ii_facil )
//st_2.visible = true

if rc > 0 and pc > 0 then
	for r = 1 to rc //for each procedure see if the prac has granted priv and  
		ll_proced = dw_priv.getitemnumber(r,"priv_core_procd_procd_id")
		p = ids_prac_privs.find("pd_priv_list_procd_id = " + string(ll_proced),1,pc)
		if p > 0 then
			dw_priv.setitem(r,"selected",1)
		end if
	next
end if

//End Code Change---02.27.2008
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

type cb_ok from commandbutton within w_clin_area_select
integer x = 2615
integer y = 1924
integer width = 306
integer height = 84
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&OK"
boolean default = true
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

if il_stat = 0 then
	
	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> PT-03
	//$<modify> 02.14.2006 By: Wangchao
	//$<reason> Performance tuning
	//$<modification> Write script to retrieve data from a cache instead of from the database.
	
	/*
	select code_lookup.lookup_code
	into :il_stat
	from code_lookup
	where code_lookup.lookup_name = 'Privilege Status' and code = 'REQST';
	*/
	
	il_stat = long(gnv_data.of_getitem('code_lookup','lookup_code',"upper(lookup_name) = 'PRIVILEGE STATUS' and upper(code) = 'REQST'"))
	
	//---------------------------- APPEON END ----------------------------

end if

IF il_stat = 0 THEN
	MessageBox("Select Error", "Select a Status." )
	dw_clin.SetFocus( )
	Return 0
END IF

f_filter = "selected = 1"
//debugbreak()
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

//get status value if left blank
if il_stat = 0 then
	
	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> PT-04
	//$<modify> 02.14.2006 By: Wangchao
	//$<reason> Performance tuning
	//$<modification> Write script to retrieve data from a cache instead of from the database.

	
	/*
	select code_lookup.lookup_code
	into :il_stat
	from code_lookup
	where code_lookup.lookup_name = 'Privilege Status' and code = 'REQST';
	*/
	
	il_stat = long(gnv_data.of_getitem('code_lookup','lookup_code',"upper(lookup_name) = 'PRIVILEGE STATUS' and upper(code) = 'REQST'"))
	
	//---------------------------- APPEON END ----------------------------
	
end if

lstr_priv.appnt = ii_appstat
lstr_priv.stat = il_stat
//messagebox("end",em_e.text)
if em_s.text <> "" then
	lstr_priv.dstart = date(em_s.text)
end if
if em_e.text <> "" then
	lstr_priv.dend = date(em_e.text)
end if
//messagebox("stat",lstr_priv.appnt)
ii_close = 1
CloseWithReturn( Parent, lstr_priv )
end event

type cb_cancel from commandbutton within w_clin_area_select
integer x = 2939
integer y = 1924
integer width = 306
integer height = 84
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Cancel"
boolean cancel = true
end type

event clicked;g_str_clin_info lstr_priv
ii_close = 1
Closewithreturn(parent,lstr_priv)
//Close(parent)
end event

type st_1 from statictext within w_clin_area_select
integer x = 46
integer y = 64
integer width = 631
integer height = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Select a Clinical Area to add."
boolean focusrectangle = false
end type

type dw_priv from datawindow within w_clin_area_select
integer x = 18
integer y = 272
integer width = 3223
integer height = 1632
integer taborder = 50
boolean bringtotop = true
string dataobject = "d_priv_add_select"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type cb_all from commandbutton within w_clin_area_select
integer x = 23
integer y = 1924
integer width = 306
integer height = 84
integer taborder = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Select All"
end type

event clicked;//Start Code Change ---- 10.03.2006 #661 maha added unselect all code
long li_rowcnt
long li_row
integer li_val

if dw_priv.rowcount() = 0 then return

 li_rowcnt = dw_priv.rowcount()
 
if this.text = "&Select All" then
	li_val = 1
	this.text = "&Unselect All"
else //deselect
	li_val = 0
	this.text = "&Select All"
end if

//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 01/11/2008 By: Ken.Guo
//$<reason> For Performance
/*
for li_row = 1 to li_rowcnt
	dw_priv.setitem(li_row, "selected" ,li_val)
next
*/
Integer li_value0[],li_value1[]
For li_row = 1 To li_rowcnt
	li_value0[li_row] = 0
	li_value1[li_row] = 1
Next
If li_val = 1 Then
	dw_priv.object.selected[1,li_rowcnt] = li_value1
Else 
	dw_priv.object.selected[1,li_rowcnt] = li_value0	
End If
//---------------------------- APPEON END ----------------------------

//End Code Change---10.03.2006 
end event

type rb_ini from radiobutton within w_clin_area_select
integer x = 1134
integer y = 128
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
string text = "Inital"
end type

event clicked;ii_appstat = 1//"Inital"
end event

type rb_reap from radiobutton within w_clin_area_select
integer x = 1408
integer y = 128
integer width = 297
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
string text = "Reapply"
boolean checked = true
end type

event clicked;ii_appstat = 2  //"Renew"
end event

type dw_status from datawindow within w_clin_area_select
integer x = 1797
integer y = 124
integer width = 681
integer height = 84
integer taborder = 20
boolean bringtotop = true
string dataobject = "d_dddw_priv_status"
boolean border = false
boolean livescroll = true
end type

event itemchanged;il_stat = long(data)
end event

type st_3 from statictext within w_clin_area_select
integer x = 1797
integer y = 68
integer width = 302
integer height = 52
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Select Status:"
boolean focusrectangle = false
end type

type em_s from editmask within w_clin_area_select
integer x = 2496
integer y = 124
integer width = 325
integer height = 80
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/dd/yyyy"
end type

type em_e from editmask within w_clin_area_select
integer x = 2853
integer y = 124
integer width = 325
integer height = 80
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/dd/yyyy"
end type

type st_4 from statictext within w_clin_area_select
integer x = 2491
integer y = 68
integer width = 133
integer height = 52
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Start:"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_5 from statictext within w_clin_area_select
integer x = 2848
integer y = 68
integer width = 114
integer height = 52
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "End:"
alignment alignment = center!
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_clin_area_select
integer x = 23
integer y = 4
integer width = 3223
integer height = 252
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
end type

