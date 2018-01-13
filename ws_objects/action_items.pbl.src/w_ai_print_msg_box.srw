$PBExportHeader$w_ai_print_msg_box.srw
forward
global type w_ai_print_msg_box from w_response
end type
type st_msg from statictext within w_ai_print_msg_box
end type
type cb_yes from commandbutton within w_ai_print_msg_box
end type
type cbx_mail from checkbox within w_ai_print_msg_box
end type
type cbx_priv from checkbox within w_ai_print_msg_box
end type
type cbx_release from checkbox within w_ai_print_msg_box
end type
type cb_print from commandbutton within w_ai_print_msg_box
end type
type cb_continuefax from commandbutton within w_ai_print_msg_box
end type
type cb_cancelfax from commandbutton within w_ai_print_msg_box
end type
type st_text from statictext within w_ai_print_msg_box
end type
type uo_print_app from pfc_cst_u_create_app2 within w_ai_print_msg_box
end type
type dw_errors from datawindow within w_ai_print_msg_box
end type
type ole_print from olecustomcontrol within w_ai_print_msg_box
end type
type ole_admin from olecustomcontrol within w_ai_print_msg_box
end type
type st_error_cnt from statictext within w_ai_print_msg_box
end type
type cb_fax from commandbutton within w_ai_print_msg_box
end type
type cb_1 from commandbutton within w_ai_print_msg_box
end type
type cb_no from commandbutton within w_ai_print_msg_box
end type
type cb_email from commandbutton within w_ai_print_msg_box
end type
end forward

global type w_ai_print_msg_box from w_response
integer x = 110
integer y = 208
integer width = 2574
integer height = 608
boolean controlmenu = false
long backcolor = 80269524
event ue_setfocus ( )
event ue_post_closewithreturn ( gs_fax_error_records ags_fax_error_records )
st_msg st_msg
cb_yes cb_yes
cbx_mail cbx_mail
cbx_priv cbx_priv
cbx_release cbx_release
cb_print cb_print
cb_continuefax cb_continuefax
cb_cancelfax cb_cancelfax
st_text st_text
uo_print_app uo_print_app
dw_errors dw_errors
ole_print ole_print
ole_admin ole_admin
st_error_cnt st_error_cnt
cb_fax cb_fax
cb_1 cb_1
cb_no cb_no
cb_email cb_email
end type
global w_ai_print_msg_box w_ai_print_msg_box

type prototypes
FUNCTION ulong FindWindowA(ulong classname,string windowname) LIBRARY "User32.dll" alias for "FindWindowA;Ansi"
end prototypes

type variables
Boolean ib_no_faxing  = False
Boolean ib_faxing_doc = True

String is_mail_label_doc
String is_letter_name
String is_msg
String is_cover_page
String is_cover_message
String is_subject 
String is_letter_type
string is_document   //Start Code Change ---- 10.25.2007 #V7 maha

Integer li_click_times = 0
Integer li_timeout = 0
Integer il_error_rec_num []

n_ds ids_letter

//mskinner 20 Dec 2004 -- begin
//n_cst_msword  invo_msword
boolean ib_skip
n_cst_dirattrib lnv_dirlist[]
//mskinner 20 Dec 2004 -- end

n_cst_filesrvwin32 inv_filesrv

boolean ib_fax_docs_created

String is_merge_file_path //Added By Ken.Guo 03.25.2008

end variables

forward prototypes
public function integer of_fax (boolean ab_error_checking)
public function integer of_print_image_document (string as_print_to)
public function integer of_email (boolean ab_error_checking)
public function long of_get_documents (ref string as_docs[], string as_search)
public function integer of_retrieve_image_from_db (integer ai_activestatus, integer ai_imagetypeid, long al_pracid)
public function integer of_fax_email (boolean ab_error_checking, string as_type)
public function integer of_is_word_open ()
end prototypes

event ue_post_closewithreturn(gs_fax_error_records ags_fax_error_records);//////////////////////////////////////////////////////////////////////
// $<event>w_response.ue_post_closewithreturn()
// $<arguments>
//		value	gs_fax_error_records	ags_fax_error_records		
// $<returns> 
// $<description> Maybe PB Bug,So create this event to post close this window.
//////////////////////////////////////////////////////////////////////
// $<add> 11/02/2007 by Ken.Guo
//////////////////////////////////////////////////////////////////////
CloseWithReturn(This,ags_fax_error_records)
end event

public function integer of_fax (boolean ab_error_checking);//Jervis 12-10-2008
//This function is obsolete.  DO NOT USE THIS FUNCTION


Boolean lb_error_rec
String ls_facility_name
String ls_full_name
string ls_attachments[]
String ls_recipient
String ls_company
String ls_fax
String ls_lookup_entity_name
//String ls_cover_page
//String ls_cover_message
//String ls_subject
String ls_no_fax
Integer li_attach_cnt
Integer e
Integer li_nr
Integer li_error
Integer li_error_cnt
Long li_rc
Long i
Long f
Long ChanNum
gs_pass_ids  lg_pass_ids
gs_fax_error_records lst_fax_error_records

ChanNum = OpenChannel("FAXMNG32", "CONTROL")
IF ChanNum < 0 THEN
	MessageBox("Error", "Winfax is not installed or needs to be configured." )
	Return -1
END IF

ib_faxing_doc = True

//IF all letter records were missing fax numbers then return with -2 or Cancel
IF UpperBound( il_error_rec_num ) = ids_letter.RowCount( ) THEN
	lst_fax_error_records.il_error_rec_num[1] = -2
	CloseWithReturn( This, lst_fax_error_records  )
END IF

li_rc = ids_letter.RowCount( )

//preprocess list to make sure the appropriate info is there to fax
IF ab_error_checking THEN
	FOR i = 1 TO li_rc

		IF is_letter_type = "Verif" THEN
			//grap the name of the school, ins company etc.
			IF ids_letter.Describe( "entity_name.border" ) <> "!" THEN			
				ls_company = ids_letter.GetItemString( i, "entity_name" )							
			ELSEIF ids_letter.Describe( "entity.border" ) <> "!" THEN			
				ls_company = ids_letter.GetItemString( i, "entity" )							
			ELSEIF ids_letter.Describe( "address_lookup_entity_name.border" ) <> "!" THEN			
				ls_company = ids_letter.GetItemString( i, "address_lookup_entity_name" )			
			ELSE
				MessageBox("Support", "The " + ids_letter.DataObject + " data object does not have an entity_name field in it.  Call support." )
				Return -1
			END IF
			//grap the name of the contact person at the school, ins company etc.
			IF ids_letter.Describe( "contact_name.border" ) <> "!" THEN			
				ls_recipient = ids_letter.GetItemString( i, "contact_name" )							
			ELSEIF ids_letter.Describe( "address_lookup_contact_name.border" ) <> "!" THEN			
				ls_recipient = ids_letter.GetItemString( i, "address_lookup_contact_name" )			
			ELSE
				//--------------------------- APPEON BEGIN ---------------------------
				//$<modify> 2007.08.31 By: Jack
				//$<reason> Fix a defect
				/*
				MessageBox("Support", "The " + ids_letter.DataObject + " data object does not have contact_name field in it.  Call support." )
				*/
  				MessageBox("Support", "The " + ids_letter.DataObject + " data object does not have a contact_name field in it.  Call support." )
				//---------------------------- APPEON END ----------------------------
				Return -1				
			END IF
		ELSE
			//grap the name of the practitioner if its a corro or exp or exp appoint letter
			IF ids_letter.Describe( "v_full_name_full_name.border" ) <> "!" THEN						
				ls_recipient = ids_letter.GetItemString( i, "v_full_name_full_name" )
				ls_company = ""				
			ELSEIF ids_letter.Describe( "full_name.border" ) <> "!" THEN						
				ls_recipient = ids_letter.GetItemString( i, "full_name" )
				ls_company = ""			
			ELSE
				//--------------------------- APPEON BEGIN ---------------------------
				//$<modify> 2007.08.31 By: Jack
				//$<reason> Fix a defect.
				/*
				MessageBox("Support", "The " + ids_letter.DataObject + " data object does not have FULL NAME field in it.  Call support." )
				*/
  				MessageBox("Support", "The " + ids_letter.DataObject + " data object does not have a FULL NAME field in it.  Call support." )
				//---------------------------- APPEON END ----------------------------
				Return -1								
			END IF
		END IF

		//grap the email address.  Could be from the prac address or the address lookup table
		IF ids_letter.Describe( "fax.border" ) <> "!" THEN
			ls_fax =  ids_letter.GetItemString( i, "fax" )
		ELSEIF ids_letter.Describe( "pd_address_fax.border" ) <> "!" THEN
			ls_fax =  ids_letter.GetItemString( i, "pd_address_fax" )
		ELSEIF ids_letter.Describe( "address_lookup_fax.border" ) <> "!" THEN
			ls_fax =  ids_letter.GetItemString( i, "address_lookup_fax" )
		ELSE
			MessageBox("Support", "The " + ids_letter.DataObject + " data object does not have an email_address field in it.  Call support." )
			Return -1
		END IF
				
		//if its a corro letter then check to see if the prac address has a email number
		IF IsNull( ls_fax ) OR ls_fax = "" THEN
			IF ids_letter.Describe( "facility_facility_name.border" ) <> "!" THEN
				ls_facility_name = ids_letter.GetItemString( i, "facility_facility_name" )
			ELSEIF ids_letter.Describe( "facility_name.border" ) <> "!" THEN
				ls_facility_name = ids_letter.GetItemString( i, "facility_name" )
			ELSEIF ids_letter.Describe( "facility_return_facility_name.border" ) <> "!" THEN
				ls_facility_name = ids_letter.GetItemString( i, "facility_return_facility_name" )
			ELSE
				//--------------------------- APPEON BEGIN ---------------------------
				//$<modify> 2007.08.31 By: Jack
				//$<reason> Fix a defect.
				/*
				MessageBox("Support", "The " + ids_letter.DataObject + " data object does not have an facility_name field in it.  Call support." )
				*/
  				MessageBox("Support", "The " + ids_letter.DataObject + " data object does not have a facility_name field in it.  Call support." )
				//---------------------------- APPEON END ----------------------------
				Return -1
			END IF
	
			//grab the full name field.
			IF ids_letter.Describe( "v_full_name_full_name.border" ) <> "!" THEN
				ls_full_name = ids_letter.GetItemString( i, "v_full_name_full_name" )
			ELSEIF ids_letter.Describe( "full_name.border" ) <> "!" THEN
				ls_full_name = ids_letter.GetItemString( i, "full_name" )		
			ELSE
				MessageBox("Support", "The " + ids_letter.DataObject + " data object does not have an full_name field in it.  Call support." )
				Return -1
			END IF
			
			IF ids_letter.Describe( "address_lookup_entity_name.border" ) <> "!" THEN
				ls_lookup_entity_name =  ids_letter.GetItemString( i, "address_lookup_entity_name" )
			ELSEIF ids_letter.Describe( "entity_name.border" ) <> "!" THEN
				ls_lookup_entity_name =  ids_letter.GetItemString( i, "entity_name" )
			ELSE
				ls_lookup_entity_name = "N/A"
			END IF			
			
			li_nr = dw_errors.InsertRow( 0 )
			
			li_error_cnt++
			il_error_rec_num[ li_error_cnt ] = i
			
			IF ls_lookup_entity_name <> "N/A" THEN
				st_text.Text = "The following lookup entity did not have a fax number associated with it."
				dw_errors.Modify( "facility_name_t.text = 'Address Lookup Record'" )
				dw_errors.SetItem( li_nr, "facility_name", ls_lookup_entity_name )	
			ELSE
				dw_errors.SetItem( li_nr, "facility_name", ls_facility_name )
			END IF			
			dw_errors.SetItem( li_nr, "full_name", ls_full_name )	
		END IF			
	END FOR	

	st_error_cnt.Text = "There was " + String( li_error_cnt ) + " out of " + String( li_rc ) + " records in error."

	IF li_error_cnt = li_rc THEN
		cb_continuefax.Enabled = False
		//--------------------------- APPEON BEGIN ---------------------------
		//$<comment> 2006-10-12 By: Liu Hongxin
		//$<reason> fail to fax, it should change print status.
		/*
		cb_yes.Enabled = False
		*/
		//---------------------------- APPEON END ----------------------------
		cb_fax.Enabled = False
	END IF

	IF dw_errors.RowCount( ) > 0 THEN
		w_ai_print_msg_box.Height = 1475
		Return -1
	END IF
	
	ab_error_checking	= False		
	
END IF

pfc_cst_nv_fax nv_fax
nv_fax = CREATE pfc_cst_nv_fax;


OpenWithParm( w_fax_win, is_letter_type )
IF Message.StringParm = "Cancel" THEN
	Return -1
END IF
lg_pass_ids = Message.PowerObjectParm

is_cover_page = lg_pass_ids.s_fax_cover
is_cover_message = lg_pass_ids.s_fax_message 
is_subject = lg_pass_ids.s_fax_subject	
	
//check to see if user wants to print attachments (release, priv stuff )
of_print_image_document( "File" )

IF ids_letter.DataObject = "d_ltr_expiring_appointment" OR  ids_letter.DataObject = "d_ltr_expiring_provisional" OR ids_letter.DataObject = "d_ltr_expiring_allied_health" THEN
	gi_burn_annos	= 1
	w_ai_print_letters_new.of_Print_Application( True )
	w_ai_print_letters_new.ib_app_faxed = True	
	gi_burn_annos	= 0	
END IF
	

li_error_cnt = UpperBound( il_error_rec_num )

FOR i = 1 TO li_rc
	
	lb_error_rec = False
	FOR e = 1 TO li_error_cnt
		IF il_error_rec_num[e] = i THEN
			lb_error_rec = True
			Exit
		END IF
	END FOR
	IF lb_error_rec THEN
		CONTINUE
	END IF
	
	IF is_letter_type = "Verif" THEN
		//grap the name of the school, ins company etc.
		IF ids_letter.Describe( "entity_name.border" ) <> "!" THEN			
			ls_company = ids_letter.GetItemString( i, "entity_name" )							
		ELSEIF ids_letter.Describe( "entity.border" ) <> "!" THEN			
			ls_company = ids_letter.GetItemString( i, "entity" )							
		ELSEIF ids_letter.Describe( "address_lookup_entity_name.border" ) <> "!" THEN			
			ls_company = ids_letter.GetItemString( i, "address_lookup_entity_name" )			
		ELSE
			MessageBox("Support", "The " + ids_letter.DataObject + " data object does not have an entity_name field in it.  Call support." )
			Return -1
		END IF
		
		//grap the name of the contact person at the school, ins company etc.
		IF ids_letter.Describe( "contact_name.border" ) <> "!" THEN			
			ls_recipient = ids_letter.GetItemString( i, "contact_name" )							
		ELSEIF ids_letter.Describe( "address_lookup_contact_name.border" ) <> "!" THEN			
			ls_recipient = ids_letter.GetItemString( i, "address_lookup_contact_name" )			
		ELSE
			//--------------------------- APPEON BEGIN ---------------------------
			//$<modify> 2007.08.31 By: Jack
			//$<reason> Fix a defect.
			/*
			MessageBox("Support", "The " + ids_letter.DataObject + " data object does not have contact_name field in it.  Call support." )
			*/
 			MessageBox("Support", "The " + ids_letter.DataObject + " data object does not have a contact_name field in it.  Call support." )
			//---------------------------- APPEON END ----------------------------
			Return -1				
		END IF
		//if the address lookup table does not have a contact then put "no data".
		IF IsNull( ls_recipient ) OR ls_recipient = "" THEN
			ls_recipient = "No Data"
		END IF
		
	ELSE
		//grap the name of the practitioner if its a corro or exp or exp appoint letter
		IF ids_letter.Describe( "v_full_name_full_name.border" ) <> "!" THEN						
			ls_recipient = ids_letter.GetItemString( i, "v_full_name_full_name" )
			ls_company = ""				
		ELSEIF ids_letter.Describe( "full_name.border" ) <> "!" THEN						
			ls_recipient = ids_letter.GetItemString( i, "full_name" )
			ls_company = ""			
		ELSE
			//--------------------------- APPEON BEGIN ---------------------------
			//$<modify> 2007.08.31 By: Jack
			//$<reason> Fix a defect.
			/*
			MessageBox("Support", "The " + ids_letter.DataObject + " data object does not have FULL NAME field in it.  Call support." )
			*/
 			MessageBox("Support", "The " + ids_letter.DataObject + " data object does not have a FULL NAME field in it.  Call support." )
			//---------------------------- APPEON END ----------------------------
			Return -1								
		END IF
	END IF

	//grap the fax address.  Could be from the prac address or the address lookup table
	IF ids_letter.Describe( "fax.border" ) <> "!" THEN
		ls_fax =  ids_letter.GetItemString( i, "fax" )
	ELSEIF ids_letter.Describe( "pd_address_fax.border" ) <> "!" THEN
		ls_fax =  ids_letter.GetItemString( i, "pd_address_fax" )
	ELSEIF ids_letter.Describe( "address_lookup_fax.border" ) <> "!" THEN
		ls_fax =  ids_letter.GetItemString( i, "address_lookup_fax" )
	ELSE
		MessageBox("Support", "The " + ids_letter.DataObject + " data object does not have an email_address field in it.  Call support." )
		Return -1
	END IF				

	li_attach_cnt = 1

   
	
	// mskinner 15 Dec 2005 -- begin
	of_get_documents(ls_attachments, "_" + String( i ))
	
   /*
	//NEED TO DO SOMETHING WITH SORTING BY DOC ID THEN LINKING TO fax_1, fax_2
	ls_attachments[ li_attach_cnt ] = gs_dir_path + gs_DefDirName + "\Fax\fax_" + String( i ) + ".doc"

	IF FileExists( gs_dir_path + gs_DefDirName + "\Fax\fax_a_" + String( i ) + ".tif" ) THEN
		li_attach_cnt++
		ls_attachments[ li_attach_cnt ] = gs_dir_path + gs_DefDirName + "\Fax\fax_a_" + String( i ) + ".tif"	
	END IF
	
	IF FileExists( gs_dir_path + gs_DefDirName + "\Fax\app_" + String( i ) + ".tif" ) THEN
		li_attach_cnt++
		ls_attachments[ li_attach_cnt ] = gs_dir_path + gs_DefDirName + "\Fax\app_" + String( i ) + ".tif"			
	END IF			
	*/
	
	// mskinner 15 Dec 2005 -- end 
	String ls_errtext
	IF nv_fax.of_fax( ls_recipient, ls_company, ls_fax, is_subject, is_cover_message, ls_attachments, is_cover_page,ls_errtext )	= -1 THEN
		Messagebox('Fax Send',ls_errtext)
		Return -1
	END IF
END FOR


//structure to return array of records in error

IF UpperBound( il_error_rec_num ) = 0 THEN
	il_error_rec_num[1] = -5
END IF

lst_fax_error_records.il_error_rec_num = il_error_rec_num[]

//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 11/02/2007 By: Ken.Guo
//$<reason> Maybe PB Bug,So create this event to post close this window.
//CloseWithReturn( This, lst_fax_error_records)
Post Event ue_post_closewithreturn(lst_fax_error_records)
//---------------------------- APPEON END ----------------------------


Return 0
end function

public function integer of_print_image_document (string as_print_to);String ls_image_path
Boolean lb_print_label
Boolean lb_print_priv
Boolean lb_print_release
Boolean lb_error_rec
Integer li_error_cnt
Integer s
Integer e
Integer li_to_page
Integer li_rc
Integer li_image_cnt
Integer li_start_page
Integer li_num_pages
Long ll_prac_id
String ls_image_file_name
String ls_letter_path
String ls_letter_dw
String ls_word_path,ls_Rtn
		
IF cbx_mail.Checked THEN
	lb_print_label = True
END IF
IF cbx_priv.Checked THEN
	lb_print_priv = True
END IF
IF cbx_release.Checked THEN
	lb_print_release = True
END IF		

//get image path
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-01
//$<modify> 02.20.2006 By: Rodger Wu
//$<reason> Performance tuning
//$<modification> Write script to retrieve data from a cache instead of from the database.

/*
SELECT ids.imaging_path  
INTO :ls_image_path  
FROM ids  ;
IF SQLCA.SQLCODE = -1 THEN
	MessageBox("Database Error", SQLCA.SQLERRTEXT )
	Return -1
END IF
*/

ls_image_path = gnv_data.of_GetItem( "ids", "imaging_path", False )
//---------------------------- APPEON END ----------------------------

li_rc = ids_letter.RowCount( )
li_error_cnt = UpperBound( il_error_rec_num )

//loop through and print images

//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 06.08.2006 By: Rodger Wu
//$<modification> Use a variable to determine: if Store to DB is selected, new script will be executed to downlaod
//$<modification> images from database; otherwise, the original PB script will be executed.

/*
IF lb_print_priv = True OR lb_print_release = True THEN
	FOR s = 1 TO li_rc
		
		lb_error_rec = False
		FOR e = 1 TO li_error_cnt
			IF il_error_rec_num[e] = s THEN
				lb_error_rec = True
				Exit
			END IF
		END FOR
		IF lb_error_rec THEN
			CONTINUE
		END IF

		//create blank tif file for attachments
		// mskinner 17 Aug 2005 -- begin
		inv_filesrv =  create n_cst_filesrvwin32
		IF NOT inv_filesrv.of_DirectoryExists(gs_dir_path + gs_DefDirName + "\Fax") THEN
         inv_filesrv.of_CreateDirectory(gs_dir_path + gs_DefDirName + "\Fax")
      END IF
		// mskinner 17 Aug 2005 -- end
				
		ole_admin.object.Image( gs_dir_path + gs_DefDirName + "\Fax\" + "fax_a_" + String(s) + ".tif" )						
		
		ll_prac_id = ids_letter.GetItemNumber( s, "prac_id" )	
		
		ls_image_file_name = ls_image_path + String( ll_prac_id ) + ".tif"
		
		IF NOT FileExists( ls_image_file_name ) THEN
			MessageBox( "No Image", "You do not have any images scanned for practitioner ( " + String( ll_prac_id ) + " )")
			CONTINUE
		END IF		

		ole_print.object.Image( ls_image_file_name )
		ole_print.object.Display()
		
		li_image_cnt = ole_print.object.pagecount()
		IF lb_print_release THEN
			SELECT pd_images.tif_start_page,   
			       pd_images.num_pages  
	   	INTO :li_start_page,   
   	   	  :li_num_pages  
			FROM pd_images  
			WHERE ( pd_images.prac_id = :ll_prac_id ) AND  
			      ( pd_images.active_status = 1 ) AND  
	      		( pd_images.image_type_id = 1 )   ;
			if li_start_page < 1 or isnull(li_start_page) then //maha 112904 added trap for no start page
				MessageBox( "Image/Data mismatch", "The image data has no start page for the Release Form.  Unable to print Release Image for pracitioner id ( " + String( ll_prac_id ) + " )" )
				continue
			end if
			li_to_page = li_start_page + li_num_pages -1
			IF SQLCA.SQLCODE = 0 THEN
				if li_to_page > li_image_cnt then //trap added maha 021904
					MessageBox( "File/Data mismatch", "The image data does not match the  " + ls_image_path +  String( ll_prac_id ) + ".tif file. " +&
									"The Release Form for practitioner (" + String( ll_prac_id ) + ") can not be printed." )
				else
					IF as_print_to = "File" THEN
						//if faxing then append release to new file
						ole_admin.object.Append( ls_image_file_name, li_start_page , li_num_pages  )									
					ELSE
						ole_print.object.PrintImage( li_start_page, li_to_page, 3)
					END IF
				end if									
			ELSE
				MessageBox( "No Image", "There is no Release Form for pracitioner id ( " + String( ll_prac_id ) + " )" )											
			END IF
		END IF
				
		IF lb_print_priv THEN
			SELECT pd_images.tif_start_page,   
		          pd_images.num_pages  
   		INTO :li_start_page,   
   	  		  :li_num_pages  
		   FROM pd_images  
		  	WHERE ( pd_images.prac_id = :ll_prac_id ) AND  
		         ( pd_images.active_status = 1 ) AND  
   	  			( pd_images.image_type_id = 2 )   ;
					  
			if li_start_page < 1 or isnull(li_start_page) then //maha 112904 added trap for no start page
				MessageBox( "Image/Data mismatch", "The image data has no start page for the Privileges.  Unable to print Privileges Image for pracitioner id ( " + String( ll_prac_id ) + " )" )
				continue
			end if
			li_to_page = li_start_page + li_num_pages -1
			IF SQLCA.SQLCODE = 0 THEN
				if li_to_page > li_image_cnt then //trap added maha 021904
					MessageBox( "File/Data mismatch", "The image data does not match the  " + ls_image_path +  String( ll_prac_id ) + ".tif file. " +&
									"The Privilege List Form for practitioner (" + String( ll_prac_id ) + ") can not be printed." )
				else
					IF as_print_to = "File" THEN
						//if faxing then append privs to new file						
						ole_admin.object.Append( ls_image_file_name, li_start_page , li_num_pages  )									
					ELSE
						ole_print.object.PrintImage( li_start_page, li_to_page, 3)
					END IF
				end if								
			ELSE
				MessageBox( "No Image", "There is no Privilege List Form for practitioner id( " + String( ll_prac_id ) + " )" )																	
			END IF
		END IF						
	END FOR
END IF
*/

Integer li_image_storage_type, li_print_release_image, li_print_priv

li_image_storage_type = Integer(gnv_data.of_getitem( "icred_settings", "image_storage_type", FALSE))
IF Isnull(li_image_storage_type) THEN li_image_storage_type = 0

if li_image_storage_type = 1 then//Get image from database;
	IF lb_print_priv = True OR lb_print_release = True THEN
		FOR s = 1 TO li_rc
			
			lb_error_rec = False
			FOR e = 1 TO li_error_cnt
				IF il_error_rec_num[e] = s THEN
					lb_error_rec = True
					Exit
				END IF
			END FOR
			IF lb_error_rec THEN
				CONTINUE
			END IF
	
			//create blank tif file for attachments
			// mskinner 17 Aug 2005 -- begin
			inv_filesrv =  create n_cst_filesrvwin32
			IF NOT inv_filesrv.of_DirectoryExists(gs_dir_path + gs_DefDirName + "\Fax") THEN
				inv_filesrv.of_CreateDirectory(gs_dir_path + gs_DefDirName + "\Fax")
			END IF
			// mskinner 17 Aug 2005 -- end
			//--------------------------- APPEON BEGIN ---------------------------
			//$<Add> 08.22.2007 By: Evan
			//$<Reason> Need to destroy object.
			if IsValid(inv_filesrv) then Destroy inv_filesrv
			//---------------------------- APPEON END ----------------------------

			ole_admin.object.Image( gs_dir_path + gs_DefDirName + "\Fax\" + "fax_a_" + String(s) + ".tif" )						
			
			ll_prac_id = ids_letter.GetItemNumber( s, "prac_id" )	
			
			/*ls_image_file_name = ls_image_path + String( ll_prac_id ) + ".tif"
			
			IF NOT FileExists( ls_image_file_name ) THEN
				MessageBox( "No Image", "You do not have any images scanned for practitioner ( " + String( ll_prac_id ) + " )")
				CONTINUE
			END IF*/
	
			IF lb_print_release THEN
				if of_retrieve_image_from_db( 1, 1, ll_prac_id ) = 1 then
					//Start Code Change ---- 08.10.2007 #V7 maha changed path added error message
					ls_image_file_name = gs_dir_path + gs_DefDirName + "\Images\temp.tif" 
					if not fileexists(ls_image_file_name) then
						messagebox("Printing Release Image", "Cannot find file " + ls_image_file_name + " to print.  Call Support")
						return -1
					end if
					//End Code Change---08.10.2007
					ole_print.object.Image( ls_image_file_name )
					ole_print.object.Display()
					li_image_cnt = ole_print.object.pagecount()
					
					SELECT pd_images.tif_start_page,   
							 pd_images.num_pages  
					INTO :li_start_page,   
						  :li_num_pages  
					FROM pd_images  
					WHERE ( pd_images.prac_id = :ll_prac_id ) AND  
							( pd_images.active_status = 1 ) AND  
							( pd_images.image_type_id = 1 )   ;
					if li_start_page < 1 or isnull(li_start_page) then //maha 112904 added trap for no start page
						//MessageBox( "Image/Data mismatch", "The image data has no start page for the Release Form.  Unable to print Release Image for pracitioner id ( " + String( ll_prac_id ) + " )" )
    					MessageBox( "Image/Data mismatch", "The image data has no start page for the Release Form.  Unable to print Release Image for practitioner id ( " + String( ll_prac_id ) + " )" )
						continue
					end if
					li_to_page = li_start_page + li_num_pages -1
					IF SQLCA.SQLCODE = 0 THEN
						if li_to_page > li_image_cnt then //trap added maha 021904
							MessageBox( "File/Data mismatch", "The image data does not match the  " + ls_image_path +  String( ll_prac_id ) + ".tif file. " +&
											"The Release Form for practitioner (" + String( ll_prac_id ) + ") can not be printed." )
						else
							IF as_print_to = "File" THEN
								//if faxing then append release to new file
								//--------------------------- APPEON BEGIN ---------------------------
								//$<add> 07/09/2007 By: Ken.Guo
								//$<reason> When Image Admin Merge(Append) file, The first image file must be in TIF format, Otherwise PB will runerror.
								If ole_admin.object.pagecount() > 0 and ole_admin.object.FileType <> 1 Then
									Messagebox('Image','The first image file must be in "TIF" format.')
									Return -1			
								End If
								//---------------------------- APPEON END ----------------------------
								
								//--------------------------- APPEON BEGIN ---------------------------
								//$< Add  > 2008-07-15 By: Scofield
								//$<Reason> Verify if the directory has write right for the current user.
								
								ls_Rtn = f_ExaWriteRight(ls_image_file_name)
								if Len(ls_Rtn) > 0 then
									MessageBox(gnv_app.iapp_object.DisplayName,ls_Rtn,Exclamation!)
									Return -1
								end if
								//---------------------------- APPEON END ----------------------------
								ole_admin.object.Append( ls_image_file_name, li_start_page , li_num_pages  )									
							ELSE
								ole_print.object.PrintImage( li_start_page, li_to_page, 3)
							END IF
						end if									
					ELSE
						//MessageBox( "No Image", "There is no Release Form for pracitioner id ( " + String( ll_prac_id ) + " )" )											
    					MessageBox( "No Image", "There is no Release Form for practitioner id ( " + String( ll_prac_id ) + " )" )           
					END IF
				else
					//MessageBox( "No Image", "There is no Release Form for pracitioner id ( " + String( ll_prac_id ) + " )" )
   				MessageBox( "No Image", "There is no Release Form for practitioner id ( " + String( ll_prac_id ) + " )" )
				end if
			END IF
					
			IF lb_print_priv THEN
				if of_retrieve_image_from_db( 1, 2, ll_prac_id ) = 1 then
					//Changed path and added error message By Ken.Guo 09-17-2008.
					ls_image_file_name = gs_dir_path + gs_DefDirName + "\Images\temp.tif" 
					if not fileexists(ls_image_file_name) then
						messagebox("Printing Privilege Image", "Cannot find file " + ls_image_file_name + " to print.  Call Support")
						return -1
					end if					
					ole_print.object.Image( ls_image_file_name )
					ole_print.object.Display()
					li_image_cnt = ole_print.object.pagecount()
					
					SELECT pd_images.tif_start_page,   
							 pd_images.num_pages  
					INTO :li_start_page,   
						  :li_num_pages  
					FROM pd_images  
					WHERE ( pd_images.prac_id = :ll_prac_id ) AND  
							( pd_images.active_status = 1 ) AND  
							( pd_images.image_type_id = 2 )   ;
							  
					if li_start_page < 1 or isnull(li_start_page) then //maha 112904 added trap for no start page
						//MessageBox( "Image/Data mismatch", "The image data has no start page for the Privileges.  Unable to print Privileges Image for pracitioner id ( " + String( ll_prac_id ) + " )" )
    					MessageBox( "Image/Data mismatch", "The image data has no start page for the Privileges.  Unable to print Privileges Image for practitioner id ( " + String( ll_prac_id ) + " )" )
						continue
					end if
					li_to_page = li_start_page + li_num_pages -1
					IF SQLCA.SQLCODE = 0 THEN
						if li_to_page > li_image_cnt then //trap added maha 021904
							MessageBox( "File/Data mismatch", "The image data does not match the  " + ls_image_path +  String( ll_prac_id ) + ".tif file. " +&
											"The Privilege List Form for practitioner (" + String( ll_prac_id ) + ") can not be printed." )
						else
							IF as_print_to = "File" THEN
								//if faxing then append privs to new file	
								//--------------------------- APPEON BEGIN ---------------------------
								//$<add> 07/09/2007 By: Ken.Guo
								//$<reason> When Image Admin Merge file, The first image file must be in TIF format, Otherwise PB will runerror.
								If ole_admin.object.pagecount() > 0 and ole_admin.object.FileType <> 1 Then
									Messagebox('Image','The first image file must be in "TIF" format.')
									Return -1			
								End If
								//---------------------------- APPEON END ----------------------------
								//--------------------------- APPEON BEGIN ---------------------------
								//$< Add  > 2008-07-15 By: Scofield
								//$<Reason> Verify if the directory has write right for the current user.
								
								ls_Rtn = f_ExaWriteRight(ls_image_file_name)
								if Len(ls_Rtn) > 0 then
									MessageBox(gnv_app.iapp_object.DisplayName,ls_Rtn,Exclamation!)
									Return -1
								end if
								//---------------------------- APPEON END ----------------------------
								ole_admin.object.Append( ls_image_file_name, li_start_page , li_num_pages  )									
							ELSE
								ole_print.object.PrintImage( li_start_page, li_to_page, 3)
							END IF
						end if								
					ELSE
						MessageBox( "No Image", "There is no Privilege List Form for practitioner id( " + String( ll_prac_id ) + " )" )																	
					END IF
				else
					MessageBox( "No Image", "There is no Privilege List Form for practitioner id( " + String( ll_prac_id ) + " )" )
				end if
			END IF						
		END FOR
	END IF
else
	IF lb_print_priv = True OR lb_print_release = True THEN
		FOR s = 1 TO li_rc
			
			lb_error_rec = False
			FOR e = 1 TO li_error_cnt
				IF il_error_rec_num[e] = s THEN
					lb_error_rec = True
					Exit
				END IF
			END FOR
			IF lb_error_rec THEN
				CONTINUE
			END IF
	
			//create blank tif file for attachments
			// mskinner 17 Aug 2005 -- begin
			inv_filesrv =  create n_cst_filesrvwin32
			IF NOT inv_filesrv.of_DirectoryExists(gs_dir_path + gs_DefDirName + "\Fax") THEN
				inv_filesrv.of_CreateDirectory(gs_dir_path + gs_DefDirName + "\Fax")
			END IF
			// mskinner 17 Aug 2005 -- end
			//--------------------------- APPEON BEGIN ---------------------------
			//$<Add> 08.22.2007 By: Evan
			//$<Reason> Need to destroy object.
			if IsValid(inv_filesrv) then Destroy inv_filesrv
			//---------------------------- APPEON END ----------------------------
			
			ole_admin.object.Image( gs_dir_path + gs_DefDirName + "\Fax\" + "fax_a_" + String(s) + ".tif" )						
			
			ll_prac_id = ids_letter.GetItemNumber( s, "prac_id" )	
			
			ls_image_file_name = ls_image_path + String( ll_prac_id ) + ".tif"
			
			IF NOT FileExists( ls_image_file_name ) THEN
				MessageBox( "No Image", "You do not have any images scanned for practitioner ( " + String( ll_prac_id ) + " )")
				CONTINUE
			END IF		
	
			ole_print.object.Image( ls_image_file_name )
			ole_print.object.Display()
			
			li_image_cnt = ole_print.object.pagecount()
			IF lb_print_release THEN
				SELECT pd_images.tif_start_page,   
						 pd_images.num_pages  
				INTO :li_start_page,   
					  :li_num_pages  
				FROM pd_images  
				WHERE ( pd_images.prac_id = :ll_prac_id ) AND  
						( pd_images.active_status = 1 ) AND  
						( pd_images.image_type_id = 1 )   ;
				if li_start_page < 1 or isnull(li_start_page) then //maha 112904 added trap for no start page
					//MessageBox( "Image/Data mismatch", "The image data has no start page for the Release Form.  Unable to print Release Image for pracitioner id ( " + String( ll_prac_id ) + " )" )
   				MessageBox( "Image/Data mismatch", "The image data has no start page for the Release Form.  Unable to print Release Image for practitioner id ( " + String( ll_prac_id ) + " )" )
					continue
				end if
				li_to_page = li_start_page + li_num_pages -1
				IF SQLCA.SQLCODE = 0 THEN
					if li_to_page > li_image_cnt then //trap added maha 021904
						MessageBox( "File/Data mismatch", "The image data does not match the  " + ls_image_path +  String( ll_prac_id ) + ".tif file. " +&
										"The Release Form for practitioner (" + String( ll_prac_id ) + ") can not be printed." )
					else
						IF as_print_to = "File" THEN
							//if faxing then append release to new file
							//--------------------------- APPEON BEGIN ---------------------------
							//$<add> 07/09/2007 By: Ken.Guo
							//$<reason> When Image Admin Merge file, The first image file must be in TIF format, Otherwise PB will runerror.
							If ole_admin.object.pagecount() > 0 and ole_admin.object.FileType <> 1 Then
								Messagebox('Image','The first image file must be in "TIF" format.')
								Return -1			
							End If
							//---------------------------- APPEON END ----------------------------
							
							//--------------------------- APPEON BEGIN ---------------------------
							//$< Add  > 2008-07-15 By: Scofield
							//$<Reason> Verify if the directory has write right for the current user.
							
							ls_Rtn = f_ExaWriteRight(ls_image_file_name)
							if Len(ls_Rtn) > 0 then
								MessageBox(gnv_app.iapp_object.DisplayName,ls_Rtn,Exclamation!)
								Return -1
							end if
							//---------------------------- APPEON END ----------------------------
							ole_admin.object.Append( ls_image_file_name, li_start_page , li_num_pages  )									
						ELSE
							ole_print.object.PrintImage( li_start_page, li_to_page, 3)
						END IF
					end if									
				ELSE
					//MessageBox( "No Image", "There is no Release Form for pracitioner id ( " + String( ll_prac_id ) + " )" )											
   				MessageBox( "No Image", "There is no Release Form for practitioner id ( " + String( ll_prac_id ) + " )" )           
				END IF
			END IF
					
			IF lb_print_priv THEN
				SELECT pd_images.tif_start_page,   
						 pd_images.num_pages  
				INTO :li_start_page,   
					  :li_num_pages  
				FROM pd_images  
				WHERE ( pd_images.prac_id = :ll_prac_id ) AND  
						( pd_images.active_status = 1 ) AND  
						( pd_images.image_type_id = 2 )   ;
						  
				if li_start_page < 1 or isnull(li_start_page) then //maha 112904 added trap for no start page
					//MessageBox( "Image/Data mismatch", "The image data has no start page for the Privileges.  Unable to print Privileges Image for pracitioner id ( " + String( ll_prac_id ) + " )" )
   				MessageBox( "Image/Data mismatch", "The image data has no start page for the Privileges.  Unable to print Privileges Image for practitioner id ( " + String( ll_prac_id ) + " )" )
					continue
				end if
				li_to_page = li_start_page + li_num_pages -1
				IF SQLCA.SQLCODE = 0 THEN
					if li_to_page > li_image_cnt then //trap added maha 021904
						MessageBox( "File/Data mismatch", "The image data does not match the  " + ls_image_path +  String( ll_prac_id ) + ".tif file. " +&
										"The Privilege List Form for practitioner (" + String( ll_prac_id ) + ") can not be printed." )
					else
						IF as_print_to = "File" THEN
							//if faxing then append privs to new file		
							//--------------------------- APPEON BEGIN ---------------------------
							//$<add> 07/09/2007 By: Ken.Guo
							//$<reason> When Image Admin Merge file, The first image file must be in TIF format, Otherwise PB will runerror.
							If ole_admin.object.pagecount() > 0 and ole_admin.object.FileType <> 1 Then
								Messagebox('Image','The first image file must be in "TIF" format.')
								Return -1			
							End If
							//---------------------------- APPEON END ----------------------------
							
							//--------------------------- APPEON BEGIN ---------------------------
							//$< Add  > 2008-07-15 By: Scofield
							//$<Reason> Verify if the directory has write right for the current user.
							
							ls_Rtn = f_ExaWriteRight(ls_image_file_name)
							if Len(ls_Rtn) > 0 then
								MessageBox(gnv_app.iapp_object.DisplayName,ls_Rtn,Exclamation!)
								Return -1
							end if
							//---------------------------- APPEON END ----------------------------
							ole_admin.object.Append( ls_image_file_name, li_start_page , li_num_pages  )									
						ELSE
							ole_print.object.PrintImage( li_start_page, li_to_page, 3)
						END IF
					end if								
				ELSE
					MessageBox( "No Image", "There is no Privilege List Form for practitioner id( " + String( ll_prac_id ) + " )" )																	
				END IF
			END IF						
		END FOR
	END IF
end if
//---------------------------- APPEON END ----------------------------

IF lb_print_label THEN
	
	//	ls_word_path = ProfileString( gs_dir_path + gs_DefDirName + "\intellicred.ini", "paths", "word", "None" )
	//	IF NOT FileExists( gs_dir_path + gs_DefDirName + "\intellicred.ini" ) THEN
	//		MessageBox("ini File Error", "No intellicred.ini file found at: " + gs_dir_path + gs_DefDirName + "\intellicred.ini" )
	//		Return -1
	//	END IF
		
		///Run( ls_word_path + " " +  is_mail_label_doc, Maximized!)								
		
		// mskinner start
		
	// MSKINNER 06 JAN 2005 -- BEGIN
	//--------------------------- APPEON BEGIN ---------------------------
	//$<add> 06.08.2006 By: Rodger Wu
	//$<reason> download the file from Database.
	if Len( Trim( is_mail_label_doc )) = 0 then return 0
	
	If gnv_data.of_getitem('icred_settings' ,'set_50' , False ) = '1' or &
		Upper( appeongetclienttype() ) = 'WEB' Then
		
		//Mail labels :Store the letter_path in variable from facility_id = 1
		n_appeon_storage_area lnv_storage_area
		IF lnv_storage_area.of_retrieve_doc_from_db( 1, is_mail_label_doc, ls_letter_path) < 0 THEN
			Messagebox("Download File",'The MSWord document '+  is_mail_label_doc  +'  does not exist in the database.')
			RETURN -1
		END IF
		is_mail_label_doc = ls_letter_path + is_mail_label_doc
	End If
	//---------------------------- APPEON END ----------------------------

	CHOOSE CASE  gi_citrix
		CASE 0  //NO CITRIX
			ls_image_path = gs_dir_path + gs_DefDirName + "\letters\data\ind_generic_corrospondence.txt" 
		CASE 1 //CITRIX
			ls_image_path = gs_dir_path + gs_DefDirName + "\letters\standard\" + gs_user_id + "\ind_generic_corrospondence.txt"
	END CHOOSE 
	
	//--------------------------- APPEON BEGIN ---------------------------
	//$<add> 03/25/2008 By: Ken.Guo
	//$<reason> Fix BugK032501
	//$ Merge datasource file maybe other file(e.g. "case_review_committee.txt","net_dev_ai.txt" ext.) 
	//$ When print letter from w_letter_generator.
	If Len(is_merge_file_path) > 1 Then
		ls_image_path = is_merge_file_path
	End If
	//---------------------------- APPEON END ----------------------------
	
	gnv_app.gnvlo_msword.of_open_word_document(is_mail_label_doc, ls_image_path,'')
END IF		

// MSKINNER 06 JAN 2005 -- BEGIN


Return 0
end function

public function integer of_email (boolean ab_error_checking);//Jervis 12-10-2008
//This function is obsolete.  DO NOT USE THIS FUNCTION

Boolean lb_error_rec
String ls_facility_name
String ls_full_name
String ls_attachments[]
//--------------------------- APPEON BEGIN ---------------------------
//$<add> 08.08.2006 By: LeiWei
//$<reason> Fix a defect.
String ls_attachments_null[]
//---------------------------- APPEON END ----------------------------
String ls_recipient
String ls_company
string ls_column
String ls_email
String ls_lookup_entity_name
String ls_no_email
Integer li_attach_cnt
Integer e
Integer li_nr
Integer li_error
Integer li_error_cnt
Long li_rc
Long i
Long f
Long ChanNum
gs_pass_ids  lg_pass_ids
gs_fax_error_records lst_email_error_records

ib_faxing_doc = False

//IF all letter records were missing email numbers then return with -2 or Cancel
IF UpperBound( il_error_rec_num ) = ids_letter.RowCount( ) THEN
	lst_email_error_records.il_error_rec_num[1] = -2
	CloseWithReturn( This, lst_email_error_records  )
END IF

li_rc = ids_letter.RowCount( )

//preprocess list to make sure the appropriate info is there to email
IF ab_error_checking THEN
	FOR i = 1 TO li_rc
		IF is_letter_type = "Verif" THEN
			//grap the name of the school, ins company etc.
			IF ids_letter.Describe( "entity_name.border" ) <> "!" THEN			
				ls_company = ids_letter.GetItemString( i, "entity_name" )							
			ELSEIF ids_letter.Describe( "entity.border" ) <> "!" THEN			
				ls_company = ids_letter.GetItemString( i, "entity" )							
			ELSEIF ids_letter.Describe( "address_lookup_entity_name.border" ) <> "!" THEN			
				ls_company = ids_letter.GetItemString( i, "address_lookup_entity_name" )			
			ELSE
				MessageBox("Support", "The " + ids_letter.DataObject + " data object does not have an entity_name field in it.  Call support." )
				Return -1
			END IF
			//grap the name of the contact person at the school, ins company etc.
			IF ids_letter.Describe( "contact_name.border" ) <> "!" THEN			
				ls_recipient = ids_letter.GetItemString( i, "contact_name" )							
			ELSEIF ids_letter.Describe( "address_lookup_contact_name.border" ) <> "!" THEN			
				ls_recipient = ids_letter.GetItemString( i, "address_lookup_contact_name" )			
			ELSE
				//MessageBox("Support", "The " + ids_letter.DataObject + " data object does not have contact_name field in it.  Call support." )
  				MessageBox("Support", "The " + ids_letter.DataObject + " data object does not have a contact_name field in it.  Call support." )
				Return -1				
			END IF
		ELSE
			//grap the name of the practitioner if its a corro or exp or exp appoint letter
			IF ids_letter.Describe( "v_full_name_full_name.border" ) <> "!" THEN						
				ls_recipient = ids_letter.GetItemString( i, "v_full_name_full_name" )
				ls_company = ""				
			ELSEIF ids_letter.Describe( "full_name.border" ) <> "!" THEN						
				ls_recipient = ids_letter.GetItemString( i, "full_name" )
				ls_company = ""			
			ELSE
				//MessageBox("Support", "The " + ids_letter.DataObject + " data object does not have FULL NAME field in it.  Call support." )
  				MessageBox("Support", "The " + ids_letter.DataObject + " data object does not have a FULL NAME field in it.  Call support." )
				Return -1								
			END IF
		END IF
      /////////////////////////////////////////////////////////////////////////////////////////////
		//grab tbe email address.  Could be from the prac address or the address lookup table
		/////////////////////////////////////////////////////////////////////////////////////////////
		
		// start code change --- 11.01.2005 MSKINNER
		//--------------------------- APPEON BEGIN ---------------------------
		//$<modify> 08.15.2006 By: LeiWei
		//$<reason> Fix a defect.
		/*
		string ls_column
		ls_column = ids_letter.of_get_column_name("email_address")
		if len(ls_column) > 0 then
			ls_email =  ids_letter.GetItemString( i, ls_column )
			 if not f_validstr(ls_email) then
				ls_column = ids_letter.of_get_column_name("e_mail_address")
				if len(ls_column) > 0 then
					ls_email =  ids_letter.GetItemString( i, ls_column )
				end if 
			end if
		*/
//Start Code Change ---- 10.04.2006 #683 maha  rewrote slightly
//		IF ids_letter.Describe("email_address.name") = "email_address" THEN
//			ls_email =  ids_letter.GetItemString( i, "email_address" )
//			 if not f_validstr(ls_email) then
//				IF ids_letter.Describe("e_mail_address.name") = "e_mail_address" THEN
//					ls_email =  ids_letter.GetItemString( i, "e_mail_address" )
//				end if 
//			end if
//		//---------------------------- APPEON END ----------------------------
//		else 
//			
//			MessageBox("Support", "The " + ids_letter.DataObject + " data object does not have an email_address field in it.  Call support." )
//		  Return -1
//			
//   		end if 
//		

		if ids_letter.Describe("email_address.ColType") = "!"	then
			if ids_letter.Describe("e_mail_address.ColType") = "!"	then
				if ids_letter.Describe("pd_address_e_mail_address.ColType") = "!"	then
					MessageBox("Support", "The " + ids_letter.DataObject + " data object does not have a field called 'email_address' or 'e_mail_address'.  Contact ContractLogix support to have this corrected for a later build.  You cannot email this letter type." )
					 Return -1
				else
					ls_column = "pd_address_e_mail_address"
				end if
			else
				ls_column = "e_mail_address"
			end if
		else 
			ls_column = "email_address"
		end if
		ls_email =  ids_letter.GetItemString( i, ls_column )
//End Code Change---10.04.2006
			
				
		//if its a corro letter then check to see if the prac address has a email number
		IF IsNull( ls_email ) OR ls_email = "" THEN
			IF ids_letter.Describe( "facility_facility_name.border" ) <> "!" THEN
				ls_facility_name = ids_letter.GetItemString( i, "facility_facility_name" )
			ELSEIF ids_letter.Describe( "facility_name.border" ) <> "!" THEN
				ls_facility_name = ids_letter.GetItemString( i, "facility_name" )
			ELSEIF ids_letter.Describe( "facility_return_facility_name.border" ) <> "!" THEN
				ls_facility_name = ids_letter.GetItemString( i, "facility_return_facility_name" )
			ELSE
				//MessageBox("Support", "The " + ids_letter.DataObject + " data object does not have an facility_name field in it.  Call support." )
  				MessageBox("Support", "The " + ids_letter.DataObject + " data object does not have a facility_name field in it.  Call support." )
				Return -1
			END IF
	
			//grab the full name field.
			IF ids_letter.Describe( "v_full_name_full_name.border" ) <> "!" THEN
				ls_full_name = ids_letter.GetItemString( i, "v_full_name_full_name" )
			ELSEIF ids_letter.Describe( "full_name.border" ) <> "!" THEN
				ls_full_name = ids_letter.GetItemString( i, "full_name" )		
			ELSE
				//MessageBox("Support", "The " + ids_letter.DataObject + " data object does not have an full_name field in it.  Call support." )
  				MessageBox("Support", "The " + ids_letter.DataObject + " data object does not have a full_name field in it.  Call support." )
				Return -1
			END IF
			
			IF ids_letter.Describe( "address_lookup_entity_name.border" ) <> "!" THEN
				ls_lookup_entity_name =  ids_letter.GetItemString( i, "address_lookup_entity_name" )
			ELSEIF ids_letter.Describe( "entity_name.border" ) <> "!" THEN
				ls_lookup_entity_name =  ids_letter.GetItemString( i, "entity_name" )
			ELSE
				ls_lookup_entity_name = "N/A"
			END IF			
			
			li_nr = dw_errors.InsertRow( 0 )
			
			li_error_cnt++
			il_error_rec_num[ li_error_cnt ] = i
			
			IF ls_lookup_entity_name <> "N/A" THEN
				st_text.Text = "The following lookup entity did not have an email address associated with it."
				dw_errors.Modify( "facility_name_t.text = 'Address Lookup Record'" )
				dw_errors.SetItem( li_nr, "facility_name", ls_lookup_entity_name )	
			ELSE
				st_text.Text = "The following practitioners did not have an email address in there address screen."				
				dw_errors.SetItem( li_nr, "facility_name", ls_facility_name )
			END IF			
			cb_continuefax.Text = "Email Pracs with email address."
			cb_cancelfax.Text = "Cancel Email" 			
			dw_errors.SetItem( li_nr, "full_name", ls_full_name )	
		END IF			
	END FOR	

	st_error_cnt.Text = "There was " + String( li_error_cnt ) + " out of " + String( li_rc ) + " records in error."

	IF li_error_cnt = li_rc THEN
		cb_continuefax.Enabled = False
		//--------------------------- APPEON BEGIN ---------------------------
		//$<comment> 2006-10-12 By: Liu Hongxin
		//$<reason> fail to send mail, it should change print status.
		/*
		cb_yes.Enabled = False
		*/
		//---------------------------- APPEON END ----------------------------
		cb_email.Enabled = False
	END IF

	IF dw_errors.RowCount( ) > 0 THEN
		w_ai_print_msg_box.Height = 1475
		Return -1
	END IF
	
	ab_error_checking	= False		
	
END IF

pfc_cst_nv_fax nv_email
nv_email = CREATE pfc_cst_nv_fax;

OpenWithParm( w_fax_win, is_letter_type + "-" + "Email")
IF Message.StringParm = "Cancel" THEN
	Return -1
END IF
lg_pass_ids = Message.PowerObjectParm

is_cover_page = lg_pass_ids.s_fax_cover
is_cover_message = lg_pass_ids.s_fax_message 
is_subject = lg_pass_ids.s_fax_subject	
	
//check to see if user wants to print attachments (release, priv stuff )
of_print_image_document( "File" )

IF ids_letter.DataObject = "d_ltr_expiring_appointment" OR  ids_letter.DataObject = "d_ltr_expiring_provisional" OR ids_letter.DataObject = "d_ltr_expiring_allied_health" THEN
	gi_burn_annos	= 1
	w_ai_print_letters_new.of_Print_Application( True )
	w_ai_print_letters_new.ib_app_faxed = True	
	gi_burn_annos	= 0	
END IF

li_error_cnt = UpperBound( il_error_rec_num )

FOR i = 1 TO li_rc
	//messagebox("loop count", i )	
	lb_error_rec = False
	FOR e = 1 TO li_error_cnt
		IF il_error_rec_num[e] = i THEN
			lb_error_rec = True
			Exit
		END IF
	END FOR
	IF lb_error_rec THEN
		CONTINUE
	END IF
	
	IF is_letter_type = "Verif" THEN
		//grap the name of the school, ins company etc.
		IF ids_letter.Describe( "entity_name.border" ) <> "!" THEN			
			ls_company = ids_letter.GetItemString( i, "entity_name" )							
		ELSEIF ids_letter.Describe( "entity.border" ) <> "!" THEN			
			ls_company = ids_letter.GetItemString( i, "entity" )							
		ELSEIF ids_letter.Describe( "address_lookup_entity_name.border" ) <> "!" THEN			
			ls_company = ids_letter.GetItemString( i, "address_lookup_entity_name" )			
		ELSE
			MessageBox("Support", "The " + ids_letter.DataObject + " data object does not have an entity_name field in it.  Call support." )
			Return -1
		END IF
		
		//grap the name of the contact person at the school, ins company etc.
		IF ids_letter.Describe( "contact_name.border" ) <> "!" THEN			
			ls_recipient = ids_letter.GetItemString( i, "contact_name" )							
		ELSEIF ids_letter.Describe( "address_lookup_contact_name.border" ) <> "!" THEN			
			ls_recipient = ids_letter.GetItemString( i, "address_lookup_contact_name" )			
		ELSE
			//MessageBox("Support", "The " + ids_letter.DataObject + " data object does not have contact_name field in it.  Call support." )
 			MessageBox("Support", "The " + ids_letter.DataObject + " data object does not have a contact_name field in it.  Call support." )
			Return -1				
		END IF
		//if the address lookup table does not have a contact then put "no data".
		IF IsNull( ls_recipient ) OR ls_recipient = "" THEN
			ls_recipient = "No Data"
		END IF
		
	ELSE
		//grap the name of the practitioner if its a corro or exp or exp appoint letter
		IF ids_letter.Describe( "v_full_name_full_name.border" ) <> "!" THEN						
			ls_recipient = ids_letter.GetItemString( i, "v_full_name_full_name" )
			ls_company = ""				
		ELSEIF ids_letter.Describe( "full_name.border" ) <> "!" THEN						
			ls_recipient = ids_letter.GetItemString( i, "full_name" )
			ls_company = ""			
		ELSE
			//MessageBox("Support", "The " + ids_letter.DataObject + " data object does not have FULL NAME field in it.  Call support." )
 			MessageBox("Support", "The " + ids_letter.DataObject + " data object does not have a FULL NAME field in it.  Call support." )
			Return -1								
		END IF
	END IF

	//grap the email address.  Could be from the prac address or the address lookup table
	IF ids_letter.Describe( "pd_address_e_mail_address.border" ) <> "!" THEN
		ls_email = ids_letter.GetItemString( i, "pd_address_e_mail_address" )
	ELSEIF ids_letter.Describe( "pd_address_email_address.border" ) <> "!" THEN
		ls_email = ids_letter.GetItemString( i, "pd_address_email_address" )
	ELSEIF ids_letter.Describe( "address_lookup_email_address.border" ) <> "!" THEN
		ls_email = ids_letter.GetItemString( i, "address_lookup_email_address" )
	END IF
	
	li_attach_cnt = 1
	
	//--------------------------- APPEON BEGIN ---------------------------
	//$<add> 08.08.2006 By: LeiWei
	//$<reason> Fix a defect.
	ls_attachments = ls_attachments_null
	//---------------------------- APPEON END ----------------------------

	// msskinner 15 Dec 2005 -- begin
	of_get_documents(ls_attachments, "_" + String( i ))
	/*
	//NEED TO DO SOMETHING WITH SORTING BY DOC ID THEN LINKING TO email_1, email_2
	ls_attachments[ li_attach_cnt ] = gs_dir_path + gs_DefDirName + "\fax\fax_" + String( i ) + ".doc"

	IF FileExists( gs_dir_path + gs_DefDirName + "\email\fax_a_" + String( i ) + ".tif" ) THEN
		li_attach_cnt++
		ls_attachments[ li_attach_cnt ] = gs_dir_path + gs_DefDirName + "\fax\fax_a_" + String( i ) + ".tif"	
	END IF
	
	IF FileExists( gs_dir_path + gs_DefDirName + "\fax\app_" + String( i ) + ".tif" ) THEN
		li_attach_cnt++
		ls_attachments[ li_attach_cnt ] = gs_dir_path + gs_DefDirName + "\fax\app_" + String( i ) + ".tif"			
	END IF			
	*/
	
	// msskinner 15 Dec 2005 -- end 
	IF nv_email.of_email( ls_recipient, ls_company, ls_email, is_subject, is_cover_message, ls_attachments, is_cover_page )	= -1 THEN
		//messagebox("", "returned -1" )
		Return -1
	END IF
END FOR


//structure to return array of records in error
// start code change --- 11.17.2005 MSKINNER
IF UpperBound( il_error_rec_num ) = 0 THEN
	il_error_rec_num[1] = -4   //-5
END IF
// end code change --- 11.17.2005 MSKINNER
lst_email_error_records.il_error_rec_num = il_error_rec_num[]

//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 11/02/2007 By: Ken.Guo
//$<reason> Maybe PB Bug,So create this event to post close this window.
//CloseWithReturn( This, lst_email_error_records)
Post Event ue_post_closewithreturn(lst_email_error_records)
//---------------------------- APPEON END ----------------------------

Return 0
end function

public function long of_get_documents (ref string as_docs[], string as_search);/******************************************************************************************************************
**  [PUBLIC]   : of_get_documents
**==================================================================================================================
**  Purpose   	: Gets all of the documents in the fax directory. The main.doc and mergeddoc.doc are remove
**==================================================================================================================
**  Arguments 	: [string]  as_search
**==================================================================================================================
**  Returns   	: [none]   
**==================================================================================================================
**  Notes     	: 	   
**==================================================================================================================
**  Created By	: Michael B. Skinner 03 November 2005  © Intellisoftgroup, Inc
**==================================================================================================================
**  Modification Log
**   Changed By             Change Date                                               Reason
** ------------------------------------------------------------------------------------------------------------------
********************************************************************************************************************/


Integer li_cnt, li_entries
String ls_import
String ls_currdir
long ll_i

SetPointer(HourGlass!)


ls_currdir = gs_dir_path + gs_DefDirName + "\Fax\*" + as_search + ".*"

//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 10/15/2007 By: Ken.Guo
//$<reason> Because of_print_image_document() destroy inv_filesrv,Need Create again.
//li_entries = inv_filesrv.of_DirList(ls_currdir, 0, lnv_dirlist)
If NOT isvalid(inv_filesrv) Then
	inv_filesrv =  create n_cst_filesrvwin32
End If
li_entries = inv_filesrv.of_DirList(ls_currdir, 0, lnv_dirlist)
If isvalid(inv_filesrv) Then Destroy inv_filesrv
//---------------------------- APPEON END ----------------------------

for ll_i = 1 to upperbound(lnv_dirlist)
   as_docs[upperbound(as_docs) + 1 ] = gs_dir_path + gs_DefDirName + "\Fax\" + lnv_dirlist[ll_i].is_filename
	//messagebox('',gs_dir_path + gs_DefDirName + "\Fax\" + lnv_dirlist[ll_i].is_filename)
next

SetPointer(arrow! )


return 0
end function

public function integer of_retrieve_image_from_db (integer ai_activestatus, integer ai_imagetypeid, long al_pracid);//////////////////////////////////////////////////////////////////////
// $<function>w_ai_print_msg_box.of_retrieve_image_from_db()
// $<arguments>
//		integer	ai_activestatus		
//		integer	ai_imagetypeid 		
//		long   	al_pracid      		
// $<returns> integer
// $<description> Get image file from pd_image.
//////////////////////////////////////////////////////////////////////
// $<add> 06.08.2006 by Rodger Wu
//////////////////////////////////////////////////////////////////////

Long li_filenum
Long ll_filelen
Long ll_bytes_written
Long ll_new_pos
Integer li_loops
Integer li_counter
Integer li_retval
Blob  lb_image_data
Blob blob_temp
Blob lb_tot_b
Blob total_blob
Blob blank_blob

//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 08.19.2006 By: LeiWei
//$<reason> Fix a defect.
/*
SELECTBLOB top 1 image_data
INTO :lb_image_data
FROM pd_images
WHERE prac_id = :al_pracid
AND active_status= :ai_activestatus
AND image_type_id = :ai_imagetypeid
USING SQLCA;
*/
IF appeongetclienttype() = 'PB' AND gs_dbtype = 'SQL' THEN
	of_get_image_pd_images1(al_pracid, ai_activestatus, ai_imagetypeid, lb_image_data)
ELSE
	SELECTBLOB image_data
	INTO :lb_image_data
	FROM pd_images
	WHERE prac_id = :al_pracid
	AND active_status= :ai_activestatus
	AND image_type_id = :ai_imagetypeid
	USING SQLCA;
END IF

//---------------------------- APPEON END ----------------------------

Choose Case SQLCA.SQLCODE
	Case -1
		MessageBox( "SQL ERROR", SQLCA.SQLERRTEXT )
		Return -1
	Case 100
		Return -1
End Choose

ll_filelen = Len( lb_image_data )

IF ll_filelen > 32765 THEN 
  	 IF Mod(ll_filelen,32765) = 0 THEN 
        li_loops = ll_filelen/32765 
    ELSE 
  	     li_loops = (ll_filelen/32765) + 1 
    END IF 
ELSE 
  	 li_loops = 1 
END IF 
//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 06.14.2007 By: Jack
//$<reason> Fix a defect.
/*
FileDelete( gs_dir_path + "temp.tif" )

li_filenum =  FileOpen( gs_dir_path + "temp.tif", StreamMode!, Write!, LockWrite!, Append!)
*/
string ls_file
ls_file = gs_dir_path + gs_DefDirName + "\Images\"
gnv_appeondll.of_parsepath(ls_file)
ls_file = ls_file + "temp.tif"

FileDelete( ls_file)
li_filenum =  FileOpen( ls_file, StreamMode!, Write!, LockWrite!, Append!)
//---------------------------- APPEON END ----------------------------

ll_new_pos = 1

IF li_filenum <> -1 THEN	
	//read the file ... 
	FOR li_counter = 1 to li_loops 
		 blob_temp = BlobMid( lb_image_data, ll_new_pos, 32765 )
   	 ll_bytes_written = FileWrite( li_filenum, blob_temp) 		 
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

	lb_image_data = total_blob
	
	FileClose( li_filenum )

ELSE
	MessageBox( "File Open Error", "Could not open snapshot.jpg for StreamMode!" )
	Return -	1
END IF

//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 06.14.2007 By: Jack
//$<reason> Fix a defect.
/*
IF Not FileExists( gs_dir_path + "temp.tif" ) THEN
	MessageBox("File Creation Error", "No image file created.  Check to make sure the directory " + gs_dir_path + " is valid." )
	Return -1;
END IF
*/
IF Not FileExists( ls_file ) THEN
	MessageBox("File Creation Error", "No image file created.  Check to make sure the directory " + gs_dir_path + gs_DefDirName + "\Images\  is valid." )
	Return -1;
END IF
//---------------------------- APPEON END ----------------------------
Return 1;
end function

public function integer of_fax_email (boolean ab_error_checking, string as_type);//Start Code Change ---- 12.13.06.2006 #V7 maha created to combine of_fax and of_email

Boolean lb_error_rec
String ls_facility_name
String ls_facility_field
String ls_full_name
String ls_name_field
String ls_attachments[]
String ls_attachments_null[]
String ls_recipient
String ls_company
String ls_company_field
String ls_contact_field
String ls_column
String ls_errfield
String ls_value
String ls_no_fax
String ls_lookup_entity_name
String ls_no_email
Integer li_attach_cnt
Integer e
Integer li_nr
Integer li_error
Integer li_error_cnt
Long li_rc
Long i
Long f
Long ChanNum
gs_pass_ids  lg_pass_ids
gs_fax_error_records lst_fax_error_records
gs_fax_error_records lst_email_error_records


//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 04/29/2008 By: Ken.Guo
//$<reason> cb_continuefax.clicked event need use this var.
//ib_faxing_doc = False
If as_type = "FAX" Then
	ib_faxing_doc = True
Else
	ib_faxing_doc = False
End If
//---------------------------- APPEON END ----------------------------


//IF all letter records were missing email numbers then return with -2 or Cancel
If UpperBound( il_error_rec_num ) = ids_letter.RowCount( ) Then
	lst_email_error_records.il_error_rec_num[1] = -2
	CloseWithReturn( This, lst_email_error_records  )
End If

li_rc = ids_letter.RowCount( )

//check for needed fields
//grab the field of the school, ins company etc.

If ids_letter.Describe( "entity_name.border" ) <> "!" Then
	ls_company_field =  "entity_name"
ElseIf ids_letter.Describe( "entity.border" ) <> "!" Then
	ls_company_field =  "entity"
ElseIf ids_letter.Describe( "address_lookup_entity_name.border" ) <> "!" Then
	ls_company_field =  "address_lookup_entity_name"
Else
	ls_company_field = "N/A"
End If



If is_letter_type = "Verif" Then
	//this test was adapted from the original of_email and has the original logic error that some verif letters may  
	// not require an entity_name field.
	If ls_company_field = "N/A" Then
		MessageBox("Support", "The " + ids_letter.DataObject + " data object does not have an entity_name field in it.  Call support." )
		Return -1
	End If
	
	//grab the name of the contact person at the school, ins company etc.
	If ids_letter.Describe( "contact_name.border" ) <> "!" Then
		ls_contact_field =  "contact_name"
	ElseIf ids_letter.Describe( "address_lookup_contact_name.border" ) <> "!" Then
		ls_contact_field = "address_lookup_contact_name"
	Else
		//MessageBox("Support", "The " + ids_letter.DataObject + " data object does not have contact_name field in it.  Call support." )
		MessageBox("Support", "The " + ids_letter.DataObject + " data object does not have a contact_name field in it.  Call support." )
		Return -1
	End If
Else
	//grab the name of the practitioner if its a corro or exp or exp appoint letter
	If ids_letter.Describe( "v_full_name_full_name.border" ) <> "!" Then
		ls_contact_field = "v_full_name_full_name"
		//ls_company = ""				
	ElseIf ids_letter.Describe( "full_name.border" ) <> "!" Then
		ls_contact_field =  "full_name"
		//ls_company = ""			
	Else
		//MessageBox("Support", "The " + ids_letter.DataObject + " data object does not have FULL NAME field in it.  Call support." )
		MessageBox("Support", "The " + ids_letter.DataObject + " data object does not have a FULL NAME field in it.  Call support." )
		Return -1
	End If
End If

//grab tbe email address /fax_number.  Could be from the prac address or the address lookup table

If as_type = "EMAIL" Then //email;
	ls_errfield = "n email address" //the n is the second letter of an in the message below
	If ids_letter.Describe("email_address.ColType") = "!"	Then
		If ids_letter.Describe("e_mail_address.ColType") = "!"	Then
			If ids_letter.Describe("pd_address_e_mail_address.ColType") = "!"	Then
				If ids_letter.Describe("pd_prof_experience_e_mail_address.ColType") = "!"	Then //Add By Jervis 12-10-2008 for professional experience
					MessageBox("Support", "The " + ids_letter.DataObject + " data object does not have a field called 'email_address' or 'e_mail_address'.  Contact ContractLogix support to have this corrected for a later build.  You cannot email this letter type." )
					Return -1
				Else
					ls_column = "pd_prof_experience_e_mail_address"
				End If
			Else
				ls_column = "pd_address_e_mail_address"
			End If
		Else
			ls_column = "e_mail_address"
		End If
	Else
		ls_column = "email_address"
	End If
ElseIf  as_type = "FAX" Then //fax
	//get the fax field.  Could be from the prac address or the address lookup table
	ls_errfield = " fax number"
	If ids_letter.Describe( "fax.border" ) <> "!" Then
		ls_column = "fax"
	ElseIf ids_letter.Describe( "pd_address_fax.border" ) <> "!" Then
		ls_column = "pd_address_fax"
	ElseIf ids_letter.Describe( "address_lookup_fax.border" ) <> "!" Then
		ls_column = "address_lookup_fax"
	ElseIf ids_letter.Describe( "pd_prof_experience_fax.border") <> "!" Then //Add By Jervis 12-10-2008 for professional experience
		ls_column =  "pd_prof_experience_fax"
	Else
		MessageBox("Support", "The " + ids_letter.DataObject + " data object does not have a fax number field in it.  Call support." )
		Return -1
	End If
Else
	Return 1
End If

If ids_letter.Describe( "facility_facility_name.border" ) <> "!" Then
	ls_facility_field =  "facility_facility_name"
ElseIf ids_letter.Describe( "facility_name.border" ) <> "!" Then
	ls_facility_field = "facility_name"
ElseIf ids_letter.Describe( "facility_return_facility_name.border" ) <> "!" Then
	ls_facility_field = "facility_return_facility_name"
	//Start Code Change ----04.08.2008 #V8 maha
ElseIf ids_letter.Describe( "creturn_facility_name.border" ) <> "!" Then
	ls_facility_field = "creturn_facility_name"
	//End Code Change---04.08.2008
Else
	//MessageBox("Support", "The " + ids_letter.DataObject + " data object does not have an facility_name field in it.  Call support." )
	MessageBox("Support", "The " + ids_letter.DataObject + " data object does not have a facility_name field in it.  Call support." )
	Return -1
End If

If ids_letter.Describe( "v_full_name_full_name.border" ) <> "!" Then
	ls_name_field =  "v_full_name_full_name"
ElseIf ids_letter.Describe( "full_name.border" ) <> "!" Then
	ls_name_field = "full_name"
Else
	//MessageBox("Support", "The " + ids_letter.DataObject + " data object does not have an full_name field in it.  Call support." )
	MessageBox("Support", "The " + ids_letter.DataObject + " data object does not have a full_name field in it.  Call support." )
	Return -1
End If


//preprocess list to make sure the appropriate info is there to email/fax
If ab_error_checking Then
	For i = 1 To li_rc
		//if its a corro letter then check to see if the prac address has a email number
		ls_value =  ids_letter.GetItemString( i, ls_column )
		If IsNull( ls_value ) Or ls_value = "" Then //if there is no email or fax address
			//facility data
			ls_facility_name = ids_letter.GetItemString( i, ls_facility_field )
			//full name field
			ls_full_name = ids_letter.GetItemString( i, ls_name_field )
			//if a valid entity name field get the data
			If ls_company_field = "N/A" Then
				ls_lookup_entity_name = "N/A"
			Else
				ls_lookup_entity_name =  ids_letter.GetItemString( i, ls_company_field )
			End If
			
			li_nr = dw_errors.InsertRow( 0 )
			
			li_error_cnt++
			il_error_rec_num[ li_error_cnt ] = i
			
			If ls_lookup_entity_name <> "N/A" Then //if a verif letter with an entity name field
				st_text.Text = "The following lookup Entity did not have a" + ls_errfield + " associated with it."
				dw_errors.Modify( "facility_name_t.text = 'Address Lookup Record'" )
				dw_errors.SetItem( li_nr, "facility_name", ls_lookup_entity_name )
			Else
				st_text.Text = "The following practitioners did not have a" + ls_errfield + " in their address screen."
				dw_errors.SetItem( li_nr, "facility_name", ls_facility_name )
			End If
			
			If as_type = "EMAIL" Then
				cb_continuefax.Text = "Email Pracs with email address."
				cb_cancelfax.Text = "Cancel Email"
			ElseIf as_type = "FAX" Then
				cb_continuefax.Text = "Fax Pracs with Fax numbers."
				cb_cancelfax.Text = "Cancel Fax"
			End If
			
			dw_errors.SetItem( li_nr, "full_name", ls_full_name )
		End If
		End For
		
		st_error_cnt.Text = "There were " + String( li_error_cnt ) + " out of " + String( li_rc ) + " records in error."
		
		If li_error_cnt = li_rc Then
			cb_continuefax.Enabled = False
			//--------------------------- APPEON BEGIN ---------------------------
			//$<comment> 2006-10-12 By: Liu Hongxin
			//$<reason> fail to send mail, it should change print status.
								/*
								cb_yes.Enabled = False
			*/
			//---------------------------- APPEON END ----------------------------
			cb_email.Enabled = False
		End If
		
		If dw_errors.RowCount( ) > 0 Then
			w_ai_print_msg_box.Height = 1475
			Return -1
		End If
		
		ab_error_checking	 = False
		
	End If
	
	pfc_cst_nv_fax nv_emailfax
	nv_emailfax = Create pfc_cst_nv_fax;
	
	If as_type = "EMAIL" Then
		OpenWithParm( w_fax_win, is_letter_type + "-" + "Email")
	ElseIf as_type = "FAX" Then
		OpenWithParm( w_fax_win, is_letter_type )
	End If
	
	If Message.StringParm = "Cancel" Then
		Destroy nv_emailfax
		Return -1
	End If
	lg_pass_ids = Message.PowerObjectParm
	
	is_cover_page = lg_pass_ids.s_fax_cover
	is_cover_message = lg_pass_ids.s_fax_message
	is_subject = lg_pass_ids.s_fax_subject
	
	//check to see if user wants to print attachments (release, priv stuff )
	of_print_image_document( "File" )
	
	If ids_letter.DataObject = "d_ltr_expiring_appointment" Or  ids_letter.DataObject = "d_ltr_expiring_provisional" Or ids_letter.DataObject = "d_ltr_expiring_allied_health" Then
		gi_burn_annos	 = 1
		w_ai_print_letters_new.of_Print_Application( True )
		w_ai_print_letters_new.ib_app_faxed = True
		gi_burn_annos	 = 0
	End If
	
	li_error_cnt = UpperBound( il_error_rec_num )
	
	For i = 1 To li_rc
		lb_error_rec = False
		For e = 1 To li_error_cnt
			If il_error_rec_num[e] = i Then
				lb_error_rec = True
				Exit
			End If
			End For
			If lb_error_rec Then
				Continue
			End If
			
			If is_letter_type = "Verif" Then
				//grab the name of the school, ins company etc.
				ls_company = ids_letter.GetItemString( i, ls_company_field )
				ls_recipient = ids_letter.GetItemString( i,ls_contact_field )
				//if the address lookup table does not have a contact then put "no data".
				If IsNull( ls_recipient ) Or ls_recipient = "" Then
					ls_recipient = "No Data"
				End If
			Else
				//grab the name of the practitioner if its a corro or exp or exp appoint letter
				ls_recipient = ids_letter.GetItemString( i, ls_name_field )
				ls_company = ""
			End If
			
			li_attach_cnt = 1
			
			ls_attachments = ls_attachments_null
			
			of_get_documents(ls_attachments, "_" + String( i ))
			String ls_errtext
			ls_value =  ids_letter.GetItemString( i, ls_column ) //Added By Ken.Guo 04.18.2008. Must get this value again in loop.
			If as_type = "EMAIL" Then
				If nv_emailfax.of_email( ls_recipient, ls_company, ls_value, is_subject, is_cover_message, ls_attachments, is_cover_page )	 = -1 Then
					Destroy nv_emailfax
					Return -1
				End If
			ElseIf as_type = "FAX" Then
				If nv_emailfax.of_fax( ls_recipient, ls_company, ls_value, is_subject, is_cover_message, ls_attachments, is_cover_page,ls_errtext )	 = -1 Then
					MessageBox('Fax Send',ls_errtext)
					Destroy nv_emailfax
					Return -1
				End If
			End If
			End For
			
			
			//structure to return array of records in error
			If UpperBound( il_error_rec_num ) = 0 Then
				il_error_rec_num[1] = -4 //-5
			End If
			Destroy nv_emailfax
			lst_email_error_records.il_error_rec_num = il_error_rec_num[]
			//--------------------------- APPEON BEGIN ---------------------------
			//$<modify> 11/02/2007 By: Ken.Guo
			//$<reason> Maybe PB Bug,So create this event to post close this window.
			//CloseWithReturn( This, lst_email_error_records)
			Post Event ue_post_closewithreturn(lst_email_error_records)
			//---------------------------- APPEON END ----------------------------
			
			
			
			Return 0
			

end function

public function integer of_is_word_open ();//Start Code Change ---- 12.1302006 #V7 maha created function called from timer and yes button

ulong l_handle
string ls_wname
string ls_test
integer li_word_open = 0
integer i

for i = 1 to 15
	choose case i
		case 1
			ls_wname = "IntelliCred Letter Generation"
		case 2
			ls_wname = "Microsoft Word"
		case 3
			ls_wname = "IntelliCred Letter Generation - Verification Letter (Preview)"
		case 4
			 ls_wname = "IntelliCred Letter Generation - Verification Letter"
		case 5
			ls_wname = "Microsoft Word - Verification Letter"
		case 6
			ls_wname = "Microsoft Word - Verification Letter (Preview)"
		case 7
			//ls_wname = is_letter_name
			ls_wname = is_document  //Start Code Change ---- 10.25.2007 #V7 maha
		case 8 
			ls_wname = "Microsoft Word - Labels1"
		case 9
			ls_wname = "Microsoft Word - Form Letters1"
		case 10
			ls_wname = "- Microsoft Word"
		case 11
			ls_wname = ' ' + TRIM(LOWER(is_letter_name)) +   " - Microsoft Word"
		case 12 ////Start Code Change ---- 09.10.2007 #V7 maha
			ls_wname =  TRIM(LOWER(is_letter_name)) +   ".doc - Microsoft Word"
		Case 13 //Added by Ken.Guo 11/01/2007
			ls_wname = is_document + " - Microsoft Word"
		Case 14 //Added by Ken.Guo 11/01/2007
			ls_wname = 	is_document + ' /mpreview'  
		Case 15 //Added by Ken.Guo 11/01/2007
			ls_wname = 	is_document + ' /mpreview' + " - Microsoft Word"
	end choose
	l_handle = FindWindowA(0, ls_wname)
	IF l_handle > 0 THEN
		li_word_open = 1
		ls_test = ls_wname
		//messagebox(string (i),ls_test)
		exit
	END IF
next
//messagebox("window",li_word_open)
return li_word_open
end function

event open;call super::open;/******************************************************************************************************************
**  [PUBLIC]   : 
**==================================================================================================================
**  Purpose   	: 
**==================================================================================================================
**  Arguments 	: [none] 
**==================================================================================================================
**  Returns   	: [none]   
**==================================================================================================================
**  Notes     	: 	   
**==================================================================================================================
**  Created By	: ??
**==================================================================================================================
**  Modification Log
**   Changed By             Change Date                                               Reason
** ------------------------------------------------------------------------------------------------------------------
**   mskinnner              16 December 2005                                        Removed file delete code replaced it with
**                                                                                  more effecient method
********************************************************************************************************************/



inv_filesrv = create n_cst_filesrvwin32

Long f
Integer li_cnt = 0

gs_fax lgs_fax

lgs_fax = Message.PowerObjectParm

is_msg = lgs_fax.ss_message
is_letter_name = lgs_fax.ss_letter_name
ids_letter = lgs_fax.sdw_letter
is_mail_label_doc = lgs_fax.ss_mail_label_doc
is_letter_type = lgs_fax.ss_letter_type
is_document = lgs_fax.ss_letter_document_name  //Start Code Change ---- 10.25.2007 #V7 maha
is_merge_file_path = lgs_fax.ss_merge_file_path //Added By Ken.Guo 03.25.2008. Recieve it from w_letter_generator.of_run()
st_msg.Text = "Generating Microsoft Word Merge Letter"

gnv_app.gnvlo_msword.of_delete_fax_documents( )



Timer(1)

end event

on w_ai_print_msg_box.create
int iCurrent
call super::create
this.st_msg=create st_msg
this.cb_yes=create cb_yes
this.cbx_mail=create cbx_mail
this.cbx_priv=create cbx_priv
this.cbx_release=create cbx_release
this.cb_print=create cb_print
this.cb_continuefax=create cb_continuefax
this.cb_cancelfax=create cb_cancelfax
this.st_text=create st_text
this.uo_print_app=create uo_print_app
this.dw_errors=create dw_errors
this.ole_print=create ole_print
this.ole_admin=create ole_admin
this.st_error_cnt=create st_error_cnt
this.cb_fax=create cb_fax
this.cb_1=create cb_1
this.cb_no=create cb_no
this.cb_email=create cb_email
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_msg
this.Control[iCurrent+2]=this.cb_yes
this.Control[iCurrent+3]=this.cbx_mail
this.Control[iCurrent+4]=this.cbx_priv
this.Control[iCurrent+5]=this.cbx_release
this.Control[iCurrent+6]=this.cb_print
this.Control[iCurrent+7]=this.cb_continuefax
this.Control[iCurrent+8]=this.cb_cancelfax
this.Control[iCurrent+9]=this.st_text
this.Control[iCurrent+10]=this.uo_print_app
this.Control[iCurrent+11]=this.dw_errors
this.Control[iCurrent+12]=this.ole_print
this.Control[iCurrent+13]=this.ole_admin
this.Control[iCurrent+14]=this.st_error_cnt
this.Control[iCurrent+15]=this.cb_fax
this.Control[iCurrent+16]=this.cb_1
this.Control[iCurrent+17]=this.cb_no
this.Control[iCurrent+18]=this.cb_email
end on

on w_ai_print_msg_box.destroy
call super::destroy
destroy(this.st_msg)
destroy(this.cb_yes)
destroy(this.cbx_mail)
destroy(this.cbx_priv)
destroy(this.cbx_release)
destroy(this.cb_print)
destroy(this.cb_continuefax)
destroy(this.cb_cancelfax)
destroy(this.st_text)
destroy(this.uo_print_app)
destroy(this.dw_errors)
destroy(this.ole_print)
destroy(this.ole_admin)
destroy(this.st_error_cnt)
destroy(this.cb_fax)
destroy(this.cb_1)
destroy(this.cb_no)
destroy(this.cb_email)
end on

event timer;boolean lb_word_open
integer li_check

//Start Code Change ---- 12.13.2006 #V7 maha
if not ib_skip then
	gnv_app.gnvlo_msword.of_set_focus( )
	ib_skip = true
end if 

li_timeout = li_timeout + 1
//if li_timeout > 10 then return//maha 121306 skip rest of code

li_check =  of_is_word_open( )
if li_check = 1 then lb_word_open = true

//default timeout 8 seconds
if li_timeout > 8 then lb_word_open = true

IF not lb_word_open THEN // not opened
	IF st_msg.Visible = False THEN //flash message on and off
		st_msg.Visible = True	
	ELSE
		st_msg.Visible = False
	END IF
	cb_yes.Enabled = False
	cb_no.Enabled = False
ELSE
	st_msg.Visible = True
	cb_yes.Enabled = True
	cb_no.Enabled = True	
	st_msg.Text = is_msg
	Timer(0) //Ken.Guo 11/01/2007
END IF
//End Code Change---12.13.2006

end event

event close;call super::close;If isvalid(inv_filesrv) Then Destroy inv_filesrv
gnv_app.gnvlo_msword.of_dissconnect_from_word( )
end event

type st_msg from statictext within w_ai_print_msg_box
integer x = 69
integer y = 168
integer width = 2007
integer height = 152
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_yes from commandbutton within w_ai_print_msg_box
integer x = 2117
integer y = 32
integer width = 398
integer height = 84
integer taborder = 10
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "Yes"
boolean default = true
end type

event clicked;String ls_retval


li_click_times++


IF li_click_times = 1 THEN  //when Yes is clicked
//	if of_is_word_open( ) = 1 then //check to see if word is still open; if so enable the email/fax buttons maha 121306
		cb_fax.Enabled = True	//function call does not work properly so will always = 1
		cb_email.Enabled = True
//	else
//		cb_fax.Enabled = false
//		cb_email.Enabled = false
//	end if
	
	This.Text = "Continue" 

	IF FileExists( gs_dir_path + gs_DefDirName + "\Fax\fax_1.doc" ) THEN
		//cb_fax.Enabled = True mbs - fax mod
		cb_email.Enabled = True
		IF ids_letter.Describe( "fax.width" ) = "!" AND ids_letter.Describe( "pd_address_fax.width" ) = "!" AND ids_letter.Describe( "address_lookup_fax.width" ) = "!" THEN
			//cb_fax.Enabled = False mbs - fax mod
		END IF
		IF ids_letter.Describe( "pd_address_e_mail_address.width" ) = "!" THEN		
			cb_email.Enabled = False			
			Return -1
		END IF	
		cb_no.Enabled = False
	END IF
	st_msg.Visible = False
	//checkboxes
	cbx_mail.Visible = True
	if of_get_app_setting("set_img","I") = 1 then //if imaging module maha121306
		cbx_priv.Visible = True
		cbx_release.Visible = True	
	end if
	cb_no.Visible = False
	//This.x = This.x + 50
	Timer(0)
ELSE
	ls_retval = "1"
	of_print_image_document( "Print" )

	gs_fax_error_records lst_fax_error_records
	lst_fax_error_records.il_error_rec_num[1] = 0
	CloseWithReturn( Parent, lst_fax_error_records  )
END IF
end event

type cbx_mail from checkbox within w_ai_print_msg_box
boolean visible = false
integer x = 197
integer y = 192
integer width = 517
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Print Mailing Label"
end type

type cbx_priv from checkbox within w_ai_print_msg_box
boolean visible = false
integer x = 1435
integer y = 160
integer width = 517
integer height = 140
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Print Privilege List"
end type

event clicked;//Added by Ken.Guo on 2008-11-07
If gnv_reg_ocx.of_check_ocx( 3, '', True) <> '' Then
	This.Checked = False
End If
end event

type cbx_release from checkbox within w_ai_print_msg_box
boolean visible = false
integer x = 795
integer y = 192
integer width = 517
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Print Release Forms"
end type

event clicked;//Added by Ken.Guo on 2008-11-07
If gnv_reg_ocx.of_check_ocx( 3, '', True) <> '' Then
	This.Checked = False
End If
end event

type cb_print from commandbutton within w_ai_print_msg_box
integer x = 59
integer y = 1220
integer width = 398
integer height = 108
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Print Errors"
boolean cancel = true
end type

event clicked;dw_errors.Print()
end event

type cb_continuefax from commandbutton within w_ai_print_msg_box
integer x = 910
integer y = 1220
integer width = 946
integer height = 108
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Fax Documents With Fax #~'s"
boolean cancel = true
end type

event clicked;//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 04/09/2008 By: Ken.Guo
//$<reason> Changed to combined function as cb_fax/cb_email button.
/*
IF ib_faxing_doc = True THEN
	of_Fax( False )
ELSE
	of_Email( False )
END IF
*/
IF ib_faxing_doc = True THEN
	of_fax_email( False, "FAX")
ELSE
	of_fax_email( False, "EMAIL")
END IF
//---------------------------- APPEON END ----------------------------

end event

type cb_cancelfax from commandbutton within w_ai_print_msg_box
integer x = 485
integer y = 1220
integer width = 398
integer height = 108
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Cancel Fax"
boolean cancel = true
end type

event clicked;gs_fax_error_records lst_fax_error_records

lst_fax_error_records.il_error_rec_num[1] = -2
CloseWithReturn( Parent, lst_fax_error_records  )	
end event

type st_text from statictext within w_ai_print_msg_box
integer x = 59
integer y = 600
integer width = 1513
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
boolean enabled = false
string text = "The following physicians had no fax numbers "
boolean focusrectangle = false
end type

type uo_print_app from pfc_cst_u_create_app2 within w_ai_print_msg_box
boolean visible = false
integer x = 1888
integer y = 1088
integer width = 361
integer height = 124
integer taborder = 20
long backcolor = 80269524
borderstyle borderstyle = stylelowered!
end type

on uo_print_app.destroy
call pfc_cst_u_create_app2::destroy
end on

type dw_errors from datawindow within w_ai_print_msg_box
integer x = 64
integer y = 660
integer width = 2437
integer height = 528
integer taborder = 60
string dataobject = "d_fax_errors"
boolean hscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type ole_print from olecustomcontrol within w_ai_print_msg_box
event keydown ( ref integer keycode,  integer shift )
event keyup ( ref integer keycode,  integer shift )
event keypress ( ref integer keyascii )
event mousedown ( integer button,  integer shift,  long ocx_x,  long ocx_y )
event mousemove ( integer button,  integer shift,  long ocx_x,  long ocx_y )
event mouseup ( integer button,  integer shift,  long ocx_x,  long ocx_y )
event click ( )
event dblclick ( )
event ocx_error ( integer number,  ref string description,  long scode,  string source,  string helpfile,  long helpcontext,  ref boolean canceldisplay )
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
event hyperlinkgotodoc ( string link,  long page,  ref boolean handled )
event editingtextannotation ( boolean editing )
event magnifierstatus ( integer hwnd,  long status,  long magnifierzoom,  long left,  long top,  long ocx_width,  long ocx_height )
event pasteclip ( ref long mode )
event baddocumentfiletype ( long page,  ref boolean errorout,  ref boolean skippage,  ref boolean overwritepage )
event nextpage ( )
event prevpage ( )
event overlayfilenotfound ( ref string overlayfilename,  ref boolean btryagain )
event imagedraganddrop ( )
event zoomchanged ( real zoom )
event readystatechange ( long readystate )
boolean visible = false
integer x = 1449
integer y = 1088
integer width = 466
integer height = 144
integer taborder = 110
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
string binarykey = "w_ai_print_msg_box.win"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
end type

type ole_admin from olecustomcontrol within w_ai_print_msg_box
event filepropertiesclose ( )
integer x = 2190
integer y = 1204
integer width = 155
integer height = 136
integer taborder = 90
borderstyle borderstyle = stylelowered!
string binarykey = "w_ai_print_msg_box.win"
integer binaryindex = 1
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
end type

type st_error_cnt from statictext within w_ai_print_msg_box
integer x = 64
integer y = 668
integer width = 1513
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
boolean enabled = false
string text = "Error Count"
boolean focusrectangle = false
end type

type cb_fax from commandbutton within w_ai_print_msg_box
integer x = 2322
integer y = 244
integer width = 192
integer height = 84
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "&Fax "
boolean cancel = true
end type

event clicked;// start code change --- 11.7.2005 MSKINNER
this.enabled = false

choose case ib_fax_docs_created
	case false
		 if gnv_app.gnvlo_msword.of_setup( ) > 0 then
			  //Start Code Change ---- 12.13.2006 #V7 maha changed to combined function
			of_fax_email( true, "FAX")
				//  of_fax( True )
				 // parent.ib_fax_docs_created = true
		 end if
	 case else
		of_fax_email( true, "FAX")
		 // of_fax( True )
		 //End Code Change---12.13.2006
end choose 
// end code change --- 11.7.2005 MSKINNER
end event

type cb_1 from commandbutton within w_ai_print_msg_box
integer x = 2117
integer y = 360
integer width = 398
integer height = 84
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Cancel"
end type

event clicked;gs_fax_error_records lst_fax_error_records

lst_fax_error_records.il_error_rec_num[1] = -2
CloseWithReturn( Parent, lst_fax_error_records  )	


end event

type cb_no from commandbutton within w_ai_print_msg_box
integer x = 2117
integer y = 128
integer width = 398
integer height = 84
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "No"
boolean cancel = true
end type

event clicked;gs_fax_error_records lst_fax_error_records

IF li_click_times = 0 THEN  //if no is clicked
	lst_fax_error_records.il_error_rec_num[1] = -2
	CloseWithReturn( Parent, lst_fax_error_records  )	
	//CloseWithReturn(Parent, "2" )
ELSE
	lst_fax_error_records.il_error_rec_num[1] = -1
	CloseWithReturn( Parent, lst_fax_error_records  )	
	//CloseWithReturn(Parent, "1" )
END IF
end event

type cb_email from commandbutton within w_ai_print_msg_box
integer x = 2117
integer y = 244
integer width = 201
integer height = 84
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "&Email"
boolean cancel = true
end type

event clicked;// start code change --- 11.7.2005 MSKINNER
this.enabled = false

choose case ib_fax_docs_created
	case false
	 if gnv_app.gnvlo_msword.of_setup( ) > 0 then
		//Start Code Change ---- 12.13.2006 #V7 maha changed to combined function
		of_fax_email( true, "EMAIL")
		   //  of_email( True )
		    // parent.ib_fax_docs_created = true
			 
    end if
	 case else
		of_fax_email( true, "EMAIL")
		 // of_email( True )
		 //End Code Change---12.13.2006
end choose 
// end code change --- 11.7.2005 MSKINNER


end event


Start of PowerBuilder Binary Data Section : Do NOT Edit
01w_ai_print_msg_box.bin 
2F00000600e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe00000006000000000000000000000001000000010000000000001000fffffffe00000000fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdfffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000fffffffe00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000600e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe00000006000000000000000000000001000000010000000000001000fffffffe00000000fffffffe0000000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
27fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdfffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000fffffffe00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
11w_ai_print_msg_box.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
