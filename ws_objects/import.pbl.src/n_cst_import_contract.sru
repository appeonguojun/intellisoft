$PBExportHeader$n_cst_import_contract.sru
forward
global type n_cst_import_contract from n_cst_import
end type
end forward

global type n_cst_import_contract from n_cst_import
end type
global n_cst_import_contract n_cst_import_contract

type variables
// Field audit
n_cst_ctx_audit inv_audit

Long il_ctx_template_id //Added by Harry 2017-09-07 
Long il_new_ctx_template = 0  //Added by Harry 2017-09-12


Boolean ib_Doc_IsNewRow[]  //Added by Harry 2017-09-19
Long    il_Doc_SetDefValueRow[] //Added by Harry 2017-09-19

end variables

forward prototypes
public function integer of_fieldaudit ()
public function integer of_setprimarykey (string as_table_name)
public function integer of_datapopulate ()
public function integer of_dyncreateistabledw (string as_table_name)
public function integer of_postupdate ()
public function integer of_set_ctx_fee_sched_nm_key ()
public function integer of_checkmapping (boolean ab_isimport, long al_table_id, string as_table_name, ref datastore ads_import_field, ref datastore ads_mapping_field, ref string as_errortext[])
public function integer of_datapopulateproc ()
public function integer of_set_ctx_basic_info_def (ref datastore ads_data, long al_row, boolean ab_isadd)
public function integer of_set_ctx_contacts_def (ref datastore ads_data, long al_row)
public function integer of_set_ctx_contract_contacts_def (ref datastore ads_data, long al_row)
public function integer of_set_app_facility_def (ref datastore ads_data, long al_row, boolean ab_isadd)
public function integer of_setdefaultvalue (string as_table_name, ref boolean ab_isnewrow[], ref long al_setdefvaluerow[])
public function integer of_set_security_users_def (ref datastore ads_data, long al_row, boolean ab_isadd)
public function string of_existscheckedvalue (string as_tablename, string as_column, string as_arrvalue[], string as_type, ref string as_output_table)
public function integer of_checkimportdata (string as_table_name, boolean ab_isnewrow[], long al_setdefvaluerow[])
public function integer of_checkmapping (boolean ab_isimport, long al_table_id, string as_table_name, ref datastore ads_import_field, ref datastore ads_mapping_field, ref string as_errortext[], string as_project, datastore ads_table_record)
public function string of_checkmapfieldvalue (datastore ads_mapfield, datastore ads_importfield, string as_tablename, string as_columnname, integer ai_row)
public function integer of_set_ctx_am_document_def (ref datastore ads_data, long al_row, boolean ab_isadd)
end prototypes

public function integer of_fieldaudit ();string ls_table_name

// Set progress bar
w_import_progressbar.of_SetImportProcessDesc("Field audit")
w_import_progressbar.of_SetMaxPosition(2)
w_import_progressbar.of_SkipNextPosition()

// Execute field audit
ls_table_name = Lower(ids_table_record.object.table_name[ids_table_record.GetRow()])
inv_audit.of_audit_fields(ids_intellisoft_table, ls_table_name)
w_import_progressbar.of_SkipNextPosition()

Return 1
end function

public function integer of_setprimarykey (string as_table_name);long ll_Row, i
long ll_ctx_id
long ll_record_id
long ll_contact_id
long ll_facility_id
long ll_contact_num_id
long ll_InsertRow
long ll_nullrow[] 
long ll_doc_id  //Added by Harry 2017-09-15 

if lower(as_table_name) = "ctx_basic_info" then gl_add_ctx_id[] = ll_nullrow[] //Added By Jay Chen 04-29-2014

// There is no new record
if il_CurrTableAddCount = 0 then Return 1
w_import_progressbar.of_SetImportProcessDesc("Set primary key value")

// Set primary key value
choose case as_table_name
	case "ctx_basic_info"
		// Set ctx_id, record_id
		//Start Change code by Jervis 04.11.2008
		//get contract id from ids.ctx_id.
		//ll_ctx_id = gnv_app.of_get_id("PRAC_ID", il_CurrTableAddCount)
		ll_ctx_id = gnv_app.of_get_id("CTX_ID", il_CurrTableAddCount)
		//End Change code by jervis 04.11.2008
		
		ll_record_id = gnv_app.of_get_Id("RECORD_ID", il_CurrTableAddCount)
		w_import_progressbar.of_SetMaxPosition(il_CurrTableAddCount)
		gl_add_ctx_id[] = ll_nullrow[]  //Added By Jay Chen 11-01-2013
		for i = 1 to il_CurrTableAddCount
			ll_Row = ids_newrow.GetItemNumber(i, "new_row")
			ids_intellisoft_table.SetItem(ll_Row, "ctx_id", ll_ctx_id)
			ids_intellisoft_table.SetItem(ll_Row, "record_id", ll_record_id)
			ll_ctx_id ++
			ll_record_id ++
			w_import_progressbar.of_SkipNextPosition()
			//Added By Jay Chen 11-01-2013  
			gl_add_ctx_id[upperbound(gl_add_ctx_id) + 1] = ids_intellisoft_table.getitemnumber(ll_Row,"ctx_id")
		next

	case "ctx_fee_sched_nm"
		// Set record_id, fee_sched_nm_id
		of_set_ctx_fee_sched_nm_key()
		
	case "ctx_contacts"
		// Set contact_id
		ll_record_id = gnv_app.of_get_Id("RECORD_ID", il_CurrTableAddCount)
		SELECT max(contact_id) INTO :ll_contact_id FROM ctx_contacts;
		if IsNull(ll_contact_id) then ll_contact_id = 0
		ll_contact_id ++
		w_import_progressbar.of_SetMaxPosition(il_CurrTableAddCount)
		for i = 1 to il_CurrTableAddCount
			ll_Row = ids_newrow.GetItemNumber(i, "new_row")
			ids_intellisoft_table.SetItem(ll_Row, "contact_id", ll_contact_id)
			ids_intellisoft_table.SetItem(ll_Row, "record_id", ll_record_id)
			ll_contact_id ++
			ll_record_id ++
			w_import_progressbar.of_SkipNextPosition()
		next
		
	case "app_facility"
		// Set facility_id
		SELECT max(facility_id) INTO :ll_facility_id FROM app_facility;
		if IsNull(ll_facility_id) then ll_facility_id = 0
		ll_facility_id ++
		w_import_progressbar.of_SetMaxPosition(il_CurrTableAddCount)
		for i = 1 to il_CurrTableAddCount
			ll_Row = ids_newrow.GetItemNumber(i, "new_row")
			ids_intellisoft_table.SetItem(ll_Row, "facility_id", ll_facility_id)
			ll_facility_id ++
			w_import_progressbar.of_SkipNextPosition()
		next
		
	case "ctx_contacts_numbers"
		// Set record_id, contact_num_id
		ll_record_id = gnv_app.of_get_Id("RECORD_ID", il_CurrTableAddCount)
		SELECT max(contact_num_id) INTO :ll_contact_num_id FROM ctx_contacts_numbers;
		if IsNull(ll_contact_num_id) then ll_contact_num_id = 0
		ll_contact_num_id ++
		w_import_progressbar.of_SetMaxPosition(il_CurrTableAddCount)
		for i = 1 to il_CurrTableAddCount
			ll_Row = ids_newrow.GetItemNumber(i, "new_row")
			ids_intellisoft_table.SetItem(ll_Row, "contact_num_id", ll_contact_num_id)
			ids_intellisoft_table.SetItem(ll_Row, "record_id", ll_record_id)
			ll_contact_num_id ++
			ll_record_id ++
			w_import_progressbar.of_SkipNextPosition()
		next
		
	case "ctx_products", "ctx_contract_contacts"
		// Set record_id
		ll_record_id = gnv_app.of_get_Id("RECORD_ID", il_CurrTableAddCount)
		w_import_progressbar.of_SetMaxPosition(il_CurrTableAddCount)
		for i = 1 to il_CurrTableAddCount
			ll_Row = ids_newrow.GetItemNumber(i, "new_row")
			ids_intellisoft_table.SetItem(ll_Row, "record_id", ll_record_id)
			ll_record_id ++
			w_import_progressbar.of_SkipNextPosition()
		next
	case "ctx_custom_multi_hdr"//added by gavins 20120225
		ll_record_id = gnv_app.of_get_id('multi_ID', il_CurrTableAddCount )
		w_import_progressbar.of_SetMaxPosition(il_CurrTableAddCount)
		for i = 1 to il_CurrTableAddCount
			ll_Row = ids_newrow.GetItemNumber(i, "new_row")
			ids_intellisoft_table.SetItem(ll_Row, "hdr_id", ll_record_id)
			ll_record_id ++
			w_import_progressbar.of_SkipNextPosition()
		next
	case "ctx_custom_multi_detail"//added by gavins 20120225
//		ll_record_id = gnv_app.of_get_id('multi_ID', il_CurrTableAddCount )
		select isnull(custom_id1,0) into:ll_record_id from ids;
		w_import_progressbar.of_SetMaxPosition(il_CurrTableAddCount)
		ll_record_id ++
		for i = 1 to il_CurrTableAddCount
			ll_Row = ids_newrow.GetItemNumber(i, "new_row")
			ids_intellisoft_table.SetItem(ll_Row, "detail_id", ll_record_id)
			ll_record_id ++
			w_import_progressbar.of_SkipNextPosition()
		next	
	case "security_users"	//Added By Mark Lee 04/17/2014
		//user_id
	case "idp_users"		//Added By Mark Lee 04/22/2014
		
	case "ctx_am_document"  //Added by Harry 2017-09-15 
		ll_doc_id = gnv_app.of_get_id("DOC_ID", il_CurrTableAddCount)
		
		//ll_record_id = gnv_app.of_get_Id("RECORD_ID", il_CurrTableAddCount)
		w_import_progressbar.of_SetMaxPosition(il_CurrTableAddCount)
		for i = 1 to il_CurrTableAddCount
			ll_Row = ids_newrow.GetItemNumber(i, "new_row")
			ids_intellisoft_table.SetItem(ll_Row, "doc_id", ll_doc_id)
			ll_doc_id ++
			w_import_progressbar.of_SkipNextPosition()
		next	
end choose

Return 1
end function

public function integer of_datapopulate ();//<Overwrite this function>
string ls_table_name

// if no import data
if ids_intellisoft_table_temp.RowCount() <= 0 then Return 1
ls_table_name = Lower(ids_table_record.object.table_name[ids_table_record.GetRow()])

// Cache data for populate data
w_import_progressbar.of_SetImportProcessDesc("Cache data for populate data")
w_import_progressbar.of_SetMaxPosition(2)
w_import_progressbar.of_SkipNextPosition()
ids_intellisoft_table.Retrieve()
w_import_progressbar.of_SkipNextPosition()

// Populate data according to key fields
if of_DataPopulateProc() = -1 then Return -1
ids_intellisoft_table_temp.Reset()

// Set primary key value
of_SetPrimaryKey(ls_table_name)

//Added by Harry 2017-09-12
if il_new_ctx_template > 0 then
	il_CurrTableAddCount += il_new_ctx_template
	il_CurrTableModifyCount -= il_new_ctx_template
end if

// Cache foreign key to ids_imp_data
choose case ls_table_name
	case "ctx_basic_info"
		of_CacheForeignKey("sys_pc_id", "ctx_id")
	case "app_facility"
		of_CacheForeignKey("sys_facility_id", "facility_id")
	case "ctx_contacts"
		of_CacheForeignKey("sys_contact_id", "contact_id")
	case "ctx_custom_multi_hdr"	
		of_CacheForeignKey("sys_hdr_id", "hdr_id")
	case "security_users"		//Added By Mark Lee 04/17/2014
		of_CacheForeignKey("sys_user_id", "user_id")
	case "ctx_am_document"  //Added by Harry 2017-09-15
		of_CacheForeignKey("sys_doc_id", "doc_id")
end choose

Return 1
end function

public function integer of_dyncreateistabledw (string as_table_name);//<Overwrite this function>
string  ls_Error
string  ls_ErrorTemp
string  ls_Syntax
string  ls_SyntaxTemp
string  ls_comp_def
string  ls_field_name
string  ls_imp_field_name
string  ls_Fields
string  ls_FieldsTemp
string  ls_SQLSelect
string  ls_SQLSelectTemp
integer i, li_InsertRow
integer li_Pos
n_cst_dw_update_prop lnv_DwSyntax
	
//1.Get mapped fields of list
for i = 1 to ids_mapping_field.RowCount()
	ls_field_name = Lower(Trim(ids_mapping_field.object.field_name[i]))
	if Len(ls_Fields) > 0 then ls_Fields += ","
	ls_Fields += ls_field_name
next

//2.Add necessary fields to select SQL(Additional field must place at last) 
//For temp DW
ls_FieldsTemp = ls_Fields + ",0 imp_row, 0 err_value, 0 sys_pc_id, 0 sys_facility_id, 0 sys_contact_id, 0 sys_hdr_id, '' as sys_user_id, 0 sys_doc_id " //Added By Jay Chen 02-20-2014	//Added By Mark Lee 04/17/2014 user_id //Added by Harry 2017-09-15 sys_doc_id
if AppeonGetClientType() = "PB" then
	ls_SQLSelectTemp = "SELECT " + ls_FieldsTemp + ",'' sort_field FROM " + as_table_name
else
	ls_SQLSelectTemp = "SELECT " + ls_FieldsTemp + " FROM " + as_table_name
end if

//For update DW
choose case as_table_name
	case "ctx_basic_info"
		if Pos(ls_Fields, "category") <= 0 then ls_Fields += ",category"
		if Pos(ls_Fields, "app_facility") <= 0 then ls_Fields += ",app_facility"
		if Pos(ls_Fields, "contract_type") <= 0 then ls_Fields += ",contract_type"
		if Pos(ls_Fields, "dvision") <= 0 then ls_Fields += ",dvision"
		if Pos(ls_Fields, "status") <= 0 then ls_Fields += ",status"
		ls_Fields += ",ctx_id,record_id,version_number,version_date,master_contract_id"
	case "ctx_contract_contacts"
		if Pos(ls_Fields, "ic_area") <= 0 then ls_Fields += ",ic_area"
		ls_Fields += ",ctx_id,contact_id,record_id"
	case "ctx_products"
		ls_Fields += ",ctx_id,record_id"
	case "ctx_fee_sched_nm"
		ls_Fields += ",ctx_id,fee_sched_nm_id,record_id"
	case "app_facility"
		if Pos(ls_Fields, "contact_type2") <= 0 then ls_Fields += ",contact_type2"
		if Pos(ls_Fields, "corp_office_flag") <= 0 then ls_Fields += ",corp_office_flag"
		if Pos(ls_Fields, "status") <= 0 then ls_Fields += ",status" //Added By Jay Chen 10-30-2015
		ls_Fields += ",facility_id"
	case "ctx_contacts"
		if Pos(ls_Fields, "user_d") <= 0 then ls_Fields += ",user_d"		//Added By Mark Lee 04/17/2014
		if Pos(ls_Fields, "status") <= 0 then ls_Fields += ",status" //Added By Jay Chen 10-30-2015
		ls_Fields += ",facility_id,contact_id,record_id"
	case "ctx_contacts_numbers"
		ls_Fields += ",contact_id,contact_num_id,record_id"
	case "ctx_custom"//add by gavins 20120207
		ls_Fields += ",ctx_id"	
	case "ctx_custom_multi_hdr" //Added By Jay Chen 02-20-2014
		ls_Fields += ",ctx_id,hdr_id"
	case "ctx_custom_multi_detail" 
		ls_Fields += ",ctx_id,hdr_id,detail_id"
	case "security_users"		//Added By Mark Lee 04/17/2014
		if Pos(ls_Fields, "user_id") <= 0 then ls_Fields += ",user_id"
		if Pos(ls_Fields, "role_id") <= 0 then ls_Fields += ",role_id"
		if Pos(ls_Fields, "contract_default_view") <= 0 then ls_Fields += ",contract_default_view"
		if Pos(ls_Fields, "readonly") <= 0 then ls_Fields += ",readonly"
		if Pos(ls_Fields, "set_autoret") <= 0 then ls_Fields += ",set_autoret"
		if Pos(ls_Fields, "dynamic_search_tab") <= 0 then ls_Fields += ",dynamic_search_tab"
		if Pos(ls_Fields, "run_date_alarm") <= 0 then ls_Fields += ",run_date_alarm"
		if Pos(ls_Fields, "set_autoresize") <= 0 then ls_Fields += ",set_autoresize"
		if Pos(ls_Fields, "doc_auto_retrieve") <= 0 then ls_Fields += ",doc_auto_retrieve"
		if Pos(ls_Fields, "contract_display_mode") <= 0 then ls_Fields += ",contract_display_mode"
		if Pos(ls_Fields, "autoexport") <= 0 then ls_Fields += ",autoexport"
		if Pos(ls_Fields, "getting_started") <= 0 then ls_Fields += ",getting_started"
		if Pos(ls_Fields, "refresh_sertifi") <= 0 then ls_Fields += ",refresh_sertifi"
		if Pos(ls_Fields, "refresh_sertifi_dm") <= 0 then ls_Fields += ",refresh_sertifi_dm"
		if Pos(ls_Fields, "check_email") <= 0 then ls_Fields += ",check_email"		
		if Pos(ls_Fields, "disabled_status") <= 0 then ls_Fields += ",disabled_status"		
		ls_Fields += ",user_password,image_flag"
	case "idp_users"			//Added By Mark Lee 04/22/2014
		ls_Fields += ",map_user_id, sno"	
	case "ctx_am_document"  //Added by Harry 2017-09-15
		//Added by Harry 2017-09-18
		if Pos(ls_Fields, "doc_name") <= 0 then ls_Fields += ",doc_name"
		if Pos(ls_Fields, "revision") <= 0 then ls_Fields += ",revision"
		if Pos(ls_Fields, "doc_type") <= 0 then ls_Fields += ",doc_type"
		if Pos(ls_Fields, "doc_ext") <= 0 then ls_Fields += ",doc_ext"
		if Pos(ls_Fields, "category") <= 0 then ls_Fields += ",category"
		if Pos(ls_Fields, "base_type") <= 0 then ls_Fields += ",base_type"
		if Pos(ls_Fields, "create_by") <= 0 then ls_Fields += ",create_by"
		if Pos(ls_Fields, "status") <= 0 then ls_Fields += ",status"
		if Pos(ls_Fields, "status_by") <= 0 then ls_Fields += ",status_by"
		if Pos(ls_Fields, "status_date") <= 0 then ls_Fields += ",status_date"
		
		ls_Fields += ",ctx_id,doc_id"
end choose
if AppeonGetClientType() = "PB" then
	ls_SQLSelect = "SELECT " + ls_Fields + ",'' sort_field FROM " + as_table_name
else
	ls_SQLSelect = "SELECT " + ls_Fields + " FROM " + as_table_name
end if

//3.Dynamic create IntelliSoft table datawindow
gnv_appeondb.of_StartQueue()
ls_Syntax = SQLCA.SyntaxFromSQL(ls_SQLSelect, "", ls_Error)
gnv_debug.of_output(False, "ls_SQLSelect = " + ls_SQLSelect)

ls_SyntaxTemp = SQLCA.SyntaxFromSQL(ls_SQLSelectTemp, "", ls_ErrorTemp)
gnv_appeondb.of_CommitQueue()
if Len(ls_Error) > 0 then
	of_Log(0, "", IL_ERRTYPE_MAPDESIGN, "Failed to SyntaxFromSQL for updatable DataWindow." + ls_Error)
	gnv_debug.of_output(True, "Failed to SyntaxFromSQL for updatable DataWindow." + ls_Error)
	gnv_debug.of_output(True, "SQL = " + ls_SQLSelect)
	if not of_IsContinue() then Return -1
	Return -2
end if
if Len(ls_ErrorTemp) > 0 then
	of_Log(0, "", IL_ERRTYPE_MAPDESIGN, "Failed to dynamically create temporary DataWindow." + ls_ErrorTemp)
	gnv_debug.of_output(True,"Failed to SyntaxFromSQL for temporary DataWindow." + ls_ErrorTemp)
	gnv_debug.of_output(True, "SQL = " + ls_SQLSelect)
	if not of_IsContinue() then Return -1
	Return -2
end if

ids_intellisoft_table.Create(ls_Syntax, ls_Error)
If ls_Error <> '' Then
	gnv_debug.of_output(True, "Failed to dynamically create updatable DataWindow." + ls_Error)
	gnv_debug.of_output(True, "ls_Syntax = " + ls_Syntax)
	of_Log(0, "", IL_ERRTYPE_MAPDESIGN, "Failed to dynamically create updatable DataWindow." + ls_Error)
	if not of_IsContinue() then Return -1
	Return -2
End If

ids_intellisoft_table.SetTransObject(SQLCA)
ids_intellisoft_table_temp.Create(ls_SyntaxTemp, ls_Error)
If ls_Error <> '' Then
	gnv_debug.of_output(True, "Failed to dynamically create temporary DataWindow." + ls_Error)
	gnv_debug.of_output(True, "ls_Syntax = " + ls_SyntaxTemp)
End If

gnv_debug.of_output(False, 'Before set update. ids_intellisoft_table.Describe("DataWindow.Syntax") =' + ids_intellisoft_table.Describe("DataWindow.Syntax") )


if lnv_DwSyntax.of_ModifyUpdateProperty(ids_intellisoft_table, as_table_name) = -1 then 
	of_Log(0, "", IL_ERRTYPE_MAPDESIGN, "Failed to modify datawindow update properties.")
	gnv_debug.of_output(True, "Failed to modify datawindow update properties.")
	if not of_IsContinue() then Return -1
	Return -2
end if

ids_intellisoft_table.object.datawindow.table.updatewhere = 0
ids_intellisoft_table.Modify("sort_field.update='no'")
//Added By Mark Lee 04/24/2014
if as_table_name = 'security_users' then ids_intellisoft_table.object.datawindow.table.updatekeyinplace='yes'

gnv_debug.of_output(False, 'after set update. ids_intellisoft_table.Describe("DataWindow.Syntax") =' + ids_intellisoft_table.Describe("DataWindow.Syntax") )

Return 1
end function

public function integer of_postupdate ();//<Overwrite this function>

//Added by Harry 2017-09-19
string ls_table_name
string ls_filename
Long i
Long ll_doc_id
n_cst_dm_utils lnv_dm_utils
//Insert into 
ls_table_name = Lower(ids_table_record.object.table_name[ids_table_record.GetRow()])
if ls_table_name = "ctx_am_document" then
	if UpperBound (ib_Doc_IsNewRow[]) > 0 then
		for i = 1 to UpperBound (ib_Doc_IsNewRow[]) 
			//if not ib_Doc_IsNewRow[i] then Continue
			ls_filename = ids_intellisoft_table.GetItemString( il_Doc_SetDefValueRow[i], 'filename')
			ll_doc_id = ids_intellisoft_table.GetItemNumber(  il_Doc_SetDefValueRow[i], 'doc_id')
			if FileExists ( ls_filename ) then
				lnv_dm_utils.ib_show_msg = false
				If lnv_dm_utils.of_upload_file( ll_doc_id, 1.0, ls_filename) > 0 Then
					gnv_debug.of_output(True, "Successed to save file to DB.")
				Else	
					gnv_debug.of_output(True, "Failed to save file to DB(Ctx_am_doc_image)." )
				End If
			end if
		next
	end if
end if
//End Added -------------

// Add audit trail data
if ids_intellisoft_table.ModifiedCount() > 0 then	
	// Add Audit trail data
	of_FieldAudit()
end if

// Reset datastore
ids_intellisoft_table.Reset()

Return 1
end function

public function integer of_set_ctx_fee_sched_nm_key ();long i, ll_Row
long ll_record_id
long ll_prac_id
long ll_RowCount
DataStore lds_sequence

w_import_progressbar.of_SetMaxPosition(il_CurrTableAddCount + 2)

lds_sequence = Create DataStore
lds_sequence.DataObject = "d_import_ds_sequence"
ll_RowCount = ids_intellisoft_table.RowCount()
lds_sequence.object.prac_id[1,ll_RowCount] = ids_intellisoft_table.object.ctx_id[1,ll_RowCount]
lds_sequence.object.seq_no[1,ll_RowCount] = ids_intellisoft_table.object.fee_sched_nm_id[1,ll_RowCount]
w_import_progressbar.of_SkipNextPosition()

// Set record_id
ll_record_id = gnv_app.of_get_Id("RECORD_ID", il_CurrTableAddCount)
for i = 1 to il_CurrTableAddCount
	ll_Row = ids_newrow.GetItemNumber(i, "new_row")
	ids_intellisoft_table.SetItem(ll_Row, "record_id", ll_record_id)
	
	lds_sequence.object.row_num[ll_Row] = ll_Row	
	ll_record_id ++
	w_import_progressbar.of_SkipNextPosition()
next

// Set fee_sched_nm_id
of_SetSequenceNo(lds_sequence, ids_intellisoft_table, il_CurrTableAddCount, "ctx_id", "fee_sched_nm_id", true)
Destroy lds_sequence
w_import_progressbar.of_SkipNextPosition()

Return 1
end function

public function integer of_checkmapping (boolean ab_isimport, long al_table_id, string as_table_name, ref datastore ads_import_field, ref datastore ads_mapping_field, ref string as_errortext[]);//<Overwrite this function>
string  ls_field_name
string  ls_field_name_allias
string  ls_imp_field_name
integer li_Return
integer li_KeyFieldCount
integer i, li_FieldCount
boolean lb_IsProductIDExists = false
boolean lb_IsProductIDKeyField = false
boolean lb_IsProductTypeExists = false
boolean lb_IsProductTypeKeyField = false
boolean lb_IsICAreaExists = false
boolean lb_IsICAreaKeyField = false
boolean lb_IsFirstNameExists = false
boolean lb_IsLastNameExists = false
boolean lb_IsContactType2Exists = false
boolean lb_IsCTXCategory = false //Added By Ken.Guo 2011-03-16.
boolean lb_IsRoleId = false		//Added By Mark Lee 04/16/2014
boolean lb_IsUserId = false	
boolean lb_IsIDPUserId = false
boolean lb_IsIDPServerId = false
boolean lb_IsContractId = false  //Added By Ken.Guo 2017-04-11
boolean lb_IsContractSFId = false //Added By Ken.Guo 2017-04-11
boolean lb_IsFolderId = false //Added By Ken.Guo 2017-04-11
boolean lb_IsDocumentContent = false //Added By Ken.Guo 2017-04-11
boolean lb_IsDocFileName = false  //Added By Harry 2017-09-15
string ls_label //Added By Jay Chen 12-22-2014

//////////////////////////////////////////////////////////////////////////////////////////////
// There is no creation mapped relationship
li_FieldCount = ads_mapping_field.RowCount()
if li_FieldCount <= 0 then
	li_Return = of_Log(ab_IsImport, "No mapping relationship was created.", as_ErrorText[])
	if ab_IsImport then Return li_Return
	Return 1 //Have one error
end if

//////////////////////////////////////////////////////////////////////////////////////////////
//Added By Jay Chen 12-22-2014
Window	lw_activewindow
if isvalid(w_mdi) then
	lw_activewindow = w_mdi.GetActiveSheet( )
	if isvalid(lw_activewindow) then
		if lw_activewindow.classname( ) = 'w_import_painter' then 
			ls_label = 'Import field'
		else
			ls_label = 'Sync field'
		end if
	end if
end if
//end
// Check IntelliSoft field name
for i = 1 to li_FieldCount
	// Get field name
	ls_field_name = Lower(Trim(ads_mapping_field.object.field_name[i]))
	ls_field_name_allias = ads_mapping_field.object.field_name_allias[i]
	ls_imp_field_name = Lower(Trim(ads_mapping_field.object.imp_field_name[i]))
	// Set flags
	if ls_field_name = "ic_area" then
		lb_IsICAreaExists = true
		if ads_mapping_field.object.key_field[i] = 1 then lb_IsICAreaKeyField = true
	end if
	if ls_field_name = "product_id" then
		lb_IsProductIDExists = true
		if ads_mapping_field.object.key_field[i] = 1 then lb_IsProductIDKeyField = true
	end if
	if ls_field_name = "product_type" then
		lb_IsProductTypeExists = true
		if ads_mapping_field.object.key_field[i] = 1 then lb_IsProductTypeKeyField = true
	end if
	if ls_field_name = "contact_type2" then lb_IsContactType2Exists = true
	if ls_field_name = "first_name" then lb_IsFirstNameExists = true
	if ls_field_name = "last_name" then lb_IsLastNameExists = true
	if ls_field_name = "category" then lb_IsCTXCategory = true //Added By Ken.Guo 2011-03-16.
	if ls_field_name = "role_id" then lb_IsRoleId = true		//Added By Mark Lee 04/16/2014
	if ls_field_name = "user_id" then lb_IsUserId = true
	if ls_field_name = "idp_user_id" then lb_IsIDPUserId = true
	if ls_field_name = "idp_server_id" then lb_IsIDPServerId = true		
	
	//Added By Ken.Guo 2017-04-11
	if ls_field_name = "contract_id" then lb_IsContractId = true	
	if ls_field_name = "contract_salesforce_id" then lb_IsContractSFId = true
	if ls_imp_field_name = "folderid" then lb_IsFolderId = true
	if ls_field_name = "image_file" then lb_IsDocumentContent = true
	if ls_field_name = 'filename' then lb_IsDocFileName = true  //Added By Harry 2017-09-15
	
	// Increase key field count
	if ads_mapping_field.object.key_field[i] = 1 then li_KeyFieldCount ++
	
	// Check field name if null
	if IsNull(ls_field_name) or Len(ls_field_name) <= 0 then
		li_Return = of_Log(ab_IsImport, "ContractLogix field can not be null. (" +ls_label + " is '" + ls_imp_field_name + "')", as_ErrorText[])
		if ab_IsImport then Return li_Return
	end if	
	if IsNull(ls_imp_field_name) then
		if IsNull(ads_mapping_field.object.facility_id[i]) then
			li_Return = of_Log(ab_IsImport, ls_label + " can not be null. (ContractLogix field is '" + ls_field_name_allias + "')", as_ErrorText[])
			if ab_IsImport then Return li_Return
		end if
	else
		if Len(ls_imp_field_name) <= 0 then
			li_Return = of_Log(ab_IsImport, ls_label + " can not be null. (ContractLogix field is '" + ls_field_name_allias + "')", as_ErrorText[])
			if ab_IsImport then Return li_Return
		end if
	end if
next

If as_table_name = 'ctx_custom' Then li_KeyFieldCount = 1//add by gavins 20120207

//Added By Ken.Guo 2017-04-12. export to SF should include folderid.
If  il_sync_salesforce = 1  and lower(is_sf_objectname) = 'document' and as_table_name = 'ctx_am_document' and Not lb_IsFolderId Then 
	li_Return = of_Log(ab_IsImport, "Sync Fields 'FolderID' is required .", as_ErrorText[])
End If


//////////////////////////////////////////////////////////////////////////////////////////////
// Check key field
if li_KeyFieldCount = 0 then
	li_Return = of_Log(ab_IsImport, "There is no key field.", as_ErrorText[])
	if ab_IsImport then Return li_Return
end if

//////////////////////////////////////////////////////////////////////////////////////////////
// Check particular table
choose case as_table_name
	case "ctx_products"
		if not lb_IsProductIDExists then
			li_Return = of_Log(ab_IsImport, "'Product Id' field is required.", as_ErrorText[])
			if ab_IsImport then Return li_Return
		end if
		if not lb_IsProductIDKeyField then
			li_Return = of_Log(ab_IsImport, "'Product Id' field must be key field.", as_ErrorText[])
			if ab_IsImport then Return li_Return
		end if
		if not lb_IsProductTypeExists then
			li_Return = of_Log(ab_IsImport, "'Product Type' field is required.", as_ErrorText[])
			if ab_IsImport then Return li_Return
		end if
		if not lb_IsProductTypeKeyField then
			li_Return = of_Log(ab_IsImport, "'Product Type' field must be key field.", as_ErrorText[])
			if ab_IsImport then Return li_Return
		end if
		
	case "ctx_contract_contacts"
		if not lb_IsICAreaExists then
			li_Return = of_Log(ab_IsImport, "'Ic Area' field is required.", as_ErrorText[])
			if ab_IsImport then Return li_Return
		end if
		if not lb_IsICAreaKeyField then
			li_Return = of_Log(ab_IsImport, "'Ic Area' field must be key field.", as_ErrorText[])
			if ab_IsImport then Return li_Return
		end if

	case "ctx_contacts"
		if not lb_IsFirstNameExists then
			li_Return = of_Log(ab_IsImport, "'First Name' field is required.", as_ErrorText[])
			if ab_IsImport then Return li_Return
		end if
		if not lb_IsLastNameExists then
			li_Return = of_Log(ab_IsImport, "'Last Name' field is required.", as_ErrorText[])
			if ab_IsImport then Return li_Return
		end if

	case "app_facility"
		if not lb_IsContactType2Exists then
			li_Return = of_Log(ab_IsImport, "'Contact Type2' field is required.", as_ErrorText[])
			if ab_IsImport then Return li_Return
		end if
		
	//Added By Ken.Guo 2011-03-16.	
	case "ctx_basic_info"
		If not lb_IsCTXCategory Then
			li_Return = of_Log(ab_IsImport, "'Category' field is required.", as_ErrorText[])
			if ab_IsImport then Return li_Return			
		End If		

//Added By Mark Lee 04/16/2014
	case "security_users"
		if not lb_IsRoleId then 
			li_Return = of_Log(ab_IsImport, "'Rold Id' field is required.", as_ErrorText[])
			if ab_IsImport then Return li_Return		
		end if 
		if not lb_IsUserId then 
			li_Return = of_Log(ab_IsImport, "'User Id' field is required.", as_ErrorText[])
			if ab_IsImport then Return li_Return		
		end if 	
	case "idp_users"
		if not lb_IsIDPUserId then 
			li_Return = of_Log(ab_IsImport, "'Idp User Id' field is required.", as_ErrorText[])
			if ab_IsImport then Return li_Return		
		end if 
		if not lb_IsIDPServerId then 
			li_Return = of_Log(ab_IsImport, "'Idp Server Id' field is required.", as_ErrorText[])
			if ab_IsImport then Return li_Return		
		end if 	
	case 'ctx_am_document' //Added By Ken.Guo 2017-04-11
		If is_ImportType = '2' Then
			If Not lb_IsContractId and Not lb_IsContractSFId Then
				li_Return = of_Log(ab_IsImport, "'Contract ID' field or 'Contract Salesforce ID' field is required.", as_ErrorText[])
				if ab_IsImport then Return li_Return		
			End If
			If lb_IsContractId and lb_IsContractSFId Then
				li_Return = of_Log(ab_IsImport, "'Contract ID' field and 'Contract Salesforce ID' field can’t be included together in the same time. Please remove one of them. ", as_ErrorText[])
				if ab_IsImport then Return li_Return					
			End If
			If Not lb_IsDocumentContent and il_sync_salesforce = 0 Then
				li_Return = of_Log(ab_IsImport, "'Document Content' field is required.", as_ErrorText[])
				if ab_IsImport then Return li_Return				
			End If	
		End If	
		
		If Not lb_IsDocFileName Then //Added by Harry 2017-09-15
			li_Return = of_Log(ab_IsImport, "'FileName' field is required.", as_ErrorText[])
			if ab_IsImport then Return li_Return		
		End If
		If not lb_IsCTXCategory Then //Added by Harry 2017-09-15
			li_Return = of_Log(ab_IsImport, "'Category' field is required.", as_ErrorText[])
			if ab_IsImport then Return li_Return			
		End If		

end choose

// Return
if ab_IsImport then
	Return 1
else
	Return UpperBound(as_ErrorText)
end if
end function

public function integer of_datapopulateproc ();any  la_OldValue
any  la_NewValue
long ll_ctx_id
long ll_facility_id
long ll_contact_id
long ll_Row
long ll_FindRow
long ll_RowCount
long ll_ImportDataRow
integer li_add_protocol
integer i, li_FieldCount
integer li_KeyFieldCount
integer li_KeyFieldIndex[]
string  ls_FindValue
string  ls_table_name
string  ls_KeyField1[]
string  ls_KeyField2[], ls_NullKey[] //add by gavins 20120207
boolean lb_IsAdd
boolean lb_IsNewRow[]
long    ll_SetDefValueRow[]
long ll_insert_row,ll_nullrow[] //Added By Jay Chen 11-01-2013
string 	ls_user_id
n_cst_copy_ctx lnv_copy_ctx  //Added By Harry 2017-09-07
n_import_ds lds_ctx_template //Added By Harry 2017-09-08
String ls_sql_ctx_temp  //Added By Harry 2017-09-08
String ls_syntax  //Added By Harry 2017-09-08
String ls_Error  //Added By Harry 2017-09-08
Int li_exist_template //Added By Harry 2017-09-21
Boolean lb_exist_template_field = false //Added By Harry 2017-09-21
Long ll_import_id  //Added By Harry 2017-09-21
Long ll_template_id  //Added By Harry 2017-09-21
DataStore lds_template //Added By Harry 2017-09-21
String ls_basic_key_value[]   //Added By Harry 2017-09-27
Boolean lb_exists_key  //Added By Harry 2017-09-27

// Set progress bar
ll_RowCount = ids_intellisoft_table_temp.RowCount()
if ll_RowCount <= 0 then Return 1
w_import_progressbar.of_SetImportProcessDesc("Populate data")
w_import_progressbar.of_SetMaxPosition(ll_RowCount + 2)

li_add_protocol = ids_import_hdr.object.add_protocol[1]
ls_table_name = Lower(ids_table_record.object.table_name[ids_table_record.GetRow()])
li_FieldCount = ids_mapping_field.RowCount()
ids_newrow.Reset()

// Dynamic create find column
li_KeyFieldCount = of_GetKeyFields(li_KeyFieldIndex[], ls_KeyField1[])
If ls_Table_Name = 'ctx_custom' Then//add by gavins 20120207
	li_KeyFieldCount = 0 
	ls_KeyField1 = ls_NullKey
End If
ls_KeyField2[] = ls_KeyField1[]
choose case ls_table_name
	case "ctx_basic_info", "app_facility", "security_users" 
	case "ctx_contacts"
		ls_KeyField1[li_KeyFieldCount + 1] = "facility_id"
		ls_KeyField2[li_KeyFieldCount + 1] = "sys_facility_id"
	case "ctx_contacts_numbers"
		ls_KeyField1[li_KeyFieldCount + 1] = "contact_id"
		ls_KeyField2[li_KeyFieldCount + 1] = "sys_contact_id"
	case "ctx_contract_contacts"
		ls_KeyField1[li_KeyFieldCount + 1] = "ctx_id"
		ls_KeyField1[li_KeyFieldCount + 2] = "contact_id"
		ls_KeyField2[li_KeyFieldCount + 1] = "sys_pc_id"
		ls_KeyField2[li_KeyFieldCount + 2] = "sys_contact_id"
	case "ctx_custom_multi_detail"
		ls_KeyField1[li_KeyFieldCount + 1] = "ctx_id"
		ls_KeyField1[li_KeyFieldCount + 2] = "hdr_id"
		ls_KeyField2[li_KeyFieldCount + 1] = "sys_pc_id"
		ls_KeyField2[li_KeyFieldCount + 2] = "sys_hdr_id"
	case "idp_users"			//Added By Mark Lee 04/22/2014
		ls_KeyField1[li_KeyFieldCount + 1] = "map_user_id"
		ls_KeyField2[li_KeyFieldCount + 1] = "sys_user_id"
	case "ctx_am_document"  //Added by Harry 2017-09-15
		ls_KeyField1[li_KeyFieldCount + 1] = "ctx_id"
		ls_KeyField2[li_KeyFieldCount + 1] = "sys_pc_id"
	case else // Child table of ctx_basic_info
		ls_KeyField1[li_KeyFieldCount + 1] = "ctx_id"
		ls_KeyField2[li_KeyFieldCount + 1] = "sys_pc_id"
end choose
ids_intellisoft_table.of_CreateFindColumn(ls_KeyField1[])
ids_intellisoft_table_temp.of_CreateFindColumn(ls_KeyField2[])
w_import_progressbar.of_SkipNextPosition()


//Added by Harry 2017-09-11
il_new_ctx_template = 0
if ls_table_name =  "ctx_basic_info" then	
	//Added by Harry 2017-09-21
	ll_import_id = ids_import_hdr.GetItemNumber(1,'import_id')
	SELECT ISNULL(COUNT(*),0) INTO :li_exist_template  
	FROM import_table_records, import_mapping_fields  
	WHERE import_table_records.table_records_id = import_mapping_fields.table_records_id AND 
			  import_table_records.import_id = :ll_import_id AND
			  import_mapping_fields.isoft_field_id = (SELECT import_fields.field_id FROM import_fields WHERE table_id = 1001 AND field_name = 'come_from');
	If li_exist_template > 0 Then lb_exist_template_field = True
	
	if il_ctx_template_id > 0 or lb_exist_template_field = True then	
		if il_ctx_template_id > 0 then ll_template_id = il_ctx_template_id
		if not isvalid (lds_template) then 
			lds_template = Create DataStore
			lds_template.dataobject = "d_use_templates_list"
			lds_template.settransobject(sqlca)
			lds_template.retrieve(gs_user_id)
		end if
		for ll_Row = 1 to ll_RowCount	
			//Added By Harry 2017-09-21
			if lb_exist_template_field then
				ls_FindValue = Trim(ids_intellisoft_table_temp.GetItemString(ll_Row, 'come_from'))
				if isnumber(ls_FindValue) then
					ll_FindRow = lds_template.Find("id = " + ls_FindValue + " or template_name = '" + ls_FindValue + "'" , 1, lds_template.rowcount())
				else
					ll_FindRow = lds_template.Find("template_name = '" + ls_FindValue + "'" , 1, lds_template.rowcount())
				end if
				
				if ll_FindRow > 0 then
					ll_template_id = lds_template.GetItemNumber(ll_FindRow,'id')
				else
					if il_ctx_template_id > 0 then
						ll_template_id = il_ctx_template_id
					else
						ll_template_id = 0
					end if
				end if
			end if
			
			if ll_template_id <= 0 then Continue
			
			// Find Key Field
			ls_FindValue = ids_intellisoft_table_temp.GetItemString(ll_Row, IS_KEY_FIELD)
			ll_FindRow = ids_intellisoft_table.of_Find(IS_KEY_FIELD, ls_FindValue, false)
			if ll_FindRow > 0 then Continue
			
			//Added By Harry 2017-09-27
			lb_exists_key = false
			for i = 1 to upperbound(ls_basic_key_value[])
				if ls_FindValue = ls_basic_key_value[i] then
					lb_exists_key = true
					Exit
				end if
			next 
			if lb_exists_key then Continue
			ls_basic_key_value[upperbound(ls_basic_key_value[]) + 1] = ls_FindValue
			
			if not isvalid(lnv_copy_ctx) then lnv_copy_ctx = Create n_cst_copy_ctx
			ll_ctx_id =  lnv_copy_ctx.of_copy_ctx_from_template(ll_template_id )
			
			if not isvalid(lds_ctx_template) then lds_ctx_template = Create n_import_ds
			
			ls_sql_ctx_temp = ids_intellisoft_table.getsqlselect( )
			if pos(ls_sql_ctx_temp, " WHERE ") > 0 then
				ls_sql_ctx_temp += " and ctx_id = " + String(ll_ctx_id)
			else
				ls_sql_ctx_temp += " WHERE ctx_id = " + String(ll_ctx_id)
			end if
			
			ls_syntax = lds_ctx_template.describe("datawindow.syntax") 
			if isnull(ls_syntax) or ls_syntax = '' then
				ls_Syntax =  ids_intellisoft_table.describe("datawindow.syntax") 
				lds_ctx_template.Create(ls_Syntax, ls_Error)
				if ls_Error <> '' then
					gnv_debug.of_output(True, "Failed to dynamically create CTX template DataWindow." + ls_Error)
					gnv_debug.of_output(True, "ls_Syntax = " + ls_Syntax)
					of_Log(0, "", IL_ERRTYPE_MAPDESIGN, "Failed to dynamically create CTX template DataWindow." + ls_Error)
				end if
			end if
			
			lds_ctx_template.SetTransObject( SQLCA )
			lds_ctx_template.SetSQLSelect(ls_sql_ctx_temp)
			lds_ctx_template.Retrieve()
			
			// Replace value of lds_ctx_template with ids_intellisoft_table_TEMP
			for i = 1 to li_FieldCount
				if lb_exist_template_field  then  //Added by Harry 2017-09-21
					if Lower(lds_ctx_template.describe("#" + string(i) + ".Name"))= 'come_from' then Continue 
				end if
				la_OldValue = lds_ctx_template.object.data[1, i]
				la_NewValue = ids_intellisoft_table_temp.object.data[ll_Row, i]
				if IsNull(la_OldValue) and IsNull(la_NewValue) then Continue
				if la_OldValue = la_NewValue then
				else
					lds_ctx_template.SetItem(1, i, la_NewValue)
				end if
			next
			lds_ctx_template.update( )
			//lds_ctx_template.RowsCopy(1,  lds_ctx_template.RowCount(), Primary!, ids_intellisoft_table, ids_intellisoft_table.RowCount() + 1, Primary!)  //Added by Harry 2017-09-27
			il_new_ctx_template ++
		next
	end if
end if

if il_new_ctx_template > 0 then 
	//commit;
	ids_intellisoft_table.Retrieve( )
	ids_intellisoft_table.of_CreateFindColumn(ls_KeyField1[])
else
	ids_intellisoft_table.setrow(1)
end if


// Populate data according to key fields
if ls_table_name = 'ctx_basic_info' then gl_mod_ctx_id[] = ll_nullrow[] //Added By Jay Chen 11-01-2013
for ll_Row = 1 to ll_RowCount
	// Ignore null row
	w_import_progressbar.of_SkipNextPosition()
	ll_ImportDataRow = ids_intellisoft_table_temp.GetItemNumber(ll_Row, "imp_row")
	if ids_intellisoft_table_temp.of_IsNullRow(ll_Row, li_KeyFieldIndex[], li_KeyFieldCount) then
		Continue
	end if
	
	// Find Key Field
	ls_FindValue = ids_intellisoft_table_temp.GetItemString(ll_Row, IS_KEY_FIELD)
	ll_FindRow = ids_intellisoft_table.of_Find(IS_KEY_FIELD, ls_FindValue, true)
//messagebox("syntax", ids_intellisoft_table_temp.describe("datawindow.syntax"))
	if ll_FindRow > 0 then
		lb_IsAdd = false
		il_CurrTableModifyCount ++
	else
		lb_IsAdd = true
		ll_FindRow = Abs(ll_FindRow)
		choose case ls_table_name
			case "ctx_basic_info"				
				if li_add_protocol = 0 then
					of_Log(ll_ImportDataRow, "Key Field", IL_ERRTYPE_MAPDESIGN, "When 'No Match Setting'='Generate Error', it's not allowed to add new contract.")
					if not of_IsContinue() then Return -1
					Continue
				end if
			case "ctx_products", "ctx_contract_contacts", "ctx_fee_sched_nm", "ctx_custom" //"ctx_custom"add by gavins 20120207
				ll_ctx_id = ids_intellisoft_table_temp.GetItemNumber(ll_Row, "sys_pc_id")
				if ll_ctx_id > 0 then
					ids_intellisoft_table.SetItem(ll_FindRow, "ctx_id", ll_ctx_id)
				else
					Continue
				end if
				if ls_table_name = "ctx_contract_contacts" then
					ll_contact_id = ids_intellisoft_table_temp.GetItemNumber(ll_Row, "sys_contact_id")
					if ll_contact_id > 0 then
						ids_intellisoft_table.SetItem(ll_FindRow, "contact_id", ll_contact_id)
					else
						Continue
					end if
				end if
			case "ctx_contacts"
				ll_facility_id = ids_intellisoft_table_temp.GetItemNumber(ll_Row, "sys_facility_id")
				if ll_facility_id > 0 then
					ids_intellisoft_table.SetItem(ll_FindRow, "facility_id", ll_facility_id)
				else
					Continue
				end if
			case "ctx_contacts_numbers"
				ll_contact_id = ids_intellisoft_table_temp.GetItemNumber(ll_Row, "sys_contact_id")
				if ll_contact_id > 0 then
					ids_intellisoft_table.SetItem(ll_FindRow, "contact_id", ll_contact_id)
				else
					Continue
				end if
			case "ctx_custom_multi_hdr"
				ll_ctx_id = ids_intellisoft_table_temp.GetItemNumber(ll_Row, "sys_pc_id")
				if ll_ctx_id > 0 then
					ids_intellisoft_table.SetItem(ll_FindRow, "ctx_id", ll_ctx_id)
				else
					Continue
				end if
			case "ctx_custom_multi_detail"
				ll_ctx_id = ids_intellisoft_table_temp.GetItemNumber(ll_Row, "sys_pc_id")
				if ll_ctx_id > 0 then
					ids_intellisoft_table.SetItem(ll_FindRow, "ctx_id", ll_ctx_id)
				else
					Continue
				end if
				ll_contact_id = ids_intellisoft_table_temp.GetItemNumber(ll_Row, "sys_hdr_id")
				if ll_contact_id > 0 then
					ids_intellisoft_table.SetItem(ll_FindRow, "hdr_id", ll_contact_id)
				else
					Continue
				end if
			case "idp_users"		//Added By Mark Lee 04/22/2014
				ls_user_id = ids_intellisoft_table_temp.GetItemString(ll_Row, "sys_user_id")
				if not isnull(ls_user_id) and trim(ls_user_id) <> "" then
					ids_intellisoft_table.SetItem(ll_FindRow, "map_user_id", ls_user_id)
				else
					Continue
				end if
			case "ctx_am_document"  //Added by Harry 2017-09-15
				ll_ctx_id = ids_intellisoft_table_temp.GetItemNumber(ll_Row, "sys_pc_id")
				if ll_ctx_id > 0 then
					ids_intellisoft_table.SetItem(ll_FindRow, "ctx_id", ll_ctx_id)
				else
					Continue
				end if
//				ll_contact_id = ids_intellisoft_table_temp.GetItemNumber(ll_Row, "sys_doc_id")
//				if ll_contact_id > 0 then
//					ids_intellisoft_table.SetItem(ll_FindRow, "doc_id", ll_contact_id)
//				else
//					Continue
//				end if
		end choose
		il_CurrTableAddCount ++
		ids_newrow.InsertRow(0)
		ids_newrow.SetItem(il_CurrTableAddCount, "new_row", ll_FindRow)
		ids_newrow.SetItem(il_CurrTableAddCount, "imp_row", ll_ImportDataRow)

	end if
	lb_IsNewRow[upperbound(lb_IsNewRow) + 1] = lb_IsAdd
	ll_SetDefValueRow[upperbound(ll_SetDefValueRow) + 1] = ll_FindRow
		
	// Replace value of ids_intellisoft_table with ids_intellisoft_table_TEMP
	for i = 1 to li_FieldCount
		if lb_exist_template_field  then  //Added by Harry 2017-09-21
			if Lower(ids_intellisoft_table.describe("#" + string(i) + ".Name"))= 'come_from' then Continue 
		end if
		la_OldValue = ids_intellisoft_table.object.data[ll_FindRow, i]
		la_NewValue = ids_intellisoft_table_temp.object.data[ll_Row, i]
		if IsNull(la_OldValue) and IsNull(la_NewValue) then Continue
		if la_OldValue = la_NewValue then
		else
			ids_intellisoft_table.SetItem(ll_FindRow, i, la_NewValue)
		end if
	next


	// Other operations
	choose case ls_table_name
		case "ctx_basic_info"
			// Record row number of sys_pc_id(ctx_id)
			ids_imp_data.SetItem(ll_ImportDataRow, "sys_pc_id", ll_FindRow)
		case "app_facility"
			// Record row number of sys_facility_id
			ids_imp_data.SetItem(ll_ImportDataRow, "sys_facility_id", ll_FindRow)
		case "ctx_contacts"
			// Record row number of sys_contact_id
			ids_imp_data.SetItem(ll_ImportDataRow, "sys_contact_id", ll_FindRow)
			//Begin - Added By Mark Lee 04/23/2014		if exists the (user id) value, we need set it.
			ls_user_id = ids_intellisoft_table_temp.GetItemString(ll_Row, "sys_user_id")
			if not isnull(ls_user_id) and trim(ls_user_id) <> "" then
				ids_intellisoft_table.SetItem(Abs(ll_FindRow), "user_d", ls_user_id)
			end if
			//End - Added By Mark Lee 04/23/2014
		case "ctx_custom_multi_hdr"	
			ids_imp_data.SetItem(ll_ImportDataRow, "sys_hdr_id", ll_FindRow)
		case "security_users"	//Added By Mark Lee 04/17/2014
			// Record row number of sys_user_id
			ids_imp_data.SetItem(ll_ImportDataRow, "sys_user_id", string(ll_FindRow))
		case "ctx_am_document"  //Added by Harry 2017-09-15
			ids_imp_data.SetItem(ll_ImportDataRow, "sys_doc_id", ll_FindRow)
	end choose
	
	//Added By Jay Chen 11-01-2013 
	if lower(ls_table_name) = "ctx_basic_info" then
		if not lb_IsAdd then 
			gl_mod_ctx_id[upperbound(gl_mod_ctx_id) + 1] = ids_intellisoft_table.getitemnumber(ll_FindRow,"ctx_id")
		end if
	end if
	//End Add		
next


// Stop import data
if of_IsStopImport() then Return -1

// Set default value with project's default value
of_SetDefaultValue(ls_table_name, lb_IsNewRow[], ll_SetDefValueRow[])

//check import data 		//Added By Mark Lee 04/23/2014
if of_checkimportdata(ls_table_name, lb_IsNewRow[], ll_SetDefValueRow[]) <= 0 then Return -1

if ls_table_name = "ctx_am_document" then  //Added by Harry 2017-09-20
	ib_Doc_IsNewRow[] = lb_IsNewRow[]
	il_Doc_SetDefValueRow[] = ll_SetDefValueRow[]
end if


if isvalid(lnv_copy_ctx) then Destroy lnv_copy_ctx  //Added by Harry 2017-09-07
if isvalid(lds_ctx_template) then Destroy lds_ctx_template //Added by Harry 2017-09-08
if isvalid(lds_template) then Destroy lds_template //Added By Harry 2017-09-21
Return 1
end function

public function integer of_set_ctx_basic_info_def (ref datastore ads_data, long al_row, boolean ab_isadd);// Set default value with hard code
if ab_IsAdd then
	ads_data.SetItem(al_Row, "version_number", "1.0")
	ads_data.SetItem(al_Row, "version_date", DateTime(Today(), Now()))
	ads_data.SetItem(al_Row, "master_contract_id", 0)
end if

// Set default value with Project's value
if IsNull(ads_data.object.status[al_Row]) then
	if IsNull(ids_import_hdr.object.ctx_status[1]) then
	else
		ads_data.SetItem(al_Row, "status", ids_import_hdr.object.ctx_status[1])
	end if
end if
if IsNull(ads_data.object.category[al_Row]) then
	if IsNull(ids_import_hdr.object.ctx_category[1]) then
	else
		ads_data.SetItem(al_Row, "category", ids_import_hdr.object.ctx_category[1])
	end if
end if
if IsNull(ads_data.object.app_facility[al_Row]) then
	if IsNull(ids_import_hdr.object.ctx_app_facility[1]) then
	else
		ads_data.SetItem(al_Row, "app_facility", ids_import_hdr.object.ctx_app_facility[1])
	end if
end if
if IsNull(ads_data.object.contract_type[al_Row]) then
	if IsNull(ids_import_hdr.object.ctx_contract_type[1]) then
	else
		ads_data.SetItem(al_Row, "contract_type", ids_import_hdr.object.ctx_contract_type[1])
	end if
end if
if IsNull(ads_data.object.dvision[al_Row]) then
	if IsNull(ids_import_hdr.object.ctx_dvision[1]) then
	else
		ads_data.SetItem(al_Row, "dvision", ids_import_hdr.object.ctx_dvision[1])
	end if
end if

Return 1
end function

public function integer of_set_ctx_contacts_def (ref datastore ads_data, long al_row);// Set default value with Project's value
/*
if IsNull(ads_data.object.user_d[al_Row]) then
	ads_data.SetItem(al_Row, "user_d", ids_import_hdr.object.cta_user_id[1])
end if
if IsNull(ads_data.object.first_name[al_Row]) then
	ads_data.SetItem(al_Row, "first_name", ids_import_hdr.object.cta_first_name[1])
end if
if IsNull(ads_data.object.last_name[al_Row]) then
	ads_data.SetItem(al_Row, "last_name", ids_import_hdr.object.cta_last_name[1])
end if
if IsNull(ads_data.object.contact_type[al_Row]) then
	ads_data.SetItem(al_Row, "contact_type", ids_import_hdr.object.cta_contact_type[1])
end if


if IsNull(ads_data.object.facility_id[al_Row]) then
	if IsNull(ids_import_hdr.object.cta_facility_id[1]) then
		if il_facility_id_def > 0 then
			ads_data.SetItem(al_Row, "facility_id", il_facility_id_def)
		end if
	else
		ads_data.SetItem(al_Row, "facility_id", ids_import_hdr.object.cta_facility_id[1])
	end if
end if
*/


Return 1
end function

public function integer of_set_ctx_contract_contacts_def (ref datastore ads_data, long al_row);string ls_ic_area

// Set default value
ls_ic_area = ads_data.object.ic_area[al_Row]
if (IsNull(ls_ic_area)) or not (ls_ic_area = "I" or ls_ic_area = "E") then
	if IsNull(ids_import_hdr.object.ctxcta_ic_area[1]) then
		ads_data.SetItem(al_Row, "ic_area", "I")
	else
		// Set value with Project's default value
		ads_data.SetItem(al_Row, "ic_area", ids_import_hdr.object.ctxcta_ic_area[1])
	end if
end if

Return 1
end function

public function integer of_set_app_facility_def (ref datastore ads_data, long al_row, boolean ab_isadd);string ls_contact_type2

// Set default value with hard code
if ab_IsAdd and IsNull(ads_data.object.corp_office_flag[al_Row]) then
	ads_data.SetItem(al_Row, "corp_office_flag", 0)
end if

//Added By Jay Chen 10-30-2015 set facility status
if ab_IsAdd and IsNull(ads_data.object.status[al_Row]) then
	ads_data.SetItem(al_Row, "status", 'A')
end if
//end add

ls_contact_type2 = ads_data.object.contact_type2[al_Row]
if (IsNull(ls_contact_type2)) or not (ls_contact_type2 = "A" or ls_contact_type2 = "B" or ls_contact_type2 = "O") then
	ads_data.SetItem(al_Row, "contact_type2", "B")
end if

Return 1
end function

public function integer of_setdefaultvalue (string as_table_name, ref boolean ab_isnewrow[], ref long al_setdefvaluerow[]);long i, ll_RowCount

ll_RowCount = UpperBound(al_SetDefValueRow)

for i = 1 to ll_RowCount
	choose case as_table_name
		case "ctx_basic_info"
			// Set default value
			of_set_ctx_basic_info_def(ids_intellisoft_table, al_SetDefValueRow[i], ab_IsNewRow[i])
		case "app_facility"
			// Set default value
			of_set_app_facility_def(ids_intellisoft_table, al_SetDefValueRow[i], ab_IsNewRow[i])
		case "ctx_contract_contacts"
			// Set default value
			of_set_ctx_contract_contacts_def(ids_intellisoft_table, al_SetDefValueRow[i])
		case "security_users"				//Added By Mark Lee 04/17/2014
			of_set_security_users_def(ids_intellisoft_table, al_SetDefValueRow[i], ab_IsNewRow[i])
		case "ctx_contacts"
//			of_set_ctx_contacts_def(ids_intellisoft_table, al_SetDefValueRow[i] )		
			//Added By Jay Chen 10-30-2015 set contacts status
			if ab_IsNewRow[i] and IsNull(ids_intellisoft_table.object.status[al_SetDefValueRow[i]]) then
				ids_intellisoft_table.SetItem(al_SetDefValueRow[i], "status", 'A')
			end if
			//end add
		case "ctx_am_document"  //Added by harry 2017-09-19
			of_set_ctx_am_document_def(ids_intellisoft_table, al_SetDefValueRow[i], ab_IsNewRow[i])
	end choose
next

Return 1
end function

public function integer of_set_security_users_def (ref datastore ads_data, long al_row, boolean ab_isadd);// Set default value with hard code
if ab_IsAdd then
	ads_data.SetItem(al_Row, "user_password", "123")
end if

// Set default value with Project's value
if ab_IsAdd and IsNull(ads_data.object.image_flag[al_Row]) then
	ads_data.SetItem(al_Row, "image_flag", 0)
end if
if ab_IsAdd and IsNull(ads_data.object.contract_default_view[al_Row]) then
	ads_data.SetItem(al_Row, "contract_default_view", 1001)
end if
if ab_IsAdd and IsNull(ads_data.object.readonly[al_Row]) then
	ads_data.SetItem(al_Row, "readonly", 0)
end if
//if ab_IsAdd and IsNull(ads_data.object.set_autoret[al_Row]) then
//	ads_data.SetItem(al_Row, "set_autoret", 0)
//end if
if ab_IsAdd and IsNull(ads_data.object.run_date_alarm[al_Row]) then
	ads_data.SetItem(al_Row, "run_date_alarm", 1)
end if
if ab_IsAdd and IsNull(ads_data.object.set_autoresize[al_Row]) then
	ads_data.SetItem(al_Row, "set_autoresize", 1)
end if
if ab_IsAdd and IsNull(ads_data.object.getting_started[al_Row]) then
	ads_data.SetItem(al_Row, "getting_started", 1)
end if
if ab_IsAdd and IsNull(ads_data.object.autoexport[al_Row]) then
	ads_data.SetItem(al_Row, "autoexport", 0)
end if
if ab_IsAdd and IsNull(ads_data.object.contract_display_mode[al_Row]) then
	ads_data.SetItem(al_Row, "contract_display_mode", 0)
end if
if ab_IsAdd and IsNull(ads_data.object.dynamic_search_tab[al_Row]) then
	ads_data.SetItem(al_Row, "dynamic_search_tab", 0)
end if
if ab_IsAdd and IsNull(ads_data.object.doc_auto_retrieve[al_Row]) then
	ads_data.SetItem(al_Row, "doc_auto_retrieve", 0)
end if
if ab_IsAdd and IsNull(ads_data.object.refresh_sertifi[al_Row]) then
	ads_data.SetItem(al_Row, "refresh_sertifi", 1)
end if
if ab_IsAdd and IsNull(ads_data.object.refresh_sertifi_dm[al_Row]) then
	ads_data.SetItem(al_Row, "refresh_sertifi_dm", 1)
end if
if ab_IsAdd and IsNull(ads_data.object.check_email[al_Row]) then
	ads_data.SetItem(al_Row, "check_email", 1)
end if
if ab_IsAdd and IsNull(ads_data.object.disabled_status[al_Row]) then
	ads_data.SetItem(al_Row, "disabled_status", 0)
end if

Return 1
end function

public function string of_existscheckedvalue (string as_tablename, string as_column, string as_arrvalue[], string as_type, ref string as_output_table);string 	ls_arrvalue, ls_return, ls_sql
long 		i, ll_count, ll_exists, ll_id

ls_return = ""
as_output_table = ""
gnv_string.of_delete_duplicate( as_arrvalue)

ll_count = UpperBound(as_arrvalue)
for i =1 to ll_count 
	ll_exists = 0 
	if lower(as_tablename) = 'security_users' and lower(as_column) = 'role_id' then 
		ll_id = long(as_arrvalue[i])
		select top 1 1 into :ll_exists from security_roles where role_id = :ll_id using sqlca;
		
		if ll_exists <> 1 then 
			as_output_table = "security_roles"
			return as_arrvalue[i]
		end if 
	end if 
next 

return ls_return
end function

public function integer of_checkimportdata (string as_table_name, boolean ab_isnewrow[], long al_setdefvaluerow[]);long 			i, 	ll_RowCount, ll_row, ll_find,	ll_idp_server_id
boolean		lbn_isnew
string 		ls_map_user_id, ls_idp_user_id, ls_filter


ll_RowCount = UpperBound(al_SetDefValueRow)
if ll_RowCount > 0 then
	for i = 1 to ll_RowCount
		ll_row = al_SetDefValueRow[i]
		lbn_isnew = ab_isnewrow[i]
		choose case as_table_name
			case "idp_users"
				ll_idp_server_id = ids_intellisoft_table.object.idp_server_id[ll_row]
				ls_map_user_id = ids_intellisoft_table.object.map_user_id[ll_row]
				ls_idp_user_id = ids_intellisoft_table.object.idp_user_id[ll_row]
				
				ls_filter = " idp_user_id='"+ls_idp_user_id+"' and idp_server_id="+string(ll_idp_server_id)
				ll_find = ids_intellisoft_table.find(ls_filter, 1, ids_intellisoft_table.rowcount())
				//find the reappear key value
				if ll_find > 0 and ll_find = ll_row then 
					if  ll_row < ids_intellisoft_table.rowcount()   then 
						ll_find = ids_intellisoft_table.find(ls_filter, ll_row+ 1, ids_intellisoft_table.rowcount())
					else
						ll_find = 0 
					end if
				end if 
				
				if ll_find > 0 then
					of_Log(0, "duplicate value", IL_ERRTYPE_ADDVERIFY, "You can only import one record with "+ls_filter+ " into table "+as_table_name+" .")
					return -1
				end if 			
		end choose
	next
end if

Return 1
end function

public function integer of_checkmapping (boolean ab_isimport, long al_table_id, string as_table_name, ref datastore ads_import_field, ref datastore ads_mapping_field, ref string as_errortext[], string as_project, datastore ads_table_record);//<Overwrite this function>
string  ls_field_name
string  ls_field_name_allias
string  ls_imp_field_name
string ls_dddw_field_name1, ls_dddw_field_name2, ls_Return
string ls_dddw_field_name3, ls_dddw_field_name4
integer li_Return, li_row
integer li_KeyFieldCount
integer i, li_FieldCount
boolean lb_IsProductIDExists = false
boolean lb_IsProductIDKeyField = false 
boolean lb_IsProductTypeExists = false
boolean lb_IsProductTypeKeyField = false
boolean lb_IsICAreaExists = false
boolean lb_IsICAreaKeyField = false
boolean lb_IsFirstNameExists = false
boolean lb_IsLastNameExists = false
boolean lb_IsContactType2Exists = false
boolean lb_IsCTXCategory = false //Added By Ken.Guo 2011-03-16.
boolean lb_IsRoleId = false		//Added By Mark Lee 04/16/2014
boolean lb_IsUserId = false	
boolean lb_IsIDPUserId = false
boolean lb_IsIDPServerId = false
boolean lb_SFID= false
boolean lb_SFContactID = false
boolean lb_OurCompanyID = false
boolean lb_facilityID = false
boolean lb_CtxID = false
boolean lb_appfacility = false
string ls_label
boolean lb_IsContractId = false  //Added By Ken.Guo 2017-04-11
boolean lb_IsContractSFId = false //Added By Ken.Guo 2017-04-11
boolean lb_IsFolderId = false //Added By Ken.Guo 2017-04-11
boolean lb_IsDocumentContent = false //Added By Ken.Guo 2017-04-11
 
//////////////////////////////////////////////////////////////////////////////////////////////
// There is no creation mapped relationship
li_FieldCount = ads_mapping_field.RowCount()
if li_FieldCount <= 0 then
	li_Return = of_Log(ab_IsImport, "No mapping relationship was created.", as_ErrorText[])
	if ab_IsImport then Return li_Return
	Return 1 //Have one error
end if

//////////////////////////////////////////////////////////////////////////////////////////////
//Added By Jay Chen 12-22-2014
Window	lw_activewindow
if isvalid(w_mdi) then
	lw_activewindow = w_mdi.GetActiveSheet( )
	if isvalid(lw_activewindow) then
		if lw_activewindow.classname( ) = 'w_import_painter' then 
			ls_label = 'Import field'
		else
			ls_label = 'Sync field'
		end if
	end if
end if
//end
// Check IntelliSoft field name
for i = 1 to li_FieldCount
	// Get field name
	ls_field_name = Lower(Trim(ads_mapping_field.object.field_name[i]))
	ls_field_name_allias = ads_mapping_field.object.field_name_allias[i]
	ls_imp_field_name = Lower(Trim(ads_mapping_field.object.imp_field_name[i]))
	
	
	// Set flags
	if ls_field_name = "ic_area" then
		lb_IsICAreaExists = true
		if ads_mapping_field.object.key_field[i] = 1 then lb_IsICAreaKeyField = true
	end if
	if ls_field_name = "product_id" then
		lb_IsProductIDExists = true
		if ads_mapping_field.object.key_field[i] = 1 then lb_IsProductIDKeyField = true
	end if
	if ls_field_name = "product_type" then
		lb_IsProductTypeExists = true
		if ads_mapping_field.object.key_field[i] = 1 then lb_IsProductTypeKeyField = true
	end if
	if ls_field_name = "contact_type2" then lb_IsContactType2Exists = true
	if ls_field_name = "first_name" then lb_IsFirstNameExists = true
	if ls_field_name = "last_name" then lb_IsLastNameExists = true
	if ls_field_name = "category" then
		lb_IsCTXCategory = true //Added By Ken.Guo 2011-03-16.
		ls_dddw_field_name4 =  ads_mapping_field.object.lu_field_name[i]
	End If
	if ls_field_name = "role_id" then lb_IsRoleId = true		//Added By Mark Lee 04/16/2014
	if ls_field_name = "user_id" then lb_IsUserId = true
	if ls_field_name = "idp_user_id" then lb_IsIDPUserId = true
	if ls_field_name = "idp_server_id" then lb_IsIDPServerId = true		
	if ls_field_name = "salesforce_id" then lb_SFID = true		
	if ls_field_name = "sfcontact_id" then lb_SFContactID = true	
	if ls_field_name = "ourcontact_id" then lb_OurCompanyID = true
	
	//Added By Ken.Guo 2017-04-11
	if ls_field_name = "contract_id" then lb_IsContractId = true	
	if ls_field_name = "contract_salesforce_id" then lb_IsContractSFId = true
	if ls_imp_field_name = "folderid" then lb_IsFolderId = true
	if ls_field_name = "image_file" then lb_IsDocumentContent = true
		
	if ls_field_name = "app_facility" then 
		lb_appfacility = true
		ls_dddw_field_name3 =  ads_mapping_field.object.lu_field_name[i]
	End If
	if ls_field_name = "facility_id" then 
		lb_facilityID = true
		ls_dddw_field_name2 =  ads_mapping_field.object.lu_field_name[i]
	End If
	if ls_field_name = "ctx_id" then
		lb_CtxID = true
		ls_dddw_field_name1 =  ads_mapping_field.object.lu_field_name[i]
	End If
	// Increase key field count
	if ads_mapping_field.object.key_field[i] = 1 then li_KeyFieldCount ++
	
	// Check field name if null
	if IsNull(ls_field_name) or Len(ls_field_name) <= 0 then
//		li_Return = of_Log(ab_IsImport, "ContractLogix field can not be null. (import field is '" + ls_imp_field_name + "')", as_ErrorText[])
		li_Return = of_Log(ab_IsImport, "ContractLogix field can not be null. (" +ls_label + " is '" + ls_imp_field_name + "')", as_ErrorText[])
		if ab_IsImport then Return li_Return
	end if	
	if IsNull(ls_imp_field_name) then
		if IsNull(ads_mapping_field.object.facility_id[i]) then
//			li_Return = of_Log(ab_IsImport, "Import field can not be null. (ContractLogix field is '" + ls_field_name_allias + "')", as_ErrorText[])
			li_Return = of_Log(ab_IsImport, ls_label + " can not be null. (ContractLogix field is '" + ls_field_name_allias + "')", as_ErrorText[])
			if ab_IsImport then Return li_Return
		end if
	else
		if Len(ls_imp_field_name) <= 0 then
//			li_Return = of_Log(ab_IsImport, "Import field can not be null. (ContractLogix field is '" + ls_field_name_allias + "')", as_ErrorText[])
			li_Return = of_Log(ab_IsImport, ls_label + " can not be null. (ContractLogix field is '" + ls_field_name_allias + "')", as_ErrorText[])
			if ab_IsImport then Return li_Return
		end if
	end if
	
	ls_Return = this.of_checkmapfieldvalue( ads_mapping_field, ads_import_field, as_table_name, ls_field_name ,  i ) //added by gavins 20140729
	If Len( ls_Return ) > 0 Then li_Return = of_Log(ab_IsImport, ls_Return, as_ErrorText[])
	if ab_IsImport then Return li_Return
next

//Added By Ken.Guo 2017-04-12. export to SF should include folderid.
If  il_sync_salesforce = 1 and lower(is_sf_objectname) = 'document' and as_table_name = 'ctx_am_document' and Not lb_IsFolderId Then 
	li_Return = of_Log(ab_IsImport, "Sync Fields 'FolderID' is required .", as_ErrorText[])
End If


//////////////////////////////////////////////////////////////////////////////////////////////
//Added by Harry  20170321 for task749
if il_sync_salesforce = 1 then
	if ab_IsImport then
		Return 1
	else
		Return UpperBound(as_ErrorText)
	end if
end if

// Check key field
if li_KeyFieldCount = 0 and (ads_table_record.RowCount( ) = 1 Or as_table_name = 'ctx_basic_info'  ) then
	li_Return = of_Log(ab_IsImport, "There is no key field.", as_ErrorText[])
	if ab_IsImport then Return li_Return
end if

If isnull( ls_dddw_field_name1 ) Then ls_dddw_field_name1 = ""
//////////////////////////////////////////////////////////////////////////////////////////////
// Check particular table
choose case as_table_name
	case "ctx_custom", "ctx_custom_multi_hdr", "ctx_fee_sched_nm"
		if not lb_CtxID  Then
			li_Return = of_Log(ab_IsImport, "'CTX Id' field is a required  field and its Lu type should be 'Contract' and its Lu field should be salesforce id.", as_ErrorText[])
			if ab_IsImport then Return li_Return
		End If	
		If ( lb_CtxID and Trim( ls_dddw_field_name1 ) <> 'salesforce_id' ) Then
			li_Return = of_Log(ab_IsImport, "'CTX Id' field is a required  field and its Lu type should be 'Contract' and its Lu field should be salesforce id.", as_ErrorText[])
			if ab_IsImport then Return li_Return
		End If	
//		if not lb_SFID   then//added by gavins 20140505
//			li_Return = of_Log(ab_IsImport, "'Salesforce ID' field is required.", as_ErrorText[])
//			if ab_IsImport then Return li_Return
//		end if
	case "ctx_products"
		if not lb_IsProductIDExists then
			li_Return = of_Log(ab_IsImport, "'Product Id' field is required.", as_ErrorText[])
			if ab_IsImport then Return li_Return
		end if
		if not lb_IsProductIDKeyField then
			li_Return = of_Log(ab_IsImport, "'Product Id' field must be key field.", as_ErrorText[])
			if ab_IsImport then Return li_Return
		end if
		if not lb_IsProductTypeExists then
			li_Return = of_Log(ab_IsImport, "'Product Type' field is required.", as_ErrorText[])
			if ab_IsImport then Return li_Return
		end if
		if not lb_IsProductTypeKeyField then
			li_Return = of_Log(ab_IsImport, "'Product Type' field must be key field.", as_ErrorText[])
			if ab_IsImport then Return li_Return
		end if
		if not lb_CtxID  or ( lb_CtxID and Trim( ls_dddw_field_name1 ) <> 'salesforce_id' ) Then
			li_Return = of_Log(ab_IsImport,  "'CTX Id' field is a required  field and its Lu type should be 'Contract' and its Lu field should be salesforce id.", as_ErrorText[])
			if ab_IsImport then Return li_Return
		End If		
		 If ( lb_CtxID and Trim( ls_dddw_field_name1 ) <> 'salesforce_id' ) Then
			li_Return = of_Log(ab_IsImport,  "'CTX Id' field is a required  field and its Lu type should be 'Contract' and its Lu field should be salesforce id.", as_ErrorText[])
			if ab_IsImport then Return li_Return
		End If
	case "ctx_contract_contacts"
		if  lb_IsICAreaExists then
			li_Return = of_Log(ab_IsImport, "'Ic Area' field can not be selected.", as_ErrorText[])
			if ab_IsImport then Return li_Return
		end if
//		if not lb_IsICAreaKeyField then
//			li_Return = of_Log(ab_IsImport, "'Ic Area' field must be key field.", as_ErrorText[])
//			if ab_IsImport then Return li_Return
//		end if
			
//		if not lb_SFContactID   then
//			li_Return = of_Log(ab_IsImport, "'Salesforce contact id' field is required.", as_ErrorText[])
//			if ab_IsImport then Return li_Return
//		end if
		
	case "ctx_contacts"
		
		li_Row = ads_table_record.Find( "table_name='app_facility' or table_name='ctx_basic_info'", 1, ads_table_record.RowCount( ) )
		if not lb_IsFirstNameExists and li_Row = 0  then
			li_Return = of_Log(ab_IsImport, "'First Name' field is required.", as_ErrorText[])
			if ab_IsImport then Return li_Return
		end if
		if not lb_IsLastNameExists and li_Row = 0  then
			li_Return = of_Log(ab_IsImport, "'Last Name' field is required.", as_ErrorText[])
			if ab_IsImport then Return li_Return
		end if
//		if not lb_SFID   then//added by gavins 20140505
//			li_Return = of_Log(ab_IsImport, "'Salesforce ID' field is required.", as_ErrorText[])
//			if ab_IsImport then Return li_Return
//		end if
		if Not lb_facilityID Then
			li_Return = of_Log(ab_IsImport, "'Facility ID' field is a required  field and its Lu type should be 'Company' and its Lu field should be salesforce id.", as_ErrorText[])
			if ab_IsImport then Return li_Return
		End If
		if isnull( ls_dddw_field_name2 ) then ls_dddw_field_name2 = ""
		if ( lb_facilityID and Trim( ls_dddw_field_name2 ) <> 'salesforce_id' ) Then
			li_Return = of_Log(ab_IsImport, "'Facility ID' field is a required  field and its Lu type should be 'Company' and its Lu field should be salesforce id.", as_ErrorText[])
			if ab_IsImport then Return li_Return
		End If
		
	case "app_facility"
		li_Row = ads_table_record.Find( "table_name='ctx_contacts' or table_name='ctx_basic_info'", 1, ads_table_record.RowCount( ) )
		if not lb_IsContactType2Exists and li_Row=0   and as_project = ""  then
			li_Return = of_Log(ab_IsImport, "'Contact Type2' field is required.", as_ErrorText[])
			if ab_IsImport then Return li_Return
		end if
//		if not lb_SFID   then
//			li_Return = of_Log(ab_IsImport, "'Salesforce ID' field is required.", as_ErrorText[])
//			if ab_IsImport then Return li_Return
//		end if
	//Added By Ken.Guo 2011-03-16.	
	case "ctx_basic_info"
		li_Row = ads_table_record.Find( "table_name='ctx_contract_contacts' ", 1, ads_table_record.RowCount( ) )
		If not lb_IsCTXCategory and ( li_Row > 0 or ads_table_record.RowCount( ) = 1 ) and as_project = "" Then
			li_Return = of_Log(ab_IsImport, "'Category' field is required.", as_ErrorText[])
			if ab_IsImport then Return li_Return			
		End If		
		if isnull( ls_dddw_field_name3 ) then ls_dddw_field_name3 = ""
		if ( lb_appfacility and Trim( ls_dddw_field_name3 ) <> 'salesforce_id' ) Then
			//Added By Jay Chen 02-09-2015
			if isvalid(w_import_salesforcepainter) then
				if w_import_salesforcepainter.il_sync_salesforce <> 1 then 
					li_Return = of_Log(ab_IsImport, "'App Facility' field is a required  field and its Lu type should be 'Company' and its Lu field should be salesforce id.", as_ErrorText[])
				end if
			else
				li_Return = of_Log(ab_IsImport, "'App Facility' field is a required  field and its Lu type should be 'Company' and its Lu field should be salesforce id.", as_ErrorText[])
			end if
			//end
//			li_Return = of_Log(ab_IsImport, "'App Facility' field is a required  field and its Lu type should be 'Company' and its Lu field should be salesforce id.", as_ErrorText[])
			if ab_IsImport then Return li_Return
		End If
//		if isnull( ls_dddw_field_name4 ) then ls_dddw_field_name4 = ""
//		if ( lb_IsCTXCategory and ( Trim( ls_dddw_field_name4 ) = '' or  isnull( ls_dddw_field_name4 ) ) ) Then
//			li_Return = of_Log(ab_IsImport, "'Category' field is a required  field and its Lu type should be 'Code-Contract Category' and its Lu field cannot be empty.", as_ErrorText[])
//			if ab_IsImport then Return li_Return
//		End If
//		if not lb_SFID   then
//			li_Return = of_Log(ab_IsImport, "'Salesforce ID' field is required.", as_ErrorText[])
//			if ab_IsImport then Return li_Return
//		end if
//Added By Mark Lee 04/16/2014
	case "security_users"
		if not lb_IsRoleId then 
			li_Return = of_Log(ab_IsImport, "'Rold Id' field is required.", as_ErrorText[])
			if ab_IsImport then Return li_Return		
		end if 
		if not lb_IsUserId then 
			li_Return = of_Log(ab_IsImport, "'User Id' field is required.", as_ErrorText[])
			if ab_IsImport then Return li_Return		
		end if 	
	case "idp_users"
		if not lb_IsIDPUserId then 
			li_Return = of_Log(ab_IsImport, "'Idp User Id' field is required.", as_ErrorText[])
			if ab_IsImport then Return li_Return		
		end if 
		if not lb_IsIDPServerId then 
			li_Return = of_Log(ab_IsImport, "'Idp Server Id' field is required.", as_ErrorText[])
			if ab_IsImport then Return li_Return		
		end if 
	case 'ctx_am_document' //Added By Ken.Guo 2017-04-11
		If Not lb_IsContractId and Not lb_IsContractSFId Then
			li_Return = of_Log(ab_IsImport, "'Contract ID' field or 'Contract Salesforce ID' field is required.", as_ErrorText[])
			if ab_IsImport then Return li_Return		
		End If
		If lb_IsContractId and lb_IsContractSFId Then
			li_Return = of_Log(ab_IsImport, "'Contract ID' field and 'Contract Salesforce ID' field can’t be included together in the same time. Please remove one of them. ", as_ErrorText[])
			if ab_IsImport then Return li_Return					
		End If
		If Not lb_IsDocumentContent and il_sync_salesforce = 0 Then
			li_Return = of_Log(ab_IsImport, "'Document Content' field is required.", as_ErrorText[])
			if ab_IsImport then Return li_Return				
		End If				
end choose

// Return
if ab_IsImport then
	Return 1
else
	Return UpperBound(as_ErrorText)
end if
end function

public function string of_checkmapfieldvalue (datastore ads_mapfield, datastore ads_importfield, string as_tablename, string as_columnname, integer ai_row);//
n_cst_string		ln_string
DataStore		lds_Table
String				ls_Column, ls_Type, ls_Style, ls_Visible, ls_FValue
string 			ls_Temp[], ls_Temp2[], ls_ddlbValue[],ls_Filter
String				ls_ImportFieldName, ls_DDDW, ls_Tag, ls_dddwField, ls_values
Integer			li_i, li_k
Long				ll_Frow, ll_FRow2
boolean			lb_Exists


If as_Tablename = 'app_facility' Then
	lds_Table = Create DataStore
	lds_Table.DataObject = 'd_facility_detail'
ElseIf as_Tablename = 'ctx_contacts' Then
	lds_Table = Create DataStore
	lds_Table.DataObject = 'd_cntx_master'
End If

If ads_mapfield.RowCount( ) = 0 Then Return ''

//Choose Case as_columnname
//	case 'ctx_id'
//		ls_DDDW = ads_mapfield.GetItemString( ai_row, 'lu_table' )
//		ls_dddwField = ads_mapfield.GetItemString( ai_row, 'lu_field_name' ) 
//		If  isnull( ls_dddw ) Or trim( ls_dddw) = '' Or lower(ls_DDDW )<> 'contract'  Then
//			lb_Exists = true
//		End If
//		If  isnull( ls_dddwField ) Or trim( ls_dddwField) = '' Or lower(ls_dddwField )<> 'salesforce_id'  Then
//			lb_Exists = true
//		End If
//		If lb_Exists Then return 'ctx id lu type must set Contract .'
//	case 'facility_id', 'app_facility'
//		ls_DDDW = ads_mapfield.GetItemString( ai_row, 'lu_table' )
//		ls_dddwField = ads_mapfield.GetItemString( ai_row, 'lu_field_name' ) 
//		If  isnull( ls_dddw ) Or trim( ls_dddw) = '' Or lower(ls_DDDW )<> 'company' Then
//			lb_Exists = true
//		End If
//		If  isnull( ls_dddwField ) Or trim( ls_dddwField) = '' Or lower(ls_dddwField )<> 'salesforce_id'  Then
//			lb_Exists = true
//		End If
//		If lb_Exists Then Return 'facility id lu type must set Company.'
//End Choose


If IsValid( lds_Table ) Then

	//For li_i = 1 To Long( lds_Table.Describe( "datawindow.column.count" ) )
	//	ls_Column = lds_Table.describe( "#" + string( li_i ) + ".name" )
	//	ls_Style = lds_Table.Describe("#" + string( li_i ) + ".Edit.Style" )
	//	ls_Visible =	lds_Table.Describe( "#"+string( li_i ) + ".Visible" ) 
	//ls_Column = lds_Table.describe( as_columnname + ".name" )
	ls_Style = lds_Table.Describe( as_columnname + ".Edit.Style" )
	ls_Tag = lds_Table.Describe( as_columnname + ".tag" )
	//ls_Visible =	lds_Table.Describe( as_columnname + ".Visible" ) 	
	
	//if not ( ls_Visible = "1" or Upper(ls_Visible) = "Y" )  then return 0
	//ll_FRow = ads_mapfield.Find( "field_name='"+as_columnname +"'",1, ads_mapfield.Rowcount( ) )
	//If ll_Frow <=0 Then return  0
	
	
	ls_ImportFieldName = ads_mapfield.GetItemString( ai_row, 'imp_field_name' )
	ll_FRow2 = ads_importfield.Find( "imp_field_name = '" +ls_ImportFieldName + "' and Len(default_value) > 0 " , 1, ads_Importfield.RowCount( ) )
	//If ll_FRow2 <=0 Then return 0
	Choose Case lower(ls_Style)
		Case "dddw"
			ls_DDDW = ads_mapfield.GetItemString( ai_row, 'lu_table' )
			ls_dddwField = ads_mapfield.GetItemString( ai_row, 'lu_field_name' ) 
			choose case lower( as_columnname  )
				case 'country' 
					If isnull( ls_dddw ) Or trim( ls_dddw) = '' Or lower(ls_DDDW ) <> 'country' Then lb_Exists = True
					If isnull( ls_dddwField ) Or trim( ls_dddwField) = '' Then lb_Exists = true
					If lb_Exists Then Return '"' +as_columnname + '" column’s Lu Type must be set to "country" and its Lu Field cannot be empty.'
				case 'state' 
					If isnull( ls_dddw ) Or trim( ls_dddw) = '' Or lower(ls_DDDW ) <> 'state' Then lb_Exists = True
					If isnull( ls_dddwField ) Or trim( ls_dddwField) = '' Then lb_Exists = true
					if is_ImportType <> '2' and il_sync_salesforce <> 0 Then //Added By Gavin.Jay 2017-04-10 for state issue 
						If lb_Exists Then Return  '"' +as_columnname + '" column’s Lu Type must be set to "state" and its Lu Field cannot be empty.'
					End If
				case 'contact_department' 
					If isnull( ls_dddw ) Or trim( ls_dddw) = '' Or lower(ls_DDDW ) <> lower(ls_Tag) Then lb_Exists = True
					If isnull( ls_dddwField ) Or trim( ls_dddwField) = '' Then lb_Exists = true
					If lb_Exists Then Return  '"' +as_columnname + '" column’s Lu Type must be set to "'+ ls_Tag + '" and its Lu Field cannot be empty.'
				case 'contact_title'
					If isnull( ls_dddw ) Or trim( ls_dddw) = '' Or lower(ls_DDDW ) <> lower(ls_Tag) Then lb_Exists = True
					If isnull( ls_dddwField ) Or trim( ls_dddwField) = '' Then lb_Exists = true
					If lb_Exists Then Return '"' +as_columnname + '" column’s Lu Type must be set to "'+ ls_Tag + '" and its Lu Field cannot be empty.'
				case 'contact_type'
					If isnull( ls_dddw ) Or trim( ls_dddw) = '' Or lower(ls_DDDW ) <> lower(ls_Tag) Then lb_Exists = True
					If isnull( ls_dddwField ) Or trim( ls_dddwField) = '' Then lb_Exists = true
					If lb_Exists Then Return '"' +as_columnname + '" column’s Lu Type must be set to "'+ ls_Tag + '" and its Lu Field cannot be empty.'
				case 'corp_office_link'
					If isnull( ls_dddw ) Or trim( ls_dddw) = '' Or lower(ads_mapfield.GetItemString( ai_row, 'lu_table') ) <> 'company' Then lb_Exists = True
					If lb_Exists Then Return '"' +as_columnname + '" column’s Lu Type must be set to "company" and its Lu Field cannot be empty.'
			End Choose	
			
		case "ddlb"
			ls_FValue = lds_Table.Describe(as_columnname+ ".values" )
			ln_String.of_parsetoarray( ls_FValue, '/' ,  ref  ls_Temp )
			For li_k = 1 To UpperBound( ls_Temp )
				ln_String.of_parsetoarray( ls_Temp[li_k], '~t', ref ls_Temp2 )	
				If UpperBound( ls_Temp2 ) > 1 Then
					ls_ddlbValue[UpperBound( ls_ddlbValue) + 1 ] =  ls_Temp2[2]
				End If
			Next
			If ll_FRow2 > 0 Then
				ls_values = ''
				For li_k = 1 To UpperBound( ls_ddlbValue )
					ls_values += ls_ddlbValue[ li_k ] + "," 
					If ls_ddlbValue[ li_k ] = Trim(ads_importfield.GetItemString( ll_FRow2, 'default_value' ) ) Then
						lb_Exists = True
					End If
				Next
				If not lb_Exists Then Return 'The default value of the import data’s "'+ls_ImportFieldName +'" column is not within the value range (' +ls_values +  ') of the column "' + as_columnname + '".'
			End If
	
		Case "checkbox"
			
		case "radiobutton"
			
		case 'edit'	
	End Choose
		
	//Next
End If









Return ''
end function

public function integer of_set_ctx_am_document_def (ref datastore ads_data, long al_row, boolean ab_isadd);//Added by Harry 2017-09-19
String ls_filename
String ls_doc_name
String ls_doc_ext
String ls_doc_type
Long ll_pos
Long ll_pos_dot
Long ll_doc_status

//if ab_IsAdd then
//	ads_data.SetItem(al_Row, "version_number", "1.0")
//	ads_data.SetItem(al_Row, "version_date", DateTime(Today(), Now()))
//	ads_data.SetItem(al_Row, "master_contract_id", 0)
//end if

// Set default value with Project's value
if ab_isadd then
	ls_filename = ads_data.object.filename[al_Row]
	ll_pos = LastPos ( ls_filename, '\' )
	ll_pos_dot = LastPos ( ls_filename, '.' )

	if IsNull(ads_data.object.revision[al_Row]) then
		ads_data.SetItem(al_Row, "revision", 1.0)
	end if 
	
	if IsNull(ads_data.object.base_type[al_Row]) then
		ads_data.SetItem(al_Row, "base_type", '3')
	end if
	
	if IsNull(ads_data.object.create_by[al_Row]) then
		ads_data.SetItem(al_Row, "create_by", gs_user_id)
	end if
	
	if IsNull(ads_data.object.status[al_Row]) then
		ll_doc_status = Long(gnv_data.of_getitem( 'code_lookup', 'lookup_code', "upper(lookup_name) = upper('Contract Document Status') and upper(code) = upper('New')"))
		ads_data.SetItem(al_Row, "status", ll_doc_status)
	end if
	
	if IsNull(ads_data.object.status_by[al_Row]) then
		ads_data.SetItem(al_Row, "status_by", gs_user_id)
	end if

	if IsNull(ads_data.object.status_date[al_Row]) then
		ads_data.SetItem(al_Row, "status_date", DateTime(Today()))
	end if

	if IsNull(ads_data.object.doc_type[al_Row]) then
		//ls_doc_type = gnv_data.of_getitem('code_lookup', 'code', "lookup_name = 'Contract Document Type' and code = 'Other'") 
		ads_data.SetItem(al_Row, "doc_type",  'Other')
	end if
	
	if IsNull(ads_data.object.doc_name[al_Row]) then
		ls_doc_name = Mid(ls_filename, ll_pos + 1, ll_pos_dot - ll_pos - 1)
		ads_data.SetItem(al_Row, "doc_name", ls_doc_name)
	end if
	
	if IsNull(ads_data.object.doc_ext[al_Row]) then
		ls_doc_ext = Mid(ls_filename, ll_pos_dot + 1)
		ads_data.SetItem(al_Row, "doc_ext", ls_doc_ext)
	end if
end if


Return 1
end function

on n_cst_import_contract.create
call super::create
end on

on n_cst_import_contract.destroy
call super::destroy
end on

