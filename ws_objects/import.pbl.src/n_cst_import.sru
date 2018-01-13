$PBExportHeader$n_cst_import.sru
forward
global type n_cst_import from nonvisualobject
end type
end forward

global type n_cst_import from nonvisualobject
event type integer ue_importprocess ( long al_import_id )
event ue_main ( long al_import_id )
event ue_getimportdata ( long al_import_id,  ref boolean ab_doprocess )
event ue_createcomputefield ( )
event ue_formatdata ( )
event ue_updatelog ( )
event ue_generateerrorfile ( )
event ue_sendemail ( )
event ue_saveerrorfile ( )
event ue_complete ( )
end type
global n_cst_import n_cst_import

type variables
// Import information n_import_ds
n_import_ds ids_import_hdr     //Recordset from import_hdr table
n_import_ds ids_table_record   //Recordset from sys_tables and import_table_records table
n_import_ds ids_import_field   //Recordset from import_file_fields table
n_import_ds ids_mapping_field  //Recordset from sys_fields and import_mapping_fields table
n_import_ds ids_lookup_mapping //Recordset from import_lu_map_fields table
n_import_ds ids_dataview_screen

// Error log n_import_ds
n_import_ds ids_log_proc
n_import_ds ids_log_table
n_import_ds ids_log_error
long il_ErrorCount

// Import data n_import_ds
n_import_ds ids_imp_data
n_import_ds ids_intellisoft_table
n_import_ds ids_intellisoft_table_temp
n_import_ds ids_newrow

// Code lookup n_import_ds
n_import_ds ids_address_lookup
n_import_ds ids_code_lookup
n_import_ds ids_facility
n_import_ds ids_committee
n_import_ds ids_company
n_import_ds ids_coderownum1
n_import_ds ids_coderownum2

// Security n_import_ds
n_import_ds ids_security_role
n_import_ds ids_category_right

// Control variables
long il_CurrTableAddCount
long il_CurrTableModifyCount
long il_StatusAutoAddCount
boolean ib_IsExecute1
boolean ib_IsDoPrompt
boolean is_OldAutoCommit
boolean ib_IsCodeLookupChanged = false
string  is_lookup_name[]

// Constant variables
constant long IL_ERRTYPE_OTHER          = 0
constant long IL_ERRTYPE_MAPDESIGN      = 1
constant long IL_ERRTYPE_VERIFYVALUE    = 2
constant long IL_ERRTYPE_DATAINTEGRITY  = 3
constant long IL_ERRTYPE_ADDVERIFY      = 4
constant long IL_ERRTYPE_UPDATE         = 5
constant long IL_MAX_ERRORCOUNT         = 100

constant string IS_ID_FIELD  = "find_field"
constant string IS_KEY_FIELD = "find_field"
constant string IS_LOG_NAME  = "Import error log.txt"

//Added By Jay Chen 10-31-2013
String is_email_message 
datastore ids_ctxbasicinfo_imp_record
boolean ib_sendmail_new = false 

long il_wf_ctx_id[] //Added By Jay Chen 10-12-2015
n_cst_workflow_triggers lnv_workflow
datastore ids_add_ctx_id,ids_mod_ctx_id //Added By Jay Chen 01-07-2016
long il_sync_salesforce //Added by Harry 20170321
string	is_ImportType //Added By Gavin.Jay 2017-04-10
String is_sf_objectname //Added By Ken.Guo 2017-04-26
end variables

forward prototypes
public function blob of_readfile (string as_file)
public function integer of_getfrmfieldvalue (string as_record, string as_delimiter, ref string as_value[])
public function boolean of_iscontinue ()
public function integer of_formatcase (long al_row, string as_field, string as_casetype)
public function integer of_formatstrip (long al_row, string as_field, string as_striptype)
public function integer of_formatfield (long al_row, string as_field, string as_format)
public subroutine of_completetrans (boolean ab_iscommit)
public function string of_getimportdir ()
public function integer of_getimportinfo (long al_import_id, boolean ab_isimport)
public function integer of_dyncreateimportdw (ref datastore ads_data)
public function string of_getimportdata (long al_import_id, ref datastore ads_imp_data)
public function string of_verifyimportfield (ref datastore ads_import_field)
public function integer of_setdefaultvalue (ref datastore ads_imp_data)
public function integer of_execute (long al_import_id, ref datawindow adw_data)
public function integer of_retrievelookupmapping ()
public function integer of_dataprocess ()
public function integer of_retrievelookupdata (long al_lu_template, string as_lu_type, string as_lu_table)
public function integer of_disposeverifyvalue (string as_importvalue, string as_field_type, integer ai_field_len, ref string as_charvalue, ref decimal adc_decvalue, ref datetime adt_dtvalue)
public function integer of_dataupdate ()
public function integer of_datapopulate ()
public function integer of_dyncreateistabledw (string as_table_name)
public function integer of_postupdate ()
public function integer of_preupdate ()
public function integer of_setsequenceno (ref datastore ads_sequence, ref datastore ads_intellisoft_table, long al_addcount, string as_filterfield, string as_updatefield, boolean ab_flag)
public function integer of_checkmapping (boolean ab_isimport, long al_table_id, string as_table_name, ref datastore ads_import_field, ref datastore ads_mapping_field, ref string as_errortext[])
public function integer of_setautocommit (boolean ab_isauto)
public function string of_reviseexpvalue (string as_value)
public function integer of_addcontractcategoryright (long al_category)
public function integer of_disposelookupcode (long al_importdatarow, integer ai_mapfieldindex, string as_importvalue, string as_field_type, integer ai_no_match_procd, string as_lu_type, string as_lu_table, string as_lu_field_name)
public function integer of_resetcodevalue (long al_row, integer ai_column, string as_field_type, long al_lookup_code)
public function integer of_updatelookuptable (integer ai_islookupfield, integer ai_mapfieldindex, string as_field_type)
public function integer of_disposelookupcode (long al_importdatarow, integer ai_mapfieldindex, string as_importvalue, string as_field_type, integer ai_no_match_procd)
public function integer of_disposenullvalue (integer ai_null_type, long al_importdatarow, integer ai_mapfieldindex, ref string as_importvalue)
public function string of_convertfieldalias (string as_string)
public function integer of_run_project (integer ai_project, string as_from)
public function integer of_execute (long al_import_id, boolean ab_isdoprompt)
public function integer of_getkeyfields (ref integer as_keyfieldindex[], ref string as_keyfieldname[])
public function integer of_log (string as_text)
public function long of_log (long al_error_record, string as_error_field, long al_err_type, string as_err_value)
public function integer of_log (boolean ab_isimport, string as_text, ref string as_errortext[])
public function integer of_resetfieldtype ()
public function string of_checkimporttable (ref datastore ads_data)
public function string of_generateerrortitle (ref datastore ads_data, long al_row)
public function string of_generateerrordetail (ref datastore ads_data, long al_row)
public function string of_addspace (any aa_value, integer ai_len)
public function boolean of_isstopimport ()
public function integer of_cacheforeignkey (string as_imp_field, string as_table_field)
public function string of_reviseexpvalue (string as_value, boolean ab_lower)
public subroutine of_export_import_data_word ()
public function integer of_copy_import_file (long al_import_id, boolean ab_import_result)
public function string of_existscheckedvalue (string as_tablename, string as_column, string as_arrvalue[], string as_type, ref string as_output_table)
public function string of_checkimporttable (ref datastore ads_data, string as_class)
public function integer of_checkmapping (boolean ab_isimport, long al_table_id, string as_table_name, ref datastore ads_import_field, ref datastore ads_mapping_field, ref string as_errortext[], string as_project, datastore ads_table_record)
end prototypes

event type integer ue_importprocess(long al_import_id);integer li_Return
integer li_TableIndex
string  ls_table_name
string  ls_ErrorText[]
long ll_table_id
long ll_table_records_id
Boolean lb_error
//Added By Jay Chen 01-07-2016
long ll_nullrow[]
long ll_cnt,ll_ctx_id,ll_status_id,ll_category
Integer li_trigger_wf, li_ret
long ll_index,ll_row
boolean lb_already_trigger
long ll_add_ctx_id[],ll_mod_ctx_id[]

gl_mod_ctx_id[] = ll_nullrow[]
gl_add_ctx_id[] = ll_nullrow[]
ids_add_ctx_id = create datastore
ids_add_ctx_id.dataobject = 'd_import_ctx_list'
ids_mod_ctx_id = create datastore
ids_mod_ctx_id.dataobject = 'd_import_ctx_list'
ids_add_ctx_id.reset()
ids_mod_ctx_id.reset()

// Import external data into per IntelliSoft Table
for li_TableIndex = 1 to ids_table_record.RowCount()
	// Set progress bar
	w_import_progressbar.of_ReduceRemainCount()	
	w_import_progressbar.of_SetTableName(ids_table_record.object.table_name_allias[li_TableIndex])
	w_import_progressbar.of_SetImportProcessDesc("Initialization")
	w_import_progressbar.of_SetMaxPosition(4)
	
	// Initialization
	il_CurrTableAddCount = 0
	il_CurrTableModifyCount = 0
	il_StatusAutoAddCount = 0
	ids_table_record.SetRow(li_TableIndex)
	ids_log_table.SetRow(li_TableIndex)
	ll_table_id = ids_table_record.object.isoft_table_id[li_TableIndex]
	ls_table_name = Lower(ids_table_record.object.table_name[li_TableIndex])
		
	// Pre-storage mapping fields(filter mapping fields)
	ll_table_records_id = ids_table_record.object.table_records_id[li_TableIndex]
	ids_mapping_field.of_Filter("table_records_id=" + String(ll_table_records_id))
	
	// Check mapped relationship
	li_Return = of_CheckMapping(true, ll_table_id, ls_table_name, ids_import_field, ids_mapping_field, ls_ErrorText[])
	if li_Return = -1 then
		Return -1
	elseif li_Return = -2 then
		lb_error = True
		Continue
	end if
	w_import_progressbar.of_SkipNextPosition()
	
	// Dynamic create updatable and temporary DataWindow
	li_Return = of_DynCreateIstableDW(ls_table_name)
	if li_Return = -1 then
		Return -1
	elseif li_Return = -2 then
		lb_error = True
		Continue
	end if
	w_import_progressbar.of_SkipNextPosition()
	
	// Reset type of field
	of_ResetFieldType()
	w_import_progressbar.of_SkipNextPosition()
	
	// Pre-storage lookup mapping records
	of_RetrieveLookupMapping()
	w_import_progressbar.of_SkipNextPosition()
	
	// Process import data
	if of_DataProcess() = -1 then Return -1
	
	// Populate import data
	if of_DataPopulate() = -1 then Return -1
	
	// Update import data
	if of_DataUpdate() = -1 then Return -1
next

//Added By Jay Chen 01-07-2016 trigger workflow after import
ll_Row = ids_log_table.GetRow()
li_trigger_wf = ids_import_hdr.getitemnumber(ids_import_hdr.GetRow(), 'trigger_wf') //Added By Ken.Guo 2015-06-18
if li_trigger_wf = 1 then
	if not isvalid(lnv_workflow) then lnv_workflow = create n_cst_workflow_triggers
	lnv_workflow.of_set_wf_from('IMPORT') //Added By Ken.Guo 2015-06-18
	//trigger new contract workflow
	for ll_cnt = 1 to ids_add_ctx_id.rowcount()
		ll_ctx_id = ids_add_ctx_id.getitemnumber(ll_cnt,"ctx_id")
		Select category, status Into :ll_category, :ll_status_id From ctx_basic_info Where ctx_id = :ll_ctx_id ;
		//Added By Jay Chen 10-12-2015 only trigger once for the same new contract
		for ll_index = 1 to upperbound(il_wf_ctx_id)
			if il_wf_ctx_id[ll_index] = ll_ctx_id then
				lb_already_trigger = true
				exit
			end if
		next
		if lb_already_trigger then
			continue
		else
			il_wf_ctx_id[upperbound(il_wf_ctx_id) + 1] = ll_ctx_id
		end if
		//end
		If lnv_workflow.of_trigger_for_ctx( ll_ctx_id, ll_category , ll_status_id ) < 0 Then
			li_ret = -1
		End if
	next
	for ll_cnt = 1 to ids_add_ctx_id.rowcount()
		ll_ctx_id = ids_add_ctx_id.getitemnumber(ll_cnt,"ctx_id")
		ll_add_ctx_id[upperbound(ll_add_ctx_id) + 1] = ll_ctx_id
	next
	for ll_cnt = 1 to ids_mod_ctx_id.rowcount()
		ll_ctx_id = ids_mod_ctx_id.getitemnumber(ll_cnt,"ctx_id")
		ll_mod_ctx_id[upperbound(ll_mod_ctx_id) + 1] = ll_ctx_id
	next
	//trigger update contract compare workflow
	If lnv_workflow.of_trigger_compare_by_import(ll_add_ctx_id) < 0 Then
		li_ret = -1
	End If
	If lnv_workflow.of_trigger_compare_by_import(ll_mod_ctx_id) < 0 Then
		li_ret = -1
	End If
	If li_ret < 0 Then
		of_Log(0, "", IL_ERRTYPE_OTHER, 'Failed to trigger some WF. Please see the log for details. However, this doesn~'t affect the import of the data.')
	End If
end if
if isvalid(lnv_workflow) then destroy lnv_workflow
if isvalid(ids_add_ctx_id) then destroy ids_add_ctx_id
if isvalid(ids_mod_ctx_id) then destroy ids_mod_ctx_id
//end

//Added By Ken.Guo 01/23/2014
If ids_table_record.RowCount() = 0 or lb_error or ids_log_table.Find('error_count > 0',1,ids_log_table.RowCount()) > 0 Then
	Return -1
End If

Return 1 //Added By Ken.Guo 01/23/2014
end event

event ue_main(long al_import_id);integer i, ll_ret
string  ls_Error
boolean lb_DoProcess = true

////////////////////////////////[Import prepare]///////////////////////////////
// Set auto commit as false
is_OldAutoCommit = SQLCA.AutoCommit
of_SetAutoCommit(false)

// Create log records
ids_log_proc.InsertRow(0)
ids_log_proc.object.import_id[1] = al_import_id
ids_log_proc.object.pro_date[1] = DateTime(Today(), Now())
if ids_table_record.RowCount() > 0 then
	for i = 1 to ids_table_record.RowCount()
		ids_log_table.InsertRow(0)
		ids_log_table.object.table_records_id[i] = ids_table_record.object.table_records_id[i]
		ids_log_table.object.table_name_allias[i] = ids_table_record.object.table_name_allias[i]
		ids_log_table.object.error_count[i] = 0
		ids_log_table.object.error_count[i] = 0
		ids_log_table.object.mod_count[i] = 0
		ids_log_table.object.add_count[i] = 0
	next
end if

// Check import table
ls_Error = of_CheckImportTable(ids_table_record)
if Len(ls_Error) > 0 then
	lb_DoProcess = false
	of_Log(ls_Error)
end if

////////////////////////////////[Import Process]/////////////////////////////
// 1.Get import data
this.Event ue_GetImportData(al_import_id, lb_DoProcess)
w_import_progressbar.of_SkipNextStep()

// 2.Create compute fields
if lb_DoProcess then this.Event ue_CreateComputeField()
w_import_progressbar.of_SkipNextStep()

// 3.Format import data
if lb_DoProcess then this.Event ue_FormatData()
w_import_progressbar.of_SkipNextStep()

// 4.Import data into IntelliSoft table
if lb_DoProcess then 
	ll_ret = this.Event ue_ImportProcess(al_import_id)
	//Added By Ken.Guo 01/23/2014
	If ll_ret > 0 Then
		This.of_copy_import_file( al_import_id, True)
	Else
		This.of_copy_import_file( al_import_id, False)
	End If
	
End If
w_import_progressbar.of_SetImportProcessDesc("")
w_import_progressbar.of_SkipNextStep()

// 5.Generate error file
this.Event ue_GenerateErrorFile()
w_import_progressbar.of_SkipNextStep()

// 6.Send email
this.Event ue_SendEmail()
w_import_progressbar.of_SkipNextStep()

// 7.Save error file
this.Event ue_SaveErrorFile()
w_import_progressbar.of_SkipNextStep()

// 8.Update log
this.Event ue_UpdateLog()
w_import_progressbar.of_SkipNextStep()

////////////////////////////////[Import Complete]/////////////////////////////
this.Event ue_Complete()
of_SetAutoCommit(true)
end event

event ue_getimportdata(long al_import_id, ref boolean ab_doprocess);string ls_ErrorText

// Get import data
if ab_DoProcess then
	if ib_IsExecute1 then
		ls_ErrorText = of_GetImportData(al_import_id, ids_imp_data)
		if Len(ls_ErrorText) > 0 then
			of_Log(ls_ErrorText)
			ab_DoProcess = false
		end if
	end if
end if

// Log records count
ids_log_proc.object.rec_count[1] = ids_imp_data.RowCount()
if ids_imp_data.RowCount() <= 0 then ab_DoProcess = false
end event

event ue_createcomputefield();string  ls_Create
string  ls_Error
string  ls_comp_def
string  ls_imp_field_name
string  ls_Expression
string  ls_Char
integer li_Len
integer i, li_Pos

// Set process bar
w_import_progressbar.of_SetMaxPosition(ids_import_field.RowCount())

// Create compute field
for i = 1 to ids_import_field.RowCount()	
	ls_comp_def = Trim(ids_import_field.object.comp_def[i])	
	if Len(ls_comp_def) > 0 then						
		// Convert expression
		ls_Expression = ""
		li_Len = Len(ls_comp_def)
		for li_Pos = 1 to li_Len
			ls_Char = Mid(ls_comp_def, li_Pos, 1)
			if ls_Char = '"' then
				ls_Expression += '~~"'
			elseif ls_Char = '~~' then
				ls_Expression += '~~~~'
			else
				ls_Expression += ls_Char
			end if
		next
		
		// Create compute field
		ls_Expression = "String(" + ls_Expression + ")"
		ls_imp_field_name = Trim(ids_import_field.object.imp_field_name[i])
		ls_Create = 'create compute(band=detail alignment="0" expression="' + ls_Expression + '" border="0" color="0" x="100000" y="8" height="64" width="375" format="[GENERAL]" name=' + ls_imp_field_name + ' visible="1"  font.face="MS Sans Serif" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="553648127")'
		ls_Error = ids_imp_data.Modify(ls_Create)
		
		//ll_xPos = Long(ids_imp_data.Describe(ls_imp_field_name + ".x"))
		//ls_Create = 'create text(band=header alignment="2" text="' + ls_imp_field_name + '" border="0" color="33554432" x="' + String(ll_xPos) + '" y="8" height="52" width="375" name=' + ls_imp_field_name + '_t visible="1"  font.face="MS Sans Serif" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="536870912" )'
		//ids_imp_data.Modify(ls_Create)
	end if
	w_import_progressbar.of_SkipNextPosition()
next
end event

event ue_formatdata();long    ll_Row
integer li_Column
integer li_FieldCount
long    ll_RowCount
string  ls_imp_field_name
string  ls_field_format
string  ls_case_type
string  ls_strip_type
string  ls_comp_def
boolean lb_DoFormat1
boolean lb_DoFormat2
boolean lb_DoFormat3

// Set process bar
ll_RowCount = ids_imp_data.RowCount()
li_FieldCount = ids_import_field.RowCount()
w_import_progressbar.of_SetMaxPosition(li_FieldCount)

// Format import data
for li_Column = 1 to li_FieldCount
	w_import_progressbar.of_SkipNextPosition()
	
	// Continue if field is compute field
	ls_comp_def = Trim(ids_import_field.object.comp_def[li_Column])
	if Len(ls_comp_def) > 0 then Continue
	
	// Get format information
	ls_imp_field_name = Trim(ids_import_field.object.imp_field_name[li_Column])
	ls_field_format = Trim(ids_import_field.object.field_format[li_Column])
	ls_case_type = Trim(ids_import_field.object.case_type[li_Column])
	ls_strip_type = Trim(ids_import_field.object.strip_type[li_Column])
	
	lb_DoFormat1 = false
	lb_DoFormat2 = false
	lb_DoFormat3 = false
	if Len(ls_strip_type) > 0 then lb_DoFormat1 = true
	if Len(ls_case_type) > 0 then lb_DoFormat2 = true
	if Len(ls_field_format) > 0 then 
		lb_DoFormat3 = true		
		w_import_temp.of_SetMask(ls_field_format)
	end if
	
	// Format data
	if lb_DoFormat1 or lb_DoFormat2 or lb_DoFormat3 then
		for ll_Row = 1 to ll_RowCount
			if lb_DoFormat1 then
				of_FormatStrip(ll_Row, ls_imp_field_name, ls_strip_type)
			end if
			if lb_DoFormat2 then
				of_FormatCase(ll_Row, ls_imp_field_name, ls_case_type)
			end if
			if lb_DoFormat3 then
				of_FormatField(ll_Row, ls_imp_field_name, ls_field_format)
			end if
		next
	end if
next
end event

event ue_updatelog();long ll_Row
long ll_process_id
long i, ll_InsertRow

//Set process bar
w_import_progressbar.of_SetMaxPosition(2)
w_import_progressbar.of_SkipNextPosition()

//Update log
if ids_log_proc.Update() = 1 then
	ll_process_id = ids_log_proc.object.process_id[1]
	for i = 1 to ids_log_table.RowCount()
		ids_log_table.object.process_id[i] = ll_process_id
	next	
	if ids_log_table.Update() = 1 then
		for i = 1 to ids_log_error.RowCount()
			ll_Row = ids_log_error.object.process_tables_id[i]
			ids_log_error.object.process_tables_id[i] = ids_log_table.object.process_tables_id[ll_Row]
		next
		if ids_log_error.Update() = 1 then
			of_CompleteTrans(true)
		else
			of_CompleteTrans(false)
		end if
	else
		of_CompleteTrans(false)
	end if
else
	of_CompleteTrans(false)
end if

w_import_progressbar.of_SkipNextPosition()
end event

event ue_generateerrorfile();long i, j
string ls_Error
string ls_FileName
string ls_ImportDirectory
integer li_FileNum

// Get error file name
ls_ImportDirectory = of_GetImportDir()
ls_FileName = ls_ImportDirectory + "\" + IS_LOG_NAME

// Open file
FileDelete(ls_FileName)
if ids_log_error.RowCount() <= 0 then Return
li_FileNum = FileOpen(ls_FileName, LineMode!, Write!, LockWrite!, Replace!)
w_import_progressbar.of_SetMaxPosition(ids_log_table.RowCount())

// Write error file
for i = 1 to ids_log_table.RowCount()
	if i > 1 then FileWrite(li_FileNum, "~r~n")
	ls_Error = of_GenerateErrorTitle(ids_log_table, i)
	FileWrite(li_FileNum, ls_Error)
	FileWrite(li_FileNum, "-------------------------------------------------------------------------------------------------------------------------------------------------")
	FileWrite(li_FileNum, "Record Number  Import Field  Eror Type     Error Message")
	ids_log_error.of_Filter("process_tables_id=" + String(i))
	for j = 1 to ids_log_error.RowCount()
		ls_Error = of_GenerateErrorDetail(ids_log_error, j)
		FileWrite(li_FileNum, ls_Error)
	next
	FileWrite(li_FileNum, "-------------------------------------------------------------------------------------------------------------------------------------------------")
	w_import_progressbar.of_SkipNextPosition()
next
ids_log_error.of_Filter("")
FileClose(li_FileNum)
end event

event ue_sendemail();integer i
string  ls_SumTitle
string  ls_err_value
string  ls_FileName
string  ls_import_name
string  ls_notify_addr1
string  ls_notify_addr2
string  ls_MailTo
string  ls_MailCc
string  ls_MailBcc
string  ls_Message
string  ls_Subject
string  ls_Attachments
string  ls_Addresser
datetime ldt_pro_date
n_cst_easymail_smtp lnv_mail

//Set process bar
w_import_progressbar.of_SetMaxPosition(2)
w_import_progressbar.of_SkipNextPosition()

//Check whether send mail
if ids_import_hdr.object.err_notify[ids_import_hdr.GetRow()] = 0 then Return

//Set address
ls_notify_addr1 = Trim(ids_import_hdr.object.notify_addr1[ids_import_hdr.GetRow()])
ls_notify_addr2 = Trim(ids_import_hdr.object.notify_addr2[ids_import_hdr.GetRow()])
if Len(ls_notify_addr1) > 0 then
	ls_MailTo = ls_notify_addr1
end if
if Len(ls_notify_addr2) > 0 then
	if Len(ls_MailTo) > 0 then ls_MailTo += ";"
	ls_MailTo += ls_notify_addr2
end if
if Len(ls_MailTo) <= 0 then Return

//Set subject                                            
ls_import_name = Trim(ids_import_hdr.object.import_name[ids_import_hdr.GetRow()])
if IsNull(ls_import_name) then ls_import_name = "unknown"
ls_Subject = "Import notification for " + ls_import_name

//Set message and attachment
ldt_pro_date = ids_log_proc.object.pro_date[ids_log_proc.GetRow()]
ls_err_value = ids_log_proc.object.err_value[ids_import_hdr.GetRow()]
if Len(ls_err_value) > 0 then
	ls_Message = "The import '" + ls_import_name + "' ran on " + String(ldt_pro_date) + ". Import process is terminated, due to the following error:~r~n"
	ls_Message += ls_err_value	
else	
	if il_ErrorCount > 0 and ids_import_hdr.object.err_file[ids_import_hdr.GetRow()] = 1 then
		ls_Attachments = of_GetImportDir() + "\" + IS_LOG_NAME
		ls_Message = "Attached is an error file for import '" + ls_import_name + "' run on " + String(ldt_pro_date) + ". The following are summaries.~r~n~r~n"
	else
		ls_Message = "The import '" + ls_import_name + "' ran on " + String(ldt_pro_date) + ". The following are summaries.~r~n~r~n"
	end if
	for i = 1 to ids_log_table.RowCount()
		ls_SumTitle = "[Record id: " + String(ids_log_table.object.table_records_id[i]) + ", "
		ls_SumTitle += "Contractlogix Table: " + ids_log_table.object.table_name_allias[i] + "]"
		ls_Message += of_AddSpace(ls_SumTitle, 76) + "~r~n"
		ls_Message += "Runtime Error Count: " + String(ids_log_table.object.error_count[i]) + "~r~n"
		ls_Message += "Modify Record Count: " + String(ids_log_table.object.mod_count[i]) + "~r~n"
		ls_Message += "Add Record Count: " + String(ids_log_table.object.add_count[i]) + "~r~n~r~n"
	next
end if

//Added By Jay Chen 10-31-2013  
is_email_message = ls_Message
if upperbound(gl_mod_ctx_id) > 0 or upperbound(gl_add_ctx_id) > 0  then
	of_export_import_data_word()
end if

//Send email
if lnv_mail.of_CreateObject() = 1 then
	//START---Modify by Evan 2008-03-24 (Reasion:Send email with current user account)
	/*
	select top 1 set_addresser into :ls_Addresser from icred_settings;
	if IsNull(ls_Addresser) or Trim(ls_Addresser) = "" then
		ls_Addresser = "MASTER"
	end if
	lnv_mail.of_SendText(ls_Addresser, ls_MailTo, ls_MailCc, ls_MailBcc, ls_Subject, ls_Message, ls_Attachments)
	*/
//	lnv_mail.of_SendText(gs_user_id, ls_MailTo, ls_MailCc, ls_MailBcc, ls_Subject, ls_Message, ls_Attachments)
	 if ib_sendmail_new then   //Added By Jay Chen 10-31-2013
		if isvalid(w_email_edit.ole_word) then
			lnv_Mail.of_SendHtml(gs_user_id, ls_MailTo, ls_MailCc, ls_MailBcc,ls_Subject, w_email_edit.ole_word, ls_Attachments,false,0,0,0)
	     	w_email_edit.ole_word.of_close()
		else
			lnv_mail.of_SendText(gs_user_id, ls_MailTo, ls_MailCc, ls_MailBcc, ls_Subject, ls_Message, ls_Attachments)
		end if
	else
		lnv_mail.of_SendText(gs_user_id, ls_MailTo, ls_MailCc, ls_MailBcc, ls_Subject, ls_Message, ls_Attachments)
	end if
		
//END---Modify by Evan 2008-03-24
	//END---Modify by Evan 2008-03-24
	lnv_mail.of_DeleteObject()
end if
w_import_progressbar.of_SkipNextPosition()
end event

event ue_saveerrorfile();blob lblb_File
long ll_process_id
integer li_err_file
string  ls_FileName

//Set process bar
w_import_progressbar.of_SetMaxPosition(2)
w_import_progressbar.of_SkipNextPosition()

//Dispose error file according to err_file
li_err_file = ids_import_hdr.object.err_file[ids_import_hdr.GetRow()]
choose case li_err_file
	case 1 //Send with notification
	case 2 //Save file
		ll_process_id = ids_log_proc.object.process_id[ids_log_proc.GetRow()]
		ls_FileName = of_GetImportDir() + "\" + IS_LOG_NAME
		lblb_File = of_ReadFile(ls_FileName)
			
		UPDATEBLOB import_process SET process_file = :lblb_File WHERE process_id = :ll_process_id;
		if SQLCA.SQLCode = 0 then
			of_CompleteTrans(true)
		else
			of_CompleteTrans(false)
		end if
	case 3 //Delete
	case else
end choose
w_import_progressbar.of_SkipNextPosition()
end event

event ue_complete();integer i
string ls_NullArray[]

// Import information datastore reset
ids_import_hdr.Reset()
ids_table_record.Reset()
ids_import_field.Reset()
ids_mapping_field.Reset()
ids_lookup_mapping.Reset()
ids_dataview_screen.Reset()

// Error log datastore reset
ids_log_proc.Reset()
ids_log_table.Reset()
ids_log_error.Reset()

// Import data datastore reset
ids_imp_data.Reset()
ids_intellisoft_table.Reset()
ids_intellisoft_table_temp.Reset()
ids_newrow.Reset()

// Code lookup datastore reset
ids_address_lookup.Reset()
ids_code_lookup.Reset()
ids_facility.Reset()
ids_committee.Reset()
ids_company.Reset()
ids_coderownum1.Reset()
ids_coderownum2.Reset()
ids_security_role.Reset()
ids_category_right.Reset()

// Refresh global data if Code or Address lookup data have been changed
if ib_IsCodeLookupChanged then
	gnv_appeondb.of_StartQueue()
	gnv_data.of_Retrieve("code_lookup")
	gnv_data.of_Retrieve("code_lookup_2")
	gnv_appeondb.of_CommitQueue()
end if
for i = 1 to UpperBound(is_lookup_name)
	gnv_app.of_setcontraccache_code_lookup(is_lookup_name[i])
next
ib_IsCodeLookupChanged = false
is_lookup_name[] = ls_NullArray[]

// The import process complete
w_import_progressbar.of_SetComplete()
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

public function integer of_getfrmfieldvalue (string as_record, string as_delimiter, ref string as_value[]);long ll_Index
long ll_OldFieldPos
long ll_NewFieldPos
long ll_DelimiterLen
string ls_FieldValue
boolean lb_Exit = false

ll_OldFieldPos = 1
if Lower(as_Delimiter) = "enter" then
	as_Delimiter = "~r~n"
elseif Lower(as_Delimiter) = "tab" then
	as_Delimiter = "~t"
end if
ll_DelimiterLen = Len(as_Delimiter)

do
	ll_NewFieldPos = Pos(as_Record, as_Delimiter, ll_OldFieldPos)
	if ll_NewFieldPos > 0 then
		ls_FieldValue = Mid(as_Record, ll_OldFieldPos, ll_NewFieldPos - ll_OldFieldPos)
		ll_OldFieldPos = ll_NewFieldPos + ll_DelimiterLen
		ll_Index ++
		as_Value[ll_Index] = ls_FieldValue
	else
		ls_FieldValue = Right(as_Record, Len(as_Record) - ll_OldFieldPos + 1)
		if Len(ls_FieldValue) > 0 then
			ll_Index ++
			as_Value[ll_Index] = ls_FieldValue
		end if
		lb_Exit = true
	end if
loop until lb_Exit

Return ll_Index
end function

public function boolean of_iscontinue ();string ls_ErrorMessage

if ib_IsDoPrompt = false then Return true

if il_ErrorCount > IL_MAX_ERRORCOUNT then
	ib_IsDoPrompt = false
	ls_ErrorMessage = "Error count is over " + String(IL_MAX_ERRORCOUNT) + ". Do you want to continue?"
	if MessageBox("Prompt", ls_ErrorMessage, Question!, YesNo!) = 2 then Return false
end if

Return true
end function

public function integer of_formatcase (long al_row, string as_field, string as_casetype);string ls_Char
string ls_OldValue
string ls_NewValue
integer li_OldPos
integer li_NewPos
integer li_Len

ls_OldValue = ids_imp_data.GetItemString(al_Row, as_Field)
li_Len = Len(ls_OldValue)

if li_Len > 0 then
	choose case as_CaseType
		case "1" //Upper
			ls_NewValue = Upper(ls_OldValue)		
		case "2" //Lower
			ls_NewValue = Lower(ls_OldValue)		
		case "3" //First Upper
			if li_Len > 0 then
				ls_Char = Left(ls_OldValue, 1)
				ls_NewValue = Upper(ls_Char) + Right(ls_OldValue, li_Len - 1)
				li_OldPos = 1
				do
					li_NewPos = Pos(ls_NewValue, " ", li_OldPos + 1)
					if li_NewPos > 0 and li_NewPos + 1 <= li_Len then
						ls_Char = Mid(ls_NewValue, li_NewPos + 1, 1)
						ls_NewValue = Left(ls_NewValue, li_NewPos) + Lower(ls_Char) + Right(ls_NewValue, li_Len - li_NewPos - 1)
					end if
					li_OldPos = li_NewPos
				loop while li_NewPos > 0
			end if		
		case "4" //Initial Cap		
			if li_Len > 0 then
				ls_Char = Left(ls_OldValue, 1)
				ls_NewValue = Upper(ls_Char) + Right(ls_OldValue, li_Len - 1)
				li_OldPos = 1
				do
					li_NewPos = Pos(ls_NewValue, " ", li_OldPos + 1)
					if li_NewPos > 0 and li_NewPos + 1 <= li_Len then
						ls_Char = Mid(ls_NewValue, li_NewPos + 1, 1)
						ls_NewValue = Left(ls_NewValue, li_NewPos) + Upper(ls_Char) + Right(ls_NewValue, li_Len - li_NewPos - 1)
					end if
					li_OldPos = li_NewPos
				loop while li_NewPos > 0
			end if
		case else
			Return -1
	end choose
	ids_imp_data.SetItem(al_Row, as_Field, ls_NewValue)
end if

Return 1
end function

public function integer of_formatstrip (long al_row, string as_field, string as_striptype);string ls_Char
string ls_OldValue
string ls_NewValue
integer i, li_Len
string ls_Numeric = "0123456789"
string ls_Alpha = "qwertyuiopasdfghjklzxcvbnm"

ls_OldValue = ids_imp_data.GetItemString(al_Row, as_Field)
li_Len = Len(ls_OldValue)

if li_Len > 0 then
	choose case as_StripType
		case "1" //Alpha Only
			for i = 1 to li_Len
				ls_Char = Mid(ls_OldValue, i, 1)
				if Pos(ls_Alpha, Lower(ls_Char)) > 0 then
					ls_NewValue += ls_Char
				end if
			next
		case "2" //Numeric Only
			for i = 1 to li_Len
				ls_Char = Mid(ls_OldValue, i, 1)
				if Pos(ls_Numeric, ls_Char) > 0 then
					ls_NewValue += ls_Char
				end if
			next
		case else
			Return -1
	end choose
	ids_imp_data.SetItem(al_Row, as_Field, ls_NewValue)
end if

Return 1
end function

public function integer of_formatfield (long al_row, string as_field, string as_format);string ls_Char
string ls_OldValue
string ls_NewValue

ls_OldValue = ids_imp_data.GetItemString(al_Row, as_Field)

if Len(ls_OldValue) > 0 then	
	ls_NewValue = w_import_temp.of_Format(ls_OldValue)
	ids_imp_data.SetItem(al_Row, as_Field, ls_NewValue)
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

public function string of_getimportdir ();string ls_OldDirectory
string ls_ImportDirectory
string ls_ContractDirectory

ls_ContractDirectory = gs_dir_path + gs_DefDirName
ls_ImportDirectory = ls_ContractDirectory + "\Import"
ls_OldDirectory = GetCurrentDirectory()

if DirectoryExists(ls_ContractDirectory) = false then	
	ChangeDirectory(gs_dir_path)
	if CreateDirectory(gs_DefDirName) = -1 then Return ""
end if

if DirectoryExists(ls_ImportDirectory) = false then		
	ChangeDirectory(ls_ContractDirectory)
	if CreateDirectory("Import") = -1 then Return ""
end if

ChangeDirectory(ls_OldDirectory)

Return ls_ImportDirectory
end function

public function integer of_getimportinfo (long al_import_id, boolean ab_isimport);long ll_FindRow
long ll_RowCount
long i, j, ll_isoft_table_id
long ll_table_records_id[]

if not ab_IsImport then
	gnv_appeondb.of_StartQueue()
	ids_import_hdr.Retrieve(al_import_id)
	ids_import_field.Retrieve(al_import_id)
	gnv_appeondb.of_CommitQueue()
	Return 1
end if

///////////////////////////////////////////////////////////////////////////
//Cache data
gnv_appeondb.of_StartQueue()
//Retrieve import information
ids_import_hdr.Retrieve(al_import_id)
ids_table_record.Retrieve(al_import_id)
ids_import_field.Retrieve(al_import_id)
//Retrieve data view screen information
ids_dataview_screen.Retrieve(1)
//Retrieve security role
ids_security_role.Retrieve()
gnv_appeondb.of_CommitQueue()

//Retrieve data of ids_mapping_field
for i = 1 to ids_table_record.RowCount()
	ll_table_records_id[i] = ids_table_record.object.table_records_id[i]
next
ids_mapping_field.Retrieve(ll_table_records_id)

Return 1
end function

public function integer of_dyncreateimportdw (ref datastore ads_data);string  ls_Error
string  ls_Syntax
string  ls_comp_def
string  ls_imp_field_name
string  ls_Fields
string  ls_Name
string  ls_Style
string  ls_SQLSelect
long    ll_PosX
integer i, li_FieldCount

//Build select SQL for import datawindow
li_FieldCount = ids_import_field.RowCount()
if li_FieldCount <= 0 then Return -1
	
for i = 1 to li_FieldCount
	ls_comp_def = Trim(ids_import_field.object.comp_def[i])
	if Len(ls_comp_def) > 0  then Continue
	ls_imp_field_name = Trim(ids_import_field.object.imp_field_name[i])
	if Len(ls_Fields) > 0 then ls_Fields += ","
	ls_Fields += 'field_1 "' + ls_imp_field_name + '"'
next
if ls_Fields = "" then Return -1
//ls_SQLSelect = "SELECT " + ls_Fields + ",0 sys_pc_id, 0 sys_facility_id, 0 sys_contact_id FROM import_table_gen"//modify gavins 20130222
ls_SQLSelect = "SELECT " + ls_Fields + ",0 sys_pc_id, 0 sys_facility_id, 0 sys_contact_id, 0 sys_hdr_id,  '' as sys_user_id, 0 sys_doc_id FROM import_table_gen" 	//Added By Mark Lee 04/17/2014 add sys_user_id column   //Added by harry 2017-09-18 0 sys_doc_id

//openwithparm(w_sql_msg,ls_sqlselect )

//Dynamic create import datawindow
ls_Syntax = SQLCA.SyntaxFromSQL(ls_SQLSelect, "Style(Type=Grid)", ls_Error)
if Len(ls_Error) > 0 then
	messagebox("Error in of_dyncreateimportdw",ls_Error) //Start Code Change ----01.23.2008 #V8 maha - added for a useful error
	Return -1
end if
ads_data.Create(ls_Syntax, ls_Error)
if Len(ls_Error) > 0 then
	Return -1
end if
ads_data.Modify("sys_pc_id.visible=0")
ads_data.Modify("sys_facility_id.visible=0")
ads_data.Modify("sys_contact_id.visible=0")
ads_data.Modify("sys_hdr_id.visible=0")
ads_data.Modify("sys_user_id.visible=0")
ads_data.Modify("sys_doc_id.visible=0")  //Added by harry 2017-09-18
Return 1
end function

public function string of_getimportdata (long al_import_id, ref datastore ads_imp_data);string  ls_Error
string  ls_Syntax
blob    lblb_data
long    ll_NewFieldPos
long    ll_OldFieldPos
long    ll_OldDelimiterPos
long    ll_DelimiterLen
long    i, ll_Return
long    ll_FindRow
long    ll_InsertRow
long    ll_NewDelimiterPos
string  ls_Record
string  ls_FieldValue[]
string  ls_FormattedText
string  ls_imp_format
string  ls_odbc_name
string  ls_odbc_login
string  ls_odbc_password
string  ls_import_sql
string  ls_imp_file
long    ll_ignore_header_row
string  ls_record_delimiter
string  ls_field_delimiter
integer li_ColCount
integer li_FieldCount
DataStore lds_odbc_data
Transaction ltr_trans
boolean lb_Exit = false

//Set process bar
if IsValid(w_import_progressbar) then
	w_import_progressbar.of_SetMaxPosition(2)
end if

//Dynamic create import datawindow
ads_imp_data.Reset()
ls_Error = of_VerifyImportField(ids_import_field)
if Len(ls_Error) > 0 then
	Return "Failed to get import data. " + ls_Error
else
	if of_DynCreateImportDW(ads_imp_data) = -1 then
		Return "Failed to get import data. Dynamic create datawindow error."		
	end if
end if

//Get reference information of external data
ll_FindRow = ids_import_hdr.Find("import_id=" + String(al_import_id), 1, ids_import_hdr.RowCount())
if ll_FindRow <= 0 then Return "Failed to get import data. Can not locate import ID."
ls_imp_format = ids_import_hdr.object.imp_format[ll_FindRow]
ls_odbc_name = ids_import_hdr.object.odbc_name[ll_FindRow]
ls_odbc_login = ids_import_hdr.object.odbc_login[ll_FindRow]
ls_odbc_password = ids_import_hdr.object.odbc_password[ll_FindRow]
ls_import_sql = ids_import_hdr.object.import_sql[ll_FindRow]
if IsNull(ls_imp_format) then ls_imp_format = ""
if IsNull(ls_odbc_name) then ls_odbc_name = ""
if IsNull(ls_odbc_login) then ls_odbc_login = ""
if IsNull(ls_odbc_password) then ls_odbc_password = ""
if IsNull(ls_import_sql) then ls_import_sql = ""

ls_imp_file = ids_import_hdr.object.imp_file[ll_FindRow]
if IsNull(ls_imp_file) then ls_imp_file = ""
ll_ignore_header_row = ids_import_hdr.object.ignore_header_row[ll_FindRow]

ls_record_delimiter = ids_import_hdr.object.record_delimiter[ll_FindRow]
if IsNull(ls_record_delimiter) then ls_record_delimiter = ""
ls_field_delimiter = ids_import_hdr.object.field_delimiter[ll_FindRow]
if IsNull(ls_field_delimiter) then ls_field_delimiter = ""

//Get import data
choose case ls_imp_format
	case "1" //Tab Delimited
		if Len(ls_imp_file) <= 0 then Return "Failed to get import data. Import file name can not be null."
		if not FileExists(ls_imp_file) then Return "Failed to get import data. Import file not exists."
		if ll_ignore_header_row = 1 then 
			ll_Return = ads_imp_data.ImportFile(ls_imp_file, 2)
		else
			ll_Return = ads_imp_data.ImportFile(ls_imp_file, 1)
		end if
		if ll_Return = -4 then
			ads_imp_data.Reset()
			Return "Failed to get import data. Import value exceeds 8000 bytes."
		elseif ll_Return < 0 or IsNull(ll_Return) then
			ads_imp_data.Reset()
			Return "Failed to get import data."
		end if
		
	case "2" //CSV
		if AppeonGetClientType() <> "PB" then Return "Failed to get import data. The file type of CSV is unsupported on WEB."
		if Len(ls_imp_file) <= 0 then Return "Failed to get import data. Import file name can not be null."
		if not FileExists(ls_imp_file) then Return "Failed to get import data. Import file not exists."
		if ll_ignore_header_row = 1 then 
			ll_Return = ads_imp_data.ImportFile(CSV!, ls_imp_file, 2)
		else
			ll_Return = ads_imp_data.ImportFile(CSV!, ls_imp_file, 1)
		end if
		if ll_Return = -4 then
			ads_imp_data.Reset()
			Return "Failed to get import data. Import value exceeds 8000 bytes."
		elseif ll_Return < 0 or IsNull(ll_Return) then
			ads_imp_data.Reset()
			Return "Failed to get import data."
		end if
		
	case "3" //ODBC
		if ls_import_sql = "" then Return "Failed to get import data. Import SQL can not be null."
		if AppeonGetClientType() = "PB" then
			if ls_odbc_name = "" then Return "Failed to get import data. ODBC name can not be null."
			if ls_odbc_login = "" then Return "Failed to get import data. ODBC login can not be null."
		else
			if ls_odbc_name = "" then Return "Failed to get import data. Cache name can not be null."
		end if
		
		ltr_trans = Create Transaction
		if gs_dbtype = "ASA" then
			ltr_trans.DBMS = "ODB-ASA"
		else
			ltr_trans.DBMS = "ODB-MSS"
		end if
		ltr_trans.AutoCommit = False
		ltr_trans.DBParm = "ConnectString='DSN=" + ls_odbc_name + ";UID=" + ls_odbc_login + ";PWD=" + ls_odbc_password + "',CacheName='" + ls_odbc_name + "',ConnectOption='SQL_DRIVER_CONNECT,SQL_DRIVER_NOPROMPT',DelimitIdentifier='Yes'"
		Connect using ltr_trans;
		if ltr_trans.SQLCode <> 0 then
			Destroy ltr_trans
			Return "Failed to get import data. Can not connect to the database."
		end if
		
		ls_Syntax = ltr_trans.SyntaxFromSQL(ls_import_sql, "", ls_Error)
		if Len(ls_Error) > 0 then
			Destroy ltr_trans
			Return "Failed to get import data. Import SQL syntax is incorrect."
		end if
		lds_odbc_data = Create DataStore
		lds_odbc_data.Create(ls_Syntax, ls_Error)
		lds_odbc_data.SetTransObject(ltr_trans)
		if lds_odbc_data.Retrieve() > 0 then
			ll_Return = ads_imp_data.ImportString(lds_odbc_data.object.datawindow.data)
			if ll_Return = -4 then
				ads_imp_data.Reset()
				Return "Failed to get import data. Import value exceeds 100 bytes."
			elseif ll_Return < 0 or IsNull(ll_Return) then
				ads_imp_data.Reset()
				Return "Failed to get import data."
			end if		
		end if
		
		Disconnect using ltr_trans;
		Destroy ltr_trans
		Destroy lds_odbc_data	
		
	case "4" //Formatted text
		if Len(ls_imp_file) <= 0 then Return "Failed to get import data. Import file name can not be null."
		if not FileExists(ls_imp_file) then Return "Failed to get import data. Import file not exists."
		if Len(ls_record_delimiter) <= 0 then Return "Failed to get import data. Record delimiter can not be null."
		if Len(ls_field_delimiter) <= 0 then Return "Failed to get import data. Field delimiter can not be null."
		li_ColCount = Integer(ads_imp_data.object.datawindow.column.count)
		lblb_data = of_ReadFile(ls_imp_file)
		ls_FormattedText = String(lblb_data)		
		if Lower(ls_record_delimiter) = "enter" then
			ls_record_delimiter = "~r~n"
		elseif Lower(ls_record_delimiter) = "tab" then
			ls_record_delimiter = "~t"
		end if

		ll_DelimiterLen = Len(ls_record_delimiter)
		if ll_ignore_header_row = 1 then
			ll_OldDelimiterPos = Pos(ls_FormattedText, ls_record_delimiter)
			ll_OldDelimiterPos += ll_DelimiterLen
		else
			ll_OldDelimiterPos = 1
		end if
	
		do			
			ll_NewDelimiterPos = Pos(ls_FormattedText, ls_record_delimiter, ll_OldDelimiterPos)
			if ll_NewDelimiterPos > 0 then
				ls_Record = Mid(ls_FormattedText, ll_OldDelimiterPos, ll_NewDelimiterPos - ll_OldDelimiterPos)
				ll_OldDelimiterPos = ll_NewDelimiterPos + ll_DelimiterLen
				li_FieldCount = of_GetFrmFieldValue(ls_Record, ls_field_delimiter, ls_FieldValue)
				ll_InsertRow = ads_imp_data.InsertRow(0)
			else
				ls_Record = Right(ls_FormattedText, Len(ls_FormattedText) - ll_OldDelimiterPos + 1)
				if Len(ls_Record) > 0 then 
					li_FieldCount = of_GetFrmFieldValue(ls_Record, ls_field_delimiter, ls_FieldValue)
					ll_InsertRow = ads_imp_data.InsertRow(0)
				end if
				lb_Exit = true
			end if
			for i = 1 to li_ColCount
				if i <= li_FieldCount then
					ads_imp_data.object.data[ll_InsertRow, i] = ls_FieldValue[i]
				end if
			next
		loop until lb_Exit
		
	case else
		Return "Failed to get import data. Import format can not be null."
end choose
if IsValid(w_import_progressbar) then
	w_import_progressbar.of_SkipNextPosition()
end if

//Set default value of import data
of_SetDefaultValue(ads_imp_data)
if IsValid(w_import_progressbar) then
	w_import_progressbar.of_SkipNextPosition()
end if

Return ""
end function

public function string of_verifyimportfield (ref datastore ads_import_field);integer i, j, li_Len
integer li_FieldCount
integer li_CompColumnCount
integer li_last_field_order
integer li_com_order[]
string  ls_Char
string  ls_AlphaNumber = "qwertyuiopasdfghjklzxcvbnm0123456789_"
string  ls_comp_def
string  ls_imp_field_name
string  ls_last_field_name
string  ls_com_field[]

// There is no define import field
li_FieldCount = ads_import_field.RowCount()
if li_FieldCount <= 0 then Return "There is no defined import field."

// Check field name
for i = 1 to li_FieldCount
	ls_imp_field_name = Trim(ads_import_field.object.imp_field_name[i])
	choose case Lower(ls_imp_field_name)
		case "sys_pc_id", "sys_facility_id", "sys_contact_id", "sys_hdr_id"//added by gavins 20130225
			Return "Import field '" + ls_imp_field_name + "' is reserved field."
	end choose
	
	li_Len = Len(ls_imp_field_name)	
	if li_Len > 0 then	
		for j = 1 to li_Len
			ls_Char = Mid(ls_imp_field_name, j, 1)
			if Pos(ls_AlphaNumber, Lower(ls_Char)) <= 0 then
				Return "Import field name '" + ls_imp_field_name + "' is invalid.~r~nIt can only contains letters (without space), numbers, and underscores."
			end if
		next
	else
		Return "Import field can not be null."
	end if
	
	ls_comp_def = Trim(ads_import_field.object.comp_def[i])
	if Len(ls_comp_def) > 0  then
		li_CompColumnCount ++
		ls_com_field[li_CompColumnCount] = ls_imp_field_name
		li_com_order[li_CompColumnCount] = ads_import_field.object.field_order[i]		
	else
		ls_last_field_name = ls_imp_field_name
		li_last_field_order = ads_import_field.object.field_order[i]
	end if
next
if li_CompColumnCount = li_FieldCount then Return "Import fields must include at least one DB field."

// Check order of compute field
for i = 1 to li_CompColumnCount
	if li_com_order[i] < li_last_field_order then
		Return "The import field order of '" + ls_com_field[i] + "' must be more than '" + ls_last_field_name + "' field order."
	end if
next

Return ""
end function

public function integer of_setdefaultvalue (ref datastore ads_imp_data);string  ls_comp_def
string  ls_OldValue
string  ls_default_value
string  ls_imp_field_name
integer li_FieldCount
long    i, j, ll_RowCount

li_FieldCount = ids_import_field.RowCount()
if li_FieldCount <= 0 then Return -1
ll_RowCount = ads_imp_data.RowCount()
if ll_RowCount = 0 then Return 1

for i = 1 to li_FieldCount
	ls_comp_def = Trim(ids_import_field.object.comp_def[i])
	if Len(ls_comp_def) > 0  then Continue
	
	ls_default_value = Trim(ids_import_field.object.default_value[i])
	if Len(ls_default_value) > 0 then	
		ls_imp_field_name = Trim(ids_import_field.object.imp_field_name[i])
		for j = 1 to ll_RowCount
			ls_OldValue = ads_imp_data.GetItemString(j, ls_imp_field_name)
			if IsNull(ls_OldValue) or ls_OldValue = "" then
				ads_imp_data.SetItem(j, ls_imp_field_name, ls_default_value)
			end if
		next
	end if
next

Return 1
end function

public function integer of_execute (long al_import_id, ref datawindow adw_data);string ls_Error
string ls_Syntax

ib_IsDoPrompt = true
ib_IsExecute1 = false

//Get import information
of_GetImportInfo(al_import_id, true)

//Initialize progress bar
if IsValid(w_import_progressbar) then Close(w_import_progressbar)
Open(w_import_progressbar)
w_import_progressbar.of_ResetStep()
w_import_progressbar.of_SetImportID(al_import_id)
w_import_progressbar.of_SetTableCount(ids_table_record.RowCount())
w_import_progressbar.of_SetRemainCount(ids_table_record.RowCount())

//Get import data
w_import_progressbar.of_SetMaxPosition(2)
w_import_progressbar.of_SkipNextPosition()
if ids_table_record.RowCount() > 0 then
	ls_Syntax = adw_data.object.datawindow.syntax
	ids_imp_data.Create(ls_Syntax, ls_Error)
	adw_data.RowsCopy(1, adw_data.RowCount(), Primary!, ids_imp_data, 1, Primary!)
	w_import_progressbar.of_SetTableName(ids_table_record.object.table_name_allias[1])
end if
w_import_progressbar.of_SkipNextPosition()

//Execute Import data process
Open(w_import_temp)
this.Event ue_Main(al_import_id)

//Close temporary window
if IsValid(w_import_temp) then
	Close(w_import_temp)
end if

Return 1
end function

public function integer of_retrievelookupmapping ();long i, ll_ilm_id[]

ids_lookup_mapping.Reset()
for i = 1 to ids_mapping_field.RowCount()
	if not IsNull(ids_mapping_field.object.lu_template[i]) then
		ll_ilm_id[UpperBound(ll_ilm_id) + 1] = ids_mapping_field.object.lu_template[i]
	end if
next

if UpperBound(ll_ilm_id) > 0 then
	ids_lookup_mapping.Retrieve(ll_ilm_id[])
end if

Return 1
end function

public function integer of_dataprocess ();long     ll_facility_id
long     ll_lu_template
long     ll_ImportDataRow
long     ll_ImpRowCount
long     ll_MapFieldCount
integer  li_err_process
integer  li_MapFieldIndex
integer  li_no_match_procd
integer  li_field_len
integer  li_null_type
integer  li_Return
integer  li_id[]
string   ls_table_name
string   ls_imp_field_name
string   ls_lu_field_name
string   ls_lu_type
string   ls_lu_table
string   ls_field_type
string   ls_allow_null
string   ls_ImportValue
string   ls_CharValue
decimal  ldc_DecValue
datetime ldt_DTValue
boolean  lb_IsGetImpValue
boolean  lb_IsFacilityField
boolean  lb_IsLookupField
boolean	lb_IsLookupTemplate
string 	ls_id[], ls_arrvalue[],ls_arrempty[], ls_tmp, ls_output

// Set progress bar
ll_MapFieldCount = ids_mapping_field.RowCount()
w_import_progressbar.of_SetImportProcessDesc("Data process")
w_import_progressbar.of_SetMaxPosition(ll_MapFieldCount)
ll_ImpRowCount = ids_imp_data.RowCount()
if ll_ImpRowCount <= 0 then Return 1

// Get err_process and table_name
li_err_process = ids_import_hdr.object.err_process[ids_import_hdr.GetRow()]
ls_table_name = Lower(ids_table_record.object.table_name[ids_table_record.GetRow()])

// Insert null row to ids_intellisoft_table_temp
for ll_ImportDataRow = 1 to ll_ImpRowCount
	ids_intellisoft_table_temp.InsertRow(0)	
	ids_intellisoft_table_temp.SetItem(ll_ImportDataRow, "imp_row", ll_ImportDataRow)	
	// err_value 0: The row none error
	// err_value 1: The row have error, but can import value of none error field
	// err_value 2: The row have error, can not import this row
	ids_intellisoft_table_temp.SetItem(ll_ImportDataRow, "err_value", 0)
next

// Initialize value of foreign key
choose case ls_table_name
	case "pd_basic","ctx_basic_info"
		li_id[ll_ImpRowCount] = 0
		ids_imp_data.object.sys_pc_id[1, ll_ImpRowCount] = li_id[]
	case "app_facility"
		li_id[ll_ImpRowCount] = 0
		ids_imp_data.object.sys_facility_id[1, ll_ImpRowCount] = li_id[]
	case "security_users"					//Added By Mark Lee 04/17/2014
		ls_id[ll_ImpRowCount] = ""
		ids_imp_data.object.sys_user_id[1, ll_ImpRowCount] = ls_id[]
	case "ctx_contacts" //Child table of app_facility
		li_id[ll_ImpRowCount] = 0
		ids_imp_data.object.sys_contact_id[1, ll_ImpRowCount] = li_id[]
		ids_intellisoft_table_temp.object.sys_facility_id[1, ll_ImpRowCount] = ids_imp_data.object.sys_facility_id[1, ll_ImpRowCount]
		//Added By Mark Lee 04/17/2014
		ids_intellisoft_table_temp.object.sys_user_id[1, ll_ImpRowCount] = ids_imp_data.object.sys_user_id[1, ll_ImpRowCount]
	case "ctx_contacts_numbers"  //Child table of ctx_contacts
		ids_intellisoft_table_temp.object.sys_contact_id[1, ll_ImpRowCount] = ids_imp_data.object.sys_contact_id[1, ll_ImpRowCount]
	case "ctx_contract_contacts" //Child table of ctx_contacts and ctx_basic_info
		ids_intellisoft_table_temp.object.sys_contact_id[1, ll_ImpRowCount] = ids_imp_data.object.sys_contact_id[1, ll_ImpRowCount]
		ids_intellisoft_table_temp.object.sys_pc_id[1, ll_ImpRowCount] = ids_imp_data.object.sys_pc_id[1, ll_ImpRowCount]
	case "ctx_custom_multi_hdr"//added by gavins 20130225
		ids_intellisoft_table_temp.object.sys_pc_id[1, ll_ImpRowCount] = ids_imp_data.object.sys_pc_id[1, ll_ImpRowCount]	
	case "ctx_custom_multi_detail"//added by gavins 20130225
		ids_intellisoft_table_temp.object.sys_hdr_id[1, ll_ImpRowCount] = ids_imp_data.object.sys_hdr_id[1, ll_ImpRowCount]
		ids_intellisoft_table_temp.object.sys_pc_id[1, ll_ImpRowCount] = ids_imp_data.object.sys_pc_id[1, ll_ImpRowCount]
	case "idp_users"	//Added By Mark Lee 04/22/2014
		ids_intellisoft_table_temp.object.sys_user_id[1, ll_ImpRowCount] = ids_imp_data.object.sys_user_id[1, ll_ImpRowCount]
	case "ctx_am_document"  //Added By Harry 2017-09-18
		ids_intellisoft_table_temp.object.sys_pc_id[1, ll_ImpRowCount] = ids_imp_data.object.sys_pc_id[1, ll_ImpRowCount]
	case else                    //Child table of pd_basic and ctx_basic_info
		ids_intellisoft_table_temp.object.sys_pc_id[1, ll_ImpRowCount] = ids_imp_data.object.sys_pc_id[1, ll_ImpRowCount]
end choose
	
// Dispose each column data of IntelliSoft table
for li_MapFieldIndex = 1 to ll_MapFieldCount
	// Get field information
	ll_facility_id = ids_mapping_field.GetItemNumber(li_MapFieldIndex, "facility_id")
	ls_imp_field_name = Trim(ids_mapping_field.GetItemString(li_MapFieldIndex, "imp_field_name"))
	ll_lu_template = ids_mapping_field.GetItemNumber(li_MapFieldIndex, "lu_template")
	li_no_match_procd = ids_mapping_field.GetItemNumber(li_MapFieldIndex, "no_match_procd")
	ls_lu_type = ids_mapping_field.GetItemString(li_MapFieldIndex, "lu_type")
	ls_lu_table = ids_mapping_field.GetItemString(li_MapFieldIndex, "lu_table")
	ls_lu_field_name = ids_mapping_field.GetItemString(li_MapFieldIndex, "lu_field_name")
	ls_field_type = ids_mapping_field.GetItemString(li_MapFieldIndex, "field_type")
	li_field_len = ids_mapping_field.GetItemNumber(li_MapFieldIndex, "field_len")
	li_null_type = ids_mapping_field.GetItemNumber(li_MapFieldIndex, "null_type")	
	ls_allow_null = ids_mapping_field.GetItemString(li_MapFieldIndex, "allow_null")
	lb_IsGetImpValue = false
	lb_IsFacilityField = false
	lb_IsLookupTemplate = false
	lb_IsLookupField = false
	if Len(ls_imp_field_name) > 0 then lb_IsGetImpValue = true
	if not IsNull(ll_facility_id) then lb_IsFacilityField = true
	if not IsNull(ll_lu_template) then lb_IsLookupTemplate = true
	if Len(ls_lu_field_name) > 0 then lb_IsLookupField = true
	
	// Filter lookup mapping and retrieve lookup data
	of_RetrieveLookupData(ll_lu_template, ls_lu_type, ls_lu_table)
	
	// Import each import value
	ids_coderownum1.Reset()
	ids_coderownum2.Reset()
	ls_arrvalue = ls_arrempty			//Added By Mark Lee 04/21/2014
	for ll_ImportDataRow = 1 to ll_ImpRowCount
		// Get import value and dispose null value
		if ids_intellisoft_table_temp.GetItemNumber(ll_ImportDataRow, "err_value") = 2 then Continue
		if lb_IsGetImpValue then
			ls_ImportValue = ids_imp_data.GetItemString(ll_ImportDataRow, ls_imp_field_name)
			of_DisposeNullValue(li_null_type, ll_ImportDataRow, li_MapFieldIndex, ls_ImportValue)
			ls_ImportValue = Trim(ls_ImportValue)
			ls_arrvalue[upperbound(ls_arrvalue) + 1 ] = ls_ImportValue		//Added By Mark Lee 04/21/2014
		end if

		// Parse import value
		if lb_IsFacilityField then
			if ls_field_type = "I" or ls_field_type = "N" then
				ids_intellisoft_table_temp.SetItem(ll_ImportDataRow, li_MapFieldIndex, ll_facility_id)
			else
				of_Log(ll_ImportDataRow, ls_imp_field_name, IL_ERRTYPE_VERIFYVALUE, "Facility_id field must be the type of number.")
				if not of_IsContinue() then Return -1
				ids_intellisoft_table_temp.SetItem(ll_ImportDataRow, "err_value", 1)
				Continue
			end if
			
		elseif lb_IsLookupTemplate then
			// Dispose lookup code according to lu_template
			li_Return = of_DisposeLookupCode(ll_ImportDataRow, li_MapFieldIndex, ls_ImportValue, ls_field_type, li_no_match_procd)
			if li_Return = -1 then
				of_Log(ll_ImportDataRow, ls_imp_field_name, IL_ERRTYPE_MAPDESIGN, "When 'No match Procd'='Error', it's not allowed to add new lookup code to template.")
			elseif li_Return = -2 then
				of_Log(ll_ImportDataRow, ls_imp_field_name, IL_ERRTYPE_DATAINTEGRITY, "'" + ls_ImportValue + "' matches no Facility_id in template.")
			end if
			if li_Return < 0 then
				if not of_IsContinue() then Return -1				
				ids_intellisoft_table_temp.SetItem(ll_ImportDataRow, "err_value", 1)
				Continue
			end if
			
		elseif lb_IsLookupField then
			// Dispose lookup code according to lu_field_name
			li_Return = of_DisposeLookupCode(ll_ImportDataRow, li_MapFieldIndex, ls_ImportValue, ls_field_type, li_no_match_procd, ls_lu_type, ls_lu_table, ls_lu_field_name)
			if li_Return = -1 then
				of_Log(ll_ImportDataRow, ls_imp_field_name, IL_ERRTYPE_MAPDESIGN, "When 'No match Procd'='Error', it's not allowed to add new lookup code to lookup table.")
			elseif li_Return = -2 then
				of_Log(ll_ImportDataRow, ls_imp_field_name, IL_ERRTYPE_DATAINTEGRITY, "'" + ls_ImportValue + "' matches no Facility_id in lookup table.")
			elseif li_Return = -3 then//added by gavins 20130524
				of_Log(ll_ImportDataRow, ls_imp_field_name, IL_ERRTYPE_DATAINTEGRITY, "'" + ls_ImportValue + "' does not match any value in company table.")
			end if
			if li_Return < 0 then
				if not of_IsContinue() then Return -1
				if li_Return = -3 then
					ids_intellisoft_table_temp.SetItem(ll_ImportDataRow, "err_value", 2)
				Else
					ids_intellisoft_table_temp.SetItem(ll_ImportDataRow, "err_value", 1)
				End If
				Continue
			end if
			
		else			
			// Verify external data according to field type and field length
			li_Return = of_DisposeVerifyValue(ls_ImportValue, ls_field_type, li_field_len, ls_CharValue, ldc_DecValue, ldt_DTValue)
			if li_Return = -1 then
				if ls_field_type = "D" then
					of_Log(ll_ImportDataRow, ls_imp_field_name, IL_ERRTYPE_VERIFYVALUE, "Can not convert '" + ls_ImportValue + "' to the type of datetime.")
				else
					of_Log(ll_ImportDataRow, ls_imp_field_name, IL_ERRTYPE_VERIFYVALUE, "Can not convert '" + ls_ImportValue + "' to the type of number.")
				end if
			elseif li_Return = -2 then
				of_Log(ll_ImportDataRow, ls_imp_field_name, IL_ERRTYPE_VERIFYVALUE, "'" + ls_ImportValue + "' exceeds the length of field.")
			end if
						
			// Move import value to ids_intellisoft_table_TEMP
			if li_Return = 1 then				
				choose case ls_field_type
					case "C"
						ids_intellisoft_table_temp.SetItem(ll_ImportDataRow, li_MapFieldIndex, ls_CharValue)
					case "I", "N"
						ids_intellisoft_table_temp.SetItem(ll_ImportDataRow, li_MapFieldIndex, ldc_DecValue)
					case "D"
						ids_intellisoft_table_temp.SetItem(ll_ImportDataRow, li_MapFieldIndex, ldt_DTValue)
				end choose
			else
				if not of_IsContinue() then Return -1
				ids_intellisoft_table_temp.SetItem(ll_ImportDataRow, "err_value", 1)
			end if
		end if
		
		// Check import value if null
		if ls_allow_null = "N" then
			if IsNull(ids_intellisoft_table_temp.object.data[ll_ImportDataRow, li_MapFieldIndex]) then
				if not ((lb_IsLookupTemplate or lb_IsLookupField) and li_no_match_procd = 1) then
					of_Log(ll_ImportDataRow, ls_imp_field_name, IL_ERRTYPE_DATAINTEGRITY, "Import value can not be null.")
					if not of_IsContinue() then Return -1
					ids_intellisoft_table_temp.SetItem(ll_ImportDataRow, "err_value", 2)
					Continue
				end if
			end if
		end if
	next

	//check value if exists in the database.			//Added By Mark Lee 04/21/2014
	if UpperBound(ls_arrvalue) > 0 then 
		ls_tmp = of_existscheckedvalue(ls_table_name,ls_imp_field_name,ls_arrvalue,ls_field_type,ls_output)
		if len(ls_tmp) > 0 then 
			of_Log(ll_ImportDataRow, ls_imp_field_name, IL_ERRTYPE_VERIFYVALUE, "The column "+ls_imp_field_name+" ('" + ls_tmp + "') does not exist in the "+ls_output+" table so you cannot import it in the "+ls_imp_field_name+" column in the "+ls_table_name+" table.")
			Return -1
		end if
	end if 
	
	// Update lookup table if have new records
	if lb_IsLookupTemplate then
		of_UpdateLookupTable(1, li_MapFieldIndex, ls_field_type)
	elseif lb_IsLookupField then
		of_UpdateLookupTable(2, li_MapFieldIndex, ls_field_type)
	end if
	w_import_progressbar.of_SkipNextPosition()
next

// Determine which data row if can be importing
if of_IsStopImport() then Return -1
if ids_log_table.object.error_count[ids_log_table.GetRow()] > 0 then
	if li_err_process = 2 then
		ids_intellisoft_table_temp.of_Filter("err_value = 0")
	else
		ids_intellisoft_table_temp.of_Filter("err_value <> 2")
	end if
	ids_intellisoft_table_temp.RowsDiscard(1, ids_intellisoft_table_temp.FilteredCount(), Filter!)
end if

Return 1
end function

public function integer of_retrievelookupdata (long al_lu_template, string as_lu_type, string as_lu_table);string ls_Filter
string ls_LookupType

// Filter lookup mapping
if not IsNull(al_lu_template) then
	ids_lookup_mapping.of_Filter("ilm_id = " + String(al_lu_template))
	ls_Filter = "lookup_name = '" + ids_lookup_mapping.object.lookup_table[1] + "'"
	ls_LookupType = ids_lookup_mapping.object.map_type[1]
elseif Len(as_lu_table) > 0 then
	ls_Filter = "lookup_name = '" + as_lu_table + "'"
	ls_LookupType = as_lu_type
else
	Return 1
end if

// Retrieve lookup data
choose case ls_LookupType
	case "A" //Address
		if ids_address_lookup.RowCount() + ids_address_lookup.FilteredCount() <= 0 then
			ids_address_lookup.Retrieve()
		end if
		ids_address_lookup.SetFilter(ls_Filter)
		ids_address_lookup.Filter()
		
	case "C" //Code
		if ids_code_lookup.RowCount() + ids_code_lookup.FilteredCount() <= 0 then
			ids_code_lookup.Retrieve()
		end if
		ids_code_lookup.SetFilter(ls_Filter)
		ids_code_lookup.Filter()
		
	case "F" //Facility
		if ids_facility.RowCount() <= 0 then ids_facility.Retrieve()
		
	case "M" //Committee
		if ids_committee.RowCount() <= 0 then ids_committee.Retrieve()
		
	case "I" //Company
		if ids_company.RowCount() <= 0 then ids_company.Retrieve()
end choose

Return 1
end function

public function integer of_disposeverifyvalue (string as_importvalue, string as_field_type, integer ai_field_len, ref string as_charvalue, ref decimal adc_decvalue, ref datetime adt_dtvalue);string  ls_Date
string  ls_Time
integer li_Pos

// Set null
if IsNull(as_ImportValue) or as_ImportValue = "" then
	SetNull(as_CharValue)
	SetNull(adc_DecValue)
	SetNull(adt_DTValue)
	Return 1
end if

// Conver data type
choose case as_field_type
	case "D"
		li_Pos = Pos(as_ImportValue, " ")
		if li_Pos > 0 then
			ls_Date = Left(as_ImportValue, li_Pos - 1)
			ls_Time = Right(as_ImportValue, Len(as_ImportValue) - li_Pos)
			if IsDate(ls_Date) and IsTime(ls_Time) then
				adt_DTValue = DateTime(Date(ls_Date), Time(ls_Time))
				Return 1 // Not need to check length if type is datetime
			else
				Return -1
			end if
		else
			if IsDate(as_ImportValue) then
				adt_DTValue = DateTime(Date(as_ImportValue), 00:00:00)
				Return 1 // Not need to check length if type is datetime
			else
				Return -1
			end if
		end if
		
	case "I", "N"
		if IsNumber(as_ImportValue) then
			adc_DecValue = Dec(as_ImportValue)
			Return 1 // Not need to check length if type is number
		else
			Return -1
		end if

	case "C"
		as_CharValue = as_ImportValue
		
	case else
		Return -1
end choose

// Check field length
if Len(as_ImportValue) > ai_field_len then Return -2

Return 1
end function

public function integer of_dataupdate ();long ll_Row
long ll_Count
integer li_Return
//n_cst_workflow_triggers lnv_workflow
long ll_cnt,ll_ctx_id,ll_status_id,ll_category
Integer li_trigger_wf, li_ret
long ll_index,ll_find,ll_insertrow
boolean lb_already_trigger

///////////////////////////////[1-Stop Import data]//////////////////////////////////////
if of_IsStopImport() then Return -1

///////////////////////////////[2-Prepare update]//////////////////////////////////////
li_Return = of_PreUpdate()
if li_Return = -1 then
	ids_intellisoft_table.Reset()
	Return -1
elseif li_Return = -2 then
	ids_intellisoft_table.Reset()	
	if of_IsStopImport() then Return -1
end if

///////////////////////////////[3-Update import table]/////////////////////////////////
w_import_progressbar.of_SetImportProcessDesc("Update ContractLogix table")
w_import_progressbar.of_SetMaxPosition(2)
w_import_progressbar.of_SkipNextPosition()
ll_Row = ids_log_table.GetRow()

li_trigger_wf = ids_import_hdr.getitemnumber(ids_import_hdr.GetRow(), 'trigger_wf') //Added By Ken.Guo 2015-06-18

if ids_intellisoft_table.ModifiedCount() > 0 then
	if ids_intellisoft_table.Update(true, false) = 1 then
		of_CompleteTrans(true)		
		ll_Count = ids_log_table.object.add_count[ll_Row] + il_CurrTableAddCount
		ids_log_table.object.add_count[ll_Row] = ll_Count
		ll_Count = ids_log_table.object.mod_count[ll_Row] + il_CurrTableModifyCount
		ids_log_table.object.mod_count[ll_Row] = ll_Count
		//Added By Jay Chen 04-20-2015 trigger workflow when run import painter as add new contract.
		if upperbound(gl_add_ctx_id) > 0 or upperbound(gl_mod_ctx_id) > 0 then
			if li_trigger_wf = 1 then
				for ll_cnt = 1 to upperbound(gl_add_ctx_id)
					ll_ctx_id = gl_add_ctx_id[ll_cnt]
					ll_find = ids_add_ctx_id.find("ctx_id = " + string(ll_ctx_id) ,1,ids_add_ctx_id.rowcount())
					if isnull(ll_find) then ll_find = 0
					if ll_find = 0 then
						ll_insertrow = ids_add_ctx_id.insertrow(0)
						ids_add_ctx_id.setitem(ll_insertrow,"ctx_id",ll_ctx_id)
					end if
				next
				for ll_cnt = 1 to upperbound(gl_mod_ctx_id)
					ll_ctx_id = gl_mod_ctx_id[ll_cnt]
					ll_find = ids_mod_ctx_id.find("ctx_id = " + string(ll_ctx_id) , 1,ids_mod_ctx_id.rowcount())
					if isnull(ll_find) then ll_find = 0
					if ll_find = 0 then
						ll_insertrow = ids_mod_ctx_id.insertrow(0)
						ids_mod_ctx_id.setitem(ll_insertrow,"ctx_id",ll_ctx_id)
					end if
				next
			end if
		end if
		//end
	else
		//Added By Ken.Guo 08/15/2013
		gnv_debug.of_output(True,'DB Update Error')
		gnv_debug.of_output(True,'Rowcount() = ' + String(ids_intellisoft_table.RowCount()))
		gnv_debug.of_output(True, 'ids_intellisoft_table.Describe("DataWindow.Syntax") =' + ids_intellisoft_table.Describe("DataWindow.Syntax") )

		of_CompleteTrans(false)
		ids_intellisoft_table.Reset()
		of_Log(0, "", IL_ERRTYPE_UPDATE, ids_intellisoft_table.is_SQLErrText)
		if not of_IsContinue() then Return -1
		Return 1
	end if
else
	//Added by Harry 2017-09-12
	if il_CurrTableAddCount > 0 then
		ll_Count = ids_log_table.object.add_count[ll_Row] + il_CurrTableAddCount
		ids_log_table.object.add_count[ll_Row] = ll_Count
	end if
		
	ll_Count = ids_log_table.object.mod_count[ll_Row] + il_CurrTableModifyCount
	ids_log_table.object.mod_count[ll_Row] = ll_Count
	//Added By Jay Chen 04-20-2015 
	if upperbound(gl_mod_ctx_id) > 0 then
		If li_trigger_wf = 1 Then //Modified By Ken.Guo 2015-06-18
			for ll_cnt = 1 to upperbound(gl_mod_ctx_id)
				ll_ctx_id = gl_mod_ctx_id[ll_cnt]
				ll_find = ids_mod_ctx_id.find("ctx_id = " + string(ll_ctx_id) , 1,ids_mod_ctx_id.rowcount())
				if isnull(ll_find) then ll_find = 0
				if ll_find = 0 then
					ll_insertrow = ids_mod_ctx_id.insertrow(0)
					ids_mod_ctx_id.setitem(ll_insertrow,"ctx_id",ll_ctx_id)
				end if
			next	
		end if
	end if
	//end
end if
w_import_progressbar.of_SkipNextPosition()

///////////////////////////////[4-Post update]//////////////////////////////////////
of_PostUpdate()

Return 1
end function

public function integer of_datapopulate ();Return 1
end function

public function integer of_dyncreateistabledw (string as_table_name);Return 1
end function

public function integer of_postupdate ();Return 1
end function

public function integer of_preupdate ();Return 1
end function

public function integer of_setsequenceno (ref datastore ads_sequence, ref datastore ads_intellisoft_table, long al_addcount, string as_filterfield, string as_updatefield, boolean ab_flag);long i, j, ll_Row
long ll_max_seq_no
long ll_FilterID
string ls_Filter

for i = 1 to al_AddCount
	if ab_Flag then
		ll_Row = ids_newrow.GetItemNumber(i, "new_row")
	else
		ll_Row = ads_intellisoft_table.RowCount() - al_AddCount + i
	end if
	ll_FilterID = ads_intellisoft_table.GetItemNumber(ll_Row, as_FilterField)
	if as_FilterField = "ctx_id" then
		ls_Filter = "prac_id=" + String(ll_FilterID)
	else
		ls_Filter = as_FilterField + "=" + String(ll_FilterID)
	end if
	ads_sequence.SetFilter(ls_Filter)
	ads_sequence.Filter()
	
	if ads_sequence.RowCount() > 0 then
		ads_sequence.SetSort("seq_no A")
		ads_sequence.Sort()
		ll_max_seq_no = ads_sequence.object.seq_no[ads_sequence.RowCount()]
		if IsNull(ll_max_seq_no) then 
			ll_max_seq_no = 1
		else
			ll_max_seq_no ++
		end if
		for j = 1 to ads_sequence.RowCount()			
			ll_Row = ads_sequence.object.row_num[j]
			if ll_Row > 0 then
				ads_intellisoft_table.SetItem(ll_Row, as_UpdateField, ll_max_seq_no)				
				ll_max_seq_no ++
			end if
		next
		ads_sequence.RowsMove(1, ads_sequence.RowCount(), Primary!, ads_sequence, 1, Delete!)
	end if
next

Return 1
end function

public function integer of_checkmapping (boolean ab_isimport, long al_table_id, string as_table_name, ref datastore ads_import_field, ref datastore ads_mapping_field, ref string as_errortext[]);Return 1
end function

public function integer of_setautocommit (boolean ab_isauto);if ab_IsAuto = false then
	if SQLCA.AutoCommit = true then SQLCA.AutoCommit = false		
else
	if is_OldAutoCommit = true then
		if SQLCA.AutoCommit = false then SQLCA.AutoCommit = true
	end if
end if

Return 1
end function

public function string of_reviseexpvalue (string as_value);
Return of_reviseexpvalue( as_value, true )

//integer li_Len
//integer li_NewStart
//integer li_OldStart = 1
//string  ls_NewValue
//
//do while true
//	li_NewStart = Pos(as_Value, "'", li_OldStart)
//	if li_NewStart > 0 then		
//		ls_NewValue += Mid(as_Value, li_OldStart, li_NewStart - li_OldStart) + "~~'"
//		li_OldStart = li_NewStart + 1
//	else
//		li_Len = Len(as_Value) - li_OldStart + 1
//		if li_Len > 0 then
//			ls_NewValue += Right(as_Value, li_Len)
//		end if		
//		Exit
//	end if
//loop
//
//Return Lower(ls_NewValue)
end function

public function integer of_addcontractcategoryright (long al_category);long ll_RoleId
long ll_Cycle
long ll_Count
long ll_InsertRow

for ll_Cycle = 1 to ids_security_role.RowCount()
	ll_RoleId = ids_security_role.GetItemNumber(ll_Cycle, "role_id")
	
	ll_InsertRow = ids_category_right.InsertRow(0)
	ids_category_right.SetItem(ll_InsertRow, "role_id", ll_RoleId)
	ids_category_right.SetItem(ll_InsertRow, "category", al_Category)
	ids_category_right.SetItem(ll_InsertRow, "types", 1)
	ids_category_right.SetItem(ll_InsertRow, "rights", "11")
	
	ll_InsertRow = ids_category_right.InsertRow(0)
	ids_category_right.SetItem(ll_InsertRow, "role_id", ll_RoleId)
	ids_category_right.SetItem(ll_InsertRow, "category", al_Category)
	ids_category_right.SetItem(ll_InsertRow, "types", 3)
	ids_category_right.SetItem(ll_InsertRow, "rights", "31")
	
	ll_InsertRow = ids_category_right.InsertRow(0)
	ids_category_right.SetItem(ll_InsertRow, "role_id", ll_RoleId)
	ids_category_right.SetItem(ll_InsertRow, "category", al_Category)
	ids_category_right.SetItem(ll_InsertRow, "types", 4)
	ids_category_right.SetItem(ll_InsertRow, "rights", "41")
next

Return 1
end function

public function integer of_disposelookupcode (long al_importdatarow, integer ai_mapfieldindex, string as_importvalue, string as_field_type, integer ai_no_match_procd, string as_lu_type, string as_lu_table, string as_lu_field_name);long ll_FindRow
long ll_RowCount
long ll_InsertRow
long ll_CodeTableRow
long ll_lookup_code
string ls_Find

//Check import value if null
as_ImportValue = Trim(as_ImportValue)
if IsNull(as_ImportValue) or as_ImportValue = "" then Return 1

//Lookup code from specify lookup table
choose case as_lu_type
	case "A" //Address
		if as_lu_field_name = "code" then
			ls_Find = "Lower(code) = '" + of_ReviseExpValue(as_ImportValue) + "'"
		else
			ls_Find = "Lower(entity_name) = '" + of_ReviseExpValue(as_ImportValue) + "'"	
		end if
		ll_FindRow = ids_address_lookup.Find(ls_Find, 1, ids_address_lookup.RowCount())
		if ll_FindRow > 0 then
			ll_lookup_code = ids_address_lookup.object.lookup_code[ll_FindRow]
			of_ResetCodeValue(al_ImportDataRow, ai_MapFieldIndex, as_field_type, ll_lookup_code)
		else
			if ai_no_match_procd = 1 then
				//Insert a new record to lookup table
				ll_CodeTableRow = ids_address_lookup.InsertRow(0)
				ids_address_lookup.object.lookup_name[ll_CodeTableRow] = as_lu_table
				ids_address_lookup.object.code[ll_CodeTableRow] = Left(as_ImportValue, 15)
				ids_address_lookup.object.entity_name[ll_CodeTableRow] = Left(as_ImportValue, 100)
				
				//Record the row number
				ll_InsertRow = ids_coderownum1.InsertRow(0)
				ids_coderownum1.object.codetable_rownum[ll_InsertRow] = ll_CodeTableRow
				ids_coderownum1.object.impdata_rownum[ll_InsertRow] = al_ImportDataRow
			else
				Return -1 //User specify not allow add new lookup code
			end if
		end if
		
	case "C" //Code
		if as_lu_field_name = "code" then
			ls_Find = "Lower(code) = '" + of_ReviseExpValue(as_ImportValue) + "'"
		else
			ls_Find = "Lower(description) = '" + of_ReviseExpValue(as_ImportValue) + "'"			
		end if
		ll_FindRow = ids_code_lookup.Find(ls_Find, 1, ids_code_lookup.RowCount())
		if ll_FindRow > 0 then
			ll_lookup_code = ids_code_lookup.object.lookup_code[ll_FindRow]
			of_ResetCodeValue(al_ImportDataRow, ai_MapFieldIndex, as_field_type, ll_lookup_code)
		else
			if ai_no_match_procd = 1 then
				//Insert a new record to lookup table
				ll_CodeTableRow = ids_code_lookup.InsertRow(0)
				ids_code_lookup.object.lookup_name[ll_CodeTableRow] = as_lu_table
				ids_code_lookup.object.code[ll_CodeTableRow] = Left(as_ImportValue, 30)
				ids_code_lookup.object.description[ll_CodeTableRow] = Left(as_ImportValue, 75)
				
				//Record the row number
				ll_InsertRow = ids_coderownum1.InsertRow(0)
				ids_coderownum1.object.codetable_rownum[ll_InsertRow] = ll_CodeTableRow
				ids_coderownum1.object.impdata_rownum[ll_InsertRow] = al_ImportDataRow
			else
				Return -1 //User specify not allow add new lookup code
			end if
		end if

	case "F" //Facility
		ls_Find = "Lower(facility_name) = '" + of_ReviseExpValue(as_ImportValue) + "'"
		ll_FindRow = ids_facility.Find(ls_Find, 1, ids_facility.RowCount())
		if ll_FindRow > 0 then
			ll_lookup_code = ids_facility.object.facility_id[ll_FindRow]
			of_ResetCodeValue(al_ImportDataRow, ai_MapFieldIndex, as_field_type, ll_lookup_code)
			Return 1
		else
			Return -2 //There is no match Facility_id
		end if
		
	case "M" //Committee
		ls_Find = "Lower(committee_name) = '" + of_ReviseExpValue(as_ImportValue) + "'"
		ll_FindRow = ids_committee.Find(ls_Find, 1, ids_committee.RowCount())
		if ll_FindRow > 0 then
			ll_lookup_code = ids_committee.object.committee_id[ll_FindRow]
			of_ResetCodeValue(al_ImportDataRow, ai_MapFieldIndex, as_field_type, ll_lookup_code)
		else
			if ai_no_match_procd = 1 then
				//Insert a new record to lookup table
				ll_CodeTableRow = ids_committee.InsertRow(0)
				ids_committee.object.committee_name[ll_CodeTableRow] = Left(as_ImportValue, 50)
				ids_committee.object.facility_id[ll_CodeTableRow] = 1
				
				//Record the row number
				ll_InsertRow = ids_coderownum1.InsertRow(0)
				ids_coderownum1.object.codetable_rownum[ll_InsertRow] = ll_CodeTableRow
				ids_coderownum1.object.impdata_rownum[ll_InsertRow] = al_ImportDataRow
			else
				Return -1 //User specify not allow add new lookup code
			end if
		end if
		
	case "I" //Company
		//
		Choose Case Lower(as_lu_field_name)
			Case 'facility_name'	
				ls_Find = "Lower(facility_name) = '" + of_ReviseExpValue(as_ImportValue) + "'"
				ll_FindRow = ids_company.Find(ls_Find, 1, ids_company.RowCount())
				if ll_FindRow > 0 then
					ll_lookup_code = ids_company.object.facility_id[ll_FindRow]
					of_ResetCodeValue(al_ImportDataRow, ai_MapFieldIndex, as_field_type, ll_lookup_code)
				else
					if ai_no_match_procd = 1 then
						//Insert a new record to lookup table
						ll_CodeTableRow = ids_company.InsertRow(0)
						ids_company.object.facility_name[ll_CodeTableRow] = Left(as_ImportValue, 150)
						ids_company.object.contact_type2[ll_CodeTableRow] = "B"
						ids_company.object.corp_office_flag[ll_CodeTableRow] = 0
						
						//Record the row number
						ll_InsertRow = ids_coderownum1.InsertRow(0)
						ids_coderownum1.object.codetable_rownum[ll_InsertRow] = ll_CodeTableRow
						ids_coderownum1.object.impdata_rownum[ll_InsertRow] = al_ImportDataRow
					else
						Return -1 //User specify not allow add new lookup code
					end if
				end if
			Case 'street', 'phone', 'ext', 'contact', 'web_address', 'email_address', 'fax'
				ls_Find = Lower(as_lu_field_name) + " = '" + of_ReviseExpValue(as_ImportValue, false) + "'"
				ll_FindRow = ids_company.Find(ls_Find, 1, ids_company.RowCount())
				if ll_FindRow > 0 then
					ll_lookup_code = ids_company.object.facility_id[ll_FindRow]
					of_ResetCodeValue(al_ImportDataRow, ai_MapFieldIndex, as_field_type, ll_lookup_code)
				Else
					Return -3
				End If
				
		End Choose
end choose

//Record the row number
if ll_FindRow > 0 and IsNull(ll_lookup_code) then
	ll_InsertRow = ids_coderownum2.InsertRow(0)
	ids_coderownum2.object.codetable_rownum[ll_InsertRow] = ll_FindRow
	ids_coderownum2.object.impdata_rownum[ll_InsertRow] = al_ImportDataRow
end if

Return 1
end function

public function integer of_resetcodevalue (long al_row, integer ai_column, string as_field_type, long al_lookup_code);if not IsNull(al_lookup_code) then
	if as_field_type = "N" then
		ids_intellisoft_table_temp.SetItem(al_Row, ai_Column, al_lookup_code)
	else
		ids_intellisoft_table_temp.SetItem(al_Row, ai_Column, String(al_lookup_code))
	end if
end if

Return 1
end function

public function integer of_updatelookuptable (integer ai_islookupfield, integer ai_mapfieldindex, string as_field_type);long i, ll_Row
long ll_RowCount
long ll_lookup_code
string ls_lu_type
string ls_lu_table

////////////////////////////////////////////////////////////////////////////////////////////
// Get lookup type
if ai_IsLookupField = 1 then
	ls_lu_type = ids_lookup_mapping.object.map_type[1]
	ls_lu_table = ids_lookup_mapping.object.lookup_table[1]
else
	ls_lu_type = ids_mapping_field.object.lu_type[ai_MapFieldIndex]
	ls_lu_table = ids_mapping_field.object.lu_table[ai_MapFieldIndex]
end if

////////////////////////////////////////////////////////////////////////////////////////////
// Set lookup code of lookup table,lookup template,import record according to ids_coderownum1
ll_RowCount = ids_coderownum1.RowCount()
if ll_RowCount > 0 then
	choose case ls_lu_type
		case "A" //Address
			ll_lookup_code = gnv_app.of_get_id("LOOKUP", ll_RowCount)
			for i = 1 to ll_RowCount
				ll_Row = ids_coderownum1.object.codetable_rownum[i]
				ids_address_lookup.object.lookup_code[ll_Row] = ll_lookup_code			
				ll_Row = ids_coderownum1.object.impdata_rownum[i]
				of_ResetCodeValue(ll_Row, ai_MapFieldIndex, as_field_type, ll_lookup_code)
				if ai_IsLookupField = 1 then
					ll_Row = ids_coderownum1.object.template_rownum[i]
					ids_lookup_mapping.object.is_lu_code[ll_Row] = ll_lookup_code
				end if
				ll_lookup_code ++			
			next
			
		case "C" //Code
			ll_lookup_code = gnv_app.of_get_id("LOOKUP", ll_RowCount)
			for i = 1 to ll_RowCount
				ll_Row = ids_coderownum1.object.codetable_rownum[i]
				ids_code_lookup.object.lookup_code[ll_Row] = ll_lookup_code						
				ll_Row = ids_coderownum1.object.impdata_rownum[i]
				of_ResetCodeValue(ll_Row, ai_MapFieldIndex, as_field_type, ll_lookup_code)
				if ai_IsLookupField = 1 then
					ll_Row = ids_coderownum1.object.template_rownum[i]
					ids_lookup_mapping.object.is_lu_code[ll_Row] = ll_lookup_code
				end if
				if ls_lu_table = "Contract Category" then
					of_AddContractCategoryRight(ll_lookup_code)
				end if
				ll_lookup_code ++
			next
			
		case "F" //Facility
			ll_lookup_code = gnv_app.of_get_id("facility_id", ll_RowCount)
			for i = 1 to ll_RowCount			
				ll_Row = ids_coderownum1.object.codetable_rownum[i]
				ids_facility.object.facility_id[ll_Row] = ll_lookup_code			
				ll_Row = ids_coderownum1.object.impdata_rownum[i]
				of_ResetCodeValue(ll_Row, ai_MapFieldIndex, as_field_type, ll_lookup_code)			
				if ai_IsLookupField = 1 then
					ll_Row = ids_coderownum1.object.template_rownum[i]
					ids_lookup_mapping.object.is_lu_code[ll_Row] = ll_lookup_code
				end if			
				ll_lookup_code ++
			next
			
		case "M" //Committee
			ll_lookup_code = gnv_app.of_get_id("committee_id", ll_RowCount)
			for i = 1 to ll_RowCount
				ll_Row = ids_coderownum1.object.codetable_rownum[i]
				ids_committee.object.committee_id[ll_Row] = ll_lookup_code		
				ll_Row = ids_coderownum1.object.impdata_rownum[i]
				of_ResetCodeValue(ll_Row, ai_MapFieldIndex, as_field_type, ll_lookup_code)			
				if ai_IsLookupField = 1 then
					ll_Row = ids_coderownum1.object.template_rownum[i]
					ids_lookup_mapping.object.is_lu_code[ll_Row] = ll_lookup_code
				end if
				ll_lookup_code ++
			next
			
		case "I" //Company
			SELECT max(facility_id) INTO :ll_lookup_code FROM app_facility;
			if IsNull(ll_lookup_code) then ll_lookup_code = 0			
			for i = 1 to ll_RowCount
				ll_lookup_code ++
				ll_Row = ids_coderownum1.object.codetable_rownum[i]
				ids_company.object.facility_id[ll_Row] = ll_lookup_code
				ll_Row = ids_coderownum1.object.impdata_rownum[i]
				of_ResetCodeValue(ll_Row, ai_MapFieldIndex, as_field_type, ll_lookup_code)			
				if ai_IsLookupField = 1 then
					ll_Row = ids_coderownum1.object.template_rownum[i]
					ids_lookup_mapping.object.is_lu_code[ll_Row] = ll_lookup_code
				end if
			next
	end choose
	ids_coderownum1.Reset()
end if

////////////////////////////////////////////////////////////////////////////////////////////
// Set lookup code of import record according to ids_coderownum2
ll_RowCount = ids_coderownum2.RowCount()
if ll_RowCount > 0 then
	if ai_IsLookupField = 1 then
		for i = 1 to ll_RowCount
			ll_Row = ids_coderownum2.object.template_rownum[i]
			ll_lookup_code = ids_lookup_mapping.object.is_lu_code[ll_Row]
			ll_Row = ids_coderownum2.object.impdata_rownum[i]
			of_ResetCodeValue(ll_Row, ai_MapFieldIndex, as_field_type, ll_lookup_code)
		next
	else
		for i = 1 to ll_RowCount
			ll_Row = ids_coderownum2.object.codetable_rownum[i]
			choose case ls_lu_type
				case "A" //Address
					ll_lookup_code = ids_address_lookup.object.lookup_code[ll_Row]								
				case "C" //Code
					ll_lookup_code = ids_code_lookup.object.lookup_code[ll_Row]								
				case "F" //Facility
					ll_lookup_code = ids_facility.object.facility_id[ll_Row]
				case "M" //Committee
					ll_lookup_code = ids_committee.object.committee_id[ll_Row]
				case "I" //Company
					ll_lookup_code = ids_company.object.facility_id[ll_Row]
			end choose
			ll_Row = ids_coderownum2.object.impdata_rownum[i]
			of_ResetCodeValue(ll_Row, ai_MapFieldIndex, as_field_type, ll_lookup_code)
		next
	end if
	ids_coderownum2.Reset()
end if

////////////////////////////////////////////////////////////////////////////////////////////
// if Code or Address Lookup data have been changed
if ids_code_lookup.ModifiedCount() > 0 then
	ib_IsCodeLookupChanged = true
	is_lookup_name[upperbound(is_lookup_name) + 1] = ls_lu_table
end if
if ids_address_lookup.ModifiedCount() > 0 then
	is_lookup_name[upperbound(is_lookup_name) + 1] = ls_lu_table
end if

// Update
gnv_appeondb.of_StartQueue()
choose case ls_lu_type
	case "A" //Address
		ids_address_lookup.Update()
	case "C" //Code
		ids_code_lookup.Update()
	case "F" //Facility
		ids_facility.Update()
	case "M" //Committee
		ids_committee.Update()
	case "I" //Company
		ids_company.Update()
end choose
ids_lookup_mapping.Update()
ids_category_right.Update()
of_CompleteTrans(true)
gnv_appeondb.of_CommitQueue()

Return 1
end function

public function integer of_disposelookupcode (long al_importdatarow, integer ai_mapfieldindex, string as_importvalue, string as_field_type, integer ai_no_match_procd);long ll_RowCount
long ll_FindRow
long ll_InsertRow
long ll_CodeTableRow
long ll_TempRow
long ll_lookup_code

//Check import value if null
as_ImportValue = Trim(as_ImportValue)
if IsNull(as_ImportValue) or as_ImportValue = "" then Return 1

//Lookup code from template
ll_RowCount = ids_lookup_mapping.RowCount()
ll_FindRow = ids_lookup_mapping.Find("Lower(import_value) = '" + of_ReviseExpValue(as_ImportValue) + "'", 1, ll_RowCount)
if ll_FindRow > 0 then
	//Have match code
	ll_lookup_code = ids_lookup_mapping.object.is_lu_code[ll_FindRow]
	if IsNull(ll_lookup_code) then
		//Record the row number
		ll_InsertRow = ids_coderownum2.InsertRow(0)
		ids_coderownum2.object.template_rownum[ll_InsertRow] = ll_FindRow
		ids_coderownum2.object.impdata_rownum[ll_InsertRow] = al_ImportDataRow
	else
		//Set lookup code
		of_ResetCodeValue(al_ImportDataRow, ai_MapFieldIndex, as_field_type, ll_lookup_code)
	end if
else
	//No match code
	if ai_no_match_procd = 1 then
		//Insert a new record to lookup table
		choose case ids_lookup_mapping.object.map_type[1]
			case "A" //Address
				ll_FindRow = ids_address_lookup.Find("Lower(entity_name) = '" + of_ReviseExpValue(as_ImportValue) + "'", 1, ids_address_lookup.RowCount())
				if ll_FindRow > 0 then
					ll_lookup_code = ids_address_lookup.object.lookup_code[ll_FindRow]
				else
					ll_CodeTableRow = ids_address_lookup.InsertRow(0)			
					ids_address_lookup.object.lookup_name[ll_CodeTableRow] = ids_lookup_mapping.object.lookup_table[1]
					ids_address_lookup.object.code[ll_CodeTableRow] = Left(as_ImportValue, 15)
					ids_address_lookup.object.entity_name[ll_CodeTableRow] = Left(as_ImportValue, 100)
				end if
				
			case "C" //Code				
				ll_FindRow = ids_code_lookup.Find("Lower(description) = '" + of_ReviseExpValue(as_ImportValue) + "'", 1, ids_code_lookup.RowCount())
				if ll_FindRow > 0 then
					ll_lookup_code = ids_code_lookup.object.lookup_code[ll_FindRow]					
				else
					ll_CodeTableRow = ids_code_lookup.InsertRow(0)
					ids_code_lookup.object.lookup_name[ll_CodeTableRow] = ids_lookup_mapping.object.lookup_table[1]
					ids_code_lookup.object.code[ll_CodeTableRow] = Left(as_ImportValue, 30)
					ids_code_lookup.object.description[ll_CodeTableRow] = Left(as_ImportValue, 75)
				end if
								
			case "F" //Facility
				ll_FindRow = ids_facility.Find("Lower(facility_name) = '" + of_ReviseExpValue(as_ImportValue) + "'", 1, ids_facility.RowCount())
				if ll_FindRow > 0 then
					ll_lookup_code = ids_facility.object.facility_id[ll_FindRow]
				else
					Return -2 //There is no match Facility_id
				end if	
								
			case "M" //Committee
				ll_FindRow = ids_committee.Find("Lower(committee_name) = '" + of_ReviseExpValue(as_ImportValue) + "'", 1, ids_committee.RowCount())
				if ll_FindRow > 0 then
					ll_lookup_code = ids_committee.object.committee_id[ll_FindRow]
				else
					ll_CodeTableRow = ids_committee.InsertRow(0)
					ids_committee.object.committee_name[ll_CodeTableRow] = Left(as_ImportValue, 50)
					ids_committee.object.facility_id[ll_CodeTableRow] = 1
				end if
				
			case "I" //Company
				ll_FindRow = ids_company.Find("Lower(facility_name) = '" + of_ReviseExpValue(as_ImportValue) + "'", 1, ids_company.RowCount())
				if ll_FindRow > 0 then
					ll_lookup_code = ids_company.object.facility_id[ll_FindRow]
				else
					ll_CodeTableRow = ids_company.InsertRow(0)
					ids_company.object.facility_name[ll_CodeTableRow] = Left(as_ImportValue, 150)
					ids_company.object.contact_type2[ll_CodeTableRow] = "B"
					ids_company.object.corp_office_flag[ll_CodeTableRow] = 0
				end if
		end choose
	
		//Insert a new record to template
		ll_TempRow = ids_lookup_mapping.InsertRow(0)
		ids_lookup_mapping.object.ilm_id[ll_TempRow] = ids_lookup_mapping.object.ilm_id[1]
		ids_lookup_mapping.object.import_value[ll_TempRow] = as_ImportValue
		
		//Set lookup code if found it
		if ll_FindRow > 0 then
			//Set lookup code
			ids_lookup_mapping.object.is_lu_code[ll_TempRow] = ll_lookup_code
			of_ResetCodeValue(al_ImportDataRow, ai_MapFieldIndex, as_field_type, ll_lookup_code)
		else
			//Record the row number
			ll_InsertRow = ids_coderownum1.InsertRow(0)
			ids_coderownum1.object.template_rownum[ll_InsertRow] = ll_TempRow
			ids_coderownum1.object.codetable_rownum[ll_InsertRow] = ll_CodeTableRow
			ids_coderownum1.object.impdata_rownum[ll_InsertRow] = al_ImportDataRow
		end if
	else
		Return -1 //User specify not allow add new lookup code
	end if
end if

Return 1
end function

public function integer of_disposenullvalue (integer ai_null_type, long al_importdatarow, integer ai_mapfieldindex, ref string as_importvalue);string ls_link_imp_field

//Check value of import if null
if not (IsNull(as_ImportValue) or as_ImportValue = "") then 
	Return 1
end if

//Dispose null value
choose case ai_null_type
	//case 1 //Set null
	
	case 2   //Use text default
		as_ImportValue = ids_mapping_field.object.null_value[ai_MapFieldIndex]
		
	case 3   //Use column value
		ls_link_imp_field = ids_mapping_field.object.link_imp_field[ai_MapFieldIndex]
		if Len(ls_link_imp_field) > 0 then
			as_ImportValue = ids_imp_data.GetItemString(al_ImportDataRow, ls_link_imp_field)
		end if
end choose

Return 1
end function

public function string of_convertfieldalias (string as_string);string  ls_Char
string  ls_Return
integer i, li_Len

as_String = Lower(Trim(as_String))
li_Len = Len(as_String)

for i = 1 to li_Len
	ls_Char = Mid(as_String, i, 1)
	if ls_Char = "_" then ls_Char = " "
	if Mid(as_String, i - 1, 1) = "_" then	ls_Char = Upper(ls_Char)
	ls_Return += ls_Char
next
ls_Return = Trim(ls_Return)
ls_Return = Upper(Left(ls_Return, 1)) + Right(ls_Return, Len(ls_Return) - 1)

Return ls_Return
end function

public function integer of_run_project (integer ai_project, string as_from);//--------------------------- APPEON BEGIN ---------------------------
//$<delete> 03.10.2008 By: Evan
//$<reason> Due to have no consider Contract Logix import, so that delete this function.
/*
//Start Code Change ----12.14.2007 #V8 maha -- created
//used to run a series of imports connected to a project
integer li_imp_cnt
integer i
integer ic
integer res
long ll_imp
datastore lds_imps

lds_imps  = create datastore

lds_imps.dataobject = "d_import_ds_project"
lds_imps.settransobject(sqlca)
ic = lds_imps.retrieve(ai_project)

if ic < 1 then return -1 //no imports

for i = 1 to ic
	ll_imp = lds_imps.getitemnumber(i,"import_id")
	//this.Event ue_ExecuteImport1(ll_imp,adw_imp) //Delete by evan on 12.17.2007
	this.of_Execute(ll_imp, false) //Add by evan on 02.18.2008
	//if res > 0 then li_imp_cnt++
next
if IsValid(w_import_progressbar) then Close(w_import_progressbar) //Add by evan on 02.18.2008

destroy lds_imps

return li_imp_cnt
*/

Return -1
//---------------------------- APPEON END ----------------------------

end function

public function integer of_execute (long al_import_id, boolean ab_isdoprompt);ib_IsDoPrompt = ab_IsDoPrompt
ib_IsExecute1 = true

//Get import information
of_GetImportInfo(al_import_id, true)

//Initialize progress bar
if IsValid(w_import_progressbar) then Close(w_import_progressbar)
Open(w_import_progressbar)
w_import_progressbar.of_ResetStep()
w_import_progressbar.of_SetImportID(al_import_id)
w_import_progressbar.of_SetTableCount(ids_table_record.RowCount())
w_import_progressbar.of_SetRemainCount(ids_table_record.RowCount())
if ids_table_record.RowCount() > 0 then
	w_import_progressbar.of_SetTableName(ids_table_record.object.table_name_allias[1])
end if

//Execute Import data process
Open(w_import_temp)
this.Event ue_Main(al_import_id)

//Close temporary window
if IsValid(w_import_temp) then 
	Close(w_import_temp)
end if

Return 1
end function

public function integer of_getkeyfields (ref integer as_keyfieldindex[], ref string as_keyfieldname[]);integer li_MapFieldIndex

// Get key fields
for li_MapFieldIndex = 1 to ids_mapping_field.RowCount()
	if ids_mapping_field.object.key_field[li_MapFieldIndex] = 1 then
		as_KeyFieldIndex[UpperBound(as_KeyFieldIndex) + 1] = li_MapFieldIndex
		as_KeyFieldName[UpperBound(as_KeyFieldName) + 1] = ids_mapping_field.object.field_name[li_MapFieldIndex]
	end if
next

Return UpperBound(as_KeyFieldIndex)
end function

public function integer of_log (string as_text);string ls_err_value

ls_err_value = ids_log_proc.object.err_value[1]
if Len(ls_err_value) > 0 then
	ids_log_proc.object.err_value[1] = ls_err_value + " " + as_Text
else
	ids_log_proc.object.err_value[1] = as_Text
end if

Return 1
end function

public function long of_log (long al_error_record, string as_error_field, long al_err_type, string as_err_value);long ll_Row
long ll_InsertRow
long ll_error_count

//Increase error count
ll_Row = ids_log_table.GetRow()
ll_error_count = ids_log_table.object.error_count[ll_Row]
if IsNull(ll_error_count) then ll_error_count = 0
ll_error_count ++
ids_log_table.object.error_count[ll_Row] = ll_error_count
il_ErrorCount ++

//Insert error log
ll_InsertRow = ids_log_error.InsertRow(0)
ids_log_error.object.process_tables_id[ll_InsertRow] = ids_table_record.GetRow()

ids_log_error.object.error_field[ll_InsertRow] = as_error_field
ids_log_error.object.err_type[ll_InsertRow] = al_err_type
ids_log_error.object.err_value[ll_InsertRow] = Left(as_err_value, 300)
if al_error_record > 0 then
	ids_log_error.object.error_record[ll_InsertRow] = al_error_record
end if

choose case al_err_type
	case IL_ERRTYPE_OTHER
		ids_log_error.object.err_type_text[ll_InsertRow] = "Other"
	case IL_ERRTYPE_MAPDESIGN
		ids_log_error.object.err_type_text[ll_InsertRow] = "Design"
	case IL_ERRTYPE_VERIFYVALUE
		ids_log_error.object.err_type_text[ll_InsertRow] = "Verify value"
	case IL_ERRTYPE_DATAINTEGRITY
		ids_log_error.object.err_type_text[ll_InsertRow] = "Data integrity"
	case IL_ERRTYPE_ADDVERIFY
		ids_log_error.object.err_type_text[ll_InsertRow] = "Verification"
	case IL_ERRTYPE_UPDATE
		ids_log_error.object.err_type_text[ll_InsertRow] = "DB Update"
end choose

//Return error count
Return ll_error_count
end function

public function integer of_log (boolean ab_isimport, string as_text, ref string as_errortext[]);integer li_ErrorCount

li_ErrorCount = UpperBound(as_ErrorText) + 1
as_ErrorText[li_ErrorCount] = as_Text

if ab_IsImport then
	of_Log(0, "", IL_ERRTYPE_MAPDESIGN, as_Text)
	if not of_IsContinue() then Return -1
	Return -2
end if

Return 1
end function

public function integer of_resetfieldtype ();string ls_field_type
integer li_MapFieldIndex

for li_MapFieldIndex = 1 to ids_mapping_field.RowCount()
	//Get field type	
	ls_field_type = ids_intellisoft_table_temp.of_GetColType("#" + String(li_MapFieldIndex))
		
	//Reset field type for ids_mapping_field
	ids_mapping_field.object.field_type[li_MapFieldIndex] = ls_field_type
next

Return 1
end function

public function string of_checkimporttable (ref datastore ads_data);integer i
string  ls_table_name
boolean lb_IsNeedBasicTable = false
boolean lb_IsBasicTableExists = false
boolean lb_IsNeedCompanyTable = false
boolean lb_IsCompanyTableExists = false
boolean lb_IsNeedContactTable = false
boolean lb_IsContactTableExists = false
boolean lb_IsMultiHeader = false //added by gavins 20130222
boolean lb_IsMultiDetails = false
boolean lb_IsSecurityUsers = false	//Added By Mark Lee 04/22/2014
boolean lb_IsNeedSecurityUsers = false

if ads_data.RowCount() <= 0 then Return "There is no import table record."

for i = 1 to ads_data.RowCount()
	ls_table_name = Lower(ads_data.object.table_name[i])
	
	// if need company table
	if ls_table_name = "ctx_contacts" then lb_IsNeedCompanyTable = true
	if ls_table_name = "app_facility" then lb_IsCompanyTableExists = true
	
	// if need contact table																					
	if ls_table_name = "ctx_contacts_numbers" or ls_table_name = "ctx_contract_contacts" then lb_IsNeedContactTable = true//
	if ls_table_name = "ctx_contacts" then lb_IsContactTableExists = true
	
	//if need multi header
	If ls_table_name = "ctx_custom_multi_hdr" Then lb_IsMultiHeader = True
	If ls_table_name = "ctx_custom_multi_detail" Then lb_IsMultiDetails = True
	
	//if need contact table	//Added By Mark Lee 04/16/2014
	If ls_table_name = "security_users" Then 
		lb_IsNeedContactTable = True	
		lb_IsSecurityUsers = True	
	End If
	
	//if need security_users table
	If ls_table_name = "idp_users" Then lb_IsNeedSecurityUsers = True
	
	// if need basic table
	choose case ls_table_name
		Case "pd_basic", "ctx_basic_info", "app_facility", "ctx_contacts", "ctx_contacts_numbers", "security_users", "idp_users"
			
		case else
			lb_IsNeedBasicTable = true
	end choose
	if ls_table_name = "pd_basic" or ls_table_name = "ctx_basic_info" then
		lb_IsBasicTableExists = true
	end if	
next

// Do some checking
if lb_IsNeedCompanyTable and not lb_IsCompanyTableExists then Return "'Companies' table is required."
if lb_IsNeedContactTable and not lb_IsContactTableExists then Return "'Contacts' table is required."
if lb_IsNeedBasicTable and not lb_IsBasicTableExists then Return "'Basic Information' table is required."
if lb_IsMultiDetails and not lb_IsMultiHeader then Return "'Custom Multi Header' table is required."
if lb_IsNeedSecurityUsers and not lb_IsSecurityUsers then Return "'Security Users' table is required."

Return ""
end function

public function string of_generateerrortitle (ref datastore ads_data, long al_row);string ls_Return

ls_Return = "[Record id: " + String(ads_data.object.table_records_id[al_row]) + ", "
ls_Return += "ContractLogix Table: " + ads_data.object.table_name_allias[al_row] + ", "
ls_Return += "Runtime Error Count: " + String(ads_data.object.error_count[al_row]) + ", "
ls_Return += "Modify Record Count: " + String(ads_data.object.mod_count[al_row]) + ", "
ls_Return += "Add Record Count: " + String(ads_data.object.add_count[al_row]) + "]"

Return ls_Return
end function

public function string of_generateerrordetail (ref datastore ads_data, long al_row);string ls_Return

ls_Return += of_AddSpace(ads_data.object.error_record[al_row], 15)
ls_Return += of_AddSpace(ads_data.object.error_field[al_row], 14)
ls_Return += of_AddSpace(ads_data.object.err_type_text[al_row], 14)
ls_Return += of_AddSpace(ads_data.object.err_value[al_row], 0)

Return ls_Return
end function

public function string of_addspace (any aa_value, integer ai_len);string ls_Value
string ls_Return

ls_Value = String(aa_Value)
if IsNull(ls_Value) then ls_Value = ""
ls_Return = ls_Value + Space(ai_Len - Len(ls_Value))

Return ls_Return
end function

public function boolean of_isstopimport ();if ids_import_hdr.object.err_process[ids_import_hdr.GetRow()] = 1 then
	if il_ErrorCount > 0 then Return true
end if

Return false
end function

public function integer of_cacheforeignkey (string as_imp_field, string as_table_field);long ll_IDRow
long i, ll_RowCount
long ll_fk_id
string	ls_idrow, ls_fk_id

ll_RowCount = ids_imp_data.RowCount()

// Assign foreign key to each row of ids_imp_data
for i = 1 to ll_RowCount
	//Added By Mark Lee 04/17/2014
	if lower(as_table_field)  ="user_id" and  lower(as_imp_field) = "sys_user_id" then 
		ls_idrow = ids_imp_data.GetItemstring(i, as_imp_field)
		if not isnull(ls_idrow) and trim(ls_idrow) <> "" then 
			ls_fk_id = ids_intellisoft_table.GetItemstring(long(ls_idrow), as_table_field)
			ids_imp_data.SetItem(i, as_imp_field,	ls_fk_id)
		end if 
	else
		ll_IDRow = ids_imp_data.GetItemNumber(i, as_imp_field)
		if ll_IDRow > 0 then
			ll_fk_id = ids_intellisoft_table.GetItemNumber(ll_IDRow, as_table_field)
			ids_imp_data.SetItem(i, as_imp_field,	ll_fk_id)
		end if
	end if 
next

Return 1
end function

public function string of_reviseexpvalue (string as_value, boolean ab_lower);integer li_Len
integer li_NewStart
integer li_OldStart = 1
string  ls_NewValue

do while true
	li_NewStart = Pos(as_Value, "'", li_OldStart)
	if li_NewStart > 0 then		
		ls_NewValue += Mid(as_Value, li_OldStart, li_NewStart - li_OldStart) + "~~'"
		li_OldStart = li_NewStart + 1
	else
		li_Len = Len(as_Value) - li_OldStart + 1
		if li_Len > 0 then
			ls_NewValue += Right(as_Value, li_Len)
		end if		
		Exit
	end if
loop

If ab_lower Then
	Return lower(ls_NewValue)
Else
	Return (ls_NewValue)
End If
end function

public subroutine of_export_import_data_word ();//====================================================================
// Function: of_export_import_data_word
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:	Jay Chen		Date: 10-31-2013
//--------------------------------------------------------------------
//	Copyright (c) 2008-2013 ContractLogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

str_clause_export lstr_clause_export
long ll_row_cnt,ll_col_cnt,c,r,ll_row_cnt2
oleobject lole_range,lole_table,lole_cell,lole_selection
string ls_folder_name,ls_text,ls_file,ls_error,ls_null
w_appeon_gifofwait lw_appeon_gifofwait

lstr_clause_export.ab_openfile = true
lstr_clause_export.col_label[] = {'Ctx Id','Category','Contract Type','Company Name'}
lstr_clause_export.col_name[] = {'ctx_id','category','contract_type','company'}
lstr_clause_export.col_type[] = {'number','char','char','char'}
lstr_clause_export.col_width[] = {70,150,150,250}
ll_col_cnt = UpperBound(lstr_clause_export.col_name)

IF Not IsValid(lw_appeon_gifofwait) THEN 
	Open(lw_appeon_gifofwait)
	lw_appeon_gifofwait.st_1.Text = "Exporting the clause(s)..."
	lw_appeon_gifofwait.hpb_1.MaxPosition = 100
	lw_appeon_gifofwait.hpb_1.Position = 3
	Timer(0,lw_appeon_gifofwait)
End If
Open(w_email_edit)
w_email_edit.ole_word.of_open('')
If isvalid(lw_appeon_gifofwait) Then lw_appeon_gifofwait.hpb_1.Position = 5

///////////////////////////////////////Modify table list/////////////////////////////////////////////
ids_ctxbasicinfo_imp_record.reset()
ids_ctxbasicinfo_imp_record.retrieve(gl_mod_ctx_id[])
ll_row_cnt = ids_ctxbasicinfo_imp_record.rowcount()
if ll_row_cnt > 0 then ib_sendmail_new = true 

lole_selection = w_email_edit.ole_word.object.activedocument.ActiveWindow.Selection
lole_selection.Font.Size = 10
lole_selection.ParagraphFormat.Alignment = 0 
lole_selection.TypeText(is_email_message)
lole_selection.Font.Bold = True
lole_selection.TypeText("The Contract Basic Information is as follows:" + '~r~n')
lole_selection.TypeText("Modify Record List" + '~r~n')
w_email_edit.ole_word.object.activedocument.ActiveWindow.Selection.Start = w_email_edit.ole_word.object.activedocument.ActiveWindow.Selection.End
lole_selection.Font.Bold = False
lole_selection.Font.Size = 10
lole_selection.ParagraphFormat.Alignment = 0 //  wdAlignParagraphLeft 
If isvalid(lw_appeon_gifofwait) Then lw_appeon_gifofwait.hpb_1.Position = 10

//Insert Table1
lole_range = w_email_edit.ole_word.object.ActiveDocument.Range(w_email_edit.ole_word.object.activedocument.ActiveWindow.Selection.Start,w_email_edit.ole_word.object.activedocument.ActiveWindow.Selection.End)
lole_table = w_email_edit.ole_word.object.ActiveDocument.Tables.Add(lole_range,ll_row_cnt + 1,ll_col_cnt)
lole_table.Borders.Enable = True

//Set Header1
For c = 1 To ll_col_cnt
	lole_cell = lole_table.cell(1,c)
	lole_cell.select()
	lole_selection = w_email_edit.ole_word.object.activedocument.ActiveWindow.Selection
	lole_selection.TypeText(lstr_clause_export.col_label[c])
	lole_table.Columns.item(c).PreferredWidth = lstr_clause_export.col_width[c]
Next
lole_table.rows.item(1).select()
lole_selection = w_email_edit.ole_word.object.activedocument.ActiveWindow.Selection
lole_selection.Font.Bold = True
lole_selection.ParagraphFormat.Alignment = 1//  wdAlignParagraphCenter
lole_selection.Cells.VerticalAlignment = 1//wdCellAlignVerticalCenter
If isvalid(lw_appeon_gifofwait) Then lw_appeon_gifofwait.hpb_1.Position = 20

//Set Cell Value1
For r = 1 To ll_row_cnt
	For c = 1 to ll_col_cnt
		lole_cell = lole_table.cell(r+1,c)
		lole_cell.select()
		lole_selection = w_email_edit.ole_word.object.activedocument.ActiveWindow.Selection
		Choose Case Lower(lstr_clause_export.col_type[c])
			Case 'char'
				ls_text = ids_ctxbasicinfo_imp_record.GetItemString(r,lstr_clause_export.col_name[c])
			Case 'number'
				ls_text = String(ids_ctxbasicinfo_imp_record.GetItemNumber(r,lstr_clause_export.col_name[c]))
		End Choose
		If Not isnull(ls_text) and ls_text <> '' Then
			lole_selection.TypeText(ls_text)
		End If
	Next
	If isvalid(lw_appeon_gifofwait) Then lw_appeon_gifofwait.hpb_1.Position = 20 + r/ll_row_cnt * 70
Next



///////////////////////////////////////Add table list/////////////////////////////////////////////
ids_ctxbasicinfo_imp_record.reset()
ids_ctxbasicinfo_imp_record.retrieve(gl_add_ctx_id[])
ll_row_cnt2 = ids_ctxbasicinfo_imp_record.rowcount()
if ll_row_cnt2 > 0 then ib_sendmail_new = true

w_email_edit.ole_word.object.activedocument.ActiveWindow.Selection.Start = w_email_edit.ole_word.object.activedocument.ActiveWindow.Selection.End + 10
lole_selection = w_email_edit.ole_word.object.activedocument.ActiveWindow.Selection
lole_selection.Font.Bold = True
lole_selection.Font.Size = 10
lole_selection.ParagraphFormat.Alignment = 0 // wdAlignParagraphCenter
lole_selection.TypeText( '~r~n')
lole_selection.TypeText( "Add Record List" + '~r~n')
w_email_edit.ole_word.object.activedocument.ActiveWindow.Selection.Start = w_email_edit.ole_word.object.activedocument.ActiveWindow.Selection.End 
lole_selection.Font.Bold = False
lole_selection.Font.Size = 10
lole_selection.ParagraphFormat.Alignment = 0 //  wdAlignParagraphLeft 
//Insert Table2
lole_range = w_email_edit.ole_word.object.ActiveDocument.Range(w_email_edit.ole_word.object.activedocument.ActiveWindow.Selection.Start,w_email_edit.ole_word.object.activedocument.ActiveWindow.Selection.End)
lole_table = w_email_edit.ole_word.object.ActiveDocument.Tables.Add(lole_range,ll_row_cnt2 + 1,ll_col_cnt)
lole_table.Borders.Enable = True

//Set Header2
For c = 1 To ll_col_cnt
	lole_cell = lole_table.cell(1,c)
	lole_cell.select()
	lole_selection = w_email_edit.ole_word.object.activedocument.ActiveWindow.Selection
	lole_selection.TypeText(lstr_clause_export.col_label[c])
	lole_table.Columns.item(c).PreferredWidth = lstr_clause_export.col_width[c]
Next
lole_table.rows.item(1).select()
lole_selection = w_email_edit.ole_word.object.activedocument.ActiveWindow.Selection
lole_selection.Font.Bold = True
lole_selection.ParagraphFormat.Alignment = 1//  wdAlignParagraphCenter
lole_selection.Cells.VerticalAlignment = 1//wdCellAlignVerticalCenter

//Set Cell Value2
For r = 1 To ll_row_cnt2
	For c = 1 to ll_col_cnt
		lole_cell = lole_table.cell(r+1,c)
		lole_cell.select()
		lole_selection = w_email_edit.ole_word.object.activedocument.ActiveWindow.Selection
		Choose Case Lower(lstr_clause_export.col_type[c])
			Case 'char'
				ls_text = ids_ctxbasicinfo_imp_record.GetItemString(r,lstr_clause_export.col_name[c])
			Case 'number'
				ls_text = String(ids_ctxbasicinfo_imp_record.GetItemNumber(r,lstr_clause_export.col_name[c]))
		End Choose
		If Not isnull(ls_text) and ls_text <> '' Then
				lole_selection.TypeText(ls_text)
		End If
	Next
Next

If isvalid(lw_appeon_gifofwait) Then lw_appeon_gifofwait.hpb_1.Position = 100
If isvalid(lw_appeon_gifofwait) Then Close(lw_appeon_gifofwait)











end subroutine

public function integer of_copy_import_file (long al_import_id, boolean ab_import_result);//====================================================================
// Function: of_copy_import_file
//--------------------------------------------------------------------
// Description: Copy the Import file after imported.
//--------------------------------------------------------------------
// Arguments:
//                al_import_id
//                ab_import_result
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:         Ken.Guo           Date: 01/23/2014
//--------------------------------------------------------------------
//Copyright (c) 2008-2013 Contract Logix, Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


Long ll_FindRow, ll_pos_dot,ll_CopyFile
String ls_imp_format, ls_filename_add
String ls_imp_file, ls_newfilename


ll_FindRow = ids_import_hdr.Find("import_id=" + String(al_import_id), 1, ids_import_hdr.RowCount())
if ll_FindRow <= 0 then Return -1
ll_CopyFile = ids_import_hdr.object.Copy_File[ll_FindRow]

If ll_CopyFile = 1 Then 
	If ab_import_result Then
		ls_filename_add = '_success_' + String(Today(), 'mmddyyyy') +'-'+ String(Now(),'hhmm')
	Else
		ls_filename_add = '_fail_' + String(Today(), 'mmddyyyy') +'-'+ String(Now(),'hhmm')
	End If
	ls_imp_format = ids_import_hdr.object.imp_format[ll_FindRow]
	If ls_imp_format <> '3' Then //Not ODBC
		ls_imp_file = ids_import_hdr.object.imp_file[ll_FindRow]
		If FileExists(ls_imp_file) Then
			ll_pos_dot = LastPos(ls_imp_file,'.')
			If ll_pos_dot > 0 Then
				ls_newfilename = Mid(ls_imp_file, 1, ll_pos_dot - 1) + ls_filename_add + Mid(ls_imp_file, ll_pos_dot )
			Else
				ls_newfilename = ls_imp_file + ls_filename_add
			End If
			If FileCopy(ls_imp_file, ls_newfilename, True) <> 1 Then
				gnv_debug.of_output(True, 'Import Log. Failed to copy the import file. The source file is ' + ls_imp_file + ', the target file is ' + ls_newfilename + '.' )
			End If
		Else
			gnv_debug.of_output(True, 'Import Log. The import file is not exists. '  +  ls_imp_file + '.')
		End If
	End If
End If

Return 1

end function

public function string of_existscheckedvalue (string as_tablename, string as_column, string as_arrvalue[], string as_type, ref string as_output_table);//====================================================================
// Function: of_existscheckedvalue
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value        string    as_tablename
// 	value        string    as_column
// 	value        string    as_arrvalue[]
// 	value        string    as_type
// 	reference    string    as_output_table
//--------------------------------------------------------------------
// Returns:  string
//--------------------------------------------------------------------
// Author:	Mark Lee		Date: 04/22/2014
//--------------------------------------------------------------------
//	Copyright (c) 2008-2013 Contract Logix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
return ""
end function

public function string of_checkimporttable (ref datastore ads_data, string as_class);integer i
string  ls_table_name
boolean lb_IsNeedBasicTable = false
boolean lb_IsBasicTableExists = false
boolean lb_IsNeedCompanyTable = false
boolean lb_IsCompanyTableExists = false
boolean lb_IsNeedContactTable = false
boolean lb_IsContactTableExists = false
boolean lb_IsMultiHeader = false //added by gavins 20130222
boolean lb_IsMultiDetails = false
boolean lb_IsSecurityUsers = false	//Added By Mark Lee 04/22/2014
boolean lb_IsNeedSecurityUsers = false


if ads_data.RowCount() <= 0 then Return "There is no import table record."

for i = 1 to ads_data.RowCount()
	ls_table_name = Lower(ads_data.object.table_name[i])
	
	// if need company table
//	if ls_table_name = "ctx_contacts" then lb_IsNeedCompanyTable = true
	if ls_table_name = "app_facility" then lb_IsCompanyTableExists = true
	
	
//	// if need contact table																					
//	if ls_table_name = "ctx_contacts_numbers" or ls_table_name = "ctx_contract_contacts" then lb_IsNeedContactTable = true//
//	if ls_table_name = "ctx_contacts" then lb_IsContactTableExists = true
//	
//	//if need multi header
	If ls_table_name = "ctx_custom_multi_hdr" Then lb_IsMultiHeader = True
	If ls_table_name = "ctx_custom_multi_detail" Then lb_IsMultiDetails = True
//	
//	//if need contact table	//Added By Mark Lee 04/16/2014
//	If ls_table_name = "security_users" Then 
//		lb_IsNeedContactTable = True	
//		lb_IsSecurityUsers = True	
//	End If
	
//	//if need security_users table
//	If ls_table_name = "idp_users" Then lb_IsNeedSecurityUsers = True
	
	// if need basic table
	choose case ls_table_name
		Case "pd_basic", "ctx_basic_info", "app_facility", "ctx_contacts", "ctx_contacts_numbers", "security_users", "idp_users",'ctx_custom_multi_hdr','ctx_custom_multi_detail'
			
		case 'ctx_contract_contacts'
			lb_IsNeedBasicTable = true
		case else
			lb_IsNeedBasicTable = false
	end choose
	if ls_table_name = "pd_basic" or ls_table_name = "ctx_basic_info" then
		lb_IsBasicTableExists = true
	end if	
next



// Do some checking
if lb_IsNeedCompanyTable and not lb_IsCompanyTableExists then Return "'Companies' table is required."
//if lb_IsNeedContactTable and not lb_IsContactTableExists then Return "'Contacts' table is required."
if lb_IsNeedBasicTable and not lb_IsBasicTableExists then Return "'Basic Information' table is required."
if lb_IsMultiDetails and not lb_IsMultiHeader then Return "'Custom Multi Header' table is required."
//if lb_IsNeedSecurityUsers and not lb_IsSecurityUsers then Return "'Security Users' table is required."
//
Return ""
end function

public function integer of_checkmapping (boolean ab_isimport, long al_table_id, string as_table_name, ref datastore ads_import_field, ref datastore ads_mapping_field, ref string as_errortext[], string as_project, datastore ads_table_record);Return 1 
end function

on n_cst_import.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_import.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;//////////////////////////////////////////////////////////////
//The flowing datawindow is static create
ids_import_hdr = Create n_import_ds
ids_table_record = Create n_import_ds
ids_import_field = Create n_import_ds
ids_mapping_field = Create n_import_ds
ids_lookup_mapping = Create n_import_ds
ids_dataview_screen = Create n_import_ds
ids_log_proc = Create n_import_ds
ids_log_table = Create n_import_ds
ids_log_error = Create n_import_ds
ids_newrow = Create n_import_ds

ids_address_lookup = Create n_import_ds
ids_code_lookup = Create n_import_ds
ids_facility = Create n_import_ds
ids_committee = Create n_import_ds
ids_company = Create n_import_ds
ids_coderownum1 = Create n_import_ds
ids_coderownum2 = Create n_import_ds
ids_security_role = Create n_import_ds
ids_category_right = Create n_import_ds

ids_import_hdr.DataObject = "d_import_ds_hdr"
ids_table_record.DataObject = "d_import_ds_table"
ids_import_field.DataObject = "d_import_ds_impfield"
ids_mapping_field.DataObject = "d_import_ds_mapfield"
ids_lookup_mapping.DataObject = "d_import_ds_lumap"
ids_dataview_screen.DataObject = "d_import_ds_dv_screen"
ids_log_proc.DataObject = "d_import_ds_logproc"
ids_log_table.DataObject = "d_import_ds_logtable"
ids_log_error.DataObject = "d_import_ds_logerror"
ids_newrow.DataObject = "d_import_ds_newrownum"

ids_address_lookup.DataObject = "d_import_ds_lu_address"
ids_code_lookup.DataObject = "d_import_ds_lu_code"
ids_facility.DataObject = "d_import_ds_lu_facility"
ids_committee.DataObject = "d_import_ds_lu_committee"
ids_company.DataObject = "d_import_ds_lu_company"
ids_coderownum1.DataObject = "d_import_ds_coderownum"
ids_coderownum2.DataObject = "d_import_ds_coderownum"
ids_security_role.DataObject = "d_dddw_security_roles"
ids_category_right.DataObject = "d_import_ds_categoryright"

ids_import_hdr.SetTransObject(SQLCA)
ids_table_record.SetTransObject(SQLCA)
ids_import_field.SetTransObject(SQLCA)
ids_mapping_field.SetTransObject(SQLCA)
ids_lookup_mapping.SetTransObject(SQLCA)
ids_dataview_screen.SetTransObject(SQLCA)
ids_log_proc.SetTransObject(SQLCA)
ids_log_table.SetTransObject(SQLCA)
ids_log_error.SetTransObject(SQLCA)

ids_address_lookup.SetTransObject(SQLCA)
ids_code_lookup.SetTransObject(SQLCA)
ids_facility.SetTransObject(SQLCA)
ids_committee.SetTransObject(SQLCA)
ids_company.SetTransObject(SQLCA)
ids_security_role.SetTransObject(SQLCA)
ids_category_right.SetTransObject(SQLCA)

//Added By Jay Chen 10-31-2013
ids_ctxbasicinfo_imp_record = Create datastore 
ids_ctxbasicinfo_imp_record.DataObject = "d_ctx_baseinfo_import_record"
ids_ctxbasicinfo_imp_record.SetTransObject(sqlca)

//////////////////////////////////////////////////////////////
//The flowing datawindow is dynamic create
ids_imp_data = Create n_import_ds
ids_intellisoft_table = Create n_import_ds
ids_intellisoft_table_temp = Create n_import_ds
end event

event destructor;Destroy ids_import_hdr
Destroy ids_table_record
Destroy ids_import_field
Destroy ids_mapping_field
Destroy ids_lookup_mapping
Destroy ids_dataview_screen
Destroy ids_log_proc
Destroy ids_log_table
Destroy ids_log_error
Destroy ids_newrow

Destroy ids_address_lookup
Destroy ids_code_lookup
Destroy ids_facility
Destroy ids_committee
Destroy ids_company
Destroy ids_coderownum1
Destroy ids_coderownum2
Destroy ids_security_role
Destroy ids_category_right

Destroy ids_imp_data
Destroy ids_intellisoft_table
Destroy ids_intellisoft_table_temp
end event

