$PBExportHeader$pfc_cst_u_security_contract_status_role.sru
forward
global type pfc_cst_u_security_contract_status_role from userobject
end type
type st_1 from statictext within pfc_cst_u_security_contract_status_role
end type
type mle_tip from multilineedit within pfc_cst_u_security_contract_status_role
end type
type dw_1 from u_dw_contract within pfc_cst_u_security_contract_status_role
end type
type cb_cancel from commandbutton within pfc_cst_u_security_contract_status_role
end type
type cb_ok from commandbutton within pfc_cst_u_security_contract_status_role
end type
type cb_copy from commandbutton within pfc_cst_u_security_contract_status_role
end type
type gb_1 from groupbox within pfc_cst_u_security_contract_status_role
end type
end forward

global type pfc_cst_u_security_contract_status_role from userobject
integer width = 2715
integer height = 1708
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
st_1 st_1
mle_tip mle_tip
dw_1 dw_1
cb_cancel cb_cancel
cb_ok cb_ok
cb_copy cb_copy
gb_1 gb_1
end type
global pfc_cst_u_security_contract_status_role pfc_cst_u_security_contract_status_role

type variables
w_security_roles_painter  iw_win


end variables

forward prototypes
public subroutine of_set_parent_window (window aw_win)
public function integer of_validate_right ()
end prototypes

public subroutine of_set_parent_window (window aw_win);//====================================================================
// Function: of_set_parent_window
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//                aw_win
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:         Ken.Guo           Date: 02/04/2015
//--------------------------------------------------------------------
//Copyright (c) 2008-2013 Contract Logix, Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


iw_win = aw_win
end subroutine

public function integer of_validate_right ();//====================================================================
// Function: of_validate_right
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	Jay Chen		Date: 04-10-2015
//--------------------------------------------------------------------
//	Copyright (c) 2008-2014 ContractLogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

long ll_right1,ll_right2,li_row_cnt,i

li_row_cnt = dw_1.rowcount()
for i = 1 to li_row_cnt
	ll_right1 = dw_1.GetItemNumber( i, "right1" ) 
	ll_right2 = dw_1.GetItemNumber( i, "right2" )
	if isnull(ll_right1) then ll_right1 = 0
	if isnull(ll_right2) then ll_right2 = 0
	if ll_right1 = 0 and ll_right2 = 0 then
		Messagebox(gnv_app.iapp_object.displayname,"You must select a permission!")
		dw_1.setrow(i)
		dw_1.selectrow(0,false)
		dw_1.selectrow(i,true)
		return -1
	end if
next

return 1
end function

on pfc_cst_u_security_contract_status_role.create
this.st_1=create st_1
this.mle_tip=create mle_tip
this.dw_1=create dw_1
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
this.cb_copy=create cb_copy
this.gb_1=create gb_1
this.Control[]={this.st_1,&
this.mle_tip,&
this.dw_1,&
this.cb_cancel,&
this.cb_ok,&
this.cb_copy,&
this.gb_1}
end on

on pfc_cst_u_security_contract_status_role.destroy
destroy(this.st_1)
destroy(this.mle_tip)
destroy(this.dw_1)
destroy(this.cb_cancel)
destroy(this.cb_ok)
destroy(this.cb_copy)
destroy(this.gb_1)
end on

type st_1 from statictext within pfc_cst_u_security_contract_status_role
integer x = 1431
integer y = 84
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
string text = "Notes:"
boolean focusrectangle = false
end type

type mle_tip from multilineedit within pfc_cst_u_security_contract_status_role
integer x = 1431
integer y = 144
integer width = 1239
integer height = 288
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "If a user has no access to a certain Contract Status, he will be prompted with a message and not allowed to use it when attempting to select this status in Contract Details."
boolean border = false
boolean displayonly = true
borderstyle borderstyle = stylelowered!
boolean hideselection = false
end type

type dw_1 from u_dw_contract within pfc_cst_u_security_contract_status_role
integer x = 50
integer y = 88
integer width = 1326
integer height = 1404
integer taborder = 30
string dataobject = "d_role_settings_contract_status"
end type

event getfocus;//
end event

event losefocus;//
end event

event rbuttonup;//
end event

event buttonclicked;call super::buttonclicked;Long i
If dwo.name = 'b_allno' Then
	 For i = 1 to dw_1.Rowcount()
		dw_1.SetItem(i, 'rights', '53')
		dw_1.SetItem(i, 'right1', 0)  //Added By Jay Chen 03-31-2015
		dw_1.SetItem(i, 'right2', 1)
	 Next
End If

If dwo.name = 'b_allfull' Then
	 For i = 1 to dw_1.Rowcount()
		dw_1.SetItem(i, 'rights', '51')
		dw_1.SetItem(i, 'right1', 1) 
		dw_1.SetItem(i, 'right2', 0)
	 Next	
End If
end event

event itemchanged;call super::itemchanged;//Added By Jay Chen 03-31-2015
string ls_column

if row <= 0 then return 	
this.accepttext( )

if dwo.name = 'right1' then
	ls_column = 'right2'
else
	ls_column = 'right1'
end if

if long(data) = 1 then 
	this.SetItem(row,ls_column,0)
	if ls_column = 'right1' then
		this.SetItem(row,"rights",'53')
	else
		this.SetItem(row,"rights",'51')
	end if
else
	this.SetItem(row,ls_column,1)
	if ls_column = 'right1' then
		this.SetItem(row,"rights",'51')
	else
		this.SetItem(row,"rights",'53')
	end if
end if
end event

type cb_cancel from commandbutton within pfc_cst_u_security_contract_status_role
integer x = 2336
integer y = 1592
integer width = 343
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Close"
end type

event clicked;Close( iw_win )

end event

type cb_ok from commandbutton within pfc_cst_u_security_contract_status_role
integer x = 1989
integer y = 1592
integer width = 343
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Save"
end type

event clicked;of_validate_right() //Added By Jay Chen 04-10-2015
dw_1.Update()


If isvalid(gw_contract) Then
	If gw_contract.tab_contract_details.ib_select2 Then
		gw_contract.tab_contract_details.tabpage_details.uo_1.of_set_contract_status_color()
	End If
End If

//Added By Mark Lee 03/23/2015
if isvalid(w_custom_report) then
	w_custom_report.of_destory_ds()
end if 
end event

type cb_copy from commandbutton within pfc_cst_u_security_contract_status_role
boolean visible = false
integer x = 1641
integer y = 1592
integer width = 343
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Copy"
end type

event clicked;long ll_role_id_old,ll_role_id_new,i,ll_rowcount_old,ll_rowcount_new
long ll_category,ll_types,ll_find
string ls_rights,ls_find
Datastore lds_contract_management_rights_old
Datastore lds_contract_management_rights_new

If dw_1.rowcount() <= 0 Then Return
cb_ok.Triggerevent( Clicked!)

ll_role_id_old = dw_1.getitemnumber(1,'role_id')

Open( w_copy_contract_management_rights )

ll_role_id_new = Message.doubleparm

If ll_role_id_new = 0 Or ll_role_id_old = ll_role_id_new Then
	Return
End If

This.SetRedraw( False )

lds_contract_management_rights_old = Create datastore
lds_contract_management_rights_old.dataobject = 'd_contract_management_rights'
lds_contract_management_rights_old.settransobject(sqlca)

lds_contract_management_rights_new = Create datastore
lds_contract_management_rights_new.dataobject = 'd_contract_management_rights'
lds_contract_management_rights_new.settransobject(sqlca)

gnv_appeondb.of_startqueue( )		
lds_contract_management_rights_old.retrieve(ll_role_id_old)
lds_contract_management_rights_new.retrieve(ll_role_id_new)
gnv_appeondb.of_commitqueue( )
ll_rowcount_old = lds_contract_management_rights_old.rowcount()
ll_rowcount_new = lds_contract_management_rights_new.rowcount()

For i = 1 To ll_rowcount_old
	ll_category = lds_contract_management_rights_old.getitemnumber(i,'category')
	ll_types = lds_contract_management_rights_old.getitemnumber(i,'types')
	ls_rights = lds_contract_management_rights_old.getitemstring(i,'rights')
	ls_find = "category = " + string(ll_category) + " And types = " + string(ll_types)
	ll_find = lds_contract_management_rights_new.find(ls_find,1,ll_rowcount_new)
	If ll_find > 0 Then
		lds_contract_management_rights_new.setitem(ll_find,'rights',ls_rights)
	End If
Next

If lds_contract_management_rights_new.Update() = -1 Then
	//MessageBox( "Update Error", "Update to Contract Management Rights table failed!" )
	MessageBox( "Update Error", "Failed to update Contract Management Rights table!" )
End If

This.SetRedraw( True )

//--------------------------- APPEON BEGIN ---------------------------
//$<Add> 08.22.2007 By: Evan
//$<Reason> Need to destroy object.
if IsValid(lds_contract_management_rights_old) then Destroy lds_contract_management_rights_old
if IsValid(lds_contract_management_rights_new) then Destroy lds_contract_management_rights_new
//---------------------------- APPEON END ----------------------------
end event

type gb_1 from groupbox within pfc_cst_u_security_contract_status_role
integer x = 27
integer y = 24
integer width = 1371
integer height = 1492
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "Contract Status"
end type

