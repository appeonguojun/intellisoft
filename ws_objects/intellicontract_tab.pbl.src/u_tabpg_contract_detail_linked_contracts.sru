$PBExportHeader$u_tabpg_contract_detail_linked_contracts.sru
forward
global type u_tabpg_contract_detail_linked_contracts from u_tabpg_contract_master
end type
type dw_1 from u_dw_contract within u_tabpg_contract_detail_linked_contracts
end type
end forward

global type u_tabpg_contract_detail_linked_contracts from u_tabpg_contract_master
integer width = 2757
integer height = 564
string text = "Audit Trail"
dw_1 dw_1
end type
global u_tabpg_contract_detail_linked_contracts u_tabpg_contract_detail_linked_contracts

type variables
long il_ctx_id
end variables

on u_tabpg_contract_detail_linked_contracts.create
int iCurrent
call super::create
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
end on

on u_tabpg_contract_detail_linked_contracts.destroy
call super::destroy
destroy(this.dw_1)
end on

type st_1 from u_tabpg_contract_master`st_1 within u_tabpg_contract_detail_linked_contracts
end type

type dw_1 from u_dw_contract within u_tabpg_contract_detail_linked_contracts
string tag = "Linked Contracts"
integer y = 8
integer width = 2747
integer height = 520
integer taborder = 10
boolean bringtotop = true
string title = "Linked Contracts"
boolean hscrollbar = true
boolean hsplitscroll = true
boolean ib_isupdateable = false
boolean ib_rmbfocuschange = false
string dataobject_original = "d_sp_contract_search"
boolean ib_use_row_selection = true
boolean ib_allow_filter = true
boolean ib_allow_sort = true
end type

event pfc_retrieve;call super::pfc_retrieve;//////////////////////////////////////////////////////////////////////
// $<event>pfc_retrievedw_1()
// $<arguments>(None)
// $<returns> long
// $<description>
// $<description>
//////////////////////////////////////////////////////////////////////
// $<add> 03.14.2007 by Jack (Contract)
//////////////////////////////////////////////////////////////////////

string  ls_filter, ls_Null
Long	ll_ret, ll_Null
Decimal ldec_Null
DateTime ldt_Null


SetNull( ls_Null )
SetNull( ll_Null )
SetNull( ldec_Null )
SetNull( ldt_Null )




//ls_filter = "master_contract_id = " + string(il_ctx_id)
//dw_1.setfilter(ls_filter)
//dw_1.filter()
//
SetTransObject( SQLCA )
//Retrieve(Upper(gs_user_id ))

//modified by gavins 20160927
ll_ret = retrieve ( gs_user_id, ll_Null, ldec_Null, ldec_Null, ldec_Null, &
	ldec_Null, ldec_Null, ldec_Null, ls_Null, &
	ldt_Null, ldt_Null,ldt_Null, ldt_Null, &
	ldt_Null, ldt_Null, ldt_Null, 	ldt_Null, &
	ldt_Null, ldt_Null, ldt_Null, ldt_Null, &
	ldt_Null, 	ldt_Null, ldt_Null, ldt_Null, &
	ls_Null, ls_Null, ls_Null, ls_Null, ls_Null, &
	ls_Null, ls_Null, ls_Null, &
	ldec_Null, ldec_Null, ldec_Null, ldec_Null, ldec_Null, &
	ldec_Null, ls_Null, ldec_Null, ls_Null, ls_Null, &
	ls_Null, ldec_Null, ls_Null, ls_Null, &
	ls_Null,ls_null, ldec_Null, 	ls_Null, &
	"", 	' AND    ( ctx_basic_info.master_contract_id = ' +string(il_ctx_id) +' )',"N" )	


return success
end event

event pfc_prermbmenuproperty;call super::pfc_prermbmenuproperty;

am_dw.m_table.m_cut.Visible = false
am_dw.m_table.m_copy.Visible = false
am_dw.m_table.m_paste.Visible = false
am_dw.m_table.m_dash11.Visible = false
am_dw.m_table.m_insert.Visible = false
am_dw.m_table.m_addrow.Visible = false

am_dw.m_table.m_delete.Visible = false
am_dw.m_table.m_selectall.Visible = false
am_dw.m_table.m_restorerow.Visible = false


end event

event pfc_addrow;//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 08.23.2006 By: Liang QingShi
//$<reason> Contract module modification
//$<reason>Fix a defect.
//
return success
//---------------------------- APPEON END ----------------------------

end event

event pfc_deleterow;//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 08.23.2006 By: Liang QingShi
//$<reason> Contract module modification
//$<reason>Fix a defect.
//
return success
//---------------------------- APPEON END ----------------------------

end event

event rbuttonup;//
end event

event getfocus;call super::getfocus;//====================================================================
// Event: getfocus()
//--------------------------------------------------------------------
// Description: Set the add menu item disabled
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	Scofield		Date: 2008-11-14
//====================================================================

if IsValid(m_pfe_cst_mdi_menu_contract) then
	gnv_app.of_modify_menu_attr( m_pfe_cst_mdi_menu_contract.m_edit.m_insert,'enabled', false)
end if

end event

event doubleclicked;call super::doubleclicked;Long			ll_ctx_id
pointer lptr_prev


If Row <=0 Then Return

ll_ctx_id = This.GetItemNumber( row, 'ctx_id' )

lptr_prev = setPointer(hourglass!)

If  Isvalid(  gw_contract ) Then

	IF gw_contract.tab_contract_details.tabpage_search.of_goto_contract(ll_ctx_id) = 1 THEN
	
		 gw_contract.function dynamic of_select_details_tab()
	
		if (gb_restore_contract_state and w_mdi.of_security_access(7002) = 1) and ProfileString(gs_IniWindowState,"w_contract","Maximized",'1') <> '1' then	 
			If gw_contract.WindowState = Minimized! Then gw_contract.windowstate = Normal!
		else
			If gw_contract.WindowState = Minimized! Then gw_contract.windowstate = maximized!
		end if
	
	ELSE
		messageBox( "Linked contracts", "Error - unable to find Contract No " + string(ll_ctx_id ))
	END IF
End If
setPointer(lptr_prev)
end event

