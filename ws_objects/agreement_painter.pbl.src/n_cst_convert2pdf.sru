$PBExportHeader$n_cst_convert2pdf.sru
forward
global type n_cst_convert2pdf from userobject
end type
type ole_1 from u_email_edit within n_cst_convert2pdf
end type
end forward

global type n_cst_convert2pdf from userobject
boolean visible = false
integer width = 1001
integer height = 624
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
ole_1 ole_1
end type
global n_cst_convert2pdf n_cst_convert2pdf

type variables
Long il_doc_id
String is_doc_ext

str_add_doc lstr_add_doc 
n_cst_image_functions_cp inv_image_cp //Alfee 11.21.2008

n_cst_clause inv_clause

str_add_doc istr_add_doc[] 

boolean ib_multi = False
end variables

forward prototypes
public subroutine of_save_as_pdf (string as_savetype, string as_targetfile, window aw_window)
public function integer of_delete_file (string as_file)
public function integer of_check_pdfprinter ()
public subroutine of_printout_pdf (oleobject aole_word)
public subroutine of_copy_pdf_file (string as_sourcefile, string as_targetfile)
end prototypes

public subroutine of_save_as_pdf (string as_savetype, string as_targetfile, window aw_window);//====================================================================
// Function: of_save_as_pdf
//--------------------------------------------------------------------
// Description: export file for w_doc_saveto_document and w_agreement_template_saveto_document.
//--------------------------------------------------------------------
// Arguments:
// 	value    string    as_savetype
// 	value    string    as_targetfile
// 	value    window    aw_window
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:	Jay Chen		Date: 09-29-2014
//--------------------------------------------------------------------
//	Copyright (c) 2008-2013 ContractLogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

Integer li_file,li_rtn
String ls_save_type
String ls_path
String ls_filename
String ls_SourceFile
String ls_merge_file
String ls_prntrs,ls_DefPrinter
long	 ll_export_id,ll_Len
string ls_WinName

n_cst_filesrvwin32  lnv_filesvr

str_doc_info	lstr_docinfo	//02.25.2009 by jervis

ls_WinName = lower(aw_window.ClassName())
choose case ls_WinName
	case 'w_agreement_template_saveto_document'
		IF NOT IsValid(w_agreement_template_painter) THEN RETURN
		lstr_add_doc = w_agreement_template_saveto_document.istr_add_doc
	case 'w_doc_saveto_document'
		IF NOT IsValid(w_sheet_ctx_doc_painter) THEN RETURN
		lstr_add_doc = w_doc_saveto_document.lstr_add_doc
end choose

il_doc_id = lstr_add_doc.doc_id
is_doc_ext = lstr_add_doc.doc_ext
IF il_doc_id = 0 THEN RETURN

//ls_merge_file = gs_dir_path + gs_DefDirName + "\Agreement\" +"_"+ string(il_doc_id) + "_out.doc"
ls_save_type = as_savetype
ls_path = as_targetfile

IF NOT f_validstr ( ls_save_type ) THEN
	MessageBox("Save As","Please choose a Save As Type for the document first.")
	Return
END IF

IF NOT f_validstr ( ls_path ) THEN
	MessageBox("Save As", "Please choose a directory for the document first.")
	Return
END IF

IF Upper(is_doc_ext) = 'PDF' THEN ls_save_type = "O" //Alfee 03.14.2008
IF ls_save_type = 'P' THEN //Alfee 11.21.2008
	IF Lower(is_doc_ext) <> "doc" AND NOT inv_image_cp.of_is_image2pdf(is_doc_ext ) THEN
		MessageBox("Save As", "This document is unsupported to be saved as a PDF format.")
		Return
	ELSEIF Lower(is_doc_ext) <> "doc" THEN
		ls_save_type = "I2P" //Image to PDF
	END IF
END IF

Try
CHOOSE CASE ls_save_type
	CASE "O"		// Save to original format
		SetPointer( HourGlass! )
		Openwithparm(w_appeon_gifofwait, "Saving as document...")
		//-----------Begin Modified by Alfee 07.05.2007---------------------
//		ls_filename = Parent.of_downloadfile(lstr_add_doc.doc_id )
		choose case ls_WinName
			case 'w_agreement_template_saveto_document'
				ls_filename = w_agreement_template_saveto_document.of_downloadfile(lstr_add_doc.doc_id )
			case 'w_doc_saveto_document'
				ls_filename = w_doc_saveto_document.of_downloadfile(lstr_add_doc.doc_id )
		end choose
		IF FileExists(ls_filename) THEN FileCopy(ls_filename, ls_path, TRUE)
		//-----------End Modified ------------------------------------------
		IF Isvalid(w_appeon_gifofwait) THEN w_appeon_gifofwait.event timer()
		
		//-------Added by alfee 04.28.2007----------
		IF not FileExists(ls_path) THEN 
			MessageBox("Alert Message","Saving as document failed!")
			IF Isvalid(w_appeon_gifofwait) THEN Close(w_appeon_gifofwait)			
			Return
		END IF
	
	
	CASE "P"		// Save to PDF format
		/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// save the word as a Pdf file
		/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*******************
		//---Appeon Begin by alfee 04.11.2007-------
		//Check PDF Printer
		if f_PrinterSetup(2) >= 2 then return	//Added by Scofield on 2007-11-09
		ls_prntrs = PrintGetPrinters( )
		IF NOT Pos(lower(ls_prntrs),lower("Contract Logix PDF Writer")) > 0 THEN
			MessageBox("Printer Error","The Contract Logix PDF Writer is not configured correctly!")
			RETURN
		END IF
		//---Appeon End ----------
		*******************/
		//Added By Jay Chen 09-29-2014
		li_rtn = of_check_pdfprinter()
		if li_rtn <> 1 then return
		//end
	
		IF Lower(is_doc_ext) <> "doc" THEN
			MessageBox("Save As", "Only Word documents are supported.")
			Return
		END IF
		
		SetPointer( HourGlass! )
		Openwithparm(w_appeon_gifofwait, "Saving as PDF...")
		
		// Delete temp pdf file
		ls_SourceFile = "C:\Program Files\PDFPrinter\temp\SampleOut.PDF"
		//ls_SourceFile = gs_dir_path + gs_DefDirName + "\PDFPrinter\temp\SampleOut.PDF" //Alfee 08.21.2007		
		/***************************
		//---------Begin Modified by Alfee 08.29.2007----------------------
		//FileDelete(ls_SourceFile)
		IF FileExists(ls_SourceFile) THEN 
			IF Not FileDelete(ls_SourceFile) THEN 
				MessageBox("Printer Error", "Please delete the file of '" + ls_SourceFile + "' first! ")				
				RETURN 
			END IF
		END IF		
		//---------End Modified -------------------------------------------
		****************************/
		li_rtn = of_delete_file(ls_SourceFile)
		if li_rtn = -1 then return

		// DownLoad source file
//		ls_filename = Parent.of_downloadfile(lstr_add_doc.doc_id )
		choose case ls_WinName
			case 'w_agreement_template_saveto_document'
				ls_filename = w_agreement_template_saveto_document.of_downloadfile(lstr_add_doc.doc_id )
			case 'w_doc_saveto_document'
				ls_filename = w_doc_saveto_document.of_downloadfile(lstr_add_doc.doc_id )
		end choose
		IF Isvalid(w_appeon_gifofwait) THEN w_appeon_gifofwait.event timer()

		//-------Added by alfee 04.28.2007----------
		IF not FileExists(ls_filename) THEN 
			MessageBox("Alert Message","Saving as PDF failed!")
			IF Isvalid(w_appeon_gifofwait) THEN Close(w_appeon_gifofwait)			
			Return
		END IF
		//------End Added----------------------------				
		
		gnv_reg_ocx.of_check_ocx( 1,'', True) //1: office //Added by Ken.Guo on 2008-11-06
		
		
		//Open Document with the OFFICE OCX
		app_filler.of_set_word_safemode(false, 1) //Added By Ken.Guo 2015-07-30
		If ole_1.object.doctype > 0 Then ole_1.object.ActiveDocument.Saved = True //Added By Ken.Guo 2016-05-23. workaround Task 524
		ole_1.object.openlocalfile(ls_filename, True)
		app_filler.of_set_word_safemode(false, 0) //Added By Ken.Guo 2015-07-30
		gnv_word_utility.of_modify_word_property( ole_1.object.ActiveDocument)	//Added By Mark Lee 06/20/2013 change for office 2013.
		IF Isvalid(w_appeon_gifofwait) THEN w_appeon_gifofwait.event timer()			

		// Set PDF Printer and print to PDF format
		/******************
		if f_PrinterSetup(2) >= 2 then return	//Added by Scofield on 2007-11-09
		ll_Len = 100
		ls_DefPrinter = SPACE(ll_Len)
		GetDefaultPrinter(ls_DefPrinter,ll_Len)	//Added by Scofield on 2008-07-30
		ole_1.object.ActiveDocument.Application.ActivePrinter = "Contract Logix PDF Writer"
		ole_1.object.ActiveDocument.Printout( 0 )
		ole_1.object.Close()			
		SetDefaultPrinter(ls_DefPrinter)				//Added by Scofield on 2008-07-30
		******************/
		//Added By Jay Chen 09-29-2014
		of_printout_pdf(ole_1.object.ActiveDocument)
		If ole_1.object.doctype > 0 Then ole_1.object.ActiveDocument.Saved = True //Added By Ken.Guo 2016-05-23. workaround Task 524
		ole_1.object.Close()
		//end
		
		// Copy to pdf file
		If not isvalid(lnv_filesvr) Then lnv_filesvr = create n_cst_filesrvwin32
		/*******************
		Do 
			Yield()
			If FileExists(ls_sourcefile) Then 
				li_file = FileOpen(ls_sourcefile, StreamMode!, Write!)
			Else
				li_file = -1
			End If
		Loop While li_file = -1
		FileClose(li_file)
		//lnv_filesvr.of_filecopy(ls_sourcefile, ls_path )
		filecopy(ls_sourcefile, ls_path ,true) //APB Blob Bug - jervis 03.23.2010
		*******************/
		of_copy_pdf_file(ls_sourcefile,ls_path) //Added By Jay Chen 09-29-2014

	CASE 'I2P' //Image to PDF format - alfee 11.21.2008
		SetPointer( HourGlass! )
		Openwithparm(w_appeon_gifofwait, "Saving as PDF...")
		// DownLoad source file
//		ls_filename = Parent.of_downloadfile(lstr_add_doc.doc_id )
		choose case ls_WinName
			case 'w_agreement_template_saveto_document'
				ls_filename = w_agreement_template_saveto_document.of_downloadfile(lstr_add_doc.doc_id )
			case 'w_doc_saveto_document'
				ls_filename = w_doc_saveto_document.of_downloadfile(lstr_add_doc.doc_id )
		end choose
		IF Isvalid(w_appeon_gifofwait) THEN w_appeon_gifofwait.event timer()
		//convert to PDF		
		IF inv_image_cp.of_convert2pdf(ls_filename, ls_path) = -1 THEN
			IF IsValid(w_appeon_gifofwait) THEN Close(w_appeon_gifofwait)
			MessageBox("Save As","Saving as a PDF format failed!")
		END IF
		IF IsValid(w_appeon_gifofwait) THEN Close(w_appeon_gifofwait)
END CHOOSE

Catch(Throwable th)
	IF ole_1.object.doctype > 0 THEN 
		If ole_1.object.doctype > 0 Then ole_1.object.ActiveDocument.Saved = True //Added By Ken.Guo 2016-05-23. workaround Task 524
		ole_1.object.Close()	//alfee 04.30.2007
	End If
	IF Isvalid(lnv_filesvr) THEN Destroy lnv_filesvr
	IF FileExists( ls_merge_file ) THEN FileDelete(ls_merge_file)
	IF Isvalid(w_appeon_gifofwait) THEN Close(w_appeon_gifofwait)
End Try

//------Modified by alfee 04.28.2007----------
IF ole_1.object.doctype > 0 THEN 
	If ole_1.object.doctype > 0 Then ole_1.object.ActiveDocument.Saved = True //Added By Ken.Guo 2016-05-23. workaround Task 524
	ole_1.object.Close()	//alfee 04.30.2007
End If
IF Isvalid(lnv_filesvr) THEN Destroy lnv_filesvr
IF FileExists( ls_merge_file ) THEN FileDelete(ls_merge_file)
IF Isvalid(w_appeon_gifofwait) THEN Close(w_appeon_gifofwait)
Post CloseWithReturn(Parent, 1) //for image2pdf, Alfee 11.21.2008 
//CloseWithReturn(Parent, 1)
//------End Modified--------------------------
end subroutine

public function integer of_delete_file (string as_file);//delete specifical temp file
IF FileExists(as_file) THEN 
	IF Not FileDelete(as_file) THEN 
		MessageBox("Convert to PDF Error", "Please delete the temp file of '" + as_file + "' first! ")				
		RETURN -1
	END IF
END IF

RETURN 1
end function

public function integer of_check_pdfprinter ();string ls_prntrs

//Check PDF Printer for Word dcoument
if f_PrinterSetup(2) >= 2 then 
	Return -1
end If
ls_prntrs = PrintGetPrinters ( )
IF NOT Pos(lower(ls_prntrs),lower("Contract Logix PDF Writer")) > 0 THEN
	MessageBox("Printer Error","The Contract Logix PDF Writer is not configured correctly!")	
	RETURN -2
END IF

Return 1
end function

public subroutine of_printout_pdf (oleobject aole_word);long ll_len
string ls_DefPrinter

if f_PrinterSetup(2) >= 2 then return
ll_Len = 100
ls_DefPrinter = SPACE(ll_Len)
GetDefaultPrinter(ls_DefPrinter,ll_Len)	//Added by Scofield on 2008-07-30
aole_word.Application.ActivePrinter = "Contract Logix PDF Writer"
aole_word.Printout( 0 )
//aole_word.Close(0)			
SetDefaultPrinter(ls_DefPrinter)				//Added by Scofield on 2008-07-30
end subroutine

public subroutine of_copy_pdf_file (string as_sourcefile, string as_targetfile);//copy temp pdf file to target file

integer li_file

Do 
	Yield()
	If FileExists(as_sourcefile) Then 
		li_file = FileOpen(as_sourcefile, StreamMode!, Write!)
	Else
		li_file = -1
	End If
Loop While li_file = -1

FileClose(li_file)
//lnv_filesvr.of_filecopy(ls_sourcefile, ls_path )
filecopy(as_sourcefile, as_targetfile ,true) //APB Blob Bug - jervis 03.23.2010
end subroutine

on n_cst_convert2pdf.create
this.ole_1=create ole_1
this.Control[]={this.ole_1}
end on

on n_cst_convert2pdf.destroy
destroy(this.ole_1)
end on

event destructor;//====================================================================
// Event: destructor
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	Jay Chen		Date: 09-29-2014
//--------------------------------------------------------------------
//	Copyright (c) 2008-2013 ContractLogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
Destroy inv_image_cp //alfee 11.21.2008

If isvalid(inv_clause) Then Destroy inv_clause
end event

event constructor;//====================================================================
// Event: constructor
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	Jay Chen		Date: 09-29-2014
//--------------------------------------------------------------------
//	Copyright (c) 2008-2013 ContractLogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
inv_image_cp  = Create n_cst_image_functions_cp  //Alfee 11.21.2008
inv_clause = Create n_cst_clause 

//Added By Ken.Guo 2011-11-30. Workaround Office OCX's bug
If isvalid(ole_1 ) Then
	ole_1.object.activate(true)
End If
end event

type ole_1 from u_email_edit within n_cst_convert2pdf
boolean visible = false
integer x = 128
integer y = 36
integer width = 773
integer height = 548
integer taborder = 10
string binarykey = "n_cst_convert2pdf.udo"
end type


Start of PowerBuilder Binary Data Section : Do NOT Edit
0An_cst_convert2pdf.bin 
2300000c00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdfffffffefffffffe00000004fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff0000000100000000000000000000000000000000000000000000000000000000f285f4f001d1b4c400000003000002800000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000102001affffffff00000002ffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000011800000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000001001affffffffffffffff00000003d267e82f41ee8649010521915f71b13000000000f285f4f001d1b4c4f285f4f001d1b4c40000000000000000000000000054004e004f004b0066004f0069006600650063007400430053006c006d0074000000000000000000000000000000000000000000000000000000000000000001020022ffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000005000001180000000000000001000000020000000300000004fffffffe00000006000000070000000800000009fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
22ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff1234abcd0000117700000e298000001080000005800000088000001080000014010100010000000000000000000000000000000000000000000000000000000000000001000000000000000000000001000000010000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff000000000000000100c8d0d4000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000f6e6d300e3ba9200000000000000000000000000000001000000000000000100000000000003a8000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000000000000100000000000000000062007900730061005c00650068005300720061006400650053005c0062007900730061002000651234abcd0000117700000e298000001080000005800000088000001080000014010100010000000000000000000000000000000000000000000000000000000000000001000000000000000000000001000000010000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff000000000000000100c8d0d4000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000f6e6d300e3ba9200000000000000000000000000000001000000000000000100000000000003a80000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000050000004d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1An_cst_convert2pdf.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
