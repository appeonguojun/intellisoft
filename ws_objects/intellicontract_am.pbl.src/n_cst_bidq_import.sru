$PBExportHeader$n_cst_bidq_import.sru
forward
global type n_cst_bidq_import from nonvisualobject
end type
end forward

global type n_cst_bidq_import from nonvisualobject
event ue_importprocess ( )
end type
global n_cst_bidq_import n_cst_bidq_import

type variables
decimal idc_PercentCount
boolean ib_DragImport
boolean ib_AttachAll

DataWindow idw_document
DataWindow idw_contract
StaticText it_progress
HProgressBar ihpb_progress
w_bidq_import_document iw_window
DataWindow idw_bidq			// 03/09/12 Added By mark 
long				il_attachfile, il_failedcnt	// 03/13/12 Added By mark 
DataWindow idw_contact //Added By Jay Chen 01-27-2014
end variables

forward prototypes
public function integer of_importdocument (long al_contractrow, long al_documentrow)
public function long of_getdatalength (long al_bidq_doc_id, ref long al_image_loops, ref long al_text_loops)
public function blob of_downloadfile (long al_bidq_doc_id, long al_image_roops)
public function string of_downloadtext (long al_bidq_doc_id, long al_text_roops)
public function integer of_initprogressbar (long al_stepcount)
public function integer of_execute (w_bidq_import_document aw_window, boolean ab_dragimport)
public function decimal of_calculatesteppercent ()
public function integer of_addprocesspercent (decimal adc_steppercent)
public subroutine of_auto_batch_modify_owner (integer al_ctx_id[])
end prototypes

event ue_importprocess();long ll_ContractRow
long ll_DocumentRow
Decimal ldc_StepPercent
String ls_auto_modify_owner //Added By Jay Chen 01-27-2014
long ll_ctx_id[] //Added By Jay Chen 01-27-2014

// Set all controls as disabled
iw_window.of_ControlEnabled(false)

// Initialize variables
ldc_StepPercent = of_CalculateStepPercent()
of_AddProcessPercent(0)

// Execute import process
if ib_AttachAll then
	for ll_ContractRow = 1 to idw_contract.RowCount()
		Yield()
		idw_contract.ScrollToRow(ll_ContractRow)
		idw_document.SetRow(ll_DocumentRow)
		ll_ctx_id[ll_ContractRow] = idw_contract.object.ctx_id[ll_ContractRow] //Added By Jay Chen 01-27-2014
		if ib_DragImport then
			ll_DocumentRow = idw_document.GetRow()
			idw_document.ScrollToRow(ll_DocumentRow)
			idw_document.SetRow(ll_DocumentRow)
			of_ImportDocument(ll_ContractRow, ll_DocumentRow)
			of_AddProcessPercent(ldc_StepPercent)
		else
			for ll_DocumentRow = 1 to idw_document.RowCount()
				Yield()
				if idw_document.object.selected[ll_DocumentRow] = 1 then
					idw_document.ScrollToRow(ll_DocumentRow)
					idw_document.SetRow(ll_DocumentRow)
					of_ImportDocument(ll_ContractRow, ll_DocumentRow)
					of_AddProcessPercent(ldc_StepPercent)
				end if
			next
		end if
	next
else
	ll_ContractRow = idw_contract.GetRow()
	ll_ctx_id[ll_ContractRow] = idw_contract.object.ctx_id[ll_ContractRow] //Added By Jay Chen 01-27-2014
	if ib_DragImport then
		ll_DocumentRow = idw_document.GetRow()
		idw_document.ScrollToRow(ll_DocumentRow)
		idw_document.SetRow(ll_DocumentRow)
		of_ImportDocument(ll_ContractRow, ll_DocumentRow)
		of_AddProcessPercent(ldc_StepPercent)
	else
		for ll_DocumentRow = 1 to idw_document.RowCount()
			Yield()
			if idw_document.object.selected[ll_DocumentRow] = 1 then
				idw_document.ScrollToRow(ll_DocumentRow)
				idw_document.SetRow(ll_DocumentRow)
				of_ImportDocument(ll_ContractRow, ll_DocumentRow)
				of_AddProcessPercent(ldc_StepPercent)
			end if
		next
	end if
end if

//Added By Jay Chen 01-27-2014
ls_auto_modify_owner = gnv_user_option.of_get_option_value(gs_user_id, "auto_modify_owner")
If  ls_auto_modify_owner = '1'  Then
	of_auto_batch_modify_owner(ll_ctx_id[])
end if

of_AddProcessPercent(100)

// Set all controls as enabled
iw_window.of_ControlEnabled(true)
end event

public function integer of_importdocument (long al_contractrow, long al_documentrow);long   ll_doc_id
long   ll_ctx_id
long   ll_category
long   ll_status
long   ll_bidq_doc_id
long   ll_image_roops
long   ll_text_roops
string ls_doc_name
string ls_doc_type
string ls_doc_ext
string ls_filename
string ls_doc_from_type
string ls_doc_from_name
string ls_notes
string ls_pdftext
string ls_doc_ext_full
DateTime ldt_CurrTime,	ldt_received_date
blob lblb_Data
n_cst_dm_utils lnv_dm_utils
str_add_audit lstr_add_audit
string 	ls_docname,	ls_received_by		// 03/09/12 Added By mark 
long 		ll_ctx_bidq			// 03/09/12 Added By mark 

// 03/13/12 Added By mark 
il_attachfile ++

// Get import information
ll_doc_id = gnv_app.of_get_id("doc_id")
ll_ctx_id = idw_contract.object.ctx_id[al_ContractRow]
ls_doc_name = idw_document.object.doc_name[al_DocumentRow]
// 03/09/12 Added By mark 
ls_docname = ls_doc_name
ls_doc_name = lnv_dm_utils.of_get_filename(ls_doc_name)
ls_doc_type = idw_document.object.doc_type[al_DocumentRow]
ls_filename = idw_document.object.filename[al_DocumentRow]
ls_doc_ext = lnv_dm_utils.of_get_fileext(ls_filename)
ls_doc_ext_full = lnv_dm_utils.of_get_fileext(ls_filename,true)	// jervis 12.24.2009
ll_category = idw_document.object.category[al_DocumentRow]
ls_doc_from_name = idw_document.object.doc_from_name[al_DocumentRow]
ls_notes = idw_document.object.notes[al_DocumentRow]
ls_received_by	= idw_document.object.received_by[al_DocumentRow]
ldt_received_date = idw_document.object.received_date[al_DocumentRow]
ll_status = idw_document.object.status[al_DocumentRow]
ldt_CurrTime = DateTime(Today(), Now())
if isnull(ll_status) or ll_status = 0 then //Added By Mark Lee 09/22/2014
	ll_status = Long(gnv_data.of_getitem( 'code_lookup', 'lookup_code', "upper(lookup_name) = upper('Contract Document Status') and upper(code) = upper('New')"))
end if 

if IsNull(ls_doc_from_name) then
	ls_doc_from_type = "2"
else
	ls_doc_from_type = "1"
end if

// Get data length and initialize progress bar
ll_bidq_doc_id = idw_document.object.bidq_doc_id[al_DocumentRow]
of_GetDataLength(ll_bidq_doc_id, ll_image_roops, ll_text_roops)
of_InitProgressBar(ll_text_roops + ll_image_roops + 3)

ihpb_progress.Position += 1

// Download image text
ls_pdftext = of_DownloadText(ll_bidq_doc_id, ll_text_roops)
//Added By Mark Lee 09/22/2014	add the column received_by and received_date.
// Insert a record to ctx_am_document table	
gnv_appeondb.of_StartQueue()
INSERT INTO ctx_am_document
(
  doc_id,            //System generate
  ctx_id,            //From user selected
  doc_name,
  revision,          //1.0
  revision_control,  //1
  doc_type,
  doc_ext,           //From filename
  category,
  base_type,         //3(Document from local file)
  create_by,         //Current login user name
  create_date,       //Current time
  status,            //117215(New)
  status_by,         //Current login user name
  status_date,       //Current time
  checkout_status,   //0
  filename,
  doc_from_type,     //1 if doc_from_name is not null, otherwise 2
  doc_from_name,
  notes,
  received_by,
  received_date
)
VALUES (:ll_doc_id, :ll_ctx_id, :ls_doc_name, 1.0, '1', :ls_doc_type, :ls_doc_ext, :ll_category, '3', &
        :gs_user_id, :ldt_CurrTime, :ll_status, :gs_user_id, :ldt_CurrTime, 0, :ls_filename, &
		  :ls_doc_from_type, :ls_doc_from_name, :ls_notes,:ls_received_by,:ldt_received_date);

//Added By Mark Lee 09/25/2014
if AppeonGetClientType() = 'PB' then
	if sqlca.sqlcode <> 0 then 
		gnv_debug.of_output( true, "of_importdocument: "+SQLCA.SQLErrText)
	end if
end if 

// Insert a record to ctx_am_doc_image table
//Add doc_ext_full - jervis 12.24.2009
INSERT INTO ctx_am_doc_image
(
  doc_id,
  revision,    //1.0
  modify_date, //Current time
  doc_ext,
  pdftext,
  doc_ext_full
)
VALUES (:ll_doc_id, 1.0, :ldt_CurrTime, :ls_doc_ext, :ls_pdftext,:ls_doc_ext_full);
//gnv_appeondb.of_CommitQueue()
//ihpb_progress.Position += 1

//Added By Mark Lee 09/25/2014
if AppeonGetClientType() = 'PB' then
	if sqlca.sqlcode <> 0 then 
		gnv_debug.of_output( true, "of_importdocument: "+SQLCA.SQLErrText)
	end if
end if 

//Modified by Ken.Guo 2011-12-01. Improve Performance
// Upload image data to ctx_am_doc_image table
//lblb_Data = of_DownloadFile(ll_bidq_doc_id, ll_image_roops)
//UPDATEBLOB ctx_am_doc_image
//SET image_file = :lblb_Data
//WHERE doc_id = :ll_doc_id AND revision = 1.0;
UPDATE ctx_am_doc_image
SET image_file = (	SELECT image_file
							FROM ctx_bidq_doc
							WHERE bidq_doc_id = :ll_bidq_doc_id)
WHERE doc_id = :ll_doc_id AND revision = 1.0;

//Added By Mark Lee 09/25/2014
if AppeonGetClientType() = 'PB' then
	if sqlca.sqlcode <> 0 then 
		gnv_debug.of_output( true, "of_importdocument: "+SQLCA.SQLErrText)
	end if
end if 

// 03/09/12 Added By mark 	//ctx_bidq
If idw_bidq.rowcount() > 0 then 
	ll_ctx_bidq = idw_bidq.GetItemNumber(idw_bidq.getrow(),'bidq_id')
Else
	setnull(ll_ctx_bidq)
End if 
INSERT INTO bidq_log_info
           (style,ctx_bidq, doc_id, doc_name, paths, errmsg,
			  pass_fail, user_id, log_date, ctx_id)
     VALUES('2',:ll_ctx_bidq,:ll_doc_id, :ls_docname,:ls_filename,'',
			'Success',:gs_user_id,:ldt_CurrTime,:ll_ctx_id)
  Using Sqlca;

gnv_appeondb.of_CommitQueue()

ihpb_progress.Position += 1

// 03/12/12 Added By mark 
if sqlca.sqlcode <> 0 then 
	il_failedcnt++
	INSERT INTO bidq_log_info
		  (style,ctx_bidq, doc_id, doc_name, paths, errmsg,
		  pass_fail, user_id, log_date, ctx_id)
	VALUES('2',:ll_ctx_bidq,:ll_doc_id, :ls_docname,:ls_filename,'Attach of CommitQueue Failing. '+ left(SQLCA.SQLErrText, 1950 ),
		'Failure',:gs_user_id,:ldt_CurrTime,:ll_ctx_id)
	Using Sqlca;	
	gnv_debug.of_output( true, "of_importdocument: "+SQLCA.SQLErrText)
end if 

// Add audit records
lstr_add_audit.doc_id = ll_doc_id
lstr_add_audit.revision = 1.0
lstr_add_audit.filename = ls_filename
lstr_add_audit.doc_from_name = ls_doc_from_name
lstr_add_audit.doc_from_type = ls_doc_from_type
lstr_add_audit.notes = ls_notes
lstr_add_audit.doc_ext = ls_doc_ext
lstr_add_audit.action = "New - Existing"
lnv_dm_utils.of_add_audit_trail(lstr_add_audit)
ihpb_progress.Position += 1

Return 1
end function

public function long of_getdatalength (long al_bidq_doc_id, ref long al_image_loops, ref long al_text_loops);long ll_text_len
long ll_image_len

// Get data length
//SELECT Datalength(image_file), Datalength(image_text)
//INTO :ll_image_len, :ll_text_len
//FROM ctx_bidq_doc
//WHERE bidq_doc_id = :al_bidq_doc_id;
SELECT  Datalength(image_text)
INTO  :ll_text_len
FROM ctx_bidq_doc
WHERE bidq_doc_id = :al_bidq_doc_id;

//// Calculate download image loops
//if ll_image_len > 8000 then 
//  	 if Mod(ll_image_len, 8000) = 0 then 
//        al_image_loops = ll_image_len / 8000 
//    else 
//  	     al_image_loops = (ll_image_len / 8000) + 1 
//    end if 
//elseif ll_image_len > 0 then
//	al_image_loops = 1
//else
//	al_image_loops = 0
//end if
al_image_loops = 0
	
// Calculate download text loops
if ll_text_len > 8000 then 
  	 if Mod(ll_text_len, 8000) = 0 then 
        al_text_loops = ll_text_len / 8000 
    else 
  	     al_text_loops = (ll_text_len / 8000) + 1 
    end if 
elseif ll_text_len > 0 then
	al_text_loops = 1
else
	al_text_loops = 0
end if

Return SQLCA.SQLCode
end function

public function blob of_downloadfile (long al_bidq_doc_id, long al_image_roops);blob lb_data
blob lb_all_data
long ll_start
long ll_counter

// Download image data
If gs_dbtype = "ASA" Or appeongetclienttype() <> 'PB' Then
	SELECTBLOB image_file INTO :lb_all_data
	FROM ctx_bidq_doc
	WHERE bidq_doc_id = :al_bidq_doc_id;
	ihpb_progress.Position += al_image_roops
Else		
	For ll_counter = 1 To al_image_roops
		Yield()
		ll_start = (ll_counter - 1) * 8000 + 1
		SELECTBLOB substring(image_file,:ll_start,8000) INTO :lb_data
		FROM ctx_bidq_doc
		WHERE bidq_doc_id = :al_bidq_doc_id;
		lb_all_data += lb_data
		ihpb_progress.Position += 1
	Next
End If
If isnull(lb_all_data) Then lb_all_data = blob('')

Return lb_all_data
end function

public function string of_downloadtext (long al_bidq_doc_id, long al_text_roops);long i, ll_Start
string ls_Buffer
string ls_Data

// Download image text
for i = 1 to al_text_roops
	Yield()
	ll_Start = (i - 1) * 8000 + 1
	SELECT substring(image_text, :ll_Start, 8000)
	INTO :ls_Buffer
	FROM ctx_bidq_doc
	WHERE bidq_doc_id = :al_bidq_doc_id;
	ls_Data += ls_Buffer
	ihpb_progress.Position += 1
next

Return ls_Data
end function

public function integer of_initprogressbar (long al_stepcount);ihpb_progress.MaxPosition = al_StepCount
ihpb_progress.Position = 0
ihpb_progress.SetStep = 1

Return 1
end function

public function integer of_execute (w_bidq_import_document aw_window, boolean ab_dragimport);iw_window = aw_window
idw_document = aw_window.dw_document
idw_contract = aw_window.uo_search.dw_search_det1
it_progress = aw_window.st_progress
ihpb_progress = aw_window.hpb_progress
ib_AttachAll = aw_window.cbx_attachall.Checked
// 03/09/12 Added By mark 
idw_bidq =	aw_window.dw_bidq
//Added By Jay Chen 01-27-2014
idw_contact = aw_window.dw_occ

// 03/13/12 Added By mark 
il_attachfile	= 0
il_failedcnt	=	 0

idc_PercentCount = 0
ib_DragImport = ab_DragImport
this.Event ue_importprocess()

Return 1
end function

public function decimal of_calculatesteppercent ();long ll_Row
long ll_DocumentCount
Decimal ldc_Percent

for ll_Row = 1 to idw_document.RowCount()
	if idw_document.object.selected[ll_Row] = 1 then
		ll_DocumentCount ++
	end if
next

if ib_AttachAll then
	if ib_DragImport then
		ll_DocumentCount = idw_contract.RowCount()
	else
		ll_DocumentCount = ll_DocumentCount * idw_contract.RowCount()
	end if
else
	if ib_DragImport then
		ll_DocumentCount = 1
	end if
end if

ldc_Percent = (1 / ll_DocumentCount) * 100

Return ldc_Percent
end function

public function integer of_addprocesspercent (decimal adc_steppercent);integer li_Percent

idc_PercentCount += adc_StepPercent
li_Percent = idc_PercentCount

if idc_PercentCount < 100 then
	it_progress.Text = "Attach Progress(" + String(li_Percent) + "%):"
else
	it_progress.Text = "Attach Progress(100%):"
end if
//MessageBox(String(adc_StepPercent), idc_PercentCount)

Return 1
end function

public subroutine of_auto_batch_modify_owner (integer al_ctx_id[]);//====================================================================
// Function: of_auto_batch_modify_owner
//--------------------------------------------------------------------
// Description: Auto modify the  user as the owner who add/edit/check in document
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:	Jay Chen		Date: 01-27-2014
//--------------------------------------------------------------------
//	Copyright (c) 2008-2013 ContractLogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

long ll_row,ll_found,ll_cnt,ll_find,ll_rowcount,i
datastore lds_contact_user
str_contact lstr_contact
boolean lb_update_owner = false,lb_edit = false,lb_updateflag = false
string ls_userid,ls_default_email,ls_owner,ls_dataobject
long ll_contact_id,ll_record_id,ll_ctx_id
n_cst_ctx_audit lnv_audit

lds_contact_user = create datastore
lds_contact_user.dataobject = 'd_contract_contact_search'
lds_contact_user.settransobject(sqlca)
lds_contact_user.retrieve(Upper(gs_user_id))
ll_found = lds_contact_user.find("Upper(user_d) = '"+Upper(gs_user_id)+"'",1, lds_contact_user.rowcount())
if ll_found <=0 then return
lstr_contact.al_contact_id = lds_contact_user.object.contact_id[ll_found] 
lstr_contact.al_contact_type = lds_contact_user.object.contact_type[ll_found] 
lstr_contact.as_user_id = lds_contact_user.object.user_d[ll_found]

idw_contact.settransobject(sqlca)

for i = 1 to UpperBound(al_ctx_id[]) 
	ll_ctx_id = al_ctx_id[i]
	ll_cnt = 0
	SELECT count(*) into :ll_cnt FROM ctx_contract_contacts 
	WHERE ctx_id=:ll_ctx_id and contact_id = :lstr_contact.al_contact_id and ic_area = 'I' and default_email='Y' and owner='Y';
	if isnull(ll_cnt) then ll_cnt = 0
	if ll_cnt = 0 then
		lb_update_owner = true
		exit
	end if
next

if lb_update_owner then
	if messagebox(gnv_app.iapp_object.DisplayName,'Do you want to set yourself as the the Owner for selected contract in Our Company Contact?',question!,yesnocancel!) = 1 then 
		lb_updateflag = true
	else
		lb_updateflag = false
	end if
end if

if lb_updateflag then
	for i = 1 to UpperBound(al_ctx_id[]) 
		ll_ctx_id = al_ctx_id[i]
		idw_contact.retrieve(ll_ctx_id,'I')
		ll_rowcount = idw_contact.rowcount()
		ll_find = idw_contact.find("Upper(user_d) = '"+Upper(lstr_contact.as_user_id)+"'",1, ll_rowcount)
		if ll_find > 0 then 
			ll_contact_id = idw_contact.getitemnumber(ll_find,"contact_id")
			ls_default_email = idw_contact.getitemstring(ll_find,"default_email")
			ls_owner = idw_contact.getitemstring(ll_find,"ctx_contract_contacts_owner")
			if (ls_default_email <> 'Y' or ls_owner <> 'Y')  then
				update ctx_contract_contacts set default_email='Y',owner='Y' where ctx_id = :ll_ctx_id and contact_id = :ll_contact_id and ic_area = 'I';
				update ctx_contract_contacts set default_email='N',owner='N' where ctx_id = :ll_ctx_id and contact_id <> :ll_contact_id and ic_area = 'I';
				if ls_default_email <> 'Y' then
					idw_contact.SetItem(ll_find,"default_email", 'Y')
				end if
				if ls_owner <> 'Y' then
					idw_contact.SetItem(ll_find,"ctx_contract_contacts_owner", 'Y')
				end if
				lb_edit = true
			else
				continue
			end if
		else
			ll_record_id = gnv_app.of_get_id('RECORD_ID', 1)
			insert into ctx_contract_contacts(ctx_id,contact_id,ic_area,association,default_email,record_id,owner,access)
			values(:ll_ctx_id,:lstr_contact.al_contact_id,'I',:lstr_contact.al_contact_type,'Y',:ll_record_id,'Y','F');
			update ctx_contract_contacts set default_email='N',owner='N' where ctx_id = :ll_ctx_id and contact_id <> :lstr_contact.al_contact_id and ic_area = 'I';
			ll_row = idw_contact.insertrow(0)
			idw_contact.SetItem(ll_row,"default_email", 'Y')
			idw_contact.SetItem(ll_row,"ctx_contract_contacts_owner", 'Y')
			idw_contact.SetItem(ll_row,"ctx_id", ll_ctx_id)
			idw_contact.SetItem(ll_row,"record_id", ll_record_id)
			lb_edit = false
		end if
		commit;
		//write audit log
		lnv_audit.of_set_prac_id(ll_ctx_id)
		lnv_audit.of_audit_fields(idw_contact)
		//refresh screen data
		idw_contact.retrieve(ll_ctx_id,'I')
	
		ll_rowcount = idw_contact.rowcount()
		if not lb_edit then
			ll_find = idw_contact.find("Upper(user_d) = '"+Upper(lstr_contact.as_user_id)+"'",1, ll_rowcount)
		end if
		if lb_edit then
			idw_contact.SetItemStatus(ll_find,"default_email", Primary!, NotModified!)
			idw_contact.SetItemStatus(ll_find,"ctx_contract_contacts_owner", Primary!, NotModified!)
		else
			idw_contact.SetItemStatus(ll_find,0, Primary!, NotModified!)
		end if
		lb_edit = false
	next
end if
	


end subroutine

on n_cst_bidq_import.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_bidq_import.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

