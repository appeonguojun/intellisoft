$PBExportHeader$pfc_n_cst_ai_action_items.sru
forward
global type pfc_n_cst_ai_action_items from nonvisualobject
end type
end forward

global type pfc_n_cst_ai_action_items from nonvisualobject
end type
global pfc_n_cst_ai_action_items pfc_n_cst_ai_action_items

type variables
Protected String is_original_sql_last_attempt_graph
Protected String is_original_sql_detail
end variables

forward prototypes
public function integer of_set_original_sql (u_dw adw)
public function integer of_filter_graph (integer facility_id, u_dw au_dw, string as_user_id)
public function integer of_enable_action_menu (u_dw au_dw, string as_facility)
public function integer of_validate_receive (u_dw adw)
public function string of_filter (integer org_id, integer facility_id, string as_filter, u_dw au_dw, string as_user_id, dropdownpicturelistbox addplb_filters)
public function integer of_npdb_export (u_dw adw_action_items)
public function integer of_npdb_export_type (string as_type)
public function integer of_filter_graph_ia (integer facility_id, u_dw au_dw, string as_user_id)
public function integer of_set_batch_var (string ai_filter)
public function integer of_npdb_export_old (u_dw adw_action_items, long ai_fac_id, string ai_from)
public function integer of_is_app_audit_compl (long ai_prac, integer ai_facil)
public function integer of_is_last_verif (integer ai_facility_id, long al_prac_id, long al_screen_id)
public function string of_get_original_sql (u_dw adw)
public function integer of_display_web_image (string as_doc_id, string as_file_name)
public function integer of_update_verif_status (long al_rec_id, long al_screen, long al_data_status)
public function integer of_update_reference (string as_reference, long al_rec_id, long al_address_lookup_code, datetime adt_exp_dt, integer ai_screen, integer ai_data_status)
public function integer of_app_audit_complete (long al_prac[], long al_rec[], integer al_compl[])
end prototypes

public function integer of_set_original_sql (u_dw adw);CHOOSE CASE adw.DataObject
	CASE "d_verification_graph_by_last_attemp"
		is_original_sql_last_attempt_graph = adw.Object.DataWindow.Table.Select
	CASE "d_ver_summary_record_view_for_ai_all", +&
		  "d_ver_summary_record_view_for_ai", +&
		  "d_ver_summary_record_view_for_ai_exp_app", +&
		  "d_ver_sum_records_for_exp_app_npdb", +&
		  "d_ver_summary_record_view_for_ai_maxed", +&
		  "d_app_audit_missing_ai","d_ver_summary_record_view_for_ai_prac" //the last addd maha 042505
		is_original_sql_detail = adw.Object.DataWindow.Table.Select
END CHOOSE


RETURN 0
end function

public function integer of_filter_graph (integer facility_id, u_dw au_dw, string as_user_id);//arguments facility_id and as_user_id not used after 8-21-03 maha

String ls_where
String ls_sql
String ls_from
String ls_to
string ls_filt


//debugbreak()
au_dw.setredraw(false) // the set true is done from action items of_filter_by_intellibatch()

CHOOSE CASE au_dw.ClassName()
	CASE "dw_last_attemp_graph" //tab1
		//messagebox("","tab1")
		IF facility_id = 0 THEN
			IF au_dw.DataObject = "d_verification_graph_by_last_attemp" THEN
				au_dw.DataObject = "d_verification_graph_by_last_attemp_all"
				au_dw.of_SetTransObject( SQLCA )
				au_dw.Retrieve( gs_user_id )
			else
				if au_dw.rowcount() = 0 then
					au_dw.Retrieve( gs_user_id)
				end if
			END IF
		ELSE
			IF au_dw.DataObject = "d_verification_graph_by_last_attemp_all" THEN
				au_dw.DataObject = "d_verification_graph_by_last_attemp"
				au_dw.of_SetTransObject( SQLCA )
				au_dw.Retrieve()
			else
				if au_dw.rowcount() = 0 then
					au_dw.Retrieve( )
				end if
			END IF
		END IF
	CASE "dw_total_attempts"  //tab2
		//messagebox("","tab2")
		IF facility_id = 0 THEN
			IF au_dw.DataObject = "d_verification_graph_by_total_attemp" THEN
				au_dw.DataObject = "d_verification_graph_by_total_attemp_all"
				au_dw.of_SetTransObject( SQLCA )
				au_dw.Retrieve( gs_user_id )
			else
				if au_dw.rowcount() = 0 then
					au_dw.Retrieve(gs_user_id)
				end if
			END IF
		ELSE
			IF au_dw.DataObject = "d_verification_graph_by_total_attemp_all" THEN
				au_dw.DataObject = "d_verification_graph_by_total_attemp"
				au_dw.of_SetTransObject( SQLCA )
				au_dw.Retrieve( )
			else
				if au_dw.rowcount() = 0 then
					au_dw.Retrieve( )
				end if
			END IF
		END IF
	CASE "dw_expiring_credential_graph"  //tab3
		//messagebox("","tab3")
		IF facility_id = 0 THEN
			IF au_dw.DataObject = "d_expiring_credentials_graph" THEN
				au_dw.DataObject = "d_expiring_credentials_graph_all"
				au_dw.of_SetTransObject( SQLCA )
				au_dw.Retrieve( Today(),gs_user_id )
			else
				if au_dw.rowcount() = 0 then
					au_dw.Retrieve( Today(),gs_user_id)
				end if	
			END IF
		ELSE
			IF au_dw.DataObject = "d_expiring_credentials_graph_all" THEN
				au_dw.DataObject = "d_expiring_credentials_graph"
				au_dw.of_SetTransObject( SQLCA )
				au_dw.Retrieve( Today() )
			else
				if au_dw.rowcount() = 0 then
					au_dw.Retrieve( Today())
				end if
			END IF
		END IF
	CASE "dw_expiring_appointments_graph"  //tab4
		IF facility_id = 0 THEN
			IF au_dw.DataObject = "d_expiring_appointments" THEN
				au_dw.DataObject = "d_expiring_appointments_all"
				au_dw.of_SetTransObject( SQLCA )
				au_dw.Retrieve( Today(),gs_user_id )
			else
				if au_dw.rowcount() = 0 then
					au_dw.Retrieve( Today(),gs_user_id)
				end if 
			END IF
		ELSE
			IF au_dw.DataObject = "d_expiring_appointments_all" THEN
				au_dw.DataObject = "d_expiring_appointments"
				au_dw.of_SetTransObject( SQLCA )
				au_dw.Retrieve( Today() )
			else
				if au_dw.rowcount() = 0 then
					au_dw.Retrieve( Today())
				end if	
			END IF
		END IF
	case "dw_app_audit_graph"  //maha 072203 tab 5
		IF facility_id = 0 THEN
			IF au_dw.DataObject = "d_app_audit_graph" THEN
				au_dw.DataObject = "d_app_audit_graph_all"
				au_dw.of_SetTransObject( SQLCA )
				au_dw.Retrieve( gs_user_id)
			else
				if au_dw.rowcount() = 0 then
					au_dw.Retrieve( gs_user_id)
				end if
			END IF
		else
			IF au_dw.DataObject = "d_app_audit_graph_all" THEN
				au_dw.DataObject = "d_app_audit_graph"
				au_dw.of_SetTransObject( SQLCA )
				au_dw.Retrieve( )
			else
				if au_dw.rowcount() = 0 then
					au_dw.Retrieve()
				end if
			END IF
		end if
END CHOOSE


//if au_dw.ClassName() = dw_app_audit_graph

//block removed maha 8-21-03 filtering done from action items of_intellibatch_filter
//IF as_user_id = "All" AND facility_id <> 0 THEN
//	ls_filt = "parent_facility_id = " + String( facility_id ) 
//ELSEIF facility_id = 0 AND as_user_id <> "All" THEN
//	ls_filt = "priority_user = '" + as_user_id + "'" 
//ELSEIF as_user_id <> "All" AND facility_id <> 0 THEN
//	ls_filt = "parent_facility_id = " + String( facility_id ) + " AND priority_user = '" + as_user_id + "'" 
//ELSE
//	ls_filt = ""
//END IF
//
//au_dw.SetFilter(ls_filt )
//au_dw.Filter( )


RETURN 1
end function

public function integer of_enable_action_menu (u_dw au_dw, string as_facility);String ls_filter
String ls_verif_method
Integer li_picture_index
Integer li_index
Long ll_verif_method

IF NOT IsValid( m_pfe_cst_action_items ) THEN
	Return -1
END IF

gnv_app.of_modify_menu_attr( m_pfe_cst_action_items.m_action.m_printallletters,'Enabled', False)
//JAD added this in so that it the npdb export button always shows //changed to false maha 032803
gnv_app.of_modify_menu_attr( m_pfe_cst_action_items.m_action.m_exportdata,'Enabled', false)
gnv_app.of_modify_menu_attr( m_pfe_cst_action_items.m_action.m_connecttoweb,'Enabled', False)
gnv_app.of_modify_menu_attr( m_pfe_cst_action_items.m_action.m_phonedialer,'Enabled', False)	
gnv_app.of_modify_menu_attr( m_pfe_cst_action_items.m_action.m_editverificationdata,'Enabled', False)
//m_pfe_cst_action_items.m_file.m_save.Enabled = False
gnv_app.of_modify_menu_attr( m_pfe_cst_action_items.m_action.m_searchoig,'Enabled', false) //maha 032803
gnv_app.of_modify_menu_attr( m_pfe_cst_action_items.m_action.m_missinginforequest,'Enabled', false) //maha 071603

IF au_dw.RowCount() > 0 AND au_dw.GetRow() > 0 THEN
//	IF au_dw.GetItemNumber( 1, "print_flag" ) = 0 THEN
//		Return 0
 //	END IF
 	if au_dw.dataobject <> "d_app_audit_missing_ai" then
		//--------------------------- APPEON BEGIN ---------------------------
		//$<add> 11.23.2006 By: Jervis
		//$<reason> 
		gnv_app.of_modify_menu_attr( m_pfe_cst_action_items.m_action.m_printallletters,'Enabled', true)
		//---------------------------- APPEON END ----------------------------
		
		ll_verif_method = au_dw.GetItemNumber( au_dw.GetRow(), "verification_method" )
		//--------------------------- APPEON BEGIN ---------------------------
		//$<ID> PT-01
		//$<modify> 02.15.2006 By: Cao YongWang
		//$<reason> Performance tuning.
		//$<modification> Write script to retrieve data from a cache instead of from the database.

		/*
		SELECT code_lookup.code  
		INTO :ls_verif_method  
		FROM code_lookup  
		WHERE code_lookup.lookup_name = 'verification method' AND
				code_lookup.lookup_code = :ll_verif_method   ;
		*/
		ls_verif_method = gnv_data.of_getitem("code_lookup" , "code" , "upper(lookup_name) = '" + upper("verification method") + "' and lookup_code = " + string(ll_verif_method ))
		//---------------------------- APPEON END ----------------------------

		
	else	
		ls_verif_method = "MISSING AUDIT"
	end if
	
	CHOOSE CASE Upper( ls_verif_method )
		//PRINT
		//--------------------------- APPEON BEGIN ---------------------------
		//$<modify> 2006-10-17 By: Rodger Wu (Inova)
		//$<reason> Add a item called MISS ITEM 90.
		/*
		CASE "VERIF LTR", "PRAC CORRE", "EXP CRED LTR", "EXP APPT LTR", "FAX"
			//IF as_facility <> "0" THEN
				gnv_app.of_modify_menu_attr( m_pfe_cst_action_items.m_action.m_printallletters,'Enabled', True)
			//END IF
		*/
		CASE "VERIF LTR", "PRAC CORRE", "EXP CRED LTR", "EXP APPT LTR", "FAX", "MISS ITEM 90"
			gnv_app.of_modify_menu_attr( m_pfe_cst_action_items.m_action.m_printallletters,'Enabled', True)
		//---------------------------- APPEON END ----------------------------

		//EXPORT
		//CASE "NPDB QUERY"
			//m_pfe_cst_action_items.m_action.m_exportdata.Enabled = True
		//WEB
		CASE "WEB"
			gnv_app.of_modify_menu_attr( m_pfe_cst_action_items.m_action.m_connecttoweb,'Enabled', True)
		//PHONE
		CASE "CALL"		
			gnv_app.of_modify_menu_attr( m_pfe_cst_action_items.m_action.m_phonedialer,'Enabled', True)
		//PHONE
		CASE "NPDB QUERY"		//maha 032803
			gnv_app.of_modify_menu_attr( m_pfe_cst_action_items.m_action.m_exportdata,'Enabled', True)
		//PHONE
		CASE "OIG QUERY"		//maha 032803
			gnv_app.of_modify_menu_attr( m_pfe_cst_action_items.m_action.m_searchoig,'Enabled', True)
		CASE "MISSING AUDIT"		//maha 071603 for missing app audit items
			gnv_app.of_modify_menu_attr( m_pfe_cst_action_items.m_action.m_missinginforequest,'Enabled', True)
	END CHOOSE
	gnv_app.of_modify_menu_attr( m_pfe_cst_action_items.m_action.m_editverificationdata,'Enabled', True)
END IF

IF Upper( gs_cust_type ) = 'I' THEN
	
	m_pfe_cst_action_items.m_action.m_exportdata.Visible = False
	gnv_app.of_modify_menu_attr( m_pfe_cst_action_items.m_action.m_exportdata,'ToolBarItemVisible', False)	
	m_pfe_cst_action_items.m_action.m_connecttoweb.Visible = False
	gnv_app.of_modify_menu_attr( m_pfe_cst_action_items.m_action.m_connecttoweb,'ToolBarItemVisible', False)	
	m_pfe_cst_action_items.m_action.m_phonedialer.Visible = False	
	m_pfe_cst_action_items.m_action.m_editverificationdata.Visible = False
END IF

Return 0

end function

public function integer of_validate_receive (u_dw adw);Integer li_rc
Integer i

if adw.dataobject  = "d_app_audit_missing_ai" then return 1 //if app audit then skip

li_rc = adw.RowCount()

FOR i = 1 TO li_rc
	
	IF adw.GetItemStatus( i, 0, Primary! ) <> DataModified! THEN
		CONTINUE
	END IF

	//if date_recieved is entered make sure user name and recieve code is filled
	IF NOT IsNull( adw.GetItemDateTime(i, "date_recieved" ) ) THEN
		IF IsNull( adw.GetItemNumber( i, "response_code" ) ) THEN
			MessageBox("Missing Data", "The Receive Code field must be filled in for record " + string(i) )
			adw.SetColumn( "response_code" )
			adw.SetRow( i )	
			adw.scrolltorow(i) //Start Code Change ----07.28.2008 #V85 maha
			//--------------------------- APPEON BEGIN ---------------------------
			//$<ID> UM-01
			//$<modify> 01.13.2006 By: Wang Chao
			//$<reason> The GOTO statement is currently unsupported.
			//$<modification> Directly the script associated with the GOTO label here.
			
			//Goto Validation_Error
			Return -1
			//---------------------------- APPEON END ----------------------------
		END IF
		IF IsNull( adw.GetItemString( i, "user_name" ) ) OR adw.GetItemString( i, "user_name" ) = "" THEN
			MessageBox("Missing Data", "A Verified By field must be filled in" )
			adw.SetColumn( "user_name" )
			adw.SetRow( i )			
			//--------------------------- APPEON BEGIN ---------------------------
			//$<ID> UM-02
			//$<modify> 01.13.2006 By: Wang Chao
			//$<reason> The GOTO statement is currently unsupported.
			//$<modification> Directly the script associated with the GOTO label here.
			//Goto Validation_Error
			Return -1
			//---------------------------- APPEON END ----------------------------
		END IF		
	END IF	
	
	//if date_recieved is entered make sure user name and recieve code is filled
	IF NOT IsNull( adw.GetItemNumber(i, "response_code" ) ) THEN
		IF IsNull( adw.GetItemDateTime( i, "date_recieved" ) ) THEN
			MessageBox("Missing Data", "The Date Receive field must be filled in" )
			adw.SetColumn( "date_recieved" )
			adw.SetRow( i )
			//--------------------------- APPEON BEGIN ---------------------------
			//$<ID> UM-03
			//$<modify> 01.13.2006 By: Wang Chao
			//$<reason> The GOTO statement is currently unsupported.
			//$<modification> Directly the script associated with the GOTO label here.
			//Goto Validation_Error
			Return -1
			//---------------------------- APPEON END ----------------------------
		END IF
		IF IsNull( adw.GetItemString( i, "user_name" ) ) THEN
			MessageBox("Missing Data", "A Verified By field must be filled in" )
			adw.SetColumn( "user_name" )
			adw.SetRow( i )			
			//--------------------------- APPEON BEGIN ---------------------------
			//$<ID> UM-04
			//$<modify> 01.13.2006 By: Wang Chao
			//$<reason> The GOTO statement is currently unsupported.
			//$<modification> Directly the script associated with the GOTO label here.
			//Goto Validation_Error
			Return -1
			//---------------------------- APPEON END ----------------------------
		END IF		
	END IF		
	
	//if date_recieved is entered make sure user name and recieve code is filled
	IF NOT IsNull( adw.GetItemString(i, "user_name" ) ) AND Trim(adw.GetItemString(i, "user_name" )) <> "" THEN
		IF IsNull( adw.GetItemDateTime( i, "date_recieved" ) ) THEN
			MessageBox("Missing Data", "The Date Received field must be filled in" )
			adw.SetColumn( "date_recieved" )
			adw.SetRow( i )			
			//--------------------------- APPEON BEGIN ---------------------------
			//$<ID> UM-05
			//$<modify> 01.13.2006 By: Wang Chao
			//$<reason> The GOTO statement is currently unsupported.
			//$<modification> Directly the script associated with the GOTO label here.
			//Goto Validation_Error
			Return -1
			//---------------------------- APPEON END ----------------------------
		END IF
		IF IsNull( adw.GetItemNumber( i, "response_code" ) ) THEN
			MessageBox("Incomplete Data", "The Receive Code field must be filled in for record " + string(i) )
			adw.SetColumn( "response_code" )
			adw.SetRow( i )	
			adw.scrolltorow(i) //Start Code Change ----07.28.2008 #V85 maha
			//--------------------------- APPEON BEGIN ---------------------------
			//$<ID> UM-06
			//$<modify> 01.13.2006 By: Wang Chao
			//$<reason> The GOTO statement is currently unsupported.
			//$<modification> Directly the script associated with the GOTO label here.
			//Goto Validation_Error
			Return -1
			//---------------------------- APPEON END ----------------------------
		END IF
	END IF		
	
END FOR


Return 1
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> UM-07
//$<modify> 01.13.2006 By: Wang Chao
//$<reason> The GOTO statement is currently unsupported.
//$<modification> Directly move the script to the location of GOTO label.
//Validation_Error:
//Return -1
//---------------------------- APPEON END ----------------------------


end function

public function string of_filter (integer org_id, integer facility_id, string as_filter, u_dw au_dw, string as_user_id, dropdownpicturelistbox addplb_filters);String ls_where
String ls_sql
String ls_from
String ls_ddlb_text
String ls_to
String ls_rec_id
String ls_ver_facility_id
String ls_red_flag_days
string ls_pracs
Integer li_rc
Long ll_ver_method_compendium
Long ll_ver_method_ltr
Long ll_ver_method_ver_ltr
Long ll_ver_method_exp_ltr
long ll_ver_method_exp_appt_ltr //maha 103000
Long ll_ver_method_corre_ltr
Long ll_ver_method_exp
Long ll_ver_method_npdb //maha 120701
Long ll_ver_method_web
Long ll_ver_method_call
Long ll_ver_method_iVerify
Long ll_ver_method_hardcopy
Long ll_ver_method_oig
long ll_batch_id
boolean lb_app_audit = false //maha 040306

if gi_test_mode = 1 then
	messagebox("test mode: filter",as_filter)
end if


ll_ver_method_ver_ltr = long(gnv_data.of_getitem("code_lookup" ,'lookup_code', "upper(lookup_name) = '" + upper('verification method') + "'" + " and upper(code) = '" + upper('verif ltr') + "'"))

ll_ver_method_corre_ltr = long(gnv_data.of_getitem("code_lookup" ,'lookup_code', "upper(lookup_name) = '" + upper('verification method') + "'" + " and upper(code) = '" + upper('prac corre') + "'"))

ll_ver_method_iVerify = long(gnv_data.of_getitem("code_lookup" ,'lookup_code', "upper(lookup_name) = '" + upper('verification method') + "'" + " and upper(code) = '" + upper('iVerify') + "'"))

ll_ver_method_exp_ltr = long(gnv_data.of_getitem("code_lookup" ,'lookup_code', "upper(lookup_name) = '" + upper('verification method') + "'" + " and upper(code) = '" + upper('exp cred ltr') + "'"))

ll_ver_method_exp_appt_ltr = long(gnv_data.of_getitem("code_lookup" ,'lookup_code', "upper(lookup_name) = '" + upper('verification method') + "'" + " and upper(code) = '" + upper('exp appt ltr') + "'"))

ll_ver_method_npdb = long(gnv_data.of_getitem("code_lookup" ,'lookup_code', "upper(lookup_name) = '" + upper('verification method') + "'" + " and upper(code) = '" + upper('npdb query') + "'"))

ll_ver_method_web = long(gnv_data.of_getitem("code_lookup" ,'lookup_code', "upper(lookup_name) = '" + upper('verification method') + "'" + " and upper(code) = '" + upper('web') + "'"))

ll_ver_method_call = long(gnv_data.of_getitem("code_lookup" ,'lookup_code', "upper(lookup_name) = '" + upper('verification method') + "'" + " and upper(code) = '" + upper('call') + "'"))

ll_ver_method_compendium = long(gnv_data.of_getitem("code_lookup" ,'lookup_code', "upper(lookup_name) = '" + upper('verification method') + "'" + " and upper(code) = '" + upper('compendium') + "'"))

ll_ver_method_oig = long(gnv_data.of_getitem("code_lookup" ,'lookup_code', "upper(lookup_name) = '" + upper('verification method') + "'" + " and upper(code) = '" + upper('OIG QUERY') + "'"))

ll_ver_method_hardcopy = long(gnv_data.of_getitem("code_lookup" ,'lookup_code', "upper(lookup_name) = '" + upper('verification method') + "'" + " and upper(code) = '" + upper('Hard copy') + "'"))

//---------------------------- APPEON END ----------------------------

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 2006-10-17 By: Rodger Wu (Inova)
//$<reason> Get Miss info 90 verification method lookup code.
Long ll_ver_method_ver_missinfo90
ll_ver_method_ver_missinfo90 = long(gnv_data.of_getitem("code_lookup" ,'lookup_code', "upper(lookup_name) = '" + upper('verification method') + "'" + " and upper(code) = '" + upper('MISS ITEM 90') + "'"))
//---------------------------- APPEON END ----------------------------

//******************* select datawindow ******************************
//depending on whether the facility filter is ALL or a particular
//facility, the dw object has to change.
IF facility_id = 0 THEN
	IF au_dw.DataObject <> "d_ver_summary_record_view_for_ai_all" THEN
		au_dw.DataObject = "d_ver_summary_record_view_for_ai_all"
		au_dw.SetTransObject( SQLCA )
		of_set_original_sql( au_dw )
	END IF
ELSE
	IF au_dw.DataObject <> "d_ver_summary_record_view_for_ai" THEN
		au_dw.DataObject = "d_ver_summary_record_view_for_ai"
		au_dw.SetTransObject( SQLCA )
		of_set_original_sql( au_dw )
	END IF	
END IF

//if the filter is expiring appointments or npdb then a special datawindow to handle
//that needs to be setup.  this datawindow links verif_info.direct_link_facility_id to 
//pd_affil_stat.parent_facility_id

IF as_filter = "EXPIRING ELEMENTS        All Expiring Appointments" THEN
	ls_ddlb_text = "EXPIRING ELEMENTS - All Expiring Appointments"	
	IF au_dw.DataObject <> "d_ver_sum_records_for_exp_app_npdb" THEN
		au_dw.DataObject = "d_ver_sum_records_for_exp_app_npdb"
		au_dw.SetTransObject( SQLCA )
		of_set_original_sql( au_dw )
	END IF	
END IF

//\/maha 120701  NPDB
IF as_filter = "                                             NPDB Queries Previously Exported"  or as_filter = "NPDB                                   NPDB Queries To Be Exported" THEN
	//ls_ddlb_text = "EXPIRING ELEMENTS - All Expiring Appointments"
	//messagebox("npdb","change dw")
	IF au_dw.DataObject <> "d_ver_sum_records_for_exp_app_npdb" THEN
		au_dw.DataObject = "d_ver_sum_records_for_exp_app_npdb"
		au_dw.SetTransObject( SQLCA )
		of_set_original_sql( au_dw )
	//	messagebox("org syn",au_dw)
	END IF	
END IF

//\/maha081500
IF as_filter = "                                             Exp. Appt. Letters" THEN
	//ls_ddlb_text = "TO BE PRINTED - Exp. Appt. Letters"
	IF au_dw.DataObject <> "d_ver_sum_records_for_exp_app_npdb" THEN
		au_dw.DataObject = "d_ver_sum_records_for_exp_app_npdb"
		au_dw.SetTransObject( SQLCA )
		of_set_original_sql( au_dw )
	END IF	
END IF
//\maha

//\/maha082103
IF as_filter = "                                             Exp. Provisional. Letters" THEN
	//ls_ddlb_text = "TO BE PRINTED - Exp. Provisional. Letters"
	IF au_dw.DataObject <> "d_ver_sum_records_for_exp_app_npdb" THEN
		au_dw.DataObject = "d_ver_sum_records_for_exp_app_npdb"
		au_dw.SetTransObject( SQLCA )
		of_set_original_sql( au_dw )
	END IF	
END IF

//\/maha082103
IF as_filter = "                                             Exp. Allied Health Letters" THEN
	//ls_ddlb_text = "TO BE PRINTED - Exp. Allied Health Letters"
	IF au_dw.DataObject <> "d_ver_sum_records_for_exp_app_npdb" THEN
		au_dw.DataObject = "d_ver_sum_records_for_exp_app_npdb"
		au_dw.SetTransObject( SQLCA )
		of_set_original_sql( au_dw )
	END IF	
END IF

//\/maha070803
IF as_filter = "                                             Expiring Appointments" THEN
	//ls_ddlb_text = "AWAITING RESPONSE - All Expiring Appointments"
	IF au_dw.DataObject <> "d_ver_sum_records_for_exp_app_npdb" THEN
		au_dw.DataObject = "d_ver_sum_records_for_exp_app_npdb"
		au_dw.SetTransObject( SQLCA )
		of_set_original_sql( au_dw )
	END IF	
END IF

//\/maha102600  Setting datawindow for maxed attempts letters 
IF as_filter = "MAXED ATTEMPTS           Verification letters at max attempts" THEN
	ls_ddlb_text = "MAXED ATTEMPTS    Verification letters at max attempts"	
	IF au_dw.DataObject <> "d_ver_summary_record_view_for_ai_maxed" THEN
		au_dw.DataObject = "d_ver_summary_record_view_for_ai_maxed"
		au_dw.SetTransObject( SQLCA )
		of_set_original_sql( au_dw )
	END IF	
END IF
//debugbreak()
//\/maha071603
IF as_filter = "APPLICATION AUDIT          Missing Items" or as_filter = "Incomplete App Audit Items" THEN 
	//ls_ddlb_text = "APPLICATION AUDIT  -  All Missing Items"
	IF au_dw.DataObject <> "d_app_audit_missing_ai" THEN
		au_dw.DataObject = "d_app_audit_missing_ai"
		au_dw.SetTransObject( SQLCA )
		of_set_original_sql( au_dw )
		lb_app_audit = true  //Start Code Change ---- 04.03.2006 #397 maha
	END IF	
END IF

//\/maha071603
IF as_filter = "PRACTITIONER                  All Action Items For A Practitioner" or as_filter = "All Action Items For A Practitioner" THEN
	//ls_ddlb_text ="
	IF au_dw.DataObject <> "d_ver_summary_record_view_for_ai_prac" THEN
		au_dw.DataObject = "d_ver_summary_record_view_for_ai_prac"
		au_dw.SetTransObject( SQLCA )
		of_set_original_sql( au_dw )
	END IF	
END IF

//\/maha051705
IF as_filter = "                                             Practitioner Correspondence Letters" or as_filter = "TO BE PRINTED - Practitioner Correspondence Letters" THEN
	IF au_dw.DataObject <> "d_ver_sum_records_for_exp_app_npdb" THEN
		au_dw.DataObject = "d_ver_sum_records_for_exp_app_npdb"
		au_dw.SetTransObject( SQLCA )
		of_set_original_sql( au_dw )
	END IF	
END IF

//\***********************end set DW***************************************************
IF facility_id <> 0 THEN
	ls_where = " AND pd_affil_stat.parent_facility_id = " + String( facility_id )
END IF

au_dw.SetRowFocusIndicator( Hand! )

CHOOSE CASE as_filter
	//Start Code Change ---- 04.04.2006 #379 maha	
	CASE ""
		return ""
	//End Code Change---04.04.2006
	CASE "EXPIRING ELEMENTS        All Expiring Appointments"
		ls_where = ls_where + " AND verif_info.verification_method = " + String(ll_ver_method_exp_appt_ltr)
		
		//\/maha081500
	CASE "                                             Exp. Appt. Letters"
		ls_where = ls_where + " AND verif_info.print_flag = 1" + " AND verif_info.verification_method = " + String(ll_ver_method_exp_appt_ltr) + " AND verif_info.reference_value = 'Expiring Appointment Letter' "		
		ls_ddlb_text = "TO BE PRINTED - Exp. Appt. Letters"
		//\maha
		
	//\/maha082103
	CASE "                                             Exp. Provisional. Letters"
		ls_where = ls_where + " AND verif_info.print_flag = 1" + " AND verif_info.verification_method = " + String(ll_ver_method_exp_appt_ltr) + " AND verif_info.reference_value = 'Expiring Provisional Letter'" 		
		ls_ddlb_text = "TO BE PRINTED - Exp. Provisional Letters"
		
	//\/maha082103
	CASE "                                             Exp. Allied Health Letters"
		ls_where = ls_where + " AND verif_info.print_flag = 1" + " AND verif_info.verification_method = " + String(ll_ver_method_exp_appt_ltr) + " AND verif_info.reference_value = 'Expiring Allied Health Letter'" 		
		ls_ddlb_text = "TO BE PRINTED - Exp. Allied Health Letters"
		
	CASE "RED FLAG                           Verifications In Process 120+"
		ls_red_flag_days = ProfileString(gs_IniFilePathName, "setup", "red_flag_days", "0")//maha changed from none to 0 091800
		//--------------------------- APPEON BEGIN ---------------------------
		//$<modify> 2005-11-08 By: Zhang Lingping
		//$<reason> The database function {fn curdate()} can not add a value in SQL.
		//$<reason> So we use user function "getdate" for ASA repalce it.

		//ls_where = ls_where + "AND ({fn curdate()} - pd_affil_stat.date_app_signed) > " + ls_red_flag_days + " AND (response_code IS NULL) AND ( exp_credential_flag = 0 ) "
		ls_where = ls_where + "AND (getdate() - pd_affil_stat.date_app_signed) > " + ls_red_flag_days + " AND (response_code IS NULL) AND ( exp_credential_flag = 0 ) "
		//---------------------------- APPEON END ----------------------------
		ls_ddlb_text = "RED FLAG - Verifications In Process 120+"
		
	CASE "TO BE PRINTED                 Verifications Letters"
		ls_ddlb_text = "TO BE PRINTED - Verifications Letters"
		ls_where = ls_where + " AND verif_info.print_flag = 1 AND verif_info.verification_method = " + String(ll_ver_method_ver_ltr)

	CASE "                                             All Credential Letters Needing Reprinting"
		ls_ddlb_text = "TO BE PRINTED - All Credential Letters Needing Reprinting"
		ls_where = ls_where + " AND verif_info.print_flag = 1 AND verif_info.verification_method = " + String(ll_ver_method_ver_ltr) + " AND " + "verif_info.first_sent Is Not Null"
		
	CASE "                                             Expiring Credential Letters" , "TO BE PRINTED - Expiring Credential Letters"
		ls_where = ls_where + " AND verif_info.print_flag = 1 AND verif_info.verification_method = " + String(ll_ver_method_exp_ltr)		
		ls_ddlb_text = "TO BE PRINTED - Expiring Credential Letters"
		
	CASE "                                             Practitioner Correspondence Letters"
		ls_where = ls_where + " AND verif_info.print_flag = 1 AND verif_info.verification_method = " + String(ll_ver_method_corre_ltr)		
		ls_ddlb_text = "TO BE PRINTED - Practitioner Correspondence Letters"
				
	CASE "AWAITING RESPONSE      Verification  Letters"
		ls_ddlb_text = "AWAITING RESPONSE - Verification Letters"
		ls_where = ls_where + " AND (verif_info.verification_method = " + String(ll_ver_method_ver_ltr) + ") AND (number_sent > 0)  AND (response_code IS NULL)"															


	CASE "iVerify                                  Verify using iVerify database"
		ls_ddlb_text = "Verify using iVerify database"
		ls_where = ls_where + " AND (verif_info.verification_method = " + String(ll_ver_method_iVerify ) + ")  AND (response_code IS NULL)"															
   // mskinner 02 feb 05 -- begin 91998
	CASE "NPDB- ITP                           ITP Send/Recieve"
		long ll_ver_method
		SELECT code_lookup.lookup_code  
		INTO :ll_ver_method
		FROM code_lookup  
		WHERE ( code_lookup.lookup_name = 'Verification Method' ) AND  
				( code_lookup.code = 'NPDB/HIPDB'  )   ;
		IF SQLCA.SQLCODE = -1 THEN
			MessageBox("SQL ERROR", SQLCA.SQLERRTEXT)
			RETURN "-1"
		END IF

		ls_ddlb_text = "ITP Interface send/recieve"
		ls_where = ls_where + " AND (verif_info.verification_method = " + String(ll_ver_method ) + ")  AND (response_code IS NULL)"															

	// mskinner 02 feb 05 -- end

	CASE "                                             All Letters Previously Mailed"
		ls_ddlb_text = "AWAITING RESPONSE - All Letters Previously Mailed"
		ls_where = ls_where + " AND ((verif_info.verification_method = " + String(ll_ver_method_ver_ltr) +&
									" OR verif_info.verification_method = " + String(ll_ver_method_corre_ltr) +&
									" OR verif_info.verification_method = " + String(ll_ver_method_exp_ltr) + ")" +&
									" AND number_sent > 0  AND response_code IS NULL)"											

	CASE "                                             Expiring Credential  Letters", "Expiration Letters Awaiting Response"
		
		ls_ddlb_text = "AWAITING RESPONSE - Expiring Credential Letters"
		ls_where = ls_where + " AND (verif_info.verification_method = " + String(ll_ver_method_exp_ltr) + ") AND (number_sent > 0)  AND (response_code IS NULL)"															
		
	CASE "                                             Practitioner  Correspondence"
		ls_ddlb_text = "AWAITING RESPONSE - Practitioner Correspondence"
		ls_where = ls_where + " AND (verif_info.verification_method = " + String(ll_ver_method_corre_ltr) + ") AND (number_sent > 0)  AND (response_code IS NULL)"															

	
	CASE "HIGH PRIORITY                 High Priority Action Items"
		ls_ddlb_text = "HIGH PRIORITY - High Priority Action Items"
		ls_where = ls_where + " AND verif_info.priority = 3" 

	CASE "VERIFICATIONS                  WEB"
		ls_ddlb_text = "VERIFICATIONS - WEB"
		ls_where = ls_where + " AND verif_info.verification_method = " + String(ll_ver_method_web)						

	CASE "                                             CALLS"
		ls_ddlb_text = "VERIFICATIONS - CALLS"
		ls_where = ls_where + " AND verif_info.verification_method = " + String(ll_ver_method_call) + " AND response_code IS NULL"

	CASE "                                             COMPENDIUM"
		ls_ddlb_text = "VERIFICATIONS - COMPENDIUM"
		ls_where = ls_where + " AND verif_info.verification_method = " + String(ll_ver_method_compendium) + " AND response_code IS NULL"
							  
	CASE "EXPIRING CREDENTIALS  Credentials Expiring 61 - 90 Days From Today"
		ls_ddlb_text = "EXPIRING CREDENTIALS - Credentials Expiring 61 - 90 Days From Today"
		ls_from = "'" + String( RelativeDate( Today(), 60), "yyyy-mm-dd" ) + "'"
		ls_to = "'" + String(RelativeDate( Today(), 90 ), "yyyy-mm-dd" ) + "'"
		ls_where = ls_where + " AND ( verif_info.expiration_date >= Date(" + ls_from + ")" +&
					  " AND   verif_info.expiration_date < Date(" + ls_to + "))" +&
					  " AND ( exp_credential_flag = 1 )" 		
					  

	//newjad															
	CASE "                                             Expiring Appointments"
		ls_ddlb_text = "AWAITING RESPONSE - All Expiring Appointments" 		
		ls_where = ls_where + " AND ( exp_credential_flag = 1 )  AND (verif_info.verification_method = 10023 ) and (verif_info.print_flag = 0)"	

	CASE "                                             All Expiring Credentials"
		ls_ddlb_text = "EXPIRING CREDENTIALS - All Expiring Credentials" 		
		ls_where = ls_where + " AND ( exp_credential_flag = 1 )  AND (verif_info.verification_method = " + String(ll_ver_method_exp_ltr) + ")" // OR verif_info.verification_method = 10023 )" //Start Code Change ---- 04.26.2006 #415 maha		
	CASE "PRACTITIONER                  All Action Items For A Practitioner", "All Action Items For A Practitioner"
		long i
		long ic
		long pracids[]
		string ls_pracids = ""
		gs_batch_search lst_search
		gs_search lstr_search
		lstr_search.stran_transaction = SQLCA
		lstr_search.ls_open_for = "ACTIONITEMS" 
		
		open(w_practitioner_filter_choice)
		
		if message.stringparm = "C" then  //cancel
			return "-1"
		elseif isnumber(message.stringparm) then //selcted batch
			ll_batch_id  = long(message.stringparm)
			n_ds lds_batch
			lds_batch = CREATE n_ds
			lds_batch.DataObject = "d_batch_items_list"
			lds_batch.of_SetTransObject( SQLCA )
			ic = lds_batch.retrieve(ll_batch_id) 
			for i = 1 to ic
				ls_pracids = ls_pracids + string(lds_batch.getitemnumber(i,"prac_id"))
				if i < ic then ls_pracids = ls_pracids + ","
			next
		elseif message.stringparm = "B" then //batch window
			OpenWithParm( w_batch_prac_select_new , "R" )
			//Start Code Change ---- 03.29.2006 #363 maha
			if message.stringparm = "Cancel" then
				return "-1"
			else
				lst_search = message.powerobjectparm
				pracids[] = lst_search.li_prac_id[]
				ic = upperbound(pracids[]) 
				for i = 1 to ic
					ls_pracids = ls_pracids + string(pracids[i])
					if i < ic then ls_pracids = ls_pracids + ","
				next
			end if
			//End Code Change---03.29.2006
		elseif message.stringparm = "S" then //single
			lstr_search.stran_transaction = SQLCA
			lstr_search.ls_open_for = "ACTIONITEMS"
			OpenWithParm( w_extended_search_new , lstr_search )
			IF Message.DoubleParm = -1 THEN Return "-1"
			ls_pracids = Message.stringParm
			//messagebox("",ls_pracids)

		end if
		
		ls_ddlb_text = "PRACTITIONER - All Action Items For A Practitioner"
		ls_pracids = "prac_id in (" + ls_pracids + ")"
		
		ls_where = ls_where + " AND verif_info." + ls_pracids
		of_set_batch_var(ls_pracids) //set the practitioner filter variable in w_action_items
		
		
	CASE "FSMB                                   FSMB Queries To Be Exported"
		MessageBox("Invalid", "Not available yet!,  Please be patient." )
		Return "-1"
		ls_where = ls_where + " AND verif_info.last_sent IS NULL AND verif_info.verification_method = " + String(ll_ver_method_npdb) + "AND data_view_screen.screen_name = 'FSMB'"		

	CASE "                                             FSMB Queries Previously Exported"
		MessageBox("Invalid", "Not available yet!,  Please be patient." )		
		ls_where = ls_where + " AND verif_info.last_sent IS NOT NULL AND verif_info.verification_method = " + String(ll_ver_method_npdb) + "AND data_view_screen.screen_name = 'FSMB'"		
		Return "-1"
	CASE "NPDB                                   NPDB Queries To Be Exported"  //NPDB
		//messagebox("","npdb 2 b exp")
		ls_where = ls_where + " AND verif_info.last_sent IS NULL AND verif_info.verification_method = " + String(ll_ver_method_npdb) 				
		ls_ddlb_text = "NPDB - NPDB Queries To Be Exported"
	CASE 	"                                             NPDB Queries Previously Exported"
		//messagebox("","npdb pre exp")
		ls_where = ls_where + " AND verif_info.last_sent IS not NULL AND verif_info.verification_method = " + String(ll_ver_method_npdb) 				
		ls_ddlb_text = "NPDB - NPDB Queries To Previously Exported"
		
	CASE "npdb verifications previously exported"
		//messagebox("","npdb 2 b exp2")
		ls_where = ls_where + " AND verif_info.last_sent IS NOT NULL AND verif_info.verification_method = " + String(ll_ver_method_npdb) 				
	//\/maha 102600
	CASE	"MAXED ATTEMPTS           Verification letters at max attempts"
		ls_where = ls_where + " and (verif_info.verification_method "  + "in (" + String(ll_ver_method_ver_ltr) + " , " + String(ll_ver_method_exp_ltr) + " , " + string(ll_ver_method_exp_appt_ltr) + " ))" 
		//\maha  in (" + String(ll_ver_method_ver_ltr) + " , " + String(ll_ver_method_exp_ltr) + " )"
	CASE	"OIG                                     OIG Queries To Be Scanned"
		ls_where = ls_where + " AND verif_info.last_sent IS NULL AND verif_info.verification_method = " + String(ll_ver_method_oig) 	 
		ls_ddlb_text =	"OIG - OIG Queries To Be Scanned"	
	CASE	"                                           OIG Queries Flagged"
		ls_where = ls_where + " AND verif_info.last_sent IS NOT NULL AND verif_info.verification_method = " + String(ll_ver_method_oig)
		ls_ddlb_text =	"OIG - OIG Queries Flagged"	
	CASE	"                                             HARD COPY"
		ls_where = ls_where + " and verif_info.verification_method = " + String(ll_ver_method_hardcopy)
		ls_ddlb_text =	"Hard Copy - Hard Copy Verifications"
	CASE	"APPLICATION AUDIT          Missing Items" //maha 071603
		ls_where = ls_where + ""
		ls_ddlb_text =	"APPLICATION AUDIT  -  Missing Items"
	CASE	"Expiration Letters Needing Printing" //maha 071603
		ls_where = ls_where + " AND verif_info.print_flag = 1 AND verif_info.verification_method = " + String(ll_ver_method_exp_ltr)
		ls_ddlb_text =	"Expiration Letters Needing Printing"
	CASE	"Expiration Letters Awaiting Response" //maha 071603
		ls_where = ls_where + " AND (verif_info.verification_method = " + String(ll_ver_method_exp_ltr) + ") AND (number_sent > 0)  AND (response_code IS NULL)"															
		ls_ddlb_text =	"Expiration Letters Awaiting Response"
	CASE	"Incomplete App Audit Items" //maha 071603
		ls_where = ls_where + ""
		ls_ddlb_text =	"Incomplete App Audit Items"

	//--------------------------- APPEON BEGIN ---------------------------
	//$<add> 2006-10-17 By: Rodger Wu (Inova)
	//$<reason> Add 2 items related to Miss Info Letter 90.

	CASE "MISS ITEM 90    Application Audit Missing Items 90 days To Be Printed"
		ls_ddlb_text = "Application Audit Missing Items 90 days To Be Printed"
		ls_where = ls_where + " AND verif_info.print_flag = 1 AND verif_info.verification_method = " + String(ll_ver_method_ver_missinfo90)

	CASE "                           Application Audit Missing Items 90 days Awaiting Response"
		ls_ddlb_text = "Application Audit Missing Items 90 days Awaiting Response"
		ls_where = ls_where + " AND (verif_info.verification_method = " + String(ll_ver_method_ver_missinfo90) + ") AND (number_sent > 0) AND print_flag = 0 AND (response_code IS NULL)"															

	//---------------------------- APPEON END ----------------------------

	CASE ELSE
		IF Not IsNull( as_filter ) AND as_filter <> "" THEN
			//ls_rec_id = Mid( as_filter, 1, POS( as_filter, "-" ) -1 )
			//ls_ver_facility_id = Mid( as_filter, POS( as_filter, "-" ) +1, 100 )
			ls_where = ls_where + " AND verif_info.doc_id = " + "'" + as_filter + "'" //quotes around as_filter added 111500 maha
			ls_ddlb_text = "Found"
		END IF
END CHOOSE

IF as_user_id <> "All" THEN
	//Start Code Change ---- 04.03.2006 #397 maha
	if lb_app_audit = true then
		ls_where = ls_where + " AND pd_affil_stat.priority_user = '" + as_user_id + "'"
	else
		ls_where = ls_where + " AND verif_info.priority_user = '" + as_user_id + "'"
	end if
	//End Code Change---04.03.2006
END IF

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 04.29.2006 By: LeiWei
//$<reason> Fix a defect.
IF Isnull(is_original_sql_detail) OR Trim(is_original_sql_detail)="" THEN
	of_set_original_sql( au_dw )
END IF
//---------------------------- APPEON END ----------------------------

ls_sql = is_original_sql_detail + ls_where



IF au_dw.DataObject = "d_ver_summary_record_view_for_ai_all" or au_dw.DataObject = "d_ver_sum_records_for_exp_app_npdb" THEN
	ls_sql = ls_sql + " AND security_user_facilities.user_id = '" + gs_user_id + "'" 
END IF
//messagebox("npdb",au_dw.DataObject)
//openwithparm(w_sql_msg, ls_sql)

au_dw.SetSQLSelect ( ls_sql )
au_dw.SetTransObject( SQLCA )
li_rc = au_dw.Event pfc_Retrieve( )


IF au_dw.DataObject <> "d_app_audit_missing_ai" THEN
	au_dw.Modify("DataWindow.Table.UpdateTable = 'verif_info'")
else
	au_dw.Modify("DataWindow.Table.UpdateTable = 'pd_app_audit'")
end if

RETURN String( ls_ddlb_text )



//	CASE "                                             Expired"
//		ls_ddlb_text = "EXPIRING CREDENTIALS - Expired"
//		ls_from = "'" + String(Today(), "yyyy-mm-dd" ) + "'"
//		ls_where = ls_where + " AND ( verif_info.expiration_date < Date(" + ls_from + "))" +&
//					  " AND ( exp_credential_flag = 1 )" 
//					  
//	CASE "                                             Credentials Expiring 1 - 30 Days From Today"
//		ls_ddlb_text = "EXPIRING CREDENTIALS - Credentials Expiring 1 - 30 Days From Today"  		
//		ls_from = "'" + String(Today(), "yyyy-mm-dd" ) + "'"
//		ls_to = "'" + String(RelativeDate( Today(), 30 ), "yyyy-mm-dd" ) + "'"		
//   	ls_where = ls_where + " AND ( verif_info.expiration_date >= Date(" + ls_from + ")" +&
//					  " AND   verif_info.expiration_date < Date(" + ls_to + "))" +&
//					  " AND ( exp_credential_flag = 1 )" 
//
//	CASE "                                             Credentials Expiring 31 - 60 Days From Today"
//		ls_ddlb_text = "EXPIRING CREDENTIALS - Credentials Expiring 31 - 60 Days From Today" 		
//		ls_from = "'" + String( RelativeDate( Today(), 30), "yyyy-mm-dd" ) + "'"
//		ls_to = "'" + String(RelativeDate( Today(), 60 ), "yyyy-mm-dd" ) + "'"		
//		ls_where = ls_where + " AND ( verif_info.expiration_date >= Date(" + ls_from + ")" +&
//					  " AND   verif_info.expiration_date < Date(" + ls_to + "))" +&
//					  " AND ( exp_credential_flag = 1 )" 
//

end function

public function integer of_npdb_export (u_dw adw_action_items);Open( w_send_file )

Return 0

//Integer li_parent_facility_id
//String ls_param
//
////ls_command = " intellicred client-f1*c:\icd\"
//
//pfc_n_cst_npdb lnv_npdb
//
//lnv_npdb = CREATE pfc_n_cst_npdb
//
//
//
//li_parent_facility_id = adw_action_items.GetItemNumber( 1, "direct_parent_facility_link" )
//
//ls_param = " intellicred client-f" + String( li_parent_facility_id ) + "*c:\icd\"
//
//lnv_npdb.of_npdb_sub( ls_param )
//
//DESTROY lnv_npdb
//
//Return 0
end function

public function integer of_npdb_export_type (string as_type);
Openwithparm( w_send_file,as_type )

Return 0
end function

public function integer of_filter_graph_ia (integer facility_id, u_dw au_dw, string as_user_id);String ls_where
String ls_sql
String ls_from
String ls_to


IF as_user_id = "All" AND facility_id <> 0 THEN
	au_dw.SetFilter("facility_id = " + String( facility_id ) )
ELSEIF facility_id = 0 AND as_user_id <> "All" THEN
	au_dw.SetFilter("action_user = '" + as_user_id + "'" )
ELSEIF as_user_id <> "All" AND facility_id <> 0 THEN
	au_dw.SetFilter("facility_id = " + String( facility_id ) + " AND action_user = '" + as_user_id + "'" )
ELSE
	au_dw.SetFilter("" )
END IF
au_dw.Filter( )


RETURN 1
end function

public function integer of_set_batch_var (string ai_filter);if isvalid(w_action_items) then
	w_action_items.is_batch_filter = ai_filter
end if

return 1
end function

public function integer of_npdb_export_old (u_dw adw_action_items, long ai_fac_id, string ai_from);//Start Code Change ----06.19.2008 #V81 maha - cleaned up the bugs created by the performance enhancements
//in version 6 had just recopied the old code from 5 to 6
n_ds lds_action_items
string ls_filter //maha 06.19.08
integer ck  //maha 06.19.08


DataStore lds_name
DataStore lds_license
DataStore lds_school
DataStore lds_address
DataStore lds_npdb_fields
DataStore lds_npdb_tracker
DataStore lds_dept
Long ll_arr_prac_id[]
Long ll_arr_fac_id[]
Long ll_row

//---------------------------- APPEON END ----------------------------

Integer li_FileNum
Integer li_pad_len
Integer li_num_sent
Integer li_field_len
Integer li_name_rc
Integer li_license_rc
Integer li_school_rc
Integer li_address_rc
Integer li
Integer li_get_row
Integer li_row_cnt
Integer li_field_cnt
Integer li_dept_rc //maha 061002
Integer i
Integer f
Integer li_rc
integer li_fac_id
datetime ldt_c_date
long exp_id
long nr
Long ll_prac_id
string ls_prac
String ls_field_nm
String ls_record
String ls_header
String ls_section
String ls_field_val
String ls_file_nm
string ls_save_path

ldt_c_date = datetime(today(),now())
//link to action items screen
lds_action_items = CREATE n_ds
lds_action_items.DataObject = adw_action_items.DataObject
lds_action_items.of_SetTransObject( SQLCA )
adw_action_items.ShareData( lds_action_items )

li_row_cnt = lds_action_items.RowCount()

adw_action_items.sharedataoff()

//npdb fields
lds_npdb_fields = CREATE DataStore
lds_npdb_fields.DataObject = "d_npdb_fields"
lds_npdb_fields.SetTransObject( SQLCA )

//name info
lds_name = CREATE DataStore
lds_name.DataObject = "d_npdb_name_info_forpt"
lds_name.SetTransObject( SQLCA )

//address info
lds_address = CREATE DataStore
lds_address.DataObject = "d_npdb_address_forpt"
lds_address.SetTransObject( SQLCA )

//license info
lds_license = CREATE DataStore
lds_license.DataObject = "d_npdb_license_forpt"
lds_license.SetTransObject( SQLCA )

//school info
lds_school = CREATE DataStore
lds_school.DataObject = "d_npdb_school_forpt"
lds_school.SetTransObject( SQLCA )

//department info //maha 061002
lds_dept = CREATE DataStore
lds_dept.DataObject = "d_npdb_dept_forpt"
lds_dept.SetTransObject( SQLCA )

//tracker info //maha 050702
lds_npdb_tracker = CREATE DataStore
lds_npdb_tracker.DataObject = "d_npdb_tracker_all"
lds_npdb_tracker.SetTransObject( SQLCA )

//Get prac_id and fac_id in loop
FOR i = 1 TO li_row_cnt
	if ai_from = "A" then
		if adw_action_items.getitemnumber(i,"selected") <> 1 then continue //skip if not selected
	end if

	ll_prac_id = adw_action_items.GetItemNumber( i, "prac_id" )
	li_fac_id = adw_action_items.GetItemNumber( i, "verif_info_facility_id" )
	
	ll_row ++
	ll_arr_prac_id[ll_row] = ll_prac_id
	ll_arr_fac_id[ll_row] = li_fac_id
END FOR

gnv_appeondb.of_startqueue( )

lds_npdb_fields.Retrieve( )
If ll_row > 0 Then
	lds_name.Retrieve( ll_arr_prac_id[] )		
	lds_license.Retrieve( ll_arr_prac_id[] )	
	lds_school.Retrieve( ll_arr_prac_id[] )		
	lds_dept.Retrieve( ll_arr_prac_id[], ll_arr_fac_id[] )		
	lds_address.Retrieve( ll_arr_prac_id[] )		
End If
gnv_appeondb.of_commitqueue( )

li_field_cnt = lds_npdb_fields.Rowcount( )

//---------------------------- APPEON END ----------------------------


ls_header = "~~|~~NPDB-Q~~|~~ VER: 3.00"

ls_file_nm = String( Today(), "mmdd" ) + String(Hour(Now())) + String(Second(Now())) + "npdb" + ".txt"
//li_FileNum = FileOpen(gs_dir_path + gs_DefDirName + "\NPDB\" + ls_file_nm, LineMode!, Write!, LockWrite!, Replace!)

if gi_citrix = 1 then // maha 042705

	ls_save_path = gnv_data.of_getitem( "ids", "citrix_npdb_path" ,false)
	ls_save_path = ls_save_path + "NPDB\" 
else
	ls_save_path = gs_dir_path + gs_DefDirName + "\NPDB\"
end if	

gnv_appeondll.of_parsepath(ls_save_path)
ls_save_path = ls_save_path + ls_file_nm
//---------------------------- APPEON END ----------------------------

li_FileNum = FileOpen(ls_save_path, LineMode!, Write!, LockWrite!, Replace!)

FileWrite( li_filenum, ls_header )
//debugbreak()



FOR i = 1 TO upperbound(ll_arr_prac_id)      //li_row_cnt
//	if ai_from = "A" then //maha 020504 to run for only selected verifications from action items "P" is from thr Practitioner folder
//		if adw_action_items.getitemnumber(i,"selected") <> 1 then continue //skip if not selected
//	end if
	
	ls_record = ""
	ll_prac_id = ll_arr_prac_id[i]     //adw_action_items.GetItemNumber( i, "prac_id" )
	li_fac_id = ll_arr_fac_id[i] //adw_action_items.GetItemNumber( i, "verif_info_facility_id" )

	ls_filter = "prac_id = " + String(ll_prac_id)
	//name
	ck =  	lds_name.SetFilter(ls_filter)
	if ck < 0 then messagebox("NPDB QPRAC method","Name filter failure. Contact ContractLogix  Support.") //Start Code Change ----06.19.2008 #V81 maha
	lds_name.Filter()
	li_name_rc = lds_name.Rowcount()

	//---------------------------- APPEON END ----------------------------
	
	IF li_name_rc < 1 THEN
		MessageBox("Retrieve Error", "No data retrieved for name information. (" + String( ll_prac_id ) + ")")
		continue
	END IF


	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> PT-08
	//$<modify> 02.21.2006 By: LeiWei
	//$<reason> Performance tuning
	//$<modification> Write script to retrieve data from a cache instead of from the database.

	/*
		li_license_rc = lds_license.Retrieve( ll_prac_id )	
	*/

	//license
	lds_license.SetFilter(ls_filter)
	lds_license.Filter()
	li_license_rc = lds_license.Rowcount()

	//---------------------------- APPEON END ----------------------------
	
	//messagebox("li_license_rc",li_license_rc)
	IF li_license_rc < 1 THEN
		MessageBox("Retrieve Error", "No data retrieved for license information. (" + String( ll_prac_id )  + ")")
		continue		
	END IF

	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> PT-09
	//$<modify> 02.21.2006 By: LeiWei
	//$<reason> Performance tuning
	//$<modification> Write script to retrieve data from a cache in PT-05 instead of from the database.

	/*
	li_school_rc = lds_school.Retrieve( ll_prac_id )	

	IF li_school_rc < 1 THEN
		lds_school.DataObject = "d_npdb_school_other"
		lds_school.of_SetTransObject( SQLCA )
		li_school_rc = lds_school.Retrieve( ll_prac_id )		
	*/

	//school
	lds_school.SetFilter(ls_filter + " and code_lookup_code in ( 'M', 'Medical' )")
	lds_school.Filter()
	li_school_rc = lds_school.Rowcount()

	IF li_school_rc < 1 THEN

		lds_school.SetFilter(ls_filter)
		lds_school.Filter()
		li_school_rc = lds_school.Rowcount()
		
	//---------------------------- APPEON END ----------------------------
		
		IF li_school_rc < 1 THEN
			MessageBox("Retrieve Error", "No data retrieved for school information. (" + String( ll_prac_id )  + ")")
			continue		
		END IF
	END IF

	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> PT-10
	//$<modify> 02.21.2006 By: LeiWei
	//$<reason> Performance tuning
	//$<modification> Write script to retrieve data from a cache in PT-05 instead of from the database.

	/*
		li_dept_rc = lds_dept.Retrieve( ll_prac_id,li_fac_id )		
		li_address_rc = lds_address.Retrieve( ll_prac_id )		
	*/

	//department  not required
	lds_dept.SetFilter(ls_filter + " and facility_id = '" + String(li_fac_id) + "'")
	lds_dept.Filter()
	li_dept_rc = lds_dept.Rowcount()

	//address
	lds_address.SetFilter(ls_filter)
	lds_address.Filter()
	li_address_rc = lds_address.Rowcount()

	//---------------------------- APPEON END ----------------------------

	IF li_address_rc < 1 THEN
		MessageBox("Retrieve Error", "No data retrieved for address information. (" + String( ll_prac_id ) + ")" )
		continue	
	END IF
//debugbreak()
	FOR f = 1 TO li_field_cnt
		ls_field_val = ""
		li_get_row = lds_npdb_fields.GetItemNumber( f, "record_number" )
		ls_section = lds_npdb_fields.GetItemString( f, "dw_name" )
		ls_field_nm = lds_npdb_fields.GetItemString( f, "dw_field_name" )
		li_field_len = lds_npdb_fields.GetItemNumber( f, "field_length" )
		//name
		//if ls_field_nm = "none" then continue
		//messagebox(ls_field_nm,f)
		IF ls_section = "name" THEN
			IF ls_field_nm = "date_of_birth" THEN
				ls_field_val = String(lds_name.GetItemDateTime( 1, ls_field_nm ), "mmddyyyy" )
			ELSE
				ls_field_val = lds_name.GetItemString( 1, ls_field_nm )
			END IF
		END IF
		//address
		IF ls_section = "address" THEN
			ls_field_val = lds_address.GetItemString( 1, ls_field_nm )
		END IF
		//license
		IF ls_section = "license" THEN
			IF li_get_row <= li_license_rc THEN
				ls_field_val = lds_license.GetItemString( li_get_row, ls_field_nm )
			END IF
			//messagebox("ls_field_val",ls_field_val)
		END IF
		//dept
		IF ls_section = "dept" THEN
			//messagebox("li_get_row",li_get_row)
			//messagebox("li_dept_rc",li_dept_rc)
			IF li_get_row <= li_dept_rc THEN
			//	messagebox("ls_field_nm",ls_field_nm)
				ls_field_val = mid(lds_dept.GetItemString( 1, ls_field_nm ),1,3)
				
			END IF
		END IF
		//school
		IF ls_section = "school" THEN
			IF li_get_row <= li_school_rc THEN
				IF ls_field_nm = "year" THEN 
					ls_field_val = String( lds_school.GetItemNumber( li_get_row, ls_field_nm ) )
				elseif ls_field_nm = "dateyear" THEN //change the data in sys_npdb for school year to dateyear maha 090705
					ls_field_val = String(year(date( lds_school.GetItemdatetime( li_get_row, ls_field_nm ))))
				ELSE
					ls_field_val = lds_school.GetItemString( li_get_row, ls_field_nm )
				END IF
			END IF
		END IF
//debugbreak()		
		IF IsNull( ls_field_val)  THEN
			ls_field_val = ""
		END IF
		li_pad_len = li_field_len - Len( ls_field_val )
		IF Len( ls_field_val ) > li_field_len THEN
			ls_field_val = Mid( ls_field_val, 1, li_field_len )
		ELSE
			ls_field_val = ls_field_val + Fill( " " , li_pad_len )
		END IF
		IF IsNull( ls_field_val ) THEN
			ls_field_val = Fill( " ", li_field_len )
		END IF
		ls_record = ls_record + ls_field_val
	END FOR
	debugbreak()
	FileWrite( li_filenum, ls_record )
	
	//create tracker records
	nr = lds_npdb_tracker.insertrow(0)
	lds_npdb_tracker.setitem(nr,"prac",ll_prac_id)
	lds_npdb_tracker.setitem(nr,"facility_id",li_fac_id)
	//update action item dates
	li_num_sent = adw_action_items.GetItemNumber( i, "number_sent" )
	li_num_sent++
	adw_action_items.SetItem( i, "number_sent", 1 )
	adw_action_items.SetItem( i, "print_flag", 0 )
	IF IsNull( adw_action_items.GetItemDateTime( i, "first_sent" ) ) THEN
			adw_action_items.SetItem( i, "first_sent", DateTime(Today(), Now()) )
	END IF
	adw_action_items.SetItem( i, "last_sent", DateTime(Today(), Now()) )

END FOR
//End Code Change---06.19.2008
//update the action item detail view by updating then re-retrieving data

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-11
//$<add> 01.17.2006 By: LeiWei
//$<reason> Performance tuning
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.
 
gnv_appeondb.of_autocommit( )
//---------------------------- APPEON END ----------------------------

IF adw_action_items.Update() <> 1 THEN
	MessageBox("Update Failed", "Error while updating " + adw_action_items.DataObject )
	Return -1
ELSE
	COMMIT USING SQLCA;
	adw_action_items.Event pfc_Retrieve()
END IF

FileClose( li_filenum )

MessageBox("NPDB", "The NPDB export file has been saved as " + ls_save_path )

//set tracker data

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-12
//$<modify> 02.21.2006 By: LeiWei
//$<reason> Performance tuning
//$<modification> Write script to retrieve data from a cache instead of from the database.

/*	
select export_id into :exp_id from ids;
*/
exp_id = Long(gnv_data.of_getitem( "ids", "export_id" ,false))
//---------------------------- APPEON END ----------------------------

li_row_cnt = lds_npdb_tracker.rowcount()

for i = 1 to li_row_cnt
	exp_id++
	lds_npdb_tracker.setitem(i,"export_id",exp_id)
	lds_npdb_tracker.setitem(i,"c_date",ldt_c_date)
	lds_npdb_tracker.setitem(i,"user_id",gs_user_id)
	lds_npdb_tracker.setitem(i,"file_name",ls_file_nm)
	lds_npdb_tracker.setitem(i,"rec_cnt",li_row_cnt)
next

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-13
//$<add> 01.17.2006 By: LeiWei
//$<reason> Performance tuning
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.
 
gnv_appeondb.of_startqueue( )
//---------------------------- APPEON END ----------------------------

update ids set export_id = :exp_id;

lds_npdb_tracker.update()
commit using sqlca;

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-14
//$<add> 01.17.2006 By: LeiWei
//$<reason> Performance tuning
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.
 
gnv_appeondb.of_commitqueue( )

Destroy lds_name
Destroy lds_license
Destroy lds_school
Destroy lds_address
Destroy lds_npdb_fields
Destroy lds_npdb_tracker
Destroy lds_dept
//---------------------------- APPEON END ----------------------------

Return 0
end function

public function integer of_is_app_audit_compl (long ai_prac, integer ai_facil);//maha 021104 called from w_action items post update event
//IS NOT WORKING 021104
Integer li_cnt
DateTime ldt_todaysDate

ldt_todaysdate = DateTime( Today(), Now() )
//debugbreak()  
 // MessageBox("ai_facil",ai_facil)
SELECT Count(pd_affil_stat.prac_id)  //for each passed prac check if date is not completed
INTO :li_cnt  
FROM pd_affil_stat  
WHERE ( pd_affil_stat.parent_facility_id = :ai_facil ) AND  
      ( pd_affil_stat.prac_id = :ai_prac ) AND  
		( pd_affil_stat.active_status in ( 1,4 ) ) AND 
     	( pd_affil_stat.date_app_audit_completed is NULL );
IF SQLCA.SQLCODE = -1 THEN
	MessageBox("Database Error", SQLCA.SQLERRTEXT )
	Return -1
END IF
//MessageBox("date comp",li_cnt)
if li_cnt > 0 then //if not check for incomplete app audits
	SELECT Count(pd_app_audit.prac_id)  
	INTO :li_cnt  
	FROM pd_app_audit
	WHERE ( pd_app_audit.facility_id = :ai_facil ) AND  
			( pd_app_audit.prac_id = :ai_prac ) AND  
			( pd_app_audit.active_status = 1  ) AND
			( pd_app_audit.date_completed is NULL );
	IF SQLCA.SQLCODE = -1 THEN
		MessageBox("Database Error", SQLCA.SQLERRTEXT )
		Return -1
	END IF
	//MessageBox("count comp",li_cnt)
	IF li_cnt = 0 THEN //if none set date
		UPDATE pd_affil_stat  
		SET date_app_audit_completed = :ldt_todaysDate  
		WHERE ( pd_affil_stat.parent_facility_id = :ai_facil ) AND  
				( pd_affil_stat.active_status in ( 1,4 ) ) AND
				( pd_affil_stat.prac_id = :ai_prac ) and
				( pd_affil_stat.date_app_audit_completed is NULL );	
		IF SQLCA.SQLCODE = -1 THEN
			MessageBox("Database Error", SQLCA.SQLERRTEXT )
			Return -1
		END IF				
		COMMIT USING SQLCA;
		Return 1
	
	END IF
end if

RETURN 0
end function

public function integer of_is_last_verif (integer ai_facility_id, long al_prac_id, long al_screen_id);//called by post update of w_action_items and pfc_cst_u_verification_info
//function rebuilt 110404 maha
Integer li_cnt
DateTime ldt_todaysDate
datastore ds_ver
integer li_vfacil
integer fac
integer i
integer cnt
integer ck = 0
ldt_todaysdate = DateTime( Today(), Now() )


fac = ai_facility_id
//messagebox("fac",fac)
//messagebox("al_screen_id",al_screen_id)
if al_screen_id = 1 then //if a screen 1 verification get the verifying facility for that parent id
	SELECT pd_affil_stat.verifying_facility  
	INTO :li_vfacil 
	FROM pd_affil_stat  
	WHERE ( pd_affil_stat.parent_facility_id = :ai_facility_id ) AND  
			( pd_affil_stat.prac_id = :al_prac_id ) and
			( pd_affil_stat.active_status in (1,4));
else
	li_vfacil = fac
end if
if li_vfacil = ai_facility_id then ck = 1 //if parent and ver are the same then skip some work later down
//messagebox("li_vfacil",li_vfacil)
ds_ver = create datastore //get all appropriate appt records connected to that verif facility
ds_ver.dataobject = "d_ai_appt_stat_4_verif_compl"
ds_ver.settransobject(sqlca)
cnt = ds_ver.retrieve(al_prac_id,li_vfacil)
//messagebox("cnt",cnt)
if cnt < 1 then
	destroy ds_ver
	Return 0
end if

//if there are no verifications check for screen 1 verifications and update the appointment records

	SELECT Count( * )  
   INTO :li_cnt  
   FROM verif_info  
   WHERE ( verif_info.facility_id = :li_vfacil) AND  
         ( verif_info.prac_id = :al_prac_id ) AND
			( verif_info.active_status in ( 1 ) ) AND
			( response_code is null) ;
	IF SQLCA.SQLCODE = -1 THEN
		MessageBox("Database Error", SQLCA.SQLERRTEXT )
		Return -1
	END IF			
	IF li_cnt = 0 THEN 
//debugbreak()		
		if cnt > 0 then //redundant trap
			if ck = 1 then  //parent and verif are different
				for i = 1 to cnt //test for npdb,oig etc.
					fac = ds_ver.getitemnumber(i,"parent_facility_id")
					SELECT Count( * )  
					INTO :li_cnt  
					FROM verif_info  
					WHERE ( verif_info.facility_id = :fac ) AND  
							( verif_info.prac_id = :al_prac_id ) AND
							( verif_info.active_status in ( 1,4 ) ) AND
							( response_code is null) ;
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
		destroy ds_ver
		return 1
	END IF
	

RETURN 0



//
//
//Integer li_cnt
//DateTime ldt_todaysDate
//
//ldt_todaysdate = DateTime( Today(), Now() )
//  
////first find all appt records with that verif facility
//SELECT Count(pd_affil_stat.prac_id)  
//INTO :li_cnt  
//FROM pd_affil_stat  
//WHERE ( pd_affil_stat.verifying_facility = :ai_facility_id ) AND  
//      ( pd_affil_stat.prac_id = :al_prac_id ) AND  
//		( pd_affil_stat.active_status in ( 1,4 ) ) AND //maha  changed to include pending 072402
//      ( pd_affil_stat.date_data_entry_completed is not NULL ) AND
//		( pd_affil_stat.date_verif_completed is NULL );
//IF SQLCA.SQLCODE = -1 THEN
//	MessageBox("Database Error", SQLCA.SQLERRTEXT )
//	Return -1
//END IF
//
////if there are any
//IF li_cnt > 0 THEN
//	SELECT Count( * )  
//   INTO :li_cnt  
//   FROM verif_info  
//   WHERE ( verif_info.facility_id = :ai_facility_id ) AND  
//         ( verif_info.prac_id = :al_prac_id ) AND
//			( verif_info.active_status in ( 1 ) ) AND
//			( response_code is null) ;
//	IF SQLCA.SQLCODE = -1 THEN
//		MessageBox("Database Error", SQLCA.SQLERRTEXT )
//		Return -1
//	END IF			
//	IF li_cnt = 0 THEN
//		
//		datastore ds_ver
//		integer ls_facil
//		integer i
//		integer cnt
//		
//		ds_ver = create datastore
//		ds_ver.dataobject = "d_ai_appt_stat_4_verif_compl"
//		ds_ver.settransobject(sqlca)
//		cnt = ds_ver.retrieve(al_prac_id,ai_facility_id)
//		if cnt > 0 then
//			//\/maha 070504 to test for npdb,oig etc.
//			for i = 1 to cnt
//				ls_facil = ds_ver.getitemnumber(i,"parent_facility_id")
//				SELECT Count( * )  
//				INTO :li_cnt  
//				FROM verif_info  
//				WHERE ( verif_info.facility_id = :ls_facil ) AND  
//						( verif_info.prac_id = :al_prac_id ) AND
//						( verif_info.active_status in ( 1,4 ) ) AND
//						( response_code is null) ;
//				if li_cnt = 0 then
//					ds_ver.setitem(i,"date_verif_completed",ldt_todaysDate)
//				end if
//			next
//			ds_ver.update()
//			//\maha
//		
////		UPDATE pd_affil_stat  
////		SET date_verif_completed = :ldt_todaysDate  
////	   WHERE ( pd_affil_stat.verifying_facility = :ai_facility_id ) AND  
////				( pd_affil_stat.active_status in ( 1,4 ) ) AND//maha  changed to include pending 072402
////   	      ( pd_affil_stat.prac_id = :al_prac_id ) and
////				( pd_affil_stat.date_verif_completed is NULL );	//maha added 052302 to not reset completed dates
////		IF SQLCA.SQLCODE = -1 THEN
////			MessageBox("Database Error", SQLCA.SQLERRTEXT )
////			Return -1
//		END IF				
//		COMMIT USING SQLCA;
//		destroy ds_ver
//		Return 1
//	END IF
//END IF
//
//RETURN 0
end function

public function string of_get_original_sql (u_dw adw);//--------------------------- APPEON BEGIN ---------------------------
//$<add> 12.11.2006 By: Davis
//$<reason> For the w_action_items window.postopen

IF NOT f_validstr( is_original_sql_detail ) THEN
	of_set_original_sql( adw )
END IF

RETURN is_original_sql_detail

//---------------------------- APPEON END ----------------------------

end function

public function integer of_display_web_image (string as_doc_id, string as_file_name);//Start Code Change ---- 01.29.2007 #V7 maha  //function created; called from pfc_cst_u_verification_info

Long li_filenum
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
string ls_file

//messagebox("length", len(lb_verif_picture) )

//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 08.19.2006 By: LeiWei
//$<reason> Fix a defect.
/*
SELECTBLOB verification_picture
INTO :lb_verif_picture
FROM verif_info
WHERE doc_id = :is_doc_id
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

//messagebox("length", len(lb_verif_picture) )

ll_filelen = Len( lb_verif_picture )
//messagebox("len", ll_filelen )

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
*/
ls_file = gs_dir_path + gs_DefDirName + "\Images\"
gnv_appeondll.of_parsepath(ls_file)
ls_file = ls_file + as_file_name
//---------------------------- APPEON END ----------------------------
//FileDelete( gs_dir_path + "snapshot." + ls_file_extention )
FileDelete(  ls_file)

//li_filenum =  FileOpen( gs_dir_path + "snapshot." + ls_file_extention, StreamMode!, Write!, LockWrite!, Append!)
li_filenum =  FileOpen(  ls_file, StreamMode!, Write!, LockWrite!, Append!)

ll_new_pos = 1

IF li_filenum <> -1 THEN	
	//read the file ... 
	FOR li_counter = 1 to li_loops 
		 blob_temp = BlobMid( lb_verif_picture, ll_new_pos, 32765 )
   	 ll_bytes_written = FileWrite( li_filenum, blob_temp) 		 
//		 st_wait.text = "Writing File"
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
//   st_wait.text = "File Closed"
ELSE
	MessageBox( "File Open Error", "Could not open snapshot.jpg for StreamMode!" )
	Return -	1
END IF

//cb_cancel.Enabled = True

DO While Not FileExists(  ls_file )
	Yield( )
//	st_wait.text = "Waiting for capture"
//	IF lb_cancel THEN
//		cb_capture.Enabled = True
//		cb_close.Enabled = True
//		cb_cancel.Enabled = False
//		Return 1
//	END IF
LOOP

//cb_cancel.Enabled = True

//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 06.23.2006 By: Liang QingShi
//$<reason>  GetContextService is currently unsupported. 
//$<modification> Replace GetContextService with ShellExecuteA to provide the
//$<modification> same functionality.
/*
Inet  iinet_base

GetContextService("Internet", iinet_base)

iinet_base.HyperlinkToURL( gs_dir_path + "snapshot." + ls_file_extention)
*/
String ls_url,ls_null
setnull(ls_null)
ls_url = ls_file
ShellExecuteA ( Handle( This ), "open", 'IEXPLORE', ls_url , ls_Null, 4)

//---------------------------- APPEON END ----------------------------

return 1
end function

public function integer of_update_verif_status (long al_rec_id, long al_screen, long al_data_status);//Start Code Change ----08.01.2008 #V85 maha - fuction created to replace duplicated functionality in action items and prac folder
//replaces of_update_inactive_verifs in pfc_cst_u_verification_info
// sends to history verifs for dea, lic, and ins that become inactive
//updates the data_status for historical records 0 = inactive; 1 =  active; 2 = historical

If al_data_status = 0 then //for inactives set the records to history
	update verif_info
	set active_status = 0, data_status = 0
	where rec_id = :al_rec_id and screen_id = :al_screen and  active_status = 1;
Else  //for Historical set the data_status so that program deals with it properly
	update verif_info
	set data_status = :al_data_status
	where rec_id = :al_rec_id and screen_id = :al_screen and  active_status = 1;
End if
		
IF SQLCA.SQLCODE <> 0 THEN
	MessageBox("Update Error", "Error updating active_status on verif_info table.")
	Return -1
END IF


return 1
end function

public function integer of_update_reference (string as_reference, long al_rec_id, long al_address_lookup_code, datetime adt_exp_dt, integer ai_screen, integer ai_data_status);//Start Code Change ----08.01.2008 #V85 maha - fuction created to replace duplicated functionality in action items and prac folder
//called from/replaces of_update_reference in pfc_cst_u_verification_info

Integer li_row
string ls_ref

ls_ref = mid(as_reference,1,100) //as trap for overlong values.

UPDATE verif_info  
SET reference_value = :ls_ref,
	 address_lookup_code = :al_address_lookup_code,
	 expiration_date = :adt_exp_dt,
	 data_status = :ai_data_status
WHERE verif_info.rec_id = :al_rec_id  AND
		verif_info.screen_id = :ai_screen and 
		verif_info.active_status = 1;
IF SQLCA.SQLCODE <> 0 THEN
	MessageBox("Update Error", "Error updating reference value on verif_info table.")
	Return -1
END IF

//of_retrieve_detail( dw_orgs_facilities.GetRow())

RETURN 0
end function

public function integer of_app_audit_complete (long al_prac[], long al_rec[], integer al_compl[]);//Start Code Change ----09.10.2008 #V85 maha -  created.  Copied from app audit object and modified to be used from both prac folder and action items.
//all argument arrays should be the same size.  Currently the prac argument is not used

Integer li_facility_id
DateTime ldt_todaysDate
DateTime ldt_date
long i
long ic
long ll_rec
long ll_prac
//debugbreak()
ldt_todaysdate = DateTime( Today(), Now() )

gnv_appeondb.of_autocommit( )

for i = 1 to upperbound(al_rec[])
	if al_compl[i] = 1 then //1 = completed
		ll_rec = al_rec[i]
		
		UPDATE pd_affil_stat  
		SET date_app_audit_completed = :ldt_todaysdate  
		WHERE pd_affil_stat.rec_id = :ll_rec and date_app_audit_completed is null ;
		IF SQLCA.SQLCODE <> 0 THEN
			MessageBox("Update Error", "Error updating pd_affil_stat / date_app_audit_completed." )
			Return -1
		END IF
	end if
next

Return 0
end function

on pfc_n_cst_ai_action_items.create
call super::create
TriggerEvent( this, "constructor" )
end on

on pfc_n_cst_ai_action_items.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

