$PBExportHeader$n_cst_msfax.sru
$PBExportComments$msfax object
forward
global type n_cst_msfax from nonvisualobject
end type
end forward

global type n_cst_msfax from nonvisualobject
end type
global n_cst_msfax n_cst_msfax

type variables
oleobject objFaxServer 


Integer ii_ret
end variables

forward prototypes
public subroutine of_register ()
public function integer of_get_fax_list (ref str_fax_name astr_fax_list[])
public function integer of_select_fax (ref string as_fax_name)
public function integer of_connect_fax (string as_faxserver)
public function integer of_send_fax (string as_faxserver, string as_recipient, string as_fax_number, string as_subject, string as_cover_text, string as_attachments, string as_cover_page)
public function integer of_check_fax_info (string as_attach, string as_cove_page)
public function integer of_check_fax (string as_faxserver)
public function integer of_fax (string as_recipient, string as_fax_number, string as_subject, string as_cover_text, string as_attachments, string as_cover_page)
public function string of_get_errtext (integer ai_code)
public function integer of_check_send_result (string as_docname)
end prototypes

public subroutine of_register ();//////////////////////////////////////////////////////////////////////
// $<function>n_cst_msfaxof_register()
// $<arguments>(None)
// $<returns> (none)
// $<description> Only for windows 2000 
//////////////////////////////////////////////////////////////////////
// $<add> 05/30/2007 by Ken.Guo
//////////////////////////////////////////////////////////////////////
Integer rtn,li_ret 
String ls_run
String ls_version
String ls_faxfile
n_appeon_download lnv_down
//oleobject oletest 
environment env

//oletest = CREATE oleobject

rtn = GetEnvironment(env)
IF rtn <> 1 THEN RETURN
ls_version = string(env.OSMajorRevision) +'.'+ string(env.OSMinorRevision)
If ls_version = '5.0' Then
	////Comment it, Because sometime need update the fxscomex.dll file.
	//	li_ret = oletest.ConnectToNewObject("FAXComEX.FaxServer")
	//	//If it has been registed, then return.
	//	If li_ret = 0 Then 
	//		oletest.DisconnectObject()
	//		Return 
	//	End If
	If AppeonGetClientType() = 'PB' Then
		//5.0 means windows 2000
		ls_run = 'Regsvr32 /s ' +Gs_Current_Directory + '\fxscomex.dll'
		Run(ls_run)
	Else		//For Web
		ls_faxfile = gs_app_image_path + '\fxscomex.dll'
		//Download the file from web server to loacl.
		if not fileexists(ls_faxfile) Then lnv_down.of_downloadfile("" ,ls_faxfile)
		if not fileexists(ls_faxfile) Then Messagebox('Download','Failed to download fxscomex.dll file.')
		ls_run = 'Regsvr32 /s ' + ls_faxfile
		Run(ls_run)
		Sleep(3) //wait for register 
	End If
End If

//Destroy oletest
end subroutine

public function integer of_get_fax_list (ref str_fax_name astr_fax_list[]);//////////////////////////////////////////////////////////////////////
// $<function>n_cst_msfaxof_get_fax_list()
// $<arguments>
//		reference	str_fax_name	astr_fax_list[]		
// $<returns> integer
// $<description>Get MSFax Printer List form regedit.
// $<description> 
//////////////////////////////////////////////////////////////////////
// $<add> 06/07/2007 by Ken.Guo
//////////////////////////////////////////////////////////////////////


String ls_remote_key,ls_Local_key,ls_remote_key_vista
String ls_remote_subkey[], ls_local_subkey[]
String ls_remote_serverkey[],ls_remote_printerkey[]
String ls_driver_key,ls_servername_key
String ls_drivername,ls_servername
Integer i,j,k
Integer li_pos
Boolean lb_vista = False
environment lenv
Integer li_return

ls_Local_key = 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Print\Printers'
ls_remote_key = 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Print\Providers\LanMan Print Services\Servers'
ls_remote_key_vista = 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Print\Providers\Client Side Rendering Print Provider\Servers'	

li_return = GetEnvironment(lenv)
If li_return = 1 Then
	//For Vista OS
	If lenv.osmajorrevision = 6 and lenv.osminorrevision = 0 Then
		lb_vista = True
		ls_remote_key = ls_remote_key_vista
	End If
End If

//Get Local MSFax Printer(It include reconnected remote MSFax printer)
If lb_vista Then
	//For Vista OS
	astr_fax_list[j+1].fax_fullname = 'Local'
	astr_fax_list[j+1].fax_servername = ''
Else
	If RegistryKeys ( ls_Local_key, ls_local_subkey ) = 1 Then
		For i = 1 to UpperBound(ls_local_subkey)
			ls_drivername = ''
			//If is MS fax printer driver,then get it's servername
			If RegistryGet (ls_Local_key +'\'+ ls_local_subkey[i], 'Printer Driver', RegString!, ls_drivername ) = 1 Then
				If ls_drivername <> 'Microsoft Shared Fax Driver' Then Continue
				If	Left(ls_local_subkey[i],2)	= ',,' Then
					li_pos = Pos(ls_local_subkey[i],',',3)
					If li_pos < 1 Then Continue
					j = upperbound(astr_fax_list)				
					astr_fax_list[j+1].fax_fullname = '\\' + Mid(ls_local_subkey[i],3,li_pos - 3 ) + '\' + Mid(ls_local_subkey[i],li_pos + 1,len(ls_local_subkey[i]) - li_pos)
					astr_fax_list[j+1].fax_servername = Mid(ls_local_subkey[i],3,li_pos - 3 )
				Else
					ls_servername = ''
					RegistryGet (ls_Local_key +'\'+ ls_local_subkey[i] + '\PrinterDriverData', 'PrintServerName', RegString!, ls_servername ) 
					//Write in fax server Structure array
					//Add local fax printer.
					If ls_servername = '' and Pos(ls_local_subkey[i],'/Session') = 0  Then 
						j = upperbound(astr_fax_list)				
						astr_fax_list[j+1].fax_fullname = ls_local_subkey[i] 
						astr_fax_list[j+1].fax_servername = ''
					End If
				End If
			End If
		Next
	End If
End If

//Get Remote MSFax Print
If RegistryKeys ( ls_remote_key, ls_remote_serverkey ) = 1 Then
	For i = 1 to UpperBound(ls_remote_serverkey)
		If RegistryKeys ( ls_remote_key + '\' + ls_remote_serverkey[i] + '\Printers', ls_remote_printerkey ) = 1 Then
			For k = 1 to UpperBound(ls_remote_printerkey)
				ls_drivername = ''
				//If is MS fax printer driver,then get it's servername
				If RegistryGet ( ls_remote_key + '\' + ls_remote_serverkey[i]+ '\Printers\' + ls_remote_printerkey[k], 'Printer Driver', RegString!, ls_drivername ) = 1 Then
					If ls_drivername <> 'Microsoft Shared Fax Driver' Then Continue
					//Write in fax server Structure array
					j = upperbound(astr_fax_list)
					If lb_vista Then
						astr_fax_list[j+1].fax_fullname = '\\'+ls_remote_serverkey[i]	
					Else
						astr_fax_list[j+1].fax_fullname = '\\'+ls_remote_serverkey[i]+'\'+ls_remote_printerkey[k]
					End If
					astr_fax_list[j+1].fax_servername = ls_remote_serverkey[i]
				End If
			Next
		End If
	Next
End If

If UpperBound(astr_fax_list) < 1 Then Return -1
Return 1


end function

public function integer of_select_fax (ref string as_fax_name);Integer i
Integer li_faxs_item
String ls_fax_parm
String ls_fax_fullname_list[]
n_cst_string lnv_string
str_fax_name lstr_fax_list[]

//Use Prior MS Fax Printer you choosed.
If Not Isnull(Gs_MSFax_ServerName) Then
	as_fax_name = Gs_MSFax_ServerName
	Return 1
End If

//Get fax list
of_get_fax_list(lstr_fax_list[])

If UpperBound(lstr_fax_list) < 1 Then
	Return -1
End If

//Show and Select a Fax Printer
If UpperBound(lstr_fax_list) > 0 Then
//	as_fax_name = lstr_fax_list[1].fax_servername
//Else
	For i = 1 to UpperBound(lstr_fax_list)
		If of_check_fax(lstr_fax_list[i].fax_servername) = 1 Then
			ls_fax_fullname_list[i] = lstr_fax_list[i].fax_fullname + '    Connection Success.'
		Else
			ls_fax_fullname_list[i] = lstr_fax_list[i].fax_fullname + '    Connection Error.'
		End If
	Next
	lnv_string.of_arraytostring( ls_fax_fullname_list[], ';', ls_fax_parm)
	OpenWithParm(w_fax_list,ls_fax_parm)
	li_faxs_item = Message.doubleparm
	If li_faxs_item = 0 Then Return 0
	If li_faxs_item < 1 Then Return -2
	as_fax_name = lstr_fax_list[li_faxs_item].fax_servername
	If Gi_MSFax_Number > 0 Then //Means always use this MS Fax Printer.
		Gs_MSFax_ServerName = as_fax_name
	End If
	
End If

Return 1
end function

public function integer of_connect_fax (string as_faxserver);//////////////////////////////////////////////////////////////////////
// $<function>n_cst_msfaxof_connect_fax()
// $<arguments>
//		value	string	as_faxserver		
// $<returns> integer
// $<description> Connect MSFax Server
//////////////////////////////////////////////////////////////////////
// $<add> 05/30/2007 by Ken.Guo
//////////////////////////////////////////////////////////////////////

Integer li_ret
String ls_MajorVersion


if ii_ret <> 0 then
	//Messagebox('Failed:','Connect failed! Not Find MS Fax(FaxServer).')
	return -1
end if

Try
	setpointer(HourGlass!)
	objFaxServer.Connect(as_faxserver)
	
	//Because web unsupport Try...Catch, So add below script to check objFaxServer.
	ls_MajorVersion = string(objFaxServer.MajorVersion)
	If ls_MajorVersion = '' or isnull(ls_MajorVersion) Then
		Return -2
	End If	
Catch(OLERuntimeError er) 
	//Messagebox('Error:','Connect fax server Failed! Please input correct FaxServer name again.')	
	return -2
Finally

End Try	

	
Return 1
end function

public function integer of_send_fax (string as_faxserver, string as_recipient, string as_fax_number, string as_subject, string as_cover_text, string as_attachments, string as_cover_page);//////////////////////////////////////////////////////////////////////
// $<function>n_cst_msfax.of_send_fax()
// $<arguments>
//		value	string	as_faxserver  		
//		value	string	as_recipient  		
//		value	string	as_fax_number 		
//		value	string	as_subject    		
//		value	string	as_cover_text 		
//		value	string	as_attachments		
//		value	string	as_cover_page 		
// $<returns> integer
// $<description>Send MSFax.
//////////////////////////////////////////////////////////////////////
// $<add> 05/30/2007 by Ken.Guo
//////////////////////////////////////////////////////////////////////
String ls_docname
Integer li_ret
oleobject objFaxDocument

objFaxDocument = CREATE oleobject
li_ret = objFaxDocument.ConnectToNewObject("FAXComEX.FaxDocument")
If li_ret <> 0 Then 
	If Isvalid(objFaxDocument) Then Destroy objFaxDocument 
	Return -1
End If

Try
	//Attachments
	objFaxDocument.Body = as_attachments
	//'Add the recipient with the fax number,fax recipient 
	objFaxDocument.Recipients.Add( as_fax_number, as_recipient)
	//'Set the cover page type and the path to the cover page
	objFaxDocument.CoverPageType = 1 //fcptLocal
	objFaxDocument.CoverPage = as_cover_page
	//'Provide the cover page note
	objFaxDocument.Note = as_cover_text
	objFaxDocument.Subject = as_subject
	ls_docname = 'Doc' +string(today(),'yyyymmdd')+ string(Now(),'hhmmss') + String(Rand(999),'000')
	//Use DocumentName to check whether the fax has been sent.
	objFaxDocument.DocumentName = ls_docname
	//Use Default sender information.
	objFaxDocument.Sender.LoadDefaultSender() //Added By Ken.Guo 04.29.2008
	
	//*********************Other Settings For MSFax*********************//
	////'Name the document
	//objFaxDocument.DocumentName = "My First Fax"
	////'Set the fax priority
	//objFaxDocument.Priority = fptHIGH
	////'Choose to attach the fax to the fax receipt
	//objFaxDocument.AttachFaxToReceipt = false
	////'Provide the address for the fax receipt
	//objFaxDocument.ReceiptAddress = "guojun11@dev.appeon.net"
	////'Set the receipt type to email
	//objFaxDocument.ReceiptType = frtMAIL	
	////'Set the sender properties.
	//objFaxDocument.Sender.Title = "Mr."
	//objFaxDocument.Sender.Name = "Bob"
	//objFaxDocument.Sender.City = "Cleveland Heights"
	//objFaxDocument.Sender.State = "Ohio"
	//objFaxDocument.Sender.Company = "Microsoft"
	//objFaxDocument.Sender.Country = "USA"
	//objFaxDocument.Sender.Email = "Test@test.net"
	//objFaxDocument.Sender.FaxNumber = "123456789"
	//objFaxDocument.Sender.HomePhone = "123456789"
	//objFaxDocument.Sender.OfficeLocation = "Downtown"
	//objFaxDocument.Sender.OfficePhone = "12165555553"
	//objFaxDocument.Sender.StreetAddress = "123 Main Street"
	//objFaxDocument.Sender.TSID = "Office fax machine"
	//objFaxDocument.Sender.ZipCode = "44118"
	//objFaxDocument.Sender.BillingCode = "23A54"
	//objFaxDocument.Sender.Department = "Accts Payable"
	////'Save sender information as default
	//objFaxDocument.Sender.SaveDefaultSender()
	////'Submit the document to the connected fax server
	//'and get back the job ID.

	
	////The below script is unsupport for Web,It can't return the Fax JobID.
	//ls_JobID[] = objFaxDocument.ConnectedSubmit(objFaxServer)
	
	//Send Fax
	objFaxDocument.ConnectedSubmit(objFaxServer)
	If of_check_send_result(ls_docname) < 0 Then 
		If Isvalid(objFaxDocument) Then Destroy objFaxDocument 
		Return -1
	End If
Catch(OLERuntimeError er) 
	//Messagebox('Error:','Failed to send fax!',Exclamation!)	
	If Isvalid(objFaxDocument) Then Destroy objFaxDocument 
	return -1
Finally

End Try	

If Isvalid(objFaxDocument) Then Destroy objFaxDocument 
Return 1


end function

public function integer of_check_fax_info (string as_attach, string as_cove_page);If Not FileExists(as_attach) Then
	Return -1
End If
If Not FileExists(as_cove_page) Then
	Return -2
End If
	
Return 1
end function

public function integer of_check_fax (string as_faxserver);String ls_MajorVersion
Integer li_ret

oleobject OLEFaxServer
OLEFaxServer = CREATE oleobject
li_ret = OLEFaxServer.ConnectToNewObject("FAXComEX.FaxServer")
If li_ret <> 0 Then Return -1
Try
	setpointer(HourGlass!)
	OLEFaxServer.Connect(as_faxserver)
	//Because web unsupport Try...Catch, So add below script to check objFaxServer.
	ls_MajorVersion = string(OLEFaxServer.MajorVersion)
	If ls_MajorVersion = '' or isnull(ls_MajorVersion) Then
		OLEFaxServer.DisConnect()
		Destroy OLEFaxServer
		Return -1
	End If

Catch(OLERuntimeError er) 
	//Messagebox('Error:','Connect fax server Failed! Please input correct FaxServer name again.')	
	Destroy OLEFaxServer
	return -1
Finally

End Try	

OLEFaxServer.DisConnect()
Destroy OLEFaxServer
Return 1

end function

public function integer of_fax (string as_recipient, string as_fax_number, string as_subject, string as_cover_text, string as_attachments, string as_cover_page);//////////////////////////////////////////////////////////////////////
// $<function>n_cst_msfaxof_fax()
// $<arguments>
//		value	string	as_recipient  		
//		value	string	as_fax_number 		
//		value	string	as_subject    		
//		value	string	as_cover_text 		
//		value	string	as_attachments		
//		value	string	as_cover_page 		
// $<returns> integer
// $<description> Send a fax,entry.
// $<description>
//////////////////////////////////////////////////////////////////////
// $<add> 06/07/2007 by Ken.Guo
//////////////////////////////////////////////////////////////////////

Integer li_ret
String ls_faxserver
li_ret = of_check_fax_info(as_attachments,as_cover_page) 
Choose Case li_ret
	Case -1
		Return -11
	Case -2
		Return -12
End Choose

li_ret = of_select_fax(ls_faxserver) 
Choose Case li_ret 
	Case 0
		Return 0
	Case -1
		Return -21
	Case -2
		Return -22
End Choose

li_ret = of_connect_fax(ls_faxserver) 
Choose Case li_ret
	Case -1
		Return -31	
	Case -2
		Return -32
End Choose

If of_send_fax(ls_faxserver,as_recipient,as_fax_number,as_subject,as_cover_text,as_attachments,as_cover_page) < 0 Then
	Return -4
End If

Return 1

end function

public function string of_get_errtext (integer ai_code);//////////////////////////////////////////////////////////////////////
// $<function>n_cst_msfaxof_get_errtext()
// $<arguments>
//		value	integer	ai_code		
// $<returns> string
// $<description>
// $<description>Return error text by code
//////////////////////////////////////////////////////////////////////
// $<add> 05/30/2007 by Ken.Guo
//////////////////////////////////////////////////////////////////////

String ls_errtext
Choose Case ai_code
	Case -11
		ls_errtext = 'Attached file does not exist.'		
	Case -12
		ls_errtext = 'Cover page file does not exist.'
	Case -21
		ls_errtext = 'MS Fax Printer does not exist.'		
	Case -22
		ls_errtext = 'MS Fax Printer has not been selected.'			
	Case -31
		ls_errtext = 'Fax Service has not been installed.'		
	Case -32
		ls_errtext = 'Failed to connect to fax server.'		
	Case -4
		ls_errtext = 'Failed to send fax.'
End Choose
If ls_errtext = '' and ai_code < 0 Then
	ls_errtext = 'Failed to send fax.'
End If
Return ls_errtext
end function

public function integer of_check_send_result (string as_docname);//////////////////////////////////////////////////////////////////////
// $<function>n_cst_msfax.of_check_send_result()
// $<arguments>
//		value	string	as_docname		
// $<returns> integer
// $<description> For check whether the fax has been add to OutgoingQueue user DocumentName Property.
// $<description> Because it can't get fax JobId after send fax in Web 
//////////////////////////////////////////////////////////////////////
// $<add> 06/14/2007 by Ken.Guo
//////////////////////////////////////////////////////////////////////

Integer i,li_ret
oleobject olejobs,olejob

Try
	olejobs = objFaxServer.Folders.OutgoingQueue.GetJobs()
	For i = 1 to olejobs.count
		If olejobs.item[i].DocumentName = as_docname Then
			Return 1
		End If
	Next
	Return -1
Catch(OLERuntimeError er) 
	Return -1
End Try

end function

event constructor;of_register()


objFaxServer = CREATE oleobject
ii_ret = objFaxServer.ConnectToNewObject("FAXComEX.FaxServer")

end event

on n_cst_msfax.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_msfax.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event destructor;Destroy objFaxServer 

end event

