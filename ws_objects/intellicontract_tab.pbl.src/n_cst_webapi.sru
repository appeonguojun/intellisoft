$PBExportHeader$n_cst_webapi.sru
forward
global type n_cst_webapi from nonvisualobject
end type
end forward

global type n_cst_webapi from nonvisualobject autoinstantiate
end type

type prototypes
FUNCTION long SendRequest( string url, uint verb, string contentType, blob data, long datalength, ref blob response, ref  string errors, long timeout) Library "ContractlogixINET.dll" 

end prototypes

type variables
n_inet iinet_base
n_iresult iir_result
string is_webapi_url = ""
int ii_webapi_serverport = 80
string 	errorcode=""
Integer	ii_TimeOut = 30000

integer	ii_protocol
end variables

forward prototypes
public function string of_login (string as_username, string as_password, string as_cachename)
public function integer of_send_smtp (string as_accesstoken, string as_mailto[], string as_mailcc[], string as_mailbcc[], string as_subject, string as_message, string as_htmlfile, string as_attchment[], integer ai_flag, integer al_ctx_id, integer al_doc_id, integer al_action_item_id)
public function integer of_get_alarmemail_operation (string as_accesstoken, string as_servicename)
public function integer of_send (string as_accesstoken, string as_mailto[], string as_mailcc[], string as_mailbcc[], string as_subject, string as_message, string as_htmlfile, string as_attchment[], integer ai_flag, integer al_ctx_id, integer al_doc_id, integer al_action_item_id)
public function integer of_sendmail (string as_accesstoken, string as_mailto[], string as_mailcc[], string as_mailbcc[], string as_subject, string as_message, string as_htmlfile, string as_attchment[], string as_customheaderkey[], string as_customheadervalue[], str_email_account astr_mailserver)
public function string of_parsejson (string as_source, string as_key, string as_endkey)
public function string of_uploadfilecontent (string as_accesstoken, string as_filepath, blob ablb_filecontent)
public function integer of_send (string as_accesstoken, string as_mailto[], string as_mailcc[], string as_mailbcc[], string as_subject, string as_message, string as_htmlfile, ref blob ablb_docdata, string as_attchment[], integer ai_flag, integer al_ctx_id, integer al_doc_id, integer al_action_item_id)
public function integer of_sendmail (string as_accesstoken, string as_mailto[], string as_mailcc[], string as_mailbcc[], string as_subject, string as_message, string as_htmlfile, ref blob ablb_docdata, string as_attchment[], string as_customheaderkey[], string as_customheadervalue[], str_email_account astr_mailserver)
public function string of_writejson (string as_source, string as_key, any as_value[], string as_parent)
public function string of_convert_json_token ()
public function string of_sixbit2char (byte abt_b)
public function string of_getencodestring (string as_str)
public function integer of_alarmemail ()
public function integer of_getalarmemailstate (ref string as_total, ref string as_success, ref string as_failure, ref string as_error, ref string as_running)
public function integer of_logout ()
public function string of_getwebserviceurl ()
public function string of_convert_stru_action_item_json (str_action_item astr_action_item)
public function integer of_createworkflow (str_action_item as_action_item)
public function integer of_comparecreateworkflow (long al_view_id, long al_screen_id[], string as_updatecol[], long al_key_id, long al_facility_id, string as_module, string as_runtype, string as_triggertype)
public function integer of_setautoalarm (boolean ab_setauto, string as_user)
public function integer of_send (string as_accesstoken, string as_user, string as_mailto[], string as_mailcc[], string as_mailbcc[], string as_subject, string as_message, string as_htmlfile, string as_attchment[], integer ai_flag, integer al_ctx_id, integer al_doc_id, integer al_action_item_id)
public function integer of_postrequest (string as_url, blob abl_data, string as_header, integer ai_port, n_iresult an_result, integer ai_post, integer ai_timeout, string as_contenttype, long al_datalength)
public function integer of_alarmemailandworkflow ()
public subroutine of_setprotocol (integer ai_protocol)
public function long of_mergedocument (string as_accesstoken, string as_type, long al_docid, long ai_exportid, long al_ctxid, boolean ab_merged, str_doc_info astr_docinfo, ref string as_mergedfileid)
public function string of_uploadfile (string as_accesstoken, string as_filepath)
public function string of_savefiletodb (string as_accesstoken, string as_filepath, blob ablb_filecontent)
public function integer of_esign_refresh_token (string as_accesstoken, string as_user, ref string as_esign_access_token, ref string as_esign_refresh_token, ref string as_esign_token_date)
public function integer of_esign_get_agreement (string as_accesstoken, string as_esigntoken, string as_agreementid, ref tns__documentinformation astr_agreement)
public function integer of_esign_get_documents (string as_accesstoken, string as_esigntoken, string as_agreementid, ref str_esign_docinfo astr_docinfo)
public function integer of_to_bytearray (string as_source, string as_delimiter, ref byte abt_array[])
public function integer of_esign_delete_document (string as_accesstoken, string as_esigntoken, string as_agreementid)
public function string of_esign_download_document (string as_accesstoken, string as_esigntoken, string as_agreementid, string as_documentid, long al_doc_id)
public function integer of_esign_create_agreement (string as_accesstoken, string as_esigntoken, string as_recipient, string as_sign_type, string as_sign_flow, string as_message, string as_doc_id, string as_cc, ref string as_agreementid, ref string as_documentid, ref string as_result, string as_name)
public function integer of_setautoalarm (boolean ab_setauto, string as_user, string as_times)
public function string of_get_salesforce_objects (string as_user, string as_pwd, string as_oname, string as_url)
public function long of_outboundexternaldata (string as_user, string as_pwd, string as_externalyype, long al_ctx_id, long al_doc_id, long al_product_id, long al_product_type, long al_export_id, ref string as_salesforce_id, string as_sfurl, long al_facility_id, long al_contact_id)
end prototypes

public function string of_login (string as_username, string as_password, string as_cachename);string ls_uri = ""
string ls_header
long ll_length
string ls_args
blob lbl_args
string ls_action = "json/reply/Login"
ls_uri = is_webapi_url + ls_action
ls_args = '{"UserName":"' + as_username + '","Password":"' + as_password + '","CacheName":"' + as_cachename + '"}'
lbl_args = blob(ls_args,EncodingUTF8!)
ll_length = len(ls_args)
ls_header = "Content-Type: application/json" + "~n" + "Content-Length: " + string(ll_length) + "~n~n"
iinet_base.posturl(ls_uri,lbl_args,ls_header,ii_webapi_serverport,iir_result)

string ls_findt , ls_accesstoken
ls_findt = '"AccessToken":"'
long ll_findt , ll_finde , ll_findend
ll_findt = pos(lower(iir_result.is_result),lower(ls_findt))
if ll_findt > 0 then
	ll_findt = ll_findt + len(ls_findt) 
	ll_finde = pos(iir_result.is_result,'"',ll_findt + 1)
	if ll_finde > 0 then
		ls_accesstoken = mid(iir_result.is_result,ll_findt,ll_finde - ll_findt )
	else
		ls_accesstoken = ""
	end if
end if

return ls_accesstoken
end function

public function integer of_send_smtp (string as_accesstoken, string as_mailto[], string as_mailcc[], string as_mailbcc[], string as_subject, string as_message, string as_htmlfile, string as_attchment[], integer ai_flag, integer al_ctx_id, integer al_doc_id, integer al_action_item_id);
//====================================================================
// Function: of_send_smtp
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//                as_mailto[]
//                as_mailcc[]
//                as_mailbcc[]
//                as_subject
//                as_message
//                as_htmlfile
//                as_attchment[]
//                ai_flag
//                al_ctx_id
//                al_doc_id
//                al_action_item_id
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	Jimmy Lee		Date: 09/02/2013
//--------------------------------------------------------------------
//	Copyright (c) 2008-2012 Contract Logix,Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
long   ll_id
long   i, ll_Result = -1
string ls_MailTo
string ls_MailCc
string ls_MailBcc
string ls_Attachment,ls_attach_filename
string ls_Account
datastore lds_mail,lds_mail_attach
//n_cst_outlook lnv_Outlook
n_cst_easymail_smtp lnv_smtp
string ls_encoding ,ls_from //Added By Ken.Guo 2009-07-31.
Datetime ldt_sent
Blob lblb_attachment
Long ll_attach_id
String ls_unit
decimal ldec_filesize
n_cst_filesrv lnv_filesrv
String ls_doc,ls_ctx, ls_send_user

//Added By Mark Lee 10/15/12
//mailmessage lmsg_send
//mailReturnCode	mRet
//mailsession lms_mail

Long			ll_cunt


//lms_mail=create mailsession
//mRet = lms_mail.maillogon(mailNewSession!)
//if mRet <>mailreturnsuccess! then
//	messagebox('Contractlogix','log on email server failure!')
//end if

lnv_filesrv = Create n_cst_filesrv
//lnv_smtp = create n_cst_easymail_smtp

If al_ctx_id < 0 Then al_ctx_id = 0
If al_doc_id < 0 Then al_doc_id = 0
If al_action_item_id < 0 Then al_action_item_id = 0

lnv_smtp.of_set_global_var(al_ctx_id,al_doc_id,al_action_item_id)

if IsNull(as_Subject) then as_Subject = ""
if IsNull(as_Message) then as_Message = ""
if isnull(gs_accesstoken) or trim(gs_accesstoken) = '' then gs_accesstoken = of_convert_json_token( )
If  isnull(gs_accesstoken) or trim(gs_accesstoken) = '' then return -1
as_accesstoken = gs_accesstoken
// Add recipients
for i = 1 to UpperBound(as_MailTo[])
	/*
	if lnv_Outlook.of_LookupAccount(as_MailTo[i], ls_Account, 1) <> 0 then ls_Account = as_MailTo[i]  //jervis 08.09.2011
	//Begin - Added By Mark Lee 10/15/12
	ll_cunt++
	if pos(as_MailTo[i],'@')<=0 then
		lmsg_send.recipient[ll_cunt].address='SMTP:'+as_MailTo[i]
		lmsg_send.recipient[ll_cunt].name=as_MailTo[i]
	else
		lmsg_send.recipient[ll_cunt].address='SMTP:'+as_MailTo[i]
		lmsg_send.recipient[ll_cunt].name= left(as_MailTo[i],pos(as_MailTo[i],'@') - 1)
	end if
	lmsg_send.recipient[ll_cunt].recipienttype=mailto! 						
	//End - Added By Mark Lee 09/18/12
	*/
	if Len(ls_MailTo) > 0 then ls_MailTo += "; "
	ls_MailTo += as_MailTo[i]
next
for i = 1 to UpperBound(as_MailCc[])
	/*
	if lnv_Outlook.of_LookupAccount(as_MailCc[i], ls_Account, 1) <> 0 then ls_Account = as_MailCc[i]
	//Begin - Added By Mark Lee 09/18/12
	ll_cunt++
	if pos(as_MailCc[i],'@')<=0 then
		lmsg_send.recipient[ll_cunt].address='SMTP:'+as_MailCc[i]
		lmsg_send.recipient[ll_cunt].name=as_MailCc[i]
	else
		lmsg_send.recipient[ll_cunt].address='SMTP:'+as_MailCc[i]
		lmsg_send.recipient[ll_cunt].name= left(as_MailTo[i],pos(as_MailCc[i],'@') - 1)
	end if
	lmsg_send.recipient[ll_cunt].recipienttype=mailcc! 						
	//End - Added By Mark Lee 09/18/12
	*/
	if Len(ls_MailCc) > 0 then ls_MailCc += "; "
	ls_MailCc += as_MailCc[i]
next
for i = 1 to UpperBound(as_MailBcc[])
	/*
	if lnv_Outlook.of_LookupAccount(as_MailBcc[i], ls_Account, 1) <> 0 then ls_Account = as_MailBcc[i]
	//Begin - Added By Mark Lee 09/18/12
	ll_cunt++
	if pos(as_MailBcc[i],'@')<=0 then
		lmsg_send.recipient[ll_cunt].address='SMTP:'+as_MailBcc[i]
		lmsg_send.recipient[ll_cunt].name=as_MailBcc[i]
	else
		lmsg_send.recipient[ll_cunt].address='SMTP:'+as_MailBcc[i]
		lmsg_send.recipient[ll_cunt].name= left(as_MailTo[i],pos(as_MailBcc[i],'@') - 1)
	end if
	lmsg_send.recipient[ll_cunt].recipienttype=mailbcc! 						
	//End - Added By Mark Lee 09/18/12
	*/
	if Len(ls_MailBcc) > 0 then ls_MailBcc += "; "
	ls_MailBcc += as_MailBcc[i]
next

// Add attachments
string lsa_uploadfileid[]
string ls_fileid
ls_Attachment = ''
for i = 1 to UpperBound(as_Attchment[])
	//Begin - Added By Mark Lee 09/18/12
	//lmsg_send.attachmentfile[i].filetype=mailattach!
	//lmsg_send.attachmentfile[i].pathname=as_Attchment[i]	
	//End - Added By Mark Lee 09/18/12
	ls_fileid = of_uploadfile(gs_accesstoken,as_Attchment[i])
	lsa_uploadfileid[i] = ls_fileid
	if(ls_fileid = "") then
		return -3
	end if
	ldec_filesize = lnv_filesrv.of_genfilesize(FileLength(as_Attchment[i]), ls_unit)
	If ls_Attachment = '' Then
		ls_Attachment =  lnv_smtp.of_GetAttchmentName(as_Attchment[i]) + ' (' +String(ldec_filesize) + ls_unit +  ')'
	Else
		ls_Attachment += '; ' + lnv_smtp.of_GetAttchmentName(as_Attchment[i]) + ' (' +String(ldec_filesize) + ls_unit +  ')'
	End If

next
If isvalid(lnv_filesrv) Then Destroy lnv_filesrv

//Add CTX key word for receive.
If gnv_data.of_getItem("icred_settings", "email_tag_mode", False) = '1' And &
   gnv_data.of_getItem("icred_settings", "receive_email", False) = '1' Then	
		as_subject = lnv_smtp.of_add_keyword(as_subject, gstr_email_info.ss_ctx_id_list , gstr_email_info.ss_doc_id_list, gstr_email_info.ss_ai_id_list)
End If

str_email_account lstr_mailserver
//Added By Mark Lee 01/08/2014
ls_send_user = lnv_smtp.of_replace_send_user(gs_user_id)
lnv_smtp.of_getdefaultaccount(ls_send_user,lstr_mailserver)

// Send email
//lmsg_send.subject=as_Subject 				//Added By Mark Lee 09/17/12

Blob iblb_MailContent
if ai_Flag = 1 then
	//lmsg_send.notetext=as_Message			//Added By Mark Lee 09/17/12
	iblb_MailContent = Blob(as_Message) 	
end if

string ls_customheaderkey[],ls_customheadervalue[]
int mRet = -1
//Begin - Added By Mark Lee 10/12/12
mRet	=	this.of_sendmail(as_accesstoken,as_mailto,as_mailcc,as_mailbcc,as_subject,as_message,"",lsa_uploadfileid,ls_customheaderkey,ls_customheadervalue,lstr_mailserver)
if mRet<> 0 then
	ll_Result = mRet
	messagebox('Contractlogix','Sent email failure.'+'~r~n'+string(mRet))
else
	ll_Result = 0
	messagebox('Contractlogix','sent email success.')
end if
//End - Added By Mark Lee 10/12/12

// Insert sent item if send successful
if ll_Result = 0 then
	ldt_sent = DateTime(Today(), Now())
	//Begin - Added By Mark Lee 10/12/12
//	SELECT email_id 
//	INTO	:ls_from
//	FROM security_users  
//		WHERE user_id = :gs_user_id;	
	ls_from	= lstr_mailserver.as_emailaddress	//Added By Mark Lee 01/08/2014
	//End - Added By Mark Lee 10/12/12
	
	If Len(as_Subject) > 200 Then as_Subject = Mid(as_Subject, 1, 190) + '...'
	ls_ctx = gstr_email_info.ss_ctx_id_list 
	ls_doc = gstr_email_info.ss_doc_id_list 
	If Len(ls_ctx) > 990 Then 
		ls_ctx = Mid(ls_ctx, 1, 990) 
		ls_ctx = Mid(ls_ctx, 1 , LastPos(ls_ctx,',') - 1)
	End If
	If Len(ls_doc) > 990 Then 
		ls_doc = Mid(ls_doc, 1, 990) 
		ls_doc = Mid(ls_doc, 1 , LastPos(ls_doc,',') - 1)
	End If	
	
	lnv_smtp.ids_sent_msg.Reset()
	lnv_smtp.ids_sent_msg.InsertRow(0)
	lnv_smtp.ids_sent_msg.SetItem(1,'user_id',ls_send_user)
	lnv_smtp.ids_sent_msg.SetItem(1,'folder_id',3)
	lnv_smtp.ids_sent_msg.SetItem(1,'sub_folder_id',3)
	lnv_smtp.ids_sent_msg.SetItem(1,'mail_msg_id','')
	lnv_smtp.ids_sent_msg.SetItem(1,'mail_date',ldt_sent)
	lnv_smtp.ids_sent_msg.SetItem(1,'mail_subject',as_Subject)
	lnv_smtp.ids_sent_msg.SetItem(1,'mail_importance',0)
	lnv_smtp.ids_sent_msg.SetItem(1,'mail_from',ls_from)
	If Len(ls_MailTo) > 1990 Then ls_mailTo = Left(ls_MailTo, 1990) + '...' //Added By Ken.Guo 02/04/2013
	lnv_smtp.ids_sent_msg.SetItem(1,'mail_to',ls_MailTo)
	If Len(ls_MailCc) > 1990 Then ls_MailCc = Left(ls_MailCc, 1990) + '...' //Added By Ken.Guo 02/04/2013
	lnv_smtp.ids_sent_msg.SetItem(1,'mail_cc',ls_MailCc)
	lnv_smtp.ids_sent_msg.SetItem(1,'mail_attach_name',ls_Attachment)
	lnv_smtp.ids_sent_msg.SetItem(1,'mail_fromclx',1)
	lnv_smtp.ids_sent_msg.SetItem(1,'mail_save_format','txt') //Modified By Ken.Guo 10/26/2012. Modified 'doc' to 'txt'
	lnv_smtp.ids_sent_msg.SetItem(1,'read_status',1)
	lnv_smtp.ids_sent_msg.SetItem(1,'locked',0)
	lnv_smtp.ids_sent_msg.SetItem(1,'deleted',0)
	lnv_smtp.ids_sent_msg.SetItem(1,'flag',0)
	lnv_smtp.ids_sent_msg.SetItem(1,'last_modify_date',ldt_sent)
	
	lnv_smtp.ids_sent_msg.SetItem(1,'ctx_id_list', ls_ctx ) //Added By Ken.Guo 2010-08-16. For Group Email Alarm
	lnv_smtp.ids_sent_msg.SetItem(1,'doc_id_list', ls_doc ) //Added By Ken.Guo 2010-10-26. For multi-select document and email.
	lnv_smtp.ids_sent_msg.SetItem(1,'mail_action_item_id',al_action_item_id)
	
	//For checkin document in email item
	If Pos(gstr_email_info.ss_ctx_id_list,',') = 0 Then
		lnv_smtp.ids_sent_msg.SetItem(1,'mail_ctx_id',Long(gstr_email_info.ss_ctx_id_list))
	End If
	If Pos(gstr_email_info.ss_doc_id_list,',') = 0 Then
		lnv_smtp.ids_sent_msg.SetItem(1,'mail_doc_id',Long(gstr_email_info.ss_doc_id_list))
	End If	
	
	If lnv_smtp.ids_sent_msg.Update() <> 1 Then
		Messagebox('Error -101','Failed to save sent email to sent items.')
		//ids_sent_msg.Reset()
		Return -101
	End If
	ll_id = 	lnv_smtp.ids_sent_msg.GetItemNumber(1,'id')
	//Update Email Word File to DB
	If Len(iblb_MailContent) > 0 Then
		UPDATEBLOB em_mail_items SET mail_rfc822 = :iblb_MailContent WHERE id = :ll_id;
		If sqlca.sqlcode <> 0 Then
			Delete From em_mail_items Where id = :ll_id;
			Messagebox('Error -102','Failed to save sent email to sent items.')
			Return -102
		End If
	Elseif ai_Flag = 0 Then 
		Delete From em_mail_items Where id = :ll_id;
		Messagebox('Error -103','Failed to save sent email to sent items.')
		Return -103		
	End If
	
	If UpperBound(as_Attchment[]) > 0 Then
		lds_mail_attach = Create DataStore
		lds_mail_attach.DataObject = "d_em_mail_attach"
		lds_mail_attach.SetTransObject(SQLCA)	
		For i = 1 to UpperBound(as_Attchment[])
			If Not FileExists(as_Attchment[i]) Then Continue
			lnv_smtp.inv_dm_utils.of_readblob( as_Attchment[i], lblb_attachment)
			ls_attach_filename = Mid(as_Attchment[i],LastPos(as_Attchment[i],'\') + 1, Len(as_Attchment[i]))
			
			lds_mail_attach.Reset()
			lds_mail_attach.InsertRow(0)
			lds_mail_attach.SetItem(1,'mail_item_id',ll_id)
			lds_mail_attach.SetItem(1,'attachment_name',ls_attach_filename)
			lds_mail_attach.SetItem(1,'type','a') //a: attachment
			lds_mail_attach.SetItem(1,'last_modify_date',ldt_sent)
			If lds_mail_attach.Update() = 1 Then
				ll_attach_id = lds_mail_attach.GetItemNumber(1,'id')
				UpdateBlob em_mail_item_attachments Set image_file = :lblb_attachment Where id = :ll_attach_id;
				If SQLCA.sqlcode <> 0 Then
					Delete from em_mail_item_attachments where id = :ll_attach_id;
					lds_mail_attach.Reset()
					Messagebox('Error -104','Failed to save the attachment "'+as_Attchment[i]+'" to Email Sent Items.')
					Continue
				End If
			Else
				lds_mail_attach.Reset()
				
			End If
		Next	
		Destroy lds_mail_attach
	End If

	gs_CurAddresser = ""
end if

If isvalid(w_email_folder) Then
	w_email_folder.Dynamic Function of_add_sentitem(lnv_smtp.ids_sent_msg)
End If

//Added By Mark Lee 09/17/12
//lms_mail.maillogoff()
//destroy lms_mail

Return ll_Result

end function

public function integer of_get_alarmemail_operation (string as_accesstoken, string as_servicename);string ls_uri = ""
string ls_header
long ll_length
string ls_args
blob lbl_args
string ls_action = ""
ls_action = "json/reply/GetCurrentOperation"
//as_servicename = "alarmemail"

If  isnull(as_accesstoken) or trim(as_accesstoken) = '' then return -1

ls_args = "?AccessToken=" + as_accesstoken + "&Operation=" + as_servicename
ls_uri = is_webapi_url + ls_action + ls_args

//lbl_args = blob(ls_args,EncodingUTF8!)
//ll_length = len(ls_args)
//ls_header = "Content-Type: application/json" + "~n" + "Content-Length: " + string(ll_length) + "~n~n"
//iinet_base.posturl(ls_uri,lbl_args,ls_header,ii_webapi_serverport,iir_result)
of_postrequest( ls_uri,lbl_args,ls_header,ii_webapi_serverport,iir_result, 0,ii_TimeOut,"",ll_length )//modified by gavins 20140611
//iinet_base.geturl(ls_uri,iir_result)
string ls_statuscode = "1"
string ls_findt 
ls_findt = '"ErrorCode":'
long ll_findt , ll_finde , ll_findend
ll_findt = pos(iir_result.is_result,ls_findt)
if ll_findt > 0 then
	ll_findt = ll_findt + len(ls_findt) 
	ll_finde = pos(iir_result.is_result,',',ll_findt + 1)
	if ll_finde > 0 then
		ls_statuscode = mid(iir_result.is_result,ll_findt,ll_finde - ll_findt )
	else
		ls_statuscode = "-1"
	end if
end if
//gnv_status_info.of_display( "alert email status code is " + ls_statuscode + "" )
return Integer(ls_statuscode)
end function

public function integer of_send (string as_accesstoken, string as_mailto[], string as_mailcc[], string as_mailbcc[], string as_subject, string as_message, string as_htmlfile, string as_attchment[], integer ai_flag, integer al_ctx_id, integer al_doc_id, integer al_action_item_id);//Added By Mark 05/07/2014
Return	of_send(as_accesstoken,"",as_mailto,as_mailcc,as_mailbcc,as_subject,as_message,as_htmlfile,as_attchment,ai_flag,al_ctx_id,al_doc_id,al_action_item_id)

//long   ll_id
//long   i, ll_Result = -1
//string ls_MailTo
//string ls_MailCc
//string ls_MailBcc
//string ls_Attachment,ls_attach_filename
//string ls_Account
//datastore lds_mail,lds_mail_attach
////n_cst_outlook lnv_Outlook
//n_cst_easymail_smtp lnv_smtp
//string ls_encoding ,ls_from //Added By Ken.Guo 2009-07-31.
//Datetime ldt_sent
//Blob lblb_attachment
//Long ll_attach_id
//String ls_unit
//decimal ldec_filesize
//n_cst_filesrv lnv_filesrv
//String ls_doc,ls_ctx, ls_send_user
//
//lnv_filesrv = Create n_cst_filesrv
//
//If al_ctx_id < 0 Then al_ctx_id = 0
//If al_doc_id < 0 Then al_doc_id = 0
//If al_action_item_id < 0 Then al_action_item_id = 0
//
//lnv_smtp.of_set_global_var(al_ctx_id,al_doc_id,al_action_item_id)
//
//if IsNull(as_Subject) then as_Subject = ""
//if IsNull(as_Message) then as_Message = ""
//
//if isnull(gs_accesstoken) or trim(gs_accesstoken) = '' then gs_accesstoken = of_convert_json_token( )
//If  isnull(gs_accesstoken) or trim(gs_accesstoken) = '' then return -1
//as_accesstoken= gs_accesstoken
//// Add recipients
//for i = 1 to UpperBound(as_MailTo[])
//	/*
//	if lnv_Outlook.of_LookupAccount(as_MailTo[i], ls_Account, 1) <> 0 then ls_Account = as_MailTo[i]  //jervis 08.09.2011
//	//Begin - Added By Mark Lee 10/15/12
//	ll_cunt++
//	if pos(as_MailTo[i],'@')<=0 then
//		lmsg_send.recipient[ll_cunt].address='SMTP:'+as_MailTo[i]
//		lmsg_send.recipient[ll_cunt].name=as_MailTo[i]
//	else
//		lmsg_send.recipient[ll_cunt].address='SMTP:'+as_MailTo[i]
//		lmsg_send.recipient[ll_cunt].name= left(as_MailTo[i],pos(as_MailTo[i],'@') - 1)
//	end if
//	lmsg_send.recipient[ll_cunt].recipienttype=mailto! 						
//	//End - Added By Mark Lee 09/18/12
//	*/
//	if Len(ls_MailTo) > 0 then ls_MailTo += "; "
//	ls_MailTo += as_MailTo[i]
//next
//for i = 1 to UpperBound(as_MailCc[])
//	/*
//	if lnv_Outlook.of_LookupAccount(as_MailCc[i], ls_Account, 1) <> 0 then ls_Account = as_MailCc[i]
//	//Begin - Added By Mark Lee 09/18/12
//	ll_cunt++
//	if pos(as_MailCc[i],'@')<=0 then
//		lmsg_send.recipient[ll_cunt].address='SMTP:'+as_MailCc[i]
//		lmsg_send.recipient[ll_cunt].name=as_MailCc[i]
//	else
//		lmsg_send.recipient[ll_cunt].address='SMTP:'+as_MailCc[i]
//		lmsg_send.recipient[ll_cunt].name= left(as_MailTo[i],pos(as_MailCc[i],'@') - 1)
//	end if
//	lmsg_send.recipient[ll_cunt].recipienttype=mailcc! 						
//	//End - Added By Mark Lee 09/18/12
//	*/
//	if Len(ls_MailCc) > 0 then ls_MailCc += "; "
//	ls_MailCc += as_MailCc[i]
//next
//for i = 1 to UpperBound(as_MailBcc[])
//	/*
//	if lnv_Outlook.of_LookupAccount(as_MailBcc[i], ls_Account, 1) <> 0 then ls_Account = as_MailBcc[i]
//	//Begin - Added By Mark Lee 09/18/12
//	ll_cunt++
//	if pos(as_MailBcc[i],'@')<=0 then
//		lmsg_send.recipient[ll_cunt].address='SMTP:'+as_MailBcc[i]
//		lmsg_send.recipient[ll_cunt].name=as_MailBcc[i]
//	else
//		lmsg_send.recipient[ll_cunt].address='SMTP:'+as_MailBcc[i]
//		lmsg_send.recipient[ll_cunt].name= left(as_MailTo[i],pos(as_MailBcc[i],'@') - 1)
//	end if
//	lmsg_send.recipient[ll_cunt].recipienttype=mailbcc! 						
//	//End - Added By Mark Lee 09/18/12
//	*/
//	if Len(ls_MailBcc) > 0 then ls_MailBcc += "; "
//	ls_MailBcc += as_MailBcc[i]
//next
//
//// Add attachments
//string lsa_uploadfileid[]
//string ls_fileid
//ls_Attachment = ''
//for i = 1 to UpperBound(as_Attchment[])
//	//Begin - Added By Mark Lee 09/18/12
//	//lmsg_send.attachmentfile[i].filetype=mailattach!
//	//lmsg_send.attachmentfile[i].pathname=as_Attchment[i]	
//	//End - Added By Mark Lee 09/18/12
//	ls_fileid = of_uploadfile(gs_accesstoken,as_Attchment[i])
//	lsa_uploadfileid[i] = ls_fileid
//	if(ls_fileid = "") then
//		return -3
//	end if
//	ldec_filesize = lnv_filesrv.of_genfilesize(FileLength(as_Attchment[i]), ls_unit)
//	If ls_Attachment = '' Then
//		ls_Attachment =  lnv_smtp.of_GetAttchmentName(as_Attchment[i]) + ' (' +String(ldec_filesize) + ls_unit +  ')'
//	Else
//		ls_Attachment += '; ' + lnv_smtp.of_GetAttchmentName(as_Attchment[i]) + ' (' +String(ldec_filesize) + ls_unit +  ')'
//	End If
//
//next
//If isvalid(lnv_filesrv) Then Destroy lnv_filesrv
//
////Add CTX key word for receive.
//If gnv_data.of_getItem("icred_settings", "email_tag_mode", False) = '1' And &
//   gnv_data.of_getItem("icred_settings", "receive_email", False) = '1' Then	
//		as_subject = lnv_smtp.of_add_keyword(as_subject, gstr_email_info.ss_ctx_id_list , gstr_email_info.ss_doc_id_list, gstr_email_info.ss_ai_id_list)
//End If
//
//str_email_account lstr_mailserver
//ls_send_user = lnv_smtp.of_replace_send_user(gs_user_id)				//Added By Mark Lee 01/08/2014
//lnv_smtp.of_getdefaultaccount(ls_send_user,lstr_mailserver)
//
//// Send email
////lmsg_send.subject=as_Subject 				//Added By Mark Lee 09/17/12
//int mRet = -1
//blob iblb_MailContent
//string ls_customheaderkey[],ls_customheadervalue[]
//ls_customheaderkey[1] = 'X-FromContractLogix'
//ls_customheaderkey[2] = 'X-ContractID'
//ls_customheaderkey[3] = 'X-DocumentID'
//ls_customheaderkey[4] = 'X-ActionItemID'
//
//ls_customheadervalue[1] = 'Yes'
//ls_customheadervalue[2] = 'N/A'
//ls_customheadervalue[3] = 'N/A'
//ls_customheadervalue[4] = 'N/A'
//
//If gstr_email_info.ss_ctx_id_list <> '' Then
//	ls_customheadervalue[2] = gstr_email_info.ss_ctx_id_list
//end if
//If gstr_email_info.ss_doc_id_list  <> '' Then
//	ls_customheadervalue[3] = gstr_email_info.ss_doc_id_list 
//end if
//If gstr_email_info.ss_ai_id_list  <> '' Then
//	ls_customheadervalue[4] = gstr_email_info.ss_ai_id_list 
//end if
//
//if ai_Flag = 1 then
//	//send text
//	iblb_MailContent = blob(as_message)
//	mRet	=	this.of_sendmail(as_accesstoken,as_mailto,as_mailcc,as_mailbcc,as_subject,as_message,"",lsa_uploadfileid,ls_customheaderkey,ls_customheadervalue,lstr_mailserver)
//else
//	//send html
//	mRet	=	this.of_sendmail(as_accesstoken,as_mailto,as_mailcc,as_mailbcc,as_subject,"",as_htmlfile,lsa_uploadfileid,ls_customheaderkey,ls_customheadervalue,lstr_mailserver)
//end if
//
//If gnv_data.of_getitem('icred_settings', 'set_10', False) = '1' Then 
//	lnv_smtp.of_setlog()
//End If
////Begin - Added By Mark Lee 10/12/12
//
//if mRet<> 0 then
//	ll_Result = mRet
//	//messagebox('Contractlogix','Sent email failure.'+'~r~n'+string(mRet))
//else
//	ll_Result = 0
//	//messagebox('Contractlogix','sent email success.')
//end if
////End - Added By Mark Lee 10/12/12
//
//// Insert sent item if send successful
//if ll_Result = 0 then
//	ldt_sent = DateTime(Today(), Now())
//	//Begin - Added By Mark Lee 10/12/12
////	SELECT email_id 
////	INTO	:ls_from
////	FROM security_users  
////		WHERE user_id = :gs_user_id;	
//	ls_from	= lstr_mailserver.as_emailaddress		//Added By Mark Lee 01/08/2014
//	//End - Added By Mark Lee 10/12/12
//	
//	If Len(as_Subject) > 200 Then as_Subject = Mid(as_Subject, 1, 190) + '...'
//	ls_ctx = gstr_email_info.ss_ctx_id_list 
//	ls_doc = gstr_email_info.ss_doc_id_list 
//	If Len(ls_ctx) > 990 Then 
//		ls_ctx = Mid(ls_ctx, 1, 990) 
//		ls_ctx = Mid(ls_ctx, 1 , LastPos(ls_ctx,',') - 1)
//	End If
//	If Len(ls_doc) > 990 Then 
//		ls_doc = Mid(ls_doc, 1, 990) 
//		ls_doc = Mid(ls_doc, 1 , LastPos(ls_doc,',') - 1)
//	End If	
//	
//	lnv_smtp.ids_sent_msg.Reset()
//	lnv_smtp.ids_sent_msg.InsertRow(0)
//	lnv_smtp.ids_sent_msg.SetItem(1,'user_id',ls_send_user)
//	lnv_smtp.ids_sent_msg.SetItem(1,'folder_id',3)
//	lnv_smtp.ids_sent_msg.SetItem(1,'sub_folder_id',3)
//	lnv_smtp.ids_sent_msg.SetItem(1,'mail_msg_id','')
//	lnv_smtp.ids_sent_msg.SetItem(1,'mail_date',ldt_sent)
//	lnv_smtp.ids_sent_msg.SetItem(1,'mail_subject',as_Subject)
//	lnv_smtp.ids_sent_msg.SetItem(1,'mail_importance',0)
//	lnv_smtp.ids_sent_msg.SetItem(1,'mail_from',ls_from)
//	If Len(ls_MailTo) > 1990 Then ls_mailTo = Left(ls_MailTo, 1990) + '...' //Added By Ken.Guo 02/04/2013
//	lnv_smtp.ids_sent_msg.SetItem(1,'mail_to',ls_MailTo)
//	If Len(ls_MailCc) > 1990 Then ls_MailCc = Left(ls_MailCc, 1990) + '...' //Added By Ken.Guo 02/04/2013
//	lnv_smtp.ids_sent_msg.SetItem(1,'mail_cc',ls_MailCc)
//	lnv_smtp.ids_sent_msg.SetItem(1,'mail_attach_name',ls_Attachment)
//	lnv_smtp.ids_sent_msg.SetItem(1,'mail_fromclx',1)
//	lnv_smtp.ids_sent_msg.SetItem(1,'mail_save_format','txt') //Modified By Ken.Guo 10/26/2012. Modified 'doc' to 'txt'
//	lnv_smtp.ids_sent_msg.SetItem(1,'read_status',1)
//	lnv_smtp.ids_sent_msg.SetItem(1,'locked',0)
//	lnv_smtp.ids_sent_msg.SetItem(1,'deleted',0)
//	lnv_smtp.ids_sent_msg.SetItem(1,'flag',0)
//	lnv_smtp.ids_sent_msg.SetItem(1,'last_modify_date',ldt_sent)
//	
//	lnv_smtp.ids_sent_msg.SetItem(1,'ctx_id_list', ls_ctx ) //Added By Ken.Guo 2010-08-16. For Group Email Alarm
//	lnv_smtp.ids_sent_msg.SetItem(1,'doc_id_list', ls_doc ) //Added By Ken.Guo 2010-10-26. For multi-select document and email.
//	lnv_smtp.ids_sent_msg.SetItem(1,'mail_action_item_id',al_action_item_id)
//	
//	//For checkin document in email item
//	If Pos(gstr_email_info.ss_ctx_id_list,',') = 0 Then
//		lnv_smtp.ids_sent_msg.SetItem(1,'mail_ctx_id',Long(gstr_email_info.ss_ctx_id_list))
//	End If
//	If Pos(gstr_email_info.ss_doc_id_list,',') = 0 Then
//		lnv_smtp.ids_sent_msg.SetItem(1,'mail_doc_id',Long(gstr_email_info.ss_doc_id_list))
//	End If	
//	
//	If lnv_smtp.ids_sent_msg.Update() <> 1 Then
//		Messagebox('Error -101','Failed to save sent email to sent items.')
//		//ids_sent_msg.Reset()
//		Return -101
//	End If
//	ll_id = 	lnv_smtp.ids_sent_msg.GetItemNumber(1,'id')
//	//Update Email Word File to DB
//	If Len(iblb_MailContent) > 0 Then
//		UPDATEBLOB em_mail_items SET mail_rfc822 = :iblb_MailContent WHERE id = :ll_id;
//		If sqlca.sqlcode <> 0 Then
//			Delete From em_mail_items Where id = :ll_id;
//			Messagebox('Error -102','Failed to save sent email to sent items.')
//			Return -102
//		End If
//	Elseif ai_Flag = 0 Then 
//		Delete From em_mail_items Where id = :ll_id;
//		Messagebox('Error -103','Failed to save sent email to sent items.')
//		Return -103		
//	End If
//	
//	If UpperBound(as_Attchment[]) > 0 Then
//		lds_mail_attach = Create DataStore
//		lds_mail_attach.DataObject = "d_em_mail_attach"
//		lds_mail_attach.SetTransObject(SQLCA)	
//		For i = 1 to UpperBound(as_Attchment[])
//			If Not FileExists(as_Attchment[i]) Then Continue
//			lnv_smtp.inv_dm_utils.of_readblob( as_Attchment[i], lblb_attachment)
//			ls_attach_filename = Mid(as_Attchment[i],LastPos(as_Attchment[i],'\') + 1, Len(as_Attchment[i]))
//			
//			lds_mail_attach.Reset()
//			lds_mail_attach.InsertRow(0)
//			lds_mail_attach.SetItem(1,'mail_item_id',ll_id)
//			lds_mail_attach.SetItem(1,'attachment_name',ls_attach_filename)
//			lds_mail_attach.SetItem(1,'type','a') //a: attachment
//			lds_mail_attach.SetItem(1,'last_modify_date',ldt_sent)
//			If lds_mail_attach.Update() = 1 Then
//				ll_attach_id = lds_mail_attach.GetItemNumber(1,'id')
//				UpdateBlob em_mail_item_attachments Set image_file = :lblb_attachment Where id = :ll_attach_id;
//				If SQLCA.sqlcode <> 0 Then
//					Delete from em_mail_item_attachments where id = :ll_attach_id;
//					lds_mail_attach.Reset()
//					Messagebox('Error -104','Failed to save the attachment "'+as_Attchment[i]+'" to Email Sent Items.')
//					Continue
//				End If
//			Else
//				lds_mail_attach.Reset()
//				
//			End If
//		Next	
//		Destroy lds_mail_attach
//	End If
//
//	gs_CurAddresser = ""
//end if
//
//If isvalid(w_email_folder) Then
//	w_email_folder.Dynamic Function of_add_sentitem(lnv_smtp.ids_sent_msg)
//End If
//
////Added By Mark Lee 09/17/12
////lms_mail.maillogoff()
////destroy lms_mail
//
//Return ll_Result
//
end function

public function integer of_sendmail (string as_accesstoken, string as_mailto[], string as_mailcc[], string as_mailbcc[], string as_subject, string as_message, string as_htmlfile, string as_attchment[], string as_customheaderkey[], string as_customheadervalue[], str_email_account astr_mailserver);/*
{
"AccessToken":"String",

"MailData":{"MailFrom":"String","MailTo":["String"],"MailCC":["String"],"MailBCC":["String"],"Encoding":"String","Subject":"String",
"HtmlBody":"String","TextBody":"String","SendHtml":false,"AttachmentID":["String"],
"CustomHeaderKey":["String"],"CustomHeaderValue":["String"],"HtmlImportFileName":"String","HtmlImportFileId":"String"},

"MailServer":{"Server":"String","Port":0,"Protocol":0,"User":"String","Password":"String","NeedAuth":false,"UseSSL":false}
}
*/

string ls_uri = ""
string ls_header
long ll_length
string ls_args
blob lbl_args
string ls_action = ""
string ls_accesstoken

string ls_maildata , ls_mailserver
string ls_mailfrom,ls_mailto,ls_mailcc,ls_mailbcc,ls_encoding,ls_subject,ls_htmlbody,ls_textbody
boolean lb_sendhtml
string ls_attachmentid,ls_customheaderkey,ls_CustomHeaderValue
string ls_HtmlImportFileName,ls_HtmlImportFileId

string ls_server
int li_port,li_protocol
string ls_user, ls_password
boolean lb_needauth,lb_usessl
string ls_from
int i, li_loop , ll_Result


if isnull(gs_accesstoken) or trim(gs_accesstoken) = '' then gs_accesstoken = of_convert_json_token( )
If  isnull(gs_accesstoken) or trim(gs_accesstoken) = '' then return -1
ls_accesstoken = gs_accesstoken

//Added By Mark 05/07/2014
//SELECT email_id 
//INTO	:ls_mailfrom
//FROM security_users  
//   WHERE user_id = :gs_user_id;
ls_mailfrom = astr_mailserver.as_emailaddress
	
ls_MailTo = ""	
for i = 1 to UpperBound(as_MailTo)
	if Len(ls_MailTo) > 0 then ls_MailTo += '","'
	ls_MailTo += as_MailTo[i]
next

ls_mailcc = ""	
for i = 1 to UpperBound(as_MailCC)
	if Len(ls_mailcc) > 0 then ls_mailcc += '","'
	ls_mailcc += as_MailCC[i]
next

ls_mailbcc = ""	
for i = 1 to UpperBound(as_Mailbcc)
	if Len(ls_mailbcc) > 0 then ls_mailbcc += '","'
	ls_mailbcc += as_MailBcc[i]
next

ls_encoding = "UTF-8"
ls_subject = as_subject
ls_htmlbody = as_htmlfile
if pos(ls_htmlbody,'\') > 0 then 
	ls_htmlbody = gnv_string.of_globalreplace( ls_htmlbody, '\', '\\' )
end if 
ls_textbody = as_message
string ls_htmlfileid = ""
ls_HtmlImportFileId = ""
if len(ls_htmlbody) <= 0 then 
	lb_sendhtml = false
else
	lb_sendhtml = true
	ls_htmlfileid = of_uploadfile(as_accesstoken,ls_htmlbody)
	//ls_htmlfileid = of_uploadfilecontent(as_accesstoken,ls_htmlbody)
	ls_HtmlImportFileId = ls_htmlfileid
end if

ls_attachmentid = ""
for i = 1 to UpperBound(as_attchment)
	if Len(ls_attachmentid) > 0 then ls_attachmentid += '","'
	ls_attachmentid += as_attchment[i]
next

ls_customheaderkey = ""
ls_CustomHeaderValue = ""

for i = 1 to UpperBound(as_customheaderkey)
	if Len(ls_customheaderkey) > 0 then ls_customheaderkey += '","'
	ls_customheaderkey += as_customheaderkey[i]
next

for i = 1 to UpperBound(as_customheadervalue)
	if Len(ls_CustomHeaderValue) > 0 then ls_CustomHeaderValue += '","'
	ls_CustomHeaderValue += as_customheadervalue[i]
next

ls_HtmlImportFileName = ""

//Added By Jay Chen 02-05-2015 replace " as \"
if pos(ls_subject,'"') > 0 then 
	ls_subject = gnv_string.of_globalreplace( ls_subject, '"', '\"' )
end if 
if pos(ls_htmlbody,'"') > 0 then
	ls_htmlbody = gnv_string.of_globalreplace( ls_htmlbody, '"', '\"' )
end if
if  pos(ls_textbody,'"') > 0 then
	ls_textbody = gnv_string.of_globalreplace( ls_textbody, '"', '\"' )
end if
//end

ls_maildata = '{"MailFrom":"' + ls_mailfrom + '","MailTo":["' + ls_mailto + '"],"MailCC":["' + ls_mailcc + '"],"MailBCC":["' + ls_mailbcc +'"],'
ls_maildata = ls_maildata + '"Encoding":"' + ls_encoding + '","Subject":"' + ls_subject + '","HtmlBody":"' + ls_htmlbody + '","TextBody":"' + ls_textbody 
ls_maildata = ls_maildata + '","SendHtml":' + string(lb_sendhtml) + ',"AttachmentID":["' + ls_attachmentid + '"],'
ls_maildata = ls_maildata + '"CustomHeaderKey":["' + ls_customheaderkey + '"],"CustomHeaderValue":["' + ls_CustomHeaderValue + '"],"HtmlImportFileName":"' + ls_HtmlImportFileName + '","HtmlImportFileId":"' + ls_HtmlImportFileId + '"}'

if isvalid(astr_mailserver ) then
	if astr_mailserver.ai_sendauthmode = 1 then
		lb_needauth = true
	else
		lb_needauth = false
	end if
	ls_server = astr_mailserver.as_sendserver
	li_port = Integer(astr_mailserver.al_sendport)
	
	if upper(astr_mailserver.as_sendprotocol) = "SMTP" then
		li_protocol = 0
	else
		li_protocol = ii_protocol
	end if
	if astr_mailserver.ai_sendssl = 0 then
		lb_usessl = false
	else
		lb_usessl = true 
	end if

	n_cst_string ln_string

	ls_user =  ln_string.of_globalreplace( astr_mailserver.as_account, '\', '\\') 

	ls_password = astr_mailserver.as_password
	
end if

ls_mailserver = '{"Server":"' + ls_server + '","Port":' + string(li_port) + ',"Protocol":' + string(li_protocol) 
ls_mailserver = ls_mailserver + ',"User":"' + ls_user + '","Password":"' + ls_password + '","NeedAuth":' + string(lb_needauth) + ',"UseSSL":' + string(lb_usessl) +',"AuthType":' + string( astr_mailserver.ai_SendAuthMode_Exchange )+ '}'

ls_action = "json/reply/SendMail"
ls_uri = is_webapi_url + ls_action
ls_args = '{"AccessToken":"' + ls_accesstoken + '","MailData":' + ls_maildata + ',"MailServer":' + ls_mailserver + '}'
lbl_args = blob(ls_args,EncodingUTF8!)
ll_length = len(ls_args)
ls_header = "Content-Type: application/json" + "~n" + "Content-Length: " + string(ll_length) + "~n~n"
//iinet_base.posturl(ls_uri,lbl_args,ls_header,ii_webapi_serverport,iir_result)
 of_postrequest( ls_uri,lbl_args,ls_header,ii_webapi_serverport,iir_result, 1,ii_TimeOut,"",ll_length)//modified by gavins 20140611

string ls_statuscode = "1" //modified by gavins 20140421 change statuscode to errorcode 
string ls_findt 
ls_findt = '"ErrorCode":'
long ll_findt , ll_finde , ll_findend
ll_findt = pos(lower(iir_result.is_result),lower(ls_findt))

if ll_findt > 0 then
	ll_findt = ll_findt + len(ls_findt) 
	ll_finde = pos(iir_result.is_result,',',ll_findt + 1)
	if ll_finde > 0 then

		ls_statuscode = mid(iir_result.is_result,ll_findt,ll_finde - ll_findt )
	else
		ls_statuscode = "-1"
	end if
end if
if left( ls_statuscode, 1 ) = '"' Then ls_statuscode = mid( ls_statuscode, 2 )
if right( ls_statuscode, 1 ) = '"' Then ls_statuscode = left( ls_statuscode, len( ls_statuscode ) - 1 )
if ls_statuscode = '"-1"' then ls_statuscode = "-1" //Added By Jay Chen 04-22-2014
If Long ( ls_statuscode )  < 0 Then return -100
return Long(ls_statuscode)




end function

public function string of_parsejson (string as_source, string as_key, string as_endkey);string ls_return = ""
string ls_findt 
ls_findt = as_key
long ll_findt , ll_finde,  ll_finde2, ll_findend
ll_findt = pos(lower(as_source),lower(ls_findt) )
if ll_findt > 0 then
	ll_findt = ll_findt + len(ls_findt) 
	ll_finde = pos(as_source,as_endkey,ll_findt + 1)
	if ll_finde > 0 then
		ls_return = mid(as_source,ll_findt,ll_finde - ll_findt )
	else
		ls_return = ""
	end if
end if

return ls_return

end function

public function string of_uploadfilecontent (string as_accesstoken, string as_filepath, blob ablb_filecontent);string ls_uri = ""
string ls_action = ""
integer li_fnum
long li_bytes
blob lbl_filedata , lblb_arg
string ls_boundary 
string ls_args
string ls_shortname
string  sFind
long  llStart, llEnd
long ll_length
string ls_header
ls_action =  "json/reply/Upload"
ls_uri = is_webapi_url + ls_action

sFind = '\'
llStart = lastpos(as_filepath,'\')
if llStart > 0 then
	ls_shortname = Mid(as_filepath, (llStart + 1), (len(as_filepath) + 1 - llStart))
else
	ls_shortname = as_filepath
end if
if isnull(gs_accesstoken) or trim(gs_accesstoken) = '' then gs_accesstoken = of_convert_json_token( )
as_accesstoken = gs_accesstoken

//Modified by gavin 20151217   direct update to db
//return of_savefiletodb ( as_accesstoken, as_filepath, lbl_filedata )


//li_fnum = FileOpen(as_filepath, StreamMode!)
//li_bytes = FileReadEX(li_fnum, lbl_filedata)
lbl_filedata = ablb_filecontent

FileClose(li_fnum)
ls_boundary = "----------------------------" + string(cpu())
ls_args = "--" + ls_boundary + "~r~n" + &
			 "Content-Disposition: form-data; name=~"AccessToken~"~r~n" + &
			 "~r~n" + as_accesstoken + "~r~n" + &
			 "--" + ls_boundary + "~r~n" + &
			 "Content-Disposition: form-data; name=~"file~"; filename=~"" + ls_shortname + "~"~r~n" + &
			 "Content-Type: application/octet-stream~r~n~r~n"
			 
lblb_arg = blob(ls_args,EncodingUTF8!) + lbl_filedata + blob("~r~n--" + ls_boundary + "~r~n--",EncodingUTF8!)		

ll_length = len(lblb_arg)

ls_header = "Content-Type: multipart/form-data; boundary=" + ls_boundary + "~r~n" + &
					"Content-Length: " + string(ll_length) + "~r~n~r~n"

//iinet_base.posturl(ls_uri,lblb_arg,ls_header,ii_webapi_serverport, iir_result)
of_postrequest( ls_uri,lblb_arg,ls_header,ii_webapi_serverport,iir_result, 1,ii_TimeOut,"Content-Type: multipart/form-data; boundary=" + ls_boundary +  "~r~n",ll_length )//modified by gavins 20140611

//return iir_result.is_result 

string ls_findt 
string ls_uploadfileid = ""
ls_findt = '"AttachmentId":["'
long ll_findt , ll_finde , ll_findend
ll_findt = pos(lower(iir_result.is_result),lower(ls_findt))
if ll_findt > 0 then
	ll_findt = ll_findt + len(ls_findt) 
	ll_finde = pos(iir_result.is_result,'"',ll_findt + 1)
	if ll_finde > 0 then
		ls_uploadfileid = mid(iir_result.is_result,ll_findt,ll_finde - ll_findt )
	else
		ls_uploadfileid = ""
	end if
end if

return ls_uploadfileid
end function

public function integer of_send (string as_accesstoken, string as_mailto[], string as_mailcc[], string as_mailbcc[], string as_subject, string as_message, string as_htmlfile, ref blob ablb_docdata, string as_attchment[], integer ai_flag, integer al_ctx_id, integer al_doc_id, integer al_action_item_id);
long   ll_id
long   i, ll_Result = -1
string ls_MailTo
string ls_MailCc
string ls_MailBcc
string ls_Attachment,ls_attach_filename
string ls_Account
datastore lds_mail,lds_mail_attach
//n_cst_outlook lnv_Outlook
n_cst_easymail_smtp lnv_smtp
string ls_encoding ,ls_from //Added By Ken.Guo 2009-07-31.
Datetime ldt_sent
Blob lblb_attachment
Long ll_attach_id
String ls_unit
decimal ldec_filesize
n_cst_filesrv lnv_filesrv
String ls_doc,ls_ctx, ls_send_user

lnv_filesrv = Create n_cst_filesrv

If al_ctx_id < 0 Then al_ctx_id = 0
If al_doc_id < 0 Then al_doc_id = 0
If al_action_item_id < 0 Then al_action_item_id = 0

lnv_smtp.of_set_global_var(al_ctx_id,al_doc_id,al_action_item_id)

if IsNull(as_Subject) then as_Subject = ""
if IsNull(as_Message) then as_Message = ""

if isnull(gs_accesstoken) or trim(gs_accesstoken) = '' then gs_accesstoken = of_convert_json_token( )
If  isnull(gs_accesstoken) or trim(gs_accesstoken) = '' then return -1


as_accesstoken = gs_accesstoken
// Add recipients
for i = 1 to UpperBound(as_MailTo[])
	/*
	if lnv_Outlook.of_LookupAccount(as_MailTo[i], ls_Account, 1) <> 0 then ls_Account = as_MailTo[i]  //jervis 08.09.2011
	//Begin - Added By Mark Lee 10/15/12
	ll_cunt++
	if pos(as_MailTo[i],'@')<=0 then
		lmsg_send.recipient[ll_cunt].address='SMTP:'+as_MailTo[i]
		lmsg_send.recipient[ll_cunt].name=as_MailTo[i]
	else
		lmsg_send.recipient[ll_cunt].address='SMTP:'+as_MailTo[i]
		lmsg_send.recipient[ll_cunt].name= left(as_MailTo[i],pos(as_MailTo[i],'@') - 1)
	end if
	lmsg_send.recipient[ll_cunt].recipienttype=mailto! 						
	//End - Added By Mark Lee 09/18/12
	*/
	if Len(ls_MailTo) > 0 then ls_MailTo += "; "
	ls_MailTo += as_MailTo[i]
next
for i = 1 to UpperBound(as_MailCc[])
	/*
	if lnv_Outlook.of_LookupAccount(as_MailCc[i], ls_Account, 1) <> 0 then ls_Account = as_MailCc[i]
	//Begin - Added By Mark Lee 09/18/12
	ll_cunt++
	if pos(as_MailCc[i],'@')<=0 then
		lmsg_send.recipient[ll_cunt].address='SMTP:'+as_MailCc[i]
		lmsg_send.recipient[ll_cunt].name=as_MailCc[i]
	else
		lmsg_send.recipient[ll_cunt].address='SMTP:'+as_MailCc[i]
		lmsg_send.recipient[ll_cunt].name= left(as_MailTo[i],pos(as_MailCc[i],'@') - 1)
	end if
	lmsg_send.recipient[ll_cunt].recipienttype=mailcc! 						
	//End - Added By Mark Lee 09/18/12
	*/
	if Len(ls_MailCc) > 0 then ls_MailCc += "; "
	ls_MailCc += as_MailCc[i]
next
for i = 1 to UpperBound(as_MailBcc[])
	/*
	if lnv_Outlook.of_LookupAccount(as_MailBcc[i], ls_Account, 1) <> 0 then ls_Account = as_MailBcc[i]
	//Begin - Added By Mark Lee 09/18/12
	ll_cunt++
	if pos(as_MailBcc[i],'@')<=0 then
		lmsg_send.recipient[ll_cunt].address='SMTP:'+as_MailBcc[i]
		lmsg_send.recipient[ll_cunt].name=as_MailBcc[i]
	else
		lmsg_send.recipient[ll_cunt].address='SMTP:'+as_MailBcc[i]
		lmsg_send.recipient[ll_cunt].name= left(as_MailTo[i],pos(as_MailBcc[i],'@') - 1)
	end if
	lmsg_send.recipient[ll_cunt].recipienttype=mailbcc! 						
	//End - Added By Mark Lee 09/18/12
	*/
	if Len(ls_MailBcc) > 0 then ls_MailBcc += "; "
	ls_MailBcc += as_MailBcc[i]
next

// Add attachments
string lsa_uploadfileid[]
string ls_fileid
ls_Attachment = ''
for i = 1 to UpperBound(as_Attchment[])
	//Begin - Added By Mark Lee 09/18/12
	//lmsg_send.attachmentfile[i].filetype=mailattach!
	//lmsg_send.attachmentfile[i].pathname=as_Attchment[i]	
	//End - Added By Mark Lee 09/18/12
	ls_fileid = of_uploadfile(gs_accesstoken,as_Attchment[i])
	lsa_uploadfileid[i] = ls_fileid
	if(ls_fileid = "") then
		return -3
	end if
	ldec_filesize = lnv_filesrv.of_genfilesize(FileLength(as_Attchment[i]), ls_unit)
	If ls_Attachment = '' Then
		ls_Attachment =  lnv_smtp.of_GetAttchmentName(as_Attchment[i]) + ' (' +String(ldec_filesize) + ls_unit +  ')'
	Else
		ls_Attachment += '; ' + lnv_smtp.of_GetAttchmentName(as_Attchment[i]) + ' (' +String(ldec_filesize) + ls_unit +  ')'
	End If

next
If isvalid(lnv_filesrv) Then Destroy lnv_filesrv

//Add CTX key word for receive.
If gnv_data.of_getItem("icred_settings", "email_tag_mode", False) = '1' And &
   gnv_data.of_getItem("icred_settings", "receive_email", False) = '1' Then	
		as_subject = lnv_smtp.of_add_keyword(as_subject, gstr_email_info.ss_ctx_id_list , gstr_email_info.ss_doc_id_list, gstr_email_info.ss_ai_id_list)
End If

str_email_account lstr_mailserver
ls_send_user = lnv_smtp.of_replace_send_user(gs_user_id)			//Added By Mark Lee 01/08/2014
lnv_smtp.of_getdefaultaccount(ls_send_user,lstr_mailserver)

// Send email
//lmsg_send.subject=as_Subject 				//Added By Mark Lee 09/17/12
int mRet = -1
blob iblb_MailContent
string ls_customheaderkey[],ls_customheadervalue[]
ls_customheaderkey[1] = 'X-FromContractLogix'
ls_customheaderkey[2] = 'X-ContractID'
ls_customheaderkey[3] = 'X-DocumentID'
ls_customheaderkey[4] = 'X-ActionItemID'

ls_customheadervalue[1] = 'Yes'
ls_customheadervalue[2] = 'N/A'
ls_customheadervalue[3] = 'N/A'
ls_customheadervalue[4] = 'N/A'

If gstr_email_info.ss_ctx_id_list <> '' Then
	ls_customheadervalue[2] = gstr_email_info.ss_ctx_id_list
end if
If gstr_email_info.ss_doc_id_list  <> '' Then
	ls_customheadervalue[3] = gstr_email_info.ss_doc_id_list 
end if
If gstr_email_info.ss_ai_id_list  <> '' Then
	ls_customheadervalue[4] = gstr_email_info.ss_ai_id_list 
end if

if ai_Flag = 1 then
	//send text
	iblb_MailContent = blob(as_message)
	mRet	=	this.of_sendmail(as_accesstoken,as_mailto,as_mailcc,as_mailbcc,as_subject,as_message,"",lsa_uploadfileid,ls_customheaderkey,ls_customheadervalue,lstr_mailserver)
else
	iblb_MailContent = ablb_docdata //added by gavins 20140620
	//send html
	mRet	=	this.of_sendmail(as_accesstoken,as_mailto,as_mailcc,as_mailbcc,as_subject,"",as_htmlfile, ref ablb_docdata,lsa_uploadfileid,ls_customheaderkey,ls_customheadervalue,lstr_mailserver)
end if

If gnv_data.of_getitem('icred_settings', 'set_10', False) = '1' Then 
	lnv_smtp.of_setlog()
End If
//Begin - Added By Mark Lee 10/12/12

if mRet<> 0 then
	ll_Result = mRet
	//messagebox('Contractlogix','Sent email failure.'+'~r~n'+string(mRet))
else
	ll_Result = 0
	//messagebox('Contractlogix','sent email success.')
end if
//End - Added By Mark Lee 10/12/12

// Insert sent item if send successful
if ll_Result = 0 then
	ldt_sent = DateTime(Today(), Now())
	//Begin - Added By Mark Lee 10/12/12
//	SELECT email_id 
//	INTO	:ls_from
//	FROM security_users  
//		WHERE user_id = :gs_user_id;	
	ls_from =	lstr_mailserver.as_emailaddress  		//Added By Mark Lee 01/08/2014
	//End - Added By Mark Lee 10/12/12
	
	If Len(as_Subject) > 200 Then as_Subject = Mid(as_Subject, 1, 190) + '...'
	ls_ctx = gstr_email_info.ss_ctx_id_list 
	ls_doc = gstr_email_info.ss_doc_id_list 
	If Len(ls_ctx) > 990 Then 
		ls_ctx = Mid(ls_ctx, 1, 990) 
		ls_ctx = Mid(ls_ctx, 1 , LastPos(ls_ctx,',') - 1)
	End If
	If Len(ls_doc) > 990 Then 
		ls_doc = Mid(ls_doc, 1, 990) 
		ls_doc = Mid(ls_doc, 1 , LastPos(ls_doc,',') - 1)
	End If	
	
	lnv_smtp.ids_sent_msg.Reset()
	lnv_smtp.ids_sent_msg.InsertRow(0)
	lnv_smtp.ids_sent_msg.SetItem(1,'user_id',ls_send_user)
	lnv_smtp.ids_sent_msg.SetItem(1,'folder_id',3)
	lnv_smtp.ids_sent_msg.SetItem(1,'sub_folder_id',3)
	lnv_smtp.ids_sent_msg.SetItem(1,'mail_msg_id','')
	lnv_smtp.ids_sent_msg.SetItem(1,'mail_date',ldt_sent)
	lnv_smtp.ids_sent_msg.SetItem(1,'mail_subject',as_Subject)
	lnv_smtp.ids_sent_msg.SetItem(1,'mail_importance',0)
	lnv_smtp.ids_sent_msg.SetItem(1,'mail_from',ls_from)
	If Len(ls_MailTo) > 1990 Then ls_mailTo = Left(ls_MailTo, 1990) + '...' //Added By Ken.Guo 02/04/2013
	lnv_smtp.ids_sent_msg.SetItem(1,'mail_to',ls_MailTo)
	If Len(ls_MailCc) > 1990 Then ls_MailCc = Left(ls_MailCc, 1990) + '...' //Added By Ken.Guo 02/04/2013
	lnv_smtp.ids_sent_msg.SetItem(1,'mail_cc',ls_MailCc)
	lnv_smtp.ids_sent_msg.SetItem(1,'mail_attach_name',ls_Attachment)
	lnv_smtp.ids_sent_msg.SetItem(1,'mail_fromclx',1)
	//modified by gavins 20140620
	if ai_Flag = 1 then
		lnv_smtp.ids_sent_msg.SetItem(1,'mail_save_format','txt')
	Else
		lnv_smtp.ids_sent_msg.SetItem(1,'mail_save_format','doc')
	End If
	
//	lnv_smtp.ids_sent_msg.SetItem(1,'mail_save_format','txt') //Modified By Ken.Guo 10/26/2012. Modified 'doc' to 'txt'
	lnv_smtp.ids_sent_msg.SetItem(1,'read_status',1)
	lnv_smtp.ids_sent_msg.SetItem(1,'locked',0)
	lnv_smtp.ids_sent_msg.SetItem(1,'deleted',0)
	lnv_smtp.ids_sent_msg.SetItem(1,'flag',0)
	lnv_smtp.ids_sent_msg.SetItem(1,'last_modify_date',ldt_sent)
	
	lnv_smtp.ids_sent_msg.SetItem(1,'ctx_id_list', ls_ctx ) //Added By Ken.Guo 2010-08-16. For Group Email Alarm
	lnv_smtp.ids_sent_msg.SetItem(1,'doc_id_list', ls_doc ) //Added By Ken.Guo 2010-10-26. For multi-select document and email.
	lnv_smtp.ids_sent_msg.SetItem(1,'mail_action_item_id',al_action_item_id)
	
	//For checkin document in email item
	If Pos(gstr_email_info.ss_ctx_id_list,',') = 0 Then
		lnv_smtp.ids_sent_msg.SetItem(1,'mail_ctx_id',Long(gstr_email_info.ss_ctx_id_list))
	End If
	If Pos(gstr_email_info.ss_doc_id_list,',') = 0 Then
		lnv_smtp.ids_sent_msg.SetItem(1,'mail_doc_id',Long(gstr_email_info.ss_doc_id_list))
	End If	
	
	If lnv_smtp.ids_sent_msg.Update() <> 1 Then
		Messagebox('Error -101','Failed to save sent email to sent items.')
		//ids_sent_msg.Reset()
		Return -101
	End If
	ll_id = 	lnv_smtp.ids_sent_msg.GetItemNumber(1,'id')
	//Update Email Word File to DB
	If Len(iblb_MailContent) > 0 Then
		UPDATEBLOB em_mail_items SET mail_rfc822 = :iblb_MailContent WHERE id = :ll_id;
		If sqlca.sqlcode <> 0 Then
			Delete From em_mail_items Where id = :ll_id;
			Messagebox('Error -102','Failed to save sent email to sent items.')
			Return -102
		End If
	Elseif ai_Flag = 0 Then 
		Delete From em_mail_items Where id = :ll_id;
		Messagebox('Error -103','Failed to save sent email to sent items.')
		Return -103		
	End If
	
	If UpperBound(as_Attchment[]) > 0 Then
		lds_mail_attach = Create DataStore
		lds_mail_attach.DataObject = "d_em_mail_attach"
		lds_mail_attach.SetTransObject(SQLCA)	
		For i = 1 to UpperBound(as_Attchment[])
			If Not FileExists(as_Attchment[i]) Then Continue
			lnv_smtp.inv_dm_utils.of_readblob( as_Attchment[i], lblb_attachment)
			ls_attach_filename = Mid(as_Attchment[i],LastPos(as_Attchment[i],'\') + 1, Len(as_Attchment[i]))
			
			lds_mail_attach.Reset()
			lds_mail_attach.InsertRow(0)
			lds_mail_attach.SetItem(1,'mail_item_id',ll_id)
			lds_mail_attach.SetItem(1,'attachment_name',ls_attach_filename)
			lds_mail_attach.SetItem(1,'type','a') //a: attachment
			lds_mail_attach.SetItem(1,'last_modify_date',ldt_sent)
			If lds_mail_attach.Update() = 1 Then
				ll_attach_id = lds_mail_attach.GetItemNumber(1,'id')
				UpdateBlob em_mail_item_attachments Set image_file = :lblb_attachment Where id = :ll_attach_id;
				If SQLCA.sqlcode <> 0 Then
					Delete from em_mail_item_attachments where id = :ll_attach_id;
					lds_mail_attach.Reset()
					Messagebox('Error -104','Failed to save the attachment "'+as_Attchment[i]+'" to Email Sent Items.')
					Continue
				End If
			Else
				lds_mail_attach.Reset()
				
			End If
		Next	
		Destroy lds_mail_attach
	End If

	gs_CurAddresser = ""
end if

If isvalid(w_email_folder) Then
	w_email_folder.Dynamic Function of_add_sentitem(lnv_smtp.ids_sent_msg)
End If

//Added By Mark Lee 09/17/12
//lms_mail.maillogoff()
//destroy lms_mail

Return ll_Result

end function

public function integer of_sendmail (string as_accesstoken, string as_mailto[], string as_mailcc[], string as_mailbcc[], string as_subject, string as_message, string as_htmlfile, ref blob ablb_docdata, string as_attchment[], string as_customheaderkey[], string as_customheadervalue[], str_email_account astr_mailserver);/*
{
"AccessToken":"String",

"MailData":{"MailFrom":"String","MailTo":["String"],"MailCC":["String"],"MailBCC":["String"],"Encoding":"String","Subject":"String",
"HtmlBody":"String","TextBody":"String","SendHtml":false,"AttachmentID":["String"],
"CustomHeaderKey":["String"],"CustomHeaderValue":["String"],"HtmlImportFileName":"String","HtmlImportFileId":"String"},

"MailServer":{"Server":"String","Port":0,"Protocol":0,"User":"String","Password":"String","NeedAuth":false,"UseSSL":false}
}
*/

string ls_uri = ""
string ls_header
long ll_length
string ls_args
blob lbl_args
string ls_action = ""
string ls_accesstoken

string ls_maildata , ls_mailserver
string ls_mailfrom,ls_mailto,ls_mailcc,ls_mailbcc,ls_encoding,ls_subject,ls_htmlbody,ls_textbody
boolean lb_sendhtml
string ls_attachmentid,ls_customheaderkey,ls_CustomHeaderValue
string ls_HtmlImportFileName,ls_HtmlImportFileId

string ls_server
int li_port,li_protocol
string ls_user, ls_password
boolean lb_needauth,lb_usessl
string ls_from
int i, li_loop , ll_Result

if isnull(gs_accesstoken) or trim(gs_accesstoken) = '' then gs_accesstoken = of_convert_json_token( )
If  isnull(gs_accesstoken) or trim(gs_accesstoken) = '' then return -1
ls_accesstoken = gs_accesstoken

//Added By Mark 05/07/2014
//SELECT email_id 
//INTO	:ls_mailfrom
//FROM security_users  
//   WHERE user_id = :gs_user_id;
ls_mailfrom = astr_mailserver.as_emailaddress
	
ls_MailTo = ""	
for i = 1 to UpperBound(as_MailTo)
	if Len(ls_MailTo) > 0 then ls_MailTo += '","'
	ls_MailTo += as_MailTo[i]
next

ls_mailcc = ""	
for i = 1 to UpperBound(as_MailCC)
	if Len(ls_mailcc) > 0 then ls_mailcc += '","'
	ls_mailcc += as_MailCC[i]
next

ls_mailbcc = ""	
for i = 1 to UpperBound(as_Mailbcc)
	if Len(ls_mailbcc) > 0 then ls_mailbcc += '","'
	ls_mailbcc += as_MailBcc[i]
next

ls_encoding = "UTF-8"
ls_subject = as_subject
ls_htmlbody = as_htmlfile
if pos(ls_htmlbody,'\') > 0 then 
	ls_htmlbody = gnv_string.of_globalreplace( ls_htmlbody, '\', '\\' )
end if 
ls_textbody = as_message
string ls_htmlfileid = ""
ls_HtmlImportFileId = ""
if len(ls_htmlbody) <= 0 then 
	lb_sendhtml = false
else
	lb_sendhtml = true
	//ls_htmlfileid = of_uploadfile(as_accesstoken,ls_htmlbody)
	ls_htmlfileid = of_uploadfilecontent(as_accesstoken,as_htmlfile,ablb_docdata)
	ls_HtmlImportFileId = ls_htmlfileid
end if

ls_attachmentid = ""
for i = 1 to UpperBound(as_attchment)
	if Len(ls_attachmentid) > 0 then ls_attachmentid += '","'
	ls_attachmentid += as_attchment[i]
next

ls_customheaderkey = ""
ls_CustomHeaderValue = ""

for i = 1 to UpperBound(as_customheaderkey)
	if Len(ls_customheaderkey) > 0 then ls_customheaderkey += '","'
	ls_customheaderkey += as_customheaderkey[i]
next

for i = 1 to UpperBound(as_customheadervalue)
	if Len(ls_CustomHeaderValue) > 0 then ls_CustomHeaderValue += '","'
	ls_CustomHeaderValue += as_customheadervalue[i]
next

ls_HtmlImportFileName = ""

//Added By Jay Chen 02-05-2015 replace " as \"
if pos(ls_subject,'"') > 0 then 
	ls_subject = gnv_string.of_globalreplace( ls_subject, '"', '\"' )
end if 
if pos(ls_htmlbody,'"') > 0 then
	ls_htmlbody = gnv_string.of_globalreplace( ls_htmlbody, '"', '\"' )
end if
if  pos(ls_textbody,'"') > 0 then
	ls_textbody = gnv_string.of_globalreplace( ls_textbody, '"', '\"' )
end if
//end

ls_maildata = '{"MailFrom":"' + ls_mailfrom + '","MailTo":["' + ls_mailto + '"],"MailCC":["' + ls_mailcc + '"],"MailBCC":["' + ls_mailbcc +'"],'
ls_maildata = ls_maildata + '"Encoding":"' + ls_encoding + '","Subject":"' + ls_subject + '","HtmlBody":"' + ls_htmlbody + '","TextBody":"' + ls_textbody 
ls_maildata = ls_maildata + '","SendHtml":' + string(lb_sendhtml) + ',"AttachmentID":["' + ls_attachmentid + '"],'
ls_maildata = ls_maildata + '"CustomHeaderKey":["' + ls_customheaderkey + '"],"CustomHeaderValue":["' + ls_CustomHeaderValue + '"],"HtmlImportFileName":"' + ls_HtmlImportFileName + '","HtmlImportFileId":"' + ls_HtmlImportFileId + '"}'

if isvalid(astr_mailserver ) then
	if astr_mailserver.ai_sendauthmode = 1 then
		lb_needauth = true
	else
		lb_needauth = false
	end if
	ls_server = astr_mailserver.as_sendserver
	li_port = Integer(astr_mailserver.al_sendport)
	
	if upper(astr_mailserver.as_sendprotocol) = "SMTP" then
		li_protocol = 0
	else
		li_protocol = ii_protocol
	end if
	if astr_mailserver.ai_sendssl = 0 then
		lb_usessl = false
	else
		lb_usessl = true 
	end if
	
	
	n_cst_string ln_string

	ls_user =  ln_string.of_globalreplace( astr_mailserver.as_account, '\', '\\') 
	

	ls_password = astr_mailserver.as_password
	
end if

ls_mailserver = '{"Server":"' + ls_server + '","Port":' + string(li_port) + ',"Protocol":' + string(li_protocol) //modified by gavins 20140624
ls_mailserver = ls_mailserver + ',"User":"' + ls_user + '","Password":"' + ls_password + '","NeedAuth":' + string(lb_needauth) + ',"UseSSL":' + string(lb_usessl) +',"AuthType":' + string( astr_mailserver.ai_SendAuthMode_Exchange )+ '}'

ls_action = "json/reply/SendMail"
ls_uri = is_webapi_url + ls_action
ls_args = '{"AccessToken":"' + ls_accesstoken + '","MailData":' + ls_maildata + ',"MailServer":' + ls_mailserver + '}'
lbl_args = blob(ls_args,EncodingUTF8!)
ll_length = len(ls_args)
ls_header = "Content-Type: application/json" + "~n" + "Content-Length: " + string(ll_length) + "~n~n"
//iinet_base.posturl(ls_uri,lbl_args,ls_header,ii_webapi_serverport,iir_result)
 of_postrequest( ls_uri,lbl_args,ls_header,ii_webapi_serverport,iir_result, 1,ii_TimeOut, "" ,ll_length)//modified by gavins 20140611
 
string ls_statuscode = "1"
string ls_findt 
ls_findt = '"ErrorCode":'
long ll_findt , ll_finde , ll_findend,ll_pos
ll_findt = pos(lower(iir_result.is_result),lower(ls_findt))

if ll_findt > 0 then
	ll_findt = ll_findt + len(ls_findt) 
	ll_finde = pos(iir_result.is_result,',',ll_findt + 1)
	if ll_finde > 0 then

		ls_statuscode = mid(iir_result.is_result,ll_findt,ll_finde - ll_findt )
	else
		ls_statuscode = "-1"
	end if
end if
if left( ls_statuscode, 1 ) = '"' Then ls_statuscode = mid( ls_statuscode, 2 )
if right( ls_statuscode, 1 ) = '"' Then ls_statuscode = left( ls_statuscode, len( ls_statuscode ) - 1 )
If Long ( ls_statuscode )  < 0 Then return -100
return Long(ls_statuscode)




end function

public function string of_writejson (string as_source, string as_key, any as_value[], string as_parent);string ls_return = ""
//string ls_findt 
//ls_findt = as_key
//long ll_findt , ll_finde,  ll_finde2, ll_findend
//ll_findt = pos(as_source,ls_findt)
//if ll_findt > 0 then
//	ll_findt = ll_findt + len(ls_findt) 
//	ll_finde = pos(as_source,as_endkey,ll_findt + 1)
//	if ll_finde > 0 then
//		ls_return = mid(as_source,ll_findt,ll_finde - ll_findt )
//	else
//		ls_return = ""
//	end if
//end if
//lul_BufferLen = Len(ablob_buffer)
//If lul_BufferLen > 0 Then
//	lul_NextChunk = 1
//	do while lul_NextChunk <= lul_BufferLen
//		
//		lblob_buffer = BlobMid(ablob_buffer, lul_NextChunk, 8192)
//		lul_size = Len(lblob_buffer)
//		lb_Results = WinHttpWriteData(iul_request, &
//								lblob_buffer, lul_size, lul_written)
//		If Not lb_Results Then
//			LastErrorNum = GetErrorMsg("WinHttpWriteData", LastErrorText)
//			CloseHandles()
//			Return 0
//		End If
//		lul_NextChunk += lul_size 
//		SetNull(lblob_buffer)
//		
//	loop
//End If

return ls_return

end function

public function string of_convert_json_token ();string 		ls_token, ls_cachename

//{"AccessToken":””l,"SessionID":null,"UserID":null,"CacheName":null}
ls_cachename = gnv_data.of_getitem( 'icred_settings', 'cache_name', False) 

ls_token = '{\"AccessToken\":\"\",\"SessionID\":\"' + gs_session_id + '\",\"UserID\":\"' + gs_user_id + '\",\"CacheName\":\"' + ls_cachename + '\"}'

ls_token = of_getencodestring( ls_token )
return ls_token
end function

public function string of_sixbit2char (byte abt_b);string 	ls_return




return ls_return 
end function

public function string of_getencodestring (string as_str);string ls_uri = ""
string ls_header
long ll_length
string ls_args
blob lbl_args
string ls_action = ""
Integer		li_Return
String			ls_Err


ls_action = "json/reply/EncodeString"
//ls_args = "?WordString=" + as_str
ls_args =  '{"WordString":"' + as_str + '"}'
//ls_args = as_str
ls_uri = is_webapi_url + ls_action 

lbl_args = blob(ls_args,EncodingUTF8!)

ll_length = len(ls_args)
ls_header = "Content-Type: application/json" + "~n" + "Content-Length: " + string(ll_length) + "~n~n"

//li_Return = iinet_base.posturl(ls_uri,lbl_args,ls_header,ii_webapi_serverport,iir_result)
li_return = of_postrequest( ls_uri,lbl_args,ls_header,ii_webapi_serverport,iir_result, 1,ii_TimeOut, "",ll_length )//modified by gavins 20140611
If li_Return <> 1 then
	Choose case li_return
		case -1
			ls_Err =  "General error"
		case -2  
			ls_Err = "Invalid URL"
		case -4 
			ls_Err = "Cannot connect to the Internet"
		case -5
			ls_Err = "Unsupported secure (HTTPS) connection attempted"
		case -6
			ls_Err = "Internet request failed"
		case else
			ls_Err = "Unknow error."
End choose
	MessageBox( 'Error', 'Error Code: ' + string( li_Return ) + ", " + ls_err)
	return ""
End If
//iinet_base.geturl(ls_uri,iir_result)
errorcode = iir_result.errorcode
If errorcode = "-1" then return ""

return iir_result.is_result

end function

public function integer of_alarmemail ();string ls_uri = ""
string ls_header
long ll_length
string ls_args
blob lbl_args
string ls_action = ""
Integer	li_return

ls_action = "json/oneway/AlarmEmail"

//ls_args = "?accesstoken=" + as_accesstoken
if isnull(gs_accesstoken) or trim(gs_accesstoken) = '' then gs_accesstoken = of_convert_json_token( )
If  isnull(gs_accesstoken) or trim(gs_accesstoken) = '' then return -1

ls_args = '{"AccessToken":"' + gs_accesstoken + '"}'
ls_uri = is_webapi_url + ls_action

lbl_args = blob(ls_args,EncodingUTF8!)
ll_length = len(ls_args)
ls_header = "Content-Type: application/json" + "~n" + "Content-Length: " + string(ll_length) + "~n~n"
//li_return = iinet_base.posturl(ls_uri,lbl_args,ls_header,ii_webapi_serverport,iir_result) //modified by gavins 201406011
li_return = of_postrequest( ls_uri,lbl_args,ls_header,ii_webapi_serverport,iir_result, 1,ii_TimeOut, "",ll_length )
If li_return <> 1 Then
	Messagebox( 'Alarm Error information', 'Error Code: ' + string( li_return ) )
	Return -1
End If
errorcode = iir_result.errorcode
//iinet_base.geturl(ls_uri,iir_result)

//Added By Ken.Guo 2015-06-16
If errorcode <> '' Then
	Return -1
End If

return 0 

end function

public function integer of_getalarmemailstate (ref string as_total, ref string as_success, ref string as_failure, ref string as_error, ref string as_running);string ls_uri = ""
string ls_header
long ll_length
string ls_args
blob lbl_args
string ls_action = ""
ls_action = "json/reply/GetAlarmEmailState"
if isnull(gs_accesstoken) or trim(gs_accesstoken) = '' then gs_accesstoken = of_convert_json_token( )
If  isnull(gs_accesstoken) or trim(gs_accesstoken) = '' then return -1

ls_args = '{"AccessToken":"' + gs_accesstoken + '"}'
//as_servicename = "alarmemail"
//ls_args = "?AccessToken=" + as_accesstoken

ls_uri = is_webapi_url + ls_action 
//iinet_base.geturl(ls_uri,iir_result)
lbl_args = blob(ls_args,EncodingUTF8!)
ll_length = len(ls_args)
ls_header = "Content-Type: application/json" + "~n" + "Content-Length: " + string(ll_length) + "~n~n"
//iinet_base.posturl(ls_uri,lbl_args,ls_header,ii_webapi_serverport,iir_result)
of_postrequest( ls_uri,lbl_args,ls_header,ii_webapi_serverport,iir_result, 1,ii_TimeOut, "",ll_length )//modified by gavins 20140611
errorcode = iir_result.errorcode
//{"Total":"String","Success":"String","Failure":"String","Error":"String"}
string ls_total
string ls_success
string ls_failure
string ls_error
string ls_Running

ls_total = of_parsejson(iir_result.is_result,'Total":"','",')
ls_success = of_parsejson(iir_result.is_result,'Success":"','",')
ls_failure = of_parsejson(iir_result.is_result,'Failure":"','",')
ls_error = of_parsejson(iir_result.is_result,'Error":"','",')
ls_Running = of_parsejson(iir_result.is_result,'Running":"','",')

as_total = ls_total
as_success = ls_success
as_failure = ls_failure
as_error = ls_error
as_running = ls_Running

//gnv_status_info.of_display("Server Alarm Email Results: Successful/Failed/Total  " + ls_success + "/" + ls_failure + "/" + ls_total)
if len(ls_error) <= 0 then
	return 0
else
	return -1
end if
end function

public function integer of_logout ();string ls_uri = ""
string ls_header
long ll_length
string ls_args
blob lbl_args
string ls_action = ""
ls_action = "json/reply/Logout"
if isnull(gs_accesstoken) or trim(gs_accesstoken) = '' then  return -1
ls_args = "?accesstoken=" + gs_accesstoken
ls_uri = is_webapi_url + ls_action + ls_args

//lbl_args = blob(ls_args,EncodingUTF8!)
//ll_length = len(ls_args)
//ls_header = "Content-Type: application/json" + "~n" + "Content-Length: " + string(ll_length) + "~n~n"
//iinet_base.posturl(ls_uri,lbl_args,ls_header,ii_webapi_serverport,iir_result)
//iinet_base.geturl(ls_uri,iir_result)
of_postrequest( ls_uri,lbl_args,ls_header,ii_webapi_serverport,iir_result, 0,ii_TimeOut, "" ,ll_length)//modified by gavins 20140611
return 0 

end function

public function string of_getwebserviceurl ();string ls_url = ""
string ls_cachename

ls_url = gnv_data.of_getitem( 'icred_settings', 'ctx_web_link', False)
If gnv_data.of_getitem( 'icred_settings', 'use_web_email', False) = '1' Then
	If ls_url = '' or isnull( ls_url ) then 
		MessageBox( 'Tips', 'Please set contractlogix link in "System ->Utilities ->Web Link Settings"' )
		return ""
	End If
End If

If Len( ls_url ) > 0 Then
	if right(ls_url,1)<> "/" then ls_url = ls_url + "/"
	ls_cachename = gnv_data.of_getitem( 'icred_settings', 'cache_name', False)
		
	ii_webapi_serverport = 80
	int li_portpos = 0 , li_portpos2 = 0
	string ls_port = ""
	li_portpos = pos(ls_url,"://")
	if (li_portpos > 0) then
		li_portpos = pos(ls_url,":",li_portpos + 1)
		if(li_portpos > 0) then
			li_portpos2 = pos(ls_url,"/",li_portpos + 1)
			ls_port = mid(ls_url,li_portpos+1,li_portpos2 - li_portpos - 1)
		end if
	end if
	if len(ls_port) > 0 then
		ii_webapi_serverport = Integer(ls_port)
	end if
	is_webapi_url = ls_url + "api/"
End If
end function

public function string of_convert_stru_action_item_json (str_action_item astr_action_item);string ls_JSon
string ls_wf_id, ls_wf_step_id, ls_wf_step_status_id,ls_wf_action_status_id
string ls_dept_chair, ls_notes, ls_due_date, ls_rec_id, ls_prac_id
string ls_facility_id, ls_seq_no, ls_ctx_action_item_id,ls_ctx_id
string ls_screen_id, ls_module,ls_status_changed_flag, ls_wf_action_type_id
string ls_trigger_by, ls_doc_id, ls_reminder_date, ls_escalation_date
string ls_as_table, ls_as_column, ls_al_category, ls_as_company
string ls_alm_times_reminded, ls_wf_name, ls_as_owner, ls_as_assigned_to
n_cst_string		ln_String


ls_wf_id = string( astr_action_item.wf_id )
ls_wf_step_id = string( astr_action_item.wf_step_id )
ls_wf_step_status_id = string( astr_action_item.wf_step_status_id )
ls_wf_action_status_id = string( astr_action_item.wf_action_status_id )
ls_dept_chair = string( astr_action_item.dept_chair )
ls_notes = string( astr_action_item.notes )
ls_due_date = string( astr_action_item.due_date, 'yyyy-mm-dd hh:mm:ss' )
ls_rec_id = string( astr_action_item.rec_id )
ls_prac_id = string( astr_action_item.prac_id )
ls_facility_id = string( astr_action_item.facility_id )
ls_seq_no = string( astr_action_item.seq_no )
ls_ctx_action_item_id = string( astr_action_item.ctx_action_item_id )
ls_ctx_id = string( astr_action_item.ctx_id )
ls_screen_id = string( astr_action_item.screen_id )
ls_module = string( astr_action_item.module )
ls_status_changed_flag = string( astr_action_item.status_changed_flag )
ls_wf_action_type_id = string( astr_action_item.wf_action_type_id )
ls_trigger_by = string( astr_action_item.trigger_by )
ls_doc_id = string( astr_action_item.doc_id )
ls_reminder_date = string( astr_action_item.reminder_date, 'yyyy-mm-dd hh:mm:ss' )
ls_escalation_date = string( astr_action_item.escalation_date , 'yyyy-mm-dd hh:mm:ss' )
ls_as_table = string( astr_action_item.as_table )
ls_as_column = string( astr_action_item.as_column )
ls_al_category = string( astr_action_item.al_category )
ls_as_company = string( astr_action_item.as_company )
ls_alm_times_reminded = string( astr_action_item.alm_times_reminded )
ls_wf_name = string( astr_action_item.wf_name )
ls_as_owner = string( astr_action_item.as_owner )
ls_as_assigned_to = string( astr_action_item.as_assigned_to )

If isnull( ls_wf_id ) then ls_wf_id = "null"
If isnull( ls_wf_step_id ) then ls_wf_step_id = "null"
If isnull( ls_wf_step_status_id ) then ls_wf_step_status_id = "null"
If isnull( ls_wf_action_status_id ) then ls_wf_action_status_id = "null"
If isnull( ls_dept_chair )  then ls_dept_chair = "null"
If ( ls_dept_chair = "" )  then ls_dept_chair = '""'
If isnull( ls_notes ) then ls_notes = "null"
If ( ls_notes = "" )  then ls_notes = '""'
If isnull( ls_rec_id ) then ls_rec_id = "null"
If isnull( ls_prac_id ) then ls_prac_id = "null"
If isnull( ls_facility_id ) then ls_facility_id = "null"
If isnull( ls_seq_no ) then ls_seq_no = "null"
If isnull( ls_ctx_action_item_id ) then ls_ctx_action_item_id = "null"
If isnull( ls_ctx_id ) then ls_ctx_id = "null"
If isnull( ls_screen_id ) then ls_screen_id = "null"
If isnull( ls_module ) then ls_module = "null"
If ( ls_module = "" )  then ls_module = '""'
If isnull( ls_status_changed_flag ) then ls_status_changed_flag = "null"
If isnull( ls_trigger_by ) then ls_trigger_by = "null"
If ( ls_trigger_by = "" )  then ls_trigger_by = '""'
If isnull( ls_doc_id ) then ls_doc_id = "null"
If isnull( ls_al_category ) then ls_al_category = "null"
If isnull( ls_alm_times_reminded ) then ls_alm_times_reminded = "null"
If isnull( ls_as_table ) then ls_as_table = "null"
If ( ls_as_table = "" )  then ls_as_table = '""'
If isnull( ls_as_column ) then ls_as_column = "null"
If ( ls_as_column = "" )  then ls_as_column = '""'
If isnull( ls_as_company ) then ls_as_company = "null"
If ( ls_as_company = "" )  then ls_as_company = '""'
If isnull( ls_wf_name ) then ls_wf_name = "null"
If ( ls_wf_name = "" )  then ls_wf_name = '""'
If isnull( ls_as_owner ) then ls_as_owner = "null"
If ( ls_as_owner = "" )  then ls_as_owner = '""'
If isnull( ls_as_assigned_to ) then ls_as_assigned_to = "null"
If ( ls_as_assigned_to = "" )  then ls_as_assigned_to = '""'

if isnull( ls_due_date ) then ls_due_date = '\/Date(-62135596800000)\/'
if isnull( ls_reminder_date ) then ls_reminder_date = '\/Date(-62135596800000)\/'
if isnull( ls_escalation_date ) then ls_escalation_date = '\/Date(-62135596800000)\/'



ls_JSon = '{"wf_id":'+ ls_wf_id+ ',"wf_step_id":' + ls_wf_step_id + ',"wf_step_status_id":'+ls_wf_step_status_id +  &
',"wf_action_status_id":' + ls_wf_action_status_id + ',"dept_chair":'+ ls_dept_chair + ',"notes":'+ ls_notes + ',"due_date":"' + ls_due_date + '",' + &
'"rec_id":' + ls_rec_id + ',"prac_id":'+ ls_prac_id + ',"facility_id":' + ls_facility_id + ',"seq_no":' + ls_seq_no + ',"ctx_action_item_id":'+ ls_ctx_action_item_id + &
',"ctx_id":' + ls_ctx_id + ',"screen_id":' + ls_screen_id + ',"module":' + ls_module + ',"status_changed_flag":' + ls_status_changed_flag + ',' + &
'"wf_action_type_id":' + ls_wf_action_type_id + ',"trigger_by":' + ls_trigger_by + ',"doc_id":' + ls_doc_id + ',"reminder_date":"' + ls_reminder_date + &
'","escalation_date":"' + ls_escalation_date + '",' + '"as_table":' + ls_as_table + ',"as_column":' + ls_as_column + &
',"al_category":' + ls_al_category + ',"as_company":' + ls_as_company + ',"alm_times_reminded":' + ls_alm_times_reminded + &
',"wf_name":' + ls_wf_name + ',"as_owner":' + ls_as_owner + ',"as_assigned_to":' + ls_as_assigned_to  + '}'


ls_JSon = ln_String.of_globalreplace( ls_JSon, '"', '\"' )







return ls_JSon
end function

public function integer of_createworkflow (str_action_item as_action_item);string ls_uri = ""
string ls_header
long ll_length
string ls_args
blob lbl_args
string ls_action = ""
string	ls_JsonActionItem = ""

ls_action = "json/oneway/CreateSingleWorkflow"
//ls_args = "?accesstoken=" + as_accesstoken
if isnull(gs_accesstoken) or trim(gs_accesstoken) = '' then gs_accesstoken = of_convert_json_token( )

ls_JsonActionItem = of_convert_stru_action_item_json( as_action_item )

ls_args = '{"AccessToken":"' + gs_accesstoken + '","StruActionItem":"' +ls_JsonActionItem + '"}'
ls_uri = is_webapi_url + ls_action

lbl_args = blob(ls_args,EncodingUTF8!)
ll_length = len(ls_args)
ls_header = "Content-Type: application/json" + "~n" + "Content-Length: " + string(ll_length) + "~n~n"
//iinet_base.posturl(ls_uri,lbl_args,ls_header,ii_webapi_serverport,iir_result)
of_postrequest( ls_uri,lbl_args,ls_header,ii_webapi_serverport,iir_result, 1,ii_TimeOut , "",ll_length)//modified by gavins 20140611
errorcode = iir_result.errorcode

//Added By Ken.Guo 2015-06-16
If errorcode <> '' Then
	Return -1
End If

return 0 

end function

public function integer of_comparecreateworkflow (long al_view_id, long al_screen_id[], string as_updatecol[], long al_key_id, long al_facility_id, string as_module, string as_runtype, string as_triggertype);string ls_uri = ""
string ls_header
long ll_length
string ls_args
blob lbl_args
string ls_action = ""
string	ls_screenid = ""
string ls_updatecol = ""
n_cst_string			ln_cst_string
integer		li_i


ls_action = "json/oneway/CompareCreateWorkflow"
//ls_args = "?accesstoken=" + as_accesstoken
if isnull(gs_accesstoken) or trim(gs_accesstoken) = '' then gs_accesstoken = of_convert_json_token( )

ln_cst_string.of_arraytostring( al_screen_id , ',',  ls_screenid )
//ln_cst_string.of_arraytostring( as_updatecol , ',',  ls_updatecol )
for li_i = 1 To upperbound( as_updatecol )
	if left( as_updatecol[li_i],1 ) = ',' then as_updatecol[li_i] = mid( as_updatecol[li_i],2 )
	if right( as_updatecol[li_i],1 ) = ',' then as_updatecol[li_i] = left( as_updatecol[li_i],len(as_updatecol[li_i] ) -1   )
	
	if li_i > 1 then 
		ls_updatecol += ',' + as_updatecol[li_i] 
	else
		ls_updatecol = as_updatecol[li_i] 
	end if

Next

ls_args = '{"AccessToken":"' + gs_accesstoken + '","ViewID":"' +string(al_view_id) + '","ScreenID":[' +ls_screenid + '],"UpdateColumn":[' +ls_updatecol +&
				'],"KeyID1":"' +string(al_key_id ) + '","KeyID2":"' +string( al_facility_id ) + '","Module":"' +as_module + '","RunType":"' +as_runtype +'","TriggerType":"' +as_triggertype +  '"}'
ls_uri = is_webapi_url + ls_action

lbl_args = blob(ls_args,EncodingUTF8!)
ll_length = len(ls_args)
ls_header = "Content-Type: application/json" + "~n" + "Content-Length: " + string(ll_length) + "~n~n"
of_postrequest( ls_uri,lbl_args,ls_header,ii_webapi_serverport,iir_result, 1,ii_TimeOut, "" ,ll_length)//modified by gavins 20140611
//iinet_base.posturl(ls_uri,lbl_args,ls_header,ii_webapi_serverport,iir_result)
errorcode = iir_result.errorcode

//iinet_base.geturl(ls_uri,iir_result)

//Added By Ken.Guo 2015-06-16
If errorcode <> '' Then
	Return -1
End If

return 0 



end function

public function integer of_setautoalarm (boolean ab_setauto, string as_user);string ls_uri = ""
string ls_header
long ll_length
string ls_args
blob lbl_args
string ls_action = ""
Integer	li_return

ls_action = "/json/reply/SetAutoAlarm"

//ls_args = "?accesstoken=" + as_accesstoken
if isnull(gs_accesstoken) or trim(gs_accesstoken) = '' then gs_accesstoken = of_convert_json_token( )
If  isnull(gs_accesstoken) or trim(gs_accesstoken) = '' then return -1

ls_args = '{"AccessToken":"' + gs_accesstoken + '", "AutoAlarm":"'+ string( ab_setauto )    +  '","User":"' + as_User + '"}'
ls_uri = is_webapi_url + ls_action

lbl_args = blob(ls_args,EncodingUTF8!)
ll_length = len(ls_args)
ls_header = "Content-Type: application/json" + "~n" + "Content-Length: " + string(ll_length) + "~n~n"
//li_return = iinet_base.posturl(ls_uri,lbl_args,ls_header,ii_webapi_serverport,iir_result)
li_return = of_postrequest( ls_uri,lbl_args,ls_header,ii_webapi_serverport,iir_result, 1,ii_TimeOut, "",ll_length )//modified by gavins 20140611
If li_return <> 1 Then
	Messagebox( 'Set auto alarm error information', 'Error Code: ' + string( li_return ) )
	Return -1
End If
errorcode = iir_result.errorcode
//iinet_base.geturl(ls_uri,iir_result)
return 0 

end function

public function integer of_send (string as_accesstoken, string as_user, string as_mailto[], string as_mailcc[], string as_mailbcc[], string as_subject, string as_message, string as_htmlfile, string as_attchment[], integer ai_flag, integer al_ctx_id, integer al_doc_id, integer al_action_item_id);//====================================================================
// Function: of_send
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value    string     as_accesstoken
// 	value    integer    as_user
// 	value    string     as_mailto[]
// 	value    string     as_mailcc[]
// 	value    string     as_mailbcc[]
// 	value    string     as_subject
// 	value    string     as_message
// 	value    string     as_htmlfile
// 	value    string     as_attchment[]
// 	value    integer    ai_flag
// 	value    integer    al_ctx_id
// 	value    integer    al_doc_id
// 	value    integer    al_action_item_id
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	Mark		Date: 05/07/2014
//--------------------------------------------------------------------
//	Copyright (c) 2008-2013 Contractlogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
long   ll_id
long   i, ll_Result = -1
string ls_MailTo
string ls_MailCc
string ls_MailBcc
string ls_Attachment,ls_attach_filename
string ls_Account
datastore lds_mail,lds_mail_attach
//n_cst_outlook lnv_Outlook
n_cst_easymail_smtp lnv_smtp
string ls_encoding ,ls_from //Added By Ken.Guo 2009-07-31.
Datetime ldt_sent
Blob lblb_attachment
Long ll_attach_id
String ls_unit
decimal ldec_filesize
n_cst_filesrv lnv_filesrv
String ls_doc,ls_ctx, ls_send_user

lnv_filesrv = Create n_cst_filesrv

If al_ctx_id < 0 Then al_ctx_id = 0
If al_doc_id < 0 Then al_doc_id = 0
If al_action_item_id < 0 Then al_action_item_id = 0

lnv_smtp.of_set_global_var(al_ctx_id,al_doc_id,al_action_item_id)

if IsNull(as_Subject) then as_Subject = ""
if IsNull(as_Message) then as_Message = ""

if isnull(gs_accesstoken) or trim(gs_accesstoken) = '' then gs_accesstoken = of_convert_json_token( )
If  isnull(gs_accesstoken) or trim(gs_accesstoken) = '' then return -1
as_accesstoken= gs_accesstoken
// Add recipients
for i = 1 to UpperBound(as_MailTo[])
	/*
	if lnv_Outlook.of_LookupAccount(as_MailTo[i], ls_Account, 1) <> 0 then ls_Account = as_MailTo[i]  //jervis 08.09.2011
	//Begin - Added By Mark Lee 10/15/12
	ll_cunt++
	if pos(as_MailTo[i],'@')<=0 then
		lmsg_send.recipient[ll_cunt].address='SMTP:'+as_MailTo[i]
		lmsg_send.recipient[ll_cunt].name=as_MailTo[i]
	else
		lmsg_send.recipient[ll_cunt].address='SMTP:'+as_MailTo[i]
		lmsg_send.recipient[ll_cunt].name= left(as_MailTo[i],pos(as_MailTo[i],'@') - 1)
	end if
	lmsg_send.recipient[ll_cunt].recipienttype=mailto! 						
	//End - Added By Mark Lee 09/18/12
	*/
	if Len(ls_MailTo) > 0 then ls_MailTo += "; "
	ls_MailTo += as_MailTo[i]
next
for i = 1 to UpperBound(as_MailCc[])
	/*
	if lnv_Outlook.of_LookupAccount(as_MailCc[i], ls_Account, 1) <> 0 then ls_Account = as_MailCc[i]
	//Begin - Added By Mark Lee 09/18/12
	ll_cunt++
	if pos(as_MailCc[i],'@')<=0 then
		lmsg_send.recipient[ll_cunt].address='SMTP:'+as_MailCc[i]
		lmsg_send.recipient[ll_cunt].name=as_MailCc[i]
	else
		lmsg_send.recipient[ll_cunt].address='SMTP:'+as_MailCc[i]
		lmsg_send.recipient[ll_cunt].name= left(as_MailTo[i],pos(as_MailCc[i],'@') - 1)
	end if
	lmsg_send.recipient[ll_cunt].recipienttype=mailcc! 						
	//End - Added By Mark Lee 09/18/12
	*/
	if Len(ls_MailCc) > 0 then ls_MailCc += "; "
	ls_MailCc += as_MailCc[i]
next
for i = 1 to UpperBound(as_MailBcc[])
	/*
	if lnv_Outlook.of_LookupAccount(as_MailBcc[i], ls_Account, 1) <> 0 then ls_Account = as_MailBcc[i]
	//Begin - Added By Mark Lee 09/18/12
	ll_cunt++
	if pos(as_MailBcc[i],'@')<=0 then
		lmsg_send.recipient[ll_cunt].address='SMTP:'+as_MailBcc[i]
		lmsg_send.recipient[ll_cunt].name=as_MailBcc[i]
	else
		lmsg_send.recipient[ll_cunt].address='SMTP:'+as_MailBcc[i]
		lmsg_send.recipient[ll_cunt].name= left(as_MailTo[i],pos(as_MailBcc[i],'@') - 1)
	end if
	lmsg_send.recipient[ll_cunt].recipienttype=mailbcc! 						
	//End - Added By Mark Lee 09/18/12
	*/
	if Len(ls_MailBcc) > 0 then ls_MailBcc += "; "
	ls_MailBcc += as_MailBcc[i]
next

// Add attachments
string lsa_uploadfileid[]
string ls_fileid
ls_Attachment = ''
for i = 1 to UpperBound(as_Attchment[])
	//Begin - Added By Mark Lee 09/18/12
	//lmsg_send.attachmentfile[i].filetype=mailattach!
	//lmsg_send.attachmentfile[i].pathname=as_Attchment[i]	
	//End - Added By Mark Lee 09/18/12
	ls_fileid = of_uploadfile(gs_accesstoken,as_Attchment[i])
	lsa_uploadfileid[i] = ls_fileid
	if(ls_fileid = "") then
		return -3
	end if
	ldec_filesize = lnv_filesrv.of_genfilesize(FileLength(as_Attchment[i]), ls_unit)
	If ls_Attachment = '' Then
		ls_Attachment =  lnv_smtp.of_GetAttchmentName(as_Attchment[i]) + ' (' +String(ldec_filesize) + ls_unit +  ')'
	Else
		ls_Attachment += '; ' + lnv_smtp.of_GetAttchmentName(as_Attchment[i]) + ' (' +String(ldec_filesize) + ls_unit +  ')'
	End If

next
If isvalid(lnv_filesrv) Then Destroy lnv_filesrv

//Add CTX key word for receive.
If gnv_data.of_getItem("icred_settings", "email_tag_mode", False) = '1' And &
   gnv_data.of_getItem("icred_settings", "receive_email", False) = '1' Then	
		as_subject = lnv_smtp.of_add_keyword(as_subject, gstr_email_info.ss_ctx_id_list , gstr_email_info.ss_doc_id_list, gstr_email_info.ss_ai_id_list)
End If

str_email_account lstr_mailserver
if isnull(as_user) or trim(as_user) = "" then 			//Added By Mark 05/07/2014 set the sender for testing email setting.
	ls_send_user = lnv_smtp.of_replace_send_user(gs_user_id)				//Added By Mark Lee 01/08/2014
else
	ls_send_user = as_user
end if 
lnv_smtp.of_getdefaultaccount(ls_send_user,lstr_mailserver)

// Send email
//lmsg_send.subject=as_Subject 				//Added By Mark Lee 09/17/12
int mRet = -1
blob iblb_MailContent
string ls_customheaderkey[],ls_customheadervalue[]
ls_customheaderkey[1] = 'X-FromContractLogix'
ls_customheaderkey[2] = 'X-ContractID'
ls_customheaderkey[3] = 'X-DocumentID'
ls_customheaderkey[4] = 'X-ActionItemID'

ls_customheadervalue[1] = 'Yes'
ls_customheadervalue[2] = 'N/A'
ls_customheadervalue[3] = 'N/A'
ls_customheadervalue[4] = 'N/A'

If gstr_email_info.ss_ctx_id_list <> '' Then
	ls_customheadervalue[2] = gstr_email_info.ss_ctx_id_list
end if
If gstr_email_info.ss_doc_id_list  <> '' Then
	ls_customheadervalue[3] = gstr_email_info.ss_doc_id_list 
end if
If gstr_email_info.ss_ai_id_list  <> '' Then
	ls_customheadervalue[4] = gstr_email_info.ss_ai_id_list 
end if

if ai_Flag = 1 then
	//send text
	iblb_MailContent = blob(as_message)
	mRet	=	this.of_sendmail(as_accesstoken,as_mailto,as_mailcc,as_mailbcc,as_subject,as_message,"",lsa_uploadfileid,ls_customheaderkey,ls_customheadervalue,lstr_mailserver)
else
	Long li_fnum 
	li_fnum = FileOpen(as_htmlfile, StreamMode!)
	FileReadEX(li_fnum, iblb_MailContent)
	FileClose( li_Fnum )
	//send html
	mRet	=	this.of_sendmail(as_accesstoken,as_mailto,as_mailcc,as_mailbcc,as_subject,"",as_htmlfile,lsa_uploadfileid,ls_customheaderkey,ls_customheadervalue,lstr_mailserver)
end if

If gnv_data.of_getitem('icred_settings', 'set_10', False) = '1' Then 
	lnv_smtp.of_setlog()
End If
//Begin - Added By Mark Lee 10/12/12

if mRet<> 0 then
	ll_Result = mRet
	//messagebox('Contractlogix','Sent email failure.'+'~r~n'+string(mRet))
else
	ll_Result = 0
	//messagebox('Contractlogix','sent email success.')
end if
//End - Added By Mark Lee 10/12/12

// Insert sent item if send successful
if ll_Result = 0 then
	ldt_sent = DateTime(Today(), Now())
	//Begin - Added By Mark Lee 10/12/12
//	SELECT email_id 
//	INTO	:ls_from
//	FROM security_users  
//		WHERE user_id = :gs_user_id;	
	ls_from	= lstr_mailserver.as_emailaddress		//Added By Mark Lee 01/08/2014
	//End - Added By Mark Lee 10/12/12
	
	If Len(as_Subject) > 200 Then as_Subject = Mid(as_Subject, 1, 190) + '...'
	ls_ctx = gstr_email_info.ss_ctx_id_list 
	ls_doc = gstr_email_info.ss_doc_id_list 
	If Len(ls_ctx) > 990 Then 
		ls_ctx = Mid(ls_ctx, 1, 990) 
		ls_ctx = Mid(ls_ctx, 1 , LastPos(ls_ctx,',') - 1)
	End If
	If Len(ls_doc) > 990 Then 
		ls_doc = Mid(ls_doc, 1, 990) 
		ls_doc = Mid(ls_doc, 1 , LastPos(ls_doc,',') - 1)
	End If	
	
	lnv_smtp.ids_sent_msg.Reset()
	lnv_smtp.ids_sent_msg.InsertRow(0)
	lnv_smtp.ids_sent_msg.SetItem(1,'user_id',ls_send_user)
	lnv_smtp.ids_sent_msg.SetItem(1,'folder_id',3)
	lnv_smtp.ids_sent_msg.SetItem(1,'sub_folder_id',3)
	lnv_smtp.ids_sent_msg.SetItem(1,'mail_msg_id','')
	lnv_smtp.ids_sent_msg.SetItem(1,'mail_date',ldt_sent)
	lnv_smtp.ids_sent_msg.SetItem(1,'mail_subject',as_Subject)
	lnv_smtp.ids_sent_msg.SetItem(1,'mail_importance',0)
	lnv_smtp.ids_sent_msg.SetItem(1,'mail_from',ls_from)
	If Len(ls_MailTo) > 1990 Then ls_mailTo = Left(ls_MailTo, 1990) + '...' //Added By Ken.Guo 02/04/2013
	lnv_smtp.ids_sent_msg.SetItem(1,'mail_to',ls_MailTo)
	If Len(ls_MailCc) > 1990 Then ls_MailCc = Left(ls_MailCc, 1990) + '...' //Added By Ken.Guo 02/04/2013
	lnv_smtp.ids_sent_msg.SetItem(1,'mail_cc',ls_MailCc)
	lnv_smtp.ids_sent_msg.SetItem(1,'mail_attach_name',ls_Attachment)
	lnv_smtp.ids_sent_msg.SetItem(1,'mail_fromclx',1)
		//modified by gavins 20140620
	if ai_Flag = 1 then
		lnv_smtp.ids_sent_msg.SetItem(1,'mail_save_format','txt')
	Else
		lnv_smtp.ids_sent_msg.SetItem(1,'mail_save_format','doc')
	End If
	
//	lnv_smtp.ids_sent_msg.SetItem(1,'mail_save_format','txt') //Modified By Ken.Guo 10/26/2012. Modified 'doc' to 'txt'
	lnv_smtp.ids_sent_msg.SetItem(1,'read_status',1)
	lnv_smtp.ids_sent_msg.SetItem(1,'locked',0)
	lnv_smtp.ids_sent_msg.SetItem(1,'deleted',0)
	lnv_smtp.ids_sent_msg.SetItem(1,'flag',0)
	lnv_smtp.ids_sent_msg.SetItem(1,'last_modify_date',ldt_sent)
	
	lnv_smtp.ids_sent_msg.SetItem(1,'ctx_id_list', ls_ctx ) //Added By Ken.Guo 2010-08-16. For Group Email Alarm
	lnv_smtp.ids_sent_msg.SetItem(1,'doc_id_list', ls_doc ) //Added By Ken.Guo 2010-10-26. For multi-select document and email.
	lnv_smtp.ids_sent_msg.SetItem(1,'mail_action_item_id',al_action_item_id)
	
	//For checkin document in email item
	If Pos(gstr_email_info.ss_ctx_id_list,',') = 0 Then
		lnv_smtp.ids_sent_msg.SetItem(1,'mail_ctx_id',Long(gstr_email_info.ss_ctx_id_list))
	End If
	If Pos(gstr_email_info.ss_doc_id_list,',') = 0 Then
		lnv_smtp.ids_sent_msg.SetItem(1,'mail_doc_id',Long(gstr_email_info.ss_doc_id_list))
	End If	
	
	If lnv_smtp.ids_sent_msg.Update() <> 1 Then
		Messagebox('Error -101','Failed to save sent email to sent items.')
		//ids_sent_msg.Reset()
		Return -101
	End If
	ll_id = 	lnv_smtp.ids_sent_msg.GetItemNumber(1,'id')
	//Update Email Word File to DB
	If Len(iblb_MailContent) > 0 Then
		UPDATEBLOB em_mail_items SET mail_rfc822 = :iblb_MailContent WHERE id = :ll_id;
		If sqlca.sqlcode <> 0 Then
			Delete From em_mail_items Where id = :ll_id;
			Messagebox('Error -102','Failed to save sent email to sent items.')
			Return -102
		End If
	Elseif ai_Flag = 0 Then 
		Delete From em_mail_items Where id = :ll_id;
		Messagebox('Error -103','Failed to save sent email to sent items.')
		Return -103		
	End If
	
	If UpperBound(as_Attchment[]) > 0 Then
		lds_mail_attach = Create DataStore
		lds_mail_attach.DataObject = "d_em_mail_attach"
		lds_mail_attach.SetTransObject(SQLCA)	
		For i = 1 to UpperBound(as_Attchment[])
			If Not FileExists(as_Attchment[i]) Then Continue
			lnv_smtp.inv_dm_utils.of_readblob( as_Attchment[i], lblb_attachment)
			ls_attach_filename = Mid(as_Attchment[i],LastPos(as_Attchment[i],'\') + 1, Len(as_Attchment[i]))
			
			lds_mail_attach.Reset()
			lds_mail_attach.InsertRow(0)
			lds_mail_attach.SetItem(1,'mail_item_id',ll_id)
			lds_mail_attach.SetItem(1,'attachment_name',ls_attach_filename)
			lds_mail_attach.SetItem(1,'type','a') //a: attachment
			lds_mail_attach.SetItem(1,'last_modify_date',ldt_sent)
			If lds_mail_attach.Update() = 1 Then
				ll_attach_id = lds_mail_attach.GetItemNumber(1,'id')
				UpdateBlob em_mail_item_attachments Set image_file = :lblb_attachment Where id = :ll_attach_id;
				If SQLCA.sqlcode <> 0 Then
					Delete from em_mail_item_attachments where id = :ll_attach_id;
					lds_mail_attach.Reset()
					Messagebox('Error -104','Failed to save the attachment "'+as_Attchment[i]+'" to Email Sent Items.')
					Continue
				End If
			Else
				lds_mail_attach.Reset()
				
			End If
		Next	
		Destroy lds_mail_attach
	End If

	gs_CurAddresser = ""
end if

If isvalid(w_email_folder) Then
	w_email_folder.Dynamic Function of_add_sentitem(lnv_smtp.ids_sent_msg)
End If

//Added By Mark Lee 09/17/12
//lms_mail.maillogoff()
//destroy lms_mail

Return ll_Result

end function

public function integer of_postrequest (string as_url, blob abl_data, string as_header, integer ai_port, n_iresult an_result, integer ai_post, integer ai_timeout, string as_contenttype, long al_datalength);//added by gavin 20140611 
Integer		li_Return = 1, li_MaxSpace = 1000
string			ls_Response, ls_Err
Blob			lbl_Res


//iinet_base.posturl(ls_uri,lbl_args,ls_header,ii_webapi_serverport,iir_result)

If gnv_data.of_getitem( 'icred_settings', 'http_visit', False) = '0' Then
	
	ii_TimeOut = Integer(gnv_data.of_getitem( 'icred_settings', 'http_timeout', False) ) * 1000
	If IsNull( ii_TimeOut ) Then ii_TimeOut = 30000
	ls_Err = space( li_MaxSpace )
	ls_Response = space( 163830 )
	lbl_Res = blob(ls_Response )
	li_Return = SendRequest( as_url, ai_post, as_contenttype, abl_data, al_datalength, lbl_Res,  ls_Err, ai_timeout )
	If li_Return <> 0 Then
		If li_Return = -10 Then 
			MessageBox( 'Tips', 'Failed to resolve url.' )
		Else
			MessageBox( 'Tips' , trim(ls_Err) )
		End If
		Return -100
	End If
	//an_result.InternetData(  lbl_Res )
	//li_Return = 1
	li_Return = an_result.InternetData(  lbl_Res )  //Modified By Harry 2017-02-03
	If li_Return <> -8 Then li_Return = 1
Else
	li_Return = iinet_base.posturl(as_url,abl_data,as_header,ai_port,an_result)
	
End If




return li_Return
end function

public function integer of_alarmemailandworkflow ();string ls_uri = ""
string ls_header
long ll_length
string ls_args
blob lbl_args
string ls_action = ""
Integer	li_return

ls_action = "/json/reply/AlarmEmailAndWorkflow"

//ls_args = "?accesstoken=" + as_accesstoken
if isnull(gs_accesstoken) or trim(gs_accesstoken) = '' then gs_accesstoken = of_convert_json_token( )
If  isnull(gs_accesstoken) or trim(gs_accesstoken) = '' then return -1

ls_args = '{"AccessToken":"' + gs_accesstoken + '"}'
ls_uri = is_webapi_url + ls_action

lbl_args = blob(ls_args,EncodingUTF8!)
ll_length = len(ls_args)
ls_header = "Content-Type: application/json" + "~n" + "Content-Length: " + string(ll_length) + "~n~n"
//li_return = iinet_base.posturl(ls_uri,lbl_args,ls_header,ii_webapi_serverport,iir_result) //modified by gavins 201406011
li_return = of_postrequest( ls_uri,lbl_args,ls_header,ii_webapi_serverport,iir_result, 1,ii_TimeOut, "",ll_length )
If li_return <> 1 Then
	Messagebox( 'Alarm Error information', 'Error Code: ' + string( li_return ) )
	Return -1
End If
errorcode = iir_result.errorcode
//iinet_base.geturl(ls_uri,iir_result)
return 0 

end function

public subroutine of_setprotocol (integer ai_protocol);ii_Protocol = ai_protocol
end subroutine

public function long of_mergedocument (string as_accesstoken, string as_type, long al_docid, long ai_exportid, long al_ctxid, boolean ab_merged, str_doc_info astr_docinfo, ref string as_mergedfileid);/*
{
"AccessToken":"String",
"MergeType":"String",
"ExportID":0,
"CtxID":0,
"Merged":false,
"DocInfo":{"doc_id":0,"export_id":0,"ver_num":0,"ver_date":"xxxx-xx-xx","doc_name":"string","create_by":"string"}
}
*/

string ls_uri = ""
string ls_header
long ll_length
string ls_args
blob lbl_args
string ls_action = ""
string ls_accesstoken

int i, li_loop , ll_Result


if isnull(gs_accesstoken) or trim(gs_accesstoken) = '' then gs_accesstoken = of_convert_json_token( )
If  isnull(gs_accesstoken) or trim(gs_accesstoken) = '' then return -1
ls_accesstoken = gs_accesstoken
string ls_docinfo = ""
ls_docinfo = '{"doc_id":"' + string(al_docid) + '","export_id":' + string(ai_exportid) + ',"ver_num":' + string(astr_docinfo.ver_num) 
ls_docinfo = ls_docinfo + ',"ver_date":"' + string(astr_docinfo.ver_date) + '","doc_name":"' + astr_docinfo.doc_name + '","create_by":' + string(astr_docinfo.create_by) + '}'

ls_action = "json/reply/MergeDocumentAuto"
ls_uri = is_webapi_url + ls_action
ls_args = '{"AccessToken":"' + ls_accesstoken + '","MergeType":' + as_type+'","ExportID":' + string(ai_exportid) + ',"CtxID":' + string(al_ctxid) + ',"Merged":' + string(ab_merged) + ',"DocInfo":' + ls_docinfo + '}'
lbl_args = blob(ls_args,EncodingUTF8!)
ll_length = len(ls_args)
ls_header = "Content-Type: application/json" + "~n" + "Content-Length: " + string(ll_length) + "~n~n"
//iinet_base.posturl(ls_uri,lbl_args,ls_header,ii_webapi_serverport,iir_result)
 of_postrequest( ls_uri,lbl_args,ls_header,ii_webapi_serverport,iir_result, 1,ii_TimeOut,"",ll_length)//modified by gavins 20140611

string ls_statuscode = "1" //modified by gavins 20140421 change statuscode to errorcode 
string ls_findt 
ls_findt = '"ErrorCode":'
long ll_findt , ll_finde , ll_findend
ll_findt = pos(lower(iir_result.is_result),lower(ls_findt))

if ll_findt > 0 then
	ll_findt = ll_findt + len(ls_findt) 
	ll_finde = pos(iir_result.is_result,',',ll_findt + 1)
	if ll_finde > 0 then

		ls_statuscode = mid(iir_result.is_result,ll_findt,ll_finde - ll_findt )
	else
		ls_statuscode = "-1"
	end if
end if
if left( ls_statuscode, 1 ) = '"' Then ls_statuscode = mid( ls_statuscode, 2 )
if right( ls_statuscode, 1 ) = '"' Then ls_statuscode = left( ls_statuscode, len( ls_statuscode ) - 1 )
if ls_statuscode = '"-1"' then ls_statuscode = "-1" //Added By Jay Chen 04-22-2014
If Long ( ls_statuscode )  < 0 Then return -100


as_mergedfileid = ""
ls_findt = '"MergedFileId":'
ll_findt = pos(lower(iir_result.is_result),lower(ls_findt))
if ll_findt > 0 then
	ll_findt = ll_findt + len(ls_findt) 
	ll_finde = pos(iir_result.is_result,'"',ll_findt + 1)
	if ll_finde > 0 then
		as_mergedfileid = mid(iir_result.is_result,ll_findt,ll_finde - ll_findt )
	else
		as_mergedfileid = ""
	end if
end if
if left( as_mergedfileid, 1 ) = '"' Then as_mergedfileid = mid( as_mergedfileid, 2 )
if right( as_mergedfileid, 1 ) = '"' Then as_mergedfileid = left( as_mergedfileid, len( as_mergedfileid ) - 1 )

return Long(ls_statuscode)




end function

public function string of_uploadfile (string as_accesstoken, string as_filepath);string ls_uri = ""
string ls_action = ""
integer li_fnum
long li_bytes
blob lbl_filedata , lblb_arg
string ls_boundary 
string ls_args
string ls_shortname
string  sFind
long  llStart, llEnd
long ll_length
string ls_header
ls_action =  "json/reply/Upload"
ls_uri = is_webapi_url + ls_action

sFind = '\'
llStart = lastpos(as_filepath,'\')
if llStart > 0 then
	ls_shortname = Mid(as_filepath, (llStart + 1), (len(as_filepath) + 1 - llStart))
else
	ls_shortname = as_filepath
end if
if isnull(gs_accesstoken) or trim(gs_accesstoken) = '' then gs_accesstoken = of_convert_json_token( )
as_accesstoken = gs_accesstoken

//Modified by gavin 20151217   direct update to db
//return of_savefiletodb ( as_accesstoken, as_filepath, lbl_filedata )





li_fnum = FileOpen(as_filepath, StreamMode!)
li_bytes = FileReadEX(li_fnum, lbl_filedata)

FileClose(li_fnum)
ls_boundary = "----------------------------" + string(cpu())
ls_args = "--" + ls_boundary + "~r~n" + &
			 "Content-Disposition: form-data; name=~"AccessToken~"~r~n" + &
			 "~r~n" + as_accesstoken + "~r~n" + &
			 "--" + ls_boundary + "~r~n" + &
			 "Content-Disposition: form-data; name=~"file~"; filename=~"" + ls_shortname + "~"~r~n" + &
			 "Content-Type: application/octet-stream~r~n" + &
			 "~r~n"
			 
lblb_arg = blob(ls_args,EncodingUTF8!) + lbl_filedata + blob("~r~n--" + ls_boundary + "~r~n--",EncodingUTF8!)			 

ll_length = len(lblb_arg)

ls_header = "Content-Type: multipart/form-data; boundary=" + ls_boundary + "~r~n" + &
					"Content-Length: " + string(ll_length) + "~r~n~r~n"

//iinet_base.posturl(ls_uri,lblb_arg,ls_header,ii_webapi_serverport, iir_result)
of_postrequest( ls_uri,lblb_arg,ls_header,ii_webapi_serverport,iir_result, 1,ii_TimeOut,"Content-Type: multipart/form-data; boundary=" + ls_boundary, ll_length  )//modified by gavins 20140611

//return iir_result.is_result 

string ls_findt 
string ls_uploadfileid = ""
ls_findt = '"AttachmentId":["'
long ll_findt , ll_finde , ll_findend
ll_findt = pos(lower(iir_result.is_result),lower(ls_findt))
if ll_findt > 0 then
	ll_findt = ll_findt + len(ls_findt) 
	ll_finde = pos(iir_result.is_result,'"',ll_findt + 1)
	if ll_finde > 0 then
		ls_uploadfileid = mid(iir_result.is_result,ll_findt,ll_finde - ll_findt )
	else
		ls_uploadfileid = ""
	end if
end if

return ls_uploadfileid
end function

public function string of_savefiletodb (string as_accesstoken, string as_filepath, blob ablb_filecontent);//added by gavins 20151217
Blob		lblb_Doc, lblb_temp
Long		ll_Handle , ll_return, ll_Size
string		ls_FileID, ls_FilePath

If Len( as_filepath ) > 0 Then
	If Not FileExists( as_filepath ) Then
		gnv_debug.of_output( true,  "File:" + as_filepath + ", is not exists."  )
		Return ''
	End If
	ll_Handle = FileOpen(as_filepath, StreamMode!)
	ll_return = FileReadEX(ll_Handle, lblb_Doc)

	FileClose(ll_Handle)
	
End If

If Len( ablb_filecontent ) > 0 Then  lblb_Doc = ablb_filecontent 

//as_accesstoken     not required , require session id
ls_FileID = string( cpu( ) ) +string( today(), 'yyyymmdd' ) + string( now( ) , 'hhmmssfff' )


select count( 1) into:ll_return from em_attachment_temp where accesstoken = :gs_session_id  and fileid = :ls_FileID;
If sqlca.sqlcode < 0 Then
	gnv_debug.of_output( true,  sqlca.sqlerrtext )
	return ''
End If
If ll_return > 0 Then
	Updateblob em_attachment_temp set attachment = :lblb_Doc where accesstoken = :gs_session_id  and fileid = :ls_FileID;
	if sqlca.sqlcode < 0 then	
		gnv_debug.of_output( true,"Information: UPDATEBLOB em_attachment_temp failed, "  + SQLCA.sqlerrtext  )
		return ''
	End If
Else
	ls_FilePath = Left( as_filepath, 300)
	ll_Size = Len( lblb_Doc )
	lblb_temp = blob( '0' )
	Insert em_attachment_temp ( accesstoken, filename, fileid, lastdate, filesize,attachment, userid ) values( :gs_session_id, :ls_FilePath , :ls_FileID, getdate(), :ll_Size ,'', :gs_user_id);
	if sqlca.sqlcode < 0 then	
		gnv_debug.of_output( true,"Information: Insert em_attachment_temp failed, "  + SQLCA.sqlerrtext  )
		return ''
	End If
	Updateblob em_attachment_temp set attachment = :lblb_Doc where accesstoken = :gs_session_id  and fileid = :ls_FileID;
	if sqlca.sqlcode < 0 then	
		gnv_debug.of_output( true,"Information: UPDATEBLOB em_attachment_temp failed, "  + SQLCA.sqlerrtext  )
		return ''
	End If
End If




Return ls_FileID
end function

public function integer of_esign_refresh_token (string as_accesstoken, string as_user, ref string as_esign_access_token, ref string as_esign_refresh_token, ref string as_esign_token_date);//====================================================================
// Function: of_esign_refresh_token
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value        string    as_accesstoken
// 	value        string    as_user
// 	reference    string    as_esign_access_token
// 	reference    string    as_esign_refresh_token
// 	reference    string    as_esign_token_date
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	Jay Chen		Date: 02-16-2016
//--------------------------------------------------------------------
//	Copyright (c) 2008-2014 ContractLogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


/*
{
"AccessToken":"String",
"User":"String",
}
*/

string ls_uri = ""
string ls_header
long ll_length
string ls_args
blob lbl_args
string ls_action = ""
string ls_accesstoken
string ls_access_token,ls_refresh_token,ls_token_date
int i, li_loop , ll_Result


if isnull(as_accesstoken) or trim(as_accesstoken) = '' then as_accesstoken = of_convert_json_token( )
If  isnull(as_accesstoken) or trim(as_accesstoken) = '' then return -1
ls_accesstoken = as_accesstoken

ls_action = "json/reply/RefreshTokenRequest"
ls_uri = is_webapi_url + ls_action
ls_args = '{"AccessToken":"' + ls_accesstoken + '","UserId":"' + as_user +'"}'
lbl_args = blob(ls_args,EncodingUTF8!)
ll_length = len(ls_args)
ls_header = "Content-Type: application/json" + "~n" + "Content-Length: " + string(ll_length) + "~n~n"
//iinet_base.posturl(ls_uri,lbl_args,ls_header,ii_webapi_serverport,iir_result)
 of_postrequest( ls_uri,lbl_args,ls_header,ii_webapi_serverport,iir_result, 1,ii_TimeOut,"",ll_length)

string ls_statuscode = "1" 
string ls_findt 
ls_findt = '"ErrorCode":'
long ll_findt , ll_finde , ll_findend
ll_findt = pos(lower(iir_result.is_result),lower(ls_findt))

if ll_findt > 0 then
	ll_findt = ll_findt + len(ls_findt) 
	ll_finde = pos(iir_result.is_result,',',ll_findt + 1)
	if ll_finde > 0 then
		ls_statuscode = mid(iir_result.is_result,ll_findt,ll_finde - ll_findt )
	else
		ls_statuscode = "-1"
	end if
end if
if left( ls_statuscode, 1 ) = '"' Then ls_statuscode = mid( ls_statuscode, 2 )
if right( ls_statuscode, 1 ) = '"' Then ls_statuscode = left( ls_statuscode, len( ls_statuscode ) - 1 )
if ls_statuscode = '"-1"' then ls_statuscode = "-1" 
If Long (ls_statuscode )  < 0 Then return -1

//esign_access_token
ls_access_token = ""
ls_findt = '"esign_access_token":'
ll_findt = pos(lower(iir_result.is_result),lower(ls_findt))
if ll_findt > 0 then
	ll_findt = ll_findt + len(ls_findt) 
	ll_finde = pos(iir_result.is_result,'"',ll_findt + 1)
	if ll_finde > 0 then
		ls_access_token = mid(iir_result.is_result,ll_findt,ll_finde - ll_findt )
	else
		ls_access_token = ""
	end if
end if
if left(ls_access_token, 1 ) = '"' Then ls_access_token = mid( ls_access_token, 2 )
if right(ls_access_token, 1 ) = '"' Then ls_access_token = left( ls_access_token, len( ls_access_token ) - 1 )
as_esign_access_token = ls_access_token

//esign_refresh_token
ls_refresh_token = ""
ls_findt = '"esign_refresh_token":'
ll_findt = pos(lower(iir_result.is_result),lower(ls_findt))
if ll_findt > 0 then
	ll_findt = ll_findt + len(ls_findt) 
	ll_finde = pos(iir_result.is_result,'"',ll_findt + 1)
	if ll_finde > 0 then
		ls_refresh_token = mid(iir_result.is_result,ll_findt,ll_finde - ll_findt )
	else
		ls_refresh_token = ""
	end if
end if
if left(ls_refresh_token, 1 ) = '"' Then ls_refresh_token = mid( ls_refresh_token, 2 )
if right(ls_refresh_token, 1 ) = '"' Then ls_refresh_token = left( ls_refresh_token, len( ls_refresh_token ) - 1 )
as_esign_refresh_token = ls_refresh_token

//esign_token_date
ls_token_date = ""
ls_findt = '"esign_token_date":'
ll_findt = pos(lower(iir_result.is_result),lower(ls_findt))
if ll_findt > 0 then
	ll_findt = ll_findt + len(ls_findt) 
	ll_finde = pos(iir_result.is_result,'"',ll_findt + 1)
	if ll_finde > 0 then
		ls_token_date = mid(iir_result.is_result,ll_findt,ll_finde - ll_findt )
	else
		ls_token_date = ""
	end if
end if
if left(ls_token_date, 1 ) = '"' Then ls_token_date = mid( ls_token_date, 2 )
if right(ls_token_date, 1 ) = '"' Then ls_token_date = left( ls_token_date, len( ls_token_date ) - 1 )
as_esign_token_date = ls_token_date

if len(ls_access_token) < 1 then return -1
if len(ls_refresh_token) < 1 then return -1
if len(ls_token_date) < 1 then return -1

return Long(ls_statuscode)




end function

public function integer of_esign_get_agreement (string as_accesstoken, string as_esigntoken, string as_agreementid, ref tns__documentinformation astr_agreement);//====================================================================
// Function: of_esign_get_agreement
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value        string                      as_accesstoken
// 	value        string                      as_esigntoken
// 	value        string                      as_agreementid
// 	reference    tns__documentinformation    astr_agreement
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	Jay Chen		Date: 02-16-2016
//--------------------------------------------------------------------
//	Copyright (c) 2008-2014 ContractLogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

string ls_uri = ""
string ls_header
long ll_length,ll_row
string ls_args
blob lbl_args
string ls_action = ""
string ls_accesstoken,ls_agreementName,ls_agreementstatus
tns__documentinformation ltns__documentinformation
int i, li_loop , ll_Result
string ls_signer

if isnull(gs_accesstoken) or trim(gs_accesstoken) = '' then gs_accesstoken = of_convert_json_token( )
If isnull(gs_accesstoken) or trim(gs_accesstoken) = '' then return -1
ls_accesstoken = gs_accesstoken

ls_action = "json/reply/GetAgreementRequest"
ls_uri = is_webapi_url + ls_action
ls_args =  '{"AccessToken":"' + ls_accesstoken + '","EsignToken":"' + as_esigntoken + '","AgreementId":"' + as_agreementid +'"}'
lbl_args = blob(ls_args,EncodingUTF8!)
ll_length = len(ls_args)
ls_header = "Content-Type: application/json" + "~n" + "Content-Length: " + string(ll_length) + "~n~n"
//iinet_base.posturl(ls_uri,lbl_args,ls_header,ii_webapi_serverport,iir_result)
ll_Result = of_postrequest( ls_uri,lbl_args,ls_header,ii_webapi_serverport,iir_result, 1,ii_TimeOut,"",ll_length)

gnv_debug.of_output(false, 'Get echosign info. as_esigntoken =' + as_esigntoken + ', as_agreementid = '  + as_agreementid + '.  ~r~niir_result.is_result: ' + iir_result.is_result)

If ll_Result = -8 Then Return -8  //Added By Harry 2017-02-03

string ls_statuscode = "1" 
string ls_findt 
ls_findt = '"ErrorCode":'
long ll_findt , ll_finde , ll_findend
ll_findt = pos(lower(iir_result.is_result),lower(ls_findt))

if ll_findt > 0 then
	ll_findt = ll_findt + len(ls_findt) 
	ll_finde = pos(iir_result.is_result,',',ll_findt + 1)
	if ll_finde > 0 then
		ls_statuscode = mid(iir_result.is_result,ll_findt,ll_finde - ll_findt )
	else
		ls_statuscode = "-1"
	end if
end if
if left( ls_statuscode, 1 ) = '"' Then ls_statuscode = mid( ls_statuscode, 2 )
if right( ls_statuscode, 1 ) = '"' Then ls_statuscode = left( ls_statuscode, len( ls_statuscode ) - 1 )
if ls_statuscode = '"-1"' then ls_statuscode = "-1" 
If Long (ls_statuscode )  < 0 Then return -1

ls_agreementName = ''
ls_findt = '"agreementName":'
ll_findt = pos(lower(iir_result.is_result),lower(ls_findt))
if ll_findt > 0 then
	ll_findt = ll_findt + len(ls_findt) 
	ll_finde = pos(iir_result.is_result,'"',ll_findt + 1)
	if ll_finde > 0 then
		ls_agreementName = mid(iir_result.is_result,ll_findt,ll_finde - ll_findt )
	else
		ls_agreementName = ""
	end if
end if
if left(ls_agreementName, 1 ) = '"' Then ls_agreementName = mid( ls_agreementName, 2 )
if right(ls_agreementName, 1 ) = '"' Then ls_agreementName = left( ls_agreementName, len( ls_agreementName ) - 1 )
ltns__documentinformation.documentname = ls_agreementName

ls_agreementstatus = ''
ls_findt = '"agreementStatus":'
ll_findt = pos(lower(iir_result.is_result),lower(ls_findt))
if ll_findt > 0 then
	ll_findt = ll_findt + len(ls_findt) 
	ll_finde = pos(iir_result.is_result,'"',ll_findt + 1)
	if ll_finde > 0 then
		ls_agreementstatus = mid(iir_result.is_result,ll_findt,ll_finde - ll_findt )
	else
		ls_agreementstatus = ""
	end if
end if
if left(ls_agreementstatus, 1 ) = '"' Then ls_agreementstatus = mid( ls_agreementstatus, 2 )
if right(ls_agreementstatus, 1 ) = '"' Then ls_agreementstatus = left( ls_agreementstatus, len( ls_agreementstatus ) - 1 )
ltns__documentinformation.docsatus = ls_agreementstatus

//signatures :signerEmail
ls_signer = ''
ls_findt = '"signerEmail":'
ll_findt = pos(lower(iir_result.is_result),lower(ls_findt))
do while ll_findt > 0
	ll_findt = ll_findt + len(ls_findt) 
	ll_finde = pos(iir_result.is_result,'"',ll_findt + 1)
	if ll_finde > 0 then
		ls_signer = mid(iir_result.is_result,ll_findt,ll_finde - ll_findt )
	else
		ls_signer = ""
	end if
	if left(ls_signer, 1 ) = '"' Then ls_signer = mid( ls_signer, 2 )
	if right(ls_signer, 1 ) = '"' Then ls_signer = left( ls_signer, len( ls_signer ) - 1 )
	ltns__documentinformation.signature[upperbound(ltns__documentinformation.signature) + 1].signeremail = ls_signer
	ll_findt = pos(lower(iir_result.is_result),lower(ls_findt),ll_findt)
loop

//nameSigned
ls_signer = ''
ll_row = 0
ls_findt = '"nameSigned":'
ll_findt = pos(lower(iir_result.is_result),lower(ls_findt))
do while ll_findt > 0
	ll_row++
	ll_findt = ll_findt + len(ls_findt) 
	ll_finde = pos(iir_result.is_result,'"',ll_findt + 1)
	if ll_finde > 0 then
		ls_signer = mid(iir_result.is_result,ll_findt,ll_finde - ll_findt )
	else
		ls_signer = ""
	end if
	if left(ls_signer, 1 ) = '"' Then ls_signer = mid( ls_signer, 2 )
	if right(ls_signer, 1 ) = '"' Then ls_signer = left( ls_signer, len( ls_signer ) - 1 )
	if ll_row <= upperbound(ltns__documentinformation.signature) then ltns__documentinformation.signature[ll_row].namesigned = ls_signer
	ll_findt = pos(lower(iir_result.is_result),lower(ls_findt),ll_findt)
loop

//signstatus
ls_signer = ''
ll_row = 0
ls_findt = '"signStatus":'
ll_findt = pos(lower(iir_result.is_result),lower(ls_findt))
do while ll_findt > 0
	ll_row++
	ll_findt = ll_findt + len(ls_findt) 
	ll_finde = pos(iir_result.is_result,'"',ll_findt + 1)
	if ll_finde > 0 then
		ls_signer = mid(iir_result.is_result,ll_findt,ll_finde - ll_findt )
	else
		ls_signer = ""
	end if
	if left(ls_signer, 1 ) = '"' Then ls_signer = mid( ls_signer, 2 )
	if right(ls_signer, 1 ) = '"' Then ls_signer = left( ls_signer, len( ls_signer ) - 1 )
	if ll_row <= upperbound(ltns__documentinformation.signature) then ltns__documentinformation.signature[ll_row].signStatus = ls_signer
	ll_findt = pos(lower(iir_result.is_result),lower(ls_findt),ll_findt)
loop

//signerip
ls_signer = ''
ll_row = 0
ls_findt = '"signerIP":'
ll_findt = pos(lower(iir_result.is_result),lower(ls_findt))
do while ll_findt > 0
	ll_row++
	ll_findt = ll_findt + len(ls_findt) 
	ll_finde = pos(iir_result.is_result,'"',ll_findt + 1)
	if ll_finde > 0 then
		ls_signer = mid(iir_result.is_result,ll_findt,ll_finde - ll_findt )
	else
		ls_signer = ""
	end if
	if left(ls_signer, 1 ) = '"' Then ls_signer = mid( ls_signer, 2 )
	if right(ls_signer, 1 ) = '"' Then ls_signer = left( ls_signer, len( ls_signer ) - 1 )
	if ll_row <= upperbound(ltns__documentinformation.signature) then ltns__documentinformation.signature[ll_row].signerip = ls_signer
	ll_findt = pos(lower(iir_result.is_result),lower(ls_findt),ll_findt)
loop

//signeddate
ls_signer = ''
ll_row = 0
ls_findt = '"signedDate":'
ll_findt = pos(lower(iir_result.is_result),lower(ls_findt))
do while ll_findt > 0
	ll_row++
	ll_findt = ll_findt + len(ls_findt) 
	ll_finde = pos(iir_result.is_result,'"',ll_findt + 1)
	if ll_finde > 0 then
		ls_signer = mid(iir_result.is_result,ll_findt,ll_finde - ll_findt )
	else
		ls_signer = ""
	end if
	if left(ls_signer, 1 ) = '"' Then ls_signer = mid( ls_signer, 2 )
	if right(ls_signer, 1 ) = '"' Then ls_signer = left( ls_signer, len( ls_signer ) - 1 )
	if ll_row <= upperbound(ltns__documentinformation.signature) then ltns__documentinformation.signature[ll_row].signeddate = ls_signer
	ll_findt = pos(lower(iir_result.is_result),lower(ls_findt),ll_findt)
loop

//roles
ls_signer = ''
ll_row = 0
ls_findt = '"roles":'
ll_findt = pos(lower(iir_result.is_result),lower(ls_findt))
do while ll_findt > 0
	ll_row++
	ll_findt = ll_findt + len(ls_findt) 
	ll_finde = pos(iir_result.is_result,'"',ll_findt + 1)
	if ll_finde > 0 then
		ls_signer = mid(iir_result.is_result,ll_findt,ll_finde - ll_findt )
	else
		ls_signer = ""
	end if
	if left(ls_signer, 1 ) = '"' Then ls_signer = mid( ls_signer, 2 )
	if right(ls_signer, 1 ) = '"' Then ls_signer = left( ls_signer, len( ls_signer ) - 1 )
	if ll_row <= upperbound(ltns__documentinformation.signature) then ltns__documentinformation.signature[ll_row].roles = ls_signer
	ll_findt = pos(lower(iir_result.is_result),lower(ls_findt),ll_findt)
loop

astr_agreement = ltns__documentinformation

return Long(ls_statuscode)




end function

public function integer of_esign_get_documents (string as_accesstoken, string as_esigntoken, string as_agreementid, ref str_esign_docinfo astr_docinfo);//====================================================================
// Function: of_esign_get_documents
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value        string               as_accesstoken
// 	value        string               as_esigntoken
// 	value        string               as_agreementid
// 	reference    str_esign_docinfo    astr_docinfo
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	Jay Chen		Date: 02-17-2016
//--------------------------------------------------------------------
//	Copyright (c) 2008-2014 ContractLogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

string ls_uri = ""
string ls_header
long ll_length,ll_row
string ls_args
blob lbl_args
string ls_action = ""
string ls_accesstoken,ls_agreementName,ls_agreementstatus
str_esign_docinfo lstr_esign_docinfo
int i, li_loop , ll_Result
string ls_signer,ls_docinfo

if isnull(gs_accesstoken) or trim(gs_accesstoken) = '' then gs_accesstoken = of_convert_json_token( )
If isnull(gs_accesstoken) or trim(gs_accesstoken) = '' then return -1
ls_accesstoken = gs_accesstoken

ls_action = "json/reply/GetDocumentsRequest"
ls_uri = is_webapi_url + ls_action
ls_args =  '{"AccessToken":"' + ls_accesstoken + '","EsignToken":"' + as_esigntoken + '","AgreementId":"' + as_agreementid +'"}'
lbl_args = blob(ls_args,EncodingUTF8!)
ll_length = len(ls_args)
ls_header = "Content-Type: application/json" + "~n" + "Content-Length: " + string(ll_length) + "~n~n"
//iinet_base.posturl(ls_uri,lbl_args,ls_header,ii_webapi_serverport,iir_result)
 of_postrequest( ls_uri,lbl_args,ls_header,ii_webapi_serverport,iir_result, 1,ii_TimeOut,"",ll_length)

string ls_statuscode = "1" 
string ls_findt 
ls_findt = '"ErrorCode":'
long ll_findt , ll_finde , ll_findend
ll_findt = pos(lower(iir_result.is_result),lower(ls_findt))

if ll_findt > 0 then
	ll_findt = ll_findt + len(ls_findt) 
	ll_finde = pos(iir_result.is_result,',',ll_findt + 1)
	if ll_finde > 0 then
		ls_statuscode = mid(iir_result.is_result,ll_findt,ll_finde - ll_findt )
	else
		ls_statuscode = "-1"
	end if
end if
if left( ls_statuscode, 1 ) = '"' Then ls_statuscode = mid( ls_statuscode, 2 )
if right( ls_statuscode, 1 ) = '"' Then ls_statuscode = left( ls_statuscode, len( ls_statuscode ) - 1 )
if ls_statuscode = '"-1"' then ls_statuscode = "-1" 
If Long (ls_statuscode )  < 0 Then return -1

//documentId
ls_docinfo = ''
ls_findt = '"documentId":'
ll_findt = pos(lower(iir_result.is_result),lower(ls_findt))
do while ll_findt > 0
	ll_findt = ll_findt + len(ls_findt) 
	ll_finde = pos(iir_result.is_result,'"',ll_findt + 1)
	if ll_finde > 0 then
		ls_docinfo = mid(iir_result.is_result,ll_findt,ll_finde - ll_findt )
	else
		ls_docinfo = ""
	end if
	if left(ls_docinfo, 1 ) = '"' Then ls_docinfo = mid( ls_docinfo, 2 )
	if right(ls_docinfo, 1 ) = '"' Then ls_docinfo = left( ls_docinfo, len( ls_docinfo ) - 1 )
	lstr_esign_docinfo.documentId[upperbound(lstr_esign_docinfo.documentId) + 1] = ls_docinfo
	ll_findt = pos(lower(iir_result.is_result),lower(ls_findt),ll_findt)
loop

//name
ls_docinfo = ''
ll_row = 0
ls_findt = '"name":'
ll_findt = pos(lower(iir_result.is_result),lower(ls_findt))
do while ll_findt > 0
	ll_row++
	ll_findt = ll_findt + len(ls_findt) 
	ll_finde = pos(iir_result.is_result,'"',ll_findt + 1)
	if ll_finde > 0 then
		ls_docinfo = mid(iir_result.is_result,ll_findt,ll_finde - ll_findt )
	else
		ls_docinfo = ""
	end if
	if left(ls_docinfo, 1 ) = '"' Then ls_docinfo = mid( ls_docinfo, 2 )
	if right(ls_docinfo, 1 ) = '"' Then ls_docinfo = left( ls_docinfo, len( ls_docinfo ) - 1 )
	if ll_row <= upperbound(lstr_esign_docinfo.documentId) then lstr_esign_docinfo.name[ll_row] = ls_docinfo
	ll_findt = pos(lower(iir_result.is_result),lower(ls_findt),ll_findt)
loop

//url
ls_docinfo = ''
ll_row = 0
ls_findt = '"url":'
ll_findt = pos(lower(iir_result.is_result),lower(ls_findt))
do while ll_findt > 0
	ll_row++
	ll_findt = ll_findt + len(ls_findt) 
	ll_finde = pos(iir_result.is_result,'"',ll_findt + 1)
	if ll_finde > 0 then
		ls_docinfo = mid(iir_result.is_result,ll_findt,ll_finde - ll_findt )
	else
		ls_docinfo = ""
	end if
	if left(ls_docinfo, 1 ) = '"' Then ls_docinfo = mid( ls_docinfo, 2 )
	if right(ls_docinfo, 1 ) = '"' Then ls_docinfo = left( ls_docinfo, len( ls_docinfo ) - 1 )
	if ll_row <= upperbound(lstr_esign_docinfo.documentId) then lstr_esign_docinfo.url[ll_row] = ls_docinfo
	ll_findt = pos(lower(iir_result.is_result),lower(ls_findt),ll_findt)
loop

astr_docinfo = lstr_esign_docinfo

return Long(ls_statuscode)




end function

public function integer of_to_bytearray (string as_source, string as_delimiter, ref byte abt_array[]);//====================================================================
// Function: of_To_ByteArray
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value        string    as_Source
// 	value        string    as_Delimiter
// 	reference    byte      abt_array[]
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	Jay Chen		Date: 02-17-2016
//--------------------------------------------------------------------
//	Copyright (c) 2008-2014 ContractLogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

long		ll_DelLen, ll_Pos, ll_Count, ll_Start, ll_Length
string 	ls_holder

//Check for NULL
IF IsNull(as_source) or IsNull(as_delimiter) Then
	long ll_null
	SetNull(ll_null)
	Return ll_null
End If

//Check for at leat one entry
If Trim (as_source) = '' Then
	Return 0
End If

//Get the length of the delimeter
ll_DelLen = Len(as_Delimiter)

ll_Pos =  Pos(Upper(as_source), Upper(as_Delimiter))

//Only one entry was found
if ll_Pos = 0 then
	abt_array[1] = Byte(Trim(as_source))
	return 1
end if

//More than one entry was found - loop to get all of them
ll_Count = 0
ll_Start = 1
Do While ll_Pos > 0
	
	//Set current entry
	ll_Length = ll_Pos - ll_Start
	ls_holder = Mid (as_source, ll_start, ll_length)

	// Update array and counter
	ll_Count ++
	abt_array[ll_Count] = Byte(Trim(ls_holder))
	
	//Set the new starting position
	ll_Start = ll_Pos + ll_DelLen

	ll_Pos =  Pos(Upper(as_source), Upper(as_Delimiter), ll_Start)
Loop

//Set last entry
ls_holder = Mid (as_source, ll_start, Len (as_source))

// Update array and counter if necessary
if Len (ls_holder) > 0 then
	ll_count++
	abt_array[ll_Count] = Byte(Trim(ls_holder))
end if

//Return the number of entries found
Return ll_Count

end function

public function integer of_esign_delete_document (string as_accesstoken, string as_esigntoken, string as_agreementid);//====================================================================
// Function: of_esign_delete_document
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value    string    as_accesstoken
// 	value    string    as_esigntoken
// 	value    string    as_agreementid
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	Jay Chen		Date: 02-17-2016
//--------------------------------------------------------------------
//	Copyright (c) 2008-2014 ContractLogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

string ls_uri = ""
string ls_header
long ll_length,ll_row
string ls_args
blob lbl_args
string ls_action = ""
string ls_accesstoken,ls_message
int i, li_loop , ll_Result
string ls_signer

if isnull(gs_accesstoken) or trim(gs_accesstoken) = '' then gs_accesstoken = of_convert_json_token( )
If isnull(gs_accesstoken) or trim(gs_accesstoken) = '' then return -1
ls_accesstoken = gs_accesstoken

ls_action = "json/reply/DeleteDocumentsRequest"
ls_uri = is_webapi_url + ls_action
ls_args =  '{"AccessToken":"' + ls_accesstoken + '","EsignToken":"' + as_esigntoken + '","AgreementId":"' + as_agreementid +'"}'
lbl_args = blob(ls_args,EncodingUTF8!)
ll_length = len(ls_args)
ls_header = "Content-Type: application/json" + "~n" + "Content-Length: " + string(ll_length) + "~n~n"
//iinet_base.posturl(ls_uri,lbl_args,ls_header,ii_webapi_serverport,iir_result)
 of_postrequest( ls_uri,lbl_args,ls_header,ii_webapi_serverport,iir_result, 1,ii_TimeOut,"",ll_length)

string ls_statuscode = "1" 
string ls_findt 
ls_findt = '"ErrorCode":'
long ll_findt , ll_finde , ll_findend
ll_findt = pos(lower(iir_result.is_result),lower(ls_findt))

if ll_findt > 0 then
	ll_findt = ll_findt + len(ls_findt) 
	ll_finde = pos(iir_result.is_result,',',ll_findt + 1)
	if ll_finde > 0 then
		ls_statuscode = mid(iir_result.is_result,ll_findt,ll_finde - ll_findt )
	else
		ls_statuscode = "-1"
	end if
end if
if left( ls_statuscode, 1 ) = '"' Then ls_statuscode = mid( ls_statuscode, 2 )
if right( ls_statuscode, 1 ) = '"' Then ls_statuscode = left( ls_statuscode, len( ls_statuscode ) - 1 )
if ls_statuscode = '"-1"' then ls_statuscode = "-1" 
If Long (ls_statuscode )  < 0 Then return -1

ls_findt = '"Message":'
ll_findt = pos(lower(iir_result.is_result),lower(ls_findt))
if ll_findt > 0 then
	ll_findt = ll_findt + len(ls_findt) 
	ll_finde = pos(iir_result.is_result,'',ll_findt + 1)
	if ll_finde > 0 then
		ls_message = mid(iir_result.is_result,ll_findt,ll_finde - ll_findt )
	else
		ls_message = "-1"
	end if
end if
if left( ls_message, 1 ) = '"' Then ls_message = mid( ls_message, 2 )
if right( ls_message, 1 ) = '"' Then ls_message = left( ls_message, len( ls_message ) - 1 )
If Left(Lower(ls_message),5) = 'error' Then
	Messagebox('Error ','Failed to remove the esign request. ' + ls_message)
	Return -1
End If

return Long(ls_statuscode)




end function

public function string of_esign_download_document (string as_accesstoken, string as_esigntoken, string as_agreementid, string as_documentid, long al_doc_id);//====================================================================
// Function: of_esign_download_document
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value    string    as_accesstoken
// 	value    string    as_esigntoken
// 	value    string    as_agreementid
// 	value    string    as_documentid
//--------------------------------------------------------------------
// Returns:  string
//--------------------------------------------------------------------
// Author:	Jay Chen		Date: 02-17-2016
//--------------------------------------------------------------------
//	Copyright (c) 2008-2014 ContractLogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

string ls_uri = ""
string ls_header
long ll_length,ll_row,li_rtn
string ls_args
blob lbl_args,lb_doc
byte lbyte[]
string ls_action = ""
string ls_accesstoken,ls_agreementName,ls_agreementstatus
str_esign_docinfo lstr_esign_docinfo
int i, li_loop , ll_Result
string ls_signer,ls_docinfo,ls_filename,ls_SertifiDirectory
Long ll_max,ll_readlength,ll_writelength
w_appeon_gifofwait lw_appeon_gifofwait
n_cst_dm_utils lnv_dm_utils

if isnull(gs_accesstoken) or trim(gs_accesstoken) = '' then gs_accesstoken = of_convert_json_token( )
If isnull(gs_accesstoken) or trim(gs_accesstoken) = '' then return ''
ls_accesstoken = gs_accesstoken

If not isvalid(lw_appeon_gifofwait) Then OpenwithParm(lw_appeon_gifofwait,"Downloading document from esign server...")		
//Get the file name
ll_max = 100
ls_SertifiDirectory = gs_dir_path + gs_DefDirName + "\Sertifi"
gnv_appeondll.of_parsepath(ls_SertifiDirectory)
IF NOT DirectoryExists(ls_SertifiDirectory) THEN 
	If isvalid(lw_appeon_gifofwait) Then Close(lw_appeon_gifofwait)   //Added by Harry 2017-03-16
	RETURN ""
END IF
For i = 1 To ll_max
	If i = 1 Then
		ls_FileName = ls_SertifiDirectory + "\Document" + String(al_doc_id) + "_signed.pdf"
	Else
		ls_FileName = ls_SertifiDirectory + "\Document" + String(al_doc_id) + "_signed_" +String(i)+".pdf"
	End If
	If FileExists(ls_filename) Then
		If Not FileDelete(ls_filename) Then
			If i = ll_max Then
				If isvalid(lw_appeon_gifofwait) Then Close(lw_appeon_gifofwait)
				Return ''
			End If
			Continue
		Else
			Exit
		End If
	Else
		Exit
	End If
Next

ls_action = "json/reply/DownloadAgreementDocumentRequest"
ls_uri = is_webapi_url + ls_action
ls_args =  '{"AccessToken":"' + ls_accesstoken + '","EsignToken":"' + as_esigntoken + '","AgreementId":"' + as_agreementid + '","DocumentId":"' + as_documentid +'"}'
lbl_args = blob(ls_args,EncodingUTF8!)
ll_length = len(ls_args)
ls_header = "Content-Type: application/json" + "~n" + "Content-Length: " + string(ll_length) + "~n~n"
//iinet_base.posturl(ls_uri,lbl_args,ls_header,ii_webapi_serverport,iir_result)
 of_postrequest( ls_uri,lbl_args,ls_header,ii_webapi_serverport,iir_result, 1,ii_TimeOut,"",ll_length)

string ls_statuscode = "1" 
string ls_findt 
ls_findt = '"ErrorCode":'
long ll_findt , ll_finde , ll_findend
ll_findt = pos(lower(iir_result.is_result),lower(ls_findt))

if ll_findt > 0 then
	ll_findt = ll_findt + len(ls_findt) 
	ll_finde = pos(iir_result.is_result,',',ll_findt + 1)
	if ll_finde > 0 then
		ls_statuscode = mid(iir_result.is_result,ll_findt,ll_finde - ll_findt )
	else
		ls_statuscode = "-1"
	end if
end if
if left( ls_statuscode, 1 ) = '"' Then ls_statuscode = mid( ls_statuscode, 2 )
if right( ls_statuscode, 1 ) = '"' Then ls_statuscode = left( ls_statuscode, len( ls_statuscode ) - 1 )
if ls_statuscode = '"-1"' then ls_statuscode = "-1" 
//If Long (ls_statuscode )  < 0 Then return ''
//Modified by Harry 2017-03-16
If Long (ls_statuscode )  < 0 Then
	If isvalid(lw_appeon_gifofwait) Then Close(lw_appeon_gifofwait)
	return ''
End If

//download from database
if ls_statuscode = '0' then
	li_rtn = lnv_dm_utils.of_download_echosign_file(as_agreementid,as_documentid,ls_filename)
	if isvalid(w_export_progress) then	w_export_progress.hpb_1.position = 100
	if li_rtn = 1 then
		DELETE FROM esign_download_file
		WHERE agreementid = :as_agreementid 
		AND documentid = :as_documentid 
		AND downloadid = (SELECT max(downloadid)FROM esign_download_file WHERE agreementid = :as_agreementid AND documentid = :as_documentid);
	end if
	if isvalid( w_export_progress) then close(w_export_progress)
else
	If isvalid(lw_appeon_gifofwait) Then Close(lw_appeon_gifofwait)  //Added by Harry 2017-03-16
	return ''
end if

If isvalid(lw_appeon_gifofwait) Then Close(lw_appeon_gifofwait)  //Added by Harry 2017-03-16
////document
//ls_docinfo = ''
//ls_findt = '"document":'
//ll_findt = pos(lower(iir_result.is_result),lower(ls_findt))
//if ll_findt > 0 then
//	ll_findt = ll_findt + len(ls_findt) 
//	ll_finde = pos(iir_result.is_result,']',ll_findt + 1)
//	if ll_finde > 0 then
//		ls_docinfo = mid(iir_result.is_result,ll_findt,ll_finde - ll_findt )
//	else
//		ls_docinfo = ""
//	end if
//	if left(ls_docinfo, 1 ) = '"' Then ls_docinfo = mid( ls_docinfo, 2 )
//	if right(ls_docinfo, 1 ) = '"' Then ls_docinfo = left( ls_docinfo, len( ls_docinfo ) - 1 )
//	if left(ls_docinfo, 1 ) = '[' Then ls_docinfo = mid( ls_docinfo, 2 )
//	if right(ls_docinfo, 1 ) = ']' Then ls_docinfo = left( ls_docinfo, len( ls_docinfo ) - 1 )
//
//	of_to_bytearray(ls_docinfo, ',', lbyte[])
//	
//	//Write blob into file
//	lb_doc = blob(lbyte)
//	ll_readlength = Len(lb_doc)
//	If ll_readlength = 0 Then
//		If isvalid(lw_appeon_gifofwait) Then Close(lw_appeon_gifofwait)
//		Return ""
//	End If
//	ll_writelength = AppeonWriteFile(ls_FileName, lb_doc, ll_readlength)
//	If isvalid(lw_appeon_gifofwait) Then Close(lw_appeon_gifofwait)
//	if ll_writelength < 0 then return ""
//	
//else
//	return ''
//end if
//

return ls_filename




end function

public function integer of_esign_create_agreement (string as_accesstoken, string as_esigntoken, string as_recipient, string as_sign_type, string as_sign_flow, string as_message, string as_doc_id, string as_cc, ref string as_agreementid, ref string as_documentid, ref string as_result, string as_name);//====================================================================
// Function: of_esign_create_agreement
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value        string    as_accesstoken
// 	value        string    as_esigntoken
// 	value        string    as_recipient
// 	value        string    as_sign_type
// 	value        string    as_sign_flow
// 	value        string    as_message
// 	value        string    as_doc_id
// 	value        string    as_cc
// 	reference    string    as_agreementid
// 	reference    string    as_documentid
// 	reference    string    as_result
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	Jay Chen		Date: 02-17-2016
//--------------------------------------------------------------------
//	Copyright (c) 2008-2014 ContractLogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

string ls_uri = ""
string ls_header
long ll_length
string ls_args
blob lbl_args
string ls_action = ""
string ls_accesstoken

int i, li_loop , ll_Result


if isnull(gs_accesstoken) or trim(gs_accesstoken) = '' then gs_accesstoken = of_convert_json_token( )
If isnull(gs_accesstoken) or trim(gs_accesstoken) = '' then return -1
ls_accesstoken = gs_accesstoken

ls_action = "json/reply/CreateAgreementRequest"
ls_uri = is_webapi_url + ls_action
ls_args =  '{"AccessToken":"' + ls_accesstoken + '","EsignToken":"' + as_esigntoken + '","name":"' + as_name + '","recipients":"' + as_recipient
ls_args = ls_args + '","sign_type":"' + as_sign_type + '","sign_flow":"' + as_sign_flow + '","message":"' + as_message+ '","documentIds":"' + as_doc_id + '","ccs":"' + as_cc +'"}'
lbl_args = blob(ls_args,EncodingUTF8!)
ll_length = len(ls_args)
ls_header = "Content-Type: application/json" + "~n" + "Content-Length: " + string(ll_length) + "~n~n"
//iinet_base.posturl(ls_uri,lbl_args,ls_header,ii_webapi_serverport,iir_result)
ll_Result = of_postrequest( ls_uri,lbl_args,ls_header,ii_webapi_serverport,iir_result, 1,ii_TimeOut,"",ll_length)

If ll_Result = -8 Then Return -8  //Added By Harry 2017-02-03

string ls_statuscode = "1" 
string ls_findt 
ls_findt = '"ErrorCode":'
long ll_findt , ll_finde , ll_findend
ll_findt = pos(lower(iir_result.is_result),lower(ls_findt))

if ll_findt > 0 then
	ll_findt = ll_findt + len(ls_findt) 
	ll_finde = pos(iir_result.is_result,',',ll_findt + 1)
	if ll_finde > 0 then
		ls_statuscode = mid(iir_result.is_result,ll_findt,ll_finde - ll_findt )
	else
		ls_statuscode = "-1"
	end if
end if
if left( ls_statuscode, 1 ) = '"' Then ls_statuscode = mid( ls_statuscode, 2 )
if right( ls_statuscode, 1 ) = '"' Then ls_statuscode = left( ls_statuscode, len( ls_statuscode ) - 1 )
if ls_statuscode = '"-1"' then ls_statuscode = "-1" 
If Long (ls_statuscode )  < 0 Then return -1


as_agreementid = ""
ls_findt = '"AgreementId":'
ll_findt = pos(lower(iir_result.is_result),lower(ls_findt))
if ll_findt > 0 then
	ll_findt = ll_findt + len(ls_findt) 
	ll_finde = pos(iir_result.is_result,'"',ll_findt + 1)
	if ll_finde > 0 then
		as_agreementid = mid(iir_result.is_result,ll_findt,ll_finde - ll_findt )
	else
		as_agreementid = ""
	end if
end if
if left(as_agreementid, 1 ) = '"' Then as_agreementid = mid( as_agreementid, 2 )
if right(as_agreementid, 1 ) = '"' Then as_agreementid = left( as_agreementid, len( as_agreementid ) - 1 )
if len(as_agreementid) < 1 then return -1

as_documentid = ""
ls_findt = '"documentId":'
ll_findt = pos(lower(iir_result.is_result),lower(ls_findt))
if ll_findt > 0 then
	ll_findt = ll_findt + len(ls_findt) 
	ll_finde = pos(iir_result.is_result,'"',ll_findt + 1)
	if ll_finde > 0 then
		as_documentid = mid(iir_result.is_result,ll_findt,ll_finde - ll_findt )
	else
		as_documentid = ""
	end if
end if
if left(as_documentid, 1 ) = '"' Then as_documentid = mid( as_documentid, 2 )
if right(as_documentid, 1 ) = '"' Then as_documentid = left( as_documentid, len( as_documentid ) - 1 )

as_result = ''
ls_findt = '"Message":'
ll_findt = pos(lower(iir_result.is_result),lower(ls_findt))
if ll_findt > 0 then
	ll_findt = ll_findt + len(ls_findt) 
	ll_finde = pos(iir_result.is_result,'"',ll_findt + 1)
	if ll_finde > 0 then
		as_result = mid(iir_result.is_result,ll_findt,ll_finde - ll_findt )
	else
		as_result = ""
	end if
end if
if left(as_result, 1 ) = '"' Then as_result = mid( as_result, 2 )
if right(as_result, 1 ) = '"' Then as_result = left( as_result, len( as_result ) - 1 )

return Long(ls_statuscode)




end function

public function integer of_setautoalarm (boolean ab_setauto, string as_user, string as_times);//====================================================================
// Function: of_setautoalarm
//--------------------------------------------------------------------
// Description: add RunningTime  Arguments
//--------------------------------------------------------------------
// Arguments:
// 	value    boolean    ab_setauto
// 	value    string     as_user
// 	value    string     as_times
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	Jay		Date: 2016-07-21
//--------------------------------------------------------------------
//	Copyright (c) 2008-2013 Contractlogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
string ls_uri = ""
string ls_header
long ll_length
string ls_args
blob lbl_args
string ls_action = ""
Integer	li_return

ls_action = "/json/reply/SetAutoAlarm"

//ls_args = "?accesstoken=" + as_accesstoken
if isnull(gs_accesstoken) or trim(gs_accesstoken) = '' then gs_accesstoken = of_convert_json_token( )
If  isnull(gs_accesstoken) or trim(gs_accesstoken) = '' then return -1

//Modified By Jay 2016-07-21 add RunningTime
If ab_setauto Then
	ls_args = '{"AccessToken":"' + gs_accesstoken + '", "AutoAlarm":"'+ string( ab_setauto )    +  '","RunningTime":"' + as_times + '","User":"' + as_User + '"}'
Else
	ls_args = '{"AccessToken":"' + gs_accesstoken + '", "AutoAlarm":"'+ string( ab_setauto )    +  '","RunningTime":"","User":""}'
End If
ls_uri = is_webapi_url + ls_action

lbl_args = blob(ls_args,EncodingUTF8!)
ll_length = len(ls_args)
ls_header = "Content-Type: application/json" + "~n" + "Content-Length: " + string(ll_length) + "~n~n"
//li_return = iinet_base.posturl(ls_uri,lbl_args,ls_header,ii_webapi_serverport,iir_result)
li_return = of_postrequest( ls_uri,lbl_args,ls_header,ii_webapi_serverport,iir_result, 1,ii_TimeOut, "",ll_length )//modified by gavins 20140611
If li_return <> 1 Then
	Messagebox( 'Set auto alarm error information', 'Error Code: ' + string( li_return ) )
	Return -1
End If
errorcode = iir_result.errorcode
//iinet_base.geturl(ls_uri,iir_result)
return 0 

end function

public function string of_get_salesforce_objects (string as_user, string as_pwd, string as_oname, string as_url);
string ls_uri = ""
string ls_header
long ll_length
string ls_args
blob lbl_args
string ls_action = ""
Integer	li_return
string	ls_Result

ls_action = "/json/reply/ExtractSalesforceMetadata"

//ls_args = "?accesstoken=" + as_accesstoken
if isnull(gs_accesstoken) or trim(gs_accesstoken) = '' then gs_accesstoken = of_convert_json_token( )
If  isnull(gs_accesstoken) or trim(gs_accesstoken) = '' then return ""
//Modified by gavins 20161223
ls_args = '{"AccessToken":"' + gs_accesstoken + '", "SFUser":"'+ string( as_user )    + '", "SFPassword":"'+ string( as_pwd )  + '","SFURL":"' + as_url +  '","ObjectName":"' + as_oname + '"}'
ls_uri = is_webapi_url + ls_action

lbl_args = blob(ls_args,EncodingUTF8!)
ll_length = len(ls_args)
ls_header = "Content-Type: application/json" + "~n" + "Content-Length: " + string(ll_length) + "~n~n"
li_return = of_postrequest( ls_uri,lbl_args,ls_header,ii_webapi_serverport,iir_result, 1,ii_TimeOut , "",ll_length )//modified by gavins 20140611
//li_return = iinet_base.posturl(ls_uri,lbl_args,ls_header,ii_webapi_serverport,iir_result)
If li_return <> 1 Then
	Messagebox( 'Set auto alarm error information', 'Error Code: ' + string( li_return ) )
	Return ""
End If
errorcode = iir_result.errorcode
ls_Result = iir_result.is_result

return ls_Result

end function

public function long of_outboundexternaldata (string as_user, string as_pwd, string as_externalyype, long al_ctx_id, long al_doc_id, long al_product_id, long al_product_type, long al_export_id, ref string as_salesforce_id, string as_sfurl, long al_facility_id, long al_contact_id);string ls_uri = ""
string ls_header
long ll_length
string ls_args
blob lbl_args
string ls_action = ""
Integer	li_return
string	ls_Result

ls_action = "/json/reply/OutboundExternalData"

if isnull(gs_accesstoken) or trim(gs_accesstoken) = '' then gs_accesstoken = of_convert_json_token( )
If  isnull(gs_accesstoken) or trim(gs_accesstoken) = '' then return -1

ls_args = '{"AccessToken":"' + string(gs_accesstoken) + '","ExternalType":' + string(as_externalyype) + ',"AuthUser":' + string(as_user) 
ls_args = ls_args + ',"AuthPassword":"' + string(as_pwd) + '","SFURL":"' + as_sfurl +  '","CtxId":"' + string(al_ctx_id) + '","DocId":' + string(al_doc_id) //modified by gavins 20161223
ls_args = ls_args + ',"ProductId":"' + string(al_product_id) + '","ProductType":"' + string(al_product_type) + '","ExportRoleId":' + string(al_export_id) //modified by harry 20170320 + '}'
ls_args = ls_args + ',"FacilityId":"' + string(al_facility_id) + '","ContactId":' + string(al_contact_id) + '}'  //added by harry 20170320

ls_uri = is_webapi_url + ls_action

lbl_args = blob(ls_args,EncodingUTF8!)
ll_length = len(ls_args)
ls_header = "Content-Type: application/json" + "~n" + "Content-Length: " + string(ll_length) + "~n~n"
of_postrequest( ls_uri,lbl_args,ls_header,ii_webapi_serverport,iir_result, 1,ii_TimeOut , "",ll_length )//modified by gavins 20140611
//li_return = iinet_base.posturl(ls_uri,lbl_args,ls_header,ii_webapi_serverport,iir_result)
	
string ls_statuscode = "0" //modified by gavins 20140421 change statuscode to errorcode 
string ls_findt 
ls_findt = '"ErrorCode":'
long ll_findt , ll_finde , ll_findend
ll_findt = pos(lower(iir_result.is_result),lower(ls_findt))

if ll_findt > 0 then
	ll_findt = ll_findt + len(ls_findt) 
	ll_finde = pos(iir_result.is_result,',',ll_findt + 1)
	if ll_finde > 0 then
		ls_statuscode = mid(iir_result.is_result,ll_findt,ll_finde - ll_findt )
	else
		ls_statuscode = "-1"
	end if
end if
if left( ls_statuscode, 1 ) = '"' Then ls_statuscode = mid( ls_statuscode, 2 )
if right( ls_statuscode, 1 ) = '"' Then ls_statuscode = left( ls_statuscode, len( ls_statuscode ) - 1 )
if ls_statuscode = '"-1"' then ls_statuscode = "-1" //Added By Jay Chen 04-22-2014

as_salesforce_id = ""
ls_findt = '"ExternalID":'
ll_findt = pos(lower(iir_result.is_result),lower(ls_findt))
if ll_findt > 0 then
	ll_findt = ll_findt + len(ls_findt) 
	ll_finde = pos(iir_result.is_result,'"',ll_findt + 1)
	if ll_finde > 0 then
		as_salesforce_id = mid(iir_result.is_result,ll_findt,ll_finde - ll_findt )
	else
		as_salesforce_id = ""
	end if
end if
if left( as_salesforce_id, 1 ) = '"' Then as_salesforce_id = mid( as_salesforce_id, 2 )
if right( as_salesforce_id, 1 ) = '"' Then as_salesforce_id = left( as_salesforce_id, len( as_salesforce_id ) - 1 )

return long(ls_statuscode)

end function

on n_cst_webapi.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_webapi.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;
iinet_base = create n_inet
iir_result = create n_iresult

is_webapi_url = ""
ii_webapi_serverport = 80
 of_GetWebServiceURL( )



end event

event destructor;if isvalid(iinet_base) then destroy iinet_base

if isvalid(iir_result) then destroy iir_result
end event

