$PBExportHeader$n_cst_sertifi.sru
forward
global type n_cst_sertifi from nonvisualobject
end type
end forward

global type n_cst_sertifi from nonvisualobject
end type
global n_cst_sertifi n_cst_sertifi

type variables
SoapConnection isoap_conn
//Sertifigatewaysoap isoap_sertifi
Sertifisertifisoap isoap_sertifi
String is_apicode,is_emailaddress
Long il_esign, il_complete,il_incomplete,il_signed,il_doccheckin,il_doc_signed,il_doc_declined, il_action_declined //added by gavins 20160525

Boolean ib_isvalid_sertifi = False

String ls_soap_link = 'http://web.contractlogix.com/templates/soapsdk.exe'
end variables

forward prototypes
public function string of_get_apicode ()
public function integer of_create ()
public function boolean of_check_sertifi ()
public function string of_paser_keyword (string as_source, string as_keyword)
public function long of_hex2dec (string as_hex)
public function string of_get_doc_maintance_link (str_sertifi_doc astr_sertifi_doc)
public function integer of_invite_again (str_sertifi_doc astr_sertifi_doc, string as_email)
public function string of_download_doc (str_sertifi_doc astr_sertifi_doc)
public function integer of_parse_file_status (string as_status_xml, ref str_sertifi_file astr_sertifi_file, ref string as_error)
public function integer of_show_sertifi_status (str_sertifi_doc astr_sertifi_doc, boolean ab_refresh)
public function integer of_show_sertifi_status (long al_docid, string as_es_docid, string as_type, boolean ab_refresh)
public function integer of_invitesigners (str_sertifi_doc astr_sertifi_doc, string as_user)
public function integer of_removesignaturerequest (str_sertifi_doc astr_sertifi_doc)
public function integer of_refresh_sertifi_status (long al_ctx_id, long al_doc_id)
public function boolean of_get_doc_signed_status (str_sertifi_doc astr_sertifi_doc)
public function boolean of_get_doc_signed_status (string as_sertifi_docid, str_sertifi_file astr_sertifi_file)
public function integer of_get_doc_status (str_sertifi_doc astr_sertifi_doc, ref str_sertifi_file astr_sertifi_file, boolean ab_showerror)
public function integer of_refresh_sertifi_status ()
public function integer of_ping_apicode (string as_apicode)
public function integer of_ping_apicode ()
public function boolean of_check_sertifi (boolean ab_ping_apicode)
public function boolean of_ping_sertifi_server ()
public function boolean of_check_sertifi (boolean ab_ping_apicode, string as_apicode, boolean ab_personal_data)
end prototypes

public function string of_get_apicode ();is_apicode = gnv_data.of_getitem( 'icred_settings', 'es_apicode', False)
Return is_apicode
end function

public function integer of_create ();long ll_ret = -1

If isvalid(isoap_sertifi) Then Return 0

Try
	isoap_conn = Create SoapConnection
//	ll_ret = isoap_conn.CreateInstance(isoap_sertifi, "sertifigatewaysoap")
	ll_ret = isoap_conn.CreateInstance(isoap_sertifi, "Sertifisertifisoap")
	If ll_ret <> 0 Then
		If isvalid(isoap_sertifi) Then Destroy isoap_sertifi
	End If
Catch (throwable e1)
	If isvalid(isoap_sertifi) Then Destroy isoap_sertifi
	Return -1
End Try

Return ll_ret
end function

public function boolean of_check_sertifi ();Return of_check_sertifi(True)



end function

public function string of_paser_keyword (string as_source, string as_keyword);//////////////////////////////////////////////////////////////////////
// Function: of_paser_keyword()
// Arguments:
// 	value    string    as_source
// 	value    string    as_keyword
//--------------------------------------------------------------------
// Return:  string
//--------------------------------------------------------------------
// Author:	 Ken.Guo 2011-06-14.
//--------------------------------------------------------------------
// Description: Get value by Key Word from XML
//--------------------------------------------------------------------
//////////////////////////////////////////////////////////////////////
long ll_pos_start,ll_pos_end,ll_line_end
long ll_start,ll_end,ll_pos
String ls_line_value, ls_value
String ls_hex
Long ll_dec

If as_source = '' Then Return ''

//Get start position
ll_pos_start = Pos(as_source, '<' + as_keyword + '>')
If ll_pos_start = 0 Then Return ''
ll_line_end = Pos(as_source, '~n',ll_pos_start)

//Get Line Value of the Key Word
ls_line_value = Mid(as_source,ll_pos_start,ll_line_end - ll_pos_start )

//If no value
If Pos(ls_line_value,'/>') > 0 Then Return ''

//Get end position
ll_pos_end = Pos(as_source, '</' + as_keyword + '>',ll_pos_start )
If ll_pos_end = 0 Then Return ''

//Get value
ls_value = Mid(as_source, ll_pos_start + Len(as_keyword) + 2, ll_pos_end - (ll_pos_start + Len(as_keyword) + 2) )


If as_keyword = 'DocumentID' Then
	ll_pos = Pos(ls_value,'%',1)
	Do While ll_pos > 0 
		ls_hex = Mid(ls_value, ll_pos + 1, 2)
		ll_dec = This.of_hex2dec(ls_hex)
		ls_value = Replace( ls_value, ll_pos, 3, Char(ll_dec) )
		ll_pos = Pos(ls_value,'%',1)
	Loop
End If

Choose Case as_keyword
	Case 'DocumentID' ////Convert Hex to Dec for DocumentID.
		ll_pos = Pos(ls_value,'%',1)
		Do While ll_pos > 0 
			ls_hex = Mid(ls_value, ll_pos + 1, 2)
			ll_dec = This.of_hex2dec(ls_hex)
			ls_value = Replace( ls_value, ll_pos, 3, Char(ll_dec) )
			ll_pos = Pos(ls_value,'%',1)
		Loop		
	Case 'DateSigned','DateCreated' //Set 01/01/0001 to empty.
		If Pos(ls_value,'0001') > 0 Then
			ls_value = ''
		End If
End Choose



Return ls_value
end function

public function long of_hex2dec (string as_hex);//////////////////////////////////////////////////////////////////////
// Function: of_hex2dec()
// Arguments:
// 	value    string    as_hex
//--------------------------------------------------------------------
// Return:  long
//--------------------------------------------------------------------
// Author:	 Ken.Guo 2011-06-14.
//--------------------------------------------------------------------
// Description: Convert Hex to Dec numeric
//--------------------------------------------------------------------
//////////////////////////////////////////////////////////////////////

Long i,j, ll_value
String ls_char

For i = Len(as_hex) to 1 Step -1
	j++
	ls_char = Lower(Mid(as_hex,i,1))
	Choose Case ls_char
		Case '0'	to '9'
			ll_value += 16^(j - 1) * Long(ls_char)
		Case 'a' 
			ll_value += 16^(j - 1) * 10
		Case 'b'	
			ll_value += 16^(j - 1) * 11
		Case 'c'
			ll_value += 16^(j - 1) * 12
		Case 'd'
			ll_value += 16^(j - 1) * 13
		Case 'e'
			ll_value += 16^(j - 1) * 14
		Case 'f'
			ll_value += 16^(j - 1) * 15
	End Choose
Next
	
Return ll_value
end function

public function string of_get_doc_maintance_link (str_sertifi_doc astr_sertifi_doc);String ls_link = 'error'
SetPointer(HourGlass!)

If Not ib_isvalid_sertifi Then 
	If Not This.of_check_sertifi( ) Then Return ''
End If

Try
	ls_link = isoap_sertifi.GetMaintenanceLink( astr_sertifi_doc.as_es_apicode , astr_sertifi_doc.as_es_fileid )
Catch (Throwable	E2)	
	ib_isvalid_sertifi = False
	Messagebox('Error', E2.text )
End Try

If Left(Lower(ls_link),5) = 'error' Then
	ib_isvalid_sertifi = False
	Messagebox('Error',ls_link)
	Return ''
End If


Return ls_link
end function

public function integer of_invite_again (str_sertifi_doc astr_sertifi_doc, string as_email);//////////////////////////////////////////////////////////////////////
// Function: of_invite_again()
// Arguments:
// 	value    str_sertifi_doc    astr_sertifi_doc
// 	value    string             as_email
//--------------------------------------------------------------------
// Return:  integer
//--------------------------------------------------------------------
// Author:	 Ken.Guo 2011-06-15.
//--------------------------------------------------------------------
// Description: Sends out an email to the signer
//--------------------------------------------------------------------
//////////////////////////////////////////////////////////////////////
String ls_link = 'error'
SetPointer(HourGlass!)

If Not ib_isvalid_sertifi Then 
	If Not This.of_check_sertifi( ) Then Return -1
End If

Try	
	ls_link = isoap_sertifi.InviteSigner( astr_sertifi_doc.as_es_apicode , astr_sertifi_doc.as_es_fileid,'',as_email )
Catch (Throwable	E2)	
	ib_isvalid_sertifi = False
	Messagebox('Error', E2.text )
End Try

If Left(Lower(ls_link),5) = 'error' Then
	ib_isvalid_sertifi = False
	Messagebox('Error',ls_link)
	Return -1
End If

Return 1
end function

public function string of_download_doc (str_sertifi_doc astr_sertifi_doc);//////////////////////////////////////////////////////////////////////
// Function: of_download_doc()
// Arguments:
// 	value    str_sertifi_doc    astr_sertifi_doc
//--------------------------------------------------------------------
// Return:  string
//--------------------------------------------------------------------
// Author:	 Ken.Guo 2011-06-16.
//--------------------------------------------------------------------
// Description: Download the file from sertifi.
//--------------------------------------------------------------------
//////////////////////////////////////////////////////////////////////
Long ll_max,i,ll_readlength,ll_writelength
String ls_SertifiDirectory,ls_FileName
Blob lb_doc
w_appeon_gifofwait lw_appeon_gifofwait

If not isvalid(lw_appeon_gifofwait) Then OpenwithParm(lw_appeon_gifofwait,"Downloading document from sertifi server...")		


//Get the file name
ll_max = 100
ls_SertifiDirectory = gs_dir_path + gs_DefDirName + "\Sertifi"
gnv_appeondll.of_parsepath(ls_SertifiDirectory)
IF NOT DirectoryExists(ls_SertifiDirectory) THEN RETURN ""
For i = 1 To ll_max
	If i = 1 Then
		ls_FileName = ls_SertifiDirectory + "\Document" + String(astr_sertifi_doc.al_doc_id) + "_signed.pdf"
	Else
		ls_FileName = ls_SertifiDirectory + "\Document" + String(astr_sertifi_doc.al_doc_id) + "_signed_" +String(i)+".pdf"
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

//Download the file from sertifi
SetPointer(HourGlass!)
If Not ib_isvalid_sertifi Then 
	If Not This.of_check_sertifi( ) Then 
		If isvalid(lw_appeon_gifofwait) Then Close(lw_appeon_gifofwait)
		Return ''
	End If
End If

Try
	lb_doc = isoap_sertifi.downloadsigneddocument( astr_sertifi_doc.as_es_apicode , astr_sertifi_doc.as_es_fileid, astr_sertifi_doc.as_es_docid )
Catch (Throwable	E2)	
	Messagebox('Error', E2.text )
End Try	

//Write blob into file
ll_readlength = Len(lb_doc)

If ll_readlength = 0 Then 
	If isvalid(lw_appeon_gifofwait) Then Close(lw_appeon_gifofwait)
	Return ""
End If

ll_writelength = AppeonWriteFile(ls_FileName, lb_doc, ll_readlength)

If isvalid(lw_appeon_gifofwait) Then Close(lw_appeon_gifofwait)

if ll_writelength < 0 then return ""

If FileExists(ls_FileName) Then
	Return ls_FileName
Else
	Return ''
End If


end function

public function integer of_parse_file_status (string as_status_xml, ref str_sertifi_file astr_sertifi_file, ref string as_error);//////////////////////////////////////////////////////////////////////
// Function: of_parse_file_status()
// Arguments:
// 	value        string              as_status_xml
// 	reference    str_sertifi_file    lstr_sertifi_file
//--------------------------------------------------------------------
// Return:  integer
//--------------------------------------------------------------------
// Author:	 Ken.Guo 2011-06-14.
//--------------------------------------------------------------------
// Description: Parse XML to Structure
//--------------------------------------------------------------------
//////////////////////////////////////////////////////////////////////
Long ll_pos_code
String ls_file,ls_document,ls_signature[],ls_signature_empty[],ls_signatures,ls_documents
str_sertifi_file lstr_sertifi_file
Long ll_doc_pos,ll_sign_pos,ll_sign_end_pos,i,j,ll_email_pos,ll_email_next_pos

//Check XML
If as_status_xml = '' or isnull(as_status_xml) Then Return -1
If Pos(Lower(as_status_xml),'xml') <= 0 Then
	as_error = ' No XML data.'
End If

If Pos(as_status_xml,'<Document>') <= 0 Then 
	as_error = ' The document maybe has been removed on the sertifi server.'
	Return -2
End If

If Pos(as_status_xml,'<Signatures>') <= 0 Then 
	as_error = ' The signatures maybe have been removed on the sertifi server.'
	Return -3
End If


//Get Sertifi File Info
lstr_sertifi_file.code = This.of_paser_keyword( as_status_xml, 'Code')
lstr_sertifi_file.name = This.of_paser_keyword( as_status_xml, 'Name')
lstr_sertifi_file.Status = This.of_paser_keyword( as_status_xml, 'Status')

i = 0
ll_doc_pos = Pos(as_status_xml, '<Document>')
Do While ll_doc_pos > 0
	i++
	//Get Sertifi Document Info
	ls_documents = Mid(as_status_xml, ll_doc_pos)
	ls_document = This.of_paser_keyword( ls_documents, 'Document')
	lstr_sertifi_file.astr_sertifi_document[i].DocumentID  = This.of_paser_keyword( ls_document, 'DocumentID')
	lstr_sertifi_file.astr_sertifi_document[i].Name  = This.of_paser_keyword( ls_document, 'Name')
	lstr_sertifi_file.astr_sertifi_document[i].Status  = This.of_paser_keyword( ls_document, 'Status')
	lstr_sertifi_file.astr_sertifi_document[i].DateCreated  = This.of_paser_keyword( ls_document, 'DateCreated')	
	lstr_sertifi_file.astr_sertifi_document[i].DateSigned  = This.of_paser_keyword( ls_document, 'DateSigned')
		
	//Get Sertifi Signature Info
	ls_signature[] = ls_signature_empty[]
	ll_sign_pos = Pos(ls_document, '<Signatures>')
	ll_sign_end_pos = Pos(ls_document, '</Signatures>')
	If ll_sign_pos > 0 Then
		ls_signatures = This.of_paser_keyword( ls_document, 'Signatures')
		ll_email_pos = Pos(ls_document,'<Email>')
		If ll_email_pos <= 0 Then Continue
		ll_email_next_pos = Pos(ls_document,'<Email>',ll_email_pos + 7)
		Do While ll_email_next_pos > 0
			ls_signature[UpperBound(ls_signature[]) + 1] = Mid(ls_document,ll_email_pos, ll_email_next_pos - ll_email_pos )
			ll_email_pos = ll_email_next_pos
			ll_email_next_pos = Pos(ls_document,'<Email>',ll_email_pos + 7)
		Loop
		ls_signature[UpperBound(ls_signature[]) + 1] = Mid(ls_document,ll_email_pos, ll_sign_end_pos - ll_email_pos )

		For j = 1 To UpperBound(ls_signature[])
			lstr_sertifi_file.astr_sertifi_document[i].astr_sertifi_signature[j].Email  = This.of_paser_keyword( ls_signature[j], 'Email')
			lstr_sertifi_file.astr_sertifi_document[i].astr_sertifi_signature[j].NameSigned  = This.of_paser_keyword( ls_signature[j], 'NameSigned')
			lstr_sertifi_file.astr_sertifi_document[i].astr_sertifi_signature[j].IpAddress  = This.of_paser_keyword( ls_signature[j], 'IpAddress')
			lstr_sertifi_file.astr_sertifi_document[i].astr_sertifi_signature[j].SignMethod  = This.of_paser_keyword( ls_signature[j], 'SignMethod')
			lstr_sertifi_file.astr_sertifi_document[i].astr_sertifi_signature[j].DateSigned  = This.of_paser_keyword( ls_signature[j], 'DateSigned')
			lstr_sertifi_file.astr_sertifi_document[i].astr_sertifi_signature[j].SignerType  = This.of_paser_keyword( ls_signature[j], 'SignerType')
			lstr_sertifi_file.astr_sertifi_document[i].astr_sertifi_signature[j].CustomField1  = This.of_paser_keyword( ls_signature[j], 'CustomField1')
			lstr_sertifi_file.astr_sertifi_document[i].astr_sertifi_signature[j].CustomField2  = This.of_paser_keyword( ls_signature[j], 'CustomField2')
			lstr_sertifi_file.astr_sertifi_document[i].astr_sertifi_signature[j].CustomField3  = This.of_paser_keyword( ls_signature[j], 'CustomField3')
			lstr_sertifi_file.astr_sertifi_document[i].astr_sertifi_signature[j].CustomField4  = This.of_paser_keyword( ls_signature[j], 'CustomField4')
			ll_sign_pos = Pos(ls_document, '<Signatures>', ll_sign_pos + 12 )
		Next
	End IF

	
	ll_doc_pos = Pos(as_status_xml, '<Document>', ll_doc_pos + 10 )
Loop

astr_sertifi_file = lstr_sertifi_file

Return 1
end function

public function integer of_show_sertifi_status (str_sertifi_doc astr_sertifi_doc, boolean ab_refresh);str_sertifi_doc lstr_sertifi_doc_ret
OpenWithParm(w_dm_sertifi_status,astr_sertifi_doc)

SetPointer(HourGlass!)
//Refresh checkout status if document is signed.
If ab_refresh Then
	If isvalid(Message.powerobjectparm) Then
		lstr_sertifi_doc_ret = Message.powerobjectparm
		If astr_sertifi_doc.as_checkout_status <> lstr_sertifi_doc_ret.as_checkout_status and isvalid(gw_contract) Then
			
			If gw_contract.tab_contract_details.ib_select9 Then
			
				//Refresh the browse window if refresh status or checked in.
				gw_contract.tab_contract_details.tabpage_images.tab_1.tabpage_data.Event ue_retrieve( )
				gw_contract.tab_contract_details.tabpage_images.tab_1.tabpage_data.of_locate_doc(astr_sertifi_doc.al_doc_id)	
			
				If lstr_sertifi_doc_ret.as_checkout_status <> astr_sertifi_doc.as_checkout_status Then
					//Need Refresh Action Item after signed.
					If lstr_sertifi_doc_ret.as_checkout_status = '6' Then //5 become to 6
						If gw_contract.tab_contract_details.tabpage_images.tab_1.tabpage_action.of_get_doc_id() = astr_sertifi_doc.al_doc_id Then
							gw_contract.tab_contract_details.tabpage_images.tab_1.tabpage_action.of_retrieve() 
						End If
					End If
					//Begin - Added By Mark Lee 08/06/12 not exists parameter
//					//Refresh Audit after do checked in
//					If lstr_sertifi_doc_ret.as_checkout_status = '0' Then 
//						gw_contract.tab_contract_details.tabpage_images.tab_1.tabpage_action.Event ue_do('ue_retrieve')
//					End If 
					//End - Added By Mark Lee 08/06/12
				End If
			End If
		Else
		End If
	End If
End If

If astr_sertifi_doc.as_checkout_status = lstr_sertifi_doc_ret.as_checkout_status Then
	Return 0  //no change
Else
	Return 1 //changed
End If


end function

public function integer of_show_sertifi_status (long al_docid, string as_es_docid, string as_type, boolean ab_refresh);str_sertifi_doc lstr_sertifi_doc 
String ls_es_docid

If isnull(as_es_docid) or as_es_docid = '' Then 
	Messagebox('tip','No sertifi document data.')
	Return -1
End If

gnv_appeondb.of_startqueue( )
	Select Top 1 doc_name = (select doc_name from ctx_am_document where doc_id = :al_docid) ,  ctx_am_doc_audit.es_apicode,ctx_am_doc_audit.es_fileid,ctx_am_doc_audit.es_docid,ctx_am_doc_audit.es_sender,ctx_am_doc_audit.es_sender_email 
	Into :lstr_sertifi_doc.as_filename, :lstr_sertifi_doc.as_es_apicode, :lstr_sertifi_doc.as_es_fileid, :lstr_sertifi_doc.as_es_docid, :lstr_sertifi_doc.as_es_sender, :lstr_sertifi_doc.as_es_email 
	From ctx_am_action_item, Ctx_am_doc_audit 
	Where ctx_am_action_item.doc_id =:al_docid And ctx_am_action_item.doc_id = Ctx_am_doc_audit.doc_id And Ctx_am_doc_audit.es_docid = :as_es_docid ;
	
	Select checkout_by, checkout_status, es_docid
	Into :lstr_sertifi_doc.as_checkout_by, :lstr_sertifi_doc.as_checkout_status ,:ls_es_docid
	From ctx_am_document
	Where doc_id = :al_docid;
gnv_appeondb.of_commitqueue( )

If ls_es_docid = lstr_sertifi_doc.as_es_docid Then
	//ignore
Else
	//not allow check in
	lstr_sertifi_doc.as_checkout_by = ''
	lstr_sertifi_doc.as_checkout_status = '0'
End If

lstr_sertifi_doc.as_type = as_type
lstr_sertifi_doc.al_doc_id = al_docid

Return This.of_show_sertifi_status( lstr_sertifi_doc, ab_refresh)


end function

public function integer of_invitesigners (str_sertifi_doc astr_sertifi_doc, string as_user);
String ls_ret = 'error'
SetPointer(HourGlass!)

If Not ib_isvalid_sertifi Then 
	If Not This.of_check_sertifi( ) Then Return -1
End If

Try
	ls_ret = isoap_sertifi.invitesigners(astr_sertifi_doc.as_es_apicode , astr_sertifi_doc.as_es_fileid, as_user)
Catch (Throwable	E2)	
	ib_isvalid_sertifi = False
	Messagebox('Error', E2.text )
End Try

If Left(Lower(ls_ret),5) = 'error' Then
	ib_isvalid_sertifi = False
	Messagebox('Error',ls_ret)
	Return -1
End If


Return 1


end function

public function integer of_removesignaturerequest (str_sertifi_doc astr_sertifi_doc);
String ls_ret = 'error'
SetPointer(HourGlass!)

If Not ib_isvalid_sertifi Then 
	If Not This.of_check_sertifi( ) Then Return -1
End If

Try
	ls_ret = isoap_sertifi.removesignaturerequest(astr_sertifi_doc.as_es_apicode, astr_sertifi_doc.as_es_fileid)
Catch (Throwable	E2)	
	ib_isvalid_sertifi = False
	Messagebox('Error', E2.text )
End Try

If Left(Lower(ls_ret),5) = 'error' Then
	ib_isvalid_sertifi = False
	Messagebox('Error ','Failed to remove the signature request. ' + ls_ret)
	Return -1
End If


Return 1
end function

public function integer of_refresh_sertifi_status (long al_ctx_id, long al_doc_id);//////////////////////////////////////////////////////////////////////
// Function: of_refresh_sertifi_status()
// Arguments:
// 	value    long    al_ctx_id
// 	value    long    al_doc_id
//--------------------------------------------------------------------
// Return:  integer
//--------------------------------------------------------------------
// Author:	 Ken.Guo 2011-06-21.
//--------------------------------------------------------------------
// Description: Refresh the Sertifi Document Status, Reset Action Status.
//--------------------------------------------------------------------
//////////////////////////////////////////////////////////////////////
Long i,ll_cnt,j
String ls_filter,ls_es_fileid,ls_es_apicode,ls_docid_list,ls_es_docid_list,ls_sql
boolean lb_need_refresh
n_ds lds_waiting_sign
str_sertifi_doc lstr_sertifi_doc ,str_sertifi_doc_temp
str_sertifi_file lstr_sertifi_file,lstr_sertifi_file_temp
w_appeon_gifofwait lw_appeon_gifofwait
long ll_seq_no1,ll_seq_no2 //Added By Ken.Guo 2016-07-18
str_action_item lstr_action_declined[],lstr_action_signed[] //Added By Ken.Guo 2016-07-18


//Check Sertifi Module whether set to On.
If gnv_data.of_getitem( 'icred_settings', 'esign', False) = '1' Then
	//On
Else
	Return -1
End If

//Get waiting sign documents
lds_waiting_sign = Create n_ds
lds_waiting_sign.Dataobject = 'd_am_sertifi_doc_waiting_sign'
lds_waiting_sign.SetTransObject(SQLCA)
//Added By Mark Lee 08/06/12
lds_waiting_sign.of_set_idle_flag( False)

lds_waiting_sign.Retrieve()
ls_filter = '1 = 1 '
If al_ctx_id > 0 Then
	ls_filter += ' and ctx_id = ' + string(al_ctx_id)
End If
If al_doc_id > 0 Then
	ls_filter += ' and doc_id = ' + string(al_doc_id)
End If
ls_filter += " and esign_type = 'sertifi'"  //Added By Jay Chen 10-11-2013
lds_waiting_sign.SetFilter(ls_filter)
lds_waiting_sign.Filter()
ll_cnt = lds_waiting_sign.Rowcount( ) 
If ll_cnt = 0 Then Return 1

If Not ib_isvalid_sertifi Then 
	If Not This.of_check_sertifi( ) Then Return -1
End If

If not isvalid(lw_appeon_gifofwait) Then OpenwithParm(lw_appeon_gifofwait,"Retrieving E-sign documents status from sertifi server...")
timer(0,lw_appeon_gifofwait)
lw_appeon_gifofwait.of_setmaxposition(ll_cnt+2)

//Get Sertifi Sign Status
For i = 1 To ll_cnt
	lw_appeon_gifofwait.of_settext("Retrieving E-sign documents status from sertifi server "+String(i)+'/'+String(ll_cnt)+"...")
	lw_appeon_gifofwait.of_setposition(i)
	
	lstr_sertifi_doc = str_sertifi_doc_temp
	lstr_sertifi_doc.al_ctx_id = lds_waiting_sign.GetItemNumber(i, 'ctx_id') //Added By Ken.Guo 2016-07-18
	lstr_sertifi_doc.al_doc_id = lds_waiting_sign.GetItemNumber(i, 'doc_id')
	lstr_sertifi_doc.as_es_apicode =  lds_waiting_sign.GetItemString(i, 'es_apicode')
	lstr_sertifi_doc.as_es_fileid =  lds_waiting_sign.GetItemString(i, 'es_fileid')
	lstr_sertifi_doc.as_es_docid =  lds_waiting_sign.GetItemString(i, 'es_docid')
	lstr_sertifi_doc.as_es_sender =  lds_waiting_sign.GetItemString(i, 'es_sender')
	lstr_sertifi_doc.as_es_email =  lds_waiting_sign.GetItemString(i, 'es_sender_email')
	
	If ls_es_apicode = lstr_sertifi_doc.as_es_apicode and ls_es_fileid = lstr_sertifi_doc.as_es_fileid Then
		//Use prior lstr_sertifi_file when same fileid
	Else
		lstr_sertifi_file = lstr_sertifi_file_temp
		If This.of_get_doc_status( lstr_sertifi_doc, lstr_sertifi_file,false) < 0 Then Continue
	End If
	
	For j = 1 to UpperBound(lstr_sertifi_file.astr_sertifi_document[]) 
		If lower(lstr_sertifi_file.astr_sertifi_document[j].Status) = "declined"  then
//			If gnv_sertifi.il_doc_declined > 0 Then //move down
//				Update Ctx_am_document Set status = :gnv_sertifi.il_doc_declined  Where doc_id = :lstr_sertifi_doc.al_doc_id;
//			End If
			//added by gavins 20160525 action item status //or Action_type = :gnv_docusign.il_doccheckin			
			If gnv_sertifi.il_action_declined > 0 Then
				gnv_appeondb.of_startqueue( ) //Added By Ken.Guo 2016-07-18
					Update Ctx_am_document Set status = :gnv_sertifi.il_doc_declined  Where doc_id = :lstr_sertifi_doc.al_doc_id;
					
					//Get Actin Item ID //Added By Ken.Guo 2016-07-18
					Select Top 1 seq_id into  :lstr_sertifi_doc.al_ai_seq_id From 	ctx_am_action_item 
						Where 	doc_id = :lstr_sertifi_doc.al_doc_id and (Action_type = :gnv_sertifi.il_esign  ) 	
								and Action_status = :gnv_sertifi.il_incomplete and (es_docid = :lstr_sertifi_doc.as_es_docid) ;	
								
					Update ctx_am_action_item Set Action_status = :gnv_sertifi.il_action_declined
						Where doc_id = :lstr_sertifi_doc.al_doc_id and (Action_type = :gnv_sertifi.il_esign  )  
								and Action_status = :gnv_sertifi.il_incomplete and (es_docid = :lstr_sertifi_doc.as_es_docid or es_docid is null) ;
				gnv_appeondb.of_commitqueue( )
			end If
			lb_need_refresh = true
			Exit
		end if	
	Next
	
	//Added By Ken.Guo 2016-07-18. Trigger AI change WF for declined
	If lstr_sertifi_doc.al_ai_seq_id > 0 Then
		lstr_action_declined[UpperBound(lstr_action_declined[])+1].doc_id = lstr_sertifi_doc.al_doc_id
		lstr_action_declined[UpperBound(lstr_action_declined[])].seq_no = lstr_sertifi_doc.al_ai_seq_id
		lstr_action_declined[UpperBound(lstr_action_declined[])].ctx_id =  lstr_sertifi_doc.al_ctx_id
		lstr_action_declined[UpperBound(lstr_action_declined[])].wf_action_status_id = gnv_sertifi.il_action_declined
		lstr_action_declined[UpperBound(lstr_action_declined[])].wf_action_type_id = gnv_sertifi.il_esign
		lstr_action_declined[UpperBound(lstr_action_declined[])].status_changed_flag = false
		lstr_action_declined[UpperBound(lstr_action_declined[])].module = "04"	//Contract Logix Agreement
		lstr_action_declined[UpperBound(lstr_action_declined[])].trigger_by = "008"		//Trigger By Action Item Changed
		lstr_action_declined[UpperBound(lstr_action_declined[])].screen_id = -10			
	End If
	
	If This.of_get_doc_signed_status( lstr_sertifi_doc.as_es_docid , lstr_sertifi_file)	Then
		lds_waiting_sign.SetItem(i, 'checkout_status' ,'6')
		If il_doc_signed > 0 Then
			lds_waiting_sign.SetItem(i,'Status',il_doc_signed)
					//Get Actin Item ID //Added By Ken.Guo 2016-07-18. Trigger AI change WF for signed
					ll_seq_no1 = 0 
					ll_seq_no2 =0
					gnv_appeondb.of_startqueue( )
						Select Top 1 seq_id into  :ll_seq_no1 From 	ctx_am_action_item 
							Where 	doc_id = :lstr_sertifi_doc.al_doc_id and (Action_type = :gnv_sertifi.il_esign  ) 	
									and Action_status = :gnv_sertifi.il_incomplete and (es_docid = :lstr_sertifi_doc.as_es_docid) ;
						Select Top 1 seq_id into  :ll_seq_no2 From ctx_am_action_item 
							Where 	doc_id = :lstr_sertifi_doc.al_doc_id and (Action_type = :gnv_sertifi.il_doccheckin  ) 	
									and Action_status = :gnv_sertifi.il_incomplete and (es_docid = :lstr_sertifi_doc.as_es_docid) ;			
					gnv_appeondb.of_commitqueue( )
					If ll_seq_no1 > 0 Then
						lstr_action_signed[UpperBound(lstr_action_signed[])+1].doc_id = lstr_sertifi_doc.al_doc_id
						lstr_action_signed[UpperBound(lstr_action_signed[])].seq_no = ll_seq_no1
						lstr_action_signed[UpperBound(lstr_action_signed[])].ctx_id =  lstr_sertifi_doc.al_ctx_id
						lstr_action_signed[UpperBound(lstr_action_signed[])].wf_action_status_id = gnv_sertifi.il_signed
						lstr_action_signed[UpperBound(lstr_action_signed[])].wf_action_type_id = gnv_sertifi.il_esign
						lstr_action_signed[UpperBound(lstr_action_signed[])].status_changed_flag = false
						lstr_action_signed[UpperBound(lstr_action_signed[])].module = "04"	//Contract Logix Agreement
						lstr_action_signed[UpperBound(lstr_action_signed[])].trigger_by = "008"		//Trigger By Action Item Changed
						lstr_action_signed[UpperBound(lstr_action_signed[])].screen_id = -10							
					End If
					If ll_seq_no2 > 0 Then
						lstr_action_signed[UpperBound(lstr_action_signed[])+1].doc_id = lstr_sertifi_doc.al_doc_id
						lstr_action_signed[UpperBound(lstr_action_signed[])].seq_no = ll_seq_no2
						lstr_action_signed[UpperBound(lstr_action_signed[])].ctx_id =  lstr_sertifi_doc.al_ctx_id
						lstr_action_signed[UpperBound(lstr_action_signed[])].wf_action_status_id = gnv_sertifi.il_signed
						lstr_action_signed[UpperBound(lstr_action_signed[])].wf_action_type_id = gnv_sertifi.il_doccheckin
						lstr_action_signed[UpperBound(lstr_action_signed[])].status_changed_flag = false
						lstr_action_signed[UpperBound(lstr_action_signed[])].module = "04"	//Contract Logix Agreement
						lstr_action_signed[UpperBound(lstr_action_signed[])].trigger_by = "008"		//Trigger By Action Item Changed
						lstr_action_signed[UpperBound(lstr_action_signed[])].screen_id = -10							
					End If				
		End If
		ls_docid_list = ls_docid_list + ',' + String(lstr_sertifi_doc.al_doc_id)
		ls_es_docid_list = ls_es_docid_list + ",'" + lstr_sertifi_doc.as_es_docid + "'"
	End If
	
	ls_es_apicode = lstr_sertifi_doc.as_es_apicode
	ls_es_fileid = lstr_sertifi_doc.as_es_fileid
Next

//Added By Ken.Guo 2016-02-23
If lb_need_refresh Then
	if IsValid(gw_contract) then	
		If gw_contract.tab_contract_details.ib_select9 Then
			gw_contract.tab_contract_details.tabpage_images.tab_1.tabpage_data.event ue_retrieve()
		End If
	end if
End If

//Added By Ken.Guo 2016-07-18
n_cst_workflow_triggers lnv_trigger
lnv_trigger = create n_cst_workflow_triggers
If UpperBound(lstr_action_declined[]) > 0 Then  	
	lnv_trigger.ib_trigger_on_login = True
	lnv_trigger.of_workflow_triggers(lstr_action_declined)
End If

//Update CL Status
If lds_waiting_sign.Modifiedcount( ) > 0 Then
	If isvalid(lw_appeon_gifofwait) Then lw_appeon_gifofwait.of_settext('Updating documents status...')
	//Update checkout status
	If lds_waiting_sign.update() = 1 Then
		ls_docid_list = Mid(ls_docid_list,2,Len(ls_docid_list))
		ls_es_docid_list = Mid(ls_es_docid_list,2,Len(ls_es_docid_list))	
		
		//Update Action item Status  " or  Action_type = " + String(gnv_sertifi.il_esign) +
		ls_sql = "Update ctx_am_action_item Set Action_status = " + String(gnv_sertifi.il_signed) + &
					" Where doc_id in (" + ls_docid_list + ") and (Action_type = " + String(gnv_sertifi.il_doccheckin)  + " or  Action_type = " + String(gnv_sertifi.il_esign) + ") "  +&
					" and Action_status = " + String(gnv_sertifi.il_incomplete) + " and (es_docid in ( "+ls_es_docid_list+") or es_docid is null) "		
		EXECUTE IMMEDIATE :ls_sql USING SQLCA;		
		If sqlca.sqlcode <> 0 Then
			gnv_debug.of_output( True, 'Failed to run SQL:' + ls_sql)
			gnv_debug.of_output( True, 'SQLCA Error:' + sqlca.sqlerrtext )
			if gb_message = true then 
				gnv_debug.of_message("Sertifi Error: The document(s) check out status have been updated, but failed to update the action item status. ")
			else
				Messagebox('Error','The document(s) check out status have been updated, but failed to update the action item status.')
			end if 
			If isvalid(lw_appeon_gifofwait) Then Close(lw_appeon_gifofwait)
			if isvalid(lnv_trigger) Then Destroy lnv_trigger
			Return -1
		Else
			//Added By Ken.Guo 2016-07-18
			If UpperBound(lstr_action_signed[]) > 0 Then  	
				lnv_trigger.ib_trigger_on_login = True
				lnv_trigger.of_workflow_triggers(lstr_action_signed[])
			End If
			if isvalid(lnv_trigger) Then Destroy lnv_trigger
		End If
	Else
		If isvalid(lw_appeon_gifofwait) Then Close(lw_appeon_gifofwait)
		Return -2
	End If
Else
	If isvalid(lw_appeon_gifofwait) Then Close(lw_appeon_gifofwait)
	if isvalid(lnv_trigger) Then Destroy lnv_trigger
	Return 0
End If

lw_appeon_gifofwait.of_setposition(ll_cnt)
If isvalid(lw_appeon_gifofwait) Then Close(lw_appeon_gifofwait)
if isvalid(lnv_trigger) Then Destroy lnv_trigger

Return 1
end function

public function boolean of_get_doc_signed_status (str_sertifi_doc astr_sertifi_doc);Integer li_ret = -1
String ls_filestatus
str_sertifi_file lstr_sertifi_file,lstr_sertifi_file_temp

SetPointer(HourGlass!)

If Not ib_isvalid_sertifi Then 
	If Not This.of_check_sertifi( ) Then Return False
End If

Try
	li_ret = This.of_get_doc_status( astr_sertifi_doc, lstr_sertifi_file,false)
Catch (Throwable	E2)	
	ib_isvalid_sertifi = False
	Messagebox('Error', E2.text )
End Try

If li_ret < 0 Then
	ib_isvalid_sertifi = False
	Return False
End if

Return of_get_doc_signed_status(astr_sertifi_doc.as_es_docid, lstr_sertifi_file )


end function

public function boolean of_get_doc_signed_status (string as_sertifi_docid, str_sertifi_file astr_sertifi_file);Long i

For i = 1 To UpperBound(astr_sertifi_file.astr_sertifi_document[])
	If as_sertifi_docid = astr_sertifi_file.astr_sertifi_document[i].DocumentID Then
		If astr_sertifi_file.astr_sertifi_document[i].status = 'Signed' Then
			Return True
		End If
	End If
Next

Return False
end function

public function integer of_get_doc_status (str_sertifi_doc astr_sertifi_doc, ref str_sertifi_file astr_sertifi_file, boolean ab_showerror);String ls_filestatus = 'error'
String ls_error
integer li_ret

SetPointer(HourGlass!)

If Not ib_isvalid_sertifi Then 
	If Not This.of_check_sertifi( ) Then Return -1
End If

Try
	ls_filestatus = isoap_sertifi.getfilestatus( astr_sertifi_doc.as_es_apicode , astr_sertifi_doc.as_es_fileid,false )
Catch (Throwable	E2)	
	ib_isvalid_sertifi = False
	if gb_message = true then 
		gnv_debug.of_message("Sertifi Error(of_get_doc_status("+astr_sertifi_doc.as_es_fileid+")): "+E2.text)
	else
		Messagebox('Error', E2.text )
	end if 
End Try

If Left(Lower(ls_filestatus),5) = 'error' Then
	If ab_showerror Then Messagebox('Error',ls_filestatus)
	gnv_debug.of_output(True, 'Failed to get file sertifi status.' + ls_filestatus)
	gnv_debug.of_output(True, 'Document ID:' + String(astr_sertifi_doc.al_doc_id ))
	gnv_debug.of_output(True, 'ES File ID:' + astr_sertifi_doc.as_es_fileid  )
	ib_isvalid_sertifi = False
	Return -1
End If

li_ret = This.of_parse_file_status( ls_filestatus, astr_sertifi_file, ls_error)
If li_ret < 0 Then
	If ab_showerror Then Messagebox('Error','Failed to parse the sertifi XML data.' + ls_error)
	gnv_debug.of_output(True, 'Failed to parse the sertifi XML data.' + ls_error)
	gnv_debug.of_output(True, 'Document ID:' + String(astr_sertifi_doc.al_doc_id ))
	gnv_debug.of_output(True, ls_filestatus)
End If

Return li_ret

end function

public function integer of_refresh_sertifi_status ();Integer li_ret

//Check Sertifi Module whether set to On.
If gnv_data.of_getitem( 'icred_settings', 'esign', False) = '1' Then
	//used
Else
	if gb_message = true then 
		gnv_debug.of_message("Sertifi Error: You did not purchase the Electronic Signature Module. To access this option please contact your sales representative at (866)371-4445 for more information. ")
	else
		Messagebox('Sertifi Error','You did not purchase the Electronic Signature Module. To access this option please contact your sales representative at (866)371-4445 for more information.')
	end if 	
	Return 0
End If

li_ret = of_refresh_sertifi_status(0,0)
 
//Refresh document manager data 
If li_ret > 0 Then
	 If isvalid(gw_contract) Then
		If gw_contract.tab_contract_details.ib_select9 Then
			gw_contract.tab_contract_details.tabpage_images.tab_1.tabpage_data.Event ue_retrieve( )
			gw_contract.tab_contract_details.tabpage_images.tab_1.tabpage_action.of_retrieve() 
			//Added By Mark Lee 08/06/12 not exists parameter
//			gw_contract.tab_contract_details.tabpage_images.tab_1.tabpage_action.Event ue_do('ue_retrieve')
		End If
	End If
End If

If li_ret >= 0 Then
	Update ids Set es_last_refresh = getdate();
End If

Return li_ret 
end function

public function integer of_ping_apicode (string as_apicode);//////////////////////////////////////////////////////////////////////
// Function: of_ping_apicode()
// Arguments:
// 	value    string    as_apicode
//--------------------------------------------------------------------
// Return:  boolean
//--------------------------------------------------------------------
// Author:	 Ken.Guo 2011-06-14.
//--------------------------------------------------------------------
// Description: Check the Sertifi API Code whether available.
//--------------------------------------------------------------------
//////////////////////////////////////////////////////////////////////
String ls_ret

Try
	//ping a not exists user to test api code.
	ls_ret = Lower(isoap_sertifi.GetUserInfo(as_apicode,'t01e2s3t4e5r6')) 
	
	If ls_ret = '' Then Return -2 //Failed to connect to sertifi server
	
	If Pos(ls_ret, 'invalid user') > 0 Then
		Return 1
	Else
		gnv_debug.of_output(true, 'Ping API code result: ' + ls_ret)
		Return -1
	End If
Catch (Throwable	E2)
	if gb_message = true then 
		gnv_debug.of_message("Sertifi Error(of_ping_apicode): "+e2.text)
	else
		Messagebox('Error',e2.text)
	end if 
	Return -2 //Failed to connect to sertifi server
End Try

Return -2
end function

public function integer of_ping_apicode ();of_get_apicode()
Return of_ping_apicode(is_apicode)

end function

public function boolean of_check_sertifi (boolean ab_ping_apicode);//////////////////////////////////////////////////////////////////////
// Function: of_check_sertifi()
// Arguments:
// 	value    Booleab    ab_ping_apicode
//--------------------------------------------------------------------
// Return:  boolean
//--------------------------------------------------------------------
// Author:	 Ken.Guo 2011-06-21.
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
//////////////////////////////////////////////////////////////////////

long ll_ret ,i
String ls_apicode,ls_Key_OCXs[], ls_value, ls_null
n_cst_AppeonDll lnv_appeon
Boolean lb_soap_installed = True

Setnull(ls_null)

//Get data from DB
gnv_appeondb.of_startqueue( )
	//Check My Email Address.
	SELECT email INTO :is_emailaddress
	FROM em_smtp_accounts
	WHERE (user_id = :gs_user_id) AND (is_default = 'Y');
	
	//Get Esign,Incomplete,Complte code
	Select Top 1 lookup_code Into :il_esign    From code_lookup Where lookup_name = 'Contract Action Type' And code = 'Doc-Esign-Request';
	Select Top 1 lookup_code Into :il_doccheckin From code_lookup Where lookup_name = 'Contract Action Type' And code = 'Doc-Esign-CheckIn';
	Select Top 1 lookup_code Into :il_complete From code_lookup Where lookup_name = 'Contract Action Status' And code = 'Complete';
	Select Top 1 lookup_code Into :il_incomplete From code_lookup Where lookup_name = 'Contract Action Status' And code = 'Incomplete';
	Select Top 1 lookup_code Into :il_signed From code_lookup Where lookup_name = 'Contract Action Status' And code = 'Signed';
	select Top 1 lookup_code Into :il_action_declined From code_lookup Where lookup_name = 'Contract Action Status' And code = 'Declined'; //added by gavin  20160525
	
	Select Top 1 lookup_code Into :il_doc_signed From code_lookup Where lookup_name = 'Contract Document Status' And code = 'Signed';
	Select Top 1 lookup_code Into :il_doc_declined From code_lookup Where lookup_name = 'Contract Document Status' And code = 'Declined';
gnv_appeondb.of_commitqueue( )


//Check Create it.
ll_ret = This.of_create()
If ll_ret <> 0 Then
	//Check SOAP Toolkit whether installed for Web version.
	If AppeonGetClientType() = 'Web' Then
		ls_Key_OCXs[1] = "HKEY_CLASSES_ROOT\CLSID\{05AE7FB3-C4E9-4F79-A5C3-DAB525E31F2C}\InprocServer32"
		ls_Key_OCXs[2] = "HKEY_CLASSES_ROOT\CLSID\{00b7e0ab-817a-44ad-a04b-d1148d524136}\InProcServer32"				
		ls_Key_OCXs[3] = "HKEY_CLASSES_ROOT\CLSID\{0AF40C55-9257-11D5-87EA-00B0D0BE6479}\InprocServer32"
		ls_Key_OCXs[4] = "HKEY_CLASSES_ROOT\CLSID\{91e2ead3-ab7e-4d5c-88de-f7fa382172bc}\InProcServer32"																				
		ls_Key_OCXs[5] = "HKEY_CLASSES_ROOT\CLSID\{0AF40C54-9257-11D5-87EA-00B0D0BE6479}\InprocServer32"
		For i = 1 To UpperBound(ls_Key_OCXs[])
			ls_Value = ''
			lnv_Appeon.of_registryget(ls_Key_OCXs[i],"", RegString!, ls_Value)
			If ls_value = '' Then
				lb_soap_installed = False
				Exit
			End If
		Next
	End If	
	If Not lb_soap_installed  Then
		If Messagebox('Sertifi Error' + String(ll_ret) ,'The system detected that you do not have SOAP Toolkit installed on your machine. '+ &
		+'You need to install it before you can use the Electronic Signature function. ~r~n~r~nDo you want to download it now??') = 1 Then
			ShellExecuteA ( Handle( This ), "open", 'IEXPLORE', ls_soap_link , ls_Null, 4)			
		End If
		Return False
	Else
		if gb_message = true then 
			gnv_debug.of_message("Sertifi Error "+ String(ll_ret)+" : Failed to create the SOAP instance, please call support.")
		else
			Messagebox('Sertifi Error' + String(ll_ret) ,'Failed to create the SOAP instance, please call support.')
		end if 
	End If
	Return False 
End If

//Check Sertifi Module whether set to On.
If gnv_data.of_getitem( 'icred_settings', 'esign', False) ='1' Then
	//used
Else
	if gb_message = true then 
		gnv_debug.of_message("Sertifi Error: You did not purchase the Electronic Signature Module. To access this option please contact your sales representative at (866)371-4445 for more information.")
	else
		Messagebox('Sertifi Error','You did not purchase the Electronic Signature Module. To access this option please contact your sales representative at (866)371-4445 for more information.')
	end if 
	Return False
End If
 
If is_emailaddress = '' or isnull(is_emailaddress) Then
	if gb_message = true then 
		gnv_debug.of_message("Sertifi Error: Your email address is empty, please open System -> Personal Settings -> Email Account, then input the email account info.")
	else
		Messagebox('Sertifi Error','Your email address is empty, please open System -> Personal Settings -> Email Account, then input the email account info.')
	end if 
	Return False
End If
If Pos(is_emailaddress,'@') <= 0 Then
	if gb_message = true then 
		gnv_debug.of_message("Sertifi Error: Your email address is incorrect, please open System -> Personal Settings -> Email Account, then input the full email address.")
	else
		Messagebox('Sertifi Error','Your email address is incorrect, please open System -> Personal Settings -> Email Account, then input the full email address.')
	end if 
	Return False
End If

//Check code
If isnull(il_esign) Then
	if gb_message = true then 
		gnv_debug.of_message("Sertifi Error: It have no Esign code in the Lookup Painter for Contract Action Type, please add it.")
	else
		Messagebox('Sertifi Error','It have no Esign code in the Lookup Painter for Contract Action Type, please add it.')	
	end if 
	Return False
End If
If isnull(il_signed) Then
	if gb_message = true then 
		gnv_debug.of_message("Sertifi Error: It have no Signed code in the Lookup Painter for Contract Action Status, please add it.")
	else
		Messagebox('Sertifi Error','It have no Signed code in the Lookup Painter for Contract Action Status, please add it.')
	end if 
	Return False
End If
If isnull(il_incomplete) Then
	if gb_message = true then 
		gnv_debug.of_message("Sertifi Error: It have no Incomplete code in the Lookup Painter for Contract Action Status, please add it.")
	else
		Messagebox('Sertifi Error','It have no Incomplete code in the Lookup Painter for Contract Action Status, please add it.')
	end if 
	Return False
End If

ls_apicode = This.of_get_apicode()
If isnull(ls_apicode) or ls_apicode = '' Then
	if gb_message = true then 
		gnv_debug.of_message("Sertifi Error: The Sertifi API code is empty, plese open System -> Utilites -> Electronic Signature Settings, then input the Sertifi API code.")
	else
		Messagebox('Sertifi Error','The Sertifi API code is empty, plese open System -> Utilites -> Electronic Signature Settings, then input the Sertifi API code.')
	end if 
	Return False
End If

//Ping Server or local env.
If Not of_ping_sertifi_server( ) Then
	if gb_message = true then 
		gnv_debug.of_message("Sertifi Error: Cannot connect to Sertifi server. You may experience some network connection issue or failed to install the SOAP toolkit.")
	else
		Messagebox('Sertifi Error','Cannot connect to Sertifi server. You may experience some network connection issue or failed to install the SOAP toolkit.')
	end if 
	Return False
End If

//Ping current API code
integer li_ret
If ab_ping_apicode Then
	li_ret = This.of_ping_apicode(ls_apicode) 
	Choose Case li_ret 
		Case -1
			if gb_message = true then 
				gnv_debug.of_message("Sertifi Error: The Sertifi API code is invalid, plese open System -> Utilites -> Electronic Signature Settings, then input the correct Sertifi API code.")
			else
				Messagebox('Sertifi Error','The Sertifi API code is invalid, plese open System -> Utilites -> Electronic Signature Settings, then input the correct Sertifi API code.')
			end if 
			Return False
		Case -2
			if gb_message = true then 
				gnv_debug.of_message("Sertifi Error: Cannot connect to Sertifi server. You may experience some network connection issue.")
			else
				Messagebox('Sertifi Error','Cannot connect to Sertifi server. You may experience some network connection issue.')
			end if 
			Return False
	End Choose
End If

ib_isvalid_sertifi = True

Return True



end function

public function boolean of_ping_sertifi_server ();//////////////////////////////////////////////////////////////////////
// Function: of_ping_sertifi_server()
// Arguments:
//--------------------------------------------------------------------
// Return:  boolean
//--------------------------------------------------------------------
// Author:	 Ken.Guo 2011-06-24.
//--------------------------------------------------------------------
// Description: Check the Sertifi server available.
//--------------------------------------------------------------------
//////////////////////////////////////////////////////////////////////
String ls_ret

Try
	//ping a not exists user to test api code.
	ls_ret = Lower(isoap_sertifi.GetUserInfo('testapicode','t01e2s3t4e5r6')) 

	If Pos(ls_ret, 'invalid api code') > 0 Then
		Return True
	Else
		Return False
	End If
Catch (Throwable	E2)
	if gb_message = true then 
		gnv_debug.of_message("Sertifi Error(of_ping_sertifi_server): "+e2.text)
	else
		Messagebox('Error',e2.text)
	end if 
	Return False //Failed to connect to sertifi server
End Try

Return False
end function

public function boolean of_check_sertifi (boolean ab_ping_apicode, string as_apicode, boolean ab_personal_data);//====================================================================
// Function: of_check_sertifi
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value    boolean    ab_ping_apicode
// 	value    string     as_apicode
// 	value    boolean    ab_personal_data
//--------------------------------------------------------------------
// Returns:  boolean
//--------------------------------------------------------------------
// Author:	Jay Chen		Date: 09-04-2014
//--------------------------------------------------------------------
//	Copyright (c) 2008-2013 ContractLogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

long ll_ret ,i
String ls_apicode,ls_Key_OCXs[], ls_value, ls_null
n_cst_AppeonDll lnv_appeon
Boolean lb_soap_installed = True

Setnull(ls_null)

//Get data from DB
gnv_appeondb.of_startqueue( )
	//Check My Email Address.
	SELECT email INTO :is_emailaddress
	FROM em_smtp_accounts
	WHERE (user_id = :gs_user_id) AND (is_default = 'Y');
	
	//Get Esign,Incomplete,Complte code
	Select Top 1 lookup_code Into :il_esign    From code_lookup Where lookup_name = 'Contract Action Type' And code = 'Doc-Esign-Request';
	Select Top 1 lookup_code Into :il_doccheckin From code_lookup Where lookup_name = 'Contract Action Type' And code = 'Doc-Esign-CheckIn';
	Select Top 1 lookup_code Into :il_complete From code_lookup Where lookup_name = 'Contract Action Status' And code = 'Complete';
	Select Top 1 lookup_code Into :il_incomplete From code_lookup Where lookup_name = 'Contract Action Status' And code = 'Incomplete';
	Select Top 1 lookup_code Into :il_signed From code_lookup Where lookup_name = 'Contract Action Status' And code = 'Signed';
	select Top 1 lookup_code Into :il_action_declined From code_lookup Where lookup_name = 'Contract Action Status' And code = 'Declined'; //added by gavin  20160525
	
	Select Top 1 lookup_code Into :il_doc_signed From code_lookup Where lookup_name = 'Contract Document Status' And code = 'Signed';
	Select Top 1 lookup_code Into :il_doc_declined From code_lookup Where lookup_name = 'Contract Document Status' And code = 'Declined';

gnv_appeondb.of_commitqueue( )


//Check Create it.
ll_ret = This.of_create()
If ll_ret <> 0 Then
	//Check SOAP Toolkit whether installed for Web version.
	If AppeonGetClientType() = 'Web' Then
		ls_Key_OCXs[1] = "HKEY_CLASSES_ROOT\CLSID\{05AE7FB3-C4E9-4F79-A5C3-DAB525E31F2C}\InprocServer32"
		ls_Key_OCXs[2] = "HKEY_CLASSES_ROOT\CLSID\{00b7e0ab-817a-44ad-a04b-d1148d524136}\InProcServer32"				
		ls_Key_OCXs[3] = "HKEY_CLASSES_ROOT\CLSID\{0AF40C55-9257-11D5-87EA-00B0D0BE6479}\InprocServer32"
		ls_Key_OCXs[4] = "HKEY_CLASSES_ROOT\CLSID\{91e2ead3-ab7e-4d5c-88de-f7fa382172bc}\InProcServer32"																				
		ls_Key_OCXs[5] = "HKEY_CLASSES_ROOT\CLSID\{0AF40C54-9257-11D5-87EA-00B0D0BE6479}\InprocServer32"
		For i = 1 To UpperBound(ls_Key_OCXs[])
			ls_Value = ''
			lnv_Appeon.of_registryget(ls_Key_OCXs[i],"", RegString!, ls_Value)
			If ls_value = '' Then
				lb_soap_installed = False
				Exit
			End If
		Next
	End If	
	If Not lb_soap_installed  Then
		If Messagebox('Sertifi Error' + String(ll_ret) ,'The system detected that you do not have SOAP Toolkit installed on your machine. '+ &
		+'You need to install it before you can use the Electronic Signature function. ~r~n~r~nDo you want to download it now??') = 1 Then
			ShellExecuteA ( Handle( This ), "open", 'IEXPLORE', ls_soap_link , ls_Null, 4)			
		End If
		Return False
	Else
		Messagebox('Sertifi Error' + String(ll_ret) ,'Failed to create the SOAP instance, please call support.')
	End If
	Return False 
End If

//Check Sertifi Module whether set to On.
If gnv_data.of_getitem( 'icred_settings', 'esign', False) ='1' Then
	//used
Else
	Messagebox('Sertifi Error','You did not purchase the Electronic Signature Module. To access this option please contact your sales representative at (866)371-4445 for more information.')
	Return False
End If
 
If is_emailaddress = '' or isnull(is_emailaddress) Then
	Messagebox('Sertifi Error','Your email address is empty, please open System -> Personal Settings -> Email Account, then input the email account info.')
	Return False
End If
If Pos(is_emailaddress,'@') <= 0 Then
	Messagebox('Sertifi Error','Your email address is incorrect, please open System -> Personal Settings -> Email Account, then input the full email address.')
	Return False
End If

//Check code
If isnull(il_esign) Then
	Messagebox('Sertifi Error','It have no Esign code in the Lookup Painter for Contract Action Type, please add it.')
	Return False
End If
If isnull(il_signed) Then
	Messagebox('Sertifi Error','It have no Signed code in the Lookup Painter for Contract Action Status, please add it.')
	Return False
End If
If isnull(il_incomplete) Then
	Messagebox('Sertifi Error','It have no Incomplete code in the Lookup Painter for Contract Action Status, please add it.')
	Return False
End If

if ab_personal_data then
	select esign_apicode
	into :is_apicode
	from personal_license_setting 
	where user_id = :gs_user_id and esign_type='sertifi';

	If isnull(is_apicode) or is_apicode = '' Then
		Messagebox('Sertifi Error','The system has detected that there is no personal E-Signature license API code configured for the current user. Please go to User Painter -> E-Signature License to configure valid license API code information.')
		Return False
	End If

	//Ping Server or local env.
	If Not of_ping_sertifi_server( ) Then
		Messagebox('Sertifi Error','Cannot connect to Sertifi server. You may experience some network connection issue or failed to install the SOAP toolkit.')
		Return False
	End If
	
else
	is_apicode = as_apicode
end if

//Ping current API code
integer li_ret
If ab_ping_apicode Then
	li_ret = This.of_ping_apicode(ls_apicode) 
	Choose Case li_ret 
		Case -1
			Messagebox('Sertifi Error','The Sertifi API code is invalid, plese open System -> Utilites -> Electronic Signature Settings, then input the correct Sertifi API code.')
			Return False
		Case -2
			Messagebox('Sertifi Error','Cannot connect to Sertifi server. You may experience some network connection issue.')
			Return False
	End Choose
End If

ib_isvalid_sertifi = True

Return True



end function

on n_cst_sertifi.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_sertifi.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event destructor;If isvalid(isoap_conn) Then Destroy isoap_conn
end event

