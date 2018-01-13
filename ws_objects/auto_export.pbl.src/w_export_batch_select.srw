$PBExportHeader$w_export_batch_select.srw
forward
global type w_export_batch_select from w_response
end type
type cb_select from commandbutton within w_export_batch_select
end type
type cb_close from commandbutton within w_export_batch_select
end type
type cb_ok from commandbutton within w_export_batch_select
end type
type dw_1 from u_dw within w_export_batch_select
end type
end forward

global type w_export_batch_select from w_response
integer x = 214
integer y = 221
integer width = 1915
integer height = 1660
string title = "Batch Update Request Select"
cb_select cb_select
cb_close cb_close
cb_ok cb_ok
dw_1 dw_1
end type
global w_export_batch_select w_export_batch_select

event open;call super::open;dw_1.SetTransObject(SQLCA)
dw_1.Retrieve()
If gb_contract_version Then
	dw_1.setfilter("export_type in (3,4)")
	dw_1.filter()
Else
	dw_1.setfilter('')
	dw_1.filter()
End If

if dw_1.rowcount() > 0 then
	cb_select.Text = "Deselect &All"
end if
end event

on w_export_batch_select.create
int iCurrent
call super::create
this.cb_select=create cb_select
this.cb_close=create cb_close
this.cb_ok=create cb_ok
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_select
this.Control[iCurrent+2]=this.cb_close
this.Control[iCurrent+3]=this.cb_ok
this.Control[iCurrent+4]=this.dw_1
end on

on w_export_batch_select.destroy
call super::destroy
destroy(this.cb_select)
destroy(this.cb_close)
destroy(this.cb_ok)
destroy(this.dw_1)
end on

type cb_select from commandbutton within w_export_batch_select
integer x = 37
integer y = 1460
integer width = 343
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Select &All"
end type

event clicked;long ll_Row,i

if this.Text = "Select &All" then
	this.Text = "Deselect &All"
	For i = 1 To dw_1.Rowcount()
		dw_1.Setitem(i,'Selected',1)
	Next
else
	this.Text = "Select &All"
	For i = 1 To dw_1.Rowcount()
		dw_1.Setitem(i,'Selected',0)
	Next	
end if



end event

type cb_close from commandbutton within w_export_batch_select
integer x = 1531
integer y = 1460
integer width = 343
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Close"
boolean cancel = true
end type

event clicked;string ls_return

setnull(ls_return)

ClosewithReturn(Parent, ls_return)
end event

type cb_ok from commandbutton within w_export_batch_select
integer x = 1170
integer y = 1460
integer width = 343
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&OK"
boolean default = true
end type

event clicked;long 			ll_row, ll_selected, ll_export_id
string 		ls_return, ls_userid

ls_return = ''
FOR ll_row = 1 to dw_1.RowCount()
	ll_selected = dw_1.GetItemNumber(ll_row, "selected") 
	ll_export_id = dw_1.GetItemNumber(ll_row, "export_id") 
	if ll_selected = 1 then 
		ls_return = ls_return + string(ll_export_id)+","
	end if 
Next

if right(ls_return, 1) = "," then 
	ls_return = left(ls_return, len(ls_return) - 1)
end if 

if ls_return = '' then setnull(ls_return)

ClosewithReturn(Parent, ls_return)
end event

type dw_1 from u_dw within w_export_batch_select
integer x = 23
integer y = 40
integer width = 1842
integer height = 1392
integer taborder = 10
string dataobject = "d_export_batch_select"
boolean hscrollbar = true
end type

event constructor;call super::constructor;This.of_setupdateable( False )
This.of_setsort(True)
This.inv_sort.of_SetColumnHeader(TRUE)
end event

