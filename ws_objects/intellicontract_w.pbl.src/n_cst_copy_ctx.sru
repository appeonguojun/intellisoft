$PBExportHeader$n_cst_copy_ctx.sru
forward
global type n_cst_copy_ctx from nonvisualobject
end type
end forward

global type n_cst_copy_ctx from nonvisualobject
end type
global n_cst_copy_ctx n_cst_copy_ctx

type variables
long il_rowcount,il_status,il_category,il_ctx_id //Added By Jay Chen 02-18-2014

n_ds			ids_filter											//Added By Mark Lee 06/10/2015
boolean		ibn_filter = false 								//Added By Mark Lee 06/10/2015

Long il_view 													//Added by Harry 20170622 for Task 728
n_ds			ids_screen										//Added by Harry 20170622 for Task 728	
end variables

forward prototypes
public function integer of_copy_document_manager (long al_ctx_id_source, long al_ctx_id_destin)
public function integer of_update_ctx_flag (long al_ctx_id, integer ai_flag)
public function long of_copy_ctx_data (str_copy_ctx astr_copy_ctx)
public function integer of_update_template_data (str_copy_ctx astr_copy_ctx, long al_template_id)
public function long of_copy_ctx_from_template (long al_template_id)
public function integer of_update_requirement_profile (long al_source_ctx_id, long al_target_ctx_id)
public subroutine of_locate_ctx (long al_ctx_id)
public subroutine of_show_contract_window ()
public function integer of_check_exist_contract ()
public function integer of_locate_ctx (long al_ctx_id, integer ai_tab_index)
public subroutine of_copy_alarms (str_copy_ctx astr_copy_ctx, long al_ctx_id, long al_ori_action_id[], long al_new_action_id[])
public subroutine of_copy_custom_data (str_copy_ctx astr_copy_ctx, long al_new_ctx_id)
public function integer of_insert_contact (long al_ctx_id, integer ai_ib_default_email, integer ai_ib_owner)
public subroutine of_copy_company_contact_data (str_copy_ctx astr_copy_ctx, long ai_new_ctx_id)
public function long of_copy_ctx_from_template (long al_template_id, string as_come_from)
public function integer of_create_action_item_by_workflow ()
public function boolean of_check_unselect_fields (long al_screen_id, string as_table, string as_column)
public function boolean of_unuser_columns (string as_table, string as_column, string as_sub)
public subroutine of_get_filter_ds (datawindow as_dw)
public function integer of_generate_select_screen_fields (long al_view_id, string as_screen, datawindow adw, string as_sub, boolean abn_exists)
public function boolean of_get_visible (datastore ads_table, string as_field)
public function boolean of_get_screen_exist (long al_view_id, long al_screen_id)
protected subroutine of_set_value (datastore ads_dync, string as_col_name, ref datastore ads_ins, long al_ins_row, datastore ads_data, long al_data_row, string as_type)
public subroutine of_set_multi_select_value (string as_col_name, long al_screen, long al_ctx_id, string as_value)
public subroutine of_set_value (datastore ads_dync, string as_col_name, ref datastore ads_ins, long al_ins_row, datastore ads_data, long al_data_row, string as_type, datastore ads_custom, long al_screen, long al_ctx_id)
protected subroutine of_set_value (datastore ads_dync, string as_col_name, ref datastore ads_ins, long al_ins_row, datastore ads_data, long al_data_row, string as_type, long al_screen, long al_ctx_id)
end prototypes

public function integer of_copy_document_manager (long al_ctx_id_source, long al_ctx_id_destin);//////////////////////////////////////////////////////////////////////
// $<function>n_cst_copy_ctx::of_copy_document_manager()
// $<arguments>
//		value	long	al_ctx_id_source		
//		value	long	al_ctx_id_destin		
// $<returns> integer
// $<description>
// $<description> this function is copy from w_copy_contract.
//////////////////////////////////////////////////////////////////////
// $<add> 2009-08-24 by Ken.Guo
//////////////////////////////////////////////////////////////////////


long		ll_Cycle_01,ll_RowCnt_01,ll_Cycle_02,ll_RowCnt_02,ll_Cycle_03,ll_RowCnt_03
long		ll_doc_id_old,ll_doc_id_new,ll_doc_status,ll_Rtn
String	ls_RevControl, ls_doc_ext

Decimal	ld_Revision,ld_RevControl_Destin

DataStore	lds_ctx_am_document_Source
DataStore	lds_ctx_am_doc_image_Source
DataStore	lds_ctx_am_document_clause_Source

DataStore	lds_ctx_am_document_Destin
DataStore	lds_ctx_am_doc_image_Destin
DataStore	lds_ctx_am_document_clause_Destin

/*
DataStore	lds_ctx_am_action_item_Source
DataStore	lds_ctx_am_doc_audit_Source
DataStore	lds_ctx_am_ai_notification_Source
DataStore	lds_ctx_am_ai_notification_users_Source
DataStore	lds_ctx_am_ai_alarm_attachment_Source
DataStore	lds_ctx_am_image_weblink_Source

DataStore	lds_ctx_am_action_item_Destin
DataStore	lds_ctx_am_doc_audit_Destin
DataStore	lds_ctx_am_ai_notification_Destin
DataStore	lds_ctx_am_ai_notification_users_Destin
DataStore	lds_ctx_am_ai_alarm_attachment_Destin
DataStore	lds_ctx_am_image_weblink_Destin

d_ctx_am_document_copy
d_ctx_am_doc_image_copy
d_ctx_am_action_item_copy
d_ctx_am_doc_audit_copy
d_ctx_am_document_clause_copy
d_ctx_am_ai_notification_copy
d_ctx_am_ai_notification_users_copy
d_ctx_am_ai_alarm_attachment_copy
d_ctx_am_image_weblink_copy
*/

///////////////////////////////////////////////////////////////////////////////
lds_ctx_am_document_Source = Create DataStore
lds_ctx_am_document_Source.DataObject = "d_ctx_am_document_copy"
lds_ctx_am_document_Source.SetTransObject(SQLCA)

lds_ctx_am_document_Destin = Create DataStore
lds_ctx_am_document_Destin.DataObject = "d_ctx_am_document_copy"
lds_ctx_am_document_Destin.SetTransObject(SQLCA)
///////////////////////////////////////////////////////////////////////////////
lds_ctx_am_doc_image_Source = Create DataStore
lds_ctx_am_doc_image_Source.DataObject = "d_ctx_am_doc_image_copy"
lds_ctx_am_doc_image_Source.SetTransObject(SQLCA)

lds_ctx_am_doc_image_Destin = Create DataStore
lds_ctx_am_doc_image_Destin.DataObject = "d_ctx_am_doc_image_copy"
lds_ctx_am_doc_image_Destin.SetTransObject(SQLCA)
///////////////////////////////////////////////////////////////////////////////
lds_ctx_am_document_clause_Source = Create DataStore
lds_ctx_am_document_clause_Source.DataObject = "d_ctx_am_document_clause_copy"
lds_ctx_am_document_clause_Source.SetTransObject(SQLCA)

lds_ctx_am_document_clause_Destin = Create DataStore
lds_ctx_am_document_clause_Destin.DataObject = "d_ctx_am_document_clause_copy"
lds_ctx_am_document_clause_Destin.SetTransObject(SQLCA)
///////////////////////////////////////////////////////////////////////////////

ll_doc_status = long(gnv_data.of_getitem( 'code_lookup', 'lookup_code', "upper(lookup_name) = upper('Contract Document Status') and upper(code) = upper('New')"))

lds_ctx_am_document_Source.Retrieve(al_ctx_id_source)
lds_ctx_am_document_Destin.Reset()
ll_RowCnt_01 = lds_ctx_am_document_Source.RowCount()

for ll_Cycle_01 = 1 to ll_RowCnt_01
	lds_ctx_am_document_Source.RowsCopy(ll_Cycle_01,ll_Cycle_01,Primary!,lds_ctx_am_document_Destin,ll_Cycle_01,Primary!)
	
	ll_doc_id_new = gnv_app.of_get_id("doc_id")
	lds_ctx_am_document_Destin.SetItem(ll_Cycle_01,"doc_id",ll_doc_id_new)
	lds_ctx_am_document_Destin.SetItem(ll_Cycle_01,"ctx_id",al_ctx_id_destin)
	lds_ctx_am_document_Destin.SetItem(ll_Cycle_01,"create_by",gs_user_id)
	lds_ctx_am_document_Destin.SetItem(ll_Cycle_01,"create_date",Today())
	lds_ctx_am_document_Destin.SetItem(ll_Cycle_01,"status",ll_doc_status)
	lds_ctx_am_document_Destin.SetItem(ll_Cycle_01,"status_by",gs_user_id)
	lds_ctx_am_document_Destin.SetItem(ll_Cycle_01,"status_date",Today())
	lds_ctx_am_document_Destin.SetItem(ll_Cycle_01,"checkout_status","0")
	
	ls_doc_ext = lds_ctx_am_document_Source.GetItemString(ll_Cycle_01, 'doc_ext') //Added By Ken.Guo 03/19/2014
	
	//Added By Mark Lee 03/06/2014
	lds_ctx_am_document_Destin.SetItem(ll_Cycle_01,"template_ctx_id",al_ctx_id_source)
	
	lds_ctx_am_document_Destin.SetItemStatus(ll_Cycle_01,0,Primary!,NewModified!)
	
	ll_Rtn = lds_ctx_am_document_Destin.Update()
	if ll_Rtn = 1 then
		COMMIT USING SQLCA;
	else
		ROLLBACK USING SQLCA;
		CONTINUE
	end if
	
	ll_doc_id_old = lds_ctx_am_document_Source.GetItemNumber(ll_Cycle_01,"doc_id")
	lds_ctx_am_doc_image_Source.Retrieve(ll_doc_id_old)
	lds_ctx_am_doc_image_Destin.Reset()
	
	if lds_ctx_am_doc_image_Source.RowCount() <= 0 then CONTINUE
	ll_RowCnt_02 = 1	//Copy the newest document.Ken 03/19/2014. Changed the DW sort clause. the first document is the newest document.	////Only copy the original revision
	for ll_Cycle_02 = 1 to ll_RowCnt_02
		ld_Revision = lds_ctx_am_doc_image_Source.GetItemDecimal(ll_Cycle_02,"Revision")
		
		if ld_Revision = 0.0 then
			ls_RevControl = "0"
			ld_RevControl_Destin = 0.0 //Added By Ken.Guo 03/19/2014
		else
			ls_RevControl = "1"
			ld_RevControl_Destin = 1.0 //Added By Ken.Guo 03/19/2014
		end if
		
		lds_ctx_am_doc_image_Source.RowsCopy(ll_Cycle_02,ll_Cycle_02,Primary!,lds_ctx_am_doc_image_Destin,ll_Cycle_02,Primary!)
		
		lds_ctx_am_doc_image_Destin.SetItem(ll_Cycle_02,"doc_id",ll_doc_id_new)
		lds_ctx_am_doc_image_Destin.SetItem(ll_Cycle_02,"modify_date",Today())
		lds_ctx_am_doc_image_Destin.SetItem(ll_Cycle_02,"revision",ld_RevControl_Destin ) //Added By Ken.Guo 03/19/2014
		lds_ctx_am_doc_image_Destin.SetItemStatus(ll_Cycle_02,0,Primary!,NewModified!)
		
		ll_Rtn = lds_ctx_am_doc_image_Destin.Update()
		if ll_Rtn = 1 then
			COMMIT USING SQLCA;
		else
			ROLLBACK USING SQLCA;
			CONTINUE
		end if
		
		UPDATE ctx_am_doc_image
			SET image_file = (SELECT image_file FROM ctx_am_doc_image WHERE doc_id = :ll_doc_id_old AND revision = :ld_Revision)
		 WHERE doc_id = :ll_doc_id_new AND revision = :ld_RevControl_Destin;
		 
		UPDATE ctx_am_document
		   SET Revision = :ld_RevControl_Destin,
				 Revision_control = :ls_RevControl,
				 checkout_by = null,
				 checkout_date = null
		 WHERE doc_id = :ll_doc_id_new;
		 
		COMMIT USING SQLCA;
		
		//Added By Ken.Guo 03/19/2014. Add audit data.
		Insert Into ctx_am_doc_audit(audit_id, doc_id, revision,doc_ext,action,action_by,action_date) 
		Values(10000,:ll_doc_id_new,:ld_RevControl_Destin,:ls_doc_ext,'New - Copy', :gs_user_id, getdate());
		
		lds_ctx_am_document_clause_Source.Retrieve(ll_doc_id_old,ld_Revision)
		lds_ctx_am_document_clause_Destin.Reset()
		
		ll_RowCnt_03 = lds_ctx_am_document_clause_Source.RowCount()
		lds_ctx_am_document_clause_Source.RowsCopy(1,ll_RowCnt_03,Primary!,lds_ctx_am_document_clause_Destin,1,Primary!)
		for ll_Cycle_03 = 1 to ll_RowCnt_03
			lds_ctx_am_document_clause_Destin.SetItem(ll_Cycle_03,"doc_id",ll_doc_id_new)
			lds_ctx_am_document_clause_Destin.SetItem(ll_Cycle_03,"revision",ld_RevControl_Destin) //Added By Ken.Guo 03/19/2014
			lds_ctx_am_document_clause_Destin.SetItemStatus(ll_Cycle_03,0,Primary!,NewModified!)
		next
		ll_Rtn = lds_ctx_am_document_clause_Destin.Update()
		if ll_Rtn = 1 then
			COMMIT USING SQLCA;
		else
			ROLLBACK USING SQLCA;
			CONTINUE
		end if
	next
next


//Added By Mark Lee 06/11/2015
if isvalid(lds_ctx_am_document_Source) then destroy lds_ctx_am_document_Source
if isvalid(lds_ctx_am_doc_image_Source) then destroy lds_ctx_am_doc_image_Source
if isvalid(lds_ctx_am_document_clause_Source) then destroy lds_ctx_am_document_clause_Source
if isvalid(lds_ctx_am_document_Destin) then destroy lds_ctx_am_document_Destin
if isvalid(lds_ctx_am_doc_image_Destin) then destroy lds_ctx_am_doc_image_Destin
if isvalid(lds_ctx_am_document_clause_Destin) then destroy lds_ctx_am_document_clause_Destin

Return 1
end function

public function integer of_update_ctx_flag (long al_ctx_id, integer ai_flag);//ai_flag 	0: Contracts		1: Template
update ctx_basic_info set is_template = :ai_flag where ctx_id = :al_ctx_id;
Return 1
end function

public function long of_copy_ctx_data (str_copy_ctx astr_copy_ctx);//Modified By Ken.Guo 2009-08-24 Copy from w_copy_contract cb_ok.clicked.
//////////////////////////////////////////////////////////////////////
// $<function>n_cst_copy_ctx::of_copy_ctx_data()
// $<arguments>
//		value	str_copy_ctx	astr_copy_ctx		
// $<returns> long  new ctx id
// $<description>
// $<description>
//////////////////////////////////////////////////////////////////////
// $<add> 2009-08-24 by Ken.Guo
//////////////////////////////////////////////////////////////////////


long ll_ctx_id,ll_record_id,ll_element_id,ll_parent_comp_id,ll_loc_id,ll_org_id,ll_fee_sched_id,ll_fee_sched_id1
long ll_fee_sched_location_id,ll_fee_sched_location_id1,ll_fee_sched_data_id,ll_loc_id1
long ll_row,i,j,k,ll_cnt
boolean lb_copy
n_cst_workflow_triggers lnv_workflow
str_action_item lstr_action
long ll_ori_id[],ll_new_id[]
Long 		ll_getrow					//Added By Mark Lee 11/20/2012
string 	ls_company_name,ls_colname 
long 		ll_get_ctx_id, ll_app_facility, ll_screen_id
String		ls_custom_fields, ls_sql		//Added by Harry 20170517
			

If astr_copy_ctx.si_is_template = 1 Then
	openwithparm( w_appeon_gifofwait, "Saving the selected contract as the template..." )					
Else
	//Added By Ken.Guo 09/26/2012. Support Add sub contracts for US banK Customer.
	Choose Case astr_copy_ctx.as_copy_sub_ctx
		Case 'Create Credit Sub Contract'
			openwithparm( w_appeon_gifofwait, "Creating Credit Sub Contract..." )
		Case 'Create Contract Sub Contract'
			openwithparm( w_appeon_gifofwait, "Creating Contract Sub Contract..." )
		Case Else
			openwithparm( w_appeon_gifofwait, "Copying the selected contract/template..." )
	End Choose
	
End If
timer(0,w_appeon_gifofwait)
SetPointer(HourGlass!)
datastore lds_detail
datastore lds_ctx_basic_info
datastore lds_company_contacts
datastore lds_ctx_contract_contacts
datastore lds_products
datastore lds_ctx_products
datastore lds_requirements
datastore lds_ctx_req_profile_hdr
datastore lds_profile_detail
datastore lds_ctx_elements
datastore lds_other_contacts
datastore lds_parent_organization
datastore lds_ctx_loc
datastore lds_group_locations
datastore lds_selected_facility
datastore lds_ctx_location_pracs
datastore lds_specialties
datastore lds_ctx_location_specialty
datastore lds_organization_list
datastore lds_ctx_orgs_contact
datastore lds_ctx_org_contact
datastore lds_fee_schedules
datastore lds_ctx_fee_sched_hdr
datastore lds_providers
datastore lds_ctx_fee_sched_pracs
datastore lds_fee_schedule_locations
datastore lds_ctx_fee_sched_locations
datastore lds_fees
datastore lds_ctx_fee_sched_data
datastore lds_fee_schedules2
datastore lds_ctx_fee_sched_nm
datastore lds_action_items
datastore lds_ctx_action_item
datastore lds_ctx_group_access

//Added by Harry 20170620 for Task 728
Long ll_view
String ls_col_name
datastore lds_dync_detail  
datastore lds_dync_1
datastore lds_dync_2
datastore lds_dync_3
 
lds_dync_detail = Create datastore
lds_dync_1 = Create datastore
lds_dync_2 = Create datastore
lds_dync_3 = Create datastore
//--End Added-----------------------------


lds_detail = Create datastore
lds_detail.dataobject = 'd_contract_det_master'
lds_detail.settransobject(sqlca)

lds_ctx_basic_info = Create datastore
lds_ctx_basic_info.dataobject = 'd_ctx_basic_info'
lds_ctx_basic_info.settransobject(sqlca)

lds_company_contacts = Create datastore
lds_company_contacts.dataobject = 'd_contract_det_contact_external'
lds_company_contacts.settransobject(sqlca)

lds_ctx_contract_contacts = Create datastore
lds_ctx_contract_contacts.dataobject = 'd_ctx_contract_contacts'
lds_ctx_contract_contacts.settransobject(sqlca)

lds_products = Create datastore
lds_products.dataobject = 'd_ctx_products'
lds_products.settransobject(sqlca)

lds_ctx_products = Create datastore
lds_ctx_products.dataobject = 'd_ctx_products_copy'
lds_ctx_products.settransobject(sqlca)

/*
lds_requirements = Create datastore
lds_requirements.dataobject = 'd_profile_header'
lds_requirements.settransobject(sqlca)

lds_ctx_req_profile_hdr = Create datastore
lds_ctx_req_profile_hdr.dataobject = 'd_ctx_req_profile_hdr_copy'
lds_ctx_req_profile_hdr.settransobject(sqlca)

lds_profile_detail = Create datastore
lds_profile_detail.dataobject = 'd_contract_profile_req_existing'
lds_profile_detail.settransobject(sqlca)

lds_ctx_elements = Create datastore
lds_ctx_elements.dataobject = 'd_ctx_elements_copy'
lds_ctx_elements.settransobject(sqlca)
*/

lds_other_contacts = Create datastore
lds_other_contacts.dataobject = 'd_contract_det_contact_contact_copy'
lds_other_contacts.settransobject(sqlca)

lds_parent_organization = Create datastore
lds_parent_organization.dataobject = 'd_contract_multi_group_browse'
lds_parent_organization.settransobject(sqlca)

lds_ctx_loc = Create datastore
lds_ctx_loc.dataobject = 'd_ctx_loc_copy'
lds_ctx_loc.settransobject(sqlca)

lds_group_locations = Create datastore
lds_group_locations.dataobject = 'd_contract_group_linked_locations_copy'
lds_group_locations.settransobject(sqlca)

lds_selected_facility = Create datastore
lds_selected_facility.dataobject = 'd_contract_group_practitioners_existing1'
lds_selected_facility.settransobject(sqlca)

lds_ctx_location_pracs = Create datastore
lds_ctx_location_pracs.dataobject = 'd_ctx_location_pracs_copy'
lds_ctx_location_pracs.settransobject(sqlca)

lds_specialties = Create datastore
lds_specialties.dataobject = 'd_cntx_location_spec_copy'
lds_specialties.settransobject(sqlca)

lds_ctx_location_specialty = Create datastore
lds_ctx_location_specialty.dataobject = 'd_ctx_location_specialty_copy'
lds_ctx_location_specialty.settransobject(sqlca)

lds_organization_list = Create datastore
lds_organization_list.dataobject = 'd_org_search2_copy'
lds_organization_list.settransobject(sqlca)

lds_ctx_orgs_contact = Create datastore
lds_ctx_orgs_contact.dataobject = 'd_ctx_orgs_contact_copy'
lds_ctx_orgs_contact.settransobject(sqlca)

lds_ctx_org_contact = Create datastore
lds_ctx_org_contact.dataobject = 'd_ctx_org_contact_copy'
lds_ctx_org_contact.settransobject(sqlca)

lds_fee_schedules = Create datastore
lds_fee_schedules.dataobject = 'd_ctx_free_sched_hdr_copy'
lds_fee_schedules.settransobject(sqlca)

lds_ctx_fee_sched_hdr = Create datastore
lds_ctx_fee_sched_hdr.dataobject = 'd_ctx_fee_sched_hdr_copy'
lds_ctx_fee_sched_hdr.settransobject(sqlca)

lds_providers = Create datastore
lds_providers.dataobject = 'd_ctx_schedule_fee_pracs_copy'
lds_providers.settransobject(sqlca)

lds_ctx_fee_sched_pracs = Create datastore
lds_ctx_fee_sched_pracs.dataobject = 'd_ctx_fee_sched_pracs_copy'
lds_ctx_fee_sched_pracs.settransobject(sqlca)

lds_fee_schedule_locations = Create datastore 
lds_fee_schedule_locations.dataobject = 'd_ctx_schedule_fee_locations_copy'
lds_fee_schedule_locations.settransobject(sqlca)

lds_ctx_fee_sched_locations = Create datastore
lds_ctx_fee_sched_locations.dataobject = 'd_ctx_fee_sched_locations_copy'
lds_ctx_fee_sched_locations.settransobject(sqlca)

lds_fees = Create datastore
lds_fees.dataobject = 'd_ctx_schedule_fee_detail_copy1'
lds_fees.settransobject(sqlca)

lds_ctx_fee_sched_data = Create datastore
lds_ctx_fee_sched_data.dataobject = 'd_ctx_schedule_fee_detail_copy'
lds_ctx_fee_sched_data.settransobject(sqlca)

lds_fee_schedules2 = Create datastore
lds_fee_schedules2.dataobject = 'd_contract_fee_sched_nm'
lds_fee_schedules2.settransobject(sqlca)

lds_ctx_fee_sched_nm = Create datastore
lds_ctx_fee_sched_nm.dataobject = 'd_ctx_fee_sched_nm_copy'
lds_ctx_fee_sched_nm.settransobject(sqlca)

lds_action_items = Create datastore
lds_action_items.dataobject = 'd_cntx_action_items'
lds_action_items.settransobject(sqlca)

lds_ctx_action_item = create datastore
lds_ctx_action_item.dataobject = 'd_ctx_action_items_copy'
lds_ctx_action_item.settransobject(sqlca)

//Added By Ken.Guo 2009-05-20.
lds_ctx_group_access = Create datastore
lds_ctx_group_access.dataobject = 'd_contract_det_group_access'
lds_ctx_group_access.settransobject(sqlca)

//Added by Harry  20170620 for Task 728
SELECT ic_n INTO :ll_view FROM code_lookup, ctx_basic_info WHERE code_lookup.lookup_code = ctx_basic_info.category AND  ctx_basic_info.ctx_id = :astr_copy_ctx.sl_ctx_id;
il_view = ll_view
//messagebox ("syntax", lds_dync_detail.describe("datawindow.syntax") )

lds_detail.retrieve(astr_copy_ctx.sl_ctx_id )

If lds_detail.rowcount() < 1 Then 
	If isvalid(w_appeon_gifofwait) Then close(w_appeon_gifofwait)
	Return -1
End If

ll_row = lds_ctx_basic_info.insertrow(0)

If astr_copy_ctx.si_is_template = 1 Then
	ll_ctx_id = gnv_app.of_get_id('ctx_template_id')
Else
	ll_ctx_id = gnv_app.of_get_id('CTX_ID')
End If


ll_record_id = gnv_app.of_get_id('RECORD_ID')
lds_ctx_basic_info.setitem(ll_row,'ctx_id',ll_ctx_id)
lds_ctx_basic_info.setitem(ll_row,'record_id',ll_record_id)
//add by Jack 07.06.2007
lds_ctx_basic_info.setitem(ll_row,'master_contract_id',0)
lds_ctx_basic_info.setitem(ll_row,'master_contract_name','')  
//Added By Mark Lee 11/28/2013
if isnull(astr_copy_ctx.as_come_from) or trim(astr_copy_ctx.as_come_from) = '' then 
	lds_ctx_basic_info.setitem(ll_row,'come_from'," copy from ctx:"+string(astr_copy_ctx.sl_ctx_id) )  
else
	lds_ctx_basic_info.setitem(ll_row,'come_from',astr_copy_ctx.as_come_from )  
end if

w_appeon_gifofwait.of_setposition(20)

lb_copy = False
//If astr_copy_ctx.sb_contract_detail = 1 Then
If astr_copy_ctx.sb_contract_detail = 1 and of_get_screen_exist(ll_view, 3) Then //Modified by harry 20170622
	f_create_contract_ds (ll_view, 3, lds_dync_detail)  //Added by Harry 20170621 Create Contract Detail from current screen
	//Contract Detail
	//Added By Mark Lee 06/10/2015 add the adjust 
	if of_check_unselect_fields(0,'ctx_basic_info','status') = true then of_set_value(lds_dync_detail, 'status', lds_ctx_basic_info, ll_row, lds_detail, 1, 'N')	//Modified by harry 20170621 lds_ctx_basic_info.setitem(ll_row,'status',lds_detail.getitemnumber(1,'status'))

	if of_check_unselect_fields(0,'ctx_basic_info','category') = true then of_set_value(lds_dync_detail, 'category', lds_ctx_basic_info, ll_row, lds_detail, 1, 'N')	//Modified by harry 20170621 lds_ctx_basic_info.setitem(ll_row,'category',lds_detail.getitemnumber(1,'category'))
	If astr_copy_ctx.si_clear_company = 1 and astr_copy_ctx.si_is_template = 0 Then
		//Use defaule value: null
	Else
		if of_check_unselect_fields(0,'ctx_basic_info','app_facility') = true then of_set_value(lds_dync_detail, 'app_facility', lds_ctx_basic_info, ll_row, lds_detail, 1, 'N')	//Modified by harry 20170621  lds_ctx_basic_info.setitem(ll_row,'app_facility',lds_detail.getitemnumber(1,'app_facility'))		
	End IF
	if of_check_unselect_fields(0,'ctx_basic_info','contract_type') = true then of_set_value(lds_dync_detail, 'contract_type', lds_ctx_basic_info, ll_row, lds_detail, 1, 'N')	//Modified by harry 20170621  lds_ctx_basic_info.setitem(ll_row,'contract_type',lds_detail.getitemnumber(1,'contract_type'))
	if of_check_unselect_fields(0,'ctx_basic_info','dvision') = true then of_set_value(lds_dync_detail, 'dvision', lds_ctx_basic_info, ll_row, lds_detail, 1, 'N')	//Modified by harry 20170621  lds_ctx_basic_info.setitem(ll_row,'dvision',lds_detail.getitemnumber(1,'dvision'))
	if of_check_unselect_fields(0,'ctx_basic_info','file_location') = true then of_set_value(lds_dync_detail, 'file_location', lds_ctx_basic_info, ll_row, lds_detail, 1, 'C')	//Modified by harry 20170621   lds_ctx_basic_info.setitem(ll_row,'file_location',lds_detail.getitemstring(1,'file_location'))
	if of_check_unselect_fields(0,'ctx_basic_info','master_contract_id') = true then of_set_value(lds_dync_detail, 'master_contract_id', lds_ctx_basic_info, ll_row, lds_detail, 1, 'N')	//Modified by harry 20170621   lds_ctx_basic_info.setitem(ll_row,'master_contract_id',lds_detail.getitemnumber(1,'master_contract_id'))
	if of_check_unselect_fields(0,'ctx_basic_info','master_contract_name') = true then of_set_value(lds_dync_detail, 'master_contract_name', lds_ctx_basic_info, ll_row, lds_detail, 1, 'C')	//Modified by harry 20170621    lds_ctx_basic_info.setitem(ll_row,'master_contract_name',lds_detail.getitemstring(1,'master_contract_name'))	
	if of_check_unselect_fields(0,'ctx_basic_info','contract_department') = true then of_set_value(lds_dync_detail, 'contract_department', lds_ctx_basic_info, ll_row, lds_detail, 1, 'N')	//Modified by harry 20170621    lds_ctx_basic_info.setitem(ll_row,'contract_department',lds_detail.getitemnumber(1,'contract_department'))			//Added By Mark Lee 10/27/2015
	//Added by Harry  20170620 for Task 728
	If astr_copy_ctx.sb_custom_data <> 1 Then
		f_create_contract_ds (ll_view, 9, lds_dync_1)  //Added by Harry 20170628 Create Contract Custom Data from current screen
		//custom_1 to custom_22
		For i = 1 to 22
			ls_col_name = 'custom_' + string(i)
			of_set_value(lds_dync_detail, ls_col_name, lds_ctx_basic_info, ll_row, lds_detail, 1, 'C', lds_dync_1, 9, ll_ctx_id)  //Modified by harry 20170628
		Next 
		//custom_date1 to custom_date17
		For i = 1 to 17
			ls_col_name = 'custom_date' + string(i)
			of_set_value(lds_dync_detail, ls_col_name, lds_ctx_basic_info, ll_row, lds_detail, 1, 'DT', lds_dync_1, 9, ll_ctx_id)  //Modified by harry 20170628
		Next
		//custom_n1 to custom_n27
		For i = 1 to 27
			ls_col_name = 'custom_n' + string(i)
			of_set_value(lds_dync_detail, ls_col_name, lds_ctx_basic_info, ll_row, lds_detail, 1, 'DEC', lds_dync_1, 9, ll_ctx_id)  //Modified by harry 20170628
		Next
		//custom_notes_1 to custom_notes_5
		For i = 1 to 5
			ls_col_name = 'custom_notes_' + string(i)
			of_set_value(lds_dync_detail, ls_col_name, lds_ctx_basic_info, ll_row, lds_detail, 1, 'C', lds_dync_1, 9, ll_ctx_id)  //Modified by harry 20170628
		Next
		//custom_percent_1 to custom_percent_10
		For i = 1 to 10
			ls_col_name = 'custom_percent_' + string(i)
			of_set_value(lds_dync_detail, ls_col_name, lds_ctx_basic_info, ll_row, lds_detail, 1, 'DEC', lds_dync_1, 9, ll_ctx_id)  //Modified by harry 20170628
		Next
		//custom_status1 to custom_status2
		For i = 1 to 2
			ls_col_name = 'custom_status' + string(i)
			of_set_value(lds_dync_detail, ls_col_name, lds_ctx_basic_info, ll_row, lds_detail, 1, 'DEC', lds_dync_1, 9, ll_ctx_id)  //Modified by harry 20170628
		Next
	End If
	If astr_copy_ctx.sb_contract_dates <> 1 Then
		f_create_contract_ds (ll_view, 5, lds_dync_2)  //Added by Harry 20170628 Create Contract Date from current screen
		of_set_value(lds_dync_detail, 'effective_date', lds_ctx_basic_info, ll_row, lds_detail, 1, 'DT', lds_dync_2, 5, ll_ctx_id)  //Modified by harry 20170628
		of_set_value(lds_dync_detail, 'review_date', lds_ctx_basic_info, ll_row, lds_detail, 1, 'DT', lds_dync_2, 5, ll_ctx_id)  //Modified by harry 20170628
		of_set_value(lds_dync_detail, 'term_reason', lds_ctx_basic_info, ll_row, lds_detail, 1, 'N', lds_dync_2, 5, ll_ctx_id)  //Modified by harry 20170628
		of_set_value(lds_dync_detail, 'version_number', lds_ctx_basic_info, ll_row, lds_detail, 1, 'C', lds_dync_2, 5, ll_ctx_id)  //Modified by harry 20170628
		of_set_value(lds_dync_detail, 'version_date', lds_ctx_basic_info, ll_row, lds_detail, 1, 'DT', lds_dync_2, 5, ll_ctx_id)  //Modified by harry 20170628
		of_set_value(lds_dync_detail, 'expriation_date', lds_ctx_basic_info, ll_row, lds_detail, 1, 'DT', lds_dync_2, 5, ll_ctx_id)  //Modified by harry 20170628
		of_set_value(lds_dync_detail, 'review_by', lds_ctx_basic_info, ll_row, lds_detail, 1, 'C', lds_dync_2, 5, ll_ctx_id)  //Modified by harry 20170628
		of_set_value(lds_dync_detail, 'last_revis_date', lds_ctx_basic_info, ll_row, lds_detail, 1, 'DT', lds_dync_2, 5, ll_ctx_id)  //Modified by harry 20170628
		of_set_value(lds_dync_detail, 'term_date', lds_ctx_basic_info, ll_row, lds_detail, 1, 'DT', lds_dync_2, 5, ll_ctx_id)  //Modified by harry 20170628
		of_set_value(lds_dync_detail, 'other_date_1', lds_ctx_basic_info, ll_row, lds_detail, 1, 'DT', lds_dync_2, 5, ll_ctx_id)  //Modified by harry 20170628
		of_set_value(lds_dync_detail, 'other_date_1', lds_ctx_basic_info, ll_row, lds_detail, 1, 'DT', lds_dync_2, 5, ll_ctx_id)  //Modified by harry 20170628
	End If
	//--End Added------------
	
	lb_copy = True
End If

//Begin - Added By Mark Lee 11/16/2012
If not isnull(astr_copy_ctx.as_master_contract_name ) and trim(astr_copy_ctx.as_master_contract_name) <> '' Then 
	if of_check_unselect_fields(0,'ctx_basic_info','master_contract_id') = true then lds_ctx_basic_info.setitem(ll_row,'master_contract_id',astr_copy_ctx.sl_ctx_id)
	if of_check_unselect_fields(0,'ctx_basic_info','master_contract_name') = true then lds_ctx_basic_info.setitem(ll_row,'master_contract_name',astr_copy_ctx.as_master_contract_name)	
End If
//End - Added By Mark Lee 11/16/2012

//Begin - Added By Mark Lee 11/20/2012
If isvalid(gw_contract) Then 
	ll_getrow = gw_contract.tab_contract_details.tabpage_search.dw_search_det1.getselectedrow(0)
	If ll_getrow > 0 then 
		ll_get_ctx_id = gw_contract.tab_contract_details.tabpage_search.il_ctx_id
		ls_company_name = gw_contract.tab_contract_details.tabpage_search.dw_search_det1.describe("Evaluate( 'lookupdisplay(app_facility) ', "+string(ll_getrow)+" )")
		ll_app_facility 	= gw_contract.tab_contract_details.tabpage_search.dw_search_det1.GetItemNumber(ll_getrow,"app_facility")
		//Copy Company Name Data From Selected Master Contract   
		If astr_copy_ctx.ai_ib_create_child = 1 Then 
			lds_ctx_basic_info.setitem(ll_row,'master_contract_id',ll_get_ctx_id)
			lds_ctx_basic_info.setitem(ll_row,'master_contract_name',string(ll_get_ctx_id) +'-'+ls_company_name)	
		End If
		//Create as Child Contract Record 
		If astr_copy_ctx.ai_ib_copy_m_company = 1 Then 
			lds_ctx_basic_info.setitem(ll_row,'app_facility', ll_app_facility)
		End If
	End If
End If
//End - Added By Mark Lee 11/20/2012

//If astr_copy_ctx.sb_contract_dates = 1 Then
If astr_copy_ctx.sb_contract_dates = 1 and of_get_screen_exist(ll_view, 5) Then //Modified by harry 20170622
	f_create_contract_ds (ll_view, 5, lds_dync_detail)  //Added by Harry 20170621 Create Contract Date from current screen
	//Contract Dates
	if of_check_unselect_fields(0,'ctx_basic_info','effective_date') = true then of_set_value(lds_dync_detail, 'effective_date', lds_ctx_basic_info, ll_row, lds_detail, 1, 'DT')	//Modified by harry 20170621    lds_ctx_basic_info.setitem(ll_row,'effective_date',lds_detail.getitemdatetime(1,'effective_date'))
	if of_check_unselect_fields(0,'ctx_basic_info','review_date') = true then of_set_value(lds_dync_detail, 'review_date', lds_ctx_basic_info, ll_row, lds_detail, 1, 'DT')	//Modified by harry 20170621    lds_ctx_basic_info.setitem(ll_row,'review_date',lds_detail.getitemdatetime(1,'review_date'))
	if of_check_unselect_fields(0,'ctx_basic_info','term_reason') = true then of_set_value(lds_dync_detail, 'term_reason', lds_ctx_basic_info, ll_row, lds_detail, 1, 'N')	//Modified by harry 20170621    lds_ctx_basic_info.setitem(ll_row,'term_reason',lds_detail.getitemnumber(1,'term_reason'))
	if of_check_unselect_fields(0,'ctx_basic_info','version_number') = true then of_set_value(lds_dync_detail, 'version_number', lds_ctx_basic_info, ll_row, lds_detail, 1, 'C')	//Modified by harry 20170621    lds_ctx_basic_info.setitem(ll_row,'version_number',lds_detail.getitemstring(1,'version_number'))
	if of_check_unselect_fields(0,'ctx_basic_info','version_date') = true then of_set_value(lds_dync_detail, 'version_date', lds_ctx_basic_info, ll_row, lds_detail, 1, 'DT')	//Modified by harry 20170621    lds_ctx_basic_info.setitem(ll_row,'version_date',lds_detail.getitemdatetime(1,'version_date'))
	if of_check_unselect_fields(0,'ctx_basic_info','expriation_date') = true then of_set_value(lds_dync_detail, 'expriation_date', lds_ctx_basic_info, ll_row, lds_detail, 1, 'DT')	//Modified by harry 20170621    lds_ctx_basic_info.setitem(ll_row,'expriation_date',lds_detail.getitemdatetime(1,'expriation_date'))
	if of_check_unselect_fields(0,'ctx_basic_info','review_by') = true then of_set_value(lds_dync_detail, 'review_by', lds_ctx_basic_info, ll_row, lds_detail, 1, 'C')	//Modified by harry 20170621    lds_ctx_basic_info.setitem(ll_row,'review_by',lds_detail.getitemstring(1,'review_by'))
	if of_check_unselect_fields(0,'ctx_basic_info','last_revis_date') = true then of_set_value(lds_dync_detail, 'last_revis_date', lds_ctx_basic_info, ll_row, lds_detail, 1, 'DT')	//Modified by harry 20170621    lds_ctx_basic_info.setitem(ll_row,'last_revis_date',lds_detail.getitemdatetime(1,'last_revis_date'))	
	if of_check_unselect_fields(0,'ctx_basic_info','term_date') = true then of_set_value(lds_dync_detail, 'term_date', lds_ctx_basic_info, ll_row, lds_detail, 1, 'DT')	//Modified by harry 20170621    lds_ctx_basic_info.setitem(ll_row,'term_date',lds_detail.getitemdatetime(1,'term_date'))	
	if of_check_unselect_fields(0,'ctx_basic_info','other_date_1') = true then of_set_value(lds_dync_detail, 'other_date_1', lds_ctx_basic_info, ll_row, lds_detail, 1, 'DT')	//Modified by harry 20170621    lds_ctx_basic_info.setitem(ll_row,'other_date_1',lds_detail.getitemdatetime(1,'other_date_1'))	
	if of_check_unselect_fields(0,'ctx_basic_info','other_date_2') = true then of_set_value(lds_dync_detail, 'other_date_2', lds_ctx_basic_info, ll_row, lds_detail, 1, 'DT')	//Modified by harry 20170621    lds_ctx_basic_info.setitem(ll_row,'other_date_2',lds_detail.getitemdatetime(1,'other_date_2'))					//Added By Mark Lee 10/27/2015
	
	lb_copy = True
End If
//If astr_copy_ctx.sb_custom_data = 1 Then
If astr_copy_ctx.sb_custom_data = 1 and of_get_screen_exist(ll_view, 9) Then //Modified by harry 20170622
	f_create_contract_ds (ll_view, 9, lds_dync_detail)  //Added by Harry 20170621 Create Contract Custom Data from current screen
	ls_custom_fields = "" //Added by Harry 20170517
	//Custom Data
	if of_check_unselect_fields(0,'ctx_basic_info','custom_1') = true then 
		//lds_ctx_basic_info.setitem(ll_row,'custom_1',lds_detail.getitemstring(1,'custom_1'))
		of_set_value(lds_dync_detail, 'custom_1', lds_ctx_basic_info, ll_row, lds_detail, 1, 'C', 9, ll_ctx_id)	//Modified by harry 20170621  
		ls_custom_fields = ls_custom_fields + " 'custom_1',"  //Added by Harry 20170517
	end if
	if of_check_unselect_fields(0,'ctx_basic_info','custom_2') = true then 
		//lds_ctx_basic_info.setitem(ll_row,'custom_2',lds_detail.getitemstring(1,'custom_2'))
		of_set_value(lds_dync_detail, 'custom_2', lds_ctx_basic_info, ll_row, lds_detail, 1, 'C', 9, ll_ctx_id)	//Modified by harry 20170621  
		ls_custom_fields = ls_custom_fields + " 'custom_2',"  //Added by Harry 20170517
	end if
	if of_check_unselect_fields(0,'ctx_basic_info','custom_3') = true then 
		//lds_ctx_basic_info.setitem(ll_row,'custom_3',lds_detail.getitemstring(1,'custom_3'))
		of_set_value(lds_dync_detail, 'custom_3', lds_ctx_basic_info, ll_row, lds_detail, 1, 'C', 9, ll_ctx_id)	//Modified by harry 20170621  
		ls_custom_fields = ls_custom_fields + " 'custom_3',"  //Added by Harry 20170517
	end if
	if of_check_unselect_fields(0,'ctx_basic_info','custom_4') = true then 
		//lds_ctx_basic_info.setitem(ll_row,'custom_4',lds_detail.getitemstring(1,'custom_4'))
		of_set_value(lds_dync_detail, 'custom_4', lds_ctx_basic_info, ll_row, lds_detail, 1, 'C', 9, ll_ctx_id)	//Modified by harry 20170621  
		ls_custom_fields = ls_custom_fields + " 'custom_4',"  //Added by Harry 20170517
	end if
	if of_check_unselect_fields(0,'ctx_basic_info','custom_5') = true then 
		//lds_ctx_basic_info.setitem(ll_row,'custom_5',lds_detail.getitemstring(1,'custom_5'))
		of_set_value(lds_dync_detail, 'custom_5', lds_ctx_basic_info, ll_row, lds_detail, 1, 'C', 9, ll_ctx_id)	//Modified by harry 20170621  
		ls_custom_fields = ls_custom_fields + " 'custom_5',"  //Added by Harry 20170517
	end if
	if of_check_unselect_fields(0,'ctx_basic_info','custom_6') = true then 
		//lds_ctx_basic_info.setitem(ll_row,'custom_6',lds_detail.getitemstring(1,'custom_6'))
		of_set_value(lds_dync_detail, 'custom_6', lds_ctx_basic_info, ll_row, lds_detail, 1, 'C', 9, ll_ctx_id)	//Modified by harry 20170621  
		ls_custom_fields = ls_custom_fields + " 'custom_6',"  //Added by Harry 20170517
	end if
	if of_check_unselect_fields(0,'ctx_basic_info','custom_7') = true then 
		//lds_ctx_basic_info.setitem(ll_row,'custom_7',lds_detail.getitemstring(1,'custom_7'))
		of_set_value(lds_dync_detail, 'custom_7', lds_ctx_basic_info, ll_row, lds_detail, 1, 'C', 9, ll_ctx_id)	//Modified by harry 20170621  
		ls_custom_fields = ls_custom_fields + " 'custom_7',"  //Added by Harry 20170517
	end if
	if of_check_unselect_fields(0,'ctx_basic_info','custom_8') = true then 
		//lds_ctx_basic_info.setitem(ll_row,'custom_8',lds_detail.getitemstring(1,'custom_8'))
		of_set_value(lds_dync_detail, 'custom_8', lds_ctx_basic_info, ll_row, lds_detail, 1, 'C', 9, ll_ctx_id)	//Modified by harry 20170621  
		ls_custom_fields = ls_custom_fields + " 'custom_8',"  //Added by Harry 20170517
	end if
	if of_check_unselect_fields(0,'ctx_basic_info','custom_9') = true then 
		//lds_ctx_basic_info.setitem(ll_row,'custom_9',lds_detail.getitemstring(1,'custom_9'))
		of_set_value(lds_dync_detail, 'custom_9', lds_ctx_basic_info, ll_row, lds_detail, 1, 'C', 9, ll_ctx_id)	//Modified by harry 20170621  
		ls_custom_fields = ls_custom_fields + " 'custom_9',"  //Added by Harry 20170517
	end if
	if of_check_unselect_fields(0,'ctx_basic_info','custom_10') = true then 
		//lds_ctx_basic_info.setitem(ll_row,'custom_10',lds_detail.getitemstring(1,'custom_10'))
		of_set_value(lds_dync_detail, 'custom_10', lds_ctx_basic_info, ll_row, lds_detail, 1, 'C', 9, ll_ctx_id)	//Modified by harry 20170621  
		ls_custom_fields = ls_custom_fields + " 'custom_10',"  //Added by Harry 20170517
	end if
	if of_check_unselect_fields(0,'ctx_basic_info','custom_11') = true then 
		//lds_ctx_basic_info.setitem(ll_row,'custom_11',lds_detail.getitemstring(1,'custom_11'))
		of_set_value(lds_dync_detail, 'custom_11', lds_ctx_basic_info, ll_row, lds_detail, 1, 'C', 9, ll_ctx_id)	//Modified by harry 20170621  
		ls_custom_fields = ls_custom_fields + " 'custom_11',"  //Added by Harry 20170517
	end if
	if of_check_unselect_fields(0,'ctx_basic_info','custom_12') = true then 
		//lds_ctx_basic_info.setitem(ll_row,'custom_12',lds_detail.getitemstring(1,'custom_12'))
		of_set_value(lds_dync_detail, 'custom_12', lds_ctx_basic_info, ll_row, lds_detail, 1, 'C', 9, ll_ctx_id)	//Modified by harry 20170621  
		ls_custom_fields = ls_custom_fields + " 'custom_12',"  //Added by Harry 20170517
	end if
	if of_check_unselect_fields(0,'ctx_basic_info','custom_13') = true then 
		//lds_ctx_basic_info.setitem(ll_row,'custom_13',lds_detail.getitemstring(1,'custom_13'))
		of_set_value(lds_dync_detail, 'custom_13', lds_ctx_basic_info, ll_row, lds_detail, 1, 'C', 9, ll_ctx_id)	//Modified by harry 20170621  
		ls_custom_fields = ls_custom_fields + " 'custom_13',"  //Added by Harry 20170517
	end if
	if of_check_unselect_fields(0,'ctx_basic_info','custom_14') = true then 
		//lds_ctx_basic_info.setitem(ll_row,'custom_14',lds_detail.getitemstring(1,'custom_14'))
		of_set_value(lds_dync_detail, 'custom_14', lds_ctx_basic_info, ll_row, lds_detail, 1, 'C', 9, ll_ctx_id)	//Modified by harry 20170621  
		ls_custom_fields = ls_custom_fields + " 'custom_14',"  //Added by Harry 20170517
	end if
	if of_check_unselect_fields(0,'ctx_basic_info','custom_15') = true then 
		//lds_ctx_basic_info.setitem(ll_row,'custom_15',lds_detail.getitemstring(1,'custom_15'))
		of_set_value(lds_dync_detail, 'custom_15', lds_ctx_basic_info, ll_row, lds_detail, 1, 'C', 9, ll_ctx_id)	//Modified by harry 20170621  
		ls_custom_fields = ls_custom_fields + " 'custom_15',"  //Added by Harry 20170517
	end if
	if of_check_unselect_fields(0,'ctx_basic_info','custom_16') = true then 
		//lds_ctx_basic_info.setitem(ll_row,'custom_16',lds_detail.getitemstring(1,'custom_16'))
		of_set_value(lds_dync_detail, 'custom_16', lds_ctx_basic_info, ll_row, lds_detail, 1, 'C', 9, ll_ctx_id)	//Modified by harry 20170621  
		ls_custom_fields = ls_custom_fields + " 'custom_16',"  //Added by Harry 20170517
	end if
	if of_check_unselect_fields(0,'ctx_basic_info','custom_17') = true then 
		//lds_ctx_basic_info.setitem(ll_row,'custom_17',lds_detail.getitemstring(1,'custom_17'))
		of_set_value(lds_dync_detail, 'custom_17', lds_ctx_basic_info, ll_row, lds_detail, 1, 'C', 9, ll_ctx_id)	//Modified by harry 20170621  
		ls_custom_fields = ls_custom_fields + " 'custom_17',"  //Added by Harry 20170517
	end if
	if of_check_unselect_fields(0,'ctx_basic_info','custom_18') = true then 
		//lds_ctx_basic_info.setitem(ll_row,'custom_18',lds_detail.getitemstring(1,'custom_18'))
		of_set_value(lds_dync_detail, 'custom_18', lds_ctx_basic_info, ll_row, lds_detail, 1, 'C', 9, ll_ctx_id)	//Modified by harry 20170621  
		ls_custom_fields = ls_custom_fields + " 'custom_18',"  //Added by Harry 20170517
	end if
	if of_check_unselect_fields(0,'ctx_basic_info','custom_19') = true then 
		//lds_ctx_basic_info.setitem(ll_row,'custom_19',lds_detail.getitemstring(1,'custom_19'))
		of_set_value(lds_dync_detail, 'custom_19', lds_ctx_basic_info, ll_row, lds_detail, 1, 'C', 9, ll_ctx_id)	//Modified by harry 20170621  
		ls_custom_fields = ls_custom_fields + " 'custom_19',"  //Added by Harry 20170517
	end if
	if of_check_unselect_fields(0,'ctx_basic_info','custom_20') = true then 
		//lds_ctx_basic_info.setitem(ll_row,'custom_20',lds_detail.getitemstring(1,'custom_20'))
		of_set_value(lds_dync_detail, 'custom_20', lds_ctx_basic_info, ll_row, lds_detail, 1, 'C', 9, ll_ctx_id)	//Modified by harry 20170621  
		ls_custom_fields = ls_custom_fields + " 'custom_20',"  //Added by Harry 20170517
	end if
	if of_check_unselect_fields(0,'ctx_basic_info','custom_date1') = true then of_set_value(lds_dync_detail, 'custom_date1', lds_ctx_basic_info, ll_row, lds_detail, 1, 'DT')	//Modified by harry 20170621  lds_ctx_basic_info.setitem(ll_row,'custom_date1',lds_detail.getitemdatetime(1,'custom_date1'))
	if of_check_unselect_fields(0,'ctx_basic_info','custom_date2') = true then of_set_value(lds_dync_detail, 'custom_date2', lds_ctx_basic_info, ll_row, lds_detail, 1, 'DT')	//Modified by harry 20170621   lds_ctx_basic_info.setitem(ll_row,'custom_date2',lds_detail.getitemdatetime(1,'custom_date2'))
	if of_check_unselect_fields(0,'ctx_basic_info','custom_date3') = true then of_set_value(lds_dync_detail, 'custom_date3', lds_ctx_basic_info, ll_row, lds_detail, 1, 'DT')	//Modified by harry 20170621   lds_ctx_basic_info.setitem(ll_row,'custom_date3',lds_detail.getitemdatetime(1,'custom_date3'))
	if of_check_unselect_fields(0,'ctx_basic_info','custom_date4') = true then of_set_value(lds_dync_detail, 'custom_date4', lds_ctx_basic_info, ll_row, lds_detail, 1, 'DT')	//Modified by harry 20170621   lds_ctx_basic_info.setitem(ll_row,'custom_date4',lds_detail.getitemdatetime(1,'custom_date4'))
	if of_check_unselect_fields(0,'ctx_basic_info','custom_date5') = true then of_set_value(lds_dync_detail, 'custom_date5', lds_ctx_basic_info, ll_row, lds_detail, 1, 'DT')	//Modified by harry 20170621   lds_ctx_basic_info.setitem(ll_row,'custom_date5',lds_detail.getitemdatetime(1,'custom_date5'))
	if of_check_unselect_fields(0,'ctx_basic_info','custom_date6') = true then of_set_value(lds_dync_detail, 'custom_date6', lds_ctx_basic_info, ll_row, lds_detail, 1, 'DT')	//Modified by harry 20170621   lds_ctx_basic_info.setitem(ll_row,'custom_date6',lds_detail.getitemdatetime(1,'custom_date6'))
	if of_check_unselect_fields(0,'ctx_basic_info','custom_date7') = true then of_set_value(lds_dync_detail, 'custom_date7', lds_ctx_basic_info, ll_row, lds_detail, 1, 'DT')	//Modified by harry 20170621   lds_ctx_basic_info.setitem(ll_row,'custom_date7',lds_detail.getitemdatetime(1,'custom_date7'))
	if of_check_unselect_fields(0,'ctx_basic_info','custom_date8') = true then of_set_value(lds_dync_detail, 'custom_date8', lds_ctx_basic_info, ll_row, lds_detail, 1, 'DT')	//Modified by harry 20170621   lds_ctx_basic_info.setitem(ll_row,'custom_date8',lds_detail.getitemdatetime(1,'custom_date8'))
	if of_check_unselect_fields(0,'ctx_basic_info','custom_date9') = true then of_set_value(lds_dync_detail, 'custom_date9', lds_ctx_basic_info, ll_row, lds_detail, 1, 'DT')	//Modified by harry 20170621   lds_ctx_basic_info.setitem(ll_row,'custom_date9',lds_detail.getitemdatetime(1,'custom_date9'))
	if of_check_unselect_fields(0,'ctx_basic_info','custom_date10') = true then of_set_value(lds_dync_detail, 'custom_date10', lds_ctx_basic_info, ll_row, lds_detail, 1, 'DT')	//Modified by harry 20170621   lds_ctx_basic_info.setitem(ll_row,'custom_date10',lds_detail.getitemdatetime(1,'custom_date10'))	
	//Replace GetItemNumber to GetItemDecimal and Add custom_n11 - custom_n25 - jervis 08.09.2010
	if of_check_unselect_fields(0,'ctx_basic_info','custom_n1') = true then of_set_value(lds_dync_detail, 'custom_n1', lds_ctx_basic_info, ll_row, lds_detail, 1, 'DEC')	//Modified by harry 20170621   lds_ctx_basic_info.setitem(ll_row,'custom_n1',lds_detail.getitemdecimal(1,'custom_n1'))
	if of_check_unselect_fields(0,'ctx_basic_info','custom_n2') = true then of_set_value(lds_dync_detail, 'custom_n2', lds_ctx_basic_info, ll_row, lds_detail, 1, 'DEC')	//Modified by harry 20170621    lds_ctx_basic_info.setitem(ll_row,'custom_n2',lds_detail.getitemdecimal(1,'custom_n2'))
	if of_check_unselect_fields(0,'ctx_basic_info','custom_n3') = true then of_set_value(lds_dync_detail, 'custom_n3', lds_ctx_basic_info, ll_row, lds_detail, 1, 'DEC')	//Modified by harry 20170621    lds_ctx_basic_info.setitem(ll_row,'custom_n3',lds_detail.getitemdecimal(1,'custom_n3'))
	if of_check_unselect_fields(0,'ctx_basic_info','custom_n4') = true then of_set_value(lds_dync_detail, 'custom_n4', lds_ctx_basic_info, ll_row, lds_detail, 1, 'DEC')	//Modified by harry 20170621    lds_ctx_basic_info.setitem(ll_row,'custom_n4',lds_detail.getitemdecimal(1,'custom_n4'))
	if of_check_unselect_fields(0,'ctx_basic_info','custom_n5') = true then of_set_value(lds_dync_detail, 'custom_n5', lds_ctx_basic_info, ll_row, lds_detail, 1, 'DEC')	//Modified by harry 20170621    lds_ctx_basic_info.setitem(ll_row,'custom_n5',lds_detail.getitemdecimal(1,'custom_n5'))
	if of_check_unselect_fields(0,'ctx_basic_info','custom_n6') = true then of_set_value(lds_dync_detail, 'custom_n6', lds_ctx_basic_info, ll_row, lds_detail, 1, 'DEC')	//Modified by harry 20170621    lds_ctx_basic_info.setitem(ll_row,'custom_n6',lds_detail.getitemdecimal(1,'custom_n6'))
	if of_check_unselect_fields(0,'ctx_basic_info','custom_n7') = true then of_set_value(lds_dync_detail, 'custom_n7', lds_ctx_basic_info, ll_row, lds_detail, 1, 'DEC')	//Modified by harry 20170621    lds_ctx_basic_info.setitem(ll_row,'custom_n7',lds_detail.getitemdecimal(1,'custom_n7'))
	if of_check_unselect_fields(0,'ctx_basic_info','custom_n8') = true then of_set_value(lds_dync_detail, 'custom_n8', lds_ctx_basic_info, ll_row, lds_detail, 1, 'DEC')	//Modified by harry 20170621    lds_ctx_basic_info.setitem(ll_row,'custom_n8',lds_detail.getitemdecimal(1,'custom_n8'))
	if of_check_unselect_fields(0,'ctx_basic_info','custom_n9') = true then of_set_value(lds_dync_detail, 'custom_n9', lds_ctx_basic_info, ll_row, lds_detail, 1, 'DEC')	//Modified by harry 20170621    lds_ctx_basic_info.setitem(ll_row,'custom_n9',lds_detail.getitemdecimal(1,'custom_n9'))
	if of_check_unselect_fields(0,'ctx_basic_info','custom_n10') = true then of_set_value(lds_dync_detail, 'custom_n10', lds_ctx_basic_info, ll_row, lds_detail, 1, 'DEC')	//Modified by harry 20170621    lds_ctx_basic_info.setitem(ll_row,'custom_n10',lds_detail.getitemdecimal(1,'custom_n10'))	
	
	if of_check_unselect_fields(0,'ctx_basic_info','custom_n11') = true then of_set_value(lds_dync_detail, 'custom_n11', lds_ctx_basic_info, ll_row, lds_detail, 1, 'DEC')	//Modified by harry 20170621     lds_ctx_basic_info.setitem(ll_row,'custom_n11',lds_detail.getitemdecimal(1,'custom_n11'))
	if of_check_unselect_fields(0,'ctx_basic_info','custom_n12') = true then of_set_value(lds_dync_detail, 'custom_n12', lds_ctx_basic_info, ll_row, lds_detail, 1, 'DEC')	//Modified by harry 20170621     lds_ctx_basic_info.setitem(ll_row,'custom_n12',lds_detail.getitemdecimal(1,'custom_n12'))
	if of_check_unselect_fields(0,'ctx_basic_info','custom_n13') = true then of_set_value(lds_dync_detail, 'custom_n13', lds_ctx_basic_info, ll_row, lds_detail, 1, 'DEC')	//Modified by harry 20170621     lds_ctx_basic_info.setitem(ll_row,'custom_n13',lds_detail.getitemdecimal(1,'custom_n13'))
	if of_check_unselect_fields(0,'ctx_basic_info','custom_n14') = true then of_set_value(lds_dync_detail, 'custom_n14', lds_ctx_basic_info, ll_row, lds_detail, 1, 'DEC')	//Modified by harry 20170621     lds_ctx_basic_info.setitem(ll_row,'custom_n14',lds_detail.getitemdecimal(1,'custom_n14'))
	if of_check_unselect_fields(0,'ctx_basic_info','custom_n15') = true then of_set_value(lds_dync_detail, 'custom_n15', lds_ctx_basic_info, ll_row, lds_detail, 1, 'DEC')	//Modified by harry 20170621     lds_ctx_basic_info.setitem(ll_row,'custom_n15',lds_detail.getitemdecimal(1,'custom_n15'))
	if of_check_unselect_fields(0,'ctx_basic_info','custom_n16') = true then of_set_value(lds_dync_detail, 'custom_n16', lds_ctx_basic_info, ll_row, lds_detail, 1, 'DEC')	//Modified by harry 20170621     lds_ctx_basic_info.setitem(ll_row,'custom_n16',lds_detail.getitemdecimal(1,'custom_n16'))
	if of_check_unselect_fields(0,'ctx_basic_info','custom_n17') = true then of_set_value(lds_dync_detail, 'custom_n17', lds_ctx_basic_info, ll_row, lds_detail, 1, 'DEC')	//Modified by harry 20170621     lds_ctx_basic_info.setitem(ll_row,'custom_n17',lds_detail.getitemdecimal(1,'custom_n17'))
	if of_check_unselect_fields(0,'ctx_basic_info','custom_n18') = true then of_set_value(lds_dync_detail, 'custom_n18', lds_ctx_basic_info, ll_row, lds_detail, 1, 'DEC')	//Modified by harry 20170621     lds_ctx_basic_info.setitem(ll_row,'custom_n18',lds_detail.getitemdecimal(1,'custom_n18'))
	if of_check_unselect_fields(0,'ctx_basic_info','custom_n19') = true then of_set_value(lds_dync_detail, 'custom_n19', lds_ctx_basic_info, ll_row, lds_detail, 1, 'DEC')	//Modified by harry 20170621     lds_ctx_basic_info.setitem(ll_row,'custom_n19',lds_detail.getitemdecimal(1,'custom_n19'))
	if of_check_unselect_fields(0,'ctx_basic_info','custom_n20') = true then of_set_value(lds_dync_detail, 'custom_n20', lds_ctx_basic_info, ll_row, lds_detail, 1, 'DEC')	//Modified by harry 20170621     lds_ctx_basic_info.setitem(ll_row,'custom_n20',lds_detail.getitemdecimal(1,'custom_n20'))	
	if of_check_unselect_fields(0,'ctx_basic_info','custom_n21') = true then of_set_value(lds_dync_detail, 'custom_n21', lds_ctx_basic_info, ll_row, lds_detail, 1, 'DEC')	//Modified by harry 20170621     lds_ctx_basic_info.setitem(ll_row,'custom_n21',lds_detail.getitemdecimal(1,'custom_n21'))
	if of_check_unselect_fields(0,'ctx_basic_info','custom_n22') = true then of_set_value(lds_dync_detail, 'custom_n22', lds_ctx_basic_info, ll_row, lds_detail, 1, 'DEC')	//Modified by harry 20170621     lds_ctx_basic_info.setitem(ll_row,'custom_n22',lds_detail.getitemdecimal(1,'custom_n22'))
	if of_check_unselect_fields(0,'ctx_basic_info','custom_n23') = true then of_set_value(lds_dync_detail, 'custom_n23', lds_ctx_basic_info, ll_row, lds_detail, 1, 'DEC')	//Modified by harry 20170621     lds_ctx_basic_info.setitem(ll_row,'custom_n23',lds_detail.getitemdecimal(1,'custom_n23'))
	if of_check_unselect_fields(0,'ctx_basic_info','custom_n24') = true then of_set_value(lds_dync_detail, 'custom_n24', lds_ctx_basic_info, ll_row, lds_detail, 1, 'DEC')	//Modified by harry 20170621     lds_ctx_basic_info.setitem(ll_row,'custom_n24',lds_detail.getitemdecimal(1,'custom_n24'))
	if of_check_unselect_fields(0,'ctx_basic_info','custom_n25') = true then of_set_value(lds_dync_detail, 'custom_n25', lds_ctx_basic_info, ll_row, lds_detail, 1, 'DEC')	//Modified by harry 20170621     lds_ctx_basic_info.setitem(ll_row,'custom_n25',lds_detail.getitemdecimal(1,'custom_n25'))
	if of_check_unselect_fields(0,'ctx_basic_info','custom_n26') = true then of_set_value(lds_dync_detail, 'custom_n26', lds_ctx_basic_info, ll_row, lds_detail, 1, 'DEC')	//Modified by harry 20170621     lds_ctx_basic_info.setitem(ll_row,'custom_n26',lds_detail.getitemdecimal(1,'custom_n26'))
	if of_check_unselect_fields(0,'ctx_basic_info','custom_n27') = true then of_set_value(lds_dync_detail, 'custom_n27', lds_ctx_basic_info, ll_row, lds_detail, 1, 'DEC')	//Modified by harry 20170621     lds_ctx_basic_info.setitem(ll_row,'custom_n27',lds_detail.getitemdecimal(1,'custom_n27'))
	
	if of_check_unselect_fields(0,'ctx_basic_info','custom_21') = true then 
		//lds_ctx_basic_info.setitem(ll_row,'custom_21',lds_detail.getitemstring(1,'custom_21'))
		of_set_value(lds_dync_detail, 'custom_21', lds_ctx_basic_info, ll_row, lds_detail, 1, 'C', 9, ll_ctx_id)	//Modified by harry 20170621    
		ls_custom_fields = ls_custom_fields + " 'custom_21',"  //Added by Harry 20170517
	end if
	if of_check_unselect_fields(0,'ctx_basic_info','custom_22') = true then 
		//lds_ctx_basic_info.setitem(ll_row,'custom_22',lds_detail.getitemstring(1,'custom_22'))	
		of_set_value(lds_dync_detail, 'custom_22', lds_ctx_basic_info, ll_row, lds_detail, 1, 'C', 9, ll_ctx_id)	//Modified by harry 20170621
		ls_custom_fields = ls_custom_fields + " 'custom_22',"  //Added by Harry 20170517
	end if
	if of_check_unselect_fields(0,'ctx_basic_info','custom_date11') = true then of_set_value(lds_dync_detail, 'custom_date11', lds_ctx_basic_info, ll_row, lds_detail, 1, 'DT')	//Modified by harry 20170621     lds_ctx_basic_info.setitem(ll_row,'custom_date11',lds_detail.getitemdatetime(1,'custom_date11'))
	if of_check_unselect_fields(0,'ctx_basic_info','custom_date12') = true then of_set_value(lds_dync_detail, 'custom_date12', lds_ctx_basic_info, ll_row, lds_detail, 1, 'DT')	//Modified by harry 20170621      lds_ctx_basic_info.setitem(ll_row,'custom_date12',lds_detail.getitemdatetime(1,'custom_date12'))
	if of_check_unselect_fields(0,'ctx_basic_info','custom_date13') = true then of_set_value(lds_dync_detail, 'custom_date13', lds_ctx_basic_info, ll_row, lds_detail, 1, 'DT')	//Modified by harry 20170621      lds_ctx_basic_info.setitem(ll_row,'custom_date13',lds_detail.getitemdatetime(1,'custom_date13'))
	if of_check_unselect_fields(0,'ctx_basic_info','custom_date14') = true then of_set_value(lds_dync_detail, 'custom_date14', lds_ctx_basic_info, ll_row, lds_detail, 1, 'DT')	//Modified by harry 20170621      lds_ctx_basic_info.setitem(ll_row,'custom_date14',lds_detail.getitemdatetime(1,'custom_date14'))
	if of_check_unselect_fields(0,'ctx_basic_info','custom_date15') = true then of_set_value(lds_dync_detail, 'custom_date15', lds_ctx_basic_info, ll_row, lds_detail, 1, 'DT')	//Modified by harry 20170621      lds_ctx_basic_info.setitem(ll_row,'custom_date15',lds_detail.getitemdatetime(1,'custom_date15'))
	if of_check_unselect_fields(0,'ctx_basic_info','custom_date16') = true then of_set_value(lds_dync_detail, 'custom_date16', lds_ctx_basic_info, ll_row, lds_detail, 1, 'DT')	//Modified by harry 20170621      lds_ctx_basic_info.setitem(ll_row,'custom_date16',lds_detail.getitemdatetime(1,'custom_date16'))
	if of_check_unselect_fields(0,'ctx_basic_info','custom_date17') = true then of_set_value(lds_dync_detail, 'custom_date17', lds_ctx_basic_info, ll_row, lds_detail, 1, 'DT')	//Modified by harry 20170621      lds_ctx_basic_info.setitem(ll_row,'custom_date17',lds_detail.getitemdatetime(1,'custom_date17'))
	
	//Add notes, percent,work_flow ... fields -- jervis 12.30.2010
	if of_check_unselect_fields(0,'ctx_basic_info','custom_notes_1') = true then 
		//lds_ctx_basic_info.setitem(ll_row,'custom_notes_1',lds_detail.getitemstring(1,'custom_notes_1'))
		of_set_value(lds_dync_detail, 'custom_notes_1', lds_ctx_basic_info, ll_row, lds_detail, 1, 'C', 9, ll_ctx_id)	//Modified by harry 20170621
		ls_custom_fields = ls_custom_fields + " 'custom_notes_1',"  //Added by Harry 20170517
	end if
	if of_check_unselect_fields(0,'ctx_basic_info','custom_notes_2') = true then 
		//lds_ctx_basic_info.setitem(ll_row,'custom_notes_2',lds_detail.getitemstring(1,'custom_notes_2'))
		of_set_value(lds_dync_detail, 'custom_notes_2', lds_ctx_basic_info, ll_row, lds_detail, 1, 'C', 9, ll_ctx_id)	//Modified by harry 20170621
		ls_custom_fields = ls_custom_fields + " 'custom_notes_2',"  //Added by Harry 20170517
	end if
	if of_check_unselect_fields(0,'ctx_basic_info','custom_notes_3') = true then 
		//lds_ctx_basic_info.setitem(ll_row,'custom_notes_3',lds_detail.getitemstring(1,'custom_notes_3'))
		of_set_value(lds_dync_detail, 'custom_notes_3', lds_ctx_basic_info, ll_row, lds_detail, 1, 'C', 9, ll_ctx_id)	//Modified by harry 20170621
		ls_custom_fields = ls_custom_fields + " 'custom_notes_3',"  //Added by Harry 20170517
	end if
	if of_check_unselect_fields(0,'ctx_basic_info','custom_notes_4') = true then 
		//lds_ctx_basic_info.setitem(ll_row,'custom_notes_4',lds_detail.getitemstring(1,'custom_notes_4'))
		of_set_value(lds_dync_detail, 'custom_notes_4', lds_ctx_basic_info, ll_row, lds_detail, 1, 'C', 9, ll_ctx_id)	//Modified by harry 20170621
		ls_custom_fields = ls_custom_fields + " 'custom_notes_4',"  //Added by Harry 20170517
	end if
	if of_check_unselect_fields(0,'ctx_basic_info','custom_notes_5') = true then 
		//lds_ctx_basic_info.setitem(ll_row,'custom_notes_5',lds_detail.getitemstring(1,'custom_notes_5'))
		of_set_value(lds_dync_detail, 'custom_notes_5', lds_ctx_basic_info, ll_row, lds_detail, 1, 'C', 9, ll_ctx_id)	//Modified by harry 20170621
		ls_custom_fields = ls_custom_fields + " 'custom_notes_2',"  //Added by Harry 20170517
	end if

	if of_check_unselect_fields(0,'ctx_basic_info','custom_percent_1') = true then of_set_value(lds_dync_detail, 'custom_percent_1', lds_ctx_basic_info, ll_row, lds_detail, 1, 'DEC')	//Modified by harry 20170621   lds_ctx_basic_info.setitem(ll_row,'custom_percent_1',lds_detail.getitemdecimal(1,'custom_percent_1'))
	if of_check_unselect_fields(0,'ctx_basic_info','custom_percent_2') = true then of_set_value(lds_dync_detail, 'custom_percent_2', lds_ctx_basic_info, ll_row, lds_detail, 1, 'DEC')	//Modified by harry 20170621    lds_ctx_basic_info.setitem(ll_row,'custom_percent_2',lds_detail.getitemdecimal(1,'custom_percent_2'))
	if of_check_unselect_fields(0,'ctx_basic_info','custom_percent_3') = true then of_set_value(lds_dync_detail, 'custom_percent_3', lds_ctx_basic_info, ll_row, lds_detail, 1, 'DEC')	//Modified by harry 20170621    lds_ctx_basic_info.setitem(ll_row,'custom_percent_3',lds_detail.getitemdecimal(1,'custom_percent_3'))
	if of_check_unselect_fields(0,'ctx_basic_info','custom_percent_4') = true then of_set_value(lds_dync_detail, 'custom_percent_4', lds_ctx_basic_info, ll_row, lds_detail, 1, 'DEC')	//Modified by harry 20170621    lds_ctx_basic_info.setitem(ll_row,'custom_percent_4',lds_detail.getitemdecimal(1,'custom_percent_4'))
	if of_check_unselect_fields(0,'ctx_basic_info','custom_percent_5') = true then of_set_value(lds_dync_detail, 'custom_percent_5', lds_ctx_basic_info, ll_row, lds_detail, 1, 'DEC')	//Modified by harry 20170621    lds_ctx_basic_info.setitem(ll_row,'custom_percent_5',lds_detail.getitemdecimal(1,'custom_percent_5'))
	if of_check_unselect_fields(0,'ctx_basic_info','custom_percent_6') = true then of_set_value(lds_dync_detail, 'custom_percent_6', lds_ctx_basic_info, ll_row, lds_detail, 1, 'DEC')	//Modified by harry 20170621    lds_ctx_basic_info.setitem(ll_row,'custom_percent_6',lds_detail.getitemdecimal(1,'custom_percent_6'))
	if of_check_unselect_fields(0,'ctx_basic_info','custom_percent_7') = true then of_set_value(lds_dync_detail, 'custom_percent_7', lds_ctx_basic_info, ll_row, lds_detail, 1, 'DEC')	//Modified by harry 20170621    lds_ctx_basic_info.setitem(ll_row,'custom_percent_7',lds_detail.getitemdecimal(1,'custom_percent_7'))
	if of_check_unselect_fields(0,'ctx_basic_info','custom_percent_8') = true then of_set_value(lds_dync_detail, 'custom_percent_8', lds_ctx_basic_info, ll_row, lds_detail, 1, 'DEC')	//Modified by harry 20170621    lds_ctx_basic_info.setitem(ll_row,'custom_percent_8',lds_detail.getitemdecimal(1,'custom_percent_8'))
	if of_check_unselect_fields(0,'ctx_basic_info','custom_percent_9') = true then of_set_value(lds_dync_detail, 'custom_percent_9', lds_ctx_basic_info, ll_row, lds_detail, 1, 'DEC')	//Modified by harry 20170621    lds_ctx_basic_info.setitem(ll_row,'custom_percent_9',lds_detail.getitemdecimal(1,'custom_percent_9'))
	if of_check_unselect_fields(0,'ctx_basic_info','custom_percent_10') = true then of_set_value(lds_dync_detail, 'custom_percent_10', lds_ctx_basic_info, ll_row, lds_detail, 1, 'DEC')	//Modified by harry 20170621    lds_ctx_basic_info.setitem(ll_row,'custom_percent_10',lds_detail.getitemdecimal(1,'custom_percent_10'))
	if of_check_unselect_fields(0,'ctx_basic_info','work_flow_n1') = true then of_set_value(lds_dync_detail, 'work_flow_n1', lds_ctx_basic_info, ll_row, lds_detail, 1, 'DEC')	//Modified by harry 20170621    lds_ctx_basic_info.setitem(ll_row,'work_flow_n1',lds_detail.getitemdecimal(1,'work_flow_n1'))
	if of_check_unselect_fields(0,'ctx_basic_info','work_flow_n2') = true then of_set_value(lds_dync_detail, 'work_flow_n2', lds_ctx_basic_info, ll_row, lds_detail, 1, 'DEC')	//Modified by harry 20170621    lds_ctx_basic_info.setitem(ll_row,'work_flow_n2',lds_detail.getitemdecimal(1,'work_flow_n2'))
	if of_check_unselect_fields(0,'ctx_basic_info','work_flow_n3') = true then of_set_value(lds_dync_detail, 'work_flow_n3', lds_ctx_basic_info, ll_row, lds_detail, 1, 'DEC')	//Modified by harry 20170621    lds_ctx_basic_info.setitem(ll_row,'work_flow_n3',lds_detail.getitemdecimal(1,'work_flow_n3'))
	if of_check_unselect_fields(0,'ctx_basic_info','work_flow_n4') = true then of_set_value(lds_dync_detail, 'work_flow_n4', lds_ctx_basic_info, ll_row, lds_detail, 1, 'DEC')	//Modified by harry 20170621    lds_ctx_basic_info.setitem(ll_row,'work_flow_n4',lds_detail.getitemdecimal(1,'work_flow_n4'))
	if of_check_unselect_fields(0,'ctx_basic_info','work_flow_n5') = true then of_set_value(lds_dync_detail, 'work_flow_n5', lds_ctx_basic_info, ll_row, lds_detail, 1, 'DEC')	//Modified by harry 20170621    lds_ctx_basic_info.setitem(ll_row,'work_flow_n5',lds_detail.getitemdecimal(1,'work_flow_n5'))
	
	//Add custom status field - jervis 04.19.2011
	if of_check_unselect_fields(0,'ctx_basic_info','custom_status1') = true then of_set_value(lds_dync_detail, 'custom_status1', lds_ctx_basic_info, ll_row, lds_detail, 1, 'DEC')	//Modified by harry 20170621    lds_ctx_basic_info.setitem(ll_row,'custom_status1',lds_detail.getitemdecimal(1,'custom_status1'))
	if of_check_unselect_fields(0,'ctx_basic_info','custom_status2') = true then of_set_value(lds_dync_detail, 'custom_status2', lds_ctx_basic_info, ll_row, lds_detail, 1, 'DEC')	//Modified by harry 20170621    lds_ctx_basic_info.setitem(ll_row,'custom_status2',lds_detail.getitemdecimal(1,'custom_status2'))

	//Added by Harry 20170517
	if len(ls_custom_fields) > 0 then
		ls_custom_fields = left(ls_custom_fields, len(ls_custom_fields) - 1)
		
		ls_sql = "INSERT INTO screen_field_select_item (view_id, screen_id, ctx_id, field_name, field_data) "  + &
					" SELECT view_id,  screen_id, " + String(ll_ctx_id) + ", field_name, field_data "  + &
					" FROM screen_field_select_item WHERE screen_id = 9 AND ctx_id = " + String(astr_copy_ctx.sl_ctx_id) + &
					" AND field_name IN ( " + ls_custom_fields + " );"
			
		EXECUTE IMMEDIATE :ls_sql;
	end if
		
	lb_copy = True
End If
//If astr_copy_ctx.sb_notes = 1 Then
If astr_copy_ctx.sb_notes = 1 and of_get_screen_exist(ll_view, 8) Then //Modified by harry 20170622
	f_create_contract_ds (ll_view, 8, lds_dync_detail)  //Added by Harry 20170621 Create Contract Notes from current screen
	//Notes
	if of_check_unselect_fields(0,'ctx_basic_info','notes') = true then of_set_value(lds_dync_detail, 'notes', lds_ctx_basic_info, ll_row, lds_detail, 1, 'C')	//Modified by harry 20170621    lds_ctx_basic_info.setitem(ll_row,'notes',lds_detail.getitemstring(1,'notes'))		
	lb_copy = True
End If
//If astr_copy_ctx.sb_contracted_contacts = 1 Then
If astr_copy_ctx.sb_contracted_contacts = 1 and of_get_screen_exist(ll_view, 6) Then //Modified by harry 20170622
	f_create_contract_ds (ll_view, 6, lds_dync_detail)  //Added by Harry 20170621 Create Contracted Company Contacts from current screen
	If astr_copy_ctx.si_clear_company = 1 and astr_copy_ctx.si_is_template = 0 Then
		//Clean Contracted company contacts when clean company name - jervis 09.02.2011
	Else
		//Contracted Company Contacts
		lds_company_contacts.retrieve(astr_copy_ctx.sl_ctx_id,'E')
		For i = 1 To lds_company_contacts.rowcount()		
			ll_record_id = gnv_app.of_get_id('RECORD_ID')
			ll_row = lds_ctx_contract_contacts.insertrow(0)
			lds_ctx_contract_contacts.setitem(ll_row,'ctx_id',ll_ctx_id)
			lds_ctx_contract_contacts.setitem(ll_row,'contact_id',lds_company_contacts.getitemnumber(i,'contact_id'))
			lds_ctx_contract_contacts.setitem(ll_row,'ic_area',lds_company_contacts.getitemstring(i,'ic_area'))
			if of_check_unselect_fields(6,'ctx_contract_contacts','association') = true then of_set_value(lds_dync_detail, 'association', lds_ctx_contract_contacts, ll_row, lds_company_contacts, i, 'C')	//Modified by harry 20170621     lds_ctx_contract_contacts.setitem(ll_row,'association',lds_company_contacts.getitemstring(i,'association'))
			if of_check_unselect_fields(6,'ctx_contract_contacts','default_email') = true then of_set_value(lds_dync_detail, 'default_email', lds_ctx_contract_contacts, ll_row, lds_company_contacts, i, 'C')	//Modified by harry 20170621     lds_ctx_contract_contacts.setitem(ll_row,'default_email',lds_company_contacts.getitemstring(i,'default_email'))
			if of_check_unselect_fields(6,'ctx_contract_contacts','owner') = true then of_set_value(lds_dync_detail, 'ctx_contract_contacts_owner', lds_ctx_contract_contacts, ll_row, lds_company_contacts, i, 'C')	//Modified by harry 20170621      lds_ctx_contract_contacts.setitem(ll_row,'owner',lds_company_contacts.getitemstring(i,'ctx_contract_contacts_owner'))
			if of_check_unselect_fields(6,'ctx_contract_contacts','access') = true then of_set_value(lds_dync_detail, 'access', lds_ctx_contract_contacts, ll_row, lds_company_contacts, i, 'C')	//Modified by harry 20170621      lds_ctx_contract_contacts.setitem(ll_row,'access',lds_company_contacts.getitemstring(i,'access'))		
			lds_ctx_contract_contacts.setitem(ll_row,'record_id',ll_record_id)
			if of_check_unselect_fields(6,'ctx_contract_contacts','inserted_by_user') = true then lds_ctx_contract_contacts.setitem(ll_row,'inserted_by_user',gs_user_id)
			if of_check_unselect_fields(6,'ctx_contract_contacts','inserted_at_date_time') = true then lds_ctx_contract_contacts.setitem(ll_row,'inserted_at_date_time',today())
			if of_check_unselect_fields(6,'ctx_contract_contacts','updated_by_user') = true then lds_ctx_contract_contacts.setitem(ll_row,'updated_by_user',gs_user_id)
			if of_check_unselect_fields(6,'ctx_contract_contacts','updated_at_date_time') = true then lds_ctx_contract_contacts.setitem(ll_row,'updated_at_date_time',today())		
			//added by gavins 20121203
			if of_check_unselect_fields(6,'ctx_contract_contacts','association2') = true then of_set_value(lds_dync_detail, 'association2', lds_ctx_contract_contacts, ll_row, lds_company_contacts, i, 'C')	//Modified by harry 20170621       lds_ctx_contract_contacts.setitem(ll_row,'association2',lds_company_contacts.getitemstring(i,'association2'))
			if of_check_unselect_fields(6,'ctx_contract_contacts','association3') = true then of_set_value(lds_dync_detail, 'association3', lds_ctx_contract_contacts, ll_row, lds_company_contacts, i, 'C')	//Modified by harry 20170621       lds_ctx_contract_contacts.setitem(ll_row,'association3',lds_company_contacts.getitemstring(i,'association3'))
			if of_check_unselect_fields(6,'ctx_contract_contacts','association4') = true then of_set_value(lds_dync_detail, 'association4', lds_ctx_contract_contacts, ll_row, lds_company_contacts, i, 'C')	//Modified by harry 20170621        lds_ctx_contract_contacts.setitem(ll_row,'association4',lds_company_contacts.getitemstring(i,'association4'))
			if of_check_unselect_fields(6,'ctx_contract_contacts','association5') = true then of_set_value(lds_dync_detail, 'association5', lds_ctx_contract_contacts, ll_row, lds_company_contacts, i, 'C')	//Modified by harry 20170621        lds_ctx_contract_contacts.setitem(ll_row,'association5',lds_company_contacts.getitemstring(i,'association5'))
			if of_check_unselect_fields(6,'ctx_contract_contacts','association6') = true then of_set_value(lds_dync_detail, 'association6', lds_ctx_contract_contacts, ll_row, lds_company_contacts, i, 'C')	//Modified by harry 20170621        lds_ctx_contract_contacts.setitem(ll_row,'association6',lds_company_contacts.getitemstring(i,'association6'))
			if of_check_unselect_fields(6,'ctx_contract_contacts','association7') = true then of_set_value(lds_dync_detail, 'association7', lds_ctx_contract_contacts, ll_row, lds_company_contacts, i, 'C')	//Modified by harry 20170621        lds_ctx_contract_contacts.setitem(ll_row,'association7',lds_company_contacts.getitemstring(i,'association7'))
			if of_check_unselect_fields(6,'ctx_contract_contacts','association8') = true then of_set_value(lds_dync_detail, 'association8', lds_ctx_contract_contacts, ll_row, lds_company_contacts, i, 'C')	//Modified by harry 20170621        lds_ctx_contract_contacts.setitem(ll_row,'association8',lds_company_contacts.getitemstring(i,'association8'))
			if of_check_unselect_fields(6,'ctx_contract_contacts','association9') = true then of_set_value(lds_dync_detail, 'association9', lds_ctx_contract_contacts, ll_row, lds_company_contacts, i, 'C')	//Modified by harry 20170621        lds_ctx_contract_contacts.setitem(ll_row,'association9',lds_company_contacts.getitemstring(i,'association9'))
			if of_check_unselect_fields(6,'ctx_contract_contacts','association10') = true then of_set_value(lds_dync_detail, 'association10', lds_ctx_contract_contacts, ll_row, lds_company_contacts, i, 'C')	//Modified by harry 20170621        lds_ctx_contract_contacts.setitem(ll_row,'association10',lds_company_contacts.getitemstring(i,'association10'))
			lb_copy = True
		Next
	End If
End If
//If astr_copy_ctx.sb_our_contacts = 1 Then
If astr_copy_ctx.sb_our_contacts = 1 and of_get_screen_exist(ll_view, 7) Then //Modified by harry 20170622
	f_create_contract_ds (ll_view, 7, lds_dync_detail)  //Added by Harry 20170621 Create Contracted Our Company Contacts   from current screen
	//Our Company Contacts  
	lds_company_contacts.retrieve(astr_copy_ctx.sl_ctx_id,'I')
	For i = 1 To lds_company_contacts.rowcount()		
		ll_record_id = gnv_app.of_get_id('RECORD_ID')
		ll_row = lds_ctx_contract_contacts.insertrow(0)
		lds_ctx_contract_contacts.setitem(ll_row,'ctx_id',ll_ctx_id)
		lds_ctx_contract_contacts.setitem(ll_row,'contact_id',lds_company_contacts.getitemnumber(i,'contact_id'))
		lds_ctx_contract_contacts.setitem(ll_row,'ic_area',lds_company_contacts.getitemstring(i,'ic_area'))
		if of_check_unselect_fields(7,'ctx_contract_contacts','association') = true then of_set_value(lds_dync_detail, 'association', lds_ctx_contract_contacts, ll_row, lds_company_contacts, i, 'C')	//Modified by harry 20170621      lds_ctx_contract_contacts.setitem(ll_row,'association',lds_company_contacts.getitemstring(i,'association'))
		if of_check_unselect_fields(7,'ctx_contract_contacts','default_email') = true then of_set_value(lds_dync_detail, 'default_email', lds_ctx_contract_contacts, ll_row, lds_company_contacts, i, 'C')	//Modified by harry 20170621      lds_ctx_contract_contacts.setitem(ll_row,'default_email',lds_company_contacts.getitemstring(i,'default_email'))
		if of_check_unselect_fields(7,'ctx_contract_contacts','owner') = true then of_set_value(lds_dync_detail, 'ctx_contract_contacts_owner', lds_ctx_contract_contacts, ll_row, lds_company_contacts, i, 'C')	//Modified by harry 20170621      lds_ctx_contract_contacts.setitem(ll_row,'owner',lds_company_contacts.getitemstring(i,'ctx_contract_contacts_owner'))
		if of_check_unselect_fields(7,'ctx_contract_contacts','access') = true then of_set_value(lds_dync_detail, 'access', lds_ctx_contract_contacts, ll_row, lds_company_contacts, i, 'C')	//Modified by harry 20170621      lds_ctx_contract_contacts.setitem(ll_row,'access',lds_company_contacts.getitemstring(i,'access'))		
		lds_ctx_contract_contacts.setitem(ll_row,'record_id',ll_record_id)
		if of_check_unselect_fields(7,'ctx_contract_contacts','inserted_by_user') = true then lds_ctx_contract_contacts.setitem(ll_row,'inserted_by_user',gs_user_id)
		if of_check_unselect_fields(7,'ctx_contract_contacts','inserted_at_date_time') = true then lds_ctx_contract_contacts.setitem(ll_row,'inserted_at_date_time',today())
		if of_check_unselect_fields(7,'ctx_contract_contacts','updated_by_user') = true then lds_ctx_contract_contacts.setitem(ll_row,'updated_by_user',gs_user_id)
		if of_check_unselect_fields(7,'ctx_contract_contacts','updated_at_date_time') = true then lds_ctx_contract_contacts.setitem(ll_row,'updated_at_date_time',today())		
		//added by gavins 20121203
		if of_check_unselect_fields(7,'ctx_contract_contacts','association2') = true then of_set_value(lds_dync_detail, 'association2', lds_ctx_contract_contacts, ll_row, lds_company_contacts, i, 'C')	//Modified by harry 20170621      lds_ctx_contract_contacts.setitem(ll_row,'association2',lds_company_contacts.getitemstring(i,'association2'))
		if of_check_unselect_fields(7,'ctx_contract_contacts','association3') = true then of_set_value(lds_dync_detail, 'association3', lds_ctx_contract_contacts, ll_row, lds_company_contacts, i, 'C')	//Modified by harry 20170621      lds_ctx_contract_contacts.setitem(ll_row,'association3',lds_company_contacts.getitemstring(i,'association3'))
		if of_check_unselect_fields(7,'ctx_contract_contacts','association4') = true then of_set_value(lds_dync_detail, 'association4', lds_ctx_contract_contacts, ll_row, lds_company_contacts, i, 'C')	//Modified by harry 20170621      lds_ctx_contract_contacts.setitem(ll_row,'association4',lds_company_contacts.getitemstring(i,'association4'))
		if of_check_unselect_fields(7,'ctx_contract_contacts','association5') = true then of_set_value(lds_dync_detail, 'association5', lds_ctx_contract_contacts, ll_row, lds_company_contacts, i, 'C')	//Modified by harry 20170621      lds_ctx_contract_contacts.setitem(ll_row,'association5',lds_company_contacts.getitemstring(i,'association5'))
		if of_check_unselect_fields(7,'ctx_contract_contacts','association6') = true then of_set_value(lds_dync_detail, 'association6', lds_ctx_contract_contacts, ll_row, lds_company_contacts, i, 'C')	//Modified by harry 20170621      lds_ctx_contract_contacts.setitem(ll_row,'association6',lds_company_contacts.getitemstring(i,'association6'))
		if of_check_unselect_fields(7,'ctx_contract_contacts','association7') = true then of_set_value(lds_dync_detail, 'association7', lds_ctx_contract_contacts, ll_row, lds_company_contacts, i, 'C')	//Modified by harry 20170621      lds_ctx_contract_contacts.setitem(ll_row,'association7',lds_company_contacts.getitemstring(i,'association7'))
		if of_check_unselect_fields(7,'ctx_contract_contacts','association8') = true then of_set_value(lds_dync_detail, 'association8', lds_ctx_contract_contacts, ll_row, lds_company_contacts, i, 'C')	//Modified by harry 20170621      lds_ctx_contract_contacts.setitem(ll_row,'association8',lds_company_contacts.getitemstring(i,'association8'))
		if of_check_unselect_fields(7,'ctx_contract_contacts','association9') = true then of_set_value(lds_dync_detail, 'association9', lds_ctx_contract_contacts, ll_row, lds_company_contacts, i, 'C')	//Modified by harry 20170621      lds_ctx_contract_contacts.setitem(ll_row,'association9',lds_company_contacts.getitemstring(i,'association9'))
		if of_check_unselect_fields(7,'ctx_contract_contacts','association10') = true then of_set_value(lds_dync_detail, 'association10', lds_ctx_contract_contacts, ll_row, lds_company_contacts, i, 'C')	//Modified by harry 20170621      lds_ctx_contract_contacts.setitem(ll_row,'association10',lds_company_contacts.getitemstring(i,'association10'))
		lb_copy = True
	Next
End if

w_appeon_gifofwait.of_setposition(30)
If astr_copy_ctx.sb_products = 1 Then
	//Products
	lds_products.retrieve(astr_copy_ctx.sl_ctx_id)
	For i = 1 To lds_products.rowcount()
		ll_record_id = gnv_app.of_get_id('RECORD_ID')		
		ll_row = lds_ctx_products.insertrow(0)
		lds_ctx_products.setitem(ll_row,'ctx_id',ll_ctx_id)
		lds_ctx_products.setitem(ll_row,'product_id',lds_products.getitemnumber(i,'product_id'))
		lds_ctx_products.setitem(ll_row,'product_type',lds_products.getitemnumber(i,'product_type'))
		lds_ctx_products.setitem(ll_row,'record_id',ll_record_id)		
		if of_check_unselect_fields(4,'ctx_products','inserted_by_user') = true then lds_ctx_products.setitem(ll_row,'inserted_by_user',gs_user_id)
		if of_check_unselect_fields(4,'ctx_products','inserted_at_date_time') = true then lds_ctx_products.setitem(ll_row,'inserted_at_date_time',today())
		if of_check_unselect_fields(4,'ctx_products','updated_by_user') = true then lds_ctx_products.setitem(ll_row,'updated_by_user',gs_user_id)
		if of_check_unselect_fields(4,'ctx_products','updated_at_date_time') = true then lds_ctx_products.setitem(ll_row,'updated_at_date_time',today())		
		lb_copy = True		
	Next
End If
/* //Commented By Ken.Guo 2009-08-26
//Requirements
If astr_copy_ctx.sb_requirements = 1 Then
	
	lds_requirements.retrieve(astr_copy_ctx.sl_ctx_id)
	If lds_requirements.rowcount() > 0 Then		
		ll_record_id = gnv_app.of_get_id('RECORD_ID')
		
		ll_row = lds_ctx_req_profile_hdr.insertrow(0)
		lds_ctx_req_profile_hdr.setitem(ll_row,'ctx_req_profile_hdr_id',ll_ctx_id)
		lds_ctx_req_profile_hdr.setitem(ll_row,'ctx_req_profile_id',lds_requirements.getitemnumber(1,'ctx_req_profile_id')) // jervis 03.18.2009 hdr_ctx_req_profile_id to ctx_req_profile_id
		lds_ctx_req_profile_hdr.setitem(ll_row,'ctx_id',ll_ctx_id)
		lds_ctx_req_profile_hdr.setitem(ll_row,'record_id',ll_record_id)
		lds_ctx_req_profile_hdr.setitem(ll_row,'inserted_by_user',gs_user_id)
		lds_ctx_req_profile_hdr.setitem(ll_row,'inserted_at_date_time',today())
		lds_ctx_req_profile_hdr.setitem(ll_row,'updated_by_user',gs_user_id)
		lds_ctx_req_profile_hdr.setitem(ll_row,'updated_at_date_time',today())
		
		gnv_appeondb.of_startqueue( )
		lds_profile_detail.retrieve(astr_copy_ctx.sl_ctx_id)
		select max(ctx_elements_id) into :ll_element_id from ctx_elements;
		gnv_appeondb.of_commitqueue( )
 
		If isnull(ll_element_id) Or ll_element_id = 0 Then
			ll_element_id = 1
		Else
			ll_element_id = ll_element_id + 1
		End If

		For i = 1 To lds_profile_detail.rowcount()			
			ll_record_id = gnv_app.of_get_id('RECORD_ID')			
			ll_row = lds_ctx_elements.insertrow(0)
			lds_ctx_elements.setitem(ll_row,'ctx_elements_id',ll_element_id)
			lds_ctx_elements.setitem(ll_row,'ctx_req_profile_hdr_id',ll_ctx_id)
			lds_ctx_elements.setitem(ll_row,'ctx_req_tmplt_element_id',lds_profile_detail.getitemnumber(i,'ctx_req_tmplt_element_id'))
			lds_ctx_elements.setitem(ll_row,'char_value',lds_profile_detail.getitemstring(i,'char_value'))
			lds_ctx_elements.setitem(ll_row,'integer_value',lds_profile_detail.getitemnumber(i,'integer_value'))
			lds_ctx_elements.setitem(ll_row,'date_value',lds_profile_detail.getitemdatetime(i,'date_value'))
			lds_ctx_elements.setitem(ll_row,'field_value',lds_profile_detail.getitemstring(i,'field_value'))
			lds_ctx_elements.setitem(ll_row,'money_value',lds_profile_detail.getitemdecimal(i,'money_value'))
			lds_ctx_elements.setitem(ll_row,'record_id',ll_record_id)
			lds_ctx_elements.setitem(ll_row,'clause',lds_profile_detail.getitemstring(i,'clause'))			
			lds_ctx_elements.setitem(ll_row,'inserted_by_user',gs_user_id)
			lds_ctx_elements.setitem(ll_row,'inserted_at_date_time',today())
			lds_ctx_elements.setitem(ll_row,'updated_by_user',gs_user_id)
			lds_ctx_elements.setitem(ll_row,'updated_at_date_time',today())
			ll_element_id++
		Next		
		lb_copy = True				
	End If
End If
*/

//If astr_copy_ctx.sb_other_contacts = 1 Then
If astr_copy_ctx.sb_other_contacts = 1 and of_get_screen_exist(ll_view, 14) Then //Modified by harry 20170622
	f_create_contract_ds (ll_view, 14, lds_dync_detail)  //Added by Harry 20170621 Create Other Contacts from current screen
	//Other Contacts
	lds_other_contacts.retrieve(astr_copy_ctx.sl_ctx_id)
	For i = 1 To lds_other_contacts.rowcount()		
		ll_record_id = gnv_app.of_get_id('RECORD_ID')
		ll_row = lds_ctx_contract_contacts.insertrow(0)
		lds_ctx_contract_contacts.setitem(ll_row,'ctx_id',ll_ctx_id)
		lds_ctx_contract_contacts.setitem(ll_row,'contact_id',lds_other_contacts.getitemnumber(i,'contact_id'))
		lds_ctx_contract_contacts.setitem(ll_row,'ic_area',lds_other_contacts.getitemstring(i,'ic_area'))
		//Added By Mark Lee 06/10/2015	screen_id = 14 / ic_area = "C"
		if of_check_unselect_fields(14,'ctx_contract_contacts','association') = true then of_set_value(lds_dync_detail, 'association', lds_ctx_contract_contacts, ll_row, lds_other_contacts, i, 'C')	//Modified by harry 20170621      lds_ctx_contract_contacts.setitem(ll_row,'association',lds_other_contacts.getitemstring(i,'association'))
		if of_check_unselect_fields(14,'ctx_contract_contacts','default_email') = true then lds_ctx_contract_contacts.setitem(ll_row,'default_email','N')		
		if of_check_unselect_fields(14,'ctx_contract_contacts','notes') = true then of_set_value(lds_dync_detail, 'notes', lds_ctx_contract_contacts, ll_row, lds_other_contacts, i, 'C')	//Modified by harry 20170621       lds_ctx_contract_contacts.setitem(ll_row,'notes',lds_other_contacts.getitemstring(i,'notes'))
		if of_check_unselect_fields(14,'ctx_contract_contacts','record_id') = true then lds_ctx_contract_contacts.setitem(ll_row,'record_id',ll_record_id)
		if of_check_unselect_fields(14,'ctx_contract_contacts','inserted_by_user') = true then lds_ctx_contract_contacts.setitem(ll_row,'inserted_by_user',gs_user_id)
		if of_check_unselect_fields(14,'ctx_contract_contacts','inserted_at_date_time') = true then lds_ctx_contract_contacts.setitem(ll_row,'inserted_at_date_time',today())
		if of_check_unselect_fields(14,'ctx_contract_contacts','updated_by_user') = true then lds_ctx_contract_contacts.setitem(ll_row,'updated_by_user',gs_user_id)
		if of_check_unselect_fields(14,'ctx_contract_contacts','updated_at_date_time') = true then lds_ctx_contract_contacts.setitem(ll_row,'updated_at_date_time',today())		
		lb_copy = True		
	Next
End If
//If astr_copy_ctx.sb_locations  = 1 Then
If astr_copy_ctx.sb_locations  = 1 and of_get_screen_exist(ll_view, 19) Then //Modified by harry 20170622
	f_create_contract_ds (ll_view, 19, lds_dync_1)  //Added by Harry 20170621 Create Group/Location from current screen
	f_create_contract_ds (ll_view, 20, lds_dync_2)  //Added by Harry 20170621 Create Associated Physicians from current screen
	//f_create_contract_ds (ll_view, 21, lds_dync_3)  //Added by Harry 20170621 Create Specialties from current screen
	//Locations
	gnv_appeondb.of_startqueue( )
	lds_parent_organization.retrieve(astr_copy_ctx.sl_ctx_id)
	lds_group_locations.retrieve(astr_copy_ctx.sl_ctx_id)
	lds_selected_facility.retrieve(astr_copy_ctx.sl_ctx_id)
	lds_specialties.retrieve(astr_copy_ctx.sl_ctx_id)
	gnv_appeondb.of_commitqueue( )
	
	For i = 1 To lds_parent_organization.rowcount()
		ll_parent_comp_id = lds_parent_organization.getitemnumber(i,'parent_comp_id')
		ll_loc_id = lds_parent_organization.getitemnumber(i,'ctx_loc_loc_id')
		if isnull(ll_loc_id) or ll_loc_id = 0 then 						//Added By Mark Lee 06/10/2015   the id value alawys is 18
			ll_screen_id = 18
		else
			ll_screen_id = 19			
		end if 
		ll_record_id = gnv_app.of_get_id('RECORD_ID')
		ll_row = lds_ctx_loc.insertrow(0)
		lds_ctx_loc.setitem(ll_row,'ctx_id',ll_ctx_id)
		lds_ctx_loc.setitem(ll_row,'parent_comp_id',ll_parent_comp_id)
		lds_ctx_loc.setitem(ll_row,'loc_id',ll_loc_id)
		lds_ctx_loc.setitem(ll_row,'record_id',ll_record_id)
		if of_check_unselect_fields(ll_record_id,'ctx_loc','inserted_by_user') = true then lds_ctx_loc.setitem(ll_row,'inserted_by_user',gs_user_id)
		if of_check_unselect_fields(ll_record_id,'ctx_loc','inserted_at_date_time') = true then lds_ctx_loc.setitem(ll_row,'inserted_at_date_time',today())
		if of_check_unselect_fields(ll_record_id,'ctx_loc','updated_by_user') = true then lds_ctx_loc.setitem(ll_row,'updated_by_user',gs_user_id)
		if of_check_unselect_fields(ll_record_id,'ctx_loc','updated_at_date_time') = true then lds_ctx_loc.setitem(ll_row,'updated_at_date_time',today())
		
		lds_group_locations.setfilter("parent_comp_id = " + string(ll_parent_comp_id))
		lds_group_locations.filter()
		For j = 1 To lds_group_locations.rowcount()
			ll_loc_id = lds_group_locations.getitemnumber(j,'loc_id')
			ll_parent_comp_id = lds_parent_organization.getitemnumber(i,'parent_comp_id')

			if isnull(ll_loc_id) or ll_loc_id = 0 then 						//Added By Mark Lee 06/10/2015  the id value alawys is 19
				ll_screen_id = 18
			else
				ll_screen_id = 19			
			end if 
		
			ll_record_id = gnv_app.of_get_id('RECORD_ID')
			ll_row = lds_ctx_loc.insertrow(0)
			lds_ctx_loc.setitem(ll_row,'ctx_id',ll_ctx_id)
			lds_ctx_loc.setitem(ll_row,'parent_comp_id',ll_parent_comp_id)
			lds_ctx_loc.setitem(ll_row,'loc_id',ll_loc_id)			
			if of_check_unselect_fields(ll_record_id,'ctx_loc','group_number') = true then of_set_value(lds_dync_1, 'group_number', lds_ctx_loc, ll_row, lds_group_locations, j, 'C')	//Modified by harry 20170621      lds_ctx_loc.setitem(ll_row,'group_number',lds_group_locations.getitemstring(j,'group_number'))
			if of_check_unselect_fields(ll_record_id,'ctx_loc','local') = true then lds_ctx_loc.setitem(ll_row,'local',lds_group_locations.getitemnumber(j,'local'))
			if of_check_unselect_fields(ll_record_id,'ctx_loc','custom_1') = true then of_set_value(lds_dync_1, 'custom_1', lds_ctx_loc, ll_row, lds_group_locations, j, 'C')	//Modified by harry 20170621       lds_ctx_loc.setitem(ll_row,'custom_1',lds_group_locations.getitemstring(j,'custom_1'))
			if of_check_unselect_fields(ll_record_id,'ctx_loc','custom_2') = true then of_set_value(lds_dync_1, 'custom_2', lds_ctx_loc, ll_row, lds_group_locations, j, 'C')	//Modified by harry 20170621       lds_ctx_loc.setitem(ll_row,'custom_2',lds_group_locations.getitemstring(j,'custom_2'))			
			lds_ctx_loc.setitem(ll_row,'record_id',ll_record_id)
			if of_check_unselect_fields(ll_record_id,'ctx_loc','inserted_by_user') = true then lds_ctx_loc.setitem(ll_row,'inserted_by_user',gs_user_id)
			if of_check_unselect_fields(ll_record_id,'ctx_loc','inserted_at_date_time') = true then lds_ctx_loc.setitem(ll_row,'inserted_at_date_time',today())
			if of_check_unselect_fields(ll_record_id,'ctx_loc','updated_by_user') = true then lds_ctx_loc.setitem(ll_row,'updated_by_user',gs_user_id)
			if of_check_unselect_fields(ll_record_id,'ctx_loc','updated_at_date_time') = true then lds_ctx_loc.setitem(ll_row,'updated_at_date_time',today())
			
			lds_selected_facility.setfilter("loc_id = " + string(ll_loc_id) + " and parent_comp_id = " + string(ll_parent_comp_id))
			lds_selected_facility.filter()
			For k = 1 To lds_selected_facility.rowcount()				
				ll_record_id = gnv_app.of_get_id('RECORD_ID')
				ll_row = lds_ctx_location_pracs.insertrow(0)
				lds_ctx_location_pracs.setitem(ll_row,'ctx_id',ll_ctx_id)
				lds_ctx_location_pracs.setitem(ll_row,'record_id',ll_record_id)			
				lds_ctx_location_pracs.setitem(ll_row,'loc_id',lds_selected_facility.getitemnumber(k,'loc_id'))			
				lds_ctx_location_pracs.setitem(ll_row,'parent_comp_id', lds_selected_facility.getitemnumber(k,'parent_comp_id'))
				lds_ctx_location_pracs.setitem(ll_row,'gp_rec_id',lds_selected_facility.getitemnumber(k,'pracs_gp_rec_id'))			
				lds_ctx_location_pracs.setitem(ll_row,'prac_id',lds_selected_facility.getitemnumber(k,'prac_id'))			
				if of_check_unselect_fields(20,'ctx_location_pracs','ctx_location_pracs_status') = true then of_set_value(lds_dync_2, 'ctx_location_pracs_status', lds_ctx_location_pracs, ll_row, lds_selected_facility, k, 'N')	//Modified by harry 20170621     lds_ctx_location_pracs.setitem(ll_row,'status',lds_selected_facility.getitemnumber(k,'ctx_location_pracs_status'))			
				if of_check_unselect_fields(20,'ctx_location_pracs','start_date') = true then of_set_value(lds_dync_2, 'start_date', lds_ctx_location_pracs, ll_row, lds_selected_facility, k, 'DT')	//Modified by harry 20170621     lds_ctx_location_pracs.setitem(ll_row,'start_date',lds_selected_facility.getitemdatetime(k,'start_date'))			
				if of_check_unselect_fields(20,'ctx_location_pracs','end_date') = true then of_set_value(lds_dync_2, 'end_date', lds_ctx_location_pracs, ll_row, lds_selected_facility, k, 'DT')	//Modified by harry 20170621     lds_ctx_location_pracs.setitem(ll_row,'end_date',lds_selected_facility.getitemdatetime(k,'end_date'))			
			Next
				
			lds_specialties.setfilter("loc_id = " + string(ll_loc_id))
			lds_specialties.filter()
			For k = 1 To lds_specialties.rowcount()				
				ll_record_id = gnv_app.of_get_id('RECORD_ID')
				ll_row = lds_ctx_location_specialty.insertrow(0)
				lds_ctx_location_specialty.setitem(ll_row,'ctx_id',ll_ctx_id)
				lds_ctx_location_specialty.setitem(ll_row,'record_id',ll_record_id)							
				lds_ctx_location_specialty.setitem(ll_row,'parent_comp_id',lds_specialties.getitemnumber(k,'parent_comp_id'))
				lds_ctx_location_specialty.setitem(ll_row,'loc_id',lds_specialties.getitemnumber(k,'loc_id'))			
				lds_ctx_location_specialty.setitem(ll_row,'prac_specialty',lds_specialties.getitemnumber(k,'prac_specialty'))			
			Next
		Next
		lb_copy = True				
	Next
End If
If astr_copy_ctx.sb_organizations = 1 Then
	//Organizations
	lds_organization_list.retrieve(astr_copy_ctx.sl_ctx_id)
	
	For i = 1 To lds_organization_list.rowcount()		
		ll_org_id = lds_organization_list.getitemnumber(i,'ctx_orgs_contact_org_id')
		
		ll_record_id = gnv_app.of_get_id('RECORD_ID')
		ll_row = lds_ctx_orgs_contact.insertrow(0)
		lds_ctx_orgs_contact.setitem(ll_row,'ctx_id',ll_ctx_id)
		lds_ctx_orgs_contact.setitem(ll_row,'org_id',ll_org_id)
		if of_check_unselect_fields(0,'ctx_orgs_contact ','area') = true then lds_ctx_orgs_contact.setitem(ll_row,'area',lds_organization_list.getitemstring(i,'ctx_orgs_contact_area'))
		if of_check_unselect_fields(0,'ctx_orgs_contact ','notes') = true then lds_ctx_orgs_contact.setitem(ll_row,'notes',lds_organization_list.getitemstring(i,'notes'))
		lds_ctx_orgs_contact.setitem(ll_row,'record_id',ll_record_id)
		if of_check_unselect_fields(0,'ctx_orgs_contact ','inserted_by_user') = true then lds_ctx_orgs_contact.setitem(ll_row,'inserted_by_user',gs_user_id)
		if of_check_unselect_fields(0,'ctx_orgs_contact ','inserted_at_date_time') = true then lds_ctx_orgs_contact.setitem(ll_row,'inserted_at_date_time',today())
		if of_check_unselect_fields(0,'ctx_orgs_contact ','updated_by_user') = true then lds_ctx_orgs_contact.setitem(ll_row,'updated_by_user',gs_user_id)
		if of_check_unselect_fields(0,'ctx_orgs_contact ','updated_at_date_time') = true then lds_ctx_orgs_contact.setitem(ll_row,'updated_at_date_time',today())		
		lb_copy = True			
	Next
End If
w_appeon_gifofwait.of_setposition(40)


//If astr_copy_ctx.sb_fee_schedule = 1 Then
If astr_copy_ctx.sb_fee_schedule = 1 and of_get_screen_exist(ll_view, 31) Then //Modified by harry 20170622
//	//Fee Schedule
////	If w_contract.tab_contract_details.tabpage_fee_schedules.visible = True Then
//		//Modified By Ken.Guo 2017-05-31. added ctx_id parm for lds_providers. lds_fee_schedule_locations and lds_fees
//		gnv_debug.of_output(false, 'fee_schedule copy begin')
//		gnv_appeondb.of_startqueue( )
//		lds_fee_schedules.retrieve(astr_copy_ctx.sl_ctx_id)
//		lds_providers.retrieve(astr_copy_ctx.sl_ctx_id)
//		lds_fee_schedule_locations.retrieve(astr_copy_ctx.sl_ctx_id)
//		lds_fees.retrieve(astr_copy_ctx.sl_ctx_id)		
//		select max(fee_sched_id) + 1 into :ll_fee_sched_id from ctx_fee_sched_hdr;		
//		select max(fee_sched_location_id)  + 1 into :ll_fee_sched_location_id from ctx_fee_sched_locations;				
//		select max(fee_sched_data_id) + 1 into :ll_fee_sched_data_id from CTX_FEE_SCHED_DATA;		
//		gnv_appeondb.of_commitqueue( )
//		gnv_debug.of_output(false, 'fee_schedule copy retrieve data')
//		If isnull(ll_fee_sched_id) Then  ll_fee_sched_id = 1
//		If isnull(ll_fee_sched_location_id) Then ll_fee_sched_location_id = 1
//		If isnull(ll_fee_sched_data_id) Then ll_fee_sched_data_id = 1				
//		
//		//Modified By Ken.Guo 2017-05-31. Improve performance for Web
//		For i = 1 To lds_fee_schedules.rowcount()
//			gnv_debug.of_output(false, 'fee_schedule copy. 2')
//			ll_fee_sched_id1 = lds_fee_schedules.getitemnumber(i,'fee_sched_id')
//			If i = 1 Then 
//				ll_record_id10 = gnv_app.of_get_id('RECORD_ID', lds_fee_schedules.rowcount())
//			End If
//			ll_record_id1 = ll_record_id10  + i - 1			
//			
//			ll_row = lds_ctx_fee_sched_hdr.insertrow(0)
//			
//			ll_fee_sched_id_arr[i] = ll_fee_sched_id
//			ll_ctx_id_arr[i] = ll_ctx_id
//			ll_record_id1_arr[i] = ll_record_id1
//			/*
//			lds_ctx_fee_sched_hdr.setitem(ll_row,'fee_sched_id',ll_fee_sched_id)
//			lds_ctx_fee_sched_hdr.setitem(ll_row,'ctx_id',ll_ctx_id)
//			lds_ctx_fee_sched_hdr.setitem(ll_row,'record_id',ll_record_id1)
//			if of_check_unselect_fields(0,'ctx_fee_sched_hdr ','sched_type') = true then lds_ctx_fee_sched_hdr.setitem(ll_row,'sched_type',lds_fee_schedules.getitemnumber(i,'sched_type'))
//			if of_check_unselect_fields(0,'ctx_fee_sched_hdr ','carve_out_type') = true then lds_ctx_fee_sched_hdr.setitem(ll_row,'carve_out_type',lds_fee_schedules.getitemnumber(i,'carve_out_type'))
//			if of_check_unselect_fields(0,'ctx_fee_sched_hdr ','custom_1') = true then lds_ctx_fee_sched_hdr.setitem(ll_row,'custom_1',lds_fee_schedules.getitemstring(i,'custom_1'))
//			if of_check_unselect_fields(0,'ctx_fee_sched_hdr ','custom_2') = true then lds_ctx_fee_sched_hdr.setitem(ll_row,'custom_2',lds_fee_schedules.getitemstring(i,'custom_2'))
//			if of_check_unselect_fields(0,'ctx_fee_sched_hdr ','notes') = true then lds_ctx_fee_sched_hdr.setitem(ll_row,'notes',lds_fee_schedules.getitemstring(i,'notes'))
//			*/
//			lds_providers.setfilter("fee_sched_id = " + string(ll_fee_sched_id1))
//			lds_providers.filter()
//			gnv_debug.of_output(false, 'fee_schedule copy. 3')
//			For j = 1 To lds_providers.rowcount()	
//				If j = 1 Then 
//					ll_record_id20 = gnv_app.of_get_id('RECORD_ID', lds_providers.rowcount())
//				End If
//				ll_record_id2 = ll_record_id20 + j - 1						
//				
//				ll_row = lds_ctx_fee_sched_pracs.insertrow(0)
//				lds_ctx_fee_sched_pracs.setitem(ll_row,'fee_sched_id',ll_fee_sched_id)
//				lds_ctx_fee_sched_pracs.setitem(ll_row,'record_id',ll_record_id2)								
//				lds_ctx_fee_sched_pracs.setitem(ll_row,'practitioner_id',lds_providers.getitemnumber(j,'practitioner_id'))
//			Next
//			gnv_debug.of_output(false, 'fee_schedule copy. 40 ')
//			lds_fee_schedule_locations.setfilter("fee_sched_id = " + string(ll_fee_sched_id1))
//			lds_fee_schedule_locations.filter()
//			gnv_debug.of_output(false, 'fee_schedule copy. 41 ')
//			For j = 1 To lds_fee_schedule_locations.rowcount()
//				ll_fee_sched_location_id1 = lds_fee_schedule_locations.getitemnumber(j,'fee_sched_location_id')
//				If j = 1 Then 
//					ll_record_id30 = gnv_app.of_get_id('RECORD_ID', lds_fee_schedule_locations.rowcount())
//				End If
//				ll_record_id3 = ll_record_id30 + j - 1							
//				gnv_debug.of_output(false, 'fee_schedule copy. 51 ')
//				ll_row = lds_ctx_fee_sched_locations.insertrow(0)
//				lds_ctx_fee_sched_locations.setitem(ll_row,'fee_sched_location_id',ll_fee_sched_location_id)
//				lds_ctx_fee_sched_locations.setitem(ll_row,'fee_sched_id',ll_fee_sched_id)
//				lds_ctx_fee_sched_locations.setitem(ll_row,'record_id',ll_record_id3)
//				if of_check_unselect_fields(27,'ctx_fee_sched_locations ','location') = true then lds_ctx_fee_sched_locations.setitem(ll_row,'location',lds_fee_schedule_locations.getitemstring(j,'location')) //Modified By Ken.Guo 2017-05-31 change getitemnumber to getitemstring
//				if of_check_unselect_fields(27,'ctx_fee_sched_locations ','rate') = true then lds_ctx_fee_sched_locations.setitem(ll_row,'rate',lds_fee_schedule_locations.getitemdecimal(j,'rate'))
//				if of_check_unselect_fields(27,'ctx_fee_sched_locations ','fee_bonus') = true then lds_ctx_fee_sched_locations.setitem(ll_row,'fee_bonus',lds_fee_schedule_locations.getitemnumber(j,'fee_bonus'))
//				gnv_debug.of_output(false, 'fee_schedule copy. 52 ')
//				ls_inserted_by_user_arr[]  = ls_arr_empty[]
//				ll_fee_sched_location_id_arr[] = ll_arr_empty[]
//				ldt_inserted_at_date_time_arr[] = ldt_arr_empty[]
//				ll_fee_sched_data_id_arr[] = ll_arr_empty[]
//				ll_record_id4_arr[] = ll_arr_empty[]
//				lds_fees.setfilter("fee_sched_location_id = " + string(ll_fee_sched_location_id1))
//				lds_fees.filter()
//				gnv_debug.of_output(false, 'fee_schedule copy. 53 ')
//				For k = 1 To lds_fees.rowcount()		
//					If k = 1 Then 
//						ll_record_id40 = gnv_app.of_get_id('RECORD_ID', lds_fees.rowcount())
//					End If
//					ll_record_id4 = ll_record_id40 + k - 1			
//					ll_row = lds_ctx_fee_sched_data.insertrow(0)
//					//lds_ctx_fee_sched_data.setitem(ll_row,'fee_sched_data_id',ll_fee_sched_data_id)
//					//lds_ctx_fee_sched_data.setitem(ll_row,'fee_sched_location_id',ll_fee_sched_location_id)
//					//lds_ctx_fee_sched_data.setitem(ll_row,'record_id',ll_record_id4)
//					
//					ls_inserted_by_user_arr[k] = gs_user_id
//					ll_fee_sched_data_id_arr[k] = ll_fee_sched_data_id
//					ll_fee_sched_location_id_arr[k] = ll_fee_sched_location_id
//					ldt_inserted_at_date_time_arr[k] = datetime(today())
//					ll_record_id4_arr[k] = ll_record_id4
//					/*
//					if of_check_unselect_fields(28,'ctx_fee_sched_data ','cpt_code') = true then lds_ctx_fee_sched_data.setitem(ll_row,'cpt_code',lds_fees.getitemstring(k,'cpt_code'))
//					if of_check_unselect_fields(28,'ctx_fee_sched_data ','fee') = true then lds_ctx_fee_sched_data.setitem(ll_row,'fee',lds_fees.getitemdecimal(k,'fee'))
//					if of_check_unselect_fields(28,'ctx_fee_sched_data ','office_fee') = true then lds_ctx_fee_sched_data.setitem(ll_row,'office_fee',lds_fees.getitemdecimal(k,'office_fee'))
//					if of_check_unselect_fields(28,'ctx_fee_sched_data ','facility_fee') = true then lds_ctx_fee_sched_data.setitem(ll_row,'facility_fee',lds_fees.getitemdecimal(k,'facility_fee'))
//					if of_check_unselect_fields(28,'ctx_fee_sched_data ','custom_fee') = true then lds_ctx_fee_sched_data.setitem(ll_row,'custom_fee',lds_fees.getitemdecimal(k,'custom_fee'))
//					if of_check_unselect_fields(28,'ctx_fee_sched_data ','precert') = true then lds_ctx_fee_sched_data.setitem(ll_row,'precert',lds_fees.getitemnumber(k,'precert'))
//					if of_check_unselect_fields(28,'ctx_fee_sched_data ','preauth') = true then lds_ctx_fee_sched_data.setitem(ll_row,'preauth',lds_fees.getitemnumber(k,'preauth'))
//					if of_check_unselect_fields(28,'ctx_fee_sched_data ','effective_date') = true then lds_ctx_fee_sched_data.setitem(ll_row,'effective_date',lds_fees.getitemdatetime(k,'effective_date'))
//					if of_check_unselect_fields(28,'ctx_fee_sched_data ','expiration_date') = true then lds_ctx_fee_sched_data.setitem(ll_row,'expiration_date',lds_fees.getitemdatetime(k,'expiration_date'))
//					if of_check_unselect_fields(28,'ctx_fee_sched_data ','status') = true then lds_ctx_fee_sched_data.setitem(ll_row,'status',lds_fees.getitemnumber(k,'status'))
//					if of_check_unselect_fields(28,'ctx_fee_sched_data ','drg_code') = true then lds_ctx_fee_sched_data.setitem(ll_row,'drg_code',lds_fees.getitemstring(k,'drg_code'))
//					if of_check_unselect_fields(28,'ctx_fee_sched_data ','rev_code') = true then lds_ctx_fee_sched_data.setitem(ll_row,'rev_code',lds_fees.getitemstring(k,'rev_code'))
//					if of_check_unselect_fields(28,'ctx_fee_sched_data ','claim_type') = true then lds_ctx_fee_sched_data.setitem(ll_row,'claim_type',lds_fees.getitemnumber(k,'claim_type'))
//					if of_check_unselect_fields(28,'ctx_fee_sched_data ','flat_fee') = true then lds_ctx_fee_sched_data.setitem(ll_row,'flat_fee',lds_fees.getitemnumber(k,'flat_fee'))
//					if of_check_unselect_fields(28,'ctx_fee_sched_data ','cpt_code_set') = true then lds_ctx_fee_sched_data.setitem(ll_row,'cpt_code_set',lds_fees.getitemnumber(k,'cpt_code_set'))
//					if of_check_unselect_fields(28,'ctx_fee_sched_data ','reimburse_type') = true then lds_ctx_fee_sched_data.setitem(ll_row,'reimburse_type',lds_fees.getitemnumber(k,'reimburse_type'))
//					if of_check_unselect_fields(28,'ctx_fee_sched_data ','disc_start_perc') = true then lds_ctx_fee_sched_data.setitem(ll_row,'disc_start_perc',lds_fees.getitemnumber(k,'disc_start_perc'))
//					if of_check_unselect_fields(28,'ctx_fee_sched_data ','end_day') = true then lds_ctx_fee_sched_data.setitem(ll_row,'end_day',lds_fees.getitemnumber(k,'end_day'))
//					if of_check_unselect_fields(28,'ctx_fee_sched_data ','carve_out_day') = true then lds_ctx_fee_sched_data.setitem(ll_row,'carve_out_day',lds_fees.getitemnumber(k,'carve_out_day'))
//					if of_check_unselect_fields(28,'ctx_fee_sched_data ','sl_threshold') = true then lds_ctx_fee_sched_data.setitem(ll_row,'sl_threshold',lds_fees.getitemdecimal(k,'sl_threshold'))
//					if of_check_unselect_fields(28,'ctx_fee_sched_data ','sl_reimburse_type') = true then lds_ctx_fee_sched_data.setitem(ll_row,'sl_reimburse_type',lds_fees.getitemnumber(k,'sl_reimburse_type'))
//					if of_check_unselect_fields(28,'ctx_fee_sched_data ','sl_rate') = true then lds_ctx_fee_sched_data.setitem(ll_row,'sl_rate',lds_fees.getitemdecimal(k,'sl_rate'))
//					if of_check_unselect_fields(28,'ctx_fee_sched_data ','custom_1') = true then lds_ctx_fee_sched_data.setitem(ll_row,'custom_1',lds_fees.getitemstring(k,'custom_1'))
//					if of_check_unselect_fields(28,'ctx_fee_sched_data ','custom_2') = true then lds_ctx_fee_sched_data.setitem(ll_row,'custom_2',lds_fees.getitemstring(k,'custom_2'))
//					if of_check_unselect_fields(28,'ctx_fee_sched_data ','inserted_by_user') = true then lds_ctx_fee_sched_data.setitem(ll_row,'inserted_by_user',gs_user_id)
//					if of_check_unselect_fields(28,'ctx_fee_sched_data ','inserted_at_date_time') = true then lds_ctx_fee_sched_data.setitem(ll_row,'inserted_at_date_time',today())		
//					*/
//					ll_fee_sched_data_id++
//				Next		
//				gnv_debug.of_output(false, 'fee_schedule copy.6 ')
//				If  lds_fees.rowcount() > 0 Then
//					//lds_ctx_fee_sched_data.setitem(ll_row,'fee_sched_location_id',ll_fee_sched_location_id)
//					lds_ctx_fee_sched_data.object.fee_sched_location_id[ll_row -  lds_fees.rowcount() + 1 , ll_row ] = ll_fee_sched_location_id_arr[]
//					//lds_ctx_fee_sched_data.setitem(ll_row,'fee_sched_data_id',ll_fee_sched_data_id)
//					lds_ctx_fee_sched_data.object.fee_sched_data_id[ll_row -  lds_fees.rowcount() + 1 , ll_row ] = ll_fee_sched_data_id_arr[]
//					//lds_ctx_fee_sched_data.setitem(ll_row,'record_id',ll_record_id4)
//					lds_ctx_fee_sched_data.object.record_id[ll_row -  lds_fees.rowcount() + 1 , ll_row ] = ll_record_id4_arr[]				
//					if of_check_unselect_fields(28,'ctx_fee_sched_data ','cpt_code') = true then 
//						//lds_ctx_fee_sched_data.setitem(ll_row,'cpt_code',lds_fees.getitemstring(k,'cpt_code'))
//						lds_ctx_fee_sched_data.object.cpt_code[ll_row -  lds_fees.rowcount() + 1 , ll_row ] = lds_fees.object.cpt_code[1,  lds_fees.rowcount()]
//					End If
//					if of_check_unselect_fields(28,'ctx_fee_sched_data ','fee') = true then
//						//lds_ctx_fee_sched_data.setitem(ll_row,'fee',lds_fees.getitemdecimal(k,'fee'))
//						lds_ctx_fee_sched_data.object.fee[ll_row -  lds_fees.rowcount() + 1 , ll_row ] = lds_fees.object.fee[1,  lds_fees.rowcount()]
//					end if
//					if of_check_unselect_fields(28,'ctx_fee_sched_data ','office_fee') = true then 
//						//lds_ctx_fee_sched_data.setitem(ll_row,'office_fee',lds_fees.getitemdecimal(k,'office_fee'))
//						lds_ctx_fee_sched_data.object.office_fee[ll_row -  lds_fees.rowcount() + 1 , ll_row ] = lds_fees.object.office_fee[1,  lds_fees.rowcount()]
//					end if
//					if of_check_unselect_fields(28,'ctx_fee_sched_data ','facility_fee') = true then
//						//lds_ctx_fee_sched_data.setitem(ll_row,'facility_fee',lds_fees.getitemdecimal(k,'facility_fee'))
//						lds_ctx_fee_sched_data.object.facility_fee[ll_row -  lds_fees.rowcount() + 1 , ll_row ] = lds_fees.object.facility_fee[1,  lds_fees.rowcount()]
//					end if
//					if of_check_unselect_fields(28,'ctx_fee_sched_data ','custom_fee') = true then
//						//lds_ctx_fee_sched_data.setitem(ll_row,'custom_fee',lds_fees.getitemdecimal(k,'custom_fee'))
//						lds_ctx_fee_sched_data.object.custom_fee[ll_row -  lds_fees.rowcount() + 1 , ll_row ] = lds_fees.object.custom_fee[1,  lds_fees.rowcount()]
//					end If
//					if of_check_unselect_fields(28,'ctx_fee_sched_data ','precert') = true then 
//						//lds_ctx_fee_sched_data.setitem(ll_row,'precert',lds_fees.getitemnumber(k,'precert'))
//						lds_ctx_fee_sched_data.object.precert[ll_row -  lds_fees.rowcount() + 1 , ll_row ] = lds_fees.object.precert[1,  lds_fees.rowcount()]
//					end if
//					if of_check_unselect_fields(28,'ctx_fee_sched_data ','preauth') = true then 
//						//lds_ctx_fee_sched_data.setitem(ll_row,'preauth',lds_fees.getitemnumber(k,'preauth'))
//						lds_ctx_fee_sched_data.object.preauth[ll_row -  lds_fees.rowcount() + 1 , ll_row ] = lds_fees.object.preauth[1,  lds_fees.rowcount()]
//					end if
//					if of_check_unselect_fields(28,'ctx_fee_sched_data ','effective_date') = true then 
//						//lds_ctx_fee_sched_data.setitem(ll_row,'effective_date',lds_fees.getitemdatetime(k,'effective_date'))
//						lds_ctx_fee_sched_data.object.effective_date[ll_row -  lds_fees.rowcount() + 1 , ll_row ] = lds_fees.object.effective_date[1,  lds_fees.rowcount()]
//					end if
//					if of_check_unselect_fields(28,'ctx_fee_sched_data ','expiration_date') = true then 
//						//lds_ctx_fee_sched_data.setitem(ll_row,'expiration_date',lds_fees.getitemdatetime(k,'expiration_date'))
//						lds_ctx_fee_sched_data.object.expiration_date[ll_row -  lds_fees.rowcount() + 1 , ll_row ] = lds_fees.object.expiration_date[1,  lds_fees.rowcount()]
//					end if
//					if of_check_unselect_fields(28,'ctx_fee_sched_data ','status') = true then 
//						//lds_ctx_fee_sched_data.setitem(ll_row,'status',lds_fees.getitemnumber(k,'status'))
//						lds_ctx_fee_sched_data.object.status[ll_row -  lds_fees.rowcount() + 1 , ll_row ] = lds_fees.object.status[1,  lds_fees.rowcount()]
//					end if
//					if of_check_unselect_fields(28,'ctx_fee_sched_data ','drg_code') = true then 
//						//lds_ctx_fee_sched_data.setitem(ll_row,'drg_code',lds_fees.getitemstring(k,'drg_code'))
//						lds_ctx_fee_sched_data.object.drg_code[ll_row -  lds_fees.rowcount() + 1 , ll_row ] = lds_fees.object.drg_code[1,  lds_fees.rowcount()]
//					end if
//					if of_check_unselect_fields(28,'ctx_fee_sched_data ','rev_code') = true then 
//						//lds_ctx_fee_sched_data.setitem(ll_row,'rev_code',lds_fees.getitemstring(k,'rev_code'))
//						lds_ctx_fee_sched_data.object.rev_code[ll_row -  lds_fees.rowcount() + 1 , ll_row ] = lds_fees.object.rev_code[1,  lds_fees.rowcount()]
//					end if
//					if of_check_unselect_fields(28,'ctx_fee_sched_data ','claim_type') = true then 
//						//lds_ctx_fee_sched_data.setitem(ll_row,'claim_type',lds_fees.getitemnumber(k,'claim_type'))
//						lds_ctx_fee_sched_data.object.claim_type[ll_row -  lds_fees.rowcount() + 1 , ll_row ] = lds_fees.object.claim_type[1,  lds_fees.rowcount()]
//					end if
//					if of_check_unselect_fields(28,'ctx_fee_sched_data ','flat_fee') = true then 
//						//lds_ctx_fee_sched_data.setitem(ll_row,'flat_fee',lds_fees.getitemnumber(k,'flat_fee'))
//						lds_ctx_fee_sched_data.object.flat_fee[ll_row -  lds_fees.rowcount() + 1 , ll_row ] = lds_fees.object.flat_fee[1,  lds_fees.rowcount()]
//					end if
//					if of_check_unselect_fields(28,'ctx_fee_sched_data ','cpt_code_set') = true then 
//						//lds_ctx_fee_sched_data.setitem(ll_row,'cpt_code_set',lds_fees.getitemnumber(k,'cpt_code_set'))
//						lds_ctx_fee_sched_data.object.cpt_code_set[ll_row -  lds_fees.rowcount() + 1 , ll_row ] = lds_fees.object.cpt_code_set[1,  lds_fees.rowcount()]
//					end if
//					if of_check_unselect_fields(28,'ctx_fee_sched_data ','reimburse_type') = true then 
//						//lds_ctx_fee_sched_data.setitem(ll_row,'reimburse_type',lds_fees.getitemnumber(k,'reimburse_type'))
//						lds_ctx_fee_sched_data.object.reimburse_type[ll_row -  lds_fees.rowcount() + 1 , ll_row ] = lds_fees.object.reimburse_type[1,  lds_fees.rowcount()]
//					end if
//					if of_check_unselect_fields(28,'ctx_fee_sched_data ','disc_start_perc') = true then 
//						//lds_ctx_fee_sched_data.setitem(ll_row,'disc_start_perc',lds_fees.getitemnumber(k,'disc_start_perc'))
//						lds_ctx_fee_sched_data.object.disc_start_perc[ll_row -  lds_fees.rowcount() + 1 , ll_row ] = lds_fees.object.disc_start_perc[1,  lds_fees.rowcount()]
//					end if
//					if of_check_unselect_fields(28,'ctx_fee_sched_data ','end_day') = true then 
//						//lds_ctx_fee_sched_data.setitem(ll_row,'end_day',lds_fees.getitemnumber(k,'end_day'))
//						lds_ctx_fee_sched_data.object.end_day[ll_row -  lds_fees.rowcount() + 1 , ll_row ] = lds_fees.object.end_day[1,  lds_fees.rowcount()]
//					end if
//					if of_check_unselect_fields(28,'ctx_fee_sched_data ','carve_out_day') = true then 
//						//lds_ctx_fee_sched_data.setitem(ll_row,'carve_out_day',lds_fees.getitemnumber(k,'carve_out_day'))
//						lds_ctx_fee_sched_data.object.carve_out_day[ll_row -  lds_fees.rowcount() + 1 , ll_row ] = lds_fees.object.carve_out_day[1,  lds_fees.rowcount()]
//					end if
//					if of_check_unselect_fields(28,'ctx_fee_sched_data ','sl_threshold') = true then 
//						//lds_ctx_fee_sched_data.setitem(ll_row,'sl_threshold',lds_fees.getitemdecimal(k,'sl_threshold'))
//						lds_ctx_fee_sched_data.object.sl_threshold[ll_row -  lds_fees.rowcount() + 1 , ll_row ] = lds_fees.object.sl_threshold[1,  lds_fees.rowcount()]
//					end if
//					if of_check_unselect_fields(28,'ctx_fee_sched_data ','sl_reimburse_type') = true then 
//						//lds_ctx_fee_sched_data.setitem(ll_row,'sl_reimburse_type',lds_fees.getitemnumber(k,'sl_reimburse_type'))
//						lds_ctx_fee_sched_data.object.sl_reimburse_type[ll_row -  lds_fees.rowcount() + 1 , ll_row ] = lds_fees.object.sl_reimburse_type[1,  lds_fees.rowcount()]
//					end if
//					if of_check_unselect_fields(28,'ctx_fee_sched_data ','sl_rate') = true then 
//						//lds_ctx_fee_sched_data.setitem(ll_row,'sl_rate',lds_fees.getitemdecimal(k,'sl_rate'))
//						lds_ctx_fee_sched_data.object.sl_rate[ll_row -  lds_fees.rowcount() + 1 , ll_row ] = lds_fees.object.sl_rate[1,  lds_fees.rowcount()]
//					end if
//					if of_check_unselect_fields(28,'ctx_fee_sched_data ','custom_1') = true then 
//						//lds_ctx_fee_sched_data.setitem(ll_row,'custom_1',lds_fees.getitemstring(k,'custom_1'))
//						lds_ctx_fee_sched_data.object.custom_1[ll_row -  lds_fees.rowcount() + 1 , ll_row ] = lds_fees.object.custom_1[1,  lds_fees.rowcount()]
//					end if
//					if of_check_unselect_fields(28,'ctx_fee_sched_data ','custom_2') = true then 
//						//lds_ctx_fee_sched_data.setitem(ll_row,'custom_2',lds_fees.getitemstring(k,'custom_2'))
//						lds_ctx_fee_sched_data.object.custom_2[ll_row -  lds_fees.rowcount() + 1 , ll_row ] = lds_fees.object.custom_2[1,  lds_fees.rowcount()]
//					end if
//					if of_check_unselect_fields(28,'ctx_fee_sched_data ','custom_3') = true then 
//						//lds_ctx_fee_sched_data.setitem(ll_row,'custom_1',lds_fees.getitemstring(k,'custom_3'))
//						lds_ctx_fee_sched_data.object.custom_3[ll_row -  lds_fees.rowcount() + 1 , ll_row ] = lds_fees.object.custom_3[1,  lds_fees.rowcount()]
//					end if
//					if of_check_unselect_fields(28,'ctx_fee_sched_data ','custom_4') = true then 
//						//lds_ctx_fee_sched_data.setitem(ll_row,'custom_4',lds_fees.getitemstring(k,'custom_4'))
//						lds_ctx_fee_sched_data.object.custom_4[ll_row -  lds_fees.rowcount() + 1 , ll_row ] = lds_fees.object.custom_4[1,  lds_fees.rowcount()]
//					end if				
//					if of_check_unselect_fields(28,'ctx_fee_sched_data ','custom_5') = true then 
//						//lds_ctx_fee_sched_data.setitem(ll_row,'custom_5',lds_fees.getitemstring(k,'custom_5'))
//						lds_ctx_fee_sched_data.object.custom_5[ll_row -  lds_fees.rowcount() + 1 , ll_row ] = lds_fees.object.custom_5[1,  lds_fees.rowcount()]
//					end if					
//					if of_check_unselect_fields(28,'ctx_fee_sched_data ','inserted_by_user') = true then 
//						//lds_ctx_fee_sched_data.setitem(ll_row,'inserted_by_user',gs_user_id)
//						lds_ctx_fee_sched_data.object.inserted_by_user[ll_row -  lds_fees.rowcount() + 1 , ll_row ] = ls_inserted_by_user_arr[]
//					end if
//					if of_check_unselect_fields(28,'ctx_fee_sched_data ','inserted_at_date_time') = true then 
//						//lds_ctx_fee_sched_data.setitem(ll_row,'inserted_at_date_time',today())	
//						lds_ctx_fee_sched_data.object.inserted_at_date_time[ll_row -  lds_fees.rowcount() + 1 , ll_row ] = ldt_inserted_at_date_time_arr[]
//					end if
//				end if
//				gnv_debug.of_output(false, 'fee_schedule copy. 61 ')
//				
//				
//				ll_fee_sched_location_id++
//			Next			
//			ll_fee_sched_id++
//			lb_copy = True
//		Next
//		
//		If lds_fee_schedules.rowcount() > 0 Then
//			gnv_debug.of_output(false, 'fee_schedule copy. 7 ')
//			//lds_ctx_fee_sched_hdr.setitem(ll_row,'fee_sched_id',ll_fee_sched_id)
//			lds_ctx_fee_sched_hdr.object.fee_sched_id[1 , lds_fee_schedules.rowcount() ] = ll_fee_sched_id_arr[]
//			//lds_ctx_fee_sched_hdr.setitem(ll_row,'ctx_id',ll_ctx_id)
//			lds_ctx_fee_sched_hdr.object.ctx_id[1 , lds_fee_schedules.rowcount() ] = ll_ctx_id_arr[]
//			//lds_ctx_fee_sched_hdr.setitem(ll_row,'record_id',ll_record_id1)		
//			lds_ctx_fee_sched_hdr.object.record_id[1 , lds_fee_schedules.rowcount() ] = ll_record_id1_arr[]
//			if of_check_unselect_fields(0,'ctx_fee_sched_hdr ','sched_type') = true then 
//				//lds_ctx_fee_sched_hdr.setitem(ll_row,'sched_type',lds_fee_schedules.getitemnumber(i,'sched_type'))
//				lds_ctx_fee_sched_hdr.object.sched_type[1 , lds_fee_schedules.rowcount() ] = lds_fee_schedules.object.sched_type[1,  lds_fee_schedules.rowcount()]
//			end if
//			if of_check_unselect_fields(0,'ctx_fee_sched_hdr ','carve_out_type') = true then 
//				//lds_ctx_fee_sched_hdr.setitem(ll_row,'carve_out_type',lds_fee_schedules.getitemnumber(i,'carve_out_type'))
//				lds_ctx_fee_sched_hdr.object.carve_out_type[1 , lds_fee_schedules.rowcount() ] = lds_fee_schedules.object.carve_out_type[1,  lds_fee_schedules.rowcount()]
//			end if
//			if of_check_unselect_fields(0,'ctx_fee_sched_hdr ','custom_1') = true then 
//				//lds_ctx_fee_sched_hdr.setitem(ll_row,'custom_1',lds_fee_schedules.getitemstring(i,'custom_1'))
//				lds_ctx_fee_sched_hdr.object.custom_1[1 , lds_fee_schedules.rowcount() ] = lds_fee_schedules.object.custom_1[1,  lds_fee_schedules.rowcount()]
//			end if
//			if of_check_unselect_fields(0,'ctx_fee_sched_hdr ','custom_2') = true then 
//				//lds_ctx_fee_sched_hdr.setitem(ll_row,'custom_2',lds_fee_schedules.getitemstring(i,'custom_2'))
//				lds_ctx_fee_sched_hdr.object.custom_2[1 , lds_fee_schedules.rowcount() ] = lds_fee_schedules.object.custom_2[1,  lds_fee_schedules.rowcount()]
//			end if
//			if of_check_unselect_fields(0,'ctx_fee_sched_hdr ','custom_3') = true then 
//				//lds_ctx_fee_sched_hdr.setitem(ll_row,'custom_3',lds_fee_schedules.getitemstring(i,'custom_3'))
//				lds_ctx_fee_sched_hdr.object.custom_3[1 , lds_fee_schedules.rowcount() ] = lds_fee_schedules.object.custom_3[1,  lds_fee_schedules.rowcount()]
//			end if
//			if of_check_unselect_fields(0,'ctx_fee_sched_hdr ','custom_4') = true then 
//				//lds_ctx_fee_sched_hdr.setitem(ll_row,'custom_4',lds_fee_schedules.getitemstring(i,'custom_4'))
//				lds_ctx_fee_sched_hdr.object.custom_4[1 , lds_fee_schedules.rowcount() ] = lds_fee_schedules.object.custom_4[1,  lds_fee_schedules.rowcount()]
//			end if
//			if of_check_unselect_fields(0,'ctx_fee_sched_hdr ','custom_5') = true then 
//				//lds_ctx_fee_sched_hdr.setitem(ll_row,'custom_5',lds_fee_schedules.getitemstring(i,'custom_5'))
//				lds_ctx_fee_sched_hdr.object.custom_5[1 , lds_fee_schedules.rowcount() ] = lds_fee_schedules.object.custom_5[1,  lds_fee_schedules.rowcount()]
//			end if		
//			if of_check_unselect_fields(0,'ctx_fee_sched_hdr ','notes') = true then 
//				//lds_ctx_fee_sched_hdr.setitem(ll_row,'notes',lds_fee_schedules.getitemstring(i,'notes'))
//				lds_ctx_fee_sched_hdr.object.notes[1 , lds_fee_schedules.rowcount() ] = lds_fee_schedules.object.notes[1,  lds_fee_schedules.rowcount()]
//			end if
//			gnv_debug.of_output(false, 'fee_schedule copy. 71 ')
//		End If
//		
//		
		f_create_contract_ds (ll_view, 31, lds_dync_detail)  //Added by Harry 20170621 Create Fee Schedule (NM) from current screen
		lds_fee_schedules2.retrieve(astr_copy_ctx.sl_ctx_id)
		For i = 1 To lds_fee_schedules2.rowcount()			
			ll_record_id = gnv_app.of_get_id('RECORD_ID')
			ll_row = lds_ctx_fee_sched_nm.insertrow(0)
			
			lds_ctx_fee_sched_nm.setitem(ll_row,'ctx_id',ll_ctx_id)
			lds_ctx_fee_sched_nm.setitem(ll_row,'record_id',ll_record_id)
			lds_ctx_fee_sched_nm.setitem(ll_row,'fee_sched_nm_id',lds_fee_schedules2.getitemnumber(i,'fee_sched_nm_id'))
			
			if of_check_unselect_fields(31,'ctx_fee_sched_nm ','billing_cycle') = true then of_set_value(lds_dync_detail, 'billing_cycle', lds_ctx_fee_sched_nm, ll_row, lds_fee_schedules2, i, 'N')	//Modified by harry 20170621   lds_ctx_fee_sched_nm.setitem(ll_row,'billing_cycle',lds_fee_schedules2.getitemnumber(i,'billing_cycle'))
			if of_check_unselect_fields(31,'ctx_fee_sched_nm ','category') = true then of_set_value(lds_dync_detail, 'category', lds_ctx_fee_sched_nm, ll_row, lds_fee_schedules2, i, 'N')	//Modified by harry 20170621   lds_ctx_fee_sched_nm.setitem(ll_row,'category',lds_fee_schedules2.getitemnumber(i,'category'))
			if of_check_unselect_fields(31,'ctx_fee_sched_nm ','service_item') = true then of_set_value(lds_dync_detail, 'service_item', lds_ctx_fee_sched_nm, ll_row, lds_fee_schedules2, i, 'N')	//Modified by harry 20170621   lds_ctx_fee_sched_nm.setitem(ll_row,'service_item',lds_fee_schedules2.getitemnumber(i,'service_item'))			
			if of_check_unselect_fields(31,'ctx_fee_sched_nm ','description') = true then of_set_value(lds_dync_detail, 'description', lds_ctx_fee_sched_nm, ll_row, lds_fee_schedules2, i, 'C')	//Modified by harry 20170621   lds_ctx_fee_sched_nm.setitem(ll_row,'description',lds_fee_schedules2.getitemstring(i,'description'))
			if of_check_unselect_fields(31,'ctx_fee_sched_nm ','fee') = true then of_set_value(lds_dync_detail, 'fee', lds_ctx_fee_sched_nm, ll_row, lds_fee_schedules2, i, 'DEC')	//Modified by harry 20170621   lds_ctx_fee_sched_nm.setitem(ll_row,'fee',lds_fee_schedules2.getitemdecimal(i,'fee'))
			if of_check_unselect_fields(31,'ctx_fee_sched_nm ','item_status') = true then of_set_value(lds_dync_detail, 'item_status', lds_ctx_fee_sched_nm, ll_row, lds_fee_schedules2, i, 'N')	//Modified by harry 20170621   lds_ctx_fee_sched_nm.setitem(ll_row,'item_status',lds_fee_schedules2.getitemnumber(i,'item_status'))
			if of_check_unselect_fields(31,'ctx_fee_sched_nm ','start_date') = true then of_set_value(lds_dync_detail, 'start_date', lds_ctx_fee_sched_nm, ll_row, lds_fee_schedules2, i, 'DT')	//Modified by harry 20170621   lds_ctx_fee_sched_nm.setitem(ll_row,'start_date',lds_fee_schedules2.getitemdatetime(i,'start_date'))
			if of_check_unselect_fields(31,'ctx_fee_sched_nm ','end_date') = true then of_set_value(lds_dync_detail, 'end_date', lds_ctx_fee_sched_nm, ll_row, lds_fee_schedules2, i, 'DT')	//Modified by harry 20170621   lds_ctx_fee_sched_nm.setitem(ll_row,'end_date',lds_fee_schedules2.getitemdatetime(i,'end_date'))
			if of_check_unselect_fields(31,'ctx_fee_sched_nm ','custom_fee1') = true then of_set_value(lds_dync_detail, 'custom_fee1', lds_ctx_fee_sched_nm, ll_row, lds_fee_schedules2, i, 'DEC')	//Modified by harry 20170621   lds_ctx_fee_sched_nm.setitem(ll_row,'custom_fee1',lds_fee_schedules2.getitemdecimal(i,'custom_fee1'))
			if of_check_unselect_fields(31,'ctx_fee_sched_nm ','custom_fee2') = true then of_set_value(lds_dync_detail, 'custom_fee2', lds_ctx_fee_sched_nm, ll_row, lds_fee_schedules2, i, 'DEC')	//Modified by harry 20170621   lds_ctx_fee_sched_nm.setitem(ll_row,'custom_fee2',lds_fee_schedules2.getitemdecimal(i,'custom_fee2'))
			if of_check_unselect_fields(31,'ctx_fee_sched_nm ','custom_fee3') = true then of_set_value(lds_dync_detail, 'custom_fee3', lds_ctx_fee_sched_nm, ll_row, lds_fee_schedules2, i, 'DEC')	//Modified by harry 20170621   lds_ctx_fee_sched_nm.setitem(ll_row,'custom_fee3',lds_fee_schedules2.getitemdecimal(i,'custom_fee3'))
			if of_check_unselect_fields(31,'ctx_fee_sched_nm ','custom_int1') = true then of_set_value(lds_dync_detail, 'custom_int1', lds_ctx_fee_sched_nm, ll_row, lds_fee_schedules2, i, 'N')	//Modified by harry 20170621   lds_ctx_fee_sched_nm.setitem(ll_row,'custom_int1',lds_fee_schedules2.getitemnumber(i,'custom_int1'))
			if of_check_unselect_fields(31,'ctx_fee_sched_nm ','custom_int2') = true then of_set_value(lds_dync_detail, 'custom_int2', lds_ctx_fee_sched_nm, ll_row, lds_fee_schedules2, i, 'N')	//Modified by harry 20170621   lds_ctx_fee_sched_nm.setitem(ll_row,'custom_int2',lds_fee_schedules2.getitemnumber(i,'custom_int2'))				//Added By Mark Lee 11/24/2015
			if of_check_unselect_fields(31,'ctx_fee_sched_nm ','custom_text1') = true then of_set_value(lds_dync_detail, 'custom_text1', lds_ctx_fee_sched_nm, ll_row, lds_fee_schedules2, i, 'C')	//Modified by harry 20170621   lds_ctx_fee_sched_nm.setitem(ll_row,'custom_text1',lds_fee_schedules2.getitemstring(i,'custom_text1'))
			if of_check_unselect_fields(31,'ctx_fee_sched_nm ','custom_text2') = true then of_set_value(lds_dync_detail, 'custom_text2', lds_ctx_fee_sched_nm, ll_row, lds_fee_schedules2, i, 'C')	//Modified by harry 20170621   lds_ctx_fee_sched_nm.setitem(ll_row,'custom_text2',lds_fee_schedules2.getitemstring(i,'custom_text2'))
			if of_check_unselect_fields(31,'ctx_fee_sched_nm ','custom_text3') = true then of_set_value(lds_dync_detail, 'custom_text3', lds_ctx_fee_sched_nm, ll_row, lds_fee_schedules2, i, 'C')	//Modified by harry 20170621   lds_ctx_fee_sched_nm.setitem(ll_row,'custom_text3',lds_fee_schedules2.getitemstring(i,'custom_text3'))
			if of_check_unselect_fields(31,'ctx_fee_sched_nm ','custom_text4') = true then of_set_value(lds_dync_detail, 'custom_text4', lds_ctx_fee_sched_nm, ll_row, lds_fee_schedules2, i, 'C')	//Modified by harry 20170621   lds_ctx_fee_sched_nm.setitem(ll_row,'custom_text4',lds_fee_schedules2.getitemstring(i,'custom_text4'))
			if of_check_unselect_fields(31,'ctx_fee_sched_nm ','custom_text5') = true then of_set_value(lds_dync_detail, 'custom_text5', lds_ctx_fee_sched_nm, ll_row, lds_fee_schedules2, i, 'C')	//Modified by harry 20170621   lds_ctx_fee_sched_nm.setitem(ll_row,'custom_text5',lds_fee_schedules2.getitemstring(i,'custom_text5'))
			if of_check_unselect_fields(31,'ctx_fee_sched_nm ','custom_text6') = true then of_set_value(lds_dync_detail, 'custom_text6', lds_ctx_fee_sched_nm, ll_row, lds_fee_schedules2, i, 'C')	//Modified by harry 20170621   lds_ctx_fee_sched_nm.setitem(ll_row,'custom_text6',lds_fee_schedules2.getitemstring(i,'custom_text6'))
			if of_check_unselect_fields(31,'ctx_fee_sched_nm ','custom_text7') = true then of_set_value(lds_dync_detail, 'custom_text7', lds_ctx_fee_sched_nm, ll_row, lds_fee_schedules2, i, 'C')	//Modified by harry 20170621   lds_ctx_fee_sched_nm.setitem(ll_row,'custom_text7',lds_fee_schedules2.getitemstring(i,'custom_text7'))				//Added By Mark Lee 11/24/2015
			if of_check_unselect_fields(31,'ctx_fee_sched_nm ','custom_text8') = true then of_set_value(lds_dync_detail, 'custom_text8', lds_ctx_fee_sched_nm, ll_row, lds_fee_schedules2, i, 'C')	//Modified by harry 20170621   lds_ctx_fee_sched_nm.setitem(ll_row,'custom_text8',lds_fee_schedules2.getitemstring(i,'custom_text8'))				//Added By Mark Lee 11/24/2015
			if of_check_unselect_fields(31,'ctx_fee_sched_nm ','custom_n1') = true then of_set_value(lds_dync_detail, 'custom_n1', lds_ctx_fee_sched_nm, ll_row, lds_fee_schedules2, i, 'DEC')	//Modified by harry 20170621   lds_ctx_fee_sched_nm.setitem(ll_row,'custom_n1',lds_fee_schedules2.getitemdecimal(i,'custom_n1'))
			if of_check_unselect_fields(31,'ctx_fee_sched_nm ','custom_n2') = true then of_set_value(lds_dync_detail, 'custom_n2', lds_ctx_fee_sched_nm, ll_row, lds_fee_schedules2, i, 'DEC')	//Modified by harry 20170621   lds_ctx_fee_sched_nm.setitem(ll_row,'custom_n2',lds_fee_schedules2.getitemdecimal(i,'custom_n2'))
			if of_check_unselect_fields(31,'ctx_fee_sched_nm ','custom_n3') = true then of_set_value(lds_dync_detail, 'custom_n3', lds_ctx_fee_sched_nm, ll_row, lds_fee_schedules2, i, 'DEC')	//Modified by harry 20170621   lds_ctx_fee_sched_nm.setitem(ll_row,'custom_n3',lds_fee_schedules2.getitemdecimal(i,'custom_n3'))
			if of_check_unselect_fields(31,'ctx_fee_sched_nm ','custom_n4') = true then of_set_value(lds_dync_detail, 'custom_n4', lds_ctx_fee_sched_nm, ll_row, lds_fee_schedules2, i, 'DEC')	//Modified by harry 20170621   lds_ctx_fee_sched_nm.setitem(ll_row,'custom_n4',lds_fee_schedules2.getitemdecimal(i,'custom_n4'))
			if of_check_unselect_fields(31,'ctx_fee_sched_nm ','custom_n5') = true then of_set_value(lds_dync_detail, 'custom_n5', lds_ctx_fee_sched_nm, ll_row, lds_fee_schedules2, i, 'DEC')	//Modified by harry 20170621   lds_ctx_fee_sched_nm.setitem(ll_row,'custom_n5',lds_fee_schedules2.getitemdecimal(i,'custom_n5'))
			
//			//Commented By Ken.Guo 2016-05-27
//			//Added By Jay Chen 03-09-2016
//			for ll_cnt = 6 to 15
//				ls_colname = 'custom_n' + string(ll_cnt)
//				if of_check_unselect_fields(31,'ctx_fee_sched_nm',ls_colname) = true then lds_ctx_fee_sched_nm.setitem(ll_row,ls_colname,lds_fee_schedules2.getitemdecimal(i,ls_colname))
//			next
			
			//end
			if of_check_unselect_fields(31,'ctx_fee_sched_nm ','notes') = true then of_set_value(lds_dync_detail, 'notes', lds_ctx_fee_sched_nm, ll_row, lds_fee_schedules2, i, 'C')	//Modified by harry 20170621    lds_ctx_fee_sched_nm.setitem(ll_row,'notes',lds_fee_schedules2.getitemstring(i,'notes'))					
			//Added By Mark Lee 11/24/2015
			if of_check_unselect_fields(31,'ctx_fee_sched_nm ','custom_date1') = true then of_set_value(lds_dync_detail, 'custom_date1', lds_ctx_fee_sched_nm, ll_row, lds_fee_schedules2, i, 'DT')	//Modified by harry 20170621    lds_ctx_fee_sched_nm.setitem(ll_row,'custom_date1',lds_fee_schedules2.getitemdatetime(i,'custom_date1'))
			if of_check_unselect_fields(31,'ctx_fee_sched_nm ','custom_date2') = true then of_set_value(lds_dync_detail, 'custom_date2', lds_ctx_fee_sched_nm, ll_row, lds_fee_schedules2, i, 'DT')	//Modified by harry 20170621    lds_ctx_fee_sched_nm.setitem(ll_row,'custom_date2',lds_fee_schedules2.getitemdatetime(i,'custom_date2'))
			if of_check_unselect_fields(31,'ctx_fee_sched_nm ','custom_date3') = true then of_set_value(lds_dync_detail, 'custom_date3', lds_ctx_fee_sched_nm, ll_row, lds_fee_schedules2, i, 'DT')	//Modified by harry 20170621    lds_ctx_fee_sched_nm.setitem(ll_row,'custom_date3',lds_fee_schedules2.getitemdatetime(i,'custom_date3'))
			if of_check_unselect_fields(31,'ctx_fee_sched_nm ','custom_date4') = true then of_set_value(lds_dync_detail, 'custom_date4', lds_ctx_fee_sched_nm, ll_row, lds_fee_schedules2, i, 'DT')	//Modified by harry 20170621    lds_ctx_fee_sched_nm.setitem(ll_row,'custom_date4',lds_fee_schedules2.getitemdatetime(i,'custom_date4'))
			if of_check_unselect_fields(31,'ctx_fee_sched_nm ','custom_date5') = true then of_set_value(lds_dync_detail, 'custom_date5', lds_ctx_fee_sched_nm, ll_row, lds_fee_schedules2, i, 'DT')	//Modified by harry 20170621    lds_ctx_fee_sched_nm.setitem(ll_row,'custom_date5',lds_fee_schedules2.getitemdatetime(i,'custom_date5'))
			
			lb_copy = True
		Next			
//	End If
End If
w_appeon_gifofwait.of_setposition(50)
//If astr_copy_ctx.sb_action_items = 1 Then
If astr_copy_ctx.sb_action_items = 1 and of_get_screen_exist(ll_view, 33) Then //Modified by harry 20170622
	f_create_contract_ds (ll_view, 33, lds_dync_detail)  //Added by Harry 20170621 Create Action Items from current screen
	//Action Items
	lds_action_items.retrieve(astr_copy_ctx.sl_ctx_id)
	For i = 1 To lds_action_items.rowcount()
		ll_record_id = gnv_app.of_get_id('RECORD_ID')
		ll_row = lds_ctx_action_item.insertrow(0)		
		lds_ctx_action_item.setitem(ll_row,'ctx_id',ll_ctx_id)
		lds_ctx_action_item.setitem(ll_row,'record_id',ll_record_id)
		ll_ori_id[i] = lds_action_items.getitemnumber(i,'ctx_action_item_id')
		//lds_ctx_action_item.setitem(ll_row,'ctx_action_item_id',lds_action_items.getitemnumber(i,'ctx_action_item_id'))
		if of_check_unselect_fields(0,'ctx_action_items ','action_type') = true then of_set_value(lds_dync_detail, 'action_type', lds_ctx_action_item, ll_row, lds_action_items, i, 'N')	//Modified by harry 20170621     lds_ctx_action_item.setitem(ll_row,'action_type',lds_action_items.getitemnumber(i,'action_type'))
		if of_check_unselect_fields(0,'ctx_action_items ','due_date') = true then of_set_value(lds_dync_detail, 'due_date', lds_ctx_action_item, ll_row, lds_action_items, i, 'DT')	//Modified by harry 20170621     lds_ctx_action_item.setitem(ll_row,'due_date',lds_action_items.getitemdatetime(i,'due_date'))
		if of_check_unselect_fields(0,'ctx_action_items ','action_user') = true then of_set_value(lds_dync_detail, 'action_user', lds_ctx_action_item, ll_row, lds_action_items, i, 'C')	//Modified by harry 20170621     lds_ctx_action_item.setitem(ll_row,'action_user',lds_action_items.getitemstring(i,'action_user'))
		if of_check_unselect_fields(0,'ctx_action_items ','action_date') = true then of_set_value(lds_dync_detail, 'action_date', lds_ctx_action_item, ll_row, lds_action_items, i, 'DT')	//Modified by harry 20170621     lds_ctx_action_item.setitem(ll_row,'action_date',lds_action_items.getitemdatetime(i,'action_date'))
		if of_check_unselect_fields(0,'ctx_action_items ','action_status') = true then of_set_value(lds_dync_detail, 'action_status', lds_ctx_action_item, ll_row, lds_action_items, i, 'N')	//Modified by harry 20170621     lds_ctx_action_item.setitem(ll_row,'action_status',lds_action_items.getitemnumber(i,'action_status'))
		if of_check_unselect_fields(0,'ctx_action_items ','wf_assigned_by') = true then of_set_value(lds_dync_detail, 'wf_assigned_by', lds_ctx_action_item, ll_row, lds_action_items, i, 'C')	//Modified by harry 20170621     lds_ctx_action_item.setitem(ll_row,'wf_assigned_by',lds_action_items.getitemstring(i,'wf_assigned_by'))
		if of_check_unselect_fields(0,'ctx_action_items ','inserted_at_date_time') = true then of_set_value(lds_dync_detail, 'inserted_at_date_time', lds_ctx_action_item, ll_row, lds_action_items, i, 'DT')	//Modified by harry 20170621     lds_ctx_action_item.setitem(ll_row,'inserted_at_date_time',lds_action_items.getitemdatetime(i,'inserted_at_date_time'))
		if of_check_unselect_fields(0,'ctx_action_items ','no_attempts') = true then of_set_value(lds_dync_detail, 'no_attempts', lds_ctx_action_item, ll_row, lds_action_items, i, 'N')	//Modified by harry 20170621     lds_ctx_action_item.setitem(ll_row,'no_attempts',lds_action_items.getitemnumber(i,'no_attempts'))
		if of_check_unselect_fields(0,'ctx_action_items ','first_attempt') = true then of_set_value(lds_dync_detail, 'first_attempt', lds_ctx_action_item, ll_row, lds_action_items, i, 'DT')	//Modified by harry 20170621     lds_ctx_action_item.setitem(ll_row,'first_attempt',lds_action_items.getitemdatetime(i,'first_attempt'))
		if of_check_unselect_fields(0,'ctx_action_items ','last_attempt') = true then of_set_value(lds_dync_detail, 'last_attempt', lds_ctx_action_item, ll_row, lds_action_items, i, 'DT')	//Modified by harry 20170621     lds_ctx_action_item.setitem(ll_row,'last_attempt',lds_action_items.getitemdatetime(i,'last_attempt'))
		if of_check_unselect_fields(0,'ctx_action_items ','notes') = true then of_set_value(lds_dync_detail, 'notes', lds_ctx_action_item, ll_row, lds_action_items, i, 'C')	//Modified by harry 20170621     lds_ctx_action_item.setitem(ll_row,'notes',lds_action_items.getitemstring(i,'notes'))
		if of_check_unselect_fields(0,'ctx_action_items ','wf_step') = true then of_set_value(lds_dync_detail, 'wf_step', lds_ctx_action_item, ll_row, lds_action_items, i, 'N')	//Modified by harry 20170621     lds_ctx_action_item.setitem(ll_row,'wf_step',lds_action_items.getitemnumber(i,'wf_step'))
		if of_check_unselect_fields(0,'ctx_action_items ','wf_id') = true then of_set_value(lds_dync_detail, 'wf_id', lds_ctx_action_item, ll_row, lds_action_items, i, 'N')	//Modified by harry 20170621     lds_ctx_action_item.setitem(ll_row,'wf_id',lds_action_items.getitemnumber(i,'wf_id'))
		if of_check_unselect_fields(0,'ctx_action_items ','letter_flag') = true then of_set_value(lds_dync_detail, 'letter_flag', lds_ctx_action_item, ll_row, lds_action_items, i, 'C')	//Modified by harry 20170621     lds_ctx_action_item.setitem(ll_row,'letter_flag',lds_action_items.getitemstring(i,'letter_flag'))
		if of_check_unselect_fields(0,'ctx_action_items ','letter_to') = true then of_set_value(lds_dync_detail, 'letter_to', lds_ctx_action_item, ll_row, lds_action_items, i, 'N')	//Modified by harry 20170621     lds_ctx_action_item.setitem(ll_row,'letter_to',lds_action_items.getitemnumber(i,'letter_to'))
		if of_check_unselect_fields(0,'ctx_action_items ','letter_from') = true then of_set_value(lds_dync_detail, 'letter_from', lds_ctx_action_item, ll_row, lds_action_items, i, 'N')	//Modified by harry 20170621     lds_ctx_action_item.setitem(ll_row,'letter_from',lds_action_items.getitemnumber(i,'letter_from'))
		if of_check_unselect_fields(0,'ctx_action_items ','letter_id') = true then of_set_value(lds_dync_detail, 'letter_id', lds_ctx_action_item, ll_row, lds_action_items, i, 'N')	//Modified by harry 20170621     lds_ctx_action_item.setitem(ll_row,'letter_id',lds_action_items.getitemnumber(i,'letter_id'))
		if of_check_unselect_fields(0,'ctx_action_items ','wf_action_type_id') = true then of_set_value(lds_dync_detail, 'wf_action_type_id', lds_ctx_action_item, ll_row, lds_action_items, i, 'N')	//Modified by harry 20170621     lds_ctx_action_item.setitem(ll_row,'wf_action_type_id',lds_action_items.getitemnumber(i,'wf_action_type_id'))
		if of_check_unselect_fields(0,'ctx_action_items ','wf_complete_flag') = true then of_set_value(lds_dync_detail, 'wf_complete_flag', lds_ctx_action_item, ll_row, lds_action_items, i, 'C')	//Modified by harry 20170621     lds_ctx_action_item.setitem(ll_row,'wf_complete_flag',lds_action_items.getitemstring(i,'wf_complete_flag'))
		if of_check_unselect_fields(0,'ctx_action_items ','print_flag') = true then of_set_value(lds_dync_detail, 'print_flag', lds_ctx_action_item, ll_row, lds_action_items, i, 'N')	//Modified by harry 20170621     lds_ctx_action_item.setitem(ll_row,'print_flag',lds_action_items.getitemnumber(i,'print_flag'))
		if of_check_unselect_fields(0,'ctx_action_items ','assigned_to') = true then of_set_value(lds_dync_detail, 'assigned_to', lds_ctx_action_item, ll_row, lds_action_items, i, 'N')	//Modified by harry 20170621     lds_ctx_action_item.setitem(ll_row,'assigned_to',lds_action_items.getitemnumber(i,'assigned_to'))
		
		//Added By Ken.Guo 2009-07-23.
		if of_check_unselect_fields(0,'ctx_action_items ','custom_n1') = true then of_set_value(lds_dync_detail, 'custom_n1', lds_ctx_action_item, ll_row, lds_action_items, i, 'DEC')	//Modified by harry 20170621     lds_ctx_action_item.setitem(ll_row,'custom_n1',lds_action_items.getitemdecimal(i,'custom_n1'))
		if of_check_unselect_fields(0,'ctx_action_items ','custom_n2') = true then of_set_value(lds_dync_detail, 'custom_n2', lds_ctx_action_item, ll_row, lds_action_items, i, 'DEC')	//Modified by harry 20170621     lds_ctx_action_item.setitem(ll_row,'custom_n2',lds_action_items.getitemdecimal(i,'custom_n2'))
		if of_check_unselect_fields(0,'ctx_action_items ','custom_n3') = true then of_set_value(lds_dync_detail, 'custom_n3', lds_ctx_action_item, ll_row, lds_action_items, i, 'DEC')	//Modified by harry 20170621     lds_ctx_action_item.setitem(ll_row,'custom_n3',lds_action_items.getitemdecimal(i,'custom_n3'))
		if of_check_unselect_fields(0,'ctx_action_items ','custom_n4') = true then of_set_value(lds_dync_detail, 'custom_n4', lds_ctx_action_item, ll_row, lds_action_items, i, 'DEC')	//Modified by harry 20170621     lds_ctx_action_item.setitem(ll_row,'custom_n4',lds_action_items.getitemdecimal(i,'custom_n4'))
		if of_check_unselect_fields(0,'ctx_action_items ','custom_n5') = true then of_set_value(lds_dync_detail, 'custom_n5', lds_ctx_action_item, ll_row, lds_action_items, i, 'DEC')	//Modified by harry 20170621     lds_ctx_action_item.setitem(ll_row,'custom_n5',lds_action_items.getitemdecimal(i,'custom_n5'))
		if of_check_unselect_fields(0,'ctx_action_items ','custom_1') = true then of_set_value(lds_dync_detail, 'custom_1', lds_ctx_action_item, ll_row, lds_action_items, i, 'C')	//Modified by harry 20170621     lds_ctx_action_item.setitem(ll_row,'custom_1',lds_action_items.getitemstring(i,'custom_1'))
		if of_check_unselect_fields(0,'ctx_action_items ','custom_2') = true then of_set_value(lds_dync_detail, 'custom_2', lds_ctx_action_item, ll_row, lds_action_items, i, 'C')	//Modified by harry 20170621     lds_ctx_action_item.setitem(ll_row,'custom_2',lds_action_items.getitemstring(i,'custom_2'))
		if of_check_unselect_fields(0,'ctx_action_items ','custom_3') = true then of_set_value(lds_dync_detail, 'custom_3', lds_ctx_action_item, ll_row, lds_action_items, i, 'C')	//Modified by harry 20170621     lds_ctx_action_item.setitem(ll_row,'custom_3',lds_action_items.getitemstring(i,'custom_3'))
		if of_check_unselect_fields(0,'ctx_action_items ','custom_4') = true then of_set_value(lds_dync_detail, 'custom_4', lds_ctx_action_item, ll_row, lds_action_items, i, 'C')	//Modified by harry 20170621     lds_ctx_action_item.setitem(ll_row,'custom_4',lds_action_items.getitemstring(i,'custom_4'))
		
		//Added By Mark Lee 11/24/2015
		if of_check_unselect_fields(0,'ctx_action_items ','subject') = true then of_set_value(lds_dync_detail, 'subject', lds_ctx_action_item, ll_row, lds_action_items, i, 'C')	//Modified by harry 20170621     lds_ctx_action_item.setitem(ll_row,'subject',lds_action_items.getitemstring(i,'subject'))
		if of_check_unselect_fields(0,'ctx_action_items ','start_date') = true then of_set_value(lds_dync_detail, 'start_date', lds_ctx_action_item, ll_row, lds_action_items, i, 'DT')	//Modified by harry 20170621     lds_ctx_action_item.setitem(ll_row,'start_date',lds_action_items.getitemdatetime(i,'start_date'))
		if of_check_unselect_fields(0,'ctx_action_items ','start_time') = true then of_set_value(lds_dync_detail, 'start_time', lds_ctx_action_item, ll_row, lds_action_items, i, 'DT')	//Modified by harry 20170621     lds_ctx_action_item.setitem(ll_row,'start_time',lds_action_items.getitemdatetime(i,'start_time'))
		if of_check_unselect_fields(0,'ctx_action_items ','duration') = true then of_set_value(lds_dync_detail, 'duration', lds_ctx_action_item, ll_row, lds_action_items, i, 'N')	//Modified by harry 20170621     lds_ctx_action_item.setitem(ll_row,'duration',lds_action_items.getitemnumber(i,'duration'))
		if of_check_unselect_fields(0,'ctx_action_items ','duration_type') = true then of_set_value(lds_dync_detail, 'duration_type', lds_ctx_action_item, ll_row, lds_action_items, i, 'N')	//Modified by harry 20170621     lds_ctx_action_item.setitem(ll_row,'duration_type',lds_action_items.getitemnumber(i,'duration_type'))
		if of_check_unselect_fields(0,'ctx_action_items ','end_date') = true then of_set_value(lds_dync_detail, 'end_date', lds_ctx_action_item, ll_row, lds_action_items, i, 'DT')	//Modified by harry 20170621     lds_ctx_action_item.setitem(ll_row,'end_date',lds_action_items.getitemdatetime(i,'end_date'))
		if of_check_unselect_fields(0,'ctx_action_items ','end_time') = true then of_set_value(lds_dync_detail, 'end_time', lds_ctx_action_item, ll_row, lds_action_items, i, 'DT')	//Modified by harry 20170621     lds_ctx_action_item.setitem(ll_row,'end_time',lds_action_items.getitemdatetime(i,'end_time'))
		if of_check_unselect_fields(0,'ctx_action_items ','priority') = true then of_set_value(lds_dync_detail, 'priority', lds_ctx_action_item, ll_row, lds_action_items, i, 'N')	//Modified by harry 20170621     lds_ctx_action_item.setitem(ll_row,'priority',lds_action_items.getitemnumber(i,'priority'))
		if of_check_unselect_fields(0,'ctx_action_items ','level_id1') = true then of_set_value(lds_dync_detail, 'level_id1', lds_ctx_action_item, ll_row, lds_action_items, i, 'N')	//Modified by harry 20170621     lds_ctx_action_item.setitem(ll_row,'level_id1',lds_action_items.getitemnumber(i,'level_id1'))
		if of_check_unselect_fields(0,'ctx_action_items ','level_id2') = true then of_set_value(lds_dync_detail, 'level_id2', lds_ctx_action_item, ll_row, lds_action_items, i, 'N')	//Modified by harry 20170621     lds_ctx_action_item.setitem(ll_row,'level_id2',lds_action_items.getitemnumber(i,'level_id2'))
		if of_check_unselect_fields(0,'ctx_action_items ','doc_id') = true then lds_ctx_action_item.setitem(ll_row,'doc_id',lds_action_items.getitemnumber(i,'doc_id'))
				
		lb_copy = True				
	Next	
End If

w_appeon_gifofwait.of_setposition(60)
//Added By Ken.Guo 2009-05-20.
If astr_copy_ctx.sb_group_access = 1 Then
	ll_cnt = lds_ctx_group_access.Retrieve(astr_copy_ctx.sl_ctx_id)
	For i = 1 To ll_cnt
		ll_row = lds_ctx_group_access.InsertRow(0)
		lds_ctx_group_access.SetItem(ll_row,'ctx_id',ll_ctx_id)
		lds_ctx_group_access.SetItem(ll_row,'group_id',lds_ctx_group_access.GetItemNumber(i,'group_id'))
		if of_check_unselect_fields(50,'ctx_group_access ','access') = true then lds_ctx_group_access.SetItem(ll_row,'access',lds_ctx_group_access.GetItemString(i,'access'))
		if of_check_unselect_fields(50,'ctx_group_access ','view_id') = true then lds_ctx_group_access.SetItem(ll_row,'view_id',lds_ctx_group_access.GetItemNumber(i,'view_id'))
		lb_copy = True
	Next
End If

//Added By Ken.Guo 09/16/2013. Set flag.
If astr_copy_ctx.sb_custom_data2 = 1 or astr_copy_ctx.sb_custom_multi =  1 Then
	lb_copy = True
End If

If lb_copy = False Then 
	Destroy lds_detail
	Destroy lds_ctx_basic_info
	Destroy lds_company_contacts
	Destroy lds_ctx_contract_contacts
	Destroy lds_products
	Destroy lds_ctx_products
//	Destroy lds_requirements
//	Destroy lds_ctx_req_profile_hdr
//	Destroy lds_profile_detail
//	Destroy lds_ctx_elements
	Destroy lds_other_contacts
	Destroy lds_parent_organization
	Destroy lds_ctx_loc
	Destroy lds_group_locations
	Destroy lds_selected_facility
	Destroy lds_ctx_location_pracs
	Destroy lds_specialties
	Destroy lds_ctx_location_specialty
	Destroy lds_organization_list
	Destroy lds_ctx_orgs_contact
	Destroy lds_ctx_org_contact
	Destroy lds_fee_schedules
	Destroy lds_ctx_fee_sched_hdr
	Destroy lds_providers
	Destroy lds_ctx_fee_sched_pracs
	Destroy lds_fee_schedule_locations
	Destroy lds_ctx_fee_sched_locations
	Destroy lds_fees
	Destroy lds_ctx_fee_sched_data
	Destroy lds_fee_schedules2
	Destroy lds_ctx_fee_sched_nm
	Destroy lds_action_items
	Destroy lds_ctx_action_item
	Destroy lds_ctx_group_access
	Destroy lds_dync_detail //Added by Harry 20170620 for Task 728
	Destroy lds_dync_1 //Added by Harry 20170621 for Task 728
	Destroy lds_dync_2 //Added by Harry 20170621 for Task 728
	Destroy lds_dync_3 //Added by Harry 20170621 for Task 728
	If isvalid(w_appeon_gifofwait) Then close(w_appeon_gifofwait)
	
	//Added By Ken.Guo 09/26/2012. Support Add sub contracts for US banK Customer.
	Choose Case astr_copy_ctx.as_copy_sub_ctx
		Case 'Create Credit Sub Contract', 'Create Contract Sub Contract'
			gnv_debug.of_output( true, 'Failed to create Sub Contract. Please select the screens on the default copy contract window first. ')
		Case Else
			messagebox('Copy Contract Failed','The selected items have no data at all.')
	End Choose
	
	Return -1
End If

gnv_debug.of_output(false,  'save copied ctx. before save.')
w_appeon_gifofwait.of_setposition(70)
gnv_appeondb.of_startqueue( )
if lds_ctx_basic_info.update() = -1 then gnv_debug.of_output( true, 'Failed to copy the data of lds_ctx_basic_info.') //Modified By Jay Chen 07-03-2015 add write error log.
if lds_ctx_contract_contacts.update() = -1 then gnv_debug.of_output( true, 'Failed to copy the data of lds_ctx_contract_contacts.')
if lds_ctx_products.update() = -1 then gnv_debug.of_output( true, 'Failed to copy the data of lds_ctx_products.')
//lds_ctx_req_profile_hdr.update()
//lds_ctx_elements.update()
if lds_ctx_contract_contacts.update() = -1 then gnv_debug.of_output( true, 'Failed to copy the data of lds_ctx_contract_contacts.')
if lds_ctx_loc.update() = -1 then gnv_debug.of_output( true, 'Failed to copy the data of lds_ctx_loc.')
w_appeon_gifofwait.of_setposition(75) 
if lds_ctx_location_pracs.update() = -1 then gnv_debug.of_output( true, 'Failed to copy the data of lds_ctx_location_pracs.')
if lds_ctx_location_specialty.update() = -1 then gnv_debug.of_output( true, 'Failed to copy the data of lds_ctx_location_specialty.')
if lds_ctx_orgs_contact.update() = -1 then gnv_debug.of_output( true, 'Failed to copy the data of lds_ctx_orgs_contact.')
if lds_ctx_org_contact.update() = -1 then gnv_debug.of_output( true, 'Failed to copy the data of lds_ctx_org_contact.')
if lds_ctx_fee_sched_hdr.update() = -1 then gnv_debug.of_output( true, 'Failed to copy the data of lds_ctx_fee_sched_hdr.')
if lds_ctx_fee_sched_pracs.update() = -1 then gnv_debug.of_output( true, 'Failed to copy the data of lds_ctx_fee_sched_pracs.')
if lds_ctx_fee_sched_locations.update() = -1 then gnv_debug.of_output( true, 'Failed to copy the data of lds_ctx_fee_sched_locations.')
if lds_ctx_fee_sched_data.update() = -1 then gnv_debug.of_output( true, 'Failed to copy the data of lds_ctx_fee_sched_data.')
if lds_ctx_fee_sched_nm.update() = -1 then gnv_debug.of_output( true, 'Failed to copy the data of lds_ctx_fee_sched_nm.')
if lds_ctx_action_item.update() = -1 then gnv_debug.of_output( true, 'Failed to copy the data of lds_ctx_action_item.')
if lds_ctx_group_access.update() = -1 then gnv_debug.of_output( true, 'Failed to copy the data of lds_ctx_group_access.')
gnv_appeondb.of_commitqueue( ) 
gnv_debug.of_output(false,  'save copied ctx. after save.')
w_appeon_gifofwait.of_setposition(80)

//Modified By Ken.Guo 2017-06-13
Long ll_record_id1, ll_record_id2, ll_record_id3,ll_record_id4
Long ll_record_id10, ll_record_id20, ll_record_id30,ll_record_id40
Long ll_update_row = 500, p, ll_copy_cnt, ll_count
String ls_update_row

//If astr_copy_ctx.sb_fee_schedule = 1 Then
If astr_copy_ctx.sb_fee_schedule = 1 and of_get_screen_exist(ll_view, 26) Then //Modified by harry 20170622
	f_create_contract_ds (ll_view, 26, lds_dync_1)  //Added by Harry 20170622 Create Action Items from current screen
	f_create_contract_ds (ll_view, 27, lds_dync_2)  //Added by Harry 20170622 Create Action Items from current screen
	f_create_contract_ds (ll_view, 28, lds_dync_3)  //Added by Harry 20170622 Create Action Items from current screen
	ls_update_row = gnv_user_option.of_get_option_value( 'cope_fee_schedule_per_rows')
	If (ls_update_row = '0' or ls_update_row = '' or isnull(ls_update_row)) Then
		ll_update_row = 500
		gnv_user_option.of_set_option_value( 'cope_fee_schedule_per_rows', '1000')
		gnv_user_option.of_system_save()
	Else
		ll_update_row = Long(ls_update_row)
	End If
	gnv_debug.of_output(false, 'copy fee schedule.  copy rows number: ' + String(ll_update_row))
	
	//Fee Schedule
	//Modified By Ken.Guo 2017-05-31. added ctx_id parm for lds_providers. lds_fee_schedule_locations and lds_fees
	gnv_debug.of_output(false, 'fee_schedule copy begin')
	gnv_appeondb.of_startqueue( )
	lds_fee_schedules.retrieve(astr_copy_ctx.sl_ctx_id)
	lds_providers.retrieve(astr_copy_ctx.sl_ctx_id)
	lds_fee_schedule_locations.retrieve(astr_copy_ctx.sl_ctx_id)
	lds_fees.retrieve(astr_copy_ctx.sl_ctx_id)		
	select max(fee_sched_id) + 1 into :ll_fee_sched_id from ctx_fee_sched_hdr;		
	select max(fee_sched_location_id)  + 1 into :ll_fee_sched_location_id from ctx_fee_sched_locations;				
	select max(fee_sched_data_id) + 1 into :ll_fee_sched_data_id from CTX_FEE_SCHED_DATA;		
	gnv_appeondb.of_commitqueue( )
	gnv_debug.of_output(false, 'fee_schedule copy retrieve data')
	If isnull(ll_fee_sched_id) Then  ll_fee_sched_id = 1
	If isnull(ll_fee_sched_location_id) Then ll_fee_sched_location_id = 1
	If isnull(ll_fee_sched_data_id) Then ll_fee_sched_data_id = 1	
	ll_count = lds_fee_schedules.Rowcount() + lds_providers.rowcount() + lds_fee_schedule_locations.rowcount() + lds_fees.rowcount()
	i = 0
	//Modified By Ken.Guo 2017-05-31. Improve performance for Web
	For i = 1 To lds_fee_schedules.rowcount()
		Yield()
		j = 0
		k = 0
		p = 0		
		ll_copy_cnt = ll_copy_cnt + 1
		w_appeon_gifofwait.of_settext( "Copying the Fee Schedules data "+String(ll_copy_cnt) + "/" + String(ll_count)+". Please stand by!" )
		gnv_debug.of_output(false, 'fee_schedule copy. 2')
		ll_fee_sched_id1 = lds_fee_schedules.getitemnumber(i,'fee_sched_id')
		If i = 1 Then 
			ll_record_id10 = gnv_app.of_get_id('RECORD_ID', lds_fee_schedules.rowcount())
		End If
		ll_record_id1 = ll_record_id10  + i - 1			
		
		ll_row = lds_ctx_fee_sched_hdr.insertrow(0)
		
		lds_ctx_fee_sched_hdr.setitem(ll_row,'fee_sched_id',ll_fee_sched_id)
		lds_ctx_fee_sched_hdr.setitem(ll_row,'ctx_id',ll_ctx_id)
		lds_ctx_fee_sched_hdr.setitem(ll_row,'record_id',ll_record_id1)
		if of_check_unselect_fields(0,'ctx_fee_sched_hdr ','sched_type') = true then of_set_value(lds_dync_1, 'sched_type', lds_ctx_fee_sched_hdr, ll_row, lds_fee_schedules, i, 'N')	//Modified by harry 20170621   lds_ctx_fee_sched_hdr.setitem(ll_row,'sched_type',lds_fee_schedules.getitemnumber(i,'sched_type'))
		if of_check_unselect_fields(0,'ctx_fee_sched_hdr ','carve_out_type') = true then of_set_value(lds_dync_1, 'carve_out_type', lds_ctx_fee_sched_hdr, ll_row, lds_fee_schedules, i, 'N')	//Modified by harry 20170621   lds_ctx_fee_sched_hdr.setitem(ll_row,'carve_out_type',lds_fee_schedules.getitemnumber(i,'carve_out_type'))
		if of_check_unselect_fields(0,'ctx_fee_sched_hdr ','custom_1') = true then of_set_value(lds_dync_1, 'custom_1', lds_ctx_fee_sched_hdr, ll_row, lds_fee_schedules, i, 'C')	//Modified by harry 20170621   lds_ctx_fee_sched_hdr.setitem(ll_row,'custom_1',lds_fee_schedules.getitemstring(i,'custom_1'))
		if of_check_unselect_fields(0,'ctx_fee_sched_hdr ','custom_2') = true then of_set_value(lds_dync_1, 'custom_2', lds_ctx_fee_sched_hdr, ll_row, lds_fee_schedules, i, 'C')	//Modified by harry 20170621   lds_ctx_fee_sched_hdr.setitem(ll_row,'custom_2',lds_fee_schedules.getitemstring(i,'custom_2'))
		if of_check_unselect_fields(0,'ctx_fee_sched_hdr ','custom_3') = true then of_set_value(lds_dync_1, 'custom_3', lds_ctx_fee_sched_hdr, ll_row, lds_fee_schedules, i, 'C')	//Modified by harry 20170621   lds_ctx_fee_sched_hdr.setitem(ll_row,'custom_3',lds_fee_schedules.getitemstring(i,'custom_3'))
		if of_check_unselect_fields(0,'ctx_fee_sched_hdr ','custom_4') = true then of_set_value(lds_dync_1, 'custom_4', lds_ctx_fee_sched_hdr, ll_row, lds_fee_schedules, i, 'C')	//Modified by harry 20170621   lds_ctx_fee_sched_hdr.setitem(ll_row,'custom_4',lds_fee_schedules.getitemstring(i,'custom_4'))
		if of_check_unselect_fields(0,'ctx_fee_sched_hdr ','custom_5') = true then of_set_value(lds_dync_1, 'custom_5', lds_ctx_fee_sched_hdr, ll_row, lds_fee_schedules, i, 'C')	//Modified by harry 20170621   lds_ctx_fee_sched_hdr.setitem(ll_row,'custom_5',lds_fee_schedules.getitemstring(i,'custom_5'))
		if of_check_unselect_fields(0,'ctx_fee_sched_hdr ','notes') = true then of_set_value(lds_dync_1, 'notes', lds_ctx_fee_sched_hdr, ll_row, lds_fee_schedules, i, 'C')	//Modified by harry 20170621   lds_ctx_fee_sched_hdr.setitem(ll_row,'notes',lds_fee_schedules.getitemstring(i,'notes'))
		
		If Mod(ll_copy_cnt,ll_update_row) = 0 Then
			w_appeon_gifofwait.of_settext( "Saving the Fee Schedules data "+String(ll_copy_cnt) + "/" + String(ll_count)+". Please stand by!" )
			gnv_appeondb.of_startqueue( )
				lds_ctx_fee_sched_hdr.update()
				lds_ctx_fee_sched_locations.update()
				lds_ctx_fee_sched_pracs.update()
				lds_ctx_fee_sched_data.update()
			gnv_appeondb.of_commitqueue( )
		End If
		
		lds_providers.setfilter("fee_sched_id = " + string(ll_fee_sched_id1))
		lds_providers.filter()
		gnv_debug.of_output(false, 'fee_schedule copy. 3')
		p = 0
		For p = 1 To lds_providers.rowcount()	
			ll_copy_cnt = ll_copy_cnt + 1
			w_appeon_gifofwait.of_settext( "Copying the Fee Schedules data "+String(ll_copy_cnt) + "/" + String(ll_count)+". Please stand by!" )
			If p = 1 Then 
				ll_record_id20 = gnv_app.of_get_id('RECORD_ID', lds_providers.rowcount())
			End If
			ll_record_id2 = ll_record_id20 + p - 1						
			
			ll_row = lds_ctx_fee_sched_pracs.insertrow(0)
			lds_ctx_fee_sched_pracs.setitem(ll_row,'fee_sched_id',ll_fee_sched_id)
			lds_ctx_fee_sched_pracs.setitem(ll_row,'record_id',ll_record_id2)								
			lds_ctx_fee_sched_pracs.setitem(ll_row,'practitioner_id',lds_providers.getitemnumber(p,'practitioner_id'))
		Next
		gnv_debug.of_output(false, 'fee_schedule copy. 40 ')
		lds_fee_schedule_locations.setfilter("fee_sched_id = " + string(ll_fee_sched_id1))
		lds_fee_schedule_locations.filter()
		gnv_debug.of_output(false, 'fee_schedule copy. 41 ')
		j = 0
		For j = 1 To lds_fee_schedule_locations.rowcount()
			ll_copy_cnt = ll_copy_cnt + 1
			w_appeon_gifofwait.of_settext( "Copying the Fee Schedules data "+String(ll_copy_cnt) + "/" + String(ll_count)+". Please stand by!" )
			k = 0
			ll_fee_sched_location_id1 = lds_fee_schedule_locations.getitemnumber(j,'fee_sched_location_id')
			If j = 1 Then 
				ll_record_id30 = gnv_app.of_get_id('RECORD_ID', lds_fee_schedule_locations.rowcount())
			End If
			ll_record_id3 = ll_record_id30 + j - 1							
			gnv_debug.of_output(false, 'fee_schedule copy. 51 ')
			ll_row = lds_ctx_fee_sched_locations.insertrow(0)
			lds_ctx_fee_sched_locations.setitem(ll_row,'fee_sched_location_id',ll_fee_sched_location_id)
			lds_ctx_fee_sched_locations.setitem(ll_row,'fee_sched_id',ll_fee_sched_id)
			lds_ctx_fee_sched_locations.setitem(ll_row,'record_id',ll_record_id3)
			if of_check_unselect_fields(27,'ctx_fee_sched_locations ','location') = true then of_set_value(lds_dync_2, 'location', lds_ctx_fee_sched_locations, ll_row, lds_fee_schedule_locations, j, 'C')	//Modified by harry 20170621      lds_ctx_fee_sched_locations.setitem(ll_row,'location',lds_fee_schedule_locations.getitemstring(j,'location')) //Modified By Ken.Guo 2017-05-31 change getitemnumber to getitemstring
			if of_check_unselect_fields(27,'ctx_fee_sched_locations ','rate') = true then of_set_value(lds_dync_2, 'rate', lds_ctx_fee_sched_locations, ll_row, lds_fee_schedule_locations, j, 'DEC')	//Modified by harry 20170621      lds_ctx_fee_sched_locations.setitem(ll_row,'rate',lds_fee_schedule_locations.getitemdecimal(j,'rate'))
			if of_check_unselect_fields(27,'ctx_fee_sched_locations ','fee_bonus') = true then of_set_value(lds_dync_2, 'fee_bonus', lds_ctx_fee_sched_locations, ll_row, lds_fee_schedule_locations, j, 'N')	//Modified by harry 20170621     lds_ctx_fee_sched_locations.setitem(ll_row,'fee_bonus',lds_fee_schedule_locations.getitemnumber(j,'fee_bonus'))
			gnv_debug.of_output(false, 'fee_schedule copy. 52 ')
			
			If Mod(ll_copy_cnt,ll_update_row) = 0 Then
				w_appeon_gifofwait.of_settext( "Saving the Fee Schedules data "+String(ll_copy_cnt) + "/" + String(ll_count)+". Please stand by!" )
				gnv_appeondb.of_startqueue( )
					lds_ctx_fee_sched_hdr.update()
					lds_ctx_fee_sched_locations.update()
					lds_ctx_fee_sched_pracs.update()
					lds_ctx_fee_sched_data.update()
				gnv_appeondb.of_commitqueue( )
			End If

			lds_fees.setfilter("fee_sched_location_id = " + string(ll_fee_sched_location_id1))
			lds_fees.filter()
			gnv_debug.of_output(false, 'fee_schedule copy. 53 ')

			For k = 1 To lds_fees.rowcount()		
				Yield()
				ll_copy_cnt = ll_copy_cnt + 1
				w_appeon_gifofwait.of_settext( "Copying the Fee Schedules data "+String(ll_copy_cnt) + "/" + String(ll_count)+". Please stand by!" )
				If k = 1 Then 
					ll_record_id40 = gnv_app.of_get_id('RECORD_ID', lds_fees.rowcount())
				End If
				ll_record_id4 = ll_record_id40 + k - 1			
				ll_row = lds_ctx_fee_sched_data.insertrow(0)
				lds_ctx_fee_sched_data.setitem(ll_row,'fee_sched_data_id',ll_fee_sched_data_id)
				lds_ctx_fee_sched_data.setitem(ll_row,'fee_sched_location_id',ll_fee_sched_location_id)
				lds_ctx_fee_sched_data.setitem(ll_row,'record_id',ll_record_id4)
				
				if of_check_unselect_fields(28,'ctx_fee_sched_data ','cpt_code') = true then of_set_value(lds_dync_3, 'cpt_code', lds_ctx_fee_sched_data, ll_row, lds_fees, k, 'C')	//Modified by harry 20170621      lds_ctx_fee_sched_data.setitem(ll_row,'cpt_code',lds_fees.getitemstring(k,'cpt_code'))
				if of_check_unselect_fields(28,'ctx_fee_sched_data ','fee') = true then of_set_value(lds_dync_3, 'fee', lds_ctx_fee_sched_data, ll_row, lds_fees, k, 'DEC')	//Modified by harry 20170621      lds_ctx_fee_sched_data.setitem(ll_row,'fee',lds_fees.getitemdecimal(k,'fee'))
				if of_check_unselect_fields(28,'ctx_fee_sched_data ','office_fee') = true then of_set_value(lds_dync_3, 'office_fee', lds_ctx_fee_sched_data, ll_row, lds_fees, k, 'DEC')	//Modified by harry 20170621      lds_ctx_fee_sched_data.setitem(ll_row,'office_fee',lds_fees.getitemdecimal(k,'office_fee'))
				if of_check_unselect_fields(28,'ctx_fee_sched_data ','facility_fee') = true then of_set_value(lds_dync_3, 'facility_fee', lds_ctx_fee_sched_data, ll_row, lds_fees, k, 'DEC')	//Modified by harry 20170621      lds_ctx_fee_sched_data.setitem(ll_row,'facility_fee',lds_fees.getitemdecimal(k,'facility_fee'))
				if of_check_unselect_fields(28,'ctx_fee_sched_data ','custom_fee') = true then of_set_value(lds_dync_3, 'custom_fee', lds_ctx_fee_sched_data, ll_row, lds_fees, k, 'DEC')	//Modified by harry 20170621      lds_ctx_fee_sched_data.setitem(ll_row,'custom_fee',lds_fees.getitemdecimal(k,'custom_fee'))
				if of_check_unselect_fields(28,'ctx_fee_sched_data ','precert') = true then of_set_value(lds_dync_3, 'precert', lds_ctx_fee_sched_data, ll_row, lds_fees, k, 'N')	//Modified by harry 20170621      lds_ctx_fee_sched_data.setitem(ll_row,'precert',lds_fees.getitemnumber(k,'precert'))
				if of_check_unselect_fields(28,'ctx_fee_sched_data ','preauth') = true then of_set_value(lds_dync_3, 'preauth', lds_ctx_fee_sched_data, ll_row, lds_fees, k, 'N')	//Modified by harry 20170621      lds_ctx_fee_sched_data.setitem(ll_row,'preauth',lds_fees.getitemnumber(k,'preauth'))
				if of_check_unselect_fields(28,'ctx_fee_sched_data ','effective_date') = true then of_set_value(lds_dync_3, 'effective_date', lds_ctx_fee_sched_data, ll_row, lds_fees, k, 'DT')	//Modified by harry 20170621      lds_ctx_fee_sched_data.setitem(ll_row,'effective_date',lds_fees.getitemdatetime(k,'effective_date'))
				if of_check_unselect_fields(28,'ctx_fee_sched_data ','expiration_date') = true then of_set_value(lds_dync_3, 'expiration_date', lds_ctx_fee_sched_data, ll_row, lds_fees, k, 'DT')	//Modified by harry 20170621      lds_ctx_fee_sched_data.setitem(ll_row,'expiration_date',lds_fees.getitemdatetime(k,'expiration_date'))
				if of_check_unselect_fields(28,'ctx_fee_sched_data ','status') = true then of_set_value(lds_dync_3, 'status', lds_ctx_fee_sched_data, ll_row, lds_fees, k, 'N')	//Modified by harry 20170621      lds_ctx_fee_sched_data.setitem(ll_row,'status',lds_fees.getitemnumber(k,'status'))
				if of_check_unselect_fields(28,'ctx_fee_sched_data ','drg_code') = true then of_set_value(lds_dync_3, 'drg_code', lds_ctx_fee_sched_data, ll_row, lds_fees, k, 'C')	//Modified by harry 20170621      lds_ctx_fee_sched_data.setitem(ll_row,'drg_code',lds_fees.getitemstring(k,'drg_code'))
				if of_check_unselect_fields(28,'ctx_fee_sched_data ','rev_code') = true then of_set_value(lds_dync_3, 'rev_code', lds_ctx_fee_sched_data, ll_row, lds_fees, k, 'C')	//Modified by harry 20170621      lds_ctx_fee_sched_data.setitem(ll_row,'rev_code',lds_fees.getitemstring(k,'rev_code'))
				if of_check_unselect_fields(28,'ctx_fee_sched_data ','claim_type') = true then of_set_value(lds_dync_3, 'claim_type', lds_ctx_fee_sched_data, ll_row, lds_fees, k, 'N')	//Modified by harry 20170621      lds_ctx_fee_sched_data.setitem(ll_row,'claim_type',lds_fees.getitemnumber(k,'claim_type'))
				if of_check_unselect_fields(28,'ctx_fee_sched_data ','flat_fee') = true then of_set_value(lds_dync_3, 'flat_fee', lds_ctx_fee_sched_data, ll_row, lds_fees, k, 'N')	//Modified by harry 20170621      lds_ctx_fee_sched_data.setitem(ll_row,'flat_fee',lds_fees.getitemnumber(k,'flat_fee'))
				if of_check_unselect_fields(28,'ctx_fee_sched_data ','cpt_code_set') = true then of_set_value(lds_dync_3, 'cpt_code_set', lds_ctx_fee_sched_data, ll_row, lds_fees, k, 'N')	//Modified by harry 20170621      lds_ctx_fee_sched_data.setitem(ll_row,'cpt_code_set',lds_fees.getitemnumber(k,'cpt_code_set'))
				if of_check_unselect_fields(28,'ctx_fee_sched_data ','reimburse_type') = true then of_set_value(lds_dync_3, 'reimburse_type', lds_ctx_fee_sched_data, ll_row, lds_fees, k, 'N')	//Modified by harry 20170621      lds_ctx_fee_sched_data.setitem(ll_row,'reimburse_type',lds_fees.getitemnumber(k,'reimburse_type'))
				if of_check_unselect_fields(28,'ctx_fee_sched_data ','disc_start_perc') = true then of_set_value(lds_dync_3, 'disc_start_perc', lds_ctx_fee_sched_data, ll_row, lds_fees, k, 'N')	//Modified by harry 20170621      lds_ctx_fee_sched_data.setitem(ll_row,'disc_start_perc',lds_fees.getitemnumber(k,'disc_start_perc'))
				if of_check_unselect_fields(28,'ctx_fee_sched_data ','end_day') = true then of_set_value(lds_dync_3, 'end_day', lds_ctx_fee_sched_data, ll_row, lds_fees, k, 'N')	//Modified by harry 20170621      lds_ctx_fee_sched_data.setitem(ll_row,'end_day',lds_fees.getitemnumber(k,'end_day'))
				if of_check_unselect_fields(28,'ctx_fee_sched_data ','carve_out_day') = true then of_set_value(lds_dync_3, 'carve_out_day', lds_ctx_fee_sched_data, ll_row, lds_fees, k, 'N')	//Modified by harry 20170621      lds_ctx_fee_sched_data.setitem(ll_row,'carve_out_day',lds_fees.getitemnumber(k,'carve_out_day'))
				if of_check_unselect_fields(28,'ctx_fee_sched_data ','sl_threshold') = true then of_set_value(lds_dync_3, 'sl_threshold', lds_ctx_fee_sched_data, ll_row, lds_fees, k, 'DEC')	//Modified by harry 20170621      lds_ctx_fee_sched_data.setitem(ll_row,'sl_threshold',lds_fees.getitemdecimal(k,'sl_threshold'))
				if of_check_unselect_fields(28,'ctx_fee_sched_data ','sl_reimburse_type') = true then of_set_value(lds_dync_3, 'sl_reimburse_type', lds_ctx_fee_sched_data, ll_row, lds_fees, k, 'N')	//Modified by harry 20170621      lds_ctx_fee_sched_data.setitem(ll_row,'sl_reimburse_type',lds_fees.getitemnumber(k,'sl_reimburse_type'))
				if of_check_unselect_fields(28,'ctx_fee_sched_data ','sl_rate') = true then of_set_value(lds_dync_3, 'sl_rate', lds_ctx_fee_sched_data, ll_row, lds_fees, k, 'DEC')	//Modified by harry 20170621      lds_ctx_fee_sched_data.setitem(ll_row,'sl_rate',lds_fees.getitemdecimal(k,'sl_rate'))
				if of_check_unselect_fields(28,'ctx_fee_sched_data ','custom_1') = true then of_set_value(lds_dync_3, 'custom_1', lds_ctx_fee_sched_data, ll_row, lds_fees, k, 'C')	//Modified by harry 20170621      lds_ctx_fee_sched_data.setitem(ll_row,'custom_1',lds_fees.getitemstring(k,'custom_1'))
				if of_check_unselect_fields(28,'ctx_fee_sched_data ','custom_2') = true then of_set_value(lds_dync_3, 'custom_2', lds_ctx_fee_sched_data, ll_row, lds_fees, k, 'C')	//Modified by harry 20170621      lds_ctx_fee_sched_data.setitem(ll_row,'custom_2',lds_fees.getitemstring(k,'custom_2'))
				if of_check_unselect_fields(28,'ctx_fee_sched_data ','custom_3') = true then of_set_value(lds_dync_3, 'custom_3', lds_ctx_fee_sched_data, ll_row, lds_fees, k, 'C')	//Modified by harry 20170621      lds_ctx_fee_sched_data.setitem(ll_row,'custom_3',lds_fees.getitemstring(k,'custom_3'))
				if of_check_unselect_fields(28,'ctx_fee_sched_data ','custom_4') = true then of_set_value(lds_dync_3, 'custom_4', lds_ctx_fee_sched_data, ll_row, lds_fees, k, 'C')	//Modified by harry 20170621      lds_ctx_fee_sched_data.setitem(ll_row,'custom_4',lds_fees.getitemstring(k,'custom_4'))
				if of_check_unselect_fields(28,'ctx_fee_sched_data ','custom_5') = true then of_set_value(lds_dync_3, 'custom_5', lds_ctx_fee_sched_data, ll_row, lds_fees, k, 'C')	//Modified by harry 20170621      lds_ctx_fee_sched_data.setitem(ll_row,'custom_5',lds_fees.getitemstring(k,'custom_5'))
				if of_check_unselect_fields(28,'ctx_fee_sched_data ','inserted_by_user') = true then lds_ctx_fee_sched_data.setitem(ll_row,'inserted_by_user',gs_user_id)
				if of_check_unselect_fields(28,'ctx_fee_sched_data ','inserted_at_date_time') = true then lds_ctx_fee_sched_data.setitem(ll_row,'inserted_at_date_time',today())		

				If Mod(ll_copy_cnt,ll_update_row) = 0 Then
					w_appeon_gifofwait.of_settext( "Saving the Fee Schedules data "+String(ll_copy_cnt) + "/" + String(ll_count)+". Please stand by!" )
					gnv_appeondb.of_startqueue( )
						lds_ctx_fee_sched_hdr.update()
						lds_ctx_fee_sched_locations.update()
						lds_ctx_fee_sched_pracs.update()
						lds_ctx_fee_sched_data.update()
					gnv_appeondb.of_commitqueue( )
				End If					
				
				ll_fee_sched_data_id++
			Next		
		
			ll_fee_sched_location_id++
		Next			
		ll_fee_sched_id++
		lb_copy = True
	Next
	w_appeon_gifofwait.of_settext( "Saving the Fee Schedules data "+String(ll_copy_cnt) + "/" + String(ll_count)+". Please stand by!" )
	gnv_appeondb.of_startqueue( )
		lds_ctx_fee_sched_hdr.update()
		lds_ctx_fee_sched_locations.update()
		lds_ctx_fee_sched_pracs.update()
		lds_ctx_fee_sched_data.update()
	gnv_appeondb.of_commitqueue( )	
	w_appeon_gifofwait.of_settext( "Copying the selected contract/template..." )
	
End If



//Added By Jay Chen 11-17-2014 compute auto number when Copy_&_Create_Sub_Contract_Record
string ls_number,ls_object_name,ls_object_format,ls_coltype,ls_enable_special_attribute
long ll_category,li_view_id,ll_number,ll_value,ll_update_cnt,ll_index,ll_data,ll_master_contract_id
string ls_source_field,ls_store_field
datastore lds_ctx_basic_temp
decimal ldec_data,ldec_value
datastore lds_field_special_attribute
boolean lb_compute_sum_field = true
boolean lb_copy_contract,lb_copy_sub_contract 
 
ls_enable_special_attribute = gnv_data.of_getitem("icred_settings","enable_special_attribute",false)
if isnull(ls_enable_special_attribute) or ls_enable_special_attribute = '' then ls_enable_special_attribute = '0'
if isvalid(w_copy_sub_contract) then
	if w_copy_sub_contract.istr_copy_sub_contract.as_type = 'Copy_&_Create_Sub_Contract_Record' then
		lb_copy_sub_contract = true
		ll_master_contract_id = astr_copy_ctx.sl_ctx_id
	end if
end if
if isvalid(w_copy_contract) then
	lb_copy_contract = true
	SELECT master_contract_id into :ll_master_contract_id FROM CTX_BASIC_INFO WHERE ctx_id = :ll_ctx_id;
end if

if ls_enable_special_attribute = '1' then	
	if lb_copy_contract or lb_copy_sub_contract then
			lds_field_special_attribute = Create datastore
			lds_field_special_attribute.dataobject = 'dw_screen_field_special_attribute'
			lds_field_special_attribute.settransobject(sqlca)
			ll_category = lds_detail.getitemnumber(1,'category')
			li_view_id = integer(gnv_data.of_getitem('code_lookup','ic_n',"lookup_code = " + string(ll_category)))
			if isnull(li_view_id) or li_view_id = 0 then li_view_id = integer(gnv_data.of_getitem('security_users','contract_default_view',"upper(user_id)='" + upper(gs_user_id) + "'"))
			if isnull(li_view_id) or li_view_id = 0 then li_view_id = 1001
			if lb_copy_contract then
				lds_field_special_attribute.retrieve(li_view_id,'auto_number_p')
			else
				lds_field_special_attribute.retrieve(li_view_id,'auto_number_c')
			end if
			//1. set auto number value
			for ll_cnt = 1 to lds_field_special_attribute.rowcount()
				ls_object_name = lds_field_special_attribute.getitemstring(ll_cnt, "object_name")
				ls_object_format = lds_field_special_attribute.getitemstring(ll_cnt, "object_format")
				if ls_object_format = '###' then
					 select dbo.uf_get_masterchild_sort(:ll_master_contract_id,:ll_ctx_id) into :ls_number from icred_settings; 
				else //#####-###
					 select dbo.uf_get_masterchild_sort(0,:ll_ctx_id) into :ls_number from icred_settings; 
				end if
				ls_coltype = lower(left(lds_ctx_basic_info.Describe(ls_object_name +".coltype"),3))
				if ls_coltype = 'cha' or ls_coltype = 'var' then
					lds_ctx_basic_info.setitem(lds_ctx_basic_info.getrow(), ls_object_name, ls_number)
				else
					lds_ctx_basic_info.setitem(lds_ctx_basic_info.getrow(), ls_object_name, long(ls_number))
				end if
			next
			lds_ctx_basic_info.update()
			Destroy lds_field_special_attribute
			//2. compute all sum source field value to store field value
			select object_name into :ls_source_field from screen_field_special_attribute where view_id = :li_view_id and screen_id = 9 and object_type = 'sum_source_field';
			select object_name into :ls_store_field from screen_field_special_attribute where view_id = :li_view_id and screen_id = 9 and object_type = 'sum_store_field';
			if isnull(ls_source_field) or ls_source_field = '' then lb_compute_sum_field = false
			if isnull(ls_store_field) or ls_store_field = '' then lb_compute_sum_field = false
			if lb_compute_sum_field then
				lds_ctx_basic_temp = create datastore
				lds_ctx_basic_temp.dataobject = 'dw_master_child_ctx_list'
				lds_ctx_basic_temp.settransobject(sqlca)
				lds_ctx_basic_temp.retrieve(ll_master_contract_id)
				ls_coltype = lower(left(lds_ctx_basic_temp.Describe(ls_source_field +".coltype"),3))
				for ll_update_cnt =  1 to lds_ctx_basic_temp.rowcount()
					ldec_value = 0
					ll_value = 0
					for ll_index = 1 to ll_update_cnt - 1 
						if ls_coltype = 'dec' then
							ldec_data = lds_ctx_basic_temp.getitemdecimal(ll_index, ls_source_field)
							if isnull(ldec_data) then ldec_data = 0
							ldec_value += ldec_data
						else
							ll_data = lds_ctx_basic_temp.getitemnumber(ll_index, ls_source_field)
							if isnull(ll_data) then ll_data = 0
							ll_value += ll_data
						end if
					next
					if ls_coltype = 'dec' then
						lds_ctx_basic_temp.setitem(ll_update_cnt, ls_store_field, ldec_value)
					else
						lds_ctx_basic_temp.setitem(ll_update_cnt, ls_store_field, ll_value)
					end if
				next
				lds_ctx_basic_temp.update()
				destroy lds_ctx_basic_temp
			end if
	end if
end if
//end add

//Add custom data 2 and multi copy - jervis 06.10.2011
of_copy_custom_data(astr_copy_ctx ,ll_ctx_id)

//Added By Mark Lee 11/20/2012
of_copy_company_contact_data(astr_copy_ctx ,ll_ctx_id)

 //Document Manager
If astr_copy_ctx.sb_document_manager = 1 Then
	of_Copy_Document_Manager(astr_copy_ctx.sl_ctx_id ,ll_ctx_id)
End If

//New action item id - jervis 12.31.2010
for i = 1 to lds_ctx_action_item.rowcount()
	ll_new_id[i] = lds_ctx_action_item.GetItemNumber(i,"ctx_action_item_id")
next
//Copy Alarms - jervis 08.19.2010
of_copy_alarms(astr_copy_ctx,ll_ctx_id,ll_ori_id,ll_new_id)


//Requirements Profile. //Added By Ken.Guo 2009-08-26.
If astr_copy_ctx.sb_requirements = 1 Then
	of_update_requirement_profile(astr_copy_ctx.sl_ctx_id,ll_ctx_id)
End If

If astr_copy_ctx.si_is_template = 0 Then
	//Insert current user to our company contact.
	If astr_copy_ctx.si_add_contact = 1 Then
		//Added By Mark Lee 05/09/12	
//		of_insert_contact(ll_ctx_id)
		of_insert_contact(ll_ctx_id,astr_copy_ctx.ai_ib_default_email,astr_copy_ctx.ai_ib_owner)
	End If
	
	//trigger workflow
	If astr_copy_ctx.sl_workflow > 0 and gb_workflow Then	//Add Gb_workflow - jervis 04.20.2010
		lnv_workflow = Create n_cst_workflow_triggers
		lstr_action.ctx_id = ll_ctx_id
		lstr_action.wf_id = astr_copy_ctx.sl_workflow
		lnv_workflow.of_workflow_create_action_items(lstr_action)
	End If
	
	//Added By Jay Chen 02-18-2014 trigger workflow according to the set workflow value of category
	il_rowcount = lds_detail.rowcount() 
	il_status = lds_detail.getitemnumber(1,'status')
	il_category = lds_detail.getitemnumber(1,'category')
	il_ctx_id = ll_ctx_id
	if isvalid(w_contract) then
		if w_contract.ib_use_template then
			of_create_action_item_by_workflow()
		end if
	end if
End If

w_appeon_gifofwait.of_setposition(90)

//Added By Ken.Guo 2009-08-24.
If astr_copy_ctx.si_is_template = 1 Then
	of_update_ctx_flag(ll_ctx_id,1)
	of_update_template_data(astr_copy_ctx,ll_ctx_id)
Else
	of_update_ctx_flag(ll_ctx_id,0)
End If

w_appeon_gifofwait.of_setposition(100)

Destroy lds_detail
Destroy lds_ctx_basic_info
Destroy lds_company_contacts
Destroy lds_ctx_contract_contacts
Destroy lds_products
Destroy lds_ctx_products
//Destroy lds_requirements
//Destroy lds_ctx_req_profile_hdr
//Destroy lds_profile_detail
//Destroy lds_ctx_elements
Destroy lds_other_contacts
Destroy lds_parent_organization
Destroy lds_ctx_loc
Destroy lds_group_locations
Destroy lds_selected_facility
Destroy lds_ctx_location_pracs
Destroy lds_specialties
Destroy lds_ctx_location_specialty
Destroy lds_organization_list
Destroy lds_ctx_orgs_contact
Destroy lds_ctx_org_contact
Destroy lds_fee_schedules
Destroy lds_ctx_fee_sched_hdr
Destroy lds_providers
Destroy lds_ctx_fee_sched_pracs
Destroy lds_fee_schedule_locations
Destroy lds_ctx_fee_sched_locations
Destroy lds_fees
Destroy lds_ctx_fee_sched_data
Destroy lds_fee_schedules2
Destroy lds_ctx_fee_sched_nm
Destroy lds_action_items
Destroy lds_ctx_action_item
Destroy lds_ctx_group_access
destroy lnv_workflow

Destroy lds_dync_detail  //Added by Harry 20170620 for Task 728
Destroy lds_dync_1 //Added by Harry 20170621 for Task 728
Destroy lds_dync_2 //Added by Harry 20170621 for Task 728
Destroy lds_dync_3 //Added by Harry 20170621 for Task 728
 
If isvalid(w_appeon_gifofwait) Then close(w_appeon_gifofwait)


Return ll_ctx_id

end function

public function integer of_update_template_data (str_copy_ctx astr_copy_ctx, long al_template_id);long ll_cnt ,i, ll_find, ll_row, ll_id
datastore lds_ctx_template
lds_ctx_template = Create datastore

lds_ctx_template.dataobject = 'd_ctx_templates'
lds_ctx_template.settransobject(SQLCA)
lds_ctx_template.retrieve(al_template_id)

ll_cnt = lds_ctx_template.rowcount()
 
//Delete history data if exists.
For i = 1 to ll_cnt
	lds_ctx_template.deleterow(i)
Next

//Begin - Added By Mark 07/21/2014.	 use exists template id
//lds_ctx_template.InsertRow(0)
ll_id = 0 
Select ctx_id 
Into :ll_id 
From ctx_templates_info 
Where template_name = :astr_copy_ctx.ss_template_name ;

if not isnull(ll_id) and ll_id < 0 then 
	if lds_ctx_template.modifiedcount( ) + lds_ctx_template.deletedcount( ) > 0 then
		lds_ctx_template.update()
	end if 
	lds_ctx_template.reset( )
	lds_ctx_template.retrieve( ll_id)
end if 

if lds_ctx_template.rowcount() = 0 then 
	lds_ctx_template.InsertRow(0)
end if 
//End - Added By Mark 07/21/2014.

lds_ctx_template.SetItem(1,'template_name',astr_copy_ctx.ss_template_name)
lds_ctx_template.SetItem(1,'create_date',today())
lds_ctx_template.SetItem(1,'create_by',gs_user_id)
lds_ctx_template.SetItem(1,'ctx_id',al_template_id)
lds_ctx_template.SetItem(1,'original_ctx_id',astr_copy_ctx.sl_ctx_id)
lds_ctx_template.SetItem(1,'ib_contract_detail',astr_copy_ctx.sb_contract_detail)
lds_ctx_template.SetItem(1,'ib_contract_dates',astr_copy_ctx.sb_contract_dates)
lds_ctx_template.SetItem(1,'ib_custom_data',astr_copy_ctx.sb_custom_data)
lds_ctx_template.SetItem(1,'ib_notes',astr_copy_ctx.sb_notes)
lds_ctx_template.SetItem(1,'ib_contract_contacts',astr_copy_ctx.sb_contracted_contacts)
lds_ctx_template.SetItem(1,'ib_group_access',astr_copy_ctx.sb_group_access)
lds_ctx_template.SetItem(1,'ib_products',astr_copy_ctx.sb_products)
lds_ctx_template.SetItem(1,'ib_our_contacts',astr_copy_ctx.sb_our_contacts)
lds_ctx_template.SetItem(1,'ib_requirements',astr_copy_ctx.sb_requirements)
lds_ctx_template.SetItem(1,'ib_other_contacts',astr_copy_ctx.sb_other_contacts)
lds_ctx_template.SetItem(1,'ib_locations',astr_copy_ctx.sb_locations)
lds_ctx_template.SetItem(1,'ib_organizations',astr_copy_ctx.sb_organizations)
lds_ctx_template.SetItem(1,'ib_fee_schedule',astr_copy_ctx.sb_fee_schedule)
lds_ctx_template.SetItem(1,'ib_document_manager',astr_copy_ctx.sb_document_manager)
lds_ctx_template.SetItem(1,'ib_action_items',astr_copy_ctx.sb_action_items)
lds_ctx_template.SetItem(1,'notes',astr_copy_ctx.ss_template_comment)
lds_ctx_template.SetItem(1,'located_tab_index',astr_copy_ctx.si_located_tab )
lds_ctx_template.SetItem(1,'clear_company',astr_copy_ctx.si_clear_company )
lds_ctx_template.SetItem(1,'add_contact',astr_copy_ctx.si_add_contact )
lds_ctx_template.SetItem(1,'trigger_workflow', astr_copy_ctx.sl_workflow )

//Added By Mark Lee 05/09/12
lds_ctx_template.SetItem(1,'ib_default_email',astr_copy_ctx.ai_ib_default_email )
lds_ctx_template.SetItem(1,'ib_owner', astr_copy_ctx.ai_ib_owner )
//Added By Mark Lee 05/11/12
lds_ctx_template.SetItem(1,'ib_custom_data2',astr_copy_ctx.sb_custom_data2 )
lds_ctx_template.SetItem(1,'ib_custom_multi', astr_copy_ctx.sb_custom_multi )

//Added By Mark Lee 11/20/2012
lds_ctx_template.SetItem(1,'ib_create_child',astr_copy_ctx.ai_ib_create_child )
lds_ctx_template.SetItem(1,'ib_copy_m_company', astr_copy_ctx.ai_ib_copy_m_company )
lds_ctx_template.SetItem(1,'ib_copy_m_company_contact',astr_copy_ctx.ai_ib_copy_m_company_contact )


gnv_appeondb.of_autocommitrollback( )
lds_ctx_template.update()


Return 1
end function

public function long of_copy_ctx_from_template (long al_template_id);
return of_copy_ctx_from_template(al_template_id,'')				//Added By Mark Lee 11/28/2013

//Long ll_new_ctx_id
//str_copy_ctx lstr_copy_ctx
//n_cst_copy_ctx lnv_copy_ctx 
//lnv_copy_ctx = Create n_cst_copy_ctx
//
////Added By Mark Lee 05/09/12	add column ib_create_child , ib_copy_m_company ,ib_copy_m_company_contact
////Added By Mark Lee 05/09/12	add column ib_owner and ib_default_email 
////Get template info
//Select 
//	ctx_id, 
//	ib_contract_detail ,
//	ib_contract_dates ,
//	ib_custom_data,
//	ib_notes ,
//	ib_contract_contacts ,
//	ib_group_access ,
//	ib_products ,
//	ib_our_contacts ,
//	ib_requirements,
//	ib_other_contacts ,
//	ib_locations ,
//	ib_organizations ,
//	ib_fee_schedule ,
//	ib_document_manager ,
//	ib_action_items,
//	located_tab_index,
//	clear_company,
//	add_contact,
//	trigger_workflow,
//	ib_default_email,
//	ib_owner,
//	ib_custom_data2,
//	ib_custom_multi,
//	ib_create_child,
//	ib_copy_m_company,
//	ib_copy_m_company_contact
//into 
//	:lstr_copy_ctx.sl_ctx_id,
//	:lstr_copy_ctx.sb_contract_detail,
//	:lstr_copy_ctx.sb_contract_dates,
//	:lstr_copy_ctx.sb_custom_data,
//	:lstr_copy_ctx.sb_notes,
//	:lstr_copy_ctx.sb_contracted_contacts,
//	:lstr_copy_ctx.sb_group_access,
//	:lstr_copy_ctx.sb_products,
//	:lstr_copy_ctx.sb_our_contacts,
//	:lstr_copy_ctx.sb_requirements,
//	:lstr_copy_ctx.sb_other_contacts,
//	:lstr_copy_ctx.sb_locations,
//	:lstr_copy_ctx.sb_organizations,
//	:lstr_copy_ctx.sb_fee_schedule,
//	:lstr_copy_ctx.sb_document_manager,
//	:lstr_copy_ctx.sb_action_items,
//	:lstr_copy_ctx.si_located_tab,
//	:lstr_copy_ctx.si_clear_company,
//	:lstr_copy_ctx.si_add_contact,
//	:lstr_copy_ctx.sl_workflow,
//	:lstr_copy_ctx.ai_ib_default_email,
//	:lstr_copy_ctx.ai_ib_owner,
//	:lstr_copy_ctx.sb_custom_data2,
//	:lstr_copy_ctx.sb_custom_multi,
//	:lstr_copy_ctx.ai_ib_create_child,
//	:lstr_copy_ctx.ai_ib_copy_m_company,
//	:lstr_copy_ctx.ai_ib_copy_m_company_contact
//From ctx_templates_info
//Where id = :al_template_id;
//
//If sqlca.sqlcode <> 0 Then 
//	Messagebox('Error','Failed to get the template information, please call support.')
//	If isvalid(lnv_copy_ctx) Then Destroy(lnv_copy_ctx)
//	Return -2
//End If
//
////Create New CTX from Template.
//ll_new_ctx_id = lnv_copy_ctx.of_copy_ctx_data(lstr_copy_ctx)
//
//Return ll_new_ctx_id
end function

public function integer of_update_requirement_profile (long al_source_ctx_id, long al_target_ctx_id);//////////////////////////////////////////////////////////////////////
// $<function>n_cst_copy_ctx::of_update_requirement_profile()
// $<arguments>
//		value	long	al_source_ctx_id		
//		value	long	al_target_ctx_id		
// $<returns> integer
// $<description>
// $<description>
//////////////////////////////////////////////////////////////////////
// $<add> 2009-08-26 by Ken.Guo
//////////////////////////////////////////////////////////////////////

long ll_profile_cnt,ll_elements_cnt,i,j,ll_row,ll_record_id
long ll_profile_id,ll_element_id,ll_profile_id_org
DataStore lds_reqmnt_profile,lds_reqmnt_profile_copy, lds_reqmnt_elements,lds_reqmnt_elements_copy
lds_reqmnt_profile = Create DataStore
lds_reqmnt_profile_copy = Create datastore
lds_reqmnt_elements = Create DataStore
lds_reqmnt_elements_copy = Create DataStore
lds_reqmnt_profile.dataobject = 'd_profile_header'
lds_reqmnt_profile_copy.dataobject = 'd_ctx_req_profile_hdr_copy'
lds_reqmnt_elements.dataobject = 'd_contract_profile_req_existing'
lds_reqmnt_elements_copy.dataobject = 'd_ctx_elements_copy'
lds_reqmnt_profile.settransobject(sqlca)
lds_reqmnt_profile_copy.settransobject(sqlca)
lds_reqmnt_elements.settransobject(sqlca)
lds_reqmnt_elements_copy.settransobject(sqlca)


ll_profile_cnt = lds_reqmnt_profile.Retrieve(al_source_ctx_id)
If ll_profile_cnt = 0 Then Return 1

ll_record_id = gnv_app.of_get_id('RECORD_ID')
gnv_appeondb.of_startqueue( )
	Select Max(cTX_REQ_PROFILE_HDR_id) into :ll_profile_id From ctx_req_profile_hdr;
	select max(ctx_elements_id) into :ll_element_id from ctx_elements;
gnv_appeondb.of_commitqueue( )
If Isnull(ll_profile_id) Then ll_profile_id = 0
If Isnull(ll_element_id) Then ll_element_id = 0

For i = 1 To ll_profile_cnt
	ll_profile_id++
	ll_record_id++
	//Insert Profile data
	ll_row = lds_reqmnt_profile_copy.InsertRow(0)
	lds_reqmnt_profile_copy.SetItem(ll_row,'ctx_req_profile_hdr_id',ll_profile_id)
	lds_reqmnt_profile_copy.setitem(ll_row,'ctx_req_profile_id',lds_reqmnt_profile.getitemnumber(i,'ctx_req_profile_id')) // jervis 03.18.2009 hdr_ctx_req_profile_id to ctx_req_profile_id
	lds_reqmnt_profile_copy.setitem(ll_row,'ctx_id',al_target_ctx_id)
	lds_reqmnt_profile_copy.setitem(ll_row,'record_id',ll_record_id) 
	if of_check_unselect_fields(11,'ctx_req_profile_hdr','inserted_by_user') = true then lds_reqmnt_profile_copy.setitem(ll_row,'inserted_by_user',gs_user_id)
	if of_check_unselect_fields(11,'ctx_req_profile_hdr','inserted_at_date_time') = true then lds_reqmnt_profile_copy.setitem(ll_row,'inserted_at_date_time',today())
	if of_check_unselect_fields(11,'ctx_req_profile_hdr','updated_by_user') = true then lds_reqmnt_profile_copy.setitem(ll_row,'updated_by_user',gs_user_id)
	if of_check_unselect_fields(11,'ctx_req_profile_hdr','updated_at_date_time') = true then lds_reqmnt_profile_copy.setitem(ll_row,'updated_at_date_time',today())	
	
	ll_profile_id_org = lds_reqmnt_profile.getitemnumber(i,'ctx_req_profile_hdr_id')
	lds_reqmnt_elements.Retrieve(ll_profile_id_org)
	ll_elements_cnt = lds_reqmnt_elements.RowCount()
	For j = 1 To ll_elements_cnt
			ll_element_id++
			ll_record_id++	
			//Insert Requirement/Elements data
			ll_row = lds_reqmnt_elements_copy.insertrow(0)
			lds_reqmnt_elements_copy.setitem(ll_row,'ctx_elements_id',ll_element_id)
			lds_reqmnt_elements_copy.setitem(ll_row,'ctx_req_profile_hdr_id',ll_profile_id)
			lds_reqmnt_elements_copy.setitem(ll_row,'ctx_req_tmplt_element_id',lds_reqmnt_elements.getitemnumber(j,'ctx_req_tmplt_element_id'))
			if of_check_unselect_fields(12,'ctx_elements','char_value') = true then lds_reqmnt_elements_copy.setitem(ll_row,'char_value',lds_reqmnt_elements.getitemstring(j,'char_value'))			//Added By Mark Lee 06/12/2015
			if of_check_unselect_fields(12,'ctx_elements','integer_value') = true then lds_reqmnt_elements_copy.setitem(ll_row,'integer_value',lds_reqmnt_elements.getitemnumber(j,'integer_value'))
			if of_check_unselect_fields(12,'ctx_elements','date_value') = true then lds_reqmnt_elements_copy.setitem(ll_row,'date_value',lds_reqmnt_elements.getitemdatetime(j,'date_value'))
			if of_check_unselect_fields(12,'ctx_elements','field_value') = true then lds_reqmnt_elements_copy.setitem(ll_row,'field_value',lds_reqmnt_elements.getitemstring(j,'field_value'))
			if of_check_unselect_fields(12,'ctx_elements','money_value') = true then lds_reqmnt_elements_copy.setitem(ll_row,'money_value',lds_reqmnt_elements.getitemdecimal(j,'money_value'))
			lds_reqmnt_elements_copy.setitem(ll_row,'record_id',ll_record_id)
			if of_check_unselect_fields(12,'ctx_elements','clause') = true then lds_reqmnt_elements_copy.setitem(ll_row,'clause',lds_reqmnt_elements.getitemstring(j,'clause'))			
			if of_check_unselect_fields(12,'ctx_elements','inserted_by_user') = true then lds_reqmnt_elements_copy.setitem(ll_row,'inserted_by_user',gs_user_id)
			if of_check_unselect_fields(12,'ctx_elements','inserted_at_date_time') = true then lds_reqmnt_elements_copy.setitem(ll_row,'inserted_at_date_time',today())
			if of_check_unselect_fields(12,'ctx_elements','updated_by_user') = true then lds_reqmnt_elements_copy.setitem(ll_row,'updated_by_user',gs_user_id)
			if of_check_unselect_fields(12,'ctx_elements','updated_at_date_time') = true then lds_reqmnt_elements_copy.setitem(ll_row,'updated_at_date_time',today())
	Next
	
Next
If lds_reqmnt_profile_copy.update() <> 1 Then 
	Messagebox('Error','Failed to copy the requirement profile data.')
	Return 1
End IF
lds_reqmnt_elements_copy.update()
Commit;

//Update Image File
Update ctx_elements set 
	image_file = 
	(Select Image_file from ctx_elements se,ctx_req_profile_hdr sr 
	where se.ctx_req_profile_hdr_id = sr.ctx_req_profile_hdr_id
	and sr.ctx_id = :al_source_ctx_id
	and se.ctx_req_tmplt_element_id = te.ctx_req_tmplt_element_id 
	),
	modify_date = 
	( Select case when modify_date is null then null else getdate() end
	from ctx_elements se,ctx_req_profile_hdr sr 
	where se.ctx_req_profile_hdr_id = sr.ctx_req_profile_hdr_id
	and sr.ctx_id = :al_source_ctx_id
	and se.ctx_req_tmplt_element_id = te.ctx_req_tmplt_element_id 
	)
From ctx_elements te,ctx_req_profile_hdr
Where te.ctx_req_profile_hdr_id = ctx_req_profile_hdr.ctx_req_profile_hdr_id
and ctx_req_profile_hdr.ctx_id = :al_target_ctx_id ;

Return 1

	
end function

public subroutine of_locate_ctx (long al_ctx_id);of_locate_ctx(al_ctx_id,2)

////////////////////////////////////////////////////////////////////////
//// $<function>n_cst_copy_ctxof_locate_ctx()
//// $<arguments>
////		value	long	al_ctx_id		
//// $<returns> (none)
//// $<description>
//// $<description> Locate target ctx.
////////////////////////////////////////////////////////////////////////
//// $<add> 2009-08-27 by Ken.Guo
////////////////////////////////////////////////////////////////////////
//
////Locate new ctx.
//If al_ctx_id > 0 and isvalid(gw_contract) Then
//	gw_contract.setredraw(false)
//	gw_contract.tab_contract_details.setredraw(false)
//	gw_contract.tab_contract_details.tabpage_search.il_ctx_id = al_ctx_id
//	gw_contract.inv_contract_codes.of_set_ctx_id(al_ctx_id)
//	//gw_contract.tab_contract_details.tabpage_search.cb_1.triggerevent(clicked!)
//	gw_contract.tab_contract_details.tabpage_search.ib_retriev_detail = True
//	gw_contract.tab_contract_details.tabpage_search.ib_autoretrieve = True
//	gw_contract.tab_contract_details.tabpage_search.of_retrieve( )
//	gw_contract.inv_contract_codes.of_set_ctx_id(al_ctx_id)
//	gw_contract.wf_set_save_status(false)
//	gw_contract.wf_set_select('All',false)
//	gw_contract.tab_contract_details.tabpage_details.inv_contract_details.il_count = 0
//	gw_contract.of_select_details_tab()	
//	gw_contract.tab_contract_details.tabpage_details.uo_1.dw_1.of_enable_save()
//	Post of_show_contract_window()
//End If
end subroutine

public subroutine of_show_contract_window ();//////////////////////////////////////////////////////////////////////
// $<function>n_cst_copy_ctxof_show_contract_window()
// $<arguments>(None)
// $<returns> (none)
// $<description>
// $<description> Set Focus and Show window if it is hide(To No Flash).
//////////////////////////////////////////////////////////////////////
// $<add> 2009-08-27 by Ken.Guo
// Modified By Ken.Guo 2010-10-09. Moved to w_contract
//////////////////////////////////////////////////////////////////////
//
//gw_contract.setfocus()
//gw_contract.tab_contract_details.tabpage_details.uo_1.dw_1.SetColumn('app_facility')	
//gw_contract.setredraw(True)
//gw_contract.tab_contract_details.setredraw(True)	
//If gb_open_from_template = True Then
//	w_mdi.WindowState = Maximized!
//	w_mdi.Show()
//	gw_Contract.of_Show()
//	gb_open_from_template = False
//End If
//If gw_Contract.windowstate = Minimized! Then 
//	gw_Contract.windowstate = Maximized!
//End If
end subroutine

public function integer of_check_exist_contract ();//Check contract window. Detail tab sometimes(if no contacts data) can not allow to jump to search tab.
integer li_rc,li_tab_index
u_tabpg_contract_master luo_tabpg
If isvalid(gw_contract) Then
	li_tab_index = gw_contract.tab_contract_details.selectedtab
	If li_tab_index <> 1 Then
		luo_tabpg = gw_contract.tab_contract_details.control[li_tab_index]
		li_rc = luo_tabpg.Dynamic of_validation( )
		If li_rc < 0 Then 
			If gw_contract.windowstate = Minimized! Then gw_contract.windowstate = Maximized!
			Messagebox('ContractLogix','Please save current contract before you create a new contract.')
			Return 0
		End If
	End If
End If
Return 1
end function

public function integer of_locate_ctx (long al_ctx_id, integer ai_tab_index);//////////////////////////////////////////////////////////////////////
// $<function>n_cst_copy_ctxof_locate_ctx()
// $<arguments>
//		value	long   	al_ctx_id   		
//		value	integer	ai_tab_index		
// $<returns> integer
// $<description>Locate target ctx and selected specail tab.
// $<description>
//////////////////////////////////////////////////////////////////////
// $<add> 2009-08-28 by Ken.Guo
//////////////////////////////////////////////////////////////////////


String ls_tab_name
Choose Case ai_tab_index
	Case 1
		ls_tab_name = 'tabpage_search'
	Case 2
		If gw_contract.tab_contract_details.tabpage_details.visible = True Then
			ls_tab_name = 'tabpage_details'			
		Else
			ls_tab_name = 'tabpage_search'
		End If
	Case 3
		If gw_contract.tab_contract_details.tabpage_requirements.visible = True Then
			ls_tab_name = 'tabpage_requirements'			
		Else
			ls_tab_name = 'tabpage_search'
		End If		
	Case 4
			If gw_contract.tab_contract_details.tabpage_contacts.visible = True Then
			ls_tab_name = 'tabpage_contacts'			
		Else
			ls_tab_name = 'tabpage_search'
		End If
	Case 5
		If gw_contract.tab_contract_details.tabpage_locations.visible = True Then
			ls_tab_name = 'tabpage_locations'			
		Else
			ls_tab_name = 'tabpage_search'
		End If		
	Case 6
		If gw_contract.tab_contract_details.tabpage_orgabizations.visible = True Then
			ls_tab_name = 'tabpage_orgabizations'			
		Else
			ls_tab_name = 'tabpage_search'
		End If		
	Case 7
		If gw_contract.tab_contract_details.tabpage_fee_schedules.visible = True Then
			ls_tab_name = 'tabpage_fee_schedules'			
		Else
			ls_tab_name = 'tabpage_search'
		End If		
	Case 8
		If gw_contract.tab_contract_details.tabpage_fee_sched2.visible = True Then
			ls_tab_name = 'tabpage_fee_sched2'			
		Else
			ls_tab_name = 'tabpage_search'
		End If		
	Case 9
		ls_tab_name = ''
		If gw_contract.tab_contract_details.tabpage_images.visible = True Then
			ls_tab_name = 'tabpage_images'			
		Else
			ls_tab_name = 'tabpage_search'
		End If		
	Case 10
		If gw_contract.tab_contract_details.tabpage_action_items.visible = True Then
			ls_tab_name = 'tabpage_action_items'			
		Else
			ls_tab_name = 'tabpage_search'
		End If		
	Case Else
		ls_tab_name = 'tabpage_search'
End Choose
		

//Locate new ctx.
Boolean lb_autoretrieve  //Added By Ken.Guo 2017-08-02 .  Task 809:To do list not updating. Part II.
If al_ctx_id > 0 and isvalid(gw_contract) Then
	openwithparm( w_appeon_gifofwait, "Refreshing the contract detail..." ) //Added By Jay Chen 05-14-2015
	timer(0,w_appeon_gifofwait)
	gw_contract.setredraw(false)
	gw_contract.tab_contract_details.setredraw(false)
	gw_contract.tab_contract_details.tabpage_search.il_ctx_id = al_ctx_id
	gw_contract.inv_contract_codes.of_set_ctx_id(al_ctx_id)
	//gw_contract.tab_contract_details.tabpage_search.cb_1.triggerevent(clicked!)
	gw_contract.tab_contract_details.tabpage_search.ib_retriev_detail = True
	lb_autoretrieve = gw_contract.tab_contract_details.tabpage_search.ib_autoretrieve  //Added By Ken.Guo 2017-08-02 save auto retrieve status
	gw_contract.tab_contract_details.tabpage_search.ib_autoretrieve = True
	w_appeon_gifofwait.of_setposition(50) 
	gw_contract.tab_contract_details.tabpage_search.of_retrieve( )
	gw_contract.inv_contract_codes.of_set_ctx_id(al_ctx_id)
	gw_contract.tab_contract_details.tabpage_search.ib_autoretrieve = lb_autoretrieve  //Added By Ken.Guo 2017-08-02  restore auto retrieve status
	gw_contract.wf_set_save_status(false)
	gw_contract.wf_set_select('All',false)
	gw_contract.tab_contract_details.tabpage_details.inv_contract_details.il_count = 0
	//gw_contract.of_select_details_tab()	
	w_appeon_gifofwait.of_setposition(80)
	gw_contract.of_select_tabpage(ls_tab_name)
	
	//the contracted company name must be filled before the contract can be saved - jervis 09.05.2011
	if ai_tab_index = 2 and  gw_contract.tab_contract_details.tabpage_details.visible = True then
		gw_contract.tab_contract_details.tabpage_details.uo_1.dw_1.SetItemStatus( 1, 'app_facility',Primary!, DataModified!)
	end if
	
	//gw_contract.tab_contract_details.tabpage_details.uo_1.dw_1.of_enable_save()
	gw_contract.Post of_show_contract_window()
	w_appeon_gifofwait.of_setposition(100)
	If isvalid(w_appeon_gifofwait) Then close(w_appeon_gifofwait)
End If

Return 1
end function

public subroutine of_copy_alarms (str_copy_ctx astr_copy_ctx, long al_ctx_id, long al_ori_action_id[], long al_new_action_id[]);//Copy Alarms data -- Add by jervis 08.18.2010
//Add al_ori_action_id,al_new_action_id parm -- jervis 12.31.2010
long ll_i,ll_count

//Copy Alarms for Action Item  -- jervis 12.31.2010
if astr_copy_ctx.sb_action_items = 1 then
	ll_count = Upperbound(al_ori_action_id)
	for ll_i = 1 to ll_count
		insert into ctx_ai_notification(ctx_id,
			ctx_action_item_id,
			alm_table,
			alm_column,
			alm_message,
			alm_enabled,
			alm_notification_days,
			alm_post_notification_days,
			alm_total_tries,
			alm_action_item_posted,
			alm_frequency,
			create_action_item,
			record_id,
			alm_auto_increment_years,
			alm_action_title,
			wf_id,
			alm_auto_increment_unit,
			alm_email_template_id,
			alm_message_blob,
			alm_attachment_name,
			alm_attachment,
			alm_mailto,
			auto_sign,
			alm_create,
			alm_subject)
		SELECT :al_ctx_id,
			:al_new_action_id[ll_i],
			alm_table,
			alm_column,
			alm_message,
			alm_enabled,
			alm_notification_days,
			alm_post_notification_days,
			alm_total_tries,
			alm_action_item_posted,
			alm_frequency,
			create_action_item,
			record_id,
			alm_auto_increment_years,
			alm_action_title,
			wf_id,
			alm_auto_increment_unit,
			alm_email_template_id,
			alm_message_blob,
			alm_attachment_name,
			alm_attachment,
			alm_mailto,
			auto_sign,
			alm_create,
			alm_subject
	  FROM ctx_ai_notification
	  where ctx_id = :astr_copy_ctx.sl_ctx_id and ctx_action_item_id = :al_ori_action_id[ll_i];
	  
		insert into ctx_ai_alarm_attachment(ctx_id,
			item_id,
			alm_table,
			alm_column,
			attach_id,
			alm_attachment_name,
			alm_attachment
		)
		SELECT :al_ctx_id,
			:al_new_action_id[ll_i],
			alm_table,
			alm_column,
			attach_id,
			alm_attachment_name,
			alm_attachment
		FROM ctx_ai_alarm_attachment
		where ctx_id = :astr_copy_ctx.sl_ctx_id and item_id = :al_ori_action_id[ll_i];
	next
end if

//Copy alarm for Custom Data2	-- Jervis 06.10.2011
if astr_copy_ctx.sb_custom_data2 = 1 then
	insert into CTX_NOTIFICATION(ctx_id,
      alm_message,
      alm_enabled,
      alm_table,
      alm_column,
      alm_notification_days,
      alm_post_notification_days,
      alm_total_tries,
      alm_action_item_posted,
      alm_frequency,
      create_action_item,
      record_id,
      alm_auto_increment_years,
      alm_action_title,
      wf_id,
      alm_auto_increment_unit,
      alm_email_template_id,
      alm_message_blob,
      alm_attachment_name,
      alm_attachment,
      alm_mailto,
      auto_sign,
      alm_create,
      alm_subject
	)
	SELECT :al_ctx_id,
      alm_message,
      alm_enabled,
      alm_table,
      alm_column,
      alm_notification_days,
      alm_post_notification_days,
      alm_total_tries,
      alm_action_item_posted,
      alm_frequency,
      create_action_item,
      record_id,
      alm_auto_increment_years,
      alm_action_title,
      wf_id,
      alm_auto_increment_unit,
      alm_email_template_id,
      alm_message_blob,
      alm_attachment_name,
      alm_attachment,
      alm_mailto,
      auto_sign,
      alm_create,
      alm_subject
  FROM CTX_NOTIFICATION
  where ctx_id = :astr_copy_ctx.sl_ctx_id and
  		alm_table = 'ctx_custom';
  
	
	insert into ctx_alarm_attachment(ctx_id,
		alm_table,
		alm_column,
		attach_id,
		alm_attachment_name,
		alm_attachment
	)
	SELECT :al_ctx_id,
		alm_table,
		alm_column,
		attach_id,
		alm_attachment_name,
		alm_attachment
	FROM ctx_alarm_attachment
	where ctx_id = :astr_copy_ctx.sl_ctx_id and
  		alm_table = 'ctx_custom' ;
	
end if

//Copy for Contract alarms
If astr_copy_ctx.sb_contract_dates = 1 and astr_copy_ctx.sb_custom_data = 1 Then
	insert into CTX_NOTIFICATION(ctx_id,
      alm_message,
      alm_enabled,
      alm_table,
      alm_column,
      alm_notification_days,
      alm_post_notification_days,
      alm_total_tries,
      alm_action_item_posted,
      alm_frequency,
      create_action_item,
      record_id,
      alm_auto_increment_years,
      alm_action_title,
      wf_id,
      alm_auto_increment_unit,
      alm_email_template_id,
      alm_message_blob,
      alm_attachment_name,
      alm_attachment,
      alm_mailto,
      auto_sign,
      alm_create,
      alm_subject
	)
	SELECT :al_ctx_id,
      alm_message,
      alm_enabled,
      alm_table,
      alm_column,
      alm_notification_days,
      alm_post_notification_days,
      alm_total_tries,
      alm_action_item_posted,
      alm_frequency,
      create_action_item,
      record_id,
      alm_auto_increment_years,
      alm_action_title,
      wf_id,
      alm_auto_increment_unit,
      alm_email_template_id,
      alm_message_blob,
      alm_attachment_name,
      alm_attachment,
      alm_mailto,
      auto_sign,
      alm_create,
      alm_subject
  FROM CTX_NOTIFICATION
  where ctx_id = :astr_copy_ctx.sl_ctx_id;
  
	
	insert into ctx_alarm_attachment(ctx_id,
		alm_table,
		alm_column,
		attach_id,
		alm_attachment_name,
		alm_attachment
	)
	SELECT :al_ctx_id,
		alm_table,
		alm_column,
		attach_id,
		alm_attachment_name,
		alm_attachment
	FROM ctx_alarm_attachment
	where ctx_id = :astr_copy_ctx.sl_ctx_id;
elseif astr_copy_ctx.sb_contract_dates = 1 then
		insert into CTX_NOTIFICATION(ctx_id,
      alm_message,
      alm_enabled,
      alm_table,
      alm_column,
      alm_notification_days,
      alm_post_notification_days,
      alm_total_tries,
      alm_action_item_posted,
      alm_frequency,
      create_action_item,
      record_id,
      alm_auto_increment_years,
      alm_action_title,
      wf_id,
      alm_auto_increment_unit,
      alm_email_template_id,
      alm_message_blob,
      alm_attachment_name,
      alm_attachment,
      alm_mailto,
      auto_sign,
      alm_create,
      alm_subject
	)
	SELECT :al_ctx_id,
      alm_message,
      alm_enabled,
      alm_table,
      alm_column,
      alm_notification_days,
      alm_post_notification_days,
      alm_total_tries,
      alm_action_item_posted,
      alm_frequency,
      create_action_item,
      record_id,
      alm_auto_increment_years,
      alm_action_title,
      wf_id,
      alm_auto_increment_unit,
      alm_email_template_id,
      alm_message_blob,
      alm_attachment_name,
      alm_attachment,
      alm_mailto,
      auto_sign,
      alm_create,
      alm_subject
  FROM CTX_NOTIFICATION
  where ctx_id = :astr_copy_ctx.sl_ctx_id and
  		alm_table = 'ctx_basic_info' and 
		alm_column in ('effective_date','expriation_date','review_date','other_date_1','term_date','other_date_2','last_revis_dateversion_date');
  
	
	insert into ctx_alarm_attachment(ctx_id,
		alm_table,
		alm_column,
		attach_id,
		alm_attachment_name,
		alm_attachment
	)
	SELECT :al_ctx_id,
		alm_table,
		alm_column,
		attach_id,
		alm_attachment_name,
		alm_attachment
	FROM ctx_alarm_attachment
	where ctx_id = :astr_copy_ctx.sl_ctx_id and
  		alm_table = 'ctx_basic_info' and 
		alm_column in('effective_date','expriation_date','review_date','other_date_1','term_date','other_date_2','last_revis_dateversion_date');
	
elseif astr_copy_ctx.sb_custom_data = 1 then
		insert into CTX_NOTIFICATION(ctx_id,
      alm_message,
      alm_enabled,
      alm_table,
      alm_column,
      alm_notification_days,
      alm_post_notification_days,
      alm_total_tries,
      alm_action_item_posted,
      alm_frequency,
      create_action_item,
      record_id,
      alm_auto_increment_years,
      alm_action_title,
      wf_id,
      alm_auto_increment_unit,
      alm_email_template_id,
      alm_message_blob,
      alm_attachment_name,
      alm_attachment,
      alm_mailto,
      auto_sign,
      alm_create,
      alm_subject
	)
	SELECT :al_ctx_id,
      alm_message,
      alm_enabled,
      alm_table,
      alm_column,
      alm_notification_days,
      alm_post_notification_days,
      alm_total_tries,
      alm_action_item_posted,
      alm_frequency,
      create_action_item,
      record_id,
      alm_auto_increment_years,
      alm_action_title,
      wf_id,
      alm_auto_increment_unit,
      alm_email_template_id,
      alm_message_blob,
      alm_attachment_name,
      alm_attachment,
      alm_mailto,
      auto_sign,
      alm_create,
      alm_subject
  FROM CTX_NOTIFICATION
  where ctx_id = :astr_copy_ctx.sl_ctx_id and
  		alm_table = 'ctx_basic_info' and 
		alm_column not in ('effective_date','expriation_date','review_date','other_date_1','term_date','other_date_2','last_revis_dateversion_date');
  
	
	insert into ctx_alarm_attachment(ctx_id,
		alm_table,
		alm_column,
		attach_id,
		alm_attachment_name,
		alm_attachment
	)
	SELECT :al_ctx_id,
		alm_table,
		alm_column,
		attach_id,
		alm_attachment_name,
		alm_attachment
	FROM ctx_alarm_attachment
	where ctx_id = :astr_copy_ctx.sl_ctx_id and
  		alm_table = 'ctx_basic_info' and 
		alm_column not in ('effective_date','expriation_date','review_date','other_date_1','term_date','other_date_2','last_revis_dateversion_date');
end if

end subroutine

public subroutine of_copy_custom_data (str_copy_ctx astr_copy_ctx, long al_new_ctx_id);//Copy Custom data2 and custom multi -- Add by jervis 06.10.2011
long 	i,ll_count, ll_Rtn, ll_row
DataStore		lds_ctx_custom, lds_ctx_custom_copy
DataStore		lds_contract_multi_header, lds_contract_multi_header_copy
DataStore		lds_ctx_custom_multi_detail, lds_ctx_custom_multi_detail_copy
string ls_colname
long ll_cnt
String		ls_custom_fields, ls_sql		//Added by Harry 20170517


//Added by Harry 20170620 for Task 728
datastore lds_dync_1
datastore lds_dync_2

lds_dync_1 = Create datastore
lds_dync_2 = Create datastore


//Copy Custom data 2			
//if astr_copy_ctx.sb_custom_data2 = 1 then
If astr_copy_ctx.sb_custom_data2 = 1 and of_get_screen_exist(il_view, 10) Then //Modified by harry 20170622
//	INSERT INTO ctx_custom(ctx_id,custom_1,custom_2,custom_3,custom_4,custom_5,custom_6,custom_7,custom_8,custom_9,custom_10,custom_11,custom_12,custom_13,custom_14,custom_15,custom_16,custom_17
//	,custom_18,custom_19,custom_20,custom_date1,custom_date2,custom_date3,custom_date4,custom_date5,custom_date6,custom_date7,custom_date8,custom_date9,custom_date10,custom_date11,custom_date12
//	,custom_date13,custom_date14,custom_date15,custom_n1,custom_n2,custom_n3,custom_n4,custom_n5,custom_n6,custom_n7,custom_n8,custom_n9,custom_n10,custom_n11,custom_n12,custom_n13
//	,custom_n14,custom_n15,custom_n16,custom_n17,custom_n18,custom_n19,custom_n20,custom_n21,custom_n22,custom_n23,custom_n24,custom_n25,custom_21,custom_22,custom_notes_1,custom_notes_2
//	,custom_notes_3,custom_notes_4,custom_notes_5,custom_money_1,custom_money_2,custom_money_3,custom_percent_1,custom_percent_2,custom_percent_3,custom_percent_4,custom_percent_5
//	,custom_percent_6,custom_percent_7,custom_percent_8,custom_percent_9,custom_percent_10)
//		select :al_new_ctx_id,custom_1,custom_2,custom_3,custom_4,custom_5,custom_6,custom_7,custom_8,custom_9,custom_10,custom_11,custom_12,custom_13,custom_14,custom_15,custom_16,custom_17
//		,custom_18,custom_19,custom_20,custom_date1,custom_date2,custom_date3,custom_date4,custom_date5,custom_date6,custom_date7,custom_date8,custom_date9,custom_date10,custom_date11
//		,custom_date12,custom_date13,custom_date14,custom_date15,custom_n1,custom_n2,custom_n3,custom_n4,custom_n5,custom_n6,custom_n7,custom_n8,custom_n9,custom_n10,custom_n11
//		,custom_n12,custom_n13,custom_n14,custom_n15,custom_n16,custom_n17,custom_n18,custom_n19,custom_n20,custom_n21,custom_n22,custom_n23,custom_n24,custom_n25,custom_21,custom_22
//		,custom_notes_1,custom_notes_2,custom_notes_3,custom_notes_4,custom_notes_5,custom_money_1,custom_money_2,custom_money_3,custom_percent_1,custom_percent_2,custom_percent_3
//		,custom_percent_4,custom_percent_5,custom_percent_6,custom_percent_7,custom_percent_8,custom_percent_9,custom_percent_10
//		from ctx_custom 
//		where ctx_id = :astr_copy_ctx.sl_ctx_id;

	lds_ctx_custom = Create DataStore
	lds_ctx_custom.DataObject = "d_contract_det_custom_2"
	lds_ctx_custom.SetTransObject(SQLCA)
	
	lds_ctx_custom_copy = Create DataStore
	lds_ctx_custom_copy.DataObject = "d_contract_det_custom_2"				// copy a datawindow
	lds_ctx_custom_copy.SetTransObject(SQLCA)
	
	lds_ctx_custom.retrieve(astr_copy_ctx.sl_ctx_id )
	ll_count = lds_ctx_custom.rowcount()
	
	f_create_contract_ds (il_view, 10, lds_dync_1)  //Added by Harry 20170622
	
	for i =1 to ll_count
		ll_row = lds_ctx_custom_copy.insertrow(0)		
		lds_ctx_custom_copy.setitem(ll_row,'ctx_id',al_new_ctx_id)	
		ls_custom_fields = "" //Added by Harry 20170517
		//commented by Harry 20170517
		/*
		if of_check_unselect_fields(10,'ctx_custom','custom_1') = true then lds_ctx_custom_copy.setitem(ll_row,'custom_1',lds_ctx_custom.getitemstring(i,'custom_1'))
		if of_check_unselect_fields(10,'ctx_custom','custom_2') = true then lds_ctx_custom_copy.setitem(ll_row,'custom_2',lds_ctx_custom.getitemstring(i,'custom_2'))
		if of_check_unselect_fields(10,'ctx_custom','custom_3') = true then lds_ctx_custom_copy.setitem(ll_row,'custom_3',lds_ctx_custom.getitemstring(i,'custom_3'))
		if of_check_unselect_fields(10,'ctx_custom','custom_4') = true then lds_ctx_custom_copy.setitem(ll_row,'custom_4',lds_ctx_custom.getitemstring(i,'custom_4'))
		if of_check_unselect_fields(10,'ctx_custom','custom_5') = true then lds_ctx_custom_copy.setitem(ll_row,'custom_5',lds_ctx_custom.getitemstring(i,'custom_5'))
		if of_check_unselect_fields(10,'ctx_custom','custom_6') = true then lds_ctx_custom_copy.setitem(ll_row,'custom_6',lds_ctx_custom.getitemstring(i,'custom_6'))
		if of_check_unselect_fields(10,'ctx_custom','custom_7') = true then lds_ctx_custom_copy.setitem(ll_row,'custom_7',lds_ctx_custom.getitemstring(i,'custom_7'))
		if of_check_unselect_fields(10,'ctx_custom','custom_8') = true then lds_ctx_custom_copy.setitem(ll_row,'custom_8',lds_ctx_custom.getitemstring(i,'custom_8'))		
		if of_check_unselect_fields(10,'ctx_custom','custom_9') = true then lds_ctx_custom_copy.setitem(ll_row,'custom_9',lds_ctx_custom.getitemstring(i,'custom_9'))
		if of_check_unselect_fields(10,'ctx_custom','custom_10') = true then lds_ctx_custom_copy.setitem(ll_row,'custom_10',lds_ctx_custom.getitemstring(i,'custom_10'))
		if of_check_unselect_fields(10,'ctx_custom','custom_11') = true then lds_ctx_custom_copy.setitem(ll_row,'custom_11',lds_ctx_custom.getitemstring(i,'custom_11'))
		if of_check_unselect_fields(10,'ctx_custom','custom_12') = true then lds_ctx_custom_copy.setitem(ll_row,'custom_12',lds_ctx_custom.getitemstring(i,'custom_12'))
		if of_check_unselect_fields(10,'ctx_custom','custom_13') = true then lds_ctx_custom_copy.setitem(ll_row,'custom_13',lds_ctx_custom.getitemstring(i,'custom_13'))
		if of_check_unselect_fields(10,'ctx_custom','custom_14') = true then lds_ctx_custom_copy.setitem(ll_row,'custom_14',lds_ctx_custom.getitemstring(i,'custom_14'))
		if of_check_unselect_fields(10,'ctx_custom','custom_15') = true then lds_ctx_custom_copy.setitem(ll_row,'custom_15',lds_ctx_custom.getitemstring(i,'custom_15'))
		if of_check_unselect_fields(10,'ctx_custom','custom_16') = true then lds_ctx_custom_copy.setitem(ll_row,'custom_16',lds_ctx_custom.getitemstring(i,'custom_16'))
		if of_check_unselect_fields(10,'ctx_custom','custom_17') = true then lds_ctx_custom_copy.setitem(ll_row,'custom_17',lds_ctx_custom.getitemstring(i,'custom_17'))
		if of_check_unselect_fields(10,'ctx_custom','custom_18') = true then lds_ctx_custom_copy.setitem(ll_row,'custom_18',lds_ctx_custom.getitemstring(i,'custom_18'))
		if of_check_unselect_fields(10,'ctx_custom','custom_19') = true then lds_ctx_custom_copy.setitem(ll_row,'custom_19',lds_ctx_custom.getitemstring(i,'custom_19'))
		if of_check_unselect_fields(10,'ctx_custom','custom_20') = true then lds_ctx_custom_copy.setitem(ll_row,'custom_20',lds_ctx_custom.getitemstring(i,'custom_20'))
		*/
		if of_check_unselect_fields(10,'ctx_custom','custom_date1') = true then of_set_value(lds_dync_1, 'custom_date1', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DT')	//Modified by harry 20170621      lds_ctx_custom_copy.setitem(ll_row,'custom_date1',lds_ctx_custom.getitemdatetime(i,'custom_date1'))
		if of_check_unselect_fields(10,'ctx_custom','custom_date2') = true then of_set_value(lds_dync_1, 'custom_date2', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DT')	//Modified by harry 20170621      lds_ctx_custom_copy.setitem(ll_row,'custom_date2',lds_ctx_custom.getitemdatetime(i,'custom_date2'))
		if of_check_unselect_fields(10,'ctx_custom','custom_date3') = true then of_set_value(lds_dync_1, 'custom_date3', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DT')	//Modified by harry 20170621      lds_ctx_custom_copy.setitem(ll_row,'custom_date3',lds_ctx_custom.getitemdatetime(i,'custom_date3'))
		if of_check_unselect_fields(10,'ctx_custom','custom_date4') = true then of_set_value(lds_dync_1, 'custom_date4', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DT')	//Modified by harry 20170621      lds_ctx_custom_copy.setitem(ll_row,'custom_date4',lds_ctx_custom.getitemdatetime(i,'custom_date4'))
		if of_check_unselect_fields(10,'ctx_custom','custom_date5') = true then of_set_value(lds_dync_1, 'custom_date5', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DT')	//Modified by harry 20170621      lds_ctx_custom_copy.setitem(ll_row,'custom_date5',lds_ctx_custom.getitemdatetime(i,'custom_date5'))
		if of_check_unselect_fields(10,'ctx_custom','custom_date6') = true then of_set_value(lds_dync_1, 'custom_date6', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DT')	//Modified by harry 20170621      lds_ctx_custom_copy.setitem(ll_row,'custom_date6',lds_ctx_custom.getitemdatetime(i,'custom_date6'))
		if of_check_unselect_fields(10,'ctx_custom','custom_date7') = true then of_set_value(lds_dync_1, 'custom_date7', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DT')	//Modified by harry 20170621      lds_ctx_custom_copy.setitem(ll_row,'custom_date7',lds_ctx_custom.getitemdatetime(i,'custom_date7'))
		if of_check_unselect_fields(10,'ctx_custom','custom_date8') = true then of_set_value(lds_dync_1, 'custom_date8', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DT')	//Modified by harry 20170621      lds_ctx_custom_copy.setitem(ll_row,'custom_date8',lds_ctx_custom.getitemdatetime(i,'custom_date8'))
		if of_check_unselect_fields(10,'ctx_custom','custom_date9') = true then of_set_value(lds_dync_1, 'custom_date9', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DT')	//Modified by harry 20170621      lds_ctx_custom_copy.setitem(ll_row,'custom_date9',lds_ctx_custom.getitemdatetime(i,'custom_date9'))
		if of_check_unselect_fields(10,'ctx_custom','custom_date10') = true then of_set_value(lds_dync_1, 'custom_date10', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DT')	//Modified by harry 20170621      lds_ctx_custom_copy.setitem(ll_row,'custom_date10',lds_ctx_custom.getitemdatetime(i,'custom_date10'))
		if of_check_unselect_fields(10,'ctx_custom','custom_date11') = true then of_set_value(lds_dync_1, 'custom_date11', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DT')	//Modified by harry 20170621      lds_ctx_custom_copy.setitem(ll_row,'custom_date11',lds_ctx_custom.getitemdatetime(i,'custom_date11'))
		if of_check_unselect_fields(10,'ctx_custom','custom_date12') = true then of_set_value(lds_dync_1, 'custom_date12', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DT')	//Modified by harry 20170621      lds_ctx_custom_copy.setitem(ll_row,'custom_date12',lds_ctx_custom.getitemdatetime(i,'custom_date12'))
		if of_check_unselect_fields(10,'ctx_custom','custom_date13') = true then of_set_value(lds_dync_1, 'custom_date13', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DT')	//Modified by harry 20170621      lds_ctx_custom_copy.setitem(ll_row,'custom_date13',lds_ctx_custom.getitemdatetime(i,'custom_date13'))
		if of_check_unselect_fields(10,'ctx_custom','custom_date14') = true then of_set_value(lds_dync_1, 'custom_date14', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DT')	//Modified by harry 20170621      lds_ctx_custom_copy.setitem(ll_row,'custom_date14',lds_ctx_custom.getitemdatetime(i,'custom_date14'))
		if of_check_unselect_fields(10,'ctx_custom','custom_date15') = true then of_set_value(lds_dync_1, 'custom_date15', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DT')	//Modified by harry 20170621      lds_ctx_custom_copy.setitem(ll_row,'custom_date15',lds_ctx_custom.getitemdatetime(i,'custom_date15'))
		
		if of_check_unselect_fields(10,'ctx_custom','custom_n1') = true then of_set_value(lds_dync_1, 'custom_n1', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_copy.setitem(ll_row,'custom_n1',lds_ctx_custom.getitemdecimal(i,'custom_n1'))
		if of_check_unselect_fields(10,'ctx_custom','custom_n2') = true then of_set_value(lds_dync_1, 'custom_n2', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_copy.setitem(ll_row,'custom_n2',lds_ctx_custom.getitemdecimal(i,'custom_n2'))
		if of_check_unselect_fields(10,'ctx_custom','custom_n3') = true then of_set_value(lds_dync_1, 'custom_n3', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_copy.setitem(ll_row,'custom_n3',lds_ctx_custom.getitemdecimal(i,'custom_n3'))
		if of_check_unselect_fields(10,'ctx_custom','custom_n4') = true then of_set_value(lds_dync_1, 'custom_n4', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_copy.setitem(ll_row,'custom_n4',lds_ctx_custom.getitemdecimal(i,'custom_n4'))
		if of_check_unselect_fields(10,'ctx_custom','custom_n5') = true then of_set_value(lds_dync_1, 'custom_n5', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_copy.setitem(ll_row,'custom_n5',lds_ctx_custom.getitemdecimal(i,'custom_n5'))				
		if of_check_unselect_fields(10,'ctx_custom','custom_n6') = true then of_set_value(lds_dync_1, 'custom_n6', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_copy.setitem(ll_row,'custom_n6',lds_ctx_custom.getitemdecimal(i,'custom_n6'))
		if of_check_unselect_fields(10,'ctx_custom','custom_n7') = true then of_set_value(lds_dync_1, 'custom_n7', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_copy.setitem(ll_row,'custom_n7',lds_ctx_custom.getitemdecimal(i,'custom_n7'))
		if of_check_unselect_fields(10,'ctx_custom','custom_n8') = true then of_set_value(lds_dync_1, 'custom_n8', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_copy.setitem(ll_row,'custom_n8',lds_ctx_custom.getitemdecimal(i,'custom_n8'))
		if of_check_unselect_fields(10,'ctx_custom','custom_n9') = true then of_set_value(lds_dync_1, 'custom_n9', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_copy.setitem(ll_row,'custom_n9',lds_ctx_custom.getitemdecimal(i,'custom_n9'))
		if of_check_unselect_fields(10,'ctx_custom','custom_n10') = true then of_set_value(lds_dync_1, 'custom_n10', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_copy.setitem(ll_row,'custom_n10',lds_ctx_custom.getitemdecimal(i,'custom_n10'))
		if of_check_unselect_fields(10,'ctx_custom','custom_n11') = true then of_set_value(lds_dync_1, 'custom_n11', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_copy.setitem(ll_row,'custom_n11',lds_ctx_custom.getitemdecimal(i,'custom_n11'))
		if of_check_unselect_fields(10,'ctx_custom','custom_n12') = true then of_set_value(lds_dync_1, 'custom_n12', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_copy.setitem(ll_row,'custom_n12',lds_ctx_custom.getitemdecimal(i,'custom_n12'))
		if of_check_unselect_fields(10,'ctx_custom','custom_n13') = true then of_set_value(lds_dync_1, 'custom_n13', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_copy.setitem(ll_row,'custom_n13',lds_ctx_custom.getitemdecimal(i,'custom_n13'))
		if of_check_unselect_fields(10,'ctx_custom','custom_n14') = true then of_set_value(lds_dync_1, 'custom_n14', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_copy.setitem(ll_row,'custom_n14',lds_ctx_custom.getitemdecimal(i,'custom_n14'))
		if of_check_unselect_fields(10,'ctx_custom','custom_n15') = true then of_set_value(lds_dync_1, 'custom_n15', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_copy.setitem(ll_row,'custom_n15',lds_ctx_custom.getitemdecimal(i,'custom_n15'))
		if of_check_unselect_fields(10,'ctx_custom','custom_n16') = true then of_set_value(lds_dync_1, 'custom_n16', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_copy.setitem(ll_row,'custom_n16',lds_ctx_custom.getitemdecimal(i,'custom_n16'))
		if of_check_unselect_fields(10,'ctx_custom','custom_n17') = true then of_set_value(lds_dync_1, 'custom_n17', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_copy.setitem(ll_row,'custom_n17',lds_ctx_custom.getitemdecimal(i,'custom_n17'))
		if of_check_unselect_fields(10,'ctx_custom','custom_n18') = true then of_set_value(lds_dync_1, 'custom_n18', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_copy.setitem(ll_row,'custom_n18',lds_ctx_custom.getitemdecimal(i,'custom_n18'))
		if of_check_unselect_fields(10,'ctx_custom','custom_n19') = true then of_set_value(lds_dync_1, 'custom_n19', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_copy.setitem(ll_row,'custom_n19',lds_ctx_custom.getitemdecimal(i,'custom_n19'))
		if of_check_unselect_fields(10,'ctx_custom','custom_n20') = true then of_set_value(lds_dync_1, 'custom_n20', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_copy.setitem(ll_row,'custom_n20',lds_ctx_custom.getitemdecimal(i,'custom_n20'))
		if of_check_unselect_fields(10,'ctx_custom','custom_n21') = true then of_set_value(lds_dync_1, 'custom_n21', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_copy.setitem(ll_row,'custom_n21',lds_ctx_custom.getitemdecimal(i,'custom_n21'))
		if of_check_unselect_fields(10,'ctx_custom','custom_n22') = true then of_set_value(lds_dync_1, 'custom_n22', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_copy.setitem(ll_row,'custom_n22',lds_ctx_custom.getitemdecimal(i,'custom_n22'))
		if of_check_unselect_fields(10,'ctx_custom','custom_n23') = true then of_set_value(lds_dync_1, 'custom_n23', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_copy.setitem(ll_row,'custom_n23',lds_ctx_custom.getitemdecimal(i,'custom_n23'))
		if of_check_unselect_fields(10,'ctx_custom','custom_n24') = true then of_set_value(lds_dync_1, 'custom_n24', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_copy.setitem(ll_row,'custom_n24',lds_ctx_custom.getitemdecimal(i,'custom_n24'))
		if of_check_unselect_fields(10,'ctx_custom','custom_n25') = true then of_set_value(lds_dync_1, 'custom_n25', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_copy.setitem(ll_row,'custom_n25',lds_ctx_custom.getitemdecimal(i,'custom_n25'))
		//commented by Harry 20170517
		/*
		if of_check_unselect_fields(10,'ctx_custom','custom_21') = true then lds_ctx_custom_copy.setitem(ll_row,'custom_21',lds_ctx_custom.getitemstring(i,'custom_21'))
		if of_check_unselect_fields(10,'ctx_custom','custom_22') = true then lds_ctx_custom_copy.setitem(ll_row,'custom_22',lds_ctx_custom.getitemstring(i,'custom_22'))
		//Added By Jay Chen 08-03-2015 add field custom_26---custom_75 and custom_n26---custom_n70 for screen custom data 2
		if of_check_unselect_fields(10,'ctx_custom','custom_26') = true then lds_ctx_custom_copy.setitem(ll_row,'custom_26',lds_ctx_custom.getitemstring(i,'custom_26'))
		if of_check_unselect_fields(10,'ctx_custom','custom_27') = true then lds_ctx_custom_copy.setitem(ll_row,'custom_27',lds_ctx_custom.getitemstring(i,'custom_27'))
		if of_check_unselect_fields(10,'ctx_custom','custom_28') = true then lds_ctx_custom_copy.setitem(ll_row,'custom_28',lds_ctx_custom.getitemstring(i,'custom_28'))
		if of_check_unselect_fields(10,'ctx_custom','custom_29') = true then lds_ctx_custom_copy.setitem(ll_row,'custom_29',lds_ctx_custom.getitemstring(i,'custom_29'))
		if of_check_unselect_fields(10,'ctx_custom','custom_30') = true then lds_ctx_custom_copy.setitem(ll_row,'custom_30',lds_ctx_custom.getitemstring(i,'custom_30'))
		if of_check_unselect_fields(10,'ctx_custom','custom_31') = true then lds_ctx_custom_copy.setitem(ll_row,'custom_31',lds_ctx_custom.getitemstring(i,'custom_31'))
		if of_check_unselect_fields(10,'ctx_custom','custom_32') = true then lds_ctx_custom_copy.setitem(ll_row,'custom_32',lds_ctx_custom.getitemstring(i,'custom_32'))
		if of_check_unselect_fields(10,'ctx_custom','custom_33') = true then lds_ctx_custom_copy.setitem(ll_row,'custom_33',lds_ctx_custom.getitemstring(i,'custom_33'))
		if of_check_unselect_fields(10,'ctx_custom','custom_34') = true then lds_ctx_custom_copy.setitem(ll_row,'custom_34',lds_ctx_custom.getitemstring(i,'custom_34'))
		if of_check_unselect_fields(10,'ctx_custom','custom_35') = true then lds_ctx_custom_copy.setitem(ll_row,'custom_35',lds_ctx_custom.getitemstring(i,'custom_35'))
		if of_check_unselect_fields(10,'ctx_custom','custom_36') = true then lds_ctx_custom_copy.setitem(ll_row,'custom_36',lds_ctx_custom.getitemstring(i,'custom_36'))
		if of_check_unselect_fields(10,'ctx_custom','custom_37') = true then lds_ctx_custom_copy.setitem(ll_row,'custom_37',lds_ctx_custom.getitemstring(i,'custom_37'))
		if of_check_unselect_fields(10,'ctx_custom','custom_38') = true then lds_ctx_custom_copy.setitem(ll_row,'custom_38',lds_ctx_custom.getitemstring(i,'custom_38'))
		if of_check_unselect_fields(10,'ctx_custom','custom_39') = true then lds_ctx_custom_copy.setitem(ll_row,'custom_39',lds_ctx_custom.getitemstring(i,'custom_39'))
		if of_check_unselect_fields(10,'ctx_custom','custom_40') = true then lds_ctx_custom_copy.setitem(ll_row,'custom_40',lds_ctx_custom.getitemstring(i,'custom_40'))
		if of_check_unselect_fields(10,'ctx_custom','custom_41') = true then lds_ctx_custom_copy.setitem(ll_row,'custom_41',lds_ctx_custom.getitemstring(i,'custom_41'))
		if of_check_unselect_fields(10,'ctx_custom','custom_42') = true then lds_ctx_custom_copy.setitem(ll_row,'custom_42',lds_ctx_custom.getitemstring(i,'custom_42'))
		if of_check_unselect_fields(10,'ctx_custom','custom_43') = true then lds_ctx_custom_copy.setitem(ll_row,'custom_43',lds_ctx_custom.getitemstring(i,'custom_43'))
		if of_check_unselect_fields(10,'ctx_custom','custom_44') = true then lds_ctx_custom_copy.setitem(ll_row,'custom_44',lds_ctx_custom.getitemstring(i,'custom_44'))
		if of_check_unselect_fields(10,'ctx_custom','custom_45') = true then lds_ctx_custom_copy.setitem(ll_row,'custom_45',lds_ctx_custom.getitemstring(i,'custom_45'))
		if of_check_unselect_fields(10,'ctx_custom','custom_46') = true then lds_ctx_custom_copy.setitem(ll_row,'custom_46',lds_ctx_custom.getitemstring(i,'custom_46'))
		if of_check_unselect_fields(10,'ctx_custom','custom_47') = true then lds_ctx_custom_copy.setitem(ll_row,'custom_47',lds_ctx_custom.getitemstring(i,'custom_47'))
		if of_check_unselect_fields(10,'ctx_custom','custom_48') = true then lds_ctx_custom_copy.setitem(ll_row,'custom_48',lds_ctx_custom.getitemstring(i,'custom_48'))
		if of_check_unselect_fields(10,'ctx_custom','custom_49') = true then lds_ctx_custom_copy.setitem(ll_row,'custom_49',lds_ctx_custom.getitemstring(i,'custom_49'))
		if of_check_unselect_fields(10,'ctx_custom','custom_50') = true then lds_ctx_custom_copy.setitem(ll_row,'custom_50',lds_ctx_custom.getitemstring(i,'custom_50'))	
		if of_check_unselect_fields(10,'ctx_custom','custom_51') = true then lds_ctx_custom_copy.setitem(ll_row,'custom_51',lds_ctx_custom.getitemstring(i,'custom_51'))
		if of_check_unselect_fields(10,'ctx_custom','custom_52') = true then lds_ctx_custom_copy.setitem(ll_row,'custom_52',lds_ctx_custom.getitemstring(i,'custom_52'))
		if of_check_unselect_fields(10,'ctx_custom','custom_53') = true then lds_ctx_custom_copy.setitem(ll_row,'custom_53',lds_ctx_custom.getitemstring(i,'custom_53'))
		if of_check_unselect_fields(10,'ctx_custom','custom_54') = true then lds_ctx_custom_copy.setitem(ll_row,'custom_54',lds_ctx_custom.getitemstring(i,'custom_54'))
		if of_check_unselect_fields(10,'ctx_custom','custom_55') = true then lds_ctx_custom_copy.setitem(ll_row,'custom_55',lds_ctx_custom.getitemstring(i,'custom_55'))
		if of_check_unselect_fields(10,'ctx_custom','custom_56') = true then lds_ctx_custom_copy.setitem(ll_row,'custom_56',lds_ctx_custom.getitemstring(i,'custom_56'))
		if of_check_unselect_fields(10,'ctx_custom','custom_57') = true then lds_ctx_custom_copy.setitem(ll_row,'custom_57',lds_ctx_custom.getitemstring(i,'custom_57'))
		if of_check_unselect_fields(10,'ctx_custom','custom_58') = true then lds_ctx_custom_copy.setitem(ll_row,'custom_58',lds_ctx_custom.getitemstring(i,'custom_58'))
		if of_check_unselect_fields(10,'ctx_custom','custom_59') = true then lds_ctx_custom_copy.setitem(ll_row,'custom_59',lds_ctx_custom.getitemstring(i,'custom_59'))
		if of_check_unselect_fields(10,'ctx_custom','custom_60') = true then lds_ctx_custom_copy.setitem(ll_row,'custom_60',lds_ctx_custom.getitemstring(i,'custom_60'))
		if of_check_unselect_fields(10,'ctx_custom','custom_61') = true then lds_ctx_custom_copy.setitem(ll_row,'custom_61',lds_ctx_custom.getitemstring(i,'custom_61'))
		if of_check_unselect_fields(10,'ctx_custom','custom_62') = true then lds_ctx_custom_copy.setitem(ll_row,'custom_62',lds_ctx_custom.getitemstring(i,'custom_62'))
		if of_check_unselect_fields(10,'ctx_custom','custom_63') = true then lds_ctx_custom_copy.setitem(ll_row,'custom_63',lds_ctx_custom.getitemstring(i,'custom_63'))
		if of_check_unselect_fields(10,'ctx_custom','custom_64') = true then lds_ctx_custom_copy.setitem(ll_row,'custom_64',lds_ctx_custom.getitemstring(i,'custom_64'))
		if of_check_unselect_fields(10,'ctx_custom','custom_65') = true then lds_ctx_custom_copy.setitem(ll_row,'custom_65',lds_ctx_custom.getitemstring(i,'custom_65'))
		if of_check_unselect_fields(10,'ctx_custom','custom_66') = true then lds_ctx_custom_copy.setitem(ll_row,'custom_66',lds_ctx_custom.getitemstring(i,'custom_66'))
		if of_check_unselect_fields(10,'ctx_custom','custom_67') = true then lds_ctx_custom_copy.setitem(ll_row,'custom_67',lds_ctx_custom.getitemstring(i,'custom_67'))
		if of_check_unselect_fields(10,'ctx_custom','custom_68') = true then lds_ctx_custom_copy.setitem(ll_row,'custom_68',lds_ctx_custom.getitemstring(i,'custom_68'))
		if of_check_unselect_fields(10,'ctx_custom','custom_69') = true then lds_ctx_custom_copy.setitem(ll_row,'custom_69',lds_ctx_custom.getitemstring(i,'custom_69'))
		if of_check_unselect_fields(10,'ctx_custom','custom_70') = true then lds_ctx_custom_copy.setitem(ll_row,'custom_70',lds_ctx_custom.getitemstring(i,'custom_70'))
		if of_check_unselect_fields(10,'ctx_custom','custom_71') = true then lds_ctx_custom_copy.setitem(ll_row,'custom_71',lds_ctx_custom.getitemstring(i,'custom_71'))
		if of_check_unselect_fields(10,'ctx_custom','custom_72') = true then lds_ctx_custom_copy.setitem(ll_row,'custom_72',lds_ctx_custom.getitemstring(i,'custom_72'))
		if of_check_unselect_fields(10,'ctx_custom','custom_73') = true then lds_ctx_custom_copy.setitem(ll_row,'custom_73',lds_ctx_custom.getitemstring(i,'custom_73'))
		if of_check_unselect_fields(10,'ctx_custom','custom_74') = true then lds_ctx_custom_copy.setitem(ll_row,'custom_74',lds_ctx_custom.getitemstring(i,'custom_74'))
		if of_check_unselect_fields(10,'ctx_custom','custom_75') = true then lds_ctx_custom_copy.setitem(ll_row,'custom_75',lds_ctx_custom.getitemstring(i,'custom_75'))
		*/
		for ll_cnt = 1 to 75
			if ll_cnt >= 23 and ll_cnt < 26 then
			else
				ls_colname = 'custom_' + string(ll_cnt)
				if of_check_unselect_fields(10,'ctx_custom',ls_colname) = true then 
					//lds_ctx_custom_copy.setitem(ll_row,ls_colname,lds_ctx_custom.getitemstring(i,ls_colname))
					of_set_value(lds_dync_1, ls_colname, lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'C', 10, al_new_ctx_id)	//Modified by harry 20170621     
					ls_custom_fields = ls_custom_fields + " '" + ls_colname + "',"  //Added by Harry 20170517
				end if
			end if
		next
		if of_check_unselect_fields(10,'ctx_custom','custom_n26') = true then of_set_value(lds_dync_1, 'custom_n26', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DEC')	//Modified by harry 20170621   lds_ctx_custom_copy.setitem(ll_row,'custom_n26',lds_ctx_custom.getitemdecimal(i,'custom_n26'))
		if of_check_unselect_fields(10,'ctx_custom','custom_n27') = true then of_set_value(lds_dync_1, 'custom_n27', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DEC')	//Modified by harry 20170621   lds_ctx_custom_copy.setitem(ll_row,'custom_n27',lds_ctx_custom.getitemdecimal(i,'custom_n27'))
		if of_check_unselect_fields(10,'ctx_custom','custom_n28') = true then of_set_value(lds_dync_1, 'custom_n28', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DEC')	//Modified by harry 20170621   lds_ctx_custom_copy.setitem(ll_row,'custom_n28',lds_ctx_custom.getitemdecimal(i,'custom_n28'))
		if of_check_unselect_fields(10,'ctx_custom','custom_n29') = true then of_set_value(lds_dync_1, 'custom_n29', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DEC')	//Modified by harry 20170621   lds_ctx_custom_copy.setitem(ll_row,'custom_n29',lds_ctx_custom.getitemdecimal(i,'custom_n29'))
		if of_check_unselect_fields(10,'ctx_custom','custom_n30') = true then of_set_value(lds_dync_1, 'custom_n30', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_copy.setitem(ll_row,'custom_n30',lds_ctx_custom.getitemdecimal(i,'custom_n30'))
		if of_check_unselect_fields(10,'ctx_custom','custom_n31') = true then of_set_value(lds_dync_1, 'custom_n31', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_copy.setitem(ll_row,'custom_n31',lds_ctx_custom.getitemdecimal(i,'custom_n31'))
		if of_check_unselect_fields(10,'ctx_custom','custom_n32') = true then of_set_value(lds_dync_1, 'custom_n32', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_copy.setitem(ll_row,'custom_n32',lds_ctx_custom.getitemdecimal(i,'custom_n32'))
		if of_check_unselect_fields(10,'ctx_custom','custom_n33') = true then of_set_value(lds_dync_1, 'custom_n33', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_copy.setitem(ll_row,'custom_n33',lds_ctx_custom.getitemdecimal(i,'custom_n33'))
		if of_check_unselect_fields(10,'ctx_custom','custom_n34') = true then of_set_value(lds_dync_1, 'custom_n34', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_copy.setitem(ll_row,'custom_n34',lds_ctx_custom.getitemdecimal(i,'custom_n34'))
		if of_check_unselect_fields(10,'ctx_custom','custom_n35') = true then of_set_value(lds_dync_1, 'custom_n35', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_copy.setitem(ll_row,'custom_n35',lds_ctx_custom.getitemdecimal(i,'custom_n35'))
		if of_check_unselect_fields(10,'ctx_custom','custom_n36') = true then of_set_value(lds_dync_1, 'custom_n36', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_copy.setitem(ll_row,'custom_n36',lds_ctx_custom.getitemdecimal(i,'custom_n36'))
		if of_check_unselect_fields(10,'ctx_custom','custom_n37') = true then of_set_value(lds_dync_1, 'custom_n37', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_copy.setitem(ll_row,'custom_n37',lds_ctx_custom.getitemdecimal(i,'custom_n37'))
		if of_check_unselect_fields(10,'ctx_custom','custom_n38') = true then of_set_value(lds_dync_1, 'custom_n38', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_copy.setitem(ll_row,'custom_n38',lds_ctx_custom.getitemdecimal(i,'custom_n38'))
		if of_check_unselect_fields(10,'ctx_custom','custom_n39') = true then of_set_value(lds_dync_1, 'custom_n39', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_copy.setitem(ll_row,'custom_n39',lds_ctx_custom.getitemdecimal(i,'custom_n39'))
		if of_check_unselect_fields(10,'ctx_custom','custom_n40') = true then of_set_value(lds_dync_1, 'custom_n40', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_copy.setitem(ll_row,'custom_n40',lds_ctx_custom.getitemdecimal(i,'custom_n40'))
		if of_check_unselect_fields(10,'ctx_custom','custom_n41') = true then of_set_value(lds_dync_1, 'custom_n41', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_copy.setitem(ll_row,'custom_n41',lds_ctx_custom.getitemdecimal(i,'custom_n41'))
		if of_check_unselect_fields(10,'ctx_custom','custom_n42') = true then of_set_value(lds_dync_1, 'custom_n42', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_copy.setitem(ll_row,'custom_n42',lds_ctx_custom.getitemdecimal(i,'custom_n42'))
		if of_check_unselect_fields(10,'ctx_custom','custom_n43') = true then of_set_value(lds_dync_1, 'custom_n43', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_copy.setitem(ll_row,'custom_n43',lds_ctx_custom.getitemdecimal(i,'custom_n43'))
		if of_check_unselect_fields(10,'ctx_custom','custom_n44') = true then of_set_value(lds_dync_1, 'custom_n44', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_copy.setitem(ll_row,'custom_n44',lds_ctx_custom.getitemdecimal(i,'custom_n44'))
		if of_check_unselect_fields(10,'ctx_custom','custom_n45') = true then of_set_value(lds_dync_1, 'custom_n45', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_copy.setitem(ll_row,'custom_n45',lds_ctx_custom.getitemdecimal(i,'custom_n45'))
		if of_check_unselect_fields(10,'ctx_custom','custom_n46') = true then of_set_value(lds_dync_1, 'custom_n46', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_copy.setitem(ll_row,'custom_n46',lds_ctx_custom.getitemdecimal(i,'custom_n46'))
		if of_check_unselect_fields(10,'ctx_custom','custom_n47') = true then of_set_value(lds_dync_1, 'custom_n47', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_copy.setitem(ll_row,'custom_n47',lds_ctx_custom.getitemdecimal(i,'custom_n47'))
		if of_check_unselect_fields(10,'ctx_custom','custom_n48') = true then of_set_value(lds_dync_1, 'custom_n48', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_copy.setitem(ll_row,'custom_n48',lds_ctx_custom.getitemdecimal(i,'custom_n48'))
		if of_check_unselect_fields(10,'ctx_custom','custom_n49') = true then of_set_value(lds_dync_1, 'custom_n49', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_copy.setitem(ll_row,'custom_n49',lds_ctx_custom.getitemdecimal(i,'custom_n49'))
		if of_check_unselect_fields(10,'ctx_custom','custom_n50') = true then of_set_value(lds_dync_1, 'custom_n50', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_copy.setitem(ll_row,'custom_n50',lds_ctx_custom.getitemdecimal(i,'custom_n50'))
		if of_check_unselect_fields(10,'ctx_custom','custom_n51') = true then of_set_value(lds_dync_1, 'custom_n51', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_copy.setitem(ll_row,'custom_n51',lds_ctx_custom.getitemdecimal(i,'custom_n51'))
		if of_check_unselect_fields(10,'ctx_custom','custom_n52') = true then of_set_value(lds_dync_1, 'custom_n52', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_copy.setitem(ll_row,'custom_n52',lds_ctx_custom.getitemdecimal(i,'custom_n52'))
		if of_check_unselect_fields(10,'ctx_custom','custom_n53') = true then of_set_value(lds_dync_1, 'custom_n53', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_copy.setitem(ll_row,'custom_n53',lds_ctx_custom.getitemdecimal(i,'custom_n53'))
		if of_check_unselect_fields(10,'ctx_custom','custom_n54') = true then of_set_value(lds_dync_1, 'custom_n54', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_copy.setitem(ll_row,'custom_n54',lds_ctx_custom.getitemdecimal(i,'custom_n54'))
		if of_check_unselect_fields(10,'ctx_custom','custom_n55') = true then of_set_value(lds_dync_1, 'custom_n55', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_copy.setitem(ll_row,'custom_n55',lds_ctx_custom.getitemdecimal(i,'custom_n55'))
		if of_check_unselect_fields(10,'ctx_custom','custom_n56') = true then of_set_value(lds_dync_1, 'custom_n56', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_copy.setitem(ll_row,'custom_n56',lds_ctx_custom.getitemdecimal(i,'custom_n56'))
		if of_check_unselect_fields(10,'ctx_custom','custom_n57') = true then of_set_value(lds_dync_1, 'custom_n57', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_copy.setitem(ll_row,'custom_n57',lds_ctx_custom.getitemdecimal(i,'custom_n57'))
		if of_check_unselect_fields(10,'ctx_custom','custom_n58') = true then of_set_value(lds_dync_1, 'custom_n58', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_copy.setitem(ll_row,'custom_n58',lds_ctx_custom.getitemdecimal(i,'custom_n58'))
		if of_check_unselect_fields(10,'ctx_custom','custom_n59') = true then of_set_value(lds_dync_1, 'custom_n59', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_copy.setitem(ll_row,'custom_n59',lds_ctx_custom.getitemdecimal(i,'custom_n59'))
		if of_check_unselect_fields(10,'ctx_custom','custom_n60') = true then of_set_value(lds_dync_1, 'custom_n60', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_copy.setitem(ll_row,'custom_n60',lds_ctx_custom.getitemdecimal(i,'custom_n60'))
		if of_check_unselect_fields(10,'ctx_custom','custom_n61') = true then of_set_value(lds_dync_1, 'custom_n61', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_copy.setitem(ll_row,'custom_n61',lds_ctx_custom.getitemdecimal(i,'custom_n61'))
		if of_check_unselect_fields(10,'ctx_custom','custom_n62') = true then of_set_value(lds_dync_1, 'custom_n62', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_copy.setitem(ll_row,'custom_n62',lds_ctx_custom.getitemdecimal(i,'custom_n62'))
		if of_check_unselect_fields(10,'ctx_custom','custom_n63') = true then of_set_value(lds_dync_1, 'custom_n63', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_copy.setitem(ll_row,'custom_n63',lds_ctx_custom.getitemdecimal(i,'custom_n63'))
		if of_check_unselect_fields(10,'ctx_custom','custom_n64') = true then of_set_value(lds_dync_1, 'custom_n64', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_copy.setitem(ll_row,'custom_n64',lds_ctx_custom.getitemdecimal(i,'custom_n64'))
		if of_check_unselect_fields(10,'ctx_custom','custom_n65') = true then of_set_value(lds_dync_1, 'custom_n65', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_copy.setitem(ll_row,'custom_n65',lds_ctx_custom.getitemdecimal(i,'custom_n65'))
		if of_check_unselect_fields(10,'ctx_custom','custom_n66') = true then of_set_value(lds_dync_1, 'custom_n66', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_copy.setitem(ll_row,'custom_n66',lds_ctx_custom.getitemdecimal(i,'custom_n66'))
		if of_check_unselect_fields(10,'ctx_custom','custom_n67') = true then of_set_value(lds_dync_1, 'custom_n67', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_copy.setitem(ll_row,'custom_n67',lds_ctx_custom.getitemdecimal(i,'custom_n67'))
		if of_check_unselect_fields(10,'ctx_custom','custom_n68') = true then of_set_value(lds_dync_1, 'custom_n68', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_copy.setitem(ll_row,'custom_n68',lds_ctx_custom.getitemdecimal(i,'custom_n68'))
		if of_check_unselect_fields(10,'ctx_custom','custom_n69') = true then of_set_value(lds_dync_1, 'custom_n69', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_copy.setitem(ll_row,'custom_n69',lds_ctx_custom.getitemdecimal(i,'custom_n69'))
		if of_check_unselect_fields(10,'ctx_custom','custom_n70') = true then of_set_value(lds_dync_1, 'custom_n70', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_copy.setitem(ll_row,'custom_n70',lds_ctx_custom.getitemdecimal(i,'custom_n70'))
		//commented by Harry 20170517
		/*
		if of_check_unselect_fields(10,'ctx_custom','custom_notes_6') = true then lds_ctx_custom_copy.setitem(ll_row,'custom_notes_6',lds_ctx_custom.getitemstring(i,'custom_notes_6'))
		if of_check_unselect_fields(10,'ctx_custom','custom_notes_7') = true then lds_ctx_custom_copy.setitem(ll_row,'custom_notes_7',lds_ctx_custom.getitemstring(i,'custom_notes_7'))
		if of_check_unselect_fields(10,'ctx_custom','custom_notes_8') = true then lds_ctx_custom_copy.setitem(ll_row,'custom_notes_8',lds_ctx_custom.getitemstring(i,'custom_notes_8'))
		if of_check_unselect_fields(10,'ctx_custom','custom_notes_9') = true then lds_ctx_custom_copy.setitem(ll_row,'custom_notes_9',lds_ctx_custom.getitemstring(i,'custom_notes_9'))
		if of_check_unselect_fields(10,'ctx_custom','custom_notes_10') = true then lds_ctx_custom_copy.setitem(ll_row,'custom_notes_10',lds_ctx_custom.getitemstring(i,'custom_notes_10'))
		*/
		//end
		//Added By Jay Chen 03-09-2016
		for ll_cnt = 71 to 100
			ls_colname = 'custom_n' + string(ll_cnt)
			if of_check_unselect_fields(10,'ctx_custom',ls_colname) = true then of_set_value(lds_dync_1, ls_colname, lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_copy.setitem(ll_row,ls_colname,lds_ctx_custom.getitemdecimal(i,ls_colname))
		next
		//end
		//commented by Harry 20170517
		/*
		if of_check_unselect_fields(10,'ctx_custom','custom_notes_1') = true then lds_ctx_custom_copy.setitem(ll_row,'custom_notes_1',lds_ctx_custom.getitemstring(i,'custom_notes_1'))
		if of_check_unselect_fields(10,'ctx_custom','custom_notes_2') = true then lds_ctx_custom_copy.setitem(ll_row,'custom_notes_2',lds_ctx_custom.getitemstring(i,'custom_notes_2'))
		if of_check_unselect_fields(10,'ctx_custom','custom_notes_3') = true then lds_ctx_custom_copy.setitem(ll_row,'custom_notes_3',lds_ctx_custom.getitemstring(i,'custom_notes_3'))
		if of_check_unselect_fields(10,'ctx_custom','custom_notes_4') = true then lds_ctx_custom_copy.setitem(ll_row,'custom_notes_4',lds_ctx_custom.getitemstring(i,'custom_notes_4'))
		if of_check_unselect_fields(10,'ctx_custom','custom_notes_5') = true then lds_ctx_custom_copy.setitem(ll_row,'custom_notes_5',lds_ctx_custom.getitemstring(i,'custom_notes_5'))
		*/
		//Added by Harry 20170517
		 for ll_cnt = 1 to 10
			ls_colname = 'custom_notes_' + string(ll_cnt)
			if of_check_unselect_fields(10,'ctx_custom',ls_colname) = true then 
				//lds_ctx_custom_copy.setitem(ll_row,ls_colname,lds_ctx_custom.getitemstring(i,ls_colname))
				of_set_value(lds_dync_1, ls_colname, lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'C', 10, al_new_ctx_id)	//Modified by harry 20170621      
				ls_custom_fields = ls_custom_fields + " '" + ls_colname + "',"  //Added by Harry 20170517
			end if
		next
		
		if of_check_unselect_fields(10,'ctx_custom','custom_money_1') = true then of_set_value(lds_dync_1, 'custom_money_1', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_copy.setitem(ll_row,'custom_money_1',lds_ctx_custom.getitemdecimal(i,'custom_money_1'))
		if of_check_unselect_fields(10,'ctx_custom','custom_money_2') = true then of_set_value(lds_dync_1, 'custom_money_2', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_copy.setitem(ll_row,'custom_money_2',lds_ctx_custom.getitemdecimal(i,'custom_money_2'))
		if of_check_unselect_fields(10,'ctx_custom','custom_money_3') = true then of_set_value(lds_dync_1, 'custom_money_3', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_copy.setitem(ll_row,'custom_money_3',lds_ctx_custom.getitemdecimal(i,'custom_money_3'))
		
		if of_check_unselect_fields(10,'ctx_custom','custom_percent_1') = true then of_set_value(lds_dync_1, 'custom_percent_1', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DEC')	//Modified by harry 20170621       lds_ctx_custom_copy.setitem(ll_row,'custom_percent_1',lds_ctx_custom.getitemdecimal(i,'custom_percent_1'))
		if of_check_unselect_fields(10,'ctx_custom','custom_percent_2') = true then of_set_value(lds_dync_1, 'custom_percent_2', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DEC')	//Modified by harry 20170621       lds_ctx_custom_copy.setitem(ll_row,'custom_percent_2',lds_ctx_custom.getitemdecimal(i,'custom_percent_2'))
		if of_check_unselect_fields(10,'ctx_custom','custom_percent_3') = true then of_set_value(lds_dync_1, 'custom_percent_3', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DEC')	//Modified by harry 20170621       lds_ctx_custom_copy.setitem(ll_row,'custom_percent_3',lds_ctx_custom.getitemdecimal(i,'custom_percent_3'))
		if of_check_unselect_fields(10,'ctx_custom','custom_percent_4') = true then of_set_value(lds_dync_1, 'custom_percent_4', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DEC')	//Modified by harry 20170621       lds_ctx_custom_copy.setitem(ll_row,'custom_percent_4',lds_ctx_custom.getitemdecimal(i,'custom_percent_4'))
		if of_check_unselect_fields(10,'ctx_custom','custom_percent_5') = true then of_set_value(lds_dync_1, 'custom_percent_5', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DEC')	//Modified by harry 20170621       lds_ctx_custom_copy.setitem(ll_row,'custom_percent_5',lds_ctx_custom.getitemdecimal(i,'custom_percent_5'))
		if of_check_unselect_fields(10,'ctx_custom','custom_percent_6') = true then of_set_value(lds_dync_1, 'custom_percent_6', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DEC')	//Modified by harry 20170621       lds_ctx_custom_copy.setitem(ll_row,'custom_percent_6',lds_ctx_custom.getitemdecimal(i,'custom_percent_6'))
		if of_check_unselect_fields(10,'ctx_custom','custom_percent_7') = true then of_set_value(lds_dync_1, 'custom_percent_7', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DEC')	//Modified by harry 20170621       lds_ctx_custom_copy.setitem(ll_row,'custom_percent_7',lds_ctx_custom.getitemdecimal(i,'custom_percent_7'))
		if of_check_unselect_fields(10,'ctx_custom','custom_percent_8') = true then of_set_value(lds_dync_1, 'custom_percent_8', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DEC')	//Modified by harry 20170621       lds_ctx_custom_copy.setitem(ll_row,'custom_percent_8',lds_ctx_custom.getitemdecimal(i,'custom_percent_8'))
		if of_check_unselect_fields(10,'ctx_custom','custom_percent_9') = true then of_set_value(lds_dync_1, 'custom_percent_9', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DEC')	//Modified by harry 20170621       lds_ctx_custom_copy.setitem(ll_row,'custom_percent_9',lds_ctx_custom.getitemdecimal(i,'custom_percent_9'))
		if of_check_unselect_fields(10,'ctx_custom','custom_percent_10') = true then of_set_value(lds_dync_1, 'custom_percent_10', lds_ctx_custom_copy, ll_row, lds_ctx_custom, i, 'DEC')	//Modified by harry 20170621       lds_ctx_custom_copy.setitem(ll_row,'custom_percent_10',lds_ctx_custom.getitemdecimal(i,'custom_percent_10'))
		
////		if of_check_unselect_fields(10,'ctx_custom','salesforce_id') = true then lds_ctx_custom_copy.setitem(ll_row,'salesforce_id',lds_ctx_custom.getitemstring(i,'salesforce_id'))  // don't need it 
		//Added by Harry 20170517
		if len(ls_custom_fields) > 0 then
			ls_custom_fields = left(ls_custom_fields, len(ls_custom_fields) - 1)
			
			ls_sql = "INSERT INTO screen_field_select_item (view_id, screen_id, ctx_id, field_name, field_data) "  + &
						" SELECT view_id,  screen_id, " + String(al_new_ctx_id) + ", field_name, field_data "  + &
						" FROM screen_field_select_item WHERE screen_id = 10 AND ctx_id = " + String(astr_copy_ctx.sl_ctx_id) + &
						" AND field_name IN ( " + ls_custom_fields + " );"
				
			EXECUTE IMMEDIATE :ls_sql;
		end if
	next 
	
	if lds_ctx_custom_copy.rowcount( ) >0 then 
		ll_Rtn = lds_ctx_custom_copy.Update()
		if ll_Rtn = 1 then
			COMMIT USING SQLCA;
		else
			ROLLBACK USING SQLCA;
		end if
	end if 
	
	if isvalid(lds_ctx_custom) then destroy lds_ctx_custom 
	if isvalid(lds_ctx_custom_copy) then destroy lds_ctx_custom_copy 	
end if

//Copy Custom Multi  
//Modified By Jay Chen 11-27-2013 
//if astr_copy_ctx.sb_custom_multi =  1 then
If astr_copy_ctx.sb_custom_multi =  1 and of_get_screen_exist(il_view, 53) Then //Modified by harry 20170622
//	INSERT INTO ctx_custom_multi_hdr
//	(ctx_id,hdr_id,custom_1,custom_2,custom_3,custom_4,custom_5,custom_6,custom_7,custom_8,custom_9,custom_10,custom_date1,custom_date2,custom_date3,custom_date4,custom_date5,custom_date6,
//	custom_date7,custom_date8,custom_date9,custom_date10	,custom_n1,custom_n2,custom_n3,custom_n4,custom_n5,custom_n6,custom_n7,custom_n8,custom_n9,custom_n10,custom_notes_1,custom_notes_2	,
//	custom_m1,custom_m2,custom_m3,custom_m4,custom_m5,custom_percent_1,custom_percent_2,custom_percent_3,custom_percent_4,custom_percent_5,custom_11, custom_12, custom_13, custom_14, 
//	custom_15, custom_16, custom_17, custom_18, custom_19, custom_20, custom_21, custom_22, custom_23, custom_24, custom_25, custom_26, custom_27, custom_28, custom_29, custom_30, custom_31, 
//	custom_32, custom_33, custom_34, custom_35, custom_36, custom_37, custom_38, custom_39, custom_40, custom_41, custom_42, custom_43, custom_44, custom_45, custom_46, custom_47, custom_48, 
//	custom_49, custom_50, custom_n11, custom_n12, custom_n13, custom_n14, custom_n15, custom_n16, custom_n17, custom_n18, custom_n19, custom_n20,custom_n21, custom_n22, custom_n23, custom_n24, 
//	custom_n25, custom_n26, custom_n27, custom_n28, custom_n29, custom_n30, custom_n31, custom_n32, custom_n33, custom_n34, custom_n35, custom_n36, custom_n37, custom_n38, custom_n39, 
//	custom_n40, custom_n41, custom_n42, custom_n43, custom_n44, custom_n45, custom_n46, custom_n47, custom_n48, custom_n49, custom_n50, custom_date11, custom_date12, custom_date13, custom_date14, 
//	custom_date15, custom_date16, custom_date17, custom_date18, custom_date19, custom_date20, custom_m6, custom_m7, custom_m8, custom_m9, custom_m10, custom_m11, custom_m12, custom_m13, 
//	custom_m14, custom_m15, custom_m16, custom_m17, custom_m18, custom_m19, custom_m20, custom_percent_6, custom_percent_7, custom_percent_8, custom_percent_9, custom_percent_10, 
//	custom_percent_11, custom_percent_12, custom_percent_13, custom_percent_14, custom_percent_15, custom_percent_16, custom_percent_17, custom_percent_18, custom_percent_19, custom_percent_20)
//		select :al_new_ctx_id,hdr_id,custom_1,custom_2,custom_3,custom_4,custom_5,custom_6,custom_7,custom_8,custom_9,custom_10,custom_date1,custom_date2,custom_date3,custom_date4,custom_date5
//		,custom_date6,custom_date7,custom_date8,custom_date9,custom_date10,custom_n1,custom_n2,custom_n3,custom_n4,custom_n5,custom_n6,custom_n7,custom_n8,custom_n9,custom_n10,custom_notes_1
//		,custom_notes_2,custom_m1,custom_m2,custom_m3,custom_m4,custom_m5,custom_percent_1,custom_percent_2,custom_percent_3,custom_percent_4,custom_percent_5,custom_11, custom_12, custom_13, 
//		custom_14, custom_15, custom_16, custom_17, custom_18, custom_19, custom_20, custom_21, custom_22, custom_23, custom_24, custom_25, custom_26, custom_27, custom_28, custom_29, custom_30,
//		custom_31, custom_32, custom_33, custom_34, custom_35, custom_36, custom_37, custom_38, custom_39, custom_40, custom_41, custom_42, custom_43, custom_44, custom_45, custom_46, custom_47, 
//		custom_48, custom_49, custom_50, custom_n11, custom_n12, custom_n13, custom_n14, custom_n15, custom_n16, custom_n17, custom_n18, custom_n19, custom_n20, custom_n21, custom_n22, custom_n23, 
//		custom_n24, custom_n25, custom_n26, custom_n27, custom_n28, custom_n29, custom_n30, custom_n31, custom_n32, custom_n33, custom_n34, custom_n35, custom_n36, custom_n37, custom_n38, 
//		custom_n39, custom_n40, custom_n41, custom_n42, custom_n43, custom_n44, custom_n45, custom_n46, custom_n47, custom_n48, custom_n49, custom_n50, custom_date11, custom_date12, custom_date13, 
//		custom_date14, custom_date15, custom_date16, custom_date17, custom_date18, custom_date19, custom_date20, custom_m6, custom_m7, custom_m8, custom_m9, custom_m10, custom_m11, custom_m12, 
//		custom_m13, custom_m14, custom_m15, custom_m16, custom_m17, custom_m18, custom_m19, custom_m20, custom_percent_6, custom_percent_7, custom_percent_8, custom_percent_9, custom_percent_10, 
//		custom_percent_11, custom_percent_12, custom_percent_13, custom_percent_14, custom_percent_15, custom_percent_16, custom_percent_17, custom_percent_18, custom_percent_19, custom_percent_20
//		From ctx_custom_multi_hdr 
//		where ctx_id = :astr_copy_ctx.sl_ctx_id;
	
	lds_contract_multi_header = Create DataStore
	lds_contract_multi_header.DataObject = "d_contract_multi_header"
	lds_contract_multi_header.SetTransObject(SQLCA)
	
	lds_contract_multi_header_copy = Create DataStore
	lds_contract_multi_header_copy.DataObject = "d_contract_multi_header_copy"			 
	lds_contract_multi_header_copy.SetTransObject(SQLCA)
	
	lds_contract_multi_header.retrieve(astr_copy_ctx.sl_ctx_id )
	ll_count = lds_contract_multi_header.rowcount()
	
	f_create_contract_ds (il_view, 53, lds_dync_1)  //Added by Harry 20170622 
	
	for i =1 to ll_count
		ll_row = lds_contract_multi_header_copy.insertrow(0)		
		lds_contract_multi_header_copy.setitem(ll_row,'ctx_id',al_new_ctx_id)		
		lds_contract_multi_header_copy.setitem(ll_row,'hdr_id',lds_contract_multi_header.getitemNumber(i,'hdr_id'))	
		
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_1') = true then of_set_value(lds_dync_1, 'custom_1', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'C')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_1',lds_contract_multi_header.getitemstring(i,'custom_1'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_2') = true then of_set_value(lds_dync_1, 'custom_2', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'C')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_2',lds_contract_multi_header.getitemstring(i,'custom_2'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_3') = true then of_set_value(lds_dync_1, 'custom_3', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'C')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_3',lds_contract_multi_header.getitemstring(i,'custom_3'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_4') = true then of_set_value(lds_dync_1, 'custom_4', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'C')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_4',lds_contract_multi_header.getitemstring(i,'custom_4'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_5') = true then of_set_value(lds_dync_1, 'custom_5', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'C')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_5',lds_contract_multi_header.getitemstring(i,'custom_5'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_6') = true then of_set_value(lds_dync_1, 'custom_6', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'C')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_6',lds_contract_multi_header.getitemstring(i,'custom_6'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_7') = true then of_set_value(lds_dync_1, 'custom_7', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'C')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_7',lds_contract_multi_header.getitemstring(i,'custom_7'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_8') = true then of_set_value(lds_dync_1, 'custom_8', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'C')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_8',lds_contract_multi_header.getitemstring(i,'custom_8'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_9') = true then of_set_value(lds_dync_1, 'custom_9', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'C')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_9',lds_contract_multi_header.getitemstring(i,'custom_9'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_10') = true then of_set_value(lds_dync_1, 'custom_10', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'C')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_10',lds_contract_multi_header.getitemstring(i,'custom_10'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_11') = true then of_set_value(lds_dync_1, 'custom_11', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'C')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_11',lds_contract_multi_header.getitemstring(i,'custom_11'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_12') = true then of_set_value(lds_dync_1, 'custom_12', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'C')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_12',lds_contract_multi_header.getitemstring(i,'custom_12'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_13') = true then of_set_value(lds_dync_1, 'custom_13', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'C')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_13',lds_contract_multi_header.getitemstring(i,'custom_13'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_14') = true then of_set_value(lds_dync_1, 'custom_14', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'C')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_14',lds_contract_multi_header.getitemstring(i,'custom_14'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_15') = true then of_set_value(lds_dync_1, 'custom_15', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'C')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_15',lds_contract_multi_header.getitemstring(i,'custom_15'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_16') = true then of_set_value(lds_dync_1, 'custom_16', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'C')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_16',lds_contract_multi_header.getitemstring(i,'custom_16'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_17') = true then of_set_value(lds_dync_1, 'custom_17', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'C')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_17',lds_contract_multi_header.getitemstring(i,'custom_17'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_18') = true then of_set_value(lds_dync_1, 'custom_18', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'C')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_18',lds_contract_multi_header.getitemstring(i,'custom_18'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_19') = true then of_set_value(lds_dync_1, 'custom_19', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'C')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_19',lds_contract_multi_header.getitemstring(i,'custom_19'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_20') = true then of_set_value(lds_dync_1, 'custom_20', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'C')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_20',lds_contract_multi_header.getitemstring(i,'custom_20'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_21') = true then of_set_value(lds_dync_1, 'custom_21', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'C')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_21',lds_contract_multi_header.getitemstring(i,'custom_21'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_22') = true then of_set_value(lds_dync_1, 'custom_22', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'C')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_22',lds_contract_multi_header.getitemstring(i,'custom_22'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_23') = true then of_set_value(lds_dync_1, 'custom_23', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'C')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_23',lds_contract_multi_header.getitemstring(i,'custom_23'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_24') = true then of_set_value(lds_dync_1, 'custom_24', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'C')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_24',lds_contract_multi_header.getitemstring(i,'custom_24'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_25') = true then of_set_value(lds_dync_1, 'custom_25', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'C')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_25',lds_contract_multi_header.getitemstring(i,'custom_25'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_26') = true then of_set_value(lds_dync_1, 'custom_26', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'C')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_26',lds_contract_multi_header.getitemstring(i,'custom_26'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_27') = true then of_set_value(lds_dync_1, 'custom_27', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'C')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_27',lds_contract_multi_header.getitemstring(i,'custom_27'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_28') = true then of_set_value(lds_dync_1, 'custom_28', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'C')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_28',lds_contract_multi_header.getitemstring(i,'custom_28'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_29') = true then of_set_value(lds_dync_1, 'custom_29', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'C')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_29',lds_contract_multi_header.getitemstring(i,'custom_29'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_30') = true then of_set_value(lds_dync_1, 'custom_30', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'C')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_30',lds_contract_multi_header.getitemstring(i,'custom_30'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_31') = true then of_set_value(lds_dync_1, 'custom_31', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'C')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_31',lds_contract_multi_header.getitemstring(i,'custom_31'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_32') = true then of_set_value(lds_dync_1, 'custom_32', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'C')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_32',lds_contract_multi_header.getitemstring(i,'custom_32'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_33') = true then of_set_value(lds_dync_1, 'custom_33', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'C')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_33',lds_contract_multi_header.getitemstring(i,'custom_33'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_34') = true then of_set_value(lds_dync_1, 'custom_34', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'C')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_34',lds_contract_multi_header.getitemstring(i,'custom_34'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_35') = true then of_set_value(lds_dync_1, 'custom_35', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'C')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_35',lds_contract_multi_header.getitemstring(i,'custom_35'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_36') = true then of_set_value(lds_dync_1, 'custom_36', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'C')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_36',lds_contract_multi_header.getitemstring(i,'custom_36'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_37') = true then of_set_value(lds_dync_1, 'custom_37', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'C')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_37',lds_contract_multi_header.getitemstring(i,'custom_37'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_38') = true then of_set_value(lds_dync_1, 'custom_38', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'C')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_38',lds_contract_multi_header.getitemstring(i,'custom_38'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_39') = true then of_set_value(lds_dync_1, 'custom_39', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'C')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_39',lds_contract_multi_header.getitemstring(i,'custom_39'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_40') = true then of_set_value(lds_dync_1, 'custom_40', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'C')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_40',lds_contract_multi_header.getitemstring(i,'custom_40'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_41') = true then of_set_value(lds_dync_1, 'custom_41', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'C')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_41',lds_contract_multi_header.getitemstring(i,'custom_41'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_42') = true then of_set_value(lds_dync_1, 'custom_42', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'C')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_42',lds_contract_multi_header.getitemstring(i,'custom_42'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_43') = true then of_set_value(lds_dync_1, 'custom_43', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'C')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_43',lds_contract_multi_header.getitemstring(i,'custom_43'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_44') = true then of_set_value(lds_dync_1, 'custom_44', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'C')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_44',lds_contract_multi_header.getitemstring(i,'custom_44'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_45') = true then of_set_value(lds_dync_1, 'custom_45', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'C')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_45',lds_contract_multi_header.getitemstring(i,'custom_45'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_46') = true then of_set_value(lds_dync_1, 'custom_46', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'C')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_46',lds_contract_multi_header.getitemstring(i,'custom_46'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_47') = true then of_set_value(lds_dync_1, 'custom_47', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'C')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_47',lds_contract_multi_header.getitemstring(i,'custom_47'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_48') = true then of_set_value(lds_dync_1, 'custom_48', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'C')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_48',lds_contract_multi_header.getitemstring(i,'custom_48'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_49') = true then of_set_value(lds_dync_1, 'custom_49', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'C')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_49',lds_contract_multi_header.getitemstring(i,'custom_49'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_50') = true then of_set_value(lds_dync_1, 'custom_50', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'C')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_50',lds_contract_multi_header.getitemstring(i,'custom_50'))
		
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_date1') = true then of_set_value(lds_dync_1, 'custom_date1', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DT')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_date1',lds_contract_multi_header.getitemdatetime(i,'custom_date1'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_date2') = true then of_set_value(lds_dync_1, 'custom_date2', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DT')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_date2',lds_contract_multi_header.getitemdatetime(i,'custom_date2'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_date3') = true then of_set_value(lds_dync_1, 'custom_date3', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DT')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_date3',lds_contract_multi_header.getitemdatetime(i,'custom_date3'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_date4') = true then of_set_value(lds_dync_1, 'custom_date4', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DT')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_date4',lds_contract_multi_header.getitemdatetime(i,'custom_date4'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_date5') = true then of_set_value(lds_dync_1, 'custom_date5', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DT')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_date5',lds_contract_multi_header.getitemdatetime(i,'custom_date5'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_date6') = true then of_set_value(lds_dync_1, 'custom_date6', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DT')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_date6',lds_contract_multi_header.getitemdatetime(i,'custom_date6'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_date7') = true then of_set_value(lds_dync_1, 'custom_date7', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DT')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_date7',lds_contract_multi_header.getitemdatetime(i,'custom_date7'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_date8') = true then of_set_value(lds_dync_1, 'custom_date8', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DT')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_date8',lds_contract_multi_header.getitemdatetime(i,'custom_date8'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_date9') = true then of_set_value(lds_dync_1, 'custom_date9', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DT')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_date9',lds_contract_multi_header.getitemdatetime(i,'custom_date9'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_date10') = true then of_set_value(lds_dync_1, 'custom_date10', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DT')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_date10',lds_contract_multi_header.getitemdatetime(i,'custom_date10'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_date11') = true then of_set_value(lds_dync_1, 'custom_date11', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DT')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_date11',lds_contract_multi_header.getitemdatetime(i,'custom_date11'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_date12') = true then of_set_value(lds_dync_1, 'custom_date12', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DT')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_date12',lds_contract_multi_header.getitemdatetime(i,'custom_date12'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_date13') = true then of_set_value(lds_dync_1, 'custom_date13', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DT')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_date13',lds_contract_multi_header.getitemdatetime(i,'custom_date13'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_date14') = true then of_set_value(lds_dync_1, 'custom_date14', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DT')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_date14',lds_contract_multi_header.getitemdatetime(i,'custom_date14'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_date15') = true then of_set_value(lds_dync_1, 'custom_date15', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DT')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_date15',lds_contract_multi_header.getitemdatetime(i,'custom_date15'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_date16') = true then of_set_value(lds_dync_1, 'custom_date16', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DT')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_date16',lds_contract_multi_header.getitemdatetime(i,'custom_date16'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_date17') = true then of_set_value(lds_dync_1, 'custom_date17', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DT')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_date17',lds_contract_multi_header.getitemdatetime(i,'custom_date17'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_date18') = true then of_set_value(lds_dync_1, 'custom_date18', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DT')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_date18',lds_contract_multi_header.getitemdatetime(i,'custom_date18'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_date19') = true then of_set_value(lds_dync_1, 'custom_date19', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DT')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_date19',lds_contract_multi_header.getitemdatetime(i,'custom_date19'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_date20') = true then of_set_value(lds_dync_1, 'custom_date20', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DT')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_date20',lds_contract_multi_header.getitemdatetime(i,'custom_date20'))
		
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_n1') = true then of_set_value(lds_dync_1, 'custom_n1', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DEC')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_n1',lds_contract_multi_header.getitemdecimal(i,'custom_n1'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_n2') = true then of_set_value(lds_dync_1, 'custom_n2', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DEC')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_n2',lds_contract_multi_header.getitemdecimal(i,'custom_n2'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_n3') = true then of_set_value(lds_dync_1, 'custom_n3', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DEC')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_n3',lds_contract_multi_header.getitemdecimal(i,'custom_n3'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_n4') = true then of_set_value(lds_dync_1, 'custom_n4', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DEC')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_n4',lds_contract_multi_header.getitemdecimal(i,'custom_n4'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_n5') = true then of_set_value(lds_dync_1, 'custom_n5', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DEC')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_n5',lds_contract_multi_header.getitemdecimal(i,'custom_n5'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_n6') = true then of_set_value(lds_dync_1, 'custom_n6', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DEC')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_n6',lds_contract_multi_header.getitemdecimal(i,'custom_n6'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_n7') = true then of_set_value(lds_dync_1, 'custom_n7', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DEC')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_n7',lds_contract_multi_header.getitemdecimal(i,'custom_n7'))		
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_n8') = true then of_set_value(lds_dync_1, 'custom_n8', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DEC')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_n8',lds_contract_multi_header.getitemdecimal(i,'custom_n8'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_n9') = true then of_set_value(lds_dync_1, 'custom_n9', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DEC')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_n9',lds_contract_multi_header.getitemdecimal(i,'custom_n9'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_n10') = true then of_set_value(lds_dync_1, 'custom_n10', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DEC')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_n10',lds_contract_multi_header.getitemdecimal(i,'custom_n10'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_n11') = true then of_set_value(lds_dync_1, 'custom_n11', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DEC')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_n11',lds_contract_multi_header.getitemdecimal(i,'custom_n11'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_n12') = true then of_set_value(lds_dync_1, 'custom_n12', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DEC')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_n12',lds_contract_multi_header.getitemdecimal(i,'custom_n12'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_n13') = true then of_set_value(lds_dync_1, 'custom_n13', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DEC')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_n13',lds_contract_multi_header.getitemdecimal(i,'custom_n13'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_n14') = true then of_set_value(lds_dync_1, 'custom_n14', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DEC')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_n14',lds_contract_multi_header.getitemdecimal(i,'custom_n14'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_n15') = true then of_set_value(lds_dync_1, 'custom_n15', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DEC')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_n15',lds_contract_multi_header.getitemdecimal(i,'custom_n15'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_n16') = true then of_set_value(lds_dync_1, 'custom_n16', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DEC')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_n16',lds_contract_multi_header.getitemdecimal(i,'custom_n16'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_n17') = true then of_set_value(lds_dync_1, 'custom_n17', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DEC')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_n17',lds_contract_multi_header.getitemdecimal(i,'custom_n17'))		
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_n18') = true then of_set_value(lds_dync_1, 'custom_n18', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DEC')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_n18',lds_contract_multi_header.getitemdecimal(i,'custom_n18'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_n19') = true then of_set_value(lds_dync_1, 'custom_n19', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DEC')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_n19',lds_contract_multi_header.getitemdecimal(i,'custom_n19'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_n20') = true then of_set_value(lds_dync_1, 'custom_n20', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DEC')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_n20',lds_contract_multi_header.getitemdecimal(i,'custom_n20'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_n21') = true then of_set_value(lds_dync_1, 'custom_n21', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DEC')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_n21',lds_contract_multi_header.getitemdecimal(i,'custom_n21'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_n22') = true then of_set_value(lds_dync_1, 'custom_n22', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DEC')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_n22',lds_contract_multi_header.getitemdecimal(i,'custom_n22'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_n23') = true then of_set_value(lds_dync_1, 'custom_n23', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DEC')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_n23',lds_contract_multi_header.getitemdecimal(i,'custom_n23'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_n24') = true then of_set_value(lds_dync_1, 'custom_n24', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DEC')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_n24',lds_contract_multi_header.getitemdecimal(i,'custom_n24'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_n25') = true then of_set_value(lds_dync_1, 'custom_n25', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DEC')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_n25',lds_contract_multi_header.getitemdecimal(i,'custom_n25'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_n26') = true then of_set_value(lds_dync_1, 'custom_n26', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DEC')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_n26',lds_contract_multi_header.getitemdecimal(i,'custom_n26'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_n27') = true then of_set_value(lds_dync_1, 'custom_n27', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DEC')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_n27',lds_contract_multi_header.getitemdecimal(i,'custom_n27'))		
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_n28') = true then of_set_value(lds_dync_1, 'custom_n28', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DEC')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_n28',lds_contract_multi_header.getitemdecimal(i,'custom_n28'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_n29') = true then of_set_value(lds_dync_1, 'custom_n29', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DEC')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_n29',lds_contract_multi_header.getitemdecimal(i,'custom_n29'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_n30') = true then of_set_value(lds_dync_1, 'custom_n30', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DEC')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_n30',lds_contract_multi_header.getitemdecimal(i,'custom_n30'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_n31') = true then of_set_value(lds_dync_1, 'custom_n31', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DEC')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_n31',lds_contract_multi_header.getitemdecimal(i,'custom_n31'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_n32') = true then of_set_value(lds_dync_1, 'custom_n32', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DEC')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_n32',lds_contract_multi_header.getitemdecimal(i,'custom_n32'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_n33') = true then of_set_value(lds_dync_1, 'custom_n33', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DEC')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_n33',lds_contract_multi_header.getitemdecimal(i,'custom_n33'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_n34') = true then of_set_value(lds_dync_1, 'custom_n34', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DEC')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_n34',lds_contract_multi_header.getitemdecimal(i,'custom_n34'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_n35') = true then of_set_value(lds_dync_1, 'custom_n35', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DEC')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_n35',lds_contract_multi_header.getitemdecimal(i,'custom_n35'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_n36') = true then of_set_value(lds_dync_1, 'custom_n36', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DEC')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_n36',lds_contract_multi_header.getitemdecimal(i,'custom_n36'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_n37') = true then of_set_value(lds_dync_1, 'custom_n37', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DEC')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_n37',lds_contract_multi_header.getitemdecimal(i,'custom_n37'))		
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_n38') = true then of_set_value(lds_dync_1, 'custom_n38', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DEC')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_n38',lds_contract_multi_header.getitemdecimal(i,'custom_n38'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_n39') = true then of_set_value(lds_dync_1, 'custom_n39', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DEC')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_n39',lds_contract_multi_header.getitemdecimal(i,'custom_n39'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_n40') = true then of_set_value(lds_dync_1, 'custom_n40', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DEC')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_n40',lds_contract_multi_header.getitemdecimal(i,'custom_n40'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_n41') = true then of_set_value(lds_dync_1, 'custom_n41', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DEC')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_n41',lds_contract_multi_header.getitemdecimal(i,'custom_n41'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_n42') = true then of_set_value(lds_dync_1, 'custom_n42', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DEC')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_n42',lds_contract_multi_header.getitemdecimal(i,'custom_n42'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_n43') = true then of_set_value(lds_dync_1, 'custom_n43', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DEC')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_n43',lds_contract_multi_header.getitemdecimal(i,'custom_n43'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_n44') = true then of_set_value(lds_dync_1, 'custom_n44', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DEC')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_n44',lds_contract_multi_header.getitemdecimal(i,'custom_n44'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_n45') = true then of_set_value(lds_dync_1, 'custom_n45', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DEC')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_n45',lds_contract_multi_header.getitemdecimal(i,'custom_n45'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_n46') = true then of_set_value(lds_dync_1, 'custom_n46', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DEC')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_n46',lds_contract_multi_header.getitemdecimal(i,'custom_n46'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_n47') = true then of_set_value(lds_dync_1, 'custom_n47', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DEC')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_n47',lds_contract_multi_header.getitemdecimal(i,'custom_n47'))		
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_n48') = true then of_set_value(lds_dync_1, 'custom_n48', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DEC')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_n48',lds_contract_multi_header.getitemdecimal(i,'custom_n48'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_n49') = true then of_set_value(lds_dync_1, 'custom_n49', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DEC')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_n49',lds_contract_multi_header.getitemdecimal(i,'custom_n49'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_n50') = true then of_set_value(lds_dync_1, 'custom_n50', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DEC')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_n50',lds_contract_multi_header.getitemdecimal(i,'custom_n50'))
		
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_notes_1') = true then of_set_value(lds_dync_1, 'custom_notes_1', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'C')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_notes_1',lds_contract_multi_header.getitemstring(i,'custom_notes_1'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_notes_2') = true then of_set_value(lds_dync_1, 'custom_notes_2', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'C')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_notes_2',lds_contract_multi_header.getitemstring(i,'custom_notes_2'))
		
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_m1') = true then of_set_value(lds_dync_1, 'custom_m1', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DEC')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_m1',lds_contract_multi_header.getitemdecimal(i,'custom_m1'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_m2') = true then of_set_value(lds_dync_1, 'custom_m2', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DEC')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_m2',lds_contract_multi_header.getitemdecimal(i,'custom_m2'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_m3') = true then of_set_value(lds_dync_1, 'custom_m3', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DEC')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_m3',lds_contract_multi_header.getitemdecimal(i,'custom_m3'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_m4') = true then of_set_value(lds_dync_1, 'custom_m4', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DEC')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_m4',lds_contract_multi_header.getitemdecimal(i,'custom_m4'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_m5') = true then of_set_value(lds_dync_1, 'custom_m5', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DEC')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_m5',lds_contract_multi_header.getitemdecimal(i,'custom_m5'))		
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_m6') = true then of_set_value(lds_dync_1, 'custom_m6', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DEC')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_m6',lds_contract_multi_header.getitemdecimal(i,'custom_m6'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_m7') = true then of_set_value(lds_dync_1, 'custom_m7', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DEC')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_m7',lds_contract_multi_header.getitemdecimal(i,'custom_m7'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_m8') = true then of_set_value(lds_dync_1, 'custom_m8', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DEC')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_m8',lds_contract_multi_header.getitemdecimal(i,'custom_m8'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_m9') = true then of_set_value(lds_dync_1, 'custom_m9', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DEC')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_m9',lds_contract_multi_header.getitemdecimal(i,'custom_m9'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_m10') = true then of_set_value(lds_dync_1, 'custom_m10', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DEC')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_m10',lds_contract_multi_header.getitemdecimal(i,'custom_m10'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_m11') = true then of_set_value(lds_dync_1, 'custom_m11', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DEC')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_m11',lds_contract_multi_header.getitemdecimal(i,'custom_m11'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_m12') = true then of_set_value(lds_dync_1, 'custom_m12', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DEC')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_m12',lds_contract_multi_header.getitemdecimal(i,'custom_m12'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_m13') = true then of_set_value(lds_dync_1, 'custom_m13', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DEC')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_m13',lds_contract_multi_header.getitemdecimal(i,'custom_m13'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_m14') = true then of_set_value(lds_dync_1, 'custom_m14', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DEC')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_m14',lds_contract_multi_header.getitemdecimal(i,'custom_m14'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_m15') = true then of_set_value(lds_dync_1, 'custom_m15', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DEC')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_m15',lds_contract_multi_header.getitemdecimal(i,'custom_m15'))		
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_m16') = true then of_set_value(lds_dync_1, 'custom_m16', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DEC')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_m16',lds_contract_multi_header.getitemdecimal(i,'custom_m16'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_m17') = true then of_set_value(lds_dync_1, 'custom_m17', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DEC')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_m17',lds_contract_multi_header.getitemdecimal(i,'custom_m17'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_m18') = true then of_set_value(lds_dync_1, 'custom_m18', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DEC')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_m18',lds_contract_multi_header.getitemdecimal(i,'custom_m18'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_m19') = true then of_set_value(lds_dync_1, 'custom_m19', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DEC')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_m19',lds_contract_multi_header.getitemdecimal(i,'custom_m19'))
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_m20') = true then of_set_value(lds_dync_1, 'custom_m20', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DEC')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_m20',lds_contract_multi_header.getitemdecimal(i,'custom_m20'))
		
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_percent_1') = true then of_set_value(lds_dync_1, 'custom_percent_1', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DEC')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_percent_1',lds_contract_multi_header.getitemdecimal(i,'custom_percent_1'))		
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_percent_2') = true then of_set_value(lds_dync_1, 'custom_percent_2', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DEC')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_percent_2',lds_contract_multi_header.getitemdecimal(i,'custom_percent_2'))		
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_percent_3') = true then of_set_value(lds_dync_1, 'custom_percent_3', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DEC')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_percent_3',lds_contract_multi_header.getitemdecimal(i,'custom_percent_3'))		
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_percent_4') = true then of_set_value(lds_dync_1, 'custom_percent_4', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DEC')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_percent_4',lds_contract_multi_header.getitemdecimal(i,'custom_percent_4'))		
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_percent_5') = true then of_set_value(lds_dync_1, 'custom_percent_5', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DEC')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_percent_5',lds_contract_multi_header.getitemdecimal(i,'custom_percent_5'))		
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_percent_6') = true then of_set_value(lds_dync_1, 'custom_percent_6', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DEC')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_percent_6',lds_contract_multi_header.getitemdecimal(i,'custom_percent_6'))		
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_percent_7') = true then of_set_value(lds_dync_1, 'custom_percent_7', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DEC')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_percent_7',lds_contract_multi_header.getitemdecimal(i,'custom_percent_7'))		
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_percent_8') = true then of_set_value(lds_dync_1, 'custom_percent_8', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DEC')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_percent_8',lds_contract_multi_header.getitemdecimal(i,'custom_percent_8'))		
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_percent_9') = true then of_set_value(lds_dync_1, 'custom_percent_9', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DEC')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_percent_9',lds_contract_multi_header.getitemdecimal(i,'custom_percent_9'))		
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_percent_10') = true then of_set_value(lds_dync_1, 'custom_percent_10', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DEC')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_percent_10',lds_contract_multi_header.getitemdecimal(i,'custom_percent_10'))		
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_percent_11') = true then of_set_value(lds_dync_1, 'custom_percent_11', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DEC')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_percent_11',lds_contract_multi_header.getitemdecimal(i,'custom_percent_11'))		
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_percent_12') = true then of_set_value(lds_dync_1, 'custom_percent_12', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DEC')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_percent_12',lds_contract_multi_header.getitemdecimal(i,'custom_percent_12'))		
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_percent_13') = true then of_set_value(lds_dync_1, 'custom_percent_13', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DEC')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_percent_13',lds_contract_multi_header.getitemdecimal(i,'custom_percent_13'))		
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_percent_14') = true then of_set_value(lds_dync_1, 'custom_percent_14', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DEC')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_percent_14',lds_contract_multi_header.getitemdecimal(i,'custom_percent_14'))		
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_percent_15') = true then of_set_value(lds_dync_1, 'custom_percent_15', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DEC')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_percent_15',lds_contract_multi_header.getitemdecimal(i,'custom_percent_15'))		
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_percent_16') = true then of_set_value(lds_dync_1, 'custom_percent_16', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DEC')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_percent_16',lds_contract_multi_header.getitemdecimal(i,'custom_percent_16'))		
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_percent_17') = true then of_set_value(lds_dync_1, 'custom_percent_17', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DEC')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_percent_17',lds_contract_multi_header.getitemdecimal(i,'custom_percent_17'))		
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_percent_18') = true then of_set_value(lds_dync_1, 'custom_percent_18', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DEC')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_percent_18',lds_contract_multi_header.getitemdecimal(i,'custom_percent_18'))		
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_percent_19') = true then of_set_value(lds_dync_1, 'custom_percent_19', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DEC')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_percent_19',lds_contract_multi_header.getitemdecimal(i,'custom_percent_19'))		
		if of_check_unselect_fields(53,'ctx_custom_multi_hdr','custom_percent_20') = true then of_set_value(lds_dync_1, 'custom_percent_20', lds_contract_multi_header_copy, ll_row, lds_contract_multi_header, i, 'DEC')	//Modified by harry 20170621      lds_contract_multi_header_copy.setitem(ll_row,'custom_percent_20',lds_contract_multi_header.getitemdecimal(i,'custom_percent_20'))				
				
	next 
	
	if lds_contract_multi_header_copy.rowcount( ) >0 then 
		ll_Rtn = lds_contract_multi_header_copy.Update()
		if ll_Rtn = 1 then
			COMMIT USING SQLCA;
		else
			ROLLBACK USING SQLCA;
		end if
	end if 
	
	if isvalid(lds_contract_multi_header) then destroy lds_contract_multi_header 
	if isvalid(lds_contract_multi_header_copy) then destroy lds_contract_multi_header_copy 		
  	  
		 
//	INSERT INTO ctx_custom_multi_detail
//	(ctx_id,hdr_id,detail_id,custom_int1,custom_int2,custom_int3,custom_int4,custom_int5,custom_fee1,custom_fee2,custom_fee3,custom_fee4,custom_fee5,custom_1,custom_2,custom_3,custom_4,custom_5,
//	custom_6,custom_7,custom_8,custom_9,custom_10,custom_date1,custom_date2,custom_date3,custom_date4,custom_date5,custom_n1,custom_n2,custom_n3,custom_n4,custom_n5,custom_percent_1,
//	custom_percent_2,custom_notes_1,custom_11, custom_12, custom_13, custom_14, custom_15, custom_16, custom_17, custom_18, custom_19, custom_20, custom_21, custom_22, custom_23, custom_24, 
//	custom_25, custom_26, custom_27, custom_28, custom_29, custom_30, custom_31, custom_32, custom_33, custom_34, custom_35, custom_36, custom_37, custom_38, custom_39, custom_40, 
//	custom_41, custom_42, custom_43, custom_44, custom_45, custom_46, custom_47, custom_48, custom_49, custom_50, custom_int6, custom_int7, custom_int8, custom_int9, custom_int10, custom_int11, 
//	custom_int12, custom_int13, custom_int14, custom_int15, custom_int16, custom_int17, custom_int18, custom_int19, custom_int20, custom_int21, custom_int22, custom_int23, custom_int24, custom_int25, 
//	custom_int26, custom_int27, custom_int28, custom_int29, custom_int30, custom_int31, custom_int32, custom_int33, custom_int34, custom_int35, custom_int36, custom_int37, custom_int38, custom_int39, 
//	custom_int40, custom_int41, custom_int42, custom_int43, custom_int44, custom_int45, custom_int46, custom_int47, custom_int48, custom_int49, custom_int50, custom_fee6, custom_fee7, custom_fee8, 
//	custom_fee9, custom_fee10, custom_fee11, custom_fee12, custom_fee13, custom_fee14, custom_fee15, custom_fee16, custom_fee17, custom_fee18, custom_fee19, custom_fee20, custom_date6, custom_date7, 
//	custom_date8, custom_date9, custom_date10, custom_date11, custom_date12, custom_date13, custom_date14, custom_date15, custom_date16, custom_date17, custom_date18, custom_date19, custom_date20, 
//	custom_n6, custom_n7, custom_n8, custom_n9, custom_n10, custom_n11, custom_n12, custom_n13, custom_n14, custom_n15, custom_n16, custom_n17, custom_n18, custom_n19, custom_n20, custom_n21, 
//	custom_n22, custom_n23, custom_n24, custom_n25, custom_n26, custom_n27, custom_n28, custom_n29, custom_n30, custom_n31, custom_n32, custom_n33, custom_n34, custom_n35, custom_n36, custom_n37, 
//	custom_n38, custom_n39, custom_n40, custom_n41, custom_n42, custom_n43, custom_n44, custom_n45, custom_n46, custom_n47, custom_n48, custom_n49, custom_n50, custom_percent_3, custom_percent_4, 
//	custom_percent_5, custom_percent_6, custom_percent_7, custom_percent_8, custom_percent_9, custom_percent_10, custom_percent_11, custom_percent_12, custom_percent_13, custom_percent_14, 
//	custom_percent_15, custom_percent_16, custom_percent_17, custom_percent_18, custom_percent_19, custom_percent_20
//	)
//		select :al_new_ctx_id,hdr_id,detail_id,custom_int1,custom_int2,custom_int3,custom_int4,custom_int5,custom_fee1,custom_fee2,custom_fee3,custom_fee4,custom_fee5,custom_1,custom_2,custom_3,custom_4,
//		custom_5,custom_6,custom_7,custom_8,custom_9,custom_10,custom_date1,custom_date2,custom_date3,custom_date4,custom_date5,custom_n1,custom_n2,custom_n3,custom_n4,custom_n5,custom_percent_1,
//		custom_percent_2,custom_notes_1,custom_11, custom_12, custom_13, custom_14, custom_15, custom_16, custom_17, custom_18, custom_19, custom_20, custom_21, custom_22, custom_23, custom_24, 
//		custom_25, custom_26, custom_27, custom_28, custom_29, custom_30, custom_31, custom_32, custom_33, custom_34, custom_35, custom_36, custom_37, custom_38, custom_39, custom_40, custom_41, 
//		custom_42, custom_43, custom_44, custom_45, custom_46, custom_47, custom_48, custom_49, custom_50, custom_int6, custom_int7, custom_int8, custom_int9, custom_int10, custom_int11, custom_int12, 
//		custom_int13, custom_int14, custom_int15, custom_int16, custom_int17, custom_int18, custom_int19, custom_int20, custom_int21, custom_int22, custom_int23, custom_int24, custom_int25, custom_int26, 
//		custom_int27, custom_int28, custom_int29, custom_int30, custom_int31, custom_int32, custom_int33, custom_int34, custom_int35, custom_int36, custom_int37, custom_int38, custom_int39, custom_int40, 
//		custom_int41, custom_int42, custom_int43, custom_int44, custom_int45, custom_int46, custom_int47, custom_int48, custom_int49, custom_int50, custom_fee6, custom_fee7, custom_fee8, custom_fee9, 
//		custom_fee10, custom_fee11, custom_fee12, custom_fee13, custom_fee14, custom_fee15, custom_fee16, custom_fee17, custom_fee18, custom_fee19, custom_fee20, custom_date6, custom_date7, 
//		custom_date8, custom_date9, custom_date10, custom_date11, custom_date12, custom_date13, custom_date14, custom_date15, custom_date16, custom_date17, custom_date18, custom_date19, 
//		custom_date20, custom_n6, custom_n7, custom_n8, custom_n9, custom_n10, custom_n11, custom_n12, custom_n13, custom_n14, custom_n15, custom_n16, custom_n17, custom_n18, custom_n19, 
//		custom_n20, custom_n21, custom_n22, custom_n23, custom_n24, custom_n25, custom_n26, custom_n27, custom_n28, custom_n29, custom_n30, custom_n31, custom_n32, custom_n33, custom_n34, 
//		custom_n35, custom_n36, custom_n37, custom_n38, custom_n39, custom_n40, custom_n41, custom_n42, custom_n43, custom_n44, custom_n45, custom_n46, custom_n47, custom_n48, custom_n49, 
//		custom_n50, custom_percent_3, custom_percent_4, custom_percent_5, custom_percent_6, custom_percent_7, custom_percent_8, custom_percent_9, custom_percent_10, custom_percent_11, 
//		custom_percent_12, custom_percent_13, custom_percent_14, custom_percent_15, custom_percent_16, custom_percent_17, custom_percent_18, custom_percent_19, custom_percent_20
//		from ctx_custom_multi_detail
//		where ctx_id = :astr_copy_ctx.sl_ctx_id;

	lds_ctx_custom_multi_detail = Create DataStore
	lds_ctx_custom_multi_detail.DataObject = "d_ctx_custom_multi_detail"
	lds_ctx_custom_multi_detail.SetTransObject(SQLCA)
	
	lds_ctx_custom_multi_detail_copy = Create DataStore
	lds_ctx_custom_multi_detail_copy.DataObject = "d_ctx_custom_multi_detail"			 
	lds_ctx_custom_multi_detail_copy.SetTransObject(SQLCA)
	
	lds_ctx_custom_multi_detail.retrieve(astr_copy_ctx.sl_ctx_id )
	ll_count = lds_ctx_custom_multi_detail.rowcount()
	f_create_contract_ds (il_view, 55, lds_dync_2)  //Added by Harry 20170622 
	
	for i =1 to ll_count
		ll_row = lds_ctx_custom_multi_detail_copy.insertrow(0)		
		lds_ctx_custom_multi_detail_copy.setitem(ll_row,'ctx_id',al_new_ctx_id)		
		lds_ctx_custom_multi_detail_copy.setitem(ll_row,'hdr_id',lds_ctx_custom_multi_detail.getitemNumber(i,'hdr_id'))	
		lds_ctx_custom_multi_detail_copy.setitem(ll_row,'detail_id',lds_ctx_custom_multi_detail.getitemNumber(i,'detail_id'))	
		
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_int1') = true then of_set_value(lds_dync_2, 'custom_int1', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'N')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_int1',lds_ctx_custom_multi_detail.getitemnumber(i,'custom_int1'))
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_int2') = true then of_set_value(lds_dync_2, 'custom_int2', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'N')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_int2',lds_ctx_custom_multi_detail.getitemnumber(i,'custom_int2'))
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_int3') = true then of_set_value(lds_dync_2, 'custom_int3', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'N')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_int3',lds_ctx_custom_multi_detail.getitemnumber(i,'custom_int3'))
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_int4') = true then of_set_value(lds_dync_2, 'custom_int4', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'N')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_int4',lds_ctx_custom_multi_detail.getitemnumber(i,'custom_int4'))
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_int5') = true then of_set_value(lds_dync_2, 'custom_int5', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'N')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_int5',lds_ctx_custom_multi_detail.getitemnumber(i,'custom_int5'))
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_int6') = true then of_set_value(lds_dync_2, 'custom_int6', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'N')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_int6',lds_ctx_custom_multi_detail.getitemnumber(i,'custom_int6'))
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_int7') = true then of_set_value(lds_dync_2, 'custom_int7', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'N')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_int7',lds_ctx_custom_multi_detail.getitemnumber(i,'custom_int7'))
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_int8') = true then of_set_value(lds_dync_2, 'custom_int8', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'N')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_int8',lds_ctx_custom_multi_detail.getitemnumber(i,'custom_int8'))		
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_int9') = true then of_set_value(lds_dync_2, 'custom_int9', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'N')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_int9',lds_ctx_custom_multi_detail.getitemnumber(i,'custom_int9'))
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_int10') = true then of_set_value(lds_dync_2, 'custom_int10', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'N')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_int10',lds_ctx_custom_multi_detail.getitemnumber(i,'custom_int10'))		
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_int11') = true then of_set_value(lds_dync_2, 'custom_int11', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'N')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_int11',lds_ctx_custom_multi_detail.getitemnumber(i,'custom_int11'))
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_int12') = true then of_set_value(lds_dync_2, 'custom_int12', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'N')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_int12',lds_ctx_custom_multi_detail.getitemnumber(i,'custom_int12'))
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_int13') = true then of_set_value(lds_dync_2, 'custom_int13', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'N')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_int13',lds_ctx_custom_multi_detail.getitemnumber(i,'custom_int13'))
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_int14') = true then of_set_value(lds_dync_2, 'custom_int14', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'N')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_int14',lds_ctx_custom_multi_detail.getitemnumber(i,'custom_int14'))
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_int15') = true then of_set_value(lds_dync_2, 'custom_int15', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'N')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_int15',lds_ctx_custom_multi_detail.getitemnumber(i,'custom_int15'))
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_int16') = true then of_set_value(lds_dync_2, 'custom_int16', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'N')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_int16',lds_ctx_custom_multi_detail.getitemnumber(i,'custom_int16'))
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_int17') = true then of_set_value(lds_dync_2, 'custom_int17', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'N')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_int17',lds_ctx_custom_multi_detail.getitemnumber(i,'custom_int17'))
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_int18') = true then of_set_value(lds_dync_2, 'custom_int18', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'N')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_int18',lds_ctx_custom_multi_detail.getitemnumber(i,'custom_int18'))		
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_int19') = true then of_set_value(lds_dync_2, 'custom_int19', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'N')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_int19',lds_ctx_custom_multi_detail.getitemnumber(i,'custom_int19'))
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_int20') = true then of_set_value(lds_dync_2, 'custom_int20', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'N')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_int20',lds_ctx_custom_multi_detail.getitemnumber(i,'custom_int20'))		
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_int21') = true then of_set_value(lds_dync_2, 'custom_int21', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'N')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_int21',lds_ctx_custom_multi_detail.getitemnumber(i,'custom_int21'))
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_int22') = true then of_set_value(lds_dync_2, 'custom_int22', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'N')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_int22',lds_ctx_custom_multi_detail.getitemnumber(i,'custom_int22'))
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_int23') = true then of_set_value(lds_dync_2, 'custom_int23', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'N')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_int23',lds_ctx_custom_multi_detail.getitemnumber(i,'custom_int23'))
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_int24') = true then of_set_value(lds_dync_2, 'custom_int24', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'N')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_int24',lds_ctx_custom_multi_detail.getitemnumber(i,'custom_int24'))
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_int25') = true then of_set_value(lds_dync_2, 'custom_int25', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'N')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_int25',lds_ctx_custom_multi_detail.getitemnumber(i,'custom_int25'))
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_int26') = true then of_set_value(lds_dync_2, 'custom_int26', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'N')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_int26',lds_ctx_custom_multi_detail.getitemnumber(i,'custom_int26'))
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_int27') = true then of_set_value(lds_dync_2, 'custom_int27', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'N')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_int27',lds_ctx_custom_multi_detail.getitemnumber(i,'custom_int27'))
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_int28') = true then of_set_value(lds_dync_2, 'custom_int28', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'N')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_int28',lds_ctx_custom_multi_detail.getitemnumber(i,'custom_int28'))		
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_int29') = true then of_set_value(lds_dync_2, 'custom_int29', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'N')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_int29',lds_ctx_custom_multi_detail.getitemnumber(i,'custom_int29'))
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_int30') = true then of_set_value(lds_dync_2, 'custom_int30', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'N')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_int30',lds_ctx_custom_multi_detail.getitemnumber(i,'custom_int30'))		
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_int31') = true then of_set_value(lds_dync_2, 'custom_int31', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'N')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_int31',lds_ctx_custom_multi_detail.getitemnumber(i,'custom_int31'))
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_int32') = true then of_set_value(lds_dync_2, 'custom_int32', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'N')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_int32',lds_ctx_custom_multi_detail.getitemnumber(i,'custom_int32'))
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_int33') = true then of_set_value(lds_dync_2, 'custom_int33', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'N')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_int33',lds_ctx_custom_multi_detail.getitemnumber(i,'custom_int33'))
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_int34') = true then of_set_value(lds_dync_2, 'custom_int34', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'N')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_int34',lds_ctx_custom_multi_detail.getitemnumber(i,'custom_int34'))
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_int35') = true then of_set_value(lds_dync_2, 'custom_int35', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'N')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_int35',lds_ctx_custom_multi_detail.getitemnumber(i,'custom_int35'))
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_int36') = true then of_set_value(lds_dync_2, 'custom_int36', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'N')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_int36',lds_ctx_custom_multi_detail.getitemnumber(i,'custom_int36'))
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_int37') = true then of_set_value(lds_dync_2, 'custom_int37', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'N')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_int37',lds_ctx_custom_multi_detail.getitemnumber(i,'custom_int37'))
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_int38') = true then of_set_value(lds_dync_2, 'custom_int38', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'N')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_int38',lds_ctx_custom_multi_detail.getitemnumber(i,'custom_int38'))		
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_int39') = true then of_set_value(lds_dync_2, 'custom_int39', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'N')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_int39',lds_ctx_custom_multi_detail.getitemnumber(i,'custom_int39'))
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_int40') = true then of_set_value(lds_dync_2, 'custom_int40', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'N')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_int40',lds_ctx_custom_multi_detail.getitemnumber(i,'custom_int40'))		
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_int41') = true then of_set_value(lds_dync_2, 'custom_int41', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'N')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_int41',lds_ctx_custom_multi_detail.getitemnumber(i,'custom_int41'))
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_int42') = true then of_set_value(lds_dync_2, 'custom_int42', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'N')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_int42',lds_ctx_custom_multi_detail.getitemnumber(i,'custom_int42'))
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_int43') = true then of_set_value(lds_dync_2, 'custom_int43', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'N')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_int43',lds_ctx_custom_multi_detail.getitemnumber(i,'custom_int43'))
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_int44') = true then of_set_value(lds_dync_2, 'custom_int44', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'N')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_int44',lds_ctx_custom_multi_detail.getitemnumber(i,'custom_int44'))
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_int45') = true then of_set_value(lds_dync_2, 'custom_int45', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'N')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_int45',lds_ctx_custom_multi_detail.getitemnumber(i,'custom_int45'))
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_int46') = true then of_set_value(lds_dync_2, 'custom_int46', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'N')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_int46',lds_ctx_custom_multi_detail.getitemnumber(i,'custom_int46'))
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_int47') = true then of_set_value(lds_dync_2, 'custom_int47', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'N')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_int47',lds_ctx_custom_multi_detail.getitemnumber(i,'custom_int47'))
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_int48') = true then of_set_value(lds_dync_2, 'custom_int48', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'N')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_int48',lds_ctx_custom_multi_detail.getitemnumber(i,'custom_int48'))		
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_int49') = true then of_set_value(lds_dync_2, 'custom_int49', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'N')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_int49',lds_ctx_custom_multi_detail.getitemnumber(i,'custom_int49'))
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_int50') = true then of_set_value(lds_dync_2, 'custom_int50', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'N')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_int50',lds_ctx_custom_multi_detail.getitemnumber(i,'custom_int50'))				

		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_fee1') = true then of_set_value(lds_dync_2, 'custom_fee1', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_fee1',lds_ctx_custom_multi_detail.getitemdecimal(i,'custom_fee1'))				
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_fee2') = true then of_set_value(lds_dync_2, 'custom_fee2', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_fee2',lds_ctx_custom_multi_detail.getitemdecimal(i,'custom_fee2'))				
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_fee3') = true then of_set_value(lds_dync_2, 'custom_fee3', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_fee3',lds_ctx_custom_multi_detail.getitemdecimal(i,'custom_fee3'))				
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_fee4') = true then of_set_value(lds_dync_2, 'custom_fee4', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_fee4',lds_ctx_custom_multi_detail.getitemdecimal(i,'custom_fee4'))				
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_fee5') = true then of_set_value(lds_dync_2, 'custom_fee5', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_fee5',lds_ctx_custom_multi_detail.getitemdecimal(i,'custom_fee5'))						
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_fee6') = true then of_set_value(lds_dync_2, 'custom_fee6', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_fee6',lds_ctx_custom_multi_detail.getitemdecimal(i,'custom_fee6'))				
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_fee7') = true then of_set_value(lds_dync_2, 'custom_fee7', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_fee7',lds_ctx_custom_multi_detail.getitemdecimal(i,'custom_fee7'))				
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_fee8') = true then of_set_value(lds_dync_2, 'custom_fee8', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_fee8',lds_ctx_custom_multi_detail.getitemdecimal(i,'custom_fee8'))				
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_fee9') = true then of_set_value(lds_dync_2, 'custom_fee9', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_fee9',lds_ctx_custom_multi_detail.getitemdecimal(i,'custom_fee9'))				
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_fee10') = true then of_set_value(lds_dync_2, 'custom_fee10', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_fee10',lds_ctx_custom_multi_detail.getitemdecimal(i,'custom_fee10'))				
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_fee11') = true then of_set_value(lds_dync_2, 'custom_fee11', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_fee11',lds_ctx_custom_multi_detail.getitemdecimal(i,'custom_fee11'))				
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_fee12') = true then of_set_value(lds_dync_2, 'custom_fee12', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_fee12',lds_ctx_custom_multi_detail.getitemdecimal(i,'custom_fee12'))				
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_fee13') = true then of_set_value(lds_dync_2, 'custom_fee13', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_fee13',lds_ctx_custom_multi_detail.getitemdecimal(i,'custom_fee13'))				
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_fee14') = true then of_set_value(lds_dync_2, 'custom_fee14', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_fee14',lds_ctx_custom_multi_detail.getitemdecimal(i,'custom_fee14'))				
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_fee15') = true then of_set_value(lds_dync_2, 'custom_fee15', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_fee15',lds_ctx_custom_multi_detail.getitemdecimal(i,'custom_fee15'))						
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_fee16') = true then of_set_value(lds_dync_2, 'custom_fee16', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_fee16',lds_ctx_custom_multi_detail.getitemdecimal(i,'custom_fee16'))				
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_fee17') = true then of_set_value(lds_dync_2, 'custom_fee17', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_fee17',lds_ctx_custom_multi_detail.getitemdecimal(i,'custom_fee17'))				
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_fee18') = true then of_set_value(lds_dync_2, 'custom_fee18', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_fee18',lds_ctx_custom_multi_detail.getitemdecimal(i,'custom_fee18'))				
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_fee19') = true then of_set_value(lds_dync_2, 'custom_fee19', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_fee19',lds_ctx_custom_multi_detail.getitemdecimal(i,'custom_fee19'))				
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_fee20') = true then of_set_value(lds_dync_2, 'custom_fee20', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_fee20',lds_ctx_custom_multi_detail.getitemdecimal(i,'custom_fee20'))				

		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_1') = true then of_set_value(lds_dync_2, 'custom_1', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'C')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_1',lds_ctx_custom_multi_detail.getitemstring(i,'custom_1'))					
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_2') = true then of_set_value(lds_dync_2, 'custom_2', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'C')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_2',lds_ctx_custom_multi_detail.getitemstring(i,'custom_2'))							
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_3') = true then of_set_value(lds_dync_2, 'custom_3', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'C')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_3',lds_ctx_custom_multi_detail.getitemstring(i,'custom_3'))					
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_4') = true then of_set_value(lds_dync_2, 'custom_4', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'C')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_4',lds_ctx_custom_multi_detail.getitemstring(i,'custom_4'))					
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_5') = true then of_set_value(lds_dync_2, 'custom_5', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'C')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_5',lds_ctx_custom_multi_detail.getitemstring(i,'custom_5'))							
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_6') = true then of_set_value(lds_dync_2, 'custom_6', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'C')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_6',lds_ctx_custom_multi_detail.getitemstring(i,'custom_6'))							
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_7') = true then of_set_value(lds_dync_2, 'custom_7', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'C')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_7',lds_ctx_custom_multi_detail.getitemstring(i,'custom_7'))					
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_8') = true then of_set_value(lds_dync_2, 'custom_8', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'C')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_8',lds_ctx_custom_multi_detail.getitemstring(i,'custom_8'))					
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_9') = true then of_set_value(lds_dync_2, 'custom_9', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'C')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_9',lds_ctx_custom_multi_detail.getitemstring(i,'custom_9'))							
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_10') = true then of_set_value(lds_dync_2, 'custom_10', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'C')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_10',lds_ctx_custom_multi_detail.getitemstring(i,'custom_10'))					
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_11') = true then of_set_value(lds_dync_2, 'custom_11', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'C')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_11',lds_ctx_custom_multi_detail.getitemstring(i,'custom_11'))					
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_12') = true then of_set_value(lds_dync_2, 'custom_12', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'C')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_12',lds_ctx_custom_multi_detail.getitemstring(i,'custom_12'))							
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_13') = true then of_set_value(lds_dync_2, 'custom_13', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'C')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_13',lds_ctx_custom_multi_detail.getitemstring(i,'custom_13'))					
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_14') = true then of_set_value(lds_dync_2, 'custom_14', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'C')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_14',lds_ctx_custom_multi_detail.getitemstring(i,'custom_14'))					
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_15') = true then of_set_value(lds_dync_2, 'custom_15', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'C')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_15',lds_ctx_custom_multi_detail.getitemstring(i,'custom_15'))							
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_16') = true then of_set_value(lds_dync_2, 'custom_16', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'C')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_16',lds_ctx_custom_multi_detail.getitemstring(i,'custom_16'))							
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_17') = true then of_set_value(lds_dync_2, 'custom_17', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'C')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_17',lds_ctx_custom_multi_detail.getitemstring(i,'custom_17'))					
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_18') = true then of_set_value(lds_dync_2, 'custom_18', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'C')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_18',lds_ctx_custom_multi_detail.getitemstring(i,'custom_18'))					
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_19') = true then of_set_value(lds_dync_2, 'custom_19', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'C')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_19',lds_ctx_custom_multi_detail.getitemstring(i,'custom_19'))							
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_20') = true then of_set_value(lds_dync_2, 'custom_20', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'C')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_20',lds_ctx_custom_multi_detail.getitemstring(i,'custom_20'))
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_21') = true then of_set_value(lds_dync_2, 'custom_21', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'C')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_21',lds_ctx_custom_multi_detail.getitemstring(i,'custom_21'))					
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_22') = true then of_set_value(lds_dync_2, 'custom_22', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'C')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_22',lds_ctx_custom_multi_detail.getitemstring(i,'custom_22'))							
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_23') = true then of_set_value(lds_dync_2, 'custom_23', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'C')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_23',lds_ctx_custom_multi_detail.getitemstring(i,'custom_23'))					
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_24') = true then of_set_value(lds_dync_2, 'custom_24', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'C')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_24',lds_ctx_custom_multi_detail.getitemstring(i,'custom_24'))					
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_25') = true then of_set_value(lds_dync_2, 'custom_25', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'C')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_25',lds_ctx_custom_multi_detail.getitemstring(i,'custom_25'))							
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_26') = true then of_set_value(lds_dync_2, 'custom_26', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'C')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_26',lds_ctx_custom_multi_detail.getitemstring(i,'custom_26'))							
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_27') = true then of_set_value(lds_dync_2, 'custom_27', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'C')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_27',lds_ctx_custom_multi_detail.getitemstring(i,'custom_27'))					
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_28') = true then of_set_value(lds_dync_2, 'custom_28', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'C')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_28',lds_ctx_custom_multi_detail.getitemstring(i,'custom_28'))					
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_29') = true then of_set_value(lds_dync_2, 'custom_29', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'C')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_29',lds_ctx_custom_multi_detail.getitemstring(i,'custom_29'))							
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_30') = true then of_set_value(lds_dync_2, 'custom_30', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'C')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_30',lds_ctx_custom_multi_detail.getitemstring(i,'custom_30'))
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_31') = true then of_set_value(lds_dync_2, 'custom_31', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'C')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_31',lds_ctx_custom_multi_detail.getitemstring(i,'custom_31'))					
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_32') = true then of_set_value(lds_dync_2, 'custom_32', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'C')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_32',lds_ctx_custom_multi_detail.getitemstring(i,'custom_32'))							
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_33') = true then of_set_value(lds_dync_2, 'custom_33', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'C')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_33',lds_ctx_custom_multi_detail.getitemstring(i,'custom_33'))					
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_34') = true then of_set_value(lds_dync_2, 'custom_34', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'C')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_34',lds_ctx_custom_multi_detail.getitemstring(i,'custom_34'))					
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_35') = true then of_set_value(lds_dync_2, 'custom_35', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'C')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_35',lds_ctx_custom_multi_detail.getitemstring(i,'custom_35'))							
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_36') = true then of_set_value(lds_dync_2, 'custom_36', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'C')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_36',lds_ctx_custom_multi_detail.getitemstring(i,'custom_36'))							
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_37') = true then of_set_value(lds_dync_2, 'custom_37', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'C')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_37',lds_ctx_custom_multi_detail.getitemstring(i,'custom_37'))					
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_38') = true then of_set_value(lds_dync_2, 'custom_38', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'C')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_38',lds_ctx_custom_multi_detail.getitemstring(i,'custom_38'))					
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_39') = true then of_set_value(lds_dync_2, 'custom_39', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'C')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_39',lds_ctx_custom_multi_detail.getitemstring(i,'custom_39'))							
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_40') = true then of_set_value(lds_dync_2, 'custom_40', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'C')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_40',lds_ctx_custom_multi_detail.getitemstring(i,'custom_40'))
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_41') = true then of_set_value(lds_dync_2, 'custom_41', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'C')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_41',lds_ctx_custom_multi_detail.getitemstring(i,'custom_41'))					
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_42') = true then of_set_value(lds_dync_2, 'custom_42', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'C')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_42',lds_ctx_custom_multi_detail.getitemstring(i,'custom_42'))							
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_43') = true then of_set_value(lds_dync_2, 'custom_43', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'C')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_43',lds_ctx_custom_multi_detail.getitemstring(i,'custom_43'))					
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_44') = true then of_set_value(lds_dync_2, 'custom_44', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'C')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_44',lds_ctx_custom_multi_detail.getitemstring(i,'custom_44'))					
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_45') = true then of_set_value(lds_dync_2, 'custom_45', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'C')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_45',lds_ctx_custom_multi_detail.getitemstring(i,'custom_45'))							
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_46') = true then of_set_value(lds_dync_2, 'custom_46', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'C')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_46',lds_ctx_custom_multi_detail.getitemstring(i,'custom_46'))							
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_47') = true then of_set_value(lds_dync_2, 'custom_47', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'C')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_47',lds_ctx_custom_multi_detail.getitemstring(i,'custom_47'))					
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_48') = true then of_set_value(lds_dync_2, 'custom_48', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'C')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_48',lds_ctx_custom_multi_detail.getitemstring(i,'custom_48'))					
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_49') = true then of_set_value(lds_dync_2, 'custom_49', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'C')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_49',lds_ctx_custom_multi_detail.getitemstring(i,'custom_49'))							
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_50') = true then of_set_value(lds_dync_2, 'custom_50', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'C')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_50',lds_ctx_custom_multi_detail.getitemstring(i,'custom_50'))

		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_date1') = true then of_set_value(lds_dync_2, 'custom_date1', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DT')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_date1',lds_ctx_custom_multi_detail.getitemDatetime(i,'custom_date1'))
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_date2') = true then of_set_value(lds_dync_2, 'custom_date2', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DT')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_date2',lds_ctx_custom_multi_detail.getitemDatetime(i,'custom_date2'))
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_date3') = true then of_set_value(lds_dync_2, 'custom_date3', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DT')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_date3',lds_ctx_custom_multi_detail.getitemDatetime(i,'custom_date3'))
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_date4') = true then of_set_value(lds_dync_2, 'custom_date4', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DT')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_date4',lds_ctx_custom_multi_detail.getitemDatetime(i,'custom_date4'))				
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_date5') = true then of_set_value(lds_dync_2, 'custom_date5', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DT')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_date5',lds_ctx_custom_multi_detail.getitemDatetime(i,'custom_date5'))
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_date6') = true then of_set_value(lds_dync_2, 'custom_date6', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DT')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_date6',lds_ctx_custom_multi_detail.getitemDatetime(i,'custom_date6'))
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_date7') = true then of_set_value(lds_dync_2, 'custom_date7', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DT')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_date7',lds_ctx_custom_multi_detail.getitemDatetime(i,'custom_date7'))				
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_date8') = true then of_set_value(lds_dync_2, 'custom_date8', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DT')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_date8',lds_ctx_custom_multi_detail.getitemDatetime(i,'custom_date8'))
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_date9') = true then of_set_value(lds_dync_2, 'custom_date9', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DT')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_date9',lds_ctx_custom_multi_detail.getitemDatetime(i,'custom_date9'))
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_date10') = true then of_set_value(lds_dync_2, 'custom_date10', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DT')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_date10',lds_ctx_custom_multi_detail.getitemDatetime(i,'custom_date10'))						
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_date11') = true then of_set_value(lds_dync_2, 'custom_date11', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DT')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_date11',lds_ctx_custom_multi_detail.getitemDatetime(i,'custom_date11'))
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_date12') = true then of_set_value(lds_dync_2, 'custom_date12', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DT')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_date12',lds_ctx_custom_multi_detail.getitemDatetime(i,'custom_date12'))
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_date13') = true then of_set_value(lds_dync_2, 'custom_date13', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DT')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_date13',lds_ctx_custom_multi_detail.getitemDatetime(i,'custom_date13'))
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_date14') = true then of_set_value(lds_dync_2, 'custom_date14', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DT')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_date14',lds_ctx_custom_multi_detail.getitemDatetime(i,'custom_date14'))				
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_date15') = true then of_set_value(lds_dync_2, 'custom_date15', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DT')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_date15',lds_ctx_custom_multi_detail.getitemDatetime(i,'custom_date15'))
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_date16') = true then of_set_value(lds_dync_2, 'custom_date16', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DT')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_date16',lds_ctx_custom_multi_detail.getitemDatetime(i,'custom_date16'))
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_date17') = true then of_set_value(lds_dync_2, 'custom_date17', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DT')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_date17',lds_ctx_custom_multi_detail.getitemDatetime(i,'custom_date17'))				
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_date18') = true then of_set_value(lds_dync_2, 'custom_date18', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DT')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_date18',lds_ctx_custom_multi_detail.getitemDatetime(i,'custom_date18'))
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_date19') = true then of_set_value(lds_dync_2, 'custom_date19', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DT')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_date19',lds_ctx_custom_multi_detail.getitemDatetime(i,'custom_date19'))
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_date20') = true then of_set_value(lds_dync_2, 'custom_date20', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DT')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_date20',lds_ctx_custom_multi_detail.getitemDatetime(i,'custom_date20'))						

		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_n1') = true then of_set_value(lds_dync_2, 'custom_n1', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_n1',lds_ctx_custom_multi_detail.getitemdecimal(i,'custom_n1'))	
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_n2') = true then of_set_value(lds_dync_2, 'custom_n2', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_n2',lds_ctx_custom_multi_detail.getitemdecimal(i,'custom_n2'))	
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_n3') = true then of_set_value(lds_dync_2, 'custom_n3', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_n3',lds_ctx_custom_multi_detail.getitemdecimal(i,'custom_n3'))	
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_n4') = true then of_set_value(lds_dync_2, 'custom_n4', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_n4',lds_ctx_custom_multi_detail.getitemdecimal(i,'custom_n4'))			
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_n5') = true then of_set_value(lds_dync_2, 'custom_n5', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_n5',lds_ctx_custom_multi_detail.getitemdecimal(i,'custom_n5'))	
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_n6') = true then of_set_value(lds_dync_2, 'custom_n6', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_n6',lds_ctx_custom_multi_detail.getitemdecimal(i,'custom_n6'))	
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_n7') = true then of_set_value(lds_dync_2, 'custom_n7', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_n7',lds_ctx_custom_multi_detail.getitemdecimal(i,'custom_n7'))	
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_n8') = true then of_set_value(lds_dync_2, 'custom_n8', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_n8',lds_ctx_custom_multi_detail.getitemdecimal(i,'custom_n8'))	
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_n9') = true then of_set_value(lds_dync_2, 'custom_n9', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_n9',lds_ctx_custom_multi_detail.getitemdecimal(i,'custom_n9'))	
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_n10') = true then of_set_value(lds_dync_2, 'custom_n10', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_n10',lds_ctx_custom_multi_detail.getitemdecimal(i,'custom_n10'))	
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_n11') = true then of_set_value(lds_dync_2, 'custom_n11', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_n11',lds_ctx_custom_multi_detail.getitemdecimal(i,'custom_n11'))	
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_n12') = true then of_set_value(lds_dync_2, 'custom_n12', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_n12',lds_ctx_custom_multi_detail.getitemdecimal(i,'custom_n12'))	
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_n13') = true then of_set_value(lds_dync_2, 'custom_n13', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_n13',lds_ctx_custom_multi_detail.getitemdecimal(i,'custom_n13'))	
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_n14') = true then of_set_value(lds_dync_2, 'custom_n14', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_n14',lds_ctx_custom_multi_detail.getitemdecimal(i,'custom_n14'))			
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_n15') = true then of_set_value(lds_dync_2, 'custom_n15', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_n15',lds_ctx_custom_multi_detail.getitemdecimal(i,'custom_n15'))	
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_n16') = true then of_set_value(lds_dync_2, 'custom_n16', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_n16',lds_ctx_custom_multi_detail.getitemdecimal(i,'custom_n16'))	
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_n17') = true then of_set_value(lds_dync_2, 'custom_n17', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_n17',lds_ctx_custom_multi_detail.getitemdecimal(i,'custom_n17'))	
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_n18') = true then of_set_value(lds_dync_2, 'custom_n18', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_n18',lds_ctx_custom_multi_detail.getitemdecimal(i,'custom_n18'))	
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_n19') = true then of_set_value(lds_dync_2, 'custom_n19', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_n19',lds_ctx_custom_multi_detail.getitemdecimal(i,'custom_n19'))	
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_n20') = true then of_set_value(lds_dync_2, 'custom_n20', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_n20',lds_ctx_custom_multi_detail.getitemdecimal(i,'custom_n20'))	
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_n21') = true then of_set_value(lds_dync_2, 'custom_n21', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_n21',lds_ctx_custom_multi_detail.getitemdecimal(i,'custom_n21'))	
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_n22') = true then of_set_value(lds_dync_2, 'custom_n22', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_n22',lds_ctx_custom_multi_detail.getitemdecimal(i,'custom_n22'))	
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_n23') = true then of_set_value(lds_dync_2, 'custom_n23', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_n23',lds_ctx_custom_multi_detail.getitemdecimal(i,'custom_n23'))	
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_n24') = true then of_set_value(lds_dync_2, 'custom_n24', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_n24',lds_ctx_custom_multi_detail.getitemdecimal(i,'custom_n24'))			
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_n25') = true then of_set_value(lds_dync_2, 'custom_n25', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_n25',lds_ctx_custom_multi_detail.getitemdecimal(i,'custom_n25'))	
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_n26') = true then of_set_value(lds_dync_2, 'custom_n26', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_n26',lds_ctx_custom_multi_detail.getitemdecimal(i,'custom_n26'))	
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_n27') = true then of_set_value(lds_dync_2, 'custom_n27', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_n27',lds_ctx_custom_multi_detail.getitemdecimal(i,'custom_n27'))	
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_n28') = true then of_set_value(lds_dync_2, 'custom_n28', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_n28',lds_ctx_custom_multi_detail.getitemdecimal(i,'custom_n28'))	
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_n29') = true then of_set_value(lds_dync_2, 'custom_n29', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_n29',lds_ctx_custom_multi_detail.getitemdecimal(i,'custom_n29'))	
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_n30') = true then of_set_value(lds_dync_2, 'custom_n30', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_n30',lds_ctx_custom_multi_detail.getitemdecimal(i,'custom_n30'))	
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_n31') = true then of_set_value(lds_dync_2, 'custom_n31', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_n31',lds_ctx_custom_multi_detail.getitemdecimal(i,'custom_n31'))	
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_n32') = true then of_set_value(lds_dync_2, 'custom_n32', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_n32',lds_ctx_custom_multi_detail.getitemdecimal(i,'custom_n32'))	
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_n33') = true then of_set_value(lds_dync_2, 'custom_n33', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_n33',lds_ctx_custom_multi_detail.getitemdecimal(i,'custom_n33'))	
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_n34') = true then of_set_value(lds_dync_2, 'custom_n34', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_n34',lds_ctx_custom_multi_detail.getitemdecimal(i,'custom_n34'))			
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_n35') = true then of_set_value(lds_dync_2, 'custom_n35', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_n35',lds_ctx_custom_multi_detail.getitemdecimal(i,'custom_n35'))	
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_n36') = true then of_set_value(lds_dync_2, 'custom_n36', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_n36',lds_ctx_custom_multi_detail.getitemdecimal(i,'custom_n36'))	
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_n37') = true then of_set_value(lds_dync_2, 'custom_n37', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_n37',lds_ctx_custom_multi_detail.getitemdecimal(i,'custom_n37'))	
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_n38') = true then of_set_value(lds_dync_2, 'custom_n38', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_n38',lds_ctx_custom_multi_detail.getitemdecimal(i,'custom_n38'))	
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_n39') = true then of_set_value(lds_dync_2, 'custom_n39', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_n39',lds_ctx_custom_multi_detail.getitemdecimal(i,'custom_n39'))	
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_n40') = true then of_set_value(lds_dync_2, 'custom_n40', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_n40',lds_ctx_custom_multi_detail.getitemdecimal(i,'custom_n40'))	
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_n41') = true then of_set_value(lds_dync_2, 'custom_n41', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_n41',lds_ctx_custom_multi_detail.getitemdecimal(i,'custom_n41'))	
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_n42') = true then of_set_value(lds_dync_2, 'custom_n42', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_n42',lds_ctx_custom_multi_detail.getitemdecimal(i,'custom_n42'))	
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_n43') = true then of_set_value(lds_dync_2, 'custom_n43', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_n43',lds_ctx_custom_multi_detail.getitemdecimal(i,'custom_n43'))	
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_n44') = true then of_set_value(lds_dync_2, 'custom_n44', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_n44',lds_ctx_custom_multi_detail.getitemdecimal(i,'custom_n44'))			
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_n45') = true then of_set_value(lds_dync_2, 'custom_n45', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_n45',lds_ctx_custom_multi_detail.getitemdecimal(i,'custom_n45'))	
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_n46') = true then of_set_value(lds_dync_2, 'custom_n46', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_n46',lds_ctx_custom_multi_detail.getitemdecimal(i,'custom_n46'))	
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_n47') = true then of_set_value(lds_dync_2, 'custom_n47', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_n47',lds_ctx_custom_multi_detail.getitemdecimal(i,'custom_n47'))	
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_n48') = true then of_set_value(lds_dync_2, 'custom_n48', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_n48',lds_ctx_custom_multi_detail.getitemdecimal(i,'custom_n48'))	
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_n49') = true then of_set_value(lds_dync_2, 'custom_n49', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_n49',lds_ctx_custom_multi_detail.getitemdecimal(i,'custom_n49'))	
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_n50') = true then of_set_value(lds_dync_2, 'custom_n50', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_n50',lds_ctx_custom_multi_detail.getitemdecimal(i,'custom_n50'))			
		
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_percent_1') = true then of_set_value(lds_dync_2, 'custom_percent_1', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_percent_1',lds_ctx_custom_multi_detail.getitemdecimal(i,'custom_percent_1'))	
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_percent_2') = true then of_set_value(lds_dync_2, 'custom_percent_2', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_percent_2',lds_ctx_custom_multi_detail.getitemdecimal(i,'custom_percent_2'))	
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_percent_3') = true then of_set_value(lds_dync_2, 'custom_percent_3', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_percent_3',lds_ctx_custom_multi_detail.getitemdecimal(i,'custom_percent_3'))			
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_percent_4') = true then of_set_value(lds_dync_2, 'custom_percent_4', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_percent_4',lds_ctx_custom_multi_detail.getitemdecimal(i,'custom_percent_4'))		
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_percent_5') = true then of_set_value(lds_dync_2, 'custom_percent_5', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_percent_5',lds_ctx_custom_multi_detail.getitemdecimal(i,'custom_percent_5'))		
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_percent_6') = true then of_set_value(lds_dync_2, 'custom_percent_6', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_percent_6',lds_ctx_custom_multi_detail.getitemdecimal(i,'custom_percent_6'))		
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_percent_7') = true then of_set_value(lds_dync_2, 'custom_percent_7', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_percent_7',lds_ctx_custom_multi_detail.getitemdecimal(i,'custom_percent_7'))			
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_percent_8') = true then of_set_value(lds_dync_2, 'custom_percent_8', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_percent_8',lds_ctx_custom_multi_detail.getitemdecimal(i,'custom_percent_8'))		
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_percent_9') = true then of_set_value(lds_dync_2, 'custom_percent_9', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_percent_9',lds_ctx_custom_multi_detail.getitemdecimal(i,'custom_percent_9'))		
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_percent_10') = true then of_set_value(lds_dync_2, 'custom_percent_10', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_percent_10',lds_ctx_custom_multi_detail.getitemdecimal(i,'custom_percent_10'))				
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_percent_11') = true then of_set_value(lds_dync_2, 'custom_percent_11', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_percent_11',lds_ctx_custom_multi_detail.getitemdecimal(i,'custom_percent_11'))	
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_percent_12') = true then of_set_value(lds_dync_2, 'custom_percent_12', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_percent_12',lds_ctx_custom_multi_detail.getitemdecimal(i,'custom_percent_12'))	
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_percent_13') = true then of_set_value(lds_dync_2, 'custom_percent_13', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_percent_13',lds_ctx_custom_multi_detail.getitemdecimal(i,'custom_percent_13'))			
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_percent_14') = true then of_set_value(lds_dync_2, 'custom_percent_14', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_percent_14',lds_ctx_custom_multi_detail.getitemdecimal(i,'custom_percent_14'))		
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_percent_15') = true then of_set_value(lds_dync_2, 'custom_percent_15', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_percent_15',lds_ctx_custom_multi_detail.getitemdecimal(i,'custom_percent_15'))		
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_percent_16') = true then of_set_value(lds_dync_2, 'custom_percent_16', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_percent_16',lds_ctx_custom_multi_detail.getitemdecimal(i,'custom_percent_16'))		
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_percent_17') = true then of_set_value(lds_dync_2, 'custom_percent_17', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_percent_17',lds_ctx_custom_multi_detail.getitemdecimal(i,'custom_percent_17'))			
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_percent_18') = true then of_set_value(lds_dync_2, 'custom_percent_18', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_percent_18',lds_ctx_custom_multi_detail.getitemdecimal(i,'custom_percent_18'))		
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_percent_19') = true then of_set_value(lds_dync_2, 'custom_percent_19', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_percent_19',lds_ctx_custom_multi_detail.getitemdecimal(i,'custom_percent_19'))		
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_percent_20') = true then of_set_value(lds_dync_2, 'custom_percent_20', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'DEC')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_percent_20',lds_ctx_custom_multi_detail.getitemdecimal(i,'custom_percent_20'))
		
		if of_check_unselect_fields(55,'ctx_custom_multi_detail','custom_notes_1') = true then of_set_value(lds_dync_2, 'custom_notes_1', lds_ctx_custom_multi_detail_copy, ll_row, lds_ctx_custom_multi_detail, i, 'C')	//Modified by harry 20170621      lds_ctx_custom_multi_detail_copy.setitem(ll_row,'custom_notes_1',lds_ctx_custom_multi_detail.getitemstring(i,'custom_notes_1'))
	next 
		
		
	if lds_ctx_custom_multi_detail_copy.rowcount( ) >0 then 
		ll_Rtn = lds_ctx_custom_multi_detail_copy.Update()
		if ll_Rtn = 1 then
			COMMIT USING SQLCA;
		else
			ROLLBACK USING SQLCA;
		end if
	end if 
	
	if isvalid(lds_ctx_custom_multi_detail) then destroy lds_ctx_custom_multi_detail 
	if isvalid(lds_ctx_custom_multi_detail_copy) then destroy lds_ctx_custom_multi_detail_copy 		
	
end if

//Added by Harry 20170620 for Task 728
if isvalid(lds_dync_1) then destroy lds_dync_1 
if isvalid(lds_dync_2) then destroy lds_dync_2 
end subroutine

public function integer of_insert_contact (long al_ctx_id, integer ai_ib_default_email, integer ai_ib_owner);//////////////////////////////////////////////////////////////////////
// $<function>n_cst_copy_ctxof_insert_contact()
// $<arguments>
//		long	al_ctx_id		
// $<returns> integer
// $<description>
// $<description> Insert current user to our company contact.
//////////////////////////////////////////////////////////////////////
// $<add> 2009-08-27 by Ken.Guo
//Added By Mark Lee 05/09/12	add condition about  'ai_ib_default_email' and  'ai_ib_owner' chooses
//////////////////////////////////////////////////////////////////////

long ll_contact_id,ll_cnt
long ll_record_id
long ll_contact_type
string ls_access,ls_contact_type
string 	ls_default_email,	ls_owner

gnv_appeondb.of_startqueue( )
	Select Top 1 contact_id,contact_type Into :ll_contact_id,:ll_contact_type From ctx_contacts Where user_d = :gs_user_id;
	Select top 1 access Into :ls_access From ctx_contract_contacts Where ctx_id = :al_ctx_id and contact_id = :ll_contact_id and ic_area = 'I';
gnv_appeondb.of_commitqueue( )

If isnull(ll_contact_id) Then Return 0

If sqlca.sqlcode = 0 Then
	If (ls_access <> 'F' or isnull(ls_access)) Then 
		Update ctx_contract_contacts set access = 'F' Where ctx_id = :al_ctx_id and contact_id = :ll_contact_id and ic_area = 'I';
		Return 0
	End If
	If ls_access = 'F' Then Return 1	
End IF

ll_record_id = gnv_app.of_get_id('RECORD_ID')
ls_contact_type = String(ll_contact_type)

//Begin - Added By Mark Lee 05/09/12
gnv_appeondb.of_startqueue( )
	If ai_ib_default_email  = 1 Then 
		ls_default_email = "Y"
		Update ctx_contract_contacts set default_email = 'N' Where ctx_id = :al_ctx_id  and ic_area = 'I' AND default_email = 'Y';
	Else
		ls_default_email = "N"
	End If 
	
	If ai_ib_owner  = 1 Then 
		ls_owner = "Y"
		Update ctx_contract_contacts set owner = 'N' Where ctx_id = :al_ctx_id  and ic_area = 'I' AND owner = 'Y';
	Else
		ls_owner = "N"
	End If 
gnv_appeondb.of_commitqueue( )
//End - Added By Mark Lee 05/09/12


//Added By Mark Lee 05/09/12
//Insert Into ctx_contract_contacts(
//	ctx_id,
//	contact_id,
//	ic_area,
//	default_email,
//	association,
//	owner,
//	Access,
//	record_id,
//	inserted_by_user,
//	inserted_at_date_time,
//	updated_by_user,
//	updated_at_date_time) 
//	Values(
//	:al_ctx_id,
//	:ll_contact_id,
//	'I',
//	'N',
//	:ls_contact_type,
//	'N',
//	'F',
//	:ll_record_id,
//	:gs_user_id,
//	getdate(),
//	:gs_user_id,
//	getdate()
//	) ;
Insert Into ctx_contract_contacts(
	ctx_id,
	contact_id,
	ic_area,
	default_email,
	association,
	owner,
	Access,
	record_id,
	inserted_by_user,
	inserted_at_date_time,
	updated_by_user,
	updated_at_date_time) 
	Values(
	:al_ctx_id,
	:ll_contact_id,
	'I',
	:ls_default_email,
	:ls_contact_type,
	:ls_owner,
	'F',
	:ll_record_id,
	:gs_user_id,
	getdate(),
	:gs_user_id,
	getdate()
	) ;
Commit;


Return 1
end function

public subroutine of_copy_company_contact_data (str_copy_ctx astr_copy_ctx, long ai_new_ctx_id);//====================================================================
// Function: of_copy_company_contact_data
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//                astr_copy_ctx
//                ai_new_ctx_id
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:	Mark Lee		Date: 11/20/2012
//--------------------------------------------------------------------
//	Copyright (c) 2008-2012 Contract Logix,Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
Long 		ll_record_id, ll_get_ctx_id , ll_tmp
Datetime		ldt_today
DataStore			lds_ctx_contract_contacts,	lds_ctx_contract_contacts_copy				//d_contract_det_contact_external		d_ctx_contract_contacts (need update all column. )
long					i,	ll_count, ll_row, ll_Rtn
 
datastore lds_dync_1  //Added by Harry 20170620 for Task 728

//If Not isnull(astr_copy_ctx.ai_ib_copy_m_company_contact) and astr_copy_ctx.ai_ib_copy_m_company_contact = 1 then
If Not isnull(astr_copy_ctx.ai_ib_copy_m_company_contact) and astr_copy_ctx.ai_ib_copy_m_company_contact = 1 and of_get_screen_exist(il_view, 7) Then //Modified by harry 20170622
	IF isvalid(gw_contract) then 
		ll_get_ctx_id = gw_contract.tab_contract_details.tabpage_search.il_ctx_id

		Select count(1)
		Into : ll_tmp
		From CTX_CONTRACT_CONTACTS
		Where CTX_CONTRACT_CONTACTS.ctx_id = :ai_new_ctx_id and  CTX_CONTRACT_CONTACTS.ic_area = 'E'
		and CTX_CONTRACT_CONTACTS.contact_id  in (Select contact_id From CTX_CONTRACT_CONTACTS
																	Where CTX_CONTRACT_CONTACTS.ctx_id = :ll_get_ctx_id 
																	and  CTX_CONTRACT_CONTACTS.ic_area = 'E') ;
		If isnull(ll_tmp) or ll_tmp = 0 then 																	
			ll_record_id = gnv_app.of_get_id('RECORD_ID')
			ldt_today = Datetime(today())
			
//			INSERT INTO CTX_CONTRACT_CONTACTS
//					  (ctx_id ,contact_id  ,ic_area ,association ,notes ,default_email ,record_id ,inserted_by_user ,inserted_at_date_time
//					  ,updated_by_user  ,updated_at_date_time ,owner ,access ,custom_n1  ,custom_n2 ,custom_n3,custom_percent_1
//					  ,custom_percent_2  ,custom_1 ,custom_2  ,custom_3)
//				Select :ai_new_ctx_id ,contact_id  ,ic_area ,association ,notes ,default_email ,record_id ,:gs_user_id ,:ldt_today
//					  ,:gs_user_id  ,:ldt_today ,owner ,access ,custom_n1  ,custom_n2 ,custom_n3,custom_percent_1
//					  ,custom_percent_2  ,custom_1 ,custom_2  ,custom_3
//				From CTX_CONTRACT_CONTACTS
//				WHere CTX_CONTRACT_CONTACTS.ctx_id = :ll_get_ctx_id
//					and CTX_CONTRACT_CONTACTS.ic_area = 'E' ;			
					
			lds_ctx_contract_contacts = Create DataStore
			lds_ctx_contract_contacts.DataObject = "d_ctx_contract_contacts_copy"
			lds_ctx_contract_contacts.SetTransObject(SQLCA)
			
			lds_ctx_contract_contacts_copy = Create DataStore
			lds_ctx_contract_contacts_copy.DataObject = "d_ctx_contract_contacts"			 
			lds_ctx_contract_contacts_copy.SetTransObject(SQLCA)
			
			lds_ctx_contract_contacts.retrieve(ll_get_ctx_id, 'E' )
			ll_count = lds_ctx_contract_contacts.rowcount()
			
			lds_dync_1 = Create datastore
			f_create_contract_ds (il_view, 7, lds_dync_1)  //Added by Harry 20170622
			
			for i =1 to ll_count
				ll_row = lds_ctx_contract_contacts_copy.insertrow(0)		
				lds_ctx_contract_contacts_copy.setitem(ll_row,'ctx_id',ai_new_ctx_id)		
				lds_ctx_contract_contacts_copy.setitem(ll_row,'contact_id',lds_ctx_contract_contacts.getitemNumber(i,'contact_id'))
				lds_ctx_contract_contacts_copy.setitem(ll_row,'ic_area','E')		
				lds_ctx_contract_contacts_copy.setitem(ll_row,'record_id',ll_record_id)		
				if of_check_unselect_fields(7,'ctx_contract_contacts','association') = true then of_set_value(lds_dync_1, 'association', lds_ctx_contract_contacts_copy, ll_row, lds_ctx_contract_contacts, i, 'C')	//Modified by harry 20170621      lds_ctx_contract_contacts_copy.setitem(ll_row,'association',lds_ctx_contract_contacts.getitemstring(i,'association'))
				if of_check_unselect_fields(7,'ctx_contract_contacts','default_email') = true then of_set_value(lds_dync_1, 'default_email', lds_ctx_contract_contacts_copy, ll_row, lds_ctx_contract_contacts, i, 'C')	//Modified by harry 20170621      lds_ctx_contract_contacts_copy.setitem(ll_row,'default_email',lds_ctx_contract_contacts.getitemstring(i,'default_email'))
				if of_check_unselect_fields(7,'ctx_contract_contacts','owner') = true then of_set_value(lds_dync_1, 'owner', lds_ctx_contract_contacts_copy, ll_row, lds_ctx_contract_contacts, i, 'C')	//Modified by harry 20170621      lds_ctx_contract_contacts_copy.setitem(ll_row,'owner',lds_ctx_contract_contacts.getitemstring(i,'owner'))		
				if of_check_unselect_fields(7,'ctx_contract_contacts','access') = true then of_set_value(lds_dync_1, 'access', lds_ctx_contract_contacts_copy, ll_row, lds_ctx_contract_contacts, i, 'C')	//Modified by harry 20170621      lds_ctx_contract_contacts_copy.setitem(ll_row,'access',lds_ctx_contract_contacts.getitemstring(i,'access'))
				if of_check_unselect_fields(7,'ctx_contract_contacts','notes') = true then of_set_value(lds_dync_1, 'notes', lds_ctx_contract_contacts_copy, ll_row, lds_ctx_contract_contacts, i, 'C')	//Modified by harry 20170621      lds_ctx_contract_contacts_copy.setitem(ll_row,'notes',lds_ctx_contract_contacts.getitemstring(i,'notes'))				 			
				if of_check_unselect_fields(7,'ctx_contract_contacts','inserted_by_user') = true then lds_ctx_contract_contacts_copy.setitem(ll_row,'inserted_by_user',gs_user_id)				
				if of_check_unselect_fields(7,'ctx_contract_contacts','inserted_at_date_time') = true then lds_ctx_contract_contacts_copy.setitem(ll_row,'inserted_at_date_time',ldt_today)				
				if of_check_unselect_fields(7,'ctx_contract_contacts','updated_by_user') = true then lds_ctx_contract_contacts_copy.setitem(ll_row,'updated_by_user',gs_user_id)				
				if of_check_unselect_fields(7,'ctx_contract_contacts','updated_at_date_time') = true then lds_ctx_contract_contacts_copy.setitem(ll_row,'updated_at_date_time',ldt_today)				

				if of_check_unselect_fields(7,'ctx_contract_contacts','custom_n1') = true then of_set_value(lds_dync_1, 'custom_n1', lds_ctx_contract_contacts_copy, ll_row, lds_ctx_contract_contacts, i, 'DEC')	//Modified by harry 20170621      lds_ctx_contract_contacts_copy.setitem(ll_row,'custom_n1',lds_ctx_contract_contacts.getitemDecimal(i,'custom_n1'))				 			
				if of_check_unselect_fields(7,'ctx_contract_contacts','custom_n2') = true then of_set_value(lds_dync_1, 'custom_n2', lds_ctx_contract_contacts_copy, ll_row, lds_ctx_contract_contacts, i, 'DEC')	//Modified by harry 20170621      lds_ctx_contract_contacts_copy.setitem(ll_row,'custom_n2',lds_ctx_contract_contacts.getitemDecimal(i,'custom_n2'))				 			
				if of_check_unselect_fields(7,'ctx_contract_contacts','custom_n3') = true then of_set_value(lds_dync_1, 'custom_n3', lds_ctx_contract_contacts_copy, ll_row, lds_ctx_contract_contacts, i, 'DEC')	//Modified by harry 20170621      lds_ctx_contract_contacts_copy.setitem(ll_row,'custom_n3',lds_ctx_contract_contacts.getitemDecimal(i,'custom_n3'))				 			
				if of_check_unselect_fields(7,'ctx_contract_contacts','custom_percent_1') = true then of_set_value(lds_dync_1, 'custom_percent_1', lds_ctx_contract_contacts_copy, ll_row, lds_ctx_contract_contacts, i, 'DEC')	//Modified by harry 20170621      lds_ctx_contract_contacts_copy.setitem(ll_row,'custom_percent_1',lds_ctx_contract_contacts.getitemDecimal(i,'custom_percent_1'))				 			
				if of_check_unselect_fields(7,'ctx_contract_contacts','custom_percent_2') = true then of_set_value(lds_dync_1, 'custom_percent_2', lds_ctx_contract_contacts_copy, ll_row, lds_ctx_contract_contacts, i, 'DEC')	//Modified by harry 20170621      lds_ctx_contract_contacts_copy.setitem(ll_row,'custom_percent_2',lds_ctx_contract_contacts.getitemDecimal(i,'custom_percent_2'))				 														
				if of_check_unselect_fields(7,'ctx_contract_contacts','custom_1') = true then of_set_value(lds_dync_1, 'custom_1', lds_ctx_contract_contacts_copy, ll_row, lds_ctx_contract_contacts, i, 'C')	//Modified by harry 20170621      lds_ctx_contract_contacts_copy.setitem(ll_row,'custom_1',lds_ctx_contract_contacts.getitemstring(i,'custom_1'))				 			
				if of_check_unselect_fields(7,'ctx_contract_contacts','custom_2') = true then of_set_value(lds_dync_1, 'custom_2', lds_ctx_contract_contacts_copy, ll_row, lds_ctx_contract_contacts, i, 'C')	//Modified by harry 20170621      lds_ctx_contract_contacts_copy.setitem(ll_row,'custom_2',lds_ctx_contract_contacts.getitemstring(i,'custom_2'))
				if of_check_unselect_fields(7,'ctx_contract_contacts','custom_3') = true then of_set_value(lds_dync_1, 'custom_3', lds_ctx_contract_contacts_copy, ll_row, lds_ctx_contract_contacts, i, 'C')	//Modified by harry 20170621      lds_ctx_contract_contacts_copy.setitem(ll_row,'custom_3',lds_ctx_contract_contacts.getitemstring(i,'custom_3'))
				
				if of_check_unselect_fields(7,'ctx_contract_contacts','association2') = true then of_set_value(lds_dync_1, 'association2', lds_ctx_contract_contacts_copy, ll_row, lds_ctx_contract_contacts, i, 'C')	//Modified by harry 20170621      lds_ctx_contract_contacts_copy.setitem(ll_row,'association2',lds_ctx_contract_contacts.getitemstring(i,'association2'))
				if of_check_unselect_fields(7,'ctx_contract_contacts','association3') = true then of_set_value(lds_dync_1, 'association3', lds_ctx_contract_contacts_copy, ll_row, lds_ctx_contract_contacts, i, 'C')	//Modified by harry 20170621      lds_ctx_contract_contacts_copy.setitem(ll_row,'association3',lds_ctx_contract_contacts.getitemstring(i,'association3'))
				if of_check_unselect_fields(7,'ctx_contract_contacts','association4') = true then of_set_value(lds_dync_1, 'association4', lds_ctx_contract_contacts_copy, ll_row, lds_ctx_contract_contacts, i, 'C')	//Modified by harry 20170621      lds_ctx_contract_contacts_copy.setitem(ll_row,'association4',lds_ctx_contract_contacts.getitemstring(i,'association4'))
				if of_check_unselect_fields(7,'ctx_contract_contacts','association5') = true then of_set_value(lds_dync_1, 'association5', lds_ctx_contract_contacts_copy, ll_row, lds_ctx_contract_contacts, i, 'C')	//Modified by harry 20170621      lds_ctx_contract_contacts_copy.setitem(ll_row,'association5',lds_ctx_contract_contacts.getitemstring(i,'association5'))				
				if of_check_unselect_fields(7,'ctx_contract_contacts','association6') = true then of_set_value(lds_dync_1, 'association6', lds_ctx_contract_contacts_copy, ll_row, lds_ctx_contract_contacts, i, 'C')	//Modified by harry 20170621      lds_ctx_contract_contacts_copy.setitem(ll_row,'association6',lds_ctx_contract_contacts.getitemstring(i,'association6'))
				if of_check_unselect_fields(7,'ctx_contract_contacts','association7') = true then of_set_value(lds_dync_1, 'association7', lds_ctx_contract_contacts_copy, ll_row, lds_ctx_contract_contacts, i, 'C')	//Modified by harry 20170621      lds_ctx_contract_contacts_copy.setitem(ll_row,'association7',lds_ctx_contract_contacts.getitemstring(i,'association7'))
				if of_check_unselect_fields(7,'ctx_contract_contacts','association8') = true then of_set_value(lds_dync_1, 'association8', lds_ctx_contract_contacts_copy, ll_row, lds_ctx_contract_contacts, i, 'C')	//Modified by harry 20170621      lds_ctx_contract_contacts_copy.setitem(ll_row,'association8',lds_ctx_contract_contacts.getitemstring(i,'association8'))
				if of_check_unselect_fields(7,'ctx_contract_contacts','association9') = true then of_set_value(lds_dync_1, 'association9', lds_ctx_contract_contacts_copy, ll_row, lds_ctx_contract_contacts, i, 'C')	//Modified by harry 20170621      lds_ctx_contract_contacts_copy.setitem(ll_row,'association9',lds_ctx_contract_contacts.getitemstring(i,'association9'))
				if of_check_unselect_fields(7,'ctx_contract_contacts','association10') = true then of_set_value(lds_dync_1, 'association10', lds_ctx_contract_contacts_copy, ll_row, lds_ctx_contract_contacts, i, 'C')	//Modified by harry 20170621      lds_ctx_contract_contacts_copy.setitem(ll_row,'association10',lds_ctx_contract_contacts.getitemstring(i,'association10'))
							
			next 
			
			if lds_ctx_contract_contacts_copy.rowcount( ) >0 then 
				ll_Rtn = lds_ctx_contract_contacts_copy.Update()
				if ll_Rtn = 1 then
					COMMIT USING SQLCA;
				else
					ROLLBACK USING SQLCA;
				end if
			end if 
			
			if isvalid(lds_ctx_contract_contacts) then destroy lds_ctx_contract_contacts 
			if isvalid(lds_ctx_contract_contacts_copy) then destroy lds_ctx_contract_contacts_copy 	
			if isvalid(lds_dync_1) then destroy lds_dync_1 		
		End If					
	End If	
End If
end subroutine

public function long of_copy_ctx_from_template (long al_template_id, string as_come_from);Long ll_new_ctx_id, ll_getrow,ll_app_facility
str_copy_ctx lstr_copy_ctx
n_cst_copy_ctx lnv_copy_ctx 
lnv_copy_ctx = Create n_cst_copy_ctx

//Added By Mark Lee 05/09/12	add column ib_create_child , ib_copy_m_company ,ib_copy_m_company_contact
//Added By Mark Lee 05/09/12	add column ib_owner and ib_default_email 
//Get template info
Select 
	ctx_id, 
	ib_contract_detail ,
	ib_contract_dates ,
	ib_custom_data,
	ib_notes ,
	ib_contract_contacts ,
	ib_group_access ,
	ib_products ,
	ib_our_contacts ,
	ib_requirements,
	ib_other_contacts ,
	ib_locations ,
	ib_organizations ,
	ib_fee_schedule ,
	ib_document_manager ,
	ib_action_items,
	located_tab_index,
	clear_company,
	add_contact,
	trigger_workflow,
	ib_default_email,
	ib_owner,
	ib_custom_data2,
	ib_custom_multi,
	ib_create_child,
	ib_copy_m_company,
	ib_copy_m_company_contact
into 
	:lstr_copy_ctx.sl_ctx_id,
	:lstr_copy_ctx.sb_contract_detail,
	:lstr_copy_ctx.sb_contract_dates,
	:lstr_copy_ctx.sb_custom_data,
	:lstr_copy_ctx.sb_notes,
	:lstr_copy_ctx.sb_contracted_contacts,
	:lstr_copy_ctx.sb_group_access,
	:lstr_copy_ctx.sb_products,
	:lstr_copy_ctx.sb_our_contacts,
	:lstr_copy_ctx.sb_requirements,
	:lstr_copy_ctx.sb_other_contacts,
	:lstr_copy_ctx.sb_locations,
	:lstr_copy_ctx.sb_organizations,
	:lstr_copy_ctx.sb_fee_schedule,
	:lstr_copy_ctx.sb_document_manager,
	:lstr_copy_ctx.sb_action_items,
	:lstr_copy_ctx.si_located_tab,
	:lstr_copy_ctx.si_clear_company,
	:lstr_copy_ctx.si_add_contact,
	:lstr_copy_ctx.sl_workflow,
	:lstr_copy_ctx.ai_ib_default_email,
	:lstr_copy_ctx.ai_ib_owner,
	:lstr_copy_ctx.sb_custom_data2,
	:lstr_copy_ctx.sb_custom_multi,
	:lstr_copy_ctx.ai_ib_create_child,
	:lstr_copy_ctx.ai_ib_copy_m_company,
	:lstr_copy_ctx.ai_ib_copy_m_company_contact
From ctx_templates_info
Where id = :al_template_id;

If sqlca.sqlcode <> 0 Then 
	Messagebox('Error','Failed to get the template information, please call support.')
	If isvalid(lnv_copy_ctx) Then Destroy(lnv_copy_ctx)
	Return -2
End If

If lstr_copy_ctx.sb_contract_detail  = 1 Then
	//added by gavins 20140211
	n_cst_contract   ln_cst_contract
	datawindow		ldw_null
	datastore		lds_detail
	Long				ll_double_ctxid
	
	ln_cst_contract = create n_cst_contract
	lds_detail = Create datastore
	lds_detail.dataobject = 'd_contract_det_master'
	lds_detail.settransobject(sqlca)
	lds_detail.Retrieve( lstr_copy_ctx.sl_ctx_id )
	
	//Added By Ken.Guo 07/08/2014
	If lstr_copy_ctx.si_clear_company = 1 Then //if cleared company data
		setnull(ll_app_facility)
		lds_detail.setitem(1,'app_facility', ll_app_facility)
	End If
	If lstr_copy_ctx.ai_ib_copy_m_company = 1 Then //if used current company
		If isvalid(gw_contract) Then 
			ll_getrow = gw_contract.tab_contract_details.tabpage_search.dw_search_det1.getselectedrow(0)
			If ll_getrow > 0 then 
				ll_app_facility 	= gw_contract.tab_contract_details.tabpage_search.dw_search_det1.GetItemNumber(ll_getrow,"app_facility")
				lds_detail.setitem(1,'app_facility', ll_app_facility)
			End If
		End If	
	End If
	
	ll_double_ctxid =  ln_cst_contract.of_checkdoublecontract( "template",ldw_null,lstr_copy_ctx.sl_ctx_id , lds_detail  )
	If ll_double_ctxid > 0 Then Return -100
End IF

//Added By Mark Lee 11/28/2013
if isnull(as_come_from) or trim(as_come_from) = '' then 
	lstr_copy_ctx.as_come_from = 'template('+string(lstr_copy_ctx.sl_ctx_id)+')'
else
	lstr_copy_ctx.as_come_from = as_come_from+'('+string(lstr_copy_ctx.sl_ctx_id)+')-new'
end if 

//Create New CTX from Template.
ll_new_ctx_id = lnv_copy_ctx.of_copy_ctx_data(lstr_copy_ctx)

Return ll_new_ctx_id
end function

public function integer of_create_action_item_by_workflow ();//Added By Mark Lee 04/17/2015
n_cst_workflow_triggers lnv_workflow
integer li_return

lnv_workflow = create n_cst_workflow_triggers
li_return = lnv_workflow.of_trigger_for_ctx( il_ctx_id, il_category , il_status )
destroy lnv_workflow

return  li_return

////--------------------------- APPEON BEGIN ---------------------------
////$<add> 11.16.2006 By: Jervis
////$<reason> Trigger Work flow when new Contract Logix Contract Tracking
//long ll_ctx_id,ll_status_id,ll_category
//n_cst_workflow_triggers lnv_workflow
//str_action_item lstr_action
//
//If not gb_workflow Then return 0
////--------------------------- APPEON BEGIN ---------------------------
////$<add> 04.30.2007 By: Jack
////$<reason> Fix a defect.
//If il_rowcount < 1 then Return 0
////---------------------------- APPEON END ----------------------------
//
//
//Long i
//String ls_wf_id
//n_ds lds_data_workflow
//lds_data_workflow = Create n_ds
//lds_data_workflow.dataobject = 'd_g_workflow_data'
//lds_data_workflow.settransobject(SQLCA)
//ll_status_id = il_status
//gnv_data.of_retrieve("wf_workflow") 
//
////Added By Ken.Guo 12/24/2012
//gnv_data.of_get_data_from_cache( 'wf_workflow', "wf_module = '03' and wf_triggered_by = '002' and (IsNull(wf_triggered_ctx_status) or wf_triggered_ctx_status = 'all' or Pos(wf_triggered_ctx_status , '" + String(ll_status_id) + "' ) > 0  ) and " + &
//											"  wf_status = 'A' ", lds_data_workflow )
//
//ll_category = il_category
//lstr_action.wf_id = long(gnv_data.of_getitem("code_lookup","custom_5","lookup_code =" + string(ll_category)))
//If lds_data_workflow.Find('wf_id = ' + String(lstr_action.wf_id), 1, lds_data_workflow.RowCount() ) > 0 Then	
//	lnv_workflow = create n_cst_workflow_triggers
//	lstr_action.ctx_id =  il_ctx_id
//	lnv_workflow.of_workflow_create_action_items(lstr_action)
//	destroy lnv_workflow
//end if
////---------------------------- APPEON END ----------------------------
//
//If isvalid(lds_data_workflow) Then Destroy lds_data_workflow
//
//return 1
end function

public function boolean of_check_unselect_fields (long al_screen_id, string as_table, string as_column);//====================================================================
// Function: of_check_unselect_fields
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value    long      al_screen_id
// 	value    string    as_table
// 	value    string    as_column
//--------------------------------------------------------------------
// Returns:  boolean
//--------------------------------------------------------------------
// Author:	Mark Lee		Date: 06/10/2015
//--------------------------------------------------------------------
//	Copyright (c) 2008-2015 Contractlogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

boolean 				lbn_return = true 
long					ll_find
string					ls_filter, ls_select

if ibn_filter = false then return lbn_return
if isnull(as_column) or trim(as_column) = "" then return lbn_return
if isnull(as_table) or trim(as_table) = "" then return lbn_return

if isnull(al_screen_id) or al_screen_id = 0 then 
	ls_filter  = " table_name='"+ lower(as_table)+"' and field_name='"+lower(as_column)+"' "
else
	ls_filter  = " screen_id ="+string(al_screen_id) +" and table_name='"+ lower(as_table)+"' and field_name='"+lower(as_column)+"' "
end if 
ll_find = ids_filter.find( ls_filter, 1, ids_filter.rowcount() )
if not isnull(ll_find) and ll_find > 0 then 
	ls_select = ids_filter.getItemstring(ll_find, "is_select")
	//unselect
	if not isnull(ls_select) and ls_select = '0' then 
		lbn_return = false 
	end if 
end if 

return lbn_return
end function

public function boolean of_unuser_columns (string as_table, string as_column, string as_sub);boolean			lbn_return =false 


if isnull(as_table) or trim(as_table) = "" or isnull(as_column) or trim(as_column) = ""  then 
	return lbn_return 
end if 

if lower(as_table) = 'ctx_action_items' and (as_column = 'ctx_action_item_id' or as_column = 'ctx_id'  ) then 
	lbn_return = true
end if 
if lower(as_table) = 'ctx_am_action_item' and (as_column = lower('Seq_ID') or as_column = lower('Doc_ID')  ) then 
	lbn_return = true
end if 
if lower(as_table) = lower('ctx_am_document') and (as_column = lower('Doc_id') or as_column = lower('ctx_id')  ) then 
	lbn_return = true
end if
if lower(as_table) = lower('ctx_basic_info') and ( as_column = lower('ctx_id')  ) then 
	lbn_return = true
end if

if not isnull(as_sub) and as_sub= 'sub' then 			//Added By Mark Lee 06/30/2015
	if lower(as_table) = lower('ctx_basic_info') and ( as_column = lower('master_contract_id') or as_column = lower('master_contract_name') ) then 
		lbn_return = true
	end if
end if 

if lower(as_table) = lower('ctx_contacts') and ( as_column = lower('contact_id')  ) then 
	lbn_return = true
end if
if lower(as_table) = lower('ctx_contacts_numbers') and (as_column = lower('contact_num_id') or as_column = lower('contact_id')  ) then 
	lbn_return = true
end if
if lower(as_table) = lower('ctx_contract_contacts') and (as_column = lower('contact_id') or as_column = lower('ctx_id') or as_column = lower('ic_area')  ) then 
	lbn_return = true
end if
if lower(as_table) = lower('ctx_custom') and ( as_column = lower('ctx_id')  ) then 
	lbn_return = true
end if
if lower(as_table) = lower('ctx_custom_multi_detail') and (as_column = lower('ctx_id') or as_column = lower('hdr_id') or as_column = lower('detail_id') or as_column = lower('id_forcatalog') ) then 
	lbn_return = true
end if
if lower(as_table) = lower('ctx_custom_multi_hdr') and (as_column = lower('hdr_id') or as_column = lower('ctx_id') or as_column = lower('id_forcatalog')  ) then 
	lbn_return = true
end if
if lower(as_table) = lower('ctx_elements') and (as_column = lower('ctx_elements_id') or as_column = lower('CTX_REQ_PROFILE_HDR_id') or as_column = lower('ctx_req_tmplt_element_id')  ) then 
	lbn_return = true
end if
if lower(as_table) = lower('ctx_fee_sched_data') and (as_column = lower('fee_sched_data_id') or as_column = lower('fee_sched_location_id')  ) then 
	lbn_return = true
end if
if lower(as_table) = lower('ctx_fee_sched_hdr') and (as_column = lower('fee_sched_id') or as_column = lower('ctx_id')  ) then 
	lbn_return = true
end if
if lower(as_table) = lower('ctx_fee_sched_locations') and (as_column = lower('fee_sched_id') or as_column = lower('fee_sched_location_id') or as_column = "record_id" ) then 
	lbn_return = true
end if
if lower(as_table) = lower('ctx_fee_sched_nm') and (as_column = lower('fee_sched_nm_id') or as_column = lower('ctx_id')  ) then 
	lbn_return = true
end if
if lower(as_table) = lower('ctx_fee_sched_pracs') and (as_column = lower('fee_sched_id') or as_column = lower('practitioner_id') or lower(as_column) = "record_id" ) then 
	lbn_return = true
end if
if lower(as_table) = lower('ctx_group_access') and (as_column = lower('ctx_id') or as_column = lower('group_id')  ) then 
	lbn_return = true
end if
if lower(as_table) = lower('ctx_loc') and (as_column = lower('ctx_id') or as_column = lower('parent_comp_id') or as_column = lower('loc_id') or lower(as_column) = "record_id"  ) then 
	lbn_return = true
end if
if lower(as_table) = lower('ctx_location_pracs') and (as_column = lower('ctx_id') or as_column = lower('parent_comp_id') &
	or as_column = lower('loc_id') or as_column = lower('gp_rec_id') or as_column = lower('prac_id')  ) then 
	lbn_return = true
end if
if lower(as_table) = lower('ctx_location_specialty') and (as_column = lower('ctx_id') or as_column = lower('parent_comp_id') &
	or as_column = lower('loc_id') or as_column = lower('prac_specialty')  ) then 
	lbn_return = true
end if
if lower(as_table) = lower('ctx_org_contact') and (as_column = lower('org_contact_id') or as_column = lower('org_id')  ) then 
	lbn_return = true
end if
if lower(as_table) = lower('ctx_orgs') and ( as_column = lower('org_id')  ) then 
	lbn_return = true
end if
if lower(as_table) = lower('ctx_orgs_contact') and (as_column = lower('ctx_id') or as_column = lower('org_id') or as_column = lower('area')  ) then 
	lbn_return = true
end if
if lower(as_table) = lower('ctx_products') and ( as_column = lower('ctx_id') or as_column = lower('product_id') or as_column = lower('product_type')   ) then 		//product_id\ product_type
	lbn_return = true
end if
if lower(as_table) = lower('ctx_report_profile_det') and (as_column = lower('ctx_rpt_prfl_det_id') or as_column = lower('ctx_rpt_prfl_id')  ) then 
	lbn_return = true
end if
if lower(as_table) = lower('ctx_report_profile_hdr') and ( as_column = lower('ctx_rpt_prfl_id')  ) then 
	lbn_return = true
end if
if lower(as_table) = lower('ctx_req_profile_hdr') and (as_column = lower('ctx_id') or as_column = lower('cTX_REQ_PROFILE_HDR_id') or as_column = lower('ctx_req_profile_id') or as_column = lower('record_id')  ) then 
	lbn_return = true
end if
//Added By Jay Chen 07-03-2015
if lower(as_table) = 'ctx_group_access' and lower(as_column) = 'access'  then 
	lbn_return = true
end if
if lower(as_table) = 'ctx_basic_info' and (lower(as_column) = 'category' or lower(as_column)= 'record_id' or lower(as_column)= 'status' or lower(as_column)= 'contract_type' or lower(as_column)= 'product_type' or lower(as_column)= 'term_reason' or lower(as_column)= 'oc_title' or lower(as_column)= 'oc_department') then 
	lbn_return = true
end if
if lower(as_table) = 'ctx_action_items' and (lower(as_column) = 'action_type' or lower(as_column) = 'action_status') then 
	lbn_return = true
end if 
if lower(as_table) = 'ctx_am_action_item' and (lower(as_column) = 'letter_id' or lower(as_column) = 'wf_id' or lower(as_column) = 'action_type') then 
	lbn_return = true
end if 
if lower(as_table) = 'ctx_am_document' and (lower(as_column) = 'doc_name' or lower(as_column) = 'doc_type' or lower(as_column) = 'category' or lower(as_column) = 'status') then 
	lbn_return = true
end if
if lower(as_table) = 'ctx_contacts' and (lower(as_column) = 'contact_type' or lower(as_column) = 'user_d' or lower(as_column) = 'facility_id' or lower(as_column) = 'first_name' or lower(as_column) = 'last_name') then 
	lbn_return = true
end if
if lower(as_table) = 'ctx_contacts_numbers' and (lower(as_column) = 'via' or lower(as_column) = 'record_id' ) then 
	lbn_return = true
end if
if lower(as_table) = 'ctx_elements' and lower(as_column) = 'record_id' then 
	lbn_return = true
end if
if lower(as_table) = 'ctx_fee_sched_data' and (lower(as_column) = 'code' or lower(as_column) = 'phys_fee' or lower(as_column) = 'record_id') then 
	lbn_return = true
end if
if lower(as_table) = 'ctx_fee_sched_hdr' and (lower(as_column) = 'sched_type' or lower(as_column) = 'carve_out_type' or lower(as_column) = 'record_id') then 
	lbn_return = true
end if
if lower(as_table) = 'ctx_org_contact' and (lower(as_column) = 'via' or lower(as_column) = 'record_id') then 
	lbn_return = true
end if
if lower(as_table) = 'ctx_orgs' and (lower(as_column) = 'org_type' or lower(as_column) = 'status' or lower(as_column) = 'state' or lower(as_column) = 'record_id') then 
	lbn_return = true
end if
//end 

return lbn_return
end function

public subroutine of_get_filter_ds (datawindow as_dw);//====================================================================
// Function: of_get_filter_ds
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value    datawindow    as_dw
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:	Mark Lee		Date: 06/10/2015
//--------------------------------------------------------------------
//	Copyright (c) 2008-2015 Contractlogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

if not isvalid(as_dw) then return 

if not isvalid(ids_filter) then ids_filter = create n_ds

ids_filter.dataobject = as_dw.dataobject 
ids_filter.Settransobject( sqlca)
ids_filter.reset( )

if as_dw.rowcount() > 0 then 
	as_dw.rowscopy(1, as_dw.rowcount(), Primary!,ids_filter, 1 ,Primary!)		  
end if 


if ids_filter.rowcount( )  > 0 then 
	ibn_filter = true
else 
	ibn_filter = false
end if 

end subroutine

public function integer of_generate_select_screen_fields (long al_view_id, string as_screen, datawindow adw, string as_sub, boolean abn_exists);//====================================================================
// Function: of_generate_select_screen_fields
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value    long          al_view_id
// 	value    string        as_screen
// 	value    datawindow    adw
// 	value    string        as_sub
// 	value    boolean       abn_exists
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	Mark Lee		Date: 07/13/2015
//--------------------------------------------------------------------
//	Copyright (c) 2008-2015 Contractlogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

long			ll_arr_screen[], i , ll_cnt, ll_screen_id, ll_rowcount, ll_object, j , ll_find
u_dw 			ldw[]
string 		ls_dataobject, ls_table_name, ls_view, ls_dataobjects[], ls_dw_name, ls_arr_dw_name[], ls_screen
u_dw			ldw_screen 
long			ll_cols, ll_insertrow
string			ls_colname, ls_type, ls_dbname, ls_label, ls_DataType, ls_DataTypeTemp, ls_screen_name, ls_tab_name
Datastore			ldw_screen_select

if isnull(as_screen) or trim(as_screen) = '' then return 0

gnv_string.of_parsetoarray( as_screen, ',', ll_arr_screen)
ll_cnt = Upperbound(ll_arr_screen)

ldw_screen_select = Create Datastore
ldw_screen_select.dataobject = "d_ctx_screen_for_copy_ctx"
ldw_screen_select.Settransobject( sqlca)
ll_rowcount	=ldw_screen_select.retrieve(al_view_id, ll_arr_screen)
ll_rowcount = ldw_screen_select.rowcount( )

If isvalid(w_hide) Then
	Close(w_hide)
End If
Open(w_hide)
	
for i = 1 to ll_rowcount
	ls_dataobject  =  ldw_screen_select.GetItemString(i, 'dataobject') 
	ls_table_name = lower(ldw_screen_select.GetItemString(i,'table_name'))
	ll_screen_id = 	ldw_screen_select.GetItemNumber(i,'screen_id')					 
	ls_screen_name =  ldw_screen_select.GetItemString(i, 'screen_name') 
	ls_dw_name = ldw_screen_select.GetItemString(i,'dw_name')
	ls_tab_name = ldw_screen_select.GetItemString(i,'tab_name')
	
//	if abn_exists  = false and adw.rowcount() > 0  then 				//Added By Mark Lee 07/13/2015
//		ll_find =  0
//		ll_find = adw.find(" screen_id="+string(ll_screen_id)+" and table_name='"+ls_table_name+"' ",1, adw.rowcount())
//		if not isnull(ll_find) and ll_find > 0 then 
//			continue																//if exists the record then the data can't add it.
//		end if 
//	end if 
	
	IF ls_dataobject = 'd_contract_det_contact_external' Then
		If not isvalid(ldw_screen ) then 
			ldw_screen = Create u_dw					
		End if 
		ldw_screen.dataobject = ls_dataobject
		ldw_screen.Settransobject( sqlca)
	Else
		ldw_screen =	w_hide.dw_1
		ldw[1] = ldw_screen
		ls_arr_dw_name[1] 	= ls_dw_name
		ls_dataobjects[1] 	= ls_dataobject

		f_create_contract_dw(al_view_id,ls_tab_name,ldw,ls_arr_dw_name,ls_dataobjects)				//create the dw screen		
	End If
	
	//add fields 
	ll_cols = long(ldw_screen.Describe("Datawindow.Column.Count"))
	for j = 1 to ll_cols 
		if string(ldw_screen.Describe("#"+string(j)+".Visible") ) = '0' then
			continue 
		end if 
		ls_colname = lower(string(ldw_screen.Describe("#"+string(j)+".name") ))
		ls_type = lower(string(ldw_screen.Describe(ls_colname+".type") ) )
		if ls_type <> "column" then continue
		
		ls_dbname = lower( ldw_screen.Describe("#"+string( j ) + ".dbname") )
		if pos(ls_dbname,".") > 0 then
			ls_dbname = f_get_token( ls_dbname, '.' )
		end if
		//To clear the other table's column in the datawindow. 
		if ls_table_name <> lower(ls_dbname) then continue
		
		if adw.rowcount() > 0  then 													//Added By Mark Lee 08/18/2015
			ll_find =  0
			ll_find = adw.find(" screen_id="+string(ll_screen_id)+" and table_name='"+ls_table_name+"' and field_name='"+ls_colname+"' ",1, adw.rowcount())
			if not isnull(ll_find) and ll_find > 0 then 
				continue																//if exists the record then the data can't add it.
			end if 
		end if 
		
		ls_label = ldw_screen.Describe( ls_colname + "_t.text")
		if ls_label = "?" or ls_label = "!" then ls_label = ""
		if ls_label = '' then ls_label = ls_dbname
				
		ls_DataType = ''
		ls_DataTypeTemp = lower( ldw_screen.Describe("#"+string( j ) + ".ColType") )
		choose case left(ls_DataTypeTemp,5)
			case 'char('
				ls_DataType = 'S'
			case 'date','datet'
				ls_DataType = 'D'
			case 'decim','int','long','number','real','ulong'
				ls_DataType = 'N'
		end choose
		
		if of_unuser_columns(ls_table_name,ls_colname, as_sub) = true then continue
			
		ll_insertrow = adw.insertrow( 0)				
		adw.setitem( ll_insertrow, "field_name", ls_colname )
		adw.setitem( ll_insertrow, "field_name_alias", ls_label )
		adw.setitem( ll_insertrow, "field_datatype", ls_DataType )
		adw.setitem( ll_insertrow, "field_screen", ls_screen_name )	
		adw.setitem( ll_insertrow, "is_select", '1' )	
		adw.setitem( ll_insertrow, "table_name", ls_table_name )
		adw.setitem( ll_insertrow, "screen_id", ll_screen_id )	
		
	next 	
next 

If isvalid(w_hide) Then
	Close(w_hide)
End If
if isvalid(ldw_screen) then destroy ldw_screen
if isvalid(ldw_screen_select) then destroy ldw_screen_select

return 1 
end function

public function boolean of_get_visible (datastore ads_table, string as_field);//====================================================================
// Function: of_get_visible()
//--------------------------------------------------------------------
// Description: Get the visible property from ads_table
//--------------------------------------------------------------------
// Arguments:    	 	       	
// 	value		datastore	ads_table	
// 	value	string     	as_field     
//--------------------------------------------------------------------
// Returns:  Boolean
//--------------------------------------------------------------------
// Author:	Harry		Date: 20170620
//--------------------------------------------------------------------
// Modify History:
//====================================================================
Boolean lb_ret
String ls_visible

If not Isvalid(ads_table) or isnull(as_field) or as_field = "" Then Return False

ls_visible = ads_table.Describe(as_field + ".visible")

If ls_visible = '?' or ls_visible = '!' Then ls_visible = '0'

If ls_visible = '0' Then
	lb_ret = False
Else
	lb_ret =  True
End If


Return lb_ret
end function

public function boolean of_get_screen_exist (long al_view_id, long al_screen_id);//====================================================================
// Function: of_get_screen_exist()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments:    	 
// 	value		long	     	al_view_id     
// 	value		long	     	al_screen_id  
//--------------------------------------------------------------------
// Returns:  Boolean
//--------------------------------------------------------------------
// Author:	Harry		Date: 20170622
//--------------------------------------------------------------------
// Modify History:
//====================================================================
Long li_count
If Not Isvalid(ids_screen) Then 
	ids_screen = Create n_ds
	ids_screen.DataObject = 'ds_contract_data_view_screens_list'
	ids_screen.SetTransObject(SQLCA)
	ids_screen.Retrieve(al_view_id)
End If

li_count = ids_screen.Find("screen_id=" + String(al_screen_id), 1 , ids_screen.RowCount())
	
//SELECT count(*) INTO :li_count FROM ctx_screen WHERE data_view_id = :al_view_id and screen_id = :al_screen_id;

If Isnull (li_count) Then li_count = 0

If li_count > 0 Then
	Return True
Else
	Return False
End If
end function

protected subroutine of_set_value (datastore ads_dync, string as_col_name, ref datastore ads_ins, long al_ins_row, datastore ads_data, long al_data_row, string as_type);//====================================================================
// Function: of_set_value()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments:    	 
//	value		datastore	ads_dync
//	value		string     		as_col_name
// 	ref			datastore	ads_ins	
// 	value		long	     	al_ins_row     
// 	value		datastore	ads_data	
// 	value		long	     	al_data_row  
// value		string     		as_type
//--------------------------------------------------------------------
// Returns:  None
//--------------------------------------------------------------------
// Author:	Harry		Date: 20170621
//--------------------------------------------------------------------
// Modify History:
//====================================================================

of_set_value(ads_dync, as_col_name, ads_ins, al_ins_row, ads_data, al_data_row, as_type, 0, 0 ) //Modified by Harry 20170630
/*
String ls_initial
String ls_char_value
Date ld_date_value
DateTime ldt_dt_value
Decimal ld_dec_value
Long ll_long_value
Time lt_time_value

ls_initial = ads_dync.Describe(as_col_name + ".Initial")

If ls_initial = "!" Or ls_initial = "?" Or ls_initial = "" Or Lower(ls_initial) = "null" Or isnull(ls_initial) Then ls_initial = ""

CHOOSE CASE as_type
	CASE "C"		//  CHARACTER DATATYPE
		ls_char_value = ads_data.GetItemString(al_data_row, as_col_name)
		If IsNull(ls_char_value) And Len(ls_initial) > 0 Then
			if as_col_name = 'ctx_contract_contacts_owner' then as_col_name = 'owner'
			ads_ins.SetItem(al_ins_row, as_col_name, ls_initial)
		Else
			if as_col_name = 'ctx_contract_contacts_owner' then as_col_name = 'owner'
			ads_ins.SetItem(al_ins_row, as_col_name, ls_char_value)
		End If
	CASE "D"			//  DATE DATATYPE
		ld_date_value = ads_data.GetItemDate(al_data_row, as_col_name)
		If IsNull(ld_date_value) And Len(ls_initial) > 0 Then
			Choose Case lower(ls_initial) 
				Case 'today','now' 	
					ads_ins.SetItem(al_ins_row, as_col_name, Date(today()))	 
				Case Else
					ads_ins.SetItem(al_ins_row, as_col_name, Date (ls_initial) ) 
			End Choose		
		Else
			ads_ins.SetItem(al_ins_row, as_col_name, ld_date_value)
		End If	
	CASE "DT"		//  DATETIME DATATYPE
		ldt_dt_value = ads_data.GetItemDateTime(al_data_row, as_col_name)
		If IsNull(ldt_dt_value) And Len(ls_initial) > 0 Then
			Choose Case lower(ls_initial) 
				Case 'today','now'
					ads_ins.SetItem(al_ins_row, as_col_name, DateTime(today(), now()))	 
				Case Else
					ads_ins.SetItem(al_ins_row, as_col_name, DateTime (Date (ls_initial))) 
			End Choose		
		Else
			ads_ins.SetItem(al_ins_row, as_col_name, ldt_dt_value)
		End If	
	CASE "DEC"		//  DECIMAL DATATYPE
		ld_dec_value = ads_data.GetItemDecimal(al_data_row, as_col_name)
		If IsNull(ld_dec_value) And Len(ls_initial) > 0 Then
			If Pos(ls_initial, '.') > 0 Then
				ads_ins.SetItem(al_ins_row, as_col_name, Dec(ls_initial))
			Else
				ads_ins.SetItem(al_ins_row, as_col_name, Long(ls_initial))
			End If
		Else
			ads_ins.SetItem(al_ins_row, as_col_name, ads_data.GetItemDecimal(al_data_row, as_col_name))
		End If
	CASE "N" 			//  NUMBER DATATYPE	
		ll_long_value = ads_data.GetItemNumber(al_data_row, as_col_name)
		if as_col_name = 'ctx_location_pracs_status' then as_col_name = 'status'
		If IsNull(ll_long_value) And Len(ls_initial) > 0 Then
			ads_ins.SetItem(al_ins_row, as_col_name, Long(ls_initial))
		Else
			ads_ins.SetItem(al_ins_row, as_col_name, ll_long_value)
		End If
	CASE "T"		//  TIME DATATYPE
		lt_time_value = ads_data.GetItemTime(al_data_row, as_col_name)
		If IsNull(lt_time_value) And Len(ls_initial) > 0 Then
			Choose Case lower(ls_initial) 
				Case 'today','now'
					ads_ins.SetItem(al_ins_row, as_col_name, Time(today()))	
				Case Else
					ads_ins.SetItem(al_ins_row, as_col_name, Time (ls_initial))
			End Choose		
		Else
			ads_ins.SetItem(al_ins_row, as_col_name, lt_time_value)
		End If	
		
END CHOOSE
*/
end subroutine

public subroutine of_set_multi_select_value (string as_col_name, long al_screen, long al_ctx_id, string as_value);//====================================================================
// Function: of_set_multi_select_value()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments:    	 
//	value		string     		as_col_name
// 	value		long	     	al_screen     
// 	value		long	     	al_ctx_id  
// value		string     		as_value
//--------------------------------------------------------------------
// Returns:  None
//--------------------------------------------------------------------
// Author:	Harry		Date: 20170630
//--------------------------------------------------------------------
// Modify History:
//====================================================================
String ls_multi_select
ls_multi_select = gnv_data.of_getitem( 'multi_select_fields', 'object_format', 'view_id = ' + String(il_view) + ' and screen_id = ' + String(al_screen) + ' and object_name = "' +as_col_name+ '"' + ' and object_type = "multi-select"' )

if  ls_multi_select= 'Y' then
	insert into screen_field_select_item(view_id,screen_id,ctx_id,field_name,field_data)
	values(:il_view,:al_screen,:al_ctx_id,:as_col_name,:as_value);
end if
end subroutine

public subroutine of_set_value (datastore ads_dync, string as_col_name, ref datastore ads_ins, long al_ins_row, datastore ads_data, long al_data_row, string as_type, datastore ads_custom, long al_screen, long al_ctx_id);//====================================================================
// Function: of_set_value()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments:    	 
//	value		datastore	ads_dync
//	value		string     		as_col_name
// 	ref			datastore	ads_ins	
// 	value		long	     	al_ins_row     
// 	value		datastore	ads_data	
// 	value		long	     	al_data_row  
// value		string     		as_type
// 	value		datastore	ads_custom	
//--------------------------------------------------------------------
// Returns:  None
//--------------------------------------------------------------------
// Author:	Harry		Date: 20170628
//--------------------------------------------------------------------
// Modify History:
//====================================================================
String ls_initial
String ls_style

If of_get_visible(ads_dync, as_col_name) Then //visible = true
	If of_check_unselect_fields(0,'ctx_basic_info',as_col_name) Then of_set_value(ads_dync, as_col_name, ads_ins, al_ins_row, ads_data, al_data_row, as_type, 0, al_ctx_id)
Else
	ls_initial = ads_custom.Describe(as_col_name + ".Initial")
	ls_style = ads_custom.Describe(as_col_name+".edit.style")
	If ls_initial = "!" Or ls_initial = "?" Or ls_initial = "" Or Lower(ls_initial) = "null" Or isnull(ls_initial) Then ls_initial = ""
	If len(ls_initial) > 0 Then //setted default value
		CHOOSE CASE as_type
			CASE "C"
				ads_ins.SetItem(al_ins_row, as_col_name, ls_initial)
				If ls_style = 'dddw' and  left(lower(as_col_name), 7) = 'custom_' and (al_screen = 9 OR al_screen = 10) Then
					of_set_multi_select_value(as_col_name, al_screen, al_ctx_id, ls_initial)
				End If
			CASE "DT"
				Choose Case lower(ls_initial) 
					Case 'today','now'
						ads_ins.SetItem(al_ins_row, as_col_name, DateTime(today(), now()))	 
					Case Else
						ads_ins.SetItem(al_ins_row, as_col_name, DateTime (Date (ls_initial))) 
				End Choose
			CASE "DEC"
				If Pos(ls_initial, '.') > 0 Then
					ads_ins.SetItem(al_ins_row, as_col_name, Dec(ls_initial))
				Else
					ads_ins.SetItem(al_ins_row, as_col_name, Long(ls_initial))
				End If
			CASE "N" 
				ads_ins.SetItem(al_ins_row, as_col_name, Long(ls_initial))
		END CHOOSE
	End If
End If

end subroutine

protected subroutine of_set_value (datastore ads_dync, string as_col_name, ref datastore ads_ins, long al_ins_row, datastore ads_data, long al_data_row, string as_type, long al_screen, long al_ctx_id);//====================================================================
// Function: of_set_value()
//--------------------------------------------------------------------
// Description: 
//--------------------------------------------------------------------
// Arguments:    	 
//	value		datastore	ads_dync
//	value		string     		as_col_name
// 	ref			datastore	ads_ins	
// 	value		long	     	al_ins_row     
// 	value		datastore	ads_data	
// 	value		long	     	al_data_row  
// value		string     		as_type
// 	value		long	     	al_screen  
// 	value		long	     	al_ctx_id  
//--------------------------------------------------------------------
// Returns:  None
//--------------------------------------------------------------------
// Author:	Harry		Date: 20170630
//--------------------------------------------------------------------
// Modify History:
//====================================================================
String ls_initial
String ls_char_value
Date ld_date_value
DateTime ldt_dt_value
Decimal ld_dec_value
Long ll_long_value
Time lt_time_value
String ls_style

ls_initial = ads_dync.Describe(as_col_name + ".Initial")

If ls_initial = "!" Or ls_initial = "?" Or ls_initial = "" Or Lower(ls_initial) = "null" Or isnull(ls_initial) Then ls_initial = ""

CHOOSE CASE as_type
	CASE "C"		//  CHARACTER DATATYPE
		ls_char_value = ads_data.GetItemString(al_data_row, as_col_name)
		If IsNull(ls_char_value) And Len(ls_initial) > 0 Then
			if as_col_name = 'ctx_contract_contacts_owner' then as_col_name = 'owner'
			ads_ins.SetItem(al_ins_row, as_col_name, ls_initial)
			ls_style = ads_dync.Describe(as_col_name+".edit.style")
			If ls_style = 'dddw' and  left(lower(as_col_name), 7) = 'custom_' and (al_screen = 9 OR al_screen = 10) Then
				of_set_multi_select_value(as_col_name, al_screen, al_ctx_id, ls_initial)
			End If
		Else
			if as_col_name = 'ctx_contract_contacts_owner' then as_col_name = 'owner'
			ads_ins.SetItem(al_ins_row, as_col_name, ls_char_value)
		End If
	CASE "D"			//  DATE DATATYPE
		ld_date_value = ads_data.GetItemDate(al_data_row, as_col_name)
		If IsNull(ld_date_value) And Len(ls_initial) > 0 Then
			Choose Case lower(ls_initial) 
				Case 'today','now' 	
					ads_ins.SetItem(al_ins_row, as_col_name, Date(today()))	 
				Case Else
					ads_ins.SetItem(al_ins_row, as_col_name, Date (ls_initial) ) 
			End Choose		
		Else
			ads_ins.SetItem(al_ins_row, as_col_name, ld_date_value)
		End If	
	CASE "DT"		//  DATETIME DATATYPE
		ldt_dt_value = ads_data.GetItemDateTime(al_data_row, as_col_name)
		If IsNull(ldt_dt_value) And Len(ls_initial) > 0 Then
			Choose Case lower(ls_initial) 
				Case 'today','now'
					ads_ins.SetItem(al_ins_row, as_col_name, DateTime(today(), now()))	 
				Case Else
					ads_ins.SetItem(al_ins_row, as_col_name, DateTime (Date (ls_initial))) 
			End Choose		
		Else
			ads_ins.SetItem(al_ins_row, as_col_name, ldt_dt_value)
		End If	
	CASE "DEC"		//  DECIMAL DATATYPE
		ld_dec_value = ads_data.GetItemDecimal(al_data_row, as_col_name)
		If IsNull(ld_dec_value) And Len(ls_initial) > 0 Then
			If Pos(ls_initial, '.') > 0 Then
				ads_ins.SetItem(al_ins_row, as_col_name, Dec(ls_initial))
			Else
				ads_ins.SetItem(al_ins_row, as_col_name, Long(ls_initial))
			End If
		Else
			ads_ins.SetItem(al_ins_row, as_col_name, ads_data.GetItemDecimal(al_data_row, as_col_name))
		End If
	CASE "N" 			//  NUMBER DATATYPE	
		ll_long_value = ads_data.GetItemNumber(al_data_row, as_col_name)
		if as_col_name = 'ctx_location_pracs_status' then as_col_name = 'status'
		If IsNull(ll_long_value) And Len(ls_initial) > 0 Then
			ads_ins.SetItem(al_ins_row, as_col_name, Long(ls_initial))
		Else
			ads_ins.SetItem(al_ins_row, as_col_name, ll_long_value)
		End If
	CASE "T"		//  TIME DATATYPE
		lt_time_value = ads_data.GetItemTime(al_data_row, as_col_name)
		If IsNull(lt_time_value) And Len(ls_initial) > 0 Then
			Choose Case lower(ls_initial) 
				Case 'today','now'
					ads_ins.SetItem(al_ins_row, as_col_name, Time(today()))	
				Case Else
					ads_ins.SetItem(al_ins_row, as_col_name, Time (ls_initial))
			End Choose		
		Else
			ads_ins.SetItem(al_ins_row, as_col_name, lt_time_value)
		End If	
		
END CHOOSE
end subroutine

on n_cst_copy_ctx.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_copy_ctx.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event destructor;
if isvalid(ids_filter) then destroy ids_filter 					//Added By Mark Lee 06/10/2015
if isvalid(ids_screen) then destroy ids_screen 					//Added by Harry 20170622 for Task 728	
end event

