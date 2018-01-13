$PBExportHeader$w_request_document_view.srw
forward
global type w_request_document_view from w_sheet
end type
type uo_1 from u_tabpg_br_preview within w_request_document_view
end type
type cb_close from commandbutton within w_request_document_view
end type
end forward

global type w_request_document_view from w_sheet
integer width = 3360
integer height = 1976
string title = "Document Viewer"
boolean center = true
event ue_preview ( long al_rwf_id,  long al_document_id,  long al_request_id,  string as_ext )
uo_1 uo_1
cb_close cb_close
end type
global w_request_document_view w_request_document_view

type variables
n_cst_dm_utils inv_dm_utils
n_cst_ovole_utils inv_ole_utils_doc

String is_opened_file

str_request_webform_document	istr_document
end variables

forward prototypes
public subroutine of_preview_excel (long al_rwf_id, long al_document_id, long al_request_id, string as_ext)
public subroutine of_previewdoc (long al_rwf_id, long al_document_id, long al_request_id, string as_ext)
public subroutine of_previewimage (long al_rwf_id, long al_document_id, long al_request_id, string as_ext)
end prototypes

event ue_preview(long al_rwf_id, long al_document_id, long al_request_id, string as_ext);//====================================================================
// Function: of_preview
//====================================================================
// Event: ue_preview
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value    long      al_rwf_id
// 	value    long      al_document_id
// 	value    long      al_request_id
// 	value    string    as_ext
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:	Mark Lee		Date: 11/12/2013
//--------------------------------------------------------------------
//	Copyright (c) 2008-2013 Contract Logix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
string ls_null
String ls_fullpath_name
long	 ll_size
str_add_audit lstr_add_audit
		
CHOOSE CASE Lower(as_ext)
	CASE 'bmp','tif','tiff','jpg','gif','pdf'//'tif','tiff','jfk','bmp','jpc','jpe','jpeg','pcx','dcx','xif','gif','wif','ibk'
		of_previewimage(al_rwf_id, al_document_id, al_request_id, as_ext)
	CASE 'doc','docx'
		of_previewdoc(al_rwf_id, al_document_id, al_request_id, as_ext)
	Case 'xls','xlsx' 	
		If gs_word_version = 'word2007' Then
			of_preview_excel(al_rwf_id, al_document_id, al_request_id, as_ext)
		Else
			If Lower(as_ext) = 'xls' Then
				of_preview_excel(al_rwf_id, al_document_id, al_request_id, as_ext)
			Else
				//excel 2003 application open 2007 file.
				setnull(ls_null)
				if	inv_dm_utils.of_download_request_file( al_rwf_id, al_document_id, al_request_id, as_ext, ls_fullpath_name) > 0 then 
//				IF FileExists(ls_fullpath_name) THEN
					if ShellExecuteA ( Handle( This ), "open", ls_fullpath_name , ls_Null, ls_Null, 4) <= 32 then
						run("rundll32.exe shell32.dll,OpenAs_RunDLL " + ls_fullpath_name)
					end if
//				End If
				end if 
			End If
		End If
	CASE 'htm','html'
		setnull(ls_null)
		if	inv_dm_utils.of_download_request_file( al_rwf_id, al_document_id, al_request_id, as_ext, ls_fullpath_name) > 0 then 
//		IF FileExists(ls_fullpath_name) THEN
	   	ShellExecuteA ( Handle( This ), "open", 'IEXPLORE', ls_fullpath_name, ls_Null, 4)
//		END IF
		end if
	CASE else
		setnull(ls_null)
		if	inv_dm_utils.of_download_request_file( al_rwf_id, al_document_id, al_request_id, as_ext, ls_fullpath_name) > 0 then 
//		IF FileExists(ls_fullpath_name) THEN
			if ShellExecuteA ( Handle( This ), "open", ls_fullpath_name , ls_Null, ls_Null, 4) <= 32 then
				run("rundll32.exe shell32.dll,OpenAs_RunDLL " + ls_fullpath_name)
			end if
//		END IF
		end if	
			
END CHOOSE

end event

public subroutine of_preview_excel (long al_rwf_id, long al_document_id, long al_request_id, string as_ext);of_previewdoc(al_rwf_id, al_document_id, al_request_id, as_ext)
end subroutine

public subroutine of_previewdoc (long al_rwf_id, long al_document_id, long al_request_id, string as_ext);long ll_row
integer li_rtn
string ls_doc_ext, ls_fullpath_name, ls_fullpath_name_tmp


uo_1.ole_word.visible = True
uo_1.uo_1.visible = False

if not isvalid(w_appeon_gifofwait) then 
	OpenWithParm(w_appeon_gifofwait, "Opening Document...")
end if 

//do wait
if isvalid(w_appeon_gifofwait) then
	if w_appeon_gifofwait.hpb_1.position < 80 then
		w_appeon_gifofwait.hpb_1.position = 80
	end if
	 w_appeon_gifofwait.event timer()
end if	

inv_dm_utils.of_download_request_file( al_rwf_id, al_document_id, al_request_id, as_ext, ls_fullpath_name) 

//SetReDraw(FALSE)
IF FileExists(ls_fullpath_name) THEN
	li_rtn = inv_ole_utils_doc.of_displayfile(ls_fullpath_name, TRUE)
	is_opened_file = ls_fullpath_name
END IF

if isvalid(w_appeon_gifofwait) then
	if w_appeon_gifofwait.hpb_1.position < 80 then
		w_appeon_gifofwait.hpb_1.position = 80
	end if
end if

//SetReDraw(TRUE)

IF Isvalid(w_appeon_gifofwait) THEN Close(w_appeon_gifofwait)

end subroutine

public subroutine of_previewimage (long al_rwf_id, long al_document_id, long al_request_id, string as_ext);string 		ls_fullpath_name, ls_name

//SetPointer(HourGlass!)
if not isvalid(w_appeon_gifofwait) then 
	OpenWithParm(w_appeon_gifofwait, "Opening Document...")
end if 

//do wait
if isvalid(w_appeon_gifofwait) then
	if w_appeon_gifofwait.hpb_1.position < 80 then
		w_appeon_gifofwait.hpb_1.position = 80
	end if
	 w_appeon_gifofwait.event timer()
end if	

if inv_dm_utils.of_download_request_file( al_rwf_id, al_document_id, al_request_id, as_ext, ls_fullpath_name) > 0 then 
	uo_1.uo_1.visible = True
	uo_1.ole_word.visible = False
	ls_name = gnv_string.of_get_file_name( ls_fullpath_name, '/')
	uo_1.uo_1.of_initialize( ls_name,as_ext)
	uo_1.uo_1.event	ue_load_image(ls_fullpath_name)
	
	//readonly
//	uo_1.uo_1.event ue_set_security(False)
	uo_1.uo_1.of_set_readonly(False)

//	//page
//	uo_1.uo_1.of_set_viewstyle( "page")
end if 

if isvalid(w_appeon_gifofwait) then
	if w_appeon_gifofwait.hpb_1.position < 80 then
		w_appeon_gifofwait.hpb_1.position = 80
	end if
end if

IF Isvalid(w_appeon_gifofwait) THEN Close(w_appeon_gifofwait)

//SetPointer(Arrow!)
end subroutine

on w_request_document_view.create
int iCurrent
call super::create
this.uo_1=create uo_1
this.cb_close=create cb_close
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_1
this.Control[iCurrent+2]=this.cb_close
end on

on w_request_document_view.destroy
call super::destroy
destroy(this.uo_1)
destroy(this.cb_close)
end on

event open;call super::open;
istr_document = Message.powerobjectparm

uo_1.resize(This.width,This.Height)
uo_1.uo_1.visible = False
uo_1.ole_word.visible = False

inv_ole_utils_doc = Create n_cst_ovole_utils 
inv_ole_utils_doc.of_initial(uo_1.ole_word )


end event

event close;call super::close;//Added By Ken.Guo 2016-05-23. workaround Task 524
If  uo_1.ole_word.object.doctype > 0 Then 
	uo_1.ole_word.object.ActiveDocument.Saved = True 
	uo_1.ole_word.object.close()
End If

If isvalid(inv_ole_utils_doc) Then Destroy inv_ole_utils_doc



end event

event resize;call super::resize;uo_1.resize(newwidth - 20, newheight - 180 )
cb_close.move(newwidth - 388,newheight - 140)

end event

event pfc_postopen;call super::pfc_postopen;
If Isvalid(istr_document) Then
	This.event Post ue_preview(istr_document.al_rwf_id , istr_document.al_document_id , istr_document.al_request_id,istr_document.as_ext )
	This.title =' Document Name: ' + istr_document.as_document_name 
End If


end event

type uo_1 from u_tabpg_br_preview within w_request_document_view
event destroy ( )
integer x = 9
integer y = 8
integer width = 3282
integer height = 1736
integer taborder = 130
end type

on uo_1.destroy
call u_tabpg_br_preview::destroy
end on

type cb_close from commandbutton within w_request_document_view
integer x = 2939
integer y = 1756
integer width = 343
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Close"
end type

event clicked;Close(Parent)
end event

