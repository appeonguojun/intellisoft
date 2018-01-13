$PBExportHeader$u_email_edit.sru
forward
global type u_email_edit from olecustomcontrol
end type
end forward

global type u_email_edit from olecustomcontrol
integer width = 1623
integer height = 976
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
string binarykey = "u_email_edit.udo"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
event onfilecommand ( integer item,  ref boolean iscancel )
event ondocumentopened ( string file,  oleobject document )
event ondocumentclosed ( )
event afterpreviewclosed ( )
event onstatuschange ( string statustext,  any statuscode )
event onwebgetfinished ( string retdata )
event onwebexecutefinished ( string retdata )
event oncustommenucmd ( long menuindex,  string menucaption,  long mymenuid )
event oncustomfilemenucmd ( long menuindex,  string menucaption,  long mymenuid )
event afterhandsignordraw ( long draworsign,  boolean iscanceled )
event afterchecksign ( )
event onsignselect ( boolean isvalidsign,  string signinfo )
event onsheetselectionchange ( string sheetname,  long row,  long col )
event onsheetbeforedoubleclick ( string sheetname,  long row,  long col,  ref boolean iscancel )
event onsheetbeforerightclick ( string sheetname,  long row,  long col,  ref boolean iscancel )
event onwordwpsselchange ( oleobject selection )
event onsheetchange ( string sheetname,  long row,  long col )
event oncustommenucmd2 ( long menupos,  long submenupos,  long subsubmenupos,  string menucaption,  long mymenuid )
event afteropenfromurl ( oleobject document )
event beforeoriginalmenucommand ( string menutitle,  ref boolean iscancel )
event beforeaddsign ( string signname,  string signuser,  ref boolean iscancel )
event ondocactivated ( boolean isactivated )
event onprintprnfromurlevent ( long statuscode,  string url,  string docname,  string moreinfo )
event onwordbeforerightclick ( oleobject selection,  ref boolean iscancel )
event oncustombuttononmenucmd ( long btnpos,  string btncaption,  long btncmdid )
event onwordbeforedoubleclick ( oleobject selection,  boolean iscancel )
end type
global u_email_edit u_email_edit

type prototypes

end prototypes

type variables
String is_filepath
String is_fkeyword = "$$<|" , is_lkeyword = "|>$$" 
String is_findkey = '$$\<|*|\>$$'

Boolean ib_trigger_event = true //Added By Ken.Guo 2016-10-27
end variables

forward prototypes
public function integer of_open ()
public function string of_gethtmlfile ()
public function integer of_close ()
public function string of_getemaildir ()
public function integer of_open (ref blob ablb_data)
public function integer of_inserttextfirst (string as_text)
public function integer of_open (string as_text, boolean ab_isfile)
public function integer of_insertfilefirst (string as_filename)
public function integer of_insertfilefirst (ref blob ablb_data)
public function integer of_getblob (ref blob ablb_data)
public function integer of_readfile (string as_file, ref blob ablb_data)
public function integer of_writefile (string as_filename, ref blob ablb_data)
public function integer of_open (string as_userid)
public function integer of_insertfilelast (ref blob ablb_data)
public function integer of_insertfilelast (string as_filename)
public function integer of_inserttextlast (string as_text)
public function integer of_open_buffer (ref blob ablb_data)
public function integer of_insertfilelast (string as_filename, boolean ab_insertbreak)
public function integer of_inserttextlast (string as_text, boolean ab_insertbreak)
public function string of_gettempfile ()
public function integer of_get_keyword (ref string as_ctx_id, ref string as_doc_id, ref string as_ai_id)
public function integer of_add_keyword (string as_ctx_id, string as_doc_id, string as_ai_id)
public function boolean of_checkreplace ()
public function string of_gettxtfile ()
public function string of_gettempfile (string as_filename, string as_fileext)
public function integer of_doc2htm (string as_docname, string as_htmlname)
public subroutine of_set_trigger_event (boolean ab_value)
end prototypes

event oncustombuttononmenucmd(long btnpos, string btncaption, long btncmdid);//====================================================================
// Event: oncustombuttononmenucmd
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value    long      btnpos
// 	value    string    btncaption
// 	value    long      btncmdid
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:	Gavin.Jay		Date: 2017-04-19
//--------------------------------------------------------------------
//	Copyright (c) 2008-2016 Contractlogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
end event

event onwordbeforedoubleclick(oleobject selection, boolean iscancel);//====================================================================
// Event: onwordbeforedoubleclick
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value    oleobject    selection
// 	value    boolean      iscancel
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:	Gavin.Jay		Date: 2017-04-19
//--------------------------------------------------------------------
//	Copyright (c) 2008-2016 Contractlogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

end event

public function integer of_open ();Return of_Open("", false)
end function

public function string of_gethtmlfile ();string ls_FileName_htm

//Begin - Modified By Ken.Guo 12/11/2013
//// Save as HTML file
//ls_FileName_htm = of_GetEmailDir() + "\Email.htm"
////ls_FileName_htm = is_filepath + "\Email.htm"
////Added By Ken.Guo 2010-01-07.
//If FileExists(ls_FileName_htm) Then
//	If Not FileDelete(ls_FileName_htm) Then
//		Messagebox('Delete Temporary File','Failed to delete the temporary file "' +ls_FileName_htm+ '". ~r~nThis will cause your WindWord.exe process to be locked up.  Please open Windows Task Manager (Ctrl-Alt-Del to bring up option to open Task Manager).  Click on the Process tab and look for the WINWORD.exe process and right click on that entry and click End Process.',Exclamation!)
//		Return ''
//	End If
//End If
ls_FileName_htm = This.of_gettempfile( 'Email', 'htm')
If ls_FileName_htm = '' Then Return ''
//End - Modified By Ken.Guo 12/11/2013

this.object.ActiveDocument.Application.NormalTemplate.Saved = TRUE //Added By Ken.Guo 2010-01-07.
If gs_ImageView_Version <> '4.0' Then This.Object.FileSave = True
this.object.ActiveDocument.SaveAs(ls_FileName_htm, 10,false,'',false)

//Added By Ken.Guo 2015-09-08
String ls_FileName_doc
//If Not FileExists(ls_FileName_doc) Then
If Not FileExists(ls_FileName_htm) Then //Modified By Jay Chen 10-19-2015
	ls_FileName_doc = This.of_gettempfile( 'Email', 'doc')
	this.object.ActiveDocument.SaveAs(ls_FileName_doc, 0,false,'',false)
	If FileExists(ls_FileName_doc) Then
		of_doc2htm(ls_FileName_doc,ls_FileName_htm)
	Else
		gnv_debug.of_output(True, 'Failed to save doc&htm. ')
	End If
End If

If gs_ImageView_Version <> '4.0' Then This.Object.FileSave = False
gnv_shell.of_delete_recent( ls_FileName_htm, true) //Added By Ken.Guo 2010-05-25. Delete Windows Recent Document.
Return ls_FileName_htm

end function

public function integer of_close ();////Restore to dispaly horizontal scrollbar - Alfee 11.27.2007
//If this.object.DocType = 1 THEN 
//	this.object.ActiveDocument.ActiveWindow.DisplayHorizontalScrollBar = TRUE
//End If

If this.object.doctype > 0 Then this.object.ActiveDocument.Saved = True //Added By Ken.Guo 2016-05-23. workaround Task 524
this.object.Close()

Return 1
end function

public function string of_getemaildir ();string ls_OldDirectory
string ls_EmailDirectory
string ls_ContractDirectory

//-------------Begin Modified by Alfee 03.27.2008----------
/*
ls_ContractDirectory = gs_dir_path + gs_DefDirName
ls_EmailDirectory = ls_ContractDirectory + "\Email"
ls_OldDirectory = GetCurrentDirectory()

if DirectoryExists(ls_ContractDirectory) = false then	
	ChangeDirectory(gs_dir_path)
	if CreateDirectory(gs_DefDirName) = -1 then Return ""
end if

if DirectoryExists(ls_EmailDirectory) = false then		
	ChangeDirectory(ls_ContractDirectory)
	if CreateDirectory("Email") = -1 then Return ""
end if

ChangeDirectory(ls_OldDirectory)
*/
ls_EmailDirectory = gs_dir_path + gs_DefDirName + "\Email"
gnv_appeondll.of_parsepath(ls_EmailDirectory)
IF NOT DirectoryExists(ls_EmailDirectory) THEN RETURN ""
//-------------End Modified ----------------------------------

Return ls_EmailDirectory
end function

public function integer of_open (ref blob ablb_data);string ls_FileName 

/*
// Create a local file
ls_FileName = of_GetEmailDir() + "\Temp8.doc"

is_filepath = of_GetEmailDir() 

//Added By Ken.Guo 2010-01-07.
If FileExists(ls_filename) Then
	If Not FileDelete(ls_filename) Then
		Messagebox('Delete Temporary File','Failed to delete the temporary file "' +ls_filename+ '". ~r~nThis will cause your WindWord.exe process to be locked up.  Please open Windows Task Manager (Ctrl-Alt-Del to bring up option to open Task Manager).  Click on the Process tab and look for the WINWORD.exe process and right click on that entry and click End Process.',Exclamation!)
		Return -1
	End If
End If

String ls_FileName1
ls_FileName1 = of_GetEmailDir() + "\~~$Temp8.doc"
If FileExists(ls_FileName1) Then
	FileDelete(ls_FileName1)
End If
*/

//Added By Ken.Guo 2011-07-06. 
If len(ablb_Data) = 0 or isnull(ablb_Data) Then 
	This.of_open()
End If

ls_FileName = of_gettempfile()
If ls_filename = '' Then Return -1

if of_WriteFile(ls_FileName, ablb_Data) = -1 then Return -1

// Open file
Return of_Open(ls_FileName, true)
end function

public function integer of_inserttextfirst (string as_text);//----------Begin Modified by Alfee 03.27.2008-------------------------
//Insert text at the begining of the document
IF This.Object.DocType <> 1 THEN RETURN -1
IF IsNull(as_text) or Len(as_text) < 1 THEN RETURN 1

This.Object.ActiveDocument.Range(0,0).InsertBefore(as_text + '~r~n')

Return 1
/*
blob lblb_Data
string ls_FileName
OLEObject lole_Selection

// Write text to a word document
lblb_Data = Blob(as_Text)
ls_FileName = of_GetEmailDir() + "\Temp.doc"
if of_WriteFile(ls_FileName, lblb_Data) = -1 then Return -1

// Insert file first
Return of_InsertFileFirst(ls_FileName)
*/
//-------------End Modified -------------------------------------------
end function

public function integer of_open (string as_text, boolean ab_isfile);blob lblb_Data
string ls_FileName 
OLEObject lole_Window
integer li_FileNum
string ls_Emp_Input


// Create a word document
TRY //alfee 12.11.2008

If this.object.doctype > 0 Then this.object.ActiveDocument.Saved = True //Added By Ken.Guo 2016-05-23. workaround Task 524
this.object.Close()	//Added By Ken.Guo 2015-09-08.

if ab_IsFile then
	IF Not FileExists(as_text) THEN 
		gnv_debug.of_output(True, 'u_email_edit.of_open(). Failed to open the file as it is not exists. ' + as_text) //Added By Ken.Guo 2015-09-08
		RETURN -1 //Alfee 03.27.2008
	End If	
	
	//Modified By Ken.Guo 10/26/2012. Added support txt file.
	//this.object.OpenLocalFile(as_Text, true)
	//is_filepath = Mid(as_text,1,lastpos(as_Text,'\') - 1 )
	If Lower(Right(as_Text,4)) = '.txt' Then 
		//Write text to word control		
		of_readfile(as_text,lblb_Data)
		ls_Emp_Input = String(lblb_Data)
		of_open()
		This.of_inserttextfirst( ls_Emp_Input)
	Else
		app_filler.of_set_word_safemode(false, 1) //Added By Ken.Guo 2015-07-30
		If this.object.doctype > 0 Then this.object.ActiveDocument.Saved = True //Added By Ken.Guo 2016-05-23. workaround Task 524
		this.object.OpenLocalFile(as_Text, true)
		app_filler.of_set_word_safemode(false, 0) //Added By Ken.Guo 2015-07-30
		
		//Added By Ken.Guo 2015-09-08. check it.
		If This.object.doctype = 0 Then
			gnv_debug.of_output(true, 'NTKO control cannot open the file ' + as_text)
			Return -1
		End If
	
		gnv_word_utility.of_modify_word_property( this.object.ActiveDocument)	//Added By Mark Lee 06/20/2013 change for office 2013.
		is_filepath = Mid(as_text,1,lastpos(as_Text,'\') - 1 )
	End If
		
else
	if Len(as_Text) > 0 then
		lblb_Data = Blob(as_Text)
		ls_FileName = of_gettempfile()
		If ls_filename = '' Then Return -21
	
		if of_WriteFile(ls_FileName, lblb_Data) = -1 then Return -22
		
		//this.object.OpenLocalFile(ls_FileName, false) //Modified By Ken.Guo 2010-01-07
		app_filler.of_set_word_safemode(false, 1) //Added By Ken.Guo 2015-07-30
		If this.object.doctype > 0 Then this.object.ActiveDocument.Saved = True //Added By Ken.Guo 2016-05-23. workaround Task 524
		this.object.OpenLocalFile( ls_FileName, true) 
		app_filler.of_set_word_safemode(false, 0) //Added By Ken.Guo 2015-07-30
		gnv_word_utility.of_modify_word_property( this.object.ActiveDocument)	//Added By Mark Lee 06/20/2013 change for office 2013.		
	else
		//this.object.CreateNew("Word.Document") //Alfee 08.20.2008
		//----------Begin Added by Alfee 11.26.2007------------------
		//<$Reason>to support Word 2007, save as word 2003 format, it's 
		//<$Reason>necessary that close and re-open the the document
		IF gs_word_version = 'word2007' THEN
			//--------------Begin Modified by Alfee 08.20.2008-----------
			ls_FileName = of_GetEmailDir() + "\Empty.doc"				
			IF NOT FileExists(ls_FileName) THEN
				If this.object.doctype > 0 Then this.object.ActiveDocument.Saved = True //Added By Ken.Guo 2016-05-30. workaround Task 524
				this.object.CreateNew("Word.Document")
				this.object.ActiveDocument.Application.NormalTemplate.Saved = TRUE //Added By Ken.Guo 2010-01-07.
				If gs_ImageView_Version <> '4.0' Then This.Object.FileSave = True
				this.object.ActiveDocument.SaveAs(ls_FileName, 0,false,'',false) //Word 2003 format
				If gs_ImageView_Version <> '4.0' Then This.Object.FileSave = False
				gnv_shell.of_delete_recent( ls_FileName, true) //Added By Ken.Guo 2010-05-25. Delete Windows Recent Document.
				If this.object.doctype > 0 Then this.object.ActiveDocument.Saved = True //Added By Ken.Guo 2016-05-23. workaround Task 524
				this.object.Close()
				Do 
					Yield()
					IF FileExists(ls_FileName) THEN 
						app_filler.of_set_word_safemode(false, 1) //Added By Ken.Guo 2015-07-30
						If this.object.doctype > 0 Then this.object.ActiveDocument.Saved = True //Added By Ken.Guo 2016-05-23. workaround Task 524
						this.object.openLocalFile(ls_FileName , true)	
						app_filler.of_set_word_safemode(false, 0) //Added By Ken.Guo 2015-07-30
					End IF 
				Loop While this.object.doctype <> 1	
			ELSE
				app_filler.of_set_word_safemode(false, 1) //Added By Ken.Guo 2015-07-30
				If this.object.doctype > 0 Then this.object.ActiveDocument.Saved = True //Added By Ken.Guo 2016-05-23. workaround Task 524
				this.object.openLocalFile(ls_FileName , true)		
				app_filler.of_set_word_safemode(false, 0) //Added By Ken.Guo 2015-07-30
			END IF	
			gnv_word_utility.of_modify_word_property( this.object.ActiveDocument)	//Added By Mark Lee 06/20/2013 change for office 2013.				
		ELSE 
			If this.object.doctype > 0 Then this.object.ActiveDocument.Saved = True //Added By Ken.Guo 2016-05-30. workaround Task 524
			this.object.CreateNew("Word.Document")
			//--------------End Modified ---------------------------------			
		END IF			
		//----------End Added ----------------------------------------						
	end if
end if

CATCH (Throwable th1) //Alfee 12.11.2008
	RETURN -23
END TRY


TRY //Alfee 03.27.2008

// Get window object
lole_Window = this.object.ActiveDocument.ActiveWindow

this.object.ActiveDocument.Application.NormalTemplate.Saved = TRUE //Added By Ken.Guo 2010-01-07.

//-----Begin Modified by Alfee 11.30.2007---
//Set view type as Normal View(Not WebView) 
//lole_Window.View.Type = 6
lole_Window.View.Type = 1 //wdNormalView
//-----End Modified ------------------------

// Hide rulers
lole_Window.DisplayRulers = false

//Hide paragraphs - Alfee 01.09.2008
lole_Window.ActivePane.View.ShowParagraphs = FALSE

////Hide horizontal scrollbar - Alfee 11.27.2007
//lole_Window.DisplayHorizontalScrollBar = FALSE

//Hide Document Map - Jervis 04.21.2009
lole_window.DocumentMap = False

//Added By Ken.Guo 10/11/2011. 
lole_window.View.Zoom.Percentage = 100

//Hide styles' commandbars for current document - Alfee 11.27.2007
IF this.object.ActiveDocument.CommandBars.Item("Formatting").Controls.Item[2].ID = 1732 AND &
	this.object.ActiveDocument.CommandBars.Item("Formatting").Controls.Item[2].Visible THEN
	this.object.ActiveDocument.CommandBars.Item("Formatting").Controls.Item[2].Visible = FALSE
END IF
IF this.object.ActiveDocument.CommandBars.Item("Formatting").Controls.Item[1].ID = 5757 AND &
	this.object.ActiveDocument.CommandBars.Item("Formatting").Controls.Item[1].Visible THEN
	this.object.ActiveDocument.CommandBars.Item("Formatting").Controls.Item[1].Visible = FALSE
END IF

CATCH (Throwable th) //Alfee 03.27.2008
	Destroy lole_window	
	Return 24
END TRY

Return 1
end function

public function integer of_insertfilefirst (string as_filename);blob lblb_Data
string ls_FileName
OLEObject lole_Selection

// Insert file first
lole_Selection = this.object.ActiveDocument.ActiveWindow.Selection
lole_Selection.GoTo(1, 1)
lole_Selection.InsertFile(as_FileName)
gnv_shell.of_delete_recent( as_FileName, true) //Added By Ken.Guo 2010-05-25. Delete Windows Recent Document.
lole_Selection.InsertParagraphBefore()

Return 1
end function

public function integer of_insertfilefirst (ref blob ablb_data);string ls_FileName

/*
// Create a local file
ls_FileName = of_GetEmailDir() + "\Temp2.doc"

//Added By Ken.Guo 2010-01-07.
If FileExists(ls_filename) Then
	If Not FileDelete(ls_filename) Then
		Messagebox('Delete Temporary File','Failed to delete the temporary file "' +ls_filename+ '". ~r~nThis will cause your WindWord.exe process to be locked up.  Please open Windows Task Manager (Ctrl-Alt-Del to bring up option to open Task Manager).  Click on the Process tab and look for the WINWORD.exe process and right click on that entry and click End Process.',Exclamation!)
		Return -1
	End If
End If
String ls_FileName1
ls_FileName1 = of_GetEmailDir() + "\~~$Temp2.doc"
If FileExists(ls_FileName1) Then
	FileDelete(ls_FileName1)
End If
*/
ls_FileName = of_gettempfile()
If ls_filename = '' Then Return -1

if of_WriteFile(ls_FileName, ablb_Data) = -1 then Return -1

// Insert file first
Return of_InsertFileFirst(ls_FileName)
end function

public function integer of_getblob (ref blob ablb_data);string ls_FileName
Blob lb_ini   //Added By Ken.Guo 2009-05-14

/*
// Create a local file
ls_FileName = of_GetEmailDir() + "\Temp7.doc"

//Added By Ken.Guo 2010-01-07.
If FileExists(ls_filename) Then
	If Not FileDelete(ls_filename) Then
		Messagebox('Delete Temporary File','Failed to delete the temporary file "' +ls_filename+ '". ~r~nThis will cause your WindWord.exe process to be locked up.  Please open Windows Task Manager (Ctrl-Alt-Del to bring up option to open Task Manager).  Click on the Process tab and look for the WINWORD.exe process and right click on that entry and click End Process.',Exclamation!)
		Return -1
	End If
End If
String ls_FileName1
ls_FileName1 = of_GetEmailDir() + "\~~$Temp7.doc"
If FileExists(ls_FileName1) Then
	FileDelete(ls_FileName1)
End If
*/
ls_FileName = of_gettempfile()
If ls_filename = '' Then Return -1

//this.object.SaveToLocal(ls_FileName, true) //This statement will lock file
this.object.ActiveDocument.Application.NormalTemplate.Saved = TRUE //Added By Ken.Guo 2010-01-07.
If gs_ImageView_Version <> '4.0' Then This.Object.FileSave = True
this.object.ActiveDocument.SaveAs(ls_FileName, 0,false,'',false) //Word 2003 format
If gs_ImageView_Version <> '4.0' Then This.Object.FileSave = False
gnv_shell.of_delete_recent( ls_FileName, true) //Added By Ken.Guo 2010-05-25. Delete Windows Recent Document.
//END---Modify by Evan on 06/18/2008

ablb_Data = lb_ini //Added By Ken.Guo 2009-05-14. Must reset blob value.
Return of_ReadFile(ls_FileName, ablb_Data)
end function

public function integer of_readfile (string as_file, ref blob ablb_data);//Modified By Ken.Guo 2010-05-12
n_cst_dm_utils lnv_dm_utils
Return lnv_dm_utils.of_readblob( as_file, ablb_data)

/*
long ll_Byte
integer li_FileNum
blob lblb_Buf

li_FileNum = FileOpen(as_File, StreamMode!, Read!, Shared!)
if li_FileNum = -1 then 
	SetNull(ablb_Data)
	Return -1
end if

do
	ll_Byte = FileRead(li_FileNum, lblb_Buf)
	if ll_Byte > 0 then
		ablb_Data += lblb_Buf
	else
		Exit
	end if
loop while true
FileClose(li_FileNum)
*/
Return 1
end function

public function integer of_writefile (string as_filename, ref blob ablb_data);//Modified By Ken.Guo 2010-05-12
n_cst_dm_utils lnv_dm_utils
Return lnv_dm_utils.of_saveblob( as_filename, ablb_data)

/*
blob lblb_Buf
long ll_BlobLen
long ll_CurrentPos
long l, ll_Writes
integer li_FileNum

//Parse path
gnv_appeondll.of_parsepath(as_FileName) //jervis 07.22.2009

// Create a local file
//---------Begin Modified by Alfee 03.27.2008------------------------------------
li_FileNum = FileOpen(as_FileName, StreamMode!, Write!, LockWrite!, Replace!)
if IsNull(li_FileNum) or li_FileNum < 0 then Return -1
//li_FileNum = FileOpen(as_FileName, StreamMode!, Write!, LockReadWrite!, Replace!)
//if li_FileNum < 0 then Return -1
//---------End Modified ---------------------------------------------------------

ll_BlobLen = Len(ablb_Data)

// Write data
if ll_BlobLen > 0 then
	if ll_BlobLen > 32765 then
		 if Mod(ll_BlobLen, 32765) = 0 then
			 ll_Writes = ll_BlobLen / 32765
		 else
			 ll_Writes = (ll_BlobLen / 32765) + 1
		 end if
	else
		ll_Writes = 1
	end if
	ll_CurrentPos = 1
	
	For l = 1 To ll_Writes
		lblb_Buf = BlobMid(ablb_Data, ll_CurrentPos, 32765)
		ll_CurrentPos += 32765
		if FileWrite(li_FileNum, lblb_Buf) = -1 then
			FileClose(li_FileNum) //Alfee 03.27.2008
			Return -1
		end if
	Next
end if

// Close file
FileClose(li_FileNum)

Return 1
*/
end function

public function integer of_open (string as_userid);long	ll_EMail_Id,ll_DataLen,ll_Cycle,ll_Count,ll_Start,ll_Rtn
Blob	lblb_Signature,lb_Temp

long 	READ_ONE_LENGTH = 8000

SELECT Datalength(security_user_mailsetting.signature)
  INTO :ll_DataLen
  FROM security_user_mailsetting
 WHERE security_user_mailsetting.user_id = :as_UserID;

// Get signature from user ID
if AppeonGetClientType() = 'PB' and gs_dbtype = 'SQL' and ll_DataLen > READ_ONE_LENGTH then
	ll_Count = Ceiling(ll_DataLen/READ_ONE_LENGTH)
	
	for ll_Cycle = 1 To ll_Count
		ll_Start = (ll_Cycle - 1) * READ_ONE_LENGTH + 1
		SELECTBLOB SubString(signature,:ll_Start,:READ_ONE_LENGTH)
		      INTO :lb_Temp
		      FROM security_user_mailsetting
		     WHERE security_user_mailsetting.user_id = :as_UserID;
		
		lblb_Signature += lb_Temp
	next
else
	SELECTBLOB signature
	      INTO :lblb_Signature
	      FROM security_user_mailsetting
	     WHERE security_user_mailsetting.user_id = :as_UserID;
end if

// Open file
if Len(lblb_Signature) > 0 then
	ll_Rtn = of_Open(lblb_Signature)
else
	ll_Rtn = of_Open()
end if

Return ll_Rtn

end function

public function integer of_insertfilelast (ref blob ablb_data);string ls_FileName

/*
// Create a local file
ls_FileName = of_GetEmailDir() + "\Temp3.doc"

//Added By Ken.Guo 2010-01-07.
If FileExists(ls_filename) Then
	If Not FileDelete(ls_filename) Then
		Messagebox('Delete Temporary File','Failed to delete the temporary file "' +ls_filename+ '". ~r~nThis will cause your WindWord.exe process to be locked up.  Please open Windows Task Manager (Ctrl-Alt-Del to bring up option to open Task Manager).  Click on the Process tab and look for the WINWORD.exe process and right click on that entry and click End Process.',Exclamation!)
		Return -1
	End If
End If
String ls_FileName1
ls_FileName1 = of_GetEmailDir() + "\~~$Temp3.doc"
If FileExists(ls_FileName1) Then
	FileDelete(ls_FileName1)
End If
*/
ls_FileName = of_gettempfile()
If ls_filename = '' Then Return -1

if of_WriteFile(ls_FileName, ablb_Data) = -1 then Return -1

// Insert file last
Return of_InsertFileLast(ls_FileName)

end function

public function integer of_insertfilelast (string as_filename);Return of_insertfilelast(as_filename,true)
/*
blob 			lblb_Data
string 		ls_FileName
OLEObject 	lole_Selection

//--------Begin Modified by Alfee 01.26.2008----------------------
Constant Long wdCollapseEnd = 0
Constant long wdSectionBreakContinuous = 3

If This.Object.DocType <> 1 THEN RETURN -1
If Not FileExists(as_filename) THEN RETURN -1

TRY

This.Object.ActiveDocument.Content.Select()
lole_Selection = This.Object.ActiveDocument.Activewindow.Selection
//Insert the specified file at the end
lole_Selection.Collapse(wdCollapseEnd)
lole_Selection.InsertBreak(wdSectionBreakContinuous)	
lole_Selection.InsertParagraphAfter()
lole_Selection.InsertFile(as_filename)
lole_Selection.Expand()

CATCH(Throwable th)
	RETURN -1	
END TRY
/* lole_Selection = this.object.ActiveDocument.ActiveWindow.Selection
lole_Selection.GoTo(3, -1)
lole_Selection.InsertParagraphAfter()
lole_Selection.InsertFile(as_FileName)  */
//--------End Modified ------------------------------------------

Return 1
*/

end function

public function integer of_inserttextlast (string as_text);Return of_inserttextlast(as_text,True)
/*
blob 			lblb_Data
string		ls_FileName
OLEObject 	lole_Selection

// Write text to a word document
lblb_Data = Blob(as_Text)
ls_FileName = of_GetEmailDir() + "\Temp4.doc"

//Added By Ken.Guo 2010-01-07.
If FileExists(ls_filename) Then
	If Not FileDelete(ls_filename) Then
		Messagebox('Delete Temporary File','Failed to delete the temporary file "' +ls_filename+ '". ~r~nThis will cause your WindWord.exe process to be locked up.  Please open Windows Task Manager (Ctrl-Alt-Del to bring up option to open Task Manager).  Click on the Process tab and look for the WINWORD.exe process and right click on that entry and click End Process.',Exclamation!)
		Return -1
	End If
End If

if of_WriteFile(ls_FileName, lblb_Data) = -1 then Return -1

// Insert file last
Return of_InsertFileLast(ls_FileName)
*/

end function

public function integer of_open_buffer (ref blob ablb_data);//For the case of opening documents continuously, e.g. email notification, 
//it needs a buffer time. - Added by Alfee on 07.08.2008

string ls_FileName 

/*
// Create a local file
ls_FileName = of_GetEmailDir() + "\Temp6.doc"

is_filepath = of_GetEmailDir()

//Added By Ken.Guo 2010-01-07.
If FileExists(ls_filename) Then
	If Not FileDelete(ls_filename) Then
		Messagebox('Delete Temporary File','Failed to delete the temporary file "' +ls_filename+ '". ~r~nThis will cause your WindWord.exe process to be locked up.  Please open Windows Task Manager (Ctrl-Alt-Del to bring up option to open Task Manager).  Click on the Process tab and look for the WINWORD.exe process and right click on that entry and click End Process.',Exclamation!)
		Return -1
	End If
End If
String ls_FileName1
ls_FileName1 = of_GetEmailDir() + "\~~$Temp6.doc"
If FileExists(ls_FileName1) Then
	FileDelete(ls_FileName1)
End If
*/
ls_FileName = of_gettempfile()
If ls_filename = '' Then Return -11

If Not isnull(ablb_Data) Then
	if of_WriteFile(ls_FileName, ablb_Data) = -1 then Return -12
Else
	Return of_Open('')
End If

DO While Not FileExists(ls_FileName)
	Yield( )
LOOP
Yield( )

// Open file
Return of_Open(ls_FileName, true)
end function

public function integer of_insertfilelast (string as_filename, boolean ab_insertbreak);//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 2010-04-13 By: Ken.Guo
//$<reason> Add ab_insertbreak Parm
//---------------------------- APPEON END ----------------------------

blob 			lblb_Data
string 		ls_FileName
OLEObject 	lole_Selection

//--------Begin Modified by Alfee 01.26.2008----------------------
Constant Long wdCollapseEnd = 0
Constant long wdSectionBreakContinuous = 3

If This.Object.DocType <> 1 THEN RETURN -1
If Not FileExists(as_filename) THEN RETURN -1

TRY

This.Object.ActiveDocument.Content.Select()
lole_Selection = This.Object.ActiveDocument.Activewindow.Selection
//Insert the specified file at the end
lole_Selection.Collapse(wdCollapseEnd)
If ab_insertbreak Then
	lole_Selection.InsertBreak(wdSectionBreakContinuous)	
	lole_Selection.InsertParagraphAfter()
End If
lole_Selection.InsertFile(as_filename)
gnv_shell.of_delete_recent( as_filename, true) //Added By Ken.Guo 2010-05-25. Delete Windows Recent Document.
lole_Selection.Expand()

CATCH(Throwable th)
	RETURN -1	
END TRY
/* lole_Selection = this.object.ActiveDocument.ActiveWindow.Selection
lole_Selection.GoTo(3, -1)
lole_Selection.InsertParagraphAfter()
lole_Selection.InsertFile(as_FileName)  */
//--------End Modified ------------------------------------------

Return 1

end function

public function integer of_inserttextlast (string as_text, boolean ab_insertbreak);//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 2010-04-13 By: Ken.Guo
//$<reason> Add ab_insertbreak parm
//---------------------------- APPEON END ----------------------------

blob 			lblb_Data
string		ls_FileName
OLEObject 	lole_Selection

// Write text to a word document
lblb_Data = Blob(as_Text)

/*
ls_FileName = of_GetEmailDir() + "\Temp4.doc"

//Added By Ken.Guo 2010-01-07.
If FileExists(ls_filename) Then
	If Not FileDelete(ls_filename) Then
		Messagebox('Delete Temporary File','Failed to delete the temporary file "' +ls_filename+ '". ~r~nThis will cause your WindWord.exe process to be locked up.  Please open Windows Task Manager (Ctrl-Alt-Del to bring up option to open Task Manager).  Click on the Process tab and look for the WINWORD.exe process and right click on that entry and click End Process.',Exclamation!)
		Return -1
	End If
End If
String ls_FileName1
ls_FileName1 = of_GetEmailDir() + "\~~$Temp4.doc"
If FileExists(ls_FileName1) Then
	FileDelete(ls_FileName1)
End If
*/
ls_FileName = of_gettempfile()
If ls_filename = '' Then Return -1

if of_WriteFile(ls_FileName, lblb_Data) = -1 then Return -1

// Insert file last
Return of_InsertFileLast(ls_FileName,ab_insertbreak)

end function

public function string of_gettempfile ();//Modified By Ken.Guo 12/11/2013
Return of_gettempfile('Temp','doc')

////////////////////////////////////////////////////////////////////////
//// $<function>u_email_editof_gettempfile()
//// $<arguments>(None)
//// $<returns> string
//// $<description> Get the new temp file.
//// $<description>
////////////////////////////////////////////////////////////////////////
//// $<add> 2010-10-11 by Ken.Guo
////////////////////////////////////////////////////////////////////////
//
//String ls_FileName,ls_FileName1
//Long i,ll_max
//
//ll_max = 1000 //max try times.
//is_filepath = of_GetEmailDir() 
//
//For i = 1 To ll_max
//	ls_FileName = of_GetEmailDir() + "\Temp" + String(i) + ".doc"
//	If FileExists(ls_filename) Then
//		If Not FileDelete(ls_filename) Then
//			If i = ll_max Then
//				Messagebox('Delete Temporary File','Failed to delete the temporary file "Temp*.doc". ~r~nThis will cause your WindWord.exe process to be locked up.  Please open Windows Task Manager (Ctrl-Alt-Del to bring up option to open Task Manager).  Click on the Process tab and look for the WINWORD.exe process and right click on that entry and click End Process.',Exclamation!)
//				Return ''
//			End If
//			Continue
//		End If
//	End If
//	
//	ls_FileName1 = of_GetEmailDir() + "\~~$Temp" + String(i) + ".doc"	
//	If FileExists(ls_filename1) Then
//		If Not FileDelete(ls_filename1) Then
//			If i = ll_max Then
//				Messagebox('Delete Temporary File','Failed to delete the temporary file "Temp*.doc". ~r~nThis will cause your WindWord.exe process to be locked up.  Please open Windows Task Manager (Ctrl-Alt-Del to bring up option to open Task Manager).  Click on the Process tab and look for the WINWORD.exe process and right click on that entry and click End Process.',Exclamation!)
//				Return ''
//			End If
//			Continue
//		End If
//	End If
//	
//	Return ls_FileName
//	
//Next
//
//Return ''
end function

public function integer of_get_keyword (ref string as_ctx_id, ref string as_doc_id, ref string as_ai_id);Boolean lb_find
String ls_text   
//'$$<|CTX_ID = ###, DOC_ID = ###, AI_ID = ###|>$$'
//'$$<|CTX_ID = ###,### & DOC_ID = ###,### & AI_ID = ###|>$$'
Long ll_pos1,ll_pos2,ll_pos3
Long ll_pos11,ll_pos22,ll_pos33


This.object.ActiveDocument.Content.Select()
lb_find = This.object.ActiveDocument.Activewindow.Selection.Find.Execute(is_findkey,True,False,True,False,False,True)
If Not lb_find Then Return -1

Do While lb_find
	ls_text = String(This.object.ActiveDocument.Activewindow.Selection.Text)
	lb_find = This.object.ActiveDocument.Activewindow.Selection.Find.Execute(is_findkey,True,False,True,False,False,True)
Loop

This.object.ActiveDocument.Activewindow.Selection.End = This.object.ActiveDocument.Activewindow.Selection.Start
This.object.ActiveDocument.Activewindow.Selection.Goto(1,1)
ll_pos1 = Pos(ls_text,'=')
If ll_pos1 <= 0 Then Return -1
ll_pos2 = Pos(ls_text,'=',ll_pos1 + 1)
If ll_pos2 <= 0 Then Return -1
ll_pos3 = Pos(ls_text,'=',ll_pos2 + 1)
If ll_pos3 <= 0 Then Return -1

ll_pos11 = Pos(ls_text,'&') 
If ll_pos11 <= 0 Then Return -1
ll_pos22 = Pos(ls_text,'&',ll_pos11 + 1) 
If ll_pos22 <= 0 Then Return -1
ll_pos33 = Pos(ls_text,'|>$$',ll_pos22 + 1)

as_ctx_id = Trim(Mid(ls_text,ll_pos1 + 1, (ll_pos11 - ll_pos1 - 1)))
as_doc_id = Trim(Mid(ls_text,ll_pos2 + 1, (ll_pos22 - ll_pos2 - 1)))
as_ai_id  = Trim(Mid(ls_text,ll_pos3 + 1, (ll_pos33 - ll_pos3 - 1)))

//Messagebox('', String(al_ctx_id) +' ' + String(al_doc_id) + ' ' + String(al_ai_id))

Return 1

end function

public function integer of_add_keyword (string as_ctx_id, string as_doc_id, string as_ai_id);//'$$<|CTX_ID = ###,### & DOC_ID = ###,### & AI_ID = ###|>$$'
String ls_filename
String ls_keyword
String ls_ctx_id,ls_doc_id,ls_ai_id

//Check Key Word Exists or Not
If of_get_keyword(ls_ctx_id,ls_doc_id,ls_ai_id) > 0 Then Return 1

If isnull(as_ctx_id) Then as_ctx_id = ''
If isnull(as_doc_id) Then as_doc_id = ''
If isnull(as_ai_id) Then as_ai_id = ''

//Add Key Word
ls_keyword = '~r~n$$<|CTX_ID = '+as_ctx_id+' & DOC_ID = '+as_doc_id+' & AI_ID = '+String(as_ai_id)+'|>$$ - Do Not Delete'
This.object.ActiveDocument.Content.Select()
This.object.ActiveDocument.ActiveWindow.Selection.Start = This.object.ActiveDocument.ActiveWindow.Selection.End

This.object.ActiveDocument.ActiveWindow.Selection.Collapse(0) //wdCollapseEnd 
This.object.ActiveDocument.ActiveWindow.Selection.InsertAfter(ls_keyword)
This.object.ActiveDocument.ActiveWindow.Selection.Expand()
This.object.ActiveDocument.ActiveWindow.Selection.Font.Size = 1
This.object.ActiveDocument.ActiveWindow.Selection.Font.Color = 16777215// 16777215.White   0.Blank
This.object.ActiveDocument.ActiveWindow.Selection.Font.Bold = False

This.object.ActiveDocument.ActiveWindow.Selection.Start = This.object.ActiveDocument.ActiveWindow.Selection.End
This.object.ActiveDocument.ActiveWindow.Selection.Goto(1,1)

Return 1

end function

public function boolean of_checkreplace ();string			ls_matchwildcards

If  isvalid( This ) Then
	ls_matchwildcards = "\$\<*\>\$" // means: "$<...>$"
	this.object.ActiveDocument.Content.Select()
	IF This.Object.ActiveDocument.Activewindow.Selection.Find.Execute(ls_matchwildcards, false, true, true, false, false, true, 0, false, "", 0 ) Then
		Return true
	Else
	End If
	
Else
	Return true
	
End If



Return false
end function

public function string of_gettxtfile ();//====================================================================
// Function: of_gettxtfile
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  string
//--------------------------------------------------------------------
// Author:	Mark Lee		Date: 10/15/12
//--------------------------------------------------------------------
//	Copyright (c) 2008-2012 Contract Logix,Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
string 		ls_FileName
integer 		li_FileNum
string 		ls_Emp_Input = '' , ls_readtxt
long 			ll_FLength,  ll_readnum

//Begin - Modified By Ken.Guo 12/11/2013
//// Save as TXT file
//ls_FileName = of_GetEmailDir() + "\Email1.txt"
//If FileExists(ls_filename) Then
//	If Not FileDelete(ls_filename) Then
//		Messagebox('Delete Temporary File','Failed to delete the temporary file "' +ls_filename+ '". ~r~nThis will cause your WindWord.exe process to be locked up.  Please open Windows Task Manager (Ctrl-Alt-Del to bring up option to open Task Manager).  Click on the Process tab and look for the WINWORD.exe process and right click on that entry and click End Process.',Exclamation!)
//		Return ''
//	End If
//End If
ls_FileName = This.of_gettempfile( 'Email', 'txt')
If ls_filename = '' Then Return ''
//End - Modified By Ken.Guo 12/11/2013

this.object.ActiveDocument.Application.NormalTemplate.Saved = TRUE 
If gs_ImageView_Version <> '4.0' Then This.Object.FileSave = True
this.object.ActiveDocument.SaveAs(ls_FileName, 3,false,'',false)
If gs_ImageView_Version <> '4.0' Then This.Object.FileSave = False
gnv_shell.of_delete_recent( ls_FileName, true) 
//Return ls_FileName

ll_FLength = FileLength64(ls_FileName)
li_FileNum = FileOpen(ls_FileName, TextMode!, Read!, shared! )

Do
	ll_readnum ++
     FileReadEx(li_FileNum, ls_readtxt)
	ls_Emp_Input = ls_Emp_Input +ls_readtxt 
Loop UNTIL ll_readnum * 32765 >= ll_FLength

FileClose(li_FileNum)

return ls_Emp_Input
end function

public function string of_gettempfile (string as_filename, string as_fileext);//====================================================================
// Function: of_gettempfile
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//                as_filename
//                as_fileext
//--------------------------------------------------------------------
// Returns:  string
//--------------------------------------------------------------------
// Author:         Ken.Guo           Date: 12/11/2013
//--------------------------------------------------------------------
//Copyright (c) 2008-2013 Contract Logix, Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


//Added By Ken.Guo 12/11/2013
String ls_FileName,ls_FileName1, ls_seq
Long i,ll_max

ll_max = 1000 //max try times.
is_filepath = of_GetEmailDir() 

ls_seq = String(cpu()) + String(rand(100))

For i = 1 To ll_max
	ls_FileName = of_GetEmailDir() + "\" + as_filename + '_' + ls_seq + '_' + String(i) + "." + as_fileext
	If FileExists(ls_filename) Then
		If Not FileDelete(ls_filename) Then
			If i = ll_max Then
				Messagebox('Delete Temporary File','Failed to delete the temporary file "'+ ls_FileName +'". ~r~nThis will cause your WindWord.exe process to be locked up.  Please open Windows Task Manager (Ctrl-Alt-Del to bring up option to open Task Manager).  Click on the Process tab and look for the WINWORD.exe process and right click on that entry and click End Process.',Exclamation!)
				gnv_debug.of_output(True, 'Failed to delete the temporary file 1 ' + ls_FileName + '.') //Added By Jay Chen 09-06-2015
				Return ''
			End If
			Continue
		End If
	End If
	
	ls_FileName1 = of_GetEmailDir() + "\~~$" + as_filename + '_' + ls_seq + '_' + String(i) + "." + as_fileext 
	If FileExists(ls_filename1) Then
		If Not FileDelete(ls_filename1) Then
			If i = ll_max Then
				Messagebox('Delete Temporary File','Failed to delete the temporary file "'+is_filepath + '\'+as_filename+'*.'+as_fileext+'". ~r~nThis will cause your WindWord.exe process to be locked up.  Please open Windows Task Manager (Ctrl-Alt-Del to bring up option to open Task Manager).  Click on the Process tab and look for the WINWORD.exe process and right click on that entry and click End Process.',Exclamation!)
				gnv_debug.of_output(True, 'Failed to delete the temporary file 2 ' + is_filepath + '\' + as_filename + '*.' + as_fileext + '.') //Added By Jay Chen 09-06-2015
				Return ''
			End If
			Continue
		End If
	End If
	
	If i <> 1 Then gnv_debug.of_output(False, 'Failed to delete the ' + is_filepath + '\' + as_filename + "*." + as_fileext + ' file. Now using ' + ls_FileName + '.') //Modified By Jay Chen 08-04-2014
	Return ls_FileName
	
Next

gnv_debug.of_output(True, 'Failed to generate the temporary filename 3 ' + is_filepath + '\' + as_filename + '*.' + as_fileext + '.') //Added By Jay Chen 09-06-2015
Return ''
end function

public function integer of_doc2htm (string as_docname, string as_htmlname);//====================================================================
// Function: of_doc2htm
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//                as_docname
//                as_htmlname
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:         Ken.Guo 2015-09-08
//--------------------------------------------------------------------
//Copyright (c) 2008-2015 Contract Logix, Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


oleobject lole_word

//Added By Ken.Guo 12/12/2013
If Not FileExists(as_docname) Then
	gnv_debug.of_output(True, 'File is not exists. ' + as_docname + '.' )
//	Messagebox('Error ' , 'File is not exists. ' + as_docname + '.' )
	Return -1	
End If

If not isvalid(lole_word) Then
	lole_word = Create oleobject
End If
If Not lole_word.isalive( ) Then //Added By Ken.Guo 2015-07-22 Added if statement. Otherwise it will error if user close the Winword.exe process.
	app_filler.of_set_word_safemode(false, 1) //Added By Ken.Guo 2015-07-30
	IF lole_word.Connecttonewobject("word.application") <> 0 THEN
//		messagebox('Error','failed to create word')
		gnv_debug.of_output(true, 'failed to create word object.')
		Destroy lole_word
		app_filler.of_set_word_safemode(false, 0) //Added By Ken.Guo 2015-07-30
		Return -1
	End If
	app_filler.of_set_word_safemode(false, 0) //Added By Ken.Guo 2015-07-30
End If

lole_word.Application.NormalTemplate.Saved = TRUE		
Try
	oleobject ole_document
	ole_document = lole_word.Application.Documents.Open(as_docname,false,true)
	gnv_word_utility.of_modify_word_property( lole_word.Activedocument)	//Added By Mark Lee 06/20/2013 change for office 2013.
	gnv_shell.of_delete_recent( as_docname, true) //Delete Windows Recent Document
	ole_document.saveas(as_htmlname,10,false,'',false) //10: HTML format
	gnv_shell.of_delete_recent(as_htmlname, true) //Delete Windows Recent Document
	ole_document.Close(0)
	lole_word.quit(0)
	lole_word.DisconnectObject( )
	destroy lole_word	
	
	If FileExists(as_htmlname) Then Return 1
	
	//Added By Ken.Guo 12/12/2013.  USE NTKO control to save as html.
	w_email_edit lw_email_edit
	If Not FileExists(as_htmlname) Then
		Open(lw_email_edit)
		lw_email_edit.visible = true
		lw_email_edit.ole_word.of_open( as_docname, true)
		lw_email_edit.ole_word.Object.ActiveDocument.Application.NormalTemplate.Saved = TRUE //Added By Ken.Guo 2010-01-07.
		If gs_ImageView_Version <> '4.0' Then lw_email_edit.ole_word.Object.FileSave = True		
		lw_email_edit.ole_word.Object.ActiveDocument.saveas(as_htmlname,10,false,'',false)
		If gs_ImageView_Version <> '4.0' Then lw_email_edit.ole_word.Object.FileSave = False 
		lw_email_edit.ole_word.of_close( )
		Close(lw_email_edit)
		
		If Not FileExists(as_htmlname) Then
			gnv_debug.of_output(true,'Failed to convert Doc to HTML file. Please open Windows Task Manager and look for the WINWORD.exe process and right click on that entry and click End Process. Then try again.')
			Return -1						
		Else
			Return 1
		End If
	End If
	
	If Not FileExists(as_htmlname) Then
		gnv_debug.of_output(true,'Failed to convert Doc to HTML file. Please open Windows Task Manager and look for the WINWORD.exe process and right click on that entry and click End Process. Then try again.')
		Return -1
	Else
		Return 1
	End If	
		
Catch ( oleruntimeerror e2)
	gnv_debug.of_output(true,'Failed to open the Email.' + String(e2.line) + '~r~n' + e2.text)
	If lole_word.documents.count = 0 then //Added By Ken.Guo 2015-07-22 Added if statement. Otherwise it will close client's word document.
		lole_word.Quit(0)
	End If
	lole_word.DisconnectObject( )
	destroy lole_word	
	Return -1
End Try		
	
Return 1
end function

public subroutine of_set_trigger_event (boolean ab_value);//====================================================================
// Function: of_set_trigger_event
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//                ab_value
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:         Ken.Guo 2016-10-27
//--------------------------------------------------------------------
//Copyright (c) 2008-2016 Contract Logix, Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================



ib_trigger_event = ab_value


end subroutine

on u_email_edit.create
end on

on u_email_edit.destroy
end on

event constructor;this.object.IsResetToolbarsOnOpen = true//Alfee 11.26.2007

//this.object.menubar(false)
this.object.titlebar(false)
this.object.statusbar(false)
this.object.filenew = false
this.object.fileopen = false
this.object.filesave = false
this.object.filesaveas = false
this.object.fileclose = false
this.object.fileproperties = false

Choose Case gs_imageview_version
	Case '4.0'
		//Set the primary key
		this.object.MakerCaption="IntelliSoft Group Inc."
		this.object.MakerKey="B6DE7E7AC5ECB2246623312AFA9289F069F21D6E"
		//Set the title key
		this.object.ProductCaption="IntelliSoft Group Inc."
		this.object.ProductKey="D2FA8177167CF61E789F322B794D4DD12E86EC68"
	Case '5.0'
		//Set the primary key
		this.object.MakerCaption="Contract Logix Inc."
		this.object.MakerKey="A29DFE4524DB90730438174A2FE5B3D7FAACC33A"
		//Set the title key
		this.object.ProductCaption="Contract Logix Inc."
		this.object.ProductKey="01D146E13B4C2FBDC6445E8443DFDC34AC6A210F"
		this.object.IsShowFullScreenButton = gb_ShowFullScreenButton
End Choose
end event

event getfocus;//Added By Ken.Guo 2011-04-14. 
//Workaround OCX's Bug: Cannot get focus when open another word file outside CL.
//If gs_imageview_version = '5.0' Then
//	object.activate(true)
//End If
end event


Start of PowerBuilder Binary Data Section : Do NOT Edit
08u_email_edit.bin 
2D00000c00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdfffffffefffffffe00000004fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff0000000100000000000000000000000000000000000000000000000000000000d47c218001d2b8b200000003000002800000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000102001affffffff00000002ffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000011800000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000001001affffffffffffffff00000003d267e82f41ee8649010521915f71b13000000000d47c218001d2b8b2d47c218001d2b8b20000000000000000000000000054004e004f004b0066004f0069006600650063007400430053006c006d0074000000000000000000000000000000000000000000000000000000000000000001020022ffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000005000001180000000000000001000000020000000300000004fffffffe00000006000000070000000800000009fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
28ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff1234abcd000024b1000019388000001080000005800000088000001080000014010100010000000000000000000000000000000000000000000000000000000000000001000000000000000000000001000000010000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff000000000000000100c8d0d4000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000f6e6d300e3ba9200000000000000000000000000000001000000000000000100000000000003a800000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001234abcd000024b1000019388000001080000005800000088000001080000014010100010000000000000000000000000000000000000000000000000000000000000001000000000000000000000001000000010000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff000000000000000100c8d0d4000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000f6e6d300e3ba9200000000000000000000000000000001000000000000000100000000000003a8000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
18u_email_edit.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
