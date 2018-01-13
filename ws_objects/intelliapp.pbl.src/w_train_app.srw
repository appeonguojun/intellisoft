$PBExportHeader$w_train_app.srw
forward
global type w_train_app from w_main
end type
type st_page_num from statictext within w_train_app
end type
type st_field_name from statictext within w_train_app
end type
type st_align from statictext within w_train_app
end type
type st_msg from statictext within w_train_app
end type
type st_connect from statictext within w_train_app
end type
type tab_1 from tab within w_train_app
end type
type tabpage_select from userobject within tab_1
end type
type tab_facility from tab within tabpage_select
end type
type tabpage_facility from userobject within tab_facility
end type
type dw_facility_detail from datawindow within tabpage_facility
end type
type dw_facility_browse from datawindow within tabpage_facility
end type
type tabpage_facility from userobject within tab_facility
dw_facility_detail dw_facility_detail
dw_facility_browse dw_facility_browse
end type
type tabpage_apps from userobject within tab_facility
end type
type cb_1 from commandbutton within tabpage_apps
end type
type dw_app_browse from datawindow within tabpage_apps
end type
type dw_app_detail_org from datawindow within tabpage_apps
end type
type dw_app_detail from u_dw within tabpage_apps
end type
type tabpage_apps from userobject within tab_facility
cb_1 cb_1
dw_app_browse dw_app_browse
dw_app_detail_org dw_app_detail_org
dw_app_detail dw_app_detail
end type
type tabpage_images from userobject within tab_facility
end type
type dw_image_defaults from u_dw within tabpage_images
end type
type cb_2 from commandbutton within tabpage_images
end type
type dw_image_list from u_dw within tabpage_images
end type
type tabpage_images from userobject within tab_facility
dw_image_defaults dw_image_defaults
cb_2 cb_2
dw_image_list dw_image_list
end type
type tab_facility from tab within tabpage_select
tabpage_facility tabpage_facility
tabpage_apps tabpage_apps
tabpage_images tabpage_images
end type
type st_org_name from statictext within tabpage_select
end type
type cb_5 from commandbutton within tabpage_select
end type
type tabpage_select from userobject within tab_1
tab_facility tab_facility
st_org_name st_org_name
cb_5 cb_5
end type
type tabpage_scan from userobject within tab_1
end type
type tabpage_scan from userobject within tab_1
end type
type tabpage_design from userobject within tab_1
end type
type cb_goto_page from commandbutton within tabpage_design
end type
type sle_goto_page from singlelineedit within tabpage_design
end type
type ole_img_admin from olecustomcontrol within tabpage_design
end type
type gb_3 from groupbox within tabpage_design
end type
type st_field from statictext within tabpage_design
end type
type dw_screen from datawindow within tabpage_design
end type
type dw_field from datawindow within tabpage_design
end type
type uo_bar from pfc_cst_build_annotation_bar within tabpage_design
end type
type uo_preview from pfc_cst_u_create_app2 within tabpage_design
end type
type ole_scan from olecustomcontrol within tabpage_design
end type
type dw_2 from datawindow within tabpage_design
end type
type dw_1 from datawindow within tabpage_design
end type
type ole_edit from olecustomcontrol within tabpage_design
end type
type tab_fld_prop from tab within tabpage_design
end type
type tabpage_1 from userobject within tab_fld_prop
end type
type cb_3 from commandbutton within tabpage_1
end type
type st_1 from statictext within tabpage_1
end type
type st_2 from statictext within tabpage_1
end type
type tabpage_1 from userobject within tab_fld_prop
cb_3 cb_3
st_1 st_1
st_2 st_2
end type
type tabpage_2 from userobject within tab_fld_prop
end type
type tabpage_2 from userobject within tab_fld_prop
end type
type tabpage_3 from userobject within tab_fld_prop
end type
type tabpage_3 from userobject within tab_fld_prop
end type
type tabpage_4 from userobject within tab_fld_prop
end type
type tabpage_4 from userobject within tab_fld_prop
end type
type tab_fld_prop from tab within tabpage_design
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
tabpage_4 tabpage_4
end type
type dw_fld_prop from datawindow within tabpage_design
end type
type cb_apply from commandbutton within tabpage_design
end type
type tabpage_design from userobject within tab_1
cb_goto_page cb_goto_page
sle_goto_page sle_goto_page
ole_img_admin ole_img_admin
gb_3 gb_3
st_field st_field
dw_screen dw_screen
dw_field dw_field
uo_bar uo_bar
uo_preview uo_preview
ole_scan ole_scan
dw_2 dw_2
dw_1 dw_1
ole_edit ole_edit
tab_fld_prop tab_fld_prop
dw_fld_prop dw_fld_prop
cb_apply cb_apply
end type
type tabpage_merge from userobject within tab_1
end type
type uo_create_app11 from pfc_cst_u_create_app2 within tabpage_merge
end type
type tabpage_merge from userobject within tab_1
uo_create_app11 uo_create_app11
end type
type tab_1 from tab within w_train_app
tabpage_select tabpage_select
tabpage_scan tabpage_scan
tabpage_design tabpage_design
tabpage_merge tabpage_merge
end type
end forward

global type w_train_app from w_main
integer x = 5
integer y = 4
integer width = 3712
integer height = 2172
string title = "IntelliApp"
long backcolor = 80269524
event pfc_addrow ( )
event pfc_deleterow ( )
event pfc_save_setup ( )
event pfc_select_row ( )
event pfc_test_app ( )
event pfc_delete_anno ( )
event pfc_change_org ( )
event pfc_image_path ( )
event pfc_test_all_apps ( )
event pfc_find ( )
event pfc_scan ( )
event pfc_blank_page ( )
event pfc_additional_info ( )
event pfc_straighten_page ( )
event pfc_page_properties ( )
event pfc_special_fields ( )
event pfc_field_exceptions ( )
event pfc_preview_page ( )
event pfc_preview_all ( )
event pfc_set_default_preview_prac ( )
event pfc_next_preview_page ( )
event pfc_prior_preview_page ( )
event pfc_align_tops ( )
event pfc_align_sides ( )
event pfc_align ( )
event pfc_connect_field ( )
event pfc_setup_connect_field ( )
event pfc_print_preview_app ( )
event pfc_prac_search ( )
event pfc_cst_goto_page ( )
event pfc_cst_highlighter ( )
event pfc_cst_scan_for_tifs ( )
event pfc_cst_copy_app ( )
event pfc_cst_insert_app ( )
event pfc_query_batch ( )
event pfc_cst_select_scanner ( )
st_page_num st_page_num
st_field_name st_field_name
st_align st_align
st_msg st_msg
st_connect st_connect
tab_1 tab_1
end type
global w_train_app w_train_app

type variables
n_tr  tr_training_data

pfc_cst_nv_image_functions image_functions

Boolean ib_personal_data = False
Boolean ib_auto_align_all = False
Boolean ib_contol_key_down = False
Boolean ib_wide_screen = False
Boolean ib_skip = False
Boolean ib_skip_temp
Boolean ib_pause_temp = False
Boolean ib_rectangle_selected = False
boolean ib_is_group
boolean ib_audit = false //maha 022206
boolean ib_query_batch = false

Boolean ib_moving_field = False
Boolean ib_placing_template = False
Boolean ib_loading_annotations = False
Boolean ib_deleted_app = False
Boolean ib_new_field_selection = False
Boolean ib_label_selected = False
Boolean ib_label_tool = False
Boolean ib_click_position = False
Boolean ib_fix_fields = False
Boolean ib_saved = True
Boolean ib_group = False

Long ii_label_y
Long ii_label_x
Long ii_cf_record_number
Long ii_shift_down_count = 0
Long li_last_fld_prop_tab = 1
Long ii_cf_past_years_query
Long ii_copy_fields
Long ii_connect_fields = 0
Long ii_ancor_count
Long ii_ancor_x
Long ii_ancor_y
Long ii_align = 0
Long ii_facility_id
Long ii_app_id
long ii_app_field_id
long ii_app_field_ids[]
Long ii_current_page = 1
Long ii_x[]
Long ii_y[]
Long ii_height[]
Long ii_copy_ancor_x
Long ii_copy_ancor_y
Long ii_page_count
Long ii_selected_fields_cnt
Long ii_first_clicked_field
Long ii_first_clicked_field_x
Long ii_first_clicked_field_y
Long il_prac_id
Long ii_record_number
Long ii_addr_record_number
Long ii_billing_address_flag
Long ii_addr_billing_flag
Long ii_shrink
long il_app_id_audit
integer ii_cf_skip_query  //Start Code Change ---- 06.14.2006 #539 maha

String is_preview_mode = "Train"
String ii_cf_query_field
String ii_cf_query_operator
String ii_cf_query_value
String is_label_id
String is_app_path
String is_selected_fields[]
String is_image_name
String is_select_field_dw =  "d_app_field_properties"
String is_last_key = ""
String is_query_field
String is_query_operator
String is_query_value
String is_addr_query_field
String is_addr_query_operator
String is_addr_query_value
String is_fld_nm

Boolean ib_hold_on_retrieve_end = False
Boolean ib_applied = False
Boolean ib_selected = False
Boolean ib_new_select = False
Boolean ib_drag_drop = False
Datawindow idw

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-01
//$<add> 04.04.2006 By: Rodger Wu
//$<reason> Performance Tuning 
//$<reason> Declare a datastore for caching data.
datastore ids_queryfield
boolean is_IsRectangle = False		//used for copy/cut with rope select
//---------------------------- APPEON END ----------------------------

end variables

forward prototypes
public function long of_update_field (string as_groupname, long left, long top, long width1, long height1)
public function long of_align (string as_align_type)
public function long of_copy_fields ()
public function long of_add_objects (string ls_object, long ai_font, long ai_bold)
public function long of_load_image ()
public function long of_delete_annotations ()
public function long of_load_annotations ()
public function Long of_disable_buttons ()
public function Long of_enable_buttons ()
public function long of_show_record ()
public function long of_delete_records ()
public function Long of_save_load ()
public function long of_auto_align ()
public function long of_select_app ()
public function long of_goto_fix_page (long row)
public function long of_select_button ()
public function long of_save_mapping ()
public function long of_save (string as_tab)
public function long of_remove_object ()
public function long of_open_template ()
public function long of_prior_page ()
public function long of_next_page ()
public function long of_select_field ()
public function long of_rope_select ()
public function long of_create_text ()
public function long of_draw_box ()
public function long of_copy ()
public function long of_paste ()
public function long of_cut ()
public function long of_add_row ()
public function long of_delete_row ()
public function Long of_test_application ()
public function long of_delete_anno_files ()
public function Long of_change_org ()
public function Long of_check_row ()
public function Long of_check_all_apps ()
public function Long of_find ()
public function long of_scan ()
public function long of_blank_page ()
public function Long of_additional_info ()
public function long of_straighten_page ()
public function long of_special_fields ()
public function Long of_field_exceptions ()
public function long of_page_properties ()
public function long of_preview (string as_type)
public function Long of_set_default_preview_prac ()
public function Long of_next_preview_page ()
public function Long of_prior_preview_page ()
public function long of_setup_align ()
public function long of_setup_connect_field ()
public function long of_connect_field ()
public function long of_select_field_info ()
public function Long of_print_preview_app ()
public function Long of_prac_search ()
public function long of_retrieve_end ()
public function long of_goto_page ()
public function long of_create_annotations (long ai_field_id)
public function integer of_auto_align_all ()
public function integer of_auto_align_tops ()
public function integer of_auto_align_sides ()
public function integer of_add_hollow_box ()
public function integer of_clear_annotations ()
public function integer of_clear_annos ()
public function integer of_clear_annos_one_page (integer ai_old_page, integer ai_new_page)
public function integer of_dw_field_dclick ()
public function integer of_field_name_visible ()
public function integer of_clean_data ()
public function integer of_addr_query_setup ()
public function integer of_check_for_image ()
public function integer of_set_query_lookup (string as_lookup, string as_data, string as_lookup_code, string as_field)
public function integer of_app_audit_track (long ai_appid)
private function integer of_cleanup (integer ai_prev_scrollx, integer ai_prev_scrolly)
public function integer of_query_batch_update ()
public function integer of_dupe_field_test (string as_field)
public function long of_get_app_field_id (string as_selected_field)
public subroutine of_retrieve_tables_fields ()
public function integer of_set_yes_no_box (datawindow as_dw, string as_data)
public function integer of_scanner_select ()
public function integer of_set_preview_mode (string as_mode)
end prototypes

event pfc_addrow;of_add_row()
end event

event pfc_deleterow;of_delete_row()
end event

event pfc_save_setup();
IF tab_1.tabpage_select.tab_facility.SelectedTab = 1 THEN
	of_save( "facility" )
//$<modify> 07.10.2008 by Andy
//ELS
ELSEif tab_1.tabpage_select.tab_facility.SelectedTab = 2 then
	of_save( "apps" )
ELSE
	of_save( "images" )
//end modify 07.10.2008
END IF
end event

event pfc_select_row();IF tab_1.tabpage_select.tab_facility.SelectedTab = 1 THEN
	 tab_1.tabpage_select.tab_facility.SelectTab( 2 )
	 ib_deleted_app = False
ELSE
	
	//--------------------------- APPEON BEGIN ---------------------------
	//$<add> 2006-09-27 By: Rodger Wu
	//$<reason> Fix a defect.
	Integer li_currentrow
	
	li_currentrow = tab_1.tabpage_select.tab_facility.tabpage_apps.dw_app_browse.GetSelectedRow( 0 )
	IF li_currentrow > 0 THEN
		IF ii_app_id <> tab_1.tabpage_select.tab_facility.tabpage_apps.dw_app_browse.GetItemNumber( li_currentrow, "app_id" ) THEN
			tab_1.tabpage_select.tab_facility.tabpage_apps.dw_app_browse.Trigger Event Clicked( 0, 0, li_currentrow, tab_1.tabpage_select.tab_facility.tabpage_apps.dw_app_browse.object.application_name )
		END IF
	END IF
	
	//---------------------------- APPEON END ----------------------------

	of_select_app( )
END IF
end event

event pfc_test_app;of_test_application( )
end event

event pfc_delete_anno;of_delete_anno_files( )
end event

event pfc_change_org;of_change_org( )
end event

event pfc_image_path;Open( w_get_path )

IF Message.StringParm <> "Cancel" THEN
	is_app_path = Message.StringParm
	gs_app_image_path = Message.StringParm
END IF


end event

event pfc_test_all_apps;of_check_all_apps( )
end event

event pfc_find;of_find( )
end event

event pfc_scan;of_scan( )
end event

event pfc_blank_page;of_blank_page()
end event

event pfc_additional_info;of_additional_info()
end event

event pfc_straighten_page;of_straighten_page()
end event

event pfc_page_properties;of_page_properties( )
end event

event pfc_special_fields;of_special_fields()
end event

event pfc_field_exceptions;of_field_exceptions()
end event

event pfc_preview_page();//Start Code Change ----12.03.2008 #V85 maha - modified to allow call to of_set_preview_mode
String ls_actual_current_page //Added by ken for save actual current page.
long ll_page,ll_pagecount

if of_check_for_image() = -1 then return//maha 031505

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-02
//$<add> 01.13.2006 By: Rodger Wu
//$<reason> Define local variable to get the handle of w_mdi.
long ll_handle
ll_handle = handle(w_mdi)
//---------------------------- APPEON END ----------------------------
	
IF is_preview_mode = "Train" THEN  //from train to preview 
	//tab_1.tabpage_design.uo_preview.Visible = True
	//tab_1.tabpage_design.uo_preview.BringToTop = True
	//m_pfe_train_app.m_file.m_previewpage.toolbaritemname = "Custom041!"
	//m_pfe_train_app.m_file.m_previewpage.toolbaritemtext = "Train"
	//st_field_name.Visible = False
	//of_field_name_visible( )
	//st_page_num.Visible = False	
	//tab_1.tabpage_design.dw_field.Visible = False
//	tab_1.tabpage_design.ole_edit.Visible = False
//	is_preview_mode = "Preview"
//	w_mdi.ChangeMenu( m_pfe_train_app_preview )
//	w_mdi.SetToolbarPos ( 2, 1, 200, False)
	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> UM-01
	//$<add> 01.13.2006 By: Rodger Wu
	//$<reason> The SetToolbarPos function is currently unsupported. 
	//$<modification> Replace the SetToolBarPos function with the Appeon defined function of_settoolbarpos to provide
	//$<modification> the same functionality.
//	If appeongetclienttype() <> 'PB' Then 
//		gnv_appeondll.of_settoolbarpos(ll_handle)
//		gnv_appeondll.of_SetToolbar(ll_handle,3, False )
//		gnv_appeondll.of_SetToolbar(ll_handle,4, False )
//		gnv_appeondll.of_SetToolbar(ll_handle,5, False )
//	End If
	//---------------------------- APPEON END ----------------------------
of_set_preview_mode( "Preview")
//	w_mdi.of_menu_security( "m_pfe_train_app_preview" )
	of_preview( "Page" )	
	//st_field_name.Visible = False
//	st_page_num.Visible = False	
	

//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 06/19/2007 By: Ken.Guo
//$<reason> For Page menu control.
/*
	IF tab_1.tabpage_design.ole_edit.Object.PageCount() = ii_current_page THEN
		gnv_app.of_modify_menu_attr( m_pfe_train_app.m_view.m_priorpage,'Enabled', True)
		gnv_app.of_modify_menu_attr( m_pfe_train_app.m_view.m_nextpage,'Enabled', False)
	ELSEIF ii_current_page < tab_1.tabpage_design.ole_edit.Object.PageCount() AND ii_current_page > 1 THEN
		gnv_app.of_modify_menu_attr( m_pfe_train_app.m_view.m_priorpage,'Enabled', True)
		gnv_app.of_modify_menu_attr( m_pfe_train_app.m_view.m_nextpage,'Enabled', True)
	END IF
*/

	ll_page = tab_1.tabpage_design.uo_preview.ole_edit.object.Page()
	ll_pagecount = tab_1.tabpage_design.uo_preview.ole_edit.object.PageCount()
	IF ll_page = 1 and ll_page = ll_pagecount Then
		gnv_app.of_modify_menu_attr( m_pfe_train_app.m_view.m_priorpage,'Enabled', False)
		gnv_app.of_modify_menu_attr( m_pfe_train_app.m_view.m_nextpage,'Enabled', False)
	ElseIf ll_page = ll_pagecount Then
		gnv_app.of_modify_menu_attr( m_pfe_train_app.m_view.m_priorpage,'Enabled', True)
		gnv_app.of_modify_menu_attr( m_pfe_train_app.m_view.m_nextpage,'Enabled', False)
	ElseIf ll_page < ll_pagecount and ll_page > 1 Then 
		gnv_app.of_modify_menu_attr( m_pfe_train_app.m_view.m_priorpage,'Enabled', True)
		gnv_app.of_modify_menu_attr( m_pfe_train_app.m_view.m_nextpage,'Enabled', True)
	ElseIf ll_page < ll_pagecount and ll_page = 1 Then
		gnv_app.of_modify_menu_attr( m_pfe_train_app.m_view.m_priorpage,'Enabled', False)
		gnv_app.of_modify_menu_attr( m_pfe_train_app.m_view.m_nextpage,'Enabled', True)		
	End If
//---------------------------- APPEON END ----------------------------


ELSE //from preview to train
	//m_pfe_train_app.m_file.m_previewpage.toolbaritemname = "ExecuteSQL5!"
	//m_pfe_train_app.m_file.m_previewpage.toolbaritemtext = "Preview"	

//	tab_1.tabpage_design.uo_preview.Visible = False
//	tab_1.tabpage_design.uo_preview.BringToTop = False
	
	tab_1.tabpage_design.uo_preview.of_load_app() //Added By Ken.Guo at 2007-06-19

	IF tab_1.tabpage_design.ole_edit.Object.Image() <> '' THEN
		tab_1.tabpage_design.ole_edit.Object.ShowAnnotationGroup( )
	END IF
	
	of_set_preview_mode( "Train")
	//st_field_name.Visible = True
//	st_page_num.Visible = True	
//	tab_1.tabpage_design.dw_field.Visible = True
//	tab_1.tabpage_design.ole_edit.Visible = True
//	is_preview_mode = "Train"		
//	w_mdi.ChangeMenu( m_pfe_train_app )
//	w_mdi.SetToolbarPos ( 2, 1, 200, False)
	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> UM-02
	//$<add> 01.13.2006 By: Rodger Wu
	//$<reason> The SetToolbarPos function is currently unsupported. 
	//$<modification> Replace the SetToolBarPos function with the Appeon defined function of_settoolbarpos to provide
	//$<modification> the same functionality.
//	If appeongetclienttype() <> 'PB' Then 
//		gnv_appeondll.of_settoolbarpos(ll_handle)
//		gnv_appeondll.of_SetToolbar(ll_handle,3, False )
//		gnv_appeondll.of_SetToolbar(ll_handle,4, False )
//		gnv_appeondll.of_SetToolbar(ll_handle,5, False )
//	End If
	//---------------------------- APPEON END ----------------------------
	
//	w_mdi.of_menu_security( "m_pfe_train_app" )
//	IF tab_1.tabpage_design.ole_edit.Object.Image <> '' THEN	
//		IF tab_1.tabpage_design.ole_edit.Object.PageCount() = ii_current_page THEN
//			m_pfe_train_app.m_view.m_priorpage.Enabled = True
//			m_pfe_train_app.m_view.m_nextpage.Enabled = False
//		ELSEIF ii_current_page < tab_1.tabpage_design.ole_edit.Object.PageCount() AND ii_current_page > 1 THEN
//			m_pfe_train_app.m_view.m_priorpage.Enabled = True
//			m_pfe_train_app.m_view.m_nextpage.Enabled = True
//		END IF	
//	END IF
END IF
//
//of_field_name_visible( ) //Start Code Change ----11.06.2008 #V85 maha
//

//org code 12.02.2008 \/

//String ls_actual_current_page //Added by ken for save actual current page.
//
//
//if of_check_for_image() = -1 then return//maha 031505
//
////--------------------------- APPEON BEGIN ---------------------------
////$<ID> PT-02
////$<add> 01.13.2006 By: Rodger Wu
////$<reason> Define local variable to get the handle of w_mdi.
//long ll_handle
//ll_handle = handle(w_mdi)
////---------------------------- APPEON END ----------------------------
//	
//IF is_preview_mode = "Train" THEN  //from train to preview 
//	tab_1.tabpage_design.uo_preview.Visible = True
//	tab_1.tabpage_design.uo_preview.BringToTop = True
//	//m_pfe_train_app.m_file.m_previewpage.toolbaritemname = "Custom041!"
//	//m_pfe_train_app.m_file.m_previewpage.toolbaritemtext = "Train"
//	//st_field_name.Visible = False
//	of_field_name_visible( )
//	st_page_num.Visible = False	
//	tab_1.tabpage_design.dw_field.Visible = False
//	tab_1.tabpage_design.ole_edit.Visible = False
//	is_preview_mode = "Preview"
//	w_mdi.ChangeMenu( m_pfe_train_app_preview )
//	w_mdi.SetToolbarPos ( 2, 1, 200, False)
//	//--------------------------- APPEON BEGIN ---------------------------
//	//$<ID> UM-01
//	//$<add> 01.13.2006 By: Rodger Wu
//	//$<reason> The SetToolbarPos function is currently unsupported. 
//	//$<modification> Replace the SetToolBarPos function with the Appeon defined function of_settoolbarpos to provide
//	//$<modification> the same functionality.
//	If appeongetclienttype() <> 'PB' Then 
//		gnv_appeondll.of_settoolbarpos(ll_handle)
//		gnv_appeondll.of_SetToolbar(ll_handle,3, False )
//		gnv_appeondll.of_SetToolbar(ll_handle,4, False )
//		gnv_appeondll.of_SetToolbar(ll_handle,5, False )
//	End If
//	//---------------------------- APPEON END ----------------------------
//
//	w_mdi.of_menu_security( "m_pfe_train_app_preview" )
//	of_preview( "Page" )	
//	//st_field_name.Visible = False
//	st_page_num.Visible = False	
//	
//
////--------------------------- APPEON BEGIN ---------------------------
////$<modify> 06/19/2007 By: Ken.Guo
////$<reason> For Page menu control.
///*
//	IF tab_1.tabpage_design.ole_edit.Object.PageCount() = ii_current_page THEN
//		m_pfe_train_app.m_view.m_priorpage.Enabled = True
//		m_pfe_train_app.m_view.m_nextpage.Enabled = False
//	ELSEIF ii_current_page < tab_1.tabpage_design.ole_edit.Object.PageCount() AND ii_current_page > 1 THEN
//		m_pfe_train_app.m_view.m_priorpage.Enabled = True
//		m_pfe_train_app.m_view.m_nextpage.Enabled = True
//	END IF
//*/
//	long ll_page,ll_pagecount
//	ll_page = tab_1.tabpage_design.uo_preview.ole_edit.object.Page()
//	ll_pagecount = tab_1.tabpage_design.uo_preview.ole_edit.object.PageCount()
//	IF ll_page = 1 and ll_page = ll_pagecount Then
//		m_pfe_train_app.m_view.m_priorpage.Enabled = False
//		m_pfe_train_app.m_view.m_nextpage.Enabled = False
//	ElseIf ll_page = ll_pagecount Then
//		m_pfe_train_app.m_view.m_priorpage.Enabled = True
//		m_pfe_train_app.m_view.m_nextpage.Enabled = False
//	ElseIf ll_page < ll_pagecount and ll_page > 1 Then 
//		m_pfe_train_app.m_view.m_priorpage.Enabled = True
//		m_pfe_train_app.m_view.m_nextpage.Enabled = True
//	ElseIf ll_page < ll_pagecount and ll_page = 1 Then
//		m_pfe_train_app.m_view.m_priorpage.Enabled = False
//		m_pfe_train_app.m_view.m_nextpage.Enabled = True		
//	End If
////---------------------------- APPEON END ----------------------------
//
//
//ELSE //from preview to train
//	//m_pfe_train_app.m_file.m_previewpage.toolbaritemname = "ExecuteSQL5!"
//	//m_pfe_train_app.m_file.m_previewpage.toolbaritemtext = "Preview"	
//
//	tab_1.tabpage_design.uo_preview.Visible = False
//	tab_1.tabpage_design.uo_preview.BringToTop = False
//	
//	tab_1.tabpage_design.uo_preview.of_load_app() //Added By Ken.Guo at 2007-06-19
//
//	IF tab_1.tabpage_design.ole_edit.Object.Image() <> '' THEN
//		tab_1.tabpage_design.ole_edit.Object.ShowAnnotationGroup( )
//	END IF
//	//st_field_name.Visible = True
//	st_page_num.Visible = True	
//	tab_1.tabpage_design.dw_field.Visible = True
//	tab_1.tabpage_design.ole_edit.Visible = True
//	is_preview_mode = "Train"		
//	w_mdi.ChangeMenu( m_pfe_train_app )
//	w_mdi.SetToolbarPos ( 2, 1, 200, False)
//	//--------------------------- APPEON BEGIN ---------------------------
//	//$<ID> UM-02
//	//$<add> 01.13.2006 By: Rodger Wu
//	//$<reason> The SetToolbarPos function is currently unsupported. 
//	//$<modification> Replace the SetToolBarPos function with the Appeon defined function of_settoolbarpos to provide
//	//$<modification> the same functionality.
//	If appeongetclienttype() <> 'PB' Then 
//		gnv_appeondll.of_settoolbarpos(ll_handle)
//		gnv_appeondll.of_SetToolbar(ll_handle,3, False )
//		gnv_appeondll.of_SetToolbar(ll_handle,4, False )
//		gnv_appeondll.of_SetToolbar(ll_handle,5, False )
//	End If
//	//---------------------------- APPEON END ----------------------------
//	
//	w_mdi.of_menu_security( "m_pfe_train_app" )
//	IF tab_1.tabpage_design.ole_edit.Object.Image <> '' THEN	
//		IF tab_1.tabpage_design.ole_edit.Object.PageCount() = ii_current_page THEN
//			m_pfe_train_app.m_view.m_priorpage.Enabled = True
//			m_pfe_train_app.m_view.m_nextpage.Enabled = False
//		ELSEIF ii_current_page < tab_1.tabpage_design.ole_edit.Object.PageCount() AND ii_current_page > 1 THEN
//			m_pfe_train_app.m_view.m_priorpage.Enabled = True
//			m_pfe_train_app.m_view.m_nextpage.Enabled = True
//		END IF	
//	END IF
//END IF
//of_field_name_visible( ) //Start Code Change ----11.06.2008 #V85 maha
end event

event pfc_preview_all();
string ls_page_from
string ls_page_to
string ls_prac
string ls_print
string ls_param

open(w_preview_params)

ls_param = message.stringparm

if isnull(ls_param) or ls_param = "" or ls_param = "Cancel" then
	return
end if

IF is_preview_mode = "Train" THEN
	tab_1.tabpage_design.uo_preview.Visible = True
	tab_1.tabpage_design.uo_preview.BringToTop = True
	//st_field_name.Visible = False
	tab_1.tabpage_design.dw_field.Visible = False
	tab_1.tabpage_design.ole_edit.Visible = False
	is_preview_mode = "Preview"
	w_mdi.ChangeMenu( m_pfe_train_app_preview )
	w_mdi.SetToolbarPos ( 2, 1, 200, False)
	w_mdi.of_menu_security( "m_pfe_train_app_preview" )
end if
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> UM-03
//$<add> 01.13.2006 By: Rodger Wu
//$<reason> The SetToolbarPos function is currently unsupported. 
//$<modification> Replace the SetToolBarPos function with the Appeon defined function of_settoolbarpos to provide
//$<modification> the same functionality.
If appeongetclienttype() <> 'PB' Then
	long ll_handle
	ll_handle = handle(w_mdi)
	gnv_appeondll.of_settoolbarpos(ll_handle)
	gnv_appeondll.of_SetToolbar(ll_handle,3, False )
	gnv_appeondll.of_SetToolbar(ll_handle,4, False )
	gnv_appeondll.of_SetToolbar(ll_handle,5, False )
End If
//---------------------------- APPEON END ----------------------------

of_preview( ls_param)	
	
//ELSE maha removed 042604
//	tab_1.tabpage_design.uo_preview.Visible = False
//	tab_1.tabpage_design.uo_preview.BringToTop = False
//	tab_1.tabpage_design.ole_edit.Object.ShowAnnotationGroup( )
//	//st_field_name.Visible = True
//	tab_1.tabpage_design.dw_field.Visible = True
//	tab_1.tabpage_design.ole_edit.Visible = True
//	is_preview_mode = "Train"		
//	w_mdi.ChangeMenu( m_pfe_train_app )
//	w_mdi.SetToolbarPos ( 2, 1, 200, False)	
//END IF

of_field_name_visible()


end event

event pfc_set_default_preview_prac;of_set_default_preview_prac( )
end event

event pfc_next_preview_page;of_Next_Preview_page( )


end event

event pfc_prior_preview_page;of_Prior_Preview_page( )
end event

event pfc_align_tops;of_align( "Top" )
end event

event pfc_align_sides;of_align( "Sides" )
end event

event pfc_align;of_Setup_Align( )
end event

event pfc_connect_field;of_connect_field( )
end event

event pfc_setup_connect_field;of_setup_connect_field( )
end event

event pfc_print_preview_app;of_print_preview_app()
end event

event pfc_prac_search;of_prac_search( )
end event

event pfc_cst_goto_page;of_goto_page( )
end event

event pfc_cst_highlighter;of_add_hollow_box()
end event

event pfc_cst_scan_for_tifs;integer i

open(w_scan_for_tifs) 


end event

event pfc_cst_copy_app();Integer li_cr

li_cr = tab_1.tabpage_select.tab_facility.tabpage_apps.dw_app_browse.GetRow()

OpenWithParm( w_copy_application, +&
		tab_1.tabpage_select.tab_facility.tabpage_apps.dw_app_browse.GetItemNumber( li_cr, "app_id" ) )

IF Message.StringParm = "Cancel" THEN
	Return
END IF

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-03
//$<modify> 04.05.2006 By: Rodger Wu
//$<reason> Performance tuning and Original code bug fixing
//$<modification> Add a messagebox to reduce the unnecessary calls to server.
/*
gs_pass_ids pass_ids
pass_ids = Message.PowerObjectParm
ii_app_id = pass_ids.l_app_id
ii_facility_id = pass_ids.facility_id
of_select_app( )
*/
gs_pass_ids pass_ids
pass_ids = Message.PowerObjectParm

If Messagebox( "Option", "Do you want to edit application '" + pass_ids.sl_label1 + &
								 "' now?", Question!, YesNo!, 2 ) = 2 Then Return;
ii_app_id = pass_ids.l_app_id
ii_facility_id = pass_ids.facility_id
of_select_app( )
//Show the current application's name.
This.Title = "IntelliApp  ( " + pass_ids.sl_label1 +  " )"
//---------------------------- APPEON END ----------------------------
end event

event pfc_cst_insert_app;Integer li_cr

li_cr = tab_1.tabpage_select.tab_facility.tabpage_apps.dw_app_browse.GetRow()


Open( w_insert_application )
IF Message.StringParm = "Cancel" THEN
	Return 
END IF


end event

event pfc_query_batch();//Start Code Change ---- 05.24.2006 #480 maha //created 05.24.06
Long li_dummy[]
String ls_dummy[]

if ib_query_batch = false then //called from query batch on tool menu
	w_train_app.tab_1.tabpage_design.ole_edit.Object.SelectAnnotationGroup( "" )
	w_train_app.ii_align = 0
	w_train_app.ii_ancor_count = 0
	w_train_app.is_selected_fields = ls_dummy
	w_train_app.ii_x = li_dummy
	w_train_app.ii_y = li_dummy
	w_train_app.ii_copy_fields = 1	
	w_train_app.tab_1.tabpage_design.ole_edit.object.AnnotationType( 11 )	
	
	gnv_app.of_modify_menu_attr( m_pfe_train_app.m_tools.m_connectfields,'ToolbaritemVisible', False)
	gnv_app.of_modify_menu_attr( m_pfe_train_app.m_edit.m_cut,'ToolbaritemVisible', False)
	gnv_app.of_modify_menu_attr( m_pfe_train_app.m_edit.m_paste,'ToolbaritemVisible', False)
	gnv_app.of_modify_menu_attr( m_pfe_train_app.m_edit.m_copy,'ToolbaritemVisible', False)
	gnv_app.of_modify_menu_attr( m_pfe_train_app.m_edit.m_update,'ToolbaritemVisible', True)
	gnv_app.of_modify_menu_attr( m_pfe_train_app.m_edit.m_update,'enabled', True)
	
	w_mdi.SetToolbarPos(3, 100, 400, 400, 1)
	
	w_mdi.SetToolbar(3, TRUE, Floating!, "")
	
	w_train_app.st_msg.Text = " Click on each field you want to update then click the Update icon."
	w_train_app.st_msg.Visible = True
	ib_query_batch = true
else //called from update on the file menu
	w_train_app.st_msg.Visible = False
	of_query_batch_update( )
	of_select_field()
	gnv_app.of_modify_menu_attr( m_pfe_train_app.m_edit.m_update,'ToolbaritemVisible', False)
	ib_query_batch = false
	
end if
end event

event pfc_cst_select_scanner();of_scanner_select( )  //Start Code Change ----02.21.2008 #V8 maha -  added
end event

public function long of_update_field (string as_groupname, long left, long top, long width1, long height1);//Start Code Change ---- 02.07.2006 # maha
DataWindowChild dwchild
Long li_tbl_id
String ls_query_fld
String ls_lookup_code
String ls_fld_type 
String ls_lookup_type
Long li_found
Long li_row_cnt
Long li_scroll_position_y
Long li_scroll_position_x
long li_current_app_field_id //modified 071802 maha

SetPointer( Arrow! )
//messagebox("","ofupdatefield")
//SetRedraw( False ) //avoiding screen blinks in web application

IF POS( as_groupname, "Rectangle," ) > 0 THEN
	li_current_app_field_id = Long( Mid( as_groupname, 11, 100 ) )
	UPDATE app_field_prop  
   SET x_pos = :left,   
       y_pos = :top,   
       box_height = :height1,   
       box_width = :width1
	WHERE app_field_id = :li_current_app_field_id
	USING tr_training_data;
	IF tr_training_data.SQLCODE = -1 THEN
		MessageBox("Database Error", tr_training_data.SQLERRTEXT )
	END IF		 
	//SetRedraw( True )	 //avoiding screen blinks in web application
	RETURN 1
END IF

IF tab_1.tabpage_design.dw_fld_prop.RowCount() > 0  THEN
	li_current_app_field_id = tab_1.tabpage_design.dw_fld_prop.GetItemNumber(1, "app_field_id" )
ELSE 
	li_current_app_field_id = 0
END IF

IF ii_app_field_id <>  li_current_app_field_id THEN
	IF tab_1.tabpage_design.dw_fld_prop.RowCount() > 0 THEN
		IF IsNull( tab_1.tabpage_design.dw_fld_prop.GetItemString(1, "field_description" ) )  THEN
			tab_1.tabpage_design.dw_fld_prop.DeleteRow( 1 )
			tab_1.tabpage_design.dw_fld_prop.Update()
			ib_new_field_selection = False
			ib_click_position = False
		END IF
	END IF

	li_row_cnt = tab_1.tabpage_design.dw_fld_prop.Retrieve( ii_app_field_id )	

	tab_1.tabpage_design.cb_apply.Visible = True
	IF ii_copy_fieldS = 0 THEN
		w_train_app.st_msg.Visible = False
	END IF
	IF li_row_cnt = 0 THEN
		MessageBox("Error", "The link between the IntelliApp Database and the Application image has been broken. Remove this field and place it again on the application image." )
		//w_select_fields.SetRedraw( True )		
		//SetRedraw( True )		 //avoiding screen blinks on web application
		Return 0
	END IF
	//Start Code Change ----09.25.2008 #V85 maha -  trap for fields from another application
	if tab_1.tabpage_design.dw_fld_prop.getitemnumber(1,"app_id") <> ii_app_id then
		MessageBox("Mapping Error", "This mapping field is not connected to this application.~rDeleting it will delete the data mapping from the original application.~r~rThis may have been caused by copying the original application image.~r~rTo correct this problem the annotations must be removed from the application image manually through the Imaging for Windows program.~r~rContact ContractLogix Support for further assistance.") 
	end if
	//End Code Change---09.25.2008
END IF

li_scroll_position_y = w_train_app.tab_1.tabpage_design.ole_edit.Object.ScrollPositionY()
li_scroll_position_x = w_train_app.tab_1.tabpage_design.ole_edit.Object.ScrollPositionX()
tab_1.tabpage_design.dw_fld_prop.SetItem( 1, "x_pos", left + li_scroll_position_x )	
tab_1.tabpage_design.dw_fld_prop.SetItem( 1, "y_pos", top + li_scroll_position_y )
tab_1.tabpage_design.dw_fld_prop.SetItem( 1, "annotation_width", width1 )
tab_1.tabpage_design.dw_fld_prop.SetItem( 1, "height", height1 )
tab_1.tabpage_design.dw_fld_prop.AcceptText()
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-04
//$<modify> 04.04.2006 By: Rodger Wu
//$<reason> Performance Tuning
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

/*
tab_1.tabpage_design.dw_fld_prop.Update()

integer i

//Setup query fields
li_tbl_id = tab_1.tabpage_design.dw_fld_prop.GetItemNumber( 1, "table_id" )
i = tab_1.tabpage_design.dw_fld_prop.GetChild( "query_field", dwchild )
dwchild.SetTransObject( SQLCA )
i = dwchild.Retrieve( li_tbl_id )
//query field


ls_query_fld = tab_1.tabpage_design.dw_fld_prop.GetItemString( 1, "query_field" )
li_found = dwchild.Find( "field_name = '" + ls_query_fld + "'", 1, 10000 )
IF li_found > 0 THEN
	ls_lookup_code = dwchild.GetItemString( li_found, "lookup_code" )
	ls_lookup_type = dwchild.GetItemString( li_found, "lookup_type" )
	ls_fld_type = dwchild.GetItemString( li_found, "field_type" )
	of_set_query_lookup(ls_lookup_type,ls_query_fld,ls_lookup_code,"query_value") //maha 042205
END IF
//address query field
i = tab_1.tabpage_design.dw_fld_prop.GetChild( "query_field_addr", dwchild )
dwchild.SetTransObject( SQLCA )
i = dwchild.Retrieve( 20 )

ls_query_fld = tab_1.tabpage_design.dw_fld_prop.GetItemString( 1, "query_field_addr" )
li_found = dwchild.Find( "field_name = '" + ls_query_fld + "'", 1, 10000 )
IF li_found > 0 THEN
	ls_lookup_code = dwchild.GetItemString( li_found, "lookup_code" )
	ls_lookup_type = dwchild.GetItemString( li_found, "lookup_type" )
	ls_fld_type = dwchild.GetItemString( li_found, "field_type" )
	of_set_query_lookup(ls_lookup_type,ls_query_fld,ls_lookup_code,"query_value_addr") //maha 042205
END IF
*/
datawindowchild dwc_addr

li_tbl_id = tab_1.tabpage_design.dw_fld_prop.GetItemNumber( 1, "table_id" )
tab_1.tabpage_design.dw_fld_prop.GetChild( "query_field", dwchild )
dwchild.SetTransObject( SQLCA )
tab_1.tabpage_design.dw_fld_prop.GetChild( "query_field_addr", dwc_addr )
dwc_addr.SetTransObject( SQLCA )

gnv_appeondb.of_StartQueue()
tab_1.tabpage_design.dw_fld_prop.Update()
dwchild.Retrieve( li_tbl_id )
dwc_addr.Retrieve( 20 )
gnv_appeondb.of_CommitQueue()

//query field
ls_query_fld = tab_1.tabpage_design.dw_fld_prop.GetItemString( 1, "query_field" )
li_found = dwchild.Find( "field_name = '" + ls_query_fld + "'", 1, 10000 )
IF li_found > 0 THEN
	ls_lookup_code = dwchild.GetItemString( li_found, "lookup_code" )
	ls_lookup_type = dwchild.GetItemString( li_found, "lookup_type" )
	ls_fld_type = dwchild.GetItemString( li_found, "field_type" )
	of_set_query_lookup(ls_lookup_type,ls_query_fld,ls_lookup_code,"query_value") //maha 042205
END IF

//address query field
ls_query_fld = tab_1.tabpage_design.dw_fld_prop.GetItemString( 1, "query_field_addr" )
li_found = dwc_addr.Find( "field_name = '" + ls_query_fld + "'", 1, 10000 )
IF li_found > 0 THEN
	ls_lookup_code = dwc_addr.GetItemString( li_found, "lookup_code" )
	ls_lookup_type = dwc_addr.GetItemString( li_found, "lookup_type" )
	ls_fld_type = dwc_addr.GetItemString( li_found, "field_type" )
	of_set_query_lookup(ls_lookup_type,ls_query_fld,ls_lookup_code,"query_value_addr") //maha 042205
END IF
//---------------------------- APPEON END ----------------------------

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> UM-04
//$<Modify> 02.23.2006 By: Liang QingShi
//$<reason> VerticalScrollPosition is currently unsupported.
//$<modification> Comment out the following script.

//set position of datawindow object
/*IF li_last_fld_prop_tab = 1 THEN	
	tab_1.tabpage_design.dw_fld_prop.Object.DataWindow.VerticalScrollPosition='0'
ELSEIF li_last_fld_prop_tab = 2 THEN
	tab_1.tabpage_design.dw_fld_prop.Object.DataWindow.VerticalScrollPosition='580'
ELSEIF li_last_fld_prop_tab = 3 THEN
	tab_1.tabpage_design.dw_fld_prop.Object.DataWindow.VerticalScrollPosition='1340'
ELSEIF li_last_fld_prop_tab = 4 THEN	
	tab_1.tabpage_design.dw_fld_prop.Object.DataWindow.VerticalScrollPosition='2000'
END IF
*/
IF li_last_fld_prop_tab = 2 THEN
	long ll_table_id
	if tab_1.tabpage_design.dw_fld_prop.rowcount() > 0 then
		ll_table_id = tab_1.tabpage_design.dw_fld_prop.getitemnumber(tab_1.tabpage_design.dw_fld_prop.getrow(),'table_id')
	end if
	if ll_table_id = 20 then
		tab_1.tabpage_design.dw_fld_prop.Modify( "b_poq.visible = 1")
		tab_1.tabpage_design.dw_fld_prop.Modify( "b_aoq.visible = 1")
		tab_1.tabpage_design.dw_fld_prop.Modify( "b_haq.visible = 1")
	else
		tab_1.tabpage_design.dw_fld_prop.Modify( "b_poq.visible = 0")
		tab_1.tabpage_design.dw_fld_prop.Modify( "b_aoq.visible = 0")
		tab_1.tabpage_design.dw_fld_prop.Modify( "b_haq.visible = 0")		
	end if		
end if
//---------------------------- APPEON END ----------------------------
	
//SetRedraw( True )	//avoiding screen blinks on web application
	
tab_1.tabpage_design.dw_fld_prop.BringToTop = True	
	
Return 0
end function

public function long of_align (string as_align_type);Long li_selected_cnt
Long li_rc
Long i
Long li_font_size
Long li_field_len
Long li_dummy[]
Long li_prev_scrollY
Long li_prev_scrollX
//Start Code Change ---- 01.31.2006 #227 maha
long li_newx //maha 120605
long li_newy //maha 120605
long li_sx //maha 120605
long li_sy //maha 120605
String ls_object_type 
String ls_stamp_text
String ls_font_name
String ls_field_type
String ls_lookup_link_type
String ls_lookup_link_field
String ls_fld_display
String ls_dummy[]
String ls_special_field

if of_check_for_image() = -1 then return -1//maha 031505

//This.SetRedraw( False )  //avoiding screen blinks on web application

li_selected_cnt = UpperBound( is_selected_fields )

li_prev_scrollY = tab_1.tabpage_design.ole_edit.object.ScrollPositionY( )
li_prev_scrollX = tab_1.tabpage_design.ole_edit.object.ScrollPositionX( )
//Start Code Change ---- 05.04.2006 #438 maha
//tab_1.tabpage_design.ole_edit.object.ScrollImage(1,li_prev_scrollY)
//End Code Change---05.04.2006
FOR i = 1 TO li_selected_cnt
	ls_object_type = ""
	//MessageBox("ii_app_field_id",is_selected_fields[i])
	IF Upper(Right( is_selected_fields[i], 6 )) = "YESBOX" THEN
		ii_app_field_id = long( Mid( is_selected_fields[i], 1, Len( is_selected_fields[i] ) - 6) )
	ELSEIF Upper(Right( is_selected_fields[i], 5 )) = "NOBOX" THEN
		ii_app_field_id = long( Mid( is_selected_fields[i], 1, Len( is_selected_fields[i] ) - 5) )	
	ELSEIF Upper(Left( is_selected_fields[i], 3 )) = "SP-" THEN		
		ii_app_field_id = long( Mid( is_selected_fields[i], Pos( is_selected_fields[i], "," ) + 1, 100 ) )
	ELSEIF Upper(Right( is_selected_fields[i], 5 )) = "CHECK" THEN		
		ii_app_field_id = long( Mid( is_selected_fields[i], 1, Len( is_selected_fields[i] ) - 5) )	
		ls_object_type = "Check"
	ELSEIF Upper(Left( is_selected_fields[i], 5 )) = "LABEL" THEN	//maha for labels 091404
		integer lp = 1, nlp
		do while lp > 0 //find the location of the last ;
			lp = pos(is_selected_fields[i],";",lp + 1)
			if lp > 0 then nlp = lp
		loop
		ii_app_field_id = long( Mid( is_selected_fields[i], nlp + 1, Len( is_selected_fields[i] )) )	
		ls_object_type = "Label"
	ELSE
		ii_app_field_id = long( is_selected_fields[i] )
	END IF	

	//tab_1.tabpage_design.dw_fld_prop.SetTransObject( tr_training_data )
//MessageBox("ii_app_field_id",ii_app_field_id)
	li_rc = tab_1.tabpage_design.dw_fld_prop.Retrieve( ii_app_field_id )
	
	IF li_rc = 0 THEN
		MessageBox("Align", "Error during alignment, please retry." )
		This.SetRedraw( True )
		Return -1
	END IF

	//Handle special fields
	IF Upper(Left( is_selected_fields[i], 3 )) = "SP-" THEN		
		ls_special_field = tab_1.tabpage_design.dw_fld_prop.GetItemString( 1, "field_description" )		
		IF Pos( ls_special_field, "Todays Date" ) > 0 THEN
			ls_fld_display = "MM/DD/YYYY"
		ELSEIF Pos( ls_special_field, "Current Time" ) > 0 THEN			
			ls_fld_display = "HH:MMa"
		ELSEIF Pos( ls_special_field, "User Id" ) > 0 THEN			
			ls_fld_display = "XXXXXXXXXX"
		END IF	
	END IF
	//debugbreak()
	if ls_object_type <> "Label" then //maha label trap 091404
		ls_object_type = tab_1.tabpage_design.dw_fld_prop.GetItemString( 1, "object_type" )
	end if
	if ls_object_type <> "Label" then //maha label trap 091404
		ls_field_type = tab_1.tabpage_design.dw_fld_prop.GetItemString( 1, "sys_fields_field_type" )	
	else
		ls_field_type = ls_object_type
	end if
	ls_lookup_link_type = tab_1.tabpage_design.dw_fld_prop.GetItemString( 1, "lookup_link_type" )
	ls_lookup_link_field = tab_1.tabpage_design.dw_fld_prop.GetItemString( 1, "lookup_link_field" )
	li_field_len = tab_1.tabpage_design.dw_fld_prop.GetItemNumber( 1, "width" )	
	IF ls_lookup_link_type = "A" OR ls_lookup_link_type = "C" THEN
		ls_field_type = "C"
		IF ls_lookup_link_type = "A" THEN
			w_train_app.tab_1.tabpage_design.st_field.Text = w_train_app.tab_1.tabpage_design.st_field.Text + "->address_lookup->" + ls_lookup_link_field
		ELSE
			w_train_app.tab_1.tabpage_design.st_field.Text = w_train_app.tab_1.tabpage_design.st_field.Text + "->code_lookup->" + ls_lookup_link_field				
		END IF
	END IF

	CHOOSE CASE Upper( ls_field_type )
		CASE "C"
			IF ls_object_type = "C" THEN
				ls_fld_display = Fill( "X", 1 )
			ELSE
				ls_fld_display = Fill( "x", li_field_len )
			END IF
		CASE "I"
			ls_fld_display = Fill( "#", li_field_len )				
		CASE "D"
			ls_fld_display = "mm/dd/yyyy"
		CASE "N"
			ls_fld_display = Fill( "#", li_field_len )
		CASE "LABEL" //maha091404
			integer li
			li = 	len(is_selected_fields[i]) - 6 - len(mid(is_selected_fields[i],nlp)) //get the length of just the text
			ls_fld_display = Mid( is_selected_fields[i],7,li )
	END CHOOSE

	
	tab_1.tabpage_design.ole_edit.Object.DeleteAnnotationGroup( is_selected_fields[i] )
	tab_1.tabpage_design.ole_edit.Object.AddAnnotationGroup( is_selected_fields[i] )
	tab_1.tabpage_design.ole_edit.object.AnnotationStampText( ls_fld_display )
	tab_1.tabpage_design.ole_edit.object.AnnotationFontColor(255)
	CHOOSE CASE tab_1.tabpage_design.dw_fld_prop.GetItemNumber( 1, "font_size" )
		CASE 1
			tab_1.tabpage_design.ole_edit.object.AnnotationFont.Name = "MS Serif"
			tab_1.tabpage_design.ole_edit.object.AnnotationFont.Size = 7
		CASE 2
			tab_1.tabpage_design.ole_edit.object.AnnotationFont.Name = "Times New Roman"
			tab_1.tabpage_design.ole_edit.object.AnnotationFont.Size = 8				
		CASE 3
			tab_1.tabpage_design.ole_edit.object.AnnotationFont.Name = "Times New Roman"
			tab_1.tabpage_design.ole_edit.object.AnnotationFont.Size = 12
	END CHOOSE
	IF tab_1.tabpage_design.dw_fld_prop.GetItemNumber( 1, "font_bold" ) = 1 THEN
		tab_1.tabpage_design.ole_edit.object.AnnotationFont.Bold = True
	ELSE
		tab_1.tabpage_design.ole_edit.object.AnnotationFont.Bold = False
	END IF	
	tab_1.tabpage_design.ole_edit.object.Annotationtype(8)
	//maha 120605
	li_sx = tab_1.tabpage_design.ole_edit.object.ScrollPositionx()
	li_sy = tab_1.tabpage_design.ole_edit.object.ScrollPositionY()
	//messagebox(string(i),string(ii_y[i]))
	li_newy = ii_y[i] - li_sy
	li_newx = ii_x[i] - li_sx
	//messagebox(string(i),string(li_newy))
	IF as_align_type = "Top" THEN
		tab_1.tabpage_design.ole_edit.object.ScrollPositionX( 0 )		
		//tab_1.tabpage_design.ole_edit.object.Draw( ii_x[i], ii_ancor_y,  0, 0)
		tab_1.tabpage_design.ole_edit.object.Draw( li_newx, ii_ancor_y,  0, 0)
	ELSE
		tab_1.tabpage_design.ole_edit.object.ScrollPositionY( 0 )
		//tab_1.tabpage_design.ole_edit.object.Draw( ii_ancor_x, ii_y[i],  0, 0)
		tab_1.tabpage_design.ole_edit.object.Draw( ii_ancor_x, li_newy,  0, 0)
	END IF

//End Code Change---01.31.2006
	tab_1.tabpage_design.ole_edit.object.Annotationtype(11)		
END FOR

//ii_align = 0
ii_ancor_count = 0
is_selected_fields = ls_dummy
ii_x = li_dummy
ii_y = li_dummy
tab_1.tabpage_design.ole_edit.Object.SelectAnnotationGroup( "" )	
//tab_1.tabpage_design.cbx_align.Enabled = False

tab_1.tabpage_design.ole_edit.object.ScrollPositionY( li_prev_ScrollY )
tab_1.tabpage_design.ole_edit.object.ScrollPositionX( li_prev_ScrollX )
//Start Code Change ---- 05.04.2006 #438 maha
//tab_1.tabpage_design.ole_edit.object.ScrollImage(0,li_prev_scrollY)
//End Code Change---05.04.2006
//This.SetRedraw( True )  // avoiding screen blinks on web application

of_setup_align( )

w_mdi.SetToolbar( 4, False, Floating!)		
w_mdi.SetToolbarPos( 4, 75, 400, 100, 1)

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> UM-05
//$<add> 01.13.2006 By: Rodger Wu
//$<reason> The SetToolbarPos function is currently unsupported. 
//$<modification> Replace the SetToolBarPos function with the Appeon defined function of_settoolbarpos to provide
//$<modification> the same functionality.

If appeongetclienttype() <> 'PB' Then
	long ll_handle
	ll_handle = handle(w_mdi)
	gnv_appeondll.of_SetToolbar( ll_handle , 4, False )		
	gnv_appeondll.of_settoolbarpos(ll_handle)
End If
//---------------------------- APPEON END ----------------------------

Return 0
end function

public function long of_copy_fields ();Long li_null
Long li_next_id
Long li_new_page
Long li_rec_no
Long li_selected_cnt
long li_last_app_field_id  //modified 071802 maha
Long i
Long li_x
Long li_y
Long li_font_size
Long li_field_len
Long li_dummy[]
Long li_prev_scrollY
Long li_prev_scrollX
Long li_first_fld_x
Long li_first_fld_y
Long li_new_x
Long li_new_y
String ls_object_type
String ls_copy_type
String ls_stamp_text
String ls_font_name
String ls_field_type
String ls_lookup_link_type
String ls_lookup_link_field
String ls_fld_display
String ls_dummy[]


//This.SetRedraw( False )	  //avoiding screen blinks on web application

SetNull( li_null )

w_train_app.of_disable_buttons()
//w_select_fields.Visible = False

ii_copy_fields = 0
ii_align = 0

li_selected_cnt = UpperBound( is_selected_fields )  // I made it -1 because it made it work but not sure why???

li_prev_scrollY = tab_1.tabpage_design.ole_edit.object.ScrollPositionY( )
li_prev_scrollX = tab_1.tabpage_design.ole_edit.object.ScrollPositionX( )

//SELECT Max( connect_field_id )  
//INTO :li_next_id  
//FROM app_field_prop 
//WHERE app_id = :ii_app_id;
//
//li_next_id++
//This.SetRedraw( False )
//messagebox("", li_selected_cnt )

if gi_test_mode = 1 then
	messagebox("Field count",li_selected_cnt)
end if

FOR i = 1 TO li_selected_cnt
	//Start Code Change ---- 06.05.2006 #512 maha  //replaced with function
	ii_app_field_id = of_get_app_field_id(is_selected_fields[i])
	
//	IF Upper(Right( is_selected_fields[i], 6 )) = "YESBOX" THEN
//		ii_app_field_id = long( Mid( is_selected_fields[i], 1, Len( is_selected_fields[i] ) - 6) )
//	ELSEIF Upper(Right( is_selected_fields[i], 5 )) = "NOBOX" THEN
//		ii_app_field_id = long( Mid( is_selected_fields[i], 1, Len( is_selected_fields[i] ) - 5) )	
//	ELSEIF Upper(Left( is_selected_fields[i], 3 )) = "SP-" THEN		
//		ii_app_field_id = long( Mid( is_selected_fields[i], Pos( is_selected_fields[i], "," ) + 1, 100 ) )
//	ELSEIF Upper(Right( is_selected_fields[i], 5 )) = "CHECK" THEN		
//		ii_app_field_id = long( Mid( is_selected_fields[i], 1, Len( is_selected_fields[i] ) - 5) )	
//	ELSE
//		ii_app_field_id = long( is_selected_fields[i] )
//	END IF
	//End Code Change---06.05.2006


	//tab_1.tabpage_design.dw_fld_prop.DataObject = ""
	//tab_1.tabpage_design.dw_fld_prop.DataObject = is_select_field_dw
	//tab_1.tabpage_design.dw_fld_prop.SetTransObject( tr_training_data )	
	tab_1.tabpage_design.dw_fld_prop.Retrieve( ii_app_field_id )

	IF i = 1 THEN
		li_rec_no = tab_1.tabpage_design.dw_fld_prop.GetItemNumber( 1, "record_number" )		
		li_rec_no++

		OpenWithParm( w_get_query_data, String( ii_app_field_id ) )
		//Start Code Change ---- 05.24.2006 #481 maha
		if message.stringparm = "Cancel" then return 0
		//End Code Change---05.24.2006
		//li_rec_no = Long( Message.StringParm )
		IF li_selected_cnt > 1 THEN
			IF (ii_y[2] > ii_y[1] + 10) OR (ii_y[2] < ii_y[1] - 10) THEN
				ls_copy_type = "Vertical"
			ELSE
				ls_copy_type = "Horizontal"
			END IF
		END IF
		tab_1.tabpage_design.ole_edit.Object.SelectAnnotationGroup( "" )
		ib_click_position = True
		st_msg.Text = "Click the position on the image where you want to place copy of fields."
		st_msg.Visible = True
		tab_1.tabpage_design.ole_edit.object.AnnotationType( 0 )
		tab_1.tabpage_design.ole_edit.object.SelectionRectangle( True )		
		//This.SetRedraw( True )		//avoiding screen blinks on web application
		DO WHILE ib_click_position
			Yield()
		LOOP
		//This.SetRedraw( False )			//avoiding screen blinks on web application
		ib_click_position = False
		tab_1.tabpage_design.ole_edit.object.AnnotationType( 11 )
	END IF

	tab_1.tabpage_design.dw_fld_prop.RowsCopy( 1, 1, Primary!, tab_1.tabpage_design.dw_fld_prop, 100, Primary! )

	SELECT Max( app_field_id )  
	INTO :li_last_app_field_id  
	FROM app_field_prop  
	USING tr_training_data;		

	li_new_page = tab_1.tabpage_design.ole_edit.object.Page()

	li_last_app_field_id++
	
	tab_1.tabpage_design.dw_fld_prop.SetItem( 2, "app_field_id", li_last_app_field_id )
	tab_1.tabpage_design.dw_fld_prop.SetItem( 2, "page", li_new_page )
	tab_1.tabpage_design.dw_fld_prop.SetItem( 2, "record_number", ii_cf_record_number )	
//Start Code Change ---- 06.14.2006 #540 maha
	if ii_cf_skip_query = 0 then //do not set if set to record num only
		tab_1.tabpage_design.dw_fld_prop.SetItem( 2, "query_field", ii_cf_query_field )	
		tab_1.tabpage_design.dw_fld_prop.SetItem( 2, "query_operator", ii_cf_query_operator )	
		tab_1.tabpage_design.dw_fld_prop.SetItem( 2, "query_value", ii_cf_query_value )	
	end if
//End Code Change---06.14.2006
	tab_1.tabpage_design.dw_fld_prop.SetItem( 2, "past_years_query", ii_cf_past_years_query )
	tab_1.tabpage_design.dw_fld_prop.SetItem( 2, "connect_field_id", li_null )			
	tab_1.tabpage_design.dw_fld_prop.SetItem( 2, "connect_field_sort", li_null )				
	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> PT-05
	//$<modify> 04.04.2006 By: Rodger Wu
	//$<reason> Performance Tuning
	//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

	/*
	tab_1.tabpage_design.dw_fld_prop.Update()
	ii_app_field_id = li_last_app_field_id  
	//tab_1.tabpage_design.dw_fld_prop.DataObject = ""
	//tab_1.tabpage_design.dw_fld_prop.DataObject = is_select_field_dw
	//tab_1.tabpage_design.dw_fld_prop.SetTransObject( tr_training_data )		
	tab_1.tabpage_design.dw_fld_prop.Retrieve( ii_app_field_id )	
	*/
	ii_app_field_id = li_last_app_field_id
	gnv_appeondb.of_StartQueue()
	tab_1.tabpage_design.dw_fld_prop.Update()
	tab_1.tabpage_design.dw_fld_prop.Retrieve( li_last_app_field_id )
	gnv_appeondb.of_CommitQueue()
	//---------------------------- APPEON END ----------------------------

	IF tab_1.tabpage_design.dw_fld_prop.RowCount( ) = 0 THEN
		MessageBox("Copy Error", "Error Copying field " + String( ii_app_field_id ) )
		Continue
	END IF
	ls_field_type = tab_1.tabpage_design.dw_fld_prop.GetItemString( 1, "sys_fields_field_type" )
	ls_object_type = tab_1.tabpage_design.dw_fld_prop.GetItemString( 1, "object_type" )
	li_x = tab_1.tabpage_design.dw_fld_prop.GetItemNumber( 1, "x_pos" )
	li_y = tab_1.tabpage_design.dw_fld_prop.GetItemNumber( 1, "y_pos" )
	IF i = 1 THEN
		li_first_fld_x = li_x
		li_first_fld_Y = li_y
	END IF
	ls_lookup_link_type = tab_1.tabpage_design.dw_fld_prop.GetItemString( 1, "lookup_link_type" )
	ls_lookup_link_field = tab_1.tabpage_design.dw_fld_prop.GetItemString( 1, "lookup_link_field" )
	li_field_len = tab_1.tabpage_design.dw_fld_prop.GetItemNumber( 1, "width" )	
	IF ls_lookup_link_type = "A" OR ls_lookup_link_type = "C" THEN
		ls_field_type = "C"
		IF ls_lookup_link_type = "A" THEN
			w_train_app.tab_1.tabpage_design.st_field.Text = w_train_app.tab_1.tabpage_design.st_field.Text + "->address_lookup->" + ls_lookup_link_field
		ELSE
			w_train_app.tab_1.tabpage_design.st_field.Text = w_train_app.tab_1.tabpage_design.st_field.Text + "->code_lookup->" + ls_lookup_link_field				
		END IF
	END IF


	tab_1.tabpage_design.ole_edit.object.ScrollPositionX( 0 )		
	tab_1.tabpage_design.ole_edit.object.ScrollPositionY( 0 )			



	
//Start Code Change ---- 12.05.2005 #161 maha	
	li_new_x = li_x + (ii_copy_ancor_x - li_first_fld_x ) 
	li_new_x = li_new_x - tab_1.tabpage_design.ole_edit.object.ScrollPositionX( )
	
	li_new_y = li_y + (ii_copy_ancor_y - li_first_fld_y ) 
	li_new_y = li_new_y - tab_1.tabpage_design.ole_edit.object.ScrollPositiony( )
//End Code Change---12.05.2005

//	tab_1.tabpage_design.ole_edit.object.Draw( li_new_x, li_new_y,  0, 0)

	
	
CHOOSE CASE ls_object_type
	CASE "T"
		//ii_app_field_id = ii_app_field_id
		//ls_field_type = dw_fld_prop.GetItemString( 1, "sys_fields_field_type" )
		//ls_lookup_link_type = dw_fld_prop.GetItemString( 1, "lookup_link_type" )
		//ls_lookup_link_field = dw_fld_prop.GetItemString( 1, "lookup_link_field" )
		IF ls_lookup_link_type = "A" OR ls_lookup_link_type = "C" THEN
			ls_field_type = "C"
			IF ls_lookup_link_type = "A" THEN
				w_train_app.tab_1.tabpage_design.st_field.Text = w_train_app.tab_1.tabpage_design.st_field.Text + "->address_lookup->" + ls_lookup_link_field 
			ELSE
				w_train_app.tab_1.tabpage_design.st_field.Text = w_train_app.tab_1.tabpage_design.st_field.Text + "->code_lookup->" + ls_lookup_link_field		
			END IF
		END IF
		CHOOSE CASE Upper( ls_field_type )
			CASE "C"
				ls_fld_display = Fill( "x", li_field_len )
			CASE "I"
				ls_fld_display = Fill( "#", li_field_len )				
			CASE "D"
				ls_fld_display = "mm/dd/yyyy"
			CASE "N"
				ls_fld_display = Fill( "#", li_field_len )								
		END CHOOSE
		tab_1.tabpage_design.ole_edit.Object.AddAnnotationGroup( String(ii_app_field_id) )
		tab_1.tabpage_design.ole_edit.object.AnnotationStampText( ls_fld_display )
		tab_1.tabpage_design.ole_edit.object.AnnotationFontColor(255)
		tab_1.tabpage_design.ole_edit.object.Annotationtype(8)		
		CHOOSE CASE tab_1.tabpage_design.dw_fld_prop.GetItemNumber( 1, "font_size" )
			CASE 1
				tab_1.tabpage_design.ole_edit.object.AnnotationFont.Name = "MS Serif"
				tab_1.tabpage_design.ole_edit.object.AnnotationFont.Size = 7
				IF w_train_app.ib_moving_field OR Not ib_new_select THEN
					w_train_app.ii_ancor_y = w_train_app.ii_ancor_y
				ELSE
					w_train_app.ii_ancor_y = w_train_app.ii_ancor_y - 5				
				END IF
			CASE 2
				tab_1.tabpage_design.ole_edit.object.AnnotationFont.Name = "Times New Roman"
				tab_1.tabpage_design.ole_edit.object.AnnotationFont.Size = 8				
				IF w_train_app.ib_moving_field OR Not ib_new_select THEN
					w_train_app.ii_ancor_y = w_train_app.ii_ancor_y
				ELSE
					w_train_app.ii_ancor_y = w_train_app.ii_ancor_y - 8
				END IF
			CASE 3
				tab_1.tabpage_design.ole_edit.object.AnnotationFont.Name = "Times New Roman"
				tab_1.tabpage_design.ole_edit.object.AnnotationFont.Size = 12		
				IF w_train_app.ib_moving_field OR Not ib_new_select THEN
					w_train_app.ii_ancor_y = w_train_app.ii_ancor_y
				ELSE
					w_train_app.ii_ancor_y = w_train_app.ii_ancor_y - 10
				END IF
		END CHOOSE
		IF tab_1.tabpage_design.dw_fld_prop.GetItemNumber( 1, "font_bold" ) = 1 THEN
				tab_1.tabpage_design.ole_edit.object.AnnotationFont.Bold = True
		ELSE
				tab_1.tabpage_design.ole_edit.object.AnnotationFont.Bold = False
		END IF
		tab_1.tabpage_design.ole_edit.object.Draw(li_new_x, li_new_y, 0, 0)
		tab_1.tabpage_design.ole_edit.object.Annotationtype(11)	
	CASE "B"
		tab_1.tabpage_design.ole_edit.Object.AddAnnotationGroup( tab_1.tabpage_design.dw_fld_prop.GetItemNumber( tab_1.tabpage_design.dw_fld_prop.GetRow(), "field_id" ) )
		tab_1.tabpage_design.ole_edit.object.Annotationtype(3)
		tab_1.tabpage_design.ole_edit.object.Draw(li_new_x, li_new_y, 20,20)
		tab_1.tabpage_design.ole_edit.object.Annotationtype(11)			
	CASE "Y1"
		//yes box
		tab_1.tabpage_design.ole_edit.Object.AddAnnotationGroup( String(ii_app_field_id) + "YesBox")
		tab_1.tabpage_design.ole_edit.object.Annotationtype(3)
		tab_1.tabpage_design.ole_edit.object.AnnotationLineColor( 255 )		
		tab_1.tabpage_design.ole_edit.object.Draw(li_new_x, li_new_y, 20,20)
		

		//no
		tab_1.tabpage_design.ole_edit.Object.AddAnnotationGroup( String(ii_app_field_id) + "NoBox")
		tab_1.tabpage_design.ole_edit.object.AnnotationLineColor( 0 )
		tab_1.tabpage_design.ole_edit.object.Draw(li_new_x + 30, li_new_y, 20,20)		
		tab_1.tabpage_design.ole_edit.object.Annotationtype(11)					
	CASE "Y2"
		//yes box
		tab_1.tabpage_design.ole_edit.Object.AddAnnotationGroup( String(ii_app_field_id) + "YesCheck")
		tab_1.tabpage_design.ole_edit.object.AnnotationStampText( "X" )
		tab_1.tabpage_design.ole_edit.object.Annotationtype(8)
		tab_1.tabpage_design.ole_edit.object.Draw(li_new_x, li_new_y, 10,10)		
		tab_1.tabpage_design.ole_edit.object.Annotationtype(11)							
	CASE "C"		
		tab_1.tabpage_design.ole_edit.Object.AddAnnotationGroup( String( ii_app_field_id ) + "Check" )
		tab_1.tabpage_design.ole_edit.object.AnnotationStampText( "X" )
		tab_1.tabpage_design.ole_edit.object.Annotationtype(8)
		CHOOSE CASE tab_1.tabpage_design.dw_fld_prop.GetItemNumber( 1, "font_size" )
			CASE 1
				tab_1.tabpage_design.ole_edit.object.AnnotationFont.Name = "MS Serif"
				tab_1.tabpage_design.ole_edit.object.AnnotationFont.Size = 7
				IF w_train_app.ib_moving_field OR Not ib_new_select THEN
					w_train_app.ii_ancor_y = w_train_app.ii_ancor_y
				ELSE
					w_train_app.ii_ancor_y = w_train_app.ii_ancor_y - 5				
				END IF
			CASE 2
				tab_1.tabpage_design.ole_edit.object.AnnotationFont.Name = "Times New Roman"
				tab_1.tabpage_design.ole_edit.object.AnnotationFont.Size = 8			
				IF w_train_app.ib_moving_field OR Not ib_new_select THEN
					w_train_app.ii_ancor_y = w_train_app.ii_ancor_y
				ELSE
					w_train_app.ii_ancor_y = w_train_app.ii_ancor_y - 8	
				END IF
			CASE 3
				tab_1.tabpage_design.ole_edit.object.AnnotationFont.Name = "Times New Roman"
				tab_1.tabpage_design.ole_edit.object.AnnotationFont.Size = 12
				IF w_train_app.ib_moving_field OR Not ib_new_select THEN
					w_train_app.ii_ancor_y = w_train_app.ii_ancor_y
				ELSE
					w_train_app.ii_ancor_y = w_train_app.ii_ancor_y - 10
				END IF
		END CHOOSE
		tab_1.tabpage_design.ole_edit.object.Draw(li_new_x, li_new_y, 10,10)
		tab_1.tabpage_design.ole_edit.object.Annotationtype(11)	
END CHOOSE
	
	
	tab_1.tabpage_design.ole_edit.object.Annotationtype(11)		
END FOR

ii_cf_skip_query = 0 //reset the value //Start Code Change ---- 06.14.2006 #540 maha


tab_1.tabpage_design.ole_edit.Object.SelectAnnotationGroup( "" )	
tab_1.tabpage_design.ole_edit.object.ScrollPositionY( li_new_y )
tab_1.tabpage_design.ole_edit.object.ScrollPositionX( li_prev_ScrollX )

w_train_app.of_enable_buttons()
//w_select_fields.Visible = True

st_msg.Visible = False
ib_saved = False

//This.SetRedraw( True )	//avoiding screen blinks on web application

Return 0
end function

public function long of_add_objects (string ls_object, long ai_font, long ai_bold);String ls_type
String ls_text
Long li_app_id
Long ll_field_id
Long li_page

try

li_page = w_train_app.ii_current_page
li_app_id = w_train_app.ii_app_id

if of_check_for_image() = -1 then return -1//maha 031505

SELECT Max( app_field_id )  
INTO :ll_field_id  
FROM app_field_prop 
USING tr_training_data;
IF tr_training_data.SQLCODE = -1 THEN
	MessageBox("Database Error", tr_training_data.SQLERRTEXT )
END IF
ll_field_id++

CHOOSE CASE Upper( ls_object )
	CASE "TODAYS DATE"
		ls_type = "Todays Date"
		tab_1.tabpage_design.ole_edit.Object.AddAnnotationGroup( "SP-TODAYSDATE," + String( ll_field_id ) )		
		tab_1.tabpage_design.ole_edit.Object.AnnotationStampText( "MM/DD/YYYY" )		
	CASE "CURRENT TIME"
		ls_type = "Current Time"		
		tab_1.tabpage_design.ole_edit.Object.AddAnnotationGroup( "SP-CURRENTTIME," + String( ll_field_id ))				
		tab_1.tabpage_design.ole_edit.Object.AnnotationStampText( "HH:MMa" )		
	CASE "USER ID"
		ls_type = "User Id"
		tab_1.tabpage_design.ole_edit.Object.AddAnnotationGroup( "SP-USERID," + String( ll_field_id ))		
		tab_1.tabpage_design.ole_edit.Object.AnnotationStampText( "XXXXXXXXXX" )		
	CASE ELSE
		//debugbreak()
		ls_type = ls_object   //Upper( Mid( ls_object, 7, 100 ) )
		ls_text = Mid( ls_object, 7, 100 ) 
		tab_1.tabpage_design.ole_edit.Object.AddAnnotationGroup( "LABEL-" + Mid( ls_text, 1, 5 ) + ";" + String( ll_field_id ))	//maha changed from 20 031405	
		tab_1.tabpage_design.ole_edit.Object.AnnotationStampText( ls_text  )
END CHOOSE

	  INSERT INTO app_field_prop  
         ( app_field_id,   
           app_id,   
           table_id,   
           field_id,   
           lookup_link_type,   
           lookup_link_field,   
           record_number,   
           x_pos,   
           y_pos,   
           width,   
           query_field,   
           query_value,   
           page,   
           box_type,   
           box_height,   
           box_width,   
           box_yes_x,   
           box_yes_y,   
           box_yes_value,   
           box_no_x,   
           box_no_y,   
           box_no_value,   
           font_type,   
           font_size,   
           font_color,   
           font_background,   
           font_underline,   
           font_bold,   
           query_operator,   
           field_description,   
           personal_data,   
           height,   
           annotation_width,   
           past_years_query,   
           format,   
           connect_field_id,   
           connect_field_sort )  
  VALUES ( :ll_field_id,   
           :li_app_id,   
           99,   
           0,   
           null,   
           null,   
           null,   
           0,   
           0,   
           null,   
           null,   
           null,   
           :li_page,   
           null,   
           null,   
           null,   
           null,   
           null,   
           null,   
           null,   
           null,   
           null,   
			  null,
           :ai_font,   
           null,   
           null,   
           null,   
           :ai_bold,   
           null,   
           :ls_type,   
           'N',   
           null,   
           null,   
           null,   
           null,   
           null,   
           null )
		 USING tr_training_data;
		IF tr_training_data.SQLCODE = -1 THEN
			MessageBox("Database Error", tr_training_data.SQLERRTEXT )
		END IF

tab_1.tabpage_design.ole_edit.Object.AnnotationFontColor(255)
tab_1.tabpage_design.ole_edit.Object.Annotationtype(8)		
CHOOSE CASE ai_font
	CASE 1
		tab_1.tabpage_design.ole_edit.Object.AnnotationFont.Name = "MS Serif"
		tab_1.tabpage_design.ole_edit.Object.AnnotationFont.Size = 7
	CASE 2
		tab_1.tabpage_design.ole_edit.Object.AnnotationFont.Name = "Times New Roman"
		tab_1.tabpage_design.ole_edit.Object.AnnotationFont.Size = 8				
	CASE 3
		tab_1.tabpage_design.ole_edit.Object.AnnotationFont.Name = "Times New Roman"
		tab_1.tabpage_design.ole_edit.Object.AnnotationFont.Size = 12
END CHOOSE
IF ai_bold = 1 THEN
	tab_1.tabpage_design.ole_edit.Object.AnnotationFont.Bold = True
ELSE
	tab_1.tabpage_design.ole_edit.Object.AnnotationFont.Bold = False
END IF

tab_1.tabpage_design.ole_edit.Object.Draw( 0, 0, 0, 0 )
tab_1.tabpage_design.ole_edit.Object.Annotationtype(11)	

catch (runtimeerror ret)
	
end try
Return 1
end function

public function long of_load_image ();Long li_page_cnt

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 06.08.2006 By: LeiWei
//$<reason> Download image file from Database.
n_appeon_storage_area lnv_storage_area
lnv_storage_area.of_retrieve_image_from_db( ii_app_id, is_app_path + String( ii_app_id ) + ".tif" )
//---------------------------- APPEON END ----------------------------
	
tab_1.tabpage_design.ole_edit.Object.Image( is_app_path + String( ii_app_id ) + ".tif" )
tab_1.tabpage_design.ole_edit.Object.Page(1)
tab_1.tabpage_design.ole_edit.Object.FitTo(3)
tab_1.tabpage_design.ole_edit.Object.Annotationtype(11)	
//Start Code Change ---- 11.10.2005 #84 maha
tab_1.tabpage_design.ole_edit.Object.DisplayScaleAlgorithm = 4
//End Code Change---11.10.2005 

//Start Code Change ---- 05.05.2005 #437 maha
try
tab_1.tabpage_design.ole_edit.Object.Display()
catch (runtimeerror a)
end try
//End Code Change---05.05.2005
tab_1.tabpage_design.ole_edit.Object.ImageResolutionx( 300 )
tab_1.tabpage_design.ole_edit.Object.ImageResolutionY( 300 )
ii_current_page = 1

of_delete_annotations()
of_load_annotations()

li_page_cnt = tab_1.tabpage_design.ole_edit.Object.PageCount()
ii_page_count = li_page_cnt
IF li_page_cnt = 1 THEN
	gnv_app.of_modify_menu_attr( m_pfe_train_app.m_view.m_nextpage,'enabled', False)
END IF
gnv_app.of_modify_menu_attr( m_pfe_train_app.m_view.m_priorpage,'enabled', False)
st_page_num.Text =  "Page 1 Of " +  String(li_page_cnt)
	
tab_1.tabpage_design.uo_preview.of_load_app()
tab_1.tabpage_design.uo_preview.ole_edit.Object.HideAnnotationGroup()

	
Return 1
end function

public function long of_delete_annotations ();//Long li_Cnt
//li_cnt = tab_1.tabpage_design.ole_edit.Object.AnnotationGroupCount()
////
//IF li_cnt = 0 THEN
//	Return  0
//END IF
////
////tab_1.tabpage_design.ole_edit.object.SaveAnnotations( is_app_path + String( ii_app_id ) + "-" +String( ii_current_page ) + ".ano",ii_current_page ,ii_current_page , 1 )
////
////tab_1.tabpage_design.ole_edit.object.SaveAnnotations( is_app_path + String( ii_app_id ) + ".ano",ii_current_page ,ii_current_page , 1 )
//
//Long i
//String ls_annotation_group
////Long li_cnt
////
//IF tab_1.tabpage_design.ole_edit.Object.Image = "" THEN
//	Return 0
//END IF
////
////IF tab_1.tabpage_design.p_rec_num.BorderStyle = StyleLowered! THEN
////	tab_1.tabpage_design.p_rec_num.BorderStyle = StyleRaised!
////	of_delete_records()
////END IF
////
////This.SetRedraw( False )
////
//tab_1.tabpage_design.ole_edit.Object.SelectAnnotationGroup( "" )	
////
//li_cnt = tab_1.tabpage_design.ole_edit.Object.AnnotationGroupCount()
////
//FOR i = 0 TO li_cnt -1
//	ls_annotation_group = tab_1.tabpage_design.ole_edit.Object.GetAnnotationGroup( 0 )
//	tab_1.tabpage_design.ole_edit.Object.DeleteAnnotationGroup( ls_annotation_group )		
//END FOR
////
////This.SetRedraw( True )
////
Return 0

end function

public function long of_load_annotations ();SetPointer( HourGlass! )

//IF FileExists( is_app_path + String( ii_app_id ) +  "-" + String( ii_current_page ) + ".ano" ) THEN
//	tab_1.tabpage_design.ole_edit.object.LoadAnnotations( is_app_path + String( ii_app_id ) + "-" + String( ii_current_page ) + ".ano",ii_current_page ,ii_current_page , 0 )
//ELSE
//	of_create_annotations( 0 )
//END IF
//debugbreak()

if of_check_for_image() = -1 then return -1//maha 031505

IF tab_1.tabpage_design.ole_edit.object.AnnotationGroupCount( ) = 0 THEN
	of_create_annotations( 0 )
END IF

RETURN 0


end function

public function Long of_disable_buttons ();//	w_train_app.tab_1.tabpage_design.cb_remove.Enabled = False
//	w_train_app.tab_1.tabpage_design.cb_straight.Enabled = False	
//	w_train_app.tab_1.tabpage_design.cb_notes.Enabled = False
//	w_train_app.tab_1.tabpage_design.cb_blank_page.Enabled = False
//	w_train_app.tab_1.tabpage_design.cb_fields.Enabled = False
//	w_train_app.tab_1.tabpage_design.cb_print.Enabled = False
//	w_train_app.tab_1.tabpage_design.cb_additional.Enabled = False
//	w_train_app.tab_1.tabpage_design.cb_exceptions.Enabled = False
//	w_train_app.tab_1.tabpage_design.cb_save_it.Enabled = False
//	w_train_app.tab_1.tabpage_design.p_select_field.Enabled = False
//	w_train_app.tab_1.tabpage_design.p_rope_select.Enabled = False
//	w_train_app.tab_1.tabpage_design.p_label.Enabled = False
//	w_train_app.tab_1.tabpage_design.p_box.Enabled = False
//	w_train_app.tab_1.tabpage_design.cbx_connect.Enabled = False
//	w_train_app.tab_1.tabpage_design.p_connect.Enabled = False
//	w_train_app.tab_1.tabpage_design.cbx_align.Enabled = False
//	w_train_app.tab_1.tabpage_design.p_field.Enabled = False
//	w_train_app.tab_1.tabpage_design.p_copy.Enabled = False	
//	
	
	Return 0
end function

public function Long of_enable_buttons ();//	w_train_app.tab_1.tabpage_design.cb_remove.Enabled = True
//	w_train_app.tab_1.tabpage_design.cb_straight.Enabled = True	
//	w_train_app.tab_1.tabpage_design.cb_notes.Enabled = True
//	w_train_app.tab_1.tabpage_design.cb_blank_page.Enabled = True
//	w_train_app.tab_1.tabpage_design.cb_fields.Enabled = True
//	w_train_app.tab_1.tabpage_design.cb_print.Enabled = True
//	w_train_app.tab_1.tabpage_design.cb_additional.Enabled = True
//	w_train_app.tab_1.tabpage_design.cb_exceptions.Enabled = True
//	w_train_app.tab_1.tabpage_design.cb_save_it.Enabled = True
//	w_train_app.tab_1.tabpage_design.p_select_field.Enabled = True
//	w_train_app.tab_1.tabpage_design.p_rope_select.Enabled = True
//	w_train_app.tab_1.tabpage_design.p_label.Enabled = True
//	w_train_app.tab_1.tabpage_design.p_box.Enabled = True
//	w_train_app.tab_1.tabpage_design.cbx_connect.Enabled = True
//	w_train_app.tab_1.tabpage_design.p_connect.Enabled = True
//	w_train_app.tab_1.tabpage_design.cbx_align.Enabled = True
//	w_train_app.tab_1.tabpage_design.p_field.Enabled = True	
//	w_train_app.tab_1.tabpage_design.p_copy.Enabled = True
	
	RETURN 0
end function

public function long of_show_record ();String ls_rec_num
Long li_x_pos
Long li_y_pos
Long li_rec_num
Long ll_scroll_pos_y


//This.SetRedraw( False )	//avoiding screen blinks on web application

ib_loading_annotations = True

DECLARE g_show_record_num CURSOR FOR  
SELECT app_field_prop.x_pos,   
       app_field_prop.y_pos,
		 app_field_prop.record_number
FROM app_field_prop  
WHERE ( app_field_prop.app_id = :ii_app_id ) AND  
      ( app_field_prop.page = :ii_current_page )   
USING tr_training_data;
		
OPEN g_show_record_num;

FETCH g_show_record_num INTO :li_x_pos, :li_y_pos, :li_rec_num;

ll_scroll_pos_y = tab_1.tabpage_design.ole_edit.Object.ScrollPositionY( )		

tab_1.tabpage_design.ole_edit.Object.ScrollPositionY( 1 )		

tab_1.tabpage_design.ole_edit.Object.AddAnnotationGroup( "rec_num" )		

IF IsNull( li_rec_num ) OR li_rec_num = 0 THEN
	CLOSE g_show_record_num;
	//This.SetRedraw( True )	//avoiding screen blinks on web application
	tab_1.tabpage_design.ole_edit.object.Annotationtype(11)		
	tab_1.tabpage_design.ole_edit.Object.SelectAnnotationGroup( "" )
	ib_loading_annotations = False
	RETURN -1
END IF

DO WHILE tr_training_data.SQLCODE = 0 
    li_y_pos = li_y_pos - 5 -  tab_1.tabpage_design.ole_edit.Object.ScrollPositionY()
    ls_rec_num = String( li_rec_num )
    tab_1.tabpage_design.ole_edit.Object.AnnotationStampText( ls_rec_num )		
    tab_1.tabpage_design.ole_edit.object.AnnotationFontColor(8404992)
    tab_1.tabpage_design.ole_edit.object.Annotationtype(8)		
    tab_1.tabpage_design.ole_edit.object.AnnotationFont.Name = "MS Serif"
    tab_1.tabpage_design.ole_edit.object.AnnotationFont.Bold = True
    tab_1.tabpage_design.ole_edit.object.Draw(li_x_pos, li_y_pos, 0, 0)		 
    FETCH g_show_record_num INTO :li_x_pos, :li_y_pos, :li_rec_num;	
LOOP

CLOSE g_show_record_num;

tab_1.tabpage_design.ole_edit.Object.ScrollPositionY( ll_scroll_pos_y )		
//This.SetRedraw( True )	//avoiding screen blinks on web application

tab_1.tabpage_design.ole_edit.object.Annotationtype(11)		
tab_1.tabpage_design.ole_edit.Object.SelectAnnotationGroup( "" )

ib_loading_annotations = False



Return 0
end function

public function long of_delete_records ();if of_check_for_image() = -1 then return -1//maha 031505

tab_1.tabpage_design.ole_edit.Object.DeleteAnnotationGroup( "rec_num" )		

Return 0
end function

public function Long of_save_load ();tab_1.tabpage_design.ole_edit.object.SaveAnnotations( is_app_path + String( ii_app_id ) + "-" + String( ii_current_page ) + ".ano",ii_current_page ,ii_current_page , 0 )
tab_1.tabpage_design.ole_edit.object.LoadAnnotations( is_app_path + String( ii_app_id ) + "-" + String( ii_current_page ) + ".ano",ii_current_page ,ii_current_page , 0 )

RETURN 0
end function

public function long of_auto_align ();

String ls_rec_num
String ls_dummy[]
Long li_x_pos
Long li_y_pos
Long li_rec_num
long li_field_id //modified 071802 maha
Long ll_top_mark
Long ll_bottom_mark
Long ll_y
Long ll_x
Long ll_height
long li_dummy[] //modified 071802 maha
Long li_scroll_position_y
Long li_scroll_position_x

if of_check_for_image() = -1 then return -1//maha 031505

ib_saved = False

li_scroll_position_y = w_train_app.tab_1.tabpage_design.ole_edit.Object.ScrollPositionY()
li_scroll_position_x = w_train_app.tab_1.tabpage_design.ole_edit.Object.ScrollPositionX()

ii_app_field_ids[] = li_dummy[]
is_selected_fields[] = ls_dummy[]

SELECT app_field_prop.y_pos  
INTO :ll_y  
FROM app_field_prop  
WHERE app_field_prop.app_field_id = :ii_app_field_id   ;

ii_ancor_y = ll_y - li_scroll_position_y


ll_top_mark = ll_y - 12
ll_bottom_mark = ll_y + 12

DECLARE g_show_record_num CURSOR FOR 
SELECT app_field_prop.app_field_id, app_field_prop.x_pos  , app_field_prop.y_pos , app_field_prop.height   
FROM app_field_prop  
WHERE ( app_field_prop.app_id = :ii_app_id ) AND  
      ( app_field_prop.page = :ii_current_page ) AND
	 ( app_field_prop.y_pos >= :ll_top_mark AND app_field_prop.y_pos <= :ll_bottom_mark ) AND
	 ( app_field_prop.app_field_id <> :ii_app_field_id ) 
ORDER BY ba.app_field_prop.x_pos
USING tr_training_data;
		
OPEN g_show_record_num;

FETCH g_show_record_num INTO :li_field_id, :ll_x, :ll_y, :ll_height;

ii_selected_fields_cnt = 0
DO WHILE tr_training_data.SQLCODE = 0 
	ii_selected_fields_cnt++
	is_selected_fields[ ii_selected_fields_cnt ] = String( li_field_id )
	ii_app_field_ids[ ii_selected_fields_cnt ] = li_field_id
	ii_x[ ii_selected_fields_cnt ] = ll_x  //- li_scroll_position_x
	ii_y[ii_selected_fields_cnt ] = ii_ancor_y  
	ii_height[ ii_selected_fields_cnt ] = ll_height	
	FETCH g_show_record_num INTO :li_field_id, :ll_x, :ll_y, :ll_height;
LOOP

CLOSE g_show_record_num;

of_align( "Top" )

st_align.Visible = False

ii_align = 0

RETURN 0
end function

public function long of_select_app ();Long 		li_page_cnt,li_cnt
String	ls_Rtn

IF tab_1.tabpage_select.tab_facility.tabpage_apps.dw_app_detail.RowCount() = 0 THEN
	MessageBox("Select", "No record to select." )
	Return -1
END IF

//\/maha these two lines moved to clicked event 091300
//ii_app_id = This.GetItemNumber( row, "app_id" )
//ii_facility_id = This.GetItemNumber( row, "facility_id" )
//\maha

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 2006-09-27 By: Rodger Wu
//$<reason> Fix a defect.
//$<reason> Store image into database before another application opens.


//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 05/28/2008 By: Ken.Guo
//$<reason> Fixed BugN050705.  
If ii_app_id  = 0 or isnull(ii_app_id) Then
	Return -1
End If
//---------------------------- APPEON END ----------------------------

//--------------------------- APPEON BEGIN ---------------------------
//$< Add  > 2008-09-23 By: Scofield
//$<Reason> Verify if the directory has write right for the current user.

if IsNull(is_app_path) or Trim(is_app_path) = "" then
	MessageBox(gnv_app.iapp_object.DisplayName,"The Application Storage/Download Location is empty, please go to the System->utility->Application Setting and fill in the Application Storage/Download Location field.",Exclamation!)
	Return -1
end if

ls_Rtn = f_ExaWriteRight(is_app_path)
if Len(ls_Rtn) > 0 then
	MessageBox(gnv_app.iapp_object.DisplayName,ls_Rtn,Exclamation!)
	Return -1
end if
//---------------------------- APPEON END ----------------------------

n_appeon_storage_area lnv_storage_area
Long ll_last_app_id	
ll_last_app_id = tab_1.tabpage_design.uo_preview.ii_app_id	
IF ll_last_app_id <> ii_app_id and ll_last_app_id > 0 THEN
	IF Not ib_saved or tab_1.tabpage_design.ole_edit.Object.ImageModified THEN
		of_delete_annotations()
		tab_1.tabpage_design.ole_edit.Object.Save()
		
		IF gnv_data.of_GetItem( "icred_settings", "image_storage_type", False ) = '1' or appeongetclienttype() = "WEB" THEN
			lnv_storage_area.of_upload_app_image( ll_last_app_id, is_app_path + String( ll_last_app_id ) + ".tif")
			ib_saved = TRUE
		END IF
	END IF
END IF
//---------------------------- APPEON END ----------------------------
tab_1.tabpage_design.uo_preview.of_set_app_id( ii_app_id )
tab_1.tabpage_design.uo_preview.of_set_facility_id( ii_facility_id )

//tab_1.tabpage_batch.uo_print.of_set_app_id( ii_app_id )
//tab_1.tabpage_batch.uo_print.of_set_facility_id( ii_facility_id )

This.Title = "IntelliApp   (" + tab_1.tabpage_select.tab_facility.tabpage_apps.dw_app_detail.GetItemString( +&
			tab_1.tabpage_select.tab_facility.tabpage_apps.dw_app_detail.GetRow(), "application_name" ) +  " )"

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 06.08.2006 By: LeiWei
//$<reason> Download image file from database.
IF gnv_data.of_GetItem( "icred_settings", "image_storage_type", False ) = '1' or appeongetclienttype() = "WEB" THEN
	lnv_storage_area.of_retrieve_image_from_db( ii_app_id, is_app_path + String( ii_app_id ) + ".tif" )
END IF

//---------------------------- APPEON END ----------------------------


IF FileExists( is_app_path + String( ii_app_id ) + ".tif" ) THEN
	of_delete_anno_files() //052203 maha to eliminate problems with existing ano files
	tab_1.tabpage_design.ole_edit.Object.Image = ""
	
	//--------------------------- APPEON BEGIN ---------------------------
	//$<add> 08.19.2006 By: LeiWei
	//$<reason> Fix a defect.
	tab_1.tabpage_design.uo_preview.ole_edit.Object.Image = ""
	tab_1.tabpage_design.uo_preview.ole_edit.Object.ClearDisplay()	
	//---------------------------- APPEON END ----------------------------

	tab_1.tabpage_merge.Enabled = True
	//tab_1.tabpage_scan.Enabled = True
	tab_1.tabpage_design.Enabled = True	
	//tab_1.tabpage_batch.Enabled = True		
	//tab_1.tabpage_scan.cb_prior_scan.Enabled = True
	//tab_1.tabpage_scan.cb_next_scan.Enabled = True
	//tab_1.tabpage_scan.cb_page_prop.Enabled = True	
	//tab_1.tabpage_scan.ole_scan_edit.Object.ClearDisplay()
	tab_1.tabpage_design.ole_edit.Object.ClearDisplay()	
	tab_1.SelectTab( 3 )
	
	tab_1.tabpage_design.ole_edit.Object.ShowAnnotationGroup( )
	//Start Code Change ---- 02.22.2006 #278 maha
	il_app_id_audit = ii_app_id
	ib_audit = true
	//End Code Change---02.22.2006
	//--------------------------- APPEON BEGIN ---------------------------
	//$<add> 2006-09-27 By: Rodger Wu
	//$<reason> Make the value of tab_1.tabpage_design.ole_edit.Object.ImageModified equals False.
	tab_1.tabpage_design.ole_edit.Object.Save()
	//---------------------------- APPEON END ----------------------------
ELSE
	tab_1.tabpage_merge.Enabled = False
	//tab_1.tabpage_scan.Enabled = True
	//tab_1.tabpage_design.Enabled = False
	//tab_1.tabpage_batch.Enabled = False
	//tab_1.tabpage_scan.cb_prior_scan.Enabled = False
	//tab_1.tabpage_scan.cb_next_scan.Enabled = False
	//tab_1.tabpage_scan.cb_page_prop.Enabled = False
	tab_1.tabpage_design.ole_edit.Object.ClearDisplay()	
	tab_1.SelectTab( 3 )
	tab_1.tabpage_design.dw_fld_prop.reset() //maha 101804
	//m_pfe_train_app.m_file.m_scanapplication.enabled = True
	//m_pfe_train_app.m_file.m_scanapplication.ToolBarItemVisible = True
END IF

//Start Code Change ---- 12.06.2005 #162 maha
is_preview_mode = "Train" //maha changed 090204 because it was causing a crash selecing an app with no tif file after viewing one with an image
//is_preview_mode = "Preview"
//w_train_app.Event pfc_preview_page()
//End Code Change---12.06.2005



//debugbreak()
//jadof_load_annotations( )
//li_cnt = tab_1.tabpage_design.ole_edit.Object.AnnotationGroupCount()

//IF li_cnt = 0 THEN
//	of_create_annotations( )
//END IF

of_ImagingWarning()			//Added by Scofield on 2007-09-21

Return 1
end function

public function long of_goto_fix_page (long row);Long ll_y_pos
Long li_row
String ls_field

ib_fix_fields = True
w_train_app.ii_app_id = w_check_intelliapp_fields.dw_2.GetItemNumber( row, "app_id" )
w_train_app.ii_facility_id = w_check_intelliapp_fields.dw_2.GetItemNumber( row, "facility_id" )

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-06
//$<modify> 04.07.2006 By: Rodger Wu
//$<reason> Performance Tuning 
//$<modification> Comment out redundant script lines since they will be executed when switching between tab pages.
/*
li_row = w_train_app.tab_1.tabpage_select.tab_facility.tabpage_facility.dw_facility_browse.Find( "facility_id = " + String( w_check_intelliapp_fields.dw_2.GetItemNumber( row, "facility_id" )), 1, 10000 )

w_train_app.tab_1.tabpage_select.tab_facility.tabpage_facility.dw_facility_browse.SetRow( li_row )
w_train_app.tab_1.tabpage_select.tab_facility.tabpage_facility.dw_facility_browse.ScrollToRow( li_row )
w_train_app.tab_1.tabpage_select.tab_facility.tabpage_facility.dw_facility_browse.SelectRow( 0, False )
w_train_app.tab_1.tabpage_select.tab_facility.tabpage_facility.dw_facility_browse.SelectRow( li_row , True )
w_train_app.tab_1.tabpage_select.tab_facility.tabpage_facility.dw_facility_browse.TriggerEvent( DoubleClicked! )

li_row = w_train_app.tab_1.tabpage_select.tab_facility.tabpage_apps.dw_app_browse.Find( "app_id = " + String( w_check_intelliapp_fields.dw_2.GetItemNumber( row, "app_id" )), 1, 10000 )
w_train_app.tab_1.tabpage_select.tab_facility.tabpage_apps.dw_app_browse.SetRow( li_row )
w_train_app.tab_1.tabpage_select.tab_facility.tabpage_apps.dw_app_browse.SelectRow( 0, False )
w_train_app.tab_1.tabpage_select.tab_facility.tabpage_apps.dw_app_browse.SelectRow( li_row, True )

li_row = w_train_app.of_select_app()
w_train_app.tab_1.tabpage_design.sle_goto_page.Text = String( w_check_intelliapp_fields.dw_2.GetItemNumber( row, "page" ) )
w_train_app.tab_1.tabpage_design.cb_goto_page.TriggerEvent( Clicked! )
*/

tab_1.tabpage_select.tab_facility.tabpage_apps.dw_app_detail.Retrieve( ii_app_id )
w_train_app.of_select_app()
	
tab_1.tabpage_design.sle_goto_page.Text = String( w_check_intelliapp_fields.dw_2.GetItemNumber( row, "page" ) )
tab_1.tabpage_design.cb_goto_page.TriggerEvent( Clicked! )
//---------------------------- APPEON END ----------------------------

ls_field = String( w_check_intelliapp_fields.dw_2.GetItemNumber( row, "field_id" ) )
ll_y_pos = w_check_intelliapp_fields.dw_2.GetItemNumber( row, "y_pos" ) 

try 
	tab_1.tabpage_design.ole_edit.Object.SelectAnnotationGroup( ls_field )	 
catch (runtimeerror ret) 
end try

try 
tab_1.tabpage_design.ole_edit.object.ScrollPositionY( ll_y_pos )
catch (runtimeerror rrr)
end try

//w_select_fields.tab_1.tabpage_properties.PostEvent( Clicked! )//(SelectTab(2)
//ii_ancor_y = ll_y_pos //(tab_1.tabpage_design.ole_edit.Object.ScrollPositionY() -3) + (tab_1.tabpage_design.ole_edit.Object.ScrollPositionY() -3) - UnitsToPixels (ll_y_pos, YUnitsToPixels! )  
//ii_ancor_x = 
//ii_ancor_y = UnitsToPixels (ll_y_pos, YUnitsToPixels! ) + tab_1.tabpage_design.ole_edit.Object.ScrollPositionY() -3
//ii_ancor_y = UnitsToPixels ( ll_y_pos, YUnitsToPixels! ) -10

//Open( w_select_fields, w_train_app )
//w_select_fields.tab_1.SelectTab( 2 )
ib_fix_fields = False

Return 1
end function

public function long of_select_button ();DataWindowChild dwchild
Long  ll_fld_id
Long li_page_num
Long li_screen_id
Long li_tbl_id
Long li_last_app_field_id  
Long li_row
long li_app_field_id //modified to long maha071802
Long li_field_len
String ls_lookup_type
String ls_lu_fld_nm
String ls_field_type
String ls_sub_lookup_type

if of_check_for_image() = -1 then return -1//maha 031505


gnv_app.of_modify_menu_attr( m_pfe_train_app.m_edit.m_removeobject,'Enabled', True)
gnv_app.of_modify_menu_attr( m_pfe_train_app.m_edit.m_copyfields,'Enabled', True)
gnv_app.of_modify_menu_attr( m_pfe_train_app.m_view.m_templates,'Enabled', True)
gnv_app.of_modify_menu_attr( m_pfe_train_app.m_tools.m_selectfield,'Checked', True)
gnv_app.of_modify_menu_attr( m_pfe_train_app.m_tools.m_ropeselect,'Checked', False)
gnv_app.of_modify_menu_attr( m_pfe_train_app.m_tools.m_drawbox,'Checked', False)
gnv_app.of_modify_menu_attr( m_pfe_train_app.m_tools.m_Text,'Checked', False)

w_mdi.SetToolbar(3, False, Floating!, "")
w_mdi.SetToolbar(4, False, Floating!, "")
w_mdi.SetToolbar(5, False, Floating!, "")

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> UM-06
//$<add> 01.13.2006 By: Cao YongWang
//$<reason> The SetToolbarPos function is currently unsupported. 
//$<modification> Replace the SetToolBarPos function with the Appeon defined function of_settoolbarpos to provide
//$<modification> the same functionality.
If appeongetclienttype() <> 'PB' Then
	long ll_handle
	ll_handle = handle(w_mdi)
	gnv_appeondll.of_settoolbar( ll_handle, 3 , false)
	gnv_appeondll.of_settoolbar( ll_handle, 4 , false)
	gnv_appeondll.of_settoolbar( ll_handle, 5 , false)
End If
//---------------------------- APPEON END ----------------------------

li_row = tab_1.tabpage_design.dw_field.GetRow()
ll_fld_id = tab_1.tabpage_design.dw_field.GetItemNumber( li_row, "field_id" )
li_tbl_id = tab_1.tabpage_design.dw_field.GetItemNumber( li_row, "table_id" )
ls_lookup_type = tab_1.tabpage_design.dw_field.GetItemString( li_row, "lookup_type" )
ls_field_type = tab_1.tabpage_design.dw_field.GetItemString( li_row, "field_type" )
li_screen_id = tab_1.tabpage_design.dw_screen.GetItemNumber( tab_1.tabpage_design.dw_screen.GetRow(), "screen_id" )

if li_tbl_id >= 80 and li_tbl_id < 90 then //maha 030905
	ib_group = true
else
	ib_group = false
end if
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-07
//$<modify> 04.03.2006 By: Rodger Wu
//$<reason> Performance Tuning
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

/*
tab_1.tabpage_design.dw_fld_prop.Update()
tab_1.tabpage_design.dw_fld_prop.Reset()
tab_1.tabpage_design.dw_fld_prop.InsertRow( 0 )
tab_1.tabpage_design.dw_fld_prop.SetItem( 1, "app_id", w_train_app.ii_app_id )

SELECT Max( app_field_id )  
INTO :li_last_app_field_id  
FROM app_field_prop  
USING w_train_app.tr_training_data;
//WHERE app_field_prop.app_id = :w_train_app.ii_app_id  ;
*/

gnv_appeondb.of_StartQueue()
tab_1.tabpage_design.dw_fld_prop.Update()

SELECT Max( app_field_id )  
INTO :li_last_app_field_id  
FROM app_field_prop  
USING w_train_app.tr_training_data;
gnv_appeondb.of_CommitQueue()

tab_1.tabpage_design.dw_fld_prop.Reset()
tab_1.tabpage_design.dw_fld_prop.InsertRow( 0 )
tab_1.tabpage_design.dw_fld_prop.SetItem( 1, "app_id", w_train_app.ii_app_id )
//---------------------------- APPEON END ----------------------------

IF li_last_app_field_id = 0 OR IsNull( li_last_app_field_id ) THEN
	li_last_app_field_id = 1
ELSE
	li_last_app_field_id++
END IF

tab_1.tabpage_design.dw_fld_prop.SetItem( 1, "app_field_id", li_last_app_field_id )
tab_1.tabpage_design.dw_fld_prop.SetItem( 1, "field_id", ll_fld_id )
tab_1.tabpage_design.dw_fld_prop.SetItem( 1, "table_id", li_tbl_id )
//if this is a field that directly references the address lookup table
IF ls_lookup_type = 'A' THEN
	tab_1.tabpage_design.dw_fld_prop.SetItem( 1, "lookup_link_field", "entity name" )
	tab_1.tabpage_design.dw_fld_prop.SetItem( 1, "lookup_link_type", "E" )
	li_field_len = 50
ELSEIF ls_lookup_type = 'C' THEN
	tab_1.tabpage_design.dw_fld_prop.SetItem( 1, "lookup_link_field", "Code" )
	tab_1.tabpage_design.dw_fld_prop.SetItem( 1, "lookup_link_type", "C" )
	li_field_len = 50	
//if this is a sub field of the lookup table
ELSEIF ls_field_type = 'AL' OR ls_field_type = 'CL' THEN	
	ls_lu_fld_nm = tab_1.tabpage_design.dw_field.GetItemString( tab_1.tabpage_design.dw_field.GetRow(), "field_name_allias" )
	tab_1.tabpage_design.dw_fld_prop.SetItem( 1, "lookup_link_field", ls_lu_fld_nm )
	CHOOSE CASE Upper( ls_lu_fld_nm )
		CASE "ENTITY_NAME"
			li_field_len = 35
			ls_sub_lookup_type = "A"
		CASE "STREET1", "STREET2"
			li_field_len = 35
			ls_sub_lookup_type = "A"			
		CASE "CITY"
			li_field_len = 15
			ls_sub_lookup_type = "A"			
		CASE "STATE"
			li_field_len = 2
			ls_sub_lookup_type = "A"			
		CASE "ZIP"
			li_field_len = 12
			ls_sub_lookup_type = "A"			
		CASE "COUNTRY"
			li_field_len = 10
			ls_sub_lookup_type = "A"			
		CASE "PHONE"
			li_field_len = 13
			ls_sub_lookup_type = "A"						
		CASE "FAX"
			li_field_len = 13
			ls_sub_lookup_type = "A"						
		CASE "CODE"
			li_field_len = 15
			ls_sub_lookup_type = "C"			
		CASE "DESCRIPTION"	
			li_field_len = 25		
			ls_sub_lookup_type = "C"	
		//Start Code Change ---- 10.03.2006 #644 maha
		CASE "CAQH_CODE"	
			li_field_len = 3		
			ls_sub_lookup_type = "C"
		CASE "CONTACT_NAME"	
			li_field_len = 20	
			ls_sub_lookup_type = "C"
		//End Code Change---10.03.2006
		//Start Code Change ----08.20.2008 #V85 maha - added email field
		CASE "EMAIL_ADDRESS"
			li_field_len = 30
			ls_sub_lookup_type = "A"
		//End Code Change---08.20.2008
		CASE ELSE
	END CHOOSE	
	tab_1.tabpage_design.dw_fld_prop.SetItem( 1, "lookup_link_type", ls_sub_lookup_type )	
	//tab_1.tabpage_design.dw_fld_prop.SetItem( 1, "width", li_field_len )	
	//tab_1.tabpage_design.dw_fld_prop.SetItem( 1, "width", li_field_len)		
ELSE
	ls_lu_fld_nm = tab_1.tabpage_design.dw_field.GetItemString( tab_1.tabpage_design.dw_field.GetRow(), "field_name_allias" )	
	CHOOSE CASE Upper( ls_lu_fld_nm )
		CASE "LAST NAME"
			li_field_len = 25
		CASE "STATE"
			li_field_len = 2
		CASE "CITY"
			li_field_len = 15
	END CHOOSE
END IF

li_app_field_id = tab_1.tabpage_design.dw_fld_prop.GetItemNumber( 1, "app_field_id" )


//get the page number and assign it to the property page
li_page_num = tab_1.tabpage_design.ole_edit.Object.Page()
tab_1.tabpage_design.dw_fld_prop.SetItem( 1, "page", li_page_num )	

//if it was a personal data field selected set the appropriate flags
//debugbreak()
IF li_screen_id = 27 THEN
	tab_1.tabpage_design.dw_fld_prop.SetItem( 1, "personal_data", "Y" )
ELSE
	tab_1.tabpage_design.dw_fld_prop.SetItem( 1, "personal_data", "N" )	
END IF

if li_screen_id >= 80 and li_screen_id < 90 THEN //maha 020706
	tab_1.tabpage_design.dw_fld_prop.SetItem( 1, "record_num_addr", 1 )
end if
//Start Code Change ---- 02.07.2006 #255 maha

//if there was a query on the previous selected field copy the query values over
tab_1.tabpage_design.dw_fld_prop.SetItem( 1, "record_number", ii_record_number )	
tab_1.tabpage_design.dw_fld_prop.SetItem( 1, "query_field", is_query_field )	
tab_1.tabpage_design.dw_fld_prop.SetItem( 1, "query_operator", is_query_operator )	
tab_1.tabpage_design.dw_fld_prop.SetItem( 1, "query_value", is_query_value )	
tab_1.tabpage_design.dw_fld_prop.SetItem( 1, "x_pos", 0 )	
tab_1.tabpage_design.dw_fld_prop.SetItem( 1, "y_pos", 0 )	
tab_1.tabpage_design.dw_fld_prop.SetItem( 1, "billing_address_flag", ii_billing_address_flag )	

//tab_1.tabpage_design.dw_fld_prop.SetItem( 1, "billing_link_addr", 0 )

IF is_query_field = "" THEN
	tab_1.tabpage_design.dw_fld_prop.SetItem( 1, "record_number", 1 )		
END IF

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-08
//$<modify> 04.03.2006 By: Rodger Wu
//$<reason> Performance Tuning
//$<modification> Copy the script from PT-09 here and integrate it into Appeon Queue 
//$<modification> labels with other SQLs to reduce client-server interactions.

/*
tab_1.tabpage_design.dw_fld_prop.Update()
//tab_1.tabpage_design.dw_fld_prop.DataObject = ""
//tab_1.tabpage_design.dw_fld_prop.DataObject = "d_app_field_properties"
//tab_1.tabpage_design.dw_fld_prop.SetTransObject( w_train_app.tr_training_data )	
tab_1.tabpage_design.dw_fld_prop.Retrieve( li_app_field_id )
*/

tab_1.tabpage_design.dw_fld_prop.GetChild( "query_field", dwchild )
dwchild.SetTransObject( SQLCA )

gnv_appeondb.of_StartQueue()
tab_1.tabpage_design.dw_fld_prop.Update()
dwchild.Retrieve( li_tbl_id )
tab_1.tabpage_design.dw_fld_prop.Retrieve( li_app_field_id )
gnv_appeondb.of_CommitQueue()
//---------------------------- APPEON END ----------------------------

IF li_field_len = 0 OR IsNull( li_field_len ) THEN
	//li_field_len = tab_1.tabpage_design.dw_fld_prop.GetItemNumber( 1, "sys_fields_field_len" )	
	li_field_len = tab_1.tabpage_design.dw_fld_prop.GetItemNumber( 1, "app_fill_field_len" )
END IF

IF li_field_len = 0 OR IsNull( li_field_len ) THEN //maha 061303 if no value picked up
	li_field_len = 25
END IF

tab_1.tabpage_design.dw_fld_prop.SetItem( 1, "width", li_field_len )

tab_1.tabpage_design.dw_fld_prop.SetColumn( "record_number" )

w_train_app.ii_ancor_x = 0
w_train_app.ii_ancor_y = 0
w_train_app.ib_click_position = True

ib_applied = False
ib_selected = True

w_train_app.ib_new_field_selection = True
w_train_app.st_msg.Text = " Click the position on the image where you want field placed."
w_train_app.st_msg.Visible = True
tab_1.tabpage_design.cb_apply.Visible = False
w_train_app.tab_1.tabpage_design.ole_edit.object.AnnotationType( 0 )
w_train_app.tab_1.tabpage_design.ole_edit.Object.SelectAnnotationGroup( "" )	

//tab_1.tabpage_design.cb_apply.TriggerEvent( Clicked! )
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-09
//$<comment> 04.03.2006 By: Rodger Wu
//$<reason> Performance Tuning
//$<modification> Move the following script to PT-08. It is integrated into Appeon
//$<modification> Queue labels with other SQLs to reduce client-server interactions.
/*
tab_1.tabpage_design.dw_fld_prop.GetChild( "query_field", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve( li_tbl_id )
*/
//---------------------------- APPEON END ----------------------------

//Comment out the following script base on the customer requirement. Do not need to change the tab when click the 
//field 
//tab_1.tabpage_design.tab_fld_prop.SelectTab( 1 )

Return 0
end function

public function long of_save_mapping ();String	ls_Rtn

//--------------------------- APPEON BEGIN ---------------------------
//$< Add  > 2008-07-17 By: Scofield
//$<Reason> Verify if the directory has write right for the current user.

ls_Rtn = f_ExaWriteRight(tab_1.tabpage_design.ole_edit.Object.Image)
if Len(ls_Rtn) > 0 then
	MessageBox(gnv_app.iapp_object.DisplayName,ls_Rtn,Exclamation!)
	Return -1
end if
//---------------------------- APPEON END ----------------------------

//of_delete_annotations( )

IF m_pfe_train_app.m_view.m_recordnumbers.checked THEN
	gnv_app.of_modify_menu_attr( m_pfe_train_app.m_view.m_recordnumbers,'checked', False)
	of_delete_records()
END IF

of_app_audit_track(ii_app_id)
tab_1.tabpage_design.ole_edit.Object.Save()
//--------------------------- APPEON BEGIN ---------------------------
//$<add> 2006-08-19 By: Liu Hongxin
//$<reason> Fix defect: After add a page, update it to database.
n_appeon_storage_area lnv_storage_area

IF Not ib_saved THEN//Rodger Wu added, Sept 27, 2006
	IF gnv_data.of_GetItem( "icred_settings", "image_storage_type", False ) = '1' or appeongetclienttype() = "WEB" THEN//Rodger Wu added, Sept 27, 2006
		lnv_storage_area.of_upload_app_image( ii_app_id, is_app_path + String( ii_app_id ) + ".tif")
	END IF
END IF
//---------------------------- APPEON END ----------------------------
COMMIT USING tr_training_data;

//of_load_annotations()

//SetRedraw( True )		//avoiding screen blinks on web application

ib_saved = True

Return 1
end function

public function long of_save (string as_tab);Long li_found
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-10
//$<add> 04.07.2006 By: Rodger Wu
//$<reason> Performance Tuning 
//$<reason> Define local variable to be used by subsequent script.
dwItemStatus ldws_status
//---------------------------- APPEON END ----------------------------

IF as_tab = "facility" THEN
	IF tab_1.tabpage_select.tab_facility.tabpage_facility.dw_facility_detail.AcceptText() = -1 THEN
		Return -1
	END IF
	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> PT-11
	//$<modify> 04.07.2006 By: Rodger Wu
	//$<reason> Performance Tuning 
	//$<reason> 1)Add a condition to avoid redundant function call.
	//$<reason> 2)Add Appeon Queue labels to reduce lient-server interactions.
	/*
	tab_1.tabpage_select.tab_facility.tabpage_facility.dw_facility_detail.Update()
	tab_1.tabpage_select.tab_facility.tabpage_facility.dw_facility_browse.retrieve()

	li_found = tab_1.tabpage_select.tab_facility.tabpage_facility.dw_facility_browse.Find( "facility_id = " + String( ii_facility_id ) , 1, 100000 )	
	tab_1.tabpage_select.tab_facility.tabpage_facility.dw_facility_browse.SetRow( li_found )
	tab_1.tabpage_select.tab_facility.tabpage_facility.dw_facility_browse.ScrollToRow( li_found )
	*/
	ldws_status = tab_1.tabpage_select.tab_facility.tabpage_facility.dw_facility_detail.GetItemStatus( 1, 0, Primary! )
	If ldws_status = DataModified! or ldws_status = NewModified! Then
		gnv_appeondb.of_StartQueue()
		tab_1.tabpage_select.tab_facility.tabpage_facility.dw_facility_detail.Update()
		tab_1.tabpage_select.tab_facility.tabpage_facility.dw_facility_browse.retrieve()
		gnv_appeondb.of_CommitQueue()
		
		li_found = tab_1.tabpage_select.tab_facility.tabpage_facility.dw_facility_browse.Find( "facility_id = " + String( ii_facility_id ) , 1, 100000 )	
		tab_1.tabpage_select.tab_facility.tabpage_facility.dw_facility_browse.SetRow( li_found )
		tab_1.tabpage_select.tab_facility.tabpage_facility.dw_facility_browse.ScrollToRow( li_found )
	End If
	//---------------------------- APPEON END ----------------------------

ELSEIF as_tab = "apps" THEN
	IF	tab_1.tabpage_select.tab_facility.tabpage_apps.dw_app_detail.AcceptText( ) = -1 THEN
		Return -1
	END IF

	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> PT-12
	//$<modify> 04.07.2006 By: Rodger Wu
	//$<reason> Performance Tuning 
	//$<reason> 1)Add a conditionto avoid redundant function call.
	//$<reason> 2)Add Appeon Queue labels to reduce client-server interactions.
	/*
	tab_1.tabpage_select.tab_facility.tabpage_apps.dw_app_detail.Update()
	tab_1.tabpage_select.tab_facility.tabpage_apps.dw_app_browse.Retrieve( ii_facility_id )
	
	li_found = tab_1.tabpage_select.tab_facility.tabpage_apps.dw_app_browse.Find( "app_id = " + String( ii_app_id ) , 1, 1000 )
	tab_1.tabpage_select.tab_facility.tabpage_apps.dw_app_browse.SetRow( li_found )
	tab_1.tabpage_select.tab_facility.tabpage_apps.dw_app_browse.ScrolltoRow( li_found )
	*/
	ldws_status = tab_1.tabpage_select.tab_facility.tabpage_apps.dw_app_detail.GetItemStatus( 1, 0, Primary! )
	If ldws_status = DataModified! or ldws_status = NewModified! Then
		gnv_appeondb.of_startqueue( )
		tab_1.tabpage_select.tab_facility.tabpage_apps.dw_app_detail.Update()
		tab_1.tabpage_select.tab_facility.tabpage_apps.dw_app_browse.Retrieve( ii_facility_id )
		gnv_appeondb.of_commitqueue( )
		
		li_found = tab_1.tabpage_select.tab_facility.tabpage_apps.dw_app_browse.Find( "app_id = " + String( ii_app_id ) , 1, 1000 )
		tab_1.tabpage_select.tab_facility.tabpage_apps.dw_app_browse.SetRow( li_found )
		tab_1.tabpage_select.tab_facility.tabpage_apps.dw_app_browse.ScrolltoRow( li_found )
	End If
	
	//---------------------------- APPEON END ----------------------------

//$<add> 07.10.2008 by Andy
ELSEIF as_tab = "images" THEN
	IF tab_1.tabpage_select.tab_facility.tabpage_images.dw_image_list.AcceptText() = -1 THEN
		Return -1
	END IF
	
	Long ll_Cnt,ll_Cnt2,ll_Row,ll_Find
	Long ll_image_type,ll_selected
	dec{0} ldec_app_image_id
	Long ll_New,ll_app_id
	
	if tab_1.tabpage_select.tab_facility.tabpage_images.dw_image_list.Modifiedcount( ) > 0 then
		//Get max(app_image_id)+1
		SELECT max(app_image_id) INTO :ldec_app_image_id from app_image_defaults;
		if IsNull(ldec_app_image_id) or ldec_app_image_id = 0 then 
			ldec_app_image_id = 1
		else
			ldec_app_image_id ++
		end if
		//Get app_id
		ll_Row    = tab_1.tabpage_select.tab_facility.tabpage_apps.dw_app_browse.GetRow( )
		if ll_Row > 0 then
			ll_app_id = tab_1.tabpage_select.tab_facility.tabpage_apps.dw_app_browse.GetItemNumber(ll_Row,"app_id")
		end if 
		//Make changes to dw_image_defaults
		ll_Cnt = tab_1.tabpage_select.tab_facility.tabpage_images.dw_image_defaults.RowCount()
		ll_Cnt2= tab_1.tabpage_select.tab_facility.tabpage_images.dw_image_list.RowCount()
		FOR ll_Row = 1 to ll_Cnt2
			ldws_status = tab_1.tabpage_select.tab_facility.tabpage_images.dw_image_list.GetItemStatus( ll_Row, 0, Primary! )
			If ldws_status = NotModified! or ldws_status = New! Then	Continue
			
			ll_selected   = tab_1.tabpage_select.tab_facility.tabpage_images.dw_image_list.GetItemNumber(ll_Row,"selected")
			ll_image_type = tab_1.tabpage_select.tab_facility.tabpage_images.dw_image_list.GetItemNumber(ll_Row,"image_type_id")
			ll_Find = tab_1.tabpage_select.tab_facility.tabpage_images.dw_image_defaults.Find("image_type=" + String(ll_image_type),1,ll_Cnt)
			if ll_Find > 0 then
				if ll_selected = 0 then tab_1.tabpage_select.tab_facility.tabpage_images.dw_image_defaults.deleterow(ll_Find)
			else
				if ll_selected = 1 then
					ll_New = tab_1.tabpage_select.tab_facility.tabpage_images.dw_image_defaults.insertRow(0)
					tab_1.tabpage_select.tab_facility.tabpage_images.dw_image_defaults.SetItem(ll_New,"app_image_id",ldec_app_image_id)
					tab_1.tabpage_select.tab_facility.tabpage_images.dw_image_defaults.SetItem(ll_New,"app_id",ll_app_id)
					tab_1.tabpage_select.tab_facility.tabpage_images.dw_image_defaults.SetItem(ll_New,"image_type",ll_image_type)
					ldec_app_image_id ++
				end if
			end if
		Next
		//commit to DB
		tab_1.tabpage_select.tab_facility.tabpage_images.dw_image_defaults.update( )
		tab_1.tabpage_select.tab_facility.tabpage_images.dw_image_list.ResetUpdate( )
	end if
//End add 07.10.2008
END IF

Return 1
end function

public function long of_remove_object ();String ls_label_id

if tab_1.selectedtab = 1 then return 0 //maha 051904 crash trap 
if of_check_for_image() = -1 then return -1//maha 031505

IF ib_label_selected OR ib_rectangle_selected THEN
	IF Mid( is_label_id, 1, 3 ) = "SP-" OR  Mid( is_label_id, 1, 6 ) = "LABEL-" OR Upper( Mid( is_label_id, 1, 9)) = "RECTANGLE" OR Upper( Mid( is_label_id, 1, 15)) = "HOLLOWRECTANGLE" THEN
		DELETE FROM app_field_prop  
	  	WHERE ( app_field_prop.app_field_id = :ii_app_field_id ) AND  
   	      ( app_field_prop.app_id = :ii_app_id )
		USING tr_training_data;		
		COMMIT USING tr_training_data;
	END IF
	tab_1.tabpage_design.ole_edit.object.DeleteAnnotationGroup( is_label_id )
	tab_1.tabpage_design.ole_edit.Object.DeleteAnnotationGroup( "Rectangle," + String( ii_app_field_id ))		
	tab_1.tabpage_design.ole_edit.Object.DeleteAnnotationGroup( "HollowRectangle," + String( ii_app_field_id ))				
	Return 1
END IF

IF tab_1.tabpage_design.dw_fld_prop.RowCount() > 0 THEN
	CHOOSE CASE  tab_1.tabpage_design.dw_fld_prop.GetItemString( 1, "object_type" ) 
		CASE "B"
		CASE "C"
			tab_1.tabpage_design.ole_edit.object.DeleteAnnotationGroup( String(ii_app_field_id)+"Check" )				
		CASE "Y1"		
			tab_1.tabpage_design.ole_edit.object.DeleteAnnotationGroup( String(ii_app_field_id)+"NoBox" )				
			tab_1.tabpage_design.ole_edit.object.DeleteAnnotationGroup( String(ii_app_field_id)+"YesBox")				
		CASE "T"
			tab_1.tabpage_design.ole_edit.object.DeleteAnnotationGroup( String(ii_app_field_id) )		
	END CHOOSE

	tab_1.tabpage_design.dw_fld_prop.DeleteRow(0)
	tab_1.tabpage_design.dw_fld_prop.Update()	
	COMMIT USING tr_training_data;
ELSE
	tab_1.tabpage_design.ole_edit.Object.DeleteAnnotationGroup( "Rectangle," + String( ii_app_field_id ))		
	tab_1.tabpage_design.ole_edit.Object.DeleteAnnotationGroup( "HollowRectangle," + String( ii_app_field_id ))			
	tab_1.tabpage_design.ole_edit.object.DeleteAnnotationGroup( String(ii_app_field_id)+"Check" )				
	tab_1.tabpage_design.ole_edit.object.DeleteAnnotationGroup( String(ii_app_field_id)+"NoBox" )				
	tab_1.tabpage_design.ole_edit.object.DeleteAnnotationGroup( String(ii_app_field_id)+"YesBox")	
	tab_1.tabpage_design.ole_edit.object.DeleteAnnotationGroup( is_label_id )		
	tab_1.tabpage_design.ole_edit.object.DeleteAnnotationGroup( String(ii_app_field_id) )			
END IF

//tab_1.tabpage_design.ole_edit.object.SaveAnnotations( is_app_path + String( ii_app_id ) + "-" + String( ii_current_page ) + ".ano",ii_current_page ,ii_current_page , 1 )

Return 0

end function

public function long of_open_template ();if of_check_for_image() = -1 then return -1//maha 031505

Open( w_section_templates )

Return 1
end function

public function long of_prior_page ();String	ls_Rtn

tab_1.tabpage_design.ole_edit.Object.SelectAnnotationGroup( "" )	
IF ii_current_page > 1 THEN
	//of_delete_annotations( )	
	ii_current_page --
	//--------------------------- APPEON BEGIN ---------------------------
	//$< Add  > 2008-07-17 By: Scofield
	//$<Reason> Verify if the directory has write right for the current user.
	
	ls_Rtn = f_ExaWriteRight(tab_1.tabpage_design.ole_edit.Object.Image)
	if Len(ls_Rtn) > 0 then
		MessageBox(gnv_app.iapp_object.DisplayName,ls_Rtn,Exclamation!)
		Return -1
	end if
	//---------------------------- APPEON END ----------------------------
	tab_1.tabpage_design.ole_edit.Object.Save()
	COMMIT USING tr_training_data;
	tab_1.tabpage_design.ole_edit.object.Page( ii_current_page  )
	tab_1.tabpage_design.ole_edit.object.Display()
	of_load_annotations()
	IF ii_current_page = 1 THEN
		gnv_app.of_modify_menu_attr( m_pfe_train_app.m_view.m_priorpage,'enabled', False)
		gnv_app.of_modify_menu_attr( m_pfe_train_app.m_view.m_nextpage,'enabled', True)
	ELSE
		this.enabled = True
	END IF
	IF ii_current_page < tab_1.tabpage_design.ole_edit.object.PageCount() THEN
		gnv_app.of_modify_menu_attr( m_pfe_train_app.m_view.m_nextpage,'enabled', True)
	END IF
	st_page_num.Text = "Page " + String( ii_current_page ) + " Of " + String( tab_1.tabpage_design.ole_edit.Object.PageCount() )
END IF

Return 0

end function

public function long of_next_page ();String	ls_Rtn

if of_check_for_image() = -1 then return -1//maha 031505

tab_1.tabpage_design.ole_edit.Object.SelectAnnotationGroup( "" )	
IF tab_1.tabpage_design.ole_edit.Object.PageCount() > ii_current_page THEN
	//of_delete_annotations( )				
	ii_current_page ++
	//--------------------------- APPEON BEGIN ---------------------------
	//$< Add  > 2008-07-17 By: Scofield
	//$<Reason> Verify if the directory has write right for the current user.
	
	ls_Rtn = f_ExaWriteRight(tab_1.tabpage_design.ole_edit.Object.Image)
	if Len(ls_Rtn) > 0 then
		MessageBox(gnv_app.iapp_object.DisplayName,ls_Rtn,Exclamation!)
		Return -1
	end if
	//---------------------------- APPEON END ----------------------------
	tab_1.tabpage_design.ole_edit.Object.Save()
	COMMIT USING tr_training_data;
	tab_1.tabpage_design.ole_edit.object.Page( ii_current_page  )
	tab_1.tabpage_design.ole_edit.object.Display()
	of_load_annotations()
	gnv_app.of_modify_menu_attr( m_pfe_train_app.m_view.m_priorpage,'enabled', True)
	IF ii_current_page = tab_1.tabpage_design.ole_edit.Object.PageCount() THEN
		gnv_app.of_modify_menu_attr( m_pfe_train_app.m_view.m_nextpage,'enabled', False)
	ELSE
		gnv_app.of_modify_menu_attr( m_pfe_train_app.m_view.m_nextpage,'enabled', True)		
	END IF
	//w_select_fields.tab_1.SelectTab( 1 )	
	st_page_num.Text = "Page " + String( ii_current_page ) + " Of " + String( tab_1.tabpage_design.ole_edit.Object.PageCount() )
END IF

Return 0
end function

public function long of_select_field ();if of_check_for_image() = -1 then return -1//maha 031505

ib_label_tool = False

ii_align = 0
ii_copy_fields = 0
st_align.Visible = False
st_connect.Visible = False
st_msg.Visible = False

of_delete_records()
tab_1.tabpage_design.ole_edit.object.AnnotationType( 11 )
tab_1.tabpage_design.ole_edit.Object.SelectAnnotationGroup( "" )	

Return 0
end function

public function long of_rope_select ();w_mdi.SetToolbarPos(3, 100, 400, 400, 1)
w_mdi.SetToolbar(3, TRUE, Floating!, "")

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> UM-07
//$<add> 01.13.2006 By: Rodger Wu
//$<reason> The SetToolbarPos function is currently unsupported. 
//$<modification> Replace the SetToolBarPos function with the Appeon defined function of_settoolbarpos to provide
//$<modification> the same functionality.
If appeongetclienttype() <> 'PB' Then
	long ll_handle
	ll_handle = handle(w_mdi)
	gnv_appeondll.of_settoolbarpos(ll_handle)
	gnv_appeondll.of_SetToolbar(ll_handle , 3, TRUE)
End If
//---------------------------- APPEON END ----------------------------


ib_label_tool = False
tab_1.tabpage_design.ole_edit.object.AnnotationType( 0 )

ii_copy_fields = 0

Return 0
end function

public function long of_create_text ();
if of_check_for_image() = -1 then return -1//maha 031505

	ib_label_tool = True
	Open( w_get_label )
	w_get_label.io_image_edit = tab_1.tabpage_design.ole_edit	
//END IF

ib_saved = False

Return 0
end function

public function long of_draw_box ();String ls_type
String ls_text
Long li_app_id
Long ll_field_id
Long li_page

if of_check_for_image() = -1 then return -1//maha 031505

li_page = w_train_app.ii_current_page
li_app_id = w_train_app.ii_app_id

SELECT Max( app_field_id )  
INTO :ll_field_id  
FROM app_field_prop 
USING tr_training_data;
IF tr_training_data.SQLCODE = -1 THEN
	MessageBox("Database Error", tr_training_data.SQLERRTEXT )
END IF

ll_field_id++

ib_loading_annotations = True
tab_1.tabpage_design.ole_edit.Object.AddAnnotationGroup( "HollowRectangle," + String( ll_field_id ))		
tab_1.tabpage_design.ole_edit.object.Annotationtype(3)		
tab_1.tabpage_design.ole_edit.object.Draw( 1, 1,30,30)	
//tab_1.tabpage_design.ole_edit.object.SetSelectedAnnotationFillColor( 8454143 )
ib_loading_annotations = False

INSERT INTO app_field_prop  
         ( app_field_id,   
           app_id,   
           table_id,   
           field_id,   
           lookup_link_type,   
           lookup_link_field,   
           record_number,   
           x_pos,   
           y_pos,   
           width,   
           query_field,   
           query_value,   
           page,   
           box_type,   
           box_height,   
           box_width,   
           box_yes_x,   
           box_yes_y,   
           box_yes_value,   
           box_no_x,   
           box_no_y,   
           box_no_value,   
           font_type,   
           font_size,   
           font_color,   
           font_background,   
           font_underline,   
           font_bold,   
           query_operator,   
           field_description,   
           personal_data,   
           height,   
           annotation_width,   
           past_years_query,   
           format,   
           connect_field_id,   
           connect_field_sort )  
  VALUES ( :ll_field_id,   
           :li_app_id,   
           99,   
           0,   
           null,   
           null,   
           null,   
           1,   
           1,   
           null,   
           null,   
           null,   
           :li_page,   
           null,   
           30,   
           30,   
           null,   
           null,   
           null,   
           null,   
           null,   
           null,   
			  null,
           null,   
           null,   
           null,   
           null,   
           null,   
           null,   
           'HollowRectangle',   
           'N',   
           null,   
           null,   
           null,   
           null,   
           null,   
           null )
USING tr_training_data;
IF tr_training_data.SQLCODE = -1 THEN
	MessageBox("Database Error", tr_training_data.SQLERRTEXT )
END IF

//COMMIT USING tr_training_data;

try 
	tab_1.tabpage_design.ole_edit.Object.Annotationtype(11)	
catch (runtimeerror rte)
end try

Return 1
//Long li_font_type
//String ls_box_object_name
//
//ib_label_tool = False
//
//ls_box_object_name = "box-"+String( Today() ) + String( Now() )
//
//tab_1.tabpage_design.ole_edit.Object.AddAnnotationGroup( ls_box_object_name )
//tab_1.tabpage_design.ole_edit.Object.AnnotationLineColor( 0 )
//tab_1.tabpage_design.ole_edit.Object.Annotationtype(3)		
//tab_1.tabpage_design.ole_edit.Object.Draw(0, 0, 20, 20)
//tab_1.tabpage_design.ole_edit.Object.Annotationtype(11)	
//
//ib_saved = False

Return 0
end function

public function long of_copy ();if of_check_for_image() = -1 then return -1//maha 031505
//--------------------------- APPEON BEGIN ---------------------------
//$<add> 2006-08-15 By: Liu Hongxin
//$<reason> If have not rope select, couldn't to copy.
if is_IsRectangle = False then return -2
//---------------------------- APPEON END ----------------------------
tab_1.tabpage_design.ole_edit.object.ClipBoardCopy()

ii_copy_fields = 0

Return 0
end function

public function long of_paste ();Long li_dummy[]
String ls_dummy[]
Integer li_ans

if of_check_for_image() = -1 then return -1//maha 031505

IF m_pfe_train_app.m_tools.m_ropeselect.checked THEN
	//--------------------------- APPEON BEGIN ---------------------------
	//$<add> 2006-08-15 By: Liu Hongxin
	//$<reason> If no data, don't to paste.
	if tab_1.tabpage_design.ole_edit.object.IsClipboardDataAvailable() = False then return -2
	//---------------------------- APPEON END ----------------------------
	tab_1.tabpage_design.ole_edit.object.ClipboardPaste()
ELSE
	DO WHILE TRUE
		of_copy_fields( )		
		li_ans = MessageBox( "Copy Fields", "Would you like to paste the same fields again?", Question!, YesNo!, 2 )		
		IF li_ans = 2 THEN
			//Clear out copy fields vars
			ii_align = 0
			ii_ancor_count = 0
			is_selected_fields = ls_dummy
			ii_x = li_dummy
			ii_y = li_dummy
			ii_copy_fields = 0
			ii_shift_down_count = 0
			Exit
		END IF
	LOOP
END IF

ib_saved = False

Return 0
end function

public function long of_cut ();if of_check_for_image() = -1 then return -1//maha 031505
//--------------------------- APPEON BEGIN ---------------------------
//$<add> 2006-08-15 By: Liu Hongxin
//$<reason> If have not rope select, couldn't to cut.
if is_IsRectangle = False then return -2
//---------------------------- APPEON END ----------------------------
tab_1.tabpage_design.ole_edit.object.ClipBoardCut()

ii_copy_fields = 0

ib_saved = False

Return 0
end function

public function long of_add_row ();Long li_nr
Long li_next_id
String ls_install_type



IF tab_1.tabpage_select.tab_facility.SelectedTab = 1 THEN
	IF of_save( "facility" ) = -1 THEN
		Return -1
	END IF

	SELECT Max( facility_id )  
	INTO :li_next_id  
	FROM app_facility
	USING tr_training_data;

	IF IsNull( li_next_id ) OR li_next_id = 0 THEN
		li_next_id = 1
	ELSE
		li_next_id ++
	END IF

	tab_1.tabpage_select.tab_facility.tabpage_facility.dw_facility_detail.Reset()
	li_nr = tab_1.tabpage_select.tab_facility.tabpage_facility.dw_facility_detail.InsertRow( 0 )
	tab_1.tabpage_select.tab_facility.tabpage_facility.dw_facility_detail.SetItem( li_nr, "facility_id", li_next_id )
	ii_facility_id = li_next_id
	ii_app_id = 0
//	tab_facility.tabpage_facility.dw_facility_browse.SetRow( li_nr )	
//	tab_facility.tabpage_facility.dw_facility_browse.ScrollToRow( li_nr )		
//	tab_facility.tabpage_facility.dw_facility_browse.SelectRow( 0, False )
//	tab_facility.tabpage_facility.dw_facility_browse.SelectRow( li_nr, True )	
	tab_1.tabpage_select.tab_facility.tabpage_facility.dw_facility_detail.SetFocus()
ELSE
	IF of_save( "apps" ) = -1 THEN
		Return -1
	END IF

	SELECT Max( app_id )  
	INTO :li_next_id  
	FROM app_hdr
	USING tr_training_data;

	IF IsNull( li_next_id ) OR li_next_id = 0 THEN
		li_next_id = 1
	ELSE
		li_next_id ++
	END IF

	tab_1.tabpage_select.tab_facility.tabpage_apps.dw_app_detail.Reset()
	li_nr = tab_1.tabpage_select.tab_facility.tabpage_apps.dw_app_detail.InsertRow( 0 )
	tab_1.tabpage_select.tab_facility.tabpage_apps.dw_app_detail.SetItem( li_nr, "app_id", li_next_id )
	ii_app_id =li_next_id
	tab_1.tabpage_select.tab_facility.tabpage_apps.dw_app_detail.SetItem( li_nr, "facility_id", ii_facility_id )	

//	tab_facility.tabpage_apps.dw_app_browse.SelectRow( 0, False )
//	tab_facility.tabpage_apps.dw_app_browse.SelectRow( li_nr, True )	
//	tab_facility.tabpage_apps.dw_app_browse.SetRow( li_nr )
//	tab_facility.tabpage_apps.dw_app_browse.ScrollToRow( li_nr )	

	tab_1.tabpage_select.tab_facility.tabpage_apps.dw_app_detail.SetFocus()	
END IF

Return 0
end function

public function long of_delete_row ();Long li_ans
Long li_app_id
string ls_facil_name //maha101501
long  ll_facil_id //maha101501
Long li_apps

IF tab_1.tabpage_select.tab_facility.SelectedTab = 1 THEN
	IF tab_1.tabpage_select.tab_facility.tabpage_facility.dw_facility_detail.GetItemStatus( tab_1.tabpage_select.tab_facility.tabpage_facility.dw_facility_detail.GetRow(), 0, Primary! ) = New!  OR +&
		tab_1.tabpage_select.tab_facility.tabpage_facility.dw_facility_detail.GetItemStatus( tab_1.tabpage_select.tab_facility.tabpage_facility.dw_facility_detail.GetRow(), 0, Primary! ) = NewModified!  THEN
		tab_1.tabpage_select.tab_facility.tabpage_facility.dw_facility_detail.DeleteRow( 0 )			
	ELSE	
		ls_facil_name = tab_1.tabpage_select.tab_facility.tabpage_facility.dw_facility_browse.GetItemstring(tab_1.tabpage_select.tab_facility.tabpage_facility.dw_facility_browse.Getrow(),"facility_name")//maha 101501
		ll_facil_id = tab_1.tabpage_select.tab_facility.tabpage_facility.dw_facility_browse.GetItemnumber(tab_1.tabpage_select.tab_facility.tabpage_facility.dw_facility_browse.Getrow(),"facility_id")//maha 101501
		li_ans = MessageBox( "Delete", "Are you sure you want to delete " + ls_facil_name, Question!, YesNo!, 2 )
		IF li_ans = 2 THEN
			Return 0
		END IF
		select count(app_id) into :li_apps from app_hdr where facility_id = :ll_facil_id;//\/maha 101501
		if li_apps > 0 then 
			messagebox("Delete Error","There are " + string(li_apps) + "apps connected to this facility. Delete the apps before deleting the facility.")
			return -1
		else
			tab_1.tabpage_select.tab_facility.tabpage_facility.dw_facility_browse.DeleteRow( 0 )		
			//--------------------------- APPEON BEGIN ---------------------------
			//$<ID> PT-13
			//$<modify> 02.16.2006 By: owen chen
			//$<reason> Performance tuning
			//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

			/*
			tab_1.tabpage_select.tab_facility.tabpage_facility.dw_facility_browse.Update()
			COMMIT USING SQLCA;
			*/
			gnv_appeondb.of_startqueue( )
			
			tab_1.tabpage_select.tab_facility.tabpage_facility.dw_facility_browse.Update()
			COMMIT USING SQLCA;
			
			gnv_appeondb.of_commitqueue( )
			
			//---------------------------- APPEON END ----------------------------
		
		end if //\ maha 
	END IF	
	IF tab_1.tabpage_select.tab_facility.tabpage_facility.dw_facility_browse.RowCount() > 0 THEN
		tab_1.tabpage_select.tab_facility.tabpage_facility.dw_facility_browse.SetRow( 1 )
		tab_1.tabpage_select.tab_facility.tabpage_facility.dw_facility_browse.ScrollToRow( 1 )
		tab_1.tabpage_select.tab_facility.tabpage_facility.dw_facility_browse.SelectRow( 1, True )	
		tab_1.tabpage_select.tab_facility.tabpage_facility.dw_facility_detail.Retrieve( tab_1.tabpage_select.tab_facility.tabpage_facility.dw_facility_browse.GetItemNumber( 1, "facility_id" ))
	END IF
ELSE
	IF tab_1.tabpage_select.tab_facility.tabpage_apps.dw_app_detail.GetItemStatus( tab_1.tabpage_select.tab_facility.tabpage_apps.dw_app_detail.GetRow(), 0, Primary! ) = New!  OR +&
		tab_1.tabpage_select.tab_facility.tabpage_apps.dw_app_detail.GetItemStatus( tab_1.tabpage_select.tab_facility.tabpage_apps.dw_app_detail.GetRow(), 0, Primary! ) = NewModified!  THEN
		tab_1.tabpage_select.tab_facility.tabpage_apps.dw_app_detail.DeleteRow( 0 )	//new unsaved record		
	ELSE
		li_ans = MessageBox( "Delete", "Are you sure you want to delete this record? ", Question!, YesNo!, 2 )
		IF li_ans = 2 THEN
			Return 0
		END IF	
		li_ans = MessageBox( "Delete", "This will delete all the training that has been done for this application and the application image will be deleted.  Are you VERY sure? ", Question!, YesNo!, 2 )	
		IF li_ans = 2 THEN
			Return -1
		end if
		//\/maha 080404
		li_app_id =	tab_1.tabpage_select.tab_facility.tabpage_apps.dw_app_browse.GetItemNumber( tab_1.tabpage_select.tab_facility.tabpage_apps.dw_app_browse.GetRow(), "app_id" )
		openwithparm(w_app_delete_message,li_app_id)
		li_ans = message.doubleparm
		IF li_ans = -1 THEN
			return -1
		//\
		ELSE
		//	li_app_id =	tab_1.tabpage_select.tab_facility.tabpage_apps.dw_app_browse.GetItemNumber( tab_1.tabpage_select.tab_facility.tabpage_apps.dw_app_browse.GetRow(), "app_id" )
			tab_1.tabpage_select.tab_facility.tabpage_apps.dw_app_browse.DeleteRow( 0 )	
			FileDelete( is_app_path + String( li_app_id ) + ".tif" )
			//--------------------------- APPEON BEGIN ---------------------------
			//$<ID> PT-14
			//$<modify> 02.16.2006 By: owen chen
			//$<reason> Performance tuning
			//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

			/*
			DELETE FROM app_field_prop  
		   WHERE app_field_prop.app_id = :li_app_id   ;
			IF SQLCA.SQLCODE = -1 THEN
				MessageBox( "Error", "There was an error deleting from the app_field_prop table." )
				Return -1
			END IF	

			tab_1.tabpage_select.tab_facility.tabpage_apps.dw_app_browse.Update()
			COMMIT USING SQLCA;			
			*/
			gnv_appeondb.of_startqueue( )

			DELETE FROM app_field_prop  
		   WHERE app_field_prop.app_id = :li_app_id   ;

			tab_1.tabpage_select.tab_facility.tabpage_apps.dw_app_browse.Update()
			
			//Add by appeon 09.20.2006
			DELETE FROM app_blob  
		   WHERE app_id = :li_app_id   ;
			//Add by appeon 09.20.2006

			COMMIT USING SQLCA;	
			
			gnv_appeondb.of_commitqueue( )
			
			//---------------------------- APPEON END ----------------------------
		
		END IF
	END IF
	IF tab_1.tabpage_select.tab_facility.tabpage_apps.dw_app_browse.RowCount() > 0 THEN
		tab_1.tabpage_select.tab_facility.tabpage_apps.dw_app_browse.SetRow( 1 )
		tab_1.tabpage_select.tab_facility.tabpage_apps.dw_app_browse.ScrollToRow( 1 )
		tab_1.tabpage_select.tab_facility.tabpage_apps.dw_app_browse.SelectRow( 1, True )	
		tab_1.tabpage_select.tab_facility.tabpage_apps.dw_app_detail.Retrieve( tab_1.tabpage_select.tab_facility.tabpage_apps.dw_app_browse.GetItemNumber( 1 ,"app_id" ) )
	END IF

END IF

Return 1
end function

public function Long of_test_application ();OpenWithParm( w_check_intelliapp_fields, "SINGLE-" + String( tab_1.tabpage_select.tab_facility.tabpage_apps.dw_app_browse.GetItemNumber( tab_1.tabpage_select.tab_facility.tabpage_apps.dw_app_browse.GetRow( ), "app_id" ) ), w_train_app )

Return 1
end function

public function long of_delete_anno_files ();Long res
Long i

//res = messagebox("","Do you really want to delete all annotation files for this App?",question!,yesno!,2)
 if res = 1 then
	FOR i = 1 TO 100
		FILEDELETE( is_app_path + string(ii_app_id) + "-" + String( i ) + ".ano" )
	END FOR
end if

Return 1
end function

public function Long of_change_org ();Long li_facil
Long li_found

openwithparm( w_app_new_org,ii_facility_id )

li_facil = message.doubleparm

if li_facil < 1 then 
	return -1
else
	ii_facility_id = li_facil
	
end if
	
tab_1.tabpage_select.tab_facility.tabpage_apps.dw_app_detail.setitem( tab_1.tabpage_select.tab_facility.tabpage_apps.dw_app_detail.GetRow(),"facility_id",li_facil)

tab_1.tabpage_select.tab_facility.tabpage_apps.dw_app_detail.update()
commit using tr_training_data;

tab_1.tabpage_select.tab_facility.tabpage_apps.dw_app_browse.retrieve( li_facil )
tab_1.tabpage_select.tab_facility.tabpage_apps.dw_app_browse.setfocus()

li_found  = tab_1.tabpage_select.tab_facility.tabpage_facility.dw_facility_browse.Find( "facility_id = " + String( li_facil ), 1, 1000 )
tab_1.tabpage_select.tab_facility.tabpage_facility.dw_facility_browse.SetRow( li_found )
tab_1.tabpage_select.tab_facility.tabpage_facility.dw_facility_browse.ScrollToRow( li_found )

Return 1
end function

public function Long of_check_row ();
Open( w_iapp_fix_login )

if Lower( Message.StringParm ) = "cancel"  THEN
	return -1
elseIF Lower( Message.StringParm ) = "intelliappfix"  THEN
	Open( w_iapp_find_row )
ELSE
	MessageBox( "Sorry", "Wrong password." )
END IF


Return 1
end function

public function Long of_check_all_apps ();Open( w_check_intelliapp_fields, w_train_app )

Return 1
end function

public function Long of_find ();Long ll_app_id
Long li_facility_id
Long li_found

Open( w_find_app )

IF Message.StringParm = "Cancel" THEN
	Return -1
END IF

li_facility_id = Long( Mid( Message.StringParm, 1, POS( Message.StringParm, "-" ) -1 ) )

ll_app_id = Long( Mid( Message.StringParm, POS( Message.StringParm, "-" ) +1 , 100 ) )

li_found = tab_1.tabpage_select.tab_facility.tabpage_facility.dw_facility_browse.Find( "facility_id = " + String( li_facility_id ) , 1, 100000 )

IF li_found < 1 THEN
	MessageBox("Error", "Could not find facility id" )
	Return -1
END IF

tab_1.tabpage_select.tab_facility.tabpage_facility.dw_facility_browse.SetRow( li_found )
tab_1.tabpage_select.tab_facility.tabpage_facility.dw_facility_browse.ScrollToRow( li_found )
tab_1.tabpage_select.tab_facility.tabpage_facility.dw_facility_browse.TriggerEvent( DoubleClicked! )


li_found = tab_1.tabpage_select.tab_facility.tabpage_apps.dw_app_browse.Find( "app_id = " + String( ll_app_id ) , 1, 100000 )

//messagebox("app_id row", tab_1.tabpage_select.tab_facility.tabpage_apps.dw_app_browse.GetItemNumber( li_found, "app_id" ) )

IF li_found < 1 THEN
	MessageBox("Error", "Could not find App id" )
	Return -1
END IF

tab_1.tabpage_select.tab_facility.tabpage_apps.dw_app_browse.SetRow( li_found )
tab_1.tabpage_select.tab_facility.tabpage_apps.dw_app_browse.ScrollToRow( li_found )


ii_app_id = tab_1.tabpage_select.tab_facility.tabpage_apps.dw_app_browse.GetItemNumber( li_found, "app_id" )
ii_facility_id = tab_1.tabpage_select.tab_facility.tabpage_apps.dw_app_browse.GetItemNumber( li_found, "facility_id" )

of_select_app( )


//tab_1.tabpage_select.tab_facility.tabpage_apps.dw_app_browse.TriggerEvent( DoubleClicked! )


Return 1
end function

public function long of_scan ();boolean lb_exists = false //maha 061708
Long i
Long li_ans
long ll_size //maha 061708

//Start Code Change ----.2008 #V81 maha - slight rearrangement of code added exists trap for store in db
Integer li_image_storage_type

li_image_storage_type = Integer(gnv_data.of_getitem( "icred_settings", "image_storage_type", FALSE))
IF Isnull(li_image_storage_type) THEN li_image_storage_type = 0

IF Upper( AppeonGetClientType() ) <> "PB" OR li_image_storage_type = 1 THEN
	select datalength(app_image) into :ll_size from app_blob;
	if ll_size > 0 then lb_exists = true
else //hard drive
	IF FileExists( is_app_path + String( ii_app_id ) + ".tif")  THEN lb_exists = true
end if

if lb_exists then
	li_ans = MessageBox( "OverWrite", "Are you sure you want to rescan application " + is_app_path + String( ii_app_id ) + ".tif ?", Question!, YesNo!, 1 )
	IF li_ans = 2 THEN
		Return -1
	END IF
END IF


tab_1.tabpage_design.ole_edit.Object.Image = ""
tab_1.tabpage_design.ole_edit.Object.ClearDisplay()

//Added By Ken.Guo 2008-07-11. Workaround Scan bug: First page displayed will be the original page.
tab_1.tabpage_design.uo_preview.ole_edit.Object.Image = ""
tab_1.tabpage_design.uo_preview.ole_edit.Object.ClearDisplay()	


IF FileExists( is_app_path ) OR FileExists( Mid( is_app_path, 1, Len( is_app_path ) -1)) THEN
	//li_ans = MessageBox( "OverWrite", "Are you sure you want to rescan application " + is_app_path + "?", Question!, YesNo!, 1 )
	//IF li_ans = 2 THEN
	//	Return -1
	//END IF
ELSE
	MessageBox("Image Path", "The application image path " + is_app_path + " is invalid.  Go to the Setup->Organization tab and click on the Set Image Path button to set the appropriate Application Image path." )
	Return -1
END IF

IF image_functions.of_Setup_Scan( tab_1.tabpage_design.ole_scan, is_app_path + String(ii_app_id) + ".tif", 1 ) = -1 THEN
	of_Select_App()
	Return -1
END IF


IF Upper( AppeonGetClientType() ) <> "PB" OR li_image_storage_type = 1 THEN
	n_appeon_storage_area lnv_storage_area	
	lnv_storage_area.of_upload_app_image( ii_app_id, is_app_path + String(ii_app_id) + ".tif" )
END IF

//End Code Change---06.17.2008

of_load_image( )

//\/the following appear to be redundant - called in of load image
tab_1.tabpage_design.ole_edit.Object.Page(1)
tab_1.tabpage_design.ole_edit.Object.FitTo(3)
tab_1.tabpage_design.ole_edit.Object.Annotationtype(11)	
tab_1.tabpage_design.ole_edit.Object.Display()
tab_1.tabpage_design.ole_edit.Object.ImageResolutionx( 300 )
tab_1.tabpage_design.ole_edit.Object.ImageResolutionY( 300 )
//\

//Added by Appeon. After you scanning for an new application, if the tables and fields list not appear then retrieve it.
If not tab_1.tabpage_design.dw_screen.Rowcount() > 0 Then of_retrieve_tables_fields()
Return 1


end function

public function long of_blank_page ();Integer li_first_record_number
Integer li_rec_num_incriment
Integer li_new_rec_num
Integer li_old_rec_num
Integer li_ans
Integer li_row_cnt
Integer f
Integer li_last_record_number
Long ll_next_app_field_id
Integer li_goto_page
Integer p
Integer li_count
Integer li_add_page[]
Integer i
Integer li_copy_page
String ls_auto_replicate[]
String ls_additional_info_pages
String ls_page_count
String ls_auto_rep
Long li_insert_after
DataStore ds_field_prop_from
DataStore ds_field_prop_to

if of_check_for_image() = -1 then return -1//maha 031505

Open( w_insert_page )

IF Message.StringParm = "Cancel" THEN
	Return -1
END IF

//This.SetRedraw( False )	 //avoiding screen blinks on web application

li_insert_after = Long( Mid( Message.StringParm, 1, POS( Message.StringParm, "-") -1) ) + 1	
li_copy_page = Long( Mid( Message.StringParm, POS( Message.StringParm, "-")+1, 100) ) 

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 06.08.2006 By: LeiWei
//$<reason> Download image file from database. 
n_appeon_storage_area lnv_storage_area
n_appeon_download lnv_down
string ls_blankpage
ls_blankpage = is_app_path + "\blankpage.tif"
lnv_storage_area.of_retrieve_image_from_db( ii_app_id, is_app_path + String( ii_app_id ) + ".tif" )
if not fileexists(ls_blankpage) Then lnv_down.of_downloadfile("" ,ls_blankpage)
//---------------------------- APPEON END ----------------------------

tab_1.tabpage_design.ole_img_admin.Object.Image( is_app_path + String( ii_app_id ) + ".tif" )

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 07/09/2007 By: Ken.Guo
//$<reason> When Image Admin Merge(Append) file, The first image file must be in TIF format, Otherwise PB will runerror.
If tab_1.tabpage_design.ole_img_admin.Object.pagecount() > 0 and tab_1.tabpage_design.ole_img_admin.Object.FileType <> 1 Then
	Messagebox('Image','The current image file must be in "TIF" format.')
	Return -1			
End If
//---------------------------- APPEON END ----------------------------


IF li_copy_page = 0 THEN
	tab_1.tabpage_design.ole_img_admin.Object.Insert( is_app_path + "\blankpage.tif", 1, li_insert_after , 1 )
ELSE
	//tab_1.tabpage_design.ole_edit.object.Page( ii_current_page  )
	//tab_1.tabpage_design.ole_edit.object.Display()
	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> PT-15
	//$<comment> 04.04.2006 By: Rodger Wu
	//$<reason> Performance Tuning
	//$<reason> Comment out the following script.
	/*
	IF ii_current_page > 1 THEN
		of_prior_page( )
	ELSE
		of_next_page( )
	END IF
	*/
	//---------------------------- APPEON END ----------------------------
	tab_1.tabpage_design.ole_img_admin.Object.Insert( is_app_path + "\" + String( ii_app_id ) + ".tif", li_copy_page, li_insert_after , 1 )
	of_clear_annos_one_page( li_copy_page, li_insert_after )
END IF

ls_page_count = String( tab_1.tabpage_design.ole_edit.Object.PageCount() )

ls_additional_info_pages = tab_1.tabpage_select.tab_facility.tabpage_apps.dw_app_detail.GetItemString( 1, "additional_info_pages" )

IF Len(ls_additional_info_pages) > 0 THEN
	IF Pos( ls_additional_info_pages, "," ) = 0 THEN
		li_add_page[ 1 ] = Integer( ls_additional_info_pages )
		ls_auto_replicate[1] = ""
	ELSE
		DO WHILE TRUE
			li_count++
			ls_auto_replicate[li_count] = ""
			IF Mid( ls_additional_info_pages, 1, 1 ) = "A" THEN
				ls_auto_replicate[ li_count ]  = "A"
				li_add_page[li_count] = Integer( Mid( ls_additional_info_pages, 2, Pos( ls_additional_info_pages, "," ) -1) )
			ELSE		
				ls_auto_replicate[ li_count ]  = ""				
				li_add_page[li_count] = Integer( Mid( ls_additional_info_pages, 1, Pos( ls_additional_info_pages, "," ) -1) )				
			END IF
			ls_additional_info_pages = Mid( ls_additional_info_pages, Pos( ls_additional_info_pages, "," ) +1, 1000 )				
			IF Pos( ls_additional_info_pages, "," ) = 0 THEN
				li_count++				
				IF Mid( ls_additional_info_pages, 1, 1 ) = "A" THEN
					ls_auto_replicate[ li_count ]  = "A"
					li_add_page[li_count] = Integer( Mid( ls_additional_info_pages, 2, 10))
				ELSE
					ls_auto_replicate[ li_count ]  = ""				
					li_add_page[li_count] = Integer( ls_additional_info_pages )					
				END IF
				Exit
			END IF
		LOOP
	END IF	
	
	FOR p = 1 TO UpperBound( li_add_page )
		IF li_add_page[p] >= li_insert_after THEN
			li_add_page[p]++
		END IF
	END FOR
	
	ls_additional_info_pages = ""	
	FOR p = 1 TO UpperBound( li_add_page )
		ls_additional_info_pages = ls_additional_info_pages + ls_auto_replicate[P] + String(li_add_page[p]) + ","
	END FOR
	
	ls_additional_info_pages = Mid( ls_additional_info_pages, 1, Len(ls_additional_info_pages) -1 )
	
	ls_additional_info_pages = ls_additional_info_pages + "," + ls_auto_rep + String( li_insert_after ) 
ELSE
	ls_additional_info_pages = ls_auto_rep + String( li_insert_after )
END IF

tab_1.tabpage_select.tab_facility.tabpage_apps.dw_app_detail.SetItem( 1, "additional_info_pages", ls_additional_info_pages )
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-16
//$<add> 04.04.2006 By: Rodger Wu
//$<reason> Performance Tuning 
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

/*
UPDATE app_field_prop
SET page = page + 1
WHERE app_id = :ii_app_id AND
      page >= :li_insert_after
USING tr_training_data;
IF tr_training_data.SQLCODE = -1 THEN
	MessageBox( "SQL Error", tr_training_data.SQLERRTEXT )
	Return -1
END IF

UPDATE app_hdr
SET additional_info_pages = :ls_additional_info_pages
WHERE app_id = :ii_app_id
USING tr_training_data;
IF tr_training_data.SQLCODE = -1 THEN
	MessageBox( "SQL Error", tr_training_data.SQLERRTEXT )
	Return -1
END IF
*/
gnv_appeondb.of_StartQueue()
UPDATE app_field_prop
SET page = page + 1
WHERE app_id = :ii_app_id AND
      page >= :li_insert_after
USING tr_training_data;
IF tr_training_data.SQLCODE = -1 THEN
	MessageBox( "SQL Error", tr_training_data.SQLERRTEXT )
	gnv_appeondb.of_CommitQueue()
	Return -1
END IF

UPDATE app_hdr
SET additional_info_pages = :ls_additional_info_pages
WHERE app_id = :ii_app_id
USING tr_training_data;
IF tr_training_data.SQLCODE = -1 THEN
	MessageBox( "SQL Error", tr_training_data.SQLERRTEXT )
	gnv_appeondb.of_CommitQueue()
	Return -1
END IF
gnv_appeondb.of_CommitQueue()
//---------------------------- APPEON END ----------------------------

FOR i = li_insert_after TO 100
	FILEDELETE( is_app_path + string(ii_app_id) + "-" + String( i ) + ".ano" )
END FOR

IF li_copy_page > 0 THEN
	ds_field_prop_from = CREATE DataStore;
	ds_field_prop_to = CREATE DataStore;

	ds_field_prop_from.DataObject = "d_app_field_properties_copy"
	ds_field_prop_from.SetTransObject( SQLCA )
	
	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> PT-17
	//$<add> 04.04.2006 By: Rodger Wu
	//$<reason> Performance Tuning 
	//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

	/*
	ds_field_prop_from.Retrieve( ii_app_id, li_copy_page )

	ds_field_prop_to.DataObject = "d_app_field_properties_copy"
	ds_field_prop_to.SetTransObject( SQLCA )

	ds_field_prop_from.RowsCopy( 1, 10000, Primary!, ds_field_prop_to, 1, Primary! )

	SELECT Max( record_number ), Min( record_number ) 
	INTO :li_last_record_number, :li_first_record_number
	FROM app_field_prop
	WHERE app_id = :ii_app_id AND
   	   page = :li_copy_page
	USING tr_training_data;
	IF tr_training_data.SQLCODE = -1 THEN
		MessageBox( "SQL Error", tr_training_data.SQLERRTEXT )
		Return -1
	END IF

	SELECT Max( app_field_id )
	INTO :ll_next_app_field_id
	FROM app_field_prop
	USING tr_training_data;
	IF tr_training_data.SQLCODE = -1 THEN
		MessageBox( "SQL Error", tr_training_data.SQLERRTEXT )
		Return -1
	END IF
	*/
	gnv_appeondb.of_StartQueue()
	ds_field_prop_from.Retrieve( ii_app_id, li_copy_page )

	SELECT Max( record_number ), Min( record_number ) 
	INTO :li_last_record_number, :li_first_record_number
	FROM app_field_prop
	WHERE app_id = :ii_app_id AND
   	   page = :li_copy_page
	USING tr_training_data;
	IF tr_training_data.SQLCODE = -1 THEN
		MessageBox( "SQL Error", tr_training_data.SQLERRTEXT )
		gnv_appeondb.of_CommitQueue()
		//--------------------------- APPEON BEGIN ---------------------------
		//$<Add> 08.23.2007 By: Evan
		//$<Reason> Need to destroy object.
		if IsValid(ds_field_prop_from) then Destroy ds_field_prop_from
		if IsValid(ds_field_prop_to) then Destroy ds_field_prop_to
		//---------------------------- APPEON END ----------------------------		
		Return -1
	END IF

	SELECT Max( app_field_id )
	INTO :ll_next_app_field_id
	FROM app_field_prop
	USING tr_training_data;
	IF tr_training_data.SQLCODE = -1 THEN
		MessageBox( "SQL Error", tr_training_data.SQLERRTEXT )
		gnv_appeondb.of_CommitQueue()
		//--------------------------- APPEON BEGIN ---------------------------
		//$<Add> 08.23.2007 By: Evan
		//$<Reason> Need to destroy object.
		if IsValid(ds_field_prop_from) then Destroy ds_field_prop_from
		if IsValid(ds_field_prop_to) then Destroy ds_field_prop_to
		//---------------------------- APPEON END ----------------------------		
		Return -1
	END IF
	gnv_appeondb.of_CommitQueue()
	
	ds_field_prop_to.DataObject = "d_app_field_properties_copy"
	ds_field_prop_to.SetTransObject( SQLCA )

	ds_field_prop_from.RowsCopy( 1, 10000, Primary!, ds_field_prop_to, 1, Primary! )
	
	//---------------------------- APPEON END ----------------------------
	li_ans = MessageBox( "Record Number", "The maximum record number on the page you are copying is " + String( li_last_record_number ) + " Would you like to start the record numbers for the new page at " + String( li_last_record_number +1 ), Question!, YesNo!, 1 )

	li_rec_num_incriment =  li_last_record_number - li_first_record_number

	li_row_cnt = ds_field_prop_to.RowCount( )
	FOR f = 1 TO li_row_cnt
		ll_next_app_field_id++
		ds_field_prop_to.SetItem( f, "app_field_id", ll_next_app_field_id )
		ds_field_prop_to.SetItem( f, "page", li_insert_after )
		IF li_ans = 1 THEN
			li_old_rec_num = ds_field_prop_to.GetItemNumber( f, "record_number" )
			li_new_rec_num = li_old_rec_num + li_rec_num_incriment + 1
			ds_field_prop_to.SetItem( f, "record_number", li_new_rec_num )			
		END IF
	END FOR

	ds_field_prop_to.Update( )
	
END IF

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-18
//$<comment> 04.04.2006 By: Rodger Wu
//$<reason> Performance Tuning
//$<reason> Comment out following redundant script lines.
/*
IF ii_current_page > 1 THEN
	IF ii_current_page > 1 THEN
		of_next_page( )
	ELSE
		of_prior_page( )	
	END IF

END IF
*/
//---------------------------- APPEON END ----------------------------

//This.SetRedraw( True )	//avoiding screen blinks on web application

st_page_num.Text = "Page " + String( ii_current_page ) + " Of " + String( tab_1.tabpage_design.ole_edit.Object.PageCount() )

//--------------------------- APPEON BEGIN ---------------------------
//$<Add> 08.23.2007 By: Evan
//$<Reason> Need to destroy object.
if IsValid(ds_field_prop_from) then Destroy ds_field_prop_from
if IsValid(ds_field_prop_to) then Destroy ds_field_prop_to
//---------------------------- APPEON END ----------------------------

Return 1



end function

public function Long of_additional_info ();Open( w_get_additional_info_pages )

Return 1
end function

public function long of_straighten_page ();if of_check_for_image() = -1 then return -1//maha 031505

tab_1.tabpage_design.ole_edit.object.ManualDeSkew()

Return 1
end function

public function long of_special_fields ();if of_check_for_image() = -1 then return -1//maha 031505

Open( w_special_fields )
w_special_fields.io_image_edit = tab_1.tabpage_design.ole_edit	

Return 1
end function

public function Long of_field_exceptions ();OpenWithParm( w_field_exceptions, String( ii_app_id ) )

Return 1
end function

public function long of_page_properties ();if of_check_for_image() = -1 then return -1//maha 031505

tab_1.tabpage_design.ole_edit.Object.ShowPageProperties( False )

Return 1
end function

public function long of_preview (string as_type);Long li_current_page
Long li_page_cnt
String ls_prac_id
String ls_facility_id
string ls_page_from
string ls_page_to
string ls_prac
integer p1
integer p2
integer p3

if of_check_for_image() = -1 then return -1//maha 031505
//debugbreak()
st_page_num.Visible = False		
//st_field_name.Visible = False
of_field_name_visible( )

if as_type = "Page" then //maha 042604 
	ls_prac = "D"
else //modified maha 082205 to strip parameters correctly
	p1 = pos(as_type,"@",1)
	p2 = pos(as_type,"@",p1 + 1)
	p3 = pos(as_type,"@",p2 + 1)
	ls_page_from = mid(as_type,1,p1 - 1)
	ls_page_to = mid(as_type,p1 + 1,p2 - p1 - 1)
	ls_prac = mid(as_type,p2 + 1,p3 - p2 - 1)
//	ls_prac = mid(as_type,5,1)
//	ls_page_from = mid(as_type,1,1)
//	ls_page_to = mid(as_type,3,1)
end if
//messagebox("",ls_prac)
//return 1 
ls_prac_id = ProfileString(gs_IniFilePathName, "Setup", "default_practitioner", "None")
ls_facility_id = ProfileString(gs_IniFilePathName, "Setup", "default_parent_facility", "None")
IF ls_prac_id = "" or ls_prac <> "D" THEN //maha mod 042604
	tab_1.tabpage_design.uo_preview.of_populate( )
ELSE
	tab_1.tabpage_design.uo_preview.ii_prac_id = Long( ls_prac_id )
	gi_parent_facility = Long( ls_facility_id )	
END IF

tab_1.tabpage_design.uo_preview.ole_edit.Object.HideAnnotationGroup()

IF as_type = "Page" THEN
	li_current_page = tab_1.tabpage_design.ole_edit.object.Page()
	tab_1.tabpage_design.uo_preview.of_setup( ii_app_id, li_current_page, li_current_page, gi_parent_facility )	
ELSE
	if ls_page_from = "D" then ls_page_from = "1" //maha mod 042604  else use
	li_page_cnt = tab_1.tabpage_design.ole_edit.object.PageCount()
	if ls_page_to = "D" then 
		//use the default count of li_page_cnt
	else
		if integer(ls_page_to) <= li_page_cnt then //maha corrected 070904 was using page from value
			li_page_cnt = integer(ls_page_to)
		end if
	end if
		
	tab_1.tabpage_design.uo_preview.of_setup( ii_app_id, integer(ls_page_from), li_page_cnt, gi_parent_facility )		
END IF

Return 1
end function

public function Long of_set_default_preview_prac ();
tab_1.tabpage_design.uo_preview.of_set_default_preview_prac( )


Return 1
end function

public function Long of_next_preview_page ();
Tab_1.Tabpage_design.uo_preview.of_Next_page( )

Return 1
end function

public function Long of_prior_preview_page ();Tab_1.Tabpage_design.uo_preview.of_Prior_page( )

Return 1
end function

public function long of_setup_align ();if of_check_for_image() = -1 then return -1//maha 031505

String ls_dummy[]
is_selected_fields[] = ls_dummy
ii_ancor_count = 0
ii_connect_fields = 0
tab_1.tabpage_design.ole_edit.Object.SelectAnnotationGroup( "" )	
IF ii_align = 0 THEN
	ii_align = 1
	IF ib_auto_align_all = True THEN
		st_align.Visible = False
	ELSE
		st_align.Visible = True		
	END IF
ELSE
	ii_align = 0
	st_align.Visible = False
END IF


Return 1
end function

public function long of_setup_connect_field ();if of_check_for_image() = -1 then return -1//maha 031505

String ls_dummy[]
ii_ancor_count = 0
is_selected_fields = ls_dummy
tab_1.tabpage_design.ole_edit.Object.SelectAnnotationGroup( "" )

IF ii_connect_fields = 0 THEN
	ii_connect_fields = 1
	st_connect.Visible = True
ELSE
	ii_connect_fields = 0
	st_connect.Visible = False	
END IF

Return 1
end function

public function long of_connect_field ();Long li_next_id  
Long li_selected_cnt
Long i
Long ll_field_id

if of_check_for_image() = -1 then return -1//maha 031505

SELECT Max( connect_field_id )  
INTO :li_next_id  
FROM app_field_prop 
WHERE app_id = :ii_app_id
USING tr_training_data;

li_next_id++

li_selected_cnt = UpperBound( is_selected_fields )

IF li_next_id = 0 or IsNull( li_next_id ) THEN
	li_next_id = 1
END IF

if gi_test_mode = 1 then
	messagebox("Field count",li_selected_cnt)
end if

FOR i = 1 TO li_selected_cnt
	
	IF Upper(Right( is_selected_fields[i], 6 )) = "YESBOX" THEN
		ii_app_field_id = long( Mid( is_selected_fields[i], 1, Len( is_selected_fields[i] ) - 6) )
	ELSEIF Upper(Right( is_selected_fields[i], 5 )) = "NOBOX" THEN
		ii_app_field_id = long( Mid( is_selected_fields[i], 1, Len( is_selected_fields[i] ) - 5) )	
	ELSE
		ii_app_field_id = long( is_selected_fields[i] )
	END IF		

	Update app_field_prop
	Set connect_field_id = :li_next_id,
		 connect_field_sort = :i
	WHERE app_field_id = :ii_app_field_id
	USING tr_training_data;
	IF tr_training_data.SQLCODE = -1 THEN
		MessageBox( "Error", tr_training_data.SQLERRTEXT )
		Return 0
	END IF
	
END FOR

of_setup_connect_field()

w_mdi.SetToolbar( 5, False, Floating!)		
w_mdi.SetToolbarPos( 5, 75, 400, 100, 1)

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> UM-08
//$<add> 01.13.2006 By: Rodger Wu
//$<reason> The SetToolbarPos function is currently unsupported. 
//$<modification> Replace the SetToolBarPos function with the Appeon defined function of_settoolbarpos to provide
//$<modification> the same functionality.
If appeongetclienttype() <> 'PB' Then
	long ll_handle
	ll_handle = handle(w_mdi)
	gnv_appeondll.of_settoolbarpos(ll_handle)
	gnv_appeondll.of_SetToolbar( ll_handle , 5, False)		
End If
//---------------------------- APPEON END ----------------------------

Return 1
end function

public function long of_select_field_info ();DataWindowChild dwchild
Long li_table_id
String ls_tbl_nm
String ls_lookup_link_type
String ls_fld_desc
String ls_lookup_link_field

IF w_train_app.ii_align  = 0 THEN
	li_table_id = tab_1.tabpage_design.dw_fld_prop.GetItemNumber( 1, "table_id" )
	tab_1.tabpage_design.dw_fld_prop.GetChild( "query_field", dwchild )
	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> PT-19
	//$<modify> 04.04.2006 By: Rodger Wu
	//$<reason> Performance Tuning 
	//$<modification> Write script to retrieve data from a cache instead of from the database.

	/*
	dwchild.SetTransObject( w_train_app.tr_training_data )
	dwchild.Retrieve( li_table_id )
	*/
	dwchild.Reset()
	ids_queryfield.RowsCopy( 1, ids_queryfield.rowcount(), Primary!, dwchild, 1, Primary! )
	//---------------------------- APPEON END ----------------------------
END IF

is_fld_nm = tab_1.tabpage_design.dw_fld_prop.GetItemString( 1, "field_name" )
ls_tbl_nm = tab_1.tabpage_design.dw_fld_prop.GetItemString( 1, "table_name" )
ls_fld_desc = tab_1.tabpage_design.dw_fld_prop.GetItemString( 1, "field_description" )
ls_lookup_link_field = tab_1.tabpage_design.dw_fld_prop.GetItemString( 1, "lookup_link_field" )
ls_lookup_link_type = tab_1.tabpage_design.dw_fld_prop.GetItemString( 1, "lookup_link_type" )



IF IsNull( ls_lookup_link_field ) OR ls_lookup_link_field = "" THEN
		st_field_name.Text =  ls_tbl_nm + ">" + is_fld_nm
ELSE
	IF ls_lookup_link_type = "C" THEN
		st_field_name.Text =  ls_tbl_nm + ">" + is_fld_nm + "->" + ls_lookup_link_field
	ELSE
		st_field_name.Text =  ls_tbl_nm + ">" + ls_lookup_link_field
	END IF
END IF

Return 1

end function

public function Long of_print_preview_app ();tab_1.tabpage_design.uo_preview.of_Print( )

Return 1
end function

public function Long of_prac_search ();Long li_current_page

//tab_1.TabPage_design.uo_preview.of_prac_search()
tab_1.tabpage_design.uo_preview.of_populate( )
li_current_page = tab_1.tabpage_design.ole_edit.object.Page()
tab_1.tabpage_design.uo_preview.of_setup( ii_app_id, li_current_page, li_current_page, gi_parent_facility )	

Return 0
end function

public function long of_retrieve_end ();Long i
Long l
Long li_nr
Long rowcount
Long li_rc
String ls_address_fields[]
String ls_code_fields[]


IF NOT ib_hold_on_retrieve_end THEN
//Start Code Change ---- 02.21.2006 #279 maha	
if tab_1.tabpage_design.dw_field.rowcount() < 1 then return 0 
//End Code Change---02.21.2006

IF tab_1.tabpage_design.dw_field.GetItemNumber( 1, "table_id" ) = 25 AND ib_personal_data = False THEN //personal data
	tab_1.tabpage_design.dw_field.SetFilter("(field_id >= 298 and field_id <= 319) or (field_id >= 325 and field_id <= 329)")
	tab_1.tabpage_design.dw_field.Filter( )
	li_rc = tab_1.tabpage_design.dw_field.RowCount( )
	FOR i = 1 TO li_rc
		tab_1.tabpage_design.dw_field.DeleteRow( 1 )
	END FOR
	tab_1.tabpage_design.dw_field.SetFilter("")
	tab_1.tabpage_design.dw_field.Filter( )		
ELSEIF ib_personal_data THEN //basic info
	tab_1.tabpage_design.dw_field.SetFilter("(field_id < 298 or (field_id >= 320 and field_id <= 324))")
	
	tab_1.tabpage_design.dw_field.Filter( )
	li_rc = tab_1.tabpage_design.dw_field.RowCount( )
	FOR i = 1 TO li_rc
		tab_1.tabpage_design.dw_field.DeleteRow( 1 )
	END FOR
	tab_1.tabpage_design.dw_field.SetFilter("")
	tab_1.tabpage_design.dw_field.Filter( )		
END IF


ls_code_fields[2] = "Code"
ls_code_fields[1] = "Description"
//to add additional fields from the lookup table add the field name with the appropriate array number.  
//In the code below up the array count
//also in of_select_button add the new field to the case list
ls_address_fields[11] = "Entity_Name"
ls_address_fields[10] = "Street1"
ls_address_fields[9] = "Street2"
ls_address_fields[8] = "City"
ls_address_fields[7] = "State"
ls_address_fields[6] = "Zip"
ls_address_fields[5] = "Country"
ls_address_fields[4] = "Phone"
ls_address_fields[3] = "Fax"
ls_address_fields[2] = "Contact_Name"
ls_address_fields[1] = "Email_Address"  //Start Code Change ----08.20.2008 #V85 maha

rowcount = tab_1.tabpage_design.dw_field.RowCount()

FOR i = 1 TO rowcount
	IF tab_1.tabpage_design.dw_field.GetItemString( i, "lookup_type" ) = "A" THEN
		FOR l = 1 TO 11 //array count
			li_nr = tab_1.tabpage_design.dw_field.InsertRow( i + 1)
			rowcount = rowcount + 1
			tab_1.tabpage_design.dw_field.SetItem( li_nr, "parent_field", tab_1.tabpage_design.dw_field.GetItemNumber( i, "field_id" ))
			tab_1.tabpage_design.dw_field.SetItem( li_nr, "field_name_allias", ls_address_fields[l] )
			tab_1.tabpage_design.dw_field.SetItem( li_nr, "field_type", "AL" )
			tab_1.tabpage_design.dw_field.SetItem( li_nr, "field_id", tab_1.tabpage_design.dw_field.GetItemNumber( i, "field_id" )) 
			tab_1.tabpage_design.dw_field.SetItem( li_nr, "table_id", tab_1.tabpage_design.dw_field.GetItemNumber( i, "table_id" )) 			
		END FOR

		//JAD 08/06 CAQH CODE
		li_nr = tab_1.tabpage_design.dw_field.InsertRow( i + 11 ) //array count plus 1
		rowcount = rowcount + 1
		tab_1.tabpage_design.dw_field.SetItem( li_nr, "parent_field", tab_1.tabpage_design.dw_field.GetItemNumber( i, "field_id" ))
		tab_1.tabpage_design.dw_field.SetItem( li_nr, "field_name_allias", "CAQH_Code" )
		tab_1.tabpage_design.dw_field.SetItem( li_nr, "field_type", "AL" )
		tab_1.tabpage_design.dw_field.SetItem( li_nr, "field_id", tab_1.tabpage_design.dw_field.GetItemNumber( i, "field_id" )) 
		tab_1.tabpage_design.dw_field.SetItem( li_nr, "table_id", tab_1.tabpage_design.dw_field.GetItemNumber( i, "table_id" )) 			
		
	ELSEIF tab_1.tabpage_design.dw_field.GetItemString( i, "lookup_type" ) = "C" THEN
		FOR l = 1 TO 2
			li_nr = tab_1.tabpage_design.dw_field.InsertRow( i + 1)
			rowcount = rowcount + 1
			tab_1.tabpage_design.dw_field.SetItem( li_nr, "parent_field", tab_1.tabpage_design.dw_field.GetItemNumber( i, "field_id" ))
			tab_1.tabpage_design.dw_field.SetItem( li_nr, "field_name_allias", ls_code_fields[l] )
			tab_1.tabpage_design.dw_field.SetItem( li_nr, "field_type", "CL" )
			tab_1.tabpage_design.dw_field.SetItem( li_nr, "field_id", tab_1.tabpage_design.dw_field.GetItemNumber( i, "field_id" )) 
			tab_1.tabpage_design.dw_field.SetItem( li_nr, "table_id", tab_1.tabpage_design.dw_field.GetItemNumber( i, "table_id" )) 
		END FOR		
		
		//JAD 08/06 CAQH CODE
		li_nr = tab_1.tabpage_design.dw_field.InsertRow( i + 3 ) 
		rowcount = rowcount + 1
		tab_1.tabpage_design.dw_field.SetItem( li_nr, "parent_field", tab_1.tabpage_design.dw_field.GetItemNumber( i, "field_id" ))
		tab_1.tabpage_design.dw_field.SetItem( li_nr, "field_name_allias", "CAQH_Code" ) //Start Code Change ---- 02.23.2007 #V7 maha
		tab_1.tabpage_design.dw_field.SetItem( li_nr, "field_type", "CL" )
		tab_1.tabpage_design.dw_field.SetItem( li_nr, "field_id", tab_1.tabpage_design.dw_field.GetItemNumber( i, "field_id" )) 
		tab_1.tabpage_design.dw_field.SetItem( li_nr, "table_id", tab_1.tabpage_design.dw_field.GetItemNumber( i, "table_id" )) 			
		
	END IF
END FOR

IF rowcount > 0 THEN
	tab_1.tabpage_design.dw_field.SetRow( 1 )
	tab_1.tabpage_design.dw_field.SelectRow( 1, True )
END IF

END IF

RETURN 0
end function

public function long of_goto_page ();//Parent.SetRedraw( False )
String	ls_Rtn
Long 		li_goto_page

Open( w_goto_page )


li_goto_page = Long( Message.StringParm )

if li_goto_page < 1 then return 0


tab_1.tabpage_design.ole_edit.Object.SelectAnnotationGroup( "" )
IF tab_1.tabpage_design.ole_edit.Object.PageCount() >= li_goto_page THEN
	ii_current_page = li_goto_page
	//--------------------------- APPEON BEGIN ---------------------------
	//$< Add  > 2008-07-17 By: Scofield
	//$<Reason> Verify if the directory has write right for the current user.
	
	ls_Rtn = f_ExaWriteRight(tab_1.tabpage_design.ole_edit.Object.Image)
	if Len(ls_Rtn) > 0 then
		MessageBox(gnv_app.iapp_object.DisplayName,ls_Rtn,Exclamation!)
		Return -1
	end if
	//---------------------------- APPEON END ----------------------------
	tab_1.tabpage_design.ole_edit.Object.Save()
	COMMIT USING tr_training_data;
	tab_1.tabpage_design.ole_edit.object.Page( ii_current_page  )
	tab_1.tabpage_design.ole_edit.object.Display()
	of_load_annotations()	
	IF ii_current_page > 1 THEN
		gnv_app.of_modify_menu_attr( m_pfe_train_app.m_view.m_priorpage,'enabled', True)
	END IF
	IF ii_current_page = 1 THEN
		gnv_app.of_modify_menu_attr( m_pfe_train_app.m_view.m_priorpage,'enabled', False)
	END IF
	IF ii_current_page = tab_1.tabpage_design.ole_edit.Object.PageCount() THEN
		gnv_app.of_modify_menu_attr( m_pfe_train_app.m_view.m_nextpage,'enabled', False)
	ELSE
		gnv_app.of_modify_menu_attr( m_pfe_train_app.m_view.m_nextpage,'enabled', True)		
	END IF
	st_page_num.Text = "Page " + String( ii_current_page ) + " Of " + String( tab_1.tabpage_design.ole_edit.Object.PageCount() )	
ELSE
	MessageBox( "Invalid Page", "Invalid Page Number." )
END IF

Return 0

end function

public function long of_create_annotations (long ai_field_id);Long li_cnt

if of_check_for_image() = -1 then return -1//maha 031505

w_train_app.tab_1.tabpage_design.st_field.Text = "Loading application page, please wait."

IF NOT ib_placing_template THEN
	tab_1.tabpage_design.uo_bar.Visible = True
END IF

IF ai_field_id > 0 THEN
	ib_loading_annotations = False
ELSE
	ib_loading_annotations = True
END IF

//tab_1.tabpage_design.ole_edit.SetRedraw( False ) //avoiding screen blinks

tab_1.tabpage_design.uo_bar.r_bar.Width = 0

String ls_label_data
String ls_field_description
String ls_object_type
String ls_field_type
String ls_lookup_link_type
String ls_group_nm
String ls_fld_desc
String ls_lookup_link_field
String ls_fld_display
String ls_font_type
Long ll_width
Long ll_height
Long ll_field_id
Long ll_table_id
Long li_field_len
long li_app_field_id //modified 071802 maha
String ls_fld_nm
String ls_tbl_nm
n_ds ds_field_properties
long li_fld_cnt
Long li_x_pos
Long li_y_pos
Long li_fld_loop
Long li_prev_scrollY
Long li_prev_scrollX
Long li_step


li_prev_scrollY = tab_1.tabpage_design.ole_edit.object.ScrollPositionY( )
li_prev_scrollX = tab_1.tabpage_design.ole_edit.object.ScrollPositionX( )

tab_1.tabpage_design.ole_edit.object.ScrollPositionX( 0 )		
tab_1.tabpage_design.ole_edit.object.ScrollPositionY( 0 )			

ds_field_properties = CREATE n_ds
ds_field_properties.DataObject = "d_app_field_properties_all"
ds_field_properties.SetTransObject( tr_training_data )
li_fld_cnt = ds_field_properties.Retrieve( ii_app_id, ii_current_page )

IF ai_field_id > 0 THEN
	ds_field_properties.SetFilter( "app_field_id = " + String( ai_field_id ) )
	ds_field_properties.Filter()
	li_fld_cnt = 	ds_field_properties.RowCount( )
END IF

IF li_fld_cnt = 0 THEN
	ib_loading_annotations = False
	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> UM-09
	//$<modify> 01.13.2006 By: Wang Chao
	//$<reason> The GOTO statement is currently unsupported.
	//$<modification> Encapsualte the script associated with the label into of_cleanup,
	//$<modification> and call of_cleanup to provide the same functionaltiy.
	
	//GOTO cleanup
	Return of_cleanup(li_prev_scrollX,li_prev_scrollY)
	//---------------------------- APPEON END ----------------------------	
END IF

li_step = (( 1000 )/li_fld_cnt) 

FOR li_fld_loop = 1 TO li_fld_cnt
	ls_object_type = ds_field_properties.GetItemString( li_fld_loop, "object_type" )
	li_app_field_id = ds_field_properties.GetItemNumber( li_fld_loop, "app_field_id" )
	li_field_len = ds_field_properties.GetItemNumber( li_fld_loop, "width" )
	li_x_pos = ds_field_properties.GetItemNumber( li_fld_loop, "x_pos" )
	li_y_pos = ds_field_properties.GetItemNumber( li_fld_loop, "y_pos" )
	ll_field_id = ds_field_properties.GetItemNumber( li_fld_loop, "field_id" )	
	ll_table_id = ds_field_properties.GetItemNumber( li_fld_loop, "table_id" )	
	ll_width = ds_field_properties.GetItemNumber( li_fld_loop, "box_width" )	
	ll_height = ds_field_properties.GetItemNumber( li_fld_loop, "box_height" )		
	ls_field_description = ds_field_properties.GetItemString( li_fld_loop, "field_description" )
		
		
	IF ll_table_id = 99 THEN
		CHOOSE CASE Upper( ls_field_description )
			CASE "TODAYS DATE"
				tab_1.tabpage_design.ole_edit.Object.AddAnnotationGroup( "SP-TODAYSDATE," + String( li_app_field_id ) )		
				tab_1.tabpage_design.ole_edit.Object.AnnotationStampText( "MM/DD/YYYY" )		
			CASE "CURRENT TIME"
				tab_1.tabpage_design.ole_edit.Object.AddAnnotationGroup( "SP-CURRENTTIME," + String( li_app_field_id ))				
				tab_1.tabpage_design.ole_edit.Object.AnnotationStampText( "HH:MMa" )		
			CASE "USER ID"
				tab_1.tabpage_design.ole_edit.Object.AddAnnotationGroup( "SP-USERID," + String( li_app_field_id ))		
				tab_1.tabpage_design.ole_edit.Object.AnnotationStampText( "XXXXXXXXXX" )		
		END CHOOSE
		
		IF Mid( Upper ( ls_field_description ), 1, 5 ) = "LABEL" THEN
			ls_label_data =  Mid( ls_field_description, 7, 100 ) 
			tab_1.tabpage_design.ole_edit.Object.AddAnnotationGroup( "LABEL-" + Mid(ls_label_data, 1, 5 ) + ";" + String( li_app_field_id ))
			tab_1.tabpage_design.ole_edit.Object.AnnotationStampText( ls_label_data  )		
		ELSEIF Upper( ls_field_description) = "RECTANGLE" THEN
			tab_1.tabpage_design.ole_edit.Object.AddAnnotationGroup( "Rectangle," + String( li_app_field_id ))		
			tab_1.tabpage_design.ole_edit.object.Annotationtype(4)		
			tab_1.tabpage_design.ole_edit.object.Draw( li_x_pos, li_y_pos, ll_width, ll_height )				
			tab_1.tabpage_design.ole_edit.object.SetSelectedAnnotationFillColor( 8454143 )			
			CONTINUE
		ELSEIF Upper( ls_field_description) = "HOLLOWRECTANGLE" THEN
			tab_1.tabpage_design.ole_edit.Object.AddAnnotationGroup( "HollowRectangle," + String( li_app_field_id ))		
			tab_1.tabpage_design.ole_edit.object.Annotationtype(3)		
			tab_1.tabpage_design.ole_edit.object.Draw( li_x_pos, li_y_pos, ll_width, ll_height )				
			CONTINUE			
		END IF
	
		tab_1.tabpage_design.ole_edit.object.AnnotationFontColor(255)
		tab_1.tabpage_design.ole_edit.object.Annotationtype(8)		
		CHOOSE CASE ds_field_properties.GetItemNumber( li_fld_loop, "font_size" )
			CASE 1
				tab_1.tabpage_design.ole_edit.object.AnnotationFont.Name = "MS Serif"
				tab_1.tabpage_design.ole_edit.object.AnnotationFont.Size = 7
			CASE 2
				tab_1.tabpage_design.ole_edit.object.AnnotationFont.Name = "Times New Roman"
				tab_1.tabpage_design.ole_edit.object.AnnotationFont.Size = 8				
			CASE 3
				tab_1.tabpage_design.ole_edit.object.AnnotationFont.Name = "Times New Roman"
				tab_1.tabpage_design.ole_edit.object.AnnotationFont.Size = 12			
		END CHOOSE
		IF ds_field_properties.GetItemNumber( li_fld_loop, "font_bold" ) = 1 THEN
			tab_1.tabpage_design.ole_edit.object.AnnotationFont.Bold = True
		ELSE
			tab_1.tabpage_design.ole_edit.object.AnnotationFont.Bold = False
		END IF
		tab_1.tabpage_design.ole_edit.object.Draw(li_x_pos, li_y_pos, 0, 0)	
		CONTINUE
	END IF
	
	//w_train_app.tab_1.tabpage_design.st_field.Text = ls_tbl_nm + "->" + ls_fld_nm
	CHOOSE CASE ls_object_type
		CASE "T"
			ls_field_type = ds_field_properties.GetItemString( li_fld_loop, "sys_fields_field_type" )
			ls_lookup_link_type = ds_field_properties.GetItemString( li_fld_loop, "lookup_link_type" )
			ls_lookup_link_field = ds_field_properties.GetItemString( li_fld_loop, "lookup_link_field" )
			IF ls_lookup_link_type = "A" OR ls_lookup_link_type = "C" THEN
				ls_field_type = "C"			
			END IF
		CHOOSE CASE Upper( ls_field_type )
			CASE "C"
				ls_fld_display = Fill( "x", li_field_len )
			CASE "I"
				ls_fld_display = Fill( "#", li_field_len )				
			CASE "D"
				ls_fld_display = "mm/dd/yyyy"
			CASE "N"
				ls_fld_display = Fill( "#", li_field_len )								
		END CHOOSE
					
		tab_1.tabpage_design.ole_edit.Object.AddAnnotationGroup( String(li_app_field_id) )
		tab_1.tabpage_design.ole_edit.object.AnnotationStampText( ls_fld_display )
		tab_1.tabpage_design.ole_edit.object.AnnotationFontColor(255)
		tab_1.tabpage_design.ole_edit.object.Annotationtype(8)		
		CHOOSE CASE ds_field_properties.GetItemNumber( li_fld_loop, "font_size" )
			CASE 1
				tab_1.tabpage_design.ole_edit.object.AnnotationFont.Name = "MS Serif"
				tab_1.tabpage_design.ole_edit.object.AnnotationFont.Size = 7
			CASE 2
				tab_1.tabpage_design.ole_edit.object.AnnotationFont.Name = "Times New Roman"
				tab_1.tabpage_design.ole_edit.object.AnnotationFont.Size = 8				
			CASE 3
				tab_1.tabpage_design.ole_edit.object.AnnotationFont.Name = "Times New Roman"
				tab_1.tabpage_design.ole_edit.object.AnnotationFont.Size = 12			
		END CHOOSE
		IF ds_field_properties.GetItemNumber( li_fld_loop, "font_bold" ) = 1 THEN
			tab_1.tabpage_design.ole_edit.object.AnnotationFont.Bold = True
		ELSE
			tab_1.tabpage_design.ole_edit.object.AnnotationFont.Bold = False
		END IF
		tab_1.tabpage_design.ole_edit.object.Draw(li_x_pos, li_y_pos, 0, 0)
		tab_1.tabpage_design.ole_edit.object.Annotationtype(11)	
	CASE "B"
		tab_1.tabpage_design.ole_edit.Object.AddAnnotationGroup( ds_field_properties.GetItemNumber( ds_field_properties.GetRow(), "field_id" ) )
		tab_1.tabpage_design.ole_edit.object.Annotationtype(3)
		tab_1.tabpage_design.ole_edit.object.Draw(li_x_pos, li_y_pos, 20,20)
		tab_1.tabpage_design.ole_edit.object.Annotationtype(11)			
	CASE "Y1"
		//yes box
		tab_1.tabpage_design.ole_edit.Object.AddAnnotationGroup( String(li_app_field_id) + "YesBox")
		tab_1.tabpage_design.ole_edit.object.Annotationtype(3)
		tab_1.tabpage_design.ole_edit.object.AnnotationLineColor( 255 )		
		tab_1.tabpage_design.ole_edit.object.Draw(li_x_pos, li_y_pos, 20,20)
		
		//no
		tab_1.tabpage_design.ole_edit.Object.AddAnnotationGroup( String(li_app_field_id) + "NoBox")
		tab_1.tabpage_design.ole_edit.object.AnnotationLineColor( 0 )
		tab_1.tabpage_design.ole_edit.object.Draw(li_x_pos + 30, li_y_pos, 20,20)		
		tab_1.tabpage_design.ole_edit.object.Annotationtype(11)					
	CASE "Y2"
		//yes box
		tab_1.tabpage_design.ole_edit.Object.AddAnnotationGroup( String(li_app_field_id) + "YesCheck")
		tab_1.tabpage_design.ole_edit.object.AnnotationStampText( "X" )
		tab_1.tabpage_design.ole_edit.object.Annotationtype(8)
		tab_1.tabpage_design.ole_edit.object.Draw(li_x_pos, li_y_pos, 10,10)		
		tab_1.tabpage_design.ole_edit.object.Annotationtype(11)							
	CASE "C"		
		tab_1.tabpage_design.ole_edit.Object.AddAnnotationGroup( String( li_app_field_id ) + "Check" )
		tab_1.tabpage_design.ole_edit.object.AnnotationStampText( "X" )
		tab_1.tabpage_design.ole_edit.object.Annotationtype(8)
		CHOOSE CASE ds_field_properties.GetItemNumber( li_fld_loop, "font_size" )
			CASE 1
				tab_1.tabpage_design.ole_edit.object.AnnotationFont.Name = "MS Serif"
				tab_1.tabpage_design.ole_edit.object.AnnotationFont.Size = 7
			CASE 2
				tab_1.tabpage_design.ole_edit.object.AnnotationFont.Name = "Times New Roman"
				tab_1.tabpage_design.ole_edit.object.AnnotationFont.Size = 8				
			CASE 3
				tab_1.tabpage_design.ole_edit.object.AnnotationFont.Name = "Times New Roman"
				tab_1.tabpage_design.ole_edit.object.AnnotationFont.Size = 12
		END CHOOSE
		tab_1.tabpage_design.ole_edit.object.Draw(li_x_pos, li_y_pos, 10,10)
		tab_1.tabpage_design.ole_edit.object.Annotationtype(11)	
	END CHOOSE
	tab_1.tabpage_design.uo_bar.r_bar.Width = tab_1.tabpage_design.uo_bar.r_bar.Width + li_step
END FOR

IF ai_field_id = 0 THEN
	//jadtab_1.tabpage_design.ole_edit.object.SaveAnnotations( is_app_path + String( ii_app_id ) + "-" + String( ii_current_page ) + ".ano",ii_current_page ,ii_current_page , 0 )
	//jadtab_1.tabpage_design.ole_edit.object.LoadAnnotations( is_app_path + String( ii_app_id ) + "-" + String( ii_current_page ) + ".ano",ii_current_page ,ii_current_page , 0 )
END IF




//--------------------------- APPEON BEGIN ---------------------------
//$<ID> UM-10
//$<modify> 01.13.2006 By: Wang Chao
//$<reason> The GOTO statement is currently unsuported.
//$<modification> Encapsulate the following script into of_cleanup and have the application
//$<modification> call of_cleanup to provide the same functionality. 
//Cleanup:
//
//ib_loading_annotations = False
//
//tab_1.tabpage_design.ole_edit.object.ScrollPositionX( li_prev_scrollX )		
//tab_1.tabpage_design.ole_edit.object.ScrollPositionY( li_prev_scrollY )			
//
//tab_1.tabpage_design.ole_edit.SetRedraw( True )
//
//w_train_app.tab_1.tabpage_design.st_field.Text = "Loading complete."
//
//tab_1.tabpage_design.ole_edit.object.Annotationtype(11)		
//
//tab_1.tabpage_design.uo_bar.Visible = False
//
//Return 0

Return of_cleanup(li_prev_scrollX,li_prev_scrollY)
//---------------------------- APPEON END ----------------------------



end function

public function integer of_auto_align_all ();Long ll_min_x
Long ll_y_scan = 1
Long ll_y_pos
Long ll_app_field_id
Long ll_max_y
String ls_app_field_id
Long ll_min_y
Long ll_x_scan = 1
Long ll_x_pos
Long ll_max_x
Integer i

//ALIGN TOP
if of_check_for_image() = -1 then return -1//maha 031505

SELECT MAX( y_pos )
INTO :ll_max_y
FROM app_field_prop
WHERE app_id = :ii_app_id AND
  	   page = :ii_current_page;

ib_loading_annotations = True

ll_max_y = ll_max_y + 100

DO WHILE TRUE
	
	SELECT Min( x_pos )
	INTO :ll_min_x
	FROM app_field_prop
	WHERE app_id = :ii_app_id AND
   	   page = :ii_current_page AND
      	y_pos >= :ll_y_scan AND y_pos <=:ll_y_scan + 25;

	SELECT y_pos, app_field_id
	INTO: ll_y_pos, :ll_app_field_id
	FROM app_field_prop
	WHERE app_id = :ii_app_id AND
   	   page = :ii_current_page AND
      	( y_pos >= :ll_y_scan AND y_pos < :ll_y_scan + 25 ) AND
			  x_pos = :ll_min_x;

	ls_app_field_id = String( ll_app_field_id )
	ii_app_field_id = ll_app_field_id
	tab_1.tabpage_design.ole_edit.Object.SelectAnnotationGroup( ls_app_field_id )

	tab_1.tabpage_design.dw_1.Retrieve( ii_app_id, ii_current_page, ll_y_pos )
	
	if tab_1.tabpage_design.dw_1.rowcount( ) > 1 THEN
		ll_y_scan = ll_y_scan + 10
		ib_auto_align_all = True
		of_auto_align()
		ib_auto_align_all = False		
	END IF

	FOR i = 1 TO tab_1.tabpage_design.dw_1.RowCount( )
		ls_app_field_id = String( tab_1.tabpage_design.dw_1.GetItemNumber( i, "app_field_id" ) )
		tab_1.tabpage_design.ole_edit.Object.SelectAnnotationGroup( ll_app_field_id )			
	END FOR
	
	IF ll_y_scan > ll_max_y + 30 THEN
		EXIT
	END IF
	
	ll_y_scan = ll_y_scan + 20
	
LOOP

ib_loading_annotations = False

COMMIT;

SELECT MAX( x_pos )
INTO :ll_max_x
FROM app_field_prop
WHERE app_id = :ii_app_id AND
  	   page = :ii_current_page;

//messagebox("", ll_max_y )


DO WHILE TRUE
	
	SELECT Min( y_pos )
	INTO :ll_min_y
	FROM app_field_prop
	WHERE app_id = :ii_app_id AND
   	   page = :ii_current_page AND
      	x_pos >= :ll_x_scan AND x_pos <=:ll_x_scan + 25;

	SELECT x_pos, app_field_id
	INTO: ll_x_pos, :ll_app_field_id
	FROM app_field_prop
	WHERE app_id = :ii_app_id AND
   	   page = :ii_current_page AND
      	( x_pos >= :ll_x_scan AND x_pos < :ll_x_scan + 25 ) AND
			y_pos = :ll_min_y;

	ls_app_field_id = String( ll_app_field_id )
	ii_app_field_id = ll_app_field_id
	tab_1.tabpage_design.ole_edit.Object.SelectAnnotationGroup( ls_app_field_id )

	tab_1.tabpage_design.dw_2.Retrieve( ii_app_id, ii_current_page, ll_x_pos, ll_min_y )
	
	if tab_1.tabpage_design.dw_2.rowcount( ) > 1 THEN
		ll_x_scan = ll_x_scan + 10
		//of_auto_align()
	END IF

	FOR i = 1 TO tab_1.tabpage_design.dw_2.RowCount( )
		ll_app_field_id =  tab_1.tabpage_design.dw_2.GetItemNumber( i, "app_field_id" ) 
		//tab_1.tabpage_design.ole_edit.Object.SelectAnnotationGroup( ls_app_field_id )			
		tab_1.tabpage_design.dw_fld_prop.Retrieve( ll_app_field_id )
		tab_1.tabpage_design.dw_2.SetItem( i, "x_pos", ll_x_pos )
		ii_ancor_x = ll_x_pos
		ii_ancor_y = tab_1.tabpage_design.dw_2.GetItemNumber( i, "y_pos" )
		tab_1.tabpage_design.cb_apply.TriggerEvent( Clicked! )		
		//MESSAGEBOX(String(ll_app_field_id), "AlignNext")		
		//dw_2.Update( )
		//of_delete_annotations( )
		//of_create_annotations( 0 )
	END FOR
	
	//MessageBox("", dw_1.RowCount())
	
	IF ll_x_scan > ll_max_x + 30 THEN
		EXIT
	END IF
	
	ll_x_scan = ll_x_scan + 10
	
LOOP

ib_loading_annotations = False
ib_moving_field = False

	//301 - 50 = 251
//	SELECT *
//	FROM app_field_prop
//	WHERE app_id = 84 AND
//   	   page = 10 AND
//			y_pos >= 301 -50 AND
//	    	y_pos <= 301 + 50;
//
//LOOP


//tab_1.Tabpage_design.SetRedraw( True )

Return 0
end function

public function integer of_auto_align_tops ();Long ll_min_x
Long ll_y_scan = 1
Long ll_y_pos
Long ll_app_field_id
Long ll_max_y
String ls_app_field_id
Long ll_min_y
Long ll_x_scan = 1
Long ll_x_pos
Long ll_max_x
Integer i

//ALIGN TOP
if of_check_for_image() = -1 then return -1//maha 031505

SELECT MAX( y_pos )
INTO :ll_max_y
FROM app_field_prop
WHERE app_id = :ii_app_id AND
  	   page = :ii_current_page;

ib_loading_annotations = True
ib_moving_field = True

ll_max_y = ll_max_y + 100

DO WHILE TRUE
	
	SELECT Min( x_pos )
	INTO :ll_min_x
	FROM app_field_prop
	WHERE app_id = :ii_app_id AND
   	   page = :ii_current_page AND
      	y_pos >= :ll_y_scan AND y_pos <=:ll_y_scan + 25;

	SELECT y_pos, app_field_id
	INTO: ll_y_pos, :ll_app_field_id
	FROM app_field_prop
	WHERE app_id = :ii_app_id AND
   	   page = :ii_current_page AND
      	( y_pos >= :ll_y_scan AND y_pos < :ll_y_scan + 25 ) AND
			  x_pos = :ll_min_x;

	ls_app_field_id = String( ll_app_field_id )
	ii_app_field_id = ll_app_field_id
	tab_1.tabpage_design.ole_edit.Object.SelectAnnotationGroup( ls_app_field_id )

	tab_1.tabpage_design.dw_1.Retrieve( ii_app_id, ii_current_page, ll_y_pos )
	
	if tab_1.tabpage_design.dw_1.rowcount( ) > 1 THEN
		ll_y_scan = ll_y_scan + 10
		ib_auto_align_all = True
		of_auto_align()
		ib_auto_align_all = False		
	END IF

	FOR i = 1 TO tab_1.tabpage_design.dw_1.RowCount( )
		ls_app_field_id = String( tab_1.tabpage_design.dw_1.GetItemNumber( i, "app_field_id" ) )
		tab_1.tabpage_design.ole_edit.Object.SelectAnnotationGroup( ll_app_field_id )			
	END FOR
	
	IF ll_y_scan > ll_max_y + 30 THEN
		EXIT
	END IF
	
	ll_y_scan = ll_y_scan + 20
	
LOOP

ib_loading_annotations = False
ib_moving_field = False


RETURN 0
end function

public function integer of_auto_align_sides ();Long ll_min_x
Long ll_y_scan = 1
Long ll_y_pos
Long ll_app_field_id
Long ll_max_y
String ls_app_field_id
Long ll_min_y
Long ll_x_scan = 1
Long ll_x_pos
Long ll_max_x
Integer i

if of_check_for_image() = -1 then return -1//maha 031505

ib_loading_annotations = True
ib_moving_field = True

SELECT MAX( x_pos )
INTO :ll_max_x
FROM app_field_prop
WHERE app_id = :ii_app_id AND
  	   page = :ii_current_page;

//messagebox("", ll_max_y )


DO WHILE TRUE
	
	SELECT Min( y_pos )
	INTO :ll_min_y
	FROM app_field_prop
	WHERE app_id = :ii_app_id AND
   	   page = :ii_current_page AND
      	x_pos >= :ll_x_scan AND x_pos <=:ll_x_scan + 25;

	SELECT x_pos, app_field_id
	INTO: ll_x_pos, :ll_app_field_id
	FROM app_field_prop
	WHERE app_id = :ii_app_id AND
   	   page = :ii_current_page AND
      	( x_pos >= :ll_x_scan AND x_pos < :ll_x_scan + 25 ) AND
			y_pos = :ll_min_y;

	ls_app_field_id = String( ll_app_field_id )
	ii_app_field_id = ll_app_field_id
	tab_1.tabpage_design.ole_edit.Object.SelectAnnotationGroup( ls_app_field_id )

	tab_1.tabpage_design.dw_2.Retrieve( ii_app_id, ii_current_page, ll_x_pos, ll_min_y )
	
	if tab_1.tabpage_design.dw_2.rowcount( ) > 1 THEN
		ll_x_scan = ll_x_scan + 10
		//of_auto_align()
	END IF

	FOR i = 1 TO tab_1.tabpage_design.dw_2.RowCount( )
		ll_app_field_id =  tab_1.tabpage_design.dw_2.GetItemNumber( i, "app_field_id" ) 
		//tab_1.tabpage_design.ole_edit.Object.SelectAnnotationGroup( ls_app_field_id )			
		tab_1.tabpage_design.dw_fld_prop.Retrieve( ll_app_field_id )
		tab_1.tabpage_design.dw_2.SetItem( i, "x_pos", ll_x_pos )
		ii_ancor_x = ll_x_pos
		ii_ancor_y = tab_1.tabpage_design.dw_2.GetItemNumber( i, "y_pos" )
		tab_1.tabpage_design.cb_apply.TriggerEvent( Clicked! )		
		//MESSAGEBOX(String(ll_app_field_id), "AlignNext")		
		//dw_2.Update( )
		//of_delete_annotations( )
		//of_create_annotations( 0 )
	END FOR
	
	//MessageBox("", dw_1.RowCount())
	
	IF ll_x_scan > ll_max_x + 30 THEN
		EXIT
	END IF
	
	ll_x_scan = ll_x_scan + 10
	
LOOP

ib_loading_annotations = False
ib_moving_field = False

RETURN 0
end function

public function integer of_add_hollow_box ();String ls_type
String ls_text
Long li_app_id
Long ll_field_id
Long li_page

if of_check_for_image() = -1 then return -1//maha 031505

li_page = w_train_app.ii_current_page
li_app_id = w_train_app.ii_app_id

SELECT Max( app_field_id )  
INTO :ll_field_id  
FROM app_field_prop 
USING tr_training_data;
IF tr_training_data.SQLCODE = -1 THEN
	MessageBox("Database Error", tr_training_data.SQLERRTEXT )
END IF

ll_field_id++

ib_loading_annotations = True
tab_1.tabpage_design.ole_edit.Object.AddAnnotationGroup( "Rectangle," + String( ll_field_id ))		
tab_1.tabpage_design.ole_edit.object.Annotationtype(4)		
tab_1.tabpage_design.ole_edit.object.Draw( 1, 1,30,30)	
tab_1.tabpage_design.ole_edit.object.SetSelectedAnnotationFillColor( 8454143 )
ib_loading_annotations = False

INSERT INTO app_field_prop  
         ( app_field_id,   
           app_id,   
           table_id,   
           field_id,   
           lookup_link_type,   
           lookup_link_field,   
           record_number,   
           x_pos,   
           y_pos,   
           width,   
           query_field,   
           query_value,   
           page,   
           box_type,   
           box_height,   
           box_width,   
           box_yes_x,   
           box_yes_y,   
           box_yes_value,   
           box_no_x,   
           box_no_y,   
           box_no_value,   
           font_type,   
           font_size,   
           font_color,   
           font_background,   
           font_underline,   
           font_bold,   
           query_operator,   
           field_description,   
           personal_data,   
           height,   
           annotation_width,   
           past_years_query,   
           format,   
           connect_field_id,   
           connect_field_sort )  
  VALUES ( :ll_field_id,   
           :li_app_id,   
           99,   
           0,   
           null,   
           null,   
           null,   
           1,   
           1,   
           null,   
           null,   
           null,   
           :li_page,   
           null,   
           30,   
           30,   
           null,   
           null,   
           null,   
           null,   
           null,   
           null,   
			  null,
           null,   
           null,   
           null,   
           null,   
           null,   
           null,   
           'Rectangle',   
           'N',   
           null,   
           null,   
           null,   
           null,   
           null,   
           null )
USING tr_training_data;
IF tr_training_data.SQLCODE = -1 THEN
	MessageBox("Database Error", tr_training_data.SQLERRTEXT )
END IF

//COMMIT USING tr_training_data;

tab_1.tabpage_design.ole_edit.Object.Annotationtype(11)	

Return 1
end function

public function integer of_clear_annotations ();Long li_Cnt
Long i
Long p
String ls_annotation_group
Integer li_page_cnt

if of_check_for_image() = -1 then return -1//maha 031505

li_page_cnt = tab_1.tabpage_design.ole_edit.Object.PageCount()

FOR p = 1 TO li_page_cnt

	tab_1.tabpage_design.ole_edit.Object.Page( p )
	tab_1.tabpage_design.ole_edit.Object.Display()
	
	tab_1.tabpage_design.ole_edit.Object.SelectAnnotationGroup( "" )	

	li_cnt = tab_1.tabpage_design.ole_edit.Object.AnnotationGroupCount()

	FOR i = 0 TO li_cnt 
		ls_annotation_group = tab_1.tabpage_design.ole_edit.Object.GetAnnotationGroup( 0 )
		tab_1.tabpage_design.ole_edit.Object.DeleteAnnotationGroup( ls_annotation_group )		
	END FOR

END FOR

Return 0
end function

public function integer of_clear_annos ();Long li_cnt
Integer p
INTEGER LI_PAGE_CNT
String ls_label_data,ls_Rtn
String ls_field_description
String ls_object_type
String ls_field_type
String ls_lookup_link_type
String ls_group_nm
String ls_fld_desc
String ls_lookup_link_field
String ls_fld_display
String ls_font_type
Long ll_field_id
Long ll_table_id
Long li_field_len
long li_app_field_id //modified 071802 maha
String ls_fld_nm
String ls_tbl_nm
n_ds ds_field_properties
long li_fld_cnt
Long li_x_pos
Long li_y_pos
Long li_fld_loop
Long li_prev_scrollY
Long li_prev_scrollX
//Long li_step

if of_check_for_image() = -1 then return -1//maha 031505

//--------------------------- APPEON BEGIN ---------------------------
//$< Add  > 2008-07-17 By: Scofield
//$<Reason> Verify if the directory has write right for the current user.

ls_Rtn = f_ExaWriteRight(tab_1.tabpage_design.ole_edit.Object.Image)
if Len(ls_Rtn) > 0 then
	MessageBox(gnv_app.iapp_object.DisplayName,ls_Rtn,Exclamation!)
	Return -1
end if
//---------------------------- APPEON END ----------------------------

li_page_cnt = tab_1.tabpage_design.ole_edit.Object.PageCount()

ds_field_properties = CREATE n_ds
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-20
//$<modify> 04.05.2006 By: Rodger Wu
//$<reason> Performance Tuning
//$<modification> Write script to retrieve data from a cache instead of from the database.

/*
ds_field_properties.DataObject = "d_app_field_properties_all"
ds_field_properties.SetTransObject( tr_training_data )
*/
ds_field_properties.DataObject = "d_app_field_properties_for_copying"
ds_field_properties.SetTransObject( tr_training_data )
ds_field_properties.Retrieve( ii_app_id )
//---------------------------- APPEON END ----------------------------

FOR p = 1 TO li_page_cnt

	tab_1.tabpage_design.ole_edit.Object.Page( p )
	tab_1.tabpage_design.ole_edit.Object.Display()


	ib_loading_annotations = True

tab_1.tabpage_design.uo_bar.r_bar.Width = 0

li_prev_scrollY = tab_1.tabpage_design.ole_edit.object.ScrollPositionY( )
li_prev_scrollX = tab_1.tabpage_design.ole_edit.object.ScrollPositionX( )

tab_1.tabpage_design.ole_edit.object.ScrollPositionX( 0 )		
tab_1.tabpage_design.ole_edit.object.ScrollPositionY( 0 )			

//ds_field_properties = CREATE n_ds
//ds_field_properties.DataObject = "d_app_field_properties_all"
//ds_field_properties.SetTransObject( tr_training_data )
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-21
//$<modify> 04.05.2006 By: Rodger Wu
//$<reason> Performance Tuning
//$<modification> Write script to retrieve data from a cache instead of from the database.

/* li_fld_cnt = ds_field_properties.Retrieve( Ii_app_id, p ) */
ds_field_properties.SetFilter( "page = " + string( p ) )
ds_field_properties.Filter()
li_fld_cnt = ds_field_properties.Rowcount()
//---------------------------- APPEON END ----------------------------

FOR li_fld_loop = 1 TO li_fld_cnt
	ls_object_type = ds_field_properties.GetItemString( li_fld_loop, "object_type" )
	li_app_field_id = ds_field_properties.GetItemNumber( li_fld_loop, "app_field_id" )
	tab_1.tabpage_design.ole_edit.Object.DeleteAnnotationGroup( String(li_app_field_id))		
	li_field_len = ds_field_properties.GetItemNumber( li_fld_loop, "width" )
	li_x_pos = ds_field_properties.GetItemNumber( li_fld_loop, "x_pos" )
	li_y_pos = ds_field_properties.GetItemNumber( li_fld_loop, "y_pos" )
	ll_field_id = ds_field_properties.GetItemNumber( li_fld_loop, "field_id" )	
	ll_table_id = ds_field_properties.GetItemNumber( li_fld_loop, "table_id" )	
	ls_field_description = ds_field_properties.GetItemString( li_fld_loop, "field_description" )
			
	IF ll_table_id = 99 THEN
		CHOOSE CASE Upper( ls_field_description )
			CASE "TODAYS DATE"
				tab_1.tabpage_design.ole_edit.Object.DeleteAnnotationGroup( "SP-TODAYSDATE," + String( li_app_field_id ) )		
				tab_1.tabpage_design.ole_edit.Object.AnnotationStampText( "MM/DD/YYYY" )		
			CASE "CURRENT TIME"
				tab_1.tabpage_design.ole_edit.Object.DeleteAnnotationGroup( "SP-CURRENTTIME," + String( li_app_field_id ))				
				tab_1.tabpage_design.ole_edit.Object.AnnotationStampText( "HH:MMa" )		
			CASE "USER ID"
				tab_1.tabpage_design.ole_edit.Object.DeleteAnnotationGroup( "SP-USERID," + String( li_app_field_id ))		
				tab_1.tabpage_design.ole_edit.Object.AnnotationStampText( "XXXXXXXXXX" )		
		END CHOOSE
		
		IF Mid( Upper ( ls_field_description ), 1, 5 ) = "LABEL" THEN
			ls_label_data =  Mid( ls_field_description, 7, 100 ) 
			tab_1.tabpage_design.ole_edit.Object.DeleteAnnotationGroup( "LABEL-" + Mid(ls_label_data, 1, 20 ) + ";" + String( li_app_field_id ))		
			tab_1.tabpage_design.ole_edit.Object.DeleteAnnotationGroup( "LABEL-" + Mid(ls_label_data, 1, 5 ) + ";" + String( li_app_field_id ))
		ELSEIF Upper( ls_field_description) = "RECTANGLE" THEN
			tab_1.tabpage_design.ole_edit.Object.DeleteAnnotationGroup( "Rectangle," + String( li_app_field_id ))		
		ELSEIF Upper( ls_field_description) = "HOLLOWRECTANGLE" THEN
			tab_1.tabpage_design.ole_edit.Object.DeleteAnnotationGroup( "HollowRectangle," + String( li_app_field_id ))		
		END IF
			
	
		tab_1.tabpage_design.ole_edit.object.AnnotationFontColor(255)
		tab_1.tabpage_design.ole_edit.object.Annotationtype(8)		
		CHOOSE CASE ds_field_properties.GetItemNumber( li_fld_loop, "font_size" )
			CASE 1
				tab_1.tabpage_design.ole_edit.object.AnnotationFont.Name = "MS Serif"
				tab_1.tabpage_design.ole_edit.object.AnnotationFont.Size = 7
			CASE 2
				tab_1.tabpage_design.ole_edit.object.AnnotationFont.Name = "Times New Roman"
				tab_1.tabpage_design.ole_edit.object.AnnotationFont.Size = 8				
			CASE 3
				tab_1.tabpage_design.ole_edit.object.AnnotationFont.Name = "Times New Roman"
				tab_1.tabpage_design.ole_edit.object.AnnotationFont.Size = 12			
		END CHOOSE
		IF ds_field_properties.GetItemNumber( li_fld_loop, "font_bold" ) = 1 THEN
			tab_1.tabpage_design.ole_edit.object.AnnotationFont.Bold = True
		ELSE
			tab_1.tabpage_design.ole_edit.object.AnnotationFont.Bold = False
		END IF
		//tab_1.tabpage_design.ole_edit.object.Draw(li_x_pos, li_y_pos, 0, 0)	
		CONTINUE
	END IF
	
	//w_train_app.tab_1.tabpage_design.st_field.Text = ls_tbl_nm + "->" + ls_fld_nm


	CHOOSE CASE ls_object_type
		CASE "T"
			ls_field_type = ds_field_properties.GetItemString( li_fld_loop, "sys_fields_field_type" )
			ls_lookup_link_type = ds_field_properties.GetItemString( li_fld_loop, "lookup_link_type" )
			ls_lookup_link_field = ds_field_properties.GetItemString( li_fld_loop, "lookup_link_field" )
			IF ls_lookup_link_type = "A" OR ls_lookup_link_type = "C" THEN
				ls_field_type = "C"			
			END IF
		CHOOSE CASE Upper( ls_field_type )
			CASE "C"
				ls_fld_display = Fill( "x", li_field_len )
			CASE "I"
				ls_fld_display = Fill( "#", li_field_len )				
			CASE "D"
				ls_fld_display = "mm/dd/yyyy"
			CASE "N"
				ls_fld_display = Fill( "#", li_field_len )
			CASE else //maha app100305
				ls_fld_display = "XXXXXXXXXXXXX"
		END CHOOSE
					
		tab_1.tabpage_design.ole_edit.Object.DeleteAnnotationGroup( String(li_app_field_id) )
		tab_1.tabpage_design.ole_edit.object.AnnotationStampText( ls_fld_display )
		tab_1.tabpage_design.ole_edit.object.AnnotationFontColor(255)
		tab_1.tabpage_design.ole_edit.object.Annotationtype(8)		
		CHOOSE CASE ds_field_properties.GetItemNumber( li_fld_loop, "font_size" )
			CASE 1
				tab_1.tabpage_design.ole_edit.object.AnnotationFont.Name = "MS Serif"
				tab_1.tabpage_design.ole_edit.object.AnnotationFont.Size = 7
			CASE 2
				tab_1.tabpage_design.ole_edit.object.AnnotationFont.Name = "Times New Roman"
				tab_1.tabpage_design.ole_edit.object.AnnotationFont.Size = 8				
			CASE 3
				tab_1.tabpage_design.ole_edit.object.AnnotationFont.Name = "Times New Roman"
				tab_1.tabpage_design.ole_edit.object.AnnotationFont.Size = 12			
		END CHOOSE
		IF ds_field_properties.GetItemNumber( li_fld_loop, "font_bold" ) = 1 THEN
			tab_1.tabpage_design.ole_edit.object.AnnotationFont.Bold = True
		ELSE
			tab_1.tabpage_design.ole_edit.object.AnnotationFont.Bold = False
		END IF
		//tab_1.tabpage_design.ole_edit.object.Draw(li_x_pos, li_y_pos, 0, 0)
		tab_1.tabpage_design.ole_edit.object.Annotationtype(11)	
	CASE "B"
		tab_1.tabpage_design.ole_edit.Object.DeleteAnnotationGroup( ds_field_properties.GetItemNumber( ds_field_properties.GetRow(), "field_id" ) )
		tab_1.tabpage_design.ole_edit.object.Annotationtype(3)
		//tab_1.tabpage_design.ole_edit.object.Draw(li_x_pos, li_y_pos, 20,20)
		tab_1.tabpage_design.ole_edit.object.Annotationtype(11)			
	CASE "Y1"
		//yes box
		tab_1.tabpage_design.ole_edit.Object.DeleteAnnotationGroup( String(li_app_field_id) + "YesBox")
		tab_1.tabpage_design.ole_edit.object.Annotationtype(3)
		tab_1.tabpage_design.ole_edit.object.AnnotationLineColor( 255 )		
		//tab_1.tabpage_design.ole_edit.object.Draw(li_x_pos, li_y_pos, 20,20)
		
		//no
		tab_1.tabpage_design.ole_edit.Object.DeleteAnnotationGroup( String(li_app_field_id) + "NoBox")
		tab_1.tabpage_design.ole_edit.object.AnnotationLineColor( 0 )
		//tab_1.tabpage_design.ole_edit.object.Draw(li_x_pos + 30, li_y_pos, 20,20)		
		tab_1.tabpage_design.ole_edit.object.Annotationtype(11)					
	CASE "Y2"
		//yes box
		tab_1.tabpage_design.ole_edit.Object.DeleteAnnotationGroup( String(li_app_field_id) + "YesCheck")
		tab_1.tabpage_design.ole_edit.object.AnnotationStampText( "X" )
		tab_1.tabpage_design.ole_edit.object.Annotationtype(8)
		//tab_1.tabpage_design.ole_edit.object.Draw(li_x_pos, li_y_pos, 10,10)		
		tab_1.tabpage_design.ole_edit.object.Annotationtype(11)							
	CASE "C"		
		tab_1.tabpage_design.ole_edit.Object.DeleteAnnotationGroup( String( li_app_field_id ) + "Check" )
		tab_1.tabpage_design.ole_edit.object.AnnotationStampText( "X" )
		tab_1.tabpage_design.ole_edit.object.Annotationtype(8)
		CHOOSE CASE ds_field_properties.GetItemNumber( li_fld_loop, "font_size" )
			CASE 1
				tab_1.tabpage_design.ole_edit.object.AnnotationFont.Name = "MS Serif"
				tab_1.tabpage_design.ole_edit.object.AnnotationFont.Size = 7
			CASE 2
				tab_1.tabpage_design.ole_edit.object.AnnotationFont.Name = "Times New Roman"
				tab_1.tabpage_design.ole_edit.object.AnnotationFont.Size = 8				
			CASE 3
				tab_1.tabpage_design.ole_edit.object.AnnotationFont.Name = "Times New Roman"
				tab_1.tabpage_design.ole_edit.object.AnnotationFont.Size = 12
		END CHOOSE
		//tab_1.tabpage_design.ole_edit.object.Draw(li_x_pos, li_y_pos, 10,10)
		tab_1.tabpage_design.ole_edit.object.Annotationtype(11)	
	END CHOOSE
	//tab_1.tabpage_design.uo_bar.r_bar.Width = tab_1.tabpage_design.uo_bar.r_bar.Width + li_step
END FOR

//IF ai_field_id = 0 THEN
	//jadtab_1.tabpage_design.ole_edit.object.SaveAnnotations( is_app_path + String( ai_app_id ) + "-" + String( ai_page ) + ".ano",ai_page ,ai_page , 0 )
	//jadtab_1.tabpage_design.ole_edit.object.LoadAnnotations( is_app_path + String( ai_app_id ) + "-" + String( ai_page ) + ".ano",ai_page ,ai_page , 0 )
//END IF

	tab_1.tabpage_design.ole_edit.Object.Save()
END FOR

//Cleanup:
DESTROY ds_field_properties //maha added 031405

ib_loading_annotations = False

tab_1.tabpage_design.ole_edit.object.ScrollPositionX( li_prev_scrollX )		
tab_1.tabpage_design.ole_edit.object.ScrollPositionY( li_prev_scrollY )			

//tab_1.tabpage_design.ole_edit.SetRedraw( True )

w_train_app.tab_1.tabpage_design.st_field.Text = "Loading complete."

tab_1.tabpage_design.ole_edit.object.Annotationtype(11)		

tab_1.tabpage_design.uo_bar.Visible = False

Return 0

end function

public function integer of_clear_annos_one_page (integer ai_old_page, integer ai_new_page);Long 		li_cnt
Integer 	li_current_page
Integer 	p
INTEGER 	LI_PAGE_CNT
String	ls_Rtn

p = ai_new_page

if of_check_for_image() = -1 then return -1//maha 031505

//--------------------------- APPEON BEGIN ---------------------------
//$< Add  > 2008-07-17 By: Scofield
//$<Reason> Verify if the directory has write right for the current user.

ls_Rtn = f_ExaWriteRight(tab_1.tabpage_design.ole_edit.Object.Image)
if Len(ls_Rtn) > 0 then
	MessageBox(gnv_app.iapp_object.DisplayName,ls_Rtn,Exclamation!)
	Return -1
end if
//---------------------------- APPEON END ----------------------------

li_current_page = tab_1.tabpage_design.ole_edit.Object.Page(  )

tab_1.tabpage_design.ole_edit.Object.Page( p )
tab_1.tabpage_design.ole_edit.Object.Display()

ib_loading_annotations = True

tab_1.tabpage_design.uo_bar.r_bar.Width = 0

String ls_label_data
String ls_field_description
String ls_object_type
String ls_field_type
String ls_lookup_link_type
String ls_group_nm
String ls_fld_desc
String ls_lookup_link_field
String ls_fld_display
String ls_font_type
Long ll_field_id
Long ll_table_id
Long li_field_len
long li_app_field_id //modified 071802 maha
String ls_fld_nm
String ls_tbl_nm
n_ds ds_field_properties
long li_fld_cnt
Long li_x_pos
Long li_y_pos
Long li_fld_loop
Long li_prev_scrollY
Long li_prev_scrollX
//Long li_step


li_prev_scrollY = tab_1.tabpage_design.ole_edit.object.ScrollPositionY( )
li_prev_scrollX = tab_1.tabpage_design.ole_edit.object.ScrollPositionX( )

tab_1.tabpage_design.ole_edit.object.ScrollPositionX( 0 )		
tab_1.tabpage_design.ole_edit.object.ScrollPositionY( 0 )			

ds_field_properties = CREATE n_ds
ds_field_properties.DataObject = "d_app_field_properties_all"
ds_field_properties.SetTransObject( tr_training_data )
li_fld_cnt = ds_field_properties.Retrieve( ii_app_id, ai_old_page )

FOR li_fld_loop = 1 TO li_fld_cnt
	ls_object_type = ds_field_properties.GetItemString( li_fld_loop, "object_type" )
	li_app_field_id = ds_field_properties.GetItemNumber( li_fld_loop, "app_field_id" )
	li_field_len = ds_field_properties.GetItemNumber( li_fld_loop, "width" )
	li_x_pos = ds_field_properties.GetItemNumber( li_fld_loop, "x_pos" )
	li_y_pos = ds_field_properties.GetItemNumber( li_fld_loop, "y_pos" )
	ll_field_id = ds_field_properties.GetItemNumber( li_fld_loop, "field_id" )	
	ll_table_id = ds_field_properties.GetItemNumber( li_fld_loop, "table_id" )	
	ls_field_description = ds_field_properties.GetItemString( li_fld_loop, "field_description" )
			
	IF ll_table_id = 99 THEN
		CHOOSE CASE Upper( ls_field_description )
			CASE "TODAYS DATE"
				tab_1.tabpage_design.ole_edit.Object.DeleteAnnotationGroup( "SP-TODAYSDATE," + String( li_app_field_id ) )		
				tab_1.tabpage_design.ole_edit.Object.AnnotationStampText( "MM/DD/YYYY" )		
			CASE "CURRENT TIME"
				tab_1.tabpage_design.ole_edit.Object.DeleteAnnotationGroup( "SP-CURRENTTIME," + String( li_app_field_id ))				
				tab_1.tabpage_design.ole_edit.Object.AnnotationStampText( "HH:MMa" )		
			CASE "USER ID"
				tab_1.tabpage_design.ole_edit.Object.DeleteAnnotationGroup( "SP-USERID," + String( li_app_field_id ))		
				tab_1.tabpage_design.ole_edit.Object.AnnotationStampText( "XXXXXXXXXX" )		
		END CHOOSE
		
		IF Mid( Upper ( ls_field_description ), 1, 5 ) = "LABEL" THEN
			ls_label_data =  Mid( ls_field_description, 7, 100 ) 
			tab_1.tabpage_design.ole_edit.Object.DeleteAnnotationGroup( "LABEL-" + Mid(ls_label_data, 1, 20 ) + ";" + String( li_app_field_id ))
			tab_1.tabpage_design.ole_edit.Object.DeleteAnnotationGroup( "LABEL-" + Mid(ls_label_data, 1, 5 ) + ";" + String( li_app_field_id )) //maha 031405

		ELSEIF Upper( ls_field_description) = "RECTANGLE" THEN
			tab_1.tabpage_design.ole_edit.Object.DeleteAnnotationGroup( "Rectangle," + String( li_app_field_id ))		
		ELSEIF Upper( ls_field_description) = "HOLLOWRECTANGLE" THEN
			tab_1.tabpage_design.ole_edit.Object.DeleteAnnotationGroup( "HollowRectangle," + String( li_app_field_id ))		
		END IF
			
	
		tab_1.tabpage_design.ole_edit.object.AnnotationFontColor(255)
		tab_1.tabpage_design.ole_edit.object.Annotationtype(8)		
		CHOOSE CASE ds_field_properties.GetItemNumber( li_fld_loop, "font_size" )
			CASE 1
				tab_1.tabpage_design.ole_edit.object.AnnotationFont.Name = "MS Serif"
				tab_1.tabpage_design.ole_edit.object.AnnotationFont.Size = 7
			CASE 2
				tab_1.tabpage_design.ole_edit.object.AnnotationFont.Name = "Times New Roman"
				tab_1.tabpage_design.ole_edit.object.AnnotationFont.Size = 8				
			CASE 3
				tab_1.tabpage_design.ole_edit.object.AnnotationFont.Name = "Times New Roman"
				tab_1.tabpage_design.ole_edit.object.AnnotationFont.Size = 12			
		END CHOOSE
		IF ds_field_properties.GetItemNumber( li_fld_loop, "font_bold" ) = 1 THEN
			tab_1.tabpage_design.ole_edit.object.AnnotationFont.Bold = True
		ELSE
			tab_1.tabpage_design.ole_edit.object.AnnotationFont.Bold = False
		END IF
		//tab_1.tabpage_design.ole_edit.object.Draw(li_x_pos, li_y_pos, 0, 0)	
		CONTINUE
	END IF
	
	//w_train_app.tab_1.tabpage_design.st_field.Text = ls_tbl_nm + "->" + ls_fld_nm
	CHOOSE CASE ls_object_type
		CASE "T"
			ls_field_type = ds_field_properties.GetItemString( li_fld_loop, "sys_fields_field_type" )
			ls_lookup_link_type = ds_field_properties.GetItemString( li_fld_loop, "lookup_link_type" )
			ls_lookup_link_field = ds_field_properties.GetItemString( li_fld_loop, "lookup_link_field" )
			IF ls_lookup_link_type = "A" OR ls_lookup_link_type = "C" THEN
				ls_field_type = "C"			
			END IF
		CHOOSE CASE Upper( ls_field_type )
			CASE "C"
				ls_fld_display = Fill( "x", li_field_len )
			CASE "I"
				ls_fld_display = Fill( "#", li_field_len )				
			CASE "D"
				ls_fld_display = "mm/dd/yyyy"
			CASE "N"
				ls_fld_display = Fill( "#", li_field_len )
			CASE else //maha app100305
				ls_fld_display = "XXXXXXXXXXXXX"
		END CHOOSE
					
		tab_1.tabpage_design.ole_edit.Object.DeleteAnnotationGroup( String(li_app_field_id) )
		tab_1.tabpage_design.ole_edit.object.AnnotationStampText( ls_fld_display )
		tab_1.tabpage_design.ole_edit.object.AnnotationFontColor(255)
		tab_1.tabpage_design.ole_edit.object.Annotationtype(8)		
		CHOOSE CASE ds_field_properties.GetItemNumber( li_fld_loop, "font_size" )
			CASE 1
				tab_1.tabpage_design.ole_edit.object.AnnotationFont.Name = "MS Serif"
				tab_1.tabpage_design.ole_edit.object.AnnotationFont.Size = 7
			CASE 2
				tab_1.tabpage_design.ole_edit.object.AnnotationFont.Name = "Times New Roman"
				tab_1.tabpage_design.ole_edit.object.AnnotationFont.Size = 8				
			CASE 3
				tab_1.tabpage_design.ole_edit.object.AnnotationFont.Name = "Times New Roman"
				tab_1.tabpage_design.ole_edit.object.AnnotationFont.Size = 12			
		END CHOOSE
		IF ds_field_properties.GetItemNumber( li_fld_loop, "font_bold" ) = 1 THEN
			tab_1.tabpage_design.ole_edit.object.AnnotationFont.Bold = True
		ELSE
			tab_1.tabpage_design.ole_edit.object.AnnotationFont.Bold = False
		END IF
		//tab_1.tabpage_design.ole_edit.object.Draw(li_x_pos, li_y_pos, 0, 0)
		tab_1.tabpage_design.ole_edit.object.Annotationtype(11)	
	CASE "B"
		tab_1.tabpage_design.ole_edit.Object.DeleteAnnotationGroup( ds_field_properties.GetItemNumber( ds_field_properties.GetRow(), "field_id" ) )
		tab_1.tabpage_design.ole_edit.object.Annotationtype(3)
		//tab_1.tabpage_design.ole_edit.object.Draw(li_x_pos, li_y_pos, 20,20)
		tab_1.tabpage_design.ole_edit.object.Annotationtype(11)			
	CASE "Y1"
		//yes box
		tab_1.tabpage_design.ole_edit.Object.DeleteAnnotationGroup( String(li_app_field_id) + "YesBox")
		tab_1.tabpage_design.ole_edit.object.Annotationtype(3)
		tab_1.tabpage_design.ole_edit.object.AnnotationLineColor( 255 )		
		//tab_1.tabpage_design.ole_edit.object.Draw(li_x_pos, li_y_pos, 20,20)
		
		//no
		tab_1.tabpage_design.ole_edit.Object.DeleteAnnotationGroup( String(li_app_field_id) + "NoBox")
		tab_1.tabpage_design.ole_edit.object.AnnotationLineColor( 0 )
		//tab_1.tabpage_design.ole_edit.object.Draw(li_x_pos + 30, li_y_pos, 20,20)		
		tab_1.tabpage_design.ole_edit.object.Annotationtype(11)					
	CASE "Y2"
		//yes box
		tab_1.tabpage_design.ole_edit.Object.DeleteAnnotationGroup( String(li_app_field_id) + "YesCheck")
		tab_1.tabpage_design.ole_edit.object.AnnotationStampText( "X" )
		tab_1.tabpage_design.ole_edit.object.Annotationtype(8)
		//tab_1.tabpage_design.ole_edit.object.Draw(li_x_pos, li_y_pos, 10,10)		
		tab_1.tabpage_design.ole_edit.object.Annotationtype(11)							
	CASE "C"		
		tab_1.tabpage_design.ole_edit.Object.DeleteAnnotationGroup( String( li_app_field_id ) + "Check" )
		tab_1.tabpage_design.ole_edit.object.AnnotationStampText( "X" )
		tab_1.tabpage_design.ole_edit.object.Annotationtype(8)
		CHOOSE CASE ds_field_properties.GetItemNumber( li_fld_loop, "font_size" )
			CASE 1
				tab_1.tabpage_design.ole_edit.object.AnnotationFont.Name = "MS Serif"
				tab_1.tabpage_design.ole_edit.object.AnnotationFont.Size = 7
			CASE 2
				tab_1.tabpage_design.ole_edit.object.AnnotationFont.Name = "Times New Roman"
				tab_1.tabpage_design.ole_edit.object.AnnotationFont.Size = 8				
			CASE 3
				tab_1.tabpage_design.ole_edit.object.AnnotationFont.Name = "Times New Roman"
				tab_1.tabpage_design.ole_edit.object.AnnotationFont.Size = 12
		END CHOOSE
		//tab_1.tabpage_design.ole_edit.object.Draw(li_x_pos, li_y_pos, 10,10)
		tab_1.tabpage_design.ole_edit.object.Annotationtype(11)	
	END CHOOSE
	//tab_1.tabpage_design.uo_bar.r_bar.Width = tab_1.tabpage_design.uo_bar.r_bar.Width + li_step
END FOR

//IF ai_field_id = 0 THEN
	//jadtab_1.tabpage_design.ole_edit.object.SaveAnnotations( is_app_path + String( ai_app_id ) + "-" + String( ai_page ) + ".ano",ai_page ,ai_page , 0 )
	//jadtab_1.tabpage_design.ole_edit.object.LoadAnnotations( is_app_path + String( ai_app_id ) + "-" + String( ai_page ) + ".ano",ai_page ,ai_page , 0 )
//END IF
	tab_1.tabpage_design.ole_edit.Object.Save()

//Cleanup:

ib_loading_annotations = False

tab_1.tabpage_design.ole_edit.object.ScrollPositionX( li_prev_scrollX )		
tab_1.tabpage_design.ole_edit.object.ScrollPositionY( li_prev_scrollY )			

//tab_1.tabpage_design.ole_edit.SetRedraw( True )

w_train_app.tab_1.tabpage_design.st_field.Text = "Loading complete."

tab_1.tabpage_design.ole_edit.object.Annotationtype(11)		

tab_1.tabpage_design.uo_bar.Visible = False

tab_1.tabpage_design.ole_edit.Object.Page( li_current_page )
tab_1.tabpage_design.ole_edit.Object.Display()


Return 0
end function

public function integer of_dw_field_dclick ();long	ll_Row

//created maha 042004 called frim dw_field double click as well as ole_edit dragdrop for to trap for address type

IF ii_align = 1 OR ii_copy_fields = 1 THEN
	MessageBox("Tools", "You must select the SELECT FIELD tool from the tools menu to select a field." )
	Return -1
END IF
ib_new_select = True

ll_Row = tab_1.tabpage_design.dw_field.GetRow()			//Added by Scofield on 2008-11-28
if ll_Row <= 0 or ll_Row > tab_1.tabpage_design.dw_field.RowCount() then Return -1

//maha 042004 address link trap
if tab_1.tabpage_design.dw_field.GetItemNumber( ll_Row,"field_id") = 91125 or tab_1.tabpage_design.dw_field.GetItemNumber( ll_Row,"parent_field") = 91125 then
	messagebox("Mapping error","The field Address Type cannot be mapped.  It can only be used for Query Filters.")
	return -1
end if
//maha 020405 billing address trap
if tab_1.tabpage_design.dw_field.GetItemNumber( ll_Row,"field_id") = 11223361 or tab_1.tabpage_design.dw_field.GetItemNumber( ll_Row,"parent_field") = 11223361 then
	messagebox("Mapping error","The field Billing Address Id cannot be mapped.  It can only be used in a Query.")
	return -1
end if

of_select_button()
return 1

end function

public function integer of_field_name_visible ();//function created maha 032304

if tab_1.selectedtab = 3 and is_preview_mode = "Train" then
	st_field_name.visible = true
else
	st_field_name.visible = false
end if

return 1
end function

public function integer of_clean_data ();//function created 051104 maha to delete mapping data known to cause crashes. Called in open event of window

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-22
//$<modify> 02.09.2006 By: owen chen
//$<reason> Performance tuning
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

/*
Delete From app_field_prop 
Where field_description Is Null
USING tr_training_data;

Delete From app_field_prop 
Where y_pos < 1
USING tr_training_data;

Delete From app_field_prop 
Where x_pos < 1
USING tr_training_data;

COMMIT USING SQLCA;

update app_field_prop 
set width = 1 
Where width < 1 or width is null
USING tr_training_data;

COMMIT USING SQLCA;
*/

gnv_appeondb.of_startqueue( )

Delete From app_field_prop 
Where field_description Is Null
USING tr_training_data;

Delete From app_field_prop 
Where y_pos < 1
USING tr_training_data;

Delete From app_field_prop 
Where x_pos < 1
USING tr_training_data;

COMMIT USING SQLCA;

update app_field_prop 
set width = 1 
Where width < 1 or width is null
USING tr_training_data;

COMMIT USING SQLCA;

gnv_appeondb.of_commitqueue( )

//---------------------------- APPEON END ----------------------------

return 1
end function

public function integer of_addr_query_setup ();//maha created 030905 for the address query fields for group data

Integer li_found
Integer li_retval
String ls_lookup_code
String ls_lookup_type
String ls_data
integer chk
DataWindowChild dwchild
		
li_retval = tab_1.tabpage_design.dw_fld_prop.GetChild( "query_field_addr", dwchild )
	dwchild.SetTransObject( w_train_app.tr_training_data )
	dwchild.Retrieve( 20)//address table
	ls_data = tab_1.tabpage_design.dw_fld_prop.GetItemString( 1, "query_field_addr" )
	li_found = dwchild.Find( "field_name = '" + ls_data + "'", 1, 10000 )
	IF li_found > 0 THEN
		IF upper(ls_data) = "ACTIVE_STATUS" THEN
			tab_1.tabpage_design.dw_fld_prop.Modify( "query_value_addr.dddw.name = 'd_code_lookup_active_inactive'")
			tab_1.tabpage_design.dw_fld_prop.Modify( "query_value_addr.dddw.datacolumn = 'lookup_code'")			
			tab_1.tabpage_design.dw_fld_prop.Modify( "query_value_addr.dddw.displaycolumn = 'description'")
			tab_1.tabpage_design.dw_fld_prop.Modify( "query_value_addr.dddw.UseAsBorder = 'Yes'")
		else
			ls_lookup_code = dwchild.GetItemString( li_found, "lookup_code" )
			ls_lookup_type = dwchild.GetItemString( li_found, "lookup_type" )
			if ls_lookup_type = "C" or ls_lookup_type = "A" then
				IF ls_lookup_type = "C" THEN
					tab_1.tabpage_design.dw_fld_prop.Modify( "query_value_addr.dddw.name = 'd_dddw_code_lookup'")
					tab_1.tabpage_design.dw_fld_prop.Modify( "query_value_addr.dddw.datacolumn = 'lookup_code'")			
					tab_1.tabpage_design.dw_fld_prop.Modify( "query_value_addr.dddw.displaycolumn = 'description'")						
				ELSEIF ls_lookup_type = "A" THEN
					tab_1.tabpage_design.dw_fld_prop.Modify( "query_value_addr.dddw.name = 'd_dddw_address_lookup'")
					tab_1.tabpage_design.dw_fld_prop.Modify( "query_value_addr.dddw.datacolumn = 'lookup_code'")			
					tab_1.tabpage_design.dw_fld_prop.Modify( "query_value_addr.dddw.displaycolumn = 'entity_name'")
				end if
				tab_1.tabpage_design.dw_fld_prop.GetChild( "query_value_addr", dwchild )
				dwchild.SetTransObject( w_train_app.tr_training_data )
				dwchild.Retrieve( ls_lookup_code )
			end if
		end if
	END IF
	
	
return 1
end function

public function integer of_check_for_image ();//maha created 031505 to trap for functions run with no image available

if tab_1.tabpage_design.ole_edit.Object.Imagedisplayed = false then
	messagebox("Application","There is no Application Image.")
	return -1 //maha 031505
else 
	return 1
end if
end function

public function integer of_set_query_lookup (string as_lookup, string as_data, string as_lookup_code, string as_field);//maha created 042205 for setting the the query value lookups
//called from dw_fld_prop itemchanged and retrieveend as well as of_update

datawindowchild dwchild
		
//messagebox("of_setup_query_lookup","")
//debugbreak()
//Start Code Change ---- 02.09.2006 #256 maha	
iF as_lookup = "C" or as_lookup = "A" or as_lookup = "Q"  then
	IF as_lookup = "C" THEN
		tab_1.tabpage_design.dw_fld_prop.Modify( as_field + ".dddw.name = 'd_dddw_code_lookup'")
		tab_1.tabpage_design.dw_fld_prop.Modify( as_field + ".dddw.datacolumn = 'lookup_code'")			
		tab_1.tabpage_design.dw_fld_prop.Modify( as_field + ".dddw.displaycolumn = 'description'")						
	ELSEIF as_lookup = "A" THEN
		tab_1.tabpage_design.dw_fld_prop.Modify( as_field + ".dddw.name = 'd_dddw_address_lookup'")
		tab_1.tabpage_design.dw_fld_prop.Modify( as_field + ".dddw.datacolumn = 'lookup_code'")			
		tab_1.tabpage_design.dw_fld_prop.Modify( as_field + ".dddw.displaycolumn = 'entity_name'")
	
	ELSEIF as_lookup = "Q" THEN
		tab_1.tabpage_design.dw_fld_prop.Modify( as_field + ".dddw.name = 'd_dddw_quest_lookup_ia'")
		tab_1.tabpage_design.dw_fld_prop.Modify( as_field + ".dddw.datacolumn = 'quest_id'")			
		tab_1.tabpage_design.dw_fld_prop.Modify( as_field + ".dddw.displaycolumn = 'short_quest'")
		as_lookup_code = ""
	END IF
//End Code Change---02.09.2006	
	tab_1.tabpage_design.dw_fld_prop.GetChild( as_field , dwchild )
	dwchild.SetTransObject( w_train_app.tr_training_data )
	dwchild.Retrieve( as_lookup_code )
	dwchild.insertrow(0)  //Start Code Change ---- 05.30.2007 #V7 maha added to make the dropdown open another line deeper
	dwchild.scrolltorow(0)
	dwchild.setrow(0)
ELSEIF Upper( as_data ) = "ACTIVE_STATUS" THEN
	tab_1.tabpage_design.dw_fld_prop.Modify( as_field + ".dddw.name = 'd_code_lookup_active_inactive'")
	tab_1.tabpage_design.dw_fld_prop.Modify( as_field + ".dddw.datacolumn = 'lookup_code'")			
	tab_1.tabpage_design.dw_fld_prop.Modify( as_field + ".dddw.displaycolumn = 'description'")	
//Start Code Change ---- 06.15.2006 #548 maha	
else //not a lookup
	tab_1.tabpage_design.dw_fld_prop.Modify( as_field + ".dddw.name = ''")
END IF

return 1
end function

public function integer of_app_audit_track (long ai_appid);//Start Code Change ---- 02.22.2006 #280 maha
//function created maha 022206 to create audit records for applications
string ls_sql
string ls_date
date ld_today = today()
time lt_now = now()
long ll_rec
//string q = "'"
ls_date = string(year(ld_today)) + "-" + string(month(ld_today)) + "-" + string(day(ld_today))
ls_date = ls_date + " " + string(lt_now)
if ib_audit then
	select max(rec_id) into :ll_rec from app_hdr_audit;
	if isnull(ll_rec) then ll_rec = 0
	ll_rec++
	ls_sql = "Insert into app_hdr_audit(rec_id,app_id,change_date,user_id) values (" + string(ll_rec) + "," + string(ai_appid) + ",'" + ls_date +  "','" + gs_user_id + "' )" 
	//messagebox("",ls_sql)
	execute immediate :ls_sql using tr_training_data;
	ib_audit = false
end if

return 1
//End Code Change---02.22.2006

end function

private function integer of_cleanup (integer ai_prev_scrollx, integer ai_prev_scrolly);//////////////////////////////////////////////////////////////////////
// $<function>w_train_appof_cleanup()
// $<arguments> value	integer	ai_prev_scrollx
//	$<arguments> value	integer	ai_prev_scrolly						
// $<returns> integer
// $<description>
//////////////////////////////////////////////////////////////////////
// $<add> 01.13.2006 by Wang Chao
//////////////////////////////////////////////////////////////////////
ib_loading_annotations = False

tab_1.tabpage_design.ole_edit.object.ScrollPositionX( ai_prev_scrollX )		
tab_1.tabpage_design.ole_edit.object.ScrollPositionY( ai_prev_scrollY )			

//tab_1.tabpage_design.ole_edit.SetRedraw( True ) //avoiding screen blinks

w_train_app.tab_1.tabpage_design.st_field.Text = "Loading complete."

tab_1.tabpage_design.ole_edit.object.Annotationtype(11)		

tab_1.tabpage_design.uo_bar.Visible = False

Return 0
end function

public function integer of_query_batch_update ();integer li_selected_cnt
integer i

//msg.Text = " Click on each field that you want to copy then click the PASTE icon."
//w_train_app.st_msg.Visible = True

li_selected_cnt = UpperBound( is_selected_fields )  // I made it -1 because it made it work but not sure why???


FOR i = 1 TO li_selected_cnt
	
	
	ii_app_field_id = of_get_app_field_id(is_selected_fields[i])
	tab_1.tabpage_design.dw_fld_prop.Retrieve( ii_app_field_id )
//Start Code Change ---- 06.14.2006 #541 maha
	IF i = 1 THEN //for the first field only
		OpenWithParm( w_get_query_data, String( ii_app_field_id ) )
		//--------------------------- APPEON BEGIN ---------------------------
		//$<comment> 2006-08-15 By: Liu Hongxin
		//$<reason> the window is invalid.
		/*
		w_get_query_data.cbx_only.visible = true
		*/
		//---------------------------- APPEON END ----------------------------
	end if
	
	if message.stringparm = "Cancel" then 
		//do nothing
		exit
	else
		tab_1.tabpage_design.dw_fld_prop.SetItem( 1, "record_number", ii_cf_record_number )	
		if ii_cf_skip_query = 0 then //do not set if set to record num only
			tab_1.tabpage_design.dw_fld_prop.SetItem( 1, "query_field", ii_cf_query_field )	
			tab_1.tabpage_design.dw_fld_prop.SetItem( 1, "query_operator", ii_cf_query_operator )	
			tab_1.tabpage_design.dw_fld_prop.SetItem( 1, "query_value", ii_cf_query_value )	
			tab_1.tabpage_design.dw_fld_prop.SetItem( 1, "past_years_query", ii_cf_past_years_query )
		end if	
		tab_1.tabpage_design.dw_fld_prop.Update()
	end if
next

ii_cf_skip_query = 0 //reset the value
//End Code Change---06.14.2006
w_train_app.of_enable_buttons()

return 1
end function

public function integer of_dupe_field_test (string as_field);//Start Code Change ---- 05.30.2006 #490 maha  //added to check for duplicate selected fields

integer i
integer ic

for i = 1 to upperbound(is_selected_fields)
	if as_field = is_selected_fields[i] then
		return 1
	end if
next

return 0
	

end function

public function long of_get_app_field_id (string as_selected_field);//Start Code Change ---- 05.05.2006 #514 maha //maha added to strip app_id 
long ll_ret
string ls_field

ls_field = as_selected_field


IF Upper(Right( ls_field, 6 )) = "YESBOX" THEN
		ll_ret = long( Mid( ls_field, 1, Len( ls_field ) - 6) )
	ELSEIF Upper(Right( ls_field, 5 )) = "NOBOX" THEN
		ll_ret = long( Mid( ls_field, 1, Len( ls_field ) - 5) )	
	ELSEIF Upper(Left( ls_field, 3 )) = "SP-" THEN		
		ll_ret = long( Mid( ls_field, Pos( ls_field, "," ) + 1, 100 ) )
	ELSEIF Upper(Right( ls_field, 5 )) = "CHECK" THEN		
		ll_ret = long( Mid( ls_field, 1, Len( ls_field ) - 5) )	
	ELSE
		ll_ret = long( ls_field)
END IF

return ll_ret
end function

public subroutine of_retrieve_tables_fields ();//Added to retrieve tables and fields

tab_1.tabpage_design.dw_fld_prop.SetTransObject( w_train_app.tr_training_data )
tab_1.tabpage_design.dw_field.SetTransObject( w_train_app.tr_training_data )
tab_1.tabpage_design.dw_screen.SetTransObject( w_train_app.tr_training_data )

gnv_appeondb.of_startqueue( )

tab_1.tabpage_design.dw_field.Retrieve( 1 )	
tab_1.tabpage_design.dw_screen.Retrieve( )

gnv_appeondb.of_commitqueue( )

tab_1.tabpage_design.dw_screen.SelectRow( 1, True )
tab_1.tabpage_design.dw_screen.SetRow( 1 )
end subroutine

public function integer of_set_yes_no_box (datawindow as_dw, string as_data);//Start Code Change ---- 08.29.2007 #V7 maha
//function created maha 8-29-07 to correct old bug (orig code) 

datawindowchild dwchild
string ls_lookup_code
integer li_nr
string ls_val

//IF This.GetColumnName() = "object_type" AND (data = 'Y1' OR data = 'Y2' OR data = "C" OR data = "B" ) THEN

as_dw.GetChild( "box_yes_value", dwchild )
ls_lookup_code = as_dw.GetItemString( 1, "lookup_code")
as_dw.GetChild( "box_yes_value", dwchild )
dwchild.SetTransObject( w_train_app.tr_training_data )
dwchild.Retrieve( ls_lookup_code )		
 as_dw.GetChild( "box_no_value", dwchild )
ls_lookup_code =  as_dw.GetItemString( 1, "lookup_code")
as_dw.GetChild( "box_no_value", dwchild )
dwchild.SetTransObject( w_train_app.tr_training_data )
//messagebox("2", ls_lookup_code )	
dwchild.Retrieve( ls_lookup_code )			

 as_dw.GetChild( "box_yes_value", dwchild )
li_nr = dwchild.InsertRow( 0 )
dwchild.SetItem( li_nr, "code", "Is Null" )
li_nr = dwchild.InsertRow( 0 )
dwchild.SetItem( li_nr, "code", "Is Not Null" )	
 as_dw.GetChild( "box_no_value", dwchild )
li_nr = dwchild.InsertRow( 0 )
dwchild.SetItem( li_nr, "code", "Is Null" )
li_nr = dwchild.InsertRow( 0 )
dwchild.SetItem( li_nr, "code", "Is Not Null" )	

//ls_val = as_data
//messagebox("",ls_val)

//this functionality is in the dw itself
//if ls_val = "Y1" then //select box
//	as_dw.Modify( "box_no_value_t.visible = 1")
//	as_dw.Modify( "box_no_value.visible = 1")
//else
//	as_dw.Modify( "box_no_value_t.visible = 0")
//	as_dw.Modify( "box_no_value.visible = 0")
//end if	
//
//if ls_val = "T" then //text
//	as_dw.Modify( "box_yes_value.visible = 0")
//	as_dw.Modify( "box_yes_value_t.visible = 0")
//else
//	as_dw.Modify( "box_yes_value.visible = 1")
//	as_dw.Modify( "box_yes_value_t.visible = 1")
//end if


return 1
end function

public function integer of_scanner_select ();//Start Code Change ----02.21.2008 #V8 maha -  added new
image_functions.of_select_scanner(   tab_1.tabpage_design.ole_scan)  

return 1
end function

public function integer of_set_preview_mode (string as_mode);//Start Code Change ----12.03.2008 #V85 maha - function created to set train/preview objects
long ll_handle
long ll_page,ll_pagecount

ll_handle = handle(w_mdi)

IF as_mode = "Preview" THEN  //from train to preview 
	tab_1.tabpage_design.uo_preview.Visible = True
	tab_1.tabpage_design.uo_preview.BringToTop = True
	st_page_num.Visible = False	
	tab_1.tabpage_design.dw_field.Visible = False
	tab_1.tabpage_design.ole_edit.Visible = False
	is_preview_mode = "Preview"
	w_mdi.ChangeMenu( m_pfe_train_app_preview )
	w_mdi.SetToolbarPos ( 2, 1, 200, False)
	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> UM-01
	//$<add> 01.13.2006 By: Rodger Wu
	//$<reason> The SetToolbarPos function is currently unsupported. 
	//$<modification> Replace the SetToolBarPos function with the Appeon defined function of_settoolbarpos to provide
	//$<modification> the same functionality.
	If appeongetclienttype() <> 'PB' Then 
		gnv_appeondll.of_settoolbarpos(ll_handle)
		gnv_appeondll.of_SetToolbar(ll_handle,3, False )
		gnv_appeondll.of_SetToolbar(ll_handle,4, False )
		gnv_appeondll.of_SetToolbar(ll_handle,5, False )
	End If
	//---------------------------- APPEON END ----------------------------

	w_mdi.of_menu_security( "m_pfe_train_app_preview" )
	st_page_num.Visible = False	
	

//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 06/19/2007 By: Ken.Guo
//$<reason> For Page menu control.
/*
	IF tab_1.tabpage_design.ole_edit.Object.PageCount() = ii_current_page THEN
		gnv_app.of_modify_menu_attr( m_pfe_train_app.m_view.m_priorpage,'Enabled', True)
		gnv_app.of_modify_menu_attr( m_pfe_train_app.m_view.m_nextpage,'Enabled', False)
	ELSEIF ii_current_page < tab_1.tabpage_design.ole_edit.Object.PageCount() AND ii_current_page > 1 THEN
		gnv_app.of_modify_menu_attr( m_pfe_train_app.m_view.m_priorpage,'Enabled', True)
		gnv_app.of_modify_menu_attr( m_pfe_train_app.m_view.m_nextpage,'Enabled', True)
	END IF
*/

	ll_page = tab_1.tabpage_design.uo_preview.ole_edit.object.Page()
	ll_pagecount = tab_1.tabpage_design.uo_preview.ole_edit.object.PageCount()
	IF ll_page = 1 and ll_page = ll_pagecount Then
		gnv_app.of_modify_menu_attr( m_pfe_train_app.m_view.m_priorpage,'Enabled', False)
		gnv_app.of_modify_menu_attr( m_pfe_train_app.m_view.m_nextpage,'Enabled', False)
	ElseIf ll_page = ll_pagecount Then
		gnv_app.of_modify_menu_attr( m_pfe_train_app.m_view.m_priorpage,'Enabled', True)
		gnv_app.of_modify_menu_attr( m_pfe_train_app.m_view.m_nextpage,'Enabled', False)
	ElseIf ll_page < ll_pagecount and ll_page > 1 Then 
		gnv_app.of_modify_menu_attr( m_pfe_train_app.m_view.m_priorpage,'Enabled', True)
		gnv_app.of_modify_menu_attr( m_pfe_train_app.m_view.m_nextpage,'Enabled', True)
	ElseIf ll_page < ll_pagecount and ll_page = 1 Then
		gnv_app.of_modify_menu_attr( m_pfe_train_app.m_view.m_priorpage,'Enabled', False)
		gnv_app.of_modify_menu_attr( m_pfe_train_app.m_view.m_nextpage,'Enabled', True)		
	End If
//---------------------------- APPEON END ----------------------------


ELSE //from preview to train
	//m_pfe_train_app.m_file.m_previewpage.toolbaritemname = "ExecuteSQL5!"
	//m_pfe_train_app.m_file.m_previewpage.toolbaritemtext = "Preview"	

	tab_1.tabpage_design.uo_preview.Visible = False
	tab_1.tabpage_design.uo_preview.BringToTop = False
	
//	tab_1.tabpage_design.uo_preview.of_load_app() //Added By Ken.Guo at 2007-06-19

//	IF tab_1.tabpage_design.ole_edit.Object.Image() <> '' THEN
//		tab_1.tabpage_design.ole_edit.Object.ShowAnnotationGroup( )
//	END IF
	//st_field_name.Visible = True
	st_page_num.Visible = True	
	tab_1.tabpage_design.dw_field.Visible = True
	tab_1.tabpage_design.ole_edit.Visible = True
	is_preview_mode = "Train"		
	w_mdi.ChangeMenu( m_pfe_train_app )
	w_mdi.SetToolbarPos ( 2, 1, 200, False)
	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> UM-02
	//$<add> 01.13.2006 By: Rodger Wu
	//$<reason> The SetToolbarPos function is currently unsupported. 
	//$<modification> Replace the SetToolBarPos function with the Appeon defined function of_settoolbarpos to provide
	//$<modification> the same functionality.
	If appeongetclienttype() <> 'PB' Then 
		gnv_appeondll.of_settoolbarpos(ll_handle)
		gnv_appeondll.of_SetToolbar(ll_handle,3, False )
		gnv_appeondll.of_SetToolbar(ll_handle,4, False )
		gnv_appeondll.of_SetToolbar(ll_handle,5, False )
	End If
	//---------------------------- APPEON END ----------------------------
	
	w_mdi.of_menu_security( "m_pfe_train_app" )
	IF tab_1.tabpage_design.ole_edit.Object.Image <> '' THEN	
		IF tab_1.tabpage_design.ole_edit.Object.PageCount() = ii_current_page THEN
			gnv_app.of_modify_menu_attr( m_pfe_train_app.m_view.m_priorpage,'Enabled', True)
			gnv_app.of_modify_menu_attr( m_pfe_train_app.m_view.m_nextpage,'Enabled', False)
		ELSEIF ii_current_page < tab_1.tabpage_design.ole_edit.Object.PageCount() AND ii_current_page > 1 THEN
			gnv_app.of_modify_menu_attr( m_pfe_train_app.m_view.m_priorpage,'Enabled', True)
			gnv_app.of_modify_menu_attr( m_pfe_train_app.m_view.m_nextpage,'Enabled', True)
		END IF	
	END IF
END IF

of_field_name_visible( ) //Start Code Change ----11.06.2008 #V85 maha

return 1
end function

on w_train_app.create
int iCurrent
call super::create
this.st_page_num=create st_page_num
this.st_field_name=create st_field_name
this.st_align=create st_align
this.st_msg=create st_msg
this.st_connect=create st_connect
this.tab_1=create tab_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_page_num
this.Control[iCurrent+2]=this.st_field_name
this.Control[iCurrent+3]=this.st_align
this.Control[iCurrent+4]=this.st_msg
this.Control[iCurrent+5]=this.st_connect
this.Control[iCurrent+6]=this.tab_1
end on

on w_train_app.destroy
call super::destroy
destroy(this.st_page_num)
destroy(this.st_field_name)
destroy(this.st_align)
destroy(this.st_msg)
destroy(this.st_connect)
destroy(this.tab_1)
end on

event key;//--------------------------- APPEON BEGIN ---------------------------
//$<comment> 05.13.2006 By: Cao YongWang
//$<reason> 
//$<modification>  The following scripts moved to the key_down event in ole_edit control
/*
Long li_x_pos
Long li_y_pos

SetPointer( Arrow! )

ib_contol_key_down = False

if tab_1.selectedtab = 3 then //maha changed 11-28-00 to allow enter key on other tabs  
	IF tab_1.tabpage_design.dw_fld_prop.RowCount() = 1 AND +&
		( key = KeyDownArrow! OR key = KeyUpArrow! OR key =  KeyLeftArrow! OR key = KeyRightArrow! ) AND +&
		ib_label_selected = False THEN
		//This.tab_1.tabpage_design.ole_edit.SetRedraw( False )	//avoiding screen blinks on web application
		li_x_pos = tab_1.tabpage_design.dw_fld_prop.GetItemNumber( 1, "x_pos" )
		li_y_pos = tab_1.tabpage_design.dw_fld_prop.GetItemNumber( 1, "y_pos" )
		IF KeyDown( KeyControl! ) AND KeyDown( KeyRightArrow! ) THEN 
			of_auto_align()
			//This.tab_1.tabpage_design.ole_edit.SetRedraw( True )			//avoiding screen blinks on web application
			Return
		ELSEIF key = KeyDownArrow! THEN
			ib_moving_field = True
			li_y_pos = li_y_pos + 1 - tab_1.tabpage_design.ole_edit.Object.ScrollPositionY()
			li_x_pos = li_x_pos - tab_1.tabpage_design.ole_edit.Object.ScrollPositionX()
		ELSEIF key = KeyUpArrow! THEN
			ib_moving_field = True
			li_y_pos = li_y_pos - 1	- tab_1.tabpage_design.ole_edit.Object.ScrollPositiony()
			li_x_pos = li_x_pos - tab_1.tabpage_design.ole_edit.Object.ScrollPositionX()	
		ELSEIF key = KeyLeftArrow! THEN
			li_x_pos = li_x_pos - 1	- tab_1.tabpage_design.ole_edit.Object.ScrollPositionX()
			li_y_pos = li_y_pos - tab_1.tabpage_design.ole_edit.Object.ScrollPositionY()	
		ELSEIF key = KeyRightArrow! THEN
			li_x_pos = li_x_pos + 1	- tab_1.tabpage_design.ole_edit.Object.ScrollPositionX()	
			li_y_pos = li_y_pos - tab_1.tabpage_design.ole_edit.Object.ScrollPositionY()	
		END IF
	
		ii_ancor_x = li_x_pos
		ii_ancor_y = li_y_pos
	
		IF key = KeyDownArrow! OR key = KeyUpArrow! THEN
			tab_1.tabpage_design.dw_fld_prop.SetItem( 1, "y_pos", ii_ancor_y )
		ELSEIF key = KeyLeftArrow! OR key = KeyRightArrow! THEN
			tab_1.tabpage_design.dw_fld_prop.SetItem( 1, "x_pos", ii_ancor_x )
		END IF
	
		tab_1.tabpage_design.cb_apply.TriggerEvent( Clicked! )
		ib_moving_field = False
		//This.tab_1.tabpage_design.ole_edit.SetRedraw( True )	//avoiding screen blinks on web application
	ELSEIF ib_label_selected THEN
		MessageBox("Invalid", "Only the mouse can be used to adjust objects that are not fields.")
	END IF
	
	IF KeyDown( KeyControl! ) THEN
		ib_contol_key_down = True
		w_train_app.title = "key control"
	END IF

end if
*/
//---------------------------- APPEON END ----------------------------
end event

event closequery;String	ls_Rtn
Long 		li_ans

IF ib_saved = False THEN //tab_1.tabpage_design.ole_edit.Object.ImageModified = True AND tab_1.SelectedTab = 3 THEN
	li_ans = MessageBox( "Save", "Save changes to application?", Question!, YesNo!, 1 )
	IF li_ans = 1 THEN
		COMMIT USING tr_training_data;
		
		//--------------------------- APPEON BEGIN ---------------------------
		//$< Add  > 2008-07-17 By: Scofield
		//$<Reason> Verify if the directory has write right for the current user.
		
		ls_Rtn = f_ExaWriteRight(tab_1.tabpage_design.ole_edit.Object.Image)
		if Len(ls_Rtn) > 0 then
			MessageBox(gnv_app.iapp_object.DisplayName,ls_Rtn,Exclamation!)
			Return 1
		end if
		//---------------------------- APPEON END ----------------------------
		
		of_delete_annotations( )
		tab_1.tabpage_design.ole_edit.Object.Save()

		//--------------------------- APPEON BEGIN ---------------------------
		//$<add> 2006-09-27 By: Rodger Wu
		//$<reason> Fix a defect.
		
		n_appeon_storage_area lnv_storage_area
		
		IF gnv_data.of_GetItem( "icred_settings", "image_storage_type", False ) = '1' or appeongetclienttype() = "WEB" THEN
			lnv_storage_area.of_upload_app_image( ii_app_id, is_app_path + String( ii_app_id ) + ".tif")
		END IF
		
		//---------------------------- APPEON END ----------------------------

	ELSE
		ROLLBACK USING tr_training_data;
	END IF
END IF	
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-23
//$<add> 04.04.2006 By: Rodger Wu
//$<reason> Performance Tuning
//$<reason> Destroy the datastore to release the memory.
If isvalid( ids_queryfield ) Then DESTROY ids_queryfield;
//---------------------------- APPEON END ----------------------------

DISCONNECT USING tr_training_data;
DESTROY tr_training_data;

//DISCONNECT USING SQLCA; //removed maha 032304
//
//SQLCA.DBMS = "ODBC"
//
//if gi_test_database = 1 then //maha 123102
//	SQLCA.DbParm="ConnectString='DSN=IntelliCred Test;UID=" + gs_user_id + ";PWD=" + gs_password + "',DelimitIdentifier='No'"
//else
//	SQLCA.DbParm="ConnectString='DSN=IntelliCred Client;UID=" + gs_user_id + ";PWD=" + gs_password + "',DelimitIdentifier='No'"
//end if
//
//SQLCA.AutoCommit = TRUE
//	
//CONNECT USING SQLCA;

try
	Delete From app_field_prop //maha 050102
	Where field_description Is Null
	USING SQLCA;
	IF SQLCA.SQLCODE = -1 THEN
		MessageBox( "Database Error", sqlca.SQLERRTEXT )
	END IF
	COMMIT USING SQLCA;
catch (runtimeerror a)
end try
	

Long i
//the followint does nothing
//FOR i = 1 TO 100
//	FILEDELETE( gs_dir_path + "printtemp" + String( i ) + ".tif" )
//END FOR

DESTROY image_functions

w_mdi.ChangeMenu( m_pfe_cst_mdi_menu )
w_mdi.of_menu_security( "m_pfe_cst_mdi_menu" )

IF IsValid( w_section_templates ) THEN
	Close( w_section_templates )
END IF

IF IsValid( w_place_template_msg ) THEN
	Close( w_place_template_msg )
END IF

end event

event open;call super::open;tr_training_data = CREATE n_tr

Long li_wide_screen_mapping

//SELECT set_16 INTO :li_wide_screen_mapping FROM icred_settings;
li_wide_screen_mapping = of_get_app_setting("set_16","I")

IF li_wide_screen_mapping = 0 THEN
	ib_wide_screen = True
	//x=700
else //maha 101404 to allow turning off auto resize
	ib_wide_screen = False
END IF


IF Message.StringParm = "iApply" THEN
	 tr_training_data = tab_1.tabpage_design.uo_preview.of_connections( "iApply", "IntelliCred Client46" )
	//tab_1.tabpage_batch.uo_print.of_connections( "iApply", "Account_41" )	
ELSE
	 tr_training_data = tab_1.tabpage_design.uo_preview.of_connections( "IntelliCred", "0" )
	//tab_1.tabpage_batch.uo_print.of_connections( "IntelliCred", "0" )	
END IF

// mskinner 10 March 2005 -- begin
// gey out if the connection to tr_training_data is not made
//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 2005-11-25 By: Zhang Lingping
//$<reason> use sqlcode replace sqlreturndata to check the connection is ok.

//if len(tr_training_data.sqlreturndata) < 1 then 
if tr_training_data.sqlcode < 0 then 
//---------------------------- APPEON END ----------------------------
	close(this)
	return 
end if
// mskinner 10 March 2005 -- end

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-24
//$<modify> 02.09.2006 By: owen chen
//$<reason> Performance tuning. 
//$<modification> Write script to retrieve data from a cache instead of from the database.

/*
SELECT ids.intelliapp_app_path  
INTO :is_app_path  
FROM ids
USING tr_training_data;
IF tr_training_data.SQLCODE = -1 THEN
	MessageBox("SQL ERROR", tr_training_data.SQLERRTEXT )
END IF
*/
is_app_path = gnv_data.of_getitem("ids","intelliapp_app_path",false)
//--------------------------- APPEON END ---------------------------

tab_1.tabpage_select.tab_facility.tabpage_facility.dw_facility_browse.SetTransObject( tr_training_data )
tab_1.tabpage_select.tab_facility.tabpage_facility.dw_facility_detail.SetTransObject( tr_training_data )
tab_1.tabpage_select.tab_facility.tabpage_apps.dw_app_detail.SetTransObject( tr_training_data )
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-25
//$<comment> 04.03.2006 By: Rodger Wu
//$<reason> Performance Tuning
//$<reason> Comment out redundant script line.
tab_1.tabpage_select.tab_facility.tabpage_facility.dw_facility_browse.Retrieve()
//---------------------------- APPEON END ----------------------------


gs_app_image_path = is_app_path

image_functions = CREATE pfc_cst_nv_image_functions 

of_clean_data() //maha 051104

IF POS( Message.StringParm, "FIX") > 0  THEN
	
	
END IF



//w_train_app.SetToolbarPos ( 2, 1, 200, False)	
end event

event activate;call super::activate;//make the copy, cut, paste toolbar invisible


//IF tab_1.SelectedTab = 1 THEN
//	w_mdi.ChangeMenu( m_pfe_train_app_setup )
//	w_mdi.SetToolbarPos ( 2, 1, 200, False)	
//	IF tab_1.tabpage_select.tab_facility.SelectedTab = 1 THEN
//		m_pfe_train_app_setup.m_tools.visible = False
//		m_pfe_train_app_setup.m_tools.ToolBarItemVisible = False
//		m_pfe_train_app_setup.m_tools.m_testapplication.visible = False
//		m_pfe_train_app_setup.m_tools.m_testapplication.ToolBarItemvisible = False			
//	ELSE
//		m_pfe_train_app_setup.m_tools.visible = True
//		m_pfe_train_app_setup.m_tools.ToolBarItemVisible = True
//		m_pfe_train_app_setup.m_tools.m_testapplication.visible = True
//		m_pfe_train_app_setup.m_tools.m_testapplication.ToolBarItemvisible = True			
//	END IF
//ELSEIF tab_1.SelectedTab = 2 THEN
//	IF is_preview_mode = "Train" THEN
//		w_mdi.ChangeMenu( m_pfe_train_app )
//		w_mdi.SetToolbarPos ( 2, 1, 200, False)	
//	ELSE
//		w_mdi.ChangeMenu( m_pfe_train_app_preview )
//		w_mdi.SetToolbarPos ( 2, 1, 200, False)	
//	END IF
//END IF
//
//
//w_mdi.SetToolbar( 3, False )
//w_mdi.SetToolbar( 4, False)		
//w_mdi.SetToolbar( 5, False)		
//
w_mdi.setredraw(false)
//st_field_name.Visible = False

//change menus
IF tab_1.SelectedTab = 3 THEN
	//st_field_name.Visible = True
	IF is_preview_mode = "Train" THEN
		//--------------------------- APPEON BEGIN ---------------------------
		//$<add> 04.10.2006 By: Cao YongWang
		//$<reason>Fix a defect.
		/*
		w_mdi.ChangeMenu( m_pfe_train_app )
		*/
		If w_mdi.menuname <> 'm_pfe_train_app' Then w_mdi.ChangeMenu( m_pfe_train_app )
		//---------------------------- APPEON END ----------------------------
		w_mdi.SetToolbarPos ( 2, 1, 200, False)
		w_mdi.of_menu_security( "m_pfe_train_app" )
	ELSE
		//--------------------------- APPEON BEGIN ---------------------------
		//$<add> 04.10.2006 By: Cao YongWang
		//$<reason> Fix a defect.
		/*
		w_mdi.ChangeMenu( m_pfe_train_app_preview )
		*/
		If w_mdi.menuname <> 'm_pfe_train_app_preview' Then w_mdi.ChangeMenu( m_pfe_train_app_preview )
		//---------------------------- APPEON END ----------------------------
		w_mdi.SetToolbarPos ( 2, 1, 200, False)
		w_mdi.of_menu_security( "m_pfe_train_app_preview" )
	END IF
ELSEIF tab_1.SelectedTab = 1 THEN
	//--------------------------- APPEON BEGIN ---------------------------
	//$<add> 04.10.2006 By: Cao YongWang
	//$<reason> Fix a defect.
	/*
	w_mdi.ChangeMenu( m_pfe_train_app_setup )
	*/
	If w_mdi.menuname <> 'm_pfe_train_app_setup' Then w_mdi.ChangeMenu( m_pfe_train_app_setup )
	//---------------------------- APPEON END ----------------------------
	w_mdi.SetToolbar(3, False )
	w_mdi.of_menu_security( "m_pfe_train_app_setup" )
	
	IF tab_1.tabpage_select.tab_facility.SelectedTab = 2 THEN
		m_pfe_train_app_setup.m_tools.visible = True
		gnv_app.of_modify_menu_attr( m_pfe_train_app_setup.m_tools,'ToolBarItemVisible', True)
		m_pfe_train_app_setup.m_tools.m_testapplication.visible = True
		gnv_app.of_modify_menu_attr( m_pfe_train_app_setup.m_tools.m_testapplication,'ToolBarItemvisible', True)	
	ELSEIF tab_1.SelectedTab = 1 THEN
		m_pfe_train_app_setup.m_tools.visible = False
		gnv_app.of_modify_menu_attr( m_pfe_train_app_setup.m_tools,'ToolBarItemVisible', False)
		m_pfe_train_app_setup.m_tools.m_testapplication.visible = False
		gnv_app.of_modify_menu_attr( m_pfe_train_app_setup.m_tools.m_testapplication,'ToolBarItemvisible', False)	
	END IF	
	
END IF

w_mdi.SetToolbarPos ( 2, 1, 200, False)
w_mdi.SetToolbar( 3, False )
w_mdi.SetToolbar( 4, False)		
w_mdi.SetToolbar( 5, False)		

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> UM-11
//$<add> 01.13.2006 By: Rodger Wu
//$<reason> The SetToolbarPos function is currently unsupported. 
//$<modification> Replace the SetToolBarPos function with the Appeon defined function of_settoolbarpos to provide
//$<modification> the same functionality.
If appeongetclienttype() <> 'PB' Then
	long ll_handle
	ll_handle = handle(w_mdi)
	gnv_appeondll.of_settoolbarpos(ll_handle)
	gnv_appeondll.of_SetToolbar(ll_handle,3, False )
	gnv_appeondll.of_SetToolbar(ll_handle,4, False )
	gnv_appeondll.of_SetToolbar(ll_handle,5, False )
End If
w_mdi.setredraw(true)
of_field_name_visible( )
//---------------------------- APPEON END ----------------------------
end event

event pfc_save;Return 0
end event

event resize;call super::resize;
if ib_wide_screen = False then return //maha 101404


IF This.Width > 4000 THEN
	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> PT-26
	//$<modify> 03.10.2006 By: Liang QingShi
	//$<reason> The tab pages displayed on the Web is slight different from that in PB.
	//$<modification> Add a condition to make sure when IntelliCred is running on the Web
	//$<modification> /PB, the right script with corresponding setting for tab pages will be executed.
	/*
	Tab_1.Width = 4603
	Tab_1.Height = 2764
	
	tab_1.tabpage_design.ole_edit.Width = 3750
	tab_1.tabpage_design.ole_edit.Height = 1928
	tab_1.tabpage_design.ole_edit.x = 780
	tab_1.tabpage_design.ole_edit.y = 40
	
	//	tab_1.tabpage_design.uo_preview.Width = 3750
	//	tab_1.tabpage_design.uo_preview.Height = 1000
	//tab_1.tabpage_design.uo_preview.x = 
	//tab_1.tabpage_design.uo_preview.y = 40
		
	tab_1.tabpage_design.uo_preview.Width = 3800
	tab_1.tabpage_design.uo_preview.Height = 2500
	tab_1.tabpage_design.uo_preview.ole_edit.Height = 2450
	//tab_1.tabpage_design.uo_preview.ole_edit.Width = 4000	
	//tab_1.tabpage_design.uo_preview.ole_edit.Height = 3000
	//tab_1.tabpage_design.uo_preview.st_name.Width = 2500
	//	tab_1.tabpage_design.uo_preview.ole_edit.x = 780
	//	tab_1.tabpage_design.uo_preview.ole_edit.y = 40
		
		
	tab_1.tabpage_design.tab_fld_prop.Width = 2007
	tab_1.tabpage_design.tab_fld_prop.Height = 500
	tab_1.tabpage_design.tab_fld_prop.x = 780
	tab_1.tabpage_design.tab_fld_prop.y = 2004
	tab_1.tabpage_design.dw_fld_prop.Width = 1600
	tab_1.tabpage_design.dw_fld_prop.Height = 460
	tab_1.tabpage_design.dw_fld_prop.x = 805
	tab_1.tabpage_design.dw_fld_prop.y = 2020
	
	st_field_name.x = 833
	st_field_name.y = 2142
	
	tab_1.tabpage_design.dw_field.Width = 709
	tab_1.tabpage_design.dw_field.Height = 1284
	tab_1.tabpage_design.dw_field.x = 37
	tab_1.tabpage_design.dw_field.y = 1220
	
	tab_1.tabpage_design.dw_screen.Width = 709
	tab_1.tabpage_design.dw_screen.Height = 1136
	tab_1.tabpage_design.dw_screen.x = 37
	tab_1.tabpage_design.dw_screen.y = 40
	
	tab_1.tabpage_design.cb_apply.Width = 256
	tab_1.tabpage_design.cb_apply.Height = 84
	tab_1.tabpage_design.cb_apply.x = 2490
	tab_1.tabpage_design.cb_apply.y = 2384	
	*/

	If appeongetclienttype() = 'PB' Then

		Tab_1.Width = 4603
		Tab_1.Height = 2764
		
		tab_1.tabpage_design.ole_edit.Width = 3750
		
		tab_1.tabpage_design.ole_edit.Height = 1828
		
		tab_1.tabpage_design.ole_edit.x = 780
		tab_1.tabpage_design.ole_edit.y = 40
				
		tab_1.tabpage_design.uo_preview.Width = 5000
		tab_1.tabpage_design.uo_preview.Height = 2500
		tab_1.tabpage_design.uo_preview.ole_edit.Height = 2450			
			
		tab_1.tabpage_design.tab_fld_prop.Width = 2007
		tab_1.tabpage_design.tab_fld_prop.Height = 560
		tab_1.tabpage_design.tab_fld_prop.x = 780
		tab_1.tabpage_design.tab_fld_prop.y = tab_1.tabpage_design.ole_edit.y + tab_1.tabpage_design.ole_edit.Height + 20
		tab_1.tabpage_design.dw_fld_prop.Width = 1600
		tab_1.tabpage_design.dw_fld_prop.Height = 460
		tab_1.tabpage_design.dw_fld_prop.x = 804
		tab_1.tabpage_design.dw_fld_prop.y = tab_1.tabpage_design.tab_fld_prop.y + 100
		
		st_field_name.x = 833
		st_field_name.y = tab_1.tabpage_design.dw_fld_prop.y + 120
		
		tab_1.tabpage_design.dw_field.Width = 709
		tab_1.tabpage_design.dw_field.Height = 1254
		tab_1.tabpage_design.dw_field.x = 37
		tab_1.tabpage_design.dw_field.y = 1220
		
		tab_1.tabpage_design.dw_screen.Width = 709
		tab_1.tabpage_design.dw_screen.Height = 1136
		tab_1.tabpage_design.dw_screen.x = 37
		tab_1.tabpage_design.dw_screen.y = 40
		
		tab_1.tabpage_design.cb_apply.Width = 256
		tab_1.tabpage_design.cb_apply.Height = 84
		tab_1.tabpage_design.cb_apply.x = 2490
		tab_1.tabpage_design.cb_apply.y = 2304	
	else
		Tab_1.Width = 4603
		Tab_1.Height = 2564
		
		tab_1.tabpage_design.ole_edit.Width = 3750		
		tab_1.tabpage_design.ole_edit.Height = 1418		
		tab_1.tabpage_design.ole_edit.x = 780
		tab_1.tabpage_design.ole_edit.y = 40
					
		tab_1.tabpage_design.uo_preview.Width = 3800
		tab_1.tabpage_design.uo_preview.Height = 2090
		tab_1.tabpage_design.uo_preview.ole_edit.Height = 2000
						
		tab_1.tabpage_design.tab_fld_prop.Width = 2007
		tab_1.tabpage_design.tab_fld_prop.Height = 610
		tab_1.tabpage_design.tab_fld_prop.x = 780
		tab_1.tabpage_design.tab_fld_prop.y = tab_1.tabpage_design.ole_edit.y + tab_1.tabpage_design.ole_edit.Height + 20

		tab_1.tabpage_design.dw_fld_prop.Width = 1600
		tab_1.tabpage_design.dw_fld_prop.Height = 460
		tab_1.tabpage_design.dw_fld_prop.x = 805
		tab_1.tabpage_design.dw_fld_prop.y = tab_1.tabpage_design.tab_fld_prop.y + 100
		
		st_field_name.x = 833
		st_field_name.y = tab_1.tabpage_design.dw_fld_prop.y + 120
		
		tab_1.tabpage_design.dw_field.Width = 709
		tab_1.tabpage_design.dw_field.Height = 874
		tab_1.tabpage_design.dw_field.x = 37
		tab_1.tabpage_design.dw_field.y = 1220
		
		tab_1.tabpage_design.dw_screen.Width = 709
		tab_1.tabpage_design.dw_screen.Height = 1136
		tab_1.tabpage_design.dw_screen.x = 37
		tab_1.tabpage_design.dw_screen.y = 40
		
		tab_1.tabpage_design.cb_apply.Width = 256
		tab_1.tabpage_design.cb_apply.Height = 84
		tab_1.tabpage_design.cb_apply.x = 2490
		tab_1.tabpage_design.cb_apply.y = 1754	
	end if	
	//--------------------------- APPEON END ---------------------------
END IF
end event

event pfc_close;garbagecollect()
close(this)
end event

event pfc_postopen;call super::pfc_postopen;gnv_reg_ocx.of_check_ocx( 3, '', True) //Added by Ken.Guo on 2008-11-07
end event

type st_page_num from statictext within w_train_app
integer x = 823
integer y = 36
integer width = 443
integer height = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Page 1 of 100"
boolean focusrectangle = false
end type

type st_field_name from statictext within w_train_app
integer x = 1527
integer y = 1476
integer width = 1586
integer height = 60
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
string text = "No Field Selected"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

type st_align from statictext within w_train_app
boolean visible = false
integer x = 1486
integer y = 28
integer width = 2094
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 255
long backcolor = 67108864
boolean enabled = false
string text = "Select each field you want to align then click the appropriate align icon."
alignment alignment = right!
boolean focusrectangle = false
end type

type st_msg from statictext within w_train_app
boolean visible = false
integer x = 1518
integer y = 28
integer width = 2066
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 255
long backcolor = 67108864
boolean enabled = false
string text = " Click the position on the image where you want field placed."
alignment alignment = right!
boolean focusrectangle = false
end type

type st_connect from statictext within w_train_app
boolean visible = false
integer x = 1221
integer y = 24
integer width = 2359
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 255
long backcolor = 67108864
boolean enabled = false
string text = "Select each field you want to Connect then click the connect icon."
alignment alignment = right!
boolean focusrectangle = false
end type

type tab_1 from tab within w_train_app
event create ( )
event destroy ( )
integer x = 5
integer y = 4
integer width = 3589
integer height = 1964
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 79741120
boolean fixedwidth = true
boolean raggedright = true
alignment alignment = center!
integer selectedtab = 1
tabpage_select tabpage_select
tabpage_scan tabpage_scan
tabpage_design tabpage_design
tabpage_merge tabpage_merge
end type

on tab_1.create
this.tabpage_select=create tabpage_select
this.tabpage_scan=create tabpage_scan
this.tabpage_design=create tabpage_design
this.tabpage_merge=create tabpage_merge
this.Control[]={this.tabpage_select,&
this.tabpage_scan,&
this.tabpage_design,&
this.tabpage_merge}
end on

on tab_1.destroy
destroy(this.tabpage_select)
destroy(this.tabpage_scan)
destroy(this.tabpage_design)
destroy(this.tabpage_merge)
end on

event selectionchanging;//change menus
//--------------------------- APPEON BEGIN ---------------------------
//$<add> 01.13.2006 By: cao yongwang
//$<reason> 
w_mdi.setredraw(false)
//--------------------------- APPEON END ---------------------------
IF newindex = 3 THEN
	//st_field_name.Visible = True
	IF is_preview_mode = "Train" THEN
		w_mdi.ChangeMenu( m_pfe_train_app )
		w_mdi.SetToolbarPos ( 2, 1, 200, False)
		w_mdi.of_menu_security( "m_pfe_train_app" )
		st_page_num.Visible = True	
		//st_field_name.Visible = True
	ELSE
		st_page_num.Visible = False		
		//st_field_name.Visible = False
		w_mdi.ChangeMenu( m_pfe_train_app_preview )
		w_mdi.SetToolbarPos ( 2, 1, 200, False)
		w_mdi.of_menu_security( "m_pfe_train_app_preview" )
	END IF
ELSEIF newindex = 1 THEN
	w_mdi.ChangeMenu( m_pfe_train_app_setup )
	w_mdi.SetToolbar(3, False )
	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> UM-12
	//$<add> 01.13.2006 By: Rodger Wu
	//$<reason> The SetToolbarPos function is currently unsupported. 
	//$<modification> Replace the SetToolBarPos function with the Appeon defined function of_settoolbarpos to provide
	//$<modification> the same functionality.
	
	If appeongetclienttype() <> 'PB' Then
		long ll_handle1
		ll_handle1 = handle(w_mdi)
		gnv_appeondll.of_SetToolbar(ll_handle1 , 3 , false)
	End If
	//---------------------------- APPEON END ----------------------------
	w_mdi.of_menu_security( "m_pfe_train_app_setup" )
	
	IF tab_1.tabpage_select.tab_facility.SelectedTab = 2 THEN
		m_pfe_train_app_setup.m_tools.visible = True
		gnv_app.of_modify_menu_attr( m_pfe_train_app_setup.m_tools,'ToolBarItemVisible', True)
		m_pfe_train_app_setup.m_tools.m_testapplication.visible = True
		gnv_app.of_modify_menu_attr( m_pfe_train_app_setup.m_tools.m_testapplication,'ToolBarItemvisible', True)	
	ELSEIF newindex = 1 THEN
		m_pfe_train_app_setup.m_tools.visible = False
		gnv_app.of_modify_menu_attr( m_pfe_train_app_setup.m_tools,'ToolBarItemVisible', False)
		m_pfe_train_app_setup.m_tools.m_testapplication.visible = False
		gnv_app.of_modify_menu_attr( m_pfe_train_app_setup.m_tools.m_testapplication,'ToolBarItemvisible', False)	
	END IF	
ELSEIF newindex = 4 THEN
	st_page_num.Visible = False		
	//st_field_name.Visible = False	
END IF

w_mdi.SetToolbarPos ( 2, 1, 200, False)	
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> UM-13
//$<add> 01.13.2006 By: Rodger Wu
//$<reason> The SetToolbarPos function is currently unsupported. 
//$<modification> Replace the SetToolBarPos function with the Appeon defined function of_settoolbarpos to provide
//$<modification> the same functionality.
If appeongetclienttype() <> 'PB' Then
	long ll_handle
	ll_handle = handle(w_mdi)
	gnv_appeondll.of_settoolbarpos(ll_handle)
	gnv_appeondll.of_SetToolbar( ll_handle,3, False )
	gnv_appeondll.of_SetToolbar( ll_handle, 4, False)		
	gnv_appeondll.of_SetToolbar(  ll_handle,5, False)
End If
w_mdi.setredraw(true)
//of_field_name_visible( )
//---------------------------- APPEON END ----------------------------
end event

event selectionchanged;Long 		li_ans
String	ls_Rtn

IF newindex = 3 OR newindex = 4  THEN
	IF NOT FileExists( is_app_path + String( ii_app_id ) + ".tif" ) THEN
		//MessageBox("Invalid Selection", "You must first scan in an image." )
		tab_1.tabpage_design.ole_edit.Object.Image("") //trap added 090204 maha
		Return 0
	END IF
END IF

//st_field_name.Visible = False

IF oldindex = 3 THEN
	IF tab_1.tabpage_design.ole_edit.Object.ImageModified = True THEN
		//--------------------------- APPEON BEGIN ---------------------------
		//$< Add  > 2008-07-17 By: Scofield
		//$<Reason> Verify if the directory has write right for the current user.
		
		ls_Rtn = f_ExaWriteRight(tab_1.tabpage_design.ole_edit.Object.Image)
		if Len(ls_Rtn) > 0 then
			MessageBox(gnv_app.iapp_object.DisplayName,ls_Rtn,Exclamation!)
			Return 0
		end if
		//---------------------------- APPEON END ----------------------------
		//li_ans = MessageBox( "Save", "Save changes to application?", Question!, YesNo!, 1 )
		of_delete_annotations()
		tab_1.tabpage_design.ole_edit.Object.Save()		
		//IF li_ans = 1 THEN
			COMMIT USING tr_training_data;
		//ELSE
		//	ROLLBACK USING tr_training_data;
		//END IF
	END IF
END IF

IF of_save( "facility" ) = -1 THEN
	RETURN 1
END IF

IF newindex = 3 THEN

	//st_field_name.Visible = True

	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> PT-27
	//$<modify> 02.10.2006 By: owen chen
	//$<reason> Performance tuning
	//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.
 
	/*
	tab_1.tabpage_design.dw_fld_prop.SetTransObject( w_train_app.tr_training_data )
	tab_1.tabpage_design.dw_field.SetTransObject( w_train_app.tr_training_data )
	tab_1.tabpage_design.dw_field.Retrieve( 1 )	

	tab_1.tabpage_design.dw_screen.SetTransObject( w_train_app.tr_training_data )
	tab_1.tabpage_design.dw_screen.Retrieve( )
	tab_1.tabpage_design.dw_screen.SelectRow( 1, True )
	tab_1.tabpage_design.dw_screen.SetRow( 1 )
	*/
	tab_1.tabpage_design.dw_fld_prop.SetTransObject( w_train_app.tr_training_data )
	tab_1.tabpage_design.dw_field.SetTransObject( w_train_app.tr_training_data )
	tab_1.tabpage_design.dw_screen.SetTransObject( w_train_app.tr_training_data )
	
	gnv_appeondb.of_startqueue( )
	
	tab_1.tabpage_design.dw_field.Retrieve( 1 )	
	tab_1.tabpage_design.dw_screen.Retrieve( )

	gnv_appeondb.of_commitqueue( )
	
	tab_1.tabpage_design.dw_screen.SelectRow( 1, True )
	tab_1.tabpage_design.dw_screen.SetRow( 1 )
	
	//---------------------------- APPEON END ----------------------------




	IF tabpage_design.ole_edit.Object.Image = "" THEN  
		of_load_image()
	ELSE  
		//of_delete_annotations()		
		//tabpage_design.ole_edit.Object.Save()		
		//jadof_load_annotations()
	END IF
	
	//Open( w_select_fields, w_train_app )
	//w_select_fields.io_image_edit = tabpage_design.ole_edit
ELSE
	//IF IsValid( w_select_fields ) THEN
	//	Close( w_select_fields )
	//END IF
END IF

IF newindex = 4 THEN
	tab_1.tabpage_design.uo_preview.of_load_app()
END IF

IF newindex = 2 THEN
	IF FileExists( is_app_path + String( ii_app_id ) + ".tif" ) AND tab_1.tabpage_design.ole_edit.Object.Image <> "" THEN
		//--------------------------- APPEON BEGIN ---------------------------
		//$< Add  > 2008-07-17 By: Scofield
		//$<Reason> Verify if the directory has write right for the current user.
		
		ls_Rtn = f_ExaWriteRight(tab_1.tabpage_design.ole_edit.Object.Image)
		if Len(ls_Rtn) > 0 then
			MessageBox(gnv_app.iapp_object.DisplayName,ls_Rtn,Exclamation!)
			Return 0
		end if
		//---------------------------- APPEON END ----------------------------
		//of_delete_annotations() //maha removed 102600
		tab_1.tabpage_design.ole_edit.Object.Save()
		//tab_1.tabpage_scan.ole_scan_edit.Object.Image( is_app_path + String( ii_app_id ) + ".tif" )
		//tab_1.tabpage_scan.ole_scan_edit.Object.Page(1)
		//tab_1.tabpage_scan.ole_scan_edit.Object.FitTo(3)
		//tab_1.tabpage_scan.ole_scan_edit.Object.Display()
		//tab_1.tabpage_scan.ole_scan_edit.Object.Annotationtype(11)		
		//tab_1.tabpage_scan.cb_prior_scan.Enabled = True
		//tab_1.tabpage_scan.cb_next_scan.Enabled = True
		//tab_1.tabpage_scan.cb_page_prop.Enabled = True
		//tab_1.tabpage_scan.st_scan_page_num.Text = "Page 1 Of " + String( tab_1.tabpage_scan.ole_scan_edit.Object.PageCount() )		
	END IF
END IF

tabpage_design.ole_edit.SetFocus()
of_field_name_visible( )
end event

event key;w_train_app.TriggerEvent( Key!)
end event

type tabpage_select from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 3552
integer height = 1836
long backcolor = 80269524
string text = "Setup"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
string picturename = "Custom092!"
long picturemaskcolor = 553648127
tab_facility tab_facility
st_org_name st_org_name
cb_5 cb_5
end type

on tabpage_select.create
this.tab_facility=create tab_facility
this.st_org_name=create st_org_name
this.cb_5=create cb_5
this.Control[]={this.tab_facility,&
this.st_org_name,&
this.cb_5}
end on

on tabpage_select.destroy
destroy(this.tab_facility)
destroy(this.st_org_name)
destroy(this.cb_5)
end on

type tab_facility from tab within tabpage_select
event create ( )
event destroy ( )
integer x = 9
integer y = 16
integer width = 3506
integer height = 1736
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 79741120
boolean fixedwidth = true
boolean raggedright = true
alignment alignment = center!
integer selectedtab = 1
tabpage_facility tabpage_facility
tabpage_apps tabpage_apps
tabpage_images tabpage_images
end type

on tab_facility.create
this.tabpage_facility=create tabpage_facility
this.tabpage_apps=create tabpage_apps
this.tabpage_images=create tabpage_images
this.Control[]={this.tabpage_facility,&
this.tabpage_apps,&
this.tabpage_images}
end on

on tab_facility.destroy
destroy(this.tabpage_facility)
destroy(this.tabpage_apps)
destroy(this.tabpage_images)
end on

event selectionchanging;//IF oldindex = 1 THEN
//	IF of_save( "facility" ) = -1 THEN
//		Return 1
//	END IF
//ELSE
//	IF of_save( "apps" ) = -1 THEN
//		Return 1
//	END IF	
//END IF

//$<add> 07.10.2008 by Andy
Integer li

IF oldindex = 3 THEN
	if tabpage_images.dw_image_list.Modifiedcount( ) > 0 then
		li = messagebox(gnv_app.iapp_object.DisplayName,'Do you want to save changes?',question!,yesnocancel!)
		IF li = 1 THEN
			IF of_save( 'images' ) < 0 THEN
				return 1
			END IF
		ELSEIF li = 3 THEN
			return 1
		END IF
	end if
END IF
//end add

end event

event selectionchanged;IF newindex = 2 THEN
	//$<modify> 07.11.2008 by Andy add:if statement
	if oldindex = 1 then
		tabpage_apps.dw_app_detail.Reset()
		tabpage_apps.dw_app_browse.Reset()
		tabpage_apps.dw_app_browse.SetTransObject( tr_training_data )
		tabpage_apps.dw_app_browse.Retrieve( ii_facility_id )
	end if
	
	IF IsValid(	m_pfe_train_app_setup ) THEN
		m_pfe_train_app_setup.m_tools.visible = True
		gnv_app.of_modify_menu_attr( m_pfe_train_app_setup.m_tools,'ToolBarItemVisible', True)
		m_pfe_train_app_setup.m_tools.m_testapplication.visible = True
		gnv_app.of_modify_menu_attr( m_pfe_train_app_setup.m_tools.m_testapplication,'ToolBarItemvisible', True)

		m_pfe_train_app_setup.m_file.m_copyapplication.visible = True		
		gnv_app.of_modify_menu_attr( m_pfe_train_app_setup.m_file.m_copyapplication,'ToolBarItemVisible', True)
		
		m_pfe_train_app_setup.m_tools.m_highlighter.visible = False
		gnv_app.of_modify_menu_attr( m_pfe_train_app_setup.m_tools.m_highlighter,'ToolBarItemvisible', False)			
				
		m_pfe_train_app_setup.m_tools.m_specialfields.visible = False
		gnv_app.of_modify_menu_attr( m_pfe_train_app_setup.m_tools.m_specialfields,'ToolBarItemvisible', False)			
		
		m_pfe_train_app_setup.m_tools.m_connect.visible = False
		gnv_app.of_modify_menu_attr( m_pfe_train_app_setup.m_tools.m_connect,'ToolBarItemvisible', False)			

		m_pfe_train_app_setup.m_tools.m_connectfields.visible = False
		gnv_app.of_modify_menu_attr( m_pfe_train_app_setup.m_tools.m_connectfields,'ToolBarItemvisible', False)			

		m_pfe_train_app_setup.m_tools.m_deleteannotationfiles.visible = False
		gnv_app.of_modify_menu_attr( m_pfe_train_app_setup.m_tools.m_deleteannotationfiles,'ToolBarItemvisible', False)					
	END IF
	
//ELSEIF newindex = 1 THEN
ELSEIF newindex = 1 or newindex = 3 THEN
	
	IF IsValid(	m_pfe_train_app_setup ) THEN	
		m_pfe_train_app_setup.m_file.m_copyapplication.visible = False
		gnv_app.of_modify_menu_attr( m_pfe_train_app_setup.m_file.m_copyapplication,'ToolBarItemVisible', False)
		m_pfe_train_app_setup.m_tools.visible = False
		gnv_app.of_modify_menu_attr( m_pfe_train_app_setup.m_tools,'ToolBarItemVisible', False)
		m_pfe_train_app_setup.m_tools.m_testapplication.visible = False
		gnv_app.of_modify_menu_attr( m_pfe_train_app_setup.m_tools.m_testapplication,'ToolBarItemvisible', False)	

		m_pfe_train_app_setup.m_tools.m_highlighter.visible = False
		gnv_app.of_modify_menu_attr( m_pfe_train_app_setup.m_tools.m_highlighter,'ToolBarItemvisible', False)			
		m_pfe_train_app_setup.m_tools.m_specialfields.visible = False
		gnv_app.of_modify_menu_attr( m_pfe_train_app_setup.m_tools.m_specialfields,'ToolBarItemvisible', False)			
		
		m_pfe_train_app_setup.m_tools.m_connect.visible = False
		gnv_app.of_modify_menu_attr( m_pfe_train_app_setup.m_tools.m_connect,'ToolBarItemvisible', False)			

		m_pfe_train_app_setup.m_tools.m_connectfields.visible = False
		gnv_app.of_modify_menu_attr( m_pfe_train_app_setup.m_tools.m_connectfields,'ToolBarItemvisible', False)			

		m_pfe_train_app_setup.m_tools.m_deleteannotationfiles.visible = False
		gnv_app.of_modify_menu_attr( m_pfe_train_app_setup.m_tools.m_deleteannotationfiles,'ToolBarItemvisible', False)							
	END IF
	
END IF

//$<add> 07.10.2008 by Andy
IF newindex = 3 THEN
	IF IsValid(	m_pfe_train_app_setup ) THEN	
		m_pfe_train_app_setup.m_edit.m_insert.visible = False
		gnv_app.of_modify_menu_attr( m_pfe_train_app_setup.m_edit.m_insert,'ToolBarItemVisible', False)
		m_pfe_train_app_setup.m_edit.m_delete1.visible = False
		gnv_app.of_modify_menu_attr( m_pfe_train_app_setup.m_edit.m_delete1,'ToolBarItemVisible', False)
	END IF
	
	Long   ll_app_id[],ll_Row
	Long   ll_Cnt,ll_Cnt2
	Long   ll_Find,ll_image_type
	
	ll_Row    = tab_facility.tabpage_apps.dw_app_browse.GetRow( )
	if ll_Row > 0 then
		ll_app_id[1] = tab_facility.tabpage_apps.dw_app_browse.GetItemNumber(ll_Row,"app_id")
	else
		ll_app_id[1] = 0
	end if
	
	tab_facility.tabpage_images.dw_image_defaults.Reset()
	tab_facility.tabpage_images.dw_image_list.Reset()
	
	gnv_appeondb.of_startqueue( )
	tab_facility.tabpage_images.dw_image_list.Retrieve()
	tab_facility.tabpage_images.dw_image_defaults.Retrieve(ll_app_id)
	gnv_appeondb.of_commitqueue( )
	
	ll_Cnt = tab_facility.tabpage_images.dw_image_defaults.RowCount()
	ll_Cnt2= tab_facility.tabpage_images.dw_image_list.RowCount()
	For ll_Row = 1 to ll_Cnt
		ll_image_type = tab_facility.tabpage_images.dw_image_defaults.GetItemNumber(ll_Row,"image_type")
		ll_Find = tab_facility.tabpage_images.dw_image_list.Find("image_type_id=" + String(ll_image_type),1,ll_Cnt2)
		if ll_Find > 0 then 
			tab_facility.tabpage_images.dw_image_list.SetItem(ll_Find,"selected",1)
		end if
	Next
	if ll_Cnt > 0 then tab_facility.tabpage_images.dw_image_list.ResetUpdate( )
ELSE
	IF IsValid(	m_pfe_train_app_setup ) THEN	
		m_pfe_train_app_setup.m_edit.m_insert.visible = true
		gnv_app.of_modify_menu_attr( m_pfe_train_app_setup.m_edit.m_insert,'ToolBarItemVisible', true)
		m_pfe_train_app_setup.m_edit.m_delete1.visible = true
		gnv_app.of_modify_menu_attr( m_pfe_train_app_setup.m_edit.m_delete1,'ToolBarItemVisible', true)
	END IF	
END IF
//end add 07.10.2008

end event

type tabpage_facility from userobject within tab_facility
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 3470
integer height = 1608
long backcolor = 79741120
string text = "  Organization  "
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "Library5!"
long picturemaskcolor = 553648127
dw_facility_detail dw_facility_detail
dw_facility_browse dw_facility_browse
end type

on tabpage_facility.create
this.dw_facility_detail=create dw_facility_detail
this.dw_facility_browse=create dw_facility_browse
this.Control[]={this.dw_facility_detail,&
this.dw_facility_browse}
end on

on tabpage_facility.destroy
destroy(this.dw_facility_detail)
destroy(this.dw_facility_browse)
end on

type dw_facility_detail from datawindow within tabpage_facility
integer x = 1257
integer y = 12
integer width = 2135
integer height = 1584
integer taborder = 30
string dataobject = "d_facility_detail_bak"
boolean livescroll = true
end type

event buttonclicked;//--------------------------- APPEON BEGIN ---------------------------
//$<  Add > 2008-07-31 By: Scofield
//$<Reason> Popup a dialog to input the phone

String	ls_Phone,ls_fax,ls_RetParm

This.AcceptText()
if row > 0 and row <= This.RowCount() then
	if dwo.name = 'b_phone' then
		ls_Phone = This.GetItemString(row,'phone')
		OpenWithParm(w_phonedetail,ls_Phone)
		
		ls_RetParm = Message.StringParm
		
		if ls_RetParm <> 'Cancel' then
			This.SetItem(row,'phone',ls_RetParm)
		end if
		This.SetColumn('phone')
	elseif dwo.name = 'b_fax' then
		ls_fax = This.GetItemString(row,'fax')
		if IsNull(ls_fax) then ls_fax = ""
		OpenWithParm(w_phonedetail,"Fax:" + ls_fax)
		
		ls_RetParm = Message.StringParm
		
		if ls_RetParm <> 'Cancel' then
			This.SetItem(row,'fax',ls_RetParm)
		end if
		This.SetColumn('fax')
	end if
end if
//---------------------------- APPEON END ----------------------------

end event

type dw_facility_browse from datawindow within tabpage_facility
integer x = 23
integer y = 12
integer width = 1202
integer height = 1584
integer taborder = 30
string dataobject = "d_facility_browse"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event clicked;Long li_row


li_row = GetClickedRow()

IF li_row > 0 THEN
	This.SetRow( li_row )
	This.SelectRow( 0 , False )
	This.SelectRow( li_row, True )
END IF
end event

event doubleclicked; tab_1.tabpage_select.tab_facility.SelectTab( 2 )
 ib_deleted_app = False
end event

event retrieveend;//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-28
//$<comment> 04.03.2006 By: Rodger Wu
//$<reason> Performance Tuning
//$<reason> Comment out redundant script lines.
/*
IF rowcount > 0 THEN
	This.SelectRow( 1, True )
	dw_facility_detail.Retrieve( This.GetItemNumber( 1,"facility_id" ) )
END IF
*/
//---------------------------- APPEON END ----------------------------

end event

event rowfocuschanged;
IF currentrow >0 THEN
	tab_1.tabpage_select.st_org_name.Text = This.GetItemString( currentrow, "facility_name" )
	This.SetRow( currentrow )
	This.SelectRow( 0 , False )
	This.SelectRow( currentrow, True )
	ii_facility_id = This.GetItemNumber( currentrow ,"facility_id" )
	dw_facility_detail.Retrieve( ii_facility_id )
END IF
end event

event rowfocuschanging;Long li_ans

dw_facility_detail.AcceptText( )
IF dw_facility_detail.GetItemStatus( currentrow, 0, Primary! ) = NewModified! OR dw_facility_detail.GetItemStatus( currentrow, 0, Primary! ) = DataModified! THEN
	li_ans = MessageBox( "Modifed Facility Data",  "Save changes made to facility detail data?", Question!, YesNo! )
	IF li_ans = 1 THEN
		of_save( "facility" )
	END IF
END IF
end event

type tabpage_apps from userobject within tab_facility
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 3470
integer height = 1608
long backcolor = 79741120
string text = "  Applications"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "Custom004!"
long picturemaskcolor = 553648127
cb_1 cb_1
dw_app_browse dw_app_browse
dw_app_detail_org dw_app_detail_org
dw_app_detail dw_app_detail
end type

on tabpage_apps.create
this.cb_1=create cb_1
this.dw_app_browse=create dw_app_browse
this.dw_app_detail_org=create dw_app_detail_org
this.dw_app_detail=create dw_app_detail
this.Control[]={this.cb_1,&
this.dw_app_browse,&
this.dw_app_detail_org,&
this.dw_app_detail}
end on

on tabpage_apps.destroy
destroy(this.cb_1)
destroy(this.dw_app_browse)
destroy(this.dw_app_detail_org)
destroy(this.dw_app_detail)
end on

type cb_1 from commandbutton within tabpage_apps
integer x = 1303
integer y = 1304
integer width = 480
integer height = 92
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Upload Image..."
end type

event constructor;//////////////////////////////////////////////////////////////////////
// $<event>cb_1constructor()
// $<arguments>(None)
// $<returns> long
// $<description> The Upload Image button is enabled only when Store to DB is selected.
// $<description> 
//////////////////////////////////////////////////////////////////////
// $<add> 06.08.2006 by LeiWei
//////////////////////////////////////////////////////////////////////

Integer li_image_storage_type
li_image_storage_type = Integer(gnv_data.of_getitem( "icred_settings", "image_storage_type", FALSE))
IF Isnull(li_image_storage_type) THEN li_image_storage_type = 0
IF Upper( AppeonGetClientType() ) = "PB" AND li_image_storage_type = 0 THEN
	THIS.visible = FALSE
ELSE
	THIS.BringToTop = TRUE	
END IF


end event

event clicked;//////////////////////////////////////////////////////////////////////
// $<event>cb_1clicked()
// $<arguments>(None)
// $<returns> long
// $<description> Add a button to upload an image file to database
// $<description> 
//////////////////////////////////////////////////////////////////////
// $<add> 06.08.2006 by LeiWei
//////////////////////////////////////////////////////////////////////

string docpath, docname
integer li_rtn
Long ll_row
Long ll_app_id
n_getfilename ln_getfilename //Added By Jay Chen 08-15-2014

ll_row = dw_app_detail.GetRow( )
IF ll_row = 0 THEN RETURN

ll_app_id = dw_app_detail.GetItemNumber(ll_row, "app_id")

gf_load_dir_path() //Added by Ken.Guo on 2009-03-10
//li_rtn = GetFileOpenName("Select File", &
//    docpath, docname, "TIF", &
//    "Image Files (*.TIF),*.TIF" )
li_rtn = ln_getfilename.of_getopenfilename("Select File", &
    docpath, docname, "TIF", &
    "Image Files (*.TIF),*.TIF" )
gf_save_dir_path(docpath) //Added by Ken.Guo on 2009-03-10
//ChangeDirectory(gs_current_path) //Add by Evan 12/11/2008

IF li_rtn < 1 THEN RETURN

// Upload Image file
n_appeon_storage_area lnv_storage_area

li_rtn = lnv_storage_area.of_upload_app_image( ll_app_id, docpath)

IF li_rtn > 0 THEN
	Messagebox("Upload Image","Complete!")
	dw_app_detail.setitem(ll_row,'datalen',1) //Start Code Change ----04.10.2008 #V8 maha
END IF
end event

type dw_app_browse from datawindow within tabpage_apps
integer x = 23
integer y = 56
integer width = 1202
integer height = 1520
integer taborder = 30
string dataobject = "d_app_browse"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event clicked;
//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 2006-09-27 By: Rodger Wu
//$<reason> Fix a defect.

/*
Long li_row

li_row = GetClickedRow()

IF li_row > 0 THEN
	This.SetRow( li_row )
	This.SelectRow( 0 , False )
	This.SelectRow( li_row, True )
	//\/maha moved from doubleclicked event 091300
	ii_app_id = This.GetItemNumber( row, "app_id" )
	//Start Code Change ---- 02.22.2006 #281 maha
	if il_app_id_audit > 0 then //creates audit record for previously selected app
		ib_audit = true
		of_app_audit_track(il_app_id_audit)
		il_app_id_audit = 0
	end if
	//End Code Change---02.22.2006
	ii_facility_id = This.GetItemNumber( row, "facility_id" )
//\maha
	
END IF
*/

IF row > 0 THEN
	This.SetRow( row )
	This.SelectRow( 0 , False )
	This.SelectRow( row, True )

	ii_app_id = This.GetItemNumber( row, "app_id" )

	if il_app_id_audit > 0 then
		ib_audit = true
		of_app_audit_track(il_app_id_audit)
		il_app_id_audit = 0
	end if

	ii_facility_id = This.GetItemNumber( row, "facility_id" )
END IF

//---------------------------- APPEON END ----------------------------




end event

event doubleclicked;of_set_preview_mode( "Train") //Start Code Change ----12.03.2008 #V85 maha - added to reset to train mode when new app selected
of_select_app( )

end event

event retrieveend;IF rowcount > 0 THEN
	This.SelectRow( 1, True )
	dw_app_detail.Retrieve( This.GetItemNumber( 1,"app_id" ) )
END IF
end event

event rowfocuschanged;
IF currentrow >0 THEN
	This.SetRow( currentrow )
	This.SelectRow( 0 , False )
	This.SelectRow( currentrow, True )
	dw_app_detail.Retrieve( This.GetItemNumber( currentrow ,"app_id" ) )
END IF
end event

event rowfocuschanging;Long li_ans
dw_app_detail.AcceptText( )
IF dw_app_detail.GetItemStatus( currentrow, 0, Primary! ) = NewModified! OR dw_app_detail.GetItemStatus( currentrow, 0, Primary! ) = DataModified! THEN
	li_ans = MessageBox( "Modifed Application Data",  "Save changes made to application detail data?", Question!, YesNo! )
	IF li_ans = 1 THEN
		of_save( "apps" )
	END IF
END IF
end event

type dw_app_detail_org from datawindow within tabpage_apps
boolean visible = false
integer x = 1157
integer y = 16
integer width = 270
integer height = 224
integer taborder = 40
string dataobject = "d_app_detail"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event buttonclicked;Long li_facil

openwithparm( w_app_new_org,ii_facility_id )

li_facil = message.doubleparm

if li_facil < 1 then 
	return
else
	ii_facility_id = li_facil
	
end if
	
this.setitem(row,"facility_id",li_facil)

this.update()
commit using tr_training_data;

dw_app_browse.retrieve(li_facil)
dw_app_browse.setfocus()
end event

type dw_app_detail from u_dw within tabpage_apps
integer x = 1243
integer y = 56
integer width = 2203
integer height = 1524
integer taborder = 11
string dataobject = "d_app_detail"
boolean vscrollbar = false
end type

event buttonclicked;call super::buttonclicked;//--------------------------- APPEON BEGIN ---------------------------
//$<Modify> 2008-08-11 By: Scofield
//$<Reason> Popup a dialog to input the phone

String	ls_Phone,ls_fax,ls_RetParm
Long 		ll_facil

This.AcceptText()
if row > 0 and row <= This.RowCount() then
	if dwo.name = 'b_phone' then
		ls_Phone = This.GetItemString(row,'contact_phone')
		OpenWithParm(w_phonedetail,ls_Phone)
		
		ls_RetParm = Message.StringParm
		
		if ls_RetParm <> 'Cancel' then
			This.SetItem(row,'contact_phone',ls_RetParm)
		end if
		This.SetColumn('contact_phone')
	else
		OpenWithParm(w_app_new_org,ii_facility_id)
		ll_facil = Message.DoubleParm
		if ll_facil < 1 then Return
		
		ii_facility_id = ll_facil
		this.SetItem(Row,"facility_id",ll_facil)
		
		this.Update()
		COMMIT USING tr_training_data;
		
		dw_app_browse.retrieve(ll_facil)
		dw_app_browse.setfocus()
	end if
end if
//---------------------------- APPEON END ----------------------------

end event

event constructor;call super::constructor;this.of_SetDropDownCalendar( TRUE )
this.iuo_calendar.of_Register(this.iuo_calendar.DDLB)
end event

type tabpage_images from userobject within tab_facility
integer x = 18
integer y = 112
integer width = 3470
integer height = 1608
long backcolor = 79741120
string text = "Default Image Types"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
dw_image_defaults dw_image_defaults
cb_2 cb_2
dw_image_list dw_image_list
end type

on tabpage_images.create
this.dw_image_defaults=create dw_image_defaults
this.cb_2=create cb_2
this.dw_image_list=create dw_image_list
this.Control[]={this.dw_image_defaults,&
this.cb_2,&
this.dw_image_list}
end on

on tabpage_images.destroy
destroy(this.dw_image_defaults)
destroy(this.cb_2)
destroy(this.dw_image_list)
end on

type dw_image_defaults from u_dw within tabpage_images
boolean visible = false
integer x = 1307
integer y = 140
integer width = 1298
integer height = 420
integer taborder = 11
string dataobject = "d_app_image_defaults"
boolean livescroll = false
end type

type cb_2 from commandbutton within tabpage_images
integer x = 18
integer y = 1512
integer width = 389
integer height = 84
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Select &All"
end type

event clicked;Long 	ll_rc
Long 	i
Long	ll_Value

if This.Text = "Select &All" then
	ll_Value = 1
	This.Text = "Deselect &All"
else
	ll_Value = 0
	This.Text = "Select &All"
end if

ll_rc = dw_image_list.RowCount( )
for I = 1 to ll_rc
	dw_image_list.SetItem( i, "selected", ll_Value )
next


end event

type dw_image_list from u_dw within tabpage_images
integer x = 18
integer y = 20
integer width = 1161
integer height = 1476
integer taborder = 11
boolean titlebar = true
string title = "Select Image Type"
string dataobject = "d_image_image_type_list_select"
boolean livescroll = false
end type

event constructor;call super::constructor;//$<add> 07.10.2008 by Andy
this.of_setupdateable( false )
end event

event other;call super::other;if Message.WordParm = 61458 then 
	Message.Processed = true
	Message.ReturnValue = 0 
end if
end event

type st_org_name from statictext within tabpage_select
integer x = 1911
integer y = 36
integer width = 1595
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 128
long backcolor = 67108864
boolean enabled = false
boolean focusrectangle = false
end type

type cb_5 from commandbutton within tabpage_select
integer x = 2729
integer y = 1304
integer width = 480
integer height = 84
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Test All Applications"
end type

type tabpage_scan from userobject within tab_1
event create ( )
event destroy ( )
boolean visible = false
integer x = 18
integer y = 112
integer width = 3552
integer height = 1836
boolean enabled = false
long backcolor = 80269524
string text = "Scan"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
string picturename = "Custom087!"
long picturemaskcolor = 553648127
end type

type tabpage_design from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 3552
integer height = 1836
long backcolor = 80269524
string text = "Train"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
string picturename = "Custom041!"
long picturemaskcolor = 553648127
cb_goto_page cb_goto_page
sle_goto_page sle_goto_page
ole_img_admin ole_img_admin
gb_3 gb_3
st_field st_field
dw_screen dw_screen
dw_field dw_field
uo_bar uo_bar
uo_preview uo_preview
ole_scan ole_scan
dw_2 dw_2
dw_1 dw_1
ole_edit ole_edit
tab_fld_prop tab_fld_prop
dw_fld_prop dw_fld_prop
cb_apply cb_apply
end type

on tabpage_design.create
this.cb_goto_page=create cb_goto_page
this.sle_goto_page=create sle_goto_page
this.ole_img_admin=create ole_img_admin
this.gb_3=create gb_3
this.st_field=create st_field
this.dw_screen=create dw_screen
this.dw_field=create dw_field
this.uo_bar=create uo_bar
this.uo_preview=create uo_preview
this.ole_scan=create ole_scan
this.dw_2=create dw_2
this.dw_1=create dw_1
this.ole_edit=create ole_edit
this.tab_fld_prop=create tab_fld_prop
this.dw_fld_prop=create dw_fld_prop
this.cb_apply=create cb_apply
this.Control[]={this.cb_goto_page,&
this.sle_goto_page,&
this.ole_img_admin,&
this.gb_3,&
this.st_field,&
this.dw_screen,&
this.dw_field,&
this.uo_bar,&
this.uo_preview,&
this.ole_scan,&
this.dw_2,&
this.dw_1,&
this.ole_edit,&
this.tab_fld_prop,&
this.dw_fld_prop,&
this.cb_apply}
end on

on tabpage_design.destroy
destroy(this.cb_goto_page)
destroy(this.sle_goto_page)
destroy(this.ole_img_admin)
destroy(this.gb_3)
destroy(this.st_field)
destroy(this.dw_screen)
destroy(this.dw_field)
destroy(this.uo_bar)
destroy(this.uo_preview)
destroy(this.ole_scan)
destroy(this.dw_2)
destroy(this.dw_1)
destroy(this.ole_edit)
destroy(this.tab_fld_prop)
destroy(this.dw_fld_prop)
destroy(this.cb_apply)
end on

type cb_goto_page from commandbutton within tabpage_design
boolean visible = false
integer x = 3218
integer y = 1952
integer width = 146
integer height = 84
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Goto "
boolean default = true
end type

event clicked;////Parent.SetRedraw( False )
//
//ole_edit.Object.SelectAnnotationGroup( "" )
//IF ole_edit.Object.PageCount() >= Long (sle_goto_page.Text) AND +&
//	Long(sle_goto_page.Text) > 0 THEN
//--------------------------- APPEON BEGIN ---------------------------
//$<add> 08.15.2006 By: LeiWei
//$<reason> Fix a defect.
Long 		li_goto_page
String	ls_Rtn

li_goto_page = Long (sle_goto_page.Text)

if li_goto_page < 1 then
	sle_goto_page.Text = ""
	return 
end if

tab_1.tabpage_design.ole_edit.Object.SelectAnnotationGroup( "" )
IF tab_1.tabpage_design.ole_edit.Object.PageCount() >= li_goto_page THEN
	ii_current_page = li_goto_page
	
	//--------------------------- APPEON BEGIN ---------------------------
	//$< Add  > 2008-07-17 By: Scofield
	//$<Reason> Verify if the directory has write right for the current user.
	
	ls_Rtn = f_ExaWriteRight(tab_1.tabpage_design.ole_edit.Object.Image)
	if Len(ls_Rtn) > 0 then
		MessageBox(gnv_app.iapp_object.DisplayName,ls_Rtn,Exclamation!)
		Return
	end if
	//---------------------------- APPEON END ----------------------------
	
	tab_1.tabpage_design.ole_edit.Object.Save()
	COMMIT USING tr_training_data;
	tab_1.tabpage_design.ole_edit.object.Page( ii_current_page  )
	tab_1.tabpage_design.ole_edit.object.Display()
	of_load_annotations()	
	IF ii_current_page > 1 THEN
		gnv_app.of_modify_menu_attr( m_pfe_train_app.m_view.m_priorpage,'enabled', True)
	END IF
	IF ii_current_page = 1 THEN
		gnv_app.of_modify_menu_attr( m_pfe_train_app.m_view.m_priorpage,'enabled', False)
	END IF
	IF ii_current_page = tab_1.tabpage_design.ole_edit.Object.PageCount() THEN
		gnv_app.of_modify_menu_attr( m_pfe_train_app.m_view.m_nextpage,'enabled', False)
	ELSE
		gnv_app.of_modify_menu_attr( m_pfe_train_app.m_view.m_nextpage,'enabled', True)		
	END IF
	st_page_num.Text = "Page " + String( ii_current_page ) + " Of " + String( tab_1.tabpage_design.ole_edit.Object.PageCount() )	
END IF

sle_goto_page.Text = ""

Return 0
//---------------------------- APPEON END ----------------------------

//	of_delete_annotations( )	
//	ii_current_page = Long( sle_goto_page.Text )
//	//IF ole_edit.Object.ImageModified = True THEN
//	//	Long li_ans
//	//	li_ans = MessageBox( "Save", "Save changes to application?", Question!, YesNo!, 1 )
//	//	IF li_ans = 1 THEN
//			ole_edit.Object.Save()
//			COMMIT USING tr_training_data;
//	//	END IF
//	//END IF
//	ole_edit.object.Page( ii_current_page  )
//	ole_edit.object.Display()
//	of_load_annotations()
//	cb_previous.Enabled = True
//	st_page_num.Text = "Page " + String( ii_current_page ) + " Of " + String( ole_edit.Object.PageCount() )
//	sle_goto_page.Text = ""
//s.tab_1.SelectTab( 1 )	
//	IF ii_current_page = ole_edit.Object.PageCount() THEN
//		cb_next.Enabled = False
//	END IF	
//	IF ii_current_page = 1 THEN
//		cb_next.Enabled = True
//		cb_previous.Enabled = False
//	END IF		
//ELSE
//	sle_goto_page.Text = ""
//END IF
//
////Parent.SetRedraw( True )
end event

type sle_goto_page from singlelineedit within tabpage_design
boolean visible = false
integer x = 3369
integer y = 1952
integer width = 96
integer height = 88
integer taborder = 70
boolean bringtotop = true
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

type ole_img_admin from olecustomcontrol within tabpage_design
event filepropertiesclose ( )
boolean visible = false
integer x = 2569
integer y = 1924
integer width = 155
integer height = 136
integer taborder = 60
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
string binarykey = "w_train_app.win"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
end type

type gb_3 from groupbox within tabpage_design
boolean visible = false
integer x = 2939
integer y = 1896
integer width = 549
integer height = 160
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Select Page"
end type

type st_field from statictext within tabpage_design
integer x = 3451
integer y = 2924
integer width = 137
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 255
long backcolor = 67108864
boolean enabled = false
string text = "N"
boolean focusrectangle = false
end type

type dw_screen from datawindow within tabpage_design
event ue_key pbm_dwnkey
event ue_after_open ( )
integer x = 14
integer y = 1248
integer width = 709
integer height = 580
integer taborder = 40
string dataobject = "d_app_select_tables"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event ue_key;String ls_ltr
Long li_found
Long li_start_row

IF KeyDown( KeyA! )  THEN
	ls_ltr = "A"
ELSEIF KeyDown( KeyB! )  THEN
	ls_ltr = "B"
ELSEIF KeyDown( KeyC! )  THEN
	ls_ltr = "C"
ELSEIF KeyDown( KeyD! )  THEN
	ls_ltr = "D"	
ELSEIF KeyDown( KeyE! )  THEN
	ls_ltr = "E"	
ELSEIF KeyDown( KeyF! )  THEN
	ls_ltr = "F"	
ELSEIF KeyDown( KeyG! )  THEN
	ls_ltr = "G"	
ELSEIF KeyDown( KeyH! )  THEN
	ls_ltr = "H"	
ELSEIF KeyDown( KeyI! )  THEN
	ls_ltr = "I"	
ELSEIF KeyDown( KeyJ! )  THEN
	ls_ltr = "J"		
ELSEIF KeyDown( KeyK! )  THEN
	ls_ltr = "K"	
ELSEIF KeyDown( KeyL! )  THEN
	ls_ltr = "L"		
ELSEIF KeyDown( KeyM! )  THEN
	ls_ltr = "M"	
ELSEIF KeyDown( KeyN! )  THEN
	ls_ltr = "N"	
ELSEIF KeyDown( KeyO! )  THEN
	ls_ltr = "O"	
ELSEIF KeyDown( KeyP! )  THEN
	ls_ltr = "P"	
ELSEIF KeyDown( KeyQ! )  THEN
	ls_ltr = "Q"	
ELSEIF KeyDown( KeyR! )  THEN
	ls_ltr = "R"		
ELSEIF KeyDown( KeyS! )  THEN
	ls_ltr = "S"	
ELSEIF KeyDown( KeyT! )  THEN
	ls_ltr = "T"	
ELSEIF KeyDown( KeyU! )  THEN
	ls_ltr = "U"	
ELSEIF KeyDown( KeyV! )  THEN
	ls_ltr = "V"	
ELSEIF KeyDown( KeyW! )  THEN
	ls_ltr = "W"	
ELSEIF KeyDown( KeyX! )  THEN
	ls_ltr = "X"	
ELSEIF KeyDown( KeyY! )  THEN
	ls_ltr = "Y"	
ELSEIF KeyDown( KeyZ! )  THEN
	ls_ltr = "Z"		
END IF

IF ls_ltr = is_last_key THEN
	li_start_row = This.GetRow()
ELSE
	li_start_row = 0
END IF

li_found = This.Find( "Mid(data_view_screen_screen_name,1,1 ) = '" + ls_ltr + "'", li_start_row +1, 10000)

IF li_found <=0 THEN
	is_last_key = ""
	Return
END IF

This.ScrollToRow( li_found )
This.SetRow( li_found )
This.SelectRow( 0, False )
This.SelectRow( li_found, True )

is_last_key = ls_ltr
end event

event ue_after_open;//This.SetTransObject( w_train_app.tr_training_data )
//This.Retrieve( )
//This.SelectRow( 1, True )
//This.SetRow( 1 )
//
end event

event clicked;Long li_row

li_row = GetClickedRow()

IF li_row > 0 THEN
	This.SetRow( li_row )
	This.SelectRow( 0 , False )
	This.SelectRow( li_row, True )
END IF
end event

event constructor;//PostEvent("ue_after_open")
//This.SetFocus()
end event

event getfocus;idw = This
This.BorderStyle = StyleLowered!
dw_field.BorderStyle = StyleBox!
end event

event retrieveend;//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-29
//$<comment> 04.04.2006 By: Rodger Wu
//$<reason> Performance Tuning
//$<reason> Comment out redundant script lines.
/*
IF rowcount > 0 THEN
	dw_field.Retrieve( This.GetItemNumber( 1, "table_id" ) )
	dw_field.SelectRow( 1 , True)
	dw_field.SetRow( 1 )
END IF
*/
//---------------------------- APPEON END ----------------------------
end event

event rowfocuschanged;Integer li_Rc
Integer i

ib_personal_data = False
IF currentrow > 0 THEN
	Long li_table_id 
	li_table_id = This.GetItemNumber( currentrow, "table_id" )
	IF This.GetItemString( currentrow, "data_view_screen_screen_alias" ) = "Personal Data"  THEN
		ib_personal_data = True
		li_table_id = 25
	END IF
	
	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> PT-30
	//$<modify> 04.04.2006 By: Rodger Wu
	//$<reason> Performance Tuning
	//$<modification> Define the datastore for caching data.
	//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

	/*
	dw_field.Retrieve(  li_table_id )
	dw_field.SelectRow( 1 , True)
	dw_field.SetRow( 1 )
	*/
	If Not isvalid( ids_queryfield ) Then
		ids_queryfield = CREATE datastore
		ids_queryfield.DataObject = "d_dddw_system_fields"
		ids_queryfield.SetTransObject( tr_training_data )
	End If
	gnv_appeondb.of_StartQueue()
	ids_queryfield.Retrieve( li_table_id )
	dw_field.Retrieve(  li_table_id )
	gnv_appeondb.of_CommitQueue()
	
	dw_field.SelectRow( 1 , True)
	dw_field.SetRow( 1 )
	//---------------------------- APPEON END ----------------------------
END IF

is_query_field = ""
is_query_operator = ""
is_query_value = ""
end event

type dw_field from datawindow within tabpage_design
event ue_key pbm_dwnkey
event ue_after_open ( )
integer x = 750
integer y = 1248
integer width = 709
integer height = 584
integer taborder = 50
string dragicon = "AppRectangle!"
string dataobject = "d_app_select_field"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event ue_key;String ls_ltr
Long li_found
Long li_start_row

IF KeyDown( KeyA! )  THEN
	ls_ltr = "A"
ELSEIF KeyDown( KeyB! )  THEN
	ls_ltr = "B"
ELSEIF KeyDown( KeyC! )  THEN
	ls_ltr = "C"
ELSEIF KeyDown( KeyD! )  THEN
	ls_ltr = "D"	
ELSEIF KeyDown( KeyE! )  THEN
	ls_ltr = "E"	
ELSEIF KeyDown( KeyF! )  THEN
	ls_ltr = "F"	
ELSEIF KeyDown( KeyG! )  THEN
	ls_ltr = "G"	
ELSEIF KeyDown( KeyH! )  THEN
	ls_ltr = "H"	
ELSEIF KeyDown( KeyI! )  THEN
	ls_ltr = "I"	
ELSEIF KeyDown( KeyJ! )  THEN
	ls_ltr = "J"		
ELSEIF KeyDown( KeyK! )  THEN
	ls_ltr = "K"	
ELSEIF KeyDown( KeyL! )  THEN
	ls_ltr = "L"		
ELSEIF KeyDown( KeyM! )  THEN
	ls_ltr = "M"	
ELSEIF KeyDown( KeyN! )  THEN
	ls_ltr = "N"	
ELSEIF KeyDown( KeyO! )  THEN
	ls_ltr = "O"	
ELSEIF KeyDown( KeyP! )  THEN
	ls_ltr = "P"	
ELSEIF KeyDown( KeyQ! )  THEN
	ls_ltr = "Q"	
ELSEIF KeyDown( KeyR! )  THEN
	ls_ltr = "R"		
ELSEIF KeyDown( KeyS! )  THEN
	ls_ltr = "S"	
ELSEIF KeyDown( KeyT! )  THEN
	ls_ltr = "T"	
ELSEIF KeyDown( KeyU! )  THEN
	ls_ltr = "U"	
ELSEIF KeyDown( KeyV! )  THEN
	ls_ltr = "V"	
ELSEIF KeyDown( KeyW! )  THEN
	ls_ltr = "W"	
ELSEIF KeyDown( KeyX! )  THEN
	ls_ltr = "X"	
ELSEIF KeyDown( KeyY! )  THEN
	ls_ltr = "Y"	
ELSEIF KeyDown( KeyZ! )  THEN
	ls_ltr = "Z"		
END IF

IF ls_ltr = is_last_key THEN
	li_start_row = This.GetRow()
ELSE
	li_start_row = 0
END IF

li_found = This.Find( "Mid(field_name_allias,1,1 ) = '" + ls_ltr + "'", li_start_row +1, 10000)

IF li_found <=0 THEN
	is_last_key = ""
	Return
END IF

This.ScrollToRow( li_found )
This.SetRow( li_found )
This.SelectRow( 0, False )
This.SelectRow( li_found, True )

is_last_key = ls_ltr
end event

event ue_after_open;//This.SetTransObject( w_train_app.tr_training_data )
//This.Retrieve( 1 )
end event

event clicked;Long li_row

li_row = GetClickedRow()

IF li_row > 0 THEN
	This.SetRow( li_row )
	This.ScrollToRow( li_row )
	This.SelectRow( 0 , False )
	This.SelectRow( li_row, True )	
END IF

//This.DragIcon = "field.ico"
This.Drag(Begin! )
end event

event constructor;//PostEvent( "ue_after_open" )
end event

event doubleclicked;//IF ii_align = 1 OR ii_copy_fields = 1 THEN
//	MessageBox("Tools", "You must select the SELECT FIELD tool from the tools menu to select a field." )
//	Return 0
//END IF
//ib_new_select = True
//
//if this.getitemnumber(row,"field_id") = 91125 or this.getitemnumber(row,"parent_field") = 91125 then
//	messagebox("Mapping error","The field Address Type cannot be mapped.  It can only be used for Query Filters.")
//	return -1
//end if
//
//of_select_button()

of_dw_field_dclick()


end event

event getfocus;idw = This
This.BorderStyle = StyleLowered!
//dw_screen.BorderStyle = StyleBox!
end event

event retrieveend;//IF NOT ib_hold_on_retrieve_end THEN
	of_retrieve_end()
//END IF


//Long i
//Long l
//Long li_nr
//String ls_address_fields[]
//String ls_code_fields[]
//
//ls_code_fields[2] = "Code"
//ls_code_fields[1] = "Description"
//
//ls_address_fields[9] = "Entity_Name"
//ls_address_fields[8] = "Street1"
//ls_address_fields[7] = "Street2"
//ls_address_fields[6] = "City"
//ls_address_fields[5] = "State"
//ls_address_fields[4] = "Zip"
//ls_address_fields[3] = "Country"
//ls_address_fields[2] = "Phone"
//ls_address_fields[1] = "Fax"
//
//
//FOR i = 1 TO rowcount
//	IF This.GetItemString( i, "lookup_type" ) = "A" THEN
//		FOR l = 1 TO 9
//			li_nr = This.InsertRow( i + 1)
//			rowcount = rowcount + 1
//			This.SetItem( li_nr, "parent_field", This.GetItemNumber( i, "field_id" ))
//			This.SetItem( li_nr, "field_name_allias", ls_address_fields[l] )
//			This.SetItem( li_nr, "field_type", "AL" )
//			This.SetItem( li_nr, "field_id", This.GetItemNumber( i, "field_id" )) 
//			This.SetItem( li_nr, "table_id", This.GetItemNumber( i, "table_id" )) 
//		END FOR
//	ELSEIF This.GetItemString( i, "lookup_type" ) = "C" THEN
//		FOR l = 1 TO 2
//			li_nr = This.InsertRow( i + 1)
//			rowcount = rowcount + 1
//			This.SetItem( li_nr, "parent_field", This.GetItemNumber( i, "field_id" ))
//			This.SetItem( li_nr, "field_name_allias", ls_code_fields[l] )
//			This.SetItem( li_nr, "field_type", "CL" )
//			This.SetItem( li_nr, "field_id", This.GetItemNumber( i, "field_id" )) 
//			This.SetItem( li_nr, "table_id", This.GetItemNumber( i, "table_id" )) 
//		END FOR		
//	END IF
//END FOR
//
//IF rowcount > 0 THEN
//	This.SetRow( 1 )
//	This.SelectRow( 1, True )
//END IF
end event

event dragleave;//ib_drag_drop = True
//This.TriggerEvent( DoubleClicked! )
end event

type uo_bar from pfc_cst_build_annotation_bar within tabpage_design
boolean visible = false
integer x = 23
integer y = 1140
integer width = 1001
integer height = 56
integer taborder = 40
boolean bringtotop = true
long backcolor = 80269524
end type

on uo_bar.destroy
call pfc_cst_build_annotation_bar::destroy
end on

type uo_preview from pfc_cst_u_create_app2 within tabpage_design
boolean visible = false
integer x = 9
integer y = 12
integer width = 3511
integer height = 1828
integer taborder = 20
boolean border = false
long backcolor = 80269524
end type

on uo_preview.destroy
call pfc_cst_u_create_app2::destroy
end on

type ole_scan from olecustomcontrol within tabpage_design
event scanstarted ( )
event scandone ( )
event pagedone ( long pagenumber )
event scanuidone ( )
event filenamerequest ( long pagenumber )
boolean visible = false
integer x = 105
integer y = 952
integer width = 146
integer height = 128
integer taborder = 40
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
string binarykey = "w_train_app.win"
integer binaryindex = 1
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
end type

type dw_2 from datawindow within tabpage_design
boolean visible = false
integer x = 206
integer y = 952
integer width = 1339
integer height = 716
integer taborder = 70
string dataobject = "d_auto_align_side"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;This.SetTransObject( sqlca )
end event

type dw_1 from datawindow within tabpage_design
boolean visible = false
integer x = 192
integer y = 960
integer width = 1339
integer height = 680
integer taborder = 50
string dataobject = "d_auto_align"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;This.SetTransObject( sqlca )
end event

type ole_edit from olecustomcontrol within tabpage_design
event keydown ( ref long keycode,  long shift )
event keyup ( ref long keycode,  long shift )
event keypress ( ref long keyascii )
event mousedown ( long button,  long shift,  long ocx_x,  long ocx_y )
event mousemove ( long button,  long shift,  long ocx_x,  long ocx_y )
event mouseup ( long button,  long shift,  long ocx_x,  long ocx_y )
event click ( )
event dblclick ( )
event ocx_error ( long number,  ref string description,  long scode,  string source,  string helpfile,  long helpcontext,  ref boolean canceldisplay )
event ocx_close ( )
event markend ( long left,  long top,  long ocx_width,  long ocx_height,  long marktype,  string groupname )
event toolselected ( long toolid )
event selectionrectdrawn ( long left,  long top,  long ocx_width,  long ocx_height )
event tooltip ( long index )
event toolpalettehidden ( long left,  long top )
event scroll ( )
event markselect ( long button,  long shift,  long left,  long top,  long ocx_width,  long ocx_height,  long marktype,  string groupname )
event pastecompleted ( )
event load ( double zoom )
event markmove ( long marktype,  string groupname )
event pagepropertiesclose ( )
event checkcontinueprinting ( long pagesprinted,  long currentpage,  long status )
event hyperlinkgotopage ( long page )
event errorsavingundoinformation ( long ocx_error )
event straightenpage ( )
event hyperlinkgotodoc ( string link,  long page,  ref boolean handled )
event editingtextannotation ( boolean editing )
event magnifierstatus ( long hwnd,  long status,  long magnifierzoom,  long left,  long top,  long ocx_width,  long ocx_height )
event pasteclip ( ref long mode )
event baddocumentfiletype ( long page,  ref boolean errorout,  ref boolean skippage,  ref boolean overwritepage )
event readystatechange ( long readystate )
event key_dowm pbm_keydown
event key_up pbm_keyup
integer x = 18
integer y = 24
integer width = 1317
integer height = 768
integer taborder = 30
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
string binarykey = "w_train_app.win"
integer binaryindex = 2
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
end type

event click();//takes place after markselect
IF ib_pause_temp  = True THEN
	Return
END IF
//messagebox("","click")
IF ii_align = 1 THEN//OR ii_copy_fields = 1  THEN
	Return
END IF

IF ib_click_position THEN
	IF ib_new_field_selection THEN
		//jad 7/30  
		ii_ancor_x = UnitsToPixels (This.PointerX ( ), XUnitsToPixels! ) + 1//+ This.Object.ScrollPositionX()
		//IF ii_ancor_x = 0 THEN
		//	GOTO leave
		//END IF
		ii_ancor_y = UnitsToPixels (This.PointerY ( ), YUnitsToPixels! ) -6//+ This.Object.ScrollPositionY() -3		
		cb_apply.TriggerEvent( Clicked! )		
		cb_apply.Visible = True
		w_train_app.st_msg.Visible = False
	ELSE
		ii_ancor_x = UnitsToPixels (This.PointerX ( ), XUnitsToPixels! ) + This.Object.ScrollPositionX()
		ii_ancor_y = UnitsToPixels (This.PointerY ( ), YUnitsToPixels! ) + This.Object.ScrollPositionY() -3
		ii_copy_ancor_x = UnitsToPixels (This.PointerX ( ), XUnitsToPixels! ) + This.Object.ScrollPositionX()
		ii_copy_ancor_y = UnitsToPixels (This.PointerY ( ), YUnitsToPixels! ) + This.Object.ScrollPositionY() -12		
	END IF
	ib_click_position = False
	IF ib_placing_template = True THEN
		//ib_placing_template = False	
		//w_section_templates.of_place_template()
		//--------------------------- APPEON BEGIN ---------------------------
		//$<add> 08.16.2006 By: LeiWei
		//$<reason> Fix a defect.
		w_section_templates.of_place_template1()
		//---------------------------- APPEON END ----------------------------
	END IF	
	Return
ELSEIF ib_label_tool THEN
	
END IF

//leave:
end event

event selectionrectdrawn(long left, long top, long ocx_width, long ocx_height);//--------------------------- APPEON BEGIN ---------------------------
//$<add> 2006-08-15 By: Liu Hongxin
//$<reason> After this, can do copy and cut.
if (ocx_width + ocx_height = 0) then
	is_IsRectangle = False
else
	is_IsRectangle = True
end if
//---------------------------- APPEON END ----------------------------
//Long ll_app_field_id
//Long ll_x_end
//Long ll_y_end
//
//IF ii_copy_fields = 1 THEN
//
//	ll_x_end = left + ocx_width
//	ll_y_end = top + ocx_height
//
//   debugbreak()
//
//   DECLARE c_app_field_id CURSOR FOR  
//   SELECT app_field_prop.app_field_id  
//   FROM app_field_prop  
//   WHERE ( app_field_prop.app_id = :ii_app_id ) AND
//        ( app_field_prop.page = :ii_current_page ) AND
//  	     ( app_field_prop.x_pos >= :left AND app_field_prop.x_pos <= :ll_x_end ) AND
//        ( app_field_prop.y_pos >= :top  AND app_field_prop.y_pos <= :ll_y_end )   ;
//			
//	OPEN c_app_field_id;  
//
//   FETCH c_app_field_id INTO :ll_app_field_id;
//  
//   DO WHILE SQLCA.SQLCODE = 0
//	   ii_ancor_count++	
//	   ole_edit.Object.SelectAnnotationGroup( ll_app_field_id )	  	  	  
//		messagebox("", ll_app_field_id )
//	   FETCH c_app_field_id INTO :ll_app_field_id;
//   LOOP
//
//END IF
end event

event markselect(long button, long shift, long left, long top, long ocx_width, long ocx_height, long marktype, string groupname);//ib_saved = False

String ls_field_description
string ls_test_group //Start Code Change ---- 05.30.2006 #489 maha
long li_field_id
Long li_x
Long li_y

if gi_test_mode = 1 then
	messagebox("markselect (test mode)", "markselect event" )
end if

ib_rectangle_selected = False

IF ib_loading_annotations = True THEN
	Return
END IF



IF marktype = 4 THEN
	is_label_id = groupname
	li_field_id = Long( Mid( groupname, 11, 100) )
	ii_app_field_id = li_field_id
	li_x = left + This.Object.ScrollPositionX()
	li_y = top +  This.Object.ScrollPositionY()
	of_update_field( groupname, li_x, li_y, ocx_width, ocx_height )
	ib_rectangle_selected = True
	Return 
END IF

li_x = left + This.Object.ScrollPositionX()

li_y = top + This.Object.ScrollPositionY()

ib_label_selected = False

IF ii_align = 1 OR ii_copy_fields = 1 OR ii_connect_fields = 1 THEN
	//Start Code Change ---- 05.30.2006 #489 maha
	ls_test_group = groupname
	if of_dupe_field_test(ls_test_group) = 0 then
		ii_ancor_count ++
		is_selected_fields[ ii_ancor_count] = ls_test_group	
		//MESSAGEBOX("", is_selected_fields[ ii_ancor_count]  )
		ii_x[ii_ancor_count] = left + This.Object.ScrollPositionX()
		ii_y[ii_ancor_count] = top + This.Object.ScrollPositionY()
		ii_height[ ii_ancor_count ] = ocx_height
	end if
	//End Code Change---05.30.2006
END IF
//MESSAGEBOX("", ii_ancor_count )

IF ib_fix_fields THEN
	ii_ancor_x = left
	ii_ancor_y = top	
END IF

IF ii_ancor_count = 1 OR ii_copy_fields = 1 OR ii_connect_fields = 1 THEN
	ii_ancor_x = left
	ii_ancor_y = top
	ii_copy_ancor_x = left
	ii_copy_ancor_y = top	
END IF

IF Upper(Right( groupname, 6 )) = "YESBOX" THEN
	ii_app_field_id = long( Mid( groupname, 1, Len( groupname ) - 6) )
ELSEIF Upper(Right( groupname, 5 )) = "NOBOX" THEN
	ii_app_field_id = long( Mid( groupname, 1, Len( groupname ) - 5) )	
ELSEIF Upper(Left( groupname, 9 )) = "RECTANGLE" THEN
	is_label_id = Left( groupname, 9 )	
	ib_rectangle_selected = True
	ii_app_field_id = long( Mid( groupname, 11, 100 ))		
	UPDATE app_field_prop
   SET x_pos = :li_x,   
       y_pos = :li_y,
		 box_width = :ocx_width,
		 box_height = :ocx_height
	WHERE app_field_id = :ii_app_field_id
	USING tr_training_data;
	Return 		
ELSEIF Upper(Left( groupname, 15 )) = "HOLLOWRECTANGLE" THEN
	ib_rectangle_selected = True	
	ii_app_field_id = long( Mid( groupname, 17, 100 ))			
	is_label_id = Left( groupname, 15 )
	UPDATE app_field_prop
   SET x_pos = :li_x,   
       y_pos = :li_y,
		 box_width = :ocx_width,
		 box_height = :ocx_height
	WHERE app_field_id = :ii_app_field_id
	USING tr_training_data;
	Return 		
ELSEIF Upper(Right( groupname, 5 )) = "CHECK" THEN
	ii_app_field_id = long( Mid( groupname, 1, Len( groupname ) - 5) )		
ELSEIF Upper( Mid( groupname, 1, 6 )) = "LABEL-" THEN
   ib_label_selected = True
	is_label_id = groupname
	ii_app_field_id = long( Mid( groupname, Pos( groupname, ";" ) + 1, 100 ) )
	UPDATE app_field_prop
     SET x_pos = :li_x,   
          y_pos = :li_y
	WHERE app_field_id = :ii_app_field_id
	USING tr_training_data;	
	Return 	
ELSEIF Upper( Mid( groupname, 1, 3 )) = "SP-" THEN
   ib_label_selected = True
	is_label_id = groupname
	ii_app_field_id = long( Mid( groupname, POS( groupname, "," ) + 1, 100 ) )
	UPDATE app_field_prop
     SET x_pos = :li_x,   
         y_pos = :li_y
	WHERE app_field_id = :ii_app_field_id
	USING tr_training_data;
	Return 	
ELSEIF Upper( Mid( groupname, 1, 3 )) = "BOX" THEN
   ib_label_selected = True
	is_label_id = groupname
	Return 	
ELSE
	ii_app_field_id = long( groupname )
END IF

IF ii_copy_fields = 1 THEN
	IF ii_app_field_id > 0 THEN
		ii_app_field_ids[ ii_ancor_count ] = ii_app_field_id
		//messagebox("", ii_app_field_id )
	END IF
END IF
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-31
//$<modify> 04.04.2006 By: Rodger Wu
//$<reason> Performance Tuning
//$<modification> Write script to retrieve data from a cache instead of from the database.

/*
SELECT app_field_prop.field_description  
INTO :ls_field_description  
FROM app_field_prop  
WHERE app_field_prop.app_field_id = :ii_app_field_id 
USING tr_training_data;
*/
If tab_1.tabpage_design.dw_fld_prop.rowcount() > 0 Then
	ls_field_description = tab_1.tabpage_design.dw_fld_prop.GetItemString( 1, "field_description" )
End If
//---------------------------- APPEON END ----------------------------

IF ii_align <> 1 AND ii_copy_fields <> 1 AND ii_connect_fields <> 1 THEN
	ii_ancor_x = left
	ii_ancor_y = top 
END IF

IF IsNull( ls_field_description ) OR ls_field_description = "" THEN
ELSE
	tab_1.tabpage_design.st_field.Text = ls_field_description
END IF

IF shift <> 0 THEN
	Return
END IF
IF IsNull( groupname ) OR groupname = "" THEN
	Return
END IF

of_update_field( groupname, left, top,ocx_width, ocx_height )


//tab_fld_prop.SelectTab( 1 )

This.SetFocus()

ib_saved = False
end event

event key_dowm;//////////////////////////////////////////////////////////////////////
// $<event>ole_edit.key_dowm()
// $<arguments>
//		value	keycode     	key     		
//		value	unsignedlong	keyflags		
// $<returns> long
// $<description>
// $<description>
//////////////////////////////////////////////////////////////////////
// $<add> 05.13.2006 by Cao YongWang
//////////////////////////////////////////////////////////////////////
Long li_x_pos
Long li_y_pos

SetPointer( Arrow! )

ib_contol_key_down = False
tab_1.tabpage_design.ole_edit.Object.scrollbars = false

if tab_1.selectedtab = 3 then //maha changed 11-28-00 to allow enter key on other tabs  
	IF tab_1.tabpage_design.dw_fld_prop.RowCount() = 1 AND +&
		( key = KeyDownArrow! OR key = KeyUpArrow! OR key =  KeyLeftArrow! OR key = KeyRightArrow! ) AND +&
		ib_label_selected = False THEN
		//This.tab_1.tabpage_design.ole_edit.SetRedraw( False )	//avoiding screen blinks on web application
		li_x_pos = tab_1.tabpage_design.dw_fld_prop.GetItemNumber( 1, "x_pos" )
		li_y_pos = tab_1.tabpage_design.dw_fld_prop.GetItemNumber( 1, "y_pos" )
		IF KeyDown( KeyControl! ) AND KeyDown( KeyRightArrow! ) THEN 
			of_auto_align()
			//This.tab_1.tabpage_design.ole_edit.SetRedraw( True )			//avoiding screen blinks on web application
			tab_1.tabpage_design.ole_edit.Object.scrollbars = True
			Return
		ELSEIF key = KeyDownArrow! THEN
			ib_moving_field = True
			li_y_pos = li_y_pos + 1 - tab_1.tabpage_design.ole_edit.Object.ScrollPositionY()
			li_x_pos = li_x_pos - tab_1.tabpage_design.ole_edit.Object.ScrollPositionX()
		ELSEIF key = KeyUpArrow! THEN
			ib_moving_field = True
			li_y_pos = li_y_pos - 1	- tab_1.tabpage_design.ole_edit.Object.ScrollPositiony()
			li_x_pos = li_x_pos - tab_1.tabpage_design.ole_edit.Object.ScrollPositionX()	
		ELSEIF key = KeyLeftArrow! THEN
			li_x_pos = li_x_pos - 1	- tab_1.tabpage_design.ole_edit.Object.ScrollPositionX()
			li_y_pos = li_y_pos - tab_1.tabpage_design.ole_edit.Object.ScrollPositionY()	
		ELSEIF key = KeyRightArrow! THEN
			li_x_pos = li_x_pos + 1	- tab_1.tabpage_design.ole_edit.Object.ScrollPositionX()	
			li_y_pos = li_y_pos - tab_1.tabpage_design.ole_edit.Object.ScrollPositionY()	
		END IF
	
		ii_ancor_x = li_x_pos
		ii_ancor_y = li_y_pos
	
		IF key = KeyDownArrow! OR key = KeyUpArrow! THEN
			tab_1.tabpage_design.dw_fld_prop.SetItem( 1, "y_pos", ii_ancor_y )
		ELSEIF key = KeyLeftArrow! OR key = KeyRightArrow! THEN
			tab_1.tabpage_design.dw_fld_prop.SetItem( 1, "x_pos", ii_ancor_x )
		END IF
	
		tab_1.tabpage_design.cb_apply.TriggerEvent( Clicked! )
		ib_moving_field = False
		//This.tab_1.tabpage_design.ole_edit.SetRedraw( True )	//avoiding screen blinks on web application
	ELSEIF ib_label_selected THEN
		MessageBox("Invalid", "Only the mouse can be used to adjust objects that are not fields.")
	END IF
	
	IF KeyDown( KeyControl! ) THEN
		ib_contol_key_down = True
		w_train_app.title = "key control"
	END IF
	//--------------------------- APPEON BEGIN ---------------------------
	//$<add> 08.14.2006 By: LeiWei
	//$<reason> Fix a defect.
	IF KeyDown( KeyDelete! ) THEN
		w_train_app.of_remove_object( )
	END IF
	tab_1.tabpage_design.ole_edit.Object.scrollbars = True
	//---------------------------- APPEON END ----------------------------
end if
end event

event dragdrop;
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-32
//$<modify> 01.13.2006 By: Ye KaiChun
//$<reason> In w_train_app, an OLE control ole_eidt is used as the target control 
//$<reason> to carry the objects dragged from other control/object.  However, after analysis, 
//$<reason> Appeon did not find any object that can be dragged and dropped to ole_edit.
//$<modification> Comment out the following script.
//integer i
////dw_field.triggerevent(doubleclicked!)
//i = of_dw_field_dclick() //maha 042004
//
//if i > 0 then
//	This.TriggerEvent( "Click" )
//end if

if appeongetclienttype() = 'PB' then
	integer i
	//dw_field.triggerevent(doubleclicked!)
	i = of_dw_field_dclick() //maha 042004
	
	if i > 0 then
		This.TriggerEvent( "Click" )
	end if
end if
//---------------------------- APPEON END ----------------------------
end event

type tab_fld_prop from tab within tabpage_design
integer x = 1481
integer y = 1240
integer width = 2007
integer height = 588
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 80269524
boolean fixedwidth = true
boolean raggedright = true
boolean focusonbuttondown = true
boolean powertips = true
integer selectedtab = 1
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
tabpage_4 tabpage_4
end type

event selectionchanged;IF newindex = 1 THEN
	li_last_fld_prop_tab = 1
	dw_fld_prop.Object.DataWindow.VerticalScrollPosition='0'
	dw_fld_prop.SetColumn( "width" )
ELSEIF newindex = 2 THEN
	li_last_fld_prop_tab = 2
	dw_fld_prop.Object.DataWindow.VerticalScrollPosition='580'
	dw_fld_prop.SetColumn( "record_number" )	
ELSEIF newindex = 3 THEN
	li_last_fld_prop_tab = 3
	dw_fld_prop.Object.DataWindow.VerticalScrollPosition='1340'
	dw_fld_prop.SetColumn( "object_type" )
ELSEIF newindex = 4 THEN //address query //maha 030705
	li_last_fld_prop_tab = 4
	dw_fld_prop.Object.DataWindow.VerticalScrollPosition='2000'
	dw_fld_prop.SetColumn( "record_num_addr" )
END IF
//--------------------------- APPEON BEGIN ---------------------------
//$<add> 09.18.2006 By: Liu Hongxin
//$<reason> Fix defect.
tab_1.tabpage_design.dw_fld_prop.SetRedraw(True)
//---------------------------- APPEON END ----------------------------

end event

on tab_fld_prop.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.tabpage_3=create tabpage_3
this.tabpage_4=create tabpage_4
this.Control[]={this.tabpage_1,&
this.tabpage_2,&
this.tabpage_3,&
this.tabpage_4}
end on

on tab_fld_prop.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
destroy(this.tabpage_3)
destroy(this.tabpage_4)
end on

event constructor;//tabpage_4.visible = false
end event

type tabpage_1 from userobject within tab_fld_prop
integer x = 18
integer y = 100
integer width = 1970
integer height = 472
long backcolor = 80269524
string text = "Format"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
long picturemaskcolor = 536870912
cb_3 cb_3
st_1 st_1
st_2 st_2
end type

on tabpage_1.create
this.cb_3=create cb_3
this.st_1=create st_1
this.st_2=create st_2
this.Control[]={this.cb_3,&
this.st_1,&
this.st_2}
end on

on tabpage_1.destroy
destroy(this.cb_3)
destroy(this.st_1)
destroy(this.st_2)
end on

type cb_3 from commandbutton within tabpage_1
integer x = 1614
integer y = 36
integer width = 343
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "view"
end type

event clicked;openwithparm(w_app_prop_view,ii_app_field_id)
end event

type st_1 from statictext within tabpage_1
integer x = 539
integer y = 204
integer width = 791
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "No Field Selected"
boolean focusrectangle = false
end type

type st_2 from statictext within tabpage_1
integer x = 347
integer y = 24
integer width = 247
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
boolean enabled = false
string text = "none"
boolean focusrectangle = false
end type

type tabpage_2 from userobject within tab_fld_prop
integer x = 18
integer y = 100
integer width = 1970
integer height = 472
long backcolor = 80269524
string text = "Query"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
long picturemaskcolor = 536870912
end type

type tabpage_3 from userobject within tab_fld_prop
integer x = 18
integer y = 100
integer width = 1970
integer height = 472
long backcolor = 80269524
string text = "Display Type"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
long picturemaskcolor = 536870912
end type

type tabpage_4 from userobject within tab_fld_prop
boolean visible = false
integer x = 18
integer y = 100
integer width = 1970
integer height = 472
long backcolor = 80269524
string text = "Addr Query"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
long picturemaskcolor = 536870912
end type

type dw_fld_prop from datawindow within tabpage_design
integer x = 1490
integer y = 1352
integer width = 1600
integer height = 460
integer taborder = 60
boolean bringtotop = true
string dataobject = "d_app_field_properties"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event buttonclicked;string nullval

SetNull( nullval )
//Start Code Change ---- 06.08.2006 #533 maha modified as choose from if and added address type options
choose case dwo.Name
	case "b_1"  //main query
		This.SetItem( 1, "query_field", nullval )
		This.SetItem( 1, "query_operator", nullval )
		This.SetItem( 1, "query_value", nullval )
		This.SetItem( 1, "billing_address_flag", 0 )
	case "b_2"  //address query
		This.SetItem( 1, "query_field_addr", nullval )
		This.SetItem( 1, "query_operator_addr", nullval )
		This.SetItem( 1, "query_value_addr", nullval )
		This.SetItem( 1, "billing_link_addr", 0 )
	case "b_disconnect"  //connect data
		This.SetItem( 1, "connect_field_id", long(nullval) )
		This.SetItem( 1, "connect_field_sort", long(nullval ) )
	case "b_poq" //prime office
		This.SetItem( 1, "query_field", "address_type" )
		This.SetItem( 1, "query_operator", "="  )
		This.SetItem( 1, "query_value", "647" )
	case "b_aoq" //add office
		This.SetItem( 1, "query_field", "address_type" )
		This.SetItem( 1, "query_operator", "="  )
		This.SetItem( 1, "query_value", "256" )
	case "b_haq" //home addr
		This.SetItem( 1, "query_field", "address_type" )
		This.SetItem( 1, "query_operator", "="  )
		This.SetItem( 1, "query_value", "648" )
	case "b_po" //prime office gp
		This.SetItem( 1, "query_field_addr", "address_type" )
		This.SetItem( 1, "query_operator_addr", "="  )
		This.SetItem( 1, "query_value_addr", "647" )
	case "b_ao" //add office gp
		This.SetItem( 1, "query_field_addr", "address_type" )
		This.SetItem( 1, "query_operator_addr", "="  )
		This.SetItem( 1, "query_value_addr", "256" )
	case "b_ha" //home addr gp
		This.SetItem( 1, "query_field_addr", "address_type" )
		This.SetItem( 1, "query_operator_addr", "="  )
		This.SetItem( 1, "query_value_addr", "648" )
end choose
//End Code Change---06.08.2006

end event

event editchanged;ib_saved = False
end event

event itemchanged;DataWindowChild dwchild
String ls_lookup_code 
Long li_found
Long li_rc
Long li_nr
String ls_query_field
String ls_fld_type
String ls_lookup_type
String nullval
integer c

SetNull( nullval )

IF This.GetColumnName() = "query_field" THEN
		
	c = This.GetChild( "query_field", dwchild )
	li_found = dwchild.Find( "field_name = '" + GetText() + "'", 1, 10000 )
	IF li_found > 0 THEN
		ls_lookup_code = dwchild.GetItemString( li_found, "lookup_code" )
		ls_lookup_type = dwchild.GetItemString( li_found, "lookup_type" )
		ls_fld_type = dwchild.GetItemString( li_found, "field_type" )
		
		ls_query_field = This.GetItemString( row, "query_field" )
		of_set_query_lookup(ls_lookup_type,data,ls_lookup_code,"query_value")
	END IF
	This.SetItem( row, "query_value", nullval )
	This.SetItem( row, "query_operator", "=" )
//Start Code Change ---- 02.07.2006 #257 maha
ELSEIF This.GetColumnName() = "query_field_addr" THEN
	c = This.GetChild( "query_field_addr", dwchild )
	li_found = dwchild.Find( "field_name = '" + GetText() + "'", 1, 10000 )
	IF li_found > 0 THEN
		ls_lookup_code = dwchild.GetItemString( li_found, "lookup_code" )
		ls_lookup_type = dwchild.GetItemString( li_found, "lookup_type" )
		ls_fld_type = dwchild.GetItemString( li_found, "field_type" )
		
		ls_query_field = This.GetItemString( row, "query_field_addr" )
		of_set_query_lookup(ls_lookup_type,data,ls_lookup_code,"query_value_addr")
	END IF
	This.SetItem( row, "query_value", nullval )
	This.SetItem( row, "query_operator", "=" )	
ELSEIF This.GetColumnName() = "object_type" AND (data = 'Y1' OR data = 'Y2' OR data = "C" OR data = "B" ) THEN
//Start Code Change ---- 08.29.2007 #V7 maha changed to function call
	of_set_yes_no_box( this, data)
//	This.GetChild( "box_yes_value", dwchild )
//	ls_lookup_code = This.GetItemString( row, "lookup_code")
//	dw_fld_prop.GetChild( "box_yes_value", dwchild )
//	dwchild.SetTransObject( w_train_app.tr_training_data )
//	dwchild.Retrieve( ls_lookup_code )		
//	This.GetChild( "box_no_value", dwchild )
//	ls_lookup_code = This.GetItemString( row, "lookup_code")
//	dw_fld_prop.GetChild( "box_no_value", dwchild )
//	dwchild.SetTransObject( w_train_app.tr_training_data )
//	//messagebox("2", ls_lookup_code )	
//	dwchild.Retrieve( ls_lookup_code )			
//END IF
//
//IF This.GetColumnName() = "object_type" THEN
//	This.GetChild( "box_yes_value", dwchild )
//	li_nr = dwchild.InsertRow( 0 )
//	dwchild.SetItem( li_nr, "code", "Is Null" )
//	li_nr = dwchild.InsertRow( 0 )
//	dwchild.SetItem( li_nr, "code", "Is Not Null" )	
//	This.GetChild( "box_no_value", dwchild )
//	li_nr = dwchild.InsertRow( 0 )
//	dwchild.SetItem( li_nr, "code", "Is Null" )
//	li_nr = dwchild.InsertRow( 0 )
//	dwchild.SetItem( li_nr, "code", "Is Not Null" )		
//	//--------------------------- APPEON BEGIN ---------------------------
//	//$<add> 04.01.2006 By: Liang QingShi
//	//$<reason> Fix a defect.	
//	if data = "C" then
//		dw_fld_prop.Modify( "box_no_value_t.visible = 0")
//		dw_fld_prop.Modify( "box_no_value.visible = 0")
//	else
//		dw_fld_prop.Modify( "box_no_value_t.visible = 1")
//		dw_fld_prop.Modify( "box_no_value.visible = 1")
//	end if	
//	//---------------------------- APPEON END ----------------------------
END IF
//End Code Change---08.29.2007			


IF This.GetColumnName() = "object_type" THEN
	This.GetChild( "box_yes_value", dwchild )
	li_nr = dwchild.InsertRow( 0 )
	dwchild.SetItem( li_nr, "code", "Is Null" )
	li_nr = dwchild.InsertRow( 0 )
	dwchild.SetItem( li_nr, "code", "Is Not Null" )	
	This.GetChild( "box_no_value", dwchild )
	li_nr = dwchild.InsertRow( 0 )
	dwchild.SetItem( li_nr, "code", "Is Null" )
	li_nr = dwchild.InsertRow( 0 )
	dwchild.SetItem( li_nr, "code", "Is Not Null" )		
	//--------------------------- APPEON BEGIN ---------------------------
	//$<add> 04.01.2006 By: Liang QingShi
	//$<reason> Fix a defect.	
	if data = "C" then
		dw_fld_prop.Modify( "box_no_value_t.visible = 0")
		dw_fld_prop.Modify( "box_no_value.visible = 0")
	else
		dw_fld_prop.Modify( "box_no_value_t.visible = 1")
		dw_fld_prop.Modify( "box_no_value.visible = 1")
	end if	
	//---------------------------- APPEON END ----------------------------
END IF


ib_saved = False
end event

event retrieveend;//maha modified 042505 to use of_set_query_lookup function
//Start Code Change ---- 02.09.2006 #258 maha  removed query field dw setup is set in of_update_field
Integer li_found
Integer li_retval
integer li_table
String ls_lookup_code
String ls_data
DataWindowChild dwchild
string ls_query_fld
string ls_lookup_type
string ls_fld_type
string ls_find
integer i


if this.rowcount() < 1 then return //maha 020906

of_select_field_info( ) //updates the selected field label 
		
//Group related
li_table = This.GetItemNumber( 1, "table_id")
if li_table >= 80 and li_table < 90 then //maha 020106 
	tab_1.tabpage_design.tab_fld_prop.tabpage_4.visible = true
	this.object.st_addr.visible = true
else
	tab_1.tabpage_design.tab_fld_prop.tabpage_4.visible = false
	this.object.st_addr.visible = false
	if tab_1.tabpage_design.tab_fld_prop.selectedtab = 4 then
		tab_1.tabpage_design.tab_fld_prop.selecttab(1)
	end if
end if
//End Code Change---02.09.2006

//fix issues. 
//if tab_1.tabpage_design.tab_fld_prop.selectedtab <> 4 then  //Commented By Ken.Guo 12/11/2007 For Focus can Not jump to tabpage_4 after click Apply button.
	long ll_tab
	ll_tab = tab_1.tabpage_design.tab_fld_prop.selectedtab
	tab_1.tabpage_design.dw_fld_prop.SetRedraw(False)
	tab_1.tabpage_design.tab_fld_prop.Post event selectionchanged(1 , ll_tab)
//End if //Commented By Ken.Guo 12/11/2007 

//Start Code Change ---- 08.29.2007 #V7 maha
of_set_yes_no_box( this,this.getitemstring(1, "object_type"))
//End Code Change---08.29.2007
end event

event retrievestart;//maha added 030205 to set the query_value field to text type rather than dddw that was causing a retrieval box.
//dddw retrieval takes place in the retrieveend event.



//this.Modify( "query_value.dddw.name = ''")
//this.Modify( "query_value.dddw.DataColumn = 'code'")
//this.Modify( "query_value_addr.dddw.name = ''")
//this.Modify( "query_value_addr.dddw.DataColumn = 'code'")
//maha removed 042505with additional modification to retrieveend
end event

type cb_apply from commandbutton within tabpage_design
integer x = 3177
integer y = 1536
integer width = 256
integer height = 84
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Apply"
boolean default = true
end type

event clicked;SetPointer( Arrow! )
dw_fld_prop.SetRedraw( False )

String ls_format
String ls_object_type
String ls_field_type
String ls_lookup_link_type
String ls_group_nm
String ls_fld_desc
String ls_lookup_link_field
String ls_fld_display
String ls_font_type
Long ll_field_id
Long li_field_len
long li_app_field_id //modified 071802 maha
String ls_fld_nm
String ls_tbl_nm
String ls_box_yes_value

dw_fld_prop.AcceptText()
if dw_fld_prop.rowcount() = 0 then return //maha 101804

ls_object_type = dw_fld_prop.GetItemString( 1, "object_type" )
ls_box_yes_value = ""
li_app_field_id = dw_fld_prop.GetItemNumber( 1, "app_field_id" )
tab_1.tabpage_design.ole_edit.Object.DeleteAnnotationGroup( String(li_app_field_id) )		

CHOOSE CASE Upper( ls_object_type )
	CASE "Y1"
		tab_1.tabpage_design.ole_edit.Object.DeleteAnnotationGroup( String(li_app_field_id) + "YesBox" )
		tab_1.tabpage_design.ole_edit.Object.DeleteAnnotationGroup( String(li_app_field_id) + "NoBox" )		
	CASE "C"
		tab_1.tabpage_design.ole_edit.Object.DeleteAnnotationGroup( String(li_app_field_id) + "Check" )		
		ls_box_yes_value = dw_fld_prop.GetItemString( 1, "box_yes_value" )
END CHOOSE
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-33
//$<modify> 04.04.2006 By: Rodger Wu
//$<reason> Performance Tuning
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

/*
dw_fld_prop.Update()
//dw_fld_prop.DataObject = ""
//dw_fld_prop.DataObject = "d_app_field_properties"
//dw_fld_prop.SetTransObject( w_train_app.tr_training_data )	

dw_fld_prop.Retrieve( li_app_field_id )
*/
gnv_appeondb.of_StartQueue()
dw_fld_prop.Update()
dw_fld_prop.Retrieve( li_app_field_id )
gnv_appeondb.of_CommitQueue()
//---------------------------- APPEON END ----------------------------

ls_fld_nm = dw_fld_prop.GetItemString( 1, "field_name" )
ls_tbl_nm = dw_fld_prop.GetItemString( 1, "table_name" )
li_field_len = dw_fld_prop.GetItemNumber( 1, "width" )

ii_record_number = dw_fld_prop.GetItemNumber( 1, "record_number" )
is_query_field = dw_fld_prop.GetItemString( 1, "query_field" )
is_query_operator = dw_fld_prop.GetItemString( 1, "query_operator" )
is_query_value = dw_fld_prop.GetItemString( 1, "query_value" )
ii_billing_address_flag = dw_fld_prop.GetItemNumber( 1, "billing_address_flag" )
ii_addr_record_number = dw_fld_prop.GetItemNumber( 1, "record_num_addr" )
is_addr_query_field = dw_fld_prop.GetItemString( 1, "query_field_addr" )
is_addr_query_operator = dw_fld_prop.GetItemString( 1, "query_operator_addr" )
is_addr_query_value = dw_fld_prop.GetItemString( 1, "query_value_addr" )
ii_addr_billing_flag = dw_fld_prop.GetItemNumber( 1, "billing_link_addr" )

IF NOT IsNull( is_query_field ) AND IsNull( is_query_operator ) THEN
	MessageBox("Error", "Need to put a Query Field Operator." )
	dw_fld_prop.SetColumn( "query_operator" )
	dw_fld_prop.SetRedraw( True )
	Return -1
END IF

w_train_app.tab_1.tabpage_design.st_field.Text = ls_tbl_nm + "->" + ls_fld_nm

IF w_train_app.ib_new_field_selection THEN
	ls_fld_nm = tab_1.tabpage_design.dw_fld_prop.GetItemString( 1, "field_name" )
	CHOOSE CASE Upper( ls_fld_nm )
		CASE "STATE"
			li_field_len = 2
		CASE "PLACE OF BIRTH STATE"
			li_field_len = 2
		CASE "TITLE"
			li_field_len = 6
		CASE "NAME SUFFIX"
			li_field_len = 6			
		CASE "SUFFIX"
			li_field_len = 6
		CASE "LAST NAME"
			li_field_len = 15
		CASE "PROFESSIONAL SUFFIX","PROFFESIONAL SUFFIX"
			li_field_len = 6
		CASE "SS #"
			ls_format = "SS#"
		CASE "COVERAGE LIMIT FROM", "COVERAGE LIMIT TO"
			li_field_len = 12
			ls_format = "Money"
		CASE "NAME/STREET 1"
			li_field_len = 45
		CASE "STREET"
			li_field_len = 45
		CASE "ID NUMBER"
			li_field_len = 15
		CASE "LICENSE NUMBER"
			li_field_len = 15			
	END CHOOSE
	tab_1.tabpage_design.dw_fld_prop.SetItem( 1, "width", li_field_len )	
	tab_1.tabpage_design.dw_fld_prop.SetItem( 1, "format", ls_format )	
END IF

//	w_train_app.tab_1.tabpage_design.ole_edit.Object.SelectAnnotationGroup( "" )
//	w_train_app.ib_click_position = True
//	w_train_app.tab_1.tabpage_design.st_click_msg.Visible = True
//	w_train_app.tab_1.tabpage_design.ole_edit.object.AnnotationType( 0 )
//	w_train_app.tab_1.tabpage_design.ole_edit.object.SelectionRectangle( True )		
//	w_train_app.of_disable_buttons()
//	DO WHILE w_train_app.ib_click_position
//		Yield()
//	LOOP
//	w_train_app.ib_click_position = False
//	w_train_app.tab_1.tabpage_design.ole_edit.object.AnnotationType( 11 )
//	w_train_app.tab_1.tabpage_design.st_click_msg.Visible = False
//	w_train_app.ib_new_field_selection = False
//	w_train_app.of_enable_buttons()
//END IF

CHOOSE CASE ls_object_type
	CASE "T"
		ll_field_id = dw_fld_prop.GetItemNumber( 1, "field_id" )
		ls_field_type = dw_fld_prop.GetItemString( 1, "sys_fields_field_type" )
		ls_lookup_link_type = dw_fld_prop.GetItemString( 1, "lookup_link_type" )
		ls_lookup_link_field = dw_fld_prop.GetItemString( 1, "lookup_link_field" )
		IF ls_lookup_link_type = "A" OR ls_lookup_link_type = "C" THEN
			ls_field_type = "C"
			IF ls_lookup_link_type = "A" THEN
				w_train_app.tab_1.tabpage_design.st_field.Text = w_train_app.tab_1.tabpage_design.st_field.Text + "->address_lookup->" + ls_lookup_link_field 
			ELSE
				w_train_app.tab_1.tabpage_design.st_field.Text = w_train_app.tab_1.tabpage_design.st_field.Text + "->code_lookup->" + ls_lookup_link_field		
			END IF
		END IF
		CHOOSE CASE Upper( ls_field_type )
			CASE "C"
				ls_fld_display = Fill( "x", li_field_len )
			CASE "I"
				ls_fld_display = Fill( "#", li_field_len )				
			CASE "D"
				ls_fld_display = "mm/dd/yyyy"
			CASE "N"
				ls_fld_display = Fill( "#", li_field_len )								
		END CHOOSE

		tab_1.tabpage_design.ole_edit.Object.AddAnnotationGroup( String(li_app_field_id) )
		tab_1.tabpage_design.ole_edit.object.AnnotationStampText( ls_fld_display )
		tab_1.tabpage_design.ole_edit.object.AnnotationFontColor(255)
		tab_1.tabpage_design.ole_edit.object.Annotationtype(8)		

		CHOOSE CASE dw_fld_prop.GetItemNumber( 1, "font_size" )
			CASE 1
				tab_1.tabpage_design.ole_edit.object.AnnotationFont.Name = "MS Serif"
				tab_1.tabpage_design.ole_edit.object.AnnotationFont.Size = 7
				IF w_train_app.ib_moving_field OR Not ib_new_select THEN
					w_train_app.ii_ancor_y = w_train_app.ii_ancor_y
				ELSE
					w_train_app.ii_ancor_y = w_train_app.ii_ancor_y - 5				
				END IF
			CASE 2
				tab_1.tabpage_design.ole_edit.object.AnnotationFont.Name = "Times New Roman"
				tab_1.tabpage_design.ole_edit.object.AnnotationFont.Size = 8				
				IF w_train_app.ib_moving_field OR Not ib_new_select THEN
					w_train_app.ii_ancor_y = w_train_app.ii_ancor_y
				ELSE
					w_train_app.ii_ancor_y = w_train_app.ii_ancor_y - 8
				END IF
			CASE 3
				tab_1.tabpage_design.ole_edit.object.AnnotationFont.Name = "Times New Roman"
				tab_1.tabpage_design.ole_edit.object.AnnotationFont.Size = 12		
				IF w_train_app.ib_moving_field OR Not ib_new_select THEN
					w_train_app.ii_ancor_y = w_train_app.ii_ancor_y
				ELSE
					w_train_app.ii_ancor_y = w_train_app.ii_ancor_y - 10
				END IF
		END CHOOSE
		IF dw_fld_prop.GetItemNumber( 1, "font_bold" ) = 1 THEN
			tab_1.tabpage_design.ole_edit.object.AnnotationFont.Bold = True
		ELSE
			tab_1.tabpage_design.ole_edit.object.AnnotationFont.Bold = False
		END IF
		tab_1.tabpage_design.ole_edit.object.Draw(w_train_app.ii_ancor_x, w_train_app.ii_ancor_y, 0, 0)
		tab_1.tabpage_design.ole_edit.object.Annotationtype(11)	
	CASE "B"
		tab_1.tabpage_design.ole_edit.Object.AddAnnotationGroup( dw_fld_prop.GetItemNumber( dw_fld_prop.GetRow(), "field_id" ) )
		tab_1.tabpage_design.ole_edit.object.Annotationtype(3)
		tab_1.tabpage_design.ole_edit.object.Draw(w_train_app.ii_ancor_x, w_train_app.ii_ancor_y, 20,20)
		tab_1.tabpage_design.ole_edit.object.Annotationtype(11)			
	CASE "Y1"
		//yes box
		tab_1.tabpage_design.ole_edit.Object.AddAnnotationGroup( String(li_app_field_id) + "YesBox")
		tab_1.tabpage_design.ole_edit.object.Annotationtype(3)
		tab_1.tabpage_design.ole_edit.object.AnnotationLineColor( 255 )		
		tab_1.tabpage_design.ole_edit.object.Draw(w_train_app.ii_ancor_x, w_train_app.ii_ancor_y, 20,20)
		
		//no
		tab_1.tabpage_design.ole_edit.Object.AddAnnotationGroup( String(li_app_field_id) + "NoBox")
		tab_1.tabpage_design.ole_edit.object.AnnotationLineColor( 0 )
		tab_1.tabpage_design.ole_edit.object.Draw(w_train_app.ii_ancor_x + 30, w_train_app.ii_ancor_y, 20,20)		
		tab_1.tabpage_design.ole_edit.object.Annotationtype(11)					
	CASE "Y2"
		//yes box
		tab_1.tabpage_design.ole_edit.Object.AddAnnotationGroup( String(li_app_field_id) + "YesCheck")
		tab_1.tabpage_design.ole_edit.object.AnnotationStampText( "X" )
		tab_1.tabpage_design.ole_edit.object.Annotationtype(8)
		tab_1.tabpage_design.ole_edit.object.Draw(w_train_app.ii_ancor_x, w_train_app.ii_ancor_y, 10,10)		
		tab_1.tabpage_design.ole_edit.object.Annotationtype(11)							
	CASE "C"		
		tab_1.tabpage_design.ole_edit.Object.AddAnnotationGroup( String( li_app_field_id ) + "Check" )
		tab_1.tabpage_design.ole_edit.object.AnnotationStampText( "X" )
		tab_1.tabpage_design.ole_edit.object.Annotationtype(8)
		CHOOSE CASE dw_fld_prop.GetItemNumber( 1, "font_size" )
			CASE 1
				tab_1.tabpage_design.ole_edit.object.AnnotationFont.Name = "MS Serif"
				tab_1.tabpage_design.ole_edit.object.AnnotationFont.Size = 7
				IF w_train_app.ib_moving_field OR Not ib_new_select THEN
					w_train_app.ii_ancor_y = w_train_app.ii_ancor_y
				ELSE
					w_train_app.ii_ancor_y = w_train_app.ii_ancor_y - 5				
				END IF
			CASE 2
				tab_1.tabpage_design.ole_edit.object.AnnotationFont.Name = "Times New Roman"
				tab_1.tabpage_design.ole_edit.object.AnnotationFont.Size = 8			
				IF w_train_app.ib_moving_field OR Not ib_new_select THEN
					w_train_app.ii_ancor_y = w_train_app.ii_ancor_y
				ELSE
					w_train_app.ii_ancor_y = w_train_app.ii_ancor_y - 8	
				END IF
			CASE 3
				tab_1.tabpage_design.ole_edit.object.AnnotationFont.Name = "Times New Roman"
				tab_1.tabpage_design.ole_edit.object.AnnotationFont.Size = 12
				IF w_train_app.ib_moving_field OR Not ib_new_select THEN
					w_train_app.ii_ancor_y = w_train_app.ii_ancor_y
				ELSE
					w_train_app.ii_ancor_y = w_train_app.ii_ancor_y - 10
				END IF
		END CHOOSE
		tab_1.tabpage_design.ole_edit.object.Draw(w_train_app.ii_ancor_x, w_train_app.ii_ancor_y, 10,10)
		tab_1.tabpage_design.ole_edit.object.Annotationtype(11)	
END CHOOSE

ls_fld_desc = 	w_train_app.tab_1.tabpage_design.st_field.Text   //+ " (" + ls_object_type + "-" + ls_box_yes_value + ")"		
//messagebox("", ls_fld_desc)
	
dw_fld_prop.SetItem( 1, "field_description", ls_fld_desc )

IF IsNull( ls_fld_desc ) OR ls_fld_desc = "" THEN
	w_train_app.ib_new_field_selection = False
	MessageBox("Error", "Invalid field description" )
	dw_fld_prop.SetRedraw( True )	
	Return -1
END IF

dw_fld_prop.Update()

ib_applied = True
ib_selected = False
//st_msg.Visible = False

ib_new_select = False
w_train_app.ib_new_field_selection = False
dw_fld_prop.SetRedraw( True )	

end event

type tabpage_merge from userobject within tab_1
event create ( )
event destroy ( )
boolean visible = false
integer x = 18
integer y = 112
integer width = 3552
integer height = 1836
boolean enabled = false
long backcolor = 80269524
string text = "Preview "
long tabtextcolor = 33554432
long tabbackcolor = 80269524
string picturename = "Custom090!"
long picturemaskcolor = 553648127
uo_create_app11 uo_create_app11
end type

on tabpage_merge.create
this.uo_create_app11=create uo_create_app11
this.Control[]={this.uo_create_app11}
end on

on tabpage_merge.destroy
destroy(this.uo_create_app11)
end on

type uo_create_app11 from pfc_cst_u_create_app2 within tabpage_merge
integer x = 9
integer y = 8
integer width = 3506
integer height = 2004
integer taborder = 10
boolean border = false
long backcolor = 80269524
end type

on uo_create_app11.destroy
call pfc_cst_u_create_app2::destroy
end on


Start of PowerBuilder Binary Data Section : Do NOT Edit
0Bw_train_app.bin 
2F00000600e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe00000006000000000000000000000001000000010000000000001000fffffffe00000000fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdfffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000fffffffe00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000600e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe00000006000000000000000000000001000000010000000000001000fffffffe00000000fffffffe0000000000000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
26fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdfffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000fffffffe00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000600e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe00000006000000000000000000000001000000010000000000001000fffffffe00000000fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdfffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
2Cffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000fffffffe00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1Bw_train_app.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
