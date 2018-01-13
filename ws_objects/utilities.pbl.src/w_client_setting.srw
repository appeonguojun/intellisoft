$PBExportHeader$w_client_setting.srw
forward
global type w_client_setting from window
end type
type st_note from statictext within w_client_setting
end type
type dw_ocx from u_dw within w_client_setting
end type
type cb_plugin_open from commandbutton within w_client_setting
end type
type cb_plugin_clean from commandbutton within w_client_setting
end type
type cb_open_web from commandbutton within w_client_setting
end type
type cb_clean_web from commandbutton within w_client_setting
end type
type sle_web_path from singlelineedit within w_client_setting
end type
type cb_open from commandbutton within w_client_setting
end type
type cb_help from commandbutton within w_client_setting
end type
type cb_clean from commandbutton within w_client_setting
end type
type cb_close from commandbutton within w_client_setting
end type
type cb_save from commandbutton within w_client_setting
end type
type sle_dirpath from singlelineedit within w_client_setting
end type
type cb_dirpath from commandbutton within w_client_setting
end type
type st_1 from statictext within w_client_setting
end type
type st_2 from statictext within w_client_setting
end type
type em_days from editmask within w_client_setting
end type
type em_lastclrdate from editmask within w_client_setting
end type
type st_3 from statictext within w_client_setting
end type
type gb_1 from groupbox within w_client_setting
end type
type gb_2 from groupbox within w_client_setting
end type
type st_dirpath from statictext within w_client_setting
end type
type gb_3 from groupbox within w_client_setting
end type
end forward

global type w_client_setting from window
integer width = 2240
integer height = 1236
boolean titlebar = true
string title = "Temporary Files Settings"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_note st_note
dw_ocx dw_ocx
cb_plugin_open cb_plugin_open
cb_plugin_clean cb_plugin_clean
cb_open_web cb_open_web
cb_clean_web cb_clean_web
sle_web_path sle_web_path
cb_open cb_open
cb_help cb_help
cb_clean cb_clean
cb_close cb_close
cb_save cb_save
sle_dirpath sle_dirpath
cb_dirpath cb_dirpath
st_1 st_1
st_2 st_2
em_days em_days
em_lastclrdate em_lastclrdate
st_3 st_3
gb_1 gb_1
gb_2 gb_2
st_dirpath st_dirpath
gb_3 gb_3
end type
global w_client_setting w_client_setting

type prototypes

end prototypes

type variables
String			is_domainname
end variables

forward prototypes
public function integer of_check_ocx ()
public function integer wf_create_cmdfile (string as_text)
end prototypes

public function integer of_check_ocx ();//====================================================================
// Function: of_check_ocx
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	Mark Lee		Date: 06/08/12
//--------------------------------------------------------------------
//	Copyright (c) 2008-2012 Contract Logix,Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

Integer i,li_row
String ls_filepath,ls_error,ls_fileversion
str_ocx  lstr_ocx[]
n_cst_reg_control lnv_reg_control
n_cst_filesrv lnv_filesrv

lnv_filesrv = Create n_cst_filesrv

lstr_ocx[1].ocx_type = 4
lstr_ocx[1].ocx_name = "imageviewer2.ocx"

lstr_ocx[2].ocx_type = 7
lstr_ocx[2].ocx_name = "msxml4.dll"

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

lstr_ocx[9].ocx_type = 7
lstr_ocx[9].ocx_name = "MSSOAP30.dll"

lstr_ocx[10].ocx_type = 7
lstr_ocx[10].ocx_name = "WHSC30.dll"

lstr_ocx[11].ocx_type = 7
lstr_ocx[11].ocx_name = "WINHTTP5.dll"

lstr_ocx[12].ocx_type = 7
lstr_ocx[12].ocx_name = "WISC30.dll"

lstr_ocx[13].ocx_type = 8
lstr_ocx[13].ocx_name = "emssl.dll"

lstr_ocx[14].ocx_type = 9
lstr_ocx[14].ocx_name = "emimap4.dll"

For i = 1 To UpperBound(lstr_ocx[])
	ls_filepath = ''
	ls_error = lnv_reg_control.of_check_ocx( lstr_ocx[i].ocx_type , lstr_ocx[i].ocx_name, False, ls_filepath)
	li_row = dw_ocx.InsertRow(0)
	dw_ocx.SetItem(li_row, 'ocx_name',lstr_ocx[i].ocx_name )
	dw_ocx.SetItem(li_row, 'ocx_dir',ls_filepath )
	dw_ocx.SetItem(li_row, 'ocx_version_now',ls_filepath )
	If ls_error = '' Then
		dw_ocx.SetItem(li_row, 'ocx_result','Success' )
	Else
		dw_ocx.SetItem(li_row, 'ocx_result','Failure' )	
	End if
	If FileExists(ls_filepath) then
		ls_fileversion = lnv_filesrv.of_getfileversion( ls_filepath)
		dw_ocx.SetItem(li_row, 'ocx_version_now',ls_fileversion )
	Else
		dw_ocx.SetItem(li_row, 'ocx_version_now','File does not exist' )
	End If
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

on w_client_setting.create
this.st_note=create st_note
this.dw_ocx=create dw_ocx
this.cb_plugin_open=create cb_plugin_open
this.cb_plugin_clean=create cb_plugin_clean
this.cb_open_web=create cb_open_web
this.cb_clean_web=create cb_clean_web
this.sle_web_path=create sle_web_path
this.cb_open=create cb_open
this.cb_help=create cb_help
this.cb_clean=create cb_clean
this.cb_close=create cb_close
this.cb_save=create cb_save
this.sle_dirpath=create sle_dirpath
this.cb_dirpath=create cb_dirpath
this.st_1=create st_1
this.st_2=create st_2
this.em_days=create em_days
this.em_lastclrdate=create em_lastclrdate
this.st_3=create st_3
this.gb_1=create gb_1
this.gb_2=create gb_2
this.st_dirpath=create st_dirpath
this.gb_3=create gb_3
this.Control[]={this.st_note,&
this.dw_ocx,&
this.cb_plugin_open,&
this.cb_plugin_clean,&
this.cb_open_web,&
this.cb_clean_web,&
this.sle_web_path,&
this.cb_open,&
this.cb_help,&
this.cb_clean,&
this.cb_close,&
this.cb_save,&
this.sle_dirpath,&
this.cb_dirpath,&
this.st_1,&
this.st_2,&
this.em_days,&
this.em_lastclrdate,&
this.st_3,&
this.gb_1,&
this.gb_2,&
this.st_dirpath,&
this.gb_3}
end on

on w_client_setting.destroy
destroy(this.st_note)
destroy(this.dw_ocx)
destroy(this.cb_plugin_open)
destroy(this.cb_plugin_clean)
destroy(this.cb_open_web)
destroy(this.cb_clean_web)
destroy(this.sle_web_path)
destroy(this.cb_open)
destroy(this.cb_help)
destroy(this.cb_clean)
destroy(this.cb_close)
destroy(this.cb_save)
destroy(this.sle_dirpath)
destroy(this.cb_dirpath)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.em_days)
destroy(this.em_lastclrdate)
destroy(this.st_3)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.st_dirpath)
destroy(this.gb_3)
end on

event open;//--------------------------- APPEON BEGIN ---------------------------
//$< Add  > 2007-08-06 By: Scofield
//$<Reason> Add the directory path set.
Integer	li_IntervalDays
String	ls_LastClrDate,ls_TempDir,	ls_domainname
//Modified By mark 04/16/12
//ls_TempDir = ProfileString(gs_IniFilePathName,"Paths","Directory_Path","C:\")
//Added By mark 04/13/12
n_cst_systeminfo lnv_systeminfo
lnv_systeminfo = Create n_cst_systeminfo
is_domainname = lnv_systeminfo.of_get_domainname()
Destroy lnv_systeminfo
ls_TempDir = gnv_user_option.of_Get_option_value( gs_user_id, is_domainname+"_Directory_Path" ) 

//Modified By mark 04/16/12
//if IsNull(ls_TempDir) or Trim(ls_TempDir) = '' then ls_TempDir = "C:\"
if IsNull(ls_TempDir) or Trim(ls_TempDir) = '' then ls_TempDir = "%APPDATA%"

sle_DirPath.Text = ls_TempDir
sle_DirPath.SelectText(Len(ls_TempDir) + 1,0)

li_IntervalDays = ProfileInt(gs_IniFilePathName,"Setup","Interval_Days",30)
em_days.Text = String(li_IntervalDays)

ls_LastClrDate = ProfileString(gs_IniFilePathName,"Setup","Last_Clear_Date",String(Today(),"YYYY/MM/DD"))
em_lastclrdate.text = ls_LastClrDate
//---------------------------- APPEON END ----------------------------

//Added By Ken.Guo 04/25/2012
String ls_WebPath
If AppeonGetClientType() = 'WEB' Then
	ls_WebPath = AppeonGetCacheDir()
	sle_web_path.text = ls_WebPath
	//Added By Mark Lee 06/08/12
	of_check_ocx()
Else
	gb_2.visible = False
	sle_web_path.visible = False
	cb_clean_web.visible = False
	cb_open_web.visible = False
	cb_save.y = gb_1.y + gb_1.height + 56
	cb_close.y = cb_save.y
	cb_help.y = cb_save.y
	This.Height = cb_save.y + cb_save.height + 56 + 92
//	Begin - Added By Mark Lee 06/08/12
	gb_3.visible = False
	cb_plugin_clean.visible = False
	cb_plugin_open.visible = False
//	End - Added By Mark Lee 06/08/12
End If
gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17

end event

type st_note from statictext within w_client_setting
integer x = 91
integer y = 880
integer width = 1271
integer height = 96
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Note: Click Open button to see the path for each plugin."
boolean focusrectangle = false
end type

type dw_ocx from u_dw within w_client_setting
boolean visible = false
integer x = 329
integer y = 944
integer width = 571
integer height = 196
integer taborder = 80
string dataobject = "d_env_check_ocx"
boolean hscrollbar = true
boolean livescroll = false
end type

event constructor;call super::constructor;This.of_setupdateable(False)
end event

type cb_plugin_open from commandbutton within w_client_setting
integer x = 1838
integer y = 872
integer width = 343
integer height = 92
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Open"
end type

event clicked;//====================================================================
// Event: clicked
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	Mark Lee		Date: 06/08/12
//--------------------------------------------------------------------
//	Copyright (c) 2008-2012 Contract Logix,Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
open(w_clean_plugin)
end event

type cb_plugin_clean from commandbutton within w_client_setting
integer x = 1486
integer y = 872
integer width = 343
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Clean Now"
end type

event clicked;//====================================================================
// Event: clicked
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	Mark Lee		Date: 06/08/12
//--------------------------------------------------------------------
//	Copyright (c) 2008-2012 Contract Logix,Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
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
				CASE 'msxml4.dll'	
					ls_DllName[1] = 'msxml4r.dll'		
				CASE 'mssoap30.dll'	
					ls_DllName[1] = 'MSSOAPR3.dll'	
				CASE 'wisc30.dll'
					ls_DllName[1] = 'MSSOAPR3.dll'	
				CASE 'whsc30.dll'
					ls_DllName[1] = 'MSSOAPR3.dll'	
				CASE 'officecontrol.ocx'		
//					ls_DllName[1] = 'officecontrol.ocx'		
				CASE 'emsmtp.dll'						
					ls_DllName[1] = 'emsmtp.dll'		
				CASE 'emmsg.dll'											
					ls_DllName[1] = 'emmsg.dll'		
				CASE 'emimap4.dll'											
					ls_DllName[1] = 'emimap4.dll'		
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

type cb_open_web from commandbutton within w_client_setting
integer x = 1838
integer y = 604
integer width = 343
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Open"
end type

event clicked;//====================================================================
// Event: clicked
//--------------------------------------------------------------------
// Description: Open the Web Application Files Storage Directory.
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:         Ken.Guo           Date: 04/25/2012
//--------------------------------------------------------------------
//Copyright (c) 2008-2012 Contract Logix, Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


String ls_null

SetNull(ls_null)
ShellExecuteA ( Handle( This ), "open", sle_web_path.text  , ls_Null, ls_Null, 4)

end event

type cb_clean_web from commandbutton within w_client_setting
integer x = 1486
integer y = 604
integer width = 343
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Clean &Now"
end type

event clicked;//====================================================================
// Event: clicked
//--------------------------------------------------------------------
// Description: Clean Web Application Fils
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:         Ken.Guo           Date: 04/25/2012
//--------------------------------------------------------------------
//Copyright (c) 2008-2012 Contract Logix, Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


long		ll_Rtn
String	ls_TempDir,ls_LastClrDate

n_cst_filesrv inv_filesrv

ll_Rtn = MessageBox('Confirm Files Clean','Are you sure you want to clean the web application files?',Question!,YesNo!)
if ll_Rtn <> 1 then return

//Delete Files and Dir
f_SetFileSrv(inv_filesrv,TRUE)
ls_TempDir = sle_web_path.text
ll_Rtn = inv_filesrv.of_deltree(ls_TempDir, False)
Destroy inv_filesrv

//Check the result.
If ll_Rtn < 0 Then
	MessageBox(gnv_app.iapp_object.DisplayName,"Failed to delete some files because they are being used right now. ~r~n~r~nWe suggest that you close this IE and then remove the web application files manually.",Exclamation!)
else
	MessageBox(gnv_app.iapp_object.DisplayName,"The web application files were cleaned successfully! ~r~nWe suggest that you exit ContractLogix and then run again.")
end if


end event

type sle_web_path from singlelineedit within w_client_setting
integer x = 82
integer y = 608
integer width = 1399
integer height = 84
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 12632256
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type cb_open from commandbutton within w_client_setting
integer x = 1838
integer y = 272
integer width = 343
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Open"
end type

event clicked;//====================================================================
// Event: clicked
//--------------------------------------------------------------------
// Description: Open the Temporary Directory.
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:         Ken.Guo           Date: 04/25/2012
//--------------------------------------------------------------------
//Copyright (c) 2008-2012 Contract Logix, Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


String ls_null

SetNull(ls_null)
ShellExecuteA ( Handle( This ), "open", gs_dir_path + gs_DefDirName  , ls_Null, ls_Null, 4)

end event

type cb_help from commandbutton within w_client_setting
integer x = 1838
integer y = 1032
integer width = 343
integer height = 92
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Help"
end type

event clicked;String	ls_Help

ls_Help  = 'Temporary Directory:~r~nThis option enables users to select any Windows folder as the location of temporary files.  The program will automatically create a sub-folder called "ContractLogix" under that folder.~r~nFor example, if the user inputs "C:\Temp\" here, then the actual location of temporary files is "C:\Temp\ContractLogix\", %APPDATA% is supported.~r~nThe program must be re-started in order for the change to take effect.~r~n~r~nClean up the temporary files every ## Days:~r~nTo prevent that the temporary files pile up and take up too much disk space, the user can set an interval and the program will automatically clean up the temporary files (not all files, but only those under the Agreement sub-folder) according to that interval. 0 indicates the program never automatically cleans up any files.~r~n~r~nClean Now:~r~nThis button allows users to remove the temporary files.~r~n~r~Open:~r~nThis button allows users to open the temporary directory.~r~n'

MessageBox(gnv_app.iapp_object.DisplayName,ls_Help)



//, but currently it only cleans up the files under the Agreement sub-folder, because the program may be affected if all temporary files are removed at once.
end event

type cb_clean from commandbutton within w_client_setting
integer x = 1486
integer y = 272
integer width = 343
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Clean &Now"
end type

event clicked;long		ll_Rtn
String	ls_TempDir,ls_LastClrDate

n_cst_filesrv inv_filesrv

ll_Rtn = MessageBox('Confirm Files Clean','Are you sure you want to clean the temporary files?',Question!,YesNo!)
if ll_Rtn <> 1 then return

f_SetFileSrv(inv_filesrv,TRUE)
//Added By Mark Lee 04/24/12
//ls_TempDir = gs_dir_path + gs_DefDirName + "\Agreement"
ls_TempDir = gs_dir_path + gs_DefDirName 

ll_Rtn = inv_filesrv.of_deltree(ls_TempDir, False)

Destroy inv_filesrv

//if DirectoryExists(ls_TempDir) then
If ll_Rtn < 0 Then
	MessageBox(gnv_app.iapp_object.DisplayName,"Failed to delete some temporary files because they are being used right now. ~r~n~r~nWe suggest that you exit ContractLogix and then remove the temporary files manually.",Exclamation!)
else
	ls_LastClrDate = String(Today(),"YYYY/MM/DD")
	SetProfileString(gs_IniFilePathName,"Setup","Last_Clear_Date",ls_LastClrDate)
	em_lastclrdate.Text = ls_LastClrDate
	
	MessageBox(gnv_app.iapp_object.DisplayName,"Temporary files were cleaned successfully! ~r~nWe suggest that you exit ContractLogix and then run again.")
end if

end event

type cb_close from commandbutton within w_client_setting
integer x = 1486
integer y = 1032
integer width = 343
integer height = 92
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Close"
boolean cancel = true
end type

event clicked;Close(Parent)

end event

type cb_save from commandbutton within w_client_setting
integer x = 1134
integer y = 1032
integer width = 343
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Save"
boolean default = true
end type

event clicked;String	ls_TempDir
String	ls_IntervalDays,ls_LastClrDate

//Verify the directory if exists
ls_TempDir = Trim(sle_DirPath.Text)

//Support %APPDATA" - jervis 09.15.2010
if Pos(Upper(ls_TempDir),"%APPDATA%") > 0 then
	ulong lul_chars 
	string ls_var ,ls_path
	n_cst_string lnv_string
	
	ls_var = "APPDATA"
	ls_path = Space( 1024 )
	lul_chars = GetEnvironmentVariableA( ls_var, ls_path, 1024 )
	ls_TempDir = lnv_string.of_globalreplace( ls_TempDir,"%APPDATA%",ls_path,true)
end if


if Not DirectoryExists(ls_TempDir) then
	MessageBox(gnv_app.iapp_object.DisplayName, "'" + ls_TempDir + "' is not exist,Please select an existing directory.",Exclamation!)
	return
else //User original path - jervis 09.15.2010
	ls_TempDir = Trim(sle_DirPath.Text)
end if

//Added By Ken.Guo 2010-02-24.
Integer li_err
n_cst_rights lnv_right
lnv_right = create n_cst_rights
If right(ls_TempDir,1) <> '\' Then ls_TempDir = ls_TempDir + '\'
li_err = lnv_right.of_check_dir_right(ls_TempDir + gs_DefDirName) 
If li_err < 0 Then 
	Choose case li_err
		Case -1
			Messagebox('Error', 'The application could not create the Temporary Directory ' + ls_TempDir + gs_DefDirName + '. Please select another directory or contact your IT department. You need to have permissions to create the temporary directory.',Exclamation!)
		Case -2,-3
			Messagebox('Error', 'The application could not create a temporary file in the directory ' + ls_TempDir + gs_DefDirName + '. Please select another directory or contact your IT department. You need to have full permissions of the temporary directory.',Exclamation!)
	End Choose
	Return -1
End If

//Begin - Added By Mark Lee 04/17/12
//Set the temporary directory
//SetProfileString(gs_IniFilePathName,"Paths","Directory_Path",ls_TempDir)
gnv_user_option.of_Set_option_value(gs_user_id, is_domainname+"_Directory_Path",ls_TempDir )
gnv_user_option.of_save( )
gs_dir_path =	ls_TempDir
//End - Added By Mark Lee 04/17/12

//Set the Interval Days
ls_IntervalDays = em_days.Text
SetProfileString(gs_IniFilePathName,"Setup","Interval_Days",ls_IntervalDays)

//Set the Last Clear Date
ls_LastClrDate = em_lastclrdate.text
SetProfileString(gs_IniFilePathName,"Setup","Last_Clear_Date",ls_LastClrDate)

end event

type sle_dirpath from singlelineedit within w_client_setting
integer x = 82
integer y = 116
integer width = 1742
integer height = 84
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type cb_dirpath from commandbutton within w_client_setting
integer x = 1838
integer y = 112
integer width = 343
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Browse..."
end type

event clicked;/******************************************************************************************************************
**  [PUBLIC]   : event CLICKED!
**==================================================================================================================
**  Purpose   	: Gets the directory path from the ini file,sets the directory path
**==================================================================================================================
**  Arguments 	: [none] 
**==================================================================================================================
**  Returns   	: [none]   
**==================================================================================================================
**  Notes     	: 	   
**==================================================================================================================
**  Created By	: Scofield
**==================================================================================================================
**  Modification Log
**   Changed By             Change Date                                               Reason
** ------------------------------------------------------------------------------------------------------------------
********************************************************************************************************************/

string ls_path 

ls_path =  f_browseforfolder('Please select a directory' ,handle(parent))

if f_validstr(ls_path)  then
	if Right(ls_path,1) <> "\" then
		ls_path += "\"
	end if	
	sle_dirpath.text = ls_path
end if

end event

type st_1 from statictext within w_client_setting
integer x = 978
integer y = 256
integer width = 155
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "days."
boolean focusrectangle = false
end type

type st_2 from statictext within w_client_setting
integer x = 73
integer y = 256
integer width = 754
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Clean up the temporary files every"
boolean focusrectangle = false
end type

type em_days from editmask within w_client_setting
integer x = 832
integer y = 240
integer width = 137
integer height = 84
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
string mask = "#####"
double increment = 1
string minmax = "0~~99999"
end type

type em_lastclrdate from editmask within w_client_setting
integer x = 457
integer y = 352
integer width = 293
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean border = false
boolean displayonly = true
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "YYYY/MM/DD"
end type

type st_3 from statictext within w_client_setting
integer x = 73
integer y = 352
integer width = 370
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Last Clean Date:"
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_client_setting
integer x = 37
integer y = 24
integer width = 2171
integer height = 428
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Temporary Directory (%APPDATA% is supported):"
end type

type gb_2 from groupbox within w_client_setting
integer x = 32
integer y = 508
integer width = 2171
integer height = 244
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Web Application Files Storage Location"
end type

type st_dirpath from statictext within w_client_setting
integer x = 73
integer y = 72
integer width = 1061
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

type gb_3 from groupbox within w_client_setting
integer x = 37
integer y = 776
integer width = 2171
integer height = 244
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Web Application Plugin Files"
end type

