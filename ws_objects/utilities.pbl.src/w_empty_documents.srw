$PBExportHeader$w_empty_documents.srw
forward
global type w_empty_documents from w_sheet
end type
type st_info from statictext within w_empty_documents
end type
type cb_1 from commandbutton within w_empty_documents
end type
type st_1 from statictext within w_empty_documents
end type
type dw_1 from u_dw within w_empty_documents
end type
type cb_saveas from commandbutton within w_empty_documents
end type
type cb_close from commandbutton within w_empty_documents
end type
end forward

global type w_empty_documents from w_sheet
integer x = 214
integer y = 221
integer width = 4229
integer height = 2604
string title = "Check Empty Documents"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
st_info st_info
cb_1 cb_1
st_1 st_1
dw_1 dw_1
cb_saveas cb_saveas
cb_close cb_close
end type
global w_empty_documents w_empty_documents

type variables
n_cst_PowerFilter iu_PowerFilter1,iu_PowerFilter2,iu_PowerFilter3
String is_sort_column
String is_dw1_sql,is_dw2_sql,is_dw3_sql,is_dw4_sql,is_dw5_sql,is_dw6_sql
end variables

on w_empty_documents.create
int iCurrent
call super::create
this.st_info=create st_info
this.cb_1=create cb_1
this.st_1=create st_1
this.dw_1=create dw_1
this.cb_saveas=create cb_saveas
this.cb_close=create cb_close
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_info
this.Control[iCurrent+2]=this.cb_1
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.dw_1
this.Control[iCurrent+5]=this.cb_saveas
this.Control[iCurrent+6]=this.cb_close
end on

on w_empty_documents.destroy
call super::destroy
destroy(this.st_info)
destroy(this.cb_1)
destroy(this.st_1)
destroy(this.dw_1)
destroy(this.cb_saveas)
destroy(this.cb_close)
end on

event pfc_preopen;call super::pfc_preopen;integer i

this.of_SetResize(true)
this.inv_resize.of_setorigsize(3950, 2512)
for i =  1 to UpperBound(this.Control)
	this.inv_resize.of_Register(this.Control[i], this.inv_resize.scale)
next



end event

event open;call super::open;dw_1.settransobject(sqlca)
dw_1.retrieve()
end event

event resize;//
end event

type st_info from statictext within w_empty_documents
integer x = 18
integer y = 2412
integer width = 3086
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_empty_documents
integer x = 3150
integer y = 2396
integer width = 343
integer height = 92
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Update"
end type

event clicked;long li_count,ll_row,ll_docid,ll_flag,ll_find,ll_data_length
dec{1} ld_revision
string ls_filename,ls_doc_ext,ls_doc_ext_full
n_cst_dm_utils lnv_utils
Blob   lb_value,lb_null
boolean lb_insert = false
string ls_doc_name,ls_notes
str_add_audit lstr_add_audit

ll_find = dw_1.find(" flag = 1 ", 1, dw_1.rowcount())
if isnull(ll_find) then ll_find = 0
if ll_find = 0 then
	MessageBox('Information','Please upload the document(s) first')
	return 
end if

if MessageBox('Confirm Update Document','Are you sure you want to update the uploaded document(s)? ',Question!,YesNo!,2) <> 1 then return

for ll_row = 1 to dw_1.rowcount()
	lb_insert = false
	lb_value = lb_null
	ll_flag = dw_1.getitemnumber(ll_row,"flag")
	if isnull(ll_flag) or ll_flag = 0 then continue
	ll_docid = dw_1.getitemnumber(ll_row,"doc_doc_id")
	ld_revision = dw_1.getitemdecimal(ll_row, "doc_revision")
	ls_filename = trim(dw_1.getitemstring(ll_row, "file_name"))
	st_info.text = 'Getting the document data. (Doc_id:' + string(ll_docid) + ' Revision:' + string(ld_revision) + ' Filename:' + ls_filename + ')'
	//read file content
	if lnv_utils.of_readblob( ls_filename,lb_value) < 0 then
		messagebox('Upload Error1','Failed to get document data')
		gnv_debug.of_output(true,'Upload Error1:Failed to get document data. doc_id:' + string(ll_docid) + ' revision:' + string(ld_revision) + ' filename:' + ls_filename) 
		return -1
	end if
	// Get File extend name
	ls_doc_ext = Lower(lnv_utils.of_get_fileext( ls_filename ))
	ls_doc_ext_full = Lower(lnv_utils.of_get_fileext( ls_filename ,true))	
	ls_doc_name =  lnv_utils.of_get_filename(ls_filename)
	st_info.text = 'Updating the document data. (Doc_id:' + string(ll_docid) + ' Revision:' + string(ld_revision) + ' Filename:' + ls_filename + ')'
	// Check doc exists in DB
	SELECT count(*) into :li_count FROM ctx_am_doc_image 
	WHERE doc_id = :ll_docid AND revision = :ld_revision;
	IF li_count < 1 THEN
		lb_insert = true
		INSERT INTO ctx_am_doc_image (doc_id, revision, doc_ext, modify_date,doc_ext_full)
		VALUES(:ll_docid, :ld_revision, :ls_doc_ext, getdate(),:ls_doc_ext_full);
	ELSE 
		UPDATE ctx_am_doc_image SET modify_date = getdate(),doc_ext = :ls_doc_ext,doc_ext_full = :ls_doc_ext_full  
		WHERE doc_id = :ll_docid AND revision = :ld_revision;
	END IF
	IF SQLCA.SQLCODE <> 0 THEN 
		MessageBox('Upload Error2','Failed to save document to DB due to '+sqlca.sqlerrtext)
		gnv_debug.of_output(true,'Upload Error2:Failed to save document to DB due to '+sqlca.sqlerrtext + ' doc_id:' + string(ll_docid) + ' revision:' + string(ld_revision) + ' filename:' + ls_filename) 
		RETURN -2
	ELSE
		update ctx_am_document set doc_ext = :ls_doc_ext,doc_name = :ls_doc_name WHERE doc_id = :ll_docid AND revision = :ld_revision;
	END IF
	
	UPDATEBLOB ctx_am_doc_image
	SET image_file=:lb_value 
	WHERE doc_id=:ll_docid AND revision=:ld_revision;
 
	IF SQLCA.SQLCODE <> 0  or (isnull(lb_value) or len(lb_value) = 0) THEN 
		MessageBox('Upload Error3','Failed to upload document to DB due to '+sqlca.sqlerrtext)
		gnv_debug.of_output(true,'Upload Error3:Failed to upload document to DB due to '+sqlca.sqlerrtext + ' doc_id:' + string(ll_docid) + ' revision:' + string(ld_revision) + ' filename:' + ls_filename) 
		if lb_insert then	
			Delete from ctx_am_doc_image WHERE doc_id=:ll_docid AND revision=:ld_revision;
		end if
		RETURN -3
	END IF
	
	SELECT Datalength(image_file) INTO :ll_data_length FROM ctx_am_doc_image WHERE doc_id=:ll_docid AND revision=:ld_revision;	
	If Isnull(ll_data_length) or ll_data_length = 0 Then
		Messagebox('Error4','Failed to upload the document. Because the file content does not exist in database, please reupload the document (doc_id: '+ string(ll_docid) + ' revision:' + string(ld_revision)+') file to database.',Exclamation!)
		gnv_debug.of_output(true,'Error4:Failed to upload document content to DB. Doc_id:' + string(ll_docid) + ' revision:' + string(ld_revision) + ' filename:' + ls_filename) 
		Return -4
	End If	
	
	//Trigger off audit trail
	ls_notes = 'Reupload the file:' + ls_filename + ' by: ' + gs_user_id + ' at: ' + string(Today(),'yyyy-mm-dd hh:mm:ss fff') 
	update ctx_am_doc_audit set notes = :ls_notes
	where  doc_id=:ll_docid AND revision=:ld_revision
	and (notes is null or notes = '')
	and audit_id = (select max(audit_id) from ctx_am_doc_audit where doc_id=:ll_docid AND revision=:ld_revision);
	gnv_debug.of_output(true,ls_notes)
	
//	lstr_add_audit.doc_id = ll_docid
//	lstr_add_audit.revision = ld_revision
//	lstr_add_audit.filename = ls_filename
//	lstr_add_audit.doc_ext = ls_doc_ext
//	lstr_add_audit.action = "Reupload"
//	lnv_utils.of_add_audit_trail( lstr_add_audit )
next

dw_1.settransobject(sqlca)
dw_1.retrieve()
st_info.text = 'Document uploaded successfully.'


end event

type st_1 from statictext within w_empty_documents
integer x = 18
integer y = 28
integer width = 1641
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "The system has detected that the following document(s) are empty:"
boolean focusrectangle = false
end type

type dw_1 from u_dw within w_empty_documents
event ue_leftbuttonup pbm_dwnlbuttonup
event ue_set_sort ( integer xpos,  integer ypos,  long row,  dwobject dwo,  string as_sort_column )
integer x = 18
integer y = 96
integer width = 4183
integer height = 2284
integer taborder = 10
string title = "Browse"
string dataobject = "dw_empty_documents"
boolean hscrollbar = true
boolean livescroll = false
end type

event ue_leftbuttonup;If isvalid(iu_PowerFilter1) Then
//	iu_PowerFilter1.of_reset( ) 
//	iu_PowerFilter1.of_Reset_OriginalFilter( )
	iu_PowerFilter1.event post ue_buttonclicked( dwo.type, dwo.name )
End If
end event

event ue_set_sort(integer xpos, integer ypos, long row, dwobject dwo, string as_sort_column);long ll_i,ll_id,ll_findrow
string ls_sort_column
String ls_sort_syntax
this.setredraw(false)

this.of_setsort( true)
If IsValid (inv_Sort) Then 
	inv_Sort.of_setcolumnheader(True)
	inv_Sort.of_setusedisplay(True)
	inv_Sort.of_build_click_sort_syntax( xpos, ypos, row, dwo )
End If

//If GetRow() > 0 Then ll_id = This.GetItemNumber(GetRow(),'id')

//this.SetSort(of_replace_sort(this.inv_sort.of_getsort()))
this.SetSort(this.inv_sort.of_getsort())
This.sort()

//ll_findrow = This.Find('id = ' + String(ll_id),1, This.RowCount())
//If ll_findrow > 0 Then
//	this.SetRow(ll_findrow)
//	this.ScrollToRow(ll_findrow)
//End If

this.setredraw(true)

end event

event clicked;string ls_objectname,ls_sort_column
ls_objectname = string(dwo.name) 
If row = 0 and this.describe(ls_objectname+".band") = "header" and this.describe(ls_objectname + ".text") <> "!" Then 
	ls_sort_column = left(ls_objectname,len(ls_objectname) - 2)
	is_sort_column = ls_sort_column
	this.event ue_set_sort(xpos,ypos,row,dwo,ls_sort_column)
End If



end event

event constructor;SetTransObject( SQLCA )
This.of_setrowselect(True)	
this.of_setupdateable(false)

If Not isvalid(iu_PowerFilter1) Then
	iu_PowerFilter1 = create n_cst_PowerFilter
Else
	iu_PowerFilter1.of_reset( ) 
	iu_PowerFilter1.of_Reset_OriginalFilter( )
End If
iu_PowerFilter1.of_setdw(this)
iu_PowerFilter1.of_SetParentWindow( w_empty_documents )
iu_PowerFilter1.checked = true
iu_PowerFilter1.of_setoriginalfilter( )
iu_PowerFilter1.event ue_clicked()


end event

event buttonclicked;call super::buttonclicked;String 	ls_PathName,ls_FileName,ls_file_name
long		ll_Rtn

if row < 1 then return

if dwo.name = 'b_upload' then
	ls_file_name = trim(dw_1.getitemstring(row, "file_name"))
	if isnull(ls_file_name) then ls_file_name = ''
	if ls_file_name <> '' then
		if MessageBox('Confirm Upload','The document has already been uploaded the file (' + ls_file_name + '). Do you want to re-upload it? ',Question!,YesNo!,2) <> 1 then return
	end if
	gf_load_dir_path()
	n_getfilename     ln_getfilename
	ll_Rtn = ln_getfilename.of_getopenfilename("Select File",&
         + ls_PathName, ls_FileName, "",&
		+ "All Files (*.*), *.*,"  &
         + "Doc Files (*DOCX;*.DOC),*.DOCX;*.DOC,"&	
         + "Xls Files (*XLSX;*.XLS),*.XLSX;*.XLS,"&			
         + "Tif Files (*.TIF),*.TIF,"&
         + "Pdf Files (*.PDF),*.PDF" , ""        )			
					
	gf_save_dir_path(ls_PathName)

	if ll_Rtn <> 1 then Return
	dw_1.Setitem(row, "file_name", ls_PathName)
	dw_1.Setitem(row, "flag", 1)
end if


end event

type cb_saveas from commandbutton within w_empty_documents
integer x = 3502
integer y = 2396
integer width = 343
integer height = 92
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Export..."
end type

event clicked;m_npdb_options NewMenu 
NewMenu = CREATE m_npdb_options
NewMenu.of_setparent(dw_1)
NewMenu.m_options.m_mailall.visible = false
NewMenu.m_options.m_printall.visible = false
NewMenu.m_options.m_printcurrent.text = 'Print'
NewMenu.m_options.m_mailcurrent.visible = False
NewMenu.m_options.PopMenu(Parent.pointerx(),Parent.pointerY())
end event

type cb_close from commandbutton within w_empty_documents
integer x = 3854
integer y = 2396
integer width = 343
integer height = 92
integer taborder = 20
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

