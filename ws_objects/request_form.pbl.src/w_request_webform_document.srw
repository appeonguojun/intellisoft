$PBExportHeader$w_request_webform_document.srw
forward
global type w_request_webform_document from w_response
end type
type cb_close from commandbutton within w_request_webform_document
end type
type dw_1 from u_dw within w_request_webform_document
end type
end forward

global type w_request_webform_document from w_response
string tag = "Uploaded Documents"
integer width = 2281
integer height = 1764
string title = "Uploaded Documents"
cb_close cb_close
dw_1 dw_1
end type
global w_request_webform_document w_request_webform_document

type variables
long		il_rwf_id
n_cst_dm_utils 			inv_dm_utils
end variables

forward prototypes
public function integer of_preview (long al_rwf_id, long al_document_id, long al_request_id, string as_ext, string as_document_name)
end prototypes

public function integer of_preview (long al_rwf_id, long al_document_id, long al_request_id, string as_ext, string as_document_name);//====================================================================
// Function: of_preview
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value    long      al_rwf_id
// 	value    long      al_document_id
// 	value    long      al_request_id
// 	value    string    as_ext
// 	value    string    as_document_name
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	Mark Lee		Date: 11/12/2013
//--------------------------------------------------------------------
//	Copyright (c) 2008-2013 Contract Logix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
string 			ls_fullpath_name,	ls_null
str_request_webform_document	lstr_document
w_request_document_view			lw_view

if  isnull(as_ext) or trim(as_ext) = '' then return 0
if  isnull(as_document_name) or trim(as_document_name) = '' then return 0

CHOOSE CASE Lower(as_ext)
//	CASE 'bmp','tif','tiff','jpg','gif','pdf' 			//'tif','tiff','jfk','bmp','jpc','jpe','jpeg','pcx','dcx','xif','gif','wif','ibk'
////		of_previewimage(al_rwf_id,al_document_id,al_request_id,as_ext)
//	CASE 'doc','docx'
//		of_preview_doc(al_rwf_id,al_document_id,al_request_id,as_ext)
//	Case 'xls','xlsx' 
//		If gs_word_version = 'word2007' Then
//			of_preview_doc(al_rwf_id,al_document_id,al_request_id,as_ext)
//		Else
//			If Lower(as_ext) = 'xls' Then
//				of_preview_doc(al_rwf_id,al_document_id,al_request_id,as_ext)
//			Else
//				//excel 2003 application open 2007 file.
//				setnull(ls_null)
//				ls_fullpath_name  = of_download_file(al_rwf_id,	al_document_id,	al_request_id,	as_ext)
//				IF FileExists(ls_fullpath_name) THEN
//					if ShellExecuteA ( Handle( This ), "open", ls_fullpath_name , ls_Null, ls_Null, 4) <= 32 then
//						run("rundll32.exe shell32.dll,OpenAs_RunDLL " + ls_fullpath_name)
//					end if
//				End If
//			End If
//		End If
	CASE	 'bmp','tif','tiff','jpg','gif','pdf','docx','doc','xls','xlsx'
		lstr_document.al_rwf_id					= al_rwf_id
		lstr_document.al_document_id		= al_document_id
		lstr_document.al_request_id		= al_request_id
		lstr_document.as_ext					= as_ext
//		lstr_document.as_fullpath_name 	= ls_fullpath_name
		lstr_document.as_document_name	=	as_document_name

		OpenWithParm(lw_view,	lstr_document)
		
	CASE 'htm','html'
		setnull(ls_null)
		if	inv_dm_utils.of_download_request_file( al_rwf_id, al_document_id, al_request_id, as_ext, ls_fullpath_name) > 0 then 
//			IF FileExists(ls_fullpath_name) THEN
					ShellExecuteA ( Handle( This ), "open", 'IEXPLORE', ls_fullpath_name, ls_Null, 4)
//			End If
		end if 
	CASE else
		setnull(ls_null)
		if	inv_dm_utils.of_download_request_file( al_rwf_id, al_document_id, al_request_id, as_ext, ls_fullpath_name) > 0 then 
//			IF FileExists(ls_fullpath_name) THEN
				if ShellExecuteA ( Handle( This ), "open", ls_fullpath_name , ls_Null, ls_Null, 4) <= 32 then
					run("rundll32.exe shell32.dll,OpenAs_RunDLL " + ls_fullpath_name)
				end if
//			END IF
		end if 
END CHOOSE	
		
return 1 
end function

on w_request_webform_document.create
int iCurrent
call super::create
this.cb_close=create cb_close
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_close
this.Control[iCurrent+2]=this.dw_1
end on

on w_request_webform_document.destroy
call super::destroy
destroy(this.cb_close)
destroy(this.dw_1)
end on

event open;call super::open;long		ll_cnt

il_rwf_id = Message.doubleparm

if isnull(il_rwf_id ) then
	this.event close( )
elseif il_rwf_id > 0 then 
	dw_1.reset( )
	ll_cnt = dw_1.retrieve( il_rwf_id )
	
	
end if 

//Added By Jay Chen 06-13-2014
gnv_win_backcolor.of_ChangeWindowBackColor(this) 
end event

event close;call super::close;string 	ls_dir

ls_dir = gs_dir_path + gs_DefDirName +"\Request"
inv_dm_utils.of_delete_directory_file(ls_dir )

end event

type cb_close from commandbutton within w_request_webform_document
integer x = 1842
integer y = 1568
integer width = 402
integer height = 92
integer taborder = 20
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

type dw_1 from u_dw within w_request_webform_document
integer x = 27
integer y = 24
integer width = 2213
integer height = 1508
integer taborder = 10
string dataobject = "d_request_webform_document"
end type

event constructor;call super::constructor;SetRowFocusIndicator(Hand!)

this.of_SetUpdateAble(false)
end event

event buttonclicked;call super::buttonclicked;long		ll_rwf_id,	ll_document_id, ll_request_id
string 	ls_ext,	ls_document_name

if row <=0 then return 


if dwo.name = 'b_preview' then

	ll_rwf_id	=	dw_1.GetItemNumber(row,"rwf_id")
	ll_document_id	=	dw_1.GetItemNumber(row,"document_id")
	ll_request_id	=	dw_1.GetItemNumber(row,"request_id")	
	ls_ext	=	dw_1.GetItemString(row,"doc_ext")	
	ls_document_name = dw_1.GetItemString( row,"document_name")

	of_preview(ll_rwf_id,ll_document_id,ll_request_id,ls_ext,ls_document_name)

end if 



end event

