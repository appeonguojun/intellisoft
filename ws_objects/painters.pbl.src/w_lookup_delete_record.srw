$PBExportHeader$w_lookup_delete_record.srw
forward
global type w_lookup_delete_record from w_sheet
end type
type st_1 from statictext within w_lookup_delete_record
end type
type dw_name from u_dw within w_lookup_delete_record
end type
type dw_1 from u_dw within w_lookup_delete_record
end type
type cb_restore from commandbutton within w_lookup_delete_record
end type
type cb_close from commandbutton within w_lookup_delete_record
end type
type gb_1 from groupbox within w_lookup_delete_record
end type
end forward

global type w_lookup_delete_record from w_sheet
integer width = 3648
integer height = 1912
string title = "Restore Lookup Table "
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
st_1 st_1
dw_name dw_name
dw_1 dw_1
cb_restore cb_restore
cb_close cb_close
gb_1 gb_1
end type
global w_lookup_delete_record w_lookup_delete_record

type variables
string is_lookup_name
String is_sort_column

end variables

on w_lookup_delete_record.create
int iCurrent
call super::create
this.st_1=create st_1
this.dw_name=create dw_name
this.dw_1=create dw_1
this.cb_restore=create cb_restore
this.cb_close=create cb_close
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.dw_name
this.Control[iCurrent+3]=this.dw_1
this.Control[iCurrent+4]=this.cb_restore
this.Control[iCurrent+5]=this.cb_close
this.Control[iCurrent+6]=this.gb_1
end on

on w_lookup_delete_record.destroy
call super::destroy
destroy(this.st_1)
destroy(this.dw_name)
destroy(this.dw_1)
destroy(this.cb_restore)
destroy(this.cb_close)
destroy(this.gb_1)
end on

event open;datawindowchild ldwc
long ll_row

dw_name.accepttext()
dw_name.getchild( "lookup_name", ldwc)
ldwc.settransobject(sqlca)
ldwc.retrieve()
dw_name.insertrow(0)

is_lookup_name = message.stringparm
if isnull(is_lookup_name) then is_lookup_name = ''
if  is_lookup_name = '' then 
	if ldwc.rowcount() > 0 then
		is_lookup_name = ldwc.getitemstring(1, "lookup_name")
	end if
end if

dw_name.setitem(1, "lookup_name", is_lookup_name)
dw_1.settransobject(sqlca)
dw_1.retrieve(is_lookup_name)

this.title = 'Restore Lookup Table: [' + is_lookup_name + ']'


end event

event resize;//
end event

type st_1 from statictext within w_lookup_delete_record
integer x = 41
integer y = 68
integer width = 343
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Lookup Table:"
boolean focusrectangle = false
end type

type dw_name from u_dw within w_lookup_delete_record
integer x = 357
integer y = 52
integer width = 1239
integer height = 92
integer taborder = 40
boolean bringtotop = true
string dataobject = "d_lookup_delete_select"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
borderstyle borderstyle = stylebox!
end type

event constructor;This.of_SetUpdateable(False)



end event

event pfc_retrieve;call super::pfc_retrieve;Return This.Retrieve()
end event

event pfc_update;call super::pfc_update;
Return 0
end event

event itemchanged;call super::itemchanged;if row < 1 then return

if dwo.name = 'lookup_name' then
	is_lookup_name = data
	dw_1.settransobject(sqlca)
	dw_1.retrieve(is_lookup_name)
end if

parent.title = 'Restore Lookup Table: [' + is_lookup_name + ']'
end event

type dw_1 from u_dw within w_lookup_delete_record
event ue_leftbuttonup pbm_dwnlbuttonup
event ue_set_sort ( integer xpos,  integer ypos,  long row,  dwobject dwo,  string as_sort_column )
integer x = 18
integer y = 164
integer width = 3593
integer height = 1652
integer taborder = 10
string title = "Browse"
string dataobject = "dw_code_lookup_delete_record"
boolean hscrollbar = true
boolean livescroll = false
end type

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

//If GetRow() > 0 Then ll_id = This.GetItemNumber(GetRow(),'id')

//this.SetSort(of_replace_sort(this.inv_sort.of_getsort()))
this.SetSort(this.inv_sort.of_getsort())
This.sort()

//ll_findrow = This.Find('id = ' + String(ll_id),1, This.RowCount())
//If ll_findrow > 0 Then
//	this.SetRow(ll_findrow)
//	this.ScrollToRow(ll_findrow)
//End If

this.setredraw(true)

end event

event clicked;string ls_objectname,ls_sort_column
ls_objectname = string(dwo.name) 
If row = 0 and this.describe(ls_objectname+".band") = "header" and this.describe(ls_objectname + ".text") <> "!" Then 
	ls_sort_column = left(ls_objectname,len(ls_objectname) - 2)
	is_sort_column = ls_sort_column
	this.event ue_set_sort(xpos,ypos,row,dwo,ls_sort_column)
End If



end event

event constructor;call super::constructor;this.of_setupdateable(false)
end event

type cb_restore from commandbutton within w_lookup_delete_record
integer x = 2766
integer y = 44
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
string text = "&Restore"
end type

event clicked;long ll_row,ll_rtn,ll_lookup_code,ll_find,ll_select,ll_cnt
boolean lb_fail = false
datawindowchild ldwc

dw_1.accepttext( )
ll_find = dw_1.find("selected = 1", 1, dw_1.rowcount())
if isnull(ll_find) then ll_find = 0
if ll_find < 1 then 
	messagebox('Information','Please select the lookup record(s) that you want to restore.')
	return
end if

ll_rtn = messagebox('Information','Are you sure you want to restore the selected lookup record(s)?',Question!,YesNo!)
if ll_rtn <> 1 then return
for ll_row = 1 to dw_1.rowcount()
	ll_select = dw_1.getitemnumber(ll_row,"selected")
	if ll_select = 1 then
		ll_lookup_code = dw_1.getitemnumber(ll_row,"lookup_code")
		select count(*) into :ll_cnt from code_lookup where lookup_code = :ll_lookup_code;
		if ll_cnt < 1 then
			insert into code_lookup (lookup_code, lookup_name, code, description, type, custom_1, custom_2, custom_3, custom_4, custom_5, custom_6, caqh_code, 
								ic_n, ic_c, modify_date, Large_Description_1, Large_Description_2, Money_1, Money_2, Integer_1, Integer_2, Integer_3, Integer_4,
								Integer_5,Integer_6, Integer_7, Integer_8, datetime_1, datetime_2)
			select lookup_code, lookup_name, code, description, type, custom_1, custom_2, custom_3, custom_4, custom_5, custom_6, caqh_code, ic_n, ic_c, modify_date, Large_Description_1, 
			Large_Description_2, Money_1, Money_2, Integer_1, Integer_2, Integer_3, Integer_4, Integer_5,Integer_6, Integer_7, Integer_8, datetime_1, datetime_2
			from code_lookup_delete_record
			where code_lookup_delete_record.lookup_code = :ll_lookup_code;
			if sqlca.sqlcode <> 0 then
				lb_fail = true
			else
				delete from code_lookup_delete_record where lookup_code = :ll_lookup_code;
			end if
		end if
	end if
next

if not lb_fail then 
	Messagebox('Restore','Restore the select lookup record(s) successful.')
else
	Messagebox('Restore','Restore the select lookup record(s) failed.')
end if

dw_1.settransobject(sqlca)
dw_1.retrieve(is_lookup_name)
dw_name.reset()
dw_name.insertrow(0)
dw_name.getchild( "lookup_name", ldwc)
ldwc.settransobject(sqlca)
ldwc.retrieve()

if isvalid(w_lookup_maint) then
	w_lookup_maint.Tab_1.Tabpage_Browse.dw_Browse.Event pfc_Retrieve()
	w_lookup_maint.of_count()
	w_lookup_maint.dw_name.of_SetTransObject(SQLCA)
	datawindowchild ldwc_child
	w_lookup_maint.dw_name.GetChild("lookup_name",ldwc_child)
	ldwc_child.SettransObject(SQLCA)
	ldwc_child.Retrieve()
	dw_name.Retrieve()
   	dw_name.InsertRow(0)
	dw_name.SetText(is_lookup_name)
end if

end event

type cb_close from commandbutton within w_lookup_delete_record
integer x = 3118
integer y = 44
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

type gb_1 from groupbox within w_lookup_delete_record
integer x = 18
integer width = 3593
integer height = 152
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
end type

