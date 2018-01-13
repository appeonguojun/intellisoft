$PBExportHeader$nvo_web_crawler_engine.sru
forward
global type nvo_web_crawler_engine from nonvisualobject
end type
end forward

global type nvo_web_crawler_engine from nonvisualobject autoinstantiate
end type

type variables
boolean ib_image_saved = false
boolean ib_verif_ext
boolean ib_test = false

string is_url
string is_no_results_message
string is_path
string is_saved_file
string is_verif_search_val
string is_iim_path  //maha 05.15.07

integer ii_type
integer ii_resp_step

n_ds ids_prac
n_ds ids_wc
n_ds ids_steps
end variables

forward prototypes
public function integer of_crawl (integer ai_wc_id, integer facility_id, long al_prac_id, string as_doc_id, boolean ab_show_macro_running)
public function integer of_build_crawl (integer ai_start, integer ai_end, integer ai_loop)
public function string of_spaces (string as_val)
public function long of_image_save (string as_doc_id, integer ai_update)
public function string of_format_value (integer ai_type, string as_value)
public function string of_format_date (integer ai_type, datetime adt_date)
public function string of_crawl_new (integer ai_wc_id, long al_prac_id, string as_doc_id, boolean ab_show_crawler)
public function long of_verif_response (integer ai_wcid, integer ai_step, string as_extract)
public function string of_get_data_value (string as_data, long al_step)
end prototypes

public function integer of_crawl (integer ai_wc_id, integer facility_id, long al_prac_id, string as_doc_id, boolean ab_show_macro_running);//@@@ this function NO LONGER USED -- use of_crawl_new
Blob lb_our_blob
Blob lb_tot_b
Blob blob_temp
Blob total_blob
Blob blank_blob 
Blob lb_verif_picture
Boolean lb_image_saved = False
Boolean lb_extract_verif_result = False
Boolean 	lb_check_for_no_results = False
Long fh
Long ll_retval  // -100 = no data found page came up  -200 = macro error
Long ll_rec_id
Long ll_verif_response_cd
Long ll_filelen
Long ll_bytes_read
Long ll_new_pos 
Long ll_cnt
String ls_sql
String ls_file_type
String ls_no_results_message
String ls_ic_ver_cd
String ls_ic_vef_cd
String ls_response_code
String ls_html_search_val
String ls_line
String ls_web_site_data
String ls_content
String ls_char
string ls_path //maha 111605
string ls_saved_file //maha 012907
string ls_form_val //maha020607
string ls_obj_pos //maha020607
string ls_obj_name //maha020607
string ls_var_name
string ls_actno 
string ls_userid
string ls_pass
integer li_type //012907
Integer li_filenum
Integer li_loops
Integer li_counter 
Integer li_retval
Integer li_result
Integer c
Integer li_found_pos
Integer li_step_order
Integer li_ver_extract_step
Integer li_len
Integer li_rc
Integer i
Integer li_FileNum2
String ls_value
String ls_step_action
String ls_data_from
String ls_url
String ls_tag
String ls_f_name
String ls_m_name
String ls_l_name
String ls_prof_suffix
String ls_ssn
String ls_reference
String ls_ref_1
String ls_ref_2
DateTime ldt_exp_dt
DateTime ldt_dob
n_ds lds_steps
n_ds lds_web_verif_rsp_mapping

ls_path = gs_dir_path + gs_DefDirName + "\" //maha111605
//maha 111605 modifed from storing directly on the gs_dir_path which typically is C:\ 
FileDelete( ls_path + "_ResultPage.htm" )
FileDelete( ls_path + "_ResultPage.bmp" )
FileDelete( ls_path + "_ResultPage.pdf" )

SELECT v_full_name.first_name,   
       v_full_name.middle_name,   
       v_full_name.last_name,   
       v_full_name.prof_suffix,   
       v_full_name.date_of_birth,   
       v_full_name.ssn,   
       v_verif_info.reference_value,   
       v_verif_info.expiration_date  
INTO :ls_f_name, :ls_m_name, :ls_l_name, :ls_prof_suffix, :ldt_dob, :ls_ssn, :ls_reference, :ldt_exp_dt
FROM v_full_name,   
     v_verif_info  
WHERE ( v_full_name.prac_id = v_verif_info.prac_id ) AND
      ( v_verif_info.doc_id = :as_doc_id);
IF SQLCA.SQLCODE = -1 THEN
	MessageBox( "SQL Error", SQLCA.SQLERRTEXT )
	RETURN -1
END IF

ls_ref_1 = Mid( ls_reference, 1, POS( ls_reference, "-" ) -1 )
ls_ref_2 = Mid( ls_reference, POS( ls_reference, "-" ) + 2, 100 )

SELECT wc_web_address
	INTO: ls_url
	FROM wc_hdr
	WHERE wc_id = :ai_wc_id;
IF SQLCA.SQLCODE = -1 THEN
		MessageBox( "SQL Error", SQLCA.SQLERRTEXT )
		FileClose( li_fileNum)
		RETURN -1
END IF									
IF Upper( Mid( ls_url, 1, 4 ))  <> "HTTP" THEN
	ls_url = "HTTP://" + ls_url
END IF
//maha 021307
SELECT web_site_account_number,
web_site_user_id,
web_site_password
into :ls_actno, :ls_userid, :ls_pass
from wc_hdr
where wc_id = :ai_wc_id  ;

lds_steps = CREATE n_ds
lds_steps.DataObject = "d_wc_steps_browse"
lds_steps.of_SetTransObject( SQLCA )
lds_steps.Retrieve( ai_wc_id )
li_rc = lds_steps.RowCount( )
lds_steps.Sort( )

li_FileNum = FileOpen("C:\Program Files\InternetMacros\Macros\WebCrawl.iim",  LineMode!, Write!, LockWrite!, Replace!)
FileWrite( li_FileNum, "TAB T=1" )
FileWrite( li_FileNum, "TAB CLOSEALLOTHERS" )
FileWrite( li_FileNum, "SIZE X=800 Y=600" )

//Start Code Change ----10.18.2006 #1 maha
// modified path references to use ls_path.  Also added some error traps for the InternetMacros functions.
FOR i = 1 TO li_rc
	
	//messagebox("",i)
	ls_content = ""
	ls_step_action = lds_steps.GetItemString( i, "step_action" )
	li_step_order = lds_steps.GetItemNumber( i, "step_order" )
	ls_obj_pos = String(lds_steps.GetItemNumber( i, "object_pos" ))
	if isnull(ls_obj_pos) then ls_obj_pos = "1"
	ls_content = lds_steps.GetItemString( i, "content_or_value" )
	if isnull(ls_content) then ls_content = ""
	choose case ls_content //variable used in extract of data
		case "VAR1","VAR2","VAR3"
			//debugbreak()	
			ls_var_name = "{{!" + ls_content + "}}"
	end choose
	ls_obj_name = lds_steps.GetItemstring( i, "object_name" )
	ls_form_val = lds_steps.GetItemString( i, "form_handler" )

	CHOOSE CASE ls_step_action
			
		CASE "Save PDF File"     	
			ls_file_type = "pdf"
			li_type = 2
			lb_image_saved = True
			ls_saved_file = ls_path + "_ResultPage.pdf"
			//ls_tag = "ONDOWNLOAD FOLDER=FOLDER=" + ls_path + " FILE=_ResultPage"
			ls_tag = "ONDOWNLOAD FOLDER=" + ls_path + " FILE=_ResultPage"
			FileWrite( li_FileNum, ls_tag  )
			ls_tag = "SAVEAS TYPE=HTM FOLDER=" + ls_path + " FILE=_ResultPage.htm"
			FileWrite( li_FileNum, ls_tag  )
			ls_tag = "SAVEITEM"           			
			FileWrite( li_FileNum, ls_tag  )		
		CASE "Go To Web Site URL"
//			SELECT wc_web_address //maha moved up 02.06.07
//			INTO: ls_url
//			FROM wc_hdr
//			WHERE wc_id = :ai_wc_id;
//			IF SQLCA.SQLCODE = -1 THEN
//					MessageBox( "SQL Error", SQLCA.SQLERRTEXT )
//					FileClose( li_fileNum)
//					RETURN -1
//			END IF									
//			IF Upper( Mid( ls_url, 1, 4 ))  <> "HTTP" THEN
//				ls_url = "HTTP://" + ls_url
//			END IF
			FileWrite( li_FileNum, "URL GOTO=" + ls_url  )			
			
		CASE "Fill In Edit Box"
			//  TAG POS=1 TYPE=INPUT:TEXT FORM=ACTION:licensetypecode.asp ATTR=NAME:License CONTENT=9107 
			ls_tag = "TAG POS=" + ls_obj_pos
			
			
			IF POS( ls_form_val, ".asp" ) > 0 THEN  //maha 021207
				ls_tag = ls_tag + " TYPE=INPUT:TEXT FORM=NAME:" + ls_form_val
			elseIF POS( ls_form_val, "." ) > 0 THEN //if a dot exists set as action ; otherwise as name
				ls_tag = ls_tag + " TYPE=INPUT:SUBMIT FORM=ACTION:" + ls_form_val
			ELSE
				ls_tag = ls_tag + " TYPE=INPUT:TEXT FORM=NAME:" + ls_form_val		//was submit changed to text 021306
			END IF
			
			ls_tag = ls_tag + " ATTR=NAME:" + ls_obj_name
			ls_data_from = ls_content
			
			CHOOSE CASE Upper(ls_data_from)
				CASE "VERIF REFERENCE 1"
					ls_value = ls_ref_1
				CASE "VERIF REFERENCE 2"					
					ls_value = ls_ref_2	
				case "LAST NAME"
					ls_value = ls_l_name
				case "FIRST NAME"
					ls_value = ls_f_name
				case "ACCOUNT NUMBER"
					ls_value = ls_actno
				case "USER NAME"
					ls_value = ls_userid
				case "PASSWORD"
					ls_value = ls_pass
				CASE ELSE					
					ls_value = ls_data_from
			END CHOOSE
			

			li_len = Len( ls_value )
			FOR c = 1 TO li_len			
				ls_char = Mid( ls_value, c, 1 )
				IF ls_char = " " THEN
					ls_value = Mid( ls_value, 1, c -1 ) + "<SP>" + Mid( ls_value, c + 1, 1000 )
				END IF
			END FOR			
			
			ls_tag = ls_tag + " CONTENT=" + ls_value
			FileWrite( li_FileNum, ls_tag  )						
			
		CASE "Click Submit"									
			//TAG POS=1 TYPE=INPUT:SUBMIT FORM=ACTION:licensecode.asp ATTR=NAME:Accept&&VALUE:Accept  
			ls_tag = "TAG POS=" + ls_obj_pos
			
			IF POS( ls_form_val, ".asp" ) > 0 THEN  //maha 021207
				ls_tag = ls_tag + " TYPE=INPUT:SUBMIT FORM=NAME:" + ls_form_val
			elseIF POS( ls_form_val, "." ) > 0 THEN //if a dot exists set as action ; otherwise as name
				ls_tag = ls_tag + " TYPE=INPUT:SUBMIT FORM=ACTION:" + ls_form_val
			ELSE
				ls_tag = ls_tag + " TYPE=INPUT:SUBMIT FORM=NAME:" + ls_form_val				
			END IF
			
			ls_value = ls_content
			
			li_len = Len( ls_value )
			FOR c = 1 TO li_len			// this adds a <sp> tag for existing spaces
				ls_char = Mid( ls_value, c, 1 )
				IF ls_char = " " THEN
					ls_value = Mid( ls_value, 1, c -1 ) + "<SP>" + Mid( ls_value, c + 1, 1000 )
				END IF
			END FOR			
						 
			ls_tag = ls_tag + " ATTR=NAME:" + ls_obj_name + "&&" + "VALUE:" + ls_value
			lds_steps.SetItem( i, "notes", ls_tag )
			FileWrite( li_FileNum, ls_tag  )	
			IF lds_steps.GetItemNumber( i, "no_data_found_check" ) = 1 THEN			
				lb_check_for_no_results = True
				ls_no_results_message = Upper(lds_steps.GetItemString( i, "no_data_found_text" ))
			END IF
			IF lds_steps.GetItemNumber( i, "search_opens_seperate_win" ) = 1 THEN
				FileWrite( li_FileNum,  "TAB CLOSE"  )	
			END IF
		CASE	"Click on Image Submit" //maha 02.13.07 //created for 'board certified docs'  crawler
			//debugbreak()
			ls_tag = "TAG TYPE=INPUT:IMAGE FORM=NAME:"  + ls_form_val 
			ls_tag = ls_tag + " ATTR=NAME:" + ls_obj_name + "&&VALUE:"
			FileWrite( li_FileNum, ls_tag  )
		CASE "Save Page as Image"	
			ls_file_type = "bmp"
			li_type = 4
			lb_image_saved = True
			ls_saved_file = ls_path + "_ResultPage.bmp"
			ls_tag = "SAVEAS TYPE=BMP FOLDER=" + ls_path + " FILE=_ResultPage.bmp"
			FileWrite( li_FileNum, ls_tag  )								
			ls_tag = "SAVEAS TYPE=HTM FOLDER=" + ls_path + " FILE=_ResultPage.htm"
			FileWrite( li_FileNum, ls_tag  )			
			//FileWrite( li_FileNum, "WAIT SECONDS=5"  )	
	
		CASE "Extract Single Piece Of Data"
		//@@@@@@@@@@@@@@@@@@@2
			ls_tag = "EXTRACT POS=" + ls_obj_pos  //extract tag
			ls_tag = ls_tag + " TYPE=TXT ATTR=" +  ls_form_val	
			FileWrite( li_FileNum, ls_tag  )
			ls_tag = "SET !" + ls_content +  " {{!EXTRACT}} "  //set variable from extracted value
			FileWrite( li_FileNum, ls_tag  )
		CASE "Extract Verification Result"	
			lb_extract_verif_result = True
			ls_html_search_val = lds_steps.GetItemString( i, "macro_extract_tag" )
			li_ver_extract_step = lds_steps.GetItemNumber( i, "step_order" )
		CASE "Select From List Box"
			//TAG POS=1 TYPE=SELECT FORM=ACTION:http://www.nysed.gov/COMS/OP001/OPSCR2 ATTR=NAME:profcd CONTENT=$Mental<SP>Health<SP>Counselor						
			ls_tag = "TAG POS=" + ls_obj_pos
			ls_tag = ls_tag + " TYPE=SELECT FORM=ACTION:" + ls_form_val			
			ls_tag = ls_tag + " ATTR=NAME:" + ls_obj_name
						
			ls_content = ls_content

			IF ls_content = "Professional Suffix" THEN
				ls_content = ""
				IF lds_steps.GetItemNumber( i, "web_data_comparison_yes_no" ) = 1 THEN
					//messagebox("", ls_prof_suffix)
					SELECT wc_web_data_comparison.web_site_data  
					INTO :ls_content
					FROM wc_web_data_comparison  
					WHERE ( wc_web_data_comparison.wc_id = :ai_wc_id ) AND  
				         ( wc_web_data_comparison.step_order = :li_step_order ) AND  
				         ( wc_web_data_comparison.intellicred_data = :ls_prof_suffix )  ;
					IF SQLCA.SQLCODE = -1 THEN
						MessageBox( "SQL Error", SQLCA.SQLERRTEXT )
						RETURN -1
					END IF
					IF ls_content = "" THEN
						MessageBox( "No Data", "There is no Web Page List Box Value mapped to the Selection physicians Professional Suffix for: "  + ls_prof_suffix + ".  Go to Web Crawler Painter to correct.")
						Return -1
					END IF
				ELSE
					ls_content = ls_prof_suffix
				END IF
			END IF
			
			li_len = Len( ls_content )
			FOR c = 1 TO li_len			
				ls_char = Mid( ls_content, c, 1 )
				IF ls_char = " " THEN
					ls_content = Mid( ls_content, 1, c -1 ) + "<SP>" + Mid( ls_content, c + 1, 1000 )
				END IF
			END FOR
			ls_content = "$" + ls_content
			ls_tag = ls_tag + " CONTENT=" + ls_content
			FileWrite( li_FileNum, ls_tag  )	
			
		CASE "Select From Drop Down"
			messagebox("Crawl Setup error", "There is no code for processing " + ls_step_action)
			return -1
		CASE "Select From Check Box"
			messagebox("Crawl Setup error", "There is no code for processing " + ls_step_action)
			return -1
		CASE "Select From Radio Button"			
			messagebox("Crawl Setup error", "There is no code for processing " + ls_step_action)
			return -1
		CASE "Select From Table List"			
			messagebox("Crawl Setup error", "There is no code for processing " + ls_step_action)
			return -1
		CASE	"Click on Image Hyperlink" //maha 02.06.07
			//ls_tag = "WAIT seconds=1"
			//FileWrite( li_FileNum, ls_tag  )
			if isnull(ls_form_val)  then ls_form_val = ls_url
			ls_tag = "TAG TYPE=IMG ATTR=TXT:" + ls_form_val  + ls_obj_name
			FileWrite( li_FileNum, ls_tag  )
//			ls_tag = "TAB T=2"
//			FileWrite( li_FileNum, ls_tag  )
		CASE	"Click on Hyperlink" //maha 02.06.07
//			TAG POS=1 TYPE=A ATTR=HREF:http://webpages.charter.net/sunsetcrossing/kitchenthumbs.html  
			ls_tag = "WAIT seconds=1"
			FileWrite( li_FileNum, ls_tag  )
			ls_tag = "TAG TYPE=A ATTR=TXT:" + ls_obj_name
			FileWrite( li_FileNum, ls_tag  )
			
			//ls_tag = "ATTR=HREF:" + ls_content
			//FileWrite( li_FileNum, ls_tag  )
		CASE	"Click on Variable Link" //maha 02.13.07
//			TAG POS=1 TYPE=A ATTR=HREF:http://webpages.charter.net/sunsetcrossing/kitchenthumbs.html  
			//ls_tag = "WAIT seconds=1"
			//FileWrite( li_FileNum, ls_tag  )
			ls_tag = "TAG TYPE=A ATTR=TXT:" + ls_var_name
			//messagebox("",ls_tag)
			FileWrite( li_FileNum, ls_tag  )

		CASE "Save Page as HTML"						
			ls_file_type = "htm"
			li_type = 3
			lb_image_saved = True
			ls_saved_file = ls_path + "_ResultPage.htm"
			//ls_tag = "SAVEAS TYPE=BMP FOLDER=" + ls_path + " FILE=_ResultPage.bmp"
			//FileWrite( li_FileNum, ls_tag  )								
			ls_tag = "SAVEAS TYPE=HTM FOLDER=" + ls_path + " FILE=_ResultPage.htm"
			FileWrite( li_FileNum, ls_tag  )	
			
	END CHOOSE

END FOR
//end if crawler creation

lds_steps.Update( )

FileClose( li_filenum )


OLEObject myoleobject
myoleobject = CREATE OLEObject
li_result = myoleobject.ConnectToNewObject(  "InternetMacros.iim")
IF li_result < 0 THEN
		messagebox("of_Crawl failure","Failed to connect to InternetMacros.iim.  Check installation.")
		Return - 900
END IF
debugbreak()
IF ab_show_macro_running THEN
	myoleobject.iimInit() 
ELSE
	myoleobject.iimInit("-tray")		
END IF
//Run the web crawl
li_result = myoleobject.iimPlay ("WebCrawl")
IF li_result < 0 THEN
		messagebox("of_Crawl failure","iimplay failed")
		Return - 900
END IF

IF NOT ab_show_macro_running THEN
	myoleobject.iimExit() 
END IF

//if check for no results
IF lb_extract_verif_result OR lb_check_for_no_results THEN
	if not fileexists(  ls_path + "_ResultPage.htm") then //check to see if file was created
		messagebox("Crawl Error",  ls_path + "_ResultPage.htm" + " file does not exist.")
		return -900 //maha
	end if
	li_filenum2 = FileOpen( ls_saved_file , StreamMode!)
	ls_html_search_val = Upper( ls_html_search_val )	
	DO WHILE  FileRead( li_filenum2, ls_line ) >=  0
		ls_line = Upper( ls_line)
		//check for no results
		IF lb_check_for_no_results THEN
			li_found_pos = POS( ls_line, ls_no_results_message )  //if the no results text is found return a failure
			IF li_found_pos > 0 THEN
				myoleobject.DisconnectObject()				
				ll_retval = -100
				EXIT
			END IF
		END IF
		If  lb_extract_verif_result  then //if looking for verif result value
			li_found_pos = POS( ls_line, ls_html_search_val ) //search current line for the tage containing the verif result
			IF li_found_pos > 0 THEN
				li_found_pos = li_found_pos + Len( ls_html_search_val ) //???
				ls_response_code = Upper( Mid( ls_line, li_found_pos, 30 ) ) //?? substring starts at the end of where the verif value would be??
							
				lds_web_verif_rsp_mapping = CREATE n_ds
				lds_web_verif_rsp_mapping.DataObject = "d_web_data_comparison"
				lds_web_verif_rsp_mapping.of_SetTransObject( SQLCA )
				lds_web_verif_rsp_mapping.Retrieve( ai_wc_id, li_ver_extract_step )			
				lds_web_verif_rsp_mapping.SetSort( "word_len D" )
				lds_web_verif_rsp_mapping.Sort( )
				li_rc = lds_web_verif_rsp_mapping.RowCount( )
				
				FOR i = 1 TO li_rc
					ls_web_site_data = lds_web_verif_rsp_mapping.GetItemString( i, "web_site_data" )		
					IF POS( ls_response_code, ls_web_site_data  ) > 0 THEN
						ls_ic_ver_cd = lds_web_verif_rsp_mapping.GetItemString( i, "intellicred_data" )
						SELECT lookup_code
						INTO :ll_verif_response_cd
						FROM code_lookup
						WHERE description = :ls_ic_ver_cd;
						IF SQLCA.SQLCODE = -1 THEN
							MessageBox( "SQL Error", SQLCA.SQLERRTEXT )
							RETURN -1
						END IF		
						ll_retval = ll_verif_response_cd
						Exit
					END IF
				END FOR			
				EXIT
			END IF  //if value found
		end if   //if verif extract 
	LOOP	
END IF

IF ll_verif_response_cd = 0 THEN
	ll_retval = 1
END IF

FileClose( li_filenum2 )		
FileClose( li_filenum )
myoleobject.DisconnectObject()	


IF lb_image_saved THEN
	//Put image into db
//	ll_filelen = FileLength( ls_path + "_ResultPage." + ls_file_type ) 
	ll_filelen = FileLength( ls_saved_file ) 


	//messagebox("file",  ls_saved_file )
	
 	li_filenum = FileOpen(ls_saved_file, StreamMode!,READ!,LOCKREAD!)

	IF li_filenum <> -1 THEN	
		//Determine how many FileReads will be necessary to read all of the file ... 
		
		//You can't read in more than 32K at a time 
		IF ll_filelen > 32765 THEN 
   			IF Mod(ll_filelen,32765) = 0 THEN 
	   		  	   li_loops = ll_filelen/32765 
			 ELSE 
   				   li_loops = (ll_filelen/32765) + 1 
	   	 	 END IF 
		ELSE 
   			 li_loops = 1 
		END IF 

		//read the file ... 
		FOR li_counter = 1 to li_loops 
   		 ll_bytes_read = FileRead( li_filenum, blob_temp) 
			 IF ll_bytes_read = -1 THEN
				MessageBox("Error", "Error with FileRead command.  Return -1." )
				Return -1
			 END IF
		    lb_tot_b = lb_tot_b + blob_temp 
   		 ll_new_pos = ll_new_pos + ll_bytes_read 
	   	 FileSeek(li_filenum, ll_new_pos, FROMBEGINNING!) 
	
   		 if len(lb_tot_b) > 1000000 then 
	   	     total_blob = total_blob + lb_tot_b 
   	   	  lb_tot_b = blank_blob 
		    end if 
		NEXT 

		total_blob = total_blob + lb_tot_b 
	
		lb_verif_picture = total_blob

		FileClose(li_filenum) 
		
		//messagebox("blob length", len( total_blob) )
		
		UPDATEBLOB verif_info
		SET verification_picture = :lb_verif_picture
		WHERE doc_id = :as_doc_id
		USING SQLCA;
		IF SQLCA.SQLCODE = -1 THEN
			MessageBox("Error", SQLCA.SQLERRTEXT )
			Return -1
		END IF
//messagebox("type", li_type)
		UPDATE verif_info
		SET verification_picture_flag = :li_type
		WHERE doc_id = :as_doc_id
		USING SQLCA;	
		IF SQLCA.SQLCODE = -1 THEN
			MessageBox("Error", SQLCA.SQLERRTEXT )
			Return -1
		END IF		
		
	ELSE
		MessageBox("Web Crawler", "File Open Error.  Could not open " + ls_saved_file + " for StreamMode!" )
		Return -1
	END IF

	IF SQLCA.SQLNRows > 0 THEN
		COMMIT USING SQLCA ;
	ELSEIF SQLCA.SQLCODE = -1 THEN
		MessageBox( "SQL ERROR", SQLCA.SQLERRTEXT )
		Return -1
	ELSEIF SQLCA.SQLNRows = 0 THEN	
		MessageBox( "SQL Error", "No rows effected." )
	END IF
END IF
//End Code Change---10.18.2006

Return ll_retval

end function

public function integer of_build_crawl (integer ai_start, integer ai_end, integer ai_loop);//Start Code Change ---- 02.20.2007 #V7 maha  function created - this creates the crawl steps

Boolean lb_extract_verif_result = False
Boolean 	lb_check_for_no_results = False
Integer li_filenum
Integer c
integer li_wc_id
Integer li_step_order
Integer li_ver_extract_step
Integer li_len
Integer li_rc
Integer i
integer li_wait
long ll_psufx_code
string ls_prosufx_code
String ls_file_type
String ls_file_name
String ls_no_results_message
String ls_html_search_val
String ls_content
String ls_char
string ls_form_val 
string ls_obj_pos 
string ls_obj_name 
string ls_var_name
string ls_actno 
string ls_userid
string ls_pass
String ls_value
String ls_step_action
String ls_data_from
String ls_tag
String ls_f_name
String ls_m_name
String ls_l_name
String ls_prof_suffix
String ls_ssn
String ls_reference
String ls_ref_1
String ls_ref_2
string ls_type_f
string ls_type_i
string ls_type_a
string ls_path //maha 081808
string ls_crawl_path //maha 090208

//Start Code Change ----08.18.2008 #V85 maha - added path variable to strip spaces; changed code to use the new variable
ls_crawl_path = of_strip_char(" ", is_path,"<SP>") //replace spaces //Start Code Change ----08.28.2008 #V85 maha - changed to uppercase SP
ls_path = is_path
//End Code Change---08.18.2008

ls_file_name =  is_iim_path +   "WebCrawl" + string(ai_loop) + ".iim" //for each segment a separate crawler is written //maha modified 5.15.07 to use registry setting
//ls_file_name = "C:\Program Files\InternetMacros\Macros\WebCrawl" + string(ai_loop) + ".iim" //version 4 location

li_FileNum = FileOpen(ls_file_name,  LineMode!, Write!, LockWrite!, Replace!)
		
//	debugbreak()
FOR i = ai_start TO ai_end

	if i = 1 then //if the beginning of the first segment
		FileWrite( li_FileNum, "VERSION BUILD=5220125")
		FileWrite( li_FileNum, "TAB T=1" )
		FileWrite( li_FileNum, "TAB CLOSEALLOTHERS" )
		FileWrite( li_FileNum, "SIZE X=800 Y=600" )
	end if
	
	ls_step_action = ids_steps.GetItemString( i, "step_action" )
	li_step_order = ids_steps.GetItemNumber( i, "step_order" )
	ls_obj_pos = String(ids_steps.GetItemNumber( i, "object_pos" ))
	if isnull(ls_obj_pos) then ls_obj_pos = "1"
	
	ls_content = ids_steps.GetItemString( i, "content_or_value" )
	if isnull(ls_content) then ls_content = ""
	choose case ls_content //variable used in extract of data
		case "VAR1","VAR2","VAR3"
			//debugbreak()	
			ls_var_name = "{{!" + ls_content + "}}"
	end choose
	
	ls_obj_name = ids_steps.GetItemstring( i, "object_name" )
	if isnull(ls_obj_name) then ls_obj_name = "" //040307
	ls_form_val = ids_steps.GetItemString( i, "form_handler" )
	if isnull(ls_form_val) then ls_form_val = "" //040307
	li_wait = ids_steps.GetItemnumber( i, "wait_val" )
	if li_wait > 0 then //if a wait setting write it
		ls_tag = "WAIT seconds=" + string(li_wait)
		FileWrite( li_FileNum, ls_tag  )
	end if
	
	//Start Code Change ----12.17.2007 #V8 maha  -- added here and removed duplications in the cases
	ls_type_i = ids_steps.GetItemString( i, "input_type" )
	ls_type_f = ids_steps.GetItemString( i, "form_type" )
	ls_type_a = ids_steps.GetItemString( i, "attr_type" )
			

	CHOOSE CASE ls_step_action
		CASE "Break for User Input"
			return 999
			
		CASE "Go To Web Site URL"
			FileWrite( li_FileNum, "URL GOTO=" + is_url  )			
			
		CASE "Fill In Edit Box"
			//  TAG POS=1 TYPE=INPUT:TEXT FORM=ACTION:licensetypecode.asp ATTR=NAME:License CONTENT=9107 
			ls_tag = "TAG POS=" + ls_obj_pos
			//debugbreak()
			//Start Code Change ---- 04.03.2007 #V7 maha
			
			if len (ls_type_i) < 1 or isnull(ls_type_i) then ls_type_i = "TEXT"
			if len (ls_type_f) < 1 or isnull(ls_type_f) then ls_type_f = "NAME"
			if len (ls_type_a) < 1 or isnull(ls_type_a) then ls_type_a = "NAME"
			
			ls_tag = ls_tag + " TYPE=INPUT:" + ls_type_i + " FORM=" + ls_type_f + ":" + ls_form_val
			//End Code Change---04.03.2007
//			IF POS( ls_form_val, ".asp" ) > 0 THEN  //maha 021207
//				ls_tag = ls_tag + " TYPE=INPUT:TEXT FORM=NAME:" + ls_form_val
//			elseIF POS( ls_form_val, "." ) > 0 THEN //if a dot exists set as action ; otherwise as name
//				ls_tag = ls_tag + " TYPE=INPUT:SUBMIT FORM=ACTION:" + ls_form_val
//			ELSE
//				ls_tag = ls_tag + " TYPE=INPUT:TEXT FORM=NAME:" + ls_form_val		//was submit changed to text 021306
//			END IF
			
			ls_tag = ls_tag + " ATTR=" + ls_type_a + ":" + ls_obj_name
			//Start Code Change ---- 08.08.2007 #V7 maha  moved to function
			ls_value =  of_get_data_value(  ls_content, i )
			
//			CHOOSE CASE Upper(ls_data_from)
//				CASE "VERIF REFERENCE 1"
//					ls_reference = ids_prac.getitemstring(1,"reference_value")
//					if POS( ls_reference, " -" ) = 0 then //test if reference has no dash
//						ls_value = ls_reference
//					else
//						ls_value = Mid( ls_reference, 1, POS( ls_reference, " -" ) -1 )
//					end if
//				CASE "VERIF REFERENCE 2"					
//					ls_reference = ids_prac.getitemstring(1,"reference_value")
//					ls_value = Mid( ls_reference, POS( ls_reference, "- " ) + 2, 100 )	
//				case "LAST NAME"
//					ls_value = ids_prac.getitemstring(1,"last_name")
//				case "FIRST NAME"
//					ls_value = ids_prac.getitemstring(1,"first_name")
//				case "LAST FIRST NAME"  //Start Code Change ---- 04.17.2007 #V7 maha
//					ls_value = ids_prac.getitemstring(1,"last_name") + ",<SP>" + ids_prac.getitemstring(1,"first_name")
//				case "DOB"
//					ls_value = of_format_date(ids_steps.getitemnumber(i,"format_type") ,ids_prac.getitemdatetime(1,"date_of_birth"))
//				case "SSN"
//					ls_value = ids_prac.getitemstring(1,"ssn")
//				case "ACCOUNT NUMBER"
//					ls_value = ids_wc.getitemstring(1,"web_site_account_number")
//				case "USER NAME"
//					ls_value = ids_wc.getitemstring(1,"web_site_user_id")
//				case "PASSWORD"
//					ls_value = ids_wc.getitemstring(1,"web_site_password")
//				case "NPI Number"
//					ls_value = ids_wc.getitemstring(1,"npi_number")
//				CASE ELSE					
//					ls_value = ls_data_from
//			END CHOOSE
//End Code Change---08.08.2007
			//debugbreak()
			ls_value = of_format_value( ids_steps.getitemnumber(i,"format_type"), ls_value )
			ls_value = of_spaces( ls_value)		
			
			ls_tag = ls_tag + " CONTENT=" + ls_value
			FileWrite( li_FileNum, ls_tag  )						
			
		CASE "Click Submit"									
			//TAG POS=1 TYPE=INPUT:SUBMIT FORM=ACTION:licensecode.asp ATTR=NAME:Accept&&VALUE:Accept  
			ls_tag = "TAG POS=" + ls_obj_pos
			
			if len (ls_type_i) < 1 or isnull(ls_type_i) then ls_type_i = "SUBMIT"
			if len (ls_type_f) < 1 or isnull(ls_type_f)  then ls_type_f = "NAME"
			if len (ls_type_a) < 1 or isnull(ls_type_a) then ls_type_a = "NAME"
			
			ls_tag = ls_tag + " TYPE=INPUT:" + ls_type_i + " FORM=" + ls_type_f + ":" + ls_form_val
		//	ls_tag = ls_tag + " TYPE=INPUT:SUBMIT FORM=" + ls_type_f + ":" + ls_form_val
//			IF POS( ls_form_val, ".asp" ) > 0 THEN  //maha 021207
//				ls_tag = ls_tag + " TYPE=INPUT:SUBMIT FORM=NAME:" + ls_form_val
//			elseIF POS( ls_form_val, "." ) > 0 THEN //if a dot exists set as action ; otherwise as name
//				ls_tag = ls_tag + " TYPE=INPUT:SUBMIT FORM=ACTION:" + ls_form_val
//			ELSE
//				ls_tag = ls_tag + " TYPE=INPUT:SUBMIT FORM=NAME:" + ls_form_val				
//			END IF
			
			ls_value = ls_content
			
			ls_value = of_spaces( ls_value)		
						 
			ls_tag = ls_tag + " ATTR=" + ls_type_a  + ":" + ls_obj_name + "&&" + "VALUE:" + ls_value
			ids_steps.SetItem( i, "notes", ls_tag )
			FileWrite( li_FileNum, ls_tag  )	
			IF ids_steps.GetItemNumber( i, "no_data_found_check" ) = 1 THEN			
				//lb_check_for_no_results = True
				is_no_results_message = Upper(ids_steps.GetItemString( i, "no_data_found_text" ))
			END IF
//			IF ids_steps.GetItemNumber( i, "search_opens_seperate_win" ) = 1 THEN removed 5-16-07 maha
//				FileWrite( li_FileNum,  "TAB CLOSE"  )	
//			END IF
		CASE	"Click on Image Submit" //maha 02.13.07 //created for 'board certified docs'  crawler
			if len (ls_type_a) < 1 or isnull(ls_type_a) then ls_type_a = "NAME"
			ls_tag = "TAG TYPE=INPUT:IMAGE FORM=NAME:"  + ls_form_val 
			ls_tag = ls_tag + " ATTR=" + ls_type_a +  ":" + ls_obj_name + "&&VALUE:" + ls_content //maha 50207
			FileWrite( li_FileNum, ls_tag  )
			
		CASE "Click Other"
			ls_tag = "TAG POS=" + ls_obj_pos
			ls_tag = ls_tag + " TYPE=" + ids_steps.GetItemString( i, "input_type" )
			ls_type_a = ids_steps.GetItemString( i, "attr_type" )		
			ls_type_i = ids_steps.GetItemString( i, "input_type" )		
			ls_type_f = ids_steps.GetItemString( i, "form_type" )
			
			if len (ls_type_i) > 0  then
				ls_tag = ls_tag + "TYPE=" + ls_type_i
			end if
			if len (ls_type_a) >0 then
				ls_tag = ls_tag + " ATTR=" + ls_type_a +  ":"
			end if
			
			//if len (ls_type_i) < 1 or isnull(ls_type_i) then

			//ls_tag = ls_tag + " ATTR=" +  ls_obj_name
			FileWrite( li_FileNum, ls_tag  )
		
		CASE "Click Other Data Link"  //Start Code Change ---- 08.08.2007 #V7 maha
			debugbreak()
			ls_tag = "TAG POS=" + ls_obj_pos
			if len (ls_type_i) >0 then
				ls_tag = ls_tag + " TYPE=" + ls_type_i
			end if
			if len (ls_type_a) < 1 or isnull(ls_type_a) then ls_type_a = "NAME"
			if len (ls_content) > 0  then
				ls_data_from = of_get_data_value( ls_content, i)
				ls_tag = ls_tag + " ATTR=" + ls_type_a +  ":" +  ls_data_from
			end if
			FileWrite( li_FileNum, ls_tag  )
		CASE "Link Using Extracted Value"  //Start Code Change ---- 08.08.2007 #V7 maha
			debugbreak()
			ls_tag = "TAG POS=" + ls_obj_pos
			if len (ls_type_i) >0 then
				ls_tag = ls_tag + " TYPE=" + ls_type_i
			end if
			if len (ls_type_a) < 1 or isnull(ls_type_a) then ls_type_a = "NAME"
			if len (ls_content) > 0  then
				ls_data_from = of_get_data_value( ls_content, i)
				ls_tag = ls_tag + " ATTR=" + ls_type_a +  ":" +  ls_data_from
			end if
			if ids_steps.GetItemString( i, "macro_extract_tag") = "*" then
				ls_tag = ls_tag + "*"
			end if
			FileWrite( li_FileNum, ls_tag  )
			
		CASE "Error on Site"
			ls_tag =  ls_obj_name
			FileWrite( li_FileNum, ls_tag  )		
	
		CASE "Extract Single Piece Of Data"
			ls_tag = "EXTRACT POS=" + ls_obj_pos  //extract tag
			ls_tag = ls_tag + " TYPE=TXT ATTR=" +  ls_form_val	
			FileWrite( li_FileNum, ls_tag  )
			ls_tag = "SET !" + ls_content +  " {{!EXTRACT}} "  //set variable from extracted value
			FileWrite( li_FileNum, ls_tag  )
			
		CASE "Extract Verification Result"	//rewritten maha 04-02-2007
			ib_verif_ext = True
			is_verif_search_val = ids_steps.GetItemString( i, "macro_extract_tag" )
//			ls_tag = "EXTRACT POS=" + ls_obj_pos  //extract tag
//			ls_tag = ls_tag + " TYPE=TXT ATTR=" +  is_verif_search_val
//			FileWrite( li_FileNum, ls_tag  )
//			ls_tag = "SET !" + ls_content +  " {{!EXTRACT}} "  //set variable from extracted value
//			FileWrite( li_FileNum, ls_tag  )
//			ls_tag = "SAVEAS TYPE=EXTRACT FOLDER=" + is_path + " FILE=*"  //extract.csv
//			ii_resp_step = i
//			FileWrite( li_FileNum, ls_tag  )
			
		CASE "Select From List Box" , "Select From Drop Down" //Start Code Change ----12.17.2007 #V8 maha  added drop down
			//TAG POS=1 TYPE=SELECT FORM=ACTION:http://www.nysed.gov/COMS/OP001/OPSCR2 ATTR=NAME:profcd CONTENT=$Mental<SP>Health<SP>Counselor						
			ls_tag = "TAG POS=" + ls_obj_pos
			
			if len (ls_type_f) < 1 or isnull(ls_type_f)  then ls_type_f = "NAME"
			//Start Code Change ---- 11.26.2007 #V7 maha
			if len (ls_type_a) < 1 or isnull(ls_type_a) then ls_type_a = "NAME"
			ls_tag = ls_tag + " TYPE=SELECT FORM=" + ls_type_f + ":" + ls_form_val			
			//ls_tag = ls_tag + " ATTR=NAME:" + ls_obj_name
			ls_tag = ls_tag + " ATTR=" + ls_type_a + ":" + ls_obj_name
			//End Code Change---11.26.2007
						
			ls_content = ls_content
			ls_prof_suffix = ids_prac.getitemstring(1,"prof_suffix")
			ll_psufx_code = ids_prac.getitemnumber(1,"prof_suffix_code")
			ls_prosufx_code = string(ll_psufx_code)
			li_wc_id = ids_steps.GetItemNumber( i, "wc_id" )
			li_step_order = ids_steps.GetItemNumber( i, "step_order" )

			IF ls_content = "Professional Suffix" THEN
				ls_content = ""
				IF ids_steps.GetItemNumber( i, "web_data_comparison_yes_no" ) = 1 THEN
					//messagebox("", ls_prof_suffix)
					SELECT wc_web_data_comparison.web_site_data  
					INTO :ls_content
					FROM wc_web_data_comparison  
					WHERE ( wc_web_data_comparison.wc_id = :li_wc_id ) AND  
				         ( wc_web_data_comparison.step_order = :li_step_order ) AND  
				         ( wc_web_data_comparison.intellicred_data = :ls_prosufx_code  )  ;
					IF SQLCA.SQLCODE = -1 THEN
						MessageBox( "SQL Error", SQLCA.SQLERRTEXT )
						RETURN -1
					END IF
					IF ls_content = "" THEN
						MessageBox( "No Data", "There is no Value mapped for the physicians Professional Suffix for: "  + ls_prof_suffix + " for selecting the Profession on the Website.  Go to Web Crawler Setyp Utility to correct.")
						Return -1
					END IF
				ELSE
					ls_content = ls_prof_suffix
				END IF
			END IF
			
			ls_content = of_format_value( ids_steps.getitemnumber(i,"format_type"), ls_content  ) //add $ if set
			ls_content = of_spaces( ls_content)
			
			ls_tag = ls_tag + " CONTENT=" + ls_content
			FileWrite( li_FileNum, ls_tag  )	
			
//		CASE "Select From Drop Down"//Start Code Change ----12.17.2007 #V8 maha -- removed trap
//			messagebox("Crawl Setup error", "There is no code for processing " + ls_step_action)
//			return -1
		CASE "Select From Check Box"
			messagebox("Crawl Setup error", "There is no code for processing " + ls_step_action)
			return -1
		CASE "Select From Radio Button"			//maha last mod 12.17.07
			ls_tag = "TAG POS=" + ls_obj_pos
			if len (ls_type_i) < 1 or isnull(ls_type_i) then ls_type_i = "RADIO"
			if len (ls_type_f) < 1 or isnull(ls_type_f) then ls_type_f = "NAME"
			if len (ls_type_a) < 1 or isnull(ls_type_a) then ls_type_a = "NAME"
			ls_tag = ls_tag + " TYPE=INPUT:" + ls_type_i + ":" + " FORM=" + ls_type_f + ":" +  ls_form_val	+ " ATTR=" + ls_type_a + ":" + ls_obj_name + "&&VALUE:" + ls_content
			FileWrite( li_FileNum, ls_tag  )
		CASE "Select From Table List"			
			messagebox("Crawl Setup error", "There is no code for processing " + ls_step_action)
			return -1
		CASE	"Click on Image Hyperlink"
			if ls_form_val = "URL" then ls_form_val = is_url //maha41607
			ls_tag = "TAG TYPE=IMG ATTR=TXT:" + ls_form_val  + ls_obj_name
			FileWrite( li_FileNum, ls_tag  )

		CASE	"Click on Hyperlink" //maha 02.06.07
			ls_tag = "TAG POS=" + ls_obj_pos
			if len (ls_type_a) < 1 or isnull(ls_type_a) then ls_type_a = "NAME"
			ls_tag = "TAG TYPE=A ATTR=" + ls_type_a + ":" + ls_obj_name
			FileWrite( li_FileNum, ls_tag  )

		CASE	"Click on Variable Link" //maha 02.13.07
			ls_tag = "TAG TYPE=A ATTR=TXT:" + ls_var_name
			//messagebox("",ls_tag)
			FileWrite( li_FileNum, ls_tag  )
			
		CASE "Save Page as Image"	
			debugbreak()
			ls_file_type = "bmp"
			ii_type = 4
			ib_image_saved = True
			is_saved_file = ls_path + "_ResultPage.bmp"
			ls_tag = "SAVEAS TYPE=BMP FOLDER=" + ls_crawl_path + " FILE=_ResultPage.bmp"
			FileWrite( li_FileNum, ls_tag  )								
			ls_tag = "SAVEAS TYPE=HTM FOLDER=" + ls_crawl_path + " FILE=_ResultPage.htm"
			FileWrite( li_FileNum, ls_tag  )			
		CASE "Save PDF File"     	
			ls_file_type = "pdf"
			ii_type = 2
			ib_image_saved = True
			is_saved_file = ls_path + "_ResultPage.pdf"
			//ls_tag = "ONDOWNLOAD FOLDER=FOLDER=" + ls_path + " FILE=_ResultPage"
			ls_tag = "ONDOWNLOAD FOLDER=" + ls_crawl_path + " FILE=_ResultPage"
			FileWrite( li_FileNum, ls_tag  )
			ls_tag = "SAVEAS TYPE=HTM FOLDER=" + ls_crawl_path + " FILE=_ResultPage.htm"
			FileWrite( li_FileNum, ls_tag  )
			ls_tag = "SAVEITEM"           			
			FileWrite( li_FileNum, ls_tag  )	
		CASE "Save Page as HTML"						
			ls_file_type = "htm"
			ii_type = 3
			ib_image_saved = True
			is_saved_file = ls_path + "_ResultPage.htm"
			ls_tag = "SAVEAS TYPE=HTM FOLDER=" + ls_crawl_path + " FILE=_ResultPage.htm"
			FileWrite( li_FileNum, ls_tag  )
			
		CASE "Hard Coded Tag" //Start Code Change ----12.03.2008 #V8 maha -- added to simplify step building; just copy the line from the record to the object name field
			ls_tag = ls_obj_name
			FileWrite( li_FileNum, ls_tag  )
		CASE else
			messagebox("Crawler ERROR","this crawler is designed using a Step Type '" + ls_step_action + "'.  This version of IntelliCred is not coded to use this step type and will not run properly.  Please upgrade your version of the program to run this Crawler.")
			return -1
			
	END CHOOSE
	//End Code Change---12.17.2007

	if ids_steps.GetItemNumber( i, "search_opens_seperate_win" ) = 1 then //open separate window
		FileWrite( li_FileNum, "TAB T=2" )	
	end if
	
	if i = ai_end then
		if ids_steps.GetItemNumber( i, "no_data_found_check" ) = 1 then //to process a check, the file must be saved
			ls_tag = "SAVEAS TYPE=HTM FOLDER=" + ls_crawl_path + " FILE=_ResultPage.htm"
			FileWrite( li_FileNum, ls_tag  )
		end if
	end if



END FOR
//end if crawler creation

ids_steps.Update( )

FileClose( li_filenum )

return 1
end function

public function string of_spaces (string as_val);string ls_value
string ls_char

integer li_len
integer c

ls_value = as_val
//Start Code Change ----12.04.2008 #V85 maha - modifed to use of_strip_char;  function as written did not handle multiple spaces well
ls_value = of_strip_char(" ", ls_value,"<SP>")

//li_len = Len( as_val )
//
//FOR c = 1 TO li_len			
//	ls_char = Mid( ls_value, c, 1 )
//	IF ls_char = " " THEN
//		ls_value = Mid( ls_value, 1, c -1 ) + "<SP>" + Mid( ls_value, c + 1, 1000 )
//	END IF
//END FOR	
//End Code Change---12.04.2008

return ls_value

end function

public function long of_image_save (string as_doc_id, integer ai_update);//Start Code Change ---- 02.21.2007 #V7 maha added function called from of_crawl_new

long ll_new_pos
long ll_filelen
integer li_filenum
integer li_loops
integer li_counter
long ll_bytes_read
blob blob_temp
blob lb_tot_b
blob total_blob
blob blank_blob
blob lb_verif_picture

//Put image into db
//	ll_filelen = FileLength( ls_path + "_ResultPage." + ls_file_type ) 
ll_filelen = FileLength( is_saved_file ) 

//messagebox("file",  ls_saved_file )

li_filenum = FileOpen(is_saved_file, StreamMode!,READ!,LOCKREAD!)
IF li_filenum <> -1 THEN	
	if isvalid(w_infodisp) then w_infodisp.st_1.text = "Reading file"
	//Determine how many FileReads will be necessary to read all of the file ... 
	
	//You can't read in more than 32K at a time 
	IF ll_filelen > 32765 THEN 
  			IF Mod(ll_filelen,32765) = 0 THEN 
   		  	   li_loops = ll_filelen/32765 
		 ELSE 
  				   li_loops = (ll_filelen/32765) + 1 
   	 	 END IF 
	ELSE 
  			 li_loops = 1 
	END IF 
		//read the file ... 
	FOR li_counter = 1 to li_loops 
  		 ll_bytes_read = FileRead( li_filenum, blob_temp) 
		 IF ll_bytes_read = -1 THEN
			MessageBox("Error", "Error with FileRead command.  Return -1." )
			Return -1
		 END IF
    lb_tot_b = lb_tot_b + blob_temp 
  		 ll_new_pos = ll_new_pos + ll_bytes_read 
   	 FileSeek(li_filenum, ll_new_pos, FROMBEGINNING!) 

  		 if len(lb_tot_b) > 1000000 then 
   	     total_blob = total_blob + lb_tot_b 
  	   	  lb_tot_b = blank_blob 
	    end if 
	NEXT 
		total_blob = total_blob + lb_tot_b 

	lb_verif_picture = total_blob
		FileClose(li_filenum) 
	
	if isvalid(w_infodisp) then w_infodisp.st_1.text = "Saving image to database (may take a few moments)"
	//messagebox("blob length", len( total_blob) )
	if ai_update = 1 then
		UPDATEBLOB verif_info
		SET verification_picture = :lb_verif_picture
		WHERE doc_id = :as_doc_id
		USING SQLCA;
		IF SQLCA.SQLCODE = -1 THEN
			MessageBox("Error", SQLCA.SQLERRTEXT )
			Return -1
		END IF
	//	messagebox("type", ii_type)
		UPDATE verif_info
		SET verification_picture_flag = :ii_type
		WHERE doc_id = :as_doc_id
		USING SQLCA;	
		IF SQLCA.SQLCODE = -1 THEN
			MessageBox("Error", SQLCA.SQLERRTEXT )
			Return -1
		END IF		
	end if
ELSE
	MessageBox("Web Crawler - of_save_image", "File Open Error.  Could not open " + is_saved_file + " for StreamMode!" )
	Return -1
END IF

IF SQLCA.SQLNRows > 0 THEN
	COMMIT USING SQLCA ;
ELSEIF SQLCA.SQLCODE = -1 THEN
	MessageBox( "SQL ERROR", SQLCA.SQLERRTEXT )
	Return -1
ELSEIF SQLCA.SQLNRows = 0 THEN	
	MessageBox( "SQL Error", "No rows effected." )
END IF


return 1
end function

public function string of_format_value (integer ai_type, string as_value);string ls_ret

ls_ret = as_value

choose case ai_type
	case 1 //strip to number
		ls_ret = of_strip_char("",ls_ret,"@NUM@")
	case 2,3,4  //date part formats from of_format_date
		//do nothing
	case 6
		ls_ret = "$" + as_value
	case 7
		//Last,<SP>First
		
end choose




return ls_ret
end function

public function string of_format_date (integer ai_type, datetime adt_date);//Start Code Change ---- 02.22.2007 #V7 maha
// get date part - of_date_to_string function in intelicred.pbl
string s

choose case ai_type
	case 2 //day
		s = of_date_to_string(adt_date,"dd")
	case 3 //month
		s = of_date_to_string(adt_date,"mm")
	case 4 //year
		s = of_date_to_string(adt_date,"yyyy")
	case 5 //mmddyyy
		s = of_date_to_string(adt_date,"mm/dd/yyyy")
end choose

return s
end function

public function string of_crawl_new (integer ai_wc_id, long al_prac_id, string as_doc_id, boolean ab_show_crawler);//Start Code Change ---- 02.20.2007 #V7 maha created to replace of_crawl

Boolean lb_image_saved = False
Boolean lb_extract_verif_result = False
Boolean 	lb_check_for_no_results = False
Long fh
Long ll_retval  // -100 = no data found page came up  -200 = macro error
Long ll_rec_id
Long ll_verif_response_cd = 0
Long ll_filelen
Long ll_bytes_read
Long ll_new_pos 
Long ll_cnt
String ls_sql
String ls_file_type
String ls_no_results_message
String ls_ic_ver_cd
String ls_ic_vef_cd
String ls_response_code
String ls_html_search_val
String ls_line
String ls_web_site_data
String ls_content
String ls_char
String ls_value
String ls_step_action
String ls_data_from
String ls_url
String ls_tag
String ls_f_name
String ls_m_name
String ls_l_name
String ls_prof_suffix
String ls_ssn
String ls_reference
String ls_ref_1
String ls_ref_2
string ls_crawl_name
string ls_form_val //maha020607
string ls_obj_pos //maha020607
string ls_obj_name //maha020607
string ls_var_name
string ls_actno 
string ls_userid
string ls_crawler
string ls_extract
string ls_message
integer li_type //012907
Integer li_filenum
Integer li_loops
Integer li_counter 
Integer li_retval
Integer li_result
Integer c
integer cnt
integer li_wc_loops[]
integer li_wc_start[]
integer li_wc_end[]
Integer li_found_pos
Integer li_step_order
Integer li_ver_extract_step
Integer li_len
Integer li_rc
Integer i
Integer li_FileNum2
integer f
integer li_stop
integer li_break
integer li_key_test
OLEObject myoleobject
DateTime ldt_exp_dt
DateTime ldt_dob
n_ds lds_steps
n_ds lds_web_verif_rsp_mapping

is_path = gs_dir_path + gs_DefDirName + "\" //maha111605
//maha 111605 modifed from storing directly on the gs_dir_path which typically is C:\ 
FileDelete( is_path + "_ResultPage.htm" )
FileDelete( is_path + "_ResultPage.bmp" )
FileDelete( is_path + "_ResultPage.pdf" )
FileDelete( is_path + "extract.csv" )
ii_resp_step = 0

//Start Code Change ---- 5.15.2007 #V7 maha modified  to use registry setting
li_key_test = RegistryGet( "HKEY_LOCAL_MACHINE\SOFTWARE\IIM\", "PathBasic", RegString!, is_iim_path)
IF IsNull(is_iim_path)  or li_key_test = -1 THEN  //if key does not exist returns -1
	is_iim_path = "C:\Program Files\IMacros\Macros\"  //Start Code Change ---- 08.07.2007 #V7 maha  changed from internet macros
	//messagebox("li_key_test",li_key_test)
else
	is_iim_path = is_iim_path + "\Macros\"
END IF

if gi_test_mode = 1 then
	messagebox("is_iim_path",is_iim_path)
end if
//End Code Change---05.15.2007

ids_prac = CREATE n_ds
ids_prac.dataobject = "d_wc_prac_verif_info"
ids_prac.settransobject(sqlca)

ids_wc = CREATE n_ds
ids_wc.dataobject = "d_wc_header"
ids_wc.settransobject(sqlca)

if as_doc_id = "x-x-x-x" then
	ib_test = true
	//skip as test
else
	c = ids_prac.retrieve(as_doc_id) //get prac data
	if c < 1 then
		MessageBox( "Web Crawler Error", "Error retrieving practitioner data for verification record " + as_doc_id )
		RETURN "-10*"
	END IF
end if

c = ids_wc.retrieve(ai_wc_id ) //get crawler data
if c < 1 then
	MessageBox( "Web Crawler Error", "Error retrieving Web Crawler data for Crawler " + string(ai_wc_id ))
	RETURN "-20*"
END IF

ls_crawler = ids_wc.getitemstring(1,"wc_description")

if ids_wc.getitemnumber(1,"pw_rqd") = 1 then
	if len(ids_wc.getitemstring(1,"web_site_password")) < 1 or isnull(ids_wc.getitemstring(1,"web_site_password")) then
		messagebox(ls_crawler,"This Crawler requires a password.  Please set this up in the Web Crawler Painter.")
		RETURN "-30*"
	end if
end if

is_url = ids_wc.getitemstring(1,"wc_web_address")

IF Upper( Mid( is_url, 1, 4 ))  <> "HTTP" THEN
	is_url = "HTTP://" + is_url
END IF

ids_steps = CREATE n_ds
ids_steps.DataObject = "d_wc_steps_browse"
ids_steps.of_SetTransObject( SQLCA )
ids_steps.Retrieve( ai_wc_id )
li_rc = ids_steps.RowCount( )

if li_rc < 1 then
	MessageBox( "Web Crawler Error", "Error retrieving crawler steps for crawler "  + string(ai_wc_id ))
	RETURN "-40*"
END IF

cnt = 1//number of segments
li_wc_start[1] = 1

for c = 1 to li_rc //find out how many times you need to trap
	
	if ids_steps.getitemnumber(c,"no_data_found_check") = 1  or ids_steps.GetItemString( c, "step_action" )  = "Break for User Input" then
		if ids_steps.GetItemString( c, "step_action" )  = "Break for User Input" then ab_show_crawler =  true //maha 05.14.07
		li_wc_end[cnt] = c
		if c < li_rc then //if not the last step create a new start
			cnt++
			li_wc_start[cnt] = c + 1
		end if
	end if
	if c = li_rc then li_wc_end[cnt] = c //if the last row, set the last end
next
			


//create crawl segments	
for c = 1 to cnt
	ib_image_saved = false
	ib_verif_ext = false
	li_retval = of_build_crawl( li_wc_start[c],li_wc_end[c], c)
	if li_retval < 1 then
		return "-901*"
	elseif li_retval = 999 then //break for user input
//		if not isvalid(myoleobject) then
//			myoleobject = CREATE OLEObjec
		ls_message = ids_steps.getitemstring(li_wc_end[c],"no_data_found_text")
		li_break = openwithparm(w_wc_site_input,ls_message)
		//w_wc_site_input.st_mess.text = ids_steps.getitemstring(li_wc_end[c],"no_data_found_text")
		 if li_break = 0 then
			li_stop = 1  //on cancel drop out of crawl loop
			exit
		else //= 1 continue
			continue
		end if
	end if
	ls_crawl_name = "WebCrawl" +string(c)

	if c = 1 then //create imacro object only if first loop
		//OLEObject myoleobject //Start Code Change ---- 05.14.2007 #V7 maha moved to declarations
		myoleobject = CREATE OLEObject
		li_result = myoleobject.ConnectToNewObject(  "InternetMacros.iim")
		IF li_result < 0 THEN
				messagebox("of_Crawl failure","Failed to connect to InternetMacros.iim.  Check installation.")
				Return "- 902*"
				exit
		END IF
		IF ab_show_crawler THEN
			myoleobject.iimInit() 
		ELSE
			myoleobject.iimInit("-tray")		
		END IF		
	end if
	

	//Run the web crawl
	li_result = myoleobject.iimPlay (ls_crawl_name)
	IF li_result < 0 THEN
		messagebox("of_Crawl failure","iimplay failed")
		myoleobject.iimExit()
		Return "- 903*"
		exit
//		IF NOT ab_show_crawler THEN
//			myoleobject.iimExit() 
//		END IF		
	END IF

//if check for no results	
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	if ids_steps.getitemnumber(li_wc_end[c],"no_data_found_check") = 1  or ib_verif_ext then
		if ids_steps.getitemnumber(li_wc_end[c],"no_data_found_check") = 1 then //41907
			lb_check_for_no_results =  true
			ls_no_results_message = ids_steps.getitemstring(li_wc_end[c],"no_data_found_text") //41907
		end if
		
	// htm must be saved before it can be tested for 'no results'
		//messagebox("","wait")
		if not fileexists( is_path + "_ResultPage.htm" ) then //check to see if file was created
			messagebox("Crawl Error",  is_path + "_ResultPage.htm" + " file does not exist.")
			myoleobject.iimExit() //maha 05.17.07
			return "-904*" //maha
			exit
		end if
		li_filenum2 = FileOpen(is_path + "_ResultPage.htm" , StreamMode!) //41907
		ls_no_results_message = Upper( ls_no_results_message )	//41907
		long filerows
		filerows = FileRead( li_filenum2, ls_line )
		
		DO WHILE  filerows >= 0  //subsequent reads are done at the end of the loop

		//DO WHILE  FileRead( li_filenum2, ls_line ) >=  0
			ls_line = Upper( ls_line)
			//check for no results
			IF lb_check_for_no_results THEN
				//messagebox("",ls_no_results_message )
				li_found_pos = POS( ls_line, ls_no_results_message )
				IF li_found_pos > 0 THEN
					//messagebox("found", ls_no_results_message)
					//myoleobject.DisconnectObject()
					ib_image_saved = true
					is_saved_file = is_path + "_ResultPage.htm"
					li_stop = 1
					ll_retval = 3
					ii_type = 3
					EXIT //do loop
					//EXIT //for loop
				END IF
			END IF
			IF ib_verif_ext THEN  //find the value on the page
			
//				//openwithparm(w_sql_msg,ls_line)
				li_found_pos = POS( ls_line, is_verif_search_val )
				IF li_found_pos > 0 THEN
					ls_extract = mid(ls_line, li_found_pos + len(is_verif_search_val ) , 50 )
					f = pos(ls_extract,"<",1)
					if f > 0 then
						ls_extract = trim(mid (ls_extract,1,f -1))
					end if
					ll_retval = of_verif_response( ai_wc_id ,ii_resp_step, ls_extract)
					EXIT

				ELSE
					debugbreak()
					//messagebox("not found",is_verif_search_val)
				END IF //pos found
			End if //verif extract
			
			filerows = FileRead( li_filenum2, ls_line ) //read next line
			
		LOOP	
		FileClose( li_filenum2 )		
		FileClose( li_filenum )

	END IF
	
	IF ib_image_saved THEN
		of_image_save( as_doc_id,1 )
		ib_image_saved = false
	END IF	
	
	if ib_verif_ext then
		
	end if
		
	if li_stop = 1 then exit //41907 drop out of loop if 'not found'	
	
NEXT


IF ll_verif_response_cd = 0 and  ll_retval <> 3 THEN //41907
	ll_retval = 1
END IF


//myoleobject.DisconnectObject()	
myoleobject.iimExit() 


DESTROY ids_prac
DESTROY ids_wc
DESTROY ids_steps

Return string(ll_retval) + "*" + string(ii_type)

end function

public function long of_verif_response (integer ai_wcid, integer ai_step, string as_extract);//Start Code Change ---- 04.03.2007 #V7 maha
//new function for getting the response code
long ll_retval = 0
integer li_rc
integer li_filenum
string ls_data
integer f
n_ds lds_web_verif_rsp_mapping


//if not fileexists( is_path + "extract.csv" ) then //check to see if file was created
//	messagebox("Crawl Error",  is_path + "extract.csv" + " file does not exist for getting Response code.")
//end if
////debugbreak()
//li_filenum = FileOpen( is_path + "extract.csv", LineMode!)
//fileread(li_filenum,ls_data)
ls_data = as_extract //this is is_verif_search_val

//messagebox ("extract value",ls_data)
//if ls_data = "#EANF#" then  //vALUE NOT FOUND
//	return 0
//end if

lds_web_verif_rsp_mapping = CREATE n_ds
lds_web_verif_rsp_mapping.DataObject = "d_wc_verif_comparison_ext"
lds_web_verif_rsp_mapping.of_SetTransObject( SQLCA )
lds_web_verif_rsp_mapping.Retrieve( ai_wcid, ai_step)	
//Note: retrieval will fail (0) if string contains characters like < / or ;
li_rc = lds_web_verif_rsp_mapping.RowCount( )

f = lds_web_verif_rsp_mapping.find( "field = '" + ls_data + "'"    , 1,li_rc)
if f > 0 then
	ll_retval = long(lds_web_verif_rsp_mapping.getitemstring(1,'verif_response_code_value'))
else
	ll_retval = 0
end if


return ll_retval


					
					
	
end function

public function string of_get_data_value (string as_data, long al_step);//Start Code Change ---- 08.08.2007 #V7 maha Added.  Called from of_build_crawl()
string ls_value
string ls_reference
string ls_data_from
long i
datetime ldt_date

ls_data_from = as_data
i = al_step

if ib_test = true then //Start Code Change ---- 12.03.2007 #V7 maha added for testing
	CHOOSE CASE Upper(ls_data_from)
	CASE "VERIF REFERENCE 1"
		ls_value = "REF1"
	CASE "VERIF REFERENCE 2"					
		ls_value = "REF2"
	case "LAST NAME"
		ls_value ="last_name"
	case "FIRST NAME"
		ls_value ="first_name"
	case "LAST FIRST NAME"  //Start Code Change ---- 04.17.2007 #V7 maha
		ls_value = "last_name" + ",<SP>" + "first_name"
	case "DOB"
		ldt_date = datetime(today(),now())
		ls_value = of_format_date(ids_steps.getitemnumber(i,"format_type") ,ldt_date)
	case "SSN"
		ls_value = "1234567890"
	case "ACCOUNT NUMBER"
		ls_value = ids_wc.getitemstring(1,"web_site_account_number")
	case "USER NAME"
		ls_value = ids_wc.getitemstring(1,"web_site_user_id")
	case "PASSWORD"
		ls_value = ids_wc.getitemstring(1,"web_site_password")
	case "NPI Number"
		ls_value = ids_wc.getitemstring(1,"npi_number")
	case "VAR1","VAR2","VAR3"
			ls_value = "{{!" + ls_data_from + "}}"
	CASE ELSE					
		ls_value = ls_data_from
END CHOOSE
return ls_value
end if
	

CHOOSE CASE Upper(ls_data_from)
	CASE "VERIF REFERENCE 1"
		ls_reference = ids_prac.getitemstring(1,"reference_value")
		if POS( ls_reference, " -" ) = 0 then //test if reference has no dash
			ls_value = ls_reference
		else
			ls_value = Mid( ls_reference, 1, POS( ls_reference, " -" ) -1 )
		end if
	CASE "VERIF REFERENCE 2"					
		ls_reference = ids_prac.getitemstring(1,"reference_value")
		ls_value = Mid( ls_reference, POS( ls_reference, "- " ) + 2, 100 )	
	case "LAST NAME"
		ls_value = ids_prac.getitemstring(1,"last_name")
	case "FIRST NAME"
		ls_value = ids_prac.getitemstring(1,"first_name")
	case "LAST FIRST NAME"  //Start Code Change ---- 04.17.2007 #V7 maha
		ls_value = ids_prac.getitemstring(1,"last_name") + ",<SP>" + ids_prac.getitemstring(1,"first_name")
	case "DOB"
		ls_value = of_format_date(ids_steps.getitemnumber(i,"format_type") ,ids_prac.getitemdatetime(1,"date_of_birth"))
	case "SSN"
		ls_value = ids_prac.getitemstring(1,"ssn")
	case "ACCOUNT NUMBER"
		ls_value = ids_wc.getitemstring(1,"web_site_account_number")
	case "USER NAME"
		ls_value = ids_wc.getitemstring(1,"web_site_user_id")
	case "PASSWORD"
		ls_value = ids_wc.getitemstring(1,"web_site_password")
	case "NPI Number"
		ls_value = ids_wc.getitemstring(1,"npi_number")
	case "VAR1","VAR2","VAR3" //Start Code Change ----12.06.2007 #V8 maha
			ls_value = "{{!" + ls_data_from + "}}"
	CASE ELSE					
		ls_value = ls_data_from
END CHOOSE

return ls_value
end function

on nvo_web_crawler_engine.create
call super::create
TriggerEvent( this, "constructor" )
end on

on nvo_web_crawler_engine.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

