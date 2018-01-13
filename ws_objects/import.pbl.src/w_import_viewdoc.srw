$PBExportHeader$w_import_viewdoc.srw
forward
global type w_import_viewdoc from window
end type
type ole_doc from u_email_edit within w_import_viewdoc
end type
end forward

global type w_import_viewdoc from window
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
end type
global w_import_viewdoc w_import_viewdoc

type prototypes
FUNCTION long ShellExecute(long hwnd, string lpOperation, string lpFile, string lpParameters, string lpDirectory, long nShowCmd) LIBRARY "shell32.dll"  ALIAS FOR "ShellExecuteA;Ansi"
end prototypes

forward prototypes
public function blob of_downloadfile (long al_importid)
public function integer of_writefile (ref string as_filename, string as_filetype, ref blob ablb_data)
end prototypes

public function blob of_downloadfile (long al_importid);blob lb_data
blob lb_all_data
long ll_data_length
long ll_start
long ll_counter
long ll_loops

If gs_dbtype = "ASA" Or appeongetclienttype() <> 'PB' Then		
	SELECTBLOB import_doc INTO :lb_all_data
	FROM import_hdr
	WHERE import_id = :al_ImportID;
Else			
	SELECT DataLength(import_doc) INTO :ll_data_length
	FROM import_hdr
	WHERE import_id = :al_ImportID;
	
	If isnull(ll_data_length) Then ll_data_length = 0
	
	If ll_data_length > 8000 Then 
		If Mod(ll_data_length,8000) = 0 Then
			ll_loops = ll_data_length / 8000 
		Else
			ll_loops = (ll_data_length / 8000) + 1
		End If 
	ElseIf ll_data_length > 0 Then 
		ll_loops = 1 
	End If 
	
	For ll_counter = 1 To ll_loops			
		ll_start = (ll_counter - 1) * 8000 + 1
		SELECTBLOB substring(import_doc,:ll_start,8000) INTO :lb_data
		FROM import_hdr
		WHERE import_id = :al_ImportID;			
		lb_all_data += lb_data
	Next
End If
If isnull(lb_all_data) Then lb_all_data = blob('')

Return lb_all_data
end function

public function integer of_writefile (ref string as_filename, string as_filetype, ref blob ablb_data);blob lblb_Buf
long ll_BlobLen
long ll_CurrentPos
long l, ll_Writes
integer li_FileNum
string ls_ImportDirectory
n_cst_import lnv_import

lnv_import = Create n_cst_import
ls_ImportDirectory = lnv_import.of_GetImportDir()
Destroy lnv_import
choose case Lower(as_FileType)
	case "doc"
		as_FileName = ls_ImportDirectory + "\Document temp.doc"
	case "xls"
		as_FileName = ls_ImportDirectory + "\Document temp.xls"
	case "txt"
		as_FileName = ls_ImportDirectory + "\Document temp.txt"
end choose

li_FileNum = FileOpen(as_FileName, StreamMode!, Write!, LockReadWrite!, Replace!)
if li_FileNum < 0 then Return -1
ll_BlobLen = Len(ablb_Data)

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
	 	Return -1
	end if
Next
FileClose(li_FileNum)

Return 1
end function

on w_import_viewdoc.create
this.ole_doc=create ole_doc
this.Control[]={this.ole_doc}
end on

on w_import_viewdoc.destroy
destroy(this.ole_doc)
end on

event open;string ls_DocPath
string ls_DocName
string ls_FileType
integer li_Pos
long ll_ImportID
blob lblb_Data
n_cst_dm_utils lnv_utils

gnv_reg_ocx.of_check_ocx( 1,'', True) //1: office //Added by Ken.Guo on 2008-11-06

li_Pos = Pos(Message.StringParm, "|")
ll_ImportID = Long(Left(Message.StringParm, li_Pos - 1))
ls_DocName = Right(Message.StringParm, Len(Message.StringParm) - li_Pos)
ls_FileType = lnv_utils.of_get_fileext(ls_DocName)

OpenWithParm(w_appeon_gifofwait, "Opening the document..." )
lblb_Data = of_DownLoadFile(ll_ImportID)
of_WriteFile(ls_DocPath, ls_FileType, lblb_Data)

choose case Lower(ls_FileType)
	case "doc", "xls"		
		Try
			ole_doc.object.Caption = ls_DocName
			app_filler.of_set_word_safemode(false, 1) //Added By Ken.Guo 2015-07-30
			If ole_doc.object.doctype > 0 Then ole_doc.object.ActiveDocument.Saved = True //Added By Ken.Guo 2016-05-23. workaround Task 524
			ole_doc.object.OpenLocalFile(ls_DocPath , true)
			app_filler.of_set_word_safemode(false, 0) //Added By Ken.Guo 2015-07-30
			gnv_word_utility.of_modify_word_property( ole_doc.object.ActiveDocument)	//Added By Mark Lee 06/20/2013 change for office 2013.
		Catch (RunTimeError e)
			If Isvalid(w_appeon_gifofwait) Then Close(w_appeon_gifofwait)
			MessageBox('Error', 'The Office Viewer Active X Control has failed.')			
			Close(this)
			Return
		End Try
		If Isvalid(w_appeon_gifofwait) Then Close(w_appeon_gifofwait)
		
	case else
		ShellExecute(0, "open", ls_DocPath, "","", 1)
		If Isvalid(w_appeon_gifofwait) Then Close(w_appeon_gifofwait)
		Close(this)
		Return
end choose

gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17

end event

event resize;ole_doc.Move(0, 0)
ole_doc.Resize(Width - 25, Height - 100)

end event

event activate;//Added By Ken.Guo 2011-11-30. Workaround Office OCX's bug
If isvalid(ole_doc ) Then
	ole_doc.object.activate(true)
End If
end event

type ole_doc from u_email_edit within w_import_viewdoc
integer width = 2949
integer height = 1504
integer taborder = 20
string binarykey = "w_import_viewdoc.win"
end type


Start of PowerBuilder Binary Data Section : Do NOT Edit
08w_import_viewdoc.bin 
2D00000c00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdfffffffefffffffe00000004fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff000000010000000000000000000000000000000000000000000000000000000008b638f001d1b4c200000003000002800000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000102001affffffff00000002ffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000011800000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000001001affffffffffffffff00000003d267e82f41ee8649010521915f71b1300000000008b638f001d1b4c208b638f001d1b4c20000000000000000000000000054004e004f004b0066004f0069006600650063007400430053006c006d0074000000000000000000000000000000000000000000000000000000000000000001020022ffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000005000001180000000000000001000000020000000300000004fffffffe00000006000000070000000800000009fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
2Bffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff1234abcd000042aa000026dc8000001080000005800000088000001080000014010100010000000000000000000000000000000000000000000000000000000000000001000000000000000000000001000000010000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff000000000000000100c8d0d4000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000f6e6d300e3ba9200000000000000000000000000000001000000000000000100000000000003a8000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000000000000100000000000000000020001f170000000000000200240040000008000000086f000006a40000000000000000000000001234abcd000042aa000026dc8000001080000005800000088000001080000014010100010000000000000000000000000000000000000000000000000000000000000001000000000000000000000001000000010000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff000000000000000100c8d0d4000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000f6e6d300e3ba9200000000000000000000000000000001000000000000000100000000000003a80000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000000000001000000000000000000620070005f006d006f0063006d006d006f006e006900740079006600700000006d00620063005f006d006f0061007000740063006e00690000006700620070005f006d006f00630070006d0072006100690065006500740000006d00620070005f006d006f00630070006d006e006f006e0065005f00740063006100690074006100760065007400700000006d00620063005f006d006f006f00700065006e0074006e0063005f006e006100650062006f0070006c006f0064006500700000006d00620063005f006d006f006f00700065006e0074006e0064005f006100650074006300760069007400610000006500620070005f006d006f00630073006e0072007400630075006f00740000007200620070005f006d006f00630074006e00780065006d0074006e00650000007500620070005f006d006f00630079007000700000006d00620063005f006c0074006f0063006f006c0000007200620070005f006d0075006300740073006d006f0031003000700000006d00620063005f00730075006f00740030006d0000003200620070005f006d0075006300740073006d006f0033003000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
18w_import_viewdoc.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
