$PBExportHeader$w_select_contact_view.srw
forward
global type w_select_contact_view from w_response
end type
type cb_selectview from commandbutton within w_select_contact_view
end type
type dw_view_list from datawindow within w_select_contact_view
end type
type mle_1 from multilineedit within w_select_contact_view
end type
type cb_cancel from u_cb within w_select_contact_view
end type
type cb_ok from u_cb within w_select_contact_view
end type
end forward

global type w_select_contact_view from w_response
integer x = 1170
integer y = 424
integer width = 1230
integer height = 1244
string title = "Select View"
boolean controlmenu = false
cb_selectview cb_selectview
dw_view_list dw_view_list
mle_1 mle_1
cb_cancel cb_cancel
cb_ok cb_ok
end type
global w_select_contact_view w_select_contact_view

type variables
Integer ii_data_view_id = 1
end variables

on w_select_contact_view.create
int iCurrent
call super::create
this.cb_selectview=create cb_selectview
this.dw_view_list=create dw_view_list
this.mle_1=create mle_1
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_selectview
this.Control[iCurrent+2]=this.dw_view_list
this.Control[iCurrent+3]=this.mle_1
this.Control[iCurrent+4]=this.cb_cancel
this.Control[iCurrent+5]=this.cb_ok
end on

on w_select_contact_view.destroy
call super::destroy
destroy(this.cb_selectview)
destroy(this.dw_view_list)
destroy(this.mle_1)
destroy(this.cb_cancel)
destroy(this.cb_ok)
end on

type cb_selectview from commandbutton within w_select_contact_view
integer x = 37
integer y = 1040
integer width = 343
integer height = 84
integer taborder = 13
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Select All"
end type

event clicked;long		ll_Row,ll_Cycle,ll_Cnts,ll_data[]

ll_Row = dw_view_list.GetRow()

ll_Cnts = dw_view_list.RowCount()

if This.Text = "Select All" then
	for ll_Cycle = 1 to ll_Cnts
		ll_data[ll_Cycle] = 1
	next
	dw_view_list.Object.Selected.Primary = ll_data
	This.Text = "Deselect All"
else
	for ll_Cycle = 1 to ll_Cnts
		ll_data[ll_Cycle] = 0
	next
	dw_view_list.Object.Selected.Primary = ll_data
	This.Text = "Select All"
end if

dw_view_list.SetRow(ll_Row)

end event

type dw_view_list from datawindow within w_select_contact_view
integer x = 23
integer y = 192
integer width = 1166
integer height = 820
integer taborder = 12
string dataobject = "d_all_view_list"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;This.SetRow(Row)

end event

event constructor;string ls_last_viewlist
long		ll_Row,ll_view,ll_viewlist[],ll_find
n_cst_string lnv_string

This.SetTransObject(SQLCA)
This.Retrieve()

//Added By Jay Chen 10-28-2015
ls_last_viewlist = gnv_user_option.of_Get_option_value(gs_user_id , "select_view_sync_screen")
if isnull(ls_last_viewlist) then ls_last_viewlist = ''
if ls_last_viewlist = '' then
	for ll_row = 1 to this.rowcount()
		this.setitem(ll_row, "selected", 1)
	next
	cb_selectview.text = "Deselect All"
end if

lnv_string.of_parsetoarray(ls_last_viewlist, ',', ll_viewlist)
for ll_row = 1 to upperbound(ll_viewlist)
	ll_view = ll_viewlist[ll_row]
	ll_find = this.find("data_view_id = " + string(ll_view),1, this.rowcount())
	if isnull(ll_find) then ll_find = 0
	if ll_find > 0 then
		this.setitem(ll_find, "selected", 1)
	end if
next

if upperbound(ll_viewlist) = this.rowcount() then
	cb_selectview.text = "Deselect All"
end if
end event

type mle_1 from multilineedit within w_select_contact_view
integer x = 23
integer y = 24
integer width = 1166
integer height = 164
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Please select which view(s) you want to sync the changes? It will not take effect until you re-open the Contract Folder:"
boolean border = false
end type

type cb_cancel from u_cb within w_select_contact_view
integer x = 814
integer y = 1040
integer height = 84
integer taborder = 3
string text = "&Cancel"
boolean cancel = true
end type

event clicked;CloseWithReturn(Parent, "Cancel" ) 
end event

type cb_ok from u_cb within w_select_contact_view
integer x = 430
integer y = 1040
integer height = 84
string text = "&OK"
boolean default = true
end type

event clicked;long ll_view,ll_row
string ls_view

//ll_view = dw_select.GetItemNumber( 1, "data_view_id" )
//if isnull(ll_view) then ll_view = 0
//if ll_view = 0 then return

//Added By Jay Chen 10-28-2015
ll_row = dw_view_list.find("selected = 1",1,dw_view_list.rowcount())
do while ll_row > 0
	ll_view = dw_view_list.getitemnumber(ll_row,"data_view_id")
	ls_view += string(ll_view) + ','
	if ll_row >= dw_view_list.rowcount() then exit
	ll_row = dw_view_list.find("selected = 1",ll_row + 1,dw_view_list.rowcount())
loop

if right(ls_view,1) = ',' then ls_view = left(ls_view,len(ls_view) - 1)
gnv_user_option.of_set_option_value(gs_user_id , 'select_view_sync_screen' , ls_view)
gnv_user_option.of_save()

CloseWithReturn( Parent, ls_view)


end event

