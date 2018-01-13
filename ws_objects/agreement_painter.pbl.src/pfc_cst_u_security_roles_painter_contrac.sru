$PBExportHeader$pfc_cst_u_security_roles_painter_contrac.sru
$PBExportComments$Create by Jack 10/27/2006
forward
global type pfc_cst_u_security_roles_painter_contrac from userobject
end type
type st_1 from statictext within pfc_cst_u_security_roles_painter_contrac
end type
type dw_2 from u_dw_contract within pfc_cst_u_security_roles_painter_contrac
end type
type dw_1 from u_dw_contract within pfc_cst_u_security_roles_painter_contrac
end type
type cb_cancel from commandbutton within pfc_cst_u_security_roles_painter_contrac
end type
type cb_ok from commandbutton within pfc_cst_u_security_roles_painter_contrac
end type
type cb_copy from commandbutton within pfc_cst_u_security_roles_painter_contrac
end type
type gb_1 from groupbox within pfc_cst_u_security_roles_painter_contrac
end type
type gb_5 from groupbox within pfc_cst_u_security_roles_painter_contrac
end type
end forward

global type pfc_cst_u_security_roles_painter_contrac from userobject
integer width = 2715
integer height = 1708
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
st_1 st_1
dw_2 dw_2
dw_1 dw_1
cb_cancel cb_cancel
cb_ok cb_ok
cb_copy cb_copy
gb_1 gb_1
gb_5 gb_5
end type
global pfc_cst_u_security_roles_painter_contrac pfc_cst_u_security_roles_painter_contrac

type variables
w_security_roles_painter  iw_win



end variables

forward prototypes
public function integer of_validate_right ()
end prototypes

public function integer of_validate_right ();//====================================================================
// Function: of_validate_right
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	Jay Chen		Date: 04-01-2015
//--------------------------------------------------------------------
//	Copyright (c) 2008-2014 ContractLogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

long ll_right1,ll_right2,ll_right3,ll_right4,ll_right5,li_row_cnt,i,ll_type

li_row_cnt = dw_1.rowcount()
ll_type = dw_2.getitemnumber(dw_2.getrow(), "types")

for i = 1 to li_row_cnt
	ll_right1 = dw_1.GetItemNumber( i, "right1" ) 
	ll_right2 = dw_1.GetItemNumber( i, "right2" )
	ll_right3 = dw_1.GetItemNumber( i, "right3" )
	if ll_type = 2 or  ll_type = 3 or  ll_type = 4 then 
		ll_right4 = dw_1.GetItemNumber( i, "right4" )
	end If
	if ll_type = 2 then ll_right5 = dw_1.GetItemNumber( i, "right5" )
	if isnull(ll_right1) then ll_right1 = 0
	if isnull(ll_right2) then ll_right2 = 0
	if isnull(ll_right3) then ll_right3 = 0
	if isnull(ll_right4) then ll_right4 = 0
	if isnull(ll_right5) then ll_right5 = 0	
	
	if ll_right1 = 0 and ll_right2 = 0 and ll_right3 = 0 and ll_right4 = 0 and ll_right5 = 0 then
		Messagebox(gnv_app.iapp_object.displayname,"You must select a permission!")
		dw_1.setrow(i)
		dw_1.scrolltorow(i) //Added By Ken.Guo 2016-11-25
		dw_1.selectrow(0,false)
		dw_1.selectrow(i,true)
		return -1
	end if
next

return 1
end function

on pfc_cst_u_security_roles_painter_contrac.create
this.st_1=create st_1
this.dw_2=create dw_2
this.dw_1=create dw_1
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
this.cb_copy=create cb_copy
this.gb_1=create gb_1
this.gb_5=create gb_5
this.Control[]={this.st_1,&
this.dw_2,&
this.dw_1,&
this.cb_cancel,&
this.cb_ok,&
this.cb_copy,&
this.gb_1,&
this.gb_5}
end on

on pfc_cst_u_security_roles_painter_contrac.destroy
destroy(this.st_1)
destroy(this.dw_2)
destroy(this.dw_1)
destroy(this.cb_cancel)
destroy(this.cb_ok)
destroy(this.cb_copy)
destroy(this.gb_1)
destroy(this.gb_5)
end on

event constructor;//Added By Jay Chen 03-19-2015
long ll_role_id,ll_row

dw_2.settransobject(sqlca)
dw_1.settransobject(sqlca)

if isvalid(w_security_roles_painter) then
	ll_role_id = w_security_roles_painter.tab_security.tabpage_roles.uo_roles.ii_id
else
	return
end if

gnv_appeondb.of_startqueue( )
dw_1.retrieve( ll_role_id )
dw_2.retrieve( )
if dw_2.rowcount() > 0 then
	dw_2.selectrow(0, false)
	dw_2.selectrow(1, true)
end if

gnv_appeondb.of_commitqueue( )
end event

type st_1 from statictext within pfc_cst_u_security_roles_painter_contrac
boolean visible = false
integer x = 59
integer y = 1612
integer width = 1339
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "EWA: Editing With Approval; AWA: Adding With Approval."
boolean focusrectangle = false
end type

type dw_2 from u_dw_contract within pfc_cst_u_security_roles_painter_contrac
integer x = 59
integer y = 88
integer width = 823
integer height = 1428
integer taborder = 30
string dataobject = "d_contract_management_typelist"
end type

event clicked;call super::clicked;//Added By Jay Chen 03-19-2015

long ll_type,ll_role_id,ll_row
datawindowchild ldwc

if row < 1 then return
ll_row = this.getrow()
this.selectrow(0, false)
this.selectrow(row, true)
ll_type = this.getitemnumber( row, "types")
if isvalid(w_security_roles_painter) then
	ll_role_id = w_security_roles_painter.tab_security.tabpage_roles.uo_roles.ii_id
else
	return
end if

if dw_1.modifiedcount( ) > 0 then
	if messagebox(gnv_app.iapp_object.DisplayName,'Do you want to save changes?',question!,yesno!) = 1 then
		if of_validate_right() < 1 then 
			this.selectrow(0, false)
			this.selectrow(ll_row, true)
			return 1
		end if
		dw_1.update()
	end if
end if

choose case ll_type
	case 1
		gb_1.text = 'Contract Management/Tracking'
		dw_1.dataobject = 'd_contract_management_tracking'
		cb_copy.enabled = true
		st_1.visible = false
	case 2
		gb_1.text = 'Clauses'
		dw_1.dataobject = 'd_contract_management_clauses'
		cb_copy.enabled = false
		st_1.visible = true
	case 3
		gb_1.text = 'Templates'
		dw_1.dataobject = 'd_contract_management_templates'
		cb_copy.enabled = false
		st_1.visible = true
	case 4
		gb_1.text = 'Documents Library'
		dw_1.dataobject = 'd_contract_management_documents'
		cb_copy.enabled = false
		st_1.visible = true
	case 6
		gb_1.text = 'Division'
		dw_1.dataobject = 'd_contract_management_division'
		cb_copy.enabled = false
		st_1.visible = false
	case 7
		gb_1.text = 'Department'
		dw_1.dataobject = 'd_contract_management_department'
		cb_copy.enabled = false
		st_1.visible = false
	case 8
		gb_1.text = 'Contract Type'
		dw_1.dataobject = 'd_contract_management_contract_type'
		cb_copy.enabled = false
		st_1.visible = false
end choose

dw_1.settransobject(sqlca)
dw_1.retrieve( ll_role_id )

if ll_type = 2 then
	dw_1.getchild("category",ldwc)
	ldwc.settransobject(sqlca)
	ldwc.retrieve('Contract Clause Category')
end if
end event

type dw_1 from u_dw_contract within pfc_cst_u_security_roles_painter_contrac
integer x = 937
integer y = 88
integer width = 1710
integer height = 1428
integer taborder = 30
string dataobject = "d_contract_management_tracking"
end type

event getfocus;//
end event

event losefocus;//
end event

event rbuttonup;//
end event

event itemchanged;call super::itemchanged;long	i,	ll_rowcount,ll_type
string ls_column,ls_visible,ls_string
	
if row <= 0 then return 	
this.accepttext( )
ll_type = dw_2.getitemnumber(dw_2.getrow(), "types")

if long(data) = 1 then 
	for i = 1 to 5
		ls_column = 'right' + string(i)
		if ls_column = dwo.name then continue
		ls_visible = this.describe(ls_column + ".Visible")
		if ls_visible = '1' then
			this.SetItem(row,ls_column,0)
		end if
	next
	//set value for ctx_acp_contract_management_right.rights
	choose case ll_type
		case 1
			if dwo.name = 'right1' then
				this.SetItem(row,"rights",'11')
			elseif dwo.name = 'right2' then
				this.SetItem(row,"rights",'12')
			elseif dwo.name = 'right3' then
				this.SetItem(row,"rights",'13')
			end if
		case 2
			if dwo.name = 'right1' then
				this.SetItem(row,"rights",'21')
			elseif dwo.name = 'right2' then
				this.SetItem(row,"rights",'22')
			elseif dwo.name = 'right3' then
				this.SetItem(row,"rights",'23')
			elseif dwo.name = 'right4' then
				this.SetItem(row,"rights",'24')
			elseif dwo.name = 'right5' then
				this.SetItem(row,"rights",'25')
			end if
		case 3
			if dwo.name = 'right1' then
				this.SetItem(row,"rights",'31')
			elseif dwo.name = 'right2' then
				this.SetItem(row,"rights",'32')
			elseif dwo.name = 'right3' then
				this.SetItem(row,"rights",'33')
			elseif dwo.name = 'right4' then
				this.SetItem(row,"rights",'34')
			end if
		case 4
			if dwo.name = 'right1' then
				this.SetItem(row,"rights",'41')
			elseif dwo.name = 'right2' then
				this.SetItem(row,"rights",'42')
			elseif dwo.name = 'right3' then
				this.SetItem(row,"rights",'43')
			elseif dwo.name = 'right4' then
				this.SetItem(row,"rights",'44')
			end if
		case 6
			if dwo.name = 'right1' then
				this.SetItem(row,"rights",'61')
			elseif dwo.name = 'right2' then
				this.SetItem(row,"rights",'62')
			elseif dwo.name = 'right3' then
				this.SetItem(row,"rights",'63')
			end if
		case 7
			if dwo.name = 'right1' then
				this.SetItem(row,"rights",'71')
			elseif dwo.name = 'right2' then
				this.SetItem(row,"rights",'72')
			elseif dwo.name = 'right3' then
				this.SetItem(row,"rights",'73')
			end if
		case 8
			if dwo.name = 'right1' then
				this.SetItem(row,"rights",'81')
			elseif dwo.name = 'right2' then
				this.SetItem(row,"rights",'82')
			elseif dwo.name = 'right3' then
				this.SetItem(row,"rights",'83')
			end if
	end choose
end if



end event

event buttonclicked;call super::buttonclicked;long	i,	ll_rowcount,ll_type,j
string ls_column,ls_visible,ls_string,ls_objectname
boolean lb_select_all = false
	
ls_objectname = dwo.name 
ll_type = dw_2.getitemnumber(dw_2.getrow(), "types")

if ls_objectname = 'b_1' or ls_objectname = 'b_2' or ls_objectname= 'b_3' or ls_objectname = 'b_4' or ls_objectname = 'b_5' then
	ls_column = 'right' + right(dwo.name,1)
	if dw_1.describe(ls_objectname + ".text") ='All' then lb_select_all = true
 	FOR i = 1 To dw_1.RowCount() 
		if  lb_select_all then
			dw_1.SetItem(i,ls_column,1)
			for j = 1 to 5
				ls_string = 'right' + string(j)
				if ls_column = ls_string then continue
				ls_visible = dw_1.describe(ls_string + ".Visible")
				if ls_visible = '1' then
					dw_1.SetItem(i,ls_string,0)
				end if
			next
			//set value for ctx_acp_contract_management_right.rights
			choose case ll_type
				case 1
					if ls_column = 'right1' then
						dw_1.SetItem(i,"rights",'11')
					elseif ls_column = 'right2' then
						dw_1.SetItem(i,"rights",'12')
					elseif ls_column = 'right3' then
						dw_1.SetItem(i,"rights",'13')
					end if
				case 2
					if ls_column = 'right1' then
						dw_1.SetItem(i,"rights",'21')
					elseif ls_column = 'right2' then
						dw_1.SetItem(i,"rights",'22')
					elseif ls_column = 'right3' then
						dw_1.SetItem(i,"rights",'23')
					elseif ls_column = 'right4' then
						dw_1.SetItem(i,"rights",'24')
					elseif ls_column = 'right5' then
						dw_1.SetItem(i,"rights",'25')
					end if
				case 3
					if ls_column = 'right1' then
						dw_1.SetItem(i,"rights",'31')
					elseif ls_column = 'right2' then
						dw_1.SetItem(i,"rights",'32')
					elseif ls_column = 'right3' then
						dw_1.SetItem(i,"rights",'33')
					elseif ls_column = 'right4' then
						dw_1.SetItem(i,"rights",'34')
					end if
				case 4
					if ls_column = 'right1' then
						dw_1.SetItem(i,"rights",'41')
					elseif ls_column = 'right2' then
						dw_1.SetItem(i,"rights",'42')
					elseif ls_column = 'right3' then
						dw_1.SetItem(i,"rights",'43')
					elseif ls_column = 'right4' then
						dw_1.SetItem(i,"rights",'44')
					end if
				case 6
					if ls_column = 'right1' then
						dw_1.SetItem(i,"rights",'61')
					elseif ls_column = 'right2' then
						dw_1.SetItem(i,"rights",'62')
					elseif ls_column = 'right3' then
						dw_1.SetItem(i,"rights",'63')
					end if
				case 7
					if ls_column = 'right1' then
						dw_1.SetItem(i,"rights",'71')
					elseif ls_column = 'right2' then
						dw_1.SetItem(i,"rights",'72')
					elseif ls_column = 'right3' then
						dw_1.SetItem(i,"rights",'73')
					end if
				case 8
					if ls_column = 'right1' then
						dw_1.SetItem(i,"rights",'81')
					elseif ls_column = 'right2' then
						dw_1.SetItem(i,"rights",'82')
					elseif ls_column = 'right3' then
						dw_1.SetItem(i,"rights",'83')
					end if
			end choose
		else
			dw_1.SetItem(i,ls_column,0)
			dw_1.SetItem(i,"rights",'')
		end if
	NEXT
	
	if lb_select_all then
		dw_1.modify(ls_objectname + ".text = 'None' ")
	else
		dw_1.modify(ls_objectname + ".text = 'All' ")
	end if
END IF

	




end event

type cb_cancel from commandbutton within pfc_cst_u_security_roles_painter_contrac
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

type cb_ok from commandbutton within pfc_cst_u_security_roles_painter_contrac
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

event clicked;//gnv_appeondb.of_startqueue( ) //Commented By Ken.Guo 2016-11-25
if of_validate_right() < 1 then return 1
dw_1.Update()
//dw_2.Update() //Modified By Jay Chen 03-19-2015
//dw_3.Update()
//dw_4.Update()
//gnv_appeondb.of_commitqueue( ) //Commented By Ken.Guo 2016-11-25


//Added By Mark Lee 03-23-2015
if isvalid(w_custom_report) then
	w_custom_report.of_destory_ds()
end if
end event

type cb_copy from commandbutton within pfc_cst_u_security_roles_painter_contrac
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

type gb_1 from groupbox within pfc_cst_u_security_roles_painter_contrac
integer x = 914
integer y = 24
integer width = 1765
integer height = 1520
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "Contract Management/Tracking"
end type

type gb_5 from groupbox within pfc_cst_u_security_roles_painter_contrac
integer x = 37
integer y = 24
integer width = 864
integer height = 1520
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "Contract Operation Type"
end type

