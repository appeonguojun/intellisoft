$PBExportHeader$w_prac_data_1.srw
forward
global type w_prac_data_1 from w_main
end type
type uo_app_stat from pfc_cst_u_app_status within w_prac_data_1
end type
type tab_1 from tab within w_prac_data_1
end type
type tabpage_search from userobject within tab_1
end type
type uo_search from pfc_cst_u_extended_search within tabpage_search
end type
type tabpage_search from userobject within tab_1
uo_search uo_search
end type
type tabpage_detail from userobject within tab_1
end type
type oval_2 from oval within tabpage_detail
end type
type uo_data_entry from pfc_cst_u_data_entry within tabpage_detail
end type
type p_face from picture within tabpage_detail
end type
type tabpage_detail from userobject within tab_1
oval_2 oval_2
uo_data_entry uo_data_entry
p_face p_face
end type
type tabpage_app_audit from userobject within tab_1
end type
type uo_app_audit from pfc_cst_u_application_audit within tabpage_app_audit
end type
type tabpage_app_audit from userobject within tab_1
uo_app_audit uo_app_audit
end type
type tabpage_apptmnt_status from userobject within tab_1
end type
type uo_affill_status from pfc_cst_u_apptmnt_status within tabpage_apptmnt_status
end type
type tabpage_apptmnt_status from userobject within tab_1
uo_affill_status uo_affill_status
end type
type tabpage_verif from userobject within tab_1
end type
type uo_verif_summary from pfc_cst_u_verification_info within tabpage_verif
end type
type tabpage_verif from userobject within tab_1
uo_verif_summary uo_verif_summary
end type
type tabpage_profile from userobject within tab_1
end type
type uo_profile from pfc_cst_u_profile within tabpage_profile
end type
type tabpage_profile from userobject within tab_1
uo_profile uo_profile
end type
type tabpage_image from userobject within tab_1
end type
type uo_image from pfc_cst_u_imaging within tabpage_image
end type
type tabpage_image from userobject within tab_1
uo_image uo_image
end type
type tabpage_privileges from userobject within tab_1
end type
type uo_priv from uo_priv_data_ent within tabpage_privileges
end type
type tabpage_privileges from userobject within tab_1
uo_priv uo_priv
end type
type tabpage_net from userobject within tab_1
end type
type uo_net from pfc_ia_cst_nv_net_dev_new within tabpage_net
end type
type tabpage_net from userobject within tab_1
uo_net uo_net
end type
type tabpage_meetings from userobject within tab_1
end type
type uo_meetings from pfc_cst_u_meetings within tabpage_meetings
end type
type tabpage_meetings from userobject within tab_1
uo_meetings uo_meetings
end type
type tab_1 from tab within w_prac_data_1
tabpage_search tabpage_search
tabpage_detail tabpage_detail
tabpage_app_audit tabpage_app_audit
tabpage_apptmnt_status tabpage_apptmnt_status
tabpage_verif tabpage_verif
tabpage_profile tabpage_profile
tabpage_image tabpage_image
tabpage_privileges tabpage_privileges
tabpage_net tabpage_net
tabpage_meetings tabpage_meetings
end type
type cb_1 from commandbutton within w_prac_data_1
end type
end forward

global type w_prac_data_1 from w_main
integer x = 5
integer y = 260
integer width = 3643
integer height = 1980
string title = "Practitioner Data"
event ue_post_open ( )
event pfc_cst_app_audit_complete pbm_custom02
event pfc_cst_compose_request ( )
event pfc_cst_dial_phone ( )
event pfc_cst_de_complete ( )
event pfc_cst_print_letters ( )
event pfc_cst_copy_row ( )
event pfc_cst_field_defaults ( )
event pfc_cst_next_de_screen ( )
event pfc_cst_prior_de_screen ( )
event pfc_cst_reverify_data ( )
event pfc_cst_copy_verifications ( )
event pfc_cst_goto_web ( )
event pfc_cst_update_dddw ( )
event pfc_cst_retrieve_app_audit_data ( )
event pfc_cst_lookup_search ( )
event pfc_cst_delete_verification ( )
event pfc_cst_add_ver_entry ( )
event pfc_cst_npdb_export ( )
event pfc_cst_run_report ( )
event pfc_cst_print_report ( )
event pfc_cst_delete_survey ( )
event pfc_cst_print_survey ( )
event pfc_cst_priorpage ( )
event pfc_cst_nextpage ( )
event pfc_cst_batch_print ( )
event pfc_cst_a_select ( )
event pfc_cst_a_note ( )
event pfc_cst_a_highlight ( )
event pfc_cst_a_stamptext ( )
event pfc_cst_a_delete ( )
event pfc_cst_save_image ( )
event pfc_cst_page_properties ( )
event pfc_cst_clear_print ( )
event pfc_cst_straighten_page ( )
event pfc_cst_rotate ( )
event pfc_cst_undo ( )
event pfc_cst_print_net_dev_ltr ( )
event pfc_cst_print_net_dev_report ( )
event pfc_cst_iverify ( )
event pfc_cst_multi_app ( )
event pfc_cst_prac_notes ( )
event pfc_cst_null_affil_dates ( )
event pfc_cst_facility_specific_data ( )
event pfc_cst_net_dev_filter ( )
event pfc_cst_print_apps_from_pf ( )
event pfc_cst_refresh_net_dev_ai ( )
event pfc_cst_reappoint ( )
event pfc_cst_make_inactive ( )
event pfc_cst_make_active ( )
event pfc_cst_add_cme ( )
event pfc_cst_meeting_report ( )
event pfc_cst_appt_note ( )
event pfc_cst_scan_oig ( )
event pfc_cst_email_documents ( )
event pfc_cst_add_missing_audit_items ( )
event pfc_cst_priv_batch ( )
event pfc_cst_prac_invoice ( )
event pfc_cst_fax_image_documents ( )
event pfc_cst_screen_capture ( )
event pfc_cst_delete_all_images ( )
event pfc_cst_add_missing_audit_items_force ( )
event pfc_cst_verif_workflow ( )
event pfc_cst_application_workflow ( )
event pfc_cst_select_scanner ( )
event pfc_cst_import_photo ( )
event pfc_cst_verif_send_to_history ( )
event pfc_cst_find_missing_verifs ( )
uo_app_stat uo_app_stat
tab_1 tab_1
cb_1 cb_1
end type
global w_prac_data_1 w_prac_data_1

type prototypes
FUNCTION ulong SetCapture(ulong a) LIBRARY "user32.dll"
FUNCTION boolean ReleaseCapture() LIBRARY "user32.dll"
end prototypes

type variables
pfc_n_cst_ai_action_items inv_action_items
pfc_n_cst_ai_printletters inv_printletters

Integer ii_verifying_facility_id
Integer ii_parent_facility_id
Integer ii_column_cnt

Long il_prac_id 
Long il_rec_id
Long il_data_view = 1
Integer ii_org_id = 1

Boolean ib_new_prac = False
Boolean ib_setup_dddw = True
Boolean ib_refresh_screen_list = False
Boolean ib_app_audit_complete = False
Boolean ib_win_just_opened = True

Boolean ib_app_audit_retrieved = False
Boolean ib_site_survey_retrieved = False
Boolean ib_meetings_retrieved = False
Boolean ib_affil_stat_retrieved = False
Boolean ib_verif_info_retrieved = False
Boolean ib_image_info_retrieved = False
Boolean ib_priv_retrieved
Boolean ib_net_retrieved = False
boolean ib_tab_seleted   // mbs 03 Jan 2006 
boolean ib_from_ssn = false  //maha 10.03.06 #631

String is_rec_id_col_nm
String is_column_names[]
String is_view_type = "D"
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-01
//$<add> 01.18.2006 By: Cao YongWang
//$<reason> Performance tuning
//$<modification> Define variables to be used in subsequent script.

//For identifying whether the tab page has been opended.
boolean	ib_page2_selected,ib_page3_selected,ib_page4_selected,ib_page5_selected,ib_page6_selected 
boolean  ib_page7_selected,ib_page8_selected,ib_page9_selected,ib_page10_selected 

long		il_oriWidth , il_oriHeight
integer  il_pd_notes_cnt
DateTime idt_de_complete , idt_audit_complete, idt_verif_complete, idt_approval_complete  
string	is_facility_name , is_full_name

//For identifying whether the dw in the tab page needs to be updated by setting the value of them
//to TRUE/FALSE.
boolean  ib_page4_refresh, ib_page5_refresh //add by 04.11.2006
//---------------------------- APPEON END ----------------------------


//Added for Work Flow 10/26/2006 Henry
integer ii_wf_new_practitioner 
//Added by Nova on 2008-08-13
str_dashboard str_para
Boolean ib_auto_locate

Boolean ib_imageocx_showed = False //Added by Ken.Guo on 2008-11-07
end variables

forward prototypes
public function integer of_setup_title ()
public function integer of_retrieve_prac ()
public function integer of_retrieve_data_entry ()
public function integer of_retrieve_app_audit ()
public function integer of_retrieve_verif_info ()
public function integer of_retrieve_affil_stat ()
public function integer of_retrieve_site_survey ()
public function integer of_retrieve_meetings ()
public function integer of_retrieve_images ()
public function integer of_retrieve_privs ()
public function integer of_retrieve_net ()
public function integer of_app_audit (long al_appt_stat_id)
public function integer of_get_parent_facility (integer ai_facil_id)
public function integer of_se ()
public subroutine of_registerresize (integer ai_index)
public function integer of_updatecheck (powerobject apo_control[], ref powerobject apo_control_update[])
public function integer of_is_de_complete ()
public function integer of_new_prac (string as_from)
public function integer of_setup_title_search ()
public function integer of_validate_image ()
public function integer of_setresize (boolean ab_switch)
public subroutine of_dashboard (string as_facility_name, long ai_prac_id, long ai_facility_id)
end prototypes

event ue_post_open();
if not ib_tab_seleted then 
  tab_1.SelectTab(2)
end if 

ib_tab_seleted = false
//tab_1.SetRedraw(True)


//GarbageCollect()
end event

event pfc_cst_app_audit_complete;tab_1.tabpage_app_audit.uo_app_audit.triggerevent("pfc_cst_app_audit_complete")//modified maha 042304   of_app_audit_complete()
tab_1.tabpage_apptmnt_status.uo_affill_status.of_retrieve_detail()
uo_app_stat.of_get_status( il_prac_id, tab_1.tabpage_detail.uo_data_entry.of_get_parent_facility_id() )

end event

event pfc_cst_compose_request;tab_1.tabpage_app_audit.uo_app_audit.TriggerEvent("pfc_cst_compose_request")
end event

event pfc_cst_dial_phone;IF tab_1.SelectedTab = 3 THEN
	tab_1.tabpage_app_audit.uo_app_audit.TriggerEvent("pfc_cst_dial_phone")
ELSE
	tab_1.tabpage_verif.uo_verif_summary.TriggerEvent("pfc_cst_dial_phone")
END IF
end event

event pfc_cst_de_complete();//--------------------------- APPEON BEGIN ---------------------------
//$<add> 10.12.2006 By: Jack (Inova)
//$<reason> Queue Images for Scanning from Data Entry.
if of_validate_image() = 1 then return 
//---------------------------- APPEON END ----------------------------
tab_1.tabpage_detail.uo_data_entry.of_set_data_entry_complete()
tab_1.tabpage_apptmnt_status.uo_affill_status.of_retrieve_detail()
uo_app_stat.of_get_status( il_prac_id, tab_1.tabpage_detail.uo_data_entry.of_get_parent_facility_id() )
end event

event pfc_cst_print_letters;tab_1.tabpage_verif.uo_verif_summary.TriggerEvent( "pfc_cst_print_letters" )
end event

event pfc_cst_copy_row;tab_1.tabpage_app_audit.uo_app_audit.TriggerEvent( "pfc_cst_copy_row" )
end event

event pfc_cst_field_defaults;Tab_1.tabpage_detail.uo_data_entry.TriggerEvent( "pfc_cst_field_defaults" )
end event

event pfc_cst_next_de_screen;tab_1.tabpage_detail.uo_data_entry.of_select_de_screen("N")
end event

event pfc_cst_prior_de_screen;tab_1.tabpage_detail.uo_data_entry.of_select_de_screen("P")
end event

event pfc_cst_reverify_data;tab_1.tabpage_verif.uo_verif_summary.of_reverify_verif_data()
end event

event pfc_cst_copy_verifications;tab_1.tabpage_verif.uo_verif_summary.of_copy_verifications()
end event

event pfc_cst_goto_web;tab_1.tabpage_verif.uo_verif_summary.TriggerEvent("pfc_cst_goto_web")
end event

event pfc_cst_update_dddw;tab_1.tabpage_detail.uo_data_entry.TriggerEvent( "pfc_cst_update_dddw" )
end event

event pfc_cst_retrieve_app_audit_data;tab_1.tabpage_apptmnt_status.uo_affill_status.of_retrieve_detail()
end event

event pfc_cst_lookup_search;tab_1.tabpage_detail.uo_data_entry.of_lookup_search("A")
IF IsValid(m_pfe_cst_data_entry) THEN
	gnv_app.of_modify_menu_attr( m_pfe_cst_data_entry.m_edit.m_insert,'enabled', True)
	gnv_app.of_modify_menu_attr( m_pfe_cst_data_entry.m_edit.m_delete1,'enabled', True)
END IF
end event

event pfc_cst_delete_verification;tab_1.tabpage_verif.uo_verif_summary.of_Delete_Verification()
end event

event pfc_cst_add_ver_entry;tab_1.tabpage_detail.uo_data_entry.of_add_ver_entry()
end event

event pfc_cst_npdb_export;tab_1.tabpage_verif.uo_verif_summary.TriggerEvent( "pfc_cst_npdb_export" )
end event

event pfc_cst_run_report;tab_1.tabpage_profile.uo_profile.of_Run_Report()
end event

event pfc_cst_print_report();long Job

//maha 071105 cleaned up and added functioality for each tab where necessary
IF tab_1.SelectedTab = 1 THEN //search
	Job = PrintOpen() //maha 071105
	PrintScreen(Job, 50,50,7500,5600) //these are positions on the printed page
	PrintClose(Job)
ELSEIF tab_1.SelectedTab = 2 THEN	//cred data
	Job = PrintOpen() //maha 071105
	//tab_1.tabpage_detail.uo_data_entry.dw_detail.Print()
	PrintScreen(Job, 50,50,7500,5600) //these are positions on the printed page
	PrintClose(Job)
ELSEIF tab_1.SelectedTab = 3 THEN  //app_audit maha 082101
	tab_1.tabpage_app_audit.uo_app_audit.of_Print_list()
ELSEIF tab_1.SelectedTab = 4 THEN //appointment status
	Job = PrintOpen() //maha 071105
	PrintScreen(Job, 50,50,7500,5600) //these are positions on the printed page
	PrintClose(Job)
ELSEIF tab_1.SelectedTab = 5 THEN //verifs maha 071105
	tab_1.tabpage_verif.uo_verif_summary.of_print_report()
ELSEIF tab_1.SelectedTab = 6 THEN //profiles
	tab_1.tabpage_profile.uo_profile.of_Print_Report()
ELSEIF tab_1.SelectedTab = 7 THEN //images
	tab_1.tabpage_image.uo_image.of_Print()
ELSEIF tab_1.SelectedTab = 8 THEN  //privs maha 052901
	tab_1.tabpage_privileges.uo_priv.of_Print()
ELSEIF tab_1.SelectedTab = 9 then //application stat
	tab_1.tabpage_net.uo_net.of_gen_report( )
ELSEIF tab_1.SelectedTab = 10 then //meetings maha 071105
	tab_1.tabpage_meetings.uo_meetings.of_report( )

END IF
end event

event pfc_cst_delete_survey;//tab_1.tabpage_site.uo_survey.Event pfc_cst_delete_survey()
end event

event pfc_cst_print_survey;//tab_1.tabpage_site.uo_survey.Event pfc_cst_print_survey()
end event

event pfc_cst_priorpage;if tab_1.selectedtab = 4 then
	tab_1.tabpage_apptmnt_status.uo_affill_status.TriggerEvent( "pfc_cst_priorpage" )
else	
	tab_1.tabpage_image.uo_image.TriggerEvent( "pfc_cst_priorpage" )
	
end if
end event

event pfc_cst_nextpage();///messagebox("","next page")
if tab_1.selectedtab = 4 then
	tab_1.tabpage_apptmnt_status.uo_affill_status.TriggerEvent( "pfc_cst_nextpage" )
elseif tab_1.selectedtab = 7 then	
	tab_1.tabpage_image.uo_image.TriggerEvent(  "pfc_cst_nextpage" )
elseif tab_1.selectedtab = 2 then
	tab_1.tabpage_detail.uo_data_entry.TriggerEvent(  "pfc_cst_nextrecord")
end if
end event

event pfc_cst_batch_print;tab_1.tabpage_image.uo_image.of_batch_print()
end event

event pfc_cst_a_select;tab_1.tabpage_image.uo_image.Event pfc_cst_a_select()
end event

event pfc_cst_a_note;tab_1.tabpage_image.uo_image.Event pfc_cst_a_note()
end event

event pfc_cst_a_highlight;tab_1.tabpage_image.uo_image.Event pfc_cst_a_highlight()
end event

event pfc_cst_a_stamptext;tab_1.tabpage_image.uo_image.Event pfc_cst_a_stamptext()
end event

event pfc_cst_a_delete;tab_1.tabpage_image.uo_image.Event pfc_cst_a_delete()
end event

event pfc_cst_save_image;tab_1.tabpage_image.uo_image.Event pfc_cst_save_image()
end event

event pfc_cst_page_properties;tab_1.tabpage_image.uo_image.Event pfc_cst_page_properties()
end event

event pfc_cst_clear_print;tab_1.tabpage_verif.uo_verif_summary.Event pfc_cst_clear_print()
end event

event pfc_cst_straighten_page;tab_1.tabpage_image.uo_image.TriggerEvent( "pfc_cst_straighten_page" )
end event

event pfc_cst_rotate;tab_1.tabpage_image.uo_image.TriggerEvent( "pfc_cst_rotate" )
end event

event pfc_cst_undo;tab_1.tabpage_image.uo_image.TriggerEvent( "pfc_cst_undo" )
end event

event pfc_cst_print_net_dev_ltr;tab_1.tabpage_net.uo_net.Event pfc_cst_print_net_dev_ltr( )
end event

event pfc_cst_print_net_dev_report;tab_1.tabpage_net.uo_net.Event pfc_cst_print_net_dev_report()


end event

event pfc_cst_iverify;tab_1.tabpage_verif.uo_verif_summary.TriggerEvent("pfc_cst_iverify")
end event

event pfc_cst_multi_app;tab_1.tabpage_apptmnt_status.uo_affill_status.Event pfc_cst_multi_app()
end event

event pfc_cst_prac_notes;openwithparm(w_prac_note,il_prac_id)


end event

event pfc_cst_null_affil_dates;tab_1.tabpage_apptmnt_status.uo_affill_status.of_null_dates()//maha 020702
end event

event pfc_cst_facility_specific_data;OpenWithParm( w_facility_specific_data, String( ii_parent_facility_id ) + "-" + String( il_prac_id ) )
end event

event pfc_cst_net_dev_filter;tab_1.tabpage_net.uo_net.Event pfc_cst_net_dev_filter()
end event

event pfc_cst_print_apps_from_pf;tab_1.tabpage_net.uo_net.Event pfc_cst_print_apps_from_pf( )
end event

event pfc_cst_refresh_net_dev_ai;tab_1.tabpage_net.uo_net.Event pfc_cst_refresh_net_dev_ai( )
end event

event pfc_cst_reappoint;tab_1.tabpage_net.uo_net.Event pfc_cst_reappoint()
end event

event pfc_cst_make_inactive;tab_1.tabpage_net.uo_net.Event pfc_cst_make_inactive( )
end event

event pfc_cst_make_active;tab_1.tabpage_net.uo_net.Event pfc_cst_make_active( )
end event

event pfc_cst_add_cme();tab_1.tabpage_meetings.uo_meetings.Event pfc_cst_add_cme()
end event

event pfc_cst_meeting_report;tab_1.tabpage_meetings.uo_meetings.Event pfc_cst_meeting_report( )
end event

event pfc_cst_appt_note;tab_1.tabpage_apptmnt_status.uo_affill_status.of_appoint_note()
end event

event pfc_cst_scan_oig;tab_1.tabpage_verif.uo_verif_summary.TriggerEvent( "pfc_cst_scan_oig" )
end event

event pfc_cst_email_documents;tab_1.tabpage_image.uo_image.of_email_documents ( )
end event

event pfc_cst_add_missing_audit_items;tab_1.tabpage_app_audit.uo_app_audit.TriggerEvent( "pfc_cst_add_missing_items" )
end event

event pfc_cst_priv_batch;tab_1.tabpage_privileges.uo_priv.TriggerEvent( "pfc_cst_priv_batch" )
end event

event pfc_cst_prac_invoice;OpenwithParm ( w_invoice, gl_prac_id)

//OpenSheet(w_invoice, w_mdi, 0, layered!)

end event

event pfc_cst_fax_image_documents;tab_1.tabpage_image.uo_image.Event pfc_cst_fax_image_documents( )
end event

event pfc_cst_screen_capture;tab_1.tabpage_verif.uo_verif_summary.Event pfc_cst_screen_capture()
end event

event pfc_cst_delete_all_images;tab_1.tabpage_image.uo_image.of_Delete_all_images()
end event

event pfc_cst_add_missing_audit_items_force();//////////////////////////////////////////////////////////////////////
// $<event>w_mainpfc_cst_add_missing_audit_items_force()
// $<arguments>(None)
// $<returns> 
// $<description> Required Documents Check Box on Data Entry Screen.
// $<description>
//////////////////////////////////////////////////////////////////////
// $<add> 10.17.2006 by Jack (Inova)
//////////////////////////////////////////////////////////////////////
tab_1.tabpage_app_audit.uo_app_audit.TriggerEvent( "pfc_cst_add_missing_items_force" )

end event

event pfc_cst_verif_workflow();//Added for work flow. 14/11/2006 Henry

tab_1.tabpage_verif.uo_verif_summary.TriggerEvent("pfc_cst_manual_workflow")
end event

event pfc_cst_application_workflow();//Added for work flow. 14/11/2006 Henry
tab_1.tabpage_net.uo_net.TriggerEvent("pfc_cst_manual_workflow")
end event

event pfc_cst_select_scanner();//Start Code Change ----02.21.2008 #V8 maha - added
tab_1.tabpage_image.uo_image.of_scanner_select()
end event

event pfc_cst_import_photo();//------------------------------------------------------------------------------
// Event: pfc_cst_Import_Photo()
//------------------------------------------------------------------------------
// Description: Import Photo
// Arguments:
//		None
// Return Value: 
//		None
//------------------------------------------------------------------------------
// Author:	Scofield		Date: 2008-07-10
//------------------------------------------------------------------------------
// Revision History: 
//				1.0   Initial version
//==============================================================================

tab_1.tabpage_detail.uo_data_entry.Event pfc_cst_import_photo()

end event

event pfc_cst_verif_send_to_history();tab_1.tabpage_verif.uo_verif_summary.of_send_verif_to_history()
end event

event pfc_cst_find_missing_verifs();tab_1.tabpage_verif.uo_verif_summary.of_find_missing_verif()
end event

public function integer of_setup_title ();String ls_name
String ls_facility_name
Integer li_parent_facility_id

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-02
//$<modify> 01.25.2006 By: Cao YongWang
//$<reason> Performance tuning
//$<modification> Write script to retrieve data from a cache instead of from the database.

/*
li_parent_facility_id = tab_1.tabpage_detail.uo_data_entry.of_get_parent_facility_id()

nv_prac_info lnv_full_name
lnv_full_name = CREATE nv_prac_info
ls_name = lnv_full_name.of_get_name( il_prac_id )
DESTROY lnv_full_name	
SELECT facility.facility_name  
INTO :ls_facility_name  
FROM facility  
WHERE facility.facility_id = :li_parent_facility_id   ;
*/
ls_name = is_full_name
ls_facility_name = is_facility_name
//---------------------------- APPEON END ----------------------------
	
This.Title = ls_name + " - " + String( il_prac_id ) + "  (" + ls_facility_name + ")"
	
Return 0
end function

public function integer of_retrieve_prac ();
il_prac_id = gl_prac_id
il_data_view = gl_data_view_id

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> UM-01
//$<comment> 01.13.2006 By: Ye KaiChun
//$<reason> The CreatePage function of UserObject object is currently unsupported.
//$<modification> Comment the following script and provide the same fucntionality by
//$<modification> using SelectTab function in the following script.

//Tab_1.tabpage_detail.CreatePage()
//Tab_1.tabpage_apptmnt_status.CreatePage()
//Tab_1.tabpage_verif.CreatePage()

//---------------------------- APPEON END ----------------------------

window lw
lw  = this


String ls_name
String ls_facility_name

ib_net_retrieved  = False
ib_affil_stat_retrieved = False
ib_meetings_retrieved = False
ib_site_survey_retrieved = False
ib_verif_info_retrieved = False
ib_app_audit_retrieved = False
ib_image_info_retrieved = False
ib_priv_retrieved = False //maha 012301

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-03
//$<add> 01.23.2006 By: Cao YongWang
//$<reason> Performance tuning
//$<modification> 1)Check the CreateOnDemand property for tab_1. 
//$<modification> 2)Write the following script to create the tabpage_detail if it has not been created.
If not ib_page2_selected Then
	IF il_prac_id = -9 THEN ib_new_prac = TRUE
	tab_1.selecttab(2)
End If
//---------------------------- APPEON END ----------------------------

tab_1.tabpage_apptmnt_status.uo_affill_status.of_Reset()
// mskinner 30 March 2005 -- begin
// getting argument error
//tab_1.tabpage_apptmnt_status.uo_affill_status.of_Set_Parent_Window( this)
tab_1.tabpage_apptmnt_status.uo_affill_status.of_Set_Parent_Window( lw )
// mskinner 30 March 2005 -- end 
if not ib_tab_seleted then 
  tab_1.tabpage_apptmnt_status.uo_affill_status.tab_view.SelectTab(2)
end if 


ii_parent_facility_id = gi_parent_facility
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-04
//$<modify> 01.24.2006 By: Cao YongWang
//$<reason> Performance tuning.
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

gnv_appeondb.of_startqueue()
//---------------------------- APPEON END ----------------------------

SELECT pd_affil_stat.verifying_facility  
INTO :ii_verifying_facility_id
FROM pd_affil_stat  
WHERE ( pd_affil_stat.prac_id = :il_prac_id ) AND  
      ( pd_affil_stat.parent_facility_id = :ii_parent_facility_id )   ;

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-05
//$<modify> 01.24.2006 By: Cao YongWang
//$<reason> Performance tuning.
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.
//The varilable il_pd_notes_cnt will be used in of_menu_security function in w_mdi.
select count(record_id) into :il_pd_notes_cnt from pd_notes where prac_id = :il_prac_id;

//The variable idt_de_complete will be used in the of_is_de_complete function in the pfc_cst_u_apptmnt_status useobject.
//The variable idt_audit_complete,variable idt_verif_complete, variable idt_de_complete and variable idt_approval_complete
//will be used in the of_get_status() function in pfc_cst_u_app_status user object.
SELECT pd_affil_stat.date_app_audit_completed,   
       pd_affil_stat.date_data_entry_completed,   
       pd_affil_stat.date_verif_completed,   
       pd_affil_stat.apptmnt_start_date  
INTO :idt_audit_complete,   
     :idt_de_complete,   
     :idt_verif_complete,   
     :idt_approval_complete  
FROM pd_affil_stat  
WHERE ( pd_affil_stat.prac_id = :il_prac_id ) AND  
      ( pd_affil_stat.parent_facility_id = :gi_parent_facility ) AND
		( pd_affil_stat.active_status in ( 1,4 ) ); 
		
//retrieve the facility name. The facility name will be used in the of_Setup_title function.
integer li_parent_facility_id
li_parent_facility_id = ii_parent_facility_id
SELECT facility.facility_name  
INTO :is_facility_name  
FROM facility  
WHERE facility.facility_id = :li_parent_facility_id   ;

//Retrieve the full name. The full name will be used in the of_setup_title function
SELECT v_full_name.full_name  
INTO :is_full_name  
FROM v_full_name  
WHERE v_full_name.prac_id = :il_prac_id   ;

//--------------------------- APPEON BEGIN ---------------------------
//$<Modify> 08.23.2007 By: Evan
//$<Reason> Need to destroy object.
//gds_lookup = create datastore
if not IsValid(gds_lookup) then gds_lookup = Create datastore
//---------------------------- APPEON END ----------------------------
gds_lookup.dataobject = 'd_dddw_billing_addresses'
gds_lookup.settransobject( sqlca)
gds_lookup.retrieve(il_prac_id )

gnv_appeondb.of_commitqueue()
If isnull(is_facility_name) Then is_facility_name = ''
//---------------------------- APPEON END ----------------------------

of_retrieve_data_entry()

//setup profile tab
// mskinner 30 March 2005 -- begin
// tab_1.tabpage_image.uo_image.of_set_parent( This )
 tab_1.tabpage_image.uo_image.of_set_parent( lw )
// mskinner 30 March 2005 -- end

//setup profile tab
tab_1.tabpage_profile.uo_profile.of_set_facility_Id( ii_parent_facility_id )
tab_1.tabpage_profile.uo_profile.of_set_prac_id( il_prac_id )

//verif_info
tab_1.tabpage_verif.uo_verif_summary.of_Reset( )
tab_1.tabpage_verif.uo_verif_summary.of_Set_facility_Id( ii_parent_facility_id )
tab_1.tabpage_verif.uo_verif_summary.of_Set_Prac_Id( il_prac_id )
tab_1.tabpage_verif.uo_verif_summary.of_Set_View_Id( il_data_view )

//appointment stat
tab_1.tabpage_apptmnt_status.uo_affill_status.of_Set_parent_facility_Id( ii_parent_facility_id )
tab_1.tabpage_apptmnt_status.uo_affill_status.of_set_prac_id( il_prac_id )

//Meetings
//tab_1.tabpage_meetings.uo_meetings.of_Set_parent_facility_Id( ii_parent_facility_id )
//tab_1.tabpage_meetings.uo_meetings.of_set_prac_id( il_prac_id )


//tab_1.SetRedraw(False)
ib_win_just_opened  = True
This.Width = 3657
This.Height = 2108
This.x=1

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-06
//$<modify> 01.23.2006 By: Cao YongWang
//$<reason> Performance tuning
//$<modification> Validate whether tabpage_detail has been opened. If yes then trigger the ue_post_open
//$<modification> event. This is due to the usage of CreateOnDemand property.
//This.PostEvent("ue_post_open")
If ib_page2_selected Then This.PostEvent("ue_post_open")
//---------------------------- APPEON END ----------------------------

uo_app_stat.of_get_status( il_prac_id, ii_parent_facility_id )


//PostEvent("pfc_postopen")removed maha 041905

tab_1.tabpage_apptmnt_status.uo_affill_status.of_is_de_complete()
of_new_prac( "of_retrieve_prac")

Return 0

end function

public function integer of_retrieve_data_entry ();//retrieve data entry
tab_1.tabpage_detail.uo_data_entry.of_set_verification_info( tab_1.tabpage_verif.uo_verif_summary )
tab_1.tabpage_detail.uo_data_entry.of_set_data_view_id( il_data_view )
tab_1.tabpage_detail.uo_data_entry.of_set_prac_id( il_prac_id )
tab_1.tabpage_detail.uo_data_entry.of_set_parent_facility_id( ii_parent_facility_id )

IF This.Title = "Screen Painter" THEN
	This.y = 194
	tab_1.tabpage_search.uo_search.Visible = False
ELSE
	This.y=1
END IF
IF il_prac_id = -9 THEN
	ib_new_prac = True
	il_prac_id = gnv_app.of_Get_Id("PRAC_ID")
		gl_prac_id = il_prac_id
	tab_1.tabpage_detail.uo_data_entry.of_set_prac_id( il_prac_id )	
	il_rec_id = gnv_app.of_Get_Id("RECORD_ID")
	This.Title = "New"
	uo_app_stat.of_Reset( )	
ELSE
	ib_new_prac = false
	of_setup_title()
END IF
// mskinner 30 March 2005 -- begin
window lw
lw = this
// tab_1.tabpage_detail.uo_data_entry.of_set_parent_window( This )
  tab_1.tabpage_detail.uo_data_entry.of_set_parent_window( lw )
// mskinner 30 March 2005 -- end
tab_1.tabpage_detail.uo_data_entry.of_setup( ib_new_prac )
tab_1.tabpage_detail.uo_data_entry.of_set_verifying_facility( ii_verifying_facility_id )

Return 0
end function

public function integer of_retrieve_app_audit ();//retrieve app audit
IF tab_1.tabpage_app_audit.Visible THEN
	IF Upper( gs_cust_type ) = "I" THEN
		tab_1.tabpage_app_audit.uo_app_audit.of_Set_parent_facility_Id( 1 )
	ELSE
		tab_1.tabpage_app_audit.uo_app_audit.of_Set_parent_facility_Id( ii_parent_facility_id )
	END IF
	tab_1.tabpage_app_audit.uo_app_audit.of_Retrieve( il_prac_id )	
END IF

ib_app_audit_retrieved = TRUE
	
Return 0


end function

public function integer of_retrieve_verif_info ();//\/maha  01-11-00  moved from selection changed event of tab_1  ~line 55
String ls_screen_name
Long ll_screen_id
ll_screen_id = tab_1.tabpage_detail.uo_data_entry.dw_select_section.GetItemNumber( tab_1.tabpage_detail.uo_data_entry.dw_select_section.GetRow(), "screen_id" )
ls_screen_name = tab_1.tabpage_detail.uo_data_entry.dw_select_section.GetItemString( tab_1.tabpage_detail.uo_data_entry.dw_select_section.GetRow(), "screen_name" )
tab_1.tabpage_verif.uo_verif_summary.of_Set_Screen( ll_screen_id, ls_screen_name )
//\mike

//retrieve verif data


If not isvalid(inv_action_items) Then inv_action_items =  CREATE pfc_n_cst_ai_action_items
//If not isvalid(inv_printletters) Then inv_printletters =  CREATE pfc_n_cst_ai_printletters

tab_1.tabpage_verif.uo_verif_summary.of_set_inv_action_items( inv_action_items )
tab_1.tabpage_verif.uo_verif_summary.of_Retrieve( il_prac_id )
ib_verif_info_retrieved = True

Return 0
end function

public function integer of_retrieve_affil_stat ();//retrieve affil status

tab_1.tabpage_apptmnt_status.uo_affill_status.of_Retrieve( il_prac_id )

ib_affil_stat_retrieved = TRUE

Return 0
end function

public function integer of_retrieve_site_survey ();//// retrieve site surveys
//IF tab_1.tabpage_net.Visible THEN
////	tab_1.tabpage_net.uo_net.of_Reset()
//	tab_1.tabpage_net.uo_net.of_set_prac_id( il_prac_id )
//	tab_1.tabpage_net.uo_net.of_set_facility_id( ii_parent_facility_id )	
////	tab_1.tabpage_site.uo_survey.of_Retrieve_detail()
//END IF
//
//ib_net_retrieved  = True
//
Return 0
end function

public function integer of_retrieve_meetings ();//RETRIEVE MEETINGS DETAIL
IF tab_1.tabpage_meetings.Visible THEN
	tab_1.tabpage_meetings.uo_meetings.of_Set_Prac_Id( il_prac_id )
	tab_1.tabpage_meetings.uo_meetings.of_Set_Parent_Facility_Id( ii_parent_facility_id )
	tab_1.tabpage_meetings.uo_meetings.of_Retrieve( il_prac_id )
	tab_1.tabpage_meetings.uo_meetings.of_get_this_facility_data()
END IF

ib_meetings_retrieved = True

Return 0
end function

public function integer of_retrieve_images ();//retrieve image data

tab_1.tabpage_image.uo_image.of_Set_prac_id( il_prac_id )
tab_1.tabpage_image.uo_image.of_set_verifying_facility_id( ii_verifying_facility_id )

ib_image_info_retrieved = True

Return 0
end function

public function integer of_retrieve_privs ();//messagebox("","of_retrieve_privs")

//retrieve privileges
//integer	li_row
//	tab_1.tabpage_privileges.uo_priv.dw_select.settransobject(sqlca)
//	tab_1.tabpage_privileges.uo_priv.dw_select.retrieve(il_prac_id,gs_user_id)
//	li_row = tab_1.tabpage_privileges.uo_priv.dw_select.getrow()
//	tab_1.tabpage_privileges.uo_priv.dw_select.scrolltorow(li_row)
//	tab_1.tabpage_privileges.uo_priv.dw_select.setrow(li_row)
//	tab_1.tabpage_privileges.uo_priv.dw_select.selectrow(0,false)
//	tab_1.tabpage_privileges.uo_priv.dw_select.selectrow(li_row,true)
//	tab_1.tabpage_privileges.uo_priv.dw_select.triggerevent(rowfocuschanged!)
//ib_priv_retrieved = true
//
//Return 0

////retrieve app audit
//IF tab_1.tabpage_privileges.Visible THEN
//	//tab_1.tabpage_app_audit.uo_app_audit.of_Set_parent_facility_Id( ii_parent_facility_id )
//if not ib_priv_retrieved then
	tab_1.tabpage_privileges.uo_priv.of_Retrieve_priv( il_prac_id )
	ib_priv_retrieved = TRUE
//END IF
//
//
//	
Return 0
end function

public function integer of_retrieve_net ();// retrieve network dev 
IF tab_1.tabpage_net.Visible THEN
	tab_1.tabpage_net.uo_net.of_Reset()
	tab_1.tabpage_net.uo_net.of_set_prac_id( il_prac_id )
	tab_1.tabpage_net.uo_net.of_set_facility_id( ii_parent_facility_id )	
	tab_1.tabpage_net.uo_net.of_retrieve_facilities()
END IF

ib_net_retrieved  = True

Return 0
end function

public function integer of_app_audit (long al_appt_stat_id);n_ds ldw_app_audit_facility
n_ds lds_last_app_audit_seq_no
n_ds ldw_rqrd_data
n_ds ldw_audit
Integer li_row_cnt
Integer i
Long ll_seq_no
Long ll_seq_row_cnt
Long ll_record_id
Long ll_app_audit_id
Integer li_facility_row_cnt
String ls_version

//check to see if security is installed, if it is not then give access to new view
//ls_version = ProfileString(gs_IniFilePathName, "setup", "version", "None")
ls_version = 'EE448738514625'
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-07
//$<modify> 01.17.2006 By: Cao YongWang
//$<reason> There is no need for the Web application to read the local INI file. The Web application
//$<reason> reads INI file from the server.
//$<modification> Make the condition to ensure when the IntelliCred is running on the Web, it does not
//$<modification> reads the local INI file.
//IF NOT FileExists( gs_dir_path + gs_DefDirName + "\intellicred.ini" ) THEN
//	MessageBox("ini File Error", "No intellicred.ini file found at: " + gs_dir_path + gs_DefDirName + "\intellicred.ini" )
//	Return -1
//END IF
If appeongetclienttype() = 'PB' Then
	IF NOT FileExists(gs_IniFilePathName ) THEN
		MessageBox("ini File Error", "No intellicred.ini file found at: " + gs_IniFilePathName )
		Return -1
	END IF
End If
//---------------------------- APPEON END ----------------------------

//IF ls_version = "None" THEN
//	MessageBox("Error", "Version number not setup.")
//	RETURN -1
//END IF
//
////app audit
//IF MID( ls_version, 11, 1) <> "4" THEN
//	RETURN 0
//END IF

//al_appt_stat_id = tab_view.tabpage_detail_1.dw_apptmnt_status.GetItemNumber( tab_view.tabpage_detail_1.dw_apptmnt_status.GetRow(), "rec_id" )

ldw_audit = CREATE n_ds
ldw_audit.DataObject = "d_pd_app_audit_rqrd_data"
ldw_audit.of_SetTransObject( SQLCA )

ldw_rqrd_data = CREATE n_ds
ldw_rqrd_data.DataObject = "d_app_audit_rqrd_data"
ldw_rqrd_data.of_SetTransObject( SQLCA )

li_row_cnt = ldw_rqrd_data.Retrieve( 1, "I" )
//<add> 07/25/2007 by: Andy
ldw_rqrd_data.setsort( "app_audit_id A" )
ldw_rqrd_data.sort()

Long ll_app_audit_id_old = -1
//end of add

lds_last_app_audit_seq_no = CREATE n_ds
lds_last_app_audit_seq_no.DataObject = "d_last_app_audit_seq_no"
lds_last_app_audit_seq_no.of_SetTransObject( SQLCA )

FOR i = 1 TO li_row_cnt
	//--------------------------- APPEON BEGIN ---------------------------
	//$<modify> 10.17.2006 By: Jack (Inova)
	//$<reason> Required Documents Check Box on Data Entry Screen.
	/*
	ldw_audit.InsertRow( 0 )
	*/
	integer li_auto_generate,li_row	

	li_auto_generate = ldw_rqrd_data.getitemnumber(i,'auto_generate')
	if li_auto_generate = 1 then
		continue
	end if
	li_row = ldw_audit.InsertRow( 0 )
	//---------------------------- APPEON END ----------------------------
	ll_record_id = gnv_app.of_get_id("RECORD_ID")
	ll_app_audit_id = ldw_rqrd_data.GetItemNumber( i, "app_audit_id" )
	//--------------------------- APPEON BEGIN ---------------------------
	//$<modify> 10.18.2006 By: Jack (Inova)
	//$<reason> Required Documents Check Box on Data Entry Screen.
	/*
	ldw_audit.SetItem( i, "rec_id", ll_record_id )
	ldw_audit.SetItem( i, "appt_stat_id", al_appt_stat_id )
	ldw_audit.SetItem( i, "prac_id", il_prac_id )
	ldw_audit.SetItem( i, "facility_id", 1 )
	ldw_audit.SetItem( i, "app_audit_id", ll_app_audit_id )
	*/
	ldw_audit.SetItem( li_row, "rec_id", ll_record_id )
	ldw_audit.SetItem( li_row, "appt_stat_id", al_appt_stat_id )
	ldw_audit.SetItem( li_row, "prac_id", il_prac_id )
	ldw_audit.SetItem( li_row, "facility_id", 1 )
	ldw_audit.SetItem( li_row, "app_audit_id", ll_app_audit_id )
	
	//---------------------------- APPEON END ----------------------------
	
	//<add> 07/25/2007 by: Andy
	if ll_app_audit_id_old = ll_app_audit_id then
		ll_seq_no ++
	else
	//end of add
		//find out the last seq no used
		ll_seq_row_cnt = lds_last_app_audit_seq_no.Retrieve( ll_app_audit_id, il_prac_id, 1 )	
		IF ll_seq_row_cnt < 1 THEN
			ll_seq_no = 1 
		ELSE
			ll_seq_no = lds_last_app_audit_seq_no.GetItemNumber( 1, "last_seq_no" ) + 1
		END IF
		//<add> 07/25/2007 by: Andy
		ll_app_audit_id_old = ll_app_audit_id
	end if
	//end of add
	//--------------------------- APPEON BEGIN ---------------------------
	//$<modify> 10.17.2006 By: Jack (Inova)
	//$<reason> Required Documents Check Box on Data Entry Screen.
	/*
	ldw_audit.SetItem( i, "seq_no", ll_seq_no	) 		
	ldw_audit.SetItem( i, "active_status", 1 )
	ldw_audit.SetItem( i, "pd_app_audit_fax_message", ldw_rqrd_data.GetItemString( i, "fax_description" )	) 	
	ldw_audit.SetItem( i, "description", ldw_rqrd_data.GetItemString( i, "description" )	) 	
	*/
	ldw_audit.SetItem( li_row, "seq_no", ll_seq_no	) 		
	ldw_audit.SetItem( li_row, "active_status", 1 )
	ldw_audit.SetItem( li_row, "pd_app_audit_fax_message", ldw_rqrd_data.GetItemString( i, "fax_description" )	) 	
	ldw_audit.SetItem( li_row, "description", ldw_rqrd_data.GetItemString( i, "description" )	) 		

	ldw_audit.SetItem( li_row, "app_type", ldw_rqrd_data.GetItemString( i, "app_type" )	)		
	//---------------------------- APPEON END ----------------------------
END FOR

IF ldw_audit.Update() = -1 THEN
	messagebox("", sqlca.sqlerrtext)
	MessageBox( "Update Error" , "Error updating application audit data.")
	Return -1
END IF

DESTROY ldw_audit
DESTROY ldw_rqrd_data
DESTROY ldw_app_audit_facility
DESTROY lds_last_app_audit_seq_no


RETURN 0

end function

public function integer of_get_parent_facility (integer ai_facil_id);ii_parent_facility_id = ai_facil_id

return 0
end function

public function integer of_se ();uo_app_stat.x = 1720

IF IsValid( m_pfe_cst_data_entry ) THEN
	m_pfe_cst_data_entry.m_file.m_multiapp.Visible = False
	gnv_app.of_modify_menu_attr( m_pfe_cst_data_entry.m_file.m_multiapp,'ToolBarItemVisible', False)
END IF

Return 1
end function

public subroutine of_registerresize (integer ai_index);//////////////////////////////////////////////////////////////////////
// $<function>w_prac_data_1of_registerresize()
// $<arguments>
//		value	integer	ai_index	, the index of the tab_1 control	
// $<returns> (None)
// $<description>
// $<description>
//////////////////////////////////////////////////////////////////////
// $<add> 01.18.2006 by Cao YongWang
//////////////////////////////////////////////////////////////////////

LONG LL_I
string ls_scale
powerobject lo_powerobjects[]

//this.inv_resize.of_SetOrigSize (il_oriWidth ,  il_oriHeight)
this.inv_resize.of_SetOrigSize (this.workspacewidth() ,  this.workspaceheight())

ls_scale = this.inv_resize.scale

Choose Case ai_index
	Case 2
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// The search uo_data_entry
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		
		this.inv_resize.of_Register (this.tab_1.tabpage_detail.uo_data_entry, ls_scale  )
		
		FOR LL_I =  1 TO UPPERBOUND(this.tab_1.tabpage_detail.uo_data_entry.CONTrol)
			this.inv_resize.of_Register (this.tab_1.tabpage_detail.uo_data_entry.CONTrol[LL_I]  , ls_scale )
		next
		
		FOR LL_I =  1 TO UPPERBOUND(this.tab_1.tabpage_detail.uo_data_entry.tab_view.tabpage_browse.CONTrol)
			this.inv_resize.of_Register (this.tab_1.tabpage_detail.uo_data_entry.tab_view.tabpage_browse.CONTrol[LL_I]  , ls_scale )
		next
		
		FOR LL_I =  1 TO UPPERBOUND(this.tab_1.tabpage_detail.uo_data_entry.tab_view.tabpage_details.CONTrol)
			this.inv_resize.of_Register (this.tab_1.tabpage_detail.uo_data_entry.tab_view.tabpage_details.CONTrol[LL_I]  , ls_scale )
		next
		FOR LL_I =  1 TO UPPERBOUND(this.tab_1.tabpage_detail.uo_data_entry.tab_view.tabpage_image.CONTrol)
			this.inv_resize.of_Register (this.tab_1.tabpage_detail.uo_data_entry.tab_view.tabpage_image.CONTrol[LL_I]  , ls_scale )
		next
		
	Case 3
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// The search uo_app_audit
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		
		this.inv_resize.of_Register (this.tab_1.tabpage_app_audit.uo_app_audit , ls_scale  )
		
		FOR LL_I =  1 TO UPPERBOUND(this.tab_1.tabpage_app_audit.uo_app_audit.CONTrol)
			this.inv_resize.of_Register (this.tab_1.tabpage_app_audit.uo_app_audit.CONTrol[LL_I]  , ls_scale )
		next
		
		FOR LL_I =  1 TO UPPERBOUND(this.tab_1.tabpage_app_audit.uo_app_audit.tab_view.tabpage_browse.CONTrol)
			this.inv_resize.of_Register (this.tab_1.tabpage_app_audit.uo_app_audit.tab_view.tabpage_browse.CONTrol[LL_I]  , ls_scale )
		next
		
		FOR LL_I =  1 TO UPPERBOUND(this.tab_1.tabpage_app_audit.uo_app_audit.tab_view.tabpage_detail.CONTrol)
			this.inv_resize.of_Register (this.tab_1.tabpage_app_audit.uo_app_audit.tab_view.tabpage_detail.CONTrol[LL_I]  , ls_scale )
		next

	Case 4
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// The search uo_affill_status
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		
		this.inv_resize.of_Register (this.tab_1.tabpage_apptmnt_status.uo_affill_status , ls_scale  )
		
		FOR LL_I =  1 TO UPPERBOUND(this.tab_1.tabpage_apptmnt_status.uo_affill_status.CONTrol)
			this.inv_resize.of_Register (this.tab_1.tabpage_apptmnt_status.uo_affill_status.CONTrol[LL_I]  , ls_scale )
		next
		
		FOR LL_I =  1 TO UPPERBOUND(this.tab_1.tabpage_apptmnt_status.uo_affill_status.tab_view.tabpage_browse.CONTrol)
			this.inv_resize.of_Register (this.tab_1.tabpage_apptmnt_status.uo_affill_status.tab_view.tabpage_browse.CONTrol[LL_I]  , ls_scale )
		next
		
		FOR LL_I =  1 TO UPPERBOUND(this.tab_1.tabpage_apptmnt_status.uo_affill_status.tab_view.tabpage_detail_1.CONTrol)
			this.inv_resize.of_Register (this.tab_1.tabpage_apptmnt_status.uo_affill_status.tab_view.tabpage_detail_1.CONTrol[LL_I]  , ls_scale )
		next
		
		FOR LL_I =  1 TO UPPERBOUND(this.tab_1.tabpage_apptmnt_status.uo_affill_status.tab_view.tabpage_detail_2.CONTrol)
			this.inv_resize.of_Register (this.tab_1.tabpage_apptmnt_status.uo_affill_status.tab_view.tabpage_detail_2.CONTrol[LL_I]  , ls_scale )
		next

	Case 7
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// The search tabpage_image
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		
		this.inv_resize.of_Register (this.tab_1.tabpage_image.uo_image , ls_scale  )
		
		FOR LL_I =  1 TO UPPERBOUND(this.tab_1.tabpage_image.uo_image.CONTrol)
			this.inv_resize.of_Register (this.tab_1.tabpage_image.uo_image.CONTrol[LL_I]  , ls_scale )
		next
		
		
		FOR LL_I =  1 TO UPPERBOUND(this.tab_1.tabpage_image.uo_image.TAB_view.TABpage_browse.CONTrol)
			this.inv_resize.of_Register (this.tab_1.tabpage_image.uo_image.TAB_view.TABpage_browse.CONTrol[LL_I]  , ls_scale )
		next
		
		FOR LL_I =  1 TO UPPERBOUND(this.tab_1.tabpage_image.uo_image.TAB_view.TABpage_image.CONTrol)
			this.inv_resize.of_Register (this.tab_1.tabpage_image.uo_image.TAB_view.TABpage_image.CONTrol[LL_I]  , ls_scale )
		next
		
		
		FOR LL_I =  1 TO UPPERBOUND(this.tab_1.tabpage_image.uo_image.TAB_view.TABpage_setup.CONTrol)
			this.inv_resize.of_Register (this.tab_1.tabpage_image.uo_image.TAB_view.TABpage_setup.CONTrol[LL_I]  , ls_scale )
		next

	Case 10
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// The search uo_meetings
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		
		this.inv_resize.of_Register (this.tab_1.tabpage_meetings.uo_meetings , ls_scale  )
		
		FOR LL_I =  1 TO UPPERBOUND(this.tab_1.tabpage_meetings.uo_meetings.CONTrol)
			this.inv_resize.of_Register (this.tab_1.tabpage_meetings.uo_meetings.CONTrol[LL_I]  , ls_scale )
		next
		
		
		FOR LL_I =  1 TO UPPERBOUND(this.tab_1.tabpage_meetings.uo_meetings.TAB_view.TABPage_browse.CONTrol)
			this.inv_resize.of_Register (this.tab_1.tabpage_meetings.uo_meetings.TAB_view.TABPage_browse.CONTrol[LL_I]  , ls_scale )
		next
		
		FOR LL_I =  1 TO UPPERBOUND(this.tab_1.tabpage_meetings.uo_meetings.TAB_view.TABPage_detail.CONTrol)
			this.inv_resize.of_Register (this.tab_1.tabpage_meetings.uo_meetings.TAB_view.TABPage_detail.CONTrol[LL_I]  , ls_scale )
		next

	Case 9
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// The search tabpage_net
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		
		this.inv_resize.of_Register (this.tab_1.tabpage_net.uo_net , ls_scale  )
		
		FOR LL_I =  1 TO UPPERBOUND(this.tab_1.tabpage_net.uo_net.CONTrol)
			this.inv_resize.of_Register (this.tab_1.tabpage_net.uo_net.CONTrol[LL_I]  , ls_scale )
		next
		
		FOR LL_I =  1 TO UPPERBOUND(this.tab_1.tabpage_net.uo_net.TAB_1.TABPage_ai.CONTrol)
			this.inv_resize.of_Register (this.tab_1.tabpage_net.uo_net.TAB_1.TABPage_ai.CONTrol[LL_I]  , ls_scale )
		next
		
		FOR LL_I =  1 TO UPPERBOUND(this.tab_1.tabpage_net.uo_net.TAB_1.TABpage_ids.CONTrol)
			this.inv_resize.of_Register (this.tab_1.tabpage_net.uo_net.TAB_1.TABpage_ids.CONTrol[LL_I]  , ls_scale )
		next 
		
		FOR LL_I =  1 TO UPPERBOUND(this.tab_1.tabpage_net.uo_net.TAB_1.TABPage_notes.CONTrol)
			this.inv_resize.of_Register (this.tab_1.tabpage_net.uo_net.TAB_1.TABPage_notes.CONTrol[LL_I]  , ls_scale )
		next 
		
		FOR LL_I =  1 TO UPPERBOUND(this.tab_1.tabpage_net.uo_net.TAB_1.tabpage_report.CONTrol)
			this.inv_resize.of_Register (this.tab_1.tabpage_net.uo_net.TAB_1.tabpage_report.CONTrol[LL_I]  , ls_scale )
		next

	Case 8
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// The search tabpage_privileges
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		
		this.inv_resize.of_Register (this.tab_1.tabpage_privileges.uo_priv , ls_scale  )
		
		FOR LL_I =  1 TO UPPERBOUND(this.tab_1.tabpage_privileges.uo_priv.CONTrol)
			this.inv_resize.of_Register (this.tab_1.tabpage_privileges.uo_priv.CONTrol[LL_I]  , ls_scale )
		next
		
		FOR LL_I =  1 TO UPPERBOUND(this.tab_1.tabpage_privileges.uo_priv.tab_1.tabpage_browse.CONTrol)
			this.inv_resize.of_Register (this.tab_1.tabpage_privileges.uo_priv.tab_1.tabpage_browse.CONTrol[LL_I]  , ls_scale )
		next
		
		FOR LL_I =  1 TO UPPERBOUND(this.tab_1.tabpage_privileges.uo_priv.tab_1.tabpage_detail .CONTrol)
			this.inv_resize.of_Register (this.tab_1.tabpage_privileges.uo_priv.tab_1.tabpage_detail.CONTrol[LL_I]  , ls_scale )
		next
		
		FOR LL_I =  1 TO UPPERBOUND(this.tab_1.tabpage_privileges.uo_priv.tab_1.tabpage_exp_priv .CONTrol)
			this.inv_resize.of_Register (this.tab_1.tabpage_privileges.uo_priv.tab_1.tabpage_exp_priv.CONTrol[LL_I]  , ls_scale )
		next

	Case 6
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// The search tabpage_profile
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		
		this.inv_resize.of_Register (this.tab_1.tabpage_profile.uo_profile , ls_scale  )
		
		FOR LL_I =  1 TO UPPERBOUND(this.tab_1.tabpage_profile.uo_profile .CONTrol)
			this.inv_resize.of_Register (this.tab_1.tabpage_profile.uo_profile.CONTrol[LL_I]  , ls_scale )
		next
		
		
		FOR LL_I =  1 TO UPPERBOUND(this.tab_1.tabpage_profile.uo_profile.tab_report.tabpage_profile .CONTrol)
			this.inv_resize.of_Register (this.tab_1.tabpage_profile.uo_profile.tab_report.tabpage_profile.CONTrol[LL_I]  , ls_scale )
		next
		
		
		FOR LL_I =  1 TO UPPERBOUND(this.tab_1.tabpage_profile.uo_profile.tab_report.tabpage_verification .CONTrol)
			this.inv_resize.of_Register (this.tab_1.tabpage_profile.uo_profile.tab_report.tabpage_verification.CONTrol[LL_I]  , ls_scale )
		next

	Case 5
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// The search tabpage_verif
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		
		this.inv_resize.of_Register (this.tab_1.tabpage_verif.uo_verif_summary , ls_scale  )
		
		FOR LL_I =  1 TO UPPERBOUND(this.tab_1.tabpage_verif.uo_verif_summary .CONTrol)
			this.inv_resize.of_Register (this.tab_1.tabpage_verif.uo_verif_summary.CONTrol[LL_I]  , ls_scale )
		next
		
		FOR LL_I =  1 TO UPPERBOUND(this.tab_1.tabpage_verif.uo_verif_summary.tab_view.tabpage_browse .CONTrol)
			this.inv_resize.of_Register (this.tab_1.tabpage_verif.uo_verif_summary.tab_view.tabpage_browse.CONTrol[LL_I]  , ls_scale )
		next
		
		
		FOR LL_I =  1 TO UPPERBOUND(this.tab_1.tabpage_verif.uo_verif_summary.tab_view.tabpage_detail .CONTrol)
			this.inv_resize.of_Register (this.tab_1.tabpage_verif.uo_verif_summary.tab_view.tabpage_detail.CONTrol[LL_I]  , ls_scale )
		next
		
		FOR LL_I =  1 TO UPPERBOUND(this.tab_1.tabpage_verif.uo_verif_summary.tab_view.tabpage_recred .CONTrol)
			this.inv_resize.of_Register (this.tab_1.tabpage_verif.uo_verif_summary.tab_view.tabpage_recred.CONTrol[LL_I]  , ls_scale )
		next

End Choose

//If il_oriWidth <> this.WorkSpaceWidth() Then this.triggerevent(resize!)
this.triggerevent(resize!)
end subroutine

public function integer of_updatecheck (powerobject apo_control[], ref powerobject apo_control_update[]);//////////////////////////////////////////////////////////////////////
// $<function>w_prac_data_1of_updatecheck()
// $<arguments>
//		value    	PowerObject	apo_control         		
//		reference	PowerObject	apo_control_update[]		
// $<returns> integer
// $<description> Performance tunging
//////////////////////////////////////////////////////////////////////
// $<add> 02.23.2006 by LeiWei
//////////////////////////////////////////////////////////////////////

Integer		li_max, li_i, li_max_updatecontrol, li_rc
Powerobject	lpo_tocheck
UserObject	luo_control
tab			ltab_control
Window		lw_control
Datawindow 	ldw_nonpfc
pfc_u_dw		ldw_u_dw
String ls_UpdateTable

// Loop thru all the objects
li_max = UpperBound (apo_control)
For li_i = 1 To li_max
	lpo_tocheck = apo_control[li_i]
	If IsNull(lpo_tocheck) Or Not IsValid(lpo_tocheck) Then Continue
	
	Choose Case TypeOf ( lpo_tocheck )
	
		Case Window!
			// Test for Window Controls
			lw_control = lpo_tocheck
			This.of_updatecheck ( lw_control.Control, apo_control_update[] )
			
		Case tab!
			// Test for tab controls 
			ltab_control = lpo_tocheck
			This.of_updatecheck ( ltab_control.Control, apo_control_update[] )
			
		Case UserObject!
			// Test for UserObjects 
			luo_control = lpo_tocheck
			This.of_updatecheck ( luo_control.Control, apo_control_update[] )

		Case DataWindow!
			ldw_nonpfc = lpo_tocheck
			
			// Perform AcceptText, check rc
			li_rc = ldw_nonpfc.AcceptText()
			If li_rc < 0 Then 
				ldw_nonpfc.SetFocus()
				Return FAILURE
			end if

			IF ldw_nonpfc.ModifiedCount() + ldw_nonpfc.DeletedCount() = 0 Then
				Continue
			End If

			ls_UpdateTable = Trim(ldw_nonpfc.Describe("Datawindow.Table.UpdateTable"))
			IF Isnull(ls_UpdateTable) Or ls_UpdateTable="" Or ls_UpdateTable="?" Or ls_UpdateTable="!" Then
				Continue
			End If

			If ldw_nonpfc.TriggerEvent ("pfc_descendant") = 1 Then
				ldw_u_dw = ldw_nonpfc
				If Not ldw_u_dw.of_isupdateable() Then
					Continue
				End If
			End If
			
			li_max_updatecontrol = UpperBound(apo_control_update)
			apo_control_update[li_max_updatecontrol + 1] = lpo_tocheck
	End Choose
Next

Return UpperBound (apo_control_update)

end function

public function integer of_is_de_complete ();
DateTime ldt_de_complete
//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 05.13.2006 By: Cao YongWang
//$<reason> 
//IF IsValid( m_pfe_cst_data_entry) THEN
If w_mdi.menuname = 'm_pfe_cst_data_entry' Then
//---------------------------- APPEON END ----------------------------
	SELECT pd_affil_stat.date_data_entry_completed
	INTO :ldt_de_complete  
	FROM pd_affil_stat  
	WHERE ( pd_affil_stat.prac_id = :il_prac_id ) AND
			( pd_affil_stat.active_status in ( 1,4 ) ) and //maha  changed to include pending 072402
			(pd_affil_stat.parent_facility_id = :gi_parent_facility); //maha added 111300

	IF IsNull( ldt_DE_complete ) OR String(ldt_de_complete) = "1/1/00 00:00:00" THEN
		gnv_app.of_modify_menu_attr( m_pfe_cst_data_entry.m_file.m_dataentrycomplete,'toolbaritemname', "Custom027!")
		//m_pfe_cst_data_entry.m_file.m_dataentrycomplete.enabled = True
		Return 0 
	ELSE
		gnv_app.of_modify_menu_attr( m_pfe_cst_data_entry.m_file.m_dataentrycomplete,'toolbaritemname', "Custom026!")
		//m_pfe_cst_data_entry.m_file.m_dataentrycomplete.enabled = False
		Return 1
	END IF
ELSE
	Return -1
END IF


end function

public function integer of_new_prac (string as_from);//Start Code Change ---- 03.30.2006 #361 maha new function
//maha created to hide screens and tabs with new practitioner addition

if ib_new_prac = true then
	tab_1.tabpage_detail.uo_data_entry.dw_select_section.setfilter("screen_id = 1")
	tab_1.tabpage_detail.uo_data_entry.dw_select_section.filter()
	tab_1.tabpage_app_audit.visible = false
	tab_1.tabpage_image.visible = false
	tab_1.tabpage_net.visible = false
	tab_1.tabpage_meetings.visible = false
	tab_1.tabpage_privileges.visible = false
	tab_1.tabpage_profile.visible = false
	tab_1.tabpage_verif.visible = false
	tab_1.tabpage_detail.uo_data_entry.of_set_parent_facility_id( ii_parent_facility_id )
else
	tab_1.tabpage_detail.uo_data_entry.dw_select_section.setfilter("")
	tab_1.tabpage_detail.uo_data_entry.dw_select_section.filter()
	w_mdi.of_prac_folder_security(this)
	
end if

//Start Code Change ----12.18.2007 #V8 maha added to set parent facility id so that if DE compl is clicked while a new prac, the function will work
if mid(as_from,1,22) = "postupdate(appt stat)@" then //when called from postupdate of affil_stat detail
	integer i
	i = integer(mid(as_from,23,len(as_from) - 22))
	tab_1.tabpage_detail.uo_data_entry.of_set_parent_facility_id(  i  )
end if
//End Code Change---12.18.2007
	
return 1
end function

public function integer of_setup_title_search ();//////////////////////////////////////////////////////////////////////
// $<function>w_prac_data_1of_setup_title_search()
// $<arguments>(None)
// $<returns> integer
// $<description> Right Click Functionality on Practitioner Search Screen.
// $<description>
//////////////////////////////////////////////////////////////////////
// $<add> 10.10.2006 by Jack (Inova)
//////////////////////////////////////////////////////////////////////

String ls_name
String ls_facility_name
Integer li_parent_facility_id,li_prac_id

li_parent_facility_id = tab_1.tabpage_search.uo_search.dw_search.getitemnumber(tab_1.tabpage_search.uo_search.dw_search.getrow(),'parent_facility_id')
li_prac_id = tab_1.tabpage_search.uo_search.dw_search.getitemnumber(tab_1.tabpage_search.uo_search.dw_search.getrow(),'prac_id')

nv_prac_info lnv_full_name
lnv_full_name = CREATE nv_prac_info
ls_name = lnv_full_name.of_get_name( li_prac_id )
if isnull(ls_name) then ls_name = ''
DESTROY lnv_full_name	
SELECT facility.facility_name  
INTO :ls_facility_name  
FROM facility  
WHERE facility.facility_id = :li_parent_facility_id   ;
	
this.Title = ls_name + " - " + String( li_prac_id ) + "  (" + ls_facility_name + ")"

return 1
end function

public function integer of_validate_image ();//////////////////////////////////////////////////////////////////////
// $<function>w_prac_data_1of_validate_image()
// $<arguments>(None)
// $<returns> (none)
// $<description>Queue Images for Scanning from Data Entry.
// $<description>
//////////////////////////////////////////////////////////////////////
// $<add> 10.12.2006 by Jack (Inova)
//////////////////////////////////////////////////////////////////////
if isvalid(tab_1.tabpage_detail.uo_data_entry) then
	if tab_1.tabpage_detail.uo_data_entry.of_validate_image() = -1 then
		Integer li_ans,i,ll_image_type_id,ll_find 	
		li_ans = MessageBox("Warning!", "The queued image records may be lost, Do you want to scan now?", Question!, YesNo!, 1)
		if li_ans = 1 then
			tab_1.SelectTab( 7 )
			tab_1.tabpage_image.uo_image.tab_view.tabpage_setup.cb_remove.enabled = true
			tab_1.tabpage_image.uo_image.tab_view.tabpage_setup.cb_from_file.enabled = true
			tab_1.tabpage_image.uo_image.tab_view.tabpage_setup.cb_scan.enabled = true
			ll_image_type_id = tab_1.tabpage_detail.uo_data_entry.ids_image_data.getitemnumber(1,'image_type_id')
			ll_find = tab_1.tabpage_image.uo_image.tab_view.tabpage_setup.dw_image_list.find("image_type_id = " + string(ll_image_type_id),1,100)
			if ll_find > 0 then
				tab_1.tabpage_image.uo_image.tab_view.tabpage_setup.dw_image_list.ScrollToRow( ll_find )
				tab_1.tabpage_image.uo_image.tab_view.tabpage_setup.dw_image_list.SetRow( ll_find )
			end if
			tab_1.tabpage_image.uo_image.tab_view.tabpage_setup.dw_image_data.setfocus()
			tab_1.tabpage_image.uo_image.tab_view.tabpage_setup.dw_image_data.setcolumn('notes')
			return 1
		else
			for i = 1 to tab_1.tabpage_detail.uo_data_entry.ids_image_data.rowcount()
				tab_1.tabpage_detail.uo_data_entry.ids_image_data.deleterow(i)
			next
			tab_1.tabpage_detail.uo_data_entry.ids_image_data.update()
			return 0
		end if
	end if
end if
return 0

end function

public function integer of_setresize (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//	Public Function:  of_SetResize
//	Arguments:		ab_switch   starts/stops the window resize service
//	Returns:			Integer 		1 = success,  0 = no action necessary, -1 error
//	Description:		Starts or stops the window resize service
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						5.0   Initial version
//						8.0   Modified to initially set window dimensions based on the class definition
//////////////////////////////////////////////////////////////////////////////
//	Copyright ? 1996-2001 Sybase, Inc. and its subsidiaries.  All rights reserved.  Any distribution of the 
// PowerBuilder Foundation Classes (PFC) source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//////////////////////////////////////////////////////////////////////////////
Integer	li_rc, li_v, li_vars
Integer li_origwidth, li_origheight

// Check arguments
If IsNull (ab_switch) Then
	Return -1
End If

If ab_switch Then
	If IsNull(inv_resize) Or Not IsValid (inv_resize) Then
		//Start Change Code By Jervis 01.09.2008
		//inv_resize = Create n_cst_resize
		//Support reisze when tab.CreateOnDemand = true
		inv_resize = Create n_cst_resize_prac
		//End Change by Jervis
		
		inv_resize.of_SetOrigSize ( this.width, this.height )
	
		li_rc = 1
	End If
Else
	If IsValid (inv_resize) Then
		Destroy inv_resize
		li_rc = 1
	End If
End If

Return li_rc


end function

public subroutine of_dashboard (string as_facility_name, long ai_prac_id, long ai_facility_id);Long ll_find
tab_1.tabpage_search.uo_search.dw_org_facility_select.setitem(1,"facility_id",ai_facility_id)
tab_1.tabpage_search.uo_search.ddlb_search_type.SelectItem("I.D.", 1)
tab_1.tabpage_search.uo_search.sle_srch_val.text=String(ai_prac_id)
tab_1.tabpage_search.uo_search.cb_search.event clicked( )
//find 
ll_find = tab_1.tabpage_search.uo_search.dw_search.Find("prac_id="+String(ai_prac_id)+" and facility_name= '" + as_facility_name + "'",1,tab_1.tabpage_search.uo_search.dw_search.RowCount())
IF ll_find > 0 THEN
	//scroll to row
	tab_1.tabpage_search.uo_search.dw_search.SelectRow(0,False)
	tab_1.tabpage_search.uo_search.dw_search.ScrollToRow(ll_find)
	tab_1.tabpage_search.uo_search.dw_search.SelectRow(ll_find,True)
	tab_1.tabpage_search.uo_search.Event ue_cb_select( )
	If This.WindowState = Minimized! Then This.windowstate = Normal!
END IF


end subroutine

on w_prac_data_1.create
int iCurrent
call super::create
this.uo_app_stat=create uo_app_stat
this.tab_1=create tab_1
this.cb_1=create cb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_app_stat
this.Control[iCurrent+2]=this.tab_1
this.Control[iCurrent+3]=this.cb_1
end on

on w_prac_data_1.destroy
call super::destroy
destroy(this.uo_app_stat)
destroy(this.tab_1)
destroy(this.cb_1)
end on

event activate; integer set_ck
 Integer li_index //Added By Ken.Guo 03.17.2008
//setredraw(false)
IF Left( This.Title, 14 ) = "Screen Painter" THEN
	//--------------------------- APPEON BEGIN ---------------------------
	//$<modify> 2006-11-14 By: Allen
	//$<reason> Fix APB Bug: the Toolbar Icon is invalid.
	/*
	w_mdi.ChangeMenu(m_pfe_cst_prac_data_design)
	*/
	If w_mdi.menuname <> 'm_pfe_cst_prac_data_design' Then w_mdi.ChangeMenu( m_pfe_cst_prac_data_design )
	//---------------------------- APPEON END ----------------------------
ELSE
	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> PT-08
	//$<add> 03.6.2006 By: Cao YongWang
	//$<reason> Performance tuning.
	//$<modification> Make a condition to ensure that when w_prac_data_1 is just opened,
	//$<modification> the following script will not be used. The script in the
	//$<modification> SelectionChanged of tab_1 has the same functionality.
	 If ib_win_just_opened Then return
	//---------------------------- APPEON END ----------------------------
	IF tab_1.SelectedTab = 1  THEN
		//--------------------------- APPEON BEGIN ---------------------------
		//$<modify> 2006-11-14 By: Allen
		//$<reason> Fix APB Bug: the Toolbar Icon is invalid.
		/*
		w_mdi.ChangeMenu(m_pfe_cst_mdi_menu)
		*/
		If w_mdi.menuname <> 'm_pfe_cst_mdi_menu' Then w_mdi.ChangeMenu( m_pfe_cst_mdi_menu )
		//---------------------------- APPEON END ----------------------------
	ELSEIF tab_1.SelectedTab = 2  THEN
		//--------------------------- APPEON BEGIN ---------------------------
		//$<modify> 2006-11-14 By: Allen
		//$<reason> Fix APB Bug: the Toolbar Icon is invalid.
		/*
		w_mdi.ChangeMenu(m_pfe_cst_data_entry)
		*/
		If w_mdi.menuname <> 'm_pfe_cst_data_entry' Then w_mdi.ChangeMenu( m_pfe_cst_data_entry )
		//---------------------------- APPEON END ----------------------------
		tab_1.tabpage_apptmnt_status.uo_affill_status.of_is_de_complete()
		tab_1.tabpage_detail.uo_data_entry.of_add_delete_enable()
		tab_1.tabpage_detail.uo_data_entry.of_refresh_page_menu() //Added By Ken.Guo 06.10.2008
	ELSEIF tab_1.SelectedTab = 3 THEN
		//--------------------------- APPEON BEGIN ---------------------------
		//$<modify> 2006-11-14 By: Allen
		//$<reason> Fix APB Bug: the Toolbar Icon is invalid.
		/*
		w_mdi.ChangeMenu(m_pfe_cst_app_audit)
		*/
		If w_mdi.menuname <> 'm_pfe_cst_app_audit' Then w_mdi.ChangeMenu( m_pfe_cst_app_audit )
		//---------------------------- APPEON END ----------------------------
	ELSEIF tab_1.SelectedTab = 4 THEN
		//comment 08/04/2007 by:Andy Reason:BugJ073009
		//After selecting this tab, switch to other applications and then return to this tab, 
		//there will be additional toolbar displayed, and 2 menus disappear.
		/*
		IF tab_1.tabpage_apptmnt_status.uo_affill_status.tab_view.SelectedTab = 4 THEN //netdev tab
			//--------------------------- APPEON BEGIN ---------------------------
			//$<modify> 2006-11-14 By: Allen
			//$<reason> Fix APB Bug: the Toolbar Icon is invalid.
			/*
			w_mdi.ChangeMenu(m_pfe_cst_net_dev)
			*/
			If w_mdi.menuname <> 'm_pfe_cst_net_dev' Then w_mdi.ChangeMenu( m_pfe_cst_net_dev )
			//---------------------------- APPEON END ----------------------------
			w_mdi.SetToolbarPos ( 2, 1, 200, False)	
		ELSE
		*/
			//--------------------------- APPEON BEGIN ---------------------------
			//$<modify> 2006-11-14 By: Allen
			//$<reason> Fix APB Bug: the Toolbar Icon is invalid.
			/*
			w_mdi.ChangeMenu(m_pfe_cst_data_entry)
			*/
			If w_mdi.menuname <> 'm_pfe_cst_data_entry' Then w_mdi.ChangeMenu( m_pfe_cst_data_entry )
			//---------------------------- APPEON END ----------------------------
			gnv_app.of_modify_menu_attr( m_pfe_cst_data_entry.m_edit.m_addverificationentry,'enabled', False)			
			//m_pfe_cst_data_entry.m_edit.m_addverificationentry.toolbaritemvisible = False
			w_mdi.SetToolbarPos ( 2, 1, 200, False)
			//select set_14 into :set_ck from icred_settings;
			set_ck = of_get_app_setting("set_14","I")
			if set_ck = 1 then //appointment note tool
				m_pfe_cst_data_entry.m_view.m_aptnote.visible = True //maha 111802
				gnv_app.of_modify_menu_attr( m_pfe_cst_data_entry.m_view.m_aptnote,'toolbaritemvisible', True) //maha 111802
			end if
		//END IF
	ELSEIF tab_1.SelectedTab = 5 THEN
		//--------------------------- APPEON BEGIN ---------------------------
		//$<modify> 2006-11-14 By: Allen
		//$<reason> Fix APB Bug: the Toolbar Icon is invalid.
		/*
		w_mdi.ChangeMenu( m_pfe_cst_verif_info )
		*/
		If w_mdi.menuname <> 'm_pfe_cst_verif_info' Then w_mdi.ChangeMenu( m_pfe_cst_verif_info )
		//---------------------------- APPEON END ----------------------------
		w_mdi.SetToolbarPos ( 2, 1, 200, False)	
		w_mdi.SetToolbarPos ( 3, 1, 300, False)	
	//--------------------------- APPEON BEGIN ---------------------------
	//$<add> 01/08/2008 By: Ken.Guo
	//$<reason> Lost menu items after switch to other window.
	ELSEIF tab_1.SelectedTab = 6 THEN
		If w_mdi.menuname <> 'm_pfe_cst_profile' Then w_mdi.ChangeMenu( m_pfe_cst_profile )
	ELSEIF tab_1.SelectedTab = 7 THEN
		//-------------Begin Modified by Alfee 10.10.2008 --------------------
		//<$Reason>A Web bug - the image toolbars can't work
		li_index = This.tab_1.tabpage_image.uo_image.tab_view.Selectedtab
		This.tab_1.tabpage_image.uo_image.of_set_menu(li_index)
		w_mdi.SetToolbarPos ( 2, 1, 200, False)	
		w_mdi.SetToolbarPos ( 3, 1, 300, False)
		/*
		If w_mdi.menuname <> 'm_pfe_cst_imaging' Then w_mdi.ChangeMenu( m_pfe_cst_imaging )
		w_mdi.SetToolbarPos ( 2, 1, 200, False)	
		w_mdi.SetToolbarPos ( 3, 1, 300, False)
		//--------------------------- APPEON BEGIN ---------------------------
		//$<add> 03/17/2008 By: Ken.Guo
		//$<reason> Refresh wdi menu items
		If ib_page7_selected Then
			li_index = This.tab_1.tabpage_image.uo_image.tab_view.Selectedtab
			This.tab_1.tabpage_image.uo_image.tab_view.trigger Event SelectionChanged(li_index,li_index)
		End If		
		//---------------------------- APPEON END ----------------------------
		*/
		//-------------End Modified ------------------------------------------
	ELSEIF tab_1.SelectedTab = 8 THEN
		If w_mdi.menuname <> 'm_pfe_cst_privileges' Then w_mdi.ChangeMenu( m_pfe_cst_privileges )
	ELSEIF tab_1.SelectedTab = 9 THEN
		If w_mdi.menuname <> 'm_pfe_cst_net_dev' Then w_mdi.ChangeMenu( m_pfe_cst_net_dev )
	ELSEIF tab_1.SelectedTab = 10 THEN		
		If w_mdi.menuname <> 'm_pfe_cst_prac_meetings' Then w_mdi.ChangeMenu( m_pfe_cst_prac_meetings )
	//---------------------------- APPEON END ----------------------------		
	END IF
END IF
w_mdi.SetToolbarPos ( 2, 1, 200, False )
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> UM-02
//$<add> 01.13.2006 By: Rodger Wu
//$<reason> The SetToolbarPos function is currently unsupported. 
//$<modification> Replace the SetToolBarPos function with the Appeon defined function of_settoolbarpos to provide
//$<modification> the same functionality.
long ll_handle
ll_handle = handle(w_mdi)
gnv_appeondll.of_settoolbarpos(ll_handle)
//---------------------------- APPEON END ----------------------------

w_mdi.of_menu_security( w_mdi.MenuName )

IF gb_se_version THEN
	of_se( )
END IF

//setredraw(true)



end event

event close;call super::close;//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 2006-11-14 By: Allen
//$<reason> Fix APB Bug: the Toolbar Icon is invalid.
/*
w_mdi.ChangeMenu(m_pfe_cst_mdi_menu)
*/
If w_mdi.menuname <> 'm_pfe_cst_mdi_menu' Then w_mdi.ChangeMenu( m_pfe_cst_mdi_menu )
//---------------------------- APPEON END ----------------------------

DESTROY inv_action_items
DESTROY inv_printletters

//w_mdi.iw_prac_cnt --

//START---Modify by Evan on 2008-03-14
//w_mdi.Post of_menu_security( w_mdi.MenuName )		//Modified by Scofield on 2007-12-19: Add Post Script
w_mdi.of_menu_security( w_mdi.MenuName )
//END---Modify by Evan on 2008-03-14

IF IsValid( w_net_dev_filter ) THEN
	Close( w_net_dev_filter )
END IF

IF IsValid( w_capture ) THEN
	Close( w_capture )
END IF

garbagecollect()
end event

event pfc_save;Integer li_retval
Long ll_rec_id

//IF tab_1.SelectedTab = 1 THEN
//	tab_1.tabpage_detail.uo_data_entry.Event pfc_cst_preupdate()
//END IF

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-09
//$<modify> 03.10.2006 By: LeiWei
//$<reason> Performance tuning
//$<modification> Have the application only check the current tab page instead
//$<modification> chekcing the whole tab control before updating the database.

/*	
li_retval =  w_main::Event pfc_save()
*/

powerobject lpo_empty[], apo_control[]

// Check all object
li_retval = This.of_updatecheck( tab_1.Control[tab_1.SelectedTab].Control, apo_control )

If li_retval > 0 Then
	// Initialize array holding the objects that need to be updated.
	ipo_tempupdateobjects = apo_control
	
	// Perform the actual update(s).
	li_retval = Super::Event pfc_save()
	
	// Clear array holding the objects that were just updated.
	ipo_tempupdateobjects = lpo_empty
End If

//---------------------------- APPEON END ----------------------------

IF li_retval < 0 THEN
	RETURN -1
END IF
IF li_retval = 1 AND ib_new_prac THEN
	IF tab_1.tabpage_apptmnt_status.uo_affill_status.of_get_rowcount() = 0 THEN
		IF gs_cust_type = 'I' THEN
			ll_rec_id = gnv_app.of_Get_Id("RECORD_ID")
			INSERT INTO pd_affil_stat  
         	( rec_id,   
	           prac_id,   
				  seq_no,
   	        affiliation_status,   
      	     parent_facility_id,   
         	  apptmnt_type,   
	           verifying_facility,   
   	        application_audit_facility,
				  active_status)  
			VALUES ( :ll_rec_id,   
         	  :il_prac_id,   
				  1,
 	           'M',   
   	        1,   
      	     'I',   
         	  1,   
	           1,
				  1)  ;
			IF SQLCA.SQLCODE = -1 THEN
				MessageBox("SQL Error", SQLCA.SQLERRTEXT )
				Return -1
			END IF
			of_app_audit( ll_rec_id )
			ii_parent_facility_id = 1
			tab_1.tabpage_detail.uo_data_entry.of_set_parent_facility_id( ii_parent_facility_id )
			ib_new_prac = False
			//Start Code Change ----03.30.2006 #362 maha
			of_new_prac( "pfc_save")
			//End Code Change---03.30.2006
		ELSE
			tab_1.SelectTab( 4 )
			tab_1.tabpage_apptmnt_status.uo_affill_status.of_new_record( il_prac_id )
			tab_1.tabpage_apptmnt_status.uo_affill_status.of_set_new_prac( True )
		END IF
	END IF
	//Return -99
END IF

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-10
//$<modify> 04.12.2006 By: LeiWei
//$<reason> Performance tuning
//$<modification> The following script is moved to tab_1.selectionchanged since
//$<modification> CreateOnDemand is checked.
//tab_1.tabpage_verif.uo_verif_summary.of_get_this_facility_data( ) 
IF tab_1.SelectedTab = 5 Then
	tab_1.tabpage_verif.uo_verif_summary.of_get_this_facility_data( )
Else
	ib_page5_refresh = true
End If
//---------------------------- APPEON END ----------------------------

Tab_1.tabpage_detail.uo_data_entry.of_btt_address_link_button()

Return li_retval
end event

event closequery;//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-11
//$<add> 04.13.2006 By: LeiWei
//$<reason> Performance tuning
//$<modification> Have the application only check the data need to be updated to the database
//$<modification> before w_prac_data_1 is closed.
powerobject lpo_updatearray[]
lpo_updatearray = ipo_updateobjects
ipo_updateobjects = tab_1.Control[tab_1.SelectedTab].Control
CALL SUPER::closequery
ipo_updateobjects = lpo_updatearray
//---------------------------- APPEON END ----------------------------

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 10.12.2006 By: Jack (Inova)
//$<reason> Queue Images for Scanning from Data Entry.
if of_validate_image() = 1 then return 1
//---------------------------- APPEON END ----------------------------


IF tab_1.tabpage_apptmnt_status.uo_affill_status.of_blank_record() THEN
	tab_1.SelectTab( 4 )
	MessageBox("Required Data", "Fill in required Appointment Status data before continuing")
	Return 1
END IF
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-12
//$<modify> 02.13.2006 By: Cao Yongwang
//$<reason> Performance tuning.
//$<modification> Since CreateOnDemand is checked for tab_1, copy 
//$<modification> tab_1.tabpage_apptmnt_status.uo_affill_status.of_is_de_complete()
//$<modification> here and rewrite it.
/*
IF tab_1.tabpage_apptmnt_status.uo_affill_status.of_is_de_complete() = 0 AND gl_prac_id <> 0 THEN
*/
IF of_is_de_complete() = 0 AND gl_prac_id <> 0 THEN
//---------------------------- APPEON END ----------------------------
	Integer li_ans 	
	li_ans = MessageBox("Warning!", "You are closing without pressing the D/E Complete button, Are you sure you want to Continue?", Question!, YesNo!, 2 )
	IF li_ans = 2 THEN
		Return 1
	END IF
END IF

end event

event pfc_postopen;Integer li_app_audit_cnt  
Integer li_committee_cnt
integer li_meet //maha 100402

window lw
lw = this

IF gb_se_version THEN
	of_se( )
END IF
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-13
//$<modify> 01.23.2006 By: Cao YongWang
//$<reason> Performance tuning
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

//SELECT Count( app_audit_id )  
//INTO :li_app_audit_cnt  
//FROM data_view_app_audit  ;
//IF li_app_audit_cnt = 0 THEN
//	MessageBox( "Application Audit", "You do not have any Application Audit templates setup.  To setup an Application Audit goto the System->Painters->Application Audit Painter. ", StopSign!)
//	Close( This )
//	Return
//END IF
//
//
//SELECT Count( committee_id )  
//INTO :li_committee_cnt  
//FROM committee_lookup  ;
//IF li_committee_cnt = 0 THEN
//	MessageBox( "Committee", "You do not have any credentialing committee's setup.  To setup a Credentialing Committee goto the Facility Painter.", StopSign!)
//	Close( This )
//	Return
//END IF
//Start queue label
gnv_appeondb.of_startqueue()
SELECT Count( app_audit_id )  
INTO :li_app_audit_cnt  
FROM data_view_app_audit  ;

SELECT Count( committee_id )  
INTO :li_committee_cnt  
FROM committee_lookup  ;
gnv_appeondb.of_commitqueue()

IF li_app_audit_cnt = 0 THEN
	MessageBox( "Application Audit", "You do not have any Application Audit templates setup.  To setup an Application Audit goto the System->Painters->Application Audit Painter. ", StopSign!)
	Close( This )
	Return
END IF


IF li_committee_cnt = 0 THEN
	MessageBox( "Committee", "You do not have any credentialing committee's setup.  To setup a Credentialing Committee goto the Facility Painter.", StopSign!)
	Close( This )
	Return
END IF
//---------------------------- APPEON END ----------------------------

//gl_prac_id = 0

tab_1.tabpage_search.uo_search.cb_close.Visible = False
tab_1.tabpage_search.uo_search.of_set_open_for( "DATAENTRY" )
tab_1.tabpage_search.uo_search.of_set_transaction( SQLCA )
// mskinner 30 march 2005 -- begin
tab_1.tabpage_search.uo_search.of_set_parent( lw)
// mskinner 30 march 2005 -- end
String ls_version

//check to see if security is installed, if it is not then give access to new view
//ls_version = ProfileString(gs_IniFilePathName, "setup", "version", "None")
ls_version = 'EE448738514625'
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-14
//$<modify> 01.17.2006 By: Cao YongWang
//$<reason> There is no need for the Web application to read the local INI file. The Web application
//$<reason> reads INI file from the server.
//$<modification> Make the condition to ensure when the IntelliCred is running on the Web, it does not
//$<modification> reads the local INI file.

//IF NOT FileExists(gs_dir_path + gs_DefDirName + "\intellicred.ini" ) THEN
//	MessageBox("ini File Error", "No intellicred.ini file found at: " + gs_dir_path + gs_DefDirName + "\intellicred.ini" )
////	Return -1
//END IF
If appeongetclienttype() = 'PB' Then
	IF NOT FileExists(gs_IniFilePathName) THEN
		MessageBox("ini File Error", "No intellicred.ini file found at: " + gs_IniFilePathName )
	//	Return -1
	END IF
End If
//---------------------------- APPEON END ----------------------------

//IF ls_version = "None" THEN
//	MessageBox("Error", "Version number not setup.")
////	RETURN -1
//END IF

//site survey
//IF MID( ls_version, 9, 1) = "5" THEN
//	tab_1.tabpage_site.visible = True
//ELSE
//	tab_1.tabpage_site.visible = False
//END IF

//app audit
//IF MID( ls_version, 11, 1) = "4" THEN
//	tab_1.tabpage_app_audit.Visible = True
//ELSE
//	tab_1.tabpage_app_audit.Visible = False
//END IF
tab_1.tabpage_app_audit.Visible = True

// mskinner 30 march 2005 -- begin
w_mdi.of_prac_folder_security(lw)
// mskinner 30 march 2005 -- end
//if data entry access off then select app audit tab 
IF tab_1.tabpage_detail.Visible = False AND +&
	tab_1.tabpage_app_audit.Visible = True THEN 
	tab_1.MoveTab( 2, 0 )	
ELSEIF tab_1.tabpage_detail.Visible = False AND +&
	tab_1.tabpage_app_audit.Visible = False AND +&
	tab_1.tabpage_apptmnt_status.Visible = True THEN 
	tab_1.MoveTab( 2, 0 )	
	tab_1.MoveTab( 2, 0 )	
ELSEIF tab_1.tabpage_detail.Visible = False AND +&
	tab_1.tabpage_app_audit.Visible = False AND +&
	tab_1.tabpage_apptmnt_status.Visible = False AND +& 
	tab_1.tabpage_verif.Visible = True THEN 
	tab_1.MoveTab( 2, 0 )	
	tab_1.MoveTab( 2, 0 )	
	tab_1.MoveTab( 2, 0 )	
END IF

//select set_meetings into :li_meet from icred_settings; //maha100402
li_meet = of_get_app_setting("set_meetings","I")
if li_meet = 0 then
	tab_1.tabpage_meetings.visible = false
end if


GarbageCollect ( )

//tab_1.tabpage_apptmnt_status.uo_affill_status.of_is_de_complete() moved to of_retrieve_prac

if  gs_cust_type <> "I" then
	//tab_1.tabpage_net.uo_net.cb_1.visible = false
	//tab_1.tabpage_net.uo_net.p_1.visible = false
	//tab_1.tabpage_net.uo_net.dw_orgs_facilities.height = 1672
end if
//Added by Nova on 2008-08-13
if ib_auto_locate then of_dashboard(str_para.data_name,str_para.data_id,str_para.data_ext_id)
//Start Code Change ----09.10.2008 #V85 maha
inv_action_items =  CREATE pfc_n_cst_ai_action_items
//Start Code Change ----09.30.2008 #V85 maha
inv_printletters =  CREATE pfc_n_cst_ai_printletters



end event

event pfc_postupdate;call super::pfc_postupdate;IF ib_new_prac THEN
	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> PT-15
	//$<add> 03.22.2006 By: LeiWei
	//$<reason> Performance tuning
	//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

	Integer li_parent_facility_id
	li_parent_facility_id = tab_1.tabpage_detail.uo_data_entry.of_get_parent_facility_id()

	gnv_appeondb.of_startqueue( )

	//retrieve the facility name. The facility name will be used in the of_Setup_title function.
	SELECT facility.facility_name  
	INTO :is_facility_name  
	FROM facility  
	WHERE facility.facility_id = :li_parent_facility_id   ;
	
	//Retrieve the full name. The full name will be used in the of_setup_title function
	SELECT v_full_name.full_name
	INTO :is_full_name  
	FROM v_full_name  
	WHERE v_full_name.prac_id = :il_prac_id   ;
	
	//Added for Work flow. Get the related work flow for new practitioner added in IntelliApp. 10/30/2006 Henry
	If of_get_app_setting('set_9' , 'I') = 1 Then
		SELECT facility.facility_name, wf_new_practitioner  
		INTO :is_facility_name  , :ii_wf_new_practitioner
		FROM facility  
		WHERE facility.facility_id = 1   ;
		li_parent_facility_id = 1
	End if
	//End added for Work flow. 10/30/2006 Henry
	
	gnv_appeondb.of_commitqueue( )
	//---------------------------- APPEON END ----------------------------

	//Added for Work flow. trigger off the related work flow for practitioner added. 10/30/2006 Henry
	If of_get_app_setting('set_9' , 'I') = 1 and  gb_workflow  Then
		If not isnull(ii_wf_new_practitioner) and ii_wf_new_practitioner > 0 Then
			n_cst_workflow_triggers lnv_workflow
			lnv_workflow = create n_cst_workflow_triggers
			//--------------------------- APPEON BEGIN ---------------------------
			//$<modify> 11.17.2006 By: Jervis
			//$<reason> 
			//lnv_workflow.of_workflow_create_action_items( il_prac_id, il_rec_id, 1, li_parent_facility_id, ii_wf_new_practitioner)
			str_action_item lstr_action
			lstr_action.prac_id = il_prac_id
			lstr_action.rec_id = il_rec_id
			lstr_action.facility_id = li_parent_facility_id
			lstr_action.screen_id = -10
			lstr_action.wf_id =ii_wf_new_practitioner
			lnv_workflow.of_workflow_create_action_items(lstr_action)
			destroy lnv_workflow
			//---------------------------- APPEON END ----------------------------
		End if
	End If
	//End added for Work flow. 10/30/2006 Henry
	
	of_setup_title()
END IF


//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-16
//$<modify> 04.04.2006 By: LeiWei
//$<reason> Performance tuning
//$<modification> Add a condition to have the application only refresh the data
//$<modification> in the tab page only when it is selected.
/*
IF tab_1.SelectedTab <> 2 THEN
	tab_1.tabpage_verif.uo_verif_summary.of_post_update()
END IF

IF tab_1.SelectedTab <> 2 THEN
	uo_app_stat.of_get_status( il_prac_id, tab_1.tabpage_detail.uo_data_entry.of_get_parent_facility_id() )
	tab_1.tabpage_apptmnt_status.uo_affill_status.of_retrieve_detail()	
END IF
*/

IF tab_1.SelectedTab <> 2 THEN
	tab_1.tabpage_verif.uo_verif_summary.of_post_update()

	IF tab_1.SelectedTab = 3 OR tab_1.SelectedTab = 5 THEN
		uo_app_stat.of_get_status( il_prac_id, tab_1.tabpage_detail.uo_data_entry.of_get_parent_facility_id() )
	END IF
	
	IF tab_1.SelectedTab <> 4 THEN ib_page4_refresh = true
END IF
//---------------------------- APPEON END ----------------------------

//IF tab_1.SelectedTab = 7 THEN
//	tab_1.tabpage_site.uo_survey.of_Retrieve()
//END IF

RETURN 1
end event

event open;call super::open;
//Added by Nova on 2008-08-13
If Isvalid(message.powerobjectparm) Then
	If message.powerobjectparm.classname() = 'str_dashboard' Then
		str_para=message.powerobjectparm
		ib_auto_locate = True
	End If
End If
///////////////////////////////////////////////////////////////////
// mbs moved code to the post open event so that the window will open
// faster
// 13 Jan 2005
///////////////////////////////////////////////////////////////////

//Integer li_app_audit_cnt  
//Integer li_committee_cnt
//integer li_meet //maha 100402
//
//IF gb_se_version THEN
//	of_se( )
//END IF
//
//SELECT Count( app_audit_id )  
//INTO :li_app_audit_cnt  
//FROM data_view_app_audit  ;
//IF li_app_audit_cnt = 0 THEN
//	MessageBox( "Application Audit", "You do not have any Application Audit templates setup.  To setup an Application Audit goto the System->Painters->Application Audit Painter. ", StopSign!)
//	Close( This )
//	Return
//END IF
//
//
//SELECT Count( committee_id )  
//INTO :li_committee_cnt  
//FROM committee_lookup  ;
//IF li_committee_cnt = 0 THEN
//	MessageBox( "Committee", "You do not have any credentialing committee's setup.  To setup a Credentialing Committee goto the Facility Painter.", StopSign!)
//	Close( This )
//	Return
//END IF
//
gl_prac_id = 0 //readded maha 041805
//
//tab_1.tabpage_search.uo_search.cb_close.Visible = False
//tab_1.tabpage_search.uo_search.of_set_open_for( "DATAENTRY" )
//tab_1.tabpage_search.uo_search.of_set_transaction( SQLCA )
//tab_1.tabpage_search.uo_search.of_set_parent( This )
//
//String ls_version
//
////check to see if security is installed, if it is not then give access to new view
//ls_version = ProfileString(gs_dir_path + gs_DefDirName + "\intellicred.ini", "setup", "version", "None")
//IF NOT FileExists(gs_dir_path + gs_DefDirName + "\intellicred.ini" ) THEN
//	MessageBox("ini File Error", "No intellicred.ini file found at: " + gs_dir_path + gs_DefDirName + "\intellicred.ini" )
//	Return -1
//END IF
//
//IF ls_version = "None" THEN
//	MessageBox("Error", "Version number not setup.")
//	RETURN -1
//END IF
//
////site survey
////IF MID( ls_version, 9, 1) = "5" THEN
////	tab_1.tabpage_site.visible = True
////ELSE
////	tab_1.tabpage_site.visible = False
////END IF
//
////app audit
//IF MID( ls_version, 11, 1) = "4" THEN
//	tab_1.tabpage_app_audit.Visible = True
//ELSE
//	tab_1.tabpage_app_audit.Visible = False
//END IF
//
//w_mdi.of_prac_folder_security( This )
//
////if data entry access off then select app audit tab 
//IF tab_1.tabpage_detail.Visible = False AND +&
//	tab_1.tabpage_app_audit.Visible = True THEN 
//	tab_1.MoveTab( 2, 0 )	
//ELSEIF tab_1.tabpage_detail.Visible = False AND +&
//	tab_1.tabpage_app_audit.Visible = False AND +&
//	tab_1.tabpage_apptmnt_status.Visible = True THEN 
//	tab_1.MoveTab( 2, 0 )	
//	tab_1.MoveTab( 2, 0 )	
//ELSEIF tab_1.tabpage_detail.Visible = False AND +&
//	tab_1.tabpage_app_audit.Visible = False AND +&
//	tab_1.tabpage_apptmnt_status.Visible = False AND +& 
//	tab_1.tabpage_verif.Visible = True THEN 
//	tab_1.MoveTab( 2, 0 )	
//	tab_1.MoveTab( 2, 0 )	
//	tab_1.MoveTab( 2, 0 )	
//END IF
//
////select set_meetings into :li_meet from icred_settings; //maha100402
//li_meet = of_get_app_setting("set_meetings","I")
//if li_meet = 0 then
//	tab_1.tabpage_meetings.visible = false
//end if
//
//
//GarbageCollect ( )
end event

event pfc_preopen;call super::pfc_preopen;
LONG LL_I
string ls_scale
move(0,0)
powerobject lo_powerobjects[]

this.of_SetResize(TRUE)

this.inv_resize.of_SetOrigSize (this.workspacewidth( ) ,  this.workspaceheight( ) )

il_oriWidth = this.workspacewidth( )
il_oriHeight = this.workspaceheight( )

ls_scale = this.inv_resize.scale


FOR LL_I =  1 TO UPPERBOUND(this.CONTrol)
   this.inv_resize.of_Register (this.CONTrol[LL_I]  , ls_scale	 )
NEXT

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-17
//$<add> 01.18.2006 By: Cao YongWang
//$<reason> Performance tuning. 
//$<modification> Add a condition to ensure that inv_resize will not be executed, since
//$<modification> the execution of inv_resize negatively affects the performance very much
If appeongetclienttype() = 'WEB' and gb_autoresize = false Then return
//---------------------------- APPEON END ----------------------------

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// The search user object
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

this.inv_resize.of_Register (this.tab_1.tabpage_search.uo_search, ls_scale  )

FOR LL_I =  1 TO UPPERBOUND(this.tab_1.tabpage_search.uo_search.CONTrol)
   this.inv_resize.of_Register (this.tab_1.tabpage_search.uo_search.CONTrol[LL_I]  , ls_scale )
next

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// The search uo_data_entry
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

this.inv_resize.of_Register (this.tab_1.tabpage_detail.uo_data_entry, ls_scale  )

FOR LL_I =  1 TO UPPERBOUND(this.tab_1.tabpage_detail.uo_data_entry.CONTrol)
   this.inv_resize.of_Register (this.tab_1.tabpage_detail.uo_data_entry.CONTrol[LL_I]  , ls_scale )
next

FOR LL_I =  1 TO UPPERBOUND(this.tab_1.tabpage_detail.uo_data_entry.tab_view.tabpage_browse.CONTrol)
   this.inv_resize.of_Register (this.tab_1.tabpage_detail.uo_data_entry.tab_view.tabpage_browse.CONTrol[LL_I]  , ls_scale )
next

FOR LL_I =  1 TO UPPERBOUND(this.tab_1.tabpage_detail.uo_data_entry.tab_view.tabpage_details.CONTrol)
   this.inv_resize.of_Register (this.tab_1.tabpage_detail.uo_data_entry.tab_view.tabpage_details.CONTrol[LL_I]  , ls_scale )
next
FOR LL_I =  1 TO UPPERBOUND(this.tab_1.tabpage_detail.uo_data_entry.tab_view.tabpage_image.CONTrol)
   this.inv_resize.of_Register (this.tab_1.tabpage_detail.uo_data_entry.tab_view.tabpage_image.CONTrol[LL_I]  , ls_scale )
next

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// The search uo_app_audit
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

this.inv_resize.of_Register (this.tab_1.tabpage_app_audit.uo_app_audit , ls_scale  )

FOR LL_I =  1 TO UPPERBOUND(this.tab_1.tabpage_app_audit.uo_app_audit.CONTrol)
   this.inv_resize.of_Register (this.tab_1.tabpage_app_audit.uo_app_audit.CONTrol[LL_I]  , ls_scale )
next

FOR LL_I =  1 TO UPPERBOUND(this.tab_1.tabpage_app_audit.uo_app_audit.tab_view.tabpage_browse.CONTrol)
   this.inv_resize.of_Register (this.tab_1.tabpage_app_audit.uo_app_audit.tab_view.tabpage_browse.CONTrol[LL_I]  , ls_scale )
next

FOR LL_I =  1 TO UPPERBOUND(this.tab_1.tabpage_app_audit.uo_app_audit.tab_view.tabpage_detail.CONTrol)
   this.inv_resize.of_Register (this.tab_1.tabpage_app_audit.uo_app_audit.tab_view.tabpage_detail.CONTrol[LL_I]  , ls_scale )
next


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// The search uo_affill_status
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

this.inv_resize.of_Register (this.tab_1.tabpage_apptmnt_status.uo_affill_status , ls_scale  )

FOR LL_I =  1 TO UPPERBOUND(this.tab_1.tabpage_apptmnt_status.uo_affill_status.CONTrol)
   this.inv_resize.of_Register (this.tab_1.tabpage_apptmnt_status.uo_affill_status.CONTrol[LL_I]  , ls_scale )
next

FOR LL_I =  1 TO UPPERBOUND(this.tab_1.tabpage_apptmnt_status.uo_affill_status.tab_view.tabpage_browse.CONTrol)
   this.inv_resize.of_Register (this.tab_1.tabpage_apptmnt_status.uo_affill_status.tab_view.tabpage_browse.CONTrol[LL_I]  , ls_scale )
next

FOR LL_I =  1 TO UPPERBOUND(this.tab_1.tabpage_apptmnt_status.uo_affill_status.tab_view.tabpage_detail_1.CONTrol)
   this.inv_resize.of_Register (this.tab_1.tabpage_apptmnt_status.uo_affill_status.tab_view.tabpage_detail_1.CONTrol[LL_I]  , ls_scale )
next

FOR LL_I =  1 TO UPPERBOUND(this.tab_1.tabpage_apptmnt_status.uo_affill_status.tab_view.tabpage_detail_2.CONTrol)
   this.inv_resize.of_Register (this.tab_1.tabpage_apptmnt_status.uo_affill_status.tab_view.tabpage_detail_2.CONTrol[LL_I]  , ls_scale )
next


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// The search tabpage_image
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

this.inv_resize.of_Register (this.tab_1.tabpage_image.uo_image , ls_scale  )

FOR LL_I =  1 TO UPPERBOUND(this.tab_1.tabpage_image.uo_image.CONTrol)
   this.inv_resize.of_Register (this.tab_1.tabpage_image.uo_image.CONTrol[LL_I]  , ls_scale )
next


FOR LL_I =  1 TO UPPERBOUND(this.tab_1.tabpage_image.uo_image.TAB_view.TABpage_browse.CONTrol)
   this.inv_resize.of_Register (this.tab_1.tabpage_image.uo_image.TAB_view.TABpage_browse.CONTrol[LL_I]  , ls_scale )
next

FOR LL_I =  1 TO UPPERBOUND(this.tab_1.tabpage_image.uo_image.TAB_view.TABpage_image.CONTrol)
   this.inv_resize.of_Register (this.tab_1.tabpage_image.uo_image.TAB_view.TABpage_image.CONTrol[LL_I]  , ls_scale )
next


FOR LL_I =  1 TO UPPERBOUND(this.tab_1.tabpage_image.uo_image.TAB_view.TABpage_setup.CONTrol)
   this.inv_resize.of_Register (this.tab_1.tabpage_image.uo_image.TAB_view.TABpage_setup.CONTrol[LL_I]  , ls_scale )
next


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// The search uo_meetings
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

this.inv_resize.of_Register (this.tab_1.tabpage_meetings.uo_meetings , ls_scale  )

FOR LL_I =  1 TO UPPERBOUND(this.tab_1.tabpage_meetings.uo_meetings.CONTrol)
   this.inv_resize.of_Register (this.tab_1.tabpage_meetings.uo_meetings.CONTrol[LL_I]  , ls_scale )
next


FOR LL_I =  1 TO UPPERBOUND(this.tab_1.tabpage_meetings.uo_meetings.TAB_view.TABPage_browse.CONTrol)
   this.inv_resize.of_Register (this.tab_1.tabpage_meetings.uo_meetings.TAB_view.TABPage_browse.CONTrol[LL_I]  , ls_scale )
next

FOR LL_I =  1 TO UPPERBOUND(this.tab_1.tabpage_meetings.uo_meetings.TAB_view.TABPage_detail.CONTrol)
   this.inv_resize.of_Register (this.tab_1.tabpage_meetings.uo_meetings.TAB_view.TABPage_detail.CONTrol[LL_I]  , ls_scale )
next


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// The search tabpage_net
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

this.inv_resize.of_Register (this.tab_1.tabpage_net.uo_net , ls_scale  )

FOR LL_I =  1 TO UPPERBOUND(this.tab_1.tabpage_net.uo_net.CONTrol)
   this.inv_resize.of_Register (this.tab_1.tabpage_net.uo_net.CONTrol[LL_I]  , ls_scale )
next

FOR LL_I =  1 TO UPPERBOUND(this.tab_1.tabpage_net.uo_net.TAB_1.TABPage_ai.CONTrol)
   this.inv_resize.of_Register (this.tab_1.tabpage_net.uo_net.TAB_1.TABPage_ai.CONTrol[LL_I]  , ls_scale )
next

FOR LL_I =  1 TO UPPERBOUND(this.tab_1.tabpage_net.uo_net.TAB_1.TABpage_ids.CONTrol)
   this.inv_resize.of_Register (this.tab_1.tabpage_net.uo_net.TAB_1.TABpage_ids.CONTrol[LL_I]  , ls_scale )
next 

FOR LL_I =  1 TO UPPERBOUND(this.tab_1.tabpage_net.uo_net.TAB_1.TABPage_notes.CONTrol)
   this.inv_resize.of_Register (this.tab_1.tabpage_net.uo_net.TAB_1.TABPage_notes.CONTrol[LL_I]  , ls_scale )
next 

FOR LL_I =  1 TO UPPERBOUND(this.tab_1.tabpage_net.uo_net.TAB_1.tabpage_report.CONTrol)
   this.inv_resize.of_Register (this.tab_1.tabpage_net.uo_net.TAB_1.tabpage_report.CONTrol[LL_I]  , ls_scale )
next


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// The search tabpage_privileges
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

this.inv_resize.of_Register (this.tab_1.tabpage_privileges.uo_priv , ls_scale  )

FOR LL_I =  1 TO UPPERBOUND(this.tab_1.tabpage_privileges.uo_priv.CONTrol)
   this.inv_resize.of_Register (this.tab_1.tabpage_privileges.uo_priv.CONTrol[LL_I]  , ls_scale )
next

FOR LL_I =  1 TO UPPERBOUND(this.tab_1.tabpage_privileges.uo_priv.tab_1.tabpage_browse.CONTrol)
   this.inv_resize.of_Register (this.tab_1.tabpage_privileges.uo_priv.tab_1.tabpage_browse.CONTrol[LL_I]  , ls_scale )
next

FOR LL_I =  1 TO UPPERBOUND(this.tab_1.tabpage_privileges.uo_priv.tab_1.tabpage_detail .CONTrol)
   this.inv_resize.of_Register (this.tab_1.tabpage_privileges.uo_priv.tab_1.tabpage_detail.CONTrol[LL_I]  , ls_scale )
next

FOR LL_I =  1 TO UPPERBOUND(this.tab_1.tabpage_privileges.uo_priv.tab_1.tabpage_exp_priv .CONTrol)
   this.inv_resize.of_Register (this.tab_1.tabpage_privileges.uo_priv.tab_1.tabpage_exp_priv.CONTrol[LL_I]  , ls_scale )
next

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// The search tabpage_profile
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

this.inv_resize.of_Register (this.tab_1.tabpage_profile.uo_profile , ls_scale  )

FOR LL_I =  1 TO UPPERBOUND(this.tab_1.tabpage_profile.uo_profile .CONTrol)
   this.inv_resize.of_Register (this.tab_1.tabpage_profile.uo_profile.CONTrol[LL_I]  , ls_scale )
next


FOR LL_I =  1 TO UPPERBOUND(this.tab_1.tabpage_profile.uo_profile.tab_report.tabpage_profile .CONTrol)
   this.inv_resize.of_Register (this.tab_1.tabpage_profile.uo_profile.tab_report.tabpage_profile.CONTrol[LL_I]  , ls_scale )
next


FOR LL_I =  1 TO UPPERBOUND(this.tab_1.tabpage_profile.uo_profile.tab_report.tabpage_verification .CONTrol)
   this.inv_resize.of_Register (this.tab_1.tabpage_profile.uo_profile.tab_report.tabpage_verification.CONTrol[LL_I]  , ls_scale )
next


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// The search tabpage_verif
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

this.inv_resize.of_Register (this.tab_1.tabpage_verif.uo_verif_summary , ls_scale  )

FOR LL_I =  1 TO UPPERBOUND(this.tab_1.tabpage_verif.uo_verif_summary .CONTrol)
   this.inv_resize.of_Register (this.tab_1.tabpage_verif.uo_verif_summary.CONTrol[LL_I]  , ls_scale )
next

FOR LL_I =  1 TO UPPERBOUND(this.tab_1.tabpage_verif.uo_verif_summary.tab_view.tabpage_browse .CONTrol)
   this.inv_resize.of_Register (this.tab_1.tabpage_verif.uo_verif_summary.tab_view.tabpage_browse.CONTrol[LL_I]  , ls_scale )
next


FOR LL_I =  1 TO UPPERBOUND(this.tab_1.tabpage_verif.uo_verif_summary.tab_view.tabpage_detail .CONTrol)
   this.inv_resize.of_Register (this.tab_1.tabpage_verif.uo_verif_summary.tab_view.tabpage_detail.CONTrol[LL_I]  , ls_scale )
next

FOR LL_I =  1 TO UPPERBOUND(this.tab_1.tabpage_verif.uo_verif_summary.tab_view.tabpage_recred .CONTrol)
   this.inv_resize.of_Register (this.tab_1.tabpage_verif.uo_verif_summary.tab_view.tabpage_recred.CONTrol[LL_I]  , ls_scale )
next


end event

event pfc_endtran;
IF ai_update_results = 1 THEN
	IF tab_1.SelectedTab <> 4 THEN
		COMMIT USING SQLCA;
	END IF
END IF

RETURN 1


end event

type uo_app_stat from pfc_cst_u_app_status within w_prac_data_1
event destroy ( )
integer x = 2162
integer y = 1724
integer width = 795
integer height = 76
integer taborder = 20
boolean bringtotop = true
boolean border = false
long backcolor = 79741120
end type

on uo_app_stat.destroy
call pfc_cst_u_app_status::destroy
end on

type tab_1 from tab within w_prac_data_1
event pfc_cst_after_select ( )
event pfc_cst_post_open ( )
event create ( )
event destroy ( )
event type integer ue_selectionchanging ( integer oldindex,  integer newindex )
integer width = 3607
integer height = 1844
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 80269524
boolean fixedwidth = true
boolean raggedright = true
boolean powertips = true
boolean createondemand = true
alignment alignment = center!
integer selectedtab = 1
tabpage_search tabpage_search
tabpage_detail tabpage_detail
tabpage_app_audit tabpage_app_audit
tabpage_apptmnt_status tabpage_apptmnt_status
tabpage_verif tabpage_verif
tabpage_profile tabpage_profile
tabpage_image tabpage_image
tabpage_privileges tabpage_privileges
tabpage_net tabpage_net
tabpage_meetings tabpage_meetings
end type

event pfc_cst_after_select();//--------------------------- APPEON BEGIN ---------------------------
//$<add> 05/13/2008 By: Ken.Guo
//$<reason> Fix Issue from Mike.
//$When the program moves to that tab the focus is not on 
//$that tab but still on the Data entry tab
Long li_index1
Long li_index2
li_index1 = This.SelectedTab
Choose Case li_index1
	Case	3	//Application Audit
		tab_1.tabpage_app_audit.uo_app_audit.dw_detail.Post SetFocus()	
	Case	4	//Appointment Status
		li_index2 = tab_1.tabpage_apptmnt_status.uo_affill_status.tab_view.SelectedTab
		Choose Case li_index2
			Case	1
				tab_1.tabpage_apptmnt_status.uo_affill_status.tab_view.tabpage_browse.dw_browse.Post SetFocus()
			Case	2
				tab_1.tabpage_apptmnt_status.uo_affill_status.tab_view.tabpage_detail_1.dw_apptmnt_status.Post SetFocus()
			Case	3
				tab_1.tabpage_apptmnt_status.uo_affill_status.tab_view.tabpage_detail_2.dw_staff_cat.Post SetFocus()
			Case	4
				tab_1.tabpage_apptmnt_status.uo_affill_status.tab_view.tabpage_quest.dw_quest.Post SetFocus()
		End Choose
	Case	5 //Verification
		li_index2 = tab_1.tabpage_verif.uo_verif_summary.tab_view.SelectedTab
		Choose Case li_index2
			Case	1
				tab_1.tabpage_verif.uo_verif_summary.dw_browse.Post SetFocus()
			Case	2
				tab_1.tabpage_verif.uo_verif_summary.dw_detail.Post SetFocus()
			Case	3
				tab_1.tabpage_verif.uo_verif_summary.tab_view.tabpage_recred.dw_recred_info.Post SetFocus()
		End Choose
	Case	6	//Profile
		li_index2 = tab_1.tabpage_profile.uo_profile.tab_report.SelectedTab
		Choose Case li_index2
			Case	1
				tab_1.tabpage_profile.uo_profile.tab_report.tabpage_profile.dw_profile.Post SetFocus()
			Case	2
				tab_1.tabpage_profile.uo_profile.tab_report.tabpage_verification.dw_verification.Post SetFocus()
		End Choose
	Case	7 //Imaging
		li_index2 = tab_1.tabpage_image.uo_image.tab_view.SelectedTab
		Choose Case li_index2
			Case	1
				tab_1.tabpage_image.uo_image.tab_view.tabpage_browse.dw_browse.Post SetFocus()
			Case	2
				tab_1.tabpage_image.uo_image.tab_view.tabpage_image.ole_scan_edit.Post SetFocus()
			Case	3
				tab_1.tabpage_image.uo_image.tab_view.tabpage_setup.dw_data.Post SetFocus()
		End Choose
	Case	8 //Pri
		li_index2 = tab_1.tabpage_privileges.uo_priv.tab_1.SelectedTab
		Choose Case li_index2
			Case	1
				tab_1.tabpage_privileges.uo_priv.tab_1.tabpage_browse.dw_browse.Post SetFocus()
			Case	2
				tab_1.tabpage_privileges.uo_priv.tab_1.tabpage_detail.dw_detail.Post SetFocus()
			Case	3
				tab_1.tabpage_privileges.uo_priv.tab_1.tabpage_exp_priv.dw_expired.Post SetFocus()
		End Choose
	Case	9 //Net
		li_index2 = tab_1.tabpage_net.uo_net.tab_1.SelectedTab
		Choose Case li_index2
			Case	1
				tab_1.tabpage_net.uo_net.tab_1.tabpage_ai.dw_net_dev.Post SetFocus()
			Case	2
				tab_1.tabpage_net.uo_net.tab_1.tabpage_ids.dw_ids.Post SetFocus()
			Case	3
				tab_1.tabpage_net.uo_net.tab_1.tabpage_notes.dw_notes.Post SetFocus()
			Case	4
				tab_1.tabpage_net.uo_net.tab_1.tabpage_report.dw_report_data.Post SetFocus()
		End Choose
	Case	10 //Meeting
		li_index2 = tab_1.tabpage_meetings.uo_meetings.tab_view.SelectedTab
		Choose Case li_index2
			Case	1
				tab_1.tabpage_meetings.uo_meetings.tab_view.tabpage_browse.Post SetFocus()
			Case	2
				tab_1.tabpage_meetings.uo_meetings.tab_view.tabpage_detail.dw_detail.Post SetFocus()
		End Choose
End Choose
//---------------------------- APPEON END ----------------------------

//--------------------------- APPEON BEGIN ---------------------------
//$< Add  > 2008-09-23 By: Scofield
//$<Reason> Set the ToolbarItemVisible property to true or false

if IsValid(m_pfe_cst_data_entry) then
	if li_index1 = 2 then
		m_pfe_cst_data_entry.m_file.m_importphoto.Visible = true
		gnv_app.of_modify_menu_attr( m_pfe_cst_data_entry.m_file.m_importphoto,'ToolbarItemVisible', true)
	else
		m_pfe_cst_data_entry.m_file.m_importphoto.Visible = false
		gnv_app.of_modify_menu_attr( m_pfe_cst_data_entry.m_file.m_importphoto,'ToolbarItemVisible', false)
	end if
end if
//---------------------------- APPEON END ----------------------------

end event

on tab_1.create
this.tabpage_search=create tabpage_search
this.tabpage_detail=create tabpage_detail
this.tabpage_app_audit=create tabpage_app_audit
this.tabpage_apptmnt_status=create tabpage_apptmnt_status
this.tabpage_verif=create tabpage_verif
this.tabpage_profile=create tabpage_profile
this.tabpage_image=create tabpage_image
this.tabpage_privileges=create tabpage_privileges
this.tabpage_net=create tabpage_net
this.tabpage_meetings=create tabpage_meetings
this.Control[]={this.tabpage_search,&
this.tabpage_detail,&
this.tabpage_app_audit,&
this.tabpage_apptmnt_status,&
this.tabpage_verif,&
this.tabpage_profile,&
this.tabpage_image,&
this.tabpage_privileges,&
this.tabpage_net,&
this.tabpage_meetings}
end on

on tab_1.destroy
destroy(this.tabpage_search)
destroy(this.tabpage_detail)
destroy(this.tabpage_app_audit)
destroy(this.tabpage_apptmnt_status)
destroy(this.tabpage_verif)
destroy(this.tabpage_profile)
destroy(this.tabpage_image)
destroy(this.tabpage_privileges)
destroy(this.tabpage_net)
destroy(this.tabpage_meetings)
end on

event type integer ue_selectionchanging(integer oldindex, integer newindex);Integer li_retval 

IF ib_new_prac AND oldindex = 4 THEN
	tab_1.tabpage_detail.uo_data_entry.of_set_verifying_facility( tab_1.tabpage_apptmnt_status.uo_affill_status.of_get_verifying_facility_id() )
	tab_1.tabpage_detail.uo_data_entry.of_set_parent_facility_id( tab_1.tabpage_apptmnt_status.uo_affill_status.of_get_parent_facility_id() )
	tab_1.tabpage_verif.uo_verif_summary.of_set_facility_id(tab_1.tabpage_apptmnt_status.uo_affill_status.of_get_parent_facility_id())	
	tab_1.tabpage_profile.uo_profile.of_Set_facility_Id( tab_1.tabpage_apptmnt_status.uo_affill_status.of_get_verifying_facility_id() )
	tab_1.tabpage_app_audit.uo_app_audit.of_set_parent_facility_id( tab_1.tabpage_apptmnt_status.uo_affill_status.of_get_parent_facility_id() )	
	of_get_parent_facility( tab_1.tabpage_apptmnt_status.uo_affill_status.of_get_parent_facility_id() )	
END IF


IF tab_1.tabpage_apptmnt_status.uo_affill_status.of_is_new_record() THEN
	tab_1.tabpage_app_audit.uo_app_audit.of_Set_parent_facility_Id( ii_parent_facility_id )
	tab_1.tabpage_app_audit.uo_app_audit.of_Retrieve( il_prac_id )
	tab_1.tabpage_verif.uo_verif_summary.of_Retrieve( il_prac_id )
	tab_1.tabpage_apptmnt_status.uo_affill_status.of_set_new_record( False )
END IF


IF tab_1.tabpage_apptmnt_status.uo_affill_status.of_changed_app_audit() = True THEN
	of_retrieve_app_audit()
END IF

IF newindex = 3 AND NOT ib_app_audit_retrieved THEN
	of_retrieve_app_audit()
ELSEIF newindex = 4 AND NOT ib_affil_stat_retrieved THEN
	of_retrieve_affil_stat()
	ib_page4_refresh = false	//add by 04.11.2006
ELSEIF newindex = 5 AND NOT ib_verif_info_retrieved THEN	
	of_retrieve_verif_info()
	ib_page5_refresh = false	//add by 04.11.2006
	//ELSEIF newindex = 6 AND NOT ib_site_survey_retrieved THEN	
	//	of_retrieve_site_survey()
ELSEIF newindex = 10 AND NOT ib_meetings_retrieved THEN		
	 of_retrieve_meetings()
ELSEIF newindex = 7 AND NOT ib_image_info_retrieved THEN		
	of_retrieve_images()	
//maha082200
ELSEIF newindex = 8 and not ib_priv_retrieved then
	of_retrieve_privs()	
ELSEIF newindex = 9 AND NOT ib_net_retrieved THEN
	of_retrieve_net()
END IF

IF oldindex = 6 THEN
	tab_1.tabpage_profile.uo_profile.tab_report.tabpage_verification.dw_verification.DataObject = ""
	tab_1.tabpage_profile.uo_profile.tab_report.tabpage_profile.dw_profile.DataObject = ""	
END IF


IF oldindex = 9 AND IsValid( w_net_dev_filter ) THEN
	Close( w_net_dev_filter )
END IF

//This.SetRedraw( True )

//This.PostEvent( "pfc_cst_after_select" )

ib_win_just_opened  = False

return 0
end event

event selectionchanging;Integer li_retval 
PowerObject apo_control_update[]

//This.SetRedraw( False )
ChangeDirectory(Gs_Current_Directory)//Added By Ken.Guo 06.17.2008. For picture object using picture file in current directory.
if this.tabpage_search.uo_search.dw_search.rowcount() > 0 then
	//--------------------------- APPEON BEGIN ---------------------------
	//$<add> 10.12.2006 By: Jack (Inova)
	//$<reason> Queue Images for Scanning from Data Entry.
	if newindex = 1 THEN
		if of_validate_image() = 1 then return 1
	end if
	//---------------------------- APPEON END ----------------------------

// mskinner 17 jan 2005 - begin
	//if not(ib_new_prac) and  oldindex = 1 AND  (gl_prac_id <> this.tabpage_search.uo_search.dw_search.object.PRAC_ID[this.tabpage_search.uo_search.dw_search.GETROW()] ) THEN 
	//Start Code Change ---- 10.03.2006 #632 maha
	if not(ib_new_prac) and  oldindex = 1 AND not(ib_from_ssn) and (gl_prac_id <> this.tabpage_search.uo_search.dw_search.object.PRAC_ID[this.tabpage_search.uo_search.dw_search.GETROW()] ) THEN 
   ib_tab_seleted = true
	this.tabpage_search.uo_search.of_select_prac( this.tabpage_search.uo_search.dw_search.getrow() )
	
	
END IF 
// mskinner 17 jan 2005 - end

end if 
ib_from_ssn = false
//End Code Change---10.03.2006


IF tab_1.tabpage_detail.uo_data_entry.of_get_row_count_detail() = 0 THEN
	//This.SetRedraw(TRUE)
	Return 0
END IF

IF NOT ib_win_just_opened AND oldindex <> 1 THEN
	li_retval = Parent.Event pfc_save()
	
	IF li_retval < 0 THEN
		//This.SetRedraw(TRUE)
		Return 1
	ELSEIF li_retval = 0 AND tab_1.tabpage_detail.uo_data_entry.of_get_row_selector() = 1 AND tab_1.tabpage_detail.uo_data_entry.of_is_prac_id_null() AND newindex > 3 THEN
		MessageBox("Missing Data", "You must first complete basic information to continue.")
		//This.SetRedraw(TRUE)
		Return 1
	END IF
END IF

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-18
//$<comment> 01.23.2006 By: Cao YongWang
//$<reason> Performance tuning
//$<modification> Move the following script to ue_selectionchanging. ue_selectionchanging will be 
//$<modification> called in selectionchanged event. This change is due to usage of CreateOnDemand.

//---------------------------- APPEON END ----------------------------
/*
IF ib_new_prac AND oldindex = 4 THEN
	tab_1.tabpage_detail.uo_data_entry.of_set_verifying_facility( tab_1.tabpage_apptmnt_status.uo_affill_status.of_get_verifying_facility_id() )
	tab_1.tabpage_detail.uo_data_entry.of_set_parent_facility_id( tab_1.tabpage_apptmnt_status.uo_affill_status.of_get_parent_facility_id() )
	tab_1.tabpage_verif.uo_verif_summary.of_set_facility_id(tab_1.tabpage_apptmnt_status.uo_affill_status.of_get_parent_facility_id())	
	tab_1.tabpage_profile.uo_profile.of_Set_facility_Id( tab_1.tabpage_apptmnt_status.uo_affill_status.of_get_verifying_facility_id() )
	tab_1.tabpage_app_audit.uo_app_audit.of_set_parent_facility_id( tab_1.tabpage_apptmnt_status.uo_affill_status.of_get_parent_facility_id() )	
	of_get_parent_facility( tab_1.tabpage_apptmnt_status.uo_affill_status.of_get_parent_facility_id() )	
END IF


IF tab_1.tabpage_apptmnt_status.uo_affill_status.of_is_new_record() THEN
	tab_1.tabpage_app_audit.uo_app_audit.of_Set_parent_facility_Id( ii_parent_facility_id )
	tab_1.tabpage_app_audit.uo_app_audit.of_Retrieve( il_prac_id )
	tab_1.tabpage_verif.uo_verif_summary.of_Retrieve( il_prac_id )
	tab_1.tabpage_apptmnt_status.uo_affill_status.of_set_new_record( False )
END IF


IF tab_1.tabpage_apptmnt_status.uo_affill_status.of_changed_app_audit() = True THEN
	of_retrieve_app_audit()
END IF

IF newindex = 3 AND NOT ib_app_audit_retrieved THEN
	of_retrieve_app_audit()
ELSEIF newindex = 4 AND NOT ib_affil_stat_retrieved THEN
	of_retrieve_affil_stat()
ELSEIF newindex = 5 AND NOT ib_verif_info_retrieved THEN	
	of_retrieve_verif_info()
	//ELSEIF newindex = 6 AND NOT ib_site_survey_retrieved THEN	
	//	of_retrieve_site_survey()
ELSEIF newindex = 10 AND NOT ib_meetings_retrieved THEN		
	 of_retrieve_meetings()
ELSEIF newindex = 7 AND NOT ib_image_info_retrieved THEN		
	of_retrieve_images()	
//maha082200
ELSEIF newindex = 8 and not ib_priv_retrieved then
	of_retrieve_privs()	
ELSEIF newindex = 9 AND NOT ib_net_retrieved THEN
	of_retrieve_net()
END IF

IF oldindex = 6 THEN
	tab_1.tabpage_profile.uo_profile.tab_report.tabpage_verification.dw_verification.DataObject = ""
	tab_1.tabpage_profile.uo_profile.tab_report.tabpage_profile.dw_profile.DataObject = ""	
END IF


IF oldindex = 9 AND IsValid( w_net_dev_filter ) THEN
	Close( w_net_dev_filter )
END IF

This.SetRedraw( True )


This.PostEvent( "pfc_cst_after_select" )



ib_win_just_opened  = False

*/

end event

event selectionchanged;integer set_ck //maha 111802
integer li_index //alfee 10.13.2008

//if oldindex = -1 or newindex = -1 then return
//setredraw(false)

IF gs_cust_type <> "I" THEN
	IF newindex = 1 OR newindex = 7 THEN
		uo_app_stat.Visible = False
	ELSE
		uo_app_stat.Visible = True
	END IF
END IF
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-19
//$<modify> 02.17.2006 By: Cao YongWang
//$<reason> Performance tuning.
//$<modification> The following script is moved from the SelectoinChanging event.
//$<modification> This changes is due to the usage of CreateOnDemand property.
if this.tabpage_search.uo_search.dw_search.rowcount() > 0 then
	if oldindex = 1 AND  (gl_prac_id <> -9 AND NOT ib_new_prac AND /*Added by Appeon*/ gl_prac_id <> this.tabpage_search.uo_search.dw_search.object.PRAC_ID[this.tabpage_search.uo_search.dw_search.GETROW()] ) THEN 
		ib_tab_seleted = true
		this.tabpage_search.uo_search.of_select_prac( this.tabpage_search.uo_search.dw_search.getrow() )		
	END IF 
End if 
//---------------------------- APPEON END ----------------------------

IF oldindex = 1 and newindex > 1  AND gl_prac_id = 0 THEN
	SelectTab( 1 )
	MessageBox("Invalid Selection", "You must first select a practitioner.")
	//setredraw(true)
	Return 1
END IF

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-20
//$<add> 01.18.2006 By: Cao YongWang
//$<reason> Performance tuning.
//$<modification> Set values to the variables defined by Appeon. This change
//$<modification> is due to usage of CreateOnDemand.
window lw
lw = parent

Choose Case newindex
	Case 2
		If not ib_page2_selected Then
			//of_registerresize(newindex)
			ib_page2_selected = true
		End if
	Case 3
		If not ib_page3_selected Then
			//of_registerresize(newindex)
			ib_page3_selected = true
		End if
	Case 4
		If not ib_page4_selected Then
			tab_1.tabpage_apptmnt_status.uo_affill_status.of_Reset()
			tab_1.tabpage_apptmnt_status.uo_affill_status.of_Set_Parent_Window( lw )
			
			if not ib_tab_seleted then 
			  tab_1.tabpage_apptmnt_status.uo_affill_status.tab_view.SelectTab(2)
			end if 
			//appointment stat
			tab_1.tabpage_apptmnt_status.uo_affill_status.of_Set_parent_facility_Id( ii_parent_facility_id )
			tab_1.tabpage_apptmnt_status.uo_affill_status.of_set_prac_id( il_prac_id )
			
			tab_1.tabpage_apptmnt_status.uo_affill_status.of_is_de_complete()
			//of_registerresize(newindex)
			ib_page4_selected = true
		End if
				
		// added by 04.11.2006
		If ib_page4_refresh Then
			tab_1.tabpage_apptmnt_status.uo_affill_status.of_retrieve_detail()	
			ib_page4_refresh = False
		End if
	Case 5
		If not ib_page5_selected Then
			tab_1.tabpage_detail.uo_data_entry.of_set_verification_info( tab_1.tabpage_verif.uo_verif_summary )
			//verif_info
			tab_1.tabpage_verif.uo_verif_summary.of_Reset( )
			tab_1.tabpage_verif.uo_verif_summary.of_Set_facility_Id( ii_parent_facility_id )
			tab_1.tabpage_verif.uo_verif_summary.of_Set_Prac_Id( il_prac_id )
			tab_1.tabpage_verif.uo_verif_summary.of_Set_View_Id( il_data_view )

			//of_registerresize(newindex)
			ib_page5_selected = true
		End If

		// added by 04.11.2006
		If ib_page5_refresh Then
			tab_1.tabpage_verif.uo_verif_summary.of_get_this_facility_data( )
			ib_page5_refresh = False
		End if
	Case 6
		If not ib_page6_selected Then
			//setup profile tab
			tab_1.tabpage_profile.uo_profile.of_set_facility_Id( ii_parent_facility_id )
			tab_1.tabpage_profile.uo_profile.of_set_prac_id( il_prac_id )
			//--------------------------- APPEON BEGIN ---------------------------
			//$<modify> 2008-08-19 By: Alan
			//$<reason> setup parameter
			tab_1.tabpage_profile.uo_profile.of_set_view_id( il_data_view )
			//---------------------------- APPEON END ----------------------------
			//of_registerresize(newindex)
			ib_page6_selected = true
		End if
	Case 7
		
		//Added by Ken.Guo on 2008-11-07
		If Not ib_imageocx_showed Then
			gnv_reg_ocx.of_check_ocx(3,'',True)
			ib_imageocx_showed = True
		End If
		
		If not ib_page7_selected Then
			tab_1.tabpage_image.uo_image.of_set_parent( lw )
			//of_registerresize(newindex)
			ib_page7_selected = true
			w_mdi.of_prac_folder_security(Parent) //Added by Ken.Guo 2008-02-25
			of_ImagingWarning()			//Added by Scofield on 2007-09-21
		End if
	Case 8
		If not ib_page8_selected Then
			//of_registerresize(newindex)
			ib_page8_selected = true
		End if
	Case 9
		If not ib_page9_selected Then
			//of_registerresize(newindex)
			ib_page9_selected = true
		End if
	Case 10
		If not ib_page10_selected Then
			//of_registerresize(newindex)
			ib_page10_selected = true
		End if
End Choose

//
This.event ue_selectionchanging(oldindex, newindex)
//

//---------------------------- APPEON END ----------------------------


//setredraw(true)
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-21
//$<add> 01.26.2006 By: Cao YongWang
//$<reason> Performacne tuning
//$<modification> Add the following script to make sure that w_mdi will not be
//$<modification> be redrawed until the following operations are done. Refer to
//$<modification> PT-22 for more information.
w_mdi.setredraw(false)
//---------------------------- APPEON END ----------------------------

IF newindex = 2 THEN
	IF tab_1.tabpage_detail.uo_data_entry.of_get_selected_view_tab() = 1 THEN
		tab_1.tabpage_detail.uo_data_entry.of_setfocus_browse() 
		tab_1.tabpage_detail.uo_data_entry.of_btt_browse()
	ELSE
		tab_1.tabpage_detail.uo_data_entry.of_setfocus_detail() 
		tab_1.tabpage_detail.uo_data_entry.of_btt_detail()
		tab_1.tabpage_detail.uo_data_entry.of_btt_address_link_button()
	END IF
END IF

IF newindex = 3 THEN
	tab_1.tabpage_apptmnt_status.uo_affill_status.of_is_app_audit_complete()
	//--------------------------- APPEON BEGIN ---------------------------
	//$<modify> 2006-11-14 By: Allen
	//$<reason> Fix APB Bug: the Toolbar Icon is invalid.
	/*
	w_mdi.ChangeMenu(m_pfe_cst_app_audit)
	*/
	If w_mdi.menuname <> 'm_pfe_cst_app_audit' Then w_mdi.ChangeMenu( m_pfe_cst_app_audit )
	//---------------------------- APPEON END ----------------------------
	w_mdi.of_menu_security( "m_pfe_cst_app_audit" )		
	//--------------------------- APPEON BEGIN ---------------------------
	//$<add> 05.15.2006 By: LeiWei
	//$<reason> Fix a defect.
	tab_1.tabpage_app_audit.uo_app_audit.dw_detail.post setfocus()
	//---------------------------- APPEON END ----------------------------
ELSEIF newindex = 10 THEN
	//--------------------------- APPEON BEGIN ---------------------------
	//$<modify> 2006-11-14 By: Allen
	//$<reason> Fix APB Bug: the Toolbar Icon is invalid.
	/*
	w_mdi.ChangeMenu(m_pfe_cst_prac_meetings)
	*/
	If w_mdi.menuname <> 'm_pfe_cst_prac_meetings' Then w_mdi.ChangeMenu( m_pfe_cst_prac_meetings )
	//---------------------------- APPEON END ----------------------------
	w_mdi.of_menu_security( "m_pfe_cst_prac_meetings" )				
ELSEIF newindex = 9 THEN
	//--------------------------- APPEON BEGIN ---------------------------
	//$<modify> 2006-11-14 By: Allen
	//$<reason> Fix APB Bug: the Toolbar Icon is invalid.
	/*
	w_mdi.ChangeMenu(m_pfe_cst_net_dev)
	*/
	If w_mdi.menuname <> 'm_pfe_cst_net_dev' Then w_mdi.ChangeMenu( m_pfe_cst_net_dev )
	//---------------------------- APPEON END ----------------------------
	w_mdi.of_menu_security( "m_pfe_cst_net_dev" )
	
		
//\/maha82200  privileges
elseIF newindex = 8 THEN
	//--------------------------- APPEON BEGIN ---------------------------
	//$<modify> 2006-11-14 By: Allen
	//$<reason> Fix APB Bug: the Toolbar Icon is invalid.
	/*
	w_mdi.ChangeMenu(m_pfe_cst_privileges)
	*/
	If w_mdi.menuname <> 'm_pfe_cst_privileges' Then w_mdi.ChangeMenu( m_pfe_cst_privileges )
	//---------------------------- APPEON END ----------------------------
	w_mdi.of_menu_security( "m_pfe_cst_privileges" )		
ELSEIF newindex = 1 THEN	
	//--------------------------- APPEON BEGIN ---------------------------
	//$<modify> 2006-11-14 By: Allen
	//$<reason> Fix APB Bug: the Toolbar Icon is invalid.
	/*
	w_mdi.ChangeMenu(m_pfe_cst_mdi_menu)
	*/
	If w_mdi.menuname <> 'm_pfe_cst_mdi_menu' Then w_mdi.ChangeMenu( m_pfe_cst_mdi_menu )
	//---------------------------- APPEON END ----------------------------
	w_mdi.of_menu_security( "m_pfe_cst_mdi_menu" )		
ELSEIF newindex = 6 THEN
	//--------------------------- APPEON BEGIN ---------------------------
	//$<modify> 2006-11-14 By: Allen
	//$<reason> Fix APB Bug: the Toolbar Icon is invalid.
	/*
	w_mdi.ChangeMenu(m_pfe_cst_profile)
	*/
	If w_mdi.menuname <> 'm_pfe_cst_profile' Then w_mdi.ChangeMenu( m_pfe_cst_profile )
	//---------------------------- APPEON END ----------------------------
	w_mdi.of_menu_security( "m_pfe_cst_profile" )		
ELSEIF newindex = 5 THEN
	//--------------------------- APPEON BEGIN ---------------------------
	//$<modify> 2006-11-14 By: Allen
	//$<reason> Fix APB Bug: the Toolbar Icon is invalid.
	/*
	w_mdi.ChangeMenu(m_pfe_cst_verif_info)
	*/
	If w_mdi.menuname <> 'm_pfe_cst_verif_info' Then w_mdi.ChangeMenu( m_pfe_cst_verif_info )
	//---------------------------- APPEON END ----------------------------
	w_mdi.SetToolbarPos ( 2, 1, 200, False)	
	w_mdi.SetToolbarPos ( 3, 1, 300, False)	
	//If the inv_action_items not is valid the create it
	If not isvalid(inv_action_items) Then inv_action_items = create pfc_n_cst_ai_action_items
	//
	inv_action_items.of_enable_action_menu( tab_1.tabpage_verif.uo_verif_summary.of_get_dw() , "1" )
	w_mdi.of_menu_security( "m_pfe_cst_verif_info" )
	
	//set priority
	IF w_mdi.of_security_access( 182 ) = 0 THEN
		tab_1.tabpage_verif.uo_verif_summary.dw_detail.Modify("priority.protect = '1'")
		tab_1.tabpage_verif.uo_verif_summary.dw_detail.Modify("priority.background.color= '12632256'")
	END IF
	//priority user
	IF w_mdi.of_security_access( 185 ) = 0 THEN
		tab_1.tabpage_verif.uo_verif_summary.dw_detail.Modify("priority_user.protect = '1'")
		tab_1.tabpage_verif.uo_verif_summary.dw_detail.Modify("priority_user.background.color= '12632256'")
	END IF	
	//post results
	IF w_mdi.of_security_access( 160 ) = 0 THEN
		tab_1.tabpage_verif.uo_verif_summary.dw_detail.Modify("response_code.protect = '1'")
		tab_1.tabpage_verif.uo_verif_summary.dw_detail.Modify("response_code.background.color= '12632256'")
		tab_1.tabpage_verif.uo_verif_summary.dw_detail.Modify("user_name.protect = '1'")
		tab_1.tabpage_verif.uo_verif_summary.dw_detail.Modify("user_name.background.color= '12632256'")
		tab_1.tabpage_verif.uo_verif_summary.dw_detail.Modify("date_recieved.protect = '1'")
		tab_1.tabpage_verif.uo_verif_summary.dw_detail.Modify("date_recieved.background.color= '12632256'")
		tab_1.tabpage_verif.uo_verif_summary.dw_detail.Modify("date_recieved.protect = '1'")
		tab_1.tabpage_verif.uo_verif_summary.dw_detail.Modify("date_recieved.background.color= '12632256'")
	END IF		
ELSEIF newindex = 7 THEN
	//-----------Begin Modified by Alfee on 10.13.2008------------------------
	li_index = tab_1.tabpage_image.uo_image.tab_view.Selectedtab
	tab_1.tabpage_image.uo_image.of_set_menu(li_index)
	w_mdi.SetToolbarPos ( 2, 1, 200, False)	
	w_mdi.SetToolbarPos ( 3, 1, 300, False)
	/* Note: some functions have been moved into of_set_menu(...) 
	//--------------------------- APPEON BEGIN ---------------------------
	//$<modify> 2006-11-14 By: Allen
	//$<reason> Fix APB Bug: the Toolbar Icon is invalid.
	//	w_mdi.ChangeMenu(m_pfe_cst_imaging)
	If w_mdi.menuname <> 'm_pfe_cst_imaging' Then w_mdi.ChangeMenu( m_pfe_cst_imaging )
	//---------------------------- APPEON END ----------------------------
	w_mdi.SetToolbarPos ( 2, 1, 200, False)	
	w_mdi.SetToolbarPos ( 3, 1, 300, False)	
	tab_1.tabpage_image.uo_image.of_enable_next_prev_buttons( "Browse" )
	tab_1.tabpage_image.uo_image.of_set_menu( 1 )	
	w_mdi.of_menu_security( "m_pfe_cst_imaging" )	
	*/ 
	//---------End Modified --------------------------------------------------
ELSEIF newindex = 2 or newindex = 4 THEN
	//IF Not IsValid( m_pfe_cst_data_entry ) THEN
		//--------------------------- APPEON BEGIN ---------------------------
		//$<modify> 2006-11-14 By: Allen
		//$<reason> Fix APB Bug: the Toolbar Icon is invalid.
		/*
		w_mdi.ChangeMenu(m_pfe_cst_data_entry)
		*/
		If w_mdi.menuname <> 'm_pfe_cst_data_entry' Then w_mdi.ChangeMenu( m_pfe_cst_data_entry )
		//---------------------------- APPEON END ----------------------------
		tab_1.tabpage_apptmnt_status.uo_affill_status.of_is_de_complete()
		w_mdi.of_menu_security( "m_pfe_cst_data_entry" )
		if newindex = 4 then
			m_pfe_cst_data_entry.m_view.m_aptnote.visible = true
		else
			m_pfe_cst_data_entry.m_view.m_aptnote.visible = False
		end if
		tab_1.tabpage_detail.uo_data_entry.of_add_delete_enable()
	//END IF
END IF

w_mdi.SetToolbarPos ( 2, 1, 200, False)	

IF newindex = 3 THEN
	IF IsValid(m_pfe_cst_data_entry) THEN
		gnv_app.of_modify_menu_attr( m_pfe_cst_data_entry.m_edit.m_insert,'enabled', False)
		gnv_app.of_modify_menu_attr( m_pfe_cst_data_entry.m_edit.m_delete1,'enabled', False)
	END IF
ELSE
	IF IsValid(m_pfe_cst_data_entry) THEN
		gnv_app.of_modify_menu_attr( m_pfe_cst_data_entry.m_edit.m_insert,'enabled', True)
		gnv_app.of_modify_menu_attr( m_pfe_cst_data_entry.m_edit.m_delete1,'enabled', True)
	END IF
END IF


//IF newindex = 5 THEN
//	w_mdi.ChangeMenu( m_pfe_cst_verif_info )
//	w_mdi.SetToolbarPos ( 2, 1, 200, False)	
//	w_mdi.SetToolbarPos ( 3, 1, 300, False)	
//	inv_action_items.of_enable_action_menu( tab_1.tabpage_verif.uo_verif_summary.of_get_dw() , "1" )
//	w_mdi.of_menu_security( "m_pfe_cst_verif_info" )	
//	//set priority
//	IF w_mdi.of_security_access( 182 ) = 0 THEN
//		tab_1.tabpage_verif.uo_verif_summary.dw_detail.Modify("priority.protect = '1'")
//		tab_1.tabpage_verif.uo_verif_summary.dw_detail.Modify("priority.background.color= '12632256'")
//	END IF
//	//priority user
//	IF w_mdi.of_security_access( 185 ) = 0 THEN
//		tab_1.tabpage_verif.uo_verif_summary.dw_detail.Modify("priority_user.protect = '1'")
//		tab_1.tabpage_verif.uo_verif_summary.dw_detail.Modify("priority_user.background.color= '12632256'")
//	END IF	
//	//post results
//	IF w_mdi.of_security_access( 160 ) = 0 THEN
//		tab_1.tabpage_verif.uo_verif_summary.dw_detail.Modify("response_code.protect = '1'")
//		tab_1.tabpage_verif.uo_verif_summary.dw_detail.Modify("response_code.background.color= '12632256'")
//		tab_1.tabpage_verif.uo_verif_summary.dw_detail.Modify("user_name.protect = '1'")
//		tab_1.tabpage_verif.uo_verif_summary.dw_detail.Modify("user_name.background.color= '12632256'")
//		tab_1.tabpage_verif.uo_verif_summary.dw_detail.Modify("date_recieved.protect = '1'")
//		tab_1.tabpage_verif.uo_verif_summary.dw_detail.Modify("date_recieved.background.color= '12632256'")
//		tab_1.tabpage_verif.uo_verif_summary.dw_detail.Modify("date_recieved.protect = '1'")
//		tab_1.tabpage_verif.uo_verif_summary.dw_detail.Modify("date_recieved.background.color= '12632256'")
//	END IF		
//END IF

IF newindex = 2 THEN
	//<add> 08/04/2007 by:Andy
	m_pfe_cst_data_entry.m_edit.m_addverificationentry.visible = True
	gnv_app.of_modify_menu_attr( m_pfe_cst_data_entry.m_edit.m_addverificationentry,'toolbaritemvisible', True)
	//end of add
	tab_1.tabpage_detail.uo_data_entry.of_get_record_verif( tab_1.tabpage_detail.uo_data_entry.of_get_row( ))
	IF IsValid( m_pfe_cst_data_entry ) THEN
		gnv_app.of_modify_menu_attr( m_pfe_cst_data_entry.m_edit.m_delete1,'enabled', False)
		gnv_app.of_modify_menu_attr( m_pfe_cst_data_entry.m_edit.m_insert,'enabled', False)
		m_pfe_cst_data_entry.m_system.m_nulldate.visible = false //maha020702
		m_pfe_cst_data_entry.m_view.m_aptnote.visible = False //maha 111802
		gnv_app.of_modify_menu_attr( m_pfe_cst_data_entry.m_view.m_aptnote,'toolbaritemvisible', False) //maha 111802
		gnv_app.of_modify_menu_attr( m_pfe_cst_data_entry.m_edit.m_addverificationentry,'enabled', false)
		m_pfe_cst_data_entry.m_file.m_multiapp.Visible = False
		gnv_app.of_modify_menu_attr( m_pfe_cst_data_entry.m_file.m_multiapp,'toolbaritemvisible', False)	
		//m_pfe_cst_data_entry.m_edit.m_addverificationentry.toolbaritemvisible = false		
	END IF
END IF

////only show multi add on the appointment status screen
//IF IsValid(m_pfe_cst_data_entry) THEN
//	m_pfe_cst_data_entry.m_file.m_multiapp.Visible = False moved up maha 070104
//	m_pfe_cst_data_entry.m_file.m_multiapp.toolbaritemvisible = False	
//END IF	

IF newindex = 4 THEN  //appointment status tab
	//m_pfe_cst_data_entry.m_edit.m_addverificationentry.visible = False
	tab_1.tabpage_apptmnt_status.uo_affill_status.tab_view.tabpage_detail_1.dw_apptmnt_status.SetFocus()
	//modify record status
	IF w_mdi.of_security_access( 125 ) = 0 THEN
		tab_1.tabpage_apptmnt_status.uo_affill_status.tab_view.tabpage_detail_1.dw_apptmnt_status.Modify("active_status.protect = '1'")
		tab_1.tabpage_apptmnt_status.uo_affill_status.tab_view.tabpage_detail_1.dw_apptmnt_status.Modify("active_status.background.color= '12632256'")
	END IF
	IF IsValid(m_pfe_cst_data_entry) THEN
//		m_pfe_cst_data_entry.m_file.m_multiapp.visible = True maha removed
//		m_pfe_cst_data_entry.m_file.m_multiapp.enabled = True
//		m_pfe_cst_data_entry.m_file.m_multiapp.toolbaritemvisible = True
		//select set_14 into :set_ck from icred_settings;
		set_ck = of_get_app_setting("set_14","I")
		if set_ck = 1 then //appointment note tool
			m_pfe_cst_data_entry.m_view.m_aptnote.visible = True //maha 111802
			gnv_app.of_modify_menu_attr( m_pfe_cst_data_entry.m_view.m_aptnote,'toolbaritemvisible', True) //maha 111802
		end if
		//m_pfe_cst_data_entry.m_system.m_nulldate.visible = true //maha020702
	END IF	
END IF

//IF newindex = 7 THEN
//	w_mdi.ChangeMenu( m_pfe_cst_imaging )
//	w_mdi.SetToolbarPos ( 2, 1, 200, False)	
//	w_mdi.SetToolbarPos ( 3, 1, 300, False)	
//	tab_1.tabpage_image.uo_image.of_enable_next_prev_buttons( "Browse" )
//	tab_1.tabpage_image.uo_image.of_set_menu( 1 )	
//END IF

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> UM-03
//$<add> 01.13.2006 By: Rodger Wu
//$<reason> The SetToolbarPos function is currently unsupported. 
//$<modification> Replace the SetToolBarPos function with the Appeon defined function of_settoolbarpos to provide
//$<modification> the same functionality.
long ll_handle
ll_handle = handle(w_mdi)
gnv_appeondll.of_settoolbarpos(ll_handle)
//---------------------------- APPEON END ----------------------------

IF newindex = 4 THEN
	m_pfe_cst_data_entry.m_edit.m_addverificationentry.visible = False
	gnv_app.of_modify_menu_attr( m_pfe_cst_data_entry.m_edit.m_addverificationentry,'toolbaritemvisible', False)
END IF

//This.SetRedraw( True )

This.PostEvent( "pfc_cst_after_select" )

IF newindex = 2 THEN
	tab_1.tabpage_detail.uo_data_entry.of_add_delete_enable()
END IF

IF NOT ib_new_prac THEN
	GarbageCollect ( )
END IF

IF gb_se_version THEN
	of_se()
END IF
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-22
//$<add> 01.26.2006 By: Cao YongWang
//$<reason> Performacne tuning
//$<modification> Add the following script to make sure that w_mdi will be
//$<modification> be redrawed when the previous operations are done. Refer to
//$<modification> PT-21 for more information.
w_mdi.setredraw(true)
//---------------------------- APPEON END ----------------------------
//Added by Nova on 2008-08-13
IF newindex <> 1 THEN
	IF Not IsValid(gnv_dashboard_data) THEN gnv_dashboard_data = Create n_cst_dashboard_data
	IF gi_parent_facility <> 0 THEN
		gnv_dashboard_data.of_update_gadgets_recent( 'PRAC', il_prac_id, gi_parent_facility)
	END IF
END IF
RETURN 1





end event

type tabpage_search from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 3570
integer height = 1716
long backcolor = 79741120
string text = "Search"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "Search!"
long picturemaskcolor = 12632256
uo_search uo_search
end type

on tabpage_search.create
this.uo_search=create uo_search
this.Control[]={this.uo_search}
end on

on tabpage_search.destroy
destroy(this.uo_search)
end on

type uo_search from pfc_cst_u_extended_search within tabpage_search
event destroy ( )
integer x = 9
integer y = 4
integer width = 3575
integer height = 1712
integer taborder = 10
boolean bringtotop = true
boolean border = false
long backcolor = 79741120
end type

on uo_search.destroy
call pfc_cst_u_extended_search::destroy
end on

type tabpage_detail from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 3570
integer height = 1716
long backcolor = 79741120
string text = "Credentials"
long tabbackcolor = 79741120
string picturename = "DataWindow5!"
long picturemaskcolor = 12632256
string powertiptext = "Select to view detail on a specific record"
oval_2 oval_2
uo_data_entry uo_data_entry
p_face p_face
end type

on tabpage_detail.create
this.oval_2=create oval_2
this.uo_data_entry=create uo_data_entry
this.p_face=create p_face
this.Control[]={this.oval_2,&
this.uo_data_entry,&
this.p_face}
end on

on tabpage_detail.destroy
destroy(this.oval_2)
destroy(this.uo_data_entry)
destroy(this.p_face)
end on

type oval_2 from oval within tabpage_detail
integer linethickness = 4
long fillcolor = 255
integer x = -32768
integer y = 364
integer width = 78
integer height = 60
end type

type uo_data_entry from pfc_cst_u_data_entry within tabpage_detail
event destroy ( )
integer x = 18
integer y = 8
integer taborder = 20
boolean bringtotop = true
boolean border = false
end type

on uo_data_entry.destroy
call pfc_cst_u_data_entry::destroy
end on

type p_face from picture within tabpage_detail
boolean visible = false
integer x = 2825
integer y = 816
integer width = 649
integer height = 752
boolean bringtotop = true
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type tabpage_app_audit from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 3570
integer height = 1716
long backcolor = 79741120
string text = "App. Audit"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "DosEdit5!"
long picturemaskcolor = 12632256
string powertiptext = "Select to view the providers application audit status"
uo_app_audit uo_app_audit
end type

on tabpage_app_audit.create
this.uo_app_audit=create uo_app_audit
this.Control[]={this.uo_app_audit}
end on

on tabpage_app_audit.destroy
destroy(this.uo_app_audit)
end on

type uo_app_audit from pfc_cst_u_application_audit within tabpage_app_audit
event destroy ( )
integer x = 18
integer y = 16
integer taborder = 20
boolean bringtotop = true
boolean border = false
end type

on uo_app_audit.destroy
call pfc_cst_u_application_audit::destroy
end on

type tabpage_apptmnt_status from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 3570
integer height = 1716
long backcolor = 79741120
string text = "Appmt. Status"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "ComputeToday5!"
long picturemaskcolor = 12632256
uo_affill_status uo_affill_status
end type

on tabpage_apptmnt_status.create
this.uo_affill_status=create uo_affill_status
this.Control[]={this.uo_affill_status}
end on

on tabpage_apptmnt_status.destroy
destroy(this.uo_affill_status)
end on

type uo_affill_status from pfc_cst_u_apptmnt_status within tabpage_apptmnt_status
event destroy ( )
integer x = 18
integer y = 16
integer width = 3570
integer taborder = 30
boolean bringtotop = true
boolean border = false
end type

on uo_affill_status.destroy
call pfc_cst_u_apptmnt_status::destroy
end on

type tabpage_verif from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 3570
integer height = 1716
long backcolor = 79741120
string text = "Verification"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "Custom038!"
long picturemaskcolor = 12632256
string powertiptext = "Select to view this providers verification information"
uo_verif_summary uo_verif_summary
end type

on tabpage_verif.create
this.uo_verif_summary=create uo_verif_summary
this.Control[]={this.uo_verif_summary}
end on

on tabpage_verif.destroy
destroy(this.uo_verif_summary)
end on

type uo_verif_summary from pfc_cst_u_verification_info within tabpage_verif
event destroy ( )
integer x = 14
integer y = 12
integer width = 3589
integer taborder = 30
boolean border = false
end type

on uo_verif_summary.destroy
call pfc_cst_u_verification_info::destroy
end on

type tabpage_profile from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 3570
integer height = 1716
long backcolor = 79741120
string text = "Profile"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "SetDefaultClass!"
long picturemaskcolor = 12632256
uo_profile uo_profile
end type

on tabpage_profile.create
this.uo_profile=create uo_profile
this.Control[]={this.uo_profile}
end on

on tabpage_profile.destroy
destroy(this.uo_profile)
end on

type uo_profile from pfc_cst_u_profile within tabpage_profile
event destroy ( )
integer x = 5
integer y = 16
integer taborder = 30
boolean bringtotop = true
boolean border = false
end type

on uo_profile.destroy
call pfc_cst_u_profile::destroy
end on

type tabpage_image from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 3570
integer height = 1716
long backcolor = 79741120
string text = "Image"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "Custom071!"
long picturemaskcolor = 12632256
uo_image uo_image
end type

on tabpage_image.create
this.uo_image=create uo_image
this.Control[]={this.uo_image}
end on

on tabpage_image.destroy
destroy(this.uo_image)
end on

type uo_image from pfc_cst_u_imaging within tabpage_image
event destroy ( )
integer x = 18
integer y = 20
integer taborder = 30
boolean bringtotop = true
boolean border = false
end type

on uo_image.destroy
call pfc_cst_u_imaging::destroy
end on

type tabpage_privileges from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 3570
integer height = 1716
long backcolor = 79741120
string text = "Priv"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "Custom016!"
long picturemaskcolor = 12632256
uo_priv uo_priv
end type

on tabpage_privileges.create
this.uo_priv=create uo_priv
this.Control[]={this.uo_priv}
end on

on tabpage_privileges.destroy
destroy(this.uo_priv)
end on

type uo_priv from uo_priv_data_ent within tabpage_privileges
event destroy ( )
integer y = 40
integer taborder = 10
boolean bringtotop = true
end type

on uo_priv.destroy
call uo_priv_data_ent::destroy
end on

type tabpage_net from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3570
integer height = 1716
long backcolor = 80269524
string text = "Appl. Status"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
string picturename = "RunReport!"
long picturemaskcolor = 12632256
uo_net uo_net
end type

on tabpage_net.create
this.uo_net=create uo_net
this.Control[]={this.uo_net}
end on

on tabpage_net.destroy
destroy(this.uo_net)
end on

type uo_net from pfc_ia_cst_nv_net_dev_new within tabpage_net
integer x = 23
integer y = 20
integer taborder = 20
boolean bringtotop = true
boolean border = false
long backcolor = 81324524
end type

on uo_net.destroy
call pfc_ia_cst_nv_net_dev_new::destroy
end on

type tabpage_meetings from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3570
integer height = 1716
long backcolor = 80269524
string text = "Meetings"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
string picturename = "ComputeToday5!"
long picturemaskcolor = 12632256
uo_meetings uo_meetings
end type

on tabpage_meetings.create
this.uo_meetings=create uo_meetings
this.Control[]={this.uo_meetings}
end on

on tabpage_meetings.destroy
destroy(this.uo_meetings)
end on

type uo_meetings from pfc_cst_u_meetings within tabpage_meetings
integer x = 5
integer y = 8
integer taborder = 20
boolean bringtotop = true
boolean border = false
long backcolor = 80269524
end type

on uo_meetings.destroy
call pfc_cst_u_meetings::destroy
end on

type cb_1 from commandbutton within w_prac_data_1
boolean visible = false
integer x = 1426
integer y = 1736
integer width = 247
integer height = 84
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "test"
end type

event clicked;messagebox("",string(ib_priv_retrieved) + "- -" + string(il_prac_id))
end event

