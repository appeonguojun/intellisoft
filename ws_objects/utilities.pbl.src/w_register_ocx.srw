$PBExportHeader$w_register_ocx.srw
forward
global type w_register_ocx from w_response
end type
type cb_register_cmd from commandbutton within w_register_ocx
end type
type cbx_imagecp from checkbox within w_register_ocx
end type
type cbx_email from checkbox within w_register_ocx
end type
type cbx_office from checkbox within w_register_ocx
end type
type cbx_image360 from checkbox within w_register_ocx
end type
type mle_output from multilineedit within w_register_ocx
end type
type cb_cancel from commandbutton within w_register_ocx
end type
type cb_register from commandbutton within w_register_ocx
end type
type gb_1 from groupbox within w_register_ocx
end type
type gb_2 from groupbox within w_register_ocx
end type
end forward

global type w_register_ocx from w_response
integer width = 1618
integer height = 1444
string title = "Register Plugin"
cb_register_cmd cb_register_cmd
cbx_imagecp cbx_imagecp
cbx_email cbx_email
cbx_office cbx_office
cbx_image360 cbx_image360
mle_output mle_output
cb_cancel cb_cancel
cb_register cb_register
gb_1 gb_1
gb_2 gb_2
end type
global w_register_ocx w_register_ocx

forward prototypes
public function integer of_register_image_360 ()
end prototypes

public function integer of_register_image_360 ();//Added By Ken.Guo 2009-08-06.
n_cst_imaging lnv_imaging

If lnv_imaging.of_check_windows_imaging( ) Then 
	mle_output.text = "Needn't to register Image 360 Plugin: "
	//Messagebox('Information','You have installed Window Imaging 360 programe, need not regist Imaging 360 OCX.')
	mle_output.text += '~r~n	You have installed Window Imaging 360 programe, need not register Imaging 360 OCX.'
	Return 0
End If

If gs_image_flag <> '1' Then
	mle_output.text = "Failed to register Image 360 Plugin: "
	//Messagebox('Information','Please check the "Install Imaging Programe" in the User Painter for "' +gs_user_id+ '".')
	mle_output.text += '~r~n	Please check the "Install Imaging Programe" in the User Painter for "' +gs_user_id+ '".'
	Return 0
End If

If not lnv_imaging.of_isdownload_ocx( ) Then
	If Not lnv_imaging.of_download_ocx() Then
		mle_output.text = "Failed to register Image 360 Plugin: "
		//Messagebox('Error','Failed to download Imaging OCX.')
		mle_output.text += '~r~n	Failed to download Imaging 360 OCX from web server.'
		Return -1
	End If
End If

lnv_imaging.of_registry_imaging( )
run('regedit -s "' + lnv_imaging.LOCAL_PATH + 'Imaging.reg"')

If lnv_imaging.of_registry_ocx_plugin( ) Then
	//Messagebox('Information','Succeed to regist imaging OCX.')
	mle_output.text = "Succeed to register Image 360 Plugin. "
Else
	//Messagebox('Information','Failed to regist imaging OCX.')
	mle_output.text = "Failed to register Image 360 Plugin. "
End If


Return 1 
end function

on w_register_ocx.create
int iCurrent
call super::create
this.cb_register_cmd=create cb_register_cmd
this.cbx_imagecp=create cbx_imagecp
this.cbx_email=create cbx_email
this.cbx_office=create cbx_office
this.cbx_image360=create cbx_image360
this.mle_output=create mle_output
this.cb_cancel=create cb_cancel
this.cb_register=create cb_register
this.gb_1=create gb_1
this.gb_2=create gb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_register_cmd
this.Control[iCurrent+2]=this.cbx_imagecp
this.Control[iCurrent+3]=this.cbx_email
this.Control[iCurrent+4]=this.cbx_office
this.Control[iCurrent+5]=this.cbx_image360
this.Control[iCurrent+6]=this.mle_output
this.Control[iCurrent+7]=this.cb_cancel
this.Control[iCurrent+8]=this.cb_register
this.Control[iCurrent+9]=this.gb_1
this.Control[iCurrent+10]=this.gb_2
end on

on w_register_ocx.destroy
call super::destroy
destroy(this.cb_register_cmd)
destroy(this.cbx_imagecp)
destroy(this.cbx_email)
destroy(this.cbx_office)
destroy(this.cbx_image360)
destroy(this.mle_output)
destroy(this.cb_cancel)
destroy(this.cb_register)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;call super::open;If appeongetclienttype() = 'PB' Then
	cbx_image360.checked = False
	cbx_image360.enabled = False
//	cb_register_cmd.visible = True
End If
end event

type cb_register_cmd from commandbutton within w_register_ocx
integer x = 50
integer y = 1216
integer width = 375
integer height = 92
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Register (CMD)"
end type

event clicked;of_reg_dllocx_cmd()


////////////////////////////////////////////////////////////////////////
//// $<event>clickedcb_register_cmd()
//// $<arguments>(None)
//// $<returns> long
//// $<description> User Command Line to Register current OCX files.
//// $<description> 
////////////////////////////////////////////////////////////////////////
//// $<add> 2010-06-24 by Ken.Guo
////////////////////////////////////////////////////////////////////////
//
//String ls_file 
//integer li_FileNum
//Integer i
//String ls_PluginDir
//String ls_OCXList[] = {'imageviewer2.ocx','imagethumbnailcp.ocx','scanner.ocx','emsmtp.dll','empop3.dll','emmsg.dll','officecontrol.ocx'}
//
//If AppeonGetClientType() = 'PB' Then
//	Run("register.bat")	
//Else
//	ls_file = gs_dir_path + gs_DefDirName + '\register.bat'
//	If FileExists(ls_file) Then
//		If Not FileDelete(ls_file) Then
//			Messagebox('Delete','Failed to delete the temp file ' + ls_file + ', please log off and then try again.')
//			Return -1
//		End If
//	End If
//	li_FileNum = FileOpen(ls_file, LineMode!, Write!, LockWrite!, Replace!)
//	ls_PluginDir = AppeonGetCacheDir() + '\PlugIn\'
//	For i = 1 To UpperBound(ls_OCXList[])
//		FileWrite(li_FileNum, 'Regsvr32 "' + ls_PluginDir + ls_OCXList[i] + '"')
//	Next	
//	FileWrite(li_FileNum, 'Exit')
//	FileClose(li_FileNum)
//	Run(ls_file)
//End If
end event

type cbx_imagecp from checkbox within w_register_ocx
integer x = 151
integer y = 224
integer width = 521
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Image  CP Plugin"
boolean checked = true
end type

type cbx_email from checkbox within w_register_ocx
integer x = 151
integer y = 116
integer width = 457
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Email Plugin"
boolean checked = true
end type

type cbx_office from checkbox within w_register_ocx
integer x = 942
integer y = 116
integer width = 457
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Office Plugin"
boolean checked = true
end type

type cbx_image360 from checkbox within w_register_ocx
boolean visible = false
integer x = 942
integer y = 232
integer width = 471
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Image 360 Plugin (WEB)"
end type

type mle_output from multilineedit within w_register_ocx
integer x = 96
integer y = 440
integer width = 1394
integer height = 696
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean hscrollbar = true
boolean vscrollbar = true
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type cb_cancel from commandbutton within w_register_ocx
integer x = 1170
integer y = 1216
integer width = 343
integer height = 92
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Cancel"
boolean cancel = true
end type

event clicked;Close(Parent)
end event

type cb_register from commandbutton within w_register_ocx
integer x = 814
integer y = 1216
integer width = 343
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Register"
boolean default = true
end type

event clicked;String ls_ret

If cbx_image360.checked Then
	Parent.of_register_image_360()
End If

If cbx_imagecp.checked Then
	If mle_output.text <> '' Then mle_output.text += '~r~n'
	If gnv_reg_ocx.of_register( 'imageviewer2.ocx', False) <> "" Then
		ls_ret += '~r~n	Failed to register imageviewer2.ocx.'
	End If
	
	If gnv_reg_ocx.of_register( 'imagethumbnailcp.ocx', False)	<> "" Then
		ls_ret += '~r~n	Failed to register imagethumbnailcp.ocx.'		
	End If
	
	If gnv_reg_ocx.of_register( 'scanner.ocx', False)	<> '' Then
		ls_ret += '~r~n	Failed to register scanner.ocx.'		
	End If
		
	If ls_ret <> '' Then
		mle_output.text += 'Failed to register Image CP Plugin:' + ls_ret
	Else
		mle_output.text += 'Succeed to register Image CP Plugin.'
	End If
End If

If cbx_email.checked Then
	If mle_output.text <> '' Then mle_output.text += '~r~n'
	If gnv_reg_ocx.of_register( 'emsmtp.dll', False) <> '' Then
		mle_output.text += 'Failed to register Email Plugin emsmtp.dll.'
	Else
		mle_output.text += 'Succeed to register Email Plugin emsmtp.dll.'
	End If
	
	If gnv_reg_ocx.of_register( 'empop3.dll', False) <> '' Then
		mle_output.text += 'Failed to register Email Plugin empop3.dll.'
	Else
		mle_output.text += 'Succeed to register Email Plugin empop3.dll.'
	End If
	
	If gnv_reg_ocx.of_register( 'emmsg.dll', False) <> '' Then
		mle_output.text += 'Failed to register Email Plugin emmsg.dll.'
	Else
		mle_output.text += 'Succeed to register Email Plugin emmsg.dll.'
	End If	
	
	If gnv_reg_ocx.of_register( 'emimap4.dll', False) <> '' Then //added by gavins 20121122
		mle_output.text += 'Failed to register Email Plugin emimap4.dll.'
	Else
		mle_output.text += 'Succeed to register Email Plugin emimap4.dll.'
	End If	
	
	//Added By Mark Lee 07/08/2013
	If gnv_reg_ocx.of_register( 'EAGetMailObj.dll', False) <> '' Then
		mle_output.text += 'Failed to register Email Plugin EAGetMailObj.dll.'
	Else
		mle_output.text += 'Succeed to register Email Plugin EAGetMailObj.dll.'
	End If	
	
	If gnv_reg_ocx.of_register( 'EASendMailObj.dll', False) <> '' Then
		mle_output.text += 'Failed to register Email Plugin EASendMailObj.dll.'
	Else
		mle_output.text += 'Succeed to register Email Plugin EASendMailObj.dll.'
	End If	
		
End If

If cbx_office.checked Then
	If mle_output.text <> '' Then mle_output.text += '~r~n'
	If gnv_reg_ocx.of_register( 'officecontrol.ocx', False) <> '' Then
		mle_output.text += 'Failed to register Office Plugin officecontrol.ocx.'
	Else
		mle_output.text += 'Succeed to register Office Plugin officecontrol.ocx.'
	End If	
End If


end event

type gb_1 from groupbox within w_register_ocx
integer x = 59
integer y = 44
integer width = 1467
integer height = 304
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Plugin List"
end type

type gb_2 from groupbox within w_register_ocx
integer x = 59
integer y = 380
integer width = 1467
integer height = 788
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Output"
end type

