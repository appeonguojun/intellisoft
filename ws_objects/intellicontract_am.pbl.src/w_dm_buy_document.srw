$PBExportHeader$w_dm_buy_document.srw
forward
global type w_dm_buy_document from w_dm_sell_document
end type
end forward

global type w_dm_buy_document from w_dm_sell_document
integer x = 214
integer y = 221
integer width = 2752
integer height = 1452
end type
global w_dm_buy_document w_dm_buy_document

type variables
//n_cst_contract inv_contract_details //Added By Jay Chen 11-29-2013
end variables

forward prototypes
public subroutine of_set_flag (u_dw adw_alm)
end prototypes

public subroutine of_set_flag (u_dw adw_alm);long	ll_ctx_id
string ls_customscreen[]
long ll_i,ll_count,ll_doc_id
long ll_k,ll_colcount

ll_ctx_id = dw_1.getitemnumber(1,"ctx_id")
ll_count = adw_alm.rowcount()

ls_customscreen =  {'custom_date1','custom_date2','custom_date3','custom_date4','custom_date5','custom_date6','received_date','status_date','create_date','checkout_date'}

ll_colcount = UpperBound(ls_customscreen)
FOR ll_i = 1 to ll_count
	ll_doc_id = adw_alm.GetItemNumber( ll_i,'doc_id')
	for ll_k = 1 to ll_colCount
		adw_alm.SetItem( ll_i, ls_customscreen[ll_k] + "_flag", f_set_ai_flag('ctx_am_document', ls_customscreen[ll_k],ll_ctx_id,ll_doc_id, 0,0)) //Modified By Jay Chen 11-29-2013
	next
	adw_alm.SetItemStatus(ll_i, 0, Primary!, NotModified!)	
NEXT
adw_alm.Post setredraw(true) 


end subroutine

on w_dm_buy_document.create
call super::create
end on

on w_dm_buy_document.destroy
call super::destroy
end on

event open;call super::open;String	ls_Null
DateTime	ldt_Null
datawindowchild ldwc_category
Long ll_category,ll_null

SetNull(ll_null)
SetNull(ls_Null)
SetNull(ldt_Null)

if ib_new then
	dw_1.SetItem(1,"doc_type","Other")
	dw_1.SetItem(1,"received_by",gs_user_id)
	dw_1.SetItem(1,"received_date",Today())
	dw_1.SetColumn("doc_name")
	
	//Added By Ken.Guo 2009-12-04. Filter by contract category.
	dw_1.Getchild( "category", ldwc_category)
	of_filter_category(ldwc_category, '-1')
	//Added By Ken.Guo 2010-01-14.
	ll_category = dw_1.GetItemNumber(1,'Category')
	IF ldwc_category.find('lookup_code = '+string(ll_category),1,ldwc_category.rowcount()) < 1 THEN 
		dw_1.setitem(1, 'category', ll_NULL)
	END IF 	
	
	
	dw_1.SetitemStatus(1,0,Primary!,NotModified!)		//Added by Scofield on 2009-12-10
	
//	//Added By Jay Chen 12-02-2013
//	String ls_dwsyntax
//	ls_dwsyntax = dw_1.describe("datawindow.syntax")
//	if pos(ls_dwsyntax,"b_custom_date1") > 0 then dw_1.object.b_custom_date1.enabled = false
//	if pos(ls_dwsyntax,"b_custom_date2") > 0 then dw_1.object.b_custom_date2.enabled = false
//	if pos(ls_dwsyntax,"b_custom_date3") > 0 then dw_1.object.b_custom_date3.enabled = false
//	if pos(ls_dwsyntax,"b_custom_date4") > 0 then dw_1.object.b_custom_date4.enabled = false
//	if pos(ls_dwsyntax,"b_custom_date5") > 0 then dw_1.object.b_custom_date5.enabled = false
//	if pos(ls_dwsyntax,"b_custom_date6") > 0 then dw_1.object.b_custom_date6.enabled = false
//	if pos(ls_dwsyntax,"b_received_date") > 0 then dw_1.object.b_received_date.enabled = false
//	if pos(ls_dwsyntax,"b_create_date") > 0 then dw_1.object.b_create_date.enabled = false
//	if pos(ls_dwsyntax,"b_status_date") > 0 then dw_1.object.b_status_date.enabled = false
//	if pos(ls_dwsyntax,"b_checkout_date") > 0 then dw_1.object.b_checkout_date.enabled = false
//	//end add
Else
	dw_1.modify('p_attachment.height = 0')
end if

//Added By Jay Chen 12-30-2015
string ls_visible
datawindowchild ldwc
ls_visible = dw_1.describe("export_id.visible")
if ls_visible = "?" or ls_visible = "!" then ls_visible = '0'
if ls_visible = '1' then
	dw_1.getchild("export_id",ldwc)
	ldwc.settransobject(sqlca)
	ldwc.retrieve(gi_contract_view_id)
end if

//Commented By Ken.Guo 2017-01-13. Task 712. unhide preview function.
//cb_preview.visible = false
//Modified by gavins 20161019  because saas upgrade apb6.5 to apb6.8 doc preview produce crash issue.

end event

type cbx_preview from w_dm_sell_document`cbx_preview within w_dm_buy_document
integer x = 1938
end type

type st_process from w_dm_sell_document`st_process within w_dm_buy_document
integer x = 1943
integer y = 736
end type

type cb_design from w_dm_sell_document`cb_design within w_dm_buy_document
integer x = 1943
integer y = 1076
end type

type st_info from w_dm_sell_document`st_info within w_dm_buy_document
boolean visible = true
integer y = 1292
integer width = 1632
end type

type cb_preview from w_dm_sell_document`cb_preview within w_dm_buy_document
boolean visible = true
integer x = 1943
end type

type cb_weblink from w_dm_sell_document`cb_weblink within w_dm_buy_document
integer x = 1943
end type

type cb_4 from w_dm_sell_document`cb_4 within w_dm_buy_document
integer x = 1943
integer y = 1176
end type

type cb_3 from w_dm_sell_document`cb_3 within w_dm_buy_document
integer x = 1943
integer y = 1064
end type

type cb_checkin from w_dm_sell_document`cb_checkin within w_dm_buy_document
boolean visible = true
integer x = 1943
end type

type dw_1 from w_dm_sell_document`dw_1 within w_dm_buy_document
integer width = 1902
integer height = 1244
string dataobject = "d_dm_new_buy_document"
end type

event dw_1::clicked;call super::clicked;If dwo.name = 'p_attachment' Then
	//UnCommented By Ken.Guo 2017-01-13. Task 712. unhide preview function.
	cb_preview.event clicked( ) //Commented by gavins 20161019  because saas upgrade apb6.5 to apb6.8 doc preview produce crash issue.
End If
end event

event dw_1::buttonclicked;//Added By Jay Chen 12-02-2013 
dw_1.accepttext()
if ib_new then
	messagebox('Information','The date alarm function can not be used when adding document.~r~n You can go to document properties window to set date alarm ~r~n after the adding document is completed.')
	return 1
else
	if dw_1.modifiedcount( ) > 0 then
		parent.event pfc_save()
		gnv_data.ids_ctx_all_notification.Retrieve() 
	end if	
	of_set_flag(this)
	if of_check_read_only( ) then return 1 
	this.SetRow( row)
	inv_contract_details.of_set_alarm( this,'Ctx_am_document', dwo)
end if



end event

event dw_1::itemchanged;call super::itemchanged;//====================================================================
// Event: itemchanged
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value    long        row
// 	value    dwobject    dwo
// 	value    string      data
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	Jay Chen		Date: 01-21-2016
//--------------------------------------------------------------------
//	Copyright (c) 2008-2014 ContractLogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
Long ll_export_id_org,ll_export_id

if row < 1 then return
this.accepttext()

Choose Case dwo.name
	Case 'export_id' 
		If not ib_new Then
			ll_export_id_org = This.GetItemNumber(row, 'export_id', primary!,true)
			ll_export_id = This.GetItemNumber(row, 'export_id', primary!,false)
			if isnull(ll_export_id_org) then ll_export_id_org = 0
			if isnull(ll_export_id) then ll_export_id = 0
			If ll_export_id_org <> ll_export_id and ll_export_id_org <> 0 Then
				If Messagebox('Warning','It is not recommended to change the export name because changing the export could cause the document merge error if a field from the original export has already been inserted into the document. ~r~n~r~nAre you sure you want to change it?', question!, yesno!,2) = 2 Then
					This.Post SetItem(row, 'export_id', ll_export_id_org)
					This.Post SetItemStatus(row, 'export_id', Primary!,NotModified!	)
				End If
			End If
		End If
End Choose
end event

type cb_pastefile from w_dm_sell_document`cb_pastefile within w_dm_buy_document
boolean visible = true
integer x = 1943
end type

type cb_scan from w_dm_sell_document`cb_scan within w_dm_buy_document
boolean visible = true
integer x = 1943
end type

