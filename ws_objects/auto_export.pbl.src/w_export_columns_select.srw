$PBExportHeader$w_export_columns_select.srw
forward
global type w_export_columns_select from w_response
end type
type mle_1 from multilineedit within w_export_columns_select
end type
type cb_select from commandbutton within w_export_columns_select
end type
type cb_cancel from commandbutton within w_export_columns_select
end type
type cb_ok from commandbutton within w_export_columns_select
end type
type dw_list from u_dw within w_export_columns_select
end type
type gb_1 from groupbox within w_export_columns_select
end type
end forward

global type w_export_columns_select from w_response
integer x = 214
integer y = 221
integer width = 1289
integer height = 2060
string title = "Sync Column Properties"
mle_1 mle_1
cb_select cb_select
cb_cancel cb_cancel
cb_ok cb_ok
dw_list dw_list
gb_1 gb_1
end type
global w_export_columns_select w_export_columns_select

type variables
Long il_export_id
end variables

on w_export_columns_select.create
int iCurrent
call super::create
this.mle_1=create mle_1
this.cb_select=create cb_select
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
this.dw_list=create dw_list
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.mle_1
this.Control[iCurrent+2]=this.cb_select
this.Control[iCurrent+3]=this.cb_cancel
this.Control[iCurrent+4]=this.cb_ok
this.Control[iCurrent+5]=this.dw_list
this.Control[iCurrent+6]=this.gb_1
end on

on w_export_columns_select.destroy
call super::destroy
destroy(this.mle_1)
destroy(this.cb_select)
destroy(this.cb_cancel)
destroy(this.cb_ok)
destroy(this.dw_list)
destroy(this.gb_1)
end on

event open;call super::open;If Message.doubleparm > 0 Then
	il_export_id = Message.doubleparm
Else
	Messagebox('Error','Failed to get data, please call support')
	Close(This)
	Return
End If

dw_list.settransobject(sqlca)
dw_list.retrieve(il_export_id)
end event

type mle_1 from multilineedit within w_export_columns_select
integer x = 46
integer y = 20
integer width = 1189
integer height = 324
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Please select the columns below to synchronize them with column properties on the associated screens.   You can use this function for batch synchronization when the column properties (format, lookup table) of an export are different from the associated screen. "
boolean border = false
boolean displayonly = true
end type

type cb_select from commandbutton within w_export_columns_select
integer x = 14
integer y = 1852
integer width = 379
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "De&select ALL"
end type

event clicked;Long i, ll_cnt
Integer li_value_0[],li_value_1[]

ll_cnt = dw_list.RowCount()
If ll_cnt < 1 Then Return 1
For i = 1 To ll_cnt
	li_value_0[UpperBound(li_value_0[]) + 1 ] = 0
	li_value_1[UpperBound(li_value_1[]) + 1 ] = 1	
Next

If This.Text = '&Select ALL' Then
	dw_list.object.selected[1,ll_cnt] = li_value_1[]
	This.Text = 'De&select ALL'
Else
	dw_list.object.selected[1,ll_cnt] = li_value_0[]
	This.Text = '&Select ALL'
End If

end event

type cb_cancel from commandbutton within w_export_columns_select
integer x = 873
integer y = 1852
integer width = 343
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Cancel"
end type

event clicked;Close(Parent)
end event

type cb_ok from commandbutton within w_export_columns_select
integer x = 526
integer y = 1852
integer width = 343
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&OK"
end type

event clicked;Long ll_cnt

ll_cnt = dw_list.rowcount()
If dw_list.find('selected = 1', 1,ll_cnt ) = 0 then 
	Messagebox('Selection Error','You must at least select one column.')
	Return -1
End If

str_export_columns lstr_columns
lstr_columns.ads_columns = Create n_ds
lstr_columns.ads_columns.dataobject = dw_list.dataobject
dw_list.rowscopy(1, ll_cnt, primary!,lstr_columns.ads_columns, 1, primary! )
lstr_columns.ads_columns.setfilter('selected=1')
lstr_columns.ads_columns.Filter()

closewithreturn(Parent,lstr_columns )
end event

type dw_list from u_dw within w_export_columns_select
integer x = 46
integer y = 404
integer width = 1161
integer height = 1388
integer taborder = 10
string title = "none"
string dataobject = "d_export_flds_list_select"
end type

event constructor;call super::constructor;This.of_setupdateable(False)
end event

type gb_1 from groupbox within w_export_columns_select
integer x = 14
integer y = 344
integer width = 1225
integer height = 1476
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Selected Columns"
end type

