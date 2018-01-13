$PBExportHeader$w_batch_add_groups_to_contracts.srw
forward
global type w_batch_add_groups_to_contracts from w_response
end type
type cbx_delete from checkbox within w_batch_add_groups_to_contracts
end type
type cb_close from commandbutton within w_batch_add_groups_to_contracts
end type
type cb_1 from commandbutton within w_batch_add_groups_to_contracts
end type
type dw_groups from u_dw within w_batch_add_groups_to_contracts
end type
end forward

global type w_batch_add_groups_to_contracts from w_response
integer width = 2473
integer height = 1208
string title = "Batch Add/Delete Groups to All Contracts"
cbx_delete cbx_delete
cb_close cb_close
cb_1 cb_1
dw_groups dw_groups
end type
global w_batch_add_groups_to_contracts w_batch_add_groups_to_contracts

on w_batch_add_groups_to_contracts.create
int iCurrent
call super::create
this.cbx_delete=create cbx_delete
this.cb_close=create cb_close
this.cb_1=create cb_1
this.dw_groups=create dw_groups
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cbx_delete
this.Control[iCurrent+2]=this.cb_close
this.Control[iCurrent+3]=this.cb_1
this.Control[iCurrent+4]=this.dw_groups
end on

on w_batch_add_groups_to_contracts.destroy
call super::destroy
destroy(this.cbx_delete)
destroy(this.cb_close)
destroy(this.cb_1)
destroy(this.dw_groups)
end on

event open;call super::open;dw_groups.SetTransobject(SQLCA)
dw_groups.Retrieve()

dw_groups.of_setupdateable(False)

//dw_groups.of_setrowselect()
//dw_groups.inv_sort.of_setstyle( dw_groups.inv_sort.simple )

dw_groups.of_setrowselect( true)
dw_groups.inv_rowselect.of_SetStyle(dw_groups.inv_rowselect.single )
end event

type cbx_delete from checkbox within w_batch_add_groups_to_contracts
integer x = 55
integer y = 984
integer width = 421
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Batch Delete"
end type

type cb_close from commandbutton within w_batch_add_groups_to_contracts
integer x = 2062
integer y = 984
integer width = 343
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Close"
boolean default = true
end type

event clicked;Close(Parent)
end event

type cb_1 from commandbutton within w_batch_add_groups_to_contracts
integer x = 1701
integer y = 984
integer width = 343
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Apply"
boolean default = true
end type

event clicked;Long ll_find, ll_group_id, ll_view_id
String ls_access

If dw_groups.Rowcount() = 0 Then Return

//Check Data
ll_find = dw_groups.Find('selected = 1', 1, dw_groups.RowCount())
If ll_find = 0 Then
	Messagebox('Batch Update','Please select a group.')
	Return
End If

If cbx_delete.checked Then
	If Messagebox('Batch Delete','Do you want to batch delete the selected group(s) to all contracts?',Question!, Yesno!) = 2 Then Return
Else
	If Messagebox('Batch Add','Do you want to batch add the selected group(s) to all contracts?',Question!, Yesno!) = 2 Then Return	
End If

//Batch Update
Do While ll_find > 0 
	dw_groups.SetRow(ll_find)
	dw_groups.ScrolltoRow(ll_find)
	dw_groups.SelectRow(0,False)
	dw_groups.SelectRow(ll_find,True)
	ll_group_id = dw_groups.GetItemNumber(ll_find, 'group_id')	
	ls_access = dw_groups.GetItemString(ll_find, 'access')	
	ll_view_id = dw_groups.GetItemNumber(ll_find, 'view_id')	
	Delete From ctx_group_access Where group_id = :ll_group_id;	
	If Not cbx_delete.checked Then
	Insert ctx_group_access
		Select ctx_id, :ll_group_id, :ls_access,:ll_view_id,'' from ctx_basic_info;	
	End IF
	If ll_find = dw_groups.RowCount() Then Exit
	ll_find = dw_groups.Find('selected = 1', ll_find + 1, dw_groups.RowCount())
Loop

If Isvalid(gw_contract) Then
	If gw_contract.tab_contract_details.ib_select2 Then
		If gw_contract.tab_contract_details.tabpage_details.uo_1.tab_1.ib_created_5 Then
			gw_contract.tab_contract_details.tabpage_details.uo_1.tab_1.Tabpage_Group_Access.dw_1.Event pfc_Retrieve()
		End If
	End If
End IF

If cbx_delete.checked Then
	Messagebox('Batch Delete','Batch delete complete.')
Else
	Messagebox('Batch Add','Batch add complete.')
End If

end event

type dw_groups from u_dw within w_batch_add_groups_to_contracts
integer x = 41
integer y = 32
integer width = 2373
integer height = 912
integer taborder = 10
string dataobject = "d_batch_add_group_access"
boolean livescroll = false
end type

event buttonclicked;call super::buttonclicked;Long i
If This.Describe('b_select.text') = 'Select All' Then
	For i = 1 To This.RowCount()
		This.SetItem(i, 'selected', 1)
	Next
	This.Modify("b_select.text = 'Deselect All'")
Else
	For i = 1 To This.RowCount()
		This.SetItem(i, 'selected', 0)
	Next	
	This.Modify("b_select.text = 'Select All'")
End IF


end event

