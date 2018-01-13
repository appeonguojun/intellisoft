$PBExportHeader$w_dm_image_cp.srw
forward
global type w_dm_image_cp from window
end type
type ole_edit from olecustomcontrol within w_dm_image_cp
end type
end forward

global type w_dm_image_cp from window
boolean visible = false
integer width = 1426
integer height = 936
boolean titlebar = true
string title = "TIF to PDF"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
ole_edit ole_edit
end type
global w_dm_image_cp w_dm_image_cp

type variables
Boolean ib_ocr_finished
String is_ocr_text

n_cst_filesrvwin32 inv_filesrv
end variables

forward prototypes
public function integer of_image2pdf (string as_image, string as_pdf)
public function boolean of_is_image2pdf (string as_ext)
public function integer of_saveas_tif (ref string as_filename)
public function integer of_get_from_clip (ref string as_filename)
public function string of_get_last_ocr_text ()
public function boolean of_ocr_is_finished ()
public subroutine of_reset_ocr ()
end prototypes

public function integer of_image2pdf (string as_image, string as_pdf);//////////////////////////////////////////////////////////////////////
// $<function>of_image2pdf
// $<arguments>String as_image, as_pdf
// $<returns> integer 1- success; -1 - Failed
// $<description>Convert a document from TIF to PDF format
//////////////////////////////////////////////////////////////////////
// $<add> 09.26.2008
//////////////////////////////////////////////////////////////////////
Integer li_rtn
Long ll_pos
String ls_ext, ls_name, ls_rtn

IF IsNull(as_image) OR Not FileExists(as_image) THEN RETURN -1

//Check if the file is allowed to convert
ll_pos = LastPos(as_image,".")
IF ll_pos > 0 THEN ls_ext = Mid(as_image, ll_pos + 1)
IF NOT of_is_image2pdf(ls_ext) THEN 
         // 03/08/12 Added By mark 
//      MessageBox(as_image,"This document is unsupported to convert to a PDF format.", Exclamation!)
         if gb_recordlog = false then
                   MessageBox(as_image,"This document is unsupported to convert to a PDF format.", Exclamation!)
         else
                   gs_errmsg = "This document is unsupported to convert to a PDF format."
         end if
         RETURN -1
END IF

//Get the name of PDF document
IF IsNull(as_pdf) OR Len(Trim(as_pdf)) < 1 THEN 
         as_pdf = Left(as_image, ll_pos -1) + ".pdf"
END IF

//Check write right on the folder
ls_Rtn = f_ExaWriteRight(as_pdf)
if Len(ls_Rtn) > 0 then
         // 03/08/12 Added By mark 
//      MessageBox(as_pdf,ls_Rtn, Exclamation!)
         if gb_recordlog = false then
                   MessageBox(as_pdf,ls_Rtn, Exclamation!)
         else
                   gs_errmsg = ls_Rtn
         end if
         Return -1
end if

//Convert to PDF format
SetPointer(Hourglass!)

TRY
li_rtn = ole_edit.object.Image2PDF(as_image, as_pdf)
CATCH (Throwable th1)
         SetPointer(Arrow!)
         RETURN -1
END TRY

SetPointer(Arrow!)
         
RETURN li_rtn

end function

public function boolean of_is_image2pdf (string as_ext);//Check if it's the type of image allowed to convert to PDF

Boolean lb_rtn

CHOOSE CASE Upper(as_ext)
	CASE "BMP", "GIF", "ICO", "JPG", "JPEG", "PCX", "PNG", "PSD", "TIF", "WMF", "WBMP", "TGA", "PGX", "RAS", "PNM"
		lb_rtn = TRUE
	CASE ELSE
		lb_rtn = FALSE
END CHOOSE

RETURN lb_rtn


end function

public function integer of_saveas_tif (ref string as_filename);return 1
end function

public function integer of_get_from_clip (ref string as_filename);Integer li_ret

//gs_app_image_path = gnv_data.of_getitem("ids" , "intelliapp_app_path" , False)
//as_filename = gs_app_image_path +  '\clipboard'

gs_app_image_path = gs_dir_path + gs_DefDirName + "\Agreement\Image"
as_filename = gs_app_image_path +  '\clipboard'
gnv_appeondll.of_parsepath(gs_app_image_path)

ole_edit.object.filename = ''
ole_edit.object.LoadMultiPage('',0)

If Not ole_edit.object.PasteFromClipboard() Then
	Messagebox('Paste','Please copy a page first.')
	Return -1
End If

If FileExists ( as_filename ) Then
	If FileDelete(as_filename) Then
		Messagebox('Paste','Failed to delete the temporory file "' +as_filename+ '".')
		Return -2
	End If
End If

If ole_edit.object.Save(as_filename,'TIF') <> 1 Then
	Messagebox('Paste','Failed to generate the temporory file, please call support.')
	Return -3
End If

If Not FileExists ( as_filename + '.tif' ) Then 
	Messagebox('Paste','Failed to paste, please call support.')
	Return -4
End If

as_filename = as_filename + '.tif'
Return 1
	
end function

public function string of_get_last_ocr_text ();Return is_ocr_text
end function

public function boolean of_ocr_is_finished ();Return ib_ocr_finished
end function

public subroutine of_reset_ocr ();ib_ocr_finished = False
is_ocr_text = ''
end subroutine

on w_dm_image_cp.create
this.ole_edit=create ole_edit
this.Control[]={this.ole_edit}
end on

on w_dm_image_cp.destroy
destroy(this.ole_edit)
end on

event close;//Release file
ole_edit.object.filename = ''
ole_edit.object.LoadMultiPage('',0)

If isvalid(inv_filesrv) Then Destroy inv_filesrv

end event

event open;inv_filesrv = Create n_cst_filesrvwin32 
gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17

end event

type ole_edit from olecustomcontrol within w_dm_image_cp
event click ( )
event dblclick ( )
event mousemove ( integer button,  integer shift,  long ocx_x,  long ocx_y )
event mousedown ( integer button,  integer shift,  long ocx_x,  long ocx_y )
event mouseup ( integer button,  integer shift,  long ocx_x,  long ocx_y )
event keydown ( integer keycode,  integer shift )
event keyup ( integer keycode,  integer shift )
event keypress ( integer keyascii )
event selectionrectdrawn ( long ileft,  long itop,  long iwidth,  long iheight )
event ocrrecognized ( boolean bsuccess )
event dicomplaying ( integer iframeindex )
event ocrpdfa ( integer iprogress )
integer width = 1394
integer height = 832
integer taborder = 50
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
string binarykey = "w_dm_image_cp.win"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
end type

event ocrrecognized(boolean bsuccess);
Blob lb_data
String ls_path,ls_filename 

ib_ocr_finished = True
If bsuccess Then
	
	is_ocr_text = ole_edit.object.OCRGetRecognizedText( ) 
	
	/*
	//Workaround OCR plugin 6.0 bug for vista and windows 7
	ls_path = gs_dir_path + gs_DefDirName + '\OCR\'
	gnv_appeondll.of_parsepath( ls_path )
	ls_filename = ls_path + String(today(),'yyyymmdd') + String(Now(),'hhmmss') + '.txt'
	If FileExists(ls_filename) Then 
		If Not FileDelete(ls_filename) Then
			is_ocr_text = ''
			Messagebox('OCR','Failed to delete the OCR temp file ' + ls_filename + ', please call support.')
			Return
		End If
	End If
	ole_edit.object.OCRSaveRecognizedText(ls_filename)
	inv_filesrv.of_fileread(ls_filename, lb_data)
	is_ocr_text = String(lb_data)
	FileDelete(ls_filename)
	*/
Else
	is_ocr_text = ''
End If

end event

event constructor;Try
	This.object.licensekey = '11580'
Catch (oleruntimeerror err)
End Try
end event


Start of PowerBuilder Binary Data Section : Do NOT Edit
02w_dm_image_cp.bin 
2800000c00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000004fffffffefffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff0000000300000000000000000000000000000000000000000000000000000000dfc5572001d1834100000003000001800000000000500003004c004200430049004e0045004500530045004b000000590000000000000000000000000000000000000000000000000000000000000000000000000002001cffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000002c0000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000002001affffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000001000000d400000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000101001a000000020000000100000004e589da784fc5ad4c479eb9b69e6710b100000000dfc5572001d18341dfc5572001d18341000000000000000000000000fffffffe000000020000000300000004fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
23ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0065004400650076006f006c00650070002000720069006c006500630073006e003a0065003600350033003700730069006100750020006c00740053006400750000fffe00020006e589da784fc5ad4c479eb9b69e6710b100000001fb8f0821101b01640008ed8413c72e2b00000030000000a4000000050000010000000030000001010000003800000102000000400000010300000048000000000000005000000003000100000000000300001f86000000030000157f00000003000000000000000500000000000000010001030000000c0074735f00706b636f73706f72000101000000090078655f00746e65740102007800090000655f00006e65747800007974090000015f00000073726576006e6f690043005c006d006f006f006d005c006e00530056005c0053006900770033006e003b0032003a00430050005c0001000000001f860000157f00000000000001010000000000000000000000006564040000646f6d000000000000000000000100600060005000000000690000006e006f005c0073006c0055007200740045006100690064005c00742d6b00002e00002e0003856c05976948059487607bff7bff7bff7bff7bff7bff7bff7bff7bff7bff7bff7bff2d6b7bff7bff52947bff2d6b7bff2d6b7bff2d6b7bff2d6b7bff7bff7bff7bff2d6b7bff7bff52947bde7bff7bff7bff7bde7bff7bff7bff006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000050000003d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
12w_dm_image_cp.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
