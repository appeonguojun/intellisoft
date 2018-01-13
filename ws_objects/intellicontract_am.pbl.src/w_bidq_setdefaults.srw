$PBExportHeader$w_bidq_setdefaults.srw
forward
global type w_bidq_setdefaults from window
end type
type cb_ok from commandbutton within w_bidq_setdefaults
end type
type cb_cancel from commandbutton within w_bidq_setdefaults
end type
type dw_prop from u_dw within w_bidq_setdefaults
end type
type gb_1 from groupbox within w_bidq_setdefaults
end type
end forward

global type w_bidq_setdefaults from window
integer width = 1499
integer height = 1096
boolean titlebar = true
string title = "Set Defaults"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_ok cb_ok
cb_cancel cb_cancel
dw_prop dw_prop
gb_1 gb_1
end type
global w_bidq_setdefaults w_bidq_setdefaults

type variables
DataWindow idw_data
end variables

on w_bidq_setdefaults.create
this.cb_ok=create cb_ok
this.cb_cancel=create cb_cancel
this.dw_prop=create dw_prop
this.gb_1=create gb_1
this.Control[]={this.cb_ok,&
this.cb_cancel,&
this.dw_prop,&
this.gb_1}
end on

on w_bidq_setdefaults.destroy
destroy(this.cb_ok)
destroy(this.cb_cancel)
destroy(this.dw_prop)
destroy(this.gb_1)
end on

event open;idw_data = Message.PowerObjectParm

gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17

dw_prop.post	of_SetDropDownCalendar(TRUE)		
end event

type cb_ok from commandbutton within w_bidq_setdefaults
integer x = 745
integer y = 904
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

event clicked;string ls_doc_type
string ls_doc_from_name
long ll_category
long ll_Row
Integer li_delete_flag
long	ll_status
string 	ls_received_by
datetime	ld_received_date
// Get properties value
ls_doc_type = dw_prop.object.doc_type[1]
ls_doc_from_name = dw_prop.object.doc_from_name[1]
ll_category = dw_prop.object.category[1]
li_delete_flag = dw_prop.object.delete_flag[1]
ll_status = dw_prop.object.status[1]
ls_received_by = dw_prop.object.received_by[1]
ld_received_date = dw_prop.object.received_date[1]

if Trim(ls_doc_type) = "" then SetNull(ls_doc_type)
if Trim(ls_doc_from_name) = "" then SetNull(ls_doc_from_name)
if Trim(ls_received_by) = "" then SetNull(ls_received_by)

dw_prop.accepttext( )			//Added By Mark Lee 09/19/2014
// Set properties value
for ll_Row = 1 to idw_data.RowCount()
	if not IsNull(ls_doc_type) and IsNull(idw_data.object.doc_type[ll_Row]) then
		idw_data.SetItem(ll_Row, "doc_type", ls_doc_type)
	end if
	if not IsNull(ll_category) and IsNull(idw_data.object.category[ll_Row]) then
		idw_data.SetItem(ll_Row, "category", ll_category)
	end if
	if not IsNull(ls_doc_from_name) and IsNull(idw_data.object.doc_from_name[ll_Row]) then
		idw_data.SetItem(ll_Row, "doc_from_name", ls_doc_from_name)
	end if
	
	//Added By Ken.Guo 2010-07-01.
	If not IsNull(li_delete_flag) and IsNull(idw_data.object.delete_flag[ll_Row]) Then
		idw_data.SetItem(ll_Row, "delete_flag", li_delete_flag)
	End If

	If not IsNull(ll_status) and IsNull(idw_data.object.status[ll_Row]) Then
		idw_data.SetItem(ll_Row, "status", ll_status)
	end if 
	
	If not IsNull(ls_received_by) and IsNull(idw_data.object.received_by[ll_Row]) Then
		idw_data.SetItem(ll_Row, "received_by", ls_received_by)
	end if 
	
	If not IsNull(ld_received_date) and IsNull(idw_data.object.received_date[ll_Row]) Then
		idw_data.SetItem(ll_Row, "received_date", ld_received_date)
	end if 
	
next

// Close window
Close(Parent)
end event

type cb_cancel from commandbutton within w_bidq_setdefaults
integer x = 1115
integer y = 904
integer width = 343
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Cancel"
boolean cancel = true
end type

event clicked;Close(Parent)
end event

type dw_prop from u_dw within w_bidq_setdefaults
integer x = 142
integer y = 112
integer width = 1257
integer height = 724
integer taborder = 10
string dataobject = "d_bidq_setdefaults"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
borderstyle borderstyle = stylebox!
boolean ib_isupdateable = false
end type

event constructor;call super::constructor;// Inherit
DataWindowChild ldwc_child,ldwc_category, ldwc_child_by, ldwc_child_status

// Set doc_from_name DDDW
this.SetTransObject(SQLCA)
this.GetChild("doc_from_name", ldwc_child)
ldwc_child.SetTransObject(SQLCA)
ldwc_child.Retrieve(-1)
ldwc_child.SetSort("id A")
ldwc_child.Sort()
ldwc_child.InsertRow(1)

// Set category DDDW
this.InsertRow(0)
this.GetChild("category", ldwc_category)
ldwc_category.InsertRow(1)


DataWindowChild ldwc_child_doctype
this.SetTransObject(SQLCA)
this.GetChild("doc_type", ldwc_child_doctype)
ldwc_child_doctype.SetTransObject(SQLCA)
ldwc_child_doctype.Retrieve('Contract Document Type')

//Added By Mark Lee 09/19/2014
//this.of_SetDropDownCalendar(TRUE)					//move
this.GetChild("received_by", ldwc_child_by)			//dddw_doc_from_name
ldwc_child_by.SetTransObject(SQLCA)
//ldwc_child_by.Retrieve(-1)
ldwc_child_by.reset()
if ldwc_child.rowcount( ) >0 then 
	ldwc_child.rowscopy( 1, ldwc_child.rowcount(),Primary!, ldwc_child_by, 1,Primary!)
end if 
ldwc_child_by.SetSort("id A")
ldwc_child_by.Sort()
ldwc_child_by.InsertRow(1)

this.SetTransObject(SQLCA)
this.GetChild("status", ldwc_child_status)
ldwc_child_status.SetTransObject(SQLCA)
ldwc_child_status.Retrieve('Contract Document Status')

if this.getrow() > 0 then 
	this.setItem(this.getrow(),"received_date",date(today()))
end if 


end event

event itemchanged;call super::itemchanged;datetime		ldt_received_date
if row <= 0 then return 

if dwo.name = "received_date" then 
	if isnull( data)  or trim(string(data)) = '' or not isdate(string(data)) then 
//		setnull(ldt_received_date)
//		this.setItem(row,"received_date", ldt_received_date)
		return 2
	end if
end if 
end event

type gb_1 from groupbox within w_bidq_setdefaults
integer x = 41
integer y = 32
integer width = 1417
integer height = 848
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Default Value Settings"
end type

