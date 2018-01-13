$PBExportHeader$n_cst_reg_control.sru
forward
global type n_cst_reg_control from nonvisualobject
end type
end forward

global type n_cst_reg_control from nonvisualobject autoinstantiate
end type

type prototypes
Function long GetFileVer(string Filename,ref string sFileVer) LIBRARY "AppeonDLL.dll" alias for "GetFileVer;Ansi"
function long SetDllDirectory(string as_Path) library "appeondll.dll" alias for "SetDllDirectory;Ansi"
end prototypes

type variables

//n_cst_reg_officecontrol inv_officecontrol
//n_cst_reg_emsmtp inv_emsmtp
//n_cst_reg_empop3 inv_empop3
//n_cst_reg_emimap4 inv_emimap4  //added by gavins 20121122
//n_cst_reg_emmsg inv_emmsg
//n_cst_reg_emssl inv_emssl
//n_cst_reg_imageviewer2 inv_imageviewer2
//n_cst_reg_imagethumbnailcp inv_imagethumbnailcp
//n_cst_reg_scanner inv_scanner
//
//n_cst_reg_imgedit inv_imgedit
//n_cst_reg_imgscan inv_imgscan
//n_cst_reg_Imgadmin inv_imgadmin
//n_cst_reg_Imgocr inv_imgocr
//n_cst_reg_Imgthumb inv_imgthumb
//
//n_cst_reg_mssoap30 inv_mssoap30
//n_cst_reg_mssoapr3 inv_mssoapr3
//n_cst_reg_msxml4 inv_msxml4
//n_cst_reg_soapis30 inv_soapis30
//n_cst_reg_whsc30 inv_whsc30
//n_cst_reg_winhttp5 inv_winhttp5
//n_cst_reg_wisc30 inv_wisc30
//

//String is_module_name[] = {'Office','Email','Imaging 360','New Imaging','POP3','POP3 Message','Sertifi Electronic Signature','Email SSL', 'IMAP4' }		//Added By Mark Lee 07/08/2013
String is_module_name[] = {'Office','Email','Imaging 360','New Imaging','POP3','POP3 Message','Sertifi Electronic Signature','Email SSL', 'IMAP4','EAGetMailObj','EASendMailObj' }
String is_check_result[]
//Added By Mark Lee 07/08/2013		//Added By Mark Lee 07/08/2013
//Boolean ib_ocx_checked[] = {False,False,False,False,False,False,False,False, False}
Boolean ib_ocx_checked[] = {False,False,False,False,False,False,False,False, False, False, False}

n_cst_string_appeon inv_string

String is_officecontrol_loss_files, is_image_loss_files //Added By Ken.Guo 2016-03-15
end variables

forward prototypes
public function string of_geterrormessage (long al_errorno)
public function string of_register (string as_control, boolean ab_displayerror)
public function boolean of_check_instance_ocx (string as_prog_id)
public function string of_check_all_ocxs (boolean ab_show_error)
public subroutine of_show_message (string as_module_name, string as_error_info)
public function string of_check_ocx (integer ai_control, string as_ocx_name, boolean ab_show_error)
public subroutine of_reset_check_flag (integer ai_ocx_num)
public function string of_get_dll_dir ()
public function string of_check_ocx (integer ai_control, string as_ocx_name, boolean ab_show_error, ref string as_filepath)
public function integer of_filecopy_exists (string as_source, string as_target, boolean abln_replace)
end prototypes

public function string of_geterrormessage (long al_errorno);string ls_Error

choose case al_ErrorNo
	case -1
		ls_Error = "Exception happened when invoking the DllRegisterServer function."
	case else		
		ls_Error = "Your Windows login account may not have proper rights or unknown errors occurred."
end choose

Return ls_Error
end function

public function string of_register (string as_control, boolean ab_displayerror);string ls_Error,ls_ocxs
long ll_Result
Integer li_module_num
String ls_dll_dir
n_cst_reg_officecontrol inv_officecontrol
n_cst_reg_emsmtp inv_emsmtp
n_cst_reg_empop3 inv_empop3
n_cst_reg_emimap4 inv_emimap4  //added by gavins 20121122
n_cst_reg_emmsg inv_emmsg
n_cst_reg_emssl inv_emssl
n_cst_reg_imageviewer2 inv_imageviewer2
n_cst_reg_imagethumbnailcp inv_imagethumbnailcp
n_cst_reg_scanner inv_scanner

n_cst_reg_imgedit inv_imgedit
n_cst_reg_imgscan inv_imgscan
n_cst_reg_Imgadmin inv_imgadmin
n_cst_reg_Imgocr inv_imgocr
n_cst_reg_Imgthumb inv_imgthumb

n_cst_reg_mssoap30 inv_mssoap30
n_cst_reg_mssoapr3 inv_mssoapr3
n_cst_reg_msxml4 inv_msxml4
n_cst_reg_soapis30 inv_soapis30
n_cst_reg_whsc30 inv_whsc30
n_cst_reg_winhttp5 inv_winhttp5
n_cst_reg_wisc30 inv_wisc30

//Begin - Added By Mark Lee 05/29/12 add filter condition about web
If AppeonGetClientType() = 'PB' Then
	
	ls_dll_dir = This.of_get_dll_dir( )
	SetDllDirectory(ls_dll_dir)
	
	// Register controls
	choose case Lower(as_Control)
		case "officecontrol.ocx"
			li_module_num = 1
			if not of_ignoreocx_check("officecontrol.ocx") then //Added By Jay Chen 07-17-2014
				ll_Result = inv_officecontrol.of_Register()
			else
				ll_Result = 0
			end if
		case "emsmtp.dll"
			li_module_num = 2
			if not of_ignoreocx_check("emsmtp.dll") then //Added By Jay Chen 07-17-2014
				ll_Result = inv_emsmtp.of_Register()
			else
				ll_Result = 0
			end if
		case "imageviewer2.ocx"
			li_module_num = 4
			if not of_ignoreocx_check("imageviewer2.ocx") then //Added By Jay Chen 07-17-2014
				ll_Result = inv_imageviewer2.of_Register() 
			
				//Workaround bug for appeon.dll::GetFileVer() 
				ll_Result = inv_imagethumbnailcp.of_Register()
				ll_Result = inv_scanner.of_Register()
			else
				ll_Result = 0
			end if
		case "imagethumbnailcp.ocx"
			li_module_num = 4
			if not of_ignoreocx_check("imagethumbnailcp.ocx") then //Added By Jay Chen 07-17-2014
				ll_Result = inv_imagethumbnailcp.of_Register()
			else
				ll_Result = 0
			end if
		case "scanner.ocx"
			li_module_num = 4
			if not of_ignoreocx_check("scanner.ocx") then //Added By Jay Chen 07-17-2014
				ll_Result = inv_scanner.of_Register()
			else
				ll_Result = 0 
			end if
		case "empop3.dll"	
			li_module_num = 5
			if not of_ignoreocx_check("empop3.dll") then //Added By Jay Chen 07-17-2014
				ll_Result = inv_empop3.of_Register()		
			else
				ll_Result = 0
			end if
		case "emmsg.dll"	
			li_module_num = 6
			if not of_ignoreocx_check("emmsg.dll") then //Added By Jay Chen 07-17-2014
				ll_Result = inv_emmsg.of_Register()	
			else
				ll_Result = 0
			end if
			
		//	
		case "imgedit.ocx"
			li_module_num = 3
			if not of_ignoreocx_check("imgedit.ocx") then //Added By Jay Chen 07-17-2014
				ll_Result = inv_imgedit.of_Register()
			else
				ll_Result = 0
			end if
		case "imgscan.ocx"
			li_module_num = 3
			if not of_ignoreocx_check("imgscan.ocx") then //Added By Jay Chen 07-17-2014
				ll_Result = inv_imgscan.of_Register()
			else
				ll_Result = 0
			end if
		case "imgadmin.ocx"
			li_module_num = 3
			if not of_ignoreocx_check("imgadmin.ocx") then //Added By Jay Chen 07-17-2014
				ll_Result = inv_Imgadmin.of_Register()
			else
				ll_Result = 0
			end if
		case "imgocr.ocx"
			li_module_num = 3
			if not of_ignoreocx_check("imgocr.ocx") then //Added By Jay Chen 07-17-2014
				ll_Result = inv_imgocr.of_Register()
			else
				ll_Result = 0
			end if
		case "imgthumb.ocx"
			li_module_num = 3
			if not of_ignoreocx_check("imgthumb.ocx") then //Added By Jay Chen 07-17-2014
				ll_Result = inv_imgthumb.of_Register()
			else
				ll_Result = 0
			end if
//		case "mssoap30.dll"
//			li_module_num = 7
//			ll_Result = inv_mssoap30.of_Register()
//		case "msxml4.dll"
//			li_module_num = 7
//			ll_Result = inv_msxml4.of_Register()
//		case "whsc30.dll"
//			li_module_num = 7
//			ll_Result = inv_whsc30.of_Register()
//		case "winhttp5.dll"
//			li_module_num = 7
//			ll_Result = inv_winhttp5.of_Register()
//		case "wisc30.dll"		
//			li_module_num = 7
//			ll_Result = inv_wisc30.of_Register()
	
		case 'emssl.dll'		
			li_module_num = 8
			if not of_ignoreocx_check("emssl.dll") then //Added By Jay Chen 07-17-2014
				ll_Result = inv_emssl.of_Register()
			else
				ll_Result = 0
			end if
		case 'emimap4.dll'		
			li_module_num = 9
			if not of_ignoreocx_check("emimap4.dll") then //Added By Jay Chen 07-17-2014
				ll_Result = inv_emimap4.of_Register()	
			else
				ll_Result = 0
			end if
	end choose
	
	
	
	// Prompt error if error occur
	If AppeonGetClientType() = 'PB' Then
		//if ll_Result <> 0 then
			of_reset_check_flag(li_module_num)
			If This.of_check_ocx(li_module_num,Lower(as_Control), false) = '' Then 
				//Failed to Register, but it is usable. because administrator has registered it.
				ls_error = '' 
			Else
				//messagebox("ff","")
				ls_Error = "Failed to register '" + as_Control + "', error code = " + String(ll_Result) +'. '+ of_GetErrorMessage(ll_Result)
				ls_ocxs=as_Control
				if ab_DisplayError then
					ls_Error += of_GetErrorMessage(ll_Result) + ". Please contact the system administrator."
					
					//MessageBox("Register Error (Error Code = " + String(ll_Result) + ")", ls_Error, StopSign!)
				end if
				//messagebox(ls_Error,"end")
			End If
		//end if
	Else
		of_reset_check_flag(li_module_num)
		If This.of_check_ocx(li_module_num,Lower(as_Control), ab_displayerror) <> '' Then
			ls_ocxs = as_Control //Ken.Guo 2009-01-06
		End If
	End If
	
	
	//Return ls_Error
	Return ls_ocxs
Else
	Return as_Control
End IF
//End - Added By Mark Lee 05/29/12

end function

public function boolean of_check_instance_ocx (string as_prog_id);//////////////////////////////////////////////////////////////////////
// $<function>n_cst_reg_control::of_check_instance_ocx()
// $<arguments>
//		value	string	as_prog_id	//OCX's Prog ID.	
// $<returns> boolean
// $<description> Check OCX whether usable By instance it.
//////////////////////////////////////////////////////////////////////
// $<add> 11.05.2008 by Ken.Guo
//////////////////////////////////////////////////////////////////////

//Commented By Ken.Guo 2010-09-01. Because this function will lock the ocx file.
//Integer li_rc
//oleobject lole_check
//
//lole_check = CREATE oleobject
//li_rc = lole_check.ConnectToNewObject(as_prog_id)
//If isvalid(lole_check) Then Destroy lole_check
//
//IF li_rc <> 0 THEN
//   Return False
//Else
//	Return True
//END IF
//
Return True

end function

public function string of_check_all_ocxs (boolean ab_show_error);//////////////////////////////////////////////////////////////////////
// $<function>n_cst_reg_control::of_check_all_ocxs()
// $<arguments>(None)
// $<returns> string
// $<description> Check All OCXs.
// $<description>
//////////////////////////////////////////////////////////////////////
// $<add> 11.04.2008 by Ken.Guo
//////////////////////////////////////////////////////////////////////

Integer i
String ls_return,ls_error
Integer li_cnt
String ls_module_names
//li_cnt = 8
li_cnt =  11 		//Added By Mark Lee 07/08/2013

For i = 1 to li_cnt
	If i = 3 Then //Imaging 360
		If gi_imageocx <> 1 Then Continue
	End If
	
	//Added by Ken.Guo 08/13/2012
	If i = 7 Then
		Continue
	End If
	
	ls_return = of_check_ocx(i,'',False)
	If ls_return <> '' Then
		//ls_error += ls_return + '~r~n'
		ls_error += ls_return + ', '
		If i < UpperBound(is_module_name[]) Then Continue
		ls_module_names += is_module_name[i] + ' & '
	End If
	is_check_result[i] = mid(ls_error,1,len(ls_error) - 2)
Next

ls_module_names = mid(ls_module_names,1,len(ls_module_names) - 3)
ls_error = mid(ls_error,1,len(ls_error) - 2)
If ls_error <> '' and ab_show_error Then
	
	of_show_message(ls_module_names, ls_error)
	
End If

Return ls_error
end function

public subroutine of_show_message (string as_module_name, string as_error_info);//////////////////////////////////////////////////////////////////////
// $<function>n_cst_reg_control::of_show_message()
// $<arguments>
//		value	string	as_module		
//		value	string 	as_error_info		
// $<returns> (none)
// $<description>
// $<description>
//////////////////////////////////////////////////////////////////////
// $<add> 11.05.2008 by Ken.Guo
//////////////////////////////////////////////////////////////////////
//messagebox("",as_module_name)

//If as_error_info = '' Then Return 
//If Pos(as_module_name,'&',1) > 0 Then //Multi modules
//	Messagebox(as_module_name +' functions are unusable',as_error_info,Exclamation!)
//Else
//	Messagebox(as_module_name +' function is unusable',as_error_info,Exclamation!)
//End If

f_show_message('OCX Issue','%1S%',as_error_info,'','')
end subroutine

public function string of_check_ocx (integer ai_control, string as_ocx_name, boolean ab_show_error);String ls_filepath

Return This.of_check_ocx(ai_control, as_ocx_name, ab_show_error, ls_filepath)

/*  
//////////////////////////////////////////////////////////////////////
// $<function>n_cst_reg_control::of_check_ocx()
// $<arguments>
//		value	integer	as_control	
//							1: Office OCX; 
//							2: Email OCX;
//							3: New Image OCXs; 
//							4: Imaging360 OCXs	
//							5: empop3 OCX;
//							6: emmsg OCX;
//							7: Sertifi Electronic Signature;
//							8: Email SSL
//		value string 	as_ocx_name . if it is '', check all OCXs of this type control.
//		value boolean	ab_show_error
// $<returns> string
// $<description> Check OCX. If it is unusable, then return error string.
// $<description>
//////////////////////////////////////////////////////////////////////
// $<add> 11.04.2008 by Ken.Guo
//////////////////////////////////////////////////////////////////////

n_cst_AppeonDll	lnv_Appeon
Integer i
String ls_module_name
String ls_key
String ls_Value
String ls_ocx_names[]  //For multi-OCXs
String ls_Key_OCXs[]   //For multi-OCXs
String ls_return
String ls_prod_id[] 
Long ll_file_size[],ll_cur_file_size
String ls_file_version[]
String ls_version


n_versioninfo lv_versionInfo
lv_versionInfo = Create n_versioninfo

n_cst_filesrv lnv_filesrv //Added By Ken.Guo 09/27/2011. 
lnv_filesrv = Create n_cst_filesrv

If ib_ocx_checked[ai_control] Then 
		ls_return = is_check_result[ai_control]
Else
	//Check OCX
	choose case ai_control
		case 1 //"officecontrol.ocx"
			ls_Key = "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{D267E82F-8649-41ee-9121-050130B1715F}\InprocServer32"
			lnv_Appeon.of_registryget(ls_Key,"", RegString!, ls_Value)

			ll_file_size[1] = 476672  //Version 4.0 
			ll_file_size[2] = 574976  //Version 5.0
			//If ls_value = '' or (Not FileExists(ls_value))  or (Not This.of_check_instance_ocx('OFFICEINIE.OfficeControlPB')) Then //Don't use of_check_instance_ocx to check it, otherwise it will lock the file.
			If ls_value = '' or (Not FileExists(ls_value)) Then
				ls_return = "officecontrol.ocx"
			End If
			
			If gs_imageview_version = '5.0' Then
				ll_cur_file_size = ll_file_size[2]
			Else
				ll_cur_file_size = ll_file_size[1]
			End If
			
			If FileLength(ls_value) <> ll_cur_file_size Then
				ls_return = "officecontrol.ocx"
			End If
			ib_ocx_checked[ai_control] = True
		case 2 //"emsmtp.dll"
			ls_Key = "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\TypeLib\{68AC0D5D-0424-11D5-822F-00C04F6BA8D9}\6.5\0\win32"
			lnv_Appeon.of_registryget(ls_Key,"", RegString!, ls_Value)

			If ls_value = '' or Not This.of_check_instance_ocx('EasyMail.SMTP.6.5') Then
				//ls_return = 'The Email plugin "emsmtp.dll" don~'t register.'
				ls_return = "emsmtp.dll"
			End If		
			ib_ocx_checked[ai_control] = True
		case 3 //Imaging 360 OCXs: "imgedit.ocx";"imgscan.ocx";"imgadmin.ocx";"imgocr.ocx";"imgthumb.ocx"
			If gi_imageocx <> 1 Then 
				ls_return = ''			
			Else
				ls_ocx_names[1] = "imgedit.ocx"
				ls_ocx_names[2] = "imgscan.ocx"
				ls_ocx_names[3] = "imgadmin.ocx"
				ls_ocx_names[4] = "imgocr.ocx"
				ls_ocx_names[5] = "imgthumb.ocx"
				ls_Key_OCXs[1]	= "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{6D940280-9F11-11CE-83FD-02608C3EC08A}\InprocServer32"
				ls_Key_OCXs[2] = "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{84926CA0-2941-101C-816F-0E6013114B7F}\InprocServer32"
				ls_Key_OCXs[3] = "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{009541A0-3B81-101C-92F3-040224009C02}\InprocServer32"
				ls_Key_OCXs[4] = "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{8FC248E3-D4D9-11CF-8727-0020AFA5DCA7}\InprocServer32"
				ls_Key_OCXs[5] = "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{E1A6B8A0-3603-101C-AC6E-040224009C02}\InprocServer32"		
				ls_prod_id[1] = "Imaging.EditCtrl.1"
				ls_prod_id[2] = "Imaging.ScanCtrl.1"
				ls_prod_id[3] = "Imaging.AdminCtrl.1"
				ls_prod_id[4] = "Imaging.OcrCtrl.1"
				ls_prod_id[5] = "Imaging.ThumbnailCtrl.1"
				
				For i = 1 To Upperbound(ls_Key_OCXs[])	
					If as_ocx_name <> '' and lower(as_ocx_name) <> lower(ls_ocx_names[i]) Then Continue //Only check special OCX
					
					//Check All OCXs
					ls_Value = ''	
					lnv_Appeon.of_registryget(ls_Key_OCXs[i],"", RegString!, ls_Value)
					/*
					If FileExists(ls_Value) Then 
						If This.of_check_instance_ocx(ls_prod_id[i]) Then 
							Continue //Check Pass
						Else
							ls_return += 'Failed to invoke the image plugin "'+ls_ocx_names[i]+'".~r~n'
						End If
					Else			
						//If unusable
						If ls_Value <> '' Then
							ls_return += 'The image plugin "' + ls_Value + '" don~'t exist.~r~n'
						Else
							ls_return += 'The image plugin "'+ls_ocx_names[i]+'" don~'t register.~r~n'
						End If
					End If
					*/
					If ls_value = '' or Not This.of_check_instance_ocx(ls_prod_id[i]) Then
						//ls_return += 'The image plugin "'+ls_ocx_names[i]+'" don~'t register.~r~n'
						ls_return += ls_ocx_names[i]+', '
					End If		
				Next
				ls_return = Mid(ls_return,1,Len(ls_return) - 2)
				If as_ocx_name = ls_ocx_names[Upperbound(ls_ocx_names)] or as_ocx_name = '' Then 
					ib_ocx_checked[ai_control] = True
				End If
			End If
		case 4 //New Image OCXs: "imageviewer2.ocx";"imagethumbnailcp.ocx";"scanner.ocx"
			//Always need check it, although gi_imageocx = 1
			ls_ocx_names[1] = "imageviewer2.ocx"
			ls_ocx_names[2] = "imagethumbnailcp.ocx"
			ls_ocx_names[3] = "scanner.ocx"
			//ls_Key_OCXs[1] = "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\TypeLib\{C9460280-3EED-11D0-A647-00A0C91EF7B9}\1.0\0\win32"
			//ls_Key_OCXs[2] = "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\TypeLib\{51F37CDE-2D78-495D-8B30-D57ABDA60369}\1.0\0\win32"
			ls_Key_OCXs[1] = "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{E589DA78-AD4C-4FC5-B6B9-9E47B110679E}\InprocServer32"
			ls_Key_OCXs[2] = "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{797D023E-E647-45DD-8B81-2F574238FE8F}\InprocServer32"
			ls_Key_OCXs[3] = "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{20666F83-3F1D-4211-9DBF-2FF783A18E18}\InprocServer32"
			ls_prod_id[1] = "SCRIBBLE.ScribbleCtrl.1"
			ls_prod_id[2] = "IMAGETHUMBNAILCP.ImageThumbnailCPCtrl.1"
			ls_prod_id[3] = "SCANNER.ScannerCtrl.1"
			ll_file_size[1] = 2613248 //6.8 //2609152//6.5 //2592768(6.0) 2584576(5.0) //Different ImageView Version, use file size for discern. 
			ll_file_size[2] = 1798144//4.6 //1794048 (4.0)
			ll_file_size[3] = 180224	
			
			ls_file_version[1] = '6.8'  //Check file version replace file size.
			ls_file_version[2] = '4, 6, 0, 0'
			ls_file_version[3] = '3, 8, 0, 1'			
	
			For i = 1 To Upperbound(ls_Key_OCXs[])	
				If as_ocx_name <> '' and lower(as_ocx_name) <> lower(ls_ocx_names[i]) Then Continue //Only check special OCX
			
				//Check All OCXs
				ls_Value = ''	
				lnv_Appeon.of_registryget(ls_Key_OCXs[i],"", RegString!, ls_Value)
				/*
				If FileExists(ls_Value) Then 
					Continue
					/* Error to call ConnectToNewObject()
					If This.of_check_instance_ocx(ls_prod_id[i]) Then 
						Continue //Check Pass
					Else
						ls_return += 'Failed to invoke the new image plugin "'+ls_ocx_names[i]+'".~r~n'
					End If
					*/
				Else		
					//If unusable
					If ls_Value <> '' Then
						ls_return += 'The new image plugin "' + ls_Value + '" don~'t exist.~r~n'
					Else
						ls_return += 'The new image plugin "'+ls_ocx_names[i]+'" don~'t register.~r~n'
					End If
				End If
				*/
				//If do not regist or regist different version
				//If ls_value = '' or (FileLength(ls_value) <> ll_file_size[i]) Then
			 	If ls_value = '' or (Not FileExists(ls_value)) or (lnv_filesrv.of_getfileversion( ls_value ) <> ls_file_version[i])  Then
				//If ls_value = '' or (Not FileExists(ls_value)) or (FileLength(ls_value) <> ll_file_size[i]) Then
					//ls_return += 'The image plugin "'+ls_ocx_names[i]+'" don~'t register.~r~n'
					ls_return += ls_ocx_names[i]+', '
				End If				
			Next
			ls_return = Mid(ls_return,1,Len(ls_return) - 2)
			If as_ocx_name = ls_ocx_names[Upperbound(ls_ocx_names)] or as_ocx_name = '' Then 
				ib_ocx_checked[ai_control] = True
			End If
		case 5 //"empop3.dll"
			ls_Key = "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{10696DE0-CF47-4ad4-B1AE-CC1F4021D65B}\InprocServer32"
			lnv_Appeon.of_registryget(ls_Key,"", RegString!, ls_Value)

			ll_file_size[1] = 155734  //Added By Ken 09/23/2011. 
			ls_file_version[1] = '6, 5, 0, 6'  //Added By Ken 09/27/2011. 
			If ls_value = '' or (Not FileExists(ls_value)) Then
				ls_return =  "empop3.dll"
			End If
			
			If (FileLength(ls_value) <> ll_file_size[1]) or (lnv_filesrv.of_getfileversion( ls_value ) <> ls_file_version[1]) Then
				ls_return =   "empop3.dll"
			End If

			If ls_value = '' or Not This.of_check_instance_ocx('EasyMail.POP3') Then
				ls_return = "empop3.dll"
			End If		
			ib_ocx_checked[ai_control] = True			

		case 6 //"emmsg.dll"
			ls_Key = "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{038DF64C-4207-4a93-B1A6-8967F440E462}\InprocServer32"
			lnv_Appeon.of_registryget(ls_Key,"", RegString!, ls_Value)
			
			If ls_value = '' Then
			//If ls_value = '' or Not This.of_check_instance_ocx('EasyMail.Message') Then
				//ls_return = 'The Email plugin "emsmtp.dll" don~'t register.'
				ls_return = "emmsg.dll"
			End If		
			ib_ocx_checked[ai_control] = True	
		case 7 //Sertifi Soap
			ls_ocx_names[1] = "MSSOAP30.dll"
			ls_ocx_names[2] = "msxml4.dll"
			ls_ocx_names[3] = "WHSC30.dll"
			ls_ocx_names[4] = "WINHTTP5.dll" 
			ls_ocx_names[5] = "WISC30.dll" 

			ls_Key_OCXs[1] = "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{05AE7FB3-C4E9-4F79-A5C3-DAB525E31F2C}\InprocServer32"
			ls_Key_OCXs[2] = "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{7c6e29bc-8b8b-4c3d-859e-af6cd158be0f}\InProcServer32"
			ls_Key_OCXs[3] = "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{0AF40C55-9257-11D5-87EA-00B0D0BE6479}\InprocServer32"
			ls_Key_OCXs[4] = "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{91e2ead3-ab7e-4d5c-88de-f7fa382172bc}\InProcServer32"
			ls_Key_OCXs[5] = "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{0AF40C54-9257-11D5-87EA-00B0D0BE6479}\InprocServer32"
			
			ll_file_size[1] = 437760
			ll_file_size[2] = 1230336 //-1
			ll_file_size[3] = 91648
			ll_file_size[4] = 290816 //-1
			ll_file_size[5] = 92160
			
			For i = 1 To Upperbound(ls_Key_OCXs[])	
				If as_ocx_name <> '' and lower(as_ocx_name) <> lower(ls_ocx_names[i]) Then Continue //Only check special OCX
			
				//Check All OCXs
				ls_Value = ''	
				Choose Case i
					Case 2,4 //"msxml4.dll","WINHTTP5.dll" 
						lnv_Appeon.of_registryget(ls_Key_OCXs[i],"", RegExpandString!, ls_Value)
						//Need change the ENV Variables to physic path. e.g. %systemdrive% -> c:\
						inv_string.of_replace_env_var(ls_Value)
					Case Else
						lnv_Appeon.of_registryget(ls_Key_OCXs[i],"", RegString!, ls_Value)
				End Choose
				
				If ls_value = '' or (Not FileExists(ls_value)) or (FileLength(ls_value) <> ll_file_size[i]) Then
					ls_return += ls_ocx_names[i]+', '
				End If				
			Next
			ls_return = Mid(ls_return,1,Len(ls_return) - 2)
			If as_ocx_name = ls_ocx_names[Upperbound(ls_ocx_names)] or as_ocx_name = '' Then 
				ib_ocx_checked[ai_control] = True
			End If	
		Case 8 //Email SSL emssl.dll //Added By Ken 09/23/2011. 
			ls_Key = "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{54F83BAD-2B71-4578-80D2-7C40ED3D47FE}\InprocServer32"
			lnv_Appeon.of_registryget(ls_Key,"", RegString!, ls_Value)

			ll_file_size[1] = 86091 
			ls_file_version[1] = '6, 5, 0, 4' 
			If ls_value = '' or (Not FileExists(ls_value)) Then
				ls_return = "emssl.dll"
			End If
			
			If FileLength(ls_value) <> ll_file_size[1]  or lnv_filesrv.of_getfileversion( ls_value ) <> ls_file_version[1] Then
				ls_return =  "emssl.dll"
			End If
			ib_ocx_checked[ai_control] = True		
		Case Else
			ls_return = ''
	end choose
End If

If ab_show_error and ls_return <> '' Then 
	
	of_show_message(is_module_name[ai_control],ls_return)
End If

is_check_result[ai_control] = ls_return
If isvalid(lv_versionInfo) Then Destroy lv_versionInfo
If isvalid(lnv_filesrv) Then Destroy lnv_filesrv

Return ls_return
*/
end function

public subroutine of_reset_check_flag (integer ai_ocx_num);//////////////////////////////////////////////////////////////////////
// $<function>n_cst_reg_controlof_reset_check_flag()
// $<arguments>
//		value	integer	ai_ocx_num	0: all OCXs.	
// $<returns> (none)
// $<description>
// $<description> Reset All OCX's check status
//////////////////////////////////////////////////////////////////////
// $<add> 11.07.2008 by Ken.Guo
//////////////////////////////////////////////////////////////////////

Integer i
If ai_ocx_num = 0 Then
	For i = 1 To UpperBound(ib_ocx_checked[])
		ib_ocx_checked[i] = False
	Next
Else
	ib_ocx_checked[ai_ocx_num] = False
End If
end subroutine

public function string of_get_dll_dir ();If AppeonGetClientType() = 'PB' Then
	Return Gs_Current_Directory + ''
Else
	Return AppeonGetCacheDir() + 'PlugIn'
End If

end function

public function string of_check_ocx (integer ai_control, string as_ocx_name, boolean ab_show_error, ref string as_filepath);//////////////////////////////////////////////////////////////////////
// $<function>n_cst_reg_control::of_check_ocx()
// $<arguments>
//		value	integer	as_control	
//							1: Office OCX; 
//							2: Email OCX;
//							3: New Image OCXs; 
//							4: Imaging360 OCXs	
//							5: empop3 OCX;
//							6: emmsg OCX;
//							7: Sertifi Electronic Signature;
//							8: Email SSL
//		value string 	as_ocx_name . if it is '', check all OCXs of this type control.
//		value boolean	ab_show_error
//		ref string as_filepath  
// $<returns> string
// $<description> Check OCX. If it is unusable, then return error string.  get ocx/dll file path.
// $<description>
//////////////////////////////////////////////////////////////////////
// $<add> 11.04.2008 by Ken.Guo
//////////////////////////////////////////////////////////////////////

n_cst_AppeonDll	lnv_Appeon
Integer i
String ls_module_name
String ls_key
String ls_Value
String ls_ocx_names[]  //For multi-OCXs
String ls_Key_OCXs[]   //For multi-OCXs
String ls_return
String ls_prod_id[] 
Long ll_file_size[],ll_cur_file_size, ll_file_sign_size[], ll_dll_size[], ll_dll_sign_size[]
String ls_file_version[]
String ls_version,	ls_PluginDir, ls_path, ls_copydll[],	ls_cur_file_version,ls_cur_file_size, ls_cur_file_sign_size
Integer 	li_FileNum, li_num	//Added By Mark Lee 05/23/12

n_versioninfo lv_versionInfo
lv_versionInfo = Create n_versioninfo

n_cst_filesrv lnv_filesrv //Added By Ken.Guo 09/27/2011. 
lnv_filesrv = Create n_cst_filesrv

If ib_ocx_checked[ai_control] Then 
		ls_return = is_check_result[ai_control]
Else
	//Check OCX
	choose case ai_control
		case 1 //"officecontrol.ocx"
			if of_ignoreocx_check("officecontrol.ocx") then  //Added By Jay Chen 07-17-2014
				ls_return = ''
				ib_ocx_checked[ai_control] = True
			else
				//Added By Mark Lee 05/23/12
//				ls_Key = "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{D267E82F-8649-41ee-9121-050130B1715F}\InprocServer32"
				ls_Key = "HKEY_CLASSES_ROOT\CLSID\{D267E82F-8649-41ee-9121-050130B1715F}\InprocServer32"
				lnv_Appeon.of_registryget(ls_Key,"", RegString!, ls_Value)

				ll_file_size[1] = 476672  //Version 4.0 
				ll_file_size[2] = 574976  //Version 5.0
				ll_file_size[3] = 1559176   //Version 5.0.2.4		//Added By Mark Lee 12/23/2013
				//Added By Mark Lee 05/28/12
				ll_file_sign_size[1] = 582248	
				ll_file_sign_size[2] = 1558544		//Added By Mark Lee 12/23/2013 version 5.0.2.4
				//If ls_value = '' or (Not FileExists(ls_value))  or (Not This.of_check_instance_ocx('OFFICEINIE.OfficeControlPB')) Then //Don't use of_check_instance_ocx to check it, otherwise it will lock the file.
				If ls_value = '' or (Not FileExists(ls_value)) Then
					ls_return = "officecontrol.ocx"
				End If
			
//				If gs_imageview_version = '5.0' Then
//				ll_cur_file_size = ll_file_size[2]
//				Else
//					ll_cur_file_size = ll_file_size[1]
//				End If
				ls_cur_file_version	= ' 5.0.0.2; 5.0.2.4; 5. 0. 0. 2; 5. 0. 2. 4'
				gnv_string.of_arraytostring( ll_file_size, ';', ls_cur_file_size)
				gnv_string.of_arraytostring( ll_file_sign_size, ';', ls_cur_file_sign_size)
				ls_version = lnv_filesrv.of_getfileversion( ls_value ) 	
				ls_version = gnv_string.of_globalreplace(ls_version, ',', '.')
				if Pos(ls_cur_file_version, ls_version ) > 0 or pos(ls_cur_file_size, string(FileLength(ls_value)) ) > 0  or  &
					 pos(ls_cur_file_sign_size, string(FileLength(ls_value)) ) > 0  	then
				else
					ls_return = "officecontrol.ocx"
				End If
				//Begin - Added By Mark Lee 12/23/2013
				IF ( isnull(ls_return ) or trim(ls_return) = '' )  Then 
					ls_PluginDir = AppeonGetCacheDir() + '\PlugIn\'
					ls_path =  left(ls_value,LastPos(ls_value,'\'))
					ls_copydll[1] =  'ntkocmnres.dll' 
					ls_copydll[2] =  'ntkoHtPkcs11.dll' 					
					ll_dll_size[1]	=	68224
					ll_dll_size[2]	= 561152
					ll_dll_sign_size[1] = 67600
					ll_dll_sign_size[2] = 567312 
					is_officecontrol_loss_files = '' //Added By Ken.Guo 2016-03-15
					For li_num = 1 to Upperbound(ls_copydll)
						IF ( Not FileExists(ls_path+ls_copydll[li_num]) ) Or (FileLength(ls_path+ls_copydll[li_num]) <> ll_dll_size[li_num] and FileLength(ls_path+ls_copydll[li_num]) <> ll_dll_sign_size[li_num]  ) Then
							If of_filecopy_exists(ls_PluginDir+ls_copydll[li_num] , ls_path +ls_copydll[li_num], True) < 0 Then
								//Added By Ken.Guo 2016-03-15
								If is_officecontrol_loss_files = '' Then
									is_officecontrol_loss_files = ls_copydll[li_num]
								Else
									is_officecontrol_loss_files = is_officecontrol_loss_files + ', ' + ls_copydll[li_num]
								End If
								
							End If
						End If
					Next			
				end if 
				//End - Added By Mark Lee 12/23/2013
				ib_ocx_checked[ai_control] = True
			end if
		case 2 //"emsmtp.dll"
			if of_ignoreocx_check("emsmtp.dll") then //Added By Jay Chen 07-17-2014
				ls_return = ''
				ib_ocx_checked[ai_control] = True
			else
				//Added By Mark Lee 05/23/12
//				ls_Key = "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\TypeLib\{68AC0D5D-0424-11D5-822F-00C04F6BA8D9}\6.5\0\win32"
				ls_Key = "HKEY_CLASSES_ROOT\CLSID\{DAFA4BF6-C807-463c-8745-C9E0C90CF84F}\InprocServer32"
			
				lnv_Appeon.of_registryget(ls_Key,"", RegString!, ls_Value)

				If ls_value = '' or Not This.of_check_instance_ocx('EasyMail.SMTP.6.5') Then
					//ls_return = 'The Email plugin "emsmtp.dll" don~'t register.'
					ls_return = "emsmtp.dll"
				End If		
				//Added By Ken.Guo 2016-03-16
				If Not FileExists(ls_value) Then
					ls_return = "emsmtp.dll"
				End If

				ib_ocx_checked[ai_control] = True
			end if
		case 3 //Imaging 360 OCXs: "imgedit.ocx";"imgscan.ocx";"imgadmin.ocx";"imgocr.ocx";"imgthumb.ocx"
			If gi_imageocx <> 1 Then 
				ls_return = ''			
			Else
				ls_ocx_names[1] = "imgedit.ocx"
				ls_ocx_names[2] = "imgscan.ocx"
				ls_ocx_names[3] = "imgadmin.ocx"
				ls_ocx_names[4] = "imgocr.ocx"
				ls_ocx_names[5] = "imgthumb.ocx"
				ls_Key_OCXs[1]	= "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{6D940280-9F11-11CE-83FD-02608C3EC08A}\InprocServer32"
				ls_Key_OCXs[2] = "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{84926CA0-2941-101C-816F-0E6013114B7F}\InprocServer32"
				ls_Key_OCXs[3] = "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{009541A0-3B81-101C-92F3-040224009C02}\InprocServer32"
				ls_Key_OCXs[4] = "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{8FC248E3-D4D9-11CF-8727-0020AFA5DCA7}\InprocServer32"
				ls_Key_OCXs[5] = "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{E1A6B8A0-3603-101C-AC6E-040224009C02}\InprocServer32"		
				ls_prod_id[1] = "Imaging.EditCtrl.1"
				ls_prod_id[2] = "Imaging.ScanCtrl.1"
				ls_prod_id[3] = "Imaging.AdminCtrl.1"
				ls_prod_id[4] = "Imaging.OcrCtrl.1"
				ls_prod_id[5] = "Imaging.ThumbnailCtrl.1"
				
				For i = 1 To Upperbound(ls_Key_OCXs[])	
					If as_ocx_name <> '' and lower(as_ocx_name) <> lower(ls_ocx_names[i]) Then Continue //Only check special OCX
					
					if of_ignoreocx_check(ls_ocx_names[i]) then //Added By Jay Chen 07-17-2014
						ls_return += ''+', '
					else
						//Check All OCXs
						ls_Value = ''	
						lnv_Appeon.of_registryget(ls_Key_OCXs[i],"", RegString!, ls_Value)
						/*
						If FileExists(ls_Value) Then 
							If This.of_check_instance_ocx(ls_prod_id[i]) Then 
								Continue //Check Pass
							Else
								ls_return += 'Failed to invoke the image plugin "'+ls_ocx_names[i]+'".~r~n'
							End If
						Else			
							//If unusable
							If ls_Value <> '' Then
								ls_return += 'The image plugin "' + ls_Value + '" don~'t exist.~r~n'
							Else
								ls_return += 'The image plugin "'+ls_ocx_names[i]+'" don~'t register.~r~n'
							End If
						End If
						*/
						If ls_value = '' or Not This.of_check_instance_ocx(ls_prod_id[i]) Then
							//ls_return += 'The image plugin "'+ls_ocx_names[i]+'" don~'t register.~r~n'
							ls_return += ls_ocx_names[i]+', '
						End If		
					end if
				Next
				ls_return = Mid(ls_return,1,Len(ls_return) - 2)
				If as_ocx_name = ls_ocx_names[Upperbound(ls_ocx_names)] or as_ocx_name = '' Then 
					ib_ocx_checked[ai_control] = True
				End If
			End If
		case 4 //New Image OCXs: "imageviewer2.ocx";"imagethumbnailcp.ocx";"scanner.ocx"
			//Always need check it, although gi_imageocx = 1
			ls_ocx_names[1] = "imageviewer2.ocx"
			ls_ocx_names[2] = "imagethumbnailcp.ocx"
			ls_ocx_names[3] = "scanner.ocx"
			//ls_Key_OCXs[1] = "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\TypeLib\{C9460280-3EED-11D0-A647-00A0C91EF7B9}\1.0\0\win32"
			//ls_Key_OCXs[2] = "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\TypeLib\{51F37CDE-2D78-495D-8B30-D57ABDA60369}\1.0\0\win32"
			//Added By Mark Lee 05/23/12
//			ls_Key_OCXs[1] = "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{E589DA78-AD4C-4FC5-B6B9-9E47B110679E}\InprocServer32"
//			ls_Key_OCXs[2] = "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{797D023E-E647-45DD-8B81-2F574238FE8F}\InprocServer32"
//			ls_Key_OCXs[3] = "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{20666F83-3F1D-4211-9DBF-2FF783A18E18}\InprocServer32"
			ls_Key_OCXs[1] = "HKEY_CLASSES_ROOT\TypeLib\{C9460280-3EED-11D0-A647-00A0C91EF7B9}\1.0\0\win32"
			ls_Key_OCXs[2] = "HKEY_CLASSES_ROOT\TypeLib\{51F37CDE-2D78-495D-8B30-D57ABDA60369}\1.0\0\win32"
			ls_Key_OCXs[3] = "HKEY_CLASSES_ROOT\CLSID\{20666F83-3F1D-4211-9DBF-2FF783A18E18}\InprocServer32"
			
			ls_prod_id[1] = "SCRIBBLE.ScribbleCtrl.1"
			ls_prod_id[2] = "IMAGETHUMBNAILCP.ImageThumbnailCPCtrl.1"
			ls_prod_id[3] = "SCANNER.ScannerCtrl.1"

			ll_file_size[1] = 2629632 //7.5 //2613248 -6.8 //2609152 -6.5 //2592768(6.0) 2584576(5.0) //Different ImageView Version, use file size for discern. 
			ll_file_size[2] = 1798144//4.6 //1794048 (4.0)
			ll_file_size[3] = 180224	
			
			ls_file_version[1] = '7.5.0.4'  //Check file version replace file size.		//Modified By Mark Lee 11/05/2013 update for cab 
			ls_file_version[2] = '4, 6, 0, 0'
			ls_file_version[3] = '3, 8, 0, 1'			
			//Added By Mark Lee 05/28/12
			ll_file_sign_size[1] = 2635792 		//Added By Mark Lee 12/23/2013
			ll_file_sign_size[2] = 1805416 
			ll_file_sign_size[3] = 187496
			
			For i = 1 To Upperbound(ls_Key_OCXs[])	
				If as_ocx_name <> '' and lower(as_ocx_name) <> lower(ls_ocx_names[i]) Then Continue //Only check special OCX
				if of_ignoreocx_check(ls_ocx_names[i]) then //Added By Jay Chen 07-17-2014
					//ls_return += ''+', ' //Commented By Ken.Guo 2016-03-16
				else
					//Check All OCXs
					ls_Value = ''	
					lnv_Appeon.of_registryget(ls_Key_OCXs[i],"", RegString!, ls_Value)
					ls_version = lnv_filesrv.of_getfileversion( ls_value ) 				//Added By Mark Lee 08/09/2013
					/*
					If FileExists(ls_Value) Then 
						Continue
						/* Error to call ConnectToNewObject()
						If This.of_check_instance_ocx(ls_prod_id[i]) Then 
							Continue //Check Pass
						Else
							ls_return += 'Failed to invoke the new image plugin "'+ls_ocx_names[i]+'".~r~n'
						End If
						*/
					Else		
						//If unusable
						If ls_Value <> '' Then
							ls_return += 'The new image plugin "' + ls_Value + '" don~'t exist.~r~n'
						Else
							ls_return += 'The new image plugin "'+ls_ocx_names[i]+'" don~'t register.~r~n'
						End If
					End If
					*/
					//If do not regist or regist different version
					//If ls_value = '' or (FileLength(ls_value) <> ll_file_size[i]) Then
					//Added By Mark Lee 05/24/12
					If ls_value = '' or (Not FileExists(ls_value)) or (lnv_filesrv.of_getfileversion( ls_value ) <> ls_file_version[i]) or (FileLength(ls_value) <> ll_file_size[i] and FileLength(ls_value) <> ll_file_sign_size[i] )   Then
					//If ls_value = '' or (Not FileExists(ls_value)) or (FileLength(ls_value) <> ll_file_size[i]) Then
						//ls_return += 'The image plugin "'+ls_ocx_names[i]+'" don~'t register.~r~n'
						//Added By Mark Lee 08/09/2013 //Modified By Mark Lee 07/08/2013 [7.5.0.2 = (2629632,2635792) ] \ [7.5.0.1 = (2629632,2637424)]
						IF i = 1 and FileExists(ls_value)  &
						and (Left(ls_version, LastPos(ls_version,'.') - 1 ) = '7.5.0' Or Left(ls_version, LastPos(ls_version,'.') - 1 ) = '6.8.0' ) then
							//
						else
							ls_return += ls_ocx_names[i]+', '
						End If
					End If				
				
					//Begin - Added By Mark Lee 05/28/12 move the same directory if don't exists in current directory
					is_image_loss_files = '' //Added By Ken.Guo 2016-03-15
					IF i = 1 and ( isnull(ls_return ) or trim(ls_return) = '' )  Then
						ls_PluginDir = AppeonGetCacheDir() + '\PlugIn\'
						ls_path =  left(ls_value,LastPos(ls_value,'\'))
						ls_copydll[1] =  'viscomocr.dll' 
						ls_copydll[2] =  'viscompsd.dll' 
						ls_copydll[3] =  'TIFF2PDF.dll' 
						ls_copydll[4] =  'viscomdocx.dll' 
						//ls_copydll[5] =  'msvcrt.dll' 
						ls_copydll[5] =  'viscompdf.dll' 
					
						ll_dll_size[1]	=	1105920
						ll_dll_size[2]	= 282624
						ll_dll_size[3]	= 1314816
						ll_dll_size[4]	= 792064 
					//	ll_dll_size[5]	= 290869
						ll_dll_size[5]	=  520192
						ll_dll_sign_size[1] = 1113192
						ll_dll_sign_size[2] = 289896 
						ll_dll_sign_size[3] = 1322088
						ll_dll_sign_size[4] = 799336 
						//ll_dll_sign_size[5] = 298144
						ll_dll_sign_size[5] = 527464
						For li_num = 1 to Upperbound(ls_copydll)
							IF ( Not FileExists(ls_path+ls_copydll[li_num]) ) Or (FileLength(ls_path+ls_copydll[li_num]) <> ll_dll_size[li_num] and FileLength(ls_path+ls_copydll[li_num]) <> ll_dll_sign_size[li_num]  ) Then
								If of_filecopy_exists(ls_PluginDir+ls_copydll[li_num] , ls_path +ls_copydll[li_num], True) < 0 Then
									//Added By Ken.Guo 2016-03-15
									If is_image_loss_files = '' Then
										is_image_loss_files = ls_copydll[li_num]
									Else
										is_image_loss_files = is_image_loss_files + ', ' + ls_copydll[li_num]
									End If
								End If
							End If
						Next			
					ElseIF i = 3  and ( isnull(ls_return ) or trim(ls_return) = '' )  Then
						ls_PluginDir = AppeonGetCacheDir() + '\PlugIn\'
						ls_path =  left(ls_value,LastPos(ls_value,'\'))
						ls_copydll[1] =  'viscompdf.dll' 
						ll_dll_size[1]	=  520192
						ll_dll_sign_size[1] = 527464
						IF ( Not FileExists(ls_path+ls_copydll[1]) ) Or (FileLength(ls_path+ls_copydll[1]) <> ll_dll_size[1] and FileLength(ls_path+ls_copydll[1]) <> ll_dll_sign_size[1]  ) Then
							If of_filecopy_exists(ls_PluginDir+ls_copydll[1] , ls_path +ls_copydll[1], True) < 0 Then
									//Added By Ken.Guo 2016-03-15
									If is_image_loss_files = '' Then
										is_image_loss_files = ls_copydll[1]
									Else
										is_image_loss_files = is_image_loss_files + ', ' + ls_copydll[1]
									End If
							End If
						End If
					End If 
					//End - Added By Mark Lee 05/28/12
				end if
			Next
			ls_return = Mid(ls_return,1,Len(ls_return) - 2)
			If as_ocx_name = ls_ocx_names[Upperbound(ls_ocx_names)] or as_ocx_name = '' Then 
				ib_ocx_checked[ai_control] = True
			End If
		case 5 //"empop3.dll"
			if of_ignoreocx_check("empop3.dll") then //Added By Jay Chen 07-17-2014
				ls_return = ''
				ib_ocx_checked[ai_control] = True
			else
				//Added By Mark Lee 05/23/12
//				ls_Key = "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{10696DE0-CF47-4ad4-B1AE-CC1F4021D65B}\InprocServer32"
				ls_Key = "HKEY_CLASSES_ROOT\CLSID\{10696DE0-CF47-4ad4-B1AE-CC1F4021D65B}\InprocServer32"
			
				lnv_Appeon.of_registryget(ls_Key,"", RegString!, ls_Value)

				//Added By Mark Lee 05/23/12
				If isnull(ls_Value) or trim(ls_Value) = '' Then
					ls_Key = "HKEY_CLASSES_ROOT\CLSID\{66CD7327-BA02-4152-9C9B-1AA876B5293A}\InprocServer32"
					lnv_Appeon.of_registryget(ls_Key,"", RegString!, ls_Value)
				End If 
			
				ll_file_size[1] = 155734  //Added By Ken 09/23/2011. 
				//Added By Mark Lee 05/28/12
				ll_file_sign_size[1] = 163008 
				ls_file_version[1] = '6, 5, 0, 6'  //Added By Ken 09/27/2011. 
				If ls_value = '' or (Not FileExists(ls_value)) Then
					ls_return =  "empop3.dll"
				End If
				//Added By Mark Lee 05/25/12
//				If (FileLength(ls_value) <> ll_file_size[1]) or (lnv_filesrv.of_getfileversion( ls_value ) <> ls_file_version[1]) Then
				If (FileLength(ls_value) <> ll_file_size[1] and FileLength(ls_value) <> ll_file_sign_size[1] ) or (lnv_filesrv.of_getfileversion( ls_value ) <> ls_file_version[1]) Then
					ls_return =   "empop3.dll"
				End If

				If ls_value = '' or Not This.of_check_instance_ocx('EasyMail.POP3') Then
					ls_return = "empop3.dll"
				End If		
				ib_ocx_checked[ai_control] = True			
			end if

		case 6 //"emmsg.dll"
			if of_ignoreocx_check("emmsg.dll") then //Added By Jay Chen 07-17-2014
				ls_return = ''
				ib_ocx_checked[ai_control] = True
			else
				//Added By Mark Lee 05/23/12
//				ls_Key = "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{038DF64C-4207-4a93-B1A6-8967F440E462}\InprocServer32"
				ls_Key = "HKEY_CLASSES_ROOT\CLSID\{0064776F-D7AB-43ed-A93B-4DFF1B8D5DEA}\InprocServer32"
				lnv_Appeon.of_registryget(ls_Key,"", RegString!, ls_Value)
			
				If ls_value = '' Then
				//If ls_value = '' or Not This.of_check_instance_ocx('EasyMail.Message') Then
					//ls_return = 'The Email plugin "emsmtp.dll" don~'t register.'
					ls_return = "emmsg.dll"
				End If		
				ib_ocx_checked[ai_control] = True
			end if
//Deleted by Ken.Guo 08/13/212. User should install SOAPSDK.exe			
//		case 7 //Sertifi Soap
//			ls_ocx_names[1] = "MSSOAP30.dll"
//			ls_ocx_names[2] = "msxml4.dll"
//			ls_ocx_names[3] = "WHSC30.dll"
//			ls_ocx_names[4] = "WINHTTP5.dll" 
//			ls_ocx_names[5] = "WISC30.dll" 
//			
//			//Added By Mark Lee 05/23/12
////			ls_Key_OCXs[1] = "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{05AE7FB3-C4E9-4F79-A5C3-DAB525E31F2C}\InprocServer32"
////			ls_Key_OCXs[2] = "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{7c6e29bc-8b8b-4c3d-859e-af6cd158be0f}\InProcServer32"
////			ls_Key_OCXs[3] = "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{0AF40C55-9257-11D5-87EA-00B0D0BE6479}\InprocServer32"
////			ls_Key_OCXs[4] = "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{91e2ead3-ab7e-4d5c-88de-f7fa382172bc}\InProcServer32"
////			ls_Key_OCXs[5] = "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{0AF40C54-9257-11D5-87EA-00B0D0BE6479}\InprocServer32"
//			ls_Key_OCXs[1] = "HKEY_CLASSES_ROOT\CLSID\{05AE7FB3-C4E9-4F79-A5C3-DAB525E31F2C}\InprocServer32"
//			ls_Key_OCXs[2] = "HKEY_CLASSES_ROOT\CLSID\{00b7e0ab-817a-44ad-a04b-d1148d524136}\InProcServer32"				//****
//			ls_Key_OCXs[3] = "HKEY_CLASSES_ROOT\CLSID\{0AF40C55-9257-11D5-87EA-00B0D0BE6479}\InprocServer32"
//			ls_Key_OCXs[4] = "HKEY_CLASSES_ROOT\CLSID\{91e2ead3-ab7e-4d5c-88de-f7fa382172bc}\InProcServer32"				//****																
//			ls_Key_OCXs[5] = "HKEY_CLASSES_ROOT\CLSID\{0AF40C54-9257-11D5-87EA-00B0D0BE6479}\InprocServer32"
//			
//			ll_file_size[1] = 437760
//			ll_file_size[2] = 1230336 //-1
//			ll_file_size[3] = 91648
//			ll_file_size[4] = 290816 //-1	290,816
//			ll_file_size[5] = 92160
//			//Added By Mark Lee 05/28/12
//			ll_file_sign_size[1] = 445032 
//			ll_file_sign_size[2] = 1237608  
//			ll_file_sign_size[3] = 98920 
//			ll_file_sign_size[4] = 298088 
//			ll_file_sign_size[5] = 99432  			
//			
//			For i = 1 To Upperbound(ls_Key_OCXs[])	
//				If as_ocx_name <> '' and lower(as_ocx_name) <> lower(ls_ocx_names[i]) Then Continue //Only check special OCX
//			
//				//Check All OCXs
//				ls_Value = ''	
//				Choose Case i
//					Case 2,4 //"msxml4.dll","WINHTTP5.dll" 
//						lnv_Appeon.of_registryget(ls_Key_OCXs[i],"", RegExpandString!, ls_Value)
//						//Need change the ENV Variables to physic path. e.g. %systemdrive% -> c:\
//						inv_string.of_replace_env_var(ls_Value)
//					Case Else
//						lnv_Appeon.of_registryget(ls_Key_OCXs[i],"", RegString!, ls_Value)
//				End Choose
//				//Added By Mark Lee 05/25/12
////				If ls_value = '' or (Not FileExists(ls_value)) or (FileLength(ls_value) <> ll_file_size[i]) Then
//				If ls_value = '' or (Not FileExists(ls_value)) or (FileLength(ls_value) <> ll_file_size[i] and FileLength(ls_value) <> ll_file_sign_size[i]) Then
//					ls_return += ls_ocx_names[i]+', '
//				End If				
//			Next
//			ls_return = Mid(ls_return,1,Len(ls_return) - 2)
//			If as_ocx_name = ls_ocx_names[Upperbound(ls_ocx_names)] or as_ocx_name = '' Then 
//				ib_ocx_checked[ai_control] = True
//			End If	
		Case 8 //Email SSL emssl.dll //Added By Ken 09/23/2011. 
			if of_ignoreocx_check("emssl.dll") then //Added By Jay Chen 07-17-2014
				ls_return = ''
				ib_ocx_checked[ai_control] = True
			else
				//Added By Mark Lee 05/23/12
//				ls_Key = "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{54F83BAD-2B71-4578-80D2-7C40ED3D47FE}\InprocServer32"
				ls_Key = "HKEY_CLASSES_ROOT\CLSID\{54F83BAD-2B71-4578-80D2-7C40ED3D47FE}\InprocServer32"
				lnv_Appeon.of_registryget(ls_Key,"", RegString!, ls_Value)
	
				ll_file_size[1] = 86091 
				//Added By Mark Lee 05/28/12
				ll_file_sign_size[1] = 93368 
			
				ls_file_version[1] = '6, 5, 0, 4' 
				If ls_value = '' or (Not FileExists(ls_value)) Then
					ls_return = "emssl.dll"
				End If
				//Added By Mark Lee 05/25/12
//				If FileLength(ls_value) <> ll_file_size[1]  or lnv_filesrv.of_getfileversion( ls_value ) <> ls_file_version[1] Then
				If ( FileLength(ls_value) <> ll_file_size[1] and FileLength(ls_value) <> ll_file_sign_size[1] ) or lnv_filesrv.of_getfileversion( ls_value ) <> ls_file_version[1] Then
					ls_return =  "emssl.dll"
				End If
				ib_ocx_checked[ai_control] = True	
			end if
		Case 9	//imap4  added by gavins 20121122
			if of_ignoreocx_check("emimap4.dll") then //Added By Jay Chen 07-17-2014
				ls_return = ''
			else
				ls_Key = "HKEY_CLASSES_ROOT\CLSID\{001A0031-1C07-4f03-9C9E-6E78DEC830F7}\InprocServer32"
				lnv_Appeon.of_registryget(ls_Key,"", RegString!, ls_Value)

				ll_file_size[1] = 294993 
				ll_file_sign_size[1] =302792		//Added By Mark Lee 12/12/2012
			
				ls_file_version[1] = '6, 5, 0, 6' 
				If ls_value = '' or (Not FileExists(ls_value)) Then
					ls_return = "emimap4.dll"
				End If

				If ( FileLength(ls_value) <> ll_file_size[1] and FileLength(ls_value) <> ll_file_sign_size[1] ) or lnv_filesrv.of_getfileversion( ls_value ) <> ls_file_version[1] Then
					ls_return =  "emimap4.dll"
				End If
			end if
			ib_ocx_checked[ai_control] = True	
			
		Case 10 //EAGetMailObj.dll		//Added By Mark Lee 07/08/2013
			if of_ignoreocx_check("EAGetMailObj.dll") then //Added By Jay Chen 07-17-2014
				ls_return = ''
			else
				ls_Key = "HKEY_CLASSES_ROOT\CLSID\{029033B3-0CFF-452E-8832-8101FDE8D0B4}\InprocServer32"
				lnv_Appeon.of_registryget(ls_Key,"", RegString!, ls_Value)
			
				ll_file_size[1] = 670208						//623616 
				ll_file_sign_size[1] =	676368				//629776	
			
				ls_file_version[1] = '4.0.0.9' 				//'4.0.0.5' 
				If ls_value = '' or (Not FileExists(ls_value)) Then
					ls_return = "EAGetMailObj.dll"
				End If

	//Added By Mark Lee 11/04/2013
	//			If ( FileLength(ls_value) <> ll_file_size[1] and FileLength(ls_value) <> ll_file_sign_size[1] ) or lnv_filesrv.of_getfileversion( ls_value ) <> ls_file_version[1] Then
	//				ls_return =  "EAGetMailObj.dll"
	//			End If
				If ( FileLength(ls_value) <> ll_file_size[1] and FileLength(ls_value) <> ll_file_sign_size[1] ) or lnv_filesrv.of_getfileversion( ls_value ) <> ls_file_version[1] Then
					If ( FileLength(ls_value) <> 623616 and FileLength(ls_value) <> 629776 ) or lnv_filesrv.of_getfileversion( ls_value ) <>  '4.0.0.5'  Then
						ls_return =  "EAGetMailObj.dll"
					end if 
				End If
			end if
			ib_ocx_checked[ai_control] = True	
		Case 11 //EASendMailObj.dll		//Added By Mark Lee 07/08/2013
			if of_ignoreocx_check("EASendMailObj.dll") then //Added By Jay Chen 07-17-2014
				ls_return = ''
			else
				ls_Key = "HKEY_CLASSES_ROOT\CLSID\{036C2F8C-8D3C-4F4B-9B36-3B6F1D29C0B4}\InprocServer32"
				lnv_Appeon.of_registryget(ls_Key,"", RegString!, ls_Value)
			
				ll_file_size[1] = 504320 
				ll_file_sign_size[1] =510480		
			
				ls_file_version[1] = '6.0.0.1' 
				If ls_value = '' or (Not FileExists(ls_value)) Then
					ls_return = "EASendMailObj.dll"
				End If

				If ( FileLength(ls_value) <> ll_file_size[1] and FileLength(ls_value) <> ll_file_sign_size[1] ) or lnv_filesrv.of_getfileversion( ls_value ) <> ls_file_version[1] Then
					ls_return =  "EASendMailObj.dll"
				End If
			end if
			ib_ocx_checked[ai_control] = True	
		Case Else
			ls_return = ''			
	end choose
End If

If ab_show_error and ls_return <> '' Then 
	of_show_message(is_module_name[ai_control],ls_return)
End If

as_filepath = ls_value //Added By Ken.Guo 10/28/2011. 

is_check_result[ai_control] = ls_return
If isvalid(lv_versionInfo) Then Destroy lv_versionInfo
If isvalid(lnv_filesrv) Then Destroy lnv_filesrv

Return ls_return

end function

public function integer of_filecopy_exists (string as_source, string as_target, boolean abln_replace);//====================================================================
// Function: of_filecopy_exists
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//                as_source
//                as_target
//                abln_replace
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	Mark Lee		Date: 05/28/12
//--------------------------------------------------------------------
//	Copyright (c) 2008-2012 Contract Logix,Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
Integer	li_FileNum

IF FileExists(as_source) = True Then
//	IF Not(FileExists(as_target) = True ) Then
		li_FileNum = FileCopy (as_source,  as_target, abln_replace)
		IF li_FileNum = 1 Then 
			return 1
		ElseIf  li_FileNum = -1 Then 
			//messagebox('Error Source file', 'Failed to copy the file ' +as_source + ' to '+as_target+'. Please make sure the path exists and you have FULL permissions to it ' )
			gnv_debug.of_output(True, 'Failed to copy the file ' +as_source + ' to '+as_target+'. Please make sure the path exists and you have FULL permissions to it. We suggest that you manually install ContractLogix_WebClientActiveX to resolve this issue.' )
			return - 1
		ElseIf  li_FileNum = -2 Then 
			//messagebox('Error Targret file', 'Failed to copy the file ' +as_source + ' to '+as_target+'. Please make sure the path exists and you have FULL permissions to it' )
			gnv_debug.of_output(True, 'Failed to copy the file ' +as_source + ' to '+as_target+'. Please make sure the path exists and you have FULL permissions to it. We suggest that you manually install ContractLogix_WebClientActiveX to resolve this issue.' )
			return - 2
		End If
Else
	 //Added By Ken.Guo 2016-03-15
	gnv_debug.of_output(True,'Failed to copy the file ' +as_source + ' to '+as_target+'. The source file is not exists. ' )
	Return -1
End If

Return 1
					

end function

on n_cst_reg_control.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_reg_control.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

