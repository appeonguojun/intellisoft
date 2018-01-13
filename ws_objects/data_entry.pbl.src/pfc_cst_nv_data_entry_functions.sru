$PBExportHeader$pfc_cst_nv_data_entry_functions.sru
forward
global type pfc_cst_nv_data_entry_functions from nonvisualobject
end type
end forward

global type pfc_cst_nv_data_entry_functions from nonvisualobject
end type
global pfc_cst_nv_data_entry_functions pfc_cst_nv_data_entry_functions

type variables
Integer ii_column_cnt

String is_sort_syntax
String is_column_names[]
String is_column_default[]
String is_rec_id_col_nm
String is_first_column 
String is_table_name

n_ds ids_lookup_code
n_ds ids_lookup_address
n_ds ids_screen_fields
n_ds ids_screen_objects

Boolean ib_vscroll = False

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-01
//$<add> 01.25.2006 By: Cao YongWang
//$<reason> Performance tuning
//$<modification> Define variables for caching the data in subsequent script.
String	is_types[] , is_froms[] , is_dddwcolumns[] , is_lu_tables[] 
long		il_values[]
datetime idt_screen_cache

n_ds ids_sys_audit
//---------------------------- APPEON END ----------------------------

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 07.26.2007 By: Evan
//$<reason> New feature of import module.
DataStore ids_address_lookup
//---------------------------- APPEON END ----------------------------

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 25/08/2008 By: Alan
//$<reason> 
n_ds ids_report_objects
boolean	ib_report = false
//---------------------------- APPEON END ----------------------------

end variables

forward prototypes
public function string of_get_first_column ()
public function integer of_set_defaults (u_dw a_dw, integer ai_row)
public function integer of_setup_cache ()
public function integer of_itemchanged (u_dw a_dw, string as_data)
public function integer of_field_audit (u_dw adw)
public function integer of_record_validation (u_dw a_dw)
public function integer of_update_dddw (u_dw a_dw_detail, u_dw a_dw_browse)
public function integer of_create_dynamic_dw_browse (long al_prac_id, integer ai_data_view_id, integer ai_screen_id, u_dw adw_browse)
public function integer of_create_dynamic_ds_old (long al_prac_id, integer ai_data_view_id, integer ai_screen_id, n_ds adw_detail)
public function string of_create_dynamic_dw (long al_prac_id, integer ai_data_view_id, integer ai_screen_id, u_dw adw_detail, u_dw adw_browse, boolean ab_screen_painter, integer ai_facility_id)
public function integer of_refresh_cache ()
public function integer of_get_next_seq_no (string as_dw, long al_rec_id)
public function integer of_add_address_link (long al_prac_id, integer ai_facility_id)
public function string of_create_dynamic_profile_dw (long al_prac_id, integer ai_data_view_id, integer ai_screen_id, u_dw adw_detail, u_dw adw_browse, boolean ab_screen_painter, integer ai_facility_id)
public function integer of_get_facil_specific (integer ai_table)
public function integer of_add_hosp_link (long ai_facility_id, long al_prac_id)
public function integer of_add_spec_link (integer al_facil_id, long al_prac_id)
public function string of_get_reference_val (long al_table)
public function integer of_field_audit_delete_last (u_dw adw, integer ai_row)
public function integer of_dwchild_retrieve (string as_lu_table, string as_type, u_dw adw_dw, string as_from, long al_value, string as_column_nm)
public function integer of_rec_count (integer ai_tid, integer ai_facility)
public function integer of_add_questions (string as_from, datawindow adw_detail, integer ai_facility, long al_prac, long al_app_stat)
public function integer of_validate_year (u_dw a_dw, string as_type, integer ai_row)
public function integer of_set_mod_date (long al_prac)
public function integer of_create_dynamic_ds (long al_prac_id, integer ai_data_view_id, integer ai_screen_id, n_ds adw_detail, integer ai_facility_id, n_tr atr_sqlca)
public function integer of_add_committees (long al_prac_id, integer ai_facility_id, long al_rec_id)
public function integer of_change_to_dddw (ref string as_syntax, string as_colname[])
public function integer of_change_to_editmask (ref string as_syntax, string as_colname[])
public function integer of_dwchild_after_retrieve (u_dw adw_dw)
public subroutine of_dwchild_after_retrieve_2 (u_dw adw_dw)
public function string of_create_dynamic_dw_local (long al_prac_id, integer ai_data_view_id, integer ai_screen_id, u_dw adw_detail, u_dw adw_browse, boolean ab_screen_painter, integer ai_facility_id)
public function integer of_field_audit_update ()
public function integer of_create_option (integer ai_data_view_id, integer ai_screen_id, string as_detail, string as_calltype, string as_updatedate, boolean ab_screen_painter)
public function integer of_save_create_syntax (integer ai_data_view_id, integer ai_screen_id, datawindow adw_save, string as_detail, string as_currentdate, string as_calltype, boolean ab_screen_painter)
public function integer of_get_create_syntax (integer ai_data_view_id, integer ai_screen_id, ref string as_dwsyntax, string as_detail, string as_calltype, boolean ab_screen_painter)
public function integer of_app_audit_item_create (integer al_facility, long al_prac, long al_temp_item_id, long al_affil_recid, long al_de_recid, string as_from, integer ai_complete, string as_ref)
public subroutine of_create_application_audit_record (string as_rec_status, long al_prac_id[], long al_screen_id, long al_rec_id[], string as_reference)
public function integer of_app_audit_update_ref (long al_prac, long al_de_recid, string as_ref)
public function integer of_app_audit_items_add (long al_facility, long al_prac, long al_affil_rec_id, long al_template, string as_from, datawindow adw_existing, string as_appt_type)
public function integer of_generate_attest_questions (string as_from, integer ai_facility_id, long al_prac_id, integer al_appt_id)
public function integer of_field_audit (datastore ads_data, ref string as_errortext)
public function string of_create_dynamic_dw_4_prof (long al_prac_id, integer ai_data_view_id, integer ai_screen_id, u_dw adw_detail, boolean ab_screen_painter, integer ai_facility_id)
public function integer of_app_audit_date_reset (long ai_app_stat_recid, long ai_prac)
public function integer of_detail_preupdate (u_dw adw_detail)
public function integer of_dwchild_retrieve (string as_lu_table, string as_type, datawindowchild adw_dw, string as_from, long al_value, string as_column_nm)
public function string of_create_dynamic_dw (long al_prac_id, integer ai_data_view_id, integer ai_screen_id, u_dw adw_detail, u_dw adw_browse, boolean ab_screen_painter, integer ai_facility_id, string as_curdw, string as_reportfrom, integer ai_profile_view_id)
public function string of_mod_report_dw (long al_prac_id, integer ai_data_view_id, integer ai_screen_id, datawindowchild adw_detail, boolean ab_screen_painter, integer ai_facility_id, string as_curdw, string as_reportfrom, integer ai_profile_view_id)
end prototypes

public function string of_get_first_column ();Return is_first_column
end function

public function integer of_set_defaults (u_dw a_dw, integer ai_row);Integer li_fld_cnt
Integer i
datawindowchild ld_child
li_fld_cnt = UpperBound( is_column_names[] )

FOR i = 1 TO li_fld_cnt
	IF Not IsNull(is_column_names[ i ]) AND Not IsNull( is_column_default[i]) THEN
		if a_dw.Describe( is_column_names[ i ] + ".ColType") <> "!" then //Start Code Change ----09.11.2008 #V85 maha -  check to make sure the column exists
			a_dw.SetColumn( is_column_names[ i ] )
			//--------------------------- APPEON BEGIN ---------------------------
			//$<ID> UM-01
			//$<add> 02.16.2006 By: Liang QingShi
			//$<reason> Fix a defect in the original unmodified PowerBuilder application.
			//$<modification> Executing a_dw.SetText( is_column_default[ i ] ) results in the message 
			//$<modification> "Item 'Yes' does not pass Validation test" popping up, if the value of
			//$<modification> is_column_default[ i ] is "Yes".
			//$<modification> Change the value of is_column_default[ i ] from "yes" to 581.  
			//$<modification> The accepting_new_patients column in the pd_address table is 581, instead of "Yes",
			//$<modification> after chekcing the database.  This modification prevents the popup message.
			
			if is_column_names[ i ] = 'accepting_new_patients'  and a_dw.GetChild( is_column_names[ i ], ld_child ) > 0 then
				is_column_default[ i ] = string(581)
			end if
			//---------------------------- APPEON END ----------------------------
			a_dw.SetText( is_column_default[ i ] )
		else
			if gi_test_mode = 1 then
				Messagebox("of_set_defaults", "Error trap.  Field does not exist on screen: " + is_column_names[ i ])
			end if
		end if
	END IF
END FOR

a_dw.AcceptText()

RETURN 0
end function

public function integer of_setup_cache ();//if gi_cache_set = 0 then //maha 092701 - removed 01.09.08
if ib_report = false then
	ids_screen_fields = CREATE n_ds
	ids_screen_fields.DataObject = "d_screen_fields_cache"
	ids_screen_fields.of_SetTransObject( SQLCA )
	
	ids_screen_objects = CREATE n_ds
	ids_screen_objects.DataObject = "d_screen_objects_cache"
	ids_screen_objects.of_SetTransObject( SQLCA )
else
	ids_screen_fields = CREATE n_ds
	ids_screen_fields.DataObject = "d_report_fields_cache"
	ids_screen_fields.of_SetTransObject( SQLCA )
	
	ids_screen_objects = CREATE n_ds
	ids_screen_objects.DataObject = "d_report_objects_cache"
	ids_screen_objects.of_SetTransObject( SQLCA )

	ids_report_objects = CREATE n_ds
	ids_report_objects.DataObject = "d_screen_report_objects_cache"
	ids_report_objects.of_SetTransObject( SQLCA )
end if

return 0

//IF gnv_app.of_get_field_object_cache()  THEN
//	ids_screen_fields.DataObject = "d_screen_fields_all"
//	ids_screen_fields.of_SetTransObject( SQLCA )
//	gnv_app.inv_dwcache.of_GetRegistered("SCREEN_FIELDS", ids_screen_fields)
//
//	ids_screen_objects.DataObject = "d_screen_objects_all"
//	ids_screen_objects.of_SetTransObject( SQLCA )
//	gnv_app.inv_dwcache.of_GetRegistered("SCREEN_OBJECTS", ids_screen_objects)
//END IF
//
//Return 0
//
end function

public function integer of_itemchanged (u_dw a_dw, string as_data);

CHOOSE CASE is_table_name
	CASE "pd_basic"
		IF a_dw.GetColumnName() = "middle_name" AND Len(as_data) = 1 THEN
			as_data = as_data + "."
			a_dw.SetItem( a_dw.GetRow(), "middle_name", as_data )
			Return 1
		END IF

END CHOOSE


RETURN 0
end function

public function integer of_field_audit (u_dw adw);//--------------------------- APPEON BEGIN ---------------------------
//$<add> 07.26.2007 By: Evan
//$<reason> New feature of import module.
string ls_Syntax
string ls_ErrorText
integer li_Return
DataStore lds_Data

//Dynamic create datawindow
lds_Data = Create DataStore
ls_Syntax = adw.object.datawindow.syntax
lds_Data.Create(ls_Syntax, ls_ErrorText)
adw.ShareData(lds_Data)

//Execute field audit
li_Return = of_field_audit(lds_Data, ls_ErrorText)
Destroy lds_Data
if li_Return = -1 then MessageBox("", ls_ErrorText)

Return li_Return
//---------------------------- APPEON END ----------------------------

Integer i
Integer c
Integer li_rc
Integer li_lu_rc
Long li_seq_rc
Long ll_seq_no
Integer li_nr
Integer li_col_cnt
Integer li_table_id
integer li_fs //maha 111502
Long ll_rec_id
Long ll_field_id
Long ll_field_id2
Long ll_field_id1
Long ll_old_value
Long ll_new_value
long ll_facility_id //maha111802
long ll_prac
String ls_lookup_type
String ls_is_lookup
String ls_lookup_field_name
String ls_retval
String ls_old_value
String ls_new_value
String ls_value1
String ls_value2
String ls_table_name
String ls_fld_nm
String ls_fld_nm2
String ls_fld_type

n_ds lds_lookup_address
n_ds lds_sys_audit

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-02
//$<modify> 04.10.2006 By: LeiWei
//$<reason> Performance tuning
//$<modification> Use pre-select approaches to improve the runtime performance of 
//$<modification> IntelliCred Web application.
/*
n_ds lds_audit_fields
n_ds lds_lookup_code
n_ds lds_last_seq_no

ls_table_name = adw.Object.DataWindow.Table.UpdateTable
//MessageBox("of audit trail", ls_table_name)

lds_sys_audit = CREATE n_ds
lds_sys_audit.DataObject = "d_view_audit"
lds_sys_audit.of_SetTransObject( SQLCA )

lds_last_seq_no = CREATE n_ds
lds_last_seq_no.DataObject = "d_get_last_field_audit_seq_no"
lds_last_seq_no.of_SetTransObject( SQLCA )

lds_lookup_code = CREATE n_ds
lds_lookup_code.DataObject = "d_lookup_code_search"
lds_lookup_code.of_SetTransObject( SQLCA )

lds_lookup_address = CREATE n_ds
lds_lookup_address.DataObject = "d_lookup_address_search"
lds_lookup_address.of_SetTransObject( SQLCA )

lds_audit_fields = CREATE n_ds
//Start Code Change ---- 03.28.2006 #358 maha
if gs_dbtype = "SQL" then
	lds_audit_fields.DataObject = "d_audit_fields_sql"
else
	lds_audit_fields.DataObject = "d_audit_fields"
end if
//End Code Change---03.28.2006
lds_audit_fields.of_SetTransObject( SQLCA )
li_col_cnt = lds_audit_fields.Retrieve( ls_table_name )

//messagebox("audit fields",li_col_cnt)
IF li_col_cnt < 1 THEN
//	messagebox("audit fields",li_col_cnt)
	Return -1
END IF

li_rc = adw.RowCount()
//messagebox("adw count",li_rc)
li_table_id = lds_audit_fields.GetItemNumber( 1, "table_id" )
li_fs = of_get_facil_specific(li_table_id)
*/
datastore lds_audit_fields

IF NOT IsValid(ids_sys_audit) THEN
	ids_sys_audit = CREATE n_ds
	ids_sys_audit.DataObject = "d_view_audit"
	ids_sys_audit.SetTransObject( SQLCA )
END IF
lds_sys_audit = ids_sys_audit

ls_table_name = adw.Object.DataWindow.Table.UpdateTable

// <RP> 1.10.2017 --------------------------------------------
gnv_data.of_retrieveIfNecessary("sys_fields", FALSE)
// <RP>
lds_audit_fields = gnv_data.ids_sys_fields
lds_audit_fields.SetFilter( "sys_tables_table_name = '" + ls_table_name + "' AND sys_fields_audit_fld = 'Y'" )
lds_audit_fields.Filter()
li_col_cnt =  lds_audit_fields.Rowcount( )
IF li_col_cnt < 1 THEN
	Return -1
END IF

li_rc = adw.RowCount()
li_table_id = lds_audit_fields.GetItemNumber( 1, "table_id" )
li_fs = of_get_facil_specific(li_table_id)

Long ll_value_arr[],ll_j
Boolean lb_data_view_screen
Long ll_reference_field_1,ll_reference_field_2
Date ld_today
Time lt_today

FOR i = 1 TO li_rc
	ll_rec_id = adw.GetItemNumber( i, "rec_id" ) 
	ll_prac = adw.GetItemNumber( i, "prac_id" )
	if li_fs = 1 then
		if ls_table_name = "pd_affil_stat" then
			ll_facility_id = adw.GetItemNumber( i, "parent_facility_id" )
		else
			ll_facility_id = adw.GetItemNumber( i, "facility_id" )
		end if
	end if

	IF adw.GetItemStatus( i, 0, Primary! ) = DataModified! THEN
		FOR c = 1 TO li_col_cnt
			ll_field_id = lds_audit_fields.GetItemNumber( c, "field_id" )
			ls_fld_nm = lds_audit_fields.GetItemString( c, "field_name" )
			ls_fld_type = Upper( adw.Describe( ls_fld_nm + ".ColType" ) )

			IF Pos( ls_fld_type, "CHAR" ) > 0 THEN
				ls_fld_type = "C"
			ELSEIF Pos( ls_fld_type, "DATE" ) > 0 THEN
				ls_fld_type = "D"
			ELSEIF Pos( ls_fld_type, "LONG" ) > 0 OR Pos( ls_fld_type, "DECIMAL" ) > 0 OR Pos( ls_fld_type, "REAL" ) > 0 THEN
				ls_fld_type = "N"
			ELSEIF ls_fld_type = "!" THEN
				CONTINUE
			ELSE				
				MessageBox("", "Unknown data type " + ls_fld_type + " for field " + ls_fld_nm )
				Return -1
			END IF

			IF adw.GetItemStatus( i, ls_fld_nm, Primary! ) = DataModified! THEN
				ls_lookup_field_name = UPPER( lds_audit_fields.GetItemString( c, "lookup_field_name" ) )
				ls_is_lookup = lds_audit_fields.GetItemString( c, "lookup_field" )
				ls_lookup_type = lds_audit_fields.GetItemString( c, "lookup_type" )								
				IF ls_fld_type = "N" AND ls_is_lookup = "Y" AND ls_lookup_type <> "C" THEN
					ll_old_value = adw.GetItemNumber( i, ls_fld_nm, Primary!, True ) 
					ll_j ++
					ll_value_arr[ll_j] = ll_old_value
					ll_new_value = adw.GetItemNumber( i, ls_fld_nm )
					ll_j ++
					ll_value_arr[ll_j] = ll_new_value
				END IF
			END IF
		END FOR
	END IF

	IF adw.GetItemStatus( i, 0, Primary! ) = NewModified! THEN
		choose case ls_table_name
			case "pd_affil_stat","pd_affil_dept","pd_affil_staff_cat","pd_affil_staff_leave"
			case else
				lb_data_view_screen = TRUE

				/*
				select reference_field_1,reference_field_2
				into :ll_reference_field_1 , :ll_reference_field_2
				from data_view_screen 
				where table_id = :li_table_id and data_view_id = 1;
				*/

				ll_reference_field_1 = Long(gnv_data.of_getitem( "data_view_screen", "reference_field_1", "data_view_id = 1 and table_id = " + String(li_table_id)))
				ll_reference_field_2 = Long(gnv_data.of_getitem( "data_view_screen", "reference_field_2", "data_view_id = 1 and table_id = " + String(li_table_id)))
			
				ll_field_id1 = ll_reference_field_1
				if lds_audit_fields.rowcount() > 0 then
					if isnull(ll_field_id) or ll_field_id1 < 1 then ll_field_id1 = lds_audit_fields.GetItemNumber( 1, "field_id" )
				end if

				ll_field_id2 = ll_reference_field_2
				if lds_audit_fields.rowcount() > 1 then
					if isnull(ll_field_id2) or ll_field_id2 < 1 then ll_field_id2 = lds_audit_fields.GetItemNumber( 2, "field_id" )
				end if

				//get reference field name 1
				ls_fld_nm = gnv_data.of_getitem( "sys_fields", "field_name", "field_id = " + String(ll_field_id1) )
				if lds_audit_fields.rowcount() > 0 then
					if isnull(ls_fld_nm) or ls_fld_nm = "" then ls_fld_nm = lds_audit_fields.GetItemString( 1, "field_name" )
				end if

				//get reference field name 2
				ls_fld_nm2 = gnv_data.of_getitem( "sys_fields", "field_name", "field_id = " + String(ll_field_id2) )
				if lds_audit_fields.rowcount() > 1 then
					if isnull(ls_fld_nm2) or ls_fld_nm2 = "" then ls_fld_nm2 = lds_audit_fields.GetItemString( 2, "field_name" )
				end if
				
				//datatype and lookup field
				ls_fld_type = gnv_data.of_getitem( "sys_fields", "field_type", "field_id = " + String(ll_field_id1) )
				ls_lookup_type = gnv_data.of_getitem( "sys_fields", "lookup_type", "field_id = " + String(ll_field_id1) )

				ls_fld_type = Upper( adw.Describe( ls_fld_nm + ".ColType" ) )
				IF Pos( ls_fld_type, "CHAR" ) > 0 THEN
					ls_fld_type = "C"
				ELSEIF Pos( ls_fld_type, "DATE" ) > 0 THEN
					ls_fld_type = "D"
				ELSEIF Pos( ls_fld_type, "LONG" ) > 0 OR Pos( ls_fld_type, "DECIMAL" ) > 0 THEN
					ls_fld_type = "N"
				ELSEIF ls_fld_type = "!" THEN
					CONTINUE
				ELSE				
					MessageBox("", "Unknown data type " + ls_fld_type + " for field " + ls_fld_nm )
					Return -1
				END IF

				choose case ls_fld_type
					case "C","V"
						ls_value1 = adw.GetItemString( i, ls_fld_nm )
					case "N", "I"
						ls_value1 = string(adw.GetItemnumber( i, ls_fld_nm ))
					case "D"
						ls_value1 = string(adw.GetItemdatetime( i, ls_fld_nm ))
					case else
						ls_value1 = ""
				end choose

				IF ls_lookup_type = "A" THEN
					ll_j ++
					ll_value_arr[ll_j] = Long(ls_value1)
				END IF
				
				ls_fld_type = gnv_data.of_getitem( "sys_fields", "field_type", "field_id = " + String(ll_field_id2) )
				ls_lookup_type = gnv_data.of_getitem( "sys_fields", "lookup_type", "field_id = " + String(ll_field_id2) )

				ls_fld_type = Upper( adw.Describe( ls_fld_nm2 + ".ColType" ) )
				IF Pos( ls_fld_type, "CHAR" ) > 0 THEN
					ls_fld_type = "C"
				ELSEIF Pos( ls_fld_type, "DATE" ) > 0 THEN
					ls_fld_type = "D"
				ELSEIF Pos( ls_fld_type, "LONG" ) > 0 OR Pos( ls_fld_type, "DECIMAL" ) > 0 THEN
					ls_fld_type = "N"
				ELSEIF ls_fld_type = "!" THEN
					CONTINUE
				ELSE				
					MessageBox("", "Unknown data type " + ls_fld_type + " for field " + ls_fld_nm )
					Return -1
				END IF
				
				choose case ls_fld_type
					case "C","V"
						ls_value2 = adw.GetItemString( i, ls_fld_nm2 )
					case "N", "I"
						ls_value2 = string(adw.GetItemnumber( i, ls_fld_nm2 ))
					case "D"
						ls_value2 = string(adw.GetItemdatetime( i, ls_fld_nm2 ))
					case else
						ls_value2 = ""
				end choose		

				IF ls_lookup_type = "A" THEN
					ll_j ++
					ll_value_arr[ll_j] = Long(ls_value2)
				END IF
		end choose
	END IF
END FOR

IF ll_j > 0 THEN
	lds_lookup_address = CREATE n_ds
	lds_lookup_address.DataObject = "d_lookup_address_search_all"
	lds_lookup_address.settransObject( SQLCA )
	lds_lookup_address.Retrieve( ll_value_arr[] )
END IF

//---------------------------- APPEON END ----------------------------

FOR i = 1 TO li_rc
		ll_rec_id = adw.GetItemNumber( i, "rec_id" ) 
		ll_prac = adw.GetItemNumber( i, "prac_id" )
		if li_fs = 1 then
			if ls_table_name = "pd_affil_stat" then
				ll_facility_id = adw.GetItemNumber( i, "parent_facility_id" )
			else
				ll_facility_id = adw.GetItemNumber( i, "facility_id" )
			end if
		end if
	IF adw.GetItemStatus( i, 0, Primary! ) = DataModified! THEN
		//li_table_id = lds_audit_fields.GetItemNumber( 1, "table_id" )
		//messagebox("audit fields","data modified")
		FOR c = 1 TO li_col_cnt
			
			ll_field_id = lds_audit_fields.GetItemNumber( c, "field_id" )
			ls_fld_nm = lds_audit_fields.GetItemString( c, "field_name" )
			ls_fld_type = Upper( adw.Describe( ls_fld_nm + ".ColType" ) )
			//messagebox(ls_fld_nm, adw.Describe( ls_fld_nm + ".ColType" ) )
			
			IF Pos( ls_fld_type, "CHAR" ) > 0 THEN
				ls_fld_type = "C"
			ELSEIF Pos( ls_fld_type, "DATE" ) > 0 THEN
				ls_fld_type = "D"
			ELSEIF Pos( ls_fld_type, "LONG" ) > 0 OR Pos( ls_fld_type, "DECIMAL" ) > 0 OR Pos( ls_fld_type, "REAL" ) > 0 THEN
				ls_fld_type = "N"
			ELSEIF ls_fld_type = "!" THEN
				//messagebox(ls_fld_nm, adw.Describe( ls_fld_nm + ".ColType" ) )
				CONTINUE
			ELSE				
				MessageBox("", "Unknown data type " + ls_fld_type + " for field " + ls_fld_nm )
				Return -1
			END IF
			//ls_fld_type = lds_audit_fields.GetItemString( c, "field_type" )
			IF adw.GetItemStatus( i, ls_fld_nm, Primary! ) = DataModified! THEN
				ls_lookup_field_name = UPPER( lds_audit_fields.GetItemString( c, "lookup_field_name" ) )
				ls_is_lookup = lds_audit_fields.GetItemString( c, "lookup_field" )
				ls_lookup_type = lds_audit_fields.GetItemString( c, "lookup_type" )								
				IF ls_fld_type = "C" THEN
					ls_old_value = adw.GetItemString( i, ls_fld_nm, Primary!, True )
					ls_new_value = adw.GetItemString( i, ls_fld_nm )
				ELSEIF ls_fld_type = "N" THEN
					ll_old_value = adw.GetItemNumber( i, ls_fld_nm, Primary!, True ) 
					ll_new_value = adw.GetItemNumber( i, ls_fld_nm ) 												
					IF ls_is_lookup = "Y" THEN
						IF ls_lookup_type = "C" THEN
							//--------------------------- APPEON BEGIN ---------------------------
							//$<ID> PT-03
							//$<modify> 02.27.2006 By: LeiWei
							//$<reason> Performance tuning
							//$<modification> Write script to retrieve data from a cache instead of from the database.

							/*
							//get the old value
							li_lu_rc = lds_lookup_code.Retrieve( ll_old_value )
							IF li_lu_rc = 0 THEN
								ls_old_value = ""
							ELSEIF ls_lookup_field_name = "CODE" THEN
								ls_old_value = lds_lookup_code.GetItemString( 1, "code" )									
							ELSE
								ls_old_value = lds_lookup_code.GetItemString( 1, "description" )								
							END IF
							//get the new value
							li_lu_rc = lds_lookup_code.Retrieve( ll_new_value )
							IF li_lu_rc = 0 THEN
								ls_new_value = ""
							ELSEIF ls_lookup_field_name = "CODE" THEN
								ls_new_value = lds_lookup_code.GetItemString( 1, "code" )									
							ELSE
								ls_new_value = lds_lookup_code.GetItemString( 1, "description" )								
							END IF								
							*/

							//get the old value						
							IF ls_lookup_field_name = "CODE" THEN
								ls_old_value = gnv_data.of_getitem( 'code_lookup', 'code', 'lookup_code='+string(ll_old_value))
							ELSE
								ls_old_value = gnv_data.of_getitem( 'code_lookup', 'description', 'lookup_code='+string(ll_old_value))
							END IF

							//get the new value
							IF ls_lookup_field_name = "CODE" THEN
								ls_new_value = gnv_data.of_getitem( 'code_lookup', 'code', 'lookup_code='+string(ll_new_value))
							ELSE
								ls_new_value = gnv_data.of_getitem( 'code_lookup', 'description', 'lookup_code='+string(ll_new_value))
							END IF							
							//---------------------------- APPEON END ----------------------------
						ELSE
							//--------------------------- APPEON BEGIN ---------------------------
							//$<ID> PT-04
							//$<modify> 02.27.2006 By: LeiWei
							//$<reason> Performance tuning
							//$<modification> Write script to retrieve data from a cache instead of from the database.
							/*
							//get the old value
							li_lu_rc = lds_lookup_address.Retrieve( ll_old_value )
							*/
							//get the old value
							lds_lookup_address.SetFilter("lookup_code = " + string(ll_old_value))
							lds_lookup_address.Filter()
							li_lu_rc = lds_lookup_address.Rowcount()
							//---------------------------- APPEON END ----------------------------
							
							IF li_lu_rc = 0 THEN
								ls_old_value = ""
							ELSEIF ls_lookup_field_name = "CODE" THEN
								ls_old_value = lds_lookup_address.GetItemString( 1, "code" )									
							ELSE
								ls_old_value = lds_lookup_address.GetItemString( 1, "entity_name" )								
							END IF

							//--------------------------- APPEON BEGIN ---------------------------
							//$<ID> PT-05
							//$<modify> 02.27.2006 By: LeiWei
							//$<reason> Performance tuning
							//$<modification> Write script to retrieve data from a cache instead of from the database.
							/*
							//get the new value
							li_lu_rc = lds_lookup_address.Retrieve( ll_new_value )
							*/
							//get the new value
							lds_lookup_address.SetFilter("lookup_code = " + string(ll_new_value))
							lds_lookup_address.Filter()
							li_lu_rc = lds_lookup_address.Rowcount()
							//---------------------------- APPEON END ----------------------------
							
							IF li_lu_rc = 0 THEN
								ls_new_value = ""
							ELSEIF ls_lookup_field_name = "CODE" THEN
								ls_new_value = lds_lookup_address.GetItemString( 1, "code" )									
							ELSE
								ls_new_value = lds_lookup_address.GetItemString( 1, "entity_name" )																
							END IF
						END IF
					ELSE
						ls_old_value = String( adw.GetItemNumber( i, ls_fld_nm, Primary!, True ) )
						ls_new_value = String( adw.GetItemNumber( i, ls_fld_nm ) )						
					END IF
				ELSE
					ls_old_value = String( Date( adw.GetItemDateTime( i, ls_fld_nm, Primary!, True ) ) )
					ls_new_value = String( Date( adw.GetItemDateTime( i, ls_fld_nm ) ) )												
				END IF
				
				//--------------------------- APPEON BEGIN ---------------------------
				//$<ID> PT-06
				//$<comment> 02.27.2006 By: LeiWei
				//$<reason> Performance tuning
				//$<reason> The following script is moved to the function of_field_audit_update
				//$<reason> and they are integrated with other SQL statements together into Appeon Queue
				//$<reason> labels for performance tuning.
				/*
				ll_seq_rc = lds_last_seq_no.Retrieve( ll_rec_id, ll_field_id )
				IF ll_seq_rc > 0 THEN
					ll_seq_no = lds_last_seq_no.GetItemNumber(1, "last_seq_no" ) 
				END IF
				IF ll_seq_no = 0 OR IsNull( ll_seq_no ) THEN
					ll_seq_no = 1
				ELSE
					ll_seq_no++
				END IF
				*/
				//---------------------------- APPEON END ----------------------------

				li_nr = lds_sys_audit.InsertRow( 0 )
				lds_sys_audit.SetItem( li_nr, "rec_id", ll_rec_id )
				lds_sys_audit.SetItem( li_nr, "prac_id", adw.GetItemNumber( i, "prac_id" ) )					
				lds_sys_audit.SetItem( li_nr, "seq_no", ll_seq_no )										
				lds_sys_audit.SetItem( li_nr, "table_id", li_table_id )
				lds_sys_audit.SetItem( li_nr, "field_id", ll_field_id )
				lds_sys_audit.SetItem( li_nr, "old_value", mid(ls_old_value,1,100) )
				lds_sys_audit.SetItem( li_nr, "new_value", mid(ls_new_value,1 ,100 ))
				lds_sys_audit.SetItem( li_nr, "user_id", gnv_app.of_getuserid() )
				lds_sys_audit.SetItem( li_nr, "audit_type", "E" )					
				//--------------------------- APPEON BEGIN ---------------------------
				//$<ID> UM-03
				//$<modify> 02.28.2006 By: LeiWei
				//$<reason> DateTime( Date(Today()), Time(Now()) ) is currently unsupported.
				//$<modification> Modify it to DateTime( Today(), Now() ).
				/*
				lds_sys_audit.SetItem( li_nr, "date_time_modified", DateTime( Date(Today()), Time(Now()) ) )
				*/
				lds_sys_audit.SetItem( li_nr, "date_time_modified", DateTime( Today(), Now() ))
				//---------------------------- APPEON END ----------------------------

				lds_sys_audit.SetItem( li_nr, "sys_audit_exported", 1 )
				if li_fs = 1 then
					lds_sys_audit.SetItem( li_nr, "facility_id", ll_facility_id )
				else
					lds_sys_audit.SetItem( li_nr, "facility_id", 0 )
				end if
			END IF
		END FOR
////***********************************INSERT \/		
	elseif adw.GetItemStatus( i, 0, Primary! ) = NewModified! THEN //maha 070902 for INSERTS
		//li_table_id = lds_audit_fields.GetItemNumber( 1, "table_id" )
		ll_field_id = 1000 
		//messagebox("li_table_id",li_table_id)

		//messagebox("of_audit","in insert code")
		choose case ls_table_name
			case "pd_affil_stat"
				ll_new_value = adw.GetItemnumber( i, "parent_facility_id" )
				
				//--------------------------- APPEON BEGIN ---------------------------
				//$<ID> PT-07
				//$<modify> 02.27.2006 By: LeiWei
				//$<modification> Write script to retrieve data from a cache instead of from the database.
				//select facility_name into :ls_value1 from facility where facility_id = :ll_new_value;
				ls_value1 = gnv_data.of_getitem("facility","facility_name","facility_id = " + String(ll_new_value))
				//---------------------------- APPEON END ----------------------------
				
				ls_value2 = adw.GetItemstring( i, "apptmnt_type" )
				ls_new_value = ls_value1 + "-" + ls_value2
			case "pd_affil_dept"
				ll_new_value = adw.GetItemnumber( i, "department" )
				
				//--------------------------- APPEON BEGIN ---------------------------
				//$<ID> PT-08
				//$<modify> 02.27.2006 By: LeiWei
				//$<modification> Write script to retrieve data from a cache instead of from the database.
				//select description into :ls_value2 from code_lookup where lookup_code = :ll_new_value;
				ls_value2 = gnv_data.of_getitem( 'code_lookup', 'description', 'lookup_code='+string(ll_new_value))
				//---------------------------- APPEON END ----------------------------

				ll_new_value = adw.GetItemnumber( i, "facility_id" )

				//--------------------------- APPEON BEGIN ---------------------------
				//$<ID> PT-09
				//$<modify> 02.27.2006 By: LeiWei
				//$<modification> Write script to retrieve data from a cache instead of from the database.
				//select facility_name into :ls_value1 from facility where facility_id = :ll_new_value;
				ls_value1 = gnv_data.of_getitem("facility","facility_name","facility_id = " + String(ll_new_value))
				//---------------------------- APPEON END ----------------------------

				ls_new_value = ls_value1 + "-" + ls_value2
			case "pd_affil_staff_cat"
				ll_new_value = adw.GetItemnumber( i, "facility_id" )

				//--------------------------- APPEON BEGIN ---------------------------
				//$<ID> PT-10
				//$<modify> 02.27.2006 By: LeiWei
				//$<modification> Write script to retrieve data from a cache instead of from the database.
				//select facility_name into :ls_value2 from facility where facility_id = :ll_new_value;
				ls_value2 = gnv_data.of_getitem("facility","facility_name","facility_id = " + String(ll_new_value))
				//---------------------------- APPEON END ----------------------------

				ll_new_value = adw.GetItemnumber( i, "staff_category" )

				//--------------------------- APPEON BEGIN ---------------------------
				//$<ID> PT-11
				//$<modify> 02.27.2006 By: LeiWei
				//$<modification> Write script to retrieve data from a cache instead of from the database.
				//select description into :ls_value1 from code_lookup where lookup_code = :ll_new_value;
				ls_value1 = gnv_data.of_getitem( 'code_lookup', 'description', 'lookup_code='+string(ll_new_value))
				//---------------------------- APPEON END ----------------------------	
				
				ls_new_value = ls_value1 + "-" + ls_value2
			case "pd_affil_staff_leave"
				ll_new_value = adw.GetItemnumber( i, "facility_id" )

				//--------------------------- APPEON BEGIN ---------------------------
				//$<ID> PT-12
				//$<modify> 02.27.2006 By: LeiWei
				//$<modification> Write script to retrieve data from a cache instead of from the database.
				//select facility_name into :ls_value2 from facility where facility_id = :ll_new_value;
				ls_value2 = gnv_data.of_getitem("facility","facility_name","facility_id = " + String(ll_new_value))
				//---------------------------- APPEON END ----------------------------

				ll_new_value = long(adw.GetItemstring( i, "leave_of_absence_reason" ))
				//--------------------------- APPEON BEGIN ---------------------------
				//$<ID> PT-13
				//$<modify> 02.27.2006 By: LeiWei
				//$<modification> Write script to retrieve data from a cache instead of from the database.
				//select description into :ls_value1 from code_lookup where lookup_code = :ll_new_value;
				ls_value1 = gnv_data.of_getitem( 'code_lookup', 'description', 'lookup_code='+string(ll_new_value))
				//---------------------------- APPEON END ----------------------------	

				ls_new_value = ls_value1 + "-" + ls_value2
			case else //data entry screens
				//--------------------------- APPEON BEGIN ---------------------------
				//$<ID> PT-14
				//$<modify> 02.27.2006 By: LeiWei
				//$<modification> Write script to retrieve data from a cache instead of from the database.
				//$<reason> Performance tuning
				
				/*
				//ls_new_value = of_get_reference_val(li_table_id)
				//get reference field 1
				select reference_field_1 into :ll_field_id1  from data_view_screen where table_id = :li_table_id and data_view_id = 1;
				if isnull(ll_field_id) or ll_field_id1 < 1 then ll_field_id1 = lds_audit_fields.GetItemNumber( 1, "field_id" )
				//get reference field 2
				select reference_field_2 into :ll_field_id2  from data_view_screen where table_id = :li_table_id and data_view_id = 1;
				if isnull(ll_field_id2) or ll_field_id2 < 1 then ll_field_id2 = lds_audit_fields.GetItemNumber( 2, "field_id" )
				//get reference field name 1
				select field_name into :ls_fld_nm from sys_fields where field_id = :ll_field_id1;
				if isnull(ls_fld_nm) or ls_fld_nm = "" then ls_fld_nm = lds_audit_fields.GetItemString( 1, "field_name" )
				//get reference field name 2
				select field_name into :ls_fld_nm2 from sys_fields where field_id = :ll_field_id2;
				if isnull(ls_fld_nm2) or ls_fld_nm2 = "" then ls_fld_nm2 = lds_audit_fields.GetItemString( 2, "field_name" )

				//ref 1 data
				//datatype and lookup field
				select field_type into :ls_fld_type from sys_fields where field_id = :ll_field_id1;
				select lookup_type into :ls_lookup_type from sys_fields where field_id = :ll_field_id1;
				*/	

				//get reference field 1
				ll_field_id1 = ll_reference_field_1
				if lds_audit_fields.rowcount() > 0 then
					if isnull(ll_field_id) or ll_field_id1 < 1 then ll_field_id1 = lds_audit_fields.GetItemNumber( 1, "field_id" )
				end if

				//get reference field 2
				ll_field_id2 = ll_reference_field_2
				if lds_audit_fields.rowcount() > 1 then
					if isnull(ll_field_id2) or ll_field_id2 < 1 then ll_field_id2 = lds_audit_fields.GetItemNumber( 2, "field_id" )
				end if

				//get reference field name 1
				ls_fld_nm = gnv_data.of_getitem( "sys_fields", "field_name", "field_id = " + String(ll_field_id1) )
				if lds_audit_fields.rowcount() > 0 then
					if isnull(ls_fld_nm) or ls_fld_nm = "" then ls_fld_nm = lds_audit_fields.GetItemString( 1, "field_name" )
				end if

				//get reference field name 2
				ls_fld_nm2 = gnv_data.of_getitem( "sys_fields", "field_name", "field_id = " + String(ll_field_id2) )
				if lds_audit_fields.rowcount() > 1 then
					if isnull(ls_fld_nm2) or ls_fld_nm2 = "" then ls_fld_nm2 = lds_audit_fields.GetItemString( 2, "field_name" )
				end if
				
				//datatype and lookup field
				ls_fld_type = gnv_data.of_getitem( "sys_fields", "field_type", "field_id = " + String(ll_field_id1) )
				ls_lookup_type = gnv_data.of_getitem( "sys_fields", "lookup_type", "field_id = " + String(ll_field_id1) )

				//---------------------------- APPEON END ----------------------------


				ls_fld_type = Upper( adw.Describe( ls_fld_nm + ".ColType" ) )
				IF Pos( ls_fld_type, "CHAR" ) > 0 THEN
					ls_fld_type = "C"
				ELSEIF Pos( ls_fld_type, "DATE" ) > 0 THEN
					ls_fld_type = "D"
				ELSEIF Pos( ls_fld_type, "LONG" ) > 0 OR Pos( ls_fld_type, "DECIMAL" ) > 0 THEN
					ls_fld_type = "N"
				ELSEIF ls_fld_type = "!" THEN
					//messagebox(ls_fld_nm, adw.Describe( ls_fld_nm + ".ColType" ) )
					CONTINUE
				ELSE				
					MessageBox("", "Unknown data type " + ls_fld_type + " for field " + ls_fld_nm )
					Return -1
				END IF
				//data value
				choose case ls_fld_type
					case "C","V"
						ls_value1 = adw.GetItemString( i, ls_fld_nm )
					case "N", "I"
						ls_value1 = string(adw.GetItemnumber( i, ls_fld_nm ))
					case "D"
						ls_value1 = string(adw.GetItemdatetime( i, ls_fld_nm ))
					case else
						ls_value1 = ""
				end choose
				//if lookup get lookup value
//					MessageBox("ls_lookup_type 1", ls_lookup_type)
//					messagebox("ls_fld_nm",ls_fld_nm)
				if ls_lookup_type = "C" then
					ll_new_value = long(ls_value1) //convert to number
					//--------------------------- APPEON BEGIN ---------------------------
					//$<ID> PT-15
					//$<modify> 02.27.2006 By: LeiWei
					//$<modification> Write script to retrieve data from a cache instead of from the database.
					//select description into :ls_value1 from code_lookup where lookup_code = :ll_new_value;
					ls_value1 = gnv_data.of_getitem( 'code_lookup', 'description', 'lookup_code='+string(ll_new_value))
					//---------------------------- APPEON END ----------------------------	
				elseif ls_lookup_type = "A" then
//					messagebox("in","addr lookup")
//					MessageBox("ls_value1 a", ls_value1)
					ll_new_value = long(ls_value1)

					//--------------------------- APPEON BEGIN ---------------------------
					//$<ID> PT-16
					//$<modify> 02.27.2006 By: LeiWei
					//$<modification> Write script to retrieve data from a cache instead of from the database.
					//$<reason> Performance tuning 
					/*
						select entity_name into :ls_value1 from address_lookup where lookup_code = :ll_new_value;
					*/
					ll_j = lds_lookup_address.Find("lookup_code = " + string(ll_new_value),1, lds_lookup_address.Rowcount())
					IF ll_j > 0 THEN ls_value1 = lds_lookup_address.GetItemString(ll_j , "entity_name" )
					//---------------------------- APPEON END ----------------------------

					//MessageBox("ls_value1 after lookup", ls_value1)
				end if
				
				//--------------------------- APPEON BEGIN ---------------------------
				//$<ID> PT-17
				//$<modify> 02.27.2006 By: LeiWei
				//$<modification> Write script to retrieve data from a cache instead of from the database.
				//$<reason> Performance tuning
				/*
				//reference 2 info
				select field_type into :ls_fld_type from sys_fields where field_id = :ll_field_id2;
				select lookup_type into :ls_lookup_type from sys_fields where field_id = :ll_field_id2;
				*/
				ls_fld_type = gnv_data.of_getitem( "sys_fields", "field_type", "field_id = " + String(ll_field_id2) )
				ls_lookup_type = gnv_data.of_getitem( "sys_fields", "lookup_type", "field_id = " + String(ll_field_id2) )
				//---------------------------- APPEON END ----------------------------

				ls_fld_type = Upper( adw.Describe( ls_fld_nm2 + ".ColType" ) )
				IF Pos( ls_fld_type, "CHAR" ) > 0 THEN
					ls_fld_type = "C"
				ELSEIF Pos( ls_fld_type, "DATE" ) > 0 THEN
					ls_fld_type = "D"
				ELSEIF Pos( ls_fld_type, "LONG" ) > 0 OR Pos( ls_fld_type, "DECIMAL" ) > 0 THEN
					ls_fld_type = "N"
				ELSEIF ls_fld_type = "!" THEN
					//messagebox(ls_fld_nm, adw.Describe( ls_fld_nm + ".ColType" ) )
					CONTINUE
				ELSE				
					MessageBox("", "Unknown data type " + ls_fld_type + " for field " + ls_fld_nm )
					Return -1
				END IF
				
				choose case ls_fld_type
					case "C","V"
						ls_value2 = adw.GetItemString( i, ls_fld_nm2 )
					case "N", "I"
						ls_value2 = string(adw.GetItemnumber( i, ls_fld_nm2 ))
					case "D"
						ls_value2 = string(adw.GetItemdatetime( i, ls_fld_nm2 ))
					case else
						ls_value2 = ""
				end choose		
				//MessageBox("ls_lookup_type 2", ls_lookup_type)
				if ls_lookup_type = "C" then
					ll_new_value = long(ls_value2)
					//--------------------------- APPEON BEGIN ---------------------------
					//$<ID> PT-18
					//$<modify> 02.27.2006 By: LeiWei
					//$<modification> Write script to retrieve data from a cache instead of from the database.
					//select description into :ls_value2 from code_lookup where lookup_code = :ll_new_value;
					ls_value2 = gnv_data.of_getitem( 'code_lookup', 'description', 'lookup_code='+string(ll_new_value))
					//---------------------------- APPEON END ----------------------------	
				elseif ls_lookup_type = "A" then
					ll_new_value = long(ls_value2)
					
					//--------------------------- APPEON BEGIN ---------------------------
					//$<ID> PT-19
					//$<modify> 02.27.2006 By: LeiWei
					//$<modification> Write script to retrieve data from a cache instead of from the database.
					//$<reason> Performance tuning 
					/*
						select entity_name into :ls_value2 from address_lookup where lookup_code = :ll_new_value;
					*/
					ll_j = lds_lookup_address.Find("lookup_code = " + string(ll_new_value),1, lds_lookup_address.Rowcount())
					IF ll_j > 0 THEN ls_value2 = lds_lookup_address.GetItemString(ll_j , "entity_name" )
					//---------------------------- APPEON END ----------------------------
					
				end if
				//check for nulls
				if isnull(ls_value1) then ls_value1  = ""
				if isnull(ls_value2) then ls_value2  = ""
				ls_new_value = ls_value1 + "-" + ls_value2
				ls_new_value = mid(ls_new_value,1,100)
////				MessageBox("ls_value1",ls_value1)
////				MessageBox("ls_value2",ls_value2)
		end choose
		
		//ls_new_value = ls_value1 + "-" + ls_value2

		//--------------------------- APPEON BEGIN ---------------------------
		//$<ID> PT-20
		//$<comment> 02.27.2006 By: LeiWei
		//$<reason> Performance tuning
		//$<modification> Move the following script to the of_field_audit_update function
		//$<modification> and they are integrated with other SQL statements together into Appeon Queue labels
		//$<modification> for performance tuning.
		/*
		ll_seq_rc = lds_last_seq_no.Retrieve( ll_rec_id, ll_field_id )
		IF ll_seq_rc > 0 THEN
			ll_seq_no = lds_last_seq_no.GetItemNumber(1, "last_seq_no" ) 
		END IF
		IF ll_seq_no = 0 OR IsNull( ll_seq_no ) THEN
			ll_seq_no = 1
		ELSE
			ll_seq_no++
		END IF
		*/
		//---------------------------- APPEON END ----------------------------

//		messagebox("rec_id", ll_rec_id )
//		messagebox("ll_field_id", ll_field_id )
//		messagebox("ll_seq_no",ll_seq_no)
		li_nr = lds_sys_audit.InsertRow( 0 )
		lds_sys_audit.SetItem( li_nr, "rec_id", ll_rec_id )
		lds_sys_audit.SetItem( li_nr, "prac_id", adw.GetItemNumber( i, "prac_id" ) )					
		lds_sys_audit.SetItem( li_nr, "seq_no", ll_seq_no )										
		lds_sys_audit.SetItem( li_nr, "table_id", li_table_id )
		lds_sys_audit.SetItem( li_nr, "field_id", 1000 )
		//lds_sys_audit.SetItem( li_nr, "old_value", "INSERT" )
		lds_sys_audit.SetItem( li_nr, "new_value", ls_new_value )
		lds_sys_audit.SetItem( li_nr, "user_id", gnv_app.of_getuserid() )
		lds_sys_audit.SetItem( li_nr, "audit_type", "I" )					
		//--------------------------- APPEON BEGIN ---------------------------
		//$<ID> PT-21
		//$<modify> 02.28.2006 By: LeiWei
		//$<reason> Performance tuning
		//$<modification> Write script to retrieve data from a cache instead of from the database.
		/*
		lds_sys_audit.SetItem( li_nr, "date_time_modified", DateTime( Date(Today()), Time(Now()) ) )
		*/
		lds_sys_audit.SetItem( li_nr, "date_time_modified", DateTime( Today(), Now() ) )
		//---------------------------- APPEON END ----------------------------
		
		lds_sys_audit.SetItem( li_nr, "sys_audit_exported", 1 )
		if li_fs = 1 then
			lds_sys_audit.SetItem( li_nr, "facility_id", ll_facility_id )
		else
			lds_sys_audit.SetItem( li_nr, "facility_id", 0)
		end if
		
///************************DELETE code moved to separate function
	
	END IF
END FOR

//if lds_sys_audit.rowcount() > 1 then maha 102003 trap not completed for multiple staff cat records
//	for i = 1 to ds_sys_audit.rowcount()
//		lds_sys_audit.getItemnumber( i ,"rec_id" )
//end if

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-22
//$<modify> 02.27.2006 By: LeiWei
//$<reason> Performance tuning
//$<modification> Call the of_field_audit_update() function when the loop is done.  Refer to
//$<modification> PT-06, PT-20 for more information.
/*
IF lds_sys_audit.Update() = -1 THEN
	MessageBox("", "Update to sys_audit table Failed!")
	Return -1
END IF

//Start Code Change ---- 11.03.2005 #18 maha
of_set_mod_date(ll_prac)
//End Code Change---11.03.2005 

COMMIT USING SQLCA;
*/

THIS.POST of_field_audit_update()

//---------------------------- APPEON END ----------------------------
RETURN 1
end function

public function integer of_record_validation (u_dw a_dw);//rebuilt maha 090805

Integer i
Integer li_rc
Integer li_last_row
Integer li_year_from = -1
Integer li_year_thru = -1
Integer li_found
Integer li_cnt
integer res = 1
Long ll_val
Long ll_linkval
String ls_val
DataWindowChild dwchild

//Start Code Change ----06.16.2008 #V81 maha - removed now usingfield validation//if of_get_app_setting("set_1","I") = 2 then return 1 //Start Code Change ----05.21.2008 #V8 maha - option added to turn off validation


a_dw.AcceptText()
li_rc = a_dw.RowCount()
li_last_row = a_dw.GetRow()
//first check if both from and to exist
if a_dw.Describe("year_from.ColType") <> "!"  and a_dw.Describe("year_thru.ColType") <> "!" then
	ls_val = "YEAR"
//if not, check start and end dates
elseif a_dw.Describe("start_date.ColType") <> "!"  and a_dw.Describe("end_date.ColType") <> "!" then
	ls_val = "DATE"
//if also not skip validation
else
	return 1
end if
	
	
CHOOSE CASE is_table_name
	CASE "pd_training"
		FOR i = 1 TO li_rc
			res = of_validate_year(a_dw,ls_val,i) //maha moved to function 090705
		END FOR					
	CASE "pd_other_affill"
		FOR i = 1 TO li_rc
			res = of_validate_year(a_dw,ls_val,i) 
		END FOR			
	CASE "pd_acedemic_appointments"
		FOR i = 1 TO li_rc		
			res = of_validate_year(a_dw,ls_val,i) 		
		END FOR			
	CASE "pd_hosp_affil"
		//maha 010301 code removed per pix request readded 090705
		FOR i = 1 TO li_rc
			res = of_validate_year(a_dw,ls_val,i) 
		END FOR					
END CHOOSE
		

RETURN res
end function

public function integer of_update_dddw (u_dw a_dw_detail, u_dw a_dw_browse);n_ds lds_lookup_fields
Integer li_col_cnt
Integer i
String ls_table_name
String ls_fld_nm
String ls_lookup_code
DataWindowChild dwchild

ls_table_name = a_dw_detail.Object.DataWindow.Table.UpdateTable

lds_lookup_fields = CREATE n_ds
lds_lookup_fields.DataObject = "d_lookup_fields"
lds_lookup_fields.of_SetTransObject( SQLCA )
li_col_cnt = lds_lookup_fields.Retrieve( ls_table_name )
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-23
//$<modify> 02.20.2006 By: Cao YongWang
//$<reason> Performance tuning.
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.
/*
FOR i = 1 TO li_col_cnt
	//ls_fld_nm = Mid( ls_table_name, 5, 100) + "_" + lds_lookup_fields.GetItemString( i, "field_name" )	
	ls_fld_nm = lds_lookup_fields.GetItemString( i, "field_name" )
	ls_lookup_code = lds_lookup_fields.GetItemString( i, "lookup_code" )
	//detail dw
	IF a_dw_detail.GetChild( ls_fld_nm, dwchild ) = 1 THEN
		dwchild.SetTransObject( SQLCA )
		dwchild.Retrieve( ls_lookup_code )
	END IF
	//browse dw
	IF a_dw_browse.GetChild( ls_fld_nm, dwchild ) = 1 THEN
		dwchild.SetTransObject( SQLCA )
		dwchild.Retrieve( ls_lookup_code )
	END IF
END FOR
*/
gnv_appeondb.of_startqueue()

FOR i = 1 TO li_col_cnt
	//ls_fld_nm = Mid( ls_table_name, 5, 100) + "_" + lds_lookup_fields.GetItemString( i, "field_name" )	
	ls_fld_nm = lds_lookup_fields.GetItemString( i, "field_name" )
	ls_lookup_code = lds_lookup_fields.GetItemString( i, "lookup_code" )
	//detail dw
	IF a_dw_detail.GetChild( ls_fld_nm, dwchild ) = 1 THEN
		dwchild.SetTransObject( SQLCA )
		dwchild.Retrieve( ls_lookup_code )
	END IF
END FOR

gnv_appeondb.of_commitqueue()
//---------------------------- APPEON END ----------------------------
RETURN 1
end function

public function integer of_create_dynamic_dw_browse (long al_prac_id, integer ai_data_view_id, integer ai_screen_id, u_dw adw_browse);SetPointer(HourGlass!)

Integer m1
Integer li_dddw_code_cnt
Integer li_dddw_address_cnt
Integer li_row_cnt
Integer m
Integer li_index
Integer li_obj_cnt
Integer i
Integer li_key_cnt
Integer li_prac_row_cnt
Integer t
Integer li_col_cnt
Integer li_fld_label_width
Integer li_fld_width
Integer li_table_cnt
Boolean lb_table_found
Boolean lb_multi_tablE
Boolean lb_first_field = True
Boolean lb_has_active_status = False
String ls_month
String ls_fld_lbl_font_wght
String ls_detail_band_height
String ls_dummy_array[]
String ls_width
String ls_dddw_width[]
String ls_height
String ls_x
String ls_y
String ls_justification
String ls_text
String ls_obj_type
String ls_obj_name
String ls_field_x[] 
String ls_visible
String ls_field_y[]
String ls_field_label_x[]
String ls_field_label_height[]
String ls_field_label_y[] 
String ls_field_label[]
String ls_field_id[]
String ls_mask[]
String ls_table_names[]
String ls_field_names[]
String ls_table_field_names[]
String ls_dw_field_names[]
String ls_key_fields_col_nm[]
String ls_temp_table
String ls_table_name
String ls_field_name
String ls_sql_syntax
String ls_grey
String ls_white
String ls_presentation_str
String ls_dwsyntax_str
String ERRORS
String ls_lookup_code
String ls_lookup_type
String ls_lookup_field
String ls_key_fields_syntax
String ls_key_fields[]
Long ll_detail_height
DataWindowChild dwchild
DataWindowChild dwchild_browse

is_column_default[] = ls_dummy_array[]
is_column_names[] = ls_dummy_array[]

of_setup_cache()

IF gnv_app.of_get_field_object_cache()  THEN
	ids_screen_fields.SetFilter( "data_view_id = " + String( ai_data_view_id ) +&
								     " AND screen_id = " + String( ai_screen_id ) )
	ids_screen_fields.Filter()
	li_row_cnt = ids_screen_fields.RowCount()


	ids_screen_objects.SetFilter( "data_view_id = " + String( ai_data_view_id ) +&
									     " AND screen_id = " + String( ai_screen_id ) )
	ids_screen_objects.Filter()								
	li_obj_cnt = ids_screen_objects.RowCount()
ELSE
	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> PT-24
	//$<add> 02.15.2006 By: Cao YongWang
	//$<reason> Performance tuning.
	//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.
	gnv_appeondb.of_startqueue()
	//---------------------------- APPEON END ----------------------------

	ids_screen_fields.DataObject = "d_screen_fields"
	ids_screen_fields.of_SetTransObject( SQLCA )
	li_row_cnt = ids_screen_fields.Retrieve( ai_data_view_id, ai_screen_id )

	ids_screen_objects.DataObject = "d_screen_objects"
	ids_screen_objects.of_SetTransObject( SQLCA )
	li_obj_cnt = ids_screen_objects.Retrieve( ai_data_view_id, ai_screen_id )
	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> PT-25
	//$<add> 02.15.2006 By: Cao YongWang
	//$<reason> Performance tuning.
	//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.
	gnv_appeondb.of_commitqueue()
	li_row_cnt = ids_screen_fields.Rowcount()
	li_obj_cnt = ids_screen_objects.Rowcount()
	//---------------------------- APPEON END ----------------------------

END IF


ii_column_cnt = 0

ls_sql_syntax = "SELECT "
li_table_cnt = 0


//BUILD SELECT 
FOR i = 1 TO li_row_cnt
	IF ids_screen_fields.GetItemString(i, "visible") = "N" THEN
		CONTINUE
	END IF
	ii_column_cnt++
	ls_table_name = Trim( ids_screen_fields.GetItemString( i, "db_table_name" ))
	is_table_name = ls_table_name
	ls_field_name = Trim( ids_screen_fields.GetItemString( i, "db_field_name" ))
	is_column_names[ii_column_cnt] = ls_field_name	
	is_column_default[ii_column_cnt] = ids_screen_fields.GetItemString( i, "default_value" )
	ls_mask[i] = ids_screen_fields.GetItemString( i, "field_mask" ) 
	ls_field_names[i] = ls_field_name
	ls_field_id[i] = String (ids_screen_fields.GetItemNumber( i, "field_id" ) )
	ls_field_x[i] = String (ids_screen_fields.GetItemNumber( i, "field_x" ) )
	ls_field_y[i] = String (ids_screen_fields.GetItemNumber( i, "field_y" ) )
	ls_field_label_height[i] = String (ids_screen_fields.GetItemNumber( i, "field_height" ) )
	ls_dddw_width[i] = String(ids_screen_fields.GetItemNumber(i, "drop_down_width"))
	ls_field_label_x[i] = String (ids_screen_fields.GetItemNumber( i, "field_label_x" ) )
	ls_field_label_y[i] = String (ids_screen_fields.GetItemNumber( i, "field_label_y" ) )	
	ls_table_field_names[i] = Mid( ls_table_name,5,100 ) + "_" + ls_field_name
	ls_field_label[i] = ids_screen_fields.GetItemString( i, "field_label" )
	ls_sql_syntax = ls_sql_syntax + ls_table_name + "." + ls_field_name + ", "
	ls_fld_lbl_font_wght = String (ids_screen_fields.GetItemNumber( i, "data_view_fields_font_wieght" ) )	
	lb_table_found = False
	FOR t = 1 TO li_table_cnt
		IF ls_table_names[t] = ls_table_name THEN
			lb_table_found = True
		   EXIT
		END IF
	END FOR
	IF NOT lb_table_found THEN
		li_table_cnt ++
		ls_table_names[ li_table_cnt ] = ls_table_name
	END IF
END FOR

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 03/15/2007 By: Jervis
//$<reason> Fix a defect
if li_table_cnt = 0 then
	Messagebox("Caution","Failed to create SELECT syntax for datawindow. ")
	return -1
end if
//---------------------------- APPEON END ----------------------------

ls_sql_syntax = Left( ls_sql_syntax, Len(ls_sql_syntax) -2 )

li_row_cnt = UpperBound(ls_field_names)

//ADD KEY FIELDS TO SELECT
li_key_cnt = 0
FOR i = 1 TO li_table_cnt
	ls_key_fields_syntax = ls_key_fields_syntax + ls_table_names[ i ] + ".prac_id, "
	li_key_cnt ++
	ls_key_fields[li_key_cnt] = ls_table_names[i] + ".prac_id"
	IF li_table_cnt > 1 THEN
		ls_key_fields_col_nm[li_key_cnt] = Mid(ls_table_names[ i ], 5, 100)  + "_prac_id"
	ELSE
		ls_key_fields_col_nm[li_key_cnt] = "prac_id"
	END IF

	li_key_cnt ++
	ls_key_fields_syntax = ls_key_fields_syntax + ls_table_names[ i ] + ".rec_id, "
	ls_key_fields[li_key_cnt] = ls_table_names[i] + ".rec_id"
	IF li_table_cnt > 1 THEN
		ls_key_fields_col_nm[li_key_cnt] = Mid(ls_table_names[ i ], 5, 100)  + "_rec_id"
		is_rec_id_col_nm = Mid(ls_table_names[ i ], 5, 100)  + "_rec_id"
	ELSE
		ls_key_fields_col_nm[li_key_cnt] = "rec_id"
		is_rec_id_col_nm = Mid(ls_table_names[ i ], 5, 100)  + "_rec_id"
	END IF
END FOR

ls_sql_syntax = Mid( ls_sql_syntax, 1, 7 ) + ls_key_fields_syntax + Mid(ls_sql_syntax, 8, 10000)

//ASSIGN DW FIELD NAMES
IF li_table_cnt > 1 THEN
	lb_multi_table = True
	FOR i = 1 TO li_row_cnt
		ls_dw_field_names[i] = ls_table_field_names[i]
	END FOR	
ELSE
	lb_multi_table = False
	FOR i = 1 TO li_row_cnt
		ls_dw_field_names[i] = ls_field_names[i]
	END FOR
END IF

//BUILD FROM CLAUSE
ls_sql_syntax = ls_sql_syntax + " FROM "
FOR i = 1 TO li_table_cnt
	ls_sql_syntax = ls_sql_syntax + ls_table_names[i] + ", "
END FOR
ls_sql_syntax = Left( ls_sql_syntax, Len(ls_sql_syntax) -2 )

//ADD WHERE CLAUSE
ls_sql_syntax = ls_sql_syntax + " WHERE " + ls_table_names[1] + ".prac_id  = " + String( al_prac_id )


//CREATE SYNTAX FOR BROWSE DW
ls_grey = String(rgb(192,192,192))
ls_white = String(rgb(255,255,255))
ls_presentation_str = "style(type=grid)" + " Column(Border=0) Datawindow(Color=" + ls_grey + " )" + "Text(Border=6 Background.Color=" + ls_grey + ")"

ls_dwsyntax_str = SQLCA.SyntaxFromSQL(ls_sql_syntax, &
	ls_presentation_str, ERRORS)

IF Len(ERRORS) > 0 THEN
	MessageBox("Caution", &
	"SyntaxFromSQL caused these errors: " + ERRORS)
	RETURN -1
END IF

adw_browse.SetRedraw(False)

adw_browse.Create( ls_dwsyntax_str, ERRORS)

IF Len(ERRORS) > 0 THEN
	MessageBox("Caution", &
	"Create cause these errors: " + ERRORS)
	adw_browse.SetRedraw(True)
	RETURN -1
END IF
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> UM-04
//$<add> 01.13.2006 By: Luke
//$<reason> It is currently unsupported to automatically change a column's edit style on the Web.
//$<modification> Modify the DataWindow syntax and then rebuild the DataWindow to
//$<modification> implement the functionality of changing a column's edit style.

If appeongetclienttype() <> 'PB' Then
	string ls_appeon_colname[]
	long li_appeon_index
	
	ls_dwsyntax_str = adw_browse.describe("datawindow.syntax")
	li_appeon_index = 1
	
	FOR i = 1 TO li_row_cnt
		IF ls_dw_field_names[i] = "active_status" THEN
			ls_appeon_colname[li_appeon_index] = ls_dw_field_names[i]
			li_appeon_index++
		END IF
		
		IF ids_screen_fields.GetItemString( i, "lookup_field") = "Y" THEN
			ls_appeon_colname[li_appeon_index] = ls_dw_field_names[i]
			li_appeon_index++
		END IF
	END FOR
	
	of_change_to_dddw (ls_dwsyntax_str,ls_appeon_colname)
	adw_browse.Create( ls_dwsyntax_str, ERRORS)
	
	IF Len(ERRORS) > 0 THEN
		MessageBox("Caution", &
		"Create cause these errors: " + ERRORS + ls_dwsyntax_str)
		clipboard(ls_dwsyntax_str)
		RETURN -1
	End if
End If
//---------------------------- APPEON END ----------------------------	

adw_browse.of_SetTransObject( SQLCA )
li_prac_row_cnt = adw_browse.Retrieve()


//adw_browse.Object.DataWindow.Detail.Height= 5000
//adw_browse.Modify("active_status.Initial='1'")
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-26
//$<add> 02.15.2006 By: Cao YongWang
//$<reason> Performance tuning.
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.
gnv_appeondb.of_startqueue()
//---------------------------- APPEON END ----------------------------

FOR i = 1 TO li_row_cnt
	IF ids_screen_fields.GetItemString(i, "visible") = "N" THEN
		CONTINUE
	END IF
	//visible
//	IF ab_screen_painter THEN
//		IF ids_screen_fields.GetItemString(i, "") = "N" THEN
//			adw_browse.Modify(ls_dw_field_names[i] + ".color = '8421504'") 
//			adw_browse.Modify(ls_dw_field_names[i] + ".background.color = '12632256'") 
//			adw_browse.Modify(ls_dw_field_names[i] + "_t.color = '8421504'") 
//		ELSE
//			adw_browse.Modify(ls_dw_field_names[i] + ".color = '0'") 
//			adw_browse.Modify(ls_dw_field_names[i] + "_t.color = '0'")
//			adw_browse.Modify(ls_dw_field_names[i] + ".background.color = '16777215'") 		
//		END IF
//	END IF

//	IF ab_screen_painter THEN
//		adw_browse.Modify( ls_dw_field_names[i] + ".TabSequence = '0'" )
//		adw_browse.Modify( ls_dw_field_names[i] + ".dbname = '" + String( i * 10) + "'" )
//	ELSE
		IF Len(ls_dw_field_names[i]) > 0 AND lb_first_field THEN
			lb_first_field = False
			is_first_column = ls_dw_field_names[i]
		END IF
		//adw_browse.Modify( ls_dw_field_names[i] + ".TabSequence = '" + String(i) + "'" )		
//	END IF
	adw_browse.Modify( ls_dw_field_names[i] + ".TabSequence = '0'" )
	
	if isnull(ls_field_label[i]) then ls_field_label[i] = '' //Jervis 02.18.2008
	adw_browse.Modify( ls_dw_field_names[i] + "_t.text = '" + ls_field_label[i] + "'")

	//bold or not?
	adw_browse.Modify( ls_dw_field_names[i] + "_t.font.weight = '" + ls_fld_lbl_font_wght + "'")	

	adw_browse.Modify( ls_dw_field_names[i] + "_t.text = '" + ls_field_label[i] + "'")

	li_fld_label_width = ids_screen_fields.GetItemNumber( i, "field_label_width" )
	li_fld_width = ids_screen_fields.GetItemNumber( i, "field_width" ) 
	//adw_browse.Modify( ls_dw_field_names[i] + ".width = '" + String( li_fld_width ) + "'" )	
	//adw_browse.Modify( ls_dw_field_names[i] + "_t.width = '" + String( li_fld_label_width ) + "'" )
	//adw_browse.Modify( ls_dw_field_names[i] + ".height = '" + String( ls_field_label_height[i] ) + "'" )

	//IF li_fld_width < li_fld_label_width THEN
	//	adw_browse.Modify( ls_dw_field_names[i] + ".width = '" + String( li_fld_label_width ) + "'" )
	//ELSE
	//	adw_browse.Modify( ls_dw_field_names[i] + ".width = '" + String( li_fld_width ) + "'" )
	//END IF

	
//	IF ls_field_x[i] = "0" THEN
//		adw_browse.Modify( ls_dw_field_names[i] + ".x = 750")
//		adw_browse.Modify( ls_dw_field_names[i] + ".y = " + String(i*100) )
//
//		adw_browse.Modify( ls_dw_field_names[i] + "_t.x = 100")
//		adw_browse.Modify( ls_dw_field_names[i] + "_t.y = " + String(i*100) )
//	ELSE
//		adw_browse.Modify( ls_dw_field_names[i] + ".x = " + ls_field_x[i] )
//		adw_browse.Modify( ls_dw_field_names[i] + ".y = " + ls_field_y[i] )
//
//		adw_browse.Modify( ls_dw_field_names[i] + "_t.x = " + ls_field_label_x[i] )
//		adw_browse.Modify( ls_dw_field_names[i] + "_t.y = " + ls_field_label_y[i] )		
//	END IF
//
//	//tag value set to field id
	//adw_browse.Modify( ls_dw_field_names[i] + ".tag = '" + ls_field_id[i] + "'" )
	//adw_browse.Modify( ls_dw_field_names[i] + "_t.tag = '" + ls_field_id[i] + "'" )

	//alignment
	//adw_browse.Modify( ls_dw_field_names[i] + ".alignment = '" + ids_screen_fields.GetItemString( i, "justification" ) + "'" )	
	//adw_browse.Modify( ls_dw_field_names[i] + "_t.alignment = '" + String( ids_screen_fields.GetItemNumber( i, "field_label_justification" ) ) + "'" )	
	//adw_browse.Modify( ls_dw_field_names[i] + ".alignment = '" + ids_screen_fields.GetItemString( i, "justification" ) + "'" )	
	//adw_browse.Modify( ls_dw_field_names[i] + "_t.alignment = '" + String( ids_screen_fields.GetItemNumber( i, "field_label_justification" ) ) + "'" )	
	
	IF ls_dw_field_names[i] = "active_status" THEN
		adw_browse.Modify( ls_dw_field_names[i] + ".dddw.VscrollBar = Yes")			
		adw_browse.Modify( ls_dw_field_names[i] + ".dddw.useasborder = No")			
		adw_browse.Modify( ls_dw_field_names[i] + ".dddw.NilIsNull= Yes")
		adw_browse.Modify( ls_dw_field_names[i] + ".dddw.Lines= 15")
		adw_browse.Modify( ls_dw_field_names[i] + "_t.font.underline = '1'")
		adw_browse.Modify( ls_dw_field_names[i] + ".dddw.Required = Yes")
		adw_browse.Modify( ls_dw_field_names[i] + ".dddw.name = 'd_code_lookup_active_inactive'")
		adw_browse.Modify( ls_dw_field_names[i] + ".dddw.datacolumn = 'lookup_code'")			
		adw_browse.Modify( ls_dw_field_names[i] + ".dddw.displaycolumn = 'description'")				
	END IF
	
	IF ids_screen_fields.GetItemString( i, "lookup_field") = "Y" THEN
		ls_lookup_code = ids_screen_fields.GetItemString( i, "lookup_code" )
		ls_lookup_field = ids_screen_fields.GetItemString( i, "lookup_field_name" )
		ls_lookup_type = ids_screen_fields.GetItemString( i, "lookup_type" )
		adw_browse.Modify( ls_dw_field_names[i] + ".dddw.VscrollBar = Yes")			
		adw_browse.Modify( ls_dw_field_names[i] + ".dddw.AutoHScroll = Yes")			
		adw_browse.Modify( ls_dw_field_names[i] + ".dddw.useasborder = No")			
		adw_browse.Modify(ls_dw_field_names[i] + ".dddw.NilIsNull= Yes")
		adw_browse.Modify(ls_dw_field_names[i] + ".dddw.Lines= 15")
		IF ids_screen_fields.GetItemString(i, "required") = "Y" THEN
			adw_browse.Modify(ls_dw_field_names[i] + "_t.font.underline = '1'")
			adw_browse.Modify(ls_dw_field_names[i] + ".dddw.Required = Yes")
		END IF	
		IF ls_lookup_type = "C" THEN
			adw_browse.Modify( ls_dw_field_names[i] + ".dddw.name = 'd_dddw_code_lookup'")
			adw_browse.Modify( ls_dw_field_names[i] + ".dddw.datacolumn = 'lookup_code'")			
			IF Upper( ls_lookup_field ) = "CODE" THEN
				adw_browse.Modify( ls_dw_field_names[i] + ".dddw.displaycolumn = 'code'")
			ELSE
				adw_browse.Modify( ls_dw_field_names[i] + ".dddw.displaycolumn = 'description'")								
			END IF
		ELSEIF ls_lookup_type = "A" THEN
			adw_browse.Modify( ls_dw_field_names[i] + ".dddw.HscrollBar = Yes")			
			adw_browse.Modify( ls_dw_field_names[i] + ".dddw.name = 'd_dddw_address_lookup'")						
			adw_browse.Modify( ls_dw_field_names[i] + ".dddw.datacolumn = 'lookup_code'")			
			IF Upper( ls_lookup_field ) = "CODE" THEN
				adw_browse.Modify( ls_dw_field_names[i] + ".dddw.displaycolumn = 'code'")
			ELSE
				adw_browse.Modify( ls_dw_field_names[i] + ".dddw.displaycolumn = 'entity_name'")			
			END IF
		END IF
		
		adw_browse.Modify( ls_dw_field_names[i] + ".dddw.VScrollBar = Yes")
		adw_browse.Modify( ls_dw_field_names[i] + ".dddw.PercentWidth = '" + ls_dddw_width[i] + "'")
		adw_browse.GetChild( ls_dw_field_names[i] , dwchild )
		//--------------------------- APPEON BEGIN ---------------------------
		//$<ID> PT-27
		//$<comment> 02.15.2006 By: Cao YongWang
		//$<reason> Performance tuning. 
		//$<modification> Comment out the redundant script, since adw_browse.GetChild( ls_dw_field_names[i] , dwchild )
		//$<modification> provides the same functionality.
		/*
		adw_browse.GetChild( ls_dw_field_names[i] , dwchild_browse )
		*/
		//---------------------------- APPEON END ----------------------------

		dwchild.SetTransObject( SQLCA )

		is_dddwcolumns[upperbound(is_dddwcolumns) + 1] = ls_dw_field_names[i]

		dwchild.Retrieve(ls_lookup_code)	
		dwchild.InsertRow(1)
		//--------------------------- APPEON BEGIN ---------------------------
		//$<ID> PT-28
		//$<comment> 02.15.2006 By: Cao YongWang
		//$<reason> Performance tuning. 
		//$<modification> Comment out the redundant script, since dwchild.InsertRow(1)
		//$<modification> provides the same functionality.
		/*
		dwchild.ShareData( dwchild_browse )
		*/
		//---------------------------- APPEON END ----------------------------
	ELSEIF ls_dw_field_names[i] <> "active_status" THEN
		adw_browse.Modify(ls_dw_field_names[i] + ".Edit.NilIsNull= Yes")
		IF ids_screen_fields.GetItemString(i, "required") = "Y" THEN
			adw_browse.Modify(ls_dw_field_names[i] + "_t.font.underline = '1'")			
			adw_browse.Modify(ls_dw_field_names[i] + ".Edit.Required = Yes")
		END IF	
		IF ls_mask[i] <> "" THEN
			adw_browse.Modify( ls_dw_field_names[i] + ".Edit.CodeTable = Yes")
			adw_browse.Modify( ls_dw_field_names[i] + ".Edit.ValidateCode = Yes" )
			adw_browse.Modify( ls_dw_field_names[i] + ".ValidationMsg = 'Invalid Month, Select a number from 1 and 12.'" )
			//adw_browse.Modify( ls_dw_field_names[i] + ".EditMask.Mask='" + ls_mask[i] + "'")
			IF ls_mask[i] = "##" THEN
				FOR m = 1 TO 12
					ls_month = String(m)
					adw_browse.SetValue( ls_dw_field_names[i], m, ls_month + "~t" + ls_month )
				END FOR
				m1 = 0
				FOR m = 13 TO 21
					m1++
					ls_month = "0" + String(m1)
					adw_browse.SetValue( ls_dw_field_names[i], m, ls_month + "~t" + ls_month )
				END FOR
				adw_browse.Modify( ls_dw_field_names[i] + ".Edit.Limit = '2'" )			
				
			ELSEIF ls_mask[i] = "(###)###-####" THEN
				//adw_browse.Modify( ls_dw_field_names[i] + ".EditMask.Mask='(###)###-####'" )		//Comment by Scofield on 2008-08-12
			ELSEIF ls_mask[i] = "###-##-####" THEN
				adw_browse.Modify( ls_dw_field_names[i] + ".EditMask.Mask='###-##-####'")								
			ELSEIF ls_mask[i] = "####" THEN
				li_index = 0
				FOR m = 1880 TO 2050
					li_index++
					adw_browse.SetValue( ls_dw_field_names[i], li_index, String(m) + "~t" + String(m) )
				END FOR
				adw_browse.Modify( ls_dw_field_names[i] + ".Edit.Limit = '4'" )			
				adw_browse.Modify( ls_dw_field_names[i] + ".ValidationMsg = 'Invalid Year, Select a number between 1880 and 2050.'" )
			ELSEIF ls_mask[i] = "mm/dd/yyyy" THEN
				//adw_browse.Modify( ls_dw_field_names[i] + ".EditMask.Mask ='mm/dd/yyyy'")
				adw_browse.Modify( ls_dw_field_names[i] + ".Format='mm/dd/yyyy'")
				adw_browse.Modify( ls_dw_field_names[i] + ".Format='mm/dd/yyyy'")
			ELSEIF ls_mask[i] = "#,##0.00" THEN
				adw_browse.Modify( ls_dw_field_names[i] + ".Format='#,##0'")
				adw_browse.Modify( ls_dw_field_names[i] + ".Format='#,##0'")
			END IF
		END IF	
	END IF
END FOR
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-30
//$<add> 02.15.2006 By: Cao YongWang
//$<reason> Performance tuning.
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.
gnv_appeondb.of_commitqueue()
If appeongetclienttype() <> 'PB' Then of_dwchild_after_retrieve_2(adw_browse)
//---------------------------- APPEON END ----------------------------

adw_browse.Modify( "rec_id.visible = '0'")
adw_browse.Modify( "prac_id.visible = '0'")

adw_browse.SetRedraw(True)

//adw_browse.Modify("create groupbox(band=detail text='End of Detail border='5' color='255' x='1' y='" + ls_detail_band_height + "' height='50' width='3000'  font.face='MS Sans Serif' font.height='-8' font.weight='400'  font.family='2' font.pitch='2' font.charset='0' background.mode='1' background.color='553648127' name=detail_band"  )


//CREATE ANY SCREEN OBJECTS THAT WERE ADDED
//FOR i = 1 TO li_obj_cnt
//	ls_obj_type = ids_screen_objects.GetItemString(i, "object_type") 
//	ls_obj_name = "object"+String( ids_screen_objects.GetItemNumber(i, "data_view_object_id") )
//	ls_width = String( ids_screen_objects.GetItemNumber(i, "object_width") )
//	ls_height = String( ids_screen_objects.GetItemNumber(i, "object_height") )
//	ls_x = String( ids_screen_objects.GetItemNumber(i, "object_x") )
//	ls_y = String( ids_screen_objects.GetItemNumber(i, "object_y") )
//	ls_text = ids_screen_objects.GetItemString(i, "object_text") 
//	ls_justification = String( ids_screen_objects.GetItemNumber(i, "object_alignment") )
//	CHOOSE CASE ls_obj_type
//		CASE "B"
//			adw_browse.Modify("create groupbox(band=detail text='" + ls_text + "' border='5' color='128' x='" + ls_x + "' y='" + ls_y + "' height='" + ls_height + "' width='" + ls_width + "'  font.face='MS Sans Serif' font.height='-8' font.weight='400'  font.family='2' font.pitch='2' font.charset='0' background.mode='1' background.color='553648127' name=" + ls_obj_name )
//		CASE "T"
//			adw_browse.Modify("create text(band=detail text='" + ls_text + "' border='0' color='128' x='" + ls_x + "' y='" + ls_y + "' height='" + ls_height + "' width='" + ls_width + "'  font.face='MS Sans Serif' font.height='-8' font.weight='400'  font.family='2' font.pitch='2' font.charset='0' background.mode='1' background.color='553648127' name=" + ls_obj_name + "_t" )
//	END CHOOSE
//END FOR
//

IF li_prac_row_cnt > 0 THEN 
	adw_browse.SetRow( 1 )
	adw_browse.SelectRow( 1, True )
	adw_browse.SetFocus()
END IF



RETURN 0
//SetPointer(HourGlass!)
//
//Integer m1
//Integer li_dddw_code_cnt
//Integer li_dddw_address_cnt
//Integer li_row_cnt
//Integer m
//Integer li_index
//Integer li_obj_cnt
//Integer i
//Integer li_key_cnt
//Integer li_prac_row_cnt
//Integer t
//Integer li_col_cnt
//Integer li_fld_label_width
//Integer li_fld_width
//Integer li_table_cnt
//Boolean lb_table_found
//Boolean lb_multi_tablE
//Boolean lb_first_field = True
//Boolean lb_has_active_status = False
//String ls_month
//String ls_fld_lbl_font_wght
//String ls_detail_band_height
//String ls_dummy_array[]
//String ls_width
//String ls_dddw_width[]
//String ls_height
//String ls_x
//String ls_y
//String ls_justification
//String ls_text
//String ls_obj_type
//String ls_obj_name
//String ls_field_x[] 
//String ls_visible
//String ls_field_y[]
//String ls_field_label_x[]
//String ls_field_label_height[]
//String ls_field_label_y[] 
//String ls_field_label[]
//String ls_field_id[]
//String ls_mask[]
//String ls_table_names[]
//String ls_field_names[]
//String ls_table_field_names[]
//String ls_dw_field_names[]
//String ls_key_fields_col_nm[]
//String ls_temp_table
//String ls_table_name
//String ls_field_name
//String ls_sql_syntax
//String ls_grey
//String ls_white
//String ls_presentation_str
//String ls_dwsyntax_str
//String ERRORS
//String ls_lookup_code
//String ls_lookup_type
//String ls_lookup_field
//String ls_key_fields_syntax
//String ls_key_fields[]
//Long ll_detail_height
//DataWindowChild dwchild
//DataWindowChild dwchild_browse
//
//is_column_default[] = ls_dummy_array[]
//is_column_names[] = ls_dummy_array[]
//
//of_setup_cache()
//
//IF gnv_app.of_get_field_object_cache()  THEN
//	ids_screen_fields.SetFilter( "data_view_id = " + String( ai_data_view_id ) +&
//								     " AND screen_id = " + String( ai_screen_id ) )
//	ids_screen_fields.Filter()
//	li_row_cnt = ids_screen_fields.RowCount()
//
//
//	ids_screen_objects.SetFilter( "data_view_id = " + String( ai_data_view_id ) +&
//									     " AND screen_id = " + String( ai_screen_id ) )
//	ids_screen_objects.Filter()								
//	li_obj_cnt = ids_screen_objects.RowCount()
//ELSE
//	ids_screen_fields.DataObject = "d_screen_fields"
//	ids_screen_fields.of_SetTransObject( SQLCA )
//	li_row_cnt = ids_screen_fields.Retrieve( ai_data_view_id, ai_screen_id )
//
//	ids_screen_objects.DataObject = "d_screen_objects"
//	ids_screen_objects.of_SetTransObject( SQLCA )
//	li_obj_cnt = ids_screen_objects.Retrieve( ai_data_view_id, ai_screen_id )
//END IF
//
//
//ii_column_cnt = 0
//
//ls_sql_syntax = "SELECT "
//li_table_cnt = 0
//
//
////BUILD SELECT 
//FOR i = 1 TO li_row_cnt
//	IF ids_screen_fields.GetItemString(i, "visible") = "N" THEN
//		CONTINUE
//	END IF
//	ii_column_cnt++
//	ls_table_name = Trim( ids_screen_fields.GetItemString( i, "db_table_name" ))
//	is_table_name = ls_table_name
//	ls_field_name = Trim( ids_screen_fields.GetItemString( i, "db_field_name" ))
//	is_column_names[ii_column_cnt] = ls_field_name	
//	is_column_default[ii_column_cnt] = ids_screen_fields.GetItemString( i, "default_value" )
//	ls_mask[i] = ids_screen_fields.GetItemString( i, "field_mask" ) 
//	ls_field_names[i] = ls_field_name
//	ls_field_id[i] = String (ids_screen_fields.GetItemNumber( i, "field_id" ) )
//	ls_field_x[i] = String (ids_screen_fields.GetItemNumber( i, "field_x" ) )
//	ls_field_y[i] = String (ids_screen_fields.GetItemNumber( i, "field_y" ) )
//	ls_field_label_height[i] = String (ids_screen_fields.GetItemNumber( i, "field_height" ) )
//	ls_dddw_width[i] = String(ids_screen_fields.GetItemNumber(i, "drop_down_width"))
//	ls_field_label_x[i] = String (ids_screen_fields.GetItemNumber( i, "field_label_x" ) )
//	ls_field_label_y[i] = String (ids_screen_fields.GetItemNumber( i, "field_label_y" ) )	
//	ls_table_field_names[i] = Mid( ls_table_name,5,100 ) + "_" + ls_field_name
//	ls_field_label[i] = ids_screen_fields.GetItemString( i, "field_label" )
//	ls_sql_syntax = ls_sql_syntax + ls_table_name + "." + ls_field_name + ", "
//	ls_fld_lbl_font_wght = String (ids_screen_fields.GetItemNumber( i, "data_view_fields_font_wieght" ) )	
//	lb_table_found = False
//	FOR t = 1 TO li_table_cnt
//		IF ls_table_names[t] = ls_table_name THEN
//			lb_table_found = True
//		   EXIT
//		END IF
//	END FOR
//	IF NOT lb_table_found THEN
//		li_table_cnt ++
//		ls_table_names[ li_table_cnt ] = ls_table_name
//	END IF
//END FOR
//ls_sql_syntax = Left( ls_sql_syntax, Len(ls_sql_syntax) -2 )
//
//li_row_cnt = UpperBound(ls_field_names)
//
////ADD KEY FIELDS TO SELECT
//li_key_cnt = 0
//FOR i = 1 TO li_table_cnt
//	ls_key_fields_syntax = ls_key_fields_syntax + ls_table_names[ i ] + ".prac_id, "
//	li_key_cnt ++
//	ls_key_fields[li_key_cnt] = ls_table_names[i] + ".prac_id"
//	IF li_table_cnt > 1 THEN
//		ls_key_fields_col_nm[li_key_cnt] = Mid(ls_table_names[ i ], 5, 100)  + "_prac_id"
//	ELSE
//		ls_key_fields_col_nm[li_key_cnt] = "prac_id"
//	END IF
//
//	li_key_cnt ++
//	ls_key_fields_syntax = ls_key_fields_syntax + ls_table_names[ i ] + ".rec_id, "
//	ls_key_fields[li_key_cnt] = ls_table_names[i] + ".rec_id"
//	IF li_table_cnt > 1 THEN
//		ls_key_fields_col_nm[li_key_cnt] = Mid(ls_table_names[ i ], 5, 100)  + "_rec_id"
//		is_rec_id_col_nm = Mid(ls_table_names[ i ], 5, 100)  + "_rec_id"
//	ELSE
//		ls_key_fields_col_nm[li_key_cnt] = "rec_id"
//		is_rec_id_col_nm = Mid(ls_table_names[ i ], 5, 100)  + "_rec_id"
//	END IF
//END FOR
//
//ls_sql_syntax = Mid( ls_sql_syntax, 1, 7 ) + ls_key_fields_syntax + Mid(ls_sql_syntax, 8, 10000)
//
////ASSIGN DW FIELD NAMES
//IF li_table_cnt > 1 THEN
//	lb_multi_table = True
//	FOR i = 1 TO li_row_cnt
//		ls_dw_field_names[i] = ls_table_field_names[i]
//	END FOR	
//ELSE
//	lb_multi_table = False
//	FOR i = 1 TO li_row_cnt
//		ls_dw_field_names[i] = ls_field_names[i]
//	END FOR
//END IF
//
////BUILD FROM CLAUSE
//ls_sql_syntax = ls_sql_syntax + " FROM "
//FOR i = 1 TO li_table_cnt
//	ls_sql_syntax = ls_sql_syntax + ls_table_names[i] + ", "
//END FOR
//ls_sql_syntax = Left( ls_sql_syntax, Len(ls_sql_syntax) -2 )
//
////ADD WHERE CLAUSE
//ls_sql_syntax = ls_sql_syntax + " WHERE " + ls_table_names[1] + ".prac_id  = " + String( al_prac_id )
//
//
////CREATE SYNTAX FOR BROWSE DW
//ls_grey = String(rgb(192,192,192))
//ls_white = String(rgb(255,255,255))
//ls_presentation_str = "style(type=grid)" + " Column(Border=0) Datawindow(Color=" + ls_grey + " )" + "Text(Border=6 Background.Color=" + ls_grey + ")"
//
//ls_dwsyntax_str = SQLCA.SyntaxFromSQL(ls_sql_syntax, &
//	ls_presentation_str, ERRORS)
//
//IF Len(ERRORS) > 0 THEN
//	MessageBox("Caution", &
//	"SyntaxFromSQL caused these errors: " + ERRORS)
//	RETURN -1
//END IF
//
//adw_browse.SetRedraw(False)
//
//adw_browse.Create( ls_dwsyntax_str, ERRORS)
//
//IF Len(ERRORS) > 0 THEN
//	MessageBox("Caution", &
//	"Create cause these errors: " + ERRORS)
//	adw_browse.SetRedraw(True)
//	RETURN -1
//END IF
//	
//
//adw_browse.of_SetTransObject( SQLCA )
//li_prac_row_cnt = adw_browse.Retrieve()
//
//
////adw_browse.Object.DataWindow.Detail.Height= 5000
////adw_browse.Modify("active_status.Initial='1'")
//
//FOR i = 1 TO li_row_cnt
//	IF ids_screen_fields.GetItemString(i, "visible") = "N" THEN
//		CONTINUE
//	END IF
//	//visible
////	IF ab_screen_painter THEN
////		IF ids_screen_fields.GetItemString(i, "") = "N" THEN
////			adw_browse.Modify(ls_dw_field_names[i] + ".color = '8421504'") 
////			adw_browse.Modify(ls_dw_field_names[i] + ".background.color = '12632256'") 
////			adw_browse.Modify(ls_dw_field_names[i] + "_t.color = '8421504'") 
////		ELSE
////			adw_browse.Modify(ls_dw_field_names[i] + ".color = '0'") 
////			adw_browse.Modify(ls_dw_field_names[i] + "_t.color = '0'")
////			adw_browse.Modify(ls_dw_field_names[i] + ".background.color = '16777215'") 		
////		END IF
////	END IF
//
////	IF ab_screen_painter THEN
//		adw_browse.Modify( ls_dw_field_names[i] + ".TabSequence = '0'" )
////		adw_browse.Modify( ls_dw_field_names[i] + ".dbname = '" + String( i * 10) + "'" )
////	ELSE
//		IF Len(ls_dw_field_names[i]) > 0 AND lb_first_field THEN
//			lb_first_field = False
//			is_first_column = ls_dw_field_names[i]
//		END IF
//		//adw_browse.Modify( ls_dw_field_names[i] + ".TabSequence = '" + String(i) + "'" )		
////	END IF
//	adw_browse.Modify( ls_dw_field_names[i] + ".TabSequence = '0'" )
//
//	adw_browse.Modify( ls_dw_field_names[i] + "_t.text = '" + ls_field_label[i] + "'")
//
//	//bold or not?
//	adw_browse.Modify( ls_dw_field_names[i] + "_t.font.weight = '" + ls_fld_lbl_font_wght + "'")	
//
//	adw_browse.Modify( ls_dw_field_names[i] + "_t.text = '" + ls_field_label[i] + "'")
//
//	li_fld_label_width = ids_screen_fields.GetItemNumber( i, "field_label_width" )
//	li_fld_width = ids_screen_fields.GetItemNumber( i, "field_width" ) 
//	//adw_browse.Modify( ls_dw_field_names[i] + ".width = '" + String( li_fld_width ) + "'" )	
//	//adw_browse.Modify( ls_dw_field_names[i] + "_t.width = '" + String( li_fld_label_width ) + "'" )
//	//adw_browse.Modify( ls_dw_field_names[i] + ".height = '" + String( ls_field_label_height[i] ) + "'" )
//
//	//IF li_fld_width < li_fld_label_width THEN
//	//	adw_browse.Modify( ls_dw_field_names[i] + ".width = '" + String( li_fld_label_width ) + "'" )
//	//ELSE
//	//	adw_browse.Modify( ls_dw_field_names[i] + ".width = '" + String( li_fld_width ) + "'" )
//	//END IF
//
//	
////	IF ls_field_x[i] = "0" THEN
////		adw_browse.Modify( ls_dw_field_names[i] + ".x = 750")
////		adw_browse.Modify( ls_dw_field_names[i] + ".y = " + String(i*100) )
////
////		adw_browse.Modify( ls_dw_field_names[i] + "_t.x = 100")
////		adw_browse.Modify( ls_dw_field_names[i] + "_t.y = " + String(i*100) )
////	ELSE
////		adw_browse.Modify( ls_dw_field_names[i] + ".x = " + ls_field_x[i] )
////		adw_browse.Modify( ls_dw_field_names[i] + ".y = " + ls_field_y[i] )
////
////		adw_browse.Modify( ls_dw_field_names[i] + "_t.x = " + ls_field_label_x[i] )
////		adw_browse.Modify( ls_dw_field_names[i] + "_t.y = " + ls_field_label_y[i] )		
////	END IF
////
////	//tag value set to field id
//	//adw_browse.Modify( ls_dw_field_names[i] + ".tag = '" + ls_field_id[i] + "'" )
//	//adw_browse.Modify( ls_dw_field_names[i] + "_t.tag = '" + ls_field_id[i] + "'" )
//
//	//alignment
//	//adw_browse.Modify( ls_dw_field_names[i] + ".alignment = '" + ids_screen_fields.GetItemString( i, "justification" ) + "'" )	
//	//adw_browse.Modify( ls_dw_field_names[i] + "_t.alignment = '" + String( ids_screen_fields.GetItemNumber( i, "field_label_justification" ) ) + "'" )	
//	//adw_browse.Modify( ls_dw_field_names[i] + ".alignment = '" + ids_screen_fields.GetItemString( i, "justification" ) + "'" )	
//	//adw_browse.Modify( ls_dw_field_names[i] + "_t.alignment = '" + String( ids_screen_fields.GetItemNumber( i, "field_label_justification" ) ) + "'" )	
//	
//	IF ls_dw_field_names[i] = "active_status" THEN
//		adw_browse.Modify( ls_dw_field_names[i] + ".dddw.VscrollBar = Yes")			
//		adw_browse.Modify( ls_dw_field_names[i] + ".dddw.useasborder = No")			
//		adw_browse.Modify( ls_dw_field_names[i] + ".dddw.NilIsNull= Yes")
//		adw_browse.Modify( ls_dw_field_names[i] + ".dddw.Lines= 15")
//		adw_browse.Modify( ls_dw_field_names[i] + "_t.font.underline = '1'")
//		adw_browse.Modify( ls_dw_field_names[i] + ".dddw.Required = Yes")
//		adw_browse.Modify( ls_dw_field_names[i] + ".dddw.name = 'd_code_lookup_active_inactive'")
//		adw_browse.Modify( ls_dw_field_names[i] + ".dddw.datacolumn = 'lookup_code'")			
//		adw_browse.Modify( ls_dw_field_names[i] + ".dddw.displaycolumn = 'description'")				
//	END IF
//	
//	IF ids_screen_fields.GetItemString( i, "lookup_field") = "Y" THEN
//		ls_lookup_code = ids_screen_fields.GetItemString( i, "lookup_code" )
//		ls_lookup_field = ids_screen_fields.GetItemString( i, "lookup_field_name" )
//		ls_lookup_type = ids_screen_fields.GetItemString( i, "lookup_type" )
//		adw_browse.Modify( ls_dw_field_names[i] + ".dddw.VscrollBar = Yes")			
//		adw_browse.Modify( ls_dw_field_names[i] + ".dddw.AutoHScroll = Yes")			
//		adw_browse.Modify( ls_dw_field_names[i] + ".dddw.useasborder = No")			
//		adw_browse.Modify(ls_dw_field_names[i] + ".dddw.NilIsNull= Yes")
//		adw_browse.Modify(ls_dw_field_names[i] + ".dddw.Lines= 15")
//		IF ids_screen_fields.GetItemString(i, "required") = "Y" THEN
//			adw_browse.Modify(ls_dw_field_names[i] + "_t.font.underline = '1'")
//			adw_browse.Modify(ls_dw_field_names[i] + ".dddw.Required = Yes")
//		END IF	
//		IF ls_lookup_type = "C" THEN
//			adw_browse.Modify( ls_dw_field_names[i] + ".dddw.name = 'd_dddw_code_lookup'")
//			adw_browse.Modify( ls_dw_field_names[i] + ".dddw.datacolumn = 'lookup_code'")			
//			IF Upper( ls_lookup_field ) = "CODE" THEN
//				adw_browse.Modify( ls_dw_field_names[i] + ".dddw.displaycolumn = 'code'")
//			ELSE
//				adw_browse.Modify( ls_dw_field_names[i] + ".dddw.displaycolumn = 'description'")								
//			END IF
//		ELSEIF ls_lookup_type = "A" THEN
//			adw_browse.Modify( ls_dw_field_names[i] + ".dddw.HscrollBar = Yes")			
//			adw_browse.Modify( ls_dw_field_names[i] + ".dddw.name = 'd_dddw_address_lookup'")						
//			adw_browse.Modify( ls_dw_field_names[i] + ".dddw.datacolumn = 'lookup_code'")			
//			IF Upper( ls_lookup_field ) = "CODE" THEN
//				adw_browse.Modify( ls_dw_field_names[i] + ".dddw.displaycolumn = 'code'")
//			ELSE
//				adw_browse.Modify( ls_dw_field_names[i] + ".dddw.displaycolumn = 'entity_name'")			
//			END IF
//		ELSEIF ls_lookup_type = "Q" THEN
//			adw_browse.Modify( ls_dw_field_names[i] + ".dddw.name = 'd_dddw_quest_lookup'")
//			adw_browse.Modify( ls_dw_field_names[i] + ".dddw.datacolumn = 'quest_id'")	
//			adw_browse.Modify( ls_dw_field_names[i] + ".dddw.displaycolumn = 'short_quest'")
//			//adw_browse.Modify( ls_dw_field_names[i] + ".dddw.useasborder = No")
//			//adw_browse.Modify( ls_dw_field_names[i] + ".dddw.vscrollbar = Yes")
//		END IF
//
//		
//		adw_browse.Modify( ls_dw_field_names[i] + ".dddw.VScrollBar = Yes")
//		adw_browse.Modify( ls_dw_field_names[i] + ".dddw.PercentWidth = '" + ls_dddw_width[i] + "'")
//		adw_browse.GetChild( ls_dw_field_names[i] , dwchild )
//		adw_browse.GetChild( ls_dw_field_names[i] , dwchild_browse )
//
//		//dwchild.SetTransObject( SQLCA ) //redundant removed maha 062005
//		//dwchild.Retrieve(ls_lookup_code)
//		//dwchild.InsertRow(1)
//		//dwchild.ShareData( dwchild_browse )
//	ELSEIF ls_dw_field_names[i] <> "active_status" THEN
//		adw_browse.Modify(ls_dw_field_names[i] + ".Edit.NilIsNull= Yes")
//		IF ids_screen_fields.GetItemString(i, "required") = "Y" THEN
//			adw_browse.Modify(ls_dw_field_names[i] + "_t.font.underline = '1'")			
//			adw_browse.Modify(ls_dw_field_names[i] + ".Edit.Required = Yes")
//		END IF	
//		IF ls_mask[i] <> "" THEN
//			adw_browse.Modify( ls_dw_field_names[i] + ".Edit.CodeTable = Yes")
//			adw_browse.Modify( ls_dw_field_names[i] + ".Edit.ValidateCode = Yes" )
//			adw_browse.Modify( ls_dw_field_names[i] + ".ValidationMsg = 'Invalid Month, Select a number from 1 and 12.'" )
//			//adw_browse.Modify( ls_dw_field_names[i] + ".EditMask.Mask='" + ls_mask[i] + "'")
//			IF ls_mask[i] = "##" THEN
//				FOR m = 1 TO 12
//					ls_month = String(m)
//					adw_browse.SetValue( ls_dw_field_names[i], m, ls_month + "~t" + ls_month )
//				END FOR
//				m1 = 0
//				FOR m = 13 TO 21
//					m1++
//					ls_month = "0" + String(m1)
//					adw_browse.SetValue( ls_dw_field_names[i], m, ls_month + "~t" + ls_month )
//				END FOR
//				adw_browse.Modify( ls_dw_field_names[i] + ".Edit.Limit = '2'" )			
//				
//			ELSEIF ls_mask[i] = "(###)###-####" THEN
//				adw_browse.Modify( ls_dw_field_names[i] + ".EditMask.Mask='(###)###-####'" )
//			ELSEIF ls_mask[i] = "###-##-####" THEN
//				adw_browse.Modify( ls_dw_field_names[i] + ".EditMask.Mask='###-##-####'")								
//			ELSEIF ls_mask[i] = "####" THEN
//				li_index = 0
//				FOR m = 1880 TO 2050
//					li_index++
//					adw_browse.SetValue( ls_dw_field_names[i], li_index, String(m) + "~t" + String(m) )
//				END FOR
//				adw_browse.Modify( ls_dw_field_names[i] + ".Edit.Limit = '4'" )			
//				adw_browse.Modify( ls_dw_field_names[i] + ".ValidationMsg = 'Invalid Year, Select a number between 1880 and 2050.'" )
//			ELSEIF ls_mask[i] = "mm/dd/yyyy" THEN
//				//adw_browse.Modify( ls_dw_field_names[i] + ".EditMask.Mask ='mm/dd/yyyy'")
//				adw_browse.Modify( ls_dw_field_names[i] + ".Format='mm/dd/yyyy'")
//				adw_browse.Modify( ls_dw_field_names[i] + ".Format='mm/dd/yyyy'")
//			ELSEIF ls_mask[i] = "#,##0.00" THEN
//				adw_browse.Modify( ls_dw_field_names[i] + ".Format='#,##0'")
//				adw_browse.Modify( ls_dw_field_names[i] + ".Format='#,##0'")
//			END IF
//		END IF	
//	END IF
//END FOR
//
//adw_browse.Modify( "rec_id.visible = '0'")
//adw_browse.Modify( "prac_id.visible = '0'")
//
//adw_browse.SetRedraw(True)
//
////adw_browse.Modify("create groupbox(band=detail text='End of Detail border='5' color='255' x='1' y='" + ls_detail_band_height + "' height='50' width='3000'  font.face='MS Sans Serif' font.height='-8' font.weight='400'  font.family='2' font.pitch='2' font.charset='0' background.mode='1' background.color='553648127' name=detail_band"  )
//
//
////CREATE ANY SCREEN OBJECTS THAT WERE ADDED
////FOR i = 1 TO li_obj_cnt
////	ls_obj_type = ids_screen_objects.GetItemString(i, "object_type") 
////	ls_obj_name = "object"+String( ids_screen_objects.GetItemNumber(i, "data_view_object_id") )
////	ls_width = String( ids_screen_objects.GetItemNumber(i, "object_width") )
////	ls_height = String( ids_screen_objects.GetItemNumber(i, "object_height") )
////	ls_x = String( ids_screen_objects.GetItemNumber(i, "object_x") )
////	ls_y = String( ids_screen_objects.GetItemNumber(i, "object_y") )
////	ls_text = ids_screen_objects.GetItemString(i, "object_text") 
////	ls_justification = String( ids_screen_objects.GetItemNumber(i, "object_alignment") )
////	CHOOSE CASE ls_obj_type
////		CASE "B"
////			adw_browse.Modify("create groupbox(band=detail text='" + ls_text + "' border='5' color='128' x='" + ls_x + "' y='" + ls_y + "' height='" + ls_height + "' width='" + ls_width + "'  font.face='MS Sans Serif' font.height='-8' font.weight='400'  font.family='2' font.pitch='2' font.charset='0' background.mode='1' background.color='553648127' name=" + ls_obj_name )
////		CASE "T"
////			adw_browse.Modify("create text(band=detail text='" + ls_text + "' border='0' color='128' x='" + ls_x + "' y='" + ls_y + "' height='" + ls_height + "' width='" + ls_width + "'  font.face='MS Sans Serif' font.height='-8' font.weight='400'  font.family='2' font.pitch='2' font.charset='0' background.mode='1' background.color='553648127' name=" + ls_obj_name + "_t" )
////	END CHOOSE
////END FOR
////
//
//IF li_prac_row_cnt > 0 THEN 
//	adw_browse.SetRow( 1 )
//	adw_browse.SelectRow( 1, True )
//	adw_browse.SetFocus()
//END IF
//
//
//
//RETURN 0
end function

public function integer of_create_dynamic_ds_old (long al_prac_id, integer ai_data_view_id, integer ai_screen_id, n_ds adw_detail);SetPointer(HourGlass!)

//This.of_Setup_Cache()
Integer li_sort_data_cnt
Integer m1
Integer li_dddw_code_cnt
Integer li_dddw_address_cnt
Integer li_row_cnt
Integer m
Integer li_index
Integer li_obj_cnt
Integer i
Integer li_key_cnt
Integer li_prac_row_cnt
Integer t
Integer li_col_cnt
Integer li_fld_label_width
Integer li_fld_width
Integer li_table_cnt
Boolean lb_table_found
Boolean lb_multi_tablE
Boolean lb_first_field = True
Boolean lb_has_active_status = False
String ls_sort_syntax
String ls_month
String ls_fld_lbl_font_wght
String ls_detail_band_height
String ls_dummy_array[]
String ls_width
String ls_dddw_width[]
String ls_height
String ls_x
String ls_y
String ls_justification
String ls_text
String ls_obj_type
String ls_obj_name
String ls_field_x[] 
String ls_visible
String ls_field_y[]
String ls_field_label_x[]
String ls_field_label_height[]
String ls_field_label_y[] 
String ls_field_label[]
String ls_field_id[]
String ls_mask[]
String ls_table_names[]
String ls_field_names[]
String ls_table_field_names[]
String ls_dw_field_names[]
String ls_key_fields_col_nm[]
String ls_temp_table
String ls_table_name
String ls_field_name
String ls_sql_syntax
String ls_grey
String ls_white
String ls_presentation_str
String ls_dwsyntax_str
String ERRORS
String ls_lookup_code
String ls_lookup_type
String ls_lookup_field
String ls_key_fields_syntax
String ls_key_fields[]
Long ll_detail_height
DataWindowChild dwchild

is_column_default[] = ls_dummy_array[]
is_column_names[] = ls_dummy_array[]


IF gnv_app.of_get_field_object_cache()  THEN
	ids_screen_fields.SetFilter( "data_view_id = " + String( ai_data_view_id ) +&
								     " AND screen_id = " + String( ai_screen_id ) )
	ids_screen_fields.Filter()
	li_row_cnt = ids_screen_fields.RowCount()


	ids_screen_objects.SetFilter( "data_view_id = " + String( ai_data_view_id ) +&
									     " AND screen_id = " + String( ai_screen_id ) )
	ids_screen_objects.Filter()								
	li_obj_cnt = ids_screen_objects.RowCount()
ELSE
	ids_screen_fields.DataObject = "d_screen_fields"
	ids_screen_fields.of_SetTransObject( SQLCA )
	li_row_cnt = ids_screen_fields.Retrieve( ai_data_view_id, ai_screen_id )

	ids_screen_objects.DataObject = "d_screen_objects"
	ids_screen_objects.of_SetTransObject( SQLCA )
	li_obj_cnt = ids_screen_objects.Retrieve( ai_data_view_id, ai_screen_id )
END IF


ii_column_cnt = 0

ls_sql_syntax = "SELECT "
li_table_cnt = 0

//adw_detail.SetRedraw(False)

//BUILD SELECT 
FOR i = 1 TO li_row_cnt
	IF ids_screen_fields.GetItemString(i, "visible") = "N" THEN
		CONTINUE
	END IF
	ii_column_cnt++
	ls_table_name = Trim( ids_screen_fields.GetItemString( i, "db_table_name" ))
	is_table_name = ls_table_name
	ls_field_name = Trim( ids_screen_fields.GetItemString( i, "db_field_name" ))
	is_column_names[ii_column_cnt] = ls_field_name	
	is_column_default[ii_column_cnt] = ids_screen_fields.GetItemString( i, "default_value" )
	ls_mask[i] = ids_screen_fields.GetItemString( i, "field_mask" ) 
	ls_field_names[i] = ls_field_name
	ls_field_id[i] = String (ids_screen_fields.GetItemNumber( i, "field_id" ) )
	ls_field_x[i] = String (ids_screen_fields.GetItemNumber( i, "field_x" ) )
	ls_field_y[i] = String (ids_screen_fields.GetItemNumber( i, "field_y" ) )
	ls_field_label_height[i] = String (ids_screen_fields.GetItemNumber( i, "field_height" ) )
	ls_dddw_width[i] = String(ids_screen_fields.GetItemNumber(i, "drop_down_width"))
	ls_field_label_x[i] = String (ids_screen_fields.GetItemNumber( i, "field_label_x" ) )
	ls_field_label_y[i] = String (ids_screen_fields.GetItemNumber( i, "field_label_y" ) )	
	ls_table_field_names[i] = Mid( ls_table_name,5,100 ) + "_" + ls_field_name
	ls_field_label[i] = ids_screen_fields.GetItemString( i, "field_label" )
	ls_sql_syntax = ls_sql_syntax + ls_table_name + "." + ls_field_name + ", "
	ls_fld_lbl_font_wght = String (ids_screen_fields.GetItemNumber( i, "data_view_fields_font_wieght" ) )	
	lb_table_found = False
	FOR t = 1 TO li_table_cnt
		IF ls_table_names[t] = ls_table_name THEN
			lb_table_found = True
		   EXIT
		END IF
	END FOR
	IF NOT lb_table_found THEN
		li_table_cnt ++
		ls_table_names[ li_table_cnt ] = ls_table_name
	END IF
END FOR
ls_sql_syntax = Left( ls_sql_syntax, Len(ls_sql_syntax) -2 )

li_row_cnt = UpperBound(ls_field_names)

//ADD KEY FIELDS TO SELECT
li_key_cnt = 0
FOR i = 1 TO li_table_cnt
	ls_key_fields_syntax = ls_key_fields_syntax + ls_table_names[ i ] + ".prac_id, "
	li_key_cnt ++
	ls_key_fields[li_key_cnt] = ls_table_names[i] + ".prac_id"
	IF li_table_cnt > 1 THEN
		ls_key_fields_col_nm[li_key_cnt] = Mid(ls_table_names[ i ], 5, 100)  + "_prac_id"
	ELSE
		ls_key_fields_col_nm[li_key_cnt] = "prac_id"
	END IF

	li_key_cnt ++
	ls_key_fields_syntax = ls_key_fields_syntax + ls_table_names[ i ] + ".rec_id, "
	ls_key_fields[li_key_cnt] = ls_table_names[i] + ".rec_id"
	IF li_table_cnt > 1 THEN
		ls_key_fields_col_nm[li_key_cnt] = Mid(ls_table_names[ i ], 5, 100)  + "_rec_id"
		is_rec_id_col_nm = Mid(ls_table_names[ i ], 5, 100)  + "_rec_id"
	ELSE
		ls_key_fields_col_nm[li_key_cnt] = "rec_id"
		is_rec_id_col_nm = Mid(ls_table_names[ i ], 5, 100)  + "_rec_id"
	END IF
END FOR

ls_sql_syntax = Mid( ls_sql_syntax, 1, 7 ) + ls_key_fields_syntax + Mid(ls_sql_syntax, 8, 10000)

//ASSIGN DW FIELD NAMES
IF li_table_cnt > 1 THEN
	lb_multi_table = True
	FOR i = 1 TO li_row_cnt
		ls_dw_field_names[i] = ls_table_field_names[i]
	END FOR	
ELSE
	lb_multi_table = False
	FOR i = 1 TO li_row_cnt
		ls_dw_field_names[i] = ls_field_names[i]
	END FOR
END IF

//BUILD FROM CLAUSE
ls_sql_syntax = ls_sql_syntax + " FROM "
FOR i = 1 TO li_table_cnt
	ls_sql_syntax = ls_sql_syntax + ls_table_names[i] + ", "
END FOR
ls_sql_syntax = Left( ls_sql_syntax, Len(ls_sql_syntax) -2 )

//ADD WHERE CLAUSE
ls_sql_syntax = ls_sql_syntax + " WHERE " + ls_table_names[1] + ".prac_id  = " + String( al_prac_id )

//CREATE SORT ORDER
ids_screen_fields.SetSort( "field_sort A" )
ids_screen_fields.Sort()
ls_sort_syntax = " ORDER BY "
FOR i = 1 TO li_row_cnt
	IF ids_screen_fields.GetItemNumber( i, "sort_field" ) > 0 THEN
		IF ids_screen_fields.GetItemString( i, "sort_order" ) = "D" THEN
			ls_sort_syntax = ls_sort_syntax + ids_screen_fields.GetItemString( i, "db_field_name" ) + " DESC,"			
		ELSE
			ls_sort_syntax = ls_sort_syntax + ids_screen_fields.GetItemString( i, "db_field_name" ) + " ASC,"			
		END IF
		li_sort_data_cnt ++
	END IF
END FOR
//ADD GROUP BY CLAUSE
IF li_sort_data_cnt > 0 THEN
	ls_sort_syntax = Mid( ls_sort_syntax, 1, Len( ls_sort_syntax )-1 )
	ls_sql_syntax = ls_sql_syntax + ls_sort_syntax
END IF
ids_screen_fields.SetSort( "field_order A" )
ids_screen_fields.Sort()

//CREATE SYNTAX FOR DETAIL DW
ls_grey = String(rgb(192,192,192))
ls_presentation_str = "style(type=form)" + " Column(Border=5 ) Datawindow(Color=" + ls_grey + " )" + "Text(Background.Color=" + ls_grey + ")"  

ls_dwsyntax_str = SQLCA.SyntaxFromSQL(ls_sql_syntax, &
	ls_presentation_str, ERRORS)

IF Len(ERRORS) > 0 THEN
	MessageBox("Caution", &
	"SyntaxFromSQL caused these errors: " + ERRORS)
	RETURN -1
END IF

adw_detail.Create( ls_dwsyntax_str, ERRORS)

IF Len(ERRORS) > 0 THEN
	MessageBox("Caution", &
	"Create cause these errors: " + ERRORS)
	RETURN -1
END IF



adw_detail.of_SetTransObject( SQLCA )
li_prac_row_cnt = adw_detail.Retrieve()

IF li_prac_row_cnt = 0 THEN 
	adw_detail.InsertRow(0)
	adw_detail.SetItemStatus( 1, 0, Primary!, NotModified! )
END IF


IF	lb_multi_table THEN
	//adw_detail.of_SetMultiTable(TRUE)
	//FOR i = 1 TO li_table_cnt
		//adw_detail.inv_multitable.of_Register( ls_table_names[I], ls_table_2_fields, ls_table_2_update_fields, TRUE, 0)
	//END FOR
ELSE
	adw_detail.Object.DataWindow.Table.UpdateTable= ls_table_names[1]
	adw_detail.Object.DataWindow.Table.UpdateWhere= '0'
	adw_detail.Object.DataWindow.Table.UpdateKeyinPlace = 'Yes'
	FOR i = 1 TO li_row_cnt
		adw_detail.Modify( ls_dw_field_names[i] + ".Update= Yes")	
		IF Pos( ls_dw_field_names[i], "prac_id" ) > 0  OR Pos( ls_dw_field_names[i], "rec_id" ) > 0 THEN
			adw_detail.Modify( ls_dw_field_names[i] + ".Key=Yes")
		END IF
	END FOR
END IF

adw_detail.Object.DataWindow.Detail.Height= 5000
adw_detail.Modify("active_status.Initial='1'")

FOR i = 1 TO li_row_cnt
	
	//visible
	IF ids_screen_fields.GetItemString(i, "visible") = "N" THEN
		adw_detail.Modify(ls_dw_field_names[i] + ".color = '8421504'") 
		adw_detail.Modify(ls_dw_field_names[i] + ".background.color = '12632256'") 
		adw_detail.Modify(ls_dw_field_names[i] + "_t.color = '8421504'") 
	ELSE
		adw_detail.Modify(ls_dw_field_names[i] + ".color = '0'") 
		adw_detail.Modify(ls_dw_field_names[i] + "_t.color = '0'")
		adw_detail.Modify(ls_dw_field_names[i] + ".background.color = '16777215'") 		
	END IF


	IF Len(ls_dw_field_names[i]) > 0 AND lb_first_field THEN
		lb_first_field = False
		is_first_column = ls_dw_field_names[i]
	END IF
	adw_detail.Modify( ls_dw_field_names[i] + ".TabSequence = '" + String(i) + "'" )		


	adw_detail.Modify( ls_dw_field_names[i] + "_t.text = '" + ls_field_label[i] + "'")

	//bold or not?
	adw_detail.Modify( ls_dw_field_names[i] + "_t.font.weight = '" + ls_fld_lbl_font_wght + "'")	


	li_fld_label_width = ids_screen_fields.GetItemNumber( i, "field_label_width" )
	li_fld_width = ids_screen_fields.GetItemNumber( i, "field_width" ) 
	adw_detail.Modify( ls_dw_field_names[i] + ".width = '" + String( li_fld_width ) + "'" )	
	adw_detail.Modify( ls_dw_field_names[i] + "_t.width = '" + String( li_fld_label_width ) + "'" )
	adw_detail.Modify( ls_dw_field_names[i] + ".height = '" + String( ls_field_label_height[i] ) + "'" )

	
	IF ls_field_x[i] = "0" THEN
		adw_detail.Modify( ls_dw_field_names[i] + ".x = 750")
		adw_detail.Modify( ls_dw_field_names[i] + ".y = " + String(i*100) )

		adw_detail.Modify( ls_dw_field_names[i] + "_t.x = 100")
		adw_detail.Modify( ls_dw_field_names[i] + "_t.y = " + String(i*100) )
	ELSE
		adw_detail.Modify( ls_dw_field_names[i] + ".x = " + ls_field_x[i] )
		adw_detail.Modify( ls_dw_field_names[i] + ".y = " + ls_field_y[i] )

		adw_detail.Modify( ls_dw_field_names[i] + "_t.x = " + ls_field_label_x[i] )
		adw_detail.Modify( ls_dw_field_names[i] + "_t.y = " + ls_field_label_y[i] )		
	END IF

	//tag value set to field id
	adw_detail.Modify( ls_dw_field_names[i] + ".tag = '" + ls_field_id[i] + "'" )
	adw_detail.Modify( ls_dw_field_names[i] + "_t.tag = '" + ls_field_id[i] + "'" )

	//alignment
	adw_detail.Modify( ls_dw_field_names[i] + ".alignment = '" + ids_screen_fields.GetItemString( i, "justification" ) + "'" )	
	adw_detail.Modify( ls_dw_field_names[i] + "_t.alignment = '" + String( ids_screen_fields.GetItemNumber( i, "field_label_justification" ) ) + "'" )	

	IF ls_dw_field_names[i] = "active_status" THEN
		adw_detail.Modify( ls_dw_field_names[i] + ".dddw.VscrollBar = Yes")			
		adw_detail.Modify( ls_dw_field_names[i] + ".dddw.useasborder = Yes")			
		adw_detail.Modify( ls_dw_field_names[i] + ".dddw.NilIsNull= Yes")
		adw_detail.Modify( ls_dw_field_names[i] + ".dddw.Lines= 15")
		adw_detail.Modify( ls_dw_field_names[i] + "_t.font.underline = '1'")
		adw_detail.Modify( ls_dw_field_names[i] + ".dddw.Required = Yes")
		adw_detail.Modify( ls_dw_field_names[i] + ".dddw.name = 'd_code_lookup_active_inactive'")
		adw_detail.Modify( ls_dw_field_names[i] + ".dddw.datacolumn = 'lookup_code'")			
		adw_detail.Modify( ls_dw_field_names[i] + ".dddw.displaycolumn = 'description'")				
	END IF
	
	IF ids_screen_fields.GetItemString( i, "lookup_field") = "Y" THEN
		ls_lookup_code = ids_screen_fields.GetItemString( i, "lookup_code" )
		ls_lookup_field = ids_screen_fields.GetItemString( i, "lookup_field_name" )
		ls_lookup_type = ids_screen_fields.GetItemString( i, "lookup_type" )
		adw_detail.Modify( ls_dw_field_names[i] + ".dddw.VscrollBar = Yes")			
		adw_detail.Modify( ls_dw_field_names[i] + ".dddw.AutoHScroll = Yes")			
		adw_detail.Modify( ls_dw_field_names[i] + ".dddw.useasborder = Yes")			
		adw_detail.Modify(ls_dw_field_names[i] + ".dddw.NilIsNull= Yes")
		adw_detail.Modify(ls_dw_field_names[i] + ".dddw.Lines= 15")
		IF ids_screen_fields.GetItemString(i, "required") = "Y" THEN
			adw_detail.Modify(ls_dw_field_names[i] + "_t.font.underline = '1'")
			adw_detail.Modify(ls_dw_field_names[i] + ".dddw.Required = Yes")
		END IF	
		IF ls_lookup_type = "C" THEN
			adw_detail.Modify( ls_dw_field_names[i] + ".dddw.name = 'd_dddw_code_lookup'")
			adw_detail.Modify( ls_dw_field_names[i] + ".dddw.datacolumn = 'lookup_code'")			
			IF Upper( ls_lookup_field ) = "CODE" THEN
				adw_detail.Modify( ls_dw_field_names[i] + ".dddw.displaycolumn = 'code'")
			ELSE
				adw_detail.Modify( ls_dw_field_names[i] + ".dddw.displaycolumn = 'description'")				
			END IF
		ELSEIF ls_lookup_type = "A" THEN
			adw_detail.Modify( ls_dw_field_names[i] + ".dddw.HscrollBar = Yes")			
			adw_detail.Modify( ls_dw_field_names[i] + ".dddw.name = 'd_dddw_address_lookup'")
			adw_detail.Modify( ls_dw_field_names[i] + ".dddw.datacolumn = 'lookup_code'")			
			IF Upper( ls_lookup_field ) = "CODE" THEN
				adw_detail.Modify( ls_dw_field_names[i] + ".dddw.displaycolumn = 'code'")
			ELSE
				adw_detail.Modify( ls_dw_field_names[i] + ".dddw.displaycolumn = 'entity_name'")			
			END IF
		END IF
		
		//adw_detail.Modify( ls_dw_field_names[i] + ".dddw.AllowEdit = Yes")
		adw_detail.Modify( ls_dw_field_names[i] + ".dddw.VScrollBar = Yes")
		//adw_detail.Modify( ls_dw_field_names[i] + ".dddw.HScrollBar = Yes")
		adw_detail.Modify( ls_dw_field_names[i] + ".dddw.PercentWidth = '" + ls_dddw_width[i] + "'")
		adw_detail.GetChild( ls_dw_field_names[i] , dwchild )

		dwchild.SetTransObject( SQLCA )
		dwchild.Retrieve(ls_lookup_code)
		dwchild.InsertRow(1)
	ELSEIF ls_dw_field_names[i] <> "active_status" THEN
		adw_detail.Modify(ls_dw_field_names[i] + ".Edit.NilIsNull= Yes")
		IF ids_screen_fields.GetItemString(i, "required") = "Y" THEN
			adw_detail.Modify(ls_dw_field_names[i] + "_t.font.underline = '1'")			
			adw_detail.Modify(ls_dw_field_names[i] + ".Edit.Required = Yes")
		END IF	
		IF ls_mask[i] <> "" THEN
			adw_detail.Modify( ls_dw_field_names[i] + ".Edit.CodeTable = Yes")
			adw_detail.Modify( ls_dw_field_names[i] + ".Edit.ValidateCode = Yes" )
			adw_detail.Modify( ls_dw_field_names[i] + ".ValidationMsg = 'Invalid Month, Select a number from 1 and 12.'" )
			//adw_detail.Modify( ls_dw_field_names[i] + ".EditMask.Mask='" + ls_mask[i] + "'")
			IF ls_mask[i] = "##" THEN
				FOR m = 1 TO 12
					ls_month = String(m)
					adw_detail.SetValue( ls_dw_field_names[i], m, ls_month + "~t" + ls_month )
				END FOR
				m1 = 0
				FOR m = 13 TO 21
					m1++
					ls_month = "0" + String(m1)
					adw_detail.SetValue( ls_dw_field_names[i], m, ls_month + "~t" + ls_month )
				END FOR
				adw_detail.Modify( ls_dw_field_names[i] + ".Edit.Limit = '2'" )			
				
			ELSEIF ls_mask[i] = "(###)###-####" THEN
				//adw_detail.Modify( ls_dw_field_names[i] + ".EditMask.Mask='(###)###-####'" )	//Comment by Scofield on 2008-08-12
			ELSEIF ls_mask[i] = "###-##-####" THEN
				adw_detail.Modify( ls_dw_field_names[i] + ".EditMask.Mask='###-##-####'")								
			ELSEIF ls_mask[i] = "####" THEN
				li_index = 0
				FOR m = 1880 TO 2050
					li_index++
					adw_detail.SetValue( ls_dw_field_names[i], li_index, String(m) + "~t" + String(m) )
				END FOR
				adw_detail.Modify( ls_dw_field_names[i] + ".Edit.Limit = '4'" )			
				adw_detail.Modify( ls_dw_field_names[i] + ".ValidationMsg = 'Invalid Year, Select a number between 1880 and 2050.'" )
			ELSEIF ls_mask[i] = "mm/dd/yyyy" THEN
				//adw_detail.Modify( ls_dw_field_names[i] + ".EditMask.Mask ='mm/dd/yyyy'")
				adw_detail.Modify( ls_dw_field_names[i] + ".Format='mm/dd/yyyy'")
			ELSEIF ls_mask[i] = "#,##0.00" THEN
				adw_detail.Modify( ls_dw_field_names[i] + ".Format='#,##0'")
			END IF
		END IF	
	END IF
END FOR


FOR i = 1 TO li_key_cnt
	adw_detail.Modify( ls_key_fields_col_nm[i] + ".visible = '0'")
	adw_detail.Modify( ls_key_fields_col_nm[i] + "_t.visible = '0'")
END FOR

ls_detail_band_height = String(Integer(adw_detail.Object.DataWindow.Detail.Height) - 200)

//adw_detail.SetRedraw(True)

adw_detail.Modify("create groupbox(band=detail text='End of Detail border='5' color='255' x='1' y='" + ls_detail_band_height + "' height='50' width='3000'  font.face='MS Sans Serif' font.height='-8' font.weight='400'  font.family='2' font.pitch='2' font.charset='0' background.mode='1' background.color='553648127' name=detail_band)"  )


//CREATE ANY SCREEN OBJECTS THAT WERE ADDED
FOR i = 1 TO li_obj_cnt
	ls_obj_type = ids_screen_objects.GetItemString(i, "object_type") 
	ls_obj_name = "object"+String( ids_screen_objects.GetItemNumber(i, "data_view_object_id") )
	ls_width = String( ids_screen_objects.GetItemNumber(i, "object_width") )
	ls_height = String( ids_screen_objects.GetItemNumber(i, "object_height") )
	ls_x = String( ids_screen_objects.GetItemNumber(i, "object_x") )
	ls_y = String( ids_screen_objects.GetItemNumber(i, "object_y") )
	ls_text = ids_screen_objects.GetItemString(i, "object_text") 
	ls_justification = String( ids_screen_objects.GetItemNumber(i, "object_alignment") )
	CHOOSE CASE ls_obj_type
		CASE "B"
			adw_detail.Modify("create groupbox(band=detail text='" + ls_text + "' border='5' color='128' x='" + ls_x + "' y='" + ls_y + "' height='" + ls_height + "' width='" + ls_width + "'  font.face='MS Sans Serif' font.height='-8' font.weight='400'  font.family='2' font.pitch='2' font.charset='0' background.mode='1' background.color='553648127' name=" + ls_obj_name +")")
		CASE "T"
			adw_detail.Modify("create text(band=detail text='" + ls_text + "' border='0' color='128' x='" + ls_x + "' y='" + ls_y + "' height='" + ls_height + "' width='" + ls_width + "'  font.face='MS Sans Serif' font.height='-8' font.weight='400'  font.family='2' font.pitch='2' font.charset='0' background.mode='1' background.color='553648127' name=" + ls_obj_name + "_t)" )
	END CHOOSE
END FOR

IF ls_table_name = "pd_address" THEN
	adw_detail.Modify("create button(band=detail text='Address Links...' filename=''action='0' border='1' color='128' x='1875' y='300' height='104' width='475' vtextalign='0' htextalign='0'  font.face='MS Sans Serif' font.height='-8' font.weight='700'  font.family='2' font.pitch='2' font.charset='0' background.mode='2' background.color='12632256' name = linkbutton)")
END IF


//This.SetRedraw(True)
//Messagebox('', ls_dw_field_names[1])
//adw_detail.SetColumn( ls_dw_field_names[1] )

RETURN 0
end function

public function string of_create_dynamic_dw (long al_prac_id, integer ai_data_view_id, integer ai_screen_id, u_dw adw_detail, u_dw adw_browse, boolean ab_screen_painter, integer ai_facility_id);SetPointer(HourGlass!)
Integer li_facility_specific
Integer li_sort_data_cnt
Integer m1
Integer li_dddw_code_cnt
Integer li_dddw_address_cnt
Integer li_row_cnt
Integer m
integer res //maha110602
Integer li_index
Integer li_obj_cnt
Integer i
Integer li_key_cnt
Integer li_prac_row_cnt
Integer t
Integer li_col_cnt
Integer li_fld_label_width
Integer li_fld_width
Integer li_table_cnt
integer li_set //maha030702
integer li_uls //maha082305
long ll_max_height
Boolean ib_create_browse 
Boolean lb_table_found
Boolean lb_multi_tablE
Boolean lb_first_field = True
Boolean lb_has_active_status = False
String ls_retval
String ls_sort_syntax
String ls_month
String ls_fld_lbl_font_wght
String ls_detail_band_height
String ls_dummy_array[]
String ls_width
String ls_return_syntax
String ls_dddw_width[]
String ls_height
String ls_x
String ls_y
String ls_justification
String ls_text
String ls_obj_type
String ls_obj_name
String ls_field_x[] 
String ls_visible
String ls_field_y[]
String ls_field_label_x[]
String ls_field_label_height[]
String ls_field_label_y[] 
String ls_field_label[]
String ls_field_id[]
String ls_mask[]
String ls_table_names[]
String ls_field_names[]
String ls_table_field_names[]
String ls_dw_field_names[]
String ls_key_fields_col_nm[]
String ls_temp_table
String ls_table_name
String ls_field_name
String ls_sql_syntax
String ls_grey
String ls_white
String ls_presentation_str
String ls_dwsyntax_str
String ERRORS
String ls_lookup_code
String ls_lookup_type
String ls_lookup_field
String ls_key_fields_syntax
String ls_key_fields[]
string des
string ls_color
Long ll_detail_height
string widt
DataWindowChild dwchild
DataWindowChild dwchild_browse
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-31
//$<add> 01.13.2006 By: Luke
//$<reason> Performance tuing
//$<modification> Define variables to be used in subsequent script.
long set1 , ll_recreate
String ls_Bold, ls_italic
//---------------------------- APPEON END ----------------------------

if isnull(ai_screen_id) or ai_screen_id < 0  then return "-1"	//12.12.2008 By Jervis WorkFlow = -10


//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-32
//$<add> 03.13.2006 By: Cao YongWang
//$<reason> Performance tuning
//$<modification> Add a condition to make sure that: 1) DataWindow syntax will be stored in SRD files
//$<modification> in local machine; 2) the application directly gets the DataWindow syntax from local
//$<modification> machine instead of from the database when the same DataWindow is needed for a second time.

If appeongetclienttype() <> 'PB' Then
	ll_recreate = of_create_option(ai_data_view_id,ai_screen_id,'Y','D',string(idt_screen_cache),ab_screen_painter)
	If ll_recreate = 0 Then
		ls_return_syntax = of_create_dynamic_dw_local(al_prac_id,ai_data_view_id,ai_screen_id,adw_detail,adw_browse,ab_screen_painter,ai_facility_id)
		If ls_return_syntax <> "-1" Then return ls_return_syntax
	End If
End If
//---------------------------- APPEON END ----------------------------

//debugbreak()

//li_row_cnt is all the screen's fields
//upperbound- ls_dw_field_names[] is all visible fields only
ib_create_browse = True

IF adw_detail = adw_browse THEN
	ib_create_browse = False
END IF

is_column_default[] = ls_dummy_array[]
is_column_names[] = ls_dummy_array[]

//UNREGISTER ALL CALENDAR FIELDS
IF NOT ab_screen_painter THEN
	adw_detail.iuo_calendar.of_UnRegister()		
END IF

	app_filler.ids_screen_fields_cache.ShareData( ids_screen_fields )
//messagebox("", "view_id = " + String (ai_data_view_id) + " AND screen_id = " + String( ai_screen_id ) )
	ids_screen_fields.SetFilter( "view_id = " + String (ai_data_view_id) + " AND screen_id = " + String( ai_screen_id ) )
	ids_screen_fields.Filter( )	
	li_row_cnt = ids_screen_fields.RowCount()	

	app_filler.ids_screen_objects_cache.ShareData( ids_screen_objects )
	ids_screen_objects.SetFilter( "view_id = " + String (ai_data_view_id) + " AND screen_id = " + String( ai_screen_id ) )
	ids_screen_objects.Filter( )
	li_obj_cnt = ids_screen_objects.RowCount()
	
	ids_screen_fields.SetSort( "field_order A" )
	ids_screen_fields.sort( ) //should be by field_order maha 051905 ######

ii_column_cnt = 0

ls_sql_syntax = "SELECT "
li_table_cnt = 0

adw_detail.SetRedraw(False)

//CREATE SORT ORDER
integer wer  //#####
wer = ids_screen_fields.SetSort( "sort_field A" ) //maha corrected 051005
ids_screen_fields.Sort()
ls_sort_syntax = " ORDER BY "
FOR i = 1 TO li_row_cnt
	IF ids_screen_fields.GetItemNumber( i, "sort_field" ) > 0 THEN
		IF ids_screen_fields.GetItemString( i, "sort_order" ) = "D" THEN
			ls_sort_syntax = ls_sort_syntax + ids_screen_fields.GetItemString( i, "db_field_name" ) + " DESC,"			
		ELSE
			ls_sort_syntax = ls_sort_syntax + ids_screen_fields.GetItemString( i, "db_field_name" ) + " ASC,"			
		END IF
		li_sort_data_cnt ++
	END IF
END FOR
//ADD order BY CLAUSE
//IF li_sort_data_cnt > 0 THEN
//	ls_sort_syntax = Mid( ls_sort_syntax, 1, Len( ls_sort_syntax )-1 )
//	ls_sql_syntax = ls_sql_syntax + ls_sort_syntax
//else
//	ls_sql_syntax = ls_sql_syntax + " ORDER BY rec_id" //maha 111604
//END IF
wer = ids_screen_fields.SetSort( "field_order A" )
//messagebox("field_order",wer)
//ids_screen_fields.SetSort( "field_sort A" )
ids_screen_fields.Sort()

//BUILD SELECT 
FOR i = 1 TO li_row_cnt
	IF ( NOT ab_screen_painter AND ids_screen_fields.GetItemString(i, "visible") = "N" ) THEN
		CONTINUE //for visible =N do not add to the DE screen dw
	END IF
	ii_column_cnt++
	ls_table_name = Trim( ids_screen_fields.GetItemString( i, "db_table_name" ))
	ls_field_name = Trim( ids_screen_fields.GetItemString( i, "db_field_name" ))
	is_table_name = ls_table_name
	is_column_names[ii_column_cnt] = ls_field_name	
	is_column_default[ii_column_cnt] = ids_screen_fields.GetItemString( i, "default_value" )
	ls_mask[i] = ids_screen_fields.GetItemString( i, "field_mask" ) 
	ls_field_names[i] = ls_field_name
	ls_field_id[i] = String (ids_screen_fields.GetItemNumber( i, "field_id" ) )
	ls_field_x[i] = String (ids_screen_fields.GetItemNumber( i, "field_x" ) )
	ls_field_y[i] = String (ids_screen_fields.GetItemNumber( i, "field_y" ) )
	ls_field_label_height[i] = String (ids_screen_fields.GetItemNumber( i, "field_height" ) )
	if long(ls_field_y[i]) + long(ls_field_label_height[i]) > ll_max_height then ll_max_height = long(ls_field_y[i]) + long(ls_field_label_height[i])  //maha 051205
	//if i < 2 then messagebox(ls_field_names[i],ls_field_label_height[i])
	ls_dddw_width[i] = String(ids_screen_fields.GetItemNumber(i, "drop_down_width"))
	ls_field_label_x[i] = String (ids_screen_fields.GetItemNumber( i, "field_label_x" ) )
	ls_field_label_y[i] = String (ids_screen_fields.GetItemNumber( i, "field_label_y" ) )	
	ls_table_field_names[i] = Mid( ls_table_name,5,100 ) + "_" + ls_field_name
	ls_field_label[i] = ids_screen_fields.GetItemString( i, "field_label" )
	ls_sql_syntax = ls_sql_syntax + ls_table_name + "." + ls_field_name + ", "
	ls_fld_lbl_font_wght = String (ids_screen_fields.GetItemNumber( i, "data_view_fields_font_wieght" ) )	
	lb_table_found = False
	FOR t = 1 TO li_table_cnt
		IF ls_table_names[t] = ls_table_name THEN
			lb_table_found = True
		   EXIT
		END IF
	END FOR
	IF NOT lb_table_found THEN
		li_table_cnt ++
		ls_table_names[ li_table_cnt ] = ls_table_name
	END IF
END FOR

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 03/15/2007 By: Jervis
//$<reason> Fix a defect
if li_table_cnt = 0 then
	Messagebox("Caution","Failed to create SELECT syntax for datawindow. ")
	return '-1'
end if
//---------------------------- APPEON END ----------------------------

ls_sql_syntax = Left( ls_sql_syntax, Len(ls_sql_syntax) -2 )

li_row_cnt = UpperBound(ls_field_names)

  
//ADD KEY FIELDS TO SELECT
li_key_cnt = 0
FOR i = 1 TO li_table_cnt
//li_test = pos(ls_sql_syntax,"prac_id",1)
	//messagebox("pos",li_test)
	if pos(ls_sql_syntax,"prac_id",1) = 0 then //maha 051503 for lehigh to allow making prac_id visible
		ls_key_fields_syntax = ls_key_fields_syntax + ls_table_names[ i ] + ".prac_id, "
		li_key_cnt ++
		ls_key_fields[li_key_cnt] = ls_table_names[i] + ".prac_id"
		IF li_table_cnt > 1 THEN
			ls_key_fields_col_nm[li_key_cnt] = Mid(ls_table_names[ i ], 5, 100)  + "_prac_id"
			//--------------------------- APPEON BEGIN ---------------------------
			//$<add> 03/16/2007 By: Jervis
			//$<reason> Fixed a defect
			ls_table_field_names[upperbound(ls_table_field_names) + 1] = ls_key_fields_col_nm[li_key_cnt]
			//---------------------------- APPEON END ----------------------------
		ELSE
			ls_key_fields_col_nm[li_key_cnt] = "prac_id"
			//--------------------------- APPEON BEGIN ---------------------------
			//$<add> 03/16/2007 By: Jervis
			//$<reason> Fixed a defect
			ls_field_names[upperbound(ls_field_names) + 1] = "prac_id"
			//---------------------------- APPEON END ----------------------------

		END IF
	end if
	
	//--------------------------- APPEON BEGIN ---------------------------
	//$<modify> 03/16/2007 By: Jervis
	//$<reason> Fixed a defect
	/*
	li_key_cnt ++
	if pos(ls_sql_syntax,"rec_id",1) = 0 then  //maha 051503 to allow making prac_id visible
	*/
	if pos(ls_sql_syntax,"rec_id",1) = 0 then  //maha 051503 to allow making prac_id visible
		li_key_cnt ++
	//---------------------------- APPEON END ----------------------------
		ls_key_fields_syntax = ls_key_fields_syntax + ls_table_names[ i ] + ".rec_id, "
		ls_key_fields[li_key_cnt] = ls_table_names[i] + ".rec_id"
		IF li_table_cnt > 1 THEN
			ls_key_fields_col_nm[li_key_cnt] = Mid(ls_table_names[ i ], 5, 100)  + "_rec_id"
			is_rec_id_col_nm = Mid(ls_table_names[ i ], 5, 100)  + "_rec_id"
			//--------------------------- APPEON BEGIN ---------------------------
			//$<add> 03/16/2007 By: Jervis
			//$<reason> Fixed a defect
			ls_table_field_names[upperbound(ls_table_field_names) + 1] = is_rec_id_col_nm
			//---------------------------- APPEON END ----------------------------
		ELSE
			ls_key_fields_col_nm[li_key_cnt] = "rec_id"
			is_rec_id_col_nm = Mid(ls_table_names[ i ], 5, 100)  + "_rec_id"
			//--------------------------- APPEON BEGIN ---------------------------
			//$<add> 03/16/2007 By: Jervis
			//$<reason> Fixed a defect
			ls_field_names[upperbound(ls_field_names) + 1] = "rec_id"
			//---------------------------- APPEON END ----------------------------

		END IF
	end if
	
	
	IF ids_screen_fields.GetItemNumber(i, "facility_specific" ) = 1 THEN
		li_facility_specific = 1
		li_key_cnt ++
		ls_key_fields_syntax = ls_key_fields_syntax + ls_table_names[ i ] + ".facility_id, "
		ls_key_fields[li_key_cnt] = ls_table_names[i] + ".facility_id"
		IF li_table_cnt > 1 THEN
			ls_key_fields_col_nm[li_key_cnt] = Mid(ls_table_names[ i ], 5, 100)  + "_facility_id"
			is_rec_id_col_nm = Mid(ls_table_names[ i ], 5, 100)  + "_facility_id"
		ELSE
			ls_key_fields_col_nm[li_key_cnt] = "facility_id"
			is_rec_id_col_nm = Mid(ls_table_names[ i ], 5, 100)  + "_facility_id"
		END IF
		//--------------------------- APPEON BEGIN ---------------------------
		//$<add> 03/16/2007 By: Jervis
		//$<reason> Fixed a defect
		if pos(ls_sql_syntax,"facility_id",1) = 0 then
			if li_table_cnt > 1 then
				ls_table_field_names[upperbound(ls_table_field_names) + 1] = is_rec_id_col_nm
			else
				ls_field_names[upperbound(ls_field_names) + 1] = "facility_id"
			end if
		end if
		//---------------------------- APPEON END ----------------------------

	END IF
	
	//added for tables with seq_no fields   JAD-6/06/02
	//--------------------------- APPEON BEGIN ---------------------------
	//$<modify> 04.13.2006 By: Liang QingShi
	//$<reason> Fix a defect in the original unmodified PowerBuilder application. After analyze the
	//$<reason> original application, one constraint is missed in the condition.
	/*
	IF ai_screen_id = 61 THEN
	*/
	IF ai_screen_id = 61 or ai_screen_id = 33 THEN
	
	//---------------------------- APPEON END ----------------------------
		li_key_cnt ++
		ls_key_fields_syntax = ls_key_fields_syntax + ls_table_names[ i ] + ".seq_no, "
		ls_key_fields[li_key_cnt] = ls_table_names[i] + ".seq_no"
		IF li_table_cnt > 1 THEN
			ls_key_fields_col_nm[li_key_cnt] = Mid(ls_table_names[ i ], 5, 100)  + "_seq_no"
			is_rec_id_col_nm = Mid(ls_table_names[ i ], 5, 100)  + "_seq_no"
		ELSE
			//ls_key_fields_col_nm[li_key_cnt] = "facility_id" Fixed By Jervis 03/16/2007 is seq_no not facility_id
			ls_key_fields_col_nm[li_key_cnt] = "seq_no"
			is_rec_id_col_nm = Mid(ls_table_names[ i ], 5, 100)  + "_seq_no"
		END IF	
		
		//--------------------------- APPEON BEGIN ---------------------------
		//$<add> 03/16/2007 By: Jervis
		//$<reason> Fixed a defect
		if pos(ls_sql_syntax,"seq_no",1) = 0 then
			if li_table_cnt > 1 then
				ls_table_field_names[upperbound(ls_table_field_names) + 1] = is_rec_id_col_nm
			else
				ls_field_names[upperbound(ls_field_names) + 1] = "seq_no"
			end if
		end if
		//---------------------------- APPEON END ----------------------------
	END IF	
		
END FOR

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 03/16/2007 By: Jervis
//$<reason> Fixed a defect
integer li_row_cnt_new
li_row_cnt_new = UpperBound(ls_field_names)	
//---------------------------- APPEON END ----------------------------

ls_sql_syntax = Mid( ls_sql_syntax, 1, 7 ) + ls_key_fields_syntax + Mid(ls_sql_syntax, 8, 10000)

//IF ls_table_name = "pd_address" THEN  // instead of following run 2.0 update group Practice button.
//	ls_sql_syntax = ls_sql_syntax + ", gp_id"
//END IF
//messagebox("", ls_sql_syntax)

//ASSIGN DW FIELD NAMES
IF li_table_cnt > 1 THEN
	lb_multi_table = True
	//FOR i = 1 TO li_row_cnt	03/16/2007
	For i = 1 to li_row_cnt_new
		ls_dw_field_names[i] = ls_table_field_names[i]
	END FOR	
ELSE
	lb_multi_table = False
	//FOR i = 1 TO li_row_cnt	03/16/2007
	for i = 1 to li_row_cnt_new
		ls_dw_field_names[i] = ls_field_names[i]
	END FOR
END IF

//BUILD FROM CLAUSE
ls_sql_syntax = ls_sql_syntax + " FROM "
FOR i = 1 TO li_table_cnt
	ls_sql_syntax = ls_sql_syntax + ls_table_names[i] + ", "
END FOR
ls_sql_syntax = Left( ls_sql_syntax, Len(ls_sql_syntax) -2 )
ls_return_syntax = ls_sql_syntax
//ADD WHERE CLAUSE
ls_sql_syntax = ls_sql_syntax + " WHERE " + ls_table_names[1] + ".prac_id  = " + String( al_prac_id )

IF li_facility_specific = 1 THEN
	ls_sql_syntax = ls_sql_syntax + " AND " + ls_table_names[1] + ".facility_id  = " + String( ai_facility_id )
END IF

//CREATE SORT ORDER code moved to top of function //maha 051905

//ADD order BY CLAUSE
IF li_sort_data_cnt > 0 THEN
	ls_sort_syntax = Mid( ls_sort_syntax, 1, Len( ls_sort_syntax )-1 )
	ls_sql_syntax = ls_sql_syntax + ls_sort_syntax
else
	ls_sql_syntax = ls_sql_syntax + " ORDER BY rec_id" //maha 111604
END IF

//CREATE SYNTAX FOR DETAIL DW
ls_grey = "80269524"//String(rgb(192,192,192))
ls_presentation_str = "style(type=form)" + " Column(Border=5 ) Datawindow(Color=" + ls_grey + " )" + "Text(Background.Color=" + ls_grey + ")"  
//ls_presentation_str = "style(type=form)" + " Column(Border=5 ) Datawindow(Color=" + ls_grey + " )" + "Text(Background.Color=0)"  //testing
//openwithparm( w_sql_msg, ls_sql_syntax )

ls_dwsyntax_str = SQLCA.SyntaxFromSQL(ls_sql_syntax, &
	ls_presentation_str, ERRORS)

IF Len(ERRORS) > 0 THEN
	MessageBox("Caution", &
	"SyntaxFromSQL caused these errors: " + ERRORS)
	RETURN "-1"
END IF

adw_detail.Create( ls_dwsyntax_str, ERRORS)

IF Len(ERRORS) > 0 THEN
	MessageBox("Caution", &
	"Create cause these errors: " + ERRORS)
	RETURN "-1"
END IF

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> UM-05
//$<add> 01.13.2006 By: Luke
//$<reason> It is currently unsupported to automatically change a column's edit style on the Web.
//$<modification> Modify the DataWindow syntax and then rebuild the DataWindow to
//$<modification> implement the functionality of changing a column's edit style.
If appeongetclienttype() <> 'PB' Then
	string ls_appeon_colname[],ls_editmask_colname[],ls_editmask_modify[]
	long li_appeon_index ,li_appeon_index2 
	
	ls_dwsyntax_str = adw_detail.describe("datawindow.syntax")
	li_appeon_index = 1
	li_appeon_index2 = 1
	
	FOR i = 1 TO li_row_cnt//ids_screen_fields.rowcount()
		IF NOT ab_screen_painter AND ids_screen_fields.GetItemString(i, "visible") = "N" THEN
			CONTINUE
		END IF
		/*
		IF ls_dw_field_names[i] = "active_status" THEN
			ls_appeon_colname[li_appeon_index] = ls_dw_field_names[i]
			li_appeon_index++
		END IF
		*/
		IF ids_screen_fields.GetItemString( i, "lookup_field") = "Y" AND NOT ab_screen_painter THEN
			ls_appeon_colname[li_appeon_index] = ls_dw_field_names[i]
			li_appeon_index++
		END IF
	
		//--> Begin change Editmask 
			IF ls_dw_field_names[i] <> "active_status" THEN
				IF ls_mask[i] <> "" THEN
					IF ls_mask[i] = "##" THEN
					ELSEIF ls_mask[i] = "(###)###-####" THEN
						//adw_detail.Modify( ls_dw_field_names[i] + ".EditMask.Mask='(###)###-####'" )
						/*ls_editmask_colname[Li_appeon_index2] = ls_dw_field_names[i]
						ls_editmask_modify[Li_appeon_index2] = "EditMask.Mask='(###)###-####'"
						Li_appeon_index2 ++ */					//Comment by Scofield on 2008-08-12
					ELSEIF ls_mask[i] = "###-##-####" THEN
						//adw_detail.Modify( ls_dw_field_names[i] + ".EditMask.Mask='###-##-####'")		
						ls_editmask_colname[Li_appeon_index2] = ls_dw_field_names[i]
						ls_editmask_modify[Li_appeon_index2] = "EditMask.Mask='###-##-####'"
						Li_appeon_index2 ++
					ELSEIF ls_mask[i] = "#####-####" THEN
						//adw_detail.Modify( ls_dw_field_names[i] + ".EditMask.Mask='#####-####'" )				
						ls_editmask_colname[Li_appeon_index2] = ls_dw_field_names[i]
						ls_editmask_modify[Li_appeon_index2] = "EditMask.Mask='#####-####'"
						Li_appeon_index2 ++
					END IF
				END IF	
			END IF
			//--< end change Editmask 
	END FOR
	
	//specail code for pd_address
	IF ls_table_name = "pd_address" THEN
		set1 = of_get_app_setting("set_1","I")
		
		if set1 = 1 then //maha 072301 create populate button only if using addresses for find
			ls_appeon_colname[li_appeon_index] = 'street'
			li_appeon_index++
		end if
					
		ls_appeon_colname[li_appeon_index] = 'billing_address_id'
		li_appeon_index++
	END IF
	
	of_change_to_dddw (ls_dwsyntax_str,ls_appeon_colname)
	of_change_to_editmask(ls_dwsyntax_str, ls_editmask_colname)
	
	adw_detail.Create( ls_dwsyntax_str, ERRORS)
	
	IF Len(ERRORS) > 0 THEN
		MessageBox("Caution", &
		"Create cause these errors: " + ERRORS + ls_dwsyntax_str)

		RETURN "-1"
	END IF
End If
//---------------------------- APPEON END ----------------------------

//CREATE SYNTAX FOR BROWSE DW
IF ib_create_browse THEN
	//ls_grey = String(rgb(192,192,192))
	ls_white = String(rgb(255,255,255))
	ls_presentation_str = "style(type=grid)" + " Column(Border=0) Datawindow(Color=" + ls_grey + " )" + "Text(Border=6 Background.Color=" + ls_grey + ")"


	ls_dwsyntax_str = SQLCA.SyntaxFromSQL(ls_sql_syntax, &
		ls_presentation_str, ERRORS)

	IF Len(ERRORS) > 0 THEN
		MessageBox("Caution", &
		"SyntaxFromSQL caused these errors: " + ERRORS)
		RETURN "-1"
	END IF

	adw_browse.Create( ls_dwsyntax_str, ERRORS)

	IF Len(ERRORS) > 0 THEN
		MessageBox("Caution", &
		"Create cause these errors: " + ERRORS)
		RETURN "-1"
	END IF
	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> UM-06
	//$<add> 01.13.2006 By: Luke
	//$<reason> It is currently unsupported to automatically change a column's edit style on the Web.
	//$<modification> Modify the DataWindow syntax and then rebuild the DataWindow to
	//$<modification> implement the functionality of changing a column's edit style.
	If appeongetclienttype() <> 'PB' Then
		ls_dwsyntax_str = adw_browse.describe("datawindow.syntax")
		li_appeon_index = 1
		
		FOR i = 1 TO li_row_cnt//ids_screen_fields.rowcount()
			IF NOT ab_screen_painter AND ids_screen_fields.GetItemString(i, "visible") = "N" THEN
				CONTINUE
			END IF
		
			IF ls_dw_field_names[i] = "active_status" THEN
				ls_appeon_colname[li_appeon_index] = ls_dw_field_names[i]
				li_appeon_index++
			END IF
			
			IF ids_screen_fields.GetItemString( i, "lookup_field") = "Y" AND NOT ab_screen_painter THEN
				ls_appeon_colname[li_appeon_index] = ls_dw_field_names[i]
				li_appeon_index++
			END IF
		END FOR
		
		//specail code for pd_address
		IF ls_table_name = "pd_address" THEN
			set1 = of_get_app_setting("set_1","I")
			
			if set1 = 1 then //maha 072301 create populate button only if using addresses for find
				ls_appeon_colname[li_appeon_index] = 'street'
				li_appeon_index++
			end if
						
			ls_appeon_colname[li_appeon_index] = 'billing_address_id'
			li_appeon_index++
		END IF
	
		of_change_to_dddw (ls_dwsyntax_str,ls_appeon_colname)
		adw_browse.Create( ls_dwsyntax_str, ERRORS)
		
		IF Len(ERRORS) > 0 THEN
			MessageBox("Caution", &
			"Create cause these errors: " + ERRORS + ls_dwsyntax_str)
			clipboard(ls_dwsyntax_str)
			RETURN "-1"
		END IF
	End If
	//---------------------------- APPEON END ----------------------------	
	
END IF
	

IF NOT ab_screen_painter THEN
	adw_detail.of_SetTransObject( SQLCA )
	li_prac_row_cnt = adw_detail.Retrieve()
END IF

IF li_prac_row_cnt = 0 THEN 
	//Start Code Change ---- 06.09.2006 #531 maha
	if ai_screen_id = 65 or ai_screen_id = 54   then
		if not ab_screen_painter then 
		//don't add row in prac folder
		else	
			adw_detail.InsertRow(0) //maha app081705
		end if
	else
		adw_detail.InsertRow(0) 
	end if
	//End Code Change---06.09.2006
	
	IF IsValid( m_pfe_cst_data_entry ) THEN
		//m_pfe_cst_data_entry.m_edit.m_addverificationentry.Enabled = False
	END IF
ELSE
	IF IsValid( m_pfe_cst_data_entry ) THEN
	//	m_pfe_cst_data_entry.m_edit.m_addverificationentry.Enabled = True  maha removed 082503
	END IF
	//of_set_defaults( adw_detail, 1 )
	//adw_detail.SetItemStatus( 1, 0, Primary!, NotModified! )
END IF

//debugbreak()
IF	lb_multi_table THEN
	//adw_detail.of_SetMultiTable(TRUE)
	//FOR i = 1 TO li_table_cnt
		//adw_detail.inv_multitable.of_Register( ls_table_names[I], ls_table_2_fields, ls_table_2_update_fields, TRUE, 0)
	//END FOR
ELSE
	adw_detail.Object.DataWindow.Table.UpdateTable= ls_table_names[1]
	adw_detail.Object.DataWindow.Table.UpdateWhere= '0'
	adw_detail.Object.DataWindow.Table.UpdateKeyinPlace = 'Yes'
	//FOR i = 1 TO li_row_cnt		03/16/2007
	For i = 1 to li_row_cnt_new
		adw_detail.Modify( ls_dw_field_names[i] + ".Update= Yes")	
		IF Pos( ls_dw_field_names[i], "prac_id" ) > 0  OR Pos( ls_dw_field_names[i], "rec_id" ) > 0 THEN
			adw_detail.Modify( ls_dw_field_names[i] + ".Key=Yes")
			adw_detail.Modify(ls_dw_field_names[i] + ".Edit.DisplayOnly=Yes")
		END IF
	next
	//03/16/2007 
	For i = 1 to li_row_cnt
		if ids_screen_fields.GetItemstring( i, "display_only" ) = "Y" then //maha 041404 to allow single fields to be read only
			//messagebox("display only",ls_dw_field_names[i])
			adw_detail.Modify(ls_dw_field_names[i] + ".TabSequence = '0'" ) //set below
			adw_detail.Modify(ls_dw_field_names[i] + ".background.color = '12632256'")
		end if
	END FOR
END IF
//debugbreak()
IF ib_create_browse THEN
	adw_detail.ShareData(adw_browse)
END IF
//messagebox("",  Long( adw_detail.Object.DataWindow.Detail.Height) )
//IF Long( adw_detail.Object.DataWindow.Detail.Height) > 1800 THEN
//IF Long( adw_detail.Object.DataWindow.Detail.Height) > ( adw_detail.Height + 50 ) THEN
//ll_max_height = ll_max_height + 50 
////adw_detail.Object.DataWindow.Detail.Height= 5000 //maha moved to end
//adw_detail.Object.DataWindow.Detail.Height= ll_max_height
adw_detail.Modify("active_status.Initial='1'")
//messagebox("cash",ids_screen_fields.rowcount())
//messagebox("field names",string(upperbound(ls_dw_field_names[])))

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-33
//$<add> 01.25.2006 By: Cao YongWang
//$<reason> Pervformance tuning.
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.
gnv_appeondb.of_startqueue()
//---------------------------- APPEON END ----------------------------

FOR i = 1 TO li_row_cnt//ids_screen_fields.rowcount()
	IF NOT ab_screen_painter AND ids_screen_fields.GetItemString(i, "visible") = "N" THEN
		CONTINUE
	END IF
	//visible
	IF ab_screen_painter THEN
		IF ids_screen_fields.GetItemString(i, "visible") = "N" THEN
			adw_detail.Modify(ls_dw_field_names[i] + ".color = '8421504'") 
			adw_detail.Modify(ls_dw_field_names[i] + ".background.color = '12632256'") 
			adw_detail.Modify(ls_dw_field_names[i] + "_t.color = '8421504'") 
		ELSE
			adw_detail.Modify(ls_dw_field_names[i] + ".color = '0'") 
			adw_detail.Modify(ls_dw_field_names[i] + "_t.color = '0'")
			adw_detail.Modify(ls_dw_field_names[i] + "_t.background.mode = '1'") //Start Code Change ---- 10.22.2007 #V7 maha added to make labels transparent
			adw_detail.Modify(ls_dw_field_names[i] + ".background.color = '16777215'") 
		END IF
	END IF

	IF ab_screen_painter THEN
		//--------------------------- APPEON BEGIN ---------------------------
		//$<ID> UM-07
		//$<modify> 01.13.2006 By: LeiWei
		//$<reason> The "dbname" property is readonly on the Web after migration.
		//$<modification> In order to make the functionality the same to that in PowerBuilder, 
		//$<modification> change it to the writable TabSequence property
		//adw_detail.Modify( ls_dw_field_names[i] + ".TabSequence = '0'" )
		//adw_detail.Modify( ls_dw_field_names[i] + ".dbname = '" + String( i * 10) + "'" )
		adw_detail.Modify( ls_dw_field_names[i] + ".TabSequence = '" + String( i * 10) + "'" )
		//---------------------------- APPEON END ----------------------------
	ELSE
		
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		IF Len(ls_dw_field_names[i]) > 0 AND lb_first_field THEN
			lb_first_field = False
			is_first_column = ls_dw_field_names[i]
		END IF
		if ids_screen_fields.GetItemstring( i, "display_only" ) = "Y" then //maha 041404
			adw_detail.Modify( ls_dw_field_names[i] + ".TabSequence = '0'" )
			adw_detail.Modify( ls_dw_field_names[i] + ".border = '2'" )
		else
			adw_detail.Modify( ls_dw_field_names[i] + ".TabSequence = '" + String(i) + "'" )
		end if
			
	END IF
	
	if isnull(ls_field_label[i]) then ls_field_label[i] = '' //Jervis 02.18.2008
	
	IF ib_create_browse THEN
		adw_browse.Modify( ls_dw_field_names[i] + ".TabSequence = '0'" )
		adw_browse.Modify( ls_dw_field_names[i] + "_t.text = '" + ls_field_label[i] + "'")	
	END IF
	
	adw_detail.Modify( ls_dw_field_names[i] + "_t.text = '" + ls_field_label[i] + "'")

	//bold or not?
	adw_detail.Modify( ls_dw_field_names[i] + "_t.font.weight = '" + ls_fld_lbl_font_wght + "'")	

	if integer(ls_field_label_height[i]) > 120 then //maha added to allow multi line fields to wrap 011504
		//messagebox(ls_dw_field_names[i],ls_field_label_height[i])
		adw_detail.Modify( ls_dw_field_names[i] + ".edit.AutoHScroll = No")
	end if

	li_fld_label_width = ids_screen_fields.GetItemNumber( i, "field_label_width" )
	li_fld_width = ids_screen_fields.GetItemNumber( i, "field_width" ) 
	adw_detail.Modify( ls_dw_field_names[i] + ".width = '" + String( li_fld_width ) + "'" )	
	adw_detail.Modify( ls_dw_field_names[i] + "_t.width = '" + String( li_fld_label_width ) + "'" )
	adw_detail.Modify( ls_dw_field_names[i] + ".height = '" + String( ls_field_label_height[i] ) + "'" )

	IF ib_create_browse THEN
		IF li_fld_width < li_fld_label_width THEN
			adw_browse.Modify( ls_dw_field_names[i] + ".width = '" + String( li_fld_label_width ) + "'" )
		ELSE
			adw_browse.Modify( ls_dw_field_names[i] + ".width = '" + String( li_fld_width ) + "'" )
		END IF
	END IF

	
	IF ls_field_x[i] = "0" THEN
		adw_detail.Modify( ls_dw_field_names[i] + ".x = 750")
		adw_detail.Modify( ls_dw_field_names[i] + ".y = " + String(i*100) )

		adw_detail.Modify( ls_dw_field_names[i] + "_t.x = 100")
		adw_detail.Modify( ls_dw_field_names[i] + "_t.y = " + String(i*100) )
	ELSE
		adw_detail.Modify( ls_dw_field_names[i] + ".x = " + ls_field_x[i] )
		adw_detail.Modify( ls_dw_field_names[i] + ".y = " + ls_field_y[i] )

		adw_detail.Modify( ls_dw_field_names[i] + "_t.x = " + ls_field_label_x[i] )
		adw_detail.Modify( ls_dw_field_names[i] + "_t.y = " + ls_field_label_y[i] )		
	END IF

	//tag value set to field id
	adw_detail.Modify( ls_dw_field_names[i] + ".tag = '" + ls_field_id[i] + "'" )
	adw_detail.Modify( ls_dw_field_names[i] + "_t.tag = '" + ls_field_id[i] + "'" )

	//alignment
	adw_detail.Modify( ls_dw_field_names[i] + ".alignment = '" + ids_screen_fields.GetItemString( i, "justification" ) + "'" )	
	adw_detail.Modify( ls_dw_field_names[i] + "_t.alignment = '" + String( ids_screen_fields.GetItemNumber( i, "field_label_justification" ) ) + "'" )	

	//--------------------------- APPEON BEGIN ---------------------------
	//$<add> 04/01/2008 By: Ken.Guo
	//$<reason> Added new properties: Font.UnderLine, Font.Italic, Font.Weight.
	//UnderLine
	adw_detail.Modify( ls_dw_field_names[i] + ".Font.UnderLine = '" + 	ids_screen_fields.GetItemString( i, "data_view_fields_field_underline" ) + "'" )	
	adw_detail.Modify( ls_dw_field_names[i] + "_t.Font.UnderLine = '" + 	ids_screen_fields.GetItemString( i, "data_view_fields_label_underline" ) + "'" )	

	//Italic
	adw_detail.Modify( ls_dw_field_names[i] + ".Font.Italic = '" + 	String(ids_screen_fields.GetItemNumber( i, "data_view_fields_field_font_italic" ) ) + "'" )	
	adw_detail.Modify( ls_dw_field_names[i] + "_t.Font.Italic = '" +	String(ids_screen_fields.GetItemNumber( i, "data_view_fields_label_font_italic" ) ) + "'" )	

	//Weight
	adw_detail.Modify( ls_dw_field_names[i] + ".Font.weight = '" +		String(ids_screen_fields.GetItemNumber( i, "data_view_fields_font_wieght" )) + "'" )	
	adw_detail.Modify( ls_dw_field_names[i] + "_t.Font.weight = '" +	String(ids_screen_fields.GetItemNumber( i, "data_view_fields_label_font_weight" ) ) + "'" )	
	//---------------------------- APPEON END ----------------------------

	IF ib_create_browse THEN
		adw_browse.Modify( ls_dw_field_names[i] + ".alignment = '" + ids_screen_fields.GetItemString( i, "justification" ) + "'" )	
		adw_browse.Modify( ls_dw_field_names[i] + "_t.alignment = '" + String( ids_screen_fields.GetItemNumber( i, "field_label_justification" ) ) + "'" )	
	END IF
	
	IF ls_dw_field_names[i] = "active_status" THEN
		adw_detail.Modify( ls_dw_field_names[i] + ".dddw.VscrollBar = Yes")			
		adw_detail.Modify( ls_dw_field_names[i] + ".dddw.useasborder = Yes")			
		adw_detail.Modify( ls_dw_field_names[i] + ".dddw.NilIsNull= Yes")
		//adw_detail.Modify( ls_dw_field_names[i] + ".dddw.Lines= 15")
		adw_detail.Modify( ls_dw_field_names[i] + "_t.font.underline = '1'")
		adw_detail.Modify( ls_dw_field_names[i] + ".dddw.Required = Yes")
		adw_detail.Modify( ls_dw_field_names[i] + ".dddw.name = 'd_code_lookup_active_inactive'")
		adw_detail.Modify( ls_dw_field_names[i] + ".dddw.datacolumn = 'lookup_code'")			
		adw_detail.Modify( ls_dw_field_names[i] + ".dddw.displaycolumn = 'description'")						

		IF ib_create_browse THEN
			adw_browse.Modify( ls_dw_field_names[i] + ".dddw.VscrollBar = Yes")			
			adw_browse.Modify( ls_dw_field_names[i] + ".dddw.useasborder = Yes")			
			adw_browse.Modify( ls_dw_field_names[i] + ".dddw.NilIsNull= Yes")
			//adw_browse.Modify( ls_dw_field_names[i] + ".dddw.Lines= 15")
			adw_browse.Modify( ls_dw_field_names[i] + "_t.font.underline = '1'")
			adw_browse.Modify( ls_dw_field_names[i] + ".dddw.Required = Yes")
			adw_browse.Modify( ls_dw_field_names[i] + ".dddw.name = 'd_code_lookup_active_inactive'")
			adw_browse.Modify( ls_dw_field_names[i] + ".dddw.datacolumn = 'lookup_code'")			
			adw_browse.Modify( ls_dw_field_names[i] + ".dddw.displaycolumn = 'description'")								
		END IF
	END IF
		IF UPPER(ls_lookup_field) = "ENTITY_NAME" THEN

		END IF
	IF ids_screen_fields.GetItemString( i, "lookup_field") = "Y" AND NOT ab_screen_painter THEN
		ls_lookup_code = ids_screen_fields.GetItemString( i, "lookup_code" )
		ls_lookup_field = ids_screen_fields.GetItemString( i, "lookup_field_name" )
		ls_lookup_type = ids_screen_fields.GetItemString( i, "lookup_type" )
		adw_detail.Modify( ls_dw_field_names[i] + ".dddw.VscrollBar = Yes")
		adw_detail.Modify( ls_dw_field_names[i] + ".dddw.AutoHScroll = Yes")
		adw_detail.Modify( ls_dw_field_names[i] + ".dddw.useasborder = Yes")			
		adw_detail.Modify(ls_dw_field_names[i] + ".dddw.NilIsNull= Yes")
		//Start Code Change ---- 03.08.2006 #317 maha readded
		adw_detail.Modify(ls_dw_field_names[i] + ".dddw.Lines= 15")
		//End Code Change---03.08.2006
		IF ids_screen_fields.GetItemString(i, "required") = "Y" THEN
			adw_detail.Modify(ls_dw_field_names[i] + "_t.font.underline = '1'")
			adw_detail.Modify(ls_dw_field_names[i] + ".dddw.Required = Yes")
		END IF	
		IF ls_lookup_type = "C" THEN
			adw_detail.Modify( ls_dw_field_names[i] + ".dddw.name = 'd_dddw_code_lookup'")
			adw_detail.Modify( ls_dw_field_names[i] + ".dddw.datacolumn = 'lookup_code'")			
			
			IF ib_create_browse = True THEN
				adw_browse.Modify( ls_dw_field_names[i] + ".dddw.name = 'd_dddw_code_lookup'")
				adw_browse.Modify( ls_dw_field_names[i] + ".dddw.datacolumn = 'lookup_code'")	
			END IF
			
			IF Upper( ls_lookup_field ) = "CODE" THEN
				adw_detail.Modify( ls_dw_field_names[i] + ".dddw.displaycolumn = 'code'")
				IF ib_create_browse = True THEN				
					adw_browse.Modify( ls_dw_field_names[i] + ".dddw.displaycolumn = 'code'")
				END IF
			ELSE
				//--------------------------- APPEON BEGIN ---------------------------
				//$<Modify> 2007-07-12 By: Scofield
				//$<Reason> Change 'description' to ls_lookup_field
				
				//adw_detail.Modify( ls_dw_field_names[i] + ".dddw.displaycolumn = 'description'")
				adw_detail.Modify( ls_dw_field_names[i] + ".dddw.displaycolumn = '"+ls_lookup_field+"'")
				IF ib_create_browse = True THEN				
					//adw_browse.Modify( ls_dw_field_names[i] + ".dddw.displaycolumn = 'description'")
					adw_browse.Modify( ls_dw_field_names[i] + ".dddw.displaycolumn = '"+ls_lookup_field+"'")
				END IF
				//---------------------------- APPEON END ----------------------------
			END IF
		ELSEIF ls_lookup_type = "A" THEN
			adw_detail.Modify( ls_dw_field_names[i] + ".dddw.HscrollBar = Yes")			
			adw_detail.Modify( ls_dw_field_names[i] + ".dddw.name = 'd_dddw_address_lookup'")
			adw_detail.Modify( ls_dw_field_names[i] + ".dddw.datacolumn = 'lookup_code'")		

			IF ib_create_browse = True THEN				
				adw_browse.Modify( ls_dw_field_names[i] + ".dddw.name = 'd_dddw_address_lookup'")						
				adw_browse.Modify( ls_dw_field_names[i] + ".dddw.datacolumn = 'lookup_code'")			
			END IF
			
			IF Upper( ls_lookup_field ) = "CODE" THEN
				adw_detail.Modify( ls_dw_field_names[i] + ".dddw.displaycolumn = 'code'")
				IF ib_create_browse = True THEN								
					adw_browse.Modify( ls_dw_field_names[i] + ".dddw.displaycolumn = 'code'")
				END IF
			ELSE
				//--------------------------- APPEON BEGIN ---------------------------
				//$<modify> 2007.08.11 By: Jack
				//$<reason> Fix a defect.	
				
				/*
				//--------------------------- APPEON BEGIN ---------------------------
				//$<modify> 09.07.2006 By: Liang QingShi
				//$<reason> Fix a defect.
				/*
				adw_detail.Modify( ls_dw_field_names[i] + ".dddw.displaycolumn = 'entity_name'")			
				IF ib_create_browse = True THEN								
					adw_browse.Modify( ls_dw_field_names[i] + ".dddw.displaycolumn = 'entity_name'")						
				END IF
				*/
				
				IF appeongetclienttype() = 'PB' THEN
					adw_detail.Modify( ls_dw_field_names[i] + ".dddw.displaycolumn = 'entity_name'")			
					IF ib_create_browse = True THEN								
						adw_browse.Modify( ls_dw_field_names[i] + ".dddw.displaycolumn = 'entity_name'")						
					END IF
				ELSE
					adw_detail.Modify( ls_dw_field_names[i] + ".dddw.displaycolumn = 'entity_name_original'")			
					IF ib_create_browse = True THEN								
						adw_browse.Modify( ls_dw_field_names[i] + ".dddw.displaycolumn = 'entity_name_original'")						
					END IF
				END IF
				//---------------------------- APPEON END ----------------------------
				*/
				
				adw_detail.Modify( ls_dw_field_names[i] + ".dddw.displaycolumn = 'entity_name'")			
				IF ib_create_browse = True THEN								
					adw_browse.Modify( ls_dw_field_names[i] + ".dddw.displaycolumn = 'entity_name'")						
				END IF
				
				//---------------------------- APPEON END ----------------------------
			END IF
		ELSEIF ls_lookup_type = "Q" THEN
			adw_detail.Modify( ls_dw_field_names[i] + ".dddw.name = 'd_dddw_quest_lookup'")
			adw_detail.Modify( ls_dw_field_names[i] + ".dddw.datacolumn = 'quest_id'")	
			adw_detail.Modify( ls_dw_field_names[i] + ".dddw.displaycolumn = 'short_quest'")
			adw_detail.Modify( ls_dw_field_names[i] + ".dddw.useasborder = No")
			adw_detail.Modify( ls_dw_field_names[i] + ".dddw.vscrollbar = Yes")
			IF ib_create_browse = True THEN
				adw_browse.Modify( ls_dw_field_names[i] + ".dddw.name = 'd_dddw_quest_lookup'")
				adw_browse.Modify( ls_dw_field_names[i] + ".dddw.datacolumn = 'quest_id'")
				adw_browse.Modify( ls_dw_field_names[i] + ".dddw.displaycolumn = 'full_quest'")						
			END IF
		END IF
	
		//adw_detail.Modify( ls_dw_field_names[i] + ".dddw.AllowEdit = Yes")
		adw_detail.Modify( ls_dw_field_names[i] + ".dddw.VScrollBar = Yes")
		//adw_detail.Modify( ls_dw_field_names[i] + ".dddw.HScrollBar = Yes")
		adw_detail.Modify( ls_dw_field_names[i] + ".dddw.PercentWidth = '" + ls_dddw_width[i] + "'")
		adw_detail.GetChild( ls_dw_field_names[i] , dwchild )

		//IF ib_create_browse = True THEN						
			adw_browse.GetChild( ls_dw_field_names[i] , dwchild_browse )
			dwchild.SetTransObject( SQLCA )
		//END IF

//Start Code Change ---- 12.15.2005 #170 maha
//		IF ls_lookup_type = "A" THEN
//			app_filler.ids_address_dddw.ShareData( dwchild )
//			dwchild.SetFilter( "lookup_name = '" + ls_lookup_code + "'" )
//			dwchild.Filter()	
//		ELSEif ls_lookup_type = "C" THEN
//			dwchild.Retrieve(ls_lookup_code)
//		ELSEif ls_lookup_type = "Q" THEN
//			dwchild.Retrieve()	
//		END IF		


		of_dwchild_retrieve(ls_lookup_code,ls_lookup_type,adw_detail,"CREATE",0,ls_dw_field_names[i]) //maha app081705
		dwchild.ShareData( dwchild_browse )
//End Code Change---12.15.2005
	ELSEIF ls_dw_field_names[i] <> "active_status" THEN
		adw_detail.Modify(ls_dw_field_names[i] + ".Edit.NilIsNull= Yes")
		IF ids_screen_fields.GetItemString(i, "required") = "Y" THEN
			adw_detail.Modify(ls_dw_field_names[i] + "_t.font.underline = '1'")			
			adw_detail.Modify(ls_dw_field_names[i] + ".Edit.Required = Yes")
		END IF	
		IF ls_mask[i] <> "" THEN
			adw_detail.Modify( ls_dw_field_names[i] + ".Edit.CodeTable = Yes")
			adw_detail.Modify( ls_dw_field_names[i] + ".Edit.ValidateCode = Yes" )
			//adw_detail.Modify( ls_dw_field_names[i] + ".ValidationMsg = 'Invalid Month, Select a number from 1 and 12.'" )
			//adw_detail.Modify( ls_dw_field_names[i] + ".EditMask.Mask='" + ls_mask[i] + "'")
			IF ls_mask[i] = "##" THEN
				FOR m = 1 TO 12
					ls_month = String(m)
					adw_detail.SetValue( ls_dw_field_names[i], m, ls_month + "~t" + ls_month )
					adw_detail.Modify( ls_dw_field_names[i] + ".ValidationMsg = 'Invalid Month, Select a number from 1 and 12.'" )//maha moved 092605
				END FOR
				m1 = 0
				FOR m = 13 TO 21
					m1++
					ls_month = "0" + String(m1)
					adw_detail.SetValue( ls_dw_field_names[i], m, ls_month + "~t" + ls_month )
				END FOR
				adw_detail.Modify( ls_dw_field_names[i] + ".Edit.Limit = '2'" )			
				
			ELSEIF ls_mask[i] = "(###)###-####" THEN
				//adw_detail.Modify( ls_dw_field_names[i] + ".EditMask.Mask='(###)###-####'" )	//Comment by Scofield on 2008-08-12
			ELSEIF ls_mask[i] = "###-##-####" THEN
				adw_detail.Modify( ls_dw_field_names[i] + ".EditMask.Mask='###-##-####'")		
			ELSEIF ls_mask[i] = "#####-####" THEN
				adw_detail.Modify( ls_dw_field_names[i] + ".EditMask.Mask='#####-####'" )				
			ELSEIF ls_mask[i] = "####" THEN
				li_index = 0
				FOR m = 1880 TO 2050
					li_index++
					adw_detail.SetValue( ls_dw_field_names[i], li_index, String(m) + "~t" + String(m) )
				END FOR
				adw_detail.Modify( ls_dw_field_names[i] + ".Edit.Limit = '4'" )			
				adw_detail.Modify( ls_dw_field_names[i] + ".ValidationMsg = 'Invalid Year, Select a number between 1880 and 2050.'" )
			ELSEIF ls_mask[i] = "mm/dd/yyyy" THEN
				//adw_detail.Modify( ls_dw_field_names[i] + ".EditMask.Mask ='mm/dd/yyyy'")
				adw_detail.Modify( ls_dw_field_names[i] + ".Format='mm/dd/yyyy'")
			//	adw_detail.Modify( ls_dw_field_names[i] + ".ValidationMsg = 'Invalid Date, Please reenter.'" ) //maha 092605
				IF ib_create_browse = True THEN				
					adw_browse.Modify( ls_dw_field_names[i] + ".Format='mm/dd/yyyy'")
				END IF
			ELSEIF ls_mask[i] = "#,##0.00" THEN
				adw_detail.Modify( ls_dw_field_names[i] + ".Format='#,##0'")
				IF ib_create_browse = True THEN								
					adw_browse.Modify( ls_dw_field_names[i] + ".Format='#,##0'")
				END IF
			END IF
		END IF	
	END IF
END FOR

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-34
//$<add> 01.25.2006 By: Cao YongWang
//$<reason> Performance tuning
//$<modification> Add Appeon Commit label.

gnv_appeondb.of_commitqueue()
If appeongetclienttype() <> 'PB' Then of_dwchild_after_retrieve(adw_detail)
//---------------------------- APPEON END ----------------------------


//reset all browse fields //maha 051005
integer cc
cc = upperbound( ls_dw_field_names)//integer(adw_browse.Object.DataWindow.Column.Count)
wer = ids_screen_fields.rowcount()
// messagebox("li_row_cnt",li_row_cnt)
 // messagebox("cols",cc)
  // messagebox("fields",wer)
if  ib_create_browse = True then
	for i = 1 to li_row_cnt//ids_screen_fields.rowcount()
		adw_browse.Modify( ls_field_names[i] + ".TabSequence = '0'" )
	next
end if

//clipboard(adw_detail.Describe("datawindow.syntax"))
FOR i = 1 TO li_key_cnt
	adw_detail.Modify( ls_key_fields_col_nm[i] + ".visible = '0'")
	adw_detail.Modify( ls_key_fields_col_nm[i] + "_t.visible = '0'")
	IF ib_create_browse = True THEN					
		adw_browse.Modify( ls_key_fields_col_nm[i] + ".visible = '0'")
		adw_browse.Modify( ls_key_fields_col_nm[i] + "_t.visible = '0'")
	END IF
END FOR

IF NOT ab_screen_painter THEN
	adw_detail.iuo_calendar.of_Register(adw_detail.iuo_calendar.DDLB)		
	adw_detail.of_SetReqColumn(TRUE)
END IF

//ls_detail_band_height = String(Integer(adw_detail.Object.DataWindow.Detail.Height) - 200)

//messagebox("ls_detail_band_height",ls_detail_band_height)

adw_detail.SetRedraw(True)

adw_detail.Modify("create groupbox(band=detail text='End of Detail border='5' color='255' x='1' y='" + ls_detail_band_height + "' height='50' width='3000'  font.face='MS Sans Serif' font.height='-8' font.weight='400'  font.family='2' font.pitch='2' font.charset='0' background.mode='1' background.color='553648127' name=detail_band)"  )


//CREATE ANY SCREEN OBJECTS THAT WERE ADDED
FOR i = 1 TO li_obj_cnt
	if ids_screen_objects.GetItemnumber(i, "object_underline") = 1 then //maha 082305 for use in modify below for underline
		li_uls = 1
	else 
		li_uls = 0
	end if
	ls_obj_type = ids_screen_objects.GetItemString(i, "object_type") 
	ls_obj_name = "object"+String( ids_screen_objects.GetItemNumber(i, "data_view_object_id") )
	ls_width = String( ids_screen_objects.GetItemNumber(i, "object_width") )
	ls_height = String( ids_screen_objects.GetItemNumber(i, "object_height") )
	ls_x = String( ids_screen_objects.GetItemNumber(i, "object_x") )
	ls_y = String( ids_screen_objects.GetItemNumber(i, "object_y") )
	ls_text = ids_screen_objects.GetItemString(i, "object_text") 
	ls_justification = String( ids_screen_objects.GetItemNumber(i, "object_alignment") )
	if long(ls_y) + long(ls_height) > ll_max_height then ll_max_height = long(ls_y) + long(ls_height)  //maha 051205
	//--------------------------- APPEON BEGIN ---------------------------
	//$<add> 2006-08-31 By: Liu HongXin
	//$<reason> Fix defect: display the bold and italic of stand-alone text
	ls_Bold		= String(ids_screen_objects.GetItemNumber(i, "object_bold") )
	ls_italic	= String(ids_screen_objects.GetItemNumber(i, "object_italic") )
	if IsNull(ls_Bold) then ls_Bold = "400"
	if IsNull(ls_italic) then ls_italic = "0"
	//---------------------------- APPEON END ----------------------------

	CHOOSE CASE ls_obj_type
		CASE "B"
			adw_detail.Modify("create groupbox(band=detail text='" + ls_text + "' border='5' color='128' x='" + ls_x + "' y='" + ls_y + "' height='" + ls_height + "' width='" + ls_width + "'  font.face='MS Sans Serif' font.height='-8' font.weight='400'  font.family='2' font.pitch='2' font.charset='0' background.mode='1' background.color='553648127' name=" + ls_obj_name + ")" )
		CASE "T"  //maha 051809 ######
			if ab_screen_painter then
				ls_color = "128"
			else
				ls_color = "0"
			end if
			//--------------------------- APPEON BEGIN ---------------------------
			//$<modify> 2006-08-31 By: Liu HongXin
			//$<reason> 
			/*
			adw_detail.Modify("create text(band=detail text='" + ls_text + "' border='0' color='" + ls_color + "' x='" + ls_x + "' y='" + ls_y + "' height='" + ls_height + "' width='" + ls_width + "'  font.face='MS Sans Serif' font.height='-8' font.weight='400'  font.family='2' font.pitch='2' font.underline='" + string(li_uls) + "' font.charset='0' background.mode='1' background.color='553648127' name=" + ls_obj_name +")" )
			*/
			adw_detail.Modify("create text(band=detail text='" + ls_text + "' border='0' color='" + ls_color + "' x='" + ls_x + "' y='" + ls_y + "' height='" + ls_height + "' width='" + ls_width + "'  font.face='MS Sans Serif' font.height='-8' font.family='2' font.pitch='2' font.underline='" + string(li_uls) + "' font.weight='" + ls_bold + "' font.italic='" + ls_italic + "' font.charset='0' background.mode='1' background.color='553648127' Alignment='"+ls_justification+"' name=" + ls_obj_name + ")" )
			//---------------------------- APPEON END ----------------------------

	END CHOOSE
END FOR
//Start Code Change ---- 01.18.2006 #203 maha
IF ls_table_name = "pd_address" or ls_table_name = "dba.pd_address" THEN //maha 011806
	//adw_detail.Modify("create button(band=detail text='Address Links...' filename=''action='0' border='1' color='128' x='1822' y='110' height='104' width='500' vtextalign='0' htextalign='0'  font.face='MS Sans Serif' font.height='-8' font.weight='700'  font.family='2' font.pitch='2' font.charset='0' background.mode='2' background.color='12632256' name = linkbutton)")
	
	//address drop down
	
	adw_detail.Modify("create button(band=detail text='Find' filename=''action='0' border='1' color='128' x='1822' y='285' height='85' width='200' vtextalign='0' htextalign='0'  font.face='MS Sans Serif' font.height='-8' font.weight='700'  font.family='2' font.pitch='2' font.charset='0' background.mode='2' background.color='12632256' name = findbutton)")
	
//	integer set1
//	select set_1
//	into :set1
//	from icred_settings;
	set1 = of_get_app_setting("set_1","I")

	if set1 = 1 then //maha 072301 create populate button only if using addresses for find
		adw_detail.Modify("create button(band=detail text='Populate' filename=''action='0' border='1' color='128' x='2010' y='285' height='85' width='280' vtextalign='0' htextalign='0'  font.face='MS Sans Serif' font.height='-8' font.weight='700'  font.family='2' font.pitch='2' font.charset='0' background.mode='2' background.color='12632256' name = populatebutton)")		
		adw_detail.Modify( "street.dddw.VscrollBar = Yes")			
		adw_detail.Modify( "street.dddw.useasborder = Yes")			
		adw_detail.Modify( "street.dddw.AllowEdit = Yes")			
		adw_detail.Modify( "street.dddw.NilIsNull= Yes")
		//adw_detail.Modify( "street.dddw.Lines= 15")
		adw_detail.Modify( "street.dddw.PercentWidth = '200'")	
		adw_detail.Modify( "street.dddw.name = 'd_dddw_addresses'")
		adw_detail.Modify( "street.dddw.datacolumn = 'rec_id'")			
		adw_detail.Modify( "street.dddw.displaycolumn = 'street'")	
	end if
	
	//add drop down for billing address
	ls_retval = adw_detail.Modify( "billing_address_id.dddw.VscrollBar = Yes")			
	adw_detail.Modify( "billing_address_id.dddw.useasborder = Yes")			
	adw_detail.Modify( "billing_address_id.dddw.NilIsNull= Yes")
	//adw_detail.Modify( "billing_address_id.dddw.Lines= 15")
	adw_detail.Modify( "billing_address_id_t.font.underline = '1'")
	adw_detail.Modify( "billing_address_id.dddw.Required = No")
	adw_detail.Modify( "billing_address_id.dddw.name = 'd_dddw_billing_addresses'")
	adw_detail.Modify( "billing_address_id.dddw.datacolumn = 'pd_address_rec_id'")			
	adw_detail.Modify( "billing_address_id.dddw.displaycolumn = 'address'")								
	res  = adw_detail.GetChild( "billing_address_id", dwchild )
	if res = 1 then
		IF Len( ls_retval ) = 0 THEN
			dwchild.SetTransObject( SQLCA )
			dwchild.Retrieve( al_prac_id )
		END IF
//		des = dwchild.Describe("DataWindow.Objects")
//			openwithparm(w_sql_msg,des)
		dwchild.InsertRow( 1 )
		dwchild.SetItem( 1, "pd_address_street", "N/A" )	
		dwchild.SetItem( 1, "pd_address_city", "" )
		dwchild.SetItem( 1, "code_lookup_code", "" )
		dwchild.SetItem( 1, "pd_address_rec_id", -1 )	
		dwchild.InsertRow( 1 )
		dwchild.SetItem( 1, "pd_address_street", "Same" )	
		dwchild.SetItem( 1, "pd_address_city", "" )
		dwchild.SetItem( 1, "code_lookup_code", "" )
		dwchild.SetItem( 1, "pd_address_rec_id", 0 )
		dwchild.InsertRow( 1 )
		dwchild.SetItem( 1, "pd_address_street", "" )	
		dwchild.SetItem( 1, "pd_address_city", "" )
		dwchild.SetItem( 1, "code_lookup_code", "" )
	end if
	
END IF

IF ls_table_name = "pd_references" or ls_table_name = "dba.pd_references" THEN //maha 011806
//End Code Change---01.18.2005 
	li_set = of_get_app_setting("set_5","I")
	if li_set = 0 then
		//messagebox("","ref button")
		adw_detail.Modify("create button(band=detail text='Select Peer' filename=''action='0' border='1' color='128' x='1102' y='1285' height='85' width='400' vtextalign='0' htextalign='0'  font.face='MS Sans Serif' font.height='-8' font.weight='700'  font.family='2' font.pitch='2' font.charset='0' background.mode='2' background.color='12632256' name = peerbutton)")
		if ll_max_height < 1400 then ll_max_height = 1400 //maha 060805 button was disappearing
	end if
end if
//\maha

IF li_prac_row_cnt = 0 THEN 
	If not ab_screen_painter Then of_set_defaults( adw_detail, 1 )
	adw_detail.SetItemStatus( 1, 0, Primary!, NotModified! )
END IF

IF ab_screen_painter THEN //maha 051305 ####
	adw_detail.Object.DataWindow.Detail.Height= 20000
else
	choose case ai_screen_id  
		case  - 20
			ll_max_height = 1480
		case else
			ll_max_height = ll_max_height + 20 
	end choose
	adw_detail.Object.DataWindow.Detail.Height= ll_max_height
end if
//adw_detail.Object.DataWindow.Detail.Height.AutoSize  //maha 092702 playing with size
//ls_detail_band_height = String(Integer(adw_detail.Object.DataWindow.Detail.Height))
//messagebox("ls_detail_band_height",ll_max_height)

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-35
//$<add> 03.13.2006 By: Cao YongWang
//$<reason> Performance tuning. 
//<modification> Save the datawindow syntax in the SDR files on local machine.
of_save_create_syntax(ai_data_view_id,ai_screen_id,adw_detail,'Y',string(idt_screen_cache),'D',ab_screen_painter)
of_save_create_syntax(ai_data_view_id,ai_screen_id,adw_browse,'N',string(idt_screen_cache),'D',ab_screen_painter)
//---------------------------- APPEON END ----------------------------
if ab_screen_painter = true then adw_detail.hscrollbar = true

//string ls_test_syn
//ls_test_syn = adw_detail.Describe("DataWindow.Syntax")
//openwithparm(w_sql_msg,ls_test_syn)

RETURN ls_return_syntax
end function

public function integer of_refresh_cache ();DateTime ldt_lookup_cache
DateTime ldt_screen_cache
DateTime ldt_screen_obj_cache

if gi_cache_set = 0 then //maha 092701
   //--------------------------- APPEON BEGIN ---------------------------
	//$<ID> PT-35
	//$<add> 01.17.2006 By: Cao YongWang
	//$<reason> Performance tuning.
	//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

	gnv_appeondb.of_startqueue()
	//---------------------------- APPEON END ----------------------------

	Select lookup_cache INTO :ldt_lookup_cache FROM ids;
	Select screen_cache INTO :ldt_screen_cache FROM ids;
	Select screen_obj_cache INTO :ldt_screen_obj_cache FROM ids;
	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> PT-36
	//$<add> 01.17.2006 By: Cao YongWang
	//$<reason> Performance tuning.
	//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

	gnv_appeondb.of_commitqueue()
	idt_screen_cache = ldt_screen_cache
	//---------------------------- APPEON END ----------------------------
	
	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> PT-37
	//$<comment> 01.17.2006 By: Cao YongWang
	//$<reason> Performance tuning.
	//$<reason> After Appeon's modification, the ids_address_dddw cache is no longer used in IntelliCred.
	/*
	IF ldt_lookup_cache <> gdt_lookup_cache THEN
		app_filler.ids_address_dddw.Retrieve()
	END IF
	*/
	//---------------------------- APPEON END ----------------------------

	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> PT-38
	//$<add> 01.17.2006 By: Cao YongWang
	//$<reason> Performance tuning.
	//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.
	gnv_appeondb.of_startqueue()
	//---------------------------- APPEON END ----------------------------
	IF ldt_screen_cache <> gdt_screen_cache THEN
			//MessageBox("", "Screen Cache Refreshed")
		if ib_report=false then
			app_filler.ids_screen_fields_cache.Retrieve()
		else
//			app_filler.ids_report_fields_cache.Retrieve()
		end if
	END IF
	
	
	IF ldt_screen_obj_cache <> gdt_screen_obj_cache THEN
		if ib_report=false then
			app_filler.ids_screen_objects_cache.Retrieve()
		else
//			app_filler.ids_report_objects_cache.Retrieve()
//			app_filler.ids_screen_report_objects_cache.Retrieve()
		end if
	END IF
	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> PT-39
	//$<add> 01.17.2006 By: Cao YongWang
	//$<reason> Performance tuning.
	//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.
	gnv_appeondb.of_commitqueue()
	//---------------------------- APPEON END ----------------------------
End if

Return 1
end function

public function integer of_get_next_seq_no (string as_dw, long al_rec_id);Integer li_row_cnt
Long ll_seq_no
n_ds l_ds

l_ds = CREATE n_ds

CHOOSE CASE as_dw
	CASE "department"
		l_ds.DataObject = "d_last_affill_dept_seq_no"
	CASE "staff cat"
		l_ds.DataObject = "d_last_affill_last_cat_seq_no"		
	CASE "comm review"
		l_ds.DataObject = "d_last_affill_comm_review_seq_no"			
	CASE "leave"
		l_ds.DataObject = "d_last_affill_leave"			
END CHOOSE


l_ds.SetTransObject( SQLCA )
li_row_cnt = l_ds.Retrieve( al_rec_id )
IF li_row_cnt > 0 THEN
	ll_seq_no = l_ds.GetItemNumber( 1, "last_seq_no" )
ELSE
	ll_seq_no = 0
END IF

IF IsNull( ll_seq_no ) THEN
	ll_seq_no = 1 
END IF

DESTROY l_ds


RETURN ll_seq_no

end function

public function integer of_add_address_link (long al_prac_id, integer ai_facility_id);//called from net dev of_add_multi

Integer li_address_cnt
Integer i
Integer li_nr
Long ll_address_id
n_ds lds_address_link
n_ds lds_all_addresses

lds_address_link = CREATE n_ds
lds_address_link.DataObject = "d_address_link"
long ll_addr_id //maha 02-26-01
integer cnt

lds_address_link.of_SetTransObject( SQLCA )

lds_all_addresses = CREATE n_ds
lds_all_addresses.DataObject = "d_address_link_all_addresses"
lds_all_addresses.of_SetTransObject( SQLCA )
li_address_cnt = lds_all_addresses.Retrieve( al_prac_id )

//for each address put an entry in the address link table for the new facility being added
FOR i = 1 TO li_address_cnt
	//\/maha 02-26-01 check to see if link already exists 
	ll_addr_id = lds_all_addresses.GetItemNumber( i, "rec_id" )	
	select count(*)
	into :cnt
	from pd_address_link
	where prac_id = :al_prac_id and facility_id = :ai_facility_id and address_id = :ll_addr_id;
	if cnt > 0 then continue
	//\maha
	li_nr = lds_address_link.InsertRow( 0 )	
	lds_address_link.SetItem( li_nr, "prac_id", al_prac_id )
	lds_address_link.SetItem( li_nr, "address_id", ll_addr_id )
	lds_address_link.SetItem( li_nr, "facility_id", ai_facility_id )
	lds_address_link.SetItem( li_nr, "billing", 0 )//maha app100305
	lds_address_link.SetItem( li_nr, "mailing", 0 )//maha app100305
//Start Code Change ---- 01.25.2006 #221 maha
	lds_address_link.SetItem( li_nr, "home_address", 0 )
	lds_address_link.SetItem( li_nr, "primary_office", 0 )
	lds_address_link.SetItem( li_nr, "additional_office", 0 )
	lds_address_link.SetItem( li_nr, "include_in_directory", 0 )
	lds_address_link.SetItem( li_nr, "exp_letters", 0 )
//End Code Change---01.25.2006 			
			
	
END FOR

IF lds_address_link.Update() <> 1 THEN
	MessageBox( "Update Error", "Error updating address link table." )
	DESTROY lds_address_link
	DESTROY lds_all_addresses
	RETURN -1
END IF


DESTROY lds_address_link
DESTROY lds_all_addresses

RETURN 1


end function

public function string of_create_dynamic_profile_dw (long al_prac_id, integer ai_data_view_id, integer ai_screen_id, u_dw adw_detail, u_dw adw_browse, boolean ab_screen_painter, integer ai_facility_id);SetPointer(HourGlass!)
Integer li_facility_specific
Integer li_sort_data_cnt
Integer m1
Integer li_dddw_code_cnt
Integer li_dddw_address_cnt
Integer li_row_cnt
Integer m
Integer li_index
Integer li_obj_cnt
Integer i
Integer li_key_cnt
Integer li_prac_row_cnt
Integer t
Integer li_col_cnt
Integer li_fld_label_width
Integer li_fld_width
Integer li_table_cnt
integer li_set //maha030702
Boolean ib_create_browse 
Boolean lb_table_found
Boolean lb_multi_tablE
Boolean lb_first_field = True
Boolean lb_has_active_status = False
String ls_italic
String ls_weight
String ls_retval
String ls_sort_syntax
String ls_month
String ls_fld_lbl_font_wght
String ls_detail_band_height
String ls_dummy_array[]
String ls_width
String ls_return_syntax
String ls_dddw_width[]
String ls_height
String ls_x
String ls_y
String ls_justification
String ls_text
String ls_obj_type
String ls_obj_name
String ls_field_x[] 
String ls_visible
String ls_field_y[]
String ls_field_label_x[]
String ls_field_label_height[]
String ls_field_label_y[] 
String ls_label_font_weight[]
String ls_field_label[]
String ls_field_id[]
String ls_mask[]
String ls_table_names[]
String ls_field_names[]
String ls_table_field_names[]
String ls_dw_field_names[]
String ls_key_fields_col_nm[]
String ls_field_underline[]
String ls_field_label_underline[]
String ls_temp_table
String ls_table_name
String ls_field_name
String ls_sql_syntax
String ls_grey
String ls_white
String ls_presentation_str
String ls_dwsyntax_str
String ERRORS
String ls_lookup_code
String ls_lookup_type
String ls_lookup_field
String ls_key_fields_syntax
String ls_key_fields[]
Long ll_detail_height
string widt
DataWindowChild dwchild
DataWindowChild dwchild_browse
//--------------------------- APPEON BEGIN ---------------------------
//$<add> 01.13.2006 By: Luke
//$<reason> Define a variable to be used in subsequent script.
integer set1
//---------------------------- APPEON END ----------------------------
ib_create_browse = True

IF adw_detail = adw_browse THEN
	ib_create_browse = False
END IF

is_column_default[] = ls_dummy_array[]
is_column_names[] = ls_dummy_array[]

//UNREGISTER ALL CALENDAR FIELDS

//IF gnv_app.of_get_field_object_cache()  THEN
//	ids_screen_fields.SetFilter( "data_view_id = " + String( ai_data_view_id ) +&
//								     " AND screen_id = " + String( ai_screen_id ) )
//	ids_screen_fields.Filter()
//	li_row_cnt = ids_screen_fields.RowCount()
//
//
//	ids_screen_objects.SetFilter( "data_view_id = " + String( ai_data_view_id ) +&
//									     " AND screen_id = " + String( ai_screen_id ) )
//	ids_screen_objects.Filter()								
//	li_obj_cnt = ids_screen_objects.RowCount()
//ELSE

	app_filler.ids_screen_fields_cache.ShareData( ids_screen_fields )
	ids_screen_fields.SetFilter( "view_id = " + String (ai_data_view_id) + " AND screen_id = " + String( ai_screen_id ) )
	ids_screen_fields.Filter( )	
	li_row_cnt = ids_screen_fields.RowCount()	

	app_filler.ids_screen_objects_cache.ShareData( ids_screen_objects )
	ids_screen_objects.SetFilter( "view_id = " + String (ai_data_view_id) + " AND screen_id = " + String( ai_screen_id ) )
	ids_screen_objects.Filter( )
	li_obj_cnt = ids_screen_objects.RowCount()
	
//	ids_screen_objects.DataObject = "d_screen_objects"
//	ids_screen_objects.of_SetTransObject( SQLCA )
//	li_obj_cnt = ids_screen_objects.Retrieve( ai_data_view_id, ai_screen_id )

////END IF


ii_column_cnt = 0

ls_sql_syntax = "SELECT "
li_table_cnt = 0

adw_detail.SetRedraw(False)


//messagebox("", li_row_cnt )
//BUILD SELECT 
FOR i = 1 TO li_row_cnt
	IF ( NOT ab_screen_painter AND ids_screen_fields.GetItemString(i, "visible") = "N" ) THEN
		CONTINUE
	END IF
	ii_column_cnt++
	ls_table_name = Trim( ids_screen_fields.GetItemString( i, "db_table_name" ))
	ls_field_name = Trim( ids_screen_fields.GetItemString( i, "db_field_name" ))
	is_table_name = ls_table_name
	is_column_names[ii_column_cnt] = ls_field_name	
	is_column_default[ii_column_cnt] = ids_screen_fields.GetItemString( i, "default_value" )
	ls_mask[i] = ids_screen_fields.GetItemString( i, "field_mask" ) 
	ls_field_names[i] = ls_field_name
	ls_field_underline[i] = ids_screen_fields.GetItemString( i, "data_view_fields_field_underline" ) 
	ls_field_label_underline[i] = ids_screen_fields.GetItemString( i, "data_view_fields_label_underline" ) 	
	ls_label_font_weight[i] = String( ids_screen_fields.GetItemNumber( i, "data_view_fields_font_wieght" ) 	 )
	ls_field_id[i] = String (ids_screen_fields.GetItemNumber( i, "field_id" ) )
	ls_field_x[i] = String (ids_screen_fields.GetItemNumber( i, "field_x" ) )
	ls_field_y[i] = String (ids_screen_fields.GetItemNumber( i, "field_y" ) )
	ls_field_label_height[i] = String (ids_screen_fields.GetItemNumber( i, "field_height" ) )
	ls_dddw_width[i] = String(ids_screen_fields.GetItemNumber(i, "drop_down_width"))
	ls_field_label_x[i] = String (ids_screen_fields.GetItemNumber( i, "field_label_x" ) )
	ls_field_label_y[i] = String (ids_screen_fields.GetItemNumber( i, "field_label_y" ) )	
	ls_table_field_names[i] = Mid( ls_table_name,5,100 ) + "_" + ls_field_name
	ls_field_label[i] = ids_screen_fields.GetItemString( i, "field_label" )
	ls_sql_syntax = ls_sql_syntax + ls_table_name + "." + ls_field_name + ", "
	ls_fld_lbl_font_wght = String (ids_screen_fields.GetItemNumber( i, "data_view_fields_font_wieght" ) )	
	lb_table_found = False
	FOR t = 1 TO li_table_cnt
		IF ls_table_names[t] = ls_table_name THEN
			lb_table_found = True
		   EXIT
		END IF
	END FOR
	IF NOT lb_table_found THEN
		li_table_cnt ++
		ls_table_names[ li_table_cnt ] = ls_table_name
	END IF
END FOR
ls_sql_syntax = Left( ls_sql_syntax, Len(ls_sql_syntax) -2 )

li_row_cnt = UpperBound(ls_field_names)

//ADD KEY FIELDS TO SELECT
li_key_cnt = 0
FOR i = 1 TO li_table_cnt
	ls_key_fields_syntax = ls_key_fields_syntax + ls_table_names[ i ] + ".prac_id, "
	li_key_cnt ++
	ls_key_fields[li_key_cnt] = ls_table_names[i] + ".prac_id"
	IF li_table_cnt > 1 THEN
		ls_key_fields_col_nm[li_key_cnt] = Mid(ls_table_names[ i ], 5, 100)  + "_prac_id"
	ELSE
		ls_key_fields_col_nm[li_key_cnt] = "prac_id"
	END IF

	li_key_cnt ++
	ls_key_fields_syntax = ls_key_fields_syntax + ls_table_names[ i ] + ".rec_id, "
	ls_key_fields[li_key_cnt] = ls_table_names[i] + ".rec_id"
	IF li_table_cnt > 1 THEN
		ls_key_fields_col_nm[li_key_cnt] = Mid(ls_table_names[ i ], 5, 100)  + "_rec_id"
		is_rec_id_col_nm = Mid(ls_table_names[ i ], 5, 100)  + "_rec_id"
	ELSE
		ls_key_fields_col_nm[li_key_cnt] = "rec_id"
		is_rec_id_col_nm = Mid(ls_table_names[ i ], 5, 100)  + "_rec_id"
	END IF
	
	IF ids_screen_fields.GetItemNumber(i, "facility_specific" ) = 1 THEN
		li_facility_specific = 1
		li_key_cnt ++
		ls_key_fields_syntax = ls_key_fields_syntax + ls_table_names[ i ] + ".facility_id, "
		ls_key_fields[li_key_cnt] = ls_table_names[i] + ".facility_id"
		IF li_table_cnt > 1 THEN
			ls_key_fields_col_nm[li_key_cnt] = Mid(ls_table_names[ i ], 5, 100)  + "_facility_id"
			is_rec_id_col_nm = Mid(ls_table_names[ i ], 5, 100)  + "_facility_id"
		ELSE
			ls_key_fields_col_nm[li_key_cnt] = "facility_id"
			is_rec_id_col_nm = Mid(ls_table_names[ i ], 5, 100)  + "_facility_id"
		END IF	
	END IF
	
	//added for tables with seq_no fields   JAD-6/06/02
	IF ai_screen_id = 61 THEN
		li_key_cnt ++
		ls_key_fields_syntax = ls_key_fields_syntax + ls_table_names[ i ] + ".seq_no, "
		ls_key_fields[li_key_cnt] = ls_table_names[i] + ".seq_no"
		IF li_table_cnt > 1 THEN
			ls_key_fields_col_nm[li_key_cnt] = Mid(ls_table_names[ i ], 5, 100)  + "_seq_no"
			is_rec_id_col_nm = Mid(ls_table_names[ i ], 5, 100)  + "_seq_no"
		ELSE
			ls_key_fields_col_nm[li_key_cnt] = "facility_id"
			is_rec_id_col_nm = Mid(ls_table_names[ i ], 5, 100)  + "_seq_no"
		END IF	
	END IF	
		
END FOR

ls_sql_syntax = Mid( ls_sql_syntax, 1, 7 ) + ls_key_fields_syntax + Mid(ls_sql_syntax, 8, 10000)

//IF ls_table_name = "pd_address" THEN  // instead of following run 2.0 update group Practice button.
//	ls_sql_syntax = ls_sql_syntax + ", gp_id"
//END IF
//messagebox("", ls_sql_syntax)

//ASSIGN DW FIELD NAMES
IF li_table_cnt > 1 THEN
	lb_multi_table = True
	FOR i = 1 TO li_row_cnt
		ls_dw_field_names[i] = ls_table_field_names[i]
	END FOR	
ELSE
	lb_multi_table = False
	FOR i = 1 TO li_row_cnt
		ls_dw_field_names[i] = ls_field_names[i]
	END FOR
END IF

//BUILD FROM CLAUSE
ls_sql_syntax = ls_sql_syntax + " FROM "
FOR i = 1 TO li_table_cnt
	ls_sql_syntax = ls_sql_syntax + ls_table_names[i] + ", "
END FOR
ls_sql_syntax = Left( ls_sql_syntax, Len(ls_sql_syntax) -2 )
ls_return_syntax = ls_sql_syntax
//ADD WHERE CLAUSE
ls_sql_syntax = ls_sql_syntax + " WHERE " + ls_table_names[1] + ".prac_id  = " + String( al_prac_id )

IF li_facility_specific = 1 THEN
	ls_sql_syntax = ls_sql_syntax + " AND " + ls_table_names[1] + ".facility_id  = " + String( ai_facility_id )
END IF

//CREATE SORT ORDER
ids_screen_fields.SetSort( "field_sort A" )
ids_screen_fields.Sort()
ls_sort_syntax = " ORDER BY "
FOR i = 1 TO li_row_cnt
	IF ids_screen_fields.GetItemNumber( i, "sort_field" ) > 0 THEN
		IF ids_screen_fields.GetItemString( i, "sort_order" ) = "D" THEN
			ls_sort_syntax = ls_sort_syntax + ids_screen_fields.GetItemString( i, "db_field_name" ) + " DESC,"			
		ELSE
			ls_sort_syntax = ls_sort_syntax + ids_screen_fields.GetItemString( i, "db_field_name" ) + " ASC,"			
		END IF
		li_sort_data_cnt ++
	END IF
END FOR
//ADD GROUP BY CLAUSE
IF li_sort_data_cnt > 0 THEN
	ls_sort_syntax = Mid( ls_sort_syntax, 1, Len( ls_sort_syntax )-1 )
	ls_sql_syntax = ls_sql_syntax + ls_sort_syntax
END IF
ids_screen_fields.SetSort( "field_order A" )
ids_screen_fields.Sort()

//CREATE SYNTAX FOR DETAIL DW

ls_grey = "80269524"//String(rgb(192,192,192))
ls_presentation_str = "style(type=form)" + " Column(Border=2 ) Datawindow(Color=16777215 )" + "Text(Background.Color=16777215)"  
//openwithparm( w_sql_msg, ls_sql_syntax )
ls_dwsyntax_str = SQLCA.SyntaxFromSQL(ls_sql_syntax, &
	ls_presentation_str, ERRORS)

IF Len(ERRORS) > 0 THEN
	MessageBox("Caution", &
	"SyntaxFromSQL caused these errors: " + ERRORS)
	RETURN "-1"
END IF

adw_detail.Create( ls_dwsyntax_str, ERRORS)

IF Len(ERRORS) > 0 THEN
	MessageBox("Caution", &
	"Create cause these errors: " + ERRORS)
	RETURN "-1"
END IF

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> UM-08
//$<add> 01.13.2006 By: Luke
//$<reason> It is currently unsupported to automatically change a column's edit style on the Web.
//$<modification> Modify the DataWindow syntax and then rebuild the DataWindow to
//$<modification> implement the functionality of changing a column's edit style.

If appeongetclienttype() <> 'PB' Then
	string ls_appeon_colname[]
	long li_appeon_index
	
	ls_dwsyntax_str = adw_detail.describe("datawindow.syntax")
	li_appeon_index = 1
	
	FOR i = 1 TO li_row_cnt
		IF ls_dw_field_names[i] = "active_status" THEN
			ls_appeon_colname[li_appeon_index] = ls_dw_field_names[i]
			li_appeon_index++
		END IF
	
		IF ids_screen_fields.GetItemString( i, "lookup_field") = "Y" AND NOT ab_screen_painter THEN
			ls_appeon_colname[li_appeon_index] = ls_dw_field_names[i]
			li_appeon_index++
		END IF
	END FOR
	
	//specail code for pd_address
	IF ls_table_name = "pd_address" THEN
		set1 = of_get_app_setting("set_1","I")
		
		if set1 = 1 then //maha 072301 create populate button only if using addresses for find
			ls_appeon_colname[li_appeon_index] = 'street'
			li_appeon_index++
		end if
					
		ls_appeon_colname[li_appeon_index] = 'billing_address_id'
		li_appeon_index++
	END IF
	
	of_change_to_dddw (ls_dwsyntax_str,ls_appeon_colname)
	adw_detail.Create( ls_dwsyntax_str, ERRORS)
	
	IF Len(ERRORS) > 0 THEN
		MessageBox("Caution", &
		"Create cause these errors: " + ERRORS + ls_dwsyntax_str)
		clipboard(ls_dwsyntax_str)
		RETURN "-1"
	End if
End If
//---------------------------- APPEON END ----------------------------



//CREATE SYNTAX FOR BROWSE DW
ib_create_browse = False
IF ib_create_browse THEN
	//ls_grey = String(rgb(192,192,192))
	ls_white = String(rgb(255,255,255))
	ls_presentation_str = "style(type=grid)" + " Column(Border=0) Datawindow(Color=" + ls_grey + " )" + "Text(Border=6 Background.Color=" + ls_grey + ")"


	ls_dwsyntax_str = SQLCA.SyntaxFromSQL(ls_sql_syntax, &
		ls_presentation_str, ERRORS)

	IF Len(ERRORS) > 0 THEN
		MessageBox("Caution", &
		"SyntaxFromSQL caused these errors: " + ERRORS)
		RETURN "-1"
	END IF

	adw_browse.Create( ls_dwsyntax_str, ERRORS)

	IF Len(ERRORS) > 0 THEN
		MessageBox("Caution", &
		"Create cause these errors: " + ERRORS)
		RETURN "-1"
	END IF
	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> UM-09
	//$<add> 01.13.2006 By: Luke
	//$<reason> It is currently unsupported to automatically change a column's edit style on the Web.
	//$<modification> Modify the DataWindow syntax and then rebuild the DataWindow to
	//$<modification> implement the functionality of changing a column's edit style.
	If appeongetclienttype()<> 'PB' Then
		ls_dwsyntax_str = adw_browse.describe("datawindow.syntax")
		li_appeon_index = 1
		
		FOR i = 1 TO li_row_cnt
			IF ls_dw_field_names[i] = "active_status" THEN
				ls_appeon_colname[li_appeon_index] = ls_dw_field_names[i]
				li_appeon_index++
			END IF
		
			IF ids_screen_fields.GetItemString( i, "lookup_field") = "Y" AND NOT ab_screen_painter THEN
				ls_appeon_colname[li_appeon_index] = ls_dw_field_names[i]
				li_appeon_index++
			END IF
		END FOR
		
		//specail code for pd_address
		IF ls_table_name = "pd_address" THEN
			set1 = of_get_app_setting("set_1","I")
			
			if set1 = 1 then //maha 072301 create populate button only if using addresses for find
				ls_appeon_colname[li_appeon_index] = 'street'
				li_appeon_index++
			end if
						
			ls_appeon_colname[li_appeon_index] = 'billing_address_id'
			li_appeon_index++
		END IF	
	
		of_change_to_dddw (ls_dwsyntax_str,ls_appeon_colname)
		adw_browse.Create( ls_dwsyntax_str, ERRORS)
		
		IF Len(ERRORS) > 0 THEN
			MessageBox("Caution", &
			"Create cause these errors: " + ERRORS + ls_dwsyntax_str)
			clipboard(ls_dwsyntax_str)
			RETURN "-1"
		End If
	End If
	//---------------------------- APPEON END ----------------------------
END IF
	

IF NOT ab_screen_painter THEN
	adw_detail.of_SetTransObject( SQLCA )
	li_prac_row_cnt = adw_detail.Retrieve()
END IF

IF li_prac_row_cnt = 0 THEN 
	adw_detail.InsertRow(0)
	IF IsValid( m_pfe_cst_data_entry ) THEN
		gnv_app.of_modify_menu_attr( m_pfe_cst_data_entry.m_edit.m_addverificationentry,'Enabled', False)
	END IF
ELSE
	IF IsValid( m_pfe_cst_data_entry ) THEN
		gnv_app.of_modify_menu_attr( m_pfe_cst_data_entry.m_edit.m_addverificationentry,'Enabled', True)
	END IF
	//of_set_defaults( adw_detail, 1 )
	//adw_detail.SetItemStatus( 1, 0, Primary!, NotModified! )
END IF


IF	lb_multi_table THEN
	//adw_detail.of_SetMultiTable(TRUE)
	//FOR i = 1 TO li_table_cnt
		//adw_detail.inv_multitable.of_Register( ls_table_names[I], ls_table_2_fields, ls_table_2_update_fields, TRUE, 0)
	//END FOR
ELSE
	adw_detail.Object.DataWindow.Table.UpdateTable= ls_table_names[1]
	adw_detail.Object.DataWindow.Table.UpdateWhere= '0'
	adw_detail.Object.DataWindow.Table.UpdateKeyinPlace = 'Yes'
	FOR i = 1 TO li_row_cnt		
		adw_detail.Modify( ls_dw_field_names[i] + ".Update= Yes")	
		IF Pos( ls_dw_field_names[i], "prac_id" ) > 0  OR Pos( ls_dw_field_names[i], "rec_id" ) > 0 THEN
			adw_detail.Modify( ls_dw_field_names[i] + ".Key=Yes")
		END IF
	END FOR
END IF

IF ib_create_browse THEN
	adw_detail.ShareData(adw_browse)
END IF
//messagebox("",  Long( adw_detail.Object.DataWindow.Detail.Height) )
//IF Long( adw_detail.Object.DataWindow.Detail.Height) > 1800 THEN
//IF Long( adw_detail.Object.DataWindow.Detail.Height) > ( adw_detail.Height + 50 ) THEN
//adw_detail.Object.DataWindow.Detail.Height= 5000
adw_detail.Modify("active_status.Initial='1'")
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-40
//$<add> 02.15.2006 By: Cao YongWang
//$<reason> Performance tuning.
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.
gnv_appeondb.of_startqueue()
//---------------------------- APPEON END ----------------------------

FOR i = 1 TO li_row_cnt
	IF NOT ab_screen_painter AND ids_screen_fields.GetItemString(i, "visible") = "N" THEN
		CONTINUE
	END IF
	//visible
	IF ab_screen_painter THEN
		IF ids_screen_fields.GetItemString(i, "visible") = "N" THEN
			adw_detail.Modify(ls_dw_field_names[i] + ".color = '8421504'") 
			adw_detail.Modify(ls_dw_field_names[i] + ".background.color = '12632256'") 
			adw_detail.Modify(ls_dw_field_names[i] + "_t.color = '8421504'") 
		ELSE
			adw_detail.Modify(ls_dw_field_names[i] + ".color = '0'") 
			adw_detail.Modify(ls_dw_field_names[i] + "_t.color = '0'")
			adw_detail.Modify(ls_dw_field_names[i] + ".background.color = '16777215'") 		
		END IF
	END IF

	IF ab_screen_painter THEN
		adw_detail.Modify( ls_dw_field_names[i] + ".TabSequence = '0'" )
		adw_detail.Modify( ls_dw_field_names[i] + ".dbname = '" + String( i * 10) + "'" )
	ELSE
		IF Len(ls_dw_field_names[i]) > 0 AND lb_first_field THEN
			lb_first_field = False
			is_first_column = ls_dw_field_names[i]
		END IF
		adw_detail.Modify( ls_dw_field_names[i] + ".TabSequence = '" + String(i) + "'" )		
	END IF
	
	if isnull(ls_field_label[i]) then ls_field_label[i] = '' //Jervis 02.18.2008
	IF ib_create_browse THEN
		adw_browse.Modify( ls_dw_field_names[i] + ".TabSequence = '0'" )
		adw_browse.Modify( ls_dw_field_names[i] + "_t.text = '" + ls_field_label[i] + "'")	
	END IF
	
	adw_detail.Modify( ls_dw_field_names[i] + "_t.Font.Underline = '" + ls_field_label_underline[i] + "'") 
	adw_detail.Modify( ls_dw_field_names[i] + ".Font.Underline = '" + ls_field_underline[i] + "'") 	
	
	IF adw_detail.tag = "Preview" THEN
		adw_detail.Modify( ls_dw_field_names[i] + "_t.Border = '0'")
		adw_detail.Modify( ls_dw_field_names[i] + ".Border = '0'")
	ELSE
		adw_detail.Modify( ls_dw_field_names[i] + "_t.Border = '2'")
		adw_detail.Modify( ls_dw_field_names[i] + ".Border = '2'")		
	END IF

	//bold or not?
	adw_detail.Modify( ls_dw_field_names[i] + "_t.font.weight = '" + String(ls_label_font_weight[i]) + "'")	

	//adw_detail.Modify( ls_dw_field_names[i] + "_t.font.weight = '" + ls_fld_lbl_font_wght + "'")	


	li_fld_label_width = ids_screen_fields.GetItemNumber( i, "field_label_width" )
	li_fld_width = ids_screen_fields.GetItemNumber( i, "field_width" ) 
	adw_detail.Modify( ls_dw_field_names[i] + ".width = '" + String( li_fld_width ) + "'" )	
	adw_detail.Modify( ls_dw_field_names[i] + "_t.width = '" + String( li_fld_label_width ) + "'" )
	adw_detail.Modify( ls_dw_field_names[i] + ".height = '" + String( ls_field_label_height[i] ) + "'" )

	IF ib_create_browse THEN
		IF li_fld_width < li_fld_label_width THEN
			adw_browse.Modify( ls_dw_field_names[i] + ".width = '" + String( li_fld_label_width ) + "'" )
		ELSE
			adw_browse.Modify( ls_dw_field_names[i] + ".width = '" + String( li_fld_width ) + "'" )
		END IF
	END IF

	
	IF ls_field_x[i] = "0" THEN
		adw_detail.Modify( ls_dw_field_names[i] + ".x = 750")
		adw_detail.Modify( ls_dw_field_names[i] + ".y = " + String(i*100) )

		adw_detail.Modify( ls_dw_field_names[i] + "_t.x = 100")
		adw_detail.Modify( ls_dw_field_names[i] + "_t.y = " + String(i*100) )
	ELSE
		adw_detail.Modify( ls_dw_field_names[i] + ".x = " + ls_field_x[i] )
		adw_detail.Modify( ls_dw_field_names[i] + ".y = " + ls_field_y[i] )

		adw_detail.Modify( ls_dw_field_names[i] + "_t.x = " + ls_field_label_x[i] )
		adw_detail.Modify( ls_dw_field_names[i] + "_t.y = " + ls_field_label_y[i] )		
	END IF

	//tag value set to field id
	adw_detail.Modify( ls_dw_field_names[i] + ".tag = '" + ls_field_id[i] + "'" )
	adw_detail.Modify( ls_dw_field_names[i] + "_t.tag = '" + ls_field_id[i] + "'" )

	//alignment
	adw_detail.Modify( ls_dw_field_names[i] + ".alignment = '" + ids_screen_fields.GetItemString( i, "justification" ) + "'" )	
	adw_detail.Modify( ls_dw_field_names[i] + "_t.alignment = '" + String( ids_screen_fields.GetItemNumber( i, "field_label_justification" ) ) + "'" )	

	IF ib_create_browse THEN
		adw_browse.Modify( ls_dw_field_names[i] + ".alignment = '" + ids_screen_fields.GetItemString( i, "justification" ) + "'" )	
		adw_browse.Modify( ls_dw_field_names[i] + "_t.alignment = '" + String( ids_screen_fields.GetItemNumber( i, "field_label_justification" ) ) + "'" )	
	END IF
	
	IF ls_dw_field_names[i] = "active_status" THEN
		adw_detail.Modify( ls_dw_field_names[i] + ".dddw.VscrollBar = Yes")			
		adw_detail.Modify( ls_dw_field_names[i] + ".dddw.useasborder = No")			
		adw_detail.Modify( ls_dw_field_names[i] + ".dddw.NilIsNull= Yes")
		adw_detail.Modify( ls_dw_field_names[i] + ".dddw.Lines= 15")
		adw_detail.Modify( ls_dw_field_names[i] + "_t.font.underline = '1'")
		adw_detail.Modify( ls_dw_field_names[i] + ".dddw.Required = No")
		adw_detail.Modify( ls_dw_field_names[i] + ".dddw.name = 'd_code_lookup_active_inactive'")
		adw_detail.Modify( ls_dw_field_names[i] + ".dddw.datacolumn = 'lookup_code'")			
		adw_detail.Modify( ls_dw_field_names[i] + ".dddw.displaycolumn = 'description'")						

		IF ib_create_browse THEN
			adw_browse.Modify( ls_dw_field_names[i] + ".dddw.VscrollBar = Yes")			
			adw_browse.Modify( ls_dw_field_names[i] + ".dddw.useasborder = No")			
			adw_browse.Modify( ls_dw_field_names[i] + ".dddw.NilIsNull= Yes")
			adw_browse.Modify( ls_dw_field_names[i] + ".dddw.Lines= 15")
			adw_browse.Modify( ls_dw_field_names[i] + "_t.font.underline = '1'")
			adw_browse.Modify( ls_dw_field_names[i] + ".dddw.Required = No")
			adw_browse.Modify( ls_dw_field_names[i] + ".dddw.name = 'd_code_lookup_active_inactive'")
			adw_browse.Modify( ls_dw_field_names[i] + ".dddw.datacolumn = 'lookup_code'")			
			adw_browse.Modify( ls_dw_field_names[i] + ".dddw.displaycolumn = 'description'")								
		END IF
	END IF
		IF UPPER(ls_lookup_field) = "ENTITY_NAME" THEN

		END IF
	IF ids_screen_fields.GetItemString( i, "lookup_field") = "Y" AND NOT ab_screen_painter THEN
		ls_lookup_code = ids_screen_fields.GetItemString( i, "lookup_code" )
		ls_lookup_field = ids_screen_fields.GetItemString( i, "lookup_field_name" )
		ls_lookup_type = ids_screen_fields.GetItemString( i, "lookup_type" )
		adw_detail.Modify( ls_dw_field_names[i] + ".dddw.VscrollBar = Yes")			
		adw_detail.Modify( ls_dw_field_names[i] + ".dddw.AutoHScroll = Yes")			
		adw_detail.Modify( ls_dw_field_names[i] + ".dddw.useasborder = No")			
		adw_detail.Modify(ls_dw_field_names[i] + ".dddw.NilIsNull= Yes")
		adw_detail.Modify(ls_dw_field_names[i] + ".dddw.Lines= 15")
		IF ids_screen_fields.GetItemString(i, "required") = "Y" THEN
			adw_detail.Modify(ls_dw_field_names[i] + "_t.font.underline = '1'")
			adw_detail.Modify(ls_dw_field_names[i] + ".dddw.Required = No")
		END IF	
		IF ls_lookup_type = "C" THEN
			adw_detail.Modify( ls_dw_field_names[i] + ".dddw.name = 'd_dddw_code_lookup'")
			adw_detail.Modify( ls_dw_field_names[i] + ".dddw.datacolumn = 'lookup_code'")			
			
			IF ib_create_browse = True THEN
				adw_browse.Modify( ls_dw_field_names[i] + ".dddw.name = 'd_dddw_code_lookup'")
				adw_browse.Modify( ls_dw_field_names[i] + ".dddw.datacolumn = 'lookup_code'")	
			END IF
			
			IF Upper( ls_lookup_field ) = "CODE" THEN
				adw_detail.Modify( ls_dw_field_names[i] + ".dddw.displaycolumn = 'code'")
				IF ib_create_browse = True THEN				
					adw_browse.Modify( ls_dw_field_names[i] + ".dddw.displaycolumn = 'code'")
				END IF
			ELSE
				adw_detail.Modify( ls_dw_field_names[i] + ".dddw.displaycolumn = 'description'")				
				IF ib_create_browse = True THEN				
					adw_browse.Modify( ls_dw_field_names[i] + ".dddw.displaycolumn = 'description'")								
				END IF
			END IF
		ELSEIF ls_lookup_type = "A" THEN
			adw_detail.Modify( ls_dw_field_names[i] + ".dddw.HscrollBar = Yes")			
			adw_detail.Modify( ls_dw_field_names[i] + ".dddw.name = 'd_dddw_address_lookup'")
			adw_detail.Modify( ls_dw_field_names[i] + ".dddw.datacolumn = 'lookup_code'")		

			IF ib_create_browse = True THEN				
				adw_browse.Modify( ls_dw_field_names[i] + ".dddw.name = 'd_dddw_address_lookup'")						
				adw_browse.Modify( ls_dw_field_names[i] + ".dddw.datacolumn = 'lookup_code'")			
			END IF
			
			IF Upper( ls_lookup_field ) = "CODE" THEN
				adw_detail.Modify( ls_dw_field_names[i] + ".dddw.displaycolumn = 'code'")
				IF ib_create_browse = True THEN								
					adw_browse.Modify( ls_dw_field_names[i] + ".dddw.displaycolumn = 'code'")
				END IF
			ELSE
				adw_detail.Modify( ls_dw_field_names[i] + ".dddw.displaycolumn = 'entity_name'")			
				IF ib_create_browse = True THEN								
					adw_browse.Modify( ls_dw_field_names[i] + ".dddw.displaycolumn = 'entity_name'")						
				END IF
			END IF
		END IF
		
		//adw_detail.Modify( ls_dw_field_names[i] + ".dddw.AllowEdit = Yes")
		adw_detail.Modify( ls_dw_field_names[i] + ".dddw.VScrollBar = Yes")
		//adw_detail.Modify( ls_dw_field_names[i] + ".dddw.HScrollBar = Yes")
		adw_detail.Modify( ls_dw_field_names[i] + ".dddw.PercentWidth = '" + ls_dddw_width[i] + "'")
		adw_detail.GetChild( ls_dw_field_names[i] , dwchild )

		//IF ib_create_browse = True THEN						
		adw_browse.GetChild( ls_dw_field_names[i] , dwchild_browse )
		dwchild.SetTransObject( SQLCA )
		//END IF
	
	
		is_dddwcolumns[upperbound(is_dddwcolumns) + 1] = ls_dw_field_names[i]


		IF ls_lookup_type = "A" THEN
			//--------------------------- APPEON BEGIN ---------------------------
			//$<ID> PT-41
			//$<modify> 01.17.2006 By: Cao YongWang
			//$<reason> After Appeon's modification, the ids_address_dddw cache is no longer used in IntelliCred.
//			app_filler.ids_address_dddw.ShareData( dwchild )
//			dwchild.SetFilter( "lookup_name = '" + ls_lookup_code + "'" )
//			dwchild.Filter()	
			dwchild.Retrieve(ls_lookup_code)
			//---------------------------- APPEON END ----------------------------
		ELSE
			dwchild.Retrieve(ls_lookup_code)
		END IF		
		dwchild.InsertRow(1)
		dwchild.ShareData( dwchild_browse )
	ELSEIF ls_dw_field_names[i] <> "active_status" THEN
		adw_detail.Modify(ls_dw_field_names[i] + ".Edit.NilIsNull= Yes")
		IF ls_mask[i] <> "" THEN
			adw_detail.Modify( ls_dw_field_names[i] + ".Edit.CodeTable = Yes")
			adw_detail.Modify( ls_dw_field_names[i] + ".Edit.ValidateCode = Yes" )
			adw_detail.Modify( ls_dw_field_names[i] + ".ValidationMsg = 'Invalid Month, Select a number from 1 and 12.'" )
			//adw_detail.Modify( ls_dw_field_names[i] + ".EditMask.Mask='" + ls_mask[i] + "'")
			IF ls_mask[i] = "##" THEN
				FOR m = 1 TO 12
					ls_month = String(m)
					adw_detail.SetValue( ls_dw_field_names[i], m, ls_month + "~t" + ls_month )
				END FOR
				m1 = 0
				FOR m = 13 TO 21
					m1++
					ls_month = "0" + String(m1)
					adw_detail.SetValue( ls_dw_field_names[i], m, ls_month + "~t" + ls_month )
				END FOR
				adw_detail.Modify( ls_dw_field_names[i] + ".Edit.Limit = '2'" )			
				
			ELSEIF ls_mask[i] = "(###)###-####" THEN
				//adw_detail.Modify( ls_dw_field_names[i] + ".EditMask.Mask='(###)###-####'" )		//Comment by Scofield on 2008-08-12
			ELSEIF ls_mask[i] = "###-##-####" THEN
				adw_detail.Modify( ls_dw_field_names[i] + ".EditMask.Mask='###-##-####'")		
			ELSEIF ls_mask[i] = "#####-####" THEN
				adw_detail.Modify( ls_dw_field_names[i] + ".EditMask.Mask='#####-####'" )				
			ELSEIF ls_mask[i] = "####" THEN
				li_index = 0
				FOR m = 1880 TO 2050
					li_index++
					adw_detail.SetValue( ls_dw_field_names[i], li_index, String(m) + "~t" + String(m) )
				END FOR
				adw_detail.Modify( ls_dw_field_names[i] + ".Edit.Limit = '4'" )			
				adw_detail.Modify( ls_dw_field_names[i] + ".ValidationMsg = 'Invalid Year, Select a number between 1880 and 2050.'" )
			ELSEIF ls_mask[i] = "mm/dd/yyyy" THEN
				//adw_detail.Modify( ls_dw_field_names[i] + ".EditMask.Mask ='mm/dd/yyyy'")
				adw_detail.Modify( ls_dw_field_names[i] + ".Format='mm/dd/yyyy'")
				IF ib_create_browse = True THEN				
					adw_browse.Modify( ls_dw_field_names[i] + ".Format='mm/dd/yyyy'")
				END IF
			ELSEIF ls_mask[i] = "#,##0.00" THEN
				adw_detail.Modify( ls_dw_field_names[i] + ".Format='#,##0'")
				IF ib_create_browse = True THEN								
					adw_browse.Modify( ls_dw_field_names[i] + ".Format='#,##0'")
				END IF
			END IF
		END IF	
	END IF
END FOR
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-42
//$<add> 02.15.2006 By: Cao YongWang
//$<reason> Performance tuning.
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.
gnv_appeondb.of_commitqueue()
If appeongetclienttype() <> 'PB' Then of_dwchild_after_retrieve_2(adw_detail)
//---------------------------- APPEON END ----------------------------

FOR i = 1 TO li_key_cnt
	adw_detail.Modify( ls_key_fields_col_nm[i] + ".visible = '0'")
	adw_detail.Modify( ls_key_fields_col_nm[i] + "_t.visible = '0'")
	IF ib_create_browse = True THEN					
		adw_browse.Modify( ls_key_fields_col_nm[i] + ".visible = '0'")
		adw_browse.Modify( ls_key_fields_col_nm[i] + "_t.visible = '0'")
	END IF
END FOR


//ls_detail_band_height = String(Integer(adw_detail.Object.DataWindow.Detail.Height) - 200)

//messagebox("ls_detail_band_height",ls_detail_band_height)

adw_detail.SetRedraw(True)

//adw_detail.Modify("create groupbox(band=detail text='End of Detail border='5' color='255' x='1' y='" + ls_detail_band_height + "' height='50' width='3000'  font.face='MS Sans Serif' font.height='-8' font.weight='400'  font.family='2' font.pitch='2' font.charset='0' background.mode='1' background.color='553648127' name=detail_band"  )


//CREATE ANY SCREEN OBJECTS THAT WERE ADDED
FOR i = 1 TO li_obj_cnt
	ls_obj_type = ids_screen_objects.GetItemString(i, "object_type") 
	ls_obj_name = "object"+String( ids_screen_objects.GetItemNumber(i, "data_view_object_id") )
	ls_width = String( ids_screen_objects.GetItemNumber(i, "object_width") )
	ls_height = String( ids_screen_objects.GetItemNumber(i, "object_height") )
	ls_x = String( ids_screen_objects.GetItemNumber(i, "object_x") )
	ls_y = String( ids_screen_objects.GetItemNumber(i, "object_y") )
	ls_text = ids_screen_objects.GetItemString(i, "object_text") 
	ls_weight =  String( ids_screen_objects.GetItemNumber(i, "object_bold")  )
	ls_italic =  String( ids_screen_objects.GetItemNumber(i, "object_italic")  )	
	ls_justification = String( ids_screen_objects.GetItemNumber(i, "object_alignment") )
	CHOOSE CASE ls_obj_type
		CASE "B"
			adw_detail.Modify("create groupbox(band=detail text='" + ls_text + "' border='5' color='128' x='" + ls_x + "' y='" + ls_y + "' height='" + ls_height + "' width='" + ls_width + "'  font.face='MS Sans Serif' font.height='-8' font.weight='400'  font.family='2' font.pitch='2' font.charset='0' background.mode='1' background.color='553648127' name=" + ls_obj_name +")")
		CASE "T"
			adw_detail.Modify("create text(band=detail text='" + ls_text + "' border='0' color='128' x='" + ls_x + "' y='" + ls_y + "' height='" + ls_height + "' width='" + ls_width + "'  font.face='MS Sans Serif' font.height='-8' font.weight='400'  font.family='2' font.pitch='2' font.charset='0' background.mode='1' background.color='553648127' name=" + ls_obj_name + "_t)" )
			adw_detail.Modify( ls_obj_name + "_t.alignment='"  + ls_justification + "'" )
			adw_detail.Modify( ls_obj_name + "_t.font.weight='"  + ls_weight + "'" )			
			adw_detail.Modify( ls_obj_name + "_t.font.italic='"  + ls_italic + "'" )						
	END CHOOSE
END FOR

IF ls_table_name = "pd_address" THEN
	//adw_detail.Modify("create button(band=detail text='Address Links...' filename=''action='0' border='1' color='128' x='1822' y='110' height='104' width='500' vtextalign='0' htextalign='0'  font.face='MS Sans Serif' font.height='-8' font.weight='700'  font.family='2' font.pitch='2' font.charset='0' background.mode='2' background.color='12632256' name = linkbutton)")
	
	//address drop down
	
	//adw_detail.Modify("create button(band=detail text='Find' filename=''action='0' border='1' color='128' x='1822' y='285' height='85' width='200' vtextalign='0' htextalign='0'  font.face='MS Sans Serif' font.height='-8' font.weight='700'  font.family='2' font.pitch='2' font.charset='0' background.mode='2' background.color='12632256' name = findbutton)")
	
//	integer set1
//	select set_1
//	into :set1
//	from icred_settings;
	set1 = of_get_app_setting("set_1","I")
	
	if set1 = 1 then //maha 072301 create populate button only if using addresses for find
		adw_detail.Modify("create button(band=detail text='Populate' filename=''action='0' border='1' color='128' x='2010' y='285' height='85' width='280' vtextalign='0' htextalign='0'  font.face='MS Sans Serif' font.height='-8' font.weight='700'  font.family='2' font.pitch='2' font.charset='0' background.mode='2' background.color='12632256' name = populatebutton)")		
		adw_detail.Modify( "street.dddw.VscrollBar = Yes")			
		adw_detail.Modify( "street.dddw.useasborder = Yes")			
		adw_detail.Modify( "street.dddw.AllowEdit = Yes")			
		adw_detail.Modify( "street.dddw.NilIsNull= Yes")
		//adw_detail.Modify( "street.dddw.Lines= 15")
		adw_detail.Modify( "street.dddw.PercentWidth = '200'")	
		adw_detail.Modify( "street.dddw.name = 'd_dddw_addresses'")
		adw_detail.Modify( "street.dddw.datacolumn = 'rec_id'")			
		adw_detail.Modify( "street.dddw.displaycolumn = 'street'")	
	end if
	
	//add drop down for billing address
	ls_retval = adw_detail.Modify( "billing_address_id.dddw.VscrollBar = Yes")			
	adw_detail.Modify( "billing_address_id.dddw.useasborder = Yes")			
	adw_detail.Modify( "billing_address_id.dddw.NilIsNull= Yes")
	adw_detail.Modify( "billing_address_id.dddw.Lines= 15")
	adw_detail.Modify( "billing_address_id_t.font.underline = '1'")
	adw_detail.Modify( "billing_address_id.dddw.Required = No")
	adw_detail.Modify( "billing_address_id.dddw.name = 'd_dddw_billing_addresses'")
	adw_detail.Modify( "billing_address_id.dddw.datacolumn = 'pd_address_rec_id'")			
	adw_detail.Modify( "billing_address_id.dddw.displaycolumn = 'address'")								
	adw_detail.GetChild( "billing_address_id", dwchild )
	IF Len( ls_retval ) = 0 THEN
		dwchild.SetTransObject( SQLCA )
		dwchild.Retrieve( al_prac_id )
	END IF
	
//	dwchild.InsertRow( 1 )
//	dwchild.SetItem( 1, "pd_address_street", "N/A" )	
//	dwchild.SetItem( 1, "pd_address_city", "" )
//	dwchild.SetItem( 1, "code_lookup_code", "" )
//	dwchild.SetItem( 1, "pd_address_rec_id", -1 )	
//	dwchild.InsertRow( 1 )
//	dwchild.SetItem( 1, "pd_address_street", "Same" )	
//	dwchild.SetItem( 1, "pd_address_city", "" )
//	dwchild.SetItem( 1, "code_lookup_code", "" )
//	dwchild.SetItem( 1, "pd_address_rec_id", 0 )
//	dwchild.InsertRow( 1 )
//	dwchild.SetItem( 1, "pd_address_street", "" )	
//	dwchild.SetItem( 1, "pd_address_city", "" )
//	dwchild.SetItem( 1, "code_lookup_code", "" )

	
END IF

//\/maha 062701
IF li_prac_row_cnt = 0 THEN 
	of_set_defaults( adw_detail, 1 )
	adw_detail.SetItemStatus( 1, 0, Primary!, NotModified! )
END IF

//adw_detail.Object.DataWindow.Detail.Height.AutoSize  //maha 092702 playing with size
//ls_detail_band_height = String(Integer(adw_detail.Object.DataWindow.Detail.Height))
//messagebox("ls_detail_band_height",ls_detail_band_height)

//adw_detail.Modify("DataWindow.Print.Margin.Bottom='1'")
//adw_detail.Modify("DataWindow.Print.Margin.Top='1'")
//adw_detail.Modify("DataWindow.Print.Margin.Left='1'")
//adw_detail.Modify("DataWindow.Print.Margin.Right='1'")

IF adw_detail.tag = "Preview" THEN
	adw_detail.Modify("DataWindow.Print.Preview=Yes")
	adw_detail.Modify("DataWindow.Print.Preview.Rulers=Yes")
END IF


RETURN ls_return_syntax
end function

public function integer of_get_facil_specific (integer ai_table);//this is for checking if a table is facility specific mmaha 111502

integer li_fs
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-43
//$<modify> 02.13.2006 By: Cao YongWang
//$<reason> Performance tuning.
//$<modification> Write script to retrieve data from a cache instead of from the database.
/*
select facility_specific into :li_fs from sys_tables where table_id = :ai_table;
*/
li_fs = integer(gnv_data.of_getitem("sys_tables" , "facility_specific" , "table_id = " + string(ai_table)))
//---------------------------- APPEON END ----------------------------

return li_fs
end function

public function integer of_add_hosp_link (long ai_facility_id, long al_prac_id);//called from net dev of_add_multi  maha 011003

Integer li_hosp_cnt
Integer i
Integer li_nr
Integer li_found
long ll_rec //maha 121702
Long ll_hosp_id
n_ds lds_hosp_link
n_ds lds_all_hosp


//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-44
//$<add> 02.22.2006 By: LeiWei
//$<reason> Performance tuning
//$<Modification> Reduce the client-server interactions to improve runtime performance.
//$<Modification> Add the Appeon Start Queue label. 
gnv_appeondb.of_startqueue( )
//---------------------------- APPEON END ----------------------------

lds_hosp_link = CREATE n_ds
lds_hosp_link.DataObject = "d_hf_link"
lds_hosp_link.of_SetTransObject( SQLCA )
lds_hosp_link.Retrieve( al_prac_id )

lds_all_hosp = CREATE n_ds
lds_all_hosp.DataObject = "d_hosp_affil_prac"
lds_all_hosp.of_SetTransObject( SQLCA )
li_hosp_cnt = lds_all_hosp.Retrieve( al_prac_id )

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-45
//$<add> 02.22.2006 By: LeiWei
//$<reason> Performance tuning
//$<Modification> Reduce the client-server interactions to improve runtime performance.
//$<Modification> Add the Appeon Commit Queue label. 
gnv_appeondb.of_commitqueue( )
//---------------------------- APPEON END ----------------------------

//for each hospital put an entry in the hospital link table for the new facility being added
FOR i = 1 TO li_hosp_cnt
	ll_rec = lds_all_hosp.GetItemNumber( i, "rec_id" )
	//debugbreak()
	li_found = lds_hosp_link.Find( "facility_id = " + String( ai_facility_id ) + " and hosp_affil_id = " + string(ll_rec), 1, 1000 )
	IF li_found > 0 THEN
		CONTINUE
	END IF
	li_nr = lds_hosp_link.InsertRow( 0 )	
	lds_hosp_link.SetItem( li_nr, "prac_id", al_prac_id )
	lds_hosp_link.SetItem( li_nr, "hosp_affil_id", ll_rec )
	lds_hosp_link.SetItem( li_nr, "facility_id", ai_facility_id )
END FOR

IF lds_hosp_link.Update() <> 1 THEN
	MessageBox( "Update Error", "Error updating Hospital link table." )
	DESTROY lds_hosp_link
	DESTROY lds_all_hosp
	RETURN -1
END IF


DESTROY lds_hosp_link
DESTROY lds_all_hosp

RETURN 1


end function

public function integer of_add_spec_link (integer al_facil_id, long al_prac_id);//called from net dev of_add_multi maha 011003

Integer li_spec_cnt
Integer i
Integer li_nr
Integer li_found
Long ll_spec_id
long ll_rec
n_ds lds_spec_link
n_ds lds_all_spec

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-46
//$<add> 02.22.2006 By: LeiWei
//$<reason> Performance tuning
//$<Modification> Reduce the client-server interactions to improve runtime performance.
//$<Modification> Add the Appeon Start Queue Labels. 
gnv_appeondb.of_startqueue( )
//---------------------------- APPEON END ----------------------------

lds_spec_link = CREATE n_ds
lds_spec_link.DataObject = "d_sf_link"
lds_spec_link.of_SetTransObject( SQLCA )
lds_spec_link.Retrieve( al_prac_id )

lds_all_spec = CREATE n_ds
lds_all_spec.DataObject = "d_spec_of_prac"
lds_all_spec.of_SetTransObject( SQLCA )
li_spec_cnt = lds_all_spec.Retrieve( al_prac_id )

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-47
//$<add> 02.22.2006 By: LeiWei
//$<reason> Performance tuning
//$<Modification> Reduce the client-server interactions to improve runtime performance.
//$<Modification> Add the Appeon Commit Queue Labels. 
gnv_appeondb.of_commitqueue( )
//---------------------------- APPEON END ----------------------------

//for each specialty put an entry in the specialty link table for the new facility being added
FOR i = 1 TO li_spec_cnt
	ll_rec = lds_all_spec.GetItemNumber( i, "rec_id" ) //maha 121702
	li_found = lds_spec_link.Find( "facility_id = " + String( al_facil_id ) + " and specialty_id = " + string(ll_rec), 1, 1000 )
	IF li_found > 0 THEN
		CONTINUE
	END IF	
	li_nr = lds_spec_link.InsertRow( 0 )	
	lds_spec_link.SetItem( li_nr, "prac_id", al_prac_id )
	lds_spec_link.SetItem( li_nr, "specialty_id", ll_rec )
	lds_spec_link.SetItem( li_nr, "facility_id", al_facil_id )
	lds_spec_link.SetItem( li_nr, "practicing", 582 )
next

IF lds_spec_link.Update() <> 1 THEN
	MessageBox( "Update Error", "Error updating specialty link table." )
	DESTROY lds_spec_link
	DESTROY lds_all_spec
	RETURN -1
END IF


DESTROY lds_spec_link
DESTROY lds_all_spec

RETURN 1


end function

public function string of_get_reference_val (long al_table);string ls_new_value
string ls_value1
string ls_value2
string ls_fld_nm1
string ls_fld_nm2
string ls_fld_type
string ls_fld_type1
string ls_lookup_type
datawindow adw
long ll_field_id1
long ll_field_id2
long ll_new_value
integer i
				
				
				
				
				//get reference field 1
				select reference_field_1 into :ll_field_id1 from data_view_screen where table_id = :al_table and data_view_id = 1;
				if isnull(ll_field_id1) or ll_field_id1 < 1 then ll_field_id1 = 0//lds_audit_fields.GetItemNumber( 1, "field_id" )
				//get reference field 2
				select reference_field_2 into :ll_field_id2  from data_view_screen where table_id = :al_table and data_view_id = 1;
				if isnull(ll_field_id2) or ll_field_id2 < 1 then ll_field_id2 = 0//lds_audit_fields.GetItemNumber( 2, "field_id" )

				//--------------------------- APPEON BEGIN ---------------------------
				//$<ID> PT-48
				//$<modify> 03.23.2006 By: LeiWei
				//$<reason> Performance tuning
				//$<Modification> Write script to retrieve data from a cache instead of from the database.

				/*
				//get reference field name 1
				select field_name into :ls_fld_nm1 from sys_fields where field_id = :ll_field_id1;
				if isnull(ls_fld_nm1) or ls_fld_nm1 = "" then ls_fld_nm1 = "" //lds_audit_fields.GetItemString( 1, "field_name" )
				//get reference field name 2
				select field_name into :ls_fld_nm2 from sys_fields where field_id = :ll_field_id2;
				if isnull(ls_fld_nm2) or ls_fld_nm2 = "" then ls_fld_nm2 = "" //lds_audit_fields.GetItemString( 2, "field_name" )
				
				//ref 1 data
				//datatype and lookup field
				select field_type into :ls_fld_type from sys_fields where field_id = :ll_field_id1;
				select lookup_type into :ls_lookup_type from sys_fields where field_id = :ll_field_id1;
				*/

				//get reference field name 1
				//select field_name into :ls_fld_nm1 from sys_fields where field_id = :ll_field_id1;
				ls_fld_nm1 = gnv_data.of_getitem("sys_fields", "field_name", "field_id = " + String(ll_field_id1))
				if isnull(ls_fld_nm1) or ls_fld_nm1 = "" then ls_fld_nm1 = "" //lds_audit_fields.GetItemString( 1, "field_name" )
				//get reference field name 2
				//select field_name into :ls_fld_nm2 from sys_fields where field_id = :ll_field_id2;
				ls_fld_nm2 = gnv_data.of_getitem("sys_fields", "field_name", "field_id = " + String(ll_field_id2))
				if isnull(ls_fld_nm2) or ls_fld_nm2 = "" then ls_fld_nm2 = "" //lds_audit_fields.GetItemString( 2, "field_name" )
				
				//ref 1 data
				//datatype and lookup field
				//select field_type into :ls_fld_type from sys_fields where field_id = :ll_field_id1;
				//select lookup_type into :ls_lookup_type from sys_fields where field_id = :ll_field_id1;
				ls_fld_type = gnv_data.of_getitem("sys_fields", "field_type", "field_id = " + String(ll_field_id1))
				ls_lookup_type = gnv_data.of_getitem("sys_fields", "lookup_type", "field_id = " + String(ll_field_id1))
				//---------------------------- APPEON END ----------------------------

				//ls_fld_type = Upper( adw.Describe( ls_fld_nm1 + ".ColType" ) )
//				IF Pos( ls_fld_type, "CHAR" ) > 0 THEN
//					ls_fld_type = "C"
//				ELSEIF Pos( ls_fld_type, "DATE" ) > 0 THEN
//					ls_fld_type = "D"
//				ELSEIF Pos( ls_fld_type, "LONG" ) > 0 OR Pos( ls_fld_type, "DECIMAL" ) > 0 THEN
//					ls_fld_type = "N"
//				ELSEIF ls_fld_type = "!" THEN
//					//messagebox(ls_fld_nm, adw.Describe( ls_fld_nm + ".ColType" ) )
//					//CONTINUE
//				ELSE				
//					MessageBox("", "Unknown data type " + ls_fld_type1 + " for field " + ls_fld_nm1 )
//					Return ""
//				END IF
				//data value
				if ls_fld_nm1 = "" then
					ls_value1 = ""
				else
					choose case ls_fld_type
						case "C","V"
							ls_value1 = adw.GetItemString( i, ls_fld_nm1 )
						case "N", "I"
							ls_value1 = string(adw.GetItemnumber( i, ls_fld_nm1 ))
						case "D"
							ls_value1 = string(adw.GetItemdatetime( i, ls_fld_nm1 ))
						case else
							ls_value1 = ""
					end choose
				end if
					
				//if lookup get lookup value
//					MessageBox("ls_lookup_type 1", ls_lookup_type)
//					messagebox("ls_fld_nm",ls_fld_nm)
				if ls_lookup_type = "C" then
					ll_new_value = long(ls_value1) //convert to number
					//--------------------------- APPEON BEGIN ---------------------------
					//$<ID> PT-49
					//$<modify> 02.27.2006 By: LeiWei
					//$<modification> Write script to retrieve data from a cache instead of from the database.
					//select description into :ls_value1 from code_lookup where lookup_code = :ll_new_value;
					ls_value1 = gnv_data.of_getitem( 'code_lookup', 'description', 'lookup_code='+string(ll_new_value))
					//---------------------------- APPEON END ----------------------------	
				elseif ls_lookup_type = "A" then
//					messagebox("in","addr lookup")
//					MessageBox("ls_value1 a", ls_value1)
					ll_new_value = long(ls_value1)
					select entity_name into :ls_value1 from address_lookup where lookup_code = :ll_new_value;
					//MessageBox("ls_value1 after lookup", ls_value1)
				end if
				
	
				//reference 2 info
				select field_type into :ls_fld_type from sys_fields where field_id = :ll_field_id2;
				select lookup_type into :ls_lookup_type from sys_fields where field_id = :ll_field_id2;

//				ls_fld_type = Upper( adw.Describe( ls_fld_nm2 + ".ColType" ) )
//				IF Pos( ls_fld_type, "CHAR" ) > 0 THEN
//					ls_fld_type = "C"
//				ELSEIF Pos( ls_fld_type, "DATE" ) > 0 THEN
//					ls_fld_type = "D"
//				ELSEIF Pos( ls_fld_type, "LONG" ) > 0 OR Pos( ls_fld_type, "DECIMAL" ) > 0 THEN
//					ls_fld_type = "N"
//				ELSEIF ls_fld_type = "!" THEN
//					//messagebox(ls_fld_nm, adw.Describe( ls_fld_nm + ".ColType" ) )
////					CONTINUE
//				ELSE				
//					MessageBox("", "Unknown data type " + ls_fld_type + " for field " + ls_fld_nm1 )
//					Return ""
//				END IF
				if ls_fld_nm2 = "" then
					ls_value2 = ""
				else
					choose case ls_fld_type
						case "C","V"
							ls_value2 = adw.GetItemString( i, ls_fld_nm2 )
						case "N", "I"
							ls_value2 = string(adw.GetItemnumber( i, ls_fld_nm2 ))
						case "D"
							ls_value2 = string(adw.GetItemdatetime( i, ls_fld_nm2 ))
						case else
							ls_value2 = ""
					end choose
				end if
				//MessageBox("ls_lookup_type 2", ls_lookup_type)
				if ls_lookup_type = "C" then
					ll_new_value = long(ls_value2)
					//--------------------------- APPEON BEGIN ---------------------------
					//$<ID> PT-50
					//$<modify> 02.27.2006 By: LeiWei
					//$<modification> Write script to retrieve data from a cache instead of from the database.
					//select description into :ls_value2 from code_lookup where lookup_code = :ll_new_value;
					ls_value2 = gnv_data.of_getitem( 'code_lookup', 'description', 'lookup_code='+string(ll_new_value))
					//---------------------------- APPEON END ----------------------------	
				elseif ls_lookup_type = "A" then
					ll_new_value = long(ls_value2)
					select entity_name into :ls_value2 from address_lookup where lookup_code = :ll_new_value;
				end if
				//check for nulls
				if isnull(ls_value1) then ls_value1  = ""
				if isnull(ls_value2) then ls_value2  = ""
//				MessageBox("ls_value1",ls_value1)
//				MessageBox("ls_value2",ls_value2)

		
				ls_new_value = ls_value1 + "-" + ls_value2
				
				
	return ls_new_value
end function

public function integer of_field_audit_delete_last (u_dw adw, integer ai_row);//maha created for sys audit when deleting 083104  called from of_delete_record (pfc_cst_u_data_entry) as well as other dws
Integer i
Integer c
Integer li_rc
Integer li_lu_rc
Long ll_seq_rc
Long ll_seq_no
Integer li_nr
Integer li_col_cnt
Integer li_table_id
integer li_fs //maha 111502
Long ll_rec_id
Long ll_field_id
Long ll_field_id2
Long ll_field_id1
Long ll_old_value
Long ll_new_value
long ll_facility_id //maha111802
long ll_prac
String ls_lookup_type
String ls_is_lookup
String ls_lookup_field_name
String ls_retval
String ls_old_value
String ls_new_value
String ls_value1
String ls_value2
String ls_table_name
String ls_fld_nm
String ls_fld_nm2
String ls_fld_type
n_ds lds_lookup_code
n_ds lds_lookup_address
n_ds lds_sys_audit
n_ds lds_last_seq_no

if ai_Row <= 0 then Return 1 //Add by Evan 01/09/2008
ls_table_name = adw.Object.DataWindow.Table.UpdateTable
//MessageBox("of audit trail", ls_table_name)

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-51
//$<modify> 04.10.2006 By: LeiWei
//$<reason> Performance tuning
//$<modification> Write script to retrieve data from a cache instead of from the database.
 
/*
n_ds lds_audit_fields

lds_sys_audit = CREATE n_ds
lds_sys_audit.DataObject = "d_view_audit"
lds_sys_audit.of_SetTransObject( SQLCA )

lds_last_seq_no = CREATE n_ds
lds_last_seq_no.DataObject = "d_get_last_field_audit_seq_no"
lds_last_seq_no.of_SetTransObject( SQLCA )

lds_lookup_code = CREATE n_ds
lds_lookup_code.DataObject = "d_lookup_code_search"
lds_lookup_code.of_SetTransObject( SQLCA )

lds_lookup_address = CREATE n_ds
lds_lookup_address.DataObject = "d_lookup_address_search"
lds_lookup_address.of_SetTransObject( SQLCA )

lds_audit_fields = CREATE n_ds
lds_audit_fields.DataObject = "d_audit_fields"
lds_audit_fields.of_SetTransObject( SQLCA )
li_col_cnt = lds_audit_fields.Retrieve( ls_table_name )
*/
datastore lds_audit_fields

IF NOT IsValid(ids_sys_audit) THEN
	ids_sys_audit = CREATE n_ds
	ids_sys_audit.DataObject = "d_view_audit"
	ids_sys_audit.SetTransObject( SQLCA )
END IF
lds_sys_audit = ids_sys_audit

// <RP> 1.10.2017 --------------------------------------------
gnv_data.of_retrieveIfNecessary("sys_fields", FALSE)
// <RP>
lds_audit_fields = gnv_data.ids_sys_fields
lds_audit_fields.SetFilter( "sys_tables_table_name = '" + ls_table_name + "' AND sys_fields_audit_fld = 'Y'" )
lds_audit_fields.Filter()
li_col_cnt =  lds_audit_fields.Rowcount( )

//---------------------------- APPEON END ----------------------------


//messagebox("audit fields",li_col_cnt)
IF li_col_cnt < 1 THEN
//	messagebox("audit fields",li_col_cnt)
	Return -1
END IF

li_rc = adw.RowCount()
//messagebox("adw count",li_rc)
li_table_id = lds_audit_fields.GetItemNumber( 1, "table_id" )
li_fs = of_get_facil_specific(li_table_id)


i = ai_row


///************************DELETE	
 		
		li_table_id = lds_audit_fields.GetItemNumber( 1, "table_id" )
		//ls_fld_type = Upper( adw.Describe( ls_fld_nm + ".ColType" ) )
		ll_rec_id = adw.GetItemNumber( i, "rec_id" ) 
		ll_prac = adw.GetItemNumber( i, "prac_id" )
		li_table_id = lds_audit_fields.GetItemNumber( 1, "table_id" )
		ls_fld_nm = lds_audit_fields.GetItemString( 1, "field_name" )
		ll_field_id = lds_audit_fields.GetItemNumber( 1, "field_id" )

		
		choose case ls_table_name
			case "pd_affil_stat"
				ll_new_value = adw.GetItemnumber( i, "parent_facility_id" )
				//--------------------------- APPEON BEGIN ---------------------------
				//$<ID> PT-52
				//$<modify> 02.27.2006 By: LeiWei
				//$<modification> Write script to retrieve data from a cache instead of from the database.

				//select facility_name into :ls_value1 from facility where facility_id = :ll_new_value;
				ls_value1 = gnv_data.of_getitem("facility","facility_name","facility_id = " + String(ll_new_value))
				//---------------------------- APPEON END ----------------------------
				ls_value2 = adw.GetItemstring( i, "apptmnt_type" )
				ls_old_value = ls_value1 + "-" + ls_value2
			case "pd_affil_dept"
				ll_new_value = adw.GetItemnumber( i, "department" )
				//--------------------------- APPEON BEGIN ---------------------------
				//$<ID> PT-53
				//$<modify> 03.23.2006 By: LeiWei
				//$<reason> Performance tuning
				//$<modification> Write script to retrieve data from a cache instead of from the database.

				//select description into :ls_value2 from code_lookup where lookup_code = :ll_new_value;
				ls_value2=gnv_data.of_getitem( "code_lookup","description", "lookup_code = "+String(ll_new_value))
				//---------------------------- APPEON END ----------------------------
				ll_new_value = adw.GetItemnumber( i, "facility_id" )
				//--------------------------- APPEON BEGIN ---------------------------
				//$<ID> PT-54
				//$<modify> 03.23.2006 By: LeiWei
				//$<reason> Performance tuning
				//$<modification> Write script to retrieve data from a cache instead of from the database.

				//select facility_name into :ls_value1 from facility where facility_id = :ll_new_value;
				ls_value1 = gnv_data.of_getitem("facility","facility_name","facility_id = " + String(ll_new_value))
				//---------------------------- APPEON END ----------------------------
				ls_old_value = ls_value1 + "-" + ls_value2
			case "pd_affil_staff_cat"
				ll_new_value = adw.GetItemnumber( i, "facility_id" )
				//--------------------------- APPEON BEGIN ---------------------------
				//$<ID> PT-55
				//$<modify> 03.23.2006 By: LeiWei
				//$<reason> Performance tuning
				//$<modification> Write script to retrieve data from a cache instead of from the database.
				//select facility_name into :ls_value2 from facility where facility_id = :ll_new_value;
				ls_value2 = gnv_data.of_getitem("facility","facility_name","facility_id = " + String(ll_new_value))
				//---------------------------- APPEON END ----------------------------
				ll_new_value = adw.GetItemnumber( i, "staff_category" )
				//--------------------------- APPEON BEGIN ---------------------------
				//$<ID> PT-56
				//$<modify> 03.23.2006 By: LeiWei
				//$<reason> Performance tuning
				//$<modification> Write script to retrieve data from a cache instead of from the database.
				//select description into :ls_value1 from code_lookup where lookup_code = :ll_new_value;
				ls_value1=gnv_data.of_getitem( "code_lookup","description", "lookup_code = "+String(ll_new_value))
				//---------------------------- APPEON END ----------------------------
				ls_old_value = ls_value1 + "-" + ls_value2
			case "pd_affil_staff_leave"
				ll_new_value = adw.GetItemnumber( i, "facility_id" )
				//--------------------------- APPEON BEGIN ---------------------------
				//$<ID> PT-57
				//$<modify> 03.23.2006 By: LeiWei
				//$<reason> Performance tuning
				//$<modification> Write script to retrieve data from a cache instead of from the database.
				//select facility_name into :ls_value2 from facility where facility_id = :ll_new_value;
				ls_value2 = gnv_data.of_getitem("facility","facility_name","facility_id = " + String(ll_new_value))
				//---------------------------- APPEON END ----------------------------
				ll_new_value = long(adw.GetItemstring( i, "leave_of_absence_reason" ))
				//--------------------------- APPEON BEGIN ---------------------------
				//$<ID> PT-58
				//$<modify> 03.23.2006 By: LeiWei
				//$<reason> Performance tuning
				//$<modification> Write script to retrieve data from a cache instead of from the database.
				//select description into :ls_value1 from code_lookup where lookup_code = :ll_new_value;
				ls_value1=gnv_data.of_getitem( "code_lookup","description", "lookup_code = "+String(ll_new_value))
				//---------------------------- APPEON END ----------------------------
				ls_old_value = ls_value1 + "-" + ls_value2
			case else //data entry screens
								//ls_new_value = of_get_reference_val(li_table_id)
				//--------------------------- APPEON BEGIN ---------------------------
				//$<ID> PT-59
				//$<modify> 03.23.2006 By: LeiWei
				//$<reason> Performance tuning
				//$<modification> Write script to retrieve data from a cache instead of from the database.
				/*
				//get reference field 1
				select reference_field_1 into :ll_field_id1  from data_view_screen where table_id = :li_table_id and data_view_id = 1;
				if isnull(ll_field_id) or ll_field_id1 < 1 then ll_field_id1 = lds_audit_fields.GetItemNumber( 1, "field_id" )
				//get reference field 2
				select reference_field_2 into :ll_field_id2  from data_view_screen where table_id = :li_table_id and data_view_id = 1;
				if isnull(ll_field_id2) or ll_field_id2 < 1 then ll_field_id2 = lds_audit_fields.GetItemNumber( 2, "field_id" )
				//get reference field name 1
				select field_name into :ls_fld_nm from sys_fields where field_id = :ll_field_id1;
				if isnull(ls_fld_nm) or ls_fld_nm = "" then ls_fld_nm = lds_audit_fields.GetItemString( 1, "field_name" )
				//get reference field name 2
				select field_name into :ls_fld_nm2 from sys_fields where field_id = :ll_field_id2;
				if isnull(ls_fld_nm2) or ls_fld_nm2 = "" then 
					if lds_audit_fields.rowcount() > 1 then //trap added maha 060305
						ls_fld_nm2 = lds_audit_fields.GetItemString( 2, "field_name" )
					end if
				end if				//ref 1 data
				//datatype and lookup field
				select field_type into :ls_fld_type from sys_fields where field_id = :ll_field_id1;
				select lookup_type into :ls_lookup_type from sys_fields where field_id = :ll_field_id1;
				*/
	
				//get reference field 1
				ll_field_id1 = Long(gnv_data.of_getitem( "data_view_screen", "reference_field_1", "data_view_id = 1 and table_id = " + String(li_table_id)))
				//get reference field 2
				ll_field_id2 = Long(gnv_data.of_getitem( "data_view_screen", "reference_field_2", "data_view_id = 1 and table_id = " + String(li_table_id)))
				
				if isnull(ll_field_id) or ll_field_id1 < 1 then ll_field_id1 = lds_audit_fields.GetItemNumber( 1, "field_id" )
				if isnull(ll_field_id2) or ll_field_id2 < 1 then 
					If lds_audit_fields.Rowcount() > 1 Then  //Added trap By Ken.Guo 06.25.2008
						ll_field_id2 = lds_audit_fields.GetItemNumber( 2, "field_id" )
					End If
				End If

				//get reference field name 1
				ls_fld_nm = gnv_data.of_getitem( "sys_fields","field_name", "field_id = "+String(ll_field_id1))
				if isnull(ls_fld_nm) or ls_fld_nm = "" then ls_fld_nm = lds_audit_fields.GetItemString( 1, "field_name" )
				//get reference field name 2
				ls_fld_nm2 = gnv_data.of_getitem( "sys_fields","field_name", "field_id = "+String(ll_field_id2))
				if isnull(ls_fld_nm2) or ls_fld_nm2 = "" then 
					if lds_audit_fields.rowcount() > 1 then //trap added maha 060305
						ls_fld_nm2 = lds_audit_fields.GetItemString( 2, "field_name" )
					end if
				end if				//ref 1 data
				//datatype and lookup field
				ls_fld_type = gnv_data.of_getitem( "sys_fields","field_type", "field_id = "+String(ll_field_id1))
				ls_lookup_type = gnv_data.of_getitem( "sys_fields","lookup_type", "field_id = "+String(ll_field_id1))
				//---------------------------- APPEON END ----------------------------
				
				ls_fld_type = Upper( adw.Describe( ls_fld_nm + ".ColType" ) )
				IF Pos( ls_fld_type, "CHAR" ) > 0 THEN
					ls_fld_type = "C"
				ELSEIF Pos( ls_fld_type, "DATE" ) > 0 THEN
					ls_fld_type = "D"
				ELSEIF Pos( ls_fld_type, "LONG" ) > 0 OR Pos( ls_fld_type, "DECIMAL" ) > 0 THEN
					ls_fld_type = "N"
				ELSEIF ls_fld_type = "!" THEN
					//messagebox(ls_fld_nm, adw.Describe( ls_fld_nm + ".ColType" ) )
					return -1
				ELSE				
					MessageBox("", "Unknown data type " + ls_fld_type + " for field " + ls_fld_nm )
					Return -1
				END IF
				//data value
				choose case ls_fld_type
					case "C","V"
						ls_value1 = adw.GetItemString( i, ls_fld_nm )
					case "N", "I"
						ls_value1 = string(adw.GetItemnumber( i, ls_fld_nm ))
					case "D"
						ls_value1 = string(adw.GetItemdatetime( i, ls_fld_nm ))
					case else
						ls_value1 = ""
				end choose
				//if lookup get lookup value
//					MessageBox("ls_lookup_type 1", ls_lookup_type)
//					messagebox("ls_fld_nm",ls_fld_nm)
				if ls_lookup_type = "C" then
					ll_new_value = long(ls_value1) //convert to number
					//--------------------------- APPEON BEGIN ---------------------------
					//$<ID> PT-60
					//$<modify> 03.23.2006 By: LeiWei
					//$<reason> Performance tuning
					//$<modification> Write script to retrieve data from a cache instead of from the database.
					//select description into :ls_value1 from code_lookup where lookup_code = :ll_new_value;
					ls_value1=gnv_data.of_getitem( "code_lookup","description", "lookup_code = "+String(ll_new_value))
					//---------------------------- APPEON END ----------------------------
				elseif ls_lookup_type = "A" then
//					messagebox("in","addr lookup")
//					MessageBox("ls_value1 a", ls_value1)
					ll_new_value = long(ls_value1)
					select entity_name into :ls_value1 from address_lookup where lookup_code = :ll_new_value;
					//MessageBox("ls_value1 after lookup", ls_value1)
				end if
				
	
				//--------------------------- APPEON BEGIN ---------------------------
				//$<ID> PT-61
				//$<modify> 03.23.2006 By: LeiWei
				//$<reason> Performance tuning
				//$<modification> Write script to retrieve data from a cache instead of from the database.
				/*
				//reference 2 info
				select field_type into :ls_fld_type from sys_fields where field_id = :ll_field_id2;
				select lookup_type into :ls_lookup_type from sys_fields where field_id = :ll_field_id2;
				*/
				ls_fld_type = gnv_data.of_getitem( "sys_fields","field_type", "field_id = "+String(ll_field_id2))
				ls_lookup_type = gnv_data.of_getitem( "sys_fields","lookup_type", "field_id = "+String(ll_field_id2))
				//---------------------------- APPEON END ----------------------------

				ls_fld_type = Upper( adw.Describe( ls_fld_nm2 + ".ColType" ) )
				IF Pos( ls_fld_type, "CHAR" ) > 0 THEN
					ls_fld_type = "C"
				ELSEIF Pos( ls_fld_type, "DATE" ) > 0 THEN
					ls_fld_type = "D"
				ELSEIF Pos( ls_fld_type, "LONG" ) > 0 OR Pos( ls_fld_type, "DECIMAL" ) > 0 THEN
					ls_fld_type = "N"
				ELSEIF ls_fld_type = "!" THEN
					//messagebox(ls_fld_nm, adw.Describe( ls_fld_nm + ".ColType" ) )
					return -1
				ELSE				
					MessageBox("", "Unknown data type " + ls_fld_type + " for field " + ls_fld_nm )
					Return -1
				END IF
				
				choose case ls_fld_type
					case "C","V"
						ls_value2 = adw.GetItemString( i, ls_fld_nm2 )
					case "N", "I"
						ls_value2 = string(adw.GetItemnumber( i, ls_fld_nm2 ))
					case "D"
						ls_value2 = string(adw.GetItemdatetime( i, ls_fld_nm2 ))
					case else
						ls_value2 = ""
				end choose		
				//MessageBox("ls_lookup_type 2", ls_lookup_type)
				if ls_lookup_type = "C" then
					ll_new_value = long(ls_value2)
					//--------------------------- APPEON BEGIN ---------------------------
					//$<ID> PT-62
					//$<modify> 03.23.2006 By: LeiWei
					//$<reason> Performance tuning
					//$<modification> Write script to retrieve data from a cache instead of from the database.
					/*
					select description into :ls_value2 from code_lookup where lookup_code = :ll_new_value;
					*/
					ls_value2 = gnv_data.of_getitem( "code_lookup","description", "lookup_code = "+String(ll_new_value))
					//---------------------------- APPEON END ----------------------------
				elseif ls_lookup_type = "A" then
					ll_new_value = long(ls_value2)
					select entity_name into :ls_value2 from address_lookup where lookup_code = :ll_new_value;
				end if
				//check for nulls
				if isnull(ls_value1) then ls_value1  = ""
				if isnull(ls_value2) then ls_value2  = ""
				ls_new_value = ls_value1 + "-" + ls_value2
				ls_new_value = mid(ls_new_value,1,100)
				ls_old_value = ls_new_value
		end choose
		
		
		//--------------------------- APPEON BEGIN ---------------------------
		//$<ID> PT-63
		//$<comment> 02.27.2006 By: LeiWei
		//$<reason> Performance tuning
		//$<modification> The following script moved to the of_field_audit_update function
		//$<modification> to reduce client-server interactions.
		/*
		ll_seq_rc = lds_last_seq_no.Retrieve( ll_rec_id, ll_field_id )
		IF ll_seq_rc > 0 THEN
			ll_seq_no = lds_last_seq_no.GetItemNumber(1, "last_seq_no" ) 
		END IF
		IF ll_seq_no = 0 OR IsNull( ll_seq_no ) THEN
			ll_seq_no = 1
		ELSE
			ll_seq_no++
		END IF
		*/
		//---------------------------- APPEON END ----------------------------

		li_nr = lds_sys_audit.InsertRow( 0 )
		lds_sys_audit.SetItem( li_nr, "rec_id", ll_rec_id )
		lds_sys_audit.SetItem( li_nr, "prac_id", adw.GetItemNumber( i, "prac_id" ) )					
		lds_sys_audit.SetItem( li_nr, "seq_no", ll_seq_no )										
		lds_sys_audit.SetItem( li_nr, "table_id", li_table_id )
		lds_sys_audit.SetItem( li_nr, "field_id", 1001 )
		lds_sys_audit.SetItem( li_nr, "old_value", ls_old_value )
		lds_sys_audit.SetItem( li_nr, "new_value", "Deleted" )
		lds_sys_audit.SetItem( li_nr, "user_id", gnv_app.of_getuserid() )
		lds_sys_audit.SetItem( li_nr, "audit_type", "D" )					
		lds_sys_audit.SetItem( li_nr, "date_time_modified", DateTime( Today(), Now() ) )
		lds_sys_audit.SetItem( li_nr, "sys_audit_exported", 1 )

// adw.RowsDiscard (1, 100,delete! )

//if lds_sys_audit.rowcount() > 1 then maha 102003 trap not completed for multiple staff cat records
//	for i = 1 to ds_sys_audit.rowcount()
//		lds_sys_audit.getItemnumber( i ,"rec_id" )
//end if

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-64
//$<comment> 02.27.2006 By: LeiWei
//$<reason> Performance tuning
//$<modification> The following script moved to the of_field_audit_update function
//$<modification> to reduce client-server interactions.
/*
IF lds_sys_audit.Update() = -1 THEN
	MessageBox("", "Update to sys_audit table Failed!")
	Return -1
END IF

//Start Code Change ---- 11.03.2005 #18 maha
of_set_mod_date(ll_prac)
//End Code Change---11.03.2005 

COMMIT USING SQLCA;
*/

THIS.POST of_field_audit_update()

//---------------------------- APPEON END ----------------------------

RETURN 1
end function

public function integer of_dwchild_retrieve (string as_lu_table, string as_type, u_dw adw_dw, string as_from, long al_value, string as_column_nm);//created maha 060805 to add search item in each lookup.  Called from of_create_dynamic_dw and the date entry user object of_lookup_function
//debugbreak()
//Start Code Change ---- 12.15.2005 #171 maha
//works for all dropdowns except insurance carrier??????
long ll_val
datawindowchild dwchild
long ll_find
long ert
//debugbreak()
adw_dw.GetChild( as_column_nm, dwchild )
adw_dw.settransobject(sqlca)
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-65
//$<modify> 01.17.2006 By: Cao YongWang
//$<reason> After Appeon's modification, the ids_address_dddw cache is no longer used in IntelliCred.
/*
if as_from = "RET" and as_type = "A" then //when treturning from search refresh cache for address lookups
	ert = app_filler.ids_address_dddw.Retrieve()
	//messagebox("",ert)
end if
*/
//---------------------------- APPEON END ----------------------------

IF as_type = "C" THEN
	choose case as_lu_table
		case "Address Type", "Yes/No","Specialty Order"
			//exceptions
			//--------------------------- APPEON BEGIN ---------------------------
			//$<ID> PT-66
			//$<modify> 01.17.2006 By: Cao YongWang
			//$<reason> After Appeon's modification, the ids_address_dddw cache is no longer used in IntelliCred.
			/*
			dwchild.retrieve(as_lu_table)
			*/
			gnv_data.of_set_dwchild_fromcache('code_lookup',"upper(lookup_name)='"+upper(as_lu_table)+"'",dwchild)
			//---------------------------- APPEON END ----------------------------
		case else
			//--------------------------- APPEON BEGIN ---------------------------
			//$<ID> PT-67
			//$<modify> 01.17.2006 By: Cao YongWang
			//$<reason> After Appeon's modification, the ids_address_dddw cache cache is no longer used in IntelliCred.
			/*
			dwchild.retrieve(as_lu_table)
			*/
			gnv_data.of_set_dwchild_fromcache('code_lookup',"upper(lookup_name)='"+upper(as_lu_table)+"'",dwchild)
			//---------------------------- APPEON END ----------------------------
			dwchild.InsertRow(1)
			dwchild.setitem(1,"code",'-SEARCH/Add-')
			dwchild.setitem(1,"lookup_code",-777)
			dwchild.setitem(1,"description","-Search/Add for " + as_lu_table +" -")
	end choose
ELSEIF as_type = "A" THEN
	//debugbreak()
	if dwchild.Describe("entity_name_original.ColType") <> "!" then
		//messagebox("1",string(dwchild.rowcount()))
		//--------------------------- APPEON BEGIN ---------------------------
		////$<ID> PT-68
		//$<modify> 01.17.2006 By: Cao YongWang
		//$<reason> After Appeon's modification, the ids_address_dddw cache cache is no longer used in IntelliCred.
		//app_filler.ids_address_dddw.ShareData( dwchild )
		//dwchild.SetFilter( "lookup_name = '" + as_lu_table + "'" )
		//dwchild.Filter()
		dwchild.retrieve(as_lu_table)
		//---------------------------- APPEON END ----------------------------
		
		dwchild.InsertRow(1)
		//messagebox("2",string(dwchild.rowcount()))
		dwchild.setitem(1,"code",'-SEARCH/ADD-')
		dwchild.setitem(1,"lookup_code",-888)
		dwchild.setitem(1,"entity_name_original","-Search/Add for " + as_lu_table +" -")
		dwchild.setitem(1,"entity_name","-Search/Add for " + as_lu_table +" -")		//Added by Scofield on 2007-08-31
	end if
elseif as_type = "Q" THEN
		dwchild.Retrieve()
end if
dwchild.InsertRow(1) //blank row

//End Code Change---12.15.2005 

if as_from = "RET" then
	ll_val = al_value
	adw_dw.SetItem( adw_dw.GetRow(), as_column_nm, ll_val )
	adw_dw.accepttext()
	ll_find = dwchild.find("lookup_code = " + string(ll_val),1,dwchild.rowcount())
	if ll_find > 0 then
		dwchild.scrolltorow(ll_find)
	end if
end if

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-69
//$<add> 01.25.2006 By: Cao YongWang
//$<reason> Performance tuning
//$<modification> Specify values to arrays.

is_types[upperbound(is_types) + 1] 					= as_type
is_froms[upperbound(is_froms) + 1] 					= as_from
is_dddwcolumns[upperbound(is_dddwcolumns) + 1] 	= as_column_nm
is_lu_tables[upperbound(is_lu_tables) + 1] 		= as_lu_table
il_values[upperbound(il_values) + 1] 				= al_value
//---------------------------- APPEON END ----------------------------

return 1
end function

public function integer of_rec_count (integer ai_tid, integer ai_facility);//this function called from of_screen_color() (pfc_cst_u_data_entry) used to set screen complete icon //,maha 061705 
//maha app081805 added ai_facility argument

integer cnt = 0
integer w
string tname
string is_sql
string ls_presentation_str
string ls_dwsyntax_str
string errors
n_ds lds_prac_list
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-70
//$<modify> 01.25.2006 By: Cao YongWang
//$<reason> Performance tuning
//$<modification> Write script to retrieve data from a cache instead of from the database.

/*
select table_name into :tname from sys_tables where table_id = :ai_tid;
*/
tname = gnv_data.of_getitem("sys_tables","table_name","table_id = " + string(ai_tid))
//---------------------------- APPEON END ----------------------------

//maha 122305
if pos(tname,"dba",1 ) > 0 then
	tname = mid(tname,5,100)
end if
//$<ID> PT-

	is_sql = "select count(rec_id) cnt from " + tname + " where prac_id = " + string(gl_prac_id) 
	if ai_facility > 0 then //maha app081805
		is_sql = is_sql + " and facility_id = " + string(ai_facility) + ";"
	else
		is_sql = is_sql + ";"
	end if

//messagebox("is_sql",is_sql)
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-71
//$<modify> 01.25.2006 By: Cao YongWang
//$<reason> Performance tuning
//$<reason> Use cursor to retrieve the data instead of using DataWindow to retrieve data.
/*

		ls_presentation_str = "style(type=grid)"		
		ls_dwsyntax_str = SQLCA.SyntaxFromSQL(is_sql, ls_presentation_str, ERRORS)
		IF Len(ERRORS) > 0 THEN
			MessageBox("Caution on export field " + is_sql, &
			"SyntaxFromSQL caused these errors: " + ERRORS + "~r~r" + is_sql)
		//	MessageBox("ls_select_table",ls_select_table)	
			RETURN -0
		END IF
		lds_prac_list = CREATE n_ds
		w = lds_prac_list.Create( ls_dwsyntax_str, ERRORS)
		if w < 1 then messagebox("error on create",errors)
		lds_prac_list.settransobject(sqlca)
		lds_prac_list.retrieve()
		if lds_prac_list.rowcount() > 0 then
			cnt = lds_prac_list.getitemnumber(1,1)
		else
			//messagebox("error on create","no data")
		end if

*/
DECLARE rec_cursor DYNAMIC CURSOR FOR SQLSA ;

PREPARE SQLSA FROM :is_sql ;

OPEN DYNAMIC rec_cursor;

FETCH rec_cursor INTO :cnt ;

CLOSE rec_cursor ;
//---------------------------- APPEON END ----------------------------

return cnt
end function

public function integer of_add_questions (string as_from, datawindow adw_detail, integer ai_facility, long al_prac, long al_app_stat);//function created maha app081705 for adding attest questions in a batch.  Called from dw_detail pfc_addrow
//from Argument currently not used; for possible future development.


integer i
integer r
integer c
integer cr
integer ck = 0
long ls_exist_id
long ls_new_id
gs_variable_array ls_array
long il_id[]
integer cnt

cr = adw_detail.rowcount()

//select count(rec_id) into :cnt from pd_affil_stat where prac_id = :al_prac and parent_facility_id = :ai_facility and active_status > 0;
//if cnt < 1 then
//	messagebox("Appointment record error","There are multiple non-history records (Active,Inactive,Pending,Purge) for this practitioner and facility.  This should be corrected on the Appointment Status tab before adding Attestation Questions.")
//	return - 1 
//else
//	select rec_id into :ll_as_id from pd_affil_stat where prac_id = :gl_prac_id and parent_facility_id = :ii_parent_facility_id and active_status > 0;
//end if	


//--------------------------- APPEON BEGIN ---------------------------
//$<add> 09/18/2007 By: Ken.Guo
//$<reason> For Performance
long ll_ques_id[],ll_prac_id[],ll_appt_stat_id[]
Integer li_facility_id[],li_active_status[]
Integer j
//---------------------------- APPEON END ----------------------------

open (w_question_select)
if message.stringparm = "Cancel" then
	return 0
else
	ls_array = message.powerobjectparm
	// mskinner 17 dec 2005 -- begin
	// fix appeon defect 1.2
	if not isvalid(ls_array) then return -1
	// mskinner 17 dec 2005 -- end 
	il_id = ls_array.as_number
	
	//--------------------------- APPEON BEGIN ---------------------------
	//$<modify> 09/18/2007 By: Ken.Guo
	//$<reason> For client Performance
	/*
	for i = 1 to upperbound(il_id)
		ls_new_id = il_id[i]
		ck = 0
		for c = 1 to cr  //check existing records to avoid duplicates
			ls_exist_id = adw_detail.getitemnumber(c,"question_id")
			if ls_new_id = ls_exist_id then ck = 1
		next
		if ck = 1 then  //if exists skip
			continue
		else
			r = adw_detail.insertrow(0)
			if as_from <> "PQ" then //practitioner questions
				adw_detail.setitem(r,"facility_id",ai_facility) 
				adw_detail.setitem(r,"active_status",1)
				adw_detail.setitem(r,"appt_stat_id",al_app_stat)
			end if
			adw_detail.setitem(r,"prac_id",al_prac)
			adw_detail.setitem(r,"question_id",il_id[i])
		end if
	next
	*/
	for i = 1 to upperbound(il_id)
		ls_new_id = il_id[i]
		ck = 0
		for c = 1 to cr  //check existing records to avoid duplicates
			ls_exist_id = adw_detail.getitemnumber(c,"question_id")
			if ls_new_id = ls_exist_id then ck = 1
		next
		if ck = 1 then  //if exists skip
			continue
		else
			r = adw_detail.insertrow(0)
			J++
			li_facility_id[j] = ai_facility
			li_active_status[j] = 1
			ll_appt_stat_id[j] = al_app_stat
			ll_prac_id[j] = al_prac
			ll_ques_id[j] = il_id[i]
		end if			
	next
	If r > cr Then
		If as_from <> "PQ" Then //practitioner questions
			adw_detail.object.facility_id[cr+1,r] = li_facility_id[]
			adw_detail.object.active_status[cr+1,r] = li_active_status[]
			adw_detail.object.appt_stat_id[cr+1,r] = ll_appt_stat_id[]
		End If
		adw_detail.object.prac_id[cr+1,r] = ll_prac_id[]
		adw_detail.object.question_id[cr+1,r] = ll_ques_id[]
	End If
	//---------------------------- APPEON END ----------------------------	
	return 1
end if


end function

public function integer of_validate_year (u_dw a_dw, string as_type, integer ai_row);//created maha 090705 called from of_record_validation

integer li_year_from = -1
integer li_year_thru = -1
integer i
datetime ldt_from
datetime ldt_to

i = ai_row

//debugbreak()
if as_type = "YEAR" then
	li_year_from = a_dw.GetItemNumber( i, "year_from" )
	li_year_thru = a_dw.GetItemNumber( i, "year_thru" )
elseif as_type = "DATE" then
	if isnull(a_dw.GetItemdatetime( i, "start_date" )) then
		setnull(li_year_from)
	else
		li_year_from = 1
	end if
	if isnull(a_dw.GetItemdatetime( i, "end_date" )) then
		setnull(li_year_thru)
	else
		li_year_thru = 1
	end if
end if


if  li_year_from = -1 AND li_year_thru = -1 then //trapped in of_record_validation
	//fields not visible do nothing
	return 1
elseif IsNull( li_year_from ) AND IsNull( li_year_thru ) THEN
	a_dw.SetRow( i )
	a_dw.ScrollToRow( i )
	if as_type = "YEAR" then
		a_dw.SetColumn( "year_from" )
		MessageBox("Incomplete Data", "Both the year from and year thru fields are blank. At least one must be completed.  Please Correct!" )
		return -1
	elseif as_type = "DATE" then
		a_dw.SetColumn( "start_date" )
		MessageBox("Incomplete Data", "Both the Start Date and End Date fields are blank. At least one must be completed.  Please Correct!" )
		Return -1
	end if

END if
//debugbreak()
//Start Code Change ----06.16.2008 #V81 maha - check for start before end date
if as_type = "DATE" then
	if a_dw.GetItemdatetime( i, "start_date" ) > a_dw.GetItemdatetime( i, "end_date" ) then
		MessageBox("Invalid Data", "The Start Date cannot be greater then the End Date.  Please Check your data." )
		Return -1
	end if
end if
//End Code Change---06.16.2008

return 1
end function

public function integer of_set_mod_date (long al_prac);//Start Code Change ---- 11.03.2005 #17 maha created
//debugbreak()
datetime ldt_date
ldt_date = datetime(today(),now())
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-72
//$<modify> 02.21.2006 By: owen chen
//$<reason> Performance tuning
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

/*
update pd_basic set date_last_mod = :ldt_date where prac_id = :al_prac;
commit using sqlca;
*/
gnv_appeondb.of_startqueue( )

update pd_basic set date_last_mod = :ldt_date where prac_id = :al_prac;
commit using sqlca;

gnv_appeondb.of_commitqueue( )
//---------------------------- APPEON END ----------------------------

return 1
//End Code Change---11.03.2005 
end function

public function integer of_create_dynamic_ds (long al_prac_id, integer ai_data_view_id, integer ai_screen_id, n_ds adw_detail, integer ai_facility_id, n_tr atr_sqlca);SetPointer(HourGlass!)

//This.of_Setup_Cache()
Integer li_retval
Integer li_sort_data_cnt
Integer m1
Integer li_dddw_code_cnt
Integer li_dddw_address_cnt
Integer li_row_cnt
Integer m
Integer li_index
Integer li_obj_cnt
Integer i
Integer li_key_cnt
Integer li_prac_row_cnt
Integer t
Integer li_col_cnt
Integer li_fld_label_width
Integer li_fld_width
Integer li_table_cnt
Boolean lb_table_found
Boolean lb_multi_tablE
Boolean lb_first_field = True
Boolean lb_has_active_status = False
string ls_sqlsyn
String ls_sort_syntax
String ls_month
String ls_fld_lbl_font_wght
String ls_detail_band_height
String ls_dummy_array[]
String ls_width
String ls_dddw_width[]
String ls_height
String ls_x
String ls_y
String ls_justification
String ls_text
String ls_obj_type
String ls_obj_name
String ls_field_x[] 
String ls_visible
String ls_field_y[]
String ls_field_label_x[]
String ls_field_label_height[]
String ls_field_label_y[] 
String ls_field_label[]
String ls_field_id[]
String ls_mask[]
String ls_table_names[]
String ls_field_names[]
String ls_table_field_names[]
String ls_dw_field_names[]
String ls_key_fields_col_nm[]
String ls_temp_table
String ls_table_name
String ls_field_name
String ls_sql_syntax
String ls_grey
String ls_white
String ls_presentation_str
String ls_dwsyntax_str
String ERRORS
String ls_lookup_code
String ls_lookup_type
String ls_lookup_field
String ls_key_fields_syntax
String ls_key_fields[]
string ls_sort_fields //maha 032204
string ls_dir //maha 032204
Long ll_detail_height
string ls_table_prefix //Start Code Change ---- 06.20.2006 #564 maha
string ls_ret
DataWindowChild dwchild
integer li_master
//Start Code Change ---- 11.21.2005 #101 maha
integer cnt


if isnull(ai_screen_id) then return -1	//06.28.2007 By Jervis
if ai_screen_id < 0 then return -1 //12.12.2008 By Jervis WorkFlow = -10

//Start Code Change ---- 12.13.05 #167 maha
if gs_dbtype = "ASA" then
	select count(*) into :cnt from pbcatedt; //maha 011806
		//messagebox("count from pbcat",cnt)
	if cnt < 1 then 
		li_master = 0
	else
		li_master = 1
	end if
else
	li_master = 0
end if
//messagebox("li_master",li_master)
//End Code Change---12.13.2005 

//Start Code Change ---- 06.20.2006 #564 maha
choose case ai_screen_id
	case 2
		ls_table_prefix = "pd_address_"
		lb_multi_tablE = True   //Added by ken at 2007-06-26
	case 31 
		ls_table_prefix = "pd_address_2_"
		lb_multi_tablE = True	//Added by ken at 2007-06-26
	case 10
		ls_table_prefix = "pd_hosp_affil_"
		lb_multi_tablE = True	//Added by ken at 2007-06-26	
	case else
		ls_table_prefix = ""
end choose 
//End Code Change---06.20.2006

is_column_default[] = ls_dummy_array[]
is_column_names[] = ls_dummy_array[]


of_setup_cache()

ids_screen_fields.DataObject = "d_screen_fields"
ids_screen_fields.of_SetTransObject( ATR_SQLCA )
li_row_cnt = ids_screen_fields.Retrieve( ai_data_view_id, ai_screen_id )

ids_screen_fields.SetSort( "field_order A" )
ids_screen_fields.sort( ) //should be by field_order maha 051905 ######


//--------------------------- APPEON BEGIN ---------------------------
//$<Modify> 06.28.2007 By: Jervis
//$<reason> Does not have the significance,redundance code
/*
//CREATE SORT ORDER
integer wer  //#####
wer = ids_screen_fields.SetSort( "sort_field A" ) //maha corrected 051005
ids_screen_fields.Sort()
ls_sort_syntax = " ORDER BY "
FOR i = 1 TO li_row_cnt
	IF ids_screen_fields.GetItemNumber( i, "sort_field" ) > 0 THEN
		IF ids_screen_fields.GetItemString( i, "sort_order" ) = "D" THEN
			ls_sort_syntax = ls_sort_syntax + ids_screen_fields.GetItemString( i, "db_field_name" ) + " DESC,"			
		ELSE
			ls_sort_syntax = ls_sort_syntax + ids_screen_fields.GetItemString( i, "db_field_name" ) + " ASC,"			
		END IF
		li_sort_data_cnt ++
	END IF
END FOR

ids_screen_fields.SetSort( "field_order A" )
ids_screen_fields.Sort()
*/

ii_column_cnt = 0

ls_sql_syntax = "SELECT "
li_table_cnt = 0

//BUILD SELECT 
FOR i = 1 TO li_row_cnt
	//IF ids_screen_fields.GetItemString(i, "visible") = "N" THEN
	//	CONTINUE
	//END IF
	ii_column_cnt++
	ls_table_name = Trim( ids_screen_fields.GetItemString( i, "db_table_name" ))
	is_table_name = ls_table_name
	if pos(ls_table_name,"dba.", 1) = 1 then ls_table_name = mid(ls_table_name,5) //maha 032006
	ls_field_name = Trim( ids_screen_fields.GetItemString( i, "db_field_name" ))
	is_column_names[ii_column_cnt] = ls_field_name	
	is_column_default[ii_column_cnt] = ids_screen_fields.GetItemString( i, "default_value" )
	ls_mask[i] = ids_screen_fields.GetItemString( i, "field_mask" ) 
	ls_field_names[i] = ls_field_name
	ls_field_id[i] = String (ids_screen_fields.GetItemNumber( i, "field_id" ) )
	ls_field_x[i] = String (ids_screen_fields.GetItemNumber( i, "field_x" ) )
	ls_field_y[i] = String (ids_screen_fields.GetItemNumber( i, "field_y" ) )
	ls_field_label_height[i] = String (ids_screen_fields.GetItemNumber( i, "field_height" ) )
	ls_dddw_width[i] = String(ids_screen_fields.GetItemNumber(i, "drop_down_width"))
	ls_field_label_x[i] = String (ids_screen_fields.GetItemNumber( i, "field_label_x" ) )
	ls_field_label_y[i] = String (ids_screen_fields.GetItemNumber( i, "field_label_y" ) )	
	//if li_master = 1 then //maha 121305
		ls_table_field_names[i] =  ls_table_name + "_" + ls_field_name
//	else
	//	ls_table_field_names[i] = Mid( ls_table_name,5,100 ) + "_" + ls_field_name
	//end if
	ls_field_label[i] = ids_screen_fields.GetItemString( i, "field_label" )
	ls_sql_syntax = ls_sql_syntax + ls_table_name + "." + ls_field_name + ", "
	ls_fld_lbl_font_wght = String (ids_screen_fields.GetItemNumber( i, "data_view_fields_font_wieght" ) )	
	lb_table_found = False
	FOR t = 1 TO li_table_cnt
		IF ls_table_names[t] = ls_table_name THEN
			lb_table_found = True
		   EXIT
		END IF
	END FOR
	IF NOT lb_table_found THEN
		li_table_cnt ++
		ls_table_names[ li_table_cnt ] = ls_table_name
	END IF
END FOR //FOR i = 1 TO li_row_cnt

ls_sql_syntax = Left( ls_sql_syntax, Len(ls_sql_syntax) -2 )

li_row_cnt = UpperBound(ls_field_names)

IF ai_screen_id = 2 THEN
	ls_sql_syntax = ls_sql_syntax + ",                                                pd_address_link.home_address,                                                pd_address_link.primary_office,                                                pd_address_link.additional_office, " +&
	"                                               pd_address_link.billing,                                                pd_address_link.mailing,                                                pd_address_link.exp_letters,                                                pd_address.rec_id"
ELSEIF ai_screen_id = 31 THEN
	ls_sql_syntax = ls_sql_syntax + ",                                                pd_address_link.home_address,                                                pd_address_link.primary_office,                                                pd_address_link.additional_office, " +&
	"                                               pd_address_link.billing,                                                pd_address_link.mailing,                                                pd_address_link.exp_letters,                                                pd_address_2.rec_id"
END IF
//\/maha 100702 for primary hosp link
IF ai_screen_id = 10 THEN
	ls_sql_syntax = ls_sql_syntax + ",                                                pd_hosp_facility_link.primary_hosp,                                                pd_hosp_facility_link.hosp_affil_id"
END IF
//ADD KEY FIELDS TO SELECT
li_key_cnt = 0
FOR i = 1 TO li_table_cnt
	ls_key_fields_syntax = ls_key_fields_syntax + ls_table_names[ i ] + ".prac_id, "
	li_key_cnt ++
	ls_key_fields[li_key_cnt] = ls_table_names[i] + ".prac_id"
	IF li_table_cnt > 1 THEN
		ls_key_fields_col_nm[li_key_cnt] = Mid(ls_table_names[ i ], 5, 100)  + "_prac_id"
	ELSE
		ls_key_fields_col_nm[li_key_cnt] = "prac_id"
	END IF

	li_key_cnt ++
	ls_key_fields_syntax = ls_key_fields_syntax + ls_table_names[ i ] + ".rec_id, "
	ls_key_fields[li_key_cnt] = ls_table_names[i] + ".rec_id"
	IF li_table_cnt > 1 THEN
		ls_key_fields_col_nm[li_key_cnt] = Mid(ls_table_names[ i ], 5, 100)  + "_rec_id"
		is_rec_id_col_nm = Mid(ls_table_names[ i ], 5, 100)  + "_rec_id"
	ELSE
		ls_key_fields_col_nm[li_key_cnt] = "rec_id"
		is_rec_id_col_nm = Mid(ls_table_names[ i ], 5, 100)  + "_rec_id"
	END IF		
END FOR

ls_sql_syntax = Mid( ls_sql_syntax, 1, 7 ) + ls_key_fields_syntax + Mid(ls_sql_syntax, 8, 10000)


//ASSIGN DW FIELD NAMES
IF li_table_cnt > 1 THEN
	lb_multi_table = True
	FOR i = 1 TO li_row_cnt
		//if len(ls_table_field_names[i]) < 1 then MessageBox( "","")
		ls_dw_field_names[i] = ls_table_field_names[i]
	END FOR	
ELSE
//	lb_multi_table = False  //Commented by ken at 2007-06-26
	FOR i = 1 TO li_row_cnt
		IF ai_screen_id = 2 OR ai_screen_id = 31  or ai_screen_id = 10 THEN
			ls_dw_field_names[i] = ls_table_field_names[i]			
			if li_master = 1 then //IF Upper( gs_user_id ) <> 'MASTER' THEN
				ls_dw_field_names[i] = ls_field_names[i]							
			END IF
		ELSE
			ls_dw_field_names[i] = ls_field_names[i]
		END IF
	END FOR
END IF

//BUILD FROM CLAUSE
ls_sql_syntax = ls_sql_syntax + " FROM "
FOR i = 1 TO li_table_cnt
	ls_sql_syntax = ls_sql_syntax + ls_table_names[i] + ", "
END FOR
ls_sql_syntax = Left( ls_sql_syntax, Len(ls_sql_syntax) -2 )

IF ai_screen_id = 2 OR ai_screen_id = 31 THEN
	ls_sql_syntax = ls_sql_syntax + ",                                                pd_address_link"
END IF

IF ai_screen_id = 10 then
	ls_sql_syntax = ls_sql_syntax + ",                                                pd_hosp_facility_link"
END IF

//ADD WHERE CLAUSE
ls_sql_syntax = ls_sql_syntax + " WHERE " + ls_table_names[1] + ".prac_id  = " + String( al_prac_id )

IF ls_table_name = "                                               pd_affil_staff_cat" OR ls_table_name = "                                               pd_affil_dept"  OR ls_table_name = "                                               pd_affil_staff_leave" OR ls_table_name = "                                               pd_affil_stat" THEN //                                               pd_affil_stat  added maha 120202
	ls_sql_syntax = ls_sql_syntax + " AND active_status = 1 "
//	messagebox("syntax",ls_sql_syntax)
//	clipboard(ls_sql_syntax)
END IF

IF ids_screen_fields.GetItemNumber(1, "facility_specific" ) = 1  and ai_screen_id <> 43 THEN //exception added for affil stat maha050403
	ls_sql_syntax = ls_sql_syntax + " AND " + ls_table_names[1] + ".facility_id  = " + String( ai_facility_id )
ELSEIF ai_screen_id = 2  OR ai_screen_id = 31 THEN
	ls_sql_syntax = ls_sql_syntax + " AND                                                pd_address_link.facility_id = " + String( ai_facility_id )
ELSEIF ai_screen_id = 10 THEN
	ls_sql_syntax = ls_sql_syntax + " AND                                                pd_hosp_facility_link.facility_id = " + String( ai_facility_id )
ELSEIF ai_screen_id = 43 then //Start Code Change ---- 10.23.2006 # maha
	ls_sql_syntax = ls_sql_syntax + " AND " + ls_table_names[1] + ".parent_facility_id  = " + String( ai_facility_id )

END IF

IF ai_screen_id = 2 THEN
	ls_sql_syntax = ls_sql_syntax + " AND                                                pd_address_link.address_id =                                                pd_address.rec_id "	

ELSEIF ai_screen_id = 31 THEN
	ls_sql_syntax = ls_sql_syntax + " AND                                                pd_address_link.address_id =                                                pd_address_2.rec_id "
END IF

IF ai_screen_id = 10 THEN
	ls_sql_syntax = ls_sql_syntax + " AND                                                pd_hosp_facility_link.hosp_affil_id =                                                pd_hosp_affil.rec_id "	
END IF

//CREATE SORT ORDER
ids_screen_fields.SetSort( "sort_field A" )
ids_screen_fields.Sort()
ls_sort_syntax = " ORDER BY "
FOR i = 1 TO ids_screen_fields.rowcount()
	IF ids_screen_fields.GetItemNumber( i, "sort_field" ) > 0 THEN
		IF ids_screen_fields.GetItemString( i, "sort_order" ) = "D" THEN
			IF ai_screen_id = 2 THEN
				ls_sort_syntax = ls_sort_syntax + "                                               pd_address." +ids_screen_fields.GetItemString( i, "db_field_name" ) + " DESC,"
			ELSEIF ai_screen_id = 31 THEN	//06.28.2007 By Jervis:Add ai_screen_id = 31
				ls_sort_syntax = ls_sort_syntax + "                                               pd_address_2." +ids_screen_fields.GetItemString( i, "db_field_name" ) + " DESC,"
			ELSEIF ai_screen_id = 10 THEN
				ls_sort_syntax = ls_sort_syntax + "                                               pd_hosp_affil." +ids_screen_fields.GetItemString( i, "db_field_name" ) + " DESC,"
			ELSE
				ls_sort_syntax = ls_sort_syntax + ids_screen_fields.GetItemString( i, "db_field_name" ) + " DESC,"
			END IF
		ELSE
			IF ai_screen_id = 2 THEN
				ls_sort_syntax = ls_sort_syntax + "                                               pd_address." +ids_screen_fields.GetItemString( i, "db_field_name" ) + " ASC,"
			ELSEIF ai_screen_id = 31 THEN	//06.28.2007 By Jervis:Add ai_screen_id = 31
				ls_sort_syntax = ls_sort_syntax + "                                               pd_address_2." +ids_screen_fields.GetItemString( i, "db_field_name" ) + " ASC,"
			ELSEIF ai_screen_id = 10 THEN
				ls_sort_syntax = ls_sort_syntax + "                                               pd_hosp_affil." +ids_screen_fields.GetItemString( i, "db_field_name" ) + " ASC,"
			ELSE
				ls_sort_syntax = ls_sort_syntax + ids_screen_fields.GetItemString( i, "db_field_name" ) + " ASC,"
			END IF		
		END IF
		li_sort_data_cnt ++
	END IF
END FOR

//ADD order BY CLAUSE
IF li_sort_data_cnt > 0 THEN
	ls_sort_syntax = Mid( ls_sort_syntax, 1, Len( ls_sort_syntax )-1 )
	ls_sql_syntax = ls_sql_syntax + ls_sort_syntax
ELSE //if no sort fields sort on rec_id
	IF ai_screen_id = 2  THEN //maha added 032204
		ls_sql_syntax = ls_sql_syntax + " ORDER BY                                                pd_address.rec_id "
	ELSEIF ai_screen_id = 31 THEN
		ls_sql_syntax = ls_sql_syntax + " ORDER BY                                                pd_address_2.rec_id "
	ELSEIF ai_screen_id = 10 THEN
		ls_sql_syntax = ls_sql_syntax + " ORDER BY                                                pd_hosp_affil.rec_id"
	else
		ls_sql_syntax = ls_sql_syntax + " ORDER BY rec_id"
	end if
END IF

ids_screen_fields.SetSort( "field_order A" )
ids_screen_fields.Sort()

//messagebox("syntax",ls_sql_syntax)
//	clipboard(ls_sql_syntax)
//CREATE SYNTAX FOR DETAIL DW
ls_grey = String(rgb(192,192,192))
ls_presentation_str = "style(type=form)" + " Column(Border=5 ) Datawindow(Color=" + ls_grey + " )" + "Text(Background.Color=" + ls_grey + ")"  

ls_dwsyntax_str = ATR_SQLCA.SyntaxFromSQL(ls_sql_syntax, ls_presentation_str, ERRORS)

if ai_screen_id = 65 then
	//messagebox("65",ls_sql_syntax)
	
end if
//debugbreak()
IF Len(ERRORS) > 0 THEN
	MessageBox("Caution", &
	"SyntaxFromSQL caused these errors: " + ERRORS)
	RETURN -1
END IF

adw_detail.Create( ls_dwsyntax_str, ERRORS)



IF Len(ERRORS) > 0 THEN
	MessageBox("Caution", "Create cause these errors: " + ERRORS)
	RETURN -1
END IF

 // mskinner 29 december 2005 -- begin
for i = 1 to upperbound(ls_dw_field_names)
//	if ai_screen_id = 1  then
//		ls_dw_field_names[i] = adw_detail.of_get_column_name(ls_dw_field_names[i])
//		//messagebox("",ls_dw_field_names[i])
//	end if
//	if li_master = 1 then
//		ls_dw_field_names[i] = ls_table_name  + ls_dw_field_names[i]
//	else
	if gs_dbtype = "ASA" then
	//Start Code Change ---- 06.20.2006 #564 maha
		choose case ai_screen_id
			case 2, 31, 18,10
				ls_dw_field_names[i] = ls_table_prefix + ls_dw_field_names[i]
		end choose
				
//		if ai_screen_id = 2  then
//			ls_dw_field_names[i] = "pd_address_" + ls_dw_field_names[i]
//		elseif ai_screen_id = 31 then
//			ls_dw_field_names[i] = "pd_address_2_" + ls_dw_field_names[i]
//			elseif ai_screen_id = 10  then
//			ls_dw_field_names[i] = "pd_hosp_affil_" + ls_dw_field_names[i]
//		end if
	end if
	//End Code Change---06.20.2006
////	end if
	
next
// mskinner 29 december 2005 -- end

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> UM-10
//$<add> 01.24.2006 By: Luke
//$<reason> It is currently unsupported to automatically change a column's edit style on the Web.
//$<modification> Modify the DataWindow syntax and then rebuild the DataWindow to
//$<modification> implement the functionality of changing a column's edit style.
long set1
If appeongetclienttype() <> 'PB' Then
	string ls_appeon_colname[],ls_editmask_colname[],ls_editmask_modify[]
	long li_appeon_index ,li_appeon_index2 
	
	ls_dwsyntax_str = adw_detail.describe("datawindow.syntax")
	li_appeon_index = 1
	li_appeon_index2 = 1
	
	FOR i = 1 TO li_row_cnt//ids_screen_fields.rowcount()
		IF ls_dw_field_names[i] = "active_status" THEN
			ls_appeon_colname[li_appeon_index] = ls_dw_field_names[i]
			li_appeon_index++
		END IF
		
		IF ids_screen_fields.GetItemString( i, "lookup_field") = "Y" THEN
			ls_appeon_colname[li_appeon_index] = ls_dw_field_names[i]
			li_appeon_index++
		END IF
	
	END FOR
	
	//specail code for pd_address
	IF ls_table_name = "pd_address" THEN
		set1 = of_get_app_setting("set_1","I")
		
		if set1 = 1 then //maha 072301 create populate button only if using addresses for find
			ls_appeon_colname[li_appeon_index] = 'street'
			li_appeon_index++
		end if
					
		ls_appeon_colname[li_appeon_index] = 'billing_address_id'
		li_appeon_index++
	END IF
	
	of_change_to_dddw (ls_dwsyntax_str,ls_appeon_colname)
	
	adw_detail.Create( ls_dwsyntax_str, ERRORS)
	
	IF Len(ERRORS) > 0 THEN
		MessageBox("Caution", &
		"Create cause these errors: " + ERRORS + ls_dwsyntax_str)
		clipboard(ls_dwsyntax_str)
		RETURN -1
	END IF
End If
//---------------------------- APPEON END ----------------------------



//ls_sqlsyn = adw_detail.describe("datawindow.Objects")
//	openwithparm(w_sql_msg,ls_sqlsyn)
//messagebox("", ls_Sql_syntax)

adw_detail.of_SetTransObject( ATR_SQLCA )
li_prac_row_cnt = adw_detail.Retrieve()

//adw_detail.Object.DataWindow.Detail.Height= 5000
//adw_detail.Modify("active_status.Initial='1'")

FOR i = 1 TO li_row_cnt

	//visible
//	IF ids_screen_fields.GetItemString(i, "visible") = "N" THEN
//		adw_detail.Modify(ls_dw_field_names[i] + ".color = '8421504'") 
//		adw_detail.Modify(ls_dw_field_names[i] + ".background.color = '12632256'") 
//		adw_detail.Modify(ls_dw_field_names[i] + "_t.color = '8421504'") 
//	ELSE
//		adw_detail.Modify(ls_dw_field_names[i] + ".color = '0'") 
//		adw_detail.Modify(ls_dw_field_names[i] + "_t.color = '0'")
//		adw_detail.Modify(ls_dw_field_names[i] + ".background.color = '16777215'") 		
//	END IF
//

//	IF Len(ls_dw_field_names[i]) > 0 AND lb_first_field THEN
//		lb_first_field = False
//		is_first_column = ls_dw_field_names[i]
//	END IF
//	adw_detail.Modify( ls_dw_field_names[i] + ".TabSequence = '" + String(i) + "'" )		
//
//
//	adw_detail.Modify( ls_dw_field_names[i] + "_t.text = '" + ls_field_label[i] + "'")
//
//	//bold or not?
//	adw_detail.Modify( ls_dw_field_names[i] + "_t.font.weight = '" + ls_fld_lbl_font_wght + "'")	
//

//	li_fld_label_width = ids_screen_fields.GetItemNumber( i, "field_label_width" )
//	li_fld_width = ids_screen_fields.GetItemNumber( i, "field_width" ) 
//	adw_detail.Modify( ls_dw_field_names[i] + ".width = '" + String( li_fld_width ) + "'" )	
//	adw_detail.Modify( ls_dw_field_names[i] + "_t.width = '" + String( li_fld_label_width ) + "'" )
//	adw_detail.Modify( ls_dw_field_names[i] + ".height = '" + String( ls_field_label_height[i] ) + "'" )

	
//	IF ls_field_x[i] = "0" THEN
//		adw_detail.Modify( ls_dw_field_names[i] + ".x = 750")
//		adw_detail.Modify( ls_dw_field_names[i] + ".y = " + String(i*100) )
//
//		adw_detail.Modify( ls_dw_field_names[i] + "_t.x = 100")
//		adw_detail.Modify( ls_dw_field_names[i] + "_t.y = " + String(i*100) )
//	ELSE
//		adw_detail.Modify( ls_dw_field_names[i] + ".x = " + ls_field_x[i] )
//		adw_detail.Modify( ls_dw_field_names[i] + ".y = " + ls_field_y[i] )
//
//		adw_detail.Modify( ls_dw_field_names[i] + "_t.x = " + ls_field_label_x[i] )
//		adw_detail.Modify( ls_dw_field_names[i] + "_t.y = " + ls_field_label_y[i] )		
//	END IF
//
	//tag value set to field id
	//adw_detail.Modify( ls_dw_field_names[i] + ".tag = '" + ls_field_id[i] + "'" )
	//adw_detail.Modify( ls_dw_field_names[i] + "_t.tag = '" + ls_field_id[i] + "'" )

	//alignment
	//adw_detail.Modify( ls_dw_field_names[i] + ".alignment = '" + ids_screen_fields.GetItemString( i, "justification" ) + "'" )	
	//adw_detail.Modify( ls_dw_field_names[i] + "_t.alignment = '" + String( ids_screen_fields.GetItemNumber( i, "field_label_justification" ) ) + "'" )	
   
	
	IF pos(ls_dw_field_names[i],"active_status") > 0 then //ls_dw_field_names[i] = "active_status" THEN
		//adw_detail.Modify( ls_dw_field_names[i] + ".dddw.VscrollBar = Yes")			
		//adw_detail.Modify( ls_dw_field_names[i] + ".dddw.useasborder = Yes")			
		//adw_detail.Modify( ls_dw_field_names[i] + ".dddw.NilIsNull= Yes")
		//adw_detail.Modify( ls_dw_field_names[i] + ".dddw.Lines= 15")
		//adw_detail.Modify( ls_dw_field_names[i] + "_t.font.underline = '1'")
		//adw_detail.Modify( ls_dw_field_names[i] + ".dddw.Required = Yes")
		adw_detail.Modify( ls_dw_field_names[i] + ".dddw.name = 'd_code_lookup_active_inactive'")
		adw_detail.Modify( ls_dw_field_names[i] + ".dddw.datacolumn = 'lookup_code'")			
		adw_detail.Modify( ls_dw_field_names[i] + ".dddw.displaycolumn = 'description'")				
	END IF
	
	IF ids_screen_fields.GetItemString( i, "lookup_field") = "Y" THEN
		//if ai_screen_id = 81 then debugbreak()
		ls_lookup_code = ids_screen_fields.GetItemString( i, "lookup_code" )
		ls_lookup_field = ids_screen_fields.GetItemString( i, "lookup_field_name" )
		ls_lookup_type = ids_screen_fields.GetItemString( i, "lookup_type" )
		//adw_detail.Modify( ls_dw_field_names[i] + ".dddw.VscrollBar = Yes")			
		//adw_detail.Modify( ls_dw_field_names[i] + ".dddw.AutoHScroll = Yes")			
		//adw_detail.Modify( ls_dw_field_names[i] + ".dddw.useasborder = Yes")			
		//adw_detail.Modify(ls_dw_field_names[i] + ".dddw.NilIsNull= Yes")
		//adw_detail.Modify(ls_dw_field_names[i] + ".dddw.Lines= 15")
		//IF ids_screen_fields.GetItemString(i, "required") = "Y" THEN
		//	adw_detail.Modify(ls_dw_field_names[i] + "_t.font.underline = '1'")
		//	adw_detail.Modify(ls_dw_field_names[i] + ".dddw.Required = Yes")
		//END IF	
integer ll_ret
		IF ls_lookup_type = "C" THEN
			ls_ret = adw_detail.Modify( ls_dw_field_names[i] + ".dddw.name = 'd_dddw_code_lookup_ds'")//Start Code Change ---- 06.06.2006 #510 maha
			ls_ret = adw_detail.Modify( ls_dw_field_names[i] + ".dddw.datacolumn = 'lookup_code'")			
			IF Upper( ls_lookup_field ) = "CODE" THEN
				ls_ret = adw_detail.Modify( ls_dw_field_names[i] + ".dddw.displaycolumn = 'code'")
			ELSE
				ls_ret = adw_detail.Modify( ls_dw_field_names[i] + ".dddw.displaycolumn = 'description'")				
			END IF
		ELSEIF ls_lookup_type = "A" THEN
			//adw_detail.Modify( ls_dw_field_names[i] + ".dddw.HscrollBar = Yes")			
			ls_ret =adw_detail.Modify( ls_dw_field_names[i] + ".dddw.name = 'd_dddw_address_lookup_for_lookup_code'")			
			//adw_detail.Modify( ls_dw_field_names[i] + ".dddw.name = 'd_dddw_address_lookup'")
			ls_ret =adw_detail.Modify( ls_dw_field_names[i] + ".dddw.datacolumn = 'lookup_code'")			
			IF Upper( ls_lookup_field ) = "CODE" THEN
				ls_ret =adw_detail.Modify( ls_dw_field_names[i] + ".dddw.displaycolumn = 'code'")
			ELSE
				ls_ret = adw_detail.Modify( ls_dw_field_names[i] + ".dddw.displaycolumn = 'entity_name'")			
			END IF
//Start Code Change ---- 02.09.2006 #261 maha			
		ELSEIF ls_lookup_type = "Q" THEN
			ls_ret = adw_detail.Modify( ls_dw_field_names[i] + ".dddw.name = 'd_dddw_quest_lookup_ds'")//Start Code Change ---- 06.07.2006 #524 maha
			ls_ret = adw_detail.Modify( ls_dw_field_names[i] + ".dddw.datacolumn = 'quest_id'")			
			ls_ret = adw_detail.Modify( ls_dw_field_names[i] + ".dddw.displaycolumn = 'short_quest'")
				//adw_browse.Modify( ls_dw_field_names[i] + ".dddw.displaycolumn = 'full_quest'")						
//End Code Change---02.09.2006				
		END IF
		
		//adw_detail.Modify( ls_dw_field_names[i] + ".dddw.AllowEdit = Yes")
		//adw_detail.Modify( ls_dw_field_names[i] + ".dddw.VScrollBar = Yes")
		//adw_detail.Modify( ls_dw_field_names[i] + ".dddw.HScrollBar = Yes")
		//adw_detail.Modify( ls_dw_field_names[i] + ".dddw.PercentWidth = '" + ls_dddw_width[i] + "'")
		

		//messagebox("", ls_dw_field_names[i] )
		//debugbreak()
		//MESSAGEBOX("", ADW_DETAIL.describe(ls_dw_field_names[i] + ".color" ) )

    
		li_retval = adw_detail.GetChild(ls_dw_field_names[i] , dwchild )
		IF li_retval = -1 THEN
			//if len(ls_dw_field_names[i]) < 1 then MessageBox( "","")
			MessageBox( string(ai_screen_id) + "-" + ls_dw_field_names[i], "dwchild error in of_create_dynamic_ds function." )
		END IF
	
	
		dwchild.SetTransObject( ATR_SQLCA )
		//messagebox("", ls_lookup_code )
		IF ls_lookup_type = "C" THEN
			dwchild.Retrieve(ls_lookup_code)	
		END IF
		
//	ELSEIF ls_dw_field_names[i] <> "active_status" THEN
//		adw_detail.Modify(ls_dw_field_names[i] + ".Edit.NilIsNull= Yes")
//		IF ids_screen_fields.GetItemString(i, "required") = "Y" THEN
//			adw_detail.Modify(ls_dw_field_names[i] + "_t.font.underline = '1'")			
//			adw_detail.Modify(ls_dw_field_names[i] + ".Edit.Required = Yes")
//		END IF	
//		IF ls_mask[i] <> "" THEN
//			adw_detail.Modify( ls_dw_field_names[i] + ".Edit.CodeTable = Yes")
//			adw_detail.Modify( ls_dw_field_names[i] + ".Edit.ValidateCode = Yes" )
//			adw_detail.Modify( ls_dw_field_names[i] + ".ValidationMsg = 'Invalid Month, Select a number from 1 and 12.'" )
//			//adw_detail.Modify( ls_dw_field_names[i] + ".EditMask.Mask='" + ls_mask[i] + "'")
//			IF ls_mask[i] = "##" THEN
//				FOR m = 1 TO 12
//					ls_month = String(m)
//					adw_detail.SetValue( ls_dw_field_names[i], m, ls_month + "~t" + ls_month )
//				END FOR
//				m1 = 0
//				FOR m = 13 TO 21
//					m1++
//					ls_month = "0" + String(m1)
//					adw_detail.SetValue( ls_dw_field_names[i], m, ls_month + "~t" + ls_month )
//				END FOR
//				adw_detail.Modify( ls_dw_field_names[i] + ".Edit.Limit = '2'" )			
//				
//			ELSEIF ls_mask[i] = "(###)###-####" THEN
//				adw_detail.Modify( ls_dw_field_names[i] + ".EditMask.Mask='(###)###-####'" )
//			ELSEIF ls_mask[i] = "###-##-####" THEN
//				adw_detail.Modify( ls_dw_field_names[i] + ".EditMask.Mask='###-##-####'")								
//			ELSEIF ls_mask[i] = "####" THEN
//				li_index = 0
//				FOR m = 1880 TO 2050
//					li_index++
//					adw_detail.SetValue( ls_dw_field_names[i], li_index, String(m) + "~t" + String(m) )
//				END FOR
//				adw_detail.Modify( ls_dw_field_names[i] + ".Edit.Limit = '4'" )			
//				adw_detail.Modify( ls_dw_field_names[i] + ".ValidationMsg = 'Invalid Year, Select a number between 1880 and 2050.'" )
//			ELSEIF ls_mask[i] = "mm/dd/yyyy" THEN
//				//adw_detail.Modify( ls_dw_field_names[i] + ".EditMask.Mask ='mm/dd/yyyy'")
//				adw_detail.Modify( ls_dw_field_names[i] + ".Format='mm/dd/yyyy'")
//			ELSEIF ls_mask[i] = "#,##0.00" THEN
//				adw_detail.Modify( ls_dw_field_names[i] + ".Format='#,##0'")
//			END IF
//		END IF	
	END IF
END FOR


//CREATE SORT ORDER //maha remodified this code 032204 for resetting the sort in application printing
ids_screen_fields.SetSort( "sort_field A" )
ids_screen_fields.Sort()
ls_sort_fields = ""
FOR i = 1 TO li_row_cnt
	IF ids_screen_fields.GetItemNumber( i, "sort_field" ) > 0 THEN
		IF ids_screen_fields.GetItemString( i, "sort_order" ) = "D" THEN //set direction
			ls_dir = " D,"
		else
			ls_dir = " A,"
		end if
		
		//if li_master = 1  then //upper(gs_user_id) = "MASTER" then
		if lb_multi_tablE then		//Modified by ken at 2007-06-26	
			ls_sort_fields = ls_sort_fields + ls_table_prefix + ids_screen_fields.GetItemString( i, "db_field_name" ) + ls_dir
		else
			ls_sort_fields = ls_sort_fields + ids_screen_fields.GetItemString( i, "db_field_name" ) + ls_dir
		end if
//		elseif ai_screen_id = 10 THEN
//			if li_master = 1 then //if upper(gs_user_id) = "MASTER" then
//				ls_sort_fields = ls_sort_fields + "pd_hosp_affil_" + ids_screen_fields.GetItemString( i, "db_field_name" ) + ls_dir	
//			else
//				ls_sort_fields = ls_sort_fields + ids_screen_fields.GetItemString( i, "db_field_name" ) + ls_dir
//			end if
//		ELSE
//			ls_sort_fields = ls_sort_fields + ids_screen_fields.GetItemString( i, "db_field_name" ) + ls_dir							
//		END IF
		
		li_sort_data_cnt ++
	END IF
END FOR


IF li_sort_data_cnt > 0 THEN
	ls_sort_fields = Mid( ls_sort_fields, 1, Len( ls_sort_fields )-1 ) //take out the last comma
ELSE
	ls_sort_fields = "rec_id A" //set to recid then overwrite for exceptions
//Start Code Change ---- 06.20.2006 #564 maha	
	choose case ai_screen_id
		case 2, 31, 18,10	//06.28.2007 By Jervis Add 10
			ls_sort_fields = ls_table_prefix + "rec_id A"
		case 43,44,45,32 //affil tables  //Start Code Change ---- 10.25.2006 # maha
			ls_sort_fields = "rec_id D"
	end choose
//End Code Change---06.20.2006	
//	IF ai_screen_id = 2 or ai_screen_id = 31 THEN
//		if li_master = 1 then //if upper(gs_user_id) = "MASTER" then
//			ls_sort_fields = "pd_address_rec_id A"
//		end if
//	ELSEIF ai_screen_id = 10 THEN
//		if li_master = 1 then //if upper(gs_user_id) = "MASTER" then
//			ls_sort_fields = "pd_hosp_affil.rec_id A"
//		end if
//	END IF
END IF
//MessageBox("", ls_sort_fields )
adw_detail.SetSort( ls_sort_fields)


is_sort_syntax = ls_sort_fields
adw_detail.Sort()

//End Code Change---11.21.2005 

RETURN 0
end function

public function integer of_add_committees (long al_prac_id, integer ai_facility_id, long al_rec_id);//maha created 011706.  //called from net dev of_add_multi and w_batch_add_new_app of_batch_add_apps
//Start Code Change ---- 01.17.2006 #201 maha
n_ds lds_cred_comms
n_ds lds_cred_committees
Integer li_num_comms
Integer c
Integer li_nr
long ll_comm_id

lds_cred_committees = CREATE n_ds
lds_cred_committees.DataObject = "d_pd_comm_review" 
lds_cred_committees.of_SetTransObject( SQLCA )

lds_cred_comms = CREATE n_ds
lds_cred_comms.DataObject = "d_dddw_credentialing_committees" 
lds_cred_comms.of_SetTransObject( SQLCA )
li_num_comms = lds_cred_comms.Retrieve( ai_facility_id )
//debugbreak()	
FOR c = 1 TO li_num_comms
	li_nr = lds_cred_committees.InsertRow( 0 )
	ll_comm_id = lds_cred_comms.GetItemNumber( c, "committee_id" )
	lds_cred_committees.SetItem( li_nr, "facility_id", ai_facility_id )
	lds_cred_committees.SetItem( li_nr, "committee_id", ll_comm_id )
	lds_cred_committees.SetItem( li_nr, "active_status", 1 )
	lds_cred_committees.SetItem( li_nr, "rec_id", al_rec_id )
	lds_cred_committees.SetItem( li_nr, "prac_id", al_prac_id )
	lds_cred_committees.SetItem( li_nr, "seq_no", 1 )
END FOR
	
lds_cred_committees.Update( )

DESTROY lds_cred_comms;
DESTROY lds_cred_committees;


Return 1

//End Code Change---01.17.2005 
end function

public function integer of_change_to_dddw (ref string as_syntax, string as_colname[]);//////////////////////////////////////////////////////////////////////
// $<function>of_change_colname_dddw()
// $<arguments>
//		string as_syntax - daatawindow  syntax .
//  	string as_colname - the columns that need change style to dddw
// $<returns> integer  -1 - error 1 - success
// $<description> This function using for change the column style before dynamic creating datawindow.
// $<description> This function only used in web application.
//////////////////////////////////////////////////////////////////////
// $<add> 01.13.2006 by Luke
//////////////////////////////////////////////////////////////////////

if upperbound(as_colname) <=0 then return -1

gnv_appeondll.of_changeeditstyle( as_syntax, as_colname, upperbound(as_colname) , 1)

Return 1


end function

public function integer of_change_to_editmask (ref string as_syntax, string as_colname[]);//////////////////////////////////////////////////////////////////////
// $<function>of_change_colname_dddw()
// $<arguments>
//		string as_syntax - daatawindow  syntax .
//  	string as_colname - the columns which need to change edit style as editmask
// $<returns> integer  -1 - error 1 - success
// $<description> This function using to change the column style before dynamic creating datawindow. 
// $<description> This function only used in web application 
//////////////////////////////////////////////////////////////////////
// $<add> 01.13.2006 by Luke
//////////////////////////////////////////////////////////////////////
if upperbound(as_colname) <=0 then return -1

gnv_appeondll.of_changeeditstyle( as_syntax, as_colname, upperbound(as_colname) , 2)

Return 1
end function

public function integer of_dwchild_after_retrieve (u_dw adw_dw);//////////////////////////////////////////////////////////////////////
// $<function>pfc_cst_nv_data_entry_functionsof_dwchild_after_retrieve()
// $<arguments>
//		value	u_dw	adw_dw		
// $<returns> integer
// $<description> This function is used to retrieve data from the database for DDDWs stored in is_dddwcolumns.
// $<description>
//////////////////////////////////////////////////////////////////////
// $<add> 01.25.2006 by Cao YongWang
//////////////////////////////////////////////////////////////////////

long ll_val
datawindowchild dwchild
long ll_find
long ert , ll_row
String	ls_columnname
String	ls_types[] , ls_froms[] , ls_dddwcolumns[] , ls_lu_tables[] 
long		ll_values[]
If appeongetservertype() = 2 Then //APB 6.0 .Net
	//--------------------------- APPEON BEGIN ---------------------------
	//$<add> 09.24.2008 By: Ken.Guo
	//$<reason> Workaround APB6.0's Bug before Appeon fixed it
	For ll_row = 1 to upperbound(is_dddwcolumns)
		ls_columnname = is_dddwcolumns[ll_row]
		adw_dw.GetChild( ls_columnname, dwchild )
		IF is_types[ll_row] = "A" THEN
			If dwchild.GetItemnumber(1,'lookup_code') <> 0 And Not isnull( dwchild.GetItemnumber(1,'lookup_code')) Then 
				if dwchild.Describe("entity_name_original.ColType") <> "!" then
					dwchild.InsertRow(1)
					dwchild.setitem(1,"code",'-SEARCH/ADD-')
					dwchild.setitem(1,"lookup_code",-888)
					dwchild.setitem(1,"entity_name_original","-Search/Add for " + is_lu_tables[ll_row] +" -")
					dwchild.setitem(1,"entity_name","-Search/Add for " + is_lu_tables[ll_row] +" -")
					dwchild.InsertRow(1) //blank row
				end if
			End If
		End if

		If is_froms[ll_row] = "RET" then
			ll_val = il_values[ll_row]
			ll_find = dwchild.find("lookup_code = " + string(ll_val),1,dwchild.rowcount())
			if ll_find > 0 then
				dwchild.scrolltorow(ll_find)
			end if
		End if
	Next
	is_types[] = ls_types[]
	is_froms[] = ls_froms[]
	is_dddwcolumns[] = ls_dddwcolumns[]
	is_lu_tables[] = ls_lu_tables[]
	il_values[] = ll_values[]	
	//---------------------------- APPEON END ----------------------------
Else  //APB 5.0 j2EE
	For ll_row = 1 to upperbound(is_dddwcolumns)
		ls_columnname = is_dddwcolumns[ll_row]
		adw_dw.GetChild( ls_columnname, dwchild )
	
		if is_froms[ll_row] = "RET" and is_types[ll_row] = "A" then 
			//app_filler.ids_screen_objects_cache.Retrieve()
		end if

		IF is_types[ll_row] = "C" THEN
			choose case is_lu_tables[ll_row]
				case "Address Type", "Yes/No","Specialty Order"
					//exceptions
					//dwchild.retrieve(as_lu_table)
				case else
					//dwchild.retrieve(as_lu_table)
					//dwchild.InsertRow(1)
					//dwchild.setitem(1,"code",'-SEARCH/Add-')
					//dwchild.setitem(1,"lookup_code",-777)
					//dwchild.setitem(1,"description","-Search/Add for " + is_lu_tables[ll_row] +" -")
			end choose
		ELSEIF is_types[ll_row] = "A" THEN
			//debugbreak()
			/*
			//comment by appeon 2006.07.11
			if dwchild.Describe("entity_name_original.ColType") <> "!" then
							
				dwchild.InsertRow(1)
				//messagebox("2",string(dwchild.rowcount()))
				dwchild.setitem(1,"code",'-SEARCH/ADD-')
				dwchild.setitem(1,"lookup_code",-888)
				dwchild.setitem(1,"entity_name_original","-Search/Add for " + is_lu_tables[ll_row] +" -")
				//ert = dwchild.getitemnumber(1,"lookup_code")
				//messagebox("",as_lu_table)
			end if
			*/
		elseif is_types[ll_row] = "Q" THEN
				//dwchild.Retrieve()
		end if
		if is_types[ll_row] = "A" then
			//dwchild.InsertRow(1)
		end if
		//	dwchild.InsertRow(1) //blank row
		if is_froms[ll_row] = "RET" then
			ll_val = il_values[ll_row]
			ll_find = dwchild.find("lookup_code = " + string(ll_val),1,dwchild.rowcount())
			if ll_find > 0 then
				dwchild.scrolltorow(ll_find)
			end if
		end if
	Next
	is_types[] = ls_types[]
	is_froms[] = ls_froms[]
	is_dddwcolumns[] = ls_dddwcolumns[]
	is_lu_tables[] = ls_lu_tables[]
	il_values[] = ll_values[]
End If
return 1
end function

public subroutine of_dwchild_after_retrieve_2 (u_dw adw_dw);//////////////////////////////////////////////////////////////////////
// $<function>pfc_cst_nv_data_entry_functions.of_dwchild_after_retrieve_2
// $<arguments>
//		value	u_dw	adw_dw		
// $<returns> integer
// $<description> This function is used to add a blank row for each DDDW stored in is_dddwcolumns.  
// $<description> At the same time, the application clears the values of is_types[], is_froms[],
// $<description> is_dddwcolumns[], is_lu_tables[] and il_values[]
//////////////////////////////////////////////////////////////////////
// $<add> 01.25.2006 by Cao YongWang
//////////////////////////////////////////////////////////////////////

long ll_val
datawindowchild dwchild
long ll_find
long ert , ll_row
String	ls_columnname
String	ls_types[] , ls_froms[] , ls_dddwcolumns[] , ls_lu_tables[] 
long		ll_values[]

For ll_row = 1 to upperbound(is_dddwcolumns)
	ls_columnname = is_dddwcolumns[ll_row]
	adw_dw.GetChild( ls_columnname, dwchild )
   
	dwchild.InsertRow(1) //blank row
	
Next
//Set null
is_types[] = ls_types[]
is_froms[] = ls_froms[]
is_dddwcolumns[] = ls_dddwcolumns[]
is_lu_tables[] = ls_lu_tables[]
il_values[] = ll_values[]

end subroutine

public function string of_create_dynamic_dw_local (long al_prac_id, integer ai_data_view_id, integer ai_screen_id, u_dw adw_detail, u_dw adw_browse, boolean ab_screen_painter, integer ai_facility_id);//////////////////////////////////////////////////////////////////////
// $<function>pfc_cst_nv_data_entry_functions.of_create_dynamic_dw_local()
// $<arguments>
//		value	long   	al_prac_id       		
//		value	integer	ai_data_view_id  		
//		value	integer	ai_screen_id     		
//		value	u_dw   	adw_detail       		
//		value	u_dw   	adw_browse       		
//		value	boolean	ab_screen_painter		
//		value	integer	ai_facility_id   		
// $<returns> string
// $<description> Create the datawindow by using local datawindow syntax.
// $<description>
//////////////////////////////////////////////////////////////////////
// $<add> 03.10.2006 by Cao YongWang
//////////////////////////////////////////////////////////////////////

SetPointer(HourGlass!)
boolean	ib_create_browse
String	ls_dummy_array[]
integer	li_row_cnt
integer  li_set
integer	li_obj_cnt
integer	li_table_cnt
integer	i
string	ls_table_name
string	ls_table_field_names[]
string	ls_field_name
string	ls_field_names[]
integer  t
string	ls_table_names[]
boolean	lb_table_found
boolean  lb_multi_table
string	ls_dw_field_names[]
string	ls_sql_syntax
integer	li_facility_specific
string	ls_dwsyntax_str
string	ERRORS
string	ls_return_syntax
integer	li_prac_row_cnt
boolean	lb_first_field = true
string	ls_lookup_code
string	ls_lookup_field
string	ls_lookup_type
integer	res
string	ls_retval
long     ll_max_height
DataWindowChild dwchild
DataWindowChild dwchild_browse

long 		set1 , ll_recreate
string	ls_sqlselect , ls_column_list,table_list,ls_where_clause,ls_group_by_clause,ls_order_by_clause,ls_having_clause

//debugbreak()

//li_row_cnt is all the screen's fields
//upperbound- ls_dw_field_names[] is all visible fields only
ib_create_browse = True

IF adw_detail = adw_browse THEN
	ib_create_browse = False
END IF

is_column_default[] = ls_dummy_array[]
is_column_names[] = ls_dummy_array[]

//UNREGISTER ALL CALENDAR FIELDS
IF NOT ab_screen_painter THEN
	adw_detail.iuo_calendar.of_UnRegister()		
END IF


app_filler.ids_screen_fields_cache.ShareData( ids_screen_fields )
//messagebox("", "view_id = " + String (ai_data_view_id) + " AND screen_id = " + String( ai_screen_id ) )
ids_screen_fields.SetFilter( "view_id = " + String (ai_data_view_id) + " AND screen_id = " + String( ai_screen_id ) )
ids_screen_fields.Filter( )	
li_row_cnt = ids_screen_fields.RowCount()	

app_filler.ids_screen_objects_cache.ShareData( ids_screen_objects )
ids_screen_objects.SetFilter( "view_id = " + String (ai_data_view_id) + " AND screen_id = " + String( ai_screen_id ) )
ids_screen_objects.Filter( )
li_obj_cnt = ids_screen_objects.RowCount()

ids_screen_fields.SetSort( "field_order A" )
ids_screen_fields.sort( ) //should be by field_order maha 051905 ######

ii_column_cnt = 0

li_table_cnt = 0

adw_detail.SetRedraw(False)

//CREATE SORT ORDER
integer wer  //#####

wer = ids_screen_fields.SetSort( "field_order A" )
//messagebox("field_order",wer)
//ids_screen_fields.SetSort( "field_sort A" )
ids_screen_fields.Sort()

//BUILD SELECT 
FOR i = 1 TO li_row_cnt
	IF ( NOT ab_screen_painter AND ids_screen_fields.GetItemString(i, "visible") = "N" ) THEN
		CONTINUE //for visible =N do not add to the DE screen dw
	END IF
	ii_column_cnt++
	ls_table_name = Trim( ids_screen_fields.GetItemString( i, "db_table_name" ))
	ls_field_name = Trim( ids_screen_fields.GetItemString( i, "db_field_name" ))
	is_column_names[ii_column_cnt] = ls_field_name	
	is_column_default[ii_column_cnt] = ids_screen_fields.GetItemString( i, "default_value" )
	
	ls_table_field_names[i] = Mid( ls_table_name,5,100 ) + "_" + ls_field_name
	is_table_name = ls_table_name
	ls_field_names[i] = ls_field_name
	FOR t = 1 TO li_table_cnt
		IF ls_table_names[t] = ls_table_name THEN
			lb_table_found = True
		   EXIT
		END IF
	END FOR
	IF NOT lb_table_found THEN
		li_table_cnt ++
		ls_table_names[ li_table_cnt ] = ls_table_name
	END IF
END FOR

li_row_cnt = UpperBound(ls_field_names)

FOR i = 1 TO li_table_cnt
	IF ids_screen_fields.GetItemNumber(i, "facility_specific" ) = 1 THEN
		li_facility_specific = 1
	END IF	
END FOR  

//ASSIGN DW FIELD NAMES
IF li_table_cnt > 1 THEN
	lb_multi_table = True
	FOR i = 1 TO li_row_cnt
		ls_dw_field_names[i] = ls_table_field_names[i]
	END FOR	
ELSE
	lb_multi_table = False
	FOR i = 1 TO li_row_cnt
		ls_dw_field_names[i] = ls_field_names[i]
	END FOR
END IF

//ADD WHERE CLAUSE
ls_sql_syntax = " WHERE " + ls_table_names[1] + ".prac_id  = " + String( al_prac_id )

IF li_facility_specific = 1 THEN
	ls_sql_syntax = ls_sql_syntax + " AND " + ls_table_names[1] + ".facility_id  = " + String( ai_facility_id )
END IF

//CREATE SORT ORDER code moved to top of function //maha 051905
ls_dwsyntax_str=''
ll_recreate = of_get_create_syntax(ai_data_view_id,ai_screen_id , ls_dwsyntax_str , 'Y' , 'D', ab_screen_painter)
adw_detail.Create( ls_dwsyntax_str, ERRORS)

IF Len(ERRORS) > 0 THEN
	RETURN "-1"
END IF

//Add where clause
If not ab_screen_painter Then
	adw_detail.settransobject(SQLCA)
	ls_sqlselect = adw_detail.getsqlselect()
	parse_sql2(ls_sqlselect,ls_column_list,ls_where_clause,ls_group_by_clause,ls_order_by_clause,ls_having_clause)
	ls_sqlselect = ls_column_list + ' ' + ls_sql_syntax + ' ' +  ls_order_by_clause
	ls_return_syntax = ls_column_list 
	
	//adw_detail.setsqlselect(ls_sqlselect)
	adw_detail.modify("datawindow.table.select = '" + ls_sqlselect + "'")
End If

//CREATE SYNTAX FOR BROWSE DW
IF ib_create_browse THEN
	ls_dwsyntax_str=''
	ll_recreate = of_get_create_syntax(ai_data_view_id,ai_screen_id , ls_dwsyntax_str , 'N' , 'D', ab_screen_painter)
	adw_browse.Create( ls_dwsyntax_str, ERRORS)

	IF Len(ERRORS) > 0 THEN
		RETURN "-1"
	END IF
//	ls_sqlselect = adw_browse.getsqlselect()
//	parse_sql(ls_sqlselect,ls_column_list,table_list,ls_where_clause,ls_group_by_clause,ls_order_by_clause,ls_having_clause)
//	ls_sqlselect = ls_column_list + ' ' + table_list + ' ' + ls_sql_syntax + ls_order_by_clause
//	adw_browse.setsqlselect(ls_sqlselect)
END IF
	
//--------------------------- APPEON BEGIN ---------------------------
//$<comment> 2007.08.17 By: Jack
//$<reason> In order to retrieve the DDDW first, and then retrieve the main window, I moved the following scripts to below.
/*
IF NOT ab_screen_painter THEN
	adw_detail.of_SetTransObject( SQLCA )
	li_prac_row_cnt = adw_detail.Retrieve()
END IF

IF li_prac_row_cnt = 0 THEN 
	if ai_screen_id = 65 and  not ab_screen_painter then //maha app081705
		//don't add row in prac folder
	else	
		adw_detail.InsertRow(0) //maha app081705
	end if
END IF

//debugbreak()
IF ib_create_browse THEN
	adw_detail.ShareData(adw_browse)
END IF
*/
//---------------------------- APPEON END ----------------------------

//adw_detail.Modify("active_status.Initial='1'")

gnv_appeondb.of_startqueue()

FOR i = 1 TO li_row_cnt//ids_screen_fields.rowcount()
	IF NOT ab_screen_painter AND ids_screen_fields.GetItemString(i, "visible") = "N" THEN
		CONTINUE
	END IF
	
	IF not ab_screen_painter THEN
		IF Len(ls_dw_field_names[i]) > 0 AND lb_first_field THEN
			lb_first_field = False
			is_first_column = ls_dw_field_names[i]
		END IF
	END IF
	
	
	IF ids_screen_fields.GetItemString( i, "lookup_field") = "Y" AND NOT ab_screen_painter THEN
		ls_lookup_code = ids_screen_fields.GetItemString( i, "lookup_code" )
		ls_lookup_field = ids_screen_fields.GetItemString( i, "lookup_field_name" )
		ls_lookup_type = ids_screen_fields.GetItemString( i, "lookup_type" )
	
		adw_detail.GetChild( ls_dw_field_names[i] , dwchild )

		//IF ib_create_browse = True THEN						
		adw_browse.GetChild( ls_dw_field_names[i] , dwchild_browse )
		dwchild.SetTransObject( SQLCA )
		//END IF

		of_dwchild_retrieve(ls_lookup_code,ls_lookup_type,adw_detail,"CREATE",0,ls_dw_field_names[i]) //maha app081705
		dwchild.ShareData( dwchild_browse )
	END IF
END FOR

gnv_appeondb.of_commitqueue()

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 2007.08.17 By: Jack
//$<reason>  In order to retrieve the DDDW first, and then retrieve the main window, I moved the following scripts from the above to here.
IF NOT ab_screen_painter THEN
	adw_detail.of_SetTransObject( SQLCA )
	li_prac_row_cnt = adw_detail.Retrieve()
END IF

IF li_prac_row_cnt = 0 THEN 
	if ai_screen_id = 65 and  not ab_screen_painter then //maha app081705
		//don't add row in prac folder
	else	
		adw_detail.InsertRow(0) //maha app081705
	end if
END IF

IF ib_create_browse THEN
	adw_detail.ShareData(adw_browse)
END IF
//---------------------------- APPEON END ----------------------------

If appeongetclienttype() <> 'PB' Then 
	If not ab_screen_painter Then of_dwchild_after_retrieve(adw_detail)
End If

//reset all browse fields //maha 051005
integer cc
cc = upperbound( ls_dw_field_names)//integer(adw_browse.Object.DataWindow.Column.Count)
wer = ids_screen_fields.rowcount()


IF NOT ab_screen_painter THEN
	adw_detail.iuo_calendar.of_Register(adw_detail.iuo_calendar.DDLB)		
	adw_detail.of_SetReqColumn(TRUE)
END IF


adw_detail.SetRedraw(True)

//CREATE ANY SCREEN OBJECTS THAT WERE ADDED

//Start Code Change ---- 01.18.2006 #203 maha
IF ls_table_name = "pd_address" or ls_table_name = "dba.pd_address" THEN //maha 011806
	//adw_detail.Modify("create button(band=detail text='Address Links...' filename=''action='0' border='1' color='128' x='1822' y='110' height='104' width='500' vtextalign='0' htextalign='0'  font.face='MS Sans Serif' font.height='-8' font.weight='700'  font.family='2' font.pitch='2' font.charset='0' background.mode='2' background.color='12632256' name = linkbutton)")
	
	//address drop down
	
	//adw_detail.Modify("create button(band=detail text='Find' filename=''action='0' border='1' color='128' x='1822' y='285' height='85' width='200' vtextalign='0' htextalign='0'  font.face='MS Sans Serif' font.height='-8' font.weight='700'  font.family='2' font.pitch='2' font.charset='0' background.mode='2' background.color='12632256' name = findbutton)")
	adw_detail.Modify("destroy populatebutton")
//	integer set1
//	select set_1
//	into :set1
//	from icred_settings;
	set1 = of_get_app_setting("set_1","I")

	if set1 = 1 then //maha 072301 create populate button only if using addresses for find
		adw_detail.Modify("create button(band=detail text='Populate' filename=''action='0' border='1' color='128' x='2010' y='285' height='85' width='280' vtextalign='0' htextalign='0'  font.face='MS Sans Serif' font.height='-8' font.weight='700'  font.family='2' font.pitch='2' font.charset='0' background.mode='2' background.color='12632256' name = populatebutton)")		
		adw_detail.Modify( "street.dddw.VscrollBar = Yes")			
		adw_detail.Modify( "street.dddw.useasborder = Yes")			
		adw_detail.Modify( "street.dddw.AllowEdit = Yes")			
		adw_detail.Modify( "street.dddw.NilIsNull= Yes")
		//adw_detail.Modify( "street.dddw.Lines= 15")
		adw_detail.Modify( "street.dddw.PercentWidth = '200'")	
		adw_detail.Modify( "street.dddw.name = 'd_dddw_addresses'")
		adw_detail.Modify( "street.dddw.datacolumn = 'rec_id'")			
		adw_detail.Modify( "street.dddw.displaycolumn = 'street'")	
	end if
	
	//add drop down for billing address
	/*
	ls_retval = adw_detail.Modify( "billing_address_id.dddw.VscrollBar = Yes")			
	adw_detail.Modify( "billing_address_id.dddw.useasborder = Yes")			
	adw_detail.Modify( "billing_address_id.dddw.NilIsNull= Yes")
	//adw_detail.Modify( "billing_address_id.dddw.Lines= 15")
	adw_detail.Modify( "billing_address_id_t.font.underline = '1'")
	adw_detail.Modify( "billing_address_id.dddw.Required = No")
	adw_detail.Modify( "billing_address_id.dddw.name = 'd_dddw_billing_addresses'")
	adw_detail.Modify( "billing_address_id.dddw.datacolumn = 'pd_address_rec_id'")			
	adw_detail.Modify( "billing_address_id.dddw.displaycolumn = 'address'")							
	*/
	res  = adw_detail.GetChild( "billing_address_id", dwchild )
	if res = 1 then
		IF Len( ls_retval ) = 0 THEN
			dwchild.SetTransObject( SQLCA )
			dwchild.Retrieve( al_prac_id )
		END IF
//		des = dwchild.Describe("DataWindow.Objects")
//			openwithparm(w_sql_msg,des)
		dwchild.InsertRow( 1 )
		dwchild.SetItem( 1, "pd_address_street", "N/A" )	
		dwchild.SetItem( 1, "pd_address_city", "" )
		dwchild.SetItem( 1, "code_lookup_code", "" )
		dwchild.SetItem( 1, "pd_address_rec_id", -1 )	
		dwchild.InsertRow( 1 )
		dwchild.SetItem( 1, "pd_address_street", "Same" )	
		dwchild.SetItem( 1, "pd_address_city", "" )
		dwchild.SetItem( 1, "code_lookup_code", "" )
		dwchild.SetItem( 1, "pd_address_rec_id", 0 )
		dwchild.InsertRow( 1 )
		dwchild.SetItem( 1, "pd_address_street", "" )	
		dwchild.SetItem( 1, "pd_address_city", "" )
		dwchild.SetItem( 1, "code_lookup_code", "" )
	end if
	
END IF

IF ls_table_name = "pd_references" or ls_table_name = "dba.pd_references" THEN //maha 011806
//End Code Change---01.18.2005 
	li_set = of_get_app_setting("set_5","I")
	adw_detail.Modify("destroy peerbutton")
	if li_set = 0 then
		//messagebox("","ref button")
		adw_detail.Modify("create button(band=detail text='Select Peer' filename=''action='0' border='1' color='128' x='1102' y='1285' height='85' width='400' vtextalign='0' htextalign='0'  font.face='MS Sans Serif' font.height='-8' font.weight='700'  font.family='2' font.pitch='2' font.charset='0' background.mode='2' background.color='12632256' name = peerbutton)")
		if ll_max_height < 1400 then ll_max_height = 1400 //maha 060805 button was disappearing
	end if
end if
//\maha


IF li_prac_row_cnt = 0 THEN 
	If not ab_screen_painter Then of_set_defaults( adw_detail, 1 )
	adw_detail.AcceptText() 
	adw_detail.SetItemStatus( 1, 0, Primary!, NotModified! )
END IF

RETURN ls_return_syntax
end function

public function integer of_field_audit_update ();//////////////////////////////////////////////////////////////////////
// $<function>pfc_cst_nv_data_entry_functions.of_update_audit_update()
// $<arguments>
//		value	integer		
// $<returns> (none)
// $<description> Performance tuning
// $<description> The following script moved from of_field_audit
//////////////////////////////////////////////////////////////////////
// $<add> 04.10.2006 by LeiWei
//////////////////////////////////////////////////////////////////////

IF ids_sys_audit.modifiedcount( ) + ids_sys_audit.Deletedcount( ) <=0 Then Return 0

LONG  ll_prac,ll_prac_arr[] ,ll_prac_i,ll_prac_OLD
Integer ll_Rows,  i
Long ll_seq_no

//update begin
FOR ll_Rows =  1 to ids_sys_audit.rowcount()
	IF ids_sys_audit.GetItemStatus( ll_Rows, 0 , Primary!) = newmodified! THEN
		ll_prac = ids_sys_audit.GetItemNumber( ll_Rows, "prac_id" )

		IF ll_prac <> ll_prac_OLD THEN
			ll_prac_i ++
			ll_prac_arr[ll_prac_i] = ll_prac
		END IF
		ll_prac_OLD = ll_prac

		IF ll_seq_no = 0 OR IsNull( ll_seq_no ) THEN
			SELECT Max( sys_audit.seq_no )  
			INTO :ll_seq_no
   		FROM sys_audit;
			
			IF IsNull(ll_seq_no) THEN ll_seq_no = 0
		END IF

		ll_seq_no++
		
		ids_sys_audit.SetItem( ll_Rows, "seq_no", ll_seq_no )
	END IF
NEXT

gnv_appeondb.of_startqueue( )

IF ids_sys_audit.modifiedcount( ) > 0 THEN
	i = ids_sys_audit.Update()
	COMMIT USING SQLCA;
	IF i = -1 THEN
		//MessageBox("", "Update to sys_audit table Failed!")
		MessageBox("", "Failed to update sys_audit table!")
		Return -1
	END IF
END IF

FOR i = 1 TO ll_prac_i
	of_set_mod_date(ll_prac_arr[i])
END FOR

gnv_appeondb.of_commitqueue( )

ids_sys_audit.Reset()

RETURN 1
end function

public function integer of_create_option (integer ai_data_view_id, integer ai_screen_id, string as_detail, string as_calltype, string as_updatedate, boolean ab_screen_painter);//////////////////////////////////////////////////////////////////////
// $<function>pfc_cst_nv_data_entry_functions.of_get_create_syntax()
// $<arguments>
//		value    	integer	ai_screen_id		
//		reference	string 	as_dwsyntax 		
//		value    	string 	as_detail   		
// $<returns> integer
// $<description> Verify whether DataWindow syntax has already been stored on local machine. If yes, the application
// $<description> directly gets the dw syntas from local SRD files; if not, the application gets the dw syntax from
// $<description> the database
//////////////////////////////////////////////////////////////////////
// $<add> 03.10.2006 by Cao YongWang
//////////////////////////////////////////////////////////////////////
string ls_syntaxfile
string ls_lastupdate
long	 ll_getupdate

If as_detail = 'Y' Then
	IF ab_screen_painter THEN
		ls_syntaxfile = gs_dir_path + gs_DefDirName + "\DWSyntax\" + string(ai_data_view_id)+'-'+string(ai_screen_id) + as_calltype + '_s.srd'
	ELSE
		ls_syntaxfile = gs_dir_path + gs_DefDirName + "\DWSyntax\" + string(ai_data_view_id)+'-'+string(ai_screen_id) + as_calltype + '.srd'
	END IF
Else
	ls_syntaxfile = gs_dir_path + gs_DefDirName + "\DWSyntax\" + string(ai_data_view_id)+'-'+string(ai_screen_id) + as_calltype + '_b.srd'
End If

If not fileexists(ls_syntaxfile) Then
	return -1
End If

////Modified By Mark Lee 04/18/12
//ll_getupdate = gnv_appeondll.of_registryget("HKEY_LOCAL_MACHINE\SOFTWARE\IntelliSoft Group\Screens List", "Screen-"+string(ai_data_view_id) + '-'+as_calltype+'-'+string(ai_screen_id), regstring!, ls_lastupdate)
ll_getupdate = gnv_appeondll.of_registryget("HKEY_LOCAL_MACHINE\SOFTWARE\"+gs_DefDirName+"\Screens List", "Screen-"+string(ai_data_view_id) + '-'+as_calltype+'-'+string(ai_screen_id), regstring!, ls_lastupdate)
If ll_getupdate <> 1 Then return -1
If as_updatedate <> ls_lastupdate Then return -1

return 0
end function

public function integer of_save_create_syntax (integer ai_data_view_id, integer ai_screen_id, datawindow adw_save, string as_detail, string as_currentdate, string as_calltype, boolean ab_screen_painter);//////////////////////////////////////////////////////////////////////
// $<function>pfc_cst_nv_data_entry_functions.of_save_create_syntax()
// $<arguments>
//		value    	integer	ai_screen_id		
//		reference	string 	as_dwsyntax 		
//		value    	string 	as_detail   		
// $<returns> integer
// $<description> save the dw syntax in SRD files on local machine.
// $<description>
//////////////////////////////////////////////////////////////////////
// $<add> 03.10.2006 by Cao YongWang
//////////////////////////////////////////////////////////////////////

string		ls_filename 
blob     	lblb_Data, lb_syntax 
string		ls_dwsyntax 
integer		li_FileNum , li_write , li_Writes , li_Cnt
long			ll_BlobLen , ll_CurrentPos

//If the directory is not exists then create it 
gnv_appeondll.of_parsepath(gs_dir_path + gs_DefDirName + "\DWSyntax\")

If as_detail = 'Y' Then
	IF ab_screen_painter THEN
		ls_filename = gs_dir_path + gs_DefDirName + "\DWSyntax\" + string(ai_data_view_id)+'-'+string(ai_screen_id) + as_calltype + '_s.srd'
	ELSE
		ls_filename = gs_dir_path + gs_DefDirName + "\DWSyntax\" + string(ai_data_view_id)+'-'+string(ai_screen_id) + as_calltype + '.srd'
	END IF
Else
	ls_filename = gs_dir_path + gs_DefDirName + "\DWSyntax\" + string(ai_data_view_id)+'-'+string(ai_screen_id) + as_calltype + '_b.srd'
End If

ls_dwsyntax = adw_save.describe("datawindow.syntax")
lb_syntax = blob(ls_dwsyntax)
//
ll_BlobLen = Len(lb_syntax)
// Determine the number of writes required 
// to write the entire blob
If ll_BlobLen > 32765 Then
    If Mod(ll_BlobLen, 32765) = 0 Then
       li_Writes = ll_BlobLen / 32765
    Else
       li_Writes = (ll_BlobLen / 32765) + 1
    End if
 Else
    li_Writes = 1
End if

ll_CurrentPos = 1

//
//li_flen = FileLength(ls_filename)
li_FileNum = FileOpen(ls_filename , StreamMode!, Write!, LockWrite!,Replace!)
If li_FileNum = -1 Then return -1

//
For li_Cnt = 1 To li_Writes
    lblb_Data = BlobMid(lb_syntax, ll_CurrentPos, 32765)
    ll_CurrentPos += 32765
    If FileWrite(li_FileNum, lblb_Data) = -1 Then
       Return -1
    End if
Next
//

FileClose(li_FileNum)
//Modified By Mark Lee 04/18/12
//Save the latest update date of the current screen in Registry
//gnv_appeondll.of_RegistrySet("HKEY_LOCAL_MACHINE\SOFTWARE\IntelliSoft Group\Screens List", 'Screen-'+string(ai_data_view_id) + '-'+as_calltype + '-'+string(ai_screen_id), regstring!, as_currentdate)
gnv_appeondll.of_RegistrySet("HKEY_LOCAL_MACHINE\SOFTWARE\"+gs_DefDirName+"\Screens List", 'Screen-'+string(ai_data_view_id) + '-'+as_calltype + '-'+string(ai_screen_id), regstring!, as_currentdate)
return 0
end function

public function integer of_get_create_syntax (integer ai_data_view_id, integer ai_screen_id, ref string as_dwsyntax, string as_detail, string as_calltype, boolean ab_screen_painter);//////////////////////////////////////////////////////////////////////
// $<function>pfc_cst_nv_data_entry_functions.of_get_create_syntax()
// $<arguments>
//		value    	integer	ai_screen_id		
//		reference	string 	as_dwsyntax 		
//		value    	string 	as_detail   		
// $<returns> integer
// $<description> Get the dw syntax from local SRD files.
// $<description>
//////////////////////////////////////////////////////////////////////
// $<add> 03.10.2006 by Cao YongWang
//////////////////////////////////////////////////////////////////////

string		ls_filename , ls_filename_b
blob     	lb_bytes_read, lb_syntax , lb_syntax_b
string		ls_detail_syntax , ls_browse_syntax
long		   ll_FileNum , ll_flen , ll_loops , ll_new_pos , i , ll_read

If as_detail = 'Y' Then
	IF ab_screen_painter THEN
		ls_filename = gs_dir_path + gs_DefDirName + "\DWSyntax\" + string(ai_data_view_id)+'-'+string(ai_screen_id) +as_calltype+ '_s.srd'
	ELSE
		ls_filename = gs_dir_path + gs_DefDirName + "\DWSyntax\" + string(ai_data_view_id)+'-'+string(ai_screen_id) +as_calltype+ '.srd'
	END IF
Else
	ls_filename = gs_dir_path + gs_DefDirName + "\DWSyntax\" + string(ai_data_view_id)+'-'+string(ai_screen_id) +as_calltype+ '_b.srd'
End If

//Get the syntax for detail datawindow
ll_flen = FileLength(ls_filename)
ll_FileNum = FileOpen(ls_filename , StreamMode!, Read!, LockWrite!)
If ll_FileNum = -1 Then return -1

IF ll_flen > 32765 THEN
	IF Mod(ll_flen, 32765) = 0 THEN
       ll_flen = ll_flen/32765
   ELSE
       ll_loops = (ll_flen/32765) + 1
   END IF
ELSE
   ll_loops = 1
END IF

// Read the file

ll_new_pos = 1

FOR i = 1 to ll_loops
    ll_read = FileRead(ll_FileNum, lb_bytes_read)
    lb_syntax = lb_syntax + lb_bytes_read
NEXT

FileClose(ll_FileNum)
as_dwsyntax = string(lb_syntax)

return 0
end function

public function integer of_app_audit_item_create (integer al_facility, long al_prac, long al_temp_item_id, long al_affil_recid, long al_de_recid, string as_from, integer ai_complete, string as_ref);long ll_recid
string ls_compl
datetime ldt_now
long ll_status
integer uu

if ai_complete = 1 then
	ls_compl = "Y"
	 ldt_now = datetime(today(),now())
	 ll_status = 662
else
	ls_compl = "N"
	setnull( ldt_now)
	setnull( ll_status)
end if

	
ll_recid = gnv_app.of_Get_Id("RECORD_ID")

insert into pd_app_audit (record_id,	prac_id ,facility_id , seq_no, app_audit_id,	completed , fax_message, 	active_status, date_completed , data_status , 	appt_stat_id , de_rec_id ) values (:ll_recid, :al_prac,:al_facility,1,:al_temp_item_id,:ls_compl,:as_ref,1,:ldt_now,:ll_status,:al_affil_recid,:al_de_recid);
//messagebox("sqlca.sqlcode",string(sqlca.sqlcode))
if sqlca.sqlcode < 0 then
	messagebox("Auto Generate App Audit Record Failed",sqlca.SQLErrText)
end if
commit using sqlca;


return 1
end function

public subroutine of_create_application_audit_record (string as_rec_status, long al_prac_id[], long al_screen_id, long al_rec_id[], string as_reference);//////////////////////////////////////////////////////////////////////
// $<function>pfc_cst_nv_data_entry_functionsof_create_application_audit_record()
// $<arguments>
//		value	string	as_rec_status		
//		value	long  	al_prac_id[]   		
//		value	long  	al_screen_id
//		value	long  	al_rec_id
//		value	string  	as_reference
//
// $<returns> (none)
// $<description> Required Documents Check Box on Data Entry Screen.
// $<description>
//////////////////////////////////////////////////////////////////////
// $<add> 10.13.2006 by Jack (Inova)
//////////////////////////////////////////////////////////////////////
return //not using this code

//long ii,i,j,k,ll_rowcount,ll_rowcount1,ll_rowcount2,ll_appt_stat_id,ll_app_audit_id,ll_parent_facility_id,ll_appt_stat_id_new
//long ll_application_audit_facility,ll_prac_id,ll_auto_generate,ll_receive_from_de,ll_record_id,ll_de_rec_id
//long ll_screen_num,ll_screen_id,ll_find,ll_insrow,ll_seq_row_cnt,ll_seq_no,ll_mes,ll_data_status,ll_rec_id
//string ls_filter,ls_fax_message,ls_description
//datetime ldt_date_completed
//datastore lds_pd_app_audit_rqrd_data
//datastore lds_pd_affil_status_inova
//datastore lds_last_app_audit_seq_no
//datastore lds_app_audit_rqrd_data
//
//lds_pd_app_audit_rqrd_data = create datastore
//lds_pd_app_audit_rqrd_data.dataobject = 'd_pd_app_audit_rqrd_data_inova' //from pd_app_audit_temp table.
//lds_pd_app_audit_rqrd_data.settransobject(sqlca)
//
//lds_pd_affil_status_inova = create datastore
//lds_pd_affil_status_inova.dataobject = 'd_pd_affil_status_inova' //from pd_affil_stat table
//lds_pd_affil_status_inova.settransobject(sqlca)
//
//lds_last_app_audit_seq_no = create datastore
//lds_last_app_audit_seq_no.dataobject = 'd_last_app_audit_seq_no_all_inova'// from pd_app_audit table.
//lds_last_app_audit_seq_no.settransobject(sqlca)
//
//lds_app_audit_rqrd_data = create datastore
//lds_app_audit_rqrd_data.dataobject = 'd_app_audit_rqrd_data_inova' // from data_view_app_audit table.
//lds_app_audit_rqrd_data.settransobject(SQLCA)
//
//gnv_appeondb.of_startqueue()
//lds_pd_app_audit_rqrd_data.retrieve()
//lds_pd_affil_status_inova.retrieve(al_prac_id,gs_user_id)
//lds_last_app_audit_seq_no.retrieve()
//lds_app_audit_rqrd_data.retrieve()		
//gnv_appeondb.of_commitqueue()
//	
//if al_screen_id > 0 then	
//	ll_data_status = long(gnv_data.of_getitem("code_lookup","lookup_code","lookup_name = 'Required Data Status' and code = 'Satisfactory'"))
//	for ii = 1 to upperbound(al_prac_id)
//		ll_prac_id = al_prac_id[ii]
//		ll_rec_id = al_rec_id[ii]
//		
//		ls_filter = 'prac_id = ' + string(ll_prac_id)
//		lds_pd_affil_status_inova.setfilter(ls_filter)  
//		lds_pd_affil_status_inova.filter()
//		ll_rowcount = lds_pd_affil_status_inova.rowcount()
//		
//		for i = 1 to ll_rowcount
//			ll_appt_stat_id = lds_pd_affil_status_inova.getitemnumber(i,'rec_id')
//			ll_application_audit_facility = lds_pd_affil_status_inova.getitemnumber(i,'application_audit_facility')
//			ll_parent_facility_id = lds_pd_affil_status_inova.getitemnumber(i,'parent_facility_id')
//			ll_prac_id = lds_pd_affil_status_inova.getitemnumber(i,'prac_id')
//		
//			ls_filter = 'facility_id = ' + string(ll_application_audit_facility)
//			lds_app_audit_rqrd_data.setfilter(ls_filter)  
//			lds_app_audit_rqrd_data.filter()
//			ll_rowcount1 = lds_app_audit_rqrd_data.rowcount()
//			ll_find = lds_app_audit_rqrd_data.find("screen_id = " + string(al_screen_id),1,ll_rowcount1)
//			
//			if ll_find > 0 then
//				ll_auto_generate = lds_app_audit_rqrd_data.getitemnumber(ll_find,'auto_generate')
//				ll_receive_from_de = lds_app_audit_rqrd_data.getitemnumber(ll_find,'receive_from_de')
//				
//				if ll_auto_generate = 1 then
//					if as_rec_status = 'New' then
//						
//						ll_record_id = gnv_app.of_get_id("RECORD_ID")
//						ll_app_audit_id = Integer( gnv_app.of_get_id("APPAUDIT") )
//						
//						ll_insrow = lds_pd_app_audit_rqrd_data.InsertRow( 0 )
//						lds_pd_app_audit_rqrd_data.SetItem( ll_insrow, "record_id", ll_record_id )
//						lds_pd_app_audit_rqrd_data.SetItem( ll_insrow, "appt_stat_id", ll_appt_stat_id )
//						lds_pd_app_audit_rqrd_data.SetItem( ll_insrow, "prac_id", ll_prac_id )
//						lds_pd_app_audit_rqrd_data.SetItem( ll_insrow, "facility_id", ll_parent_facility_id )
//						lds_pd_app_audit_rqrd_data.SetItem( ll_insrow, "app_audit_id", ll_app_audit_id )
//					
//						lds_last_app_audit_seq_no.setfilter("prac_id = " + string(ll_prac_id) + " and facility_id = " + string(ll_parent_facility_id) + " and app_audit_id = " + string(ll_app_audit_id)	)
//						lds_last_app_audit_seq_no.filter()
//						ll_seq_row_cnt = lds_last_app_audit_seq_no.RowCount()
//						IF ll_seq_row_cnt < 1 THEN
//							ll_seq_no = 1 
//						ELSE
//							ll_seq_no = lds_last_app_audit_seq_no.rowcount() + 1
//						END IF	
//						
//						lds_pd_app_audit_rqrd_data.SetItem( ll_insrow, "seq_no", ll_seq_no	) 		
//						lds_pd_app_audit_rqrd_data.SetItem( ll_insrow, "active_status", 1 )
//						lds_pd_app_audit_rqrd_data.SetItem( ll_insrow, "fax_message", as_reference	) 	
//						lds_pd_app_audit_rqrd_data.SetItem( ll_insrow, "description", as_reference	) 	
//						lds_pd_app_audit_rqrd_data.SetItem( ll_insrow, "de_rec_id", ll_rec_id)
//						lds_pd_app_audit_rqrd_data.SetItem( ll_insrow, "app_type", 'I'	)		
//	
//						if ll_receive_from_de = 1 then
//							ll_mes = MessageBox("Change Audit item", 'Would you like to set the Application Audit status for (description from app audit painter) as Satisfactory?', Question!, YesNo!, 1 )								
//							if ll_mes = 1 then
//								lds_pd_app_audit_rqrd_data.SetItem( ll_insrow, "data_status", ll_data_status) 		
//								lds_pd_app_audit_rqrd_data.SetItem( ll_insrow, "date_completed", today()) 		
//							end if	
//						end if
//					else
//						ls_filter = "de_rec_id = " + string(ll_rec_id) + " and facility_id = " + string(ll_parent_facility_id)
//						lds_pd_app_audit_rqrd_data.setfilter(ls_filter)
//						lds_pd_app_audit_rqrd_data.filter()
//						ll_rowcount2 = lds_pd_app_audit_rqrd_data.rowcount()
//						for k = 1 to ll_rowcount2
//							ldt_date_completed = lds_pd_app_audit_rqrd_data.getitemdatetime(k,'date_completed')
//							if as_reference <> '' then
//								lds_pd_app_audit_rqrd_data.SetItem( k, "fax_message", as_reference	) 	
//								lds_pd_app_audit_rqrd_data.SetItem( k, "description", as_reference	) 	
//							end if	
//							if ll_receive_from_de = 1 then
//								if isnull(ldt_date_completed) then
//									ll_mes = MessageBox("Change Audit item", 'Would you like to set the Application Audit status for (description from app audit painter) as Satisfactory?', Question!, YesNo!, 1 )								
//									if ll_mes = 1 then
//										lds_pd_app_audit_rqrd_data.SetItem( k, "data_status", ll_data_status) 		
//										lds_pd_app_audit_rqrd_data.SetItem( k, "date_completed", today())
//									end if
//								end if
//							end if
//						next											
//					end if
//				end if		
//			end if	
//		next
//	next
//	gnv_appeondb.of_startqueue()
//	lds_pd_app_audit_rqrd_data.update()
//	for i = 1 to upperbound(al_rec_id)
//		ll_rec_id = al_rec_id[i]		
//		delete from pd_app_audit where de_rec_id = :ll_rec_id;
//		insert into pd_app_audit (record_id,prac_id,facility_id,seq_no,app_audit_id,completed,fax_message,active_status,date_completed,data_status,identifying_number,appt_stat_id,conv_prac_id,de_rec_id,description,app_type)
//		  select record_id,prac_id,facility_id,seq_no,app_audit_id,completed,fax_message,active_status,date_completed,data_status,identifying_number,appt_stat_id,conv_prac_id,de_rec_id,description,app_type from pd_app_audit_temp where de_rec_id = :ll_rec_id;
//	next
//	commit;
//	gnv_appeondb.of_commitqueue()	
//else
//	if as_rec_status = 'R' then
//		ll_prac_id = al_prac_id[1]
//		ll_appt_stat_id = al_rec_id[1]
//		ll_appt_stat_id_new = al_rec_id[2]
//		
//		ls_filter = "appt_stat_id = " + string(ll_appt_stat_id)
//		lds_pd_app_audit_rqrd_data.setfilter(ls_filter)
//		lds_pd_app_audit_rqrd_data.filter()
//		ll_rowcount = lds_pd_app_audit_rqrd_data.rowcount()
//		for i = 1 to ll_rowcount
//			ll_record_id = gnv_app.of_get_id("RECORD_ID")
//			ll_app_audit_id = Integer( gnv_app.of_get_id("APPAUDIT") )
//		   ll_parent_facility_id = lds_pd_app_audit_rqrd_data.getitemnumber(i,'facility_id')
//		   ll_de_rec_id = lds_pd_app_audit_rqrd_data.getitemnumber(i,'de_rec_id')
//			
//			ls_fax_message = lds_pd_app_audit_rqrd_data.getitemstring(i,'fax_message')
//			ls_description = lds_pd_app_audit_rqrd_data.getitemstring(i,'description')
//			
//			lds_last_app_audit_seq_no.setfilter("prac_id = " + string(ll_prac_id) + " and facility_id = " + string(ll_parent_facility_id) + " and app_audit_id = " + string(ll_app_audit_id)	)
//			lds_last_app_audit_seq_no.filter()
//			ll_seq_row_cnt = lds_last_app_audit_seq_no.RowCount()
//			IF ll_seq_row_cnt < 1 THEN
//				ll_seq_no = 1 
//			ELSE
//				ll_seq_no = lds_last_app_audit_seq_no.rowcount() + 1
//			END IF	
//			ll_insrow = lds_pd_app_audit_rqrd_data.InsertRow( 0 )
//			lds_pd_app_audit_rqrd_data.SetItem( ll_insrow, "record_id", ll_record_id )
//			lds_pd_app_audit_rqrd_data.SetItem( ll_insrow, "appt_stat_id", ll_appt_stat_id_new )
//			lds_pd_app_audit_rqrd_data.SetItem( ll_insrow, "prac_id", ll_prac_id )
//			lds_pd_app_audit_rqrd_data.SetItem( ll_insrow, "facility_id", ll_parent_facility_id )
//			lds_pd_app_audit_rqrd_data.SetItem( ll_insrow, "app_audit_id", ll_app_audit_id )
//			lds_pd_app_audit_rqrd_data.SetItem( ll_insrow, "seq_no", ll_seq_no	) 		
//			lds_pd_app_audit_rqrd_data.SetItem( ll_insrow, "active_status", 1 )
//			lds_pd_app_audit_rqrd_data.SetItem( ll_insrow, "fax_message", ls_fax_message	) 	
//			lds_pd_app_audit_rqrd_data.SetItem( ll_insrow, "description", ls_description	) 	
//			lds_pd_app_audit_rqrd_data.SetItem( ll_insrow, "de_rec_id", ll_de_rec_id)
//			lds_pd_app_audit_rqrd_data.SetItem( ll_insrow, "app_type", 'R'	)					
//		next
//		gnv_appeondb.of_startqueue()
//		lds_pd_app_audit_rqrd_data.update()
//		insert into pd_app_audit (record_id,prac_id,facility_id,seq_no,app_audit_id,completed,fax_message,active_status,date_completed,data_status,identifying_number,appt_stat_id,conv_prac_id,de_rec_id,description,app_type)
//		  select record_id,prac_id,facility_id,seq_no,app_audit_id,completed,fax_message,active_status,date_completed,data_status,identifying_number,appt_stat_id,conv_prac_id,de_rec_id,description,app_type from pd_app_audit_temp where appt_stat_id = :ll_appt_stat_id_new;
//		commit;
//		gnv_appeondb.of_commitqueue()			
//	else
//		gnv_appeondb.of_startqueue()
//		delete from pd_app_audit where de_rec_id is not null;
//		insert into pd_app_audit (record_id,prac_id,facility_id,seq_no,app_audit_id,completed,fax_message,active_status,date_completed,data_status,identifying_number,appt_stat_id,conv_prac_id,de_rec_id,description,app_type)
//		  select record_id,prac_id,facility_id,seq_no,app_audit_id,completed,fax_message,active_status,date_completed,data_status,identifying_number,appt_stat_id,conv_prac_id,de_rec_id,description,app_type from pd_app_audit_temp;
//		commit;
//		gnv_appeondb.of_commitqueue()	
//	end if
//end if
//if isvalid(w_prac_data_1) then
//	w_prac_data_1.ib_app_audit_retrieved = False
//end if
//destroy lds_pd_app_audit_rqrd_data
//destroy lds_pd_affil_status_inova
//destroy lds_last_app_audit_seq_no
//destroy lds_app_audit_rqrd_data
//
end subroutine

public function integer of_app_audit_update_ref (long al_prac, long al_de_recid, string as_ref);//Start Code Change ---- 10.26.2006 #1 maha
//function created maha 102606 to update the reference value for dynamically created audit items.

update pd_app_audit set fax_message = :as_ref where prac_id = :al_prac and de_rec_id = :al_de_recid;

return 1
end function

public function integer of_app_audit_items_add (long al_facility, long al_prac, long al_affil_rec_id, long al_template, string as_from, datawindow adw_existing, string as_appt_type);//Start Code Change ---- 10.02.2006 #628 maha
//created maha 10-02-06  called from recred process, add missing
integer li_auto_gen
integer li_found
integer li_do = 1
integer li_complete
integer li_screen
integer tes
integer li_cnt //maha 03.19.2008
long ll_aat_recid
long t
long tc
long d
long dc
n_ds lds_temp
n_ds lds_refs
n_ds lds_data
long ll_de_recid
string ls_ref
string ls_ref_temp
string ls_found

lds_temp = CREATE n_ds
lds_temp.dataobject = "d_app_audit_rqrd_data"
lds_temp.settransobject(sqlca)
tc = lds_temp.retrieve(al_template,as_appt_type)

lds_refs = CREATE n_ds
lds_refs.dataobject = "d_screen_reference_fields"
tes = lds_refs.settransobject(sqlca)
if tes < 1 then messagebox("","settrans failure")

lds_data = CREATE n_ds
//messagebox("rqd data",tc)
//debugbreak()
for t = 1 to tc   //get the template list for each item check auto generate value
	li_auto_gen = lds_temp.getitemnumber(t,"auto_generate")
	if isnull(li_auto_gen) then li_auto_gen = 0  //Start Code Change ---- 01.25.2007 #V7 maha
	li_complete = lds_temp.getitemnumber(t,"receive_from_de")
	if isnull(li_complete) then li_complete = 0  //Start Code Change ---- 01.25.2007 #V7 maha
	ll_aat_recid = lds_temp.getitemnumber(t,"app_audit_id")
	li_screen = lds_temp.getitemnumber(t,"screen_id")
	
	if li_screen = 13 then
	//	debugbreak()
	end if

	//ls_ref = lds_temp.getitemstring(t,"description")
	ls_ref = lds_temp.getitemstring(t,"fax_description")//Start Code Change ---- 09.17.2007 #V7 maha
	
	if as_from = "Reapp" then 
		li_complete = 0 //for recred process do not complete
		li_do = 1
	end if
	choose case li_auto_gen
		case 0 //from the template directly
			setnull(ll_de_recid)
			if as_from  = "Missing" then
				li_found = adw_existing.find("app_audit_id = " + string(ll_aat_recid),1,1000) 
				if li_found  > 0 then 
					li_do = 0
					
				end if
			end if
			if li_do = 1 then
				li_cnt += of_app_audit_item_create( al_facility, al_prac, ll_aat_recid, al_affil_rec_id,ll_de_recid,"Audit" , li_complete,ls_ref)
			end if
			li_do = 1
		case 1 //from the data
			//debugbreak()
			tes = of_create_dynamic_ds( al_prac,1, li_screen, lds_data, al_facility,sqlca)
			
			tes = lds_refs.retrieve(1,li_screen) //view and screen
			if tes < 1 then 
				messagebox("App Audit add","Unable to get screen data info")
				continue
			end if
			dc = lds_data.rowcount()
			for d = 1 to dc
				//Start Change code by Jervis 06.28.2007
				//For screen = 2,31,10,The column name include table name
				//get the recid from the data record
				/*
				ll_de_recid = lds_data.getitemnumber(d,"rec_id")
				*/
				if li_screen = 2 then
					ll_de_recid = lds_data.getitemnumber(d,"pd_address_rec_id")
				elseif li_screen = 31 then
					ll_de_recid = lds_data.getitemnumber(d,"pd_address_2_rec_id")
				elseif li_screen = 10 then
					ll_de_recid = lds_data.getitemnumber(d,"pd_hosp_affil_rec_id")
				else
					ll_de_recid = lds_data.getitemnumber(d,"rec_id")
				end if
				//End Change Code by jervis 06.28.2007
				
					
				//messagebox(string(li_screen),ll_de_recid)
				if as_from  = "Missing" then
					ls_found = "de_rec_id = " + string(ll_de_recid)
					li_found = adw_existing.find(ls_found,1,1000)
					if li_found > 0 then li_do = 0
				//	messagebox(string(li_found),ls_found)

				end if
				if li_do = 1 then
					ls_ref_temp = mid(ls_ref,1,5) + "-" //get first 5 characters of description
					ls_ref_temp = ls_ref_temp + of_get_reference_value(li_screen, d , lds_data, lds_refs)  //screen row,data, refence ds 
					li_cnt += of_app_audit_item_create( al_facility, al_prac, ll_aat_recid, al_affil_rec_id,ll_de_recid,"Audit" , li_complete,ls_ref_temp)
				end if
				li_do = 1
			next
	end choose
next
	
destroy lds_temp
destroy lds_refs

//return 1
return li_cnt
end function

public function integer of_generate_attest_questions (string as_from, integer ai_facility_id, long al_prac_id, integer al_appt_id);//////////////////////////////////////////////////////////////////////
// $<function>pfc_cst_nv_data_entry_functions / of_generate_attest_questions()
// $<arguments>
//		value	string 	as_from       		
//		value	integer	ai_facility_id		
//		value	long   	al_prac_id    		
//		value	long   	al_appt_id    		
// $<returns> integer
// $<description> Generate attest questions automatically.
//////////////////////////////////////////////////////////////////////
// $<add> 2007-01-25 by Rodger Wu (attest quest)
//////////////////////////////////////////////////////////////////////


Long ll_template_init, ll_template_reapp, ll_template_selected, ll_rec_id
Long ll_question_id
integer li_rowcount, i, li_inserted
n_ds lds_attest_detail, lds_questions

  SELECT facility.default_question_init,   
         facility.default_question_reapp  
    INTO :ll_template_init,   
         :ll_template_reapp  
    FROM facility  
   WHERE facility.facility_id = :ai_facility_id   ; 
if sqlca.sqlcode <> 0 then return -1;

if isnull( ll_template_init ) then ll_template_init = 0
if isnull( ll_template_reapp ) then ll_template_reapp = 0

if as_from = "reapp" then
	if ll_template_reapp = 0 then return 0
	ll_template_selected = ll_template_reapp
else
	if ll_template_init = 0 then return 0
	ll_template_selected = ll_template_init
end if

lds_questions = create n_ds
lds_questions.dataobject = "d_quest_items"
lds_questions.settransobject( SQLCA )
li_rowcount = lds_questions.Retrieve( ll_template_selected )
if li_rowcount < 1 then
	DESTROY lds_questions;
	return 0;
end if

lds_attest_detail = create n_ds
lds_attest_detail.dataobject = "d_attest_quest_appt_stat"
lds_attest_detail.settransobject( SQLCA )

ll_rec_id = gnv_app.of_get_id("RECORD_ID",li_rowcount ) - 1
for i = 1 to li_rowcount
	ll_rec_id++;
	li_inserted = lds_attest_detail.InsertRow(0)
	
	lds_attest_detail.SetItem( li_inserted, "rec_id", ll_rec_id )
	lds_attest_detail.SetItem( li_inserted, "facility_id", ai_facility_id )
	lds_attest_detail.SetItem( li_inserted, "active_status", 1 )
	lds_attest_detail.SetItem( li_inserted, "appt_stat_id", al_appt_id )
	lds_attest_detail.SetItem( li_inserted, "prac_id", al_prac_id )
	
	ll_question_id = lds_questions.GetItemNumber( i, "quest_id" )
	lds_attest_detail.SetItem( li_inserted, "question_id", ll_question_id )
next

lds_attest_detail.Update()
Return 1;
end function

public function integer of_field_audit (datastore ads_data, ref string as_errortext);//--------------------------- APPEON BEGIN ---------------------------
//$<add> 07.26.2007 By: Evan
//$<reason> New feature of import module.
long li_seq_rc
long ll_seq_no
long ll_rec_id
long ll_field_id
long ll_field_id2
long ll_field_id1
long ll_old_value
long ll_new_value
long ll_facility_id
long ll_prac_id
long ll_value_arr[]
long ll_reference_field_1
long ll_reference_field_2
long i, j
long ll_RowCount
long ll_InsertRow
long ll_FindRow
long ll_lu_rc
string ls_lookup_type
string ls_is_lookup
string ls_lookup_field_name
string ls_retval
string ls_old_value
string ls_new_value
string ls_value1
string ls_value2
string ls_table_name
string ls_field_name
string ls_field_name2
string ls_field_type
string ls_field_type_arr[]
integer li_table_id
integer li_AuditFieldCount
integer li_facility_specific
DWItemStatus ldis_Status
DataStore lds_audit_fields

//Create audit view datatore
if not IsValid(ids_sys_audit) then
	ids_sys_audit = Create n_ds
	ids_sys_audit.DataObject = "d_view_audit"
	ids_sys_audit.SetTransObject(SQLCA)
end if
//ls_table_name = ads_data.Object.DataWindow.Table.UpdateTable //Commented By Ken.Guo 06.16.2008
ls_table_name = ads_data.Describe("DataWindow.Table.UpdateTable") //Added By Ken.Guo 06.16.2008
li_facility_specific = of_get_facil_specific(li_table_id)
ll_RowCount = ads_data.RowCount()

//Retrieve address lookup and get field type
// <RP> 1.10.2017 --------------------------------------------
gnv_data.of_retrieveIfNecessary("sys_fields", FALSE)
// <RP>
lds_audit_fields = gnv_data.ids_sys_fields
lds_audit_fields.SetFilter("sys_tables_table_name = '" + ls_table_name + "' AND sys_fields_audit_fld = 'Y'")
lds_audit_fields.Filter()
li_AuditFieldCount = lds_audit_fields.Rowcount()
//<Modify> 08/04/2007 by: Andy Reason:BugJ073004 
//If No data fields need audit,
//then the system will pop a messagebox that it is not necessary.
//if li_AuditFieldCount < 1 then Return -1
if li_AuditFieldCount < 1 then Return 1//success
//end of modify

for i = 1 to li_AuditFieldCount
	//Retrieve address lookup
	ls_lookup_type = lds_audit_fields.GetItemString(i, "lookup_type")
	if ls_lookup_type = "A" then
		if not IsValid(ids_address_lookup) then
			ids_address_lookup = Create DataStore
			ids_address_lookup.DataObject = "d_import_ds_lu_address"
			ids_address_lookup.SetTransObject(SQLCA)			
		end if
		ll_lu_rc = ids_address_lookup.RowCount()
		if ll_lu_rc <= 0 then ll_lu_rc = ids_address_lookup.Retrieve()
		//ids_address_lookup data from import module when being data import
	end if
	//Get field type
	ls_field_name = lds_audit_fields.GetItemString(i, "field_name")
	ls_field_type = Upper(ads_data.Describe(ls_field_name + ".ColType"))	
	if Pos(ls_field_type, "CHAR") > 0 then
		ls_field_type = "C"
	elseif Pos(ls_field_type, "DATE") > 0 then
		ls_field_type = "D"
	elseif Pos(ls_field_type, "LONG") > 0 or Pos(ls_field_type, "DECIMAL") > 0 or Pos(ls_field_type, "REAL") > 0 then
		ls_field_type = "N"
	elseif ls_field_type = "!" then
		ls_field_type = "!"
	else
		as_ErrorText = "Unknown data type " + ls_field_type + " for field " + ls_field_name
		Return -1
	end if
	ls_field_type_arr[UpperBound(ls_field_type_arr) + 1] = ls_field_type
next
li_table_id = lds_audit_fields.GetItemNumber(1, "table_id")

//Execute field audit process
for i = 1 to ll_RowCount
	ll_rec_id = ads_data.GetItemNumber(i, "rec_id") 
	ll_prac_id = ads_data.GetItemNumber(i, "prac_id")
	if li_facility_specific = 1 then
		if ls_table_name = "pd_affil_stat" then
			ll_facility_id = ads_data.GetItemNumber(i, "parent_facility_id")
		else
			ll_facility_id = ads_data.GetItemNumber(i, "facility_id")
		end if
	end if
	ldis_Status = ads_data.GetItemStatus(i, 0, Primary!)
	
	if ldis_Status = DataModified! then
	////////////////////////[1-Current row is DataModified!]///////////////////////////////////
		for j = 1 to li_AuditFieldCount			
			ll_field_id = lds_audit_fields.GetItemNumber(j, "field_id")
			ls_field_name = lds_audit_fields.GetItemString(j, "field_name")
			if ls_field_type_arr[j] = "!" then Continue
			
			if ads_data.GetItemStatus(i, ls_field_name, Primary!) = DataModified! then
				ls_lookup_field_name = UPPER(lds_audit_fields.GetItemString(j, "lookup_field_name"))
				ls_is_lookup = lds_audit_fields.GetItemString(j, "lookup_field")
				ls_lookup_type = lds_audit_fields.GetItemString(j, "lookup_type")				
				choose case ls_field_type_arr[j]
					case "C"
						ls_old_value = ads_data.GetItemString(i, ls_field_name, Primary!, True)
						ls_new_value = ads_data.GetItemString(i, ls_field_name)						
					case "N"
						ll_old_value = ads_data.GetItemNumber(i, ls_field_name, Primary!, True) 
						ll_new_value = ads_data.GetItemNumber(i, ls_field_name) 												
						if ls_is_lookup = "Y" then
							if ls_lookup_type = "C" then
								//get the old value						
								if ls_lookup_field_name = "CODE" then
									ls_old_value = gnv_data.of_getitem('code_lookup', 'code', 'lookup_code=' + string(ll_old_value))
								else
									ls_old_value = gnv_data.of_getitem('code_lookup', 'description', 'lookup_code=' + string(ll_old_value))
								end if
	
								//get the new value
								if ls_lookup_field_name = "CODE" then
									ls_new_value = gnv_data.of_getitem('code_lookup', 'code', 'lookup_code=' + string(ll_new_value))
								else
									ls_new_value = gnv_data.of_getitem('code_lookup', 'description', 'lookup_code=' + string(ll_new_value))
								end if							
							else
								//get the old value
								ll_FindRow = ids_address_lookup.Find("lookup_code = " + string(ll_old_value), 1, ll_lu_rc)
								if ll_FindRow <= 0 then
									ls_old_value = ""
								elseif ls_lookup_field_name = "CODE" then
									ls_old_value = ids_address_lookup.GetItemString(1, "code")									
								else
									ls_old_value = ids_address_lookup.GetItemString(1, "entity_name")								
								end if
	
								//get the new value								
								ll_FindRow = ids_address_lookup.Find("lookup_code = " + string(ll_new_value), 1, ll_lu_rc)								
								if ll_FindRow = 0 then
									ls_new_value = ""
								elseif ls_lookup_field_name = "CODE" then
									ls_new_value = ids_address_lookup.GetItemString(1, "code")									
								else
									ls_new_value = ids_address_lookup.GetItemString(1, "entity_name")																
								end if
							end if
						else
							ls_old_value = String(ads_data.GetItemNumber(i, ls_field_name, Primary!, True))
							ls_new_value = String(ads_data.GetItemNumber(i, ls_field_name))						
						end if					
					case else
						ls_old_value = String(Date(ads_data.GetItemDateTime(i, ls_field_name, Primary!, True)))
						ls_new_value = String(Date(ads_data.GetItemDateTime(i, ls_field_name)))																		
				end choose
				
				//Insert a new audit record
				ll_InsertRow = ids_sys_audit.InsertRow(0)
				ids_sys_audit.SetItem(ll_InsertRow, "rec_id", ll_rec_id)
				ids_sys_audit.SetItem(ll_InsertRow, "prac_id", ads_data.GetItemNumber(i, "prac_id"))					
				ids_sys_audit.SetItem(ll_InsertRow, "seq_no", ll_seq_no)										
				ids_sys_audit.SetItem(ll_InsertRow, "table_id", li_table_id)
				ids_sys_audit.SetItem(ll_InsertRow, "field_id", ll_field_id)
				ids_sys_audit.SetItem(ll_InsertRow, "old_value", mid(ls_old_value,1,100))
				ids_sys_audit.SetItem(ll_InsertRow, "new_value", mid(ls_new_value,1 ,100))
				ids_sys_audit.SetItem(ll_InsertRow, "user_id", gnv_app.of_getuserid())
				ids_sys_audit.SetItem(ll_InsertRow, "audit_type", "E")					
				ids_sys_audit.SetItem(ll_InsertRow, "date_time_modified", DateTime(Today(), Now()))
				ids_sys_audit.SetItem(ll_InsertRow, "sys_audit_exported", 1)
				if li_facility_specific = 1 then
					ids_sys_audit.SetItem(ll_InsertRow, "facility_id", ll_facility_id)
				else
					ids_sys_audit.SetItem(ll_InsertRow, "facility_id", 0)
				end if
			end if
		next

	elseif ldis_Status = NewModified! then
	////////////////////////[2-Current row is NewModified!]///////////////////////////////////	
		ll_field_id = 1000 
		choose case ls_table_name
			case "pd_affil_stat"
				if ads_data.Describe("parent_facility_id.ColType") = "!" then Continue
				if ads_data.Describe("apptmnt_type.ColType") = "!" then Continue
				ll_new_value = ads_data.GetItemnumber(i, "parent_facility_id")
				ls_value1 = gnv_data.of_getitem("facility","facility_name","facility_id = " + String(ll_new_value))				
				ls_value2 = ads_data.GetItemstring(i, "apptmnt_type")
				ls_new_value = ls_value1 + "-" + ls_value2
			case "pd_affil_dept"
				if ads_data.Describe("department.ColType") = "!" then Continue
				if ads_data.Describe("facility_id.ColType") = "!" then Continue
				ll_new_value = ads_data.GetItemnumber(i, "department")
				ls_value2 = gnv_data.of_getitem('code_lookup', 'description', 'lookup_code='+string(ll_new_value))
				ll_new_value = ads_data.GetItemnumber(i, "facility_id")
				ls_value1 = gnv_data.of_getitem("facility","facility_name","facility_id = " + String(ll_new_value))
				ls_new_value = ls_value1 + "-" + ls_value2
			case "pd_affil_staff_cat"
				if ads_data.Describe("facility_id.ColType") = "!" then Continue
				if ads_data.Describe("staff_category.ColType") = "!" then Continue
				ll_new_value = ads_data.GetItemnumber(i, "facility_id")
				ls_value2 = gnv_data.of_getitem("facility","facility_name","facility_id = " + String(ll_new_value))
				ll_new_value = ads_data.GetItemnumber(i, "staff_category")
				ls_value1 = gnv_data.of_getitem('code_lookup', 'description', 'lookup_code='+string(ll_new_value))				
				ls_new_value = ls_value1 + "-" + ls_value2
			case "pd_affil_staff_leave"
				if ads_data.Describe("facility_id.ColType") = "!" then Continue
				if ads_data.Describe("leave_of_absence_reason.ColType") = "!" then Continue
				ll_new_value = ads_data.GetItemnumber(i, "facility_id")
				ls_value2 = gnv_data.of_getitem("facility","facility_name","facility_id = " + String(ll_new_value))
				ll_new_value = long(ads_data.GetItemstring(i, "leave_of_absence_reason"))
				ls_value1 = gnv_data.of_getitem('code_lookup', 'description', 'lookup_code='+string(ll_new_value))				
				ls_new_value = ls_value1 + "-" + ls_value2
			case else
				//get reference field 1
				ll_field_id1 = ll_reference_field_1
				if li_AuditFieldCount > 0 then
					if isnull(ll_field_id1) or ll_field_id1 < 1 then ll_field_id1 = lds_audit_fields.GetItemNumber(1, "field_id")
				end if

				//get reference field 2
				ll_field_id2 = ll_reference_field_2
				if li_AuditFieldCount > 1 then
					if isnull(ll_field_id2) or ll_field_id2 < 1 then ll_field_id2 = lds_audit_fields.GetItemNumber(2, "field_id")
				end if

				//get reference field name 1
				ls_field_name = gnv_data.of_getitem("sys_fields", "field_name", "field_id = " + String(ll_field_id1))
				if li_AuditFieldCount > 0 then
					if isnull(ls_field_name) or ls_field_name = "" then ls_field_name = lds_audit_fields.GetItemString(1, "field_name")
				end if

				//get reference field name 2
				ls_field_name2 = gnv_data.of_getitem("sys_fields", "field_name", "field_id = " + String(ll_field_id2))
				if li_AuditFieldCount > 1 then
					if isnull(ls_field_name2) or ls_field_name2 = "" then ls_field_name2 = lds_audit_fields.GetItemString(2, "field_name")
				end if
				
				//datatype and lookup field
				ls_field_type = gnv_data.of_getitem("sys_fields", "field_type", "field_id = " + String(ll_field_id1))
				ls_lookup_type = gnv_data.of_getitem("sys_fields", "lookup_type", "field_id = " + String(ll_field_id1))

				ls_field_type = Upper(ads_data.Describe(ls_field_name + ".ColType"))
				if Pos(ls_field_type, "CHAR") > 0 then
					ls_field_type = "C"
				elseif Pos(ls_field_type, "DATE") > 0 then
					ls_field_type = "D"
				elseif Pos(ls_field_type, "LONG") > 0 OR Pos(ls_field_type, "DECIMAL") > 0 then
					ls_field_type = "N"
				elseif ls_field_type = "!" then
					Continue
				else
					as_ErrorText = "Unknown data type " + ls_field_type + " for field " + ls_field_name
					Return -1
				end if
				
				//data value1
				choose case ls_field_type
					case "C","V"
						ls_value1 = ads_data.GetItemString(i, ls_field_name)
					case "N", "I"
						ls_value1 = string(ads_data.GetItemnumber(i, ls_field_name))
					case "D"
						ls_value1 = string(ads_data.GetItemdatetime(i, ls_field_name))
					case else
						ls_value1 = ""
				end choose

				if ls_lookup_type = "C" then
					ll_new_value = long(ls_value1)
					ls_value1 = gnv_data.of_getitem('code_lookup', 'description', 'lookup_code='+string(ll_new_value))
				elseif ls_lookup_type = "A" then
					ll_new_value = long(ls_value1)
					ll_FindRow = ids_address_lookup.Find("lookup_code = " + string(ll_new_value),1, ll_lu_rc)
					if ll_FindRow > 0 then ls_value1 = ids_address_lookup.GetItemString(ll_FindRow , "entity_name")
				end if

				ls_field_type = gnv_data.of_getitem("sys_fields", "field_type", "field_id = " + String(ll_field_id2))
				ls_lookup_type = gnv_data.of_getitem("sys_fields", "lookup_type", "field_id = " + String(ll_field_id2))

				ls_field_type = Upper(ads_data.Describe(ls_field_name2 + ".ColType"))
				if Pos(ls_field_type, "CHAR") > 0 then
					ls_field_type = "C"
				elseif Pos(ls_field_type, "DATE") > 0 then
					ls_field_type = "D"
				elseif Pos(ls_field_type, "LONG") > 0 OR Pos(ls_field_type, "DECIMAL") > 0 then
					ls_field_type = "N"
				elseif ls_field_type = "!" then
					Continue
				else
					as_ErrorText = "Unknown data type " + ls_field_type + " for field " + ls_field_name
					Return -1
				end if
				
				//data value2
				choose case ls_field_type
					case "C","V"
						ls_value2 = ads_data.GetItemString(i, ls_field_name2)
					case "N", "I"
						ls_value2 = string(ads_data.GetItemnumber(i, ls_field_name2))
					case "D"
						ls_value2 = string(ads_data.GetItemdatetime(i, ls_field_name2))
					case else
						ls_value2 = ""
				end choose		

				if ls_lookup_type = "C" then
					ll_new_value = long(ls_value2)
					ls_value2 = gnv_data.of_getitem('code_lookup', 'description', 'lookup_code='+string(ll_new_value))
				elseif ls_lookup_type = "A" then
					ll_new_value = long(ls_value2)
					ll_FindRow = ids_address_lookup.Find("lookup_code = " + string(ll_new_value),1, ll_lu_rc)
					if ll_FindRow > 0 then ls_value2 = ids_address_lookup.GetItemString(ll_FindRow , "entity_name")					
				end if
				
				//check for nulls
				if isnull(ls_value1) then ls_value1  = ""
				if isnull(ls_value2) then ls_value2  = ""
				ls_new_value = ls_value1 + "-" + ls_value2
				ls_new_value = mid(ls_new_value,1,100)
		end choose
		
		//Insert a new audit record
		ll_InsertRow = ids_sys_audit.InsertRow(0)
		ids_sys_audit.SetItem(ll_InsertRow, "rec_id", ll_rec_id)
		ids_sys_audit.SetItem(ll_InsertRow, "prac_id", ads_data.GetItemNumber(i, "prac_id"))
		ids_sys_audit.SetItem(ll_InsertRow, "seq_no", ll_seq_no)
		ids_sys_audit.SetItem(ll_InsertRow, "table_id", li_table_id)
		ids_sys_audit.SetItem(ll_InsertRow, "field_id", 1000)
		ids_sys_audit.SetItem(ll_InsertRow, "new_value", ls_new_value)
		ids_sys_audit.SetItem(ll_InsertRow, "user_id", gnv_app.of_getuserid())
		ids_sys_audit.SetItem(ll_InsertRow, "audit_type", "I")					
		ids_sys_audit.SetItem(ll_InsertRow, "date_time_modified", DateTime(Today(), Now()))		
		ids_sys_audit.SetItem(ll_InsertRow, "sys_audit_exported", 1)
		if li_facility_specific = 1 then
			ids_sys_audit.SetItem(ll_InsertRow, "facility_id", ll_facility_id)
		else
			ids_sys_audit.SetItem(ll_InsertRow, "facility_id", 0)
		end if
	end if
next
of_field_audit_update()

Return 1
//---------------------------- APPEON END ----------------------------
end function

public function string of_create_dynamic_dw_4_prof (long al_prac_id, integer ai_data_view_id, integer ai_screen_id, u_dw adw_detail, boolean ab_screen_painter, integer ai_facility_id);SetPointer(HourGlass!)
Integer li_facility_specific
Integer li_sort_data_cnt
Integer m1
Integer li_dddw_code_cnt
Integer li_dddw_address_cnt
Integer li_row_cnt
Integer m
integer res //maha110602
Integer li_index
Integer li_obj_cnt
Integer i
Integer li_key_cnt
Integer li_prac_row_cnt
Integer t
Integer li_col_cnt
Integer li_fld_label_width
Integer li_fld_width
Integer li_table_cnt
integer li_set //maha030702
integer li_uls //maha082305
long ll_max_height
Boolean ib_create_browse 
Boolean lb_table_found
Boolean lb_multi_tablE
Boolean lb_first_field = True
Boolean lb_has_active_status = False
String ls_retval
String ls_sort_syntax
String ls_month
String ls_fld_lbl_font_wght
String ls_detail_band_height
String ls_dummy_array[]
String ls_width
String ls_return_syntax
String ls_dddw_width[]
String ls_height
String ls_x
String ls_y
String ls_justification
String ls_text
String ls_obj_type
String ls_obj_name
String ls_field_x[] 
String ls_visible
String ls_field_y[]
String ls_field_label_x[]
String ls_field_label_height[]
String ls_field_label_y[] 
String ls_field_label[]
String ls_field_id[]
String ls_mask[]
String ls_table_names[]
String ls_field_names[]
String ls_table_field_names[]
String ls_dw_field_names[]
String ls_key_fields_col_nm[]
String ls_temp_table
String ls_table_name
String ls_field_name
String ls_sql_syntax
String ls_grey
String ls_white
String ls_presentation_str
String ls_dwsyntax_str
String ERRORS
String ls_lookup_code
String ls_lookup_type
String ls_lookup_field
String ls_key_fields_syntax
String ls_key_fields[]
string des
string ls_color
Long ll_detail_height
string widt
integer wer
DataWindowChild dwchild
DataWindowChild dwchild_browse
datastore lds_screen_fields

long set1 , ll_recreate
String ls_Bold, ls_italic

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-32
//$<add> 03.13.2006 By: Cao YongWang
//$<reason> Performance tuning
//$<modification> Add a condition to make sure that: 1) DataWindow syntax will be stored in SRD files
//$<modification> in local machine; 2) the application directly gets the DataWindow syntax from local
//$<modification> machine instead of from the database when the same DataWindow is needed for a second time.

If appeongetclienttype() <> 'PB' Then
	ll_recreate = of_create_option(ai_data_view_id,ai_screen_id,'Y','D',string(idt_screen_cache),ab_screen_painter)
	If ll_recreate = 0 Then
//		ls_return_syntax = of_create_dynamic_dw_local(al_prac_id,ai_data_view_id,ai_screen_id,adw_detail,adw_browse,ab_screen_painter,ai_facility_id)
		If ls_return_syntax <> "-1" Then return ls_return_syntax
	End If
End If
//---------------------------- APPEON END ----------------------------

//debugbreak()



is_column_default[] = ls_dummy_array[]
is_column_names[] = ls_dummy_array[]

of_setup_cache()

	app_filler.ids_screen_fields_cache.ShareData( ids_screen_fields )
//messagebox("", "view_id = " + String (ai_data_view_id) + " AND screen_id = " + String( ai_screen_id ) )
	ids_screen_fields.SetFilter( "view_id = " + String (ai_data_view_id) + " AND screen_id = " + String( ai_screen_id ) )
	ids_screen_fields.Filter( )	
	li_row_cnt = ids_screen_fields.RowCount()	

	app_filler.ids_screen_objects_cache.ShareData( ids_screen_objects )
	ids_screen_objects.SetFilter( "view_id = " + String (ai_data_view_id) + " AND screen_id = " + String( ai_screen_id ) )
	ids_screen_objects.Filter( )
	li_obj_cnt = ids_screen_objects.RowCount()
	
	ids_screen_fields.SetSort( "field_order A" )
	ids_screen_fields.sort( ) //should be by field_order maha 051905 ######

ii_column_cnt = 0

ls_sql_syntax = "SELECT "
li_table_cnt = 0

//adw_detail.SetRedraw(False)

//CREATE SORT ORDER
integer wervv  //#####
wervv = ids_screen_fields.SetSort( "sort_field A" ) //maha corrected 051005
ids_screen_fields.Sort()
ls_sort_syntax = " ORDER BY "
FOR i = 1 TO li_row_cnt
	IF ids_screen_fields.GetItemNumber( i, "sort_field" ) > 0 THEN
		IF ids_screen_fields.GetItemString( i, "sort_order" ) = "D" THEN
			ls_sort_syntax = ls_sort_syntax + ids_screen_fields.GetItemString( i, "db_field_name" ) + " DESC,"			
		ELSE
			ls_sort_syntax = ls_sort_syntax + ids_screen_fields.GetItemString( i, "db_field_name" ) + " ASC,"			
		END IF
		li_sort_data_cnt ++
	END IF
END FOR
//ADD order BY CLAUSE
//IF li_sort_data_cnt > 0 THEN
//	ls_sort_syntax = Mid( ls_sort_syntax, 1, Len( ls_sort_syntax )-1 )
//	ls_sql_syntax = ls_sql_syntax + ls_sort_syntax
//else
//	ls_sql_syntax = ls_sql_syntax + " ORDER BY rec_id" //maha 111604
//END IF
wer = ids_screen_fields.SetSort( "field_order A" )
//messagebox("field_order",wer)
//ids_screen_fields.SetSort( "field_sort A" )
ids_screen_fields.Sort()

//BUILD SELECT 
FOR i = 1 TO li_row_cnt
	IF ( NOT ab_screen_painter AND ids_screen_fields.GetItemString(i, "visible") = "N" ) THEN
		CONTINUE //for visible =N do not add to the DE screen dw
	END IF
	ii_column_cnt++
	ls_table_name = Trim( ids_screen_fields.GetItemString( i, "db_table_name" ))
	ls_field_name = Trim( ids_screen_fields.GetItemString( i, "db_field_name" ))
	is_table_name = ls_table_name
	is_column_names[ii_column_cnt] = ls_field_name	
	is_column_default[ii_column_cnt] = ids_screen_fields.GetItemString( i, "default_value" )
	ls_mask[i] = ids_screen_fields.GetItemString( i, "field_mask" ) 
	ls_field_names[i] = ls_field_name
	ls_field_id[i] = String (ids_screen_fields.GetItemNumber( i, "field_id" ) )
	ls_field_x[i] = String (ids_screen_fields.GetItemNumber( i, "field_x" ) )
	ls_field_y[i] = String (ids_screen_fields.GetItemNumber( i, "field_y" ) )
	ls_field_label_height[i] = String (ids_screen_fields.GetItemNumber( i, "field_height" ) )
	if long(ls_field_y[i]) + long(ls_field_label_height[i]) > ll_max_height then ll_max_height = long(ls_field_y[i]) + long(ls_field_label_height[i])  //maha 051205
	//if i < 2 then messagebox(ls_field_names[i],ls_field_label_height[i])
	ls_dddw_width[i] = String(ids_screen_fields.GetItemNumber(i, "drop_down_width"))
	ls_field_label_x[i] = String (ids_screen_fields.GetItemNumber( i, "field_label_x" ) )
	ls_field_label_y[i] = String (ids_screen_fields.GetItemNumber( i, "field_label_y" ) )	
	ls_table_field_names[i] = Mid( ls_table_name,5,100 ) + "_" + ls_field_name
	ls_field_label[i] = ids_screen_fields.GetItemString( i, "field_label" )
	ls_sql_syntax = ls_sql_syntax + ls_table_name + "." + ls_field_name + ", "
	ls_fld_lbl_font_wght = String (ids_screen_fields.GetItemNumber( i, "data_view_fields_font_wieght" ) )	
	lb_table_found = False
	FOR t = 1 TO li_table_cnt
		IF ls_table_names[t] = ls_table_name THEN
			lb_table_found = True
		   EXIT
		END IF
	END FOR
	IF NOT lb_table_found THEN
		li_table_cnt ++
		ls_table_names[ li_table_cnt ] = ls_table_name
	END IF
END FOR

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 03/15/2007 By: Jervis
//$<reason> Fix a defect
if li_table_cnt = 0 then
	Messagebox("Caution","Failed to create SELECT syntax for datawindow. ")
	return '-1'
end if
//---------------------------- APPEON END ----------------------------

ls_sql_syntax = Left( ls_sql_syntax, Len(ls_sql_syntax) -2 )

li_row_cnt = UpperBound(ls_field_names)

  
//ADD KEY FIELDS TO SELECT
li_key_cnt = 0
FOR i = 1 TO li_table_cnt
//li_test = pos(ls_sql_syntax,"prac_id",1)
	//messagebox("pos",li_test)
	if pos(ls_sql_syntax,"prac_id",1) = 0 then //maha 051503 for lehigh to allow making prac_id visible
		ls_key_fields_syntax = ls_key_fields_syntax + ls_table_names[ i ] + ".prac_id, "
		li_key_cnt ++
		ls_key_fields[li_key_cnt] = ls_table_names[i] + ".prac_id"
		IF li_table_cnt > 1 THEN
			ls_key_fields_col_nm[li_key_cnt] = Mid(ls_table_names[ i ], 5, 100)  + "_prac_id"
			//--------------------------- APPEON BEGIN ---------------------------
			//$<add> 03/16/2007 By: Jervis
			//$<reason> Fixed a defect
			ls_table_field_names[upperbound(ls_table_field_names) + 1] = ls_key_fields_col_nm[li_key_cnt]
			//---------------------------- APPEON END ----------------------------
		ELSE
			ls_key_fields_col_nm[li_key_cnt] = "prac_id"
			//--------------------------- APPEON BEGIN ---------------------------
			//$<add> 03/16/2007 By: Jervis
			//$<reason> Fixed a defect
			ls_field_names[upperbound(ls_field_names) + 1] = "prac_id"
			//---------------------------- APPEON END ----------------------------

		END IF
	end if
	
	//--------------------------- APPEON BEGIN ---------------------------
	//$<modify> 03/16/2007 By: Jervis
	//$<reason> Fixed a defect
	/*
	li_key_cnt ++
	if pos(ls_sql_syntax,"rec_id",1) = 0 then  //maha 051503 to allow making prac_id visible
	*/
	if pos(ls_sql_syntax,"rec_id",1) = 0 then  //maha 051503 to allow making prac_id visible
		li_key_cnt ++
	//---------------------------- APPEON END ----------------------------
		ls_key_fields_syntax = ls_key_fields_syntax + ls_table_names[ i ] + ".rec_id, "
		ls_key_fields[li_key_cnt] = ls_table_names[i] + ".rec_id"
		IF li_table_cnt > 1 THEN
			ls_key_fields_col_nm[li_key_cnt] = Mid(ls_table_names[ i ], 5, 100)  + "_rec_id"
			is_rec_id_col_nm = Mid(ls_table_names[ i ], 5, 100)  + "_rec_id"
			//--------------------------- APPEON BEGIN ---------------------------
			//$<add> 03/16/2007 By: Jervis
			//$<reason> Fixed a defect
			ls_table_field_names[upperbound(ls_table_field_names) + 1] = is_rec_id_col_nm
			//---------------------------- APPEON END ----------------------------
		ELSE
			ls_key_fields_col_nm[li_key_cnt] = "rec_id"
			is_rec_id_col_nm = Mid(ls_table_names[ i ], 5, 100)  + "_rec_id"
			//--------------------------- APPEON BEGIN ---------------------------
			//$<add> 03/16/2007 By: Jervis
			//$<reason> Fixed a defect
			ls_field_names[upperbound(ls_field_names) + 1] = "rec_id"
			//---------------------------- APPEON END ----------------------------

		END IF
	end if
	
	
	IF ids_screen_fields.GetItemNumber(i, "facility_specific" ) = 1 THEN
		li_facility_specific = 1
		li_key_cnt ++
		ls_key_fields_syntax = ls_key_fields_syntax + ls_table_names[ i ] + ".facility_id, "
		ls_key_fields[li_key_cnt] = ls_table_names[i] + ".facility_id"
		IF li_table_cnt > 1 THEN
			ls_key_fields_col_nm[li_key_cnt] = Mid(ls_table_names[ i ], 5, 100)  + "_facility_id"
			is_rec_id_col_nm = Mid(ls_table_names[ i ], 5, 100)  + "_facility_id"
		ELSE
			ls_key_fields_col_nm[li_key_cnt] = "facility_id"
			is_rec_id_col_nm = Mid(ls_table_names[ i ], 5, 100)  + "_facility_id"
		END IF
		//--------------------------- APPEON BEGIN ---------------------------
		//$<add> 03/16/2007 By: Jervis
		//$<reason> Fixed a defect
		if pos(ls_sql_syntax,"facility_id",1) = 0 then
			if li_table_cnt > 1 then
				ls_table_field_names[upperbound(ls_table_field_names) + 1] = is_rec_id_col_nm
			else
				ls_field_names[upperbound(ls_field_names) + 1] = "facility_id"
			end if
		end if
		//---------------------------- APPEON END ----------------------------

	END IF
	
	//added for tables with seq_no fields   JAD-6/06/02
	//--------------------------- APPEON BEGIN ---------------------------
	//$<modify> 04.13.2006 By: Liang QingShi
	//$<reason> Fix a defect in the original unmodified PowerBuilder application. After analyze the
	//$<reason> original application, one constraint is missed in the condition.
	/*
	IF ai_screen_id = 61 THEN
	*/
	IF ai_screen_id = 61 or ai_screen_id = 33 THEN
	
	//---------------------------- APPEON END ----------------------------
		li_key_cnt ++
		ls_key_fields_syntax = ls_key_fields_syntax + ls_table_names[ i ] + ".seq_no, "
		ls_key_fields[li_key_cnt] = ls_table_names[i] + ".seq_no"
		IF li_table_cnt > 1 THEN
			ls_key_fields_col_nm[li_key_cnt] = Mid(ls_table_names[ i ], 5, 100)  + "_seq_no"
			is_rec_id_col_nm = Mid(ls_table_names[ i ], 5, 100)  + "_seq_no"
		ELSE
			//ls_key_fields_col_nm[li_key_cnt] = "facility_id" Fixed By Jervis 03/16/2007 is seq_no not facility_id
			ls_key_fields_col_nm[li_key_cnt] = "seq_no"
			is_rec_id_col_nm = Mid(ls_table_names[ i ], 5, 100)  + "_seq_no"
		END IF	
		
		//--------------------------- APPEON BEGIN ---------------------------
		//$<add> 03/16/2007 By: Jervis
		//$<reason> Fixed a defect
		if pos(ls_sql_syntax,"seq_no",1) = 0 then
			if li_table_cnt > 1 then
				ls_table_field_names[upperbound(ls_table_field_names) + 1] = is_rec_id_col_nm
			else
				ls_field_names[upperbound(ls_field_names) + 1] = "seq_no"
			end if
		end if
		//---------------------------- APPEON END ----------------------------
	END IF	
		
END FOR

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 03/16/2007 By: Jervis
//$<reason> Fixed a defect
integer li_row_cnt_new
li_row_cnt_new = UpperBound(ls_field_names)	
//---------------------------- APPEON END ----------------------------

ls_sql_syntax = Mid( ls_sql_syntax, 1, 7 ) + ls_key_fields_syntax + Mid(ls_sql_syntax, 8, 10000)

//IF ls_table_name = "pd_address" THEN  // instead of following run 2.0 update group Practice button.
//	ls_sql_syntax = ls_sql_syntax + ", gp_id"
//END IF
//messagebox("", ls_sql_syntax)

//ASSIGN DW FIELD NAMES
IF li_table_cnt > 1 THEN
	lb_multi_table = True
	//FOR i = 1 TO li_row_cnt	03/16/2007
	For i = 1 to li_row_cnt_new
		ls_dw_field_names[i] = ls_table_field_names[i]
	END FOR	
ELSE
	lb_multi_table = False
	//FOR i = 1 TO li_row_cnt	03/16/2007
	for i = 1 to li_row_cnt_new
		ls_dw_field_names[i] = ls_field_names[i]
	END FOR
END IF

//BUILD FROM CLAUSE
ls_sql_syntax = ls_sql_syntax + " FROM "
FOR i = 1 TO li_table_cnt
	ls_sql_syntax = ls_sql_syntax + ls_table_names[i] + ", "
END FOR
ls_sql_syntax = Left( ls_sql_syntax, Len(ls_sql_syntax) -2 )
ls_return_syntax = ls_sql_syntax
//ADD WHERE CLAUSE
ls_sql_syntax = ls_sql_syntax + " WHERE " + ls_table_names[1] + ".prac_id  = " + String( al_prac_id )

IF li_facility_specific = 1 THEN
	ls_sql_syntax = ls_sql_syntax + " AND " + ls_table_names[1] + ".facility_id  = " + String( ai_facility_id )
END IF

//CREATE SORT ORDER code moved to top of function //maha 051905

//ADD order BY CLAUSE
IF li_sort_data_cnt > 0 THEN
	ls_sort_syntax = Mid( ls_sort_syntax, 1, Len( ls_sort_syntax )-1 )
	ls_sql_syntax = ls_sql_syntax + ls_sort_syntax
else
	ls_sql_syntax = ls_sql_syntax + " ORDER BY rec_id" //maha 111604
END IF

//CREATE SYNTAX FOR DETAIL DW
ls_grey = "80269524"//String(rgb(192,192,192))
ls_presentation_str = "style(type=form)" + " Column(Border=5 ) Datawindow(Color=" + ls_grey + " )" + "Text(Background.Color=" + ls_grey + ")"  
//ls_presentation_str = "style(type=form)" + " Column(Border=5 ) Datawindow(Color=" + ls_grey + " )" + "Text(Background.Color=0)"  //testing
//openwithparm( w_sql_msg, ls_sql_syntax )

ls_dwsyntax_str = SQLCA.SyntaxFromSQL(ls_sql_syntax, &
	ls_presentation_str, ERRORS)

IF Len(ERRORS) > 0 THEN
	MessageBox("Caution", &
	"SyntaxFromSQL caused these errors: " + ERRORS)
	RETURN "-1"
END IF

adw_detail.Create( ls_dwsyntax_str, ERRORS)

IF Len(ERRORS) > 0 THEN
	MessageBox("Caution", &
	"Create cause these errors: " + ERRORS)
	RETURN "-1"
END IF

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> UM-05
//$<add> 01.13.2006 By: Luke
//$<reason> It is currently unsupported to automatically change a column's edit style on the Web.
//$<modification> Modify the DataWindow syntax and then rebuild the DataWindow to
//$<modification> implement the functionality of changing a column's edit style.
If appeongetclienttype() <> 'PB' Then
	string ls_appeon_colname[],ls_editmask_colname[],ls_editmask_modify[]
	long li_appeon_index ,li_appeon_index2 
	
	ls_dwsyntax_str = adw_detail.describe("datawindow.syntax")
	li_appeon_index = 1
	li_appeon_index2 = 1
	
	FOR i = 1 TO li_row_cnt//ids_screen_fields.rowcount()
		IF NOT ab_screen_painter AND ids_screen_fields.GetItemString(i, "visible") = "N" THEN
			CONTINUE
		END IF
		/*
		IF ls_dw_field_names[i] = "active_status" THEN
			ls_appeon_colname[li_appeon_index] = ls_dw_field_names[i]
			li_appeon_index++
		END IF
		*/
		IF ids_screen_fields.GetItemString( i, "lookup_field") = "Y" AND NOT ab_screen_painter THEN
			ls_appeon_colname[li_appeon_index] = ls_dw_field_names[i]
			li_appeon_index++
		END IF
	
		//--> Begin change Editmask 
			IF ls_dw_field_names[i] <> "active_status" THEN
				IF ls_mask[i] <> "" THEN
					IF ls_mask[i] = "##" THEN
					ELSEIF ls_mask[i] = "(###)###-####" THEN
						//adw_detail.Modify( ls_dw_field_names[i] + ".EditMask.Mask='(###)###-####'" )
						/*ls_editmask_colname[Li_appeon_index2] = ls_dw_field_names[i]
						ls_editmask_modify[Li_appeon_index2] = "EditMask.Mask='(###)###-####'"
						Li_appeon_index2 ++ */				//Comment by Scofield on 2008-08-12
					ELSEIF ls_mask[i] = "###-##-####" THEN
						//adw_detail.Modify( ls_dw_field_names[i] + ".EditMask.Mask='###-##-####'")		
						ls_editmask_colname[Li_appeon_index2] = ls_dw_field_names[i]
						ls_editmask_modify[Li_appeon_index2] = "EditMask.Mask='###-##-####'"
						Li_appeon_index2 ++
					ELSEIF ls_mask[i] = "#####-####" THEN
						//adw_detail.Modify( ls_dw_field_names[i] + ".EditMask.Mask='#####-####'" )				
						ls_editmask_colname[Li_appeon_index2] = ls_dw_field_names[i]
						ls_editmask_modify[Li_appeon_index2] = "EditMask.Mask='#####-####'"
						Li_appeon_index2 ++
					END IF
				END IF	
			END IF
			//--< end change Editmask 
	END FOR
	
	//specail code for pd_address
	IF ls_table_name = "pd_address" THEN
		set1 = of_get_app_setting("set_1","I")
		
		if set1 = 1 then //maha 072301 create populate button only if using addresses for find
			ls_appeon_colname[li_appeon_index] = 'street'
			li_appeon_index++
		end if
					
		ls_appeon_colname[li_appeon_index] = 'billing_address_id'
		li_appeon_index++
	END IF
	
	of_change_to_dddw (ls_dwsyntax_str,ls_appeon_colname)
	of_change_to_editmask(ls_dwsyntax_str, ls_editmask_colname)
	
	adw_detail.Create( ls_dwsyntax_str, ERRORS)
	
	IF Len(ERRORS) > 0 THEN
		MessageBox("Caution", &
		"Create cause these errors: " + ERRORS + ls_dwsyntax_str)

		RETURN "-1"
	END IF
End If

//	//---------------------------- APPEON END ----------------------------	
//	
//END IF
	


	adw_detail.SetTransObject( SQLCA )
	li_prac_row_cnt = adw_detail.Retrieve()


IF li_prac_row_cnt = 0 THEN 
	return "NONE"
	//Start Code Change ---- 06.09.2006 #531 maha
	
ELSE
	IF IsValid( m_pfe_cst_data_entry ) THEN
	//	m_pfe_cst_data_entry.m_edit.m_addverificationentry.Enabled = True  maha removed 082503
	END IF
	//of_set_defaults( adw_detail, 1 )
	//adw_detail.SetItemStatus( 1, 0, Primary!, NotModified! )
END IF

//debugbreak()
IF	lb_multi_table THEN
	//adw_detail.of_SetMultiTable(TRUE)
	//FOR i = 1 TO li_table_cnt
		//adw_detail.inv_multitable.of_Register( ls_table_names[I], ls_table_2_fields, ls_table_2_update_fields, TRUE, 0)
	//END FOR
ELSE
	adw_detail.Object.DataWindow.Table.UpdateTable= ls_table_names[1]
	adw_detail.Object.DataWindow.Table.UpdateWhere= '0'
	adw_detail.Object.DataWindow.Table.UpdateKeyinPlace = 'Yes'
	//FOR i = 1 TO li_row_cnt		03/16/2007
	For i = 1 to li_row_cnt_new
		adw_detail.Modify( ls_dw_field_names[i] + ".Update= Yes")	
		IF Pos( ls_dw_field_names[i], "prac_id" ) > 0  OR Pos( ls_dw_field_names[i], "rec_id" ) > 0 THEN
			adw_detail.Modify( ls_dw_field_names[i] + ".Key=Yes")
			adw_detail.Modify(ls_dw_field_names[i] + ".Edit.DisplayOnly=Yes")
		END IF
	next
	//03/16/2007 
	For i = 1 to li_row_cnt
		if ids_screen_fields.GetItemstring( i, "display_only" ) = "Y" then //maha 041404 to allow single fields to be read only
			//messagebox("display only",ls_dw_field_names[i])
			adw_detail.Modify(ls_dw_field_names[i] + ".TabSequence = '0'" ) //set below
			adw_detail.Modify(ls_dw_field_names[i] + ".background.color = '12632256'")
		end if
	END FOR
END IF
//debugbreak()
//IF ib_create_browse THEN
//	adw_detail.ShareData(adw_browse)
//END IF
//messagebox("",  Long( adw_detail.Object.DataWindow.Detail.Height) )
//IF Long( adw_detail.Object.DataWindow.Detail.Height) > 1800 THEN
//IF Long( adw_detail.Object.DataWindow.Detail.Height) > ( adw_detail.Height + 50 ) THEN
//ll_max_height = ll_max_height + 50 
////adw_detail.Object.DataWindow.Detail.Height= 5000 //maha moved to end
//adw_detail.Object.DataWindow.Detail.Height= ll_max_height
adw_detail.Modify("active_status.Initial='1'")
//messagebox("cash",ids_screen_fields.rowcount())
//messagebox("field names",string(upperbound(ls_dw_field_names[])))

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-33
//$<add> 01.25.2006 By: Cao YongWang
//$<reason> Pervformance tuning.
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.
gnv_appeondb.of_startqueue()
//---------------------------- APPEON END ----------------------------

FOR i = 1 TO li_row_cnt//ids_screen_fields.rowcount()
	IF NOT ab_screen_painter AND ids_screen_fields.GetItemString(i, "visible") = "N" THEN
		CONTINUE
	END IF
	//visible
	IF ab_screen_painter THEN
		IF ids_screen_fields.GetItemString(i, "visible") = "N" THEN
			adw_detail.Modify(ls_dw_field_names[i] + ".color = '8421504'") 
			adw_detail.Modify(ls_dw_field_names[i] + ".background.color = '12632256'") 
			adw_detail.Modify(ls_dw_field_names[i] + "_t.color = '8421504'") 
		ELSE
			adw_detail.Modify(ls_dw_field_names[i] + ".color = '0'") 
			adw_detail.Modify(ls_dw_field_names[i] + "_t.color = '0'")
			adw_detail.Modify(ls_dw_field_names[i] + "_t.background.mode = '1'") //Start Code Change ---- 10.22.2007 #V7 maha added to make labels transparent
			adw_detail.Modify(ls_dw_field_names[i] + ".background.color = '16777215'") 
		END IF
	END IF

	IF ab_screen_painter THEN
		//--------------------------- APPEON BEGIN ---------------------------
		//$<ID> UM-07
		//$<modify> 01.13.2006 By: LeiWei
		//$<reason> The "dbname" property is readonly on the Web after migration.
		//$<modification> In order to make the functionality the same to that in PowerBuilder, 
		//$<modification> change it to the writable TabSequence property
		//adw_detail.Modify( ls_dw_field_names[i] + ".TabSequence = '0'" )
		//adw_detail.Modify( ls_dw_field_names[i] + ".dbname = '" + String( i * 10) + "'" )
		adw_detail.Modify( ls_dw_field_names[i] + ".TabSequence = '" + String( i * 10) + "'" )
		//---------------------------- APPEON END ----------------------------
	ELSE
		
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		IF Len(ls_dw_field_names[i]) > 0 AND lb_first_field THEN
			lb_first_field = False
			is_first_column = ls_dw_field_names[i]
		END IF
		if ids_screen_fields.GetItemstring( i, "display_only" ) = "Y" then //maha 041404
			adw_detail.Modify( ls_dw_field_names[i] + ".TabSequence = '0'" )
			adw_detail.Modify( ls_dw_field_names[i] + ".border = '2'" )
		else
			adw_detail.Modify( ls_dw_field_names[i] + ".TabSequence = '" + String(i) + "'" )
		end if
			
	END IF
	
//	IF ib_create_browse THEN
//		adw_browse.Modify( ls_dw_field_names[i] + ".TabSequence = '0'" )
//		adw_browse.Modify( ls_dw_field_names[i] + "_t.text = '" + ls_field_label[i] + "'")	
//	END IF
	
	if isnull(ls_field_label[i]) then ls_field_label[i] = '' //Jervis 02.18.2008
	adw_detail.Modify( ls_dw_field_names[i] + "_t.text = '" + ls_field_label[i] + "'")

	//bold or not?
	adw_detail.Modify( ls_dw_field_names[i] + "_t.font.weight = '" + ls_fld_lbl_font_wght + "'")	

	if integer(ls_field_label_height[i]) > 120 then //maha added to allow multi line fields to wrap 011504
		//messagebox(ls_dw_field_names[i],ls_field_label_height[i])
		adw_detail.Modify( ls_dw_field_names[i] + ".edit.AutoHScroll = No")
	end if

	li_fld_label_width = ids_screen_fields.GetItemNumber( i, "field_label_width" )
	li_fld_width = ids_screen_fields.GetItemNumber( i, "field_width" ) 
	adw_detail.Modify( ls_dw_field_names[i] + ".width = '" + String( li_fld_width ) + "'" )	
	adw_detail.Modify( ls_dw_field_names[i] + "_t.width = '" + String( li_fld_label_width ) + "'" )
	adw_detail.Modify( ls_dw_field_names[i] + ".height = '" + String( ls_field_label_height[i] ) + "'" )

//	IF ib_create_browse THEN
//		IF li_fld_width < li_fld_label_width THEN
//			adw_browse.Modify( ls_dw_field_names[i] + ".width = '" + String( li_fld_label_width ) + "'" )
//		ELSE
//			adw_browse.Modify( ls_dw_field_names[i] + ".width = '" + String( li_fld_width ) + "'" )
//		END IF
//	END IF

	
	IF ls_field_x[i] = "0" THEN
		adw_detail.Modify( ls_dw_field_names[i] + ".x = 750")
		adw_detail.Modify( ls_dw_field_names[i] + ".y = " + String(i*100) )

		adw_detail.Modify( ls_dw_field_names[i] + "_t.x = 100")
		adw_detail.Modify( ls_dw_field_names[i] + "_t.y = " + String(i*100) )
	ELSE
		adw_detail.Modify( ls_dw_field_names[i] + ".x = " + ls_field_x[i] )
		adw_detail.Modify( ls_dw_field_names[i] + ".y = " + ls_field_y[i] )

		adw_detail.Modify( ls_dw_field_names[i] + "_t.x = " + ls_field_label_x[i] )
		adw_detail.Modify( ls_dw_field_names[i] + "_t.y = " + ls_field_label_y[i] )		
	END IF

	//tag value set to field id
	adw_detail.Modify( ls_dw_field_names[i] + ".tag = '" + ls_field_id[i] + "'" )
	adw_detail.Modify( ls_dw_field_names[i] + "_t.tag = '" + ls_field_id[i] + "'" )

	//alignment
	adw_detail.Modify( ls_dw_field_names[i] + ".alignment = '" + ids_screen_fields.GetItemString( i, "justification" ) + "'" )	
	adw_detail.Modify( ls_dw_field_names[i] + "_t.alignment = '" + String( ids_screen_fields.GetItemNumber( i, "field_label_justification" ) ) + "'" )	

//	IF ib_create_browse THEN
//		adw_browse.Modify( ls_dw_field_names[i] + ".alignment = '" + ids_screen_fields.GetItemString( i, "justification" ) + "'" )	
//		adw_browse.Modify( ls_dw_field_names[i] + "_t.alignment = '" + String( ids_screen_fields.GetItemNumber( i, "field_label_justification" ) ) + "'" )	
//	END IF
	
	IF ls_dw_field_names[i] = "active_status" THEN
		adw_detail.Modify( ls_dw_field_names[i] + ".dddw.VscrollBar = Yes")			
		adw_detail.Modify( ls_dw_field_names[i] + ".dddw.useasborder = Yes")			
		adw_detail.Modify( ls_dw_field_names[i] + ".dddw.NilIsNull= Yes")
		//adw_detail.Modify( ls_dw_field_names[i] + ".dddw.Lines= 15")
		adw_detail.Modify( ls_dw_field_names[i] + "_t.font.underline = '1'")
		adw_detail.Modify( ls_dw_field_names[i] + ".dddw.Required = Yes")
		adw_detail.Modify( ls_dw_field_names[i] + ".dddw.name = 'd_code_lookup_active_inactive'")
		adw_detail.Modify( ls_dw_field_names[i] + ".dddw.datacolumn = 'lookup_code'")			
		adw_detail.Modify( ls_dw_field_names[i] + ".dddw.displaycolumn = 'description'")						


	END IF
		IF UPPER(ls_lookup_field) = "ENTITY_NAME" THEN

		END IF
	IF ids_screen_fields.GetItemString( i, "lookup_field") = "Y" AND NOT ab_screen_painter THEN
		ls_lookup_code = ids_screen_fields.GetItemString( i, "lookup_code" )
		ls_lookup_field = ids_screen_fields.GetItemString( i, "lookup_field_name" )
		ls_lookup_type = ids_screen_fields.GetItemString( i, "lookup_type" )
		adw_detail.Modify( ls_dw_field_names[i] + ".dddw.VscrollBar = Yes")
		adw_detail.Modify( ls_dw_field_names[i] + ".dddw.AutoHScroll = Yes")
		adw_detail.Modify( ls_dw_field_names[i] + ".dddw.useasborder = Yes")			
		adw_detail.Modify(ls_dw_field_names[i] + ".dddw.NilIsNull= Yes")
		//Start Code Change ---- 03.08.2006 #317 maha readded
		adw_detail.Modify(ls_dw_field_names[i] + ".dddw.Lines= 15")
		//End Code Change---03.08.2006
		IF ids_screen_fields.GetItemString(i, "required") = "Y" THEN
			adw_detail.Modify(ls_dw_field_names[i] + "_t.font.underline = '1'")
			adw_detail.Modify(ls_dw_field_names[i] + ".dddw.Required = Yes")
		END IF	
		IF ls_lookup_type = "C" THEN
			adw_detail.Modify( ls_dw_field_names[i] + ".dddw.name = 'd_dddw_code_lookup'")
			adw_detail.Modify( ls_dw_field_names[i] + ".dddw.datacolumn = 'lookup_code'")			
			

			
			IF Upper( ls_lookup_field ) = "CODE" THEN
				adw_detail.Modify( ls_dw_field_names[i] + ".dddw.displaycolumn = 'code'")

			ELSE
				//--------------------------- APPEON BEGIN ---------------------------
				//$<Modify> 2007-07-12 By: Scofield
				//$<Reason> Change 'description' to ls_lookup_field
				
				//adw_detail.Modify( ls_dw_field_names[i] + ".dddw.displaycolumn = 'description'")
				adw_detail.Modify( ls_dw_field_names[i] + ".dddw.displaycolumn = '"+ls_lookup_field+"'")

				//---------------------------- APPEON END ----------------------------
			END IF
		ELSEIF ls_lookup_type = "A" THEN
			adw_detail.Modify( ls_dw_field_names[i] + ".dddw.HscrollBar = Yes")			
			adw_detail.Modify( ls_dw_field_names[i] + ".dddw.name = 'd_dddw_address_lookup'")
			adw_detail.Modify( ls_dw_field_names[i] + ".dddw.datacolumn = 'lookup_code'")		


			
			IF Upper( ls_lookup_field ) = "CODE" THEN
				adw_detail.Modify( ls_dw_field_names[i] + ".dddw.displaycolumn = 'code'")

			ELSE
				//--------------------------- APPEON BEGIN ---------------------------
				//$<modify> 2007.08.11 By: Jack
				//$<reason> Fix a defect.	
				
				/*
				//--------------------------- APPEON BEGIN ---------------------------
				//$<modify> 09.07.2006 By: Liang QingShi
				//$<reason> Fix a defect.
				/*
				adw_detail.Modify( ls_dw_field_names[i] + ".dddw.displaycolumn = 'entity_name'")			
				IF ib_create_browse = True THEN								
					adw_browse.Modify( ls_dw_field_names[i] + ".dddw.displaycolumn = 'entity_name'")						
				END IF
				*/
				
				IF appeongetclienttype() = 'PB' THEN
					adw_detail.Modify( ls_dw_field_names[i] + ".dddw.displaycolumn = 'entity_name'")			
					IF ib_create_browse = True THEN								
						adw_browse.Modify( ls_dw_field_names[i] + ".dddw.displaycolumn = 'entity_name'")						
					END IF
				ELSE
					adw_detail.Modify( ls_dw_field_names[i] + ".dddw.displaycolumn = 'entity_name_original'")			
					IF ib_create_browse = True THEN								
						adw_browse.Modify( ls_dw_field_names[i] + ".dddw.displaycolumn = 'entity_name_original'")						
					END IF
				END IF
				//---------------------------- APPEON END ----------------------------
				*/
				
				adw_detail.Modify( ls_dw_field_names[i] + ".dddw.displaycolumn = 'entity_name'")			
//				IF ib_create_browse = True THEN								
//					adw_browse.Modify( ls_dw_field_names[i] + ".dddw.displaycolumn = 'entity_name'")						
//				END IF
				
				//---------------------------- APPEON END ----------------------------
			END IF
		ELSEIF ls_lookup_type = "Q" THEN
			adw_detail.Modify( ls_dw_field_names[i] + ".dddw.name = 'd_dddw_quest_lookup'")
			adw_detail.Modify( ls_dw_field_names[i] + ".dddw.datacolumn = 'quest_id'")	
			adw_detail.Modify( ls_dw_field_names[i] + ".dddw.displaycolumn = 'short_quest'")
			adw_detail.Modify( ls_dw_field_names[i] + ".dddw.useasborder = No")
			adw_detail.Modify( ls_dw_field_names[i] + ".dddw.vscrollbar = Yes")

		END IF
	
		//adw_detail.Modify( ls_dw_field_names[i] + ".dddw.AllowEdit = Yes")
		adw_detail.Modify( ls_dw_field_names[i] + ".dddw.VScrollBar = Yes")
		//adw_detail.Modify( ls_dw_field_names[i] + ".dddw.HScrollBar = Yes")
		adw_detail.Modify( ls_dw_field_names[i] + ".dddw.PercentWidth = '" + ls_dddw_width[i] + "'")
		adw_detail.GetChild( ls_dw_field_names[i] , dwchild )




		res = of_dwchild_retrieve(ls_lookup_code,ls_lookup_type,adw_detail,"CREATE",0,ls_dw_field_names[i]) //maha app081705
		if res < 0 then messagebox("","dwchild retrieve failed")
//		dwchild.ShareData( dwchild_browse )
//End Code Change---12.15.2005
	ELSEIF ls_dw_field_names[i] <> "active_status" THEN
		adw_detail.Modify(ls_dw_field_names[i] + ".Edit.NilIsNull= Yes")
		IF ids_screen_fields.GetItemString(i, "required") = "Y" THEN
			adw_detail.Modify(ls_dw_field_names[i] + "_t.font.underline = '1'")			
			adw_detail.Modify(ls_dw_field_names[i] + ".Edit.Required = Yes")
		END IF	
		IF ls_mask[i] <> "" THEN
			adw_detail.Modify( ls_dw_field_names[i] + ".Edit.CodeTable = Yes")
			adw_detail.Modify( ls_dw_field_names[i] + ".Edit.ValidateCode = Yes" )
			//adw_detail.Modify( ls_dw_field_names[i] + ".ValidationMsg = 'Invalid Month, Select a number from 1 and 12.'" )
			//adw_detail.Modify( ls_dw_field_names[i] + ".EditMask.Mask='" + ls_mask[i] + "'")
			IF ls_mask[i] = "##" THEN
				FOR m = 1 TO 12
					ls_month = String(m)
					adw_detail.SetValue( ls_dw_field_names[i], m, ls_month + "~t" + ls_month )
					adw_detail.Modify( ls_dw_field_names[i] + ".ValidationMsg = 'Invalid Month, Select a number from 1 and 12.'" )//maha moved 092605
				END FOR
				m1 = 0
				FOR m = 13 TO 21
					m1++
					ls_month = "0" + String(m1)
					adw_detail.SetValue( ls_dw_field_names[i], m, ls_month + "~t" + ls_month )
				END FOR
				adw_detail.Modify( ls_dw_field_names[i] + ".Edit.Limit = '2'" )			
				
			ELSEIF ls_mask[i] = "(###)###-####" THEN
				//adw_detail.Modify( ls_dw_field_names[i] + ".EditMask.Mask='(###)###-####'" )	//Comment by Scofield on 2008-08-12
			ELSEIF ls_mask[i] = "###-##-####" THEN
				adw_detail.Modify( ls_dw_field_names[i] + ".EditMask.Mask='###-##-####'")		
			ELSEIF ls_mask[i] = "#####-####" THEN
				adw_detail.Modify( ls_dw_field_names[i] + ".EditMask.Mask='#####-####'" )				
			ELSEIF ls_mask[i] = "####" THEN
				li_index = 0
				FOR m = 1880 TO 2050
					li_index++
					adw_detail.SetValue( ls_dw_field_names[i], li_index, String(m) + "~t" + String(m) )
				END FOR
				adw_detail.Modify( ls_dw_field_names[i] + ".Edit.Limit = '4'" )			
				adw_detail.Modify( ls_dw_field_names[i] + ".ValidationMsg = 'Invalid Year, Select a number between 1880 and 2050.'" )
			ELSEIF ls_mask[i] = "mm/dd/yyyy" THEN
				//adw_detail.Modify( ls_dw_field_names[i] + ".EditMask.Mask ='mm/dd/yyyy'")
				adw_detail.Modify( ls_dw_field_names[i] + ".Format='mm/dd/yyyy'")
			//	adw_detail.Modify( ls_dw_field_names[i] + ".ValidationMsg = 'Invalid Date, Please reenter.'" ) //maha 092605
//				IF ib_create_browse = True THEN				
//					adw_browse.Modify( ls_dw_field_names[i] + ".Format='mm/dd/yyyy'")
//				END IF
			ELSEIF ls_mask[i] = "#,##0.00" THEN
				adw_detail.Modify( ls_dw_field_names[i] + ".Format='#,##0'")
//				IF ib_create_browse = True THEN								
//					adw_browse.Modify( ls_dw_field_names[i] + ".Format='#,##0'")
//				END IF
			END IF
		END IF	
	END IF
END FOR

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-34
//$<add> 01.25.2006 By: Cao YongWang
//$<reason> Performance tuning
//$<modification> Add Appeon Commit label.

gnv_appeondb.of_commitqueue()
//If appeongetclienttype() <> 'PB' Then of_dwchild_after_retrieve(adw_detail)
//---------------------------- APPEON END ----------------------------


//reset all browse fields //maha 051005
integer cc
cc = upperbound( ls_dw_field_names)//integer(adw_browse.Object.DataWindow.Column.Count)
wer = ids_screen_fields.rowcount()
// messagebox("li_row_cnt",li_row_cnt)
 // messagebox("cols",cc)
  // messagebox("fields",wer)
//if  ib_create_browse = True then
//	for i = 1 to li_row_cnt//ids_screen_fields.rowcount()
//		adw_browse.Modify( ls_field_names[i] + ".TabSequence = '0'" )
//	next
//end if

//clipboard(adw_detail.Describe("datawindow.syntax"))
FOR i = 1 TO li_key_cnt
	adw_detail.Modify( ls_key_fields_col_nm[i] + ".visible = '0'")
	adw_detail.Modify( ls_key_fields_col_nm[i] + "_t.visible = '0'")
//	IF ib_create_browse = True THEN					
//		adw_browse.Modify( ls_key_fields_col_nm[i] + ".visible = '0'")
//		adw_browse.Modify( ls_key_fields_col_nm[i] + "_t.visible = '0'")
//	END IF
END FOR

//IF NOT ab_screen_painter THEN
//	adw_detail.iuo_calendar.of_Register(adw_detail.iuo_calendar.DDLB)		
//	adw_detail.of_SetReqColumn(TRUE)
//END IF

//ls_detail_band_height = String(Integer(adw_detail.Object.DataWindow.Detail.Height) - 200)

//messagebox("ls_detail_band_height",ls_detail_band_height)

//adw_detail.SetRedraw(True)

adw_detail.Modify("create groupbox(band=detail text='End of Detail border='5' color='255' x='1' y='" + ls_detail_band_height + "' height='50' width='3000'  font.face='MS Sans Serif' font.height='-8' font.weight='400'  font.family='2' font.pitch='2' font.charset='0' background.mode='1' background.color='553648127' name=detail_band)"  )


//CREATE ANY SCREEN OBJECTS THAT WERE ADDED
FOR i = 1 TO li_obj_cnt
	if ids_screen_objects.GetItemnumber(i, "object_underline") = 1 then //maha 082305 for use in modify below for underline
		li_uls = 1
	else 
		li_uls = 0
	end if
	ls_obj_type = ids_screen_objects.GetItemString(i, "object_type") 
	ls_obj_name = "object"+String( ids_screen_objects.GetItemNumber(i, "data_view_object_id") )
	ls_width = String( ids_screen_objects.GetItemNumber(i, "object_width") )
	ls_height = String( ids_screen_objects.GetItemNumber(i, "object_height") )
	ls_x = String( ids_screen_objects.GetItemNumber(i, "object_x") )
	ls_y = String( ids_screen_objects.GetItemNumber(i, "object_y") )
	ls_text = ids_screen_objects.GetItemString(i, "object_text") 
	ls_justification = String( ids_screen_objects.GetItemNumber(i, "object_alignment") )
	if long(ls_y) + long(ls_height) > ll_max_height then ll_max_height = long(ls_y) + long(ls_height)  //maha 051205
	//--------------------------- APPEON BEGIN ---------------------------
	//$<add> 2006-08-31 By: Liu HongXin
	//$<reason> Fix defect: display the bold and italic of stand-alone text
	ls_Bold		= String(ids_screen_objects.GetItemNumber(i, "object_bold") )
	ls_italic	= String(ids_screen_objects.GetItemNumber(i, "object_italic") )
	if IsNull(ls_Bold) then ls_Bold = "400"
	if IsNull(ls_italic) then ls_italic = "0"
	//---------------------------- APPEON END ----------------------------

	CHOOSE CASE ls_obj_type
		CASE "B"
			adw_detail.Modify("create groupbox(band=detail text='" + ls_text + "' border='5' color='128' x='" + ls_x + "' y='" + ls_y + "' height='" + ls_height + "' width='" + ls_width + "'  font.face='MS Sans Serif' font.height='-8' font.weight='400'  font.family='2' font.pitch='2' font.charset='0' background.mode='1' background.color='553648127' name=" + ls_obj_name + ")" )
		CASE "T"  //maha 051809 ######
			if ab_screen_painter then
				ls_color = "128"
			else
				ls_color = "0"
			end if
			//--------------------------- APPEON BEGIN ---------------------------
			//$<modify> 2006-08-31 By: Liu HongXin
			//$<reason> 
			/*
			adw_detail.Modify("create text(band=detail text='" + ls_text + "' border='0' color='" + ls_color + "' x='" + ls_x + "' y='" + ls_y + "' height='" + ls_height + "' width='" + ls_width + "'  font.face='MS Sans Serif' font.height='-8' font.weight='400'  font.family='2' font.pitch='2' font.underline='" + string(li_uls) + "' font.charset='0' background.mode='1' background.color='553648127' name=" + ls_obj_name +")" )
			*/
			adw_detail.Modify("create text(band=detail text='" + ls_text + "' border='0' color='" + ls_color + "' x='" + ls_x + "' y='" + ls_y + "' height='" + ls_height + "' width='" + ls_width + "'  font.face='MS Sans Serif' font.height='-8' font.family='2' font.pitch='2' font.underline='" + string(li_uls) + "' font.weight='" + ls_bold + "' font.italic='" + ls_italic + "' font.charset='0' background.mode='1' background.color='553648127' name=" + ls_obj_name + ")" )
			//---------------------------- APPEON END ----------------------------

	END CHOOSE
END FOR
//Start Code Change ---- 01.18.2006 #203 maha
IF ls_table_name = "pd_address" or ls_table_name = "dba.pd_address" THEN //maha 011806
	//adw_detail.Modify("create button(band=detail text='Address Links...' filename=''action='0' border='1' color='128' x='1822' y='110' height='104' width='500' vtextalign='0' htextalign='0'  font.face='MS Sans Serif' font.height='-8' font.weight='700'  font.family='2' font.pitch='2' font.charset='0' background.mode='2' background.color='12632256' name = linkbutton)")
	
	//address drop down
	
	adw_detail.Modify("create button(band=detail text='Find' filename=''action='0' border='1' color='128' x='1822' y='285' height='85' width='200' vtextalign='0' htextalign='0'  font.face='MS Sans Serif' font.height='-8' font.weight='700'  font.family='2' font.pitch='2' font.charset='0' background.mode='2' background.color='12632256' name = findbutton)")
	
//	integer set1
//	select set_1
//	into :set1
//	from icred_settings;
	set1 = of_get_app_setting("set_1","I")

	if set1 = 1 then //maha 072301 create populate button only if using addresses for find
		adw_detail.Modify("create button(band=detail text='Populate' filename=''action='0' border='1' color='128' x='2010' y='285' height='85' width='280' vtextalign='0' htextalign='0'  font.face='MS Sans Serif' font.height='-8' font.weight='700'  font.family='2' font.pitch='2' font.charset='0' background.mode='2' background.color='12632256' name = populatebutton)")		
		adw_detail.Modify( "street.dddw.VscrollBar = Yes")			
		adw_detail.Modify( "street.dddw.useasborder = Yes")			
		adw_detail.Modify( "street.dddw.AllowEdit = Yes")			
		adw_detail.Modify( "street.dddw.NilIsNull= Yes")
		//adw_detail.Modify( "street.dddw.Lines= 15")
		adw_detail.Modify( "street.dddw.PercentWidth = '200'")	
		adw_detail.Modify( "street.dddw.name = 'd_dddw_addresses'")
		adw_detail.Modify( "street.dddw.datacolumn = 'rec_id'")			
		adw_detail.Modify( "street.dddw.displaycolumn = 'street'")	
	end if
	
	//add drop down for billing address
	ls_retval = adw_detail.Modify( "billing_address_id.dddw.VscrollBar = Yes")			
	adw_detail.Modify( "billing_address_id.dddw.useasborder = Yes")			
	adw_detail.Modify( "billing_address_id.dddw.NilIsNull= Yes")
	//adw_detail.Modify( "billing_address_id.dddw.Lines= 15")
	adw_detail.Modify( "billing_address_id_t.font.underline = '1'")
	adw_detail.Modify( "billing_address_id.dddw.Required = No")
	adw_detail.Modify( "billing_address_id.dddw.name = 'd_dddw_billing_addresses'")
	adw_detail.Modify( "billing_address_id.dddw.datacolumn = 'pd_address_rec_id'")			
	adw_detail.Modify( "billing_address_id.dddw.displaycolumn = 'address'")								
	res  = adw_detail.GetChild( "billing_address_id", dwchild )
	if res = 1 then
		IF Len( ls_retval ) = 0 THEN
			dwchild.SetTransObject( SQLCA )
			dwchild.Retrieve( al_prac_id )
		END IF
//		des = dwchild.Describe("DataWindow.Objects")
//			openwithparm(w_sql_msg,des)
		dwchild.InsertRow( 1 )
		dwchild.SetItem( 1, "pd_address_street", "N/A" )	
		dwchild.SetItem( 1, "pd_address_city", "" )
		dwchild.SetItem( 1, "code_lookup_code", "" )
		dwchild.SetItem( 1, "pd_address_rec_id", -1 )	
		dwchild.InsertRow( 1 )
		dwchild.SetItem( 1, "pd_address_street", "Same" )	
		dwchild.SetItem( 1, "pd_address_city", "" )
		dwchild.SetItem( 1, "code_lookup_code", "" )
		dwchild.SetItem( 1, "pd_address_rec_id", 0 )
		dwchild.InsertRow( 1 )
		dwchild.SetItem( 1, "pd_address_street", "" )	
		dwchild.SetItem( 1, "pd_address_city", "" )
		dwchild.SetItem( 1, "code_lookup_code", "" )
	end if
	
END IF

IF ls_table_name = "pd_references" or ls_table_name = "dba.pd_references" THEN //maha 011806
//End Code Change---01.18.2005 
	li_set = of_get_app_setting("set_5","I")
	if li_set = 0 then
		//messagebox("","ref button")
		adw_detail.Modify("create button(band=detail text='Select Peer' filename=''action='0' border='1' color='128' x='1102' y='1285' height='85' width='400' vtextalign='0' htextalign='0'  font.face='MS Sans Serif' font.height='-8' font.weight='700'  font.family='2' font.pitch='2' font.charset='0' background.mode='2' background.color='12632256' name = peerbutton)")
		if ll_max_height < 1400 then ll_max_height = 1400 //maha 060805 button was disappearing
	end if
end if
//\maha

IF li_prac_row_cnt = 0 THEN 
//	If not ab_screen_painter Then of_set_defaults( adw_detail, 1 )
	adw_detail.SetItemStatus( 1, 0, Primary!, NotModified! )
END IF

IF ab_screen_painter THEN //maha 051305 ####
	adw_detail.Object.DataWindow.Detail.Height= 20000
else
	choose case ai_screen_id  
		case  - 20
			ll_max_height = 1480
		case else
			ll_max_height = ll_max_height + 20 
	end choose
	adw_detail.Object.DataWindow.Detail.Height= ll_max_height
end if
//adw_detail.Object.DataWindow.Detail.Height.AutoSize  //maha 092702 playing with size
//ls_detail_band_height = String(Integer(adw_detail.Object.DataWindow.Detail.Height))
//messagebox("ls_detail_band_height",ll_max_height)

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-35
//$<add> 03.13.2006 By: Cao YongWang
//$<reason> Performance tuning. 
//<modification> Save the datawindow syntax in the SDR files on local machine.
//of_save_create_syntax(ai_data_view_id,ai_screen_id,adw_detail,'Y',string(idt_screen_cache),'D',ab_screen_painter)
//of_save_create_syntax(ai_data_view_id,ai_screen_id,adw_browse,'N',string(idt_screen_cache),'D',ab_screen_painter)
//---------------------------- APPEON END ----------------------------
//if ab_screen_painter = true then adw_detail.hscrollbar = true


RETURN ls_return_syntax
end function

public function integer of_app_audit_date_reset (long ai_app_stat_recid, long ai_prac);////Start Code Change ----03.20.2008 #V8 maha - created to reset App audit complete date when missinng items are added.
//of_app_audit_date_reset(ll_appt_stat_id,il_prac_id)
update pd_affil_stat set date_app_audit_completed = null where rec_id = :ai_app_stat_recid;
commit using sqlca;

return 1

end function

public function integer of_detail_preupdate (u_dw adw_detail);//Start Code Change ----08.04.2008 #V85 maha - this function added to this object to be called from 
//prac folder DE; action items, batch add insurance
//not completed

String ls_screen_name
String ls_ref_1
String ls_val
String ls_ref_2
String ls_ref_3
String ls_exp_field
String ls_reference
String ls_rec_status
DateTime ldt_exp_date
DateTime ldt_null_date
Long ll_rec_id
Long ll_address_code
long ll_appt_stat_recid  //#1 maha 101606
long ll_templ_id[ ]  //#1 maha 101606
long ll_verif_response  //#1 maha 101606  completion response code for verif; if 0 will not be completed.
long li_seq_no
Integer li_table_id
Integer li_facility_specific
Integer li_screen_id
Integer li_current_row
Integer i
Integer li_cnt
Integer li_rec_count
long li_found
Integer li_data_cr
Integer li_verif_rc
Integer li_retval
integer li_year //maha031601
integer li_month//maha031601
integer li_validate//maha080803
integer li_res //maha 032406
integer li_complete[ ] //#1 maha 101606
integer li_auto_gen[ ] //#1 maha 101606
integer li_app_audit_facil //#1 maha 101606
integer li_appt_stat //#1 maha 101606
integer li_temp_cnt //#1 maha 101606
integer li_status = 1 //maha 080108
string ls_use_as_ver //#1 maha 101606
integer t  //#1 maha 101606
string ls_app_type //#1 maha 101606
string ls_mess //#1 maha 101706
string ls_type1//maha102501
string ls_type2//maha102501
string ls_type3//maha102501
DataWindowChild dwchild
n_ds lds_aa_template //#1 maha 101606
Long ll_new_cnt //Added By Ken.Guo 03.31.2008
Long ll_rec_id_new //Added By Ken.Guo 05.29.2008. Replace il_rec_id
n_ds ids_parent_facilities

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 2006-10-11 By: Rodger Wu (Inova)
//$<reason> Define several variable for checking if value in exp_field changed.

DateTime ldt_exp_date_original
Long ll_rec_id_changed[]

//---------------------------- APPEON END ----------------------------

//SetNull( ldt_null_date )
//
//adw_detail.AcceptText()
//
//li_rec_count = adw_detail.RowCount()
//
////IF li_rec_count < 1 THEN
////	IF ib_deleting THEN
////		RETURN 1
////	ELSE
////		RETURN -1
////	END IF
////END IF
//
////SetRedraw( False )
//
//
////il_last_de_row = adw_detail.GetRow()
//
//li_data_cr = adw_detail.GetRow()
//
////ls_ref_1 = dw_select_section.GetItemString( il_last_row, "ref_field_1")
////ls_ref_2 = dw_select_section.GetItemString( il_last_row, "ref_field_2")
////ls_ref_3 = dw_select_section.GetItemString( il_last_row, "ref_field_3")
//
////ls_type1 = dw_select_section.GetItemString( il_last_row, "ref_1_type")//maha102501
////ls_type2 = dw_select_section.GetItemString( il_last_row, "ref_2_type")//maha102501
////ls_type3 = dw_select_section.GetItemString( il_last_row, "ref_3_type")//maha102501
//
////ls_exp_field = dw_select_section.GetItemString( il_last_row, "exp_field")
////
////li_screen_id = dw_select_section.GetItemNumber( il_last_row, "screen_id")
////ls_screen_name = dw_select_section.GetItemString( il_last_row, "screen_name")
////
////li_table_id = dw_select_section.GetItemNumber( dw_select_section.GetRow(), "table_id" )
//
////--------------------------- APPEON BEGIN ---------------------------
////$<ID> PT-23
////$<modify> 03.01.2006 By: LeiWei
////$<reason> Performance tuning
////$<modification> Write script to retrieve data from a cache instead of from the database.
///*
//select count(field_id) into :li_validate from sys_fields where table_id = :li_table_id and use_validation > 0; //maha 072304 see if ay fields need validation 
//*/
//li_validate  = Long(gnv_data.of_getitem( "sys_fields", "field_id", "table_id = "+String(li_table_id)+" and use_validation > 0"))
////---------------------------- APPEON END ----------------------------
//
////li_validate = dw_select_section.GetItemnumber( il_last_row, "sys_fields_use_validation")
//
//
////select set_31 into :li_validate from icred_settings; maha changed use of variable in v4.5 072304
//
//
//
////--------------------------- APPEON BEGIN ---------------------------
////$<ID> PT-30
////$<add> 03.16.2006 By: Liang QingShi
////$<reason> Performance tuning
////$<modification> Define a variable to 1)get the first ID; 2)Update the final ID
////$<modification> value into database.
//ll_new_cnt = 0
//FOR i = 1 TO li_rec_count
//	IF adw_detail.GetItemStatus( i, 0, Primary!)  = NewModified! THEN
//		ll_new_cnt++
//	End IF
//END FOR
//If ll_new_cnt > 0 Then
//	ll_rec_id_new = gnv_app.of_Get_Id("RECORD_ID" , ll_new_cnt) - 1
//	If ll_rec_id_new < 0 Then //Added By Ken.Guo 04.24.2008.
//		Messagebox('Error','Failed to get Record_ID value, Please call support.')
////		SetRedraw( True ) 
//		Return -1
//	End If
//End If
////---------------------------- APPEON END ----------------------------
////--------------------------- APPEON BEGIN ---------------------------
////$<ID> PT-25
////$<add> 2006-04-11 By: owen chen
////$<reason> Performance tuning modification
////$<modification> Use ids_parent_facilities to retrive all data
////$<modification> to be used by pfc_cst_u_data_entry. 
// 
//ids_parent_facilities = CREATE n_ds
//ids_parent_facilities.DataObject = "d_address_link_parent_facility_id"
//ids_parent_facilities.of_SetTransObject( SQLCA )
//ids_parent_facilities.Retrieve( il_prac_id )
//
////---------------------------- APPEON END ----------------------------
////@@@@@@@@
////Start Code Change ---- 10.25.2006 #1 maha  getting values for app audit creation
//ids_parent_facilities.setfilter("parent_facility_id = " + string(ii_parent_facility_id) + " and active_status in (1,4)")
//ids_parent_facilities.filter()
//li_app_audit_facil =  ids_parent_facilities.rowcount()
////select count(rec_id) into :li_app_audit_facil from pd_affil_stat where prac_id = :il_prac_id and parent_facility_id = :ii_parent_facility_id and active_status in (1,4);
//if li_app_audit_facil > 1 then
//	li_app_audit_facil = -1 //trap if there is improper data
//elseif li_app_audit_facil = 1 then //normally should be one
//	//get the template items for the screen
//	lds_aa_template = CREATE n_ds
//	lds_aa_template.DataObject = "d_app_audit_by_facility_screen"
//	lds_aa_template.of_SetTransObject( SQLCA )
//	ls_app_type = ids_parent_facilities.getitemstring(1,"apptmnt_type")
//	li_app_audit_facil = ids_parent_facilities.getitemnumber(1,"application_audit_facility")
//	ll_appt_stat_recid = ids_parent_facilities.getitemnumber(1,"rec_id")
//	li_temp_cnt = lds_aa_template.Retrieve(li_app_audit_facil ,ii_screen_id,ls_app_type)
//	if li_temp_cnt < 1 then
//		li_auto_gen[i] = 0
//		li_complete[i] = 0
//		ls_use_as_ver = "N"
//		ll_verif_response = 0
//	else //WHAT ABOUT MULTIPLES?
//		for i = 1 to li_temp_cnt  //get each auto gen item
//			ll_templ_id[i] = lds_aa_template.getitemnumber(i,"app_audit_id")
//			li_auto_gen[i] = lds_aa_template.getitemnumber(i,"auto_generate")
//			if isnull(li_auto_gen[i]) then li_auto_gen[i] = 0
//			li_complete[i] = lds_aa_template.getitemnumber(i,"receive_from_de")
//			if isnull(li_complete[i]) then li_complete[i] = 0
//			if ls_use_as_ver <> "Y" then //if not already set to use as verification
//				ls_use_as_ver = lds_aa_template.getitemstring(i,"use_as_verification")
//				if isnull(ls_use_as_ver) then ls_use_as_ver = "N"
//			end if
//			if ll_verif_response = 0 or isnull(ll_verif_response) then //get response code if not set
//				ll_verif_response = lds_aa_template.getitemnumber(i,"default_ver_response_code")
//				if isnull(ll_verif_response) then ll_verif_response = 0
//			end if
//		next
//		if ls_use_as_ver = "Y" then
//			ls_mess = "Y"
//		else
//			ls_mess = "N"
//		end if
//		ls_mess = ls_mess +  "*" +string(ll_verif_response )
//	end if
//end if
////w_app_audit_complete_mes
//ids_parent_facilities.setfilter("") //reset the filter
//ids_parent_facilities.filter()
////@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
////End Code Change---10.25.2006
//
//FOR i = 1 TO li_rec_count
//	//debugbreak()			
//	SetNull( ll_address_code )
//	IF adw_detail.GetItemStatus( i, 0, Primary!) <> NewModified! AND +&
//		adw_detail.GetItemStatus( i, 0, Primary!) <> DataModified! THEN
//		CONTINUE
//	ELSEIF adw_detail.GetItemStatus( i, 0, Primary!)  = NewModified! THEN
//		ls_rec_status = "New"
//		//messagebox("", "dw_detail1")
//		//if li_validate > 0 then //if one or more fields uses validation  //Start Code Change ---- 10.02.2006 #634 maha  removed
////			if of_validate(li_table_id,i) < 0 then  //Start Code Change ----06.16.2008 #V81 maha - moved to pfc_validation
////				SetRedraw( True )
////				RETURN -1
////			end if
//		//end if
//		ll_rec_id_new ++
//
//		adw_detail.SetItem( i, "prac_id", il_prac_id)
//		IF li_screen_id = 61 or li_screen_id = 32 or li_screen_id = 33 THEN		
//			SELECT pd_affil_stat.rec_id  
//    		INTO :ll_rec_id_new  
//    		FROM pd_affil_stat  
//   		WHERE ( pd_affil_stat.prac_id = :il_prac_id ) AND  
//         		( pd_affil_stat.parent_facility_id = :ii_parent_facility_id ) AND  
//         		( pd_affil_stat.active_status in (1,4) )   ;  //maha  changed to include pending 072402
//			IF SQLCA.SQLCODE = -1 THEN
//				MessageBox("SQL Error 1", SQLCA.SQLERRTEXT )
//				Return -1
//			END IF
//			//--------------------------- APPEON BEGIN ---------------------------
//			//$<modify> 05/05/2008 By: Ken.Guo
//			//$<reason> Fix BugK050504.Duplicate PK when save staff category data.
//			//li_seq_no = inv_data_entry.of_get_next_seq_no( "department", il_rec_id )
//			Choose Case li_screen_id
//				Case	32 //Depart/Div/Section
//					li_seq_no = of_get_next_seq_no( "department", ll_rec_id_new )
//				Case	33 //Staff Category
//					li_seq_no = of_get_next_seq_no( "staff cat", ll_rec_id_new )
//				Case	61 //No this screen id in DB???
//					li_seq_no = of_get_next_seq_no( "department", ll_rec_id_new )
//			End Choose
//			//---------------------------- APPEON END ----------------------------
//
//			li_seq_no++
//			adw_detail.SetItem( i, "seq_no", li_seq_no )				
//			adw_detail.SetItem( i, "rec_id", ll_rec_id_new )			
//		ELSE
//			adw_detail.SetItem( i, "rec_id", ll_rec_id_new )			
//		END IF
//		IF li_screen_id = 2 then //Upper(ls_screen_name) = "ADDRESS" THEN
////			of_add_address_link( ll_rec_id_new )
//		elseIF ii_screen_id = 10 THEN		// "HOSPITAL AFFILIATION"
////			of_add_hosp_link( ll_rec_id_new )
//		elseIF ii_screen_id = 19 THEN			//"BOARD/SPECIALTY"
////			of_add_spec_link( ll_rec_id_new )
//		END IF
//		
//	ELSE
//		ls_rec_status = "Modified"
//		//if li_validate > 0 then //maha 080803 for LIJ
////			if of_validate(li_table_id,i) < 0 then //Start Code Change ---- 10.02.2006 #633 maha  removed
////				SetRedraw( True )
////				RETURN -1
////			end if
//		//end if
//	END IF
//	
//	ll_rec_id = adw_detail.GetItemNumber( i, "rec_id" )
//	
////	IF Upper(ls_screen_name) = "LICENSURE" OR +&
////		Upper(ls_screen_name) = "INSURANCE" OR +&
////		Upper(ls_screen_name) = "DEA REGISTRATION" THEN
//	IF ii_screen_id = 4 OR ii_screen_id = 15 OR ii_screen_id = 5 THEN
//		IF adw_detail.Describe( "active_status.dddw.name" ) = 'd_code_lookup_active_inactive' THEN
//			IF adw_detail.GetItemNumber( i, "active_status" ) = 0 THEN
//				if ls_rec_status = "New" then
//					CONTINUE
//				else				//\/maha 031601
//					update verif_info
//					set active_status = 0
//					where rec_id = :ll_rec_id and active_status = 1;
//					continue		 //\maha
//				end if
//			END IF
//		END IF
//	END IF	
//	
//	//\/maha 031601 get month and year end for check back date passed in verification add
//	IF li_screen_id  = 7 or li_screen_id = 10 THEN  // training & hosp affil
//		if adw_detail.Describe("year_thru.ColType") <> "!" then
//			li_year = adw_detail.getitemnumber(i,"year_thru")
//			if adw_detail.Describe("month_thru.ColType") <> "!" then
//				li_month = adw_detail.getitemnumber(i,"month_thru")
//			end if
//			//maha added to using full end date field
//		elseif adw_detail.Describe("end _date.ColType") <> "!" then
//			li_year = year(date(adw_detail.getitemdatetime(i,"end_date")))
//				li_month = month(date(adw_detail.getitemdatetime(i,"end_date")))
//		end if
//	end if
//	//\maha
//	
//	
//	//jad 05/30/01 added to make any screen facility specific
//
//
//	//--------------------------- APPEON BEGIN ---------------------------
//	//$<ID> PT-27
//	//$<modify> 03.01.2006 By: LeiWei
//	//$<reason> Performance tuning
//	//$<modification> Write script to retrieve data from a cache instead of from the database.
//
//	/*	
//	
//		SELECT sys_tables.facility_specific  
//		INTO :li_facility_specific  
//		FROM sys_tables  
//		WHERE sys_tables.table_id = :li_table_id   ;
//				
//		IF SQLCA.SQLCODE = -1 THEN
//			MessageBox("Error", SQLCA.SQLERRTEXT )
//		END IF
//	*/
//	li_facility_specific = Long(gnv_data.of_getitem( "sys_tables", "facility_specific", "table_id = "+String(li_table_id) ))
//	//---------------------------- APPEON END ----------------------------
//
//	IF li_screen_id = 19 THEN //specialty
//		IF IsNull( adw_detail.GetItemNumber( i, "board_code" ) ) THEN
//			CONTINUE
//		  //Start Code Change ---- 10.26.2007 #V7 maha	
//		ELSE
//			ll_address_code = adw_detail.GetItemNumber( i, "board_code" ) 
//			IF ls_rec_status = "Modified" THEN
//		//ELSEIF ls_rec_status = "Modified" THEN
//				SELECT count(*)  
//				INTO :li_cnt  
//						FROM verif_info  
//						WHERE ( verif_info.rec_id = :ll_rec_id ) AND  
//							( verif_info.active_status = 1 )   ;
//				IF IsNull( li_cnt ) OR li_cnt = 0 THEN
//					ls_rec_status = "New"
//				END IF
//			end if //modified
//			//End Code Change---10.26.2007
//		END IF
//	//jad 05/30/01 added to make any screen facility specific
//	ELSEIF li_facility_specific = 1 THEN //attest quest or group cov	
//	//ELSEIF li_screen_id = 21 OR li_screen_id = 26 THEN //attest quest or group cov
//	//ELSEIF li_screen_id = 21 OR li_screen_id = 26 THEN //attest quest or group cov
////		IF li_screen_id = 61 THEN //had been removed in version 3.75 but didn't make it to 4 removed again 061604 for v4.187 maha
////			adw_detail.SetItem( i, "facility_id", 1 )		
////		ELSE
//			if adw_detail.Describe("facility_id.ColType") <> "!" then  //Start Code Change ---- 01.25.07.2007 #V7 maha
//				adw_detail.SetItem( i, "facility_id", ii_parent_facility_id )	
//			end if	
////		END IF
//	END IF
//	IF NOT IsNull( ls_ref_1 ) AND ls_ref_1 <> "" THEN
//		adw_detail.ScrollToRow( i )
//		adw_detail.SetRow( i )
//
//		//move expiration date to verif info table if there is one
//		IF Len(ls_exp_field) > 0 THEN
//			IF ls_exp_field = "certification_expires" THEN	
//				//--------------------------- APPEON BEGIN ---------------------------
//				//$<modify> 05.25.2007 By: Jack
//				//$<reason> Fix a defect.
//				/*
//				ldt_exp_date = DateTime(Date( "12-30-" + String( adw_detail.GetItemNumber( i, ls_exp_field ) ) ),Now())//maha changed 080101
//				//--------------------------- APPEON BEGIN ---------------------------
//				//$<add> 2006-10-11 By: Rodger Wu (Inova)
//				//$<reason> Get Original value of exp_field.
//				ldt_exp_date_original = DateTime(Date( "12-30-" + String( adw_detail.GetItemNumber( i, ls_exp_field, Primary!, True ) ) ),Now())
//				//---------------------------- APPEON END ----------------------------
//				*/				
//				ldt_exp_date = DateTime(Date( String( adw_detail.GetItemNumber( i, ls_exp_field ) ) + "-12-30"),Now())
//				ldt_exp_date_original = DateTime(Date( String( adw_detail.GetItemNumber( i, ls_exp_field, Primary!, True ) ) + "-12-30"),Now())				
//				//---------------------------- APPEON END ----------------------------
//				//ldt_exp_date = DateTime(Date( "1-1-" + String( adw_detail.GetItemNumber( i, ls_exp_field ) ) ),Now())
//			ELSEIF ls_exp_field = "cert_expiration_year" THEN
//				li_month = adw_detail.GetItemNumber( i, "cert_expiration_month" )
//				if isnull(li_month) then
//					//--------------------------- APPEON BEGIN ---------------------------
//					//$<modify> 05.25.2007 By: Jack
//					//$<reason> Fix a defect.
//					/*
//					ldt_exp_date = DateTime(Date( "12-30-" + String( adw_detail.GetItemNumber( i, ls_exp_field ) ) ),Now())//maha 061402 fo spec. certs
//					//--------------------------- APPEON BEGIN ---------------------------
//					//$<add> 2006-10-11 By: Rodger Wu (Inova)
//					//$<reason> Get Original value of exp_field.
//					ldt_exp_date_original = DateTime(Date( "12-30-" + String( adw_detail.GetItemNumber( i, ls_exp_field, Primary!, True ) ) ),Now())
//					//---------------------------- APPEON END ----------------------------
//					*/
//					ldt_exp_date = DateTime(Date( String( adw_detail.GetItemNumber( i, ls_exp_field ) ) + "-12-30"),Now())
//					ldt_exp_date_original = DateTime(Date( String( adw_detail.GetItemNumber( i, ls_exp_field, Primary!, True ) ) + "-12-30"),Now())				
//					//---------------------------- APPEON END ----------------------------
//				else
//					//--------------------------- APPEON BEGIN ---------------------------
//					//$<modify> 05.25.2007 By: Jack
//					//$<reason> Fix a defect.
//					/*
//					ldt_exp_date = DateTime(Date(String(li_month) + "-28-" + String( adw_detail.GetItemNumber( i, ls_exp_field ) ) ),Now())
//
//					//--------------------------- APPEON BEGIN ---------------------------
//					//$<add> 2006-10-11 By: Rodger Wu (Inova)
//					//$<reason> Get Original value of exp_field.
//					ldt_exp_date_original = DateTime(Date(String(li_month) + "-28-" + String( adw_detail.GetItemNumber( i, ls_exp_field, Primary!, True ) ) ),Now())
//					//---------------------------- APPEON END ----------------------------
//					*/
//					ldt_exp_date = DateTime(Date(String( adw_detail.GetItemNumber( i, ls_exp_field ) ) + "-" + String(li_month) + "-28"),Now())
//					ldt_exp_date_original = DateTime(Date(String( adw_detail.GetItemNumber( i, ls_exp_field, Primary!, True ) ) + "-" + String(li_month) + "-28"),Now())
//					//---------------------------- APPEON END ----------------------------
//				end if
//			ELSE
//				//Start Code Change ---- 03.24.2006 #341 maha  trap for invisible field
//				if adw_detail.Describe(ls_exp_field + ".ColType") <> "!" then
//					ldt_exp_date = adw_detail.GetItemDateTime( i, ls_exp_field )
//
//					//--------------------------- APPEON BEGIN ---------------------------
//					//$<add> 2006-10-11 By: Rodger Wu (Inova)
//					//$<reason> Get Original value of exp_field.
//					ldt_exp_date_original = adw_detail.GetItemDateTime( i, ls_exp_field, Primary!, True )
//					//---------------------------- APPEON END ----------------------------
//				else
////					of_error_message( ls_exp_field, i,"Unable to update data","The " + upper(ls_exp_field) + " field is required by your system settings.~r~rYou will not be able to save data on this screen~runtil the field is made visible in the Screen Painter for the view you are using.")
//					return -1
//				end if
//			END IF
//		ELSE
//			ldt_exp_date = ldt_null_date
//
//			//--------------------------- APPEON BEGIN ---------------------------
//			//$<add> 2006-10-11 By: Rodger Wu (Inova)
//			//$<reason> Get Original value of exp_field.
//			SetNull( ldt_exp_date_original )
//			//---------------------------- APPEON END ----------------------------
//			
//		END IF
//	
//		//get reference 1 data 
//		
//		if adw_detail.Describe(ls_ref_1 + ".ColType") = "!"  or ls_ref_1 = "" then //trap for invisible field maha 012104 
//			messagebox("Problem getting reference 1 value for verification","Required Field " + ls_ref_1 + " is invisible.  The verification will not be created/updated.  Contact Customer support for assistance.")
//			return 1
//		end if
//		li_retval = adw_detail.SetColumn( ls_ref_1 )
//		IF li_retval = 1 THEN
////			IF IsNull( adw_detail.object. ) OR GetText() = "" THEN
////				SetRedraw( True )
////				//MessageBox( "Required", "The reference field " + ls_ref_1 + " is required." )
////				of_error_message(ls_ref_1,i,"Required", "The data field " + ls_ref_1 + " is required.")
////				Return -1
////			END IF
//			li_retval = adw_detail.GetChild(ls_ref_1, dwchild)
//			IF li_retval = -1 THEN
//				ls_reference =  adw_detail.GetText()				
//			ELSE
//				adw_detail.SetColumn( ls_ref_1 )
//				li_found = dwchild.Find( "lookup_code = " + adw_detail.GetText(), 1, 100000 )	
//				//messagebox("li_found",li_found)
//				IF adw_detail.Describe( ls_ref_1 + ".dddw.displaycolumn") = "code" THEN
//					ls_reference = dwchild.GetItemString( li_found, "code" )
//
//					//IF ls_screen_name = "Licensure" THEN
//					IF ii_screen_id = 4 THEN					
//						if adw_detail.Describe("verifying_agency.ColType") = "!" then //trap for invisible field maha 040403 
//	//						of_error_message("VERIFYING_AGENCY",i,"Screen Setup Error"," The verifying_agency field is a required field, and must be visible to enter Licence data.  Please set up in the screen painter.")
//							//messagebox("Screen Setup Error"," The verifying_agency field is a required field, and must be visible to enter Licence data.  Please set up in the screen painter")
//							return -1
//						else
//							ll_address_code = adw_detail.GetItemNumber( i, "verifying_agency" )
//						end if
//					ELSEIF li_screen_id = 19 THEN  //Start Code Change ---- 10.26.2007 #V7 maha
//						//do nothing, got the address code further up
//					ELSE
//						if ls_type1 = "C" then //maha 050802 
//							ll_address_code = long(adw_detail.GetItemstring( i, ls_ref_1 ))//maha 072501
//						elseif ls_type1 = "N" then //maha 050802
//							ll_address_code = adw_detail.GetItemNumber( i, ls_ref_1 )
//						end if
//					END IF
//				//--------------------------- APPEON BEGIN ---------------------------
//				//$<modify> 03/16/2007 By: Jervis
//				//$<reason> PB:entity_name,APB WEB:entity_name_original ,
//				//				pfc_cst_nv_data_entry_functions.of_create_dynamic_dw line 840 modified by Liang QingShi,i don't know why.
//				/*
//				ELSEIF adw_detail.Describe( ls_ref_1 + ".dddw.displaycolumn") = "entity_name" THEN
//				*/
//				//---------------------------- APPEON END ----------------------------
//				ELSEIF adw_detail.Describe( ls_ref_1 + ".dddw.displaycolumn") = "entity_name" or adw_detail.Describe( ls_ref_1 + ".dddw.displaycolumn") = "entity_name_original" THEN
//					if adw_detail.Describe( ls_ref_1 + ".dddw.displaycolumn") = "entity_name_original" THEN
//						ls_reference = dwchild.GetItemString( li_found, "entity_name_original" )
//					else
//						ls_reference = dwchild.GetItemString( li_found, "entity_name" )
//					end if
//					if ls_type1 = "C" then //maha 102501 took out specific exceptions and tested field type
//						ll_address_code = long(adw_detail.GetItemstring( i, ls_ref_1 ))//maha 072501
//					elseif ls_type1 = "N" then //maha 102501
//						ll_address_code = adw_detail.GetItemNumber( i, ls_ref_1 )
//					end if
//				ELSEIF adw_detail.Describe( ls_ref_1 + ".dddw.displaycolumn") = "description" THEN //maha 110801
//					ls_reference = dwchild.GetItemString( li_found, "description" )
//					//Start Code Change ---- 10.10.2007 #V7 maha added same exception for verif ying agency as above
//					IF ii_screen_id = 4 THEN					
//						if adw_detail.Describe("verifying_agency.ColType") = "!" then //trap for invisible field maha 040403 
////							of_error_message("VERIFYING_AGENCY",i,"Screen Setup Error"," The verifying_agency field is a required field, and must be visible to enter Licence data.  Please set up in the screen painter.")
//							//messagebox("Screen Setup Error"," The verifying_agency field is a required field, and must be visible to enter Licence data.  Please set up in the screen painter")
//							return -1
//						else
//							ll_address_code = adw_detail.GetItemNumber( i, "verifying_agency" )
//						end if
//					ELSEIF li_screen_id = 19 THEN  //Start Code Change ---- 10.26.2007 #V7 maha
//						//do nothing, got the address code further up
//					ELSE
//						if ls_type1 = "C" then //maha 050802 
//							ll_address_code = long(adw_detail.GetItemstring( i, ls_ref_1 ))//maha 072501
//						elseif ls_type1 = "N" then //maha 050802
//							ll_address_code = adw_detail.GetItemNumber( i, ls_ref_1 )
//						end if
//					END IF
//					//End Code Change---10.10.2007
//				ELSE
//					ls_reference = adw_detail.GetText()			
//				END IF
//			END IF
//		ELSE
//			ls_reference = ""
//		END IF
//
//		//--------------------------- APPEON BEGIN ---------------------------
//		//$<add> 03.01.2006 By: LeiWei
//		//$<reason> Fix a defect.
//		If NOT Isnull(ls_ref_2) THEN
//		//---------------------------- APPEON END ----------------------------
//
//		//get reference 2 data
//		if adw_detail.Describe(ls_ref_2 + ".ColType") = "!" or ls_ref_2 = "" then //trap for invisible field maha 012104 
//			messagebox("Problem getting reference 2 value for verification","Required Field " + ls_ref_2 + " is invisible.  The verification will not be created/updated.  Contact Customer support for assistance.")
//			return 1
//		end if
//		li_retval = adw_detail.SetColumn( ls_ref_2 )
//		IF li_retval = 1 THEN
////			IF IsNull( GetText() ) OR GetText() = "" THEN
//	//			SetRedraw( True )
//		//		//MessageBox( "Required", "The reference field " + ls_ref_2 + " is required." )				
//			//	of_error_message(ls_ref_2,i,"Required", "The data field " + ls_ref_2 + " is required.")
////				Return -1
//				//End Code Change---03.24.2006
////			END IF		
//			li_retval = adw_detail.GetChild(ls_ref_2, dwchild)
//			IF li_retval = -1 THEN
//				ls_reference = ls_reference + " - " + adw_detail.GetText()				
//			ELSE
//				adw_detail.SetColumn( ls_ref_2 )
//				li_found = dwchild.Find( "lookup_code = " + adw_detail.GetText(), 1, 100000 )
//				if li_found > 0 then //trap added maha 021704
//					IF adw_detail.Describe( ls_ref_2 + ".dddw.displaycolumn") = "code" THEN
//						ls_reference = ls_reference + " - " + dwchild.GetItemString( li_found, "code" )
//					ELSEIF adw_detail.Describe( ls_ref_2 + ".dddw.displaycolumn") = "description" THEN
//						ls_reference = ls_reference + " - " + dwchild.GetItemString( li_found, "description" )					
//					//--------------------------- APPEON BEGIN ---------------------------
//					//$<modify> 03/16/2007 By: Jervis
//					//$<reason> PB:entity_name,APB WEB:entity_name_original ,
//					//				pfc_cst_nv_data_entry_functions.of_create_dynamic_dw line 840 modified by Liang QingShi,i don't know why.
//					/*
//					ELSEIF adw_detail.Describe( ls_ref_2 + ".dddw.displaycolumn") = "entity_name" THEN
//					*/
//					//---------------------------- APPEON END ----------------------------
//					ELSEIF adw_detail.Describe( ls_ref_2 + ".dddw.displaycolumn") = "entity_name" or adw_detail.Describe( ls_ref_2 + ".dddw.displaycolumn") = "entity_name_original" THEN
//						if adw_detail.Describe( ls_ref_2 + ".dddw.displaycolumn") = "entity_name_original" THEN
//							ls_reference = ls_reference + " - " + dwchild.GetItemString( li_found, "entity_name_original" )
//						else
//							ls_reference = ls_reference + " - " + dwchild.GetItemString( li_found, "entity_name" )
//						end if
//					ELSE
//						ls_reference = ls_reference + " - " + adw_detail.GetText()
//					END IF
//				else
//					ls_reference = ls_reference + " - " + ""
//				end if
//			END IF
//		ELSE
//			ls_reference = ls_reference + " - " + ""
//		END IF
//		
//		ls_reference = mid(ls_reference,1,100) //maha 022704 4.1.1
//
//		//--------------------------- APPEON BEGIN ---------------------------
//		//$<add> 03.01.2006 By: LeiWei
//		//$<reason> Fix a defect.
//		END IF
//		//---------------------------- APPEON END ----------------------------
////@@@@@
//
//		//Start Code Change ----08.01.2008 #V85 maha - get active status to pass to function
//		if adw_detail.Describe("active_status.ColType") <> "!" then
//			li_status = adw_detail.getitemnumber(li_data_cr,"active_status")
//		end if
//		//End Code Change---08.01.2008
//		//Start Code Change ---- 10.26.2006 #1 maha
//		IF ls_rec_status = "Modified" THEN
////			parent_window.Tab_1.tabpage_verif.uo_verif_summary.of_update_reference( ls_reference,  ll_rec_id, ll_address_code,  ldt_exp_date , li_screen_id,li_status)  //Start Code Change ----04.22.2008 #V8 maha - added screen id argument ; 08.01.2008 added li_status argument
//			of_app_audit_update_ref( il_prac_id , ll_rec_id , mid(ls_screen_name,1,5) + "-" + ls_reference )
//
//			//--------------------------- APPEON BEGIN ---------------------------
//			//$<add> 2006-10-11 By: Rodger Wu (Inova)
//			//$<reason> 
//			IF ( Isnull( ldt_exp_date_original ) and Not Isnull( ldt_exp_date ) ) or &
//				( Isnull( ldt_exp_date ) and Not Isnull( ldt_exp_date_original ) ) or &
//				( DaysAfter( date( ldt_exp_date_original ), date( ldt_exp_date ))) <> 0 THEN
//				ll_rec_id_changed[ Upperbound( ll_rec_id_changed ) + 1 ] = ll_rec_id
//			END IF
//			//---------------------------- APPEON END ----------------------------
//		ELSE  //new
//			for t = 1 to li_temp_cnt //check to see if completion is desired
//				if li_complete[t] = 1 then 
//					openwithparm(w_app_audit_complete_mes,  ls_mess) //asks user to complete and gets response code 
//					ls_mess = message.stringparm
//					if mid(ls_mess,1,1) = "N" then 
//						li_complete[t] = 0
//						ll_verif_response = 0
//					else //yes
//						ll_verif_response = long(mid(ls_mess,3))
//					end if	
//				else //Start Code Change ---- 05.09.2007 #V7 maha trap so verif does not get completed
//					li_complete[t] = 0
//					ll_verif_response = 0
//				end if
//				if li_auto_gen[t] = 1 then  //Start Code Change ---- 05.09.2007 #V7 maha only create if set to auto gen
//					inv_data_entry.of_app_audit_item_create( li_app_audit_facil ,il_prac_id ,ll_templ_id[t] ,ll_appt_stat_recid , ll_rec_id , "DE" , li_complete[t] , mid(ls_screen_name,1,5) + "-" + ls_reference )
//				end if
//			next
//			IF Upper( gs_cust_type ) = 'I' THEN ll_verif_response = 326 //if intelliapp, always set to complete the verification
//			IF parent_window.Tab_1.tabpage_verif.uo_verif_summary.of_add_record( il_prac_id, ll_rec_id, li_screen_id, ls_reference,  ldt_exp_date, ls_screen_name, ll_address_code, "A",li_month,li_year,ll_verif_response, li_status) = -1 THEN  //Start Code Change ----.2008 #V85 maha - added li_status argument
//					Return -1
//					messagebox("Error","Error adding verification")
//				end if
//			END IF
//			parent_window.ib_app_audit_retrieved = false //Start Code Change ---- 10.30.2006 #1 maha
//		//End Code Change---10.26.2006
////@@@@@
//
//	END IF
//	//--------------------------- APPEON BEGIN ---------------------------
//	//$<add> 10.12.2006 By: Jack (Inova)
//	//$<reason> Queue Images for Scanning from Data Entry.
//	long ll_row,ll_seq_no,ll_image_type_id,ll_default_pages,ll_de_queue
//	if ls_rec_status = "New" then
//		ll_de_queue = long(gnv_data.of_getitem('image_type','de_queue','link_to_screen = ' + string(li_screen_id)))
//	//ll_de_queue = 0 //maha changed because it was not working properly
//		if ll_de_queue = 1 then
//			ll_image_type_id = long(gnv_data.of_getitem('image_type','image_type_id','link_to_screen = ' + string(li_screen_id)))
//			ll_default_pages = long(gnv_data.of_getitem('image_type','default_pages','link_to_screen = ' + string(li_screen_id)))
//
//			ll_row = ids_image_data.insertrow(0)
//			
//			SELECT Max( seq_no )  
//			INTO :ll_seq_no  
//			FROM pd_images  
//			WHERE pd_images.rec_id = :ll_rec_id ;
//			
//			IF IsNull( ll_seq_no ) THEN
//				ll_seq_no = 0
//			END IF
//			ll_seq_no++
//			ids_image_data.SetItem( ll_row, "image_type_id", ll_image_type_id )
//			ids_image_data.SetItem( ll_row, "prac_id", il_prac_id )
//			ids_image_data.SetItem( ll_row, "seq_no", ll_seq_no )
//			ids_image_data.SetItem( ll_row, "rec_id", ll_rec_id  )
//			ids_image_data.SetItem( ll_row, "facility_id", ii_parent_facility_id  )	
//			ids_image_data.SetItem( ll_row, "screen_id", li_screen_id )	
//			ids_image_data.SetItem( ll_row, "reference_name", ls_reference )
//			ids_image_data.SetItem( ll_row, "active_status", 1 )	
//			ids_image_data.SetItem( ll_row, "num_pages", ll_default_pages )
//			ids_image_data.SetItem( ll_row, "tif_start_page", 1 )
//			ids_image_data.SetItem( ll_row, "de_queue", 0 )
//		end if
//	end if
//	//---------------------------- APPEON END ----------------------------
//	
//	//--------------------------- APPEON BEGIN ---------------------------
//	//$<add> 10.17.2006 By: Jack (Inova)
////Start Code Change ---- 10.26.2006 #1 maha  removed .  not using
//	//$<reason> Required Documents Check Box on Data Entry Screen.
////	long ll_prac_id[]
////	long li_rec_id[]
////	ll_prac_id[1] = il_prac_id
////	li_rec_id[1] = ll_rec_id
//////	inv_data_entry.of_create_application_audit_record(ls_rec_status,ll_prac_id,li_screen_id,li_rec_id,ls_reference)
////End Code Change---10.26.2006
//	//---------------------------- APPEON END ----------------------------
//END FOR
//
//adw_detail.ScrollToRow( li_data_cr )
//adw_detail.SetRow( li_data_cr )
//
////--------------------------- APPEON BEGIN ---------------------------
////$<add> 06/03/2008 By: Ken.Guo
////$<reason> Fix issue. After save address data, address link data disappear.
//if li_data_cr > 0 then
//	il_rec_id = adw_detail.GetItemNumber( li_data_cr, "rec_id" )
//end if
////---------------------------- APPEON END ----------------------------
//
//adw_detail.BringToTop = True
//of_get_record_verif( li_data_cr )
//
////IF is_screen_name = "Hospital Affiliation" or is_screen_name = "Address"  then //\/maha 082101 
////if is_screen_name = "Hospital Affiliation" or is_screen_name = "Address" or is_screen_name = "Board/Specialty"then
//IF ii_screen_id = 10 or ii_screen_id = 2 or ii_screen_id = 19  then
//	dw_link_list.bringtotop = True
//end if
//
//adw_detail.SetRedraw( True )
//
//dw_detail.SetColumn( is_first_column_detail_1 )
//
//dw_detail.SetFocus()
//
////debugbreak()
//inv_data_entry.of_field_audit( This )
//
////--------------------------- APPEON BEGIN ---------------------------
////$<ID> PT-26
////$<modify> 2006-04-11 By: owen chen
////$<reason> Performance tuning modification
////$<modification> 1)Modify the script in the pfc_Save from PT-28.
////$<modification> 2)Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.
//
//gnv_appeondb.of_startqueue( )
//
//IF ids_parent_facilities.rowcount( ) > 0 THEN
//	dw_link_list.Update()
//	dw_link_list.Retrieve( il_rec_id )
//END IF
////--------------------------- APPEON BEGIN ---------------------------
////$<add> 10.12.2006 By: Jack (Inova)
////$<reason> Queue Images for Scanning from Data Entry.
//ids_image_data.update()
////---------------------------- APPEON END ----------------------------
//
//gnv_appeondb.of_commitqueue( )
//
//DESTROY ids_parent_facilities
//
////---------------------------- APPEON END ----------------------------
//
////--------------------------- APPEON BEGIN ---------------------------
////$<add> 2006-10-11 By: Rodger Wu (Inova)
////$<reason> Automatically poping up Verification Update window once
////$<reason> value in exp_field changed.
//
//String ls_sql_where, ls_rec_id_str, ls_sql_original
//n_ds lds_verify
//gs_verif_update lstr_verif
//
//li_cnt = UpperBound( w_mdi.ii_security_action_id )
//FOR i = 1 TO li_cnt
//	IF w_mdi.ii_security_action_id[ i ] = 160 THEN
//		IF w_mdi.ii_security_action_value[ i ] = 0 THEN
//			Return 1; //No rights	
//		END IF
//	END IF		
//NEXT
//
//li_cnt = UpperBound( ll_rec_id_changed )
//IF li_cnt > 0 THEN
////	ls_sql_where = " AND security_user_facilities.user_id = '" + gs_user_id + "' " + &
////						" AND pd_affil_stat.prac_id = " + string( il_prac_id ) + &
////						" AND verif_info.screen_id = " + string( li_screen_id )
////												
//	FOR i = 1 TO li_cnt
//		ls_rec_id_str += string( ll_rec_id_changed[i] ) + ", "
//	NEXt
////	ls_rec_id_str = Left( ls_rec_id_str, Len( ls_rec_id_str ) - 2 )
////	ls_sql_where += " AND verif_info.rec_id in ( " + ls_rec_id_str + " ) "
////
//	lds_verify = Create n_ds
//	lds_verify.DataObject = "d_verification_facility_de_update_maha"
//	lds_verify.SetTransObject( SQLCA )
//	
////	ls_sql_original = lds_verify.Describe( "Datawindow.Table.Select" )
////	ls_sql_original += ls_sql_where
//	
////	lds_verify.Modify( 'Datawindow.Table.Select = "' + ls_sql_original + '"' )
//
//	//IF lds_verify.Retrieve() > 0 THEN
//	//	IF MessageBox( "IntelliSoft", "Do you want to update the verification(s)?", Question!, YesNo!, 1 ) = 2 THEN Return 1;
//		
//		lstr_verif.sql_syntax = ""//ls_sql_original
//		lstr_verif.al_prac_id = il_prac_id
//		lstr_verif.al_screen_id = li_screen_id
//		lstr_verif.al_rec_id = ll_rec_id_changed
//		
//		OpenwithParm( w_verification_de_update, lstr_verif )
//	///END IF
//END IF
//
////---------------------------- APPEON END ----------------------------
//
RETURN 1

end function

public function integer of_dwchild_retrieve (string as_lu_table, string as_type, datawindowchild adw_dw, string as_from, long al_value, string as_column_nm);//created maha 060805 to add search item in each lookup.  Called from of_create_dynamic_dw and the date entry user object of_lookup_function
//debugbreak()
//Start Code Change ---- 12.15.2005 #171 maha
//works for all dropdowns except insurance carrier??????
long ll_val
datawindowchild dwchild
long ll_find
long ert
//debugbreak()
long ll_ret
ll_ret=adw_dw.GetChild( as_column_nm, dwchild )
adw_dw.settransobject(sqlca)
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-65
//$<modify> 01.17.2006 By: Cao YongWang
//$<reason> After Appeon's modification, the ids_address_dddw cache is no longer used in IntelliCred.
/*
if as_from = "RET" and as_type = "A" then //when treturning from search refresh cache for address lookups
	ert = app_filler.ids_address_dddw.Retrieve()
	//messagebox("",ert)
end if
*/
//---------------------------- APPEON END ----------------------------

IF as_type = "C" THEN
	choose case as_lu_table
		case "Address Type", "Yes/No","Specialty Order"
			//exceptions
			//--------------------------- APPEON BEGIN ---------------------------
			//$<ID> PT-66
			//$<modify> 01.17.2006 By: Cao YongWang
			//$<reason> After Appeon's modification, the ids_address_dddw cache is no longer used in IntelliCred.
			/*
			dwchild.retrieve(as_lu_table)
			*/
			gnv_data.of_set_dwchild_fromcache('code_lookup',"upper(lookup_name)='"+upper(as_lu_table)+"'",dwchild)
			//---------------------------- APPEON END ----------------------------
		case else
			//--------------------------- APPEON BEGIN ---------------------------
			//$<ID> PT-67
			//$<modify> 01.17.2006 By: Cao YongWang
			//$<reason> After Appeon's modification, the ids_address_dddw cache cache is no longer used in IntelliCred.
			/*
			dwchild.retrieve(as_lu_table)
			*/
			gnv_data.of_set_dwchild_fromcache('code_lookup',"upper(lookup_name)='"+upper(as_lu_table)+"'",dwchild)
//			//---------------------------- APPEON END ----------------------------
//			dwchild.InsertRow(1)
//			dwchild.setitem(1,"code",'-SEARCH/Add-')
//			dwchild.setitem(1,"lookup_code",-777)
//			dwchild.setitem(1,"description","-Search/Add for " + as_lu_table +" -")
	end choose
ELSEIF as_type = "A" THEN
	//debugbreak()
	if dwchild.Describe("entity_name_original.ColType") <> "!" then
		//messagebox("1",string(dwchild.rowcount()))
		//--------------------------- APPEON BEGIN ---------------------------
		////$<ID> PT-68
		//$<modify> 01.17.2006 By: Cao YongWang
		//$<reason> After Appeon's modification, the ids_address_dddw cache cache is no longer used in IntelliCred.
		//app_filler.ids_address_dddw.ShareData( dwchild )
		//dwchild.SetFilter( "lookup_name = '" + as_lu_table + "'" )
		//dwchild.Filter()
		dwchild.retrieve(as_lu_table)

		//---------------------------- APPEON END ----------------------------
//		
//		dwchild.InsertRow(1)
//		//messagebox("2",string(dwchild.rowcount()))
//		dwchild.setitem(1,"code",'-SEARCH/ADD-')
//		dwchild.setitem(1,"lookup_code",-888)
//		dwchild.setitem(1,"entity_name_original","-Search/Add for " + as_lu_table +" -")
//		dwchild.setitem(1,"entity_name","-Search/Add for " + as_lu_table +" -")		//Added by Scofield on 2007-08-31
	end if
elseif as_type = "Q" THEN
//		dwchild.Retrieve()
		gnv_data.of_set_dwchild_fromcache('question_lookup',"",dwchild)
end if

//dwchild.InsertRow(1) //blank row

//End Code Change---12.15.2005 

if as_from = "RET" then
	ll_val = al_value
	adw_dw.SetItem( adw_dw.GetRow(), as_column_nm, ll_val )
	adw_dw.accepttext()
	ll_find = dwchild.find("lookup_code = " + string(ll_val),1,dwchild.rowcount())
	if ll_find > 0 then
		dwchild.scrolltorow(ll_find)
	end if
end if

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-69
//$<add> 01.25.2006 By: Cao YongWang
//$<reason> Performance tuning
//$<modification> Specify values to arrays.

is_types[upperbound(is_types) + 1] 					= as_type
is_froms[upperbound(is_froms) + 1] 					= as_from
is_dddwcolumns[upperbound(is_dddwcolumns) + 1] 	= as_column_nm
is_lu_tables[upperbound(is_lu_tables) + 1] 		= as_lu_table
il_values[upperbound(il_values) + 1] 				= al_value
//---------------------------- APPEON END ----------------------------

return 1
end function

public function string of_create_dynamic_dw (long al_prac_id, integer ai_data_view_id, integer ai_screen_id, u_dw adw_detail, u_dw adw_browse, boolean ab_screen_painter, integer ai_facility_id, string as_curdw, string as_reportfrom, integer ai_profile_view_id);SetPointer(HourGlass!)
Integer li_facility_specific
Integer li_sort_data_cnt
Integer m1
Integer li_dddw_code_cnt
Integer li_dddw_address_cnt
Integer li_row_cnt
Integer m
integer res //maha110602
Integer li_index
Integer li_obj_cnt
Integer i
Integer li_key_cnt
Integer li_prac_row_cnt
Integer t
Integer li_col_cnt
Integer li_fld_label_width
Integer li_fld_width
Integer li_table_cnt
integer li_set //maha030702
integer li_uls //maha082305
long ll_max_height
Boolean ib_create_browse 
Boolean lb_table_found
Boolean lb_multi_tablE
Boolean lb_first_field = True
Boolean lb_has_active_status = False
String ls_retval
String ls_sort_syntax
String ls_month
String ls_fld_lbl_font_wght
String ls_detail_band_height
String ls_dummy_array[]
String ls_width
String ls_return_syntax
String ls_dddw_width[]
String ls_height
String ls_x
String ls_y
String ls_justification
String ls_text
String ls_obj_type
String ls_obj_name
String ls_field_x[] 
String ls_visible
String ls_field_y[]
String ls_field_label_x[]
String ls_field_label_height[]
String ls_field_label_y[] 
String ls_field_label[]
String ls_field_id[]
String ls_mask[]
String ls_table_names[]
String ls_field_names[]
String ls_table_field_names[]
String ls_dw_field_names[]
String ls_key_fields_col_nm[]
String ls_temp_table
String ls_table_name
String ls_field_name
String ls_sql_syntax
String ls_grey
String ls_white
String ls_presentation_str
String ls_dwsyntax_str
String ERRORS
String ls_lookup_code
String ls_lookup_type
String ls_lookup_field
String ls_key_fields_syntax
String ls_key_fields[]
string des
string ls_color
Long ll_detail_height
string widt
DataWindowChild dwchild
DataWindowChild dwchild_browse
Integer li_repobj_cnt
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-31
//$<add> 01.13.2006 By: Luke
//$<reason> Performance tuing
//$<modification> Define variables to be used in subsequent script.
long set1 , ll_recreate
String ls_Bold, ls_italic

//li_row_cnt is all the screen's fields
//upperbound- ls_dw_field_names[] is all visible fields only
ib_create_browse = True

IF adw_detail = adw_browse THEN
	ib_create_browse = False
END IF

is_column_default[] = ls_dummy_array[]
is_column_names[] = ls_dummy_array[]

//
	app_filler.ids_report_fields_cache.ShareData( ids_screen_fields )
	ids_screen_fields.SetFilter( "view_id = " + String (ai_data_view_id) + " AND profile_view_id = " + String(ai_profile_view_id) + " AND screen_id = " + String( ai_screen_id ) + " AND report_from = '" + as_reportfrom + "'")
	ids_screen_fields.Filter( )	
	li_row_cnt = ids_screen_fields.RowCount()	
//
	app_filler.ids_report_objects_cache.ShareData( ids_screen_objects )
	ids_screen_objects.SetFilter( "view_id = " + String (ai_data_view_id) + " AND profile_view_id = " + String(ai_profile_view_id) + " AND screen_id = " + String( ai_screen_id ) + " AND report_from = '" + as_reportfrom + "'")
	ids_screen_objects.Filter( )
	li_obj_cnt = ids_screen_objects.RowCount()
//alan	
	app_filler.ids_screen_report_objects_cache.ShareData( ids_report_objects )
	ids_report_objects.SetFilter( "data_view_id = " + String (ai_data_view_id) + " AND profile_view_id = " + String(ai_profile_view_id) + " AND screen_id = " + String( ai_screen_id ) + " AND report_from = '" + as_reportfrom + "'")
	ids_report_objects.Filter( )
	li_repobj_cnt = ids_report_objects.RowCount()
	
	ids_screen_fields.SetSort( "field_order A" )
	ids_screen_fields.sort( ) //should be by field_order maha 051905 ######

ii_column_cnt = 0

//BUILD SELECT 
FOR i = 1 TO li_row_cnt
	IF ( NOT ab_screen_painter AND ids_screen_fields.GetItemString(i, "visible") = "N" ) THEN
		CONTINUE //for visible =N do not add to the DE screen dw
	END IF
	ii_column_cnt++
	ls_table_name = Trim( ids_screen_fields.GetItemString( i, "db_table_name" ))
	ls_field_name = Trim( ids_screen_fields.GetItemString( i, "db_field_name" ))
	is_table_name = ls_table_name
	is_column_names[ii_column_cnt] = ls_field_name	
	is_column_default[ii_column_cnt] = ids_screen_fields.GetItemString( i, "default_value" )
	ls_mask[i] = ids_screen_fields.GetItemString( i, "field_mask" ) 
	ls_field_names[i] = ls_field_name
	ls_field_id[i] = String (ids_screen_fields.GetItemNumber( i, "field_id" ) )
	ls_field_x[i] = String (ids_screen_fields.GetItemNumber( i, "field_x" ) )
	ls_field_y[i] = String (ids_screen_fields.GetItemNumber( i, "field_y" ) )
	ls_field_label_height[i] = String (ids_screen_fields.GetItemNumber( i, "field_height" ) )
	if long(ls_field_y[i]) + long(ls_field_label_height[i]) > ll_max_height then ll_max_height = long(ls_field_y[i]) + long(ls_field_label_height[i])  //maha 051205
	//if i < 2 then messagebox(ls_field_names[i],ls_field_label_height[i])
	ls_dddw_width[i] = String(ids_screen_fields.GetItemNumber(i, "drop_down_width"))
	ls_field_label_x[i] = String (ids_screen_fields.GetItemNumber( i, "field_label_x" ) )
	ls_field_label_y[i] = String (ids_screen_fields.GetItemNumber( i, "field_label_y" ) )	
	ls_table_field_names[i] = Mid( ls_table_name,5,100 ) + "_" + ls_field_name
	ls_field_label[i] = ids_screen_fields.GetItemString( i, "field_label" )
	ls_sql_syntax = ls_sql_syntax + ls_table_name + "." + ls_field_name + ", "
	ls_fld_lbl_font_wght = String (ids_screen_fields.GetItemNumber( i, "data_view_report_fields_font_wieght" ) )	
	lb_table_found = False
	FOR t = 1 TO li_table_cnt
		IF ls_table_names[t] = ls_table_name THEN
			lb_table_found = True
		   EXIT
		END IF
	END FOR
	IF NOT lb_table_found THEN
		li_table_cnt ++
		ls_table_names[ li_table_cnt ] = ls_table_name
	END IF
END FOR

//special datawindow and compute column count
int 		li_row_cnt_new

adw_detail.dataobject=as_curdw
li_row_cnt_new = UpperBound(ls_field_names)	
for i = 1 to li_row_cnt_new
	ls_dw_field_names[i] = ls_field_names[i]
END FOR
li_row_cnt_new=integer(adw_detail.object.datawindow.column.count)

//Start Code Change ---- 06.09.2006 #531 maha
adw_detail.InsertRow(0) 

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-33
//$<add> 01.25.2006 By: Cao YongWang
//$<reason> Pervformance tuning.
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.
gnv_appeondb.of_startqueue()
//---------------------------- APPEON END ----------------------------

FOR i = 1 TO li_row_cnt//ids_screen_fields.rowcount()
	IF NOT ab_screen_painter AND ids_screen_fields.GetItemString(i, "visible") = "N" THEN
		CONTINUE
	END IF
	//visible
	IF ab_screen_painter THEN
		IF ids_screen_fields.GetItemString(i, "visible") = "N" THEN
			adw_detail.Modify(ls_dw_field_names[i] + ".color = '8421504'") 
			adw_detail.Modify(ls_dw_field_names[i] + ".background.color = '12632256'") 
			adw_detail.Modify(ls_dw_field_names[i] + "_t.color = '8421504'") 
		ELSE
			adw_detail.Modify(ls_dw_field_names[i] + ".color = '0'") 
			adw_detail.Modify(ls_dw_field_names[i] + "_t.color = '0'")
			adw_detail.Modify(ls_dw_field_names[i] + "_t.background.mode = '1'") //Start Code Change ---- 10.22.2007 #V7 maha added to make labels transparent
			adw_detail.Modify(ls_dw_field_names[i] + ".background.color = '16777215'") 
		END IF
	END IF
	
	if isnull(ls_field_label[i]) then ls_field_label[i] = '' //Jervis 02.18.2008
	
//	messagebox(as_curdw+'/'+ls_dw_field_names[i],adw_detail.describe(ls_dw_field_names[i]+".type"))
	adw_detail.Modify( ls_dw_field_names[i] + ".border = '5'") 
	//
	adw_detail.Modify( ls_dw_field_names[i] + "_t.text = '" + ls_field_label[i] + "'")

	//bold or not?
	adw_detail.Modify( ls_dw_field_names[i] + "_t.font.weight = '" + ls_fld_lbl_font_wght + "'")	

	if integer(ls_field_label_height[i]) > 120 then //maha added to allow multi line fields to wrap 011504
		adw_detail.Modify( ls_dw_field_names[i] + ".edit.AutoHScroll = No")
	end if

	li_fld_label_width = ids_screen_fields.GetItemNumber( i, "field_label_width" )
	li_fld_width = ids_screen_fields.GetItemNumber( i, "field_width" ) 
	adw_detail.Modify( ls_dw_field_names[i] + ".width = '" + String( li_fld_width ) + "'" )	
	adw_detail.Modify( ls_dw_field_names[i] + "_t.width = '" + String( li_fld_label_width ) + "'" )
	adw_detail.Modify( ls_dw_field_names[i] + ".height = '" + String( ls_field_label_height[i] ) + "'" )

	IF ls_field_x[i] = "0" THEN
		adw_detail.Modify( ls_dw_field_names[i] + ".x = 750")
		adw_detail.Modify( ls_dw_field_names[i] + ".y = " + String(i*100) )

		adw_detail.Modify( ls_dw_field_names[i] + "_t.x = 100")
		adw_detail.Modify( ls_dw_field_names[i] + "_t.y = " + String(i*100) )
	ELSE
		adw_detail.Modify( ls_dw_field_names[i] + ".x = " + ls_field_x[i] )
		adw_detail.Modify( ls_dw_field_names[i] + ".y = " + ls_field_y[i] )

		adw_detail.Modify( ls_dw_field_names[i] + "_t.x = " + ls_field_label_x[i] )
		adw_detail.Modify( ls_dw_field_names[i] + "_t.y = " + ls_field_label_y[i] )		
	END IF

	//tag value set to field id
	adw_detail.Modify( ls_dw_field_names[i] + ".tag = '" + ls_field_id[i] + "'" )
	adw_detail.Modify( ls_dw_field_names[i] + "_t.tag = '" + ls_field_id[i] + "'" )

	//alignment
	adw_detail.Modify( ls_dw_field_names[i] + ".alignment = '" + ids_screen_fields.GetItemString( i, "justification" ) + "'" )	
	adw_detail.Modify( ls_dw_field_names[i] + "_t.alignment = '" + String( ids_screen_fields.GetItemNumber( i, "field_label_justification" ) ) + "'" )	

	//--------------------------- APPEON BEGIN ---------------------------
	//$<add> 04/01/2008 By: Ken.Guo
	//$<reason> Added new properties: Font.UnderLine, Font.Italic, Font.Weight.
	//UnderLine
	adw_detail.Modify( ls_dw_field_names[i] + ".Font.UnderLine = '" + 	ids_screen_fields.GetItemString( i, "data_view_report_fields_field_underline" ) + "'" )	
	adw_detail.Modify( ls_dw_field_names[i] + "_t.Font.UnderLine = '" + 	ids_screen_fields.GetItemString( i, "data_view_report_fields_label_underline" ) + "'" )	

	//Italic
	adw_detail.Modify( ls_dw_field_names[i] + ".Font.Italic = '" + 	String(ids_screen_fields.GetItemNumber( i, "data_view_report_fields_field_font_italic" ) ) + "'" )	
	adw_detail.Modify( ls_dw_field_names[i] + "_t.Font.Italic = '" +	String(ids_screen_fields.GetItemNumber( i, "data_view_report_fields_label_font_italic" ) ) + "'" )	

	//Weight
	adw_detail.Modify( ls_dw_field_names[i] + ".Font.weight = '" +		String(ids_screen_fields.GetItemNumber( i, "data_view_report_fields_font_wieght" )) + "'" )	
	adw_detail.Modify( ls_dw_field_names[i] + "_t.Font.weight = '" +	String(ids_screen_fields.GetItemNumber( i, "data_view_report_fields_label_font_weight" ) ) + "'" )	
	//---------------------------- APPEON END ----------------------------


	IF ls_dw_field_names[i] = "active_status" THEN
		adw_detail.Modify( ls_dw_field_names[i] + ".dddw.VscrollBar = Yes")			
		adw_detail.Modify( ls_dw_field_names[i] + ".dddw.useasborder = Yes")			
		adw_detail.Modify( ls_dw_field_names[i] + ".dddw.NilIsNull= Yes")
		//adw_detail.Modify( ls_dw_field_names[i] + ".dddw.Lines= 15")
		adw_detail.Modify( ls_dw_field_names[i] + "_t.font.underline = '1'")
		adw_detail.Modify( ls_dw_field_names[i] + ".dddw.Required = Yes")
		adw_detail.Modify( ls_dw_field_names[i] + ".dddw.name = 'd_code_lookup_active_inactive'")
		adw_detail.Modify( ls_dw_field_names[i] + ".dddw.datacolumn = 'lookup_code'")			
		adw_detail.Modify( ls_dw_field_names[i] + ".dddw.displaycolumn = 'description'")						
	END IF
		IF UPPER(ls_lookup_field) = "ENTITY_NAME" THEN

		END IF
	IF ids_screen_fields.GetItemString( i, "lookup_field") = "Y" AND NOT ab_screen_painter THEN
		ls_lookup_code = ids_screen_fields.GetItemString( i, "lookup_code" )
		ls_lookup_field = ids_screen_fields.GetItemString( i, "lookup_field_name" )
		ls_lookup_type = ids_screen_fields.GetItemString( i, "lookup_type" )
		adw_detail.Modify( ls_dw_field_names[i] + ".dddw.VscrollBar = Yes")
		adw_detail.Modify( ls_dw_field_names[i] + ".dddw.AutoHScroll = Yes")
		adw_detail.Modify( ls_dw_field_names[i] + ".dddw.useasborder = Yes")			
		adw_detail.Modify(ls_dw_field_names[i] + ".dddw.NilIsNull= Yes")
		//Start Code Change ---- 03.08.2006 #317 maha readded
		adw_detail.Modify(ls_dw_field_names[i] + ".dddw.Lines= 15")
		//End Code Change---03.08.2006
		IF ids_screen_fields.GetItemString(i, "required") = "Y" THEN
			adw_detail.Modify(ls_dw_field_names[i] + "_t.font.underline = '1'")
			adw_detail.Modify(ls_dw_field_names[i] + ".dddw.Required = Yes")
		END IF	
		IF ls_lookup_type = "C" THEN
			adw_detail.Modify( ls_dw_field_names[i] + ".dddw.name = 'd_dddw_code_lookup'")
			adw_detail.Modify( ls_dw_field_names[i] + ".dddw.datacolumn = 'lookup_code'")			
			
			IF ib_create_browse = True THEN
				adw_browse.Modify( ls_dw_field_names[i] + ".dddw.name = 'd_dddw_code_lookup'")
				adw_browse.Modify( ls_dw_field_names[i] + ".dddw.datacolumn = 'lookup_code'")	
			END IF
			
			IF Upper( ls_lookup_field ) = "CODE" THEN
				adw_detail.Modify( ls_dw_field_names[i] + ".dddw.displaycolumn = 'code'")
				IF ib_create_browse = True THEN				
					adw_browse.Modify( ls_dw_field_names[i] + ".dddw.displaycolumn = 'code'")
				END IF
			ELSE
				//--------------------------- APPEON BEGIN ---------------------------
				//$<Modify> 2007-07-12 By: Scofield
				//$<Reason> Change 'description' to ls_lookup_field
				
				//adw_detail.Modify( ls_dw_field_names[i] + ".dddw.displaycolumn = 'description'")
				adw_detail.Modify( ls_dw_field_names[i] + ".dddw.displaycolumn = '"+ls_lookup_field+"'")
				IF ib_create_browse = True THEN				
					//adw_browse.Modify( ls_dw_field_names[i] + ".dddw.displaycolumn = 'description'")
					adw_browse.Modify( ls_dw_field_names[i] + ".dddw.displaycolumn = '"+ls_lookup_field+"'")
				END IF
				//---------------------------- APPEON END ----------------------------
			END IF
		ELSEIF ls_lookup_type = "A" THEN
			adw_detail.Modify( ls_dw_field_names[i] + ".dddw.HscrollBar = Yes")			
			adw_detail.Modify( ls_dw_field_names[i] + ".dddw.name = 'd_dddw_address_lookup'")
			adw_detail.Modify( ls_dw_field_names[i] + ".dddw.datacolumn = 'lookup_code'")		

			IF ib_create_browse = True THEN				
				adw_browse.Modify( ls_dw_field_names[i] + ".dddw.name = 'd_dddw_address_lookup'")						
				adw_browse.Modify( ls_dw_field_names[i] + ".dddw.datacolumn = 'lookup_code'")			
			END IF
			
			IF Upper( ls_lookup_field ) = "CODE" THEN
				adw_detail.Modify( ls_dw_field_names[i] + ".dddw.displaycolumn = 'code'")
				IF ib_create_browse = True THEN								
					adw_browse.Modify( ls_dw_field_names[i] + ".dddw.displaycolumn = 'code'")
				END IF
			ELSE
				adw_detail.Modify( ls_dw_field_names[i] + ".dddw.displaycolumn = 'entity_name'")			
				IF ib_create_browse = True THEN								
					adw_browse.Modify( ls_dw_field_names[i] + ".dddw.displaycolumn = 'entity_name'")						
				END IF
				
				//---------------------------- APPEON END ----------------------------
			END IF
		ELSEIF ls_lookup_type = "Q" THEN
			adw_detail.Modify( ls_dw_field_names[i] + ".dddw.name = 'd_dddw_quest_lookup'")
			adw_detail.Modify( ls_dw_field_names[i] + ".dddw.datacolumn = 'quest_id'")	
			adw_detail.Modify( ls_dw_field_names[i] + ".dddw.displaycolumn = 'short_quest'")
			adw_detail.Modify( ls_dw_field_names[i] + ".dddw.useasborder = No")
			adw_detail.Modify( ls_dw_field_names[i] + ".dddw.vscrollbar = Yes")
			IF ib_create_browse = True THEN
				adw_browse.Modify( ls_dw_field_names[i] + ".dddw.name = 'd_dddw_quest_lookup'")
				adw_browse.Modify( ls_dw_field_names[i] + ".dddw.datacolumn = 'quest_id'")
				adw_browse.Modify( ls_dw_field_names[i] + ".dddw.displaycolumn = 'full_quest'")						
			END IF
		END IF
	
		//adw_detail.Modify( ls_dw_field_names[i] + ".dddw.AllowEdit = Yes")
		adw_detail.Modify( ls_dw_field_names[i] + ".dddw.VScrollBar = Yes")
		//adw_detail.Modify( ls_dw_field_names[i] + ".dddw.HScrollBar = Yes")
		adw_detail.Modify( ls_dw_field_names[i] + ".dddw.PercentWidth = '" + ls_dddw_width[i] + "'")
		adw_detail.GetChild( ls_dw_field_names[i] , dwchild )
		dwchild.SetTransObject( SQLCA )
		of_dwchild_retrieve(ls_lookup_code,ls_lookup_type,adw_detail,"CREATE",0,ls_dw_field_names[i]) //maha app081705
//End Code Change---12.15.2005
	ELSEIF ls_dw_field_names[i] <> "active_status" THEN
//		adw_detail.Modify(ls_dw_field_names[i] + ".Edit.NilIsNull= Yes")
//		IF ids_screen_fields.GetItemString(i, "required") = "Y" THEN
//			adw_detail.Modify(ls_dw_field_names[i] + "_t.font.underline = '1'")			
//			adw_detail.Modify(ls_dw_field_names[i] + ".Edit.Required = Yes")
//		END IF	
//		IF ls_mask[i] <> "" THEN
//			adw_detail.Modify( ls_dw_field_names[i] + ".Edit.CodeTable = Yes")
//			adw_detail.Modify( ls_dw_field_names[i] + ".Edit.ValidateCode = Yes" )
//			//adw_detail.Modify( ls_dw_field_names[i] + ".ValidationMsg = 'Invalid Month, Select a number from 1 and 12.'" )
//			//adw_detail.Modify( ls_dw_field_names[i] + ".EditMask.Mask='" + ls_mask[i] + "'")
//			IF ls_mask[i] = "##" THEN
//				FOR m = 1 TO 12
//					ls_month = String(m)
//					adw_detail.SetValue( ls_dw_field_names[i], m, ls_month + "~t" + ls_month )
//					adw_detail.Modify( ls_dw_field_names[i] + ".ValidationMsg = 'Invalid Month, Select a number from 1 and 12.'" )//maha moved 092605
//				END FOR
//				m1 = 0
//				FOR m = 13 TO 21
//					m1++
//					ls_month = "0" + String(m1)
//					adw_detail.SetValue( ls_dw_field_names[i], m, ls_month + "~t" + ls_month )
//				END FOR
//				adw_detail.Modify( ls_dw_field_names[i] + ".Edit.Limit = '2'" )			
//				
//			ELSEIF ls_mask[i] = "(###)###-####" THEN
//				adw_detail.Modify( ls_dw_field_names[i] + ".EditMask.Mask='(###)###-####'" )
//			ELSEIF ls_mask[i] = "###-##-####" THEN
//				adw_detail.Modify( ls_dw_field_names[i] + ".EditMask.Mask='###-##-####'")		
//			ELSEIF ls_mask[i] = "#####-####" THEN
//				adw_detail.Modify( ls_dw_field_names[i] + ".EditMask.Mask='#####-####'" )				
//			ELSEIF ls_mask[i] = "####" THEN
//				li_index = 0
//				FOR m = 1880 TO 2050
//					li_index++
//					adw_detail.SetValue( ls_dw_field_names[i], li_index, String(m) + "~t" + String(m) )
//				END FOR
//				adw_detail.Modify( ls_dw_field_names[i] + ".Edit.Limit = '4'" )			
//				adw_detail.Modify( ls_dw_field_names[i] + ".ValidationMsg = 'Invalid Year, Select a number between 1880 and 2050.'" )
//			ELSEIF ls_mask[i] = "mm/dd/yyyy" THEN
//				//adw_detail.Modify( ls_dw_field_names[i] + ".EditMask.Mask ='mm/dd/yyyy'")
//				adw_detail.Modify( ls_dw_field_names[i] + ".Format='mm/dd/yyyy'")
//			//	adw_detail.Modify( ls_dw_field_names[i] + ".ValidationMsg = 'Invalid Date, Please reenter.'" ) //maha 092605
//				IF ib_create_browse = True THEN				
//					adw_browse.Modify( ls_dw_field_names[i] + ".Format='mm/dd/yyyy'")
//				END IF
//			ELSEIF ls_mask[i] = "#,##0.00" THEN
//				adw_detail.Modify( ls_dw_field_names[i] + ".Format='#,##0'")
//				IF ib_create_browse = True THEN								
//					adw_browse.Modify( ls_dw_field_names[i] + ".Format='#,##0'")
//				END IF
//			END IF
//		END IF	
	END IF
END FOR

gnv_appeondb.of_commitqueue()
//---------------------------- APPEON END ----------------------------

//ls_detail_band_height = String(Integer(adw_detail.Object.DataWindow.Detail.Height) - 200)

//messagebox("ls_detail_band_height",ls_detail_band_height)

adw_detail.SetRedraw(True)

//adw_detail.Modify("create groupbox(band=detail text='End of Detail border='5' color='255' x='1' y='" + ls_detail_band_height + "' height='50' width='3000'  font.face='MS Sans Serif' font.height='-8' font.weight='400'  font.family='2' font.pitch='2' font.charset='0' background.mode='1' background.color='553648127' name=detail_band)"  )


//CREATE ANY SCREEN OBJECTS THAT WERE ADDED
FOR i = 1 TO li_obj_cnt
	if ids_screen_objects.GetItemnumber(i, "object_underline") = 1 then //maha 082305 for use in modify below for underline
		li_uls = 1
	else 
		li_uls = 0
	end if
	ls_obj_type = ids_screen_objects.GetItemString(i, "object_type") 
	ls_obj_name = "object"+String( ids_screen_objects.GetItemNumber(i, "data_view_object_id") )
	ls_width = String( ids_screen_objects.GetItemNumber(i, "object_width") )
	ls_height = String( ids_screen_objects.GetItemNumber(i, "object_height") )
	ls_x = String( ids_screen_objects.GetItemNumber(i, "object_x") )
	ls_y = String( ids_screen_objects.GetItemNumber(i, "object_y") )
	ls_text = ids_screen_objects.GetItemString(i, "object_text") 
	ls_justification = String( ids_screen_objects.GetItemNumber(i, "object_alignment") )
	if long(ls_y) + long(ls_height) > ll_max_height then ll_max_height = long(ls_y) + long(ls_height)  //maha 051205
	//--------------------------- APPEON BEGIN ---------------------------
	//$<add> 2006-08-31 By: Liu HongXin
	//$<reason> Fix defect: display the bold and italic of stand-alone text
	ls_Bold		= String(ids_screen_objects.GetItemNumber(i, "object_bold") )
	ls_italic	= String(ids_screen_objects.GetItemNumber(i, "object_italic") )
	if IsNull(ls_Bold) then ls_Bold = "400"
	if IsNull(ls_italic) then ls_italic = "0"
	//---------------------------- APPEON END ----------------------------

	CHOOSE CASE ls_obj_type
		CASE "B"
			adw_detail.Modify("create groupbox(band=detail text='" + ls_text + "' border='5' color='128' x='" + ls_x + "' y='" + ls_y + "' height='" + ls_height + "' width='" + ls_width + "'  font.face='MS Sans Serif' font.height='-8' font.weight='400'  font.family='2' font.pitch='2' font.charset='0' background.mode='1' background.color='553648127' name=" + ls_obj_name + ")" )
		CASE "T"  //maha 051809 ######
			if ab_screen_painter then
				ls_color = "128"
			else
				ls_color = "0"
			end if
			//--------------------------- APPEON BEGIN ---------------------------
			//$<modify> 2006-08-31 By: Liu HongXin
			//$<reason> 
			/*
			adw_detail.Modify("create text(band=detail text='" + ls_text + "' border='0' color='" + ls_color + "' x='" + ls_x + "' y='" + ls_y + "' height='" + ls_height + "' width='" + ls_width + "'  font.face='MS Sans Serif' font.height='-8' font.weight='400'  font.family='2' font.pitch='2' font.underline='" + string(li_uls) + "' font.charset='0' background.mode='1' background.color='553648127' name=" + ls_obj_name +")" )
			*/
			adw_detail.Modify("create text(band=detail text='" + ls_text + "' border='0' color='" + ls_color + "' x='" + ls_x + "' y='" + ls_y + "' height='" + ls_height + "' width='" + ls_width + "'  font.face='MS Sans Serif' font.height='-8' font.family='2' font.pitch='2' font.underline='" + string(li_uls) + "' font.weight='" + ls_bold + "' font.italic='" + ls_italic + "' font.charset='0' background.mode='1' background.color='553648127' Alignment='"+ls_justification+"' name=" + ls_obj_name + ")" )
			//---------------------------- APPEON END ----------------------------

	END CHOOSE
END FOR
//Start Code Change ---- 01.18.2006 #203 maha


//alan
long	ll_obj_id
if as_reportfrom='P' then
	FOR i = 1 TO li_repobj_cnt		
		if ids_report_objects.GetItemnumber(i, "object_underline") = 1 then //maha 082305 for use in modify below for underline
			li_uls = 1
		else 
			li_uls = 0
		end if
		ls_obj_name = ids_report_objects.GetItemstring(i, "object_name")
		ll_obj_id = ids_report_objects.GetItemNumber(i, "data_view_object_id")
		ls_width = string(ids_report_objects.GetItemNumber(i, "object_width")) 
		ls_height = string(ids_report_objects.GetItemNumber(i, "object_height")) 
		ls_x = string(ids_report_objects.GetItemNumber(i, "object_x")) 
		ls_y = string(ids_report_objects.GetItemNumber(i, "object_y")) 
		ls_text = ids_report_objects.GetItemString(i, "object_text") 
		ls_justification = string(ids_report_objects.GetItemNumber(i, "object_alignment"))
		if long(ls_y) + long(ls_height) > ll_max_height then ll_max_height = long(ls_y) + long(ls_height)  //maha 051205
		//--------------------------- APPEON BEGIN ---------------------------
		//$<add> 2006-08-31 By: Liu HongXin
		//$<reason> Fix defect: display the bold and italic of stand-alone text
		ls_Bold		= string(ids_report_objects.GetItemNumber(i, "object_bold"))
		ls_italic	= string(ids_report_objects.GetItemNumber(i, "object_italic"))
		if IsNull(ls_Bold) then ls_Bold = "400"
		if IsNull(ls_italic) then ls_italic = "0"
		//
		IF ab_screen_painter THEN
			IF ids_report_objects.GetItemString(i, "visible") = "N" THEN
				adw_detail.Modify(ls_obj_name + ".color = '8421504'") 
				adw_detail.Modify(ls_obj_name + ".background.color = '12632256'") 
			ELSE
				adw_detail.Modify(ls_obj_name + ".color = '0'") 
				adw_detail.Modify(ls_obj_name + ".background.color = '16777215'") 
			END IF
		END IF	
		
		adw_detail.modify(ls_obj_name+".text='"+ls_text+"'")
		adw_detail.modify(ls_obj_name+".x='"+ls_x+"'")
		adw_detail.modify(ls_obj_name+".y='"+ls_y+"'")
		adw_detail.modify(ls_obj_name+".width='"+ls_width+"'")
		adw_detail.modify(ls_obj_name+".height='"+ls_height+"'")
		adw_detail.modify(ls_obj_name+".Alignment='"+ls_justification+"'")
		adw_detail.modify(ls_obj_name+".font.weight='"+ls_Bold+"'")
		adw_detail.modify(ls_obj_name+".font.italic='"+ls_italic+"'")
		adw_detail.modify(ls_obj_name+".font.underline='"+string(li_uls)+"'")
		adw_detail.modify(ls_obj_name+".tag='"+string(ll_obj_id)+"'")
		if adw_detail.describe(ls_obj_name+".type")="compute" then
			adw_detail.Modify( ls_obj_name + ".border = '5'") 
		end if
	NEXT
end if
//

//if as_reportfrom='S' then
//IF ls_table_name = "pd_address" or ls_table_name = "dba.pd_address" THEN //maha 011806
//	//adw_detail.Modify("create button(band=detail text='Address Links...' filename=''action='0' border='1' color='128' x='1822' y='110' height='104' width='500' vtextalign='0' htextalign='0'  font.face='MS Sans Serif' font.height='-8' font.weight='700'  font.family='2' font.pitch='2' font.charset='0' background.mode='2' background.color='12632256' name = linkbutton)")
//	
//	//address drop down
//	
//	adw_detail.Modify("create button(band=detail text='Find' filename=''action='0' border='1' color='128' x='1822' y='285' height='85' width='200' vtextalign='0' htextalign='0'  font.face='MS Sans Serif' font.height='-8' font.weight='700'  font.family='2' font.pitch='2' font.charset='0' background.mode='2' background.color='12632256' name = findbutton)")
//	
////	integer set1
////	select set_1
////	into :set1
////	from icred_settings;
//	set1 = of_get_app_setting("set_1","I")
//
//	if set1 = 1 then //maha 072301 create populate button only if using addresses for find
//		adw_detail.Modify("create button(band=detail text='Populate' filename=''action='0' border='1' color='128' x='2010' y='285' height='85' width='280' vtextalign='0' htextalign='0'  font.face='MS Sans Serif' font.height='-8' font.weight='700'  font.family='2' font.pitch='2' font.charset='0' background.mode='2' background.color='12632256' name = populatebutton)")		
//		adw_detail.Modify( "street.dddw.VscrollBar = Yes")			
//		adw_detail.Modify( "street.dddw.useasborder = Yes")			
//		adw_detail.Modify( "street.dddw.AllowEdit = Yes")			
//		adw_detail.Modify( "street.dddw.NilIsNull= Yes")
//		//adw_detail.Modify( "street.dddw.Lines= 15")
//		adw_detail.Modify( "street.dddw.PercentWidth = '200'")	
//		adw_detail.Modify( "street.dddw.name = 'd_dddw_addresses'")
//		adw_detail.Modify( "street.dddw.datacolumn = 'rec_id'")			
//		adw_detail.Modify( "street.dddw.displaycolumn = 'street'")	
//	end if
//	
//	//add drop down for billing address
//	ls_retval = adw_detail.Modify( "billing_address_id.dddw.VscrollBar = Yes")			
//	adw_detail.Modify( "billing_address_id.dddw.useasborder = Yes")			
//	adw_detail.Modify( "billing_address_id.dddw.NilIsNull= Yes")
//	//adw_detail.Modify( "billing_address_id.dddw.Lines= 15")
//	adw_detail.Modify( "billing_address_id_t.font.underline = '1'")
//	adw_detail.Modify( "billing_address_id.dddw.Required = No")
//	adw_detail.Modify( "billing_address_id.dddw.name = 'd_dddw_billing_addresses'")
//	adw_detail.Modify( "billing_address_id.dddw.datacolumn = 'pd_address_rec_id'")			
//	adw_detail.Modify( "billing_address_id.dddw.displaycolumn = 'address'")								
//	res  = adw_detail.GetChild( "billing_address_id", dwchild )
//	if res = 1 then
//		IF Len( ls_retval ) = 0 THEN
//			dwchild.SetTransObject( SQLCA )
//			dwchild.Retrieve( al_prac_id )
//		END IF
////		des = dwchild.Describe("DataWindow.Objects")
////			openwithparm(w_sql_msg,des)
//		dwchild.InsertRow( 1 )
//		dwchild.SetItem( 1, "pd_address_street", "N/A" )	
//		dwchild.SetItem( 1, "pd_address_city", "" )
//		dwchild.SetItem( 1, "code_lookup_code", "" )
//		dwchild.SetItem( 1, "pd_address_rec_id", -1 )	
//		dwchild.InsertRow( 1 )
//		dwchild.SetItem( 1, "pd_address_street", "Same" )	
//		dwchild.SetItem( 1, "pd_address_city", "" )
//		dwchild.SetItem( 1, "code_lookup_code", "" )
//		dwchild.SetItem( 1, "pd_address_rec_id", 0 )
//		dwchild.InsertRow( 1 )
//		dwchild.SetItem( 1, "pd_address_street", "" )	
//		dwchild.SetItem( 1, "pd_address_city", "" )
//		dwchild.SetItem( 1, "code_lookup_code", "" )
//	end if
//	
//END IF
//
//IF ls_table_name = "pd_references" or ls_table_name = "dba.pd_references" THEN //maha 011806
////End Code Change---01.18.2005 
//	li_set = of_get_app_setting("set_5","I")
//	if li_set = 0 then
//		//messagebox("","ref button")
//		adw_detail.Modify("create button(band=detail text='Select Peer' filename=''action='0' border='1' color='128' x='1102' y='1285' height='85' width='400' vtextalign='0' htextalign='0'  font.face='MS Sans Serif' font.height='-8' font.weight='700'  font.family='2' font.pitch='2' font.charset='0' background.mode='2' background.color='12632256' name = peerbutton)")
//		if ll_max_height < 1400 then ll_max_height = 1400 //maha 060805 button was disappearing
//	end if
//end if
//end if
//\maha

//IF li_prac_row_cnt = 0 THEN 
//	If not ab_screen_painter Then of_set_defaults( adw_detail, 1 )
//	adw_detail.SetItemStatus( 1, 0, Primary!, NotModified! )
//END IF

IF ab_screen_painter THEN //maha 051305 ####
	adw_detail.Object.DataWindow.Detail.Height= 20000
else
	choose case ai_screen_id  
		case  - 20
			ll_max_height = 1480
		case else
			ll_max_height = ll_max_height + 20 
	end choose
	adw_detail.Object.DataWindow.Detail.Height= ll_max_height
end if
//adw_detail.Object.DataWindow.Detail.Height.AutoSize  //maha 092702 playing with size
//ls_detail_band_height = String(Integer(adw_detail.Object.DataWindow.Detail.Height))
//messagebox("ls_detail_band_height",ll_max_height)

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-35
//$<add> 03.13.2006 By: Cao YongWang
//$<reason> Performance tuning. 
//<modification> Save the datawindow syntax in the SDR files on local machine.
//of_save_create_syntax(ai_data_view_id,ai_screen_id,adw_detail,'Y',string(idt_screen_cache),'D',ab_screen_painter)
//of_save_create_syntax(ai_data_view_id,ai_screen_id,adw_browse,'N',string(idt_screen_cache),'D',ab_screen_painter)
//---------------------------- APPEON END ----------------------------
if ab_screen_painter = true then adw_detail.hscrollbar = true

//string ls_test_syn
//ls_test_syn = adw_detail.Describe("DataWindow.Syntax")
//openwithparm(w_sql_msg,ls_test_syn)

RETURN ls_return_syntax
end function

public function string of_mod_report_dw (long al_prac_id, integer ai_data_view_id, integer ai_screen_id, datawindowchild adw_detail, boolean ab_screen_painter, integer ai_facility_id, string as_curdw, string as_reportfrom, integer ai_profile_view_id);SetPointer(HourGlass!)
Integer li_facility_specific
Integer li_sort_data_cnt
Integer m1
Integer li_dddw_code_cnt
Integer li_dddw_address_cnt
Integer li_row_cnt
Integer m
integer res //maha110602
Integer li_index
Integer li_obj_cnt
Integer i
Integer li_key_cnt
Integer li_prac_row_cnt
Integer t
Integer li_col_cnt
Integer li_fld_label_width
Integer li_fld_width
Integer li_table_cnt
integer li_set //maha030702
integer li_uls //maha082305
long ll_max_height
Boolean ib_create_browse 
Boolean lb_table_found
Boolean lb_multi_tablE
Boolean lb_first_field = True
Boolean lb_has_active_status = False
String ls_retval
String ls_sort_syntax
String ls_month
String ls_fld_lbl_font_wght
String ls_detail_band_height
String ls_dummy_array[]
String ls_width
String ls_return_syntax
String ls_dddw_width[]
String ls_height
String ls_x
String ls_y
String ls_justification
String ls_text
String ls_obj_type
String ls_obj_name
String ls_field_x[] 
String ls_visible
String ls_field_y[]
String ls_field_label_x[]
String ls_field_label_height[]
String ls_field_label_y[] 
String ls_field_label[]
String ls_field_id[]
String ls_mask[]
String ls_table_names[]
String ls_field_names[]
String ls_table_field_names[]
String ls_dw_field_names[]
String ls_key_fields_col_nm[]
String ls_temp_table
String ls_table_name
String ls_field_name
String ls_sql_syntax
String ls_grey
String ls_white
String ls_presentation_str
String ls_dwsyntax_str
String ERRORS
String ls_lookup_code
String ls_lookup_type
String ls_lookup_field
String ls_key_fields_syntax
String ls_key_fields[]
string des
string ls_color
Long ll_detail_height
string widt
DataWindowChild dwchild
DataWindowChild dwchild_browse
Integer li_repobj_cnt

boolean	lb_con=false //alan
string	ls_coltype
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-31
//$<add> 01.13.2006 By: Luke
//$<reason> Performance tuing
//$<modification> Define variables to be used in subsequent script.
long set1 , ll_recreate
String ls_Bold, ls_italic
//---------------------------- APPEON END ----------------------------

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-32
//$<add> 03.13.2006 By: Cao YongWang
//$<reason> Performance tuning
//$<modification> Add a condition to make sure that: 1) DataWindow syntax will be stored in SRD files
//$<modification> in local machine; 2) the application directly gets the DataWindow syntax from local
//$<modification> machine instead of from the database when the same DataWindow is needed for a second time.


is_column_default[] = ls_dummy_array[]
is_column_names[] = ls_dummy_array[]

//of_setup_cache()

//UNREGISTER ALL CALENDAR FIELDS
	app_filler.ids_report_fields_cache.ShareData( ids_screen_fields )
	ids_screen_fields.SetFilter( "view_id = " + String (ai_data_view_id) + " AND profile_view_id = " + String(ai_profile_view_id) + " AND screen_id = " + String( ai_screen_id ) + " AND report_from = '" + as_reportfrom + "'")
	ids_screen_fields.Filter( )	
	li_row_cnt = ids_screen_fields.RowCount()	
//
	app_filler.ids_report_objects_cache.ShareData( ids_screen_objects )
	ids_screen_objects.SetFilter( "view_id = " + String (ai_data_view_id) + " AND profile_view_id = " + String(ai_profile_view_id) + " AND screen_id = " + String( ai_screen_id ) + " AND report_from = '" + as_reportfrom + "'")
	ids_screen_objects.Filter( )
	li_obj_cnt = ids_screen_objects.RowCount()
//alan	
	app_filler.ids_screen_report_objects_cache.ShareData( ids_report_objects )
	ids_report_objects.SetFilter( "data_view_id = " + String (ai_data_view_id) + " AND profile_view_id = " + String(ai_profile_view_id) + " AND screen_id = " + String( ai_screen_id ) + " AND report_from = '" + as_reportfrom + "'")
	ids_report_objects.Filter( )
	li_repobj_cnt = ids_report_objects.RowCount()
	
	ids_screen_fields.SetSort( "field_order A" )
	ids_screen_fields.sort( ) //should be by field_order maha 051905 ######

ii_column_cnt = 0

//BUILD SELECT 
FOR i = 1 TO li_row_cnt
//	IF ( NOT ab_screen_painter AND ids_screen_fields.GetItemString(i, "visible") = "N" ) THEN
//		CONTINUE //for visible =N do not add to the DE screen dw
//	END IF
	ii_column_cnt++
	ls_table_name = Trim( ids_screen_fields.GetItemString( i, "db_table_name" ))
	ls_field_name = Trim( ids_screen_fields.GetItemString( i, "db_field_name" ))
	is_table_name = ls_table_name
	is_column_names[ii_column_cnt] = ls_field_name	
	is_column_default[ii_column_cnt] = ids_screen_fields.GetItemString( i, "default_value" )
	ls_mask[i] = ids_screen_fields.GetItemString( i, "field_mask" ) 
	ls_field_names[i] = ls_field_name
	ls_field_id[i] = String (ids_screen_fields.GetItemNumber( i, "field_id" ) )
	ls_field_x[i] = String (ids_screen_fields.GetItemNumber( i, "field_x" ) )
	ls_field_y[i] = String (ids_screen_fields.GetItemNumber( i, "field_y" ) )
	ls_field_label_height[i] = String (ids_screen_fields.GetItemNumber( i, "field_height" ) )
	if ids_screen_fields.GetItemString(i, "visible") = "Y" then
		if long(ls_field_y[i]) + long(ls_field_label_height[i]) > ll_max_height then ll_max_height = long(ls_field_y[i]) + long(ls_field_label_height[i])  //maha 051205
	end if
	//if i < 2 then messagebox(ls_field_names[i],ls_field_label_height[i])
	ls_dddw_width[i] = String(ids_screen_fields.GetItemNumber(i, "drop_down_width"))
	ls_field_label_x[i] = String (ids_screen_fields.GetItemNumber( i, "field_label_x" ) )
	ls_field_label_y[i] = String (ids_screen_fields.GetItemNumber( i, "field_label_y" ) )	
	ls_table_field_names[i] = Mid( ls_table_name,5,100 ) + "_" + ls_field_name
	ls_field_label[i] = ids_screen_fields.GetItemString( i, "field_label" )
//	ls_sql_syntax = ls_sql_syntax + ls_table_name + "." + ls_field_name + ", "
	ls_fld_lbl_font_wght = String (ids_screen_fields.GetItemNumber( i, "data_view_report_fields_font_wieght" ) )	
	lb_table_found = False
//	FOR t = 1 TO li_table_cnt
//		IF ls_table_names[t] = ls_table_name THEN
//			lb_table_found = True
//		   EXIT
//		END IF
//	END FOR
//	IF NOT lb_table_found THEN
//		li_table_cnt ++
//		ls_table_names[ li_table_cnt ] = ls_table_name
//	END IF
END FOR

Integer	li_row_cnt_new

li_row_cnt_new = UpperBound(ls_field_names)	
for i = 1 to li_row_cnt_new
	ls_dw_field_names[i] = ls_field_names[i]
END FOR

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-33
//$<add> 01.25.2006 By: Cao YongWang
//$<reason> Pervformance tuning.
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.
gnv_appeondb.of_startqueue()
//---------------------------- APPEON END ----------------------------

FOR i = 1 TO li_row_cnt//ids_screen_fields.rowcount()
	IF as_reportfrom = 'S' THEN
		adw_detail.Modify( ls_dw_field_names[i] + ".border = '0'")
		adw_detail.Modify( ls_dw_field_names[i] + ".dddw.useasborder = no")			//useasborder=no
	END IF
	lb_con=false
	IF NOT ab_screen_painter AND ids_screen_fields.GetItemString(i, "ismodify") = "0" THEN
		if ids_screen_fields.GetItemString( i, "lookup_field") = "N" then
			CONTINUE
		else
			lb_con=true
		end if
	END IF
	
	if lb_con=false then
		IF NOT ab_screen_painter AND ids_screen_fields.GetItemString(i, "visible") = "N" THEN
			adw_detail.Modify(ls_dw_field_names[i] + ".visible = '0'") 
			adw_detail.Modify(ls_dw_field_names[i] + "_t.visible = '0'")
			CONTINUE
		END IF
		//visible
		IF ab_screen_painter THEN
			IF ids_screen_fields.GetItemString(i, "visible") = "N" THEN
				adw_detail.Modify(ls_dw_field_names[i] + ".color = '8421504'") 
				adw_detail.Modify(ls_dw_field_names[i] + ".background.color = '12632256'") 
				adw_detail.Modify(ls_dw_field_names[i] + "_t.color = '8421504'") 
			ELSE
				adw_detail.Modify(ls_dw_field_names[i] + ".color = '0'") 
				adw_detail.Modify(ls_dw_field_names[i] + "_t.color = '0'")
				adw_detail.Modify(ls_dw_field_names[i] + "_t.background.mode = '1'") //Start Code Change ---- 10.22.2007 #V7 maha added to make labels transparent
				adw_detail.Modify(ls_dw_field_names[i] + ".background.color = '16777215'") 
			END IF
		END IF
		
		if isnull(ls_field_label[i]) then ls_field_label[i] = '' //Jervis 02.18.2008
		
		if integer(ls_field_label_height[i]) > 120 then //maha added to allow multi line fields to wrap 011504
			//messagebox(ls_dw_field_names[i],ls_field_label_height[i])
			adw_detail.Modify( ls_dw_field_names[i] + ".edit.AutoHScroll = No")
		end if
	
		li_fld_label_width = ids_screen_fields.GetItemNumber( i, "field_label_width" )
		li_fld_width = ids_screen_fields.GetItemNumber( i, "field_width" ) 
		adw_detail.Modify( ls_dw_field_names[i] + ".width = '" + String( li_fld_width ) + "'" )	
	//	adw_detail.Modify( ls_dw_field_names[i] + "_t.width = '" + String( li_fld_label_width ) + "'" )
		adw_detail.Modify( ls_dw_field_names[i] + ".height = '" + String( ls_field_label_height[i] ) + "'" )
	
	
		IF ls_field_x[i] = "0" THEN
			adw_detail.Modify( ls_dw_field_names[i] + ".x = 750")
			adw_detail.Modify( ls_dw_field_names[i] + ".y = " + String(i*100) )
	
			adw_detail.Modify( ls_dw_field_names[i] + "_t.x = 100")
			adw_detail.Modify( ls_dw_field_names[i] + "_t.y = " + String(i*100) )
		ELSE
			adw_detail.Modify( ls_dw_field_names[i] + ".x = " + ls_field_x[i] )
			adw_detail.Modify( ls_dw_field_names[i] + ".y = " + ls_field_y[i] )
	
			adw_detail.Modify( ls_dw_field_names[i] + "_t.x = " + ls_field_label_x[i] )
			adw_detail.Modify( ls_dw_field_names[i] + "_t.y = " + ls_field_label_y[i] )		
		END IF
	
		//tag value set to field id
		adw_detail.Modify( ls_dw_field_names[i] + ".tag = '" + ls_field_id[i] + "'" )
	//	adw_detail.Modify( ls_dw_field_names[i] + "_t.tag = '" + ls_field_id[i] + "'" )
	
		//alignment
		adw_detail.Modify( ls_dw_field_names[i] + ".alignment = '" + ids_screen_fields.GetItemString( i, "justification" ) + "'" )	
	//	adw_detail.Modify( ls_dw_field_names[i] + "_t.alignment = '" + String( ids_screen_fields.GetItemNumber( i, "field_label_justification" ) ) + "'" )	
	
		//--------------------------- APPEON BEGIN ---------------------------
		//$<add> 04/01/2008 By: Ken.Guo
		//$<reason> Added new properties: Font.UnderLine, Font.Italic, Font.Weight.
		//UnderLine
		adw_detail.Modify( ls_dw_field_names[i] + ".Font.UnderLine = '" + 	ids_screen_fields.GetItemString( i, "data_view_report_fields_field_underline" ) + "'" )	
	//	adw_detail.Modify( ls_dw_field_names[i] + "_t.Font.UnderLine = '" + 	ids_screen_fields.GetItemString( i, "data_view_report_fields_label_underline" ) + "'" )	
	
		//Italic
		adw_detail.Modify( ls_dw_field_names[i] + ".Font.Italic = '" + 	String(ids_screen_fields.GetItemNumber( i, "data_view_report_fields_field_font_italic" ) ) + "'" )	
	//	adw_detail.Modify( ls_dw_field_names[i] + "_t.Font.Italic = '" +	String(ids_screen_fields.GetItemNumber( i, "data_view_report_fields_label_font_italic" ) ) + "'" )	
	
		//Weight
		adw_detail.Modify( ls_dw_field_names[i] + ".Font.weight = '" +		String(ids_screen_fields.GetItemNumber( i, "data_view_report_fields_font_wieght" )) + "'" )	
	//	adw_detail.Modify( ls_dw_field_names[i] + "_t.Font.weight = '" +	String(ids_screen_fields.GetItemNumber( i, "data_view_report_fields_label_font_weight" ) ) + "'" )	
		//---------------------------- APPEON END ----------------------------
		//
		if as_reportfrom='S' then
			adw_detail.Modify( ls_dw_field_names[i] + "_t.text = '" + ls_field_label[i] + "'")
			adw_detail.Modify( ls_dw_field_names[i] + "_t.font.weight = '" + ls_fld_lbl_font_wght + "'")
			adw_detail.Modify( ls_dw_field_names[i] + "_t.width = '" + String( li_fld_label_width ) + "'" )
			adw_detail.Modify( ls_dw_field_names[i] + "_t.tag = '" + ls_field_id[i] + "'" )
			adw_detail.Modify( ls_dw_field_names[i] + "_t.alignment = '" + String( ids_screen_fields.GetItemNumber( i, "field_label_justification" ) ) + "'" )	
			adw_detail.Modify( ls_dw_field_names[i] + "_t.Font.UnderLine = '" + 	ids_screen_fields.GetItemString( i, "data_view_report_fields_label_underline" ) + "'" )			
			adw_detail.Modify( ls_dw_field_names[i] + "_t.Font.Italic = '" +	String(ids_screen_fields.GetItemNumber( i, "data_view_report_fields_label_font_italic" ) ) + "'" )	
			adw_detail.Modify( ls_dw_field_names[i] + "_t.Font.weight = '" +	String(ids_screen_fields.GetItemNumber( i, "data_view_report_fields_label_font_weight" ) ) + "'" )	
		end if
	end if
	
	IF ls_dw_field_names[i] = "active_status" THEN
		adw_detail.Modify( ls_dw_field_names[i] + ".dddw.VscrollBar = Yes")			
		adw_detail.Modify( ls_dw_field_names[i] + ".dddw.useasborder = no")			//useasborder=no
		adw_detail.Modify( ls_dw_field_names[i] + ".dddw.NilIsNull= Yes")
		//adw_detail.Modify( ls_dw_field_names[i] + ".dddw.Lines= 15")
//		adw_detail.Modify( ls_dw_field_names[i] + "_t.font.underline = '1'")
//		adw_detail.Modify( ls_dw_field_names[i] + ".dddw.Required = Yes")
		adw_detail.Modify( ls_dw_field_names[i] + ".dddw.name = 'd_code_lookup_active_inactive'")
		adw_detail.Modify( ls_dw_field_names[i] + ".dddw.datacolumn = 'lookup_code'")			
		adw_detail.Modify( ls_dw_field_names[i] + ".dddw.displaycolumn = 'description'")						

	END IF
		IF UPPER(ls_lookup_field) = "ENTITY_NAME" THEN

		END IF
	IF ids_screen_fields.GetItemString( i, "lookup_field") = "Y" AND NOT ab_screen_painter THEN
		ls_lookup_code = ids_screen_fields.GetItemString( i, "lookup_code" )
		ls_lookup_field = ids_screen_fields.GetItemString( i, "lookup_field_name" )
		ls_lookup_type = ids_screen_fields.GetItemString( i, "lookup_type" )
		adw_detail.Modify( ls_dw_field_names[i] + ".dddw.VscrollBar = Yes")
		adw_detail.Modify( ls_dw_field_names[i] + ".dddw.AutoHScroll = Yes")
		adw_detail.Modify( ls_dw_field_names[i] + ".dddw.useasborder = no")			//useasborder=no
		adw_detail.Modify(ls_dw_field_names[i] + ".dddw.NilIsNull= Yes")
		//Start Code Change ---- 03.08.2006 #317 maha readded
//		adw_detail.Modify(ls_dw_field_names[i] + ".dddw.Lines= 15")
//		//End Code Change---03.08.2006
//		IF ids_screen_fields.GetItemString(i, "required") = "Y" THEN
//			adw_detail.Modify(ls_dw_field_names[i] + "_t.font.underline = '1'")
//			adw_detail.Modify(ls_dw_field_names[i] + ".dddw.Required = Yes")
//		END IF	

		IF ls_lookup_type = "C" THEN
			adw_detail.Modify( ls_dw_field_names[i] + ".dddw.name = 'd_dddw_code_lookup'")
			adw_detail.Modify( ls_dw_field_names[i] + ".dddw.datacolumn = 'lookup_code'")			
			
			
			IF Upper( ls_lookup_field ) = "CODE" THEN
				adw_detail.Modify( ls_dw_field_names[i] + ".dddw.displaycolumn = 'code'")
			
			ELSE
				//--------------------------- APPEON BEGIN ---------------------------
				//$<Modify> 2007-07-12 By: Scofield
				//$<Reason> Change 'description' to ls_lookup_field
				
				//adw_detail.Modify( ls_dw_field_names[i] + ".dddw.displaycolumn = 'description'")
				adw_detail.Modify( ls_dw_field_names[i] + ".dddw.displaycolumn = '"+ls_lookup_field+"'")

				//---------------------------- APPEON END ----------------------------
			END IF
		ELSEIF ls_lookup_type = "A" THEN
			adw_detail.Modify( ls_dw_field_names[i] + ".dddw.HscrollBar = Yes")			
			adw_detail.Modify( ls_dw_field_names[i] + ".dddw.name = 'd_dddw_address_lookup'")
			adw_detail.Modify( ls_dw_field_names[i] + ".dddw.datacolumn = 'lookup_code'")		

			
			IF Upper( ls_lookup_field ) = "CODE" THEN
				adw_detail.Modify( ls_dw_field_names[i] + ".dddw.displaycolumn = 'code'")
			ELSE

				
				adw_detail.Modify( ls_dw_field_names[i] + ".dddw.displaycolumn = 'entity_name'")			
				
				//---------------------------- APPEON END ----------------------------
			END IF
		ELSEIF ls_lookup_type = "Q" THEN
			adw_detail.Modify( ls_dw_field_names[i] + ".dddw.name = 'd_dddw_quest_lookup'")
			adw_detail.Modify( ls_dw_field_names[i] + ".dddw.datacolumn = 'quest_id'")	
			adw_detail.Modify( ls_dw_field_names[i] + ".dddw.displaycolumn = 'short_quest'")
			adw_detail.Modify( ls_dw_field_names[i] + ".dddw.useasborder = No")
			adw_detail.Modify( ls_dw_field_names[i] + ".dddw.vscrollbar = Yes")
		END IF
	
		//adw_detail.Modify( ls_dw_field_names[i] + ".dddw.AllowEdit = Yes")
		adw_detail.Modify( ls_dw_field_names[i] + ".dddw.VScrollBar = Yes")
		//adw_detail.Modify( ls_dw_field_names[i] + ".dddw.HScrollBar = Yes")
		adw_detail.Modify( ls_dw_field_names[i] + ".dddw.PercentWidth = '" + ls_dddw_width[i] + "'")
		adw_detail.GetChild( ls_dw_field_names[i] , dwchild )
		dwchild.SetTransObject( SQLCA )
		////////// 
		of_dwchild_retrieve(ls_lookup_code,ls_lookup_type,adw_detail,"CREATE",0,ls_dw_field_names[i]) //maha app081705
		//////////
//End Code Change---12.15.2005
	ELSEIF ls_dw_field_names[i] <> "active_status" THEN
		adw_detail.Modify(ls_dw_field_names[i] + ".Edit.NilIsNull= Yes")
		ls_coltype = adw_detail.describe(ls_dw_field_names[i]+".coltype")
//		IF ids_screen_fields.GetItemString(i, "required") = "Y" THEN
//			adw_detail.Modify(ls_dw_field_names[i] + "_t.font.underline = '1'")			
//			adw_detail.Modify(ls_dw_field_names[i] + ".Edit.Required = Yes")
//		END IF	
		IF isnull(ls_mask[i]) THEN
		ELSE
		IF ls_mask[i] <> "" THEN
			adw_detail.Modify( ls_dw_field_names[i] + ".Edit.CodeTable = Yes")
			adw_detail.Modify( ls_dw_field_names[i] + ".Edit.ValidateCode = Yes" )
			//adw_detail.Modify( ls_dw_field_names[i] + ".ValidationMsg = 'Invalid Month, Select a number from 1 and 12.'" )
			//adw_detail.Modify( ls_dw_field_names[i] + ".EditMask.Mask='" + ls_mask[i] + "'")
			IF ls_mask[i] = "##" THEN
				FOR m = 1 TO 12
					ls_month = String(m)
					adw_detail.SetValue( ls_dw_field_names[i], m, ls_month + "~t" + ls_month )
					adw_detail.Modify( ls_dw_field_names[i] + ".ValidationMsg = 'Invalid Month, Select a number from 1 and 12.'" )//maha moved 092605
				END FOR
				m1 = 0
				FOR m = 13 TO 21
					m1++
					ls_month = "0" + String(m1)
					adw_detail.SetValue( ls_dw_field_names[i], m, ls_month + "~t" + ls_month )
				END FOR
				adw_detail.Modify( ls_dw_field_names[i] + ".Edit.Limit = '2'" )			
				adw_detail.Modify( ls_dw_field_names[i] + ".format='mm'" )
			ELSEIF ls_mask[i] = "(###)###-####" THEN
//				adw_detail.Modify( ls_dw_field_names[i] + ".EditMask.Mask='(###)###-####'" )
				if left(ls_coltype,3)='int' or left(ls_coltype,3)='lon' or left(ls_coltype,3)='dec' or left(ls_coltype,3)='num' then  
					adw_detail.Modify( ls_dw_field_names[i] + ".format='(###)###-####'" )
				end if
			ELSEIF ls_mask[i] = "###-##-####" THEN
//				adw_detail.Modify( ls_dw_field_names[i] + ".EditMask.Mask='###-##-####'")		
				if left(ls_coltype,3)='int' or left(ls_coltype,3)='lon' or left(ls_coltype,3)='dec' or left(ls_coltype,3)='num' then  
					adw_detail.Modify( ls_dw_field_names[i] + ".format='###-##-####'")		
				end if
			ELSEIF ls_mask[i] = "#####-####" THEN
//				adw_detail.Modify( ls_dw_field_names[i] + ".EditMask.Mask='#####-####'" )				
				if left(ls_coltype,3)='int' or left(ls_coltype,3)='lon' or left(ls_coltype,3)='dec' or left(ls_coltype,3)='num' then  
					adw_detail.Modify( ls_dw_field_names[i] + ".format='#####-####'" )				
				end if
			ELSEIF ls_mask[i] = "####" THEN
				li_index = 0
				FOR m = 1880 TO 2050
					li_index++
					adw_detail.SetValue( ls_dw_field_names[i], li_index, String(m) + "~t" + String(m) )
				END FOR
				adw_detail.Modify( ls_dw_field_names[i] + ".Edit.Limit = '4'" )			
//				adw_detail.Modify( ls_dw_field_names[i] + ".ValidationMsg = 'Invalid Year, Select a number between 1880 and 2050.'" )
				adw_detail.Modify( ls_dw_field_names[i] + ".format='yyyy'" )				
			ELSEIF ls_mask[i] = "mm/dd/yyyy" THEN
				//adw_detail.Modify( ls_dw_field_names[i] + ".EditMask.Mask ='mm/dd/yyyy'")
				adw_detail.Modify( ls_dw_field_names[i] + ".Format='mm/dd/yyyy'")
			//	adw_detail.Modify( ls_dw_field_names[i] + ".ValidationMsg = 'Invalid Date, Please reenter.'" ) //maha 092605
			
			ELSEIF ls_mask[i] = "#,##0.00" THEN
				adw_detail.Modify( ls_dw_field_names[i] + ".Format='#,##0'")
			ELSEIF ls_mask[i] = "[general]" THEN
			ELSE
				adw_detail.Modify( ls_dw_field_names[i] + ".Format='"+ls_mask[i]+"'")
			END IF
		END IF
		END IF	
	END IF
END FOR

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-34
//$<add> 01.25.2006 By: Cao YongWang
//$<reason> Performance tuning
//$<modification> Add Appeon Commit label.

gnv_appeondb.of_commitqueue()
///////////If appeongetclienttype() <> 'PB' Then of_dwchild_after_retrieve(adw_detail)

//ls_detail_band_height = String(Integer(adw_detail.Object.DataWindow.Detail.Height) - 200)

//messagebox("ls_detail_band_height",ls_detail_band_height)

adw_detail.SetRedraw(True)

//adw_detail.Modify("create groupbox(band=detail text='End of Detail border='5' color='255' x='1' y='" + ls_detail_band_height + "' height='50' width='3000'  font.face='MS Sans Serif' font.height='-8' font.weight='400'  font.family='2' font.pitch='2' font.charset='0' background.mode='1' background.color='553648127' name=detail_band)"  )


//CREATE ANY SCREEN OBJECTS THAT WERE ADDED
FOR i = 1 TO li_obj_cnt
	if ids_screen_objects.GetItemnumber(i, "object_underline") = 1 then //maha 082305 for use in modify below for underline
		li_uls = 1
	else 
		li_uls = 0
	end if
	ls_obj_type = ids_screen_objects.GetItemString(i, "object_type") 
	ls_obj_name = "object"+String( ids_screen_objects.GetItemNumber(i, "data_view_object_id") )
	ls_width = String( ids_screen_objects.GetItemNumber(i, "object_width") )
	ls_height = String( ids_screen_objects.GetItemNumber(i, "object_height") )
	ls_x = String( ids_screen_objects.GetItemNumber(i, "object_x") )
	ls_y = String( ids_screen_objects.GetItemNumber(i, "object_y") )
	ls_text = ids_screen_objects.GetItemString(i, "object_text") 
	ls_justification = String( ids_screen_objects.GetItemNumber(i, "object_alignment") )
	if long(ls_y) + long(ls_height) > ll_max_height then ll_max_height = long(ls_y) + long(ls_height)  //maha 051205
	//--------------------------- APPEON BEGIN ---------------------------
	//$<add> 2006-08-31 By: Liu HongXin
	//$<reason> Fix defect: display the bold and italic of stand-alone text
	ls_Bold		= String(ids_screen_objects.GetItemNumber(i, "object_bold") )
	ls_italic	= String(ids_screen_objects.GetItemNumber(i, "object_italic") )
	if IsNull(ls_Bold) then ls_Bold = "400"
	if IsNull(ls_italic) then ls_italic = "0"
	//---------------------------- APPEON END ----------------------------

	CHOOSE CASE ls_obj_type
		CASE "B"
			adw_detail.Modify("create groupbox(band=detail text='" + ls_text + "' border='5' color='128' x='" + ls_x + "' y='" + ls_y + "' height='" + ls_height + "' width='" + ls_width + "'  font.face='MS Sans Serif' font.height='-8' font.weight='400'  font.family='2' font.pitch='2' font.charset='0' background.mode='1' background.color='553648127' name=" + ls_obj_name + ")" )
		CASE "T"  //maha 051809 ######
			if ab_screen_painter then
				ls_color = "128"
			else
				ls_color = "0"
			end if
			//--------------------------- APPEON BEGIN ---------------------------
			//$<modify> 2006-08-31 By: Liu HongXin
			//$<reason> 
			/*
			adw_detail.Modify("create text(band=detail text='" + ls_text + "' border='0' color='" + ls_color + "' x='" + ls_x + "' y='" + ls_y + "' height='" + ls_height + "' width='" + ls_width + "'  font.face='MS Sans Serif' font.height='-8' font.weight='400'  font.family='2' font.pitch='2' font.underline='" + string(li_uls) + "' font.charset='0' background.mode='1' background.color='553648127' name=" + ls_obj_name +")" )
			*/
			adw_detail.Modify("create text(band=detail text='" + ls_text + "' border='0' color='" + ls_color + "' x='" + ls_x + "' y='" + ls_y + "' height='" + ls_height + "' width='" + ls_width + "'  font.face='MS Sans Serif' font.height='-8' font.family='2' font.pitch='2' font.underline='" + string(li_uls) + "' font.weight='" + ls_bold + "' font.italic='" + ls_italic + "' font.charset='0' background.mode='1' background.color='553648127' Alignment='"+ls_justification+"' name=" + ls_obj_name + ")" )
			//---------------------------- APPEON END ----------------------------

	END CHOOSE
END FOR
//Start Code Change ---- 01.18.2006 #203 maha


//alan
if as_reportfrom='P' then
	FOR i = 1 TO li_repobj_cnt
		IF ids_report_objects.GetItemString(i, "ismodify") = "0" THEN CONTINUE
		if ids_report_objects.GetItemnumber(i, "object_underline") = 1 then //maha 082305 for use in modify below for underline
			li_uls = 1
		else 
			li_uls = 0
		end if
		ls_visible = ids_report_objects.GetItemstring(i, "visible")
		if ls_visible='N' then
			ls_visible = '0'
		else
			ls_visible = '1'
		end if
		ls_obj_name = ids_report_objects.GetItemstring(i, "object_name")
		ls_width = string(ids_report_objects.GetItemNumber(i, "object_width")) 
		ls_height = string(ids_report_objects.GetItemNumber(i, "object_height")) 
		ls_x = string(ids_report_objects.GetItemNumber(i, "object_x")) 
		ls_y = string(ids_report_objects.GetItemNumber(i, "object_y")) 
		ls_text = ids_report_objects.GetItemString(i, "object_text") 
		ls_justification = string(ids_report_objects.GetItemNumber(i, "object_alignment"))
		if ls_visible='1' then
			if long(ls_y) + long(ls_height) > ll_max_height then ll_max_height = long(ls_y) + long(ls_height)  //maha 051205
		end if
		//--------------------------- APPEON BEGIN ---------------------------
		//$<add> 2006-08-31 By: Liu HongXin
		//$<reason> Fix defect: display the bold and italic of stand-alone text
		ls_Bold		= string(ids_report_objects.GetItemNumber(i, "object_bold"))
		ls_italic	= string(ids_report_objects.GetItemNumber(i, "object_italic"))
		if IsNull(ls_Bold) then ls_Bold = "400"
		if IsNull(ls_italic) then ls_italic = "0"
		
		adw_detail.modify(ls_obj_name+".text='"+ls_text+"'")
		adw_detail.modify(ls_obj_name+".x='"+ls_x+"'")
		adw_detail.modify(ls_obj_name+".y='"+ls_y+"'")
		adw_detail.modify(ls_obj_name+".width='"+ls_width+"'")
		adw_detail.modify(ls_obj_name+".height='"+ls_height+"'")
		adw_detail.modify(ls_obj_name+".Alignment='"+ls_justification+"'")
		adw_detail.modify(ls_obj_name+".font.weight='"+ls_Bold+"'")
		adw_detail.modify(ls_obj_name+".font.italic='"+ls_italic+"'")
		adw_detail.modify(ls_obj_name+".font.underline='"+string(li_uls)+"'")
		adw_detail.modify(ls_obj_name+".visible='"+ls_visible+"'")
	NEXT
end if

//
IF ab_screen_painter THEN //maha 051305 ####
	adw_detail.modify("datawindow.detail.height=2000")
else
	choose case ai_screen_id  
		case  - 20
			ll_max_height = 1480
		case else
			ll_max_height = ll_max_height + 20 
	end choose
	adw_detail.modify("datawindow.detail.height="+string(ll_max_height))
//	messagebox('',ll_max_height)
end if

RETURN ls_return_syntax

end function

on pfc_cst_nv_data_entry_functions.create
call super::create
TriggerEvent( this, "constructor" )
end on

on pfc_cst_nv_data_entry_functions.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event destructor;//--------------------------- APPEON BEGIN ---------------------------
//$<add> 07.26.2007 By: Evan
//$<reason> New feature of import module.
if IsValid(ids_address_lookup) then Destroy ids_address_lookup
//---------------------------- APPEON END ----------------------------
end event

