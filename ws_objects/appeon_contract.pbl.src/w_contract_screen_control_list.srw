$PBExportHeader$w_contract_screen_control_list.srw
forward
global type w_contract_screen_control_list from w_response
end type
type cb_refresh from commandbutton within w_contract_screen_control_list
end type
type cbx_visible from checkbox within w_contract_screen_control_list
end type
type cb_find from commandbutton within w_contract_screen_control_list
end type
type sle_find from singlelineedit within w_contract_screen_control_list
end type
type cb_goto from commandbutton within w_contract_screen_control_list
end type
type cb_properties from commandbutton within w_contract_screen_control_list
end type
type cb_close from commandbutton within w_contract_screen_control_list
end type
type dw_controllist from u_dw within w_contract_screen_control_list
end type
end forward

global type w_contract_screen_control_list from w_response
integer x = 214
integer y = 221
integer width = 2533
integer height = 1564
string title = "Control List"
cb_refresh cb_refresh
cbx_visible cbx_visible
cb_find cb_find
sle_find sle_find
cb_goto cb_goto
cb_properties cb_properties
cb_close cb_close
dw_controllist dw_controllist
end type
global w_contract_screen_control_list w_contract_screen_control_list

type variables
str_dw_objlist istr_dw_objlist
pfc_cst_u_contract_data_design inv_data_design

Long il_find
end variables

forward prototypes
public subroutine of_display_columns (string as_objlist[], string as_band)
end prototypes

public subroutine of_display_columns (string as_objlist[], string as_band);//====================================================================
// Function: of_display_columns
//--------------------------------------------------------------------
// Description: Add object list from  band
//--------------------------------------------------------------------
// Arguments:
//                as_objlist[]
//                as_band
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:         Ken.Guo           Date: 09/16/2014
//--------------------------------------------------------------------
//Copyright (c) 2008-2013 Contract Logix, Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


pfc_cst_u_band ldw_band
Long i,ll_cnt,ll_row
String ls_type

ll_cnt = UpperBound(as_objlist[])
If ll_cnt = 0 Then Return 

Choose Case as_band
	Case 'header'
		ldw_band = inv_data_design.uo_band.dw_header
	Case 'detail'
		ldw_band = inv_data_design.uo_band.dw_detail
	Case 'summary'
		ldw_band = inv_data_design.uo_band.dw_summary
	Case 'footer'
		ldw_band = inv_data_design.uo_band.dw_footer
End Choose

For i = 1 To ll_cnt
	If Lower(Left(as_objlist[i],17)) = 'draw_select_mark_' Then Continue
	If ldw_band.describe( as_objlist[i] + '.visible') = '0' Then Continue
	ll_row = dw_controllist.insertrow(0)
	dw_controllist.SetItem(ll_row, 'object_name',as_objlist[i] )
	dw_controllist.SetItem(ll_row, 'band',as_band)
	dw_controllist.SetItem(ll_row, 'band_height',Long(ldw_band.Describe("DataWindow."+as_band+".Height")))
	
	ls_type = ldw_band.describe( as_objlist[i] + '.type'  )
	dw_controllist.SetItem(ll_row, 'object_type', ls_type )
	Choose Case ls_type 
		Case 'line'
			dw_controllist.SetItem(ll_row, 'x', Long(ldw_band.describe( as_objlist[i] + '.x1'  ) ))
			dw_controllist.SetItem(ll_row, 'y', Long(ldw_band.describe( as_objlist[i] + '.y1'  ) ))
			dw_controllist.SetItem(ll_row, 'x2' ,Long(ldw_band.describe( as_objlist[i] + '.x2'  ) ))
			dw_controllist.SetItem(ll_row, 'y2',Long(ldw_band.describe( as_objlist[i] + '.y2'  ) ))
		Case Else
			dw_controllist.SetItem(ll_row, 'x', Long(ldw_band.describe( as_objlist[i] + '.x'  ) ))
			dw_controllist.SetItem(ll_row, 'y', Long(ldw_band.describe( as_objlist[i] + '.y'  ) ))
			dw_controllist.SetItem(ll_row, 'width', Long(ldw_band.describe( as_objlist[i] + '.width'  ) ))
			dw_controllist.SetItem(ll_row, 'height', Long(ldw_band.describe( as_objlist[i] + '.height'  ) )	)	
	End Choose
	dw_controllist.SetItem(ll_row, 'visible', ldw_band.describe( as_objlist[i] + '.visible'  ) )
Next


Return 


end subroutine

on w_contract_screen_control_list.create
int iCurrent
call super::create
this.cb_refresh=create cb_refresh
this.cbx_visible=create cbx_visible
this.cb_find=create cb_find
this.sle_find=create sle_find
this.cb_goto=create cb_goto
this.cb_properties=create cb_properties
this.cb_close=create cb_close
this.dw_controllist=create dw_controllist
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_refresh
this.Control[iCurrent+2]=this.cbx_visible
this.Control[iCurrent+3]=this.cb_find
this.Control[iCurrent+4]=this.sle_find
this.Control[iCurrent+5]=this.cb_goto
this.Control[iCurrent+6]=this.cb_properties
this.Control[iCurrent+7]=this.cb_close
this.Control[iCurrent+8]=this.dw_controllist
end on

on w_contract_screen_control_list.destroy
call super::destroy
destroy(this.cb_refresh)
destroy(this.cbx_visible)
destroy(this.cb_find)
destroy(this.sle_find)
destroy(this.cb_goto)
destroy(this.cb_properties)
destroy(this.cb_close)
destroy(this.dw_controllist)
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
// Author:         Ken.Guo           Date: 09/16/2014
//--------------------------------------------------------------------
//Copyright (c) 2008-2013 Contract Logix, Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


cb_refresh.event clicked( )
end event

event pfc_preopen;call super::pfc_preopen;istr_dw_objlist = Message.powerobjectparm
inv_data_design = istr_dw_objlist.uo_design 
end event

type cb_refresh from commandbutton within w_contract_screen_control_list
integer x = 1417
integer y = 1340
integer width = 343
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Refresh"
end type

event clicked;
SetPointer(HourGlass!)
dw_controllist.Reset()

of_display_columns(istr_dw_objlist.as_header_objlist,'header' )
of_display_columns(istr_dw_objlist.as_detail_objlist,'detail' )
of_display_columns(istr_dw_objlist.as_summary_objlist,'summary' )
of_display_columns(istr_dw_objlist.as_footer_objlist,'footer' )

cbx_visible.event clicked( )

dw_controllist.setsort('object_name asc')
dw_controllist.sort()
dw_controllist.SetRow(1)
dw_controllist.ScrollToRow(1)
dw_controllist.event rowfocuschanged(1)

end event

type cbx_visible from checkbox within w_contract_screen_control_list
boolean visible = false
integer x = 32
integer y = 1536
integer width = 622
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Only show visible objects"
boolean checked = true
end type

event clicked;If This.checked Then
	dw_controllist.setfilter('visible <> "0"')
	dw_controllist.filter()
Else
	dw_controllist.setfilter('')
	dw_controllist.filter()	
End If
end event

type cb_find from commandbutton within w_contract_screen_control_list
integer x = 709
integer y = 1340
integer width = 343
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Find Object"
boolean default = true
end type

event clicked;//====================================================================
// Event: clicked
//--------------------------------------------------------------------
// Description: Find the object by object name.
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:         Ken.Guo           Date: 09/16/2014
//--------------------------------------------------------------------
//Copyright (c) 2008-2013 Contract Logix, Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


Long ll_find

If sle_find.text = '' Then Return

If dw_controllist.Getrow() = 0 Then Return

If dw_controllist.Getrow() <> dw_controllist.RowCount() Then
	ll_find = dw_controllist.find( 'Pos(object_name, "' + lower(sle_find.text) + '") > 0 ' , dw_controllist.Getrow() + 1, dw_controllist.rowcount())
End If
If ll_find <= 0 Then
	ll_find = dw_controllist.find( 'Pos(object_name, "' + lower(sle_find.text) + '") > 0 ' ,1, dw_controllist.Getrow())
End If

If ll_find > 0 Then
	dw_controllist.SetRow(ll_find)
	dw_controllist.ScrolltoRow(ll_find)
Else
	Messagebox('Find','Search object not found!')
	Return
End If
end event

type sle_find from singlelineedit within w_contract_screen_control_list
event ue_keyup pbm_keyup
integer x = 23
integer y = 1344
integer width = 681
integer height = 92
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event ue_keyup;//If Key = KeyEnter! Then
//	cb_find.event clicked( )
//End If
end event

type cb_goto from commandbutton within w_contract_screen_control_list
boolean visible = false
integer x = 1065
integer y = 1340
integer width = 343
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "&Go To"
end type

event clicked;//====================================================================
// Event: clicked
//--------------------------------------------------------------------
// Description: Go to select the object.
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:         Ken.Guo           Date: 09/16/2014
//--------------------------------------------------------------------
//Copyright (c) 2008-2013 Contract Logix, Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


String ls_ObjName, ls_band
pfc_cst_u_band ldw_band

If dw_controllist.Getrow() <= 0 Then Return 

If dw_controllist.GetItemString(dw_controllist.Getrow(), 'visible') = '0' Then Return

ls_ObjName = dw_controllist.GetItemString(dw_controllist.GetRow(), 'object_name')
ls_band = dw_controllist.GetItemString(dw_controllist.GetRow(), 'band')
Choose Case ls_band
	Case 'header'
		ldw_band = inv_data_design.uo_band.dw_header
	Case 'detail'
		ldw_band = inv_data_design.uo_band.dw_detail
	Case 'summary'
		ldw_band = inv_data_design.uo_band.dw_summary
	Case 'footer'
		ldw_band = inv_data_design.uo_band.dw_footer
End Choose

inv_data_design.ib_Multi_Select = False
inv_data_design.of_UnSelectAllObject()
ldw_band.of_AddOrDelSingleSelect(ls_ObjName,true)
ls_ObjName = inv_data_design.of_GetLastSelectedObject()
if Not IsNull(ls_ObjName) and Trim(ls_ObjName) <> "" then
	ldw_band.is_CurObj = ls_ObjName
end if
inv_data_design.of_Refresh_Object_Inforamtion()



end event

type cb_properties from commandbutton within w_contract_screen_control_list
integer x = 1774
integer y = 1340
integer width = 343
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Properties..."
end type

event clicked;//Added By Ken.Guo 09/16/2014
String ls_objecttype 

If dw_controllist.Getrow() <= 0 Then Return 
ls_objecttype = dw_controllist.GetItemString(dw_controllist.Getrow(), 'object_type') 
If ls_objecttype = 'button' Then Return
cb_goto.event clicked( )


If IsValid( w_contract_mul_field_properties ) Then  Close(w_contract_mul_field_properties)
Choose Case ls_objecttype
	Case 'column'
		If IsValid( w_contract_other_properties ) Then  Close(w_contract_other_properties)
		If IsValid( w_contract_compute_properties ) Then  Close(w_contract_compute_properties)
		If IsValid( w_contract_text_properties ) Then  Close(w_contract_text_properties)
		If IsValid( w_contract_groupbox_properties ) Then  Close(w_contract_groupbox_properties)
	Case 'text'
		if isvalid(w_contract_field_properties) then Close(w_contract_field_properties)
		If IsValid( w_contract_other_properties ) Then  Close(w_contract_other_properties)
		If IsValid( w_contract_compute_properties ) Then  Close(w_contract_compute_properties)
		If IsValid( w_contract_groupbox_properties ) Then  Close(w_contract_groupbox_properties)
	Case 'groupbox'
		if isvalid(w_contract_field_properties) then Close(w_contract_field_properties)
		If IsValid( w_contract_other_properties ) Then  Close(w_contract_other_properties)
		If IsValid( w_contract_compute_properties ) Then  Close(w_contract_compute_properties)
		If IsValid( w_contract_text_properties ) Then  Close(w_contract_text_properties)
	Case 'line','ellipse','bitmap','rectangle'
		if isvalid(w_contract_field_properties) then Close(w_contract_field_properties)
		If IsValid( w_contract_compute_properties ) Then  Close(w_contract_compute_properties)
		If IsValid( w_contract_text_properties ) Then  Close(w_contract_text_properties)
		If IsValid( w_contract_groupbox_properties ) Then  Close(w_contract_groupbox_properties)
	Case 'compute'
		if isvalid(w_contract_field_properties) then Close(w_contract_field_properties)
		If IsValid( w_contract_other_properties ) Then  Close(w_contract_other_properties)
		If IsValid( w_contract_text_properties ) Then  Close(w_contract_text_properties)
		If IsValid( w_contract_groupbox_properties ) Then  Close(w_contract_groupbox_properties)
	Case ''
End Choose


inv_data_design.event ue_properties( )
end event

type cb_close from commandbutton within w_contract_screen_control_list
integer x = 2130
integer y = 1340
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
boolean cancel = true
end type

event clicked;Close(Parent)
end event

type dw_controllist from u_dw within w_contract_screen_control_list
integer x = 18
integer y = 16
integer width = 2464
integer height = 1288
integer taborder = 40
string dataobject = "d_control_list"
boolean hscrollbar = true
end type

event doubleclicked;call super::doubleclicked;cb_properties.Trigger Event Clicked()

end event

event constructor;call super::constructor;This.of_SetUpdateAble(false)

of_SetSort(True)
inv_Sort.of_SetColumnHeader(True)

This.of_setrowselect( True )

if AppeonGetClientType() = "WEB" then This.Height = This.Height + 6

end event

event rowfocuschanged;call super::rowfocuschanged;//Added By Ken.Guo 09/16/2014
If currentrow <= 0 Then Return

If dw_controllist.GetItemString(currentrow, 'object_type') = 'button' Then
	cb_properties.enabled = False
Else
	cb_properties.enabled = True
End If


end event

event clicked;call super::clicked;If row > 0 Then
	cb_goto.event clicked( )
End If
end event

