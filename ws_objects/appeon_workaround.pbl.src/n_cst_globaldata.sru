$PBExportHeader$n_cst_globaldata.sru
forward
global type n_cst_globaldata from nonvisualobject
end type
end forward

global type n_cst_globaldata from nonvisualobject
end type
global n_cst_globaldata n_cst_globaldata

type variables
datastore 	ids_security_users
datastore 	ids_icred_settings
datastore	ids_ids

datastore ids_pictures
datastore 	ids_systables

datastore  ids_code_lookup,ids_code_lookup_dddw , ids_code_lookup_date

datastore ids_sys_fields
datastore ids_ctx_notification
datastore ids_ctx_ai_notification, ids_ctx_am_ai_notification //Alfee 02.26.2008
datastore ids_ctx_all_notification

long il_ids_sys_fields_cnt

datastore ids_facility
datastore ids_data_view_screen

datastore ids_contract_search
//--------------------------- APPEON BEGIN ---------------------------
//$<add> 10.12.2006 By: Jack (Inova)
//$<reason> Queue Images for Scanning from Data Entry.
datastore ids_image_type

//---------------------------- APPEON END ----------------------------

//Added for work flow. 6/11/2006 Henry
datastore ids_workflow
datastore ids_workflow_action
datastore ids_workflow_status
datastore ids_workflow_trigger_comp
datastore ids_workflow_trigger_item
datastore ids_screen_table_p
datastore ids_screen_table_c

//Added for work flow. 4/12/2006 Jervis
datastore ids_workflow_status_filter
datastore ids_template_clause_rules //for template dynamic adding rules - Alfee 11.12.2007

//Added for dddw question. 8/15/2008 Alan
datastore ids_question_lookup

datastore ids_data_view  //Added By Ken.Guo 2009-07-10.

//Added by jervis 09.27.2009
datastore ids_field_depend
datastore ids_lookup_depend

//Add by jervis 12.9.2009
datastore ids_ctx_facility

n_ds ids_em_user_msg_list,ids_em_user_config //Added By Ken.Guo 2010-03-26.

Datastore ids_getting_started,ids_dashboard_getting_started //Added By Ken.Guo 2010-05-19.

Datastore ids_clause_attribute //Added By Ken.Guo 2010-12-16.

Datastore ids_clause //Added By Ken.Guo 2011-05-03.

datastore ids_screen_field_tips //Added By Jay Chen 10-09-2015

datastore ids_field_compute_expression, ids_field_compute_expression_mul //Added By Ken.Guo 2016-08-17
datastore ids_email_template_settings //Added By Ken.Guo 2016-08-24
datastore ids_field_other_properties //Added By Ken.Guo 2017-03-03
datastore ids_multi_select_fields //Added By Ken.Guo 2017-05-09
end variables

forward prototypes
public function string of_getitem (string as_tablename, string as_columnname, boolean ab_multirows)
public subroutine of_retrieve (string as_cachename)
public function string of_getitem (string as_tablename, string as_columnname, string as_condition)
public subroutine of_initdatacache ()
public subroutine of_init_table_reccount (long al_tableids[])
public subroutine of_set_dwchild_fromcache (string as_table_name, string as_condition, datawindowchild a_dwchild)
public subroutine of_get_data_from_cache (string as_table_name, string as_condition, datastore a_dwchild)
public function long of_findrow (string as_tablename, string as_condition)
public function string of_getitem (string as_tablename, long al_row, string as_columnname)
public function string of_get_table_name (integer al_screen, string as_module, string as_column)
public function string of_get_filter_data (string as_tablename, string as_condition, string as_name)
public subroutine of_refresh_systemdatacache ()
public function integer of_get_defaultdddwcache ()
public subroutine of_refresh_all_data ()
public function string of_getitem (string as_tablename, string as_columnname, string as_condition, string as_case)
public function integer of_insert_main_data (datawindow adw_main, datawindow adw_detail, string as_main_table_name, long al_main_currentrow, long al_detail_currentrow)
public function integer of_getcache (string as_cachename, ref datastore ads_cache, ref string as_dataobject)
public function integer of_initcache (string as_cachename)
public function integer of_retrieveifnecessary (string as_cachename, boolean ab_alwaysretrieve)
end prototypes

public function string of_getitem (string as_tablename, string as_columnname, boolean ab_multirows);//
string	ls_value

//------------------------------------------------------------------------
// 1.9.2017 <RP> added
IF of_retrieveIfNecessary(as_tablename, FALSE) = -1 THEN
	return ""
END IF
//------------------------------------------------------------------------

Choose Case as_tablename
	Case 'icred_settings'
		Choose Case Lower(as_columnname)
			Case "dev_title","downloadurl","wv_db_version","set_patch_ver","PntDownLoadPath","set_addresser","license_info","web_link_name", &
				"cache_name","email_encoding","calfiltername_1","calfiltername_2","calfiltername_3","email_tag","send_email_log_to","es_apicode", &
				"ctx_web_link","use_web_email","cache_name","esign_type","echo_apicode","send_range","get_field_before_export","docusign_apicode",&
				"docusign_username","docusign_password","docusign_userid","docusign_accountid", "http_visit","optimize_comparison_workflow",&
				"enable_special_attribute","use_name_login","show_column_tip","clause_update_prompt","clause_update_template","sync_screen_contact","filter_company_contact","add_doc_merge",&
				"track_document_change","echosign_method", "only_saml_user", "use_saml","saml_force_https"
							//Added By Mark Lee 01/08/2014		send_range		
				//Added By Mark Lee 08/27/2015		add clause_update_template column	
				//Added By Jay Chen 10-27-2015 add sync_screen_contact
				//Added by gavins 20160909   "only_saml_user", "use_saml","saml_force_https"
				ls_value = ids_icred_settings.getitemstring( 1 , as_columnname)		
			Case else
				ls_value = String(ids_icred_settings.getitemnumber( 1 , as_columnname))
		End Choose
		
		//Added By Ken.Guo 07/01/2013. workaround license bug for DM.
		If ls_value = '0' and as_columnname = 'set_51' Then 
			ls_value = '3'  //3: Buy, 0: N/A, 1: Buy/Sell
		End If
		
	Case 'ids'
		Choose Case Lower(as_columnname)
			Case "intelliapp_app_path","imaging_path","install_type","picture_path","print_space","database_backup_path","oig_url","citrix_npdb_path","contract_path"
				ls_value = ids_ids.getitemstring( 1 , as_columnname)		
			Case "last_oig_update","last_update","lookup_cache","screen_cache","screen_obj_cache","last_query"
				ls_value = String(ids_ids.getitemdatetime( 1 , as_columnname))
			Case else
				ls_value = String(ids_ids.getitemnumber( 1 , as_columnname))
		End Choose
	Case 'em_user_config' //Added By Ken.Guo 2010-03-26.
		If ids_em_user_config.rowcount() = 0 Then Return ''
		Choose Case Lower(as_columnname)
			Case 'email_receive_start_date'
				ls_value = String(ids_em_user_config.GetItemDateTime(1,as_columnname),'yyyy-mm-dd')
			Case Else //'email_receive_by_date','email_receive_by_clx','email_receive_by_subject','email_receive_all','email_log','email_delete_from_server','email_timer','email_rule_type'
				ls_value = String(ids_em_user_config.GetItemNumber(1,as_columnname))
		End Choose
	Case 'dashboard_gadgets_getting_started'
		Choose Case Lower(as_columnname)
			Case 'display_columns'
				ls_value = String(ids_dashboard_getting_started.GetItemNumber(1,as_columnname))
			Case 'sort_result'
				ls_value = ids_dashboard_getting_started.GetItemString(1,as_columnname)
		End Choose
		
End Choose

Return ls_value

end function

public subroutine of_retrieve (string as_cachename);//	1.9.2017	<RP>		Re-route to of_retrieveIfNecessary()
//
of_retrieveIfNecessary(as_cachename, TRUE)
return

//------------------------------------------------------------------------------------
// <RP> 1.10.2017 Comment out remainder of code:

////////////////////////////////////////////////////////////////////////
//// $<function>n_cst_globaldataof_retrieve()
//// $<arguments>
////		value	string	as_cachename		
//// $<returns> (none)
//// $<description>
//// $<description>
////////////////////////////////////////////////////////////////////////
//// $<add> 01.17.2006 by Cao YongWang
////////////////////////////////////////////////////////////////////////
//
//
//Choose case as_cachename
//	Case 'icred_settings'
//		ids_icred_settings.dataobject = 'd_g_icred_settings'
//		ids_icred_settings.settransobject(SQLCA)
//		
//		//--------------------------- APPEON BEGIN ---------------------------
//		//$<add> 2006-08-07 By: Rodger Wu
//		//$<reason> Fix a defect that exists in automatical updates of ASA database.
//		
//		/* ids_icred_settings.retrieve() */
//		
//		Integer li_return = 0
//		string ls_sql
//		
//		li_return = ids_icred_settings.retrieve()
//		//Begin - Added By Mark Lee 04/25/12 move to n_cst_update_sql
////		if li_return < 0 then
////			ls_sql = "Alter table icred_settings add web_crawl integer null; "
////			execute immediate :ls_sql using sqlca;
////			commit using sqlca;
////			
////			ls_sql = " Alter table icred_settings add downloadurl varchar(255) null; "
////			execute immediate :ls_sql using sqlca;
////			commit using sqlca;
////			
////			ids_icred_settings.retrieve()
////		end if
//		//End - Added By Mark Lee 04/25/12
//
//		//---------------------------- APPEON END ----------------------------
//	Case 'security_users'
//		ids_security_users.dataobject = 'd_g_security_users'
//		ids_security_users.settransobject(SQLCA)
//		ids_security_users.retrieve()
//	Case 'ids'
//		ids_ids.dataobject = 'd_g_ids'
//		ids_ids.settransobject(SQLCA)
//		ids_ids.retrieve()
//	Case 'sys_tables'
//		ids_systables.dataobject = 'd_g_sys_tables'
//		ids_systables.settransobject(SQLCA)
//		ids_systables.retrieve()
//	Case 'code_lookup'
//		ids_code_lookup.dataobject = 'd_g_code_lookup'
//		ids_code_lookup.settransobject(SQLCA)
//		ids_code_lookup.retrieve()
//	Case 'sys_fields'
//		ids_sys_fields.dataobject = 'd_audit_fields_all'
//		ids_sys_fields.settransobject(SQLCA)
//		il_ids_sys_fields_cnt = ids_sys_fields.retrieve()
//	Case 'ctx_notification'
//		ids_ctx_notification.dataobject = 'd_g_ctx_notification'
//		ids_ctx_notification.settransobject(SQLCA)
//		ids_ctx_notification.retrieve()
//	case 'ctx_all_notification' //jervis 07.04.2011
//		ids_ctx_all_notification.dataobject = 'd_g_ctx_all_notification'
//		ids_ctx_all_notification.settransobject(SQLCA)
//		ids_ctx_all_notification.retrieve()
//	//---Begin Added by Alfee 02.26.2008--------
//	Case 'ctx_ai_notification'
//		ids_ctx_ai_notification.dataobject = 'd_g_ctx_ai_notification'
//		ids_ctx_ai_notification.settransobject(SQLCA)
//		ids_ctx_ai_notification.retrieve()
//	Case 'ctx_am_ai_notification'
//		ids_ctx_am_ai_notification.dataobject = 'd_g_ctx_am_ai_notification'
//		ids_ctx_am_ai_notification.settransobject(SQLCA)
//		ids_ctx_am_ai_notification.retrieve()
//	//---End Added -----------------------------	
//	Case 'facility'
//		ids_facility.dataobject = 'd_g_facility'
//		ids_facility.settransobject(SQLCA)
//		ids_facility.retrieve()
//	case 'data_view_screen'
//		ids_data_view_screen.dataobject = 'd_g_data_view_screen'
//		ids_data_view_screen.settransobject(SQLCA)
//		ids_data_view_screen.retrieve()
//	case 'contract_search'
//		ids_contract_search.dataobject = 'd_contract_search_forpt'
//		ids_contract_search.settransobject(SQLCA)
//		ids_contract_search.retrieve()	
//	//--------------------------- APPEON BEGIN ---------------------------
//	//$<add> 10.12.2006 By: Jack (Inova)
//	//$<reason> Queue Images for Scanning from Data Entry.
//	case 'image_type'
//		ids_image_type.dataobject = 'd_image_painter'
//		ids_image_type.settransobject(SQLCA)
//		ids_image_type.retrieve()		
//	//---------------------------- APPEON END ----------------------------
//	
//	//Added for work flow. 6/11/2006 Henry
//	case 'wf_workflow'
//		ids_workflow.dataobject = 'd_g_workflow_data'
//		ids_workflow.settransobject( sqlca)
//		ids_workflow.retrieve( )
//	case 'wf_action_types'
//		ids_workflow_action.dataobject = 'd_g_action_types_data'
//		ids_workflow_action.settransobject( sqlca)
//		ids_workflow_action.retrieve( )
//	case 'wf_action_status'
//		ids_workflow_status.dataobject = 'd_g_action_status_data'
//		ids_workflow_status.settransobject( sqlca)
//		ids_workflow_status.retrieve( )
//		
//		//Added by Jervis 04.12.2006
//		ids_workflow_status_filter.dataobject = "d_g_action_status_filter"
//		ids_workflow_status_filter.settransobject(sqlca)
//		ids_workflow_status_filter.retrieve()
//	Case 'wf_trigger_param_data_comparison'
//		ids_workflow_trigger_comp.dataobject = 'd_g_trigger_param_data_comparison_data'
//		ids_workflow_trigger_comp.settransobject( sqlca)
//		ids_workflow_trigger_comp.retrieve( )
//	Case 'wf_trigger_param_action_status'
//		ids_workflow_trigger_item.dataobject = 'd_g_trigger_param_action_status_data'
//		ids_workflow_trigger_item.settransobject( sqlca)
//		ids_workflow_trigger_item.retrieve( )
//	//End added for work flow
//	
//	//Added 11.30.2006 
//	Case 'code_lookup_2'
//		ids_code_lookup_date.dataobject = 'd_code_lookup_modify_date_all'
//		ids_code_lookup_date.settransobject( sqlca)
//		ids_code_lookup_date.retrieve( )
//	//-----Begin Added by Alfee 11.12.2007---------------
//	case 'template_clause_rules' //for dynamic adding clauses' rules to templates
//		ids_template_clause_rules.dataobject = 'd_dm_template_clause_rules'
//		ids_template_clause_rules.settransobject( sqlca)
//		ids_template_clause_rules.retrieve( )
//	//-----End Added -------------------------------------	
//	//-----Begin Added by Alan 19.08.2008----------------
//	Case 'question_lookup'
//		ids_question_lookup.dataobject = 'd_g_quest_lookup'
//		ids_question_lookup.settransobject( sqlca)
//		ids_question_lookup.retrieve( )
//	//-----End Added	
//	Case 'data_view' //Added By Ken.Guo 2009-07-10.
//		ids_data_view.dataobject = 'd_g_data_view'
//		ids_data_view.SetTransObject(SQLCA)
//		ids_data_view.Retrieve()
//	CASE 'depend_field'
//		ids_field_depend.dataobject = 'd_depend_field_all'
//		ids_field_depend.SetTransObject(SQLCA)
//		ids_field_depend.Retrieve()
//	case 'depend_lookup'
//		ids_lookup_depend.dataobject = 'd_depend_lookup_all'
//		ids_lookup_depend.SetTransObject(SQLCA)
//		ids_lookup_depend.Retrieve()
//	case 'ctx_facility'	//Jervis - 12.10.2009
//		ids_ctx_facility.dataobject = 'd_g_ctx_facility'
//		ids_ctx_facility.Settransobject( sqlca)
//		ids_ctx_facility.Retrieve( )
//	case 'em_user_msg' //Added By Ken.Guo 2010-03-26.
//		ids_em_user_msg_list.dataobject = 'd_g_em_user_msg_list'
//		ids_em_user_msg_list.Settransobject(SQLCA)
//		ids_em_user_msg_list.Retrieve(gs_user_id)
//	case 'em_user_config' //Added By Ken.Guo 2010-03-26.
//		ids_em_user_config.dataobject = 'd_em_user_config'
//		ids_em_user_config.Settransobject(SQLCA)
//		ids_em_user_config.Retrieve(gs_user_id)	
//	case 'getting_started_data' //Added By Ken.Guo 2010-05-19.
//		ids_getting_started.dataobject = 'd_g_getting_started'
//		ids_getting_started.Settransobject(SQLCA)
//		ids_getting_started.Retrieve()				
//	case 'dashboard_getting_started'//Added By Ken.Guo 2010-05-19.
//		ids_dashboard_getting_started.dataobject = 'd_dashb_gadget_getting_started'
//		ids_dashboard_getting_started.Settransobject(SQLCA)
//		ids_dashboard_getting_started.Retrieve(gs_user_id)
//	case 'clause_attribute' //Added By Ken.Guo 2010-12-16.
//		ids_clause_attribute.dataobject = 'd_g_acp_clause_attr_val_list'
//		ids_clause_attribute.Settransobject(SQLCA)
//		ids_clause_attribute.Retrieve()		
//	case 'clause' //Added By Ken.Guo 2011-05-03.
//		ids_clause.dataobject = 'd_g_clause'
//		ids_clause.Settransobject(SQLCA)
//		ids_clause.Retrieve()		
//	case 'ctx_pictures' //Added By Ken.Guo 2011-05-03.
//		ids_pictures.dataobject = 'd_g_pictures'
//		ids_pictures.Settransobject(SQLCA)
//		ids_pictures.Retrieve()	
//	case 'ctx_screen_field_tips' //Added By Jay Chen 10-09-2015
//		ids_screen_field_tips.dataobject = 'd_g_screen_field_tips'
//		ids_screen_field_tips.Settransobject(SQLCA)
//		ids_screen_field_tips.Retrieve()	
//	case 'field_compute_expression' //Added By Ken.Guo 2016-08-17
//		ids_field_compute_expression.dataobject = 'd_g_field_use_compute_expression'
//		ids_field_compute_expression.Settransobject(SQLCA)
//		ids_field_compute_expression.Retrieve()	
//	case 'field_compute_expression_mul' //Added By Ken.Guo 2016-08-19
//		ids_field_compute_expression_mul.dataobject = 'd_g_field_compute_expression'
//		ids_field_compute_expression_mul.Settransobject(SQLCA)
//		ids_field_compute_expression_mul.Retrieve()		
//	case 'email_template_settings' //Added By Ken.Guo 2016-08-24
//		ids_email_template_settings.dataobject = 'd_g_email_template_settings'
//		ids_email_template_settings.Settransobject(SQLCA)
//		ids_email_template_settings.Retrieve()				
//		
//End Choose
end subroutine

public function string of_getitem (string as_tablename, string as_columnname, string as_condition);//
string	ls_value
long		ll_findrow

ls_value = "@#"

//------------------------------------------------------------------------
// 1.9.2017 <RP> added
IF of_retrieveIfNecessary(as_tablename, FALSE) = -1 THEN
	return ""
END IF
//------------------------------------------------------------------------

Choose Case as_tablename	
	Case 'security_users'
		ll_findrow = ids_security_users.find(as_condition , 1,  ids_security_users.rowcount())
		If ll_findrow <= 0 Then Return ""

		Choose Case Lower(as_columnname)
			Case "user_id","user_password","email_id","req_expand_status"
				ls_value = ids_security_users.getitemstring(ll_findrow,  as_columnname)
			//Case "default_search_facility","default_view","role_id","contract_default_view"	, "set_tdl","set_task",	"set_1","set_2","set_3","set_4"
			Case "default_search_facility","default_view","role_id","contract_default_view"	, "set_tdl","set_task",	"set_1","set_2","set_3","set_4", "lic_agr_img", "lic_agr_asa","doc_auto_retrieve","contract_display_mode" //Alfee 07.14.2008
				ls_value = String(ids_security_users.getitemnumber( ll_findrow, as_columnname))
			Case Else //Added by Ken.guo 2011-07-04
				ls_value = String(ids_security_users.getitemnumber( ll_findrow, as_columnname))
		End Choose
	Case 'code_lookup'
		ll_findrow = ids_code_lookup.find(as_condition , 1,  ids_code_lookup.rowcount())
		If ll_findrow <= 0 Then Return ""

		Choose Case Lower(as_columnname)
			//--------------------------- APPEON BEGIN ---------------------------
			//$<add> 11.16.2006 By: Jervis
			//$<reason> 
			//Case "code","description","lookup_name","custom_1","custom_2","custom_6","custom_3"
			Case "lookup_name","code","description","type","custom_1","custom_2","custom_3","custom_4","custom_5","custom_6","ic_c","large_description_1","large_description_2"
			//---------------------------- APPEON END ----------------------------
				ls_value = ids_code_lookup.getitemstring(ll_findrow,  as_columnname)
			//--------------------------- APPEON BEGIN ---------------------------
			//$<modify> 08.23.2006 By: Liang QingShi
			//$<reason> Contract module modification
			/*
			Case "lookup_code","caqh_code"
			*/
			case "lookup_code","caqh_code","ic_n","money_1","money_2","integer_1","integer_2","integer_3","integer_4","integer_5","integer_6","integer_7","integer_8"
			//---------------------------- APPEON END ----------------------------
				ls_value = String(ids_code_lookup.getitemnumber( ll_findrow, as_columnname))

			case "modify_date","datetime_1","datetime_2"
				ls_value = string(ids_code_lookup.getitemdatetime( ll_findrow, as_columnname))
		End Choose
	Case 'sys_tables'
		ll_findrow = ids_systables.find(as_condition , 1,  ids_systables.rowcount())
		If ll_findrow <= 0 Then Return ""

		Choose Case Lower(as_columnname)
			Case "table_name"
				ls_value = ids_systables.getitemstring(ll_findrow,  as_columnname)
			Case "table_id", "facility_specific"
				ls_value = String(ids_systables.getitemnumber( ll_findrow, as_columnname))
		End Choose		
	Case 'sys_fields'
		If il_ids_sys_fields_cnt <> ids_sys_fields.Rowcount() Then
			ids_sys_fields.SetFilter( "" )
			ids_sys_fields.Filter( )
		End If
		
		ll_findrow = ids_sys_fields.find(as_condition , 1,  ids_sys_fields.rowcount())
		If ll_findrow <= 0 Then Return ""

		Choose Case Lower(as_columnname)
			Case "field_name","lookup_field","field_type","lookup_type","lookup_field_name","lookup_field_name","audit_fld","table_name"
				ls_value = ids_sys_fields.getitemstring(ll_findrow,  as_columnname)
			Case "table_id","field_id"
				ls_value = String(ids_sys_fields.getitemnumber( ll_findrow, as_columnname))
		End Choose
	Case 'ctx_notification'
		ll_findrow = ids_ctx_notification.find(as_condition , 1,  ids_ctx_notification.rowcount())
		If ll_findrow <= 0 Then Return ""

		Choose Case Lower(as_columnname)
			Case "alm_enabled", "alm_table", "alm_column"
				ls_value = ids_ctx_notification.getitemstring(ll_findrow,  as_columnname)
			Case "ctx_id"
				ls_value = String(ids_ctx_notification.getitemnumber( ll_findrow, as_columnname))
			case 'alm_date'
				ls_value = String(ids_ctx_notification.getItemdatetime( ll_findrow, as_columnname))
		End Choose
	Case 'ctx_all_notification' //jervis 07.04.2011
		ll_findrow = ids_ctx_notification.find(as_condition , 1,  ids_ctx_notification.rowcount())
		If ll_findrow <= 0 Then Return ""

		Choose Case Lower(as_columnname)
			Case "alm_enabled", "alm_table", "alm_column"
				ls_value = ids_ctx_notification.getitemstring(ll_findrow,  as_columnname)
			Case "ctx_id","level_id1","levle_id2","doc_id"
				ls_value = String(ids_ctx_notification.getitemnumber( ll_findrow, as_columnname))
			case 'alm_date'
				ls_value = String(ids_ctx_notification.getItemdatetime( ll_findrow, as_columnname))
		End Choose
	//--------Begin Added by Alfee 02.26.2008 -------------------------	
	//<$Reason>For Date Alarm Enhancement
	Case 'ctx_ai_notification'
		ll_findrow = ids_ctx_ai_notification.find(as_condition , 1,  ids_ctx_ai_notification.rowcount())
		If ll_findrow <= 0 Then Return ""

		Choose Case Lower(as_columnname)
			Case "alm_enabled", "alm_table", "alm_column"
				ls_value = ids_ctx_ai_notification.getitemstring(ll_findrow,  as_columnname)
			Case "ctx_id", "ctx_action_item_id"
				ls_value = String(ids_ctx_ai_notification.getitemnumber( ll_findrow, as_columnname))
			case 'alm_date'
				ls_value = String(ids_ctx_notification.getItemdatetime( ll_findrow, as_columnname))
		End Choose		
	Case 'ctx_am_ai_notification'
		ll_findrow = ids_ctx_am_ai_notification.find(as_condition , 1,  ids_ctx_am_ai_notification.rowcount())
		If ll_findrow <= 0 Then Return ""

		Choose Case Lower(as_columnname)
			Case "alm_enabled", "alm_table", "alm_column"
				ls_value = ids_ctx_am_ai_notification.getitemstring(ll_findrow,  as_columnname)
			Case "doc_id", "seq_id"
				ls_value = String(ids_ctx_am_ai_notification.getitemnumber( ll_findrow, as_columnname))
			case 'alm_date'
				ls_value = String(ids_ctx_notification.getItemdatetime( ll_findrow, as_columnname))
		End Choose				
	//--------End Added ------------------------------------------------
	Case 'facility'
		ll_findrow = ids_facility.find(as_condition, 1,  ids_facility.rowcount())
		If ll_findrow <= 0 Then Return ""

		Choose Case Lower(as_columnname)
			Case "facility_name","dept_chair_user_id","facility_wf_exp_appt"
				ls_value = ids_facility.getitemstring(ll_findrow,  as_columnname)
			Case "facility_id","facility_wf_data_entry_complete","facility_wf_expiring_appointment", &
				  "facility_wf_reappointment_initiated","facility_wf_practitioner_status_change",&
				  "facility_wf_new_practitioner","facility_wf_data_value_comparison",&
				  "facility_wf_webview_application_complete",&
				  "facility_central_cred","facility_reap_user","facility_miss_letter_90"
				ls_value = String(ids_facility.getitemnumber( ll_findrow, as_columnname))
		End Choose
	Case 'data_view_screen'
		ll_findrow = ids_data_view_screen.find(as_condition , 1,  ids_data_view_screen.rowcount())
		If ll_findrow <= 0 Then Return ""

		Choose Case Lower(as_columnname)
			Case "//"
				ls_value = ids_data_view_screen.getitemstring(ll_findrow,  as_columnname)
			Case "reference_field_1","reference_field_2","table_id","data_view_id"
				ls_value = String(ids_data_view_screen.getitemnumber( ll_findrow, as_columnname))
		End Choose
	//--------------------------- APPEON BEGIN ---------------------------
	//$<add> 10.12.2006 By: Jack (Inova)
	//$<reason> Queue Images for Scanning from Data Entry.
	Case 'image_type'
		ll_findrow = ids_image_type.find(as_condition, 1,  ids_image_type.rowcount())
		If ll_findrow <= 0 Then Return ""

		Choose Case Lower(as_columnname)
			Case "de_queue"
				ls_value = string(ids_image_type.getitemnumber(ll_findrow,  as_columnname))
			Case "image_type_id"
				ls_value = string(ids_image_type.getitemnumber(ll_findrow,  as_columnname))
			Case "default_pages"
				ls_value = string(ids_image_type.getitemnumber(ll_findrow,  as_columnname))
		End Choose
	
	//---------------------------- APPEON END ----------------------------
	
	//Added for work flow. 6/11/2006 Henry
	Case 'wf_workflow'
		ll_findrow = ids_workflow.find(as_condition, 1,  ids_workflow.rowcount())
		If ll_findrow <= 0 Then Return ""

		Choose Case Lower(as_columnname)
			Case "wf_id","suppress_alert","wf_validate","wf_retrigger" //Modified By Jay Chen 06-30-2014 Remark:add column wf_retigger
				ls_value = string(ids_workflow.getitemnumber(ll_findrow,  as_columnname))
			Case "wf_name","wf_prompt_falg","wf_prompt_message","wf_module","wf_triggered_by","practitioner_falg","comparison_type","wf_status"
				ls_value = ids_workflow.getitemstring(ll_findrow,  as_columnname)
		End Choose
		
	Case 'wf_action_types'
		ll_findrow = ids_workflow_action.find(as_condition, 1,  ids_workflow_action.rowcount())
		If ll_findrow <= 0 Then Return ""

		Choose Case Lower(as_columnname)
			Case "step_order","due_days","action_type_id","mail_notify"
				ls_value = string(ids_workflow_action.getitemnumber(ll_findrow,  as_columnname))
			Case "create_user_flag","by_user","weekend_flag","to_user","dept_chair_flag","cc_user","send_to_user"
				ls_value = ids_workflow_action.getitemstring(ll_findrow,  as_columnname)
		End Choose
	
	Case 'wf_action_status'
		ll_findrow = ids_workflow_status.find(as_condition, 1,  ids_workflow_status.rowcount())
		If ll_findrow <= 0 Then Return ""

		Choose Case Lower(as_columnname)
			Case "status_id","action_status_id" ,"mail_notify","mail_reminder","days_reminder","days_every","send_count","mail_message","letter_id","process_flag"	//2006-11-15 add "letter_id" by jervis
				ls_value = string(ids_workflow_status.getitemnumber(ll_findrow,  as_columnname))
			Case "cc_notify_user","include_note_flag","cc_reminder_user","to_reminder_user","to_message_user","cc_message_user","to_notify_user"
				ls_value = ids_workflow_status.getitemstring(ll_findrow,  as_columnname)
		End Choose
	
	Case 'ctx_screen'
		If not isvalid(ids_screen_table_c) Then
			ids_screen_table_c = create datastore
			ids_screen_table_c.dataobject = 'd_screen_table_name_c'
			ids_screen_table_c.settransobject(SQLCA)
			ids_screen_table_c.retrieve( )
		End If
		
		ll_findrow = ids_screen_table_c.find(as_condition, 1,  ids_screen_table_c.rowcount())
		If ll_findrow <= 0 Then Return ""

		Choose Case Lower(as_columnname)
			Case "screen_id"
				ls_value = string(ids_screen_table_c.getitemnumber(ll_findrow,  as_columnname))
		End Choose
		
	//End added for work flow
	
	//Added 11.30.2006 henry
	Case 'code_lookup_2'
		ll_findrow = ids_code_lookup_date.find(as_condition, 1,  ids_code_lookup_date.rowcount())
		If ll_findrow <= 0 Then Return ""

		Choose Case Lower(as_columnname)
			Case "modify_date"
				ls_value = string(ids_code_lookup_date.getitemdatetime(ll_findrow,  as_columnname))
		End Choose
		
	//Added By Ken.Guo 2009-07-10.
	Case 'data_view'
		ll_findrow = ids_data_view.find(as_condition, 1,  ids_data_view.rowcount())
		If ll_findrow <= 0 Then Return ""
		Choose Case Lower(as_columnname)
			Case 'win_backcolor'
				ls_value = string(ids_data_view.getitemnumber(ll_findrow,  as_columnname))
			Case 'data_view_name'
				ls_value = ids_data_view.getitemstring(ll_findrow,  as_columnname)
		End Choose
	
	case 'ctx_facility'	// Add by jervis 12.10.2009
		ll_findrow = ids_ctx_facility.find(as_condition, 1,  ids_ctx_facility.rowcount())
		If ll_findrow <= 0 Then Return ""

		Choose Case Lower(as_columnname)
			Case "facility_name"
				ls_value = ids_ctx_facility.getitemstring(ll_findrow,  as_columnname)
			Case "facility_id"
				ls_value = String(ids_ctx_facility.getitemnumber( ll_findrow, as_columnname))
		End Choose
		
	case 'clause' //Added By Ken.Guo 2011-05-03.
		ll_findrow = ids_clause.find(as_condition, 1,  ids_clause.rowcount())
		If ll_findrow <= 0 Then Return ""

		Choose Case Lower(as_columnname)
			Case "revision"
				ls_value = String(ids_clause.getitemdecimal(ll_findrow,  as_columnname))
			Case "clause_name"
				ls_value = ids_clause.getitemstring( ll_findrow, as_columnname)
		End Choose		
	case 'field_compute_expression' //Added By Ken.Guo 2016-08-17
		ll_findrow = ids_field_compute_expression.find(as_condition, 1,  ids_field_compute_expression.rowcount())
		If ll_findrow <= 0 Then Return ""
		Choose Case Lower(as_columnname)
			Case "field_use_compute"
				ls_value = String(ids_field_compute_expression.getitemnumber(ll_findrow,  as_columnname))
			Case "field_compute_expression"
				ls_value = ids_field_compute_expression.getitemstring( ll_findrow, as_columnname)
		End Choose		
	case 'email_template_settings' //Added By Ken.Guo 2016-08-24
		ll_findrow = ids_email_template_settings.find(as_condition, 1,  ids_email_template_settings.rowcount())
		If ll_findrow <= 0 Then Return ""
		Choose Case Lower(as_columnname)
			Case "email_template_id"
				ls_value = String(ids_email_template_settings.getitemnumber(ll_findrow,  as_columnname))
		End Choose	
	case 'field_other_properties' //Added By Ken.Guo 2017-03-03
		ll_findrow = ids_field_other_properties.find(as_condition, 1,  ids_field_other_properties.rowcount())
		If ll_findrow <= 0 Then Return ""
		Choose Case Lower(as_columnname)
			Case "sort_expression","filter_expression"
				ls_value = ids_field_other_properties.getitemstring(ll_findrow,  as_columnname)
			Case else
				ls_value = ids_field_other_properties.getitemstring(ll_findrow,  as_columnname)
		End Choose			
	case 'multi_select_fields' //Added By Ken.Guo 2017-05-09  Task 770. When a new contract is created, all Multi-select fields have values already selected
		ll_findrow = ids_multi_select_fields.find(as_condition, 1,  ids_multi_select_fields.rowcount())
		If ll_findrow <= 0 Then Return ""
		Choose Case Lower(as_columnname)
			Case "object_format"
				ls_value = ids_multi_select_fields.getitemstring(ll_findrow,  as_columnname)
			Case else
				ls_value = ids_multi_select_fields.getitemstring(ll_findrow,  as_columnname)
		End Choose		
		
End Choose

If ls_value = "@#" Then
	If Handle(GetApplication()) = 0 Then
		//Messagebox("appeon","Invoke GlobalData function error!"+&
		Messagebox("Appeon","Invoke GlobalData function error!"+&
		"~r~ntablename:" + as_tablename +&
		"~r~ncolumnname:"+ as_columnname +&
		"~r~nconditione:"+ as_condition )
	End If
	
	Return ""
End If
//messagebox( as_columnname ,ls_value)
return ls_value
end function

public subroutine of_initdatacache ();
////
//ids_views.dataobject = 'd_dddw_select_view_with_user_param'
//ids_views.settransobject(SQLCA)
//
//ids_facilitys.dataobject = 'd_dddw_facility_w_picture'
//ids_facilitys.settransobject(sqlca)
//
//ids_views.retrieve(gs_user_id)
//ids_facilitys.retrieve(gs_user_id)
end subroutine

public subroutine of_init_table_reccount (long al_tableids[]);string  ls_tablename
long	  ll_reccount[] , ll_i , ll_tableid

For ll_i = 1 To upperbound(al_tableids)
	ll_tableid = al_tableids[ll_i]
	If ll_tableid <> 0 Then
		ls_tablename = gnv_data.of_getitem('sys_tables' , 'table_name' , 'table_id=' + string(ll_tableid))

	End If
Next


end subroutine

public subroutine of_set_dwchild_fromcache (string as_table_name, string as_condition, datawindowchild a_dwchild);//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 10/09/2007 By: Ken.Guo
//$<reason> For Performance,  Use Find replace SetFilter
/*
Choose Case as_table_name
	Case 'code_lookup'
		If len(as_condition) > 0 Then
			ids_code_lookup.setfilter(as_condition)
			ids_code_lookup.filter()
		End If
		IF a_dwchild.RowCount() > 0 THEN a_dwchild.ReSet()
		ids_code_lookup.rowscopy(1,ids_code_lookup.rowcount(),Primary! , a_dwchild , 1,Primary!)
		ids_code_lookup.setfilter("")
		ids_code_lookup.filter()
End Choose
*/

//------------------------------------------------------------------------
// 1.9.2017 <RP> added
IF of_retrieveIfNecessary(as_table_name, FALSE) = -1 THEN
	return
END IF
//------------------------------------------------------------------------

//Warning!!! Don't modify ids_code_lookup's Sort and Group Setting.
//Because below script base on it.
Long ll_start,ll_End,ll_findrow,ll_rowcount
Choose Case as_table_name
	Case 'code_lookup'
		IF a_dwchild.RowCount() > 0 THEN a_dwchild.ReSet()
		If len(as_condition) = 0 Then
			ids_code_lookup.rowscopy(1,ids_code_lookup.rowcount(),Primary! , a_dwchild , 1,Primary!)			
			Return
		End If
		ll_rowcount = ids_code_lookup.rowcount()
		ll_start = ids_code_lookup.find(as_condition,1,ll_rowcount)
		If ll_start > 0 Then
			ll_end = ids_code_lookup.GetItemNumber(ll_start,'group_count')
			ll_end = ll_start + ll_end - 1
			ids_code_lookup.rowscopy(ll_start,ll_end,Primary! , a_dwchild , 1,Primary!)
		End If
	Case 'question_lookup'
		IF a_dwchild.RowCount() > 0 THEN a_dwchild.ReSet()
		ids_question_lookup.rowscopy(1,ids_question_lookup.rowcount(),Primary! , a_dwchild , 1,Primary!)							
End Choose
//---------------------------- APPEON END ----------------------------
end subroutine

public subroutine of_get_data_from_cache (string as_table_name, string as_condition, datastore a_dwchild);//---------------1.9.2017 <RP> added for just-in-time caching----------------------------------
//IF of_initCache(as_table_name) = -1 THEN
//	/* Invalid cache name */
//	return
//END IF
IF of_retrieveIfNecessary(as_table_name, FALSE) = -1 THEN
	return
END IF
//-----------------------------------------------------------------------------------------------



Choose Case as_table_name
	Case 'sys_fields'
		if len(as_condition) > 0 then
			ids_sys_fields.SetFilter( as_condition)
			ids_sys_fields.Filter()
		end if
		ids_sys_fields.rowscopy(1,ids_sys_fields.rowcount(),Primary! , a_dwchild , 1,Primary!)
		if len(as_condition) > 0 then
			ids_sys_fields.SetFilter( '')
			ids_sys_fields.Filter()
		end if
	Case 'wf_workflow' //Added By Ken.Guo 12/24/2012
		if len(as_condition) > 0 then
			ids_workflow.SetFilter( as_condition)
			ids_workflow.Filter()
		end if
		ids_workflow.rowscopy(1,ids_workflow.rowcount(),Primary! , a_dwchild , 1,Primary!)
		if len(as_condition) > 0 then
			ids_workflow.SetFilter( '')
			ids_workflow.Filter()
		end if		
	Case 'wf_action_types'
		if len(as_condition) > 0 then
			ids_workflow_action.SetFilter( as_condition)
			ids_workflow_action.Filter()
		end if
		ids_workflow_action.rowscopy(1,ids_workflow_action.rowcount(),Primary! , a_dwchild , 1,Primary!)
		If len(as_condition) > 0 Then
			ids_workflow_action.setfilter('')
			ids_workflow_action.filter()
		End If
	Case 'wf_action_status'
		if len(as_condition) > 0 then
			ids_workflow_status.SetFilter( as_condition)
			ids_workflow_status.Filter()
		end if
		ids_workflow_status.rowscopy(1,ids_workflow_status.rowcount(),Primary! , a_dwchild , 1,Primary!)
		if len(as_condition) > 0 then
			ids_workflow_status.SetFilter( '')
			ids_workflow_status.Filter()
		end if
	Case 'wf_trigger_param_action_status'
		if len(as_condition) > 0 then
			ids_workflow_trigger_item.SetFilter( as_condition)
			ids_workflow_trigger_item.Filter()
		end if
		ids_workflow_trigger_item.rowscopy(1,ids_workflow_trigger_item.rowcount(),Primary! , a_dwchild , 1,Primary!)
		if len(as_condition) > 0 then
			ids_workflow_trigger_item.SetFilter( '')
			ids_workflow_trigger_item.Filter()
		end if
	Case 'wf_trigger_param_data_comparison'
		if len(as_condition) > 0 then
			ids_workflow_trigger_comp.SetFilter( as_condition)
			ids_workflow_trigger_comp.Filter()
		end if
		ids_workflow_trigger_comp.rowscopy(1,ids_workflow_trigger_comp.rowcount(),Primary! , a_dwchild , 1,Primary!)
		if len(as_condition) > 0 then
			ids_workflow_trigger_comp.SetFilter( '')
			ids_workflow_trigger_comp.Filter()
		end if
	Case 'template_clause_rules' //Added by Alfee 11.12.2007
		if len(as_condition) > 0 then
			ids_template_clause_rules.SetFilter( as_condition)
			ids_template_clause_rules.Filter()
		end if
		ids_template_clause_rules.rowscopy(1,ids_template_clause_rules.rowcount(),Primary! , a_dwchild , 1,Primary!)
		if len(as_condition) > 0 then
			ids_template_clause_rules.SetFilter( '')
			ids_template_clause_rules.Filter()
		end if				
End Choose



end subroutine

public function long of_findrow (string as_tablename, string as_condition);//---------------1.9.2017 <RP> added for just-in-time caching----------------------------------
//IF of_initCache(as_tablename) = -1 THEN
//	/* Invalid cache name */
//	return 0
//END IF
IF of_retrieveIfNecessary(as_tablename, FALSE) = -1 THEN
	return 0
END IF
//-----------------------------------------------------------------------------------------------

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 11.10.2006 By: Jervis
//$<reason> Finds the row in a DataStore in which data meets a specified condition.
choose case lower(as_tablename)
	Case 'wf_workflow'
		return ids_workflow.find(as_condition, 1,  ids_workflow.rowcount())
	Case 'wf_action_types'
		return ids_workflow_action.find(as_condition, 1,  ids_workflow_action.rowcount())
	Case 'wf_action_status'
		return ids_workflow_status.find(as_condition, 1,  ids_workflow_status.rowcount())
	Case 'wf_trigger_param_data_comparison'
		return ids_workflow_trigger_comp.find(as_condition, 1,  ids_workflow_trigger_comp.rowcount())
	Case 'template_clause_rules' //Added by Alfee 11.12.2007
		return ids_template_clause_rules.find(as_condition, 1,  ids_template_clause_rules.rowcount())		
end choose
//---------------------------- APPEON END ----------------------------

end function

public function string of_getitem (string as_tablename, long al_row, string as_columnname);//--------------------------- APPEON BEGIN ---------------------------
//$<add> 11.10.2006 By: Jervis
//$<reason> modify for workfow 
string	ls_value

ls_value = "@#"

if al_row <=0 then return ""

//------------------------------------------------------------------------
// 1.9.2017 <RP> added
IF of_retrieveIfNecessary(as_tablename, FALSE) = -1 THEN
	return ""
END IF
//------------------------------------------------------------------------

Choose Case as_tablename	
	Case 'wf_workflow'
		Choose Case Lower(as_columnname)
			Case "wf_id"
				ls_value = string(ids_workflow.getitemnumber(al_row,  as_columnname))
			Case "wf_name","wf_prompt_falg","wf_prompt_message","wf_module","wf_triggered_by","practitioner_falg","comparison_type","wf_status"
				ls_value = ids_workflow.getitemstring(al_row,  as_columnname)
		End Choose
		
	Case 'wf_action_types'
		Choose Case Lower(as_columnname)
			Case "step_order","due_days","action_type_id","mail_notify"
				ls_value = string(ids_workflow_action.getitemnumber(al_row,  as_columnname))
			Case "create_user_flag","by_user","weekend_flag","to_user","dept_chair_flag","cc_user","send_to_user"
				ls_value = ids_workflow_action.getitemstring(al_row,  as_columnname)
		End Choose
	
	Case 'wf_action_status'
		Choose Case Lower(as_columnname)
			Case "status_id","action_status_id" ,"mail_notify","mail_reminder","days_reminder","days_every","send_count","mail_message","letter_id","process_flag"	//2006-11-15 add "letter_id" by jervis
				ls_value = string(ids_workflow_status.getitemnumber(al_row,  as_columnname))
			Case "cc_notify_user","include_note_flag","cc_reminder_user","to_reminder_user","to_message_user","cc_message_user","to_notify_user"
				ls_value = ids_workflow_status.getitemstring(al_row,  as_columnname)
		End Choose
	Case 'wf_trigger_param_data_comparison'
		Choose Case Lower(as_columnname)
			Case "screen_id"
				ls_value = string(ids_workflow_trigger_comp.getitemnumber(al_row,  as_columnname))
			case "table_name","field_name","operator","value","field_type"
				ls_value = ids_workflow_trigger_comp.getitemstring(al_row,  as_columnname)
		End Choose
End Choose

If ls_value = "@#" Then
	If Handle(GetApplication()) = 0 Then
		//Messagebox("appeon","Invoke GlobalData function error!"+&
		Messagebox("Appeon","Invoke GlobalData function error!"+&
		"~r~ntablename:" + as_tablename +&
		"~r~nrow:"+ string(al_row) +&
		"~r~ncolumnname:"+ as_columnname)
	End If
	
	Return ""
End If

return ls_value

//---------------------------- APPEON END ----------------------------
end function

public function string of_get_table_name (integer al_screen, string as_module, string as_column);
String ls_tablename
long	 ll_find

Choose Case as_module
	Case 'P'
		If not isvalid(ids_screen_table_p) Then
			ids_screen_table_p = create datastore
			ids_screen_table_p.dataobject = 'd_screen_table_name_p'
			ids_screen_table_p.settransobject(SQLCA)
			ids_screen_table_p.retrieve( )
		End If
		
		ll_find = ids_screen_table_p.find( "data_view_screen_screen_id="+string(al_screen), 1 , ids_screen_table_p.RowCount())
		If not ll_find > 0 Then return ''
		
		ls_tablename = ids_screen_table_p.GetItemString(ll_find , as_column)
		If mid(ls_tablename, 1, 4) = 'dba.' Then ls_tablename = mid(ls_tablename , 5)
	Case 'C'
		If not isvalid(ids_screen_table_c) Then
			ids_screen_table_c = create datastore
			ids_screen_table_c.dataobject = 'd_screen_table_name_c'
			ids_screen_table_c.settransobject(SQLCA)
			ids_screen_table_c.retrieve( )
		End If
		
		ll_find = ids_screen_table_c.find( "screen_id="+string(al_screen), 1 , ids_screen_table_c.RowCount())
		If not ll_find > 0 Then return ''
		
		//Modified By Ken.Guo 03/26/2012
		//ls_tablename = ids_screen_table_c.GetItemString(ll_find , as_column)
		If as_column = 'dataobject' Then
			If ids_screen_table_c.GetItemString(ll_find,'screen_style') = 'G' Then
				ls_tablename = ids_screen_table_c.GetItemString(ll_find , 'grid_dataobject')
			Else
				ls_tablename = ids_screen_table_c.GetItemString(ll_find , as_column)
			End If
		Else
			ls_tablename = ids_screen_table_c.GetItemString(ll_find , as_column)
		End If


End Choose

return ls_tablename
end function

public function string of_get_filter_data (string as_tablename, string as_condition, string as_name);long ll_i,ll_count
string ls_filter

//---------------1.9.2017 <RP> added for just-in-time caching----------------------------------
//IF of_initCache(as_tablename) = -1 THEN
//	/* Invalid cache name */
//	return ""
//END IF
IF of_retrieveIfNecessary(as_tablename, FALSE) = -1 THEN
	return ""
END IF
//-----------------------------------------------------------------------------------------------

choose case as_tablename
	case "workflow_status_filter"
		ids_workflow_status_filter.Setfilter(as_condition)
		ids_workflow_status_filter.Filter()
		
		ll_count = ids_workflow_status_filter.Rowcount()
		
		for ll_i = 1 to ll_count
			if ll_i = 1 then
				ls_filter = "(" + as_name + " = " + string(ids_workflow_status_filter.GetItemNumber(ll_i,"action_status_id"))
			else
				ls_filter += " or " + as_name + " = " + string(ids_workflow_status_filter.GetItemNumber(ll_i,"action_status_id"))
			end if
		next
		if ls_filter <> "" then ls_filter += ")"
end choose
return ls_filter 
end function

public subroutine of_refresh_systemdatacache ();//Getting data caches - jervis 10.25.2011
//Open(w_open_message) //Start Code Change ----11.15.2008 #V8 maha
If Not isvalid(w_appeon_gifofwait) Then
	OpenWithParm(w_appeon_gifofwait,"Getting system data caches, Please wait...")//this may take a few minutes.   modify by gavin 2012-01-10
Else
	w_appeon_gifofwait.of_settext("Getting system data caches, Please wait...")//this may take a few minutes. 
End If
//------------------------- <RP> 1.6.2017
gnv_app.of_benchmarklabel("n_cst_globaldata.of_refresh_systemdatacache() - A")
//
gnv_appeondb.of_startqueue() //Restored by Alfee 11.28.2007
of_retrieve('icred_settings') //cache data for icred_settings table
of_retrieve('security_users') //cache data for security_users table
of_retrieve('ids') //cache data for ids table
of_retrieve('sys_tables') //cache data for sys_tables table
of_retrieve('code_lookup') //cache data for code_lookup table
of_retrieve('ctx_notification') //cache data for ctx_notification table
of_retrieve('ctx_all_notification') //cache data for ctx_all_notification table - jervis 07.04.2011
of_retrieve('ctx_ai_notification') //cache data for ctx_ai_notification table - Alfee 02.26.2008
of_retrieve('ctx_am_ai_notification') //cache data for ctx_am_ai_notification table - Alfee 02.26.2008
of_retrieve('sys_fields') //cache data for sys_fields and sys_tables table
of_retrieve('facility') //cache data for facility table
of_retrieve('data_view_screen') //cache data for data_view_screen table
of_retrieve('image_type') //cache data for image_type table	
of_retrieve('code_lookup_2') 
of_retrieve('wf_workflow')
of_retrieve('wf_action_types')
of_retrieve('wf_action_status')
of_retrieve('wf_trigger_param_data_comparison')
of_retrieve('wf_trigger_param_action_status')
of_retrieve('template_clause_rules') //for dynamic add clauses - by Alfee 11.12.2007	 
of_retrieve('question_lookup') //cache data for question_lookup table - Added by Alan 08.20.2008
of_retrieve('data_view') //Added By Ken.Guo 2009-07-10.
of_retrieve('depend_field') //Added By jervis 2009-09-27.
of_retrieve('depend_lookup') //Added By jervis 2009-09-27.
of_retrieve( 'ctx_facility')	//Added by jervis 2009-12-10
of_retrieve( 'em_user_msg')//Added By Ken.Guo 2010-03-26.
of_retrieve( 'em_user_config') //Added By Ken.Guo 2010-03-26.
of_retrieve( 'getting_started_data')
of_retrieve( 'dashboard_getting_started')
of_retrieve( 'ctx_pictures') //Added By Ken.Guo 03/28/2013
of_retrieve( 'ctx_screen_field_tips') //Added By Jay Chen 10-09-2015
of_retrieve('field_compute_expression') //Added By Ken.Guo 2016-08-17 
of_retrieve('field_compute_expression_mul') //Added By Ken.Guo 2016-08-19
of_retrieve('email_template_settings') //Added By Ken.Guo 2016-08-24
of_retrieve('field_other_properties') //Added By Ken.Guo 2017-03-03
of_retrieve('multi_select_fields') //Added By Ken.Guo 2017-05-09
gnv_appeondb.of_commitqueue()
//------------------------- <RP> 1.6.2017
gnv_app.of_benchmarklabel("n_cst_globaldata.of_refresh_systemdatacache() - B")
//
//CONTRACT CACHE

//If isvalid(w_appeon_gifofwait) Then close(w_appeon_gifofwait)


/*
gnv_app.of_setcontraccache_register( )
gnv_app.of_setcontraccache_code_lookup(True)
gnv_app.of_set_contract_path( )


//Other Lookup caches
int li_use_opmode
select use_opsyntax into :li_use_opmode from icred_settings;
if li_use_opmode = 1 then
	w_appeon_gifofwait.of_settext("Getting lookup data caches, this may take a few minutes. Please wait...")
	datastore lds_cache
	long ll_i,ll_count
	string ls_name
	lds_cache = create datastore
	lds_cache.dataobject = 'd_get_cachelist'
	lds_cache.SetTransobject( sqlca)
	ll_count = lds_cache.retrieve( )
	for ll_i = 1 to ll_count
		ls_name = lds_cache.GetItemString( ll_i,'lookup_list')
		if ls_name='?' or ls_name = '' or isnull(ls_name) then continue
		if gnv_app.inv_dwcache.of_isregistered(ls_name) = 1 then continue
		gnv_app.of_setcontraccache_code_lookup( ls_name)
	next
	destroy lds_cache
end if
*/

end subroutine

public function integer of_get_defaultdddwcache ();//Other Lookup caches
int li_use_opmode

gnv_app.of_setcontraccache_register( )
gnv_app.of_setcontraccache_code_lookup(True)
gnv_app.of_set_contract_path( )

select use_opsyntax into :li_use_opmode from icred_settings;
if li_use_opmode = 1 then
	If Not isvalid(w_appeon_gifofwait) Then
		OpenWithParm(w_appeon_gifofwait,"Getting lookup data caches, Please wait...")// this may take a few minutes.  modify by gavin 2012-01-10
	Else
		w_appeon_gifofwait.of_settext("Getting lookup data caches, Please wait...")//this may take a few minutes. 
	End If
	datastore lds_cache
	long ll_i,ll_count
	string ls_name
	lds_cache = create datastore
	lds_cache.dataobject = 'd_get_cachelist'
	lds_cache.SetTransobject( sqlca)
	ll_count = lds_cache.retrieve( )
	for ll_i = 1 to ll_count
		ls_name = lds_cache.GetItemString( ll_i,'lookup_list')
		if ls_name='?' or ls_name = '' or isnull(ls_name) then continue
		if gnv_app.inv_dwcache.of_isregistered(ls_name) = 1 then continue
		gnv_app.of_setcontraccache_code_lookup( ls_name)
	next
	destroy lds_cache
end if
//If isvalid(w_appeon_gifofwait) Then close(w_appeon_gifofwait)  //close it after all event/function done.

Return 1

end function

public subroutine of_refresh_all_data ();
//Refresh System Cache Data
of_refresh_systemdatacache( )

//Refresh DDDW
Long ll_cnt,i
String ls_cachelist[]
If Not isvalid(w_appeon_gifofwait) Then
	OpenWithParm(w_appeon_gifofwait,"Refreshing lookup data caches, Please wait...")// this may take a few minutes.  modify by gavin 2012-01-10
Else
	w_appeon_gifofwait.of_settext("Refreshing lookup data caches, Please wait...")//this may take a few minutes.
End If
gnv_app.inv_dwcache.of_getregistered(ls_cachelist[])
ll_cnt = UpperBound(ls_cachelist[]) 
For i = 1 to ll_cnt
	If gnv_string.of_isexists(gnv_app.is_lookupnamelist[],lower(ls_cachelist[i])) Then
		gnv_app.of_setcontraccache_code_lookup( ls_cachelist[i])
	End If
Next

//Added By Jay Chen 11-04-2013 
gnv_app.of_setcontraccache()

If isvalid(w_appeon_gifofwait) Then close(w_appeon_gifofwait)



end subroutine

public function string of_getitem (string as_tablename, string as_columnname, string as_condition, string as_case);//====================================================================
// Function: of_getitem
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//                as_tablename
//                as_columnname
//                as_condition
//                as_case
//--------------------------------------------------------------------
// Returns:  string
//--------------------------------------------------------------------
// Author:	mark		Date: 04/05/12
//--------------------------------------------------------------------
//	Copyright (c) 2008-2011 Appeon, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
//
string	ls_value
long		ll_findrow

ls_value = "@#"

//------------------------------------------------------------------------
// 2.23.2016 <RP> added
IF of_retrieveIfNecessary(as_tablename, FALSE) = -1 THEN
	return ""
END IF
//------------------------------------------------------------------------

If as_case = "Dotdd_Company" Then 
	Choose Case as_tablename	
		case 'facility' 
			ll_findrow = ids_ctx_facility.find(as_condition, 1,  ids_ctx_facility.rowcount())
			If ll_findrow <= 0 Then Return ""
	
			Choose Case Lower(as_columnname)
				Case "facility_name"
					ls_value = ids_ctx_facility.getitemstring(ll_findrow,  as_columnname)
				Case "facility_id"
					ls_value = String(ids_ctx_facility.getitemnumber( ll_findrow, as_columnname))
			End Choose
	End Choose
End If 

If ls_value = "@#" Then
	If Handle(GetApplication()) = 0 Then
		Messagebox("Appeon","Invoke GlobalData function error!"+&
		"~r~ntablename:" + as_tablename +&
		"~r~ncolumnname:"+ as_columnname +&
		"~r~nconditione:"+ as_condition )
	End If
	
	Return ""
End If

return ls_value
end function

public function integer of_insert_main_data (datawindow adw_main, datawindow adw_detail, string as_main_table_name, long al_main_currentrow, long al_detail_currentrow);//====================================================================
// Function: of_insert_main_data
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//                adw_main
//                adw_detail
//                as_main_table_name
//                al_main_currentrow
//                al_detail_currentrow
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	Mark Lee		Date: 11/27/2012
//--------------------------------------------------------------------
//	Copyright (c) 2008-2012 Contract Logix,Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
String 	ls_tmp,  ls_main_table,  ls_detail_table, ls_sql
Long 		ll_pos, ll_tmp, ll_col_cnt,  i 
n_cst_string 			lnv_cst_string 
String 	ls_detail_col, ls_main_col , ls_coltype


If isnull(as_main_table_name) Or trim(as_main_table_name) = '' Then
	Return 0
Else
	ls_main_table = lower(trim(as_main_table_name)) + '_'
End If

ll_col_cnt =  Long(adw_detail.Describe("DataWindow.Column.Count"))
For i = 1 to ll_col_cnt 
	ls_detail_col = adw_detail.Describe("#"+String(i) + ".name")
	If Pos(lower(ls_detail_col), ls_main_table) > 0 then 
		ls_main_col = lnv_cst_string.of_globalreplace(ls_detail_col,ls_main_table,'',True)
		ls_coltype = adw_main.Describe(ls_main_col+".ColType")
		
		Choose Case Lower(Left ( ls_ColType , 3 ))
			CASE 'int','num','lon','ulo'
				adw_detail.SetItem(al_detail_currentrow,ls_detail_col,adw_main.GetItemNumber(al_main_currentrow,ls_main_col))
			Case 'dou','rea', 'dec', 'mon'
				adw_detail.SetItem(al_detail_currentrow,ls_detail_col,adw_main.GetItemDecimal (al_main_currentrow,ls_main_col))
			CASE 'dat'	
				If ls_ColType = 'date' Then
					adw_detail.SetItem(al_detail_currentrow,ls_detail_col,adw_main.GetItemDate(al_main_currentrow,ls_main_col))					
				ElseIf ls_ColType = 'datetime' Then 
					adw_detail.SetItem(al_detail_currentrow,ls_detail_col,adw_main.GetItemDateTime(al_main_currentrow,ls_main_col))				
				End If
			CASE 'var','cha'				
				adw_detail.SetItem(al_detail_currentrow,ls_detail_col,adw_main.GetItemString(al_main_currentrow,ls_main_col))
			Case Else
				//
		End Choose 

	End If
Next 

Return 1
end function

public function integer of_getcache (string as_cachename, ref datastore ads_cache, ref string as_dataobject);//////////////////////////////////////////////////////////////////////////////
//	Public Function:
//	of_getCache() - return corresponding datastore and dataobject for as_cachename
//
//	Description:
//		Hard coded cases are distilled from the code in original of_retrieve() method
//
//	1.9.2017		<RP>		Initial version
//
//	Returns: integer
//				1 - success
//				-1 - error
//

// Empty variable
datastore lds_cache

Choose case lower(as_cachename)
	Case 'icred_settings'
		ads_cache = ids_icred_settings
		as_dataobject = 'd_g_icred_settings'
	Case 'security_users'
		ads_cache = ids_security_users
		as_dataobject = 'd_g_security_users'
	Case 'ids'
		ads_cache = ids_ids
		as_dataobject = 'd_g_ids'
	Case 'sys_tables'
		ads_cache = ids_systables
		as_dataobject = 'd_g_sys_tables'
	Case 'code_lookup'
		ads_cache = ids_code_lookup
		as_dataobject = 'd_g_code_lookup'
	Case 'sys_fields'
		ads_cache = ids_sys_fields
		as_dataobject = 'd_audit_fields_all'
	Case 'ctx_notification'
		ads_cache = ids_ctx_notification
		as_dataobject = 'd_g_ctx_notification'
	Case 'ctx_ai_notification'
		ads_cache = ids_ctx_ai_notification
		as_dataobject = 'd_g_ctx_ai_notification'
	Case 'ctx_am_ai_notification'
		ads_cache = ids_ctx_am_ai_notification
		as_dataobject = 'd_g_ctx_am_ai_notification'
	Case 'facility'
		ads_cache = ids_facility
		as_dataobject = 'd_g_facility'
	case 'data_view_screen'
		ads_cache = ids_data_view_screen
		as_dataobject = 'd_g_data_view_screen'
	case 'contract_search'
		ads_cache = ids_contract_search
		as_dataobject = 'd_contract_search_forpt'
	case 'image_type'
		ads_cache = ids_image_type
		as_dataobject = 'd_image_painter'
	case 'wf_workflow'
		ads_cache = ids_workflow
		as_dataobject = 'd_g_workflow_data'
	case 'wf_action_types'
		ads_cache = ids_workflow_action
		as_dataobject = 'd_g_action_types_data'
	case 'wf_action_status'
		ads_cache = ids_workflow_status
		as_dataobject = 'd_g_action_status_data'
	case 'workflow_status_filter'
		ads_cache = ids_workflow_status_filter
		as_dataobject = 'd_g_action_status_filter'
	Case 'wf_trigger_param_data_comparison'
		ads_cache = ids_workflow_trigger_comp
		as_dataobject = 'd_g_trigger_param_data_comparison_data'
	Case 'wf_trigger_param_action_status'
		ads_cache = ids_workflow_trigger_item
		as_dataobject = 'd_g_trigger_param_action_status_data'
	Case 'code_lookup_2'
		ads_cache = ids_code_lookup_date
		as_dataobject = 'd_code_lookup_modify_date_all'
	case 'template_clause_rules'
		ads_cache = ids_template_clause_rules
		as_dataobject = 'd_dm_template_clause_rules'
	Case 'question_lookup'
		ads_cache = ids_question_lookup
		as_dataobject = 'd_g_quest_lookup'
//	Case 'address_lookup'
//		ads_cache = ids_address_lookup
//		as_dataobject = 'd_address_lookup_all'
//	Case 'data_flow'
//		ads_cache = ids_dataflow
//		as_dataobject = 'd_data_flow_all'
//	Case 'alert_hdr'
//		ads_cache = ids_na
//		as_dataobject = 'd_na_hdr_browse'
//	Case "app_steps"
//		ads_cache = ids_app_step_cache
//		as_dataobject = 'd_sys_app_step_cache'
//	Case "process_steps"
//		ads_cache = ids_process_step_cache
//		as_dataobject = 'd_process_steps_cache'
	case 'ctx_all_notification'
		ads_cache = ids_ctx_all_notification
		as_dataobject = 'd_g_ctx_all_notification'
	Case 'data_view'
		ads_cache = ids_data_view
		as_dataobject = 'd_g_data_view'
	CASE 'depend_field'
		ads_cache = ids_field_depend
		as_dataobject = 'd_depend_field_all'
	case 'depend_lookup'
		ads_cache = ids_lookup_depend
		as_dataobject = 'd_depend_lookup_all'
	case 'ctx_facility'
		ads_cache = ids_ctx_facility
		as_dataobject = 'd_g_ctx_facility'
	case 'em_user_msg'
		ads_cache = ids_em_user_msg_list
		as_dataobject = 'd_g_em_user_msg_list'
	case 'em_user_config'
		ads_cache = ids_em_user_config
		as_dataobject = 'd_em_user_config'
	case 'getting_started_data'
		ads_cache = ids_getting_started
		as_dataobject = 'd_g_getting_started'
	case 'dashboard_getting_started'
		ads_cache = ids_dashboard_getting_started
		as_dataobject = 'd_dashb_gadget_getting_started'
	case 'clause_attribute'
		ads_cache = ids_clause_attribute
		as_dataobject = 'd_g_acp_clause_attr_val_list'
	case 'clause'
		ads_cache = ids_clause
		as_dataobject = 'd_g_clause'
	case 'ctx_pictures'
		ads_cache = ids_pictures
		as_dataobject = 'd_g_pictures'
//	CASE 'app_session_parms'
//		/* Logic taken from ISG; not yet implemented here as of 1.9.2017 */
//		ads_cache = ids_app_session_parms
//		as_dataobject = 'd_g_app_session_parms'
//-----------<RP> 1.9.2017 additional cache lists not present in ISG------------------------------
	case 'ctx_screen_field_tips'
		ads_cache = ids_screen_field_tips
		as_dataobject = 'd_g_screen_field_tips'
	case 'field_compute_expression'
		ads_cache = ids_field_compute_expression
		as_dataobject = 'd_g_field_use_compute_expression'
	case 'field_compute_expression_mul'
		ads_cache = ids_field_compute_expression_mul
		as_dataobject = 'd_g_field_compute_expression'
	case 'email_template_settings'
		ads_cache = ids_email_template_settings
		as_dataobject = 'd_g_email_template_settings'
	case 'field_other_properties' //Added By Ken.Guo 2017-03-03 task 722
		ads_cache = ids_field_other_properties
		as_dataobject = 'd_g_field_other_properties'
	case 'multi_select_fields' //Added By Ken.Guo 2017-05-09 task 770
		ads_cache = ids_multi_select_fields
		as_dataobject = 'd_g_multi_select_fields'
		
//-----------<RP> 1.9.2017 additional cache lists not present in ISG------------------------------
	Case else
		ads_cache = lds_cache
		as_dataobject = ""
		return - 1
End Choose

return 1

end function

public function integer of_initcache (string as_cachename);//	of_initCache()
//
//	Description:
//		For the given cache name, (1) instantiate the relevant datastore, (2) set its DataObject property and (3) setTransObject(SQLCA)
//	Returns:
//		1 - success
//		-1 - error
//	History:
//	1.9.2017	<RP>		Initial version
//
datastore lds_cache
string ls_dataobject, ls_test

IF of_getCache(as_cachename, lds_cache, ls_dataobject) = -1 THEN
	return -1
END IF

IF NOT isValid(lds_cache) THEN
	/* Instantiate */
	CHOOSE CASE as_cachename
		CASE "em_user_msg", "em_user_config", "getting_started_data", "dashboard_getting_started"
			// From original constructor() event; ids_em_user_msg_list and ids_em_user_config,
			// ids_getting_started, ids_dashboard_getting_started are of type n_ds
			lds_cache = CREATE n_ds
		CASE ELSE
			lds_cache = CREATE datastore
	END CHOOSE
END IF

/* Test whether or not a dataobject has been set */
ls_test = trim(lds_cache.Describe("DataWindow.Bands"))
IF len(ls_test) = 0 THEN
	/* Try to assign the dataobject */
	lds_cache.dataobject = ls_dataobject
	lds_cache.setTransObject(SQLCA)
	/* Test to see if the dataobject is valid */
	ls_test = trim(lds_cache.Describe("DataWindow.Bands"))
	IF len(ls_test) = 0 THEN
		messageBox(this.className() + ".of_initCache()", "Error - invalid DataObject '" + ls_dataobject + "'")
		return -1
	END IF
END IF

return 1

end function

public function integer of_retrieveifnecessary (string as_cachename, boolean ab_alwaysretrieve);//	Function of_retrieveIfNecessary()
//	
//	1.9.2017		<RP>		Initial version
//
//	If ab_alwaysRetrieve, then refresh as_cachename
//	Else, refresh only if cache is empty
//
//	Returns:
//	Number of rows in as_cachename - success
//	-1 - error
//
string ls_descr
datastore lds_cache
string ls_dataobject
long ll_ret
// <RP> 1.19.2017
long ll_cacheStatus

IF as_cachename = 'wf_action_status' THEN
	/* Force refresh */
	ab_alwaysRetrieve = TRUE
	/* Need additional cache */
	IF of_retrieveIfNecessary("workflow_status_filter", ab_alwaysRetrieve) = -1 THEN
		return -1
	END IF
END IF

IF of_initCache(as_cachename) = -1 THEN
	return -1
END IF

IF of_getCache(as_cachename, lds_cache, ls_dataobject) = -1 THEN
	return -1
END IF

////-------------------------------------------------------------------------------------------
//// Copied from Appeon's original of_retrieve()
//if isvalid(w_open_message) then w_open_message.st_2.text = as_cachename
////-------------------------------------------------------------------------------------------

// <RP> 1.19.2017
ll_cacheStatus = gnv_app.of_getCacheStatus(as_cacheName)

/* If here, then as_cachename is valid */
//IF (lds_cache.rowCount() > 0) AND NOT ab_alwaysRetrieve THEN
IF (ll_cacheStatus = 1) AND NOT ab_alwaysRetrieve THEN
	ll_ret = lds_cache.rowCount()
ELSE

////--------------- <RP> 1.16.2017----------------------------------------------------------------
//// Debug
//f_message_console(this.className() + " - Retrieve cache " + as_cachename + ": " + string(now()))
////----------------------------------------------------------------------------------------------

	/* Retrieve the cache. Check for special handling */
	Choose case as_cachename
		case 'em_user_msg', 'em_user_config', 'dashboard_getting_started', 'app_session_parms'
			ll_ret = lds_cache.Retrieve(gs_user_id)
		CASE ELSE
			ll_ret = lds_cache.retrieve()
	END CHOOSE
	// <RP>: taken from original Appeon version of of_retrieve()
	Choose case as_cachename
		Case 'sys_fields'
			il_ids_sys_fields_cnt = ll_ret
// This case is present in ISG but not CLX version of of_retrieve()
//		Case "app_steps"
//			if appeongetclienttype() = 'PB' and lds_cache.rowcount() < 1 then
//				messagebox("Cache setup","Appl process steps cache failed")
//			end if
	End Choose

	If ll_ret >= 0 Then //Added By Ken.Guo 2017-04-21  fix bug. added if statement.
		gnv_app.of_setCacheStatus(as_cacheName, 1)
	End If

END IF

Return ll_ret

end function

on n_cst_globaldata.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_globaldata.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;//
ids_icred_settings = create datastore
ids_security_users = create datastore
ids_ids = create datastore

//ids_views = create datastore
//ids_facilitys = create datastore

ids_systables = create datastore

ids_code_lookup = create datastore

ids_sys_fields = create datastore

ids_ctx_notification = create datastore

ids_ctx_all_notification = create datastore
//---Begin Added by Alfee 02.26.2008--------
ids_ctx_ai_notification = create datastore
ids_ctx_am_ai_notification = create datastore
//---End Added -----------------------------

ids_facility = create datastore
ids_data_view_screen = create datastore

ids_contract_search = create datastore
//--------------------------- APPEON BEGIN ---------------------------
//$<add> 10.12.2006 By: Jack (Inova)
//$<reason> Queue Images for Scanning from Data Entry.
ids_image_type = create datastore
//---------------------------- APPEON END ----------------------------

//Added for work flow. 6/11/2006 Henry
ids_workflow = create datastore
ids_workflow_action = create datastore
ids_workflow_status = create datastore
ids_workflow_trigger_comp = create datastore
ids_workflow_trigger_item = Create DataStore

//Added 11.30.2006 henry
ids_code_lookup_date = create datastore

//Added by Jervis 04.12.2006
ids_workflow_status_filter = create datastore

//Added by Alfee 11.12.2007
ids_template_clause_rules = Create datastore 

//Added by Alan 08.15.2008
ids_question_lookup = Create datastore 

ids_data_view = Create datastore //Added By Ken.Guo 2009-07-10.

//Added by jervis 09.27.2009
ids_field_depend = CREATE datastore
ids_lookup_depend = CREATE datastore

ids_ctx_facility = create datastore //jervis 12.10.2009

ids_em_user_msg_list = Create n_ds
ids_em_user_config = Create n_ds

//Modified By Mark Lee 08/17/2015 change the DataStore to n_ds object.
//ids_getting_started = Create DataStore
//ids_dashboard_getting_started = Create DataStore
ids_getting_started = Create n_ds
ids_dashboard_getting_started = Create n_ds

ids_clause_attribute = Create DataStore

ids_clause = Create DataStore

ids_pictures = Create DataStore

ids_screen_field_tips = Create DataStore

ids_field_compute_expression = Create DataStore //Added By Ken.Guo 2016-08-17
ids_field_compute_expression_mul = Create Datastore //Added By Ken.Guo 2016-08-19
ids_email_template_settings = Create Datastore //Added By Ken.Guo 2016-08-24


ids_field_other_properties  = Create datastore //Added By Ken.Guo 2017-03-03
ids_multi_select_fields = Create datastore //Added By Ken.Guo 2017-05-09



end event

event destructor;//--------------------------- APPEON BEGIN ---------------------------
//$<Modify> 2007-08-07 By: Scofield
//$<Reason> Destroy these instance variables.

if IsValid(ids_security_users) then
	Destroy ids_security_users
end if

if IsValid(ids_icred_settings) then
	Destroy ids_icred_settings
end if

if IsValid(ids_ids) then
	Destroy ids_ids
end if

if IsValid(ids_systables) then
	Destroy ids_systables
end if

if IsValid(ids_code_lookup) then
	Destroy ids_code_lookup
end if

if IsValid(ids_code_lookup_dddw) then
	Destroy ids_code_lookup_dddw
end if

if IsValid(ids_code_lookup_date) then
	Destroy ids_code_lookup_date
end if

if IsValid(ids_sys_fields) then
	Destroy ids_sys_fields
end if

if IsValid(ids_ctx_notification) then
	Destroy ids_ctx_notification
end if

if IsValid(ids_ctx_all_notification) then
	Destroy ids_ctx_all_notification
end if

//---Begin Added by Alfee 02.26.2008--------
if IsValid(ids_ctx_ai_notification) then 
	Destroy ids_ctx_ai_notification
end if

if IsValid(ids_ctx_am_ai_notification) then
	Destroy ids_ctx_am_ai_notification
end if
//---End Added -----------------------------

if IsValid(ids_facility) then
	Destroy ids_facility
end if

if IsValid(ids_data_view_screen) then
	Destroy ids_data_view_screen
end if

if IsValid(ids_contract_search) then
	Destroy ids_contract_search
end if

if IsValid(ids_image_type) then
	Destroy ids_image_type
end if

if IsValid(ids_workflow) then
	Destroy ids_workflow
end if

if IsValid(ids_workflow_action) then
	Destroy ids_workflow_action
end if

if IsValid(ids_workflow_status) then
	Destroy ids_workflow_status
end if

if IsValid(ids_workflow_trigger_comp) then
	Destroy ids_workflow_trigger_comp
end if

if IsValid(ids_workflow_trigger_item) then
	Destroy ids_workflow_trigger_item
end if

if IsValid(ids_screen_table_p) then
	Destroy ids_screen_table_p
end if

if IsValid(ids_screen_table_c) then
	Destroy ids_screen_table_c
end if

if IsValid(ids_workflow_status_filter) then
	Destroy ids_workflow_status_filter
end if

//-----Begin Added by Alfee 11.12.2007---------
if IsValid(ids_template_clause_rules) then
	Destroy ids_template_clause_rules
end if
//-----End Added -------------------------------
//---------------------------- APPEON END ----------------------------

//Add by jervis 09.27.2009
if isvalid(ids_question_lookup) then destroy ids_question_lookup
if isvalid(ids_data_view) then destroy ids_data_view
if isvalid(ids_field_depend) then destroy ids_field_depend
if isvalid(ids_lookup_depend) then destroy ids_lookup_depend

if isvalid(ids_ctx_facility) then destroy ids_ctx_facility
If isvalid(ids_em_user_msg_list) then Destroy ids_em_user_msg_list
If isvalid(ids_em_user_config) then Destroy ids_em_user_config

If isvalid(ids_getting_started) then Destroy  ids_getting_started
If isvalid(ids_dashboard_getting_started) then Destroy  ids_dashboard_getting_started
If isvalid(ids_clause_attribute) then Destroy  ids_clause_attribute
If isvalid(ids_clause) then Destroy  ids_clause
If isvalid(ids_pictures) then Destroy  ids_pictures
If isvalid(ids_screen_field_tips) then Destroy  ids_screen_field_tips
If isvalid(ids_field_compute_expression) then Destroy  ids_field_compute_expression //Added By Ken.Guo 2016-08-17
If isvalid(ids_field_compute_expression_mul) Then destroy ids_field_compute_expression_mul //Added By Ken.Guo 2016-08-19
If isvalid(ids_email_template_settings) Then Destroy ids_email_template_settings //Added By Ken.Guo 2016-08-24
If isvalid(ids_field_other_properties) Then Destroy ids_field_other_properties //Added By Ken.Guo 2017-03-03
If isvalid(ids_multi_select_fields) Then Destroy ids_multi_select_fields  //Added By Ken.Guo 2017-05-09

end event

