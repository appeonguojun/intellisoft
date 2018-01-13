$PBExportHeader$n_cst_outlook.sru
forward
global type n_cst_outlook from nonvisualobject
end type
end forward

global type n_cst_outlook from nonvisualobject autoinstantiate
end type

type prototypes
function long GetDllDirectory(ref string as_Path) library "appeondll.dll" alias for "GetDllDirectory;Ansi"
function long SetDllDirectory(string as_Path) library "appeondll.dll" alias for "SetDllDirectory;Ansi"
function long LookupOutlookAccount(string as_DisplayName, ref string as_Account, long al_Retrieve) library "appeondll.dll" alias for "LookupOutlookAccount;Ansi"
end prototypes

type variables
boolean ib_existsoutlook
end variables

forward prototypes
public function integer of_selectcontacts (ref singlelineedit sle_to, ref singlelineedit sle_cc, ref singlelineedit sle_bcc)
public function integer of_lookupaccount (string as_displayname, ref string as_account, long al_retrieve)
public function integer of_setdlldirectory (string as_path)
public function string of_getdlldirectory ()
public function string of_getaddressfromoutlook (string as_contactname)
end prototypes

public function integer of_selectcontacts (ref singlelineedit sle_to, ref singlelineedit sle_cc, ref singlelineedit sle_bcc);long   ll_Cycle
long   ll_Result
string ls_DisplayName
string ls_Account
string ls_Prompt
string ls_DllDirectory
mailSession 	lma_Session
mailMessage 	lma_Message
mailReturnCode lma_ReturnCode

// Get DLL directory and load appeon.dll library firstly
ChangeDirectory(gs_current_path)
ls_DllDirectory = of_GetDllDirectory()

// Logon to Outlook
lma_Session = Create mailSession
lma_ReturnCode = lma_Session.mailLogon(mailNewSession!)
if lma_ReturnCode <> mailReturnSuccess! then
	Destroy lma_Session
	ChangeDirectory(gs_current_path)
	of_SetDllDirectory(ls_DllDirectory)
   MessageBox("Mail", "Logging in failed.")
   Return -1
end if

// Select contacts from AddressBook of Outlook
lma_ReturnCode = lma_Session.mailAddress(lma_Message)
if lma_ReturnCode = mailReturnSuccess! then
	for ll_Cycle = 1 to UpperBound(lma_Message.Recipient)
		// Lookup account according to display name
		ls_DisplayName = lma_Message.Recipient[ll_Cycle].Name
		ll_Result = of_LookupAccount(ls_DisplayName, ls_Account, 1) 
		if ll_result = 0 and trim(ls_account) <> "" then ls_DisplayName = ls_account //jervis 08.30.2011
			
		
		// Add account to single line edit control
		if lma_Message.Recipient[ll_Cycle].RecipientType = mailTo! then
			if sle_to.Text <> "" then sle_to.Text += ';'
			sle_to.Text += ls_DisplayName
		elseif lma_Message.Recipient[ll_Cycle].RecipientType = mailCc! then
			if sle_cc.Text <> "" then sle_cc.Text += ';'
			sle_cc.Text += ls_DisplayName
		elseif lma_Message.Recipient[ll_Cycle].RecipientType = mailBcc! then
			if sle_bcc.Text <> "" then sle_bcc.Text += ';'
			sle_bcc.Text += ls_DisplayName
		end if
		
		// Prompt user if no match account or an error occures
		if ll_Result = -1 then
			ls_Prompt = "No account is found for '" + ls_DisplayName + "' in Global Address List of Address Book, so emails may not reach '" + ls_DisplayName + "'."
			MessageBox("Prompt", ls_Prompt)
		elseif ll_Result > 0  and ll_result <> 1000 then //1000:no install outlook or do not need to parse - jervis 09.05.2011 
		
			ls_Prompt = "Failed to find the account. Error code is : " + String(ll_Result)
			MessageBox("Prompt", ls_Prompt)
		end if
		
	next
end if

// Logoff from Outlook
lma_Session.mailLogoff()
Destroy lma_Session
ChangeDirectory(gs_current_path)
of_SetDllDirectory(ls_DllDirectory)

Return 1
end function

public function integer of_lookupaccount (string as_displayname, ref string as_account, long al_retrieve);long ll_Result
string ls_Account

ls_Account = Space(255)

if ib_ExistsOutLook and pos(as_DisplayName,'@') = 0 then //jervis 08.30.2011 //
	ll_Result = LookupOutlookAccount(as_DisplayName, ls_Account, al_Retrieve)
	ChangeDirectory(gs_current_path) //Added By Ken.Guo 10/17/2011. 
	if ll_Result = 0 and lower(trim(ls_Account)) <> 'undefined' then	
		as_Account = ls_Account
		gnv_debug.of_output(False, 'LookupOutlookAccount('+as_DisplayName+')= ' + as_Account)
	else
		//Added By Ken.Guo 12/30/2013
		gnv_debug.of_output(True, 'LookupOutlookAccount('+as_DisplayName+') failed. ret = ' + String(ll_Result))
		as_Account = This.of_getaddressfromoutlook( as_displayname )
		gnv_debug.of_output(True, 'GetAddressFromOutlook('+as_DisplayName+') = ' + as_Account)
		If as_Account <> ls_account and as_Account <> as_displayname Then
			ll_Result = 0
		End If
	end if
else
	If Not ib_ExistsOutLook Then
		gnv_debug.of_output(False, 'ib_ExistsOutLook = ' + String(ib_ExistsOutLook) + ' and ' + 'pos('+as_DisplayName+',~'@~') = ' + String(pos(as_DisplayName,'@'))  )
	End If
	ll_Result = 1000  //no install outlook or do not need to parse - jervis 08.30.2011
end if

// Returns  0 if it match account succeeds
// Returns -1 if it no match account
// Returns greater than 0 if an error occurs
Return ll_Result
end function

public function integer of_setdlldirectory (string as_path);SetDllDirectory(as_Path)

Return 1
end function

public function string of_getdlldirectory ();string ls_Path

ls_Path = Space(255)
GetDllDirectory(ls_Path)
ls_Path = Trim(ls_Path)

Return ls_Path
end function

public function string of_getaddressfromoutlook (string as_contactname);//====================================================================
// Function: of_getaddressfromoutlook
//--------------------------------------------------------------------
// Description:  Get Full SMTP Email Address from contact name
//--------------------------------------------------------------------
// Arguments:
//                as_contactname
//--------------------------------------------------------------------
// Returns:  string
//--------------------------------------------------------------------
// Author:         Ken.Guo           Date: 12/27/2013
//--------------------------------------------------------------------
//Copyright (c) 2008-2013 Contract Logix, Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

oleobject lole_outlook,lole_NameSpace,lole_receipt, lole_Address_entry,lole_ExchangeUser
oleobject lole_Address_entries
integer Li_Ret, li_i
integer  usertype
String ls_Address

lole_outlook = Create oleobject
Li_Ret = lole_outlook.ConnectToNewObject( "outlook.application")
If Li_Ret <> 0 Then
	Return as_contactname
End If

Try 
	lole_NameSpace = lole_outlook.GetNameSpace("MAPI")
	lole_receipt = lole_NameSpace.CreateRecipient(as_contactname)
	lole_receipt.Resolve()
	If lole_receipt.Resolved Then
		lole_Address_entry = lole_receipt.AddressEntry
		usertype =  lole_Address_entry.AddressEntryUserType 
		
		choose case usertype
			case 0
				lole_ExchangeUser = lole_Address_entry.GetExchangeUser()
				if isvalid( lole_ExchangeUser ) then
						ls_Address = lole_ExchangeUser.PrimarySmtpAddress				
				end if
			case 1
				lole_ExchangeUser = lole_Address_entry.GetExchangeDistributionList( )
				if isvalid( lole_ExchangeUser ) then
						ls_Address = lole_ExchangeUser.PrimarySmtpAddress				
				end if
			case 10
				ls_Address = lole_Address_entry.Address				
				
			case 11
				lole_Address_entries = lole_Address_entry.Members
				If isvalid( lole_Address_entries ) Then
					For li_i = 1 To lole_Address_entries.Count
						lole_Address_entry = lole_Address_entries.item[li_i]
						If lole_Address_entry.type = 'EX' Then
							ls_Address += lole_Address_entry.Name + ";"
						Else
							ls_Address += lole_Address_entry.Address + ";"
						End If
					Next					
				End If	
			case 30
				ls_Address = lole_Address_entry.Address
			case else
				MessageBox( 'Tips', 'The system does not support retrieving this type of Outlook contact.(' + string( usertype) +')' )
		end choose
		If isnull( ls_Address ) or trim( ls_Address ) = '' Then
			If lole_Address_entry.type = 'SMTP' Then
				ls_Address =  lole_Address_entry.Address
			ElseIf lole_Address_entry.type = 'EX' Then
				lole_ExchangeUser = lole_Address_entry.GetExchangeUser()
				ls_Address =  lole_ExchangeUser.PrimarySmtpAddress  
			End If	
		End If	
		If lower(ls_Address) = 'undefined' Then
			MessageBox( 'Tips', 'The system does not support retrieving this type of Outlook contact.(' + string( usertype) + ')' )
		End If
		as_contactname = ls_Address
	Else
		Return as_contactname
	End If
Catch (oleruntimeerror err1)
End Try

If isvalid(lole_outlook) Then
	lole_outlook.disconnectobject()
	Destroy lole_outlook
End If

Return as_contactname
end function

on n_cst_outlook.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_outlook.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;//Is installed outlook  - jervis 08.30.2011
oleobject lole_outlook
lole_outlook = Create oleobject
IF lole_outlook.Connecttonewobject("outlook.application") <> 0 THEN 
	ib_ExistsOutLook = false
else
	ib_ExistsOutLook = true
end if
Destroy lole_outlook
end event

