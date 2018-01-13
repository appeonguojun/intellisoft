$PBExportHeader$pfc_cst_nv_fax.sru
forward
global type pfc_cst_nv_fax from nonvisualobject
end type
end forward

global type pfc_cst_nv_fax from nonvisualobject
end type
global pfc_cst_nv_fax pfc_cst_nv_fax

forward prototypes
public function integer of_email (string as_recipient, string as_company, string as_email_address, string as_subject, string as_cover_text, string as_attachments[], string as_cover_page)
public function integer of_msfax (string as_recipient, string as_company, string as_fax_number, string as_subject, string as_cover_text, string as_attachments[], string as_cover_page, ref string as_errtext)
public function integer of_fax (string as_recipient, string as_company, string as_fax_number, string as_subject, string as_cover_text, string as_attachments[], string as_cover_page, ref string as_errtext)
public function integer of_winfax (string as_recipient, string as_company, string as_fax_number, string as_subject, string as_cover_text, string as_attachments[], string as_cover_page, ref string as_errtext)
public function integer of_email_outlook (string as_recipient, string as_company, string as_email_address, string as_subject, string as_cover_text, string as_attachments[], string as_cover_page)
end prototypes

public function integer of_email (string as_recipient, string as_company, string as_email_address, string as_subject, string as_cover_text, string as_attachments[], string as_cover_page);//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 06/13/2007 By: Ken.Guo
//$<reason> Send Email.

//Start Code Change ----10.06.2008 #V85 maha
if of_get_app_setting("set_56","I") = 1 then
	integer res
	res = of_email_outlook( as_recipient, as_company, as_email_address,as_subject ,as_cover_text, as_attachments[],  as_cover_page )
	return res
end if
//End Code Change---10.06.2008

/******************************************************************************************************************
**  [PUBLIC]   : of_email
**==================================================================================================================
**  Purpose   	: Send email out with attachments
**==================================================================================================================
**  Arguments 	: [string] as_recipient
**          	: [string] as_company        - not used
**          	: [string] as_email_address
**          	: [string] as_subject
**          	: [string] as_cover_text      -not used
**          	: [string] as_attachments[]
**          	: [string] as_cover_page      -not used 
**==================================================================================================================
**  Returns   	: [long]   1 none oter used 
**==================================================================================================================
**  Notes     	: 	   
**==================================================================================================================
**  Created By	: ?? 
**==================================================================================================================
**  Modification Log
**   Changed By             Change Date                                               Reason
** ------------------------------------------------------------------------------------------------------------------
**  mskinner               16 December 2005                                  -- Added error messages
**                                                                           -- cleaned up code
**                                                                           -- The code will now acceept an infinate attachments
**                                                                           -- The function no longer returns -1, if it did the rest
**                                                                              of the emails will not be sent
********************************************************************************************************************/

/*
mailSession mSes
mailReturnCode mRet
mailMessage mMsg
mailFileDescription mAttach

STRING ls_attach 
STRING ls_emp_mail_login
STRING ls_file_name
STRING ls_temp_path
STRING ls_message
LONG   ll_return,ll_i
LONG   AttachFile_Index
LONG   li_attachment_cnt

ll_return = 1

mSes = create mailSession
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> UM-02
//$<add> 01.25.2006 By: LeiWei
//$<reason> mailSession is currently unsupported.
//$<modification> Manually specify mailReturnSuccess! as the initial value to mRet.
mRet = mailReturnSuccess!
//---------------------------- APPEON END ----------------------------

mRet = mSes.mailLogon( mailNewSession!) 
IF mRet <> mailReturnSuccess! THEN
	MessageBox("Mail", 'Logon failed.  Check to make sure you have an email id setup in the user painter.')		
	Return -1
END IF

li_attachment_cnt = UpperBound( as_attachments )

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// add the attachments
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

FOR ll_i = 1 TO li_attachment_cnt
	ls_temp_path =  gs_dir_path + gs_DefDirName + "\fax\"
	ls_file_name = Mid( as_attachments[ll_i], Len( ls_temp_path) + 1, 1000 )
	AttachFile_Index = UpperBound(mMsg.AttachmentFile) + 1
	mAttach.FileType = MailAttach!
	mAttach.PathName = as_attachments[ll_i] 
	mAttach.FileName = as_attachments[ll_i] 
	mAttach.position = ll_i
	mMsg.AttachmentFile[AttachFile_Index] = mAttach
END FOR

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// send the mail out
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

mMsg.Subject = as_subject
mMsg.NoteText = as_cover_text
mMsg.Recipient[1].name = as_email_address
mRet = mSes.mailSend(mMsg)

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// check for errors
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

choose case mret 
        case mailReturnAccessDenied! 
                ls_message = 'Access Denied' 
        case mailReturnAttachmentNotFound! 
                ls_message = 'Attachment Not Found' 
        case mailReturnAttachmentOpenFailure! 
                ls_message = 'Attachment Open Failure' 
        case mailReturnAttachmentWriteFailure! 
                ls_message = 'Attachment Write Failure' 
        case mailReturnDiskFull! 
                ls_message = 'Disk Full' 
        case mailReturnFailure! 
                ls_message = 'Failure' 
        case mailReturnInsufficientMemory! 
                ls_message = 'Insufficient Memory' 
        case mailReturnInvalidMessage! 
                ls_message = 'Invalid Message' 
        case mailReturnLoginFailure! 
                ls_message = 'Login Failure' 
        case mailReturnMessageInUse! 
                ls_message = 'Message In Use' 
        case mailReturnNoMessages! 
                ls_message = 'No Messages' 
        case mailReturnTextTooLarge! 
                ls_message = 'Text Too Large' 
        case mailReturnTooManyFiles! 
                ls_message = 'Too Many Files' 
        case mailReturnTooManyRecipients! 
                ls_message = 'Too Many Recipients' 
        case mailReturnTooManySessions! 
                ls_message = 'Too Many Sessions' 
        case mailReturnUnknownRecipient! 
                ls_message = 'Unknown Recipient' 
        case mailReturnUserAbort! 
                ls_message = 'User Abort' 
        case mailReturnSuccess! 
                ls_message = '' 
        case else 
                ls_message = 'Other' 
end choose 

if ls_message <> '' then 
	MessageBox ( 'Mail Return Code', ls_message, Exclamation!)
end if 

mSes.mailLogoff()

DESTROY mSes

Return ll_return
*/


Integer i

String ls_address_mailcc,ls_attachments
For i = 1 to upperbound(as_attachments)
	If i = 1 Then
		ls_attachments = as_attachments[i]
	Else
		ls_attachments = ls_attachments + ',' +as_attachments[i]
	End If
		
Next

//--------------------------- APPEON BEGIN ---------------------------
//$<Modify> 2007-11-21 By: Scofield
//$<Reason> Change the interface of send mail

//IF lnv_redemption_mail.of_start_email( as_email_address,ls_address_mailcc,as_cover_text, as_subject, ls_attachments) < 0 THEN
//	Return -1
//END IF

long		ll_Return

n_cst_easymail_smtp 	lnv_Mail

if lnv_Mail.of_CreateObject() = -1 then
	//Added by Nova.zhang on 2008-11-07
	f_show_message('create Email object','','','','')
	//MessageBox("Error", "Failed to create email object!",StopSign!)
	Return -1
end if

//START---Modify by Evan 2008-03-24 (Reasion:Send email with current user account)
/*
//--------------------------- APPEON BEGIN ---------------------------
//$< Add  > 2008-02-22 By: Scofield
//$<Reason> Get the Addresser's user id.

String	ls_Addresser

select top 1 set_addresser into :ls_Addresser from icred_settings;

if IsNull(ls_Addresser) or Trim(ls_Addresser) = "" then
	ls_Addresser = gs_User_Id
end if
//---------------------------- APPEON END ----------------------------

//Send EMail
ll_Return = lnv_Mail.of_SendText(ls_Addresser, as_email_address, ls_address_mailcc, '',as_subject, as_cover_text, ls_attachments)
*/
ll_Return = lnv_Mail.of_SendText(gs_user_id, as_email_address, ls_address_mailcc, '',as_subject, as_cover_text, ls_attachments)
//END---Modify by Evan 2008-03-24

if ll_Return <> 0 then
	//Added by Nova.zhang on 2008-11-07
	If lnv_Mail.is_sendprotocol = 'SMTP' Then
		f_show_message('error_code_'+string(ll_Return),'%1S%',String(ll_Return),'','')
	Else
		f_show_message('error_code_'+string(ll_Return),'ALL',lnv_Mail.of_getemailerror(ll_Return),'','')
	End If
	//MessageBox("Error Code: " + String(ll_Return), "Failed to send email!~r~n~r~n" + lnv_Mail.of_GetEMailError(ll_Return),Exclamation!)
	lnv_Mail.of_DeleteObject()
	return -1
end if

lnv_Mail.of_DeleteObject()

//---------------------------- APPEON END ----------------------------
Return 1

end function

public function integer of_msfax (string as_recipient, string as_company, string as_fax_number, string as_subject, string as_cover_text, string as_attachments[], string as_cover_page, ref string as_errtext);//////////////////////////////////////////////////////////////////////
// $<function>pfc_cst_nv_faxof_msfax()
// $<arguments>
//		value	string	as_recipient    		
//		value	string	as_company    --Not use for msfax 		
//		value	string	as_fax_number   		
//		value	string	as_subject      		
//		value	string	as_cover_text   		
//		value	string	as_attachments[]	--only one attachment can be send for msfax	
//		value	string	as_cover_page   		
// $<returns> integer
// $<description> Send fax with MSfax printer
//////////////////////////////////////////////////////////////////////
// $<add> 05/30/2007 by Ken.Guo
//////////////////////////////////////////////////////////////////////
String ls_attach
String ls_errtext
n_cst_msfax nvo_msfax
nvo_msfax = Create n_cst_msfax

integer i,li_ret,li_ret1 
//If upperbound(as_attachments) > 0 Then
//	ls_attach = as_attachments[1]
//Else
//	ls_attach = ''
//End If
//

If upperbound(as_attachments) = 0 Then
	ls_attach = ''
	li_ret =  nvo_msfax.of_fax(as_recipient,  as_fax_number, as_subject, as_cover_text, ls_attach, as_cover_page )	
Else
	For i = 1 To upperbound(as_attachments)
		ls_attach = as_attachments[i]
		li_ret1 =  nvo_msfax.of_fax(as_recipient,  as_fax_number, as_subject, as_cover_text, ls_attach, as_cover_page )	
		If li_ret1 < 0 Then
			li_ret = li_ret1
		End If
	Next
End If
as_errtext = ''
If li_ret < 0 Then
	as_errtext = nvo_msfax.of_get_errtext( li_ret)
	Destroy nvo_msfax
	Return -1
End If

return 1
end function

public function integer of_fax (string as_recipient, string as_company, string as_fax_number, string as_subject, string as_cover_text, string as_attachments[], string as_cover_page, ref string as_errtext);//--------------------------- APPEON BEGIN ---------------------------
//$<add> 05/29/2007 By: Ken.Guo
//$<reason> Added for MSFax Printer. Set_52 is fax type(Fax_type,2:MSFax,1:WINFax)
integer li_ret 
//String ls_errtext
If gds_settings.GetItemNumber(1,'set_52') = 1  THEN
	//1: WinFax Type
	li_ret = of_winfax( as_recipient, as_company, as_fax_number, as_subject, as_cover_text, as_attachments[], as_cover_page,as_errtext )	
Else
	//2: MSFax Type
	li_ret = of_msfax( as_recipient, as_company, as_fax_number, as_subject, as_cover_text, as_attachments[], as_cover_page,as_errtext )	
END IF

Return li_ret


//$<modify> 05/30/2007 By: Ken.Guo
//$<reason> Cut all below script to of_winfax() For support WinFax.

/*
	string sQ = "~""
	Long ChanNum
	Integer iRC
	Integer a
	String ls_resolution
	String ls_time
	String ls_date
	gs_fax lgs_fax
	
	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> UM-01
	//$<add> 10.19.2006 By: Alfee
	//$<reason> The DDE server is not completed supported by APB.
	//$<modification> Using SDK function to replace DDE function on web application.
	/*
	as_company = Mid( as_company, 1 , 42 )
	
	ls_time = String( Now(), "HH:MM:SS" )
	ls_date = String( Today( ), "mm/dd/yy"  )
	
	ls_resolution = "High"
	
	
	ChanNum = OpenChannel("FAXMNG32", "CONTROL")
	
	
	IF ChanNum < 0 THEN
		MessageBox("Error", "Winfax is not installed or needs to be configured." )
		Return -1
	END IF
	
	ExecRemote("GoIdle", ChanNum )
	
	
	CloseChannel (ChanNum)
	
	//'Create a new link with the TRANSMIT topic.
	ChanNum = OpenChannel ("FAXMNG32", "TRANSMIT")
	
	//set recipient
	iRC = SetRemote ( "Sendfax", "recipient(" + sQ + as_fax_number + sQ + "," + sQ + ls_time + sQ + "," + sQ + ls_date + sQ + "," + sQ + as_recipient + sQ + "," + sQ + as_company + sQ + "," + sQ + as_subject + sQ + "," + sQ + "" + sQ + "," + sQ + "" + sQ + "," + sQ + "" + sQ + ")", ChanNum )
	
	//'setcoverpage
	iRC = SetRemote ( "Sendfax", "setcoverpage(" + sQ + as_cover_page + sQ + ")", ChanNum )
	
	//'fillcoverpage
	iRC = SetRemote ( "Sendfax", "fillcoverpage(" + sQ + as_cover_text + sQ + ")", ChanNum )
	//DDEPoke ChanNum, "sendfax", "fillcoverpage(" + sQ + "Please send comments by Friday noon." + sQ + ")"
	
	//'attach
	FOR a = 1 TO UpperBound( as_attachments[] )
		//messagebox("","attach(" + sQ + as_attachments[a] + sQ + ")")
		iRC = SetRemote ( "Sendfax", "attach(" + sQ + as_attachments[a] + sQ + ")", ChanNum )
	END FOR
	
	
	
	//showsendscreen
	iRC = SetRemote ( "Sendfax", "showsendscreen(" + sQ + "0" + sQ + ")", ChanNum )
	//DDEPoke ChanNum, "sendfax", "showsendscreen(" + sQ + "0" + sQ + ")"
	
	iRC = SetRemote ( "Sendfax", "ShowMaximized()", ChanNum )
	
	//resolution
	iRC = SetRemote ( "Sendfax", "resolution(" + sQ + ls_resolution + sQ + ")", ChanNum )
	
	
	//'Tell WinFax to send the fax.
	iRC = SetRemote ( "Sendfax", "SendfaxUI", ChanNum )
	
	CloseChannel (ChanNum)
	//DDETerminate ChanNum
	
	ChanNum = OpenChannel ("FAXMNG32", "CONTROL")
	//ChanNum = DDEInitiate("FAXMNG32", "CONTROL")
	
	
	ExecRemote("GoActive", ChanNum )
	
	
	//'Close the link between the applications.
	CloseChannel (ChanNum)
	//DDETerminate ChanNum
	*/
	If AppeonGetclientType() = 'PB' Then
		as_company = Mid( as_company, 1 , 42 )
	
		ls_time = String( Now(), "HH:MM:SS" )
		ls_date = String( Today( ), "mm/dd/yy"  )
		
		ls_resolution = "High"
		
		ChanNum = OpenChannel("FAXMNG32", "CONTROL")
		
		IF ChanNum < 0 THEN
			MessageBox("Error", "Winfax is not installed or needs to be configured." )
			Return -1
		END IF
		
		ExecRemote("GoIdle", ChanNum )
		
		CloseChannel (ChanNum)
		
		//'Create a new link with the TRANSMIT topic.
		ChanNum = OpenChannel ("FAXMNG32", "TRANSMIT")
		
		//set recipient
		iRC = SetRemote ( "Sendfax", "recipient(" + sQ + as_fax_number + sQ + "," + sQ + ls_time + sQ + "," + sQ + ls_date + sQ + "," + sQ + as_recipient + sQ + "," + sQ + as_company + sQ + "," + sQ + as_subject + sQ + "," + sQ + "" + sQ + "," + sQ + "" + sQ + "," + sQ + "" + sQ + ")", ChanNum )
		
		//'setcoverpage
		iRC = SetRemote ( "Sendfax", "setcoverpage(" + sQ + as_cover_page + sQ + ")", ChanNum )
		
		//'fillcoverpage
		iRC = SetRemote ( "Sendfax", "fillcoverpage(" + sQ + as_cover_text + sQ + ")", ChanNum )
		//DDEPoke ChanNum, "sendfax", "fillcoverpage(" + sQ + "Please send comments by Friday noon." + sQ + ")"
		
		//'attach
		FOR a = 1 TO UpperBound( as_attachments[] )
			//messagebox("","attach(" + sQ + as_attachments[a] + sQ + ")")
			iRC = SetRemote ( "Sendfax", "attach(" + sQ + as_attachments[a] + sQ + ")", ChanNum )
		END FOR
		
		//showsendscreen
		iRC = SetRemote ( "Sendfax", "showsendscreen(" + sQ + "0" + sQ + ")", ChanNum )
		//DDEPoke ChanNum, "sendfax", "showsendscreen(" + sQ + "0" + sQ + ")"
		
		iRC = SetRemote ( "Sendfax", "ShowMaximized()", ChanNum )
		
		//resolution
		iRC = SetRemote ( "Sendfax", "resolution(" + sQ + ls_resolution + sQ + ")", ChanNum )
		
		//'Tell WinFax to send the fax.
		iRC = SetRemote ( "Sendfax", "SendfaxUI", ChanNum )
		
		CloseChannel (ChanNum)
		//DDETerminate ChanNum
		
		ChanNum = OpenChannel ("FAXMNG32", "CONTROL")
		//ChanNum = DDEInitiate("FAXMNG32", "CONTROL")
		
		ExecRemote("GoActive", ChanNum )
		
		//'Close the link between the applications.
		CloseChannel (ChanNum)
		//DDETerminate ChanNum
	Else
		OLEObject objWinfaxSend
	
		as_company = Mid( as_company, 1 , 42 )
		
		ls_time = String( Now(), "HH:MM:SS" )
		ls_date = String( Today( ), "mm/dd/yy"  )
		
		ls_resolution = "High"
		
		objWinfaxSend = CREATE OLEObject
		iRC = objWinfaxSend.ConnectToNewObject("WinFax.SDKSend")
		if iRC < 0 then
			MessageBox("Error","Winfax is not installed or needs to be configured.")
			Return -1
		end if
		
		objWinfaxSend.LeaveRunning()
		
		objWinfaxSend.SetNumber(as_fax_number)
		objWinfaxSend.SetTime(ls_time)
		objWinfaxSend.SetDate(ls_date)
		objWinfaxSend.SetTo(as_recipient)
		objWinfaxSend.setCompany(as_company)
		objWinfaxSend.setSubject(as_subject)
		objWinfaxSend.setCoverFile(as_cover_page)   
		objWinfaxSend.setCoverText(as_cover_text)
		
		FOR a = 1 TO UpperBound( as_attachments[] )
			if objWinfaxSend.AddAttachmentFile(as_attachments[a]) = 1 THEN
				Messagebox('Error', "Add attachment file failed!")
				return -1
			end if
		END FOR
		
		objWinfaxSend.ShowSendScreen(0) //Don't display the send dialog
		objWinfaxSend.SetResolution(1) //Set High resolution
		objWinfaxSend.AddRecipient()  // Add Recipient
		
		iRC = objWinfaxSend.Send(0) //Tell WinFax to send the fax.
		if iRC = 1 then
			MessageBox("Error","Send fax error!")
		END IF
		
		objWinfaxSend.Done //Tell WinFax job done to performs some internal cleaning.
		
		objWinfaxSend.DisconnectObject()
		Destroy objWinfaxSend
	
	End if
	
	// mbs 23 dec 2004 run fax pro -- begin
	string ls_key
	n_cst_string lnvo_string 
	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> UM-01
	//$<add> 04.13.2006 By: Cao YongWang
	//$<reason> The RegistryGet function is currently unsupported.
	//$<modification> Use Appeon DLL function to provide the same functionality.
	/*
	RegistryGet("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\FAXMNG32.EXE",  "PATH", RegString!, ls_key)
	*/
	If appeongetclienttype() = 'PB' Then
		RegistryGet("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\FAXMNG32.EXE",  "PATH", RegString!, ls_key)
	Else
		gnv_appeondll.of_RegistryGet("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\FAXMNG32.EXE",  "PATH", RegString!, ls_key)
	End if
	//---------------------------- APPEON END ----------------------------
	
	run( LS_KEY + "faxmng32.exe")
	// mbs 23 dec 2004 run fax pro -- begin
	
	
	/*
	ShellExecuteA ( Handle( This ), "open", "faxmng32.exe" , ls_Null, ls_Null, 4)
	*/
	
	Return 1
	*/
//---------------------------- APPEON END ----------------------------	
end function

public function integer of_winfax (string as_recipient, string as_company, string as_fax_number, string as_subject, string as_cover_text, string as_attachments[], string as_cover_page, ref string as_errtext);string sQ = "~""
Long ChanNum
Integer iRC
Integer a
String ls_resolution
String ls_time
String ls_date
gs_fax lgs_fax



//--------------------------- APPEON BEGIN ---------------------------
//$<ID> UM-01
//$<add> 10.19.2006 By: Alfee
//$<reason> The DDE server is not completed supported by APB.
//$<modification> Using SDK function to replace DDE function on web application.
/*
as_company = Mid( as_company, 1 , 42 )

ls_time = String( Now(), "HH:MM:SS" )
ls_date = String( Today( ), "mm/dd/yy"  )

ls_resolution = "High"


ChanNum = OpenChannel("FAXMNG32", "CONTROL")


IF ChanNum < 0 THEN
	MessageBox("Error", "Winfax is not installed or needs to be configured." )
	Return -1
END IF

ExecRemote("GoIdle", ChanNum )


CloseChannel (ChanNum)

//'Create a new link with the TRANSMIT topic.
ChanNum = OpenChannel ("FAXMNG32", "TRANSMIT")

//set recipient
iRC = SetRemote ( "Sendfax", "recipient(" + sQ + as_fax_number + sQ + "," + sQ + ls_time + sQ + "," + sQ + ls_date + sQ + "," + sQ + as_recipient + sQ + "," + sQ + as_company + sQ + "," + sQ + as_subject + sQ + "," + sQ + "" + sQ + "," + sQ + "" + sQ + "," + sQ + "" + sQ + ")", ChanNum )

//'setcoverpage
iRC = SetRemote ( "Sendfax", "setcoverpage(" + sQ + as_cover_page + sQ + ")", ChanNum )

//'fillcoverpage
iRC = SetRemote ( "Sendfax", "fillcoverpage(" + sQ + as_cover_text + sQ + ")", ChanNum )
//DDEPoke ChanNum, "sendfax", "fillcoverpage(" + sQ + "Please send comments by Friday noon." + sQ + ")"

//'attach
FOR a = 1 TO UpperBound( as_attachments[] )
	//messagebox("","attach(" + sQ + as_attachments[a] + sQ + ")")
	iRC = SetRemote ( "Sendfax", "attach(" + sQ + as_attachments[a] + sQ + ")", ChanNum )
END FOR



//showsendscreen
iRC = SetRemote ( "Sendfax", "showsendscreen(" + sQ + "0" + sQ + ")", ChanNum )
//DDEPoke ChanNum, "sendfax", "showsendscreen(" + sQ + "0" + sQ + ")"

iRC = SetRemote ( "Sendfax", "ShowMaximized()", ChanNum )

//resolution
iRC = SetRemote ( "Sendfax", "resolution(" + sQ + ls_resolution + sQ + ")", ChanNum )


//'Tell WinFax to send the fax.
iRC = SetRemote ( "Sendfax", "SendfaxUI", ChanNum )

CloseChannel (ChanNum)
//DDETerminate ChanNum

ChanNum = OpenChannel ("FAXMNG32", "CONTROL")
//ChanNum = DDEInitiate("FAXMNG32", "CONTROL")


ExecRemote("GoActive", ChanNum )


//'Close the link between the applications.
CloseChannel (ChanNum)
//DDETerminate ChanNum
*/
If AppeonGetclientType() = 'PB' Then
	as_company = Mid( as_company, 1 , 42 )

	ls_time = String( Now(), "HH:MM:SS" )
	ls_date = String( Today( ), "mm/dd/yy"  )
	
	ls_resolution = "High"
	
	ChanNum = OpenChannel("FAXMNG32", "CONTROL")
	
	IF ChanNum < 0 THEN
		//MessageBox("Error", "Winfax is not installed or needs to be configured." )
		as_errtext = "Winfax is not installed or needs to be configured."
		Return -1
	END IF
	
	ExecRemote("GoIdle", ChanNum )
	
	CloseChannel (ChanNum)
	
	//'Create a new link with the TRANSMIT topic.
	ChanNum = OpenChannel ("FAXMNG32", "TRANSMIT")
	
	//set recipient
	iRC = SetRemote ( "Sendfax", "recipient(" + sQ + as_fax_number + sQ + "," + sQ + ls_time + sQ + "," + sQ + ls_date + sQ + "," + sQ + as_recipient + sQ + "," + sQ + as_company + sQ + "," + sQ + as_subject + sQ + "," + sQ + "" + sQ + "," + sQ + "" + sQ + "," + sQ + "" + sQ + ")", ChanNum )
	
	//'setcoverpage
	iRC = SetRemote ( "Sendfax", "setcoverpage(" + sQ + as_cover_page + sQ + ")", ChanNum )
	
	//'fillcoverpage
	iRC = SetRemote ( "Sendfax", "fillcoverpage(" + sQ + as_cover_text + sQ + ")", ChanNum )
	//DDEPoke ChanNum, "sendfax", "fillcoverpage(" + sQ + "Please send comments by Friday noon." + sQ + ")"
	
	//'attach
	FOR a = 1 TO UpperBound( as_attachments[] )
		//messagebox("","attach(" + sQ + as_attachments[a] + sQ + ")")
		iRC = SetRemote ( "Sendfax", "attach(" + sQ + as_attachments[a] + sQ + ")", ChanNum )
	END FOR
	
	//showsendscreen
	iRC = SetRemote ( "Sendfax", "showsendscreen(" + sQ + "0" + sQ + ")", ChanNum )
	//DDEPoke ChanNum, "sendfax", "showsendscreen(" + sQ + "0" + sQ + ")"
	
	iRC = SetRemote ( "Sendfax", "ShowMaximized()", ChanNum )
	
	//resolution
	iRC = SetRemote ( "Sendfax", "resolution(" + sQ + ls_resolution + sQ + ")", ChanNum )
	
	//'Tell WinFax to send the fax.
	iRC = SetRemote ( "Sendfax", "SendfaxUI", ChanNum )
	
	CloseChannel (ChanNum)
	//DDETerminate ChanNum
	
	ChanNum = OpenChannel ("FAXMNG32", "CONTROL")
	//ChanNum = DDEInitiate("FAXMNG32", "CONTROL")
	
	ExecRemote("GoActive", ChanNum )
	
	//'Close the link between the applications.
	CloseChannel (ChanNum)
	//DDETerminate ChanNum
Else
	OLEObject objWinfaxSend

	as_company = Mid( as_company, 1 , 42 )
	
	ls_time = String( Now(), "HH:MM:SS" )
	ls_date = String( Today( ), "mm/dd/yy"  )
	
	ls_resolution = "High"
	
	objWinfaxSend = CREATE OLEObject
	iRC = objWinfaxSend.ConnectToNewObject("WinFax.SDKSend")
	if iRC < 0 then
		//MessageBox("Error","Winfax is not installed or needs to be configured.")
		as_errtext = "Winfax is not installed or needs to be configured."
		Return -1
	end if
	
	objWinfaxSend.LeaveRunning()
	
	objWinfaxSend.SetNumber(as_fax_number)
	objWinfaxSend.SetTime(ls_time)
	objWinfaxSend.SetDate(ls_date)
	objWinfaxSend.SetTo(as_recipient)
	objWinfaxSend.setCompany(as_company)
	objWinfaxSend.setSubject(as_subject)
	objWinfaxSend.setCoverFile(as_cover_page)   
	objWinfaxSend.setCoverText(as_cover_text)
	
	FOR a = 1 TO UpperBound( as_attachments[] )
		if objWinfaxSend.AddAttachmentFile(as_attachments[a]) = 1 THEN
			//Messagebox('Error', "Add attachment file failed!")
			as_errtext = "Add attachment file failed!"
			return -1
		end if
	END FOR
	
	objWinfaxSend.ShowSendScreen(0) //Don't display the send dialog
	objWinfaxSend.SetResolution(1) //Set High resolution
	objWinfaxSend.AddRecipient()  // Add Recipient
	
	iRC = objWinfaxSend.Send(0) //Tell WinFax to send the fax.
	if iRC = 1 then
		//MessageBox("Error","Send fax error!")
		as_errtext = "Send fax error!"
		objWinfaxSend.Done //Tell WinFax job done to performs some internal cleaning.
		objWinfaxSend.DisconnectObject()
		Destroy objWinfaxSend		
		Return -1
	END IF
	
	objWinfaxSend.Done //Tell WinFax job done to performs some internal cleaning.
	
	objWinfaxSend.DisconnectObject()
	Destroy objWinfaxSend

End if

// mbs 23 dec 2004 run fax pro -- begin
string ls_key
n_cst_string lnvo_string 
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> UM-01
//$<add> 04.13.2006 By: Cao YongWang
//$<reason> The RegistryGet function is currently unsupported.
//$<modification> Use Appeon DLL function to provide the same functionality.
/*
RegistryGet("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\FAXMNG32.EXE",  "PATH", RegString!, ls_key)
*/
If appeongetclienttype() = 'PB' Then
	RegistryGet("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\FAXMNG32.EXE",  "PATH", RegString!, ls_key)
Else
	gnv_appeondll.of_RegistryGet("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\FAXMNG32.EXE",  "PATH", RegString!, ls_key)
End if
//---------------------------- APPEON END ----------------------------

run( LS_KEY + "faxmng32.exe")
// mbs 23 dec 2004 run fax pro -- begin


/*
ShellExecuteA ( Handle( This ), "open", "faxmng32.exe" , ls_Null, ls_Null, 4)
*/

Return 1
end function

public function integer of_email_outlook (string as_recipient, string as_company, string as_email_address, string as_subject, string as_cover_text, string as_attachments[], string as_cover_page);////Start Code Change ----10.06.2008 #V85 maha - readded this function under this name
/******************************************************************************************************************
**  [PUBLIC]   : of_email
**==================================================================================================================
**  Purpose   	: Send email out with attachments
**==================================================================================================================
**  Arguments 	: [string] as_recipient
**          	: [string] as_company        - not used
**          	: [string] as_email_address
**          	: [string] as_subject
**          	: [string] as_cover_text      -not used
**          	: [string] as_attachments[]
**          	: [string] as_cover_page      -not used 
**==================================================================================================================
**  Returns   	: [long]   1 none oter used 
**==================================================================================================================
**  Notes     	: 	   
**==================================================================================================================
**  Created By	: ?? 
**==================================================================================================================
**  Modification Log
**   Changed By             Change Date                                               Reason
** ------------------------------------------------------------------------------------------------------------------
**  mskinner               16 December 2005                                  -- Added error messages
**                                                                           -- cleaned up code
**                                                                           -- The code will now acceept an infinate attachments
**                                                                           -- The function no longer returns -1, if it did the rest
**                                                                              of the emails will not be sent
********************************************************************************************************************/

mailSession mSes
mailReturnCode mRet
mailMessage mMsg
mailFileDescription mAttach

STRING ls_attach 
STRING ls_emp_mail_login
STRING ls_file_name
STRING ls_temp_path
STRING ls_message
LONG   ll_return,ll_i
LONG   AttachFile_Index
LONG   li_attachment_cnt

ll_return = 1

mSes = create mailSession
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> UM-02
//$<add> 01.25.2006 By: LeiWei
//$<reason> mailSession is currently unsupported.
//$<modification> Manually specify mailReturnSuccess! as the initial value to mRet.
mRet = mailReturnSuccess!
//---------------------------- APPEON END ----------------------------

mRet = mSes.mailLogon( mailNewSession!) 
IF mRet <> mailReturnSuccess! THEN
	MessageBox("Mail", 'Logon failed.  Check to make sure you have an email id setup in the user painter.')		
	Return -1
END IF

li_attachment_cnt = UpperBound( as_attachments )

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// add the attachments
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

FOR ll_i = 1 TO li_attachment_cnt
	ls_temp_path =  gs_dir_path + gs_DefDirName + "\fax\"
	ls_file_name = Mid( as_attachments[ll_i], Len( ls_temp_path) + 1, 1000 )
	AttachFile_Index = UpperBound(mMsg.AttachmentFile) + 1
	mAttach.FileType = MailAttach!
	mAttach.PathName = as_attachments[ll_i] 
	mAttach.FileName = as_attachments[ll_i] 
	mAttach.position = ll_i
	mMsg.AttachmentFile[AttachFile_Index] = mAttach
END FOR

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// send the mail out
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

mMsg.Subject = as_subject
mMsg.NoteText = as_cover_text
mMsg.Recipient[1].name = as_email_address
mRet = mSes.mailSend(mMsg)

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// check for errors
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

choose case mret 
        case mailReturnAccessDenied! 
                ls_message = 'Access Denied' 
        case mailReturnAttachmentNotFound! 
                ls_message = 'Attachment Not Found' 
        case mailReturnAttachmentOpenFailure! 
                ls_message = 'Attachment Open Failure' 
        case mailReturnAttachmentWriteFailure! 
                ls_message = 'Attachment Write Failure' 
        case mailReturnDiskFull! 
                ls_message = 'Disk Full' 
        case mailReturnFailure! 
                ls_message = 'Failure' 
        case mailReturnInsufficientMemory! 
                ls_message = 'Insufficient Memory' 
        case mailReturnInvalidMessage! 
                ls_message = 'Invalid Message' 
        case mailReturnLoginFailure! 
                ls_message = 'Login Failure' 
        case mailReturnMessageInUse! 
                ls_message = 'Message In Use' 
        case mailReturnNoMessages! 
                ls_message = 'No Messages' 
        case mailReturnTextTooLarge! 
                ls_message = 'Text Too Large' 
        case mailReturnTooManyFiles! 
                ls_message = 'Too Many Files' 
        case mailReturnTooManyRecipients! 
                ls_message = 'Too Many Recipients' 
        case mailReturnTooManySessions! 
                ls_message = 'Too Many Sessions' 
        case mailReturnUnknownRecipient! 
                ls_message = 'Unknown Recipient' 
        case mailReturnUserAbort! 
                ls_message = 'User Abort' 
        case mailReturnSuccess! 
                ls_message = '' 
        case else 
                ls_message = 'Other' 
end choose 

if ls_message <> '' then 
	MessageBox ( 'Mail Return Code', ls_message, Exclamation!)
end if 

mSes.mailLogoff()

DESTROY mSes

Return ll_return
end function

on pfc_cst_nv_fax.create
call super::create
TriggerEvent( this, "constructor" )
end on

on pfc_cst_nv_fax.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

