$PBExportHeader$n_cst_email_checkin.sru
forward
global type n_cst_email_checkin from nonvisualobject
end type
end forward

global type n_cst_email_checkin from nonvisualobject
end type
global n_cst_email_checkin n_cst_email_checkin

type variables
n_ds ids_need_checkin_doc_list

//Added By Ken.Guo 2016-08-24
Constant String is_email_type = 'notification email for checking in file service' 
n_cst_word_utility inv_word
n_cst_workflow_triggers inv_trigger
str_email istr_email

end variables

forward prototypes
public function integer of_send_email ()
public function string of_gen_email_content (long al_row)
public function integer of_send_email (string as_mail_sender, string as_mail_to, string as_mail_cc, string as_mail_bcc, string as_subject, u_email_edit aole_word, string as_attachment, boolean ab_autosign)
public function integer of_merge_email_content (long al_row, blob abob_message, ref string as_subject)
public function integer of_send_mail (string as_sender, string as_to_user, string as_cc_user, string as_bcc_user, string as_subject, u_email_edit aole_word, string as_attachlist, boolean ab_autosign, long al_ctx_id, long al_doc_id, long al_ai_id)
end prototypes

public function integer of_send_email ();//////////////////////////////////////////////////////////////////////
// $<function>n_cst_email_checkinof_send_email()
// $<arguments>(None)
// $<returns> integer
// $<description>
// $<description> Send Email to Checkin document.
//////////////////////////////////////////////////////////////////////
// $<add> 2009-04-14 by Ken.Guo
//////////////////////////////////////////////////////////////////////

Long i,ll_cnt
String ls_sender,ls_mail_content
String ls_mail_to,ls_subject
Integer li_ret 
String ls_doc_name
Long ll_ctx_id


ll_cnt = ids_need_checkin_doc_list.Retrieve()
If ll_cnt <= 0 Then Return 1

//Commented By Mark Lee 01/09/2014
//Select top 1 set_addresser into :ls_sender from icred_settings;
If  gnv_data.of_getItem("icred_settings", "set_56", False) <> '1' then
	ls_sender = gnv_data.of_getItem("icred_settings", "set_addresser", False)
else
	ls_sender = ''
end if 

if IsNull(ls_sender) or Trim(ls_sender) = "" then
	ls_sender = gs_user_id
end if

//Added By Ken.Guo 2016-08-24. Get email info if it uses email template.
Long ll_email_id,ll_RowCnts,ll_Cycle,ll_AttachID,ll_exists, ll_doc_id
String ls_AttachName,ls_FileName,ls_AttachList
Blob lblb_Attach[],lbob_Message
Boolean lb_autosign
n_cst_filesrv ln_FileSrv
n_ds lds_EmailAttach
ll_email_id = Long(gnv_data.of_getitem('email_template_settings', 'email_template_id', 'email_type="' +is_email_type+ '"'))
If ll_email_id > 0 Then //Get Email template info

	//get body message
	inv_trigger.of_Get_EmailMessage(ll_email_id,lbob_Message)

	//Get Attach list
	lds_EmailAttach = Create n_ds
	lds_EmailAttach.DataObject = "d_Email_Attach"
	lds_EmailAttach.SetTransObject(SQLCA)
	lds_EmailAttach.Retrieve(ll_email_id)
	ln_FileSrv = create n_cst_filesrv
	ll_RowCnts = lds_EmailAttach.RowCount()
	for ll_Cycle = 1 to ll_RowCnts
		ls_AttachName = lds_EmailAttach.GetItemString(ll_Cycle,"attach_name")
		ll_AttachID = lds_EmailAttach.GetItemNumber(ll_Cycle,"attach_id")
		
		inv_trigger.of_GetEmailAttachment(ll_email_id,ll_AttachID,lblb_Attach[UpperBound(lblb_Attach) + 1])
		if Len(lblb_Attach[UpperBound(lblb_Attach)]) > 0 then
			ls_FileName = gs_dir_path + gs_DefDirName + "\" + ls_AttachName
			ln_FileSrv.of_FileWrite(ls_FileName, lblb_Attach[UpperBound(lblb_Attach)],false)
			
			ls_AttachList += ls_FileName + ';'
		end if
	next
	If isvalid(ln_FileSrv) Then Destroy ln_FileSrv
	If isvalid(lds_EmailAttach) Then Destroy lds_EmailAttach
	
	if Not (IsNull(ls_AttachList) or Trim(ls_AttachList) = "") then
		ls_AttachList = Left(ls_AttachList,Len(ls_AttachList) - 1)
	end if
	
	//Get subject, export id
	Select 
		email_id,
		subject,
		export_id,
		isnull(wf_email.auto_sign,'Y')
		Into 
		:ll_exists,
		:istr_email.subject,
		:istr_email.export_id,
		:istr_email.autosign				
		From wf_email
		Where wf_email.email_id = :ll_email_id;
		If istr_email.autosign = 'N' Then
			lb_autosign = False
		Else
			lb_autosign = True
		End If
End If

Openwithparm( w_wait, "Start Email notification to checkin document, please wait..." )
w_wait.hpb_1.MaxPosition = ll_cnt 		
w_wait.hpb_1.Position = 0
w_wait.hpb_1.SetStep = 1

Open(w_email_edit)
If ll_email_id <= 0 or isnull(ll_email_id) Then //Added By Ken.Guo 2016-08-24. added if. 
	w_email_edit.ole_word.of_open('',false)
End If

For i = 1 to ll_cnt
	IF IsValid(w_wait) THEN w_wait.hpb_1.StepIt()
	ls_mail_to = ids_need_checkin_doc_list.GetItemString(i,'sender_email')
	ls_doc_name = ids_need_checkin_doc_list.GetItemString(i,'file_name')
	ll_ctx_id = ids_need_checkin_doc_list.GetItemNumber(i,'ctx_id')
	ll_doc_id = ids_need_checkin_doc_list.GetItemNumber(i,'doc_id')
	If ll_email_id > 0 Then
		//Added By Ken.Guo 2016-08-24 Use email template to send.
		If ll_exists <= 0 or isnull(ll_exists) Then
			gnv_debug.of_output(True, 'Email error when notify of check in for file service. it uses email template but email template is not exists.')
		Else
			ls_subject = istr_email.subject
			If This.of_merge_email_content(i, lbob_Message, ls_subject) < 0 Then
				gnv_debug.of_output(True, 'Email error when notify of check in for file service. Failed to get or merge the email content.')
			Else
				If isnull(ls_subject) or ls_subject = '' Then ls_subject = 'The document "'+ls_doc_name+'" of Contract '+String(ll_ctx_id)+' requires your attention.'
				li_ret = this.of_send_mail( ls_sender,ls_mail_to, '', '', ls_subject,w_email_edit.ole_word, ls_AttachList, lb_autosign, ll_ctx_id, ll_doc_id, 0)
			End If
		End If
	Else
		ls_mail_content = This.of_gen_email_content(i)
		ls_subject = 'The document "'+ls_doc_name+'" of Contract '+String(ll_ctx_id)+' requires your attention.'
		li_ret = of_send_email( ls_sender,ls_mail_to, '', '', ls_subject,w_email_edit.ole_word , '',false)
	End If
	
	if li_ret = 0 then
		ids_need_checkin_doc_list.SetItem(i,'replied_email',1)
	end if
Next

IF IsValid(w_wait) THEN Close(w_wait)
If Isvalid(w_email_edit) Then Close(w_email_edit)

If ids_need_checkin_doc_list.modifiedcount( ) > 0 Then
	gnv_appeondb.of_autocommitrollback( )
	If ids_need_checkin_doc_list.Update() = 1 Then
		Commit;
		Return 1
	Else
		Rollback;
		Return -1
	End If
End If

Return 1
end function

public function string of_gen_email_content (long al_row);//////////////////////////////////////////////////////////////////////
// $<function>n_cst_email_checkinof_gen_email_content()
// $<arguments>
//		long	al_row		
// $<returns> string
// $<description>
// $<description> 
//////////////////////////////////////////////////////////////////////
// $<add> 2009-04-14 by Ken.Guo
//////////////////////////////////////////////////////////////////////


//Use Default Text Email Content.
String ls_mail_content,ls_url,ls_cache
Long ll_begin
Long ll_ctx_id
ll_ctx_id = ids_need_checkin_doc_list.GetItemNumber(al_row,'ctx_id')

ls_mail_content = &
'The following document has been uploaded by the external user, please click the following URL to check it in.' + &
'~r~n ' + &
'~r~n Document Name: ' + ids_need_checkin_doc_list.GetItemString(al_row,'file_name') + &
'~r~n Contract ID: ' + String(ll_ctx_id) + &
'~r~n Contract Company: ' + ids_need_checkin_doc_list.GetItemString(al_row,'company') + &
'~r~n Last Upload Time: ' + String(ids_need_checkin_doc_list.GetItemDateTime(al_row,'upload_time'),'MM/DD/YYYY HH:MM:SS') + &
'~r~n ' + &
'~r~n ' 

oleobject lole_doc
lole_doc = w_email_edit.ole_word.Object.ActiveDocument
lole_doc.Content.Select()
lole_doc.ActiveWindow.Selection.Text = ls_mail_content

ls_url = ids_need_checkin_doc_list.GetItemString(al_row,'ctx_link_name')
ll_begin = lole_doc.ActiveWindow.Selection.End
lole_doc.Range(ll_begin - 1, ll_begin).Select()	
lole_doc.ActiveWindow.Selection.Text = "Use the following URL to check in:~r~n "
ll_begin = lole_doc.ActiveWindow.Selection.End
lole_doc.Range(ll_begin - 1, ll_begin).Select()		
lole_doc.Hyperlinks.Add(lole_doc.ActiveWindow.Selection.Range,ls_url)


Return ls_mail_content
end function

public function integer of_send_email (string as_mail_sender, string as_mail_to, string as_mail_cc, string as_mail_bcc, string as_subject, u_email_edit aole_word, string as_attachment, boolean ab_autosign);

Integer 	li_ret
n_cst_easymail_smtp lnv_email_smtp

ab_autosign = False

if lnv_email_smtp.of_CreateObject() = -1 then
	Return -1
end if
li_ret = lnv_email_smtp.of_sendhtml( as_mail_sender,as_mail_to, as_mail_cc, as_mail_bcc, as_subject,aole_word , '',ab_autosign)

Return li_ret
end function

public function integer of_merge_email_content (long al_row, blob abob_message, ref string as_subject);//====================================================================
// Function: of_merge_email_content
//--------------------------------------------------------------------
// Description: merge email message.
//--------------------------------------------------------------------
// Arguments:
//                al_row
//                al_email_id
//                as_subject
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

If not isvalid(inv_word) Then
	inv_word = Create n_cst_word_utility
End If
If not isvalid(inv_trigger) Then
	inv_trigger = Create n_cst_workflow_triggers
End If

ll_ctx_id = ids_need_checkin_doc_list.GetItemNumber(al_row,'ctx_id')
ll_doc_id = ids_need_checkin_doc_list.GetItemNumber(al_row,'doc_id')
ls_url = ids_need_checkin_doc_list.GetItemString(al_row,'ctx_link_name')
ls_doc_name = ids_need_checkin_doc_list.GetItemString(al_row,'file_name')

//inv_trigger.of_Get_EmailMessage(al_email_id,lbob_Message)

If not isvalid(w_email_edit) Then
	Open(w_email_edit)
End If
w_email_edit.ole_word.of_Open(abob_Message)
gnv_webapprove.of_add_dm_link(w_email_edit.ole_word) //Added By Ken.Guo 2016-09-30
inv_word.of_set_web_values(ll_doc_id, ls_doc_name, ls_url, ls_url)
inv_word.of_replace_export_word(w_email_edit.ole_Word.Object.ActiveDocument, as_subject,ll_ctx_id, istr_email.export_id)

If w_email_edit.ole_Word.Object.doctype  <> 1 Then Return -1

Return  1

end function

public function integer of_send_mail (string as_sender, string as_to_user, string as_cc_user, string as_bcc_user, string as_subject, u_email_edit aole_word, string as_attachlist, boolean ab_autosign, long al_ctx_id, long al_doc_id, long al_ai_id);//====================================================================
// Function: of_send_mail
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//                as_sender
//                as_to_user
//                as_cc_user
//                as_bcc_user
//                as_subject
//                aole_word
//                as_attachlist
//                ab_autosign
//                al_ctx_id
//                al_doc_id
//                al_ai_id
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

String ls_errtext,ls_attachfilename,ls_columnname,ls_email_type,ls_computer_info
n_cst_string lnv_string
Long ll_Return,li_send_result
n_cst_easymail_smtp 	 lnv_Mail
str_email_info lstr_email_info

if lnv_Mail.of_CreateObject() = -1 then
	f_show_message('create Email object','','','','')
	Return -1
end if

//Send Email
ll_Return = lnv_Mail.of_SendHtml(as_sender, as_to_user, as_cc_user, as_bcc_user,as_subject, w_email_edit.ole_Word, as_attachlist,ab_autosign,al_ctx_id,al_doc_id,al_ai_id) 

if ll_Return <> 0 then
	gstr_email_info.ss_email_from =  'Notify Email for Check In'
	gstr_email_info.sl_ctx_id =al_ctx_id
	gstr_email_info.sl_wf_id = 0
	gstr_email_info.sl_doc_id = al_doc_id
	
	f_show_message('error_code_'+string(ll_Return),'%1S%',String(ll_Return),'','')
	gstr_email_info = lstr_email_info 
	li_send_result = -1
end if

//Email Audit

If ll_Return <> 0 then 
	ls_errtext = gnv_message.of_get_error_message( ll_Return)
End If
ls_attachfilename = lnv_string.of_get_file_name( as_attachlist, ',') 
ls_columnname = ''
ls_computer_info = lnv_Mail.of_get_compute_info( )
ls_email_type = is_email_type

Insert Into em_mail_audit
(user_id,mail_from,mail_to,mail_cc,mail_subject,mail_date,mail_attach_name,mail_template_id,ctx_id_list,doc_id_list,ai_id_list,wf_id,alarm_type,field_name,send_result,error_text,compute_info)
Values 
(:gs_user_id,:as_sender,:as_to_user,:as_cc_user,:as_subject,getdate(),:ls_attachfilename,:istr_email.id ,:al_ctx_id,:al_doc_id,:al_ai_id,0,:ls_email_type,:ls_columnname,:li_send_result,:ls_errtext,:ls_computer_info);

lnv_Mail.of_DeleteObject()

Return ll_Return


end function

on n_cst_email_checkin.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_email_checkin.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;ids_need_checkin_doc_list = Create n_ds
ids_need_checkin_doc_list.Dataobject = 'd_need_checkin_doc_list'
ids_need_checkin_doc_list.SetTransObject(SQLCA)


//Added By Ken.Guo 2016-08-24
If not isvalid(inv_word) Then
	inv_word = Create n_cst_word_utility
End If
If not isvalid(inv_trigger) Then
	inv_trigger = Create n_cst_workflow_triggers
End If
end event

event destructor;If Isvalid(ids_need_checkin_doc_list) Then Destroy ids_need_checkin_doc_list

//Added By Ken.Guo 2016-08-24
If isvalid(inv_word) Then Destroy inv_word
If isvalid(inv_trigger) Then Destroy inv_trigger


end event

