$PBExportHeader$n_cst_webapprove.sru
forward
global type n_cst_webapprove from nonvisualobject
end type
end forward

global type n_cst_webapprove from nonvisualobject autoinstantiate
end type

type variables
//String is_approve_var =  '$<WebApproveDoc>$' 
Int wdFindStop = 0
Int wdReplaceNone = 0
n_cst_string inv_string
Long il_InComplete,il_WebApproval,il_DocCheckIN, il_Submitted


String is_email_subject = 'ContractLogix Document Approval Request'

//Added By Ken.Guo 2016-08-24
Constant String is_email_type_2nd = 'notification email as reminder to trigger 2nd approver(s) email' //'notification email for the 2nd approver' //Modified By Ken.Guo 2016-10-12
Constant String is_email_type_checkin = 'notification email for checking in web approval'
//n_cst_word_utility inv_word
//n_cst_workflow_triggers inv_trigger


end variables

forward prototypes
public function integer of_registry_get (str_ctx_email astr_ctx_email, ref string as_lastupdate)
public function integer of_registry_set (str_ctx_email astr_ctx_email, string as_lastupdate)
public function string of_download_file (str_ctx_email astr_ctx_email)
public function integer of_send_email (str_ctx_email astr_ctx_email, string as_emailaddress, string as_weblink)
public function integer of_merge_message (ref u_email_edit aole_control, string as_weblink)
public function integer of_refresh_status ()
public subroutine of_initialization ()
public function string of_download_attach (long al_approve_id, long al_seqno, string as_name)
public function integer of_send_email (str_ctx_email astr_ctx_email, string as_to)
public function integer of_show_approve_status (str_ctx_email astr_ctx_email, u_tabpg_dm_data au_tabpg_dm_data)
public function string of_download_org_file (str_ctx_email astr_ctx_email)
public function integer of_create_action_items (long al_approve_id, str_ctx_email astr_ctx_email, string as_userlist, integer ai_userorder, integer ai_create_for_sender, datetime adt_duedate)
public function integer of_trigger_ai_wf ()
public function integer of_get_email_template (string as_email_type, ref blob abob_message, ref str_email astr_email)
public function integer of_merge_message (u_email_edit aole_word, ref string as_subject, long al_ctx_id, long al_doc_id, string as_linkname, string as_docname, long al_export_id)
public function integer of_get_email_template (long al_email_id, ref blob abob_message, ref str_email astr_email)
public function integer of_send_email (str_ctx_email astr_ctx_email)
public function integer of_add_dm_link (u_email_edit auo_word)
end prototypes

public function integer of_registry_get (str_ctx_email astr_ctx_email, ref string as_lastupdate);Integer li_ret
//Modified By Mark Lee 04/18/12
//li_ret = gnv_appeondll.of_registryget("HKEY_LOCAL_MACHINE\SOFTWARE\IntelliSoft Group\Agreement\WebApprove", astr_ctx_email.emailto +string(astr_ctx_email.doc_id) + '.' + String(astr_ctx_email.revision) , regstring!, as_lastupdate)	
li_ret = gnv_appeondll.of_registryget("HKEY_LOCAL_MACHINE\SOFTWARE\"+gs_DefDirName+"\Agreement\WebApprove", astr_ctx_email.emailto +string(astr_ctx_email.doc_id) + '.' + String(astr_ctx_email.revision) , regstring!, as_lastupdate)	
Return li_ret
end function

public function integer of_registry_set (str_ctx_email astr_ctx_email, string as_lastupdate);Integer li_ret
//Modified By Mark Lee 04/18/12
//li_ret = gnv_appeondll.of_registryset("HKEY_LOCAL_MACHINE\SOFTWARE\IntelliSoft Group\Agreement\WebApprove", astr_ctx_email.emailto +string(astr_ctx_email.doc_id) + '.' + String(astr_ctx_email.revision) , regstring!, as_lastupdate)	
li_ret = gnv_appeondll.of_registryset("HKEY_LOCAL_MACHINE\SOFTWARE\"+gs_DefDirName+"\Agreement\WebApprove", astr_ctx_email.emailto +string(astr_ctx_email.doc_id) + '.' + String(astr_ctx_email.revision) , regstring!, as_lastupdate)	
Return li_ret
end function

public function string of_download_file (str_ctx_email astr_ctx_email);Integer i
Datetime ldt_modify_date
String ls_updatedate_server,ls_updatedate_client , ls_path,ls_fullname,ls_tempfullname
String ls_lastupdate
long ll_getupdate,ll_data_length,li_loops,li_counter,ll_start,ll_BlobLen
Long ll_CurrentPos,li_Cnt
Blob lb_all_data,lb_data,lblb_Data
Integer li_FileNum,li_Writes

Select upload_time into :ldt_modify_date 
From ctx_am_image_approve_detail
Where doc_id = :astr_ctx_email.doc_id  and revision = :astr_ctx_email.revision and email_address = :astr_ctx_email.emailto ;

ls_updatedate_server = String(ldt_modify_date,'mm/dd/yyyy hh:mm:ss')

ls_path = gs_dir_path + gs_DefDirName + "\Agreement\WebApprove\" + astr_ctx_email.emailto + '\'
gnv_appeondll.of_parsepath(ls_path)
ls_fullname = ls_path + astr_ctx_email.fullname
ls_tempfullname = ls_path + 'temp_' + astr_ctx_email.fullname

//Modified By Ken.Guo 2015-04-29
//of_registry_get(astr_ctx_email, ls_updatedate_client)
gnv_filetime.of_getlastwritedatetime( ls_fullname, ls_updatedate_client)

If ls_updatedate_server = ls_updatedate_client and FileExists(ls_fullname) Then
	If FileCopy(ls_fullname,ls_tempfullname,True) = 1 Then
		Return ls_TempFullName
	Else
		Messagebox('Error','Failed to replace the temp file '+ls_tempfullname+', please close the file then try again.')
		Return ''
	End If
End If

If gs_dbtype = "ASA" Or appeongetclienttype() <> 'PB' Then		
	SELECTBLOB new_image_file INTO :lb_all_data
	  FROM ctx_am_image_approve_detail Where doc_id = :astr_ctx_email.doc_id  and revision = :astr_ctx_email.revision and email_address = :astr_ctx_email.emailto ;
Else			
	SELECT Datalength(new_image_file) INTO :ll_data_length
	  FROM ctx_am_image_approve_detail Where doc_id = :astr_ctx_email.doc_id  and revision = :astr_ctx_email.revision and email_address = :astr_ctx_email.emailto ;
	
	If isnull(ll_data_length) Then ll_data_length = 0
	
	If ll_data_length > 8000 Then 
		If Mod(ll_data_length,8000) = 0 Then
			li_loops = ll_data_length/8000 
		Else
			li_loops = (ll_data_length/8000) + 1 
		End If 
	ElseIf ll_data_length > 0 Then 
		li_loops = 1 
	End If 
	
	For li_counter = 1 To li_loops				
		ll_start = (li_counter - 1) * 8000 + 1
		SELECTBLOB substring(new_image_file,:ll_start,8000) INTO :lb_data
		  FROM ctx_am_image_approve_detail Where doc_id = :astr_ctx_email.doc_id  and revision = :astr_ctx_email.revision and email_address = :astr_ctx_email.emailto ;
		lb_all_data += lb_data
	Next 
End If
If isnull(lb_all_data) Then lb_all_data = blob('')
If Len(lb_all_data) < 1 Then 
	ls_fullname = ''
	Messagebox('Error -3','Failed to download the document from database, the file blob value is empty.')
	Return ''	
End If

li_FileNum = FileOpen(ls_fullname , StreamMode! ,Write!,Shared!, Replace!)
If li_FileNum = -1 Then 
	ls_fullname = ''
	Messagebox('Error -4','Failed to create the document.')
	Return ''
End If
	
ll_BlobLen = Len(lb_all_data)
If ll_BlobLen > 32765 Then
	If Mod(ll_BlobLen, 32765) = 0 Then
		li_Writes = ll_BlobLen / 32765
	Else
		li_Writes = (ll_BlobLen / 32765) + 1
	End If
 Else
	li_Writes = 1
End If

ll_CurrentPos = 1

For li_Cnt = 1 To li_Writes
	lblb_Data = BlobMid(lb_all_data, ll_CurrentPos, 32765)
	ll_CurrentPos += 32765
	If FileWrite(li_FileNum, lblb_Data) = -1 Then
		ls_fullname = ''
		Messagebox('Error -5','Failed to write the blob value to the file.')
		Return ''
	End If
Next

FileClose(li_FileNum)
//Modified By Ken.Guo 2015-04-29
//of_registry_set(astr_ctx_email,ls_updatedate_server)
gnv_filetime.of_setlastwritedatetime( ls_fullname, ldt_modify_date)

If FileCopy(ls_fullname,ls_tempfullname,True) = 1 Then
	Return ls_TempFullName
Else
	Messagebox('Error','Failed to replace the temp file '+ls_tempfullname+', please close the file then try again.')
	Return ''
End If

end function

public function integer of_send_email (str_ctx_email astr_ctx_email, string as_emailaddress, string as_weblink);String ls_notify_emails, ls_users_arr[], ls_emails_arr[]
String ls_email,ls_userid,ls_subject
Long i, ll_email_template_id
long 		ll_Return,li_send_result = 0
String ls_errtext,ls_attachfilename,ls_to,ls_cc,ls_bcc,ls_email_type,ls_notes,ls_computer_info
Boolean lb_siganature = False
String ls_attach
n_cst_easymail_smtp 	lnv_Mail
n_cst_dm_utils lnv_dm_utils 
w_email_edit lw_email_edit


Setpointer(HourGlass!)

If UpperBound(astr_ctx_email.as_attach_list[]) > 0 Then
	inv_string.of_arraytostring( astr_ctx_email.as_attach_list[],',', ls_attach)
End If

If astr_ctx_email.ai_signature = 1 Then
	lb_siganature = True
End If

if lnv_Mail.of_CreateObject() = -1 then
	f_show_message('Create Email Object','','','','')
	Return -1
end if

Open(lw_email_edit)
lw_email_edit.ole_word.of_open( astr_ctx_email.ablb_message )
of_merge_message( lw_email_edit.ole_word, as_weblink)

gstr_email_info.ss_ctx_id_list = String(astr_ctx_email.ctx_id)
gstr_email_info.ss_doc_id_list = String(astr_ctx_email.doc_id)

astr_ctx_email.as_sender = lnv_Mail.of_replace_send_user(gs_user_id) //Added By Ken.Guo 2016-10-24

ll_Return = lnv_Mail.of_SendHtml(astr_ctx_email.as_sender,as_emailaddress, '', '', astr_ctx_email.as_mail_subject , lw_email_edit.ole_word, ls_attach,lb_siganature,astr_ctx_email.ctx_id,astr_ctx_email.doc_id,0)

gstr_email_info.ss_ctx_id_list = ''
gstr_email_info.ss_doc_id_list = ''

lw_email_edit.ole_word.of_close( )
Close(lw_email_edit)

//Show Error Info	
if ll_Return <> 0 then
	//Modified By Ken.Guo 07/04/2013
	If lnv_Mail.is_sendprotocol = 'SMTP' Then
		f_show_message('error_code_'+string(ll_Return),'%1S%',String(ll_Return),'','')
	Else
		f_show_message('error_code_'+string(ll_Return),'ALL',lnv_Mail.of_getemailerror(ll_Return),'','')
	End If
	lnv_Mail.of_DeleteObject()
	Return -2
end if

//Added Email Audit  
If ll_Return <> 0 then 
	ls_errtext = gnv_message.of_get_error_message( ll_Return)
End If
ls_attachfilename = inv_string.of_get_file_name( ls_attach, ',') 
ls_to = as_emailaddress
ls_cc = ''
ls_bcc = ''
ls_subject = ls_subject
ls_email_type = 'Web Approval'
If ll_email_template_id = 0 Then Setnull(ll_email_template_id)
ls_computer_info = lnv_Mail.of_get_compute_info( )

Insert Into em_mail_audit
(user_id,mail_from,mail_to,mail_cc,mail_bcc,mail_subject,mail_date,mail_attach_name,mail_template_id,ctx_id_list,doc_id_list,ai_id_list,wf_id,alarm_type,field_name,send_result,error_text,notes,compute_info)
Values 
(:gs_user_id,:astr_ctx_email.as_sender,:ls_to,:ls_cc,:ls_bcc,:astr_ctx_email.as_mail_subject,getdate(),:ls_attachfilename,:ll_email_template_id,:astr_ctx_email.ctx_id,:astr_ctx_email.doc_id,'',null,:ls_email_type,'',:li_send_result,:ls_errtext,:ls_notes,:ls_computer_info);


lnv_Mail.of_DeleteObject()

Return 1
end function

public function integer of_merge_message (ref u_email_edit aole_control, string as_weblink);////////////////////////////////////////////////////////////////////////
//// Function: of_merge_message
//// Arguments:
//// 	
////--------------------------------------------------------------------
//// Return:  integer
////--------------------------------------------------------------------
//// Author:	 Ken.Guo 11/11/2011.
////--------------------------------------------------------------------
//// Description: Merge the $<WebApproveDoc>$ var
////--------------------------------------------------------------------
////////////////////////////////////////////////////////////////////////
//
//Boolean lb_found, lb_exists
//String ls_approve_link
//Long ll_begin,ll_end
//
//aole_control.Object.ActiveDocument.Content.Select()
//lb_found = aole_control.Object.ActiveDocument.ActiveWindow.Selection.Find.Execute(is_approve_var, false, true, false, false, false, true, wdFindStop, false, "", wdReplaceNone) 
//
//If Not lb_found Then Return -1
//
//Do While lb_found
//			//Replace with web approve link
//			aole_control.Object.ActiveDocument.ActiveWindow.Selection.Text = as_weblink	
//			
//			// turned into a hyperlink
//			aole_control.Object.ActiveDocument.Hyperlinks.Add(aole_control.Object.ActiveDocument.ActiveWindow.Selection.Range,as_weblink)
//		
//			//Find the next field
//			ll_begin = aole_control.Object.ActiveDocument.ActiveWindow.Selection.End
//			ll_end = aole_control.Object.ActiveDocument.Content.End
//			IF ll_end > ll_begin THEN
//				aole_control.Object.ActiveDocument.Range(ll_begin, ll_end).Select()			
//				lb_found = aole_control.Object.ActiveDocument.ActiveWindow.Selection.Find.Execute(is_approve_var, false, true, false, false, false, true, wdFindStop, false, "", wdReplaceNone)			
//			ELSE
//				lb_found = FALSE
//			END IF
//Loop

Return 1
end function

public function integer of_refresh_status ();Long i, ll_ctx_id, ll_doc_id, ll_mailstep,ll_Return, ll_sender_ai_id
String ls_sender,ls_sender_email,ls_subject,ls_message,ls_errtext
String ls_companyname, ls_filename, ls_linkname
String ls_ctxid, ls_docid,ls_email_type,ls_computer_info
Decimal ldec_userorder = 0, ldec_revision

n_cst_easymail_smtp 	lnv_Mail

This.of_trigger_ai_wf( ) //Added By Ken.Guo 2016-04-22 

n_ds ids_approval_result
ids_approval_result = Create n_ds
ids_approval_result.dataobject = 'd_am_approve_result'
ids_approval_result.SetTransObject(SQLCA)
//Added By Mark Lee 08/06/12
ids_approval_result.of_set_idle_flag( False)

ids_approval_result.Retrieve()
ids_approval_result.SetFilter(' email_step  > 0 and  (email_step <>  replied_email or isnull(replied_email )) ')
ids_approval_result.Filter()

If ids_approval_result.RowCount() = 0 Then 
	If isvalid(ids_approval_result) Then Destroy ids_approval_result
	Return 0
End If

//Added By Ken.Guo 2016-08-24
Long ll_email_2nd, ll_email_checkin
Blob lbob_2nd, lbob_checkin
Boolean lb_autosign
str_email lstr_email_2nd, lstr_email_checkin
w_email_edit lw_email_edit
ll_email_2nd = This.of_get_email_template( is_email_type_2nd, lbob_2nd, lstr_email_2nd)
ll_email_checkin = This.of_get_email_template( is_email_type_checkin, lbob_checkin, lstr_email_checkin)

Setpointer(HourGlass!)
For i = 1 To ids_approval_result.RowCount()
	Yield()
	gnv_status_info.of_display( "["+String(Long(i / ids_approval_result.RowCount()*100)) + "%]" + " Sending email for Web Approval" + ", please wait..." )
	ll_mailstep = ids_approval_result.GetItemNumber(i, 'email_step')
	ll_ctx_id = ids_approval_result.GetItemNumber(i, 'ctx_id')
	ll_doc_id = ids_approval_result.GetItemNumber(i, 'doc_id')
	ldec_revision = ids_approval_result.GetItemDecimal(i, 'revision')
	ls_sender = ids_approval_result.GetitemString(i,'sender_user')
	ls_sender_email = ids_approval_result.GetitemString(i,'sender_email')
	ls_companyname = ids_approval_result.GetitemString(i,'facility_name')
	ls_filename = ids_approval_result.GetitemString(i,'file_name')
	ls_linkname = ids_approval_result.GetitemString(i,'ctx_link_name')
	ll_sender_ai_id = ids_approval_result.GetItemNumber(i, 'sender_ai_id')
	If ll_mailstep = 1 and ids_approval_result.GetItemNumber(i, 'second_approvers_cnt') > 0 Then
		ldec_userorder = 1.5
	Else
		ldec_userorder = ll_mailstep
	End If

	If ldec_userorder = 1 or ldec_userorder = 2 Then
		ls_email_type = 'Notify to check in document with Web Approval'
	Else //1.5
		ls_email_type =  'Notify to trigger 2nd approver(s) with Web Approval'
	End If	
	
	ls_ctxid = String(ll_ctx_id)
	ls_docid = String(ll_doc_id)

	if lnv_Mail.of_CreateObject() = -1 then
		f_show_message('Create Email Object','','','','')
		gnv_status_info.of_display('')
		If isvalid(ids_approval_result) Then Destroy ids_approval_result
		Return -1
	end if
	
	//Added By Jay Chen 02-05-2015
	if isnull(ls_ctxid) then ls_ctxid = ''
	if isnull(ls_filename) then ls_filename = ''
	if isnull(ls_companyname) then ls_companyname = ''
	if isnull(ls_linkname) then ls_linkname = ''
	//end
	
	ls_subject = 'The document "'+ls_filename+'" of Contract '+ls_ctxid+' requires your attention. '
	If Pos(ls_linkname, 'http://' ) > 0 Then
		If ldec_userorder = 1.5 Then
			ls_message = &
				 '~r~n~r~nThe following document has been submitted by all 1st approver(s). ' + &
				 '~r~n~r~nDocument Name: ' + ls_filename + &
				 '~r~n~r~nContract ID: ' + ls_ctxid + &
				 '~r~n~r~nContract Company: ' + ls_companyname + &
				 '~r~n~r~n' + &
				 '~r~n~r~nPlease click the following URL and trigger the 2nd approver(s):' + &
				 '~r~n~r~n' + ls_linkname			
		Else
			ls_message = &
				 '~r~n~r~nThe following document has been submitted by all approver(s). ' + &
				 '~r~n~r~nDocument Name: ' + ls_filename + &
				 '~r~n~r~nContract ID: ' + ls_ctxid + &
				 '~r~n~r~nContract Company: ' + ls_companyname + &
				 '~r~n~r~n' + &
				 '~r~n~r~nPlease click the following URL and check it in:' + &
				 '~r~n~r~n' + ls_linkname					
		End If
	Else
		If ldec_userorder = 1.5 Then
			ls_message = &
				 '~r~n~r~nThe following document has been submitted by all 1st approver(s). ' + &
				 '~r~n~r~nDocument Name: ' + ls_filename + &
				 '~r~n~r~nContract ID: ' + ls_ctxid + &
				 '~r~n~r~nContract Company: ' + ls_companyname + &
				 '~r~n~r~n' + &
				 '~r~n~r~nPlease run ContractLogix and trigger the 2nd approver(s).' 
		Else
			ls_message = &
				 '~r~n~r~nThe following document has been submitted by all approver(s). ' + &
				 '~r~n~r~nDocument Name: ' + ls_filename + &
				 '~r~n~r~nContract ID: ' + ls_ctxid + &
				 '~r~n~r~nContract Company: ' + ls_companyname + &
				 '~r~n~r~n' + &
				 '~r~n~r~nPlease run ContractLogix and check it in.'
	
		End If		
	End If
	gstr_email_info.ss_ctx_id_list = String(ll_ctx_id)
	gstr_email_info.ss_doc_id_list = String(ll_doc_id)
	
	//Modified By Ken.Guo 2016-08-25. task 644. suppor email template.
	//ll_Return = lnv_mail.of_sendtext( ls_sender, ls_sender_email, '', '', ls_subject, ls_message, '')	//Commented By Ken.Guo 2016-08-25
	If ll_email_2nd > 0 and ldec_userorder = 1.5 Then //Use email template for 2nd
		If Not isvalid(lw_email_edit) Then
			Open(lw_email_edit)
		End If
		If lstr_email_2nd.autosign = 'Y' Then
			lb_autosign = True
		Else
			lb_autosign = False
		End If
		lw_email_edit.ole_word.of_open(lbob_2nd)
		of_add_dm_link(lw_email_edit.ole_word) //Added By Ken.Guo 2016-09-30
		ls_subject = lstr_email_2nd.subject
		This.of_merge_message( lw_email_edit.ole_word, ls_subject ,ll_ctx_id, ll_doc_id, ls_linkname, ls_filename,lstr_email_2nd.export_id )
		ll_Return = lnv_Mail.of_SendHtml(ls_sender, ls_sender_email, '', '',ls_subject, lw_email_edit.ole_Word, lstr_email_2nd.attach_name,lb_autosign,ll_ctx_id,ll_doc_id,0) 
	ElseIf ll_email_checkin > 0 and ldec_userorder <> 1.5 Then //Use email template for checkin
		If Not isvalid(lw_email_edit) Then
			Open(lw_email_edit)
		End If
		If lstr_email_checkin.autosign = 'Y' Then
			lb_autosign = True
		Else
			lb_autosign = False
		End If		
		lw_email_edit.ole_word.of_open(lbob_checkin)
		of_add_dm_link(lw_email_edit.ole_word) //Added By Ken.Guo 2016-09-30
		ls_subject = lstr_email_checkin.subject
		This.of_merge_message( lw_email_edit.ole_word, ls_subject ,ll_ctx_id, ll_doc_id, ls_linkname, ls_filename,lstr_email_checkin.export_id )
		ll_Return = lnv_Mail.of_SendHtml(ls_sender, ls_sender_email, '', '',ls_subject, lw_email_edit.ole_Word, lstr_email_checkin.attach_name,lb_autosign,ll_ctx_id,ll_doc_id,0) 
	Else
		//User default email content.
		ll_Return = lnv_mail.of_sendtext( ls_sender, ls_sender_email, '', '', ls_subject, ls_message, '')	
	End If
	
	gstr_email_info.ss_ctx_id_list = ''
	gstr_email_info.ss_doc_id_list = ''
	
	//Show Error Info	
	if ll_Return <> 0 then
		If lnv_Mail.is_sendprotocol = 'SMTP' Then
			f_show_message('error_code_'+string(ll_Return),'%1S%',String(ll_Return),'','')
		Else
			f_show_message('error_code_'+string(ll_Return),'ALL',lnv_Mail.of_getemailerror(ll_Return),'','')
		End If
		lnv_Mail.of_DeleteObject()
		Continue
	end if
	
	//Added Email Audit  info
	ls_errtext = gnv_message.of_get_error_message( ll_Return)
	ls_computer_info = lnv_Mail.of_get_compute_info( )
	
	//Insert mail audit, update web approve data
	gnv_appeondb.of_startqueue( )
	Insert Into em_mail_audit
	(user_id,mail_from,mail_to,mail_cc,mail_bcc,mail_subject,mail_date,mail_attach_name,mail_template_id,ctx_id_list,doc_id_list,ai_id_list,wf_id,alarm_type,field_name,send_result,error_text,notes,compute_info)
	Values 
	(:gs_user_id,:ls_sender,:ls_sender_email,'','',:ls_subject,getdate(),'',null,:ls_ctxid,:ls_docid,'',null,:ls_email_type,'',:ll_Return,:ls_errtext,'',:ls_computer_info);
	Update ctx_am_image_approve Set replied_email = :ll_mailstep Where doc_id = :ll_doc_id and revision = :ldec_revision;
	Update ctx_am_action_item Set Action_Status = :il_submitted  Where doc_id = :ls_docid and seq_id = :ll_sender_ai_id and Action_Type = :il_DocCheckIN and  Action_Status = :il_InComplete ;
	
	gnv_appeondb.of_commitqueue( )
	
Next

lnv_Mail.of_DeleteObject()

This.of_trigger_ai_wf( ) //Added By Ken.Guo 2016-04-22 trigger again, after set check in status.

gnv_status_info.of_display('')
If isvalid(ids_approval_result) Then Destroy ids_approval_result
Return 1
end function

public subroutine of_initialization ();//This event be executed when applicatin login
gnv_appeondb.of_startqueue( )
	Select lookup_code Into :il_InComplete From code_lookup Where Lookup_name = 'Contract Action Status' and code = 'Incomplete' and type = 'S';
	Select lookup_code Into :il_Submitted From code_lookup Where Lookup_name = 'Contract Action Status' and code = 'Submitted' and type = 'S';
	Select lookup_code Into :il_WebApproval From code_lookup Where Lookup_name = 'Contract Action Type' and code = 'Doc-Approval-Request' and type = 'S';
	Select lookup_code Into :il_DocCheckIN From code_lookup Where Lookup_name = 'Contract Action Type' and code = 'Doc-Approval-CheckIn' and type = 'S';
gnv_appeondb.of_commitqueue( )

end subroutine

public function string of_download_attach (long al_approve_id, long al_seqno, string as_name);Integer i
Datetime ldt_modify_date
String ls_updatedate_server,ls_updatedate_client , ls_path,ls_fullname,ls_tempfullname
String ls_lastupdate
long ll_getupdate,ll_data_length,li_loops,li_counter,ll_start,ll_BlobLen
Long ll_CurrentPos,li_Cnt
Blob lb_all_data,lb_data,lblb_Data
Integer li_FileNum,li_Writes


ls_path = gs_dir_path + gs_DefDirName + "\Agreement\WebApprove\Attachments\"
gnv_appeondll.of_parsepath(ls_path)
ls_fullname = ls_path + as_name

If FileExists(ls_fullname) Then
	If Not FileDelete(ls_fullname) Then
		Messagebox('Error','Failed to replace the temp file '+ls_fullname+', please close the file then try again.')
		Return ''
	End If
End If


If gs_dbtype = "ASA" Or appeongetclienttype() <> 'PB' Then		
	SELECTBLOB attach_image INTO :lb_all_data
	  FROM ctx_am_image_approve_email_attach Where approve_id = :al_approve_id and seq_no = :al_seqno ;
Else			
	SELECT Datalength(attach_image) INTO :ll_data_length
	  FROM ctx_am_image_approve_email_attach Where approve_id = :al_approve_id and seq_no = :al_seqno ;
	
	If isnull(ll_data_length) Then ll_data_length = 0
	
	If ll_data_length > 8000 Then 
		If Mod(ll_data_length,8000) = 0 Then
			li_loops = ll_data_length/8000 
		Else
			li_loops = (ll_data_length/8000) + 1 
		End If 
	ElseIf ll_data_length > 0 Then 
		li_loops = 1 
	End If 
	
	For li_counter = 1 To li_loops				
		ll_start = (li_counter - 1) * 8000 + 1
		SELECTBLOB substring(attach_image,:ll_start,8000) INTO :lb_data
		  FROM ctx_am_image_approve_email_attach Where approve_id = :al_approve_id and seq_no = :al_seqno ;
		lb_all_data += lb_data
	Next 
End If
If isnull(lb_all_data) Then lb_all_data = blob('')
If Len(lb_all_data) < 1 Then 
	ls_fullname = ''
	Messagebox('Error -3','Failed to download the attachment from database, the file blob value is empty.')
	Return ""
End If

li_FileNum = FileOpen(ls_fullname , StreamMode! ,Write!,Shared!, Replace!)
If li_FileNum = -1 Then 
	ls_fullname = ''
	Messagebox('Error -4','Failed to create the email attachment.')
	Return ""
End If
	
ll_BlobLen = Len(lb_all_data)
If ll_BlobLen > 32765 Then
	If Mod(ll_BlobLen, 32765) = 0 Then
		li_Writes = ll_BlobLen / 32765
	Else
		li_Writes = (ll_BlobLen / 32765) + 1
	End If
 Else
	li_Writes = 1
End If

ll_CurrentPos = 1

For li_Cnt = 1 To li_Writes
	lblb_Data = BlobMid(lb_all_data, ll_CurrentPos, 32765)
	ll_CurrentPos += 32765
	If FileWrite(li_FileNum, lblb_Data) = -1 Then
		ls_fullname = ''
		Messagebox('Error -5','Failed to write the blob value to the attachment file.')
		Return ""
	End If
Next
FileClose(li_FileNum)

Return ls_fullname


end function

public function integer of_send_email (str_ctx_email astr_ctx_email, string as_to);String ls_notify_emails, ls_users_arr[], ls_emails_arr[]
String ls_email,ls_userid,ls_subject
Long i, ll_email_template_id
long 		ll_Return,li_send_result = 0
String ls_errtext,ls_attachfilename,ls_to,ls_cc,ls_bcc,ls_email_type,ls_notes,ls_computer_info
Boolean lb_siganature = False
String ls_attach
n_cst_easymail_smtp 	lnv_Mail
n_cst_dm_utils lnv_dm_utils 
w_email_edit lw_email_edit

String		ls_AppointmentList
datetime	ldt_duedate

Setpointer(HourGlass!)

If UpperBound(astr_ctx_email.as_attach_list[]) > 0 Then
	inv_string.of_arraytostring( astr_ctx_email.as_attach_list[],',', ls_attach)
End If

If astr_ctx_email.ai_signature = 1 Then
	lb_siganature = True
End If

if lnv_Mail.of_CreateObject() = -1 then
	f_show_message('Create Email Object','','','','')
	Return -1
end if
ls_subject = is_email_subject + astr_ctx_email.as_mail_subject

gstr_email_info.ss_ctx_id_list = String(astr_ctx_email.ctx_id)
gstr_email_info.ss_doc_id_list = String(astr_ctx_email.doc_id)

//**************************************// added by gavins 20121026
ls_AppointmentList = astr_ctx_email.alm_appointment
If gnv_data.of_getitem( 'icred_settings', 'Appointment_create', False) = '1' And Len( ls_AppointmentList ) > 1  Then
	If IsNull( ldt_duedate) Or String( ldt_duedate, 'yyyymmdd' ) = '19000101'  Then ldt_duedate = DateTime( today( ) )
	lnv_Mail.of_setappointmentarguments( true, ldt_duedate , '' )
End If
//**************************************//	

//ll_Return = lnv_Mail.of_SendHtml(astr_ctx_email.as_sender,as_emailaddress, '', '', astr_ctx_email.as_mail_subject , lw_email_edit.ole_word, ls_attach,lb_siganature,astr_ctx_email.ctx_id,astr_ctx_email.doc_id,0)
ll_Return = lnv_Mail.of_sendtext( gs_user_id, as_to, '', '', ls_subject,astr_ctx_email.as_message , '')

gstr_email_info.ss_ctx_id_list = ''
gstr_email_info.ss_doc_id_list = ''

//Show Error Info	
if ll_Return <> 0 then
	If lnv_Mail.is_sendprotocol = 'SMTP' Then
		f_show_message('error_code_'+string(ll_Return),'%1S%',String(ll_Return),'','')
	Else
		f_show_message('error_code_'+string(ll_Return),'ALL',lnv_Mail.of_getemailerror(ll_Return),'','')
	End If
	lnv_Mail.of_DeleteObject()
	Return -2
end if

//Added Email Audit  
If ll_Return <> 0 then 
	ls_errtext = gnv_message.of_get_error_message( ll_Return)
End If
ls_attachfilename = inv_string.of_get_file_name( ls_attach, ',') 
ls_to = as_to
ls_cc = ''
ls_bcc = ''
ls_email_type = 'Web Approval'
If ll_email_template_id = 0 Then Setnull(ll_email_template_id)
ls_computer_info = lnv_Mail.of_get_compute_info( )

Insert Into em_mail_audit
(user_id,mail_from,mail_to,mail_cc,mail_bcc,mail_subject,mail_date,mail_attach_name,mail_template_id,ctx_id_list,doc_id_list,ai_id_list,wf_id,alarm_type,field_name,send_result,error_text,notes,compute_info)
Values 
(:gs_user_id,:gs_user_id,:ls_to,:ls_cc,:ls_bcc,:ls_subject,getdate(),'',:ll_email_template_id,:astr_ctx_email.ctx_id,:astr_ctx_email.doc_id,'',null,:ls_email_type,'',:li_send_result,:ls_errtext,:ls_notes,:ls_computer_info);


lnv_Mail.of_DeleteObject()

Return 1
end function

public function integer of_show_approve_status (str_ctx_email astr_ctx_email, u_tabpg_dm_data au_tabpg_dm_data);OpenWithParm(w_dm_approve_status, astr_ctx_email)

//Refresh document data if check in document
If Message.doubleparm > 0 Then
	If isvalid(au_tabpg_dm_data) Then
		au_tabpg_dm_data.Event ue_retrieve( )
		au_tabpg_dm_data.of_locate_doc(astr_ctx_email.doc_id)	
	End If
	//Refresh action items data
	If isvalid(gw_contract) Then
		If gw_contract.tab_contract_details.ib_select9 Then
			If gw_contract.tab_contract_details.tabpage_images.tab_1.tabpage_action.of_get_doc_id() = astr_ctx_email.doc_id Then
				gw_contract.tab_contract_details.tabpage_images.tab_1.tabpage_action.of_retrieve() 
			End If
		End If
	End If
End If

Return 1
end function

public function string of_download_org_file (str_ctx_email astr_ctx_email);Integer i
Datetime ldt_modify_date
String ls_updatedate_server,ls_updatedate_client , ls_path,ls_pathfullname,ls_tempfullname
String ls_lastupdate
long ll_getupdate,ll_data_length,li_loops,li_counter,ll_start,ll_BlobLen
Long ll_CurrentPos,li_Cnt
Blob lb_all_data,lb_data,lblb_Data
Integer li_FileNum,li_Writes


ls_path = gs_dir_path + gs_DefDirName + "\Agreement\WebApprove\Original\" 
gnv_appeondll.of_parsepath(ls_path)
ls_pathfullname = ls_path + astr_ctx_email.fullname

//Check File Exists
If FileExists(ls_pathfullname) Then
	If Not FileDelete(ls_pathfullname) Then
		Messagebox('Error','Failed to download the original document '+astr_ctx_email.fullname+', please call support.')
		Return ''
	End If
End If

//Download from DB
If gs_dbtype = "ASA" Or appeongetclienttype() <> 'PB' Then		
	SELECTBLOB org_image_file INTO :lb_all_data
	  FROM ctx_am_image_approve Where doc_id = :astr_ctx_email.doc_id  and revision = :astr_ctx_email.revision ;
Else			
	SELECT Datalength(org_image_file) INTO :ll_data_length
	  FROM ctx_am_image_approve Where doc_id = :astr_ctx_email.doc_id  and revision = :astr_ctx_email.revision ;
	
	If isnull(ll_data_length) Then ll_data_length = 0
	
	If ll_data_length > 8000 Then 
		If Mod(ll_data_length,8000) = 0 Then
			li_loops = ll_data_length/8000 
		Else
			li_loops = (ll_data_length/8000) + 1 
		End If 
	ElseIf ll_data_length > 0 Then 
		li_loops = 1 
	End If 
	
	For li_counter = 1 To li_loops				
		ll_start = (li_counter - 1) * 8000 + 1
		SELECTBLOB substring(org_image_file,:ll_start,8000) INTO :lb_data
		  FROM ctx_am_image_approve Where doc_id = :astr_ctx_email.doc_id  and revision = :astr_ctx_email.revision;
		lb_all_data += lb_data
	Next 
End If
If isnull(lb_all_data) Then lb_all_data = blob('')
If Len(lb_all_data) < 1 Then 
	ls_pathfullname = ''
	Messagebox('Error -3','Failed to download the document from database, the file blob value is empty.')
	Return ''
End If

//Write to File
li_FileNum = FileOpen(ls_pathfullname , StreamMode! ,Write!,Shared!, Replace!)
If li_FileNum = -1 Then 
	ls_pathfullname = ''
	Messagebox('Error -4','Failed to create the document.')
	Return ''
End If
ll_BlobLen = Len(lb_all_data)
If ll_BlobLen > 32765 Then
	If Mod(ll_BlobLen, 32765) = 0 Then
		li_Writes = ll_BlobLen / 32765
	Else
		li_Writes = (ll_BlobLen / 32765) + 1
	End If
 Else
	li_Writes = 1
End If
ll_CurrentPos = 1
For li_Cnt = 1 To li_Writes
	lblb_Data = BlobMid(lb_all_data, ll_CurrentPos, 32765)
	ll_CurrentPos += 32765
	If FileWrite(li_FileNum, lblb_Data) = -1 Then
		ls_pathfullname = ''
		Messagebox('Error -5','Failed to write the blob value to the file.')
		Return ''
	End If
Next
FileClose(li_FileNum)

If FileExists(ls_pathfullname) Then
	Return ls_pathfullname
Else
	Return ''
End If

end function

public function integer of_create_action_items (long al_approve_id, str_ctx_email astr_ctx_email, string as_userlist, integer ai_userorder, integer ai_create_for_sender, datetime adt_duedate);Long i,j, ll_row, ll_seqid, ll_findrow, ll_cnt
String ls_notify_users,ls_users_arr[]
n_ds lds_webapprove,lds_webapprove_detail,lds_action_items

lds_webapprove = Create n_ds
lds_webapprove.DataObject = 'd_am_approve_list'
lds_webapprove.SetTransObject(SQLCA)

lds_webapprove_detail = Create n_ds
lds_webapprove_detail.DataObject = 'd_am_approve_detail_list'
lds_webapprove_detail.SetTransObject(SQLCA)

lds_action_items = Create n_ds
lds_action_items.DataObject = "d_am_action_items"
lds_action_items.SetTransObject(SQLCA)

//Get create action item user list  and web approve user list.
inv_string.of_parsetoarray( as_userlist,';',ls_users_arr[])

gnv_appeondb.of_startqueue( )
	lds_webapprove.Retrieve(al_approve_id)
	lds_webapprove_detail.Retrieve(al_approve_id)
gnv_appeondb.of_commitqueue( )

//Insert action items for  notify users.
For j = 1 To UpperBound(astr_ctx_email.doc_id_list[] )
	For i = 1 To UpperBound(ls_users_arr[])
		ll_row = lds_action_items.InsertRow(0)		
		lds_action_items.SetItem(ll_row, 'doc_id', astr_ctx_email.doc_id_list[j])
		lds_action_items.SetItem(ll_row, 'action_type', il_WebApproval)
		lds_action_items.SetItem(ll_row, 'due_date', adt_duedate)
		lds_action_items.SetItem(ll_row, 'wf_assigned_by', gs_user_id)
		lds_action_items.SetItem(ll_row, 'active_status', 0)
		lds_action_items.SetItem(ll_row, 'action_status', il_InComplete)
		lds_action_items.SetItem(ll_row, 'status_date', today())
		lds_action_items.SetItem(ll_row, 'create_date', today())
		lds_action_items.SetItem(ll_row, 'action_user', ls_users_arr[i])
		lds_action_items.SetItem(ll_row, 'attempt_times', 1)
		lds_action_items.SetItem(ll_row, 'first_attempt', today())
		lds_action_items.SetItem(ll_row, 'last_attempt', today())
		lds_action_items.SetItem(ll_row, 'print_flag', -1)
		lds_action_items.SetItem(ll_row, 'notes', '')
	Next
Next
ll_cnt = lds_action_items.rowcount()

//Insert action item for sender
If ai_userorder = 1 and ai_create_for_sender = 1 Then
	For j = 1 To UpperBound(astr_ctx_email.doc_id_list[] )
		ll_row = lds_action_items.InsertRow(0)		
		lds_action_items.SetItem(ll_row, 'doc_id', astr_ctx_email.doc_id_list[j] )
		lds_action_items.SetItem(ll_row, 'action_type', il_DocCheckIN)
		lds_action_items.SetItem(ll_row, 'due_date', adt_duedate)
		lds_action_items.SetItem(ll_row, 'wf_assigned_by', gs_user_id)
		lds_action_items.SetItem(ll_row, 'active_status', 0)
		lds_action_items.SetItem(ll_row, 'action_status', il_InComplete)
		lds_action_items.SetItem(ll_row, 'status_date', today())
		lds_action_items.SetItem(ll_row, 'create_date', today())
		lds_action_items.SetItem(ll_row, 'action_user',gs_user_id)
		lds_action_items.SetItem(ll_row, 'attempt_times', 1)
		lds_action_items.SetItem(ll_row, 'first_attempt', today())
		lds_action_items.SetItem(ll_row, 'last_attempt', today())
		lds_action_items.SetItem(ll_row, 'print_flag', -1)
		lds_action_items.SetItem(ll_row, 'notes', '')	
	Next
End If

//Update web approve's action item id
If lds_action_items.rowcount() > 0 Then
	If lds_action_items.Update() = 1 Then
		For i = 1 To ll_cnt
			ll_findrow = lds_webapprove_detail.Find('user_id = "' +lds_action_items.GetItemString(i, 'action_user')+ '" and  user_order = '+String(ai_userorder)+' and doc_id =  ' + String(lds_action_items.GetItemNumber(i, 'doc_id')) , 1, lds_webapprove_detail.RowCount())
			If ll_findrow > 0 Then
				lds_webapprove_detail.SetItem(ll_findrow, 'ai_id',  lds_action_items.GetItemNumber(i, 'seq_id'))
			End If
		Next
	Else
		Messagebox('Error -1','Failed to create action items for notify users.')	
	End If
End If

//Save it
If lds_webapprove_detail.Modifiedcount( ) > 0 Then
	If lds_webapprove_detail.Update() = 1 Then
		//
	Else
		Messagebox('Error -2','Failed to update action item for web approve.')
	End If
End If

//Update Sender Action Item ID
If ai_userorder = 1 and ai_create_for_sender = 1 Then 
	For i = ll_cnt + 1 To lds_action_items.Rowcount()
		ll_seqid = lds_action_items.GetItemNumber(i, 'seq_id')
		ll_findrow = lds_webapprove.Find('sender_user = "' +lds_action_items.GetItemString(i, 'action_user')+ '" and doc_id =  ' + String(lds_action_items.GetItemNumber(i, 'doc_id')) , 1, lds_webapprove.RowCount())
		If ll_findrow > 0 Then
			lds_webapprove.SetItem(ll_findrow, 'sender_ai_id',  lds_action_items.GetItemNumber(i, 'seq_id'))
		End If		
	Next
End If
If lds_webapprove.Modifiedcount( ) > 0 Then
	If lds_webapprove.Update() = 1 Then
		//
	Else
		Messagebox('Error -3','Failed to update action item for web approve.')
	End If
End If

If isvalid(lds_webapprove) Then Destroy lds_webapprove
If isvalid(lds_webapprove_detail) Then Destroy lds_webapprove_detail
If isvalid(lds_action_items) Then Destroy lds_action_items



Return 1
end function

public function integer of_trigger_ai_wf ();//====================================================================
// Function: of_trigger_ai_wf
//--------------------------------------------------------------------
// Description: trigger the document action item changed wf when user  approved the document in the Web Approval.
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:         Ken.Guo 2016-04-22
//--------------------------------------------------------------------
//Copyright (c) 2008-2015 Contract Logix, Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

Long ll_cnt,ll_i , ll_wf_cnt, ll_approved, ll_approvedwithchanged, ll_reject,ll_action_type, ll_action_type_checkin
Long ll_approve_status, ll_submit
str_action_item lstr_action[]
n_cst_workflow_triggers lnv_trigger

If not gb_workflow Then return 0

gnv_appeondb.of_startqueue( )
	select count(1) into :ll_wf_cnt from wf_workflow where wf_status = 'A' and wf_module = '04' and wf_triggered_by = '008';
	select lookup_code into :ll_approved from code_lookup where lookup_name = 'Contract Action Status' and code = 'Approved';
	select lookup_code into :ll_approvedwithchanged from code_lookup where lookup_name = 'Contract Action Status' and code = 'ApprovedWithChanges';
	select lookup_code into :ll_reject from code_lookup where lookup_name = 'Contract Action Status' and code = 'Rejected';
	select lookup_code into :ll_submit from code_lookup where lookup_name = 'Contract Action Status' and code = 'Submitted';
	select lookup_code into :ll_action_type from code_lookup where lookup_name = 'Contract Action Type' and code = 'Doc-Approval-Request';	
	select lookup_code into :ll_action_type_checkin from code_lookup where lookup_name = 'Contract Action Type' and code = 'Doc-Approval-CheckIn';	 //Added By Ken.Guo 2016-05-27
gnv_appeondb.of_commitqueue( )

if ll_wf_cnt <= 0 then Return 0

//trigger wf after requster approve the document and changed the status.
n_ds lds_need_trigger
lds_need_trigger = Create n_ds 
lds_need_trigger.dataobject = 'd_web_approve_trigger_wf' 
lds_need_trigger.settransobject(sqlca)
ll_cnt = lds_need_trigger.retrieve()
if ll_cnt > 0 Then //Modified By Ken.Guo 2016-05-27
	For ll_i = 1 To ll_cnt
		lstr_action[ll_i].doc_id = lds_need_trigger.getItemnumber( ll_i, "doc_id" )
		lstr_action[ll_i].seq_no = lds_need_trigger.getItemnumber( ll_i, "ai_id" )
		lstr_action[ll_i].ctx_id =  lds_need_trigger.getItemnumber( ll_i, "ctx_id" )
		lstr_action[ll_i].wf_action_status_id =  lds_need_trigger.getItemnumber( ll_i, "action_status" )
		lstr_action[ll_i].wf_action_type_id = ll_action_type
		lstr_action[ll_i].status_changed_flag = false
		lstr_action[ll_i].module = "04"	//Contract Logix Agreement
		lstr_action[ll_i].trigger_by = "008"		//Trigger By Action Item Changed
		lstr_action[ll_i].screen_id = -10	
		lds_need_trigger.setitem(ll_i, 'triggered_ai_changed_wf', 1) //reset the flag, Prevent trigger again.
	Next 
End If

//trigger wf after status is changed to submitted for sender.  //Added By Ken.Guo 2016-05-27
n_ds lds_need_trigger_sender
lds_need_trigger_sender = Create n_ds 
lds_need_trigger_sender.dataobject = 'd_web_approve_trigger_wf_sender' 
lds_need_trigger_sender.settransobject(sqlca)
ll_cnt = lds_need_trigger_sender.retrieve()
lds_need_trigger_sender.setfilter('action_type = ' + String(ll_action_type_checkin) + ' and action_status = ' + String(ll_submit) )
lds_need_trigger_sender.filter()
ll_cnt = lds_need_trigger_sender.rowcount()
if ll_cnt > 0 Then
	For ll_i = 1 To ll_cnt
		lstr_action[UpperBound(lstr_action[])+1].doc_id = lds_need_trigger_sender.getItemnumber( ll_i, "doc_id" )
		lstr_action[UpperBound(lstr_action[])].seq_no = lds_need_trigger_sender.getItemnumber( ll_i, "ai_id" )
		lstr_action[UpperBound(lstr_action[])].ctx_id =  lds_need_trigger_sender.getItemnumber( ll_i, "ctx_id" )
		lstr_action[UpperBound(lstr_action[])].wf_action_status_id =  lds_need_trigger_sender.getItemnumber( ll_i, "action_status" )
		lstr_action[UpperBound(lstr_action[])].wf_action_type_id = ll_action_type_checkin
		lstr_action[UpperBound(lstr_action[])].status_changed_flag = false
		lstr_action[UpperBound(lstr_action[])].module = "04"	//Contract Logix Agreement
		lstr_action[UpperBound(lstr_action[])].trigger_by = "008"		//Trigger By Action Item Changed
		lstr_action[UpperBound(lstr_action[])].screen_id = -10	
		lds_need_trigger_sender.setitem(ll_i, 'triggered_ai_changed_wf', 1) //reset the flag, Prevent trigger again.
	Next 
End If

If UpperBound(lstr_action[]) > 0 Then  //Added By Ken.Guo 2016-05-27
	lnv_trigger = create n_cst_workflow_triggers
	lnv_trigger.ib_trigger_on_login = True
	If lnv_trigger.of_workflow_triggers(lstr_action)  > 0 Then
		lds_need_trigger.update()
		lds_need_trigger_sender.update() //Added By Ken.Guo 2016-05-27
	End If
End If

If isvalid(lds_need_trigger) Then Destroy lds_need_trigger
If isvalid(lds_need_trigger_sender) Then Destroy lds_need_trigger_sender //Added By Ken.Guo 2016-05-27
if isvalid(lnv_trigger) Then Destroy lnv_trigger //Added By Ken.Guo 2016-05-27

Return 1
end function

public function integer of_get_email_template (string as_email_type, ref blob abob_message, ref str_email astr_email);//====================================================================
// Function: of_get_email_template
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//                as_email_type
//                abob_message
//                astr_email
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:         Ken.Guo 2016-08-24
//--------------------------------------------------------------------
//Copyright (c) 2008-2016 Contract Logix, Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

Long ll_email_id

ll_email_id = Long(gnv_data.of_getitem('email_template_settings', 'email_template_id', 'email_type="' +as_email_type+ '"'))

Return of_get_email_template(ll_email_id,abob_message, astr_email)

end function

public function integer of_merge_message (u_email_edit aole_word, ref string as_subject, long al_ctx_id, long al_doc_id, string as_linkname, string as_docname, long al_export_id);//====================================================================
// Function: of_merge_message
//--------------------------------------------------------------------
// Description: Merge the message and subject.
//--------------------------------------------------------------------
// Arguments:
//                aole_word
//                as_subject
//                al_ctx_id
//                al_doc_id
//                as_linkname
//                as_docname
//                al_export_id
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:         Ken.Guo 2016-08-24
//--------------------------------------------------------------------
//Copyright (c) 2008-2016 Contract Logix, Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


Long ll_ctx_id, ll_doc_id
String ls_doc_name,ls_url, ls_subject

Blob lbob_Message
n_cst_word_utility lnv_word

If not isvalid(lnv_word) Then
	lnv_word = Create n_cst_word_utility
End If


lnv_word.of_set_web_values(al_doc_id, as_docname, as_linkname, as_linkname)
lnv_word.of_replace_export_word(aole_word.Object.ActiveDocument, as_subject,al_ctx_id,al_export_id)

If isvalid(lnv_word) Then Destroy lnv_word

If aole_word.Object.doctype  <> 1 Then Return -1

Return  1

end function

public function integer of_get_email_template (long al_email_id, ref blob abob_message, ref str_email astr_email);//====================================================================
// Function: of_get_email_template
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//                al_email_id
//                abob_message
//                astr_email
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:         Ken.Guo 2016-08-25
//--------------------------------------------------------------------
//Copyright (c) 2008-2016 Contract Logix, Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


Long ll_RowCnts,ll_Cycle,ll_AttachID,ll_exists
String ls_AttachName,ls_AttachList,ls_FileName
Blob lblb_Attach[],lbob_Message
Boolean lb_autosign
n_cst_filesrv ln_FileSrv
n_ds lds_EmailAttach

//Added By Ken.Guo 2016-08-24

n_cst_workflow_triggers lnv_trigger

If not isvalid(lnv_trigger) Then
	lnv_trigger = Create n_cst_workflow_triggers
End If

If al_email_id > 0 Then //Get Email template info

	//Get subject, export id
	Select 
		email_id,
		subject,
		export_id,
		isnull(wf_email.auto_sign,'Y')
		Into 
		:ll_exists,
		:astr_email.subject,
		:astr_email.export_id,
		:astr_email.autosign				
		From wf_email
		Where wf_email.email_id = :al_email_id;
	End If
	If ll_exists <= 0 or isnull(ll_exists)  Then Return -1

	//get body message
	lnv_trigger.of_Get_EmailMessage(al_email_id,abob_message)
	
	If Len(abob_message) = 0 or isnull(abob_message) Then 
		If isvalid(lnv_trigger) Then Destroy lnv_trigger //Added By Ken.Guo 2016-09-01
		Return -2
	End If

	//Get Attach list
	lds_EmailAttach = Create n_ds
	lds_EmailAttach.DataObject = "d_Email_Attach"
	lds_EmailAttach.SetTransObject(SQLCA)
	lds_EmailAttach.Retrieve(al_email_id)
	ln_FileSrv = create n_cst_filesrv
	ll_RowCnts = lds_EmailAttach.RowCount()
	for ll_Cycle = 1 to ll_RowCnts
		ls_AttachName = lds_EmailAttach.GetItemString(ll_Cycle,"attach_name")
		ll_AttachID = lds_EmailAttach.GetItemNumber(ll_Cycle,"attach_id")
		
		lnv_trigger.of_GetEmailAttachment(al_email_id,ll_AttachID,lblb_Attach[UpperBound(lblb_Attach) + 1])
		if Len(lblb_Attach[UpperBound(lblb_Attach)]) > 0 then
			ls_FileName = gs_dir_path + gs_DefDirName + "\" + ls_AttachName
			ln_FileSrv.of_FileWrite(ls_FileName, lblb_Attach[UpperBound(lblb_Attach)],false)
			ls_AttachList += ls_FileName + ';'
		end if
	next
	If isvalid(ln_FileSrv) Then Destroy ln_FileSrv
	If isvalid(lds_EmailAttach) Then Destroy lds_EmailAttach
	If isvalid(lnv_trigger) Then Destroy lnv_trigger //Added By Ken.Guo 2016-09-01
	
	if Not (IsNull(ls_AttachList) or Trim(ls_AttachList) = "") then
		ls_AttachList = Left(ls_AttachList,Len(ls_AttachList) - 1)
	end if
	astr_email.attach_name = ls_AttachList
	
	
Return 1
end function

public function integer of_send_email (str_ctx_email astr_ctx_email);//====================================================================
// Function: of_send_email
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//                astr_ctx_email
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:         Ken.Guo 2016-08-26
//--------------------------------------------------------------------
//Copyright (c) 2008-2016 Contract Logix, Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================



//String ls_notify_emails, ls_users_arr[], ls_emails_arr[]
String ls_email,ls_userid,ls_subject
Long i, ll_email_template_id
long 		ll_Return,li_send_result = 0
String ls_errtext,ls_attachfilename,ls_to,ls_cc,ls_bcc,ls_email_type,ls_notes,ls_computer_info

String ls_attach
n_cst_easymail_smtp 	lnv_Mail
n_cst_dm_utils lnv_dm_utils 
w_email_edit lw_email_edit

blob lb_message_org
str_email lstr_email
Boolean lb_siganature = False
String ls_AppointmentList
Datetime ldt_duedate

Setpointer(HourGlass!)


This.of_get_email_template( astr_ctx_email.al_mail_id , lb_message_org, lstr_email) //only use EmailAttach and Autosign value.

If lstr_email.autosign = 'Y' Then
	lb_siganature = True
End If

if lnv_Mail.of_CreateObject() = -1 then
	f_show_message('Create Email Object','','','','')
	Return -1
end if

Open(lw_email_edit)
lw_email_edit.ole_word.of_open( astr_ctx_email.ablb_message  )

ls_AppointmentList = astr_ctx_email.alm_appointment
If gnv_data.of_getitem( 'icred_settings', 'Appointment_create', False) = '1' And Len( ls_AppointmentList ) > 1  Then
	If IsNull( ldt_duedate) Or String( ldt_duedate, 'yyyymmdd' ) = '19000101'  Then ldt_duedate = DateTime( today( ) )
	lnv_Mail.of_setappointmentarguments( true, ldt_duedate , '' )
End If

gstr_email_info.ss_ctx_id_list = String(astr_ctx_email.ctx_id)
gstr_email_info.ss_doc_id_list = String(astr_ctx_email.doc_id)

astr_ctx_email.as_sender = lnv_Mail.of_replace_send_user(gs_user_id) //Added By Ken.Guo 2016-10-24

ll_Return = lnv_Mail.of_SendHtml(gs_user_id,astr_ctx_email.emailto, '', '', astr_ctx_email.as_mail_subject , lw_email_edit.ole_word, lstr_email.attach_name ,lb_siganature,astr_ctx_email.ctx_id,astr_ctx_email.doc_id,0)

gstr_email_info.ss_ctx_id_list = ''
gstr_email_info.ss_doc_id_list = ''

lw_email_edit.ole_word.of_close( )
Close(lw_email_edit)

//Show Error Info	
if ll_Return <> 0 then
	//Modified By Ken.Guo 07/04/2013
	If lnv_Mail.is_sendprotocol = 'SMTP' Then
		f_show_message('error_code_'+string(ll_Return),'%1S%',String(ll_Return),'','')
	Else
		f_show_message('error_code_'+string(ll_Return),'ALL',lnv_Mail.of_getemailerror(ll_Return),'','')
	End If
	lnv_Mail.of_DeleteObject()
	Return -2
end if

//Added Email Audit  
If ll_Return <> 0 then 
	ls_errtext = gnv_message.of_get_error_message( ll_Return)
End If
ls_attachfilename = lstr_email.attach_name
ls_to = astr_ctx_email.emailto  
ls_cc = ''
ls_bcc = ''
ls_subject = astr_ctx_email.as_mail_subject
ls_email_type = astr_ctx_email.action_type// 'Web Approval'  
If ll_email_template_id = 0 Then Setnull(ll_email_template_id)
ls_computer_info = lnv_Mail.of_get_compute_info( )

Insert Into em_mail_audit
(user_id,mail_from,mail_to,mail_cc,mail_bcc,mail_subject,mail_date,mail_attach_name,mail_template_id,ctx_id_list,doc_id_list,ai_id_list,wf_id,alarm_type,field_name,send_result,error_text,notes,compute_info)
Values 
(:gs_user_id,:astr_ctx_email.as_sender,:ls_to,:ls_cc,:ls_bcc,:astr_ctx_email.as_mail_subject,getdate(),:ls_attachfilename,:ll_email_template_id,:astr_ctx_email.ctx_id,:astr_ctx_email.doc_id,'',null,:ls_email_type,'',:li_send_result,:ls_errtext,:ls_notes,:ls_computer_info);


lnv_Mail.of_DeleteObject()


Return 1
end function

public function integer of_add_dm_link (u_email_edit auo_word);//====================================================================
// Function: of_add_dm_link
//--------------------------------------------------------------------
// Description: added document link to the email message.
//--------------------------------------------------------------------
// Arguments:
//                auo_word
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:         Ken.Guo 2016-09-30
//--------------------------------------------------------------------
//Copyright (c) 2008-2016 Contract Logix, Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


If auo_word.object.doctype = 1 Then
	//Added weblink label
	auo_word.object.ActiveDocument.Content.Select()
	IF auo_word.object.ActiveDocument.ActiveWindow.Selection.Find.Execute('$<Document Manager Link>$', false, true,false ) Then 
		Return 0
	End If
	
	auo_word.object.ActiveDocument.Content.Select()
	auo_word.object.ActiveDocument.ActiveWindow.Selection.Start = auo_word.object.ActiveDocument.ActiveWindow.Selection.End
	auo_word.object.ActiveDocument.ActiveWindow.Selection.Collapse(0) //wdCollapseEnd 
	auo_word.object.ActiveDocument.ActiveWindow.Selection.InsertAfter("~r~n~r~nPlease click the following URL to open Document Manager:~r~n$<Document Manager Link>$ ")
	auo_word.object.ActiveDocument.ActiveWindow.Selection.Expand()	
End If
Return 1

end function

on n_cst_webapprove.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_webapprove.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event destructor;////Added By Ken.Guo 2016-08-24
//If isvalid(inv_word) Then Destroy inv_word
//If isvalid(inv_trigger) Then Destroy inv_trigger
end event

event constructor;//If not isvalid(inv_word) Then
//	inv_word = Create n_cst_word_utility
//End If
//If not isvalid(inv_trigger) Then
//	inv_trigger = Create n_cst_workflow_triggers
//End If
end event

