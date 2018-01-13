$PBExportHeader$n_cst_dm_utils.sru
forward
global type n_cst_dm_utils from nonvisualobject
end type
end forward

global type n_cst_dm_utils from nonvisualobject autoinstantiate
end type

type variables
string CS_SUPPORT_DOCTYPES[]={'doc','tif'}
n_cst_pdf2text inv_cst_pdf2text

datastore ids_doc_image //by alfee at 03.19.2007
n_cst_ocr inv_cst_tif2text //by alfee at 08.19.2008

Boolean ib_show_msg = true //added by Harry 20161228
String is_checkin_msg //added by Harry 20161228

Boolean ib_request_approve = False  //Added By Harry 20170302 
end variables

forward prototypes
public function integer of_readblob (string as_filename, ref blob ab_value)
public function integer of_saveblob (string as_filename, blob ab_value)
public function decimal of_newversion (decimal adc_initial_version)
public function string of_generate_tempname (long al_doc_id, decimal adc_revision, string as_doc_ext)
public function integer of_add_audit_trail (str_add_audit astr_add_audit)
public function integer of_upload_file (long al_doc_id, decimal adc_revision, string as_filename)
public function string of_get_fileext (string as_filename)
public function string of_download_file (long al_doc_id, decimal adc_revision)
public function integer of_updateregistry (long al_doc_id, decimal adc_revision, string as_doc_ext, datetime adt_modify_date)
public function boolean of_comparefile (long al_doc_id, decimal adc_revision, string as_doc_ext, datetime adt_modify_date)
public subroutine of_menu_security ()
public function integer of_download_file (long al_doc_id, decimal adc_revision, string as_filename)
public function integer of_getblob_fromdb (long al_doc_id, decimal adc_revision, ref blob lb_image_data)
public function string of_generate_tempname_writable (long al_doc_id, decimal adc_revision, string as_doc_ext)
public function integer of_download_multi_files (long al_doc_id[], decimal adc_revision[], ref string as_filename[])
public function boolean of_verify_filename (string as_filename)
public function string of_get_filename (string as_filename)
public function string of_generate_tempname_random (long al_doc_id, decimal adc_revision, string as_doc_ext)
public function string of_convert_word_file_ext (string as_input_file)
public function integer of_gen_document_on_rules (string as_source_file, string as_target_file, datastore ads_clause_rule_results)
public function integer of_update_document (long al_doc_id, decimal adc_revision, string as_filename, datetime adt_modify)
public function integer of_add_audit_trail (long al_doc_id[])
public function integer of_get_clause_rule_reuslts (long al_ctx_id, long al_template_id, datastore ads_results)
public function integer of_updateregistry (string as_module, long al_doc_id, decimal adc_revision, string as_doc_ext, datetime adt_modify_date)
public function integer of_readblob_bk (string as_filename, ref blob ab_value)
public function integer of_saveblob_bk (string as_filename, blob ab_value)
public function integer of_update_tif_ocr (long al_doc_id, decimal adec_revision, string as_filename)
public function string of_get_fileext (string as_filename, boolean ab_original)
public function integer of_convert2pdf (long al_doc_id, ref decimal adec_revision, string as_filename, string as_old_ext)
public function integer of_update_clausemap (long al_doc_id, decimal adec_old_revision, decimal adec_new_revision, datawindow adw_clause, string as_filename)
public function string of_generate_tempname (long al_doc_id, decimal adc_revision, string as_doc_name, string as_doc_ext)
public function integer of_convert2pdf (string as_sourcefile, string as_targetfile)
public function integer of_create_clean_doc (string as_sourcefile, ref string as_targetfile, string as_from)
public function string of_get_ocr_result (string as_filename)
public function integer of_upload_file (long al_doc_id, decimal adc_revision, string as_filename, string as_ocr_result)
public function long of_get_sharps_revision_count (oleobject aole_document)
public function integer of_accept_or_reject_sharp_revisions (oleobject aole_document, integer ai_type)
public function String of_gettempfilename (string as_keyname)
public function integer of_add_audit_trail (long al_doc_id[], string as_action)
public function integer of_add_audit_trail (long al_doc_id[], str_ctx_email astr_sertifi, string as_action)
public function integer of_add_audit_trail (str_add_audit astr_add_audit[])
public function string of_merge_file_name (long al_doc_id, decimal adec_revision, string as_doc_name, string as_doc_ext, integer ai_type)
public function integer of_get_clause_rule_reuslts (long al_ctx_id, long al_template_id, datastore ads_results, boolean ab_ctx_find)
public function integer of_download_picture (long al_pic_id, ref string as_file)
public subroutine of_delete_directory_file (string as_dir)
public function integer of_download_request_file (long al_rwf_id, long al_document_id, long al_request_id, string as_ext, ref string as_fullpath_name)
public function integer of_download_merge_file (string as_fileid, string as_filename)
public function integer of_get_merge_blob (string as_fileid, ref blob lb_image_data)
public function integer of_filetimeget (string as_filename, ref datetime adt_lastmodified)
public function integer of_filetimeget (string as_filename, ref string as_lastmodified)
public function integer of_filetimeset (string as_filename, datetime adt_lastmodified)
public function integer of_download_multi_files (long al_doc_id[], decimal adc_revision[], boolean ab_checkcompare, string as_extra_name, ref string as_filename[])
public function string of_generate_tempname (long al_doc_id, decimal adc_revision, string as_doc_ext, boolean ab_checkcompare, string as_extra_name)
public function integer of_get_echosign_blob (string as_agreementid, string as_documentid, ref blob lb_image_data)
public function integer of_download_echosign_file (string as_agreementid, string as_documentid, string as_filename)
public function string of_compare_doc (string as_filename, string as_doc_ext, long al_doc_id, decimal adc_revision, long al_ctx_id, ref boolean ab_modified)
public function integer of_check_in_doc (long al_doc_id, string as_filename_checkin, decimal adc_revision, boolean ab_revision_control, integer ai_version_increment, boolean ab_modified)
public function integer of_check_in_from_email ()
end prototypes

public function integer of_readblob (string as_filename, ref blob ab_value);//////////////////////////////////////////////////////////////////////
// $<function>n_cst_dm_utils.of_readblob()
// $<arguments>
//		value    	string	as_filename		:The specified file name.
//		reference	blob  	ab_value   		:The content of the specified file.
// $<returns> integer: 1 - Success;  -1 - Failure
// $<description>Read blob value of a specified file.
//////////////////////////////////////////////////////////////////////
// $<add> Alfee 09.28.2008
//////////////////////////////////////////////////////////////////////
Long ll_FileLength, ll_readlength

if not fileexists(as_filename) then return -1

SetPointer(HourGlass!) 


long ll_bytes
int li_fnum
If appeongetclienttype() = 'PB' Then //Added By Ken.Guo 2016-10-31.error when run 'Blob(Space(ll_FileLength)' for PB.
	if isnull(ab_value) or len(ab_value) = 0 then
		li_fnum = FileOpen(as_filename, StreamMode!, Read!, Shared! ) //Modified By gavins 20161125 add shared! mode. Not lock read.
		ll_bytes = FileReadEx(li_fnum, ab_value)
		FileClose( li_fnum )
		if ll_bytes < 0 then return -1
		if isnull(ab_value) or len(ab_value) = 0 then return -1
	end if
Else
	Try 
		//initilize variables
		ll_FileLength = filelength(as_filename)
		ab_value = Blob(Space(ll_FileLength),EncodingANSI!) //Modified By Ken.Guo 03/28/2012. EncodingANSI
		
		//Read file to blob
		ll_readlength = AppeonReadFile(as_filename, ab_value, ll_FileLength)
		if ll_readlength < 0 then return -1
	Catch  (Runtimeerror r1)
		gnv_debug.of_output(true,"Failed to read the file. " + r1.text)
	End Try 
	
	//Added By Jay Chen 08-20-2014
	if ll_readlength = 0 or (isnull(ab_value) or len(ab_value) = 0) then
		gnv_debug.of_output(true,"AppeonReadFile error,file name : " + as_filename)
	end if
	
	if isnull(ab_value) or len(ab_value) = 0 then
		li_fnum = FileOpen(as_filename, StreamMode!)
		ll_bytes = FileReadEx(li_fnum, ab_value)
		FileClose( li_fnum )
		if ll_bytes < 0 then return -1
		if isnull(ab_value) or len(ab_value) = 0 then return -1
	end if
End If

return 1

end function

public function integer of_saveblob (string as_filename, blob ab_value);//////////////////////////////////////////////////////////////////////
// $<function>n_cst_dm_utils.of_saveblob()
// $<arguments>
//		value    	string	as_filename		: The specified file name.
//		value		   blob  	ab_value   		: The content of the specified file.
// $<returns> integer: 1 - Success; -1 - Failure
// $<description>Save blob value to a specified file.
//////////////////////////////////////////////////////////////////////
// $<add> Alfee 09.28.2008
//////////////////////////////////////////////////////////////////////
Long ll_writelength, ll_readlength
string ls_save_path

if fileexists(as_filename) then 
	if not filedelete(as_FileName) then
		return -1
	end if
end if

SetPointer(HourGlass!) 

//Start Change Code By Jervis 01.08.2009
//Create path if not exists
ls_save_path = mid(as_FileName,1,lastpos(as_FileName,'\'))
gnv_appeondll.of_parsepath(ls_save_path)
//End Change Code By Jervis


//initilize variables
ll_readlength = Len(ab_value)

//Write blob into file
ll_writelength = AppeonWriteFile(as_FileName, ab_value, ll_readlength)
if ll_writelength < 0 then return -1

SetPointer(Arrow!)
return 1

end function

public function decimal of_newversion (decimal adc_initial_version);//////////////////////////////////////////////////////////////////////
// $<function>n_cst_dm_utilsof_newrevision()
// $<arguments>
//		value	decimal	adc_initial_version		
// $<returns> decimal
// $<description>Return the new increased revision
// $<description>
//////////////////////////////////////////////////////////////////////
// $<add> 2006-12-04 by Frank.Gui
//////////////////////////////////////////////////////////////////////
decimal{1} ldc_new
long li_version_type

If Isnull(adc_initial_version) Then adc_initial_version = 0 //Added By Ken.Guo 2010-01-11.

if adc_initial_version=0 then
	ldc_new = 1.0
else
	//Version number increment type-jervis 03.19.2009
	//0-Major version number increment
	//1-Minor version number increment
	li_version_type = of_get_app_setting("set_58",'I')
	
	if li_version_type = 0 then	//Major increment -03.19.2009
		ldc_new = Truncate(adc_initial_version + 1,0)
	else	//Minor increment
		ldc_new = adc_initial_version+0.1
	end if
end if


return ldc_new
end function

public function string of_generate_tempname (long al_doc_id, decimal adc_revision, string as_doc_ext);//////////////////////////////////////////////////////////////////////
// $<function>n_cst_dm_utils.of_generate_tempname()
// $<arguments>
// $<returns> string: Generated temporary file name
// $<description>Generate a temporary file name to store OLE content
// $<description>
//////////////////////////////////////////////////////////////////////
// $<add> 2006-12-04 by Frank.Gui
//////////////////////////////////////////////////////////////////////

String ls_file_name
int  i
boolean   ab_support=false
string ls_name

gnv_appeondll.of_parsepath(gs_dir_path + gs_DefDirName + "\Agreement\Manager\")

as_doc_ext = lower(as_doc_ext)

//Use actual doc name - jervis 10.14.2009
//ls_file_name = gs_dir_path + gs_DefDirName + "\Agreement\Manager\doc_" + string(al_doc_id) + "_"+String(adc_revision)+"."+as_doc_ext
if al_doc_id > 0 then
	select doc_name into :ls_name from ctx_am_document where doc_id = :al_doc_id;
end if
if isnull(ls_name) then ls_name = ''

//Modified By Ken.Guo 2010-06-30
//ls_file_name = gs_dir_path + gs_DefDirName + "\Agreement\Manager\" + ls_name +  string(al_doc_id) + "."+String(adc_revision)+"."+as_doc_ext
ls_file_name = of_generate_tempname(al_doc_id,adc_revision,ls_name,as_doc_ext)

return ls_file_name
end function

public function integer of_add_audit_trail (str_add_audit astr_add_audit);/******************************************************************************************************************
**  [PUBLIC]   : of_add_audit_trail
**==================================================================================================================
**  Purpose   	: 
**==================================================================================================================
**  Arguments 	: str_add_audit
**==================================================================================================================
**  Returns   	: integer
**==================================================================================================================
**  Notes     	: Create a aduit trail record.
**==================================================================================================================
**  Created By	: Davis 01.11.2007
**==================================================================================================================
**  Modification Log
**   Changed By             Change Date                                               Reason
** ------------------------------------------------------------------------------------------------------------------
********************************************************************************************************************/

str_add_audit lstr_add_audit[]

//Modified By Ken.Guo 2011-06-29
lstr_add_audit[1] = astr_add_audit 
Return of_add_audit_trail(lstr_add_audit[])

//Commented By Ken.Guo 2011-06-29
/* 
Long ll_max_audit_id

IF Isnull(astr_add_audit.doc_id) OR astr_add_audit.doc_id = 0 THEN RETURN -1

Select Max(audit_id)
Into :ll_max_audit_id
From Ctx_am_doc_audit
Where doc_id = :astr_add_audit.doc_id;

IF Isnull(ll_max_audit_id) OR ll_max_audit_id = 0 THEN
	ll_max_audit_id = 1
ELSE
	ll_max_audit_id ++
END IF

Insert Into Ctx_am_doc_audit (doc_id, audit_id, revision, action, 
action_by, action_date,	filename, doc_from_type, doc_from_name, notes, doc_ext,
es_apicode, es_fileid,es_docid,es_sender,es_sender_email)
Values (:astr_add_audit.doc_id, :ll_max_audit_id, :astr_add_audit.revision, :astr_add_audit.action, 
:gs_user_id, getdate(), :astr_add_audit.filename, :astr_add_audit.doc_from_type, 
:astr_add_audit.doc_from_name, :astr_add_audit.notes, :astr_add_audit.doc_ext,
:astr_add_audit.astr_sertifi_doc.as_es_apicode,:astr_add_audit.astr_sertifi_doc.as_es_fileid,:astr_add_audit.astr_sertifi_doc.as_es_docid,
:astr_add_audit.astr_sertifi_doc.as_es_sender,:astr_add_audit.astr_sertifi_doc.as_es_email );

IF SQLCA.SQLCODE = 0 THEN
	COMMIT;
ELSE
	MESSAGEBOX("Add document", sqlca.sqlerrtext)
	RETURN -1
END IF

IF Isvalid(gw_contract) THEN
	gw_contract.tab_contract_details.tabpage_images.tab_1.tabpage_data.dynamic event ue_refresh_audit(astr_add_audit.doc_id)
END IF

RETURN 1
*/
end function

public function integer of_upload_file (long al_doc_id, decimal adc_revision, string as_filename);//////////////////////////////////////////////////////////////////////
// $<function>n_cst_ovole_utilsof_savetodb()
// $<arguments>
//		value	long   	al_doc_id      :	Corresponding Document ID
//		value	decimal	adc_revision	:	Corresponding Document revision
//    value string   as_doc_ext     :  Document Extended Name
// $<returns> integer: 1 - Success
// 		             -1: Cannot generate temporary file.
//       		       -2: Failed to save data to the temporary file.
//            		    -3: Failed to read content from the temporary file.
//                    -4: Failed to insert base data to ctx_am_doc_image.
//                    -5: Failed to update blob value to ctx_am_doc_image.
// $<description>Save the content of current OCX to the corresponding record in the DB.
// $<description>
//////////////////////////////////////////////////////////////////////
// $<add> 2006-12-04 by Frank.Gui
//////////////////////////////////////////////////////////////////////

Return This.of_upload_file(al_doc_id,adc_revision,as_filename,'')
/*
String ls_doc_ext
string ls_doc_ext_full	//jervis 10.21.2009
Blob   lb_value
Int   li_count
Int	li_count_all //Added By Ken.Guo 2009-12-22.
String ls_pdftext
n_cst_image_cp_ocr lnv_ocr

// Get blob from file
if of_readblob( as_filename, ref lb_value ) < 0 then
	messagebox('Error1','Failed to get document data')
	return -1
end if

// Get File extend name
ls_doc_ext = Lower(of_get_fileext( as_filename ))
ls_doc_ext_full = Lower(of_get_fileext( as_filename ,true))	//jervis 10.21.2009
// Check doc exists in DB
SELECT count(*) into :li_count FROM ctx_am_doc_image 
WHERE doc_id = :al_doc_id AND revision = :adc_revision;

//Check whether new document //Added By Ken.Guo 2009-12-22.
Select Count(1) Into :li_count_all From ctx_am_doc_image
Where doc_id = :al_doc_id;

//-------Appeon Begin ----modified by alfee at 03.14.2007 for performance tunning
//gnv_appeondb.of_commitqueue( ) //commented by alfee 09.14.2007
IF li_count < 1 THEN
	//Add doc_ext_full Field - jervis10.21.2009
	INSERT INTO ctx_am_doc_image (doc_id, revision, doc_ext, modify_date,doc_ext_full)
	VALUES(:al_doc_id, :adc_revision, :ls_doc_ext, getdate(),:ls_doc_ext_full);
//---------Begin Modified by Alfee 09.14.2007---------------
//<$Reason>for check in/out operation
ELSE 
	//Add doc_ext,doc_ext_full fileds - jervis 10.21.2009
	UPDATE ctx_am_doc_image SET modify_date = getdate(),doc_ext = :ls_doc_ext,doc_ext_full = :ls_doc_ext_full  
	 WHERE doc_id = :al_doc_id AND revision = :adc_revision;
//----------End Modified -----------------------------------
//	if sqlca.sqlcode =  0 then
//		COMMIT;
//	ELSE
//		messagebox('Error2','Failed to save document to DB due to '+sqlca.sqlerrtext)
//		return -2
//	end if
END IF
//---------Begin Modified by Alfee 09.14.2007---------------
IF SQLCA.SQLCODE <> 0 THEN 
	MessageBox('Error2','Failed to save document to DB due to '+sqlca.sqlerrtext)
	RETURN -2
END IF
//----------End Modified -----------------------------------

// Store blob value to DB. 
UPDATEBLOB ctx_am_doc_image
SET image_file=:lb_value 
WHERE doc_id=:al_doc_id AND revision=:adc_revision;

//Added By Ken.Guo 2009-12-22. Rollback main data if updateblob failed.
IF SQLCA.SQLCODE <> 0 THEN 
	MessageBox('Error3','Failed to upload document to DB due to '+sqlca.sqlerrtext)
	If li_count_all = 0 Then
		Delete from ctx_am_doc_image Where doc_id = :al_doc_id;
		Delete from ctx_am_document where doc_id = :al_doc_id;
	End If
	RETURN -3
END IF


//Added By Ken.Guo 2009-07-01. If it is new 
IF li_count < 1 THEN
	Update ctx_am_document Set Revision = :adc_revision Where doc_id = :al_doc_id;
End  If

IF SQLCA.SQLCODE <> 0 THEN 
	MessageBox('Error4','Failed to save document to DB due to '+sqlca.sqlerrtext)
	RETURN -4
END IF
//-------Appeon End ---------------------


If gnv_data.of_getitem('icred_settings' ,'set_48' , False ) = '1'  /*Global Search module is On*/ &
and gnv_data.of_getitem('icred_settings' ,'auto_ocr' , False ) = '1'  Then //Auto OCR is Yes
	lnv_ocr = Create n_cst_image_cp_ocr
	Choose Case Upper(ls_doc_ext) 
		Case 'PDF'
			inv_cst_pdf2text.of_pdf2text(as_FileName, ls_PdfText) //For searchable PDF.
			If ls_PdfText = '' Then
				ls_PdfText = lnv_ocr.of_ocr(as_FileName)
			End If
		Case 'BMP','TIF','TIFF','JPG','GIF'
				ls_PdfText = lnv_ocr.of_ocr(as_FileName)	
	End Choose
	
	if Len(ls_PdfText) > 0 then
		UPDATE ctx_am_doc_image
		SET pdftext = :ls_PdfText
		WHERE doc_id = :al_doc_id AND revision = :adc_Revision;
	end if
	//END---Modify by Evan 08/19/2008
End If

If isvalid(lnv_ocr) Then Destroy lnv_ocr

Return 1
*/
end function

public function string of_get_fileext (string as_filename);//////////////////////////////////////////////////////////////////////
// $<function>of_get_fileext()
// $<arguments>
//		value	string	as_filename		
// $<returns> string
// $<description>Get file extended name
//////////////////////////////////////////////////////////////////////
// $<add> 01.13.2007 by Frank.Gui
//////////////////////////////////////////////////////////////////////

//Modified by jervis 10.21.2009
/*
string  ls_temp
int  pos

ls_temp = reverse(as_filename)
pos = pos(ls_temp,'.')
IF pos > 0 THEN
	//--------Begin Modfied by Alfee 10.31.2007-------
	//<$Reason>To support Word 2007
	String ls_fileext
	ls_fileext = reverse(left(ls_temp,pos - 1))
	IF Left(Upper(ls_fileext), 3) = "DOC" THEN ls_fileext = Left(ls_fileext, 3)	
	RETURN ls_fileext
	//return reverse(left(ls_temp,pos - 1))	
	//--------End Modified ----------------------------
ELSE
	return ''
END IF
*/
return of_get_fileext(as_filename,false)
end function

public function string of_download_file (long al_doc_id, decimal adc_revision);//////////////////////////////////////////////////////////////////// //
// $<function>of_download_file()
// $<arguments>
//		value	long   	al_doc_id      :	Corresponding Document ID
//		value	decimal	adc_revision	:	Corresponding Document revision
// $<returns> String fullpath filename
// $<description> Save the content of current OCX to the corresponding record in the DB.
// $<description>
//////////////////////////////////////////////////////////////////////
// $<add> 01.22.2007 by Frank.Gui
//////////////////////////////////////////////////////////////////////

String ls_FileName
String ls_doc_ext
DateTime ldt_modify_date
Blob  lb_image_data

// Get last modify date
SELECT modify_date, doc_ext
INTO :ldt_modify_date, :ls_doc_ext
FROM ctx_am_doc_image
WHERE doc_id = :al_doc_id AND Revision = :adc_revision;

//Begin - Added By Mark Lee 08/04/12
//IF SQLCA.SQLCODE <> 0 THEN
//	//MessageBox( "DownLoad File", SQLCA.SQLERRTEXT )// by alfee 04.11.2007
//	MessageBox( "DownLoad File", "Download file failed! ~r~n" + SQLCA.SQLERRTEXT )
//	Return ""
//END IF
IF SQLCA.SQLCODE < 0 THEN
	MessageBox( "DownLoad File", "Download file failed! ~r~n" + SQLCA.SQLERRTEXT )
	Return ""
ElseIf  SQLCA.SQLCODE = 100 Then
	Messagebox('Download File','Failed to download the document. ~r~n~r~nBecause the file content does not exist in database, please delete the document (ID = '+String(al_doc_id)+') in the Document Manager and reupload the original file to database.',Exclamation!)
	Return ""
END IF
//End - Added By Mark Lee 08/04/12


// Generate file name
ls_filename = Of_generate_tempname(al_doc_id, adc_revision, ls_doc_ext)

// Compare modify date between local files and from db, if same then return 
IF of_comparefile(al_doc_id, adc_revision, ls_doc_ext, ldt_modify_date) THEN
	RETURN ls_filename
END IF

// Download file from DB
IF of_download_file( al_doc_id, adc_revision, ls_filename ) > 0 THEN
	//Save the latest update date of the current file in Registry
	
	//Modified By Ken.Guo 2015-04-29
	//of_updateregistry(al_doc_id, adc_revision, ls_doc_ext, ldt_modify_date)
	gnv_filetime.of_setlastwritedatetime( ls_filename, ldt_modify_date)

	IF FileExists(ls_filename) THEN
		RETURN ls_FileName
	END IF
END IF

RETURN ""
end function

public function integer of_updateregistry (long al_doc_id, decimal adc_revision, string as_doc_ext, datetime adt_modify_date);//////////////////////////////////////////////////////////////////////
// $<function>n_cst_ovole_utils.of_updateregistry()
// $<arguments>
//		value	integer 	ai_doc_id      		
//		value	decimal 	adc_revision   		
//		value	string  	as_doc_ext     		
//		value	datetime	adt_modify_date		
// $<returns> integer
// $<description>Register new key value of the document
// $<description>
//////////////////////////////////////////////////////////////////////
// $<add> 01.11.2007 by Alfee (Contract Logix Document Management)
//////////////////////////////////////////////////////////////////////

String ls_regstr, ls_regupdate
Integer li_rtn

//ls_regstr = "doc_" + String(al_doc_id) + "_"+ String(adc_revision)+"."+ as_doc_ext
ls_regstr = "doc_" + String(al_doc_id) + "_"+ String(adc_revision)+"_"+ as_doc_ext
ls_regupdate = String(adt_modify_date, "mm/dd/yyyy hh:mm:ss")
//Modified By Mark Lee 04/18/12
//li_rtn = gnv_appeondll.of_registryset("HKEY_LOCAL_MACHINE\SOFTWARE\IntelliSoft Group\Document",ls_regstr, regstring!, ls_regupdate) 
li_rtn = gnv_appeondll.of_registryset("HKEY_LOCAL_MACHINE\SOFTWARE\"+gs_DefDirName+"\Document",ls_regstr, regstring!, ls_regupdate) 

RETURN li_rtn

	
		

end function

public function boolean of_comparefile (long al_doc_id, decimal adc_revision, string as_doc_ext, datetime adt_modify_date);//////////////////////////////////////////////////////////////////////
// $<function>n_cst_ovole_utilsof_comparefile()
// $<arguments>
//		value	integer 	ai_doc_id      		
//		value	decimal 	adc_revision   		
//		value	string  	as_doc_ext     		
//		value	datetime	adt_modify_date		
// $<returns> boolean
// $<description>Compare the updated date between local files and from db
// $<description>
//////////////////////////////////////////////////////////////////////
// $<add> 01.11.2007 by Alfee (Contract Logix Document Management)
//////////////////////////////////////////////////////////////////////

String ls_regstr, ls_regupdate, ls_lastupdate,ls_filename

ls_filename = of_generate_tempname(al_doc_id,adc_revision,as_doc_ext)
IF Not FileExists(ls_filename) THEN RETURN FALSE

//ls_regstr = "doc_" + String(al_doc_id) + "_"+ String(adc_revision)+"."+ as_doc_ext
ls_regstr = "doc_" + String(al_doc_id) + "_"+ String(adc_revision)+"_"+ as_doc_ext
ls_lastupdate = String(adt_modify_date, "mm/dd/yyyy hh:mm:ss")
//Modified By Mark Lee 04/18/12
//registryget("HKEY_LOCAL_MACHINE\SOFTWARE\IntelliSoft Group\Document", ls_regstr, regstring!, ls_regupdate)
//gnv_appeondll.of_registryget("HKEY_LOCAL_MACHINE\SOFTWARE\IntelliSoft Group\Document", ls_regstr, regstring!, ls_regupdate)

//Modified By Ken.Guo 2015-04-29
//gnv_appeondll.of_registryget("HKEY_LOCAL_MACHINE\SOFTWARE\"+gs_DefDirName+"\Document", ls_regstr, regstring!, ls_regupdate)
gnv_filetime.of_getlastwritedatetime( ls_filename, ls_regupdate)

IF ls_lastupdate = ls_regupdate AND Len(Trim(ls_lastupdate)) > 0  THEN
	RETURN TRUE
ELSE
	RETURN FALSE
END IF

end function

public subroutine of_menu_security ();//////////////////////////////////////////////////////////////////////
// $<function>n_cst_dm_utilsof_menu_security()
// $<arguments>
//		value	integer		
// $<returns> (none)
// $<description>
// $<description>
//////////////////////////////////////////////////////////////////////
// $<add> 01.22.2007 by Jack (Document Manager)
//////////////////////////////////////////////////////////////////////

If Not isvalid(m_pfe_cst_mdi_menu_contract_am) Then Return

//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 2007-02-25 By: Rodger Wu (add other)
/* 
If w_mdi.of_security_access( 6901 ) = 0 And w_mdi.of_security_access( 6902 ) = 0 Then
	gnv_app.of_modify_menu_attr( m_pfe_cst_mdi_menu_contract_am.m_documentmanager.m_add,'toolbaritemvisible', False)			
End If
*/
integer li_addbuy, li_addsell, li_addother, li_temp

if w_mdi.of_security_access( 6901 ) > 0 then li_addbuy = 1
if w_mdi.of_security_access( 6902 ) > 0 then li_addsell = 1
if w_mdi.of_security_access( 6926 ) > 0 then li_addother = 1

li_temp = li_addbuy + li_addsell + li_addother
If li_temp = 0 Then
	gnv_app.of_modify_menu_attr( m_pfe_cst_mdi_menu_contract_am.m_documentmanager.m_add,'toolbaritemvisible', False)
Elseif li_temp = 1 Then
	m_pfe_cst_mdi_menu_contract_am.m_documentmanager.m_add.dropdown=FALSE
Else
	m_pfe_cst_mdi_menu_contract_am.m_documentmanager.m_add.dropdown=TRUE
End If
//---------------------------- APPEON END ----------------------------

If w_mdi.of_security_access( 6901 ) = 0 Then
	//--------------------------- APPEON BEGIN ---------------------------
	//$<comment> 2007-02-25 By: Rodger Wu (add other)
	/*	m_pfe_cst_mdi_menu_contract_am.m_documentmanager.m_add.dropdown=FALSE */
	//---------------------------- APPEON END ----------------------------
	gnv_app.of_modify_menu_attr( m_pfe_cst_mdi_menu_contract_am.m_documentmanager.m_add.m_addbuy,'toolbaritemvisible', False)			
End If
If w_mdi.of_security_access( 6902 ) = 0 Then
	//--------------------------- APPEON BEGIN ---------------------------
	//$<comment> 2007-02-25 By: Rodger Wu (add other)
	/* m_pfe_cst_mdi_menu_contract_am.m_documentmanager.m_add.dropdown=FALSE */
	//---------------------------- APPEON END ----------------------------
	gnv_app.of_modify_menu_attr( m_pfe_cst_mdi_menu_contract_am.m_documentmanager.m_add.m_addsell,'toolbaritemvisible', False)			
End If

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 2007-02-25 By: Rodger Wu (add other)
If li_addother = 0 Then
	//m_pfe_cst_mdi_menu_contract_am.m_documentmanager.m_add.m_addother.toolbaritemvisible = False
End If
//---------------------------- APPEON END ----------------------------

If w_mdi.of_security_access( 6903 ) = 0 Then
	gnv_app.of_modify_menu_attr( m_pfe_cst_mdi_menu_contract_am.m_documentmanager.m_properties0,'toolbaritemvisible', False)			
End If
If w_mdi.of_security_access( 6904 ) = 0 Then
	gnv_app.of_modify_menu_attr( m_pfe_cst_mdi_menu_contract_am.m_documentmanager.m_output0.m_report,'toolbaritemvisible', False)			
End If
If w_mdi.of_security_access( 6905 ) = 0 Then
	gnv_app.of_modify_menu_attr( m_pfe_cst_mdi_menu_contract_am.m_documentmanager.m_email0,'toolbaritemvisible', False)			
End If

If w_mdi.of_security_access( 6906 ) = 0 And w_mdi.of_security_access( 6907 ) = 0 And w_mdi.of_security_access( 6908 ) = 0 And w_mdi.of_security_access( 6909 ) = 0 Then
	gnv_app.of_modify_menu_attr( m_pfe_cst_mdi_menu_contract_am.m_documentmanager.m_output0,'toolbaritemvisible', False)			
End If

If w_mdi.of_security_access( 6906 ) = 0 Then
	gnv_app.of_modify_menu_attr( m_pfe_cst_mdi_menu_contract_am.m_documentmanager.m_output0.m_print0,'enabled', False)			
	gnv_app.of_modify_menu_attr( m_pfe_cst_mdi_menu_contract_am.m_documentmanager.m_output0.m_print0,'toolbaritemvisible', False)			
End If
If w_mdi.of_security_access( 6907 ) = 0 Then
	//m_pfe_cst_mdi_menu_contract_am.m_documentmanager.m_output0.m_email1.toolbaritemvisible = False			
	gnv_app.of_modify_menu_attr( m_pfe_cst_mdi_menu_contract_am.m_documentmanager.m_email0,'toolbaritemvisible', False) //alfee 03.22.2007
End If
If w_mdi.of_security_access( 6909 ) = 0 Then
	gnv_app.of_modify_menu_attr( m_pfe_cst_mdi_menu_contract_am.m_documentmanager.m_output0.m_saveas,'toolbaritemvisible', False)			
End If

If w_mdi.of_security_access( 6910 ) = 0 And w_mdi.of_security_access( 6911 ) = 0 Then
	gnv_app.of_modify_menu_attr( m_pfe_cst_mdi_menu_contract_am.m_documentmanager.m_check,'toolbaritemvisible', False)			
End If

If w_mdi.of_security_access( 6910 ) = 0 Then
	gnv_app.of_modify_menu_attr( m_pfe_cst_mdi_menu_contract_am.m_documentmanager.m_check.m_checkin,'toolbaritemvisible', False)			
End If
If w_mdi.of_security_access( 6911 ) = 0 Then
	gnv_app.of_modify_menu_attr( m_pfe_cst_mdi_menu_contract_am.m_documentmanager.m_check.m_checkout,'toolbaritemvisible', False)			
End If
If w_mdi.of_security_access( 6912 ) = 0 Then
	gnv_app.of_modify_menu_attr( m_pfe_cst_mdi_menu_contract_am.m_documentmanager.m_save0,'toolbaritemvisible', False)			
End If
If w_mdi.of_security_access( 6913 ) = 0 Then
	gnv_app.of_modify_menu_attr( m_pfe_cst_mdi_menu_contract_am.m_documentmanager.m_addclause,'toolbaritemvisible', False)			
End If

If w_mdi.of_security_access( 6914 ) = 0 And w_mdi.of_security_access( 6915 ) = 0 And w_mdi.of_security_access( 6954 ) = 0  Then
	gnv_app.of_modify_menu_attr( m_pfe_cst_mdi_menu_contract_am.m_documentmanager.m_merge,'toolbaritemvisible', False)			
End If

If w_mdi.of_security_access( 6914 ) = 0 Then
	gnv_app.of_modify_menu_attr( m_pfe_cst_mdi_menu_contract_am.m_documentmanager.m_merge.m_mergefield,'enabled', False)			
	gnv_app.of_modify_menu_attr( m_pfe_cst_mdi_menu_contract_am.m_documentmanager.m_merge.m_mergefield,'toolbaritemvisible', False)			
End If
If w_mdi.of_security_access( 6915 ) = 0 Then
	gnv_app.of_modify_menu_attr( m_pfe_cst_mdi_menu_contract_am.m_documentmanager.m_merge.m_mergedata,'toolbaritemvisible', False)			
End If

//Added By Ken.Guo 2009-06-30.
If w_mdi.of_security_access( 6954 ) = 0 Then
	gnv_app.of_modify_menu_attr( m_pfe_cst_mdi_menu_contract_am.m_documentmanager.m_merge.m_insertreqmnt,'toolbaritemvisible', False)			
End If

If w_mdi.of_security_access( 6916 ) = 0 Then
	gnv_app.of_modify_menu_attr( m_pfe_cst_mdi_menu_contract_am.m_documentmanager.m_workflow0,'toolbaritemvisible', False)			
End If
If w_mdi.of_security_access( 6917 ) = 0 Then
	gnv_app.of_modify_menu_attr( m_pfe_cst_mdi_menu_contract_am.m_documentmanager.m_clausemap,'toolbaritemvisible', False)			
End If
If w_mdi.of_security_access( 6918 ) = 0 Then
	gnv_app.of_modify_menu_attr( m_pfe_cst_mdi_menu_contract_am.m_documentmanager.m_addactioneitem,'toolbaritemvisible', False)			
End If
If w_mdi.of_security_access( 6919 ) = 0 Then
	gnv_app.of_modify_menu_attr( m_pfe_cst_mdi_menu_contract_am.m_documentmanager.m_deleteactioneitem,'toolbaritemvisible', False)			
End If
If w_mdi.of_security_access( 6920 ) = 0 Then
	gnv_app.of_modify_menu_attr( m_pfe_cst_mdi_menu_contract_am.m_documentmanager.m_letter,'toolbaritemvisible', False)			
End If
If w_mdi.of_security_access( 6921 ) = 0 Then
	gnv_app.of_modify_menu_attr( m_pfe_cst_mdi_menu_contract_am.m_documentmanager.m_option.m_revision0,'toolbaritemvisible', False)			
End If
If w_mdi.of_security_access( 6922 ) = 0 Then
	gnv_app.of_modify_menu_attr( m_pfe_cst_mdi_menu_contract_am.m_documentmanager.m_delete0,'toolbaritemvisible', False)			
End If

end subroutine

public function integer of_download_file (long al_doc_id, decimal adc_revision, string as_filename);//////////////////////////////////////////////////////////////////// //
// $<function>of_download_file()
// $<arguments>
//		value	long   	al_doc_id      :	Corresponding Document ID
//		value	decimal	adc_revision	:	Corresponding Document revision
//		value	string	as_filename		:	save to this path
// $<returns> String fullpath filename
// $<description> Save the content of current OCX to the corresponding record in the DB.
// $<description>
//////////////////////////////////////////////////////////////////////
// $<add> 01.22.2007 by Frank.Gui
//////////////////////////////////////////////////////////////////////

Blob  lb_image_data
Long ll_data_length,ll_ret

// Get file data from database
IF appeongetclienttype() = 'PB' AND gs_dbtype = 'SQL' THEN
	//--------------Begin Modified by Alfee 09.07.2007-------------
	//IF of_getblob_fromdb(al_doc_id, adc_revision, lb_image_data) <= 0 THEN		
	ll_ret = of_getblob_fromdb(al_doc_id, adc_revision, lb_image_data)
	IF ll_ret < 0 THEN				
		MessageBox( "DownLoad File", "Download file failed!" )		
		RETURN -1
	ElseIf ll_ret = 0 Then
		Messagebox('Download File','Failed to download the document. ~r~n~r~nBecause the file content does not exist in database, please delete the document (ID = '+String(al_doc_id)+') in the Document Manager and reupload the original file to database.',Exclamation!)
		Return -1		
	END IF
ELSE
	SELECT Datalength(image_file)
	INTO :ll_data_length
	FROM ctx_am_doc_image
	WHERE doc_id = :al_doc_id
	AND revision = :adc_revision;	
	
	SELECTBLOB image_file
	INTO :lb_image_data
	FROM ctx_am_doc_image
	WHERE doc_id = :al_doc_id AND Revision = :adc_revision;

	If Isnull(ll_data_length) or ll_data_length = 0 Then
		Messagebox('Download File','Failed to download the document. ~r~n~r~nBecause the file content does not exist in database, please delete the document (ID = '+String(al_doc_id)+') in the Document Manager and reupload the original file to database.',Exclamation!)
		Return -1
	End If		
	
	//-------------Begin Added by Alfee 09.07.2007-------------------
	IF SQLCA.SQLCODE = -1 THEN 
		MessageBox( "DownLoad File", "Download file failed! ~r~n" + SQLCA.SQLERRTEXT )
		Return -1
	END IF
	//-------------End Added ----------------------------------------
END IF

// Save blob value to a local file.
Return of_saveblob(as_filename, lb_image_data)

end function

public function integer of_getblob_fromdb (long al_doc_id, decimal adc_revision, ref blob lb_image_data);//Get blob data from DB, only for PB and SQL Server 
//Commented by Alfee 09.17.2007

Integer li_counter, li_loops, li_MaxPosition, li_Position
Integer li_SetStep, li_NewStep, li_loopsR, li_rtn
Long ll_start, ll_data_length
String ls_title
Boolean lb_needrestore = FALSE
Blob lb_data, lb_all_data

SetPointer(HourGlass!) 

// Get file data from database
SELECT Datalength(image_file)
INTO :ll_data_length
FROM ctx_am_doc_image
WHERE doc_id = :al_doc_id
AND revision = :adc_revision;

IF SQLCA.SQLCODE = -1 THEN RETURN -1 //Added by Alfee 09.07.2007

IF ll_data_length = 0 OR Isnull(ll_data_length) THEN
	RETURN 0
END IF

//Get length of the blob
IF ll_data_length > 8000 THEN 
  	 IF Mod(ll_data_length,8000) = 0 THEN 
        li_loops = ll_data_length/8000 
    ELSE 
  	     li_loops = (ll_data_length/8000) + 1 
    END IF 
ELSE 
  	 li_loops = 1 
END IF 

IF ib_show_msg THEN  //Add by Harry 12-29-2016  for task711
//--------Begin Modified by Alfee 09.17.2007--------------------------------
//<$Reason>Display progress bar for the large blob
li_NewStep = 20
IF li_loops > li_NewStep THEN
	IF IsValid(w_appeon_gifofwait) THEN 
		//Keep the original progress bar
		lb_needrestore = TRUE
		ls_title = w_appeon_gifofwait.st_1.Text
		li_MaxPosition = w_appeon_gifofwait.hpb_1.MaxPosition
		li_Position = w_appeon_gifofwait.hpb_1.Position
		li_SetStep = w_appeon_gifofwait.hpb_1.SetStep
	ELSE
		OpenwithParm(w_appeon_gifofwait,"Getting the data...")
	END IF
	//Set the new progress bar
	li_loopsR = li_loops / li_NewStep
	IF Mod(li_loops, li_NewStep) <> 0 THEN li_loopsR ++
	w_appeon_gifofwait.st_1.Text = "Getting the data..."
	w_appeon_gifofwait.hpb_1.MaxPosition = li_loopsR * li_NewStep
	w_appeon_gifofwait.hpb_1.Position = 0
	w_appeon_gifofwait.hpb_1.SetStep = li_loopsR		
END IF
END IF

//Get and store the blob
li_rtn = 1
FOR li_counter = 1 to li_loops
	yield() //Added By Ken.Guo 05/30/2013
	ll_start = (li_counter - 1) * 8000 + 1
	SELECTBLOB substring(image_file,:ll_start,8000)
			INTO :lb_data
			FROM ctx_am_doc_image
			WHERE doc_id = :al_doc_id
			AND revision = :adc_revision;
	IF SQLCA.SQLCODE = -1 THEN 
		li_rtn = -1
		EXIT
	END IF
	
	lb_all_data += lb_data
	
	IF ib_show_msg THEN  //Add by Harry 12-29-2016  for task711
	//Change the progress bar
	IF IsValid(w_appeon_gifofwait) AND li_loops > li_NewStep THEN
		IF Mod(li_counter, li_loopsR) = 1 THEN w_appeon_gifofwait.hpb_1.StepIt() 
	ELSE
		IF IsValid(w_appeon_gifofwait) THEN w_appeon_gifofwait.hpb_1.StepIt()
	END IF
	END IF
	
NEXT 

IF ib_show_msg THEN  //Add by Harry 12-29-2016  for task711
//Restore Progress Bar
IF IsValid(w_appeon_gifofwait) and li_loops > li_NewStep THEN 
	IF lb_needrestore THEN
		w_appeon_gifofwait.st_1.Text = ls_title
		w_appeon_gifofwait.hpb_1.MaxPosition = li_MaxPosition
		w_appeon_gifofwait.hpb_1.Position = li_Position
		w_appeon_gifofwait.hpb_1.SetStep = li_SetStep
	ELSE
		Close(w_appeon_gifofwait)
	END IF
END IF
END IF

//Store the blob
lb_image_data = lb_all_data

Return li_rtn
/*FOR li_counter = 1 to li_loops
	ll_start = (li_counter - 1) * 8000 + 1
	SELECTBLOB substring(image_file,:ll_start,8000)
		INTO :lb_data
		FROM ctx_am_doc_image
		WHERE doc_id = :al_doc_id
		AND revision = :adc_revision;

	IF SQLCA.SQLCODE = -1 THEN RETURN -1	//Added by Alfee 09.07.2007
	lb_all_data += lb_data
NEXT 

lb_image_data = lb_all_data

Return 1*/
//--------End Modified --------------------------------------------------



end function

public function string of_generate_tempname_writable (long al_doc_id, decimal adc_revision, string as_doc_ext);//////////////////////////////////////////////////////////////////////
// $<function>n_cst_dm_utils.of_generate_tempname()
// $<arguments>
// $<returns> string: Generated temporary file name
// $<description>Generate a temporary file name to store OLE content
// $<description>
//////////////////////////////////////////////////////////////////////
// $<add> 2006-12-04 by Frank.Gui
//////////////////////////////////////////////////////////////////////

String ls_file_name
int  i
boolean   ab_support=false

gnv_appeondll.of_parsepath(gs_dir_path + gs_DefDirName + "\Agreement\Manager\")

as_doc_ext = lower(as_doc_ext)

ls_file_name = gs_dir_path + gs_DefDirName + "\Agreement\Manager\tmp_doc_" + string(al_doc_id) + "_"+String(adc_revision)+"."+as_doc_ext

return ls_file_name
end function

public function integer of_download_multi_files (long al_doc_id[], decimal adc_revision[], ref string as_filename[]);//////////////////////////////////////////////////////////////////// //
// $<function>of_download_multi_files()
// $<arguments>
//		value	long   	al_doc_id[]     :	Corresponding Document IDs
//		value	decimal	adc_revision[]	:	Corresponding Document revisions
//		Ref	string	as_filename[]	:	Corresponding Document full names
// $<returns> integer
// $<description> Get files according to specified doc ids and revisions.
//////////////////////////////////////////////////////////////////////
// $<add> 03.19.2007 by Alfee
//////////////////////////////////////////////////////////////////////
Long ll_cnt, ll_cnt_ds, ll_found, i
String ls_doc_ext[], ls_search
DateTime ldt_modify_date[]
Blob  lb_image_data[]

//Begin - Added By Jay 2016-05-27.
//APB '28-digit Decimal' bug in datawindow Retrieval arguments is decimal array or number array
string ls_doc_id[], ls_revision[]

ll_cnt = UpperBound ( al_doc_id )
For i = 1 To ll_cnt
	ls_doc_id [i] = string ( al_doc_id [i] )	
Next
ll_cnt = UpperBound ( adc_revision )
For i = 1 To ll_cnt
	ls_revision [i] = string ( adc_revision [i] )	
Next

ll_cnt_ds = ids_doc_image.Retrieve(ls_doc_id, ls_revision)
//End - Added By Jay 2016-05-27.

//ll_cnt_ds = ids_doc_image.Retrieve(al_doc_id, adc_revision)//Commented By Jay 2016-05-27
IF ll_cnt_ds < 1 THEN RETURN -1

ll_cnt = UpperBound(al_doc_id) 
FOR i = 1 TO ll_cnt 	
	ls_search = "doc_id = " + String(al_doc_id[i]) + " and revision = " + String(adc_revision[i])
	ls_search = gnv_string.of_globalreplace( ls_search, ',', '.') //Added By Ken.Guo 2016-04-19. for french, the dicemal  symbol is ',', should convert to '.' in dw find function.
	ll_found = ids_doc_image.Find(ls_search, 1, ll_cnt_ds)
	IF ll_found > 0  THEN
		// Get files' extension, modify date & file name
		ls_doc_ext[i] = ids_doc_image.GetItemString(ll_found,"doc_ext")
		ldt_modify_date[i] = ids_doc_image.GetItemDateTime(ll_found,"modify_date")
		as_filename[i] = Of_generate_tempname(al_doc_id[i], adc_revision[i], ls_doc_ext[i])
		
		// Compare modify date between local files and from db, if not same then download
		IF Not of_comparefile(al_doc_id[i], adc_revision[i], ls_doc_ext[i], ldt_modify_date[i]) THEN
			// Download file from DB
			IF of_download_file(al_doc_id[i], adc_revision[i], as_filename[i]) > 0 THEN
				//Save the latest update date of the current file in Registry
				
				//Modified By Ken.Guo 2015-04-29
				//of_updateregistry(al_doc_id[i], adc_revision[i], ls_doc_ext[i], ldt_modify_date[i])
				This.of_filetimeset( as_filename[i], ldt_modify_date[i])
				
			END IF
		END IF
	ELSE
		as_filename[i] = ""
		Return -1 //added by alfee 08.29.2007
	END IF
NEXT			

RETURN 1
end function

public function boolean of_verify_filename (string as_filename);//////////////////////////////////////////////////////////////////////
// $<function>n_cst_dm_utils.of_verify_filename
// $<arguments> String as_filename
// $<returns> Boolean 
// $<description>Verify File Name field
//////////////////////////////////////////////////////////////////////
// $<add> 05.08.2007 Alfee
//////////////////////////////////////////////////////////////////////
//File name field can't be empty
IF IsNull(as_filename) or Len(Trim(as_filename)) < 1 THEN
	MessageBox("Verification","The document name field can't be empty!")
	RETURN FALSE
END IF

//File name can include: \ / : * ? " < > | ,
IF Match(as_filename, '[\/:*?"<>,]') THEN
	MessageBox("Verification", 'The document name cannot include any of the following characters: ] [ { } \ / : * ? " < > ,  ')
	RETURN FALSE
END IF

//File name can't be duplicated with the existed


RETURN TRUE
end function

public function string of_get_filename (string as_filename);//////////////////////////////////////////////////////////////////////
// $<function>of_get_filenamet()
// $<arguments>
//		value	string	as_filename		
// $<returns> string
// $<description>Get file name without extension
//////////////////////////////////////////////////////////////////////
// $<add> 08.22.2007 by Alfee
//////////////////////////////////////////////////////////////////////

Integer li_pos
String ls_filename, ls_rtn

IF IsNull(as_filename) OR Len(Trim(as_filename)) < 1 THEN RETURN ""

li_pos = LastPos(as_filename,"\")
IF li_pos > 0 THEN
	ls_filename = Mid(as_filename, li_pos + 1)
ELSE
	ls_filename = as_filename
END If

li_pos = LastPos(ls_filename,".")
IF li_pos > 1 THEN
	ls_rtn = Mid(ls_filename, 1, li_pos -1)
ELSE
	ls_rtn = ls_filename
END If

RETURN ls_rtn
end function

public function string of_generate_tempname_random (long al_doc_id, decimal adc_revision, string as_doc_ext);//////////////////////////////////////////////////////////////////////
// $<function>n_cst_dm_utils.of_generate_tempname_random()
// $<arguments>
// $<returns> string: Generated temporary file name
// $<description>Generate a temporary file name to store OLE content
// $<description>
//////////////////////////////////////////////////////////////////////
// $<add> By Alfee 09.21.2007
//////////////////////////////////////////////////////////////////////

String ls_file_name

gnv_appeondll.of_parsepath(gs_dir_path + gs_DefDirName + "\Agreement\Manager\")

as_doc_ext = lower(as_doc_ext)

ls_file_name = gs_dir_path + gs_DefDirName + "\Agreement\Manager\tmp" + String(Rand(100)) + "_doc_"+ string(al_doc_id) + "_"+String(adc_revision)+"."+as_doc_ext

return ls_file_name
end function

public function string of_convert_word_file_ext (string as_input_file);//To support Word 2007 - copy a 'DOCX' file to the 'DOC' file with the same name 
//Added by Alfee 10.31.2007

String ls_target_file, ls_file_ext
Integer li_pos

IF Not FileExists(as_input_file) THEN RETURN ""

ls_target_file = as_input_file

li_pos = LastPos(as_input_file, ".")
IF li_pos < 1 THEN RETURN ls_target_file

ls_file_ext = Mid(as_input_file, li_pos + 1, Len(as_input_file))
IF Left(Upper(ls_file_ext), 3) = "DOC" and Len(ls_file_ext) > 3 THEN
	ls_target_file = Left(as_input_file, li_pos) + Left(ls_file_ext, 3)
	IF FileCopy(as_input_file, ls_target_file, TRUE) <> 1 THEN ls_target_file = as_input_file
END IF

RETURN ls_target_file


end function

public function integer of_gen_document_on_rules (string as_source_file, string as_target_file, datastore ads_clause_rule_results);//Clear invalid clauses based on dynamic adding clause rules' results
//Added by Alfee 11.12.2007

Long i, j, ll_cnt, ll_clause_id
String ls_bookmark
Boolean lb_rules = FALSE
OLEObject lole_word, lole_document

//Return if file not existed or no rules defined or rules' result equals to 0
IF Not FileExists(as_source_file) THEN RETURN 0

ll_cnt = ads_clause_rule_results.RowCount()
IF ll_cnt < 1 THEN RETURN 0

FOR i = 1 TO ll_cnt
	IF ads_clause_rule_results.GetItemNumber(i, "rules_result") = 0 THEN 
		lb_rules = TRUE
		EXIT
	END If
NEXT
IF NOT lb_rules THEN RETURN 0

//Create a new Word object	and open the Word document.
lole_word = Create oleobject
app_filler.of_set_word_safemode(false, 1) //Added By Ken.Guo 2015-07-30
IF lole_word.Connecttonewobject("word.application") <> 0 THEN
	Destroy lole_word //Alfee 01.17.2008
	app_filler.of_set_word_safemode(false, 0) //Added By Ken.Guo 2015-07-30
	Messagebox('Client Error', 'Could not connect to Microsoft Word. Please make sure it is properly installed.')
	RETURN -1
END IF
app_filler.of_set_word_safemode(false, 0) //Added By Ken.Guo 2015-07-30

TRY
	//Open the file 
	lole_word.Application.NormalTemplate.Saved = TRUE //Alfee 01.17.2008
	//lole_word.Application.Documents.Open(as_source_file,false,false) 
	lole_word.Application.Documents.Open(as_source_file,false,true) //01.21.2008
	gnv_word_utility.of_modify_word_property( lole_word.Activedocument)	//Added By Mark Lee 06/20/2013 change for office 2013.
	gnv_shell.of_delete_recent( as_source_file, true) //Added By Ken.Guo 2010-05-25. Delete Windows Recent Document.
	lole_word.Visible = FALSE
	lole_document = lole_word.ActiveDocument
	
	//Clear the invalid clauses
	FOR i = 1 TO ll_cnt
		//continue if rules' result is not zero
		IF ads_clause_rule_results.GetItemNumber(i, "rules_result") <> 0 THEN CONTINUE
		//clear invalid clauses according to the adding rules
		ll_clause_id = ads_clause_rule_results.GetItemNumber(i, "ctx_acp_clause_id")
		ls_bookmark = "clause_" + String(ll_clause_id)
		IF lole_document.content.bookmarks.Exists(ls_bookmark) THEN
			lole_document.content.bookmarks.Item(ls_bookmark).Range.Delete()
			IF lole_document.content.bookmarks.Exists(ls_bookmark) Then
				lole_document.content.bookmarks.Item(ls_bookmark).delete()
			End If
		END IF	
	NEXT

	//Save the document & quit
	gnv_rights.of_check_dir_right( as_target_file, true, 'Clause Rule')
	lole_word.ActiveDocument.saveas(as_target_file,0,false,'',false)	
	gnv_shell.of_delete_recent( as_target_file, true) //Added By Ken.Guo 2010-05-25. Delete Windows Recent Document.
	lole_word.ActiveDocument.Close(0)
	lole_word.Quit(0)
	lole_word.DisconnectObject( )
	Destroy lole_document
	Destroy lole_word

CATCH (Throwable th)
	lole_word.Quit(0)
	lole_word.DisconnectObject( )
	Destroy lole_document
	Destroy lole_word
	RETURN -1
END TRY

RETURN 1


end function

public function integer of_update_document (long al_doc_id, decimal adc_revision, string as_filename, datetime adt_modify);//////////////////////////////////////////////////////////////////////
// $<function>n_cst_dm_utils.of_update_document()
// $<arguments>
//		value long 		al_doc_id		:	the document id
//		value long 		adc_revision	:  the document revision
//		value	string  	as_filename    :	The file name to be updated
//		value	datetime	adt_modify		:	The modify date to current update
// $<returns> integer: 1 - Success ;  -1 - Failed
// $<description>Update document to DB and registry with the modify date
//////////////////////////////////////////////////////////////////////
// $<add>Alfee 11.12.2007 
//////////////////////////////////////////////////////////////////////

Long i, ll_cnt
Blob lb_value

// Get blob from file
if of_readblob( as_filename, ref lb_value ) < 0 then
	messagebox('Read Document','Failed to read from document.')
	return -1
end if

// Store blob value to DB. 
UPDATEBLOB ctx_am_doc_image
SET image_file=:lb_value 
WHERE doc_id=:al_doc_id AND revision=:adc_revision;

//IF SQLCA.SQLCODE <> 0 THEN 
IF SQLCA.SQLCODE <> 0  or (isnull(lb_value) or len(lb_value) = 0) THEN //Modified By Jay Chen 08-21-2014 add blob value is null
	gnv_debug.of_output(true,'Update Document:Failed to save document to DB due to '+sqlca.sqlerrtext + ' doc_id:' + string(al_doc_id) + ' revision:' + string(adc_revision) + ' filename:' + as_filename) //Added By Jay Chen 08-21-2014
	MessageBox('Update Document','Failed to save document to DB due to '+sqlca.sqlerrtext)
	RETURN -1
END IF

// Update registry
//Modified By Ken.Guo 2015-04-29
//of_updateregistry(al_doc_id, adc_revision, 'doc', adt_modify )
gnv_filetime.of_setlastwritedatetime( as_filename, adt_modify)

return 1

end function

public function integer of_add_audit_trail (long al_doc_id[]);Return of_add_audit_trail(al_doc_id[], 'OutPut - Email')

////Add audit trail based on attached document ids in email
////Added by Alfee 11.28.2007
//Long ll_cnt, i, ll_max_audit_id, ll_row, ll_doc_id
//DataStore lds_audit_trail, lds_document
//
//ll_cnt = UpperBound(al_doc_id)
//IF ll_cnt < 1 THEN RETURN 0
//
//lds_audit_trail = Create DataStore
//lds_audit_trail.DataObject = 'd_dm_doc_audit_browse'
//lds_audit_trail.SetTransObject(SQLCA)
//
//lds_document = Create DataStore
//lds_document.DataObject = 'd_dm_doc_audit_info'
//lds_document.SetTransObject(SQLCA)
//
//ll_cnt = lds_document.Retrieve(al_doc_id)
//
//FOR i = 1 to ll_cnt
//	ll_row = lds_audit_trail.InsertRow(0)
//	ll_max_audit_id = lds_document.GetItemNumber(i, "audit_id")
//	IF NOT ll_max_audit_id > 0 THEN ll_max_audit_id = 1	
//	lds_audit_trail.SetItem(ll_row, "doc_id", lds_document.GetItemNumber(i, "doc_id"))
//	lds_audit_trail.SetItem(ll_row, "audit_id", ll_max_audit_id)
//	lds_audit_trail.SetItem(ll_row, "revision", lds_document.GetItemDecimal(i, "revision"))
//	lds_audit_trail.SetItem(ll_row, "doc_ext", lds_document.GetItemString(i, "doc_ext"))
//	lds_audit_trail.SetItem(ll_row, "action", "OutPut - Email")
//	lds_audit_trail.SetItem(ll_row, "action_by", gs_user_id)
//	lds_audit_trail.SetItem(ll_row, "action_date", DateTime(Today(), Now())	)
//NEXT
//
//lds_audit_trail.Update()
//
//Destroy lds_document
//Destroy lds_audit_trail
//
//IF SQLCA.SQLCODE = -1 THEN
//	MESSAGEBOX("Add document", "Add audit trail records failed due to "+ sqlca.sqlerrtext)
//	RETURN -1
//END IF
//
//IF Isvalid(gw_contract) THEN
//	If gw_contract.tab_contract_details.ib_select9 = True Then
//		ll_doc_id = gw_contract.tab_contract_details.tabpage_images.tab_1.tabpage_data.il_preview_doc_id
//		IF ll_doc_id > 0 THEN gw_contract.tab_contract_details.tabpage_images.tab_1.tabpage_data.dynamic event ue_refresh_audit(ll_doc_id)
//	End If
//END IF
//
//RETURN 1
//
end function

public function integer of_get_clause_rule_reuslts (long al_ctx_id, long al_template_id, datastore ads_results);Return of_get_clause_rule_reuslts( al_ctx_id, al_template_id, ads_results, true ) //modified by gavins 20120726

/*
//Added by Alfee 11.12.2007
Integer li_result
Long i, ll_cnt, ll_clause_id, ll_row
DataStore lds_rules, lds_clauses
string ls_where 

SetPointer(HourGlass!) //01.21.2008

lds_rules = Create DataStore
lds_clauses = Create DataStore
lds_rules.DataObject = 'd_dm_template_clause_rules'
lds_clauses.DataObject = 'd_dm_template_clause_rules'

//Get distinct clauses with rules defined
gnv_data.of_get_data_from_cache('template_clause_rules', 'ctx_acp_template_id = ' + String(al_template_id), lds_clauses) 

FOR i = 1 TO lds_clauses.RowCount()
	IF i = 1 THEN 
		ll_clause_id = lds_clauses.GetItemNumber(i, "ctx_acp_clause_id")
	ELSEIF ll_clause_id = lds_clauses.GetItemNumber(i, "ctx_acp_clause_id") THEN
		lds_clauses.DeleteRow(i)
		i --
	ELSE
		ll_clause_id = lds_clauses.GetItemNumber(i, "ctx_acp_clause_id")		
	END IF
NEXT

//Get rules' result for each clause
ll_cnt = lds_clauses.RowCount()
FOR i = 1 to ll_cnt
	//Get rules for the clause
//	lds_rules.Reset()
	ll_clause_id = lds_clauses.GetItemNumber(i, "ctx_acp_clause_id")
//	gnv_data.of_get_data_from_cache('template_clause_rules', 'ctx_acp_template_id = ' + String(al_template_id) + ' and ctx_acp_clause_id = ' + String(ll_clause_id), lds_rules) 
	//Get and store result to the clause's rules
//	string ls_updatecol[]
//	li_result = f_ctx_find( al_ctx_id, lds_rules,ls_updatecol,'1',ls_where)//add params - jervis 09.14.2010 //modified by gavins  20120723
	li_result = 1 
	ll_row = ads_results.InsertRow(0)
	ads_results.SetItem(ll_row, "ctx_id", al_ctx_id)
	ads_results.SetItem(ll_row, "ctx_acp_template_id", al_template_id)
	ads_results.SetItem(ll_row, "ctx_acp_clause_id", ll_clause_id)
	ads_results.SetItem(ll_row, "rules_result", li_result)	
NEXT

If IsValid(lds_rules) Then Destroy lds_rules 
If IsValid(lds_clauses) Then Destroy lds_clauses

RETURN 1
*/
end function

public function integer of_updateregistry (string as_module, long al_doc_id, decimal adc_revision, string as_doc_ext, datetime adt_modify_date);//////////////////////////////////////////////////////////////////////
// $<function>n_cst_ovole_utils.of_updateregistry()
// $<arguments>
//		value string 	as_module - from which module
//		value	integer 	ai_doc_id      		
//		value	decimal 	adc_revision   		
//		value	string  	as_doc_ext     		
//		value	datetime	adt_modify_date		
// $<returns> integer
// $<description>Register new key value of the document
//////////////////////////////////////////////////////////////////////
// $<add> 07.28.2008 by Alfee
//////////////////////////////////////////////////////////////////////
String ls_regstr, ls_regupdate
Integer li_rtn

CHOOSE CASE Lower(as_module)
	CASE 'document manager'
		//ls_regstr = "doc_" + String(al_doc_id) + "_"+ String(adc_revision)+"."+ as_doc_ext
		ls_regstr = "doc_" + String(al_doc_id) + "_"+ String(adc_revision)+"_"+ as_doc_ext
		ls_regupdate = String(adt_modify_date, "mm/dd/yyyy hh:mm:ss")
		//Modified By Mark Lee 04/18/12
//		li_rtn = gnv_appeondll.of_registryset("HKEY_LOCAL_MACHINE\SOFTWARE\IntelliSoft Group\Document",ls_regstr, regstring!, ls_regupdate) 		
		li_rtn = gnv_appeondll.of_registryset("HKEY_LOCAL_MACHINE\SOFTWARE\"+gs_DefDirName+"\Document",ls_regstr, regstring!, ls_regupdate) 		
	CASE 'clause library painter'
		//		
	CASE 'agreement library painter'
		//
	CASE 'document library painter'
		ls_regstr = 'Document-'+string(al_doc_id)
		ls_regupdate = String(adt_modify_date, "mm/dd/yyyy hh:mm:ss")
		//Modified By Mark Lee 04/18/12
//		li_rtn = gnv_appeondll.of_registryset("HKEY_LOCAL_MACHINE\SOFTWARE\IntelliSoft Group\Agreement",ls_regstr, regstring!, ls_regupdate) 
		li_rtn = gnv_appeondll.of_registryset("HKEY_LOCAL_MACHINE\SOFTWARE\"+gs_DefDirName+"\Agreement",ls_regstr, regstring!, ls_regupdate) 
END CHOOSE		

RETURN li_rtn

	
		

end function

public function integer of_readblob_bk (string as_filename, ref blob ab_value);//A backup for of_readblob() - Alfee 09.28.2008
//////////////////////////////////////////////////////////////////////
// $<function>n_cst_dm_utils.of_readblob()
// $<arguments>
//		value    	string	as_filename		:Specified file name.
//		reference	blob  	ab_value   		: The content value of the specified file.
// $<returns> integer: 1 - Success
//                     -1 - Failure
// $<description>Read blob value of a specified file.
// $<description>
//////////////////////////////////////////////////////////////////////
// $<add> 2006-12-04 by Frank.Gui
//////////////////////////////////////////////////////////////////////

if not fileexists(as_filename) then return -1

Int li, li_MaxPosition, li_Position, li_SetStep, li_NewStep
Long ll_FileNum,ll_FileLength,ll_Loop, ll_LoopR
String ls_title
Boolean lb_needrestore = FALSE
Blob lb_temp

SetPointer(HourGlass!) 

//Get the file length
ll_FileLength = filelength(as_FileName)
IF ll_FileLength > 32765 THEN
   IF Mod(ll_FileLength, 32765) = 0 THEN
      ll_Loop = ll_FileLength/32765
   ELSE
     ll_Loop = (ll_FileLength/32765) + 1
   END IF
ELSE
   ll_Loop = 1
END IF

//--------Begin Modified by Alfee 09.17.2007--------------------------------
//<$Reason>Display progress bar for the large document
li_NewStep = 20
IF ll_Loop > li_NewStep THEN
	IF IsValid(w_appeon_gifofwait) THEN 
		//Keep the original progress bar
		lb_needrestore = TRUE
		ls_title = w_appeon_gifofwait.st_1.Text
		li_MaxPosition = w_appeon_gifofwait.hpb_1.MaxPosition
		li_Position = w_appeon_gifofwait.hpb_1.Position
		li_SetStep = w_appeon_gifofwait.hpb_1.SetStep
	ELSE
		OpenwithParm(w_appeon_gifofwait,"Reading the document...")
	END IF
	//Set the new progress bar
	ll_LoopR = ll_Loop / li_NewStep
	IF Mod(ll_Loop, li_NewStep) <> 0 THEN ll_LoopR ++
	w_appeon_gifofwait.st_1.Text = "Reading the document..."
	w_appeon_gifofwait.hpb_1.MaxPosition = ll_LoopR * li_NewStep
	w_appeon_gifofwait.hpb_1.Position = 0
	w_appeon_gifofwait.hpb_1.SetStep = ll_LoopR		
END IF

//Open and Read the document into blob
ll_FileNum = FileOpen(as_FileName,streammode!,read!,Shared! )

for li=1 to ll_loop
	if FileRead(ll_FileNum,lb_temp)< 0 then Exit
	ab_Value+=lb_temp
	IF IsValid(w_appeon_gifofwait) AND ll_Loop > li_NewStep THEN
		IF Mod(li, ll_LoopR) = 1 THEN w_appeon_gifofwait.hpb_1.StepIt() 
	ELSE
		IF IsValid(w_appeon_gifofwait) THEN w_appeon_gifofwait.hpb_1.StepIt()
	END IF
next

//Restore Progress Bar
IF IsValid(w_appeon_gifofwait) and ll_Loop > li_NewStep THEN 
	IF lb_needrestore THEN
		w_appeon_gifofwait.st_1.Text = ls_title
		w_appeon_gifofwait.hpb_1.MaxPosition = li_MaxPosition
		w_appeon_gifofwait.hpb_1.Position = li_Position
		w_appeon_gifofwait.hpb_1.SetStep = li_SetStep
	ELSE
		Close(w_appeon_gifofwait)
	END IF
END IF

//Close the document
IF ll_FileNum > 0 THEN FileClose(ll_FileNum)
/*ll_FileNum = FileOpen(as_FileName,streammode!,read!,Shared! )
for li=1 to ll_loop
	if FileRead(ll_FileNum,lb_temp)< 0 then return -1
	ab_Value+=lb_temp
next
FileClose(ll_FileNum)*/
//--------End Modified --------------------------------------------------

return 1

end function

public function integer of_saveblob_bk (string as_filename, blob ab_value);//A backup for of_saveblob() - Alfee 09.28.2008
//////////////////////////////////////////////////////////////////////
// $<function>n_cst_dm_utils.of_saveblob()
// $<arguments>
//		value    	string	as_filename		:Specified file name.
//		value		   blob  	ab_value   		: The content value of the specified file.
// $<returns> integer: 1 - Success
//                     -1 - Failure
// $<description>Save blob value to a specified file.
// $<description>
//////////////////////////////////////////////////////////////////////
// $<add> 2006-12-04 by Frank.Gui
//////////////////////////////////////////////////////////////////////
Int li, li_MaxPosition, li_Position, li_SetStep, li_NewStep
long ll_FileNum,ll_BlobLength,ll_Loop,ll_CurrentPos, ll_LoopR
String ls_title
Boolean lb_needrestore = FALSE
Blob lb_temp

if fileexists(as_filename) then 
	if not filedelete(as_FileName) then
		return -1
	end if
end if

SetPointer(HourGlass!) 

//Get length of the blob 
ll_BlobLength = Len(ab_value)
IF ll_BlobLength > 32765 THEN
   IF Mod(ll_BlobLength, 32765) = 0 THEN
      ll_Loop = ll_BlobLength/32765
   ELSE
     ll_Loop = (ll_BlobLength/32765) + 1
   END IF
ELSE
   ll_Loop = 1
END IF

//Open the document
ll_FileNum = FileOpen(as_FileName,streammode!,write!,LockWrite!,replace!)
if ll_FileNum< 0 then return -1

//--------Begin Modified by Alfee 09.17.2007--------------------------------
//<$Reason>Display progress bar for the large document
li_NewStep = 20
IF ll_Loop > li_NewStep THEN
	IF IsValid(w_appeon_gifofwait) THEN 
		//Keep the original progress bar
		lb_needrestore = TRUE
		ls_title = w_appeon_gifofwait.st_1.Text
		li_MaxPosition = w_appeon_gifofwait.hpb_1.MaxPosition
		li_Position = w_appeon_gifofwait.hpb_1.Position
		li_SetStep = w_appeon_gifofwait.hpb_1.SetStep
	ELSE
		OpenwithParm(w_appeon_gifofwait,"Writing the document...")
	END IF
	//Set the new progress bar
	ll_LoopR = ll_Loop / li_NewStep
	IF Mod(ll_Loop, li_NewStep) <> 0 THEN ll_LoopR ++
	w_appeon_gifofwait.st_1.Text = "Writing the document..."
	w_appeon_gifofwait.hpb_1.MaxPosition = ll_LoopR * li_NewStep
	w_appeon_gifofwait.hpb_1.Position = 0
	w_appeon_gifofwait.hpb_1.SetStep = ll_LoopR		
END IF

//Write blob into the document
ll_CurrentPos = 1
FOR li=1 TO ll_loop
	lb_temp = BlobMid(ab_value, ll_CurrentPos, 32765)
	ll_CurrentPos += 32765
	IF FileWrite(ll_FileNum, lb_temp) < 0 THEN EXIT
	IF IsValid(w_appeon_gifofwait) AND ll_Loop > li_NewStep THEN
		IF Mod(li, ll_LoopR) = 1 THEN w_appeon_gifofwait.hpb_1.StepIt() 
	ELSE
		IF IsValid(w_appeon_gifofwait) THEN w_appeon_gifofwait.hpb_1.StepIt()
	END IF	 
NEXT

//Restore Progress Bar
IF IsValid(w_appeon_gifofwait) and ll_Loop > li_NewStep THEN 
	IF lb_needrestore THEN
		w_appeon_gifofwait.st_1.Text = ls_title
		w_appeon_gifofwait.hpb_1.MaxPosition = li_MaxPosition
		w_appeon_gifofwait.hpb_1.Position = li_Position
		w_appeon_gifofwait.hpb_1.SetStep = li_SetStep
	ELSE
		Close(w_appeon_gifofwait)
	END IF
END IF

//Close the document
IF ll_FileNum > 0 THEN FileClose(ll_FileNum)
/*ll_CurrentPos = 1
for li=1 to ll_loop
	 lb_temp = BlobMid(ab_value, ll_CurrentPos, 32765)
	 ll_CurrentPos += 32765
	 If FileWrite(ll_FileNum, lb_temp) = -1 Then
		 Return -1
	 End If
next
FileClose(ll_FileNum)*/
//--------End Modified --------------------------------------------------

return 1

end function

public function integer of_update_tif_ocr (long al_doc_id, decimal adec_revision, string as_filename);//////////////////////////////////////////////////////////////////////
// $<function>n_cst_dm_utilsof_update_tif_ocr()
// $<arguments>
//		value	long   	al_doc_id    		
//		value	decimal	adec_revision		
//		value	string 	as_filename  		
// $<returns> integer
// $<description>
// $<description> Update OCR by tif file.
//////////////////////////////////////////////////////////////////////
// $<add> 2009-05-31 by Ken.Guo
//////////////////////////////////////////////////////////////////////

String ls_doc_ext,ls_PdfText
ls_doc_ext = Lower(of_get_fileext( as_filename ))

If ls_doc_ext <> 'tif' Then Return -1

n_cst_image_cp_ocr lnv_ocr
lnv_ocr = Create n_cst_image_cp_ocr
//inv_cst_tif2text.of_tif2text(as_filename, ls_PdfText)
ls_PdfText = lnv_ocr.of_ocr(as_filename)

If Len(ls_PdfText) > 0 then
	UPDATE ctx_am_doc_image
	SET pdftext = :ls_PdfText
	WHERE doc_id = :al_doc_id AND revision = :adec_Revision;
End If

If isvalid(lnv_ocr) Then destroy lnv_ocr
Return 1
end function

public function string of_get_fileext (string as_filename, boolean ab_original);//////////////////////////////////////////////////////////////////////
// $<function>of_get_fileext()
// $<arguments>
//		value	string	as_filename		
//		boolean	ab_original
// $<returns> string
// $<description>Get file extended name
//////////////////////////////////////////////////////////////////////
// $<add> 01.13.2007 by Frank.Gui
//////////////////////////////////////////////////////////////////////

string  ls_temp
int  pos

ls_temp = reverse(as_filename)
pos = pos(ls_temp,'.')
IF pos > 0 THEN
	//--------Begin Modfied by Alfee 10.31.2007-------
	//<$Reason>To support Word 2007
	String ls_fileext
	ls_fileext = reverse(left(ls_temp,pos - 1))
	if not ab_original then	// Jervis 10.21.2009
		//Modified By Ken.Guo 02/13/2015
		//IF Left(Upper(ls_fileext), 3) = "DOC" THEN ls_fileext = Left(ls_fileext, 3)	
		IF Left(Upper(ls_fileext), 4) = "DOCX" THEN ls_fileext = Left(ls_fileext, 3)	
	end if
	RETURN ls_fileext
	//return reverse(left(ls_temp,pos - 1))	
	//--------End Modified ----------------------------
ELSE
	return ''
END IF
end function

public function integer of_convert2pdf (long al_doc_id, ref decimal adec_revision, string as_filename, string as_old_ext);Integer li_ret
long ll_doc_id
decimal{1} ldec_new_revision,ldec_old_revision
String ls_pdf_file
Datetime ldt_modify_date

n_cst_image_functions_cp lnv_image_cp
lnv_image_cp = Create n_cst_image_functions_cp

ldec_old_revision = adec_revision

//Get new revision.
ldec_new_revision = Truncate(adec_revision + 1,0)

//Get new file name
ls_pdf_file = This.of_generate_tempname(al_doc_id, ldec_new_revision, 'pdf')

//Save as to PDF file.
If lnv_image_cp.of_convert2pdf( as_filename, ls_pdf_file) < 0 Then
	Messagebox('Error','Failed to convert to PDF.')
	If isvalid(lnv_image_cp) Then Destroy lnv_image_cp
	Return -1
End If

//Upload row to DB
INSERT Ctx_am_doc_image(Doc_id, Revision, doc_ext, modify_date,doc_ext_full)
	Values( :al_doc_id, :ldec_new_revision, 'pdf', :ldt_modify_date ,'pdf');

//updata blob to DB
li_ret = This.of_upload_file( al_doc_id, ldec_new_revision, ls_pdf_file)
If li_ret < 0 Then
	Messagebox('Error','Failed to upload the file.')
	If isvalid(lnv_image_cp) Then Destroy lnv_image_cp
	Return -2
End If

//Add audit trail
str_add_audit lstr_add_audit
lstr_add_audit.doc_id = al_doc_id
lstr_add_audit.revision = ldec_new_revision
lstr_add_audit.doc_ext = 'pdf'
lstr_add_audit.action = "Convert to PDF from " + Upper(as_old_ext)
li_ret = This.of_add_audit_trail( lstr_add_audit )

//Update register.
Select Modify_date into :ldt_modify_date From ctx_am_doc_image Where doc_id = :al_doc_id and revision = :ldec_new_revision;

//Modified By Ken.Guo 2015-04-29
//This.of_updateregistry(al_doc_id, ldec_new_revision, 'pdf', ldt_modify_date)	
gnv_filetime.of_setlastwritedatetime( ls_pdf_file, ldt_modify_date)

//Update main record
UPDATE Ctx_am_document
	SET revision = :ldec_new_revision,
	revision_control = '1',
	doc_ext = 'pdf'
	Where Doc_id = :al_doc_id;

//Update OCR Result
Update ctx_am_doc_image 
	Set pdftext = (Select pdftext From ctx_am_doc_image where doc_id = :al_doc_id and  revision = :ldec_old_revision  )
Where doc_id = :al_doc_id and  revision = :ldec_new_revision ;

//return revision argument 
adec_revision = ldec_new_revision

Return 1

end function

public function integer of_update_clausemap (long al_doc_id, decimal adec_old_revision, decimal adec_new_revision, datawindow adw_clause, string as_filename);String ls_temp_file,ls_bookmark,ls_bm[]
long i,j,ll_clause_id,ll_cnt,li_rtn
oleobject lole_word,lole_document
DataStore lds_clause,lds_clause_temp
Boolean lb_found

lole_word = Create oleobject
lole_document = Create oleobject

lds_clause = Create DataStore
lds_clause.DataObject = 'd_dm_clause_map'
lds_clause.SetTransObject(SQLCA)

lds_clause_temp = Create DataStore
lds_clause_temp.DataObject = 'd_dm_clause_map'
lds_clause_temp.SetTransObject(SQLCA)

If isvalid(adw_clause) Then
	adw_clause.ShareData(lds_clause)
Else	
	lds_clause.Retrieve(al_doc_id,adec_old_revision)
End If

ll_cnt = lds_clause.rowcount()

//Copy to a temporary file
IF not FileExists(as_filename) THEN RETURN -1
ls_temp_file = gs_dir_path + gs_DefDirName + "\Agreement\"  + "tem_" + String(Rand(1000)) +".doc"
IF FileCopy(as_filename, ls_temp_file, TRUE) < 0 THEN 
	Messagebox('Error','Failed to replace the file ' + String(ls_temp_file) + '.')
	RETURN -1 
End If

//Open the file with readonly property in a new word application
app_filler.of_set_word_safemode(false, 1) //Added By Ken.Guo 2015-07-30
IF lole_word.Connecttonewobject("word.application") <> 0 THEN
	app_filler.of_set_word_safemode(false, 0) //Added By Ken.Guo 2015-07-30
	Destroy lole_word //Alfee 01.17.2008
	Destroy lole_document //Alfee 01.17.2008
	messagebox('Client Error', 'This application could not connect to Microsoft Word. Please make sure it is properly installed.')
	RETURN -1
END IF
lole_word.Visible = FALSE
app_filler.of_set_word_safemode(false, 0) //Added By Ken.Guo 2015-07-30
Try
lole_word.Application.NormalTemplate.Saved = TRUE //Alfee 01.17.2008	
lole_word.Application.Documents.Open(ls_temp_file,FALSE,TRUE)
gnv_word_utility.of_modify_word_property( lole_word.Activedocument)	//Added By Mark Lee 06/20/2013 change for office 2013.
gnv_shell.of_delete_recent( ls_temp_file, true) //Added By Ken.Guo 2010-05-25. Delete Windows Recent Document.
lole_document = lole_word.ActiveDocument
Catch (Throwable th)
	//----Begin Modified by Alfee 01.17.2008----
	f_word_destroy(lole_word, "")
	Destroy lole_document
	RETURN -1	
End Try

Try
//Clear invalid bookmark(s)
FOR i = 1 TO lole_document.Content.Bookmarks.Count
	ls_bookmark = lole_document.Content.Bookmarks.Item[i].Name
	IF Lower(Left(ls_bookmark,7)) <> "clause_" THEN
		lole_document.Content.bookmarks.item[i].Delete()
		i --
	END IF
NEXT

//Get clause bookmark(s) name in order
FOR i = 1 TO lole_document.Content.Bookmarks.Count
	ls_bm[i] = lole_document.Content.Bookmarks.Item(i).Name
NEXT

Catch (Throwable th2)
	f_word_destroy(lole_word, "")
	Destroy lole_document
	RETURN -1	//05.28.2007
End Try

//Veision control
IF adec_new_revision <> adec_old_revision THEN
	//Copy old revision to new revision and reset old revision. for Insert data again.
	lds_clause_temp.Reset()
	lds_clause.AcceptText()
	lds_clause.RowsCopy(1, lds_clause.rowcount(), Primary!, lds_clause_temp, 1, Primary!)	
	FOR i = 1 to ll_cnt
		lds_clause_temp.SetItem(i,"revision",adec_new_revision)
	Next
	lds_clause.Reset()	
	lds_clause_temp.RowsCopy(1, lds_clause_temp.rowcount(), Primary!, lds_clause, 1, Primary!)		
END IF	

//update dw_clause according to bookmarks
For i =  1 to ll_cnt
	ll_clause_id = lds_clause.object.ctx_acp_clause_id[i]
	lb_found = False
	For j =  1 to Upperbound(ls_bm)
		IF ls_bm[j] = "clause_" + string(ll_clause_id) THEN
			lb_found = True
			EXIT				
		END IF
	Next
	IF not lb_found THEN
		lds_clause.DeleteRow(i)
		i = i -1
		ll_cnt = ll_cnt -1
	END IF
NEXT
li_rtn = lds_clause.Update() 

lole_document.Close(0)
lole_word.Quit(0)
lole_word.DisconnectObject( )
Destroy lole_document
Destroy lole_word

Return li_rtn
end function

public function string of_generate_tempname (long al_doc_id, decimal adc_revision, string as_doc_name, string as_doc_ext);//////////////////////////////////////////////////////////////////////
// $<function>n_cst_dm_utils.of_generate_tempname()
// $<arguments>
// $<returns> string: Generated temporary file name
// $<description>Generate a temporary file name to store OLE content
// $<description>
//////////////////////////////////////////////////////////////////////
//Added By Ken.Guo 2010-06-30.
//////////////////////////////////////////////////////////////////////

String ls_file_name
int  i
boolean   ab_support=false
string ls_name

gnv_appeondll.of_parsepath(gs_dir_path + gs_DefDirName + "\Agreement\Manager\")

as_doc_ext = lower(as_doc_ext)

ls_file_name = gs_dir_path + gs_DefDirName + "\Agreement\Manager\" + as_doc_name + ' ' + string(al_doc_id) + "."+String(adc_revision,'##0.0')+"."+as_doc_ext

return ls_file_name
end function

public function integer of_convert2pdf (string as_sourcefile, string as_targetfile);//////////////////////////////////////////////////////////////////////
// $<function>n_cst_dm_utilsof_convert2pdf()
// $<arguments>
//		value	string	as_sourcefile		
//		value	string	as_targetfile		
// $<returns> integer
// $<description>
// $<description> Convert to file to PDF if it can be converted.
//////////////////////////////////////////////////////////////////////
// $<add> 2010-07-05 by Ken.Guo
//////////////////////////////////////////////////////////////////////

String ls_fileext,ls_prntrs,ls_SourceFile,ls_DefPrinter
Integer li_file,li_rtn
long ll_Len
oleobject lole_word
n_cst_filesrvwin32 lnv_filesvr
n_cst_image_functions_cp lnv_image_cp

If Not FileExists(as_sourcefile) Then 
	Messagebox('Convert to PDF Error','The source file '+as_sourcefile+' is not exists.')	
	Return -1
End If

ls_fileext = Lower(This.of_get_fileext( as_sourcefile, True))
lnv_image_cp = Create n_cst_image_functions_cp
If Not lnv_image_cp.of_is_image2pdf(ls_fileext) and ls_fileext <> 'doc' and ls_fileext <> 'docx'  Then
	If isvalid(lnv_image_cp) Then Destroy lnv_image_cp	
	Return 0
End If

If as_sourcefile = as_targetfile Then
	If isvalid(lnv_image_cp) Then Destroy lnv_image_cp	
	Return 0	
End If

//Added By Jay Chen 09-30-2014
n_cst_convert2pdf lnv_doctopdf 
lnv_doctopdf = create n_cst_convert2pdf
//end

//Delete the old target pdf file if exists.
/****************
IF FileExists(as_targetfile) THEN 
	IF Not FileDelete(as_targetfile) THEN 
		MessageBox("Convert to PDF Error", "Please delete the temp file of '" + as_targetfile + "' first! ")				
		RETURN -1
	END IF
END IF
******************/
 //Added By Jay Chen 09-30-2014
li_rtn = lnv_doctopdf.of_delete_file(as_targetfile)
if  li_rtn =  -1 then return -1
//end

SetPointer(HourGlass!)
If ls_fileext = 'doc' or ls_fileext = 'docx' Then
	//Check PDF Printer for Word dcoument
	/**********************
	if f_PrinterSetup(2) >= 2 then 
		Return -1
	end If
	ls_prntrs = PrintGetPrinters ( )
	IF NOT Pos(lower(ls_prntrs),lower("Contract Logix PDF Writer")) > 0 THEN
		MessageBox("Printer Error","The Contract Logix PDF Writer is not configured correctly!")
		If isvalid(lnv_image_cp) Then Destroy lnv_image_cp	
		RETURN -1
	END IF
	************************/
	//Added By Jay Chen 09-30-2014
	li_rtn =  lnv_doctopdf.of_check_pdfprinter()
	if li_rtn <> 1 then 
		If isvalid(lnv_image_cp) Then Destroy lnv_image_cp	
		return -1
	end if
	//end

	//Convert to PDF, get & convert Word document
	ls_SourceFile = "C:\Program Files\PDFPrinter\temp\SampleOut.PDF"
	//Delete temporary pdf file 
	/*********************
	IF FileExists(ls_SourceFile) THEN 
		IF Not FileDelete(ls_SourceFile) THEN 
			MessageBox("Printer Error", "Please delete the file of '" + ls_SourceFile + "' first! ")				
			If isvalid(lnv_image_cp) Then Destroy lnv_image_cp				
			RETURN -1
		END IF
	END IF
	**********************/
	//Added By Jay Chen 09-30-2014
	li_rtn = lnv_doctopdf.of_delete_file(ls_SourceFile)
	if li_rtn = -1 then
		If isvalid(lnv_image_cp) Then Destroy lnv_image_cp				
		RETURN -1
	end if
	//end
	
	lole_word = Create oleobject
	app_filler.of_set_word_safemode(false, 1) //Added By Ken.Guo 2015-07-30
	IF lole_word.Connecttonewobject("word.application") <> 0 THEN
		app_filler.of_set_word_safemode(false, 0) //Added By Ken.Guo 2015-07-30
		Destroy lole_word 
		Messagebox('Client Error', 'Could not connect to Microsoft Word. Please make sure it is properly installed.')
		If isvalid(lnv_image_cp) Then Destroy lnv_image_cp	
		RETURN -1
	END IF
	app_filler.of_set_word_safemode(false, 0) //Added By Ken.Guo 2015-07-30
	lole_word.Visible = FALSE	
	lole_word.Application.NormalTemplate.Saved = TRUE 

	If Not isvalid(w_appeon_gifofwait) Then OpenwithParm(w_appeon_gifofwait,"Converting to PDF...")
	SetPointer(HourGlass!)

	IF Isvalid(w_appeon_gifofwait) THEN w_appeon_gifofwait.event timer()
	
	//Delete temporary pdf file 
	IF FileExists(ls_SourceFile) THEN FileDelete(ls_SourceFile)
	
	//Open Word Document 		
	lole_word.Application.Documents.Open(as_sourcefile,false,true)	
	gnv_word_utility.of_modify_word_property( lole_word.Activedocument)	//Added By Mark Lee 06/20/2013 change for office 2013.
	gnv_shell.of_delete_recent( as_sourcefile, true) //Delete Windows Recent Document.
		
	//Set pdf Printer and print to PDF format
	Try
		/*********************
		ll_Len = 100
		ls_DefPrinter = SPACE(ll_Len)
		GetDefaultPrinter(ls_DefPrinter,ll_Len)	

		lole_word.ActiveDocument.Application.ActivePrinter = "Contract Logix PDF Writer"
		lole_word.ActiveDocument.Printout( 0 )
		lole_word.ActiveDocument.Close(0)
		
		SetDefaultPrinter(ls_DefPrinter)
		***********************/
		//Added By Jay Chen 09-30-2014
		lnv_doctopdf.of_printout_pdf( lole_word.Activedocument) 
		lole_word.ActiveDocument.Close(0)
		//end
	Catch(Throwable th1) 
		lole_word.ActiveDocument.Close(0)		
		lole_word.Quit(0)
		lole_word.DisconnectObject( )
		Destroy lole_word
		If isvalid(lnv_filesvr) Then Destroy lnv_filesvr		
		If isvalid(n_cst_filesrvwin32) Then Destroy n_cst_filesrvwin32
		IF Isvalid(w_appeon_gifofwait) THEN Close(w_appeon_gifofwait)
		if isvalid(lnv_doctopdf) then Destroy lnv_doctopdf //Added By Jay Chen 09-30-2014
		MessageBox("Printer Error","The Contract Logix PDF Writer is not configured correctly!")			
		RETURN -1
	End Try

	// Copy to target file
	If not isvalid(lnv_filesvr) Then lnv_filesvr = create n_cst_filesrvwin32
	/*****************
	Do 
		//Yield()
		If FileExists(ls_sourcefile) Then 
			li_file = FileOpen(ls_sourcefile, StreamMode!, Write!)
		Else
			li_file = -1
		End If
	Loop While li_file = -1
	FileClose(li_file)
	
	//lnv_filesvr.of_filecopy(ls_sourcefile, as_targetfile )
	filecopy(ls_sourcefile, as_targetfile ,true) //APB Blob Bug
	******************/
	//Added By Jay Chen 09-30-2014
	lnv_doctopdf.of_copy_pdf_file(ls_sourcefile,as_targetfile)
	//end
	
Else
	If lnv_image_cp.of_is_image2pdf(ls_fileext) Then
		If lnv_image_cp.of_convert2pdf(as_sourcefile, as_targetfile) <> 1 Then
			If isvalid(lnv_image_cp) Then Destroy lnv_image_cp
			If isvalid(n_cst_filesrvwin32) Then Destroy n_cst_filesrvwin32
			if isvalid(lnv_doctopdf) then Destroy lnv_doctopdf //Added By Jay Chen 09-30-2014
			Messagebox('Convert to PDF Error','Failed to convert the image file ' + as_sourcefile + ' to PDF.')
			Return -1
		End If
	Else
		//Unsupport File.
		If isvalid(lnv_image_cp) Then Destroy lnv_image_cp
		If isvalid(n_cst_filesrvwin32) Then Destroy n_cst_filesrvwin32
		IF Isvalid(w_appeon_gifofwait) THEN Close(w_appeon_gifofwait)
		if isvalid(lnv_doctopdf) then Destroy lnv_doctopdf //Added By Jay Chen 09-30-2014
		Return 0
	End If
End If

If isvalid(lnv_image_cp) Then Destroy lnv_image_cp
If isvalid(n_cst_filesrvwin32) Then Destroy n_cst_filesrvwin32
IF Isvalid(w_appeon_gifofwait) THEN Close(w_appeon_gifofwait)
if isvalid(lnv_doctopdf) then Destroy lnv_doctopdf //Added By Jay Chen 09-30-2014
Return 1
end function

public function integer of_create_clean_doc (string as_sourcefile, ref string as_targetfile, string as_from);//////////////////////////////////////////////////////////////////////
// $<function>n_cst_dm_utilsof_create_clean_doc()
// $<arguments>
//		value	string	as_sourcefile		
//		value	string	as_targetfile		
//		value	string	as_from      		
// $<returns> integer
// $<description>
// $<description> Create Clean Document. Need Delete all redlines and bookmarks.
//////////////////////////////////////////////////////////////////////
// $<add> 2010-07-05 by Ken.Guo
//////////////////////////////////////////////////////////////////////

String ls_clean_path,ls_ext,ls_filename
Integer i
oleobject lole_word
Long ll_comments_cnt,ll_revi_cnt
String ls_cleanfile_fullname

//Check file ext.
ls_ext = Mid(as_sourcefile, LastPos(as_sourcefile, ".") + 1)
If lower(ls_ext) = 'doc' Then Return 0

//Create directory
ls_clean_path = gs_dir_path + gs_DefDirName + "\Agreement\Email\CleanDoc\" + as_from  
IF Not DirectoryExists( ls_clean_path ) THEN
	If Not f_createdirectory(ls_clean_path ) Then
		Messagebox('ContractLogix','Failed to create temporary directory, please call support.')
		Return -1
	End If
END IF

//Delete the old target file if exists.
IF FileExists(as_targetfile) THEN 
	IF Not FileDelete(as_targetfile) THEN 
		MessageBox("Create Clean File Error", "Please delete the temp file of '" + as_targetfile + "' first! ")				
		RETURN -1
	END IF
END IF

//Generate word document
If lower(ls_ext) = 'doc' Then
	lole_word = Create oleobject
	app_filler.of_set_word_safemode(false, 1) //Added By Ken.Guo 2015-07-30
	IF lole_word.Connecttonewobject("word.application") <> 0 THEN
		app_filler.of_set_word_safemode(false, 0) //Added By Ken.Guo 2015-07-30
		Destroy lole_word 
		Messagebox('Client Error', 'Could not connect to Microsoft Word. Please make sure it is properly installed.')
		RETURN -1
	END IF
	app_filler.of_set_word_safemode(false, 0) //Added By Ken.Guo 2015-07-30

	//Accept revisions and remove comments in word	
	Try
		lole_word.Visible = FALSE	
		lole_word.Application.NormalTemplate.Saved = TRUE
		lole_word.Application.Documents.Open(as_sourcefile,False,True)
		gnv_word_utility.of_modify_word_property( lole_word.Activedocument)	//Added By Mark Lee 06/20/2013 change for office 2013.
		gnv_shell.of_delete_recent( as_sourcefile, true) //Added By Ken.Guo 2010-05-25. Delete Windows Recent Document.
		ll_revi_cnt = lole_word.ActiveDocument.Revisions.Count
		ll_revi_cnt += This.of_get_sharps_revision_count( lole_word.ActiveDocument) //Added By Ken.Guo 2010-10-14.
		ll_comments_cnt = lole_word.ActiveDocument.Comments.Count
		
		If ll_revi_cnt > 0 or ll_comments_cnt > 0 Then
			ls_filename = Mid(as_sourcefile,LastPos(as_sourcefile, "\") + 1, LastPos(as_sourcefile,'.') - LastPos(as_sourcefile, "\") + 1 ) + '(Clean).doc'
			ls_cleanfile_fullname = ls_clean_path + '\' + ls_filename
			//If document have redline.
			If ll_revi_cnt > 0 Then
				//lole_word.ActiveDocument.Revisions.AcceptAll()
				lole_word.ActiveDocument.AcceptAllRevisions() //Modified By Ken.Guo 2010-10-14
			End If
			ll_comments_cnt = lole_word.ActiveDocument.Comments.Count
			For i = ll_comments_cnt To 1 Step -1
				lole_word.ActiveDocument.Comments[i].Delete()
			Next
			//SaveAs to clean dir
			lole_word.ActiveDocument.SaveAS(ls_cleanfile_fullname,0,false,'',false)
			gnv_shell.of_delete_recent( ls_cleanfile_fullname, true) //Added By Ken.Guo 2010-05-25. Delete Windows Recent Document.
			If as_targetfile = '' Then
				as_targetfile = ls_cleanfile_fullname
			Else
				FileCopy(ls_cleanfile_fullname,as_targetfile,True)
			End If
		Else
			lole_word.ActiveDocument.Close(0)		
			lole_word.Quit(0)
			lole_word.DisconnectObject( )	
			If isvalid(lole_word) Then Destroy lole_word
			Return 0
		End If
		lole_word.ActiveDocument.Close(0)		
		lole_word.Quit(0)
		lole_word.DisconnectObject( )
	Catch(Throwable th1)
		lole_word.ActiveDocument.Close(0)		
		lole_word.Quit(0)
		lole_word.DisconnectObject( )
		Destroy lole_word		
		Return -1
	End Try

Else
	If isvalid(lole_word) Then Destroy lole_word
	Return 0
End If

If isvalid(lole_word) Then Destroy lole_word

Return 1

end function

public function string of_get_ocr_result (string as_filename);//////////////////////////////////////////////////////////////////////
// $<function>n_cst_dm_utilsof_get_ocr_result()
// $<arguments>
//		value	string	as_filename		
// $<returns> string
// $<description>
// $<description> Get the OCR result
//////////////////////////////////////////////////////////////////////
// $<add> 2010-07-08 by Ken.Guo
//////////////////////////////////////////////////////////////////////

String ls_doc_ext,ls_PdfText
n_cst_image_cp_ocr lnv_ocr

ls_doc_ext = This.of_get_fileext(as_filename)
If gnv_data.of_getitem('icred_settings' ,'set_48' , False ) = '1'  /*Global Search module is On*/ &
and gnv_data.of_getitem('icred_settings' ,'auto_ocr' , False ) = '1'  Then //Auto OCR is Yes
	lnv_ocr = Create n_cst_image_cp_ocr
	Choose Case Upper(ls_doc_ext) 
		Case 'PDF'
			inv_cst_pdf2text.of_pdf2text(as_FileName, ls_PdfText) //For searchable PDF.
			If ls_PdfText = '' Then
				ls_PdfText = lnv_ocr.of_ocr(as_FileName)
			End If
		Case 'BMP','TIF','TIFF','JPG','GIF'
				ls_PdfText = lnv_ocr.of_ocr(as_FileName)	
	End Choose
End If

Return ls_PdfText
end function

public function integer of_upload_file (long al_doc_id, decimal adc_revision, string as_filename, string as_ocr_result);//////////////////////////////////////////////////////////////////////
// $<function>n_cst_ovole_utils::of_upload_file()
// $<arguments>
//		value	long   	al_doc_id      :	Corresponding Document ID
//		value	decimal	adc_revision	:	Corresponding Document revision
//    value string   as_filename    :  Document File Name
//    value string   as_ocr_result  :  Document OCR Result
// $<returns> integer: 1 - Success
// 		             -1: Cannot generate temporary file.
//       		       -2: Failed to save data to the temporary file.
//            		    -3: Failed to read content from the temporary file.
//                    -4: Failed to insert base data to ctx_am_doc_image.
//                    -5: Failed to update blob value to ctx_am_doc_image.
// $<description>Save the content of current OCX to the corresponding record in the DB.
// $<description>
//////////////////////////////////////////////////////////////////////
//Created By Frank.Gui 
//Modified By Ken.Guo 2010-07-08.
//////////////////////////////////////////////////////////////////////

String ls_doc_ext
string ls_doc_ext_full	
Blob   lb_value
Int   li_count
Int	li_count_all 
String ls_pdftext
n_cst_image_cp_ocr lnv_ocr
boolean lb_delete_audit = false //Added By Jay Chen 08-21-2014
long ll_data_length

// Get blob from file
if of_readblob( as_filename, ref lb_value ) < 0 then
	If ib_show_msg Then  //Modify by Harry 12-28-2016 for task711
	messagebox('Error1','Failed to get document data')
	Else
		is_checkin_msg = 'Error1:Failed to get document data. doc_id:' + string(al_doc_id) + ' revision:' + string(adc_revision) + ' filename:' + as_filename
	End If
	gnv_debug.of_output(true,'Error1:Failed to get document data. doc_id:' + string(al_doc_id) + ' revision:' + string(adc_revision) + ' filename:' + as_filename) //Added By Jay Chen 08-21-2014
	return -1
end if

// Get File extend name
ls_doc_ext = Lower(of_get_fileext( as_filename ))
ls_doc_ext_full = Lower(of_get_fileext( as_filename ,true))	
// Check doc exists in DB
SELECT count(*) into :li_count FROM ctx_am_doc_image 
WHERE doc_id = :al_doc_id AND revision = :adc_revision;

//Check whether new document 
Select Count(1) Into :li_count_all From ctx_am_doc_image
Where doc_id = :al_doc_id;

//-------Appeon Begin ----modified by alfee at 03.14.2007 for performance tunning
//gnv_appeondb.of_commitqueue( ) //commented by alfee 09.14.2007
IF li_count < 1 THEN
	//Add doc_ext_full Field - jervis10.21.2009
	INSERT INTO ctx_am_doc_image (doc_id, revision, doc_ext, modify_date,doc_ext_full)
	VALUES(:al_doc_id, :adc_revision, :ls_doc_ext, getdate(),:ls_doc_ext_full);
	lb_delete_audit = true //Added By Jay Chen 08-21-2014
//---------Begin Modified by Alfee 09.14.2007---------------
//<$Reason>for check in/out operation
ELSE 	
	If ib_request_approve Then  //Add by Harry 2017-03-02 ib_request_approve is setted in u_tab_request_webform.of_document_mergedata_auto
		UPDATE ctx_am_doc_image SET modify_date = getdate()
		 WHERE doc_id = :al_doc_id AND revision = :adc_revision;
	Else
		//Add doc_ext,doc_ext_full fileds - jervis 10.21.2009
		UPDATE ctx_am_doc_image SET modify_date = getdate(),doc_ext = :ls_doc_ext,doc_ext_full = :ls_doc_ext_full  
		 WHERE doc_id = :al_doc_id AND revision = :adc_revision;
	End If
//----------End Modified -----------------------------------
//	if sqlca.sqlcode =  0 then
//		COMMIT;
//	ELSE
//		messagebox('Error2','Failed to save document to DB due to '+sqlca.sqlerrtext)
//		return -2
//	end if
END IF
//---------Begin Modified by Alfee 09.14.2007---------------
IF SQLCA.SQLCODE <> 0 THEN 
	If ib_show_msg Then  //Modify by Harry 12-28-2016 for task711
	MessageBox('Error2','Failed to save document to DB due to '+sqlca.sqlerrtext)
	Else
		is_checkin_msg = 'Error2:Failed to save document to DB due to '+sqlca.sqlerrtext + ' doc_id:' + string(al_doc_id) + ' revision:' + string(adc_revision) + ' filename:' + as_filename
	End If	
	gnv_debug.of_output(true,'Error2:Failed to save document to DB due to '+sqlca.sqlerrtext + ' doc_id:' + string(al_doc_id) + ' revision:' + string(adc_revision) + ' filename:' + as_filename) //Added By Jay Chen 08-21-2014
	RETURN -2
END IF
//----------End Modified -----------------------------------

// Store blob value to DB. 
UPDATEBLOB ctx_am_doc_image
SET image_file=:lb_value 
WHERE doc_id=:al_doc_id AND revision=:adc_revision;

//Added By Ken.Guo 2009-12-22. Rollback main data if updateblob failed.
//IF SQLCA.SQLCODE <> 0  THEN   
IF SQLCA.SQLCODE <> 0  or (isnull(lb_value) or len(lb_value) = 0) THEN //Modified By Jay Chen 08-21-2014 add blob value is null
	If ib_show_msg Then  //Modify by Harry 12-28-2016 for task711
	MessageBox('Error3','Failed to upload document to DB due to '+sqlca.sqlerrtext)
	Else
		is_checkin_msg = 'Error3:Failed to upload document to DB due to '+sqlca.sqlerrtext + ' doc_id:' + string(al_doc_id) + ' revision:' + string(adc_revision) + ' filename:' + as_filename
	End If	
	gnv_debug.of_output(true,'Error3:Failed to upload document to DB due to '+sqlca.sqlerrtext + ' doc_id:' + string(al_doc_id) + ' revision:' + string(adc_revision) + ' filename:' + as_filename) //Added By Jay Chen 08-21-2014
	If li_count_all = 0 Then
		Delete from ctx_am_doc_image Where doc_id = :al_doc_id;
		Delete from ctx_am_document where doc_id = :al_doc_id;
	End If
	//Added By Jay Chen 08-21-2014 delete audit document when document revision is new
	if lb_delete_audit then 
		Delete from ctx_am_doc_image WHERE doc_id=:al_doc_id AND revision=:adc_revision;
		Delete from Ctx_am_doc_audit WHERE doc_id=:al_doc_id AND revision=:adc_revision;
	end if
	//end add
	RETURN -3
END IF

//Added By Jay Chen 01-15-2015
SELECT Datalength(image_file) INTO :ll_data_length FROM ctx_am_doc_image WHERE doc_id = :al_doc_id AND revision = :adc_revision;	
If Isnull(ll_data_length) or ll_data_length = 0 Then
	If ib_show_msg Then  //Modify by Harry 12-28-2016 for task711
	Messagebox('Error5','Failed to upload the document. Because the file content does not exist in database, please delete the document (doc_id: '+ string(al_doc_id) + ' revision:' + string(adc_revision)+') in the Document Manager and reupload the original file to database.',Exclamation!)
	Else
		is_checkin_msg = 'Error5:Failed to upload document content to DB. Doc_id:' + string(al_doc_id) + ' revision:' + string(adc_revision) + ' filename:' + as_filename
	End If		
	gnv_debug.of_output(true,'Error5:Failed to upload document content to DB. Doc_id:' + string(al_doc_id) + ' revision:' + string(adc_revision) + ' filename:' + as_filename) 
	Return -5
End If		
//end

//Added By Ken.Guo 2009-07-01. If it is new 
IF li_count < 1 THEN
	Update ctx_am_document Set Revision = :adc_revision, doc_ext = :ls_doc_ext Where doc_id = :al_doc_id;
End  If

IF SQLCA.SQLCODE <> 0 THEN 
	If ib_show_msg Then  //Modify by Harry 12-28-2016 for task711
	MessageBox('Error4','Failed to save document to DB due to '+sqlca.sqlerrtext)
	Else
		is_checkin_msg = 'Error4:Failed to save document to DB due to '+sqlca.sqlerrtext + ' doc_id:' + string(al_doc_id) + ' revision:' + string(adc_revision) + ' filename:' + as_filename
	End If	
	gnv_debug.of_output(true,'Error4:Failed to save document to DB due to '+sqlca.sqlerrtext + ' doc_id:' + string(al_doc_id) + ' revision:' + string(adc_revision) + ' filename:' + as_filename) //Added By Jay Chen 08-21-2014
	RETURN -4
END IF
//-------Appeon End ---------------------


If gnv_data.of_getitem('icred_settings' ,'set_48' , False ) = '1'  /*Global Search module is On*/ &
and gnv_data.of_getitem('icred_settings' ,'auto_ocr' , False ) = '1'  Then //Auto OCR is Yes
	if as_ocr_result = '' Then 
		lnv_ocr = Create n_cst_image_cp_ocr
		Choose Case Upper(ls_doc_ext) 
			Case 'PDF'
				inv_cst_pdf2text.of_pdf2text(as_FileName, ls_PdfText) //For searchable PDF.
				If ls_PdfText = '' Then
					ls_PdfText = lnv_ocr.of_ocr(as_FileName)
				End If
			Case 'BMP','TIF','TIFF','JPG','GIF'
					ls_PdfText = lnv_ocr.of_ocr(as_FileName)	
		End Choose
		
		if Len(ls_PdfText) > 0 then
			UPDATE ctx_am_doc_image
			SET pdftext = :ls_PdfText
			WHERE doc_id = :al_doc_id AND revision = :adc_Revision;
		end if
	Else
		UPDATE ctx_am_doc_image
		SET pdftext = :as_ocr_result
		WHERE doc_id = :al_doc_id AND revision = :adc_Revision;		
	End if
End If

If isvalid(lnv_ocr) Then Destroy lnv_ocr

Return 1
end function

public function long of_get_sharps_revision_count (oleobject aole_document);//////////////////////////////////////////////////////////////////////
// $<function>n_cst_dm_utils.of_get_sharps_revision_count()
// $<arguments>
//		value	oleobject	aole_document		
// $<returns> long
// $<description> Get Revision Count for Sharps object.
// $<description>
//////////////////////////////////////////////////////////////////////
// $<add> 2010-10-14 by Ken.Guo
//////////////////////////////////////////////////////////////////////

Long ll_sharp_cnt,i,ll_sharp_revision_cnt,li_count
oleobject lole_sharp

ll_sharp_cnt = aole_document.Shapes.Count
For i = 1 To ll_sharp_cnt
	ll_sharp_revision_cnt = 0
	lole_sharp = aole_document.Shapes.Item(i)
	If lole_sharp.TextFrame.HasText Then
		ll_sharp_revision_cnt = Long(lole_sharp.TextFrame.TextRange.Revisions.Count)
		li_count += ll_sharp_revision_cnt	
	End If
Next

Return li_count
end function

public function integer of_accept_or_reject_sharp_revisions (oleobject aole_document, integer ai_type);//////////////////////////////////////////////////////////////////////
// $<function>n_cst_dm_utils.of_accept_or_reject_sharp_revisions()
// $<arguments>
//		value	oleobject aole_document
//		value	integer	ai_type	1: Accept all; 0: Reject all	
// $<returns> integer
// $<description>
// $<description> Accept or Reject all revisions in Sharps object.
//////////////////////////////////////////////////////////////////////
// $<add> 2010-10-14 by Ken.Guo
//////////////////////////////////////////////////////////////////////


Long ll_sharp_cnt,i,li_count
oleobject lole_sharp

ll_sharp_cnt = aole_document.Shapes.Count
For i = 1 To ll_sharp_cnt
	lole_sharp = aole_document.Shapes.Item(i)
	If lole_sharp.TextFrame.HasText Then
		li_count = lole_sharp.TextFrame.TextRange.Revisions.Count 
		If li_count > 0 Then
			If ai_type = 1 Then
				lole_sharp.TextFrame.TextRange.Revisions.AcceptAll()
			Else
				lole_sharp.TextFrame.TextRange.Revisions.RejectAll()
			End If
		End If
	End If
Next

Return 1
end function

public function String of_gettempfilename (string as_keyname);//////////////////////////////////////////////////////////////////////
// Function: of_gettempfilename()
// Arguments:
// 	value    string    as_keyname
//--------------------------------------------------------------------
// Return:  String
//--------------------------------------------------------------------
// Author:	 Ken.Guo 2011-05-20.
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
//////////////////////////////////////////////////////////////////////

String ls_FileName,ls_FileName1,ls_filepath
Long i,ll_max

ll_max = 1000 //max try times.

ls_filepath = gs_dir_path + gs_DefDirName
gnv_appeondll.of_parsepath(ls_filepath)
IF NOT DirectoryExists(ls_filepath) THEN Return ""


For i = 1 To ll_max
	ls_FileName = ls_filepath + "\" + as_keyname + String(i) + ".doc"
	If FileExists(ls_filename) Then
		If Not FileDelete(ls_filename) Then
			If i = ll_max Then
				Messagebox('Delete Temporary File','Failed to delete the temporary file "Temp*.doc". ~r~nThis will cause your WindWord.exe process to be locked up.  Please open Windows Task Manager (Ctrl-Alt-Del to bring up option to open Task Manager).  Click on the Process tab and look for the WINWORD.exe process and right click on that entry and click End Process.',Exclamation!)
				Return ''
			End If
			Continue
		End If
	End If
	
	ls_FileName1 = ls_filepath + "\~~$" + as_keyname + String(i) + ".doc"	
	If FileExists(ls_filename1) Then
		If Not FileDelete(ls_filename1) Then
			If i = ll_max Then
				Messagebox('Delete Temporary File','Failed to delete the temporary file "Temp*.doc". ~r~nThis will cause your WindWord.exe process to be locked up.  Please open Windows Task Manager (Ctrl-Alt-Del to bring up option to open Task Manager).  Click on the Process tab and look for the WINWORD.exe process and right click on that entry and click End Process.',Exclamation!)
				Return ''
			End If
			Continue
		End If
	End If
	
	Return ls_FileName
	
Next

Return ''
end function

public function integer of_add_audit_trail (long al_doc_id[], string as_action);str_ctx_email lstr_ctx_email

Return of_add_audit_trail(al_doc_id[],lstr_ctx_email,as_action)

////////////////////////////////////////////////////////////////////////
//// Function: of_add_audit_trail()
//// Arguments:
//// 	value    long      al_doc_id[]
//// 	value    string    as_action
////--------------------------------------------------------------------
//// Return:  integer
////--------------------------------------------------------------------
//// Author:	 Ken.Guo 2011-06-13.
////--------------------------------------------------------------------
//// Description:
////Add audit trail based on attached document ids in email
////Added by Alfee 11.28.2007
////Added as_action argument By Ken.Guo 2011-05-30. 
////--------------------------------------------------------------------
////////////////////////////////////////////////////////////////////////
//Long ll_cnt, i, ll_max_audit_id, ll_row, ll_doc_id
//DataStore lds_audit_trail, lds_document
//
//ll_cnt = UpperBound(al_doc_id)
//IF ll_cnt < 1 THEN RETURN 0
//
//lds_audit_trail = Create DataStore
//lds_audit_trail.DataObject = 'd_dm_doc_audit_browse'
//lds_audit_trail.SetTransObject(SQLCA)
//
//lds_document = Create DataStore
//lds_document.DataObject = 'd_dm_doc_audit_info'
//lds_document.SetTransObject(SQLCA)
//
//ll_cnt = lds_document.Retrieve(al_doc_id)
//
//FOR i = 1 to ll_cnt
//	ll_row = lds_audit_trail.InsertRow(0)
//	ll_max_audit_id = lds_document.GetItemNumber(i, "audit_id")
//	IF NOT ll_max_audit_id > 0 THEN ll_max_audit_id = 1	
//	lds_audit_trail.SetItem(ll_row, "doc_id", lds_document.GetItemNumber(i, "doc_id"))
//	lds_audit_trail.SetItem(ll_row, "audit_id", ll_max_audit_id)
//	lds_audit_trail.SetItem(ll_row, "revision", lds_document.GetItemDecimal(i, "revision"))
//	lds_audit_trail.SetItem(ll_row, "doc_ext", lds_document.GetItemString(i, "doc_ext"))
//	lds_audit_trail.SetItem(ll_row, "action", as_action) 
//	lds_audit_trail.SetItem(ll_row, "action_by", gs_user_id)
//	lds_audit_trail.SetItem(ll_row, "action_date", DateTime(Today(), Now())	)
//NEXT
//
//lds_audit_trail.Update()
//
//Destroy lds_document
//Destroy lds_audit_trail
//
//IF SQLCA.SQLCODE = -1 THEN
//	MESSAGEBOX("Add document", "Add audit trail records failed due to "+ sqlca.sqlerrtext)
//	RETURN -1
//END IF
//
//IF Isvalid(gw_contract) THEN
//	If gw_contract.tab_contract_details.ib_select9 = True Then
//		ll_doc_id = gw_contract.tab_contract_details.tabpage_images.tab_1.tabpage_data.il_preview_doc_id
//		IF ll_doc_id > 0 THEN gw_contract.tab_contract_details.tabpage_images.tab_1.tabpage_data.dynamic event ue_refresh_audit(ll_doc_id)
//	End If
//END IF
//
//RETURN 1
//
end function

public function integer of_add_audit_trail (long al_doc_id[], str_ctx_email astr_sertifi, string as_action);
//////////////////////////////////////////////////////////////////////
// Function: of_add_audit_trail()
// Arguments:
// 	value    long				al_doc_id[]
//		value 	str_ctx_email	str_sertifi
// 	value    string			as_action
//--------------------------------------------------------------------
// Return:  integer
//--------------------------------------------------------------------
// Author:	 Ken.Guo 2011-06-13.
//--------------------------------------------------------------------
// Description:
//Add audit trail based on attached document ids in email
//Added by Alfee 11.28.2007
//Added as_action,str_sertifi argument By Ken.Guo 2011-06-13. 
//--------------------------------------------------------------------
//////////////////////////////////////////////////////////////////////
Long ll_cnt, i, ll_max_audit_id, ll_row, ll_doc_id
DataStore lds_audit_trail, lds_document

ll_cnt = UpperBound(al_doc_id)
IF ll_cnt < 1 THEN RETURN 0

lds_audit_trail = Create DataStore
lds_audit_trail.DataObject = 'd_dm_doc_audit_browse'
lds_audit_trail.SetTransObject(SQLCA)

lds_document = Create DataStore
lds_document.DataObject = 'd_dm_doc_audit_info'
lds_document.SetTransObject(SQLCA)

ll_cnt = lds_document.Retrieve(al_doc_id)

//Added By Jay Chen 09-04-2014
string ls_mode,ls_license_user_id
choose case gs_esigntype
	case 'docusign'
		ls_mode = gnv_user_option.of_get_option_value(gs_user_id, "docusign_license_mode" )
	case 'echosign'
		ls_mode = gnv_user_option.of_get_option_value(gs_user_id, "echosign_license_mode" )
	case 'sertifi'
		ls_mode = gnv_user_option.of_get_option_value(gs_user_id, "sertifi_license_mode" )
end choose
if isnull(ls_mode) or ls_mode = '' then ls_mode = "global_license"
if ls_mode = "global_license" then
	ls_license_user_id = "global_license_user"
else
	ls_license_user_id = gs_user_id
end if
//end add

FOR i = 1 to ll_cnt
	ll_row = lds_audit_trail.InsertRow(0)
	ll_max_audit_id = lds_document.GetItemNumber(i, "audit_id")
	IF ll_max_audit_id = 0 or isnull(ll_max_audit_id) THEN ll_max_audit_id = 1	
	lds_audit_trail.SetItem(ll_row, "doc_id", lds_document.GetItemNumber(i, "doc_id"))
	lds_audit_trail.SetItem(ll_row, "audit_id", ll_max_audit_id)
	lds_audit_trail.SetItem(ll_row, "revision", lds_document.GetItemDecimal(i, "revision"))
	lds_audit_trail.SetItem(ll_row, "doc_ext", lds_document.GetItemString(i, "doc_ext"))
	lds_audit_trail.SetItem(ll_row, "action", as_action) 
	lds_audit_trail.SetItem(ll_row, "action_by", gs_user_id)
	lds_audit_trail.SetItem(ll_row, "action_date", DateTime(Today(), Now())	)
	If Len(astr_sertifi.as_sertifi_fileid) > 0 and UpperBound(astr_sertifi.as_sertifi_docid[]) = ll_cnt Then
		//Added By Jay Chen 10-22-2013 
		choose case gs_esigntype
			case 'sertifi'
				lds_audit_trail.SetItem(ll_row, "es_apicode", gnv_sertifi.is_apicode )		
			case 'echosign'
				lds_audit_trail.SetItem(ll_row, "es_apicode", gnv_echosign.is_apicode )	
			case 'docusign'
				lds_audit_trail.SetItem(ll_row, "es_apicode", gnv_docusign.is_apicode )	
		end choose	
		lds_audit_trail.SetItem(ll_row, "es_fileid", astr_sertifi.as_sertifi_fileid )
		lds_audit_trail.SetItem(ll_row, "es_docid", astr_sertifi.as_sertifi_docid[i] )
		lds_audit_trail.SetItem(ll_row, "es_sender", astr_sertifi.as_sender)
		lds_audit_trail.SetItem(ll_row, "es_sender_email", astr_sertifi.as_mail_from )
		lds_audit_trail.SetItem(ll_row, "esign_type", gs_esigntype ) //Added By Jay Chen 10-11-2013
		lds_audit_trail.SetItem(ll_row, 'es_license_user_id',ls_license_user_id) //Added By Jay Chen 09-04-2014
		lds_audit_trail.SetItem(ll_row, "echosign_method", gs_echosign_method ) //Added By Jay Chen 02-17-2016
	End If
	lds_audit_trail.SetItem(ll_row, "approve_id", astr_sertifi.al_approve_id  )
NEXT

lds_audit_trail.Update()

Destroy lds_document
Destroy lds_audit_trail

IF SQLCA.SQLCODE = -1 THEN
	MESSAGEBOX("Add document", "Add audit trail records failed due to "+ sqlca.sqlerrtext)
	RETURN -1
END IF

IF Isvalid(gw_contract) THEN
	If gw_contract.tab_contract_details.ib_select9 = True Then
		ll_doc_id = gw_contract.tab_contract_details.tabpage_images.tab_1.tabpage_data.il_preview_doc_id
		IF ll_doc_id > 0 THEN gw_contract.tab_contract_details.tabpage_images.tab_1.tabpage_data.dynamic event ue_refresh_audit(ll_doc_id)
	End If
END IF

RETURN 1

end function

public function integer of_add_audit_trail (str_add_audit astr_add_audit[]);//////////////////////////////////////////////////////////////////////
// Function: of_add_audit_trail()
// Arguments:
// 	value    str_add_audit    astr_add_audit[]
//--------------------------------------------------------------------
// Return:  integer
//--------------------------------------------------------------------
// Author:	 Ken.Guo 2011-06-29.
//--------------------------------------------------------------------
// Description: Insert audit data
//--------------------------------------------------------------------
//////////////////////////////////////////////////////////////////////

Long ll_doc_arr[],ll_find_row
Long ll_cnt, i, ll_max_audit_id, ll_row, ll_doc_id
DataStore lds_audit_trail, lds_document

ll_cnt = UpperBound(astr_add_audit[])
IF ll_cnt < 1 THEN RETURN 0
For i = 1 To ll_cnt
	ll_doc_arr[i] = astr_add_audit[i].doc_id
Next

lds_audit_trail = Create DataStore
lds_audit_trail.DataObject = 'd_dm_doc_audit_browse'
lds_audit_trail.SetTransObject(SQLCA)

lds_document = Create DataStore
lds_document.DataObject = 'd_dm_doc_audit_info'
lds_document.SetTransObject(SQLCA)

ll_cnt = lds_document.Retrieve(ll_doc_arr[])

FOR i = 1 to UpperBound(astr_add_audit[])
	ll_row = lds_audit_trail.InsertRow(0)
	ll_find_row = lds_document.Find('doc_id = ' + String(astr_add_audit[i].doc_id),1,lds_document.rowcount()  )
	If ll_find_row <= 0 Then Continue
	
	ll_max_audit_id = lds_document.GetItemNumber(ll_find_row, "audit_id")
	IF ll_max_audit_id = 0 or isnull(ll_max_audit_id) THEN ll_max_audit_id = 1	
	lds_audit_trail.SetItem(ll_row, "audit_id", ll_max_audit_id)	
	lds_audit_trail.SetItem(ll_row, "doc_id", astr_add_audit[i].doc_id )
	lds_audit_trail.SetItem(ll_row, "revision", astr_add_audit[i].revision )
	lds_audit_trail.SetItem(ll_row, "doc_ext", astr_add_audit[i].doc_ext)
	lds_audit_trail.SetItem(ll_row, "action",  astr_add_audit[i].action) 
	lds_audit_trail.SetItem(ll_row, "filename",  astr_add_audit[i].filename) 
	lds_audit_trail.SetItem(ll_row, "doc_from_type",  astr_add_audit[i].doc_from_type) 
	lds_audit_trail.SetItem(ll_row, "doc_from_name",  astr_add_audit[i].doc_from_name) 
	lds_audit_trail.SetItem(ll_row, "notes",  astr_add_audit[i].notes) 
	lds_audit_trail.SetItem(ll_row, "action_by", gs_user_id)
	lds_audit_trail.SetItem(ll_row, "action_date", DateTime(Today(), Now())	)
	
	lds_audit_trail.SetItem(ll_row, "es_apicode", astr_add_audit[i].astr_sertifi_doc.as_es_apicode )		
	lds_audit_trail.SetItem(ll_row, "es_fileid", astr_add_audit[i].astr_sertifi_doc.as_es_fileid)
	lds_audit_trail.SetItem(ll_row, "es_docid", astr_add_audit[i].astr_sertifi_doc.as_es_docid )
	lds_audit_trail.SetItem(ll_row, "es_sender", astr_add_audit[i].astr_sertifi_doc.as_es_sender)
	lds_audit_trail.SetItem(ll_row, "es_sender_email", astr_add_audit[i].astr_sertifi_doc.as_es_email )
	lds_audit_trail.SetItem(ll_row, "esign_type", gs_esigntype ) //Added By Jay Chen 10-22-2013
	lds_audit_trail.SetItem(ll_row, "approve_id",astr_add_audit[i].approve_id)
	
	lds_document.SetItem(ll_find_row, "audit_id",ll_max_audit_id )
NEXT

lds_audit_trail.Update()

Destroy lds_document
Destroy lds_audit_trail

IF SQLCA.SQLCODE = -1 THEN
	MESSAGEBOX("Add document", "Add audit trail records failed due to "+ sqlca.sqlerrtext)
	RETURN -1
END IF

IF Isvalid(gw_contract) THEN
	If gw_contract.tab_contract_details.ib_select9 = True Then
		ll_doc_id = gw_contract.tab_contract_details.tabpage_images.tab_1.tabpage_data.il_preview_doc_id
		IF ll_doc_id > 0 THEN gw_contract.tab_contract_details.tabpage_images.tab_1.tabpage_data.dynamic event ue_refresh_audit(ll_doc_id)
	End If
END IF

RETURN 1



/*
Long ll_max_audit_id

IF Isnull(astr_add_audit[i].doc_id) OR astr_add_audit[i].doc_id = 0 THEN RETURN -1

Select Max(audit_id)
Into :ll_max_audit_id
From Ctx_am_doc_audit
Where doc_id = :astr_add_audit[i].doc_id;

IF Isnull(ll_max_audit_id) OR ll_max_audit_id = 0 THEN
	ll_max_audit_id = 1
ELSE
	ll_max_audit_id ++
END IF

Insert Into Ctx_am_doc_audit (doc_id, audit_id, revision, action, 
action_by, action_date,	filename, doc_from_type, doc_from_name, notes, doc_ext,
es_apicode, es_fileid,es_docid,es_sender,es_sender_email)
Values (:astr_add_audit[i].doc_id, :ll_max_audit_id, :astr_add_audit[i].revision, :astr_add_audit[i].action, 
:gs_user_id, getdate(), :astr_add_audit[i].filename, :astr_add_audit[i].doc_from_type, 
:astr_add_audit[i].doc_from_name, :astr_add_audit[i].notes, :astr_add_audit[i].doc_ext,
:astr_add_audit[i].astr_sertifi_doc.as_es_apicode,:astr_add_audit[i].astr_sertifi_doc.as_es_fileid,:astr_add_audit[i].astr_sertifi_doc.as_es_docid,
:astr_add_audit[i].astr_sertifi_doc.as_es_sender,:astr_add_audit[i].astr_sertifi_doc.as_es_email );

IF SQLCA.SQLCODE = 0 THEN
	COMMIT;
ELSE
	MESSAGEBOX("Add document", sqlca.sqlerrtext)
	RETURN -1
END IF

IF Isvalid(gw_contract) THEN
	gw_contract.tab_contract_details.tabpage_images.tab_1.tabpage_data.dynamic event ue_refresh_audit(astr_add_audit[i].doc_id)
END IF
*/
RETURN 1

end function

public function string of_merge_file_name (long al_doc_id, decimal adec_revision, string as_doc_name, string as_doc_ext, integer ai_type);//Added By Ken.Guo 12/09/2011. 
String ls_doc_name

Choose Case ai_type
	Case 0 //Short Name
		ls_doc_name = as_doc_name + '.' + as_doc_ext
	Case 1 //Use Settings
		If gnv_data.of_getitem( 'icred_settings','doc_name_format', False) = '1' Then 
			ls_doc_name = as_doc_name + ' ' + String(al_doc_id) + '.' + String(adec_revision,'##0.0') + '.' + as_doc_ext
		Else
			ls_doc_name = as_doc_name + '.' + as_doc_ext
		End If	
	Case 2 //Long Name
		ls_doc_name = as_doc_name + ' ' + String(al_doc_id) + '.' + String(adec_revision,'##0.0') + '.' + as_doc_ext
End Choose

Return ls_doc_name
end function

public function integer of_get_clause_rule_reuslts (long al_ctx_id, long al_template_id, datastore ads_results, boolean ab_ctx_find);//Added by Alfee 11.12.2007
Integer li_result
Long i, ll_cnt, ll_clause_id, ll_row, ll_find,ll_Find2
DataStore lds_rules, lds_clauses,lds_ctx_find
string ls_where , ls_Error='', ls_Return, ls_Sql='', ls_Clause=''

SetPointer(HourGlass!) //01.21.2008

lds_rules = Create DataStore
lds_clauses = Create DataStore
lds_rules.DataObject = 'd_dm_template_clause_rules'
lds_clauses.DataObject = 'd_dm_template_clause_rules'

lds_ctx_find = create datastore
lds_ctx_find.dataobject = 'ds_sys_dynamic_sql'
lds_ctx_find.SettransObject( sqlca )
lds_ctx_find.Retrieve( gs_session_id )

//Get distinct clauses with rules defined
gnv_data.of_get_data_from_cache('template_clause_rules', 'ctx_acp_template_id = ' + String(al_template_id), lds_clauses) 

FOR i = 1 TO lds_clauses.RowCount()
	IF i = 1 THEN 
		ll_clause_id = lds_clauses.GetItemNumber(i, "ctx_acp_clause_id")
	ELSEIF ll_clause_id = lds_clauses.GetItemNumber(i, "ctx_acp_clause_id") THEN
		lds_clauses.DeleteRow(i)
		i --
	ELSE
		ll_clause_id = lds_clauses.GetItemNumber(i, "ctx_acp_clause_id")		
	END IF
NEXT

//Get rules' result for each clause
ll_cnt = lds_clauses.RowCount()
FOR i = 1 to ll_cnt
	//Get rules for the clause

	ll_clause_id = lds_clauses.GetItemNumber(i, "ctx_acp_clause_id")
	
	if ab_ctx_find then
//		lds_rules.Reset()
//		gnv_data.of_get_data_from_cache('template_clause_rules', 'ctx_acp_template_id = ' + String(al_template_id) + ' and ctx_acp_clause_id = ' + String(ll_clause_id), lds_rules) 
		// <RP> 1.10.2017 --------------------------------------------
		gnv_data.of_retrieveIfNecessary("template_clause_rules", FALSE)
		// <RP>
		gnv_data.ids_template_clause_rules.SetFilter(  'ctx_acp_template_id = ' + String(al_template_id) + ' and ctx_acp_clause_id = ' + String(ll_clause_id) )
		gnv_data.ids_template_clause_rules.Filter( )
		
		ll_Find = lds_ctx_find.find( "id1 = '" + string( al_ctx_id ) + "' and id2= '" + string( al_template_id ) + "' and id3 = '" + string( ll_clause_id ) + "'" , 1, lds_ctx_find.rowcount( ) )
		If ll_Find <= 0 Then
			ll_find = lds_ctx_find.InsertRow( 0 )
		End If
		lds_ctx_find.SetItem( ll_find, 'sessionid', gs_session_id )
		lds_ctx_find.SetItem( ll_find, 'id1', string(al_ctx_id ) )
		lds_ctx_find.SetItem( ll_find, 'id2', string( al_template_id ) )
		lds_ctx_find.SetItem( ll_find, 'id3', string( ll_clause_id ) )
		lds_ctx_find.SetItem( ll_find, 'arg_numbers', 1 )

		//Get and store result to the clause's rules
		string ls_updatecol[]
//		li_result = f_ctx_find( al_ctx_id, lds_rules,ls_updatecol,'1',ls_where)//add params - jervis 09.14.2010 //modified by gavins  20120723
		gf_ctx_find_ds( al_ctx_id, gnv_data.ids_template_clause_rules,ls_updatecol,'1',ls_where, lds_ctx_find, ll_find )//modified by gavins 20120730
	Else
		li_result = 1 
	End If
	ll_row = ads_results.InsertRow(0)
	ads_results.SetItem(ll_row, "ctx_id", al_ctx_id)
	ads_results.SetItem(ll_row, "ctx_acp_template_id", al_template_id)
	ads_results.SetItem(ll_row, "ctx_acp_clause_id", ll_clause_id)
	ads_results.SetItem(ll_row, "rules_result", li_result)	
NEXT

if ab_ctx_find then//added by gavins 20120731

	// <RP> 1.10.2017 --------------------------------------------
	gnv_data.of_retrieveIfNecessary("template_clause_rules", FALSE)
	// <RP>
	gnv_data.ids_template_clause_rules.Setfilter( "" )
	gnv_data.ids_template_clause_rules.Filter( )
		
	If  lds_ctx_find.Update( ) <> 1 Then
		MessageBox( 'Tips', SQLCA.SQLErrText )
	End If
		
	DECLARE dynamicsql PROCEDURE FOR up_dynamic_sql
				  :gs_session_id;
				  
		EXECUTE dynamicsql;
		
	If SQLCA.SQLCode < 0 Then
		ls_Error = SQLCA.SQLErrText 
		If gnv_data.ids_clause.RowCount( ) = 0 Then
			gnv_data.of_Retrieve( "clause")
		End If
	End If
	
	CLOSE dynamicsql;
		
	lds_ctx_find.Retrieve( gs_session_id )
	
	// <RP> 1.10.2017 --------------------------------------------
	gnv_data.of_retrieveIfNecessary("clause", FALSE)
	// <RP>
	For i = 1 To  ads_results.RowCount( )
		ll_clause_id = ads_results.GetItemNumber(i, "ctx_acp_clause_id")
		ll_Find = lds_ctx_find.find( "id1 = '" + string( al_ctx_id ) + "' and id2= '" + string( al_template_id ) + "' and id3 = '" + string( ll_clause_id ) + "'" , 1, lds_ctx_find.rowcount( ) )
		If ll_find > 0 Then
			ls_Return = lds_ctx_find.GetItemString( ll_Find, 'return_value1' )
			If ls_Return = 'error' Then
				ll_Find2 = gnv_data.ids_Clause.Find( "ctx_acp_clause_id=" + String ( ll_clause_id ) ,1, gnv_data.ids_Clause.RowCount( ) )
				ls_Sql = ls_Sql + "~r~n" + lds_ctx_find.GetItemString( ll_Find, 'sqlstring' )
				If ll_Find2 > 0 Then ls_Clause = ls_Clause + "~r~n" + gnv_data.ids_Clause.GetItemString( ll_Find2, 'clause_name' )
				ads_results.SetItem( i, "rules_result", 0 )
			Else
				ads_results.SetItem( i, "rules_result", integer( ls_Return ) )
			End If
		End If
	Next
	If Len( ls_Error ) > 0 Then
		IF IsValid(gnv_debug)THEN gnv_debug.of_output( true,  ls_Clause + "~r~n" +  ls_sql  +  ls_Error    )
		MessageBox( 'Tips' ,'Failed to execute rules of clause ( clause:' + ls_Clause + "~r~nsql:" +  ls_sql + "~r~n" + ls_Error + ")" , Exclamation!)
	End If
End If



If IsValid(lds_ctx_find) Then Destroy lds_ctx_find 
If IsValid(lds_rules) Then Destroy lds_rules 
If IsValid(lds_clauses) Then Destroy lds_clauses

RETURN 1

end function

public function integer of_download_picture (long al_pic_id, ref string as_file);//====================================================================
// Function: of_download_picture
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//                al_pic_id
//                as_file
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:         Ken.Guo           Date: 03/18/2013
//--------------------------------------------------------------------
//Copyright (c) 2008-2013 Contract Logix, Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


Blob  lb_image_data
Long ll_data_length,ll_ret
Integer li_counter, li_loops, li_MaxPosition, li_Position
Integer li_SetStep, li_NewStep, li_loopsR, li_rtn
Long ll_start, ll_find
String ls_title,ls_regstr,ls_lastupdate,ls_regupdate,ls_file_ext, ls_file_fullname
Boolean lb_needrestore = FALSE
Blob lb_data, lb_all_data
Datetime ldt_modify_date

// Get last modify date
//SELECT last_modified, file_ext ,Datalength(file_image)
//INTO :ldt_modify_date, :ls_file_ext, :ll_data_length
//FROM ctx_pictures
//WHERE id = :al_pic_id;

// <RP> 1.10.2017 --------------------------------------------
gnv_data.of_retrieveIfNecessary("ctx_pictures", FALSE)
// <RP>

ll_find = gnv_data.ids_pictures.Find('id = ' + String(al_pic_id), 1, gnv_data.ids_pictures.RowCount())
If ll_find > 0 Then
	ldt_modify_date = gnv_data.ids_pictures.GetItemDateTime(ll_find, 'last_modified')
	ls_file_ext = gnv_data.ids_pictures.GetItemString(ll_find, 'file_ext')
Else
	gnv_data.of_retrieve('ctx_pictures')
	ll_find = gnv_data.ids_pictures.Find('id = ' + String(al_pic_id), 1, gnv_data.ids_pictures.RowCount())
	If ll_find > 0 Then
		ldt_modify_date = gnv_data.ids_pictures.GetItemDateTime(ll_find, 'last_modified')
		ls_file_ext = gnv_data.ids_pictures.GetItemString(ll_find, 'file_ext')	
	End If
End If

If ll_find <= 0 Then
	//Messagebox('Download Picture','Failed to download the picture ('+String(al_pic_id)+'). ~r~n~r~nBecause the picture does not exist in Picture Painter.',Exclamation!)
	gnv_Status_Info.of_display( 'Error 1. Failed to download the picture (ID = '+String(al_pic_id)+').' , '1')
	gnv_debug.of_output(True, 'Failed to download the picture ( '+String(al_pic_id)+'). ~r~n~r~nBecause the picture does not exist in Picture Painter.')
	Return -1
End If

//Gen file name
 gnv_appeondll.of_parsepath(gs_dir_path + gs_DefDirName + "\Pictures\") 
 ls_file_fullname = gs_dir_path + gs_DefDirName + "\Pictures\pic_" + String(al_pic_id) + '.' + ls_file_ext

//Return the cache file if it is exist. 
ls_regstr = "pic_" + String(al_pic_id) 
ls_lastupdate = String(ldt_modify_date, "mm/dd/yyyy hh:mm:ss")
//Modified By Ken.Guo 2015-04-29
//gnv_appeondll.of_registryget("HKEY_LOCAL_MACHINE\SOFTWARE\"+gs_DefDirName+"\Pictures", ls_regstr, regstring!, ls_regupdate)
 gnv_filetime.of_getlastwritedatetime( ls_file_fullname, ls_regupdate)

If ls_regupdate = ls_lastupdate and ls_regupdate <> ''  Then
	If FileExists(ls_file_fullname) Then
		as_file = ls_file_fullname
		Return 1
	End If
End If

// Get file data from database
SetPointer(HourGlass!) 
IF appeongetclienttype() = 'PB' THEN

	SELECT Datalength(file_image)
	INTO  :ll_data_length
	FROM ctx_pictures
	WHERE id = :al_pic_id;

	IF SQLCA.SQLCODE = -1 THEN RETURN -1 

	IF ll_data_length = 0 OR Isnull(ll_data_length) THEN
		//Messagebox('Download Picture','Failed to download the picture ('+String(al_pic_id)+'). ~r~n~r~nBecause the picture content does not exist in database, please delete the picture (ID = '+String(al_pic_id)+') in the Picture Management and reupload the original file to database.',Exclamation!)
		gnv_Status_Info.of_display( 'Error 2. Failed to download the picture (ID = '+String(al_pic_id)+').' , '1')
		gnv_debug.of_output(True,  'Failed to download the picture (ID ='+String(al_pic_id)+'). ~r~n~r~nBecause the picture content does not exist in database, please delete the picture (ID = '+String(al_pic_id)+') in the Picture Management and reupload the original file to database.')
		Return -1		
	END IF

	//Get length of the blob
	IF ll_data_length > 8000 THEN 
		 IF Mod(ll_data_length,8000) = 0 THEN 
			  li_loops = ll_data_length/8000 
		 ELSE 
			  li_loops = (ll_data_length/8000) + 1 
		 END IF 
	ELSE 
		 li_loops = 1 
	END IF 

	//Get and store the blob
	li_rtn = 1
	FOR li_counter = 1 to li_loops
		ll_start = (li_counter - 1) * 8000 + 1
		SELECTBLOB substring(file_image,:ll_start,8000)
				INTO :lb_data
				FROM ctx_pictures
				WHERE id = :al_pic_id;
				
		IF SQLCA.SQLCODE = -1 THEN 
			li_rtn = -1
			EXIT
		END IF
		lb_all_data += lb_data
	NEXT 

	//Store the blob
	lb_image_data = lb_all_data
ELSE
	SELECTBLOB file_image
	INTO :lb_image_data
	FROM ctx_pictures
	WHERE id = :al_pic_id;

	If Len(lb_image_data) = 0 or  isnull(lb_image_data) Then
		//Messagebox('Download Picture','Failed to download the picture ('+String(al_pic_id)+'). ~r~n~r~nBecause the picture content does not exist in database, please delete the picture (ID = '+String(al_pic_id)+') in the Picture Painter and reupload the original file to database.',Exclamation!)
		gnv_Status_Info.of_display( 'Error 3. Failed to download the picture (ID = '+String(al_pic_id)+').' , '1')
		gnv_debug.of_output(True,  'Failed to download the picture ('+String(al_pic_id)+'). ~r~n~r~nBecause the picture content does not exist in database, please delete the picture (ID = '+String(al_pic_id)+') in the Picture Painter and reupload the original file to database.')
		Return -2
	End If		
	
	IF SQLCA.SQLCODE = -1 THEN 
		gnv_Status_Info.of_display( 'Error 4. Failed to download the picture (ID = '+String(al_pic_id)+').' , '1')
		//MessageBox( "DownLoad Picture", "Download Picture ("+String(al_pic_id)+") failed! ~r~n" + SQLCA.SQLERRTEXT )
		gnv_debug.of_output(True,  "Download Picture ("+String(al_pic_id)+") failed! ~r~n" + SQLCA.SQLERRTEXT )
		Return -3
	END IF
END IF

// Save blob value to a local file.
If of_saveblob(ls_file_fullname, lb_image_data) > 0 Then
	//Modified By Ken.Guo 2015-04-29
	//gnv_appeondll.of_registryset("HKEY_LOCAL_MACHINE\SOFTWARE\"+gs_DefDirName+"\Pictures", ls_regstr, regstring!, ls_lastupdate)
	 gnv_filetime.of_setlastwritedatetime( ls_file_fullname, ldt_modify_date)
Else
	gnv_Status_Info.of_display( 'Error 5. Failed to download the picture (ID = '+String(al_pic_id)+').' , '1')
	//MessageBox( "DownLoad Picture", "Download Picture ("+String(al_pic_id)+") failed!  Failed to write the file " +ls_file_fullname + "."  )
	gnv_debug.of_output(True,  "Download Picture ("+String(al_pic_id)+") failed!  Failed to write the file " +ls_file_fullname + "." )
	Return -4
End If

as_file = ls_file_fullname
Return 1


end function

public subroutine of_delete_directory_file (string as_dir);//====================================================================
// Function: of_delete_directory_file
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
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
Integer 		li_cnt, li_entries
String 		ls_import,ls_currdir
long 			ll_i,	ll_Rtn
n_cst_filesrv inv_filesrv

//n_cst_dirattrib lnv_dirlist[]
//SetPointer(HourGlass!)
//
//n_cst_filesrvwin32 lnv_filesrv
//lnv_filesrv = create n_cst_filesrvwin32
//
//ls_currdir = gs_dir_path + gs_DefDirName + "\Request\*.*"
//li_entries = lnv_filesrv.of_DirList(ls_currdir, 0, lnv_dirlist)
//
//for ll_i = 1 to upperbound(lnv_dirlist)
//    FileDelete ( gs_dir_path + gs_DefDirName + "\Request\" + lnv_dirlist[ll_i].is_filename )
//next
//
//Destroy lnv_filesrv
//SetPointer(arrow! )

if isnull(as_dir) or trim(as_dir) = '' then return 

//SetPointer(HourGlass!)
f_SetFileSrv(inv_filesrv,TRUE)
//ls_currdir = gs_dir_path + gs_DefDirName +"\Request"
ls_currdir = as_dir
ll_Rtn = inv_filesrv.of_deltree(ls_currdir, False)
Destroy inv_filesrv
//SetPointer(arrow! )
end subroutine

public function integer of_download_request_file (long al_rwf_id, long al_document_id, long al_request_id, string as_ext, ref string as_fullpath_name);long 		ll_getupdate,ll_data_length,li_loops,li_counter,ll_start,ll_BlobLen
Long 		ll_CurrentPos,li_Cnt
Blob 		lb_all_data,lb_data,lblb_Data
Integer 	li_FileNum,li_Writes, li_return
String 	ls_download_file
OleObject 		lole_save

ls_download_file = ''
as_fullpath_name = ''
if isnull(as_ext) or trim(as_ext) = '' then return -1

If Not DirectoryExists(gs_dir_path + gs_DefDirName + "\Request\") Then
	gnv_appeondll.of_parsepath(gs_dir_path + gs_DefDirName + "\Request\")
End If

ls_download_file = gs_dir_path + gs_DefDirName + "\Request\request_" + string(al_rwf_id) +"_" + string(al_document_id)+"_"+string(al_request_id) + '.' + as_ext

If Not Fileexists(ls_download_file) Then
	If  appeongetclienttype() <> 'PB' Then		
		SELECTBLOB document_content   
		Into	:lb_all_data
		FROM request_webform_document  
		Where rwf_id = :al_rwf_id and document_id = :al_document_id and request_id = :al_request_id		using sqlca ;
		
		IF SQLCA.SQLCODE = -1 THEN 
			gnv_debug.of_output(True,  "Download Request Document ("+String(al_document_id)+") failed! ~r~n" + SQLCA.SQLERRTEXT )
			Return -3
		END IF
	
	Else			
		SELECT Datalength(document_content )
		Into	:ll_data_length
		FROM request_webform_document  
		Where rwf_id = :al_rwf_id and document_id = :al_document_id and request_id = :al_request_id		using sqlca ;
		
		IF SQLCA.SQLCODE = -1 THEN 
			gnv_debug.of_output(True,  "Download Request Document ("+String(al_document_id)+") failed! ~r~n" + SQLCA.SQLERRTEXT )
			Return -3
		END IF
		
		If isnull(ll_data_length) Then ll_data_length = 0
		If ll_data_length > 8000 Then 
			If Mod(ll_data_length,8000) = 0 Then
				li_loops = ll_data_length /8000 
			Else
				li_loops = (ll_data_length /8000) + 1 
			End If 
		ElseIf ll_data_length > 0 Then 
			li_loops = 1 
		End If 
		
		For li_counter = 1 To li_loops				
			ll_start = (li_counter - 1) * 8000 + 1
			SELECTBLOB substring(document_content,:ll_start,8000)
			INTO :lb_data			
			FROM request_webform_document  
			Where rwf_id = :al_rwf_id and document_id = :al_document_id and request_id = :al_request_id		using sqlca ;
			
			IF SQLCA.SQLCODE = -1 THEN 
				EXIT
			END IF
			lb_all_data += lb_data
		Next 
	End If
	
//	If isnull(lb_all_data) Then lb_all_data = blob('')
//	If Len(lb_all_data) < 1 Then 
////		as_fullpath_name = ''
//		Return 0	 	
//	End If
//	
//	li_FileNum = FileOpen(ls_download_file , StreamMode! ,Write!,Shared!, Replace!)
//	If li_FileNum = -1 Then 
////		as_fullpath_name = ''
//		Return -1
//	End If
//		
//	ll_BlobLen = Len(lb_all_data)
//	If ll_BlobLen > 32765 Then
//		If Mod(ll_BlobLen, 32765) = 0 Then
//			li_Writes = ll_BlobLen / 32765
//		Else
//			li_Writes = (ll_BlobLen / 32765) + 1
//		End If
//	 Else
//		li_Writes = 1
//	End If
//	
//	ll_CurrentPos = 1
//	
//	For li_Cnt = 1 To li_Writes
//		lblb_Data = BlobMid(lb_all_data, ll_CurrentPos, 32765)
//		ll_CurrentPos += 32765
//		If FileWrite(li_FileNum, lblb_Data) = -1 Then
////			as_fullpath_name = ''
//			Return -1
//		End If
//	Next
//	
//	FileClose(li_FileNum)

	// Save blob value to a local file.
	If of_saveblob(ls_download_file, lb_all_data) <= 0  Then
		gnv_debug.of_output(True,  "Download Request Document ("+String(al_document_id)+") failed!  Failed to write the file " +ls_download_file + "." )
		Return -4
	End If

End If	

as_fullpath_name = ls_download_file
// Save blob value to a local file.
return 1


end function

public function integer of_download_merge_file (string as_fileid, string as_filename);//====================================================================
// Function: of_download_merge_file
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value    string    as_fileid
// 	value    string    as_filename
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	Jay Chen		Date: 11-27-2014
//--------------------------------------------------------------------
//	Copyright (c) 2008-2013 ContractLogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
Blob  lb_image_data
Long ll_data_length,ll_ret

// Get file data from database
IF appeongetclienttype() = 'PB' AND gs_dbtype = 'SQL' THEN		
	ll_ret = of_get_merge_blob(as_fileid, lb_image_data)
	IF ll_ret <= 0 THEN				
		MessageBox( "DownLoad File", "Download the merge file failed!" )		
		RETURN -1
	END IF
ELSE
	SELECT Datalength(attachment)
	INTO :ll_data_length
	FROM em_attachment_temp
	WHERE fileid = :as_fileid;	
	
	SELECTBLOB attachment
	INTO :lb_image_data
	FROM em_attachment_temp
	WHERE fileid = :as_fileid;	

	If Isnull(ll_data_length) or ll_data_length = 0 Then
		Messagebox('Download File','Failed to download the merge file.',Exclamation!)
		Return -1
	End If		
	
	IF SQLCA.SQLCODE = -1 THEN 
		MessageBox( "DownLoad File", "Download the merge file failed! ~r~n" + SQLCA.SQLERRTEXT )
		Return -1
	END IF
END IF

// Save blob value to a local file.
Return of_saveblob(as_filename, lb_image_data)



end function

public function integer of_get_merge_blob (string as_fileid, ref blob lb_image_data);//====================================================================
// Function: of_get_merge_blob
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value        string    as_fileid
// 	reference    blob      lb_image_data
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	Jay Chen		Date: 11-27-2014
//--------------------------------------------------------------------
//	Copyright (c) 2008-2013 ContractLogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

Integer li_counter, li_loops, li_MaxPosition, li_Position
Integer li_SetStep, li_NewStep, li_loopsR, li_rtn
Long ll_start, ll_data_length
String ls_title
Boolean lb_needrestore = FALSE
Blob lb_data, lb_all_data

SetPointer(HourGlass!) 

// Get file data from database
SELECT Datalength(attachment)
INTO :ll_data_length
FROM em_attachment_temp
WHERE fileid = :as_fileid;

IF SQLCA.SQLCODE = -1 THEN RETURN -1 

IF ll_data_length = 0 OR Isnull(ll_data_length) THEN
	RETURN 0
END IF

//Get length of the blob
IF ll_data_length > 8000 THEN 
  	 IF Mod(ll_data_length,8000) = 0 THEN 
        li_loops = ll_data_length/8000 
    ELSE 
  	     li_loops = (ll_data_length/8000) + 1 
    END IF 
ELSE 
  	 li_loops = 1 
END IF 

IF ib_show_msg THEN  //Modify by Harry 12-28-2016 for task711
//--------Begin Modified by Alfee 09.17.2007--------------------------------
//<$Reason>Display progress bar for the large blob
li_NewStep = 20
IF li_loops > li_NewStep THEN
	IF IsValid(w_appeon_gifofwait) THEN 
		//Keep the original progress bar
		lb_needrestore = TRUE
		ls_title = w_appeon_gifofwait.st_1.Text
		li_MaxPosition = w_appeon_gifofwait.hpb_1.MaxPosition
		li_Position = w_appeon_gifofwait.hpb_1.Position
		li_SetStep = w_appeon_gifofwait.hpb_1.SetStep
	ELSE
		OpenwithParm(w_appeon_gifofwait,"Getting the data...")
	END IF
	//Set the new progress bar
	li_loopsR = li_loops / li_NewStep
	IF Mod(li_loops, li_NewStep) <> 0 THEN li_loopsR ++
	w_appeon_gifofwait.st_1.Text = "Getting the data..."
	w_appeon_gifofwait.hpb_1.MaxPosition = li_loopsR * li_NewStep
	w_appeon_gifofwait.hpb_1.Position = 0
	w_appeon_gifofwait.hpb_1.SetStep = li_loopsR		
END IF
END IF

//Get and store the blob
li_rtn = 1
FOR li_counter = 1 to li_loops
	yield() //Added By Ken.Guo 05/30/2013
	ll_start = (li_counter - 1) * 8000 + 1
	SELECTBLOB substring(attachment,:ll_start,8000)
			INTO :lb_data
			FROM em_attachment_temp
			WHERE fileid = :as_fileid;
	IF SQLCA.SQLCODE = -1 THEN 
		li_rtn = -1
		EXIT
	END IF
	
	lb_all_data += lb_data
	
	IF ib_show_msg THEN  //Modify by Harry 12-28-2016 for task711
	//Change the progress bar
	IF IsValid(w_appeon_gifofwait) AND li_loops > li_NewStep THEN
		IF Mod(li_counter, li_loopsR) = 1 THEN w_appeon_gifofwait.hpb_1.StepIt() 
	ELSE
		IF IsValid(w_appeon_gifofwait) THEN w_appeon_gifofwait.hpb_1.StepIt()
	END IF
	END IF
	
NEXT 

IF ib_show_msg THEN  //Modify by Harry 12-28-2016 for task711
//Restore Progress Bar
IF IsValid(w_appeon_gifofwait) and li_loops > li_NewStep THEN 
	IF lb_needrestore THEN
		w_appeon_gifofwait.st_1.Text = ls_title
		w_appeon_gifofwait.hpb_1.MaxPosition = li_MaxPosition
		w_appeon_gifofwait.hpb_1.Position = li_Position
		w_appeon_gifofwait.hpb_1.SetStep = li_SetStep
	ELSE
		Close(w_appeon_gifofwait)
	END IF
END IF
END IF

//Store the blob
lb_image_data = lb_all_data

Return li_rtn



end function

public function integer of_filetimeget (string as_filename, ref datetime adt_lastmodified);//====================================================================
// Function: of_filetimeget
//--------------------------------------------------------------------
// Description: get last modified datetime from file.
//--------------------------------------------------------------------
// Arguments:
//                as_filename
//                adt_lastmodified
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:         Ken.Guo 2015-04-29
//--------------------------------------------------------------------
//Copyright (c) 2008-2015 Contract Logix, Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


Integer li_ret

String ls_filename
Datetime ldt_lastupdate
 
 If FileExists(as_filename) Then
	 gnv_filetime.of_getlastwritedatetime( ls_filename, adt_lastmodified)
Else
	Return -1
End If

Return 1
end function

public function integer of_filetimeget (string as_filename, ref string as_lastmodified);//====================================================================
// Function: of_filetimeget
//--------------------------------------------------------------------
// Description: get last modified datetime from file.
//--------------------------------------------------------------------
// Arguments:
//                as_filename
//                as_lastmodified
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:         Ken.Guo 2015-04-29
//--------------------------------------------------------------------
//Copyright (c) 2008-2015 Contract Logix, Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


Integer li_ret
Datetime ldt_lastupdate
li_ret = of_filetimeget(as_filename, ldt_lastupdate)
If li_ret > 0 Then
  as_lastmodified = String(ldt_lastupdate, 'mm/dd/yyyy hh:mm:ss')
  Return li_ret
Else
	Return -1
End If

Return 1


end function

public function integer of_filetimeset (string as_filename, datetime adt_lastmodified);//====================================================================
// Function: of_filetimeset
//--------------------------------------------------------------------
// Description: Set last modified datetime to file.
//--------------------------------------------------------------------
// Arguments:
//                as_filename
//                adt_lastmodified
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:         Ken.Guo 2015-04-29
//--------------------------------------------------------------------
//Copyright (c) 2008-2015 Contract Logix, Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


 If FileExists(as_filename) Then
	 gnv_filetime.of_setlastwritedatetime( as_filename, adt_lastmodified)
	 Return 1
Else
	Return -1
End If


end function

public function integer of_download_multi_files (long al_doc_id[], decimal adc_revision[], boolean ab_checkcompare, string as_extra_name, ref string as_filename[]);//====================================================================
// Function: of_download_multi_files
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value        long       al_doc_id[]
// 	value        decimal    adc_revision[]
// 	value        boolean    ab_checkcompare
// 	value        string     as_extra_name
// 	reference    string     as_filename[]
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	Jay Chen		Date: 09-21-2015
//--------------------------------------------------------------------
//	Copyright (c) 2008-2014 ContractLogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
Long ll_cnt, ll_cnt_ds, ll_found, i
String ls_doc_ext[], ls_search,ls_extname
DateTime ldt_modify_date[]
Blob  lb_image_data[]

//Begin - Added By Jay 2016-05-27.
//APB '28-digit Decimal' bug in datawindow Retrieval arguments is decimal array or number array
string ls_doc_id[], ls_revision[]

ll_cnt = UpperBound ( al_doc_id )
For i = 1 To ll_cnt
	ls_doc_id [i] = string ( al_doc_id [i] )	
Next
ll_cnt = UpperBound ( adc_revision )
For i = 1 To ll_cnt
	ls_revision [i] = string ( adc_revision [i] )	
Next
//ll_cnt_ds = ids_doc_image.Retrieve(al_doc_id, adc_revision) //Commented By Jay 2016-05-27
ll_cnt_ds = ids_doc_image.Retrieve(ls_doc_id, ls_revision)
//End - Added By Jay 2016-05-27.

IF ll_cnt_ds < 1 THEN RETURN -1

ll_cnt = UpperBound(al_doc_id) 
FOR i = 1 TO ll_cnt 	
	ls_search = "doc_id = " + String(al_doc_id[i]) + " and revision = " + String(adc_revision[i])
	ls_search = gnv_string.of_globalreplace( ls_search, ',', '.') //Added By Ken.Guo 2016-04-19. for french, the dicemal  symbol is ',', should convert to '.' in dw find function.
	ll_found = ids_doc_image.Find(ls_search, 1, ll_cnt_ds)
	IF ll_found > 0  THEN
		// Get files' extension, modify date & file name
		ls_doc_ext[i] = ids_doc_image.GetItemString(ll_found,"doc_ext")
		ldt_modify_date[i] = ids_doc_image.GetItemDateTime(ll_found,"modify_date")
//		as_filename[i] = Of_generate_tempname(al_doc_id[i], adc_revision[i], ls_doc_ext[i])
		//Modified By Jay Chen 09-21-2015
		if ab_checkcompare then
//			if i = 1 then
//				as_filename[i] = Of_generate_tempname(al_doc_id[i], adc_revision[i], ls_doc_ext[i],ab_checkcompare,'_clean')
//			else
//				as_filename[i] = Of_generate_tempname(al_doc_id[i], adc_revision[i], ls_doc_ext[i],ab_checkcompare,'_blacklined')
//			end if
			//Added By Jay Chen 11-16-2015
			if isvalid(w_dm_check_compare) then
				if al_doc_id[i] = w_dm_check_compare.istr_doc_compare.doc_id1 and adc_revision[i] = w_dm_check_compare.istr_doc_compare.revision1 then
					ls_extname = '_original'
				elseif al_doc_id[i] = w_dm_check_compare.istr_doc_compare.doc_id2 and adc_revision[i] = w_dm_check_compare.istr_doc_compare.revision2 then
					ls_extname = '_revisied'
				else
					ls_extname = '_compared'
				end if
				as_filename[i] = Of_generate_tempname(al_doc_id[i], adc_revision[i], ls_doc_ext[i],ab_checkcompare,ls_extname)
			end if
		else
			as_filename[i] = Of_generate_tempname(al_doc_id[i], adc_revision[i], ls_doc_ext[i])
		end if
		//end
		//Added By Jay Chen 09-21-2015
		if ab_checkcompare then
			 of_download_file(al_doc_id[i], adc_revision[i], as_filename[i])
		else
			// Compare modify date between local files and from db, if not same then download
			IF Not of_comparefile(al_doc_id[i], adc_revision[i], ls_doc_ext[i], ldt_modify_date[i]) THEN
				// Download file from DB
				IF of_download_file(al_doc_id[i], adc_revision[i], as_filename[i]) > 0 THEN
					//Save the latest update date of the current file in Registry
				
					//Modified By Ken.Guo 2015-04-29
					//of_updateregistry(al_doc_id[i], adc_revision[i], ls_doc_ext[i], ldt_modify_date[i])
					This.of_filetimeset( as_filename[i], ldt_modify_date[i])
				
				END IF
			END IF
		end if
	ELSE
		as_filename[i] = ""
		Return -1 //added by alfee 08.29.2007
	END IF
NEXT			

RETURN 1
end function

public function string of_generate_tempname (long al_doc_id, decimal adc_revision, string as_doc_ext, boolean ab_checkcompare, string as_extra_name);//====================================================================
// Function: of_generate_tempname
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value    long       al_doc_id
// 	value    decimal    adc_revision
// 	value    string     as_doc_ext
// 	value    boolean    ab_checkcompare
// 	value    string     as_extra_name
//--------------------------------------------------------------------
// Returns:  string
//--------------------------------------------------------------------
// Author:	Jay Chen		Date: 09-21-2015
//--------------------------------------------------------------------
//	Copyright (c) 2008-2014 ContractLogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

String ls_file_name
int  i
boolean   ab_support=false
string ls_name

gnv_appeondll.of_parsepath(gs_dir_path + gs_DefDirName + "\Agreement\Manager\")

as_doc_ext = lower(as_doc_ext)

//Use actual doc name - jervis 10.14.2009
//ls_file_name = gs_dir_path + gs_DefDirName + "\Agreement\Manager\doc_" + string(al_doc_id) + "_"+String(adc_revision)+"."+as_doc_ext
if al_doc_id > 0 then
	select doc_name into :ls_name from ctx_am_document where doc_id = :al_doc_id;
end if
if isnull(ls_name) then ls_name = ''

ls_file_name = gs_dir_path + gs_DefDirName + "\Agreement\Manager\" + ls_name + ' ' + string(al_doc_id) + "."+String(adc_revision,'##0.0') + as_extra_name +"."+as_doc_ext

return ls_file_name
end function

public function integer of_get_echosign_blob (string as_agreementid, string as_documentid, ref blob lb_image_data);//====================================================================
// Function: of_get_echosign_blob
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value        string    as_agreementid
// 	value        string    as_documentid
// 	reference    blob      lb_image_data
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	Jay Chen		Date: 02-22-2016
//--------------------------------------------------------------------
//	Copyright (c) 2008-2014 ContractLogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
Integer li_counter, li_loops, li_MaxPosition, li_Position
Integer li_SetStep, li_NewStep, li_loopsR, li_rtn
Long ll_start, ll_data_length
String ls_title
Boolean lb_needrestore = FALSE
Blob lb_data, lb_all_data

SetPointer(HourGlass!) 

// Get file data from database
SELECT Datalength(documentData)
INTO :ll_data_length
FROM esign_download_file
WHERE agreementid = :as_agreementid 
	AND documentid = :as_documentid 
	AND downloadid = (SELECT max(downloadid)FROM esign_download_file WHERE agreementid = :as_agreementid AND documentid = :as_documentid);

IF SQLCA.SQLCODE = -1 THEN RETURN -1 

IF ll_data_length = 0 OR Isnull(ll_data_length) THEN
	RETURN 0
END IF

//Get length of the blob
IF ll_data_length > 8000 THEN 
  	 IF Mod(ll_data_length,8000) = 0 THEN 
        li_loops = ll_data_length/8000 
    ELSE 
  	     li_loops = (ll_data_length/8000) + 1 
    END IF 
ELSE 
  	 li_loops = 1 
END IF 

//--------Begin Modified by Alfee 09.17.2007--------------------------------
//<$Reason>Display progress bar for the large blob
li_NewStep = 20
IF li_loops > li_NewStep THEN
	IF IsValid(w_appeon_gifofwait) THEN 
		//Keep the original progress bar
		lb_needrestore = TRUE
		ls_title = w_appeon_gifofwait.st_1.Text
		li_MaxPosition = w_appeon_gifofwait.hpb_1.MaxPosition
		li_Position = w_appeon_gifofwait.hpb_1.Position
		li_SetStep = w_appeon_gifofwait.hpb_1.SetStep
	ELSE
		OpenwithParm(w_appeon_gifofwait,"Getting the data...")
	END IF
	//Set the new progress bar
	li_loopsR = li_loops / li_NewStep
	IF Mod(li_loops, li_NewStep) <> 0 THEN li_loopsR ++
	w_appeon_gifofwait.st_1.Text = "Getting the data..."
	w_appeon_gifofwait.hpb_1.MaxPosition = li_loopsR * li_NewStep
	w_appeon_gifofwait.hpb_1.Position = 0
	w_appeon_gifofwait.hpb_1.SetStep = li_loopsR		
END IF

//Get and store the blob
li_rtn = 1
FOR li_counter = 1 to li_loops
	yield() //Added By Ken.Guo 05/30/2013
	ll_start = (li_counter - 1) * 8000 + 1
	SELECTBLOB substring(documentData,:ll_start,8000)
	INTO :lb_data
	FROM esign_download_file
	WHERE agreementid = :as_agreementid 
	AND documentid = :as_documentid 
	AND downloadid = (SELECT max(downloadid)FROM esign_download_file WHERE agreementid = :as_agreementid AND documentid = :as_documentid);
	IF SQLCA.SQLCODE = -1 THEN 
		li_rtn = -1
		EXIT
	END IF
	
	lb_all_data += lb_data
	
	//Change the progress bar
	IF IsValid(w_appeon_gifofwait) AND li_loops > li_NewStep THEN
		IF Mod(li_counter, li_loopsR) = 1 THEN w_appeon_gifofwait.hpb_1.StepIt() 
	ELSE
		IF IsValid(w_appeon_gifofwait) THEN w_appeon_gifofwait.hpb_1.StepIt()
	END IF
	
NEXT 

//Restore Progress Bar
IF IsValid(w_appeon_gifofwait) and li_loops > li_NewStep THEN 
	IF lb_needrestore THEN
		w_appeon_gifofwait.st_1.Text = ls_title
		w_appeon_gifofwait.hpb_1.MaxPosition = li_MaxPosition
		w_appeon_gifofwait.hpb_1.Position = li_Position
		w_appeon_gifofwait.hpb_1.SetStep = li_SetStep
	ELSE
		Close(w_appeon_gifofwait)
	END IF
END IF

//Store the blob
lb_image_data = lb_all_data

Return li_rtn



end function

public function integer of_download_echosign_file (string as_agreementid, string as_documentid, string as_filename);//====================================================================
// Function: of_download_echosign_file
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value    string    as_agreementid
// 	value    string    as_documentid
// 	value    string    as_filename
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	Jay Chen		Date: 02-22-2016
//--------------------------------------------------------------------
//	Copyright (c) 2008-2014 ContractLogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
Blob  lb_image_data
Long ll_data_length,ll_ret

// Get file data from database
IF appeongetclienttype() = 'PB' AND gs_dbtype = 'SQL' THEN		
	ll_ret = of_get_echosign_blob(as_agreementid, as_documentid, lb_image_data)
	IF ll_ret <= 0 THEN				
		MessageBox( "DownLoad File", "Download the merge file failed!" )		
		RETURN -1
	END IF
ELSE
	SELECT Datalength(documentData)
	INTO :ll_data_length
	FROM esign_download_file
	WHERE agreementid = :as_agreementid 
	AND documentid = :as_documentid 
	AND downloadid = (SELECT max(downloadid)FROM esign_download_file WHERE agreementid = :as_agreementid AND documentid = :as_documentid);	
	
	SELECTBLOB documentData
	INTO :lb_image_data
	FROM esign_download_file
	WHERE agreementid = :as_agreementid 
	AND documentid = :as_documentid 
	AND downloadid = (SELECT max(downloadid)FROM esign_download_file WHERE agreementid = :as_agreementid AND documentid = :as_documentid);		

	If Isnull(ll_data_length) or ll_data_length = 0 Then
		Messagebox('Download File','Failed to download the merge file.',Exclamation!)
		Return -1
	End If		
	
	IF SQLCA.SQLCODE = -1 THEN 
		MessageBox( "DownLoad File", "Download the merge file failed! ~r~n" + SQLCA.SQLERRTEXT )
		Return -1
	END IF
END IF

// Save blob value to a local file.
Return of_saveblob(as_filename, lb_image_data)



end function

public function string of_compare_doc (string as_filename, string as_doc_ext, long al_doc_id, decimal adc_revision, long al_ctx_id, ref boolean ab_modified);//////////////////////////////////////////////////////////////////// //
// $<function>of_compare_doc()
// $<arguments>
//		value	string   	as_filename     
//		value	string		as_doc_ext
//		value	long		al_doc_id	
//		value	decimal	adc_revision
//		value	long		al_ctx_id
//		reference	boolean	ab_modified
// $<returns> string 
// $<description> compare document
// $<description>
//////////////////////////////////////////////////////////////////////
// $<add> 12.27.2016 by Harry
//////////////////////////////////////////////////////////////////////
String ls_original_doc_nme
String ls_compare_doc
String ls_filename_convert
String ls_merge_tmp_file, ls_file_tempname 
Long li_count
Long ll_export_id, ll_ctx_id
long ll_ori_revision_count, ll_target_revision_count
long ll_cnt,ll_cnt_new,ll_cnt_target,ll_index
String ls_ret_filename
string ls_compare_combine = 'compare'
boolean lb_compare = false
string ls_target_file,ls_value,ls_value2
str_doc_info	lstr_docinfo
n_cst_ovole_utils lnv_ole_utils_doc
OleObject lole_word 
oleobject lole_object
constant long wdFormatDocument = 0 
ls_compare_doc = gs_dir_path + gs_DefDirName + "\Agreement\Manager\preview_compare.doc"
gnv_appeondll.of_parsepath(gs_dir_path + gs_DefDirName + "\Agreement\Manager")

IF NOT FileExists(as_filename) THEN RETURN ''

IF Lower(as_doc_ext) = "doc" AND of_get_fileext(Lower(as_filename)) = "doc" THEN	
	// -1 protected, 1 unprotected
	n_cst_word_utility 		ln_cst_word_utility
	ln_cst_word_utility  = Create n_cst_word_utility
	li_count = ln_cst_word_utility.of_unprotect_doc_file( as_filename)
	Destroy ln_cst_word_utility
	
	IF li_count > 0  THEN  
		TRY
			ls_filename_convert =of_convert_word_file_ext(as_filename)
			//IF gs_word_version = 'word2007' THEN //Word 2007 don't support compare fun. under OLE mode
				lole_word = Create oleobject
				app_filler.of_set_word_safemode(false, 1)
				IF lole_word.Connecttonewobject("word.application") <> 0 THEN
					app_filler.of_set_word_safemode(false, 0)
					If ib_show_msg Then  
						Messagebox('Client Error', 'Could not connect to Microsoft Word. Please make sure it is properly installed.')
					Else
						is_checkin_msg =  'Could not connect to Microsoft Word. Please make sure it is properly installed.'
						gnv_debug.of_output(true, is_checkin_msg )
					End If
					Destroy lole_word					
					RETURN ''
				END IF
				app_filler.of_set_word_safemode(false, 0) 
				lole_word.Application.NormalTemplate.Saved = TRUE 
				lole_word.Visible = FALSE
			//ELSE
			//	lole_word = ole_1.Object
			//END IF	
			IF al_doc_id > 0 THEN
				ls_original_doc_nme =of_download_file(al_doc_id, adc_revision)
				IF FileExists( ls_original_doc_nme ) THEN
					//------Begin add by alfee at 03.23.2007---------
					ls_file_tempname = gs_dir_path + gs_DefDirName + "\Agreement\Manager\compare_temp.doc"
					ls_merge_tmp_file = gs_dir_path + gs_DefDirName + "\Agreement\_merged_data.doc"
					FileCopy(ls_original_doc_nme, ls_merge_tmp_file,true)		
					FileCopy(ls_original_doc_nme, ls_file_tempname,true)		
					
					gnv_appeondb.of_startqueue( )	//jervis 02.25.2009
					Select ctx_acp_template.export_id Into :ll_export_id
					  From ctx_am_document,ctx_acp_template
					 Where ctx_am_document.doc_id = :al_doc_id
						And ctx_am_document.from_templete_id = ctx_acp_template.ctx_acp_template_id;
					//Add by jervis 02.25.22009
					select doc_name,create_date,create_by 
					into :lstr_docinfo.doc_name, :lstr_docinfo.ver_date,:lstr_docinfo.create_by
					from ctx_am_document
					where doc_id = :al_doc_id;
					gnv_appeondb.of_commitqueue( )	
					lstr_docinfo.ver_num = adc_revision
					//End by jervis 02.25.2009
					
					lnv_ole_utils_doc = Create n_cst_ovole_utils
					
					IF ll_export_id > 0 THEN
						lnv_ole_utils_doc.of_mergedata_auto(ll_export_id, al_ctx_id,ls_file_tempname,ls_merge_tmp_file,false,lstr_docinfo)
						lnv_ole_utils_doc.of_autonumbering(ls_merge_tmp_file)
					End If
					
					//Accept all revisions in target document - Moved here - Alfee 06.20.2008
					lnv_ole_utils_doc.of_acceptall(ls_merge_tmp_file)	
					//Added By Jay Chen 02-25-2016
					ll_ori_revision_count = lnv_ole_utils_doc.il_revision_count
					lnv_ole_utils_doc.il_revision_count = 0 
					lnv_ole_utils_doc.of_get_revision_count(as_filename)
					ll_target_revision_count = lnv_ole_utils_doc.il_revision_count
					lnv_ole_utils_doc.il_revision_count = 0 
					If IsValid(n_cst_ovole_utils) Then Destroy n_cst_ovole_utils
					
					//Open and Accept all revisions in current document
					//IF gs_word_version = 'word2007' THEN //It's different for the source and targer file in Word 2007
						//lole_word.Application.Documents.Open(ls_filename_convert, False, True)
						lole_word.Application.Documents.Open(ls_merge_tmp_file, False, True)	//Alfee 06.20.2008
						gnv_word_utility.of_modify_word_property( lole_word.Activedocument)	//Added By Mark Lee 06/20/2013 change for office 2013.
						gnv_shell.of_delete_recent( ls_merge_tmp_file, true) //Added By Ken.Guo 2010-05-25. Delete Windows Recent Document.
					//ELSE
					//END IF
					If lole_word.ActiveDocument.Revisions.Count >= 1 Then 					//Added By Mark Lee 05/21/2015
						lole_word.ActiveDocument.AcceptAllRevisions() //Modified By Ken.Guo 2010-10-14
					end if 		
					If gs_word_version = 'word2007' Then 
						ll_cnt = Long(lole_word.ActiveDocument.Comments.Count) //Added By Jay Chen 02-02-2016
						lole_word.ActiveDocument.Compare( ls_filename_convert, "External", 1, True, True, False )
						lb_compare = true
						ll_cnt_new = Long(lole_word.ActiveDocument.Comments.Count) //Added By Jay Chen 02-02-2016
						gnv_shell.of_delete_recent( ls_filename_convert, true) //Added By Ken.Guo 2010-05-25. Delete Windows Recent Document.
				
							
					ElseIf gs_word_version = 'word2003' or gs_word_version = 'wordxp' Then
					//If gs_word_version = 'word2007' or gs_word_version = 'word2003' or gs_word_version = 'wordxp' Then
					//--------End Modified -------------------------------------
						ll_cnt = Long(lole_word.ActiveDocument.Comments.Count) //Added By Jay Chen 02-02-2016
						lole_word.ActiveDocument.Compare( ls_merge_tmp_file, "External", 1, True, True, False )	
						lb_compare = true
						ll_cnt_new = Long(lole_word.ActiveDocument.Comments.Count) //Added By Jay Chen 02-02-2016
					Else
						f_set_doc_author('External')
						ll_cnt = Long(lole_word.ActiveDocument.Comments.Count) //Added By Jay Chen 02-02-2016
						lole_word.ActiveDocument.Compare( ls_merge_tmp_file)
						lb_compare = true
						ll_cnt_new = Long(lole_word.ActiveDocument.Comments.Count) //Added By Jay Chen 02-02-2016
						f_set_doc_author(gs_user_id)
					End If
					gnv_shell.of_delete_recent( ls_merge_tmp_file, true) //Added By Ken.Guo 2010-05-25. Delete Windows Recent Document.
					
					// Check revision changed of new document
					li_count = Long(lole_word.ActiveDocument.Revisions.Count) //10.31.2007
					
					//Begin - Added By Ken.Guo 2010-10-14. Check revision for sharps object.
					li_count += of_get_sharps_revision_count( lole_word.ActiveDocument )
					//End - Added By Ken.Guo 2010-10-14.
					if isnull(ll_cnt) then ll_cnt = 0
					if isnull(ll_cnt_new) then ll_cnt_new = 0
					if li_count = 0 and lb_compare then
						if ll_target_revision_count <> ll_ori_revision_count then //track change 
							li_count = 9998 //Modified By Jay Chen 02-25-2016 mean:Only accepted changes
						else
							if ll_cnt_new > ll_cnt then
								li_count = 9999 //mean is no less than 1. //Modified By Ken.Guo 2016-02-22
							elseif ll_cnt_new = ll_cnt then
								if ll_cnt > 0 then
									//open target document for compute comment
									if gs_word_version = 'word2007'  then
										ls_target_file = ls_filename_convert
									else
										ls_target_file = ls_merge_tmp_file
									end if
									Try
										lole_object = Create oleobject
										app_filler.of_set_word_safemode(false, 1)
										IF lole_object.Connecttonewobject("word.application") <> 0 THEN
											app_filler.of_set_word_safemode(false, 0) 
											If ib_show_msg Then 
												Messagebox('Client Error', 'Could not connect to Microsoft Word. Please make sure it is properly installed.')
											Else
												is_checkin_msg =  'Could not connect to Microsoft Word. Please make sure it is properly installed.'
												gnv_debug.of_output(true, is_checkin_msg )
											End If
											Destroy lole_object					
											RETURN ''
										END IF
										lole_object.Application.NormalTemplate.Saved = TRUE
										lole_object.Visible = FALSE
										lole_object.Application.Documents.Open(ls_target_file, False, True)
										app_filler.of_set_word_safemode(false, 0) 
										gnv_word_utility.of_modify_word_property(lole_object.Activedocument)
										gnv_shell.of_delete_recent(ls_target_file, True)	
									CATCH (Throwable th) 
										f_word_destroy(lole_object, "")
									End Try
									//get target document comments
									ll_cnt_target = Long(lole_object.ActiveDocument.Comments.Count)
									if isnull(ll_cnt_target) then ll_cnt_target = 0
									if ll_cnt_target <> ll_cnt then
										li_count = 9999 //mean is no less than 1. //Modified By Ken.Guo 2016-02-22
									else
										for ll_index = 1 to ll_cnt_target
											ls_value = lole_word.ActiveDocument.Comments.Item[ll_index].Range.Text  //original
											ls_value2  = lole_object.ActiveDocument.Comments.Item[ll_index].Range.Text //target
											if ls_value2 <> ls_value then
												li_count = 9999 //mean is no less than 1. //Modified By Ken.Guo 2016-02-22
												exit
											end if
										next
									end if
									lole_object.ActiveDocument.Close() 					
									lole_object.Quit(0)
									Destroy lole_object
								end if
							end if
						end if
					end if
					
					ab_modified = li_count > 0
					
					IF FileExists(ls_compare_doc) THEN FileDelete(ls_compare_doc)
					lole_word.ActiveDocument.TrackRevisions = FALSE //Added By Ken.Guo 2015-08-05. Turn off track status after compare.
					lole_word.ActiveDocument.SaveAs(ls_compare_doc, wdFormatDocument,false,'',false)
					gnv_shell.of_delete_recent( ls_compare_doc, true) //Added By Ken.Guo 2010-05-25. Delete Windows Recent Document.
					
					IF FileExists(ls_compare_doc) THEN
						ls_ret_filename = ls_compare_doc
					END IF
					
					//IF gs_word_version = 'word2007' THEN
						lole_word.ActiveDocument.Close() 					
						lole_word.Quit(0)
						Destroy lole_word
					//ELSE
					//	If ole_1.object.doctype > 0 Then ole_1.object.ActiveDocument.Saved = True //Added By Ken.Guo 2016-05-23. workaround Task 524
					//	ole_1.object.close()
					//END IF
				Else
					If ib_show_msg Then 
						Messagebox('Document','Failed to download file to '+ls_compare_combine+', please call support.') //Added By Ken.Guo 2010-01-05.
					Else
						is_checkin_msg =  'Failed to download file to '+ls_compare_combine+', please call support.'
						gnv_debug.of_output(true, is_checkin_msg )
					End If
					Return ''
				END IF
			END IF
			
		CATCH (runtimeerror rte)
			f_word_destroy(lole_word, "")
			If ib_show_msg Then 
				Messagebox('Document','Failed to '+ls_compare_combine+' two documents.')	
			Else
				is_checkin_msg = 'Failed to '+ls_compare_combine+' two documents.'
				gnv_debug.of_output(true, is_checkin_msg )
			End If
			Return ''
		END TRY
	End IF
END IF


Return ls_ret_filename
end function

public function integer of_check_in_doc (long al_doc_id, string as_filename_checkin, decimal adc_revision, boolean ab_revision_control, integer ai_version_increment, boolean ab_modified);//////////////////////////////////////////////////////////////////// //
// $<function>of_check_in_doc()
// $<arguments>
//		value	long   	al_doc_id     
//		value	string	as_filename_checkin
//		value	decimal	adc_revision	
//		value	boolean	ab_revision_control
//		value	integer	ai_version_increment
//		value	boolean	ab_modified
// $<returns> integer 
// $<description>  automatically check in a document received back via email manager.
// $<description>
//////////////////////////////////////////////////////////////////////
// $<add> 12.27.2016 by Harry
//////////////////////////////////////////////////////////////////////
str_add_doc lstr_add_doc
n_cst_dm_utils lnv_dm_utils
Integer li_rtn
Datetime ldt_modify
Decimal ldec_new_revision
Decimal ldec_max_revision
String ls_filename_extend, ls_filename
string ls_filename_extend_full
Long ll_action_type, ll_action_status
Datawindow ldw_null
long ll_code,ll_status
boolean lb_decline = false

u_tabpg_dm_data uo_document 

ldec_new_revision = adc_revision
ls_filename_extend = of_get_fileext(as_filename_checkin )
ls_filename_extend_full =  of_get_fileext(as_filename_checkin,true )

IF ab_Revision_control THEN
	Select Max(Revision) Into :ldec_max_revision From Ctx_am_doc_image	Where Doc_id = :al_doc_id;
	
	IF ai_version_Increment >0 THEN	
		IF ab_modified THEN
			// Increment revision number
			ldec_new_revision = of_newversion( ldec_max_revision )
		
			//Add doc_ext_full -- jervis 10.21.2009
			Insert Ctx_am_doc_image(Doc_id, Revision, doc_ext, modify_date,doc_ext_full)
			Values( :al_doc_id, :ldec_new_revision, :ls_filename_extend, getdate() ,:ls_filename_extend_full);
		END IF
	END IF		
END IF

// Update document to the DB	
IF ab_modified THEN 
	//<$Reason>For performance tuning

	IF of_upload_file( al_doc_id, ldec_new_revision, as_filename_checkin) < 0 THEN 
		RETURN	0	
	END IF	

	SELECT modify_date INTO :ldt_modify FROM Ctx_am_doc_image 
	 WHERE doc_id = :al_doc_id AND revision = :ldec_new_revision ;
END IF

// Set check out status to record
gnv_appeondb.of_startqueue( )
	Update Ctx_am_document
	Set Revision = :ldec_new_revision,
			checkout_by = '', 
			checkout_date = null, 
			checkout_status = '0',
			doc_ext = :ls_filename_extend
	Where doc_id = :al_doc_id;		
	Update ctx_am_image_approve_detail Set flag = 2 Where doc_id = :al_doc_id ;
	Update ctx_am_image_approve Set flag = 2 Where doc_id = :al_doc_id ;
	

	Update ctx_am_image_weblink
	Set flag = '-1'
	Where doc_id = :al_doc_id AND Revision = :adc_revision;		
gnv_appeondb.of_commitqueue( )	

IF IsValid(gw_contract) THEN	
	uo_document = gw_contract.tab_contract_details.tabpage_images.tab_1.tabpage_data
	uo_document.of_updateclausemap(as_filename_checkin,ldec_new_revision)
END IF
		
IF ab_modified AND Not IsNull(ldt_modify) THEN
	ls_filename = of_generate_tempname(al_doc_id, ldec_new_revision, ls_filename_extend)
	IF FileExists(as_filename_checkin) THEN li_rtn = FileCopy(as_filename_checkin, ls_filename, TRUE) 
	IF li_rtn > 0 THEN 
		//Modified By Ken.Guo 2015-04-29
		//lnv_dm_utils.of_updateregistry(il_doc_id, ldec_new_revision, ls_filename_extend, ldt_modify)
		gnv_filetime.of_setlastwritedatetime( ls_filename, ldt_modify)
	End If
END IF

///////////////////////////////////////////////////////////////////////
//// Trigger off audit trail
///////////////////////////////////////////////////////////////////////
str_add_audit lstr_add_audit

lstr_add_audit.doc_id = al_doc_id
lstr_add_audit.revision = ldec_new_revision
lstr_add_audit.filename = as_filename_checkin
//Modified by harry 2017-01-11
//lstr_add_audit.doc_from_name = Mid(as_filename_checkin, lastpos(as_filename_checkin,'\') + 1, Len(as_filename_checkin))
lstr_add_audit.doc_from_name = gs_user_id
IF Isnumber(lstr_add_audit.doc_from_name) THEN
	lstr_add_audit.doc_from_type = "1"		// Contract contacts
ELSE
	lstr_add_audit.doc_from_type = "2"		// System user
END IF
lstr_add_audit.notes = "Automatic Document Check-In From Email"
lstr_add_audit.doc_ext = ls_filename_extend

// automatically insert into action item after you check in document and complete the process in the to do list
//ll_action_type = Long(gnv_data.of_getItem("code_lookup","lookup_code","lookup_name = 'Contract Action Type' and code = 'Doc-Email-CheckIn'"))
//ll_action_status = Long(gnv_data.of_getItem("code_lookup","lookup_code","lookup_name = 'Contract Action Status' and code = 'Incomplete'"))



IF ab_modified THEN
	lstr_add_audit.action = "Check In - Modified"
ELSE
	lstr_add_audit.action = "Check In - Not Modified"
END IF	
of_add_audit_trail( lstr_add_audit )

Return 1

end function

public function integer of_check_in_from_email ();//////////////////////////////////////////////////////////////////// //
// $<function>of_check_in_from_email()
// $<arguments>
//		N/M
// $<returns> integer 
// $<description>  automatically check in a document received back via email manager.
// $<description>
//////////////////////////////////////////////////////////////////////
// $<add> 12.27.2016 by Harry
//////////////////////////////////////////////////////////////////////
Long i, j, ll_findrow, ll_match_cnt, ll_checkout_cnt
Long ll_doc_id, ll_ctx_id, ll_id
Long ll_action_type, ll_action_status
String ls_full_name, ls_format, ls_exportfile, ls_emlfile
String ls_track_document_change, ls_doc_ext, ls_filename_checkin
Integer li_index = 1, li_ret, li_error_cnt
Integer li_version_Increment	
decimal ldc_revision
Boolean lb_Revision_control
Boolean lb_modified = true
Long ll_docid[]
Date 		ld_today
DataStore lds_checkout_email
DataStore lds_match_email
str_checkin_errtext lstr_errtext
n_cst_easymail_pop3 inv_pop3
inv_pop3 = Create n_cst_easymail_pop3

lds_checkout_email = Create DataStore
lds_checkout_email.dataobject = 'd_checkout_email'
lds_checkout_email.SetTransObject(sqlca)

lds_match_email = Create DataStore
lds_match_email.dataobject = 'd_match_doc_email_list'
lds_match_email.SetTransObject(sqlca)


gnv_appeondb.of_startqueue( )
lds_checkout_email.retrieve()
lds_match_email.retrieve()
gnv_appeondb.of_commitqueue( )	

ll_checkout_cnt = lds_checkout_email.rowcount()
ll_match_cnt = lds_match_email.rowcount()
gnv_debug.of_output(false, "n_cst_dm_utils.of_check_in_from_email; ll_checkout_cnt = " + String(ll_checkout_cnt) + "; ll_match_cnt = " + String(ll_match_cnt) )  //Added By Harry 2017-01-11.
ls_track_document_change = gnv_data.of_getitem("icred_settings","track_document_change",false)
If isnull(ls_track_document_change) Then ls_track_document_change = ''
If ls_track_document_change = '1' Then
	If gnv_reg_ocx.of_check_ocx( 1,'', False) <> '' Then //1: office 
		Messagebox('Compare','Failed to compare new document.')
		Return -1
	End If
End If

li_version_Increment = of_get_app_setting("set_57","I")

ib_show_msg = false
SetPointer(HourGlass!) 
For i = 1 to ll_checkout_cnt
	Yield()
	ll_doc_id = lds_checkout_email.GetItemNumber(i, 'doc_id')
	ll_ctx_id = lds_checkout_email.GetItemNumber(i, 'ctx_id')
	ls_full_name =  lds_checkout_email.GetItemString(i, 'doc_full_name')
	ls_full_name = mid(ls_full_name, 1, lastpos(ls_full_name, '.') - 1 )
	ls_full_name = gnv_string.of_globalreplace( ls_full_name, '.', ' ') //Added By Harry 2017-01-11.
	//To find the document received back via email manager
	//ll_findrow = lds_match_email.Find("em_mail_items_mail_doc_id = " + String(ll_doc_id) + " and lower(em_mail_items_mail_attach_name) like '%" + lower(ls_full_name) + "%'", 1, ll_match_cnt)
	ll_findrow = lds_match_email.Find("em_mail_items_mail_doc_id = " + String(ll_doc_id) + " and trim(lower(mail_attach_name)) like '%" + trim(lower(ls_full_name)) + "%'", 1, ll_match_cnt)  //Added By Harry 2017-01-11.
	gnv_debug.of_output(false, "em_mail_items_mail_doc_id = " + String(ll_doc_id) + " and trim(lower(mail_attach_name)) like '%" + trim(lower(ls_full_name)) + "%' ; ll_findrow = " + String(ll_findrow) )  //Added By Harry 2017-01-11.
	If ll_findrow <= 0 Then Continue
	
	is_checkin_msg = ''
	ll_id = lds_match_email.GetItemNumber(ll_findrow,'em_mail_items_id')
	ls_format = lds_match_email.GetItemString(ll_findrow,'em_mail_items_mail_save_format')
	ls_doc_ext =  lds_checkout_email.GetItemString(i, 'doc_ext')
	ldc_revision = lds_checkout_email.GetItemDecimal(i, 'revision')
	
	inv_pop3.ib_show_msg = false 
	inv_pop3.is_checkin_filename = ls_full_name
	Choose Case Lower(ls_format)
		Case 'eml'
			ls_emlfile = inv_pop3.of_download_email( ll_id, ls_format)
			li_ret = inv_pop3.of_do_attach(ls_emlfile , ll_id , li_index,'checkin',ls_exportfile)
		Case 'doc'
			li_ret = inv_pop3.of_do_attach('' , ll_id , li_index,'checkin',ls_exportfile)
	End Choose
	If li_ret <> 1 and len(ls_exportfile) <= 0 Then 
		li_error_cnt++
		lstr_errtext.ctx_id[li_error_cnt] = ll_ctx_id
		lstr_errtext.doc_id[li_error_cnt] = ll_doc_id
		lstr_errtext.doc_name[li_error_cnt] = ls_full_name
		lstr_errtext.doc_ext[li_error_cnt] = ls_doc_ext
		lstr_errtext.errortext[li_error_cnt] = inv_pop3.is_checkin_msg
		gnv_debug.of_output(false, "of_do_attach; li_ret = " + String(li_ret) + "; em_mail_items_id = " + String(ll_id) + "; ll_ctx_id = " +String(ll_ctx_id) + "; ll_doc_id" + string(ll_doc_id) + "; em_mail_items_mail_save_format = " + String(ls_format) + "; ls_exportfile = " + String(ls_exportfile) + "; message = " +  inv_pop3.is_checkin_msg)  //Added By Harry 2017-01-11.
		Continue
	End If
	
	lb_modified = true
	If (Lower(ls_doc_ext) = 'doc' or Lower(ls_doc_ext) = 'docx' ) and ls_track_document_change = '1' Then
		ls_filename_checkin = of_compare_doc(ls_exportfile, ls_doc_ext, ll_doc_id, ldc_revision, ll_ctx_id, lb_modified)  //compare
		If Len(ls_filename_checkin) <= 0 Then
			li_error_cnt++
			lstr_errtext.ctx_id[li_error_cnt] = ll_ctx_id
			lstr_errtext.doc_id[li_error_cnt] = ll_doc_id
			lstr_errtext.doc_name[li_error_cnt] = ls_full_name
			lstr_errtext.doc_ext[li_error_cnt] = ls_doc_ext
			lstr_errtext.errortext[li_error_cnt] = is_checkin_msg
			gnv_debug.of_output(false, "of_compare_doc; li_ret = " + String(li_ret) + "; ll_ctx_id = " +String(ll_ctx_id) + "; ll_doc_id" + string(ll_doc_id) + "; message = " + is_checkin_msg)  //Added By Harry 2017-01-11.
			Continue
		End If
	Else
		ls_filename_checkin = ls_exportfile
	End If
	
	lb_Revision_control =  lds_checkout_email.GetItemString(i, 'revision_control') = "1"
	
	li_ret = of_check_in_doc(ll_doc_id, ls_filename_checkin, ldc_revision, lb_Revision_control, li_version_Increment, lb_modified)
	If li_ret < 1 Then 
		li_error_cnt++
		lstr_errtext.ctx_id[li_error_cnt] = ll_ctx_id
		lstr_errtext.doc_id[li_error_cnt] = ll_doc_id
		lstr_errtext.doc_name[li_error_cnt] = ls_full_name
		lstr_errtext.doc_ext[li_error_cnt] = ls_doc_ext
		lstr_errtext.errortext[li_error_cnt] = is_checkin_msg
		gnv_debug.of_output(false, "of_check_in_doc;  li_ret = " + String(li_ret) + "; ll_ctx_id = " +String(ll_ctx_id) + "; ll_doc_id" + string(ll_doc_id) + "; message = " + is_checkin_msg)  //Added By Harry 2017-01-11.
		Continue
	End If
	j++
	ll_docid[j] = ll_doc_id
Next 

ib_show_msg = true

// automatically insert into action item after you check in document and complete the process in the to do list
ll_action_type = Long(gnv_data.of_getItem("code_lookup","lookup_code","lookup_name = 'Contract Action Type' and code = 'Doc-Email-CheckIn'"))
ll_action_status = Long(gnv_data.of_getItem("code_lookup","lookup_code","lookup_name = 'Contract Action Status' and code = 'Complete'"))
ld_today = today()

gnv_appeondb.of_startqueue()
For j = 1 to UpperBound(ll_docid)
	INSERT INTO ctx_am_action_item(
							doc_id, action_type, due_date, wf_assigned_by,
							active_status, action_status, status_date,  create_date, action_user, 
							attempt_times, first_attempt, last_attempt, print_flag, notes)
			  	 VALUES (:ll_docid[j], :ll_action_type, :ld_today, :gs_user_id,
							0, :ll_action_status, :ld_today, :ld_today, :gs_user_id, 					
							1, :ld_today, :ld_today, -1, 'Automatic Document Check-In From Email') ;
Next
gnv_appeondb.of_commitqueue()

//the records of checkin failed
If li_error_cnt > 0 Then
	lstr_errtext.error_cnt = li_error_cnt
	lstr_errtext.suc_cnt = UpperBound(ll_docid)
	OpenWithParm(w_auto_checkin_errtext, lstr_errtext)
End If
SetPointer(Arrow!)

If IsValid(lds_checkout_email) Then Destroy lds_checkout_email
If IsValid(lds_match_email) Then Destroy lds_match_email
If isvalid(inv_pop3) Then Destroy inv_pop3
Return 1
end function

on n_cst_dm_utils.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_dm_utils.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;//by alfee at 03.19.2007
ids_doc_image = Create DataStore 
ids_doc_image.DataObject = 'd_dm_doc_image'
ids_doc_image.SetTransObject(Sqlca)


end event

event destructor;//by alfee at 03.19.2007
Destroy ids_doc_image 
end event

