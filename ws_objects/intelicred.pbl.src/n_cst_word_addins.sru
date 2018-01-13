$PBExportHeader$n_cst_word_addins.sru
forward
global type n_cst_word_addins from nonvisualobject
end type
end forward

global type n_cst_word_addins from nonvisualobject autoinstantiate
end type

type prototypes
Function  long RegQuerySubKey( string subkey, ref string errors,ref string keyname[] )    library "ContractlogixINET.dll"
Function  long RegQuerySubKeyValue( string subkey, string keyname, ref string err,ref string keyvalue) library "ContractlogixINET.dll"
//Function long RegSetKeyValues( string subkey, string keyname, string keyvalue, ref string err  ) library "ContractlogixINET.dll"
Function long RegSetKeyValues( string subkey, string keyname, string keyvalue, unsignedlong valueType, ref string err  ) library "ContractlogixINET.dll"
end prototypes

type variables
n_ds ids_word_addins

Int REG_DWORD = 4       
Int REG_SZ = 1                       

end variables

forward prototypes
public function integer of_set_word_unload_addins (integer ai_value)
public function integer of_get_word_addins (ref n_ds ads_addins)
public function integer of_save_addins (u_dw adw_addins)
public function string of_get_wordtype ()
public function integer of_restore_key (u_dw adw_addins)
public function integer of_add_word_shortcut ()
public function integer of_delete_word_shortcut ()
public function integer of_set_word_new_instance (integer ai_value, boolean ab_show_message)
public function integer of_set_word_new_instance (integer ai_value)
end prototypes

public function integer of_set_word_unload_addins (integer ai_value);//====================================================================
// Function: of_set_word_unload_addins
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//                ai_value
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:         Ken.Guo 2015-07-14
//--------------------------------------------------------------------
//Copyright (c) 2008-2015 Contract Logix, Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


string ls_subkeylist[], ls_mainKey,ls_key
integer li_rtn,i,ll_row
string ls_value, ls_err, ls_FriendlyName
ulong ll_value

If Not isvalid(ids_word_addins) Then
	ids_word_addins = Create n_ds
	ids_word_addins.dataobject = 'd_word_comaddins'
End If

If gs_wordtype = '' Then of_get_wordtype()
If gs_wordtype = '' Then Return  0

//Get addins list
If ai_value = 1 Then 
	of_get_word_addins(ids_word_addins)
End If

If ids_word_addins.Rowcount() = 0 Then Return 0
For i = 1 To ids_word_addins.Rowcount() 
	ls_mainKey = ids_word_addins.getItemString(i, 'path')
	ll_value = Long(ids_word_addins.GetItemnumber(i, 'oldvalue'))
	If ai_value = 1 Then ll_value = 0 //unload add ins
	ls_key = ids_word_addins.GetItemString(i, 'name')
	If ids_word_addins.GetItemString(i, 'level') = 'Machine' Then
		If gs_wordtype = '64-bit' Then
			ls_err = space( 200)
			RegSetKeyValues(   ls_mainKey + '\\' + ls_key,"LoadBehavior", String(ll_value), REG_DWORD,ref ls_err )
			If trim(ls_err) <> '' Then
				gnv_debug.of_output(True,'Failed to set Add-ins to '+String(ll_value)+' for '+ls_key)
			End If
		Else
			If RegistrySet ( ls_mainKey + '\' + ls_key , 'LoadBehavior', ReguLong!, ll_value ) <> 1 Then
				gnv_debug.of_output(True,'Failed to set Add-ins to '+String(ll_value)+' for '+ls_key)
			End If
		End if
	Else
		If RegistrySet ( ls_mainKey + '\' + ls_key , 'LoadBehavior', ReguLong!, ll_value ) <> 1 Then
			gnv_debug.of_output(True,'Failed to set Add-ins to '+String(ll_value)+' for '+ls_key)
		End If
	End If
Next

Return 1


end function

public function integer of_get_word_addins (ref n_ds ads_addins);

string ls_subkeylist[], ls_mainKey,ls_key
integer li_rtn,i,ll_row
string ls_value, ls_err, ls_FriendlyName, ls_org_value
ulong ll_value, ll_org_value

If Not isvalid(ads_addins) Then
	ads_addins = Create n_ds
	ads_addins.dataobject = 'd_word_comaddins'
End If

If gs_wordtype = '' Then of_get_wordtype()
If gs_wordtype = '' Then Return 0

If gs_wordtype = '64-bit' Then
	ls_err = space( 200)	
	for i = 1 to 100
		 ls_subkeylist[i] = space(256)
	next
	
	ls_mainKey = "SOFTWARE\\Microsoft\\Office\\Word\\Addins"
	ls_err = space( 200)
	RegQuerySubKey( ls_mainKey,ls_err ,  ls_subkeylist[])
	If trim(ls_err) <> '' Then
		gnv_debug.of_output(true, 'failed to execute RegQuerySubKey. ' + trim(ls_err))
	End If
	For i = 1 To  Upperbound(ls_subkeylist[])
		
		If trim(ls_subkeylist[i]) = '' Then 
			exit
		End If
		//messagebox('',ls_subkeylist[i])
		ls_err = space( 200)	
		ls_FriendlyName = space( 1024)	
		RegQuerySubKeyValue ( ls_mainKey + '\\' + ls_subkeylist[i] , 'FriendlyName', ls_err, ls_FriendlyName )		
		If trim(ls_err) <> '' Then
			ls_FriendlyName = ls_subkeylist[i]
		Else
			ls_FriendlyName = Trim(ls_FriendlyName)
		End If
		
		ls_err = space( 200)
		li_rtn = RegQuerySubKeyValue ( ls_mainKey + '\\' + ls_subkeylist[i] , 'LoadBehavior', ls_err, ls_value )
		If trim(ls_err) <> '' Then
			gnv_debug.of_output(true, 'failed to execute RegQuerySubKeyValue. ' + ls_subkeylist[i]  +':'+ trim(ls_err) + 'The key value does not exist or you do not have enough permission.')
			continue
		End If
	
		If trim(ls_err) = '' then
			ll_row = ads_addins.insertrow(0)
			ads_addins.setitem(ll_row,'name',ls_subkeylist[i])
			ads_addins.setitem(ll_row,'FriendlyName',ls_FriendlyName)
			If Long(ls_value) > 0 then
				ads_addins.setitem(ll_row,'LoadBehavior','1')
			Else
				ads_addins.setitem(ll_row,'LoadBehavior','0')
			End If
			ads_addins.setitem(ll_row,'oldvalue',Long(ls_value))
			ads_addins.setitem(ll_row,'path' , ls_mainKey)
			ads_addins.setitem(ll_row,'level' , 'Machine')	
			
			ls_err = space( 200)
			ls_org_value = ''
			RegQuerySubKeyValue ( ls_mainKey + '\\' + ls_subkeylist[i] , 'LoadBehavior_Contractlogix_Backup', ls_err, ls_org_value )	
			If trim(ls_org_value) = '' Then 
				// If not exists, then set it.
				ls_err = space( 200)
				RegSetKeyValues( ls_mainKey + '\\' + ls_subkeylist[i] ,  'LoadBehavior_Contractlogix_Backup', ls_value, REG_DWORD,ls_err  )
			End if
		End If
	Next 	
Else
	ls_mainKey = "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Office\Word\Addins"
	If RegistryKeys( ls_mainKey,   ls_subkeylist[]) = -1 Then
		gnv_debug.of_output(true, 'failed to execute RegistryKeys. ' + ls_mainKey )
	End If
	
	For i = 1 To  Upperbound(ls_subkeylist[])
		li_rtn = RegistryGet ( ls_mainKey + '\' + ls_subkeylist[i] , 'LoadBehavior', ReguLong!, ll_value )
		If li_rtn = 1 then
			ll_row = ads_addins.insertrow(0)
			ads_addins.setitem(ll_row,'name',ls_subkeylist[i])
			If ll_value > 0 then
				ads_addins.setitem(ll_row,'LoadBehavior','1')
			Else
				ads_addins.setitem(ll_row,'LoadBehavior','0')
			End If
			ads_addins.setitem(ll_row,'oldvalue',ll_value)
			ads_addins.setitem(ll_row,'path' , ls_mainKey)
			ads_addins.setitem(ll_row,'level' , 'Machine')
			RegistryGet ( ls_mainKey + '\' + ls_subkeylist[i] , 'FriendlyName', RegString!, ls_FriendlyName )
			if ls_FriendlyName = ''  Then ls_FriendlyName= ls_subkeylist[i]
			ads_addins.setitem(ll_row,'FriendlyName',ls_FriendlyName)	
			
			// If not exists, then set it.
			If RegistryGet ( ls_mainKey + '\' + ls_subkeylist[i] , 'LoadBehavior_Contractlogix_Backup',ReguLong!, ll_org_value ) <> 1 Then				
				RegistrySet( ls_mainKey + '\' + ls_subkeylist[i] ,  'LoadBehavior_Contractlogix_Backup',ReguLong!, ll_value  )
			End if
		Else
			gnv_debug.of_output(true, 'failed to execute RegistryGet. ' + ls_subkeylist[i] )
		End If
	Next 
End If
				
ls_mainKey = "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\Word\Addins"
If RegistryKeys( ls_mainKey,   ls_subkeylist[]) = -1 Then
	gnv_debug.of_output(true, 'failed to execute RegistryKeys. ' + ls_mainKey + 'The key value does not exist or you do not have enough permission.')
End If

For i = 1 To  Upperbound(ls_subkeylist[])
	li_rtn = RegistryGet ( ls_mainKey + '\' + ls_subkeylist[i] , 'LoadBehavior', ReguLong!, ll_value )
//	messagebox( ls_subkeylist[i],ll_value)
	If li_rtn = 1 then
		RegistryGet ( ls_mainKey + '\' + ls_subkeylist[i] , 'FriendlyName', RegString!, ls_FriendlyName )
		if ls_FriendlyName = ''  Then ls_FriendlyName= ls_subkeylist[i]
		ll_row = ads_addins.insertrow(0)
		ads_addins.setitem(ll_row,'name',ls_subkeylist[i])
		ads_addins.setitem(ll_row,'FriendlyName',ls_FriendlyName)
		ads_addins.setitem(ll_row,'path' , ls_mainKey)
		ads_addins.setitem(ll_row,'level' , 'User')
		If ll_value > 0 then
			ads_addins.setitem(ll_row,'LoadBehavior','1')
		Else
			ads_addins.setitem(ll_row,'LoadBehavior','0')
		End If
		ads_addins.setitem(ll_row,'oldvalue',ll_value)	
		
		// If not exists, then set it.
		If RegistryGet ( ls_mainKey + '\' + ls_subkeylist[i] , 'LoadBehavior_Contractlogix_Backup',ReguLong!, ll_org_value ) <> 1 Then				
			RegistrySet( ls_mainKey + '\' + ls_subkeylist[i] ,  'LoadBehavior_Contractlogix_Backup',ReguLong!, ll_value  )
		End if
		
	Else
		gnv_debug.of_output(true, 'failed to execute RegistryGet. ' + ls_subkeylist[i] + 'The key value does not exist or you do not have enough permission.')
	End If
Next 	


Return 1
end function

public function integer of_save_addins (u_dw adw_addins);string ls_subkeylist[], ls_mainKey, ls_key
integer li_rtn,i,ll_row
string ls_value, ls_error
ulong ll_value
Boolean lb_exists_error


If gs_wordtype = '' Then of_get_wordtype()
If gs_wordtype = '' Then Return  0

adw_addins.AcceptText()
If adw_addins.Rowcount() = 0 then Return 0
For i = 1 To  adw_addins.Rowcount()
	ls_mainKey = adw_addins.getItemString(i, 'path')
	ll_value = Long(adw_addins.GetItemString(i, 'LoadBehavior'))
	ls_key = adw_addins.GetItemString(i, 'name')
	If adw_addins.GetItemString(i, 'level') = 'Machine' Then
		If gs_wordtype = '64-bit' Then
			ls_error = space( 200)
			RegSetKeyValues(   ls_mainKey + '\\' + ls_key,"LoadBehavior", String(ll_value), REG_DWORD,ref ls_error )
			If trim(ls_error) <> '' Then
				gnv_debug.of_output(true, 'Failed to set Add-ins to ' + String(ll_value) + ' for ' + ls_key+ '.' + trim(ls_error) )
				lb_exists_error = True
			End if
		Else
			If RegistrySet ( ls_mainKey + '\' + ls_key , 'LoadBehavior', ReguLong!, ll_value ) < 0 Then
				gnv_debug.of_output(true, 'Failed to set Add-ins to ' + String(ll_value) + ' for ' + ls_key )
				lb_exists_error = True
			End If			
		End if
	Else
		If RegistrySet ( ls_mainKey + '\' + ls_key , 'LoadBehavior', ReguLong!, ll_value ) < 0 Then
			gnv_debug.of_output(true, 'Failed to set Add-ins to ' + String(ll_value) + ' for ' + ls_key )
			lb_exists_error = True
		End If
	End If
Next

If lb_exists_error Then
	Messagebox('Error','Failed to save the data, please see the log file.')
	Return -1
Else
	app_filler.ib_modified_addins = False //set to false. it means need not restore
	Messagebox('Save','Data saved successfully. It will take effect after you restart CL and close all Word processes. ' )
//	If Messagebox('WinWord', 'It will take effect after you restart CL and close all Word processes. Do you want to exit CL and close all Word processes now? ?',Question! ,YesNo!)  = 1 Then
//		Run('taskkill /IM WINWORD.EXE ') 
//	End If
	Return 1
End If
end function

public function string of_get_wordtype ();oleobject myoleobject
myoleobject = Create oleobject
app_filler.of_set_word_safemode(false, 1) //Added By Ken.Guo 2015-07-30
IF myoleobject.Connecttonewobject("word.application") = 0 THEN 
	If Mid(String(myoleobject.Application.ProductCode), 21,1) = '1' Then
		gs_wordtype = '64-bit'
	else
		gs_wordtype = '32-bit'
	End If
	myoleobject.Quit(0) 
	myoleobject.DisconnectObject()	
	
END IF
If isvalid(myoleobject) Then destroy myoleobject
app_filler.of_set_word_safemode(false, 0) //Added By Ken.Guo 2015-07-30
Return gs_wordtype

end function

public function integer of_restore_key (u_dw adw_addins);string ls_subkeylist[], ls_mainKey, ls_key
integer li_rtn,i,ll_row
string ls_value, ls_error, ls_org_value
ulong ll_value, ll_org_value
Boolean lb_exists_error


If gs_wordtype = '' Then of_get_wordtype()
If gs_wordtype = '' Then Return  0

adw_addins.AcceptText()
If adw_addins.Rowcount() = 0 then Return 0
For i = 1 To  adw_addins.Rowcount()
	ls_mainKey = adw_addins.getItemString(i, 'path')
	ls_key = adw_addins.GetItemString(i, 'name')
	If adw_addins.GetItemString(i, 'level') = 'Machine' Then
		If gs_wordtype = '64-bit' Then
			ls_error = space( 200)
			ls_org_value = ''
			RegQuerySubKeyValue(  ls_mainKey + '\\' + ls_key, 'LoadBehavior_Contractlogix_Backup', ref ls_error,ref ls_org_value)
			If trim(ls_org_value) <> '' and isnumber(ls_org_value) Then
				ls_error = space( 200)
				RegSetKeyValues(   ls_mainKey + '\\' + ls_key,"LoadBehavior", ls_org_value,REG_DWORD, ref ls_error )
				If trim(ls_error) <> '' Then
					gnv_debug.of_output(true, 'Failed to set Add-ins to ' + String(ll_value) + ' for ' + ls_key  + '\LoadBehavior_Contractlogix_Backup. '+ trim(ls_error) )
					lb_exists_error = True
				End if				
			End If
		Else
			If RegistryGet ( ls_mainKey + '\' + ls_key ,  'LoadBehavior_Contractlogix_Backup', ReguLong!, ll_value ) = 1 Then
				If RegistrySet ( ls_mainKey + '\' + ls_key , 'LoadBehavior', ReguLong!, ll_value ) <> 1 Then
					gnv_debug.of_output(true, 'Failed to set Add-ins to ' + String(ll_value) + ' for ' + ls_key  + '\LoadBehavior_Contractlogix_Backup')
					lb_exists_error = True
				End If	
			End If
		End if
	Else
		If RegistryGet ( ls_mainKey + '\' + ls_key ,  'LoadBehavior_Contractlogix_Backup', ReguLong!, ll_value ) = 1 Then
			If RegistrySet ( ls_mainKey + '\' + ls_key , 'LoadBehavior', ReguLong!, ll_value ) < 0 Then
				gnv_debug.of_output(true, 'Failed to set Add-ins to ' + String(ll_value) + ' for ' + ls_key + '\LoadBehavior_Contractlogix_Backup' )
				lb_exists_error = True
			End If
		End If
	End If
Next

If lb_exists_error Then
	Messagebox('Error','Failed to restore the data, please see the log file.')
	Return -1
Else
	app_filler.ib_modified_addins = False //set to false. it means need not restore
	Messagebox('Save','Data restored successfully. It will take effect after you restart CL and close all Word processes. ' )
	Return 1
End If
end function

public function integer of_add_word_shortcut ();//====================================================================
// Function: of_add_word_shortcut
//--------------------------------------------------------------------
// Description:  Create the ms word, that open word with new process.
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:         Ken.Guo 2015-07-30
//--------------------------------------------------------------------
//Copyright (c) 2008-2015 Contract Logix, Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


String ls_word_path,ls_appdata
Long ll_pos
Integer   li_rc    
//String   ls_desktop_dir  
OLEObject   lole_WshShell,lole_ShellLink  

gnv_appeondll.of_registryget ( 'HKEY_CLASSES_ROOT\Applications\Winword.exe\shell\edit\command', '', REGString!, ls_word_path)

ll_pos = Pos(lower(ls_word_path),'winword.exe') 

If ll_pos > 0 Then
	
	If Left(ls_word_path,1 ) = '"' Then
		ls_word_path = Left(ls_word_path, ll_pos + Len('winword.exe"') -1 )
	Else
		ls_word_path = Left(ls_word_path, ll_pos + Len('winword.exe') -1 )
	End If
	
	lole_WshShell   =   CREATE   OLEObject  
	 li_rc   =   lole_WshShell.ConnectToNewObject("WScript.Shell")    
	 IF li_rc < 0 THEN            
		DESTROY lole_WshShell  
	 	gnv_debug.of_output(true, 'Failed to create WScript.Shell.')
		Return   -1 
	 END IF   
	
	ls_appdata = gnv_string.of_replace_env_var( '%appdata%') 
	Try 
		//ls_desktop_dir   =   lole_WshShell.SpecialFolders("Desktop")
		
		//Added By Ken.Guo 2015-10-10. create the folder if not exists.
		If Not DirectoryExists(ls_appdata+'\Microsoft\Windows\Start Menu\') Then
			CreateDirectory(ls_appdata+'\Microsoft\Windows\Start Menu\')
			gnv_appeondll.of_parsepath(ls_appdata+'\Microsoft\Windows\Start Menu')
		End If
		
		lole_ShellLink   =   lole_WshShell.CreateShortcut(ls_appdata+'\Microsoft\Windows\Start Menu\' +'Office Word (New Instance).lnk' ) //name
		lole_ShellLink.TargetPath   =  ls_word_path //target file 
		lole_ShellLink.WindowStyle   =   1  //run window type
		//lole_ShellLink.Hotkey   =   "CTRL+SHIFT+F"
		// lole_ShellLink.IconLocation   = ''  
		lole_ShellLink.Description   =  'Starts a new instance of Word with a blank document' //comments
		lole_ShellLink.WorkingDirectory   = ls_word_path //work dir
		lole_ShellLink.Arguments = '/w'
		lole_ShellLink.Save //save
	Catch (runtimeerror err1)
		gnv_debug.of_output(True, 'Failed to add the word shortcut.' + err1.text)
		//messagebox('Error','Failed to add the word shortcut.~r~n' + err1.text)
		DESTROY   lole_ShellLink  
		DESTROY   lole_WshShell  	
		Return -1
	End Try
	
	DESTROY   lole_ShellLink  
	DESTROY   lole_WshShell  	

Else
	gnv_debug.of_output(True, 'Failed to get the registry key HKEY_CLASSES_ROOT\Applications\Winword.exe\shell\edit\command.' + ls_word_path)
	Return -1
End If

Return 1

end function

public function integer of_delete_word_shortcut ();//====================================================================
// Function: of_delete_word_shortcut
//--------------------------------------------------------------------
// Description:  delete the word's shortcut
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:         Ken.Guo 2015-07-30
//--------------------------------------------------------------------
//Copyright (c) 2008-2015 Contract Logix, Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


String ls_appdata
String ls_file

ls_appdata = gnv_string.of_replace_env_var( '%appdata%') 
ls_file = ls_appdata + '\Microsoft\Windows\Start Menu\' +'Office Word (New Instance).lnk'
If FileExists(ls_file) Then
	If Not FileDelete(ls_file) Then
		gnv_debug.of_output(True, 'Failed to delete the file: ' + ls_file)
		Return -1
	End If
Else
	Return 0
End If

Return 1
end function

public function integer of_set_word_new_instance (integer ai_value, boolean ab_show_message);//====================================================================
// Function: of_set_word_new_instance
//--------------------------------------------------------------------
// Description: Change the registry key for the word new instance.
//--------------------------------------------------------------------
// Arguments:
//                ai_value
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:         Ken.Guo 2015-07-30
//--------------------------------------------------------------------
//Copyright (c) 2008-2015 Contract Logix, Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


String ls_back_value //ls_reg_value
Long ll_pos, i
String ls_main_key[], ls_key[], ls_arr_value[], ls_empty[], ls_arr_value_bak[]
integer li_error1, li_error2

ls_main_key[1] = 'HKEY_CLASSES_ROOT\Word.Document.12\shell\Open\command'
ls_main_key[2] = 'HKEY_CLASSES_ROOT\Word.Document.12\shell\Edit\command'
ls_main_key[3] = 'HKEY_CLASSES_ROOT\Word.Document.12\shell\New\command'
ls_main_key[4] = 'HKEY_CLASSES_ROOT\Word.Document.8\shell\Open\command'
ls_main_key[5] = 'HKEY_CLASSES_ROOT\Word.Document.8\shell\Edit\command'
ls_main_key[6] = 'HKEY_CLASSES_ROOT\Word.Document.8\shell\New\command'
ls_key[1] = 'command'
ls_key[2] = 'command'
ls_key[3] = 'command'
ls_key[4] = 'command'
ls_key[5] = 'command'
ls_key[6] = 'command'

//Word 2010 should modiy RegMultiString! Key. Word 2010 only modify RegString! Key
If app_filler.is_word_versionnumber = '' Then
	app_filler.of_get_word_versionnumber()
End If

If AppeonGetClientType() = 'WEB' and app_filler.is_word_versionnumber <> '15.0'  Then
	If ab_show_message Then
		Messagebox('Error','Failed to set to use a separate Word instance for Contractlogix. Word '+app_filler.is_word_versionnumber+' does not support for Web version.')	
		gnv_debug.of_output(True, 'Failed to set to use a separate Word instance for Contractlogix. Word '+app_filler.is_word_versionnumber+' does not support for Web version.')	
	Else
		gnv_debug.of_output(True, 'Failed to set to use a separate Word instance for Contractlogix. Word '+app_filler.is_word_versionnumber+' does not support for Web version.')	
	End If
End If

//For RegMultiString Key with word 2010 Appeon does not support RegMultiString! Key
If AppeonGetClientType() = 'PB' and app_filler.is_word_versionnumber <> '15.0'  Then
	For i = 1 to UpperBound(ls_main_key[])  //For Word 2013
		ls_arr_value[] = ls_empty[]
		IF registryget(ls_main_key[i],ls_key[i],  RegMultiString!, ls_arr_value[]) <> 1 Then
			gnv_debug.of_output(true, 'Faile to get the registry key: ' +  ls_main_key[i] + '. The registry key does not exist or you do not have enough permission to modify the registry.' )
			li_error1++
			Continue
		End If
		If upperbound( ls_arr_value[] ) = 0 Then 
			gnv_debug.of_output(true, 'Failed get the registry key 1: ' + ls_main_key[i] )
			li_error1++
			Continue
		End If
		If ls_arr_value[1] = '' Then
			gnv_debug.of_output(true, 'Failed get the registry key 2: ' + ls_main_key[i] )
			li_error1++
			Continue		
		End If
		
		//backup key
		ls_arr_value_bak[] = ls_empty[]
		registryget(ls_main_key[i],ls_key[i] + '_contractlogix_backup',  RegMultiString!, ls_arr_value_bak[])
		If upperbound( ls_arr_value_bak[] ) = 0 Then 
			registryset(ls_main_key[i],ls_key[i] +  '_contractlogix_backup',  RegMultiString!, ls_arr_value[])
		End If
	
		//Replace the Key
		If ai_value = 1 then
			ll_pos = Pos(ls_arr_value[1] , ' /n ' )
			If ll_pos > 0 Then
				ls_arr_value[1] = replace(ls_arr_value[1], ll_pos, 4, ' /w ')
			Else
				Continue
			End If
		Else
			ll_pos = Pos( ls_arr_value[1], ' /w ' )
			If ll_pos > 0 Then
				ls_arr_value[1] = replace(ls_arr_value[1], ll_pos, 4, ' /n ')
			Else
				Continue
			End If
		End If
		If registryset(ls_main_key[i], ls_key[i], RegMultiString!, ls_arr_value[]) <> 1 Then
			gnv_debug.of_output(true, 'Failed to set the registry key. Set ' + ls_main_key[i] +'\' + ls_key[i] + '=' + ls_arr_value[1] + '. The registry key does not exist or you do not have enough permission to modify the registry.')
			li_error1++
		End If
	Next
End If

//For String Key
String ls_reg_value,ls_reg_value_bak
String ls_main_key2[], ls_key2[]

ls_main_key2[1] = 'HKEY_CLASSES_ROOT\Word.Document.12\shell\Open\command'
ls_main_key2[2] = 'HKEY_CLASSES_ROOT\Word.Document.12\shell\Edit\command'
ls_main_key2[3] = 'HKEY_CLASSES_ROOT\Word.Document.12\shell\New\command'
ls_main_key2[4] = 'HKEY_CLASSES_ROOT\Word.Document.8\shell\Open\command'
ls_main_key2[5] = 'HKEY_CLASSES_ROOT\Word.Document.8\shell\Edit\command'
ls_main_key2[6] = 'HKEY_CLASSES_ROOT\Word.Document.8\shell\New\command'
ls_main_key2[7] = 'HKEY_CLASSES_ROOT\Applications\Winword.exe\shell\edit\command'
ls_key2[1] = ''
ls_key2[2] = ''
ls_key2[3] = ''
ls_key2[4] = ''
ls_key2[5] = ''
ls_key2[6] = ''
ls_key2[7] = ''

For i = 1 to UpperBound(ls_main_key2[])
	ls_reg_value = ''
	If registryget(ls_main_key2[i],ls_key2[i],  regstring!, ls_reg_value) <> 1 then
		gnv_debug.of_output(true, 'Failed to get the registry key: ' + ls_main_key2[i] )
		li_error2++
		Continue
	End If
	If ls_reg_value = '' Then 
		gnv_debug.of_output(true, 'Failed get the registry key 1: ' + ls_main_key2[i] )
		li_error2++
		Continue
	End If
	
	//backup key
	ls_reg_value_bak = ''
	registryget(ls_main_key2[i],ls_key2[i] + '_contractlogix_backup',  RegString!, ls_reg_value_bak)
	If ls_reg_value_bak = '' Then 
		registryset(ls_main_key2[i],ls_key2[i] +  '_contractlogix_backup',  RegString!, ls_reg_value)
	End If

	//Replace the Key
	If ai_value = 1 then
		ll_pos = Pos(ls_reg_value , ' /n ' )
		If ll_pos > 0 Then
			ls_reg_value = replace(ls_reg_value, ll_pos, 4, ' /w ')
		Else
			continue
		End If
	Else
		ll_pos = Pos( ls_reg_value, ' /w ' )
		If ll_pos > 0 Then
			ls_reg_value = replace(ls_reg_value, ll_pos, 4, ' /n ')
		Else
			continue
		End If
	End If
	If registryset(ls_main_key2[i], ls_key2[i], RegString!, ls_reg_value) <> 1 Then
		gnv_debug.of_output(True, 'Failed to set the registry. Set ' + ls_main_key2[i] + '\' +ls_key2[i]+ '=' + ls_reg_value + '. The registry key does not exist or you do not have enough permission to modify the registry.')
		li_error2++
	End If
Next

If li_error1 > 0 and li_error2 > 0 and ab_show_message Then
	messagebox('Error','Failed to set to use a separate Word instance for Contractlogix. Please check the log for detail.')
End If

Return 1
end function

public function integer of_set_word_new_instance (integer ai_value);Return of_set_word_new_instance(ai_value, False)
end function

on n_cst_word_addins.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_word_addins.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event destructor;if isvalid(ids_word_addins) Then Destroy ids_word_addins
end event

event constructor;//
//n_cst_systeminfo lnv_systeminfo
//lnv_systeminfo = Create n_cst_systeminfo
//
//
//If lnv_systeminfo.of_get_envvar('ProgramW6432') <> '' or lnv_systeminfo.of_get_envvar('ProgramFiles(x86)')  <> '' Then //Modified By Ken.Guo 03/22/2013
//	is_ostype = '64bit'
//Else
//	is_ostype = '32bit'
//End If
//
//Destroy lnv_systeminfo
end event

