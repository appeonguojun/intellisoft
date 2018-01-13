$PBExportHeader$w_expression_choose_fields.srw
forward
global type w_expression_choose_fields from w_response
end type
type cbx_visible from checkbox within w_expression_choose_fields
end type
type cb_clear from commandbutton within w_expression_choose_fields
end type
type cb_2 from commandbutton within w_expression_choose_fields
end type
type cb_ok from commandbutton within w_expression_choose_fields
end type
type dw_1 from u_dw within w_expression_choose_fields
end type
type st_1 from statictext within w_expression_choose_fields
end type
end forward

global type w_expression_choose_fields from w_response
integer width = 1833
integer height = 1912
string title = "Choose Fields"
cbx_visible cbx_visible
cb_clear cb_clear
cb_2 cb_2
cb_ok cb_ok
dw_1 dw_1
st_1 st_1
end type
global w_expression_choose_fields w_expression_choose_fields

type variables
str_pass istr_pass
end variables

forward prototypes
public function string of_get_dw_table_keys (datawindow adw_1)
end prototypes

public function string of_get_dw_table_keys (datawindow adw_1);//////////////////////////////////////////////////////////////////////
// Function: of_get_dw_table_keys()
// Arguments:
// 	value    datawindow    adw_1
//--------------------------------------------------------------------
// Return:  string
//--------------------------------------------------------------------
// Author:	 Harry 2016-08-22.
//--------------------------------------------------------------------
// Description: Get the Key of Datawindow
//--------------------------------------------------------------------
//////////////////////////////////////////////////////////////////////


String ls_ret
String ls_table_name
Long  	i
long	ll_col_count

If Not IsValid (adw_1)  Then Return ''

ls_ret = ""

ls_table_name = adw_1.Describe("DataWindow.Table.UpdateTable")

If IsNull(ls_table_name) or ls_table_name = '' or ls_table_name = '?' Then Return ls_ret

ll_col_count = Long(adw_1.Describe("DataWindow.Column.Count"))

For i = 1 To ll_col_count
	If Lower(adw_1.Describe("#" + String(i) +".Key") ) = 'yes' Then
		ls_ret += adw_1.Describe("#" + String(i) +".name") + ","
	End If
Next 

If Len(ls_ret) > 1 Then ls_ret = Left(ls_ret, Len(ls_ret) - 1)

Return ls_ret 


end function

on w_expression_choose_fields.create
int iCurrent
call super::create
this.cbx_visible=create cbx_visible
this.cb_clear=create cb_clear
this.cb_2=create cb_2
this.cb_ok=create cb_ok
this.dw_1=create dw_1
this.st_1=create st_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cbx_visible
this.Control[iCurrent+2]=this.cb_clear
this.Control[iCurrent+3]=this.cb_2
this.Control[iCurrent+4]=this.cb_ok
this.Control[iCurrent+5]=this.dw_1
this.Control[iCurrent+6]=this.st_1
end on

on w_expression_choose_fields.destroy
call super::destroy
destroy(this.cbx_visible)
destroy(this.cb_clear)
destroy(this.cb_2)
destroy(this.cb_ok)
destroy(this.dw_1)
destroy(this.st_1)
end on

event open;call super::open;//====================================================================
// Event: open
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:         Ken.Guo 2016-08-19
//--------------------------------------------------------------------
//Copyright (c) 2008-2016 Contract Logix, Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


String ls_oldvalue, ls_arr[],ls_ColumnList[],ls_col_shortname,ls_type, ls_visible, ls_key
Long i,ll_Cnt, ll_Num,ll_Row,li_pos
pfc_cst_u_band ldw_band

istr_pass = message.powerobjectparm
ls_oldvalue =  istr_pass.s_string

ldw_band = istr_pass.s_u_dw		
ldw_band.iuo_parent.uo_band.dw_syntax.inv_base.of_getobjects( ls_ColumnList, "column", "*", False,True)

//filter table key
ls_key = of_get_dw_table_keys(ldw_band.iuo_parent.uo_band.dw_syntax) + ','

ll_Cnt = UpperBound(ls_ColumnList)
For ll_Num = 1 To ll_Cnt
	if pos(ls_ColumnList[ll_Num],'[') > 0 and pos(ls_ColumnList[ll_Num],']') > 0 then
		li_pos = pos(ls_ColumnList[ll_Num],'[')
		ls_col_shortname = Left(ls_ColumnList[ll_Num],li_pos - 2)
	else
		ls_col_shortname = ls_ColumnList[ll_Num]
	end If
	If Pos(ls_key, ls_col_shortname + ',') > 0 Then Continue //filter table key.
	ls_type = ldw_band.iuo_parent.uo_band.dw_syntax.describe(ls_col_shortname + '.coltype')	
	ls_visible = ldw_band.iuo_parent.uo_band.dw_syntax.describe(ls_col_shortname + '.visible')
	
	ll_Row = dw_1.InsertRow(0)	
	If ls_visible = '0' or ls_visible = '?' or ls_visible = '!' then
		dw_1.setitem(ll_row, 'visible',0 )
	Else
		dw_1.setitem(ll_row, 'visible',1 )
	End If
	dw_1.setitem(ll_row, 'field_name',ls_col_shortname )
	dw_1.setitem(ll_row, 'datatype',ls_type )
	dw_1.SetItem(ll_Row,"export_field_name",ls_ColumnList[ll_Num])
Next

gnv_string.of_parsetoarray(ls_oldvalue, ';', ls_arr[])
For i = 1 to Upperbound(ls_arr[])
	ll_row = dw_1.find('field_name = "' +ls_arr[i]+ '"',  1, dw_1.rowcount())
	If ll_row > 0 Then
		dw_1.setitem(ll_row, 'selected', 1)
	End If
Next

cbx_visible.event clicked( )
//If dw_1.RowCount( ) > 0 Then	
//	dw_1.setfilter('visible=1')
//	dw_1.filter()
//	dw_1.SelectRow( 0, False)
//	dw_1.setsort("selected desc, export_field_name asc")
//	dw_1.sort()
//End If

end event

type cbx_visible from checkbox within w_expression_choose_fields
integer x = 41
integer y = 1588
integer width = 814
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Show all invisible fields"
end type

event clicked;If this.checked Then
	dw_1.setfilter('')
Else
	dw_1.setfilter('visible=1')
End If
dw_1.filter()
dw_1.SelectRow( 0, False)
dw_1.setsort("selected desc, export_field_name asc")
dw_1.sort()
end event

type cb_clear from commandbutton within w_expression_choose_fields
integer x = 41
integer y = 1696
integer width = 343
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Clea&r"
boolean default = true
end type

event clicked;Long i, ll_row
string ls_collist
For i = 1 to dw_1.rowcount()
	dw_1.setitem(i, 'selected',0)
Next


end event

type cb_2 from commandbutton within w_expression_choose_fields
integer x = 1426
integer y = 1696
integer width = 343
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Cancel"
boolean cancel = true
end type

event clicked;closewithreturn(Parent, 'Cancel')
end event

type cb_ok from commandbutton within w_expression_choose_fields
integer x = 1056
integer y = 1696
integer width = 343
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&OK"
boolean default = true
end type

event clicked;Long i, ll_row
string ls_collist
For i = 1 to dw_1.rowcount()
	If dw_1.getitemnumber(i, 'selected') = 1 Then
		If ls_collist = '' Then
			ls_collist = dw_1.getitemstring(i, 'field_name')
		Else
			ls_collist = ls_collist + ';' + dw_1.getitemstring(i, 'field_name')
		End if		
	End If
Next

If ls_collist = '' Then
	closewithreturn(Parent, 'No Data')
Else
	closewithreturn(Parent, ls_collist)
End If

end event

type dw_1 from u_dw within w_expression_choose_fields
integer x = 23
integer y = 12
integer width = 1774
integer height = 1560
integer taborder = 10
string dataobject = "d_expression_choose_fields"
end type

event constructor;call super::constructor;this.of_setupdateable( False)
end event

type st_1 from statictext within w_expression_choose_fields
boolean visible = false
integer x = 32
integer y = 16
integer width = 1705
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Please choose field(s) of the same data type as the corresponding expression."
boolean focusrectangle = false
end type

