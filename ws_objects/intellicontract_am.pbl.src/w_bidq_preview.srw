﻿$PBExportHeader$w_bidq_preview.srw
forward
global type w_bidq_preview from window
end type
type ole_doc from u_email_edit within w_bidq_preview
end type
type uo_image_cp from uo_dm_image_view_cp within w_bidq_preview
end type
end forward

global type w_bidq_preview from window
integer width = 3003
integer height = 1688
boolean titlebar = true
string title = "View Document"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
ole_doc ole_doc
uo_image_cp uo_image_cp
end type
global w_bidq_preview w_bidq_preview

type prototypes
FUNCTION long ShellExecute(long hwnd, string lpOperation, string lpFile, string lpParameters, string lpDirectory, long nShowCmd) LIBRARY "shell32.dll"  ALIAS FOR "ShellExecuteA;Ansi"
end prototypes

type variables
n_cst_dm_utils inv_utils
end variables

on w_bidq_preview.create
this.ole_doc=create ole_doc
this.uo_image_cp=create uo_image_cp
this.Control[]={this.ole_doc,&
this.uo_image_cp}
end on

on w_bidq_preview.destroy
destroy(this.ole_doc)
destroy(this.uo_image_cp)
end on

event open;string ls_Title
string ls_FileFullName
string ls_FileName
string ls_FileType
integer li_Pos

gnv_reg_ocx.of_check_ocx( 1,'', True) //1: office //Added by Ken.Guo on 2008-11-06

// Set title text
li_Pos = Pos(Message.StringParm, "|")
ls_Title = Left(Message.StringParm, li_Pos - 1)
this.Title = ls_Title

// Get file information
ls_FileFullName = Right(Message.StringParm, Len(Message.StringParm) - li_Pos)
ls_FileName = inv_utils.of_get_filename(ls_FileFullName)
ls_FileType = Lower(inv_utils.of_get_fileext(ls_FileFullName))

// Open file according to file type
ole_doc.Hide()
//uo_image.Hide()
uo_image_cp.Hide()
choose case Lower(ls_FileType)
	case "doc", "docx", "xls"
		try
			ole_doc.Show()
			ole_doc.object.Caption = ls_FileName
			app_filler.of_set_word_safemode(false, 1) //Added By Ken.Guo 2015-07-30
			If ole_doc.object.doctype > 0 Then ole_doc.object.ActiveDocument.Saved = True //Added By Ken.Guo 2016-05-23. workaround Task 524
			ole_doc.object.OpenLocalFile(ls_FileFullName , true)
			app_filler.of_set_word_safemode(false, 0) //Added By Ken.Guo 2015-07-30
			gnv_word_utility.of_modify_word_property( ole_doc.object.ActiveDocument)	//Added By Mark Lee 06/20/2013 change for office 2013.			
		catch (RunTimeError e)
			if IsValid(w_appeon_gifofwait) then Close(w_appeon_gifofwait)
			MessageBox('Error', 'The Office Viewer Active X Control has failed.')			
			Close(this)
			Return
		end try
	case "tif"
		if gi_imageocx = 1 then
			//Image 360 control was installed
			//uo_image.Show()
			//uo_image.of_open_localfile(ls_FileFullName)
			//uo_image.of_set_readonly(true)
		else
			uo_image_cp.Show()
			uo_image_cp.of_Initialize(ls_Title, "tif")
			uo_image_cp.of_open_localfile(ls_FileFullName)
			uo_image_cp.of_set_readonly(true)
		end if
	case else
		if IsValid(w_appeon_gifofwait) then Close(w_appeon_gifofwait)
		ShellExecute(0, "open", ls_FileFullName, "", "", 1)
		Close(this)
		Return
end choose
gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17


// Close progress if is open
if IsValid(w_appeon_gifofwait) then Close(w_appeon_gifofwait)
end event

event resize;ole_doc.Move(0, 0)
ole_doc.Resize(Width - 25, Height - 100)

//uo_image.Move(0, 0)
//uo_image.Resize(Width - 30, Height - 105)

uo_image_cp.Move(0, 0)
uo_image_cp.Resize(Width - 30, Height - 105)
end event

event close;If ole_doc.object.doctype > 0 Then ole_doc.object.ActiveDocument.Saved = True //Added By Ken.Guo 2016-05-23. workaround Task 524
ole_doc.object.Close()
end event

event activate;//Added By Ken.Guo 2011-11-30. Workaround Office OCX's bug
If isvalid(ole_doc ) Then
	ole_doc.object.activate(true)
End If
end event

type ole_doc from u_email_edit within w_bidq_preview
integer width = 2949
integer height = 792
integer taborder = 130
string binarykey = "w_bidq_preview.win"
end type

type uo_image_cp from uo_dm_image_view_cp within w_bidq_preview
integer x = 398
integer y = 804
integer taborder = 100
end type

on uo_image_cp.destroy
call uo_dm_image_view_cp::destroy
end on


Start of PowerBuilder Binary Data Section : Do NOT Edit
0Ew_bidq_preview.bin 
2200000c00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdfffffffefffffffe00000004fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff000000010000000000000000000000000000000000000000000000000000000000436ce001d1b4c900000003000002800000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000102001affffffff00000002ffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000011800000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000001001affffffffffffffff00000003d267e82f41ee8649010521915f71b1300000000000436ce001d1b4c900436ce001d1b4c90000000000000000000000000054004e004f004b0066004f0069006600650063007400430053006c006d0074000000000000000000000000000000000000000000000000000000000000000001020022ffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000005000001180000000000000001000000020000000300000004fffffffe00000006000000070000000800000009fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
2Dffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff1234abcd000042aa000014778000001080000005800000088000001080000014010100010000000000000000000000000000000000000000000000000000000000000001000000000000000000000001000000010000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff000000000000000100c8d0d4000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000f6e6d300e3ba9200000000000000000000000000000001000000000000000100000000000003a8000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000000000000100000000000000008c868886000000000000000020232524a3232524ff727473ffbec1c0ff6b749eff2941d9ff2640e11234abcd000042aa000014778000001080000005800000088000001080000014010100010000000000000000000000000000000000000000000000000000000000000001000000000000000000000001000000010000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff000000000000000100c8d0d4000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000f6e6d300e3ba9200000000000000000000000000000001000000000000000100000000000003a8000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000000000000100000000000000000020007300200028006f007000650077006f0072006a0062006300650020007400700061005f006f006f00630074006e006f0072005b006c002c005d00620020006f006f0065006c006e006100610020005f006200630061006500630074007000650074007400780020002c006f0062006c006f006100650020006e006200610072005f0073006500740065006c00660067006100290020002000200065007200750074006e007200200073006e006900650074006500670000007200660070005f006300700075006100640065007400700073006e0065006900640067006e006500720020006600200028006f007000650077006f0072006a0062006300650020007400700061005f006f006f00630074006e006f0072005b006c002c005d0072002000660065007000200077006f007200650062006f0065006a0074006300610020006f00700070005f006e0065006900640067006e005d005b00290020002000200065007200750074006e007200200073006e006900650074006500670000007200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1Ew_bidq_preview.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point