$PBExportHeader$w_import_salesforcepainter.srw
forward
global type w_import_salesforcepainter from w_response
end type
type tab_1 from tab within w_import_salesforcepainter
end type
type tabpage_hdr from userobject within tab_1
end type
type dw_browse from u_dw within tabpage_hdr
end type
type dw_imp_sql from u_dw within tabpage_hdr
end type
type dw_imp_hdr from u_dw within tabpage_hdr
end type
type tabpage_hdr from userobject within tab_1
dw_browse dw_browse
dw_imp_sql dw_imp_sql
dw_imp_hdr dw_imp_hdr
end type
type tabpage_field_data from userobject within tab_1
end type
type cb_create_value_list from commandbutton within tabpage_field_data
end type
type cb_com_wizard from commandbutton within tabpage_field_data
end type
type cb_edit_map from commandbutton within tabpage_field_data
end type
type dw_detail from u_dw within tabpage_field_data
end type
type dw_map_fields from u_dw within tabpage_field_data
end type
type dw_records from u_dw within tabpage_field_data
end type
type dw_fields from u_dw within tabpage_field_data
end type
type dw_tables from u_dw within tabpage_field_data
end type
type ln_1 from line within tabpage_field_data
end type
type ln_2 from line within tabpage_field_data
end type
type ln_4 from line within tabpage_field_data
end type
type ln_5 from line within tabpage_field_data
end type
type ln_3 from line within tabpage_field_data
end type
type dw_imp_field_detail from u_dw within tabpage_field_data
end type
type dw_field_list from u_dw within tabpage_field_data
end type
type dw_compute_verify from datawindow within tabpage_field_data
end type
type dw_prac_cont_id from u_dw within tabpage_field_data
end type
type tabpage_field_data from userobject within tab_1
cb_create_value_list cb_create_value_list
cb_com_wizard cb_com_wizard
cb_edit_map cb_edit_map
dw_detail dw_detail
dw_map_fields dw_map_fields
dw_records dw_records
dw_fields dw_fields
dw_tables dw_tables
ln_1 ln_1
ln_2 ln_2
ln_4 ln_4
ln_5 ln_5
ln_3 ln_3
dw_imp_field_detail dw_imp_field_detail
dw_field_list dw_field_list
dw_compute_verify dw_compute_verify
dw_prac_cont_id dw_prac_cont_id
end type
type tabpage_data from userobject within tab_1
end type
type dw_imp_data from u_dw within tabpage_data
end type
type gb_operation from groupbox within tabpage_data
end type
type cb_imp_data from commandbutton within tabpage_data
end type
type cb_imp_pro from commandbutton within tabpage_data
end type
type cb_savedata from commandbutton within tabpage_data
end type
type cb_get_saved from commandbutton within tabpage_data
end type
type cb_sort from commandbutton within tabpage_data
end type
type cb_filter from commandbutton within tabpage_data
end type
type tabpage_data from userobject within tab_1
dw_imp_data dw_imp_data
gb_operation gb_operation
cb_imp_data cb_imp_data
cb_imp_pro cb_imp_pro
cb_savedata cb_savedata
cb_get_saved cb_get_saved
cb_sort cb_sort
cb_filter cb_filter
end type
type tabpage_log from userobject within tab_1
end type
type dw_imp_table from u_dw within tabpage_log
end type
type dw_imp_proc from u_dw within tabpage_log
end type
type dw_imp_err from u_dw within tabpage_log
end type
type tabpage_log from userobject within tab_1
dw_imp_table dw_imp_table
dw_imp_proc dw_imp_proc
dw_imp_err dw_imp_err
end type
type tab_1 from tab within w_import_salesforcepainter
tabpage_hdr tabpage_hdr
tabpage_field_data tabpage_field_data
tabpage_data tabpage_data
tabpage_log tabpage_log
end type
type cb_preprocess from commandbutton within w_import_salesforcepainter
end type
end forward

global type w_import_salesforcepainter from w_response
integer x = 5
integer y = 4
integer width = 4375
integer height = 2224
string title = "Data Synchronization Painter"
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowtype windowtype = main!
long backcolor = 79680469
boolean center = false
event pfc_cst_edit_projects ( )
event pfc_cst_add ( )
event pfc_cst_delete ( )
event pfc_cst_copy ( )
event pfc_cst_lookup_mapping ( )
event pfc_cst_run_import ( )
event pfc_cst_check_mapping ( )
event pfc_cst_createimportfields ( )
event pfc_cst_auto_import ( )
event pfc_cst_copymap ( )
event pfc_cst_export_map ( )
event pfc_cst_import_map ( )
tab_1 tab_1
cb_preprocess cb_preprocess
end type
global w_import_salesforcepainter w_import_salesforcepainter

type prototypes

end prototypes

type variables
// Error information variables
string is_hdr_errinfo
string is_mapfield_errinfo

// Control drag variables
long il_DragRow
boolean ib_LockFile

// Import ID variables
long il_curr_import_id
long il_page2_import_id
long il_page3_import_id
long il_page4_import_id

// Import Type
integer ii_curr_isoft_module
integer ii_preprocess

// Import table
string is_curr_table_name

// Lookup table
DataStore ids_LookUpTableDDDW[2]

// Current mapped DW
integer ii_CurrMappedDW = 2

// Selected rows
long il_DragValue[]
long il_SelectedCount

// Control variables
boolean ib_PromptCreateImportField = true
boolean ib_IsIntelliCredApp = true
boolean ib_IsIntelliContract = true

boolean ib_isCopy = false
long il_pre_import_id

string	is_ImportType
string	is_sfuser, is_sfpwd, is_Result
str_sflogin_response   istr_SFResponse
Boolean	ib_ChangeData
long il_sync_salesforce //Added By Jay Chen 12-17-2014

Boolean		ibn_freeform_move = false													//Added By Mark Lee 10/29/2015
Boolean		ibn_freeform_move_down = false											//Added By Mark Lee 10/29/2015
long			il_freeform_move_x	= 0  													//Added By Mark Lee 10/29/2015
string 		is_freeform_cols[]																//Added By Mark Lee 10/30/2015
long			il_freeform_cols_x[]															//Added By Mark Lee 10/30/2015
integer 		ii_freeform_col_order = 0													//Added By Mark Lee 10/30/2015.

Boolean ib_set_page_color[] //Added By Ken.Guo 2016-03-22
end variables

forward prototypes
public function blob of_readfile (string as_file)
public subroutine of_createimportfield ()
public function integer of_getfieldfromtxt (string as_file, ref string as_fields[])
public function integer of_getfieldfromcsv (string as_file, ref string as_fields[])
public function integer of_getfieldfromformattxt (string as_file, string as_record_delimiter, string as_field_delimiter, ref string as_fields[])
public function integer of_getfieldfromodbc (string as_file, string as_odbc_name, string as_odbc_login, string as_odbc_password, string as_import_sql, ref string as_fields[])
public function integer of_begindrag (datawindow adw_data)
public subroutine of_completetrans (boolean ab_iscommit)
public function integer of_checkimportfieldname (long al_fieldcount, string as_importfields[])
public function integer of_getimportfields (ref string as_fields[])
public function integer of_setmenu (integer ai_index)
public function integer of_setmappeddwtitle (integer al_current)
public function string of_replaceblank (string as_string, string as_new)
public function string of_getcontractfieldfilter (datawindow adw_tables)
public function integer of_selectvalue (ref string as_value)
public function long of_getinsertrow (datawindow adw_table, long al_parent_table_id)
public function long of_getinsertrow (long al_table_id)
public function integer of_preprocess_data (integer li_process, string as_file_from, string as_file_to)
public function string of_correcttablename (string as_name)
public subroutine of_copy_field_data (long al_ori_import_id, long al_new_import_id)
public subroutine wf_importtype_control (string as_data)
public function boolean of_field_name_check (string as_fieldname)
public subroutine wf_setmapfielddefaultvalue (datawindow adw_field, integer ai_row)
end prototypes

event pfc_cst_edit_projects();long ll_project_id
long ll_CurrentRow
DataWindowChild ldwc_Child1
DataWindowChild ldwc_Child2

ll_CurrentRow = tab_1.tabpage_hdr.dw_browse.GetRow()
if ll_CurrentRow > 0 then
	ll_project_id = tab_1.tabpage_hdr.dw_browse.object.project_id[ll_CurrentRow]
else
	ll_project_id = 0
end if
OpenWithParm(w_import_project, ll_project_id)

if Message.StringParm <> "nochanged!" then
	tab_1.tabpage_hdr.dw_browse.GetChild("project_id", ldwc_Child1)
	tab_1.tabpage_hdr.dw_imp_hdr.GetChild("project_id", ldwc_Child2)
	ldwc_Child1.SetTransObject(SQLCA)
	ldwc_Child2.SetTransObject(SQLCA)
	gnv_appeondb.of_StartQueue()
	ldwc_Child1.Retrieve()
	ldwc_Child2.Retrieve()
	gnv_appeondb.of_CommitQueue()	
	tab_1.tabpage_hdr.dw_browse.SetRedraw(true)
	tab_1.tabpage_hdr.dw_imp_hdr.SetRedraw(true)
end if
end event

event pfc_cst_add();choose case tab_1.SelectedTab
	case 1
		tab_1.tabpage_hdr.Event ue_add()
	case 2
		tab_1.tabpage_field_data.Event ue_addimportfield()
end choose
end event

event pfc_cst_delete();choose case tab_1.SelectedTab
	case 1
		tab_1.tabpage_hdr.Event ue_delete()
	case 2
		tab_1.tabpage_field_data.Event ue_deleteimportfield()
end choose
end event

event pfc_cst_copy();//Modify By Jervis 12.18.2009
//tab_1.tabpage_hdr.Event ue_copyadd()
if this.event pfc_save() < 0 then return
this.ib_iscopy = true
tab_1.tabpage_hdr.Event ue_copyadd()
this.event pfc_save()
this.ib_iscopy = false
end event

event pfc_cst_lookup_mapping();string ls_IsChange
DataWindowChild ldwc_Child

Open(w_import_lookup_mapping)
ls_IsChange = Message.StringParm

if ls_IsChange = "YES!" then
	tab_1.tabpage_field_data.dw_detail.GetChild("lu_template", ldwc_Child)
	ldwc_Child.SetTransObject(SQLCA)
	ldwc_Child.Retrieve()
	ldwc_Child.InsertRow(1)
end if
end event

event pfc_cst_run_import();long ll_LastRow
n_cst_import_credapp lnv_import_credapp
n_cst_import_contract lnv_import_contract

if MessageBox("Run Sync", "Are you sure you want to run the selected sync?", Question!, YesNo!) = 2 then Return
SetPointer(HourGlass!)

// Import data
if ii_curr_isoft_module = 1 then
	lnv_import_credapp = Create n_cst_import_credapp
	lnv_import_credapp.of_Execute(il_curr_import_id, true)
	Destroy lnv_import_credapp
else
	lnv_import_contract = Create n_cst_import_contract
	lnv_import_contract.of_Execute(il_curr_import_id, true)
	Destroy lnv_import_contract
end if

// Display log
il_page4_import_id = -1
tab_1.SelectTab(4)
ll_LastRow = tab_1.tabpage_log.dw_imp_proc.RowCount()
tab_1.tabpage_log.dw_imp_proc.ScrollToRow(ll_LastRow)

SetPointer(Arrow!)
end event

event pfc_cst_check_mapping();tab_1.tabpage_field_data.Event ue_CheckMapping()
end event

event pfc_cst_createimportfields();ib_PromptCreateImportField = false
of_CreateImportField()
ib_PromptCreateImportField = true
end event

event pfc_cst_auto_import();Open(w_auto_import)
end event

event pfc_cst_copymap();tab_1.tabpage_field_data.Event ue_copymap()
end event

event pfc_cst_export_map();//====================================================================
// Event: pfc_cst_export_map
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:	Jay Chen		Date: 10-15-2015
//--------------------------------------------------------------------
//	Copyright (c) 2008-2014 ContractLogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
string ls_FilePath,ls_filename,ls_import_name
datastore lds_header,lds_fields_list,lds_table,lds_mapped_fields,lds_project,lds_template,lds_template_field,lds_mapped_isoft_field
long ll_row,ll_import_id,ll_result

ll_row = tab_1.tabpage_hdr.dw_browse.getrow()
if ll_row < 1 then
	messagebox('Contractlogix','Please select data synchronization first.')
	return
else
	ll_import_id = tab_1.tabpage_hdr.dw_browse.getitemnumber(ll_row,"import_id")
	ls_import_name = tab_1.tabpage_hdr.dw_browse.getitemstring(ll_row,"import_name")
end if

ll_result = GetFolder( "Select the folder for export defintion", ls_FilePath )
if ll_result <> 1 then return
ls_FilePath = ls_FilePath + '\import_defintion_' + ls_import_name + '_' + string(today(),'YYYYMMDD')
if not DirectoryExists(ls_FilePath) then
	CreateDirectory(ls_FilePath)
end if

lds_header = create datastore
lds_header.dataobject = 'd_export_header_detail'
lds_header.settransobject(sqlca)

lds_fields_list = create datastore
lds_fields_list.dataobject = 'd_export_import_fields'
lds_fields_list.settransobject(sqlca)

lds_table = create datastore
lds_table.dataobject = 'd_export_import_table'
lds_table.settransobject(sqlca)

lds_mapped_fields = create datastore
lds_mapped_fields.dataobject = 'd_export_mapped_fields'
lds_mapped_fields.settransobject(sqlca)

lds_project = create datastore
lds_project.dataobject = 'd_export_import_project'
lds_project.settransobject(sqlca)

lds_template = create datastore
lds_template.dataobject = 'd_export_import_template'
lds_template.settransobject(sqlca)

lds_template_field = create datastore
lds_template_field.dataobject = 'd_export_import_template_field'
lds_template_field.settransobject(sqlca)

lds_mapped_isoft_field = create datastore
lds_mapped_isoft_field.dataobject = 'd_export_mapped_isoft_field'
lds_mapped_isoft_field.settransobject(sqlca)

gnv_appeondb.of_startqueue()
lds_header.retrieve(ll_import_id)
lds_fields_list.retrieve(ll_import_id)
lds_table.retrieve(ll_import_id)
lds_mapped_fields.retrieve(ll_import_id)
lds_project.retrieve(ll_import_id)
lds_template.retrieve(ll_import_id)
lds_template_field.retrieve(ll_import_id)
lds_mapped_isoft_field.retrieve(ll_import_id)
gnv_appeondb.of_commitqueue()

ls_filename = ls_FilePath + '\import_header.txt'
if FileExists(ls_filename) then FileDelete(ls_filename) 
if lds_header.rowcount() > 0 then lds_header.SaveAs(ls_filename,Text!,True)

ls_filename = ls_FilePath + '\import_fields.txt'
if FileExists(ls_filename) then FileDelete(ls_filename) 
if lds_fields_list.rowcount() > 0 then lds_fields_list.SaveAs(ls_filename,Text!,True)

ls_filename = ls_FilePath + '\import_table.txt'
if FileExists(ls_filename) then FileDelete(ls_filename) 
if lds_table.rowcount() > 0 then lds_table.SaveAs(ls_filename,Text!,True)

ls_filename = ls_FilePath + '\mapped_fields.txt'
if FileExists(ls_filename) then FileDelete(ls_filename) 
if lds_mapped_fields.rowcount() > 0 then lds_mapped_fields.SaveAs(ls_filename,Text!,True)

ls_filename = ls_FilePath + '\import_project.txt'
if FileExists(ls_filename) then FileDelete(ls_filename) 
if lds_project.rowcount() > 0 then lds_project.SaveAs(ls_filename,Text!,True)

ls_filename = ls_FilePath + '\import_template.txt'
if FileExists(ls_filename) then FileDelete(ls_filename) 
if lds_template.rowcount() > 0 then lds_template.SaveAs(ls_filename,Text!,True)

ls_filename = ls_FilePath + '\import_template_fields.txt'
if FileExists(ls_filename) then FileDelete(ls_filename) 
if lds_template_field.rowcount() > 0 then lds_template_field.SaveAs(ls_filename,Text!,True)

ls_filename = ls_FilePath + '\mapped_isoft_field.txt'
if FileExists(ls_filename) then FileDelete(ls_filename) 
if lds_mapped_isoft_field.rowcount() > 0 then lds_mapped_isoft_field.SaveAs(ls_filename,Text!,True)

destroy lds_header
destroy lds_fields_list
destroy lds_table
destroy lds_mapped_fields
destroy lds_project
destroy lds_template
destroy lds_template_field
destroy lds_mapped_isoft_field

messagebox('Contractlogix','Export the data synchronization defintion to ' + ls_FilePath + ' success.')
end event

event pfc_cst_import_map();//====================================================================
// Event: pfc_cst_import_map
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  (none)
//--------------------------------------------------------------------
// Author:	Jay Chen		Date: 10-15-2015
//--------------------------------------------------------------------
//	Copyright (c) 2008-2014 ContractLogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

string ls_FilePath,ls_filename
datastore lds_header,lds_fields_list,lds_table,lds_mapped_fields,lds_project,lds_template,lds_template_field,lds_field_temp,lds_table_temp,lds_mapped_isoft_field
long ll_row,ll_import_id,ll_return,ll_result,ll_find,ll_cnt,k
string ls_old_name,ls_new_name,ls_field_name,ls_map_type,ls_lookup_table
long ll_project_id,ll_new_project_id,ll_new_import_id,ll_insert,ll_old_id,ll_new_id,ll_isoft_table
long ll_old_template,ll_new_template,ll_old_table,ll_new_table,ll_old_field,ll_new_field,ll_ilm_id,ll_lu_code,ll_new_lu_code
long ll_old_isoft_field_id,ll_new_isoft_field_id,ll_table_id,ll_allow_null,ll_field_len,ll_lookup_code
string ls_field_type,ls_field_name_allias,ls_string,ls_import_name,ls_null,ls_code
datawindowchild ldwc

ll_result = GetFolder( "Select the folder for data synchronization defintion", ls_FilePath )
if ll_result <> 1 then return

setnull(ls_null)
lds_header = create datastore
lds_header.dataobject = 'd_export_header_detail'
lds_header.settransobject(sqlca)
lds_fields_list = create datastore
lds_fields_list.dataobject = 'd_export_import_fields'
lds_fields_list.settransobject(sqlca)
lds_table = create datastore
lds_table.dataobject = 'd_export_import_table'
lds_table.settransobject(sqlca)
lds_mapped_fields = create datastore
lds_mapped_fields.dataobject = 'd_export_mapped_fields'
lds_mapped_fields.settransobject(sqlca)
lds_project = create datastore
lds_project.dataobject = 'd_export_import_project'
lds_project.settransobject(sqlca)
lds_template = create datastore
lds_template.dataobject = 'd_export_import_template'
lds_template.settransobject(sqlca)
lds_template_field = create datastore
lds_template_field.dataobject = 'd_export_import_template_field'
lds_template_field.settransobject(sqlca)
lds_field_temp = create datastore
lds_field_temp.dataobject = 'd_import_temp_field'
lds_table_temp = create datastore
lds_table_temp.dataobject = 'd_import_temp_table'
lds_mapped_isoft_field = create datastore
lds_mapped_isoft_field.dataobject = 'd_export_mapped_isoft_field'
lds_mapped_isoft_field.settransobject(sqlca)

ls_filename = ls_FilePath + '\import_header.txt'
if FileExists(ls_filename) then
	ll_return = lds_header.ImportFile(ls_filename, 2)
	if ll_return < 0 then
		lds_header.Reset()
		messagebox('Contractlogix','Failed to get import_header.txt data.')
		return
	end if
else
	messagebox('Contractlogix','Data synchronization defintion file can not find in the directory ' + ls_FilePath + '.')
	return
end if

ls_filename = ls_FilePath + '\import_fields.txt'
if FileExists(ls_filename) then
	ll_return = lds_fields_list.ImportFile(ls_filename, 2)
	if ll_return < 0 then
		lds_fields_list.Reset()
		messagebox('Contractlogix','Failed to get import_fields.txt data.')
		return
	end if
end if

ls_filename = ls_FilePath + '\import_table.txt'
if FileExists(ls_filename) then
	ll_return = lds_table.ImportFile(ls_filename, 2)
	if ll_return < 0 then
		lds_table.Reset()
		messagebox('Contractlogix','Failed to get import_table.txt data.')
		return
	end if
end if

ls_filename = ls_FilePath + '\mapped_fields.txt'
if FileExists(ls_filename) then
	ll_return = lds_mapped_fields.ImportFile(ls_filename, 2)
	if ll_return < 0 then
		lds_mapped_fields.Reset()
		messagebox('Contractlogix','Failed to get mapped_fields.txt data.')
		return
	end if
end if

ls_filename = ls_FilePath + '\mapped_isoft_field.txt'
if FileExists(ls_filename) then
	ll_return = lds_mapped_isoft_field.ImportFile(ls_filename, 2)
	if ll_return < 0 then
		lds_mapped_isoft_field.Reset()
		messagebox('Contractlogix','Failed to get mapped_isoft_field.txt data.')
		return
	end if
end if

ls_filename = ls_FilePath + '\import_project.txt'
if FileExists(ls_filename) then
	ll_return = lds_project.ImportFile(ls_filename, 2)
	if ll_return < 0 then
		lds_project.Reset()
		messagebox('Contractlogix','Failed to get import_project.txt data.')
		return
	end if
end if

ls_filename = ls_FilePath + '\import_template.txt'
if FileExists(ls_filename) then
	ll_return = lds_template.ImportFile(ls_filename, 2)
	if ll_return < 0 then
		lds_template.Reset()
		messagebox('Contractlogix','Failed to get import_template.txt data.')
		return
	end if
end if

ls_filename = ls_FilePath + '\import_template_fields.txt'
if FileExists(ls_filename) then
	ll_return = lds_template_field.ImportFile(ls_filename, 2)
	if ll_return < 0 then
		lds_template_field.Reset()
		messagebox('Contractlogix','Failed to get import_template_fields.txt data.')
		return
	end if
end if

//import header detail
if lds_header.rowcount( ) > 0 then
	ls_import_name = lds_header.getitemstring(1, "import_name")
	ls_string = ls_import_name + '_imp%'
	select count(*) into :ll_cnt from import_hdr where import_name like :ls_string;
	ls_new_name = ls_import_name + '_imp' +  string(ll_cnt + 1)
	lds_header.setitem(1,"import_name", ls_new_name)
	ll_project_id = lds_header.getitemnumber(1, "project_id")
	if ll_project_id > 0 then
		if lds_project.rowcount( ) > 0 then 
			ls_old_name = lds_project.getitemstring(1, "project_name")
			ls_string = ls_old_name + '_imp%'
			select count(*) into :ll_cnt from import_project where project_name like :ls_string;
			ls_new_name = ls_old_name + '_imp' +  string(ll_cnt + 1)
			lds_project.setitem(1,"project_name", ls_new_name)
			//handle project status,category,contract type,division,facility
			for k = 1 to 4
				ll_old_id = 0
				choose case k 
					case 1
						ll_lookup_code = lds_project.getitemnumber(1, "ctx_status")
						ls_code = lds_project.getitemstring(1, "status_name")
						ls_lookup_table = 'Contract Status'
					case 2
						ll_lookup_code = lds_project.getitemnumber(1, "ctx_category")
						ls_code = lds_project.getitemstring(1, "category_name")
						ls_lookup_table = 'Contract Category'
					case 3
						ll_lookup_code = lds_project.getitemnumber(1, "ctx_contract_type")
						ls_code = lds_project.getitemstring(1, "type_name")
						ls_lookup_table = 'Contract Type'
					case 4
						ll_lookup_code = lds_project.getitemnumber(1, "ctx_dvision")
						ls_code = lds_project.getitemstring(1, "division_name")
						ls_lookup_table = 'Contract Division'
				end choose
				if isnull(ll_lookup_code) or ll_lookup_code = 0 then continue
				select lookup_code into :ll_old_id from code_lookup WHERE lookup_name = :ls_lookup_table AND code = :ls_code;
				if isnull(ll_old_id) then ll_old_id = 0
				if ll_old_id = 0 then
					select Max(lookup_code) + 1 into :ll_new_lu_code from code_lookup;
					insert into code_lookup(lookup_code,lookup_name,code,description) values(:ll_new_lu_code,:ls_lookup_table,:ls_code,:ls_code);
					ll_new_id = ll_new_lu_code
				else
					ll_new_id = ll_old_id
				end if
				if k = 1 then
					lds_project.setitem(1,"ctx_status", ll_new_id)
				elseif k = 2 then
					lds_project.setitem(1,"ctx_category", ll_new_id)
				elseif k = 3 then
					lds_project.setitem(1,"ctx_contract_type", ll_new_id)
				elseif k = 4 then
					lds_project.setitem(1,"ctx_dvision", ll_new_id)
				end if
			next
			ll_old_id = 0
			ll_lookup_code = lds_project.getitemnumber(1, "ctx_app_facility")
			ls_code = lds_project.getitemstring(1, "facility_name")
			if isnull(ll_lookup_code) then ll_lookup_code = 0
			if ll_lookup_code > 0 then
				select facility_id into :ll_old_id from app_facility WHERE facility_name = :ls_code;
				if isnull(ll_old_id) then ll_old_id = 0
				if ll_old_id = 0 then
					select Max(facility_id) + 1 into :ll_new_id from app_facility;
					insert into app_facility(facility_id,facility_name) values(:ll_new_id,:ls_code);
				else
					ll_new_id = ll_old_id
				end if
				lds_project.setitem(1,"ctx_app_facility", ll_new_id)
			end if
			//end
			lds_project.update()
			select max(project_id) into :ll_new_import_id from import_project;
		end if
		lds_header.setitem(1, "project_id",ll_new_import_id)
	end if
	lds_header.setitem(1, "create_date",DateTime(Today(), Now()))
	lds_header.setitem(1, "mod_date",DateTime(Today(), Now()))
	lds_header.setitem(1, "mod_date",gs_user_id)
	lds_header.update()
	select max(import_id) into :ll_new_import_id from import_hdr;
end if
if isnull(ll_new_import_id) or ll_new_import_id = 0 then return 

//import fields
ll_insert = 0
ll_new_lu_code = 0
for ll_row = 1 to lds_fields_list.rowcount()
	lds_fields_list.setitem(ll_row, "import_id", ll_new_import_id )
	ll_old_id = lds_fields_list.getitemnumber(ll_row,"rec_id")
	ls_field_name = lds_fields_list.getitemstring(ll_row,"imp_field_name")
	ll_find = lds_field_temp.find("field_name = '"+ls_field_name+"' ", 1, lds_field_temp.rowcount())
	if isnull(ll_find) then ll_find = 0
	if ll_find = 0 then
		ll_insert = lds_field_temp.insertrow(0)
		lds_field_temp.setitem(ll_insert, "old_id",ll_old_id)
		lds_field_temp.setitem(ll_insert, "field_name",ls_field_name)
	end if
next
lds_fields_list.update()
lds_fields_list.reset()
lds_fields_list.retrieve(ll_new_import_id)
for ll_row = 1 to lds_field_temp.rowcount()
	ls_field_name = lds_field_temp.getitemstring(ll_row,"field_name")
	ll_find = lds_fields_list.find("imp_field_name = '"+ls_field_name+"' ", 1, lds_fields_list.rowcount())
	if ll_find > 0 then ll_new_id = lds_fields_list.getitemnumber(ll_find, "rec_id")
	lds_field_temp.setitem(ll_row,"new_id", ll_new_id)
next

//import table records
ll_insert = 0
ll_old_id = 0
ll_new_id = 0
for ll_row = 1 to lds_table.rowcount()
	lds_table.setitem(ll_row, "import_id", ll_new_import_id )
	ll_old_id = lds_table.getitemnumber(ll_row,"table_records_id")
	ll_isoft_table = lds_table.getitemnumber(ll_row,"isoft_table_id")
	ll_find = lds_table_temp.find("isoft_table_id = " + string(ll_isoft_table), 1, lds_table_temp.rowcount())
	if isnull(ll_find) then ll_find = 0
	if ll_find = 0 then
		ll_insert = lds_table_temp.insertrow(0)
		lds_table_temp.setitem(ll_insert, "old_id",ll_old_id)
		lds_table_temp.setitem(ll_insert, "isoft_table_id",ll_isoft_table)
	end if
next
lds_table.update()
lds_table.reset()
lds_table.retrieve(ll_new_import_id)
for ll_row = 1 to lds_table_temp.rowcount()
	ll_isoft_table = lds_table_temp.getitemnumber(ll_row,"isoft_table_id")
	ll_find = lds_table.find("isoft_table_id = " + string(ll_isoft_table), 1, lds_table.rowcount())
	if ll_find > 0 then ll_new_id = lds_table.getitemnumber(ll_find, "table_records_id")
	lds_table_temp.setitem(ll_row,"new_id", ll_new_id)
next

//import mapped fields
for ll_row = 1 to lds_mapped_fields.rowcount()
	ll_old_table = lds_mapped_fields.getitemnumber(ll_row, "table_records_id")
	ll_old_field = lds_mapped_fields.getitemnumber(ll_row, "import_field_id")
	ll_old_template = lds_mapped_fields.getitemnumber(ll_row, "lu_template")
	ll_find =  lds_table_temp.find("old_id = " + string(ll_old_table), 1, lds_table_temp.rowcount())
	if ll_find > 0 then ll_new_table =  lds_table_temp.getitemnumber(ll_find, "new_id")
	ll_find =  lds_field_temp.find("old_id = " + string(ll_old_field), 1, lds_field_temp.rowcount())
	if ll_find > 0 then ll_new_field =  lds_field_temp.getitemnumber(ll_find, "new_id")
	lds_mapped_fields.setitem(ll_row, "table_records_id", ll_new_table)
	lds_mapped_fields.setitem(ll_row, "import_field_id", ll_new_field)
	if isnull(ll_old_template) then ll_old_template = 0
	if ll_old_template > 0 then //import template
		ll_find = lds_template.find("ilm_id = " + string(ll_old_template), 1, lds_template.rowcount())
		if ll_find > 0 then 
			ls_old_name = lds_template.getitemstring(ll_find,"template_name")
			ls_string = ls_old_name + '_imp%'
			ls_map_type = lds_template.getitemstring(ll_find,"map_type")
			ls_lookup_table = lds_template.getitemstring(ll_find,"lookup_table")
		else
			continue
		end if
		select count(*) into :ll_cnt from import_lookup_mapping where template_name like :ls_string;
		ls_new_name = ls_old_name + '_imp' +  string(ll_cnt + 1)
		insert into import_lookup_mapping(map_type,lookup_table,template_name) values(:ls_map_type,:ls_lookup_table,:ls_new_name);
		select max(ilm_id) into :ll_new_template from import_lookup_mapping;
		lds_mapped_fields.setitem(ll_row, "lu_template", ll_new_template)
		for k = 1 to lds_template_field.rowcount() //template field
			ll_old_id = 0
			ll_ilm_id = lds_template_field.getitemnumber(k, "ilm_id")
			ll_lu_code = lds_template_field.getitemnumber(k, "is_lu_code")
			ls_code = lds_template_field.getitemstring(k, "code")
			select lookup_code into :ll_old_id from code_lookup WHERE lookup_name = :ls_lookup_table AND code = :ls_code;
			if isnull(ll_old_id) then ll_old_id = 0
			if ll_old_id = 0 then
				select Max(lookup_code) + 1 into :ll_new_lu_code from code_lookup;
				insert into code_lookup(lookup_code,lookup_name,code,description) values(:ll_new_lu_code,:ls_lookup_table,:ls_code,:ls_code);
				lds_template_field.setitem(k, "is_lu_code", ll_new_lu_code)
			else
				lds_template_field.setitem(k, "is_lu_code", ll_old_id)
			end if
			if ll_ilm_id = ll_old_template then
				lds_template_field.setitem(k, "ilm_id", ll_new_template)
			end if
		next
	end if
next
lds_template_field.update()

for ll_row = 1 to lds_mapped_fields.rowcount()
	ll_old_isoft_field_id = lds_mapped_fields.getitemnumber(ll_row, "isoft_field_id")
	ll_find = lds_mapped_isoft_field.find("field_id = " + string(ll_old_isoft_field_id), 1, lds_mapped_isoft_field.rowcount())
	if ll_find > 0 then
		ll_table_id = lds_mapped_isoft_field.getitemnumber(ll_find, "table_id")
		ls_field_name = lds_mapped_isoft_field.getitemstring(ll_find, "field_name")
		select field_id into :ll_new_isoft_field_id from import_fields where table_id = :ll_table_id and field_name = :ls_field_name;
		if isnull(ll_new_isoft_field_id) then ll_new_isoft_field_id = 0
		if ll_new_isoft_field_id > 0 then 
			lds_mapped_fields.setitem(ll_row, "isoft_field_id", ll_new_isoft_field_id)
		else
			ls_field_type = lds_mapped_isoft_field.getitemstring(ll_find, "field_type")
			ll_field_len = lds_mapped_isoft_field.getitemnumber(ll_find, "field_len")
			ls_field_name_allias = lds_mapped_isoft_field.getitemstring(ll_find, "field_name_allias")
			ll_allow_null = lds_mapped_isoft_field.getitemnumber(ll_find, "allow_null")
			select max(field_id) + 1 into :ll_new_isoft_field_id from import_fields;
			insert into import_fields(field_id,table_id,field_name,field_type,field_len,field_name_allias,allow_null)
			values(:ll_new_isoft_field_id,:ll_table_id,:ls_field_name,:ls_field_type,:ll_field_len,:ls_field_name_allias,:ll_allow_null);
			lds_mapped_fields.setitem(ll_row, "isoft_field_id", ll_new_isoft_field_id)
		end if
	end if
next
lds_mapped_fields.update()
commit;

//refresh data
tab_1.tabpage_hdr.dw_browse.settransobject(sqlca)
tab_1.tabpage_hdr.dw_browse.retrieve()
tab_1.tabpage_hdr.dw_browse.getchild("project_id", ldwc)
ldwc.settransobject(sqlca)
ldwc.retrieve()
tab_1.tabpage_hdr.dw_imp_hdr.getchild("project_id", ldwc)
ldwc.settransobject(sqlca)
ldwc.retrieve()
tab_1.tabpage_field_data.Event ue_init()
ll_find = tab_1.tabpage_hdr.dw_browse.find("import_id = " + string(ll_new_import_id), 1, tab_1.tabpage_hdr.dw_browse.rowcount())
if ll_find > 0 then
	tab_1.tabpage_hdr.dw_browse.setrow(ll_find)
	tab_1.tabpage_hdr.dw_browse.scrolltorow(ll_find)
	tab_1.tabpage_hdr.dw_browse.selectrow(0, false)
	tab_1.tabpage_hdr.dw_browse.selectrow(ll_find, true)
end if

destroy lds_header
destroy lds_fields_list
destroy lds_table
destroy lds_mapped_fields
destroy lds_project
destroy lds_template
destroy lds_template_field
destroy lds_mapped_isoft_field
destroy lds_field_temp
destroy lds_table_temp

messagebox('Contractlogix','Import the data synchronization defintion from ' + ls_FilePath + ' success.')
end event

public function blob of_readfile (string as_file);blob lblb_Data
blob lblb_Buf
long ll_Byte
integer li_FileNum

li_FileNum = FileOpen(as_File, StreamMode!, Read!, Shared!)
if li_FileNum = -1 then 
	SetNull(lblb_Data)
	Return lblb_Data
end if

do
	ll_Byte = FileRead(li_FileNum, lblb_Buf)
	if ll_Byte > 0 then
		lblb_Data += lblb_Buf
	else
		Exit
	end if
loop while true
FileClose(li_FileNum)

Return lblb_Data
end function

public subroutine of_createimportfield ();long i, j
long ll_FieldCount
long ll_CurrentRow
long ll_InsertRow
long ll_ImportID
long ll_Null
string ls_imp_file
string ls_imp_format
string ls_odbc_name
string ls_odbc_login
string ls_odbc_password
string ls_import_sql
string ls_record_delimiter
string ls_field_delimiter
string ls_ImportFields[]
integer li_Return
DataWindow ldw_Field
DataWindow ldw_mapping
gs_variable_array lst_fields //maha 121807

// Save import records
ll_FieldCount = tab_1.tabpage_hdr.Event ue_save()
if ll_FieldCount = -1 then
	MessageBox("Error", is_hdr_errinfo, StopSign!)
	Return
end if

// Get import information
ll_CurrentRow = tab_1.tabpage_hdr.dw_imp_hdr.GetRow()
if ll_CurrentRow <= 0 then Return
if tab_1.tabpage_hdr.dw_imp_hdr.object.lock_file[ll_CurrentRow] = 1 then
	MessageBox("Prompt", "Create field function is disabled when the sync is Locked.")
	Return
end if
ls_imp_file = tab_1.tabpage_hdr.dw_imp_hdr.object.imp_file[ll_CurrentRow]
ls_imp_format = tab_1.tabpage_hdr.dw_imp_hdr.object.imp_format[ll_CurrentRow]
ls_odbc_name = tab_1.tabpage_hdr.dw_imp_hdr.object.odbc_name[ll_CurrentRow]
ls_odbc_login = tab_1.tabpage_hdr.dw_imp_hdr.object.odbc_login[ll_CurrentRow]
ls_odbc_password = tab_1.tabpage_hdr.dw_imp_hdr.object.odbc_password[ll_CurrentRow]
ls_import_sql = tab_1.tabpage_hdr.dw_imp_hdr.object.import_sql[ll_CurrentRow]
ls_record_delimiter = tab_1.tabpage_hdr.dw_imp_hdr.object.record_delimiter[ll_CurrentRow]
ls_field_delimiter = tab_1.tabpage_hdr.dw_imp_hdr.object.field_delimiter[ll_CurrentRow]

if IsNull(ls_imp_format) then ls_imp_format = ""
if IsNull(ls_odbc_name) then ls_odbc_name = ""
if IsNull(ls_odbc_login) then ls_odbc_login = ""
if IsNull(ls_odbc_password) then ls_odbc_password = ""
if IsNull(ls_import_sql) then ls_import_sql = ""
if IsNull(ls_record_delimiter) then ls_record_delimiter = ""
if IsNull(ls_field_delimiter) then ls_field_delimiter = ""

// Get import field list
choose case ls_imp_format
	case "1" //Tab Delimited
		ll_FieldCount = of_GetFieldFromTxt(ls_imp_file, ls_ImportFields)
	case "2" //CSV
		ll_FieldCount = of_GetFieldFromCSV(ls_imp_file, ls_ImportFields)
	case "3" //ODBC		
		ll_FieldCount = of_GetFieldFromODBC(ls_imp_file, ls_odbc_name, ls_odbc_login, ls_odbc_password, ls_import_sql, ls_ImportFields)
	case "4"	//Formatted text	
		ll_FieldCount = of_GetFieldFromFormatTxt(ls_imp_file, ls_record_delimiter, ls_field_delimiter, ls_ImportFields)
end choose
if ll_FieldCount = -1 then Return

//Start Code Change ----12.18.2007 #V8 maha
//changed code to open w_database_field_verify which will allow the user to modify and verify field names
//if of_CheckImportFieldName(ll_FieldCount, ls_ImportFields[]) = -1 then Return
lst_fields.as_string[] = ls_ImportFields[]
openwithparm(w_database_field_verify,lst_fields) //pass the field list
if message.doubleparm = -1 then return
lst_fields = message.powerobjectparm
 ls_ImportFields[] = lst_fields.as_string[] //set the modified field list
//End Code Change---12.18.2007

// Select field setup page
ldw_Field = tab_1.tabpage_field_data.dw_imp_field_detail
ldw_Field.AcceptText()
ll_ImportID = tab_1.tabpage_hdr.dw_browse.object.import_id[ll_CurrentRow]
tab_1.tabpage_hdr.dw_browse.Event RowFocusChanged(ll_CurrentRow)
if tab_1.SelectedTab <> 2 then tab_1.SelectTab(2)

// Delete import fields
if ldw_Field.RowCount() > 0 then
	ldw_Field.SetSort("field_order A")
	ldw_Field.Sort()
	li_Return = MessageBox("Prompt", "Sync fields have already been defined. Do you want to replace them?", Question!, YesNoCancel!)
	if li_Return = 1 then
		// Delete corresponding import ID in mapping relationship
		SetNull(ll_Null)
		for i = 1 to tab_1.tabpage_field_data.dw_records.RowCount()
			tab_1.tabpage_field_data.dw_records.ScrollToRow(i)
			ldw_mapping = tab_1.tabpage_field_data.dw_map_fields
			for j = 1 to ldw_mapping.RowCount()
				ldw_mapping.object.import_field_id[j] = ll_Null
			next	
			ldw_mapping = tab_1.tabpage_field_data.dw_prac_cont_id
			for j = 1 to ldw_mapping.RowCount()
				ldw_mapping.object.import_field_id[j] = ll_Null
			next
		next
		// Delete import fields
		ldw_Field.RowsMove(1, ldw_Field.RowCount(), Primary!, ldw_Field, 1, Delete!)		
	elseif li_Return = 3 then
		Return
	end if
end if

// Insert import field into dw_field_list
for i = 1 to ll_FieldCount
	ll_InsertRow = ldw_Field.InsertRow(0)
	ldw_Field.object.import_id[ll_InsertRow] = ll_ImportID
	if ll_InsertRow = 1 then
		ldw_Field.object.field_order[ll_InsertRow] = 10
	else
		ldw_Field.object.field_order[ll_InsertRow] = ldw_Field.object.field_order[ll_InsertRow - 1] + 10
	end if
	ldw_Field.object.imp_field_name[ll_InsertRow] = ls_ImportFields[i]	
	ldw_Field.object.field_length[ll_InsertRow] = 100		
next
ldw_Field.ScrollToRow(1)
ldw_Field.SetColumn("imp_field_name")
ldw_Field.SetFocus()

// Save data
Event pfc_save()
end subroutine

public function integer of_getfieldfromtxt (string as_file, ref string as_fields[]);integer li_FileNum
integer i, li_Pos
string ls_HeaderRow

// Check import file name if null
if IsNull(as_File) or Len(as_File) <= 0 then
	MessageBox("Create sync Fields", "Failed to get sync field. Sync file name can not be null.")
	Return -1
end if
if not FileExists(as_File) then
	MessageBox("Create sync Fields", "Failed to find sync file ," + as_file + ".")
	Return -1
end if

// Open file
li_FileNum = FileOpen(as_File, LineMode!, Read!, Shared!)
if li_FileNum = -1 then
	MessageBox("Create sync Fields", "Failed to get sync file ," + as_file + ". The sync file cannot be opened.")
	Return -1
end if
FileRead(li_FileNum, ls_HeaderRow)
FileClose(li_FileNum)

// Get import field name
do
	li_Pos = Pos(ls_HeaderRow, "~t")
	if li_Pos > 0 then		
		i ++
		as_Fields[i] = Trim(Left(ls_HeaderRow, li_Pos - 1))
		ls_HeaderRow = Right(ls_HeaderRow, Len(ls_HeaderRow) - li_Pos)
	else
		Exit
	end if
loop while true
if Len(ls_HeaderRow) > 0 then
	i ++
	as_Fields[i] = Trim(ls_HeaderRow)
end if
if i = 0 then
	MessageBox("Prompt", "Failed to get import field. Please check content of import file.")
	Return -1
end if

// Return count of import field
Return UpperBound(as_Fields)
end function

public function integer of_getfieldfromcsv (string as_file, ref string as_fields[]);integer li_FileNum
integer i, li_Pos
string ls_HeaderRow

// Check import file name if null
if IsNull(as_File) or Len(as_File) <= 0 then
	MessageBox("Prompt", "Failed to get import field. Import file name can not be null.")
	Return -1
end if
if not FileExists(as_File) then
	MessageBox("Prompt", "Failed to get import field. Import file (" + as_file + ") does not exists.") //Start Code Change ----02.07.2008 #V8 maha - modified message
	Return -1
end if

// Open file
li_FileNum = FileOpen(as_File, LineMode!, Read!, Shared!)
if li_FileNum = -1 then	
	MessageBox("Prompt", "Failed to get import field. Unable to open the  import file (" + as_file + ").") //Start Code Change ----02.07.2008 #V8 maha - modified message
	Return -1
end if
FileRead (li_FileNum, ls_HeaderRow)
FileClose(li_FileNum)

// Get import field name
do
	li_Pos = Pos(ls_HeaderRow, ",")
	if li_Pos > 0 then		
		i ++
		as_Fields[i] = Trim(Left(ls_HeaderRow, li_Pos - 1))
		ls_HeaderRow = Right(ls_HeaderRow, Len(ls_HeaderRow) - li_Pos)		
	else
		Exit
	end if
loop while true
if Len(ls_HeaderRow) > 0 then
	i ++
	as_Fields[i] = Trim(ls_HeaderRow)
end if
if i = 0 then
	MessageBox("Prompt", "Failed to get import field. Please check content of import file.")
	Return -1
end if

// Return count of import field
Return UpperBound(as_Fields)
end function

public function integer of_getfieldfromformattxt (string as_file, string as_record_delimiter, string as_field_delimiter, ref string as_fields[]);integer i, li_Pos
integer li_DelimiterLen
string  ls_HeaderRow
string  ls_Data
blob    lblb_Data
long ll_len
integer li_test

// Check import file name if null
if IsNull(as_File) or Len(as_File) <= 0 then
	MessageBox("Create Fields Error", "Failed to get import field. Import file name can not be null.")
	Return -1
end if
if not FileExists(as_File) then
	MessageBox("Create Fields Error", "Failed to get import field. Import file does not exist.")
	Return -1
end if

// Get header row content
lblb_Data = of_ReadFile(as_File)
ls_Data = String(lblb_Data)
if Lower(as_record_delimiter) = "enter" then
	as_record_delimiter = "~r~n"
elseif Lower(as_record_delimiter) = "tab" then
	as_record_delimiter = "~t"
end if


if as_record_delimiter = "" then as_record_delimiter = "~r"  //Start Code Change ----12.17.2007 #V8 maha -- set default if no value selected
li_Pos = Pos(ls_Data, as_record_delimiter)
if li_Pos > 0 then
	ls_HeaderRow = Left(ls_Data, li_Pos - 1)
	//MessageBox("ls_HeaderRow ",ls_HeaderRow )
else
//maha test code 121707
//	for i = 1 to len(ls_data)
//		li_test  = asc(mid(ls_data,i,1))
//		if li_test = 13 then
//			messagebox("","found it")
//			messagebox("",char(13))
//			return -1
//		end if
//	next
		
	//Start Code Change ----12.17.2007 #V8 maha -- added trap for missing/invalid record delimiter
	MessageBox("Create Fields Error", "Failed to find record delimiter (" + as_record_delimiter + ") in file. Please check import setup data.")
	return -1
	//End Code Change---12.17.2007
	ls_HeaderRow = ls_Data
end if

if Lower(as_field_delimiter) = "enter" then
	as_field_delimiter = "~r~n"
elseif Lower(as_field_delimiter) = "tab" then
	as_field_delimiter = "~t"
end if
li_DelimiterLen = Len(as_field_delimiter)

//Start Code Change ----12.17.2007 #V8 maha -- added trap for missing/invalid field delimiter
li_Pos = Pos(ls_HeaderRow, as_field_delimiter)
if li_Pos = 0 then 
	MessageBox("Create Fields Error", "Failed to find field delimiter (" + as_field_delimiter + ") in file. Please check import setup data.")
end if
//End Code Change---12.17.2007

// Get import field name
do
	li_Pos = Pos(ls_HeaderRow, as_field_delimiter)
	if li_Pos > 0 then		
		i ++
		as_Fields[i] = Trim(Left(ls_HeaderRow, li_Pos - 1))
		if as_Fields[i] = "" or IsNull(as_Fields[i]) then
			as_Fields[i] = "field" + String(i)
		end if
		ls_HeaderRow = Right(ls_HeaderRow, Len(ls_HeaderRow) - li_Pos - li_DelimiterLen + 1)
	else
		Exit
	end if
loop while true
if i = 0 then
	MessageBox("Create Fields Error", "Failed to get import field. Please check content of import file.")
	Return -1
end if

if Len(ls_HeaderRow) > 0 then
	i ++
	as_Fields[i] = Trim(ls_HeaderRow)
	if as_Fields[i] = "" or IsNull(as_Fields[i]) then
		as_Fields[i] = "field" + String(i)
	end if
end if

// Return import field count
Return UpperBound(as_Fields)
end function

public function integer of_getfieldfromodbc (string as_file, string as_odbc_name, string as_odbc_login, string as_odbc_password, string as_import_sql, ref string as_fields[]);string ls_Error
string ls_Syntax
integer i, li_ColCount
DataStore lds_data
Transaction ltr_trans

// Check information if null
if IsNull(as_import_sql) or as_import_sql = "" then
	MessageBox("Prompt", "Failed to get import field. Import SQL can not be null.")
	Return -1
end if
if AppeonGetClientType() = "PB" then
	if IsNull(as_odbc_name) or as_odbc_name = "" then
		MessageBox("Prompt", "Failed to get import field. ODBC name can not be null.")
		Return -1
	end if
	if IsNull(as_odbc_login) or as_odbc_login = "" then
		MessageBox("Prompt", "Failed to get import field. ODBC login can not be null.")
		Return -1
	end if
else
	if IsNull(as_odbc_name) or as_odbc_name = "" then
		MessageBox("Prompt", "Failed to get import field. Cache name can not be null.")
		Return -1
	end if
end if

// Connect to DB
ltr_trans = Create Transaction
if gs_dbtype = "ASA" then
	ltr_trans.DBMS = "ODB-ASA"
else
	ltr_trans.DBMS = "ODB-MSS"
end if
ltr_trans.AutoCommit = False
ltr_trans.DBParm = "ConnectString='DSN=" + as_odbc_name + ";UID=" + as_odbc_login + ";PWD=" + as_odbc_password + "',CacheName='" + as_odbc_name + "',ConnectOption='SQL_DRIVER_CONNECT,SQL_DRIVER_NOPROMPT',DelimitIdentifier='Yes'"
Connect using ltr_trans;
if ltr_trans.SQLCode <> 0 then
	Destroy ltr_trans
	MessageBox("Prompt", "Failed to get import fields. Unable to connect to the database vis ODBC " + as_odbc_name + " .  Check your settings.") //Start Code Change ----02.07.2008 #V8 maha - modified message
	Return -1
end if

// Dynamic create DW
ls_Syntax = ltr_trans.SyntaxFromSQL(as_import_sql, "", ls_Error)
if Len(ls_Error) > 0 then
	Destroy ltr_trans
	MessageBox("Prompt", "Failed to get import field. Import SQL syntax is invalid. ~r~r" + ls_error)	 //Start Code Change ----02.07.2008 #V8 maha - modified message
	Return -1
end if
lds_data = Create DataStore
lds_data.Create(ls_Syntax, ls_Error)

// Get import field name
li_ColCount = Long(lds_data.object.datawindow.column.count)
for i =  1 to li_ColCount
	as_Fields[i] = lds_data.Describe("#" + String(i) + ".name")
next
Destroy ltr_trans
Destroy lds_data
if li_ColCount = 0 then
	MessageBox("Prompt", "Failed to get import field.")
	Return -1
end if

// Return count of import field
Return li_ColCount
end function

public function integer of_begindrag (datawindow adw_data);if KeyDown(KeyLeftButton!) and il_DragRow > 0 and not ib_LockFile then
	adw_data.Drag(Begin!)
end if

Return 1
end function

public subroutine of_completetrans (boolean ab_iscommit);if SQLCA.AutoCommit = true then Return

if ab_IsCommit then
	Commit;
else
	Rollback;
end if
end subroutine

public function integer of_checkimportfieldname (long al_fieldcount, string as_importfields[]);long i, j

for i = 1 to al_FieldCount
	for j = 1 to al_FieldCount
		if i <> j then
			if Trim(Lower(as_ImportFields[i])) = Trim(Lower(as_ImportFields[j])) then
				MessageBox("Prompt", "Import field name '" + as_ImportFields[i] + "' is a duplicated name.")  //Start Code Change ----02.07.2008 #V8 maha - modified message
				Return -1
			end if
		end if
	next
next

Return 1
end function

public function integer of_getimportfields (ref string as_fields[]);long   i, ll_FieldCount
long   ll_CurrentRow
string ls_imp_file
string ls_imp_format
string ls_odbc_name
string ls_odbc_login
string ls_odbc_password
string ls_import_sql
string ls_record_delimiter
string ls_field_delimiter

// Get import information
ll_CurrentRow = tab_1.tabpage_hdr.dw_imp_hdr.GetRow()
ls_imp_file = tab_1.tabpage_hdr.dw_imp_hdr.object.imp_file[ll_CurrentRow]
ls_imp_format = tab_1.tabpage_hdr.dw_imp_hdr.object.imp_format[ll_CurrentRow]
ls_odbc_name = tab_1.tabpage_hdr.dw_imp_hdr.object.odbc_name[ll_CurrentRow]
ls_odbc_login = tab_1.tabpage_hdr.dw_imp_hdr.object.odbc_login[ll_CurrentRow]
ls_odbc_password = tab_1.tabpage_hdr.dw_imp_hdr.object.odbc_password[ll_CurrentRow]
ls_import_sql = tab_1.tabpage_hdr.dw_imp_hdr.object.import_sql[ll_CurrentRow]
ls_record_delimiter = tab_1.tabpage_hdr.dw_imp_hdr.object.record_delimiter[ll_CurrentRow]
ls_field_delimiter = tab_1.tabpage_hdr.dw_imp_hdr.object.field_delimiter[ll_CurrentRow]

if IsNull(ls_imp_format) then ls_imp_format = ""
if IsNull(ls_odbc_name) then ls_odbc_name = ""
if IsNull(ls_odbc_login) then ls_odbc_login = ""
if IsNull(ls_odbc_password) then ls_odbc_password = ""
if IsNull(ls_import_sql) then ls_import_sql = ""
if IsNull(ls_record_delimiter) then ls_record_delimiter = ""
if IsNull(ls_field_delimiter) then ls_field_delimiter = ""

// Get import field list
choose case ls_imp_format
	case "1" //Tab Delimited
		ll_FieldCount = of_GetFieldFromTxt(ls_imp_file, as_Fields[])
	case "2" //CSV
		ll_FieldCount = of_GetFieldFromCSV(ls_imp_file, as_Fields[])
	case "3" //ODBC		
		ll_FieldCount = of_GetFieldFromODBC(ls_imp_file, ls_odbc_name, ls_odbc_login, ls_odbc_password, ls_import_sql, as_Fields[])
	case "4"	//Formatted text	
		ll_FieldCount = of_GetFieldFromFormatTxt(ls_imp_file, ls_record_delimiter, ls_field_delimiter, as_Fields[])
	case else
end choose

Return ll_FieldCount
end function

public function integer of_setmenu (integer ai_index);if ai_Index <> 1 then
	// Default menu item
	m_pfe_cst_import_painter.m_edit.visible = false
	m_pfe_cst_import_painter.m_file.m_save.visible = false
	
	// Default button
	gnv_app.of_modify_menu_attr( m_pfe_cst_import_painter.m_edit.m_insert,'toolbaritemvisible', false)
	gnv_app.of_modify_menu_attr( m_pfe_cst_import_painter.m_edit.m_delete1,'toolbaritemvisible', false)
	gnv_app.of_modify_menu_attr( m_pfe_cst_import_painter.m_edit.m_copy,'toolbaritemvisible', false)
	
	gnv_app.of_modify_menu_attr( m_pfe_cst_import_painter.m_file.m_save,'toolbaritemvisible', false)
	gnv_app.of_modify_menu_attr( m_pfe_cst_import_painter.m_file.m_createimportfields,'toolbaritemvisible', false)
end if

gnv_app.of_modify_menu_attr( m_pfe_cst_import_painter.m_file.m_copymap,'toolbaritemvisible', false)
//m_pfe_cst_import_painter.m_file.m_editprojects.toolbaritemvisible = false
//m_pfe_cst_import_painter.m_file.m_lookupmapping.toolbaritemvisible = false
gnv_app.of_modify_menu_attr( m_pfe_cst_import_painter.m_file.m_checkmapping,'toolbaritemvisible', false)
//m_pfe_cst_import_painter.m_file.m_runimport.toolbaritemvisible = false

// Reset
choose case ai_Index
	case 1 //Imports
		m_pfe_cst_import_painter.m_edit.visible = true		
		m_pfe_cst_import_painter.m_file.m_save.visible = true		
		
		gnv_app.of_modify_menu_attr( m_pfe_cst_import_painter.m_edit.m_insert,'toolbaritemvisible', true)
		gnv_app.of_modify_menu_attr( m_pfe_cst_import_painter.m_edit.m_delete1,'toolbaritemvisible', true)
		gnv_app.of_modify_menu_attr( m_pfe_cst_import_painter.m_edit.m_copy,'toolbaritemvisible', true)
				
		gnv_app.of_modify_menu_attr( m_pfe_cst_import_painter.m_file.m_save,'toolbaritemvisible', true)
		gnv_app.of_modify_menu_attr( m_pfe_cst_import_painter.m_file.m_createimportfields,'toolbaritemvisible', true)
		
	case 2 //Field Setup
		m_pfe_cst_import_painter.m_file.m_save.visible = true
		gnv_app.of_modify_menu_attr( m_pfe_cst_import_painter.m_file.m_copymap,'toolbaritemvisible', true)		
		gnv_app.of_modify_menu_attr( m_pfe_cst_import_painter.m_file.m_save,'toolbaritemvisible', true)
		gnv_app.of_modify_menu_attr( m_pfe_cst_import_painter.m_file.m_checkmapping,'toolbaritemvisible', true)
		
	case 3 //Data
		
	case 4 //Error Logs
		
	case else
end choose

Return 1
end function

public function integer of_setmappeddwtitle (integer al_current);ii_CurrMappedDW = al_Current

if ii_CurrMappedDW = 1 then
	if ii_curr_isoft_module = 1 then
		//Added By Mark Lee 03/22/2013
//		tab_1.tabpage_field_data.dw_prac_cont_id.Title = ">>> Provider Identification Fields (must be mapped from Basic Information table) <<<"
		tab_1.tabpage_field_data.dw_prac_cont_id.Title = gs_left_title_sign +"Provider Identification Fields (must be mapped from Basic Information table)"+gs_right_title_sign
	else
		//Added By Mark Lee 03/22/2013
//		tab_1.tabpage_field_data.dw_prac_cont_id.Title = ">>> Contract Identification Fields (must be mapped from Basic Information table) <<<"
		tab_1.tabpage_field_data.dw_prac_cont_id.Title = gs_left_title_sign+"Contract Identification Fields (must be mapped from Basic Information table)"+gs_right_title_sign
	end if
	tab_1.tabpage_field_data.dw_map_fields.Title = "Mapped Record Fields"
else
	if ii_curr_isoft_module = 1 then
		tab_1.tabpage_field_data.dw_prac_cont_id.Title = "Provider Identification Fields (must be mapped from Basic Information table)"
	else
		tab_1.tabpage_field_data.dw_prac_cont_id.Title = "Contract Identification Fields (must be mapped from Basic Information table)"
	end if	
	//Added By Mark Lee 03/22/2013
//	tab_1.tabpage_field_data.dw_map_fields.Title = ">>> Mapped Record Fields <<<"
	tab_1.tabpage_field_data.dw_map_fields.Title = gs_left_title_sign+"Mapped Record Fields"+gs_right_title_sign
end if

Return 1
end function

public function string of_replaceblank (string as_string, string as_new);integer li_NewPos
integer li_StartPos
integer li_BlankLen
string ls_Return

li_BlankLen = 1
li_StartPos = 1
as_String = Trim(as_String)
li_NewPos = Pos(as_String, " ")

do		
	if li_NewPos > 0 then
		ls_Return += Mid(as_String, li_StartPos, li_NewPos - li_StartPos) + as_New
		li_StartPos = li_NewPos + li_BlankLen
	else
		ls_Return += Right(as_String, Len(as_String) - li_StartPos + 1)
		Exit
	end if
	
	li_BlankLen = 1
	li_NewPos = Pos(as_String, " ", li_StartPos)	
	do
		if Mid(as_String, li_NewPos + li_BlankLen, 1) = " " then
			li_BlankLen ++
		else
			Exit
		end if
	loop while true
loop while true

Return ls_Return
end function

public function string of_getcontractfieldfilter (datawindow adw_tables);long ll_Row
string ls_Filter
string ls_NotInList
string ls_table_name

// Set common filter
ll_Row = adw_tables.GetRow()
ls_Filter = "table_id = " + String(adw_tables.object.table_id[ll_Row])

// Set particular filter
ls_table_name = Lower(adw_tables.object.table_name[ll_Row])
choose case ls_table_name
	case "ctx_basic_info"
		ls_NotInList = "'ctx_id','record_id','version_number','version_date','master_contract_id'"
		if is_ImportType = '2' Then	ls_NotInList += ",'salesforce_id'" //modified by gavins 20140723
	case "ctx_products"
		if is_ImportType = '2' Then//modified by gavins 20140505
			ls_NotInList = "'record_id','salesforce_id'" //modified by gavins 20140723
		Else
			ls_NotInList = "'ctx_id','record_id'"
		End If
	case "ctx_contract_contacts"
		ls_NotInList = "'ctx_id','contact_id','record_id','id_forcatalog'"
		//Added By Mark 06/17/2014
		If is_ImportType = '2' Then
			ls_NotInList = ls_NotInList + ",'ic_area','association','notes','default_email','inserted_by_user','inserted_at_date_time'" + &
				",'updated_by_user','updated_at_date_time','owner','access','custom_n1','custom_n2','custom_n3','custom_percent_1'" + &
				",'custom_percent_2','custom_1','custom_2','custom_3','association2','association3','association4','association5','association6'" + &
				",'association7','association8','association9','association10' "
		End If
	case "ctx_fee_sched_nm"
		if is_ImportType = '2' Then//modified by gavins 20140505
			ls_NotInList = "'fee_sched_nm_id','record_id','salesforce_id'" //modified by gavins 20140723			
		Else
			ls_NotInList = "'ctx_id','fee_sched_nm_id','record_id'"
		End If
	case "ctx_contacts"
		if is_ImportType = '2' Then
			ls_NotInList = "'contact_id','record_id','user_d','salesforce_id'" //modified by gavins 20140723
		Else
			ls_NotInList = "'contact_id','facility_id','record_id','user_d'"			
		End If
	case "app_facility"
		ls_NotInList = "'facility_id','salesforce_id'" //modified by gavins 20140723
	case "ctx_contacts_numbers"
		ls_NotInList = "'contact_id','record_id','contact_num_id'"
		//Added By Mark 06/17/2014
		If is_ImportType = '2' Then
			ls_NotInList = ls_NotInList + ",'via','type','inserted_by_user','inserted_at_date_time','updated_by_user','updated_at_date_time'"
		End If
	case "ctx_custom"
		if is_ImportType = '2' Then
			ls_NotInList = "'salesforce_id'" //modified by gavins 20140723"
		Else
			ls_NotInList = "'ctx_id'"
		End If
	case 'ctx_custom_multi_hdr' //added by gavins 20130222
		if is_ImportType = '2' Then
			ls_NotInList = "'hdr_id', 'id_forcatalog','salesforce_id'"//modified by gavins 20140723"
		Else
			ls_NotInList = "'ctx_id', 'hdr_id', 'id_forcatalog'"
		End If		
	case 'ctx_custom_multi_detail' //added by gavins 20130222
		if is_ImportType = '2' Then
			ls_NotInList = "'detail_id', 'id_forcatalog'"	
		Else
			ls_NotInList = "'ctx_id', 'hdr_id','detail_id', 'id_forcatalog'"	
		End If
	case 'security_users' 	//Added By Mark Lee 04/16/2014
		ls_NotInList = "'user_password','image_flag','email_id','iverify_temp_id','default_search_facility','version_build','prac_id','pref_win_left','pref_win_top','last_pass_update' " +&
			" ,'de_status','audit_type','wv_role_id','tdl_rights','tdl_other_user','wv_ldap_user','lock_until' " + &
			" ,'ic_ldap_user','npdb_user_id','set_task','open_tdl','set_1','set_2','set_3','set_4'" +  &
			" ,'npdb_password','domain_name','image_prompt_flag','lic_agr_img','lic_agr_asa','set_prelod_ctx' " + &
			" ,'custom_colors','req_expand_status','refresh_sertifi_time','refresh_approve_time'   "			
	case 'idp_users'	//Added By Mark Lee 04/22/2014
		ls_NotInList = " 'sno','app_name','map_user_id','cachename','app_verifycode','idpuser_createtime','idpuser_validetime' "
	case 'ctx_am_document' //Added By Jay Chen 10-10-2014 //modified By Ken.Guo 2017-04-14. added salesforce_id
		ls_NotInList = " 'doc_id','ctx_id','from_templete_id','export_id','wf_id','doc_from_type','doc_from_name','es_apicode','es_fileid','es_docid','es_sender_email','es_sender','approve_id','primary_doc' "+&
		" ,'esign_type','template_ctx_id','es_license_user_id','filename','alm_appointment','revision_control','salesforce_id'  "	
	case else
		Return ""
end choose
ls_Filter = ls_Filter + " AND Lower(field_name) not in (" + ls_NotInList + ")"

Return ls_Filter
end function

public function integer of_selectvalue (ref string as_value);string ls_Return

Open(w_import_selectcode)
ls_Return = Left(Message.StringParm, 3)
if ls_Return = "OK!" then
	as_Value = Right(Message.StringParm, Len(Message.StringParm) - 3)
	Return 1
end if

Return -1
end function

public function long of_getinsertrow (datawindow adw_table, long al_parent_table_id);long ll_FindRow
long ll_InsertRow
long ll_RowCount

ll_FindRow = 1
ll_RowCount = adw_table.RowCount()

do
	ll_FindRow = adw_table.Find("isoft_table_id=" + String(al_parent_table_id), ll_FindRow, ll_RowCount)
	if ll_FindRow > 0 then
		ll_InsertRow = ll_FindRow + 1
		ll_FindRow ++
		if ll_FindRow > ll_RowCount then Exit
	else
		Exit
	end if
loop until false
if ll_InsertRow = 0 then ll_InsertRow = 1

Return ll_InsertRow
end function

public function long of_getinsertrow (long al_table_id);long ll_InsertRow
datawindow ldw_table

ldw_table = tab_1.tabpage_field_data.dw_records

if ii_curr_isoft_module = 1 then
	choose case al_table_id
		case 25 //pd_basic
			ll_InsertRow = 1
		case else
			ll_InsertRow = 0
	end choose
else
	choose case al_table_id
		case 1006 //app_facility
			ll_InsertRow = 1
		case 1003 //ctx_contacts
			ll_InsertRow = of_GetInsertRow(ldw_table, 1012)
			if ll_InsertRow = 1 then ll_InsertRow = of_GetInsertRow(ldw_table, 1011)
			if ll_InsertRow = 1 then ll_InsertRow = of_GetInsertRow(ldw_table, 1006)
		case 1001 //ctx_basic_info
			ll_InsertRow = of_GetInsertRow(ldw_table, 1003)
			if ll_InsertRow = 1 then ll_InsertRow = of_GetInsertRow(ldw_table, 1006)
		Case 1009	//ctx_custom_multi_detail  //added  by gavins 20130222
			ll_InsertRow = of_GetInsertRow(ldw_table, 1010)
			ll_insertRow = ll_insertrow - 1
		Case 1010	//ctx_custom_multi_detail  //added  by gavins 20130222
			ll_InsertRow = of_GetInsertRow(ldw_table, 1009)
			if ll_InsertRow = 1 then ll_InsertRow = 0
		case 1011	//security_users		//Added By Mark Lee 04/17/2014
			ll_InsertRow = of_GetInsertRow(ldw_table, 1012)
			if ll_InsertRow = 1 then ll_InsertRow = of_GetInsertRow(ldw_table, 1003)
			if ll_InsertRow = 1 then 
				ll_InsertRow = of_GetInsertRow(ldw_table, 1006)
			else
				ll_insertRow = ll_insertrow - 1
			end if 
		case 1012	//idp_users		//Added By Mark Lee 04/22/2014
			ll_InsertRow = of_GetInsertRow(ldw_table, 1011)
			if ll_InsertRow = 1 then ll_InsertRow = of_GetInsertRow(ldw_table, 1006)
			if ll_InsertRow = 1 then 
				ll_InsertRow = of_GetInsertRow(ldw_table, 1003)
				if ll_InsertRow > 1 then ll_insertRow = ll_insertrow - 1
			end if 
		case else
			ll_InsertRow = 0
	end choose
end if

Return ll_InsertRow
end function

public function integer of_preprocess_data (integer li_process, string as_file_from, string as_file_to);//Start Code Change ----06.27.2008 #V81 maha -function added for preprocessing a file before importing

CHOOSE CASE li_process
	case 1 //Indy PIC
		string sfile
		string ls_val
		string skipval
		string docpath, docname
		string ls_transdate
		integer ck
		string rtype
		string ls_trans_type //maha 073108
		integer skip = 0
		integer li_t_skip = 0 //maha 073108
		long r
		long rc
		long datarow = 0
		datastore ds_file
		datastore ds_data
		
		ds_file = create datastore
		ds_data = create datastore
		
		ds_file.dataobject = "d_indy_pre_process"
		ds_data.dataobject = "d_indy_pre_process"
		
		ds_file.settransobject(sqlca)
		ds_data.settransobject(sqlca)
		
//		if isnull(as_file_from) or as_file_from = "" then
//			GetFileOpenName("Select File",    docpath, docname,  "All Files (*.*), *.*",    gs_dir_path +gs_DefDirName + "\", 18)
		
		if  not fileexists(as_file_from) then 
			messagebox("Preprocess file error","File does not exist: " + as_file_from )
			return -1
		end if
		
		sfile = as_file_from
		
		rc = ds_file.importfile(csv!,sfile)
		if  rc < 1  then 
			messagebox("Preprocess import error","Error importing file for preprocess: " + as_file_from  + " Error:" + string(rc))
			return -1
		end if
		//messagebox("",rc)
		
		ck = 0
		debugbreak()
		for r = 2 to rc  //skip lines 1 
			//on row 3 the value should be 2 then 3 then 2 then 3 ect.
			//rtype = integer(ds_file.getitemstring(r,1))
			rtype = ds_file.getitemstring(r,1)
			
			//if the transaction type is not purchase skip over all the records until you find that trans type
			if integer(rtype) > 1 and li_t_skip = 1 then continue //Start Code Change ----07.31.2008 #V85 maha - change to bypass some transactions
			
			choose case rtype
				case '1' //trans date
					if ck = 2 then //a 1 should not follow a 2
						messagebox("Process error","Check value failed at line " + string(r))
						return -1 
					end if
					//Start Code Change ----07.31.2008 #V85 maha - change to bypass some transactions
					ls_trans_type = ds_file.getitemstring(r,2)
					if ls_trans_type <> "PURCH" then
						li_t_skip = 1
						continue
					end if
					li_t_skip = 0 //Start Code Change ----10.06.2009 #V10 maha
					//End Code Change---07.31.2008
					ls_transdate = ds_file.getitemstring(r,3)
					ck = 1
				case '2'
					if ck = 2 then //a 2 should not follow a 2
						messagebox("Process error","Check value failed at line " + string(r))
						return -1 
					end if
					ck = 2
					ls_val = trim(ds_file.getitemstring(r,2))
					skipval = trim(mid(ls_val, len(ls_val) - 4))
					
					if skipval = "2001" or skipval = "2999" then //skip this row and the next
						skip = 1
						continue
					else
						datarow = ds_data.insertrow(0)
						ds_data.setitem(datarow,1,ls_val)
					end if
				case '3'
					if ck <> 2 then //a 3 should always follow a 2
						messagebox("Process error","Check value failed at line " + string(r))
						return -1 
					end if
					ck = 3
					if skip = 1 then
						skip = 0
						continue
					end if
					
					ls_val = ds_file.getitemstring(r,2)
					ds_data.setitem(datarow,2,trim(ds_file.getitemstring(r,2)))
					ds_data.setitem(datarow,3,trim(ds_file.getitemstring(r,3)))
					ds_data.setitem(datarow,4,trim(ds_file.getitemstring(r,4)))
					ds_data.setitem(datarow,5,trim(ds_file.getitemstring(r,5)))
					ds_data.setitem(datarow,6,trim(ds_file.getitemstring(r,6)))
					ds_data.setitem(datarow,10,ls_transdate)
				case else
					messagebox("Unexpected data in file",rtype)
			end choose
					
					
					
//					
//			if ck = 3 then 
//				ck = 2
//			elseif ck = 2 then
//				ck = 3
//			end if
//			if ck <> integer(ds_file.getitemstring(r,1))  then
//				messagebox("Process error","Check value failed at line " + string(r))
//				return -1 
//			end if
//			//debugbreak()	
//			if ck = 2 then 
//				ls_val = trim(ds_file.getitemstring(r,2))
//				skipval = trim(mid(ls_val, len(ls_val) - 4))
//				if skipval = "2001" or skipval = "2999" then //skip this row and the next
//					r++
//					ck = 3
//					continue
//				else
//					datarow = ds_data.insertrow(0)
//					ds_data.setitem(datarow,1,ls_val)
//				end if
//			else //3
//				ls_val = ds_file.getitemstring(r,2)
//				ds_data.setitem(datarow,2,trim(ds_file.getitemstring(r,2)))
//				ds_data.setitem(datarow,3,trim(ds_file.getitemstring(r,3)))
//				ds_data.setitem(datarow,4,trim(ds_file.getitemstring(r,4)))
//				ds_data.setitem(datarow,5,trim(ds_file.getitemstring(r,5)))
//				ds_data.setitem(datarow,6,trim(ds_file.getitemstring(r,6)))
//			end if
		next		
		gnv_rights.of_check_dir_right( as_file_to, true, 'Import Save')
		ds_data.saveas( as_file_to , text!, true)
		
		destroy ds_data
		destroy ds_file
		
		
		
end choose

return 1
end function

public function string of_correcttablename (string as_name);integer i, li_Len
string  ls_Char
string  ls_TableName
string  ls_AlphaNumeric = "qwertyuiopasdfghjklzxcvbnm0123456789"

li_Len = Len(as_Name)
for i = 1 to li_Len
	ls_Char = Lower(Mid(as_Name, i, 1))
	if ls_Char = " " then
		ls_TableName += "_"
	else
		if Pos(ls_AlphaNumeric, ls_Char) > 0 then
			ls_TableName += ls_Char
		end if
	end if
next
ls_TableName = "impt_" + ls_TableName

Return ls_TableName
end function

public subroutine of_copy_field_data (long al_ori_import_id, long al_new_import_id);//Add by jervis 12.18.2009
//Copy Field mapping data
string ls_CopySql

if al_ori_import_id <=0 or al_new_import_id <=0 then return 

//Copy Import_file_fields
ls_CopySql = 	"insert into Import_file_fields(import_id,field_order,imp_field_name,field_length,field_format,case_type,strip_type,comp_def,default_value) " + &
					"select " + string(al_new_import_id)+ ",field_order,imp_field_name,field_length,field_format,case_type,strip_type,comp_def,default_value " + &
					"from Import_file_fields where import_id = " + string(al_ori_import_id) + "; ~r~n "
EXECUTE IMMEDIATE :ls_CopySql;
//Copy Import_table_records
ls_CopySQl = 	"insert into Import_table_records(import_id,isoft_table_id,sort_no) " + &
					"select " + string(al_new_import_id)+ ",isoft_table_id,sort_no " + &
					"from Import_table_records where import_id = " + string(al_ori_import_id)+ "; ~r~n"
EXECUTE IMMEDIATE :ls_CopySql;
//Copy import_mapping_fields
ls_CopySql = 	"insert into import_mapping_fields(table_records_id,import_field_id,case_type,strip_type,field_format,isoft_field_id,key_field,id_field,null_type,null_value,link_value,facility_id,no_match_procd,lu_template,lu_type,lu_table,lu_field_name,sort_no) " + &
					"select t_new_Import_table_records.new_table_records_id,t_new_import_file_fields.new_rec_id,import_mapping_fields.case_type,import_mapping_fields.strip_type,import_mapping_fields.field_format,import_mapping_fields.isoft_field_id,import_mapping_fields.key_field,import_mapping_fields.id_field,import_mapping_fields.null_type,import_mapping_fields.null_value,import_mapping_fields.link_value,import_mapping_fields.facility_id,import_mapping_fields.no_match_procd,import_mapping_fields.lu_template,import_mapping_fields.lu_type,import_mapping_fields.lu_table,import_mapping_fields.lu_field_name,import_mapping_fields.sort_no " + &
					"from import_mapping_fields, " + &
							"(	select t_new.table_records_id new_table_records_id,t_old.* " + &
								"from Import_table_records t_old,Import_table_records t_new " + &
								"where t_old.import_id = " + string(al_ori_import_id) + " and t_new.import_id = " + string(al_new_import_id)+ " and t_old.isoft_table_id = t_new.isoft_table_id and t_old.sort_no = t_new.sort_no) t_new_Import_table_records," + &
							"(select t_new.rec_id new_rec_id,t_old.* " + &
								"from Import_file_fields t_old,Import_file_fields t_new " + &
								"where t_old.import_id = " + string(al_ori_import_id) + " and t_new.import_id = " + string(al_new_import_id)+ " and t_old.imp_field_name = t_new.imp_field_name and t_old.field_order = t_new.field_order) t_new_Import_file_fields " + &
					"where import_mapping_fields.table_records_id = t_new_Import_table_records.table_records_id and import_mapping_fields.import_field_id = t_new_import_file_fields.rec_id"

EXECUTE IMMEDIATE :ls_CopySql;
commit;
ib_IsCopy = false

//Refresh data
tab_1.tabpage_field_data.event ue_init( )


	
end subroutine

public subroutine wf_importtype_control (string as_data);//added by gavins 20140505
//argument "import_type" value

string  ls_Column[] = { 'err_process',  'add_protocol', 'err_notify', 'err_file', 'notify_addr1', 'notify_addr2', &
							'imp_format',  'flat_multi','imp_file'  }  
int i
string ls_column2[] = {  'copy_file',  'ignore_header_row' }


//is_ImportType = as_data //Modified By Jay Chen 10-10-2014
If isnull(is_ImportType ) or trim( is_ImportType ) = ""  Then is_ImportType = "1"

if as_data = "1" Then //File
	tab_1.tabpage_data.enabled = true
	tab_1.tabpage_log.enabled = true
	For i = 1 To Upperbound( ls_Column )
		tab_1.tabpage_hdr.dw_imp_hdr.Modify( ls_Column[i] + ".background.color=16777210  " + ls_Column[i] + ".protect =0" )
	Next
	For i = 1 To Upperbound( ls_Column2 )
		tab_1.tabpage_hdr.dw_imp_hdr.Modify( ls_Column2[i] + ".CheckBox.ThreeD	= 'yes'  " + ls_Column2[i] + ".protect =0" )
	Next
	tab_1.tabpage_hdr.dw_imp_hdr.Modify( "cb_browse.enabled = true" )
	tab_1.tabpage_hdr.dw_imp_hdr.Post Event ue_setenabled( tab_1.tabpage_hdr.dw_imp_hdr.GetRow( ))
	
ElseIf as_data = '2' Then//salesforce
	tab_1.tabpage_data.enabled = false
	tab_1.tabpage_log.enabled = true
	For i = 1 To Upperbound( ls_Column )
		tab_1.tabpage_hdr.dw_imp_hdr.Modify( ls_Column[i] + ".background.color=536870912  " + ls_Column[i] + ".protect =1" )
	Next
	tab_1.tabpage_hdr.dw_imp_hdr.Modify( "update_verifications.protect = 1  update_verifications.background.color=536870912" )
	For i = 1 To Upperbound( ls_Column2 )
		tab_1.tabpage_hdr.dw_imp_hdr.Modify( ls_Column2[i] + ".CheckBox.ThreeD	= 'no'  " + ls_Column2[i] + ".protect =1" )
	Next
	tab_1.tabpage_hdr.dw_imp_hdr.Modify( "cb_browse.enabled = false" )
		
End If	



end subroutine

public function boolean of_field_name_check (string as_fieldname);//====================================================================
// Function: of_field_name_check
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value    string    as_FieldName
//--------------------------------------------------------------------
// Returns:  boolean
//--------------------------------------------------------------------
// Author:	Jay Chen		Date: 07-16-2014
//--------------------------------------------------------------------
//	Copyright (c) 2008-2013 ContractLogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

Char	lc_First,lc_Other
long	ll_Cycle,ll_Length

lc_First = Char(as_FieldName)
if Not (lc_First >= 'a' and lc_First <= 'z' or lc_First >= 'A' and lc_First <= 'Z') then Return false

ll_Length = Len(as_FieldName)
for ll_Cycle = 2 to ll_Length
	lc_Other = Char(Mid(as_FieldName,ll_Cycle,1))
	if Not (lc_Other >= 'a' and lc_Other <= 'z' or lc_Other >= 'A' and lc_Other <= 'Z' or lc_Other >= '0' and lc_Other <= '9' or lc_Other = '_') then Return false
next

Return true

end function

public subroutine wf_setmapfielddefaultvalue (datawindow adw_field, integer ai_row);//adw_Field
String			ls_FieldName
Long			ll_SysFieldID , ll_FRow

If ai_Row <=0 Then Return

ll_SysFieldID  = adw_Field.GetItemNumber( ai_Row, 'isoft_field_id' )
ll_FRow = tab_1.tabpage_field_data.dw_Fields.Find( "field_id = " + string( ll_SysFieldID ) , 1, tab_1.tabpage_field_data.dw_Fields.RowCount( ) )
If ll_FRow > 0 Then
	ls_FieldName = tab_1.tabpage_field_data.dw_Fields.GetItemString( ll_FRow, 'field_name' ) 
Else
	Return
End If

Choose Case Lower(ls_FieldName)
	Case 'ctx_id'
		If isnull( adw_Field.GetItemString( ai_Row, 'lu_Type' ) ) Or Trim( adw_Field.GetItemString( ai_Row, 'lu_Type' ) ) = "" Then
			adw_Field.SetItem( ai_Row, 'lu_type' , 'J' )	
			adw_Field.SetItem( ai_Row, 'lu_table' , 'Contract' )				
			
			adw_Field.SetItem( ai_Row, 'lu_field_name' , 'salesforce_id' )
		End If
	case 'facility_id', 'app_facility'
		If isnull( adw_Field.GetItemString( ai_Row, 'lu_Type' ) ) Or Trim( adw_Field.GetItemString( ai_Row, 'lu_Type' ) ) = "" Then
			adw_Field.SetItem( ai_Row, 'lu_type' , 'I' )	
			adw_Field.SetItem( ai_Row, 'lu_table' , 'Company' )				
			
			adw_Field.SetItem( ai_Row, 'lu_field_name' , 'salesforce_id' )
		End If
//	case 'country' 
//		If isnull( adw_Field.GetItemString( ai_Row, 'lu_Type' ) ) Or Trim( adw_Field.GetItemString( ai_Row, 'lu_Type' ) ) = "" Then
//			adw_Field.SetItem( ai_Row, 'lu_type' , 'I' )	
//			adw_Field.SetItem( ai_Row, 'lu_table' , 'Company' )				
//			
//			
//			adw_Field.SetItem( ai_Row, 'lu_field_name' , 'salesforce_id' )
//		End If
//		If lb_Exists Then Return '"' +as_columnname + '" column’s Lu Type must be set to "country" and its Lu Field cannot be empty.'
//	case 'state' 
//		If isnull( adw_Field.GetItemString( ai_Row, 'lu_Type' ) ) Or Trim( adw_Field.GetItemString( ai_Row, 'lu_Type' ) ) = "" Then
//			adw_Field.SetItem( ai_Row, 'lu_type' , 'I' )	
//			adw_Field.SetItem( ai_Row, 'lu_table' , 'Company' )				
//			
//			
//			adw_Field.SetItem( ai_Row, 'lu_field_name' , 'salesforce_id' )
//		End If
	
//		If lb_Exists Then Return  '"' +as_columnname + '" column’s Lu Type must be set to "state" and its Lu Field cannot be empty.'
//	case 'contact_department' 
//		
//		If lb_Exists Then Return  '"' +as_columnname + '" column’s Lu Type must be set to "'+ ls_Tag + '" and its Lu Field cannot be empty.'
//	case 'contact_title'
//		
//		If lb_Exists Then Return '"' +as_columnname + '" column’s Lu Type must be set to "'+ ls_Tag + '" and its Lu Field cannot be empty.'
//	case 'contact_type'
//	
//		If lb_Exists Then Return '"' +as_columnname + '" column’s Lu Type must be set to "'+ ls_Tag + '" and its Lu Field cannot be empty.'
//	case 'corp_office_link'
//	
//		If lb_Exists Then Return '"' +as_columnname + '" column’s Lu Type must be set to "company" and its Lu Field cannot be empty.'
End Choose	
end subroutine

on w_import_salesforcepainter.create
int iCurrent
call super::create
this.tab_1=create tab_1
this.cb_preprocess=create cb_preprocess
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.tab_1
this.Control[iCurrent+2]=this.cb_preprocess
end on

on w_import_salesforcepainter.destroy
call super::destroy
destroy(this.tab_1)
destroy(this.cb_preprocess)
end on

event closequery;//override
boolean lb_Prompt = false

tab_1.tabpage_hdr.dw_imp_hdr.AcceptText()
tab_1.tabpage_hdr.dw_imp_sql.AcceptText()
if tab_1.tabpage_hdr.dw_browse.ModifiedCount() + tab_1.tabpage_hdr.dw_browse.DeletedCount() > 0 then
	lb_Prompt = true
end if

tab_1.tabpage_field_data.dw_imp_field_detail.AcceptText()
if tab_1.tabpage_field_data.dw_field_list.ModifiedCount() + tab_1.tabpage_field_data.dw_field_list.DeletedCount() > 0 then
	lb_Prompt = true
end if

tab_1.tabpage_field_data.dw_detail.AcceptText()
if tab_1.tabpage_field_data.dw_map_fields.ModifiedCount() + tab_1.tabpage_field_data.dw_map_fields.DeletedCount() > 0 then
	lb_Prompt = true
end if

if lb_Prompt then
	if MessageBox("Save data", "Close without saving changes?", Question!, YesNo!) = 2 then
		Return 1
	end if	
end if
end event

event close;call super::close;//inherit
w_mdi.ChangeMenu(m_pfe_cst_mdi_menu)
w_mdi.of_menu_security(w_mdi.MenuName)

if IsValid(ids_LookUpTableDDDW[1]) then Destroy ids_LookUpTableDDDW[1]
if IsValid(ids_LookUpTableDDDW[2]) then Destroy ids_LookUpTableDDDW[2]
end event

event pfc_preopen;call super::pfc_preopen;//inherit
this.Move(1, 1)
//this.Resize(4055,2100)

//Register controls
this.of_SetResize(True)
inv_resize.of_SetMinSize(This.WorkSpaceWidth(),This.WorkSpaceHeight())
inv_resize.of_SetOrigSize(This.WorkSpaceWidth(),This.WorkSpaceHeight())
inv_resize.of_Register(tab_1, "Scale")

//Resize tabpage_hdr
inv_resize.of_Register(tab_1.tabpage_hdr.dw_browse, 0, 0, 100, 100)
inv_resize.of_Register(tab_1.tabpage_hdr.dw_imp_hdr, 0, 100, 100, 0)
inv_resize.of_Register(tab_1.tabpage_hdr.dw_imp_sql, 0, 100, 100, 0)

/*
//Resize tabpage_field_data
inv_resize.of_Register(tab_1.tabpage_field_data.dw_fields, 0, 0, 0, 100)

inv_resize.of_Register(tab_1.tabpage_field_data.dw_field_list, 100, 0, 0, 100)
inv_resize.of_Register(tab_1.tabpage_field_data.dw_imp_field_detail, 100, 100, 0, 0)
inv_resize.of_Register(tab_1.tabpage_field_data.cb_com_wizard, 100, 100, 0, 0)
inv_resize.of_Register(tab_1.tabpage_field_data.cb_create_value_list, 100, 100, 0, 0)

inv_resize.of_Register(tab_1.tabpage_field_data.dw_records, 50, 0, 0, 0)
inv_resize.of_Register(tab_1.tabpage_field_data.dw_prac_cont_id, 50, 0, 0, 0)
inv_resize.of_Register(tab_1.tabpage_field_data.dw_map_fields, 50, 0, 0, 100)
inv_resize.of_Register(tab_1.tabpage_field_data.dw_detail, 50, 100, 0, 0)

//Resize tabpage_data
inv_resize.of_Register(tab_1.tabpage_data.dw_imp_data, 0, 0, 100, 100)

//Resize tabpage_log
inv_resize.of_Register(tab_1.tabpage_log.dw_log_master, 0, 0, 100, 100)
inv_resize.of_Register(tab_1.tabpage_log.dw_log_detail, 0, 100, 100, 100)
*/
end event

event activate;call super::activate;//Inherit
long ll_Handle

if w_mdi.menuname <> 'm_pfe_cst_import_painter' then
	ll_Handle = handle(w_mdi)
	w_mdi.ChangeMenu(m_pfe_cst_import_painter)
	w_mdi.SetToolbarPos(2, 1, 200, false)	
	w_mdi.of_menu_security(w_mdi.MenuName)
	gnv_appeondll.of_settoolbarpos(ll_Handle)
	
	of_SetMenu(tab_1.SelectedTab)
end if
end event

event pfc_save;//override
ib_ChangeData = false
tab_1.tabpage_hdr.Event ue_save()
tab_1.tabpage_field_data.Event ue_save()
//pfc_cst_save_check
If ib_ChangeData or tab_1.SelectedTab = 2 Then
	tab_1.tabpage_field_data.event pfc_cst_save_check( ) //added by gavins 20140505
End If
Return 1
end event

event resize;call super::resize;//inherit
tab_1.tabpage_field_data.Event ue_Resize()
tab_1.tabpage_data.Event ue_Resize()
tab_1.tabpage_log.Event ue_Resize()
end event

event open;call super::open;//Start Code Change ----07.03.2008 #V81 maha
integer i

i = of_get_app_setting("set_54","I") 
ii_preprocess = i  //Start Code Change ----07.31.2008 #V81 maha
if  i > 0 then 
	cb_preprocess.visible = true	
else //Start Code Change ----09.18.2008 #V85 maha
	cb_preprocess.visible = false
end if

//BEGIN---Add by Evan 09/18/2008
if of_get_app_setting("set_9", "I") = 4 then ib_IsIntelliCredApp = false
if of_get_app_setting("set_cont", "I") = 0 then ib_IsIntelliContract = false
//END---Add by Evan 09/18/2008

//Added By Jay Chen 10-10-2014
//is_ImportType = message.stringparm  
is_ImportType = '2'
//end

//Added By Ken.Guo 2016-03-22
ib_set_page_color[Upperbound(tab_1.control[])]  = False
end event

type tab_1 from tab within w_import_salesforcepainter
event create ( )
event destroy ( )
integer x = 9
integer y = 16
integer width = 4297
integer height = 2100
integer taborder = 10
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 79680469
boolean fixedwidth = true
boolean raggedright = true
boolean createondemand = true
alignment alignment = center!
integer selectedtab = 1
tabpage_hdr tabpage_hdr
tabpage_field_data tabpage_field_data
tabpage_data tabpage_data
tabpage_log tabpage_log
end type

on tab_1.create
this.tabpage_hdr=create tabpage_hdr
this.tabpage_field_data=create tabpage_field_data
this.tabpage_data=create tabpage_data
this.tabpage_log=create tabpage_log
this.Control[]={this.tabpage_hdr,&
this.tabpage_field_data,&
this.tabpage_data,&
this.tabpage_log}
end on

on tab_1.destroy
destroy(this.tabpage_hdr)
destroy(this.tabpage_field_data)
destroy(this.tabpage_data)
destroy(this.tabpage_log)
end on

event selectionchanged;long ll_Row
long ll_LockFile
long ll_sync_type //Added By Jay Chen 10-13-2014
		 
of_SetMenu(NewIndex)

 //Added By Ken.Guo 2016-03-17
If newindex > 0  Then
	If ib_set_page_color[newindex] = False Then
		gnv_app.of_window_basic_code(Parent)
		ib_set_page_color[newindex] = True
	End If
End If

//Added By Jay Chen 12-17-2014
if tab_1.tabpage_hdr.dw_imp_hdr.GetRow() > 0 then
	il_sync_salesforce = tab_1.tabpage_hdr.dw_imp_hdr.getitemnumber( tab_1.tabpage_hdr.dw_imp_hdr.GetRow() , "sync_salesforce")
end if

choose case NewIndex
	case 1 // Imports (tabpage_hdr)
	case 2 // Field Setup (tabpage_field_data)
		 tab_1.tabpage_hdr.dw_imp_hdr.Accepttext( )
		 //Added By Jay Chen 10-13-2014
		If  tab_1.tabpage_hdr.dw_imp_hdr.GetRow() > 0 Then
			ll_sync_type = tab_1.tabpage_hdr.dw_imp_hdr.getitemnumber( tab_1.tabpage_hdr.dw_imp_hdr.GetRow() , "sync_salesforce")
			if ll_sync_type = 0 then
				tab_1.tabpage_field_data.dw_tables.setfilter("")
				tab_1.tabpage_field_data.dw_tables.filter()
				tab_1.tabpage_field_data.dw_tables.setfilter("isoft_module = " + String(ii_curr_isoft_module) + " and table_name <> 'idp_users' and table_name <> 'security_users'  and table_name <> 'ctx_custom_multi_detail'") //Modified By Ken.Guo 2017-04-10 support documents
				tab_1.tabpage_field_data.dw_tables.filter()
			elseif ll_sync_type = 1 then
				tab_1.tabpage_field_data.dw_tables.setfilter("")
				tab_1.tabpage_field_data.dw_tables.filter()
				//tab_1.tabpage_field_data.dw_tables.SetFilter("isoft_module = " + String(ii_curr_isoft_module) + " and (table_name = 'ctx_basic_info' or table_name = 'ctx_am_document' or table_name = 'ctx_products' ) ")
				tab_1.tabpage_field_data.dw_tables.SetFilter("isoft_module = " + String(ii_curr_isoft_module) + " and (table_name = 'ctx_basic_info' or table_name = 'ctx_am_document' or table_name = 'ctx_products' or table_name = 'app_facility' or table_name = 'ctx_contacts' or table_name = 'ctx_custom' or table_name = 'ctx_contacts_numbers') ")  //Modified by Harry 2017-03-15 for Task 749
				tab_1.tabpage_field_data.dw_tables.filter()
			end if
			tab_1.tabpage_field_data.dw_tables.Event RowFocusChanged(tab_1.tabpage_field_data.dw_tables.GetRow())
		End If
		//end
		//added by gavins 20140505
		If is_ImportType = "1" Then
			
			tabpage_field_data.dw_field_list.Modify( "imp_field_label_t.visible=0   imp_field_name_t.x=183 imp_field_name_t.width=709" )
			tabpage_field_data.dw_field_list.Modify( "imp_field_label.visible=0  imp_field_name.x=183 imp_field_name.width=709" )	
			tab_1.tabpage_field_data.dw_field_list.Modify( "b_compare.text='&Compare...'")	
			tabpage_field_data.dw_imp_field_detail.Modify( "comp_def_t.Text='Compute Def:'  comp_def.Visible=1  imp_field_type.visible=0" )
			//Added By Mark Lee 10/30/2015
			tabpage_field_data.dw_field_list.event ue_get_column_arr_order( )			
		ElseIf is_ImportType = "2" Then
			tabpage_field_data.dw_field_list.Modify( "imp_field_label_t.visible=1  imp_field_label_t.x=183 imp_field_label_t.width=425 imp_field_name_t.x=626 imp_field_name_t.width=400" )
			tabpage_field_data.dw_field_list.Modify( "imp_field_label.visible=1  imp_field_label.x=183 imp_field_label.width=425 imp_field_name.x=626 imp_field_name.width=400" )	//325
			tab_1.tabpage_field_data.dw_field_list.Modify( "b_compare.text='&Refresh Fields...'")
			tabpage_field_data.dw_imp_field_detail.Modify( "comp_def_t.Text='Field Type:'  comp_def.Visible=0  imp_field_type.visible=1" )
			If  tab_1.tabpage_hdr.dw_imp_hdr.GetRow( ) > 0 Then wf_importtype_control(  tab_1.tabpage_hdr.dw_imp_hdr.getItemString(  tab_1.tabpage_hdr.dw_imp_hdr.Getrow( ), 'import_type' ) )
			//Added By Mark Lee 10/30/2015
			tabpage_field_data.dw_field_list.event ue_get_column_arr_order( )			
		End If
		
		
		// Display records of each DW
		tab_1.tabpage_field_data.Event ue_DisplayData()
		
		// Change the title of dw_prac_cont_id
		//tab_1.tabpage_field_data.dw_prac_cont_id.Event GetFocus()
		
		// Lock DataWindow
		ll_Row = tab_1.tabpage_hdr.dw_browse.GetRow()
		if ll_Row > 0 then
			ll_LockFile = tab_1.tabpage_hdr.dw_browse.object.lock_file[ll_Row]
			if ll_LockFile = 1 then
				tab_1.tabpage_field_data.Event ue_LockDW(false)
			else
				tab_1.tabpage_field_data.Event ue_LockDW(true)
			end if
		else
			tab_1.tabpage_field_data.Event ue_LockDW(true)
		end if
		if IsNull(ll_LockFile) then ll_LockFile = 0
		
		// Create import fields if no import field in Import Fields DW
		if ib_PromptCreateImportField and ll_LockFile = 0 and tabpage_field_data.dw_field_list.RowCount() = 0 and is_ImportType = "1" then //modified by gavins 20140505
			MessageBox("Prompt", "Before you can do the Field Setup for the Synchronization you need to create your Synchronization Fields.")
			of_CreateImportField()
		end if
		if ib_PromptCreateImportField and ll_LockFile = 0 and tabpage_field_data.dw_field_list.RowCount() = 0 and is_ImportType = "2" then //modified by gavins 20140505
			MessageBox("Prompt", "Before you can do the Field Setup for the Synchronization you need to create your Synchronization Fields.")
			tabpage_field_data.dw_field_list.event buttonclicked(  0, 0, tabpage_field_data.dw_field_list.object.b_compare ) 
		end if
		If is_ImportType = '2' Then
			If ib_LockFile Then//added by gavins 20140505
				tab_1.tabpage_field_data.dw_field_list.object.b_compare.enabled = "no"	
			Else
				tab_1.tabpage_field_data.dw_field_list.object.b_compare.enabled = "yes"	
			End If
			tabpage_field_data.cb_com_wizard.enabled = false
			tabpage_field_data.cb_create_value_list.enabled = false
		Else
			tab_1.tabpage_field_data.dw_field_list.object.b_compare.enabled = "yes"	
			If ib_LockFile Then
				tabpage_field_data.cb_com_wizard.enabled = false
				tabpage_field_data.cb_create_value_list.enabled = false
			Else
				tabpage_field_data.cb_com_wizard.enabled = true
				tabpage_field_data.cb_create_value_list.enabled = true
			End If
		End If
		
		DataWindowChild		ldwc_Child

		If is_ImportType = '1' Then
			If tabpage_field_data.dw_detail.getchild(  'lu_type',ldwc_Child  ) = 1 Then		
				ldwc_Child.SetFilter( " not(data_value = 'J' ) " )
				ldwc_Child.Filter( )
			End If	
		Else
			If tabpage_field_data.dw_detail.GetChild(  'lu_type',ldwc_Child  ) = 1 Then
				tabpage_field_data.dw_detail.SetRedraw( false )
				ldwc_Child.SetFilter( "" )
				ldwc_Child.Filter( )
				//Added by Harry 20170321 for task749
				Long ll_currow, ll_findrow
				if il_sync_salesforce = 1 then
					ll_findrow = ldwc_Child.find( "data_value = 'T'", 1, ldwc_Child.rowcount())
					if ll_findrow <= 0 then
						ll_currow = ldwc_Child.insertrow(0)
						ldwc_Child.setitem(ll_currow, 'data_value', 'T')
						ldwc_Child.setitem(ll_currow, 'display_value', 'Contact')
					end if
				end if
				tabpage_field_data.dw_detail.SetRedraw( true )
			End If	
		End If
		
	case 3 // Data (tabpage_data)
		if il_curr_import_id <> il_page3_import_id then
			il_page3_import_id = il_curr_import_id
			tab_1.tabpage_data.dw_imp_data.DataObject = ""
			tab_1.tabpage_data.dw_imp_data.Event ue_SetTitle(0)
		end if

	case 4 // Error Logs (tabpage_log)
		tab_1.tabpage_log.Event ue_Retrieve()
end choose


end event

event selectionchanging;integer li_Return

choose case OldIndex
	case 1 // Update import record		
		li_Return = tab_1.tabpage_hdr.Event ue_save()
		if li_Return = -1 then Return 1
		
	case 2 // Update mapped field		
		li_Return = tab_1.tabpage_field_data.Event ue_save()
		if li_Return = -1 then Return 1				
end choose

Return 0
end event

type tabpage_hdr from userobject within tab_1
event ue_init ( )
event ue_add ( )
event type integer ue_save ( )
event ue_delete ( )
event ue_copyadd ( )
integer x = 18
integer y = 112
integer width = 4261
integer height = 1972
long backcolor = 79680469
string text = "Data Sync"
long tabbackcolor = 79680469
string picturename = "DataPipeline!"
long picturemaskcolor = 12632256
dw_browse dw_browse
dw_imp_sql dw_imp_sql
dw_imp_hdr dw_imp_hdr
end type

event ue_init();string ls_Expression

//BEGIN---Add by Evan 09/18/2008
if ib_IsIntelliCredApp and ib_IsIntelliContract then
elseif ib_IsIntelliCredApp then
	dw_browse.SetFilter("isoft_module = 1")
	dw_imp_hdr.SetTabOrder("isoft_module", 0)
	dw_imp_hdr.object.isoft_module.background.color = 67108864
else
	dw_browse.SetFilter("isoft_module = 2")
	dw_imp_hdr.SetTabOrder("isoft_module", 0)
	dw_imp_hdr.object.isoft_module.background.color = 67108864
end if
//END---Add by Evan 09/18/2008

dw_browse.SetTransObject(SQLCA)
dw_browse.Retrieve()
dw_browse.Modify("DataWindow.ReadOnly='yes'")

//Added By Jay Chen 10-10-2014
tab_1.tabpage_hdr.dw_browse.setfilter("import_type = '" + is_ImportType +" ' ")
tab_1.tabpage_hdr.dw_browse.filter()
//end


dw_browse.ShareData(dw_imp_hdr)
dw_browse.ShareData(dw_imp_sql)

If dw_browse.GetRow( ) > 0 and dw_browse.RowCount( ) > 0 Then //added by gavins 20140505
	wf_importtype_control( dw_browse.getItemString( dw_browse.getrow(), 'import_type' ) )
End If
dw_imp_hdr.Event ue_SetEnabled(dw_browse.GetRow())

if AppeonGetClientType() = 'PB' Then
	ls_Expression = "sectiongreen.bmp~tif(isnull(doc_name), '" + gs_current_path + "\section.bmp', '" + gs_current_path + "\sectiongreen.bmp')"
	dw_imp_sql.object.b_view.filename = ls_Expression
end if
end event

event ue_add();long ll_InsertRow

dw_imp_hdr.AcceptText()
dw_imp_sql.AcceptText()

ll_InsertRow = dw_browse.InsertRow(0)
dw_browse.ScrollToRow(ll_InsertRow)
dw_imp_hdr.ScrollToRow(ll_InsertRow)
dw_imp_sql.ScrollToRow(ll_InsertRow)

dw_imp_hdr.SetColumn("import_name")
dw_imp_hdr.SetFocus()

//BEGIN---Add by Evan 09/18/2008
if ib_IsIntelliCredApp then
	dw_browse.SetItem(ll_InsertRow, "isoft_module", 1)
else
	dw_browse.SetItem(ll_InsertRow, "isoft_module", 2)
end if
//END---Add by Evan 09/18/2008

dw_browse.SetItem(ll_InsertRow, "import_type", '2') //Added By Jay Chen 10-11-2014
dw_browse.SetItem(ll_InsertRow, "sync_salesforce", 0)
end event

event type integer ue_save();long ll_CurrentRow
long ll_DeleteRowCount
string ls_ImportID
string ls_DeleteSQL
string ls_DropTable
string ls_import_name
string ls_TableName
boolean lb_OldAutoCommit
DWItemStatus ldis_Status

dw_imp_hdr.AcceptText()
dw_imp_sql.AcceptText()

ll_DeleteRowCount = dw_browse.DeletedCount()
if dw_browse.ModifiedCount() + ll_DeleteRowCount <= 0 then Return 1

//Delete records of reference table
if ll_DeleteRowCount > 0 then
	for ll_CurrentRow = 1 to ll_DeleteRowCount
		if Len(ls_ImportID) > 0 then ls_ImportID += ","
		ls_ImportID += String(dw_browse.object.import_id.delete[ll_CurrentRow])

		ls_import_name = Trim(dw_browse.object.import_name.delete[ll_CurrentRow])
		if IsNull(ls_import_name) or ls_import_name = "" then Continue
		if Len(ls_DropTable) > 0 then ls_DropTable += ";~r~n"
		//BEGIN---Modify by Evan 09/18/2008
		//ls_DropTable += "DROP TABLE impt_" + ls_import_name
		ls_TableName = of_CorrectTableName(ls_import_name)
		ls_DropTable += "DROP TABLE " + ls_TableName
		//END---Modify by Evan 09/18/2008
	next
	
	//import_file_fields
	ls_DeleteSQL = "DELETE FROM import_file_fields WHERE import_id IN (" + ls_ImportID + ");~r~n"
	
	//import_mapping_fields
	ls_DeleteSQL += "DELETE FROM import_mapping_fields WHERE table_records_id IN (select table_records_id from import_table_records where import_id in (" + ls_ImportID + "));~r~n"	
	//import_table_records
	ls_DeleteSQL += "DELETE FROM import_table_records WHERE import_id IN (" + ls_ImportID + ");~r~n"
	
	//import_process_errors
	ls_DeleteSQL += "DELETE FROM import_process_errors WHERE process_tables_id IN (select process_tables_id from import_process_tables where process_id IN (select process_id from import_process where import_id IN (" + ls_ImportID + ")));~r~n"
	//import_process_tables
	ls_DeleteSQL += "DELETE FROM import_process_tables WHERE process_id IN (select process_id from import_process where import_id IN (" + ls_ImportID + "));~r~n"
	//import_process
	ls_DeleteSQL += "DELETE FROM import_process WHERE import_id IN (" + ls_ImportID + ")"
	
	EXECUTE IMMEDIATE :ls_DeleteSQL;
	if SQLCA.SQLCode <> 0 then
		is_hdr_errinfo = SQLCA.SQLErrText
		of_CompleteTrans(false)
		MessageBox("Error", is_hdr_errinfo, StopSign!)		
		Return -1
	end if
	lb_OldAutoCommit = SQLCA.AutoCommit
	if lb_OldAutoCommit = false then SQLCA.AutoCommit = true		
	EXECUTE IMMEDIATE :ls_DropTable;
	if SQLCA.AutoCommit <> lb_OldAutoCommit then SQLCA.AutoCommit = lb_OldAutoCommit
end if

//Set date and modify user
for ll_CurrentRow = 1 to dw_browse.RowCount()
	ldis_Status = dw_browse.GetItemStatus(ll_CurrentRow, 0, Primary!)
	if ldis_Status = NewModified! then
		dw_browse.object.create_date[ll_CurrentRow] = DateTime(Today(), Now())
		dw_browse.object.mod_user[ll_CurrentRow] = gs_user_id
	elseif ldis_Status = DataModified! then
		dw_browse.object.mod_date[ll_CurrentRow] = DateTime(Today(), Now())
		dw_browse.object.mod_user[ll_CurrentRow] = gs_user_id
	end if	
next

//Update import record
if dw_browse.Update() = 1 then
	of_CompleteTrans(true)
	//Get current import ID
	if dw_browse.GetRow() > 0 then
		il_curr_import_id = dw_browse.object.import_id[dw_browse.GetRow()]
		//Copy field mapping data - jervis 12.18.2009
		if ib_IsCopy then	of_copy_field_data(il_pre_import_id,il_curr_import_id)
	else
		il_curr_import_id = -1
	end if
	dw_browse.Event RowFocusChanged(dw_browse.GetRow())
		
	Return 1
else
	of_CompleteTrans(false)
	MessageBox("Error", is_hdr_errinfo, StopSign!)
	Return -1
end if


end event

event ue_delete();long ll_CurrentRow
DWItemStatus ldws_Status

ll_CurrentRow = dw_browse.GetRow()
if ll_CurrentRow <= 0 then Return

ldws_Status = dw_browse.GetItemStatus(ll_CurrentRow, 0, Primary!)
if ldws_Status = DataModified! or ldws_Status = NotModified! then	
//	if MessageBox("Delete", "Are you sure you want to delete the selected import file?", &
//		Question!, YesNo!,2) = 2 then
//		Return
//	end if
	
	if MessageBox("Delete", "Are you sure you want to delete the selected sync file, " + &
		"and all setup fields?", Question!, YesNo!, 2) = 2 then
		Return
	end if
end if
dw_browse.DeleteRow(ll_CurrentRow)
ll_CurrentRow = dw_browse.GetRow()
dw_browse.Event RowFocusChanged(ll_CurrentRow)
dw_imp_hdr.ScrollToRow(ll_CurrentRow)
dw_imp_sql.ScrollToRow(ll_CurrentRow)
	
//Get current import ID
if dw_browse.GetRow() > 0 then
	il_curr_import_id = dw_browse.object.import_id[ll_CurrentRow]
else
	il_curr_import_id = -1
	w_import_salesforcepainter.Title = "Data Synchronization Painter" //Modified By Jay Chen 10-10-2014
end if
end event

event ue_copyadd();long ll_Null
long ll_CopyRow
long ll_InsertRow
string ls_Null

SetNull(ll_Null)
SetNull(ls_Null)

If is_ImportType = '2' Then //Added by gavins 20140708     salesforce don't copy
	MessageBox( 'Tips', 'Copy function is not applicable with Salesforce type import. ' )
	Return
End If

dw_imp_hdr.AcceptText()
dw_imp_sql.AcceptText()

ll_CopyRow = dw_browse.GetRow()
if ll_CopyRow > 0 then
	il_pre_import_id = dw_browse.GetItemNumber( ll_copyRow,"import_id")	//Jervis 12.18.2009
	ll_InsertRow = dw_browse.RowCount() + 1
	dw_browse.object.data[ll_InsertRow] = dw_browse.object.data[ll_CopyRow]
	dw_browse.SetItem(ll_InsertRow, "import_id", ll_Null)
	dw_browse.SetItem(ll_InsertRow, "doc_name", ls_Null)
	dw_browse.ScrollToRow(ll_InsertRow)
	dw_imp_hdr.ScrollToRow(ll_InsertRow)
	dw_imp_sql.ScrollToRow(ll_InsertRow)
	dw_imp_hdr.SetColumn("import_name")
	dw_imp_hdr.SetFocus()
end if



end event

on tabpage_hdr.create
this.dw_browse=create dw_browse
this.dw_imp_sql=create dw_imp_sql
this.dw_imp_hdr=create dw_imp_hdr
this.Control[]={this.dw_browse,&
this.dw_imp_sql,&
this.dw_imp_hdr}
end on

on tabpage_hdr.destroy
destroy(this.dw_browse)
destroy(this.dw_imp_sql)
destroy(this.dw_imp_hdr)
end on

event constructor;this.Event ue_init()
end event

type dw_browse from u_dw within tabpage_hdr
integer y = 4
integer width = 4247
integer height = 1104
integer taborder = 21
boolean bringtotop = true
boolean titlebar = true
string title = "Data Sync List"
string dataobject = "d_import_browse_sf"
boolean hscrollbar = true
borderstyle borderstyle = stylebox!
end type

event rowfocuschanged;call super::rowfocuschanged;//inherit
string ls_import_name
DWItemStatus ldwi_Status

this.SelectRow(0, false)
this.SelectRow(CurrentRow, true)

dw_imp_hdr.ScrollToRow(CurrentRow)
dw_imp_sql.ScrollToRow(CurrentRow)

if CurrentRow > 0 then ldwi_Status = GetItemStatus(CurrentRow, 0, Primary!)
if CurrentRow = 0 or ldwi_Status = New! or ldwi_Status = NewModified! then
	gnv_app.of_modify_menu_attr( m_pfe_cst_import_painter.m_file.m_runimport,'enabled', false)
	tab_1.tabpage_field_data.enabled = false
	tab_1.tabpage_data.enabled = false
	tab_1.tabpage_log.enabled = false	
else
	gnv_app.of_modify_menu_attr( m_pfe_cst_import_painter.m_file.m_runimport,'enabled', true)
	tab_1.tabpage_field_data.enabled = true
	tab_1.tabpage_data.enabled = true
	tab_1.tabpage_log.enabled = true	
	
	// Get current import ID
	il_curr_import_id = this.object.import_id[CurrentRow]
end if

// Get current isoft_module and import name
if CurrentRow > 0 then
	ii_curr_isoft_module = this.object.isoft_module[CurrentRow]
	ls_import_name = this.object.import_name[CurrentRow]
else
	ls_import_name = ""
end if

// Set title text of window
if IsNull(ls_import_name) or Len(ls_import_name) <= 0 then
	ls_import_name = "Unknown"
end if
if ii_curr_isoft_module = 1 then
//	w_import_painter.Title = "Import Painter : " + ls_import_name + " of IntelliCred/App"
	w_import_salesforcepainter.Title = "Data Synchronization Painter : " + ls_import_name + " of IntelliCred/App" //Modified By Jay Chen 10-10-2014
else
//	w_import_painter.Title = "Import Painter : " + ls_import_name + " of Contract"
	w_import_salesforcepainter.Title = "Data Synchronization Painter : " + ls_import_name + " of Contract"
end if

If currentrow > 0 and RowCount( ) > 0 Then //added by gavins 20140505
	wf_importtype_control( getItemString( currentrow, 'import_type' ) )
	
End If
end event

event dberror;//override
is_hdr_errinfo = SQLErrText

Return 1
end event

event doubleclicked;call super::doubleclicked;if tab_1.tabpage_field_data.enabled then
	tab_1.SelectTab(2)
end if
end event

event other;call super::other;if Message.WordParm = 61458 then 
	Message.Processed = true
	Message.ReturnValue = 0 
end if
end event

event clicked;call super::clicked;if row <= 0 Then return  //Added by harry 20170512
this.SetRow(Row)
dw_imp_hdr.ScrollToRow(Row)
dw_imp_sql.ScrollToRow(Row)


end event

type dw_imp_sql from u_dw within tabpage_hdr
event ue_keydown pbm_dwnkey
boolean visible = false
integer y = 1612
integer width = 4247
integer height = 356
integer taborder = 21
boolean bringtotop = true
string title = "Import Notes"
string dataobject = "d_import_docs"
boolean hscrollbar = true
boolean vscrollbar = false
boolean livescroll = false
borderstyle borderstyle = stylebox!
end type

event ue_keydown;if Key = KeyDownArrow! or Key = KeyUpArrow! or Key = KeyPageUp! or Key = KeyPageDown! then 
	Return 1
else
	Return 0
end if
end event

event buttonclicked;call super::buttonclicked;integer li_Return
string  ls_DocPath
string  ls_DocName
long    ll_ImportID
blob    lblb_Data
string  ls_Parm
n_getfilename ln_getfilename //Added By Jay Chen 08-15-2014
choose case dwo.name
	case "b_view"
		ls_DocName = dw_imp_hdr.object.doc_name[Row]
		if ls_DocName="" or IsNull(ls_DocName) then
			MessageBox("Prompt", "There is no document.") //Start Code Change ----02.07.2008 #V8 maha - modified message
		else
			ll_ImportID = dw_imp_hdr.object.import_id[Row]
			ls_Parm = String(ll_ImportID) + "|" + ls_DocName
			OpenWithParm(w_import_viewdoc, ls_Parm)
		end if
		
	case "b_update"
		gf_load_dir_path() //Added by Ken.Guo on 2009-03-10
//		li_Return = GetFileOpenName("Select File", ls_DocPath, ls_DocName, "DOC", &
//											 "Word Files (*.DOC),*.DOC,Excel Files (*.XLS),*.XLS,Text Files (*.TXT),*.TXT" )
		li_Return = ln_getfilename.of_getopenfilename("Select File", ls_DocPath, ls_DocName, "DOC", &
											 "Word Files (*.DOC),*.DOC,Excel Files (*.XLS),*.XLS,Text Files (*.TXT),*.TXT" )
		gf_save_dir_path(ls_DocPath) //Added by Ken.Guo on 2009-03-10
		//ChangeDirectory(gs_current_path)
		if li_Return <> 1 then Return
		
		dw_imp_hdr.object.doc_name[Row] = ls_DocName
		dw_imp_hdr.object.doc_updated[Row] = DateTime(Today(), Now())
		li_Return = tab_1.tabpage_hdr.Event ue_save()
		if li_Return = -1 then Return

		ll_ImportID = dw_imp_hdr.object.import_id[Row]
		lblb_Data = of_ReadFile(ls_DocPath)
		UPDATEBLOB import_hdr SET import_doc = :lblb_Data WHERE import_id = :ll_ImportID;		
		if SQLCA.SQLCode = 0 then
			of_CompleteTrans(true)
		else
			is_hdr_errinfo = SQLCA.SQLErrText
			of_CompleteTrans(false)
			MessageBox("Error", is_hdr_errinfo, StopSign!)
		end if
		
	case else		
end choose
end event

event other;call super::other;if Message.WordParm = 61458 then 
	Message.Processed = true
	Message.ReturnValue = 0	
end if

if Message.Number = 522 then
	Return 1
end if
end event

event losefocus;call super::losefocus;//Inherit
this.AcceptText()
end event

type dw_imp_hdr from u_dw within tabpage_hdr
event ue_setenabled ( long al_row )
event ue_keydown pbm_dwnkey
integer y = 1120
integer width = 4247
integer height = 848
integer taborder = 11
boolean titlebar = true
string title = "Data Sync Detail"
string dataobject = "d_import_hdr_sf"
boolean vscrollbar = false
boolean livescroll = false
borderstyle borderstyle = stylebox!
end type

event ue_setenabled(long al_row);long ll_lock_file
string ls_imp_format

if not al_Row > 0 then Return

this.AcceptText()
ll_lock_file = this.object.lock_file[al_Row]

//Start Code Change ----02.07.2008 #V8 maha - added lock protection
if ll_lock_file = 1 then //lock everything
	this.object.odbc_name.protect = 1
	this.object.odbc_login.protect = 1	
	this.object.odbc_password.protect = 1	
	this.object.record_delimiter.protect = 1
	this.object.field_delimiter.protect = 1
	this.object.ignore_header_row.protect = 1
	this.object.update_verifications.protect = 1
	this.object.cb_browse.enabled = "no"
	
	this.object.import_name.protect = 1
	this.object.project_id.protect = 1
	this.object.isoft_module.protect = 1
	this.object.err_process.protect = 1
	this.object.add_protocol.protect = 1
	this.object.update_verifications.protect = 1
	this.object.err_notify.protect = 1
	this.object.err_file.protect = 1
	this.object.notify_addr1.protect = 1
	this.object.notify_addr2.protect = 1
	this.object.imp_format.protect = 1
	this.object.flat_multi.protect = 1
	this.object.imp_file.protect = 1
	this.object.import_type.protect =1
else
	ls_imp_format = this.object.imp_format[al_Row]
	//unprotect
	this.object.import_name.protect = 0
	this.object.project_id.protect = 0
	this.object.import_type.protect =0
	if is_ImportType= "2" Then Return//added by gavins 20140505
	
	this.object.isoft_module.protect = 0
	this.object.err_process.protect = 0
	this.object.add_protocol.protect = 0
	this.object.update_verifications.protect = 0
	this.object.err_notify.protect = 0
	this.object.err_file.protect = 0
	this.object.notify_addr1.protect = 0
	this.object.notify_addr2.protect = 0
	this.object.imp_format.protect = 0
	this.object.flat_multi.protect = 0
	this.object.imp_file.protect = 0
	
	//protect in prep for case statement
	this.object.odbc_name.protect = 1
	this.object.odbc_name.background.color = 67108864
	this.object.odbc_login.protect = 1
	this.object.odbc_login.background.color = 67108864
	this.object.odbc_password.protect = 1
	this.object.odbc_password.background.color = 67108864
	this.object.record_delimiter.protect = 1
	this.object.record_delimiter.background.color = 67108864	
	this.object.field_delimiter.protect = 1
	this.object.field_delimiter.background.color = 67108864
	this.object.ignore_header_row.protect = 1
	this.object.update_verifications.protect = 1
	this.object.update_verifications.background.color = 67108864
	this.object.cb_browse.enabled = "no"
	
	if this.object.isoft_module[al_Row] = 1 then
		this.object.update_verifications.protect = 0
		this.object.update_verifications.background.color = 16777215	
	end if
	
	choose case ls_imp_format
		case "1", "2" //Tab Delimited, CSV
			this.object.ignore_header_row.protect = 0
			this.object.cb_browse.enabled = "yes"
		case "3"      //ODBC
			this.object.ignore_header_row.protect = 1
			this.object.odbc_name.protect = 0
			this.object.odbc_name.background.color = 16777215
			this.object.odbc_login.protect = 0
			this.object.odbc_login.background.color = 16777215
			this.object.odbc_password.protect = 0
			this.object.odbc_password.background.color = 16777215
		case "4"      //Formatted text
			this.object.ignore_header_row.protect = 0
			this.object.record_delimiter.protect = 0
			this.object.record_delimiter.background.color = 16777215	
			this.object.field_delimiter.protect = 0
			this.object.field_delimiter.background.color = 16777215
			this.object.cb_browse.enabled = "yes"
	end choose
end if
//End Code Change---02.07.2008
end event

event ue_keydown;if Key = KeyDownArrow! or Key = KeyUpArrow! or Key = KeyPageUp! or Key = KeyPageDown! then 
	Return 1
else
	Return 0
end if
end event

event buttonclicked;call super::buttonclicked;string ls_DocPath
string ls_DocName
string ls_imp_format
integer li_Return
n_getfilename ln_getfilename //Added By Jay Chen 08-15-2014

choose case dwo.name	
	case "cb_browse"
		ln_getfilename.of_SetHandle( Handle( this ) )
		gf_load_dir_path() //Added by Ken.Guo on 2009-03-10
		ls_imp_format = this.object.imp_format[row]
		if ls_imp_format = "1" then
			li_Return = ln_getfilename.of_getopenfilename("Select File", ls_DocPath, ls_DocName, "TXT", &
												 "Text Files (*.TXT),*.TXT")
		elseif ls_imp_format = "2" then
			li_Return = ln_getfilename.of_getopenfilename("Select File", ls_DocPath, ls_DocName, "CSV", &
												 "CSV Files (*.CSV),*.CSV")
		else
			li_Return = ln_getfilename.of_getopenfilename("Select File", ls_DocPath, ls_DocName, "TXT", &
												 "All Files (*.*),*.*")	
		end if
		if li_Return = 1 then
			dw_browse.SetItem(Row, "imp_file", ls_DocPath)
		end if
		gf_save_dir_path(ls_DocPath) //Added by Ken.Guo on 2009-03-10
	case else
end choose

//Added By Ken.Guo 2017-07-17
String ls_sync_category, ls_sync_category_new
choose case dwo.name	
	case "b_category_choose"
		If this.getitemnumber(this.getrow(),  'lock_file' ) = 0 Then
			ls_sync_category  = this.getitemstring(this.getrow(), 'sync_category')
			openwithparm(w_ctx_category_select,  ls_sync_category)
			ls_sync_category_new = Message.stringparm
			If ls_sync_category_new <> '' and ls_sync_category_new <> 'cancel' Then
				this.setitem(this.getrow(), 'sync_category',ls_sync_category_new)
			End If
		End If
end choose


end event

event itemchanged;call super::itemchanged;//inherit
long ll_Null
long ll_Count
long ll_import_id
string ls_Null
DataWindow ldw_records

SetNull(ls_Null)
SetNull(ll_Null)

choose case dwo.name
	case "imp_format"
		this.Event ue_SetEnabled(Row)
		this.SetItem(Row, "odbc_name", ls_Null)
		this.SetItem(Row, "odbc_login", ls_Null)
		this.SetItem(Row, "odbc_password", ls_Null)
		this.SetItem(Row, "imp_file", ls_Null)
		this.SetItem(Row, "record_delimiter", ls_Null)
		this.SetItem(Row, "field_delimiter", ls_Null)
		this.SetItem(Row, "import_sql", ls_Null)	
		choose case Data
			case "1", "2"
				this.SetItem(Row, "ignore_header_row", 1)
				this.SetColumn("imp_file")
				this.Post SetFocus()
			case "3"
				this.SetItem(Row, "ignore_header_row", 0)
				this.SetColumn("odbc_name")
				this.Post SetFocus()
			case "4"
				this.SetItem(Row, "ignore_header_row", 0)
				this.SetColumn("record_delimiter")
				this.Post SetFocus()
		end choose

	case "record_delimiter"
		if Data = this.object.field_delimiter[Row] then
			this.Post SetItem(Row, "record_delimiter", ls_Null)
		end if
		
	case "field_delimiter"
		if Data = this.object.record_delimiter[Row] then
			this.Post SetItem(Row, "field_delimiter", ls_Null)
		end if
		
	case "isoft_module"
		il_page2_import_id = -1
		ii_curr_isoft_module = Integer(Data)
		ll_import_id = this.object.import_id[Row]
		// Clear field setup
		SELECT count(*) INTO :ll_Count FROM import_table_records WHERE import_id = :ll_import_id;
		if ll_Count > 0 then
			if MessageBox("Delete", "Modify import type will delete all setup fields, are you sure you want to continue?", Question!, YesNo!) = 1 then				
				gnv_appeondb.of_StartQueue()
				DELETE FROM import_mapping_fields WHERE table_records_id IN (select table_records_id from import_table_records where import_id = :il_curr_import_id);
				DELETE FROM import_table_records WHERE import_id = :il_curr_import_id;
				COMMIT;
				gnv_appeondb.of_CommitQueue()
				ldw_records = tab_1.tabpage_field_data.dw_records
				ldw_records.SetFilter("import_id = "  + String(il_curr_import_id))
				ldw_records.Filter()
				ldw_records.RowsMove(1, ldw_records.RowCount(), Primary!, ldw_records, 1, Delete!)
				ldw_records.RowsDiscard(1, ldw_records.DeletedCount(), Delete!)
			else
				//BEGIN---Modify by Evan 08/18/2008
				//ii_curr_isoft_module = this.GetItemNumber(Row, "isoft_module")
				ii_curr_isoft_module = this.object.isoft_module.original[Row]
				//END---Modify by Evan 08/18/2008
				this.Post SetItem(Row, "isoft_module", ii_curr_isoft_module)
			end if
		end if
		// Set others
		if ii_curr_isoft_module = 1 then
			this.object.update_verifications[row] = 1
			this.object.update_verifications.protect = 0
			this.object.update_verifications.background.color = 16777215			
		else
			this.object.update_verifications[row] = ll_Null
			this.object.update_verifications.protect = 1
			this.object.update_verifications.background.color = 67108864			
		end if
		dw_browse.Post Event RowFocusChanged(Row)
	case "lock_file" //Start Code Change ----02.07.2008 #V8 maha
		this.Post Event ue_setenabled( row)
	case "import_type" //added by gavins 20140505
		wf_importtype_control( data )
		SetItem( row, 'import_sfobject', "" )
end choose
end event

event rowfocuschanged;call super::rowfocuschanged;//inherit
if CurrentRow > 0 then
	this.Event ue_SetEnabled(CurrentRow)
end if
end event

event other;call super::other;if Message.WordParm = 61458 then 
	Message.Processed = true
	Message.ReturnValue = 0	
end if

if Message.Number = 522 then
	Return 1
end if
end event

event losefocus;call super::losefocus;//Inherit
this.AcceptText()
end event

type tabpage_field_data from userobject within tab_1
event create ( )
event destroy ( )
event ue_lockdw ( boolean ab_flag )
event ue_init ( )
event ue_displaydata ( )
event type integer ue_save ( )
event ue_checkmapping ( )
event ue_deleteimportfield ( )
event ue_addimportfield ( )
event ue_resize ( )
event ue_copymap ( )
event pfc_cst_save_check ( )
integer x = 18
integer y = 112
integer width = 4261
integer height = 1972
boolean enabled = false
long backcolor = 79680469
string text = "Field Setup"
long tabtextcolor = 33554432
long tabbackcolor = 79680469
string picturename = "TabOrder!"
long picturemaskcolor = 12632256
cb_create_value_list cb_create_value_list
cb_com_wizard cb_com_wizard
cb_edit_map cb_edit_map
dw_detail dw_detail
dw_map_fields dw_map_fields
dw_records dw_records
dw_fields dw_fields
dw_tables dw_tables
ln_1 ln_1
ln_2 ln_2
ln_4 ln_4
ln_5 ln_5
ln_3 ln_3
dw_imp_field_detail dw_imp_field_detail
dw_field_list dw_field_list
dw_compute_verify dw_compute_verify
dw_prac_cont_id dw_prac_cont_id
end type

on tabpage_field_data.create
this.cb_create_value_list=create cb_create_value_list
this.cb_com_wizard=create cb_com_wizard
this.cb_edit_map=create cb_edit_map
this.dw_detail=create dw_detail
this.dw_map_fields=create dw_map_fields
this.dw_records=create dw_records
this.dw_fields=create dw_fields
this.dw_tables=create dw_tables
this.ln_1=create ln_1
this.ln_2=create ln_2
this.ln_4=create ln_4
this.ln_5=create ln_5
this.ln_3=create ln_3
this.dw_imp_field_detail=create dw_imp_field_detail
this.dw_field_list=create dw_field_list
this.dw_compute_verify=create dw_compute_verify
this.dw_prac_cont_id=create dw_prac_cont_id
this.Control[]={this.cb_create_value_list,&
this.cb_com_wizard,&
this.cb_edit_map,&
this.dw_detail,&
this.dw_map_fields,&
this.dw_records,&
this.dw_fields,&
this.dw_tables,&
this.ln_1,&
this.ln_2,&
this.ln_4,&
this.ln_5,&
this.ln_3,&
this.dw_imp_field_detail,&
this.dw_field_list,&
this.dw_compute_verify,&
this.dw_prac_cont_id}
end on

on tabpage_field_data.destroy
destroy(this.cb_create_value_list)
destroy(this.cb_com_wizard)
destroy(this.cb_edit_map)
destroy(this.dw_detail)
destroy(this.dw_map_fields)
destroy(this.dw_records)
destroy(this.dw_fields)
destroy(this.dw_tables)
destroy(this.ln_1)
destroy(this.ln_2)
destroy(this.ln_4)
destroy(this.ln_5)
destroy(this.ln_3)
destroy(this.dw_imp_field_detail)
destroy(this.dw_field_list)
destroy(this.dw_compute_verify)
destroy(this.dw_prac_cont_id)
end on

event ue_lockdw(boolean ab_flag);dw_detail.Enabled = ab_flag
dw_imp_field_detail.Enabled = ab_flag
ib_LockFile = not ab_Flag

cb_edit_map.Enabled = ab_flag
cb_com_wizard.Enabled = ab_flag
cb_create_value_list.Enabled = ab_flag

if ib_LockFile then
	dw_detail.object.b_viewlookups.enabled = "no"
	dw_field_list.object.b_add.enabled = "no"
	dw_field_list.object.b_delete.enabled = "no"
	
//	dw_field_list.object.b_compare.enabled = "no"	
else
	dw_detail.object.b_viewlookups.enabled = "yes"
	dw_field_list.object.b_add.enabled = "yes"
	dw_field_list.object.b_delete.enabled = "yes"

//		dw_field_list.object.b_compare.enabled = "yes"	

end if
end event

event ue_init();DataWindowChild ldwc_Child1
DataWindowChild ldwc_Child2
DataWindowChild ldwc_Child3

// Retrieve data
ids_LookUpTableDDDW[1] = Create DataStore
ids_LookUpTableDDDW[2] = Create DataStore

dw_tables.SetTransObject(SQLCA)
dw_fields.SetTransObject(SQLCA)
dw_records.SetTransObject(SQLCA)
dw_map_fields.SetTransObject(SQLCA)
dw_field_list.SetTransObject(SQLCA)
ids_LookUpTableDDDW[1].DataObject = "d_import_lu_temp1"
ids_LookUpTableDDDW[2].DataObject = "d_import_lu_temp2"
ids_LookUpTableDDDW[1].SetTransObject(SQLCA)
ids_LookUpTableDDDW[2].SetTransObject(SQLCA)

gnv_appeondb.of_startqueue()
dw_tables.Retrieve()
dw_fields.Retrieve()
dw_records.Retrieve()
ids_LookUpTableDDDW[1].Retrieve()
ids_LookUpTableDDDW[2].Retrieve()
gnv_appeondb.of_commitqueue()

// Share data
dw_map_fields.ShareData(dw_detail)
dw_field_list.ShareData(dw_imp_field_detail)

//--------------------------- APPEON BEGIN ---------------------------
//$< Add  > 2009-01-07 By: Scofield
//$<Reason> IntelliSoft Field, Link Value DDDW of dw_detail pre-retrieve

if AppeonGetClientType() = "WEB" then
	dw_detail.GetChild("isoft_field_id", ldwc_Child1)
	dw_detail.GetChild("link_value", ldwc_Child2)
	ldwc_Child1.SetTransObject(SQLCA)
	ldwc_Child2.SetTransObject(SQLCA)
	
	gnv_appeondb.of_startqueue()
	ldwc_Child1.Retrieve()
	ldwc_Child2.Retrieve()
	gnv_appeondb.of_commitqueue()
end if

//---------------------------- APPEON END ----------------------------

// null_value, lu_template and facility_id DDDW of dw_detail pre-retrieve
dw_detail.GetChild("null_value", ldwc_Child1)
dw_detail.GetChild("lu_template", ldwc_Child2)
dw_detail.GetChild("facility_id", ldwc_Child3)
ldwc_Child1.SetTransObject(SQLCA)
ldwc_Child2.SetTransObject(SQLCA)
ldwc_Child3.SetTransObject(SQLCA)

gnv_appeondb.of_startqueue()
ldwc_Child1.Retrieve()
ldwc_Child2.Retrieve()
ldwc_Child3.Retrieve()
gnv_appeondb.of_commitqueue()

ldwc_Child1.InsertRow(1)
ldwc_Child1.InsertRow(1)
ldwc_Child1.SetItem(1, "lookup_name", "* NULL *")
ldwc_Child1.SetItem(2, "lookup_name", "* Select Value *")
ldwc_Child1.SetItem(2, "description", "* Select Value *")

ldwc_Child2.InsertRow(1)
end event

event ue_displaydata();DataWindowChild ldwc_Temp
DataWindowChild ldwc_Child
long i, ll_table_records_id[]
long ll_sync_type 

if il_curr_import_id = il_page2_import_id then Return
il_page2_import_id = il_curr_import_id
this.SetRedraw(false)

///////////////////////////[1.Filter]////////////////////////////////////////
// Filter records of dw_tables
If is_ImportType = '1' Then
//	dw_tables.SetFilter("isoft_module = " + String(ii_curr_isoft_module)) 
	dw_tables.SetFilter(" table_id <> 1013 and isoft_module = " + String(ii_curr_isoft_module)) //Modified By Jay Chen 10-10-2014
Else
//	dw_tables.SetFilter("isoft_module = " + String(ii_curr_isoft_module) + " and table_name <> 'idp_users' and table_name <> 'security_users'  and table_name <> 'ctx_custom_multi_detail'" )
	//Added By Jay Chen 10-13-2014
	if tab_1.tabpage_hdr.dw_imp_hdr.GetRow() > 0 then 
		ll_sync_type = tab_1.tabpage_hdr.dw_imp_hdr.getitemnumber( tab_1.tabpage_hdr.dw_imp_hdr.GetRow() , "sync_salesforce")
		if ll_sync_type = 0 then 
			dw_tables.SetFilter("isoft_module = " + String(ii_curr_isoft_module) + " and table_name <> 'idp_users' and table_name <> 'security_users'  and table_name <> 'ctx_custom_multi_detail'  " )  //Modified By Ken.Guo 2017-04-10 support documents
		elseif ll_sync_type = 1 then
			//dw_tables.SetFilter("isoft_module = " + String(ii_curr_isoft_module) + " and (table_name = 'ctx_basic_info' or table_name = 'ctx_am_document' or table_name = 'ctx_products') ")
			dw_tables.SetFilter("isoft_module = " + String(ii_curr_isoft_module) + " and (table_name = 'ctx_basic_info' or table_name = 'ctx_am_document' or table_name = 'ctx_products' or table_name = 'app_facility' or table_name = 'ctx_contacts' or table_name = 'ctx_custom' or table_name = 'ctx_contacts_numbers') ")  //Modified by Harry 2017-03-15 for Task 749
		end if
	end if
	//end
End If
dw_tables.Filter()
dw_tables.Event RowFocusChanged(dw_tables.GetRow())

// Filter records of dw_records
dw_records.SetFilter("import_id = " + String(il_curr_import_id))
dw_records.Filter()

///////////////////////////[2.Retrieve]//////////////////////////////////////
// Retrieve records of dw_map_fields and dw_field_list
if dw_records.RowCount() > 0 then
	for i = 1 to dw_records.RowCount()
		ll_table_records_id[i] = dw_records.object.table_records_id[i]
	next
	
	gnv_appeondb.of_StartQueue()
	dw_map_fields.Retrieve(ll_table_records_id)	
	dw_field_list.Retrieve(il_curr_import_id)	
	gnv_appeondb.of_CommitQueue()
		
	dw_records.Event RowFocusChanged(dw_records.GetRow())
else
	dw_map_fields.Reset()
	dw_prac_cont_id.Reset()
	dw_field_list.Retrieve(il_curr_import_id)
end if
dw_field_list.SelectRow(1, true)

///////////////////////////[3.Initialize DDDW]////////////////////////////////
// import_field_id DDDW
if dw_field_list.RowCount() > 0 then
	// DDDW of dw_map_fields
	dw_map_fields.GetChild("import_field_id", ldwc_Child)
	ldwc_Child.Reset()
	dw_field_list.RowsCopy(1, dw_field_list.RowCount(), Primary!, ldwc_Child, 1, Primary!)
	dw_map_fields.SetRedraw(true)
	
	// DDDW of dw_detail
	dw_detail.GetChild("import_field_id", ldwc_Child)
	ldwc_Child.Reset()
	dw_field_list.RowsCopy(1, dw_field_list.RowCount(), Primary!, ldwc_Child, 1, Primary!)
	dw_detail.SetRedraw(true)	

	// DDDW of dw_prac_cont_id
	//dw_prac_cont_id.GetChild("import_field_id", ldwc_Child)
	//ldwc_Child.Reset()
	//dw_field_list.RowsCopy(1, dw_field_list.RowCount(), Primary!, ldwc_Child, 1, Primary!)	
end if
//dw_map_fields.GetChild("isoft_field_id", ldwc_Temp)
//dw_prac_cont_id.GetChild("isoft_field_id", ldwc_Child)
//ldwc_Child.Reset()
//ldwc_Temp.RowsCopy(1, ldwc_Temp.RowCount(), Primary!, ldwc_Child, 1, Primary!)
//dw_prac_cont_id.SetRedraw(true)

///////////////////////////[4.Others]////////////////////////////////////////
dw_detail.object.t_import_id.text = String(il_curr_import_id)
this.SetRedraw(true)
end event

event type integer ue_save();integer i, ll_SelectRow
boolean lb_DoCommit = false
DataWindowChild ldw_Child
string ls_field_name //Added By Jay Chen 07-16-2014
long ll_row //Added By Jay Chen 07-16-2014
boolean lb_invalid_field = false

/////////////////////////////////////////////////////////////////////////////////////////
// Update import field
if dw_imp_field_detail.AcceptText() = -1 then Return -1
//Added By Jay Chen 07-16-2014 remark:check field name
for ll_row = 1 to dw_field_list.rowcount()
	ls_field_name = dw_field_list.getitemstring(ll_row,"imp_field_name")
	if Not of_field_name_check(ls_field_name) then
		dw_imp_field_detail.scrolltorow(ll_row)
		dw_field_list.scrolltorow(ll_row)
		dw_imp_field_detail.setfocus()
		dw_imp_field_detail.setcolumn("imp_field_name")
		lb_invalid_field = true
		exit
	end if
next
if lb_invalid_field then 
	messagebox("Invalid Field Name","The field name " + ls_field_name + " is invalid. It must start with a letter and can include any combination of letters, numbers, and underscores.")
	Return -1
end if
//end
	
if dw_field_list.ModifiedCount() + dw_field_list.DeletedCount() > 0 then
	lb_DoCommit = true
	
	// Reset field order
	dw_field_list.SetSort("field_order A")
	dw_field_list.Sort()
	for i = 1 to dw_field_list.RowCount()
		dw_field_list.SetItem(i, "field_order", i * 10)
	next
	ll_SelectRow = dw_field_list.GetSelectedRow(0)
	if ll_SelectRow <= 0 then ll_SelectRow = 1		
	dw_field_list.ScrollToRow(ll_SelectRow)
	dw_imp_field_detail.ScrollToRow(ll_SelectRow)
		
	// Update import field
	if dw_field_list.Update() <> 1 then
		of_CompleteTrans(false)
		MessageBox("Error", is_mapfield_errinfo, StopSign!)
		Return -1
	end if

	// initialize DDDW
	//dw_prac_cont_id.GetChild("import_field_id", ldw_Child)
	//ldw_Child.Reset()
	//dw_field_list.RowsCopy(1, dw_field_list.RowCount(), Primary!, ldw_Child, 1, Primary!)
		
	dw_map_fields.GetChild("import_field_id", ldw_Child)
	ldw_Child.Reset()
	dw_field_list.RowsCopy(1, dw_field_list.RowCount(), Primary!, ldw_Child, 1, Primary!)
		
	dw_detail.GetChild("import_field_id", ldw_Child)
	ldw_Child.Reset()
	dw_field_list.RowsCopy(1, dw_field_list.RowCount(), Primary!, ldw_Child, 1, Primary!)
	
	//dw_prac_cont_id.SetRedraw(true)
	dw_map_fields.SetRedraw(true)
	dw_detail.SetRedraw(true)
	ib_ChangeData = True
end if

/////////////////////////////////////////////////////////////////////////////////////////
// Update mapped field
dw_detail.AcceptText()
if dw_map_fields.ModifiedCount() + dw_map_fields.DeletedCount() > 0 then
	lb_DoCommit = true
		
	if dw_map_fields.Update() <> 1 then
		of_CompleteTrans(false)
		MessageBox("Error", is_mapfield_errinfo, StopSign!)
		Return -1
	end if
	ib_ChangeData = True
end if

if lb_DoCommit then of_CompleteTrans(true)



Return 1
end event

event ue_checkmapping();string ls_LogList
string ls_Error
string ls_Null[]
string ls_ErrorText[]
string ls_table_name
string ls_table_name_allias
string ls_projectid
integer i, j, li_ErrorCount
long ll_FindRow
long ll_InsertRow
long ll_table_id
long ll_table_records_id[]
long ll_projectid
n_cst_import lnv_import
DataStore lds_table_record
DataStore lds_import_field
DataStore lds_mapping_field

lnv_import = Create n_cst_import
lds_table_record = Create DataStore
lds_import_field = Create DataStore
lds_mapping_field = Create DataStore


////////////////////////////////////////[1-Check Import Table]//////////////////////////////////////
lds_table_record.DataObject = "d_import_ds_table"
for i = 1 to dw_records.RowCount()
	ll_table_id = dw_records.object.isoft_table_id[i]
	ll_table_records_id[i] = dw_records.object.table_records_id[i]
	ll_FindRow = dw_tables.Find("table_id=" + String(ll_table_id), 1, dw_tables.RowCount())
	if ll_FindRow > 0 then
		ll_InsertRow = lds_table_record.InsertRow(0)
		lds_table_record.object.isoft_table_id[ll_InsertRow] = ll_table_id
		lds_table_record.object.table_name[ll_InsertRow] = dw_tables.object.table_name[ll_FindRow]
		lds_table_record.object.table_name_allias[ll_InsertRow] = dw_tables.object.table_name_allias[ll_FindRow]
	end if
next
If is_ImportType = '1' Then
	ls_Error = lnv_import.of_CheckImportTable(lds_table_record)
Else
	ls_Error = lnv_import.of_CheckImportTable(lds_table_record, is_ImportType )
End If
if Len(ls_Error) > 0 then	
	Destroy lnv_import
	Destroy lds_table_record
	Destroy lds_import_field
	Destroy lds_mapping_field
	MessageBox("Prompt", ls_Error)
	Return	
end if
	
////////////////////////////////////////[2-Check Import File Fields]////////////////////////////////
lds_import_field.DataObject = dw_field_list.DataObject
dw_imp_field_detail.AcceptText()
dw_field_list.RowsCopy(1, dw_field_list.RowCount(), Primary!, lds_import_field, 1, Primary!)
If is_ImportType = '1' Then ls_Error = lnv_import.of_VerifyImportField(lds_import_field)
if Len(ls_Error) > 0 then
	Destroy lnv_import
	Destroy lds_table_record
	Destroy lds_import_field
	Destroy lds_mapping_field
	MessageBox("Prompt", ls_Error)
	Return
end if

////////////////////////////////////////[3-Check Mapping]//////////////////////////////////////////
// Get imformation
Destroy lnv_import
if ii_curr_isoft_module = 1 then
	lnv_import = Create n_cst_import_credapp	
else
	lnv_import = Create n_cst_import_contract
end if
lds_mapping_field.DataObject = "d_import_ds_mapfield"
lds_mapping_field.SetTransObject(SQLCA)
gnv_appeondb.of_StartQueue()
//Event pfc_save() modified by gavins 20140505
tab_1.tabpage_hdr.Event ue_save()
tab_1.tabpage_field_data.Event ue_save()

lnv_import.ids_dataview_screen.Retrieve(1)
lds_mapping_field.Retrieve(ll_table_records_id[])
gnv_appeondb.of_CommitQueue()

If tab_1.tabpage_hdr.dw_imp_hdr.GetRow( ) > 0 Then
	ll_projectid = tab_1.tabpage_hdr.dw_imp_hdr.GetItemnumber( tab_1.tabpage_hdr.dw_imp_hdr.GetRow( ), 'project_id' )	
	if not isnull( ll_projectid  ) Then
		ls_projectid = string( ll_projectid )
	Else
		ls_projectid = ""
	End If
End If

// Check mapping
lnv_import.is_ImportType = is_ImportType //Added By Gavin.Jay 2017-04-10 when is_ImportType = '2' state column don't checkMapping
for i = 1 to lds_table_record.RowCount()
	ls_ErrorText [] = ls_Null[]
	ll_table_id = lds_table_record.object.isoft_table_id[i]
	ls_table_name = Lower(lds_table_record.object.table_name[i])
	lds_mapping_field.SetFilter("table_records_id=" + String(ll_table_records_id[i]))
	lds_mapping_field.Filter()
	if is_ImportType = '2' Then 
		lnv_import.il_sync_salesforce = il_sync_salesforce  //Added by Harry 20170321 for task749
		//Added By Ken.Guo 2017-04-26		
		lnv_import.is_sf_objectname = tab_1.tabpage_hdr.dw_browse.object.import_sfobject[tab_1.tabpage_hdr.dw_browse.getrow()]
		
		li_ErrorCount = lnv_import.of_CheckMapping(false, ll_table_id, ls_table_name, lds_import_field, lds_mapping_field, ls_ErrorText[], ls_projectid, lds_table_record )//modified by gavins 20140505
	Else
		li_ErrorCount = lnv_import.of_CheckMapping(false, ll_table_id, ls_table_name, lds_import_field, lds_mapping_field, ls_ErrorText[] )
	End If
	if li_ErrorCount > 0 then
		ls_table_name_allias = lds_table_record.object.table_name_allias[i]
		ls_LogList += "[" + ls_table_name_allias + "]~r~n"
		for j = 1 to li_ErrorCount
			If j>upperbound( ls_ErrorText[] ) Then continue
			ls_LogList += String(j) + "." + ls_ErrorText[j] + "~r~n"
		next
		ls_LogList += "~r~n"
	end if	
next
Destroy lnv_import
Destroy lds_table_record
Destroy lds_import_field
Destroy lds_mapping_field

////////////////////////////////////////[4-Show check mapping result]//////////////////////////////
// Show result
if Len(ls_LogList) > 0 then
	OpenWithParm(w_import_loglist, "MAP#" + ls_LogList)
	If  tab_1.tabpage_hdr.dw_imp_hdr.GetRow( ) > 0 and is_ImportType = '2' Then//added by gavins 20140505
		tab_1.tabpage_hdr.dw_imp_hdr.SetItem( tab_1.tabpage_hdr.dw_imp_hdr.GetRow( ), 'import_flag', '0' )
		tab_1.tabpage_hdr.Event ue_save()
	End If
else
	MessageBox("Prompt", "Mapping design is OK.")
	If  tab_1.tabpage_hdr.dw_imp_hdr.GetRow( ) > 0 and is_ImportType = '2' Then
		tab_1.tabpage_hdr.dw_imp_hdr.SetItem( tab_1.tabpage_hdr.dw_imp_hdr.GetRow( ), 'import_flag', '1' )
		tab_1.tabpage_hdr.Event ue_save()
	End If
end if
end event

event ue_deleteimportfield();long ll_Null
long ll_CurrentRow
long ll_import_field_id

SetNull(ll_Null)
ll_CurrentRow = dw_field_list.GetRow()
if ll_CurrentRow <= 0 then Return

if MessageBox("Delete", "Are you sure you want to delete the selected sync field?", &
	Question!, YesNo!,2) = 2 then
	Return
end if

ll_import_field_id = dw_field_list.object.rec_id[ll_CurrentRow]
dw_field_list.DeleteRow(0)
dw_imp_field_detail.ScrollToRow(dw_field_list.GetRow())

//for ll_CurrentRow = 1 to dw_prac_cont_id.RowCount()
//	if dw_prac_cont_id.object.import_field_id[ll_CurrentRow] = ll_import_field_id then
//		dw_prac_cont_id.object.import_field_id[ll_CurrentRow] = ll_Null
//	end if
//next

for ll_CurrentRow = 1 to dw_map_fields.RowCount()
	if dw_map_fields.object.import_field_id[ll_CurrentRow] = ll_import_field_id then
		dw_map_fields.object.import_field_id[ll_CurrentRow] = ll_Null
	end if
next
end event

event ue_addimportfield();long ll_InsertRow
long ll_CurrentRow
long ll_ImportID

dw_imp_field_detail.AcceptText()

ll_CurrentRow = tab_1.tabpage_hdr.dw_browse.GetRow()
if ll_CurrentRow <= 0 then Return	
ll_ImportID = tab_1.tabpage_hdr.dw_browse.object.import_id[ll_CurrentRow]

dw_field_list.SetSort("field_order A")
dw_field_list.Sort()
dw_imp_field_detail.ScrollToRow(1)

ll_InsertRow = dw_field_list.InsertRow(0)
dw_imp_field_detail.object.import_id[ll_InsertRow] = ll_ImportID
if ll_InsertRow = 1 then
	dw_imp_field_detail.object.field_order[ll_InsertRow] = 10
else
	dw_imp_field_detail.object.field_order[ll_InsertRow] = dw_imp_field_detail.object.field_order[ll_InsertRow - 1] + 10
end if
dw_imp_field_detail.object.field_length[ll_InsertRow] = 100
dw_field_list.ScrollToRow(ll_InsertRow)

dw_imp_field_detail.SetColumn("imp_field_name")
dw_imp_field_detail.SetFocus()
end event

event ue_resize();Long ll_left_fixed_width = 896,ll_right_fixed_width = 1030, ll_mid_x

/////////////////////////////////////////////////////////////////
//Resize right DW
dw_field_list.X = this.Width - dw_field_list.Width - 10
dw_imp_field_detail.X = dw_field_list.X
cb_com_wizard.X = dw_field_list.X
cb_create_value_list.X = cb_com_wizard.X + cb_com_wizard.Width + 40

dw_field_list.Height = this.Height - dw_imp_field_detail.Height - 110
dw_imp_field_detail.Y = dw_field_list.Y + dw_field_list.Height
cb_com_wizard.Y = dw_imp_field_detail.Y + dw_imp_field_detail.Height + 10
cb_create_value_list.Y = cb_com_wizard.Y
//
////Resize middle DW
ll_mid_x= (dw_field_list.X - ll_left_fixed_width - dw_records.Width) / 2 + ll_left_fixed_width + 5
//Added By Ken.Guo 06/05/2014
If ll_mid_x < 955 Then ll_mid_x = 955
dw_records.X = ll_mid_x

//dw_prac_cont_id.X = dw_records.X
dw_map_fields.X = dw_records.X
dw_detail.X = dw_records.X

dw_detail.Y = this.Height - dw_detail.Height - 5
dw_map_fields.Height = dw_detail.Y - dw_map_fields.Y

//Resize left DW
dw_fields.Height = this.Height - dw_tables.Height - 12

/////////////////////////////////////////////////////////////////
//Resize line
ln_1.EndX = dw_records.X + 50

//ln_2.EndX = dw_prac_cont_id.X + 50
//ln_2.EndY = dw_prac_cont_id.Y + 100

ln_3.EndX = dw_records.X + 50 //ln_2.EndX
ln_3.EndY = dw_map_fields.Y + 350

//ln_4.BeginX = dw_prac_cont_id.X + dw_prac_cont_id.Width - 10
//ln_4.EndX = dw_field_list.X + 50
//ln_4.EndY = dw_field_list.Y + 150

ln_5.BeginX = dw_map_fields.X + dw_map_fields.Width - 10
ln_5.EndX = dw_field_list.X + 50
ln_5.EndY = dw_field_list.Y + 550


//Added By Ken.Guo 06/05/2014
//Left DW Band
long ll_xPos, ll_Left_max_width = 1200 , ll_left_width
Long ll_Right_max_width = 1500,ll_right_width
ll_left_width = dw_records.x - 70
If ll_left_width > ll_Left_max_width Then ll_left_width = ll_Left_max_width
If ll_left_width > ll_left_fixed_width Then //Default width
	dw_tables.width = ll_left_width
	dw_fields.width = dw_tables.width
Else
	dw_tables.width = ll_left_fixed_width
	dw_fields.width = dw_tables.width
End If

//Right DW Band
ll_right_width = This.Width - dw_records.width - dw_records.x - 70
If ll_right_width > ll_Right_max_width Then ll_right_width = ll_Right_max_width
If ll_right_width > ll_right_fixed_width Then //Default width
	dw_field_list.x = This.Width - ll_right_width - 10
	dw_field_list.width = ll_right_width
	dw_imp_field_detail.width = dw_field_list.width
	dw_imp_field_detail.x = dw_field_list.x
Else
	dw_field_list.x = This.Width - ll_right_fixed_width - 10
	dw_field_list.width = ll_right_fixed_width
	dw_imp_field_detail.width = dw_field_list.width
	dw_imp_field_detail.x = dw_field_list.x	
End If
cb_com_wizard.X = dw_field_list.X
cb_create_value_list.X = cb_com_wizard.X + cb_com_wizard.Width + 40



	


end event

event ue_copymap();long ll_Null
long ll_CopyRow
long ll_InsertRow
long i, ll_RowCount
long ll_table_id
long ll_table_records_id

SetNull(ll_Null)
if dw_detail.Enabled = false then Return
ll_CopyRow = dw_records.GetRow()
if ll_CopyRow <= 0 then
	MessageBox("Prompt", "There is no Import to be copied.") //Start Code Change ----02.07.2008 #V8 maha - modified message
	Return
end if

// Copy import table record
ll_table_id = dw_records.object.isoft_table_id[ll_CopyRow]
ll_InsertRow = of_GetInsertRow(ll_table_id)
ll_InsertRow = dw_records.InsertRow(ll_InsertRow)
dw_records.SetItem(ll_InsertRow, "isoft_table_id", ll_table_id)
dw_records.SetItem(ll_InsertRow, "import_id", il_curr_import_id)
for i = 1 to dw_records.RowCount()
	dw_records.SetItem(i, "sort_no", i)
next

if dw_records.Update() <> 1 then
	of_CompleteTrans(false)
	MessageBox("Error", is_mapfield_errinfo, StopSign!)
	Return
else
	of_CompleteTrans(true)	
end if
ll_table_records_id = dw_records.object.table_records_id[ll_InsertRow]

// Copy mapped records
ll_RowCount = dw_map_fields.RowCount()
if ll_RowCount <= 0 then
	dw_records.SelectRow(0, false)
	dw_records.SelectRow(ll_InsertRow, true)
	dw_records.ScrollToRow(ll_InsertRow)
	Return
end if

dw_map_fields.SetRedraw(false)
dw_map_fields.RowsCopy(1, ll_RowCount, Primary!, dw_map_fields, 1, Primary!)
for i = 1 to ll_RowCount
	dw_map_fields.SetItem(i, "rec_id", ll_Null)
	dw_map_fields.SetItem(i, "table_records_id", ll_table_records_id)
next
if dw_map_fields.Update() <> 1 then
	of_CompleteTrans(false)
	dw_map_fields.SetRedraw(true)
	MessageBox("Error", is_mapfield_errinfo, StopSign!)
	Return
else
	of_CompleteTrans(true)
end if

// Refresh dw_map_fields
dw_records.ScrollToRow(ll_InsertRow)
dw_records.Event RowFocusChanged(ll_InsertRow)
dw_map_fields.SetRedraw(true)
end event

event pfc_cst_save_check();//added by gavins 20140505
If is_ImportType = '2'  Then tab_1.tabpage_field_data.Event ue_CheckMapping()

end event

event constructor;this.Event ue_init()
end event

type cb_create_value_list from commandbutton within tabpage_field_data
integer x = 3717
integer y = 1892
integer width = 457
integer height = 84
integer taborder = 51
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Create &Value List..."
end type

event clicked;long ll_CurrentRow
string ls_import_name
string ls_imp_field_name
string ls_Parm
integer li_Return

dw_imp_field_detail.AcceptText()
if dw_field_list.RowCount() <= 0 then
	MessageBox("Prompt", "Please add import field.")
	Return
end if
li_Return = tab_1.tabpage_field_data.Event ue_save()
if li_Return = -1 then Return

ll_CurrentRow = tab_1.tabpage_hdr.dw_browse.GetRow()
ls_import_name = tab_1.tabpage_hdr.dw_browse.object.import_name[ll_CurrentRow]

ll_CurrentRow = dw_field_list.GetRow()
ls_imp_field_name = dw_field_list.object.imp_field_name[ll_CurrentRow]
if IsNull(ls_imp_field_name) then ls_imp_field_name = ""

ls_Parm = String(il_curr_import_id) + "|" + ls_import_name + "|" + ls_imp_field_name
OpenWithParm(w_import_valuelist, ls_Parm)
end event

type cb_com_wizard from commandbutton within tabpage_field_data
integer x = 3232
integer y = 1892
integer width = 448
integer height = 84
integer taborder = 51
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Compute &Wizard..."
end type

event clicked;string ls_Error
string ls_Syntax
string ls_SQLSelect
string ls_imp_field_name
long  ll_InsertRow
long  ll_CurrentRow
long  i, ll_RowCount

dw_imp_field_detail.AcceptText()
ll_RowCount = dw_field_list.RowCount()
if ll_RowCount <= 0 then
	MessageBox("Prompt", "Please add import field.")
	Return
end if
	
for i = 1 to ll_RowCount
	ls_imp_field_name = dw_field_list.object.imp_field_name[i]
	if IsNull(ls_imp_field_name) or ls_imp_field_name = "" then Continue
	if Len(ls_SQLSelect) > 0 then ls_SQLSelect += ","
	ls_SQLSelect += "field_" + String(i) + " " + ls_imp_field_name
next

ls_SQLSelect = "SELECT " + ls_SQLSelect + " FROM import_table_gen"
ls_Syntax = SQLCA.SyntaxFromSQL(ls_SQLSelect, "", ls_Error)
dw_compute_verify.DataObject = ""
dw_compute_verify.Create(ls_Syntax, ls_Error)
dw_compute_verify.tag = dw_imp_field_detail.object.comp_def[dw_imp_field_detail.GetRow()]

OpenWithParm(w_compute_wizard, dw_compute_verify)
if Message.StringParm <> "cancel!" then	
	ll_CurrentRow = dw_imp_field_detail.GetRow()
	dw_imp_field_detail.object.comp_def[ll_CurrentRow] = Message.StringParm
	if Len(Message.StringParm) > 0 then
		dw_imp_field_detail.object.field_format[ll_CurrentRow] = ""
		dw_imp_field_detail.object.case_type[ll_CurrentRow] = ""
		dw_imp_field_detail.object.strip_type[ll_CurrentRow] = ""
		dw_imp_field_detail.object.default_value[ll_CurrentRow] = ""		
		cb_create_value_list.Enabled = false
	else
		cb_create_value_list.Enabled = true
	end if	
	/*
	if dw_imp_field_detail.RowCount() = 1 or &
	ll_CurrentRow = dw_imp_field_detail.RowCount() or &		
	Len(String(dw_imp_field_detail.object.comp_def[ll_CurrentRow])) > 0 then
		dw_imp_field_detail.object.comp_def[ll_CurrentRow] = Message.StringParm
		dw_imp_field_detail.object.field_format[ll_CurrentRow] = ""
		dw_imp_field_detail.object.case_type[ll_CurrentRow] = ""
		dw_imp_field_detail.object.strip_type[ll_CurrentRow] = ""
		dw_imp_field_detail.object.default_value[ll_CurrentRow] = ""
	else				
		ll_InsertRow = dw_imp_field_detail.InsertRow(0)	
		dw_imp_field_detail.object.import_id[ll_InsertRow] = il_curr_import_id
		dw_imp_field_detail.object.comp_def[ll_InsertRow] = Message.StringParm
		dw_imp_field_detail.object.imp_field_name[ll_InsertRow] = dw_imp_field_detail.object.imp_field_name[ll_CurrentRow]
		dw_imp_field_detail.object.field_length[ll_InsertRow] = 100
		
		if ll_InsertRow = 1 then
			dw_imp_field_detail.object.field_order[ll_InsertRow] = 10
		else
			dw_imp_field_detail.object.field_order[ll_InsertRow] = dw_imp_field_detail.object.field_order[ll_InsertRow - 1] + 10
		end if
		
		dw_field_list.ScrollToRow(ll_InsertRow)
		dw_imp_field_detail.DeleteRow(ll_CurrentRow)
	end if
	*/
end if
end event

type cb_edit_map from commandbutton within tabpage_field_data
boolean visible = false
integer x = 2734
integer y = 20
integer width = 402
integer height = 84
integer taborder = 31
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Edit Mappings"
end type

event clicked;//openwithparm(w_import_mapping_edit,il_import_id)
end event

type dw_detail from u_dw within tabpage_field_data
event ue_keydown pbm_dwnkey
integer x = 955
integer y = 1240
integer width = 2203
integer height = 740
integer taborder = 90
boolean titlebar = true
string title = "Mapped Field Detail"
string dataobject = "d_import_map_detail_sf"
boolean vscrollbar = false
borderstyle borderstyle = stylebox!
end type

event ue_keydown;if Key = KeyDownArrow! or Key = KeyUpArrow! or Key = KeyPageUp! or Key = KeyPageDown! then 
	Return 1
else
	Return 0
end if
end event

event itemchanged;call super::itemchanged;//inherit
long ll_rec_id
long ll_FindRow
long ll_InsertRow
long ll_Null
string ls_Null
string ls_Value
string ls_FiledName, displayvalue
DataWindowChild ldwc_Child
DataWindowChild ldwc_FieldChild

SetNull(ls_Null)
SetNull(ll_Null)
this.AcceptText()

/////////////////////////////////////////////////////////////////////////////////////////////////
// Key field and ID field synchronization
/*
if (Lower(is_curr_table_name) = "pd_basic" or Lower(is_curr_table_name) = "ctx_basic_info") and (dwo.name = "key_field") then
	ll_FindRow = dw_prac_cont_id.Find("rec_id=" + String(this.object.rec_id[Row]), 1, dw_prac_cont_id.RowCount())
	if Data = "1" then
		if ll_FindRow <= 0 then
			ll_InsertRow = dw_prac_cont_id.InsertRow(0)
			dw_prac_cont_id.object.rec_id[ll_InsertRow] = this.object.rec_id[Row]
			dw_prac_cont_id.object.table_records_id[ll_InsertRow] = this.object.table_records_id[Row]
			dw_prac_cont_id.object.isoft_field_id[ll_InsertRow] = this.object.isoft_field_id[Row]
			dw_prac_cont_id.object.import_field_id[ll_InsertRow] = this.object.import_field_id[Row]
			dw_prac_cont_id.object.id_field[ll_InsertRow] = 1
			ll_FindRow = ll_InsertRow
		end if
		dw_prac_cont_id.ScrollToRow(ll_FindRow)
		this.Post SetItem(Row, "id_field", 1)
	else
		if ll_FindRow > 0 then dw_prac_cont_id.DeleteRow(ll_FindRow)
		this.Post SetItem(Row, "id_field", 0)
	end if
	Return 0
end if
*/

////////////////////////////////////////////////////////////////////////////////////////////////
// Specify item change
choose case dwo.name
	case "null_type"
		if Data = "2" then //Use text default
			this.Post SetColumn("null_value")
		else
			this.SetItem(Row, "null_value", ls_Null)
		end if
		if Data = "3" then //Use column value
			this.Post SetColumn("link_value")
		else
			this.SetItem(Row, "link_value", ll_Null)
		end if
		
	case "null_value"	
		if Lower(Trim(Data)) = "* select value *" then
			if of_SelectValue(ls_Value) = 1 then
				this.Post SetItem(Row, "null_value", ls_Value)
			else
				ls_Value = this.GetItemString(Row, "null_value", Primary!, true)
				this.Post SetItem(Row, "null_value", ls_Value)
			end if
		end if
		
	case "lu_template"
		if Len(Data) > 0 then
			this.SetItem(Row, "lu_type", ls_Null)
			this.SetItem(Row, "lu_table", ls_Null)
			this.SetItem(Row, "lu_field_name", ls_Null)
		else			
			this.Post SetItem(Row, "lu_template", ll_Null)
			this.SetColumn("lu_type")
			this.Post SetFocus()
		end if
		
	case "lu_type"
		If is_ImportType = '2' Then
			displayvalue = dw_map_fields.Describe( "Evaluate('LookUpDisplay(isoft_field_id) ', " + string(dw_map_fields.Getrow( )) + ")") ///added by gavins 20140804
			if lower(displayvalue) = 'salesforce id' Then
				MessageBox( 'Tips', 'Salesforce id column’s Lu Type cannot be modified.' )
				SetItem( row, 'lu_type', ls_null )
				this.SetItem(Row, "lu_table", ls_Null)
				this.SetItem(Row, "lu_field_name", ls_Null)
				Return 2
			End If
		End If
		this.SetItem(Row, "lu_table", ls_Null)
		this.SetItem(Row, "lu_field_name", ls_Null)
		this.GetChild("lu_field_name", ldwc_FieldChild)
		choose case Data
			case "A" //Address
				this.GetChild("lu_table_dddw", ldwc_Child)
				ldwc_Child.Reset()
				ids_LookUpTableDDDW[1].RowsCopy(1, ids_LookUpTableDDDW[1].RowCount(), Primary!, ldwc_Child, 1, Primary!)
				ldwc_Child.InsertRow(1)
				ldwc_FieldChild.SetFilter("(lookup_type='A' and id<>1) or id=0")
			case "C" //Code
				this.GetChild("lu_table_dddw", ldwc_Child)
				ldwc_Child.Reset()
				ids_LookUpTableDDDW[2].RowsCopy(1, ids_LookUpTableDDDW[2].RowCount(), Primary!, ldwc_Child, 1, Primary!)
				ldwc_Child.InsertRow(1)
				ldwc_FieldChild.SetFilter("(lookup_type='C' and id<>1) or id=0")
			case "F" //Facility
				this.SetItem(Row, "lu_table", "Facility")
				ldwc_FieldChild.SetFilter("(lookup_type='F' and id<>1) or id=0")
			case "M" //Committee
				this.SetItem(Row, "lu_table", "Committee")
				ldwc_FieldChild.SetFilter("(lookup_type='M' and id<>1) or id=0")
			case "I"	//Company
				this.SetItem(Row, "lu_table", "Company")
				If is_ImportType = '2' Then//modified by gavins 20140505
					ldwc_FieldChild.SetFilter("(lookup_type='I' and id<>1) or id=0")					
				Else
					ldwc_FieldChild.SetFilter("(lookup_type='I' and id<>1 and id <> 8 ) or id=0")					
				End If
			case "J"
				this.SetItem(Row, "lu_table", "Contract")
				ldwc_FieldChild.SetFilter("(lookup_type='I' and id = 8 ) or id=0")	
			case "T"  //Added by Harry 20170321 for task749
				this.SetItem(Row, "lu_table", "Contact")
				ldwc_FieldChild.SetFilter("(lookup_type='I' and id = 8 ) or id=0")	
		end choose
		ldwc_FieldChild.Filter()
		
		If is_ImportType = '2' And Match( Data, "[A,F,M,I,J]" )  Then
			this.SetItem(Row,'no_match_procd', 2 )
		End If
		
	case "lu_table_dddw"
		this.SetItem(Row, "lu_field_name", ls_Null)
		
	case "facility_id"
		this.object.import_field_id[Row]	= ll_Null
		//ll_rec_id = this.object.rec_id[Row]
		//ll_FindRow = dw_prac_cont_id.Find("rec_id=" + String(ll_rec_id), 1, dw_prac_cont_id.RowCount())
		//if ll_FindRow > 0 then
		//	dw_prac_cont_id.object.import_field_id[ll_FindRow]	= ll_Null
		//end if
		
	//case "key_field"
		//if this.object.id_field[Row] = 1 and (is_curr_table_name <> "pd_basic" or is_curr_table_name <> "ctx_basic_info") then
		//	ls_FiledName = this.Describe("Evaluate('LookUpDisplay(isoft_field_id)', " + String(Row) + ")")
		//	MessageBox("Id Field", "The '" + ls_FiledName + "' field was not set as an Identification field, because it must belong to Basic Information table.")  //Start Code Change ----02.07.2008 #V8 maha - changed message
			
		//	this.Post SetItem(Row, "key_field", 0)
		//end if
	Case 'lu_field_name'
		If 	this.GetItemString(Row, "lu_table" ) =  "Company" And  is_ImportType = '1'  Then //modified by gavins 20140505
			If Data <> 'facility_name' Then
				MessageBox( 'Tips', 'When the value for Lu Type is “company” and the Lu field value is not “company name”, 	the system will ignore “no match procd” option.~r~n' + &
				'If the imported value does not match any value in company lookup, it will be written to the error log.' )
				
			End If			
		End If
	Case 'no_match_procd'//modified by gavins 20140505
		If is_ImportType = '2' And Match( GetItemString( row, 'lu_type' ) ,  "[A,F,M,I,J,T]" ) And data <> '2' Then
			MessageBox( 'Tips', 'Except importing the type (code) outside when there is no matching value approach can only be "Error"' )
			SetItem( row, 'no_match_procd', 2 )
			Return 2
		End If
end choose
end event

event clicked;call super::clicked;//inherit
DataWindowChild ldwc_Child

choose case dwo.name 
	case "link_value"
		this.GetChild("link_value", ldwc_Child)
		ldwc_Child.Reset()
		dw_field_list.RowsCopy(1, dw_field_list.RowCount(), Primary!, ldwc_Child, 1, Primary!)		
		
	case "lu_table_dddw"		
		this.GetChild("lu_table_dddw", ldwc_Child)	
		ldwc_Child.Reset()
		if this.object.lu_type[Row] = 'A' then		
			ids_LookUpTableDDDW[1].RowsCopy(1, ids_LookUpTableDDDW[1].RowCount(), Primary!, ldwc_Child, 1, Primary!)
		else
			ids_LookUpTableDDDW[2].RowsCopy(1, ids_LookUpTableDDDW[2].RowCount(), Primary!, ldwc_Child, 1, Primary!)
		end if
		ldwc_Child.InsertRow(1)				
	
end choose
end event

event rowfocuschanged;call super::rowfocuschanged;//Inherit
DataWindowChild ldwc_Child

if CurrentRow > 0 then
	this.GetChild("lu_field_name", ldwc_Child)
	choose case this.object.lu_type[CurrentRow]
		case "A" //Address
			ldwc_Child.SetFilter("(lookup_type='A' and id<>1) or id=0")
		case "C" //Code
			ldwc_Child.SetFilter("(lookup_type='C' and id<>1) or id=0")
		case "F" //Facility
			ldwc_Child.SetFilter("(lookup_type='F' and id<>1) or id=0")
		case "M" //Committee
			ldwc_Child.SetFilter("(lookup_type='M' and id<>1) or id=0")
		case "I"	//Company
			ldwc_Child.SetFilter("(lookup_type='I' and id<>1) or id=0")
	end choose	
	ldwc_Child.Filter()
	this.SetRedraw(true)
end if
end event

event constructor;call super::constructor;//inherit
DataWindowChild ldwc_Child

this.GetChild("lu_type", ldwc_Child)
ldwc_Child.InsertRow(1)

If ldwc_Child.Find( "data_value = 'J'", 1, ldwc_Child.RowCount( ) ) = 0 Then
	ldwc_Child.InsertRow( 0 )
	ldwc_Child.SetItem( ldwc_Child.Rowcount( ) , 'data_value', 'J' ) 
	ldwc_Child.SetItem( ldwc_Child.Rowcount( ) , 'display_value', 'Contract' ) 			
End If


end event

event other;call super::other;if Message.WordParm = 61458 then 
	Message.Processed = true
	Message.ReturnValue = 0 
end if

if Message.Number = 522 then
	Return 1
end if
end event

event buttonclicked;call super::buttonclicked;long ll_lu_template

ll_lu_template = this.object.lu_template[Row]
if dwo.name = "b_viewlookups" then
	OpenWithParm(w_import_lookup_mapping, ll_lu_template)
end if
end event

type dw_map_fields from u_dw within tabpage_field_data
event ue_sysfield_dragdrop ( long al_row )
event ue_impfield_dragdrop ( long al_row )
string tag = "dw_map_fields"
integer x = 955
integer y = 616
integer width = 2203
integer height = 624
integer taborder = 80
string dragicon = "row.ico"
boolean titlebar = true
string title = "Mapped Record Fields"
string dataobject = "d_import_mapping_fields_sf"
boolean livescroll = false
borderstyle borderstyle = stylebox!
end type

event ue_sysfield_dragdrop(long al_row);long ll_InsertRow
long ll_CurrentRow
long i, ll_FindRow
long ll_table_id
long ll_isoft_table_id
long ll_mapped_field_id
long ll_table_records_id
long ll_dv_field_id, ll_fieldsalesid, ll_Frow
string displayvalue, ls_Filter

// Get field ID and table ID
ll_table_id = dw_tables.object.table_id[dw_tables.GetRow()]
if dw_records.GetRow() > 0 then
	ll_isoft_table_id = dw_records.object.isoft_table_id[dw_records.GetRow()]
else
	ll_isoft_table_id = -1
end if

// Check field of drag whether already exists
if ll_table_id = ll_isoft_table_id then
	for i = 1 to il_SelectedCount
		ll_FindRow = dw_map_fields.Find("isoft_field_id=" + String(il_DragValue[i]), 1, dw_map_fields.RowCount())
		if ll_FindRow > 0 then
			dw_map_fields.ScrollToRow(ll_FindRow)
			dw_map_fields.SelectRow(0, false)
			dw_map_fields.SelectRow(ll_FindRow, true)
			MessageBox("Prompt", "The ContractLogix Field already exists.")
			Return
		end if
	next
end if

if ll_table_id = ll_isoft_table_id and al_Row > 0 then
	If is_ImportType = '2' Then
		//check salesforce id //added by gavins 20140804
		displayvalue = dw_map_fields.Describe( "Evaluate('LookUpDisplay(isoft_field_id) ', " + string(al_Row) + ")")
		if lower(displayvalue) = 'salesforce id' Then
			MessageBox( 'Tips', 'Salesforce id column cannot be modified.' )
			Return
		End If
		//
	End If
	
	// Replace a mapped field record
	ll_dv_field_id = dw_fields.object.field_id[il_DragRow]	
	ll_mapped_field_id = dw_map_fields.object.rec_id[al_Row]
	ll_FindRow = dw_prac_cont_id.Find("rec_id=" + String(ll_mapped_field_id), 1, dw_prac_cont_id.RowCount())
	if ll_FindRow > 0 then 
		dw_prac_cont_id.object.isoft_field_id[ll_FindRow] = ll_dv_field_id
		dw_prac_cont_id.ScrollToRow(ll_FindRow)	
	end if
	dw_map_fields.object.isoft_field_id[al_Row] = ll_dv_field_id	
	if dw_map_fields.Update() = 1 then
		of_CompleteTrans(true)
	else
		of_CompleteTrans(false)
		MessageBox("Error", is_mapfield_errinfo, StopSign!)
	end if
else
	// Insert a import table record
	if ll_table_id <> ll_isoft_table_id then
		if (il_sync_salesforce = 0) or (il_sync_salesforce = 1 and dw_records.rowcount() = 0 ) then //Added By Jay Chen 12-17-2014
			ll_InsertRow = of_GetInsertRow(ll_table_id)//added by gavins 20130222
			ll_InsertRow = dw_records.InsertRow(ll_InsertRow)//modify by gavins 0->ll_InsertRow
			ll_CurrentRow = tab_1.tabpage_hdr.dw_browse.GetRow()
			dw_records.object.import_id[ll_InsertRow] = tab_1.tabpage_hdr.dw_browse.object.import_id[ll_CurrentRow]
			dw_records.object.isoft_table_id[ll_InsertRow] = ll_table_id
			dw_records.ScrollToRow(ll_InsertRow)
			dw_prac_cont_id.Reset()
		
			// Set sort number (25:pd_basic, 1001:ctx_basic_info)
			if ll_table_id = 25 or ll_table_id = 1001 then
				for i = 1 to dw_records.RowCount()
					dw_records.SetItem(i, "sort_no", i)
				next
				dw_records.SetItem(dw_records.GetRow(), "sort_no", 0)
				dw_records.Sort()
				dw_records.ScrollToRow(1)
			elseif ll_InsertRow > 1 then
				dw_records.SetItem(ll_InsertRow, "sort_no", dw_records.object.sort_no[ll_InsertRow - 1] + 1)
				for i = 1 to dw_records.RowCount()//modify by gavins 20130222
					dw_records.SetItem(i, "sort_no", i)
				next
				dw_records.Sort()
				dw_records.ScrollToRow(ll_InsertRow)
			else
				dw_records.SetItem(ll_InsertRow, "sort_no", 1)
			end if		
		
			// Update import table records
			if dw_records.Update() <> 1 then
				of_CompleteTrans(false)
				MessageBox("Error", is_mapfield_errinfo, StopSign!)
				Return
			end if
		end if
	end if
	ll_table_records_id = dw_records.object.table_records_id[dw_records.GetRow()]
//	If is_ImportType = '2' Then 
	//Modified By Jay Chen 12-17-2014
	If is_ImportType = '2' and il_sync_salesforce = 0 Then 
		//check salesforce id //added by gavins 20140804
		ls_Filter = dw_fields.Describe( "datawindow.table.Filter" )
		If Pos( lower(ls_Filter ), 'salesforce_id' ) > 0 Then
			For i = 1 To dw_fields.FilteredCount()
				if ll_table_id = dw_fields.GetItemNumber( i, 'table_id', filter!, false ) and  'salesforce_id' = dw_fields.GetItemString( i, 'field_name', filter!, false )Then
					ll_fieldsalesid = dw_fields.GetItemNumber( i, 'field_id', filter!, false )
					ll_FRow = dw_map_fields.Find( "isoft_field_id = " + string( ll_fieldsalesid ) , 1, dw_map_fields.RowCount( ) )
					If ll_FRow > 0 Then EXIT
					ll_InsertRow = dw_map_fields.InsertRow( 0 )
					dw_map_fields.SetItem( ll_InsertRow, 'isoft_field_id', ll_fieldsalesid )
					dw_map_fields.SetItem( ll_InsertRow, 'table_records_id', ll_table_records_id )
				
					ll_FRow = dw_field_list.Find( "lower(imp_field_name)='id'", 1, dw_field_list.RowCount( ) )
					If ll_FRow > 0 Then
						dw_map_fields.SetItem( ll_InsertRow, 'import_field_id', dw_field_list.GetItemNumber( ll_FRow, 'rec_id' ) )
						dw_map_fields.SetItem( ll_InsertRow, 'lu_type', '' )
						dw_map_fields.SetItem( ll_InsertRow, 'lu_table', '' )
						dw_map_fields.SetItem( ll_InsertRow, 'lu_field_name', '' )
					End If
				End If
			Next
		End If
	End If
	// Insert mapped field records
	if (il_sync_salesforce = 0) or (il_sync_salesforce = 1 and (dw_fields.object.table_id[il_DragRow] = ll_isoft_table_id or ll_isoft_table_id = -1)) then //Added By Jay Chen 12-17-2014
		for i = 1 to il_SelectedCount
			ll_InsertRow = dw_map_fields.InsertRow(0)
			dw_map_fields.object.table_records_id[ll_InsertRow] = ll_table_records_id
			dw_map_fields.object.isoft_field_id[ll_InsertRow] = il_DragValue[i]
			dw_map_fields.object.id_field[ll_InsertRow] = 0		
			wf_setmapfielddefaultvalue( dw_map_fields, ll_InsertRow ) //added by gavins 20140724
		next
		dw_map_fields.ScrollToRow(ll_InsertRow)
	end if
	
	//Added By Ken.Guo 2017-04-11
	If ll_table_id = 1013 and Trim(dw_fields.GetItemString(il_DragRow,'field_name_allias')) =  'Document Content' Then
		Messagebox('Tips','Normally the Document Content field is mapped to Salesforce’s Body field.')
	End If
	
	// Update mapped field records
	if dw_map_fields.Update() = 1 then
		of_CompleteTrans(true)
		dw_detail.SetRedraw(true)
	else
		of_CompleteTrans(false)
		MessageBox("Error", is_mapfield_errinfo, StopSign!)
	end if
end if
end event

event ue_impfield_dragdrop(long al_row);long ll_InsertRow
long ll_CurrentRow
long ll_FindRow
long ll_table_id
long ll_isoft_table_id
long ll_mapped_field_id
long ll_table_records_id
long ll_dv_import_field_id
long i, ll_Null
string displayvalue

SetNull(ll_Null)
if dw_records.GetRow() <= 0 then
	MessageBox("Prompt", "There is no import table record.")
	Return	
end if

//Add by Harry 20170323 for task749
// Check field of drag whether already exists
for i = 1 to il_SelectedCount
	ll_FindRow = dw_map_fields.Find("import_field_id=" + String(il_DragValue[i]), 1, dw_map_fields.RowCount())
	if ll_FindRow > 0 then
		dw_map_fields.ScrollToRow(ll_FindRow)
		dw_map_fields.SelectRow(0, false)
		dw_map_fields.SelectRow(ll_FindRow, true)
		MessageBox("Prompt", "The Salesforce Field already exists.")
		Return
	end if
next

// Insert or replace a mapped field record
if al_Row > 0 then
	If is_ImportType = '2' Then
		//check salesforce id //added by gavins 20140804
		displayvalue = dw_map_fields.Describe( "Evaluate('LookUpDisplay(isoft_field_id) ', " + string(al_Row) + ")")
		if lower(displayvalue) = 'salesforce id' and dw_field_list.object.imp_field_name[il_DragRow] <> 'id'	 Then
			MessageBox( 'Tips', 'The import data id column that is mapped to the Salesforce id column cannot be modified.' )
			Return
		End If
		//
	End If
	// Replace a mapped field record	
	ll_dv_import_field_id = dw_field_list.object.rec_id[il_DragRow]	
	ll_mapped_field_id = dw_map_fields.object.rec_id[al_Row]	
	ll_FindRow = dw_prac_cont_id.Find("rec_id=" + String(ll_mapped_field_id), 1, dw_prac_cont_id.RowCount())
	if ll_FindRow > 0 then
		dw_prac_cont_id.object.import_field_id[ll_FindRow] = ll_dv_import_field_id
		dw_prac_cont_id.ScrollToRow(ll_FindRow)
	end if
	dw_map_fields.object.import_field_id[al_Row] = ll_dv_import_field_id
	dw_map_fields.object.facility_id[al_Row] = ll_Null
	wf_setmapfielddefaultvalue( dw_map_fields, al_Row ) //added by gavins 20140724
	if dw_map_fields.Update() = 1 then
		of_CompleteTrans(true)
	else
		of_CompleteTrans(false)
		MessageBox("Error", is_mapfield_errinfo, StopSign!)
	end if
else
	// Insert a mapped field record
	for i = 1 to il_SelectedCount
		ll_InsertRow = dw_map_fields.InsertRow(0)
		ll_table_records_id = dw_records.object.table_records_id[dw_records.GetRow()]
		dw_map_fields.object.table_records_id[ll_InsertRow] = ll_table_records_id
		dw_map_fields.object.import_field_id[ll_InsertRow] = il_DragValue[i]
		dw_map_fields.object.id_field[ll_InsertRow] = 0		
	next
	dw_map_fields.ScrollToRow(ll_InsertRow)
	wf_setmapfielddefaultvalue( dw_map_fields, ll_InsertRow ) //added by gavins 20140724
	if dw_map_fields.Update() = 1 then
		of_CompleteTrans(true)
		dw_detail.SetRedraw(true)
	else
		of_CompleteTrans(false)
		MessageBox("Error", is_mapfield_errinfo, StopSign!)
	end if
end if
end event

event dberror;//override
is_mapfield_errinfo = SQLErrText

Return 1
end event

event rowfocuschanged;call super::rowfocuschanged;//inherit
dw_detail.ScrollToRow(CurrentRow)

end event

event dragwithin;call super::dragwithin;if Source.tag = "dw_fields" or Source.tag = "dw_field_list" then
	// Select row	
	if Row >0 then
		if not IsSelected(Row) then
			this.SelectRow(0, false)
			this.SelectRow(Row, true)
			this.ScrollToRow(Row)
		end if		
	else
		this.SelectRow(0, false)
	end if
end if
end event

event dragdrop;call super::dragdrop;if Source.tag = "dw_fields" then
	this.Event ue_sysfield_dragdrop(Row)
elseif Source.tag = "dw_field_list" then
	this.Event ue_impfield_dragdrop(Row)
end if
end event

event clicked;call super::clicked;//inherit
il_DragRow = Row
this.ScrollToRow(Row)
end event

event other;call super::other;if Message.WordParm = 61458 then 
	Message.Processed = true
	Message.ReturnValue = 0 
end if
end event

event getfocus;call super::getfocus;//inherit
//of_SetMappedDWTitle(2)
end event

event doubleclicked;call super::doubleclicked;if not ib_LockFile and Row > 0 then
	if MessageBox("Prompt", "Are you sure you want to delete the record?", Question!, YesNo!) = 1 then
		il_DragRow = Row
		dw_fields.Event ue_DragDrop(this.tag)
	end if
end if
end event

event constructor;call super::constructor;//Inherit
this.of_SetRowSelect(true)
this.DragIcon = gs_current_path + "\row.ico"

this.modify("imp_field_name_t.text = 'Sync Field' ") //Added By Jay Chen 10-11-2014
end event

event mousemove;call super::mousemove;of_BeginDrag(this)
end event

type dw_records from u_dw within tabpage_field_data
event ue_dragdrop ( long al_row )
string tag = "dw_records"
integer x = 955
integer y = 8
integer width = 2203
integer height = 608
integer taborder = 80
string dragicon = "row.ico"
boolean titlebar = true
string title = "Sync Table Records"
string dataobject = "d_import_table_list"
boolean resizable = true
borderstyle borderstyle = stylebox!
end type

event ue_dragdrop(long al_row);long ll_InsertRow, ll_FRow
long i, ll_RowCount
long ll_dv_table_id, ll_fieldsalesid, ll_Recordid
string	ls_Filter

ll_dv_table_id = dw_tables.object.table_id[il_DragRow]  //Added by harry 2017-03-17
//Added By Jay Chen 12-17-2014 export to salesforce can only drag 1 table into table records
if il_sync_salesforce = 1 then
	//Added by harry 2017-03-17 task749
	if this.rowcount() = 0 and ll_dv_table_id = 1007 then
		MessageBox("Contractlogix", "You must select Contacts table first.")
		return
	end if
	if this.rowcount() >= 1 then 
		if not (this.rowcount( ) = 1 and this.getitemnumber(1, 'isoft_table_id') = 1003 and ll_dv_table_id = 1007) then //Added by harry 2017-03-17 task749 ctx_Contacts and Ctx_contacts_numbers
			MessageBox("Contractlogix", "You can only select one contractlogix table to sync data to salesforce.")
			return
		end if
	end if
end if
//end add
//Added by harry 2017-03-23 task749
long ll_import_id
string ls_table_name
select top 1 a.import_id,c.table_name_allias 
into :ll_import_id, :ls_table_name
from import_hdr a, import_table_records b, import_tables c 
where a.import_id = b.import_id and c.table_id = b.isoft_table_id 
and a.import_type = 2 and a.sync_salesforce = :il_sync_salesforce 
and a.import_id <> :il_curr_import_id
and b.isoft_table_id = :ll_dv_table_id;
If not isnull( ll_import_id ) and ll_import_id > 0 Then 
	If MessageBox( 'tips',"The table (" + ls_table_name + ") has already been used when synchronizing ID(" + string(ll_import_id ) + "). Whether to continue? ",Exclamation!, YesNo! , 2) <> 1 Then
		return
	End If
End If

//ll_dv_table_id = dw_tables.object.table_id[il_DragRow]  //Harry  harry 2017-03-17
Parent.SetRedraw(false)

// Insert a import table record
ll_InsertRow = of_GetInsertRow(ll_dv_table_id)
ll_InsertRow = this.InsertRow(ll_InsertRow)
this.object.isoft_table_id[ll_InsertRow] = ll_dv_table_id
this.object.import_id[ll_InsertRow] = il_curr_import_id
this.ScrollToRow(ll_InsertRow)

// Set sort number
for i = 1 to this.RowCount()
	this.SetItem(i, "sort_no", i)
next

// Update import table records
if this.Update() <> 1 then
	of_CompleteTrans(false)
	Parent.SetRedraw(true)
	MessageBox("Error", is_mapfield_errinfo, StopSign!)
	Return
end if
ll_Recordid = this.object.table_records_id[ this.GetRow() ]
this.Event RowFocusChanged(this.GetRow())

//If is_ImportType = '2' Then
//Modified By Jay Chen 12-17-2014
If is_ImportType = '2' and il_sync_salesforce = 0 Then //only import from salesforce need to insert salesforce_id
	//check salesforce id //added by gavins 20140804
	ls_Filter = dw_fields.Describe( "datawindow.table.Filter" )
	If Pos( lower(ls_Filter ), 'salesforce_id' ) > 0 Then
		For i = 1 To dw_fields.FilteredCount()
			if ll_dv_table_id = dw_fields.GetItemNumber( i, 'table_id', filter!, false ) and  'salesforce_id' = dw_fields.GetItemString( i, 'field_name', filter!, false )Then
				ll_fieldsalesid = dw_fields.GetItemNumber( i, 'field_id', filter!, false )
				ll_FRow = dw_map_fields.Find( "isoft_field_id = " + string( ll_fieldsalesid ) , 1, dw_map_fields.RowCount( ) )
				If ll_FRow > 0 Then EXIT
				ll_InsertRow = dw_map_fields.InsertRow( 0 )
				dw_map_fields.SetItem( ll_InsertRow, 'isoft_field_id', ll_fieldsalesid )
				dw_map_fields.SetItem( ll_InsertRow, 'table_records_id', ll_Recordid )
				ll_FRow = dw_field_list.Find( "lower(imp_field_name)='id'", 1, dw_field_list.RowCount( ) )
				If ll_FRow > 0 Then
					dw_map_fields.SetItem( ll_InsertRow, 'import_field_id', dw_field_list.GetItemNumber( ll_FRow, 'rec_id' ) )
					dw_map_fields.SetItem( ll_InsertRow, 'lu_type', '' )
					dw_map_fields.SetItem( ll_InsertRow, 'lu_table', '' )
					dw_map_fields.SetItem( ll_InsertRow, 'lu_field_name', '' )
				End If
			End If
		Next
	End If
End If

//Added by harry 20170503
if is_ImportType = '2' and il_sync_salesforce = 1 and this.rowcount() = 1 Then
	if this.getitemnumber(1, 'isoft_table_id') = 1001 then
		tab_1.tabpage_hdr.dw_browse.setitem( tab_1.tabpage_hdr.dw_browse.getrow(), 'sync_ctx', 1)
		tab_1.tabpage_hdr.dw_browse.setitemstatus( tab_1.tabpage_hdr.dw_browse.getrow(), 'sync_ctx', primary!, notmodified!)
	end if
end if

//Added by harry 20170510
if is_ImportType = '2' and il_sync_salesforce = 0 Then
	if ll_dv_table_id = 1001 or ll_dv_table_id = 1013 then
		tab_1.tabpage_hdr.dw_browse.setitem( tab_1.tabpage_hdr.dw_browse.getrow(), 'wf_flag', 1)
		tab_1.tabpage_hdr.dw_browse.setitemstatus( tab_1.tabpage_hdr.dw_browse.getrow(), 'wf_flag', primary!, notmodified!)
	end if
end if

// Update mapped record fields
if dw_map_fields.Update() = 1 then
	of_CompleteTrans(true)
else
	of_CompleteTrans(false)
	Parent.SetRedraw(true)
	MessageBox("Error", is_mapfield_errinfo, StopSign!)
end if

Parent.SetRedraw(true)
end event

event rowfocuschanged;call super::rowfocuschanged;//inherit
long ll_FindRow
long ll_isoft_table_id
long ll_table_records_id
string ls_table_name_allias
DataWindowChild ldwc_Child

if CurrentRow >0 then
	this.SelectRow(0, false)
	this.SelectRow(CurrentRow, true)
	
	// Filter Mapped record fields
	ll_table_records_id = this.object.table_records_id[CurrentRow]
	if IsNull(ll_table_records_id) then
		dw_map_fields.SetFilter("1 <> 1")
	else
		dw_map_fields.SetFilter("table_records_id = " + String(ll_table_records_id) )//+ " and  lower(LookUpDisplay(isoft_field_id)) <> 'salesforce id'"
	end if
	dw_map_fields.Filter()
	dw_map_fields.ScrollToRow(1)
	dw_map_fields.Event RowFocusChanged(1)
	
	// Filter Provider Identification Field(s)
	/*
	dw_prac_cont_id.SetRedraw(false)
	dw_prac_cont_id.Reset()
	dw_map_fields.RowsCopy(1, dw_map_fields.RowCount(), Primary!, dw_prac_cont_id, 1, Primary!)	
	dw_prac_cont_id.SetFilter("id_field = 1")
	dw_prac_cont_id.Filter()
	dw_prac_cont_id.SetRedraw(true)
	*/
	
	// Set IntelliSoft Table display name in dw_detail
	ll_isoft_table_id = this.object.isoft_table_id[CurrentRow]
	if not IsNull(ll_isoft_table_id) then
		ll_FindRow = dw_tables.Find("table_id=" + String(ll_isoft_table_id), 1, dw_tables.RowCount())
		if ll_FindRow > 0 then
			ls_table_name_allias = dw_tables.object.table_name_allias[ll_FindRow]
			dw_detail.object.t_intellisoft_table.text = ls_table_name_allias			
			is_curr_table_name = Lower(dw_tables.object.table_name[ll_FindRow]) // Get current table_name
			dw_tables.ScrollToRow(ll_FindRow)
		end if
	end if
	if ll_FindRow <= 0 then
		dw_detail.object.t_intellisoft_table.text = ""
		is_curr_table_name = ""
	end if
	
	//	Set null_value list of dw_detail
	dw_detail.GetChild("null_value", ldwc_Child)
	choose case is_curr_table_name
		case "pd_address", "pd_hosp_affil", "pd_board_specialty"
			if is_curr_table_name = "pd_address" then
				ldwc_Child.SetFilter("lookup_name in ('* Select Value *', '* NULL *', 'Address Type')")
			else
				ldwc_Child.SetFilter("lookup_name in ('* Select Value *', '* NULL *', 'Yes/No')")
			end if
		case else
			ldwc_Child.SetFilter("lookup_name in ('* Select Value *', '* NULL *')")
	end choose
	ldwc_Child.Filter()
	
	// Set facility_id of dw_detail enabled
	choose case is_curr_table_name
		case "pd_affil_stat", "pd_address", "pd_hosp_affil", "pd_board_specialty"
			dw_detail.object.facility_id.protect = 0
			dw_detail.object.facility_id.background.color = 16777215
		case else
			dw_detail.object.facility_id.protect = 1
			dw_detail.object.facility_id.background.color = 67108864
	end choose
else
	dw_map_fields.SetFilter("1 <> 1")
	dw_map_fields.Filter()
	//dw_prac_cont_id.Reset()
end if
end event

event dragdrop;call super::dragdrop;if Source.tag = "dw_tables" then
	this.Event ue_DragDrop(Row) 
end if
end event

event dragwithin;call super::dragwithin;/*
if Source.tag = "dw_tables" then
	// Select row	
	if Row >0 then
		if not IsSelected(Row) then
			this.SelectRow(0, false)
			this.SelectRow(Row, true)
		end if		
	else
		this.SelectRow(0, false)
	end if
end if
*/
end event

event dberror;//override
is_mapfield_errinfo = SQLErrText

Return 1
end event

event clicked;call super::clicked;//inherit
il_DragRow = Row
end event

event other;call super::other;if Message.WordParm = 61458 then 
	Message.Processed = true
	Message.ReturnValue = 0 
end if
end event

event doubleclicked;call super::doubleclicked;Int i, li_rowcount
Long ll_findrow, ll_record_id  //Added by harry 20170510
if not ib_LockFile and Row > 0 then
	if MessageBox("Prompt", "Are you sure you want to delete the record?", Question!, YesNo!) = 1 then
		//Added by harry 20170503
		if is_ImportType = '2' and il_sync_salesforce = 1 Then
			if this.getitemnumber(row, 'isoft_table_id') = 1001 then
				tab_1.tabpage_hdr.dw_browse.setitem(  tab_1.tabpage_hdr.dw_browse.getrow(), 'auto_sync_salesforce', 0)
				tab_1.tabpage_hdr.dw_browse.setitem(  tab_1.tabpage_hdr.dw_browse.getrow(), 'sync_ctx', 0)
				tab_1.tabpage_hdr.dw_browse.setitemstatus( tab_1.tabpage_hdr.dw_browse.getrow(), 'sync_ctx', primary!, notmodified!)
			end if
		end if
		
		//Added by harry 20170510  trigger workflow
		if is_ImportType = '2' and il_sync_salesforce = 0 Then
			if this.getitemnumber(row, 'isoft_table_id') = 1001 or this.getitemnumber(row, 'isoft_table_id') = 1013 then
				ll_record_id = this.getitemnumber(row, 'table_records_id')
				ll_findrow = this.find("(isoft_table_id = 1001 or isoft_table_id = 1013)  and table_records_id <> " + String(ll_record_id), 1, this.RowCount( ))
				if ll_findrow <= 0 then
					tab_1.tabpage_hdr.dw_browse.setitem(  tab_1.tabpage_hdr.dw_browse.getrow(), 'trigger_wf', 0)
					tab_1.tabpage_hdr.dw_browse.setitem(  tab_1.tabpage_hdr.dw_browse.getrow(), 'wf_flag', 0)
					tab_1.tabpage_hdr.dw_browse.setitemstatus( tab_1.tabpage_hdr.dw_browse.getrow(), 'wf_flag', primary!, notmodified!)
				end if
			end if
		end if
		
		if is_ImportType = '2' and il_sync_salesforce = 1 and this.RowCount( ) > 1 and this.getitemnumber( row, 'isoft_table_id') = 1003 then //Added by Harry 2017-03-17 for task749
			li_rowcount = this.RowCount( )
			for i = 1 to li_rowcount //ctx_contacts and ctx_contacts_numbers
				il_DragRow = this.getrow( )
				dw_tables.Event ue_DragDrop()
			next
		else
			il_DragRow = Row
			dw_tables.Event ue_DragDrop()
		end if
	end if
elseif row = 0 then //Start Code Change ----02.04.2008 #V8 maha
	if this.height < 400 then
		this.height = 768
	else
		this.height = 396
	end if
end if
end event

event constructor;call super::constructor;//Inherit
this.DragIcon = gs_current_path + "\row.ico"
end event

event mousemove;call super::mousemove;of_BeginDrag(this)
end event

type dw_fields from u_dw within tabpage_field_data
event ue_dragdrop ( string as_dw )
string tag = "dw_fields"
integer x = 5
integer y = 628
integer width = 896
integer height = 1352
integer taborder = 80
string dragicon = "row.ico"
boolean titlebar = true
string title = "ContractLogix Fields"
string dataobject = "d_import_intellisoftfields"
borderstyle borderstyle = stylebox!
end type

event ue_dragdrop(string as_dw);long ll_DeleteRow
long ll_dv_mapped_field_id
string displayvalue

if as_dw = "dw_prac_cont_id" then
	ll_dv_mapped_field_id = dw_prac_cont_id.object.rec_id[il_DragRow]
elseif as_dw = "dw_map_fields" then
	ll_dv_mapped_field_id = dw_map_fields.object.rec_id[il_DragRow]
else
	Return
end if

ll_DeleteRow = dw_prac_cont_id.Find("rec_id=" + String(ll_dv_mapped_field_id), 1, dw_prac_cont_id.RowCount())
if ll_DeleteRow > 0 then dw_prac_cont_id.DeleteRow(ll_DeleteRow)

ll_DeleteRow = dw_map_fields.Find("rec_id=" + String(ll_dv_mapped_field_id), 1, dw_map_fields.RowCount())
If is_ImportType = '2' and ll_DeleteRow > 0 Then
	//check salesforce id //added by gavins 20140804
	displayvalue = dw_map_fields.Describe( "Evaluate('LookUpDisplay(isoft_field_id) ', " + string(ll_DeleteRow) + ")")
	if lower(displayvalue) = 'salesforce id' Then
		MessageBox( 'tips', 'Salesforce id column cannot be removed.' )
		Return
	End If
	//
End If
if ll_DeleteRow > 0 then dw_map_fields.DeleteRow(ll_DeleteRow)
dw_detail.ScrollToRow(dw_map_fields.GetRow())

if dw_map_fields.Update() = 1 then
	of_CompleteTrans(true)
else
	of_CompleteTrans(false)
	MessageBox("Error", is_mapfield_errinfo, StopSign!)
end if
end event

event dragdrop;call super::dragdrop;this.Event ue_DragDrop(Source.tag)
end event

event clicked;call super::clicked;//inherit
long i

il_DragRow = Row
il_SelectedCount = 0

for i = 1 to this.RowCount()
	if this.IsSelected(i) then
		il_SelectedCount ++
		il_DragValue[il_SelectedCount] = this.object.field_id[i]
	end if
next
end event

event other;call super::other;if Message.WordParm = 61458 then 
	Message.Processed = true
	Message.ReturnValue = 0 
end if
end event

event constructor;call super::constructor;//Inherit
this.of_SetRowSelect(true)
inv_RowSelect.of_SetStyle(inv_RowSelect.EXTENDED)
this.DragIcon = gs_current_path + "\row.ico"
end event

event doubleclicked;call super::doubleclicked;if not ib_LockFile and Row > 0 then
	il_DragRow = Row
	if ii_CurrMappedDW = 1 then
		dw_prac_cont_id.Event ue_sysfield_dragdrop(0)
	else
		dw_map_fields.Event ue_sysfield_dragdrop(0)
	end if
end if
end event

event mousemove;call super::mousemove;of_BeginDrag(this)
end event

type dw_tables from u_dw within tabpage_field_data
event ue_dragdrop ( )
string tag = "dw_tables"
integer x = 5
integer y = 8
integer width = 896
integer height = 620
integer taborder = 70
string dragicon = "row.ico"
boolean titlebar = true
string title = "ContractLogix Tables"
string dataobject = "d_import_intellisofttables"
borderstyle borderstyle = stylebox!
end type

event ue_dragdrop();long ll_DeleteRow
long ll_CurrentRow
long ll_dv_table_records_id

// Delete import table records and mapped record fields
ll_dv_table_records_id = dw_records.object.table_records_id[il_DragRow]

ll_DeleteRow = dw_records.Find("table_records_id=" + String(ll_dv_table_records_id), 1, dw_records.RowCount())
if ll_DeleteRow <= 0 then Return

dw_map_fields.SetFilter("table_records_id = " + String(ll_dv_table_records_id))
dw_map_fields.Filter()
dw_map_fields.RowsMove(1, dw_map_fields.RowCount(), Primary!, dw_map_fields, 1, Delete!)

dw_records.DeleteRow(ll_DeleteRow)
if dw_records.GetSelectedRow(1) <= 0 then
	dw_records.SelectRow(dw_records.GetRow(), true)
end if

// Update all
if dw_records.Update() <> 1 then
	of_CompleteTrans(false)
	MessageBox("Error", is_mapfield_errinfo, StopSign!)
	Return
end if

if dw_map_fields.Update() = 1 then
	of_CompleteTrans(true)
else
	of_CompleteTrans(false)
	MessageBox("Error", is_mapfield_errinfo, StopSign!)
end if

// Filter dw_prac_cont_id and mapped fields
dw_records.Event RowFocusChanged(dw_records.GetRow())
end event

event rowfocuschanged;call super::rowfocuschanged;//inherit
string ls_Filter
Integer	li_Row

//if Current row less than 1
if CurrentRow <= 0 then
	dw_fields.SetFilter("1 <> 1")
	dw_fields.Filter()
	Return
end if
this.SelectRow(0, false)
this.SelectRow(CurrentRow, true)

//Filter data of dw_fields
if ii_curr_isoft_module = 1 then
	//IntelliCred/App module
	ls_Filter = "table_id = " + String(this.object.table_id[CurrentRow])
	ls_Filter += " AND Lower(field_name) not in ('rec_id','prac_id','seq_no')"
else
	//Contract Logix module
	ls_Filter = of_GetContractFieldFilter(this)
end if
dw_fields.SetFilter(ls_Filter)
dw_fields.Filter()

//added by gavins 20140505
If lower(GetItemString( currentrow, 'table_name' ) )= 'ctx_contract_contacts' and  is_ImportType = '2' Then
	If dw_fields.Find( "field_id = -999999", 1, dw_fields.RowCount( ) ) = 0 Then
		li_Row = dw_fields.InsertRow( 0 )
		dw_fields.SetItem( li_Row, 'table_id', GetItemNumber( currentrow, 'table_id' ) ) 
		dw_fields.SetItem( li_Row, 'field_id', -999999 ) 
		dw_fields.SetItem( li_Row, 'field_name_allias', 'Contracted Company Contact Salesforce ID' ) 
		dw_fields.SetItem( li_Row, 'field_name', 'sfcontact_id' ) 
		dw_fields.SetItemStatus( li_row, 0, Primary!, NotModified! )		
		li_Row = dw_fields.InsertRow( 0 )
		dw_fields.SetItem( li_Row, 'table_id', GetItemNumber( currentrow, 'table_id' ) ) 
		dw_fields.SetItem( li_Row, 'field_id', -999998 ) 
		dw_fields.SetItem( li_Row, 'field_name_allias', 'Our Company Contact Salesforce ID' ) //modify by gavins 20140605 ken request
		dw_fields.SetItem( li_Row, 'field_name', 'ourcontact_id' ) 
		dw_fields.SetItemStatus( li_row, 0, Primary!, NotModified! )
	End If
End If

//Added by Harry 20170330 for task749
If lower(GetItemString( currentrow, 'table_name' ) )= 'ctx_am_document' and  is_ImportType = '2' Then// and il_sync_salesforce = 1 Then  //Commented By Ken.Guo 2017-04-10 support documents for import2cl
	If dw_fields.Find( "field_id = -999997", 1, dw_fields.RowCount( ) ) = 0 Then
		li_Row = dw_fields.InsertRow( 0 )
		dw_fields.SetItem( li_Row, 'table_id', GetItemNumber( currentrow, 'table_id' ) ) 
		dw_fields.SetItem( li_Row, 'field_id', -999997 ) 
		dw_fields.SetItem( li_Row, 'field_name_allias', 'Document Content ' ) 
		dw_fields.SetItem( li_Row, 'field_name', 'image_file' ) 
		dw_fields.SetItemStatus( li_row, 0, Primary!, NotModified! )
	End If
	
	//Added By Ken.Guo 2017-04-10. Support document. should map ctx_id or ctx_sf_id.
	If il_sync_salesforce = 0 Then //import 
		If dw_fields.Find( "field_id = -999996", 1, dw_fields.RowCount( ) ) = 0 Then
			li_Row = dw_fields.InsertRow( 0 )
			dw_fields.SetItem( li_Row, 'table_id', GetItemNumber( currentrow, 'table_id' ) ) 
			dw_fields.SetItem( li_Row, 'field_id', -999996 ) 
			dw_fields.SetItem( li_Row, 'field_name_allias', 'Contract ID' ) 
			dw_fields.SetItem( li_Row, 'field_name', 'contract_id' ) 
			dw_fields.SetItemStatus( li_row, 0, Primary!, NotModified! )
		End If	
		If dw_fields.Find( "field_id = -999995", 1, dw_fields.RowCount( ) ) = 0 Then
			li_Row = dw_fields.InsertRow( 0 )
			dw_fields.SetItem( li_Row, 'table_id', GetItemNumber( currentrow, 'table_id' ) ) 
			dw_fields.SetItem( li_Row, 'field_id', -999995 ) 
			dw_fields.SetItem( li_Row, 'field_name_allias', 'Contract Salesforce ID' ) 
			dw_fields.SetItem( li_Row, 'field_name', 'contract_salesforce_id' ) 
			dw_fields.SetItemStatus( li_row, 0, Primary!, NotModified! )
		End If			
	End If
	
End If

dw_fields.SetRow(1)
dw_fields.SelectRow(0, false)
dw_fields.SelectRow(1, true)
end event

event dragdrop;call super::dragdrop;if Source.tag = "dw_records" then 
	this.Event ue_DragDrop()
end if
end event

event clicked;call super::clicked;//inherit
il_DragRow = Row
end event

event other;call super::other;if Message.WordParm = 61458 then 
	Message.Processed = true
	Message.ReturnValue = 0 
end if
end event

event doubleclicked;call super::doubleclicked;if not ib_LockFile and Row > 0 then
	il_DragRow = Row
	dw_records.Event ue_DragDrop(0)
end if
end event

event constructor;call super::constructor;//Inherit
this.DragIcon = gs_current_path + "\row.ico"
end event

event mousemove;call super::mousemove;of_BeginDrag(this)
end event

type ln_1 from line within tabpage_field_data
long linecolor = 16711680
integer linethickness = 8
integer beginx = 896
integer beginy = 244
integer endx = 955
integer endy = 244
end type

type ln_2 from line within tabpage_field_data
boolean visible = false
long linecolor = 16711680
integer linethickness = 8
integer beginx = 741
integer beginy = 748
integer endx = 800
integer endy = 696
end type

type ln_4 from line within tabpage_field_data
boolean visible = false
long linecolor = 16711680
integer linethickness = 8
integer beginx = 2994
integer beginy = 524
integer endx = 3063
integer endy = 464
end type

type ln_5 from line within tabpage_field_data
long linecolor = 16711680
integer linethickness = 8
integer beginx = 3163
integer beginy = 892
integer endx = 3223
integer endy = 840
end type

type ln_3 from line within tabpage_field_data
long linecolor = 16711680
integer linethickness = 8
integer beginx = 901
integer beginy = 1144
integer endx = 960
integer endy = 1092
end type

type dw_imp_field_detail from u_dw within tabpage_field_data
event ue_keydown pbm_dwnkey
integer x = 3227
integer y = 836
integer width = 1029
integer height = 1048
integer taborder = 90
boolean bringtotop = true
boolean titlebar = true
string title = "Sync Field Detail"
string dataobject = "d_import_field_detail_sf"
boolean vscrollbar = false
borderstyle borderstyle = stylebox!
end type

event ue_keydown;if Key = KeyDownArrow! or Key = KeyUpArrow! or Key = KeyPageUp! or Key = KeyPageDown! then 
	Return 1
else
	Return 0
end if
end event

event itemchanged;call super::itemchanged;//inherit
long ll_FindRow
string ls_Null
string ls_Value
string ls_FindCriteria

SetNull(ls_Null)

choose case dwo.name
	case "imp_field_name"
		//Added By Jay Chen 07-16-2014 remark:check field name
		if Not of_field_name_check(data) then
			this.post ScrollToRow(row)
			dw_field_list.post ScrollToRow(row)
			this.post setfocus()
			this.post setcolumn("imp_field_name")
			messagebox("Invalid Field Name","The field name " + data + " is invalid. It must start with a letter and can include any combination of letters, numbers, and underscores.")
			return -1
		end if
		//end
		
		ls_FindCriteria = "Lower(imp_field_name)='" + Lower(Data) + "'"
		ll_FindRow = this.Find(ls_FindCriteria, 1, Row - 1)
		if ll_FindRow <= 0 then
			ll_FindRow = this.Find(ls_FindCriteria, Row + 1, RowCount())
		end if
		if ll_FindRow > 0 then
			this.Post SetItem(Row, "imp_field_name", "")
			this.Post SetColumn("imp_field_name")
			this.Post SetFocus()
		end if
		
	case "default_value"	
		if Lower(Trim(Data)) = "* select value *" then
			if of_SelectValue(ls_Value) = 1 then
				this.Post SetItem(Row, "default_value", ls_Value)
			else
				ls_Value = this.GetItemString(Row, "default_value", Primary!, true)
				this.Post SetItem(Row, "default_value", ls_Value)
			end if
		elseif Lower(Trim(Data)) = "* null *" then
			this.Post SetItem(Row, "default_value", ls_Null)
		end if
end choose
end event

event other;call super::other;if Message.WordParm = 61458 then 
	Message.Processed = true
	Message.ReturnValue = 0 
end if
end event

event constructor;call super::constructor;this.modify("import_id_t.text = 'Sync Id:' ") //Added By Jay Chen 10-11-2014

end event

type dw_field_list from u_dw within tabpage_field_data
event ue_get_column_arr_order ( )
event type integer ue_freeform_move_cols ( long al_xpos )
event type integer ue_freeform_set_move_pointer ( long al_xpos,  long al_ypos )
event dwnmousemove pbm_dwnmousemove
string tag = "dw_field_list"
integer x = 3227
integer y = 8
integer width = 1024
integer height = 836
integer taborder = 80
string dragicon = "row.ico"
boolean bringtotop = true
boolean titlebar = true
string title = "Sync Fields"
string dataobject = "d_import_fields_sf"
boolean hscrollbar = true
borderstyle borderstyle = stylebox!
end type

event ue_get_column_arr_order();//====================================================================
// Event: ue_get_column_arr_order
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:	Mark Lee		Date: 10/30/2015
//--------------------------------------------------------------------
//	Copyright (c) 2008-2015 Contractlogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
string 			ls_arr[]
long				ll_arr[],  ll_x, ll_width
string 			ls_columns, ls_temp, ls_dbname, ls_visible, ls_colname
integer 			i, li_cols, j , k 


is_freeform_cols = ls_arr
il_freeform_cols_x = ll_arr

j =0
li_cols = Integer(this.describe( "DataWindow.Column.Count"))
for i = 1 to li_cols 
	ls_colname = lower( this.Describe("#"+string( i ) + ".name") )
	ls_dbname = lower( this.Describe("#"+string( i ) + ".dbname") )
	ls_temp = f_get_token( ls_dbname, '.' )
	
	ll_x = Long( this.Describe(ls_colname+".x") )
	ll_width = Long( this.Describe(ls_colname+".width") )
	ls_visible =  this.Describe(ls_colname + ".visible") 
	if isnull(ls_visible) or ls_visible ='?' or ls_visible ='!' or ls_visible = '0' then 			// or ls_visible='-1' 
		continue
//	elseif  Pos( ls_visible, '~t' ) > 0 or ls_visible = '1' then
//		//		
	end if 
	
	if ll_x <=0 then continue
	
	j++
	is_freeform_cols[j] = ls_colname
	il_freeform_cols_x[j] = ll_x
next 
 
 
 if upperbound(il_freeform_cols_x) > 1 then 
	for i = 1 to upperbound(il_freeform_cols_x) - 1
		ll_x = il_freeform_cols_x[i]
		for k = i + 1  to upperbound(il_freeform_cols_x) 
			if ll_x > il_freeform_cols_x[k] then				
				il_freeform_cols_x[i] = il_freeform_cols_x[k]
				il_freeform_cols_x[k] = ll_x
				ll_x = il_freeform_cols_x[i]				
				//colname order
				ls_colname = is_freeform_cols[i]
				is_freeform_cols[i] = is_freeform_cols[k]
				is_freeform_cols[k] = ls_colname
			end if 
		next
	next 
 end if 
 
end event

event type integer ue_freeform_move_cols(long al_xpos);//====================================================================
// Event: ue_freeform_move_cols
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value    long    al_xpos
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	Mark Lee		Date: 10/30/2015
//--------------------------------------------------------------------
//	Copyright (c) 2008-2015 Contractlogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
long			ll_x , ll_width, ll_move_x, ll_move
string 		ls_modify
integer 		i

ls_modify  = ""
if ii_freeform_col_order > 0 and al_xpos > 0  and upperbound(il_freeform_cols_x) > 0  then 
	ll_move_x = al_xpos
	if ii_freeform_col_order <> upperbound(il_freeform_cols_x) then 
		//min value
		if ll_move_x <= il_freeform_cols_x[ii_freeform_col_order] + 10 then ll_move_x =  il_freeform_cols_x[ii_freeform_col_order] + 10			
		ll_width = ll_move_x - il_freeform_cols_x[ii_freeform_col_order] 
		
		ls_modify  += is_freeform_cols[ii_freeform_col_order]+".width="+string(ll_width) + " "
		ls_modify  +=  is_freeform_cols[ii_freeform_col_order]+"_t.width="+string(ll_width)	+ " "	
				
		//diff number.
//		if ll_move_x > il_freeform_move_x then 		
//			ll_move = ll_move_x -  il_freeform_move_x
//		else
//			ll_move = ll_move_x -  il_freeform_move_x
//		end if 
		ll_move = ll_move_x -  il_freeform_move_x

		for i = ii_freeform_col_order + 1 to  upperbound(il_freeform_cols_x) 
			ll_x = il_freeform_cols_x[i]
			ls_modify  +=  is_freeform_cols[i]+".x="+string(ll_x+ ll_move) + " "	
			ls_modify  +=  is_freeform_cols[i]+"_t.x="+string(ll_x + ll_move) + " "	
			il_freeform_cols_x[i] = ll_x + ll_move						//refresh data 
		next 
		this.modify(ls_modify)			
//		this.event ue_get_column_arr_order( )				///?????
	else	
		//last column adjust.
		//min value	
		if ll_move_x <= il_freeform_cols_x[ii_freeform_col_order] + 10 then ll_move_x = il_freeform_cols_x[ii_freeform_col_order] + 10				
		ll_width = ll_move_x - il_freeform_cols_x[ii_freeform_col_order]
		
		ls_modify  += is_freeform_cols[ii_freeform_col_order]+".width="+string(ll_width) + " "
		ls_modify  +=  is_freeform_cols[ii_freeform_col_order]+"_t.width="+string(ll_width)	+ " "		
		this.modify(ls_modify)
	end if 
//	this.modify(ls_modify)
end if 

return 1 




end event

event type integer ue_freeform_set_move_pointer(long al_xpos, long al_ypos);//====================================================================
// Event: ue_freeform_set_move_pointer
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value    long    al_xpos
// 	value    long    al_ypos
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	Mark Lee		Date: 10/30/2015
//--------------------------------------------------------------------
//	Copyright (c) 2008-2015 Contractlogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
long			ll_width, ll_freeform_header, ll_y, ll_height
integer		i

ll_freeform_header = Long(this.Object.DataWindow.Header.Height)		

if upperbound(il_freeform_cols_x) > 0 and al_xpos > 0 and ll_freeform_header > al_ypos  then 	
	for i = 1 to  upperbound(il_freeform_cols_x)
		ll_width = long(this.describe(is_freeform_cols[i]+".width"))
		if i = upperbound(il_freeform_cols_x) then 
			if al_xpos >= il_freeform_cols_x[i] + ll_width - 5  and al_xpos < il_freeform_cols_x[i] + ll_width + 5  then 
				ll_y = long(this.describe(is_freeform_cols[i]+".y"))
				ll_height = long(this.describe(is_freeform_cols[i]+".height"))
				if al_ypos >= ll_y and al_ypos <=  ll_y + ll_height then 
					ii_freeform_col_order = i
					return 1
				end if 
			end if 				
		else
			if al_xpos >= il_freeform_cols_x[i+1] - 5 and al_xpos < il_freeform_cols_x[i +1 ] + 5 then 
				ll_y = long(this.describe(is_freeform_cols[i]+".y"))
				ll_height = long(this.describe(is_freeform_cols[i]+".height"))
				if al_ypos >= ll_y and al_ypos <=  ll_y + ll_height then 
					ii_freeform_col_order = i
					return 1
				end if 
			else
				//
			end if 
		end if 
	next
end if 

return 0 

end event

event dwnmousemove;integer 					li_freeform_return								//Added By Mark Lee 10/30/2015

if ibn_freeform_move = true then 
	li_freeform_return = 0 
	if ibn_freeform_move_down = false then
		li_freeform_return = this.event ue_freeform_set_move_pointer(PixelsToUnits(xpos, XPixelsToUnits!), PixelsToUnits(ypos, YPixelsToUnits!))
		if li_freeform_return > 0 then
			SetPointer(SizeWE! )	
		end if 
	else
		if il_freeform_move_x > 0 then 	SetPointer(SizeWE! )		
	end if 
end if 
end event

event rowfocuschanged;call super::rowfocuschanged;//inherit
string ls_comp_def

if CurrentRow > 0 then
	dw_imp_field_detail.ScrollToRow(CurrentRow)
	
	ls_comp_def = Trim(this.object.comp_def[CurrentRow])
	if IsNull(ls_comp_def) then ls_comp_def = ""
	If is_ImportType = '1' Then
		if ib_LockFile or Len(ls_comp_def) > 0 then
			cb_create_value_list.Enabled = false
		else
			cb_create_value_list.Enabled = true
		end if
	End If
end if
end event

event dragenter;call super::dragenter;tab_1.tabpage_field_data.Event ue_save()
end event

event dberror;//override
is_mapfield_errinfo = SQLErrText

Return 1
end event

event dragdrop;call super::dragdrop;long ll_DeleteRow
long ll_dv_mapped_field_id
string displayvalue

if Source.tag = "dw_prac_cont_id" then
	ll_dv_mapped_field_id = dw_prac_cont_id.object.rec_id[il_DragRow]
elseif Source.tag = "dw_map_fields" then
	ll_dv_mapped_field_id = dw_map_fields.object.rec_id[il_DragRow]
else
	Return
end if

ll_DeleteRow = dw_prac_cont_id.Find("rec_id=" + String(ll_dv_mapped_field_id), 1, dw_prac_cont_id.RowCount())
if ll_DeleteRow > 0 then dw_prac_cont_id.DeleteRow(ll_DeleteRow)

ll_DeleteRow = dw_map_fields.Find("rec_id=" + String(ll_dv_mapped_field_id), 1, dw_map_fields.RowCount())
If is_ImportType = '2' and ll_DeleteRow > 0 Then
	//check salesforce id //added by gavins 20140804
	displayvalue = dw_map_fields.Describe( "Evaluate('LookUpDisplay(isoft_field_id) ', " + string(ll_DeleteRow) + ")")
	if lower(displayvalue) = 'salesforce id' Then
		MessageBox( 'tips', 'Salesforce id column cannot be removed.' )
		Return
	End If
	//
End If
if ll_DeleteRow > 0 then dw_map_fields.DeleteRow(ll_DeleteRow)
dw_detail.ScrollToRow(dw_map_fields.GetRow())

if dw_map_fields.Update() = 1 then
	of_CompleteTrans(true)
else
	of_CompleteTrans(false)
	MessageBox("Error", is_mapfield_errinfo, StopSign!)
end if
end event

event clicked;call super::clicked;//inherit
long i

il_DragRow = Row
il_SelectedCount = 0

for i = 1 to this.RowCount()
	if this.IsSelected(i) then
		il_SelectedCount ++
		il_DragValue[il_SelectedCount] = this.object.rec_id[i]
	end if
next

if ibn_freeform_move = true then 							//Added By Mark Lee 10/29/2015			 
	if ibn_freeform_move_down =true  then 							
		SetPointer(SizeWE! )	
	else
		SetPointer(Arrow! )	
	end if 
end if 

end event

event buttonclicked;call super::buttonclicked;integer li_Return, li_Pos, li_i, li_Row, li_Frow
n_cst_String		ln_string
string	ls_Result, ls_Fields, ls_Rows[], ls_Columns[]
n_cst_webapi    ln_api
str_sflogin_response  lstr_res,lstr_res2
long ll_cnt

choose case dwo.name
	case "b_add"
		Event pfc_cst_add()
	case "b_delete"
		Event pfc_cst_delete()
	case "b_compare"
		If is_ImportType = "1" Then
			li_Return = tab_1.tabpage_field_data.Event ue_save()
			if li_Return = 1 then
				Open(w_import_comparefield)
			end if
		ElseIf is_ImportType = "2" Then//added by gavins 20140505
			li_Return = tab_1.tabpage_field_data.Event ue_save()
			if li_Return = 1 then
				istr_SFResponse.s_import_id =  il_curr_import_id 
				If isnull( is_sfUser  ) or trim( is_sfuser ) = "" Then
					//Added By Jay Chen 10-14-2014
					string	ls_Result2, ls_sfuser, ls_sfpwd, ls_token, ls_sfurl
					Integer li_Pos2
					boolean lb_valid_token = false
					//Modified by gavins 20161223
					select salesforce_user,salesforce_pwd,salesforce_token, salesforceurl into :ls_sfuser, :ls_sfpwd, :ls_token, :ls_sfurl from security_user_salesforce;
					ls_sfpwd = ls_sfpwd + ls_token
					if isnull(ls_sfuser) then ls_sfuser = ''
					if isnull( ls_sfurl ) then ls_sfurl = ''
					if ls_sfuser <> '' then ls_Result2 = ln_api.of_get_salesforce_objects(ls_sfuser, ls_sfpwd, "", ls_sfurl)
					If Len( ls_Result2  ) > 0 Then
						lstr_res2.s_user = ls_sfuser
						lstr_res2.s_pwd = ls_sfpwd
						lstr_res2.s_sfurl = ls_sfurl
						li_Pos2 = pos( lower( ls_Result2 ), '"metadata":')
						If li_Pos2 > 0 then
							ls_Result2 = mid( ls_Result2, li_Pos2 + 11 )
							ls_Result2 = mid( ls_Result2, 2, len( ls_Result2 ) - 3 )
							ls_Result2 = ln_string.of_globalreplace( ls_Result2, "\t", "~t")
							ls_Result2 = ln_string.of_globalreplace( ls_Result2, "\r", "~r")	
							lstr_res2.s_result = ls_Result2
							lb_valid_token = true
						Else
							lb_valid_token = false
						End If
					else
						lb_valid_token = false
					end if
					//end
					//Modified By Jay Chen 10-14-2014
//					Open(w_sflogin_response)  
					if not lb_valid_token then 
						Open(w_sflogin_response)
						lstr_res = Message.PowerobjectParm
					else
						lstr_res = lstr_res2
					end if
					//end Modified
					If isvalid( lstr_res ) Then
						istr_SFResponse = lstr_res
						is_sfpwd =istr_SFResponse.s_pwd
						is_sfuser =istr_SFResponse.s_user
						is_Result = istr_SFResponse.s_Result
					End If
					If  Len( is_Result ) > 0 Then
						istr_SFResponse.s_import_id =  il_curr_import_id 
						istr_SFResponse.s_sync_salesforce = il_sync_salesforce //Added By Jay Chen 12-17-2014
						openwithparm( w_sflogin_objects, istr_SFResponse )
						lstr_res = Message.PowerObjectParm
						istr_SFResponse = lstr_Res
						ls_Fields = lstr_Res.s_fields
					End If
		
				Else
					istr_SFResponse.s_sync_salesforce = il_sync_salesforce //Added By Jay Chen 12-17-2014
					openwithparm( w_sflogin_objects, istr_SFResponse )
					lstr_res = Message.PowerObjectParm
					
					If isvalid( lstr_res ) Then
						istr_SFResponse = lstr_Res
						ls_Fields = lstr_Res.s_fields
					End If
					
				End If
				If Len( ls_Fields) > 0 Then
					
					ln_String.of_Parsetoarray( ls_Fields, "~r", ls_Rows)
					If tab_1.tabpage_hdr.dw_imp_hdr.GetRow() <= 0 Then
						MessageBox( 'tips', 'Retrieving of the sync Id failed. Please check the database connection.' )
						Return 
					End If
					tab_1.tabpage_hdr.dw_imp_hdr.SetItem(  tab_1.tabpage_hdr.dw_imp_hdr.GetRow( ), 'import_sfobject', istr_SFResponse.s_oname )
					
					integer		li_count
					
					If dw_imp_field_detail.RowCount( ) > 0 Then
						li_count =   dw_imp_field_detail.object.field_order[ dw_imp_field_detail.RowCount( )]  
					End If
					For li_i = 1 To UpperBound( ls_Rows )
						ln_String.of_Parsetoarray( ls_Rows[li_i], "~t", ls_Columns)
						if Upperbound( ls_columns ) = 0 Then Continue
						li_Frow = dw_field_list.Find( "lower(imp_field_name) = '" + lower(ls_columns[2]) + "'", 1, dw_field_list.Rowcount( ) )
						If li_Frow = 0 Then
							li_Row = dw_imp_field_detail.InsertRow( 0 )
							li_count = li_count + 10
							dw_imp_field_detail.SetItem(li_Row, 'field_order',  li_count  )
							
							dw_imp_field_detail.SetItem(li_Row, 'import_id', tab_1.tabpage_hdr.dw_imp_hdr.GetItemNumber(tab_1.tabpage_hdr.dw_imp_hdr.GetRow(),'import_id' ) )
							dw_imp_field_detail.SetItem(li_Row, 'imp_field_label', ls_columns[1] )
							dw_imp_field_detail.SetItem(li_Row, 'imp_field_name', ls_columns[2] )
							dw_imp_field_detail.SetItem(li_Row, 'imp_field_type', ls_columns[3] )
							dw_imp_field_detail.SetItem(li_Row, 'field_length', long(ls_columns[4] ))
							//Added By Jay Chen 12-16-2014
							if lower(ls_columns[5]) = 'yes' then
								dw_imp_field_detail.SetItem(li_Row, 'field_required', 'Y')
							else
								dw_imp_field_detail.SetItem(li_Row, 'field_required', 'N')
							end if
							if lower(ls_columns[6]) = 'yes' then
								dw_imp_field_detail.SetItem(li_Row, 'field_edit_type', 'dddw')
							else
								dw_imp_field_detail.SetItem(li_Row, 'field_edit_type', 'edit')
							end if
							//end
						ElseIf li_Frow > 0  Then
							dw_imp_field_detail.SetItem(li_Frow, 'imp_field_label', ls_columns[1] )
							dw_imp_field_detail.SetItem(li_Frow, 'imp_field_type', ls_columns[3] )
							dw_imp_field_detail.SetItem(li_Frow, 'field_length', long(ls_columns[4] ))
							//Added By Jay Chen 12-16-2014
							if lower(ls_columns[5]) = 'yes' then
								dw_imp_field_detail.SetItem(li_Frow, 'field_required', 'Y')
							else
								dw_imp_field_detail.SetItem(li_Frow, 'field_required', 'N')
							end if
							if lower(ls_columns[6]) = 'yes' then
								dw_imp_field_detail.SetItem(li_Frow, 'field_edit_type', 'dddw')
							else
								dw_imp_field_detail.SetItem(li_Frow, 'field_edit_type', 'edit')
							end if
							//end
						End If						
					Next
					// Save data
					tab_1.tabpage_hdr.Event ue_save()
					tab_1.tabpage_field_data.Event ue_save()
				End If
			end if
		End If
end choose
end event

event other;call super::other;if Message.WordParm = 61458 then 
	Message.Processed = true
	Message.ReturnValue = 0 
end if
end event

event constructor;call super::constructor;//inherit
this.of_SetRowSelect(true)
inv_RowSelect.of_SetStyle(inv_RowSelect.EXTENDED)
this.DragIcon = gs_current_path + "\row.ico"

////Added By Mark Lee 10/30/2015
//event ue_freeform_move_set( true)
ibn_freeform_move = true
this.event ue_get_column_arr_order( )

end event

event doubleclicked;call super::doubleclicked;if not ib_LockFile and Row > 0 then
	il_DragRow = Row
	if ii_CurrMappedDW = 1 then
		dw_prac_cont_id.Event ue_impfield_dragdrop(0)
	else
		dw_map_fields.Event ue_impfield_dragdrop(0)
	end if
end if
end event

event mousemove;call super::mousemove;of_BeginDrag(this)
end event

event lbuttondown;call super::lbuttondown;integer					li_freeform_return 									//Added By Mark Lee 10/30/2015
long						ll_freeform_header

if ibn_freeform_move then 
	ibn_freeform_move_down =true 
	il_freeform_move_x =  0
	ii_freeform_col_order = 0

	ll_freeform_header = Long(this.Object.DataWindow.Header.Height)		
	if ll_freeform_header >= ypos then 	
		li_freeform_return = this.event ue_freeform_set_move_pointer(xpos, ypos)	 
		if li_freeform_return > 0 then
			SetPointer(SizeWE! )	
			il_freeform_move_x =  xpos
			post SetPointer(SizeWE! )	
		else
			SetPointer(Arrow!)
		end if 
	end if 
end if 
end event

event lbuttonup;call super::lbuttonup;if ibn_freeform_move  = true then 								//Added By Mark Lee 10/30/2015
	if ibn_freeform_move_down = true then 
		//move 
		this.event ue_freeform_move_cols(xpos)
	end if 	
	ibn_freeform_move_down = false 
	il_freeform_move_x =  0
	ii_freeform_col_order = 0
	//	SetPointer(Arrow! )		
	post SetPointer(Arrow! )	
end if 


end event

type dw_compute_verify from datawindow within tabpage_field_data
boolean visible = false
integer x = 4343
integer y = 2460
integer width = 169
integer height = 88
integer taborder = 100
boolean bringtotop = true
string title = "none"
string dataobject = "d_import_compute_syntax"
boolean hscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_prac_cont_id from u_dw within tabpage_field_data
event ue_sysfield_dragdrop ( long al_row )
event ue_impfield_dragdrop ( long al_row )
string tag = "dw_prac_cont_id"
boolean visible = false
integer x = 805
integer y = 616
integer width = 2203
integer height = 372
integer taborder = 90
string dragicon = "row.ico"
boolean titlebar = true
string title = "Provider Identification Fields (must be from Basic Information table)"
string dataobject = "d_import_mapping_prac_cont"
borderstyle borderstyle = stylebox!
end type

event ue_sysfield_dragdrop(long al_row);long ll_InsertRow
long ll_CurrentRow
long ll_FindRow
long ll_table_id
long ll_isoft_table_id
long ll_mapped_field_id
long ll_table_records_id
long ll_dv_field_id
string ls_table_name

if dw_records.RowCount() <= 0 then
	MessageBox("Prompt", "There is no import table record.")
	Return	
end if

// Verify table name
ls_table_name = Lower(dw_tables.object.table_name[dw_tables.GetRow()])
if dw_records.RowCount() > 0 and is_curr_table_name <> "pd_basic" and is_curr_table_name <> "ctx_basic_info" then
	MessageBox("ID field", "ID field is not required for selected import table.")
	Return
end if
if ls_table_name <> "pd_basic" and ls_table_name <> "ctx_basic_info" then
	MessageBox("ID field", "ID fields must be from the Basic Information table.") //Start Code Change ----02.07.2008 #V8 maha - modified message
	Return	
end if

ll_dv_field_id = dw_fields.object.field_id[il_DragRow]
ll_FindRow = dw_prac_cont_id.Find("isoft_field_id=" + String(ll_dv_field_id), 1, dw_prac_cont_id.RowCount())
if ll_FindRow > 0 then
	dw_prac_cont_id.ScrollToRow(ll_FindRow)
	MessageBox("Prompt", "The ContractLogix Field already exists.")
	Return
end if

// Get table ID
ll_table_id = dw_tables.object.table_id[dw_tables.GetRow()]
if dw_records.GetRow() > 0 then
	ll_isoft_table_id = dw_records.object.isoft_table_id[dw_records.GetRow()]
else
	ll_isoft_table_id = -1
end if

// Insert or replace a mapped field record
if al_Row > 0 then
	// Replace a mapped field record
	dw_prac_cont_id.object.isoft_field_id[al_Row] = ll_dv_field_id
	ll_mapped_field_id = dw_prac_cont_id.object.rec_id[al_Row]	
	ll_FindRow = dw_map_fields.Find("rec_id=" + String(ll_mapped_field_id), 1, dw_map_fields.RowCount())
	if ll_FindRow > 0 then
		dw_map_fields.object.isoft_field_id[ll_FindRow] = ll_dv_field_id
		if Lower(is_curr_table_name) = "pd_basic" or Lower(is_curr_table_name) = "ctx_basic_info" then
			dw_map_fields.object.key_field[ll_FindRow] = 1
		end if
		dw_map_fields.ScrollToRow(ll_FindRow)
		if dw_map_fields.Update() = 1 then
			of_CompleteTrans(true)
		else
			of_CompleteTrans(false)
			MessageBox("Error", is_mapfield_errinfo, StopSign!)
		end if
	end if
else
	// Insert a import table record
	if dw_records.GetRow() <= 0 then
		ll_InsertRow = dw_records.InsertRow(0)
		ll_CurrentRow = tab_1.tabpage_hdr.dw_browse.GetRow()
		dw_records.object.import_id[ll_InsertRow] = tab_1.tabpage_hdr.dw_browse.object.import_id[ll_CurrentRow]
		dw_records.object.isoft_table_id[ll_InsertRow] = ll_table_id
		dw_records.ScrollToRow(ll_InsertRow)
		if dw_records.Update() <> 1 then
			of_CompleteTrans(false)
			MessageBox("Error", is_mapfield_errinfo, StopSign!)
			Return
		end if
		dw_records.Event RowFocusChanged(ll_InsertRow)
	end if
		
	// Insert a mapped field record
	ll_InsertRow = dw_prac_cont_id.InsertRow(0)
	ll_table_records_id = dw_records.object.table_records_id[dw_records.GetRow()]
	dw_prac_cont_id.object.table_records_id[ll_InsertRow] = ll_table_records_id
	dw_prac_cont_id.object.isoft_field_id[ll_InsertRow] = ll_dv_field_id
	dw_prac_cont_id.object.id_field[ll_InsertRow] = 1
	dw_prac_cont_id.ScrollToRow(ll_InsertRow)
	
	ll_FindRow = dw_map_fields.Find("isoft_field_id=" + String(ll_dv_field_id), 1, dw_map_fields.RowCount())
	if ll_FindRow > 0 then
		dw_map_fields.object.id_field[ll_FindRow] = 1
		dw_prac_cont_id.object.import_field_id[ll_InsertRow] = dw_map_fields.object.import_field_id[ll_FindRow]
		dw_map_fields.ScrollToRow(ll_FindRow)
		ll_InsertRow = ll_FindRow
	else
		ll_InsertRow = dw_map_fields.InsertRow(0)
		dw_map_fields.object.table_records_id[ll_InsertRow] = ll_table_records_id
		dw_map_fields.object.isoft_field_id[ll_InsertRow] = ll_dv_field_id
		dw_map_fields.object.id_field[ll_InsertRow] = 1
		dw_map_fields.ScrollToRow(ll_InsertRow)
	end if
	if is_curr_table_name = "pd_basic" or is_curr_table_name = "ctx_basic_info" then
		dw_map_fields.object.key_field[ll_InsertRow] = 1
	end if
		
	if dw_map_fields.Update() = 1 then
		of_CompleteTrans(true)
		dw_prac_cont_id.object.rec_id[dw_prac_cont_id.GetRow()] = dw_map_fields.object.rec_id[dw_map_fields.GetRow()]
		dw_detail.SetRedraw(true)
	else
		of_CompleteTrans(false)		
		MessageBox("Error", is_mapfield_errinfo, StopSign!)
	end if	
end if
end event

event ue_impfield_dragdrop(long al_row);long ll_InsertRow
long ll_CurrentRow
long ll_FindRow
long ll_table_id
long ll_isoft_table_id
long ll_mapped_field_id
long ll_table_records_id
long ll_dv_import_field_id
string ls_table_name

if dw_records.RowCount() <= 0 then
	MessageBox("Prompt", "There is no import table record.")
	Return	
end if

// Verify table name
ll_dv_import_field_id = dw_field_list.object.rec_id[il_DragRow]
ls_table_name = Lower(dw_tables.object.table_name[dw_tables.GetRow()])
if is_curr_table_name <> "pd_basic" and is_curr_table_name <> "ctx_basic_info" then
	MessageBox("ID field", "ID field is not required for selected import table.")
	Return
end if

// Insert or replace a mapped field record
if al_Row > 0 then
	// Replace a mapped field record
	dw_prac_cont_id.object.import_field_id[al_Row] = ll_dv_import_field_id
	ll_mapped_field_id = dw_prac_cont_id.object.rec_id[al_Row]	
	ll_FindRow = dw_map_fields.Find("rec_id=" + String(ll_mapped_field_id), 1, dw_map_fields.RowCount())
	if ll_FindRow > 0 then
		dw_map_fields.object.import_field_id[ll_FindRow] = ll_dv_import_field_id
		dw_map_fields.ScrollToRow(ll_FindRow)
		if dw_map_fields.Update() = 1 then
			of_CompleteTrans(true)
		else
			of_CompleteTrans(false)
			MessageBox("Error", is_mapfield_errinfo, StopSign!)
		end if
	end if
else	
	// Insert a mapped field record	
	ll_InsertRow = dw_prac_cont_id.InsertRow(0)
	ll_table_records_id = dw_records.object.table_records_id[dw_records.GetRow()]
	dw_prac_cont_id.object.table_records_id[ll_InsertRow] = ll_table_records_id
	dw_prac_cont_id.object.import_field_id[ll_InsertRow] = ll_dv_import_field_id
	dw_prac_cont_id.object.id_field[ll_InsertRow] = 1
	dw_prac_cont_id.ScrollToRow(ll_InsertRow)
	
	ll_InsertRow = dw_map_fields.InsertRow(0)
	dw_map_fields.object.table_records_id[ll_InsertRow] = ll_table_records_id
	dw_map_fields.object.import_field_id[ll_InsertRow] = ll_dv_import_field_id
	dw_map_fields.object.id_field[ll_InsertRow] = 1
	dw_map_fields.ScrollToRow(ll_InsertRow)
	if is_curr_table_name = "pd_basic" or is_curr_table_name = "ctx_basic_info" then
		dw_map_fields.object.key_field[ll_InsertRow] = 1
	end if
	
	if dw_map_fields.Update() = 1 then
		of_CompleteTrans(true)
		dw_prac_cont_id.object.rec_id[dw_prac_cont_id.GetRow()] = dw_map_fields.object.rec_id[dw_map_fields.GetRow()]
		dw_detail.SetRedraw(true)
	else
		of_CompleteTrans(false)		
		MessageBox("Error", is_mapfield_errinfo, StopSign!)
	end if	
end if
end event

event dragwithin;call super::dragwithin;if Source.tag = "dw_fields" then	
	dw_fields.SelectRow(0, false)
	dw_fields.SelectRow(il_DragRow, true)
elseif Source.tag = "dw_field_list" then
	dw_field_list.SelectRow(0, false)
	dw_field_list.SelectRow(il_DragRow, true)	
end if

// Select row
if Source.tag = "dw_fields" or Source.tag = "dw_field_list" then		
	if Row >0 then
		if not IsSelected(Row) then
			this.SelectRow(0, false)
			this.SelectRow(Row, true)
		end if		
	else
		this.SelectRow(0, false)
	end if
end if
end event

event dragdrop;call super::dragdrop;if Source.tag = "dw_fields" then
	this.Event ue_sysfield_dragdrop(Row)
elseif Source.tag = "dw_field_list" then
	this.Event ue_impfield_dragdrop(Row)
end if
end event

event clicked;call super::clicked;//inherit
il_DragRow = Row
end event

event other;call super::other;if Message.WordParm = 61458 then 
	Message.Processed = true
	Message.ReturnValue = 0 
end if
end event

event getfocus;call super::getfocus;//inherit
//of_SetMappedDWTitle(1)
end event

event constructor;call super::constructor;//Inherit
this.of_SetRowSelect(true)
this.DragIcon = gs_current_path + "\row.ico"
end event

event doubleclicked;call super::doubleclicked;if not ib_LockFile and Row > 0 then
	if MessageBox("Prompt", "Are you sure you want to delete the record?", Question!, YesNo!) = 1 then
		il_DragRow = Row
		dw_fields.Event ue_DragDrop(this.tag)
	end if
end if
end event

event mousemove;call super::mousemove;of_BeginDrag(this)
end event

type tabpage_data from userobject within tab_1
event ue_init ( )
event ue_resize ( )
boolean visible = false
integer x = 18
integer y = 112
integer width = 4261
integer height = 1972
boolean enabled = false
long backcolor = 79680469
string text = "Data"
long tabtextcolor = 33554432
long tabbackcolor = 79680469
string picturename = "DataWindow!"
long picturemaskcolor = 12632256
dw_imp_data dw_imp_data
gb_operation gb_operation
cb_imp_data cb_imp_data
cb_imp_pro cb_imp_pro
cb_savedata cb_savedata
cb_get_saved cb_get_saved
cb_sort cb_sort
cb_filter cb_filter
end type

event ue_resize();dw_imp_data.Width = this.Width - 10
dw_imp_data.Height = this.Height - dw_imp_data.Y - 10
gb_operation.Width = dw_imp_data.Width - 5
end event

on tabpage_data.create
this.dw_imp_data=create dw_imp_data
this.gb_operation=create gb_operation
this.cb_imp_data=create cb_imp_data
this.cb_imp_pro=create cb_imp_pro
this.cb_savedata=create cb_savedata
this.cb_get_saved=create cb_get_saved
this.cb_sort=create cb_sort
this.cb_filter=create cb_filter
this.Control[]={this.dw_imp_data,&
this.gb_operation,&
this.cb_imp_data,&
this.cb_imp_pro,&
this.cb_savedata,&
this.cb_get_saved,&
this.cb_sort,&
this.cb_filter}
end on

on tabpage_data.destroy
destroy(this.dw_imp_data)
destroy(this.gb_operation)
destroy(this.cb_imp_data)
destroy(this.cb_imp_pro)
destroy(this.cb_savedata)
destroy(this.cb_get_saved)
destroy(this.cb_sort)
destroy(this.cb_filter)
end on

type dw_imp_data from u_dw within tabpage_data
event ue_modifystyle ( )
event ue_settitle ( long al_rowcount )
integer y = 196
integer width = 4242
integer height = 1776
integer taborder = 100
boolean titlebar = true
string title = "Imported Data: 0 row"
boolean hscrollbar = true
borderstyle borderstyle = stylebox!
end type

event ue_modifystyle();string ls_Name
string ls_Style
integer ll_PosX
integer i, li_FieldCount

w_import_painter.SetRedraw(false)

li_FieldCount = Integer(this.object.datawindow.column.count)
for i = 1 to li_FieldCount
	ls_Name = this.Describe("#" + String(i) + ".name")
	ls_Style = ls_Name + ".width=400"
	ls_Style += " " + ls_Name + "_t.width=400"
	if i = 1 then
		ls_Style += " " + ls_Name + "_t.X=0"
	else
		ls_Style += " " + ls_Name + "_t.X=" + String(ll_PosX)
	end if
	ls_Style += " " + ls_Name + "_t.border=6"
	ls_Style += " " + ls_Name + "_t.background.mode=2"
	ls_Style += " " + ls_Name + "_t.background.color=67108864"
	
	this.Modify(ls_Style)	
	ll_PosX = Long(this.Describe(ls_Name + ".X")) + 400
next
this.Modify("sys_pc_id.visible=0")
this.Modify("sys_facility_id.visible=0")
this.Modify("sys_contact_id.visible=0")
this.Modify("sys_hdr_id.visible=0")		//Added By Mark Lee 04/17/2014
this.Modify("sys_user_id.visible=0")	//Added By Mark Lee 04/17/2014
w_import_painter.SetRedraw(true)
end event

event ue_settitle(long al_rowcount);if al_RowCount > 1 then
	this.Title = "Imported Data Rows: " + String(al_RowCount)
elseif al_RowCount = 1 then
	this.Title = "Imported Data Rows: 1"
else
	this.Title = "Imported Data Rows: 0"
end if
end event

event other;call super::other;if Message.WordParm = 61458 then 
	Message.Processed = true
	Message.ReturnValue = 0 
end if
end event

event constructor;call super::constructor;//Inherit
this.of_SetRowSelect(true)
end event

type gb_operation from groupbox within tabpage_data
integer x = 5
integer y = 12
integer width = 4229
integer height = 176
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Data Operation"
end type

type cb_imp_data from commandbutton within tabpage_data
integer x = 46
integer y = 76
integer width = 480
integer height = 84
integer taborder = 110
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Get &Import Data"
end type

event clicked; string ls_Error
string ls_Syntax
string ls_Name
DataStore lds_imp_data
n_cst_import lnv_import

SetPointer(HourGlass!)

//Get import basic information
lnv_import = Create n_cst_import
lnv_import.of_GetImportInfo(il_curr_import_id, false)

//Get import data
dw_imp_data.Reset()
lds_imp_data = Create DataStore
//debugbreak()
ls_Error = lnv_import.of_GetImportData(il_curr_import_id, lds_imp_data)
if Len(ls_Error) > 0 then
	Destroy lds_imp_data
	Destroy lnv_import
	SetPointer(Arrow!)
	MessageBox("Prompt", ls_Error)
	Return
end if

//Display import data
ls_Syntax = lds_imp_data.object.datawindow.syntax
dw_imp_data.Create(ls_Syntax, ls_Error)
dw_imp_data.Event ue_ModifyStyle()
if lds_imp_data.RowCount() > 0 then
	lds_imp_data.RowsMove(1, lds_imp_data.RowCount(), Primary!, dw_imp_data, 1, Primary!)
end if
dw_imp_data.Modify("DataWindow.ReadOnly = 'yes'")
dw_imp_data.Event ue_SetTitle(dw_imp_data.RowCount())

Destroy lds_imp_data
Destroy lnv_import

SetPointer(Arrow!)
end event

type cb_imp_pro from commandbutton within tabpage_data
integer x = 581
integer y = 76
integer width = 512
integer height = 84
integer taborder = 120
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Process Import Data"
end type

event clicked;long ll_LastRow
n_cst_import_credapp lnv_import_credapp
n_cst_import_contract lnv_import_contract

if dw_imp_data.RowCount() <= 0 then
	//MessageBox("Prompt", "There is no Import data to be imported.") //Start Code Change ----02.07.2008 #V8 maha - modified message
	MessageBox("Prompt", "You need to Click the Get Import Data button first to retrieve the import data into the system before clicking the Process Import Data.") //Add by Evan 02.19.2008
	Return
end if

// Import data
SetPointer(HourGlass!)
if ii_curr_isoft_module = 1 then
	lnv_import_credapp = Create n_cst_import_credapp
	lnv_import_credapp.of_Execute(il_curr_import_id, dw_imp_data)
	Destroy lnv_import_credapp
else
	lnv_import_contract = Create n_cst_import_contract
	lnv_import_contract.of_Execute(il_curr_import_id, dw_imp_data)
	Destroy lnv_import_contract
end if

// Display log
il_page4_import_id = -1
tab_1.SelectTab(4)
ll_LastRow = tab_1.tabpage_log.dw_imp_proc.RowCount()
tab_1.tabpage_log.dw_imp_proc.ScrollToRow(ll_LastRow)
SetPointer(Arrow!)
end event

type cb_savedata from commandbutton within tabpage_data
integer x = 1659
integer y = 76
integer width = 507
integer height = 84
integer taborder = 100
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Save Imported Data"
end type

event clicked;long ll_CurrentRow
integer li_Count
integer li_field_length
integer i, li_FieldCount
string  ls_TableName
string  ls_import_name
string  ls_imp_field_name
string  ls_comp_def
string  ls_SQLSelect
string  ls_TableSyntax
string  ls_DWSyntax
string  ls_Error
string  ls_PrimaryKey
boolean lb_OldAutoCommit
n_import_ds lds_Data

if dw_imp_data.RowCount() <= 0 then
	MessageBox("Prompt", "There is no Import data to be saved.")  //Start Code Change ----02.07.2008 #V8 maha - modified message
	Return
end if
ll_CurrentRow = tab_1.tabpage_hdr.dw_imp_hdr.GetRow()
if ll_CurrentRow <= 0 then Return

//Check table if exists
ls_import_name = Trim(tab_1.tabpage_hdr.dw_imp_hdr.object.import_name[ll_CurrentRow])
if IsNull(ls_import_name) or Len(ls_import_name) <= 0 then
	MessageBox("Prompt", "Import name can not be null.")
	Return
end if
ls_TableName = of_CorrectTableName(ls_import_name) //"impt_" + of_ReplaceBlank(ls_import_name, "_") ; //Modify by Evan 09/18/2008
SELECT count(*) INTO :li_Count FROM sysobjects WHERE name = :ls_TableName and type = 'U';
if li_Count > 0 then
	if MessageBox("Prompt", "The Import table already exists.~r~nWould you like to replace it?", Question!, YesNo!)=2 then
		Return 
	end if
end if

//Build sql of select and create table 
lds_Data = Create n_import_ds
lds_Data.DataObject = "d_import_ds_impfield_save"
lds_Data.SetTransObject(SQLCA)
lds_Data.Retrieve(il_curr_import_id)
for i = 1 to lds_Data.RowCount()
	ls_comp_def = Trim(lds_Data.object.comp_def[i])
	if Len(ls_comp_def) > 0 then Continue
	
	ls_imp_field_name = Trim(lds_Data.object.imp_field_name[i])
	if IsNull(ls_imp_field_name) or ls_imp_field_name = "" then Continue
		
	li_field_length = lds_Data.object.field_length[i]
	if Len(ls_SQLSelect) > 0 then ls_SQLSelect += ","
	ls_SQLSelect += ls_imp_field_name
	if Len(ls_TableSyntax) > 0 then ls_TableSyntax += ","
	ls_TableSyntax += ls_imp_field_name + " varchar(" + String(li_field_length) + ") null"
next
ls_PrimaryKey = ls_TableName + "_id"
ls_TableSyntax = "create table " + ls_TableName + " (" + ls_TableSyntax + "," + ls_PrimaryKey + " int identity not null, primary key (" + ls_PrimaryKey + "))"
if li_Count > 0 then	ls_TableSyntax = "drop table " + ls_TableName + "; " + ls_TableSyntax
ls_SQLSelect = "SELECT " + ls_SQLSelect + ", " + ls_PrimaryKey + " FROM " + ls_TableName

//Create a table structure in database
lb_OldAutoCommit = SQLCA.AutoCommit
if lb_OldAutoCommit = false then SQLCA.AutoCommit = true		
EXECUTE IMMEDIATE :ls_TableSyntax;
if SQLCA.SQLCode <> 0 then
	Destroy lds_Data
	if SQLCA.AutoCommit <> lb_OldAutoCommit then SQLCA.AutoCommit = lb_OldAutoCommit
	MessageBox("Prompt", "Failed to create table structure.~r~n" + ls_TableSyntax)
	Return
end if
if SQLCA.AutoCommit <> lb_OldAutoCommit then SQLCA.AutoCommit = lb_OldAutoCommit

//Dynamic create DW
ls_DWSyntax = SQLCA.SyntaxFromSQL(ls_SQLSelect, "", ls_Error)
if Len(ls_Error) > 0 then
	Destroy lds_Data
	MessageBox("Prompt", "Failed to dynamically create DataWindow.~r~n" + ls_Error)
	Return	
end if
lds_Data.Create(ls_DWSyntax, ls_Error)
lds_Data.SetTransObject(SQLCA)

//Save data
if lds_Data.ImportString(dw_imp_data.object.datawindow.data) < 0 then
	Destroy lds_Data
	MessageBox("Prompt", "Saving Import data to DataStore failed.") //Start Code Change ----02.07.2008 #V8 maha - modified message
	Return
end if
if lds_Data.Update() = 1 then
	of_CompleteTrans(true)
else
	of_CompleteTrans(false)
	MessageBox("Prompt", "Save imported data failed.~r~n" + lds_Data.is_SQLErrText)
end if

Destroy lds_Data
end event

type cb_get_saved from commandbutton within tabpage_data
integer x = 2226
integer y = 76
integer width = 480
integer height = 84
integer taborder = 110
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Get Saved Data"
end type

event clicked;long ll_PosX
long i, ll_CurrentRow
string ls_TableName
string ls_PrimaryKey
string ls_DWSyntax
string ls_Error
string ls_Name
string ls_comp_def
string ls_imp_field_name
string ls_import_name
string ls_SQLSelect
integer li_FieldCount
DataStore lds_Data

//Get table name
ll_CurrentRow = tab_1.tabpage_hdr.dw_imp_hdr.GetRow()
if ll_CurrentRow <= 0 then Return
ls_import_name = Trim(tab_1.tabpage_hdr.dw_imp_hdr.object.import_name[ll_CurrentRow])
if IsNull(ls_import_name) then ls_import_name = ""
ls_TableName = of_CorrectTableName(ls_import_name) //"impt_" + of_ReplaceBlank(ls_import_name, "_") ; //Modify by Evan 09/18/2008

//Build select sql
lds_Data = Create DataStore
lds_Data.DataObject = "d_import_ds_impfield_save"
lds_Data.SetTransObject(SQLCA)
lds_Data.Retrieve(il_curr_import_id)
for i = 1 to lds_Data.RowCount()
	ls_comp_def = Trim(lds_Data.object.comp_def[i])
	if Len(ls_comp_def) > 0 then Continue
	
	ls_imp_field_name = Trim(lds_Data.object.imp_field_name[i])
	if IsNull(ls_imp_field_name) or ls_imp_field_name = "" then Continue

	if Len(ls_SQLSelect) > 0 then ls_SQLSelect += ","
	ls_SQLSelect += ls_imp_field_name
next
if ls_SQLSelect = "" then
	MessageBox("Prompt", "Failed to get import fields.")
	Return
end if
//Added By Mark Lee 04/17/2014 add sys_user_id column
//ls_SQLSelect = "SELECT " + ls_SQLSelect + ",0 sys_pc_id, 0 sys_facility_id, 0 sys_contact_id FROM " + ls_TableName		
ls_SQLSelect = "SELECT " + ls_SQLSelect + ",0 sys_pc_id, 0 sys_facility_id, 0 sys_contact_id, 0 sys_hdr_id, '' as sys_user_id FROM " + ls_TableName

//Dynamic create DW
ls_DWSyntax = SQLCA.SyntaxFromSQL(ls_SQLSelect, "Style(Type=Grid)", ls_Error)
if Len(ls_Error) > 0 then
	MessageBox("Prompt", "Please save imported data first.")
	Return
end if
dw_imp_data.Create(ls_DWSyntax, ls_Error)
dw_imp_data.SetTransObject(SQLCA)
dw_imp_data.Event ue_ModifyStyle()

//Retrieve data from import table
if dw_imp_data.Retrieve() = -1 then
	dw_imp_data.Event ue_SetTitle(dw_imp_data.RowCount())
	MessageBox("Prompt", "Failed to retrieve data from " + ls_TableName + ".")
else
	dw_imp_data.Event ue_SetTitle(dw_imp_data.RowCount())
end if
end event

type cb_sort from commandbutton within tabpage_data
integer x = 3269
integer y = 76
integer width = 421
integer height = 84
integer taborder = 90
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Sor&t..."
end type

event clicked;string ls_Null

if dw_imp_data.RowCount() <= 0 then
	MessageBox("Prompt", "There is no import data to be sorted.") //Start Code Change ----02.07.2008 #V8 maha - modified message
	Return
end if

SetNull(ls_Null)
dw_imp_data.SetSort(ls_Null)
dw_imp_data.Sort()
end event

type cb_filter from commandbutton within tabpage_data
integer x = 3758
integer y = 76
integer width = 421
integer height = 84
integer taborder = 90
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Filter..."
end type

event clicked;string ls_Null

if dw_imp_data.RowCount() + dw_imp_data.FilteredCount() <= 0 then
	MessageBox("Prompt", "There is no import data to filter.") //Start Code Change ----02.07.2008 #V8 maha - modified message
	Return
end if

SetNull(ls_Null)
dw_imp_data.SetFilter(ls_Null)
dw_imp_data.Filter()
end event

type tabpage_log from userobject within tab_1
event ue_retrieve ( )
event ue_resize ( )
integer x = 18
integer y = 112
integer width = 4261
integer height = 1972
boolean enabled = false
long backcolor = 79680469
string text = "Salesforce Logs"
long tabtextcolor = 33554432
long tabbackcolor = 79680469
string picturename = "ExecuteSQL5!"
long picturemaskcolor = 12632256
dw_imp_table dw_imp_table
dw_imp_proc dw_imp_proc
dw_imp_err dw_imp_err
end type

event ue_retrieve();if il_curr_import_id = il_page4_import_id then Return
il_page4_import_id = il_curr_import_id

if dw_imp_proc.Retrieve(il_curr_import_id) > 0 then
	dw_imp_proc.SelectRow(0, false)
	dw_imp_proc.SelectRow(1, true)
	dw_imp_proc.Event RowFocusChanged(1)
	dw_imp_proc.sharedata(dw_imp_table)
else
	dw_imp_table.Reset()
	dw_imp_err.Reset()	
end if
end event

event ue_resize();dw_imp_proc.Width = this.Width - 10
dw_imp_table.Width = dw_imp_proc.Width
//Modified By Jay Chen 10-11-2014
dw_imp_table.height = this.Height - dw_imp_table.Y - 10
//dw_imp_err.Width = dw_imp_proc.Width

//dw_imp_err.Y = dw_imp_table.Y + dw_imp_table.Height
//dw_imp_err.Height = this.Height - dw_imp_err.Y - 10

end event

on tabpage_log.create
this.dw_imp_table=create dw_imp_table
this.dw_imp_proc=create dw_imp_proc
this.dw_imp_err=create dw_imp_err
this.Control[]={this.dw_imp_table,&
this.dw_imp_proc,&
this.dw_imp_err}
end on

on tabpage_log.destroy
destroy(this.dw_imp_table)
destroy(this.dw_imp_proc)
destroy(this.dw_imp_err)
end on

type dw_imp_table from u_dw within tabpage_log
integer y = 672
integer width = 4242
integer height = 1292
integer taborder = 120
boolean titlebar = true
string title = "Sync Details"
string dataobject = "dw_migration_detail"
boolean vscrollbar = false
borderstyle borderstyle = stylebox!
end type

event constructor;call super::constructor;//inherit
//this.Modify("DataWindow.ReadOnly = 'yes'")
end event

event other;call super::other;if Message.WordParm = 61458 then 
	Message.Processed = true
	Message.ReturnValue = 0 
end if
end event

event rowfocuschanged;call super::rowfocuschanged;////inherit
//long ll_process_tables_id
//
//this.SelectRow(0, false)
//this.SelectRow(CurrentRow, true)
//
//if CurrentRow > 0 then
//	ll_process_tables_id = this.object.process_tables_id[CurrentRow]
//	if dw_imp_err.Retrieve(ll_process_tables_id) > 0 then
//		dw_imp_err.SelectRow(0, false)
//		dw_imp_err.SelectRow(1, true)
//	end if
//else
//	dw_imp_err.Reset()
//end if
end event

type dw_imp_proc from u_dw within tabpage_log
integer y = 8
integer width = 4242
integer height = 660
integer taborder = 120
boolean titlebar = true
string title = "Sync Process"
string dataobject = "dw_migration_list"
boolean hscrollbar = true
borderstyle borderstyle = stylebox!
end type

event rowfocuschanged;call super::rowfocuschanged;//inhert
long ll_process_id

this.SelectRow(0, false)

if CurrentRow > 0 then
	this.SelectRow(CurrentRow, true)
	if CurrentRow < 1 then return
	tab_1.tabpage_log.dw_imp_table.ScrollToRow(CurrentRow)
	tab_1.tabpage_log.dw_imp_table.SetRow(CurrentRow)	
else
	dw_imp_table.Reset()
	dw_imp_err.Reset()
end if
end event

event constructor;call super::constructor;//inherit
this.Modify("DataWindow.ReadOnly = 'yes'")
end event

event other;call super::other;if Message.WordParm = 61458 then 
	Message.Processed = true
	Message.ReturnValue = 0 
end if
end event

event doubleclicked;call super::doubleclicked;//string ls_err_value
//
//if row > 0 and dwo.name = "err_value" then
//	ls_err_value = this.object.err_value[row]
//	if Len(ls_err_value) > 0 then
//		OpenWithParm(w_import_loglist, "LOG#" + ls_err_value)
//	end if
//end if
end event

type dw_imp_err from u_dw within tabpage_log
boolean visible = false
integer x = 4133
integer y = 1844
integer width = 110
integer height = 128
integer taborder = 110
boolean titlebar = true
string title = "Import Process Error Details"
string dataobject = "d_import_process_errors"
boolean hscrollbar = true
borderstyle borderstyle = stylebox!
end type

event rowfocuschanged;call super::rowfocuschanged;//inherit
this.SelectRow(0, false)
this.SelectRow(CurrentRow, true)
end event

event constructor;call super::constructor;//inherit
this.Modify("DataWindow.ReadOnly = 'yes'")
end event

event other;call super::other;if Message.WordParm = 61458 then 
	Message.Processed = true
	Message.ReturnValue = 0 
end if
end event

event doubleclicked;call super::doubleclicked;string ls_err_value

if row > 0 and dwo.name = "err_value" then
	ls_err_value = this.object.err_value[row]
	if Len(ls_err_value) > 0 then
		OpenWithParm(w_import_loglist, "LOG#" + ls_err_value)
	end if
end if
end event

type cb_preprocess from commandbutton within w_import_salesforcepainter
boolean visible = false
integer x = 1609
integer y = 12
integer width = 343
integer height = 92
integer taborder = 41
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Pre-Process"
end type

event clicked;//open(w_indy_pre_process)
integer itest
integer li_row
string ls_from
string ls_to
string ls_file
n_getfilename ln_getfilename //Added By Jay Chen 08-15-2014

li_row =  tab_1.tabpage_hdr.dw_imp_hdr.getrow()
//ls_from = tab_1.tabpage_hdr.dw_imp_hdr.getitemstring(li_row,"preprocess_path")
ls_from = ""

ls_to = tab_1.tabpage_hdr.dw_imp_hdr.getitemstring(li_row,"imp_file")

if isnull(ls_from) or len(ls_from ) = 0 then
	gf_load_dir_path() //Added by Ken.Guo on 2009-03-10
//	GetFileOpenName ( "Select Preprocess File", ls_from, ls_file )
	ln_getfilename.of_getopenfilename( "Select Preprocess File", ls_from, ls_file )
	gf_save_dir_path(ls_from) //Added by Ken.Guo on 2009-03-10
	//ChangeDirectory(gs_current_path) //Add by Evan 12/11/2008
end if
debugbreak()
itest = of_preprocess_data( ii_preprocess , ls_from,ls_to) //Start Code Change ----07.03.2008 #V81 maha

if itest = 1 then
	messagebox("Process Successful","File saved: " + ls_to)
else
	messagebox("Complete","Process Failed")
end if
end event

