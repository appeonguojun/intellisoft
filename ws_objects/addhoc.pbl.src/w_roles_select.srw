$PBExportHeader$w_roles_select.srw
forward
global type w_roles_select from w_response
end type
type mle_1 from multilineedit within w_roles_select
end type
type dw_role from u_dw within w_roles_select
end type
type cb_select from commandbutton within w_roles_select
end type
type cb_cancel from commandbutton within w_roles_select
end type
type cb_ok from commandbutton within w_roles_select
end type
end forward

global type w_roles_select from w_response
integer x = 214
integer y = 221
integer width = 1362
integer height = 1580
string title = "Select User Group"
mle_1 mle_1
dw_role dw_role
cb_select cb_select
cb_cancel cb_cancel
cb_ok cb_ok
end type
global w_roles_select w_roles_select

type variables
String is_view_list
n_cst_string inv_string

end variables

on w_roles_select.create
int iCurrent
call super::create
this.mle_1=create mle_1
this.dw_role=create dw_role
this.cb_select=create cb_select
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.mle_1
this.Control[iCurrent+2]=this.dw_role
this.Control[iCurrent+3]=this.cb_select
this.Control[iCurrent+4]=this.cb_cancel
this.Control[iCurrent+5]=this.cb_ok
end on

on w_roles_select.destroy
call super::destroy
destroy(this.mle_1)
destroy(this.dw_role)
destroy(this.cb_select)
destroy(this.cb_cancel)
destroy(this.cb_ok)
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
// Author:         Ken.Guo 2015-08-05
//--------------------------------------------------------------------
//Copyright (c) 2008-2015 Contract Logix, Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


Long i
Long ll_group_id
is_view_list = Message.Stringparm

dw_role.SetTransObject(SQLCA)
dw_role.Retrieve()

If dw_role.RowCount() = 0 Then
	Messagebox('User Group','There is no user group, you can add the user group in the user painter.')
End If

If is_view_list = 'All' or isnull(is_view_list) Then
	cb_select.text = 'Select &All'
	cb_select.event clicked( )
Else
	For i = 1 To dw_role.RowCount()
		ll_group_id = dw_role.GetItemNumber(i, 'id')
		If Pos(is_view_list + ',', String(ll_group_id) + ',') > 0 Then
			dw_role.SetItem(i, 'selected', 1)
		End If
	Next
End If



end event

type mle_1 from multilineedit within w_roles_select
integer x = 32
integer y = 1168
integer width = 1275
integer height = 176
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Selected User Group can see this report. Additionally, Created By and Can Be Modified by User can always see this report."
boolean border = false
boolean displayonly = true
end type

type dw_role from u_dw within w_roles_select
integer x = 23
integer y = 12
integer width = 1289
integer height = 1144
integer taborder = 10
string dataobject = "d_select_roles_choose"
end type

event constructor;call super::constructor;This.of_Setupdateable( False )
end event

type cb_select from commandbutton within w_roles_select
integer x = 23
integer y = 1360
integer width = 343
integer height = 92
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Select &All"
end type

event clicked;
Long i
If This.text = 'Select &All' Then
	For i = 1 To dw_role.RowCount()
		dw_role.SetItem(i, 'selected', 1)
	Next
	This.text = 'Deselect &All'
Else
	For i = 1 To dw_role.RowCount()
		dw_role.SetItem(i, 'selected', 0)
	Next	
	This.text = 'Select &All'
End If
end event

type cb_cancel from commandbutton within w_roles_select
integer x = 955
integer y = 1360
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

event clicked;CloseWithReturn(Parent, 'Cancel')

end event

type cb_ok from commandbutton within w_roles_select
integer x = 590
integer y = 1360
integer width = 343
integer height = 92
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&OK"
boolean default = true
end type

event clicked;Long i
String ls_group_list

If dw_role.rowcount() = 0 Then
	CloseWithReturn(Parent, 'All')
	Return	
End If

If dw_role.Find('selected = 1', 1, dw_role.RowCount()) = 0 Then
	CloseWithReturn(Parent, 'None')
	Return
End If

If dw_role.Find('selected = 0', 1, dw_role.RowCount()) = 0 Then
	CloseWithReturn(Parent, 'All')
	Return
End If

For i = 1 To dw_role.RowCount()
	If dw_role.GetItemNumber(i, 'selected') = 1 Then
		ls_group_list += String(dw_role.GetItemNumber(i, 'id')) + ','
	End If
Next

ls_group_list = Left(ls_group_list, Len(ls_group_list) -1 )
CloseWithReturn(Parent, ls_group_list)

end event

