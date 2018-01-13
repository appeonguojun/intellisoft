$PBExportHeader$w_action_items.srw
forward
global type w_action_items from w_sheet
end type
type st_filter from statictext within w_action_items
end type
type ddplb_filters from dropdownpicturelistbox within w_action_items
end type
type dw_select_org_facility from pfc_cst_u_org_facility_selector_horiz within w_action_items
end type
type dw_user from pfc_cst_u_user_selector within w_action_items
end type
type tab_1 from tab within w_action_items
end type
type tabpage_analysis from userobject within tab_1
end type
type tab_analysis from tab within tabpage_analysis
end type
type tabpage_last_attempt from userobject within tab_analysis
end type
type dw_last_attemp_graph from u_dw within tabpage_last_attempt
end type
type tabpage_last_attempt from userobject within tab_analysis
dw_last_attemp_graph dw_last_attemp_graph
end type
type tabpage_total_attempts from userobject within tab_analysis
end type
type dw_total_attempts from u_dw within tabpage_total_attempts
end type
type tabpage_total_attempts from userobject within tab_analysis
dw_total_attempts dw_total_attempts
end type
type tabpage_expiring_credentials from userobject within tab_analysis
end type
type dw_expiring_credential_graph from u_dw within tabpage_expiring_credentials
end type
type tabpage_expiring_credentials from userobject within tab_analysis
dw_expiring_credential_graph dw_expiring_credential_graph
end type
type tabpage_exp_appointments from userobject within tab_analysis
end type
type dw_expiring_appointments_graph from u_dw within tabpage_exp_appointments
end type
type tabpage_exp_appointments from userobject within tab_analysis
dw_expiring_appointments_graph dw_expiring_appointments_graph
end type
type tabpage_audit from userobject within tab_analysis
end type
type dw_app_audit_graph from u_dw within tabpage_audit
end type
type tabpage_audit from userobject within tab_analysis
dw_app_audit_graph dw_app_audit_graph
end type
type tab_analysis from tab within tabpage_analysis
tabpage_last_attempt tabpage_last_attempt
tabpage_total_attempts tabpage_total_attempts
tabpage_expiring_credentials tabpage_expiring_credentials
tabpage_exp_appointments tabpage_exp_appointments
tabpage_audit tabpage_audit
end type
type st_msg from statictext within tabpage_analysis
end type
type tabpage_analysis from userobject within tab_1
tab_analysis tab_analysis
st_msg st_msg
end type
type tabpage_detail from userobject within tab_1
end type
type sle_1 from singlelineedit within tabpage_detail
end type
type tab_view from tab within tabpage_detail
end type
type tabpage_browse from userobject within tab_view
end type
type dw_browse from u_dw within tabpage_browse
end type
type tabpage_browse from userobject within tab_view
dw_browse dw_browse
end type
type tabpage_details from userobject within tab_view
end type
type dw_detail from u_dw within tabpage_details
end type
type dw_dummy_browse from u_dw within tabpage_details
end type
type st_name from statictext within tabpage_details
end type
type tabpage_details from userobject within tab_view
dw_detail dw_detail
dw_dummy_browse dw_dummy_browse
st_name st_name
end type
type tab_view from tab within tabpage_detail
tabpage_browse tabpage_browse
tabpage_details tabpage_details
end type
type sle_doc_find from singlelineedit within tabpage_detail
end type
type cb_find from commandbutton within tabpage_detail
end type
type st_find from statictext within tabpage_detail
end type
type cb_init_recred from commandbutton within tabpage_detail
end type
type st_1 from statictext within tabpage_detail
end type
type cb_recred_no_ver from commandbutton within tabpage_detail
end type
type dw_tracker from datawindow within tabpage_detail
end type
type cbx_priv from checkbox within tabpage_detail
end type
type tabpage_detail from userobject within tab_1
sle_1 sle_1
tab_view tab_view
sle_doc_find sle_doc_find
cb_find cb_find
st_find st_find
cb_init_recred cb_init_recred
st_1 st_1
cb_recred_no_ver cb_recred_no_ver
dw_tracker dw_tracker
cbx_priv cbx_priv
end type
type tabpage_ready from userobject within tab_1
end type
type tab_ready from tab within tabpage_ready
end type
type tabpage_ready_to_send from userobject within tab_ready
end type
type dw_ready from u_dw within tabpage_ready_to_send
end type
type tabpage_ready_to_send from userobject within tab_ready
dw_ready dw_ready
end type
type tabpage_sent_to_comm from userobject within tab_ready
end type
type dw_sent_to_comm from u_dw within tabpage_sent_to_comm
end type
type tabpage_sent_to_comm from userobject within tab_ready
dw_sent_to_comm dw_sent_to_comm
end type
type tab_ready from tab within tabpage_ready
tabpage_ready_to_send tabpage_ready_to_send
tabpage_sent_to_comm tabpage_sent_to_comm
end type
type cb_send from commandbutton within tabpage_ready
end type
type dw_committee from u_dw within tabpage_ready
end type
type st_committee from statictext within tabpage_ready
end type
type cb_1 from commandbutton within tabpage_ready
end type
type cb_post from commandbutton within tabpage_ready
end type
type tabpage_ready from userobject within tab_1
tab_ready tab_ready
cb_send cb_send
dw_committee dw_committee
st_committee st_committee
cb_1 cb_1
cb_post cb_post
end type
type tabpage_net_dev from userobject within tab_1
end type
type uo_net_dev from pfc_ia_cst_nv_net_dev_new_action_items within tabpage_net_dev
end type
type tabpage_net_dev from userobject within tab_1
uo_net_dev uo_net_dev
end type
type tabpage_contract from userobject within tab_1
end type
type uo_1 from uo_ctx_ai within tabpage_contract
end type
type tabpage_contract from userobject within tab_1
uo_1 uo_1
end type
type tabpage_document_manager from uo_ctx_ai_doc within tab_1
end type
type tabpage_document_manager from uo_ctx_ai_doc within tab_1
end type
type tab_1 from tab within w_action_items
tabpage_analysis tabpage_analysis
tabpage_detail tabpage_detail
tabpage_ready tabpage_ready
tabpage_net_dev tabpage_net_dev
tabpage_contract tabpage_contract
tabpage_document_manager tabpage_document_manager
end type
type uo_lights from uo_filter_lights within w_action_items
end type
end forward

global type w_action_items from w_sheet
integer x = 5
integer y = 224
integer width = 3666
integer height = 2296
string title = "Action Items"
long backcolor = 80269524
boolean clientedge = true
event pfc_filter_wizard ( )
event pfc_grph_by_total_attempts ( )
event pfc_grph_by_last_attempt ( )
event pfc_cst_print_letters ( )
event pfc_cst_goto_web ( )
event pfc_cst_edit ( )
event pfc_cst_dial_phone ( )
event pfc_cst_refresh ( )
event pfc_cst_npdb_export ( )
event pfc_cst_print_report ( )
event pfc_cst_print_net_dev_ltr ( )
event pfc_cst_print_net_dev_report ( )
event pfc_cst_iverify ( )
event pfc_cst_net_dev_filter ( )
event pfc_cst_scan_oig ( )
event pfc_cst_intellibatch_filter ( )
event pfc_cst_missing_info ( )
event pfc_cst_batch_response ( )
event pfc_cst_addtl_filters ( )
event pfc_cst_capture_image ( )
event se_post_event ( )
event ue_postupdate ( )
event pfc_cst_batch_recredential ( )
st_filter st_filter
ddplb_filters ddplb_filters
dw_select_org_facility dw_select_org_facility
dw_user dw_user
tab_1 tab_1
uo_lights uo_lights
end type
global w_action_items w_action_items

type variables
integer ii_dashboard_macro = -1

pfc_cst_nv_data_entry_functions inv_data_entry
pfc_n_cst_ai_printletters inv_printletters
pfc_n_cst_ai_action_items inv_action_items

String is_display_text
String is_current_graph = "last_attempt"
String is_filter
String is_user_id = "All"
string is_batch_filter = ""
string is_addtl_filter = ""
string is_ir_filter = ""
string is_screen_filter = ""
string is_combined_filters

Long il_prac_ids[]

Boolean lb_response_cd_entered = False
boolean ib_letters
boolean ib_cache = false
boolean ib_privs
boolean ib_netdev_retr = false

// mskinner 22 March 2006 -- begin
boolean ib_original_sql_set
// mskinner 22 March 2006 -- end
Integer ii_facility_ids[]
Integer ii_screen_ids[]
Integer il_total_filter_items 
Integer il_selected_cnt = 0
Integer ii_filter_index
Integer ii_cr
Integer ii_org_id = 0 
Integer ii_facility_id = 0
Integer ii_facility_ids_all[]
Integer ii_comm_id = 0
Integer ii_comm_ids_all[]
integer ii_egg

u_dw idw_focus

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 2006-10-12 By: Rodger Wu (Inova)
//$<reason> Set a flag for refresh verification records once Practitioner Data changed.

Boolean ib_prac_data_changed = False

//---------------------------- APPEON END ----------------------------

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 11.06.2006 By: Jervis
//$<reason> modify work flow
str_action_item istr_action[]

//---------------------------- APPEON END ----------------------------

//Added By Jervis 12.5.2006
string is_prior


//--------------------------- APPEON BEGIN ---------------------------
//$<add> 12.07.2006 By: Davis
//$<reason> For dashboard
STRING ii_dashboard_where
//---------------------------- APPEON END ----------------------------

end variables

forward prototypes
public function integer of_get_ready_for_committee ()
public function integer of_filter_by_intellibatch (datawindow adw_dw)
public function string of_get_filter (string as_type)
public function string of_addtl_filter (integer ai_for)
public function integer of_filter_lights (string as_type)
public function integer of_graph_case (integer ai_case)
public function integer of_goto_net_dev_tab ()
public function integer of_dash_goto_overdue_net_dev ()
public function integer of_se ()
public function integer of_net_dev_ai_menu ()
public function integer of_web_crawl ()
public function integer of_updatecheck (powerobject apo_control[], ref powerobject apo_control_update[])
public function integer of_batch_recred ()
end prototypes

event pfc_filter_wizard;string f

setnull(f)

tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.setfilter(f)
tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.filter()
end event

event pfc_grph_by_last_attempt;tab_1.tabpage_analysis.tab_analysis.tabpage_last_attempt.dw_last_attemp_graph.DataObject = "d_verification_graph_by_last_attemp"
tab_1.tabpage_analysis.tab_analysis.tabpage_last_attempt.dw_last_attemp_graph.of_SetTransObject( SQLCA )
tab_1.tabpage_analysis.tab_analysis.tabpage_last_attempt.dw_last_attemp_graph.Event pfc_Retrieve( )
end event

event pfc_cst_print_letters();gs_pass_ids lstr_ids
Integer li_rc
Integer i
Integer li_print_cnt
long ll_ver_method_ver_ltr 
long ll_ver_method_corre_ltr 
long ll_ver_method_exp_ltr 
long ll_ver_method_exp_appt_ltr
long ll_method
string ls_filter

// start code change --- 11.14.2005 MSKINNER

if w_mdi.menuname = 'm_pfe_cst_action_items'  then 
	if m_pfe_cst_action_items.m_action.m_printallletters.tag = 'Contract' then 
		this.tab_1.tabpage_contract.uo_1.tab_1.tabpage_2.event ue_print_letters( )
		return 
	end if 
end if
  
  
// regular letter processing stuff
lstr_ids.s_stringval = ddplb_filters.Text
lstr_ids.dw = tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse

li_rc = tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.RowCount()

ls_filter =  ddplb_filters.Text

//Start Code Change ---- 10.18.2007 #V7 maha
if ls_filter = "PRACTITIONER                  All Action Items For A Practitioner" or ls_filter =  "PRACTITIONER - All Action Items For A Practitioner" THEN
	//messagebox("", ddplb_filters.Text)
	ll_ver_method_ver_ltr = long(gnv_data.of_getitem("code_lookup" ,'lookup_code', "upper(lookup_name) = '" + upper('verification method') + "'" + " and upper(code) = '" + upper('verif ltr') + "'"))
	ll_ver_method_corre_ltr = long(gnv_data.of_getitem("code_lookup" ,'lookup_code', "upper(lookup_name) = '" + upper('verification method') + "'" + " and upper(code) = '" + upper('prac corre') + "'"))
	ll_ver_method_exp_ltr = long(gnv_data.of_getitem("code_lookup" ,'lookup_code', "upper(lookup_name) = '" + upper('verification method') + "'" + " and upper(code) = '" + upper('exp cred ltr') + "'"))
	ll_ver_method_exp_appt_ltr = long(gnv_data.of_getitem("code_lookup" ,'lookup_code', "upper(lookup_name) = '" + upper('verification method') + "'" + " and upper(code) = '" + upper('exp appt ltr') + "'"))
END IF
//End Code Change---10.18.2007

FOR i = 1 TO li_rc
	//debugbreak()
	if tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.GetItemNumber( i, "selected" ) = 1 THEN //maha 082203
		//Start Code Change ---- 10.1.2007 #V7 maha  trap for the following filter, otherwise non letters show up in the print window
		IF ddplb_filters.Text = "PRACTITIONER                  All Action Items For A Practitioner" or ls_filter =  "PRACTITIONER - All Action Items For A Practitioner" THEN
			ll_method =  tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.GetItemNumber( i, "verification_method" )
			choose case ll_method
				case ll_ver_method_ver_ltr , ll_ver_method_corre_ltr , ll_ver_method_exp_ltr , ll_ver_method_exp_appt_ltr
					//Is a letter
				case else
					//not a letter skip
					continue
			end choose
		end if
		//End Code Change---10.18.2007
		IF tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.GetItemNumber( i, "print_flag" ) = 1 THEN
			li_print_cnt++
			//lstr_ids.s_ids[i] = tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.GetItemString( i, "doc_id" )
			lstr_ids.s_ids[Upperbound(lstr_ids.s_ids[]) + 1] = tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.GetItemString( i, "doc_id" ) //Ken.Guo 10/31/2007
		END IF
	end if
END FOR

lstr_ids.ls_from_window = "w_action _items" //Start Code Change ----12.08.2008 #V85 maha - pass window name

IF li_print_cnt > 0 THEN
	OpenWithParm( w_ai_print_letters_new, lstr_ids )
ELSE
	MessageBox("Print", "There no selected entries on this view that need to be printed." )
	Return
END IF
// end code change --- 11.14.2005 MSKINNER
end event

event pfc_cst_goto_web();//inv_printletters.of_connecttoweb( tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.GetItemString(+& 
//tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.GetRow(), "web_address") )

Integer li_cr
gs_pass_ids ls_pass_ids
String ls_web_address
String ls_web_title
Long ll_verification_id

//Start Code Change ---- 03.12.2007 #V7 maha all web functionality moved to crawler window
// of_get_app_setting("web_crawl","I") = 1 then
	of_web_crawl( )
//	return
//end if

//li_cr = tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.GetRow( )
//
//ll_verification_id = tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.GetItemNumber( li_cr, "address_lookup_code")
//
//ls_web_address = tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.GetItemString( li_cr, "web_address")
//
////Start Code Change ---- 03.03.2006 #314 maha
//IF len(ls_web_address ) < 1 THEN
//	MessageBox("Invalid WEB Address", "There is no web address setup in the lookup table for the selected entity." )
//	Return
//END IF
////End Code Change---03.03.2006
//
//ls_pass_ids.ls_doc_id = tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.GetItemString( li_cr, "doc_id" )
//ls_pass_ids.ls_ref_value = tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.GetItemString( li_cr, "reference_value" )
//ls_pass_ids.ls_from_window = "Action_Items"
//ls_pass_ids.ll_verification_id = ll_verification_id
//IF tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.GetItemNumber( li_cr, "verification_picture_flag" ) = 1 THEN
//	ls_pass_ids.ls_image_available = True
//ELSE
//	ls_pass_ids.ls_image_available = False
//END IF
//
//if of_get_app_setting("set_13","I") = 1 then //line added maha 122205
//	IF Not IsValid( w_capture ) THEN
//		OpenWithParm( w_capture,  ls_pass_ids )
//	ELSE
//		w_capture.of_setup( ls_pass_ids )
//	END IF
//end if
//
//pfc_n_cst_ai_printletters lnv_printletters
//
//lnv_printletters = CREATE pfc_n_cst_ai_printletters
//
//lnv_printletters.of_connecttoweb( ls_web_address )
//
//DESTROY lnv_printletters
//
//End Code Change---03.12.2007








end event

event pfc_cst_edit;tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.SetItem( +&
tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.GetRow(), "selected", 1) 

end event

event pfc_cst_dial_phone;inv_printletters.of_dialphone( tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.GetItemString(+& 
tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.GetRow(), "phone") )
end event

event pfc_cst_refresh();//Start Code Change ----04.22.2008 #V8 maha - corrected refresh bug; simplifed code
Integer li_index
datawindow ldw_graph 
//--------------------------- APPEON BEGIN ---------------------------
//$<add> 08/22/2007 By: Ken.Guo
//$<reason> Refresh Other Tabpages Data
li_index = Tab_1.Selectedtab
This.Tab_1.Trigger Event SelectionChanged(li_index,li_index)
//---------------------------- APPEON END ----------------------------

CHOOSE CASE tab_1.tabpage_analysis.tab_analysis.SelectedTab

	CASE 1 //verification status
		debugbreak()
		ldw_graph = tab_1.tabpage_analysis.tab_analysis.tabpage_last_attempt.dw_last_attemp_graph
	CASE 2 //total attempts
		ldw_graph =  tab_1.tabpage_analysis.tab_analysis.tabpage_total_attempts.dw_total_attempts
	CASE 3 //expiring credentials
		ldw_graph =  tab_1.tabpage_analysis.tab_analysis.tabpage_expiring_credentials.dw_expiring_credential_graph
	CASE 4//expiring appointments	
		ldw_graph =  tab_1.tabpage_analysis.tab_analysis.tabpage_exp_appointments.dw_expiring_appointments_graph
	CASE 5
		ldw_graph = tab_1.tabpage_analysis.tab_analysis.tabpage_audit.dw_app_audit_graph
END CHOOSE

inv_action_items.of_filter_graph( ii_facility_id, ldw_graph, is_user_id )
of_filter_by_intellibatch( ldw_graph)
//End Code Change---04.22.2008

end event

event pfc_cst_npdb_export();////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  [PUBLIC]   : pfc_cst_npdb_export
//==================================================================================================================
//  Purpose   	: CONTROL FUNCTION TO SEND FOR THE NPDB MENTHOD (IPT OR QPRAC)
//==================================================================================================================
//  Arguments 	: [NONE] 
//==================================================================================================================
//  Returns   	: [NONE]     
//==================================================================================================================
//  Notes     	: Changes here must be made to pfc_u_varification_info :: pfc_cst_npdb_export as well
//==================================================================================================================
//  Created By	: ???
//==================================================================================================================
//  Modification Log
//   Changed By             Change Date                   Reason
// ------------------------------------------------------------------------------------------------------------------
// MSKINNER 					07 Feb 2005                    Added modification for NPDB IPT interface
//																			 added case statement
//																			 Added calls to of_start_npdb
// MSKINNER                15 March 2005                  added code to open w_npdb_reports
// MSKINNER						18 MARCH 2005						 Moved the new npdb locic to a user object
// MSKINNER 					04 March 2004						 We are now passing the datawindow, to be used as a doc_id source
// mskinner                07 mARCH 2006                  aDDED lnvo = create n_cst_npdb_control 
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

CONSTANT LONG ITP_INTERFACE = 1 // USED FOR READ-ABILITY
//not coded to use checkboxes


integer li_8
integer ck
long i //maha 05.05.08
long cnt //maha05.05.08
u_dw ldw_data

ldw_data = tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse

li_8 = of_get_app_setting("set_8","I")

CHOOSE CASE li_8
	CASE ITP_INTERFACE
		n_cst_npdb_control lnvo
		lnvo = CREATE n_cst_npdb_control
		lnvo.ib_do_not_open = true
		
		if ddplb_filters.text = "                                             NPDB Queries Previously Exported"  or ddplb_filters.text = "NPDB - NPDB Queries To Previously Exported" then
			message.doubleparm = 1 //RECIEVE

		elseif ddplb_filters.text = "NPDB                                   NPDB Queries To Be Exported" or ddplb_filters.text = "NPDB - NPDB Queries To Be Exported" then //send
			for i = 1 to ldw_data.rowcount( )
				if ldw_data.getitemnumber(i,"selected") = 1 then
					if ldw_data.getitemnumber(i,"number_sent") >0 then
						cnt++
					end if
				end if
			next
			if cnt > 0 then
				ck = MessageBox("NPDB",  string(cnt ) + " of the records selected have previously been exported and may be files received with errors.    Do you wish to resend these files to the NPDB?",question!,yesno!,2 )
				if ck = 2 then
					Return
				else
					message.doubleparm = 2  //SEND
				end if
			else
				message.doubleparm = 2  //SEND
			end if
		else
			messagebox("Program Error","This filter will not run the npdb export")
			openwithparm(w_sql_msg,ddplb_filters.text)
		end if
	
		lnvo.of_run_npdb(ldw_data)

		if IsValid(lnvo) then Destroy lnvo
		
		inv_action_items.of_filter( ii_org_id, ii_facility_id, is_filter, tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse, is_user_id, ddplb_filters )

	CASE ELSE
    		ck = inv_action_items.of_npdb_export_old(ldw_data,ii_facility_id,"A" )
		//open browser to npdb website
		if ck >= 0 then //Start Code Change ---- 04.12.2007 #V7 maha changed from ck > 0 to correct bug
			String ls_url = "http://www.npdb-hipdb.hrsa.gov/"//Start Code Change ----10.03.2006 #637 maha
			//String ls_url = "http://www.npdb-hipdb.com"
			inet iinet_base 
			GetContextService("Internet", iinet_base)
			if gi_citrix = 1 then
				of_open_web(ls_url)
			else
				//--------------------------- APPEON BEGIN ---------------------------
				//$<modify> 06.23.2006 By: Liang QingShi
				//$<reason>  GetContextService is currently unsupported. 
				//$<modification> Replace GetContextService with ShellExecuteA to provide the
				//$<modification> same functionality.
				/*
				GetContextService("Internet", iinet_base)
				iinet_base.HyperlinkToURL(ls_url)
				*/
				String ls_null
				setnull(ls_null)
				ShellExecuteA ( Handle( This ), "open", 'IEXPLORE', ls_url , ls_Null, 4)
			
				//---------------------------- APPEON END ----------------------------
			end if
		end if
END CHOOSE

end event

event pfc_cst_print_report();
CHOOSE CASE tab_1.SelectedTab
	CASE 1
		//\/maha 021501 to print all graphs
		choose case tab_1.tabpage_analysis.tab_analysis.selectedtab 
			case 1
				tab_1.tabpage_analysis.tab_analysis.tabpage_last_attempt.dw_last_attemp_graph.Print()
			case 2
				tab_1.tabpage_analysis.tab_analysis.tabpage_total_attempts.dw_total_attempts.Print()
			case 3
				tab_1.tabpage_analysis.tab_analysis.tabpage_expiring_credentials.dw_expiring_credential_graph.Print()
			case 4
				tab_1.tabpage_analysis.tab_analysis.tabpage_exp_appointments.dw_expiring_appointments_graph.Print()
		end choose
		//\maha 
	CASE 2
		tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.Print()
	CASE 3
		IF tab_1.tabpage_ready.tab_ready.SelectedTab = 1 THEN
			tab_1.tabpage_ready.tab_ready.tabpage_ready_to_send.dw_ready.Print()
		ELSE
			tab_1.tabpage_ready.tab_ready.tabpage_sent_to_comm.dw_sent_to_comm.Print()
		END IF
		
	//--------------------------- APPEON BEGIN ---------------------------
	//$<add> 08/21/2007 By: Ken.Guo
	//$<reason> Fxied BugA081403: Added for Printing dw data 
	Case 4
		If tab_1.tabpage_net_dev.uo_net_dev.tab_1.selectedtab = 1 Then	
			tab_1.tabpage_net_dev.uo_net_dev.tab_1.tabpage_ai.dw_net_dev.Print()
		Else
			tab_1.tabpage_net_dev.uo_net_dev.tab_1.tabpage_report.dw_report_data.Print()		
		End If
	Case 5
		If tab_1.tabpage_contract.uo_1.tab_1.Selectedtab = 1 Then
			tab_1.tabpage_contract.uo_1.tab_1.tabpage_1.dw_1.Print()
		Else
			tab_1.tabpage_contract.uo_1.tab_1.tabpage_2.dw_details.Print()
		End If
	Case 6
		If tab_1.tabpage_document_manager.tab_1.Selectedtab = 1 Then
			tab_1.tabpage_document_manager.tab_1.tabpage_1.dw_1.Print()
		Else
			tab_1.tabpage_document_manager.tab_1.tabpage_2.dw_details.Print()
		End If
	//---------------------------- APPEON END ----------------------------
END CHOOSE
end event

event pfc_cst_print_net_dev_ltr;tab_1.tabpage_net_dev.uo_net_dev.Event pfc_cst_print_net_dev_ltr()
end event

event pfc_cst_print_net_dev_report;tab_1.tabpage_net_dev.uo_net_dev.Event pfc_cst_print_net_dev_report()
end event

event pfc_cst_iverify();//gs_pass_ids gs_passed_parms
//
//
//gs_passed_parms.prac_id = tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.GetItemNumber( tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.getrow ( ), "prac_id" )
//gs_passed_parms.s_ids[1] = "Old"
//gs_passed_parms.s_stringval = "Action_Items"
//gs_passed_parms.i_facility_ids[1] = tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.GetItemNumber( tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.getrow ( ), "parent_facility_id" )
//gs_passed_parms.i_facility_ids[2] = tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.GetItemNumber( tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.getrow ( ), "verifying_facility" )
//
//OpenWithParm( w_iverify_summary, gs_passed_parms )
//
//Return 0
end event

event pfc_cst_net_dev_filter;
IF tab_1.SelectedTab = 4 THEN
	tab_1.tabpage_net_dev.uo_net_dev.Event pfc_cst_net_dev_filter()
END IF
end event

event pfc_cst_scan_oig();long ll_oig
long pracids[]
string docids[]
integer i
integer ic
string ls_filter
string ls_type
string ls_parm
integer ifirst
integer ilast
integer idob
integer praccnt

if tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.RowCount() < 1 then return

for i = 1 to tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.RowCount()
	if tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.getitemnumber(i,"selected") = 1 then //maha 082203
   	pracids[i] = tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.getitemnumber(i,"prac_id")
	   docids[i] = tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.getitemstring(i,"doc_id")
		praccnt++
	end if
next

if praccnt < 1 then //maha 082203
	messagebox("None Selected","There are no records selected.")
	return 
end if
//manual or automatic
//if automatic get search parameters
open(w_oig_type)
ls_type = message.stringparm


if ls_type = "A" then
	ls_parm = 'VAA'
	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> PT-01
	//$<add> 02.20.2006 By: LeiWei
	//$<reason> Performance tuning
	//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

	gnv_appeondb.of_startqueue( )
	//---------------------------- APPEON END ----------------------------

	select oig_auto_fname into :ifirst from facility;
	select oig_auto_lname into :ilast from facility;
	select oig_auto_dob into :idob from facility;

	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> PT-02
	//$<add> 02.20.2006 By: LeiWei
	//$<reason> Performance tuning
	//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.
	gnv_appeondb.of_commitqueue( )
	//---------------------------- APPEON END ----------------------------
	
	if ifirst <> 1 and ilast <> 1 and idob <> 1 then
		messagebox("Auto OIG","There are no selection parameters for Auto selection of OIG for this facility.")
		return
	end if
elseif ls_type = "M" then
	ls_parm = 'VMA'
else
	return
end if


openwithparm(w_oig_on_demand,ls_parm)

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-03
//$<add> 02.20.2006 By: LeiWei
//$<reason> Performance tuning
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.
//$<modification> Fix the original code bug.
/*
w_oig_on_demand.dw_prac_list.retrieve(pracids[])
w_oig_on_demand.dw_verifs.retrieve(docids[])

if ls_type = "A" then
	w_oig_on_demand.of_scan_oig_data("A",ilast,ifirst,idob,"S")
end if
*/
If isvalid(w_oig_on_demand) Then
	gnv_appeondb.of_startqueue( )
	
	w_oig_on_demand.dw_prac_list.retrieve(pracids[])
	w_oig_on_demand.dw_verifs.retrieve(docids[])
	
	gnv_appeondb.of_commitqueue( )
	
	if ls_type = "A" then
		w_oig_on_demand.of_scan_oig_data("A",ilast,ifirst,idob,"S")
	end if
End if
//---------------------------- APPEON END ----------------------------

//inv_action_items.of_filter( ii_org_id, ii_facility_id, is_filter, tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse, is_user_id, ddplb_filters )
end event

event pfc_cst_intellibatch_filter;//maha 071403

string f
gs_batch_search lst_search
long i
long ic
long r
long rc
long pracids[]
string names[]
string ls_openstring
string ls_pracs

ls_openstring = "R"

openwithparm(w_batch_prac_select_new,ls_openstring)


if message.stringparm = "Cancel" then
	return
else 
	lst_search = message.powerobjectparm
	
	pracids[] = lst_search.li_prac_id[]
	names[] = lst_search.ls_name[]
	ic = upperbound(pracids[]) 
	
	if ic > 0 then
		ls_pracs = " prac_id in ("
		
		for i = 1 to ic
			ls_pracs = ls_pracs + string(pracids[i])
			if i < ic then ls_pracs = ls_pracs  + ","
		next 
		ls_pracs = ls_pracs  + ")"
	end if
	
	is_batch_filter = ls_pracs
end if
gs_fil_batch = ""
of_filter_by_intellibatch(tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse)
//tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.setfilter(ls_pracs)
//tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.filter()
end event

event pfc_cst_missing_info();//maha created 08-03

if tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.dataobject  <> "d_app_audit_missing_ai" then
	messagebox("Information","You can only run this function with the App Audit filter")
	return
end if



Long ll_prac_ids[]
Long ll_rec
Long ll_rec_ids[]
Integer li_org_ids[]
Long li_facility_ids[]
long rc
long r
long a
long ac = 0
integer ck = 0

for r = 1 to tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.rowcount()
	ck = 0
	tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.AcceptText()

	ll_rec = tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.GetItemNumber( r, "appt_stat_id" )
	for a = 1 to upperbound(ll_rec_ids[])
		if ll_rec_ids[a] = ll_rec then  //based on rec_id get distinct records
			ck = 1
			continue
		end if
	next
	if ck = 1 then
		continue
	else
		ac++
		ll_rec_ids[ac] = ll_rec
		li_facility_ids[ac] = tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.GetItemNumber( r, "facility_id" )
		ll_prac_ids[ac] = tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.GetItemNumber( r, "prac_id" )
		//is_app_type = tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.GetItemString( r, "app_type" )
	
	//tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.Update()
	//dw_detail.Retrieve( li_rec_ids[1] 
	end if
next
ck = upperbound(ll_rec_ids[])
//messagebox("count",ck)
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> UM-01
//$<modify> 01.13.2006 By: Wang Chao
//$<reason> It is currently unsupported to dynamically create a visual object.
//$<modification> Replace the visual object with a non-visual object.
//pfc_cst_u_generate_miss_info_rqst lnvo_letter
//
//lnvo_letter = create pfc_cst_u_generate_miss_info_rqst
pfc_cst_u_generate_miss_info_rqst_apb lnvo_letter

lnvo_letter = create pfc_cst_u_generate_miss_info_rqst_apb

//---------------------------- APPEON END ----------------------------

lnvo_letter.of_generate_miss_info_letter( li_facility_ids, ll_prac_ids, ll_rec_ids, tab_1.tabpage_detail.dw_tracker )

DESTROY lnvo_letter
end event

event pfc_cst_batch_response;//created 072503 maha

if tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.dataobject  = "d_app_audit_missing_ai" then
	//messagebox("parm","A")
	openwithparm(w_ai_update_values,"A")
else
	openwithparm(w_ai_update_values,"V")
	//messagebox("parm","V")
end if

this.triggerevent("pfc_save")
end event

event pfc_cst_addtl_filters;open(w_additional_filters_ai)

if message.stringparm = "Cancel" then
	return
else
	CHOOSE CASE tab_1.SelectedTab
		CASE 1
			CHOOSE CASE tab_1.tabpage_analysis.tab_analysis.SelectedTab
				//verification status
				CASE 1
					of_filter_by_intellibatch( tab_1.tabpage_analysis.tab_analysis.tabpage_last_attempt.dw_last_attemp_graph )
				//expiring credentials
				CASE 3
					of_filter_by_intellibatch( tab_1.tabpage_analysis.tab_analysis.tabpage_expiring_credentials.dw_expiring_credential_graph)
				//expiring appointments	
				CASE 4
					of_filter_by_intellibatch( tab_1.tabpage_analysis.tab_analysis.tabpage_exp_appointments.dw_expiring_appointments_graph)
				CASE 5
					of_filter_by_intellibatch( tab_1.tabpage_analysis.tab_analysis.tabpage_audit.dw_app_audit_graph )
			END CHOOSE
		//action item detail tab
		CASE 2
			//inv_action_items.of_filter( ii_org_id, ii_facility_id, is_filter, tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse)	
			of_filter_by_intellibatch(tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse)
		CASE 3
			of_get_ready_for_committee()
			of_filter_by_intellibatch(tab_1.tabpage_ready.tab_ready.tabpage_ready_to_send.dw_ready)
			of_filter_by_intellibatch(tab_1.tabpage_ready.tab_ready.tabpage_sent_to_comm.dw_sent_to_comm)
		CASE 4
			//tab_1.tabpage_net_dev.uo_net_dev.of_Retrieve_Detail( ii_facility_id )
		//	of_filter_by_intellibatch(tab_1.tabpage_net_dev.tabpage_browse.dw_browse)
	END CHOOSE
	//of_filter_by_intellibatch(tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse)
end if
end event

event pfc_cst_capture_image;
gs_pass_ids ls_pass_ids
Integer li_cr	
	
li_cr = tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.GetRow( )

If li_cr > 0 Then
	ls_pass_ids.ls_doc_id = tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.GetItemString( li_cr, "doc_id" )
	ls_pass_ids.ls_ref_value = tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.GetItemString( li_cr, "reference_value" )
	ls_pass_ids.ls_from_window = "Action_Items"
	IF tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.GetItemNumber( li_cr, "verification_picture_flag" ) = 1 THEN
		ls_pass_ids.ls_image_available = True
	ELSE
		ls_pass_ids.ls_image_available = False
	END IF
End If

IF Not IsValid( w_capture ) THEN
	OpenWithParm( w_capture,  ls_pass_ids )
ELSE
	w_capture.of_setup( ls_pass_ids )
END IF
end event

event se_post_event;tab_1.SelectTab(2)
end event

event ue_postupdate();//////////////////////////////////////////////////////////////////////
// $<event>w_sheetue_postupdate()
// $<arguments>(None)
// $<returns> 
// $<description>
// $<description>
//////////////////////////////////////////////////////////////////////
// $<add> 04.05.2006 by LeiWei
//////////////////////////////////////////////////////////////////////

Integer i
Integer li_rc
Integer li_cnt
DateTime ldt_todaysDate
datastore ds_ver
integer li_vfacil
integer fac
integer cnt
integer ck = 0

//maha 10.02.08 note: ii_facility_ids, il_prac_ids[] are created in dw_browse,pfc_preupdate and are a list of distinct prac and facility for the list of verifications in dw_browse
li_rc = UpperBound( ii_facility_ids  )
IF li_rc <=0 THEN RETURN

ds_ver = create datastore
//ds_ver.dataobject = "d_ai_appt_stat_4_verif_compl"
ds_ver.dataobject = "d_ai_appt_stat_4_verif_compl_forpt"
ds_ver.settransobject(sqlca)

Datastore lds_verif_info
lds_verif_info = create datastore
lds_verif_info.dataobject = "d_verif_info_forpt"
lds_verif_info.settransobject(sqlca)

Datastore lds_affil_stat
lds_affil_stat = create datastore
lds_affil_stat.dataobject = "d_pd_affil_stat_forpt1"
lds_affil_stat.settransobject(sqlca)

Datastore lds_app_audit
lds_app_audit = create datastore
lds_app_audit.dataobject = "d_app_audit_forpt"
lds_app_audit.settransobject(sqlca)

gnv_appeondb.of_startqueue()
//Start Code Change ----01.02.2008 #V8 maha  -- changed code below to reflect appropriate functionality based on dw_browse data object
//lds_verif_info.Retrieve(ii_facility_ids[], il_prac_ids[])  //Start Code Change ----01.02.2008 #V8 maha moved below
lds_affil_stat.Retrieve(ii_facility_ids[], il_prac_ids[])
//lds_app_audit.Retrieve(ii_facility_ids[], il_prac_ids[]) //Start Code Change ----01.02.2008 #V8 maha moved below

gnv_appeondb.of_commitqueue()

Integer li_vfacil_arr[]

ldt_todaysdate = DateTime( Today(), Now() )

IF tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.dataobject  <> "d_app_audit_missing_ai" then //all verif infos 
	lds_verif_info.Retrieve(ii_facility_ids[], il_prac_ids[])
	FOR i = 1 TO li_rc
		fac = ii_facility_ids[i]
		
		if ii_screen_ids[i] = 1 then //if a screen 1 verification get the verifying facility for that parent id
	//		SELECT pd_affil_stat.verifying_facility  
	//		INTO :li_vfacil 
	//		FROM pd_affil_stat  
	//		WHERE ( pd_affil_stat.parent_facility_id = :ii_facility_ids[i] ) AND  
	//				( pd_affil_stat.prac_id = :il_prac_ids[i] ) and				
	//				( pd_affil_stat.active_status in (1,4));
			li_cnt = lds_affil_stat.Find("parent_facility_id = " + string(ii_facility_ids[i]) + " and prac_id = " + String(il_prac_ids[i]), 1, lds_affil_stat.rowcount())
			If li_cnt > 0 Then li_vfacil = lds_affil_stat.GetitemNumber(li_cnt, "verifying_facility")
		else
			li_vfacil = fac
		end if
	
		li_vfacil_arr[i] = li_vfacil
	END FOR

	ds_ver.retrieve(il_prac_ids[], li_vfacil_arr[])
	
	ldt_todaysdate = DateTime( Today(), Now() )
	
	gnv_appeondb.of_startqueue()
	
	FOR i = 1 TO li_rc
		//$<reason> inv_action_items.of_is_last_verif( ii_facility_ids[ i ], il_prac_ids[ i ] ,ii_screen_ids[i])
		//$<reason> The following script is a copy from of_is_last_verif function in the pfc_n_cst_ai_action_items userobject
		fac = ii_facility_ids[i]
		
		if li_vfacil_arr[i] = ii_facility_ids[i] then ck = 1 //if parent and ver are the same then skip some work later down
		
		//cnt = ds_ver.retrieve(il_prac_ids[i],li_vfacil)
		ds_ver.Setfilter("prac_id = " + String(il_prac_ids[i]) + " And verifying_facility = " + String(li_vfacil) )
		ds_ver.Filter( )
		cnt = ds_ver.Rowcount( )
		
		IF cnt >= 0 THEN
			li_cnt = lds_verif_info.Find("facility_id = " + string(li_vfacil) + " and prac_id = " + String(il_prac_ids[i]) + " and active_status = 1", 1, lds_verif_info.rowcount())
			IF li_cnt = 0 THEN 
				if cnt > 0 then //redundant trap
					if ck = 1 then  //parent and verif are different
						for i = 1 to cnt //test for npdb,oig etc.
							fac = ds_ver.getitemnumber(i,"parent_facility_id")

							li_cnt = lds_verif_info.Find("facility_id = " + string(fac) + " and prac_id = " + String(il_prac_ids[i]) , 1, lds_verif_info.rowcount())
							if li_cnt = 0 then
								ds_ver.setitem(i,"date_verif_completed",ldt_todaysDate)
							end if
						next
					else //same parent and ver facility;  should normally be 1
						for i = 1 to cnt //already tested for verification above so just set date
							ds_ver.setitem(i,"date_verif_completed",ldt_todaysDate)
						next
					end if
				END IF
				ds_ver.update()
				COMMIT USING SQLCA;
			END IF
		END IF
	NEXT
	
ELSE //app audit missing dw -- check for app audit complete

	lds_app_audit.Retrieve(ii_facility_ids[], il_prac_ids[])

	//$<reason> inv_action_items.of_is_app_audit_compl( il_prac_ids[ i ],ii_facility_ids[ i ] )
	FOR i = 1 TO li_rc
		li_cnt = lds_affil_stat.Find("parent_facility_id = " + string(ii_facility_ids[i]) + " and prac_id = " + String(il_prac_ids[i])+ " and isnull(date_app_audit_completed)", 1, lds_affil_stat.rowcount())

		if li_cnt > 0 then //if not check for incomplete app audits

			li_cnt = lds_app_audit.Find("facility_id = " + string(ii_facility_ids[i]) + " and prac_id = " + String(il_prac_ids[i]) + " and isnull(date_app_audit_completed)", 1, lds_app_audit.rowcount())
	
			IF li_cnt = 0 THEN //if none set date
				UPDATE pd_affil_stat  
				SET date_app_audit_completed = :ldt_todaysDate  
				WHERE ( pd_affil_stat.parent_facility_id = :ii_facility_ids[ i ] ) AND  
						( pd_affil_stat.active_status in ( 1,4 ) ) AND
						( pd_affil_stat.prac_id = :il_prac_ids[ i ] ) and
						( pd_affil_stat.date_app_audit_completed is NULL );	
				COMMIT USING SQLCA;
			END IF
		END IF
	NEXT
END IF

gnv_appeondb.of_commitqueue()

DESTROY ds_ver

end event

event pfc_cst_batch_recredential();//Start Code Change ----06.10.2008 #V81 maha - for batch recred function
of_batch_recred( )
end event

public function integer of_get_ready_for_committee ();DataWindowChild dwchild
Integer li_rc
Integer i
Integer li_found

IF ii_facility_id = 0 THEN
	dw_select_org_facility.GetChild( "facility_id", dwchild )
	li_rc = dwchild.RowCount()
	FOR i = 2 TO li_rc
		ii_facility_ids_all[i] = dwchild.GetItemNumber( i, "facility_id" )
	END FOR
	tab_1.tabpage_ready.dw_committee.GetChild( "credentialing_committee", dwchild )
	//--------------------------- APPEON BEGIN ---------------------------
	//$<modify> 2006-05-04 By: Liu Hongxin
	//$<reason> Fix a defect.
	/*
	dwchild.SetFilter( "" )
	*/
	dwchild.SetFilter( "committee_name <> 'All' ")	
	//---------------------------- APPEON END ----------------------------

	dwchild.Filter( )
ELSE
	ii_facility_ids_all[1] = ii_facility_id
	tab_1.tabpage_ready.dw_committee.GetChild( "credentialing_committee", dwchild )	
	dwchild.SetFilter( "facility_id = " + String(ii_facility_id ))
	dwchild.Filter( )
END IF

li_found = dwchild.Find( "committee_name = 'All'" , 1,100)
IF li_found < 1 THEN
	dwchild.InsertRow(1)
	dwchild.SetItem( 1, "committee_id", 0 )
	dwchild.SetItem( 1, "committee_name", "All" )
END IF

tab_1.tabpage_ready.tab_ready.tabpage_ready_to_send.dw_ready.Event pfc_retrieve()
tab_1.tabpage_ready.tab_ready.tabpage_sent_to_comm.dw_sent_to_comm.Event pfc_retrieve()

RETURN 0
end function

public function integer of_filter_by_intellibatch (datawindow adw_dw);//maha 072303
string ls_filter
string ls_facil_user_filter = ""
integer li_use_f_u = 0
integer c
//messagebox("is_batch_filter",is_batch_filter)
adw_dw.setredraw(false)
CHOOSE CASE tab_1.SelectedTab
	//analysis graphs
	CASE 1
		c = tab_1.tabpage_analysis.tab_analysis.SelectedTab
		//messagebox("",c)
		CHOOSE CASE c

			//verification status
			CASE 1
				is_addtl_filter = of_addtl_filter(1)
			CASE 2
				is_addtl_filter = of_addtl_filter(2)	
				//expiring credentials
			CASE 3
				is_addtl_filter = of_addtl_filter(3)
			//expiring appointments	
			CASE 4
				is_addtl_filter = of_addtl_filter(4)
			CASE 5
				is_addtl_filter = of_addtl_filter(5)
		END CHOOSE
//		debugbreak()
		//because facility and user are filtered after the retrieve for graphs (the others are part of the retrieval query)
		IF is_user_id = "All" AND ii_facility_id <> 0 THEN
			ls_facil_user_filter = "parent_facility_id = " + String( ii_facility_id ) 
		ELSEIF ii_facility_id = 0 AND is_user_id <> "All" THEN
			ls_facil_user_filter = "priority_user = '" + is_user_id + "'" 
		ELSEIF is_user_id <> "All" AND ii_facility_id <> 0 THEN
			ls_facil_user_filter = "parent_facility_id = " + String( ii_facility_id ) + " AND priority_user = '" + is_user_id + "'" 
		ELSE
			ls_facil_user_filter = ""
		END IF
		li_use_f_u = 1
	//action item detail tab
	CASE 2
		is_addtl_filter = of_addtl_filter(20)
		//ready for committee
	CASE 3
		is_addtl_filter = of_addtl_filter(30)
		//net dev
	CASE 4
		is_addtl_filter = of_addtl_filter(40)
END CHOOSE


if is_addtl_filter = "NONE" then
	ls_filter = ""
else
	if len(is_addtl_filter) > 0 and len(is_batch_filter) > 0 then//if both in use then add 'and'
	  ls_filter = is_addtl_filter + " and " +  is_batch_filter
	else
		ls_filter = is_addtl_filter + is_batch_filter
	end if
end if

//this will only change the filter for a graph
if li_use_f_u = 1 then
	//messagebox("","graph filter")
	if len(ls_filter) > 0 and len(ls_facil_user_filter) > 0 then//if both in use then add 'and'
	  ls_filter = ls_filter + " and " +  ls_facil_user_filter
	else
		ls_filter = ls_filter + ls_facil_user_filter
	end if
end if

if adw_dw.setfilter(ls_filter) < 1 then messagebox("Bad filter",ls_filter)
adw_dw.filter()

adw_dw.setredraw(true) 

 is_combined_filters = ls_filter  //Start Code Change ----12.05.2008 #V85 maha

return 1
end function

public function string of_get_filter (string as_type);//function created 073003 maha called by of_addtl_filters

string ls_filt

choose case as_type
	case "S"
		ls_filt = is_screen_filter
	case "I"
		ls_filt = is_ir_filter
	case "B"
		ls_filt = is_screen_filter + " AND " + is_ir_filter
	case "N"
		ls_filt = ""	
	case "U"
		ls_filt = "NONE"	
	case else
		ls_filt = ""
end choose

return ls_filt

end function

public function string of_addtl_filter (integer ai_for);//function created maha 073003 called from of_intellibatch_filter
string ls_return
string ls_filter
string ls_type

CHOOSE CASE ai_for
	case 1 //verification graph
		if isvalid(w_action_items) then
			ls_type = "S"
		else //trap for intelliapp netdev graph
			ls_type = "U"
		end if
	case 2
		ls_type = "S"
	case 3 //exp creds
		ls_type = "S"
	case 4 //exp appts
		ls_type = "I"
	case 5 //app audit graph
		ls_type = "I"
	case 20 //browse tab
		ls_filter = ddplb_filters.text
		
		CHOOSE CASE ls_filter
			CASE "EXPIRING ELEMENTS        All Expiring Appointments"
				ls_type = "I"
			CASE "                                             Exp. Appt. Letters"
				ls_type = "I"
			CASE "RED FLAG                           Verifications In Process 120+"
				ls_type = "S"
			CASE "TO BE PRINTED                 Verifications Letters"
				ls_type = "S"
			CASE "                                             All Letters Needing Reprinted"
				ls_type = "S"
			CASE "                                             Expiration Letters" , "Expiration Letters Needing Printing"
				ls_type = "S"
			CASE "                                             Practitioner Correspondence Letters"
				ls_type = "N"		
			CASE "AWAITING RESPONSE      Verification  Letters"
				ls_type = "S"
			CASE "iVerify                                  Verify using iVerify database"
				ls_type = "S"
			CASE "                                             All Letters Previously Mailed"
				ls_type = "S"
			CASE "                                             Expiration  Letters", "Expiration Letters Awaiting Response"
				ls_type = "S"
			CASE "                                             Practitioner  Correspondence"
				ls_type = "N"
			CASE "                                             Expiring Credential Letters"
				ls_type = "S"
			CASE "HIGH PRIORITY                 High Priority Action Items"
				ls_type = "N"
			CASE "VERIFICATIONS                  WEB"
				ls_type = "S"
			CASE "                                             CALLS"
				ls_type = "S"
			CASE "                                             COMPENDIUM"
				ls_type = "S"					  
			CASE "EXPIRING CREDENTIALS  Credentials Expiring 61 - 90 Days From Today"
				ls_type = "S"														
			CASE "                                             Expiring Appointments"
				ls_type = "I"
			CASE "                                             All Expiring Credentials"
				ls_type = "S"  					  
			CASE "PRACTITIONER                  All Action Items For A Practitioner", "All Action Items For A Practitioner"
				ls_type = "S"
			CASE "FSMB                                   FSMB Queries To Be Exported"
				ls_type = "N"
			CASE "                                             FSMB Queries Previously Exported"
				ls_type = "N"
			CASE "NPDB                                   NPDB Queries To Be Exported"  //NPDB
				ls_type = "I"
			CASE 	"                                             NPDB Queries Previously Exported"
				ls_type = "I"
			CASE	"MAXED ATTEMPTS           Verification letters at max attempts"
				ls_type = "S"
			CASE	"OIG                                     OIG Queries To Be Scanned"
				ls_type = "I"	
			CASE	"                                           OIG Queries Flagged"
				ls_type = "I"
			CASE	"                                             HARD COPY"
				ls_type = "S"
			CASE	"APPLICATION AUDIT          Missing Items" 
				ls_type = "I"
		//after selected names
			CASE "EXPIRING ELEMENTS        All Expiring Appointments"
				ls_type = "S"
			CASE "TO BE PRINTED - Exp. Appt. Letters"
				ls_type = "I"
			CASE "RED FLAG - Verifications In Process 120+"
				ls_type = "S"
			CASE "TO BE PRINTED - Verifications Letters"
				ls_type = "S"
			CASE "TO BE PRINTED - All Letters Needing Reprinted"
				ls_type = "S"
			CASE "TO BE PRINTED - Expiration Letters", "TO BE PRINTED - Expiring Credential Letters"
				ls_type = "S"
			CASE "TO BE PRINTED - Practitioner Correspondence Letters"
				ls_type = "N"				
			CASE "AWAITING RESPONSE - Verification Letters"
				ls_type = "S"
			CASE "Verify using iVerify database"
				ls_type = "S"
			CASE "AWAITING RESPONSE - All Letters Previously Mailed"
				ls_type = "S"
			CASE "AWAITING RESPONSE - Expiration Letters"
				ls_type = "S"
			CASE "AWAITING RESPONSE - Practitioner Correspondence"
				ls_type = "N"
			CASE "HIGH PRIORITY - High Priority Action Items"
				ls_type = "S"
			CASE "VERIFICATIONS - WEB"
				ls_type = "S"
			CASE "VERIFICATIONS - CALLS"
				ls_type = "S"
			CASE "VERIFICATIONS - COMPENDIUM"
				ls_type = "S"
			CASE "EXPIRING CREDENTIALS - Credentials Expiring 61 - 90 Days From Today"
				ls_type = "S"				
			CASE "AWAITING RESPONSE - All Expiring Appointments"
				ls_type = "I"
			CASE "EXPIRING CREDENTIALS - All Expiring Credentials"
				ls_type = "S"
			CASE "PRACTITIONER - All Action Items For A Practitioner"
				ls_type = "S"
			CASE "FSMB                                   FSMB Queries To Be Exported"
				ls_type = "N"
			CASE "                                             FSMB Queries Previously Exported"
				ls_type = "N"
			CASE "NPDB - NPDB Queries To Be Exported"
				ls_type = "I"
			CASE 	"NPDB - NPDB Queries To Previously Exported"
				ls_type = "I"
			CASE	"MAXED ATTEMPTS           Verification letters at max attempts"
				ls_type = "S"
			CASE	"OIG - OIG Queries To Be Scanned"
				ls_type = "I"
			CASE	"OIG - OIG Queries Flagged"
				ls_type = "I"
			CASE	"Hard Copy - Hard Copy Verifications"
				ls_type = "S"
			CASE	"APPLICATION AUDIT  -  Missing Items"
				ls_type = "I"
			CASE	"Incomplete App Audit Items"
				ls_type = "I"
			CASE	"                                             Exp. Provisional. Letters","TO BE PRINTED - Exp. Provisional Letters"
				ls_type = "I"
			CASE	"                                             Exp. Allied Health Letters", "TO BE PRINTED - Exp. Allied Health Letters"
				ls_type = "I"
			CASE ELSE
				//messagebox("",ls_filter)
				ls_type = "N"
		END CHOOSE
	CASE 30 //ready for committee
		ls_type = "I"
	CASE 40 //net dev
		ls_type = "U"
	case else
		ls_return = ""
end choose


ls_return = of_get_filter(ls_type)
of_filter_lights(ls_type)
//messagebox("",ls_return)
return ls_return

end function

public function integer of_filter_lights (string as_type);choose case as_type
	case "I"
		if len(is_ir_filter) > 1 then
			uo_lights.rr_ir.fillcolor = RGB(0,255,0)  //green;  
		else
			uo_lights.rr_ir.fillcolor = RGB(255,0,0) //red
		end if
		if len(is_screen_filter) > 1 then
			uo_lights.rr_s.fillcolor = RGB(192,192,192)  //grey;  
		else
			uo_lights.rr_s.fillcolor = RGB(255,0,0) //red
		end if
	case "S"
		if len(is_ir_filter) > 1 then
			uo_lights.rr_ir.fillcolor = RGB(192,192,192)  //grey;  
		else
			uo_lights.rr_ir.fillcolor = RGB(255,0,0) //red
		end if
		if len(is_screen_filter) > 1 then
			uo_lights.rr_s.fillcolor = RGB(0,255,0)  //green;  
		else
			uo_lights.rr_s.fillcolor = RGB(255,0,0) //red
		end if
		
	case "N","U"
		if len(is_ir_filter) > 1 then
			uo_lights.rr_ir.fillcolor = RGB(192,192,192)  //grey;  
		else
			uo_lights.rr_ir.fillcolor = RGB(255,0,0) //red
		end if
		if len(is_screen_filter) > 1 then
			uo_lights.rr_s.fillcolor = RGB(192,192,192)  //grey;  
		else
			uo_lights.rr_s.fillcolor = RGB(255,0,0) //red
		end if
	case "B"
		if len(is_ir_filter) > 1 then
			uo_lights.rr_ir.fillcolor = RGB(0,255,0)  //green;  
		else
			uo_lights.rr_ir.fillcolor = RGB(255,0,0) //red
		end if
		if len(is_screen_filter) > 1 then
			uo_lights.rr_s.fillcolor = RGB(0,255,0)  //green;  
		else
			uo_lights.rr_s.fillcolor = RGB(255,0,0) //red
		end if

end choose

if len(is_batch_filter) > 1 then
	if as_type = "U" then
		uo_lights.rr_p.fillcolor = RGB(192,192,192)  //grey;
	else
		uo_lights.rr_p.fillcolor = RGB(0,255,0)  //green;
	end if
else
	uo_lights.rr_p.fillcolor = RGB(255,0,0) //red
end if	



//



return 1
end function

public function integer of_graph_case (integer ai_case);//created maha 8-03 called from facility itemchange, user itemchange, and selected tab of analysis tab
CHOOSE CASE ai_case
	//verification status
	CASE 1	
		tab_1.tabpage_analysis.st_msg.text = "Double click graph to view detail of verification type by process type."
		inv_action_items.of_filter_graph( ii_facility_id, tab_1.tabpage_analysis.tab_analysis.tabpage_last_attempt.dw_last_attemp_graph, is_user_id )
		of_filter_by_intellibatch(tab_1.tabpage_analysis.tab_analysis.tabpage_last_attempt.dw_last_attemp_graph)
	//total attempts
	CASE 2
		tab_1.tabpage_analysis.st_msg.text = "Double click graph to view detail of verification type for awaiting response."
		inv_action_items.of_filter_graph( ii_facility_id, tab_1.tabpage_analysis.tab_analysis.tabpage_total_attempts.dw_total_attempts, is_user_id )
		of_filter_by_intellibatch(tab_1.tabpage_analysis.tab_analysis.tabpage_total_attempts.dw_total_attempts)
	//expiring credentials
	CASE 3
		tab_1.tabpage_analysis.st_msg.text = "Double click graph to view detail of All Expiring Credential verifications."
		inv_action_items.of_filter_graph( ii_facility_id, tab_1.tabpage_analysis.tab_analysis.tabpage_expiring_credentials.dw_expiring_credential_graph, is_user_id )
		of_filter_by_intellibatch(tab_1.tabpage_analysis.tab_analysis.tabpage_expiring_credentials.dw_expiring_credential_graph)
	//expiring appointments	
	CASE 4
		tab_1.tabpage_analysis.st_msg.text = "Double click graph to view detail of All Expiring Appointment verifications."
		inv_action_items.of_filter_graph( ii_facility_id, tab_1.tabpage_analysis.tab_analysis.tabpage_exp_appointments.dw_expiring_appointments_graph, is_user_id )
		of_filter_by_intellibatch(tab_1.tabpage_analysis.tab_analysis.tabpage_exp_appointments.dw_expiring_appointments_graph)
	//app audit
	CASE 5
		tab_1.tabpage_analysis.st_msg.text = "Double click graph to view detail of All Missing Required Documents."
		inv_action_items.of_filter_graph( ii_facility_id, tab_1.tabpage_analysis.tab_analysis.tabpage_audit.dw_app_audit_graph, is_user_id )
		of_filter_by_intellibatch(tab_1.tabpage_analysis.tab_analysis.tabpage_audit.dw_app_audit_graph)
END CHOOSE	

return 1
end function

public function integer of_goto_net_dev_tab ();tab_1.SelectTab( 4 )

Return 1
end function

public function integer of_dash_goto_overdue_net_dev ();String ls_filter_syntax
DataWindowChild dwchild
Integer li_found

This.SetRedraw( False )

tab_1.SelectTab( 4 )

tab_1.tabpage_net_dev.uo_net_dev.dw_qf.GetChild( "quick_filter", dwchild )

li_found = dwchild.Find( "filter_code = 'Items Over Due'", 1, 199 )

ls_filter_syntax = dwchild.GetItemString( li_found, "filter_syntax" )

tab_1.tabpage_net_dev.uo_net_dev.dw_qf.SetItem( 1, "quick_filter", ls_filter_syntax )

tab_1.tabpage_net_dev.uo_net_dev.dw_qf.AcceptText( )

This.SetRedraw( True )

Return 1
end function

public function integer of_se ();//tab_1.tabpage_analysis.tab_analysis.tabpage_last_attempt.dw_last_attemp_graph.Visible = False
tab_1.tabpage_analysis.tab_analysis.tabpage_total_attempts.Visible = False
tab_1.tabpage_analysis.tab_analysis.tabpage_expiring_credentials.Visible = False
tab_1.tabpage_analysis.tab_analysis.tabpage_exp_appointments.Visible = False
tab_1.tabpage_analysis.tab_analysis.tabpage_audit.Visible = False



dw_select_org_facility.x = 10000
dw_user.x = 10000
//tab_1.tabpage_analysis.Visible = False  //tab_analysis.tabpage_total_attempts.Visible = False
tab_1.tabpage_net_dev.Visible = False
st_filter.x = 73
ddplb_filters.x = 73
//This.PostEvent( "se_post_event" )


ddplb_filters.DeleteItem( 30 )
ddplb_filters.DeleteItem( 29 )
ddplb_filters.DeleteItem( 27 )
ddplb_filters.DeleteItem( 24 )
ddplb_filters.DeleteItem( 23 )
ddplb_filters.DeleteItem( 22 )
ddplb_filters.DeleteItem( 21 )
ddplb_filters.DeleteItem( 20 )
ddplb_filters.DeleteItem( 5 )
ddplb_filters.DeleteItem( 4 )


//tab_1.tabpage_analysis.tab_analysis.tabpage_exp_appointments.Visible = False
//tab_1.tabpage_analysis.tab_analysis.tabpage_expiring_credentials.Visible = False
//tab_1.tabpage_analysis.tab_analysis.tabpage_audit.Visible = False
Return 1


end function

public function integer of_net_dev_ai_menu ();//maha 062905 called from window.activate and tab1.selectionchanged

//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 2006-11-15 By: Allen
//$<reason> Fix APB Bug: the Toolbar Icon is invalid.
/*
w_mdi.ChangeMenu(m_pfe_cst_net_dev_action_items)
*/
If w_mdi.menuname <> 'm_pfe_cst_net_dev_action_items' Then w_mdi.ChangeMenu( m_pfe_cst_net_dev_action_items )
//---------------------------- APPEON END ----------------------------
m_pfe_cst_net_dev.m_action.m_initiatereappointment.visible = False
gnv_app.of_modify_menu_attr( m_pfe_cst_net_dev.m_action.m_initiatereappointment,'toolbaritemvisible', False)
m_pfe_cst_net_dev.m_view.m_notes.visible = False
gnv_app.of_modify_menu_attr( m_pfe_cst_net_dev.m_view.m_notes,'toolbaritemvisible', False)

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> UM-02
//$<add> 01.20.2006 By: Rodger Wu
//$<reason> The SetToolbarPos function is currently unsupported. 
//$<modification> Replace the SetToolBarPos function with the Appeon defined function of_settoolbarpos to provide
//$<modification> the same functionality.
long ll_handle
ll_handle = handle(w_mdi)
gnv_appeondll.of_settoolbarpos(ll_handle)
//---------------------------- APPEON END ----------------------------

return 1
end function

public function integer of_web_crawl ();str_web_crawler lstr_web_crawler
long ll_cnt
long i
integer s
integer cnt
long ll_code
long ll_test

select lookup_code into :ll_code from code_lookup where code = 'Web' and lookup_name = 'Verification Method';
//should be 16
for i = 1 to tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.rowcount()
	s = tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.getitemnumber(i,"selected")
	ll_test = tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.getitemnumber(i,"verification_method")
	if s = 1 and ll_test = ll_code then
		cnt++
		lstr_web_crawler.sl_prac_ids[i] = tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.getitemnumber(i,"v_full_name_prac_id")
		lstr_web_crawler.si_facility_ids[i] = tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.getitemnumber(i,"verif_info_facility_id")
		//Start Code Change ---- 05.03.2006 #445 maha
		lstr_web_crawler.ss_docid[cnt] = tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.getitemstring(i,"doc_id")
		//End Code Change---05.03.2006
	end if
next

		//open up Web Crawler window and pass structure with prac and facility id(s)
//OpenWithParm(w_web_crawler_verifications, lstr_web_crawler )
		//THIS IS A RESPONSE WINDOW SO DO A RE-RETRIEVE WHEN IT COMES BACK TO
		//UPDATE DATA WINDOW BECAUSE IN MY WEBVIEW WINDOW USERS CAN
		//COMPLETE ACTION ITEMS
//of_Retrieve_Detail( dw_orgs_facilities.GetRow() )
		
return 1
end function

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

public function integer of_batch_recred ();//Start Code Change ----06.10.2008 #V81 maha
long p
long pc
long cnt

long ll_facil
integer ck = 0
gs_batch_search lstr_pracs
datawindow ldw_browse


ldw_browse =  tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse
pc = ldw_browse.rowcount()
//messagebox("Batch recred for 8.5","Testing")
if pc <= 0 then Return -1 //Add by Evan 09/19/2008

//trap for multiple facil
ll_facil =  ldw_browse.getitemnumber(1,"verif_info_facility_id") //***

for p = 1 to pc
	if ll_facil <>  ldw_browse.getitemnumber(p,"verif_info_facility_id") then
		ck = 1
	end if
next

if ck = 1 then
	messagebox("Batch Recred", "The batch recredential function can only be run for one facility at a time.")
	return -1
end if

		

for p = 1 to pc
	if ldw_browse.getitemnumber(p,"selected") = 1 then
		cnt++
		lstr_pracs.li_prac_id[cnt] = ldw_browse.getitemnumber(p,"prac_id") 
		lstr_pracs.ll_facility [cnt] = ll_facil
	end if
next

if cnt = 0 then
	messagebox("Batch Recred", "There are no providers selected.")
	return -1
end if

lstr_pracs.ls_name[1] = "AI"

openwithparm(  w_recred_batch, lstr_pracs)


return 1
end function

on w_action_items.create
int iCurrent
call super::create
this.st_filter=create st_filter
this.ddplb_filters=create ddplb_filters
this.dw_select_org_facility=create dw_select_org_facility
this.dw_user=create dw_user
this.tab_1=create tab_1
this.uo_lights=create uo_lights
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_filter
this.Control[iCurrent+2]=this.ddplb_filters
this.Control[iCurrent+3]=this.dw_select_org_facility
this.Control[iCurrent+4]=this.dw_user
this.Control[iCurrent+5]=this.tab_1
this.Control[iCurrent+6]=this.uo_lights
end on

on w_action_items.destroy
call super::destroy
destroy(this.st_filter)
destroy(this.ddplb_filters)
destroy(this.dw_select_org_facility)
destroy(this.dw_user)
destroy(this.tab_1)
destroy(this.uo_lights)
end on

event activate;call super::activate;IF w_mdi.Menuid <> m_pfe_cst_action_items AND tab_1.SelectedTab <> 4 THEN
	//--------------------------- APPEON BEGIN ---------------------------
	//$<modify> 2006-11-15 By: Allen
	//$<reason> Fix APB Bug: the Toolbar Icon is invalid.
	/*
	w_mdi.ChangeMenu(m_pfe_cst_action_items)
	*/
	
	//--------------------------- APPEON BEGIN ---------------------------
	//$<modify> 04.17.2007 By: Machongmin
	//$<reason> Fix a defect.
	/*
	If w_mdi.menuname <> 'm_pfe_cst_action_items' Then w_mdi.ChangeMenu( m_pfe_cst_action_items )
	*/
	If w_mdi.menuname <> 'm_pfe_cst_action_items' Then 
		w_mdi.ChangeMenu( m_pfe_cst_action_items )
		if gb_contract_version then
			gnv_app.of_modify_menu_attr( m_pfe_cst_action_items.m_view.m_addtlfilters,'toolbaritemvisible', false)
		end if
	else
		if gb_contract_version then
			gnv_app.of_modify_menu_attr( m_pfe_cst_action_items.m_view.m_addtlfilters,'toolbaritemvisible', false)
		end if
	end if
	//---------------------------- APPEON END ----------------------------
	
	//---------------------------- APPEON END ----------------------------
	w_mdi.SetToolbarPos ( 2, 1, 200, False )
	w_mdi.SetToolbarPos ( 3, 1, 200, False )
	inv_action_items.of_enable_action_menu( +&
	tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse , dw_select_org_facility.GetText() ) 
//\/maha 091800 to fix problem of net dev menu showing after closing printletters
elseif w_mdi.Menuid = m_pfe_cst_action_items then
	w_mdi.SetToolbarPos ( 2, 1, 200, False )
	w_mdi.SetToolbarPos ( 3, 1, 200, False )
	inv_action_items.of_enable_action_menu( +&
	tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse , dw_select_org_facility.GetText() ) 
//\maha
ELSE
	//w_mdi.ChangeMenu( m_pfe_cst_net_dev )
	of_net_dev_ai_menu() //maha 062905
END IF

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> UM-03
//$<add> 01.13.2006 By: Rodger Wu
//$<reason> SetToolbarPos is unsupported. 
//$<reason> The SetToolbarPos function is currently unsupported. 
//$<modification> Replace the SetToolBarPos function with the Appeon defined function of_settoolbarpos to provide
//$<modification> the same functionality.
long ll_handle
ll_handle = handle(w_mdi)
gnv_appeondll.of_settoolbarpos(ll_handle)
//---------------------------- APPEON END ----------------------------

w_mdi.of_menu_security( w_mdi.MenuName )



end event

event close;call super::close;//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 2006-11-15 By: Allen
//$<reason> Fix APB Bug: the Toolbar Icon is invalid.
/*
w_mdi.ChangeMenu(m_pfe_cst_mdi_menu)
*/
If w_mdi.menuname <> 'm_pfe_cst_mdi_menu' Then w_mdi.ChangeMenu( m_pfe_cst_mdi_menu )
//---------------------------- APPEON END ----------------------------
Destroy inv_action_items

//w_mdi.iw_action_items_cnt --
gs_fil_screen = ""
gs_fil_batch = ""
gs_fil_status = ""
w_mdi.of_menu_security( w_mdi.MenuName )

IF IsValid( w_capture ) THEN
	Close( w_capture )
END IF
end event

event open;call super::open;IF gb_se_version THEN
	of_se()
END IF

integer set28
idw_active = tab_1.tabpage_analysis.tab_analysis.tabpage_last_attempt.dw_last_attemp_graph

This.x = 1
This.y = 1
This.Width = this.tab_1.width +100//3621
//This.Height = this.tab_1.height + 140 // 2080

st_filter.Visible = False
ddplb_filters.Visible = False

tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.SetFocus( )

//select set_28 into :set28 from icred_settings;
set28 = of_get_app_setting("set_28","I")

if set28 <> 1 AND NOT gb_se_version then
	//inv_action_items.of_filter_graph( ii_facility_id, tab_1.tabpage_analysis.tab_analysis.tabpage_last_attempt.dw_last_attemp_graph, is_user_id )
	tab_1.tabpage_analysis.tab_analysis.tabpage_last_attempt.dw_last_attemp_graph.Event pfc_retrieve()
end if
//mskinner 22 March 2006 -- begin
//inv_action_items.of_set_original_sql( tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse )
//inv_action_items.of_set_original_sql( tab_1.tabpage_analysis.tab_analysis.tabpage_last_attempt.dw_last_attemp_graph)
//mskinner 22 March 2006 -- end
il_total_filter_items = ddplb_filters.TotalItems()

ii_facility_id = 0 //maha 050802
//ddplb_filters.SelectItem( 1 )
//ddplb_filters.TriggerEvent( SelectionChanged! )
//
w_mdi.of_action_items_security( This )

idw_active = tab_1.tabpage_analysis.tab_analysis.tabpage_last_attempt.dw_last_attemp_graph


//--------------------------- APPEON BEGIN ---------------------------
//$<add> 08/21/2007 By: Ken.Guo
//$<reason> Fixed BugA081303. For disable RMB menu.
Tab_1.tabpage_contract.uo_1.tab_1.tabpage_2.dw_details.of_setRMBmenu(False)
Tab_1.tabpage_document_manager.tab_1.tabpage_2.dw_details.of_setRMBmenu(False)
//---------------------------- APPEON END ----------------------------


//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-05
//$<comment> 01.23.2006 By: LeiWei
//$<reason> Performance tuning
//$<modification> Move the following script to the Constructor event of pfc_ia_cst_nv_net_dev_new_action_items.
//$<modification> due to the usage of CreateOnDemand property. Refer to PT-19 for more information.
//tab_1.tabpage_net_dev.uo_net_dev.of_Set_Facility_id( 0 )
//tab_1.tabpage_net_dev.uo_net_dev.of_sql()
//---------------------------- APPEON END ----------------------------

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 08.18.2006 By: LeiWei
//$<reason> Making the Contract Module a Standalone Product.
//03/24/2007 By Jervis move to pfc_postopen
//IF gb_contract_version and  THEN
//	This.tab_1.post selecttab(5)
//END IF
//---------------------------- APPEON END ----------------------------

if gb_contract_version then
	uo_lights.Visible = false
end if

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 01.12.2008 By: Evan
//$<reason> Fix BugJ122702 about Document Manager Tab still displays.
if gnv_data.of_getitem("icred_settings", "set_cont", false) = "0" then
	tab_1.tabpage_document_manager.Hide()
end if
//---------------------------- APPEON END ----------------------------
end event

event pfc_save;
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-06
//$<modify> 03.10.2006 By: LeiWei
//$<reason> Performance tuning
//$<modification> Modify the script to have the application only check the current
//$<modification> tab page before updating the database.
/*
Integer li_cr

li_cr = tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.GetRow()
//tab_1.tabpage_detail.dw_detail.SetItem(li_cr , "selected", 0) 

IF AncestorReturnValue = 1 THEN
	IF lb_response_cd_entered THEN
		tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.Event pfc_Retrieve()
	END IF
	IF tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.RowCount() > ii_cr THEN
		tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.SetRow( ii_cr )
		tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.ScrollToRow( ii_cr )
	END IF
END IF

//m_pfe_cst_action_items.m_file.m_save.Enabled = False

Return AncestorReturnValue
*/
Integer li_retval
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

Integer li_cr

li_cr = tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.GetRow()
//tab_1.tabpage_detail.dw_detail.SetItem(li_cr , "selected", 0) 

IF li_retval = 1 THEN
	IF lb_response_cd_entered THEN
		tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.Event pfc_Retrieve()
	END IF
	IF tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.RowCount() > ii_cr THEN
		tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.SetRow( ii_cr )
		tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.ScrollToRow( ii_cr )
	END IF
END IF

//m_pfe_cst_action_items.m_file.m_save.Enabled = False

Return li_retval
//---------------------------- APPEON END ----------------------------


end event

event pfc_preupdate;call super::pfc_preupdate;ii_cr = tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.GetRow()

Return AncestorReturnValue
end event

event pfc_postupdate;call super::pfc_postupdate;Integer li_rc
Integer i
Integer ll_facility_ids[]
Long ll_prac_ids[]
Integer li_screen_ids[]

// mskinner 20dec 2005 -- begin
if upperbound(ii_facility_ids) < 1 or upperbound(il_prac_ids) < 1 or upperbound(ii_screen_ids) < 1 then 
	return 0
end if 
// mskinner 20dec 2005 -- end


//messagebox("upperbound","li_rc")
//messagebox("upperbound",li_rc)

//--------------------------- APPEON BEGIN ---------------------------
//<ID> PT-07
//$<modify> 04.05.2006 By: LeiWei
//$<reason> Performance tuning
//$<modification> 1)Copy the script in of_is_last_verif and of_is_app_audit_compl to the loop. 
//$<modification> 2)Encapsulate the script into ue_postupdate.
//$<modification> 3)Use Appeon Queue label to reduce client-server interactions.
//$<modification> 4)Call ue_postupdate.
/*
li_rc = UpperBound( ii_facility_ids )
FOR i = 1 TO li_rc
	inv_action_items.of_is_last_verif( ii_facility_ids[ i ], il_prac_ids[ i ] ,ii_screen_ids[i])
	inv_action_items.of_is_app_audit_compl( il_prac_ids[ i ],ii_facility_ids[ i ] )
END FOR
*/

Trigger Event ue_postupdate()

//---------------------------- APPEON END ----------------------------

ii_facility_ids = ll_facility_ids
il_prac_ids = il_prac_ids
ii_screen_ids = li_screen_ids

Return 1

end event

event pfc_postopen;call super::pfc_postopen;String ls_filter_syntax
DataWindowChild dwchild
Integer li_found

//if this is not IntelliApp only then do not use any of this stuff
//IF gs_cust_type <> "I" THEN
//	Return
//END IF
//inv_action_items.of_set_original_sql( tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse )

tab_1.tabpage_net_dev.uo_net_dev.tab_1.tabpage_report.rb_par_sum.visible = false
tab_1.tabpage_net_dev.uo_net_dev.tab_1.tabpage_report.rb_par.visible = false

tab_1.tabpage_net_dev.uo_net_dev.dw_orgs_facilities.SetRow( 1 )
tab_1.tabpage_net_dev.uo_net_dev.dw_orgs_facilities.SelectRow( 0, False )
tab_1.tabpage_net_dev.uo_net_dev.dw_orgs_facilities.SelectRow( 1, True )

tab_1.tabpage_net_dev.uo_net_dev.dw_payors.SetRow( 1 )
tab_1.tabpage_net_dev.uo_net_dev.dw_payors.SelectRow( 0, False )
tab_1.tabpage_net_dev.uo_net_dev.dw_payors.SelectRow( 1, True )

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 08.18.2006 By: LeiWei
//$<reason> Making the Contract Module a Standalone Product.
IF gb_contract_version and this.ii_dashboard_macro <> 104 THEN
	This.tab_1.selecttab(5)
END IF
//---------------------------- APPEON END ----------------------------

CHOOSE CASE ii_dashboard_macro
	//Items over due Today
	CASE 0
		tab_1.SelectTab( 4 )
		tab_1.tabpage_net_dev.uo_net_dev.dw_qf.GetChild( "quick_filter", dwchild )
		li_found = dwchild.Find( "filter_code = 'Items Due TODAY'", 1, 199 )
		ls_filter_syntax = dwchild.GetItemString( li_found, "filter_syntax" )
		tab_1.tabpage_net_dev.uo_net_dev.dw_qf.SetItem( 1, "quick_filter", ls_filter_syntax )
		tab_1.tabpage_net_dev.uo_net_dev.dw_qf.AcceptText( )
		tab_1.tabpage_net_dev.uo_net_dev.of_set_quick_filter( ls_filter_syntax )
		
	//overdue net dev action items
	CASE 1
		tab_1.SelectTab( 4 )
		tab_1.tabpage_net_dev.uo_net_dev.dw_qf.GetChild( "quick_filter", dwchild )
		li_found = dwchild.Find( "filter_code = 'Items Over Due'", 1, 199 )
		ls_filter_syntax = dwchild.GetItemString( li_found, "filter_syntax" )
		tab_1.tabpage_net_dev.uo_net_dev.dw_qf.SetItem( 1, "quick_filter", ls_filter_syntax )
		tab_1.tabpage_net_dev.uo_net_dev.dw_qf.AcceptText( )
		tab_1.tabpage_net_dev.uo_net_dev.of_set_quick_filter( ls_filter_syntax )
		
	CASE 2
		tab_1.SelectTab( 4 )
		tab_1.tabpage_net_dev.uo_net_dev.dw_qf.GetChild( "quick_filter", dwchild )
		li_found = dwchild.Find( "filter_code = 'Applications Needing Printed'", 1, 199 )
		ls_filter_syntax = dwchild.GetItemString( li_found, "filter_syntax" )
		tab_1.tabpage_net_dev.uo_net_dev.dw_qf.SetItem( 1, "quick_filter", ls_filter_syntax )
		tab_1.tabpage_net_dev.uo_net_dev.dw_qf.AcceptText( )		
		tab_1.tabpage_net_dev.uo_net_dev.of_set_quick_filter( ls_filter_syntax )		
	
	//You have # App Rcvd Prac follow letters to send	
	CASE 3
		tab_1.SelectTab( 4 )
		tab_1.tabpage_net_dev.uo_net_dev.dw_qf.GetChild( "quick_filter", dwchild )
		li_found = dwchild.Find( "filter_code = 'Applications Not Back From Provider'", 1, 199 )
		ls_filter_syntax = dwchild.GetItemString( li_found, "filter_syntax" )
		tab_1.tabpage_net_dev.uo_net_dev.dw_qf.SetItem( 1, "quick_filter", ls_filter_syntax )
		tab_1.tabpage_net_dev.uo_net_dev.dw_qf.AcceptText( )		
		tab_1.tabpage_net_dev.uo_net_dev.of_set_quick_filter( ls_filter_syntax )		
		
	//You have # Par Rcvd Payor follow letters to send	
	CASE 4
		tab_1.SelectTab( 4 )
		tab_1.tabpage_net_dev.uo_net_dev.dw_qf.GetChild( "quick_filter", dwchild )
		li_found = dwchild.Find( "filter_code = 'PAR # Not Back From Payor'", 1, 199 )
		ls_filter_syntax = dwchild.GetItemString( li_found, "filter_syntax" )
		tab_1.tabpage_net_dev.uo_net_dev.dw_qf.SetItem( 1, "quick_filter", ls_filter_syntax )
		tab_1.tabpage_net_dev.uo_net_dev.dw_qf.AcceptText( )				
		tab_1.tabpage_net_dev.uo_net_dev.of_set_quick_filter( ls_filter_syntax )		
		
	//You have # Expiring letters to send	
	CASE 5
		tab_1.SelectTab( 2 )
		if gs_cust_type = "I" THEN
			ddplb_filters.SelectItem( 1 ) 
		else
			ddplb_filters.SelectItem( 2 )
		end if

		if gs_cust_type = "I" THEN
			ii_filter_index = 1 
		else
			ii_filter_index = 2
		end if
		

		is_filter = ddplb_filters.Text
		//Start Code Change ---- 03.27.2006 #343 maha
		inv_action_items.of_set_original_sql( tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse )
		//End Code Change---03.27.2006
		is_display_text = inv_action_items.of_filter( ii_org_id, ii_facility_id, is_filter, tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse, is_user_id, ddplb_filters )

		IF is_display_text = "-1" THEN
			Return 
		END IF
		
		This.Event pfc_cst_print_letters()

	//Application Status Report by Practitioner
	CASE 6
		tab_1.SelectTab( 4 )
		tab_1.tabpage_net_dev.uo_net_dev.tab_1.SelectTab( 4 ) 
		
	//Application Status Report by Plan
	CASE 7
		tab_1.SelectTab( 4 )
		tab_1.tabpage_net_dev.uo_net_dev.tab_1.SelectTab( 4 ) 		
		tab_1.tabpage_net_dev.uo_net_dev.ddlb_group_by.SelectItem( 2 )
		tab_1.tabpage_net_dev.uo_net_dev.ddlb_group_by.triggerevent(selectionchanged!)
	//You have # Missing Information Items
	CASE 8 //maha 101204
		tab_1.SelectTab( 4 )
		tab_1.tabpage_net_dev.uo_net_dev.tab_1.SelectTab( 4 ) 
		tab_1.tabpage_net_dev.uo_net_dev.tab_1.tabpage_report.rb_par_sum.checked = true
		tab_1.tabpage_net_dev.uo_net_dev.tab_1.tabpage_report.rb_par_sum.triggerevent(clicked!)
	CASE 10
		tab_1.SelectTab( 2 )
		ddplb_filters.Visible = True
		if gs_cust_type = "I" THEN
			ddplb_filters.SelectItem( 4 ) 
		else
			ddplb_filters.SelectItem( 27 )
		end if
				
		if gs_cust_type = "I" THEN
			ii_filter_index = 4 
		else
			ii_filter_index = 27
		end if
		ii_filter_index = 4

		is_filter = ddplb_filters.Text

		is_display_text = inv_action_items.of_filter( ii_org_id, ii_facility_id, is_filter, tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse, is_user_id, ddplb_filters )

		IF is_display_text = "-1" THEN
			Return 
		END IF
				
END CHOOSE

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 12.07.2006 By: Davis
//$<reason> Go to the appropriate tab within the tab folder depending on the 
//$<reason> module that the To Do list is for.  
//$<reason> The system apply the same filter that is associated with the Action
//$<reason> Item Record Criteria so the that all the detailed Action Items records 
//$<reason> related to the To Do Entry are displayed. 

String ls_sql
CHOOSE CASE ii_dashboard_macro
	CASE 101		//INTELLICRED GO TO Action Items->Action Item Detail
		tab_1.SelectTab( 2 )
		
		IF ii_facility_id = 0 THEN
			IF tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.DataObject <> "d_ver_summary_record_view_for_ai_all" THEN
				tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.DataObject = "d_ver_summary_record_view_for_ai_all"
				tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.SetTransObject( SQLCA )
				inv_action_items.of_set_original_sql( tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse )
			END IF
		ELSE
			IF tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.DataObject <> "d_ver_summary_record_view_for_ai" THEN
				tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.DataObject = "d_ver_summary_record_view_for_ai"
				tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.SetTransObject( SQLCA )
				inv_action_items.of_set_original_sql( tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse )
			END IF	
		END IF

		ls_sql = inv_action_items.of_get_original_sql( tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse )

		// use 1=1 instead of action_status is null
		Integer li_pos
		li_pos = POS(Lower(ls_sql), Lower("verif_info.response_code IS NULL"))
		IF li_pos > 0 THEN
			ls_sql = Left(ls_sql, li_pos - 1) + "1=1" + Mid(ls_sql, li_pos + 32)
		END IF

		IF f_validstr(ii_dashboard_where) THEN ls_sql = ls_sql + " AND " + ii_dashboard_where

		tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.SetTransObject( SQLCA )
		tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.Modify('DataWindow.Table.Select="' + ls_sql + '"')
		tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.Setfilter( "" )
		tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.Event pfc_Retrieve( )

	CASE 102		//INTELLIAPP GO TO Action Items->Application Status
		tab_1.SelectTab( 4 )
		
		ls_sql = tab_1.tabpage_net_dev.uo_net_dev.is_sql
		IF f_validstr(ii_dashboard_where) THEN ls_sql = ls_sql + " AND " + ii_dashboard_where
		tab_1.tabpage_net_dev.uo_net_dev.dw_qf.POST SetItem( 1, "quick_filter", "" )
		tab_1.tabpage_net_dev.uo_net_dev.tab_1.tabpage_ai.dw_net_dev.POST Modify('DataWindow.Table.Select="' + ls_sql + '"')
		tab_1.tabpage_net_dev.uo_net_dev.tab_1.tabpage_ai.dw_net_dev.POST Setfilter( "" )
		tab_1.tabpage_net_dev.uo_net_dev.tab_1.tabpage_ai.dw_net_dev.POST Retrieve( )
	CASE 103		//Contract Logix GO TO Action Items->Contract
		tab_1.SelectTab( 5 )
		//tab_1.tabpage_document_manager.visible = false
		tab_1.tabpage_contract.uo_1.tab_1.SelectTab( 2 )
		
		Long ll_null
		SetNull(ll_null)
		u_tabpage_ctx_ai_details lu_ctx_actionitem
		lu_ctx_actionitem = tab_1.tabpage_contract.uo_1.tab_1.tabpage_2
		//lu_ctx_actionitem = tab_1.tabpage_contract.uo_1.tab_1.tabpage_2
		lu_ctx_actionitem.of_reset_details( lu_ctx_actionitem.astr_sql)
		IF f_validstr(ii_dashboard_where) THEN lu_ctx_actionitem.astr_sql[1].s_where += " AND " + ii_dashboard_where
		lu_ctx_actionitem.dw_details.Modify('DataWindow.Table.Select="' + lu_ctx_actionitem.inv_cst_sql.of_Assemble(lu_ctx_actionitem.astr_sql) + '"')
		//lu_ctx_actionitem.dw_1.setItem(1,'ctx_id',ll_null)
		lu_ctx_actionitem.dw_details.setfilter( "" )
		lu_ctx_actionitem.dw_details.retrieve()	
	//--------------------------- APPEON BEGIN ---------------------------
	//$<modify> 03.22.2007 By: Machongmin
	//$<reason> Fix a defect.
	CASE 104
		string ls_temp,ls_where
		
		tab_1.SelectTab(6)
		//tab_1.tabpage_contract.visible = false
		tab_1.tabpage_document_manager.tab_1.post selecttab(2)
		tab_1.tabpage_document_manager.tab_1.tabpage_1.dw_1.settransobject(sqlca)

		SetNull(ll_null)
		u_tabpage_ctx_doc_details lu_ctx_actionitem_doc
		//u_tabpage_ctx_doc_graph   lu_ctx_actionitem_doc_graph
		
		lu_ctx_actionitem_doc = tab_1.tabpage_document_manager.tab_1.tabpage_2
		lu_ctx_actionitem_doc.of_reset_details( lu_ctx_actionitem_doc.astr_sql)
		IF f_validstr(ii_dashboard_where) THEN lu_ctx_actionitem_doc.astr_sql[1].s_where += " AND " + ii_dashboard_where
		
		ls_temp = lu_ctx_actionitem_doc.inv_cst_sql.of_Assemble(lu_ctx_actionitem_doc.astr_sql)
		lu_ctx_actionitem_doc.dw_details.Modify('DataWindow.Table.Select="' + ls_temp + '"')
		
		/*
		ls_where = lu_ctx_actionitem_doc.astr_sql[1].s_where
		if len(ls_where ) > 0 then
			ls_temp = "SELECT COUNT_1 = COUNT(1), letter_status = 'Awaiting Response' FROM ctx_am_action_item,wf_action_types,code_lookup,ctx_am_document  WHERE " + ls_where + " and not (ctx_am_action_item.print_flag >= 0 ) union SELECT COUNT_1 = COUNT(1), letter_status = ' Needs Processing' FROM ctx_am_action_item,wf_action_types,code_lookup,ctx_am_document  WHERE  " + ls_where + " and  ctx_am_action_item.print_flag >= 0"
		else
			ls_temp = "SELECT COUNT_1 = COUNT(1), letter_status = 'Awaiting Response' FROM ctx_am_action_item,wf_action_types,code_lookup,ctx_am_document  WHERE not (ctx_am_action_item.print_flag >= 0 ) union SELECT COUNT_1 = COUNT(1), letter_status = ' Needs Processing' FROM  ctx_am_action_item,wf_action_types,code_lookup,ctx_am_document  WHERE ctx_am_action_item.print_flag >= 0"
		end if
		tab_1.tabpage_document_manager.tab_1.tabpage_1.dw_1.setsqlselect(ls_temp)
		*/
		lu_ctx_actionitem_doc.dw_details.setfilter("")
		lu_ctx_actionitem_doc.dw_details.retrieve()	
		
		/*
		tab_1.tabpage_document_manager.tab_1.tabpage_1.dw_1.setfilter("")
		tab_1.tabpage_document_manager.tab_1.tabpage_1.dw_1.retrieve()
		*/
	//---------------------------- APPEON END ----------------------------	
END CHOOSE

//---------------------------- APPEON END ----------------------------

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 01.14.2008 By: Evan  ;Ken.Guo 2008-04-10
//$<reason> Fix BugG122503 about the Analysis tab still displays.
integer li_VisibleTab
integer li_SelectedTab

li_SelectedTab = tab_1.SelectedTab
if (li_SelectedTab = 1 and not tab_1.tabpage_analysis.Visible) or &
   (li_SelectedTab = 2 and not tab_1.tabpage_detail.Visible) or &
   (li_SelectedTab = 3 and not tab_1.tabpage_ready.Visible) or &
   (li_SelectedTab = 4 and not tab_1.tabpage_net_dev.Visible) or &
   (li_SelectedTab = 5 and not tab_1.tabpage_contract.Visible) or &
   (li_SelectedTab = 6 and not tab_1.tabpage_document_manager.Visible) &
then
	if tab_1.tabpage_analysis.Visible then
		li_VisibleTab = 1
	elseif tab_1.tabpage_detail.Visible then 
		li_VisibleTab = 2
	elseif tab_1.tabpage_ready.Visible then
		li_VisibleTab = 3
	elseif tab_1.tabpage_net_dev.Visible then
		li_VisibleTab = 4
	elseif tab_1.tabpage_contract.Visible then
		li_VisibleTab = 5
	elseif tab_1.tabpage_document_manager.Visible then
		li_VisibleTab = 6
	else
		li_VisibleTab = 0
	end if
	if li_VisibleTab > 0 then tab_1.SelectTab(li_VisibleTab)
end if
//---------------------------- APPEON END ----------------------------
end event

event pfc_preopen;call super::pfc_preopen;//Added by Alan on 2008-12-30
//BugS040903
long i

this.of_SetResize(true)
this.inv_resize.of_SetOrigSize(3611,2188)

this.inv_resize.of_Register(tab_1, this.inv_resize.scale)
this.inv_resize.of_Register(uo_lights, this.inv_resize.scale)
this.inv_resize.of_Register(dw_select_org_facility, this.inv_resize.scale)
this.inv_resize.of_Register(dw_user, this.inv_resize.scale)
this.inv_resize.of_Register(ddplb_filters, this.inv_resize.scale)
this.inv_resize.of_Register(st_filter, this.inv_resize.scale)
//contract
this.inv_resize.of_Register(tab_1.tabpage_contract.uo_1, this.inv_resize.scale)
this.inv_resize.of_Register(tab_1.tabpage_contract.uo_1.tab_1, this.inv_resize.scale)
////document
//this.inv_resize.of_Register(tab_1.tabpage_document_manager.tab_1, this.inv_resize.scale)


end event

type st_filter from statictext within w_action_items
boolean visible = false
integer x = 1833
integer y = 160
integer width = 283
integer height = 52
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
string text = "Select Filter"
boolean focusrectangle = false
end type

type ddplb_filters from dropdownpicturelistbox within w_action_items
event after_select ( )
boolean visible = false
integer x = 1769
integer y = 216
integer width = 1719
integer height = 1752
integer taborder = 10
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 16777215
boolean allowedit = true
boolean sorted = false
boolean vscrollbar = true
string item[] = {"TO BE PRINTED                 Verifications Letters","                                             Expiring Credential Letters","                                             Exp. Appt. Letters","                                             Exp. Provisional. Letters","                                             Exp. Allied Health Letters","                                             Practitioner Correspondence Letters","                                             All Credential Letters Needing Reprinting","AWAITING RESPONSE      Verification  Letters","                                             Expiring Credential  Letters","                                             Practitioner  Correspondence","                                             Expiring Appointments","NPDB                                   NPDB Queries To Be Exported","                                             NPDB Queries Previously Exported","VERIFICATIONS                  WEB","                                             CALLS","                                             COMPENDIUM","                                             HARD COPY","EXPIRING ELEMENTS        All Expiring Appointments","                                             All Expiring Credentials","RED FLAG                           Verifications In Process 120+","HIGH PRIORITY                 High Priority Action Items","MAXED ATTEMPTS           Verification letters at max attempts","DOC-ID                                Find Document","","OIG                                     OIG Queries To Be Scanned","                                           OIG Queries Flagged","APPLICATION AUDIT          Missing Items","PRACTITIONER                  All Action Items For A Practitioner","FSMB                                   FSMB Queries To Be Exported","                                             FSMB Queries Previously Exported","MISS ITEM 90    Application Audit Missing Items 90 days To Be Printed","                           Application Audit Missing Items 90 days Awaiting Response"}
borderstyle borderstyle = stylelowered!
integer itempictureindex[] = {1,0,0,0,0,0,0,16,0,0,0,2,0,13,0,0,0,14,0,12,1,18,11,0,4,0,10,7,9,0,8,0}
string picturename[] = {"Custom002!","Export!","Globals!","EditDataGrid!","Custom026!","Custom073!","Custom076!","EditDataTabular!","Custom079!","DosEdit5!","Custom083!","redflag.bmp","Custom038!","Watcom!","Custom023!","Custom025!","ViewPainter!","Count!","DeleteWatch!"}
long picturemaskcolor = 16777215
end type

event after_select;This.Text = is_display_text


end event

event selectionchanged;Integer li_picture_index
Integer li_index
Integer li_index_1
Integer i

//debugbreak()
//mskinner 22 March 2006 -- begin
// moved from the open event to prevent crash
if not ib_original_sql_set then 
   inv_action_items.of_set_original_sql( tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse )
	ib_original_sql_set =  true
end if
//mskinner 22 March 2006 -- begin
ii_filter_index = index

is_filter = ddplb_filters.Text

is_display_text = inv_action_items.of_filter( ii_org_id, ii_facility_id, is_filter, tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse, is_user_id, ddplb_filters )

//of_filter_by_intellibatch(tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse)

IF is_display_text = "-1" THEN
	Return 1
END IF

tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.SetFocus()

This.PostEvent( "after_select" )

Return 0
end event

event constructor;//--------------------------- APPEON BEGIN ---------------------------
//$<add> 2006-10-17 By: Rodger Wu (Inova)
//$<reason> Add two filter items in this object.

//---------------------------- APPEON END ----------------------------

end event

type dw_select_org_facility from pfc_cst_u_org_facility_selector_horiz within w_action_items
integer x = 64
integer y = 144
integer width = 1211
integer height = 164
integer taborder = 50
boolean border = false
borderstyle borderstyle = stylebox!
end type

event itemchanged;call super::itemchanged;Integer i
Integer li_rc
Integer li_dummy_array[]
DatawindowChild dwchild

ii_facility_ids_all = li_dummy_array

AcceptText()
//debugbreak()
IF This.GetColumnName() = "facility_id" THEN
	ii_facility_id = Integer( data )
	tab_1.tabpage_net_dev.uo_net_dev.of_Set_Facility_id( ii_facility_id )
END IF
// ii_facility_id, tab_1.tabpage_analysis.tab_analysis.tabpage_audit.dw_app_audit_graph
CHOOSE CASE tab_1.SelectedTab
	//analysis graphs
	CASE 1
		of_graph_case(tab_1.tabpage_analysis.tab_analysis.SelectedTab)
//		CHOOSE CASE tab_1.tabpage_analysis.tab_analysis.SelectedTab
//			//verification status
//			CASE 1
//				inv_action_items.of_filter_graph( ii_facility_id, tab_1.tabpage_analysis.tab_analysis.tabpage_last_attempt.dw_last_attemp_graph, is_user_id )
//			//total attempts
//			CASE 2
//				inv_action_items.of_filter_graph( ii_facility_id, tab_1.tabpage_analysis.tab_analysis.tabpage_total_attempts.dw_total_attempts, is_user_id )
//			
//			//expiring credentials
//			CASE 3
//				inv_action_items.of_filter_graph( ii_facility_id, tab_1.tabpage_analysis.tab_analysis.tabpage_expiring_credentials.dw_expiring_credential_graph, is_user_id )
//			//expiring appointments	
//			CASE 4
//				inv_action_items.of_filter_graph( ii_facility_id, tab_1.tabpage_analysis.tab_analysis.tabpage_exp_appointments.dw_expiring_appointments_graph, is_user_id )
//			CASE 5
//				inv_action_items.of_filter_graph( ii_facility_id, tab_1.tabpage_analysis.tab_analysis.tabpage_audit.dw_app_audit_graph, is_user_id )
//		END CHOOSE
	//action item detail tab
	CASE 2
		inv_action_items.of_filter( ii_org_id, ii_facility_id, is_filter, tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse, is_user_id, ddplb_filters)	
		//of_filter_by_intellibatch(tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse)
	CASE 3
		of_get_ready_for_committee()
		of_filter_by_intellibatch(tab_1.tabpage_ready.tab_ready.tabpage_ready_to_send.dw_ready)
		of_filter_by_intellibatch(tab_1.tabpage_ready.tab_ready.tabpage_sent_to_comm.dw_sent_to_comm)
	CASE 4
		tab_1.tabpage_net_dev.uo_net_dev.of_Retrieve_Detail( ii_facility_id )
	//	of_filter_by_intellibatch(tab_1.tabpage_net_dev.tabpage_browse.dw_browse)
END CHOOSE

idw_active.SetFocus()
end event

event constructor;call super::constructor;AcceptText()

IF gs_cust_type = "CVO" THEN
	This.Modify( "facilities_t.text = 'Customer'" )
ELSEIF gs_cust_type = "INTELLIAPP" THEN
	This.Modify( "facilities_t.text = 'Payor/Hospital'" )
END IF
end event

type dw_user from pfc_cst_u_user_selector within w_action_items
integer x = 1280
integer y = 148
integer width = 475
integer height = 172
integer taborder = 40
boolean border = false
borderstyle borderstyle = stylebox!
end type

event itemchanged;AcceptText()
is_user_id =  GetText()


CHOOSE CASE tab_1.SelectedTab
	//last attemp graph tab
	CASE 1
		of_graph_case(tab_1.tabpage_analysis.tab_analysis.SelectedTab)
//		CHOOSE CASE tab_1.tabpage_analysis.tab_analysis.SelectedTab
//			//verification status
//			CASE 1
//				inv_action_items.of_filter_graph( ii_facility_id, tab_1.tabpage_analysis.tab_analysis.tabpage_last_attempt.dw_last_attemp_graph, is_user_id )
//				//total attempts
//			CASE 2
//				inv_action_items.of_filter_graph( ii_facility_id, tab_1.tabpage_analysis.tab_analysis.tabpage_total_attempts.dw_total_attempts, is_user_id )
//			
//			CASE 3
//				inv_action_items.of_filter_graph( ii_facility_id, tab_1.tabpage_analysis.tab_analysis.tabpage_expiring_credentials.dw_expiring_credential_graph, is_user_id )
//			//expiring appointments	
//			CASE 4
//				inv_action_items.of_filter_graph( ii_facility_id, tab_1.tabpage_analysis.tab_analysis.tabpage_exp_appointments.dw_expiring_appointments_graph, is_user_id )
//			CASE 5
//				inv_action_items.of_filter_graph( ii_facility_id, tab_1.tabpage_analysis.tab_analysis.tabpage_audit.dw_app_audit_graph, is_user_id )
//		END CHOOSE		
	//action item detail tab
	CASE 2
		inv_action_items.of_filter( ii_org_id, ii_facility_id, is_filter, tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse, is_user_id, ddplb_filters)
END CHOOSE

idw_active.SetFocus()



end event

event constructor;call super::constructor;This.SetItem( 1, "user_id", "All" )


end event

event getfocus;



end event

type tab_1 from tab within w_action_items
event create ( )
event destroy ( )
event u_post_selection_changed ( )
integer x = 14
integer y = 32
integer width = 3552
integer height = 2116
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
boolean createondemand = true
alignment alignment = center!
integer selectedtab = 1
tabpage_analysis tabpage_analysis
tabpage_detail tabpage_detail
tabpage_ready tabpage_ready
tabpage_net_dev tabpage_net_dev
tabpage_contract tabpage_contract
tabpage_document_manager tabpage_document_manager
end type

on tab_1.create
this.tabpage_analysis=create tabpage_analysis
this.tabpage_detail=create tabpage_detail
this.tabpage_ready=create tabpage_ready
this.tabpage_net_dev=create tabpage_net_dev
this.tabpage_contract=create tabpage_contract
this.tabpage_document_manager=create tabpage_document_manager
this.Control[]={this.tabpage_analysis,&
this.tabpage_detail,&
this.tabpage_ready,&
this.tabpage_net_dev,&
this.tabpage_contract,&
this.tabpage_document_manager}
end on

on tab_1.destroy
destroy(this.tabpage_analysis)
destroy(this.tabpage_detail)
destroy(this.tabpage_ready)
destroy(this.tabpage_net_dev)
destroy(this.tabpage_contract)
destroy(this.tabpage_document_manager)
end on

event u_post_selection_changed();tab_1.tabpage_net_dev.uo_net_dev.dw_orgs_facilities.setrow(1)
tab_1.tabpage_net_dev.uo_net_dev.dw_orgs_facilities.selectrow(0,false)
tab_1.tabpage_net_dev.uo_net_dev.dw_orgs_facilities.selectrow(1,true)
	
end event

event selectionchanged;//Start Code Change ----04.22.2008 #V8 maha - rewrote code to be easier to read;  old code below
long ll_handle

SetPointer(HourGlass!)

w_mdi.SetRedraw(False)

If w_mdi.menuname <> 'm_pfe_cst_action_items' Then 
	w_mdi.ChangeMenu( m_pfe_cst_action_items )
	if gb_contract_version then
		gnv_app.of_modify_menu_attr( m_pfe_cst_action_items.m_view.m_addtlfilters,'toolbaritemvisible', false)
	end if
else
	if gb_contract_version then
		gnv_app.of_modify_menu_attr( m_pfe_cst_action_items.m_view.m_addtlfilters,'toolbaritemvisible', false)
	end if
end if

//set user; facility; filter dws visible
choose case newindex
	case 1
		dw_user.Visible = True
		dw_select_org_facility.Visible = True
		st_filter.Visible = False
		ddplb_filters.Visible = False
	case 2
		dw_user.Visible = True
		dw_select_org_facility.Visible = True
		st_filter.Visible = True
		ddplb_filters.Visible = True
		tab_1.tabpage_detail.tab_view.SelectedTab = 1 
	case 3
		//dw_user.Visible = True
		dw_user.Visible = false	//04.29.2008 By Jervis
		dw_select_org_facility.Visible = True
		st_filter.Visible = False
		ddplb_filters.Visible = False
	case 4
		dw_user.Visible = False
		dw_select_org_facility.Visible = False
		st_filter.Visible = False
		ddplb_filters.Visible = False
	case 5
		dw_user.Visible = False
		dw_select_org_facility.Visible = False
		st_filter.Visible = False
		ddplb_filters.Visible = False
	case 6
		dw_user.Visible = False
		dw_select_org_facility.Visible = False
		st_filter.Visible = False
		ddplb_filters.Visible = False
end choose

//tab specific menus and actions
IF newindex = 1 THEN // Graphs
	gnv_app.of_modify_menu_attr( m_pfe_cst_action_items.m_action.m_printallletters,'Enabled', False)
	gnv_app.of_modify_menu_attr( m_pfe_cst_action_items.m_action.m_exportdata,'Enabled', False)
	gnv_app.of_modify_menu_attr( m_pfe_cst_action_items.m_action.m_connecttoweb,'Enabled', False)
	gnv_app.of_modify_menu_attr( m_pfe_cst_action_items.m_action.m_phonedialer,'Enabled', False)	
	gnv_app.of_modify_menu_attr( m_pfe_cst_action_items.m_action.m_editverificationdata,'Enabled', False)
ELSE
	inv_action_items.of_enable_action_menu( tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse,"1" )	
END IF

IF newindex = 2 THEN // batch update tool
	gnv_app.of_modify_menu_attr( m_pfe_cst_action_items.m_action.m_batchresponse,'Enabled', True)
ELSE
	gnv_app.of_modify_menu_attr( m_pfe_cst_action_items.m_action.m_batchresponse,'Enabled', False)	
END IF

IF newindex = 3 THEN  //Committee
	dw_select_org_facility.DeleteRow( 0 )
	dw_select_org_facility.InsertRow( 1 )
	dw_select_org_facility.SetItem( 1, "facility_id", 0 )
	of_get_ready_for_committee()
	of_filter_by_intellibatch(tab_1.tabpage_ready.tab_ready.tabpage_ready_to_send.dw_ready)
	of_filter_by_intellibatch(tab_1.tabpage_ready.tab_ready.tabpage_sent_to_comm.dw_sent_to_comm)
end if

IF newindex = 4 THEN //Application Status
	of_net_dev_ai_menu() 
	
	if ib_netdev_retr = false then
		tab_1.tabpage_net_dev.uo_net_dev.of_set_facility_id( 0 )
		tab_1.tabpage_net_dev.uo_net_dev.ib_retr_for_aciton_item = true
		tab_1.tabpage_net_dev.uo_net_dev.dw_orgs_facilities.Retrieve( gs_user_id )
		tab_1.tabpage_net_dev.uo_net_dev.ib_retr_for_aciton_item = false
		postevent( "u_post_selection_changed")
		ib_netdev_retr = true
	end if
	
	of_filter_by_intellibatch(tab_1.tabpage_net_dev.uo_net_dev.tab_1.tabpage_ai.dw_net_dev)
ELSE
	w_mdi.SetToolbarPos ( 2, 1, 200, False )
	w_mdi.SetToolbarPos ( 3, 1, 200, False )
	inv_action_items.of_enable_action_menu( +&
	tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse , dw_select_org_facility.GetText() ) 
END IF

//Contracts code
ll_handle = handle(w_mdi)
gnv_appeondll.of_settoolbarpos(ll_handle)

IF newindex = 5  THEN
	dw_select_org_facility.Visible = False
	dw_user.Visible = False
   TAb_1.TABpage_contract.uo_1.Tab_1.TABpage_1.DW_1.event pfc_retrieve( )
elseif newindex = 6 then
	dw_select_org_facility.Visible = False
	dw_user.Visible = False
   TAb_1.Tabpage_document_manager.Tab_1.TABpage_1.DW_1.event pfc_retrieve( )
end if
	
// the following code is needed o that we know for sure that we are in the contract module or not
if newindex = 5 then
	gnv_app.of_modify_menu_attr( m_pfe_cst_action_items.m_action.m_printallletters,'Enabled', False)
	m_pfe_cst_action_items.m_action.m_printallletters.tag = 'Contract'
	gnv_app.of_modify_menu_attr( m_pfe_cst_action_items.m_action.m_printallletters,'toolbaritemname', 'Module-Contract- Contact.bmp')
elseif newindex = 6 then
	gnv_app.of_modify_menu_attr( m_pfe_cst_action_items.m_action.m_printallletters,'Enabled', False)
	m_pfe_cst_action_items.m_action.m_printallletters.tag = 'Document'
	gnv_app.of_modify_menu_attr( m_pfe_cst_action_items.m_action.m_printallletters,'toolbaritemname', 'Module-Contract- Contact.bmp')
else 
	if w_mdi.menuname = 'm_pfe_cst_action_items' then 
	m_pfe_cst_action_items.m_action.m_printallletters.tag = ''
	gnv_app.of_modify_menu_attr( m_pfe_cst_action_items.m_action.m_printallletters,'toolbaritemname', 'Custom002!')
	end if

end if 

w_mdi.of_menu_security( w_mdi.MenuName )
w_mdi.SetRedraw(True)



//@@@@@@@@@@@@  code 042208 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
//SetPointer(HourGlass!)
////dw_user.Visible = True
//
//w_mdi.SetRedraw(False)
////--------------------------- APPEON BEGIN ---------------------------
////$<modify> 2006-11-15 By: Allen
////$<reason> Fix APB Bug: the Toolbar Icon is invalid.
///*
//w_mdi.ChangeMenu(m_pfe_cst_action_items)
//*/
////--------------------------- APPEON BEGIN ---------------------------
////$<modify> 04.17.2007 By: Machongmin
////$<reason> Fix a defect.
///*
//If w_mdi.menuname <> 'm_pfe_cst_action_items' Then w_mdi.ChangeMenu( m_pfe_cst_action_items )
//*/
//If w_mdi.menuname <> 'm_pfe_cst_action_items' Then 
//	w_mdi.ChangeMenu( m_pfe_cst_action_items )
//	if gb_contract_version then
//		m_pfe_cst_action_items.m_view.m_addtlfilters.toolbaritemvisible = false
//	end if
//else
//	if gb_contract_version then
//		m_pfe_cst_action_items.m_view.m_addtlfilters.toolbaritemvisible = false
//	end if
//end if
////---------------------------- APPEON END ----------------------------
////---------------------------- APPEON END ----------------------------
//	
////dw_select_org_facility.Modify( "facilities_t.text='Select Verifying Facility'")//removed 011403 maha 
////completed apps
//IF newindex = 3 THEN
//	st_filter.Visible = False
//	ddplb_filters.Visible = False
//	dw_user.Visible = False
//	dw_select_org_facility.DeleteRow( 0 )
//	dw_select_org_facility.InsertRow( 1 )
//	dw_select_org_facility.SetItem( 1, "facility_id", 0 )
//	of_get_ready_for_committee()
//	of_filter_by_intellibatch(tab_1.tabpage_ready.tab_ready.tabpage_ready_to_send.dw_ready)
//	of_filter_by_intellibatch(tab_1.tabpage_ready.tab_ready.tabpage_sent_to_comm.dw_sent_to_comm)
//	//dw_select_org_facility.Modify( "facilities_t.text='Select Parent Facility'")	//removed 011403 maha
//	//if not = to action item detail
//ELSEIF newindex <> 2 THEN
//	st_filter.Visible = False
//	ddplb_filters.Visible = False
//ELSE
//	tab_1.tabpage_detail.tab_view.SelectedTab = 1 	
//	st_filter.Visible = True
//	ddplb_filters.Visible = True
//END IF
//
//IF newindex = 1 THEN
//	m_pfe_cst_action_items.m_action.m_printallletters.Enabled = False
//	m_pfe_cst_action_items.m_action.m_exportdata.Enabled = False
//	m_pfe_cst_action_items.m_action.m_connecttoweb.Enabled = False
//	m_pfe_cst_action_items.m_action.m_phonedialer.Enabled = False	
//	m_pfe_cst_action_items.m_action.m_editverificationdata.Enabled = False
//ELSE
//	inv_action_items.of_enable_action_menu( tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse,"1" )	
//END IF
//
//IF newindex = 2 THEN //maha 072803 for batchupdate tool
//	m_pfe_cst_action_items.m_action.m_batchresponse.Enabled = True
//ELSE
//	m_pfe_cst_action_items.m_action.m_batchresponse.Enabled = False	
//END IF
//
//
//IF newindex = 4 THEN
//	//dw_select_org_facility.Visible = False
//	dw_user.Visible = False
//	of_net_dev_ai_menu() //maha 062905
////	w_mdi.ChangeMenu( m_pfe_cst_net_dev_action_items )	
////	m_pfe_cst_net_dev.m_action.m_initiatereappointment.visible = False
////	m_pfe_cst_net_dev.m_action.m_initiatereappointment.toolbaritemvisible = False
////	m_pfe_cst_net_dev.m_view.m_notes.visible = False
////	m_pfe_cst_net_dev.m_view.m_notes.toolbaritemvisible = False
//	//dw_select_org_facility.Modify( "facilities_t.text='Select Parent Facility'")
//	dw_select_org_facility.Visible = False
//	//Start Code Change ---- 03.15.2006 #329 maha
//	if ib_netdev_retr = false then
//		tab_1.tabpage_net_dev.uo_net_dev.of_set_facility_id( 0 )
//
//		//--------------------------- APPEON BEGIN ---------------------------
//		//$<ID> PT-08
//		//$<modify> 04.13.2006 By: LeiWei
//		//$<reason> Performance tuning
//		//$<modification> Modify the script to ensure when retrieving data for dw_orgs_facilities
//		//$<modification> the RowFocusChanged event will not be changed.
//		//tab_1.tabpage_net_dev.uo_net_dev.dw_orgs_facilities.Retrieve( gs_user_id )
//		tab_1.tabpage_net_dev.uo_net_dev.ib_retr_for_aciton_item = true
//		tab_1.tabpage_net_dev.uo_net_dev.dw_orgs_facilities.Retrieve( gs_user_id )
//		tab_1.tabpage_net_dev.uo_net_dev.ib_retr_for_aciton_item = false
//		//---------------------------- APPEON END ----------------------------
//		
//		postevent( "u_post_selection_changed")
//		//tab_1.tabpage_net_dev.uo_net_dev.of_set_facility_id( -99 )
//		ib_netdev_retr = true
//	end if
//	//End Code Change---03.15.2006
//	of_filter_by_intellibatch(tab_1.tabpage_net_dev.uo_net_dev.tab_1.tabpage_ai.dw_net_dev)
//ELSE
//	//dw_select_org_facility.Visible = True
//	w_mdi.SetToolbarPos ( 2, 1, 200, False )
//	w_mdi.SetToolbarPos ( 3, 1, 200, False )
//	inv_action_items.of_enable_action_menu( +&
//	tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse , dw_select_org_facility.GetText() ) 
//END IF
//
////--------------------------- APPEON BEGIN ---------------------------
////$<ID> UM-04
////$<add> 01.13.2006 By: Rodger Wu
////$<reason> The SetToolbarPos function is currently unsupported. 
////$<modification> Replace the SetToolBarPos function with the Appeon defined function of_settoolbarpos to provide
////$<modification> the same functionality.
//long ll_handle
//ll_handle = handle(w_mdi)
//gnv_appeondll.of_settoolbarpos(ll_handle)
////---------------------------- APPEON END ----------------------------
//
//// start code change --- 11.14.2005 MSKINNER
//IF newindex = 5  THEN
//	dw_select_org_facility.Visible = False
//	dw_user.Visible = False
//   TAb_1.TABpage_contract.uo_1.Tab_1.TABpage_1.DW_1.event pfc_retrieve( )
//elseif newindex = 6 then
//	dw_select_org_facility.Visible = False
//	dw_user.Visible = False
//   TAb_1.Tabpage_document_manager.Tab_1.TABpage_1.DW_1.event pfc_retrieve( )
//end if
//	
//
//// the followwing code is needed o that weG82know for sure that we are in the 
//// contract module or not
//if newindex = 5 then
//	//m_pfe_cst_action_items.m_action.m_printallletters.tag = 'Contract'
//   m_pfe_cst_action_items.m_action.m_printallletters.Enabled = False
//	m_pfe_cst_action_items.m_action.m_printallletters.tag = 'Contract'
//	m_pfe_cst_action_items.m_action.m_printallletters.toolbaritemname = 'Module-Contract- Contact.bmp'
//elseif newindex = 6 then
//	m_pfe_cst_action_items.m_action.m_printallletters.Enabled = False
//	m_pfe_cst_action_items.m_action.m_printallletters.tag = 'Document'
//	m_pfe_cst_action_items.m_action.m_printallletters.toolbaritemname = 'Module-Contract- Contact.bmp'
//else 
//	if w_mdi.menuname = 'm_pfe_cst_action_items' then 
//	m_pfe_cst_action_items.m_action.m_printallletters.tag = ''
//	m_pfe_cst_action_items.m_action.m_printallletters.toolbaritemname= 'Custom002!'
//	end if
//
//end if 
//
//// end code change --- 11.14.2005 MSKINNER
//w_mdi.of_menu_security( w_mdi.MenuName )
//w_mdi.SetRedraw(True)
end event

event selectionchanging;IF Parent.Event pfc_save() < 0 THEN
	Return 1
END IF
end event

event constructor;/******************************************************************************************************************
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
**  Created By	: Michael B. Skinner 25 October 2005  ?Intellisoftgroup, Inc
**==================================================================================================================
**  Modification Log
**   Changed By             Change Date                                               Reason
** ------------------------------------------------------------------------------------------------------------------
********************************************************************************************************************/

inv_data_entry = CREATE pfc_cst_nv_data_entry_functions
inv_action_items = CREATE pfc_n_cst_ai_action_items 


long ll_count
//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 03.18.2006 By: Cao YongWang
//$<reason> The sys.systable table not exists in SQL Server,
//$<reason> Replace it with v_systable if the appliation running in SQL Server.
/*
select count(*)
into :ll_count
from sys.systable 
where table_name='CTX_BASIC_INFO' ;
*/
Choose Case gs_dbType
	Case 'ASA'
		select count(*) into :ll_count from sys.systable where table_name = 'CTX_BASIC_INFO';
	Case 'SQL'
		select count(*) into :ll_count from v_systable where table_name = 'CTX_BASIC_INFO';
End Choose
//---------------------------- APPEON END ----------------------------

	  
if of_get_app_setting("set_cont","I") = 0 or ll_count < 1 then
		 this.tabpage_contract.visible=  false
	else 
		//this.tabpage_contract.visible=  true
		this.tabpage_contract.uo_1.tab_1.tabpage_1.dw_1.settransobject( sqlca)
		this.tabpage_contract.uo_1.tab_1.of_retrive( )
end if
end event

type tabpage_analysis from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 3515
integer height = 1988
long backcolor = 79741120
string text = "Analysis"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "Graph!"
long picturemaskcolor = 12632256
tab_analysis tab_analysis
st_msg st_msg
end type

on tabpage_analysis.create
this.tab_analysis=create tab_analysis
this.st_msg=create st_msg
this.Control[]={this.tab_analysis,&
this.st_msg}
end on

on tabpage_analysis.destroy
destroy(this.tab_analysis)
destroy(this.st_msg)
end on

type tab_analysis from tab within tabpage_analysis
event create ( )
event destroy ( )
integer x = 27
integer y = 228
integer width = 3483
integer height = 1572
integer taborder = 21
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
boolean createondemand = true
tabposition tabposition = tabsonbottom!
alignment alignment = center!
integer selectedtab = 1
tabpage_last_attempt tabpage_last_attempt
tabpage_total_attempts tabpage_total_attempts
tabpage_expiring_credentials tabpage_expiring_credentials
tabpage_exp_appointments tabpage_exp_appointments
tabpage_audit tabpage_audit
end type

on tab_analysis.create
this.tabpage_last_attempt=create tabpage_last_attempt
this.tabpage_total_attempts=create tabpage_total_attempts
this.tabpage_expiring_credentials=create tabpage_expiring_credentials
this.tabpage_exp_appointments=create tabpage_exp_appointments
this.tabpage_audit=create tabpage_audit
this.Control[]={this.tabpage_last_attempt,&
this.tabpage_total_attempts,&
this.tabpage_expiring_credentials,&
this.tabpage_exp_appointments,&
this.tabpage_audit}
end on

on tab_analysis.destroy
destroy(this.tabpage_last_attempt)
destroy(this.tabpage_total_attempts)
destroy(this.tabpage_expiring_credentials)
destroy(this.tabpage_exp_appointments)
destroy(this.tabpage_audit)
end on

event selectionchanged;//st_msg.Visible = False //removed maha 072303

//CHOOSE CASE newindex
	of_graph_case(newindex)
//	CASE 1
//		
//		inv_action_items.of_filter_graph( ii_facility_id, tab_1.tabpage_analysis.tab_analysis.tabpage_last_attempt.dw_last_attemp_graph, is_user_id )
//	CASE 2
////		tab_1.tabpage_analysis.tab_analysis.tabpage_total_attempts.dw_total_attempts.SetRedraw ( false )
////		IF tab_1.tabpage_analysis.tab_analysis.tabpage_total_attempts.dw_total_attempts.RowCount() = 0 THEN
////			tab_1.tabpage_analysis.tab_analysis.tabpage_total_attempts.dw_total_attempts.Event pfc_retrieve()
////		end if
//		inv_action_items.of_filter_graph( ii_facility_id, tab_1.tabpage_analysis.tab_analysis.tabpage_total_attempts.dw_total_attempts, is_user_id )
//	//	tab_1.tabpage_analysis.tab_analysis.tabpage_total_attempts.dw_total_attempts.SetRedraw ( true )
//	CASE 3
////		tab_1.tabpage_analysis.tab_analysis.tabpage_expiring_credentials.dw_expiring_credential_graph.SetRedraw ( false )
////		IF tab_1.tabpage_analysis.tab_analysis.tabpage_expiring_credentials.dw_expiring_credential_graph.RowCount() = 0 THEN
////			tab_1.tabpage_analysis.tab_analysis.tabpage_expiring_credentials.dw_expiring_credential_graph.Event pfc_retrieve()
////		end if
//		inv_action_items.of_filter_graph( ii_facility_id, tab_1.tabpage_analysis.tab_analysis.tabpage_expiring_credentials.dw_expiring_credential_graph, is_user_id )
////		tab_1.tabpage_analysis.tab_analysis.tabpage_expiring_credentials.dw_expiring_credential_graph.SetRedraw ( true )
//	CASE 4
////		IF tab_1.tabpage_analysis.tab_analysis.tabpage_exp_appointments.dw_expiring_appointments_graph.RowCount() = 0 THEN
////			tab_1.tabpage_analysis.tab_analysis.tabpage_exp_appointments.dw_expiring_appointments_graph.Event pfc_retrieve()
////		end if
//			inv_action_items.of_filter_graph( ii_facility_id, tab_1.tabpage_analysis.tab_analysis.tabpage_exp_appointments.dw_expiring_appointments_graph, is_user_id )
//			
//	CASE 5
////		IF tab_1.tabpage_analysis.tab_analysis.tabpage_audit.dw_app_audit_graph.RowCount() = 0 THEN
////				tab_1.tabpage_analysis.tab_analysis.tabpage_audit.dw_app_audit_graph.Event pfc_retrieve()
////		end if
//			inv_action_items.of_filter_graph( ii_facility_id, tab_1.tabpage_analysis.tab_analysis.tabpage_audit.dw_app_audit_graph, is_user_id )
		
//END CHOOSE
end event

type tabpage_last_attempt from userobject within tab_analysis
event create ( )
event destroy ( )
integer x = 18
integer y = 16
integer width = 3447
integer height = 1456
long backcolor = 79741120
string text = "Verification Status"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
dw_last_attemp_graph dw_last_attemp_graph
end type

on tabpage_last_attempt.create
this.dw_last_attemp_graph=create dw_last_attemp_graph
this.Control[]={this.dw_last_attemp_graph}
end on

on tabpage_last_attempt.destroy
destroy(this.dw_last_attemp_graph)
end on

type dw_last_attemp_graph from u_dw within tabpage_last_attempt
integer width = 3378
integer height = 1384
integer taborder = 40
boolean bringtotop = true
string dataobject = "d_verification_graph_by_last_attemp_all"
end type

event constructor;This.of_SetUpdateable(False)
This.of_SetTransObject( SQLCA )
//This.of_Retrieve( )
end event

event doubleclicked;Integer SeriesNbr
Integer ItemNbr
Long ll_ver_method
String ls_series_name
String ls_category_name
String ls_where, ls_sql
String ls_from, ls_to

double data_value

grObjectType MouseHit

MouseHit = This.ObjectAtPointer("gr_1", SeriesNbr, ItemNbr)

data_value = This.GetData("gr_1", SeriesNbr, ItemNbr)
ls_category_name = This.CategoryName("gr_1", ItemNbr)
ls_series_name = This.SeriesName("gr_1", SeriesNbr)

IF MouseHit = 	TypeCategory!  THEN
	IF is_current_graph = "last_attempt" THEN
		//--------------------------- APPEON BEGIN ---------------------------
		//$<ID> PT-09
		//$<modify> 03.03.2006 By: LeiWei
		//$<reason> Performance tuning
		//$<modification> Write script to retrieve data from a cache instead of from the database.

		/*
		SELECT code_lookup.lookup_code  
	   INTO :ll_ver_method  
   	FROM code_lookup  
	   WHERE ( code_lookup.lookup_name = 'verification method' ) AND  
   	      ( code_lookup.code = :ls_category_name  )   ;
		IF SQLCA.SQLCODE = -1 THEN
			MessageBox("SQL ERROR", SQLCA.SQLERRTEXT)
			RETURN -1
		END IF
		*/
		ll_ver_method = Long(gnv_data.of_getitem( "code_lookup", "lookup_code", &
		"upper(lookup_name) = upper('verification method') and upper(code) = '" + upper(ls_category_name) + "'"))
		//---------------------------- APPEON END ----------------------------
	  	ls_where = " AND (verif_info.verification_method = " + String( ll_ver_method ) + ")"			
	END IF
ELSEIF MouseHit = TypeData! THEN
	data_value = This.GetData("gr_1", SeriesNbr, ItemNbr)
	ls_series_name = UPPER(This.SeriesName("gr_1", SeriesNbr))
	ls_category_name = UPPER(This.CategoryName("gr_1", ItemNbr))
	CHOOSE CASE ls_category_name 
		CASE "FAX"
			CHOOSE CASE ls_series_name 
				CASE " NEED PROCESSED"
					ii_filter_index = 1
					ddplb_filters.SelectItem( 1 )
				CASE "AWAITING RESPONSE"
					ii_filter_index = 8
					ddplb_filters.SelectItem( 8 )					
			END CHOOSE			
		CASE "EXP APPT LTR"
			CHOOSE CASE ls_series_name 
				CASE " NEED PROCESSED"
					ii_filter_index = 3
					ddplb_filters.SelectItem( 3 )
				CASE "AWAITING RESPONSE"
					ii_filter_index = 11
					ddplb_filters.SelectItem( 11 )
			END CHOOSE
		CASE "VERIF LTR"
			CHOOSE CASE ls_series_name 
				CASE " NEED PROCESSED"
					ii_filter_index = 1
					ddplb_filters.SelectItem( 1 )
				CASE "AWAITING RESPONSE"
					ii_filter_index = 8
					ddplb_filters.SelectItem( 8 )					
			END CHOOSE
		CASE "IVERIFY"
			CHOOSE CASE ls_series_name 
				CASE " NEED PROCESSED"
					ii_filter_index = 24
					ddplb_filters.SelectItem( 24 )
			END CHOOSE
			
		CASE "EXP CRED LTR"
			CHOOSE CASE ls_series_name 
				CASE " NEED PROCESSED"
					ii_filter_index = 2
					ddplb_filters.SelectItem( 2 )
				CASE "AWAITING RESPONSE"
					ii_filter_index = 9
					ddplb_filters.SelectItem( 9 )					
			END CHOOSE
		CASE "PRAC CORRE"
			CHOOSE CASE ls_series_name 
				CASE " NEED PROCESSED"
					ii_filter_index = 6
					ddplb_filters.SelectItem( 6 )
				CASE "AWAITING RESPONSE"
					ii_filter_index = 10
					ddplb_filters.SelectItem( 10 )					
			END CHOOSE			
		CASE "COMPENDIUM"
			CHOOSE CASE Upper( ls_series_name )
				CASE " NEED PROCESSED"
					ii_filter_index = 16
					ddplb_filters.SelectItem( 16 )
				CASE "AWAITING RESPONSE"
					ii_filter_index = 16
					ddplb_filters.SelectItem( 16 )													
				END CHOOSE								
		CASE "CALL"
			CHOOSE CASE Upper( ls_series_name )
				CASE " NEED PROCESSED"
					ii_filter_index = 15
					ddplb_filters.SelectItem( 15 )
				CASE "AWAITING RESPONSE"
					ii_filter_index = 15
					ddplb_filters.SelectItem( 15 )										
			END CHOOSE			
		CASE "WEB"
			CHOOSE CASE Upper( ls_series_name )
				CASE " NEED PROCESSED"
					ii_filter_index = 14
					ddplb_filters.SelectItem( 14 )
			END CHOOSE			
		CASE "NPDB QUERY"
			CHOOSE CASE Upper( ls_series_name )
				CASE " NEED PROCESSED"
					ii_filter_index = 12
					ddplb_filters.SelectItem( 12 )
				CASE "AWAITING RESPONSE"
					ii_filter_index = 13
					ddplb_filters.SelectItem( 13 )
			END CHOOSE
		CASE "OIG QUERY"
			CHOOSE CASE Upper( ls_series_name )
				CASE " NEED PROCESSED"
					ii_filter_index = 25
					ddplb_filters.SelectItem( 25 )
				CASE "AWAITING RESPONSE"
					ii_filter_index = 26
					ddplb_filters.SelectItem( 26 )
			END CHOOSE
					
		CASE "HARD COPY"  //maha 032703
					ii_filter_index = 17
					ddplb_filters.SelectItem( 17 )
		/////////////////////////////////////////////				
		// MSKINNER 1 Feb 2005 -- begin
		CASE "NPDB/HIPDB"
			//n_cst_npdb LNVO
			CHOOSE CASE trim(Upper(ls_series_name))
				CASE "NEED PROCESSED" //print flag =1 
//					if messagebox('ITP Send','Do you want to send NEED PROCESSED records to the npdb?',Question!,yesno!,1) = 1 then
//					 	LNVO.of_start_npdb(lnvo.is_send)
//					end if
					ii_filter_index = 12
					ddplb_filters.SelectItem(12)
				CASE "AWAITING RESPONSE" //print flag =0 
					// do the recieve functionality
//					if messagebox('ITP Send','Do you want to recieve AWAITING RESPONSE records from the npdb?',Question!,yesno!,1) = 1 then
//					  LNVO.of_start_npdb(lnvo.is_recieve)
//				   end if
					ii_filter_index = 13
					ddplb_filters.SelectItem(13)
			END CHOOSE
		//Start Code Change ---- 10.25.2006 #1 maha
		CASE "MISS ITEM 90"
			CHOOSE CASE trim(Upper(ls_series_name))
				CASE "NEED PROCESSED" //print flag =1 
//					if messagebox('ITP Send','Do you want to send NEED PROCESSED records to the npdb?',Question!,yesno!,1) = 1 then
//					 	LNVO.of_start_npdb(lnvo.is_send)
//					end if
					ii_filter_index = 31
					ddplb_filters.SelectItem(31)
				CASE "AWAITING RESPONSE" //print flag =0 
					// do the recieve functionality
//					if messagebox('ITP Send','Do you want to recieve AWAITING RESPONSE records from the npdb?',Question!,yesno!,1) = 1 then
//					  LNVO.of_start_npdb(lnvo.is_recieve)
//				   end if
					ii_filter_index = 32
					ddplb_filters.SelectItem(32)
			END CHOOSE
		//End Code Change---10.28.2006
		// MSKINNER 1 Feb 2005 -- end
		CASE ELSE
			RETURN 1
	END CHOOSE
ELSE
	RETURN 1
END IF

tab_1.SelectTab( 2 )
ddplb_filters.Event SelectionChanged( ii_filter_index )

//tab_1.SelectTab( 2 )
end event

event pfc_retrieve;call super::pfc_retrieve;IF This.DataObject = "d_verification_graph_by_last_attemp" THEN
	Return This.Retrieve( )
ELSE
	Return This.Retrieve( gs_user_id )
END IF
end event

event getfocus;call super::getfocus;idw_active = This
end event

type tabpage_total_attempts from userobject within tab_analysis
event create ( )
event destroy ( )
integer x = 18
integer y = 16
integer width = 3447
integer height = 1456
long backcolor = 79741120
string text = "Verification Attempts"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
dw_total_attempts dw_total_attempts
end type

on tabpage_total_attempts.create
this.dw_total_attempts=create dw_total_attempts
this.Control[]={this.dw_total_attempts}
end on

on tabpage_total_attempts.destroy
destroy(this.dw_total_attempts)
end on

type dw_total_attempts from u_dw within tabpage_total_attempts
integer x = 32
integer y = 28
integer width = 3378
integer height = 1384
integer taborder = 11
boolean bringtotop = true
string dataobject = "d_verification_graph_by_total_attemp"
end type

event constructor;This.of_SetUpdateable(False)
This.of_SetTransObject( SQLCA )
end event

event pfc_retrieve;call super::pfc_retrieve;Return This.Retrieve(gs_user_id)
end event

event getfocus;call super::getfocus;idw_active = This
end event

event doubleclicked;call super::doubleclicked;

Integer SeriesNbr
Integer ItemNbr
Long ll_ver_method
String ls_series_name
String ls_category_name
String ls_where, ls_sql
String ls_from, ls_to

double data_value

grObjectType MouseHit

MouseHit = This.ObjectAtPointer("gr_1", SeriesNbr, ItemNbr)

data_value = This.GetData("gr_1", SeriesNbr, ItemNbr)
ls_category_name = This.CategoryName("gr_1", ItemNbr)
ls_series_name = This.SeriesName("gr_1", SeriesNbr)

//IF MouseHit = 	TypeCategory!  THEN
//	IF is_current_graph = "last_attempt" THEN
//		SELECT code_lookup.lookup_code  
//	   INTO :ll_ver_method  
//   	FROM code_lookup  
//	   WHERE ( code_lookup.lookup_name = 'verification method' ) AND  
//   	      ( code_lookup.code = :ls_category_name  )   ;
//		IF SQLCA.SQLCODE = -1 THEN
//			MessageBox("SQL ERROR", SQLCA.SQLERRTEXT)
//			RETURN -1
//		END IF
//	  	ls_where = " AND (verif_info.verification_method = " + String( ll_ver_method ) + ")"			
//	END IF
//ELSE
	IF MouseHit = TypeData! THEN
	data_value = This.GetData("gr_1", SeriesNbr, ItemNbr)
	ls_series_name = UPPER(This.SeriesName("gr_1", SeriesNbr))
	ls_category_name = UPPER(This.CategoryName("gr_1", ItemNbr))
	CHOOSE CASE ls_category_name 
		CASE "EXP APPT LTR"
			//CHOOSE CASE ls_series_name 
			//	CASE " NEED PROCESSED"
			//		ii_filter_index = 3
			//		ddplb_filters.SelectItem( 3 )
			//	CASE "AWAITING RESPONSE"
					ii_filter_index = 11
					ddplb_filters.SelectItem( 11 )
			//END CHOOSE
		CASE "VERIF LTR"
			//CHOOSE CASE ls_series_name 
			//	CASE " NEED PROCESSED"
			//		ii_filter_index = 1
			//		ddplb_filters.SelectItem( 1 )
			//	CASE "AWAITING RESPONSE"
					ii_filter_index = 8
					ddplb_filters.SelectItem( 8 )					
			//END CHOOSE
		CASE "IVERIFY"
			//CHOOSE CASE ls_series_name 
			//	CASE " NEED PROCESSED"
					ii_filter_index = 24
					ddplb_filters.SelectItem( 24 )
			//END CHOOSE
			
		CASE "EXP CRED LTR"
			//CHOOSE CASE ls_series_name 
				//CASE " NEED PROCESSED"
				///	ii_filter_index = 2
				//	ddplb_filters.SelectItem( 2 )
				//CASE "AWAITING RESPONSE"
					ii_filter_index = 9
					ddplb_filters.SelectItem( 9 )					
			//END CHOOSE
		CASE "PRAC CORRE"
			//CHOOSE CASE ls_series_name 
			//	CASE " NEED PROCESSED"
			//		ii_filter_index = 4
			//		ddplb_filters.SelectItem( 4 )
			//	CASE "AWAITING RESPONSE"
					ii_filter_index = 10
					ddplb_filters.SelectItem( 10 )					
			//END CHOOSE			
		CASE "COMPENDIUM"
			//CHOOSE CASE Upper( ls_series_name )
			//	CASE " NEED PROCESSED"
			//		ii_filter_index = 16
			//		ddplb_filters.SelectItem( 16 )
			//	CASE "AWAITING RESPONSE"
					ii_filter_index = 16
					ddplb_filters.SelectItem( 16 )													
			//	END CHOOSE								
		CASE "CALL"
			//CHOOSE CASE Upper( ls_series_name )
			//	CASE " NEED PROCESSED"
			//		ii_filter_index = 15
			//		ddplb_filters.SelectItem( 15 )
			//	CASE "AWAITING RESPONSE"
					ii_filter_index = 15
					ddplb_filters.SelectItem( 15 )										
			//END CHOOSE			
		CASE "WEB"
		//	CHOOSE CASE Upper( ls_series_name )
			//	CASE " NEED PROCESSED"
					ii_filter_index = 14
					ddplb_filters.SelectItem( 14 )
			//END CHOOSE			
		CASE "NPDB QUERY"
			//CHOOSE CASE Upper( ls_series_name )
			//	CASE " NEED PROCESSED"
			//		ii_filter_index = 12
			//		ddplb_filters.SelectItem( 12 )
			//	CASE "AWAITING RESPONSE"
					ii_filter_index = 13
					ddplb_filters.SelectItem( 13 )
			//END CHOOSE
		CASE "OIG QUERY"
			//CHOOSE CASE Upper( ls_series_name )
			//	CASE " NEED PROCESSED"
			//		ii_filter_index = 25
			//		ddplb_filters.SelectItem( 25 )
			//	CASE "AWAITING RESPONSE"
					ii_filter_index = 26
					ddplb_filters.SelectItem( 26 )
			//END CHOOSE
					
		CASE "HARD COPY"  //maha 032703
					ii_filter_index = 17
					ddplb_filters.SelectItem( 17 )
						
			
		CASE ELSE
			RETURN 1
	END CHOOSE
	
	tab_1.SelectTab( 2 )
	ddplb_filters.Event SelectionChanged( ii_filter_index )

	//tab_1.SelectTab( 2 )
ELSE
	RETURN 1
END IF


end event

type tabpage_expiring_credentials from userobject within tab_analysis
event create ( )
event destroy ( )
integer x = 18
integer y = 16
integer width = 3447
integer height = 1456
long backcolor = 79741120
string text = "Expiring Credentials"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
dw_expiring_credential_graph dw_expiring_credential_graph
end type

on tabpage_expiring_credentials.create
this.dw_expiring_credential_graph=create dw_expiring_credential_graph
this.Control[]={this.dw_expiring_credential_graph}
end on

on tabpage_expiring_credentials.destroy
destroy(this.dw_expiring_credential_graph)
end on

type dw_expiring_credential_graph from u_dw within tabpage_expiring_credentials
integer x = 37
integer y = 28
integer width = 3378
integer height = 1384
integer taborder = 11
boolean bringtotop = true
string dataobject = "d_expiring_credentials_graph"
end type

event constructor;This.of_SetUpdateable(False)
This.of_SetTransObject( SQLCA )
end event

event pfc_retrieve;call super::pfc_retrieve;Return This.Retrieve( Today(),gs_user_id )
end event

event getfocus;call super::getfocus;idw_active = This
end event

event doubleclicked;call super::doubleclicked;//maha 072303

ii_filter_index = 19
ddplb_filters.SelectItem(19)
is_filter = ddplb_filters.Text

tab_1.SelectTab(2)
inv_action_items.of_filter( ii_org_id, ii_facility_id, is_filter, tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse, is_user_id, ddplb_filters )

//tab_1.SelectTab(2)
end event

type tabpage_exp_appointments from userobject within tab_analysis
integer x = 18
integer y = 16
integer width = 3447
integer height = 1456
long backcolor = 79741120
string text = "Expiring Appointments"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
dw_expiring_appointments_graph dw_expiring_appointments_graph
end type

on tabpage_exp_appointments.create
this.dw_expiring_appointments_graph=create dw_expiring_appointments_graph
this.Control[]={this.dw_expiring_appointments_graph}
end on

on tabpage_exp_appointments.destroy
destroy(this.dw_expiring_appointments_graph)
end on

type dw_expiring_appointments_graph from u_dw within tabpage_exp_appointments
integer x = 32
integer y = 28
integer width = 3387
integer height = 1384
integer taborder = 21
boolean bringtotop = true
string dataobject = "d_expiring_appointments"
end type

event constructor;This.of_SetUpdateable(False)
This.of_SetTransObject( SQLCA )
end event

event getfocus;call super::getfocus;idw_active = This
end event

event pfc_retrieve;call super::pfc_retrieve;Return This.Retrieve( Today(),gs_user_id)
end event

event doubleclicked;ii_filter_index = 18
ddplb_filters.SelectItem(18)
is_filter = ddplb_filters.Text


tab_1.SelectTab(2)
inv_action_items.of_filter( ii_org_id, ii_facility_id, is_filter, tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse, is_user_id, ddplb_filters )

//tab_1.SelectTab(2)




end event

type tabpage_audit from userobject within tab_analysis
integer x = 18
integer y = 16
integer width = 3447
integer height = 1456
long backcolor = 80269524
string text = "Missing App Audit"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
long picturemaskcolor = 536870912
dw_app_audit_graph dw_app_audit_graph
end type

on tabpage_audit.create
this.dw_app_audit_graph=create dw_app_audit_graph
this.Control[]={this.dw_app_audit_graph}
end on

on tabpage_audit.destroy
destroy(this.dw_app_audit_graph)
end on

type dw_app_audit_graph from u_dw within tabpage_audit
integer x = 32
integer y = 28
integer width = 3374
integer height = 1384
integer taborder = 11
boolean bringtotop = true
string dataobject = "d_app_audit_graph"
end type

event doubleclicked;call super::doubleclicked;
// mskinner 20 dec 2005 -- begin
if dw_app_audit_graph.rowcount() < 1 then return 0
// mskinner 20 dec 2005 -- end



ii_filter_index = 27
ddplb_filters.SelectItem(27)
is_filter = ddplb_filters.Text


tab_1.SelectTab(2)
inv_action_items.of_filter( ii_org_id, ii_facility_id, is_filter, tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse, is_user_id, ddplb_filters )




//tab_1.SelectTab(2)
end event

event pfc_retrieve;call super::pfc_retrieve;Return This.Retrieve( gs_user_id)
end event

event constructor;call super::constructor;This.of_SetUpdateable(False)
This.of_SetTransObject( SQLCA )
end event

type st_msg from statictext within tabpage_analysis
integer x = 55
integer y = 1816
integer width = 2363
integer height = 68
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
string text = "Double click graph to view detail"
boolean focusrectangle = false
end type

type tabpage_detail from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 3515
integer height = 1988
long backcolor = 79741120
string text = "Action Item Detail"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "Cursor!"
long picturemaskcolor = 12632256
sle_1 sle_1
tab_view tab_view
sle_doc_find sle_doc_find
cb_find cb_find
st_find st_find
cb_init_recred cb_init_recred
st_1 st_1
cb_recred_no_ver cb_recred_no_ver
dw_tracker dw_tracker
cbx_priv cbx_priv
end type

on tabpage_detail.create
this.sle_1=create sle_1
this.tab_view=create tab_view
this.sle_doc_find=create sle_doc_find
this.cb_find=create cb_find
this.st_find=create st_find
this.cb_init_recred=create cb_init_recred
this.st_1=create st_1
this.cb_recred_no_ver=create cb_recred_no_ver
this.dw_tracker=create dw_tracker
this.cbx_priv=create cbx_priv
this.Control[]={this.sle_1,&
this.tab_view,&
this.sle_doc_find,&
this.cb_find,&
this.st_find,&
this.cb_init_recred,&
this.st_1,&
this.cb_recred_no_ver,&
this.dw_tracker,&
this.cbx_priv}
end on

on tabpage_detail.destroy
destroy(this.sle_1)
destroy(this.tab_view)
destroy(this.sle_doc_find)
destroy(this.cb_find)
destroy(this.st_find)
destroy(this.cb_init_recred)
destroy(this.st_1)
destroy(this.cb_recred_no_ver)
destroy(this.dw_tracker)
destroy(this.cbx_priv)
end on

type sle_1 from singlelineedit within tabpage_detail
boolean visible = false
integer x = 974
integer y = 1716
integer width = 1280
integer height = 96
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
end type

event getfocus;

THIS.TEXT = tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.Object.DataWindow.Table.Filter
end event

type tab_view from tab within tabpage_detail
event create ( )
event destroy ( )
integer x = 32
integer y = 204
integer width = 3447
integer height = 1596
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
tabposition tabposition = tabsonbottom!
alignment alignment = center!
integer selectedtab = 1
tabpage_browse tabpage_browse
tabpage_details tabpage_details
end type

on tab_view.create
this.tabpage_browse=create tabpage_browse
this.tabpage_details=create tabpage_details
this.Control[]={this.tabpage_browse,&
this.tabpage_details}
end on

on tab_view.destroy
destroy(this.tabpage_browse)
destroy(this.tabpage_details)
end on

event selectionchanging;
Long ll_prac_id
Long ll_rec_id 
Integer li_parent_facility_id
Integer li_v_facility_id
Integer li_data_view_id
Integer li_screen_id 
Integer li_len
Integer i
Integer li_cr
integer li_rc //maha 090401
integer v  //maha 090401
integer t  //maha 090401
long ll_test1  //maha 090401
long ll_test2  //maha 090401
integer del
Boolean ib_found = False
String ls_full_name
String ls_val
Long ll_exp_appt_ltr


if tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.rowcount() < 1 then//maha 101200 error trap
	tabpage_details.dw_detail.Reset()
	return  
end if

IF oldindex = 1 AND newindex = 1 THEN
	Return
END IF
cb_recred_no_ver.Visible = false
cb_init_recred.Visible = False
cbx_priv.Visible = false
IF oldindex = 1 Then
	li_cr = tabpage_browse.dw_browse.GetRow()
	IF Upper( tabpage_browse.dw_browse.GetItemString( li_cr, "reference_value" ) ) = "NPDB QUERY" THEN
		MessageBox( "Detail", "There is no detail for the selected entry" )
		//--------------------------- APPEON BEGIN ---------------------------
		//$<add> 04.29.2006 By: LeiWei
		//$<reason> Fix a defect
		cb_recred_no_ver.Visible = true
		cb_init_recred.Visible = true
		cbx_priv.Visible = true
		//---------------------------- APPEON END ----------------------------
		Return 1
	END IF	
	st_filter.Visible = False
	ddplb_filters.Visible = False
	dw_user.Visible = False
	dw_select_org_facility.Visible = False
	sle_doc_find.Visible = False
	st_find.Visible = False
	cb_find.Visible = False
	
	IF tabpage_browse.dw_browse.GetRow() > 0 THEN
		//--------------------------- APPEON BEGIN ---------------------------
		//$<ID> PT-10
		//$<modify> 03.03.2006 By: LeiWei
		//$<reason> Performance tuning
		//$<modification> Write script to retrieve data from a cache instead of from the database.

		/*		
		SELECT code_lookup.lookup_code  
		INTO :ll_exp_appt_ltr
		FROM code_lookup  
		WHERE ( code_lookup.lookup_name = 'verification method' ) AND  
  	   	( code_lookup.code = 'EXP APPT LTR'  )   ;
		IF SQLCA.SQLCODE = -1 THEN
			MessageBox("SQL ERROR", SQLCA.SQLERRTEXT)
			RETURN -1
		END IF
		*/
		
		ll_exp_appt_ltr = Long(gnv_data.of_getitem("code_lookup","lookup_code", "upper(lookup_name) = upper('verification method') and upper(code) = upper('EXP APPT LTR')"))
		
		//---------------------------- APPEON END ----------------------------
		ll_rec_id = tabpage_browse.dw_browse.GetItemNumber( li_cr, "rec_id" )
		ll_prac_id = tabpage_browse.dw_browse.GetItemNumber( li_cr, "prac_id" )
		//exp appointments recred
		IF tabpage_browse.dw_browse.GetItemNumber( li_cr, "verification_method" ) = ll_exp_appt_ltr THEN
			cb_init_recred.Visible = True
			cb_recred_no_ver.Visible = True
			cbx_priv.Visible = true //maha081403
			IF tabpage_details.dw_detail.DataObject <> "d_copy_verification" THEN
				tabpage_details.dw_detail.DataObject = "d_copy_verification"
				tabpage_details.dw_detail.of_SetTransObject( SQLCA )
				li_v_facility_id = tabpage_browse.dw_browse.GetItemNumber( li_cr, "verif_info_facility_id" )
			//	li_parent_facility_id = tabpage_browse.dw_browse.GetItemNumber( li_cr, "parent_facility_id" )
			END IF
			tabpage_details.dw_detail.Retrieve( ll_prac_id,li_parent_facility_id )	
			//\/maha 090401 test for duplicates and delete from datawindow
			FOR i = 1 TO li_rc
				ll_test1 = tabpage_details.dw_detail.GetItemNumber( v, "rec_id" )
				del = tabpage_details.dw_detail.GetItemNumber( v, "del" )
				if del = 1 then continue
				for t = 1 to li_rc
						ll_test2 = tabpage_details.dw_detail.GetItemNumber( t, "rec_id" )
						if v <> t and ll_test1 = ll_test2 and isnull(tabpage_details.dw_detail.GetItemnumber( v, "verification_id" )) and isnull(tabpage_details.dw_detail.GetItemnumber( t, "verification_id" )) then
								tabpage_details.dw_detail.SetItem( t, "del", 1 )
						end if
				next
			next
			FOR i =  li_rc to 1 step -1
			if tabpage_details.dw_detail.getItemnumber( i, "del") = 1 then
				tabpage_details.dw_detail.deleterow(i)
			end if
			next
			//\maha
		elseif tabpage_browse.dw_browse.GetItemNumber( li_cr, "screen_id" ) = 1 then //all basic info except for exp appt letter.
			MessageBox( "Detail", "There is no detail for the selected entry" )
			//--------------------------- APPEON BEGIN ---------------------------
			//$<add> 04.29.2006 By: LeiWei
			//$<reason> Fix a defect
			st_filter.Visible = True
			ddplb_filters.Visible = True
			dw_user.Visible = True
			dw_select_org_facility.Visible = True
			sle_doc_find.Visible = True
			st_find.Visible = True
			cb_find.Visible = True
			//---------------------------- APPEON END ----------------------------
			Return 1
		ELSE //D.E. detail
			IF tabpage_details.dw_detail.RowCount() = 1 THEN
				IF ll_rec_id = tabpage_details.dw_detail.GetItemNumber( 1, "rec_id" ) THEN
					ib_found = TRUE
					//messagebox("1 ll_rec_id", ll_rec_id)
				END IF
			END IF
			IF NOT ib_found THEN
				if ib_cache = false then
					inv_data_entry = CREATE pfc_cst_nv_data_entry_functions
					inv_data_entry.of_setup_cache()
					inv_data_entry.of_refresh_cache()
					ib_cache = true
				end if
				li_data_view_id = 1
				li_screen_id = tabpage_browse.dw_browse.GetItemNumber( li_cr, "screen_id" )
				inv_data_entry.of_create_dynamic_dw( +&
								ll_prac_id, li_data_view_id, li_screen_id, +&
								tabpage_details.dw_detail, tabpage_details.dw_dummy_browse, False,0 )				
				 //messagebox("3","after create dynamic " + string(ib_found))				
				tabpage_details.dw_detail.SetFilter( "rec_id = " + String( ll_rec_id ) )
				tabpage_details.dw_detail.Filter( )
				if tabpage_details.dw_detail.rowcount() > 0 then //trap added 061804 maha 4.187
					ll_prac_id = tabpage_details.dw_detail.GetItemNumber( 1, "prac_id" )
				
					SELECT v_full_name.full_name  
					INTO :ls_full_name  
					FROM v_full_name  
					WHERE v_full_name.prac_id = :ll_prac_id ;
					li_len = Len( ls_full_name )
					FOR i = 1 TO li_len
						IF Mid( ls_full_name, i, 1 ) = "'" THEN
							ls_full_name = Mid( ls_full_name, 1, i -1 ) + '"' + Mid( ls_full_name, i+1, 100 )
						END IF
					END FOR
					tabpage_details.st_name.text = ls_full_name
				else
					messagebox("Data Error","No data available for the selected record.")
				end if
				//ls_val = tabpage_details.dw_detail.Modify("create text(band=detail alignment='0' text='" + ls_full_name + "' border='0' color='255' x='130' y='10' height='45' width='1000'  name=section_name_t  font.face='MS Sans Serif' font.height='-8' font.weight='500'  font.family='2' font.pitch='2' font.charset='0' background.mode='2' background.color='12632256' )")
			END IF
		END IF
	END IF
ELSE
	IF tab_1.SelectedTab <> 1 THEN
		st_filter.Visible = True
		ddplb_filters.Visible = True
	END IF
	dw_user.Visible = True
	dw_select_org_facility.Visible = True
	sle_doc_find.Visible = True
	st_find.Visible = True
	cb_find.Visible = True
END IF
end event

event destructor;if ib_cache = true then
	DESTROY pfc_cst_nv_data_entry_functions
end if
end event

type tabpage_browse from userobject within tab_view
integer x = 18
integer y = 16
integer width = 3410
integer height = 1480
long backcolor = 80269524
string text = "Outstanding Action Items"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
long picturemaskcolor = 536870912
dw_browse dw_browse
end type

on tabpage_browse.create
this.dw_browse=create dw_browse
this.Control[]={this.dw_browse}
end on

on tabpage_browse.destroy
destroy(this.dw_browse)
end on

type dw_browse from u_dw within tabpage_browse
integer x = 5
integer y = 4
integer width = 3397
integer height = 1452
integer taborder = 30
boolean bringtotop = true
string dataobject = "d_ver_summary_record_view_for_ai_all"
end type

event clicked;call super::clicked;if this.rowcount() < 1 then return

This.ScrollToRow( This.GetClickedRow( ) )
This.SetRow( This.GetClickedRow( ) )

if this.getitemnumber(this.getrow(),"selected") = 1 then
	gnv_app.of_modify_menu_attr( m_pfe_cst_action_items.m_action.m_batchresponse,'Enabled', True)
end if
end event

event constructor;inv_printletters = CREATE pfc_n_cst_ai_printletters
This.SetRowFocusIndicator( Hand! )
This.of_SetDropDownCalendar( TRUE )
This.of_SetUpdateable( True )
This.of_SetTransObject( SQLCA )
inv_printletters.of_setdetaildw( This )

This.iuo_calendar.of_Register(This.iuo_calendar.DDLB)		

This.of_SetSort( True )
This.inv_sort.of_SetColumnnameSource( This.inv_sort.HEADER )
This.inv_sort.of_SetColumnDisplayNameStyle( 2 )
This.inv_sort.of_SetStyle( This.inv_sort.DROPDOWNLISTBOX )
This.inv_sort.of_SetColumnHeader( TRUE )

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-11
//$<add> 01.23.2006 By: LeiWei
//$<reason> Performance tuning
//$<modification> Copy the script from the Open event of w_action_items due to the usage
//$<modification> of CreateOnDemand.
inv_action_items.of_set_original_sql( tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse )
//---------------------------- APPEON END ----------------------------

end event

event itemchanged;call super::itemchanged;IF This.GetColumnName() = "response_code" THEN
	This.SetItem( row, "user_name", gs_user_id )
	This.SetItem( row, "source", "P" )
	This.SetItem( row, "date_recieved", Today() )
	This.SetItem( row, "exp_credential_flag", 0 )
	This.SetItem( row, "print_flag", 0 )
	lb_response_cd_entered = True
END IF

IF This.GetColumnName() = "selected" THEN
	gnv_app.of_modify_menu_attr( m_pfe_cst_action_items.m_action.m_batchresponse,'Enabled', True)
end if
end event

event retrieveend;call super::retrieveend;inv_action_items.of_enable_action_menu(This,dw_select_org_facility.GetText())

of_filter_by_intellibatch(this) //maha 073003

if RowCount > 0 then
	gnv_app.of_modify_menu_attr( m_pfe_cst_action_items.m_action.m_batchrecred,'Enabled', true)		//Added by Scofield on 2008-12-11
	This.ScrollToRow( 1 )
	This.SetRow( 1 )
else
	gnv_app.of_modify_menu_attr( m_pfe_cst_action_items.m_action.m_batchrecred,'Enabled', false)		//Added by Scofield on 2008-12-11
end if

lb_response_cd_entered = False

end event

event rowfocuschanged;call super::rowfocuschanged;inv_action_items.of_enable_action_menu( This, dw_select_org_facility.GetText() )

if this.dataobject <> "d_app_audit_missing_ai" then
	tab_1.tabpage_detail.tab_view.tabpage_details.enabled = true
	This.SetColumn( "response_code" )
else
	tab_1.tabpage_detail.tab_view.tabpage_details.enabled = false
end if

IF IsValid( w_capture ) THEN
	gs_pass_ids ls_pass_ids
	
	ls_pass_ids.ls_doc_id = This.GetItemString( currentrow, "doc_id" )
	ls_pass_ids.ls_ref_value = This.GetItemString( currentrow, "reference_value" )
	ls_pass_ids.ls_from_window = "Prac_Folder"
	IF This.GetItemNumber( currentrow, "verification_picture_flag" ) = 1 THEN
		ls_pass_ids.ls_image_available = True
	ELSE
		ls_pass_ids.ls_image_available = False
	END IF

	w_capture.of_setup( ls_pass_ids )
END IF

end event

event pfc_retrieve;call super::pfc_retrieve;Integer li_retval
DatawindowChild dwchild

This.GetChild("response_code", dwchild)

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-12
//$<add> 02.16.2006 By: LeiWei
//$<reason> Performance tuning
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

gnv_appeondb.of_startqueue( )
//---------------------------- APPEON END ----------------------------

SetRedraw ( false )//Rodger Wu put these three lines here ahead of dwchild retrieving. Oct. 23, 2006
li_retval =  This.Retrieve( )
SetRedraw ( true )

dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("Credentials Verification Response")
      
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-13
//$<add> 02.16.2006 By: LeiWei
//$<reason> Performance tuning
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.
gnv_appeondb.of_commitqueue( )
li_retval = This.Rowcount( )
//---------------------------- APPEON END ----------------------------

if this.dataobject <> "d_app_audit_missing_ai" then
//set priority
	IF w_mdi.of_security_access( 290 ) = 0 THEN
		This.Modify( "priority.protect = '1'" )
		This.Modify( "priority.background.color= '12632256'" )		
	END IF
	//priority user
	IF w_mdi.of_security_access( 300 ) = 0 THEN
		This.Modify("priority_user.protect = '1'" )
		This.Modify("priority_user.background.color= '12632256'" )
	END IF	
	//post results
	IF w_mdi.of_security_access( 270 ) = 0 THEN
		This.Modify("response_code.protect = '1'" )
		This.Modify("response_code.background.color= '12632256'" )
		This.Modify("user_name.protect = '1'")
		This.Modify("user_name.background.color= '12632256'")
		This.Modify("date_recieved.protect = '1'")
		This.Modify("date_recieved.background.color= '12632256'")
		This.Modify("date_recieved.protect = '1'")
		This.Modify("date_recieved.background.color= '12632256'")
	END IF	
else
	IF w_mdi.of_security_access( 270 ) = 0 THEN
		This.Modify("date_completed.protect = '1'" )
		This.Modify("date_completed.background.color= '12632256'" )
		This.Modify("data_status.protect = '1'" )
		This.Modify("data_status.background.color= '12632256'" )
		This.Modify("identifying_number.protect = '1'" )
		This.Modify("identifying_number.background.color= '12632256'" )
	end if
	
end if


Return li_retval
end event

event doubleclicked;
if this.dataobject <> "d_app_audit_missing_ai" then
	tab_1.tabpage_detail.tab_view.SelectTab( 2 )
end if
end event

event getfocus;call super::getfocus;idw_active = This
end event

event pfc_sortdlg;call super::pfc_sortdlg;
RETURN 1
end event

event pfc_validation;call super::pfc_validation;IF inv_action_items.of_Validate_Receive( This ) = -1 THEN
	Return -1
ELSE
	Return AncestorReturnValue
END IF
end event

event pfc_preupdate;call super::pfc_preupdate;Integer li_rc
Integer i
Integer z
Integer li_cnt,li_seq
Long ll_prac_id
Long ll_prac_ids[]
Long li_facility_id
Long li_facility_ids[]
Boolean lb_found

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 11.20.2006 By: Jervis
//$<reason> 
str_action_item lstr_init[]

//Reset str_action_item value
istr_action = lstr_init


li_seq = 1
long ll_ori,ll_cur
//---------------------------- APPEON END ----------------------------

ii_facility_ids = li_facility_ids
il_prac_ids = ll_prac_ids
li_rc = This.RowCount()

//debugbreak()
this.settransobject(sqlca)

if this.dataobject  <> "d_app_audit_missing_ai" then //all verif infos 

	FOR i = 1 TO li_rc
		IF This.GetItemStatus( i, "response_code", Primary! ) = DataModified! THEN
			li_facility_id = This.GetItemNumber( i, "verif_info_facility_id" )
			ll_prac_id = This.GetItemNumber( i, "prac_id" )
			lb_found = False
			FOR z = 1 TO li_cnt
				IF li_facility_id = ii_facility_ids[ z ] AND ll_prac_id = il_prac_ids[ z ] THEN
					lb_found = True
					Exit
				END IF
			END FOR
			IF NOT lb_found THEN
				li_cnt++
				ii_facility_ids[ li_cnt ] = li_facility_id
				il_prac_ids[ li_cnt ] = ll_prac_id
				ii_screen_ids[li_cnt] = This.GetItemNumber( i, "screen_id" )
			END IF
		END IF
		
		//--------------------------- APPEON BEGIN ---------------------------
		//$<add> 11.02.2006 By: Jervis
		//$<reason> modify work flow
		If gb_workflow Then
			IF This.GetItemStatus( i, 0, Primary! ) = DataModified! then
				ll_ori = this.GetItemNumber(i,"response_code",primary!,true)
				ll_cur = this.GetItemNumber(i,"response_code")
				if ((ll_ori <> ll_cur) or (isnull(ll_ori) and not isnull(ll_cur)) or (not isnull(ll_ori) and isnull(ll_cur))) Then
					istr_action[li_seq].rec_id = This.getItemnumber( i, "rec_id" )
					istr_action[li_seq].prac_id = This.getItemnumber( i, "prac_id" )
					istr_action[li_seq].facility_id = This.getItemnumber( i, "verif_info_facility_id" )
					istr_action[li_seq].wf_id = this.GetItemNumber(i,"verif_info_wf_id")
					istr_action[li_seq].wf_action_status_id = this.GetItemNumber(i,"response_code")
					istr_action[li_seq].wf_action_type_id = this.GetItemNumber(i,"verification_method")
					istr_action[li_seq].status_changed_flag = false
					istr_action[li_seq].module = "01"	//IntelliGred
					istr_action[li_seq].trigger_by = "008"		//Trigger By Action Item Changed
					istr_action[li_seq].screen_id = -10
					if istr_action[li_seq].wf_id > 0 and this.GetItemString(i,"verif_info_wf_complete_flag") = "N" THEN
						istr_action[li_seq].seq_no = This.getItemnumber( i, "seq_no" )
						istr_action[li_seq].wf_step_id = this.GetItemNumber(i,"verif_info_wf_action_type_id")
						istr_action[li_seq].notes = this.GetItemString(i,"notes")
						istr_action[li_seq].status_changed_flag = true
					end if
					li_seq++
				else
					ll_ori = this.GetItemNumber(i,"verification_method",primary!,true)
					ll_cur = this.GetItemNumber(i,"verification_method")
					if ((ll_ori <> ll_cur) or (isnull(ll_ori) and not isnull(ll_cur)) or (not isnull(ll_ori) and isnull(ll_cur))) Then
						istr_action[li_seq].rec_id = This.getItemnumber( i, "rec_id" )
						istr_action[li_seq].prac_id = This.getItemnumber( i, "prac_id" )
						istr_action[li_seq].facility_id = This.getItemnumber( i, "verif_info_facility_id" )
						istr_action[li_seq].wf_action_status_id = this.GetItemNumber(i,"response_code")
						istr_action[li_seq].wf_action_type_id = this.GetItemNumber(i,"verification_method")
						istr_action[li_seq].status_changed_flag = false
						istr_action[li_seq].module = "01"	//IntelliGred
						istr_action[li_seq].trigger_by = "008"		//Trigger By Action Item Changed
						istr_action[li_seq].screen_id = -10
						li_seq++
					end if
				end if
			END IF
		End if
		//---------------------------- APPEON END ----------------------------
	END FOR
else
	FOR i = 1 TO li_rc
		IF This.GetItemStatus( i, "date_completed", Primary! ) = DataModified! THEN
			li_facility_id = This.GetItemNumber( i, "facility_id" )
			ll_prac_id = This.GetItemNumber( i, "prac_id" )
			lb_found = False
			FOR z = 1 TO li_cnt
				IF li_facility_id = ii_facility_ids[ z ] AND ll_prac_id = il_prac_ids[ z ] THEN
					lb_found = True
					Exit
				END IF
			END FOR
			IF NOT lb_found THEN
				li_cnt++
				ii_facility_ids[ li_cnt ] = li_facility_id
				il_prac_ids[ li_cnt ] = ll_prac_id
			END IF
		END IF
	END FOR
end if

Return 1
end event

event rbuttondown;call super::rbuttondown;
integer col
integer ret
datetime dtn
string colname
STRING DT

setnull(dtn)

//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 04.20.2006 By: LeiWei
//$<reason> Fix a defect
//col = this.getclickedcolumn()
col = this.getcolumn()
//---------------------------- APPEON END ----------------------------
colname = this.getcolumnname() 

if this.Describe( colname + ".ColType") = "datetime" THEN
	//messagebox("dt","dt")
	ret = messagebox("Set Null?","Would you like to set this Date to null?",question!,yesno!,1 )
	if ret = 1 then
		this.setitem(row,col,dtn)
	end if
END IF



end event

event buttonclicked;call super::buttonclicked;long 		i
long 		ic
integer	li_Cycle,li_Count,li_Value[],li_CurRow

IF dwo.name  = "image_data" OR dwo.name = "image_button_no_image" THEN
	Long ll_verification_id
	gs_pass_ids ls_pass_ids
	
	ll_verification_id = This.GetItemNumber( row, "address_lookup_code")
	
	ls_pass_ids.ls_doc_id = This.GetItemString( row, "doc_id" )
	ls_pass_ids.ls_ref_value = This.GetItemString( row, "reference_value" )
	ls_pass_ids.ls_from_window = "Action_Items"
	ls_pass_ids.ll_verification_id = ll_verification_id
	IF This.GetItemNumber( row, "verification_picture_flag" ) = 1 THEN
		
		ls_pass_ids.ls_image_available = True
	ELSE
		ls_pass_ids.ls_image_available = False
	END IF
	IF Not IsValid( w_capture ) THEN
		OpenWithParm( w_capture,  ls_pass_ids )
	ELSE
		w_capture.of_setup( ls_pass_ids )
	END IF
END IF

IF w_mdi.of_security_access( 270 ) = 1 THEN
	if dwo.name = "sall" then
		li_Count = This.RowCount()
		if li_Count < 1 then return
		
		This.SetRedraw(false)
		li_CurRow = This.GetRow()
		if this.object.sall.text = "Select All" then
			//--------------------------- APPEON BEGIN ---------------------------
			//$<Modify> 2007-08-14 By: Scofield
			//$<Reason> Performance truing.
			
			//for i = 1 to this.rowcount()
			//	this.setitem(i,"selected",1)
			//next
			
			for li_Cycle = 1 to li_Count
				li_Value[li_Cycle] = 1
			next
			
			This.Object.selected.Primary = li_Value
			//---------------------------- APPEON END ----------------------------
			this.object.sall.text = "Deselect All"
		else
			//--------------------------- APPEON BEGIN ---------------------------
			//$<Modify> 2007-08-14 By: Scofield
			//$<Reason> Fix a defect.
			
			//for i = 1 to this.rowcount()
			//	this.setitem(i,"selected",0)
			//next
			
			for li_Cycle = 1 to li_Count
				li_Value[li_Cycle] = 0
			next
			
			This.Object.selected.Primary = li_Value
			//---------------------------- APPEON END ----------------------------
			this.object.sall.text = "Select All"
		end if
		This.SetRow(li_CurRow)
		This.SetRedraw(true)
		gnv_app.of_modify_menu_attr( m_pfe_cst_action_items.m_action.m_batchresponse,'Enabled', True)
	elseif dwo.name = "comp" then
		This.SetItem( row, "data_status", 662 )
		This.SetItem( row, "date_completed", DateTime( Today(), Now() ) )
		lb_response_cd_entered = true
	end if
else
end if

if dwo.name  = "b_npdb" then//Start Code Change ----05.05.2008 #V8 maha - added functionality
 	 //window w_npdb_report
	OpenSheetWithParm(w_npdb_report, this.GetItemstring( row, "doc_id"), "w_npdb_report", w_mdi, 0, original!)
end if 
end event

event pfc_postupdate;call super::pfc_postupdate;//--------------------------- APPEON BEGIN ---------------------------
//$<add> 11.06.2006 By: Jervis
//$<reason> modify work flow
long ll_i,ll_count
n_cst_workflow_triggers    lnv_trigger

If not gb_workflow then return 1
lnv_trigger = create n_cst_workflow_triggers
ll_count = UpperBound(istr_action)
for ll_i = 1 to ll_count
	if istr_action[ll_i].status_changed_flag then
		lnv_trigger.of_status_changed( istr_action[ll_i])
	end if
next

//2006-11-20 by jervis
//Create Work Flow By Action Item Changed
lnv_trigger.of_workflow_triggers(istr_action)   
//2006-11-20

destroy lnv_trigger

//---------------------------- APPEON END ----------------------------

//Start Code Change ----09.09.2008 #V85 maha
//set app audit complete if appropriate 
if this.dataobject  = "d_app_audit_missing_ai" then //app audit
	long ll_pracs[]
	long ll_recs[]
	long ll_comp[]
	long ll_prac_id
	long ll_rec_id
	long cnt
	long r
	integer li_test = 0
	datetime ldt_date
debugbreak()
	for ll_i = 1 to this.rowcount()
		li_test = 0
		ll_prac_id = this.getitemnumber(ll_i,"prac_id")
		ll_rec_id = this.getitemnumber(ll_i,"appt_stat_id")
		ldt_date =  this.getitemdatetime(ll_i,"date_completed")
		for r = 1 to upperbound(ll_pracs[])
			if ll_prac_id = ll_pracs[r] then
				if ll_rec_id = ll_recs[r] then
					li_test = r //if found set r for checking compl
					continue
				end if
			end if
		next
		if li_test = 0 then //if you dont find the prac and rec add a new to array
			cnt = upperbound(ll_pracs[])
			cnt++
			ll_pracs[cnt] = ll_prac_id
			ll_recs[cnt] = ll_rec_id
			if isnull(ldt_date) then //set the complete value
				ll_comp[cnt] = 0
			else
				ll_comp[cnt] = 1
			end if
		else //found prac and rec check complete
			if ll_comp[li_test] = 0 then //is already set as incomplete skip
				continue
			else //if set as completed
				if isnull(ldt_date) then ll_comp[cnt] = 0 //set as incomplete 
			end if
		end if 			
	next

	//call function to set comple date 
	inv_action_items.of_app_audit_complete( ll_pracs[],ll_recs[], ll_comp[])
	
end if
//End Code Change---09.09.2008

return 1


end event

event itemfocuschanged;call super::itemfocuschanged;//--------------------------- APPEON BEGIN ---------------------------
//$<add> 12.05.2006 By: Jervis
//$<reason> Filter Status
datawindowchild ldwc
long ll_wf_id,ll_wf_step_id
string ls_filter
//--------------------------- APPEON BEGIN ---------------------------
//$<add> 06.01.2007 By: Frank.Gui
//$<reason> 
IF row < 1 or isnull(row) THEN return
//---------------------------- APPEON END ----------------------------

TRY
	ll_wf_id = this.GetItemNumber(row,"verif_info_wf_id")
	ll_wf_step_id = this.GetItemNumber(row,"verif_info_wf_action_type_id")
		
	if dwo.name = "response_code" and ll_wf_id > 0 then
		if this.GetChild(dwo.name,ldwc) = 1 then
			ls_filter = "wf_id =" + string(ll_wf_id) + " and step_id = " + string(ll_wf_step_id) 
			ls_filter = gnv_data.of_get_filter_data("workflow_status_filter",ls_filter,"lookup_code")
			if ls_filter <> "" then
				ls_filter += " or isnull(lookup_code) or lookup_code = -777"
			else
				ls_filter = "isnull(lookup_code) or lookup_code = -777"
			end if
			ldwc.SetFilter( ls_filter)
			ldwc.Filter()
			//this.SetRedraw( false)
			is_prior = dwo.name
		end if
	elseif is_prior = "response_code" then
		if this.GetChild(is_prior,ldwc) = 1 then
			ldwc.SetFilter("")
			ldwc.Filter()
			is_prior = ""
			this.SetRedraw( true )
		end if
	end if
	
	//---------------------------- APPEON END ----------------------------
CATCH(THROWABLE th)
END TRY
end event

type tabpage_details from userobject within tab_view
integer x = 18
integer y = 16
integer width = 3410
integer height = 1480
long backcolor = 79741120
string text = "Recred"
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
dw_detail dw_detail
dw_dummy_browse dw_dummy_browse
st_name st_name
end type

on tabpage_details.create
this.dw_detail=create dw_detail
this.dw_dummy_browse=create dw_dummy_browse
this.st_name=create st_name
this.Control[]={this.dw_detail,&
this.dw_dummy_browse,&
this.st_name}
end on

on tabpage_details.destroy
destroy(this.dw_detail)
destroy(this.dw_dummy_browse)
destroy(this.st_name)
end on

type dw_detail from u_dw within tabpage_details
integer x = 23
integer y = 20
integer width = 3401
integer height = 1328
integer taborder = 11
boolean bringtotop = true
end type

event constructor;This.of_SetDropDownCalendar( TRUE )
This.of_SetUpdateAble( True )
end event

event getfocus;call super::getfocus;idw_active = This
end event

event pfc_preupdate;call super::pfc_preupdate;//debugbreak()
String ls_ref_1
String ls_ref_2
String ls_ref_3
String ls_exp_field
String ls_reference
String ls_screen_name
String ls_rec_status
DateTime ldt_exp_date
DateTime ldt_null_date
Long ll_rec_id
Long ll_address_code
Integer li_screen_id
Integer li_current_row
Integer i
Integer li_cnt
Integer li_rec_count
long		ll_found
Integer li_retval

DataWindowChild dwchild

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 2006-10-11 By: Rodger Wu (Inova)
//$<reason> Define several variable for checking if value in exp_field changed.

DateTime ldt_exp_date_original
Long ll_rec_id_changed[]

//---------------------------- APPEON END ----------------------------

SetNull( ldt_null_date )

This.AcceptText()

li_screen_id = tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.GetItemNumber( tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.getrow(), "screen_id" )

n_ds lds_screen_param

lds_screen_param = CREATE n_ds
lds_screen_param.DataObject = "d_get_screen_params"
lds_screen_param.SetTransObject( SQLCA )

lds_screen_param.Retrieve( li_screen_id )

ls_screen_name = lds_screen_param.GetItemString( 1, "screen_name" )
ls_ref_1 = lds_screen_param.GetItemString( 1, "ref_field_1" ) 
ls_ref_2 = lds_screen_param.GetItemString( 1, "ref_field_2" )
ls_exp_field = lds_screen_param.GetItemString( 1, "exp_field" )

IF This.GetItemStatus( 1,0, Primary!) <> NewModified! AND +&
	This.GetItemStatus( 1,0, Primary!) <> DataModified! THEN
	Return 0
END IF
		
ll_rec_id = This.GetItemNumber( 1,"rec_id" )

IF li_screen_id = 19 THEN
	IF IsNull( This.GetItemNumber( 1, "board_code" ) ) THEN
		RETURN 0
	ELSEIF ls_rec_status = "Modified" THEN
		SELECT count(*)  
  	   INTO :li_cnt  
     	FROM verif_info  
      WHERE ( verif_info.rec_id = :ll_rec_id ) AND  
              ( verif_info.active_status = 1)   ;
		IF IsNull( li_cnt ) OR li_cnt = 0 THEN
			ls_rec_status = "New"
		END IF
	END IF
END IF

IF NOT IsNull( ls_ref_1) AND ls_ref_1<> "" THEN
	This.ScrollToRow( i )
	This.SetRow( i )

	//move expiration date to verif info table if there is one
	IF Len(ls_exp_field) > 0 THEN
		IF ls_exp_field = "certification_expires" THEN				
			ldt_exp_date = DateTime(Date( "1-1-" + String( This.GetItemNumber( 1,ls_exp_field ) ) ),Now())

			//--------------------------- APPEON BEGIN ---------------------------
			//$<add> 2006-10-11 By: Rodger Wu (Inova)
			//$<reason> Get Original value of exp_field.
			ldt_exp_date_original = DateTime(Date( "12-30-" + String( This.GetItemNumber( 1, ls_exp_field, Primary!, True ) ) ),Now())
			//---------------------------- APPEON END ----------------------------

		ELSE
			ldt_exp_date = This.GetItemDateTime( 1,ls_exp_field )

			//--------------------------- APPEON BEGIN ---------------------------
			//$<add> 2006-10-11 By: Rodger Wu (Inova)
			//$<reason> Get Original value of exp_field.
			ldt_exp_date_original = This.GetItemDateTime( 1, ls_exp_field, Primary!, True )
			//---------------------------- APPEON END ----------------------------

		END IF
	ELSE
		ldt_exp_date = ldt_null_date

		//--------------------------- APPEON BEGIN ---------------------------
		//$<add> 2006-10-11 By: Rodger Wu (Inova)
		//$<reason> Get Original value of exp_field.
		SetNull( ldt_exp_date_original )
		//---------------------------- APPEON END ----------------------------

	END IF

	//get reference 1,data
	li_retval = This.GetChild(ls_ref_1, dwchild)
	IF li_retval = -1 THEN
		This.SetColumn( ls_ref_1)
		ls_reference =  This.GetText()				
	ELSE
		This.SetColumn( ls_ref_1)
		ll_found = dwchild.Find( "lookup_code = " + This.GetText(), 1, dwchild.rowcount() )	//Start Code Change ----05.21.2008 #V8 maha - changed 10000 to dw_child.rowcount()
		IF ll_found > 0 and This.Describe( ls_ref_1 + ".dddw.displaycolumn") = "code" THEN
			ls_reference = dwchild.GetItemString( ll_found, "code" )
			IF ls_screen_name = "Licensure" THEN
				ll_address_code = This.GetItemNumber( 1,"verifying_agency" )
			ELSE
				ll_address_code = This.GetItemNumber( 1,ls_ref_1)
			END IF
		//Start Code Change ----05.07.2008 #V8 maha - error trap	
		ELSEIF ll_found > 0 and This.Describe( ls_ref_1 + ".dddw.displaycolumn") = "entity_name" or This.Describe( ls_ref_1 + ".dddw.displaycolumn") = "entity_name_original" THEN  
			ls_reference = dwchild.GetItemString( ll_found, "entity_name_original" )
		//End Code Change---05.07.2008
			ll_address_code = This.GetItemNumber( 1,ls_ref_1)
		ELSE
			ls_reference = This.GetText()				
		END IF
	END IF

	//get reference 2 data
	li_retval = This.GetChild(ls_ref_2, dwchild)
	IF li_retval = -1 THEN
		This.SetColumn( ls_ref_2 )
		ls_reference = ls_reference + " - " + This.GetText()				
	ELSE
		This.SetColumn( ls_ref_2 )
		ll_found = dwchild.Find( "lookup_code = " + This.GetText(), 1, dwchild.rowcount() )	//Start Code Change ----05.21.2008 #V8 maha - changed 10000 to dw_child.rowcount()
		IF ll_found > 0 and This.Describe( ls_ref_2 + ".dddw.displaycolumn") = "code" THEN
			ls_reference = ls_reference + " - " + dwchild.GetItemString( ll_found, "code" )
		ELSEIF ll_found > 0 and This.Describe( ls_ref_2 + ".dddw.displaycolumn") = "entity_name" THEN
			ls_reference = ls_reference + " - " + dwchild.GetItemString( ll_found, "entity_name" )
			ll_address_code = This.GetItemNumber( 1,ls_ref_1)							
		ELSE
			ls_reference = ls_reference + " - " + This.GetText()
		END IF
	END IF
END IF

UPDATE verif_info  
SET reference_value = :ls_reference,   
    expiration_date = :ldt_exp_date  
WHERE ( verif_info.rec_id = :ll_rec_id ) AND  
      ( verif_info.active_status = 1 )   ;
IF SQLCA.SQLCODE = -1 THEN
	MessageBox( "Update Error", SQLCA.SQLERRTEXT )
END IF

inv_data_entry.of_field_audit( This )

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 2006-10-11 By: Rodger Wu (Inova)
//$<reason> Automatically poping up Verification Update window once
//$<reason> value in exp_field changed.

String ls_sql_where, ls_rec_id_str, ls_sql_original
Long ll_prac_id
n_ds lds_verify
gs_verif_update lstr_verif

IF ( Isnull( ldt_exp_date_original ) and Not Isnull( ldt_exp_date ) ) or &
	( Isnull( ldt_exp_date ) and Not Isnull( ldt_exp_date_original ) ) or &
	( DaysAfter( date( ldt_exp_date_original ), date( ldt_exp_date ))) <> 0 THEN
	ll_rec_id_changed[ Upperbound( ll_rec_id_changed ) + 1 ] = ll_rec_id
END IF

li_cnt = UpperBound( w_mdi.ii_security_action_id )
FOR i = 1 TO li_cnt
	IF w_mdi.ii_security_action_id[ i ] = 160 THEN
		IF w_mdi.ii_security_action_value[ i ] = 0 THEN
			Return 1; //No rights	
		END IF
	END IF		
NEXT

li_cnt = UpperBound( ll_rec_id_changed )
IF li_cnt > 0 THEN
	ll_prac_id = This.GetItemNumber( 1,"prac_id" )
	ls_sql_where = " AND security_user_facilities.user_id = '" + gs_user_id + "' " + &
						" AND pd_affil_stat.prac_id = " + string( ll_prac_id ) + &
						" AND verif_info.screen_id = " + string( li_screen_id )
												
	FOR i = 1 TO li_cnt
		ls_rec_id_str += string( ll_rec_id_changed[i] ) + ", "
	NEXt
	ls_rec_id_str = Left( ls_rec_id_str, Len( ls_rec_id_str ) - 2 )
	ls_sql_where += " AND verif_info.rec_id in ( " + ls_rec_id_str + " ) "

	lds_verify = Create n_ds
	lds_verify.DataObject = "d_verification_facility_de_update"
	lds_verify.SetTransObject( SQLCA )
	
	ls_sql_original = lds_verify.Describe( "Datawindow.Table.Select" )
	ls_sql_original += ls_sql_where
	
	lds_verify.Modify( 'Datawindow.Table.Select = "' + ls_sql_original + '"' )

	IF lds_verify.Retrieve() > 0 THEN
		//IF MessageBox( "ContractLogix", "Do you want to update the verification(s)?", Question!, YesNo!, 1 ) = 2 THEN Return 1; //Start Code Change ---- 11.162006 #V7 maha removed
		
		lstr_verif.sql_syntax = ls_sql_original
		lstr_verif.al_prac_id = ll_prac_id
		lstr_verif.al_screen_id = li_screen_id
		lstr_verif.al_rec_id = ll_rec_id_changed
		
		OpenwithParm( w_verification_de_update, lstr_verif )
		IF Message.StringParm = "OK" THEN ib_prac_data_changed = True
	END IF
END IF

//---------------------------- APPEON END ----------------------------

RETURN 1
end event

event pfc_postupdate;call super::pfc_postupdate;//--------------------------- APPEON BEGIN ---------------------------
//$<add> 2006-10-12 By: Rodger Wu (Inova)
//$<reason> Refresh browse DataWindow while verification is set Response Code.

IF ib_prac_data_changed THEN
	tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.Retrieve()
	tab_1.tabpage_detail.tab_view.selecttab( 1 )
	ib_prac_data_changed = FALSE
END IF
Return 1;

//---------------------------- APPEON END ----------------------------

end event

event itemchanged;call super::itemchanged;//Start Code Change ----08.01.2008 #V85 maha - added to duplicate data entry screen function
long ll_rec_id
integer li_stat
integer li_ans
integer li_screen
datawindow ldw_browse
If This.GetColumnName() = "active_status" then
	li_stat = integer(data)
	IF li_stat = 0 THEN //if inactive display message
		li_ans = MessageBox( "Active Status", "If you change this active status to INACTIVE, all verification entries for this record will be Permanently changed to inactive.  Continue?", StopSign!, YesNo!, 1 )
		IF li_ans = 1 THEN
			li_ans = MessageBox("Active Status", "Are you sure?", StopSign!, YesNo!, 1	)
			IF li_ans = 2 THEN //if no set active
				this.setitem(row,this.getcolumn( ),1 )
				return
			end if
		end if
	End if	
	ldw_browse = tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse
	ll_rec_id = This.GetItemNumber( row, "rec_id" )
	li_screen = ldw_browse.GetItemNumber( ldw_browse.getrow(), "screen_id" )
	inv_action_items.of_update_verif_status( ll_rec_id, li_screen , li_stat )
END IF
//End Code Change---08.01.2008
end event

type dw_dummy_browse from u_dw within tabpage_details
boolean visible = false
integer x = 41
integer y = 1004
integer width = 462
integer height = 384
integer taborder = 11
boolean bringtotop = true
end type

type st_name from statictext within tabpage_details
integer x = 23
integer y = 1360
integer width = 1659
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 80269524
boolean enabled = false
boolean focusrectangle = false
end type

type sle_doc_find from singlelineedit within tabpage_detail
integer x = 2729
integer y = 1712
integer width = 494
integer height = 92
integer taborder = 20
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

event modified;cb_find.Default = True
end event

type cb_find from commandbutton within tabpage_detail
integer x = 3232
integer y = 1712
integer width = 247
integer height = 96
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Find"
end type

event clicked;cb_find.Default = False

ddplb_filters.SelectItem(23)

IF inv_action_items.of_filter( 0, 0, sle_doc_find.Text, +&
				tab_view.tabpage_browse.dw_browse, is_user_id, ddplb_filters   ) = "Found" THEN
	sle_doc_find.Text = ""
ELSE
	sle_doc_find.SetFocus()
END IF

end event

type st_find from statictext within tabpage_detail
integer x = 2309
integer y = 1728
integer width = 416
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
string text = "Document Search:"
boolean focusrectangle = false
end type

type cb_init_recred from commandbutton within tabpage_detail
boolean visible = false
integer x = 27
integer y = 72
integer width = 882
integer height = 108
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Initiate Recredentialing Process"
end type

event clicked;Integer li_cr
Integer li_parent_facility_id
long ll_prac

li_cr = tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.GetRow()

li_parent_facility_id = tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.GetItemNumber( li_cr, "verif_info_facility_id" )
ll_prac = tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.GetItemNumber( li_cr, "prac_id" )

IF inv_printletters.of_start_reappointment_processing( +&
	tab_1.tabpage_detail.tab_view.tabpage_details.dw_detail, +&
	tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse, li_parent_facility_id,ll_prac,"RECRED" ) = 1 THEN
	tab_1.tabpage_detail.tab_view.SelectTab( 1 )
	tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.Event pfc_retrieve()
END IF

if ib_privs then //open privilege batch window maha 081203
//	long prac[]
//	long app[]
//	integer facil[]
//	gs_batch_search lst_sent
//
//	app[1] = 1 //reappoint
//	facil[1] = li_parent_facility_id
//	prac[1] = ll_prac
//	
//	lst_sent.li_prac_id[] = prac[]
//	lst_sent.ll_app[] = app[]
//	lst_sent.ll_facility[] = facil[]
//	
//	openwithparm(w_batch_privilege_update,lst_sent)
		openwithparm(w_renew_priv_form,ll_prac)

end if
end event

type st_1 from statictext within tabpage_detail
integer x = 2368
integer y = 20
integer width = 55
integer height = 64
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
boolean focusrectangle = false
end type

event clicked;if this.text = "" then
	ii_egg = 1
	this.text = "on"
else
	ii_egg = 0
	this.text = ""
end if
end event

type cb_recred_no_ver from commandbutton within tabpage_detail
boolean visible = false
integer x = 1719
integer y = 84
integer width = 786
integer height = 108
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Recredential without Verifications"
end type

event clicked;Integer li_cr
Integer li_parent_facility_id
long ll_prac

li_cr = tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.GetRow()

li_parent_facility_id = tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.GetItemNumber( li_cr, "verif_info_facility_id" )
ll_prac = tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.GetItemNumber( li_cr, "prac_id" )

IF inv_printletters.of_start_reappointment_processing( +&
	tab_1.tabpage_detail.tab_view.tabpage_details.dw_detail, +&
	tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse, li_parent_facility_id,ll_prac,"NOVER" ) = 1 THEN
	tab_1.tabpage_detail.tab_view.SelectTab( 1 )
	tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.Event pfc_retrieve()
END IF

if ib_privs then //open privilege batch window maha 081203
//	long prac[]
//	long app[]
//	integer facil[]
//	gs_batch_search lst_sent
//
//	app[1] = 1 //reappoint
//	facil[1] = li_parent_facility_id
//	prac[1] = ll_prac
//	
//	lst_sent.li_prac_id[] = prac[]
//	lst_sent.ll_app[] = app[]
//	lst_sent.ll_facility[] = facil[]
//	
//	openwithparm(w_batch_privilege_update,lst_sent)
	openwithparm(w_renew_priv_form,ll_prac)
end if
end event

type dw_tracker from datawindow within tabpage_detail
boolean visible = false
integer x = 581
integer y = 1244
integer width = 366
integer height = 364
integer taborder = 40
boolean bringtotop = true
string dataobject = "d_pd_app_audit_tracker"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
end event

type cbx_priv from checkbox within tabpage_detail
boolean visible = false
integer x = 1097
integer y = 100
integer width = 544
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Update Privileges"
end type

event clicked;if this.checked = true then
	ib_privs = true
else
	ib_privs = false
end if
end event

type tabpage_ready from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 3515
integer height = 1988
long backcolor = 80269524
string text = "Committee Status"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
string picturename = "Custom026!"
long picturemaskcolor = 12632256
tab_ready tab_ready
cb_send cb_send
dw_committee dw_committee
st_committee st_committee
cb_1 cb_1
cb_post cb_post
end type

on tabpage_ready.create
this.tab_ready=create tab_ready
this.cb_send=create cb_send
this.dw_committee=create dw_committee
this.st_committee=create st_committee
this.cb_1=create cb_1
this.cb_post=create cb_post
this.Control[]={this.tab_ready,&
this.cb_send,&
this.dw_committee,&
this.st_committee,&
this.cb_1,&
this.cb_post}
end on

on tabpage_ready.destroy
destroy(this.tab_ready)
destroy(this.cb_send)
destroy(this.dw_committee)
destroy(this.st_committee)
destroy(this.cb_1)
destroy(this.cb_post)
end on

type tab_ready from tab within tabpage_ready
event create ( )
event destroy ( )
integer x = 27
integer y = 220
integer width = 3483
integer height = 1580
integer taborder = 31
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 79741120
boolean fixedwidth = true
boolean raggedright = true
tabposition tabposition = tabsonbottom!
alignment alignment = center!
integer selectedtab = 1
tabpage_ready_to_send tabpage_ready_to_send
tabpage_sent_to_comm tabpage_sent_to_comm
end type

on tab_ready.create
this.tabpage_ready_to_send=create tabpage_ready_to_send
this.tabpage_sent_to_comm=create tabpage_sent_to_comm
this.Control[]={this.tabpage_ready_to_send,&
this.tabpage_sent_to_comm}
end on

on tab_ready.destroy
destroy(this.tabpage_ready_to_send)
destroy(this.tabpage_sent_to_comm)
end on

event selectionchanged;IF newindex = 1 THEN
	cb_send.Visible = True
	cb_post.Visible = False
	tab_1.tabpage_ready.tab_ready.tabpage_ready_to_send.dw_ready.SetFocus()
ELSE
	cb_send.Visible = False
	cb_post.Visible = True
	tab_1.tabpage_ready.tab_ready.tabpage_sent_to_comm.dw_sent_to_comm.SetFocus()
END IF


end event

type tabpage_ready_to_send from userobject within tab_ready
event create ( )
event destroy ( )
integer x = 18
integer y = 16
integer width = 3447
integer height = 1464
long backcolor = 79741120
string text = "Ready For Committee"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
dw_ready dw_ready
end type

on tabpage_ready_to_send.create
this.dw_ready=create dw_ready
this.Control[]={this.dw_ready}
end on

on tabpage_ready_to_send.destroy
destroy(this.dw_ready)
end on

type dw_ready from u_dw within tabpage_ready_to_send
integer x = 32
integer y = 32
integer width = 3346
integer height = 1388
integer taborder = 21
boolean bringtotop = true
string dataobject = "d_ready_for_comm"
end type

event clicked;call super::clicked;This.ScrollToRow( This.GetClickedRow( ) )
This.SetRow( This.GetClickedRow( ) )

end event

event constructor;//This.SetRowFocusIndicator( Hand! )
This.of_SetTransObject( SQLCA )
This.of_SetSort( True )

This.inv_sort.of_SetColumnnameSource( This.inv_sort.HEADER )
This.inv_sort.of_SetStyle( This.inv_sort.DROPDOWNLISTBOX )
This.inv_sort.of_SetColumnHeader( TRUE )
This.inv_sort.of_SetColumnDisplayNameStyle( 3 )

This.of_SetUpdateAble( False )


end event

event pfc_retrieve;call super::pfc_retrieve;
Return Retrieve( ii_facility_ids_all[], ii_comm_ids_all[] )
end event

event getfocus;call super::getfocus;idw_active = This
end event

type tabpage_sent_to_comm from userobject within tab_ready
event create ( )
event destroy ( )
integer x = 18
integer y = 16
integer width = 3447
integer height = 1464
long backcolor = 79741120
string text = "Post Committee Results"
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
dw_sent_to_comm dw_sent_to_comm
end type

on tabpage_sent_to_comm.create
this.dw_sent_to_comm=create dw_sent_to_comm
this.Control[]={this.dw_sent_to_comm}
end on

on tabpage_sent_to_comm.destroy
destroy(this.dw_sent_to_comm)
end on

type dw_sent_to_comm from u_dw within tabpage_sent_to_comm
integer x = 32
integer y = 32
integer width = 3351
integer height = 1392
integer taborder = 30
boolean bringtotop = true
string dataobject = "d_sent_to_comm"
end type

event constructor;This.of_SetTransObject( SQLCA )
This.of_SetSort( True )

This.inv_sort.of_SetColumnnameSource( This.inv_sort.HEADER )
This.inv_sort.of_SetStyle( This.inv_sort.DROPDOWNLISTBOX )
This.inv_sort.of_SetColumnHeader( TRUE )
This.inv_sort.of_SetColumnDisplayNameStyle( 3 )

This.of_SetUpdateAble( False )


end event

event pfc_retrieve;call super::pfc_retrieve;Return Retrieve( ii_facility_ids_all[], ii_comm_ids_all[] )
end event

event getfocus;call super::getfocus;idw_active = This
end event

type cb_send from commandbutton within tabpage_ready
integer x = 2843
integer y = 72
integer width = 667
integer height = 84
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Send To Committee"
end type

event clicked;Integer i
Integer li_rc
Integer li_cnt
Long li_facility_id_selected
Long li_committee_id_selected
Integer num_selected
Integer li_selected_row
Long ll_prac_ids[]
Long li_facility
gs_pass_ids lst_ids

lst_ids.l_ids = ll_prac_ids


	IF tab_ready.tabpage_ready_to_send.dw_ready.RowCount() = 0 THEN
		num_selected = 0
	ELSE
		num_selected =  tab_ready.tabpage_ready_to_send.dw_ready.getitemnumber(1,"num_selected")
	END IF

	IF num_selected = 0 THEN
		MessageBox("Select Error", "No practitioners selected!")
		Return
	END IF
	
	li_rc = tab_ready.tabpage_ready_to_send.dw_ready.RowCount( )

	FOR i = 1 TO li_rc
		IF tab_ready.tabpage_ready_to_send.dw_ready.GetItemNumber(i, "selected") = 1 THEN
			li_cnt++
			lst_ids.l_ids[li_cnt] = tab_ready.tabpage_ready_to_send.dw_ready.GetItemNumber(i, "prac_id")
			IF li_cnt = 1 THEN
				li_facility_id_selected = tab_ready.tabpage_ready_to_send.dw_ready.GetItemNumber(i, "facility_id")
				li_committee_id_selected = tab_ready.tabpage_ready_to_send.dw_ready.GetItemNumber(i, "committee_id")
			ELSE
				IF li_facility_id_selected <> tab_ready.tabpage_ready_to_send.dw_ready.GetItemNumber(i, "facility_id") THEN
					MessageBox("Select Error", "Only practitioners from the same facility can be selected.")					
					Return
				END IF
				IF li_committee_id_selected <> tab_ready.tabpage_ready_to_send.dw_ready.GetItemNumber(i, "committee_id") THEN
					MessageBox("Select Error", "Only one committee at a time can be selected.")										
					Return
				END IF				
			END IF
		END IF
	END FOR
	
	li_facility = li_facility_id_selected
	tab_ready.tabpage_ready_to_send.dw_ready.GetItemNumber(1, "num_selected" )


	lst_ids.i_ids[1] = li_facility
	lst_ids.i_ids[2] = li_committee_id_selected

	OpenWithParm( w_send_to_committee, lst_ids )

	IF Message.StringParm <> "Cancel" THEN
		tab_1.tabpage_ready.tab_ready.tabpage_ready_to_send.dw_ready.Event pfc_retrieve()
		tab_1.tabpage_ready.tab_ready.tabpage_sent_to_comm.dw_sent_to_comm.Event pfc_retrieve()
	END IF

end event

type dw_committee from u_dw within tabpage_ready
integer x = 1275
integer y = 72
integer width = 1170
integer height = 100
integer taborder = 11
boolean bringtotop = true
string dataobject = "d_select_credentialing_committee"
boolean vscrollbar = false
boolean border = false
borderstyle borderstyle = stylebox!
end type

event constructor;DataWindowChild dwchild
Integer i
Integer li_rc

This.of_SetupdateAble( False )

//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 08.09.2006 By: LeiWei
//$<reason> Fix a defect.
/*
This.SetTransObject( SQLCA )
This.InsertRow( 0 )

This.GetChild( "credentialing_committee", dwchild )
dwchild.SetTransObject( SQLCA )
li_rc = dwchild.Retrieve( 1 )
*/
This.SetTransObject( SQLCA )

This.GetChild( "credentialing_committee", dwchild )
dwchild.SetTransObject( SQLCA )
li_rc = dwchild.Retrieve( gs_user_id )
if li_rc < 1 then dwchild.insertrow( 0)	//04.15.2008 By Jervis

This.InsertRow( 0 )
//---------------------------- APPEON END ----------------------------

dwchild.InsertRow(1)
dwchild.SetItem( 1, "committee_id", 0 )
dwchild.SetItem( 1, "committee_name", "All" )
This.SetItem(1, "credentialing_committee", 0 )

FOR i = 1 TO li_rc +1
	ii_comm_ids_all[i] = dwchild.GetItemNumber( i, "committee_id" )
END FOR
end event

event itemchanged;call super::itemchanged;Integer i
Integer li_rc
Integer li_dummy_array[]
DatawindowChild dwchild

ii_comm_ids_all = li_dummy_array

AcceptText()

ii_comm_id = Integer( GetText() )

IF ii_comm_id = 0 THEN
	This.GetChild( "credentialing_committee", dwchild )
	li_rc = dwchild.RowCount()
	FOR i = 2 TO li_rc 
		ii_comm_ids_all[i] = dwchild.GetItemNumber( i, "committee_id" )
	END FOR
ELSE
	ii_comm_ids_all[1] = ii_comm_id
END IF

tab_1.tabpage_ready.tab_ready.tabpage_ready_to_send.dw_ready.Event pfc_retrieve()
tab_1.tabpage_ready.tab_ready.tabpage_sent_to_comm.dw_sent_to_comm.Event pfc_retrieve()




end event

type st_committee from statictext within tabpage_ready
integer x = 1275
integer y = 4
integer width = 526
integer height = 64
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
string text = "Credentialing Committee"
boolean focusrectangle = false
end type

type cb_1 from commandbutton within tabpage_ready
integer x = 2528
integer y = 72
integer width = 247
integer height = 84
integer taborder = 21
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Select All"
end type

event clicked;integer i
integer rc

if tab_1.tabpage_ready.tab_ready.selectedtab = 2 then	
	rc = tab_1.tabpage_ready.tab_ready.tabpage_sent_to_comm.dw_sent_to_comm.rowcount()
	for i = 1 to rc
		tab_1.tabpage_ready.tab_ready.tabpage_sent_to_comm.dw_sent_to_comm.setitem(i,"selected",1)
	next

elseif tab_1.tabpage_ready.tab_ready.selectedtab = 1 then
	rc = tab_1.tabpage_ready.tab_ready.tabpage_ready_to_send.dw_ready.rowcount()
	for i = 1 to rc
		tab_1.tabpage_ready.tab_ready.tabpage_ready_to_send.dw_ready.setitem(i,"selected",1)
	next
end if
end event

type cb_post from commandbutton within tabpage_ready
integer x = 2848
integer y = 72
integer width = 667
integer height = 84
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Post Committee Results"
end type

event clicked;// all code changed maha 08-01
string ret
integer r
string ls_batch_info
string ls_type
datetime ldt_return
datetime ldt_start
datetime ldt_end
datetime ldt_pstart
datetime ldt_pend
integer li_prov
string ls_return
string ls_start
string ls_end
string ls_pstart
string ls_pend
datetime ldt_nulldate //maha 041603
long ll_code
Integer i      
Integer li_rc
Integer li_cnt
Integer li_facility_id_selected
Integer li_committee_id_selected
Integer num_selected
Integer li_selected_row
Long ll_prac_ids[]
long ll_recid
Integer li_facility
Integer pos1  
Integer pos2
Integer pos3
Integer pos4  
Integer pos5
Integer pos6
integer li_active
integer cnt
boolean lb_mess = false
n_ds lds_appt_stat
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-14
//$<add> 02.20.2006 By: LeiWei
//$<reason> Performance tuning
//$<modification> Define the variables to be used by subsequent script.
DATASTORE lds_verif_info_seq_no
DATASTORE lds_pd_comm_review_recid
LONG ll_verif_info_row
LONG ll_arr_prac_ids[]
LONG ll_arr_facility_ids[]
LONG ll_selected
LONG ll_arr_recids[]
LONG ll_arr_recids_cnt
//---------------------------- APPEON END ----------------------------

//gs_pass_ids lst_ids

setnull(ldt_nulldate) //maha 041603


//lst_ids.l_ids = ll_prac_ids

	IF tab_ready.tabpage_sent_to_comm.dw_sent_to_comm.RowCount() = 0 THEN
		num_selected = 0
	ELSE
		num_selected =  tab_ready.tabpage_sent_to_comm.dw_sent_to_comm.getitemnumber(1,"num_selected")
	END IF

	IF num_selected = 0 THEN
		MessageBox("Select Error", "No practitioners selected!")	
		Return
	END IF
	li_rc = tab_ready.tabpage_sent_to_comm.dw_sent_to_comm.RowCount( )
	
open(w_committee_return_type) //find batch type: batch or individual
ls_type = message.stringparm

if ls_type = "C" then 
	return	//cancel
	
elseif ls_type = "B" then //batch

	open(w_batch_approval)
	ls_batch_info = message.stringparm

	//messagebox("ls_batch_info",ls_batch_info)
	if ls_batch_info = "C" then return //if canceled
	pos1 = pos(ls_batch_info,";")
	//messagebox("pos1",pos1)
	pos2 = pos(ls_batch_info,";",pos1 + 1)
	//messagebox("pos2",pos2)
	pos3 = pos(ls_batch_info,";",pos2 + 1)
	//messagebox("pos3",pos3)
	pos4 = pos(ls_batch_info,";",pos3 + 1)
	pos5 = pos(ls_batch_info,";",pos4 + 1)
	pos6 = pos(ls_batch_info,";",pos5 + 1)

	ll_code = long(Mid ( ls_batch_info, 1 , pos1 - 1 ))
	
	ls_return = Mid ( ls_batch_info, pos1 + 1,pos2 - pos1 - 1 )
	if ls_return = "1/1/1900" or ls_return = "1/1/2000" then
		setnull(ldt_return)// = ldt_nulldate
	else
		ldt_return = datetime(date(ls_return),now())
	end if
	
	ls_start = Mid ( ls_batch_info, pos2 + 1,pos3 - pos2 - 1 )
	//messagebox("ls_start",ls_start)
	if ls_start = "1/1/1900" or ls_start = "1/1/2000" then
		setnull(ldt_start)// = ldt_nulldate
	else
		ldt_start = datetime(date(ls_start),now())
	end if	
	
	ls_end = Mid ( ls_batch_info, pos3 + 1,pos4 - pos3 - 1 )
	//messagebox("ls_end",ls_end)
	if ls_end = "1/1/1900" or ls_end = "1/1/2000" then
		setnull( ldt_end) //= ldt_nulldate
	else
		ldt_end = datetime(date(ls_end),now())
	end if
	//\/maha 091103
		ls_pstart = Mid ( ls_batch_info, pos4 + 1,pos5 - pos4 - 1 )
	//	messagebox("ls_pstart",ls_pstart)
	if ls_pstart = "1/1/1900" or ls_pstart = "1/1/2000" then
		setnull(ldt_pstart)// = ldt_nulldate
	else
		ldt_pstart = datetime(date(ls_pstart),now())
	end if	
	
	ls_pend = Mid ( ls_batch_info, pos5 + 1,pos6 - pos5 - 1 )
	//messagebox("ls_pend",ls_pend)
	if ls_pend = "1/1/1900" or ls_pend = "1/1/2000" then
		setnull( ldt_pend) //= ldt_nulldate
	else
		ldt_pend = datetime(date(ls_pend),now())
	end if
//return	
	li_prov = integer(Mid ( ls_batch_info, pos6 + 1,1 ))
	//ldt_end = datetime(date(Mid ( ls_batch_info, pos3 + 1)),now())
	li_active = 1
//	messagebox("ll_code",ll_code)
//	messagebox("ldt_return",string(ldt_return))
//	messagebox("ldt_start",string(ldt_start))
//	messagebox("ldt_end",string(ldt_end))
//	messagebox("ldt_pstart",string(ldt_pstart))
//	messagebox("ldt_pend",string(ldt_pend))
//	messagebox("li_prov",string(li_prov))
	
	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> PT-15
	//$<modify> 02.20.2006 By: LeiWei
	//$<reason> Performance tuning
	//$<modification> 1)Move the SQL statements in front of the loop to reduces calls to server.
	//$<modification> 2)Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.
	/*
	lds_appt_stat = CREATE n_ds
	lds_appt_stat.DataObject = "d_pd_affil_status_back"
	
	FOR i = 1 TO li_rc
		IF tab_ready.tabpage_sent_to_comm.dw_sent_to_comm.GetItemNumber(i, "selected") = 1  THEN
			li_selected_row = i
		else 
			continue
		END IF
	
		gl_prac_id = tab_ready.tabpage_sent_to_comm.dw_sent_to_comm.GetItemNumber(li_selected_row, "prac_id")
		gl_facility_id = tab_ready.tabpage_sent_to_comm.dw_sent_to_comm.GetItemNumber(li_selected_row, "facility_id")
		gl_committee_id = tab_ready.tabpage_sent_to_comm.dw_sent_to_comm.GetItemNumber(li_selected_row, "committee_id")

		//\/maha 060302
		datawindowchild dwchild
		lds_appt_stat.GetChild( "parent_facility_id", dwchild )
		dwchild.settransobject(sqlca)
		dwchild.retrieve(gs_user_id)
		lds_appt_stat.GetChild( "verifying_facility", dwchild )
		dwchild.settransobject(sqlca)
		dwchild.retrieve(gs_user_id)
		//\maha
		lds_appt_stat.of_SetTransObject( SQLCA )
		lds_appt_stat.Retrieve( gl_prac_id,gl_facility_id, gs_user_id )
		ll_recid = lds_appt_stat.getitemnumber(1,"rec_id")
		tab_1.tabpage_ready.tab_ready.tabpage_sent_to_comm.dw_sent_to_comm.setitem(i,"pd_comm_review_date_back_from_review",ldt_return)
		tab_1.tabpage_ready.tab_ready.tabpage_sent_to_comm.dw_sent_to_comm.setitem(i,"pd_comm_review_review_results",ll_code)
		tab_1.tabpage_ready.tab_ready.tabpage_sent_to_comm.dw_sent_to_comm.update()
		COMMIT USING SQLCA;
		// maha 071603 after committee saved, see if there are any other unreturned comittees so as to skip setting start date
		//\/maha app080405 restructured 080405
		Select count(committee_id) into :cnt from pd_comm_review where rec_id = :ll_recid and date_back_from_review is null;
		if cnt < 1 then
			//if not(isnull(ldt_start)) then lds_appt_stat.setitem(1,"apptmnt_start_date",ldt_start)
			//Start Code Change ---- 04.26.2006 #413 maha
			if not(isnull(ldt_start)) then 
				lds_appt_stat.setitem(1,"apptmnt_start_date",ldt_start)
				if isnull(lds_appt_stat.getitemdatetime(1,"inital_appmnt_date")) and lds_appt_stat.getitemstring(1,"apptmnt_type") = "I" then
					lds_appt_stat.setitem(1,"inital_appmnt_date",ldt_start)
				end if
			end if
			//End Code Change---04.26.2006

			if not(isnull(ldt_end)) then lds_appt_stat.setitem(1,"apptmnt_end_date",ldt_end)
			if not(isnull(ldt_pstart)) then lds_appt_stat.setitem(1,"init_prov_period_from",ldt_pstart)		
			if not(isnull(ldt_pend)) then lds_appt_stat.setitem(1,"init_prov_period_to",ldt_pend)
			lds_appt_stat.setitem(1,"prov_status",li_prov)
			lds_appt_stat.setitem(1,"active_status",li_active)
			update pd_affil_staff_cat set active_status = 1 where rec_id = :ll_recid;
			update pd_affil_dept set active_status = 1 where rec_id = :ll_recid;
		else
			if not lb_mess then
				lb_mess = true
				messagebox("Notice","The appointment start and end dates have not been set for one or more practitoners in the batch because of additional committee records without a return date."  )
			end if
		end if
		
		lds_appt_stat.update()
		COMMIT USING SQLCA;
		
		//\/maha 080405
	next
	DESTROY lds_appt_stat
	*/

	IF tab_ready.tabpage_sent_to_comm.dw_sent_to_comm.Find('selected = 1',1,li_rc) > 0 THEN
		lds_appt_stat = CREATE n_ds
		lds_appt_stat.DataObject = "d_pd_affil_status_back_forpt"
		lds_appt_stat.of_SetTransObject( SQLCA )
		
		lds_pd_comm_review_recid = CREATE DATASTORE
		lds_pd_comm_review_recid.Dataobject = "d_pd_comm_review_recid_for_pt"
		lds_pd_comm_review_recid.SetTransObject( SQLCA )

		FOR i = 1 TO li_rc
			IF tab_ready.tabpage_sent_to_comm.dw_sent_to_comm.GetItemNumber(i, "selected") = 1  THEN
				li_selected_row = i
				gl_prac_id = tab_ready.tabpage_sent_to_comm.dw_sent_to_comm.GetItemNumber(li_selected_row, "prac_id")
				gl_facility_id = tab_ready.tabpage_sent_to_comm.dw_sent_to_comm.GetItemNumber(li_selected_row, "facility_id")

				ll_selected++
				ll_arr_prac_ids[ ll_selected ] = gl_prac_id
				ll_arr_facility_ids[ ll_selected ] = gl_facility_id
			END IF
		NEXT	

		gnv_appeondb.of_startqueue( )
		
		datawindowchild dwchild
		lds_appt_stat.GetChild( "parent_facility_id", dwchild )
		dwchild.settransobject(sqlca)
		dwchild.retrieve(gs_user_id)
		lds_appt_stat.GetChild( "verifying_facility", dwchild )
		dwchild.settransobject(sqlca)
		dwchild.retrieve(gs_user_id)

		lds_appt_stat.Retrieve( ll_arr_prac_ids, ll_arr_facility_ids, gs_user_id )

		gnv_appeondb.of_commitqueue( )
	
		FOR i = 1 TO lds_appt_stat.Rowcount( )
			ll_arr_recids[i] = lds_appt_stat.getitemnumber(i,"rec_id")
		NEXT
		ll_arr_recids_cnt = lds_pd_comm_review_recid.Retrieve( ll_arr_recids ) 

		gnv_appeondb.of_startqueue( )
		
		FOR i = 1 TO li_rc
			IF tab_ready.tabpage_sent_to_comm.dw_sent_to_comm.GetItemNumber(i, "selected") = 1  THEN
				li_selected_row = i
			else 
				continue
			END IF
		
			gl_prac_id = tab_ready.tabpage_sent_to_comm.dw_sent_to_comm.GetItemNumber(li_selected_row, "prac_id")
			gl_facility_id = tab_ready.tabpage_sent_to_comm.dw_sent_to_comm.GetItemNumber(li_selected_row, "facility_id")
			gl_committee_id = tab_ready.tabpage_sent_to_comm.dw_sent_to_comm.GetItemNumber(li_selected_row, "committee_id")
	
			tab_1.tabpage_ready.tab_ready.tabpage_sent_to_comm.dw_sent_to_comm.setitem(i,"pd_comm_review_date_back_from_review",ldt_return)
			tab_1.tabpage_ready.tab_ready.tabpage_sent_to_comm.dw_sent_to_comm.setitem(i,"pd_comm_review_review_results",ll_code)

			lds_appt_stat.Setfilter( "prac_id = " + String(gl_prac_id) + " and parent_facility_id = " + String(gl_facility_id) )
		   lds_appt_stat.Filter()
			ll_recid = lds_appt_stat.getitemnumber(1,"rec_id")
			
			//Fix a defect. Rodger Wu on Sept 20, 2006
			Integer li_found
			li_found = lds_pd_comm_review_recid.Find( "rec_id = " + string( ll_recid ) + " and committee_id = " + string( gl_committee_id ), 1, ll_arr_recids_cnt )
			IF li_found > 0 THEN
				lds_pd_comm_review_recid.DeleteRow( li_found )
				ll_arr_recids_cnt --
			END IF
			//////////////////////////////////////////
			
			cnt = lds_pd_comm_review_recid.Find("rec_id = " + String(ll_recid), 1, ll_arr_recids_cnt)
			if cnt < 1 then
				//if not(isnull(ldt_start)) then lds_appt_stat.setitem(1,"apptmnt_start_date",ldt_start)		
				//Start Code Change ---- 04.26.2006 #413 maha
				if not(isnull(ldt_start)) then 
					lds_appt_stat.setitem(1,"apptmnt_start_date",ldt_start)
					if isnull(lds_appt_stat.getitemdatetime(1,"inital_appmnt_date")) and lds_appt_stat.getitemstring(1,"apptmnt_type") = "I" then
						lds_appt_stat.setitem(1,"inital_appmnt_date",ldt_start)
					end if
				end if
				//End Code Change---04.26.2006

				if not(isnull(ldt_end)) then lds_appt_stat.setitem(1,"apptmnt_end_date",ldt_end)
				if not(isnull(ldt_pstart)) then lds_appt_stat.setitem(1,"init_prov_period_from",ldt_pstart)		
				if not(isnull(ldt_pend)) then lds_appt_stat.setitem(1,"init_prov_period_to",ldt_pend)
				lds_appt_stat.setitem(1,"prov_status",li_prov)
				lds_appt_stat.setitem(1,"active_status",li_active)
				update pd_affil_staff_cat set active_status = 1 where rec_id = :ll_recid;
				update pd_affil_dept set active_status = 1 where rec_id = :ll_recid;
			else
				if not lb_mess then
					lb_mess = true
					//--------------------------- APPEON BEGIN ---------------------------
					//$<modify> 2007.08.31 By: Jack
					//$<reason> Fix a defect.
					/*
					messagebox("Notice","The appointment start and end dates have not been set for one or more practitoners in the batch because of additional committee records without a return date."  )
					*/
   				messagebox("Notice","The appointment start and end dates have not been set for one or more practitioners in the batch because of additional committee records without a return date."  )
					//---------------------------- APPEON END ----------------------------
				end if
			end if
		NEXT

		tab_1.tabpage_ready.tab_ready.tabpage_sent_to_comm.dw_sent_to_comm.update()
		lds_appt_stat.update()
		COMMIT USING SQLCA;

		gnv_appeondb.of_commitqueue( )
	
		DESTROY lds_appt_stat
		DESTROY lds_pd_comm_review_recid
	END IF
else //****************** individual ************************


	FOR i = 1 TO li_rc
		IF tab_ready.tabpage_sent_to_comm.dw_sent_to_comm.GetItemNumber(i, "selected") = 1  THEN
			li_selected_row = i
		else 
			continue
		END IF
	
		gl_prac_id = tab_ready.tabpage_sent_to_comm.dw_sent_to_comm.GetItemNumber(li_selected_row, "prac_id")
		gl_facility_id = tab_ready.tabpage_sent_to_comm.dw_sent_to_comm.GetItemNumber(li_selected_row, "facility_id")
		gl_committee_id = tab_ready.tabpage_sent_to_comm.dw_sent_to_comm.GetItemNumber(li_selected_row, "committee_id")
		Open(w_back_from_committee)
		IF Message.StringParm = "Cancel" THEN
			tab_ready.tabpage_sent_to_comm.dw_sent_to_comm.setItem(li_selected_row, "selected",0)
			continue
		ELSE
			//tab_1.tabpage_ready.tab_ready.tabpage_sent_to_comm.dw_sent_to_comm.Event pfc_retrieve()		
		END IF

	next
//	IF Message.StringParm <> "Cancel" THEN
//			tab_1.tabpage_ready.tab_ready.tabpage_ready_to_send.dw_ready.Event pfc_retrieve()
//		tab_1.tabpage_ready.tab_ready.tabpage_sent_to_comm.dw_sent_to_comm.Event pfc_retrieve()
//	END IF
	
end if

	if ib_letters then //if approval letters were selected create letter verifications
		
		n_ds lds_verif_rec
		integer li_nr
		long ll_prac_id
		long ll_facility_id
		Long ll_seq_no
		long ll_rec_id
		string ls_letter_name
		long ll_prac_corro
		string ls_doc_id
		
		
		open(w_select_letter)
		
		ls_letter_name = message.stringparm
		if ls_letter_name = "C" then
			//skip letter creation
		else
  
			lds_verif_rec = CREATE n_ds
			lds_verif_rec.DataObject = "d_ver_summary_record_view"
			lds_verif_rec.of_SetTransObject( SQLCA )
	
			//--------------------------- APPEON BEGIN ---------------------------
			//$<ID> PT-16
			//$<add> 02.20.2006 By: LeiWei
			//$<reason> Performance tuning
			//$<modification> 1)Use lds_verif_info_seq_no to cache data instead of using SQL statements in the following loop.
			//$<modification> 2)Write script to retrieve data from a cache instead of from the database.
			IF tab_ready.tabpage_sent_to_comm.dw_sent_to_comm.Find('selected <> 0',1,li_rc) > 0 THEN
				lds_verif_info_seq_no = CREATE Datastore
				lds_verif_info_seq_no.Dataobject = "d_verif_info_max_seq_no_forpt"
				lds_verif_info_seq_no.SetTransObject( SQLCA )
				lds_verif_info_seq_no.Retrieve( ls_letter_name )
				
				ll_prac_corro = long(gnv_data.of_getitem("code_lookup","lookup_code","upper(description) = upper('Practitioner Correspondence')" ))
			
				ll_seq_no++
				ll_rec_id = gnv_app.of_get_id( "RECORD_ID" , li_rc ) - 1
			END IF
			//---------------------------- APPEON END ----------------------------

			FOR i = 1 TO li_rc
			IF tab_ready.tabpage_sent_to_comm.dw_sent_to_comm.GetItemNumber(i, "selected") = 0  THEN
				continue
			else 
				li_nr = lds_verif_rec.InsertRow( 0 )
				ll_prac_id = tab_ready.tabpage_sent_to_comm.dw_sent_to_comm.GetItemNumber(i, "prac_id")
				ll_facility_id = tab_ready.tabpage_sent_to_comm.dw_sent_to_comm.GetItemNumber(i, "facility_id")

				//--------------------------- APPEON BEGIN ---------------------------
				//$<ID> PT-17
				//$<modify> 02.20.2006 By: LeiWei
				//$<reason> Performance tuning
				//$<modification> Write script to retrieve data from a cache instead of from the database.

				/*
				SELECT Max( seq_no )  
				into :ll_seq_no
				 FROM verif_info  
				WHERE ( facility_id = :ll_facility_id ) AND  
							( prac_id = :ll_prac_id  )  and 
								(reference_value = :ls_letter_name);
				IF IsNull( ll_seq_no ) THEN
					ll_seq_no = 0
					
				END IF
				
				select lookup_code
				into :ll_prac_corro
				from code_lookup
				where description = 'Practitioner Correspondence' using sqlca;
								
				ll_seq_no++
				ll_rec_id = gnv_app.of_get_id( "RECORD_ID" )
				*/
				
				ll_verif_info_row = lds_verif_info_seq_no.Find("facility_id = " + string(ll_facility_id) + " and prac_id = " + string(ll_prac_id),1,lds_verif_info_seq_no.RowCount())
				IF ll_verif_info_row > 0 THEN
					ll_seq_no = lds_verif_info_seq_no.GetItemNumber( ll_verif_info_row, "max_seq_no" ) + 1
				ELSE
					ll_seq_no = 1
				END IF
				
				ll_rec_id ++
				//---------------------------- APPEON END ----------------------------

				lds_verif_rec.SetItem( li_nr, "reference_value", ls_letter_name )
				lds_verif_rec.SetItem( li_nr , "rec_id", ll_rec_id )
				lds_verif_rec.SetItem( li_nr , "seq_no", ll_seq_no )
				lds_verif_rec.SetItem( li_nr, "screen_id", 1 )			
				lds_verif_rec.SetItem( li_nr, "prac_id",  ll_prac_id )			
				lds_verif_rec.SetItem( li_nr, "verif_info_facility_id", ll_facility_id )			
				lds_verif_rec.SetItem( li_nr, "priority_user", "PUBLIC" )
				lds_verif_rec.SetItem( li_nr, "priority", 2 )
				lds_verif_rec.SetItem( li_nr, "verification_method", ll_prac_corro )
				lds_verif_rec.SetItem( li_nr, "active_status", 1 )
				lds_verif_rec.SetItem( li_nr, "print_flag", 1)
				ls_doc_id = String( ll_rec_id ) + "-" + String( ll_prac_id ) + "-" + String( ll_facility_id ) + "-" + String( ll_seq_no )
				lds_verif_rec.SetItem( li_nr, "doc_id", ls_doc_id )		
				lds_verif_rec.SetItem( li_nr, "exp_credential_flag", 0 )			
			END IF
			END FOR
			
			//--------------------------- APPEON BEGIN ---------------------------
			//$<ID> PT-18
			//$<add> 02.20.2006 By: LeiWei
			//$<reason> Performance tuning
			//$<modification> Add Appeon Commit label to reduce client-server interactions to improve runtime performance.

			gnv_appeondb.of_autocommit( )
			//---------------------------- APPEON END ----------------------------

			IF lds_verif_rec.Update() = -1 THEN
				MessageBox("Update Error", SQLCA.SQLERRTEXT )
				//--------------------------- APPEON BEGIN ---------------------------
				//$<Add> 08.22.2007 By: Evan
				//$<Reason> Need to destroy object.
				if IsValid(lds_verif_info_seq_no) then Destroy lds_verif_info_seq_no
				//---------------------------- APPEON END ----------------------------				
				Return -1
			else
				MessageBox("Approval letters","The Approval Letter Action Items have been created, and can be run using the Practitioner Correspondence filter")
			END IF
			COMMIT USING SQLCA;
			
			DESTROY lds_verif_rec
		end if
	end if

if ib_privs then //open privilege batch window maha 081203
	long prac[]
	long app[]
	integer facil[]
	gs_batch_search lst_sent

	app[1] = 1 //reappoint
	
	facil[1] = tab_ready.tabpage_sent_to_comm.dw_sent_to_comm.GetItemNumber(1, "facility_id")

	FOR i = 1 TO li_rc
		IF tab_ready.tabpage_sent_to_comm.dw_sent_to_comm.GetItemNumber(i, "selected") = 1  THEN
			prac[i] = tab_ready.tabpage_sent_to_comm.dw_sent_to_comm.GetItemNumber(i, "prac_id")
		end if
	next
	lst_sent.li_prac_id[] = prac[]
	lst_sent.ll_app[] = app[]
	lst_sent.ll_facility[] = facil[]
	
	openwithparm(w_batch_privilege_update,lst_sent)
end if


tab_1.tabpage_ready.tab_ready.tabpage_sent_to_comm.dw_sent_to_comm.Event pfc_retrieve()

//--------------------------- APPEON BEGIN ---------------------------
//$<Add> 08.22.2007 By: Evan
//$<Reason> Need to destroy object.
if IsValid(lds_verif_info_seq_no) then Destroy lds_verif_info_seq_no
//---------------------------- APPEON END ----------------------------
end event

type tabpage_net_dev from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3515
integer height = 1988
long backcolor = 80269524
string text = "Application Status"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
string picturename = "SetDefaultClass!"
long picturemaskcolor = 12632256
uo_net_dev uo_net_dev
end type

on tabpage_net_dev.create
this.uo_net_dev=create uo_net_dev
this.Control[]={this.uo_net_dev}
end on

on tabpage_net_dev.destroy
destroy(this.uo_net_dev)
end on

type uo_net_dev from pfc_ia_cst_nv_net_dev_new_action_items within tabpage_net_dev
integer x = 32
integer y = 60
integer taborder = 50
boolean bringtotop = true
boolean border = false
long backcolor = 81324524
end type

event pfc_cst_net_dev_filter;
Open( w_net_dev_filter)

IF gs_cust_type = "I" THEN
	w_net_dev_filter.is_open_from1 = "PFIA"
ELSE
	w_net_dev_filter.is_open_from1 = "PFCA"	
END IF
w_net_dev_filter.y = w_net_dev_filter.y + 200

end event

on uo_net_dev.destroy
call pfc_ia_cst_nv_net_dev_new_action_items::destroy
end on

event constructor;call super::constructor;
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-19
//$<add> 01.23.2006 By: LeiWei
//$<reason> Performance tuning
//$<modification> Copy the following script from the Open event of w_action_items due
//$<modification> to the usage of CreateOnDemand. Refer to PT-05 for more information.
This.of_Set_Facility_id( 0 )
This.of_sql()
//---------------------------- APPEON END ----------------------------

end event

type tabpage_contract from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3515
integer height = 1988
long backcolor = 79741120
string text = "Contract"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "Module-Contract- Contact.bmp"
long picturemaskcolor = 12632256
uo_1 uo_1
end type

on tabpage_contract.create
this.uo_1=create uo_1
this.Control[]={this.uo_1}
end on

on tabpage_contract.destroy
destroy(this.uo_1)
end on

type uo_1 from uo_ctx_ai within tabpage_contract
integer width = 3515
integer height = 1908
integer taborder = 31
end type

on uo_1.destroy
call uo_ctx_ai::destroy
end on

event rbuttondown;Return 1
end event

type tabpage_document_manager from uo_ctx_ai_doc within tab_1
integer x = 18
integer y = 112
integer width = 3515
integer height = 1988
string text = "Document Manager"
end type

type uo_lights from uo_filter_lights within w_action_items
integer x = 2542
integer y = 1976
integer height = 132
integer taborder = 30
boolean bringtotop = true
boolean border = false
long backcolor = 80269524
end type

on uo_lights.destroy
call uo_filter_lights::destroy
end on

