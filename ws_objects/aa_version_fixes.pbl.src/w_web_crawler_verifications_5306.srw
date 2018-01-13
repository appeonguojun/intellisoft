$PBExportHeader$w_web_crawler_verifications_5306.srw
forward
global type w_web_crawler_verifications_5306 from w_response
end type
type cb_capture from commandbutton within w_web_crawler_verifications_5306
end type
type cb_help from commandbutton within w_web_crawler_verifications_5306
end type
type cbx_ama from checkbox within w_web_crawler_verifications_5306
end type
type cbx_show from checkbox within w_web_crawler_verifications_5306
end type
type ole_image from olecustomcontrol within w_web_crawler_verifications_5306
end type
type cb_save from commandbutton within w_web_crawler_verifications_5306
end type
type cb_close from commandbutton within w_web_crawler_verifications_5306
end type
type st_1 from statictext within w_web_crawler_verifications_5306
end type
type cb_print from commandbutton within w_web_crawler_verifications_5306
end type
type cb_verify from commandbutton within w_web_crawler_verifications_5306
end type
type hpb_1 from hprogressbar within w_web_crawler_verifications_5306
end type
type gb_1 from groupbox within w_web_crawler_verifications_5306
end type
type dw_verif_list from u_dw within w_web_crawler_verifications_5306
end type
type ole_browser from olecustomcontrol within w_web_crawler_verifications_5306
end type
type dw_ama from u_dw within w_web_crawler_verifications_5306
end type
end forward

global type w_web_crawler_verifications_5306 from w_response
integer x = 214
integer y = 221
integer width = 3529
integer height = 2280
string title = "Web Crawler"
boolean controlmenu = false
cb_capture cb_capture
cb_help cb_help
cbx_ama cbx_ama
cbx_show cbx_show
ole_image ole_image
cb_save cb_save
cb_close cb_close
st_1 st_1
cb_print cb_print
cb_verify cb_verify
hpb_1 hpb_1
gb_1 gb_1
dw_verif_list dw_verif_list
ole_browser ole_browser
dw_ama dw_ama
end type
global w_web_crawler_verifications_5306 w_web_crawler_verifications_5306

type variables
Long il_prac_id[]
Integer ii_facility_id[]
Integer il_current_row = 0
String ls_current_print_object = "Ver Data"
Boolean ib_cancel = False


end variables

forward prototypes
public function integer of_get_image (string as_doc_id)
end prototypes

public function integer of_get_image (string as_doc_id);Long li_filenum
Long ll_filelen
Long ll_bytes_written
Long ll_new_pos
Integer li_loops
Integer li_counter
Integer li_retval
Blob  lb_verif_picture
Blob blob_temp
Blob lb_tot_b
Blob total_blob
Blob blank_blob

debugbreak()

//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 08.19.2006 By: LeiWei
//$<reason> Fix a defect.
/*
SELECTBLOB verification_picture
INTO :lb_verif_picture
FROM verif_info
WHERE doc_id = :as_doc_id
USING SQLCA;
*/
IF appeongetclienttype() = 'PB' AND gs_dbtype = 'SQL' THEN
	of_get_image_verif_info(as_doc_id, lb_verif_picture)
ELSE
	SELECTBLOB verification_picture
	INTO :lb_verif_picture
	FROM verif_info
	WHERE doc_id = :as_doc_id
	USING SQLCA;
END IF
//---------------------------- APPEON END ----------------------------

IF SQLCA.SQLCODE = -1 THEN
	MessageBox( "SQL ERROR", SQLCA.SQLERRTEXT )
	Return -1
END IF

//tab_1.tabpage_preview.p_1.SetPicture( lb_verif_picture )

ll_filelen = Len( lb_verif_picture )



IF ll_filelen > 32765 THEN 
  	 IF Mod(ll_filelen,32765) = 0 THEN 
        li_loops = ll_filelen/32765 
    ELSE 
  	     li_loops = (ll_filelen/32765) + 1 
    END IF 
ELSE 
  	 li_loops = 1 
END IF 

FileDelete( gs_dir_path + "_ResultPage.bmp" )

li_filenum =  FileOpen( gs_dir_path + "_ResultPage.bmp", StreamMode!, Write!, LockWrite!, Append!)

ll_new_pos = 1

IF li_filenum <> -1 THEN	
	//read the file ... 
	FOR li_counter = 1 to li_loops 
		 blob_temp = BlobMid( lb_verif_picture, ll_new_pos, 32765 )
   	 ll_bytes_written = FileWrite( li_filenum, blob_temp) 		 
		 st_1.text = "Writing File"
		 IF ll_bytes_written = -1 THEN
			MessageBox("Error", "Error with FileRead command.  Return -1." )
			Return -1
		 END IF
	    lb_tot_b = lb_tot_b + blob_temp 
   	 ll_new_pos = ll_new_pos + ll_bytes_written 
	    //FileSeek(li_filenum, 0, FROMEND!) 
   	 if len(lb_tot_b) > 1000000 then 
	        total_blob = total_blob + lb_tot_b 
   	     lb_tot_b = blank_blob 
	    end if 
	NEXT 

	total_blob = total_blob + lb_tot_b 

	lb_verif_picture = total_blob
	
	FileClose( li_filenum )
   st_1.text = "File Closed"
ELSE
	MessageBox( "File Open Error", "Could not open _resultpage.bmp for StreamMode!" )
	Return -	1
END IF


DO While Not FileExists( gs_dir_path + "_ResultPage.bmp" )
	Yield( )
	st_1.text = "Waiting for Image Retrieval"
	IF ib_cancel THEN
		//cb_cancel.Enabled = False
		Return -1
	END IF
LOOP

st_1.text = "Image Retrieved" 

//cb_cancel.Enabled = True

Return 1

end function

on w_web_crawler_verifications_5306.create
int iCurrent
call super::create
this.cb_capture=create cb_capture
this.cb_help=create cb_help
this.cbx_ama=create cbx_ama
this.cbx_show=create cbx_show
this.ole_image=create ole_image
this.cb_save=create cb_save
this.cb_close=create cb_close
this.st_1=create st_1
this.cb_print=create cb_print
this.cb_verify=create cb_verify
this.hpb_1=create hpb_1
this.gb_1=create gb_1
this.dw_verif_list=create dw_verif_list
this.ole_browser=create ole_browser
this.dw_ama=create dw_ama
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_capture
this.Control[iCurrent+2]=this.cb_help
this.Control[iCurrent+3]=this.cbx_ama
this.Control[iCurrent+4]=this.cbx_show
this.Control[iCurrent+5]=this.ole_image
this.Control[iCurrent+6]=this.cb_save
this.Control[iCurrent+7]=this.cb_close
this.Control[iCurrent+8]=this.st_1
this.Control[iCurrent+9]=this.cb_print
this.Control[iCurrent+10]=this.cb_verify
this.Control[iCurrent+11]=this.hpb_1
this.Control[iCurrent+12]=this.gb_1
this.Control[iCurrent+13]=this.dw_verif_list
this.Control[iCurrent+14]=this.ole_browser
this.Control[iCurrent+15]=this.dw_ama
end on

on w_web_crawler_verifications_5306.destroy
call super::destroy
destroy(this.cb_capture)
destroy(this.cb_help)
destroy(this.cbx_ama)
destroy(this.cbx_show)
destroy(this.ole_image)
destroy(this.cb_save)
destroy(this.cb_close)
destroy(this.st_1)
destroy(this.cb_print)
destroy(this.cb_verify)
destroy(this.hpb_1)
destroy(this.gb_1)
destroy(this.dw_verif_list)
destroy(this.ole_browser)
destroy(this.dw_ama)
end on

event open;call super::open;Integer li_rc
Integer i
Integer li_screen_id
Integer li_wc_id
String ls_web_site_address
String ls_ref
String ls_ref_1
String ls_ref_2
string ls_docid[]

debugbreak()
str_web_crawler lstr_web_crawler 

lstr_web_crawler = Message.PowerObjectParm
ii_facility_id[] = lstr_web_crawler.si_facility_ids[]
il_prac_id[] = lstr_web_crawler.sl_prac_ids[]
ls_docid[] = lstr_web_crawler.ss_docid[]

li_rc = upperbound(ls_docid[])

dw_verif_list.of_SetTransObject( SQLCA )
//dw_verif_list.Retrieve( ii_facility_id, il_prac_id )
dw_verif_list.Retrieve(ls_docid[] )

li_rc = dw_verif_list.RowCount( )


st_1.Text = "There are " + String( li_rc ) + " credential(s) to verify. To run the crawler, click the check box next to th credential you want to verify then click on the Crawl button."

FOR i = 1 TO li_rc
	li_wc_id = 0
	ls_ref = dw_verif_list.GetItemString( i, "reference_value" )
	ls_ref_1 = Mid( ls_ref, 1, POS( ls_ref, "-" ) -1 )
	ls_ref_2 = Mid( ls_ref, POS( ls_ref, "-" ) + 2, 100 )
	li_screen_id = dw_verif_list.GetItemNumber( i, "screen_id" )
		
	Choose Case li_screen_id
			
	//Board Certification		
	Case 19
	
		ls_ref_2 = dw_verif_list.GetitemString( i, "entity_name" )
	
		SELECT DISTINCT wc_hdr.wc_id
    	INTO :li_wc_id
    	FROM wc_hdr,   
      	  wc_multi_entity_link,   
      	  address_lookup  
		WHERE ( wc_hdr.wc_id = wc_multi_entity_link.wc_id ) and  
       		( wc_multi_entity_link.wc_lookup_code = address_lookup.lookup_code ) and  
         	( ( wc_hdr.wc_screen_id_link = :li_screen_id ) AND  
         	( address_lookup.entity_name = :ls_ref_2 ) ) ;
		IF SQLCA.SQLCODE = -1 THEN
			MessageBox( "SQL Error", SQLCA.SQLERRTEXT )
			Return -1
		END IF
		
		IF li_wc_id = 0 THEN
			dw_verif_list.SetItem( i, "web_crawler_id", 0 )
			dw_verif_list.SetItem( i, "complete_status", -4 )		
		ELSE
			dw_verif_list.SetItem( i, "web_crawler_id", li_wc_id )
			dw_verif_list.SetItem( i, "complete_status", 0 )		
		END IF
		
	//License	
	Case 4
				
		ls_ref_2 = dw_verif_list.GetitemString( i, "entity_name" )
		
		SELECT DISTINCT wc_hdr.wc_id
    		INTO :li_wc_id
    		FROM wc_hdr,   
      			 wc_multi_entity_link,   
      	  		 address_lookup  
	  	 WHERE ( wc_hdr.wc_id = wc_multi_entity_link.wc_id ) and  
      		    	      ( wc_multi_entity_link.wc_lookup_code = address_lookup.lookup_code ) and  
         			 	 ( ( wc_hdr.wc_screen_id_link = :li_screen_id ) AND  
         				 ( address_lookup.entity_name = :ls_ref_2 ) ) ;
		IF SQLCA.SQLCODE = -1 THEN
			MessageBox( "SQL Error", SQLCA.SQLERRTEXT )
			Return -1
		END IF
		
		IF li_wc_id = 0 THEN
			dw_verif_list.SetItem( i, "web_crawler_id", 0 )
			dw_verif_list.SetItem( i, "complete_status", -4 )		
		ELSE
			dw_verif_list.SetItem( i, "web_crawler_id", li_wc_id )
			dw_verif_list.SetItem( i, "complete_status", 0 )		
		END IF
	//DEA Registration
	Case 5

		SELECT code
		INTO :ls_ref_1
		FROM code_lookup
		WHERE lookup_name = 'State' AND
		      code = :ls_ref_1;
		IF SQLCA.SQLCODE = -1 THEN
			MessageBox( "SQL Error", SQLCA.SQLERRTEXT )
			Return -1
		END IF
		
		ls_ref_1 = Trim( ls_ref_1 )
			
			//MESSAGEBOX("", LS_REF_1 )
		SELECT wc_hdr.wc_id  
		INTO :li_wc_id
   		FROM wc_hdr  
   		WHERE ( wc_hdr.wc_screen_id_link = 5 ) AND  
      			    ( wc_hdr.wc_screen_field_link_fixed_value = :ls_ref_1 );
		IF SQLCA.SQLCODE = -1 THEN
			MessageBox( "SQL Error", SQLCA.SQLERRTEXT )
			Return -1
		END IF

		IF li_wc_id = 0 THEN
			dw_verif_list.SetItem( i, "web_crawler_id", 0 )
			dw_verif_list.SetItem( i, "complete_status", -4 )		
		ELSE
			dw_verif_list.SetItem( i, "web_crawler_id", li_wc_id )
			dw_verif_list.SetItem( i, "complete_status", 0 )		
		END IF
		
	//ECFMG
	Case 20
		SELECT DISTINCT wc_hdr.wc_id
 	  	INTO :li_wc_id
		FROM wc_hdr  
   		WHERE wc_hdr.wc_screen_id_link = 20;
		IF SQLCA.SQLCODE = -1 THEN
			MessageBox( "SQL Error", SQLCA.SQLERRTEXT )
			Return -1
		END IF
		
		IF li_wc_id = 0 THEN
			dw_verif_list.SetItem( i, "web_crawler_id", 0 )
			dw_verif_list.SetItem( i, "complete_status", -4 )		
		ELSE
			dw_verif_list.SetItem( i, "web_crawler_id", li_wc_id )
			dw_verif_list.SetItem( i, "complete_status", 0 )		
		END IF
	Case ELSE
		dw_verif_list.SetItem( i, "web_crawler_id", 0 )
		dw_verif_list.SetItem( i, "complete_status", -4 )				
	End Choose
	
	IF li_wc_id = 0 AND Len( dw_verif_list.GetItemString( i, "web_address") ) > 0 THEN
		dw_verif_list.SetItem( i, "complete_status", -3 )					
	END IF

END FOR
dw_verif_list.AcceptText( )

dw_verif_list.Modify("DataWindow.Header.1.Height='0'")
dw_verif_list.SetSort( "completed_status A, screen_name A, reference_value A" )	
dw_verif_list.Sort( )

end event

type cb_capture from commandbutton within w_web_crawler_verifications_5306
integer x = 2043
integer y = 68
integer width = 343
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "Capture"
end type

event clicked;ulong l_handle
Integer li_pos
Integer li_wait
Integer li_FileNum1
Integer li_filenum
string ls_data
String ls_file_extention
String ls_doc_id
integer li_loops, li_counter 
long ll_filelen, ll_bytes_read, ll_new_pos 
long ll_cnt
blob lb_our_blob, lb_tot_b, blob_temp, total_blob, blank_blob 
String ls_sql
Long	fh
Integer li_retval
blob	lb_verif_picture


IF NOT FileExists( gs_dir_path + gs_DefDirName + "\screencapture\HprSnap5.exe" ) THEN
	//--------------------------- APPEON BEGIN ---------------------------
	//$<modify> 2007.08.31 By: Jack
	//$<reason> Fix a defect.
	/*
	MessageBox("Missing Capture Software", "Before using the Capture funtion you need to purchase and install HyperSnap-DX 5. You can purchase and download this software from www.hyperionics.com.  Note: Install this software in a directory called " + gs_dir_path + gs_DefDirName + "\screencapture\  See your users manual for assistance." )
	*/
	MessageBox("Missing Capture Software", "Before using the Capture function you need to purchase and install HyperSnap-DX 5. You can purchase and download this software from www.hyperionics.com.  Note: Install this software in a directory called " + gs_dir_path + gs_DefDirName + "\screencapture\  See your users manual for assistance." )
	//---------------------------- APPEON END ----------------------------
	Return -1	
END IF

//ADD CODE TO AUTOMATICALLY CREATE .BAT FILE IF NOT THERE.

IF NOT FileExists( gs_dir_path + gs_DefDirName + "\capture.bat" ) THEN
	li_filenum = FileOpen( gs_dir_path + gs_DefDirName + "\capture.bat",  StreamMode!, Write!, LockWrite!, Replace!)
	FileWrite( li_filenum,  gs_dir_path + gs_DefDirName + '"\ScreenCapture\HprSnap5.exe" -snap:window -save:jpg:q95  ' + gs_dir_path + '_ResultPage.jpg' )
	IF li_filenum = -1 THEN
		//--------------------------- APPEON BEGIN ---------------------------
		//$<modify> 2007.08.31 By: Jack
		//$<reason> Fix a defect.
		/*
		MessageBox("Error", "Could not open file " + gs_dir_path + gs_DefDirName + "\capture.bat.  This file is need to capture images. Call 888-634-4464 for assistance." )
		*/
		MessageBox("Error", "Could not open file " + gs_dir_path + gs_DefDirName + "\capture.bat.  This file is needed to capture images. Call 888-634-4464 for assistance." )
		//---------------------------- APPEON END ----------------------------
		Return -1
	END IF
	FileClose( li_filenum )
END IF

li_filenum = FileOpen( gs_dir_path + gs_DefDirName + "\capture.bat"  )
FileRead( li_filenum, ls_data )
li_pos = POS( Upper(ls_data), "SAVE:" )
ls_file_extention = Mid( ls_data, li_pos + 5, 3 )
FileClose( li_filenum )

FileDelete( gs_dir_path +"_ResultPage." + ls_file_extention )
IF NOT FileExists( gs_dir_path + gs_DefDirName + "\capture.bat" ) THEN
	//--------------------------- APPEON BEGIN ---------------------------
	//$<modify> 2007.08.31 By: Jack
	//$<reason> Fix a defect.
	/*
	MessageBox("Missing File", "You are missing the capture.bat file.  Call support." )
	*/
	MessageBox("Missing File", "The capture.bat file is missing.  Call support." )
	//---------------------------- APPEON END ----------------------------
	Return -1
END IF

SetPointer(HOURGLASS!) 

Run( gs_dir_path + gs_DefDirName + "\capture.bat", Minimized!)

st_1.text = "Waiting for capture"

//MessageBox("", gs_dir_path + "_ResultPage." + ls_file_extention )

DO While Not FileExists( gs_dir_path + "_ResultPage." + ls_file_extention )
	Yield( )
	//IF lb_cancel THEN
	//	cb_capture.Enabled = True
	//	cb_close.Enabled = True
	//	cb_cancel.Enabled = False
	//	Return
	//END IF
LOOP

st_1.text = "Web Page Captured"

DO While FileLength( gs_dir_path +"_ResultPage." + ls_file_extention ) < 1
	st_1.text = "Waiting for file to exists"
LOOP

Sleep(2)

ll_filelen = FileLength( gs_dir_path + "_ResultPage." + ls_file_extention ) 

IF ll_filelen = -1 THEN
	MessageBox("Error", "Error with FileLength command.  Return -1." )
	Return -1
END IF

li_filenum = FileOpen( gs_dir_path + "_ResultPage." + ls_file_extention, StreamMode!,READ!,LOCKREAD!)

st_1.text = "File Open"

IF li_filenum <> -1 THEN
	
	//Find out how long the file specified in sle_filename.text is

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
		 st_1.text = "Reading File"
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
	
	ls_doc_id = dw_verif_list.GetItemString( il_current_row, "doc_id" )
	
	UPDATEBLOB verif_info
	SET verification_picture = :lb_verif_picture
	WHERE doc_id = :ls_doc_id
	USING SQLCA;
	st_1.text = "Database Updated With Web Screen Shot."

	UPDATE verif_info
	SET verification_picture_flag = 1
	WHERE doc_id = :ls_doc_id
	USING SQLCA;	
	
	dw_verif_list.SetItem( il_current_row, "verification_picture_flag", 1 )
	
ELSE
	MessageBox( "File Open Error", "Could not open _ResultPage.jpg for StreamMode!" )
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

//FileDelete( gs_dir_path + "_ResultPage." + ls_file_extention )

//dw_1.Enabled = True
//lb_pause_for_file = True
//cb_capture.Enabled = True
//cb_response.Enabled = True
//cb_cancel.Enabled = False
//cb_preview.Enabled = True
//cb_close.Enabled = True

end event

type cb_help from commandbutton within w_web_crawler_verifications_5306
integer x = 2405
integer y = 68
integer width = 343
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Help"
end type

event clicked;Int OLECMDID_SAVEAS = 4
Int OLECMDID_ALLOWUILESSSAVEAS = 46
Int OLECMDEXECOPT_DONTPROMPTUSER = 1
String sSaveHTMLFile = gs_dir_path + gs_DefDirName + "\test1jad.htm"
Integer li_null

SetNull( li_null )

ole_browser.Object.ExecWB(OLECMDID_SAVEAS, OLECMDEXECOPT_DONTPROMPTUSER, sSaveHTMLFile, li_null )

//ole_browser.Object.ExecWB(OLECMDID_SAVEAS, li_null, sSaveHTMLFile )








//	ole_browser.Object.Visible = True 
//int OLECMDID_PRINT = 0
//int OLECMDID_PRINTPREVIEW = 7
//int OLECMDID_PAGESETUP = 8
//
//int OLECMDEXECOPT_DODEFAULT = 0
//int OLECMDEXECOPT_PROMPTUSER = 0
//int OLECMDEXECOPT_DONTPROMPTUSER = 2
//int MSOCMDEXECOPT_DONTPROMPTUSER = 0
//String varpath = "c:\test.htm"
//String ls_null
//int OLECMDID_SAVEAS = 1
//
////ole_browser.object.ExecWB( OLECMDID_PRINT, OLECMDEXECOPT_PROMPTUSER )
//
////ole_browser.object.ExecWB( OLECMDID_PRINT, OLECMDEXECOPT_PROMPTUSER, AsStatement! )
//
//ole_browser.object.ExecWB( OLECMDID_SAVEAS, MSOCMDEXECOPT_DONTPROMPTUSER, varPath , ls_null );
//
//
//	
//
////ole_browser.Object.SaveAs( "c:\test.htm" )	
end event

type cbx_ama from checkbox within w_web_crawler_verifications_5306
integer x = 928
integer y = 80
integer width = 471
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Verify Using AMA"
end type

event clicked;IF This.Checked THEN
	dw_verif_list.Modify("DataWindow.Header.1.Height='75'")
	dw_verif_list.SetSort( "full_name A, completed_status A, screen_name A, reference_value A" )	
	IF dw_ama.RowCount( ) = 0 THEN
		Integer li_rc
		Integer i
		Integer li_array_size
		Integer a
		Integer li_nr
		Integer li_cnt
		Integer li_facility_ids[]
		Long ll_temp_prac_id
		Long ll_prac_ids[ ]
		String ls_names[]
		Boolean lb_found = False
	
		li_rc = dw_verif_list.RowCount( )
	
		FOR i = 1 TO li_rc
			lb_found = False
			ll_temp_prac_id = dw_verif_list.GetItemNumber( i, "prac_id" )
			li_array_size = UpperBound( ll_prac_ids )
		
			FOR a = 1 TO li_array_size
				IF ll_temp_prac_id = ll_prac_ids[ a ] THEN
					lb_found = True
				END IF
			END FOR
		
			IF NOT lb_found THEN
				li_cnt++
				ll_prac_ids[  li_cnt ] = ll_temp_prac_id
				li_facility_ids[ li_cnt ] = dw_verif_list.GetItemNumber( i, "facility_id" )
				ls_names[li_cnt] = dw_verif_list.GetItemString( i, "full_name" )
			END IF
		END FOR
	
		FOR i = 1 TO li_cnt
			li_nr = dw_ama.InsertRow( 0 )
			dw_ama.SetItem( li_nr, "prac_id", ll_prac_ids[ i ] )
			dw_ama.SetItem( li_nr, "facility_id", li_facility_ids[i] )
			dw_ama.SetItem( li_nr, "full_name", ls_names[i] )
		END FOR
		dw_verif_list.Visible = False
	     dw_ama.Visible = True	
		  
		 st_1.Text =  String( li_cnt ) + " practitioners.  To run an AMA profile for a practitioner, Click on the check box next to their name then click Crawl button to run AMA web crawler."
	ELSE
		dw_verif_list.Visible = False
		dw_ama.Visible = True	
	END IF
ELSE
		dw_verif_list.Modify("DataWindow.Header.1.Height='0'")
		dw_verif_list.SetSort( "completed_status A, screen_name A, reference_value A" )	
		dw_verif_list.Visible = True
		dw_ama.Visible = False
END IF

dw_verif_list.Sort( )
end event

type cbx_show from checkbox within w_web_crawler_verifications_5306
integer x = 471
integer y = 80
integer width = 434
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Show Crawler"
end type

type ole_image from olecustomcontrol within w_web_crawler_verifications_5306
event keydown ( integer keycode,  integer shift )
event keyup ( integer keycode,  integer shift )
event keypress ( integer keyascii )
event mousedown ( integer button,  integer shift,  long ocx_x,  long ocx_y )
event mousemove ( integer button,  integer shift,  long ocx_x,  long ocx_y )
event mouseup ( integer button,  integer shift,  long ocx_x,  long ocx_y )
event click ( )
event dblclick ( )
event ocx_error ( integer number,  string description,  long scode,  string source,  string helpfile,  long helpcontext,  boolean canceldisplay )
event ocx_close ( )
event markend ( long left,  long top,  long ocx_width,  long ocx_height,  integer marktype,  string groupname )
event toolselected ( integer toolid )
event selectionrectdrawn ( long left,  long top,  long ocx_width,  long ocx_height )
event tooltip ( integer index )
event toolpalettehidden ( long left,  long top )
event scroll ( )
event markselect ( integer button,  integer shift,  long left,  long top,  long ocx_width,  long ocx_height,  integer marktype,  string groupname )
event pastecompleted ( )
event load ( double zoom )
event markmove ( integer marktype,  string groupname )
event pagepropertiesclose ( )
event checkcontinueprinting ( long pagesprinted,  long currentpage,  integer status )
event hyperlinkgotopage ( long page )
event errorsavingundoinformation ( long ocx_error )
event straightenpage ( )
event hyperlinkgotodoc ( string link,  long page,  boolean handled )
event editingtextannotation ( boolean editing )
event magnifierstatus ( integer hwnd,  long status,  long magnifierzoom,  long left,  long top,  long ocx_width,  long ocx_height )
event pasteclip ( long mode )
event baddocumentfiletype ( long page,  boolean errorout,  boolean skippage,  boolean overwritepage )
event nextpage ( )
event prevpage ( )
event overlayfilenotfound ( string overlayfilename,  boolean btryagain )
event imagedraganddrop ( )
event zoomchanged ( real zoom )
event beforemarkmove ( boolean bcancelmove )
event readystatechange ( long readystate )
integer x = 50
integer y = 1172
integer width = 3415
integer height = 992
integer taborder = 20
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
string binarykey = "w_web_crawler_verifications_5306.win"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
end type

event click();hpb_1.Visible = False
end event

event getfocus;ls_current_print_object = "IMAGE"
end event

type cb_save from commandbutton within w_web_crawler_verifications_5306
integer x = 1682
integer y = 68
integer width = 343
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Save"
end type

event clicked;Parent.Event pfc_Save()
end event

type cb_close from commandbutton within w_web_crawler_verifications_5306
integer x = 3118
integer y = 68
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

event clicked;Close( Parent )
end event

type st_1 from statictext within w_web_crawler_verifications_5306
integer x = 50
integer y = 1088
integer width = 3410
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "none"
boolean border = true
boolean focusrectangle = false
end type

type cb_print from commandbutton within w_web_crawler_verifications_5306
integer x = 2761
integer y = 68
integer width = 343
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Print"
end type

event clicked;CHOOSE CASE Upper(ls_current_print_object)
	CASE "VER DATA"
		dw_verif_list.Print( )
	CASE "EXCEPTIONS"
		
	CASE "IMAGE"
		ole_image.Object.PrintImage()
		//Navigate("www.intellisoftgroup.com")							
		

END CHOOSE

end event

type cb_verify from commandbutton within w_web_crawler_verifications_5306
integer x = 87
integer y = 68
integer width = 343
integer height = 92
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Crawl"
end type

event clicked;Integer li_number_sent
Integer i
Integer li_rc
Integer li_wc_id
Integer li_facility_id
Integer li_cnt
Boolean lb_show
Long ll_prac_id
Long ll_retval
Integer li_crawl
String ls_doc_id

li_rc = dw_verif_list.RowCount( )

nvo_web_crawler_engine lnvo_web_crawler

//web_crawler id, doc_id, facility_id, prac_id

FOR i = 1 TO li_rc
	IF dw_verif_list.GetItemNumber( i, "selected" ) = 1 THEN
		li_cnt++
	END IF
END FOR

hpb_1.MinPosition = 1
hpb_1.MaxPosition = li_cnt * 50

hpb_1.SetStep = 50

IF cbx_show.Checked THEN
	lb_show = True	
END IF

IF li_rc > 0 THEN
	hpb_1.Visible = True
END IF

FOR i = 1 TO li_rc	
	
	SetPointer( HourGlass! )
	
	IF dw_verif_list.GetItemNumber( i, "selected" ) = 0 THEN
		CONTINUE
	END IF
	
	dw_verif_list.SelectRow( 0, False )
	dw_verif_list.SelectRow( i, True )
	
	li_crawl++
	
	st_1.Text = "Verifying credential " + String( li_crawl ) + " of " + String( li_cnt )
	
	dw_verif_list.SetItem( i, "complete_status", 99 )
	
	li_wc_id = dw_verif_list.GetItemNumber( i, "web_crawler_id" )
	ls_doc_id = dw_verif_list.GetItemString( i, "doc_id" )
	ll_prac_id = dw_verif_list.GetItemNumber( i, "prac_id" )
	li_facility_id = dw_verif_list.GetItemNumber( i, "facility_id" )
	ll_retval = lnvo_web_crawler.of_crawl( li_wc_id,  li_facility_id, ll_prac_id,ls_doc_id , lb_show )
	
	IF ll_retval = 1 THEN
		dw_verif_list.SetItem( i, "complete_status", 1 )
	ELSEIF ll_retval > 1 THEN
		dw_verif_list.SetItem( i, "response_code", ll_retval )
		dw_verif_list.SetItem( i, "complete_status", 2 )	
		li_number_sent = dw_verif_list.GetitemNumber( i, "number_sent" )
		li_number_sent++
		dw_verif_list.SetItem( i, "number_sent", li_number_sent )		
		dw_verif_list.SetItem( i, "date_recieved", Today( ) )
		dw_verif_list.SetItem( i, "last_sent", Today( ) )
		IF IsNull( dw_verif_list.GetItemDateTime( i, "first_sent" ) ) THEN
			dw_verif_list.SetItem( i, "first_sent", Today( ) )	
		END IF
		dw_verif_list.SetItem( i, "user_name", gs_user_id )			
	END IF

	IF ll_retval > 0 THEN
		dw_verif_list.SetItem( i, "verification_picture_flag", 1 )
	END IF

	hpb_1.Position = li_crawl * 50	
	
	dw_verif_list.SetItem( i, "selected", 0 )
	
END FOR

Beep(1)
hpb_1.Visible = False
st_1.Text = "Web Crawl Complete."
//hpb_1.Visible = False
end event

type hpb_1 from hprogressbar within w_web_crawler_verifications_5306
integer x = 50
integer y = 1092
integer width = 3410
integer height = 64
unsignedinteger maxposition = 100
integer setstep = 10
boolean smoothscroll = true
end type

type gb_1 from groupbox within w_web_crawler_verifications_5306
integer x = 46
integer y = 8
integer width = 1477
integer height = 180
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "Web Crawler"
end type

type dw_verif_list from u_dw within w_web_crawler_verifications_5306
integer x = 41
integer y = 204
integer width = 3419
integer height = 876
integer taborder = 10
boolean titlebar = true
string title = "Web Verifications"
string dataobject = "d_web_crawler_ama_verif_info"
boolean resizable = true
end type

event getfocus;call super::getfocus;ls_current_print_object = "Ver_Data"
end event

event doubleclicked;call super::doubleclicked;SetPointer( HourGlass! )
cb_capture.Enabled = False
String ls_name

ls_name = dwo.name

debugbreak()

//This.GetItemNumber( row, "verification_picture_flag" ) > 0 OR
IF ls_name = "p_view_image" THEN
	ole_browser.Visible = False
	ole_image.Visible = True
	of_get_image( This.GetitemString( row, "doc_id") )
	IF FileExists( gs_dir_path + "_ResultPage.bmp" ) THEN
		ole_image.Object.Image = gs_dir_path + "_ResultPage.bmp"		
	END IF
	ole_image.Object.Display( )	
//This.GetItemNumber( row, "complete_status" ) = -3 OR	
ELSEIF ls_name = "p_link" THEN
	ole_image.Visible = False	
	ole_browser.Visible = True
	ole_browser.Object.Visible = True 
	ole_browser.Object.Navigate( This.GetItemString( row, "web_address" ))	
	cb_capture.Enabled = True
	il_current_row = row
END IF
end event

event itemchanged;call super::itemchanged;
IF This.GetColumnName() = "response_code" THEN
	Integer li_number_sent
	
	li_number_sent = This.GetitemNumber( row, "number_sent" )
	li_number_sent++
	This.SetItem( row, "number_sent", li_number_sent )		
	This.SetItem( row, "date_recieved", Today( ) )
	This.SetItem( row, "last_sent", Today( ) )
	IF IsNull( This.GetItemDateTime( row, "first_sent" ) ) THEN
		This.SetItem( row, "first_sent", Today( ) )	
	END IF
	This.SetItem( row, "user_name", gs_user_id )	
END IF
end event

event clicked;call super::clicked;hpb_1.Visible = False

IF GetClickedRow( ) > 0 THEN
	This.SelectRow( 0 , False )
	This.SelectRow( row, True )
END IF


end event

type ole_browser from olecustomcontrol within w_web_crawler_verifications_5306
event statustextchange ( string text )
event progresschange ( long progress,  long progressmax )
event commandstatechange ( long command,  boolean enable )
event downloadbegin ( )
event downloadcomplete ( )
event titlechange ( string text )
event propertychange ( string szproperty )
event beforenavigate2 ( oleobject pdisp,  any url,  any flags,  any targetframename,  any postdata,  any headers,  ref boolean cancel1 )
event newwindow2 ( ref oleobject ppdisp,  ref boolean cancel1 )
event navigatecomplete2 ( oleobject pdisp,  any url )
event documentcomplete ( oleobject pdisp,  any url )
event onquit ( )
event onvisible ( boolean ocx_visible )
event ontoolbar ( boolean toolbar )
event onmenubar ( boolean menubar )
event onstatusbar ( boolean statusbar )
event onfullscreen ( boolean fullscreen )
event ontheatermode ( boolean theatermode )
event windowsetresizable ( boolean resizable1 )
event windowsetleft ( long left )
event windowsettop ( long top )
event windowsetwidth ( long ocx_width )
event windowsetheight ( long ocx_height )
event windowclosing ( boolean ischildwindow,  ref boolean cancel1 )
event clienttohostwindow ( ref long cx,  ref long cy )
event setsecurelockicon ( long securelockicon )
event filedownload ( ref boolean cancel1 )
event navigateerror ( oleobject pdisp,  any url,  any frame,  any statuscode,  ref boolean cancel1 )
event printtemplateinstantiation ( oleobject pdisp )
event printtemplateteardown ( oleobject pdisp )
event updatepagestatus ( oleobject pdisp,  any npage,  any fdone )
event privacyimpactedstatechange ( boolean bimpacted )
boolean visible = false
integer x = 50
integer y = 1172
integer width = 3410
integer height = 992
integer taborder = 30
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
string binarykey = "w_web_crawler_verifications_5306.win"
integer binaryindex = 1
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
end type

type dw_ama from u_dw within w_web_crawler_verifications_5306
boolean visible = false
integer x = 46
integer y = 204
integer width = 3419
integer height = 876
integer taborder = 20
boolean titlebar = true
string title = "Web Verifications"
string dataobject = "d_select_prac_for_ama_crawl"
boolean resizable = true
end type


Start of PowerBuilder Binary Data Section : Do NOT Edit
0Cw_web_crawler_verifications_5306.bin 
2400000c00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdfffffffefffffffe00000004fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff00000001000000000000000000000000000000000000000000000000000000000211a30001c7eb8000000003000003400000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000102001affffffff00000002ffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000002bf00000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000001001affffffffffffffff000000036d94028011ce9f116002fd838ac03e8c000000000211a30001c7eb800211a30001c7eb80000000000000000000000000006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000b0000007d000000000000000100000002000000030000000400000005000000060000000700000008000000090000000afffffffe0000000cfffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
2Fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0000fffe000202056d94028011ce9f116002fd838ac03e8c00000001fb8f0821101b01640008ed8413c72e2b000000300000028f00000012000001000000009800000101000000a000000102000000a800000103000000b000000104000000b800000105000000c000000106000000cc00000107000000d400000108000000dc00000109000000e40000010a000000ec0000010b000000f40000010c000000fc0000010d000001040000010e0000010c0000010f00000114000001100000011c000000000000012400000003000200050000000300004d3400000003000019a2000000030000006000000002000000010000001e0000000200000049000000030f887b00000000020000e09800000002000064c90000000b0000ffff00000002000064c9000000020000deb0000000020000deb00000000373ed43430000000373ed43430000000b0000ffff0000000b0000ffff00000012000000000000000100010d0000000b0065726c0076726573003164650000010f0000000b73657262657672650e0031640b0000016c0000006573657264657672010b0032000b000072730000726573653164657600010a0000000e0067616d006966696e6f7a726508006d6f1200000161000000746f6e6e6f69746172636f6e657079740001100000000b006572620076726573003264650000010c0000000b7365727365767265030032640c0000015f000000636f74736f72706b040073700c000001620000006564726f797473720500656c0d000001690000006567616d746e6f63006c6f7200000101000000097478655f78746e65000102000000090078655f00746e657401090079001300006f660000666563726c656c69696b6e697831676e000107000000120072636f00656e6f7a69736976696c6962060079740f00000175000000626f646e656666757a6973720100006500090000765f00006973726500006e6f0002000500004d34000019a2000000600001000100000000014901000001000000000000000042c800ff0002ffff000000000000000000ff000000ff0100000000000000000100000101ff0000000000000000030f887b0064c9e09800010000cc64c90000dfccdf00000010ff000010000000ff0000000000000100004c000000550069005000000069004d0067006e0069004c00000055005000400069004d0067006e0069004c0000005500670041006e006500790063004600200000004200720041006100690020006c0061004e007200720077006f0041000000690072006c0061005200200075006f0064006e00640065004d002000200054006f00420064006c004200000061006c006b00630064006100650064002000720054004900000043006f0042006f00640069006e004d0020000000540065006a0074006300000a00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdfffffffefffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
27ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff00000001000000000000000000000000000000000000000000000000000000000211a30001c7eb8000000003000001800000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000102001affffffff00000002ffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000009c00000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000001001affffffffffffffff000000038856f96111d0340ac0006ba9a205d74f000000000211a30001c7eb800211a30001c7eb80000000000000000000000000004f00430054004e004e00450053005400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000030000009c000000000000000100000002fffffffe0000000400000005fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0000004c00004d1a000019a20000000000000000000000000000000000000000000000000000004c0000000000000000000000010057d0e011cf3573000869ae62122e2b00000008000000000000004c0002140100000000000000c046000000000000800000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000fc0000010d000001040000010e0000010c0000010f00000114000001100000011c0000004c00004d1a000019a20000000000000000000000000000000000000000000000000000004c0000000000000000000000010057d0e011cf3573000869ae62122e2b00000008000000000000004c0002140100000000000000c0460000000000008000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000100010d0000000b0065726c0076726573003164650000010f0000000b73657262657672650e0031640b0000016c0000006573657264657672010b0032000b000072730000726573653164657600010a0000000e0067616d006966696e6f7a726508006d6f1200000161000000746f6e6e6f69746172636f6e657079740001100000000b006572620076726573003264650069006c0000006d0057005c004e0049000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1Cw_web_crawler_verifications_5306.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
