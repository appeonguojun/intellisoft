$PBExportHeader$w_dm_check_compare.srw
forward
global type w_dm_check_compare from w_popup
end type
type pb_4 from picturebutton within w_dm_check_compare
end type
type pb_3 from picturebutton within w_dm_check_compare
end type
type pb_1 from picturebutton within w_dm_check_compare
end type
type pb_2 from picturebutton within w_dm_check_compare
end type
type cb_up from commandbutton within w_dm_check_compare
end type
type st_info from statictext within w_dm_check_compare
end type
type dw_1 from u_dw_contract within w_dm_check_compare
end type
type ole_1 from u_email_edit within w_dm_check_compare
end type
type dw_second from u_dw within w_dm_check_compare
end type
type cb_email from commandbutton within w_dm_check_compare
end type
type ole_first from u_email_edit within w_dm_check_compare
end type
type ole_second from u_email_edit within w_dm_check_compare
end type
type cb_close from commandbutton within w_dm_check_compare
end type
type cb_check from commandbutton within w_dm_check_compare
end type
type cb_save from commandbutton within w_dm_check_compare
end type
type dw_first from u_dw within w_dm_check_compare
end type
type gb_second from groupbox within w_dm_check_compare
end type
type gb_first from groupbox within w_dm_check_compare
end type
type gb_1 from groupbox within w_dm_check_compare
end type
end forward

global type w_dm_check_compare from w_popup
integer width = 4466
integer height = 2100
string title = "The Dual Document Review Window"
windowstate windowstate = maximized!
boolean center = true
boolean ib_isupdateable = false
pb_4 pb_4
pb_3 pb_3
pb_1 pb_1
pb_2 pb_2
cb_up cb_up
st_info st_info
dw_1 dw_1
ole_1 ole_1
dw_second dw_second
cb_email cb_email
ole_first ole_first
ole_second ole_second
cb_close cb_close
cb_check cb_check
cb_save cb_save
dw_first dw_first
gb_second gb_second
gb_first gb_first
gb_1 gb_1
end type
global w_dm_check_compare w_dm_check_compare

type variables
Long il_source_docid, il_last_docid = -1
Decimal idc_source_revid
String is_call_from
string is_sourcefile,is_sourcefile_org,is_targetfile
string is_source_docname
DataWindowChild idwc_rev,idwc_doc,idwc_ctx1,idwc_ctx2

n_cst_dm_comparison inv_comparison
n_cst_dm_utils  inv_dm_utils
n_cst_ovole_utils  inv_ole_utils_doc
OleObject iole_word 
str_doc_compare istr_doc_compare
string is_mode,is_license_user_id
boolean ib_readonly1,ib_readonly2,ib_latest1,ib_latest2
string is_filename1,is_filename2,is_status1,is_status2

Constant long wdFormatDocument = 0 

String is_fullname[]
String is_filename[]
boolean ib_compare_doc,ib_compare_pdf
boolean ib_not_compare = false
datastore ids_user_ctx
str_ctx_info 	istr_ctx_info
end variables

forward prototypes
public function string of_get_call_from ()
public subroutine of_adjust_ui ()
public function integer of_prepare_comparison ()
public function boolean of_ismodified (string as_index)
public function integer of_save (string as_index)
public function integer of_savetofile (string as_filename, string as_index)
public subroutine of_send_email ()
public subroutine of_checkout ()
public subroutine of_compare_document ()
public subroutine of_clear_compare_flag ()
public function decimal of_get_latest_rev (long al_doc_id)
public function integer of_displayfile (string as_index)
public subroutine of_set_default ()
public function integer of_save_compare ()
public subroutine of_convert_pdf ()
end prototypes

public function string of_get_call_from ();RETURN ''
end function

public subroutine of_adjust_ui ();//st_title.visible = FALSE
//st_prompt.visible = FALSE
//st_alert.visible = FALSE
//cb_next.visible = FALSE
//cb_cancel.visible = FALSE
//ln_1.visible = FALSE
//ln_2.visible = FALSE
//
//gb_clause.visible = TRUE
//dw_document.visible = TRUE
//ole_1.visible = TRUE
//ole_source.visible = true
//cb_close.visible = TRUE
//gb_source.visible = true
//st_source.visible = true
//st_source_t.visible = true
//
//This.width = 4060
//This.Height = 2150
//
//gb_source.x = 20
//gb_source.y = 20
//st_source_t.x = gb_source.x + 30
//st_source.x = gb_source.x + 30
//st_source_t.y = 100
//st_source.y = 160
//
//
//ole_source.x = gb_source.x 
//ole_source.y = 300
//ole_source.width = 2000
//ole_source.height = This.height - ole_source.y - 240
//
//ole_1.x = ole_source.x + ole_source.width + 20
//ole_1.y = ole_source.y
//ole_1.width = 2000
//ole_1.height = This.height - ole_1.y - 240
//
//
//gb_clause.y = 20
//dw_document.y = 80
//
//
//st_splitbar.x = ole_source.x + ole_source.width
//st_splitbar.y = ole_source.y
//st_splitbar.height = ole_source.height
//
//cb_close.x = ole_1.x + ole_1.width - cb_close.width
//cb_close.y = ole_1.y + ole_1.height + 20
//
//
////Set window resizable
//THIS.Title = "Document Comparison"
//THIS.ControlMenu = TRUE
//This.Maxbox = TRUE
//THIS.Minbox = TRUE
//THIS.Resizable = TRUE
//THIS.Center = TRUE
//this.windowstate = Maximized!
//
end subroutine

public function integer of_prepare_comparison ();//Long i, ll_row, ll_cnt, ll_docid
//String ls_docname
//
//SetReDraw(FALSE)
//
////Adjust the UI for documents comparison
//of_adjust_ui()
//
////Get the source document
//il_source_docid = inv_comparison.il_source_docid
//idc_source_revid = inv_comparison.idc_source_revid
//
///*
////Initilize the dddws with the source document
//idwc_doc.InsertRow(0)
//idwc_doc.SetItem(1, "doc_id", inv_comparison.il_source_docid)
//idwc_doc.SetItem(1, "doc_name", inv_comparison.is_soure_docname)
//
//idwc_rev.InsertRow(0)
//idwc_rev.SetItem(1, "doc_id", inv_comparison.il_source_docid)
//idwc_rev.SetItem(1, "doc_name", inv_comparison.is_soure_docname)
//idwc_rev.SetItem(1, "revision", inv_comparison.idc_source_revid)
//*/
//is_source_docname = inv_comparison.is_soure_docname
//st_source.text = is_source_docname + " Ver " + string(inv_comparison.idc_source_revid)
//
////initilize the dddws with target documents 
//ll_cnt = inv_comparison.ids_target_docs.RowCount()
//FOR i = 1 to ll_cnt
//	ll_docid = inv_comparison.ids_target_docs.GetItemNumber(i, "doc_id")
//   ls_docname = inv_comparison.ids_target_docs.GetItemString(i, "doc_name")
//	IF idwc_doc.Find("doc_id = " + String(ll_docid),1, idwc_doc.RowCount()) > 0 THEN 
//		CONTINUE
//	END IF
//	ll_row = idwc_doc.Insertrow(0)
//	idwc_doc.SetItem(ll_row, "doc_id", ll_docid)
//	idwc_doc.SetItem(ll_row, "doc_name", ls_docname)	
//NEXT
//inv_comparison.ids_target_docs.RowsCopy(1, ll_cnt, Primary!, idwc_rev, 2, Primary!)
//
//idwc_doc.InsertRow(1)
//idwc_rev.InsertRow(1)
//dw_document.InsertRow(0)
//
//SetReDraw(TRUE)
//
////Download and display source document
////********Get Source File ******************//
//IF not isnull(il_source_docid) and not isnull(idc_source_revid) and (il_source_docid > 0 and idc_source_revid >= 0 ) THEN
//	//Get the selected document's file 
//	IF IsValid(inv_dm_utils) THEN
//		is_sourcefile = inv_dm_utils.of_download_file( il_source_docid, idc_source_revid)		
//	END IF		
//	
//	//Open source document
//	is_sourcefile_org = gs_dir_path + gs_DefDirName + "\Agreement\" + '_document_compare_org_copy.doc'
//	FileCopy(is_sourcefile,is_sourcefile_org,True) //Added By Ken.Guo 2010-02-04.
//	Try
//		app_filler.of_set_word_safemode(false, 1) //Added By Ken.Guo 2015-07-30
//		Ole_source.object.OpenLocalFile(is_sourcefile_org,true)
//		app_filler.of_set_word_safemode(false, 0) //Added By Ken.Guo 2015-07-30
//		gnv_word_utility.of_modify_word_property( Ole_source.object.ActiveDocument)	//Added By Mark Lee 06/20/2013 change for office 2013.
//	CATCH (Throwable th) 
//		IF OLE_1.Object.doctype = 1 THEN OLE_1.Object.Close()
//	end try
//END IF
//
////Comparison
//if ll_cnt > 0 then 
//	dw_document.SetItem(1,'doc_id',inv_comparison.ids_target_docs.GetItemNumber(1, "doc_id"))
//	dw_document.event itemfocuschanged( 1, dw_document.object.revision)
//end if
//
return 1
end function

public function boolean of_ismodified (string as_index);//====================================================================
// Function: of_ismodified
//====================================================================
// Function: of_ismodified
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value    string    as_index
//--------------------------------------------------------------------
// Returns:  boolean
//--------------------------------------------------------------------
// Author:	Jay Chen		Date: 09-18-2015
//--------------------------------------------------------------------
//	Copyright (c) 2008-2014 ContractLogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

try
	if as_index = 'first' then
		if isvalid(ole_first.object.ActiveDocument) then
			Return not ole_first.object.ActiveDocument.saved
		end if
	elseif as_index = 'second' then
		if isvalid(ole_second.object.ActiveDocument) then
			Return not ole_second.object.ActiveDocument.saved
		end if
	else
		if isvalid(ole_1.object.ActiveDocument) then
			Return not ole_1.object.ActiveDocument.saved
		end if
	end if
catch(Throwable th)
	Messagebox('Warning','Failed to get modification status due to: '+th.text+'~r~n~r~nPlease check if your Office Viewer OCX has been installed correctly.',exclamation!)
	return false
end try



end function

public function integer of_save (string as_index);//====================================================================
// Function: of_save
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value    string    as_index
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	Jay Chen		Date: 09-18-2015
//--------------------------------------------------------------------
//	Copyright (c) 2008-2014 ContractLogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

Boolean lb_revision_control
Integer li_ret
Decimal ldec_new_revision
String ls_filename, ls_filename_writable,ls_doc_ext
DateTime ldt_modify_date
str_add_audit lstr_add_audit
Long ll_row,ll_doc_id
Long ll_level
Boolean lb_checkout_status
long li_version_increment
str_doc_info	lstr_docinfo
Decimal ldec_max_revision  
n_cst_word_utility lnv_word_utility 
decimal{1} ldc_revision
string ls_fullname
 
ldt_modify_date = DateTime(Today(), Now())

if as_index = 'first' then
	lb_revision_control = istr_doc_compare.revision_control1
	ll_doc_id = istr_doc_compare.doc_id1
	ls_doc_ext = istr_doc_compare.doc_ext1
	ldc_revision = istr_doc_compare.revision1
else
	lb_revision_control = istr_doc_compare.revision_control2
	ll_doc_id = istr_doc_compare.doc_id2
	ls_doc_ext = istr_doc_compare.doc_ext2
	ldc_revision = istr_doc_compare.revision2
end if
	
li_version_increment = of_get_app_setting("set_57",'I')	//Version Number Increment Option

IF lb_revision_control AND NOT of_ismodified(as_index) THEN
	MessageBox("Save Document", "The document is not modified.")
	RETURN 0
END IF

IF NOT lb_revision_control THEN
	li_ret = MessageBox("Save Doucment", "Do you want to start version control?", Question!, YesNo!, 1)
	IF li_ret = 1 THEN
		lb_revision_control = TRUE
	ELSE
		IF NOT of_ismodified(as_index) THEN 
			MessageBox("Save Document", "The document is not modified.") 
			RETURN 0
		END IF
	END IF
END IF
		

Openwithparm(w_appeon_gifofwait, "Saving the document...")
	
Select Max(Revision) Into :ldec_max_revision From Ctx_am_doc_image	Where Doc_id = :ll_doc_id;   //Added By Ken.Guo 2009-05-15. Get newest revision.
		
IF (lb_revision_control and li_version_increment = 1)  THEN 
	ldec_new_revision = inv_dm_utils.of_newversion( ldec_max_revision )   //Modified By Ken.Guo 2009-05-15
ELSE
	ldec_new_revision = ldec_max_revision  //Modified By Ken.Guo 2009-05-15
END IF
		
// Generate file name
ls_filename = inv_dm_utils.of_generate_tempname(ll_doc_id, ldec_new_revision, ls_doc_ext)
ls_filename_writable = inv_dm_utils.of_generate_tempname_writable(ll_doc_id, ldec_new_revision, ls_doc_ext)
		
IF lb_revision_control THEN
	//1-Increment version Number each time document is Update(Default) by jervis 02.19.2009
	if li_version_increment = 1 then
		// Insert new record of image to the DB
		INSERT Ctx_am_doc_image(Doc_id, Revision, doc_ext, modify_date,doc_ext_full)
		Values( :ll_doc_id, :ldec_new_revision, :ls_doc_ext, :ldt_modify_date ,:ls_doc_ext);
				
		// Set check out status to record
		UPDATE Ctx_am_document
		SET 	revision = :ldec_new_revision,
				revision_control = '1',
				checkout_by = '',
				checkout_date = NULL,
				checkout_status = '0'
		Where Doc_id = :ll_doc_id;
		
		//Refresh version number data alter saved.
		if ldec_new_revision <> ldc_revision  then 
			lstr_docinfo.ver_num = ldec_new_revision
//			inv_ole_utils_doc.of_refresh_docinfo( this.tab_1.tabpage_preview.ole_doc.object.ActiveDocument , lstr_docinfo,true)
				
				//Refresh doc info-jervis 02.26.2009
				//st_docinfo.text = tab_1.tabpage_browse.dw_browse.GetItemString(ll_row,"Doc_name") + " - Version: " + string(ldec_new_revision)
				//st_docinfo.text = tab_1.tabpage_browse.dw_browse.GetItemString(tab_1.tabpage_browse.dw_browse.getrow(),"Doc_name_full") 
//			st_docinfo.text =   tab_1.tabpage_browse.dw_browse.GetItemString( tab_1.tabpage_browse.dw_browse.getrow(),"Doc_name")  + ' ' + &
//											string(   tab_1.tabpage_browse.dw_browse.GetItemNumber( tab_1.tabpage_browse.dw_browse.getrow(),"Doc_id") ) + '.' 
//			st_docinfo.Text += string(ldec_new_revision, '##0.0' )
		end if
		
	end if
	
end if		

If IsValid(w_appeon_gifofwait) Then w_appeon_gifofwait.event timer()

// Save document
of_savetofile( ls_filename, as_index )
of_savetofile( ls_filename_writable, as_index )

// Upload local file to DB
inv_dm_utils.of_upload_file( ll_doc_id, ldec_new_revision, ls_filename)
//IF Upper(tab_1.tabpage_browse.dw_browse.object.doc_type[tab_1.tabpage_browse.dw_browse.getrow()]) = "S" THEN
//	//Added By Ken.Guo 2009-06-30.
//	lnv_word_utility = Create n_cst_word_utility 
//	lnv_word_utility.of_update_reqmnt_field(tab_1.tabpage_preview.ole_doc.object , ll_doc_id, 'D') 
//	Destroy lnv_word_utility
//End If
			
//update clause map for word document
//of_updateclausemap(ldec_new_revision)
		
//Save the latest update date of the current file in Registry
//Modified By Ken.Guo 2015-04-29
select modify_date into :ldt_modify_date from Ctx_am_doc_image where doc_id = :ll_doc_id and revision = :ldec_new_revision;
gnv_filetime.of_setlastwritedatetime( ls_filename, ldt_modify_date)
		
//////////////////////////////////////////////////////////////////// //
//// Trigger off audit trail
///////////////////////////////////////////////////////////////////////
lstr_add_audit.Doc_id = ll_doc_id
lstr_add_audit.Revision = ldec_new_revision
lstr_add_audit.doc_ext = ls_doc_ext
lstr_add_audit.action = "Modified in comparison window"
inv_dm_utils.of_add_audit_trail( lstr_add_audit )

// Refresh data
IF lb_revision_control THEN
	if as_index = 'first' then
		dw_first.setitem(1, "revision", ldec_new_revision)
		ls_fullname = istr_doc_compare.filename1 + ' ' + String( istr_doc_compare.doc_id1 )+ '.' + String( ldec_new_revision ,'##0.0')
		istr_doc_compare.fullname1 = ls_fullname
		istr_doc_compare.revision1 = ldec_new_revision
		dw_first.setitem(1,"doc_name", istr_doc_compare.fullname1)
		dw_first.getchild("revision", idwc_rev)
		idwc_rev.settransobject(sqlca)
		idwc_rev.retrieve(istr_doc_compare.doc_id1)
	else
		dw_second.setitem(1, "revision", ldec_new_revision)
		ls_fullname = istr_doc_compare.filename2 + ' ' + String( istr_doc_compare.doc_id2 )+ '.' + String( ldec_new_revision ,'##0.0')
		istr_doc_compare.fullname2 = ls_fullname
		istr_doc_compare.revision2 = ldec_new_revision
		dw_second.setitem(1,"doc_name", istr_doc_compare.fullname2)
		dw_second.getchild("revision", idwc_rev)
		idwc_rev.settransobject(sqlca)
		idwc_rev.retrieve(istr_doc_compare.doc_id2)
	end if
	if isvalid(gw_contract) then
		gw_contract.tab_contract_details.tabpage_images.tab_1.tabpage_data.event ue_retrieve()
		of_clear_compare_flag()
	end if
end if
	
If IsValid(w_appeon_gifofwait) Then close(w_appeon_gifofwait)

//added by gavins 20120229
//of_insertdetail(  tab_1.tabpage_browse.dw_browse, tab_1.tabpage_browse.dw_detail  )

RETURN 1


end function

public function integer of_savetofile (string as_filename, string as_index);//====================================================================
// Function: of_savetofile
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value    string    as_filename
// 	value    string    as_index
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	Jay Chen		Date: 09-18-2015
//--------------------------------------------------------------------
//	Copyright (c) 2008-2014 ContractLogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

gnv_rights.of_check_dir_right(as_filename, true, 'Word Save')
try
	if as_index = 'first' then
		ole_first.object.SaveToLocal(as_filename,true)	
	elseif as_index = 'compare' then
		ole_1.object.SaveToLocal(as_filename,true)	
	else
		ole_second.object.SaveToLocal(as_filename,true)	
	end if
	Return 1
catch(Throwable th)
	Messagebox('Warning','Failed to the save document to '+as_filename+' due to: '+th.text+'~r~n~r~nPlease check if your Office Viewer OCX has been installed correctly.',exclamation!)
	return -1
end try

return 1

end function

public subroutine of_send_email ();//====================================================================
// Function: of_send_email
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  (none)
//--------------------------------------------------------------------
// Author:	Jay Chen		Date: 09-18-2015
//--------------------------------------------------------------------
//	Copyright (c) 2008-2014 ContractLogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
Integer li_rtn
str_ctx_email lstr_ctx_email
string ls_flag,ls_comparefile,ls_comparepdf 
decimal{1} ldc_revid,ldc_revid2,ld_latest_rev1,ld_latest_rev2
boolean lb_doc1,lb_doc2
str_choose_compare_doc lstr_compare
long ll_ctx_id,ll_doc_id,ll_cnt

//Added By Jay Chen 11-16-2015
ib_compare_doc = false
ib_compare_pdf = false

////Check if the document modified
//select revision into :ld_latest_rev1 from ctx_am_document where doc_id = :istr_doc_compare.doc_id1;
//if istr_doc_compare.doc_id1 <> istr_doc_compare.doc_id2 then
//	select revision into :ld_latest_rev2 from ctx_am_document where doc_id = :istr_doc_compare.doc_id2;
//else
//	ld_latest_rev2 = ld_latest_rev1
//end if
//if istr_doc_compare.revision1 = ld_latest_rev1 then lb_doc1 = true
//if istr_doc_compare.revision2 = ld_latest_rev2 then lb_doc2 = true
//
//if lb_doc1 or lb_doc2 then
//	if of_ismodified("first") or of_ismodified("second") then 
//		MessageBox("Save Document","The document has been modified, please save it first.") 
//		Return
//	end if		
//end if

//Added By Jay Chen 11-06-2015
OpenWithParm( w_dm_checkout_compare,'E')
IF NOT Isvalid(Message.PowerobjectParm) THEN RETURN
lstr_compare = message.powerobjectparm
//if lstr_compare.ib_compare_doc or  lstr_compare.ib_compare_pdf then
//	ll_doc_id = dw_1.getitemnumber(1, "doc_id")
//	if isnull(ll_doc_id) then ll_doc_id = 0
//	select count(*) into :ll_cnt from ctx_am_document where doc_id = :ll_doc_id;
//	if isnull(ll_cnt) then ll_cnt = 0
//	if ll_doc_id < 1 or ll_cnt = 0 then
//		MessageBox("Email","You must save the compared document first.")
//		RETURN
//	end if
//end if		

if lstr_compare.ib_original then
	lstr_ctx_email.ctx_id_list[upperbound(lstr_ctx_email.ctx_id_list) + 1] = istr_doc_compare.ctx_id1
	lstr_ctx_email.doc_id_list[upperbound(lstr_ctx_email.doc_id_list) + 1] = istr_doc_compare.doc_id1
	lstr_ctx_email.revision_list[upperbound(lstr_ctx_email.revision_list) + 1] = istr_doc_compare.revision1
end if
if lstr_compare.ib_revised then
	lstr_ctx_email.ctx_id_list[upperbound(lstr_ctx_email.ctx_id_list) + 1] = istr_doc_compare.ctx_id2
	lstr_ctx_email.doc_id_list[upperbound(lstr_ctx_email.doc_id_list) + 1] = istr_doc_compare.doc_id2
	lstr_ctx_email.revision_list[upperbound(lstr_ctx_email.revision_list) + 1] = istr_doc_compare.revision2
end if
if lstr_compare.ib_compare_doc then
//	ll_doc_id = dw_1.getitemnumber(1, "doc_id")
//	ll_ctx_id =  dw_1.getitemnumber(1, "ctx_id")
//	lstr_ctx_email.ctx_id_list[upperbound(lstr_ctx_email.ctx_id_list) + 1] = ll_ctx_id
//	lstr_ctx_email.doc_id_list[upperbound(lstr_ctx_email.doc_id_list) + 1] = ll_doc_id
//	lstr_ctx_email.revision_list[upperbound(lstr_ctx_email.revision_list) + 1] = 1.0
	ib_compare_doc = true //Added By Jay Chen 11-16-2015
end if
if lstr_compare.ib_compare_pdf then
	of_convert_pdf()
	ib_compare_pdf = true //Added By Jay Chen 11-16-2015
end if
//end
//Set document info.
lstr_ctx_email.doc_from = 'DM'
lstr_ctx_email.ab_checkcompare = true //Added By Jay Chen 09-21-2015

//Open email window 
w_mdi.SetRedraw(False)
SetPointer(HourGlass!)
OpenWithParm(w_dm_email_document_send, lstr_ctx_email)
w_mdi.SetRedraw(True)
end subroutine

public subroutine of_checkout ();//====================================================================
// Function: of_checkout
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:	Jay Chen		Date: 09-18-2015
//--------------------------------------------------------------------
//	Copyright (c) 2008-2014 ContractLogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
Integer li_rtn,i //03.28.2008
String ls_notes
str_add_doc lstr_add_doc_arr[],lstr_add_doc
str_checkout lstr_checkout
str_ctx_email lstr_dm_email
str_add_audit lstr_add_audit[]
//n_cst_dm_utils lnv_dm_utils
String ls_action_name //Added by Ken.Guo on 2009-03-26
String ls_checkout_status = '1' //Added by Ken.Guo on 2009-03-27
Long ll_current_row,ll_cnt,ll_doc_id,ll_ctx_id,ll_index
str_add_doc_multi lstr_add_doc_multi
string ls_docext,ls_filetype,ls_status
u_tabpg_dm_data lnv_data
Long			ll_FindRow, ll_CurRow
Long			ll_Org_Doc_ID
str_choose_compare_doc lstr_compare

ib_compare_doc = false
ib_compare_pdf = false

OpenWithParm( w_dm_checkout_compare,'C')
IF NOT Isvalid(Message.PowerobjectParm) THEN RETURN
lstr_compare = message.powerobjectparm

if lstr_compare.ib_original then
	if not ib_latest1 then
		MessageBox("Check Document","You cannot check out a history document. Please select the latest version of the original document.") 
		Return
	else
		select checkout_status into :ls_status from ctx_am_document where doc_id = :istr_doc_compare.doc_id1;
		if isnull(ls_status) then ls_status = ''
		if ls_status <> "0" then
			MessageBox("Check Out","The original document is already checked out. You cannot check it out again.")
			RETURN
		end if
	end if
end if

if lstr_compare.ib_revised then
	if not ib_latest2 then
		MessageBox("Check Document","You cannot check out a history document. Please select the latest version of the revised document.") 
		Return
	else
		select checkout_status into :ls_status from ctx_am_document where doc_id = :istr_doc_compare.doc_id2;
		if isnull(ls_status) then ls_status = ''
		if ls_status <> "0" then
			MessageBox("Check Out","The revised document is already checked out. You cannot check it out again.")
			RETURN
		end if
	end if
end if

if lstr_compare.ib_compare_doc or  lstr_compare.ib_compare_pdf then
	ll_doc_id = dw_1.getitemnumber(1, "doc_id")
	if isnull(ll_doc_id) then ll_doc_id = 0
	select count(*) into :ll_cnt from ctx_am_document where doc_id = :ll_doc_id;
	if isnull(ll_cnt) then ll_cnt = 0
	if ll_doc_id < 1 or ll_cnt = 0 then
		MessageBox("Check Out","You have to save the compared document before you can check it out.")
		RETURN
	end if
end if

if lstr_compare.ib_original then
	lstr_dm_email.ctx_id_list[upperbound(lstr_dm_email.ctx_id_list) + 1] = istr_doc_compare.ctx_id1
	lstr_dm_email.doc_id_list[upperbound(lstr_dm_email.doc_id_list) + 1] = istr_doc_compare.doc_id1
	lstr_dm_email.revision_list[upperbound(lstr_dm_email.revision_list) + 1] = istr_doc_compare.revision1
	ll_index = upperbound(lstr_add_audit) + 1
	lstr_add_audit[ll_index].doc_id = istr_doc_compare.doc_id1
	lstr_add_audit[ll_index].revision = istr_doc_compare.revision1
end if
if lstr_compare.ib_revised then
	lstr_dm_email.ctx_id_list[upperbound(lstr_dm_email.ctx_id_list) + 1] = istr_doc_compare.ctx_id2
	lstr_dm_email.doc_id_list[upperbound(lstr_dm_email.doc_id_list) + 1] = istr_doc_compare.doc_id2
	lstr_dm_email.revision_list[upperbound(lstr_dm_email.revision_list) + 1] = istr_doc_compare.revision2
	ll_index = upperbound(lstr_add_audit) + 1
	lstr_add_audit[ll_index].doc_id = istr_doc_compare.doc_id2
	lstr_add_audit[ll_index].revision = istr_doc_compare.revision2
end if
if lstr_compare.ib_compare_doc then
	ll_doc_id = dw_1.getitemnumber(1, "doc_id")
	ll_ctx_id =  dw_1.getitemnumber(1, "ctx_id")
	lstr_dm_email.ctx_id_list[upperbound(lstr_dm_email.ctx_id_list) + 1] = ll_ctx_id
	lstr_dm_email.doc_id_list[upperbound(lstr_dm_email.doc_id_list) + 1] = ll_doc_id
	lstr_dm_email.revision_list[upperbound(lstr_dm_email.revision_list) + 1] = 1.0
	ll_index = upperbound(lstr_add_audit) + 1
	lstr_add_audit[ll_index].doc_id = ll_doc_id
	lstr_add_audit[ll_index].revision = 1.0
//	ib_compare_doc = true //Added By Jay Chen 11-16-2015
end if
if lstr_compare.ib_compare_pdf then
	of_convert_pdf()
	ib_compare_pdf = true //Added By Jay Chen 11-16-2015
end if

lstr_add_doc.doc_from = 'DM'
lstr_add_doc.ab_weblink_unable = true //Added By Jay Chen 09-22-2015
lstr_add_doc.ctx_id = lstr_dm_email.ctx_id_list[1]

if isvalid(gw_contract) then
	lnv_data = gw_contract.tab_contract_details.tabpage_images.tab_1.tabpage_data
End If

/********************
//Open the checkout type selection window and return if cancelled
OpenWithParm( w_dm_checkout_document, lstr_add_doc )
IF NOT Isvalid(Message.PowerobjectParm) THEN RETURN
			
lstr_checkout = Message.PowerobjectParm
ls_notes = lstr_checkout.checkout_notes
*********************/

lstr_checkout.checkout_type = '3' //Added By Jay Chen 11-16-2015

////Open the saveas or email window according to the above selection 
CHOOSE CASE lstr_checkout.checkout_type
	CASE "2"		// Check out with save as
		ls_action_name = 'Check Out & Save As' //Added by Ken.Guo on 2009-03-26
//		if lstr_add_doc_arr[1].doc_id = lstr_add_doc_arr[2].doc_id then
//			lstr_add_doc_multi.astr_add_doc[] = lstr_add_doc_arr[1]
//		else
			lstr_add_doc_multi.astr_add_doc[] = lstr_add_doc_arr[]
//		end if
		openwithparm(w_dm_saveto_document, lstr_add_doc_multi)
		IF Message.Doubleparm <> 1 THEN 	RETURN
	CASE "3"		// Check out With Email as attachment
		ls_action_name = 'Check Out & Email-Attachment' //Added by Ken.Guo on 2009-03-26
		lstr_dm_email.doc_from = 'DM'
		lstr_dm_email.ab_checkcompare = true //Added By Jay Chen 09-21-2015
		lstr_dm_email.action_type = 'CheckOut'
		lstr_dm_email.ctx_id = lstr_add_doc.ctx_id //for show error message
		lstr_dm_email.is_weblink = '0' //Added by Ken.Guo on 2009-03-26
//		if istr_doc_compare.doc_id1 <> istr_doc_compare.doc_id2 then //added by gavins 20150928
//			if ib_latest1 then
//				//Get documents info for Email
//				lstr_dm_email.ctx_id_list[2] = istr_doc_compare.ctx_id2
//				lstr_dm_email.doc_id_list[2] =  istr_doc_compare.doc_id2
//				lstr_dm_email.revision_list[2] = istr_doc_compare.revision2
//				lstr_dm_email.filename_list[2] = istr_doc_compare.filename2
//				lstr_dm_email.doc_ext_list[2] = istr_doc_compare.doc_ext2	
//			Else
//				lstr_dm_email.ctx_id_list[2] = istr_doc_compare.ctx_id1
//				lstr_dm_email.doc_id_list[2] =  istr_doc_compare.doc_id1
//				lstr_dm_email.revision_list[2] = istr_doc_compare.revision1
//				lstr_dm_email.filename_list[2] = istr_doc_compare.filename1
//				lstr_dm_email.doc_ext_list[2] = istr_doc_compare.doc_ext1
//				
//			End If
//		End If
		openwithparm(w_dm_email_document_send, lstr_dm_email)
		IF Message.Doubleparm <> 1 THEN 	RETURN	
	Case "4"  // Check out With Email as web link. Added by Ken.Guo on 2009-03-26
		ls_action_name = 'Check Out & Email-Web Link' //Added by Ken.Guo on 2009-03-26
		
		//for web link
//		lstr_dm_email.doc_id = lstr_add_doc.doc_id
//		lstr_dm_email.revision = lstr_add_doc.revision
//		lstr_dm_email.doc_ext = lstr_add_doc.doc_ext
//		lstr_dm_email.filename = lstr_add_doc.filename
		
		lstr_dm_email.doc_from = 'DM'
		lstr_dm_email.action_type = 'CheckOut'
		lstr_dm_email.ctx_id = lstr_add_doc.ctx_id
		lstr_dm_email.is_weblink = '1'
		ls_checkout_status = '2'
		
//		If UpperBound(lstr_dm_email.doc_id_list[]) > 1 Then
//			Messagebox('Check Out','You must select only one document to check out with web link.')
//			Return
//		End If
		
		openwithparm(w_dm_email_document_send, lstr_dm_email)
		IF Message.Doubleparm <> 1 THEN 	
			//Delete waste data.
			Delete from ctx_am_image_weblink where doc_id = :lstr_dm_email.doc_id and revision = :lstr_dm_email.revision; 
			RETURN			
		End If
	Case '5' //Check out with Sertifi
		//ls_checkout_status = '5'  //5: checked out; 6: all client users signed.
		choose case gs_esigntype //Modified By Jay Chen 10-11-2013
			case 'sertifi'
				//Added By Jay Chen 09-04-2014
				is_mode = gnv_user_option.of_get_option_value(gs_user_id, "sertifi_license_mode" )
				if isnull(is_mode) or is_mode = '' then is_mode = "global_license"
				if is_mode = "global_license" then
					is_license_user_id = "global_license_user"
				else
					is_license_user_id = gs_user_id
				end if
				//end add
				if isvalid(lnv_data) then
					lnv_data.event ue_checkout_sertify( )
				end if
			case 'echosign'
				//Added By Jay Chen 09-04-2014
				is_mode = gnv_user_option.of_get_option_value(gs_user_id, "echosign_license_mode" )
				if isnull(is_mode) or is_mode = '' then is_mode = "global_license"
				if is_mode = "global_license" then
					is_license_user_id = "global_license_user"
				else
					is_license_user_id = gs_user_id
				end if
				//end add
				if isvalid(lnv_data) then
					lnv_data.event ue_checkout_echosign( )
				end if
			case 'docusign' //Added By Jay Chen 04-09-2014
				//Added By Jay Chen 09-04-2014
				is_mode = gnv_user_option.of_get_option_value(gs_user_id, "docusign_license_mode" )
				if isnull(is_mode) or is_mode = '' then is_mode = "global_license"
				if is_mode = "global_license" then
					is_license_user_id = "global_license_user"
				else
					is_license_user_id = gs_user_id
				end if
				//end add
				if isvalid(lnv_data) then
					lnv_data.event ue_checkout_docusign( )
				end if
		end choose
		Return
	Case '6'
		if isvalid(lnv_data) then
			//added by gavins 20150928
			ll_CurRow = lnv_data.tab_1.tabpage_browse.dw_browse.GetRow( )
			If ll_CurRow > 0 Then
				ll_Org_Doc_ID = lnv_data.tab_1.tabpage_browse.dw_browse.GetItemNumber(  ll_CurRow, 'doc_id' )
			End If
			If ll_Org_Doc_ID <> lstr_dm_email.doc_id_list[1] Then
				ll_FindRow = lnv_data.tab_1.tabpage_browse.dw_browse.Find(  "doc_id = " + string( lstr_dm_email.doc_id_list[1] ) , 1, lnv_data.tab_1.tabpage_browse.dw_browse.rowcount( ) )
				If ll_FindRow > 0 Then 
					lnv_data.tab_1.tabpage_browse.dw_browse.ScrollToRow( ll_FindRow )
					lnv_data.tab_1.tabpage_browse.dw_browse.SelectRow( 0 , false )
					lnv_data.tab_1.tabpage_browse.dw_browse.SelectRow( ll_FindRow , True )
				End If
			Else
				If ll_CurRow > 0 Then
					lnv_data.tab_1.tabpage_browse.dw_browse.SelectRow( 0 , false )
					lnv_data.tab_1.tabpage_browse.dw_browse.SelectRow( ll_CurRow , True )
				End If
			End If
			
			lnv_data.event ue_checkout_approval( )
		end if
		Return
END CHOOSE

//Modified By Ken.Guo 2011-06-29.Trigger off audit trail
DateTime ldt_server
n_ds lds_checkout_stauts
lds_checkout_stauts = Create n_ds
lds_checkout_stauts.DataObject = 'd_am_checkout_status_update'
lds_checkout_stauts.SetTransObject(SQLCA)
ll_cnt = lds_checkout_stauts.Retrieve(lstr_dm_email.doc_id_list)
If ll_cnt <= 0 Then 
	Messagebox('Check Out','Failed to get the document list to set the check out status.')
	Return 
End If
ldt_server = f_get_server_dtm()
For i = 1 To ll_cnt
	lds_checkout_stauts.SetItem(i, 'checkout_by', gs_user_id)
	lds_checkout_stauts.SetItem(i, 'checkout_date', ldt_server)
	lds_checkout_stauts.SetItem(i, 'checkout_status',ls_checkout_status )
Next

If lds_checkout_stauts.update() = 1 Then
	For i = 1 To UpperBound(lstr_add_audit)
		lstr_add_audit[i].action = ls_action_name 
		lstr_add_audit[i].notes = ls_notes	
	Next
	inv_dm_utils.of_add_audit_trail( lstr_add_audit[] )
ELSE
	MESSAGEBOX("Check Out", 'Failed to set the document~'s check out status.' + sqlca.sqlerrtext)
	SetPointer(Arrow!)	
	If isvalid(lds_checkout_stauts) Then Destroy lds_checkout_stauts
	RETURN
END IF

//Refresh the browse window	
//This.Event ue_retrieve( )
//This.of_locate_doc(lstr_add_audit[1].doc_id)

SetPointer(Arrow!)  //for refresh problem on new image ocx - Alfee 05.19.2008

If isvalid(lds_checkout_stauts) Then Destroy lds_checkout_stauts

if isvalid(gw_contract) then
	gw_contract.tab_contract_details.tabpage_images.tab_1.tabpage_data.event ue_retrieve()
end if

close(this)
	
RETURN

end subroutine

public subroutine of_compare_document ();//====================================================================
// Function: of_compare_document
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  (none)
//--------------------------------------------------------------------
// Author:	Jay Chen		Date: 11-05-2015
//--------------------------------------------------------------------
//	Copyright (c) 2008-2014 ContractLogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

String ls_sourcefile, ls_targetfile
String ls_comparefile,ls_comparefile_copy 
String ls_source_docname, ls_target_docname, ls_source_rev, ls_target_rev, ls_title 
Long ll_rowcnt, ll_found 

//ole_1.Object.Close()	- commented by alfee 09.23.2008
IF IsNull(istr_doc_compare.doc_id1) OR IsNull(istr_doc_compare.revision1) OR istr_doc_compare.doc_id1 < 1 OR istr_doc_compare.revision1 < 0 THEN RETURN
IF IsNull(istr_doc_compare.doc_id2) OR IsNull(istr_doc_compare.revision2) OR istr_doc_compare.doc_id2 < 1 OR istr_doc_compare.revision2 < 0 THEN RETURN
if not FileExists(is_sourcefile) then Return
if not FileExists(is_targetfile) then Return
if istr_doc_compare.doc_id1 = istr_doc_compare.doc_id2 and istr_doc_compare.revision1 = istr_doc_compare.revision2 then
	Messagebox('Document Comparison', 'Please select two different document comparison.')
	return
end if

st_info.text = 'Generating Compare Document, Please wait......'
ls_targetfile = is_targetfile
SetPointer(HourGlass!) //Added By Jay Chen 11-26-2015

this.setredraw( false)
TRY 
If ole_1.object.doctype > 0 Then ole_1.object.ActiveDocument.Saved = True //Added By Ken.Guo 2016-05-23. workaround Task 524	
OLE_1.Object.Close()	//Close doc before changed to another version number -- jervis 11.24.2010
//********Compare document Files *************//
ls_comparefile = gs_dir_path + gs_DefDirName + "\Agreement\" + '_docs_compare.doc'
ls_comparefile_copy = gs_dir_path + gs_DefDirName + "\Agreement\" + '_docs_compare_copy.doc'

//Copy the file to a temporary compare file 
IF FileExists(ls_targetfile) and FileCopy(ls_targetfile, ls_comparefile, TRUE) <> 1 THEN 
	MessageBox("Document Comparison","Please make sure the file of '" + ls_comparefile + "' can be deleted!" )
	RETURN
END IF

IF FileCopy(is_sourcefile, ls_comparefile_copy, TRUE) <> 1 THEN				
	MessageBox("Document Comparison","Please make sure the file of '" + ls_comparefile_copy + "' can be deleted!" )
	RETURN 
END IF

//Added By Ken.Guo 2010-02-04. Accept ALL changes for two file 
n_cst_ovole_utils lnv_ole_utils_doc
lnv_ole_utils_doc = Create n_cst_ovole_utils
lnv_ole_utils_doc.of_acceptall(ls_comparefile)		
lnv_ole_utils_doc.of_acceptall(ls_comparefile_copy)	
Destroy lnv_ole_utils_doc	

IF Len(ls_comparefile) > 0 and FileExists(ls_comparefile) THEN
	//Compare and saveas the document under a new Word2007 application
	IF gs_word_version = 'word2007' THEN
		IF NOT IsValid(iole_word) THEN
			iole_word = Create OleObject
			app_filler.of_set_word_safemode(false, 1) //Added By Ken.Guo 2015-07-30
			IF iole_word.Connecttonewobject("word.application") <> 0 THEN
				app_filler.of_set_word_safemode(false, 0) //Added By Ken.Guo 2015-07-30
				Messagebox('Client Error', 'Could not connect to Microsoft Word. Please make sure it is properly installed.')
				Destroy iole_word					
				RETURN 
			END IF
			app_filler.of_set_word_safemode(false, 0) //Added By Ken.Guo 2015-07-30
		END IF

		iole_word.Visible = FALSE
		iole_word.Application.NormalTemplate.Saved = TRUE  
		iole_word.Application.Documents.Open(ls_comparefile_copy, False, True) 
		gnv_word_utility.of_modify_word_property( iole_word.Activedocument)	//Added By Mark Lee 06/20/2013 change for office 2013.
		gnv_shell.of_delete_recent( ls_comparefile_copy, true) //Added By Ken.Guo 2010-05-25. Delete Windows Recent Document.
		iole_word.ActiveDocument.Compare(ls_targetfile, "External", 1, True, True, False)
		gnv_shell.of_delete_recent( ls_targetfile, true) //Added By Ken.Guo 2010-05-25. Delete Windows Recent Document.
		iole_word.ActiveDocument.SaveAs(ls_comparefile, wdFormatDocument,false,'',false)
		gnv_shell.of_delete_recent( ls_comparefile, true) //Added By Ken.Guo 2010-05-25. Delete Windows Recent Document.
		iole_word.ActiveDocument.Close(0)
	END IF	
		
	//Open the file to be compared
	app_filler.of_set_word_safemode(false, 1) //Added By Ken.Guo 2015-07-30
	If ole_1.object.doctype > 0 Then ole_1.object.ActiveDocument.Saved = True //Added By Ken.Guo 2016-05-23. workaround Task 524
	OLE_1.Object.OpenLocalFile(ls_comparefile, TRUE) 			
	app_filler.of_set_word_safemode(false, 0) //Added By Ken.Guo 2015-07-30
	gnv_word_utility.of_modify_word_property( ole_1.object.ActiveDocument)	//Added By Mark Lee 06/20/2013 change for office 2013.	
	//Compare with the source document if under non Word 2007 environment
	IF gs_word_version <> 'word2007' THEN 
		IF gs_word_version = 'word2003' or gs_word_version = 'wordxp' THEN
			ole_1.object.ActiveDocument.Compare(ls_comparefile_copy, "External", 1, True, True, False )
		ELSE
			ole_1.object.ActiveDocument.Compare(ls_comparefile_copy)
		END IF
	END IF	
	gnv_shell.of_delete_recent( ls_comparefile_copy, true) //Added By Ken.Guo 2010-05-25. Delete Windows Recent Document.
	//Open the source file - jervis 01.13.2010
	//Ole_source.object.OpenLocalFile(ls_sourcefile,true)

END IF

CATCH (Throwable th) 
	IF OLE_1.Object.doctype = 1 THEN 
		If ole_1.object.doctype > 0 Then ole_1.object.ActiveDocument.Saved = True //Added By Ken.Guo 2016-05-23. workaround Task 524
		OLE_1.Object.Close()
	End If
	if ole_first.Object.doctype = 1 THEN 
		If ole_first.object.doctype > 0 Then ole_first.object.ActiveDocument.Saved = True //Added By Ken.Guo 2016-05-23. workaround Task 524
		ole_first.Object.Close()
	End If
	if ole_second.Object.doctype = 1 THEN 
		If ole_second.object.doctype > 0 Then ole_second.object.ActiveDocument.Saved = True //Added By Ken.Guo 2016-05-23. workaround Task 524
		ole_second.Object.Close()
	End If
	f_word_destroy(iole_word, "")
END TRY
st_info.text = 'Generate Compare Document successfully.'
dw_1.reset()
dw_1.insertrow(0)
of_set_default()
this.setredraw( true)
end subroutine

public subroutine of_clear_compare_flag ();//====================================================================
// Function: of_clear_compare_flag
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:	Jay Chen		Date: 09-21-2015
//--------------------------------------------------------------------
//	Copyright (c) 2008-2014 ContractLogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

long ll_cnt,ll_row
str_doc_compare lstr_dm_compare

if isvalid(gw_contract) then
	ll_cnt = gw_contract.tab_contract_details.tabpage_images.tab_1.tabpage_data.tab_1.tabpage_browse.dw_detail.rowcount()
	for ll_row = 1 to ll_cnt
		gw_contract.tab_contract_details.tabpage_images.tab_1.tabpage_data.tab_1.tabpage_browse.dw_detail.setitem(ll_row,"compare_status", '')
		gw_contract.tab_contract_details.tabpage_images.tab_1.tabpage_data.tab_1.tabpage_browse.dw_detail.selectrow(ll_row,false)
	next
	gw_contract.tab_contract_details.tabpage_images.tab_1.tabpage_data.istr_dm_compare = lstr_dm_compare //Added By Jay Chen 11-19-2015
end if
end subroutine

public function decimal of_get_latest_rev (long al_doc_id);decimal{1} ld_rev

select revision into :ld_rev from ctx_am_document where doc_id = :al_doc_id;
return ld_rev
end function

public function integer of_displayfile (string as_index);//====================================================================
// Function: of_displayfile
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value    string    as_index
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:	Jay Chen		Date: 09-18-2015
//--------------------------------------------------------------------
//	Copyright (c) 2008-2014 ContractLogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
decimal{1} ld_rev1,ld_rev2,ld_latest_rev1,ld_latest_rev2
long ll_doc_id1,ll_doc_id2

choose case as_index
	case "first"
		ll_doc_id1 = dw_first.getitemnumber(1, "doc_id")
		ld_rev1 = dw_first.getitemdecimal(1, "revision")
		ld_latest_rev1 = of_get_latest_rev(ll_doc_id1)
		if ld_rev1 = ld_latest_rev1 then
//			If ib_latest2 Then //added by gavins 20150928
//				MessageBox("Tips","This revision is open in the second document.") 
//				If dw_first.GetRow() > 0 Then 
//					dw_first.setitem(dw_first.GetRow( ), "revision",istr_doc_compare.revision1)
//					dw_first.AcceptText( )
//				End If
//				Return 2
//			End If
			ib_latest1 = true
		else
			ib_latest1 = false
		end if
		If ole_first.object.doctype > 0 Then ole_first.object.ActiveDocument.Saved = True //Added By Ken.Guo 2016-05-23. workaround Task 524
		ole_first.Object.Close()
		if not isnull(istr_doc_compare.doc_id1) and not isnull(ld_rev1) and (istr_doc_compare.doc_id1 > 0 and ld_rev1 >= 0 ) then
			//download file
			is_filename1 = inv_dm_utils.of_download_file( istr_doc_compare.doc_id1, ld_rev1)
			is_sourcefile = is_filename1
			//Open document
//			ole_first.Object.Close()
			Try
				app_filler.of_set_word_safemode(false, 1) 
				If ole_first.object.doctype > 0 Then ole_first.object.ActiveDocument.Saved = True //Added By Ken.Guo 2016-05-23. workaround Task 524
				ole_first.object.OpenLocalFile(is_filename1,true)
				app_filler.of_set_word_safemode(false, 0) 
				gnv_word_utility.of_modify_word_property( ole_first.object.ActiveDocument)
				gnv_shell.of_delete_recent( is_filename1, True)
			CATCH (Throwable th) 
				IF ole_first.Object.doctype = 1 THEN 
					If ole_first.object.doctype > 0 Then ole_first.object.ActiveDocument.Saved = True //Added By Ken.Guo 2016-05-23. workaround Task 524
					ole_first.Object.Close()
				End If
			end try
			//set document readonly property
//			if ib_readonly1 then //Modified By Jay Chen 11-05-2015
//				ole_first.object.ActiveDocument.Protect(3,1, "",0,0 )  //3:wdAllowOnlyReading
				ole_first.object.SetReadOnly (true,"")
//			end if
			if isvalid(ole_first.object.ActiveDocument) then ole_first.object.ActiveDocument.saved = true
			if not ib_not_compare then of_compare_document() //Added By Jay Chen 11-05-2015
		end if
	
	case "second"
		ll_doc_id2 = dw_second.getitemnumber(1, "doc_id")
		ld_rev2 = dw_second.getitemdecimal(1, "revision")
		ld_latest_rev2 = of_get_latest_rev(ll_doc_id2)
		if ld_rev2 = ld_latest_rev2 then
//			If ib_latest1 Then //added by gavins 20150928
//				MessageBox("Tips","This revision is open in the first document.") 
//				If dw_second.GetRow() > 0 Then
//					dw_second.setitem(dw_second.GetRow( ), "revision",istr_doc_compare.revision2)
//					dw_second.AcceptText( )
//				End If
//				Return 2
//			End If
			ib_latest2 = true
		else
			ib_latest2 = false
		end if
		If ole_second.object.doctype > 0 Then ole_second.object.ActiveDocument.Saved = True //Added By Ken.Guo 2016-05-23. workaround Task 524
		ole_second.Object.Close()
		if not isnull(istr_doc_compare.doc_id2) and not isnull(ld_rev2) and (istr_doc_compare.doc_id2 > 0 and ld_rev2 >= 0 ) then
			//download file
			is_filename2 = inv_dm_utils.of_download_file( istr_doc_compare.doc_id2, ld_rev2)
			is_targetfile = is_filename2
			//Open document
//			ole_second.Object.Close()
			Try
				app_filler.of_set_word_safemode(false, 1) 
				If ole_second.object.doctype > 0 Then ole_second.object.ActiveDocument.Saved = True //Added By Ken.Guo 2016-05-23. workaround Task 524
				ole_second.object.OpenLocalFile(is_filename2,true)
				app_filler.of_set_word_safemode(false, 0) 
				gnv_word_utility.of_modify_word_property( ole_second.object.ActiveDocument)	
				gnv_shell.of_delete_recent( is_filename2, True)
			CATCH (Throwable th1) 
				IF ole_second.Object.doctype = 1 THEN 
					If ole_second.object.doctype > 0 Then ole_second.object.ActiveDocument.Saved = True //Added By Ken.Guo 2016-05-23. workaround Task 524
					ole_second.Object.Close()
				End If
			end try
			//set document readonly property
//			if ib_readonly2 then
				ole_second.object.SetReadOnly (true,"")
//			end if
			if isvalid(ole_second.object.ActiveDocument) then ole_second.object.ActiveDocument.saved = true
			if not ib_not_compare then of_compare_document() //Added By Jay Chen 11-05-2015
		end if

end choose

Return 0
end function

public subroutine of_set_default ();//====================================================================
// Function: of_set_default
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:	Jay Chen		Date: 11-05-2015
//--------------------------------------------------------------------
//	Copyright (c) 2008-2014 ContractLogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

long						ll_doc_status, ll_category, ll_NULL
string						ls_base_type, ls_name
DataWindowChild		ldwc_category, ldwc_dw


SetNull(ll_NULL)
dw_1.settransobject(sqlca)
dw_1.Setitem(1, "create_by", gs_user_id)
dw_1.setitem(1, 'create_date', Datetime(today()))
dw_1.Setitem(1, "status_by", gs_user_id)	
dw_1.setitem(1, 'status_date', Datetime(today()))
dw_1.Setitem(1, "doc_ext", 'doc') 							// Workaround APB bug. should set a any default value, cannot be null.	
If Isnull(dw_1.GetItemNumber(1, 'status')) Then 		// Use default value in screen if exists.
	// Set default document status is 'New'.
	ll_doc_status = Long(gnv_data.of_getitem( 'code_lookup', 'lookup_code', "upper(lookup_name) = upper('Contract Document Status') and upper(code) = upper('New')"))
	IF ll_doc_status > 0 THEN 
		dw_1.setitem(1, 'status', ll_doc_status)
	End If
End If

dw_1.SetItem(1,"doc_type","Other")
dw_1.SetItem(1,"received_by",gs_user_id)
dw_1.SetItem(1,"received_date",Today())

If isnull(dw_1.GetItemDecimal(1, 'revision')) Then
	dw_1.SetItem(1, "revision", 1.0 )
End If
dw_1.setitem( 1, "revision_control", "1")

//Filter category according to the user rights
dw_1.getchild( "category",ldwc_category)										 					 
ldwc_category.settransobject(sqlca)
ldwc_category.retrieve()

dw_1.getchild( "ctx_id",ldwc_dw)										 					 
ldwc_dw.settransobject(sqlca)
ldwc_dw.retrieve()
//Added By Jay Chen 11-24-2015
long ll_cnt,ll_find,ll_ctx_id
for ll_cnt = ldwc_dw.rowcount() to 1 step -1
	ll_ctx_id = ldwc_dw.getitemnumber(ll_cnt, "ctx_id")
	if isnull(ll_ctx_id) then ll_ctx_id = 0
	if ll_ctx_id > 0 then
		ll_find = ids_user_ctx.find("access = 'F' and ctx_id = " + string(ll_ctx_id), 1, ids_user_ctx.rowcount())
		if isnull(ll_find) then ll_find = 0
		if ll_find < 1 then ldwc_dw.deleterow(ll_cnt)
	end if
next


dw_1.getchild( "status",ldwc_dw)										 					 
ldwc_dw.settransobject(sqlca)
ldwc_dw.retrieve('Contract Document Status')

dw_1.getchild( "doc_type",ldwc_dw)										 					 
ldwc_dw.settransobject(sqlca)
ldwc_dw.retrieve('Contract Document Type')

dw_1.GetChild("doc_from_name", ldwc_dw)
ldwc_dw.SetTransObject(SQLCA)
ldwc_dw.Retrieve(-1)
ldwc_dw.SetSort("id A")
ldwc_dw.Sort()
ldwc_dw.InsertRow(1)

	
//ls_base_type = dw_1.GetItemString(1, "base_type")			
//IF ls_base_type = "1" OR ls_base_type = "2" THEN of_filter_category(ldwc_category, ls_base_type)							
//IF ldwc_category.find('lookup_code = '+string(il_doc_category),1,ldwc_category.rowcount()) > 0 THEN 
//	dw_1.setitem(1, 'category', il_doc_category)
//	If gnv_data.of_getitem( 'icred_settings', 'filter_template', False) = '1' Then 
//		ldwc_template.Setfilter( "type = "+String(ls_base_type)+" and category = " + string(il_doc_category) )
//		ldwc_template.Filter()
//		IF ldwc_template.Rowcount( ) = 0 THEN ldwc_template.InsertRow( 1 )
//	End If
//END IF
	
dw_1.SetitemStatus( 1, 0, Primary!, NotModified! )				


								
end subroutine

public function integer of_save_compare ();//====================================================================
// Function: of_save_compare
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	Jay Chen		Date: 11-05-2015
//--------------------------------------------------------------------
//	Copyright (c) 2008-2014 ContractLogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

Integer li_ret
Decimal ldec_new_revision
String ls_filename, ls_filename_writable,ls_doc_ext
DateTime ldt_modify_date
str_add_audit lstr_add_audit
Long ll_row,ll_doc_id,ll_ctx_id,ll_category,ll_cnt
Long ll_level,ll_status
Boolean lb_checkout_status
long li_version_increment
str_doc_info	lstr_docinfo
Decimal ldec_max_revision  
n_cst_word_utility lnv_word_utility 
decimal{1} ldc_revision
string ls_fullname,ls_doc_type,ls_doc_name,ls_doc_from_name,ls_note
dwItemStatus l_status 

dw_1.accepttext()
if dw_1.rowcount() = 0 then return 1
//l_status = dw_1.getitemstatus( 1, 0, primary!)
//if l_status <> datamodified! and l_status <> newmodified! then return -1
ll_doc_id = dw_1.getitemnumber(1,"doc_id")
if isnull(ll_doc_id) then ll_doc_id = 0

ll_ctx_id = dw_1.getitemnumber(1,"ctx_id")
ll_category = dw_1.getitemnumber(1,"category")
ls_doc_type = dw_1.getitemstring(1,"doc_type")
ls_doc_name = dw_1.getitemstring(1,"doc_name")
ls_doc_from_name = dw_1.getitemstring(1,"doc_from_name")
ls_doc_ext = dw_1.getitemstring(1, "doc_ext")
ls_note = dw_1.getitemstring(1,"notes")
ll_status = dw_1.getitemnumber(1,"status")
if isnull(ll_ctx_id) then ll_ctx_id = 0
if ll_ctx_id < 1 then
	MessageBox("Save Compared Document", "The Contract ID is required! ")
	dw_1.SetColumn("ctx_id")
	dw_1.SetFocus()
	Return -1
end if

select count(*) into :ll_cnt from ctx_basic_info where ctx_id = :ll_ctx_id;
if isnull(ll_cnt) then ll_cnt = 0
if ll_cnt = 0 then
	MessageBox("Save Compared Document", "The Contract ID is not exists in database! ")
	dw_1.SetColumn("ctx_id")
	dw_1.SetFocus()
	Return -1
end if

if isnull(ll_category) or ll_category = 0 then
	MessageBox("Save Compared Document", "The Category is required! ")
	dw_1.SetColumn("category")
	dw_1.SetFocus()
	Return -1
end if

if isnull(ls_doc_type) or ls_doc_type = '' then
	MessageBox("Save Compared Document", "The Document Type is required! ")
	dw_1.SetColumn("doc_type")
	dw_1.SetFocus()
	Return -1
end if

if isnull(ls_doc_name) or ls_doc_name = '' then
	MessageBox("Save Compared Document", "The Document Name is required! ")
	dw_1.SetColumn("doc_name")
	dw_1.SetFocus()
	Return -1
end if

 if ll_doc_id = 0 then //new
	ldt_modify_date = DateTime(Today(), Now())

	ll_doc_id = gnv_app.of_get_id("doc_id")
	dw_1.setitem( 1, "doc_id", ll_doc_id)

//	ls_doc_ext = dw_1.getitemstring(1, "doc_ext")

	li_version_increment = of_get_app_setting("set_57",'I')	//Version Number Increment Option
		
	Openwithparm(w_appeon_gifofwait, "Saving the document...")
	
	ldec_new_revision = 1.0

	li_ret = dw_1.update()
	If li_ret < 0 Then return -1
	
	// Generate file name
	ls_filename = inv_dm_utils.of_generate_tempname(ll_doc_id, ldec_new_revision, ls_doc_ext)
	ls_filename_writable = inv_dm_utils.of_generate_tempname_writable(ll_doc_id, ldec_new_revision, ls_doc_ext)
		
	// Insert new record of image to the DB
	INSERT Ctx_am_doc_image(Doc_id, Revision, doc_ext, modify_date,doc_ext_full)
	Values( :ll_doc_id, :ldec_new_revision, :ls_doc_ext, :ldt_modify_date ,:ls_doc_ext);
				
	// Set check out status to record
	UPDATE Ctx_am_document
	SET 	revision = :ldec_new_revision,
			revision_control = '1',
			checkout_by = '',
			checkout_date = NULL,
			checkout_status = '0'
	Where Doc_id = :ll_doc_id;

	If IsValid(w_appeon_gifofwait) Then w_appeon_gifofwait.event timer()

	// Save document
	of_savetofile( ls_filename, 'compare')

	// Upload local file to DB
	inv_dm_utils.of_upload_file( ll_doc_id, ldec_new_revision, ls_filename)

	//Save the latest update date of the current file in Registry
	//Modified By Ken.Guo 2015-04-29
	select modify_date into :ldt_modify_date from Ctx_am_doc_image where doc_id = :ll_doc_id and revision = :ldec_new_revision;
	gnv_filetime.of_setlastwritedatetime( ls_filename, ldt_modify_date)
		
	//////////////////////////////////////////////////////////////////// //
	//// Trigger off audit trail
	///////////////////////////////////////////////////////////////////////
	lstr_add_audit.Doc_id = ll_doc_id
	lstr_add_audit.Revision = ldec_new_revision
	lstr_add_audit.doc_ext = ls_doc_ext
	lstr_add_audit.action = "New Compared Document"
	inv_dm_utils.of_add_audit_trail( lstr_add_audit )

	//dw_1.reset()
	//dw_1.insertrow(0)
	//of_set_default()
	//dw_1.resetupdate()

	// Refresh data
	if isvalid(gw_contract) then
		gw_contract.tab_contract_details.tabpage_images.tab_1.tabpage_data.event ue_retrieve()
		of_clear_compare_flag()
	end if
	
	If IsValid(w_appeon_gifofwait) Then close(w_appeon_gifofwait)

else  
	Openwithparm(w_appeon_gifofwait, "Saving the document...")
	ldec_new_revision = 1.0
	
	update ctx_am_document 
	set ctx_id=:ll_ctx_id,category=:ll_category,doc_type=:ls_doc_type,doc_name=:ls_doc_name,doc_from_name=:ls_doc_from_name,notes=:ls_note,status=:ll_status
	where doc_id = :ll_doc_id;
	
	// Generate file name
	ls_filename = inv_dm_utils.of_generate_tempname(ll_doc_id, ldec_new_revision, ls_doc_ext)
	
	If IsValid(w_appeon_gifofwait) Then w_appeon_gifofwait.event timer()
	
	// Save document
	of_savetofile( ls_filename, 'compare')

	// Upload local file to DB
	inv_dm_utils.of_upload_file( ll_doc_id, ldec_new_revision, ls_filename)

	//Save the latest update date of the current file in Registry
	//Modified By Ken.Guo 2015-04-29
	select modify_date into :ldt_modify_date from Ctx_am_doc_image where doc_id = :ll_doc_id and revision = :ldec_new_revision;
	gnv_filetime.of_setlastwritedatetime( ls_filename, ldt_modify_date)
	
	If IsValid(w_appeon_gifofwait) Then close(w_appeon_gifofwait)
end if

RETURN 1


end function

public subroutine of_convert_pdf ();//====================================================================
// Function: of_convert_pdf
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:	Jay Chen		Date: 11-16-2015
//--------------------------------------------------------------------
//	Copyright (c) 2008-2014 ContractLogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

Integer 	li_file,li_rtn
Long 		ll_cnt, i, j, ll_pos,ll_Len
String 	ls_ext, ls_temp, ls_SourceFile, ls_pdf_path,ls_prntrs,ls_DefPrinter,ls_comparefile
Boolean  lb_doc = FALSE, lb_img = FALSE //alfee 11.21.2008
Integer k
Integer li_type //1: org, 2: clean

Oleobject lole_word
n_cst_filesrvwin32 lnv_filesvr

SetPointer(HourGlass!)

ls_comparefile = gs_dir_path + gs_DefDirName + "\Agreement\" + '_docs_compare.doc'

//Added By Jay Chen 09-29-2014
n_cst_convert2pdf lnv_doctopdf 
lnv_doctopdf = create n_cst_convert2pdf
//end

SetPointer(HourGlass!)
is_filename[1] = '_docs_compare.doc'
is_fullname[1] = ls_comparefile
li_type = 1

li_rtn = lnv_doctopdf.of_check_pdfprinter()
if li_rtn = -1 then
	return
elseif li_rtn = -2 then
	return
end if
		
//Convert to PDF, get & convert all Word documents 
ls_SourceFile = "C:\Program Files\PDFPrinter\temp\SampleOut.PDF"
li_rtn = lnv_doctopdf.of_delete_file(ls_SourceFile)
if li_rtn = -1 then
	RETURN
end if
		
lole_word = Create oleobject
app_filler.of_set_word_safemode(false, 1) //Added By Ken.Guo 2015-07-30
IF lole_word.Connecttonewobject("word.application") <> 0 THEN
	app_filler.of_set_word_safemode(false, 0) //Added By Ken.Guo 2015-07-30
	Destroy lole_word //Alfee 01.17.2008
	Messagebox('Client Error', 'Could not connect to Microsoft Word. Please make sure it is properly installed.')
	RETURN
END IF
app_filler.of_set_word_safemode(false, 0) //Added By Ken.Guo 2015-07-30
lole_word.Visible = FALSE	
lole_word.Application.NormalTemplate.Saved = TRUE //moved here - alfee 11.21.2008	
	

TRY
//lole_word.Application.NormalTemplate.Saved = TRUE //Alfee 01.17.2008	
If Not isvalid(w_appeon_gifofwait) Then OpenwithParm(w_appeon_gifofwait,"Converting to PDF...")
	
IF Isvalid(w_appeon_gifofwait) THEN w_appeon_gifofwait.event timer()
ls_ext = Mid(is_fullname[1], LastPos(is_fullname[1], ".") + 1)
		
SetPointer(HourGlass!)
IF lower(ls_ext) = 'doc' or lower(ls_ext) = 'docx'  THEN			//Added By Mark 07/18/2014
	//Delete temporary pdf file  - Alfee 08.22.2007
	IF FileExists(ls_SourceFile) THEN FileDelete(ls_SourceFile)
			
	//Open Word Document 		
	lole_word.Application.Documents.Open(is_fullname[1],false,true)	
	gnv_word_utility.of_modify_word_property( lole_word.Activedocument)	//Added By Mark Lee 06/20/2013 change for office 2013.
	gnv_shell.of_delete_recent( is_fullname[1], true) //Added By Ken.Guo 2010-05-25. Delete Windows Recent Document.
	//IF Isvalid(w_appeon_gifofwait) THEN w_appeon_gifofwait.event timer()
				
	//Set pdf Printer and print to PDF format
		Try
			/**********************
			if f_PrinterSetup(2) >= 2 then return		//Added by Scofield on 2007-11-09
				
			ll_Len = 100
			ls_DefPrinter = SPACE(ll_Len)
			GetDefaultPrinter(ls_DefPrinter,ll_Len)	//Added by Scofield on 2008-12-09
	
			lole_word.ActiveDocument.Application.ActivePrinter = "Contract Logix PDF Writer"
			lole_word.ActiveDocument.Printout( 0 )
			lole_word.ActiveDocument.Close(0)
				
			SetDefaultPrinter(ls_DefPrinter)				//Added by Scofield on 2008-07-30
			***********************/
			//Added By Jay Chen 09-29-2014
			lnv_doctopdf.of_printout_pdf( lole_word.Activedocument) 
			lole_word.ActiveDocument.Close(0)
			//end
	
		Catch(Throwable th1) //added by alfee 04.11.2007
			lole_word.ActiveDocument.Close(0)		
			lole_word.Quit(0)
			lole_word.DisconnectObject( )
			Destroy lole_word
			If isvalid(lnv_filesvr) Then Destroy lnv_filesvr	
			IF Isvalid(lnv_doctopdf) THEN Destroy lnv_doctopdf //Added By Jay Chen 09-29-2014
			IF Isvalid(w_appeon_gifofwait) THEN Close(w_appeon_gifofwait)
			MessageBox("Printer Error","The Contract Logix PDF Writer is not configured correctly!")			
			RETURN
		End Try
	
		// Copy to pdf file
		ls_pdf_path =	Left(is_fullname[1], LastPos(is_fullname[1], ".") ) + "pdf"	
			
		If not isvalid(lnv_filesvr) Then lnv_filesvr = create n_cst_filesrvwin32
		//--------Begin Modified by Alfee 08.29.2007---------------	
		/***************************
		Do 
			//Yield()
			If FileExists(ls_sourcefile) Then 
				li_file = FileOpen(ls_sourcefile, StreamMode!, Write!)
			Else
				li_file = -1
			End If
			Loop While li_file = -1
			FileClose(li_file)
			//lnv_filesvr.of_filecopy(ls_sourcefile, ls_pdf_path )
			filecopy(ls_sourcefile, ls_pdf_path ,true) //APB Blob Bug - jervis 03.23.2010
		***********************/
			lnv_doctopdf.of_copy_pdf_file(ls_sourcefile,ls_pdf_path) //Added By Jay Chen 09-29-2014
//			is_temp_pdf[UpperBound(is_temp_pdf[]) + 1] = ls_pdf_path   //Added By Ken.Guo 2009-05-20.
		/*Do While NOT lnv_filesvr.of_filecopy(ls_sourcefile, ls_pdf_path ) = 1
			Yield()
		Loop*/
		//--------End Modified ---------------------------------------
	end if		
	
Catch(Throwable th) //added by alfee 04.11.2007
	If isvalid(lole_word) Then	
		lole_word.Quit(0)
		lole_word.DisconnectObject( )		
		Destroy lole_word
	END IF
	If isvalid(lnv_filesvr) Then Destroy lnv_filesvr	
	IF Isvalid(lnv_doctopdf) THEN Destroy lnv_doctopdf //Added By Jay Chen 09-29-2014
	IF Isvalid(w_appeon_gifofwait) THEN Close(w_appeon_gifofwait)
	RETURN
End Try
	
//Quit Word application
IF isvalid(lole_word) Then	//add if statement - alfee 11.21.2008
	lole_word.Quit(0)
	lole_word.DisconnectObject( )
	Destroy lole_word
END IF
If isvalid(lnv_filesvr) Then Destroy lnv_filesvr		
IF Isvalid(lnv_doctopdf) THEN Destroy lnv_doctopdf //Added By Jay Chen 09-29-2014
	
//	//Update attachment field and variable after convert
//	is_attach_file = ""
//	FOR i = 1 TO ll_cnt
//		//Set attchment array
//		is_fullname_convert[i] = is_fullname[i]
//		is_filename_convert[i] = is_filename[i]
//	  
//		IF len(trim(is_fullname[i])) < 1 THEN CONTINUE
//		ls_ext = Mid(is_fullname[i], LastPos(is_fullname[i], ".") + 1)
//		//IF lower(ls_ext) = 'doc'  THEN			//Added By Mark 07/18/2014 add the extend type of docx. 
//		IF lower(ls_ext) = 'doc' or  lower(ls_ext) = 'docx' OR of_is_image2pdf(ls_ext) THEN	//alfee 11.21.2008
////			ls_temp = Left(is_fullname[i], Len(is_fullname[i]) - 3) + "pdf"				//Added By Mark 07/18/2014
//			ls_temp = Left(is_fullname[i], LastPos(is_fullname[i], ".") ) + "pdf"	
//			IF FILEEXISTS(ls_temp) THEN
//				is_fullname_convert[i] = ls_temp
////				is_filename_convert[i] = Left(is_filename[i], Len(is_filename[i]) - 3) + "pdf"		//Added By Mark 07/18/2014
//				is_filename_convert[i] = Left(is_fullname[i], LastPos(is_fullname[i], ".") ) + "pdf"	
//			END IF
//		END IF
//	NEXT	
	

IF Isvalid(w_appeon_gifofwait) THEN Close(w_appeon_gifofwait)
end subroutine

event open;call super::open;long ll_doc_id1,ll_doc_id2,ll_row,ll_current_row,ll_null,ll_cnt,ll_find,ll_ctx_id
string ls_filename1,ls_filename2

setnull(ll_null)
gnv_reg_ocx.of_check_ocx( 1,'', True) //1: office 

istr_doc_compare = message.powerobjectparm
ll_doc_id1 = istr_doc_compare.doc_id1
ll_doc_id2 = istr_doc_compare.doc_id2
//this.windowstate = Maximized! 

if ll_doc_id1 <> ll_doc_id2 then
	ll_row = dw_first.insertrow(0)
	dw_first.setitem(ll_row,"doc_id", ll_doc_id1)
	dw_first.setitem(ll_row,"ctx_id", istr_doc_compare.ctx_id1)
	dw_first.setitem(ll_row,"revision", istr_doc_compare.revision1)
	dw_first.setitem(ll_row,"doc_name", istr_doc_compare.fullname1)
	dw_first.getchild("revision", idwc_rev)
	idwc_rev.settransobject(sqlca)
	idwc_rev.retrieve(ll_doc_id1)

	ll_row = dw_second.insertrow(0)
	if ll_doc_id2 = 0 then
		dw_second.setitem(ll_row,"ctx_id", ll_null)
		dw_second.setitem(ll_row,"doc_id", ll_null)
		dw_second.setitem(ll_row,"revision", ll_null)
		dw_second.setitem(ll_row,"doc_name", '')
	else
		dw_second.setitem(ll_row,"doc_id", ll_doc_id2)
		dw_second.setitem(ll_row,"ctx_id", istr_doc_compare.ctx_id2)
		dw_second.setitem(ll_row,"revision", istr_doc_compare.revision2)
		dw_second.setitem(ll_row,"doc_name", istr_doc_compare.fullname2)
		dw_second.getchild("revision", idwc_rev)
		idwc_rev.settransobject(sqlca)
		idwc_rev.retrieve(ll_doc_id2)
	end if
else
	if istr_doc_compare.revision1 < istr_doc_compare.revision2 then
		ll_row = dw_first.insertrow(0)
		dw_first.setitem(ll_row,"doc_id", ll_doc_id1)
		dw_first.setitem(ll_row,"ctx_id", istr_doc_compare.ctx_id1)
		dw_first.setitem(ll_row,"revision", istr_doc_compare.revision1)
		dw_first.setitem(ll_row,"doc_name", istr_doc_compare.fullname1)
		dw_first.getchild("revision", idwc_rev)
		idwc_rev.settransobject(sqlca)
		idwc_rev.retrieve(ll_doc_id1)
		ll_row = dw_second.insertrow(0)
		dw_second.setitem(ll_row,"doc_id", ll_doc_id2)
		dw_second.setitem(ll_row,"ctx_id", istr_doc_compare.ctx_id2)
		dw_second.setitem(ll_row,"revision", istr_doc_compare.revision2)
		dw_second.setitem(ll_row,"doc_name", istr_doc_compare.fullname2)
		dw_second.getchild("revision", idwc_rev)
		idwc_rev.settransobject(sqlca)
		idwc_rev.retrieve(ll_doc_id2)
	else
		ll_row = dw_first.insertrow(0)
		dw_first.setitem(ll_row,"doc_id", ll_doc_id2)
		dw_first.setitem(ll_row,"ctx_id", istr_doc_compare.ctx_id2)
		dw_first.setitem(ll_row,"revision", istr_doc_compare.revision2)
		dw_first.setitem(ll_row,"doc_name", istr_doc_compare.fullname2)
		dw_first.getchild("revision", idwc_rev)
		idwc_rev.settransobject(sqlca)
		idwc_rev.retrieve(ll_doc_id2)
		ll_row = dw_second.insertrow(0)
		dw_second.setitem(ll_row,"doc_id", ll_doc_id1)
		dw_second.setitem(ll_row,"ctx_id", istr_doc_compare.ctx_id1)
		dw_second.setitem(ll_row,"revision", istr_doc_compare.revision1)
		dw_second.setitem(ll_row,"doc_name", istr_doc_compare.fullname1)
		dw_second.getchild("revision", idwc_rev)
		idwc_rev.settransobject(sqlca)
		idwc_rev.retrieve(ll_doc_id1)
	end if
end if

//Added By Jay Chen 09-25-2015
dw_first.getchild("doc_id", idwc_doc)
idwc_doc.settransobject(sqlca)
idwc_doc.retrieve(istr_doc_compare.ctx_id1)
dw_second.getchild("doc_id", idwc_doc)
idwc_doc.settransobject(sqlca)
//if ll_doc_id2 = 0 then
//	idwc_doc.retrieve(istr_doc_compare.ctx_id1)
//else
	idwc_doc.retrieve(istr_doc_compare.ctx_id2)
//end if
//end

//Added By Jay Chen 11-05-2015
dw_first.getchild("ctx_id", idwc_ctx1)
idwc_ctx1.settransobject(sqlca)
idwc_ctx1.retrieve()

dw_second.getchild("ctx_id", idwc_ctx2)
idwc_ctx2.settransobject(sqlca)
idwc_ctx2.retrieve()

//Added By Jay Chen 11-24-2015
ids_user_ctx = create datastore 
ids_user_ctx.dataobject = 'd_user_ctx_lists'
ids_user_ctx.settransobject(sqlca)
ids_user_ctx.retrieve(gs_user_id)

for ll_cnt = idwc_ctx1.rowcount() to 1 step -1
	ll_ctx_id = idwc_ctx1.getitemnumber(ll_cnt, "ctx_id")
	ll_find = ids_user_ctx.find("ctx_id = " + string(ll_ctx_id), 1, ids_user_ctx.rowcount())
	if isnull(ll_find) then ll_find = 0
	if ll_find < 1 then idwc_ctx1.deleterow(ll_cnt)
next

for ll_cnt = idwc_ctx2.rowcount() to 1 step -1
	ll_ctx_id = idwc_ctx2.getitemnumber(ll_cnt, "ctx_id")
	ll_find = ids_user_ctx.find("ctx_id = " + string(ll_ctx_id), 1, ids_user_ctx.rowcount())
	if isnull(ll_find) then ll_find = 0
	if ll_find < 1 then idwc_ctx2.deleterow(ll_cnt)
next

dw_1.insertrow(0)
of_set_default()

//if isvalid(gw_contract) then //Modified By Jay Chen 09-25-2015
//	ll_current_row = gw_contract.tab_contract_details.tabpage_images.tab_1.tabpage_data.tab_1.tabpage_browse.dw_browse.getrow()
//	if ll_current_row > 0 then
//		is_status = gw_contract.tab_contract_details.tabpage_images.tab_1.tabpage_data.tab_1.tabpage_browse.dw_browse.getitemstring(ll_current_row, "checkout_status")
//		if isnull(is_status) then is_status = ''
//	end if
//end if

of_displayfile("first")
of_displayfile("second")

//If w_mdi.of_security_access( 6911 ) = 0 Then  //check out
//	cb_check.visible = false
//else
//	cb_check.visible = true
//end if
//
//If w_mdi.of_security_access( 6905 ) = 0 Then  //email
//	cb_email.visible = false
//else
//	cb_email.visible = true
//end if
//
//If w_mdi.of_security_access( 6912 ) = 0 Then  //save
//	cb_save.visible = false
//else
//	cb_save.visible = true
//end if
//

//if istr_doc_compare.readonly1 and istr_doc_compare.readonly2 then
//	cb_save.enabled = false
//	cb_check.enabled = false
//else
//	cb_save.enabled = true
//	cb_check.enabled = true
//end if


end event

on w_dm_check_compare.create
int iCurrent
call super::create
this.pb_4=create pb_4
this.pb_3=create pb_3
this.pb_1=create pb_1
this.pb_2=create pb_2
this.cb_up=create cb_up
this.st_info=create st_info
this.dw_1=create dw_1
this.ole_1=create ole_1
this.dw_second=create dw_second
this.cb_email=create cb_email
this.ole_first=create ole_first
this.ole_second=create ole_second
this.cb_close=create cb_close
this.cb_check=create cb_check
this.cb_save=create cb_save
this.dw_first=create dw_first
this.gb_second=create gb_second
this.gb_first=create gb_first
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_4
this.Control[iCurrent+2]=this.pb_3
this.Control[iCurrent+3]=this.pb_1
this.Control[iCurrent+4]=this.pb_2
this.Control[iCurrent+5]=this.cb_up
this.Control[iCurrent+6]=this.st_info
this.Control[iCurrent+7]=this.dw_1
this.Control[iCurrent+8]=this.ole_1
this.Control[iCurrent+9]=this.dw_second
this.Control[iCurrent+10]=this.cb_email
this.Control[iCurrent+11]=this.ole_first
this.Control[iCurrent+12]=this.ole_second
this.Control[iCurrent+13]=this.cb_close
this.Control[iCurrent+14]=this.cb_check
this.Control[iCurrent+15]=this.cb_save
this.Control[iCurrent+16]=this.dw_first
this.Control[iCurrent+17]=this.gb_second
this.Control[iCurrent+18]=this.gb_first
this.Control[iCurrent+19]=this.gb_1
end on

on w_dm_check_compare.destroy
call super::destroy
destroy(this.pb_4)
destroy(this.pb_3)
destroy(this.pb_1)
destroy(this.pb_2)
destroy(this.cb_up)
destroy(this.st_info)
destroy(this.dw_1)
destroy(this.ole_1)
destroy(this.dw_second)
destroy(this.cb_email)
destroy(this.ole_first)
destroy(this.ole_second)
destroy(this.cb_close)
destroy(this.cb_check)
destroy(this.cb_save)
destroy(this.dw_first)
destroy(this.gb_second)
destroy(this.gb_first)
destroy(this.gb_1)
end on

event close;call super::close;//Added By Jay Chen 11-24-2015
long ll_rtn
if of_ismodified("compare") then
	ll_rtn = messagebox('Save Compared Document','The compared document has been modified, do you want to save?',Question!,YesNo!,2) 
	if ll_rtn = 1 then
		if of_save_compare() < 1 then return 
	end if
end if
//end

//Close the opened document
If ole_first.object.doctype > 0 Then ole_first.object.ActiveDocument.Saved = True //Added By Ken.Guo 2016-05-23. workaround Task 524
ole_first.object.close()

If ole_second.object.doctype > 0 Then ole_second.object.ActiveDocument.Saved = True //Added By Ken.Guo 2016-05-23. workaround Task 524
ole_second.object.close()

If ole_1.object.doctype > 0 Then ole_1.object.ActiveDocument.Saved = True //Added By Ken.Guo 2016-05-23. workaround Task 524
ole_1.object.close()

//Quit and destroy word instance for Word 2007 - Alfee 07.24.2008
IF gs_word_version = 'word2007' and IsValid(iole_word) THEN
	iole_word.Quit(0)
	iole_word.DisconnectObject()
	Destroy iole_word
END IF

if isvalid(gw_contract) then
	gw_contract.tab_contract_details.tabpage_images.tab_1.tabpage_data.event ue_retrieve()
end if

of_clear_compare_flag()


end event

event resize;call super::resize;gb_1.width = (This.width - 100) / 2
gb_1.height = This.height - ole_1.y - 687
ole_1.width = gb_1.width - 40
ole_1.height = gb_1.height - 80
dw_1.y = gb_1.y + gb_1.height + 5
dw_1.width = gb_1.width
st_info.y = dw_1.y + dw_1.height + 20

ole_first.width = (This.width - 100) / 2 - 20
ole_first.height = (This.height - ole_first.y - 634) / 2
gb_first.width = ole_first.width
gb_first.x = gb_1.x + gb_1.width +30
ole_first.x = gb_first.x
dw_first.x = gb_first.x + 20
dw_first.width = ole_first.width - 40

gb_second.width = gb_first.width
gb_second.x = gb_first.x
gb_second.y = ole_first.y + ole_first.height + 20
dw_second.x = dw_first.x
dw_second.y = gb_second.y + 50
dw_second.width = dw_first.width 
ole_second.x = ole_first.x
ole_second.y = gb_second.y + gb_second.height + 10
ole_second.width = ole_first.width 
ole_second.height = ole_first.height + 30

cb_close.x = ole_second.x + ole_second.width - cb_close.width
cb_close.y = ole_second.y + ole_second.height + 15
cb_email.x = cb_close.x - 400
cb_email.y = cb_close.y
cb_check.x = cb_email.x - 400
cb_check.y = cb_close.y
cb_save.x = cb_check.x - 400
cb_save.y = cb_close.y

cb_up.x = cb_close.x - 140
cb_up.y = dw_second.y +90

//Added By Jay 2016-07-06
pb_1.x = dw_first.x + 1358
pb_1.y = dw_first.y + 100

pb_3.x = dw_first.x + 2244
pb_3.y = dw_first.y + 100

pb_2.x = dw_second.x + 1358
pb_2.y = dw_second.y + 100

pb_4.x = dw_second.x + 2244
pb_4.y = dw_second.y + 100

//Added By Jay 2016-07-06 end
end event

event activate;call super::activate;
//Added By Ken.Guo 2011-05-05. Workaround Office OCX's bug
If gs_imageview_version = '5.0' and isvalid(ole_second ) Then
	If isvalid(ole_second.object) Then ole_second.object.activate(true)
	If isvalid(ole_first.object) Then ole_first.object.activate(true)
End If
end event

event deactivate;call super::deactivate;
//Added By Ken.Guo 2011-05-05. Workaround Office OCX's bug
//If gs_imageview_version = '5.0' and isvalid(ole_1 ) Then
//	ole_1.object.activate(false)
//	ole_source.object.activate(false)
//End If
end event

type pb_4 from picturebutton within w_dm_check_compare
boolean visible = false
integer x = 4206
integer y = 1084
integer width = 101
integer height = 80
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string picturename = "find.bmp"
alignment htextalign = left!
end type

event clicked;//////////////////////////////////////////////////////////////////////
// $<event>pb_4::clicked()
// $<arguments>(None)
// $<returns> long
// $<description>
// $<description> Browse document window
//////////////////////////////////////////////////////////////////////
// $ Added By Jay 2016-07-06
//////////////////////////////////////////////////////////////////////


String  	ls_ctx_id, ls_doc_id, ls_Message
Long 		ll_ctx_id, ll_doc_id

ll_ctx_id = dw_second.GetItemNumber ( dw_second.GetRow(), 'ctx_id' )

Openwithparm ( w_documents_browse_select,  ll_ctx_id  )


ls_Message = message.stringparm

If Len( ls_message ) > 2 Then
	ls_ctx_id = Left ( ls_Message, Pos ( ls_Message,'-' ) - 1 ) 
	ls_doc_id = mid ( ls_Message, Pos ( ls_Message,'-' ) + 1 )
	ll_ctx_id = Long ( ls_ctx_id )
	ll_doc_id = Long ( ls_doc_id )
	If ll_ctx_id > 0 And ll_doc_id > 0 Then	
		dw_second.SetItem ( dw_second.GetRow(), 'ctx_id', ll_ctx_id )
		dw_second.Event Itemchanged ( dw_second.GetRow(), dw_second.object.ctx_id, string ( ll_ctx_id ) )
		dw_second.SetItem ( dw_second.GetRow(), 'doc_id', ll_doc_id )
		dw_second.Event Itemchanged ( dw_second.GetRow(), dw_second.object.doc_id, string ( ll_doc_id ) )
	End If
	
End If
end event

type pb_3 from picturebutton within w_dm_check_compare
boolean visible = false
integer x = 4206
integer y = 156
integer width = 101
integer height = 80
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string picturename = "find.bmp"
alignment htextalign = left!
end type

event clicked;//////////////////////////////////////////////////////////////////////
// $<event>pb_3::clicked()
// $<arguments>(None)
// $<returns> long
// $<description>
// $<description> Browse document window
//////////////////////////////////////////////////////////////////////
// $ Added By Jay 2016-07-06
//////////////////////////////////////////////////////////////////////

String  	ls_ctx_id, ls_doc_id, ls_Message
Long 		ll_ctx_id, ll_doc_id

ll_ctx_id = dw_first.GetItemNumber ( dw_first.GetRow(), 'ctx_id' )

Openwithparm ( w_documents_browse_select,ll_ctx_id )

ls_Message = message.stringparm

If Len( ls_message ) > 2 Then
	ls_ctx_id = Left ( ls_Message, Pos ( ls_Message,'-' ) - 1 ) 
	ls_doc_id = mid ( ls_Message, Pos ( ls_Message,'-' ) + 1 )
	ll_ctx_id = Long ( ls_ctx_id )
	ll_doc_id = Long ( ls_doc_id )
	If ll_ctx_id > 0 And ll_doc_id > 0 Then	
		dw_first.SetItem ( dw_first.GetRow(), 'ctx_id', ll_ctx_id )
		dw_first.Event Itemchanged ( dw_first.GetRow(), dw_first.object.ctx_id, string ( ll_ctx_id ) )
		dw_first.SetItem ( dw_first.GetRow(), 'doc_id', ll_doc_id )
		dw_first.Event Itemchanged ( dw_first.GetRow(), dw_first.object.doc_id, string ( ll_doc_id ) )
	End If
	
End If

end event

type pb_1 from picturebutton within w_dm_check_compare
boolean visible = false
integer x = 3497
integer y = 156
integer width = 101
integer height = 80
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string picturename = "find.bmp"
alignment htextalign = left!
end type

event clicked;//////////////////////////////////////////////////////////////////////
// $<event>pb_1::clicked()
// $<arguments>(None)
// $<returns> long
// $<description>
// $<description> Browse contract window
//////////////////////////////////////////////////////////////////////
// $ Added By Jay 2016-07-06
//////////////////////////////////////////////////////////////////////

String ls_master_contract_name
Long ll_master_contract_id

Openwithparm(w_mastert_contract_search,'ALL')
ls_master_contract_name = message.stringparm  
ll_master_contract_id = long(mid(ls_master_contract_name,1,pos(ls_master_contract_name,'-') - 1))  
If ll_master_contract_id > 0 Then	
	dw_first.SetItem ( dw_first.GetRow(), 'ctx_id', ll_master_contract_id )
	dw_first.Event Itemchanged ( dw_first.GetRow(), dw_first.object.ctx_id, string ( ll_master_contract_id ) )
End If
end event

type pb_2 from picturebutton within w_dm_check_compare
boolean visible = false
integer x = 3497
integer y = 1084
integer width = 101
integer height = 80
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string picturename = "find.bmp"
alignment htextalign = left!
end type

event clicked;//////////////////////////////////////////////////////////////////////
// $<event>pb_2::clicked()
// $<arguments>(None)
// $<returns> long
// $<description>
// $<description> Browse contract window
//////////////////////////////////////////////////////////////////////
// $Added By Jay 2016-07-06
//////////////////////////////////////////////////////////////////////

String ls_master_contract_name
Long ll_master_contract_id

Openwithparm(w_mastert_contract_search,'ALL')
ls_master_contract_name = message.stringparm  
ll_master_contract_id = long(mid(ls_master_contract_name,1,pos(ls_master_contract_name,'-') - 1))  
If ll_master_contract_id > 0 Then	
	dw_Second.SetItem ( dw_Second.GetRow(), 'ctx_id', ll_master_contract_id )
	dw_second.Event Itemchanged ( dw_second.GetRow(), dw_second.object.ctx_id, string ( ll_master_contract_id ) )
End If
end event

type cb_up from commandbutton within w_dm_check_compare
integer x = 2784
integer y = 1880
integer width = 457
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Swap Documents"
end type

event clicked;//====================================================================
// Event: clicked
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	Jay Chen		Date: 11-16-2015
//--------------------------------------------------------------------
//	Copyright (c) 2008-2014 ContractLogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

string ls_name1,ls_name2
long ll_ctx_id1,ll_doc_id1,ll_ctx_id2,ll_doc_id2,ll_rtn
decimal{1} ld_rev1,ld_rev2

ll_rtn = messagebox('Swap documents','Are you sure you want to swap the original document and the revised document?',Question!,YesNo!,2) 
if ll_rtn <> 1 then return

ib_not_compare = true

ls_name1 = dw_first.getitemstring(1, "doc_name")
ll_ctx_id1 = dw_first.getitemnumber(1,"ctx_id")
ll_doc_id1 = dw_first.getitemnumber(1,"doc_id")
ld_rev1 = dw_first.getitemdecimal(1, "revision")
ls_name2 = dw_second.getitemstring(1, "doc_name")
ll_ctx_id2 = dw_second.getitemnumber(1,"ctx_id")
ll_doc_id2 = dw_second.getitemnumber(1,"doc_id")
ld_rev2 = dw_second.getitemdecimal(1, "revision")

dw_first.accepttext()
dw_first.setitem(1, "doc_name", ls_name2)
dw_first.setitem(1, "doc_id", ll_doc_id2)
dw_first.setitem(1, "ctx_id", ll_ctx_id2)
dw_first.setitem(1, "revision", ld_rev2)
istr_doc_compare.doc_id1 = ll_doc_id2
istr_doc_compare.ctx_id1 = ll_ctx_id2
istr_doc_compare.revision1 = ld_rev2
of_displayfile("first")

dw_second.accepttext()
dw_second.setitem(1, "doc_name", ls_name1)
dw_second.setitem(1, "doc_id", ll_doc_id1)
dw_second.setitem(1, "ctx_id", ll_ctx_id1)
dw_second.setitem(1, "revision", ld_rev1)
istr_doc_compare.doc_id2 = ll_doc_id1
istr_doc_compare.ctx_id2 = ll_ctx_id1
istr_doc_compare.revision2 = ld_rev1
of_displayfile("second")

of_compare_document()
ib_not_compare = false

end event

type st_info from statictext within w_dm_check_compare
integer x = 9
integer y = 1932
integer width = 1458
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 134217856
long backcolor = 67108864
boolean focusrectangle = false
end type

type dw_1 from u_dw_contract within w_dm_check_compare
integer x = 9
integer y = 1460
integer width = 2112
integer height = 472
integer taborder = 20
string dataobject = "d_dm_new_buy_document_compare"
boolean hscrollbar = true
boolean vscrollbar = false
end type

event constructor;dw_1.of_SetUpdateAble(true)
//dw_1.of_setdropdowncalendar(True) 		
end event

event buttonclicked;call super::buttonclicked;//====================================================================
// Event: buttonclicked
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value    long        row
// 	value    long        actionreturncode
// 	value    dwobject    dwo
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	Jay Chen		Date: 11-05-2015
//--------------------------------------------------------------------
//	Copyright (c) 2008-2014 ContractLogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
if dwo.name = 'b_save' then
	of_save_compare()
end if
end event

type ole_1 from u_email_edit within w_dm_check_compare
integer x = 27
integer y = 60
integer width = 2075
integer height = 1372
integer taborder = 30
string binarykey = "w_dm_check_compare.win"
end type

event constructor;call super::constructor;this.object.filesaveas = true
end event

event getfocus;call super::getfocus;//if ib_readonly2 then
//	cb_save.enabled = false
//	cb_check.enabled = false
//else
//	cb_save.enabled = true
//	cb_check.enabled = true
//end if
end event

type dw_second from u_dw within w_dm_check_compare
integer x = 2139
integer y = 984
integer width = 2254
integer height = 208
integer taborder = 20
string dataobject = "d_dm_checkout_comparison"
boolean vscrollbar = false
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbfocuschange = false
end type

event itemchanged;call super::itemchanged;//====================================================================
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
// Author:	Jay Chen		Date: 09-18-2015
//--------------------------------------------------------------------
//	Copyright (c) 2008-2014 ContractLogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

long ll_docid,ll_docid2,ll_null
Decimal ldc_null
decimal{1} ldc_revid,ldc_revid2,ld_latest_rev1,ld_next_rev
string ls_fullname,ls_docname
datawindowchild  ldwc_docid,ldwc


SetPointer(HourGlass!)

SetNull(ldc_null)
SetNull(ll_null)

//Check if the document modified
ld_latest_rev1 = of_get_latest_rev(istr_doc_compare.doc_id2)
if istr_doc_compare.revision2 = ld_latest_rev1  and istr_doc_compare.revision2 > 0 then
	if of_ismodified("second") then 
		MessageBox("Save Document","The document has been modified, please save it first.") 
		this.setitem(row, "revision",istr_doc_compare.revision2)
		Return 2
	end if	
end if

CHOOSE CASE Lower(dwo.name) 
	CASE "ctx_id"	 //Added By Jay Chen 11-05-2015
		dw_second.getchild("doc_id", ldwc)
		ldwc.settransobject(sqlca)
		ldwc.retrieve(long(data))
		//Added By Jay Chen 11-24-2015
		this.setitem( 1,"doc_name", '')
		this.setitem( 1,"doc_id", ll_null)
		this.setitem( 1,"revision", ll_null)
	CASE "revision" 
		//Open document(s) accordingly if revision changed
		ll_docid = This.GetItemNumber(row, "doc_id")
		ldc_revid2 = dw_first.getitemdecimal(1, "revision" )
		ldc_revid = Dec(data)
		if istr_doc_compare.doc_id1 = istr_doc_compare.doc_id2 then
			if ldc_revid2 = ldc_revid then
				MessageBox("Tips","This revision is open in the original document.") 
				this.setitem(row, "revision",istr_doc_compare.revision2)
				Return 2
			end if
		end if
		this.accepttext()
		If of_displayfile("second") <> 0 Then return 2
		istr_doc_compare.revision2 = ldc_revid
		ls_fullname = istr_doc_compare.filename2 + ' ' + String( istr_doc_compare.doc_id2 )+ '.' + String( ldc_revid ,'##0.0')
		istr_doc_compare.fullname2 = ls_fullname
		dw_second.setitem(row,"doc_name", istr_doc_compare.fullname2)

	CASE 'doc_id' 
		ll_docid2 = dw_first.GetItemNumber(1, "doc_id")
		ldc_revid2 = dw_first.getitemdecimal(1, "revision" )
		ll_docid = long(data)
		ld_latest_rev1 = of_get_latest_rev(ll_docid)
		if (ldc_revid2 = ld_latest_rev1 and ll_docid2 = ll_docid)  then
			select max(revision) into :ld_next_rev from ctx_am_doc_audit where doc_id = :ll_docid and revision <> :ld_latest_rev1;
			if isnull(ld_next_rev) then ld_next_rev = 0
			if ld_next_rev = 0 then
				MessageBox("Tips","There is only one version of this document and it is open as the original document. ") 
//				this.setitem(row, "doc_id",istr_doc_compare.doc_id2)
				this.setitem(row, "doc_id",ll_null)
				this.setitem(row, "revision",ldc_null)
				Return 2
			end if
			ldc_revid = ld_next_rev
		else
			ldc_revid = ld_latest_rev1
		end if
		dw_second.getchild("revision", idwc_rev)
		idwc_rev.settransobject(sqlca)
		idwc_rev.retrieve(ll_docid)
		this.setitem(row, "revision",ldc_revid)
		this.accepttext()
		istr_doc_compare.doc_id2 = ll_docid
		istr_doc_compare.revision2 = ldc_revid
		
		this.GetChild( "doc_id", ldwc_docid )
		If ldwc_docid.GetRow( ) > 0 Then 
			ls_docname = ldwc_docid.GetItemString( ldwc_docid.GetRow( ), 'doc_name' )
			istr_doc_compare.ctx_id2 =  ldwc_docid.GetItemNumber( ldwc_docid.GetRow( ), 'ctx_id' )
		End If
		If Trim(ls_docname ) = '' or IsNull( ls_docname ) Then
			select doc_name into :ls_docname from ctx_am_document where doc_id = :ll_docid;
		End If
		
		if isnull(ls_docname) then ls_docname = ''
		istr_doc_compare.filename2 = ls_docname
		ls_fullname = istr_doc_compare.filename2 + ' ' + String( istr_doc_compare.doc_id2 )+ '.' + String( ldc_revid ,'##0.0')
		istr_doc_compare.fullname2 = ls_fullname
		dw_second.setitem(row,"doc_name", istr_doc_compare.fullname2)
		of_displayfile("second")
		
END CHOOSE








end event

type cb_email from commandbutton within w_dm_check_compare
integer x = 3671
integer y = 1884
integer width = 343
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Email"
end type

event clicked;//====================================================================
// Event: clicked
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	Jay Chen		Date: 09-18-2015
//--------------------------------------------------------------------
//	Copyright (c) 2008-2014 ContractLogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

//Added By Jay Chen 09-25-2015
if isvalid(ole_second.object.ActiveDocument) and isvalid(ole_first.object.ActiveDocument) then
else
	MessageBox("Tips","Can not be emailed when there is only one document is open. ")
	return
end if
//end

of_send_email()
end event

type ole_first from u_email_edit within w_dm_check_compare
integer x = 2130
integer y = 312
integer width = 2286
integer height = 620
integer taborder = 10
string binarykey = "w_dm_check_compare.win"
integer binaryindex = 1
string displayname = "00"
end type

event constructor;call super::constructor;this.object.filesaveas = true
end event

event getfocus;call super::getfocus;//if ib_readonly1 then
//	cb_save.enabled = false
//	cb_check.enabled = false
//else
//	cb_save.enabled = true
//	cb_check.enabled = true
//end if
end event

type ole_second from u_email_edit within w_dm_check_compare
integer x = 2130
integer y = 1236
integer width = 2286
integer height = 636
integer taborder = 10
string binarykey = "w_dm_check_compare.win"
integer binaryindex = 2
end type

event constructor;call super::constructor;this.object.filesaveas = true
end event

event getfocus;call super::getfocus;//if ib_readonly2 then
//	cb_save.enabled = false
//	cb_check.enabled = false
//else
//	cb_save.enabled = true
//	cb_check.enabled = true
//end if
end event

type cb_close from commandbutton within w_dm_check_compare
integer x = 4059
integer y = 1884
integer width = 343
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Close"
boolean cancel = true
end type

event clicked;//Added By Jay Chen 11-24-2015
long ll_rtn
if of_ismodified("compare") then
	ll_rtn = messagebox('Save Compared Document','The compared document has been modified, do you want to save?',Question!,YesNo!,2) 
	if ll_rtn = 1 then
		if of_save_compare() < 1 then return
	end if
end if
//end

of_clear_compare_flag()
Close(Parent)
end event

type cb_check from commandbutton within w_dm_check_compare
integer x = 3282
integer y = 1884
integer width = 343
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Check &Out"
end type

event clicked;//Added By Jay Chen 09-25-2015
if isvalid(ole_second.object.ActiveDocument) and isvalid(ole_first.object.ActiveDocument) then
else
	MessageBox("Tips","Can not be checked when there is only one document is open. ")
	return
end if
//end

//Added By Jay Chen 11-24-2015
long ll_rtn
if of_ismodified("compare") then
	ll_rtn = messagebox('Save Compared Document','The compared document has been modified, do you want to save?',Question!,YesNo!,2) 
	if ll_rtn = 1 then
		if of_save_compare() < 1 then return
	end if
end if
//end

of_checkout()




end event

type cb_save from commandbutton within w_dm_check_compare
boolean visible = false
integer x = 2894
integer y = 1884
integer width = 343
integer height = 92
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "&Save"
end type

event clicked;////====================================================================
//// Event: clicked
////--------------------------------------------------------------------
//// Description:
////--------------------------------------------------------------------
//// Arguments:
////--------------------------------------------------------------------
//// Returns:  long
////--------------------------------------------------------------------
//// Author:	Jay Chen		Date: 09-18-2015
////--------------------------------------------------------------------
////	Copyright (c) 2008-2014 ContractLogix, All rights reserved.
////--------------------------------------------------------------------
//// Modify History:
////
//
////Added By Jay Chen 09-25-2015
//if isvalid(ole_second.object.ActiveDocument) and isvalid(ole_first.object.ActiveDocument) then
//else
//	MessageBox("Tips","Can not be saved when there is only one document is open. ")
//	return
//end if
////end
//
//IF (ib_latest1 and is_status1 <> "0") or  (ib_latest2 and is_status2 <> "0") THEN	
//	MessageBox("Save Document","You cannot save the changes to a document that has been checked out. ")
//	RETURN
//END IF	
//
//if istr_doc_compare.readonly1 and istr_doc_compare.readonly2 then 
//	MessageBox("Save Document","You cannot save the changes to a history version. ") 
//	Return
//end if		
//
//if not istr_doc_compare.readonly1 then
//	if of_ismodified("first") then
//		of_save("first")
//	end if
//end if
//
//if not istr_doc_compare.readonly2 then
//	if of_ismodified("second") then
//		of_save("second")
//	end if
//end if
end event

type dw_first from u_dw within w_dm_check_compare
integer x = 2139
integer y = 56
integer width = 2254
integer height = 212
integer taborder = 10
string dataobject = "d_dm_checkout_comparison"
boolean vscrollbar = false
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbfocuschange = false
end type

event itemchanged;call super::itemchanged;//====================================================================
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
// Author:	Jay Chen		Date: 09-18-2015
//--------------------------------------------------------------------
//	Copyright (c) 2008-2014 ContractLogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

long ll_docid,ll_docid2,ll_null
Decimal ldc_null
decimal{1} ldc_revid,ldc_revid2,ld_latest_rev1,ld_next_rev
string ls_fullname,ls_docname
Datawindowchild	ldwc_docid,ldwc

SetPointer(HourGlass!)

SetNull(ll_null)
SetNull(ldc_null)

//Check if the document modified
ld_latest_rev1 = of_get_latest_rev(istr_doc_compare.doc_id1)
if istr_doc_compare.revision1 = ld_latest_rev1 and istr_doc_compare.revision1 > 0 then
	if of_ismodified("first") then 
		MessageBox("Save Document","The document has been modified, please save it first.") 
		this.setitem(row, "revision",istr_doc_compare.revision1)
		Return 2
	end if	
end if

CHOOSE CASE Lower(dwo.name) 
	CASE "ctx_id"	//Added By Jay Chen 11-05-2015
		dw_first.getchild("doc_id", ldwc)
		ldwc.settransobject(sqlca)
		ldwc.retrieve(long(data))
		//Added By Jay Chen 11-24-2015
		this.setitem( 1,"doc_name", '')
		this.setitem( 1,"doc_id", ll_null)
		this.setitem( 1,"revision", ll_null)
	CASE "revision" 
		ll_docid = This.GetItemNumber(row, "doc_id")
		ldc_revid2 = dw_second.getitemdecimal(1, "revision" )
		ldc_revid = Dec(data)
		if istr_doc_compare.doc_id1 = istr_doc_compare.doc_id2 then
			if ldc_revid2 = ldc_revid then
				MessageBox("Tips","This revision is open in the revised document.") 
				this.setitem(row, "revision",istr_doc_compare.revision1)
				Return 2
			end if
		end if
		this.accepttext()
		If of_displayfile("first") <> 0 Then Return 2
		istr_doc_compare.revision1 = ldc_revid
		ls_fullname = istr_doc_compare.filename1 + ' ' + String( istr_doc_compare.doc_id1 )+ '.' + String( ldc_revid ,'##0.0')
		istr_doc_compare.fullname1 = ls_fullname
		dw_first.setitem(row,"doc_name", istr_doc_compare.fullname1)

	CASE 'doc_id' 
		ll_docid2 = dw_second.GetItemNumber(1, "doc_id")
		ldc_revid2 = dw_second.getitemdecimal(1, "revision" )
		ll_docid = long(data)
		ld_latest_rev1 = of_get_latest_rev(ll_docid)
		if ldc_revid2 = ld_latest_rev1 and ll_docid2 = ll_docid then
			select max(revision) into :ld_next_rev from ctx_am_doc_audit where doc_id = :ll_docid and revision <> :ld_latest_rev1;
			if isnull(ld_next_rev) then ld_next_rev = 0
			if ld_next_rev = 0 then
				MessageBox("Tips","There is only one version of this document and it is open as the revised document. ") 
//				this.setitem(row, "doc_id",istr_doc_compare.doc_id1)
				this.setitem(row, "doc_id",ll_null)
				this.setitem(row, "revision",ldc_null)
				Return 2
			end if
			ldc_revid = ld_next_rev
		else
			ldc_revid = ld_latest_rev1
		end if
		dw_first.getchild("revision", idwc_rev)
		idwc_rev.settransobject(sqlca)
		idwc_rev.retrieve(ll_docid)
		this.setitem(row, "revision",ldc_revid)
		this.accepttext()
		istr_doc_compare.doc_id1 = ll_docid
		istr_doc_compare.revision1 = ldc_revid

		this.GetChild( "doc_id", ldwc_docid )
		If ldwc_docid.GetRow( ) > 0 Then 
			ls_docname = ldwc_docid.GetItemString( ldwc_docid.GetRow( ), 'doc_name' )
			istr_doc_compare.ctx_id1 =  ldwc_docid.GetItemNumber( ldwc_docid.GetRow( ), 'ctx_id' )
		End If
		If Trim(ls_docname ) = '' or IsNull( ls_docname ) Then
			select doc_name into :ls_docname from ctx_am_document where doc_id = :ll_docid;
		End If
		
		if isnull(ls_docname) then ls_docname = ''
		istr_doc_compare.filename1 = ls_docname
		ls_fullname = istr_doc_compare.filename1 + ' ' + String( istr_doc_compare.doc_id1 )+ '.' + String( ldc_revid ,'##0.0')
		istr_doc_compare.fullname1 = ls_fullname
		dw_first.setitem(row,"doc_name", istr_doc_compare.fullname1)
		of_displayfile("first")
		
END CHOOSE








end event

type gb_second from groupbox within w_dm_check_compare
integer x = 2130
integer y = 928
integer width = 2286
integer height = 292
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "Revised Document"
end type

type gb_first from groupbox within w_dm_check_compare
integer x = 2130
integer width = 2286
integer height = 292
integer taborder = 50
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "Original Document"
end type

type gb_1 from groupbox within w_dm_check_compare
integer x = 9
integer width = 2112
integer height = 1456
integer taborder = 50
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "Compared Document"
end type


Start of PowerBuilder Binary Data Section : Do NOT Edit
01w_dm_check_compare.bin 
2500000c00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdfffffffefffffffe00000004fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff000000010000000000000000000000000000000000000000000000000000000025524e2001d1e25a00000003000002800000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000102001affffffff00000002ffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000011800000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000001001affffffffffffffff00000003d267e82f41ee8649010521915f71b1300000000025524e2001d1e25a25524e2001d1e25a0000000000000000000000000054004e004f004b0066004f0069006600650063007400430053006c006d0074000000000000000000000000000000000000000000000000000000000000000001020022ffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000005000001180000000000000001000000020000000300000004fffffffe00000006000000070000000800000009fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
2Affffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff1234abcd00002eec000023738000001080000005800000088000001080000014010100010000000000000000000000000000000000000000000000000000000000000001000000000000000000000001000000010000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff000000000000000100c8d0d4000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000f6e6d300e3ba9200000000000000000000000000000001000000000000000100000000000003a800000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001234abcd00002eec000023738000001080000005800000088000001080000014010100010000000000000000000000000000000000000000000000000000000000000001000000000000000000000001000000010000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff000000000000000100c8d0d4000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000f6e6d300e3ba9200000000000000000000000000000001000000000000000100000000000003a8000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000c00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdfffffffefffffffe00000004fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
29ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff000000010000000000000000000000000000000000000000000000000000000025524e2001d1e25a00000003000002800000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000102001affffffff00000002ffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000011800000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000001001affffffffffffffff00000003d267e82f41ee8649010521915f71b1300000000025524e2001d1e25a25524e2001d1e25a0000000000000000000000000054004e004f004b0066004f0069006600650063007400430053006c006d0074000000000000000000000000000000000000000000000000000000000000000001020022ffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000005000001180000000000000001000000020000000300000004fffffffe00000006000000070000000800000009fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff1234abcd000033ad000010058000001080000005800000088000001080000014010100010000000000000000000000000000000000000000000000000000000000000001000000000000000000000001000000010000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff000000000000000100c8d0d4000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000f6e6d300e3ba9200000000000000000000000000000001000000000000000100000000000003a800000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001234abcd000033ad000010058000001080000005800000088000001080000014010100010000000000000000000000000000000000000000000000000000000000000001000000000000000000000001000000010000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff000000000000000100c8d0d4000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000f6e6d300e3ba9200000000000000000000000000000001000000000000000100000000000003a8000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2E000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000c00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdfffffffefffffffe00000004fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff000000010000000000000000000000000000000000000000000000000000000025524e2001d1e25a00000003000002800000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000102001affffffff00000002ffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000011800000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000001001affffffffffffffff00000003d267e82f41ee8649010521915f71b1300000000025524e2001d1e25a25524e2001d1e25a0000000000000000000000000054004e004f004b0066004f0069006600650063007400430053006c006d0074000000000000000000000000000000000000000000000000000000000000000001020022ffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000005000001180000000000000001000000020000000300000004fffffffe00000006000000070000000800000009fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
25ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff1234abcd000033ad0000106f8000001080000005800000088000001080000014010100010000000000000000000000000000000000000000000000000000000000000001000000000000000000000001000000010000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff000000000000000100c8d0d4000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000f6e6d300e3ba9200000000000000000000000000000001000000000000000100000000000003a800000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001234abcd000033ad0000106f8000001080000005800000088000001080000014010100010000000000000000000000000000000000000000000000000000000000000001000000000000000000000001000000010000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff000000000000000100c8d0d4000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000f6e6d300e3ba9200000000000000000000000000000001000000000000000100000000000003a800000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
11w_dm_check_compare.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
