$PBExportHeader$w_requirement_element_doc.srw
$PBExportComments$Display word document
forward
global type w_requirement_element_doc from pfc_w_response
end type
type cb_close from commandbutton within w_requirement_element_doc
end type
type cb_save from commandbutton within w_requirement_element_doc
end type
type ole_document from u_email_edit within w_requirement_element_doc
end type
end forward

global type w_requirement_element_doc from pfc_w_response
integer width = 3744
integer height = 2564
string title = "Requirement Word Attachment"
boolean center = true
event ue_close pbm_syscommand
cb_close cb_close
cb_save cb_save
ole_document ole_document
end type
global w_requirement_element_doc w_requirement_element_doc

type variables
long		il_elements_id
String	is_FullFileName,is_ShortFileName
String	is_RegKey = "HKEY_LOCAL_MACHINE\SOFTWARE\IntelliSoft Group\Requirement"		//Modified By Mark Lee 04/18/12 modify in event of contructor
Long il_template_elem_id //Added By Ken.Guo 2009-06-30.
Long il_ctx_id
Boolean lb_readonly = False
end variables

event ue_close;If message.wordparm = 61536 Then
	cb_close.Trigger Event Clicked()
	Return 1
End If

end event

on w_requirement_element_doc.create
int iCurrent
call super::create
this.cb_close=create cb_close
this.cb_save=create cb_save
this.ole_document=create ole_document
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_close
this.Control[iCurrent+2]=this.cb_save
this.Control[iCurrent+3]=this.ole_document
end on

on w_requirement_element_doc.destroy
call super::destroy
destroy(this.cb_close)
destroy(this.cb_save)
destroy(this.ole_document)
end on

event open;call super::open;Blob		lblb_Document
DateTime	ldt_LastUpdate
String	ls_UpdateDT,ls_AgrDir
long		ll_ImageLen,i


n_cst_contract	ln_download_doc

il_elements_id = Message.DoubleParm
if IsNull(il_elements_id) or il_elements_id <= 0 then Return

is_ShortFileName = "reqmnt_" + String(il_elements_id) + ".doc"

ls_AgrDir = gs_dir_path + gs_DefDirName + "\agreement\"
gnv_AppeonDLL.of_ParsePath(ls_AgrDir)
is_FullFileName = ls_AgrDir + is_ShortFileName


gnv_appeondb.of_startqueue( )
	SELECT IsNull(DATALENGTH(image_file),0),Modify_Date,ctx_req_tmplt_element_id
	  INTO :ll_ImageLen,:ldt_LastUpdate, :il_template_elem_id
	  FROM ctx_elements
	 WHERE ctx_elements_id = :il_elements_id;
	
	SELECT Top 1 ctx_req_profile_hdr.ctx_id INTO :il_ctx_id
	  FROM ctx_req_tmplt_element,ctx_req_profile_hdr,ctx_elements
	 WHERE ctx_req_tmplt_element.ctx_req_profile_id = ctx_req_profile_hdr.ctx_req_profile_id
		AND ctx_req_profile_hdr.ctx_req_profile_hdr_id = ctx_elements.ctx_req_profile_hdr_id
		AND ctx_req_tmplt_element.ctx_req_tmplt_element_id = ctx_elements.ctx_req_tmplt_element_id
		AND ctx_elements.ctx_elements_id = :il_elements_id;
gnv_appeondb.of_commitqueue( )

if ll_ImageLen = 0 or IsNull(ldt_LastUpdate) then
	ole_Document.of_Open()
else
	ln_download_doc = CREATE n_cst_contract
	ln_download_doc.of_GetElementDoc(il_elements_id) //saved file to is_FullFileName
	Destroy ln_download_doc
	
	//Begin - Modified By Ken.Guo 2010-10-20
	//ole_Document.of_Open(is_FullFileName,true)
	String 	ls_temp_file
	If Not FileExists(is_FullFileName) Then
		Messagebox('Requirement ' + String(il_elements_id),'Failed to download the requirement file, please call support.')
		Return -1
	End If
	For i = 1 To 1000
		ls_temp_file = ls_AgrDir + 'reqmnt_temp'+String(i)+'.doc' 
		If FileCopy(is_FullFileName,ls_temp_file,True) = 1 Then
			Exit
		Else
			If i = 1000 Then
				Messagebox('Requirement ' + String(il_elements_id),'Failed to delete the temporary file ' + ls_temp_file + ', please call support.')
				Return -1
			End If
		End If
	Next
	ole_Document.of_Open(ls_temp_file,true)
	//End - Modified By Ken.Guo 2010-10-20
	

end if

//Added By Ken.Guo 2009-09-02. add readonly control.
If isvalid(gw_contract) Then
	If gw_contract.tab_contract_details.tabpage_requirements.of_check_read_only( ) Then
		lb_readonly = True
		cb_save.enabled = False
	End If
End If
end event

event close;call super::close;If ole_Document.object.doctype > 0 Then ole_Document.object.ActiveDocument.Saved = True //Added By Ken.Guo 2016-05-23. workaround Task 524
ole_Document.object.Close()

end event

event activate;call super::activate;//Added By Ken.Guo 2011-11-30. Workaround Office OCX's bug
If isvalid(ole_document ) Then
	ole_document.object.activate(true)
End If
end event

type cb_close from commandbutton within w_requirement_element_doc
integer x = 3369
integer y = 2368
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

event clicked;integer li_ret
IF Not ole_Document.object.ActiveDocument.Saved and Not lb_readonly Then
	li_ret = messagebox('Save','Do you want to save the changes?',Question!,YesNoCancel!) 
	If li_ret = 1 Then
		li_ret = cb_save.event clicked( ) 
		If li_ret < 0 Then Return -1
	ElseIf li_ret = 3 Then
		Return
	End if
End If
CloseWithReturn(Parent,"")
end event

type cb_save from commandbutton within w_requirement_element_doc
event type integer ue_update_document ( )
integer x = 2990
integer y = 2368
integer width = 343
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Save"
end type

event type integer ue_update_document();
String ls_element_name
str_requirement_doc lstr_reqmnt_doc


DataStore lds_doc
lds_doc = Create Datastore
lds_doc.DataObject = 'd_doc_ref_requirement'
lds_doc.SetTransObject(SQLCA)

lstr_reqmnt_doc.sl_ctx_id = il_ctx_id
lstr_reqmnt_doc.sl_element_id[1] = il_template_elem_id
lstr_reqmnt_doc.sl_reqmnt_id[1] =  il_elements_id
lstr_reqmnt_doc.ss_element_name[1] = ''
lds_doc.Retrieve(lstr_reqmnt_doc.sl_ctx_id,lstr_reqmnt_doc.sl_element_id[])
If lds_doc.rowcount() > 0 Then
	If Messagebox('Updating existing documents','Would you like to update all the Documents that refer to this requirement?',Question!,YesNo!) = 1 Then
		OpenwithParm(w_update_document_by_reqmnt,lstr_reqmnt_doc)
	End If
End If

If isvalid(lds_doc) Then Destroy lds_doc
Return 1
end event

event clicked;DateTime		ldt_Now
String		ls_UpdateTime
Blob			lblb_data
	
gnv_rights.of_check_dir_right(is_FullFileName, true, 'Requirement Data Save')	
IF Not ole_Document.object.ActiveDocument.Saved Then //Added By Ken.Guo 2009-06-30. Add If statement
	If gs_ImageView_Version <> '4.0' Then ole_Document.object.FileSave = True
	ole_Document.object.ActiveDocument.SaveAs(is_FullFileName,0,false,'',false)
	If gs_ImageView_Version <> '4.0' Then ole_Document.object.FileSave = False
	gnv_shell.of_delete_recent( is_FullFileName, true) //Added By Ken.Guo 2010-05-25. Delete Windows Recent Document.
	ole_Document.of_ReadFile(is_FullFileName,lblb_data)
	
	UPDATEBLOB ctx_elements SET image_file = :lblb_data WHERE ctx_elements_id = :il_elements_id;
	if SQLCA.SQLCode <> 0 then
		ROLLBACK USING SQLCA;
		MessageBox(gnv_app.iapp_object.DisplayName,SQLCA.SQLErrText,StopSign!)
		Return -1
	end if
	
	ldt_Now = f_get_server_dtm()
	UPDATE ctx_elements SET modify_date = :ldt_Now WHERE ctx_elements_id = :il_elements_id;
	if SQLCA.SQLCode <> 0 then
		ROLLBACK USING SQLCA;
		MessageBox(gnv_app.iapp_object.DisplayName,SQLCA.SQLErrText,StopSign!)
		Return -1
	end if
	 
	COMMIT USING SQLCA;

	//Modified By Mark Lee 04/18/12
	is_RegKey = "HKEY_LOCAL_MACHINE\SOFTWARE\"+gs_DefDirName+"\Requirement"	
	//RegistrySet(is_RegKey,is_ShortFileName,RegString!,String(ldt_Now))
	
	//Modified By Ken.Guo 2015-05-04
	//gnv_appeondll.of_registryset(is_RegKey,is_ShortFileName,RegString!,String(ldt_Now)) //Modified By Ken.Guo 2009-07-09
	gnv_filetime.of_setlastwritedatetime( is_FullFileName, ldt_Now)
	
	ole_Document.object.ActiveDocument.Saved = True //Added By Ken.Guo 2009-06-30.
	Event ue_update_document()	 //Added By Ken.Guo 2009-06-30.
End If

Return 1
end event

type ole_document from u_email_edit within w_requirement_element_doc
integer x = 14
integer y = 12
integer width = 3712
integer height = 2336
integer taborder = 10
string binarykey = "w_requirement_element_doc.win"
end type


Start of PowerBuilder Binary Data Section : Do NOT Edit
0Cw_requirement_element_doc.bin 
2800000c00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdfffffffefffffffe00000004fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff000000010000000000000000000000000000000000000000000000000000000028edaa0001d1b4cb00000003000002800000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000102001affffffff00000002ffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000011800000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000001001affffffffffffffff00000003d267e82f41ee8649010521915f71b1300000000028edaa0001d1b4cb28edaa0001d1b4cb0000000000000000000000000054004e004f004b0066004f0069006600650063007400430053006c006d0074000000000000000000000000000000000000000000000000000000000000000001020022ffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000005000001180000000000000001000000020000000300000004fffffffe00000006000000070000000800000009fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
2Effffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff1234abcd000053ec00003c5c8000001080000005800000088000001080000014010100010000000000000000000000000000000000000000000000000000000000000001000000000000000000000001000000010000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff000000000000000100c8d0d4000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000f6e6d300e3ba9200000000000000000000000000000001000000000000000100000000000003a800000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000000000000010000000000000000000000000000000000000000e6d30000ba9200f6000000e3000000000000000000010000000000001234abcd000053ec00003c5c8000001080000005800000088000001080000014010100010000000000000000000000000000000000000000000000000000000000000001000000000000000000000001000000010000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff000000000000000100c8d0d4000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000f6e6d300e3ba9200000000000000000000000000000001000000000000000100000000000003a800000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000000000000010000000000000000003600390030003200300034000000330000000000000000000000000001000000000000000000000001000000010000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff00000000000000010000d0d40000000000c800000000000000000000000000000000000000000000000000000000000000000000000000000000e6d30000ba9200f6000000e300000000000000000001000000000000000100000000000003a800000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000000000000000000000000000000000000000000000000000001fd0000001d000002140000003300000000057e1370000000000000000000000028000000400071454400000534000002140000001d0000022b0000003300000000002b55500000000000000000000000280000004000714544000004fc0000022b0000001d000002420000003300000000057e1398000000000000000000000028000000400071454400000548000002420000001d000002590000003300000000057e13c0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1Cw_requirement_element_doc.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
