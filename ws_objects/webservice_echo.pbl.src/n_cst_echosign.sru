﻿$PBExportHeader$n_cst_echosign.sru
forward
global type n_cst_echosign from nonvisualobject
end type
end forward

global type n_cst_echosign from nonvisualobject
end type
global n_cst_echosign n_cst_echosign

type variables
SoapConnection isoap_conn
echosignsoap isoap_echosign
String is_apicode,is_emailaddress
Long il_esign, il_complete,il_incomplete,il_signed,il_doccheckin,il_doc_signed,il_doc_declined, il_action_declined //added by gavins 20160525

Boolean ib_isvalid_sertifi = False

String ls_soap_link = 'http://web.contractlogix.com/templates/soapsdk.exe'

//String is_soap_url = 'http://clxintranet.contractlogix.com/echosign/signservice.asmx?wsdl' //Added By Jay Chen 10-09-2013
String is_soap_url = 'http://esign.contractlogix.com/echosign/signservice.asmx?wsdl' 							//Added By Mark Lee 09/18/2015
//String  is_soap_url = 'http://192.0.0.228/ContractlogixSignService/signservice.asmx?wsdl'

end variables

forward prototypes
public function string of_get_apicode ()
public function integer of_create ()
public function boolean of_check_sertifi ()
public function long of_hex2dec (string as_hex)
public function string of_get_doc_maintance_link (str_sertifi_doc astr_sertifi_doc)
public function string of_download_doc (str_sertifi_doc astr_sertifi_doc)
public function integer of_show_sertifi_status (str_sertifi_doc astr_sertifi_doc, boolean ab_refresh)
public function integer of_show_sertifi_status (long al_docid, string as_es_docid, string as_type, boolean ab_refresh)
public function integer of_removesignaturerequest (str_sertifi_doc astr_sertifi_doc)
public function integer of_refresh_sertifi_status (long al_ctx_id, long al_doc_id)
public function boolean of_get_doc_signed_status (string as_sertifi_docid, str_sertifi_file astr_sertifi_file)
public function integer of_refresh_sertifi_status ()
public function integer of_ping_apicode (string as_apicode)
public function integer of_ping_apicode ()
public function boolean of_check_sertifi (boolean ab_ping_apicode)
public function boolean of_ping_sertifi_server ()
public function integer of_get_doc_status (str_sertifi_doc astr_sertifi_doc, ref str_sertifi_file astr_sertifi_file, boolean ab_showerror)
public function boolean of_check_sertifi (boolean ab_ping_apicode, string as_apicode, boolean ab_personal_data)
public function integer of_refresh_access_token (string as_license_user)
public function integer of_refresh_access_token (boolean ab_need_ref, string as_license_user, ref string as_esign_token)
end prototypes

public function string of_get_apicode ();is_apicode = gnv_data.of_getitem( 'icred_settings', 'echo_apicode', False)
Return is_apicode
end function

public function integer of_create ();long ll_ret = -1
string ls_ret

Try
	isoap_conn = Create SoapConnection
	ll_ret = isoap_conn.CreateInstance(isoap_echosign, "echosignsoap",is_soap_url)
//	messagebox('info', "CreateInstance "+string(ll_ret))
	If ll_ret <> 0 Then
		If isvalid(isoap_echosign) Then Destroy isoap_echosign
	End If
	
//	ls_ret = isoap_echosign.testping('XY5JXPL2M3X7I8M') 
//	messagebox('info', "ping "+ls_ret)
	
Catch (throwable e1)
	If isvalid(isoap_echosign) Then Destroy isoap_echosign
	Return -1
End Try

Return ll_ret
end function

public function boolean of_check_sertifi ();Return of_check_sertifi(True)



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
     ls_link = isoap_echosign.getdocumentlink( astr_sertifi_doc.as_es_apicode , astr_sertifi_doc.as_es_docid )
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

public function string of_download_doc (str_sertifi_doc astr_sertifi_doc);//////////////////////////////////////////////////////////////////////
// Function: of_download_doc()
// Arguments:
// 	value    str_sertifi_doc    astr_sertifi_doc
//--------------------------------------------------------------------
// Return:  string
//--------------------------------------------------------------------
// Author:	 Jay.Chen 2013-09-30.
//--------------------------------------------------------------------
// Description: Download the file from echosign.
//--------------------------------------------------------------------
//////////////////////////////////////////////////////////////////////
Long ll_max,i,ll_readlength,ll_writelength
String ls_SertifiDirectory,ls_FileName
Blob lb_doc
w_appeon_gifofwait lw_appeon_gifofwait
tns__SignedDocument ltns__SignedDocument

If not isvalid(lw_appeon_gifofwait) Then OpenwithParm(lw_appeon_gifofwait,"Downloading document from echosign server...")		


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

//Download the file from echosign
SetPointer(HourGlass!)
If Not ib_isvalid_sertifi Then 
	If Not This.of_check_sertifi( ) Then 
		If isvalid(lw_appeon_gifofwait) Then Close(lw_appeon_gifofwait)
		Return ''
	End If
End If

Try
	ltns__SignedDocument = isoap_echosign.downloadsigneddoc( astr_sertifi_doc.as_es_apicode , astr_sertifi_doc.as_es_docid ) 
Catch (Throwable	E2)	
	Messagebox('Error', E2.text )
End Try	

If Left(Lower(ltns__SignedDocument.errorText),5) = 'error' Then
	ib_isvalid_sertifi = False
	Return ''
End If

//Write blob into file
lb_doc = ltns__SignedDocument.document
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


return 1
end function

public function integer of_show_sertifi_status (long al_docid, string as_es_docid, string as_type, boolean ab_refresh);str_sertifi_doc lstr_sertifi_doc 
String ls_es_docid

If isnull(as_es_docid) or as_es_docid = '' Then 
	Messagebox('tip','No signature document data.')
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

return 1
end function

public function integer of_removesignaturerequest (str_sertifi_doc astr_sertifi_doc);string ls_errcode,ls_errdesc
boolean lb_success = false
String ls_ret = 'error'

SetPointer(HourGlass!)

If Not ib_isvalid_sertifi Then 
	If Not This.of_check_sertifi( ) Then Return -1
End If

Try
	ls_ret = isoap_echosign.removesigneddoc(astr_sertifi_doc.as_es_apicode, astr_sertifi_doc.as_es_docid)
Catch (Throwable	E2)	
	ib_isvalid_sertifi = False
	Messagebox('Error', E2.text )
	return -1
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
long ll_seq_no1,ll_seq_no2 //Added By Ken.Guo 2016-07-19
str_action_item lstr_action_declined[],lstr_action_signed[] //Added By Ken.Guo 2016-07-19

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
ls_filter += " and esign_type = 'echosign'" //Added By Jay Chen 10-11-2013
lds_waiting_sign.SetFilter(ls_filter)
lds_waiting_sign.Filter()
ll_cnt = lds_waiting_sign.Rowcount( ) 
If ll_cnt = 0 Then Return 1

If Not ib_isvalid_sertifi Then 
	If Not This.of_check_sertifi( ) Then Return -1
End If

If not isvalid(lw_appeon_gifofwait) Then OpenwithParm(lw_appeon_gifofwait,"Retrieving E-sign documents status from echosign server...")
timer(0,lw_appeon_gifofwait)
lw_appeon_gifofwait.of_setmaxposition(ll_cnt+2)

//Get Sertifi Sign Status
For i = 1 To ll_cnt
	lw_appeon_gifofwait.of_settext("Retrieving E-sign documents status from echosign server "+String(i)+'/'+String(ll_cnt)+"...")
	lw_appeon_gifofwait.of_setposition(i)
	
	lstr_sertifi_doc = str_sertifi_doc_temp
	lstr_sertifi_doc.al_ctx_id = lds_waiting_sign.GetItemNumber(i, 'ctx_id') //Added By Ken.Guo 2016-07-18
	lstr_sertifi_doc.al_doc_id = lds_waiting_sign.GetItemNumber(i, 'doc_id')
	lstr_sertifi_doc.as_es_apicode =  lds_waiting_sign.GetItemString(i, 'es_apicode')
	lstr_sertifi_doc.as_es_fileid =  lds_waiting_sign.GetItemString(i, 'es_fileid')
	lstr_sertifi_doc.as_es_docid =  lds_waiting_sign.GetItemString(i, 'es_docid')
	lstr_sertifi_doc.as_es_sender =  lds_waiting_sign.GetItemString(i, 'es_sender')
	lstr_sertifi_doc.as_es_email =  lds_waiting_sign.GetItemString(i, 'es_sender_email')
	
	 //Added By Ken.Guo 2017-09-09
	lstr_sertifi_doc.as_echosign_method = lds_waiting_sign.GetItemString(i, 'echosign_method')
	lstr_sertifi_doc.as_esign_license_user_id = lds_waiting_sign.GetItemString(i, 'es_license_user_id')
	
	If ls_es_apicode = lstr_sertifi_doc.as_es_apicode and ls_es_fileid = lstr_sertifi_doc.as_es_fileid Then
		//Use prior lstr_sertifi_file when same fileid
	Else
		lstr_sertifi_file = lstr_sertifi_file_temp
		If This.of_get_doc_status( lstr_sertifi_doc, lstr_sertifi_file,false) < 0 Then Continue
	End If

	// Added by gavins 20160525   currently the iterative loop is not really effect, because "update " syntax do not used for action_user field . added "aborted' for echosign By Ken.Guo 2016-07-20
	For j = 1 to UpperBound(lstr_sertifi_file.astr_sertifi_document[]) 
		If lower(lstr_sertifi_file.astr_sertifi_document[j].Status) = "declined" or lower(lstr_sertifi_file.astr_sertifi_document[j].Status) = "aborted" then  
			If gnv_echosign.il_doc_declined > 0 Then
				Update Ctx_am_document Set status = :gnv_echosign.il_doc_declined  Where doc_id = :lstr_sertifi_doc.al_doc_id;
			End If
			//added by gavins 20160525 action item status //or Action_type = :gnv_docusign.il_doccheckin
			If gnv_echosign.il_action_declined > 0 Then
				//Get Actin Item ID //Added By Ken.Guo 2016-07-19
				Select Top 1 seq_id into  :lstr_sertifi_doc.al_ai_seq_id From 	ctx_am_action_item 
						Where doc_id = :lstr_sertifi_doc.al_doc_id and (Action_type = :gnv_echosign.il_esign  )  
							and Action_status = :gnv_echosign.il_incomplete and (es_docid = :lstr_sertifi_doc.as_es_docid) ;
							
				Update ctx_am_action_item Set Action_status = :gnv_echosign.il_action_declined
					Where doc_id = :lstr_sertifi_doc.al_doc_id and (Action_type = :gnv_echosign.il_esign  )  
							and Action_status = :gnv_echosign.il_incomplete and (es_docid = :lstr_sertifi_doc.as_es_docid or es_docid is null) ;
//				lb_TriggerWF = True			
			end If
			lb_need_refresh = True
			Exit
		end if	
	Next
	
	//Added By Ken.Guo 2016-07-19. Trigger AI change WF for declined
	If lstr_sertifi_doc.al_ai_seq_id > 0 Then
		lstr_action_declined[UpperBound(lstr_action_declined[])+1].doc_id = lstr_sertifi_doc.al_doc_id
		lstr_action_declined[UpperBound(lstr_action_declined[])].seq_no = lstr_sertifi_doc.al_ai_seq_id
		lstr_action_declined[UpperBound(lstr_action_declined[])].ctx_id =  lstr_sertifi_doc.al_ctx_id
		lstr_action_declined[UpperBound(lstr_action_declined[])].wf_action_status_id = gnv_echosign.il_action_declined
		lstr_action_declined[UpperBound(lstr_action_declined[])].wf_action_type_id = gnv_echosign.il_esign
		lstr_action_declined[UpperBound(lstr_action_declined[])].status_changed_flag = false
		lstr_action_declined[UpperBound(lstr_action_declined[])].module = "04"	//Contract Logix Agreement
		lstr_action_declined[UpperBound(lstr_action_declined[])].trigger_by = "008"		//Trigger By Action Item Changed
		lstr_action_declined[UpperBound(lstr_action_declined[])].screen_id = -10			
	End If

	If This.of_get_doc_signed_status( lstr_sertifi_doc.as_es_docid , lstr_sertifi_file)	Then
		lds_waiting_sign.SetItem(i, 'checkout_status' ,'6')
		If il_doc_signed > 0 Then
			lds_waiting_sign.SetItem(i,'Status',il_doc_signed)
					//Get Actin Item ID //Added By Ken.Guo 2016-07-19. Trigger AI change WF for signed
					ll_seq_no1 = 0 
					ll_seq_no2 =0
					gnv_appeondb.of_startqueue( )
						Select Top 1  seq_id into  :ll_seq_no1 From 	ctx_am_action_item 
							Where 	doc_id = :lstr_sertifi_doc.al_doc_id and (Action_type = :gnv_echosign.il_esign  ) 	
									and Action_status = :gnv_echosign.il_incomplete and (es_docid = :lstr_sertifi_doc.as_es_docid) ;
						Select Top 1 seq_id into  :ll_seq_no2 From ctx_am_action_item 
							Where 	doc_id = :lstr_sertifi_doc.al_doc_id and (Action_type = :gnv_echosign.il_doccheckin  ) 	
									and Action_status = :gnv_echosign.il_incomplete and (es_docid = :lstr_sertifi_doc.as_es_docid) ;			
					gnv_appeondb.of_commitqueue( )
					If ll_seq_no1 > 0 Then
						lstr_action_signed[UpperBound(lstr_action_signed[])+1].doc_id = lstr_sertifi_doc.al_doc_id
						lstr_action_signed[UpperBound(lstr_action_signed[])].seq_no = ll_seq_no1
						lstr_action_signed[UpperBound(lstr_action_signed[])].ctx_id =  lstr_sertifi_doc.al_ctx_id
						lstr_action_signed[UpperBound(lstr_action_signed[])].wf_action_status_id = gnv_echosign.il_signed
						lstr_action_signed[UpperBound(lstr_action_signed[])].wf_action_type_id = gnv_echosign.il_esign
						lstr_action_signed[UpperBound(lstr_action_signed[])].status_changed_flag = false
						lstr_action_signed[UpperBound(lstr_action_signed[])].module = "04"	//Contract Logix Agreement
						lstr_action_signed[UpperBound(lstr_action_signed[])].trigger_by = "008"		//Trigger By Action Item Changed
						lstr_action_signed[UpperBound(lstr_action_signed[])].screen_id = -10							
					End If
					If ll_seq_no2 > 0 Then
						lstr_action_signed[UpperBound(lstr_action_signed[])+1].doc_id = lstr_sertifi_doc.al_doc_id
						lstr_action_signed[UpperBound(lstr_action_signed[])].seq_no = ll_seq_no2
						lstr_action_signed[UpperBound(lstr_action_signed[])].ctx_id =  lstr_sertifi_doc.al_ctx_id
						lstr_action_signed[UpperBound(lstr_action_signed[])].wf_action_status_id = gnv_echosign.il_signed
						lstr_action_signed[UpperBound(lstr_action_signed[])].wf_action_type_id = gnv_echosign.il_doccheckin
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

//Added By Ken.Guo 2016-07-19
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
			
		//Update Action item Status    " or  Action_type = " + String(gnv_echosign.il_esign) +
		ls_sql = "Update ctx_am_action_item Set Action_status = " + String(gnv_echosign.il_signed) + &
					" Where doc_id in (" + ls_docid_list + ") and (Action_type = " + String(gnv_echosign.il_doccheckin)  + " or  Action_type = " + String(gnv_echosign.il_esign) + ") "  +&
					" and Action_status = " + String(gnv_echosign.il_incomplete) + " and (es_docid in ( "+ls_es_docid_list+") or es_docid is null) "		
		EXECUTE IMMEDIATE :ls_sql USING SQLCA;		
		If sqlca.sqlcode <> 0 Then
			gnv_debug.of_output( True, 'Failed to run SQL:' + ls_sql)
			gnv_debug.of_output( True, 'SQLCA Error:' + sqlca.sqlerrtext )
			if gb_message = true then 
				gnv_debug.of_message("Echosign Error: The document(s) check out status have been updated, but failed to update the action item status.")
			else
				Messagebox('Error','The document(s) check out status have been updated, but failed to update the action item status.')
			end if 
			If isvalid(lw_appeon_gifofwait) Then Close(lw_appeon_gifofwait)
			if isvalid(lnv_trigger) Then Destroy lnv_trigger
			Return -1
		Else
			//Added By Ken.Guo 2016-07-19
			If UpperBound(lstr_action_signed[]) > 0 Then  	
				lnv_trigger.ib_trigger_on_login = True
				lnv_trigger.of_workflow_triggers(lstr_action_signed[])
			End If
			if isvalid(lnv_trigger) Then Destroy lnv_trigger
		End If
	Else
		If isvalid(lw_appeon_gifofwait) Then Close(lw_appeon_gifofwait)
		if isvalid(lnv_trigger) Then Destroy lnv_trigger
		Return -2
	End If
Else
	if isvalid(lnv_trigger) Then Destroy lnv_trigger
	If isvalid(lw_appeon_gifofwait) Then Close(lw_appeon_gifofwait)
	Return 0
End If

lw_appeon_gifofwait.of_setposition(ll_cnt)
If isvalid(lw_appeon_gifofwait) Then Close(lw_appeon_gifofwait)
if isvalid(lnv_trigger) Then Destroy lnv_trigger
Return 1
end function

public function boolean of_get_doc_signed_status (string as_sertifi_docid, str_sertifi_file astr_sertifi_file);Long i

For i = 1 To UpperBound(astr_sertifi_file.astr_sertifi_document[])
	If as_sertifi_docid = astr_sertifi_file.astr_sertifi_document[i].DocumentID Then
		If lower(astr_sertifi_file.astr_sertifi_document[i].status) = 'signed' Then
			Return True
		End If
	End If
Next

Return False
end function

public function integer of_refresh_sertifi_status ();Integer li_ret

//Check Sertifi Module whether set to On.
If gnv_data.of_getitem( 'icred_settings', 'esign', False) = '1' Then
	//used
Else
	if gb_message = true then 
		gnv_debug.of_message("Echosign Error: You did not purchase the Electronic Signature Module. To access this option please contact your sales representative at (866)371-4445 for more information.")
	else
		Messagebox('Echosign Error','You did not purchase the Electronic Signature Module. To access this option please contact your sales representative at (866)371-4445 for more information.')
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

public function integer of_ping_apicode (string as_apicode);String ls_ret

Try
	//test api code.
	if as_apicode = '' or isnull(as_apicode) then
		if gb_message = true then 
			gnv_debug.of_message("Echosign Error: EchoSign API code is empty,please set it first")
		else
			Messagebox('Information','EchoSign API code is empty,please set it first')
		end if 
	    Return -1
	end if
	
	ls_ret = isoap_echosign.testping(as_apicode) 
	
	If ls_ret = '' Then Return -2 //Failed to connect to sertifi server
	
	if lower(left(ls_ret,5)) = 'error' then
		gnv_debug.of_output(true, 'Ping API code result: ' + ls_ret)
		Return -1
	else
		If Pos(lower(ls_ret), 'it works') > 0 Then 
			Return 1
		else
			Return -1
		end if
	end if
	
Catch (Throwable	E2)
	if gb_message = true then 
		gnv_debug.of_message("Echosign Error(of_ping_apicode): "+e2.text)
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
	Select Top 1 lookup_code Into :il_doc_declined From code_lookup Where lookup_name = 'Contract Document Status' And code = 'Declined';//added by gavin  20160525

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
		If Messagebox('Echosign Error' + String(ll_ret) ,'The system detected that you do not have SOAP Toolkit installed on your machine. '+ &
		+'You need to install it before you can use the Electronic Signature function. ~r~n~r~nDo you want to download it now??') = 1 Then
			ShellExecuteA ( Handle( This ), "open", 'IEXPLORE', ls_soap_link , ls_Null, 4)			
		End If
		Return False
	Else
		if gb_message = true then 
			gnv_debug.of_message("Echosign Error"+ String(ll_ret)+": Failed to create the SOAP instance, please call support.")
		else
			Messagebox('Echosign Error' + String(ll_ret) ,'Failed to create the SOAP instance, please call support.')
		end if 
	End If
	Return False 
End If


//Check Sertifi Module whether set to On.
If gnv_data.of_getitem( 'icred_settings', 'esign', False) ='1' Then
	//used
Else
	if gb_message = true then 
		gnv_debug.of_message("Echosign Error: You did not purchase the Electronic Signature Module. To access this option please contact your sales representative at (866)371-4445 for more information.")
	else
		Messagebox('Echosign Error','You did not purchase the Electronic Signature Module. To access this option please contact your sales representative at (866)371-4445 for more information.')
	end if 
	Return False
End If
 
If is_emailaddress = '' or isnull(is_emailaddress) Then
	if gb_message = true then 
		gnv_debug.of_message("Echosign Error: Your email address is empty, please open System -> Personal Settings -> Email Account, then input the email account info.")
	else
		Messagebox('Echosign Error','Your email address is empty, please open System -> Personal Settings -> Email Account, then input the email account info.')
	end if 
	Return False
End If
If Pos(is_emailaddress,'@') <= 0 Then
	if gb_message = true then 
		gnv_debug.of_message("Echosign Error: Your email address is incorrect, please open System -> Personal Settings -> Email Account, then input the full email address.")
	else
		Messagebox('Echosign Error','Your email address is incorrect, please open System -> Personal Settings -> Email Account, then input the full email address.')
	end if 
	Return False
End If

//Check code
If isnull(il_esign) Then
	if gb_message = true then 
		gnv_debug.of_message("Echosign Error: It have no Esign code in the Lookup Painter for Contract Action Type, please add it.")
	else
		Messagebox('Echosign Error','It have no Esign code in the Lookup Painter for Contract Action Type, please add it.')
	end if 
	Return False
End If
If isnull(il_signed) Then
	if gb_message = true then 
		gnv_debug.of_message("Echosign Error: It have no Signed code in the Lookup Painter for Contract Action Status, please add it.")
	else
		Messagebox('Echosign Error','It have no Signed code in the Lookup Painter for Contract Action Status, please add it.')
	end if 
	Return False
End If
If isnull(il_incomplete) Then
	if gb_message = true then 
		gnv_debug.of_message("Echosign Error: It have no Incomplete code in the Lookup Painter for Contract Action Status, please add it.")
	else
		Messagebox('Echosign Error','It have no Incomplete code in the Lookup Painter for Contract Action Status, please add it.')
	end if 
	Return False
End If


ls_apicode = This.of_get_apicode()
If isnull(ls_apicode) or ls_apicode = '' Then
	if gb_message = true then 
		gnv_debug.of_message("Echosign Error: The Echosign API code is empty, plese open System -> Utilites -> Electronic Signature Settings, then input the Echosign API code.")
	else
		Messagebox('Echosign Error','The Echosign API code is empty, plese open System -> Utilites -> Electronic Signature Settings, then input the Echosign API code.')
	end if 
	Return False
End If

//Ping Server or local env.
If Not of_ping_sertifi_server( ) Then
	if gb_message = true then 
		gnv_debug.of_message("Echosign Error: Cannot connect to echosign server. You may experience some network connection issue or failed to install the SOAP toolkit.")
	else
		Messagebox('Echosign Error','Cannot connect to echosign server. You may experience some network connection issue or failed to install the SOAP toolkit.')
	end if 
	Return False
End If

//Ping current API code
integer li_ret
If ab_ping_apicode Then
	//ls_apicode = 'XY5JXPL2M3X7I8M'
	li_ret = This.of_ping_apicode(is_apicode) 
	Choose Case li_ret 
		Case -1
			if gb_message = true then 
				gnv_debug.of_message("Echosign Error: The Echosign API code is invalid, plese open System -> Utilites -> Electronic Signature Settings, then input the correct Echosign API code.")
			else
				Messagebox('Echosign Error','The Echosign API code is invalid, plese open System -> Utilites -> Electronic Signature Settings, then input the correct Echosign API code.')
			end if 
			Return False
		Case -2
			if gb_message = true then 
				gnv_debug.of_message("Echosign Error: Cannot connect to Echosign server. You may experience some network connection issue.")
			else
				Messagebox('Echosign Error','Cannot connect to Echosign server. You may experience some network connection issue.')
			end if 
			Return False
	End Choose
End If


ib_isvalid_sertifi = True

Return True



end function

public function boolean of_ping_sertifi_server ();
String ls_ret

Try
	ls_ret = Lower(isoap_echosign.testping(is_apicode)) 

	If Pos(ls_ret, 'it works') > 0 Then
		Return True
	Else
		Return False
	End If
Catch (Throwable	E2)
	if gb_message = true then 
		gnv_debug.of_message("Echosign Error(of_ping_sertifi_server): "+e2.text)
	else
		Messagebox('Error',e2.text)
	end if 
	Return False //Failed to connect to echosign server
End Try

Return False
end function

public function integer of_get_doc_status (str_sertifi_doc astr_sertifi_doc, ref str_sertifi_file astr_sertifi_file, boolean ab_showerror);String ls_filestatus = 'error'
String ls_error,ls_errormessage
integer li_ret,i = 1,j
string ls_null,ls_docname

setnull(ls_null)
tns__documentinformation ltns__documentinfo

SetPointer(HourGlass!)

If Not ib_isvalid_sertifi Then 
	If Not This.of_check_sertifi( ) Then Return -1
End If


 //Added By Ken.Guo 2017-09-09. support echosign http type    
 String ls_esign_token
n_cst_webapi lnv_webapi
tns__documentinformation ltns__documentinformation
If astr_sertifi_doc.as_echosign_method = 'http' Then
	gnv_echosign.of_refresh_access_token(astr_sertifi_doc.as_esign_license_user_id)
	if astr_sertifi_doc.as_esign_license_user_id = 'global_license_user' then
		ls_esign_token = gnv_user_option.of_get_option_value('contractlogix-super-master', "esign_access_token" )
	else
		select esign_access_token into :ls_esign_token from personal_license_setting where esign_type='echosign' and user_id = :astr_sertifi_doc.as_esign_license_user_id;
	end if
	if isnull(gs_accesstoken) or trim(gs_accesstoken) = '' then gs_accesstoken = lnv_webapi.of_convert_json_token()
	Do 
		li_ret = lnv_webapi.of_esign_get_agreement(gs_accesstoken,ls_esign_token,astr_sertifi_doc.as_es_fileid,ltns__documentinformation)
		If li_ret = -8 Then
			 gnv_echosign.of_refresh_access_token(True, '', ls_esign_token)
//				ib_auto_ref_token = False
		End If
	Loop While  li_ret = -8 
	
	if not li_ret < 0 then
		astr_sertifi_file.astr_sertifi_document[1].Name = ltns__documentinformation.documentname
		astr_sertifi_file.astr_sertifi_document[1].Status = ltns__documentinformation.docsatus
		astr_sertifi_file.astr_sertifi_document[1].DocumentID = astr_sertifi_doc.as_es_docid
	end if
Else
	Try
		  ltns__documentinfo = isoap_echosign.getfileinfo( astr_sertifi_doc.as_es_apicode , astr_sertifi_doc.as_es_docid)
		 ls_errormessage = ltns__documentinfo.errormessage
	Catch (Throwable	E2)	
		ib_isvalid_sertifi = False
		if gb_message = true then 
			gnv_debug.of_message("Echosign Error(of_get_doc_status("+ astr_sertifi_doc.as_es_docid+")): "+ E2.text)
		else
			Messagebox('Error', E2.text )
		end if 
	End Try
	
	If Left(Lower(ls_errormessage),5) = 'error' Then
		If ab_showerror Then Messagebox('Error',ls_errormessage)
		gnv_debug.of_output(True, 'Failed to get file echosign status.' + ls_errormessage)
		gnv_debug.of_output(True, 'Document ID:' + String(astr_sertifi_doc.al_doc_id ))
		gnv_debug.of_output(True, 'ES File ID:' + astr_sertifi_doc.as_es_fileid  )
		ib_isvalid_sertifi = False
		Return -1
	End If
	
	
	//Get echosign Document Info
	//select doc_name into :ls_docname from ctx_am_document where es_docid = :astr_sertifi_doc.as_es_docid;
	select doc_name into :ls_docname from ctx_am_document where doc_id = :astr_sertifi_doc.al_doc_id;
	astr_sertifi_file.astr_sertifi_document[i].DocumentID  = astr_sertifi_doc.as_es_docid
	astr_sertifi_file.name = ltns__documentinfo.documentname 
	astr_sertifi_file.astr_sertifi_document[i].Name  = ls_docname
	astr_sertifi_file.astr_sertifi_document[i].Status  = ltns__documentinfo.docsatus
	
	//Get Echosign Signature Info
	For j = 1 To UpperBound(ltns__documentinfo.signature[])
	//	if upper(ltns__documentinfo.signature[j].roles) <> 'SIGNER' then continue //only get role is signer's participant
			if pos(upper(ltns__documentinfo.signature[j].roles),'SIGNER') = 0 then continue //only get role is signer's participant
		astr_sertifi_file.astr_sertifi_document[i].astr_sertifi_signature[j].Email  = ltns__documentinfo.signature[j].signeremail
		astr_sertifi_file.astr_sertifi_document[i].astr_sertifi_signature[j].NameSigned  = ltns__documentinfo.signature[j].namesigned
		astr_sertifi_file.astr_sertifi_document[i].astr_sertifi_signature[j].IpAddress  =  ltns__documentinfo.signature[j].signerip
		if ltns__documentinfo.signature[j].signeddate = '0001/01/01' then
			astr_sertifi_file.astr_sertifi_document[i].astr_sertifi_signature[j].DateSigned  =  ls_null
		else
			 astr_sertifi_file.astr_sertifi_document[i].astr_sertifi_signature[j].DateSigned  = ltns__documentinfo.signature[j].signeddate
		end if
	Next
			
	Return li_ret
	
End If




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

	Select Top 1 lookup_code Into :il_doc_declined From code_lookup Where lookup_name = 'Contract Document Status' And code = 'Declined';//added by gavin  20160525
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
		If Messagebox('Echosign Error' + String(ll_ret) ,'The system detected that you do not have SOAP Toolkit installed on your machine. '+ &
		+'You need to install it before you can use the Electronic Signature function. ~r~n~r~nDo you want to download it now??') = 1 Then
			ShellExecuteA ( Handle( This ), "open", 'IEXPLORE', ls_soap_link , ls_Null, 4)			
		End If
		Return False
	Else
		Messagebox('Echosign Error' + String(ll_ret) ,'Failed to create the SOAP instance, please call support.')
	End If
	Return False 
End If


//Check Sertifi Module whether set to On.
If gnv_data.of_getitem( 'icred_settings', 'esign', False) ='1' Then
	//used
Else
	Messagebox('Echosign Error','You did not purchase the Electronic Signature Module. To access this option please contact your sales representative at (866)371-4445 for more information.')
	Return False
End If
 
If is_emailaddress = '' or isnull(is_emailaddress) Then
	Messagebox('Echosign Error','Your email address is empty, please open System -> Personal Settings -> Email Account, then input the email account info.')
	Return False
End If
If Pos(is_emailaddress,'@') <= 0 Then
	Messagebox('Echosign Error','Your email address is incorrect, please open System -> Personal Settings -> Email Account, then input the full email address.')
	Return False
End If

//Check code
If isnull(il_esign) Then
	Messagebox('Echosign Error','It have no Esign code in the Lookup Painter for Contract Action Type, please add it.')
	Return False
End If
If isnull(il_signed) Then
	Messagebox('Echosign Error','It have no Signed code in the Lookup Painter for Contract Action Status, please add it.')
	Return False
End If
If isnull(il_incomplete) Then
	Messagebox('Echosign Error','It have no Incomplete code in the Lookup Painter for Contract Action Status, please add it.')
	Return False
End If


if ab_personal_data then
	select esign_apicode
	into :is_apicode
	from personal_license_setting 
	where user_id = :gs_user_id and esign_type='echosign';

	If isnull(is_apicode) or is_apicode = '' Then
		Messagebox('Echosign Error','The system has detected that there is no personal E-Signature license API code configured for the current user. Please go to User Painter -> E-Signature License to configure valid license API code information.')
		Return False
	End If

	//Ping Server or local env.
	If Not of_ping_sertifi_server( ) Then
		Messagebox('Echosign Error','Cannot connect to echosign server. You may experience some network connection issue or failed to install the SOAP toolkit.')
		Return False
	End If
	
else
	is_apicode = as_apicode
end if

//Ping current API code
integer li_ret
If ab_ping_apicode Then
	//ls_apicode = 'XY5JXPL2M3X7I8M'
	li_ret = This.of_ping_apicode(is_apicode) 
	Choose Case li_ret 
		Case -1
			Messagebox('Echosign Error','The Echosign API code is invalid, plese open System -> Utilites -> Electronic Signature Settings, then input the correct Echosign API code.')
			Return False
		Case -2
			Messagebox('Echosign Error','Cannot connect to Echosign server. You may experience some network connection issue.')
			Return False
	End Choose
End If

ib_isvalid_sertifi = True

Return True



end function

public function integer of_refresh_access_token (string as_license_user);//////////////////////////////////////////////////////////////////////
// $<function>of_refresh_access_token()
// $<arguments>String as_license_user
// $<returns> Integer
// $<description> auto refresh accesstoken of echosign.
// $<description> 
//////////////////////////////////////////////////////////////////////
// $<add> 2017-01-21 by Harry
//////////////////////////////////////////////////////////////////////

Boolean lb_need_refresh = False
DateTime ldt_server_dt, ldt_token_dt
Date ld_server_date, ld_token_date
Time lt_server_time, lt_token_time
Long ll_spac_time = 3600 //3600s
Long ll_spac_day
long ll_rtn 
String ls_access_token,ls_refresh_token,ls_token_date
n_cst_webapi inv_webapi

ldt_server_dt = f_get_server_dtm()

If pos(as_license_user, "global_license") > 0 Then
	ls_token_date = gnv_user_option.of_get_option_value('contractlogix-super-master', "esign_token_date" )
Else
	SELECT esign_token_date INTO :ls_token_date FROM personal_license_setting WHERE esign_type='echosign' and user_id = :as_license_user;
End If

ldt_token_dt = DateTime(ls_token_date)

ld_server_date = Date(ldt_server_dt)
lt_server_time =  Time(ldt_server_dt)
ld_token_date = Date(ldt_token_dt)
lt_token_time =  Time(ldt_token_dt)

ll_spac_day = DaysAfter ( ld_token_date, ld_server_date )
If ll_spac_day >= 1 Then
	lb_need_refresh = True
ElseIf (ll_spac_day < 1 and ll_spac_day >= 0) and SecondsAfter(lt_token_time, lt_server_time) > ll_spac_time Then
	lb_need_refresh = True
Else
	lb_need_refresh = False
End If

//If lb_need_refresh Then
//	if isnull(gs_accesstoken) or trim(gs_accesstoken) = '' then gs_accesstoken = inv_webapi.of_convert_json_token()
//	ll_rtn = inv_webapi.of_esign_refresh_token(gs_accesstoken, 'contractlogix-super-master',ls_access_token,ls_refresh_token,ls_token_date)
//	if ll_rtn < 0 then
//		messagebox("Information","Refresh esign token fail!")
//		return -1
//	end if
//	gnv_user_option.of_retrieve("contractlogix-super-master") 
//End If
of_refresh_access_token (lb_need_refresh, as_license_user, ls_access_token)

return 1
end function

public function integer of_refresh_access_token (boolean ab_need_ref, string as_license_user, ref string as_esign_token);//////////////////////////////////////////////////////////////////////
// $<function>of_refresh_access_token()
// $<arguments>
//		boolean ab_need_ref
//		String as_license_user
// $<returns> Integer
// $<description> auto refresh accesstoken of echosign.
// $<description> 
//////////////////////////////////////////////////////////////////////
// $<add> 2017-02-03 by Harry
//////////////////////////////////////////////////////////////////////

long ll_rtn 
string ls_access_token,ls_refresh_token,ls_token_date
string ls_mode
string ls_user_id 
n_cst_webapi inv_webapi

If isnull(as_license_user) or as_license_user = '' Then
	ls_mode = gnv_user_option.of_get_option_value(gs_user_id, "echosign_license_mode" )
	if isnull(ls_mode) or ls_mode = '' then ls_mode = "global_license"
Else
	ls_mode = as_license_user
End If

If ab_need_ref Then
	if isnull(gs_accesstoken) or trim(gs_accesstoken) = '' then gs_accesstoken = inv_webapi.of_convert_json_token()
	If pos(ls_mode, "global_license") > 0 Then
		ls_user_id = 'contractlogix-super-master'
	Else
		ls_user_id = gs_user_id
	End If
	ll_rtn = inv_webapi.of_esign_refresh_token(gs_accesstoken, ls_user_id,ls_access_token,ls_refresh_token,ls_token_date)
	if ll_rtn < 0 then
		messagebox("Information","Refresh esign token fail!")
		return -1
	end if
	If pos(ls_mode, "global_license") > 0 Then
		//Modified By Ken.Guo 2017-06-22
		//gnv_user_option.of_retrieve("contractlogix-super-master") 
		gnv_user_option.of_retrieve(gs_user_id) 
	Else
		UPDATE personal_license_setting 
		SET   esign_access_token = :ls_access_token,
       			esign_refresh_token = :ls_refresh_token,
                  esign_token_date = :ls_token_date
		WHERE user_id = :ls_user_id
		AND esign_type = :gs_esigntype;
	End If
	as_esign_token = ls_access_token
End If

return 1
end function

on n_cst_echosign.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_echosign.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event destructor;If isvalid(isoap_conn) Then Destroy isoap_conn
end event
