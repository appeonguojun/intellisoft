$PBExportHeader$n_cst_import_credapp.sru
forward
global type n_cst_import_credapp from n_cst_import
end type
end forward

global type n_cst_import_credapp from n_cst_import
end type
global n_cst_import_credapp n_cst_import_credapp

type variables
// pd_affil_stat datastore(use in find and update)
n_import_ds ids_pd_affil_stat

// Verification datastore(use in add verification)
n_import_ds ids_verif_facilities
n_import_ds ids_dfl_rsp_code
n_import_ds ids_ver_orgs_facilities
n_import_ds ids_parent_facilities
n_import_ds ids_facility_forpt
n_import_ds ids_facility_ver_rules
n_import_ds ids_pd_hosp_facility_link
n_import_ds ids_verif_info

// inv_data_entry nvo(use in field audit)
pfc_cst_nv_data_entry_functions inv_data_entry
end variables

forward prototypes
public function integer of_fieldaudit ()
public function integer of_addlinks (string as_table_name)
public function integer of_addhosplink (ref datastore ads_data, long al_rec_id, long al_prac_id, long al_facility_id)
public function integer of_addaddresslink (ref datastore ads_data, long al_rec_id, long al_prac_id, long al_facility_id)
public function integer of_addspeclink (ref datastore ads_data, long al_rec_id, long al_prac_id, long al_facility_id)
public function integer of_cacheverifydata (long al_currrow, long al_rowcount, long al_cachecounter, integer ai_screen_id)
public function integer of_setverifyseqno (long al_min_rec_id, long al_max_rec_id)
public function integer of_addverify ()
public function integer of_setprimarykey (string as_table_name)
public function integer of_set_pd_affil_stat_key ()
public function integer of_set_appstatchild_key ()
public function integer of_datapopulate ()
public function integer of_dyncreateistabledw (string as_table_name)
public function integer of_postupdate ()
public function integer of_preupdate ()
public function integer of_checkmapping (boolean ab_isimport, long al_table_id, string as_table_name, ref datastore ads_import_field, ref datastore ads_mapping_field, ref string as_errortext[])
public function integer of_datapopulateproc ()
public function long of_set_pd_affil_stat_def (ref datastore ads_data, long al_row)
public function integer of_setdefaultvalue (string as_table_name, ref boolean ab_isnewrow[], ref long al_setdefvaluerow[])
public function integer of_addverify (long al_prac_id, long al_rec_id, long al_screen_id, string as_reference, datetime adt_exp_date, string as_screen_name, long al_address_lookup_code, string as_add_type, integer as_end_month, integer as_end_year, long as_complete_response, integer ai_data_status)
end prototypes

public function integer of_fieldaudit ();string ls_ErrorText

//Set progress bar
w_import_progressbar.of_SetImportProcessDesc("Field audit")
w_import_progressbar.of_SetMaxPosition(2)
w_import_progressbar.of_SkipNextPosition()

//Execute field audit
ids_address_lookup.SetFilter("")
ids_address_lookup.Filter()
inv_data_entry.ids_address_lookup = ids_address_lookup
inv_data_entry.of_field_audit(ids_intellisoft_table, ls_ErrorText)
w_import_progressbar.of_SkipNextPosition()

Return 1
end function

public function integer of_addlinks (string as_table_name);long ll_rec_id
long ll_prac_id
long ll_facility_id
long i, j, ll_Row
long ll_InsertRow
long ll_AddCount
n_import_ds lds_status
n_import_ds lds_address
n_import_ds lds_hosp_facility
n_import_ds lds_spec_facility
n_import_ds lds_address_link
n_import_ds lds_hosp_facility_link
n_import_ds lds_spec_facility_link

//Set progress bar
w_import_progressbar.of_SetImportProcessDesc("Add link records")

//Create datastore of link table
lds_address_link = Create n_import_ds
lds_hosp_facility_link = Create n_import_ds
lds_spec_facility_link = Create n_import_ds
lds_address_link.DataObject = "d_import_ds_pd_address_link"
lds_hosp_facility_link.DataObject = "d_import_ds_pd_hosp_facility_link"
lds_spec_facility_link.DataObject = "d_import_ds_pd_spec_facility_link"
lds_address_link.SetTransObject(SQLCA)
lds_hosp_facility_link.SetTransObject(SQLCA)
lds_spec_facility_link.SetTransObject(SQLCA)

//Add new records to link table
choose case as_table_name
	case "pd_address", "pd_hosp_facility", "pd_board_specialty"
		w_import_progressbar.of_SetMaxPosition(il_CurrTableAddCount + 1)
		for i = 1 to il_CurrTableAddCount
			ll_Row = ids_newrow.GetItemNumber(i, "new_row")
			ll_prac_id = ids_intellisoft_table.object.prac_id[ll_Row]
			ll_rec_id = ids_intellisoft_table.object.rec_id[ll_Row]
			ids_pd_affil_stat.of_Filter("prac_id=" + String(ll_prac_id))
			
			for j = 1 to ids_pd_affil_stat.RowCount()
				ll_facility_id = ids_pd_affil_stat.object.parent_facility_id[j]
				choose case as_table_name
					case "pd_address"
						of_AddAddressLink(lds_address_link, ll_rec_id, ll_prac_id, ll_facility_id)
					case "pd_hosp_facility"
						of_AddHospLink(lds_hosp_facility_link, ll_rec_id, ll_prac_id, ll_facility_id)
					case "pd_board_specialty"
						of_AddSpecLink(lds_spec_facility_link, ll_rec_id, ll_prac_id, ll_facility_id)
				end choose
			next
			w_import_progressbar.of_SkipNextPosition()
		next
		ids_pd_affil_stat.of_Filter("")
		
	case else
		//Retrieve parent table of link table
		lds_address = Create n_import_ds
		lds_hosp_facility = Create n_import_ds
		lds_spec_facility = Create n_import_ds
		lds_address.DataObject = "d_import_ds_pd_address"
		lds_hosp_facility.DataObject = "d_import_ds_pd_hosp_affil"
		lds_spec_facility.DataObject = "d_import_ds_pd_board_specialty"
		lds_address.SetTransObject(SQLCA)
		lds_hosp_facility.SetTransObject(SQLCA)
		lds_spec_facility.SetTransObject(SQLCA)
		
		gnv_appeondb.of_StartQueue()
		lds_address.Retrieve()
		lds_hosp_facility.Retrieve()
		lds_spec_facility.Retrieve()
		gnv_appeondb.of_CommitQueue()
		
		//Get add count of status table
		if as_table_name = "pd_affil_stat" then
			lds_status = ids_intellisoft_table
			ll_AddCount = il_CurrTableAddCount
		else
			lds_status = ids_pd_affil_stat
			ll_AddCount = il_StatusAutoAddCount
		end if
		w_import_progressbar.of_SetMaxPosition(ll_AddCount + 1)
		
		//Add new records to link table
		for i = 1 to ll_AddCount
			if as_table_name = "pd_affil_stat" then
				ll_Row = ids_newrow.GetItemNumber(i, "new_row")
			else
				ll_Row = lds_status.RowCount() - i + 1
			end if
			ll_prac_id = lds_status.object.prac_id[ll_Row]
			ll_facility_id = lds_status.object.parent_facility_id[ll_Row]
			
			//pd_address_link
			lds_address.of_Filter("prac_id=" + String(ll_prac_id))
			for j = 1 to lds_address.RowCount()
				ll_rec_id = lds_address.object.rec_id[j]
				of_AddAddressLink(lds_address_link, ll_rec_id, ll_prac_id, ll_facility_id)
			next
			//pd_hosp_facility_link
			lds_hosp_facility.of_Filter("prac_id=" + String(ll_prac_id))
			for j = 1 to lds_hosp_facility.RowCount()
				ll_rec_id = lds_hosp_facility.object.rec_id[j]
				of_AddHospLink(lds_hosp_facility_link, ll_rec_id, ll_prac_id, ll_facility_id)
			next
			//pd_spec_facility_link
			lds_spec_facility.of_Filter("prac_id=" + String(ll_prac_id))
			for j = 1 to lds_spec_facility.RowCount()
				ll_rec_id = lds_spec_facility.object.rec_id[j]
				of_AddSpecLink(lds_spec_facility_link, ll_rec_id, ll_prac_id, ll_facility_id)
			next
			w_import_progressbar.of_SkipNextPosition()
		next
end choose

//Update
gnv_appeondb.of_StartQueue()
lds_address_link.Update()
lds_hosp_facility_link.Update()
lds_spec_facility_link.Update()
gnv_appeondb.of_CommitQueue()

//Destroy all datastores if valid
if IsValid(lds_address) then Destroy lds_address
if IsValid(lds_hosp_facility) then Destroy lds_hosp_facility
if IsValid(lds_spec_facility) then Destroy lds_spec_facility
if IsValid(lds_address_link) then Destroy lds_address_link
if IsValid(lds_hosp_facility_link) then Destroy lds_hosp_facility_link
if IsValid(lds_spec_facility_link) then Destroy lds_spec_facility_link
w_import_progressbar.of_SkipNextPosition()

Return 1
end function

public function integer of_addhosplink (ref datastore ads_data, long al_rec_id, long al_prac_id, long al_facility_id);long ll_InsertRow

ll_InsertRow = ads_data.InsertRow(0)
ads_data.SetItem(ll_InsertRow, "prac_id", al_prac_id)
ads_data.SetItem(ll_InsertRow, "hosp_affil_id", al_rec_id)
ads_data.SetItem(ll_InsertRow, "facility_id", al_facility_id)
ads_data.SetItem(ll_InsertRow, "primary_hosp", 582)	

Return 1
end function

public function integer of_addaddresslink (ref datastore ads_data, long al_rec_id, long al_prac_id, long al_facility_id);long ll_InsertRow

ll_InsertRow = ads_data.InsertRow(0)
ads_data.SetItem(ll_InsertRow, "prac_id", al_prac_id)
ads_data.SetItem(ll_InsertRow, "address_id", al_rec_id)
ads_data.SetItem(ll_InsertRow, "facility_id", al_facility_id)
ads_data.SetItem(ll_InsertRow, "billing", 0)
ads_data.SetItem(ll_InsertRow, "mailing", 0)					
ads_data.SetItem(ll_InsertRow, "home_address", 0)
ads_data.SetItem(ll_InsertRow, "primary_office", 0)
ads_data.SetItem(ll_InsertRow, "additional_office", 0)
ads_data.SetItem(ll_InsertRow, "include_in_directory", 0)
ads_data.SetItem(ll_InsertRow, "exp_letters", 0)

Return 1
end function

public function integer of_addspeclink (ref datastore ads_data, long al_rec_id, long al_prac_id, long al_facility_id);long ll_InsertRow

ll_InsertRow = ads_data.InsertRow(0)
ads_data.SetItem(ll_InsertRow, "prac_id", al_prac_id)
ads_data.SetItem(ll_InsertRow, "specialty_id", al_rec_id)
ads_data.SetItem(ll_InsertRow, "facility_id", al_facility_id)
ads_data.SetItem(ll_InsertRow, "practicing", 582)
	
Return 1
end function

public function integer of_cacheverifydata (long al_currrow, long al_rowcount, long al_cachecounter, integer ai_screen_id);long i, j
long ll_Row
long ll_EndRow
long ll_rec_id_arr[]
long ll_prac_id_arr[]

// Get arrary of rec_id and prac_id
ll_EndRow = al_CurrRow + al_CacheCounter - 1
if ll_EndRow > al_RowCount then ll_EndRow = al_RowCount
for i = al_CurrRow to ll_EndRow
	ll_Row = ids_newrow.GetItemNumber(i, "new_row")
	j ++
	ll_rec_id_arr[j] = ids_intellisoft_table.GetItemNumber(ll_Row, "rec_id")
	ll_prac_id_arr[j] = ids_intellisoft_table.GetItemNumber(ll_Row, "prac_id")
next

// Retrieve data
if ai_screen_id = 10 then
	gnv_appeondb.of_StartQueue()
	ids_verif_facilities.Retrieve(ai_screen_id, ll_prac_id_arr[])
	ids_dfl_rsp_code.Retrieve(ai_screen_id, ll_prac_id_arr[])
	ids_ver_orgs_facilities.Retrieve(ai_screen_id, ll_prac_id_arr[])
	ids_parent_facilities.Retrieve(ll_prac_id_arr[])
	ids_facility_forpt.Retrieve()
	
	ids_facility_ver_rules.Retrieve()
	ids_pd_hosp_facility_link.Retrieve(ll_rec_id_arr[])
	gnv_appeondb.of_CommitQueue()
else
	gnv_appeondb.of_StartQueue()
	ids_verif_facilities.Retrieve(ai_screen_id, ll_prac_id_arr[])
	ids_dfl_rsp_code.Retrieve(ai_screen_id, ll_prac_id_arr[])
	ids_ver_orgs_facilities.Retrieve(ai_screen_id, ll_prac_id_arr[])
	ids_parent_facilities.Retrieve(ll_prac_id_arr[])
	ids_facility_forpt.Retrieve()
	gnv_appeondb.of_CommitQueue()	
end if

Return 1
end function

public function integer of_setverifyseqno (long al_min_rec_id, long al_max_rec_id);long ll_rec_id
long ll_prac_id
long ll_facility_id
long ll_max_seq_no
long ll_FindRow
long ll_InsertRow
long i, ll_RowCount
string ls_doc_id
string ls_Find
DataStore lds_verify_maxseqno

if al_min_rec_id > al_max_rec_id then
	ll_rec_id = al_min_rec_id
	al_max_rec_id = al_min_rec_id
	al_min_rec_id = ll_rec_id
end if

lds_verify_maxseqno = Create DataStore
lds_verify_maxseqno.DataObject = "d_import_ds_verify_max_seq_no"
lds_verify_maxseqno.SetTransObject(SQLCA)
lds_verify_maxseqno.Retrieve(al_min_rec_id, al_max_rec_id)

ll_RowCount = ids_verif_info.RowCount()
for i = 1 to ll_RowCount
	ll_rec_id = ids_verif_info.GetItemNumber(i, "rec_id")
	ll_prac_id = ids_verif_info.GetItemNumber(i, "prac_id")
	ll_facility_id = ids_verif_info.GetItemNumber(i, "verif_info_facility_id")
	
	ls_Find = "rec_id=" + String(ll_rec_id) + " AND prac_id=" + String(ll_prac_id)+ " AND facility_id=" + String(ll_facility_id)
	ll_FindRow = lds_verify_maxseqno.Find(ls_Find, 1, lds_verify_maxseqno.RowCount())	
	if ll_FindRow > 0 then
		ll_max_seq_no = lds_verify_maxseqno.GetItemNumber(ll_FindRow, "max_seq_no")
		if IsNull(ll_max_seq_no) then ll_max_seq_no = 0
		ll_max_seq_no ++
		lds_verify_maxseqno.SetItem(ll_FindRow, "max_seq_no", ll_max_seq_no)
	else				
		ll_InsertRow = ids_verif_info.InsertRow(0)
		lds_verify_maxseqno.SetItem(ll_InsertRow, "rec_id", ll_rec_id)
		lds_verify_maxseqno.SetItem(ll_InsertRow, "prac_id", ll_prac_id)
		lds_verify_maxseqno.SetItem(ll_InsertRow, "facility_id", ll_facility_id)
		lds_verify_maxseqno.SetItem(ll_InsertRow, "max_seq_no", 1)
		ll_max_seq_no = 1
	end if
	
	ids_verif_info.SetItem(i, "seq_no", ll_max_seq_no)
	ls_doc_id = String(ll_rec_id) + "-" + String(ll_prac_id) + "-" + String(ll_facility_id) +  "-" + String(ll_max_seq_no)
	ids_verif_info.SetItem(i, "doc_id", ls_doc_id)
next

Destroy lds_verify_maxseqno

Return 1
end function

public function integer of_addverify ();string ls_type1
string ls_type2
string ls_type3
string ls_ref_1
string ls_ref_2
string ls_ref_3
string ls_exp_field
string ls_imp_value
string ls_imp_field_name
string ls_Reference
string ls_screen_name
string ls_table_name
string ls_data_status //maha 08.04.08
integer li_year
integer li_month
Integer li_screen_id
integer li_dstatus  //maha 08.04.08
long ll_prac_id
long ll_rec_id
long ll_min_rec_id
long ll_max_rec_id
long ll_address_code
long ll_verif_response
long ll_table_id
long i, ll_Row
long ll_FindRow
long ll_RowCount
long ll_ImportDataRow
long ll_CacheCounter
DateTime ldt_exp_date
constant long LL_CACHE_RECORDS = 100

//There is no new record
if il_CurrTableAddCount = 0 then Return 1

//initialization
ll_CacheCounter = LL_CACHE_RECORDS
if Upper(gs_cust_type) = 'I' then
	//if intelliapp, always set to complete the verification
	ll_verif_response = 326
end if

//Get data view screen information
ll_table_id = ids_table_record.object.isoft_table_id[ids_table_record.GetRow()]
ls_table_name = Lower(ids_table_record.object.table_name[ids_table_record.GetRow()])
ll_FindRow = ids_dataview_screen.Find("table_id=" + String(ll_table_id), 1, ids_dataview_screen.RowCount())
if ll_FindRow <= 0 then Return 1 //Not need to add verifycations
ls_ref_1 = Lower(ids_dataview_screen.GetItemString(ll_FindRow, "ref_field_1"))
ls_ref_2 = Lower(ids_dataview_screen.GetItemString(ll_FindRow, "ref_field_2"))
ls_ref_3 = Lower(ids_dataview_screen.GetItemString(ll_FindRow, "ref_field_3"))
ls_type1 = ids_dataview_screen.GetItemString(ll_FindRow, "ref_1_type")
ls_type2 = ids_dataview_screen.GetItemString(ll_FindRow, "ref_2_type")
ls_type3 = ids_dataview_screen.GetItemString(ll_FindRow, "ref_3_type")
ls_exp_field = ids_dataview_screen.GetItemString(ll_FindRow, "exp_field")
li_screen_id = ids_dataview_screen.GetItemNumber(ll_FindRow, "screen_id")
ls_screen_name = ids_dataview_screen.GetItemString(ll_FindRow, "screen_name")
if IsNull(ls_ref_1) or ls_ref_1 = "" or IsNull(ls_ref_2)  or ls_ref_2 = "" then
	Return 1 //Not need to add verifycations
end if

//Set progress bar
w_import_progressbar.of_SetImportProcessDesc("Add verifications")
w_import_progressbar.of_SetMaxPosition(il_CurrTableAddCount + 1)
ll_RowCount = ids_intellisoft_table.RowCount()

//Add verification process
for i = 1 to il_CurrTableAddCount
	w_import_progressbar.of_SkipNextPosition()
	ll_Row = ids_newrow.GetItemNumber(i, "new_row")
	ll_ImportDataRow = ids_newrow.GetItemNumber(i, "imp_row")
	
	///////////////////////////////////////[1-Check ls_ref_1]//////////////////////////////////////////////	
	if ids_intellisoft_table.Describe(ls_ref_1 + ".ColType") = "!" then
		of_Log(ll_ImportDataRow, "", IL_ERRTYPE_ADDVERIFY, "01-Required Field '" + ls_ref_1 + "' is invalid")
		Return -1
	end if
	
	///////////////////////////////////////[2-Get year and month]//////////////////////////////////////////	
	if li_screen_id  = 7 or li_screen_id = 10 then  // training & hosp affil
		if ids_intellisoft_table.Describe("year_thru.ColType") <> "!" then
			li_year = ids_intellisoft_table.getitemnumber(ll_Row,"year_thru")
			if ids_intellisoft_table.Describe("month_thru.ColType") <> "!" then
				li_month = ids_intellisoft_table.getitemnumber(ll_Row,"month_thru")
			end if
		elseif ids_intellisoft_table.Describe("end_date.ColType") <> "!" then
			li_year = year(date(ids_intellisoft_table.getitemdatetime(ll_Row,"end_date")))
			li_month = month(date(ids_intellisoft_table.getitemdatetime(ll_Row,"end_date")))
		end if
	end if
	
	///////////////////////////////////////[3-Get expiration date]//////////////////////////////////////	
	if Len(ls_exp_field) > 0 then
		if ls_exp_field = "certification_expires" then				
			ldt_exp_date = DateTime(Date(String(ids_intellisoft_table.GetItemNumber(ll_Row, ls_exp_field)) + "-12-30"),Now())
		elseif ls_exp_field = "cert_expiration_year" then
			li_month = ids_intellisoft_table.GetItemNumber(ll_Row, "cert_expiration_month")
			if IsNull(li_month) then
				ldt_exp_date = DateTime(Date(String(ids_intellisoft_table.GetItemNumber(ll_Row, ls_exp_field)) + "-12-30"),Now())
			else
				ldt_exp_date = DateTime(Date(String(ids_intellisoft_table.GetItemNumber(ll_Row, ls_exp_field)) + "-" + String(li_month) + "-28"),Now())
			end if
		else
			if ids_intellisoft_table.Describe(ls_exp_field + ".ColType") <> "!" then
				ldt_exp_date = ids_intellisoft_table.GetItemDateTime(ll_Row, ls_exp_field)	
			else				
				of_Log(ll_ImportDataRow, "", IL_ERRTYPE_ADDVERIFY, "02-Required Field '" + ls_exp_field + "' is invalid")
				Return -1
			end if
		end if
	else
		SetNull(ldt_exp_date)
	end if
			
	///////////////////////////////////////[4-Get reference information]////////////////////////////////////////////
	//Get reference 1 and address code
	SetNull(ll_address_code)
	if ls_type1 = "N" or ls_type1 = "I" then
		//Is a lookup code
		ll_FindRow = ids_mapping_field.Find("Lower(field_name)='" + ls_ref_1 + "'", 1, ids_mapping_field.RowCount())
		if ll_FindRow > 0 then			
			ls_imp_field_name = Trim(ids_mapping_field.GetItemString(ll_FindRow, "imp_field_name"))
			ls_Reference = ids_imp_data.GetItemString(ll_ImportDataRow, ls_imp_field_name)
		else
			ls_Reference = ""
		end if
	else
		ls_Reference = ids_intellisoft_table.GetItemString(ll_Row, ls_ref_1)		
	end if
	if IsNull(ls_Reference) then ls_Reference = ""
	
	if li_screen_id = 4 then
		if ids_intellisoft_table.Describe("verifying_agency.ColType") = "!" then
			of_Log(ll_ImportDataRow, "", IL_ERRTYPE_ADDVERIFY, "03-Required Field 'verifying_agency' is invalid")
			Return -1
		else
			ll_address_code = ids_intellisoft_table.GetItemNumber(ll_Row, "verifying_agency")
		end if
	else
		if ls_type1 = "C" then
			ll_address_code = Long(ids_intellisoft_table.GetItemString(ll_Row, ls_ref_1))
		elseif ls_type1 = "N" then
			ll_address_code = ids_intellisoft_table.GetItemNumber(ll_Row, ls_ref_1)
		end if
	end if
	
	//Get reference 2
	if Len(ls_ref_2) > 0 then
		if ids_intellisoft_table.Describe(ls_ref_2 + ".ColType") = "!" then			
			of_Log(ll_ImportDataRow, "", IL_ERRTYPE_ADDVERIFY, "04-Required Field '" + ls_ref_2 + "' is invalid")
			Return -1
		end if
		if ls_type2 = "N" or ls_type2 = "I" then
			//Is a lookup code
			ll_FindRow = ids_mapping_field.Find("Lower(field_name)='" + ls_ref_2 + "'", 1, ids_mapping_field.RowCount())
			if ll_FindRow > 0 then
				ls_imp_field_name = ids_mapping_field.GetItemString(ll_FindRow, "imp_field_name")
				ls_imp_value = ids_imp_data.GetItemString(ll_ImportDataRow, ls_imp_field_name)
			end if
		else
			ls_imp_value = ids_intellisoft_table.GetItemString(ll_Row, ls_ref_2)
		end if
		if Len(ls_imp_value) > 0 then ls_Reference = ls_Reference + " - " + ls_imp_value
		ls_Reference = Left(ls_Reference, 100)
	end if
	
	//Start Code Change ----08.04.2008 #V85 maha - added to get active status of record
	//Start Code Change ----09.17.2008 #V85 maha - modified to number datatype
	/////////////////////////////////////// get data status ////////////////////////////////////
	if ids_intellisoft_table.Describe("active_status" + ".ColType") <> "!" then //if active status exists
		li_dstatus = ids_intellisoft_table.GetItemnumber(ll_Row, "active_status")
//		ls_data_status = ids_intellisoft_table.GetItemString(ll_Row, "active_status")
//		if isnull(ls_data_status) then
//			setnull(li_dstatus)
//		else
//			li_dstatus = integer (ls_data_status)
//		end if
//End Code Change---09.17.2008	
	else
		setnull(li_dstatus)
	end if
	//End Code Change---08.04.2008	
	
	///////////////////////////////////////[5-Add verification]////////////////////////////////////////////
	if ll_CacheCounter = LL_CACHE_RECORDS then
		of_CacheVerifyData(i, il_CurrTableAddCount, ll_CacheCounter, li_screen_id)
		ll_CacheCounter = 1
	else
		ll_CacheCounter ++
	end if
	ll_rec_id = ids_intellisoft_table.GetItemNumber(ll_Row, "rec_id")
	ll_prac_id = ids_intellisoft_table.GetItemNumber(ll_Row, "prac_id")
	if of_AddVerify(ll_prac_id, ll_rec_id, li_screen_id, ls_Reference, ldt_exp_date, ls_screen_name, ll_address_code, "A", li_month, li_year, ll_verif_response, li_dstatus) = -1 then //Start Code Change ----08.04.2008 #V85 maha - added datastatus argument
		of_Log(ll_ImportDataRow, "", IL_ERRTYPE_ADDVERIFY, "05-Error adding verification")
		Return -1
	end if
next

//Reset cache data
ids_verif_facilities.Reset()
ids_dfl_rsp_code.Reset()
ids_ver_orgs_facilities.Reset()
ids_parent_facilities.Reset()
ids_facility_forpt.Reset()
ids_facility_ver_rules.Reset()
ids_pd_hosp_facility_link.Reset()

//Update verifications
if ids_verif_info.ModifiedCount() > 0 then
	/*
	ll_min_rec_id = ids_intellisoft_table.GetItemNumber(ll_FirstRow, "rec_id")
	ll_max_rec_id = ids_intellisoft_table.GetItemNumber(ll_RowCount, "rec_id")
	of_SetVerifySeqNo(ll_min_rec_id, ll_max_rec_id)
	*/
	if ids_verif_info.Update() = 1 then
		of_CompleteTrans(true)
	else
		of_CompleteTrans(false)
		ids_verif_info.Reset()
		of_Log(0, "", IL_ERRTYPE_ADDVERIFY, ids_verif_info.is_SQLErrText)
		Return -1
	end if
end if
ids_verif_info.Reset()
w_import_progressbar.of_SkipNextPosition()

Return 1
end function

public function integer of_setprimarykey (string as_table_name);long ll_Row, i
long ll_rec_id
long ll_prac_id
long ll_InsertRow

// There is no new record
if il_CurrTableAddCount = 0 then Return 1
w_import_progressbar.of_SetImportProcessDesc("Set primary key value")

// Set primary key value
choose case as_table_name
	case "pd_basic"
		// Set prac_id, rec_id
		ll_prac_id = gnv_app.of_get_id("PRAC_ID", il_CurrTableAddCount)
		ll_rec_id = gnv_app.of_get_Id("RECORD_ID", il_CurrTableAddCount * 2)
		w_import_progressbar.of_SetMaxPosition(il_CurrTableAddCount)
		for i = 1 to il_CurrTableAddCount
			// For pd_basic
			ll_Row = ids_newrow.GetItemNumber(i, "new_row")
			ids_intellisoft_table.SetItem(ll_Row, "rec_id", ll_rec_id)
			ids_intellisoft_table.SetItem(ll_Row, "prac_id", ll_prac_id)
			
			// For pd_affil_stat
			ll_rec_id ++
			ll_InsertRow = ids_pd_affil_stat.InsertRow(0)
			of_set_pd_affil_stat_def(ids_pd_affil_stat, ll_InsertRow)
			ids_pd_affil_stat.SetItem(ll_InsertRow, "rec_id", ll_rec_id)
			ids_pd_affil_stat.SetItem(ll_InsertRow, "prac_id", ll_prac_id)
			ids_pd_affil_stat.SetItem(ll_InsertRow, "seq_no", 1)
		
			ll_rec_id ++
			ll_prac_id ++
			w_import_progressbar.of_SkipNextPosition()
		next
		
	case "pd_affil_stat"
		// Set rec_id, seq_no
		of_set_pd_affil_stat_key()
		
	case "pd_affil_dept", "pd_affil_staff_cat", "pd_affil_staff_leave", "pd_comm_review"
		// Set rec_id, seq_no
		of_set_appstatchild_key()
		
	case else // These are standard table structure
		// Set rec_id for current import table
		ll_rec_id = gnv_app.of_get_Id("RECORD_ID", il_CurrTableAddCount)
		w_import_progressbar.of_SetMaxPosition(il_CurrTableAddCount)
		for i = 1 to il_CurrTableAddCount
			ll_Row = ids_newrow.GetItemNumber(i, "new_row")
			ids_intellisoft_table.SetItem(ll_Row, "rec_id", ll_rec_id)
			ll_rec_id ++
			w_import_progressbar.of_SkipNextPosition()
		next
end choose

Return 1
end function

public function integer of_set_pd_affil_stat_key ();long i, ll_Row
long ll_rec_id
long ll_prac_id
long ll_RowCount
DataStore lds_sequence

w_import_progressbar.of_SetMaxPosition(il_CurrTableAddCount + 2)

lds_sequence = Create DataStore
lds_sequence.DataObject = "d_import_ds_sequence"
ll_RowCount = ids_intellisoft_table.RowCount()
lds_sequence.object.prac_id[1,ll_RowCount] = ids_intellisoft_table.object.prac_id[1,ll_RowCount]
lds_sequence.object.seq_no[1,ll_RowCount] = ids_intellisoft_table.object.seq_no[1,ll_RowCount]
w_import_progressbar.of_SkipNextPosition()

// Set rec_id
ll_rec_id = gnv_app.of_get_Id("RECORD_ID", il_CurrTableAddCount)
for i = 1 to il_CurrTableAddCount
	ll_Row = ids_newrow.GetItemNumber(i, "new_row")
	ids_intellisoft_table.SetItem(ll_Row, "rec_id", ll_rec_id)
	
	lds_sequence.object.row_num[ll_Row] = ll_Row	
	ll_rec_id ++
	w_import_progressbar.of_SkipNextPosition()
next

// Set seq_no
of_SetSequenceNo(lds_sequence, ids_intellisoft_table, il_CurrTableAddCount, "prac_id", "seq_no", true)
Destroy lds_sequence
w_import_progressbar.of_SkipNextPosition()

Return 1
end function

public function integer of_set_appstatchild_key ();long ll_Row, i
long ll_rec_id
long ll_prac_id
long ll_facility_id
long ll_FindRow
long ll_EndRow
long ll_FirstRow
long ll_RowCount
long ll_InsertRow
long ll_NewStatCount
long ll_RecIDRow[]
long ll_NoneRecIDRow[]
long ll_NoneRecIDRowCount
string ls_Find
DataStore lds_sequence1
DataStore lds_sequence2

w_import_progressbar.of_SetMaxPosition(il_CurrTableAddCount + 3)

lds_sequence1 = Create DataStore
lds_sequence2 = Create DataStore
lds_sequence1.DataObject = "d_import_ds_sequence"
lds_sequence2.DataObject = "d_import_ds_sequence"
ll_EndRow = ids_intellisoft_table.RowCount()
lds_sequence1.object.rec_id[1,ll_EndRow] = ids_intellisoft_table.object.rec_id[1,ll_EndRow]
lds_sequence1.object.seq_no[1,ll_EndRow] = ids_intellisoft_table.object.seq_no[1,ll_EndRow]
w_import_progressbar.of_SkipNextPosition()

////////////////////////////////////////////////////////////////////////////////////////////////////
// Set rec_id for appointment status child table
for i = 1 to il_CurrTableAddCount
	// Get prac_id and facility_id (Facility_id must include this field when dynamic create DW)
	ll_Row = ids_newrow.GetItemNumber(i, "new_row")
	ll_facility_id = ids_intellisoft_table.object.facility_id[ll_Row]
	if IsNull(ll_facility_id) then ll_facility_id = 1
	ll_prac_id = ids_intellisoft_table.GetItemNumber(ll_Row, "prac_id")

	// Set rec_id of current row
	ls_Find = "prac_id=" + String(ll_prac_id) + " AND parent_facility_id=" + String(ll_facility_id) + " AND active_status in (1,4)"
	ll_FindRow = ids_pd_affil_stat.Find(ls_Find, 1, ids_pd_affil_stat.RowCount())
	if ll_FindRow > 0 then
		// Set rec_id for appointment status child table if have match record
		ll_rec_id = ids_pd_affil_stat.object.rec_id[ll_FindRow]
		if not IsNull(ll_rec_id) then
			ids_intellisoft_table.object.rec_id[ll_Row] = ll_rec_id
			lds_sequence1.object.rec_id[ll_Row] = ll_rec_id
			lds_sequence1.object.row_num[ll_Row] = ll_Row
		else
			ll_NoneRecIDRowCount ++
			ll_NoneRecIDRow[ll_NoneRecIDRowCount] = ll_Row
			ll_RecIDRow[ll_NoneRecIDRowCount] = ll_FindRow
		end if
	else
		// Insert default record to ids_pd_affil_stat if no match record
		ll_InsertRow = ids_pd_affil_stat.InsertRow(0)
		of_set_pd_affil_stat_def(ids_pd_affil_stat, ll_InsertRow)
		ids_pd_affil_stat.object.prac_id[ll_InsertRow] = ll_prac_id
		ids_pd_affil_stat.object.parent_facility_id[ll_InsertRow] = ll_facility_id		
		ll_NewStatCount ++
		il_StatusAutoAddCount ++
		
		ll_NoneRecIDRowCount ++
		ll_NoneRecIDRow[ll_NoneRecIDRowCount] = ll_Row
		ll_RecIDRow[ll_NoneRecIDRowCount] = ll_InsertRow
		
		if ll_NewStatCount = 1 then
			ll_EndRow = ids_pd_affil_stat.RowCount()
			lds_sequence2.object.prac_id[1,ll_EndRow] = ids_pd_affil_stat.object.prac_id[1,ll_EndRow]
			lds_sequence2.object.seq_no[1,ll_EndRow] = ids_pd_affil_stat.object.seq_no[1,ll_EndRow]
		else
			lds_sequence2.InsertRow(0)
		end if
		lds_sequence2.object.prac_id[ll_InsertRow] = ll_prac_id
		lds_sequence2.object.row_num[ll_InsertRow] = ll_InsertRow
	end if
	w_import_progressbar.of_SkipNextPosition()
next

////////////////////////////////////////////////////////////////////////////////////////////////////
// Set rec_id again if ids_pd_affil_stat have new records
if ll_NewStatCount > 0 then
	// Set rec_id, seq_no for ids_pd_affil_stat
	ll_rec_id = gnv_app.of_get_id("RECORD_ID", ll_NewStatCount)
	ll_RowCount = ids_pd_affil_stat.RowCount()
	ll_FirstRow = ll_RowCount - ll_NewStatCount + 1
	for ll_Row = ll_FirstRow to ll_RowCount
		ids_pd_affil_stat.object.rec_id[ll_Row] = ll_rec_id
		ll_rec_id ++
	next
	of_SetSequenceNo(lds_sequence2, ids_pd_affil_stat, ll_NewStatCount, "prac_id", "seq_no", false)

	// Set rec_id for appointment status child table
	for i = 1 to ll_NoneRecIDRowCount
		ll_rec_id = ids_pd_affil_stat.GetItemNumber(ll_RecIDRow[i], "rec_id")
		ids_intellisoft_table.SetItem(ll_NoneRecIDRow[i], "rec_id", ll_rec_id)
		lds_sequence1.SetItem(ll_NoneRecIDRow[i], "rec_id", ll_rec_id)
		lds_sequence1.SetItem(ll_NoneRecIDRow[i], "row_num", ll_NoneRecIDRow[i])
	next
end if
w_import_progressbar.of_SkipNextPosition()

////////////////////////////////////////////////////////////////////////////////////////////////////
// Set seq_no for appointment status child table
of_SetSequenceNo(lds_sequence1, ids_intellisoft_table, il_CurrTableAddCount, "rec_id", "seq_no", true)

Destroy lds_sequence1
Destroy lds_sequence2
w_import_progressbar.of_SkipNextPosition()

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
choose case ls_table_name
	case "pd_address", "pd_hosp_facility", "pd_board_specialty", "pd_affil_stat", &
		  "pd_affil_dept", "pd_affil_staff_cat", "pd_affil_staff_leave", "pd_comm_review"
	   gnv_appeondb.of_StartQueue()
		ids_pd_affil_stat.Retrieve()
		ids_intellisoft_table.Retrieve()
		gnv_appeondb.of_CommitQueue()
	case else
		ids_intellisoft_table.Retrieve()
end choose
w_import_progressbar.of_SkipNextPosition()

// Populate data according to key fields
if of_DataPopulateProc() = -1 then Return -1
ids_intellisoft_table_temp.Reset()

// Set primary key value
of_SetPrimaryKey(ls_table_name)

// Cache foreign key to ids_imp_data
choose case ls_table_name
	case "pd_basic"
		of_CacheForeignKey("sys_pc_id", "prac_id")
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
	
//1.Get mapped fields of list
for i = 1 to ids_mapping_field.RowCount()
	ls_field_name = Lower(Trim(ids_mapping_field.object.field_name[i]))
	if Len(ls_Fields) > 0 then ls_Fields += ","
	ls_Fields += ls_field_name
next

//2.Add necessary fields to select SQL(Additional field must place at last)
//For temp DW
ls_FieldsTemp = ls_Fields + ",0 imp_row, 0 err_value, 0 sys_pc_id"
if AppeonGetClientType() = "PB" then
	ls_SQLSelectTemp = "SELECT " + ls_FieldsTemp + ",'' sort_field FROM " + as_table_name
else
	ls_SQLSelectTemp = "SELECT " + ls_FieldsTemp + " FROM " + as_table_name
end if

//For update DW
choose case as_table_name
	case "pd_affil_stat"
		ls_Fields += ",rec_id,prac_id,seq_no"
		if Pos(ls_Fields, "parent_facility_id") <= 0 then ls_Fields += ",parent_facility_id"
		if Pos(ls_Fields, "application_audit_facility") <= 0 then ls_Fields += ",application_audit_facility"
		if Pos(ls_Fields, "verifying_facility") <= 0 then ls_Fields += ",verifying_facility"
		if Pos(ls_Fields, "apptmnt_type") <= 0 then ls_Fields += ",apptmnt_type"
		if Pos(ls_Fields, "active_status") <= 0 then ls_Fields += ",active_status"
		if Pos(ls_Fields, "affiliation_status") <= 0 then ls_Fields += ",affiliation_status"
		if Pos(ls_Fields, "prov_status") <= 0 then ls_Fields += ",prov_status"
		li_Pos = Pos(ls_Fields, "priority_user")
		if li_Pos <= 0 then
			if Pos(ls_Fields, "priority") <= 0 then ls_Fields += ",priority"
			ls_Fields += ",priority_user"
		else
			if Pos(ls_Fields, "priority", li_Pos + 13) <= 0 then ls_Fields += ",priority"
		end if				

	case "pd_affil_dept", "pd_affil_staff_cat", "pd_affil_staff_leave", "pd_comm_review"
		ls_Fields += ",rec_id,prac_id,seq_no"
		
	case else
		ls_Fields += ",rec_id,prac_id"
end choose
if AppeonGetClientType() = "PB" then
	ls_SQLSelect = "SELECT " + ls_Fields + ",'' sort_field FROM " + as_table_name
else
	ls_SQLSelect = "SELECT " + ls_Fields + " FROM " + as_table_name
end if

//3.Dynamic create IntelliSoft table datawindow
gnv_appeondb.of_StartQueue()
ls_Syntax = SQLCA.SyntaxFromSQL(ls_SQLSelect, "", ls_Error)
ls_SyntaxTemp = SQLCA.SyntaxFromSQL(ls_SQLSelectTemp, "", ls_ErrorTemp)
gnv_appeondb.of_CommitQueue()
if Len(ls_Error) > 0 then
	of_Log(0, "", IL_ERRTYPE_MAPDESIGN, "Failed to dynamically create updatable DataWindow." + ls_Error)
	if not of_IsContinue() then Return -1
	Return -2
end if
if Len(ls_ErrorTemp) > 0 then
	of_Log(0, "", IL_ERRTYPE_MAPDESIGN, "Failed to dynamically create temporary DataWindow." + ls_ErrorTemp)
	if not of_IsContinue() then Return -1
	Return -2
end if

ids_intellisoft_table.Create(ls_Syntax, ls_Error)
ids_intellisoft_table.SetTransObject(SQLCA)
ids_intellisoft_table_temp.Create(ls_SyntaxTemp, ls_Error)
ids_intellisoft_table.object.datawindow.table.updatewhere = 0
ids_intellisoft_table.Modify("sort_field.update='no'")

Return 1
end function

public function integer of_postupdate ();//<Overwrite this function>
string ls_table_name

// Add link records of pd_address_link, pd_hosp_facility_link, pd_spec_facility_link
ls_table_name = Lower(ids_table_record.object.table_name[ids_table_record.GetRow()])
choose case ls_table_name
	case "pd_address", "pd_hosp_facility", "pd_board_specialty", "pd_affil_stat"
		if il_CurrTableAddCount > 0 then of_AddLinks(ls_table_name)
	case "pd_affil_dept", "pd_affil_staff_cat", "pd_affil_staff_leave", "pd_comm_review"
		if il_StatusAutoAddCount > 0 then of_AddLinks(ls_table_name)
end choose

// Add verifications and Audit trail data
if ids_intellisoft_table.ModifiedCount() > 0 then
	// Add verifications
	if ids_import_hdr.object.update_verifications[ids_import_hdr.GetRow()] = 1 then
		of_AddVerify()
	end if
	
	// Add Audit trail data
	of_FieldAudit()
end if

// Reset datastore
ids_pd_affil_stat.Reset()
ids_intellisoft_table.Reset()

Return 1
end function

public function integer of_preupdate ();//<Overwrite this function>
string ls_table_name

w_import_progressbar.of_SetImportProcessDesc("Prepare update ContractLogix table")
w_import_progressbar.of_SetMaxPosition(2)
w_import_progressbar.of_SkipNextPosition()

// Update ids_pd_affil_stat
if ids_pd_affil_stat.ModifiedCount() > 0 then
	if ids_pd_affil_stat.Update() = 1 then
		of_CompleteTrans(true)
	else
		of_CompleteTrans(false)
		of_Log(0, "", IL_ERRTYPE_UPDATE, ids_pd_affil_stat.is_SQLErrText)
		w_import_progressbar.of_SkipNextPosition()
		if not of_IsContinue() then Return -1
		Return -2
	end if
end if
w_import_progressbar.of_SkipNextPosition()

Return 1
end function

public function integer of_checkmapping (boolean ab_isimport, long al_table_id, string as_table_name, ref datastore ads_import_field, ref datastore ads_mapping_field, ref string as_errortext[]);//<Overwrite this function>
long ll_FindRow
string  ls_field_name
string  ls_field_name_allias
string  ls_imp_field_name
integer li_Return
integer li_KeyFieldCount
integer i, li_FieldCount
integer li_ErrorCount
string  ls_ref_field1
string  ls_ref_field2
string  ls_exp_field
boolean lb_IsFacilityExists = false
boolean lb_IsFacilityKeyField = false
boolean lb_IsCommitteeExists = false
boolean lb_IsRefField1Exists = false
boolean lb_IsRefField2Exists = false
boolean lb_IsExpFieldExists = false
boolean lb_IsAgencyFieldExists = false

//////////////////////////////////////////////////////////////////////////////////////////////
// There is no creation mapped relationship
li_FieldCount = ads_mapping_field.RowCount()
if li_FieldCount <= 0 then
	li_Return = of_Log(ab_IsImport, "No mapping relationship was created.", as_ErrorText[])
	if ab_IsImport then Return li_Return
	Return 1 //Have one error
end if

//////////////////////////////////////////////////////////////////////////////////////////////
// Get data view screen information
ll_FindRow = ids_dataview_screen.Find("table_id=" + String(al_table_id), 1, ids_dataview_screen.RowCount())
if ll_FindRow > 0 then
	ls_ref_field1 = Lower(ids_dataview_screen.GetItemString(ll_FindRow, "ref_field_1"))
	ls_ref_field2 = Lower(ids_dataview_screen.GetItemString(ll_FindRow, "ref_field_2"))
	ls_exp_field = Lower(ids_dataview_screen.GetItemString(ll_FindRow, "exp_field"))
end if

// Check IntelliSoft field name
for i = 1 to li_FieldCount
	// Get field name
	ls_field_name = Lower(Trim(ads_mapping_field.object.field_name[i]))
	ls_field_name_allias = ads_mapping_field.object.field_name_allias[i]
	ls_imp_field_name = Trim(ads_mapping_field.object.imp_field_name[i])
	
	// Set flags
	if ls_field_name = "facility_id" then
		lb_IsFacilityExists = true
		if ads_mapping_field.object.key_field[i] = 1 then lb_IsFacilityKeyField = true
	end if
	if ls_field_name = "committee_id" then lb_IsCommitteeExists = true
	if ls_field_name = "verifying_agency" then lb_IsAgencyFieldExists = true
	if ls_field_name = ls_ref_field1 then lb_IsRefField1Exists = true
	if ls_field_name = ls_ref_field2 then lb_IsRefField2Exists = true
	if ls_field_name = ls_exp_field then lb_IsExpFieldExists = true
	
	// Increase key field count
	if ads_mapping_field.object.key_field[i] = 1 then li_KeyFieldCount ++
		
	// Check field name if null
	if IsNull(ls_field_name) or Len(ls_field_name) <= 0 then
		li_Return = of_Log(ab_IsImport, "ContractLogix field can not be null. (import field is '" + ls_imp_field_name + "')", as_ErrorText[])
		if ab_IsImport then Return li_Return
	end if	
	if IsNull(ls_imp_field_name) then
		if IsNull(ads_mapping_field.object.facility_id[i]) then
			li_Return = of_Log(ab_IsImport, "Import field can not be null. (ContractLogix field is '" + ls_field_name_allias + "')", as_ErrorText[])
			if ab_IsImport then Return li_Return
		end if
	else
		if Len(ls_imp_field_name) <= 0 then	
			li_Return = of_Log(ab_IsImport, "Import field can not be null. (ContractLogix field is '" + ls_field_name_allias + "')", as_ErrorText[])
			if ab_IsImport then Return li_Return
		end if
	end if
next

//////////////////////////////////////////////////////////////////////////////////////////////
// Check key field
if li_KeyFieldCount = 0 then
	li_Return = of_Log(ab_IsImport, "There is no key field.", as_ErrorText[])
	if ab_IsImport then Return li_Return
end if

//////////////////////////////////////////////////////////////////////////////////////////////
// Check ref1, ref2, exp_date
if Len(ls_ref_field1) > 0 and not lb_IsRefField1Exists then
	li_Return = of_Log(ab_IsImport, "'" + of_ConvertFieldAlias(ls_ref_field1) + "' field is required.", as_ErrorText[])	
	if ab_IsImport then Return li_Return
end if
if Len(ls_ref_field2) > 0 and not lb_IsRefField2Exists then	
	li_Return = of_Log(ab_IsImport, "'" + of_ConvertFieldAlias(ls_ref_field2) + "' field is required.", as_ErrorText[])
	if ab_IsImport then Return li_Return
end if
if Len(ls_exp_field) > 0 and not lb_IsExpFieldExists then	
	li_Return = of_Log(ab_IsImport, "'" + of_ConvertFieldAlias(ls_exp_field) + "' field is required.", as_ErrorText[])
	if ab_IsImport then Return li_Return
end if

//////////////////////////////////////////////////////////////////////////////////////////////
// Check particular table
choose case as_table_name
	case "pd_license"
		if not lb_IsAgencyFieldExists then
			li_Return = of_Log(ab_IsImport, "'Verifying Agency' field is required.", as_ErrorText[])
			if ab_IsImport then Return li_Return
		end if
	case "pd_affil_dept", "pd_affil_staff_cat", "pd_affil_staff_leave", "pd_comm_review"
		if not lb_IsFacilityExists then	
			li_Return = of_Log(ab_IsImport, "'Facility Id' field is required.", as_ErrorText[])
			if ab_IsImport then Return li_Return	
		end if
		if not lb_IsFacilityKeyField then
			li_Return = of_Log(ab_IsImport, "'Facility Id' field must be key field.", as_ErrorText[])
			if ab_IsImport then Return li_Return
		end if
		if as_table_name = "pd_comm_review" then
			if not lb_IsCommitteeExists then
				li_Return = of_Log(ab_IsImport, "'Committee Id' field is required.", as_ErrorText[])
				if ab_IsImport then Return li_Return
			end if
		end if		
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
long ll_prac_id
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
string  ls_KeyField2[]
boolean lb_IsAdd
boolean lb_IsNewRow[]
long    ll_SetDefValueRow[]

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
ls_KeyField2[] = ls_KeyField1[]
choose case ls_table_name
	case "pd_basic"
	case else // Child table of pd_basic
		ls_KeyField1[li_KeyFieldCount + 1] = "prac_id"
		ls_KeyField2[li_KeyFieldCount + 1] = "sys_pc_id"
end choose
ids_intellisoft_table.of_CreateFindColumn(ls_KeyField1[])
ids_intellisoft_table_temp.of_CreateFindColumn(ls_KeyField2[])
w_import_progressbar.of_SkipNextPosition()

// Populate data according to key fields
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
	
	if ll_FindRow > 0 then
		lb_IsAdd = false
		il_CurrTableModifyCount ++
	else
		lb_IsAdd = true
		ll_FindRow = Abs(ll_FindRow)
		if ls_table_name = "pd_basic" then
			if li_add_protocol = 0 then
				of_Log(ll_ImportDataRow, "Key Field", IL_ERRTYPE_MAPDESIGN, "When 'No Match Setting'='Generate Error', it's not allowed to add new practitioner.")
				if not of_IsContinue() then Return -1
				Continue
			end if
		else
			ll_prac_id = ids_intellisoft_table_temp.GetItemNumber(ll_Row, "sys_pc_id")
			if ll_prac_id > 0 then
				ids_intellisoft_table.SetItem(ll_FindRow, "prac_id", ll_prac_id)
			else
				Continue
			end if
		end if
		il_CurrTableAddCount ++
		ids_newrow.InsertRow(0)
		ids_newrow.SetItem(il_CurrTableAddCount, "new_row", ll_FindRow)
		ids_newrow.SetItem(il_CurrTableAddCount, "imp_row", ll_ImportDataRow)
	end if
	lb_IsNewRow[upperbound(lb_IsNewRow) + 1] = lb_IsAdd
	ll_SetDefValueRow[upperbound(ll_SetDefValueRow) + 1] = ll_FindRow
	
	// Replace value of ids_intellisoft_table with ids_intellisoft_table_TEMP
	for i = 1 to li_FieldCount
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
		case "pd_basic"
			// Record row number of sys_pc_id(prac_id)
			ids_imp_data.SetItem(ll_ImportDataRow, "sys_pc_id", ll_FindRow)
	end choose
next

// Stop import data
if of_IsStopImport() then Return -1

// Set default value with project's default value
of_SetDefaultValue(ls_table_name, lb_IsNewRow[], ll_SetDefValueRow[])

Return 1
end function

public function long of_set_pd_affil_stat_def (ref datastore ads_data, long al_row);long ll_CurrentRow

// Set default value directly for following fields
if IsNull(ads_data.object.priority[al_Row]) then
	ads_data.object.priority[al_Row] = 1
end if
if IsNull(ads_data.object.prov_status[al_Row]) then
	ads_data.object.prov_status[al_Row] = 0
end if

// Set default value with project's default value for following fields
ll_CurrentRow = ids_import_hdr.GetRow()
if IsNull(ads_data.object.parent_facility_id[al_Row]) then
	if IsNull(ids_import_hdr.object.def_parent_id[ll_CurrentRow]) then
		ads_data.object.parent_facility_id[al_Row] = 1
	else
		ads_data.object.parent_facility_id[al_Row] = ids_import_hdr.object.def_parent_id[ll_CurrentRow]
	end if
end if

if IsNull(ads_data.object.application_audit_facility[al_Row]) then
	if IsNull(ids_import_hdr.object.def_audit_id[ll_CurrentRow]) then
		ads_data.object.application_audit_facility[al_Row] = 1
	else
		ads_data.object.application_audit_facility[al_Row] = ids_import_hdr.object.def_audit_id[ll_CurrentRow]
	end if
end if

if IsNull(ads_data.object.verifying_facility[al_Row]) then
	if IsNull(ids_import_hdr.object.def_verif_id[ll_CurrentRow]) then
		ads_data.object.verifying_facility[al_Row] = 1
	else
		ads_data.object.verifying_facility[al_Row] = ids_import_hdr.object.def_verif_id[ll_CurrentRow]
	end if
end if

if IsNull(ads_data.object.apptmnt_type[al_Row]) then
	if IsNull(ids_import_hdr.object.def_appt_type[ll_CurrentRow]) then
		ads_data.object.apptmnt_type[al_Row] = "I"
	else
		ads_data.object.apptmnt_type[al_Row] = ids_import_hdr.object.def_appt_type[ll_CurrentRow]
	end if
end if

if IsNull(ads_data.object.active_status[al_Row]) then
	if IsNull(ids_import_hdr.object.def_status[ll_CurrentRow]) then
		ads_data.object.active_status[al_Row] = 1
	else
		ads_data.object.active_status[al_Row] = ids_import_hdr.object.def_status[ll_CurrentRow]
	end if
end if

if IsNull(ads_data.object.affiliation_status[al_Row]) then
	if IsNull(ids_import_hdr.object.def_affil_stat[ll_CurrentRow]) then
		ads_data.object.affiliation_status[al_Row] = "M"
	else
		if Len(ids_import_hdr.GetItemString(ll_CurrentRow, "def_affil_stat")) > 1 then
			ads_data.object.affiliation_status[al_Row] = "M"
		else
			ads_data.object.affiliation_status[al_Row] = ids_import_hdr.object.def_affil_stat[ll_CurrentRow]
		end if
	end if
end if

if IsNull(ads_data.object.priority_user[al_Row]) then
	if IsNull(ids_import_hdr.object.def_user[ll_CurrentRow]) then
		ads_data.object.priority_user[al_Row] = "PUBLIC"
	else
		ads_data.object.priority_user[al_Row] = ids_import_hdr.object.def_user[ll_CurrentRow]
	end if
end if

Return 1
end function

public function integer of_setdefaultvalue (string as_table_name, ref boolean ab_isnewrow[], ref long al_setdefvaluerow[]);long i, ll_RowCount

ll_RowCount = UpperBound(al_SetDefValueRow)

for i = 1 to ll_RowCount
	choose case as_table_name
		case "pd_affil_stat"
			// Set default value
			of_set_pd_affil_stat_def(ids_intellisoft_table, al_SetDefValueRow[i])
	end choose
next

Return 1
end function

public function integer of_addverify (long al_prac_id, long al_rec_id, long al_screen_id, string as_reference, datetime adt_exp_date, string as_screen_name, long al_address_lookup_code, string as_add_type, integer as_end_month, integer as_end_year, long as_complete_response, integer ai_data_status);//Start Code Change ----.2008 #V85 maha - added ai_data_status parameter
long ll_nr1
long ll_nr2
long li_row_cnt
long ll_RowCount
long i, r, ll_i
long pc, pi, resp
long ll_hc_code
long ll_seq_no
long ll_rsp_rc
long li_facility_id
long ll_default_verif_method
string  ls_identifying_number
string  ls_facility_name
String  ls_doc_id
string  ls_priority_user
string  ls_primary_check
string  ls_screen_name
string  ls_appt_type = "R"
string  ls_verif_data
string  ls_Filter
integer li_priority
integer li_dupe_check
integer li_isprime
integer li_parent_id
integer li_date_check
integer li_fac_ids
integer li_end_year
integer li_end_month
integer li_end_day
integer li_check_back_years
integer li_prime_check
date ld_hosp_check_date
date ld_data_check_date
datetime ld_dr
datetime ld_verifdate

////////////////////////////////////////////////////////////////////////////////////////////
// Get identifying number
if al_address_lookup_code = 0 then SetNull(al_address_lookup_code)
ls_identifying_number = Mid(as_Reference, Pos(as_Reference, "-") + 2, 100)

// filter data
ls_Filter = "prac_id=" + String(al_prac_id)
ll_RowCount = ids_verif_facilities.of_Filter(ls_Filter)
if ll_RowCount = 0 then Return -1
if ids_verif_facilities.Find("upper(verify_data) <> 'N' OR isnull(verify_data)" , 1, ll_RowCount) <= 0 then
	Return 1
end if
ids_verif_facilities.SetSort("verifying_facility A")
ids_verif_facilities.Sort()

ls_Filter = "prac_id=" + String(al_prac_id) + " AND identifying_number='" + ls_identifying_number + "'"
ll_rsp_rc = ids_dfl_rsp_code.of_Filter(ls_Filter)
if al_screen_id = 10 then
	ls_Filter = "hosp_affil_id=" + String(al_rec_id)
	ids_pd_hosp_facility_link.of_Filter(ls_Filter)
end if

////////////////////////////////////////////////////////////////////////////////////////////
// Add verifcation records
for i = 1 to ll_RowCount
	li_date_check = 0
	li_facility_id = ids_verif_facilities.GetItemNumber(i, "verifying_facility")
	ls_facility_name = ids_verif_facilities.GetItemstring(i, "facility_name")
	ls_verif_data = ids_verif_facilities.GetItemstring(i, "verify_data")
	if ls_verif_data = "N" or isnull(ls_verif_data) then Continue
	
	ls_Filter = "prac_id=" + String(al_prac_id) + " AND pd_affil_stat_verifying_facility=" + String(li_facility_id)
	pc = ids_parent_facilities.of_Filter(ls_Filter)
	
	//checking all parents appttype to see if verif should be Created maha 012401
	ls_appt_type = "R"
	for pi = 1 to pc
		if ls_appt_type = "R" and ids_parent_facilities.GetItemstring(pi, "apptmnt_type")  = "I" then
			ls_appt_type = "I"
		end if
		//checking verifs completed date for all parents	
		ld_verifdate = ids_parent_facilities.GetItemdatetime(pi, "date_verif_completed")
		if not(isnull(ld_verifdate)) then
			li_date_check = 1
		end if
	next
	//if ALL parents are recred and data item is Inital only, don't Create.
	if ls_verif_data = "I" and ls_appt_type = "R" then Continue

	ls_Filter = "prac_id=" + String(al_prac_id) + " AND pd_affil_stat_verifying_facility=" + String(li_facility_id)
	r = ids_ver_orgs_facilities.of_Filter(ls_Filter)
	if r < 1 then Continue	
	if ids_ver_orgs_facilities.GetItemString(r, "verify_data") = "N" AND as_add_type = "A" then
		Continue
	end if
	
	//check check_back_years field  for reappointments maha 012301
	if al_screen_id = 10 or al_screen_id = 7 or al_screen_id = 6 then
		li_check_back_years = ids_ver_orgs_facilities.GetItemNumber(r,"check_back_years")
		if ids_ver_orgs_facilities.GetItemstring(r,"apptmnt_type") = "R" and li_check_back_years  > 0 then
			if as_add_type = "A" then //coming from dataentry preupdate
				li_end_year = as_end_year
				li_end_month = as_end_month
			else //forcing verification from menu 
			end if
			if not(isnull(li_end_year))  then
				if not(isnull(ids_ver_orgs_facilities.GetItemdatetime(r,"check_date"))) then
					if isnull(li_end_month) then li_end_month = 12 //set to end of year if null
					choose case li_end_month
					case 2
						li_end_day = 28
					case 4,6,9,11
						li_end_day = 30
					case else
						li_end_day = 31
					end choose
					ld_hosp_check_date = date(li_end_year,li_end_month, li_end_day)
					ld_data_check_date = date(ids_ver_orgs_facilities.GetItemdatetime(r,"check_date"))
					if relativedate(ld_hosp_check_date,li_check_back_years * 365) < ld_data_check_date then continue	
				end if
			end if
		end if
	end if
	
	//Check for primary hospital only
	if al_screen_id = 10 then
		ls_primary_check = ""
		ll_i = ids_facility_ver_rules.Find("facility_id = " + String(li_facility_id) ,1 , ids_facility_ver_rules.Rowcount())
		if ll_i > 0 Then ls_primary_check = ids_facility_ver_rules.GetItemString(ll_i,"exp_reminder_doc")

		if ls_primary_check = "Y" then
			li_isprime = 0
			for pi = 1 to pc  //check each parent for primary hosp maha 020801
				li_parent_id =  ids_parent_facilities.GetItemnumber(pi, "parent_facility_id")
				li_prime_check = 0
				ll_i = ids_pd_hosp_facility_link.Find("facility_id = " + String(li_parent_id), 1 , ids_pd_hosp_facility_link.Rowcount())
				if ll_i > 0 Then li_prime_check = ids_pd_hosp_facility_link.Getitemnumber(ll_i , "primary_hosp")
				if li_prime_check = 581 then 	li_isprime = 1 //yes
			next
			if li_isprime = 0 then Continue//cancel if not yes
		end if
	end if		
	ll_default_verif_method = ids_ver_orgs_facilities.GetItemNumbeR(r, "default_verif_means")		

	ll_nr1 = ids_verif_info.InsertRow(0)
	ls_priority_user = ids_ver_orgs_facilities.GetItemString(r, "priority_user")	
	li_priority = ids_ver_orgs_facilities.GetItemNumber(r, "priority")	
	ids_verif_info.SetItem(ll_nr1, "prac_id", al_prac_id)
	ids_verif_info.SetItem(ll_nr1, "rec_id", al_rec_id)
	//ids_verif_info.SetItem(ll_nr1, "facility_id", li_facility_id)
	ids_verif_info.SetItem(ll_nr1, "verif_info_facility_id", li_facility_id)
	ids_verif_info.SetItem(ll_nr1, "priority_user", ls_priority_user)
	ids_verif_info.SetItem(ll_nr1, "priority", li_priority)
	ids_verif_info.SetItem(ll_nr1, "number_sent", 0)
	ids_verif_info.SetItem(ll_nr1, "exp_credential_flag", 0)
	ids_verif_info.SetItem(ll_nr1, "verification_method", ll_default_verif_method)
	ids_verif_info.SetItem(ll_nr1, "verif_info_data_status", ai_data_status )  //Start Code Change ----08.04.2008 #V85 maha - added ; //Start Code Change ----09.17.2008 #V85 maha - corrected field name

	//added in for IntelliApp only users,  need this entry auto verified so intellicred can gen exp letters when due
	//Start Code Change ---- 10.26.2006 #1 maha
	//modified to use the as_complete_response argument from the dw_detail preupdate event
	if as_complete_response > 0 then //complete with the response code
		  ids_verif_info.SetItem(ll_nr1, "response_code", as_complete_response)		
		  ld_dr = DateTime(Today(), Now())
		  ids_verif_info.SetItem(ll_nr1, "date_recieved", ld_dr)					  
		  ids_verif_info.SetItem(ll_nr1, "user_name", gs_user_id)	
		  if ai_data_status = 2 then ids_verif_info.SetItem(ll_nr1, "exp_credential_flag", 2) //Start Code Change ----08.04.2008 #V85 maha- for historical status set to not create exp verif
	end if	
	
	ll_seq_no = 1
	ids_verif_info.SetItem(ll_nr1, "seq_no", ll_seq_no)		
	ids_verif_info.SetItem(ll_nr1, "screen_id", al_screen_id)
	ids_verif_info.SetItem(ll_nr1, "reference_value",mid(as_reference,1,100))
	ids_verif_info.SetItem(ll_nr1, "expiration_date", adt_exp_date)
	ids_verif_info.SetItem(ll_nr1, "screen_name", as_screen_name)
	ids_verif_info.SetItem(ll_nr1, "address_lookup_code", al_address_lookup_code)
	ls_doc_id = String(al_rec_id) + "-" + String(al_prac_id) + "-" + String(li_facility_id) +  "-" + String(ll_seq_no)
	ids_verif_info.SetItem(ll_nr1, "doc_id", ls_doc_id)
	
	li_dupe_check = 0
	ll_i = ids_facility_forpt.Find("facility_id = " + String(li_facility_id) ,1 , ids_facility_forpt.Rowcount())
	if ll_i > 0 Then li_dupe_check = ids_facility_forpt.GetItemNumber(ll_i,"dupeset")

	//if so, Create second letter
	if li_dupe_check = 1 then
		if al_screen_id = 7 or al_screen_id = 10 then
			ls_appt_type = ids_ver_orgs_facilities.GetItemString(1, "apptmnt_type")
			if ls_appt_type = "I" then
				ll_nr2 = ids_verif_info.InsertRow(0)
				ids_verif_info.SetItem(ll_nr2, "prac_id", al_prac_id)
				ids_verif_info.SetItem(ll_nr2, "rec_id", al_rec_id)
				ids_verif_info.SetItem(ll_nr2, "verif_info_facility_id", li_facility_id)
				ids_verif_info.SetItem(ll_nr2, "priority_user", ls_priority_user)
				ids_verif_info.SetItem(ll_nr2, "priority", li_priority)
				ids_verif_info.SetItem(ll_nr2, "number_sent", 0)
				ids_verif_info.SetItem(ll_nr2, "exp_credential_flag", 0)
				if ll_rsp_rc = 1 then
					ids_verif_info.SetItem(ll_nr2, "response_code", ids_dfl_rsp_code.GetItemNumber(1, "default_ver_response"))
					ids_verif_info.SetItem(ll_nr2, "user_name", ls_priority_user)
					ids_verif_info.SetItem(ll_nr2, "date_recieved", Today())
					ids_verif_info.SetItem(ll_nr2, "verification_method", ll_hc_code)				
				else
					ids_verif_info.SetItem(ll_nr2, "verification_method", ll_default_verif_method)		
				end if
	
				ll_seq_no++
				ids_verif_info.SetItem(ll_nr2, "seq_no", ll_seq_no)
				ids_verif_info.SetItem(ll_nr2, "screen_id", al_screen_id)
				ids_verif_info.SetItem(ll_nr2, "reference_value", as_reference)
				ids_verif_info.SetItem(ll_nr2, "expiration_date", adt_exp_date)
				ls_screen_name = as_screen_name + "_CC" 
				ids_verif_info.SetItem(ll_nr2, "screen_name", ls_screen_name)
				ids_verif_info.SetItem(ll_nr2, "verification_id", 2)
				ids_verif_info.SetItem(ll_nr2, "address_lookup_code", al_address_lookup_code)
				ls_doc_id = String(al_rec_id) + "-" + String(al_prac_id) + "-" + String(li_facility_id) +  "-" + String(ll_seq_no)
				ids_verif_info.SetItem(ll_nr2, "doc_id", ls_doc_id)
			end if
		end if
	end if
next

Return 1
end function

on n_cst_import_credapp.create
call super::create
end on

on n_cst_import_credapp.destroy
call super::destroy
end on

event constructor;call super::constructor;//Inherit
ids_pd_affil_stat = Create n_import_ds
ids_verif_facilities = Create n_import_ds
ids_dfl_rsp_code = Create n_import_ds
ids_ver_orgs_facilities = Create n_import_ds
ids_parent_facilities = Create n_import_ds
ids_facility_forpt = Create n_import_ds
ids_facility_ver_rules = Create n_import_ds
ids_pd_hosp_facility_link = Create n_import_ds
ids_verif_info = Create n_import_ds

ids_pd_affil_stat.DataObject = "d_import_ds_pd_affil_stat"
ids_verif_facilities.DataObject = "d_import_ds_verify_orgs_facilities"
ids_dfl_rsp_code.DataObject = "d_import_ds_app_audit_resp_code"
ids_ver_orgs_facilities.DataObject = "d_import_ds_verify_orgs_facilities_forpt"
ids_parent_facilities.DataObject = "d_import_ds_verify_parents_of_vers_forpt"
ids_facility_forpt.DataObject = "d_import_ds_facility_forpt"
ids_facility_ver_rules.DataObject = "d_import_ds_facility_ver_rules_forpt"
ids_pd_hosp_facility_link.DataObject = "d_import_ds_pd_hosp_facility_link_forpt"
ids_verif_info.DataObject = "d_ver_summary_record_view"

ids_pd_affil_stat.SetTransObject(SQLCA)
ids_verif_facilities.SetTransObject(SQLCA)
ids_dfl_rsp_code.SetTransObject(SQLCA)
ids_ver_orgs_facilities.SetTransObject(SQLCA)
ids_parent_facilities.SetTransObject(SQLCA)
ids_facility_forpt.SetTransObject(SQLCA)
ids_facility_ver_rules.SetTransObject(SQLCA)
ids_pd_hosp_facility_link.SetTransObject(SQLCA)
ids_verif_info.SetTransObject(SQLCA)

inv_data_entry = Create pfc_cst_nv_data_entry_functions
end event

event destructor;call super::destructor;//Inherit
Destroy ids_pd_affil_stat
Destroy ids_verif_facilities
Destroy ids_dfl_rsp_code
Destroy ids_ver_orgs_facilities
Destroy ids_parent_facilities
Destroy ids_facility_forpt
Destroy ids_facility_ver_rules
Destroy ids_pd_hosp_facility_link
Destroy ids_verif_info

Destroy inv_data_entry
end event

event ue_complete;call super::ue_complete;//Inherit <Reset all of datastore>
ids_pd_affil_stat.Reset()

ids_verif_facilities.Reset()
ids_dfl_rsp_code.Reset()
ids_ver_orgs_facilities.Reset()
ids_parent_facilities.Reset()
ids_facility_forpt.Reset()
ids_facility_ver_rules.Reset()
ids_pd_hosp_facility_link.Reset()
ids_verif_info.Reset()
end event

