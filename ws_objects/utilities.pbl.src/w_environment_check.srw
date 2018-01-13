$PBExportHeader$w_environment_check.srw
forward
global type w_environment_check from w_popup
end type
type shl_webclientactive from statichyperlink within w_environment_check
end type
type cb_clean_register from commandbutton within w_environment_check
end type
type cb_refresh from commandbutton within w_environment_check
end type
type cb_register from commandbutton within w_environment_check
end type
type gb_1 from groupbox within w_environment_check
end type
type shl_sertifi from statichyperlink within w_environment_check
end type
type dw_ocx from u_dw within w_environment_check
end type
type cb_close from commandbutton within w_environment_check
end type
type gb_2 from groupbox within w_environment_check
end type
type dw_export from u_dw within w_environment_check
end type
type gb_3 from groupbox within w_environment_check
end type
type dw_general from u_dw within w_environment_check
end type
end forward

global type w_environment_check from w_popup
integer width = 3858
integer height = 2524
string title = "Environment Check"
boolean center = true
shl_webclientactive shl_webclientactive
cb_clean_register cb_clean_register
cb_refresh cb_refresh
cb_register cb_register
gb_1 gb_1
shl_sertifi shl_sertifi
dw_ocx dw_ocx
cb_close cb_close
gb_2 gb_2
dw_export dw_export
gb_3 gb_3
dw_general dw_general
end type
global w_environment_check w_environment_check

forward prototypes
public function integer of_check ()
public function integer of_check_ocx ()
public function integer wf_create_cmdfile (string as_text)
public subroutine wf_set_ignoreocx ()
end prototypes

public function integer of_check ();String ls_domainname, ls_ARCHITECTURE
n_cst_systeminfo lnv_systeminfo
n_cst_rights lnv_right
n_cst_filesrv lnv_file
n_cst_string lnv_string
n_cst_platform 	inv_platform

SetPointer(HourGlass!)
lnv_systeminfo = Create n_cst_systeminfo
lnv_right = Create n_cst_rights
lnv_file = Create  n_cst_filesrv
inv_platform = Create n_cst_platform

dw_general.setredraw(False)
dw_export.setredraw(False)
dw_ocx.setredraw(False)

//Check version
dw_general.InsertRow(0)
If lnv_systeminfo.of_get_envvar('ProgramW6432') <> '' or lnv_systeminfo.of_get_envvar('ProgramFiles(x86)')  <> '' Then //Modified By Ken.Guo 03/22/2013
	ls_ARCHITECTURE = '64-bit'
Else
	ls_ARCHITECTURE = '32-bit'
End If
String ls_os
Choose Case Left(lnv_systeminfo.of_get_os_version( ),3)
	Case '5.1'
		ls_os ='XP, '
	Case '5.2'
		ls_os = '2003, '
	Case '6.0'
		ls_os = 'Vista, '
	Case '6.1'	
		ls_os = 'Win 7, '  //or Win 2008
	Case '6.2'	
		ls_os = 'Win 8, '
	Case ''
End Choose

dw_general.SetItem(1,'os_version', ls_os + lnv_systeminfo.of_get_os_version( )  + ' (' + ls_ARCHITECTURE + ')')
dw_general.SetItem(1,'win_user_name',  lnv_systeminfo.of_get_username( ) )
If lnv_systeminfo.of_get_domainname( ) =  lnv_systeminfo.of_get_computername( ) Then
	dw_general.SetItem(1,'domain_name',  'N/A')
Else
	dw_general.SetItem(1,'domain_name', lnv_systeminfo.of_get_domainname( ) )
End If
If lnv_systeminfo.of_isadmin( ) Then
	dw_general.SetItem(1,'is_admin',  'Yes')
Else
	dw_general.SetItem(1,'is_admin',  'No')
End If
If Left(lnv_systeminfo.of_get_os_version( ), 3) <> '6.0' Then 
	dw_general.SetItem(1,'UAC',  'N/A')
Else
	If lnv_systeminfo.of_get_uac( ) = 1 Then
		dw_general.SetItem(1,'UAC',  'On')
	//	dw_general.Modify("UAC.color = '255' ")
	Else
		dw_general.SetItem(1,'UAC',  'Off')
	End If
End If

dw_general.SetItem(1,'run_type',  AppeonGetClientType())

If AppeonGetClientType() = 'WEB' Then
	dw_general.SetItem(1,'web_url', AppeonGetIEURL()  )
Else
	dw_general.SetItem(1,'web_url', 'N/A' )
End If
 
//Added By Ken.Guo 01/15/2013. Check IE Trusted Site.
String ls_url
if AppeonGetClientType() = 'WEB' then
	ls_url = 	appeongetieurl()
	If gf_trusted_sites(ls_url) = False Then
		dw_general.SetItem(1, 'trusted_site', 'No')
	Else
		dw_general.SetItem(1, 'trusted_site', 'Yes')
	End If
Else
	dw_general.SetItem(1, 'trusted_site', 'N/A')
End If



String ls_dbinfo, ls_patch
integer li_version
Select @@version,set_18, set_patch_ver into :ls_dbinfo,:li_version,:ls_patch  from icred_settings;
dw_general.SetItem(1,'database_info',  ls_dbinfo)

If Pos(gs_user_version,'Build') > 1 Then
	dw_general.SetItem(1,'app_version', Mid(gs_user_version, 1,Pos(gs_user_version,'Build') - 1 )) 
Else
	dw_general.SetItem(1,'app_version', gs_user_version) 
End If
If  (gs_current_version + '.' + gs_current_version_patch ) = ( String(li_version) + '.' + ls_patch ) Then
	dw_general.SetItem(1,'db_version',  String(li_version) + '.' + ls_patch )
Else
	dw_general.SetItem(1,'db_version',  String(li_version) + '.' + ls_patch  + '  Not Match')
End If

dw_general.SetItem(1,'license',String(gnv_session.is_license_key,'@@@ @@@@ @@@@@@@ @@@@@@@@'))

UnsignedLong ll_totalmem,ll_resource
inv_platform.of_getfreememory( ll_totalmem ,ll_resource)
If ll_resource <> -1 and ll_resource <> 0 Then
	dw_general.SetItem(1,'ava_memory',   string(ll_resource,"#####.0")+ " MB")
End If

//Check Screen Resolution
Long li_screenheight,li_screenwidth
environment	 lenv_obj
If GetEnvironment (lenv_obj) = 1 Then
	dw_general.SetItem(1,'resolution',  String(lenv_obj.screenwidth) + '*' + String(lenv_obj.screenheight))
//	dw_general.SetItem(1,'language',String(lenv_obj.language ))
End If

//Check DB Owner
String ls_dbloginuser, ls_dbowner
SELECT SUSER_SNAME() ,SUSER_SNAME(owner_sid) Into :ls_dbloginuser, :ls_dbowner From sys.databases where name = db_name();
dw_general.SetItem(1,'dbowner',  ls_dbloginuser + ' & ' + ls_dbowner )
If ls_dbloginuser <> ls_dbowner Then
	dw_general.Modify("dbowner.color='"+String(RGB(255,0,0))+"'")
End If


//Check Register
String ls_test,ls_test2
ls_test = String(now(),'HHMMSS')
//Modified By Mark Lee 04/18/12
//gnv_appeondll.of_registryset("HKEY_LOCAL_MACHINE\SOFTWARE\IntelliSoft Group",'test', regstring!, ls_test) 
//gnv_appeondll.of_registryget( "HKEY_LOCAL_MACHINE\SOFTWARE\IntelliSoft Group",'test', ls_test2)
//gnv_appeondll.of_registrydelete( "HKEY_LOCAL_MACHINE\SOFTWARE\IntelliSoft Group",'test')
gnv_appeondll.of_registryset("HKEY_LOCAL_MACHINE\SOFTWARE\"+gs_DefDirName,'test', regstring!, ls_test) 
gnv_appeondll.of_registryget( "HKEY_LOCAL_MACHINE\SOFTWARE\"+gs_DefDirName,'test', ls_test2)
gnv_appeondll.of_registrydelete( "HKEY_LOCAL_MACHINE\SOFTWARE\"+gs_DefDirName,'test')
If ls_test = ls_test2 Then
	dw_general.SetItem(1,'register_right',  'Full Control')
Else
	dw_general.SetItem(1,'register_right',  'No Access')	
	dw_general.Modify("register_right.color = '255' ")
End If

//Check CL Temp Dir right
dw_general.SetItem(1,'cl_temp_dir',  gs_dir_path)	
//If lnv_right.of_check_tempdir_right( ) > 0 Then
If lnv_right.of_check_dir_right( gs_dir_path, False, '') > 0 Then
	dw_general.SetItem(1,'cl_temp_dir_right',  'Full Control')	
Else
	dw_general.SetItem(1,'cl_temp_dir_right',  'No Access')	
	dw_general.Modify("cl_temp_dir_right.color = '255' ")
End If

//Check Web dir
String ls_webdir
If AppeonGetClientType() = 'WEB' Then
	ls_webdir = AppeonGetCacheDir()
	dw_general.SetItem(1,'apb_temp_dir',  ls_webdir)	
	If lnv_right.of_check_dir_right( ls_webdir, False, '') > 0 Then
		dw_general.SetItem(1,'apb_temp_dir_right',  'Full Control')	
	Else
		dw_general.SetItem(1,'apb_temp_dir_right',  'No Access')	
		dw_general.Modify("apb_temp_dir_right.color = '255' ")
	End If
Else
	dw_general.SetItem(1,'apb_temp_dir',  'N/A')	
	dw_general.SetItem(1,'apb_temp_dir_right',  'N/A')	
End If

//Check Word Application
String ls_msword
oleobject lole_word
lole_word = Create oleobject
app_filler.of_set_word_safemode(false, 1) //Added By Ken.Guo 2015-07-30
IF lole_word.Connecttonewobject("word.application") <> 0 THEN
	Destroy lole_word 
	dw_general.SetItem(1,'word_version',  'N/A')	
	dw_general.Modify("word_version.color = '255' ")
Else
	lole_word.Visible = FALSE	
	Choose Case Left(String(lole_word.Application.Version),2)
		Case '11'
			ls_msword = '2003, '
		Case '12'
			ls_msword = '2007, '
		Case '13'
			//ls_msword = 'Word 2008, ' //Maybe 2008?
		Case '14'
			ls_msword = '2010, '
		Case '15'
			ls_msword = '2013, '
	End Choose
	dw_general.SetItem(1,'word_version', ls_msword + String(lole_word.Application.Version))	
	lole_word.disconnectobject( )
	Destroy lole_word 
END IF
app_filler.of_set_word_safemode(false, 0) //Added By Ken.Guo 2015-07-30

//Check IE version
String ls_ie1, ls_ie2, ls_ie3, ls_ie4, ls_ie
String ls_var,	ls_ie_path
ulong lul_chars 

//Begin - Added By Mark Lee 04/30/2013 
gnv_appeondll.of_registryget( 'HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Internet Explorer','svcVersion', ls_ie1)
gnv_appeondll.of_registryget( 'HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Internet Explorer','version', ls_ie2)
gnv_appeondll.of_registryget( 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer','svcVersion', ls_ie3)
gnv_appeondll.of_registryget( 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer','Version', ls_ie4)
If ls_ie1 <> '' and ls_ie = '' Then ls_ie = ls_ie1
If ls_ie2 <> '' and ls_ie = '' Then ls_ie = ls_ie2
If ls_ie3 <> '' and ls_ie = '' Then ls_ie = ls_ie3
If ls_ie4 <> '' and ls_ie = '' Then ls_ie = ls_ie4
If isnull(ls_ie) or trim(ls_ie ) = '' Then 
	dw_general.SetItem(1,'ie_version',   'Failed to get')		
	dw_general.Modify("ie_version.color = '255' ")
Else
	dw_general.SetItem(1,'ie_version',   ls_ie)		
End If

//If ls_ARCHITECTURE = '64-bit' Then 
//	gnv_appeondll.of_registryget( 'HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Internet Explorer','svcVersion', ls_ie)
//////	gnv_debug.of_output( True, ls_ie)
////	If Pos(ls_ie, "%ProgramFiles%") > 0 Then 
////		ls_var = "ProgramFiles"
////		ls_ie_path = Space( 1024 )
////		lul_chars = GetEnvironmentVariableA( ls_var, ls_ie_path, 1024 )
//////		gnv_debug.of_output( True, "ProgramFiles "+ls_ie_path)
////		ls_ie = lnv_string.of_globalreplace( ls_ie,"%ProgramFiles%",ls_ie_path,true)
////	End IF 
//	If isnull(ls_ie) or trim(ls_ie ) = '' Then 
//		gnv_appeondll.of_registryget( 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer','svcVersion', ls_ie)
//		If isnull(ls_ie) or trim(ls_ie ) = '' Then 
//			dw_general.SetItem(1,'ie_version',   'Failed to get')		
//			dw_general.Modify("ie_version.color = '255' ")
//		Else
//			dw_general.SetItem(1,'ie_version',   ls_ie)		
//		End If
//	Else
//		dw_general.SetItem(1,'ie_version',   ls_ie)		
//	End IF 
//Else
//	gnv_appeondll.of_registryget( 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer','version', ls_ie)	
//	If isnull(ls_ie) or trim(ls_ie ) = '' Then 
//		dw_general.SetItem(1,'ie_version',   'Failed to get')		
//		dw_general.Modify("ie_version.color = '255' ")
//	Else
//		dw_general.SetItem(1,'ie_version',   ls_ie)		
//	End If
//End If
//End - Added By Mark Lee 04/30/2013
//gnv_appeondll.of_registryget( 'HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{0002DF01-0000-0000-C000-000000000046}\LocalServer32','', ls_ie)	
//ls_ie = lnv_string.of_globalreplace(ls_ie,'"', '')
//If FileExists(ls_ie) Then
//	dw_general.SetItem(1,'ie_version',   lnv_file.of_getfileversion(ls_ie))		
//Else
//	dw_general.SetItem(1,'ie_version',   'Failed to get')		
//	dw_general.Modify("ie_version.color = '255' ")
//End If

//Check Export Path
Long i
String ls_path
datastore lds_export_list
lds_export_list = Create datastore
lds_export_list.Dataobject = 'd_export_check_path'
lds_export_list.SetTransObject(SQLCA)
lds_export_list.Retrieve()
//Added By Jay Chen 07-10-2014
If gb_contract_version Then
	lds_export_list.setfilter("export_type in (3,4)")
	lds_export_list.filter()
Else
	lds_export_list.setfilter('')
	lds_export_list.filter()
End If
//end
For i = 1 To lds_export_list.Rowcount()
	dw_export.InsertRow(1)
	dw_export.SetItem(1,'Export_name',lds_export_list.GetItemString(i,'export_name'))
	ls_path = lds_export_list.GetItemString(i,'save_path')
	dw_export.SetItem(1,'Export_dir',ls_path)
	If isnull(ls_path) or ls_path = '' Then Continue
	If lnv_right.of_check_dir_right( ls_path, False, '') > 0 Then
		dw_export.SetItem(1,'dir_permissions','Full Control')
	Else
		dw_export.SetItem(1,'dir_permissions','No Access')		
	End If
Next
dw_export.SetSort('dir_permissions DESC')
dw_export.Sort()

//Added By Ken.Guo 2015-10-28 Check IE TimeOut
String ls_ReceiveTimeout, ls_KeepAliveTimeout 
String ls_ie_timeout
String ls_timeout_key = 'HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings'
If gnv_appeondll.of_registryget(ls_timeout_key,'ReceiveTimeout', REGULong!,ls_ReceiveTimeout)	< 0 Then
	ls_ie_timeout = 'N/A'
Else
	ls_ie_timeout = ls_ReceiveTimeout
End If
If gnv_appeondll.of_registryget(ls_timeout_key,'KeepAliveTimeout', REGULong!,ls_KeepAliveTimeout)	< 0 Then
	ls_ie_timeout += ', N/A'
Else
	ls_ie_timeout += ', ' + ls_KeepAliveTimeout
End If
dw_general.SetItem(1,'ie_timeout',   ls_ie_timeout)

//Added By Jay Chen 03-21-2016
string ls_user_name
select user_name into :ls_user_name from security_users where user_id = :gs_user_id;
dw_general.SetItem(1,'login_user', gs_user_id + '(' + ls_user_name + ')')

//Check OCX
of_check_ocx()

//Check Email

dw_general.setredraw(True)
dw_export.setredraw(True)
dw_ocx.setredraw(True)

If  isvalid(lnv_systeminfo) Then Destroy lnv_systeminfo
If isvalid(lnv_right) Then Destroy lnv_right
If isvalid(inv_platform) Then Destroy inv_platform
If isvalid(lds_export_list) Then Destroy lds_export_list

SetPointer(Arrow!)

Return 1


end function

public function integer of_check_ocx ();Integer i,li_row
String ls_filepath,ls_error,ls_fileversion,ls_value, ls_version_need, ls_version_now
str_ocx  lstr_ocx[]
n_cst_reg_control lnv_reg_control
n_cst_filesrv lnv_filesrv
String ls_solution_text

//Added By Ken.Guo 2016-03-16
If appeongetclienttype() = 'WEB' Then
	ls_solution_text = 'Please download and install the ContractLogix WebClientActiveX to resolve it.'
Else
	ls_solution_text = 'Please register OCX or reinstall the Contractlogix application.'
End If

lnv_filesrv = Create n_cst_filesrv

//Begin - Added By Mark Lee 05/28/12

lstr_ocx[1].ocx_type = 4
lstr_ocx[1].ocx_name = "imageviewer2.ocx"

//lstr_ocx[2].ocx_type = 7
//lstr_ocx[2].ocx_name = "msxml4.dll"
lstr_ocx[2].ocx_type = 8
lstr_ocx[2].ocx_name = "emssl.dll"

lstr_ocx[3].ocx_type = 1
lstr_ocx[3].ocx_name = "officecontrol.ocx"

lstr_ocx[4].ocx_type = 2
lstr_ocx[4].ocx_name = "emsmtp.dll"

lstr_ocx[5].ocx_type = 4
lstr_ocx[5].ocx_name = "imagethumbnailcp.ocx"

lstr_ocx[6].ocx_type = 4
lstr_ocx[6].ocx_name = "scanner.ocx"

lstr_ocx[7].ocx_type = 5
lstr_ocx[7].ocx_name = "empop3.dll"

lstr_ocx[8].ocx_type = 6
lstr_ocx[8].ocx_name = "emmsg.dll "

//lstr_ocx[9].ocx_type = 7
//lstr_ocx[9].ocx_name = "MSSOAP30.dll"
//
//lstr_ocx[10].ocx_type = 7
//lstr_ocx[10].ocx_name = "WHSC30.dll"
//
//lstr_ocx[11].ocx_type = 7
//lstr_ocx[11].ocx_name = "WINHTTP5.dll"
//
//lstr_ocx[12].ocx_type = 7
//lstr_ocx[12].ocx_name = "WISC30.dll"
//
//lstr_ocx[13].ocx_type = 8
//lstr_ocx[13].ocx_name = "emssl.dll"

lstr_ocx[9].ocx_type = 9   //added by gavins 20121128
lstr_ocx[9].ocx_name = "emimap4.dll"

//Added By Mark Lee 07/08/2013
lstr_ocx[10].ocx_type = 10
lstr_ocx[10].ocx_name = "EAGetMailObj.dll "

lstr_ocx[11].ocx_type = 11
lstr_ocx[11].ocx_name = "EASendMailObj.dll "

//End - Added By Mark Lee 05/28/12

For i = 1 To UpperBound(lstr_ocx[])
	ls_filepath = ''
	ls_error = lnv_reg_control.of_check_ocx( lstr_ocx[i].ocx_type , lstr_ocx[i].ocx_name, False, ls_filepath)
	li_row = dw_ocx.InsertRow(0)
	dw_ocx.SetItem(li_row, 'ocx_name',lstr_ocx[i].ocx_name )
	dw_ocx.SetItem(li_row, 'ocx_dir',ls_filepath )
	//dw_ocx.SetItem(li_row, 'ocx_version_now',ls_filepath ) //Commented By Ken.Guo 2016-03-16
	If ls_error = '' Then
		dw_ocx.SetItem(li_row, 'ocx_result','Success' )
	Else
		dw_ocx.SetItem(li_row, 'ocx_result','Failure' )	
	End if
	//Modified By Ken.Guo 2016-03-16
	If trim(ls_filepath) = '' and ls_error <> '' Then 
		dw_ocx.SetItem(li_row, 'ocx_version_now','Not registered' )
		dw_ocx.SetItem(li_row, 'error_desc','The file '+lstr_ocx[i].ocx_name+' is not registered. ' + ls_solution_text )
	Else
		If FileExists(ls_filepath) then
			ls_fileversion = lnv_filesrv.of_getfileversion( ls_filepath)
			dw_ocx.SetItem(li_row, 'ocx_version_now',ls_fileversion )
			If ls_error <> '' Then
				dw_ocx.SetItem(li_row, 'error_desc','The file version is not right. '+ ls_solution_text )
			End If
		Elseif ls_error <> '' Then
			dw_ocx.SetItem(li_row, 'ocx_version_now','File does not exist' )
			dw_ocx.SetItem(li_row, 'error_desc','The file '+lstr_ocx[i].ocx_name+' is missing. '+ ls_solution_text )
		End If
	End If
	//Added By Jay Chen 07-17-2014
	ls_value = gnv_user_option.of_Get_option_value("contractlogix-super-master" , "ignoreocx-" + lower(lstr_ocx[i].ocx_name))
	if isnull(ls_value) or ls_value = '' then 
		ls_value = '0'
	end if
	dw_ocx.SetItem(li_row, 'ocr_need',ls_value )
	//end

	//Begin - Added By Ken.Guo 2016-03-15.
	//check the related files
	If (i = 1 or i = 6) and ls_error = '' Then //Image Control, scanner control.
		If lnv_reg_control.is_image_loss_files <> '' Then
			If pos(lnv_reg_control.is_image_loss_files,',') > 0 Then
				dw_ocx.SetItem(li_row, 'error_desc','The related files ('+lnv_reg_control.is_image_loss_files+') are missing. '+ ls_solution_text )
			Else
				dw_ocx.SetItem(li_row, 'error_desc','The related file ('+lnv_reg_control.is_image_loss_files+') is missing. ' + ls_solution_text)
			End If
			dw_ocx.SetItem(li_row, 'ocx_result','Failure' )	
		End If
	End If
	If i = 3 and ls_error = ''  Then //Office Control
		If lnv_reg_control.is_officecontrol_loss_files <> '' Then
			If pos(lnv_reg_control.is_officecontrol_loss_files,',') > 0 Then
				dw_ocx.SetItem(li_row, 'error_desc','The related files ('+lnv_reg_control.is_officecontrol_loss_files+') are missing. '+ ls_solution_text )
			Else
				dw_ocx.SetItem(li_row, 'error_desc','The related file ('+lnv_reg_control.is_officecontrol_loss_files+') is missing. '+ ls_solution_text)
			End If
			dw_ocx.SetItem(li_row, 'ocx_result','Failure' )	
		End If
	End If	
	//End - Added By Ken.Guo 2016-03-15.
Next

dw_ocx.SetSort('ocx_result Asc')
dw_ocx.Sort()

If isvalid(lnv_filesrv) Then Destroy lnv_filesrv


Return 1

end function

public function integer wf_create_cmdfile (string as_text);//====================================================================
// Function: wf_create_file
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//                as_text
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	Mark Lee		Date: 06/07/12
//--------------------------------------------------------------------
//	Copyright (c) 2008-2012 Contract Logix,Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
String		ls_file
Integer 	li_FileNum

IF Not isnull(as_text) and Trim(as_text) <> '' Then
	ls_file = gs_dir_path + gs_DefDirName + '\delete_register.bat'
	If FileExists(ls_file) Then
		If Not FileDelete(ls_file) Then
			Messagebox('Delete','Failed to delete the temp file ' + ls_file + ', please log off and then try again.')
			Return 0
		End If
	End If
		li_FileNum = FileOpen(ls_file, LineMode!, Write!, LockWrite!, Replace!)
//		ls_PluginDir = AppeonGetCacheDir() + '\PlugIn\'
	//	For i = 1 To UpperBound(ls_OCXList[])
	//		FileWrite(li_FileNum, 'Regsvr32 "' + ls_PluginDir + ls_OCXList[i] + '"')
	//	Next	
	FileWrite(li_FileNum,as_text)
	FileClose(li_FileNum)
	//Run(ls_file)
	Return 1 
End IF

Return 0
end function

public subroutine wf_set_ignoreocx ();//Added By Jay Chen 07-17-2014
string ls_value,ls_option_name,ls_ocx_name
long ll_row
dw_ocx.accepttext()
if dw_ocx.ModifiedCount() > 0 then
	for ll_row = 1 to dw_ocx.rowcount()
		ls_value = dw_ocx.getitemstring(ll_row,"ocr_need")
		if isnull(ls_value) or ls_value = '' then 
			ls_value = '0'
		end if
		ls_ocx_name = lower(dw_ocx.getitemstring(ll_row,"ocx_name"))
		ls_option_name = "ignoreocx-" + ls_ocx_name
		gnv_user_option.of_Set_option_value("contractlogix-super-master",  ls_option_name  , ls_value )
	next
	gnv_user_option.of_save( ) 
end if
//end add
end subroutine

on w_environment_check.create
int iCurrent
call super::create
this.shl_webclientactive=create shl_webclientactive
this.cb_clean_register=create cb_clean_register
this.cb_refresh=create cb_refresh
this.cb_register=create cb_register
this.gb_1=create gb_1
this.shl_sertifi=create shl_sertifi
this.dw_ocx=create dw_ocx
this.cb_close=create cb_close
this.gb_2=create gb_2
this.dw_export=create dw_export
this.gb_3=create gb_3
this.dw_general=create dw_general
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.shl_webclientactive
this.Control[iCurrent+2]=this.cb_clean_register
this.Control[iCurrent+3]=this.cb_refresh
this.Control[iCurrent+4]=this.cb_register
this.Control[iCurrent+5]=this.gb_1
this.Control[iCurrent+6]=this.shl_sertifi
this.Control[iCurrent+7]=this.dw_ocx
this.Control[iCurrent+8]=this.cb_close
this.Control[iCurrent+9]=this.gb_2
this.Control[iCurrent+10]=this.dw_export
this.Control[iCurrent+11]=this.gb_3
this.Control[iCurrent+12]=this.dw_general
end on

on w_environment_check.destroy
call super::destroy
destroy(this.shl_webclientactive)
destroy(this.cb_clean_register)
destroy(this.cb_refresh)
destroy(this.cb_register)
destroy(this.gb_1)
destroy(this.shl_sertifi)
destroy(this.dw_ocx)
destroy(this.cb_close)
destroy(this.gb_2)
destroy(this.dw_export)
destroy(this.gb_3)
destroy(this.dw_general)
end on

event open;call super::open;This.post of_check()
end event

event closequery;call super::closequery;cb_close.triggerevent(clicked!) //Added By Jay Chen 07-17-2014
end event

type shl_webclientactive from statichyperlink within w_environment_check
boolean visible = false
integer x = 37
integer y = 2344
integer width = 2126
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean underline = true
string pointer = "HyperLink!"
long textcolor = 134217856
long backcolor = 67108864
string text = "If the DLL or OCX fail to register please download and install the ContractLogix WebClientActiveX."
boolean focusrectangle = false
string url = "https://contractlogix.sharefile.com/d-sff85e2bb5c64bed9"
end type

event clicked;//see URL properties
end event

type cb_clean_register from commandbutton within w_environment_check
integer x = 2167
integer y = 2296
integer width = 421
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Clean Register"
end type

event clicked;
long				ll_Rtn, ll_rowcount, ll_row 
String				ls_TempDir,ls_LastClrDate, ls_ocx_name	,	 ls_path
//n_cst_filesrv 	inv_filesrv
Boolean			lbn_rtn = True , lb_exist, lbn_delete = True
String 			ls_DllName[], ls_tmp[]
Long 				ll_UpperBound,	k
String				ls_register, ls_err, ls_register_bat = '@echo off~r~n'
ll_rowcount = dw_ocx.rowcount( ) 
IF ll_rowcount <= 0 Then
	Return
End IF

ll_Rtn = MessageBox('Confirm Files Clean Register','Are you sure you want to clean the Register files?',Question!,YesNo!)
if ll_Rtn <> 1 then return

//Delete Files and Dir
//f_SetFileSrv(inv_filesrv,TRUE)
ls_err = ''
For ll_row  = 1 to ll_rowcount
	ls_TempDir = dw_ocx.GetItemString(ll_row,'ocx_dir')
	IF isnull(ls_TempDir) or trim(ls_TempDir) = '' Then 
		continue
	End IF 
	ls_DllName	=	ls_tmp 
	lb_exist = FileExists(ls_TempDir)
	If lb_exist = true Then
		ls_path = left(ls_TempDir,LastPos(ls_TempDir,'\'))
		lbn_rtn	=	FileDelete(ls_TempDir)
		IF  lbn_rtn = False or isnull(lbn_rtn) Then
			lbn_delete = False
			ls_err	+=	" Failed to delete file: " +ls_TempDir + "~r~n"
			ls_register_bat +='if exist "'+ls_TempDir+'" (~r~n del "'+ ls_TempDir + '"~r~n) else (~r~n echo "Does not exist file: '+ ls_TempDir + '"~r~n)~r~n'
//			messagebox('delete faile ',ls_TempDir)
		End IF
		ls_ocx_name 	 = lower(dw_ocx.GetItemString(ll_row,'ocx_name'))

			CHOOSE CASE ls_ocx_name
				CASE 'imageviewer2.ocx'
					ls_DllName[1] = 'viscomocr.dll'
					ls_DllName[2] = 'viscompsd.dll'					
					ls_DllName[3] = 'TIFF2PDF.dll'
					ls_DllName[4] = 'viscomdocx.dll'
					ls_DllName[5] = 'msvcrt.dll'					
					ls_DllName[6] = 'mfc42.dll'										
					ls_DllName[7] = 'viscompdf.dll'							
				CASE 'scanner.ocx'
					ls_DllName[1] = 'viscompdf.dll'		
//Commented By Ken.Guo 08/13/2012. User should install SAOPSDK.exe
//				CASE 'msxml4.dll'	
//					ls_DllName[1] = 'msxml4r.dll'		
//				CASE 'mssoap30.dll'	
//					ls_DllName[1] = 'MSSOAPR3.dll'	
//				CASE 'wisc30.dll'
//					ls_DllName[1] = 'MSSOAPR3.dll'	
//				CASE 'whsc30.dll'
//					ls_DllName[1] = 'MSSOAPR3.dll'	
				CASE 'officecontrol.ocx'		
					//Added By Mark Lee 12/23/2013
					ls_DllName[1] = 'ntkocmnres.dll'		
					ls_DllName[2] = 'ntkoHtPkcs11.dll'		
				CASE 'emsmtp.dll'						
					ls_DllName[1] = 'emsmtp.dll'		
				CASE 'emmsg.dll'											
					ls_DllName[1] = 'emmsg.dll'	
				CASE 'emimap4.dll'	//added by gavins 20121128										
					ls_DllName[1] = 'emimap4.dll'		
				CASE 'EAGetMailObj.dll'						
					ls_DllName[1] = 'EAGetMailObj.dll'			//Added By Mark Lee 07/08/2013
				CASE 'EASendMailObj.dll'						
					ls_DllName[1] = 'EASendMailObj.dll'		//Added By Mark Lee 07/08/2013
				CASE ELSE

			END CHOOSE 
			ll_UpperBound = UpperBound(ls_DllName)
			If ll_UpperBound > 0 Then
				For k = 1 to ll_UpperBound
					lb_exist = FileExists(ls_path+ls_DllName[k])
					If lb_exist = true Then
						If FileDelete(ls_path+ls_DllName[k]) = False THen
							If Pos(ls_err,ls_DllName[k]) = 0  then
		//						messagebox('delete faile 2  ',ls_DllName[k])
								ls_err	+=	" Failed to delete file: " +ls_path+ls_DllName[k] + "~r~n"
								ls_register_bat +='if exist "'+ls_path+ls_DllName[k]+'" (~r~n del "'+ ls_path+ls_DllName[k] + '"~r~n ) else (~r~n echo "Does not exist file: '+ ls_path+ls_DllName[k] + '"~r~n)~r~n'
		//						ls_register_bat +='if exist "'+ls_path+ls_DllName[k] +'" del "'+ ls_path+ls_DllName[k]  + '"~r~n '
							End If
						End If
					End If
				Next
			End If
	End If
//	ll_Rtn = inv_filesrv.of_deltree(ls_TempDir, False)
//	If ll_Rtn < 0 Then
//		lbn_rtn = False
//	End If
		ls_register =	"Regsvr32 /s /U "+"~'"+ls_TempDir+"~'"
		ll_Rtn	=	Run(ls_register)
//		messagebox('run = '+string(ll_Rtn),'@@ '+ls_TempDir)
Next 
//Destroy inv_filesrv
//Check the result.
If  lbn_delete = False or isnull(lbn_delete) Then
	ls_register_bat += 'pause'
	wf_create_cmdfile(ls_register_bat)
	OpenWithParm(w_environment_check_msg ,ls_err)
//	MessageBox(gnv_app.iapp_object.DisplayName,"Failed to delete some files because they are being used right now. ~r~n~r~nWe suggest that you close this IE and then remove the  Register files manually.",Exclamation!)
else
	MessageBox(gnv_app.iapp_object.DisplayName,"The Register files were cleaned successfully! ~r~nWe suggest that you exit ContractLogix and then run again.")
end if
end event

type cb_refresh from commandbutton within w_environment_check
integer x = 3095
integer y = 2296
integer width = 343
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Refresh"
boolean default = true
end type

event clicked;wf_set_ignoreocx() //Added By Jay Chen 10-09-2014
dw_general.reset( )
dw_export.reset( )
dw_ocx.reset()

Parent.of_check()
end event

type cb_register from commandbutton within w_environment_check
integer x = 2597
integer y = 2296
integer width = 489
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Register OCX (CMD)"
end type

event clicked;wf_set_ignoreocx() //Added By Jay Chen 10-09-2014
of_reg_dllocx_cmd()
end event

type gb_1 from groupbox within w_environment_check
integer x = 37
integer y = 8
integer width = 3744
integer height = 912
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "General Check"
end type

type shl_sertifi from statichyperlink within w_environment_check
boolean visible = false
integer x = 37
integer y = 2272
integer width = 992
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean underline = true
string pointer = "HyperLink!"
long textcolor = 134217856
long backcolor = 67108864
string text = "Download SoapToolkit for Signature Function"
boolean focusrectangle = false
string url = "http://web.contractlogix.com/templates/soapsdk.exe"
end type

event clicked;//see URL properties
end event

type dw_ocx from u_dw within w_environment_check
integer x = 78
integer y = 1440
integer width = 3685
integer height = 800
integer taborder = 20
string dataobject = "d_env_check_ocx"
boolean livescroll = false
end type

event constructor;call super::constructor;This.of_setupdateable(False)
end event

event buttonclicked;call super::buttonclicked;//Added By Ken.Guo 2016-03-16
If dwo.name = 'b_show_error' and row > 0 Then
	Messagebox('Error Description',GetItemString(row, 'error_desc'))
End If
end event

type cb_close from commandbutton within w_environment_check
integer x = 3447
integer y = 2296
integer width = 343
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Close"
boolean cancel = true
end type

event clicked;wf_set_ignoreocx() //Added By Jay Chen 10-09-2014

Close(Parent)
end event

type gb_2 from groupbox within w_environment_check
integer x = 37
integer y = 1372
integer width = 3744
integer height = 884
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "DLL && OCX Check"
end type

type dw_export from u_dw within w_environment_check
integer x = 82
integer y = 996
integer width = 3685
integer height = 340
integer taborder = 20
string dataobject = "d_env_check_export"
boolean livescroll = false
end type

event constructor;call super::constructor;This.of_setupdateable(False)
end event

type gb_3 from groupbox within w_environment_check
integer x = 37
integer y = 932
integer width = 3744
integer height = 432
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Export Function Check"
end type

type dw_general from u_dw within w_environment_check
integer x = 59
integer y = 76
integer width = 3685
integer height = 820
integer taborder = 10
boolean bringtotop = true
string dataobject = "d_env_check_generate"
boolean vscrollbar = false
boolean livescroll = false
end type

event constructor;call super::constructor;This.of_setupdateable(False)
end event

event buttonclicked;call super::buttonclicked;//Added By Ken.Guo 2015-10-28
Choose Case dwo.name
	Case 'b_ie_timeout_set'
		Open(w_ie_timeout)
		If message.doubleparm = 1 Then
			cb_refresh.event clicked( )
		End If
End Choose
end event

