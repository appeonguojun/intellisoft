$PBExportHeader$n_cst_word_utility.sru
forward
global type n_cst_word_utility from nonvisualobject
end type
end forward

global type n_cst_word_utility from nonvisualobject
end type
global n_cst_word_utility n_cst_word_utility

type variables
long		il_doc_id		//Added by Scofield on 2009-07-23

string 	is_chapter[] = {"##","@@"}
string 	is_paragraph = "#.0"
string 	is_section = "#.#"

Boolean	ib_Email		//added by gavins 20130529

DataStore ids_clausename //05.05.2007

//WdFindWrap
Constant int wdFindAsk = 2 
Constant int wdFindContinue = 1 
Constant int wdFindStop = 0 

//WdReplace
Constant int wdReplaceAll = 2 
Constant int wdReplaceNone = 0 
Constant int wdReplaceOne = 1

Constant long wdFieldKeyWord = 18 
Constant long wdFieldMergeField = 59 
Constant long wdFieldAutoTextList = 89
Constant long wdFieldExpression = 34
Constant long wdFieldRef = 3
Constant long wdFieldHyperlink  = 88
Constant Long wdFieldEmpty = -1
Constant Long wdFieldSequence = 12
Constant Long wdFieldDocVariable = 64	//02.23.2009 By Jervis

Constant Long wdUnderlineNone = 0
Constant Long wdColorBlack = 0
Constant Long wdNoProtection = -1 //03.10.2008

Constant long wdFormatDocument = 0 //Alfee 9.22.2008
constant int wdDoNotSaveChanges = 0 //Alfee 9.22.2008

constant int wdLine = 5 //Jervis 02.04.2009
constant int wdExtend = 1 //Jervis 02.04.2009
constant int wdMove = 0 //Added By Ken.Guo 2009-07-09.
constant int wdHeaderFooterEvenPages = 1	//Jervis 03.24.2009

constant int wdCharacter = 1 //Added By Ken.Guo 2009-06-26.
constant int wdCollapseEnd = 0
constant int wdCollapseStart = 1

constant int wdWithInTable = 12 //Added By Ken.Guo 2009-07-08.
constant int wdInFootnoteEndnotePane = 25
constant int wdInCommentPane = 26
constant int wdInHeaderFooter = 28

//wdViewType
constant int wdNormalView = 1
constant int wdOutlineView = 2
constant int wdPageView = 3				//Added By Mark Lee 06/19/2013 office 2007 default is 3
constant int wdPrintPreview = 4
constant int wdMasterView = 5
constant int wdOnlineView = 6
constant int wdReadingView = 7				//Added By Mark Lee 06/19/2013 office 2013 default is 7 

datastore ids_document_export_field //Added By Jay Chen 04-16-2014
datastore ids_export_all_field //Added By Jay Chen 09-19-2014
String is_web_docid,is_web_docname, is_webapproval_cllink,is_fileservice_cllink //Added By Ken.Guo 2016-08-23

private:
str_action_item istr_action_item  //Added by Harry 2017-04-17 for task747
end variables

forward prototypes
public function string of_parse_number (integer ai_num, string as_chapter)
public function string of_run_export (long al_export_id)
public function integer of_add_merge_field (oleobject aole_word, string as_merge_field)
public function integer of_insert_number (oleobject aole_word, string as_num, string as_switch)
public function integer of_get_template_file (long al_templateid, datetime adt_lastupdate)
public function integer of_update_field (oleobject aole_word, boolean ab_ref)
public function long of_update_refmark (oleobject aole_word, integer ai_item[])
public function integer of_preview (oleobject aole_word, boolean ab_ref)
public function string of_get_clause_file (long al_clauseid, datetime adt_lastupdate)
public function integer of_new_word_document (olecustomcontrol aole_1, string as_filename)
public function string of_get_requirement_file (long al_reqmnt_id)
public function integer of_update_reqmnt_field (oleobject aole_word, long al_doc_or_template_id, string as_type)
public function string of_run_export (long al_export_id, long al_ctx_id[])
public function integer of_refresh_reqmnt_fields (oleobject aole_word, long al_ctx_id, ref string as_error)
public function integer of_apply_clause_rules (string as_file_name, long al_template_id, long al_ctx_id)
public function integer of_put_clause_file (long al_clause_id, datetime adt_lastupdate)
public function integer of_add_requirement_field (oleobject aole_word, string as_field_name, long al_field_id, boolean ab_parent_data)
public function integer of_add_requirement_field (oleobject aole_word, long al_reqmnt_id, string as_field_name, long al_field_id, boolean ab_parent_data)
public function integer of_goto_requirement_field (oleobject aole_word, long al_field_id, boolean ab_parent_data)
public function integer of_remove_reqmnt_field (oleobject aole_word, long al_field_id, boolean ab_parent_data)
public function integer of_remove_reqmnt_fields (oleobject aole_word, long al_field_id[], boolean ab_parent_data[], ref string as_error)
public function boolean of_isexist_requirement (oleobject aole_word, long al_field_id, boolean ab_parent_data)
public function integer of_refresh_reqmnt_fields (oleobject aole_word, long al_reqmnt_id[], string as_field_name[], long al_field_id[], boolean ab_parent_data[], ref string as_error)
public function integer of_refresh_reqmnt_fields_name (oleobject aole_word, string as_field_name[], long al_field_id[], ref string as_error)
public function string of_get_status_link ()
public function integer of_replace_export_word (oleobject aole_word, ref string as_subject, long al_ctx_id, long al_export_id)
public function integer of_replace_export_word (oleobject aole_word, ref string as_subject, long al_ctx_id, long al_export_id, ref datastore ads_export, boolean ab_new_export, long al_ctx_ids[])
public function integer of_replace_export_word (oleobject aole_word, ref string as_subject, long al_ctx_id, long al_export_id, ref datastore ads_export, boolean ab_new_export)
public function integer of_update_clausecolor (oleobject aole_word, long al_clauseid[])
public function integer of_update_wordcomment (oleobject aole_word, long al_clauseid[])
public function integer of_update_clausecolor (oleobject aole_word, long al_clauseid)
public function integer of_update_wordcomment (oleobject aole_word, long al_clauseid)
public function integer of_put_template_file (long al_templateid, datetime adt_newupdate, datetime adt_lastupdate)
public function integer of_put_template_file (long al_templateid, datetime adt_newupdate)
public function string of_combine_doc (string as_sourcefile, string as_user1, string as_targetfile, string as_user2)
public function string of_urldecode (string as_link)
public function integer of_hextodec (string as_data)
public function integer of_unprotect_doc (oleobject aole_doc)
public function integer of_unprotect_doc (oleobject aole_doc, boolean abln_msgbox)
public function integer of_unprotect_doc_file (string as_filename)
public subroutine of_modify_word_viewtype (oleobject aole_doc)
public subroutine of_modify_word_property (oleobject aole_doc)
public function integer of_get_document_export_field (oleobject aole_word, long ai_ctx_id, long ai_export_id)
public subroutine of_get_compute_relate_field (string as_name, long ai_ctx_id)
public function string of_get_mergefield_name (string as_text)
public subroutine of_set_web_values (long al_docid, string as_docname, string as_webapproval_cllink, string as_fileservice_cllink)
public subroutine of_set_web_values (long al_docid[], string as_docname[], string as_webapproval_cllink[], string as_fileservice_cllink[])
public subroutine of_set_str_action_item (str_action_item astr_action_item)
end prototypes

public function string of_parse_number (integer ai_num, string as_chapter);
integer i,j, li_a, li_r[], li_max = 1000
string ls_a[], ls_rtn
string a[10,3]={"","I","II","III","IV","V","VI","VII","VIII","IX", "","X","XX","XXX","XL","L","LX","LXX","LXXX","XCC","","C","CC","CCC","CD","D","DC","DCC","DCCC","CM"}  
string as_char[] = {"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"}

choose case as_chapter
	case is_chapter[1]
		//handle 3 digits
		if ai_num >= li_max then 
			ls_rtn = string(ai_num)
		else
			li_a = ai_num
			for i = 3 to 1 step -1
			   li_max = li_max/10	
				j = int(li_a / li_max)
				ls_a[i] = a[j+1,i] 
				li_a = li_a - j * li_max
				ls_rtn +=ls_a[i]
			next
		end if
	case is_chapter[2]
		if ai_num > 26 or ai_num < 1 then 
			ls_rtn = string(ai_num)
		else
			ls_rtn = as_char[ai_num]		
		end if
	case else
		ls_rtn = string(ai_num)
end choose

return ls_rtn

//   1. Please enter number:863
//      863=DCCCLXIII
//   2. Please enter number: 256
//      256=CCLVI
//   3. Please enter number:355
//      355=CCCLV
//   4. Please enter number:522
//      522=DXXII
//   5. Please enter number:15
//      15=XV
//


end function

public function string of_run_export (long al_export_id);//////////////////////////////////////////////////////////////////////
// $<function>w_agreement_template_painter.of_run_export()
// $<arguments>
//		value	long	al_export_id		
// $<returns> string - The exported file name with full path.
// $<description>Get exported text file
//////////////////////////////////////////////////////////////////////
// $<add> 12.08.2006 by Alfee (Contract Logix Agreement Tamplate Painter)
//////////////////////////////////////////////////////////////////////

string ls_path, ls_return, ls_temp, ls_ctxid, ls_format
integer i, j, li_position, li_return, li_type
Long ll_ctx_id[], ll_current
Boolean lb_existed = False
pfc_n_cst_ai_export_apb  n_export

IF isnull( al_export_id ) OR al_export_id = 0 THEN
       Messagebox( "Caution", "No export file selected!" )
       return '';
END IF

SELECT save_path, export_type, export_format
	INTO :ls_path, :li_type, :ls_format
	FROM export_header WHERE export_id = :al_export_id;

IF isnull( ls_path ) or Trim( ls_path ) = '' THEN
       Messagebox( "Caution", "No Save Path set for current export file!" )
       return '';
END IF

IF li_type <> 3 and li_type <> 4 THEN
       //Messagebox( "Cuation", "Current export file is not prepared for Contract!" )
     	 Messagebox( "Caution", "Current export file is not prepared for Contract!" )
       return '';
END IF

IF Left( ls_format, 1 ) <> '.' THEN ls_format = ''

Open( w_rpt_contract_search )

ls_return = Message.StringParm
IF ls_return = '' THEN return '';

Do
  ls_temp = f_get_token( ls_return, "|" )
       li_position = Pos( ls_temp, "~t" )
       ls_ctxid = Left( ls_temp, li_position - 1 )
       ll_current = Long( ls_ctxid )
       for j = 1 to Upperbound( ll_ctx_id )
              IF ll_ctx_id[ j ] = ll_current THEN
                     lb_existed = True
                     exit;
              END IF
       next
       IF Not lb_existed THEN
              i++;
              ll_ctx_id[i] = ll_current
       END IF
       lb_existed = False
Loop While ls_return <> ''

 
n_export = CREATE pfc_n_cst_ai_export_apb
n_export.is_called_type = '2' //Rodger Wu set '2'.
n_export.ib_header = TRUE // added by alfee at 04.18.2007
n_export.of_set_replace_multi_field_symbol( true)		//Added By Mark Lee 07/20/2016
li_return = n_export.of_export_data_with_text_ctx( al_export_id, ll_ctx_id, ls_path, 0, "","","",2,"" )

IF li_return = 1 THEN
		//----Begin modified by Alfee 08.28.2007----------------
      //ls_format = ".txt" //added by alfee 05.22.2007
		//return ls_path + ls_format;
		return ls_path
		//----End Modifiied ------------------------------------
ELSE
       return '';
END IF

end function

public function integer of_add_merge_field (oleobject aole_word, string as_merge_field);//////////////////////////////////////////////////////////////////////
// $<function>of_add_merge_field()
// $<arguments>
//		valuea	string: 
// $<returns> integer
// $<description>Add a merge field in word document
//////////////////////////////////////////////////////////////////////
// $<add> 04.20.2007 by Alfee (Contract Logix Clause Painter)
//////////////////////////////////////////////////////////////////////
IF Not IsValid(aole_word) THEN RETURN -1
long li_Index,li_count
Boolean lb_Exist
string ls_name

OleObject lole_Variable


SetPointer(HourGlass!)
If len(as_merge_field) > 0 Then
	//of_unprotect_doc(aole_word) //unprotect document if need - alfee 03.10.2008
	IF of_unprotect_doc(aole_word) = -1 THEN RETURN -1 //Alfee 10.08.2008
	
	//Start code by Jervis on 02.23.2009
	//Add Version Info Field
	if Match(as_merge_field,"\<\<.*\>\>") then
		li_count = aole_word.Variables.Count
		for li_index = 1 to li_count
			lole_Variable = aole_word.Variables.Item(li_index)
			if lole_Variable.name = as_merge_field then
				lb_Exist = true
				exit
			end if
		next
		
		If not lb_Exist Then
			aole_word.Variables.Add(as_merge_field, as_merge_field)
		else
			lole_Variable.value = as_merge_field
		End If
		aole_word.ActiveWindow.Selection.Fields.Add(aole_word.ActiveWindow.Selection.Range, wdFieldDocVariable, '"'+as_merge_field+'"')
	else
	//End code By Jervis on 02.23.2009
		aole_word.ActiveWindow.Selection.Fields.Add(aole_word.ActiveWindow.Selection.Range,-1,"MERGEFIELD  " + as_merge_field,true)
	end if
End If

SetPointer(Arrow!)
RETURN 1
end function

public function integer of_insert_number (oleobject aole_word, string as_num, string as_switch);//////////////////////////////////////////////////////////////////////
// $<function>of_insert_number()
// $<arguments>
//		valuea	string: symbols of field
// $<returns> integer
// $<description>Insert a symbol in word document for auto numbering
//////////////////////////////////////////////////////////////////////
// $<add> 04.19.2007 by Alfee (Contract Logix Clause Painter)
//////////////////////////////////////////////////////////////////////
Oleobject lole_field
String ls_parm, ls_clauseid, ls_clausename, ls_bookmark, ls_text, ls_code

IF not isValid(aole_word) Then Return -1

CHOOSE CASE Lower(as_num)
	CASE "article"    //I,II
		aole_word.Fields.Add(aole_word.ActiveWindow.Selection.Range, wdFieldEmpty, "SEQ article\n \* ROMAN", True)	
	CASE "section"    //1.0, 2.0
		If as_switch = ' \r' Then as_switch += ' 1'
		//---------Begin Modified by Alfee 10.17.2007----------------------------
		//aole_word.Fields.Add(aole_word.ActiveWindow.Selection.Range, wdFieldEmpty, 'SEQ clause_level_1\# "0."' + as_switch, True)			
		aole_word.Fields.Add(aole_word.ActiveWindow.Selection.Range, wdFieldEmpty, 'SEQ clause_level_1\# "0"' + as_switch, True)			
		aole_word.ActiveWindow.Selection.TypeText(".")
		//---------End Modified --------------------------------------------------
		aole_word.Fields.Add(aole_word.ActiveWindow.Selection.Range, wdFieldEmpty, 'SEQ sub_level_1\r', True)			
	CASE "subsection"  //1.1, 1.2
		//---------Begin Modified by Alfee 10.17.2007----------------------------
		//aole_word.Fields.Add(aole_word.ActiveWindow.Selection.Range, wdFieldEmpty, 'SEQ clause_level_1\# "0."\c', True)	
		aole_word.Fields.Add(aole_word.ActiveWindow.Selection.Range, wdFieldEmpty, 'SEQ clause_level_1\# "0"\c', True)			
		aole_word.ActiveWindow.Selection.TypeText(".")
		//---------End Modified --------------------------------------------------
		aole_word.Fields.Add(aole_word.ActiveWindow.Selection.Range, wdFieldEmpty, 'SEQ sub_level_1\n', True)	
	CASE "schedule"    //A, B		
		aole_word.Fields.Add(aole_word.ActiveWindow.Selection.Range, wdFieldEmpty, "SEQ schedule\n \* ALPHABETIC", True)	
	CASE "clause" //<<|...|>>
		Open(w_clause_reference)
		ls_parm = Message.StringParm
		IF Not IsNull(ls_parm) and Len(Trim(ls_parm)) > 0 THEN
			ls_clauseid = Left(ls_parm, Pos(ls_parm,"-") - 1)
			ls_clausename = Mid(ls_parm, Pos(ls_parm,"-") + 1)
			ls_bookmark = "clause_" + ls_clauseid 
			lole_field = Create OLEObject
			lole_field = aole_word.Fields.Add(aole_word.ActiveWindow.Selection.Range, wdFieldHyperlink, "\l " +ls_bookmark, True)
		  	lole_field.Result.Text = "<<|"+ls_clausename+"|>>"
			lole_field.Result.Font.Underline = wdUnderlineNone  //added by alfee 04.30.2007
			lole_field.Result.Font.Color = wdColorBlack //added by alfee 05.05.2007
		END IF
END CHOOSE

//Below remarked by alfee 04.23.2007 for performance tunning
////Update sequence fields
//of_update_field(aole_word,True)

aole_word.ActiveWindow.Setfocus()

Destroy lole_field
Return 1


end function

public function integer of_get_template_file (long al_templateid, datetime adt_lastupdate);//////////////////////////////////////////////////////////////////////
// $<function>of_get_template_file()
// $<arguments>
//		long    	al_templateid 		
//		datetime	adt_lastupdate		
// $<returns> integer
// $<description>Get or Generate template file from DB
//////////////////////////////////////////////////////////////////////
// $<add> 05.10.2007 by Alfee (Contract Logix Agreement Tamplate Painter)
//////////////////////////////////////////////////////////////////////

string ls_lastupdate,ls_regupdate,ls_filename
long ll_len,ll_currentpos,ll_length,ll_start
integer li_writes,li_filenum,li_cnt,li_loops
boolean lb_local //indicate whether local file is existed and updated
blob lblb_file,lblb_data
datetime ldt_lastmodifytime

gnv_appeondll.of_parsepath(gs_dir_path + gs_DefDirName + "\Agreement\") //Alfee 03.13.2008

lb_local = false
ls_filename = gs_dir_path + gs_DefDirName + "\Agreement\" + "template_" + string(al_templateid) + ".doc"
if not isnull(adt_lastupdate) then
	ls_lastupdate = string(adt_lastupdate, "mm/dd/yyyy hh:mm:ss")
end if

//Compare the updated date between local files and from db
if fileexists(ls_filename) then
	//Modified By Mark Lee 04/18/12
//	gnv_appeondll.of_registryget("HKEY_LOCAL_MACHINE\SOFTWARE\IntelliSoft Group\Agreement", "template_" + string(al_templateid), regstring!, ls_regupdate)	
	//Modified By Ken.Guo 2015-04-29
	//gnv_appeondll.of_registryget("HKEY_LOCAL_MACHINE\SOFTWARE\"+gs_DefDirName+"\Agreement", "template_" + string(al_templateid), regstring!, ls_regupdate)	
	gnv_filetime.of_getlastwritedatetime( ls_filename, ldt_lastmodifytime)
	if ls_lastupdate = String(ldt_lastmodifytime, "mm/dd/yyyy hh:mm:ss") and len(trim(ls_lastupdate)) > 0  then
		lb_local = true
	end if
end if

//If local file not existed or updated, generate new local file and update registry
if not lb_local then 
	if gs_dbtype = "SQL" and appeongetclienttype() = "PB" THEN //SQL
		SELECT datalength(image_file) INTO :ll_length FROM ctx_acp_template
		 WHERE ctx_acp_template_id = :al_templateid; 
		if ll_length > 8000  then
			li_loops = ( ll_length / 8000 ) + 1
			For li_cnt = 1 To li_loops				
				ll_start = (li_cnt - 1) * 8000 + 1			
				SELECTBLOB substring( image_file, :ll_start, 8000 ) INTO :lblb_data 
						FROM ctx_acp_template 
					  WHERE ctx_acp_template_id = :al_templateid; 			
				IF SQLCA.SQLCode <> 0 THEN
					//Messagebox( "IntelliSoft", "Read file data from database failed." )
   				Messagebox( "ContractLogix", "Failed to read file data from database." )
					Return -1
				END IF
				lblb_file += lblb_data
			Next 
		else
			selectblob image_file into :lblb_file
					from ctx_acp_template
				  where ctx_acp_template_id = :al_templateid;
		end if
	else //ASA
		selectblob image_file into :lblb_file
			from ctx_acp_template
		  where ctx_acp_template_id = :al_templateid;
	end if
	
	ll_len = len(lblb_file)
//	if ll_len < 1 then return -1
	
	If ll_len > 32765 then
		 if mod(ll_len, 32765) = 0 then
			 li_writes = ll_len / 32765
		 else
			 li_writes = (ll_len / 32765) + 1
		 end If
	 else
		 li_writes = 1
	end if
	
	ll_currentpos = 1
	
	li_filenum = fileopen(ls_filename , StreamMode!, Write!, LockWrite!,Replace!)
	if li_fileNum = -1 then return -1
	
	for li_cnt = 1 to li_writes
		 lblb_data = blobmid(lblb_file, ll_currentpos, 32765)
		 ll_currentpos += 32765
		 if filewrite(li_filenum, lblb_data) = -1 then
			 fileclose(li_fileNum)
			 return -1
		 end If
	next
	
	fileclose(li_fileNum)
	//Modified By Mark Lee 04/18/12
	//Save the latest update date of the current file in Registry
//	gnv_appeondll.of_registryset("HKEY_LOCAL_MACHINE\SOFTWARE\IntelliSoft Group\Agreement", "template_" + string(al_templateid), regstring!, ls_lastupdate)	
	//Modified By Ken.Guo 2015-04-29
	//gnv_appeondll.of_registryset("HKEY_LOCAL_MACHINE\SOFTWARE\"+gs_DefDirName+"\Agreement", "template_" + string(al_templateid), regstring!, ls_lastupdate)	
	gnv_filetime.of_setlastwritedatetime( ls_filename, adt_lastupdate)
end if

return 1
end function

public function integer of_update_field (oleobject aole_word, boolean ab_ref);
Integer li_refidx[] //reference fields' indexes
Long i, j, ll_cnt, ll_type, ll_rtn = 1 
String  ls_text
boolean lb_shape

//-------Begin Modified by Alfee 06.27.2007 -- For Performance tunning------
//ab_ref: indicator of updating clause reference fields
OLEObject lole_fields, lole_item 

//HeaderFooter Objects -- 03.24.2009 by jervis
OLEObject lole_header_fields	
OLEObject lole_footer_fields
OLEObject lole_shape_fields

//Unprotect document if needed - Alfee 03.10.2008
//if of_unprotect_doc(aole_word) = -1 THEN RETURN -1 //Alfee 10.08.208
if of_unprotect_doc(aole_word,False) = -1 THEN RETURN -1 //Added By Mark Lee 05/27/2013
//of_unprotect_doc(aole_word)  

lole_fields = Create OLEObject
lole_item = Create OLEObject
lole_header_fields = Create OLEObject
lole_footer_fields = Create OLEObject
lole_shape_fields = Create OLEObject


lole_fields = aole_word.Fields
lole_fields.Locked = False 

//Get HeaderFooter Objects - jervis 03.24.2009
lole_header_fields = aole_word.Sections.Item(1).Headers.Item(wdHeaderFooterEvenPages).Range.Fields
lole_footer_fields = aole_word.Sections.Item(1).Footers.Item(wdHeaderFooterEvenPages).Range.Fields
lole_header_fields.Locked = False
lole_footer_fields.Locked = False

TRY		//Jervis 06.16.2009
	//Get Other Shapes Objects -- jervis 06.03.2009
	If aole_word.Shapes.Count > 0 Then //Added By Ken.Guo 08/21/2012. Added If statement. 
		aole_word.Shapes.SelectAll() //the focus will jump to top
		lole_shape_fields  = aole_word.ActiveWindow.Selection.Fields
		lole_shape_fields.locked = false
		lb_shape = true
	End If
CATCH (Throwable th)
  	lb_shape = false
END Try

//Lock merge fields
j = 1
ll_cnt = lole_fields.Count
For i = 1 to ll_cnt
	lole_item = lole_fields.Item[i]
	ll_type = lole_item.Type
	//----Begin Modified by Alfee 03.10.2008 ------------------------------
	//<Reason>Updating fields may cause the user defined fields' data lost
	//If ll_type = wdFieldMergeField Then
	//If ll_type <> wdFieldSequence and ll_type <> wdFieldHyperlink Then		
	If ll_type <> wdFieldSequence and ll_type <> wdFieldHyperlink and ll_type <> wdFieldDocVariable Then	//Add DocVariable - Jervis 02.24.2009	
	//----End Modified ----------------------------------------------------
		lole_item.Locked = True
	ElseIf ll_type = wdFieldHyperlink Then
		li_refidx[j] = i
		j ++
	End If
Next	

//Lock merge fields for HeaderFooters - jervis 03.24.2009
ll_cnt = lole_header_fields.Count
For i = 1 to ll_cnt
	lole_item = lole_header_fields.Item[i]
	ll_type = lole_item.Type
	If ll_type <> wdFieldSequence and ll_type <> wdFieldDocVariable Then	
		lole_item.Locked = True
	End If
next

ll_cnt = lole_footer_fields.Count
For i = 1 to ll_cnt
	lole_item = lole_footer_fields.Item[i]
	ll_type = lole_item.Type
	If ll_type <> wdFieldSequence and ll_type <> wdFieldDocVariable Then	
		lole_item.Locked = True
	End If
next

if lb_shape then
	//Lock fields for Shapes -- jervis 06.03.2009
	ll_cnt = lole_shape_fields.count
	For i = 1 to ll_cnt
		lole_item = lole_shape_fields.Item[i]
		ll_type = lole_item.Type
		If ll_type <> wdFieldDocVariable Then	
			lole_item.Locked = True
		End If
	next
end if


//Update all fields
If isvalid(w_appeon_gifofwait) Then w_appeon_gifofwait.event timer()	
ll_rtn = aole_word.Fields.Update()

//Update all fields for headerfooter - jervis 03.24.2009
lole_footer_fields.Update()
lole_header_fields.UPdate()

if lb_shape then
	//Update all fields for Shapes  -- jervis 06.03.2009
	lole_shape_fields.Update()
end if


//Replace clause reference fields if needed
If ab_ref Then 
	If isvalid(w_appeon_gifofwait) Then w_appeon_gifofwait.event timer()		
	ll_rtn = of_update_refmark(aole_word, li_refidx)
End If

//Unlock all fields
If isvalid(w_appeon_gifofwait) Then w_appeon_gifofwait.event timer()	
lole_fields.Locked = False

//Unlock all fields for HeaderFooter  - jervis 03.24.2009
lole_footer_fields.Locked = False
lole_header_fields.Locked = False

if lb_shape then
	//Unlock all fields for shapes -- jervis 06.03.2009
	lole_shape_fields.locked = false
end if

If aole_word.Shapes.Count > 0 Then //Added By Ken.Guo 08/21/2012. Added If statement. 
	aole_word.Range(0,0).select()
End If

/*aole_word.Fields.Locked = False //added by alfee 05.04.2007 fix a bug
//IF ab_all Then //Commented by Alfee 05.04.2007 for performance tunning
	For i = 1 to  aole_word.Fields.Count
		If aole_word.Fields.Item[i].Type = wdFieldMergeField Then
			aole_word.Fields.Item[i].Locked = True
		End If
	Next	
	If isvalid(w_appeon_gifofwait) Then w_appeon_gifofwait.event timer()	
	ll_rtn = aole_word.Fields.Update()
	If isvalid(w_appeon_gifofwait) Then w_appeon_gifofwait.event timer()	
	For i = 1 to  aole_word.Fields.Count
		If aole_word.Fields.Item[i].Type = wdFieldMergeField Then
			aole_word.Fields.Item[i].Locked = False
		End If
	Next	*/
// -------End Modified 06.27.2007 -----------------------------------------------

//	ll_cnt = aole_word.Fields.Count
//	FOR i = 1 to ll_cnt
//		IF aole_word.Fields.Item[i].Type <> wdFieldMergeField THEN
//			//If isvalid(w_appeon_gifofwait) Then w_appeon_gifofwait.event timer()			
//			IF Not aole_word.Fields.Item[i].Update() THEN li_rtn = -1
//		END IF
//	NEXT	

//--------Commented by Alfee 05.04.2007 for performance tunning----------------------
/*ELSE
	ll_cnt = aole_word.Fields.Count
	If isvalid(w_appeon_gifofwait) Then w_appeon_gifofwait.event timer()		
	FOR i = 1 to ll_cnt
		//IF aole_word.Fields.Item[i].Type = wdFieldRef THEN
		IF aole_word.Fields.Item[i].Type = wdFieldSequence THEN			
			IF Not aole_word.Fields.Item[i].Update() THEN li_rtn = -1
		ELSEIF aole_word.Fields.Item[i].Type = wdFieldHyperlink THEN
			ls_text = aole_word.Fields.Item[i].Result.Text
			IF Pos(ls_text, "<<|") > 0 Then 
				IF Not aole_word.Fields.Item[i].Update() THEN li_rtn = -1
			END IF
		END IF		
	NEXT
	If isvalid(w_appeon_gifofwait) Then w_appeon_gifofwait.event timer()		
END IF*/
//-------End Commented------------------------------------------------------------

destroy lole_fields 
destroy lole_item 
destroy lole_header_fields 
destroy lole_footer_fields 
destroy lole_shape_fields

Return ll_rtn

end function

public function long of_update_refmark (oleobject aole_word, integer ai_item[]);//Added by alfee 06.27.2007

Long ll_cnt, ll_cnt_sub, ll_cntflds, i, j, ll_rtn = 1
Long ll_clause_cnt, ll_found
String ls_text, ls_code, ls_bookmark, ls_clauseid, ls_clausename
Boolean lb_retrieved = False
OLEObject lole_fields, lole_item 

ll_cnt = UpperBound(ai_item)
IF ll_cnt < 1 THEN RETURN 0

//Create OLEObject--jervis 06.03.2009
lole_fields = Create OLEObject
lole_item = create OLEObject


lole_fields = aole_word.Fields
ll_cntflds = lole_fields.Count

//Find and update clause reference marks of "<<|...|>>" in all fields
FOR i =  1 to ll_cnt 
	//Get the referenced clause's bookmark
	IF ai_item[i] > ll_cntflds THEN RETURN -1
	lole_item = lole_fields.Item[ai_item[i]]
	IF lole_item.type = wdFieldHyperlink THEN
		ls_code = lole_item.Code.Text
		ls_code = Trim(Mid(Trim(ls_code), Len("HYPERLINK \l") + 1))
		IF Pos(ls_code,"\*") > 0 THEN	
			ls_bookmark = Trim(Left(ls_code, Pos(ls_code,"\*") - 1))
		END IF
		IF Pos(ls_bookmark, "clause_") < 1 THEN CONTINUE 
	
		IF aole_word.bookmarks.Exists(ls_bookmark) THEN
			//Find numbering in the found reference clause
			ll_cnt_sub = aole_word.Bookmarks.Item(ls_bookmark).Range.Fields.Count
			FOR j = 1 TO ll_cnt_sub
				ls_code = aole_word.Bookmarks.Item(ls_bookmark).Range.Fields.Item[j].Code.Text
				IF Pos(ls_code, "article") > 0 or Pos(ls_code, "schedule") > 0 THEN 
					//Update reference mark with the clause numbering
					ls_text= aole_word.Bookmarks.Item(ls_bookmark).Range.Fields.Item[j].Result.Text	
					lole_item.Result.Text = ls_text
					EXIT
				END IF
			NEXT
		ELSE
			//Restore reference mark's text with the clause name
			IF Not lb_retrieved THEN 
				ll_clause_cnt = ids_clausename.Retrieve()
				lb_retrieved = True
			END IF
			IF ll_clause_cnt > 0 Then
				ls_clauseid = Mid(ls_bookmark, Pos(ls_bookmark, "clause_") + 7)
				ll_found = ids_clausename.Find("ctx_acp_clause_id = " + ls_clauseid, 1, ll_clause_cnt)
				IF ll_found > 0 THEN 
					ls_clausename = ids_clausename.GetItemString(ll_found, "clause_name")
					lole_item.Result.Text = "<<|" + ls_clausename + "|>>"
					Continue
				END IF
			END IF		
			lole_item.Result.Text = ls_bookmark
		END IF
	END IF	
NEXT

destroy lole_fields
destroy lole_item 
Return ll_rtn
end function

public function integer of_preview (oleobject aole_word, boolean ab_ref);//--------Added by alfee 04.17.2007--------------
//Update fields for numbering
Long ll_cnt, ll_cnt_sub, i, j, ll_rtn
Long ll_clause_cnt, ll_found
String ls_text, ls_code, ls_bookmark, ls_clauseid, ls_clausename
Boolean lb_retrieved = False


//Update fields for numbering
of_update_field(aole_word, ab_ref) //ab_ref: indicator of updating clause reference field


//-------------Begin Commented by Alfee 06.27.2007--------------
//<Reason$>Moved to of_update_field() function
/*//Find and update clause reference marks of "<<|...|>>" in all fields
ll_cnt = aole_word.Fields.Count
FOR i =  1 to ll_cnt 
	//Get the referenced clause's bookmark
	IF aole_word.Fields.Item[i].type = wdFieldHyperlink THEN
		ls_code = aole_word.Fields.Item[i].Code.Text
		ls_code = Trim(Mid(Trim(ls_code), Len("HYPERLINK \l") + 1))
		IF Pos(ls_code,"\*") > 0 THEN	
			ls_bookmark = Trim(Left(ls_code, Pos(ls_code,"\*") - 1))
		END IF
		IF Pos(ls_bookmark, "clause_") < 1 THEN CONTINUE 	//added by alfee 05.05.2007
	
		IF aole_word.bookmarks.Exists(ls_bookmark) THEN
			//Find numbering in the found reference clause
			ll_cnt_sub = aole_word.Bookmarks.Item(ls_bookmark).Range.Fields.Count
			FOR j = 1 TO ll_cnt_sub
				ls_code = aole_word.Bookmarks.Item(ls_bookmark).Range.Fields.Item[j].Code.Text
				IF Pos(ls_code, "article") > 0 or Pos(ls_code, "schedule") > 0 THEN 
					//Update reference mark with the clause numbering
					ls_text= aole_word.Bookmarks.Item(ls_bookmark).Range.Fields.Item[j].Result.Text	
					aole_word.Fields.Item[i].Result.Text = ls_text
					EXIT
				END IF
			NEXT
		ELSE
			//Restore reference mark's text with the clause name
			//---------Added by Alfee 05.05.2007-----------------------------------------
			IF Not lb_retrieved THEN 
				ll_clause_cnt = ids_clausename.Retrieve()
				lb_retrieved = True
			END IF
			IF ll_clause_cnt > 0 Then
				ls_clauseid = Mid(ls_bookmark, Pos(ls_bookmark, "clause_") + 7)
				ll_found = ids_clausename.Find("ctx_acp_clause_id = " + ls_clauseid, 1, ll_clause_cnt)
				IF ll_found > 0 THEN 
					ls_clausename = ids_clausename.GetItemString(ll_found, "clause_name")
					aole_word.Fields.Item[i].Result.Text = "<<|" + ls_clausename + "|>>"
					Continue
				END IF
			END IF		
			//----------End Added -------------------------------------------------------
			aole_word.Fields.Item[i].Result.Text = ls_bookmark
		END IF
	END IF	
NEXT

aole_word.Range(0,0).select()
*/
//----------------End Commented-------------------------------------------------------
RETURN 1



//CATCH(Throwable th)
//	aole_word.activewindow.visible = true
//	if isvalid(w_appeon_gifofwait) then close(w_appeon_gifofwait)
//END TRY

//integer i, j, li_chapter, li_paragraph, li_section
//long ll_pos_paragraph,ll_pos_section, ll_cnt, ll_bookmark, ll_start,ll_end, ll_pos
//string ls_mark,ls_replace, ls_bookmark
//boolean lb_found_chapter, lb_found_paragraph, lb_found_section, lb_found_reference
//String ls_clause_id[], ls_clause_chapter[], ls_clauseid //
//
//setpointer(HourGlass!)
//
////Paste with contents of current template file
////aole_word.content.select()
////aole_word.activewindow.selection.paste()
//TRY
//
//ll_cnt = aole_word.bookmarks.count
//
////Get clause id array
//for i =  1 to ll_cnt
//	ls_bookmark = aole_word.content.bookmarks.item(i).name
//	ls_clause_chapter[i] = "" //initilize the array
//	if lower(left(ls_bookmark,7)) = "clause_"  then 
//		ls_clause_id[i] = Mid(ls_bookmark, 8)
//	else
//		ls_clause_id[i] = ""
//	end if
//next
//	
////for performance tunning - locate first clause with mark of "@@"
//aole_word.content.select()
//lb_found_chapter = aole_word.activewindow.selection.find.Execute(is_chapter[2], false, true, false, false, false, true, wdFindStop, false, "", wdReplaceNone )
//if lb_found_chapter then 
//	for i = 1 to ll_cnt
//		if aole_word.activewindow.selection.InRange(aole_word.content.bookmarks.item[i].range) then 
//			ll_bookmark = i 
//			exit
//		end if
//	next
//end if
//if ll_bookmark = 0  then ll_bookmark = ll_cnt + 1 
//
////Replace with the defined numbering
//for i = 1 to upperbound(is_chapter) //chapters
//	li_chapter = 1
//	li_paragraph = 1
//	for j =  1 to ll_cnt //clauses
//		if isvalid(w_appeon_gifofwait) then w_appeon_gifofwait.event timer()
//		if i = 1 then 
//			if j >= ll_bookmark then exit
//		else
//			if j < ll_bookmark then continue
//		end if		
//		//find & replace chapter marks, e.g. "##","@@"...
//		ls_replace = of_parse_number(li_chapter,is_chapter[i]) //
//	   aole_word.content.bookmarks.item(j).select()	
//	   aole_word.activewindow.selection.find.ClearFormatting()
//		if not aole_word.activewindow.selection.find.Execute(is_chapter[i], false, true, false, false, false, true, wdFindStop, false, ls_replace, wdReplaceOne ) then	
//			continue //skip the clause without marks	
//		else
//			ls_clause_chapter[j] = ls_replace	
//		end if		
//
//		//find & replace paragraph marks, e.g. "#.0".
//		if i =2 then li_paragraph = 1 //for "@@" - schedule
//		ls_replace = string(li_paragraph) +".0"		
//	   aole_word.content.bookmarks.item(j).select()	
//  	   aole_word.activewindow.selection.find.ClearFormatting()		
//	   lb_found_paragraph = aole_word.activewindow.selection.find.Execute(is_paragraph, false, true, false, false, false, true, wdFindStop, false, ls_replace, wdReplaceOne)
//		//find & replace section marks, e.g. "#.#"
//	   do while lb_found_paragraph
//			ls_replace = string(li_paragraph) +".0"
//		   //if "@@", get the position of the next paragraph mark in the clause
// 		   if i = 2 then
//				aole_word.content.bookmarks.item(j).select()	
//   		   aole_word.activewindow.selection.find.ClearFormatting()					
//			   if not aole_word.activewindow.selection.find.Execute(is_paragraph, false, true, false, false, false, true, wdFindStop, false, ls_replace, wdReplaceNone) then
//					ll_pos_paragraph = aole_word.content.bookmarks.item(j).end
//				else
//					ll_pos_paragraph = aole_word.activewindow.selection.start
//				end if
//			end if
//			
//			//find & replace section marks, e.g. "#.#".
//			li_section = 1
//			do 
//	 		   aole_word.content.bookmarks.item(j).select()	
//   		   aole_word.activewindow.selection.find.ClearFormatting()		
//			   //if "@@", get the position of the current section mark in the clause				
//				if i = 2 then
//					lb_found_section = aole_word.activewindow.selection.find.Execute(is_section, false, true, false, false, false, true, wdFindStop, false, ls_replace, wdReplaceNone)
//					if lb_found_section then
//						ll_pos_section = aole_word.activewindow.selection.start
//						//exit loop if it belongs to next paragraph
//						if ll_pos_section >= ll_pos_paragraph then exit 
//					end if
//				else
//					lb_found_section = true
//				end if
//				//replace 
//				if lb_found_section then
//					ls_replace = string(li_paragraph) + "." + string(li_section)
//		 		   aole_word.content.bookmarks.item(j).select()	
//  				   aole_word.activewindow.selection.find.ClearFormatting()							
//					lb_found_section = aole_word.activewindow.selection.find.Execute(is_section, false, true, false, false, false, true, wdFindStop, false, ls_replace, wdReplaceOne)	
//					li_section ++
//				end if
//			loop while lb_found_section
//			
//			li_paragraph ++
//			ls_replace = string(li_paragraph) +".0"
//			//if "@@", then find & replace next paragraph marks
//			if i =2 then
//			   aole_word.content.bookmarks.item(j).select()	
//  	   		aole_word.activewindow.selection.find.ClearFormatting()		
//			   lb_found_paragraph = aole_word.activewindow.selection.find.Execute(is_paragraph, false, true, false, false, false, true, wdFindStop, false, ls_replace, wdReplaceOne)
//			else
//				lb_found_paragraph = false
//			end if
//		loop 		 
//	 	li_chapter ++
//	next
//next
//
////added by alfee at 03.24.2007
////Find and replace "<<|" and "|>>"
//
//boolean lb_option
//lb_option = aole_word.application.Options.ReplaceSelection
//aole_word.application.Options.ReplaceSelection = true
//ll_start = 0
//ll_end = aole_word.content.end
//Do 
//	IF ll_start >= ll_end THEN Exit
//	aole_word.range(ll_start, ll_end).select()
//	aole_word.activewindow.selection.find.ClearFormatting()	
//	lb_found_reference = aole_word.activewindow.selection.find.Execute("<<|", false, true, false, false, false, true, wdFindStop, false, "", wdReplaceNone )
//	if lb_found_reference then //<<|
//		ll_start = aole_word.activewindow.selection.start
//		aole_word.content.select()
//		aole_word.activewindow.selection.find.ClearFormatting()	
//		lb_found_reference = aole_word.activewindow.selection.find.Execute("|>>", false, true, false, false, false, true, wdFindStop, false, "", wdReplaceNone )	
//		if lb_found_reference then //|>>
//			ll_end = aole_word.activewindow.selection.end
//			//Replace "<<|....|>>"
//			if ll_start < 1 or ll_end <= ll_start + 6 then Exit
//		   ls_clauseid = aole_word.range(ll_start+ 3, ll_start+ 9).text
//			ls_clauseid = Mid(ls_clauseid, LastPos(ls_clauseid, '*') + 1)
//			for i = 1 to ll_cnt
//				if ls_clauseid = ls_clause_id[i] then
//					aole_word.range[ll_start, ll_end].select()
//					aole_word.activewindow.selection.TypeText(ls_clause_chapter[i])
//					Exit
//				end if
//			next
//			ll_start = ll_end + 1
//			ll_end  = aole_word.content.end
//		end if
//	end if	
//Loop Until not lb_found_reference
//
//aole_word.application.Options.ReplaceSelection = lb_option
//aole_word.Range(0,0).select()
//
//CATCH(Throwable th)
//	if isvalid(w_appeon_gifofwait) then close(w_appeon_gifofwait)
//END TRY
end function

public function string of_get_clause_file (long al_clauseid, datetime adt_lastupdate);//////////////////////////////////////////////////////////////////////
// $<function>of_get_clause_file()
// $<arguments>
//		long    	al_clauseid 		
//		datetime	adt_lastupdate		
// $<returns> string - filename
// $<description>Get or Generate clause file from DB
//////////////////////////////////////////////////////////////////////
// $<add> 10.18.2007 by Alfee (Contract Logix Clause Library Painter)
//////////////////////////////////////////////////////////////////////


//User new function to get clause file
String ls_filename
n_cst_clause lnv_clause
lnv_clause = Create n_cst_clause
If lnv_clause.of_download_file(al_clauseid,ls_filename) < 0 Then
	ls_filename = ''
End If
If isvalid(lnv_clause) Then Destroy lnv_clause 

Return ls_filename
/*
string ls_lastupdate,ls_regupdate,ls_filename
long ll_len,ll_currentpos,ll_length,ll_start
integer li_writes,li_filenum,li_cnt,li_loops
boolean lb_local //indicate whether local file is existed and updated
blob lblb_file,lblb_data

gnv_appeondll.of_parsepath(gs_dir_path + gs_DefDirName + "\Agreement\") //Alfee 03.13.2008

lb_local = false
ls_filename = gs_dir_path + gs_DefDirName + "\Agreement\" + "clause_" + string(al_clauseid) + ".doc"
if not isnull(adt_lastupdate) then
	ls_lastupdate = string(adt_lastupdate, "mm/dd/yyyy hh:mm:ss")
end if

//Compare the updated date between local files and from db
if fileexists(ls_filename) then
	gnv_appeondll.of_registryget("HKEY_LOCAL_MACHINE\SOFTWARE\IntelliSoft Group\Agreement", "clause_" + string(al_clauseid), regstring!, ls_regupdate)	
	if ls_lastupdate = ls_regupdate and len(trim(ls_lastupdate)) > 0  then
		lb_local = true
	end if
end if

//If local file not existed or updated, generate new local file and update registry
if not lb_local then 
	if gs_dbtype = "SQL" and appeongetclienttype() = "PB" THEN //SQL
		SELECT datalength(image_file) INTO :ll_length FROM ctx_acp_clause
		 WHERE ctx_acp_clause_id = :al_clauseid; 
		if ll_length > 8000  then
			li_loops = ( ll_length / 8000 ) + 1
			For li_cnt = 1 To li_loops				
				ll_start = (li_cnt - 1) * 8000 + 1			
				SELECTBLOB substring( image_file, :ll_start, 8000 ) INTO :lblb_data 
						FROM ctx_acp_clause 
					  WHERE ctx_acp_clause_id = :al_clauseid; 			
				IF SQLCA.SQLCode <> 0 THEN
					//Messagebox( "IntelliSoft", "Read file data from database failed." )
   				Messagebox( "ContractLogix", "Failed to read file data from database." )
					Return ""
				END IF
				lblb_file += lblb_data
			Next 
		else
			selectblob image_file into :lblb_file
					from ctx_acp_clause
				  where ctx_acp_clause_id = :al_clauseid;
		end if
	else //ASA
		selectblob image_file into :lblb_file
			from ctx_acp_clause
		  where ctx_acp_clause_id = :al_clauseid;
	end if
	
	ll_len = len(lblb_file)
//	if ll_len < 1 then return -1
	
	If ll_len > 32765 then
		 if mod(ll_len, 32765) = 0 then
			 li_writes = ll_len / 32765
		 else
			 li_writes = (ll_len / 32765) + 1
		 end If
	 else
		 li_writes = 1
	end if
	
	ll_currentpos = 1
	
	li_filenum = fileopen(ls_filename , StreamMode!, Write!, LockWrite!,Replace!)
	if li_fileNum = -1 then return ""
	
	for li_cnt = 1 to li_writes
		 lblb_data = blobmid(lblb_file, ll_currentpos, 32765)
		 ll_currentpos += 32765
		 if filewrite(li_filenum, lblb_data) = -1 then
			 fileclose(li_fileNum)
			 return ""
		 end If
	next
	
	fileclose(li_fileNum)
	
	//Save the latest update date of the current file in Registry
	gnv_appeondll.of_registryset("HKEY_LOCAL_MACHINE\SOFTWARE\IntelliSoft Group\Agreement", "clause_" + string(al_clauseid), regstring!, ls_lastupdate)	
end if

return ls_filename
*/
end function

public function integer of_new_word_document (olecustomcontrol aole_1, string as_filename);//Create a new Word document -- Alfee 09.22.2008
//The function is created because the Office OCX control cannot support well under Word 2007 

Integer li_filenum
String ls_EmailDirectory, ls_empty_document
OleObject lole_word
//n_cst_filesrv lnv_filesrv

IF Lower(gs_word_version) <> 'word2007' THEN
	If aole_1.object.doctype > 0 Then aole_1.object.ActiveDocument.Saved = True //Added By Ken.Guo 2016-05-30. workaround Task 524
	aole_1.object.CreateNew("Word.Document")
	aole_1.object.SavetoLocal(as_filename, true)
ELSE //Word 2007	
	ls_EmailDirectory = gs_dir_path + gs_DefDirName + "\Email"
	gnv_appeondll.of_parsepath(ls_EmailDirectory)
	ls_empty_document = ls_EmailDirectory + "\Empty.doc"
	
	//Gen the template document with Word format if not existed
	IF NOT FileExists(ls_empty_document) THEN
		//Gen a new template document with text format
		li_FileNum = FileOpen(ls_empty_document, StreamMode! ,Write!,Shared!, Replace!)
		If li_FileNum = -1 Then Return 0
		FileClose(li_FileNum)	
		
	   //Create a new Word application
		lole_word = Create oleobject
		app_filler.of_set_word_safemode(false, 1) //Added By Ken.Guo 2015-07-30
		IF lole_word.Connecttonewobject("word.application") <> 0 THEN
			Destroy lole_word 
			app_filler.of_set_word_safemode(false, 0) //Added By Ken.Guo 2015-07-30
			Messagebox('Client Error', 'Could not connect to Microsoft Word. Please make sure it is properly installed.')
			RETURN 0
		END IF
		app_filler.of_set_word_safemode(false, 0) //Added By Ken.Guo 2015-07-30
		lole_word.Visible = FALSE	
		
		//Convert the template document to Word format
		TRY
		IF FileExists(ls_empty_document) THEN
			lole_word.Application.NormalTemplate.Saved = TRUE 
			lole_word.Application.Documents.Open(ls_empty_document,false,false)
			gnv_word_utility.of_modify_word_property( lole_word.Activedocument)	//Added By Mark Lee 06/20/2013 change for office 2013.
			lole_word.ActiveDocument.SaveAs(ls_empty_document, wdFormatDocument,false,'',false)
			gnv_shell.of_delete_recent( ls_empty_document, true) //Added By Ken.Guo 2010-05-25. Delete Windows Recent Document.
			lole_word.ActiveDocument.Close(wdDoNotSaveChanges)
		END IF		
		CATCH (Throwable th)
			//
		END TRY		
		
		//Close and Quit the Word application
		lole_word.Quit(wdDoNotSaveChanges)
		lole_word.DisconnectObject( )		
	END IF
	IF IsValid(lole_word) THEN	Destroy lole_word		

	//Copy the template document as the new document	
	IF FileExists(ls_empty_document) THEN
		//lnv_filesrv = Create n_cst_filesrv
		//IF lnv_filesrv.of_filecopy(ls_empty_document, as_filename) <> 1 THEN 
		IF filecopy(ls_empty_document, as_filename,true) <> 1 THEN //APB Blob Bug - jervis 03.23.2010
			//Destroy lnv_filesrv
			RETURN 0
		END IF
	END IF
	//IF IsValid(lnv_filesrv) THEN Destroy lnv_filesrv
END IF
	
RETURN 1
end function

public function string of_get_requirement_file (long al_reqmnt_id);//////////////////////////////////////////////////////////////////////
// $<function>n_cst_word_utility:of_get_requirement_file()
// $<arguments>
//		value	long	al_reqmnt_id		
// $<returns> string
// $<description>
// $<description> Get file name for requirement attachment/word.
//////////////////////////////////////////////////////////////////////
// $<add> 2009-06-29 by Ken.Guo
//////////////////////////////////////////////////////////////////////

String ls_file
n_cst_contract lnv_contract
lnv_contract = Create n_cst_contract
ls_file = lnv_contract.of_GetElementDoc(al_reqmnt_id)
If isvalid(lnv_contract) Then Destroy lnv_contract
Return ls_file

end function

public function integer of_update_reqmnt_field (oleobject aole_word, long al_doc_or_template_id, string as_type);Long ll_cnt,ll_bookmark_cnt,ll_row,i
DataStore lds_reqmnt_ref
oleobject lole_bookmark

lds_reqmnt_ref = Create DataStore
lds_reqmnt_ref.Dataobject = "d_requirement_reference"
lds_reqmnt_ref.SetTransObject(SQLCA)
ll_cnt = lds_reqmnt_ref.Retrieve(al_doc_or_template_id,as_type)

//Delete org row
If ll_cnt > 0 Then
	lds_reqmnt_ref.RowsMove(1,lds_reqmnt_ref.RowCount(),Primary!,lds_reqmnt_ref,1,Delete!)
End If

//update bookmark information
ll_bookmark_cnt = aole_word.ActiveDocument.Bookmarks.Count
For i = 1 to ll_bookmark_cnt
	lole_bookmark = aole_word.ActiveDocument.Bookmarks.Item[i]
	If Left(lole_bookmark.Name,7) = 'reqmnt_' Then
		ll_row = lds_reqmnt_ref.InsertRow(0)
		lds_reqmnt_ref.SetItem(ll_row,'doc_or_template_id',al_doc_or_template_id)
		lds_reqmnt_ref.SetItem(ll_row,'reqmnt_type',as_type)
		If Left(lole_bookmark.Name,14) = 'reqmnt_parent_' Then
			lds_reqmnt_ref.SetItem(ll_row,'get_parent_data',1)	
			lds_reqmnt_ref.SetItem(ll_row,'reqmnt_element_id',Long(Mid(lole_bookmark.Name,15)))
		Else
			lds_reqmnt_ref.SetItem(ll_row,'reqmnt_element_id',Long(Mid(lole_bookmark.Name,8)))
			lds_reqmnt_ref.SetItem(ll_row,'get_parent_data',0)
		End If
	End If
Next

//Save to DB
If lds_reqmnt_ref.modifiedcount( ) + lds_reqmnt_ref.deletedcount( ) > 0 Then
	If lds_reqmnt_ref.Update() = 1 Then
		Commit;
	Else
		Messagebox('Error','Failed to save requirement field information to database, please call support.')
		Rollback;
	End If
End If

Return 1
end function

public function string of_run_export (long al_export_id, long al_ctx_id[]);//////////////////////////////////////////////////////////////////////
// $<function>n_cst_word_utility::of_run_export()
// $<arguments>
//		value	long	al_export_id		
//		value	long	al_ctx_id[]   		
// $<returns> string
// $<description> For Contract Logix Agreement Tamplate Painter.
//////////////////////////////////////////////////////////////////////
// $<add> 2009-07-06 by Ken.Guo
//////////////////////////////////////////////////////////////////////

string ls_path, ls_return, ls_temp, ls_ctxid, ls_format
integer i, j, li_position, li_return, li_type
Long ll_ctx_id[], ll_current
Boolean lb_existed = False
pfc_n_cst_ai_export_apb  n_export

IF isnull( al_export_id ) OR al_export_id = 0 THEN
       Messagebox( "Caution", "No export file selected!" )
       return ''
END IF

SELECT save_path, export_type, export_format
	INTO :ls_path, :li_type, :ls_format
	FROM export_header WHERE export_id = :al_export_id;

IF isnull( ls_path ) or Trim( ls_path ) = '' THEN
       Messagebox( "Caution", "No Save Path set for current export file!" )
       return ''
END IF

IF li_type <> 3 and li_type <> 4 THEN
     	 Messagebox( "Caution", "Current export file is not prepared for Contract!" )
       return ''
END IF

If UpperBound(al_ctx_id[]) = 0 Then 
	Messagebox( "Caution", "No contract selected!" )
	Return ''
End If

IF Left( ls_format, 1 ) <> '.' THEN ls_format = ''
 
n_export = CREATE pfc_n_cst_ai_export_apb
n_export.is_called_type = '2' 
n_export.ib_header = TRUE 
n_export.of_set_replace_multi_field_symbol( true)		//Added By Mark Lee 07/20/2016
if ids_document_export_field.rowcount() > 0 then //Added By Jay Chen 04-17-2014
	li_return = n_export.of_export_data_with_text_ctx_new( al_export_id, al_ctx_id[], ls_path, 0, "","","",2,"" ,ids_document_export_field) //Added By Jay Chen 04-17-2014
else
	li_return = n_export.of_export_data_with_text_ctx( al_export_id, al_ctx_id[], ls_path, 0, "","","",2,"" )
end if

IF li_return = 1 THEN
	return ls_path
ELSE
   return ''
END IF

Return ''

end function

public function integer of_refresh_reqmnt_fields (oleobject aole_word, long al_ctx_id, ref string as_error);//////////////////////////////////////////////////////////////////////
// $<function>n_cst_word_utility::of_refresh_reqmnt_fields()
// $<arguments>
//		value    	oleobject	aole_word		
//		value    	long     	al_ctx_id		
//		reference	string   	as_error 		
// $<returns> integer
// $<description>
// $<description> Refresh All Requirement Fields Content 
//////////////////////////////////////////////////////////////////////
// $<add> 2009-07-14 by Ken.Guo
//////////////////////////////////////////////////////////////////////

Long i, ll_bk_cnt,ll_parent_ctx_id,ll_reqmnt_id,ll_element_id,ll_find
String ls_bookmark_list[],ls_element_name
Boolean lb_exists,lb_parent_data[]
DataStore lds_reqmnt_list,lds_reqmnt_list_parent
long ll_arr_elements_id[],ll_arr_reqmnts_id[],li_ret
String ls_arr_fields_name[]


lds_reqmnt_list = Create DataStore
lds_reqmnt_list.DataObject = 'd_requirement_ctx'
lds_reqmnt_list.SetTransObject(SQLCA)

lds_reqmnt_list_parent = Create DataStore
lds_reqmnt_list_parent.DataObject = 'd_requirement_ctx'
lds_reqmnt_list_parent.SetTransObject(SQLCA)

//Get Parent CTX ID
select master_contract_id into :ll_parent_ctx_id from ctx_basic_info where ctx_id = :al_ctx_id;
If ll_parent_ctx_id = 0 or isnull(ll_parent_ctx_id) Then ll_parent_ctx_id = al_ctx_id

//Retrieve Current and Parent data
gnv_appeondb.of_startqueue( )
	lds_reqmnt_list.Retrieve(al_ctx_id)
	lds_reqmnt_list_parent.Retrieve(ll_parent_ctx_id)
gnv_appeondb.of_commitqueue( )

ll_bk_cnt = aole_word.ActiveDocument.Bookmarks.Count

as_error = ''

//Get Bookmark name First. maybe merge requirement function will replace some bookmarks.
For i = 1 To ll_bk_cnt
	ls_bookmark_list[i] = aole_word.ActiveDocument.Bookmarks.Item[i].Name
Next

//Refresh Requirement Fields
For i = 1 To ll_bk_cnt
	If Left(ls_bookmark_list[i],7) = 'reqmnt_' and  aole_word.ActiveDocument.Bookmarks.Exists(ls_bookmark_list[i]) Then
		lb_exists = True
		If Left(ls_bookmark_list[i],14) = 'reqmnt_parent_' Then 
			//Get from Parent CTX
			ll_element_id = Long(Mid(ls_bookmark_list[i],15))
			lb_parent_data[UpperBound(lb_parent_data[]) + 1] = True
			ll_find = lds_reqmnt_list_parent.Find('ctx_req_tmplt_element_element_id = ' + String(ll_element_id)	,1,lds_reqmnt_list.RowCount())
			If ll_find > 0 Then
				ll_reqmnt_id =  lds_reqmnt_list_parent.GetItemNumber(ll_find,'ctx_elements_reqmnt_id')
				ls_element_name = lds_reqmnt_list_parent.GetItemString(ll_find,'ctx_req_tmplt_element_element_name')
				If lds_reqmnt_list_parent.GetItemNumber(ll_find,'image_length') > 0 Then
					//lnv_word.of_refresh_reqmnt_fields( aole_word, ll_reqmnt_id, '', ll_element_id)
					ll_arr_reqmnts_id[UpperBound(ll_arr_reqmnts_id[]) + 1] = ll_reqmnt_id
					ls_arr_fields_name[UpperBound(ls_arr_fields_name[]) + 1] = ls_element_name
					ll_arr_elements_id[UpperBound(ll_arr_elements_id[]) + 1] = ll_element_id				
				Else
					//lnv_word.of_refresh_reqmnt_fields( aole_word, -100, '', ll_element_id)
					ll_arr_reqmnts_id[UpperBound(ll_arr_reqmnts_id[]) + 1] = -100
					ls_arr_fields_name[UpperBound(ls_arr_fields_name[]) + 1] = ''
					ll_arr_elements_id[UpperBound(ll_arr_elements_id[]) + 1] = ll_element_id				
				End If
			Else
				//lnv_word.of_refresh_reqmnt_fields( aole_word, -100, '', ll_element_id)
					ll_arr_reqmnts_id[UpperBound(ll_arr_reqmnts_id[]) + 1] = -100
					ls_arr_fields_name[UpperBound(ls_arr_fields_name[]) + 1] = ''
					ll_arr_elements_id[UpperBound(ll_arr_elements_id[]) + 1] = ll_element_id				
			End If			
		Else
			//Get From Current CTX
			ll_element_id = Long(Mid(ls_bookmark_list[i],8))
			lb_parent_data[UpperBound(lb_parent_data[]) + 1] = False
			ll_find = lds_reqmnt_list.Find('ctx_req_tmplt_element_element_id = ' + String(ll_element_id)	,1,lds_reqmnt_list.RowCount())
			If ll_find > 0 Then
				ll_reqmnt_id =  lds_reqmnt_list.GetItemNumber(ll_find,'ctx_elements_reqmnt_id')
				ls_element_name = lds_reqmnt_list.GetItemString(ll_find,'ctx_req_tmplt_element_element_name')
				If lds_reqmnt_list.GetItemNumber(ll_find,'image_length') > 0 Then
					//lnv_word.of_refresh_reqmnt_fields( aole_word, ll_reqmnt_id, '', ll_element_id)
					ll_arr_reqmnts_id[UpperBound(ll_arr_reqmnts_id[]) + 1] = ll_reqmnt_id
					ls_arr_fields_name[UpperBound(ls_arr_fields_name[]) + 1] = ls_element_name
					ll_arr_elements_id[UpperBound(ll_arr_elements_id[]) + 1] = ll_element_id				
				Else
					//lnv_word.of_refresh_reqmnt_fields( aole_word, -100, '', ll_element_id)
					ll_arr_reqmnts_id[UpperBound(ll_arr_reqmnts_id[]) + 1] = -100
					ls_arr_fields_name[UpperBound(ls_arr_fields_name[]) + 1] = ''
					ll_arr_elements_id[UpperBound(ll_arr_elements_id[]) + 1] = ll_element_id				
				End If
			Else
				//lnv_word.of_refresh_reqmnt_fields( aole_word, -100, '', ll_element_id)
					ll_arr_reqmnts_id[UpperBound(ll_arr_reqmnts_id[]) + 1] = -100
					ls_arr_fields_name[UpperBound(ls_arr_fields_name[]) + 1] = ''
					ll_arr_elements_id[UpperBound(ll_arr_elements_id[]) + 1] = ll_element_id				
			End If
		End If
	End If
Next

If Not lb_exists Then Return 0

li_ret = of_refresh_reqmnt_fields( aole_word, ll_arr_reqmnts_id[], ls_arr_fields_name[], ll_arr_elements_id[],lb_parent_data[],as_error)
Return li_ret
end function

public function integer of_apply_clause_rules (string as_file_name, long al_template_id, long al_ctx_id);DataStore lds_clause_rules_result
n_cst_dm_utils lnv_dm_utils
String ls_file_name_temp

lds_clause_rules_result = Create DataStore
lds_clause_rules_result.DataObject = 'd_dm_template_clause_rules_result'

ls_file_name_temp = gs_dir_path + gs_DefDirName + "\Agreement\" + "template_rules_temp.doc"
FileCopy(as_file_name,ls_file_name_temp,True)

//Get rules into datastore
IF gnv_data.of_findrow('template_clause_rules', "ctx_acp_template_id = " + String(al_template_id)) > 0 THEN
	lnv_dm_utils.of_get_clause_rule_reuslts(al_ctx_id, al_template_id, lds_clause_rules_result)
End If

//Dynamic add clause by rules.
lnv_dm_utils.of_gen_document_on_rules(ls_file_name_temp, as_file_name, lds_clause_rules_result)

If isvalid(lds_clause_rules_result) Then Destroy lds_clause_rules_result

Return 1
end function

public function integer of_put_clause_file (long al_clause_id, datetime adt_lastupdate);Integer li_FileNum
Long ll_flen,loops,i
String ls_file_name,ls_file_name1,ls_lastupdate
Blob b,tot_b
n_cst_clause lnv_clause //Added By Ken.Guo 2010-01-19.
lnv_clause = Create n_cst_clause

ls_lastupdate = string(adt_lastupdate, "mm/dd/yyyy hh:mm:ss")
//ls_file_name = gs_dir_path + gs_DefDirName + "\Agreement\clause_" + string(al_clause_id) + ".doc"
ls_file_name = lnv_clause.of_generate_name(al_clause_id)

ls_file_name1 = gs_dir_path + gs_DefDirName + "\Agreement\clause_" + string(al_clause_id) + "_1.doc"

FileCopy (ls_file_name,ls_file_name1,True)	

//Begin - Modified By Ken.Guo 2010-01-15. Use new function to upload clause file.
Integer li_ret
li_ret = lnv_clause.of_upload_file( al_clause_id,ls_file_name1)
Destroy lnv_clause
FileDelete(ls_file_name1)
Return li_ret
/*
li_FileNum = FileOpen(ls_file_name1,StreamMode!,read!,LockWrite!)
If li_FileNum = -1 Then Return -1
ll_flen = FileLength(ls_file_name1)

If ll_flen > 32765 Then
	If Mod(ll_flen, 32765) = 0 Then
		loops = ll_flen/32765
	Else
		loops = (ll_flen/32765) + 1
	End If
Else
	loops = 1
End If

For i = 1 To loops
	If FileRead(li_FileNum,b) = -1 Then
		FileClose(li_FileNum)
		Return -1
	End If
	tot_b = tot_b + b
Next
FileClose(li_FileNum)
FileDelete(ls_file_name1)

gnv_appeondb.of_startqueue( )
	UPDATEBLOB ctx_acp_clause SET image_file = :tot_b WHERE ctx_acp_clause_id = :al_clause_id;
	UPDATE ctx_acp_clause SET modify_date = :adt_lastupdate WHERE ctx_acp_clause_id = :al_clause_id;
gnv_appeondb.of_commitqueue( )

gnv_appeondll.of_RegistrySet("HKEY_LOCAL_MACHINE\SOFTWARE\IntelliSoft Group\Agreement", 'clause_' + string(al_clause_id), regstring!, ls_lastupdate)	
If isvalid(w_appeon_gifofwait) Then Close(w_appeon_gifofwait)

return 1
*/
//End - Modified By Ken.Guo 2010-01-15
end function

public function integer of_add_requirement_field (oleobject aole_word, string as_field_name, long al_field_id, boolean ab_parent_data);//////////////////////////////////////////////////////////////////////
// $<function>n_cst_word_utilityof_add_requirement_field()
// $<arguments>
//		value	oleobject	aole_word    		
//		value	string   	as_field_name		
//		value	long     	al_field_id  		
//		value boolean 		ab_parent_data
// $<returns> integer
// $<description>
// $<description> Only Insert Field Name.
//////////////////////////////////////////////////////////////////////
// $<add> 2009-06-29 by Ken.Guo
//////////////////////////////////////////////////////////////////////


IF Not IsValid(aole_word) THEN Return -1
long li_Index,li_count
Boolean lb_Exist
String ls_field_name,ls_bookmark_name
Long ll_start,ll_len,ll_end_org,ll_end
OleObject lole_range,lole_bookmark,lole_all
OleObject lole_window,lole_document
	
Try
	If al_field_id > 0 Then
		lole_window = aole_word.ActiveDocument.ActiveWindow
		lole_document = aole_word.ActiveDocument
		If ab_parent_data Then
			ls_field_name = "$<Parent Data - " + as_field_name + ">$"
			ls_bookmark_name = 'reqmnt_parent_' + String(al_field_id)
		Else
			ls_field_name = "$<" + as_field_name + ">$"
			ls_bookmark_name = 'reqmnt_' + String(al_field_id)
		End If
		
		//Check the cursor postion.
		If lole_window.Selection.Information[wdInFootnoteEndnotePane] or &
			lole_window.Selection.Information[wdInCommentPane] or &
			lole_window.Selection.Information[wdInHeaderFooter] or &
			lole_window.Selection.HasChildShapeRange Then
				Messagebox('Add','You cannot insert the requirement field into a textbox,callout,comment,footnote,endnote,header,or footer.')
				Return -1					
		End If
		
		IF of_unprotect_doc(lole_document) = -1 THEN RETURN -1 
		
		//Check the field bookmark whether exists.
		If lole_document.Bookmarks.Exists(ls_bookmark_name) Then 
			Messagebox('Information','The requirement field "'+ls_field_name+'" is exists.')
			lole_bookmark = lole_document.Bookmarks.Item(ls_bookmark_name)
			lole_bookmark.Select()
			Return 0
		End If
		
		ll_start = lole_window.Selection.Start
		ll_end_org = lole_window.Selection.End
		
		//If you have selected an/multi-character(s)
		IF ll_end_org - ll_start = 1 Then
			If Messagebox('','You have already selected a character in Word. To continue, this selected character will be replaced.  Would you like to continue?',Question!,YesNo!) = 2 Then Return -1		
		ElseIf ll_end_org - ll_start > 1 Then
			If Messagebox('','You have already selected some characters in Word. To continue, these selected characters will be replaced.  Would you like to continue?',Question!,YesNo!) = 2 Then Return -1
		End If
		If ll_end_org - ll_start > 0 Then
			lole_document.Application.Options.ReplaceSelection = True
		End If

		//Add an enter if it have no enter at start position.
		If ll_start > 0 Then
				lole_range = lole_document.Range(ll_start - 1,ll_start)
				If lole_range.text <> Char(13) Then
					lole_window.SetFocus()
					lole_window.Selection.TypeParagraph()
				End If
		End If	
	
		//Insert Text and add bookmark
		lole_window.SetFocus()
		lole_window.Selection.TypeText(ls_field_name)	
		ll_len = Len(ls_field_name)
		
		//Check the range text
		ll_end = lole_window.Selection.End
		lole_range = lole_document.Range(ll_end - ll_len,ll_end)
		If lole_range.Text <> ls_field_name Then
			lole_document.undo(1)
			Messagebox('Add','You cannot insert the requirement field into a textbox,callout,comment,footnote,endnote,header,or footer.')
			Return -1
		End If
		
		//Add bookmark
		lole_document.Bookmarks.Add(ls_bookmark_name ,lole_range)
		
		//Add a Space
		lole_window.SetFocus()
		lole_window.Selection.TypeText(' ')	

		//Add an Enter if have no Enter after the field/bookmark.
		ll_end = lole_window.Selection.End
		lole_range = lole_document.Range(ll_end , ll_end + 1)		
		If lole_range.Text <> Char(13) Then
			lole_window.SetFocus()
			lole_window.Selection.TypeParagraph()
		End If
		
		//Sometimes, it selected last enter, so collapse to start position.
		lole_window.Selection.collapse(wdCollapseStart)
		
	End If
Catch(OLERuntimeError err)
	Messagebox('OLE Runtime Error',err.text + '~r~nPlease call support.' )
	Return -1
End Try

Return 1

end function

public function integer of_add_requirement_field (oleobject aole_word, long al_reqmnt_id, string as_field_name, long al_field_id, boolean ab_parent_data);//////////////////////////////////////////////////////////////////////
// $<function>n_cst_word_utility::of_add_requirement_field()
// $<arguments>
//		value	oleobject	aole_word    		
//		value	long     	al_reqmnt_id  ( -100: Empty doc )
//		value	string   	as_field_name		
//		value	long     	al_field_id  		
//		value	boolean		ab_parent_data
// $<returns> integer
// $<description>
// $<description> Insert Field Content.
//////////////////////////////////////////////////////////////////////
// $<add> 2009-06-29 by Ken.Guo
//////////////////////////////////////////////////////////////////////

String ls_bookmark_name,ls_field_name
String ls_reqmnt_file
long ll_end_ori,ll_end_new,ll_start
oleobject lole_bookmark
OleObject lole_window,lole_document,lole_range

If al_reqmnt_id = -100 Then
	//Emtpy word
Else
	ls_reqmnt_file = of_get_requirement_file(al_reqmnt_id)
	If Not FileExists(ls_reqmnt_file) Then 
		Messagebox('Error','Failed to get requirement file, please call support.')
		Return -1
	End If
End If

lole_window = aole_word.ActiveDocument.ActiveWindow
lole_document = aole_word.ActiveDocument	

//Add field name and set bookmark
If of_add_requirement_field(aole_word,as_field_name,al_field_id,ab_parent_data) <= 0 Then Return -1
If ab_parent_data Then
	ls_field_name = "$<Parent Data - " + as_field_name + ">$"
	ls_bookmark_name = 'reqmnt_parent_' + String(al_field_id)
Else
	ls_field_name = "$<" + as_field_name + ">$"
	ls_bookmark_name = 'reqmnt_' + String(al_field_id)
End If


//Locate bookmark
lole_window.SetFocus()
If Not lole_document.Bookmarks.Exists(ls_bookmark_name) Then
	//Messagebox('Error','Failed to find the bookmark, please call support.')
	Return -1
End If

Try	
	lole_bookmark = lole_document.Bookmarks.Item(ls_bookmark_name)	
	lole_bookmark.Select()
	
	//Must collapse it. otherwise, the bookmark will be clear when execute typetext or insertfile.
	lole_window.Selection.collapse(wdCollapseStart)
	
	//Insert content
	lole_window.SetFocus()
	IF al_reqmnt_id = -100 Then
		//Insert content with Empty
		lole_window.Selection.TypeText(' ') //a space.
	Else
		//Insert content from File
		lole_window.Selection.insertfile(ls_reqmnt_file)
		gnv_shell.of_delete_recent( ls_reqmnt_file, true) //Added By Ken.Guo 2010-05-25. Delete Windows Recent Document.
	End If
	
	lole_window.Selection.End = lole_window.Selection.Start + Len(ls_field_name)
	lole_window.SetFocus()
	lole_window.Selection.Delete(wdCharacter,0)  //Delete the selected Chars/FieldName. but it also delete next space. why???
	
	IF al_reqmnt_id = -100 Then
		lole_window.SetFocus()
		lole_window.Selection.MoveRight(wdCharacter,1,wdMove)
	Else
		//Delete next enter. because insert file will create an enter
		If Not lole_window.Selection.Information[wdWithInTable] Then //If wdWithInTable is true, when delete the last enter, all data will be deleted.
			lole_window.SetFocus()
			lole_window.Selection.Delete(wdCharacter,1)  			
		End If
		
		//Move the enter out of bookmark.
		lole_range = lole_document.Range(lole_bookmark.End - 1,lole_bookmark.End)
		If lole_range.Text = Char(13) Then
			lole_bookmark.End = lole_bookmark.End - 1	
		End If
	End If
	
	//Sometimes, it selected last enter, so collapse to start position.
	lole_window.Selection.collapse(wdCollapseStart)

Catch(OLERuntimeError err)
	Messagebox('Add Requirement Field',err.text + '~r~nPlease call support.' )
	lole_bookmark.Delete()
	Return -1
End Try

Return 1
end function

public function integer of_goto_requirement_field (oleobject aole_word, long al_field_id, boolean ab_parent_data);//////////////////////////////////////////////////////////////////////
// $<function>n_cst_word_utilityof_goto_requirement_field()
// $<arguments>
//		value	oleobject	aole_word  		
//		value	long     	al_field_id		
// $<returns> integer
// $<description>
// $<description> Go to and High-Light req field.
//////////////////////////////////////////////////////////////////////
// $<add> 2009-07-01 by Ken.Guo
//////////////////////////////////////////////////////////////////////

String ls_bookmark_name
oleobject lole_bookmark,ole_range
If ab_parent_data Then
	ls_bookmark_name = 'reqmnt_parent_' + String(al_field_id)
Else
	ls_bookmark_name = 'reqmnt_' + String(al_field_id)
End If

Try 
	If Not aole_word.ActiveDocument.Bookmarks.Exists(ls_bookmark_name) Then
		Messagebox('Information','This requirement field does not exist in the document.')
		Return 0
	End If
	
	//Go to last line
	ole_range = aole_word.ActiveDocument.GoTo(3, -1) 
	ole_range.select()
	
	//Go to current line
	lole_bookmark = aole_word.ActiveDocument.Bookmarks.Item(ls_bookmark_name)
	lole_bookmark.Select()
Catch(OLERuntimeError err)
	Messagebox('Delete BookMark',err.text + '.~r~nPlease call support.' )
	Return -1
End Try

Return 1
end function

public function integer of_remove_reqmnt_field (oleobject aole_word, long al_field_id, boolean ab_parent_data);String ls_bookmark_name
oleobject lole_bookmark

If ab_parent_data Then
	ls_bookmark_name = 'reqmnt_parent_' + String(al_field_id)
Else
	ls_bookmark_name = 'reqmnt_' + String(al_field_id)
End If

Try 
	If Not aole_word.ActiveDocument.Bookmarks.Exists(ls_bookmark_name) Then
		//Messagebox('Information','This requirement field does not exist in the document.')
		Return 0
	End If
	
	lole_bookmark = aole_word.ActiveDocument.Bookmarks.Item(ls_bookmark_name)
	lole_bookmark.Select()
	aole_word.ActiveDocument.ActiveWindow.SetFocus()	
	aole_word.ActiveDocument.ActiveWindow.Selection.Delete()
	If aole_word.ActiveDocument.Bookmarks.Exists(ls_bookmark_name)  Then
		lole_bookmark.Delete()
	End If
Catch(OLERuntimeError err)
	Messagebox('Delete BookMark',err.text + '.~r~nPlease call support.' )
	Return -1
End Try

Return 1
end function

public function integer of_remove_reqmnt_fields (oleobject aole_word, long al_field_id[], boolean ab_parent_data[], ref string as_error);Integer i
For i = 1 To UpperBound(al_field_id[])
	If of_remove_reqmnt_field(aole_word,al_field_id[i],ab_parent_data[][i]) < 0 Then
		as_error = 'Failure. Failed to remove the field.'
		Return -1
	End If
Next

Return 1
end function

public function boolean of_isexist_requirement (oleobject aole_word, long al_field_id, boolean ab_parent_data);String ls_bookmark_name

If ab_parent_data Then
	ls_bookmark_name = 'reqmnt_parent_' + String(al_field_id)
Else
	ls_bookmark_name = 'reqmnt_' + String(al_field_id)
End If

If aole_word.ActiveDocument.Bookmarks.Exists(ls_bookmark_name) Then
	Return True
Else
	Return False
End If

Return False
end function

public function integer of_refresh_reqmnt_fields (oleobject aole_word, long al_reqmnt_id[], string as_field_name[], long al_field_id[], boolean ab_parent_data[], ref string as_error);Long i,li_ret
as_error = ''
For i = 1 To UpperBound(al_field_id[])
//	//Refresh Parent Data
//	If this.of_isexist_requirement(aole_word, al_field_id[i],True) Then
//		li_ret = This.of_remove_reqmnt_field( aole_word, al_field_id[i],True)
//		If li_ret > 0 Then
//			If This.of_add_requirement_field( aole_word, al_reqmnt_id[i], as_field_name[i],al_field_id[i],True) < 0 Then
//				as_error = 'Failure. Failed to add the new field.'
//				Return -1
//			End If
//		ElseIf li_ret < 0 Then
//			as_error = 'Failure. Failed to remove the original field.'
//			Return -2
//		End If
//	End If
//	
	//Refresh Data
	If this.of_isexist_requirement(aole_word, al_field_id[i],ab_parent_data[i]) Then
		li_ret = This.of_remove_reqmnt_field( aole_word, al_field_id[i],ab_parent_data[i])
		If li_ret > 0 Then
			If This.of_add_requirement_field( aole_word, al_reqmnt_id[i], as_field_name[i],al_field_id[i],ab_parent_data[i]) < 0 Then
				as_error = 'Failure. Failed to add the new field.'
				Return -1
			End If
		ElseIf li_ret < 0 Then
			as_error = 'Failure. Failed to remove the original field.'
			Return -2
		End If
	End If
Next

Return 1
end function

public function integer of_refresh_reqmnt_fields_name (oleobject aole_word, string as_field_name[], long al_field_id[], ref string as_error);//////////////////////////////////////////////////////////////////////
// $<function>n_cst_word_utilityof_refresh_reqmnt_fields_name()
// $<arguments>
//		value    	oleobject	aole_word      		
//		value    	string   	as_field_name[]		
//		value    	long     	al_field_id[]  		
//		reference	string   	as_error       		
// $<returns> integer
// $<description>
// $<description> Refresh the fields name if they are exists.
//////////////////////////////////////////////////////////////////////
// $<add> 2009-07-01 by Ken.Guo
//////////////////////////////////////////////////////////////////////

Long i
For i = 1 To UpperBound(al_field_id[])
	
	//Refresh Parent Data
	If of_isexist_requirement(aole_word,al_field_id[i],True) Then
		If This.of_remove_reqmnt_field( aole_word, al_field_id[i],True) > 0 Then
			If This.of_add_requirement_field( aole_word, as_field_name[i],al_field_id[i],True) < 0 Then
				as_error = 'Failure. Failed to add new field.'
				Return -1
			End If
		Else
			as_error = 'Failure. Failed to remove original field.'
			Return -2
		End If		
	End If
	
	//Refresh Current Data
	If of_isexist_requirement(aole_word,al_field_id[i],False) Then
		If This.of_remove_reqmnt_field( aole_word, al_field_id[i],False) > 0 Then
			If This.of_add_requirement_field( aole_word, as_field_name[i],al_field_id[i],False) < 0 Then
				as_error = 'Failure. Failed to add new field.'
				Return -1
			End If
		Else
			as_error = 'Failure. Failed to remove original field.'
			Return -2
		End If		
	End If	

Next
as_error = ''
Return 1
end function

public function string of_get_status_link ();//====================================================================
// Function: of_get_status_link()
//--------------------------------------------------------------------
// Description: Generate Document Status Link
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  string
//--------------------------------------------------------------------
// Author:	Scofield		Date: 2009-07-23
//--------------------------------------------------------------------
//	Copyright (c) 1999-2009 Contractlogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

String	ls_weblink_root,ls_status_link
String	ls_ie_url,ls_cache_name
Long		ll_Cycle,ll_check_sn

if il_doc_id <= 0 then Return ""

//Get web_link name and cache name if they have been set in Web Link Settings Window.
Select web_link_name,cache_name Into :ls_weblink_root,:ls_cache_name From Icred_settings;

//If not exists in database, generate it from current URL
If IsNull(ls_weblink_root) or ls_weblink_root = '' Then
	ls_ie_url = AppeonGetIEURL()
	If left(lower(ls_ie_url),7) = 'http://' Then
		ls_ie_url = 'https://' + Mid(ls_ie_url,8,len(ls_ie_url))
	End If
	//AppeonGetIEURL() will return the current web root URL, e.g. 'http://192.0.3.37/test_ken/'
	ls_ie_url = Mid(ls_ie_url,1,Len(ls_ie_url) - 1) //Cut last '/'
	ls_weblink_root = Mid(ls_ie_url,1,LastPos(ls_ie_url,'/'))
	ls_weblink_root = ls_weblink_root + 'fileservice/document_status.aspx'
Else
	If Right(ls_weblink_root,1) = '/' Then
		ls_weblink_root += 'document_status.aspx'
	Else
		ls_weblink_root += '/document_status.aspx'
	End If
End If

If IsNull(ls_cache_name) or ls_cache_name = '' Then
	If gs_cachename <> '' Then
		ls_cache_name = gs_cachename
	Else
		//Failed to get cache name/database name.
		ls_status_link = ''
		Return ls_status_link
	End If
End If

//Gen check SN
For ll_Cycle = 1 To Len(ls_cache_name)
	ll_check_sn += Asc(Mid(Lower(ls_cache_name),ll_Cycle,1))
Next

ll_check_sn += il_doc_id

//Gen Status Link
ls_status_link = ls_weblink_root + '?dbname=' + lower(ls_cache_name) + '&doc_id=' + String(il_doc_id) + &
						'&ck=' + String(ll_check_sn)

//Return Status Link
Return ls_status_link

end function

public function integer of_replace_export_word (oleobject aole_word, ref string as_subject, long al_ctx_id, long al_export_id);//////////////////////////////////////////////////////////////////////
// $<function>n_cst_word_utility.of_replace_export_word
// $<arguments>
//		Reference oleobject aole_word: Word activedocument object
//		reference string as_subject:mail subject - add by jervis 09.09.2009
//		Value		 long al_ctx_id: current contract id
//		Value		 long al_export_id: current export id
// $<returns> Integer
// $<description>Replace the 'fields' with the new generated export data 
// $<description>file in a Word document 
//////////////////////////////////////////////////////////////////////
// $<add> 11.23.2007 by Alfee 
//////////////////////////////////////////////////////////////////////
Long ll_ret
DataStore lds_export

lds_export = Create DataStore
ll_ret = of_replace_export_word(aole_word, as_subject,al_ctx_id, al_export_id, lds_export, TRUE)

IF IsValid(lds_export) THEN Destroy lds_export

RETURN ll_ret

end function

public function integer of_replace_export_word (oleobject aole_word, ref string as_subject, long al_ctx_id, long al_export_id, ref datastore ads_export, boolean ab_new_export, long al_ctx_ids[]);//////////////////////////////////////////////////////////////////////
// $<function>n_cst_word_utility.of_replace_export_word
// $<arguments>
//		Reference oleobject aole_word: Word activedocument object
//		reference string as_subject:mail subject - add by jervis 09.09.2009
//		Value		 long al_ctx_id: current contract id
//		Value		 long al_export_id: current export id
//		Reference datastore ads_export: keep export data, for performance
//		Value     boolean ab_new_export: a new export, for performance
//		value 	 long al_ctx_ids[]: contracts to export data, for performance
// $<returns> Integer
// $<description>Replace the 'fields' with the specified export data 
// $<description>in a Word document
//////////////////////////////////////////////////////////////////////
// $<add> 6.11.2008 by Alfee  - Overload 
//////////////////////////////////////////////////////////////////////

String ls_matchwildcards, ls_name, ls_value, ls_IELink, ls_dir
Long ll_begin,ll_end,ll_ret,ll_i,ll_count
Long ll_found //Alfee 06.11.2008
Boolean lb_found
n_cst_string 	lnv_string
string 	ls_begin_separator
string 	ls_end_separator
string 	ls_Address
String	ls_doc_id
long		ll_Pos
String ls_ParentIELink //Added By Ken.Guo 11/13/2012
Long ll_Parent_CTXID //Added By Ken.Guo 11/13/2012
String  ls_useSAML  , ls_onlySAML , ls_web_link, ls_defaul_SAML //Added by gavins  20160907
Boolean	lb_SAML

pfc_n_cst_ai_export_apb lnv_export

IF isnull(al_export_id) THEN
	gnv_debug.of_output(true,   ' CTX ID = ' + String(al_ctx_id ) + ', export id is null .')	//added by gavins 20120829
	RETURN -1	 //jervis -- 12.21.2010
End If
IF NOT al_export_id > 0 THEN
	gnv_debug.of_output(true,   ' CTX ID = ' + String(al_ctx_id ) + ', export id <= 0 .')	//added by gavins 20120829
	RETURN -2	
End If
IF NOT IsValid(aole_word) THEN
	gnv_debug.of_output(true,   ' CTX ID = ' + String(al_ctx_id ) + ', ole word is not valid .')	//added by gavins 20120829
	RETURN -3
End If

TRY	
	//Get export data
	ls_matchwildcards = "\$\<*\>\$" // means: "$<...>$"
	aole_word.Content.Select()
	IF aole_word.ActiveWindow.Selection.Find.Execute(ls_matchwildcards, false, true, true, false, false, true, wdFindStop, false, "", wdReplaceNone ) Or &
		match(as_subject,"\$\<.*\>\$") THEN //Added By Ken.Guo 2011-05-27. Added match subject
	//IF aole_word.Content.Find.Execute(ls_matchwildcards, false, true, false, false, false, true, wdFindContinue, false, "", wdReplaceNone ) THEN
		if al_export_id > 0 then	//jervis 03.09.2009
			IF ab_new_export then //for performance tuning
				lnv_export = create pfc_n_cst_ai_export_apb
				//Set export mode to email template
				lnv_export.is_called_type = '3' 
				lnv_export.ib_gen_rec_id = TRUE //Alfee 06.11.2008
				lnv_export.of_set_str_action_item(istr_action_item)  //Added by Harry 2017-04-17 for task747
				//Get export data to datastore
				//ll_ret = lnv_export.of_get_export_data(al_export_id, al_ctx_id, ads_export)
				ll_ret = lnv_export.of_get_export_data(al_export_id, al_ctx_ids, ads_export) //Alfee 06.11.2008
				
				If  ll_ret < 1 and lnv_export.ib_writefile Then //added by gavins 20121011
					ll_ret = 1
				End If
			ELSE
				ll_ret = 1			
			END IF
			
			//	Return if a failed export - jervis 03.09.2009
			IF NOT ll_ret > 0 THEN 
				MessageBox("Merge Data","Failed to export data.")
				gnv_debug.of_output(true,   ' CTX ID = ' + String(al_ctx_id ) + ', Failed to export data .')	//added by gavins 20120829
				Destroy lnv_export //Uncomment By Ken.Guo 2011-01-11
				RETURN -4        //Uncomment By Ken.Guo 2011-01-11
			END IF
		end if
	else	//return if no such fields	- jervis 03.09.2009
		aole_word.Range(0,0).Select()
		return 0 //-5
	END IF
	If ib_Email Then gnv_status_info.of_display("Replacing data in progress, please wait...")//added by gavins 20130529  //modify by gavins 20130626
	
	ll_count = aole_word.Hyperlinks.Count//add by gavins 20120210
	for ll_i = 1 to ll_count
//		 aole_word.Hyperlinks.Item(ll_i).Address =  aole_word.Hyperlinks.Item(ll_i).TextToDisplay
		ls_Address 	= aole_word.Hyperlinks.Item(ll_i).TextToDisplay
		If match(ls_Address,"\$\<.*\>\$") Then
			 aole_word.Hyperlinks.Item(ll_i).Address = of_urldecode(  aole_word.Hyperlinks.Item(ll_i).Address  )
		End If
	next

	//Replace fields in the document
	if AppeonGetClientType() = "WEB" then
		//______________________________________________//
		//Added by gavins 20160907 task 642 saml
		//use_saml, only_saml_user , saml_force_https,ctx_web_link
		ls_web_link = gnv_data.of_getitem( 'icred_settings', 'ctx_web_link', False)
		ls_onlySAML = gnv_data.of_getitem( 'icred_settings', 'only_saml_user', False)
		ls_useSAML =  gnv_data.of_getitem( 'icred_settings', 'use_saml', False)
		
		If ls_useSAML = "1" Then//ls_onlySAML = "1" And 
			If Not ( IsNull( ls_Web_Link ) Or Trim( ls_Web_Link ) = '' ) Then
				If  Right( Trim( 	ls_Web_Link ), 1 ) <> "/" Then
					ls_Web_Link = Trim( ls_Web_Link ) + "/"					
				End If			
				select idp_name into:ls_defaul_SAML from 	idp_servers	where current_saml = '1';
				If Len( ls_defaul_SAML ) > 0 Then
					string ls_samlLink 
					ls_samlLink = ls_web_link + "saml/account/singlesignon";
            		     ls_IELink = ls_samlLink + "?" + gs_CacheName + "&" +String(al_ctx_id)  //+ "&cachename=" + gs_CacheName + "&idpname=" + ls_defaul_SAML + "&appname=ContractLogix";
				End If
			End If
		End If	 
	
		//_______________________________________________//
		//ls_IELink = AppeonGetIEURL() + "?" + gs_CacheName + "%" + String(al_ctx_id) //modified by gavins 20160907
		If isnull( ls_IELink ) Or Trim( ls_IELink ) = '' Then 	ls_IELink = AppeonGetIEURL() + "?" + gs_CacheName + "&" + String(al_ctx_id)  	//Change '%' to '&' -- Jervis 09.28.2010 
	end if
	
	ll_found = ads_export.Find("rec_id = " + String(al_ctx_id), 1, ads_export.RowCount())
	//************************************************//
	If ll_found = 0 Then//added by gavins 20120912
		gnv_debug.of_output( true, "rec_id = " + String(al_ctx_id) + ' is not finded in ads_export '   )
		Return -900 //added by gavins 20121011
	End If	
	//************************************************//
	aole_word.Content.Select()
	IF aole_word.ActiveWindow.Selection.Find.Execute(ls_matchwildcards, false, true, true, false, false, true, wdFindStop, false, "", wdReplaceNone )	Then	
		DO
			ls_name = aole_word.ActiveWindow.Selection.Text 
			ls_name = Mid(ls_name, 3, Len(ls_name) - 4)
			IF IsNumber(ads_export.Describe(ls_name+".x")) THEN
				//--------Begin Modified by Alfee on 06.11.2008--------
				//ls_value = Trim(ads_export.GetItemString(1,ls_name))
				//ll_found = ads_export.Find("rec_id = " + String(al_ctx_id), 1, ads_export.RowCount())
				IF ll_found > 0 THEN 
					//ls_value = Trim(ads_export.GetItemString(ll_found, ls_name))	APB Bug, Don't use trim function
					ls_value = ads_export.GetItemString(ll_found, ls_name)			
				//--------End Modified --------------------------------
					IF IsNull(ls_value) THEN ls_value = ""
				else //02.04.2009 By jervis
					ls_value = ""
				end if
				//aole_word.ActiveWindow.Selection.Text = ls_value
			else	//01.23.2009 By Jervis  Replate to '' value 
				ls_value = ""
				
				//--------------------------- APPEON BEGIN ---------------------------
				//$< Add  > 2009-03-06 By: Scofield
				//$<Reason> Add IEURLLink generate.
				lb_SAML = false
				if AppeonGetClientType() = "WEB" then
					Choose Case Upper(ls_Name)
						Case Upper("Web Link To Detail Tab")
							ls_Value = ls_IELink + "&20"
							lb_SAML = True
						Case Upper("Web Link To Detail Tab (Master Contract)") //Added By Ken.Guo 11/13/2012. Support Master CTX ID Link.
							Select master_contract_id Into :ll_Parent_CTXID From ctx_basic_info Where ctx_id = :al_ctx_id ;
							If ll_Parent_CTXID > 0 Then
								ls_ParentIELink = AppeonGetIEURL() + "?" + gs_CacheName + "&" + String(ll_Parent_CTXID) 
								ls_Value = ls_ParentIELink + "&20"	
							Else
								ls_value = ''
							End If							
						Case Upper("Web Link To Contacts Tab")
							ls_Value = ls_IELink + "&40"
							lb_SAML = True
						Case Upper("Web Link To Locations Tab")
							ls_Value = ls_IELink + "&50"
							lb_SAML = True
						Case Upper("Web Link To Organizations Tab")
							ls_Value = ls_IELink + "&60"
							lb_SAML = True
						Case Upper("Web Link To Fee Schedule Tab")
							ls_Value = ls_IELink + "&70"
							lb_SAML = True
						Case Upper("Web Link To Fee Schedule(NM) Tab")
							ls_Value = ls_IELink + "&80"
							lb_SAML = True
						Case Upper("Web Link To DM Document Tab")
							ls_Value = ls_IELink + "&91"
							lb_SAML = True
						Case Upper("Web Link To Document Tab(Open Document)")
							if il_doc_id > 0 then
								ls_doc_id = String(il_doc_id)
							else
								ls_doc_id = ""
							end if
	
							if IsNull(ls_doc_id) or Trim(ls_doc_id) = "" then
								ls_value = "Invalid Link, you must highlight or have a document open for system to create link."
							else
								ls_value = ls_IELink + "&912&" + ls_doc_id
								lb_SAML = True
							end if
							
						Case Upper("Web Link To DM Work_Flow Tab")
							ls_Value = ls_IELink + "&92"
							lb_SAML = True
						Case Upper("Web Link To DM Audit Trail Tab")
							ls_Value = ls_IELink + "&93"
							lb_SAML = True
						Case Upper("Web Link To Action Items Tab")
							ls_Value = ls_IELink + "&100"
							lb_SAML = True
						Case Upper("Web Link To File Service")
							If Isvalid(w_dm_email_document_send) Then
								ls_value = w_dm_email_document_send.is_web_link
							End If
						Case Upper("Web Link to Contract Status")
							ls_value = of_get_status_link()

					end Choose
				end if
				
				 //Added By Ken.Guo 2016-08-23. for web fields.
				Choose Case Upper(ls_Name)
					Case Upper('Web Document ID') 
						ls_value = is_web_docid
					Case Upper('Web Document Name') 
						ls_value = is_web_docname
//					Case Upper('Web Approval Document CL Link')  //Commented By Ken.Guo 2016-09-30
//						ls_Value = is_webapproval_cllink
					Case Upper('Document Manager Link') 
						ls_Value = is_fileservice_cllink	
				End Choose
				
				//---------------------------- APPEON END ----------------------------
			END IF
			//If ls_useSAML = "1" And  lb_SAML = True  Then  //Added By gavins 20160909
			If ls_useSAML = "1" And Len( ls_defaul_SAML ) > 0 And  lb_SAML = True  Then	 //Modified by Harry for Task 739
				ls_Value = ls_Value + "&cachename=" + gs_CacheName + "&idpname=" + ls_defaul_SAML + "&appname=ContractLogix";
				lb_SAML = false//Modified by gavins 20161129 because lb_SAML is in 'else' branch clause.
			End If			
			
			aole_word.ActiveWindow.Selection.Text = ls_value	//01.23.2009 By Jervis
			
			// turned into a hyperlink
			if AppeonGetClientType() = "WEB" and pos(upper(ls_name),Upper("Web Link To") ) > 0 then
				aole_word.Hyperlinks.Add(aole_word.ActiveWindow.Selection.Range,ls_value)
			end if

			// turned into a hyperlink //Added By Ken.Guo 2016-08-24
			if AppeonGetClientType() = "WEB" and (pos(upper(ls_name),Upper("CL Link") ) > 0 or lower(ls_name) = lower('Document Manager Link') ) and lower(left(ls_value, 4)) = 'http' and pos(ls_value, '; ') = 0 then
				aole_word.Hyperlinks.Add(aole_word.ActiveWindow.Selection.Range,ls_value)
			end if
			
			ll_begin = aole_word.ActiveWindow.Selection.End
			
			//Delete blank row 02.04.2009 By Jervis
			aole_word.ActiveWindow.Selection.HomeKey(wdLine)
			aole_word.ActiveWindow.Selection.EndKey(wdLine,wdExtend)
			ls_value = trim(aole_word.ActiveWindow.Selection.Text)
			ls_value = lnv_string.of_globalreplace( ls_value,"	","")	//02.07.2009 By Jervis
			if ls_value = "" or ls_value = "~r" or ls_value = "~r~n" then
				aole_word.ActiveWindow.Selection.delete()
				ll_begin = aole_word.ActiveWindow.Selection.End		//02.07.2009 By Jervis
			end if
			
			//Find the next field
			ll_end = aole_word.Content.End
			IF ll_end > ll_begin THEN
				aole_word.Range(ll_begin, ll_end).Select()			
				lb_found = aole_word.ActiveWindow.Selection.Find.Execute(ls_matchwildcards, false, true, true, false, false, true, wdFindStop, false, "", wdReplaceNone)			
			ELSE
				lb_found = FALSE
			END IF
		LOOP WHILE( lb_found )
	End If	
	
	//Start code ---Replace Hyperlink address	- jervis 04.29.2009
	ls_begin_separator = "$<"
	ls_end_separator = ">$"
	
	ll_count = aole_word.Hyperlinks.Count
	for ll_i = 1 to ll_count
		ls_Address  = aole_word.Hyperlinks.Item(ll_i).Address
		if ls_Address <> aole_word.Hyperlinks.Item(ll_i).TextToDisplay and match(ls_Address,"\$\<.*\>\$") then
			//Replace the filed flag for address of hyperlinks
			ll_begin = pos(ls_Address,ls_begin_separator,1)
			do while ll_begin > 0
				ll_end = pos(ls_Address,ls_end_separator,ll_begin + 2)
				if ll_end > 0 then
					ls_name = mid(ls_Address,ll_begin + 2,ll_end - ll_begin - 2)
					if IsNumber(ads_export.Describe(ls_name+".x")) then		
						if ll_found > 0 then
							ls_value = Trim(ads_export.GetItemString(ll_found,ls_name))
						else
							ls_value = ""
						end if
						if isnull(ls_value) then ls_value = ""
					else
						ls_value = ""
					end if
					ls_Address = lnv_string.of_globalreplace( ls_Address, mid(ls_Address,ll_begin,ll_end - ll_begin + 2),ls_value)
					ll_begin = pos(ls_Address,ls_begin_separator,ll_begin + len(ls_value))	
				else
					exit
				end if
			loop
			aole_word.Hyperlinks.Item(ll_i).Address = ls_Address
		end if
	next
	//End code ---Replace Hyperlink address	- jervis 04.29.2009
	
	aole_word.Range(0,0).Select()
	
	//Added By Ken.Guo 2016-08-24. merger subject with web fields.
	as_subject = lnv_string.of_globalreplace( as_subject, '$<Web Document ID>$', is_web_docid)
	as_subject = lnv_string.of_globalreplace( as_subject, '$<Web Document Name>$', is_web_docname)
//	as_subject = lnv_string.of_globalreplace( as_subject, '$<Web Approval Document CL Link>$', is_webapproval_cllink)
	as_subject = lnv_string.of_globalreplace( as_subject, '$<Document Manager Link>$', is_fileservice_cllink)
	
	//Replace Subject Fields - jervis 09.09.2009
	n_cst_workflow_triggers lnv_workflow
	lnv_workflow = create n_cst_workflow_triggers
	lnv_workflow.of_replace_export(ref as_subject,ref ads_export,ll_found)  //Added ll_found argument By Ken.Guo 2011-04-13.
	destroy lnv_workflow

	If Not ib_Email Then gnv_status_info.of_display("")//added by gavins 20130529
Catch(Throwable th)	
	MessageBox("Merge Data","Replacing merge fields failed due to: ~r~n " + th.text)
	gnv_debug.of_output( true, 'n_cst_word_utility.of_replace_export_word() = -6. ' + th.text)
	ll_ret = -6
Finally
	If Not ib_Email Then gnv_status_info.of_display("")//added by gavins 20130529
END Try

IF IsValid(lnv_export) THEN Destroy(lnv_export)

RETURN ll_ret

end function

public function integer of_replace_export_word (oleobject aole_word, ref string as_subject, long al_ctx_id, long al_export_id, ref datastore ads_export, boolean ab_new_export);//////////////////////////////////////////////////////////////////////
// $<function>n_cst_word_utility.of_replace_export_word
// $<arguments>
//		Reference oleobject aole_word: Word activedocument object
//		reference string as_subject:mail subject - add by jervis 09.09.2009
//		Value		 long al_ctx_id: current contract id
//		Value		 long al_export_id: current export id
//		Reference datastore ads_export: keep export data, for performance
//		Value     boolean ab_new_export: a new export, for performance
// $<returns> Integer
// $<description>Replace the 'fields' with the specified export data 
// $<description>in a Word document
//////////////////////////////////////////////////////////////////////
// $<add> 11.23.2007 by Alfee 
//////////////////////////////////////////////////////////////////////

//Overloaded - Alfee 06.11.2008
Integer li_rtn
Long ll_ctx_ids[] 

ll_ctx_ids[1] = al_ctx_id

li_rtn = of_replace_export_word(aole_word,as_subject,al_ctx_id, al_export_id, ads_export, ab_new_export, ll_ctx_ids)

RETURN li_rtn

/*
String ls_matchwildcards, ls_name, ls_value
Long ll_begin,ll_end,ll_ret
Long ll_found //Alfee 06.11.2008
Boolean lb_found

pfc_n_cst_ai_export_apb lnv_export

IF NOT al_export_id > 0 THEN RETURN -1
IF NOT IsValid(aole_word) THEN RETURN -1

TRY	
	//Get export data
	ls_matchwildcards = "\$\<*\>\$" // means: "$<...>$"
	aole_word.Content.Select()
	IF aole_word.ActiveWindow.Selection.Find.Execute(ls_matchwildcards, false, true, true, false, false, true, wdFindStop, false, "", wdReplaceNone ) THEN
	//IF aole_word.Content.Find.Execute(ls_matchwildcards, false, true, false, false, false, true, wdFindContinue, false, "", wdReplaceNone ) THEN
		IF ab_new_export then //for performance tuning
			lnv_export = create pfc_n_cst_ai_export_apb
			//Set export mode to email template
			lnv_export.is_called_type = '3' 
			lnv_export.ib_gen_rec_id = TRUE //Alfee 06.11.2008
			//Get export data to datastore
			ll_ret = lnv_export.of_get_export_data(al_export_id, al_ctx_id, ads_export)
		ELSE
			ll_ret = 1			
		END IF
	END IF

	//	Return if no such fields or a failed export 
	IF NOT ll_ret > 0 THEN 
		Destroy lnv_export
		RETURN -1 
	END IF

	//Replace fields in the document
	DO
		ls_name = aole_word.ActiveWindow.Selection.Text 
		ls_name = Mid(ls_name, 3, Len(ls_name) - 4)
		IF IsNumber(ads_export.Describe(ls_name+".x")) THEN
			//--------Begin Modified by Alfee on 06.11.2008--------
			//ls_value = Trim(ads_export.GetItemString(1,ls_name))
			ll_found = ads_export.Find("rec_id = " + String(al_ctx_id), 1, ads_export.RowCount())
			IF ll_found > 0 THEN ls_value = Trim(ads_export.GetItemString(ll_found, ls_name))			
			//--------End Modified --------------------------------
			IF IsNull(ls_value) THEN ls_value = ""
			aole_word.ActiveWindow.Selection.Text = ls_value
		END IF	
		//Find the next field
		ll_begin = aole_word.ActiveWindow.Selection.End
		ll_end = aole_word.Content.End
		IF ll_end > ll_begin THEN
			aole_word.Range(ll_begin, ll_end).Select()			
			lb_found = aole_word.ActiveWindow.Selection.Find.Execute(ls_matchwildcards, false, true, true, false, false, true, wdFindStop, false, "", wdReplaceNone)			
		ELSE
			lb_found = FALSE
		END IF
	LOOP WHILE( lb_found )
	
	aole_word.Range(0,0).Select()
	
Catch(Throwable th)	
	MessageBox("Merge Data","Replacing merge fields failed due to: ~r~n " + th.text)
	ll_ret = -1
END Try

IF IsValid(lnv_export) THEN Destroy(lnv_export)

RETURN ll_ret
*/

end function

public function integer of_update_clausecolor (oleobject aole_word, long al_clauseid[]);//Add by jervis 1.4.2010
//Set the Clause Text Color base on Clause Status
long ll_i,ll_count
long ll_color
long ll_clauseid
datastore lds_ClauseColor

lds_ClauseColor = create datastore

lds_ClauseColor.dataobject = "d_agreement_template_clause_color"
lds_ClauseColor.Settransobject( sqlca)
ll_count = lds_ClauseColor.Retrieve( al_clauseid[])

for ll_i = 1 to ll_count
	ll_clauseid = lds_ClauseColor.GetItemNumber( ll_i,"ctx_acp_clause_id")
	if aole_word.content.bookmarks.Exists("clause_" + string(ll_clauseid)) then
		ll_color = long(lds_ClauseColor.GetItemString( ll_i,"custom_1"))
		if ll_color >= 0 then

			aole_word.content.bookmarks.Item("clause_" + string(ll_clauseid)).select()
			aole_word.activewindow.selection.font.color = ll_color
		end if
	end if
next
destroy lds_ClauseColor
return 1
end function

public function integer of_update_wordcomment (oleobject aole_word, long al_clauseid[]);//Add by jervis 12.30.2009
//when the Clause is viewed at the Template or Contract Folder level automatically 
//create a Word Comment associated with the clause and within the comment display 
//the text that is in the Information Message area 
long ll_i,ll_count
long ll_j,ll_Comment_count
long ll_k
datastore lds_comment
string ls_msg
OleObject lole_range, lole_comments
string ls_bookmark
boolean lb_exists
long ll_clauseid
long ll_start,ll_end

Lole_Range = Create OleObject
lds_comment = create datastore

lds_comment.dataobject = "d_agreement_template_clause_comment"
lds_comment.Settransobject( sqlca)
ll_count = lds_comment.Retrieve( al_clauseid[])

//added by gavins 20120730
lole_comments = aole_word.activewindow.selection.Comments

for ll_i = 1 to ll_count
	ll_clauseid = lds_comment.GetItemNumber( ll_i,"ctx_acp_clause_id")
	if aole_word.content.bookmarks.Exists("clause_" + string(ll_clauseid)) then
		ls_msg = lds_comment.GetItemString( ll_i,"information_message")
		if len(ls_msg) > 0 then

			aole_word.content.bookmarks.Item("clause_" + string(ll_clauseid)).select()
			ll_start = aole_word.content.bookmarks.Item("clause_" + string(ll_clauseid)).Start
			ll_end = aole_word.content.bookmarks.Item("clause_" + string(ll_clauseid)).End
			//Added By Jay Chen 04-28-2014
			aole_word.Range(ll_start,ll_start).select
			aole_word.bookmarks.item("clause_" + string(ll_clauseid)).select()
			lole_comments = aole_word.activewindow.selection.Comments
			//end 
			ll_Comment_count = lole_comments.count
			if ll_comment_count < 1 then
				//Insert New Comment
				//lole_comments.Add(aole_word.ActiveWindow.Selection.Range,ls_msg)
				lole_comments.Add(aole_word.Range(ll_start,ll_end - 1 ),ls_msg)
			else
				lb_exists = false
				//If exists, Update Comment
				for ll_j = ll_comment_count to 1 step -1
					Lole_Range = lole_comments.Item[ll_j].Scope
					for ll_k = 1 to  lole_Range.Bookmarks.Count
						ls_bookmark = lole_Range.Bookmarks.Item[ll_k].Name
						if lower(left(ls_bookmark,7)) = "clause_" then
							If Not IsNumber(Mid(ls_bookmark, 8)) Then Continue
							if Long(Mid(ls_bookmark, 8)) = ll_clauseid then
								lole_comments.Item[ll_j].Range.Text = ls_msg
								lb_exists = true
								exit
							end if
						end if
					next
				next
				
				//if not exists, Insert new Comment
				if not lb_exists then
					lole_comments.Add(aole_word.Range(ll_start,ll_end - 1),ls_msg)
				end if
			end if
		end if
	end if
next
destroy lds_comment
destroy Lole_Range


return 1
end function

public function integer of_update_clausecolor (oleobject aole_word, long al_clauseid);//Add by jervis 1.4.2010
//Set the Clause Text Color base on Clause Status
long ll_clauseid[]

ll_clauseid[1] = al_clauseid
return of_update_clausecolor(aole_word,ll_clauseid)
end function

public function integer of_update_wordcomment (oleobject aole_word, long al_clauseid);//Add by jervis 01.04.2010
//when the Clause is viewed at the Template or Contract Folder level automatically 
//create a Word Comment associated with the clause and within the comment display 
//the text that is in the Information Message area 
long ll_clauseid[]

ll_clauseid[1] = al_clauseid
return of_update_wordcomment(aole_word,ll_clauseid)
end function

public function integer of_put_template_file (long al_templateid, datetime adt_newupdate, datetime adt_lastupdate);//////////////////////////////////////////////////////////////////////
// $<function>of_put_template_file()
// $<arguments>
//		value	long    	al_templateid 	
//		value	datetime	adt_newupdate		
//		value	datetime	adt_lastupdate		
// $<returns> integer
// $<description>Put local template file into DB
//////////////////////////////////////////////////////////////////////
// $<add> 05.10.2007 by Alfee (Contract Logix Agreement Tamplate Painter)
//////////////////////////////////////////////////////////////////////

string ls_newupdate,ls_filename
long ll_len
integer li_writes,li_filenum,li_cnt,li_rtn
blob lblb_file,lblb_data

ls_filename = gs_dir_path + gs_DefDirName + "\Agreement\" + "template_" + string(al_templateid) + ".doc"
ls_newupdate = string(adt_newupdate, "mm/dd/yyyy hh:mm:ss")

if not fileexists(ls_filename) then return -1

// Determine how many times to call FileRead
ll_len = filelength(ls_filename)
If ll_len > 32765 then
	 if mod(ll_len, 32765) = 0 then
		 li_writes = ll_len / 32765
	 else
		 li_writes = (ll_len / 32765) + 1
	 end If
 else
	 li_writes = 1
end if

//tab_1.tabpage_2.ole_1.object.close()

li_filenum = fileopen(ls_filename , StreamMode!, Read!, Shared!)
if li_filenum = -1 then return -1

//Read template file into blob variable
for li_cnt = 1 to li_writes
	 if fileread(li_filenum, lblb_data) = -1 then 
		fileclose(li_filenum)	
		return -10
 	 end if
	 lblb_file = lblb_file + lblb_data
next

fileclose(li_filenum)

//Added By Jay Chen 10-24-2015 check whether other user is edit template before update
long ll_upperbound,k
string ls_user_name,ls_template_name
str_sys_tracking_log_arr	 str_sys_tracking_log_arr_s
li_rtn = gnv_tracking.of_find_recorde(gnv_tracking.template_library_painter,string(al_templateid),'','',str_sys_tracking_log_arr_s)
If li_rtn > 0 Then 
	ls_user_name = ''
	ll_upperbound = Upperbound(str_sys_tracking_log_arr_s.astr_sys_tracking_log_arr[])
	SELECT Template_Name INTO :ls_template_name FROM ctx_acp_template WHERE ctx_acp_template_id = :al_templateid;
	For k = 1 to ll_upperbound 
		ls_user_name	= str_sys_tracking_log_arr_s.astr_sys_tracking_log_arr[k].as_user + ","
	Next 
	If len(ls_user_name) > 2 Then
		ls_user_name = left(ls_user_name,len(ls_user_name) - 1)
	End If 
	if isvalid(w_clause_painter) then
		w_clause_painter.tab_1.is_locktext = "Currently <"+ls_user_name+ "> is editing the <"+ls_template_name+"> Template.~r~n You will have to wait until <"+ls_user_name+"> has finished editing that Template and closed the Template before continuing. "
	end if
	return -4
End If
//end add

//Update blob data of template file into DB
If isnull(adt_lastupdate) Then
	gnv_appeondb.of_startqueue() //for web performance
		updateblob ctx_acp_template set image_file = :lblb_file 
			  where ctx_acp_template_id = :al_templateid ;
		update ctx_acp_template set modify_date = :adt_newupdate	
		 where ctx_acp_template_id = :al_templateid ;
	gnv_appeondb.of_commitqueue()
Else
	update ctx_acp_template set modify_date = :adt_newupdate	
			 where ctx_acp_template_id = :al_templateid and modify_date = :adt_lastupdate ;	
	if sqlca.SqlNRows = 0 and (sqlca.sqlcode = 0 or sqlca.sqlcode = 100) then	return -2	 
	if sqlca.sqlcode = -1 then	return -3
	updateblob ctx_acp_template set image_file = :lblb_file 
		  where ctx_acp_template_id = :al_templateid ;	
End If

if sqlca.sqlcode = 0 then
	//Modified By Mark Lee 04/18/12
	//registet new key value of the template file
//	gnv_appeondll.of_registryset("HKEY_LOCAL_MACHINE\SOFTWARE\IntelliSoft Group\Agreement", "template_" + string(al_templateid), regstring!, ls_newupdate)	
	//Modified By Ken.Guo 2015-04-29
	//gnv_appeondll.of_registryset("HKEY_LOCAL_MACHINE\SOFTWARE\"+gs_DefDirName+"\Agreement", "template_" + string(al_templateid), regstring!, ls_newupdate)	
	gnv_filetime.of_setlastwritedatetime( ls_filename, adt_newupdate)
	
	//	ib_needsave = false
else
	Return -31
end if

return 1
end function

public function integer of_put_template_file (long al_templateid, datetime adt_newupdate);////////////////////////////////////////////////////////////////////////
//// $<function>of_put_template_file()
//// $<arguments>
////		value	long    	al_templateid 		
////		value	datetime	adt_newupdate		
//// $<returns> integer
//// $<description>Put local template file into DB
////////////////////////////////////////////////////////////////////////
//// $<add> 05.10.2007 by Alfee (Contract Logix Agreement Tamplate Painter)
////////////////////////////////////////////////////////////////////////


//Modified By Ken 08/05/2011
Datetime ldt_lastupdate
Setnull(ldt_lastupdate)
Return of_put_template_file(al_templateid,adt_newupdate,ldt_lastupdate)


//string ls_lastupdate,ls_filename
//long ll_len
//integer li_writes,li_filenum,li_cnt,li_rtn
//blob lblb_file,lblb_data
//
//ls_filename = gs_dir_path + gs_DefDirName + "\Agreement\" + "template_" + string(al_templateid) + ".doc"
//ls_lastupdate = string(adt_newupdate, "mm/dd/yyyy hh:mm:ss")
//
//if not fileexists(ls_filename) then return -1
//
//// Determine how many times to call FileRead
//ll_len = filelength(ls_filename)
//If ll_len > 32765 then
//	 if mod(ll_len, 32765) = 0 then
//		 li_writes = ll_len / 32765
//	 else
//		 li_writes = (ll_len / 32765) + 1
//	 end If
// else
//	 li_writes = 1
//end if
//
////tab_1.tabpage_2.ole_1.object.close()
//
//li_filenum = fileopen(ls_filename , StreamMode!, Read!, Shared!)
//if li_filenum = -1 then return -1
//
////Read template file into blob variable
//for li_cnt = 1 to li_writes
//	 if fileread(li_filenum, lblb_data) = -1 then 
//		fileclose(li_filenum)	
//		return -1
// 	 end if
//	 lblb_file = lblb_file + lblb_data
//next
//
//fileclose(li_filenum)
//
////Update blob data of template file into DB
//gnv_appeondb.of_startqueue() //for web performance
//
//updateblob ctx_acp_template set image_file = :lblb_file 
//	  where ctx_acp_template_id = :al_templateid ;
//	  
//update ctx_acp_template set modify_date = :adt_newupdate	
// where ctx_acp_template_id = :al_templateid ;
// 
//gnv_appeondb.of_commitqueue()
//
//if sqlca.sqlcode = 0 then
//	//registet new key value of the template file
//	gnv_appeondll.of_registryset("HKEY_LOCAL_MACHINE\SOFTWARE\IntelliSoft Group\Agreement", "template_" + string(al_templateid), regstring!, ls_lastupdate)	
//	//	ib_needsave = false
//end if
//
//return 1
end function

public function string of_combine_doc (string as_sourcefile, string as_user1, string as_targetfile, string as_user2);//////////////////////////////////////////////////////////////////////
// Function: of_combine_doc
// Arguments:
// 
//--------------------------------------------------------------------
// Return:  string
//--------------------------------------------------------------------
// Author:	 Ken.Guo 11/16/2011.
//--------------------------------------------------------------------
// Description: Combine two word document
//--------------------------------------------------------------------
//////////////////////////////////////////////////////////////////////


Long i,ll_cnt
oleobject lole_word, ole_document1, ole_document2, ole_document3
String ls_combine_doc,ls_combine_doc_ret

//Only word 2007 above support combine
IF gs_word_version = 'word2003' THEN Return ''

ls_combine_doc = gs_dir_path + gs_DefDirName + "\Agreement\Manager\preview_combine.doc"
gnv_appeondll.of_parsepath(gs_dir_path + gs_DefDirName + "\Agreement\Manager")

lole_word = Create oleobject
app_filler.of_set_word_safemode(false, 1) //Added By Ken.Guo 2015-07-30
IF lole_word.Connecttonewobject("word.application") <> 0 THEN
	app_filler.of_set_word_safemode(false, 0) //Added By Ken.Guo 2015-07-30
	Messagebox('Client Error', 'Could not connect to Microsoft Word. Please make sure it is properly installed.')
	Destroy lole_word					
	RETURN ''
END IF
app_filler.of_set_word_safemode(false, 0) //Added By Ken.Guo 2015-07-30

If FileExists(ls_combine_doc) Then
	If Not FileDelete(ls_combine_doc) Then
		Messagebox('Error','Failed to delete the temporary file "' +ls_combine_doc+ '". ~r~nThis will cause your WindWord.exe process to be locked up.  Please open Windows Task Manager (Ctrl-Alt-Del to bring up option to open Task Manager).  Click on the Process tab and look for the WINWORD.exe process and right click on that entry and click End Process.',Exclamation!)
		REturn ''
	End If
End If

Try
	lole_word.Application.NormalTemplate.Saved = TRUE 
	lole_word.Visible = FALSE
	
	ole_document1 = lole_word.Application.Documents.Open(as_sourcefile, False, True,False)	
	gnv_word_utility.of_modify_word_property( ole_document1.Activedocument)	//Added By Mark Lee 06/20/2013 change for office 2013.
	gnv_shell.of_delete_recent( as_sourcefile, true) 
	
	If Not isvalid(ole_document1) Then
		Messagebox('Combine Error -1','Failed to open source file "' +as_sourcefile+ '"')
		lole_word.Quit(0)
		Destroy lole_word	
		Return ""		
	End If
	
	ole_document2 = lole_word.Application.Documents.Open(as_targetfile, False, True)
	gnv_word_utility.of_modify_word_property( ole_document2.Activedocument)	//Added By Mark Lee 06/20/2013 change for office 2013.
	gnv_shell.of_delete_recent( as_targetfile, true) 
	If Not isvalid(ole_document2) Then
		Messagebox('Combine Error -2','Failed to open target file "' +as_targetfile+ '"')
		lole_word.Quit(0)
		Destroy lole_word	
		Return ""		
	End If	
	
	ole_document3 = lole_word.Application.MergeDocuments(ole_document1,ole_document2, 2, 1, true, true, true, true, true, true, true, true, true, true,as_user1,as_user2,1 )
	If Not isvalid(ole_document3) Then
		Messagebox('Combine Error -3','Failed to merge word documents.')
		lole_word.Quit(0)
		Destroy lole_word	
		Return ""
	End If		
	
	ole_document3.SaveAs(ls_combine_doc, wdFormatDocument,false,'',false)
//	gnv_debug.of_output(True, 'Save combine file.')
//	ll_cnt = Long(lole_word.Application.Documents.count)
//	For i = ll_cnt  To 1 Step -1
//		lole_word.Application.Documents.item[i].close()
//	Next
//	gnv_debug.of_output(True, 'Close word documents.')	

	ole_document1.close()
	ole_document2.close()
	ole_document3.close()
	
	lole_word.Quit(0)
	lole_word.disconnectobject( )
	Destroy lole_word

	//Copy to temp file
	If FileExists(ls_combine_doc) Then
		Do While i <= 100
			ls_combine_doc_ret = gs_dir_path + gs_DefDirName + "\Agreement\Manager\preview_combine_"+String(i)+".doc"	
			If FileExists(ls_combine_doc_ret) Then
				If Not FileDelete(ls_combine_doc_ret) Then
					i++
					Continue
				End If
			End If
			FileCopy(ls_combine_doc, ls_combine_doc_ret, True)
			Return ls_combine_doc_ret
		Loop
		
		Messagebox('Combine Error -5','Failed to combine the documents.')
		Return  ''
	Else
		Return ''
	End If
Catch (RunTimeError e1)
	lole_word.Quit(0)
	lole_word.disconnectobject( )
	Destroy lole_word	
End Try

end function

public function string of_urldecode (string as_link);Long			ll_i 
string			ls_UrlDecode= ''

   
If Pos( as_link, '%' ) = 0 Then Return as_link

For ll_i = 1 To Len( as_Link )
	If mid( as_Link, ll_i, 1 ) = '%' Then
		If  of_HexToDec(  mid( as_Link, ll_i + 1, 2 ) ) > 127 Then
			ls_UrlDecode = ls_UrlDecode  + char( of_HexToDec( mid( as_Link, ll_i + 1, 2 ) + mid( as_link, ll_i + 4, 2 ) ) )
			ll_i = ll_i + 5
		
		Else
			ls_UrlDecode = ls_UrlDecode + char( of_HexToDec(  mid( as_Link, ll_i + 1 , 2 ) ) )
			ll_i = ll_i + 2 
			
		End If
	Else
		ls_UrlDecode = ls_UrlDecode + mid( as_Link, ll_i ,1 )
		
	End If	
Next

return ls_UrlDecode

end function

public function integer of_hextodec (string as_data);

//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Decimal
//
//	Access: 			public
//
//	Arguments:
//	as_data			Binary or Hexadecimal string value whose Decimal representation 
//						needs to be determined. 
//	ai_DataType		0 - binary;  1 - Hexadecimal
//
//	Returns: 		Unsignedlong
//						The Decimal representation of the Binary or Hexadecimal number.
//						If any argument's value is NULL, function returns NULL.
//						If any argument's value is invalid, function returns NULL.

//
//	Description:   Determines the Decimal representation of a Binary or 
//						Hexadecimal number.
//
//////////////////////////////////////////////////////////////////////////////
//	Author:	Lijun Yang  Lijun.Yang@worldnet.att.net
//
//	Date:		4/7/97
//
//=============================================================================
//
//	Revision History
//
//	Date			Initials		Description of Change
//	----   		--------		--------------------
//	4/7/97		L.Y.			Initial creation
//=============================================================================

char		lch_char[]
Unsignedlong	lul_decimal=0
int li_dec[48 to 70], li_i, li_len

//Check parameters
If IsNull(as_data) or Len(as_data)<=0 Then
	SetNull(lul_decimal)	
	Return lul_decimal
End If


//Get the decimal code for hexadecimal value of '0' to 'F'
// Whose ASC Value are from 48 to 57 and 65 to 70
For li_i = 48 To 57
	li_dec[li_i] = li_i - 48
Next

For li_i = 65 To 70
	li_dec[li_i] = li_i - 55
Next 

as_data = upper(as_data)
lch_char = as_data
li_len = len (as_data)

//Convert Hexadecimal data into decimal
For li_i = 1 to li_len
	//Make sure only 0's through f's are present
	Choose Case lch_char[li_i]
		Case '0' to '9', 'A' to 'F'
			lul_decimal = lul_decimal * 16 + li_dec[asc(lch_char[li_i])]
		Case Else
			Return lul_decimal
	End Choose	
Next

Return lul_decimal


end function

public function integer of_unprotect_doc (oleobject aole_doc);//Unprorect the document if protected - Alfee 03.10.2008

IF Not IsValid(aole_doc) THEN RETURN 0

TRY
	
IF aole_doc.ProtectionType <> wdNoProtection Then
	//--------Begin Modified by Alfee on 10.08.2008----------------------
//	MessageBox("Protected Document","It's unsupported for a document to be protected.")			//Added By Mark Lee 05/29/2013
	MessageBox(gnv_app.iapp_object.DisplayName,"The current document is restricted from formatting and editing with a password. ~r~nYou may not be able to edit or format all or part of this document.")
	RETURN -1
	//aole_doc.Unprotect()  //Unprotect document - Modified by Alfee on 10.08.2008
	//MessageBox("Protected Document","It's unsupported for a document to be protected. The program stops the protection for this document now.")
	//--------End Modified -----------------------------------------------
END IF

Catch (Throwable th)
	RETURN 0
End Try

RETURN 1
end function

public function integer of_unprotect_doc (oleobject aole_doc, boolean abln_msgbox);//Added By Mark Lee 05/23/2013
//Unprorect the document if protected 
IF abln_msgbox = True Then 
	Return of_unprotect_doc(aole_doc)
Else
	IF Not IsValid(aole_doc) THEN RETURN 0
	TRY
		IF Integer(aole_doc.ProtectionType) <> wdNoProtection Then
			gnv_debug.of_output( True, "Protected Document: "+ string(aole_doc.Name) )
			RETURN -1
		END IF	
	Catch (Throwable th)
		RETURN 0 
	End Try
End IF 

RETURN 1
end function

public function integer of_unprotect_doc_file (string as_filename);//Added By Mark Lee 05/29/2013
oleobject				lole_protect
Integer 				li_return
	
li_return = 1

lole_protect = Create oleobject
app_filler.of_set_word_safemode(false, 1) //Added By Ken.Guo 2015-07-30
IF lole_protect.Connecttonewobject("word.application") <> 0 THEN
	app_filler.of_set_word_safemode(false, 0) //Added By Ken.Guo 2015-07-30
	Messagebox('Client Error', 'Could not connect to Microsoft Word. Please make sure it is properly installed.')
	Destroy lole_protect					
	RETURN 0
END IF
app_filler.of_set_word_safemode(false, 0) //Added By Ken.Guo 2015-07-30

lole_protect.Application.NormalTemplate.Saved = TRUE 
lole_protect.Visible = FALSE
lole_protect.Application.Documents.Open(as_filename,false,true)
gnv_word_utility.of_modify_word_property( lole_protect.Activedocument)	//Added By Mark Lee 06/20/2013 change for office 2013.
gnv_shell.of_delete_recent( as_filename, true) // Delete Windows Recent Document.

li_return = this.of_unprotect_doc( lole_protect.ActiveDocument, False)

lole_protect.ActiveDocument.Close(wdDoNotSaveChanges)		
lole_protect.Quit(0)
lole_protect.DisconnectObject( )	

Destroy lole_protect

Return  li_return
end function

public subroutine of_modify_word_viewtype (oleobject aole_doc);//====================================================================
// Function: of_modify_word_viewtype
//--------------------------------------------------------------------
// Description: The word 2013 view.type default is wdReadingView, 
//	this setting cann't use the OpenDataSource and TrackRevisions method. 
//	And The word 2007 view.type default is wdPageView.
//--------------------------------------------------------------------
// Arguments:
// 	value    oleobject    aole_doc
//--------------------------------------------------------------------
// Returns:  (none)
//--------------------------------------------------------------------
// Author:	Mark Lee		Date: 06/20/2013
//--------------------------------------------------------------------
//	Copyright (c) 2008-2013 Contract Logix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
Integer 	li_type
string 	ls_name

Try
	//Microsoft Word	/Microsoft Excel
	ls_name =string(aole_doc.application.name)	//Added By Mark Lee 11/12/2013
	if Pos(lower(ls_name),lower("Word")) > 0 then 
		li_type = aole_doc.Activewindow.view.type 
		//IF gs_word_version_num = "15.0" Then 
			IF li_type = wdReadingView Then 
				aole_doc.Activewindow.view.type = wdPageView			
			End IF 
		//End IF 
	end if
CATCH(Throwable th)
		MessageBox("Alert Message","Modified view.type in document failed!~r~n of_modify_word_viewtype(): "+ th.text  )
		gnv_debug.of_output(true, "Modified view.type in document failed!~r~n of_modify_word_viewtype(): "+ th.text )
END TRY
end subroutine

public subroutine of_modify_word_property (oleobject aole_doc);//====================================================================
// Function: of_modify_word_property
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value    oleobject    aole_doc
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:	Mark Lee		Date: 06/20/2013
//--------------------------------------------------------------------
//	Copyright (c) 2008-2013 Contract Logix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

// modify the document view.type
of_modify_word_viewtype(aole_doc)
end subroutine

public function integer of_get_document_export_field (oleobject aole_word, long ai_ctx_id, long ai_export_id);//====================================================================
// Function: of_get_document_export_field
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value    oleobject    aole_word
// 	value    long         ai_ctx_id
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	Jay Chen		Date: 04-17-2014
//--------------------------------------------------------------------
//	Copyright (c) 2008-2013 ContractLogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


Long i, j, ll_cnt, ll_type, ll_find,ll_pos,ll_row,ll_shape_cnt,ll_index
String  ls_name,ls_get_export_field,ls_result,ls_text,ls_errtext
OLEObject lole_fields, lole_item,lole_header_fields, lole_footer_fields,lole_shape_fields
boolean lb_shape

ids_document_export_field.reset()

ls_get_export_field = gnv_data.of_getitem("icred_settings","get_field_before_export",false)
if isnull(ls_get_export_field) or ls_get_export_field = '' then ls_get_export_field = '1'

//Added By Jay Chen 09-19-2014
if ls_get_export_field = '1' then
	ids_export_all_field = create datastore
	ids_export_all_field.dataobject = 'dw_export_fields_detail_list'
	ids_export_all_field.settransobject(sqlca)
	ids_export_all_field.retrieve(ai_export_id)
end if
//end

//if ls_get_export_field = '1' then
	lole_fields = Create OLEObject
	lole_item = Create OLEObject
	lole_header_fields = Create OLEObject
	lole_footer_fields = Create OLEObject
	lole_shape_fields = Create OLEObject

	lole_fields = aole_word.Fields
	lole_header_fields = aole_word.Sections.Item(1).Headers.Item(1).Range.Fields
	lole_footer_fields = aole_word.Sections.Item(1).Footers.Item(1).Range.Fields
	if aole_word.Shapes.Count > 0 Then
		lb_shape = true
		ll_shape_cnt = aole_word.Shapes.Count
	else
		lb_shape = false
	end if
	
//	TRY		
//		If aole_word.Shapes.Count > 0 Then
//			lb_shape = true
//			aole_word.Shapes.Range(1).Select
////			aole_word.Shapes.SelectAll() 
//			lole_shape_fields  = aole_word.ActiveWindow.Selection.Fields
//		End If
//	CATCH (Throwable th)
//  		lb_shape = false
//	END Try

	ll_cnt = lole_fields.Count
	For i = 1 to ll_cnt
		lole_item = lole_fields.Item[i]
		ll_type = lole_item.Type
		If ll_type = wdFieldMergeField Then
			//Modified By Jay Chen 10-24-2014
			ls_text = trim(lole_fields.Item[i].code.text) 
			ls_name = of_get_mergefield_name(ls_text)
			//end
			/*****************
			ls_name = trim(lole_fields.Item[i].code.text)
//			ll_pos = pos(ls_name,'\* MERGEFORMAT') //Modified By Jay Chen 07-03-2014
			ll_pos = pos(ls_name,' \')
			if isnull(ll_pos) then ll_pos = 0
			if ll_pos > 0 then ls_name = left(ls_name,ll_pos)
			ls_name = trim(right(ls_name,len(ls_name) - 10))
			****************/
			if trim(ls_name) <> '' then
				ll_find = ids_document_export_field.find("export_field = '"+ls_name+"'",1,ids_document_export_field.rowcount())
				if isnull(ll_find) then ll_find = 0
				if ll_find < 1 then
					ll_row = ids_document_export_field.insertrow(0)
					ids_document_export_field.setitem(ll_row,"export_field", ls_name)
					ids_document_export_field.setitem(ll_row,"ctx_id", ai_ctx_id)
					if ls_get_export_field = '1' then of_get_compute_relate_field(ls_name,ai_ctx_id)  //Added By Jay Chen 09-19-2014 insert relate field when coupute field
				end if
			else
				ls_errtext = ls_errtext + ' ; ' + ls_text
				gnv_debug.of_output(true, 'n_cst_word_utility:of_get_document_export_field error. errtext is : ' + ls_text)
			end if
		End If
	Next	
	
	ll_cnt = lole_header_fields.Count
	For i = 1 to ll_cnt
		lole_item = lole_header_fields.Item[i]
		ll_type = lole_item.Type
		If ll_type = wdFieldMergeField Then
			ls_text = trim(lole_header_fields.Item[i].code.text) 
			ls_name = of_get_mergefield_name(ls_text)
			/******************
			ls_name = trim(lole_header_fields.Item[i].code.text)
//			ll_pos = pos(ls_name,'\* MERGEFORMAT')
			ll_pos = pos(ls_name,' \')
			if isnull(ll_pos) then ll_pos = 0
			if ll_pos > 0 then ls_name = left(ls_name,ll_pos)
			ls_name = trim(right(ls_name,len(ls_name) - 10))
			*******************/
			if trim(ls_name) <> '' then
				ll_find = ids_document_export_field.find("export_field = '"+ls_name+"'",1,ids_document_export_field.rowcount())
				if isnull(ll_find) then ll_find = 0
				if ll_find < 1 then
					ll_row = ids_document_export_field.insertrow(0)
					ids_document_export_field.setitem(ll_row,"export_field", ls_name)
					ids_document_export_field.setitem(ll_row,"ctx_id", ai_ctx_id)
					if ls_get_export_field = '1' then of_get_compute_relate_field(ls_name,ai_ctx_id)  //Added By Jay Chen 09-19-2014 insert relate field when coupute field
				end if
			else
				ls_errtext = ls_errtext + ' ; ' + ls_text
				gnv_debug.of_output(true, 'n_cst_word_utility:of_get_document_export_field error. errtext is : ' + ls_text)
			end if
		End If
	next

	ll_cnt = lole_footer_fields.Count
	For i = 1 to ll_cnt
		lole_item = lole_footer_fields.Item[i]
		ll_type = lole_item.Type
		If ll_type = wdFieldMergeField Then
			ls_text = trim(lole_footer_fields.Item[i].code.text) 
			ls_name = of_get_mergefield_name(ls_text)
			/******************
			ls_name = trim(lole_footer_fields.Item[i].code.text)
//			ll_pos = pos(ls_name,'\* MERGEFORMAT')
			ll_pos = pos(ls_name,' \')
			if isnull(ll_pos) then ll_pos = 0
			if ll_pos > 0 then ls_name = left(ls_name,ll_pos)
			ls_name = trim(right(ls_name,len(ls_name) - 10))
			********************/
			if trim(ls_name) <> '' then 
				ll_find = ids_document_export_field.find("export_field = '"+ls_name+"'",1,ids_document_export_field.rowcount())
				if isnull(ll_find) then ll_find = 0
				if ll_find < 1 then
					ll_row = ids_document_export_field.insertrow(0)
					ids_document_export_field.setitem(ll_row,"export_field", ls_name)
					ids_document_export_field.setitem(ll_row,"ctx_id", ai_ctx_id)
					if ls_get_export_field = '1' then of_get_compute_relate_field(ls_name,ai_ctx_id)  //Added By Jay Chen 09-19-2014 insert relate field when coupute field
				end if
			else
				ls_errtext = ls_errtext + ' ; ' + ls_text
				gnv_debug.of_output(true, 'n_cst_word_utility:of_get_document_export_field error. errtext is : ' + ls_text)
			end if
		End If
	next

	if lb_shape then
		for ll_index = 1 to ll_shape_cnt
			aole_word.Shapes.Range(ll_index).Select
			lole_shape_fields  = aole_word.ActiveWindow.Selection.Fields
			ll_cnt = lole_shape_fields.count
			For i = 1 to ll_cnt
				lole_item = lole_shape_fields.Item[i]
				ll_type = lole_item.Type
				If ll_type = wdFieldMergeField Then
					ls_text = trim(lole_shape_fields.Item[i].code.text) 
					ls_name = of_get_mergefield_name(ls_text)
					/****************
					ls_name = trim(lole_shape_fields.Item[i].code.text)
//					ll_pos = pos(ls_name,'\* MERGEFORMAT')
					ll_pos = pos(ls_name,' \')
					if isnull(ll_pos) then ll_pos = 0
					if ll_pos > 0 then ls_name = left(ls_name,ll_pos)
					ls_name = trim(right(ls_name,len(ls_name) - 10))
					****************/
					if trim(ls_name) <> '' then
						ll_find = ids_document_export_field.find("export_field = '"+ls_name+"'",1,ids_document_export_field.rowcount())
						if isnull(ll_find) then ll_find = 0
						if ll_find < 1 then
							ll_row = ids_document_export_field.insertrow(0)
							ids_document_export_field.setitem(ll_row,"export_field", ls_name)
							ids_document_export_field.setitem(ll_row,"ctx_id", ai_ctx_id)
							if ls_get_export_field = '1' then of_get_compute_relate_field(ls_name,ai_ctx_id)  //Added By Jay Chen 09-19-2014 insert relate field when coupute field
						end if
					else
						ls_errtext = ls_errtext + ' ; ' + ls_text
						gnv_debug.of_output(true, 'n_cst_word_utility:of_get_document_export_field error. errtext is : ' + ls_text)
					end if
				End If
			next
		next
	end if

	destroy lole_fields 
	destroy lole_item 
	destroy lole_header_fields
	destroy lole_footer_fields
	destroy lole_shape_fields
	if isvalid(ids_export_all_field) then destroy ids_export_all_field //Added By Jay Chen 09-19-2014
//end if

//Added By Jay Chen 08-01-2014 remark:check export field whether or not exist in current export.
datastore lds_export
string ls_export_name,ls_error_field
boolean lb_message = false
lds_export = create datastore 
lds_export.dataobject = 'd_export_fields'
lds_export.settransobject(sqlca)
lds_export.retrieve(ai_export_id)
select export_name into :ls_export_name from export_header where export_id = :ai_export_id;
if isnull(ls_export_name) then ls_export_name = ''
for ll_row = 1 to ids_document_export_field.rowcount()
	ls_name = lower(ids_document_export_field.getitemstring(ll_row,"export_field"))
	ll_find = lds_export.find("lower(export_field_name) = '"+ ls_name +"' ", 1, lds_export.rowcount())
	if isnull(ll_find) then ll_find = 0
	if ll_find < 1 then
		if isnull(ls_error_field) or ls_error_field = '' then
			ls_error_field = ls_name
		else
			ls_error_field +=  ',' + ls_name
		end if
		lb_message = true
	end if
next
destroy lds_export
if ls_get_export_field <> '1' then ids_document_export_field.reset() 
if lb_message then
	messageBox("Caution on export" , "The field name(s) "+ls_error_field+" do not exist in the Export " + ls_export_name +". Please go to the Export Painter and add these columns to the Export " + ls_export_name + "." )
	return -1	
end if
//end 

return 1
end function

public subroutine of_get_compute_relate_field (string as_name, long ai_ctx_id);//====================================================================
// Function: of_get_compute_relate_field
//--------------------------------------------------------------------
// Description: insert relate field when coupute field
//--------------------------------------------------------------------
// Arguments:
// 	value    string    as_name
// 	value    long      ai_ctx_id
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:	Jay Chen		Date: 09-19-2014
//--------------------------------------------------------------------
//	Copyright (c) 2008-2013 ContractLogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
long ll_find,ll_export_type,ll_row,k
string ls_field,ls_export_expression
				
ll_find = ids_export_all_field.find("lower(export_field_name) = '"+ lower(as_name) +"' ", 1, ids_export_all_field.rowcount())
if isnull(ll_find) then ll_find = 0
if ll_find > 0 then  
	ll_export_type = ids_export_all_field.getitemnumber(ll_find,"export_type")
	if ll_export_type = 3 then //compute field
		ls_export_expression = ids_export_all_field.getitemstring(ll_find,"export_fields_expression")
		for k = 1 to ids_export_all_field.rowcount()
			ls_field = ids_export_all_field.GetItemString(k,"export_field_name")
			if pos(lower(ls_export_expression),lower(ls_field)) > 0 then
				ll_find = ids_document_export_field.find("lower(export_field) = '"+lower(ls_field)+"'",1,ids_document_export_field.rowcount())
				if isnull(ll_find) then ll_find = 0
				if ll_find < 1 then
					ll_row = ids_document_export_field.insertrow(0)
					ids_document_export_field.setitem(ll_row,"export_field", ls_field)
					ids_document_export_field.setitem(ll_row,"ctx_id", ai_ctx_id)
				end if
			end if
		next
	end if
end if
			
end subroutine

public function string of_get_mergefield_name (string as_text);//====================================================================
// Function: of_get_mergefield_name
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value    string    as_text
//--------------------------------------------------------------------
// Returns:  string
//--------------------------------------------------------------------
// Author:	Jay Chen		Date: 10-24-2014
//--------------------------------------------------------------------
//	Copyright (c) 2008-2013 ContractLogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

string ls_name,ls_text,ls_value[],ls_string
long ll_pos,ll_special_startpos,ll_special_endpos,ll_row,ll_index,ll_space_num,ll_end,ll_num_quota
n_cst_string lnv_arrstring
boolean lb_not_space_start = false
	
//replace \*
ll_pos = pos(as_text,'\*')
if isnull(ll_pos) then ll_pos = 0
do while ll_pos > 0
	for ll_index = ll_pos + 2 to len(as_text)
		ls_string = mid(as_text,ll_index,1)
		if ls_string = ' ' then
			if lb_not_space_start and ll_num_quota = 0 then
				ll_end = ll_index
				exit
			end if
		else
			if ls_string = '"' then 
				ll_num_quota++
				if ll_num_quota = 2 then 
					ll_end = ll_index
					exit
				end if
			else
				lb_not_space_start = true
			end if
		end if
	next
	if ll_end = 0 and lb_not_space_start then ll_end = ll_index 
	as_text = Replace(as_text,ll_pos,ll_end - ll_pos,'')
	ll_pos = pos(as_text,'\*',ll_pos)
	if isnull(ll_pos) then ll_pos = 0
	lb_not_space_start = false
	ll_end = 0
	ll_num_quota = 0
loop

//replace \#
ll_pos = pos(as_text,'\#')
ll_end = 0
if isnull(ll_pos) then ll_pos = 0
do while ll_pos > 0
	for ll_index = ll_pos + 2 to len(as_text)
		ls_string = mid(as_text,ll_index,1)
		if ls_string = ' ' and ll_num_quota = 0 then 
			if lb_not_space_start then
				ll_end = ll_index
				exit
			end if
		else
			if ls_string = '"' then 
				ll_num_quota++
				if ll_num_quota = 2 then 
					ll_end = ll_index
					exit
				end if
			else
				lb_not_space_start = true
			end if
		end if
	next
	if ll_end = 0 and lb_not_space_start then ll_end = ll_index
	as_text = Replace(as_text,ll_pos,ll_end - ll_pos + 1,'')
	ll_pos = pos(as_text,'\#',ll_pos)
	if isnull(ll_pos) then ll_pos = 0
	lb_not_space_start = false
	ll_end = 0
	ll_num_quota = 0
loop

//replace \@
ll_end = 0
ll_num_quota = 0
ll_pos = pos(as_text,'\@')
if isnull(ll_pos) then ll_pos = 0
do while ll_pos > 0
	for ll_index = ll_pos + 2 to len(as_text)
		ls_string = mid(as_text,ll_index,1)
		if ls_string = ' ' then
			if lb_not_space_start and ll_num_quota = 0 then
				ll_end = ll_index
				exit
			end if
		else
			if ls_string = '"' then 
				ll_num_quota++
				if ll_num_quota = 2 then 
					ll_end = ll_index
					exit
				end if
			else
				lb_not_space_start = true
			end if
		end if
	next
	if ll_end = 0 and lb_not_space_start then ll_end = ll_index
	as_text = Replace(as_text,ll_pos,ll_end - ll_pos + 1,'')
	ll_pos = pos(as_text,'\@',ll_pos)
	if isnull(ll_pos) then ll_pos = 0
	lb_not_space_start = false
	ll_end = 0
	ll_num_quota = 0
loop

ll_pos = pos(as_text,'\b')
if isnull(ll_pos) then ll_pos = 0
do while ll_pos > 0
	as_text = Replace(as_text,ll_pos,2,'')
	ll_pos = pos(as_text,'\b',ll_pos)
	if isnull(ll_pos) then ll_pos = 0
loop

ll_pos = pos(as_text,'\f')
if isnull(ll_pos) then ll_pos = 0
do while ll_pos > 0
	as_text = Replace(as_text,ll_pos,2,'')
	ll_pos = pos(as_text,'\f',ll_pos)
	if isnull(ll_pos) then ll_pos = 0
loop

ll_pos = pos(as_text,'\m')
if isnull(ll_pos) then ll_pos = 0
do while ll_pos > 0
	as_text = Replace(as_text,ll_pos,2,'')
	ll_pos = pos(as_text,'\m',ll_pos)
	if isnull(ll_pos) then ll_pos = 0
loop

ll_pos = pos(as_text,'\v')
if isnull(ll_pos) then ll_pos = 0
do while ll_pos > 0
	as_text = Replace(as_text,ll_pos,2,'')
	ll_pos = pos(as_text,'\v',ll_pos)
	if isnull(ll_pos) then ll_pos = 0
loop

as_text = trim(as_text)
lnv_arrstring.of_parsetoarray( as_text, ' ', ls_value[])

for ll_row = 1 to upperbound(ls_value)
	ls_text = ls_value[ll_row]
	if upper(ls_text) = 'MERGEFIELD' or upper(ls_text) = 'MERGEFORMAT' then continue
	if trim(ls_text) <> '' and not isnull(ls_text) then 
		ls_name = ls_text
		exit
	end if
next	
	
return ls_name
end function

public subroutine of_set_web_values (long al_docid, string as_docname, string as_webapproval_cllink, string as_fileservice_cllink);//====================================================================
// Function: of_set_web_values
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//                al_docid
//                as_docname
//                as_webapproval_cllink
//				 as_fileservice_cllink
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:         Ken.Guo 2016-08-23
//--------------------------------------------------------------------
//Copyright (c) 2008-2016 Contract Logix, Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

is_web_docid = String(al_docid)
is_web_docname = as_docname
is_webapproval_cllink = as_webapproval_cllink
is_fileservice_cllink = as_fileservice_cllink

end subroutine

public subroutine of_set_web_values (long al_docid[], string as_docname[], string as_webapproval_cllink[], string as_fileservice_cllink[]);//====================================================================
// Function: of_set_web_values
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//                al_docid[]
//                as_docname[]
//                as_webapproval_cllink[]
//				 as_fileservice_cllink[]
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:         Ken.Guo 2016-08-25
//--------------------------------------------------------------------
//Copyright (c) 2008-2016 Contract Logix, Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

Long i
For i = 1 To Upperbound(al_docid[])
	If i = 1 Then
		is_web_docid = String(al_docid[i])
	Else
		is_web_docid = is_web_docid+ '; ' + String(al_docid[i])
	End If
Next

For i = 1 To Upperbound(as_docname[])
	If i = 1 Then
		is_web_docname = as_docname[i]
	Else
		is_web_docname = is_web_docname+ '; ' + as_docname[i]
	End If
Next

For i = 1 To Upperbound(as_webapproval_cllink[])
	If i = 1 Then
		is_webapproval_cllink = as_webapproval_cllink[i]
	Else
		is_webapproval_cllink = is_webapproval_cllink+ '; ' + as_webapproval_cllink[i]
	End If
Next

For i = 1 To Upperbound(as_fileservice_cllink[])
	If i = 1 Then
		is_fileservice_cllink = as_fileservice_cllink[i]
	Else
		is_fileservice_cllink = is_fileservice_cllink+ ' ; ' + as_fileservice_cllink[i]
	End If
Next

end subroutine

public subroutine of_set_str_action_item (str_action_item astr_action_item);//Added by Harry 2017-04-17 for task747
istr_action_item = astr_action_item
end subroutine

on n_cst_word_utility.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_word_utility.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;//Added by Alfee 05.05.2007
ids_clausename = Create datastore
ids_clausename.dataobject = 'd_clauses_all'
ids_clausename.SetTransObject(SQLCA)

//Added By Jay Chen 04-16-2014
ids_document_export_field = create datastore
ids_document_export_field.dataobject = 'dw_ctx_export_field'
ids_document_export_field.settransobject(sqlca)
end event

event destructor;//Added by Alfee 05.05.2007
Destroy ids_clausename
end event

