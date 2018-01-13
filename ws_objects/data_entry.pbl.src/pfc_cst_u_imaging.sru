$PBExportHeader$pfc_cst_u_imaging.sru
forward
global type pfc_cst_u_imaging from userobject
end type
type st_zoom from statictext within pfc_cst_u_imaging
end type
type ddlb_zoom from dropdownlistbox within pfc_cst_u_imaging
end type
type cbx_show from checkbox within pfc_cst_u_imaging
end type
type st_page from statictext within pfc_cst_u_imaging
end type
type st_recs from statictext within pfc_cst_u_imaging
end type
type tab_view from tab within pfc_cst_u_imaging
end type
type tabpage_browse from userobject within tab_view
end type
type cb_ass_file from commandbutton within tabpage_browse
end type
type ole_thumb from olecustomcontrol within tabpage_browse
end type
type cb_find from commandbutton within tabpage_browse
end type
type sle_find_path from singlelineedit within tabpage_browse
end type
type st_path from statictext within tabpage_browse
end type
type ole_admin from olecustomcontrol within tabpage_browse
end type
type dw_browse from u_dw within tabpage_browse
end type
type lb_files from listbox within tabpage_browse
end type
type tabpage_browse from userobject within tab_view
cb_ass_file cb_ass_file
ole_thumb ole_thumb
cb_find cb_find
sle_find_path sle_find_path
st_path st_path
ole_admin ole_admin
dw_browse dw_browse
lb_files lb_files
end type
type tabpage_image from userobject within tab_view
end type
type ole_scan_edit from olecustomcontrol within tabpage_image
end type
type cbx_1 from u_cbx within tabpage_image
end type
type tabpage_image from userobject within tab_view
ole_scan_edit ole_scan_edit
cbx_1 cbx_1
end type
type tabpage_setup from userobject within tab_view
end type
type ole_admin1 from olecustomcontrol within tabpage_setup
end type
type cb_from_file from commandbutton within tabpage_setup
end type
type cb_remove from commandbutton within tabpage_setup
end type
type dw_image_list from u_dw within tabpage_setup
end type
type dw_image_data from u_dw within tabpage_setup
end type
type ole_scan from olecustomcontrol within tabpage_setup
end type
type cb_scan from commandbutton within tabpage_setup
end type
type cb_select from commandbutton within tabpage_setup
end type
type dw_data from u_dw within tabpage_setup
end type
type tabpage_setup from userobject within tab_view
ole_admin1 ole_admin1
cb_from_file cb_from_file
cb_remove cb_remove
dw_image_list dw_image_list
dw_image_data dw_image_data
ole_scan ole_scan
cb_scan cb_scan
cb_select cb_select
dw_data dw_data
end type
type tab_view from tab within pfc_cst_u_imaging
tabpage_browse tabpage_browse
tabpage_image tabpage_image
tabpage_setup tabpage_setup
end type
end forward

global type pfc_cst_u_imaging from userobject
integer width = 3534
integer height = 1784
boolean border = true
long backcolor = 79741120
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event pfc_cst_print_letters ( )
event pfc_cst_dial_phone ( )
event pfc_cst_goto_web ( )
event pfc_cst_npdb_export ( )
event pfc_cst_nextpage ( )
event pfc_cst_priorpage ( )
event pfc_cst_a_select ( )
event pfc_cst_a_highlight ( )
event pfc_cst_a_stamptext ( )
event pfc_cst_a_note ( )
event pfc_cst_a_delete ( )
event pfc_cst_save_image ( )
event pfc_cst_page_properties ( )
event pfc_cst_straighten_page ( )
event pfc_cst_rotate ( )
event ue_down_key pbm_dwnkey
event pfc_cst_undo ( )
event pfc_cst_email_documents ( )
event pfc_cst_delete_all ( )
event pfc_cst_image_utility ( )
event pfc_delete_all ( )
event pfc_cst_fax_image_documents ( )
st_zoom st_zoom
ddlb_zoom ddlb_zoom
cbx_show cbx_show
st_page st_page
st_recs st_recs
tab_view tab_view
end type
global pfc_cst_u_imaging pfc_cst_u_imaging

type variables
Integer ii_modified = 0
Integer ii_image_utility_on = 0
Integer ii_image_storage_type = 0

pfc_cst_nv_image_functions  inv_image_functions
pfc_n_cst_ai_action_items inv_action_items
pfc_cst_nv_data_entry_functions inv_dw

Long il_prac_id
Long il_rec_id

Boolean ib_verify

String is_image_path
String is_annotation_name
String is_status_filter 
String is_verif_filter 
String is_view_filter
String is_image_file_name


Integer ii_num_pages
Integer ii_screen_id
Integer ii_data_view_id
Integer ii_parent_facility_id
Integer ii_verifiying_facility_id
Integer ii_start_page
Integer ii_current_page
Integer ii_facility_ids[]
Long il_exp_appt_ltr
// mskinner 06 feb 2006 -- begin
long il_current_row, il_dispaly_row
boolean ib_new_row_added,ib_no_dialog = true

// mskinner 06 feb 2006 -- end 

w_prac_data_1 iw_parent_window

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 09.27.2006 By: LeiWei
//$<reason> Performance tuning
String is_display_doc_name
//---------------------------- APPEON END ----------------------------

Integer ii_fax_type
end variables

forward prototypes
public function integer of_set_prac_id (long al_prac_id)
public function integer of_set_parent (w_prac_data_1 aw_win)
public function integer of_set_verifying_facility_id (integer ai_verifying_facility_id)
public function integer of_display_doc (integer ai_from_page, integer ai_num_pages)
public function integer of_next_page ()
public function integer of_prior_page ()
public function integer of_enable_next_prev_buttons (string as_from_where)
public function integer of_print ()
public function integer of_batch_print ()
public function integer of_delete_image ()
public function integer of_add_annotation (string as_annotation_type)
public function integer of_page_properties ()
public function integer of_set_menu (integer ai_index)
public function integer of_undo ()
public function integer of_email_documents ()
public function integer of_delete_all_images ()
public function integer of_image_utility ()
public function integer of_fax_documents ()
public function integer of_check_for_null_start (integer ai_start)
public subroutine of_doubleclicked (u_dw adw)
public function integer of_print_image (integer al_start_page, integer al_pagecount)
public function integer of_check_page_count (integer ai_start, integer ai_image, integer ai_num_pages)
public function integer of_browse_select_row (integer ai_row, integer ai_param)
public function integer of_scanner_select ()
public function integer of_email_outlook ()
public function integer of_enable_next_prev_buttons (integer ai_index)
end prototypes

event pfc_cst_nextpage;IF tab_view.SelectedTab = 1 THEN
	tab_view.tabpage_browse.dw_browse.Event pfc_nextpage()
	of_enable_next_prev_buttons( "Browse" )	
ELSEIF tab_view.SelectedTab = 2 THEN
	of_next_page(  )
	of_enable_next_prev_buttons( "Image" )	
END IF

end event

event pfc_cst_priorpage;IF tab_view.SelectedTab = 1 THEN
	tab_view.tabpage_browse.dw_browse.Event pfc_previouspage()
	of_enable_next_prev_buttons( "Browse" )	
ELSEIF tab_view.SelectedTab = 2 THEN
	of_prior_page(  )
	of_enable_next_prev_buttons( "Image" )	
END IF
end event

event pfc_cst_a_select;of_add_annotation( "S" )
end event

event pfc_cst_a_highlight;of_add_annotation( "H" )
end event

event pfc_cst_a_stamptext;of_add_annotation( "T" )
end event

event pfc_cst_a_note;of_add_annotation( "N" )
end event

event pfc_cst_a_delete;of_add_annotation( "D" )
end event

event pfc_cst_save_image();Long ll_rec_id
Long ll_prac_id
Integer li_facility_id
Integer li_screen_id
Long ll_seq_no
Integer li_cr
String	ls_Rtn

//--------------------------- APPEON BEGIN ---------------------------
//$< Add  > 2008-07-14 By: Scofield
//$<Reason> Verify if the directory has write right for the current user.

ls_Rtn = f_ExaWriteRight(tab_view.tabpage_image.ole_scan_edit.Object.Image)
if Len(ls_Rtn) > 0 then
	MessageBox(gnv_app.iapp_object.DisplayName,ls_Rtn,Exclamation!)
	SetRedraw(true)
	Return
end if

//---------------------------- APPEON END ----------------------------

// mskinner 09 March 2005 -- begin
TRY
	   tab_view.tabpage_image.ole_scan_edit.Object.Save()
CATCH (RunTimeError rte)
    		return 
END TRY

// mskinner 09 March 2005 -- end
	

//do this if images are saved in database
IF ii_image_storage_type = 1 THEN
	li_cr = tab_view.tabpage_browse.dw_browse.GetRow( )
	ll_rec_id = tab_view.tabpage_browse.dw_browse.GetItemNumber( li_cr, "pd_images_rec_id" )
	ll_prac_id = tab_view.tabpage_browse.dw_browse.GetItemNumber( li_cr, "pd_images_prac_id" )	
	li_facility_id = tab_view.tabpage_browse.dw_browse.GetItemNumber( li_cr, "pd_images_facility_id" )	
	li_screen_id = tab_view.tabpage_browse.dw_browse.GetItemNumber( li_cr, "pd_images_screen_id" )		
	ll_seq_no = tab_view.tabpage_browse.dw_browse.GetItemNumber( li_cr, "pd_images_seq_no" )
	inv_image_functions.of_save_image_to_db( ll_rec_id, ll_prac_id, li_facility_id, li_screen_id, ll_seq_no )				
END IF
end event

event pfc_cst_page_properties;of_page_properties()
end event

event pfc_cst_straighten_page();ii_modified = 1
pfc_cst_nv_image_functions image_functions
image_functions = CREATE pfc_cst_nv_image_functions
try 
image_functions.of_straighten_page( tab_view.tabpage_image.ole_scan_edit )
catch (runtimeerror tre)
end try

Destroy image_functions

end event

event pfc_cst_rotate();
try 
tab_view.tabpage_image.ole_scan_edit.Object.RotateLeft()
catch (runtimeerror rte)
end try
ii_modified = 1
end event

event ue_down_key;
st_zoom.Text = String( key )
IF KeyDown( KeyDelete! ) THEN
	messagebox("","fdf")
	
END IF
end event

event pfc_cst_undo;of_undo()
end event

event pfc_cst_email_documents;of_email_documents( )
end event

event pfc_cst_delete_all;of_Delete_all_images()
end event

event pfc_cst_image_utility;IF ii_image_utility_on = 1 THEN
 	ii_image_utility_on = 0 
ELSE
	ii_image_utility_on = 1
END IF
of_image_utility( )
end event

event pfc_cst_fax_image_documents;of_fax_documents( )
end event

public function integer of_set_prac_id (long al_prac_id);il_prac_id = al_prac_id

of_image_utility( )

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-01
//$<modify> 01.24.2006 By: Cao YongWang
//$<reason> Performance tuning
//$<modification> Write script to retrieve data from a cache instead of from the database.
/*
SELECT ids.imaging_path  
INTO :is_image_path  
FROM ids  ;
*/
is_image_path = gnv_data.of_getitem("ids","imaging_path",false)
//---------------------------- APPEON END ----------------------------

is_image_file_name = is_image_path + String( il_prac_id ) + ".tif"


//Start Code Change ---- 10.03.2006 #626 maha  moved retrieve outside of try/catch
//Start Code Change ---- 01.27.2006 #225 maha
tab_view.tabpage_setup.dw_data.reset()
tab_view.tabpage_setup.dw_image_list.setrow(2)
tab_view.tabpage_setup.dw_image_list.setrow(1)
//End Code Change---.01.27.2006 
tab_view.tabpage_browse.dw_browse.of_SetTransObject( SQLCA )
tab_view.tabpage_browse.dw_browse.Retrieve( il_prac_id )


try 

tab_view.tabpage_image.ole_scan_edit.Object.ClearDisplay(  ) //maha 061201
tab_view.tabpage_image.ole_scan_edit.Object.Image( is_image_file_name )
tab_view.tabpage_image.ole_scan_edit.Object.UndoLevels( 1 )

catch (runtimeerror a)
end try
//End Code Change---10.03.2006

Return 0
end function

public function integer of_set_parent (w_prac_data_1 aw_win);iw_parent_window = aw_win

Return 0
end function

public function integer of_set_verifying_facility_id (integer ai_verifying_facility_id);ii_verifiying_facility_id = ai_verifying_facility_id

//tab_view.tabpage_browse.dw_browse.of_SetUpdateAble( False )
tab_view.tabpage_browse.dw_browse.of_SetTransObject(SQLCA)

tab_view.tabpage_browse.dw_browse.of_SetSort( True )
tab_view.tabpage_browse.dw_browse.inv_sort.of_SetColumnnameSource( tab_view.tabpage_browse.dw_browse.inv_sort.HEADER )
tab_view.tabpage_browse.dw_browse.inv_sort.of_SetStyle( tab_view.tabpage_browse.dw_browse.inv_sort.DROPDOWNLISTBOX )
tab_view.tabpage_browse.dw_browse.inv_sort.of_SetColumnHeader( TRUE )

tab_view.tabpage_browse.dw_browse.of_SetRowManager( TRUE )

tab_view.tabpage_browse.dw_browse.SelectRow( 1, True )

tab_view.tabpage_setup.dw_image_list.SetTransObject( SQLCA )
tab_view.tabpage_setup.dw_image_list.Retrieve()

tab_view.tabpage_setup.dw_image_data.of_SetTransObject( SQLCA )

Return 0
end function

public function integer of_display_doc (integer ai_from_page, integer ai_num_pages);integer li_pagecount
Long ll_rec_id
Long ll_prac_id
Integer li_facility_id
Integer li_screen_id
Long ll_seq_no
Integer li_cr
integer c
boolean bt
//Start Code Change ---- 05.17.2006 #458 maha
string ls_file

//--------------------------- APPEON BEGIN ---------------------------
//$<comment> 09.27.2006 By: LeiWei
//$<reason> Performance tuning
//ls_file = gs_dir_path + gs_DefDirName + "\temp.tif"
//---------------------------- APPEON END ----------------------------

//End Code Change---05.17.2006


ii_start_page = ai_from_page
ii_current_page = 1
ii_num_pages = ai_num_pages

tab_view.tabpage_image.ole_scan_edit.Object.ClearDisplay(  ) //maha 061201

//The images are stored in the database
IF ii_image_storage_type = 1 THEN
	//--------------------------- APPEON BEGIN ---------------------------
	//$<comment> 09.27.2006 By: LeiWei
	//$<reason> Fix a defect.
	//bt = FileDelete( ls_file )
	//---------------------------- APPEON END ----------------------------
	
	//Start Code Change ---- 05.17.2006 #458 maha
	li_cr = tab_view.tabpage_browse.dw_browse.GetRow( )
	ll_rec_id = tab_view.tabpage_browse.dw_browse.GetItemNumber( li_cr, "pd_images_rec_id" )
	ll_prac_id = tab_view.tabpage_browse.dw_browse.GetItemNumber( li_cr, "pd_images_prac_id" )	
	li_facility_id = tab_view.tabpage_browse.dw_browse.GetItemNumber( li_cr, "pd_images_facility_id" )	
	li_screen_id = tab_view.tabpage_browse.dw_browse.GetItemNumber( li_cr, "pd_images_screen_id" )		
	ll_seq_no = tab_view.tabpage_browse.dw_browse.GetItemNumber( li_cr, "pd_images_seq_no" )
//messagebox("","")

	//--------------------------- APPEON BEGIN ---------------------------
	//$<modify> 08.12.2006 By: LeiWei
	//$<reason> Fix a defect.
	//inv_image_functions.of_retrieve_image_from_db( ll_rec_id, ll_prac_id, li_facility_id, li_screen_id, ll_seq_no )
	IF inv_image_functions.of_retrieve_image_from_db( ll_rec_id, ll_prac_id, li_facility_id, li_screen_id, ll_seq_no ) = -1 THEN
		RETURN -1
	END IF

	ls_file = gs_dir_path + gs_DefDirName + "\images\" + String(ll_rec_id) + "_" + String(ll_prac_id) + "_" +&
				String(li_facility_id) + "_" + String(li_screen_id) + "_" + String(ll_seq_no) + ".tif"
				
	is_display_doc_name = ls_file
	//---------------------------- APPEON END ----------------------------
	
	is_image_file_name = ls_file
	ii_start_page = 1
//The images are stored on the hard disk
ELSE
	is_image_file_name = is_image_path + String( il_prac_id ) + ".tif"
	c = of_check_for_null_start(ii_start_page) //maha 030405
	if c = -1 then return -1
END IF

IF NOT FileExists( is_image_file_name ) THEN
	IF ii_image_storage_type = 1 THEN
		MessageBox("Image File", "The image file " + ls_file + " does not exist,  Check to make sure the path exists or if the database record has an image stored in the image field." )
	ELSE
		MessageBox("Image File", "The image file " + is_image_file_name + " does not exist,  please check your image path in your Image Painter." )
	END IF
	Return -1
END IF

IF tab_view.tabpage_image.ole_scan_edit.Object.Image <> is_image_file_name OR ii_image_storage_type = 1 THEN
	tab_view.tabpage_image.ole_scan_edit.Object.ClearDisplay(  ) //maha 061201
	tab_view.tabpage_image.ole_scan_edit.Object.Image( is_image_file_name )
	tab_view.tabpage_image.ole_scan_edit.Object.UndoLevels( 1 )
END IF

li_pagecount = tab_view.tabpage_image.ole_scan_edit.Object.Pagecount()

IF ii_image_storage_type = 1 THEN
	ii_num_pages = li_pagecount
END IF
	
//IF stored on mapped drive then check this
IF ii_image_storage_type <> 1 THEN
	if ai_from_page >  li_pagecount then //maha 072202
		messagebox("Display Image error","Image page data does not match pagecount of image.  Unable to display selected image.")
		return -1
	end if
END IF

tab_view.tabpage_image.ole_scan_edit.Object.Page( ai_from_page )
//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 2006-10-09 By: Liu Hongxin
//$<reason> Modify according to new required and show huge.
/*
tab_view.tabpage_image.ole_scan_edit.Object.FitTo(1)
*/
tab_view.tabpage_image.ole_scan_edit.Object.FitTo(3)	//Actual Size
//---------------------------- APPEON END ----------------------------
//Start Code Change ---- 11.10.2005 #80 maha
tab_view.tabpage_image.ole_scan_edit.Object.DisplayScaleAlgorithm = 4
//End Code Change---11.10.2005 
tab_view.tabpage_image.ole_scan_edit.Object.Display()
	

st_page.Text = "Page 1 of " + String( ai_num_pages )

of_enable_next_prev_buttons( "Image" )


Return 0
end function

public function integer of_next_page ();integer li_pagecount //maha 072202

//messagebox("num pages", ii_num_pages)
//messagebox("current page", ii_current_page)
IF ii_num_pages > ii_current_page THEN
	li_pagecount = tab_view.tabpage_image.ole_scan_edit.Object.Pagecount()
	if ii_start_page + ii_current_page >  li_pagecount then //maha 072202
		messagebox("Display Image error","Image page data exceeds pagecount of image.  Unable to display selected image.")
		return -1
	else
		ii_current_page ++
		tab_view.tabpage_image.ole_scan_edit.Object.Page( ii_start_page + ii_current_page -1 )
		tab_view.tabpage_image.ole_scan_edit.Object.Display()
		//cb_previous.Enabled = True
		IF ii_current_page = tab_view.tabpage_image.ole_scan_edit.Object.PageCount() THEN
			//This.Enabled = False
		ELSE
			//this.enabled = True
		END IF
		st_page.Text = "Page " + String( ii_current_page ) + " Of " + String( ii_num_pages )
	end if
END IF


Return 0
end function

public function integer of_prior_page ();
IF ii_current_page > 1 THEN
	ii_current_page --
	tab_view.tabpage_image.ole_scan_edit.Object.Page( ii_start_page + ii_current_page -1 )
	tab_view.tabpage_image.ole_scan_edit.Object.Display()
	//cb_previous.Enabled = True
	IF ii_current_page = tab_view.tabpage_image.ole_scan_edit.Object.PageCount() THEN
		//This.Enabled = False
	ELSE
		//this.enabled = True
	END IF
	st_page.Text = "Page " + String( ii_current_page ) + " Of " + String( ii_num_pages )
END IF


Return 0
end function

public function integer of_enable_next_prev_buttons (string as_from_where);Integer li_current_row_page
Integer li_total_row_page

IF as_from_where = "Browse" THEN
	
	li_current_row_page = tab_view.tabpage_browse.dw_browse.GetRow()
	li_total_row_page = tab_view.tabpage_browse.dw_browse.RowCount()
	
	IF IsValid( m_pfe_cst_imaging ) THEN
		gnv_app.of_modify_menu_attr( m_pfe_cst_imaging.m_view.m_nextpage,'enabled', False)
		gnv_app.of_modify_menu_attr( m_pfe_cst_imaging.m_view.m_priorpage,'enabled', False)

		IF li_current_row_page < li_total_row_page THEN
			gnv_app.of_modify_menu_attr( m_pfe_cst_imaging.m_view.m_nextpage,'enabled', True)	
		END IF

		IF li_current_row_page > 1 THEN
			gnv_app.of_modify_menu_attr( m_pfe_cst_imaging.m_view.m_priorpage,'enabled', True)
		END IF
	END IF
ELSE

	IF IsValid( m_pfe_cst_imaging ) THEN
		gnv_app.of_modify_menu_attr( m_pfe_cst_imaging.m_view.m_nextpage,'enabled', False)
		gnv_app.of_modify_menu_attr( m_pfe_cst_imaging.m_view.m_priorpage,'enabled', False)

		IF ii_current_page < ii_num_pages THEN
			gnv_app.of_modify_menu_attr( m_pfe_cst_imaging.m_view.m_nextpage,'enabled', True)	
		END IF

		IF ii_current_page > 1 THEN
			gnv_app.of_modify_menu_attr( m_pfe_cst_imaging.m_view.m_priorpage,'enabled', True)
		END IF
	END IF

END IF

Return 1
end function

public function integer of_print ();IF tab_view.SelectedTab = 1 THEN
	tab_view.tabpage_browse.dw_browse.Print( True )
ELSEIF tab_view.SelectedTab = 2 THEN
	
END IF

Return 1
end function

public function integer of_batch_print ();Integer li_current_row
Integer li_rc
Integer i
Integer li_start_page
Integer li_to_page
Integer li_pagecount
Long ll_rec_id
Long ll_prac_id
Integer li_facility_id
Integer li_screen_id
Long ll_seq_no

if not isvalid(inv_image_functions ) then
	inv_image_functions = create pfc_cst_nv_image_functions
end if 

IF tab_view.SelectedTab = 1 THEN
	li_rc = tab_view.tabpage_browse.dw_browse.RowCount()

	tab_view.tabpage_browse.dw_browse.AcceptText()

	FOR i = 1 TO li_rc
		IF tab_view.tabpage_browse.dw_browse.GetItemNumber( i, "selected" ) = 1 THEN
			IF ii_image_storage_type = 1 THEN
				//scroll to the row
				tab_view.tabpage_browse.dw_browse.SetRow( i )
				//use the display function to display image
				of_display_doc( 1,1 )
				//print it out
				
				//--------------------------- APPEON BEGIN ---------------------------
				//$<modify> 01/11/2008 By: Ken.Guo
				//$<reason> Add Try...Catch
				//li_pagecount = tab_view.tabpage_image.ole_scan_edit.Object.Pagecount()		
				Try
					li_pagecount = tab_view.tabpage_image.ole_scan_edit.Object.Pagecount()				
				Catch(OLERuntimeError err)
					Continue
				End Try
				//---------------------------- APPEON END ----------------------------

				//tab_view.tabpage_image.ole_scan_edit.Object.PrintImage( 1, li_pagecount, 3)
				// mskinner 17 Aug 2005 -- begin
				of_print_image(1 ,li_pagecount)
				// mskinner 17 Aug 2005 -- end
				
			ELSE
				//--------------------------- APPEON BEGIN ---------------------------
				//$<modify> 01/11/2008 By: Ken.Guo
				//$<reason> Add Try...Catch
				//li_pagecount = tab_view.tabpage_image.ole_scan_edit.Object.Pagecount()
				Try
					li_pagecount = tab_view.tabpage_image.ole_scan_edit.Object.Pagecount()
				Catch(OLERuntimeError err1)
					Continue
				End Try
				//---------------------------- APPEON END ----------------------------
			
				li_start_page = tab_view.tabpage_browse.dw_browse.GetItemNumber( i, "start_page" ) 
				li_to_page = li_start_page + tab_view.tabpage_browse.dw_browse.GetItemNumber( i, "num_pages" ) - 1
				if li_to_page >  li_pagecount then //maha 072202
					messagebox("Print Image error","Image page data exceeds pagecount of image.  Unable to print a selected image.")
					return -1
				else
					//tab_view.tabpage_image.ole_scan_edit.Object.PrintImage( li_start_page, li_to_page, 3)
					// mskinner 17 Aug 2005 -- begin
					of_print_image(li_start_page ,li_to_page)
					// mskinner 17 Aug 2005 -- end
				end if
			END IF
		END IF
	END FOR	

	FOR i = 1 TO li_rc
		tab_view.tabpage_browse.dw_browse.SetItem( i, "selected", 0 ) 
	END FOR
ELSE
	IF ii_image_storage_type = 1 THEN
		//--------------------------- APPEON BEGIN ---------------------------
		//$<modify> 01/11/2008 By: Ken.Guo
		//$<reason> Add Try...Catch
		//li_pagecount = tab_view.tabpage_image.ole_scan_edit.Object.Pagecount()		
		Try 
			li_pagecount = tab_view.tabpage_image.ole_scan_edit.Object.Pagecount()
		Catch(OleRuntimeError err2)
			Return -1
		End Try
		//---------------------------- APPEON END ----------------------------

		//tab_view.tabpage_image.ole_scan_edit.Object.PrintImage( 1, li_pagecount, 3)
		// mskinner 17 Aug 2005 -- begin
		of_print_image(1 ,li_pagecount)
		// mskinner 17 Aug 2005 -- end
	ELSE
		li_current_row = tab_view.tabpage_browse.dw_browse.GetRow()
		li_start_page = tab_view.tabpage_browse.dw_browse.GetItemNumber( li_current_row, "start_page" ) 
		li_to_page = li_start_page + tab_view.tabpage_browse.dw_browse.GetItemNumber( li_current_row, "num_pages" ) - 1 
		// mskinner 17 Aug 2005 -- begin
		of_print_image(li_start_page ,li_to_page)
		// mskinner 17 Aug 2005 -- end
		//tab_view.tabpage_image.ole_scan_edit.Object.PrintImage( li_start_page, li_to_page, 3)				
	END IF
END IF


Return 1
end function

public function integer of_delete_image ();Integer li_rc
Integer li_rcdel
Integer i
Integer li_cr
Integer d
Integer li_start_page
Integer li_start_check
Integer li_num_page
Integer li_ans
integer li_checkrow
integer li_pagecount  //maha 072202
integer ck1
integer ck2
integer res
Long ll_rec_id
Long ll_prac_id
Integer li_facility_id
Long ll_seq_no
Integer li_screen_id
Blob lb_null_image
String is_doc_id 

SetNull( lb_null_image )

li_ans = MessageBox( "Delete", "Are you absolutely positive you want to delete the selected images?", Question!, YesNo!, 2 )
IF li_ans = 2 THEN
	Return -1
END IF
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-02
//$<add> 2005-11-16 By: Liang QingShi
//$<reason> Fix a defect in the original unmodified PowerBuilder applciation.
//$<modification> Add a condition to ensure that when no iamge is selected, the applciation cannot perform a deletion.
if tab_view.tabpage_browse.dw_browse.getrow() <= 0 then return -1
//---------------------------- APPEON END ----------------------------


IF tab_view.SelectedTab = 2 THEN
	tab_view.tabpage_browse.dw_browse.SetItem( tab_view.tabpage_browse.dw_browse.GetRow(), "selected", 1 )
END IF

tab_view.tabpage_image.ole_scan_edit.Object.ClearDisplay(  )
//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 01/12/2008 By: Ken.Guo
//$<reason> Image_file_name may is not exist, Need add trap
/*
tab_view.tabpage_browse.ole_admin.Object.Image( is_image_file_name )
li_pagecount = tab_view.tabpage_browse.ole_admin.Object.pagecount()
*/
//If stored on the hard disk do this
If ii_image_storage_type <> 1 Then
	Try
		tab_view.tabpage_browse.ole_admin.Object.Image( is_image_file_name )
		li_pagecount = tab_view.tabpage_browse.ole_admin.Object.pagecount()	
	Catch(OLERuntimeError Err)
		Messagebox("Delete Image error","The image file " + is_image_file_name + " does not exist,  please check your image path in your Image Painter.")
		Return -1
	End Try
End If
//---------------------------- APPEON END ----------------------------



tab_view.tabpage_image.ole_scan_edit.Object.ClearDisplay(  )

li_rc = tab_view.tabpage_browse.dw_browse.RowCount()

tab_view.tabpage_browse.dw_browse.AcceptText()

tab_view.tabpage_browse.dw_browse.setsort("start_page") //maha app093005 trap if records have been sorted
tab_view.tabpage_browse.dw_browse.sort()

FOR i = li_rc TO 1 step -1 //delete image  modified maha110702
	li_checkrow = tab_view.tabpage_browse.dw_browse.GetItemNumber( i, "selected" )
	
	IF li_checkrow = 1 THEN
		//stored in database
		IF ii_image_storage_type = 1 THEN
			tab_view.tabpage_browse.dw_browse.DeleteRow( i )			
		ELSE
			//if stored on the hard disk do this
			li_pagecount = tab_view.tabpage_browse.ole_admin.Object.pagecount()
			li_start_page = tab_view.tabpage_browse.dw_browse.GetItemNumber( i, "start_page" ) 
			li_num_page = tab_view.tabpage_browse.dw_browse.GetItemNumber( i, "num_pages" )
			if li_start_page + li_num_page - 1 >  li_pagecount  then //maha 072202 to trap for image pages that do not exist
				res = messagebox("Delete Image error","Image page data does not match pagecount of image.  Unable to delete some or all pages of the selected image at row " + string(i) + ".~rDo you want to continue and delete the data record?",question!,yesno!,2)
				if res = 1 then //if delete
					tab_view.tabpage_browse.dw_browse.DeleteRow( i )
					if li_start_page <=  li_pagecount then  //maha added 042103 to delete whatever image pages might exist even if all do not.
						tab_view.tabpage_browse.ole_admin.Object.DeletePages( li_start_page, li_pagecount )
					end if
				end if
			elseif isnull(li_start_page) or li_start_page < 1 then //trap added maha 041404 4.181
				res = messagebox("Delete Image error","There is no Start page data value to connect to the image file.~rDo you want to continue and delete the data record?",question!,yesno!,1)
				if res = 1 then //if delete
					tab_view.tabpage_browse.dw_browse.DeleteRow( i )
				end if
			else 
				tab_view.tabpage_browse.ole_admin.Object.DeletePages( li_start_page, li_num_page )
				tab_view.tabpage_browse.dw_browse.DeleteRow( i )
			end if
		END IF
	END IF
END FOR


//if the image is not stored in db then do this...
IF ii_image_storage_type <> 1 THEN
	li_rc = tab_view.tabpage_browse.dw_browse.RowCount()
	li_start_check = 1
	if li_rc > 0 then //reset startpages data modified maha110702
		FOR i = 1 to li_rc 
			tab_view.tabpage_browse.dw_browse.setItem( i, "start_page",li_start_check)	
			li_num_page = tab_view.tabpage_browse.dw_browse.GetItemNumber( i, "num_pages" )
			li_start_check = li_start_check + li_num_page	//set start for next record
		END FOR
	end if
END IF

IF li_rc > 0 THEN
	tab_view.tabpage_browse.dw_browse.ScrollToRow( 1 )
	tab_view.tabpage_browse.dw_browse.SetRow( 1 )
	tab_view.tabpage_browse.dw_browse.SelectRow( 1, True )
	tab_view.tabpage_browse.dw_browse.SetFocus()
END IF
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-03
//$<add> 02.20.2006 By: Cao YongWang
//$<reason> Performance tuning.
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

gnv_appeondb.of_autocommit()
//---------------------------- APPEON END ----------------------------

tab_view.tabpage_browse.dw_browse.Update()

COMMIT USING SQLCA;

tab_view.SelectTab( 1 )

Return 1


end function

public function integer of_add_annotation (string as_annotation_type);
//tab_view.tabpage_image.ole_scan_edit.Object.ShowAnnotationToolPalette( True,0,0,"")
//return 1
// mskinner 09 March 2005 -- begin
// add try/catch
try

tab_view.tabpage_image.ole_scan_edit.Object.SetCurrentAnnotationGroup( "image_annotations" )

CHOOSE CASE Upper( as_annotation_type )
		//select
	CASE "S"
		tab_view.tabpage_image.ole_scan_edit.Object.Annotationtype(11)	
		//highlight
	CASE "H"
		tab_view.tabpage_image.ole_scan_edit.Object.AnnotationFillColor( 8454143 )
		tab_view.tabpage_image.ole_scan_edit.Object.Annotationtype(4)	
		//note
	CASE "N"
		tab_view.tabpage_image.ole_scan_edit.Object.Annotationtype(10)	
		//textstamp
	CASE "T"
		//tab_view.tabpage_image.ole_scan_edit.object.ShowRubberStampDialog
		tab_view.tabpage_image.ole_scan_edit.Object.AnnotationStampText( "Testing stamp text" )		
		tab_view.tabpage_image.ole_scan_edit.Object.Annotationtype(8)	
	CASE "D"
		tab_view.tabpage_image.ole_scan_edit.Object.DeleteAnnotationGroup( is_annotation_name )	
		ii_modified = 1		
	CASE "P"
		tab_view.tabpage_image.ole_scan_edit.Object.object.ShowAttribsDialog(1)
END CHOOSE

catch (runtimeerror a)
	
end try

// mskinner 09 March 2005 -- end

Return 1
end function

public function integer of_page_properties ();//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 01/11/2008 By: Ken.Guo
//$<reason> Add Trap for fix issue.
//tab_view.tabpage_image.ole_scan_edit.Object.ShowPageProperties( False )
Try
	tab_view.tabpage_image.ole_scan_edit.Object.ShowPageProperties( False )
Catch(OleRuntimeError err)
	Return -1
End Try
//---------------------------- APPEON END ----------------------------

Return 1
end function

public function integer of_set_menu (integer ai_index);IF ai_index = 1  THEN
	st_recs.Visible = True
	st_page.Visible = False
	cbx_show.Visible = False
	st_zoom.Visible = False
	ddlb_zoom.Visible = False
	st_recs.Text = "Record " + String( tab_view.tabpage_browse.dw_browse.GetRow() ) +&
	" of " + String( tab_view.tabpage_browse.dw_browse.RowCount() )	
	//--------------------------- APPEON BEGIN ---------------------------
	//$<modify> 2006-11-14 By: Allen
	//$<reason> Fix APB Bug: the Toolbar Icon is invalid.
	//	w_mdi.ChangeMenu( m_pfe_cst_imaging_browse ) 
	//----------Begin Modified by Alfee on 10.13.2008 ------------------	
	IF w_mdi.menuname <> 'm_pfe_cst_imaging_browse' THEN
		w_mdi.ChangeMenu( m_pfe_cst_imaging_browse )
		of_enable_next_prev_buttons(ai_index)
		w_mdi.of_menu_security('m_pfe_cst_imaging_browse')
	END IF
	//IF w_mdi.menuname <> 'm_pfe_cst_imaging_browse' Then w_mdi.ChangeMenu( m_pfe_cst_imaging_browse )
	//-----------End Modified ------------------------------------------
	//---------------------------- APPEON END ----------------------------
	//	IF IsValid( m_pfe_cst_imaging ) THEN
	//		m_pfe_cst_imaging.m_file.m_saveimage.visible = False		
	//		m_pfe_cst_imaging.m_file.m_save.visible = True
	//		
	//		m_pfe_cst_imaging.m_edit.m_annotations.m_select.enabled = False
	//		m_pfe_cst_imaging.m_edit.m_annotations.m_select.toolbaritemvisible= False		
	//		m_pfe_cst_imaging.m_edit.m_annotations.m_highlight.enabled = False
	//		m_pfe_cst_imaging.m_edit.m_annotations.m_highlight.toolbaritemvisible= False		
	//		m_pfe_cst_imaging.m_edit.m_annotations.m_note.enabled = False
	//		m_pfe_cst_imaging.m_edit.m_annotations.m_note.toolbaritemvisible= False		
	//		m_pfe_cst_imaging.m_edit.m_annotations.m_stamptext.enabled = False
	//		m_pfe_cst_imaging.m_edit.m_annotations.m_stamptext.toolbaritemvisible= False				
	//		m_pfe_cst_imaging.m_edit.m_annotations.visible = False
	//		m_pfe_cst_imaging.m_edit.m_annotations.toolbaritemvisible= False				
	//		
	//		m_pfe_cst_imaging.m_file.m_print.enabled = True
	//		m_pfe_cst_imaging.m_file.m_print.toolbaritemvisible = True
	//		m_pfe_cst_imaging.m_file.m_batchprint.enabled = True
	//		m_pfe_cst_imaging.m_file.m_batchprint.toolbaritemvisible = True
	//		m_pfe_cst_imaging.m_file.m_save.toolbaritemvisible = True
	//		m_pfe_cst_imaging.m_file.m_saveimage.toolbaritemvisible = False
	//		m_pfe_cst_imaging.m_file.m_batchprint.toolbaritemvisible = True		
	//	END IF
	tab_view.tabpage_browse.dw_browse.SetFocus()
ELSEIF ai_index = 2 THEN
	st_recs.Visible = False
	st_page.Visible = True	
	cbx_show.Visible = True	
	st_zoom.Visible = True
	ddlb_zoom.Visible = True
	//--------------------------- APPEON BEGIN ---------------------------
	//$<modify> 2006-11-14 By: Allen
	//$<reason> Fix APB Bug: the Toolbar Icon is invalid.
	//	w_mdi.ChangeMenu( m_pfe_cst_imaging_view )
	//----------Begin Modified by Alfee on 10.13.2008 ------------------	
	IF w_mdi.menuname <> 'm_pfe_cst_imaging_view' THEN
		w_mdi.ChangeMenu( m_pfe_cst_imaging_view )
		of_enable_next_prev_buttons(ai_index)
		w_mdi.of_menu_security('m_pfe_cst_imaging_view')
	END IF
	//	If w_mdi.menuname <> 'm_pfe_cst_imaging_view' Then w_mdi.ChangeMenu( m_pfe_cst_imaging_view )
	//-----------End Modified ------------------------------------------
	//---------------------------- APPEON END ----------------------------
	//	IF IsValid( m_pfe_cst_imaging ) THEN
	//		m_pfe_cst_imaging.m_file.m_saveimage.visible = True		
	//	  	m_pfe_cst_imaging.m_file.m_save.visible = False		
	//					
	//		m_pfe_cst_imaging.m_file.m_print.enabled = False
	//		m_pfe_cst_imaging.m_file.m_print.toolbaritemvisible = False
	//		m_pfe_cst_imaging.m_file.m_batchprint.enabled = True
	//		m_pfe_cst_imaging.m_file.m_batchprint.toolbaritemvisible = True		
	//		m_pfe_cst_imaging.m_file.m_save.toolbaritemvisible = False
	//		m_pfe_cst_imaging.m_file.m_saveimage.toolbaritemvisible = True
	//		
	//		m_pfe_cst_imaging.m_edit.m_annotations.m_select.enabled = True
	//		m_pfe_cst_imaging.m_edit.m_annotations.m_select.toolbaritemvisible= True
	//		m_pfe_cst_imaging.m_edit.m_annotations.m_highlight.enabled = True
	//		m_pfe_cst_imaging.m_edit.m_annotations.m_highlight.toolbaritemvisible= True		
	//		m_pfe_cst_imaging.m_edit.m_annotations.m_note.enabled = True
	//		m_pfe_cst_imaging.m_edit.m_annotations.m_note.toolbaritemvisible= True		
	//		m_pfe_cst_imaging.m_edit.m_annotations.m_stamptext.enabled = True
	//		m_pfe_cst_imaging.m_edit.m_annotations.m_stamptext.toolbaritemvisible= True						
	//		m_pfe_cst_imaging.m_edit.m_annotations.visible = True				
	//		m_pfe_cst_imaging.m_edit.m_annotations.toolbaritemvisible = False
	//		m_pfe_cst_imaging.m_edit.m_annotations.toolbaritemvisible= True
	//		
	//	END IF
ELSEIF ai_index = 3 THEN
	st_recs.Visible = True
	st_page.Visible = False	
	cbx_show.Visible = False	
	st_zoom.Visible = False
	ddlb_zoom.Visible = False	
	st_recs.Text = "Record " + String( tab_view.tabpage_setup.dw_image_data.GetRow() ) +&
	" of " + String( tab_view.tabpage_setup.dw_image_data.RowCount() )
	//--------------------------- APPEON BEGIN ---------------------------
	//$<modify> 2006-11-14 By: Allen
	//$<reason> Fix APB Bug: the Toolbar Icon is invalid.
	//w_mdi.ChangeMenu( m_pfe_cst_imaging_setup )	
	//----------Begin Modified by Alfee on 10.13.2008 ------------------	
	IF w_mdi.menuname <> 'm_pfe_cst_imaging_setup' THEN
		w_mdi.ChangeMenu( m_pfe_cst_imaging_setup )
		of_enable_next_prev_buttons(ai_index)
		w_mdi.of_menu_security('m_pfe_cst_imaging_setup')		
	END IF
	//If w_mdi.menuname <> 'm_pfe_cst_imaging_setup' Then w_mdi.ChangeMenu( m_pfe_cst_imaging_setup )
	//-----------End Modified ------------------------------------------	 
	//---------------------------- APPEON END ----------------------------
	//	IF IsValid( m_pfe_cst_imaging ) THEN	
	//		m_pfe_cst_imaging.m_file.m_saveimage.visible = False		
	//		m_pfe_cst_imaging.m_file.m_save.visible = True
	//		m_pfe_cst_imaging.m_edit.m_annotations.toolbaritemvisible= False
	//		m_pfe_cst_imaging.m_edit.m_annotations.m_select.enabled = False
	//		m_pfe_cst_imaging.m_edit.m_annotations.m_select.toolbaritemvisible= False		
	//		m_pfe_cst_imaging.m_edit.m_annotations.m_highlight.enabled = False
	//		m_pfe_cst_imaging.m_edit.m_annotations.m_highlight.toolbaritemvisible= False		
	//		m_pfe_cst_imaging.m_edit.m_annotations.m_note.enabled = False
	//		m_pfe_cst_imaging.m_edit.m_annotations.m_note.toolbaritemvisible= False		
	//		m_pfe_cst_imaging.m_edit.m_annotations.m_stamptext.enabled = False
	//		m_pfe_cst_imaging.m_edit.m_annotations.m_stamptext.toolbaritemvisible= False			
	//		m_pfe_cst_imaging.m_edit.m_annotations.visible = False		
	//		m_pfe_cst_imaging.m_file.m_print.enabled = False
	//		m_pfe_cst_imaging.m_file.m_print.toolbaritemvisible = False
	//		m_pfe_cst_imaging.m_file.m_batchprint.enabled = False
	//		m_pfe_cst_imaging.m_file.m_batchprint.toolbaritemvisible = False
	//		m_pfe_cst_imaging.m_file.m_save.toolbaritemvisible = True		
	//		m_pfe_cst_imaging.m_file.m_saveimage.toolbaritemvisible = False		
	//	END IF

END IF

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> UM-01
//$<add> 01.20.2006 By: Rodger Wu
//$<reason> The SetToolbarPos function is currently unsupported. 
//$<modification> Replace the SetToolBarPos function with the Appeon defined function of_settoolbarpos to provide
//$<modification> the same functionality.
long ll_handle
ll_handle = handle(w_mdi)
gnv_appeondll.of_settoolbarpos(ll_handle)
//---------------------------- APPEON END ----------------------------

Return 1
end function

public function integer of_undo ();
try 
	IF ii_modified = 1 THEN //tab_view.tabpage_image.ole_scan_edit.Object.ImageModified() = True THEN
		tab_view.tabpage_image.ole_scan_edit.Object.Undo( 0 )
		ii_modified = 0
		//tab_view.tabpage_image.ole_scan_edit.Object.Save()
	ELSE
		MessageBox("Undo", "Nothing to Undo.")
	END IF
catch (runTimeError a)
	
end try
Return 1

end function

public function integer of_email_documents ();//Start Code Change ----10.06.2008 #V85 maha
if of_get_app_setting("set_56","I") = 1 then
	integer res
	res = of_email_outlook( )
	return res
end if
//End Code Change---10.06.2008

Long ll_rec_id 
Long ll_next_id
Long	ll_action_type
Long	ll_action_status
Long	ll_action_dept
DateTime	ldt_action_dt
DateTime	ldt_next_action_dt
String ls_app_type
String ls_emp_mail_login
String ls_action_notes
String ls_image_path
String ls_action_user
String ls_app_image_name
String ls_name
String ls_app_nm
String ls_email_address
String ls_subject
String ls_notetext
Integer li_pagecount
Integer li_num_pages
Integer li_start_page
Integer li_to_page
Integer li_image_type_count
Integer li_prac_image_cnt
Integer m
Integer z
Integer li_image_type_id
Integer li_image_count
Integer li_nd_row_cnt
Integer a
Integer li_rc
Integer i
Integer li_from_page
Integer li_print_exceptions
Integer li_found
Integer li_count
Integer li_sub //maha 011504
string mess //maha 011504
String	ls_Rtn

DataWindowChild dwchild

tab_view.tabpage_browse.dw_browse.AcceptText()
li_rc = tab_view.tabpage_browse.dw_browse.RowCount()


//Get image paths and load up image doc
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-04
//$<modify> 02.20.2006 By: Cao YongWang
//$<reason> Performance tuning.
//$<modification> Write script to retrieve data from a cache instead of from the database.

/*
SELECT ids.imaging_path ,
       ids.intelliapp_app_path
INTO :ls_image_path,
	  :gs_app_image_path  
FROM ids;
IF SQLCA.SQLCODE = -1 THEN
	MessageBox("Database Error", SQLCA.SQLERRTEXT )
	Return -1
END IF
*/
ls_image_path = gnv_data.of_getitem("ids" , "imaging_path" , False)
gs_app_image_path = gnv_data.of_getitem("ids" , "intelliapp_app_path" , False)
//---------------------------- APPEON END ----------------------------

FOR i = 1 TO li_rc
	IF tab_view.tabpage_browse.dw_browse.GetItemNumber( i, "selected" )	= 1 THEN
		li_count++
	END IF		
END FOR

//if not stored in db then check image path
IF ii_image_storage_type <> 1 THEN
	IF Not FileExists( ls_image_path + String( il_prac_id ) + ".tif" ) THEN
		MessageBox("Invalid File", ls_image_path + String( il_prac_id ) + ".tif" + " is an invalid file.  Check to make sure the image and path exists." )
		Return -1
//Start Code Change ---- 02.15.2006 #276 maha
	else //maha 021506 part of error checking
		tab_view.tabpage_browse.ole_admin.object.Image( ls_image_path + String( il_prac_id ) + ".tif" )
		li_image_count = tab_view.tabpage_browse.ole_admin.object.pagecount()
//End Code Change---02.15.2006
	END IF
END IF

IF li_count = 0 THEN
	MessageBox("Invalid Selection", "Nothing Selected" )
	Return -1
END IF
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-05
//$<modify> 02.20.2006 By: Cao YongWang
//$<reason> Performance tuning.
//$<modification> Write script to retrieve data from a cache instead of from the database.
/*
SELECT email_id INTO :ls_emp_mail_login FROM security_users WHERE user_id = :gs_user_id;	
*/
ls_emp_mail_login = gnv_data.of_getitem("security_users","email_id","upper(user_id)='" + upper(gs_user_id)+ "'")
//---------------------------- APPEON END ----------------------------

IF ls_emp_mail_login = "" OR IsNull( ls_emp_mail_login ) THEN
	MessageBox("", "You must setup an email login in the Security User Painter for user: " + gs_user_id )
	Return -1
END IF

Open( w_get_email_address_message )

mess = Message.StringParm
IF Message.StringParm = "Cancel" THEN
	Return -1
END IF
ls_email_address = Mid( Mess, 1, POS( Mess, "*" ) -1)
li_sub = POS( Mess, "**" ) //maha 011504
ls_notetext = Mid( Mess, POS( Mess, "*" ) +1, li_sub - POS( Mess, "*" ) - 1)	
ls_subject = Mid( Mess, li_sub +2) //maha 011504

FileDelete( gs_dir_path + gs_DefDirName + "\email_attachment.tif"  )
tab_view.tabpage_browse.ole_admin.object.Image( gs_dir_path + gs_DefDirName + "\email_attachment.tif" )

FOR i = 1 TO li_rc
	IF tab_view.tabpage_browse.dw_browse.GetItemNumber( i, "selected" )	= 0 THEN
		CONTINUE
	END IF					
	IF ii_image_storage_type = 1 THEN
		//scroll to the row
		tab_view.tabpage_browse.dw_browse.SetRow( i )
		//use the display function to display image
		of_display_doc( 1,1 )
		//print it out
		Sleep(1000)
		li_pagecount = tab_view.tabpage_image.ole_scan_edit.Object.Pagecount()
		
		//--------------------------- APPEON BEGIN ---------------------------
		//$<modify> 09.27.2006 By: LeiWei
		//$<reason> Fix a defect.
		/*
		tab_view.tabpage_browse.ole_admin.object.Append( gs_dir_path + gs_DefDirName + "\temp.tif", 1 , li_pagecount  )
		*/
		//--------------------------- APPEON BEGIN ---------------------------
		//$<add> 07/09/2007 By: Ken.Guo
		//$<reason> When Image Admin Merge file, The first image file must be in TIF format, Otherwise PB will runerror.
		If tab_view.tabpage_browse.ole_admin.object.pagecount() > 0 and tab_view.tabpage_browse.ole_admin.object.FileType <> 1 Then
			Messagebox('Image','The first image file must be in "TIF" format.')
			Return -1			
		End If
		//---------------------------- APPEON END ----------------------------

		//--------------------------- APPEON BEGIN ---------------------------
		//$< Add  > 2008-07-15 By: Scofield
		//$<Reason> Verify if the directory has write right for the current user.
		
		ls_Rtn = f_ExaWriteRight(is_display_doc_name)
		if Len(ls_Rtn) > 0 then
			MessageBox(gnv_app.iapp_object.DisplayName,ls_Rtn,Exclamation!)
			Return -1
		end if
		
		//---------------------------- APPEON END ----------------------------

		tab_view.tabpage_browse.ole_admin.object.Append( is_display_doc_name, 1 , li_pagecount  )
		//---------------------------- APPEON END ----------------------------
	ELSE			
		li_start_page = tab_view.tabpage_browse.dw_browse.GetItemNumber( i, "start_page" ) 
		li_num_pages = tab_view.tabpage_browse.dw_browse.GetItemNumber( i, "num_pages" ) 
	//Start Code Change ---- 02.15.2006 #276 maha
		if of_check_page_count(li_start_page,li_image_count,li_num_pages)	= -1 then return -1	
	//End Code Change---02.15.2006
		//--------------------------- APPEON BEGIN ---------------------------
		//$<add> 07/09/2007 By: Ken.Guo
		//$<reason> When Image Admin Merge(Append) file, The first image file must be in TIF format, Otherwise PB will runerror.
		If tab_view.tabpage_browse.ole_admin.object.pagecount() > 0 and tab_view.tabpage_browse.ole_admin.object.FileType <> 1 Then
			Messagebox('Image','The first image file must be in "TIF" format.')
			Return -1			
		End If
		//---------------------------- APPEON END ----------------------------
		
		//--------------------------- APPEON BEGIN ---------------------------
		//$< Add  > 2008-07-15 By: Scofield
		//$<Reason> Verify if the directory has write right for the current user.
		
		ls_Rtn = f_ExaWriteRight(ls_image_path)
		if Len(ls_Rtn) > 0 then
			MessageBox(gnv_app.iapp_object.DisplayName,ls_Rtn,Exclamation!)
			Return -1
		end if
		
		//---------------------------- APPEON END ----------------------------

		tab_view.tabpage_browse.ole_admin.object.Append( ls_image_path + String( il_prac_id ) + ".tif", li_start_page , li_num_pages  )			
	END IF
END FOR	

//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 06/13/2007 By: Ken.Guo
//$<reason> Send Email
	
		
	/*	
	mailSession mSes
	mailReturnCode mRet
	mailMessage mMsg
	mailFileDescription nfile1
	mailFileDescription nfile2
	mailFileDescription nfile3
	String ls_attach
	
	mSes = create mailSession
	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> UM-02
	//$<add> 01.25.2006 By: LeiWei
	//$<reason> mailSession is currently unsupported.
	//$<modification> Manually specify mailReturnSuccess! as the initial value to mRet. 
	mRet = mailReturnSuccess!
	//---------------------------- APPEON END ----------------------------
	mRet = mSes.mailLogon( mailNewSession!) //maha modifed 042005
	IF mRet <> mailReturnSuccess! THEN
		MessageBox("Mail", 'Logon failed.  Check to make sure you have an email id setup in the user painter.')		
		Return -1
	END IF
	ls_attach = gs_dir_path + gs_DefDirName + "\email_attachment.tif"
	IF Len( ls_attach ) > 0 THEN
		// Populate the attachment object
		nfile1.FileType = MailAttach!
		nfile1.FileName = "email_attachment.tif"
		nfile1.PathName = gs_dir_path + gs_DefDirName + "\email_attachment.tif"
		nfile1.position = 1
		mMsg.AttachmentFile[1] = nfile1	
	END IF
	
	mMsg.Subject = ls_subject
	mMsg.NoteText = ls_notetext
	mMsg.Recipient[1].name = ls_email_address
	mRet = mSes.mailSend(mMsg)
	
	IF mRet <> mailReturnSuccess! THEN
		MessageBox("Mail Send", 'Mail not sent')
		mSes.mailLogoff()
		DESTROY mSes
		Return -1
	END IF
	
	mSes.mailLogoff()
	DESTROY mSes
	
	Return -1
	*/

String ls_address_mailcc,ls_attachments,ls_attach
ls_attach = gs_dir_path + gs_DefDirName + "\email_attachment.tif"

//--------------------------- APPEON BEGIN ---------------------------
//$<Modify> 2007-11-21 By: Scofield
//$<Reason> Change the interface of send mail.

//IF lnv_redemption_mail.of_start_email( ls_email_address,ls_address_mailcc,ls_notetext, ls_subject, ls_attach) < 0 THEN
//	Return -1
//END IF

long		ll_Return

n_cst_easymail_smtp 	lnv_Mail

if lnv_Mail.of_CreateObject() = -1 then
	//Added by Nova.zhang on 2008-11-07
	f_show_message('create Email object','','','','')
	//MessageBox("Error", "Failed to create email object!",StopSign!)
	Return -1
end if

//START---Modify by Evan 2008-03-24 (Reasion:Send email with current user account)
/*
//--------------------------- APPEON BEGIN ---------------------------
//$< Add  > 2008-02-22 By: Scofield
//$<Reason> Get the Addresser's user id.

String	ls_Addresser

select top 1 set_addresser into :ls_Addresser from icred_settings;

if IsNull(ls_Addresser) or Trim(ls_Addresser) = "" then
	ls_Addresser = gs_User_Id
end if
//---------------------------- APPEON END ----------------------------

//Send EMail
ll_Return = lnv_Mail.of_SendText(ls_Addresser, ls_email_address, ls_address_mailcc, '',ls_subject, ls_notetext, ls_attach)
*/
ll_Return = lnv_Mail.of_SendText(gs_user_id, ls_email_address, ls_address_mailcc, '',ls_subject, ls_notetext, ls_attach)
//END---Modify by Evan 2008-03-24

if ll_Return <> 0 then
	//Added by Nova.zhang on 2008-11-07
	If lnv_Mail.is_sendprotocol = 'SMTP' Then
		f_show_message('error_code_'+string(ll_Return),'%1S%',String(ll_Return),'','')
	Else
		f_show_message('error_code_'+string(ll_Return),'ALL',lnv_Mail.of_getemailerror(ll_Return),'','')
	End If
	//MessageBox("Error Code: " + String(ll_Return), "Failed to send email!~r~n~r~n" + lnv_Mail.of_GetEMailError(ll_Return),Exclamation!)
	lnv_Mail.of_DeleteObject()
	return -1
end if

lnv_Mail.of_DeleteObject()
//---------------------------- APPEON END ----------------------------
Return 1
//---------------------------- APPEON END ----------------------------

end function

public function integer of_delete_all_images ();integer res
string ls_path




res = messagebox("Delete All Images?","This function will permanently delete all of the images for this practitioner.  Do you wish to continue?",question!,yesno!,2)
if res = 2 then return 0
res = messagebox("Delete All Images?","Are you sure?",question!,yesno!,2)
if res = 2 then return 0

tab_view.tabpage_image.ole_scan_edit.Object.ClearDisplay(  )
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-06
//$<modify> 02.20.2006 By: Cao YongWang
//$<reason> Performance tuning.
//$<modification> Write script to retrieve data from a cache instead of from the database.
/*
select imaging_path
into :ls_path
from ids;
*/
ls_path = gnv_data.of_getitem("ids" , "imaging_path" , false)
gnv_appeondb.of_autocommit()
//---------------------------- APPEON END ----------------------------

delete from pd_images
where prac_id = :gl_prac_id;
commit using sqlca;

FileDelete ( ls_path + string(gl_prac_id) + ".tif" )

tab_view.tabpage_browse.dw_browse.reset()
tab_view.tabpage_image.ole_scan_edit.Object.ClearDisplay(  ) //maha 082801

Return 1
end function

public function integer of_image_utility ();
//Start Code Change ---- 03.22.2006 #336 maha
IF ii_image_utility_on = 1 THEN
	tab_view.tabpage_browse.ole_thumb.Visible = True
	tab_view.tabpage_browse.cb_ass_file.Visible = True	
	ddlb_zoom.Visible = False
	cbx_show.Visible = False
	tab_view.tabpage_browse.lb_files.visible = true
	tab_view.tabpage_browse.lb_files.DirList( is_image_path, 1, tab_view.tabpage_browse.st_path)
	tab_view.tabpage_browse.dw_browse.x = 1202
	tab_view.tabpage_browse.dw_browse.y = 28
	tab_view.tabpage_browse.dw_browse.Width = 2245
	This.Text = "off"
	tab_view.tabpage_browse.st_path.Visible = True
	tab_view.tabpage_browse.sle_find_path.Visible = True
	tab_view.tabpage_browse.cb_find.Visible = True
	tab_view.tabpage_browse.dw_browse.Height = 808	
ELSE
//	ddlb_zoom.Visible = True
//	cbx_show.Visible = True	
//	tab_view.tabpage_browse.st_path.Visible = False
//	tab_view.tabpage_browse.sle_find_path.Visible = False
//	tab_view.tabpage_browse.cb_find.Visible = False	
//	tab_view.tabpage_browse.ole_thumb.Visible = False
//	tab_view.tabpage_browse.cb_ass_file.Visible = False	
//	tab_view.tabpage_browse.dw_browse.x = 18
//	tab_view.tabpage_browse.dw_browse.y = 16
//	tab_view.tabpage_browse.dw_browse.Width = 3410
//	tab_view.tabpage_browse.dw_browse.Height = 1680	
END IF
//End Code Change---03.22.2006
Return 0
end function

public function integer of_fax_documents ();SetPointer( HourGlass! )
Long ll_rec_id 
Long ll_next_id
Long	ll_action_type
Long	ll_action_status
Long	ll_action_dept
DateTime	ldt_action_dt
DateTime	ldt_next_action_dt
String ls_attachments[]
String ls_company
String ls_Fax
String ls_fax_number
String ls_recipient
String ls_cover_page 
String ls_cover_message
String ls_subject 
String ls_app_type
String ls_emp_mail_login
String ls_action_notes
String ls_image_path
String ls_action_user
String ls_app_image_name
String ls_name
String ls_app_nm
String ls_email_address
String ls_notetext
Integer li_num_pages
Integer li_start_page
Integer li_to_page
Integer li_image_type_count
Integer li_prac_image_cnt
Integer li_pagecount
Integer m
Integer z
Integer li_image_type_id
Integer li_image_count
Integer li_nd_row_cnt
Integer a
Integer li_rc
Integer i
Integer li_from_page
Integer li_print_exceptions
Integer li_found
Integer li_count
Integer li_sub //maha 011504
string 	mess //maha 011504
String	ls_Rtn

DataWindowChild dwchild

tab_view.tabpage_browse.dw_browse.AcceptText()
li_rc = tab_view.tabpage_browse.dw_browse.RowCount()

//Get image paths and load up image doc
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-07
//$<modify> 02.20.2006 By: Cao YongWang
//$<reason> Performance tuning.
//$<modification> Write script to retrieve data from a cache instead of from the database.
/*
SELECT ids.imaging_path ,
       ids.intelliapp_app_path
INTO :ls_image_path,
	  :gs_app_image_path  
FROM ids;
IF SQLCA.SQLCODE = -1 THEN
	MessageBox("Database Error", SQLCA.SQLERRTEXT )
	Return -1
END IF
*/
ls_image_path = gnv_data.of_getitem("ids" , "imaging_path" , False)
gs_app_image_path = gnv_data.of_getitem("ids" , "intelliapp_app_path" , False)
//---------------------------- APPEON END ----------------------------

FOR i = 1 TO li_rc
	IF tab_view.tabpage_browse.dw_browse.GetItemNumber( i, "selected" )	= 1 THEN
		li_count++
	END IF		
END FOR

IF li_count = 0 THEN
	MessageBox("Invalid Selection", "Nothing Selected" )
	Return -1
END IF

////--------------------------- APPEON BEGIN ---------------------------
////$<add> 05/29/2007 By: Ken.Guo
////$<reason> Added for MSFax Printer. Set_52(Fax_type,2:MSFax,1:WINFax)
//If gds_settings.GetItemNumber(1,'set_52') = 2 and li_count > 1 THEN
//	MessageBox("Invalid Selection", "Only one image can be selected for MSFax Printer." )
//	Return -1
//END IF
////---------------------------- APPEON END ----------------------------

IF ii_image_storage_type <> 1 THEN
	IF Not FileExists( ls_image_path + String( il_prac_id ) + ".tif" ) THEN
		MessageBox("Invalid File", ls_image_path + String( il_prac_id ) + ".tif" + " is an invalid file.  Check to make sure the image and path exists." )
		Return -1
	END IF
END IF


pfc_cst_nv_fax nv_fax
nv_fax = CREATE pfc_cst_nv_fax;
gs_pass_ids  lg_pass_ids

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 07/09/2007 By: Ken.Guo
//$<reason> If Directory is not exist, it will RunError when set image property for ImageAdmin
If Not DirectoryExists ( gs_dir_path + gs_DefDirName + "\Fax"  ) Then
	CreateDirectory(gs_dir_path + gs_DefDirName + "\Fax" )
End If
//---------------------------- APPEON END ----------------------------

FileDelete( gs_dir_path + gs_DefDirName + "\Fax\image_1.tif"  )

tab_view.tabpage_browse.ole_admin.object.Image( gs_dir_path + gs_DefDirName + "\Fax\image_1.tif" )

ls_attachments[1] = gs_dir_path + gs_DefDirName + "\Fax\image_1.tif"



//--------------------------- APPEON BEGIN ---------------------------
//$<add> 07/09/2007 By: Ken.Guo
//$<reason> When ImageAdmin Merge files, the first file's type must be TIF format. Otherwise PB will RunError.
Integer li_filetype  
//0	Unknown;	1	TIF;	2	AWD (Windows 95 and 98 only);	3	Bitmap (BMP);
//4	PCX;		5	DCX;	6	JPEG;	7	XIF;	8	GIF;	9	WIF;
//ll_times = 0
//---------------------------- APPEON END ----------------------------

FOR i = 1 TO li_rc
	IF tab_view.tabpage_browse.dw_browse.GetItemNumber( i, "selected" )	= 0 THEN
		CONTINUE
	END IF
	//--------------------------- APPEON BEGIN ---------------------------
	//$<add> 07/09/2007 By: Ken.Guo
	If tab_view.tabpage_browse.ole_admin.object.pagecount() > 0 and tab_view.tabpage_browse.ole_admin.object.FileType <> 1 Then
		Messagebox('Fax Send','The first image file you selected must be in "TIF" format.')
		Return -1			
	End If
	//---------------------------- APPEON END ----------------------------

	IF ii_image_storage_type = 1 THEN
		//scroll to the row
		tab_view.tabpage_browse.dw_browse.SetRow( i )
		//use the display function to display image
		Sleep(1000)
		of_display_doc( 1,1 )
		li_pagecount = tab_view.tabpage_image.ole_scan_edit.Object.Pagecount()
		
		//--------------------------- APPEON BEGIN ---------------------------
		//$< Add  > 2008-07-15 By: Scofield
		//$<Reason> Verify if the directory has write right for the current user.
		
		ls_Rtn = f_ExaWriteRight(is_display_doc_name)
		if Len(ls_Rtn) > 0 then
			MessageBox(gnv_app.iapp_object.DisplayName,ls_Rtn,Exclamation!)
			Return -1
		end if

		//---------------------------- APPEON END ----------------------------

		//--------------------------- APPEON BEGIN ---------------------------
		//$<modify> 09.27.2006 By: LeiWei
		//$<reason> Fix a defect.
		/*
		tab_view.tabpage_browse.ole_admin.object.Append( gs_dir_path + gs_DefDirName + "\temp.tif", 1 ,li_pagecount  )
		*/
		tab_view.tabpage_browse.ole_admin.object.Append( is_display_doc_name, 1 ,li_pagecount  )
		//---------------------------- APPEON END ----------------------------
	ELSE
		li_start_page = tab_view.tabpage_browse.dw_browse.GetItemNumber( i, "start_page" ) 
		li_num_pages = tab_view.tabpage_browse.dw_browse.GetItemNumber( i, "num_pages" ) 
		
		//--------------------------- APPEON BEGIN ---------------------------
		//$< Add  > 2008-07-15 By: Scofield
		//$<Reason> Verify if the directory has write right for the current user.
		ls_Rtn = f_ExaWriteRight(ls_image_path)
		if Len(ls_Rtn) > 0 then
			MessageBox(gnv_app.iapp_object.DisplayName,ls_Rtn,Exclamation!)
			Return -1
		end if
		
		//---------------------------- APPEON END ----------------------------

		tab_view.tabpage_browse.ole_admin.object.Append(ls_image_path + String( il_prac_id ) + ".tif", li_start_page , li_num_pages)
	END IF
END FOR	
	
OpenWithParm( w_fax_win, "Image" )
IF Message.StringParm = "Cancel" THEN
	Return -1
END IF
lg_pass_ids = Message.PowerObjectParm

ls_cover_page = lg_pass_ids.s_fax_cover
ls_cover_message = lg_pass_ids.s_fax_message 
ls_subject = lg_pass_ids.s_fax_subject	
ls_recipient = lg_pass_ids.s_fax_recipient
ls_fax = lg_pass_ids.s_fax_fax_number
ls_company = lg_pass_ids.s_fax_company
IF IsNull( ls_company ) THEN
	ls_company = ""
END IF
String ls_errtext		
IF nv_fax.of_fax( ls_recipient, ls_company, ls_fax, ls_subject, ls_cover_message, ls_attachments, ls_cover_page,ls_errtext )	= -1 THEN
	Messagebox('Fax Send',ls_errtext)
	Return -1
END IF
	
	

Return -1
end function

public function integer of_check_for_null_start (integer ai_start);//maha created 030405
	
	if isnull(ai_start) then //maha 030405
		MessageBox("Start Page", "There is no start page for image.  Unable to display/print image")
		return -1
	else
		return 1
	end if
end function

public subroutine of_doubleclicked (u_dw adw);integer li_start //maha03.20.2008
datawindow l_dw_browse
l_dw_browse = this.tab_view.tabpage_browse.dw_browse



//if ib_new_row_added then 
//	l_dw_browse.setrow( l_dw_browse.rowcount() + 1)
//	l_dw_browse.SelectRow(0, FALSE)
//   l_dw_browse.SelectRow(l_dw_browse.rowcount()  + 1, TRUE)
//end if 

il_current_row = this.tab_view.tabpage_browse.dw_browse.getrow( )

// mskinner 09 March 2006 -- begin
if il_current_row < 1 then return 
// mskinner 09 March 2006 -- end 

IF il_dispaly_row <> il_current_row THEN
	setredraw( false)
	// mskinner 14 Dec 2005 - begin
	//ADW.setItem(il_current_row,'selected',1) //Start Code Change ---- 04.20.2006 #406 maha removed
//Start Code Change ----03.20.2008 #V8 maha - set start page to 1 if stored in db
	if ii_image_storage_type = 1 then
		li_start = 1
	else
		li_start = ADW.GetItemNumber( il_current_row, "start_page" )
	end if
	// mskinner 14 Dec 2005 - end 
	of_display_doc( li_start, ADW.GetItemNumber( il_current_row, "num_pages" ) )
//End Code Change---03.20.2008
	tab_view.tabpage_image.ole_scan_edit.Object.Annotationtype(11)	

	il_dispaly_row = il_current_row
	setredraw(true)
	
END IF
end subroutine

public function integer of_print_image (integer al_start_page, integer al_pagecount);/******************************************************************************************************************
**  [PUBLIC]   : of_print_image( /*integer al_start_page*/, /*integer al_pagecount */)
**==================================================================================================================
**  Purpose   	: 
**==================================================================================================================
**  Arguments 	: [none] 
**==================================================================================================================
**  Returns   	: [none]   
**==================================================================================================================
**  Notes     	: 	   
**==================================================================================================================
**  Created By	: Michael B. Skinner  ? Intellisoftgroup, Inc
**==================================================================================================================
**  Modification Log
**   Changed By             Change Date                                               Reason
** ------------------------------------------------------------------------------------------------------------------
** MSkinner               13 March 2006 														Added Argumentts to the function to 
**																											PrintImage(al_start_page,al_pagecount)
**                                                                               ALL IMAGES WERE BEING PRINTED.
********************************************************************************************************************/
// al_pagecount is the page of the image to print to
//Start Code Change ---- 05.10.2006 #443 maha trap for bad pages
integer li_numpages
//End Code Change---05.01.2006
li_numpages = al_pagecount - al_start_page + 1

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 01/11/2008 By: Ken.Guo
//$<reason> Need add Try catch to access pagecount property firstly.
Try
	If tab_view.tabpage_image.ole_scan_edit.object.pagecount < 1 Then Return -1
Catch(OleRuntimeError err)
	Return -1
End Try
//---------------------------- APPEON END ----------------------------



if of_check_page_count( al_start_page, tab_view.tabpage_image.ole_scan_edit.object.pagecount, li_numpages) = -1 then return -1

try
	if ib_no_dialog then
		 tab_view.tabpage_image.ole_scan_edit.object.PrintImage(al_start_page,al_pagecount)
	else
		 tab_view.tabpage_browse.ole_admin.object.image = tab_view.tabpage_image.ole_scan_edit.object.image
		 inv_image_functions.of_print( tab_view.tabpage_browse.ole_admin,tab_view.tabpage_image.ole_scan_edit, Handle(this), '',al_start_page,al_pagecount)
	end if 
catch(Throwable e)
	MessageBox("Imaging","There is a printer error, Please check the printer.")
end try

return  0
end function

public function integer of_check_page_count (integer ai_start, integer ai_image, integer ai_num_pages);//Start Code Change ---- 02.15.2006 #277 maha
//Function created maha to validate the start and number of pages against the image pagecount.
integer li_cnt

li_cnt = ai_start + ai_num_pages - 1

if ai_start > ai_image then //validate the start page
	messagebox("Image Page Counts out of Sync","The start page (" + string(ai_start) + ") is greater than the number of pages in the image (" + string(ai_image) + "). Cannot continue process.")
	return -1
elseif li_cnt > ai_image then //validate the num of pages
	messagebox("Image Page Counts out of Sync","The start page and number of pages (" + string(li_cnt) + ") is greater than the number of pages in the image (" + string(ai_image) + "). Cannot continue process.")
	return -1
else
	return 1
end if

//End Code Change---02.15.2006

end function

public function integer of_browse_select_row (integer ai_row, integer ai_param);//Start Code Change ---- 04.24.2006 #407 maha
//new function created to set the proper dw_browse row either first or last
integer r
datawindow ldw_b

ldw_b = tab_view.tabpage_browse.dw_browse

//if set go to the last row
if ai_param > 0 then 
	r = ldw_b.rowcount()
else
	r = ai_row
end if
//if ai_param <> -1 then
//	messagebox("of_browse_set_row","ai_param: " + string(ai_param) + "; r: " + string(r) + "; ai_row: " +  string(ai_row))
//end if
//messagebox("of_browse_set_row",string(r))
ldw_b.SetRow( r )
ldw_b.SelectRow( 0, False )
ldw_b.SelectRow(r, True )
il_current_row = r
st_recs.Text = "Record " + String(r) + " of " + String( ldw_b.RowCount())

return 1

end function

public function integer of_scanner_select ();//Start Code Change ----02.21.2008 #V8 maha -  added
inv_image_functions.of_select_scanner(   tab_view.tabpage_setup.ole_scan)

return 1
end function

public function integer of_email_outlook ();Long ll_rec_id 
Long ll_next_id
Long	ll_action_type
Long	ll_action_status
Long	ll_action_dept
DateTime	ldt_action_dt
DateTime	ldt_next_action_dt
String ls_app_type
String ls_emp_mail_login
String ls_action_notes
String ls_image_path
String ls_action_user
String ls_app_image_name
String ls_name
String ls_app_nm
String ls_email_address
String ls_subject
String ls_notetext
Integer li_pagecount
Integer li_num_pages
Integer li_start_page
Integer li_to_page
Integer li_image_type_count
Integer li_prac_image_cnt
Integer m
Integer z
Integer li_image_type_id
Integer li_image_count
Integer li_nd_row_cnt
Integer a
Integer li_rc
Integer i
Integer li_from_page
Integer li_print_exceptions
Integer li_found
Integer li_count
Integer li_sub //maha 011504
string mess //maha 011504
String	ls_Rtn

DataWindowChild dwchild

tab_view.tabpage_browse.dw_browse.AcceptText()
li_rc = tab_view.tabpage_browse.dw_browse.RowCount()


//Get image paths and load up image doc
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-04
//$<modify> 02.20.2006 By: Cao YongWang
//$<reason> Performance tuning.
//$<modification> Write script to retrieve data from a cache instead of from the database.

/*
SELECT ids.imaging_path ,
       ids.intelliapp_app_path
INTO :ls_image_path,
	  :gs_app_image_path  
FROM ids;
IF SQLCA.SQLCODE = -1 THEN
	MessageBox("Database Error", SQLCA.SQLERRTEXT )
	Return -1
END IF
*/
ls_image_path = gnv_data.of_getitem("ids" , "imaging_path" , False)
gs_app_image_path = gnv_data.of_getitem("ids" , "intelliapp_app_path" , False)
//---------------------------- APPEON END ----------------------------

FOR i = 1 TO li_rc
	IF tab_view.tabpage_browse.dw_browse.GetItemNumber( i, "selected" )	= 1 THEN
		li_count++
	END IF		
END FOR

//if not stored in db then check image path
IF ii_image_storage_type <> 1 THEN
	IF Not FileExists( ls_image_path + String( il_prac_id ) + ".tif" ) THEN
		MessageBox("Invalid File", ls_image_path + String( il_prac_id ) + ".tif" + " is an invalid file.  Check to make sure the image and path exists." )
		Return -1
//Start Code Change ---- 02.15.2006 #276 maha
	else //maha 021506 part of error checking
		tab_view.tabpage_browse.ole_admin.object.Image( ls_image_path + String( il_prac_id ) + ".tif" )
		li_image_count = tab_view.tabpage_browse.ole_admin.object.pagecount()
//End Code Change---02.15.2006
	END IF
END IF

IF li_count = 0 THEN
	MessageBox("Invalid Selection", "Nothing Selected" )
	Return -1
END IF
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-05
//$<modify> 02.20.2006 By: Cao YongWang
//$<reason> Performance tuning.
//$<modification> Write script to retrieve data from a cache instead of from the database.
/*
SELECT email_id INTO :ls_emp_mail_login FROM security_users WHERE user_id = :gs_user_id;	
*/
ls_emp_mail_login = gnv_data.of_getitem("security_users","email_id","upper(user_id)='" + upper(gs_user_id)+ "'")
//---------------------------- APPEON END ----------------------------

IF ls_emp_mail_login = "" OR IsNull( ls_emp_mail_login ) THEN
	MessageBox("", "You must setup an email login in the Security User Painter for user: " + gs_user_id )
	Return -1
END IF

Open( w_get_email_address_message )

mess = Message.StringParm
IF Message.StringParm = "Cancel" THEN
	Return -1
END IF
ls_email_address = Mid( Mess, 1, POS( Mess, "*" ) -1)
li_sub = POS( Mess, "**" ) //maha 011504
ls_notetext = Mid( Mess, POS( Mess, "*" ) +1, li_sub - POS( Mess, "*" ) - 1)	
ls_subject = Mid( Mess, li_sub +2) //maha 011504

FileDelete( gs_dir_path + gs_DefDirName + "\email_attachment.tif"  )
tab_view.tabpage_browse.ole_admin.object.Image( gs_dir_path + gs_DefDirName + "\email_attachment.tif" )

FOR i = 1 TO li_rc
	IF tab_view.tabpage_browse.dw_browse.GetItemNumber( i, "selected" )	= 0 THEN
		CONTINUE
	END IF					
	IF ii_image_storage_type = 1 THEN
		//scroll to the row
		tab_view.tabpage_browse.dw_browse.SetRow( i )
		//use the display function to display image
		of_display_doc( 1,1 )
		//print it out
		Sleep(1000)
		li_pagecount = tab_view.tabpage_image.ole_scan_edit.Object.Pagecount()
		
		//--------------------------- APPEON BEGIN ---------------------------
		//$<modify> 09.27.2006 By: LeiWei
		//$<reason> Fix a defect.
		/*
		tab_view.tabpage_browse.ole_admin.object.Append( gs_dir_path + gs_DefDirName + "\temp.tif", 1 , li_pagecount  )
		*/
		//--------------------------- APPEON BEGIN ---------------------------
		//$<add> 07/09/2007 By: Ken.Guo
		//$<reason> When Image Admin Merge file, The first image file must be in TIF format, Otherwise PB will runerror.
		If tab_view.tabpage_browse.ole_admin.object.pagecount() > 0 and tab_view.tabpage_browse.ole_admin.object.FileType <> 1 Then
			Messagebox('Image','The first image file must be in "TIF" format.')
			Return -1			
		End If
		//---------------------------- APPEON END ----------------------------

		//--------------------------- APPEON BEGIN ---------------------------
		//$< Add  > 2008-07-15 By: Scofield
		//$<Reason> Verify if the directory has write right for the current user.
		
		ls_Rtn = f_ExaWriteRight(is_display_doc_name)
		if Len(ls_Rtn) > 0 then
			MessageBox(gnv_app.iapp_object.DisplayName,ls_Rtn,Exclamation!)
			Return -1
		end if
		
		//---------------------------- APPEON END ----------------------------

		tab_view.tabpage_browse.ole_admin.object.Append( is_display_doc_name, 1 , li_pagecount  )
		//---------------------------- APPEON END ----------------------------
	ELSE			
		li_start_page = tab_view.tabpage_browse.dw_browse.GetItemNumber( i, "start_page" ) 
		li_num_pages = tab_view.tabpage_browse.dw_browse.GetItemNumber( i, "num_pages" ) 
	//Start Code Change ---- 02.15.2006 #276 maha
		if of_check_page_count(li_start_page,li_image_count,li_num_pages)	= -1 then return -1	
	//End Code Change---02.15.2006
		//--------------------------- APPEON BEGIN ---------------------------
		//$<add> 07/09/2007 By: Ken.Guo
		//$<reason> When Image Admin Merge(Append) file, The first image file must be in TIF format, Otherwise PB will runerror.
		If tab_view.tabpage_browse.ole_admin.object.pagecount() > 0 and tab_view.tabpage_browse.ole_admin.object.FileType <> 1 Then
			Messagebox('Image','The first image file must be in "TIF" format.')
			Return -1			
		End If
		//---------------------------- APPEON END ----------------------------
		
		//--------------------------- APPEON BEGIN ---------------------------
		//$< Add  > 2008-07-15 By: Scofield
		//$<Reason> Verify if the directory has write right for the current user.
		
		ls_Rtn = f_ExaWriteRight(ls_image_path)
		if Len(ls_Rtn) > 0 then
			MessageBox(gnv_app.iapp_object.DisplayName,ls_Rtn,Exclamation!)
			Return -1
		end if
		
		//---------------------------- APPEON END ----------------------------

		tab_view.tabpage_browse.ole_admin.object.Append( ls_image_path + String( il_prac_id ) + ".tif", li_start_page , li_num_pages  )			
	END IF
END FOR	

//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 06/13/2007 By: Ken.Guo
//$<reason> Send Email
	
		
	/*	
	mailSession mSes
	mailReturnCode mRet
	mailMessage mMsg
	mailFileDescription nfile1
	mailFileDescription nfile2
	mailFileDescription nfile3
	String ls_attach
	
	mSes = create mailSession
	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> UM-02
	//$<add> 01.25.2006 By: LeiWei
	//$<reason> mailSession is currently unsupported.
	//$<modification> Manually specify mailReturnSuccess! as the initial value to mRet. 
	mRet = mailReturnSuccess!
	//---------------------------- APPEON END ----------------------------
	mRet = mSes.mailLogon( mailNewSession!) //maha modifed 042005
	IF mRet <> mailReturnSuccess! THEN
		MessageBox("Mail", 'Logon failed.  Check to make sure you have an email id setup in the user painter.')		
		Return -1
	END IF
	ls_attach = gs_dir_path + gs_DefDirName + "\email_attachment.tif"
	IF Len( ls_attach ) > 0 THEN
		// Populate the attachment object
		nfile1.FileType = MailAttach!
		nfile1.FileName = "email_attachment.tif"
		nfile1.PathName = gs_dir_path + gs_DefDirName + "\email_attachment.tif"
		nfile1.position = 1
		mMsg.AttachmentFile[1] = nfile1	
	END IF
	
	mMsg.Subject = ls_subject
	mMsg.NoteText = ls_notetext
	mMsg.Recipient[1].name = ls_email_address
	mRet = mSes.mailSend(mMsg)
	
	IF mRet <> mailReturnSuccess! THEN
		MessageBox("Mail Send", 'Mail not sent')
		mSes.mailLogoff()
		DESTROY mSes
		Return -1
	END IF
	
	mSes.mailLogoff()
	DESTROY mSes
	
	Return -1
	*/

String ls_address_mailcc,ls_attachments,ls_attach
ls_attach = gs_dir_path + gs_DefDirName + "\email_attachment.tif"

//--------------------------- APPEON BEGIN ---------------------------
//$<Modify> 2007-11-21 By: Scofield
//$<Reason> Change the interface of send mail.

//IF lnv_redemption_mail.of_start_email( ls_email_address,ls_address_mailcc,ls_notetext, ls_subject, ls_attach) < 0 THEN
//	Return -1
//END IF

long		ll_Return

n_cst_easymail_smtp 	lnv_Mail

if lnv_Mail.of_CreateObject() = -1 then
	MessageBox("Error", "Failed to create email object!",StopSign!)
	Return -1
end if

//START---Modify by Evan 2008-03-24 (Reasion:Send email with current user account)
/*
//--------------------------- APPEON BEGIN ---------------------------
//$< Add  > 2008-02-22 By: Scofield
//$<Reason> Get the Addresser's user id.

String	ls_Addresser

select top 1 set_addresser into :ls_Addresser from icred_settings;

if IsNull(ls_Addresser) or Trim(ls_Addresser) = "" then
	ls_Addresser = gs_User_Id
end if
//---------------------------- APPEON END ----------------------------

//Send EMail
ll_Return = lnv_Mail.of_SendText(ls_Addresser, ls_email_address, ls_address_mailcc, '',ls_subject, ls_notetext, ls_attach)
*/
ll_Return = lnv_Mail.of_SendText(gs_user_id, ls_email_address, ls_address_mailcc, '',ls_subject, ls_notetext, ls_attach)
//END---Modify by Evan 2008-03-24

if ll_Return <> 0 then
	If lnv_Mail.is_sendprotocol = 'SMTP' Then
		f_show_message('error_code_'+string(ll_Return),'%1S%',String(ll_Return),'','')
	Else
		f_show_message('error_code_'+string(ll_Return),'ALL',lnv_Mail.of_getemailerror(ll_Return),'','')
	End If
	lnv_Mail.of_DeleteObject()
	return -1
end if

lnv_Mail.of_DeleteObject()
//---------------------------- APPEON END ----------------------------
Return 1
//---------------------------- APPEON END ----------------------------

end function

public function integer of_enable_next_prev_buttons (integer ai_index);//Added by Alfee on 10.13.2008

Integer li_current_row_page
Integer li_total_row_page

m_pfe_cst_imaging lm_image

CHOOSE CASE ai_index
	CASE 1
		lm_image = m_pfe_cst_imaging_browse
	CASE 2
		lm_image = m_pfe_cst_imaging_view
	CASE 3
		lm_image = m_pfe_cst_imaging_setup
	CASE ELSE
		lm_image = m_pfe_cst_imaging
END CHOOSE

IF NOT IsValid(lm_image) THEN RETURN -1

IF ai_index = 1 THEN	
	li_current_row_page = tab_view.tabpage_browse.dw_browse.GetRow()
	li_total_row_page = tab_view.tabpage_browse.dw_browse.RowCount()
	gnv_app.of_modify_menu_attr( lm_image.m_view.m_nextpage,'enabled', False)
	gnv_app.of_modify_menu_attr( lm_image.m_view.m_priorpage,'enabled', False)

	IF li_current_row_page < li_total_row_page THEN
		gnv_app.of_modify_menu_attr( lm_image.m_view.m_nextpage,'enabled', True)	
	END IF

	IF li_current_row_page > 1 THEN
		gnv_app.of_modify_menu_attr( lm_image.m_view.m_priorpage,'enabled', True)
	END IF
ELSEIF ai_index = 2 THEN	
	gnv_app.of_modify_menu_attr( lm_image.m_view.m_nextpage,'enabled', False)
	gnv_app.of_modify_menu_attr( lm_image.m_view.m_priorpage,'enabled', False)

	IF ii_current_page < ii_num_pages THEN
		gnv_app.of_modify_menu_attr( lm_image.m_view.m_nextpage,'enabled', True)	
	END IF

	IF ii_current_page > 1 THEN
		gnv_app.of_modify_menu_attr( lm_image.m_view.m_priorpage,'enabled', True)
	END IF
ELSE
	gnv_app.of_modify_menu_attr( lm_image.m_view.m_nextpage,'enabled', False)
	gnv_app.of_modify_menu_attr( lm_image.m_view.m_priorpage,'enabled', False)	
END IF

Return 1
end function

on pfc_cst_u_imaging.create
this.st_zoom=create st_zoom
this.ddlb_zoom=create ddlb_zoom
this.cbx_show=create cbx_show
this.st_page=create st_page
this.st_recs=create st_recs
this.tab_view=create tab_view
this.Control[]={this.st_zoom,&
this.ddlb_zoom,&
this.cbx_show,&
this.st_page,&
this.st_recs,&
this.tab_view}
end on

on pfc_cst_u_imaging.destroy
destroy(this.st_zoom)
destroy(this.ddlb_zoom)
destroy(this.cbx_show)
destroy(this.st_page)
destroy(this.st_recs)
destroy(this.tab_view)
end on

event constructor;Integer li_image_storage_type

inv_dw = CREATE pfc_cst_nv_data_entry_functions
inv_dw.of_setup_cache()
//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 2006-10-09 By: Liu Hongxin
//$<reason> Modify according to new required and show huge.
/*
ddlb_zoom.Text = "Fit To Width"
*/
ddlb_zoom.Text = "Actual Size"
//---------------------------- APPEON END ----------------------------

//SELECT image_storage_type 
//INTO :li_image_storage_type
//FROM icred_settings;
li_image_storage_type = of_get_app_setting("image_storage_type","I")

IF li_image_storage_type = 1 THEN
	ii_image_storage_type = 1
	inv_image_functions = CREATE pfc_cst_nv_image_functions
ELSE
	ii_image_storage_type = 0	
END IF


end event

event destructor;DESTROY inv_image_functions;
end event

type st_zoom from statictext within pfc_cst_u_imaging
integer x = 1714
integer y = 1628
integer width = 251
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Zoom:"
alignment alignment = right!
boolean focusrectangle = false
end type

type ddlb_zoom from dropdownlistbox within pfc_cst_u_imaging
integer x = 1979
integer y = 1616
integer width = 480
integer height = 584
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean vscrollbar = true
string item[] = {"Best Fit","Fit To Width","Fit To Height","Actual Size"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;CHOOSE CASE This.Text
	CASE "Best Fit"
		tab_view.tabpage_image.ole_scan_edit.Object.FitTo( 0 )
	CASE "Fit To Width"
		tab_view.tabpage_image.ole_scan_edit.Object.FitTo( 1 )		
	CASE "Fit To Height"
		tab_view.tabpage_image.ole_scan_edit.Object.FitTo( 2 )		
	CASE "Actual Size"		
		tab_view.tabpage_image.ole_scan_edit.Object.FitTo( 3 )		
END CHOOSE

end event

type cbx_show from checkbox within pfc_cst_u_imaging
integer x = 1143
integer y = 1616
integer width = 571
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Show Annotations"
boolean checked = true
end type

event clicked;if tab_view.tabpage_image.ole_scan_edit.Object.Imagedisplayed = false then return //maha 031505

// mskinner 09 March 2005 -- begin

TRY
		IF This.Checked THEN
			tab_view.tabpage_image.ole_scan_edit.Object.ShowAnnotationGroup( "image_annotations" )
		ELSE
			tab_view.tabpage_image.ole_scan_edit.Object.HideAnnotationGroup( "image_annotations" )	
		END IF

CATCH (RunTimeError rte)
      
END TRY


// mskinner 09 March 2005 -- end
end event

type st_page from statictext within pfc_cst_u_imaging
integer x = 3141
integer y = 1632
integer width = 357
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Page 1 of 1"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_recs from statictext within pfc_cst_u_imaging
integer x = 3141
integer y = 1628
integer width = 357
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Record 1 of 1"
alignment alignment = right!
boolean focusrectangle = false
end type

type tab_view from tab within pfc_cst_u_imaging
integer x = 23
integer y = 4
integer width = 3474
integer height = 1684
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 79741120
boolean raggedright = true
tabposition tabposition = tabsonbottom!
integer selectedtab = 1
tabpage_browse tabpage_browse
tabpage_image tabpage_image
tabpage_setup tabpage_setup
end type

on tab_view.create
this.tabpage_browse=create tabpage_browse
this.tabpage_image=create tabpage_image
this.tabpage_setup=create tabpage_setup
this.Control[]={this.tabpage_browse,&
this.tabpage_image,&
this.tabpage_setup}
end on

on tab_view.destroy
destroy(this.tabpage_browse)
destroy(this.tabpage_image)
destroy(this.tabpage_setup)
end on

event selectionchanged;if oldindex = -1 or newindex = -1 then return

SetPointer(HourGlass!) // alfee 12.12.2008
SetRedraw(False) //alfee 12.12.2008

of_set_menu( newindex )
//--------Begin Commented by Alfee on 10.13.2008------
//<$Reason>Moved into of_set_menu(...)
//IF newindex = 1 THEN
//	of_enable_next_prev_buttons( "Browse" )
//ELSE
//	of_enable_next_prev_buttons( "Other" )
//END IF 
//--------End Commented -------------------------------

IF newindex = 2 THEN //Start Code Change ---- 10.03.2006 #625 maha
	of_doubleclicked(THIS.tabpage_browse.dw_browse)
end if
//--------------------------- APPEON BEGIN ---------------------------
//$<add> 10.26.2006 By: Jack (Inova)
//$<reason> 5. Queue Images for Scanning from Data Entry.
if newindex = 3 then
	long ll_image_type_id,ll_find
	if iw_parent_window.tab_1.tabpage_detail.uo_data_entry.ids_image_data.rowcount() > 0 then
		ll_image_type_id = iw_parent_window.tab_1.tabpage_detail.uo_data_entry.ids_image_data.getitemnumber(1,'image_type_id')
	end if
	ll_find = tab_view.tabpage_setup.dw_image_list.find("image_type_id = " + string(ll_image_type_id),1,100)
	if ll_find > 0 then
		tab_view.tabpage_setup.dw_image_list.ScrollToRow( ll_find )
		tab_view.tabpage_setup.dw_image_list.SetRow( ll_find )
	end if
	tab_view.tabpage_setup.dw_image_data.setfocus()
	tab_view.tabpage_setup.dw_image_data.setcolumn('notes')
end if
//---------------------------- APPEON END ----------------------------

SetRedraw(TRUE) //alfee 12.12.2008

end event

type tabpage_browse from userobject within tab_view
integer x = 18
integer y = 16
integer width = 3438
integer height = 1556
long backcolor = 79741120
string text = "Browse"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "Justify!"
long picturemaskcolor = 12632256
cb_ass_file cb_ass_file
ole_thumb ole_thumb
cb_find cb_find
sle_find_path sle_find_path
st_path st_path
ole_admin ole_admin
dw_browse dw_browse
lb_files lb_files
end type

on tabpage_browse.create
this.cb_ass_file=create cb_ass_file
this.ole_thumb=create ole_thumb
this.cb_find=create cb_find
this.sle_find_path=create sle_find_path
this.st_path=create st_path
this.ole_admin=create ole_admin
this.dw_browse=create dw_browse
this.lb_files=create lb_files
this.Control[]={this.cb_ass_file,&
this.ole_thumb,&
this.cb_find,&
this.sle_find_path,&
this.st_path,&
this.ole_admin,&
this.dw_browse,&
this.lb_files}
end on

on tabpage_browse.destroy
destroy(this.cb_ass_file)
destroy(this.ole_thumb)
destroy(this.cb_find)
destroy(this.sle_find_path)
destroy(this.st_path)
destroy(this.ole_admin)
destroy(this.dw_browse)
destroy(this.lb_files)
end on

type cb_ass_file from commandbutton within tabpage_browse
boolean visible = false
integer x = 27
integer y = 1408
integer width = 489
integer height = 84
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Associate Image File"
end type

event clicked;
Integer li_thumb_count
Integer i
Integer li_page_cnt
Integer li_page[]

li_thumb_count = ole_thumb.Object.ThumbCount()

FOR i = 1 TO li_thumb_count
	IF ole_thumb.Object.ThumbSelected( i ) = True THEN
		li_page_cnt++
		li_page[ li_page_cnt ] = i
	END IF
END FOR



dw_browse.SetItem( dw_browse.GetRow( ), "start_page", li_page[1] )
dw_browse.SetItem( dw_browse.GetRow( ), "num_pages", li_page_cnt )
dw_browse.SetItem( dw_browse.GetRow( ), "file_name", lb_files.SelectedItem()  )
end event

type ole_thumb from olecustomcontrol within tabpage_browse
event click ( long thumbnumber )
event dblclick ( long thumbnumber )
event mousedown ( integer button,  integer shift,  long ocx_x,  long ocx_y,  long thumbnumber )
event mouseup ( integer button,  integer shift,  long ocx_x,  long ocx_y,  long thumbnumber )
event mousemove ( integer button,  integer shift,  long ocx_x,  long ocx_y,  long thumbnumber )
event thumbdrop ( long insertbefore,  long dropcount,  integer shift )
event thumbdrag ( long dragcount,  integer shift )
event ocx_error ( integer number,  ref string description,  long scode,  string source,  string helpfile,  long helpcontext,  ref boolean canceldisplay )
event keydown ( ref integer keycode,  integer shift )
event keyup ( ref integer keycode,  integer shift )
event readystatechange ( long readystate )
boolean visible = false
integer x = 1184
integer y = 844
integer width = 1317
integer height = 768
integer taborder = 21
borderstyle borderstyle = stylelowered!
string binarykey = "pfc_cst_u_imaging.udo"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
end type

type cb_find from commandbutton within tabpage_browse
boolean visible = false
integer x = 910
integer y = 28
integer width = 251
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Find File"
end type

event clicked;Long Index
Index = lb_files.FindItem( sle_find_path.Text, 1 )

IF Index > 0 THEN
	lb_files.SelectItem( Index )
ELSE
	MessageBox("Not Found", "File not found." )
END IF
end event

type sle_find_path from singlelineedit within tabpage_browse
boolean visible = false
integer x = 27
integer y = 28
integer width = 864
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type st_path from statictext within tabpage_browse
boolean visible = false
integer x = 32
integer y = 1336
integer width = 1134
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
boolean border = true
boolean focusrectangle = false
end type

type ole_admin from olecustomcontrol within tabpage_browse
event filepropertiesclose ( )
integer x = 50
integer y = 1320
integer width = 1317
integer height = 768
integer taborder = 60
borderstyle borderstyle = stylelowered!
string binarykey = "pfc_cst_u_imaging.udo"
integer binaryindex = 1
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
end type

type dw_browse from u_dw within tabpage_browse
integer x = 9
integer y = 4
integer width = 3406
integer height = 1528
integer taborder = 20
string dataobject = "d_pd_image_list"
boolean hscrollbar = true
end type

event clicked;call super::clicked;integer r
//Start Code Change ---- 04.24.2006 #408 maha
IF This.GetClickedRow() > 0 AND row > 0 THEN
	r = This.GetClickedRow()
	of_browse_select_row( r, -1)
END IF
//End Code Change---04.24.2006

end event

event doubleclicked;//of_doubleclicked(THIS) //Start Code Change ---- 04.24.2006 #409 maha removed because redundant
tab_view.SelectTab( 2 )

end event

event retrieveend;call super::retrieveend;//Start Code Change ---- 04.24.2006 #410 maha
IF rowcount > 0 THEN
	of_browse_select_row( 1, -5)
	This.SetFocus()
END IF
//End Code Change---04.24.2006

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 08.12.2006 By: LeiWei
//$<reason> Fix a defect.
il_dispaly_row = 0
//---------------------------- APPEON END ----------------------------

//Start Code Change ---- 04.04.2007 #V7 maha  moved from rfc code of dw image list
tab_view.tabpage_setup.dw_image_data.retrieve(il_prac_id)
//End Code Change---04.04.2007

of_enable_next_prev_buttons( "Browse" )

end event

event pfc_nextpage;Integer li_row

li_row = This.GetRow()
IF li_row < This.RowCount() THEN
	This.SetRow( li_row + 1) 
	This.ScrollToRow( li_row + 1 )
	This.SelectRow( 0, False )
	This.SelectRow( li_row + 1, True )
END IF

Return 1
end event

event pfc_previouspage;Integer li_row

li_row = This.GetRow()
IF li_row > 1 THEN
	li_row --
	This.SelectRow( 0, False )
	This.SelectRow( li_row, True )	
	This.SetRow( li_row ) 
	This.ScrollToRow( li_row )
END IF

Return li_row
end event

event rowfocuschanged;call super::rowfocuschanged;st_recs.Text = "Record " + String(currentrow) + " of " + String( This.RowCount()) //maha removed


of_enable_next_prev_buttons( "Browse" )

// mskinner 06 feb 2006 -- begin
il_current_row = currentrow
// mskinner 06 feb 2006 -- end 

end event

event pfc_deleterow;of_delete_image()

Return 1
end event

event buttonclicked;call super::buttonclicked;integer res
string ls_path




res = messagebox("Delete All Images?","This function will permanently delete all of the images for this practitioner.  Do you wish to continue?",question!,yesno!,2)
if res = 2 then return 0
res = messagebox("Delete All Images?","Are you sure?",question!,yesno!,2)
if res = 2 then return 0

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-08
//$<modify> 02.20.2006 By: Cao YongWang
//$<reason> Performance tuning.
//$<modification> Write script to retrieve data from a cache instead of from the database.
/*
select imaging_path
into :ls_path
from ids;
*/
ls_path = gnv_data.of_getitem("ids","imaging_path",false)
//---------------------------- APPEON END ----------------------------

IF IsNull( gl_prac_id ) OR gl_prac_id = 0 THEN
	MessageBox("prac_id", "The gl_prac_id variable is null or 0" )
	Return
END IF

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-09
//$<add> 01.24.2006 By: Cao YongWang
//$<reason> Performance tuning
//$<modification> Add Appeon Commit label to reduce client-server interactions to improve runtime performance.

gnv_appeondb.of_autocommit()
//---------------------------- APPEON END ----------------------------
delete from pd_images
where prac_id = :gl_prac_id;
commit using sqlca;

FileDelete ( ls_path + string(gl_prac_id) + ".tif" )

this.reset()
tab_view.tabpage_image.ole_scan_edit.Object.ClearDisplay(  ) //maha 082801
end event

event constructor;call super::constructor;//Start Code Change ---- 12.05.2006 #V7 maha
//if using stroe in database change the column header; there is also a bitmap of the image exists in the database.
if of_get_app_setting("image_storage_type","I") = 1 then
	this.object.start_page_t.text = "In~rDB"
	this.object.start_page.color = rgb(255,255,255)
end if
//End Code Change---12.05.2006
end event

type lb_files from listbox within tabpage_browse
boolean visible = false
integer x = 27
integer y = 132
integer width = 1134
integer height = 1196
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;String ls_file_name

ls_file_name = is_image_path + lb_files.SelectedItem( )

ole_thumb.object.Image( ls_file_name )
end event

type tabpage_image from userobject within tab_view
integer x = 18
integer y = 16
integer width = 3438
integer height = 1556
long backcolor = 79741120
string text = "Preview"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "Picture5!"
long picturemaskcolor = 12632256
ole_scan_edit ole_scan_edit
cbx_1 cbx_1
end type

on tabpage_image.create
this.ole_scan_edit=create ole_scan_edit
this.cbx_1=create cbx_1
this.Control[]={this.ole_scan_edit,&
this.cbx_1}
end on

on tabpage_image.destroy
destroy(this.ole_scan_edit)
destroy(this.cbx_1)
end on

type ole_scan_edit from olecustomcontrol within tabpage_image
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
integer width = 3438
integer height = 1476
integer taborder = 40
long backcolor = 67108864
boolean focusrectangle = false
string binarykey = "pfc_cst_u_imaging.udo"
integer binaryindex = 2
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
end type

event markselect(integer button, integer shift, long left, long top, long ocx_width, long ocx_height, integer marktype, string groupname);//Start Code Change ---- 05.17.2006 #457 maha was not carried over from v4.5
is_annotation_name = groupname
//End Code Change---05.17.2006
end event

type cbx_1 from u_cbx within tabpage_image
integer x = 9
integer y = 1476
integer width = 882
integer height = 72
string text = "Use Default/Previous Printer"
boolean checked = true
end type

event clicked;call super::clicked;


if this.checked then 
	ib_no_dialog = true
else 
	
	ib_no_dialog = false
	
end if 
end event

type tabpage_setup from userobject within tab_view
integer x = 18
integer y = 16
integer width = 3438
integer height = 1556
long backcolor = 79741120
string text = "Scanning"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "Custom087!"
long picturemaskcolor = 12632256
ole_admin1 ole_admin1
cb_from_file cb_from_file
cb_remove cb_remove
dw_image_list dw_image_list
dw_image_data dw_image_data
ole_scan ole_scan
cb_scan cb_scan
cb_select cb_select
dw_data dw_data
end type

on tabpage_setup.create
this.ole_admin1=create ole_admin1
this.cb_from_file=create cb_from_file
this.cb_remove=create cb_remove
this.dw_image_list=create dw_image_list
this.dw_image_data=create dw_image_data
this.ole_scan=create ole_scan
this.cb_scan=create cb_scan
this.cb_select=create cb_select
this.dw_data=create dw_data
this.Control[]={this.ole_admin1,&
this.cb_from_file,&
this.cb_remove,&
this.dw_image_list,&
this.dw_image_data,&
this.ole_scan,&
this.cb_scan,&
this.cb_select,&
this.dw_data}
end on

on tabpage_setup.destroy
destroy(this.ole_admin1)
destroy(this.cb_from_file)
destroy(this.cb_remove)
destroy(this.dw_image_list)
destroy(this.dw_image_data)
destroy(this.ole_scan)
destroy(this.cb_scan)
destroy(this.cb_select)
destroy(this.dw_data)
end on

type ole_admin1 from olecustomcontrol within tabpage_setup
event filepropertiesclose ( )
boolean visible = false
integer x = 2139
integer y = 636
integer width = 151
integer height = 96
integer taborder = 70
borderstyle borderstyle = stylelowered!
string binarykey = "pfc_cst_u_imaging.udo"
integer binaryindex = 3
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
end type

type cb_from_file from commandbutton within tabpage_setup
integer x = 2400
integer y = 640
integer width = 498
integer height = 84
integer taborder = 21
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "&Get From File"
end type

event clicked;//Start Code Change ---- 04.24.2006 #411 maha
if dw_image_data.rowcount() < 1 then return //maha 042406
tab_view.tabpage_image.ole_scan_edit.Object.ClearDisplay(  ) //maha 061201

if tab_view.tabpage_setup.dw_image_data.rowcount() > 1 then
	messagebox("Get from file","When using the Get from File function, you can only have one data item selected at a time.")
	return
end if

Open( w_get_image )
//w_get_image.uo_image_object = pfc_cst_u_imaging //maha removed 042406

//tab_view.tabpage_browse.dw_browse.Retrieve( il_prac_id )//called from dw_image_data post update
of_browse_select_row(0,3) //last row  //maha 042406
//End Code Change---04.24.2006
end event

type cb_remove from commandbutton within tabpage_setup
integer x = 1426
integer y = 640
integer width = 581
integer height = 84
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "&Remove from Scanning"
end type

event clicked;Integer li_ans

li_ans = MessageBox("Delete", "Are you sure you want to delete item from being scanned.", Question!, YesNo!, 1 )

IF li_ans = 2 THEN
	Return 0
END IF

dw_image_data.DeleteRow( 0 )
dw_image_data.SetRow( 1 )
dw_image_data.ScrollToRow( 1 )

st_recs.Text = "Record " + String( dw_image_data.GetRow() ) + " of " + String( dw_image_data.RowCount() )
end event

type dw_image_list from u_dw within tabpage_setup
integer x = 27
integer y = 28
integer width = 791
integer height = 1496
integer taborder = 60
boolean titlebar = true
string title = "Select Image Type"
string dataobject = "d_image_image_type_list"
boolean hscrollbar = true
borderstyle borderstyle = stylebox!
end type

event clicked;call super::clicked;IF row > 0 THEN
	This.SetRow( row )
END IF
end event

event retrieveend;call super::retrieveend;IF rowcount > 0 THEN
	This.SelectRow( 1, True )
	This.SetFocus()
END IF
end event

event rowfocuschanged;call super::rowfocuschanged;IF currentrow > 0 THEN
	This.SelectRow( 0, False )
	This.SelectRow( currentrow, True )
	//verification image processing
	tab_view.tabpage_setup.dw_data.of_SetUpdateAble( False )
	IF This.GetItemNumber( currentrow, "image_type_id" ) = 99 THEN		
		tab_view.tabpage_setup.dw_data.DataObject = "d_image_ver_summary_record_view"
		//tab_view.tabpage_setup.dw_data.of_SetDropDownCalendar( True )
		//tab_view.tabpage_setup.dw_data.iuo_calendar.of_Register( tab_view.tabpage_setup.dw_data.iuo_calendar.DDLB)
		tab_view.tabpage_setup.dw_data.of_SetUpdateAble( True )
		tab_view.tabpage_setup.dw_data.of_SetTransObject( SQLCA )		

		Integer li_facility_id[1]
		li_facility_id[1] = ii_verifiying_facility_id
		DataWindowChild dwchild
		tab_view.tabpage_setup.dw_data.Retrieve( 1, il_prac_id, li_facility_id )
		tab_view.tabpage_setup.dw_data.GetChild( "response_code", dwchild )
		dwchild.SetTransObject( SQLCA )
		dwchild.Retrieve("credentials verification response")
		dwchild.InsertRow( 1 )
	ELSEIF This.GetItemNumber( currentrow, "link_to_screen" ) = 0 THEN
		dw_data.Visible = False
		dw_data.Reset()
	ELSE
		dw_data.Visible = True
		inv_dw.of_create_dynamic_dw_browse( il_prac_id , 1, This.GetItemNumber( currentrow, "link_to_screen" ), tab_view.tabpage_setup.dw_data )
	END IF
//	//Start Code Change ---- .2007 #V7 maha  removed; does not work right  moved to retrieve end event
//	//--------------------------- APPEON BEGIN ---------------------------
//	//$<add> 10.12.2006 By: Jack (Inova)
//	//$<reason> Queue Images for Scanning from Data Entry.
//	tab_view.tabpage_setup.dw_image_data.reset()
//	long ll_image_type_id,ll_rowcount
//	ll_image_type_id = This.GetItemNumber( currentrow, "image_type_id" )
//	tab_view.tabpage_setup.cb_remove.enabled = false
//	tab_view.tabpage_setup.cb_from_file.enabled = false
//	tab_view.tabpage_setup.cb_scan.enabled = false			
//	if tab_view.tabpage_setup.dw_data.rowcount() > 0 then
//		//Start Code Change ---- 02.15.2007 #V7 maha retrieval should not be image type or facility  based
//		//ll_rowcount = tab_view.tabpage_setup.dw_image_data.retrieve(il_prac_id, ii_verifiying_facility_id,1,ll_image_type_id)
//		ll_rowcount = tab_view.tabpage_setup.dw_image_data.retrieve(il_prac_id)
//		//End Code Change---02.15.2007
//		if ll_rowcount > 0 then
//			tab_view.tabpage_setup.cb_remove.enabled = true
//			tab_view.tabpage_setup.cb_from_file.enabled = true
//			tab_view.tabpage_setup.cb_scan.enabled = true
//			tab_view.tabpage_setup.dw_image_data.setfocus()
//			tab_view.tabpage_setup.dw_image_data.setcolumn('notes')
//		end if
//	end if
//	//---------------------------- APPEON END ----------------------------
	//End Code Change---04.04.2007
END IF
end event

event pfc_deleterow;//--------------------------- APPEON BEGIN ---------------------------
//$<comment> 2006-08-29 By: Liu HongXin
//$<reason> It hasn't save, so not to delete.
return 1
//---------------------------- APPEON END ----------------------------
end event

type dw_image_data from u_dw within tabpage_setup
integer x = 878
integer y = 740
integer width = 2542
integer height = 784
integer taborder = 11
boolean titlebar = true
string title = "Image Detail"
string dataobject = "d_image_scan_detail"
borderstyle borderstyle = stylebox!
end type

event rowfocuschanged;call super::rowfocuschanged;st_recs.Text = "Record " + String( This.GetRow() ) + " of " + String( This.RowCount() )
end event

event pfc_postupdate;call super::pfc_postupdate;tab_view.tabpage_browse.dw_browse.Retrieve( il_prac_id )

Return 1
end event

event pfc_validation;call super::pfc_validation;/******************************************************************************************************************
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
**  Created By	: Michael B. Skinner 19 December 2005  ? Intellisoftgroup, Inc
**==================================================================================================================
**  Modification Log
**   Changed By             Change Date                                               Reason
** ------------------------------------------------------------------------------------------------------------------
********************************************************************************************************************/



long ll_i
string ls_message
string NEW_LINE
integer r

//Start Code Change ---- 06.13.2007 #V7 maha  modified message allowed user to continue
for ll_i = 1 to this.rowcount()
	if isnull(this.getitemnumber(ll_i,"tif_start_page")) then
		ls_message =  'The "Scan/Get from File" has not been completed.  Do you wish to continue without getting images?'
	end if
next


if len(ls_message) > 0 then
   r = messagebox("Image Detail Validation", ls_message,question!,yesno!,1)
	if r = 2 then
		return failure
	else
		return success
	end if
end if 
//End Code Change---06.13.2007

return success
end event

event pfc_deleterow;//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 2006-08-29 By: Liu HongXin
//$<reason> Trigger User Event.
cb_remove.TriggerEvent(Clicked!)
return 1
//---------------------------- APPEON END ----------------------------
end event

type ole_scan from olecustomcontrol within tabpage_setup
event scanstarted ( )
event scandone ( )
event pagedone ( long pagenumber )
event scanuidone ( )
integer x = 2066
integer y = 636
integer width = 137
integer height = 100
integer taborder = 80
borderstyle borderstyle = stylelowered!
string binarykey = "pfc_cst_u_imaging.udo"
integer binaryindex = 4
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
end type

type cb_scan from commandbutton within tabpage_setup
integer x = 2921
integer y = 640
integer width = 498
integer height = 84
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "&Begin Scanning"
boolean default = true
end type

event clicked;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  [PUBLIC]   : EVENT CB_SCAN::CLICKED
//==================================================================================================================
//  Purpose   	:
//==================================================================================================================
//  Arguments 	: [NONE] 
//==================================================================================================================
//  Returns   	: [long]     
//==================================================================================================================
//  Notes     	: 	   
//==================================================================================================================
//  Created By	: ???
//==================================================================================================================
//  Modification Log
//   Changed By             Change Date                                               Reason
// ------------------------------------------------------------------------------------------------------------------
// MSKINNER 						09 March 2005
//	maha								01-27-06																scan to temp file before adding to image to allow for 'rollback'
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//notes on file names:
//for image file:
//	if file does not exist then ls_tempfile is set to is_image_file_name which is the location of the stored file
//	if the file does exist then ls_tempfile is set to a temp file in the Intellicred folder and appended to the the existing file
//for database storage, the file is created in a temp file then scanned through and split and added to the database

tab_view.tabpage_image.ole_scan_edit.Object.ClearDisplay(  ) //maha 061201

Integer i
Integer d
Integer li_last_page
Integer li_ans
Integer li_total_pages
Integer li_num_pages
Integer li_rc
Integer li_orig_last_page
integer res
integer li_data_count
integer s20
integer li_newcount
string ls_tempfile  
string ls_time,ls_Rtn


//Start Code Change ---- 04.14.2006 #387 maha  //changed filename to be unique
if dw_image_data.rowcount() < 1 then return
ls_time = string(minute(now())) + string(second(now()))
ls_tempfile = gs_dir_path + gs_DefDirName + "\temp" + ls_time + ".tif"//maha 012706
//End Code Change---04.14.2006

pfc_cst_nv_image_functions image_functions
image_functions = CREATE pfc_cst_nv_image_functions


//delete any temp.tif files so there no pages added to existing temp.tif files and ole clear display

FileDelete( ls_tempfile )
IF ii_image_storage_type = 1 THEN //store in db
	tab_view.tabpage_image.ole_scan_edit.Object.ClearDisplay(  ) 
	//set the image file name to temp.tif
	is_image_file_name = ls_tempfile
END IF

dw_image_data.AcceptText()

if fileexists(is_image_file_name) AND ii_image_storage_type <> 1 then
	li_last_page = tab_view.tabpage_image.ole_scan_edit.Object.PageCount()
	li_orig_last_page = li_last_page
else //file does not exist
	li_last_page = 0
	IF ii_image_storage_type = 1 THEN
		li_orig_last_page = 1
	ELSE
		li_orig_last_page = 0
	END IF
	ls_tempfile = is_image_file_name
end if


li_last_page ++
li_rc = dw_image_data.RowCount()

FOR i = 1 TO li_rc
	li_num_pages = dw_image_data.GetItemNumber( i, "num_pages" )
	//Start Code Change ---- 04.20.2006 #412 maha
	if isnull(li_num_pages) or li_num_pages = 0 then
		MessageBox("Scan", "Item # " + string(i) + " in the scan list does not have a number of pages.  Please correct and Click scan again.")
		return -1
	end if
	//End Code Change---04.20.2006
	li_total_pages = li_total_pages + li_num_pages
END FOR

IF li_total_pages = 0 THEN
	MessageBox("Scan", "There is nothing selected to scan." )
	Return -1
END IF

//ONLY Check this when using mapped drive
IF ii_image_storage_type <> 1 THEN
	//count the number of pages the data says there should be and compare to the image page count(for existing records).
	li_data_count = 0
	for d = 1 to tab_view.tabpage_browse.dw_browse.rowcount()  
		if tab_view.tabpage_browse.dw_browse.GetItemNumber( d ,"start_page") > 0 and  not isnull(tab_view.tabpage_browse.dw_browse.GetItemNumber( d ,"num_pages")) then
			//Start Code Change ---- 05.17.2007 #V7 maha added trap for missing start page. Count only if start page is valid
			li_data_count = li_data_count + tab_view.tabpage_browse.dw_browse.GetItemNumber( d ,"num_pages")	
		end if
	next

	if li_data_count <> li_orig_last_page then
		res = MessageBox( "Page count warning", "The number of pages in the image (" + string(li_orig_last_page) + ") does not match the start page/number of pages count(" + string(li_data_count) + "). You should be sure your images match your data before adding additional image records.~rIf you continue your new images will not match you data records.~r Continue anyway? ", StopSign!, Yesno!, 2 )		
		if res = 2 then
			return -1
		end if
	end if
END IF

//li_ans = MessageBox( "Scan", "Please DOUBLE CHECK to be sure a total of " + String( li_total_pages ) + " pages is placed in the document feeder. If the number or order is not correct, the scan will be affected and you will have to delete and rescan everything.~n~r~n~rClick Ok when ready to scan.", Question!, OkCancel!, 1 )
li_ans = MessageBox( "Scan", "Please DOUBLE CHECK to be sure a total of " + String( li_total_pages ) + " page(s) is placed in the document feeder.~n~r~n~rClick Ok when ready to scan.", Information!, OkCancel!, 1 )
IF li_ans = 2 THEN
	Return -1
END IF

ls_Rtn = f_ExaWriteRight(ls_tempfile)
if Len(ls_Rtn) > 0 then
	MessageBox(gnv_app.iapp_object.DisplayName,ls_Rtn,Exclamation!)
	Return -1
end if

//Start Code Change ---- 03.16.2007 #V7 maha  slightly changed order of code
if image_functions.of_setup_scan( ole_scan, ls_tempfile, 1) = -1 then
	//maha 032806 rewrote message
	filedelete(ls_tempfile)
	Messagebox("Scanning","Scanning has failed to complete.  The Imaging for Windows program has reported an error while scanning.~r~rIf this error repeats, you may need to restart IntelliCred before scanning again.~rIf you still have a problem you may need to restart your computer.")
	return -1
else
	////////////////////////////////////////////////////////////////////////////////////
	// let the user cancel out 
	////////////////////////////////////////////////////////////////////////////////////
	res = Messagebox("Scanning","Did the scanning complete properly?",Question!,yesno!,2)
	if res = 2 then 
		if li_orig_last_page > 0 then filedelete(ls_tempfile)
		//--------------------------- APPEON BEGIN ---------------------------
		//$<add> 2006-08-19 By: Liu Hongxin
		//$<reason> Fix defect.
		is_image_file_name = ""
		//---------------------------- APPEON END ----------------------------
		return 
	end if	
end if

////////////////////////////////////////////////////////////////////////////////////
// get the page count
////////////////////////////////////////////////////////////////////////////////////
ole_admin1.object.Image = ''
ole_admin1.object.Image = ls_tempfile
li_newcount = ole_admin1.object.pagecount()

//End Code Change---03.16.2007

////////////////////////////////////////////////////////////////////////////////////
//maha 012706 check the count of the new scan and check it against the expected number of pages.
////////////////////////////////////////////////////////////////////////////////////

if li_newcount <> li_total_pages then 
	res = MessageBox( "Page Count Warning", "The number of pages in the new scan (" + string(li_newcount) + ") does not match the number of pages count(" + string(li_total_pages) + ") that are in the scan list.  Please check your page counts and scan again. ",stopsign!)		
		if li_orig_last_page > 0 then filedelete(ls_tempfile)
		return -1
end if



//IF scanning completed properly:
//Start Code Change ---- 9.11.2006 #A maha
FOR i = 1 TO li_rc
	IF ii_image_storage_type  = 1 THEN
		dw_image_data.SetItem( i, "tif_start_page", 	1  )
	else
		dw_image_data.SetItem( i, "tif_start_page", 	li_last_page  )
		li_last_page = li_last_page + dw_image_data.GetItemNumber( i, "num_pages" )
	end if
END FOR
//End Code Change---9.11.2006


//RETURN 0
//Clean up the pages 
//FOR i = li_orig_last_page TO tab_view.tabpage_image.ole_scan_edit.Object.PageCount()
//	inv_image_functions.of_Cleanup_page( tab_view.tabpage_image.ole_scan_edit, i )
//END FOR

//Store the images in the database 
IF ii_image_storage_type = 1 THEN
	Long ll_rec_id
	Long ll_prac_id
	Integer li_facility_id
	Integer li_screen_id
	Long ll_seq_no
	Integer li_cr
	Integer li_start_page
	Blob lb_the_image

	//loop through the image table and split up images and store in db
	FOR i = 1 TO li_rc
		//--------------------------- APPEON BEGIN ---------------------------
		//$<add> 10.12.2006 By: Jack (Inova)
		//$<reason> Queue Images for Scanning from Data Entry.
		dw_image_data.SetItem( i, "de_queue", 1 )
		
		//---------------------------- APPEON END ----------------------------
		dw_image_data.Update( )
		ll_rec_id = dw_image_data.GetItemNumber( i, "rec_id" )
		ll_prac_id = dw_image_data.GetItemNumber( i, "prac_id" )	
		li_facility_id = dw_image_data.GetItemNumber( i, "facility_id" )	
		li_screen_id = dw_image_data.GetItemNumber( i, "screen_id" )		
		ll_seq_no = dw_image_data.GetItemNumber( i, "seq_no" )	
	
		FileDelete( gs_dir_path + gs_DefDirName + "\split.tif" )
	
		tab_view.tabpage_browse.ole_admin.object.Image( gs_dir_path + gs_DefDirName + "\split.tif" )

		//Start Code Change ---- 08.09.2007 #V7 maha corrected bug where all start pages were the first page
		
		//tab_view.tabpage_browse.ole_admin.object.Append( ls_tempfile, li_start_page, li_num_pages  )
		
		//--------------------------- APPEON BEGIN ---------------------------
		//$<add> 07/09/2007 By: Ken.Guo
		//$<reason> When Image Admin Merge file, The first image file must be in TIF format, Otherwise PB will runerror.
		If tab_view.tabpage_browse.ole_admin.object.pagecount() > 0 and tab_view.tabpage_browse.ole_admin.object.FileType <> 1 Then
			Messagebox('Image','The first image file must be in "TIF" format.')
			Return -1			
		End If
		//---------------------------- APPEON END ----------------------------
		
		if i = 1 then li_start_page = 1

		li_num_pages =  dw_image_data.GetItemNumber( i, "num_pages" ) 
		
		//--------------------------- APPEON BEGIN ---------------------------
		//$< Add  > 2008-07-15 By: Scofield
		//$<Reason> Verify if the directory has write right for the current user.
		
		ls_Rtn = f_ExaWriteRight(ls_tempfile)
		if Len(ls_Rtn) > 0 then
			MessageBox(gnv_app.iapp_object.DisplayName,ls_Rtn,Exclamation!)
			Return -1
		end if
		
		//---------------------------- APPEON END ----------------------------

		tab_view.tabpage_browse.ole_admin.object.Append( ls_tempfile, li_start_page, li_num_pages  )
		
		li_start_page += li_num_pages  //reset the start page for the next image
		//End Code Change---08.09.2007
				
//		tab_view.tabpage_browse.ole_admin.object.Append( ls_tempfile, li_start_page, li_num_pages  )  //Start Code Change ----06.04.2008 #V81 maha - removed was redundant and causing a crash

	
		lb_the_image = inv_image_functions.of_read_image_file( gs_dir_path + gs_DefDirName + "\split.tif" )
	
		UPDATEBLOB pd_images
		SET image_data = :lb_the_image
		WHERE rec_id = :ll_rec_id and
	   	   prac_id = :ll_prac_id and
				facility_id = :li_facility_id and
				seq_no = :ll_seq_no and
				screen_id = :li_screen_id			
		USING SQLCA;
	
		IF SQLCA.SQLNRows > 0 THEN
			COMMIT USING SQLCA ;
		ELSEIF SQLCA.SQLCODE = -1 THEN
			MessageBox( "SQL ERROR", SQLCA.SQLERRTEXT )
		ELSEIF SQLCA.SQLNRows = 0 THEN	
			MessageBox( "SQL Error", "No rows effected." )
		END IF
	
	END FOR
else  //maha 012706
	if li_orig_last_page = 0 then
		
	else
		ole_admin1.object.Image = is_image_file_name
		
		//--------------------------- APPEON BEGIN ---------------------------
		//$< Add  > 2008-07-15 By: Scofield
		//$<Reason> Verify if the directory has write right for the current user.
		
		ls_Rtn = f_ExaWriteRight(ls_tempfile)
		if Len(ls_Rtn) > 0 then
			MessageBox(gnv_app.iapp_object.DisplayName,ls_Rtn,Exclamation!)
			Return -1
		end if

		//---------------------------- APPEON END ----------------------------

		ole_admin1.Object.Append( ls_tempfile, 1, li_newcount )
		filedelete(ls_tempfile)
	end if
	//Start Code Change ---- 02.08.2007 #V7 maha  jack forgot to add for scanned documents
	for i = 1 TO li_rc
		dw_image_data.SetItem( i, "de_queue", 1 )
	next
	//End Code Change---02.08.2007
END IF

iw_parent_window.Event pfc_Save()

//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 2006-09-26 By: Liu Hongxin
//$<reason> Fix defect: pfc_PostUpdate is not execute because of Performance tuning, do it here.
//tab_view.tabpage_browse.dw_browse.Retrieve( il_prac_id )//called from dw_image_data post update
tab_view.tabpage_browse.dw_browse.Retrieve( il_prac_id )
//---------------------------- APPEON END ----------------------------
of_browse_select_row(0,2) //last row


dw_image_data.Reset()
dw_data.Reset()
dw_image_list.SetFocus()

// used to notify of_doubleclicked the current row ha changed
ib_new_row_added = true
//Start Code Change ---- 04.14.2006 #387 maha
//filedelete(ls_tempfile)
//End Code Change---04.14.2006
end event

type cb_select from commandbutton within tabpage_setup
integer x = 882
integer y = 640
integer width = 512
integer height = 84
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "S&elect for Scanning"
boolean default = true
end type

event clicked;
try
tab_view.tabpage_image.ole_scan_edit.Object.ClearDisplay(  ) //maha 061201
catch (runtimeerror rte)
end try


Boolean lb_append = False
Boolean lb_ver_doc = False
Integer li_screen_id
Integer li_ans
Integer li_rec_cnt  
Integer i
Integer d
integer li_rcdel
Integer li_delrow
Integer li_start_page
Integer li_num_page
Integer li_start_check
Long ll_seq_no
Integer li_new_row
Integer li_retval
Integer li_cr
Integer li_found
Integer li_facility_id
long li_ref_field_id //changed to long 071701 maha
Long ll_rec_id
Long ll_prac_id
String ls_doc_id
String ls_reference
String ls_ref_field_name
String ls_field_type
String ls_data
string ref_type //maha 061401
string ls_lu_field_type //maha 061401
DataWindowChild dwchild
Blob lb_null_image

//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 2006-08-19 By: Liu Hongxin
//$<reason> Fix defect.
/*
// mskinner 03 March 2006 -- begin
if not fileexists(is_image_file_name) and tab_view.tabpage_browse.dw_browse.rowcount( ) > 0 then 
	messagebox(iw_parent_window.title, 'Image ' + is_image_file_name + ' does not exist. Please check to see if the image folder has been moved.' )
	return 
end  if
// mskinner 03 March 2006 -- end
*/
//Start Code Change ---- 04.12.2007 #V7 maha
IF ii_image_storage_type = 1 THEN //added maha 41207
	//don't need to test if image comes from database
else
	//of_doubleclicked(tab_view.tabpage_browse.dw_browse)   // Add by Jack 03/29/2007 //maha removed seems pointless
	if is_image_file_name <> "" then
		if not fileexists(is_image_file_name) and tab_view.tabpage_browse.dw_browse.rowcount( ) > 0 then 
			messagebox(iw_parent_window.title, 'Image ' + is_image_file_name + ' does not exist. Please check to see if the image folder has been moved.' )
			return 
		end  if
	end if
END IF
//End Code Change---04.12.2007
//---------------------------- APPEON END ----------------------------

//if 

//Start Code Change ---- 04.04.2006 #378 maha
tab_view.tabpage_browse.dw_browse.setsort("start_page") //maha moved here from further down
tab_view.tabpage_browse.dw_browse.sort()
//End Code Change---04.04.2006

SetNull( lb_null_image )

li_cr = dw_data.GetRow()

IF li_cr > 0 THEN	
	
	li_screen_id = dw_image_list.GetItemNumber( dw_image_list.GetRow(), "link_to_screen" )
	IF dw_image_list.GetItemNumber( dw_image_list.GetRow(), "image_type_id" ) = 99 THEN
		lb_ver_doc = True
	END IF
	IF lb_ver_doc THEN	//verification
		li_screen_id = dw_data.GetItemNumber( li_cr, "screen_id" )
		ls_reference = dw_data.GetItemString( dw_data.GetRow(), "reference_value" )
		ref_type = "V"
		ls_doc_id = dw_data.GetItemString( dw_data.GetRow(), "doc_id" )
		SELECT Count( rec_id )  
	   INTO :li_rec_cnt  
   	FROM pd_images  
	   WHERE pd_images.doc_id = :ls_doc_id;
		IF SQLCA.SQLCODE = -1 THEN
			MessageBox("Database Error", SQLCA.SQLERRTEXT )
		END IF		
	ELSEIF li_screen_id = 1 THEN  //linked to basic info
		ls_reference = dw_image_list.GetItemString( dw_image_list.GetRow(), "image_type_description" ) 		
		ref_type = "I"
		SELECT Count( rec_id )  
	   INTO :li_rec_cnt  
   	FROM pd_images  
	   WHERE pd_images.prac_id = :il_prac_id  AND
				pd_images.reference_name = :ls_reference ;
		IF SQLCA.SQLCODE = -1 THEN
			MessageBox("Database Error", SQLCA.SQLERRTEXT )
		END IF	
		if li_rec_cnt > 0 then //\/added 013101 maha
			SELECT  rec_id  
			INTO :ll_rec_id
			FROM pd_images  
			WHERE pd_images.prac_id = :il_prac_id  AND
					pd_images.reference_name = :ls_reference ;
			//\maha
		else 
			ll_rec_id = gnv_app.of_Get_Id("RECORD_ID") //moved to here 013101 maha
		end if
	ELSE	// data entry record
		//ls_reference = dw_image_list.GetItemString( dw_image_list.GetRow(), "image_type_description" ) 		
		ref_type = "R"
		ll_rec_id = dw_data.GetItemNumber( dw_data.GetRow(), "rec_id" ) 	
		IF dw_image_data.Find( "rec_id = " + String( ll_rec_id), 1, 10000 ) > 0	THEN
			MessageBox("Image", "You have already selected this record for scanning." )
			Return -1
		END IF
		
		SELECT Count( rec_id )  
	   INTO :li_rec_cnt  
   	FROM pd_images  
	   WHERE pd_images.rec_id = :ll_rec_id   ;
		IF SQLCA.SQLCODE = -1 THEN
			MessageBox("Database Error", SQLCA.SQLERRTEXT )
		END IF
	END IF
	//**************************start of overwrite***********************
	IF li_rec_cnt > 0 THEN
		//tab_view.tabpage_browse.dw_browse.setsort("start_page") //maha app093005 trap if records have been sorted
		//tab_view.tabpage_browse.dw_browse.sort()
		//tab_view.tabpage_browse.dw_browse.Retrieve( il_prac_id )  //Start Code Change ----06.13.2007 #V7 maha removed for logic purposes
		Open( w_overwrite_msg )
		IF Message.StringParm = "C" THEN
			Return -1
		ELSEIF Message.StringParm = "O" THEN
			li_ans = MessageBox("Overwrite", "Are you sure you want to overwrite the supporting image document.", Question!, YesNo!, 1 )
			IF li_ans = 2 THEN
				Return -1
			END IF
			//\/maha 020101
			if ref_type = "V" or ref_type = "I"then //\/maha061401
				li_delrow = tab_view.tabpage_browse.dw_browse.find( "reference_name = '"+ ls_reference +"'", 1, tab_view.tabpage_browse.dw_browse.rowcount() )
			elseif ref_type = "R" then //for data related records
				ls_reference = "pd_images_rec_id = " + String( ll_rec_id) 
				//MessageBox("ls_reference", ls_reference )
				li_delrow = tab_view.tabpage_browse.dw_browse.find( ls_reference, 1, tab_view.tabpage_browse.dw_browse.rowcount() )
			else 
				MessageBox("Reference", "Can't find this reference type" )
				return -1
			end if
			li_rcdel = tab_view.tabpage_browse.dw_browse.rowcount()
				//MessageBox(string(li_delrow), "li_delrow" )
			if li_delrow < 1 then 
				MessageBox(ls_reference, "Can't find this reference" )
				return -1
			end if
			li_start_page = tab_view.tabpage_browse.dw_browse.GetItemNumber( li_delrow, "start_page" )
			li_num_page = tab_view.tabpage_browse.dw_browse.GetItemNumber( li_delrow, "num_pages" )
//			for d = 1 to li_rcdel //reset start page on records greater than the deleted one
//				li_start_check = tab_view.tabpage_browse.dw_browse.GetItemNumber( d, "start_page" )
//				if li_start_check > li_start_page then 
//					li_start_check = li_start_check - li_num_page
//					tab_view.tabpage_browse.dw_browse.setItem( d, "start_page",li_start_check )
//			end if
//			next
			tab_view.tabpage_browse.dw_browse.DeleteRow( li_delrow )			
			IF ii_image_storage_type = 1 THEN			
				//IF stored in db then do nothing because when you delete the pd_image row you delete the image
			ELSE
				tab_view.tabpage_browse.ole_admin.Object.Image( is_image_file_name )
				//MessageBox("li_start_page", li_start_page )
				//MessageBox("li_num_page ", li_num_page  )
				//Start Code Change ---- 05.09.2006 #442 maha
				if of_check_page_count(li_start_page, tab_view.tabpage_browse.ole_admin.Object.PageCount ,li_num_page) = -1 then
					return -1
				end if
				//End Code Change---05.09.2006

				if li_start_page > 0 then //maha trap 063004 8.188
					tab_view.tabpage_browse.ole_admin.Object.DeletePages( li_start_page, li_num_page )
				end if
				//reset page numbers moved here 040303 maha
				li_start_check = 1
				for d = 1 to tab_view.tabpage_browse.dw_browse.rowcount() //reset all start pages 
					tab_view.tabpage_browse.dw_browse.setItem( d, "start_page",li_start_check )
					li_start_check = li_start_check + tab_view.tabpage_browse.dw_browse.GetItemNumber( d ,"num_pages")	
				next
			END IF

			//iw_parent_window.Event pfc_Save() //jad
			tab_view.tabpage_browse.dw_browse.update()  //Start Code Change ---- 05.03.2007 #V7 maha 
			//commit using sqlca;
			//\maha


//	  		DELETE FROM pd_images  //maha removed 020101
//   		WHERE pd_images.rec_id = :ll_rec_id   ;
//			IF SQLCA.SQLCODE = -1 THEN
//				MessageBox("Database Error", SQLCA.SQLERRTEXT )
//				Return -1
//			END IF
		ELSEIF Message.StringParm = "A" THEN
			lb_append = True
		END IF
	END IF
//*******************end of overwrite
	IF li_screen_id > 1 AND NOT lb_ver_doc THEN
		//GET REFERENCE FIELD 1 DATA
		li_ref_field_id = dw_image_list.GetItemNumber( dw_image_list.GetRow(), "reference_field_1" )
		if isnull(li_ref_field_id) or li_ref_field_id = 0 then  //Start Code Change ---- 06.11.2007 #V7 maha
			MessageBox("Select Data error", "There is no Reference Field 1 set up for this data screen.  Please contact ContractLogix Group support for assistance before adding image items for this screen. ")
			return -1
		end if
		//--------------------------- APPEON BEGIN ---------------------------
		//$<ID> PT-10
		//$<modify> 03.23.2006 By: LeiWei
		//$<reason> Performance tuning
		//$<modification> Write script to retrieve data from a cache instead of from the database.

		/*
	  SELECT sys_fields.field_name,  
				 sys_fields.field_type
	   INTO :ls_ref_field_name,
			  :ls_field_type
	   FROM sys_fields  
   	WHERE sys_fields.field_id = :li_ref_field_id   ;
		IF SQLCA.SQLCODE = -1 THEN
			MessageBox("Database Error", SQLCA.SQLERRTEXT )
			Return -1
		END IF
		*/
		
		ls_ref_field_name = gnv_data.of_getitem( "sys_fields","field_name", "field_id = "+String(li_ref_field_id))
		ls_field_type = gnv_data.of_getitem( "sys_fields","field_type", "field_id = "+String(li_ref_field_id))
		
		//---------------------------- APPEON END ----------------------------
		
	//MessageBox("ls_ref_field_name", ls_ref_field_name )
	//MessageBox("li_cr before", dw_data.getrow())
		if dw_data.Describe(ls_ref_field_name + ".ColType") = "!" then  //Start Code Change ---- 06.11.2007 #V7 maha trap
			MessageBox("Select Data error", "Required field, "  + ls_ref_field_name +  ", is not a valid Field on this data screen.  Please contact ContractLogix Group support for assistance before adding image items for this screen. ")
			return -1
		end if
		
		dw_data.SetTabOrder( ls_ref_field_name, 1 )
		dw_data.SetColumn( ls_ref_field_name )
		dw_data.setrow(li_cr)//maha 071701
	//messagebox("li_rc after",dw_data.getrow())
		li_retval = dw_data.GetChild(ls_ref_field_name, dwchild)
		debugbreak()
		ls_data =  dw_data.GetText()
		IF li_retval = -1 THEN
			ls_data =  dw_data.GetText()				
		ELSE
		
			//Start Code Change ---- 11.10.2005 #79 maha		
			li_found = dwchild.Find( "lookup_code = " + ls_data,1,1000000 )	
			if li_found < 1 then //return // mskinner 21 Sept 2005
				messagebox("Find lookup Error","Lookup record not found for " + ls_ref_field_name + ".  Check for missing data.")
				return -1
			end if
			//End Code Change---11.10.2005 		
			IF dw_data.Describe( ls_ref_field_name + ".dddw.displaycolumn") = "code" or  dw_data.Describe( ls_ref_field_name + ".dddw.displaycolumn") = "description" THEN //maha 071401 changed from code only
				ls_data = dw_data.GetText() //maha 062805 trap for null lookup data
				IF IsNull( ls_data ) THEN
					ls_data = ""
				else
					ls_data = dwchild.GetItemString( li_found, "code" )
				end if
			ELSEIF dw_data.Describe( ls_ref_field_name + ".dddw.displaycolumn") = "entity_name" THEN
				ls_data = dw_data.GetText()//maha 062805 trap for null lookup data
				IF IsNull( ls_data ) THEN
					ls_data = ""
				else
					if dwchild.rowcount() > 0 then  //maha app080505
						ls_data = dwchild.GetItemString( li_found, "entity_name_original" )
					else
						ls_data = ""
					end if
				end if
			ELSE
				ls_data = dw_data.GetText()				
			END IF
		END IF
//MessageBox("ls_data", ls_data )
	
		IF IsNull( ls_data ) THEN //maha 071701 changed from ls_reference to ls_data
			ls_reference = ""
		ELSE 
			ls_reference = ls_data
		END IF

		//GET REFERENCE FIELD 2 DATA
		li_ref_field_id = dw_image_list.GetItemNumber( dw_image_list.GetRow(), "reference_field_2" )
		//--------------------------- APPEON BEGIN ---------------------------
		//$<ID> PT-11
		//$<modify> 03.23.2006 By: LeiWei
		//$<reason> Performance tuning
		//$<modification> Write script to retrieve data from a cache instead of from the database.
		/*
	   SELECT sys_fields.field_name,  
				 sys_fields.field_type
	   INTO :ls_ref_field_name,
			  :ls_field_type
	   FROM sys_fields  
   	WHERE sys_fields.field_id = :li_ref_field_id   ;
		*/
		
		ls_ref_field_name = gnv_data.of_getitem( "sys_fields","field_name", "field_id = "+String(li_ref_field_id))
		ls_field_type = gnv_data.of_getitem( "sys_fields","field_type", "field_id = "+String(li_ref_field_id))
		
		//---------------------------- APPEON END ----------------------------

	//messagebox("ls_ref_field_name",ls_ref_field_name)
	//Start Code Change ---- 06.11.2007 #V7 maha  trap for missing ref 2
		if dw_data.Describe(ls_ref_field_name + ".ColType") <> "!" then  //Start Code Change ---- 06.11.2007 #V7 maha trap for bad reference 2
		
			dw_data.SetTabOrder( ls_ref_field_name, 1 )
			dw_data.SetColumn( ls_ref_field_name )
			dw_data.setrow(li_cr)//maha 071701
			li_retval = dw_data.GetChild(ls_ref_field_name, dwchild)
			ls_data = dw_data.GetText()
			IF IsNull( ls_data ) THEN //maha trap for null lookup 062805
				ls_data = ""
			else
				IF li_retval = -1 THEN
					ls_data =  dw_data.GetText()				
					ELSE
					li_found = dwchild.Find( "lookup_code = " + dw_data.GetText(), 1, 10000 )
					if li_found < 1 then //maha 061501
						ls_data = ""
					else
						IF dw_data.Describe( ls_ref_field_name + ".dddw.displaycolumn") = "code" THEN
							ls_data = dwchild.GetItemString( li_found, "code" )
						ELSEIF dw_data.Describe( ls_ref_field_name + ".dddw.displaycolumn") = "entity_name" THEN
							ls_data = dwchild.GetItemString( li_found, "entity_name_original" )
						ELSE
							ls_data = dw_data.GetText()				
						END IF
					end if
				END IF
			end if
		else
			ls_data = ""
		end if
		//End Code Change---06.11.2007	
		IF NOT IsNull( ls_reference ) THEN
			ls_reference = ls_reference + " - " + ls_data
		END IF	
	//code removed 011305 maha because it caused too many crashes
//		IF dw_image_list.GetItemNumber( dw_image_list.GetRow(), "include_date_fields" ) = 1 THEN
//			ls_data = String( dw_data.GetItemNumber( li_cr, "month_from" ) )
//			IF NOT IsNull( ls_data ) THEN
//				ls_reference = ls_reference + " ( " + ls_data + "/"				
//			ELSE
//				ls_reference = ls_reference + " ( "
//			END IF
//
//			ls_data = String( dw_data.GetItemNumber( li_cr, "year_from" ) )
//			IF NOT IsNull( ls_data ) THEN		
//				ls_reference = ls_reference + ls_data + " - "						
//			END IF			
//			
//			ls_data = String( dw_data.GetItemNumber( li_cr, "month_thru" ) )
//			IF NOT IsNull( ls_data ) THEN		
//				ls_reference = ls_reference + ls_data + "/"										
//			END IF
//			
//			ls_data = String( dw_data.GetItemNumber( li_cr, "year_thru" ) )
//			IF NOT IsNull( ls_data ) THEN		
//				ls_reference = ls_reference + ls_data + " )"		
//			ELSE 
//				ls_reference = ls_reference +  " )"		
//			END IF
//		END IF	
	END IF
	ls_reference = mid(ls_reference,1,100) //maha 022504 trap for overlong values
	
	
	IF dw_image_data.GetItemStatus( 1, 0, Primary! ) = New! THEN
		dw_image_data.DeleteRow( 0 )	
	END IF
		
	li_new_row = dw_image_data.InsertRow( 0 )
	dw_image_data.ScrollToRow( li_new_row )
	dw_image_data.SetRow( li_new_row )

   SELECT Max( seq_no )  
   INTO :ll_seq_no  
   FROM pd_images  
   WHERE pd_images.rec_id = :ll_rec_id ;
	IF SQLCA.SQLCODE = -1 THEN
		MessageBox("Database Error", SQLCA.SQLERRTEXT )
	END IF
	
	IF IsNull( ll_seq_no ) THEN
		ll_seq_no = 0
	END IF
	
	ll_seq_no++
	//messagebox("ll_rec_id",ll_rec_id)
	dw_image_data.SetItem( li_new_row, "image_type_id", dw_image_list.GetItemNumber( dw_image_list.GetRow(), "image_type_id" ) )
	dw_image_data.SetItem( li_new_row, "prac_id", il_prac_id )
	dw_image_data.SetItem( li_new_row, "seq_no", ll_seq_no )
	dw_image_data.SetItem( li_new_row, "rec_id", ll_rec_id  )
	dw_image_data.SetItem( li_new_row, "facility_id", ii_verifiying_facility_id  )	
	dw_image_data.SetItem( li_new_row, "screen_id", dw_image_list.GetItemNumber( dw_image_list.GetRow(), "link_to_screen" ) )	
	dw_image_data.SetItem( li_new_row, "reference_name", ls_reference )
	dw_image_data.SetItem( li_new_row, "active_status", 1 )	
	dw_image_data.SetItem( li_new_row, "num_pages", dw_image_list.GetItemNumber( dw_image_list.GetRow(), "default_pages" ) )

	IF lb_ver_doc THEN
		dw_image_data.SetItem( li_new_row, "doc_id", ls_doc_id )	
	END IF
	
	dw_image_data.SetColumn( "notes" )
	dw_image_data.SetFocus( )
	IF lb_append THEN
		IF li_screen_id > 1 THEN
			UPDATE pd_images
			SET active_status = 0 
			WHERE pd_images.rec_id = :ll_rec_id;
			IF SQLCA.SQLCODE = -1 THEN
				MessageBox("Database Error 1", SQLCA.SQLERRTEXT )
			END IF		
		ELSE
			UPDATE pd_images
			SET active_status = 0 
		   WHERE pd_images.prac_id = :il_prac_id  AND
					pd_images.reference_name = :ls_reference ;
			IF SQLCA.SQLCODE = -1 THEN
				MessageBox("Database Error 2", SQLCA.SQLERRTEXT )
			END IF					
		END IF
	END IF
END IF

dw_image_data.SetItem( li_new_row, "date_scanned", DateTime( Today(), Now()) )
dw_image_data.SetItem( li_new_row, "user_name", gnv_app.of_GetUserId() )

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 10.12.2006 By: Jack (Inova)
//$<reason> Queue Images for Scanning from Data Entry.
//dw_image_data.SetItem( li_cr, "tif_start_page", 1 ) //Start Code Change ----06.13.2007 #V7 maha removed not necessary here
dw_image_data.SetItem(  li_new_row , "de_queue", 0 )  //Start Code Change ----10.12.2007 #V7 maha corrected row variable.
//dw_image_data.Update( ) //Start Code Change ----06.13.2007 #V7 maha removed for logic purposes
//---------------------------- APPEON END ----------------------------

cb_scan.Enabled = True
cb_from_file.Enabled = True
cb_remove.Enabled = True

dw_image_data.SetFocus()
end event

type dw_data from u_dw within tabpage_setup
event ue_after_retrieve ( )
integer x = 878
integer y = 24
integer width = 2542
integer height = 600
integer taborder = 50
boolean titlebar = true
string title = "Select Image Link"
boolean hscrollbar = true
borderstyle borderstyle = stylebox!
end type

event ue_after_retrieve;IF This.RowCount() > 0 THEN
	This.SetRow( 1 )		
	IF tab_view.tabpage_setup.dw_data.DataObject <> "d_image_ver_summary_record_view"	THEN
		This.SelectRow( 1, True )
	END IF
END IF
end event

event clicked;call super::clicked;Integer li_row

li_row = GetClickedRow()

IF li_row > 0 THEN
	This.SetRow( li_row )		
	IF tab_view.tabpage_setup.dw_data.DataObject <> "d_image_ver_summary_record_view"	THEN
		This.SelectRow( 0, False )
		This.SelectRow( li_row, True )
	END IF	

END IF
end event

event retrieveend;call super::retrieveend;PostEvent( "ue_after_retrieve" )

This.Modify( "datawindow.color = '79741120'" )


end event

event doubleclicked;cb_select.TriggerEvent( Clicked! )
end event

event pfc_deleterow;//--------------------------- APPEON BEGIN ---------------------------
//$<comment> 2006-08-29 By: Liu HongXin
//$<reason> It hasn't save, so not to delete.
return 1
//---------------------------- APPEON END ----------------------------
end event


Start of PowerBuilder Binary Data Section : Do NOT Edit
08pfc_cst_u_imaging.bin 
2F00000600e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe00000006000000000000000000000001000000010000000000001000fffffffe00000000fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdfffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000fffffffe00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000600e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe00000006000000000000000000000001000000010000000000001000fffffffe00000000fffffffe0000000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
26fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdfffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000fffffffe00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000600e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe00000006000000000000000000000001000000010000000000001000fffffffe00000000fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdfffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
2Affffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000fffffffe00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000600e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe00000006000000000000000000000001000000010000000000001000fffffffe00000000fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdfffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000fffffffe00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff00000000
2800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000600e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe00000006000000000000000000000001000000010000000000001000fffffffe00000000fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdfffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000fffffffe00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
18pfc_cst_u_imaging.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
