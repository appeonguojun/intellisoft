$PBExportHeader$u_tab_contract_multi.sru
$PBExportComments$[intellicontract_tab] The non medical fee schedule tab
forward
global type u_tab_contract_multi from u_tab
end type
type tabpage_header from u_tabpg_contract_multi_header within u_tab_contract_multi
end type
type tabpage_header from u_tabpg_contract_multi_header within u_tab_contract_multi
end type
type tabpage_detail from u_tabpg_contract_multi_detail within u_tab_contract_multi
end type
type tabpage_detail from u_tabpg_contract_multi_detail within u_tab_contract_multi
end type
end forward

global type u_tab_contract_multi from u_tab
integer width = 4448
integer height = 1996
tabposition tabposition = tabsonbottom!
alignment alignment = center!
boolean ib_alwaysvalidate = true
tabpage_header tabpage_header
tabpage_detail tabpage_detail
end type
global u_tab_contract_multi u_tab_contract_multi

type variables
// n_cst_cxt_reports inv_ctx_reports
//
//long	il_curindex
end variables

on u_tab_contract_multi.create
this.tabpage_header=create tabpage_header
this.tabpage_detail=create tabpage_detail
int iCurrent
call super::create
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.tabpage_header
this.Control[iCurrent+2]=this.tabpage_detail
end on

on u_tab_contract_multi.destroy
call super::destroy
destroy(this.tabpage_header)
destroy(this.tabpage_detail)
end on

event selectionchanged;call super::selectionchanged;//Sync data - jervis 06.01.2011
long ll_row
if newindex = 2 then
	ll_row = this.tabpage_detail.dw_browse.GetRow( )
	this.tabpage_detail.dw_browse.scrolltorow( this.tabpage_header.dw_header.GetRow() )
	if ll_row = this.tabpage_header.dw_header.GetRow() then this.tabpage_detail.dw_browse.event rowfocuschanged(ll_row)
else
	this.tabpage_header.dw_header.scrolltorow( this.tabpage_detail.dw_browse.GetRow() )
END IF 


end event

event pfc_postupdate;call super::pfc_postupdate;//Refresh ctx_custom_mulit_hdr alarm flag -- jervis 07.07.2011
gnv_data.of_retrieve( "ctx_all_notification") //jervis 07.07.2011
this.tabpage_header.of_set_flag(this.tabpage_header.dw_header )
this.tabpage_detail.of_set_flag(this.tabpage_detail.dw_detail)

return 1
end event

type tabpage_header from u_tabpg_contract_multi_header within u_tab_contract_multi
integer x = 18
integer y = 16
integer width = 4411
integer height = 1880
end type

type tabpage_detail from u_tabpg_contract_multi_detail within u_tab_contract_multi
integer x = 18
integer y = 16
integer width = 4411
integer height = 1880
end type

