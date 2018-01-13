$PBExportHeader$pfc_cst_u_create_app2.sru
forward
global type pfc_cst_u_create_app2 from userobject
end type
type cb_repopulate from commandbutton within pfc_cst_u_create_app2
end type
type dw_exceptions from datawindow within pfc_cst_u_create_app2
end type
type ole_admin from olecustomcontrol within pfc_cst_u_create_app2
end type
type st_rec from statictext within pfc_cst_u_create_app2
end type
type st_page_num from statictext within pfc_cst_u_create_app2
end type
type st_name from statictext within pfc_cst_u_create_app2
end type
type cb_next from commandbutton within pfc_cst_u_create_app2
end type
type cb_prior from commandbutton within pfc_cst_u_create_app2
end type
type cb_2 from commandbutton within pfc_cst_u_create_app2
end type
type cb_1 from commandbutton within pfc_cst_u_create_app2
end type
type st_1 from statictext within pfc_cst_u_create_app2
end type
type st_2 from statictext within pfc_cst_u_create_app2
end type
type ole_edit from olecustomcontrol within pfc_cst_u_create_app2
end type
end forward

global type pfc_cst_u_create_app2 from userobject
integer width = 3794
integer height = 1820
boolean border = true
long backcolor = 79741120
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_repopulate cb_repopulate
dw_exceptions dw_exceptions
ole_admin ole_admin
st_rec st_rec
st_page_num st_page_num
st_name st_name
cb_next cb_next
cb_prior cb_prior
cb_2 cb_2
cb_1 cb_1
st_1 st_1
st_2 st_2
ole_edit ole_edit
end type
global pfc_cst_u_create_app2 pfc_cst_u_create_app2

type variables
Long il_intelliapp_rec_id = 0
Integer ii_facility_id 
Long ii_app_id 
Long ii_prac_id = 0

Integer ii_current_page = 1

Integer ii_last_from_pop_page
Integer ii_last_to_pop_page
integer ii_master

Boolean ib_sever_started = False
n_ds ids_address
n_tr TR_APP_DATA


pfc_cst_nv_image_functions  inv_image_functions

end variables

forward prototypes
public function integer of_set_app_id (integer ai_app_id)
public function integer of_set_facility_id (integer ai_facility_id)
public function integer of_load_app ()
public function integer of_print (integer ai_from_page, integer ai_to_page, integer ai_copies, integer ai_print_exceptions)
public function integer of_setup (integer ai_app_id, integer ai_from_page, integer ai_to_page, integer facility_id)
public function integer of_set_server (boolean ab_started)
public function n_tr of_connections (string as_app_type, string as_account)
public function integer of_print_all ()
public function integer of_populate ()
public function integer of_set_default_preview_prac ()
public function integer of_next_page ()
public function integer of_prior_page ()
public function integer of_print ()
public function integer of_prac_search ()
public function integer of_save_for_faxing (integer ai_index)
public function long of_addr_get_gpid (integer ai_rowcount)
public function string of_address_query (string as_type)
public function integer of_error_msg (long al_prac, integer ai_facil_id, long al_app_id, long al_app_field_id, integer ai_cur_page, string as_error, integer ai_err_hand)
public function string of_billing_address (n_ds ads_detail, string as_query, integer ai_record_number, integer ai_screen)
public function string of_field_name (integer ai_screen, string as_field)
public function string of_format (string as_value, string as_format)
end prototypes

public function integer of_set_app_id (integer ai_app_id);ii_app_id = ai_app_id

Return 0
end function

public function integer of_set_facility_id (integer ai_facility_id);ii_facility_id = ai_facility_id

Return 0
end function

public function integer of_load_app ();This.SetRedraw( False )
//--------------------------- APPEON BEGIN ---------------------------
//$<add> 06.08.2006 By: Rodger Wu
//$<reason> Download an image file from database.
If isnull(ii_app_id) Then ii_app_id = 0

IF NOT FileExists( gs_app_image_path + String( ii_app_id ) + ".tif" ) THEN//09.28.2006 Allen
	n_appeon_storage_area lnv_storage_area
	IF lnv_storage_area.of_retrieve_image_from_db( ii_app_id, gs_app_image_path + String( ii_app_id ) + ".tif" ) < 0 THEN
		Messagebox("Download image",'The image'+  String( ii_app_id ) + ".tif" + '  does not exist in the database.')
		This.SetRedraw( true )		//Added by Scofield on 2007-08-02
		RETURN -1
	END IF
END IF
//---------------------------- APPEON END ----------------------------

IF NOT FileExists( gs_app_image_path + String( ii_app_id ) + ".tif" ) THEN
	MessageBox("Invalid Application", "The application file "  + gs_app_image_path + String( ii_app_id ) + ".tif" + " is missing or the IntelliApp application path is incorrect" )
	This.SetRedraw( true )		//Added by Scofield on 2007-08-02
	Return -1
END IF
//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 06.01.2007 By: Jack
//$<reason> Fix a defect.
/*
ole_edit.Object.Image( gs_app_image_path + String( ii_app_id ) + ".tif" )

ole_edit.Object.Page(1)
ole_edit.Object.FitTo(3)
ole_edit.Object.DisplayScaleAlgorithm = 4 //Start Code Change ---- 04.19.2007 #V7 maha
ole_edit.Object.Display()
ole_edit.Object.ImageResolutionx( 300 )
ole_edit.Object.ImageResolutionY( 300 )
ole_edit.Object.Annotationtype(11)	
ole_edit.Object.Display()
This.SetRedraw( True )

ole_edit.Object.ScrollBars( True )

IF ole_edit.Object.PageCount() = 1 THEN
	cb_next.Enabled = False
	cb_prior.Enabled = False
END IF

st_page_num.Text = "Page 1 of " + String( ole_edit.Object.PageCount() )

dw_exceptions.SetTransObject( tr_app_data )
dw_exceptions.Retrieve( ii_app_id )

ole_edit.Object.HideAnnotationGroup()
*/
Try 
	ole_edit.Object.Image( gs_app_image_path + String( ii_app_id ) + ".tif" )
	
	ole_edit.Object.Page(1)
	ole_edit.Object.FitTo(3)
	ole_edit.Object.DisplayScaleAlgorithm = 4 //Start Code Change ---- 04.19.2007 #V7 maha
	ole_edit.Object.Display()
	ole_edit.Object.ImageResolutionx( 300 )
	ole_edit.Object.ImageResolutionY( 300 )
	ole_edit.Object.Annotationtype(11)	
	ole_edit.Object.Display()
	This.SetRedraw( True )
	
	ole_edit.Object.ScrollBars( True )
	
	IF ole_edit.Object.PageCount() = 1 THEN
		cb_next.Enabled = False
		cb_prior.Enabled = False
	END IF
	
	st_page_num.Text = "Page 1 of " + String( ole_edit.Object.PageCount() )
	
	dw_exceptions.SetTransObject( tr_app_data )
	dw_exceptions.Retrieve( ii_app_id )
	
	ole_edit.Object.HideAnnotationGroup()
Catch (RunTimeError rte)
	MessageBox("Invalid Application", "The application file "  + gs_app_image_path + String( ii_app_id ) + ".tif" + " is missing or the IntelliApp application path is incorrect" )
	This.SetRedraw( true )		//Added by Scofield on 2007-08-02
	Return -1
End Try

//---------------------------- APPEON END ----------------------------
RETURN 0
end function

public function integer of_print (integer ai_from_page, integer ai_to_page, integer ai_copies, integer ai_print_exceptions);/******************************************************************************************************************
**  [PUBLIC]   : OF_PRINT( /*integer ai_from_page*/, /*integer ai_to_page*/, /*integer ai_copies*/, /*integer ai_print_exceptions */)
**==================================================================================================================
**  Purpose   	: PRINT THE IMAGE USING THE ocx PRINT DIALOG
**==================================================================================================================
**  Arguments 	: [integer] ai_from_page
**  Arguments 	: [integer] ai_to_page
**  Arguments 	: [integer] ai_copies
**  Arguments 	: [integer] ai_print_exceptions
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
** Michael B. Skinner    28  December 2005                                    Changed printing to use 
**																										inv_image_functions.of_print function      
********************************************************************************************************************/


Integer i
Integer li_retval
string ls_image

ole_edit.Object.Page(1)
ole_edit.Object.Display()

IF ai_to_page = 99 or ai_to_page > ole_edit.Object.PageCount() THEN 
	ai_to_page = ole_edit.Object.PageCount()
END IF

FOR i = 1 TO ai_copies
	try
		  
		ls_image = ole_edit.object.image
		if not fileexists(ls_image) then //maha 030306
			messagebox("Application Printing","Cannot find/access image to print :" + ls_image )
		end if
		ole_admin.object.image = ls_image
      inv_image_functions.of_print( ole_admin, ole_edit, Handle(this), '',ai_from_page, ai_to_page)
   catch (runtimeerror e)
		
   end try
NEXT

IF ai_print_exceptions = 1 THEN
	dw_exceptions.Print()
END IF

Return 0
end function

public function integer of_setup (integer ai_app_id, integer ai_from_page, integer ai_to_page, integer facility_id);//function for populating application data
//Start Code Change ---- 06.07.2006 #522 maha
//Start Code Change ---- 02.14.2006 #231 maha
string ls_sql,ls_Rtn
String ls_save_as
Integer li_err_handling
li_err_handling = 0

li_err_handling = of_get_app_setting("set_21","I")

//Start Code Change ---- 10.25.2006  maha
if gi_citrix = 1 then
	ls_save_as = of_letter_paths("L")
else
	ls_save_as = gs_dir_path + gs_DefDirName + "\" 
end if
//End Code Change---10.23.2006

//--------------------------- APPEON BEGIN ---------------------------
//$< Add  > 2008-07-14 By: Scofield
//$<Reason> Verify if the directory has write right for the current user.

ls_Rtn = f_ExaWriteRight(ls_save_as)
if Len(ls_Rtn) > 0 then
	MessageBox(gnv_app.iapp_object.DisplayName,ls_Rtn,Exclamation!)
	Return -1
end if

//---------------------------- APPEON END ----------------------------

integer set3

//select set_3 into :set3 from icred_settings;
set3 = of_get_app_setting("set_3","I")
if set3 = 1 then
	SetRedraw( False )
end if

boolean lb_lastconn //Start Code Change ---- 04.10.2007 #V7 maha
boolean lb_single_page = false
Integer li_max_additional_rec
Integer li_add_page_cnt
Integer li_box_height
Integer li_box_width
Integer li_billing_flag
Integer i 
Integer t
Integer li_sort_data_cnt
Integer li_delete_p
Integer ap
Integer li_count
Integer li_add_page[]
Integer li_special_fld_cnt
Integer sf
long li_cal_field_id	//Start Code Change ---- 04.20.2006 #424 maha changed data type
Integer li_new_calc_field = 0
Integer li_font
Integer li_array
Integer p
Integer li_query_years
Integer li_height
Integer li_width
Integer li_current_page = 1
Integer li_retval
Integer li_page 
Integer li_screen_cnt
Integer li_table_id
Integer li_x
Integer li_y
Integer li_screen_fld_cnt
Integer s
Integer li_fld_loop
Integer li_de_row_cnt
Integer li_screen_id
Integer li_record_number
Integer li_font_size
integer res
integer li_noblank = 0 //maha012508
integer li_trap //maha 090705
integer ck1 //maha 090805
integer li_firstfield //maha 12.07.06
integer li_bold //maha 12.07.06
Long ll_rec_id
long li_app_fld_cnt //modified 071802 maha
long li_app_field_id //modified 071802 maha
Long ll_billing_address_id
Long ll_last_data_value
Long ll_data
Long ll_found
Long ll_found_address
long ll_prac
long ll_prac_org
long ll_gpid
String ls_fld_data
String ls_error
String ls_fld_nm
String ls_add_pages
String ls_query_value
String ls_new_val
String ls_sort_syntax
String ls_val
String ls_special_field
String ls_data_value[500,500]  //Start Code Change ---- 04.20.2006 #424 maha changed array size from 100
String ls_data_dummy[500,500]  //Start Code Change ---- 04.20.2006 #424 maha changed array size from 100
String ls_format
String ls_past_filter
String ls_year
String ls_true_value
String ls_false_value
String ls_object_type
String ls_font_name
String ls_field_type
String ls_auto_replicate[]
String ls_field_name
String ls_screen_name
String ls_data
String ls_link_type
String ls_link_field
String ls_query_op //maha101102
String ls_query
String ls_query_test
String ls_last_query
String ls_last_query_addr
string ls_query_fld_type //maha 101002
string ls_query_fld  //maha 101002
string ls_query_fld_org  //maha 101002

string ls_addr_query_fld  //maha 020206
string ls_addr_query_val //maha 020206
string ls_addr_query_op //maha 020206
string ls_addr_group_query  //maha 020206
string ls_column_check  //maha 020906
string ls_find //maha 030906
long ll_addr_group_recno  //maha 020206
string ls_query_addr_type  //maha 101002
string ls_billing_query //maha 020606
string ls_group_billing_query//maha 020606
string sname
string ls_syntax
DateTime ldt_data
date ld_pastdate //maha 090705
Boolean lb_page_populated[]
Boolean lb_additional_page = False
boolean lb_group //maha030905
n_appeon_download lnv_down //$<add> 06/18/2007 By: Ken.Guo
string ls_blankpage //$<add> 06/18/2007 By: Ken.Guo
pfc_cst_nv_data_entry_functions de_functions
DatawindowChild dwchild

ll_prac = ii_prac_id
ll_prac_org = ii_prac_id
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-01
//$<modify> 04.06.2006 By: Rodger Wu
//$<reason> Performance Tuning 
//$<modification> Collect SQL statements and datastore for retrieving data and integrate them into 
//$<modification> Appeon Queue labels to reduce client-server interactions to improve runtime performance.
//$<modification> Refer to PT-02 for more information.
/*
SELECT app_hdr.additional_info_pages  
INTO :ls_add_pages  
FROM app_hdr  
WHERE app_hdr.app_id = :ii_app_id   ;
IF tr_app_data.SQLCODE = -1 THEN
	MessageBox( "Database Error", tr_app_data.SQLERRTEXT )
END IF
*/
n_ds lds_app
n_ds lds_app_fld_data
n_ds lds_screen_list
n_ds lds_screen_fields
n_ds lds_de_detail
n_ds lds_de_address

lds_screen_list = CREATE n_ds
lds_screen_list.DataObject = "d_app_screen_ids_in_page_ranges_appeon"
lds_screen_list.of_SetTransObject( tr_app_data)

lds_app_fld_data = CREATE n_ds
lds_app_fld_data.DataObject = "d_app_data_page_ranges_appeon"
lds_app_fld_data.of_SetTransObject( tr_app_data)

lds_screen_fields = CREATE n_ds
lds_screen_fields.DataObject = "d_screen_fields_appeon"
lds_screen_fields.of_SetTransObject( tr_app_data)

lds_app = CREATE n_ds
lds_app.DataObject = "d_app_detail"
lds_app.of_SetTransObject( tr_app_data)

lds_de_detail = CREATE n_ds
lds_de_detail.DataObject = ""

lds_de_address = CREATE n_ds  //maha 030905
lds_de_address.DataObject = ""

de_functions = CREATE pfc_cst_nv_data_entry_functions

gnv_appeondb.of_StartQueue()
lds_screen_list.Retrieve( ai_app_id )
lds_app_fld_data.Retrieve( ai_app_id)
lds_screen_fields.Retrieve( 1 )
lds_app.Retrieve( ai_app_id )
gnv_appeondb.of_CommitQueue()

If lds_app.RowCount() > 0 Then ls_add_pages = lds_app.GetItemString( 1, "additional_info_pages" )
//---------------------------- APPEON END ----------------------------
IF Len( ls_add_pages ) > 0 THEN
	IF Pos( ls_add_pages, "," ) = 0 THEN
		IF Mid( ls_add_pages, 1, 1 ) = "A" THEN
			ls_auto_replicate[ 1 ] = "A"
			//li_add_page[ 1 ] = Integer( ls_add_pages )			
			li_add_page[ 1 ] = Integer( Mid( ls_add_pages, 2, 10 ) ) //Modified by Ken.Guo At 2007-06-19
		ELSE
			ls_auto_replicate[ 1 ] = ""			
			//li_add_page[ 1 ] = Integer( Mid( ls_add_pages, 2, 10 ) )
			li_add_page[ 1 ] = Integer( ls_add_pages )     //Modified by Ken.Guo At 2007-06-19
		END IF
	ELSE
		DO WHILE TRUE
			li_count++
			IF Mid( ls_add_pages, 1, 1 ) = "A" THEN
				ls_auto_replicate[ li_count ] = "A"				
				li_add_page[li_count] = Integer( Mid( ls_add_pages, 2, Pos( ls_add_pages, "," ) -1) )				
			ELSE
				ls_auto_replicate[ li_count ] = ""			
				li_add_page[li_count] = Integer( Mid( ls_add_pages, 1, Pos( ls_add_pages, "," ) -1) )				
			END IF			
			ls_add_pages = Mid( ls_add_pages, Pos( ls_add_pages, "," ) +1, 1000 )				
			
			IF Pos( ls_add_pages, "," ) = 0 THEN
				li_count++
				IF Mid( ls_add_pages, 1, 1 ) = "A" THEN
					ls_auto_replicate[ li_count ] = "A"									
					li_add_page[li_count] = Integer( Mid( ls_add_pages, 2, 10 ) )
				ELSE
					ls_auto_replicate[ li_count ] = ""									
					li_add_page[li_count] = Integer( ls_add_pages )					
				END IF			
				Exit
			END IF			
		LOOP
	END IF
END IF

li_add_page_cnt = li_count

ls_save_as += String( ii_app_id ) +"-" + String(ll_prac) + ".tif" //modified maha 072604

//ole_edit.Object.SaveAs( ls_save_as )
ole_edit.Object.SaveAs( ls_save_as,1,1,1,0,false )  //Modified by Ken.Guo at 2007-06-18

ole_edit.Object.ClearDisplay()
ole_edit.Object.Image( ls_save_as )
//ole_edit.Object.Page(1)
ole_edit.Object.FitTo(3)
//ole_edit.Object.Display()
ole_edit.Object.Annotationtype(11)	

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-02
//$<comment> 04.06.2006 By: Rodger Wu
//$<reason> Performance Tuning 
//$<modification> Move the following script to PT-01. It is integrated into Appeon Queue labels
//$<modification> with other SQL statements  to reduce client-server interactions.
//$<modification> Refer to PT-01 for more information.
/*
n_ds lds_app
n_ds lds_app_fld_data
n_ds lds_screen_list
n_ds lds_screen_fields
n_ds lds_de_detail
n_ds lds_de_address

lds_screen_list = CREATE n_ds
//lds_screen_list.DataObject = "d_data_view_screens_list"
lds_screen_list.DataObject = "d_app_screen_ids_in_page_ranges"
lds_screen_list.of_SetTransObject( tr_app_data)

lds_app_fld_data = CREATE n_ds
lds_app_fld_data.DataObject = "d_app_data_page_ranges"
lds_app_fld_data.of_SetTransObject( tr_app_data)

lds_screen_fields = CREATE n_ds
lds_screen_fields.DataObject = "d_screen_fields"
lds_screen_fields.of_SetTransObject( tr_app_data)

lds_app = CREATE n_ds
lds_app.DataObject = "d_app_detail"
lds_app.of_SetTransObject( tr_app_data)

lds_de_detail = CREATE n_ds
lds_de_detail.DataObject = ""

lds_de_address = CREATE n_ds  //maha 030905
lds_de_address.DataObject = ""

de_functions = CREATE pfc_cst_nv_data_entry_functions


lds_app.Retrieve( ai_app_id )

lds_app_fld_data.of_SetTransObject( tr_app_data )
*/
//---------------------------- APPEON END ----------------------------

IF ai_to_page = 99 THEN
	ai_from_page = 1
	ai_to_page = ole_edit.Object.PageCount()
END IF

if ai_from_page = ai_to_page then lb_single_page = true  //Start Code Change ----01.25.2008 #V8 maha


IF ISVALID(w_infodisp) THEN 
	w_infodisp.wf_set_min_max(1,ai_to_page)
END IF 

//POPULATING one page at a time
FOR p = ai_from_page TO ai_to_page
	
	if ai_from_page > ai_to_page then //maha 101002
		messagebox("User Error","You have entered a page range greater than the number of pages in the Application.")
		setredraw(true)
		return -1
	end if
	ole_edit.Object.Page( p )
	ole_edit.Object.Display()
	ole_edit.Object.HideAnnotationGroup()	
	ii_current_page = p
	lb_page_populated[ p ] = False
	IF ib_sever_started THEN
		//iapply; not used
	ELSE
		st_page_num.Text = "Page " + String( ii_current_page ) + " of " + String( ole_edit.Object.PageCount()	)
	END IF
	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> PT-03
	//$<modify> 04.06.2006 By: Rodger Wu
	//$<reason> Performance Tuning 
	//$<modification> Use Filter of datastore to retrieve data from a cache instead of 
	//$<modification> retrieving data from database by using Retrieve of dw in the loop.
	/*
	li_screen_cnt = lds_screen_list.Retrieve( ai_app_id, p )
	//SPECIAL fields processing
	li_special_fld_cnt = lds_app_fld_data.Retrieve( ai_app_id, 99, p, p, "N" )
	*/
	lds_screen_list.SetFilter( "app_field_prop_page = " + string( p ) )
	lds_screen_list.Filter()
	li_screen_cnt = lds_screen_list.Rowcount()
	
	lds_app_fld_data.SetFilter( "table_id = 99 and page = " + string(p) )
	lds_app_fld_data.Filter()
	li_special_fld_cnt = lds_app_fld_data.RowCount()
	//---------------------------- APPEON END ----------------------------
 
	FOR sf = 1 TO li_special_fld_cnt
		ls_val = ""
		li_app_field_id = lds_app_fld_data.GetItemNumber( sf, "app_field_id" )
		li_x = lds_app_fld_data.GetItemNumber( sf, "x_pos" )
		li_y = lds_app_fld_data.GetItemNumber( sf, "y_pos" )		
		li_box_height = lds_app_fld_data.GetItemNumber( sf, "box_height" )		
		li_box_width = lds_app_fld_data.GetItemNumber( sf, "box_width" )		
		ls_special_field = lds_app_fld_data.GetItemString( sf, "field_description" )		
		IF Pos( ls_special_field, "Todays Date" ) > 0 THEN
			ls_val = String( Today(), "mm/dd/yyyy" )
		ELSEIF Pos( ls_special_field, "Current Time" ) > 0 THEN			
			ls_val = String( Now(), "hh:mm am/pm" )
		ELSEIF Pos( ls_special_field, "User Id" ) > 0 THEN			
			ls_val = gs_user_id
		ELSEIF Pos( ls_special_field, "Rectangle" ) > 0 THEN						
			ls_val = "RECTANGLE"			
		ELSE
			ls_val = ls_special_field
		END IF
		IF ls_val <> "" AND ls_val <> "RECTANGLE" THEN
			ole_edit.Object.AddAnnotationGroup( String(li_app_field_id) )			
			IF Upper(Mid( ls_val, 1, 6 )) = "LABEL-" THEN
				ls_val = Mid( ls_val, 7, 100 )
			END IF			
			ole_edit.object.AnnotationStampText( ls_val )
			ole_edit.object.AnnotationFontColor( RGB(0,0,128) ) //RGB(0,0,128) )255 //maha101101
			ole_edit.object.Annotationtype(8)
			CHOOSE CASE lds_app_fld_data.GetItemNumber( sf, "font_size" )
				CASE 1
					ole_edit.Object.AnnotationFont.Name = "MS Serif"
					ole_edit.Object.AnnotationFont.Size = 7
				CASE 2
					ole_edit.Object.AnnotationFont.Name = "Times New Roman"
					ole_edit.Object.AnnotationFont.Size = 8				
				CASE 3
					ole_edit.Object.AnnotationFont.Name = "Times New Roman"
					ole_edit.Object.AnnotationFont.Size = 12				
			END CHOOSE
			IF lds_app_fld_data.GetItemNumber( sf, "font_bold" ) = 1 THEN
				ole_edit.Object.AnnotationFont.Bold = True
			ELSE
				ole_edit.Object.AnnotationFont.Bold = False
			END IF					
			ole_edit.object.Draw(li_x, li_y, 0, 0 )
		ELSEIF ls_val = "RECTANGLE" THEN
			ole_edit.Object.AddAnnotationGroup( String(li_app_field_id) )		
			ole_edit.object.Annotationtype(4)		
			ole_edit.object.AnnotationFillColor( 8454143 )			
			ole_edit.object.AnnotationFillStyle( 0 )									
			ole_edit.object.Draw( li_x, li_y, li_box_width,li_box_height)	
		END IF
	END FOR

	//DATA fields processing
	FOR s = 1 TO li_screen_cnt
		ole_edit.Object.AnnotationFont.Bold = False//Start Code Change ---- 02.23.2007 #V7 maha
		ll_prac = ll_prac_org //maha 031005 resetting the prac id because of group data
		li_screen_id =lds_screen_list.GetItemNumber( s, "screen_id" )
		//	debugbreak()
		//maha 030905 GROUP data screns
		if li_screen_id >= 80 and li_screen_id < 90 then 
			lb_group = true
			//debugbreak()
		else
			lb_group = false
		end if
		ls_screen_name = lds_screen_list.GetItemString( s, "screen_name" )
		st_1.Text = ls_screen_name
		
		//--------------------------- APPEON BEGIN ---------------------------
		//$<ID> PT-04
		//$<modify> 04.06.2006 By: Rodger Wu
		//$<reason> Performance Tuning 
		//$<modification> Use Filter of datastore to retrieve data from a cache instead of 
		//$<modification> retrieving data from database by using Retrieve of dw in the loop.
		/*
		lds_screen_fields.of_SetTransObject( tr_app_data )
		li_screen_fld_cnt = lds_screen_fields.Retrieve( 1, li_screen_id )
		*/
		lds_screen_fields.SetFilter( "data_view_fields_screen_id = " + string(li_screen_id) )
		lds_screen_fields.Filter()
		li_screen_fld_cnt = lds_screen_fields.RowCount()
		//---------------------------- APPEON END ----------------------------
	
		IF li_screen_fld_cnt = 0 THEN
			CONTINUE
		END IF
		li_table_id = lds_screen_fields.GetItemNumber( 1, "table_id" )
		//--------------------------- APPEON BEGIN ---------------------------
		//$<ID> PT-05
		//$<modify> 04.06.2006 By: Rodger Wu
		//$<reason> Performance Tuning 
		//$<modification> Use Filter of datastore to retrieve data from a cache instead of 
		//$<modification> retrieving data from database by using Retrieve of dw in the loop.
		/*
		lds_app_fld_data.of_SetTransObject( tr_app_data)
		
		IF li_screen_id = 27 THEN //trap for personal data screen
			li_app_fld_cnt = lds_app_fld_data.Retrieve( ai_app_id, li_table_id, p, p, "Y" )
		ELSE
			li_app_fld_cnt = lds_app_fld_data.Retrieve( ai_app_id, li_table_id, p, p, "N" )		
		END IF
		*/
		IF li_screen_id = 27 THEN //trap for personal data screen
			lds_app_fld_data.SetFilter( "table_id = " + string( li_table_id ) + " and page = " + &
												 string(p) + " and personal_data = 'Y'")
		Else
			lds_app_fld_data.SetFilter( "table_id = " + string( li_table_id ) + " and page = " + &
												 string(p) + " and personal_data = 'N'")
		End If
		lds_app_fld_data.Filter()
		li_app_fld_cnt = lds_app_fld_data.RowCount()
		//---------------------------- APPEON END ----------------------------
	
		IF li_app_fld_cnt = 0 THEN
			CONTINUE
		END IF
		
	//GROUP data processing
		if lb_group = true then 
			//create the address ds
			de_functions.of_create_dynamic_ds( ll_prac, 1, 2, lds_de_address, facility_id, sqlca )
		end if
	
		de_functions.of_create_dynamic_ds( ll_prac, 1, li_screen_id, lds_de_detail, facility_id, sqlca )
		li_de_row_cnt = lds_de_detail.RowCount()
		
		ls_last_query = ""


	//skip if there is not data for that practitioner's data table.
		if lb_group = true then
			if lds_de_address.rowcount( ) < 1 then
				continue
			end if
		else
			IF li_de_row_cnt = 0 THEN
				CONTINUE
			END IF
		end if
	//\ to move$$%$%$%
	
		ll_last_data_value = 0
		//debugbreak()
		FOR li_fld_loop = 1 TO li_app_fld_cnt
			st_2.text = ""
			SetNull( ls_format )
			SetNull( ls_data )
			SetNull( ll_data )
			SetNull( ls_link_type)
			li_app_field_id = lds_app_fld_data.GetItemNumber( li_fld_loop, "app_field_id" )
			ls_field_type = lds_app_fld_data.GetItemString( li_fld_loop, "field_type" )
			ls_link_type = lds_app_fld_data.GetItemString( li_fld_loop, "lookup_link_type" )
			ls_link_field = Lower( lds_app_fld_data.GetItemString( li_fld_loop, "lookup_link_field" ) )
			ls_field_name = lds_app_fld_data.GetItemString( li_fld_loop, "field_name")	
			//skinner 30 Dec 2005 -- begin
			ls_column_check = ls_field_name ///lds_de_detail.of_get_column_name( ls_field_name)
			if ls_column_check = "" then
				ls_error = "Field ID (" + String( li_app_field_id ) + ")" + " Invalid column name (" + ls_field_name  + ") in datastore" 
				of_error_msg( ll_prac, facility_id, ii_app_id, li_app_field_id, li_current_page, ls_error, li_err_handling)
				continue
			else
				ls_field_name = ls_column_check
			end if
			//skinner 30 Dec 2005 -- end
			//--------------------------- APPEON BEGIN ---------------------------
			//$<modify> 04.07.2006 By: Rodger Wu
			//$<reason> Fix a defect.
		
			/*
			ls_query_op  = lds_app_fld_data.GetItemString( li_fld_loop, "query_operator")
			ls_query_value =  lds_app_fld_data.GetItemString( li_fld_loop, "query_value")
			ls_query_fld = lds_app_fld_data.GetItemString( li_fld_loop, "query_field")
			*/
			ls_query_op  = Trim( lds_app_fld_data.GetItemString( li_fld_loop, "query_operator") )
			ls_query_value =  Trim( lds_app_fld_data.GetItemString( li_fld_loop, "query_value") )
			ls_query_fld = Trim( lds_app_fld_data.GetItemString( li_fld_loop, "query_field") )
			//---------------------------- APPEON END ----------------------------
		
			li_query_years = lds_app_fld_data.GetItemNumber(li_fld_loop, "past_years_query" )  //Start Code Change ----03.19.2008 #V8 maha - changed from row 1
			ls_addr_query_fld = lds_app_fld_data.GetItemString( li_fld_loop, "query_field_addr")
			ls_addr_query_val = lds_app_fld_data.GetItemString( li_fld_loop, "query_value_addr")
			ls_addr_query_op = lds_app_fld_data.GetItemString( li_fld_loop, "query_operator_addr")
			ll_addr_group_recno = lds_app_fld_data.GetItemnumber( li_fld_loop, "record_num_addr")
			li_billing_flag = lds_app_fld_data.GetItemNumber( li_fld_loop, "billing_address_flag" )
			li_record_number = lds_app_fld_data.GetItemNumber( li_fld_loop, "record_number")	
			if isnull(li_record_number) or li_record_number = 0 then li_record_number = 1 //maha 021406
			//Start Code Change ---- 03.21.2006 #330 maha
			li_x = lds_app_fld_data.GetItemNumber( li_fld_loop, "x_pos" )
			li_y = lds_app_fld_data.GetItemNumber( li_fld_loop, "y_pos" )
			if li_x < 1 or li_y < 1 then 	continue
			//End Code Change---03.21.2006
			st_rec.text = String( li_record_number)
			ls_past_filter = ""
	//PAST YEARS filter	
			IF li_query_years > 0 THEN //if set to past years query ///yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy
	
				ck1 = 0
				li_trap = 0
				STRING LS_YEAR_THROUGH, LS_END_DATE
				LS_YEAR_THROUGH = 'year_thru'//lds_de_detail.of_get_column_name('year_thru')
				LS_YEAR_THROUGH = of_field_name( li_screen_id, LS_YEAR_THROUGH)
				LS_END_DATE = 'end_date'//lds_de_detail.of_get_column_name('END_DATE') 
				LS_END_DATE = of_field_name( li_screen_id, LS_END_DATE)
	
				//Start Code Change ----03.19.2008 #V8 maha - changed order of the field check to the full date first
				//maha 031908 Note:  because the of_create_dynamic_ds function creates all columns in the screen (not  just visible ones)
				//the past years function will not work for customers that don't yet use the full date fields ,
				if lds_de_detail.Describe(LS_END_DATE + ".ColType") <> "!" then //check for end_date field
					ld_pastdate = RelativeDate(Today(), (li_query_years * 365)* -1 )
					ls_past_filter = "date("+LS_END_DATE+ " ) >= date('" + string(ld_pastdate) + "')"
					
					ls_year =  String( Year( RelativeDate(Today(), (li_query_years * 365)* -1 )) )
					ls_past_filter = LS_YEAR_THROUGH +" >= " + ls_year
					ck1 = 1
					//Start Code Change ---- 03.22.2006 #330 maha
				elseif lds_de_detail.Describe("date_to_year.ColType") <> "!" then //professional experience
					ls_year =  String( Year( RelativeDate(Today(), (li_query_years * 365)* -1 )) )
					ls_past_filter = "date_to_year >= " + ls_year
					LS_YEAR_THROUGH = "date_to_year"
					ck1 = 1	
					//End Code Change---03.22.2006	
				elseif lds_de_detail.Describe(LS_YEAR_THROUGH + ".ColType") <> "!" then //check for year_thru field
					ls_year =  String( Year( RelativeDate(Today(), (li_query_years * 365)* -1 )) )
					ls_past_filter = LS_YEAR_THROUGH +" >= " + ls_year
					ck1 = 1
			//End Code Change---03.19.2008
				else //year_thru or start_date not available
					ls_error = "Field ID (" + String( li_app_field_id ) + ")" + "There is no year_thru, date_to_year, or end_date field to filter.  The 'Data from last X years' filter is intended only for data screens with year_thru, date_to_year or end_date fields (Hosp Affil, Professional Exp. etc.).  If one of these fields does not exist or is not visible on the DEFAULT view, then this filter cannot be used." 
					of_error_msg( ll_prac, facility_id, ii_app_id, li_app_field_id, li_current_page, ls_error, li_err_handling)
				end if
		
				if ck1 = 1 then 
					//messagebox("LS_YEAR_THROUGH",LS_YEAR_THROUGH)
					li_trap = lds_de_detail.SetFilter( ls_past_filter )
					if li_trap = 1 then //maha 090705
						//lds_de_detail.Filter()
					else
						ls_error = "Field ID (" + String( li_app_field_id ) + ")" + "Error filtering Past Years data. (" + ls_past_filter + ")" 
						of_error_msg( ll_prac, facility_id, ii_app_id, li_app_field_id, li_current_page, ls_error, li_err_handling)
					end if
				end if
				li_de_row_cnt = lds_de_detail.RowCount()
			END IF
	
			//check to see how user is logged in
			//Start Code Change ---- 03.20.2006 #330 maha
			IF li_screen_id = 2 THEn
			  ls_field_name = of_field_name( 2, ls_field_name)
			ELSEIF li_screen_id = 31 THEN
				ls_field_name = of_field_name( 31, ls_field_name)
			ELSEIF li_screen_id = 10 THEN
				ls_field_name = of_field_name( 10, ls_field_name)
			END IF
			//END IF
			//End Code Change---.03.202006	
		//Start Code Change ---- 04.27.2006 #429 maha  trap if field name not valid in DS
			if lds_de_detail.Describe(ls_field_name + ".coltype") = "!" then
				ls_error = "Field ID (" + String( li_app_field_id ) + ")" + " Invalid field name ( " + ls_field_name + " ) for data store" 
				of_error_msg( ll_prac, facility_id, ii_app_id, li_app_field_id, li_current_page, ls_error, li_err_handling)
				continue
			end if
				
			//End Code Change---04.27.2006	
	
		//GROUP data processing @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
			if lb_group = true then //purpose here is to get the gpid from an address record and process it as the prac id for the group data
				//first do the address get and filter
				//debugbreak()
				if len(ls_addr_query_val) > 0 then
					IF Upper( ls_addr_query_fld ) = "ADDRESS_TYPE" THEN
						ls_addr_group_query = of_address_query( ls_addr_query_val)
						if ls_addr_group_query = "ERROR" then
							ls_addr_group_query = ""
							ls_error = "Field ID (" + String( li_app_field_id ) + ")" + "Unknown address type for filtering for Group data. (" + ls_addr_query_val + ")" 
							of_error_msg( ll_prac, facility_id, ii_app_id, li_app_field_id, li_current_page, ls_error, li_err_handling)
						end if
					else
						ls_addr_query_fld = of_field_name( 2, ls_addr_query_fld) //Added By Ken.Guo 05.04.2008. Get corrected column name.
						ls_addr_group_query = ls_addr_query_fld + ls_addr_query_op + ls_addr_query_val
					end if
//					//--------------------------- APPEON BEGIN ---------------------------
//					//$<Add> 05/04/2008 By: Ken.Guo
//					//$<reason> Filter address screen data that only refrence to Group Practices.
//					//$<Comment>05.05.2008 Comment it, Need Mike validate...
//					If isnull(ls_addr_group_query) or ls_addr_group_query = '' Then //Workaround for Null value in WEB.
//						ls_addr_group_query = 'Not isnull(pd_address_gp_id)'
//					Else
//						ls_addr_group_query = ls_addr_group_query + ' And (Not isnull(pd_address_gp_id))'
//					End If
//					//---------------------------- APPEON END ----------------------------
					lds_de_address.setfilter(ls_addr_group_query)
//				else
//					lds_de_address.setfilter("Not isnull(pd_address_gp_id)") //Added By Ken.Guo 05.04.2008
				end if
				//after this do the billing link
				if li_billing_flag = 1 THEN
					ls_group_billing_query = of_billing_address( lds_de_address, ls_addr_group_query, ll_addr_group_recno, 2)
					if ls_group_billing_query = "CONTINUE" then //if the specified record exceeds the rowcount
						continue
					elseif ls_group_billing_query = "ERROR" then
						ls_error = "Field ID (" + String( li_app_field_id ) + ")" + " Error during Group Billing Address SetFilter()  " + ls_query						
						of_error_msg( ll_prac, facility_id, ii_app_id, li_app_field_id, li_current_page, ls_error, li_err_handling)
					else 
						li_retval = lds_de_address.SetFilter(ls_group_billing_query)
						ls_error = "Field ID (" + String( li_app_field_id ) + ")" + " Setfilter Error during Group Billing Address SetFilter()  " + ls_query						
						of_error_msg( ll_prac, facility_id, ii_app_id, li_app_field_id, li_current_page, ls_error, li_err_handling)
					
						lds_de_address.Filter()
						//after the filter there should be one row
						if lds_de_address.rowcount()  > 0 then
							ll_gpid = lds_de_address.getitemnumber(1,"pd_address_gp_id")
						else
							ll_gpid = 0
						end if
					end if
				else
					lds_de_address.filter()
					if ll_addr_group_recno <= lds_de_address.rowcount() then
						ll_gpid = lds_de_address.getitemnumber(ll_addr_group_recno,"pd_address_gp_id")
					else
						ll_gpid = 0
					end if
				end if
				//debugbreak()
				ll_prac = ll_gpid
				//now get the group data
				de_functions.of_create_dynamic_ds( ll_prac, 1, li_screen_id, lds_de_detail, facility_id, sqlca )
				li_de_row_cnt = lds_de_detail.RowCount()
				if li_de_row_cnt < 1 then continue  //Start Code Change ---- 06.07.2006 #523 maha
				//ls_last_query_addr = ""
			end if		
		//END group address process		
	//*******************************************	
		//QUERY FILTERS:		if there is a record query involved filter the records
			//FILTER QUERY setup
			//ADDRESS TYPE
			IF Upper( ls_query_fld ) = "ADDRESS_TYPE" THEN
				ls_query_addr_type = lds_app_fld_data.GetItemString( li_fld_loop, "query_value")
				ls_query = of_address_query( ls_query_addr_type)
				if ls_query = "ERROR" then
					ls_query = ""
					ls_error = "Field ID (" + String( li_app_field_id ) + ")" + "Unknown address type. (" + ls_query_addr_type + ")" 
					of_error_msg( ll_prac, facility_id, ii_app_id, li_app_field_id, li_current_page, ls_error, li_err_handling)
				end if
				//clear query value; not needed
				ls_query_value = ""
			//PRIMARY HOSP
			elseif upper(ls_query_fld) = "PRIMARY_HOSP" THEN	//maha 100402
				//debugbreak()
				IF ii_master = 1 THEN //maha change 112105
					ls_query = "pd_hosp_facility_link_primary_hosp " + ls_query_op + ls_query_value
				else //this is ok
	//Start Code Change ---- 02.23.2006 #289 maha
					ls_query = "pd_hosp_facility_link_primary_hosp " + ls_query_op + ls_query_value
	//End Code Change---02.23.2006				
				//	ls_query = "primary_hosp_1 " + ls_query_op + ls_query_value
				end if
			//ALL OTHER FILTERS
			ELSE
				ls_query_fld_org = ls_query_fld //this variable is used in the check of the field datatype
				
				//HOSPITAL exception for query field
				if len(ls_query_fld) > 0 then
					ls_query_fld = of_field_name( li_screen_id, ls_query_fld) //maha 032006
	//				if li_screen_id = 10 then //hosp affil
	//					if ii_master = 1 THEN //maha change 112105
	//						ls_query_fld =  "pd_hosp_affil_" + ls_query_fld					
	//					end if
	//				end if
				end if
				ls_query = ls_query_fld + ls_query_op + ls_query_value
				
				//trap for lookup fields with non-numeric characters
				IF ls_link_type = "A" OR ls_link_type = "C" or ls_link_type = "Q" THEN //maha 020906
					//--------------------------- APPEON BEGIN ---------------------------
					//$<add> 04.05.2006 By: Rodger Wu
					//$<reason> Bug a defect.
					
					ls_query_value = Trim( ls_query_value )
					//---------------------------- APPEON END ----------------------------
					IF NOT IsNumber( ls_query_value ) and  len(ls_query_value) > 0 THEN
						ls_error = "Field ID (" + String( li_app_field_id ) + ")" + "Error during SetFilter test for field id " + String( li_app_field_id ) + "Trying to compare a numeric value to a charactor.  HINT: Probably a query value for a lookup table (" +  ls_query + ")"						
						of_error_msg( ll_prac, facility_id, ii_app_id, li_app_field_id, li_current_page, ls_error, li_err_handling)			
					END IF
				end if
			
				//QUERY exceptions based on query value
				IF  Pos( Upper(ls_query_value), "TODAY")  > 0 THEN
					ls_query_value = "Date('"+ String( Today() ) + "')"
					ls_query = ls_query_fld + ls_query_op + ls_query_value
				// query for nulls
				elseIF  Pos( Upper(ls_query_value), "NOT NULL")  > 0 THEN
					ls_query_value = ""
					ls_query = " not isnull(" + ls_query_fld + ")"
				//ls_query_value = " Is Null('"+ ls_query_value + "')"
				elseif Pos( Upper(ls_query_value), "NULL")  > 0 THEN
					ls_query_value = ""
					ls_query = "isnull(" + ls_query_fld + ")"
				else
					//maha added 112101 put query values in quotes for char fields
	
					//--------------------------- APPEON BEGIN ---------------------------
					//$<ID> PT-06
					//$<modify> 04.06.2006 By: Rodger Wu
					//$<reason> Performance Tuning 
					//$<modification> Use Filter of datastore to retrieve data from a cache instead of 
					//$<modification> retrieving data from database by using Retrieve of dw in the loop.
					/* select field_type into :ls_query_fld_type from sys_fields where field_name = :ls_query_fld_org and table_id = :li_table_id; */
					Long ll_appeon_found
					string ls_appeon_str
					
					ls_appeon_str = "table_id = " + string( li_table_id ) + &
											" and db_field_name = '" + ls_query_fld_org + "'"
					ll_appeon_found = lds_screen_fields.Find( ls_appeon_str, 1, lds_screen_fields.RowCount() )
									
					if ll_appeon_found > 0 Then
						ls_query_fld_type = trim(lds_screen_fields.getitemstring(ll_appeon_found, "field_type" ))
					Else
						//Added by Ken at 05/18/2007 
						//In fact, ll_appeon_found always GT 0, add below script for solving abnormity.
						select field_type into :ls_query_fld_type from sys_fields where field_name = :ls_query_fld_org and table_id = :li_table_id;
						//ls_query_fld_type = ""						
					End If
					//---------------------------- APPEON END ----------------------------
	
					if ls_query_fld_type = "C" THEN //maha 101002
					//messagebox("ls_query","CHAR")
						ls_query_value = "'" + ls_query_value + "'"
						ls_query = ls_query_fld + ls_query_op + ls_query_value //maha readded 121503
					end if
				END IF
					
			END IF
			
			//SET FILTER QUERY
			IF Len( ls_query ) > 0 then
				IF ls_last_query <> ls_query then ls_last_query = ls_query
				//ADDRESS screen filter
				if li_screen_id = 2 or li_screen_id = 31 then //address screen only and detail 2
					//SETFILTER
					li_retval = lds_de_detail.SetFilter( ls_query )
					IF li_retval = -1 THEN
						ls_error = "Field ID (" + String( li_app_field_id ) + ")" + "Error during SetFilter()  " + ls_query						
						of_error_msg( ll_prac, facility_id, ii_app_id, li_app_field_id, li_current_page, ls_error, li_err_handling)
					END IF
					//BILLING flag filter added to existing query
					if li_billing_flag = 1 THEN
						ls_billing_query = of_billing_address( lds_de_detail, ls_query, li_record_number, li_screen_id)
						if ls_billing_query = "CONTINUE" then //if the specified record exceeds the rowcount
							continue
						elseif ls_billing_query = "ERROR" then
							ls_error = "Field ID (" + String( li_app_field_id ) + ")" + "Error during Billing Address SetFilter()  " + ls_query						
							of_error_msg( ll_prac, facility_id, ii_app_id, li_app_field_id, li_current_page, ls_error, li_err_handling)
						else
							ls_query = ls_billing_query
							ls_last_query = ls_query 
							li_retval = lds_de_detail.SetFilter(ls_query )
							li_record_number = 1  //Start Code Change ----02.01.2008 #V8 maha // there should only be one record once filtered
						end if
						
					END IF //not using billing address
				ELSE //not address screen
					//messagebox(ls_field_name,ls_query
					li_retval = lds_de_detail.SetFilter(ls_query )
				end if	
				//debugbreak()	
			ELSE  // when length of ls_query = 0
				ls_query = ""
				ls_last_query = ""
				IF ls_past_filter = "" THEN	
					lds_de_detail.SetFilter( "" )
				ELSE
					lds_de_detail.SetFilter( ls_past_filter )
				END IF
			END IF
		
			//	messagebox(ls_field_name,ls_query)
			lds_de_detail.Filter() //maha moved ahead of below 021506
			
			li_de_row_cnt = lds_de_detail.RowCount()
			IF li_record_number > li_de_row_cnt THEN
				CONTINUE
			END IF
	
	//************* end of filter code ****************************		
			//IF Len( de_functions.i
			IF Len( de_functions.is_sort_syntax ) > 0 THEN
				//messagebox("", de_functions.is_sort_syntax )
				res = lds_de_detail.SetSort( de_functions.is_sort_syntax )
				
				if res = -1 then
					//messagebox('', lds_de_detail.Describe("DataWindow.Table.SQLSelect"))
					de_functions.is_sort_syntax = "pd_address_rec_id A"
					res = lds_de_detail.SetSort( de_functions.is_sort_syntax )
					if res = -1 then 
					  de_functions.is_sort_syntax = "pd_hosp_affil_rec_id A"
					  res = lds_de_detail.SetSort( de_functions.is_sort_syntax )
					  end if
				end if 
				
							
				
				if res = -1 then
					//de_functions.is_sort_syntax = "pd_address_rec_id A"
					messagebox("Error sorting " ,de_functions.is_sort_syntax)//maha 032204
					//messagebox(de_functions.is_sort_syntax,string(lds_de_detail.Describe("DataWindow.Table.SQLSelect")))
				end if 
				
				lds_de_detail.Sort( )
									
			END IF
			ls_object_type = lds_app_fld_data.GetItemString( li_fld_loop, "box_type")		
			st_2.text = ls_field_name + " (" + String( li_app_field_id ) + ")"
	
			IF ls_link_type = "A" OR ls_link_type = "C" or ls_link_type = "Q" THEN
				//messagebox("",ls_link_type)
				if ls_field_type = "C" THEN
					IF Not IsNumber( lds_de_detail.GetItemString( li_record_number, ls_field_name ) ) THEN
					//	MessageBox("Data Error", "You have string data in a field that should have numeric references to a lookup table." )
						//CONTINUE
						SetNull( ls_link_type )					
						ls_data = lds_de_detail.GetItemString( li_record_number, ls_field_name )		
					//END IF
					ELSE
						ll_data = Long( lds_de_detail.GetItemString( li_record_number, ls_field_name ) )
					END IF
				ELSE
					//messagebox("", ls_field_name )
					ll_data = lds_de_detail.GetItemNumber( li_record_number, ls_field_name )
					//messagebox(String(li_record_number), ll_data )
				end if
	
				li_retval = lds_de_detail.GetChild( ls_field_name, dwchild )
	
				IF li_retval = -1 THEN
					ls_error = "Getchild Error (function of_set_up)  Field ID (" + String( li_app_field_id ) + ") " + "  Could not find dwchild data. ~rRetrain the " + ls_screen_name + ", " + ls_field_name + " Field.  ~n Check to see that the field is visible in the default view."			
					of_error_msg( ll_prac, facility_id, ii_app_id, li_app_field_id, li_current_page, ls_error, li_err_handling)
					CONTINUE
				END IF
	
				IF NOT IsNull( ll_data ) THEN
					//IF ls_link_type = "A" THEN
							//if you get a retrieval argument does not match message.  Update the PRimary Hosp tab order in Mikes Utilities. ?? I dont know:)
							ll_found = dwchild.Retrieve( ll_data )
	//				ELSE
	//					ll_last_data_value = 0
	//					//Start Code Change ---- 03.09.2006 #330 maha
	//					if ls_link_type = "C" then
	//						ls_find = "lookup_code = " + String(ll_data)
	//					elseif ls_link_type = "Q" then
	//						//debugbreak()
	//						ls_find = "quest_id = " + String(ll_data)
	//					end if
	//					//End Code Change---03.09.2006
	//					ll_found = dwchild.Find( ls_find, 1, dwchild.RowCount() )
	//				END IF
					IF ll_found <= 0 THEN
						ls_error = "Error in of_setup doing find (" + string(ll_found) + "):   Field ID (" + String( li_app_field_id ) + ")" + "  Could not find dwchild data Message #2. ~rTry retraining the " + ls_screen_name + ", " + ls_field_name + " field.  Find: " + ls_find 					
						of_error_msg( ll_prac, facility_id, ii_app_id, li_app_field_id, li_current_page, ls_error, li_err_handling)
						CONTINUE
					END IF
				//Start Code Change ---- 06.06.2006 #516 maha
					if  upper(ls_link_field)  = "CAQH_CODE" then
						ls_data = string(dwchild.GetItemNumber( ll_found, ls_link_field ))
						//Start Code Change ---- 05.17.2007 #V7 maha
						if len(ls_data) = 1 then 
							ls_data = "00" + ls_data
						elseif len(ls_data) = 2 then 
							ls_data = "0" + ls_data
						end if
						//End Code Change---05.17.2007
					else	
						ls_data = dwchild.GetItemString( ll_found, ls_link_field )
					end if
					
				END IF
				ls_format =	lds_app_fld_data.GetItemString( li_fld_loop, "format" )
				ls_data = of_format(ls_data,ls_format)
				//End Code Change---.06.06.2006
			ELSE //field should not be a lookup field
				ls_format =	lds_app_fld_data.GetItemString( li_fld_loop, "format" ) 
				lds_app_fld_data.GetItemString( li_fld_loop, "lookup_link_type" ) 
				CHOOSE CASE Upper( ls_field_type )
				CASE "C"	//string
					//messagebox("",ls_field_name)
					ls_data = lds_de_detail.GetItemString( li_record_number, ls_field_name )		
					ls_data = of_format(ls_data,ls_format) //Start Code Change ---- 05.31.2006 #497 maha
				CASE "D"	//date
					ldt_data = lds_de_detail.GetItemDateTime( li_record_number, ls_field_name )						
					CHOOSE CASE Upper(ls_format)
						CASE "DATE(MM/DD/YYYY)"
							ls_data = String( ldt_data, 'mm/dd/yyyy')
						CASE "DATE(MM/DD/YY)"
							ls_data = String( ldt_data, 'mm/dd/yy')
						CASE "DATE(MM-DD-YYYY)"
							ls_data = String( ldt_data, 'mm-dd-yyyy')
						CASE "DATE(MM-DD-YY)"
							ls_data = String( ldt_data, 'mm-dd-yy')
						CASE "DATE(MM/YYYY)"
							ls_data = String( ldt_data, 'mm/yyyy')																		
					//Start Code Change ---- 06.02.2006 #497 maha
						CASE "DATE(MMYYYY)"
							ls_data = String( ldt_data, 'mmyyyy')
						CASE "DATE(MMDDYYYY)"
							ls_data = String( ldt_data, 'mmddyyyy')
					//End Code Change---06.02.2006
					//Start Code Change ---- 04.14.2008 #V8 maha	- added formats
							CASE "DATE(MM)"
								ls_data = String( ldt_data, 'mm')
							CASE "DATE(DD)"
								ls_data = String( ldt_data, 'dd')
							CASE "DATE(YYYY)"
								ls_data = String( ldt_data, 'yyyy')
							
							CASE "DATE(YYYYMM)"
								ls_data = String( ldt_data, 'yyyymm')
							CASE "DATE(YYYYMMDD)"
								ls_data = String( ldt_data, 'yyyymmdd')
							CASE "DATE(YYYY-MM-DD)"
								ls_data = String( ldt_data, 'yyyy-mm-dd')
							CASE "DATE(YYYY/MM/DD)"
								ls_data = String( ldt_data, 'yyyy/mm/dd')
							CASE "DATE(YYYY/MM)"
								ls_data = String( ldt_data, 'yyyy/mm/dd')
					//End Code Change---04.14.2008	
						CASE ELSE
							ls_data = String( ldt_data, 'mm/dd/yyyy')
					END CHOOSE						
				CASE "N", "I" //number
					IF Upper( ls_format ) = "MONEY" THEN
						//Start Code Change ----11.11.2008 #V85 maha - modified format
							ls_data = String(lds_de_detail.GetItemNumber( li_record_number, ls_field_name ), '$###,###,###')	
						//	ls_data = String(lds_de_detail.GetItemNumber( li_record_number, ls_field_name ), '$0,000,000')
						//End Code Change---11.11.2008
					//Start Code Change ----11.11.2008 #V85 maha - added active status values
					Elseif ls_field_name = "active_status" then
						ls_data = String(lds_de_detail.GetItemNumber( li_record_number, ls_field_name ))
					//	messagebox(ls_screen_name,ls_data)
						if ls_screen_name = "Affiliation Status" then
							choose case ls_data
								case "1"
									ls_data = "Active"
								case "0"
									ls_data = "History"
								case "3"
									ls_data = "Inactive"
								case "4"
									ls_data = "Pending"
							end choose
						else
							choose case ls_data
								case "1"
									if ls_format = "Status-Y" then //this is a format to override Active/Inactive
										ls_data = "Yes"
									else
										ls_data = "Active"
									end if
								case "0"
									if ls_format = "Status-Y" then
										ls_data = "No"
									else
										ls_data = "Inactive"
									end if
								case "2"
									ls_data = "Historical"
							end choose
						end if
						//End Code Change---11.11.2008
					ELSE
						ls_data = String(lds_de_detail.GetItemNumber( li_record_number, ls_field_name ))										
					END IF
				END CHOOSE
			END IF		
			IF ( IsNull( ls_data ) OR Trim( ls_data ) = "" ) AND ls_object_type <> "C" THEN //skip if no data and is a checkbox
				//ole_edit.Object.SelectAnnotationGroup( String( li_app_field_id ) )
				//ole_edit.Object.DeleteAnnotationGroup( String( li_app_field_id ) )
				CONTINUE
			END IF		
	
			CHOOSE CASE Upper( ls_object_type )
				CASE "T"//text
					CHOOSE CASE Upper(ls_format)
						CASE "PHONE"
							//messagebox("format","phone")
							IF Pos( ls_data, "-" ) = 0 AND Pos( ls_data, "(" ) = 0 THEN
								IF len( ls_data) = 10 THEN
									ls_data = "(" + Mid( ls_data, 1,3 ) + ")" + Mid( ls_data, 4,3 ) + "-" + Mid( ls_data, 7, 4 )
								ELSE
									ls_data = Mid( ls_data, 1,3 ) + "-" + Mid( ls_data, 4, 4 )							
								END IF
							END IF
						CASE "SS#"
							//messagebox("format","ssn")
							ls_data = Mid( ls_data, 1,3 ) + "-" + Mid( ls_data, 4, 2 ) + "-" + Mid( ls_data, 6, 4 )							
					END CHOOSE
					li_width = lds_app_fld_data.GetItemNumber( li_fld_loop, "width" )			
					ls_data = Mid( ls_data, 1, li_width )
					//ole_edit.Object.SelectAnnotationGroup( String( li_app_field_id ) )
					//ole_edit.Object.DeleteAnnotationGroup( String( li_app_field_id ) )
	//				li_x = lds_app_fld_data.GetItemNumber( li_fld_loop, "x_pos" )
	//				li_y = lds_app_fld_data.GetItemNumber( li_fld_loop, "y_pos" )
					ole_edit.Object.AddAnnotationGroup( String(li_app_field_id) )
					li_cal_field_id = lds_app_fld_data.GetItemNumber( li_fld_loop, "connect_field_id" )
					IF li_cal_field_id > 0 THEN
						li_array = lds_app_fld_data.GetItemNumber( li_fld_loop, "connect_field_sort" )
						ls_data_value[ li_cal_field_id, li_array ] = ls_data
					END IF
					IF IsNull( ls_data ) THEN
						ls_data = ""
					END IF
	
					ole_edit.object.AnnotationStampText( ls_data + "    " )
					ole_edit.object.AnnotationFontColor( RGB(0,0,128) )
						ole_edit.object.Annotationtype(8)
						CHOOSE CASE lds_app_fld_data.GetItemNumber( li_fld_loop, "font_size" )
							CASE 1
								ole_edit.Object.AnnotationFont.Name = "MS Serif"
								ole_edit.Object.AnnotationFont.Size = 7
							CASE 2
								ole_edit.Object.AnnotationFont.Name = "Times New Roman"
								ole_edit.Object.AnnotationFont.Size = 8				
							CASE 3
								ole_edit.Object.AnnotationFont.Name = "Times New Roman"
								ole_edit.Object.AnnotationFont.Size = 12				
						END CHOOSE
						IF lds_app_fld_data.GetItemNumber( li_fld_loop, "font_bold" ) = 1 THEN//Start Code Change ---- 12.05.2006 #V7 maha
							ole_edit.Object.AnnotationFont.Bold = True
						ELSE
							ole_edit.Object.AnnotationFont.Bold = False
						END IF					
						li_width = lds_app_fld_data.GetItemNumber( li_fld_loop, "annotation_width" )			
						li_height = lds_app_fld_data.GetItemNumber( li_fld_loop, "height" )	
		
						ole_edit.object.Draw(li_x, li_y, li_width, li_height)
						lb_page_populated[ p ] = True
					CASE "Y1"
						ls_true_value = lds_app_fld_data.GetItemString( li_fld_loop, "box_yes_value")		
						ls_false_value = lds_app_fld_data.GetItemString( li_fld_loop, "box_no_value")		
						IF ls_true_value = ls_data THEN
							ole_edit.Object.ShowAnnotationGroup( String( li_app_field_id ) + "YesBox")					
						ELSEIF ls_false_value = ls_data THEN
							ole_edit.Object.ShowAnnotationGroup( String( li_app_field_id ) + "NoBox")															
						END IF
					CASE "C" //checkbox **************************************
					//debugbreak()
						ls_true_value = lds_app_fld_data.GetItemString( li_fld_loop, "box_yes_value")	
						IF ( ls_true_value = ls_data ) OR ( POS( Upper(ls_true_value), "NOT NULL") > 0 AND Len(ls_data) >0) OR +&
							( (Len(ls_data) = 0 OR IsNull( ls_data ) ) AND POS( Upper(ls_true_value), "IS NULL") > 0 ) THEN 
		//					li_x = lds_app_fld_data.GetItemNumber( li_fld_loop, "x_pos" ) //maha removed 032106
		//					li_y = lds_app_fld_data.GetItemNumber( li_fld_loop, "y_pos" )
							ole_edit.Object.AddAnnotationGroup( String(li_app_field_id) ) //Start Code Change ---- 09.17.2007 #V7 maha  previously the annotation was created the a "" annot name which caused it to get removed in some strange circumstances.
							ole_edit.object.AnnotationStampText( "X" )
							ole_edit.object.AnnotationFontColor( RGB(0,0,128) )
							ole_edit.object.Annotationtype(8)
							CHOOSE CASE lds_app_fld_data.GetItemNumber( li_fld_loop, "font_size" )
								CASE 1
									ole_edit.Object.AnnotationFont.Name = "MS Serif"
									ole_edit.Object.AnnotationFont.Size = 7
								CASE 2
									ole_edit.Object.AnnotationFont.Name = "Times New Roman"
									ole_edit.Object.AnnotationFont.Size = 8				
								CASE 3
									ole_edit.Object.AnnotationFont.Name = "Times New Roman"
									ole_edit.Object.AnnotationFont.Size = 12				
							END CHOOSE
							IF lds_app_fld_data.GetItemNumber( li_fld_loop, "font_bold" ) = 1 THEN
								ole_edit.Object.AnnotationFont.Bold = True
							ELSE
								ole_edit.Object.AnnotationFont.Bold = False
							END IF					
							li_width = lds_app_fld_data.GetItemNumber( li_fld_loop, "annotation_width" )			
							li_height = lds_app_fld_data.GetItemNumber( li_fld_loop, "height" )	
		
	
						ole_edit.object.Draw(li_x, li_y, li_width, li_height)					
						//ole_edit.Object.ShowAnnotationGroup( String( li_app_field_id ) + "Check")															
					END IF				
			END CHOOSE
	
		END FOR
		//messagebox("", "mem check 4" )
		// ******** connect fields code ********
		Integer li_sort_cnt	
		Integer li_field_cnt
		Integer c
		Integer li_anc_calc_field
		Integer li_temp_calc_field
		Integer li_ancor_field
		String ls_calc_field
		//--------------------------- APPEON BEGIN ---------------------------
		//$<ID> PT-07
		//$<modify> 04.07.2006 By: Rodger Wu
		//$<reason> Performance Tuning
		//$<modification> Specify new filter criteria to meet the changes of Appeon modification.
		/*
		lds_app_fld_data.SetFilter( "connect_field_id > 0" )
		lds_app_fld_data.Filter( )
		*/
		IF li_screen_id = 27 THEN //trap for personal data screen
			lds_app_fld_data.SetFilter( "table_id = " + string( li_table_id ) + " and page = " + &
												 string(p) + " and personal_data = 'Y' and connect_field_id > 0 ")
		Else
			lds_app_fld_data.SetFilter( "table_id = " + string( li_table_id ) + " and page = " + &
												 string(p) + " and personal_data = 'N'and connect_field_id > 0 ")
		End If
		lds_app_fld_data.Filter()
		//---------------------------- APPEON END ----------------------------
		li_field_cnt = lds_app_fld_data.RowCount()
		//messagebox("li_field_cnt ",li_field_cnt )
		IF li_field_cnt > 0 THEN
			lds_app_fld_data.SetSort( "connect_field_id, connect_field_sort" )
			lds_app_fld_data.Sort()
			li_temp_calc_field = 0
			//Start Code Change ---- 12.07.2006 #V7 maha  cleared up some issues with bold connected annotations
			//Start Code Change ---- 4.10.2007 #V7 maha added last field definition to correct problem with multiple connects
			FOR c = 1 TO li_field_cnt
				//debugbreak()
				lb_lastconn = false
				li_cal_field_id = lds_app_fld_data.GetItemNumber( c, "connect_field_id" )			
				//loop through all conected fields 
				IF li_temp_calc_field <> li_cal_field_id THEN //new connect field
					li_firstfield = c
					if c = li_firstfield then //get position/font data from the first field in a group
						li_anc_calc_field = lds_app_fld_data.GetItemNumber( c, "app_field_id" )
						li_ancor_field = 1
						li_temp_calc_field = li_cal_field_id
						ls_calc_field = ""
						li_x = lds_app_fld_data.GetItemNumber( c, "x_pos" ) - 5
						li_y = lds_app_fld_data.GetItemNumber( c, "y_pos" )				
						li_font = lds_app_fld_data.GetItemNumber( c, "font_size" )				
						li_width = lds_app_fld_data.GetItemNumber( c, "annotation_width" )			
						li_height = lds_app_fld_data.GetItemNumber( c, "height" )		
						IF lds_app_fld_data.GetItemNumber(c , "font_bold" ) = 1 THEN 
							li_bold = 1
						ELSE
							li_bold = 0
						END IF
						li_sort_cnt = 0
					end if
				else //maha 4.10.07  identify  last field of a group
					if c < li_field_cnt then
						if li_cal_field_id <> lds_app_fld_data.GetItemNumber( c + 1, "connect_field_id" ) then
							lb_lastconn  = true
						end if
					end if
							
				END IF
				li_sort_cnt ++
				li_app_field_id = lds_app_fld_data.GetItemNumber( c, "app_field_id" )			
				ole_edit.Object.SelectAnnotationGroup( "" )
				ole_edit.Object.SelectAnnotationGroup( String( li_app_field_id ) )
				ole_edit.Object.DeleteAnnotationGroup( String( li_app_field_id ) )						
				ls_calc_field = ls_calc_field + " " + ls_data_value[ li_cal_field_id, li_sort_cnt ]
				//debugbreak()
				//IF c = li_field_cnt or  li_temp_calc_field <> li_cal_field_id THEN
				IF c = li_field_cnt OR lb_lastconn then 
				//End Code Change---04.10.2007	
					ole_edit.Object.AddAnnotationGroup( String(li_anc_calc_field) )
					ole_edit.object.AnnotationStampText( ls_calc_field )
					ole_edit.object.AnnotationFontColor( RGB(0,0,128) )
					ole_edit.object.Annotationtype(8)
					CHOOSE CASE li_font
						CASE 1
							ole_edit.Object.AnnotationFont.Name = "MS Serif"
							ole_edit.Object.AnnotationFont.Size = 7
						CASE 2
							ole_edit.Object.AnnotationFont.Name = "Times New Roman"
							ole_edit.Object.AnnotationFont.Size = 8				
						CASE 3
							ole_edit.Object.AnnotationFont.Name = "Times New Roman"
							ole_edit.Object.AnnotationFont.Size = 12
					END CHOOSE
					IF li_bold = 1 THEN
						ole_edit.Object.AnnotationFont.Bold = True
					ELSE
						ole_edit.Object.AnnotationFont.Bold = False
					END IF
					ole_edit.object.Draw(li_x, li_y, li_width, li_height)
					lb_page_populated[ p ] = True				
				END IF			
			END FOR //for connected field loop
			
		END IF  //for connected fields
		//End Code Change---12.07.2006
		//--------------------------- APPEON BEGIN ---------------------------
		//$<ID> PT-08
		//$<comment> 04.07.2006 By: Rodger Wu
		//$<reason> Performance Tuning 
		//$<modification> Comment out the following script since it becomes useless due to Appeon modification.
		/*
		lds_app_fld_data.SetFilter( "" )
		lds_app_fld_data.Filter( )		
		*/
		//---------------------------- APPEON END ----------------------------
	END FOR
	
	ole_edit.object.Annotationtype(11)			
	
	IF gi_burn_annos = 1 THEN
		ole_edit.Object.BurnInAnnotations( 1, 0 )
	END IF
	
	//--------------------------- APPEON BEGIN ---------------------------
	//$< Add  > 2008-07-17 By: Scofield
	//$<Reason> Verify if the directory has write right for the current user.
	
	ls_Rtn = f_ExaWriteRight(ole_edit.Object.Image)
	if Len(ls_Rtn) > 0 then
		MessageBox(gnv_app.iapp_object.DisplayName,ls_Rtn,Exclamation!)
		CONTINUE
	else
		ole_edit.Object.Save()
	end if
	//---------------------------- APPEON END ----------------------------

END FOR //pages populated

//debugbreak()
if lb_single_page = false then ////Start Code Change ----1.25.2008 #V8 maha - skip this if a single page from mapping
	IF Len( ls_add_pages ) > 0  THEN	
	
		
		if len(gs_app_image_path) < 1 then gs_app_image_path = gnv_data.of_getitem("ids","intelliapp_app_path",false) //Start Code Change ---- 01.25.2008 #V8 maha
		//Start Code Change ---- 01.18.2008 #V8 maha moved inside this IF from just above
	//Start Code Change ---- 01.25.2008 #V8 maha - remodified adding li_noblank and trapping further down
	//--------------------------- APPEON BEGIN ---------------------------
	//$<add> 06/18/2007 By: Ken.Guo
	//$<reason> If blank page file is not exist,download from web server.	
		If appeongetclienttype() = 'PB' Then
			//if gs_application_path
			//ls_blankpage = GetCurrentDirectory ( ) + "\blankpage.tif"
			ls_blankpage = gs_app_image_path + "\blankpage.tif" //Start Code Change ---- 01.25.2008 #V8 maha rechanged to application path
			If not fileexists(ls_blankpage) Then 
				Messagebox('File',ls_blankpage +  " file is missing.")
				li_noblank = -1
			end if
		Else
			ls_blankpage = gs_app_image_path + "\blankpage.tif"
			if not fileexists(ls_blankpage) Then lnv_down.of_downloadfile("" ,ls_blankpage)
			if not fileexists(ls_blankpage) Then
				Messagebox('Download','Failed to download blankpage.tif file to ' + gs_app_image_path  + '.')
				li_noblank = -1
			end if
		End If
	//---------------------------- APPEON END ----------------------------
	//End Code Change---01.18.2008
	
		if li_noblank = 0 then  //maha 0125508 trap for no blank page - don't display if filedoes not exist will crash
			ole_edit.Object.Image(ls_blankpage ) 
			ole_edit.Object.Page(1)
			ole_edit.Object.Display()	
		end if
		ole_admin.object.image( ls_save_as )
		
	
		li_delete_p = 0
	//delete pages not populated
		FOR p = 1 TO ai_to_page
			FOR ap = 1 TO UpperBound( li_add_page )
				IF p = li_add_page[ ap ] AND NOT lb_page_populated[ p ] THEN
					if ole_admin.Object.PageCount() = 1 then //maha012508 don't delete last page.
						exit
					else
						ole_admin.object.DeletePages( p - li_delete_p, 1 )
						li_delete_p ++
					end if
				END IF
			END FOR
		END FOR
	
		//--------------------------- APPEON BEGIN ---------------------------
		//$<modify> 06/18/2007 By: Ken.Guo
		//$<reason> If Delete all pages, the file is not exist,then Display() will runerror.
		/*
		ole_edit.Object.Image( ls_save_as )
		ole_edit.Object.Page(1)   //Ken:Below script will run it,So comment it.		
		ole_edit.Object.FitTo(3)  //Ken:Below script will run it,So comment it.		
		ole_edit.Object.Display() //Ken:Below script will run it,So comment it.		
		*/
		If Not fileexists(ls_save_as) Then //maha 012508 coded to not delete all pages so this should never happen.
			ole_edit.Object.Image( ls_blankpage )
		Else
			ole_edit.Object.Image( ls_save_as )
		End If
		//---------------------------- APPEON END ----------------------------
		
	END IF //additional pages
end if //if not single page
//End Code Change---01.25.2008



//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 06/18/2007 By: Ken.Guo
//$<reason> If it is blank page, the page need set to 1.
//ole_edit.Object.Page( ai_from_page )
If Not fileexists(ls_save_as) Then
	//For Blank Page
	ole_edit.Object.Page( 1 )	
Else
	//For image files. If it suppress page(s), then set focus to 1.
	If li_delete_p > 0 Then
		ole_edit.Object.Page( 1 )
	Else
		ole_edit.Object.Page( ai_from_page )
	End If
End If
//---------------------------- APPEON END ----------------------------

ole_edit.Object.FitTo(3)		
ole_edit.Object.Display()		

//ii_current_page = ai_from_page
//st_page_num.Text = "Page " + String( ai_from_page ) + " of " + String( ole_edit.Object.PageCount() )
ii_current_page = ole_edit.Object.page() //Modified by Ken.Guo At 2007-06-19
st_page_num.Text = "Page " + String( ii_current_page ) + " of " + String( ole_edit.Object.PageCount() )

//m_pfe_train_app_setup.m_view.m_nextpage
//m_pfe_train_app_setup.m_view.m_priorpage


IF ii_current_page > 1 THEN
	cb_prior.Enabled = True
ELSE
	cb_prior.Enabled = False
END IF

IF ii_current_page < ole_edit.Object.PageCount( ) THEN
	cb_next.Enabled = True
Else
	//Added by Ken.Guo at 2007-06-19
	cb_next.Enabled = False
END IF

DESTROY lds_screen_list
DESTROY lds_app_fld_data
DESTROY lds_screen_fields
DESTROY lds_app
DESTROY lds_de_detail
DESTROY de_functions
DESTROY lds_de_address

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-09
//$<comment> 04.07.2006 By: Rodger Wu
//$<reason> Performance Tuning
//$<modification> Comment out the following script since SQLCA has been set to commit automatically.
/* COMMIT USING SQLCA; */
//---------------------------- APPEON END ----------------------------

//End Code Change---02.14.2006
//End Code Change---06.07.2006


SetRedraw( True )

ole_edit.Object.ScrollBars( True )


RETURN 0
end function

public function integer of_set_server (boolean ab_started);ib_sever_started = ab_started

Return 0
end function

public function n_tr of_connections (string as_app_type, string as_account);integer i
string ls_conn
integer p1
integer p2
string ls_log
string ls_pass

IF as_app_type = "iApply" THEN
	TR_APP_DATA = CREATE n_tr;
	//--------------------------- APPEON BEGIN ---------------------------
	//$<modify> 2005-12-05 By: Luke
	//$<reason> we need check the dababase type after database tansfer.
   
	//	TR_APP_DATA.DBMS="ODBC"
	//	TR_APP_DATA.DbParm="ConnectString='DSN=centralservices;UID=dba;PWD=sql;',DelimitIdentifier='No'"
	//	
	//	COMMIT USING SQLCA;
	//	DISCONNECT USING SQLCA;
	//	
	//	SQLCA.DBMS="ODBC"
	//	SQLCA.DbParm= "ConnectString='DSN=IntelliCred Client1;UID=dba;PWD=sql;',DelimitIdentifier='No'"
	
	Choose Case gs_dbType
		Case 'ASA'
			TR_APP_DATA.DBMS="ODBC"
			TR_APP_DATA.DbParm="ConnectString='DSN=centralservices;UID=dba;PWD=sql;',DelimitIdentifier='Yes'"
			//--------------------------- APPEON BEGIN ---------------------------
			//$<ID> PT-10
			//$<modify> 02.09.2006 By: owen chen
			//$<reason> Performance tuning
			//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

			/*
			COMMIT USING SQLCA;
			DISCONNECT USING SQLCA;
			*/
			gnv_appeondb.of_startqueue( )
			COMMIT USING SQLCA;
			DISCONNECT USING SQLCA;
			gnv_appeondb.of_commitqueue( )
			//---------------------------- APPEON END ----------------------------

			
			
			SQLCA.DBMS="ODBC"
			SQLCA.DbParm= "ConnectString='DSN=IntelliCred Client1;UID=dba;PWD=sql;',DelimitIdentifier='Yes'"
		Case 'SQL'
			TR_APP_DATA.DBMS="ODBC"
			TR_APP_DATA.DbParm="ConnectString='DSN=centralservices_sql;UID=dba;PWD=sql;',DelimitIdentifier='Yes'"
			
			//--------------------------- APPEON BEGIN ---------------------------
			//$<ID> PT-11
			//$<modify> 02.09.2006 By: owen chen
			//$<reason> Performance tuning
			//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

			/*
			COMMIT USING SQLCA;
			DISCONNECT USING SQLCA;
			*/
			gnv_appeondb.of_startqueue( )
			COMMIT USING SQLCA;
			DISCONNECT USING SQLCA;
			gnv_appeondb.of_commitqueue( )
			//---------------------------- APPEON END ----------------------------
			
			SQLCA.DBMS="ODBC"
			SQLCA.DbParm= "ConnectString='DSN=IntelliCred Client1;UID=dba;PWD=sql;',DelimitIdentifier='Yes'"
	End Choose		
	//---------------------------- APPEON END ----------------------------
	
	//--------------------------- APPEON BEGIN ---------------------------
	//$< Add  > 2007-09-14 By: Scofield
	//$<Reason> Set the connection cache dynamically on Web
	if AppeonGetClientType() = 'WEB' then
		SQLCA.DBMS = gs_CacheType
		SQLCA.DBParm = gs_CacheSet
	end if
	//---------------------------- APPEON END ----------------------------

	CONNECT USING SQLCA;
	
	IF SQLCA.SQLCODE = -1 THEN
		MessageBox("Login", "Login Failed!")
		Return sqlca
	END IF
ELSEIF as_app_type = "Light" THEN
	TR_APP_DATA = SQLCA
	Return SQLCA
ELSE
	TR_APP_DATA = CREATE n_tr;
//Start Code Change ---- 11.21.2005 #96 maha  //login as DBA
//Start Code Change ---- 06.28.2007 #V7 maha   //modified to allow different connection parameters
	TR_APP_DATA.DBMS="ODBC"
	if gi_test_database = 1 then //maha 123102
		gs_odbc = "IntelliCred Test"
		//--------------------------- APPEON BEGIN ---------------------------
		//$<modify> 2005-12-05 By: Luke
		//$<reason> After database transfer, the application should supported 
		//$<reason> ASA and SQL database. So the connection string should difference. 
		
//		//TR_APP_DATA.DbParm="ConnectString='DSN=IntelliCred Test;UID=DBA;PWD=SQL;',DelimitIdentifier='No'"
//		if gs_dbtype = "ASA" then
//			TR_APP_DATA.DbParm="ConnectString='DSN=IntelliCred Test;UID=DBA;PWD=SQL;',DelimitIdentifier='No'"
//		else
//			TR_APP_DATA.DbParm="ConnectString='DSN=IntelliCred Test_sql;UID=dba;PWD=sql;',DelimitIdentifier='No'"
//		end if
//		//---------------------------- APPEON END ----------------------------
	elseif gi_test_database = 2 then //tutorial 030805
		gs_odbc = "IntelliCred Tutorial"
		//--------------------------- APPEON BEGIN ---------------------------
		//$<modify> 2005-12-05 By: Luke
		//$<reason> After database transfer, the application should supported 
		//$<reason> ASA and SQL database. So the connection string should difference. 
		
		//TR_APP_DATA.DbParm="ConnectString='DSN=IntelliCred Tutorial;UID=DBA;PWD=SQL;',DelimitIdentifier='No'"
//		if gs_dbtype = "ASA" then
//			TR_APP_DATA.DbParm="ConnectString='DSN=IntelliCred Tutorial;UID=DBA;PWD=SQL;',DelimitIdentifier='No'"
//		else
//			TR_APP_DATA.DbParm="ConnectString='DSN=IntelliCred Tutorial_sql;UID=dba;PWD=sql;',DelimitIdentifier='No'"
//		end if
		//---------------------------- APPEON END ----------------------------
	end if
//	else
		//--------------------------- APPEON BEGIN ---------------------------
		//$<modify> 2005-11-28 By: Liang QingShi
		//$<reason> 

		//TR_APP_DATA.DbParm="ConnectString='DSN=" + gs_odbc + ";UID=master;PWD=intellimaster;',DelimitIdentifier='No'"	
//		if gs_dbtype = "ASA" then
//		 TR_APP_DATA.DbParm="ConnectString='DSN=" + gs_odbc + ";UID=dba;PWD=sql;',DelimitIdentifier='No'"	
//		else
//		 TR_APP_DATA.DbParm="ConnectString='DSN=" + gs_odbc + ";UID=dba;PWD=sql;',DelimitIdentifier='No'"	
//		end if		
		//---------------------------- APPEON END ----------------------------
//	end if
END IF


integer cnt
select count(*) into :cnt from pbcatcol;
//messagebox("",cnt)
if cnt > 0 then 
	ii_master = 1
else
	ii_master = 0
end if
 
//TR_APP_DATA.DbParm="ConnectString='DSN=" + gs_odbc + ";UID=dba;PWD=sql;',DelimitIdentifier='No'"		
	
//End Code Change---11.21.2005 
//--------------------------- APPEON BEGIN ---------------------------
//$<add> 04.03.2006 By: LiuHongXin
//$<reason> Fix a defect. If TR_APP_DATA.AutoCommit is not set to TRUE, the tables in
//$<reason> the database could be locked.
TR_APP_DATA.AutoCommit = True
//---------------------------- APPEON END ----------------------------
//debugbreak()
for i = 1 to 4
	choose case i
	//first try SQL
		case 1
			TR_APP_DATA.DbParm="ConnectString='DSN=" + gs_odbc + ";UID=dba;PWD=sql;',StaticBind=0,DisableBind=1,PBUseProcOwner='Yes',RPCReBind=1,MsgTerse='Yes', " + & 
																		"DelimitIdentifier='Yes',ConnectOption='SQL_DRIVER_CONNECT,SQL_DRIVER_NOPROMPT ',"+ & 
																		"PBTrimCharColumns='Yes',PBMaxBlobSize = '2147483647' ,PBMaxTextSize = '2147483647'"
		case 2									
			TR_APP_DATA.DbParm="ConnectString='DSN=" + gs_odbc + ";UID=dba;PWD=Im@A^2c4U;',StaticBind=0,DisableBind=1,PBUseProcOwner='Yes',RPCReBind=1,MsgTerse='Yes', " + & 
																		"DelimitIdentifier='Yes',ConnectOption='SQL_DRIVER_CONNECT,SQL_DRIVER_NOPROMPT ',"+ & 
																		"PBTrimCharColumns='Yes',PBMaxBlobSize = '2147483647' ,PBMaxTextSize = '2147483647'"
		case 3									
			TR_APP_DATA.DbParm="ConnectString='DSN=" + gs_odbc + ";UID=dba;',StaticBind=0,DisableBind=1,PBUseProcOwner='Yes',RPCReBind=1,MsgTerse='Yes', " + & 
																		"DelimitIdentifier='Yes',ConnectOption='SQL_DRIVER_CONNECT,SQL_DRIVER_NOPROMPT ',"+ & 
																		"PBTrimCharColumns='Yes',PBMaxBlobSize = '2147483647' ,PBMaxTextSize = '2147483647'"
		case 4		//this option can ONLY be used for MS SQL as ASA requires the dba login
			ls_conn = ProfileString(gs_IniFilePathName, "Setup", "dbconndata", "None")
			if ls_conn = "None" then
				continue
			else
				p1 = pos(ls_conn,"isoft")
				p2 = pos(ls_conn,"!!!")
				if  p1 = 0 then continue
				if  p2 = 0 then continue
				ls_log = "isoft@@@" + mid(ls_conn,6, p2 - 6)
				ls_pass = "isoft@@@" + mid(ls_conn,p2 + 3)
				n_cst_encrypt lnvo_encrypt 
//				invo_encrypt  = create n_cst_encrypt
				ls_log = lnvo_encrypt.of_decrypt( ls_log)
				ls_pass = lnvo_encrypt.of_decrypt( ls_pass)
			end if
			TR_APP_DATA.DBParm     = "ConnectString='DSN=" + gs_odbc + ";UID=" + ls_log + ";PWD=" + ls_pass + "',StaticBind=0,DisableBind=1,PBUseProcOwner='Yes',RPCReBind=1,MsgTerse='Yes', " + & 
																		"DelimitIdentifier='Yes',ConnectOption='SQL_DRIVER_CONNECT,SQL_DRIVER_NOPROMPT ',"+ & 
																		"PBTrimCharColumns='Yes',PBMaxBlobSize = '2147483647' ,PBMaxTextSize = '2147483647'"    
	end choose	
	
	//--------------------------- APPEON BEGIN ---------------------------
	//$< Add  > 2007-09-14 By: Scofield
	//$<Reason> Set the connection cache dynamically on Web
	if AppeonGetClientType() = 'WEB' then
		TR_APP_DATA.DBMS = gs_CacheType
		TR_APP_DATA.DBParm = gs_CacheSet
	end if
	//---------------------------- APPEON END ----------------------------

	CONNECT USING TR_APP_DATA;
	//messagebox(string (i),string(SQLCA.SQLCODE))
	if TR_APP_DATA.SQLCODE = 0  THEN exit
next


//CONNECT USING TR_APP_DATA;
//End Code Change---06.28.2007
IF TR_APP_DATA.SQLCODE = -1 THEN
	MessageBox("Login", "Login Failed!")
	// mskinner 10 March 2005 -- begin - should be returing TR_APP_DATA not sqlsq
	Return TR_APP_DATA
	// mskinner 10 March 2005 -- end
END IF

Return TR_APP_DATA
end function

public function integer of_print_all ();Integer i
Integer li_retval
String ls_image

//ole_edit.Object.Page(1)
//ole_edit.Object.Display()
//ole_edit.Object.PrintImage( )

ole_admin.object.image = ole_edit.object.image
inv_image_functions.of_print( ole_admin, ole_edit, Handle(this), '', 1, ole_edit.Object.Pagecount( ))

Return 0
end function

public function integer of_populate ();Long ll_prac_id
Integer li_ans
String ls_name
gs_search lstr_search

lstr_search.stran_transaction = SQLCA
lstr_search.ls_open_for = "MEETINGS"//"REPORTS" + String( 1 ) 

OpenWithParm( w_extended_search_new , lstr_search )

IF Message.DoubleParm = -1 THEN
	Return -1
END IF

ii_prac_id = Long( Mid( Message.StringParm, 1, Pos( Message.StringParm, "-" )-1) )
ls_name = Mid( Message.StringParm, Pos( Message.StringParm, "-" )+1, 100 )

st_name.Text = ls_name

li_ans = MessageBox("Default Practitioner", "Would you like to use the selected practitioner as your Default Preview Practitioner?", Question!, YesNo!, 2 )
IF li_ans = 1 THEN
	SetProfileString(gs_IniFilePathName, "Setup", "default_practitioner", String( ii_prac_id ) )
	SetProfileString(gs_IniFilePathName, "Setup", "default_parent_facility", String(gi_parent_facility) )
END IF

Return 1

//Open( w_get_page_range )
//IF Message.StringParm = "Cancel" THEN
//	Return -1
//END IF

//ii_last_from_pop_page = Integer( Mid( Message.StringParm, 1, Pos( Message.StringParm, "-" ) -1) ) 
//ii_last_to_pop_page = Integer( Mid( Message.StringParm, Pos( Message.StringParm, "-" ) +1, 100  ) )

//of_setup( ii_app_id, ii_last_from_pop_page, ii_last_to_pop_page, gi_parent_facility )

//cb_repopulate.Enabled = True

Return 1
end function

public function integer of_set_default_preview_prac ();Long ll_prac_id
Integer li_ans
String ls_name
gs_search lstr_search

lstr_search.stran_transaction = SQLCA
lstr_search.ls_open_for = "MEETINGS" //maha changed from REPORTS 093005

OpenWithParm( w_extended_search_new , lstr_search )
debugbreak()
IF Message.DoubleParm = -1 THEN
	Return -1
END IF

ii_prac_id = Long( Mid( Message.StringParm, 1, Pos( Message.StringParm, "-" )-1) )
ls_name = Mid( Message.StringParm, Pos( Message.StringParm, "-" )+1, 100 )

st_name.Text = ls_name

SetProfileString(gs_IniFilePathName, "Setup", "default_practitioner", String( ii_prac_id ) )
SetProfileString(gs_IniFilePathName, "Setup", "default_parent_facility", String(gi_parent_facility) )


Return 1

end function

public function integer of_next_page ();
IF ole_edit.Object.PageCount() > ii_current_page THEN
	ii_current_page ++
	ole_edit.object.Page( ii_current_page  )
	ole_edit.object.Display()	
	//ole_edit.Object.HideAnnotationGroup()	
	IF ii_current_page = ole_edit.Object.PageCount() THEN
		IF IsValid( m_pfe_train_app_preview ) THEN
			gnv_app.of_modify_menu_attr( m_pfe_train_app_preview.m_view.m_nextpage,'enabled', False)
			gnv_app.of_modify_menu_attr( m_pfe_train_app_preview.m_view.m_priorpage,'enabled', True)
		END IF	
	END IF
	IF ii_current_page > 1 AND ole_edit.Object.PageCount() > 1 THEN
		IF IsValid( m_pfe_train_app_preview ) THEN		
			gnv_app.of_modify_menu_attr( m_pfe_train_app_preview.m_view.m_priorpage,'enabled', True)
		END IF
	END IF
	st_page_num.Text = "Page " + String( ii_current_page ) + " Of " + String( ole_edit.Object.PageCount() )
END IF

Return 1
end function

public function integer of_prior_page ();IF ii_current_page > 1 THEN
	ii_current_page --
	ole_edit.object.Page( ii_current_page  )
	ole_edit.object.Display()
	//ole_edit.Object.HideAnnotationGroup()	
	IF ii_current_page > 1 THEN
		IF IsValid( m_pfe_train_app_preview ) THEN
			gnv_app.of_modify_menu_attr( m_pfe_train_app_preview.m_view.m_nextpage,'enabled', True)
		END IF	
	END IF
	IF ii_current_page = 1 THEN
		IF IsValid( m_pfe_train_app_preview ) THEN
			gnv_app.of_modify_menu_attr( m_pfe_train_app_preview.m_view.m_priorpage,'enabled', False)
		END IF	
	END IF
	st_page_num.Text = "Page " + String( ii_current_page ) + " Of " + String( ole_edit.Object.PageCount() )
END IF

Return 1
end function

public function integer of_print ();Integer 	li_from_page
Integer 	li_to_page
String	ls_Rtn

//--------------------------- APPEON BEGIN ---------------------------
//$< Add  > 2008-07-17 By: Scofield
//$<Reason> Verify if the directory has write right for the current user.

ls_Rtn = f_ExaWriteRight(ole_edit.Object.Image)
if Len(ls_Rtn) > 0 then
	MessageBox(gnv_app.iapp_object.DisplayName,ls_Rtn,Exclamation!)
	Return -1
end if
//---------------------------- APPEON END ----------------------------

ole_edit.Object.Save()

//Open( w_get_page_range )
//IF Message.StringParm = "Cancel" THEN
//	Return -1
//END IF
//
//li_from_page = Integer( Mid( Message.StringParm, 1, Pos( Message.StringParm, "-" ) -1) ) 
//li_to_page = Integer( Mid( Message.StringParm, Pos( Message.StringParm, "-" ) +1, 100  ) )
//
//// mskinner 09 March 2005 -- begin
//// do not let the user select a page greaer then page count
//if li_to_page >  ole_edit.Object.PageCount() then
//	li_to_page = ole_edit.Object.PageCount()
//end if
//// mskinner 09 March 2005 -- end


of_print( 1, 99, 1, 0 )

Return 1

end function

public function integer of_prac_search ();Long ll_prac_id
Integer li_ans
String ls_name
gs_search lstr_search

lstr_search.stran_transaction = SQLCA
lstr_search.ls_open_for = "MEETINGS"  

OpenWithParm( w_extended_search_new , lstr_search )

IF Message.DoubleParm = -1 THEN
	Return -1
END IF

ii_prac_id = Long( Mid( Message.StringParm, 1, Pos( Message.StringParm, "-" )-1) )
ls_name = Mid( Message.StringParm, Pos( Message.StringParm, "-" )+1, 100 )

st_name.Text = ls_name


Return 1

end function

public function integer of_save_for_faxing (integer ai_index);String ls_save_as,ls_Rtn
ls_save_as = gs_dir_path + gs_DefDirName + "\fax\app_" + String(ai_index) +  ".tif" 

//--------------------------- APPEON BEGIN ---------------------------
//$< Add  > 2008-07-14 By: Scofield
//$<Reason> Verify if the directory has write right for the current user.

ls_Rtn = f_ExaWriteRight(ls_save_as)
if Len(ls_Rtn) > 0 then
	MessageBox(gnv_app.iapp_object.DisplayName,ls_Rtn,Exclamation!)
	Return -1
end if

//---------------------------- APPEON END ----------------------------

ole_edit.Object.SaveAs( ls_save_as,1,1,1,0,false  )

Return 1

end function

public function long of_addr_get_gpid (integer ai_rowcount);pfc_cst_nv_data_entry_functions de_functions
integer li_master = 0
integer li_billing_flag
integer li_record_number
integer li_err_handling = 0
integer li_facility_id
integer li_retval
integer res
long ll_billing_address_id
long ll_rec_id
long ll_prac
long ll_gpid
string ls_query
string ls_query_op
string ls_query_value 
string ls_query_fld
string ls_link_type
string ls_error
string ls_fld_nm

//Start Code Change ---- 11.21.2005 #100 maha
if ii_master = 1 THEN //maha change 112105 
	li_master = 1
end if
//End Code Change---11.21.2005 

ls_query = of_address_query(ls_query_value)
if ls_query = "ERROR" then
	return -1
end if

IF  Pos( Upper(ls_query_value), "TODAY")  > 0 THEN
	ls_query_value = "Date('"+ String( Today() ) + "')"
	ls_query = ls_query_fld + ls_query_op + ls_query_value
 // query for nulls
elseIF  Pos( Upper(ls_query_value), "NOT NULL")  > 0 THEN
	ls_query_value = ""
	ls_query = " not isnull(" + ls_query_fld + ")"
	//ls_query_value = " Is Null('"+ ls_query_value + "')"
elseif Pos( Upper(ls_query_value), "NULL")  > 0 THEN
	ls_query_value = ""
	ls_query = "isnull(" + ls_query_fld + ")"
else
//	select field_type into :ls_query_fld_type from                                                sys_fields where field_name = :ls_query_fld_org and table_id = :li_table_id;
//	if ls_query_fld_type = "C" THEN //maha 101002
//	//messagebox("ls_query","CHAR")
//		ls_query_value = "'" + ls_query_value + "'"
//		ls_query = ls_query_fld + ls_query_op + ls_query_value //maha readded 121503
//	end if
END IF

//li_billing_flag = lds_app_fld_data.GetItemNumber( li_fld_loop, "billing_address_flag" )
		
IF Len( ls_query ) > 0 THEN
//		li_retval = ids_address.Filter( )	
		ids_address.sort( )
end if									

					//new billing code		JAD 11/9/01
IF li_billing_flag  = 1 THEN
	IF li_record_number > ids_address.RowCount() THEN
		//MessageBox( "Population Error", "There is no primary address setup for this practitioner." )
		return 1
	END IF
		//check to find out how the field is named in the dw
	IF li_master = 1 THEN
		ls_fld_nm = "pd_address_billing_address_id"
	ELSE
		ls_fld_nm = "billing_address_id"						
	END IF
	ll_billing_address_id = ids_address.GetItemNumber( li_record_number, ls_fld_nm )
	IF ll_billing_address_id > 0 THEN
	
		IF li_master = 1 THEN
			ls_fld_nm = "pd_address_rec_id"
		ELSE
			ls_fld_nm = "rec_id"						
		END IF			
	ids_address.SetFilter( ls_fld_nm  + " = " + String( ll_billing_address_id ) )
	ids_address.Filter( )
	end if
							//lds_de_detail.sort( )
	li_record_number = 1

else
	ids_address.SetFilter(ls_query )
	ids_address.Filter( )
					//lds_de_detail.sort( ) //maha 092203
END IF

IF Len( de_functions.is_sort_syntax ) > 0 THEN
			//messagebox("", de_functions.is_sort_syntax )
	res = ids_address.SetSort( de_functions.is_sort_syntax )
	if res = -1 then messagebox("Error Sorting " ,de_functions.is_sort_syntax)//maha 032204
	ids_address.Sort( )
end if

ll_gpid = ids_address.getitemnumber(1,"rec_id")


return ll_gpid
end function

public function string of_address_query (string as_type);//Start Code Change ---- 02.01.2006 #232 maha
//Query created 013106 maha called from of_setup()

string ls_query
long ll_rec_id
string ls_error


CHOOSE CASE (as_type )
	//primary office
	CASE "647"
		ls_query = "pd_address_link_primary_office = 1"
	//additional office
	CASE "256"
		ls_query = "pd_address_link_additional_office = 1"
	//home addrss
	CASE "648"
		ls_query = "pd_address_link_home_address =  1"
	CASE "24472"
		ls_query = "pd_address_link_billing =  1"					
	CASE "24477"
		ls_query = "pd_address_link_mailing =  1"	
	case "24490"
		ls_query = "pd_address_link_exp_letters =  1"
	CASE ELSE
		ls_query = "ERROR"			
END CHOOSE
	
return ls_query
//End Code Change---02.01.2006
end function

public function integer of_error_msg (long al_prac, integer ai_facil_id, long al_app_id, long al_app_field_id, integer ai_cur_page, string as_error, integer ai_err_hand);//Start Code Change ---- 02.01.2006 #233 maha
//Query created 013106 maha called from of_setup()
long ll_rec_id

IF ib_sever_started THEN
	UPDATE iapply
	SET error_message = :as_error
	WHERE rec_id = :il_intelliapp_rec_id
	USING TR_APP_DATA;
ELSE
//	ls_error = "Field ID (" + String( al_app_field_id ) + ")" + "Unknown address type. (" + as_type + ")" 
	IF ai_err_hand = 1 THEN
		  ll_rec_id = gnv_app.of_Get_Id( "RECORD_ID" )
		  
		  INSERT INTO app_err_log  
   						( prac_id,   
           facility_id,   
           app_id,   
           app_fld_id,   
           page_no,   
           err_msg,   
           rec_id )  
		  VALUES ( :al_prac,   
           :ai_facil_id,   
			  :al_app_id,
           :al_app_field_id,   
           :ai_cur_page,   
           :as_error,   
           :ll_rec_id )  ;
	ELSE
		MessageBox("Error", as_error )
	END IF	
END IF
			
return 1
//End Code Change---02.01.2006
end function

public function string of_billing_address (n_ds ads_detail, string as_query, integer ai_record_number, integer ai_screen);string ls_ret_query
string ls_fld_nm
integer li_retval
integer li_de_row_cnt
long ll_billing_address_id

// FILTER the address data and find the billing address record
ads_detail.setFilter(as_query)
li_retval = ads_detail.Filter( )	
ads_detail.sort( )
IF li_retval = -1 THEN
//	ls_error = "Field ID (" + String( li_app_field_id ) + ")" + "Error during Filter()"
	//of_error_msg( ll_prac, facility_id, ii_app_id, li_app_field_id, li_current_page, ls_error, li_err_handling)							
END IF
									
li_de_row_cnt = ads_detail.RowCount()
//skip if looking for a record number greater than the number of filtered rows
IF ai_record_number > ads_detail.RowCount() THEN
	return "CONTINUE"
END IF

//check to find out how the field is named in the dw
IF ads_detail.Describe( "pd_address_billing_address_id.color" ) = '0' THEN
	ls_fld_nm = "pd_address_billing_address_id"
ELSE
	ls_fld_nm = "billing_address_id"						
END IF
//GET BILLING address id from the DS

ll_billing_address_id = ads_detail.GetItemNumber( ai_record_number, ls_fld_nm )
IF ll_billing_address_id > 0 THEN					
	IF ai_screen = 2 THEN
			//test to see what field name to use
		IF ads_detail.Describe( "pd_address_rec_id.color" ) = '0' THEN
			ls_fld_nm = "pd_address_rec_id"
		ELSE
			ls_fld_nm = "rec_id"						
		END IF
		//refilter address data based on billing address id
		ls_ret_query = ls_fld_nm  + " = " + String( ll_billing_address_id ) 
	ELSEIF ai_screen = 31 THEN  //Detail 2 screen
		//test to see what field name to use							
		IF ads_detail.Describe( "pd_address_2_rec_id.color" ) = '0' THEN
			ls_fld_nm = "pd_address_2_rec_id"
		ELSE
			ls_fld_nm = "rec_id"						
		END IF										
		ls_ret_query =  ls_fld_nm + " = " + String( ll_billing_address_id ) 
	END IF
end if


return ls_ret_query
end function

public function string of_field_name (integer ai_screen, string as_field);string ls_field


IF ai_screen = 2 THEN
  	ls_field =  "pd_address_" + as_field
ELSEIF ai_screen = 31 THEN
   ls_field =  "pd_address_2_" + as_field
ELSEIF ai_screen = 10 THEN
  	ls_field =  "pd_hosp_affil_" + as_field
ELSE
	ls_field = as_field
END IF


return ls_field
end function

public function string of_format (string as_value, string as_format);//Start Code Change ---- 06.02.2006 #496 maha //function added 06.02.06
string ls_ret
integer li_pos

li_pos = pos(as_value," ",1)

choose case as_format
	case "Before Space"
		if li_pos > 0 then
			ls_ret = mid(as_value,1,li_pos - 1)	
		else //if no space return the sent value
			ls_ret = as_value
		end if
	case "After Space"
		if li_pos > 0 then
			ls_ret = mid(as_value,li_pos + 1)
		else
			ls_ret = as_value
		end if
	case "CAQH Code"  //Start Code Change ---- 02.23.2007 #V7 maha
		if len(as_value) = 1 then
			ls_ret = "00" + as_value
		elseif len(as_value) = 2 then
			ls_ret = "0" + as_value
		end if
	case else
		ls_ret = as_value
		
end choose


return ls_ret
end function

on pfc_cst_u_create_app2.create
this.cb_repopulate=create cb_repopulate
this.dw_exceptions=create dw_exceptions
this.ole_admin=create ole_admin
this.st_rec=create st_rec
this.st_page_num=create st_page_num
this.st_name=create st_name
this.cb_next=create cb_next
this.cb_prior=create cb_prior
this.cb_2=create cb_2
this.cb_1=create cb_1
this.st_1=create st_1
this.st_2=create st_2
this.ole_edit=create ole_edit
this.Control[]={this.cb_repopulate,&
this.dw_exceptions,&
this.ole_admin,&
this.st_rec,&
this.st_page_num,&
this.st_name,&
this.cb_next,&
this.cb_prior,&
this.cb_2,&
this.cb_1,&
this.st_1,&
this.st_2,&
this.ole_edit}
end on

on pfc_cst_u_create_app2.destroy
destroy(this.cb_repopulate)
destroy(this.dw_exceptions)
destroy(this.ole_admin)
destroy(this.st_rec)
destroy(this.st_page_num)
destroy(this.st_name)
destroy(this.cb_next)
destroy(this.cb_prior)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.ole_edit)
end on

event destructor;If isvalid(TR_APP_DATA) then Destroy TR_APP_DATA
If isvalid(inv_image_functions) Then Destroy inv_image_functions


end event

event constructor;



if not isvalid(inv_image_functions ) then
	inv_image_functions = create pfc_cst_nv_image_functions
end if 
end event

type cb_repopulate from commandbutton within pfc_cst_u_create_app2
boolean visible = false
integer x = 2848
integer y = 1876
integer width = 329
integer height = 84
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "Repopulate"
end type

event clicked;of_setup( ii_app_id, ii_last_from_pop_page, ii_last_to_pop_page, gi_parent_facility )
end event

type dw_exceptions from datawindow within pfc_cst_u_create_app2
boolean visible = false
integer x = 18
integer y = 1544
integer width = 347
integer height = 184
integer taborder = 20
string dataobject = "d_exceptions_list"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type ole_admin from olecustomcontrol within pfc_cst_u_create_app2
event filepropertiesclose ( )
boolean visible = false
integer x = 663
integer y = 1984
integer width = 155
integer height = 136
integer taborder = 80
borderstyle borderstyle = stylelowered!
string binarykey = "pfc_cst_u_create_app2.udo"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
end type

type st_rec from statictext within pfc_cst_u_create_app2
boolean visible = false
integer x = 27
integer y = 1852
integer width = 155
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
boolean focusrectangle = false
end type

type st_page_num from statictext within pfc_cst_u_create_app2
integer x = 878
integer y = 4
integer width = 379
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Page 1 of 100 "
boolean focusrectangle = false
end type

type st_name from statictext within pfc_cst_u_create_app2
integer x = 2327
integer width = 1339
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
alignment alignment = right!
boolean border = true
boolean focusrectangle = false
end type

type cb_next from commandbutton within pfc_cst_u_create_app2
boolean visible = false
integer x = 1554
integer y = 1880
integer width = 114
integer height = 84
integer taborder = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = ">"
end type

event clicked;

try

IF ole_edit.Object.PageCount() > ii_current_page THEN
	ii_current_page ++
	ole_edit.object.Page( ii_current_page  )
	ole_edit.object.Display()	
	IF ii_current_page = ole_edit.Object.PageCount() THEN
		This.Enabled = False
		cb_prior.Enabled = True
	END IF
	IF ii_current_page > 1 AND ole_edit.Object.PageCount() > 1 THEN
		cb_prior.Enabled = True
	END IF
	st_page_num.Text = "Page " + String( ii_current_page ) + " Of " + String( ole_edit.Object.PageCount() )
END IF

catch (RunTimeError RTE)
end try
end event

type cb_prior from commandbutton within pfc_cst_u_create_app2
boolean visible = false
integer x = 1440
integer y = 1880
integer width = 114
integer height = 84
integer taborder = 50
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "<"
end type

event clicked;IF ii_current_page > 1 THEN
	ii_current_page --
	ole_edit.object.Page( ii_current_page  )
	ole_edit.object.Display()
	//<Modify> 08/02/2007 by: Andy
	//IF ii_current_page > 1 THEN
	IF ii_current_page < ole_edit.Object.PageCount() THEN 
	//end of modify
		cb_next.Enabled = True
	END IF
	IF ii_current_page = 1 THEN
		This.Enabled = False
	END IF
	st_page_num.Text = "Page " + String( ii_current_page ) + " Of " + String( ole_edit.Object.PageCount() )
END IF
end event

type cb_2 from commandbutton within pfc_cst_u_create_app2
boolean visible = false
integer x = 2583
integer y = 1876
integer width = 247
integer height = 84
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Populate"
end type

event clicked;Long ll_prac_id
String ls_name
gs_search lstr_search

lstr_search.stran_transaction = SQLCA
lstr_search.ls_open_for = "REPORTS" + String( 1 ) 

OpenWithParm( w_extended_search_new , lstr_search )

IF Message.DoubleParm = -1 THEN
	Return -1
END IF

ii_prac_id = Long( Mid( Message.StringParm, 1, Pos( Message.StringParm, "-" )-1) )
ls_name = Mid( Message.StringParm, Pos( Message.StringParm, "-" )+1, 100 )

st_name.Text = ls_name

Open( w_get_page_range )
IF Message.StringParm = "Cancel" THEN
	Return -1
END IF

ii_last_from_pop_page = Integer( Mid( Message.StringParm, 1, Pos( Message.StringParm, "-" ) -1) ) 
ii_last_to_pop_page = Integer( Mid( Message.StringParm, Pos( Message.StringParm, "-" ) +1, 100  ) )

of_setup( ii_app_id, ii_last_from_pop_page, ii_last_to_pop_page, gi_parent_facility )

cb_repopulate.Enabled = True
end event

type cb_1 from commandbutton within pfc_cst_u_create_app2
boolean visible = false
integer x = 3200
integer y = 1876
integer width = 242
integer height = 84
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Print"
end type

event clicked;Integer 	li_from_page
Integer 	li_to_page
String	ls_Rtn

//--------------------------- APPEON BEGIN ---------------------------
//$< Add  > 2008-07-17 By: Scofield
//$<Reason> Verify if the directory has write right for the current user.

ls_Rtn = f_ExaWriteRight(ole_edit.Object.Image)
if Len(ls_Rtn) > 0 then
	MessageBox(gnv_app.iapp_object.DisplayName,ls_Rtn,Exclamation!)
	Return -1
end if
//---------------------------- APPEON END ----------------------------

ole_edit.Object.Save()

Open( w_get_page_range )
IF Message.StringParm = "Cancel" THEN
	Return -1
END IF

li_from_page = Integer( Mid( Message.StringParm, 1, Pos( Message.StringParm, "-" ) -1) ) 
li_to_page = Integer( Mid( Message.StringParm, Pos( Message.StringParm, "-" ) +1, 100  ) )

of_print( li_from_page, li_to_page, 1, 0 )

end event

type st_1 from statictext within pfc_cst_u_create_app2
integer x = 5
integer width = 1257
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

type st_2 from statictext within pfc_cst_u_create_app2
integer x = 1257
integer width = 1074
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

type ole_edit from olecustomcontrol within pfc_cst_u_create_app2
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
integer x = 5
integer y = 60
integer width = 3749
integer height = 1732
integer taborder = 10
borderstyle borderstyle = stylelowered!
string binarykey = "pfc_cst_u_create_app2.udo"
integer binaryindex = 1
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
end type


Start of PowerBuilder Binary Data Section : Do NOT Edit
02pfc_cst_u_create_app2.bin 
2F00000600e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe00000006000000000000000000000001000000010000000000001000fffffffe00000000fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdfffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000fffffffe00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000600e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe00000006000000000000000000000001000000010000000000001000fffffffe00000000fffffffe0000000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
27fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdfffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000fffffffe00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
12pfc_cst_u_create_app2.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
