$PBExportHeader$pfc_n_cst_ai_export_apb.sru
forward
global type pfc_n_cst_ai_export_apb from nonvisualobject
end type
end forward

global type pfc_n_cst_ai_export_apb from nonvisualobject
end type
global pfc_n_cst_ai_export_apb pfc_n_cst_ai_export_apb

type variables
//--------------------------- APPEON BEGIN ---------------------------
//$<add> 2006-12-29 By: Rodger Wu
//$<reason> Added for fix a APB bug.
string is_select_syntax = ""
//---------------------------- APPEON END ----------------------------

//Added for Merge data in Document Manager. 2.6.2007 Henry
// '2'- for merging data in document manager and agreement template
//	'3'- for replacing fields in e-mail template //by Alfee 05.25.2007
// '4'- Export format set to .txt	//08.29.2007 
String is_called_type = '0' 

//Boolean ib_gen_rec_id = FALSE //Gen rec id - Alfee 06.11.2008
Boolean ib_gen_rec_id = True //Modified By Ken.Guo 2010-06-30. Change False to True

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 04.11.2007 By: Jack
//$<reason> 
boolean ib_header = False
datastore ids_export_data 
//---------------------------- APPEON END ----------------------------

boolean ib_nyp_fte = false  //Start Code Change ---- 09.27.2007 #V7 maha

//Start Code Change ----10.22.2008 #V85 maha
n_ds ids_export_flds
n_ds ids_export_hdr
n_ds ids_export_retrieve
n_ds ids_address_lookup
n_ds ids_code_lookup
n_ds ids_dept_chair
n_ds ids_field
n_ds ids_export_dataTemp
n_ds ids_export_equiv_code
n_ds ids_tablepk
//End Code Change---10.23.2008

n_cst_rights invo_rights //Added By Ken.Guo 2011-01-11.

//Added By Ken.Guo 2011-07-21. 
n_cst_array_db inv_arr_db 
String is_client_id[]

Boolean		ib_writefile//if the export data have records it is true , despite isnot it write file to success.  added by gavins 20121011
Boolean 		ib_standard = false 	//Added By Mark Lee 09/05/2013
Boolean		ib_replace_multi_field_symbol  = false											//Added By Mark Lee 07/20/2016
datastore ids_document_export_field //Added By Jay Chen 03-19-2014
string is_get_export_field //Added By Jay Chen 03-19-2014

private:
str_action_item istr_action_item //(Appeon)Harry 2017-04-17 for task747

end variables

forward prototypes
public function string of_date_format (string as_format, datetime as_datetime)
public function string of_get_billing (long al_id, string as_type, string as_field, string as_field_format, string as_syntax)
public function string of_prompt_populate (string as_type, string as_value)
public function string of_prompt_syntax (string as_sql, string as_parm1, string as_parm2, string as_parm3)
public function integer of_export_data (integer ai_export_id, long al_prac_ids[])
public function integer of_get_export_data (long al_export_id, long al_data_id, ref datastore ads_data)
public function string of_custom_name (integer ai_custom, string as_table, datetime adt_date)
public function integer of_create_export_table (integer ai_exp_id, integer ai_save)
public function integer of_export_data_with_text_old (integer ai_export_id, long al_prac_ids[], string as_path, integer ai_save_data, string as_param1, string as_param2, string as_param3)
public function string of_globalreplace (string as_source, string as_old, string as_new, boolean ab_ignorecase)
public subroutine of_bubblesort (ref long al_prac_ids[])
public subroutine of_export_calculatedfield (n_ds ads_export_datatemp, n_ds ads_export_data, string as_format)
public function string of_get_dbtype ()
public subroutine of_replacespecchar (ref string as_string)
public function long of_export_processdefault (n_ds ads_export_hdr, n_ds ads_export_flds, n_ds ads_export_datatemp, n_ds lds_export_data)
public subroutine of_data_format (string as_format, string as_type, ref string as_data)
public function integer of_export_data_with_text (integer ai_export_id, long al_prac_ids[], ref string as_path, integer ai_save_data, string as_param1, string as_param2, string as_param3, integer ai_type, string as_sql)
public function integer of_multi_row (n_ds ads_export, string as_table, integer ai_table, integer ai_col_num[], n_ds ads_exp_fields, long al_prac_ids[], string as_where)
public function integer of_nyp_fte_rows (n_ds ads_rows)
public function string of_strip_char_not_used (string as_strip, string as_string, string as_replace)
public subroutine of_get_sortsel (ref string as_sortsel, string as_delstr)
public function integer of_get_export_data (long al_export_id, long al_data_id[], ref datastore ads_data)
public function integer of_cleanup_ds ()
public function integer of_export_data_with_text_ctx_0305 (integer ai_export_id, long al_prac_ids[], ref string as_path, integer ai_save_data, string as_param1, string as_param2, string as_param3, integer ai_type, string as_sql)
public function integer of_export_data_with_text_ctx (integer ai_export_id, long al_ctx_ids[], ref string as_path, integer ai_save_data, string as_param1, string as_param2, string as_param3, integer ai_type, string as_sql)
public function string of_get_coltype (datastore ads_object, string as_name)
public subroutine of_export_update_table_name ()
public subroutine of_update_export_sqltext (long al_export_id, string as_sql_param, string as_union_sql)
public function integer of_update_export_data (long al_export_id)
public function integer of_run_export (long al_export_id, string as_path, string as_prac_sql, long al_type)
public function integer of_export_data_with_text_ctx (integer ai_export_id, long al_ctx_ids[], ref string as_path, integer ai_save_data, string as_param1, string as_param2, string as_param3, integer ai_type, string as_sql, boolean abn_update_sqltext)
public subroutine of_update_export_data_part (long al_screen, string as_table_name_screen, string as_dataobject, u_dw adw_screen, n_ds ads_export, n_ds ads_export_filter)
public function boolean of_exists_export_table (string as_table)
public function integer of_export_data_with_text_ctx_new (integer ai_export_id, long al_ctx_ids[], ref string as_path, integer ai_save_data, string as_param1, string as_param2, string as_param3, integer ai_type, string as_sql, datastore ads_data)
public subroutine of_batch_update_export_data (string as_filter)
public function integer of_update_export_dddw (long al_view_id, long al_screen_id, string as_dw_syntax)
public function integer of_export_data_with_text_ctx (integer ai_export_id, long al_ctx_ids[], ref string as_path, integer ai_save_data, string as_param1, string as_param2, string as_param3, integer ai_type, string as_sql, boolean abn_update_sqltext, boolean abn_validate_field_sql)
public function integer of_update_export_data (long al_export_id, str_export_columns astr_export_columns)
public subroutine of_update_export_data_part (long al_screen, string as_table_name_screen, string as_dataobject, u_dw adw_screen, n_ds ads_export, n_ds ads_export_filter, str_export_columns astr_export_columns)
public subroutine of_set_replace_multi_field_symbol (boolean abn_replace)
public function integer of_run_export (long al_export_id, string as_path, string as_prac_sql, long al_type, boolean ab_update_sql)
public subroutine of_set_str_action_item (str_action_item astr_action_item)
end prototypes

public function string of_date_format (string as_format, datetime as_datetime);//Start Code Change ---- 07.10.2007 #V7 maha  Copied from version 5 as it was never updated in the new object
string ls_value
datetime ldt_date
string ls_month
string ls_year
string ls_day
string ls_hour
string ls_minute
string ls_second

ldt_date = as_datetime
//--------------------------- APPEON BEGIN ---------------------------
//$<add> 25/04/2007 By: Jervis
//$<reason> 
if isnull(as_datetime) then return ""
//---------------------------- APPEON END ----------------------------

ls_month = string(month(date(ldt_date)))
ls_year = string(year(date(ldt_date)))
if len(ls_month) = 1 then ls_month = "0" + ls_month
ls_day  = string(day(date(ldt_date)))
if len(ls_day) = 1 then ls_day = "0" + ls_day
ls_hour = string(hour(time(ldt_date)))
if len(ls_hour) = 1 then ls_hour = "0" + ls_hour
ls_minute = string(minute(time(ldt_date)))
if len(ls_minute) = 1 then ls_minute = "0" + ls_minute
ls_second = string(second(time(ldt_date))) //maha 121505
if len(ls_second) = 1 then ls_second = "0" + ls_second
	//messagebox("ls_field_format",ls_field_format)
choose case as_format		
	case "yyyymmddhhmm"
		ls_value = ls_year + ls_month + ls_day + ls_hour + ls_minute
	case "yyyy-mm-dd"
		ls_value = ls_year + "-" + ls_month + "-" + ls_day
	case "mm-dd-yyyy"
		ls_value = ls_month + "-" + ls_day  + "-" + ls_year
	case "mm/dd/yyyy"
		ls_value = ls_month + "/" + ls_day  + "/" + ls_year
	case "mm-dd-yy"
		ls_year = mid(ls_year,3,2)
		ls_value = ls_month + "-" + ls_day  + "-" + ls_year
	case "yyyymmdd" //maha 070605
		ls_value = ls_year + ls_month + ls_day		
	case "mm/dd/yy"
		ls_year = mid(ls_year,3,2)
		ls_value = ls_month + "/" + ls_day  + "/" + ls_year
//Start Code Change ---- 11.03.2005 #23 maha
	case "yyyy"
		ls_value = ls_year
//End Code Change---11.03.2005 
	case "yyyymmddhhmmss" //maha 121505
		ls_value = ls_year + ls_month + ls_day + ls_hour + ls_minute + ls_second
	case else
		ls_value = ls_year + "-" +ls_month + "-" +ls_day + " " +ls_hour + ":" +ls_minute
	end choose
			
if isnull(ls_value) then ls_value = ""

return ls_value
end function

public function string of_get_billing (long al_id, string as_type, string as_field, string as_field_format, string as_syntax);//of_get_billing created maha app080205 to get billing add link data 

string ls_val
string ls_sql_syntax
string ls_presentation_str
string ls_dwsyntax_str
string ERRORS
string ls_field
integer r
datetime ldt_value
n_ds lds_billing

//Start Code Change ---- 01.01.2007 #V7 maha
if upper(mid(as_field,1,4)) = 'CODE'  then  //maha 010107
	ls_field = as_field
else
	ls_field =  "pd_address_" + as_field
end if
//End Code Change---01.01.2007
ls_sql_syntax = as_syntax + " rec_id = " + string(al_id) + ";"
ls_presentation_str = "style(type=form)" 
//MessageBox("Field",ls_field)
//MessageBox("Caution",ls_sql_syntax)
ls_dwsyntax_str = SQLCA.SyntaxFromSQL(ls_sql_syntax, ls_presentation_str, ERRORS)
IF Len(ERRORS) > 0 THEN //this will fail if the table has not been completed
	if pos(ERRORS,"Table or view not found",1) > 0 then
		messagebox ("Billing address data store not able to be created", ls_sql_syntax)
		close(w_export_progress)
		return ""
		
	else
		MessageBox("Caution", &
		"SyntaxFromSQL caused these errors: " + ERRORS)
		close(w_export_progress)
		RETURN ""
	end if
END IF
lds_billing = CREATE n_ds
lds_billing.Create( ls_dwsyntax_str, ERRORS)
lds_billing.SetTransObject( SQLCA )
r = lds_billing.retrieve()


if r > 0 then
		choose case upper(mid(as_type,1,1))
			case "N","I"  //number
				ls_val = string(lds_billing.getitemnumber(1, ls_field ))
			case "C","V","L"	//character
				ls_val = lds_billing.getitemString( 1, ls_field )
			case "T"	//datetime
				ldt_value = lds_billing.getitemdatetime(1, ls_field )
				//format the date
				ls_val = of_date_format(as_field_format,ldt_value) //maha 070705
				//messagebox("date value",ls_val)
			case else
				//messagebox("datatype not anticipated",as_type)
  				messagebox("Datatype Not Anticipated",as_type)
				ls_val = ""
		end choose
end if



destroy lds_billing

return ls_val







end function

public function string of_prompt_populate (string as_type, string as_value);
//Start Code Change ---- 11.03.2005 #22 maha
string ls_return

if as_type = "D" then
	//strip date format
	ls_return = mid(as_value,7,10)
elseif as_type = "C" then
	//strip quotes
	ls_return = mid(as_value,2,len(as_value) - 2)
else
	ls_return = as_value
end if
	

return ls_return

//End Code Change---11.03.2005 

end function

public function string of_prompt_syntax (string as_sql, string as_parm1, string as_parm2, string as_parm3);//Start Code Change ---- 11.03.2005  maha
integer li_start
integer li_end
integer li_pos = 1
string ls_sql

ls_sql = as_sql
li_start = pos(Upper(ls_sql),"PROMPT1",li_pos)		//Modify by Scofield on 2007-06-26       	as_sql--->ls_sql
do while li_start > 0
	ls_sql = mid(ls_sql,li_pos,li_start - 1) + as_parm1 + mid(ls_sql,li_start + 7 )
	li_start = pos(Upper(ls_sql),"PROMPT1",li_start)
loop
//Start Code Change ---- 12.01.2006 #V7 maha
li_start = pos(Upper(ls_sql),"PROMPT2",1)				//Modify by Scofield on 2007-06-26       	as_sql--->ls_sql
do while li_start > 0
	ls_sql = mid(ls_sql,1,li_start - 1) + as_parm2 +mid(ls_sql,li_start + 7 )				//Modify by Scofield on 2007-06-26       as_parm1--->as_parm2
	li_start = pos(Upper(ls_sql),"PROMPT2",li_start)
loop

li_start = pos(Upper(ls_sql),"PROMPT3",1)				//Modify by Scofield on 2007-06-26       	as_sql--->ls_sql
do while li_start > 0
	ls_sql = mid(ls_sql,1,li_start - 1) + as_parm3 +mid(ls_sql,li_start + 7 )				//Modify by Scofield on 2007-06-26       as_parm1--->as_parm3
	li_start = pos(Upper(ls_sql),"PROMPT3",li_start)
loop
//End Code Change---12.01.2006

return ls_sql

end function

public function integer of_export_data (integer ai_export_id, long al_prac_ids[]);
////old version; not being used
//
//SetPointer( HourGlass! )
//
//Boolean lb_table_found
//Long ll_fld_val
//Integer i
//Integer li_found_rec
//Integer li_field_width
//Integer p
//Integer li_rec_no
//Integer li_file_num
//Integer li_array_index
//Integer li_search_from_row
//Integer li_prac_id_cnt
//Integer li_table_cnt
//Integer t
//Integer e
//Integer g
//Integer li_data_rc
//Integer li_found_row
//Integer li_fld_cnt
//Integer li_fld_type //maha
//String ls_trail_val
//String ls_lookup_type
//String ls_lookup_code
//String ls_trail_record
//String ls_fixed_width
//String ls_hdr_val
//String ls_hdr_record
//String Errors
//String ls_export_record
//String ls_fld_type
//String ls_fld_delim
//String ls_fld_val
//String ls_lead_trail_char
//String ls_format
//String ls_table_name
//String ls_table_names[]
//String ls_sql_syntax
//String ls_field_name
//String ls_grey
//String ls_presentation_str
//String ls_dwsyntax_str
//String ls_value
//String ls_prac_ids
//n_ds lds_export_hdr
//n_ds lds_export_flds
//n_ds lds_export_data[]
//n_ds lds_code_lookup
//n_ds lds_address_lookup
//
//
//li_prac_id_cnt = UpperBound( al_prac_ids[] )
//
//FOR i = 1 TO li_prac_id_cnt
//	ls_prac_ids = ls_prac_ids + String( al_prac_ids[i] ) + ","
//END FOR
//
//ls_prac_ids = Left( ls_prac_ids, Len( ls_prac_ids ) -1 )
//
//lds_code_lookup = CREATE n_ds
//lds_code_lookup.DataObject = "d_code_lookup"
//lds_code_lookup.of_SetTransObject( SQLCA )
//
//lds_address_lookup = CREATE n_ds
//lds_address_lookup.DataObject = "d_address_lookup"
//lds_address_lookup.of_SetTransObject( SQLCA )
//
//lds_export_hdr = CREATE n_ds
//lds_export_hdr.DataObject = "d_export_hdr"
//lds_export_hdr.of_SetTransObject( SQLCA )
//
//lds_export_flds = CREATE n_ds
//lds_export_flds.DataObject = "d_export_flds_list"
//lds_export_flds.of_SetTransObject( SQLCA )
//
//
//lds_export_hdr.Retrieve( ai_export_id )
//
//li_fld_cnt = lds_export_flds.Retrieve( ai_export_id )
//
//lds_export_flds.SetSort( "export_order" )
//lds_export_flds.Sort(  )
//
//IF lds_export_hdr.GetItemString( 1, "field_labels_as_header" ) = "Y" THEN
//	FOR i = 1 TO li_fld_cnt
//		ls_field_name = Trim( lds_export_flds.GetItemString( i, "export_field_name" ) )
//		ls_hdr_record = ls_hdr_record + ls_field_name + "	"
//	END FOR
//	ls_hdr_record = Left( ls_hdr_record, Len(ls_hdr_record) -1 )	
//ELSE
//	FOR i = 1 TO 4
//		ls_hdr_val = lds_export_hdr.GetItemString( 1, "header" + String( i ) )
//		IF IsNull( ls_hdr_val ) THEN
//			ls_hdr_val = ""
//		END IF
//		ls_hdr_record = ls_hdr_record + ls_hdr_val
//	END FOR
//END IF
//
//FOR i = 1 TO 4
//	ls_trail_val = lds_export_hdr.GetItemString( 1, "footer" + String( i ) )
//	IF IsNull( ls_trail_val ) THEN
//		ls_trail_val = ""
//	END IF
//	ls_trail_record = ls_trail_record + ls_trail_val
//END FOR
//
//
//FileWrite ( li_file_num, ls_hdr_record )
//
////FIND ALL THE TABLES
//FOR i = 1 TO li_fld_cnt
//	ls_table_name = Trim( lds_export_flds.GetItemString( i, "db_table_name" ) )
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
//
////BUILD SELECT 
//
//FOR p = 1 TO li_prac_id_cnt
//	li_found_row = 1
//	li_search_from_row = 1
//	FOR i = 1 TO li_table_cnt
//		ls_sql_syntax = "SELECT "
//		DO 
//			li_found_row = lds_export_flds.Find( "db_table_name = '" + ls_table_names[i] + "'", li_search_from_row, li_fld_cnt )
//			IF li_found_row > 0 THEN
//				ls_field_name = Trim( lds_export_flds.GetItemString( li_found_row, "db_field_name" ) )
//				ls_sql_syntax = ls_sql_syntax + ls_table_names[i] + "." + ls_field_name + ", "
//				li_search_from_row = li_found_row + 1
//			ELSE
//				EXIT
//			END IF
//		LOOP UNTIL li_found_row <= 0 OR li_search_from_row > li_fld_cnt
//	
//		ls_sql_syntax = Left( ls_sql_syntax, Len(ls_sql_syntax) -2 )
//
//
//		//BUILD FROM CLAUSE
//		ls_sql_syntax = ls_sql_syntax + " FROM " + ls_table_names[i]
//
//		//ADD WHERE CLAUSE
//		ls_sql_syntax = ls_sql_syntax + " WHERE " + ls_table_names[i] + ".prac_id  = " + String(al_prac_ids[p])  
//
//		//CREATE SYNTAX FOR DETAIL DW
//		ls_presentation_str = "style(type=form)" 
//
//		ls_dwsyntax_str = SQLCA.SyntaxFromSQL(ls_sql_syntax, ls_presentation_str, ERRORS)
//
//		IF Len(ERRORS) > 0 THEN
//			MessageBox("Caution", &
//			"SyntaxFromSQL caused these errors: " + ERRORS)
//			RETURN -1
//		END IF
//
//		lds_export_data[i] = CREATE n_ds
//		lds_export_data[i].Create( ls_dwsyntax_str, ERRORS)
//		lds_export_data[i].SetTransObject( SQLCA )
//		li_data_rc = lds_export_data[i].Retrieve( )
//	END FOR
//	
//	ls_export_record = ""
//
//	FOR e = 1 TO li_fld_cnt
//		ls_table_name = Trim( lds_export_flds.GetItemString( e, "db_table_name" ) )
//		ls_field_name = Trim( lds_export_flds.GetItemString( e, "db_field_name" ) )
//		li_field_width = lds_export_flds.GetItemNumber( e, "export_field_length" )
//		ls_fld_type = lds_export_flds.GetItemString( e, "db_field_type" )
//		ls_lookup_type = lds_export_flds.GetItemString( e, "db_lookup_type" )
//		ls_lookup_code = lds_export_flds.GetItemString( e, "db_lookup_code" )		
//		ls_lead_trail_char = lds_export_flds.GetItemString( e, "trailing_leading_characters" )		
//		ls_format = lds_export_flds.GetItemString( e, "export_format" )		
//		li_rec_no = lds_export_flds.GetItemNumber( e, "intcred_record_number" )
//		ls_fixed_width = lds_export_flds.GetItemString( e, "export_fixed" )		
//		ls_fld_delim = lds_export_hdr.GetItemString( 1, "field_delimiter" )
//		ls_fld_val = "" 
//		
//		CHOOSE CASE ls_fld_delim
//			CASE "C"
//				ls_fld_delim = ","
//			CASE "T"
//				ls_fld_delim = "	"
//		END CHOOSE
//			
//		FOR g = 1 TO li_table_cnt
//			IF ls_table_name = ls_table_names[g] THEN
//				li_array_index = g
//				EXIT
//			END IF
//		END FOR
//		//messagebox("li_rec_no",li_rec_no)
//		//messagebox("ls_field_name",ls_field_name)
//		IF lds_export_data[ li_array_index ].RowCount() >= li_rec_no THEN
//			CHOOSE CASE Upper( ls_fld_type )
//				CASE "I", "N"
//					ll_fld_val = lds_export_data[ li_array_index ].GetItemNumber( li_rec_no, ls_field_name ) 
//					IF ls_lookup_type = "C" THEN
//						lds_code_lookup.Retrieve( ls_lookup_code )
//						li_found_rec = lds_code_lookup.Find( "lookup_code = " + String( ll_fld_val ), 1, 100000 )
//						IF li_found_rec < 1 THEN
//							ls_fld_val = "Error"
//						ELSE
//							ls_fld_val = lds_code_lookup.GetItemString( li_found_rec, "code" )						
//						END IF
//					ELSEIF ls_lookup_type = "A" THEN
//						lds_address_lookup.Retrieve( ls_lookup_code )
//						li_found_rec = lds_address_lookup.Find( "lookup_code = " + String( ll_fld_val ), 1, 100000 )
//						IF li_found_rec < 1 THEN
//							ls_fld_val = "Error"
//						ELSE
//							ls_fld_val = lds_address_lookup.GetItemString( li_found_rec, "entity_name" )					
//						END IF
//					ELSE	
//						ls_fld_val = String( lds_export_data[ li_array_index ].GetItemNumber( li_rec_no, ls_field_name ) )
//					END IF
//				CASE "C"
//					ls_fld_val = lds_export_data[ li_array_index ].GetItemString( li_rec_no, ls_field_name )
//				CASE "D"				
//					ls_fld_val = String( lds_export_data[ li_array_index ].GetItemDateTime( li_rec_no, ls_field_name ), ls_format )
//			END CHOOSE
//		END IF
//				
//		IF IsNull( ls_fld_val ) THEN
//			ls_fld_val = ""
//		END IF
//
//		CHOOSE CASE ls_format
//			CASE "Trailing Padding"
//				ls_fld_val = ls_fld_val + Fill( ls_lead_trail_char , li_field_width - Len( ls_fld_val ) ) + ls_fld_delim
//			CASE "Leading Padding"
//				ls_fld_val = Fill( ls_lead_trail_char , li_field_width - Len( ls_fld_val ) ) + ls_fld_val + ls_fld_delim
//			CASE ELSE
//				ls_fld_val = ls_fld_val + ls_fld_delim
//		END CHOOSE
//
//		ls_export_record = ls_export_record + ls_fld_val
//		
//	END FOR
//
//	FileWrite ( li_file_num, ls_export_record )
//
//	
//END FOR
//
//FileWrite ( li_file_num, ls_trail_record )
//
//FileClose( li_file_num )
//
//
RETURN 0
end function

public function integer of_get_export_data (long al_export_id, long al_data_id, ref datastore ads_data);//////////////////////////////////////////////////////////////////////
// $<function>w_sheet_ctx_doc_painter/of_get_export_data()
// $<arguments>
//		value    	long     	al_export_id		
//		value    	long     	al_data_id  		ctx_id or prac_id
//		reference	datastore	ads_data    		
// $<returns> integer	1-Successful  0-No export found  -1-Failed
// $<description>
// $<description>
//////////////////////////////////////////////////////////////////////
// $<add> 2006-12-15 by Rodger Wu
//////////////////////////////////////////////////////////////////////
//Overloaded by Alfee on 06.11.2008

Integer li_rtn
Long ll_data_id[]

ll_data_id[1] = al_data_id
li_rtn = of_get_export_data(al_export_id, ll_data_id, ads_data)

RETURN li_rtn


end function

public function string of_custom_name (integer ai_custom, string as_table, datetime adt_date);datetime ldt_now
string ls_ret
string ls_date

ldt_now = adt_date

choose case ai_custom
	case 1 //nyp pems cornell
		ls_date = of_date_format( "yyyymmddhhmmss", adt_date)
		ls_ret = "20200" + "_" + ls_date //Start Code Change ---- 07.26.2006 #609 maha
	case 2 //nyp pems columbia
		ls_date = of_date_format( "yyyymmddhhmmss", adt_date)
		ls_ret = "30200" + "_" + ls_date
	case 3 //file name plus date
		ls_date = of_date_format( "yyyy-mm-dd", adt_date)
		ls_ret = as_table + "-" + ls_date
	case else
		ls_ret = "UNKNOWN"
		
end choose


return ls_ret  	
end function

public function integer of_create_export_table (integer ai_exp_id, integer ai_save);//created 061302  maha

SetPointer( HourGlass! )


Integer i
Integer p
Integer t
Integer e
Integer g
Integer li_found_row
Integer li_fld_cnt
Integer li_fld_len //maha
String ls_table_name
String ls_table_new
String ls_sql_syntax
//String ls_value
string ls_select_field //maha
string ls_select_table //maha
string ls_ft //maha
long ll_find
//n_cst_string lnvo_string//<add> 07/23/2007 by: Andy

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-01
//$<modify> 02.21.2006 By: owen chen
//$<reason> Performance tuning
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

n_ds lds_export_hdr
n_ds lds_export_flds
//comment 08/31/2007 by: Andy
//n_ds lds_export_text
//datawindow lds_export_data
//n_ds lds_code_lookup
//n_ds lds_address_lookup

lds_export_hdr = CREATE n_ds
lds_export_hdr.DataObject = "d_export_hdr"
lds_export_hdr.of_SetTransObject( SQLCA )

lds_export_flds = CREATE n_ds
lds_export_flds.DataObject = "d_export_flds_list_exp"
lds_export_flds.of_SetTransObject( SQLCA )

//comment 08/31/2007 by: Andy
//lds_export_text = CREATE n_ds
//lds_export_text.DataObject = "d_export_flds_list_exp"
//lds_export_text.of_SetTransObject( SQLCA )

gnv_appeondb.of_startqueue( )

lds_export_hdr.Retrieve( ai_exp_id )
li_fld_cnt = lds_export_flds.Retrieve( ai_exp_id )

gnv_appeondb.of_commitqueue( )

li_fld_cnt = lds_export_flds.RowCount()

t = lds_export_hdr.rowcount()
li_fld_cnt = lds_export_flds.rowcount()

if t < 1 then
	messagebox("Problem in of_create_export_table","No return on export header.")
	gnv_debug.of_output(true, 'Alarm  Export: Problem in of_create_export_table","No return on export header.' )//added by gavins 20120912
	//<add> 08/31/2007 by: Andy
	destroy lds_export_hdr
	destroy lds_export_flds
	return -2
end if
//---------------------------- APPEON END ----------------------------

//Added By Mark 06/11/2014
ls_table_name = lds_export_hdr.getitemstring(1,"export_name")

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 05.23.2007 By: Jack
//$<reason> Fix a defect.
If li_fld_cnt < 1 Then 
//	messagebox("Problem in of_create_export_table","No Export Column.")			//Added By Mark 06/11/2014
	messagebox("Problem in of_create_export_table","No column defined in the export "+ls_table_name+' (#'+string(ai_exp_id)+")")
	gnv_debug.of_output(true, 'Alarm  Export: "Problem in of_create_export_table","No column defined in the export "'+ls_table_name+' (#'+string(ai_exp_id)+')" ' ) //added by gavins 20120912
	//<add> 08/31/2007 by: Andy
	destroy lds_export_hdr
	destroy lds_export_flds
	return -1
End If	
//---------------------------- APPEON END ----------------------------

//modify 08/31/2007 by: Andy	
//1:save / 3:save & preview
if ai_save = 1 or ai_save = 3 then
//	ls_table_name = lds_export_hdr.getitemstring(1,"export_name")			//Added By Mark 06/11/2014	//move up	
	//Modify 07/23/2007 by: Andy
	/*
	ls_table_new = ls_table_name
	li_fld_len = len(ls_table_name)
	
	//remove spaces from export name to make table name
	g = pos(ls_table_name," ")
	do while g <> 0
		ls_table_new = mid(ls_table_new,1,g - 1) + "_" + mid(ls_table_name,g + 1)	
	//	messagebox("ls_table_new",ls_table_new)
		g = pos(ls_table_new," ")
	loop
	*/
	//<add> 08/24/2007 by: Andy
	of_replacespecchar(ls_table_name)
	
	//ls_table_name = "exp_" + ls_table_new
	ls_table_name = "exp_" + ls_table_name
	//end of modify
	
	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> PT-02
	//$<add> 02.08.2006 By: Liang QingShi
	//$<reason> Performance tuning
	//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.
	gnv_appeondb.of_startqueue( )
	//---------------------------- APPEON END ----------------------------
	
	//drop table
	ls_sql_syntax = "drop TABLE " +ls_table_name + ";"
	execute immediate :ls_sql_syntax using sqlca;
	commit using sqlca;
	
	//<add> 08/24/2007 by: Andy
	gnv_appeondb.of_commitqueue( )
	
	//build table
	ls_sql_syntax = "CREATE TABLE " +ls_table_name + " ( "

	//--------------------------- APPEON BEGIN ---------------------------
	//$<add> 2006-12-29 By: Rodger Wu
	//$<reason> Added for fix a APB bug.
	is_select_syntax = "select "
	//---------------------------- APPEON END ----------------------------
//add 08/31/2007 by: Andy	
else
	is_select_syntax = "Select top 1 "
end if
//end of add

FOR p = 1 TO li_fld_cnt
	
	li_fld_len = lds_export_flds.getitemnumber(p,"export_field_length")

	ls_select_field = lds_export_flds.getitemstring(p,"export_field_name")
	
	//Added By Jay Chen 03-19-2014
	if is_get_export_field = '1' and ids_document_export_field.rowcount() > 0  then
		ll_find = ids_document_export_field.find("lower(export_field) = '"+lower(ls_select_field)+"'",1, ids_document_export_field.rowcount()) //Modified By Jay Chen 04-28-2014 add lower
		if isnull( ll_find) then ll_find = 0
		if ll_find < 1 then continue
	end if
	//End add
	
	//<add> 08/24/2007 by: Andy
	of_replacespecchar(ls_select_field)
	
	//comment 08/24/2007 by: Andy
	//ls_value = lds_export_flds.getitemstring(p,"field_value")
	//if isnull(ls_value) then ls_value = ""
	
	//modify 08/31/2007 by: Andy
	if ai_save = 1 or ai_save = 3 then
		ls_sql_syntax = ls_sql_syntax + ls_select_field + " VARCHAR(" +  string(li_fld_len) + ")"
		/*comment 07/12/2007 by: Andy 
		if len(ls_value) > 0 then
			ls_sql_syntax = ls_sql_syntax + " DEFAULT '" + ls_value + "'"
		end if
		*/
		//--------------------------- APPEON BEGIN ---------------------------
		//$<modify> 04.22.2006 By: LeiWei
		//$<reason> Fix a defect.
		//$<reason> Due to the default ALLOW_NULLS_BY_DEFAULT option is OFF for JDBC connections
		//ls_sql_syntax = ls_sql_syntax + ", "
		ls_sql_syntax = ls_sql_syntax + " NULL, "
		is_select_syntax += ls_select_field + ", "//rodger wu added.
		//---------------------------- APPEON END ----------------------------
	//add 08/31/2007 by: Andy
	else
		is_select_syntax += "cast('' as varchar(" + String(li_fld_len) + ")) " + ls_select_field + ", "
	end if
	//end of add
next

//modify 08/31/2007 by: Andy
if ai_save = 1 or ai_save = 3 then
	ls_sql_syntax = Left( ls_sql_syntax, Len(ls_sql_syntax) -2 )
	
	ls_sql_syntax = ls_sql_syntax + ", rec_id numeric(8,0), constraint PK_" + ls_table_name + " primary key(rec_id) "
	is_select_syntax += "rec_id"//rodger wu added.
	
	is_select_syntax += " from " + ls_table_name//rodger wu added.
	
	ls_sql_syntax = ls_sql_syntax + ");"
	
	//messagebox("ls_sql_syntax",ls_sql_syntax)
	
	execute immediate :ls_sql_syntax using sqlca;
	//<ADD> 08/24/2007 BY: Andy
	IF SQLCA.SQLcode <> 0 THEN 
		messagebox(gnv_app.iapp_object.DisplayName,"Create table failed.~r~n~n" + SQLCA.SQLErrText)
		gnv_debug.of_output(true, 'Alarm  Export: ' + gnv_app.iapp_object.DisplayName + " Create table failed.~r~n~n" + SQLCA.SQLErrText  )//added by gavins 20120912
		//<add> 08/31/2007 by: Andy
		destroy lds_export_hdr
		destroy lds_export_flds
		return -3
	END IF
	
	commit using sqlca;
//add 08/31/2007 by: Andy
else
	//modify 10.10.2007 by: Andy
	//is_select_syntax += "0 rec_id from ids"
	is_select_syntax = Left( is_select_syntax, Len(is_select_syntax) -2 )
	//----Begin Modified by Alfeee on 06.11.2008------
	//<$Reason>For performance tuning in date alarm
	//is_select_syntax += " from ids"
	if ib_gen_rec_id then 
		is_select_syntax += ", 0 rec_id from ids"
	else
		is_select_syntax += " from ids"
	end if
	//----End Modified -------------------------------
	//end of modify
end if
//end of add

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-03
//$<add> 02.08.2006 By: Liang QingShi
//$<reason> Performance tuning
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.
//comment 08/24/2007 by: Andy 
//gnv_appeondb.of_commitqueue( )
//---------------------------- APPEON END ----------------------------

//	if gi_test_mode = 1 then
//		messagebox("table syntax", ls_sql_syntax)	
//	end if
//

//<add> 08/31/2007 by: Andy
destroy lds_export_hdr
destroy lds_export_flds
	
return 0
end function

public function integer of_export_data_with_text_old (integer ai_export_id, long al_prac_ids[], string as_path, integer ai_save_data, string as_param1, string as_param2, string as_param3);//function built by maha 07-2002

SetPointer( HourGlass! )
if isnull(as_path) or as_path = "" then
	//messagebox("Data Error", "There is no save path for this file. Unable to continue this function.")
	messagebox("Data Error", "There is no save path for this file. Unable to proceed.")
	return 0
//else
//	messagebox("aspath",as_path)
//	return 0
end if
if ai_export_id < 1 then
	//messagebox("User Error", "No export selected.  Unable to continue this function.")
	messagebox("User Error", "No export selected.  Unable to proceed.")
	return 0
end if

open(w_export_progress)
w_export_progress.st_progress.text = "Creating export table"

IF of_create_export_table( ai_export_id,ai_save_data ) < 0 THEN
	close(w_export_progress)
	return 0
END IF

Boolean lb_table_found
boolean lb_export
Long ll_fld_val
Integer i //practitioner
Integer li_found_rec
Integer li_field_width
Integer p // rows in field list as well as column number
Integer li_rec_no
Integer li_file_num
Integer li_array_index
Integer li_search_from_row
Integer li_prac_id_cnt
Integer li_table_cnt
Integer t
Integer e
Integer g
Integer a
integer w
integer sd
Integer li_data_rc
Integer li_found_row
Integer li_fld_cnt
Integer li_filter_cnt
Integer li_text_cnt
Integer li_fld_type //maha
long ll_find_no //maha
Integer li_fld_len //maha
integer li_use_link//maha
integer li_recd_no//maha
integer li_width//maha
integer f//maha
integer li_dif//maha
integer li_facil_id //maha
//integer li_save_data = 0 //maha 021003
integer ud //maha 080103
integer col //maha 080103
integer li_act_format //maha 083105
integer li_multi_table
integer li_custom_save //maha 121205
integer li_multi_field[] //maha121905
integer li_sub_start //maha010306
integer li_fail_count //Start Code Change ---- 06.12.2006 #537 maha
datetime ldt_date //maha
datetime ldt_value //maha
String ls_trail_val
String ls_lookup_type
String ls_db_lookup_type
String ls_lookup_code
String ls_trail_record
String ls_pad
String ls_fixed_width
String ls_hdr_val
String ls_hdr_record
String Errors
String ls_export_record
String ls_export_field
String ls_fld_type
String ls_fld_delim
String ls_fld_val
String ls_lead_trail_char
String ls_format
String ls_table_name
String ls_table_new
String ls_table_names[]
String ls_sql_syntax
String ls_field_name
String ls_grey
String ls_presentation_str
String ls_dwsyntax_str
String ls_value
String ls_data_value
String ls_field_format//maha
String ls_sql //maha
String ls_month //maha
String ls_year //maha
String ls_day  //maha
String ls_hour //maha
String ls_minute //maha
String ls_save_format //maha
String ls_path //maha
integer li_exp_type //maha
integer li_bar_ticks //maha
integer li_billing //maha 080205
String ls_header //maha
String ls_filter //maha
String ls_lookup //maha
String ls_datatype //maha
String ls_prac_ids = ""
string ls_select_field //maha
string ls_prac_field //maha
string ls_select_table_trim //maha
string ls_select_table //maha
string ls_sny_retrieve //maha
string ls_find//maha
string ls_delim_value//maha
string ls_rec_delim//maha
string ls_lu_field//maha
string ls_use_link_sql//maha
string ls_use_link_sql2//maha
string ls_export_text_file = ""//maha
string ls_lookup_val//maha
string ls_save_path//maha
string stax
string s//maha
string ls_aggre//maha 012703
string ls_sort//maha 012703
string ls_dc_field //maha010704
string ls_bill_syn  //maha app080205
string ls_text //maha 120905
string ls_strip_char //maha 120905
string ls_save_name //maha 121205
long ll_prac_row //maha
long ll_ret_cnt
long ll_billing_id //maha app080205
n_ds lds_export_hdr
n_ds lds_export_flds
n_ds lds_export_retrieve
//datawindow lds_export_data
n_ds lds_export_data
n_ds lds_code_lookup
n_ds lds_address_lookup
n_ds lds_dept_chair //maha010704
n_ds lds_billing_address //maha 080205
string ls_def_val

ldt_date = datetime(today(),now()) //maha

li_prac_id_cnt = UpperBound( al_prac_ids[] )
FOR i = 1 TO li_prac_id_cnt //creates string of prac_ids for querys
	ls_prac_ids = ls_prac_ids + String( al_prac_ids[i] ) + ","
END FOR

ls_prac_ids = Left( ls_prac_ids, Len( ls_prac_ids ) -1 ) //remove last comma

lds_code_lookup = CREATE n_ds
lds_code_lookup.DataObject = "d_code_lookup"
lds_code_lookup.of_SetTransObject( SQLCA )

lds_address_lookup = CREATE n_ds
lds_address_lookup.DataObject = "d_address_lookup"
lds_address_lookup.of_SetTransObject( SQLCA )

lds_export_hdr = CREATE n_ds
lds_export_hdr.DataObject = "d_export_hdr"
lds_export_hdr.of_SetTransObject( SQLCA )

lds_export_flds = CREATE n_ds
lds_export_flds.DataObject = "d_export_flds_list_exp"
lds_export_flds.of_SetTransObject( SQLCA )

//lds_export_text = CREATE n_ds
//lds_export_text.DataObject = "d_export_flds_list_exp"
//lds_export_text.of_SetTransObject( SQLCA )

lds_dept_chair = CREATE n_ds //maha 010704
lds_dept_chair.DataObject = "d_dept_chair_exp"
lds_dept_chair.of_SetTransObject( SQLCA )

lds_export_retrieve = CREATE n_ds

lds_export_hdr.Retrieve( ai_export_id )

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 04.25.2007 By: Jack
//$<reason> Fix a defect.
If lds_export_hdr.rowcount() < 1 Then Return -1
//---------------------------- APPEON END ----------------------------
//HEADER INFO
ls_table_name = lds_export_hdr.getitemstring(1,"export_name")
ls_header = lds_export_hdr.getitemstring(1,"field_labels_as_header")//Y or N
ls_format = lds_export_hdr.getitemstring(1,"export_format")
if ls_format = "export"  then //maha 121205
	lb_export = true
	ls_format = ".txt"

elseif ls_format = ".csv" then
	lb_export = false
	//lb_export = false
else //txt and xls files  files
	lb_export = false
end if
li_exp_type = lds_export_hdr.getitemnumber(1,"export_type")
ls_rec_delim = lds_export_hdr.getitemstring(1,"record_delimiter")
ls_save_path = lds_export_hdr.getitemstring(1,"save_path")
//messagebox("ls_save_path",ls_save_path)
ls_table_new = ls_table_name
li_fld_len = len(ls_table_name)
//\/maha 120905
li_multi_table = lds_export_hdr.getitemnumber(1,"multi_row_table")
ls_strip_char = lds_export_hdr.getitemstring(1,"strip_char")
if isnull(ls_strip_char) or len(ls_strip_char) < 1 then ls_strip_char = "NONE"
if ls_format = ".csv" then ls_strip_char = "," //maha 122005
li_custom_save = lds_export_hdr.getitemnumber(1,"custom_save_name") 
if isnull(li_custom_save) then li_custom_save = 0
//\maha 120905

//set record delimiter
choose case ls_rec_delim
	case "C"
		ls_rec_delim = ","
	case "R"
		ls_rec_delim = "~r"
	case "T"
		ls_rec_delim = "	"	
	case "D"
		ls_rec_delim = "~r~r"
	case "U"
	case else
		ls_rec_delim = ""
end choose
if isnull(ls_rec_delim) then ls_rec_delim = ""

if ls_format = ".csv" then ls_rec_delim = "~r"
	
//remove spaces from export name to make table name
ls_table_new = of_strip_char(" ", ls_table_new,"_")
//g = pos(ls_table_new," ")  //maha 121205 replaced with function
//
//do while g <> 0
//	ls_table_new = mid(ls_table_new,1,g - 1) + "_" + mid(ls_table_name,g + 1)	
//	//messagebox("ls_table_new",ls_table_new)
//	g = pos(ls_table_new," ")
//loop

li_fld_cnt = lds_export_flds.Retrieve( ai_export_id )

//CREATE SYNTAX FOR export DW

//Start change by jervis 07.04.2007
//Add for Fix a APB Server bug
/*
ls_sql_syntax = "Select * from exp_" + lower(ls_table_new)
ls_presentation_str = "style(type=form)" 

ls_dwsyntax_str = SQLCA.SyntaxFromSQL(ls_sql_syntax, ls_presentation_str, ERRORS)
*/
ls_presentation_str = "style(type=form)" 

ls_dwsyntax_str = SQLCA.SyntaxFromSQL(is_select_syntax, ls_presentation_str, ERRORS)
// End change

IF Len(ERRORS) > 0 THEN //this will fail if the table creation has not been completed
	if pos(ERRORS,"Table or view not found",1) > 0 then
		messagebox ("Error in of_export_data_with_text","Export data data store not able to be created.~rCheck the following:~rMake sure export field names have no spaces and contain only letters, numbers and underscores, and that all fields have a width.~rYou cannot have duplicate field names~rField names cannot start with a number." )
		close(w_export_progress)
		return -1
		
	else
		MessageBox("Caution", &
		"SyntaxFromSQL caused these errors: " + ERRORS)
		close(w_export_progress)
		RETURN -1
	end if
END IF
lds_export_data = CREATE n_ds
lds_export_data.Create( ls_dwsyntax_str, ERRORS)
lds_export_data.SetTransObject( SQLCA )

w_export_progress.r_bar.Width = 300

w_export_progress.st_progress.text = "Populating Data for " + string(li_prac_id_cnt) + " Practitioners"
li_bar_ticks = 1000 / li_fld_cnt
//POPULATE DATA
//messagebox("li_prac_id_cnt",li_prac_id_cnt)
FOR i = 1 TO li_prac_id_cnt //create rows for all practitioner data
	g = lds_export_data.insertrow(i)
	if g = -1 then messagebox("dw -1","Unable to insert rows")
next
//messagebox("li_fld_cnt",li_fld_cnt)
FOR p = 1 TO li_fld_cnt
//	if p = 100 then
//		
//	end if
	li_width = lds_export_flds.getitemnumber(p,"export_field_length")
	ls_field_format = lds_export_flds.getitemstring(p,"export_format")
	ls_data_value = ""
	ls_value = ""
	ls_lookup_val = ""
	ls_dc_field = "none"
	li_sub_start=  0 //maha 010306
	ud = lds_export_flds.GetItemnumber( p, "use_default" )
	if ud = 1 or ud = 3 then //Start Code Change ---- 05.03.2006 #449 maha
		ls_def_val = lds_export_flds.GetItemString( p, "default_value" )
	elseif ud = 2 then //column default
		col = integer(lds_export_flds.GetItemString( p, "default_value" ))
	else
		ls_def_val = ""
	end if
	w_export_progress.r_bar.Width = w_export_progress.r_bar.Width + li_bar_ticks
//****fixed text
	if lds_export_flds.getitemnumber(p,"export_type") = 2 then //set data for text fields
		ls_select_field = lds_export_flds.getitemstring(p,"export_field_name")
		ls_value = lds_export_flds.getitemstring(p,"field_value")
				
		if isnull(ls_value) then ls_value = ""
			//messagebox("Export Error","The value field for export field" + ls_select_field + " is null.  ~r Correct and rerun export.")
			
		if ls_value = "&TODAY&" then
			ls_value = of_date_format(ls_field_format,ldt_date) //maha 070705 factored
		//elseif ls_value = "&UPDATE&" then
			//select max() into :ldt_value f
		end if
//Start Code Change ---- 11.03.2005 #21 maha  new for prompt values
		string ls_ptype
		ls_ptype = "" //maha 120905
		choose case upper(ls_value)
			case "&PROMPT1&" 
				ls_ptype = lds_export_hdr.getitemstring(1,"prompt_type1")
				ls_value = of_prompt_populate( ls_ptype, as_param1)
			case "&PROMPT2&" 
				ls_ptype = lds_export_hdr.getitemstring(1,"prompt_type2")
				ls_value = of_prompt_populate( ls_ptype, as_param2)
			case "&PROMPT3&"
				ls_ptype = lds_export_hdr.getitemstring(1,"prompt_type3")
				ls_value = of_prompt_populate( ls_ptype, as_param3)
		end choose
		//if the prompt type is date and it is a fixed text, get today() for the value 
		if	ls_ptype = 'D' then
			ldt_date = datetime(date(ls_value),now())
			ls_value = of_date_format(ls_field_format,ldt_date) //format as necessary
		end if
//End Code Change---11.03.2005 		
		
		for i = 1 TO li_prac_id_cnt
			lds_export_data.setitem(i,p,ls_value)
		next
		//w_export_painter.st_field.text = string(p) do not uncomment except for testing maha; will blow in auto export
	//elseif lds_export_flds.getitemnumber(p,"export_type") = 3 then //getting last update date
//*******getting values from data
	else //get FIELDS DATA
		//CREATE SYNTAX FOR each retrieve DW
		ls_export_field = lds_export_flds.getitemstring(p,"export_field_name")
		ls_select_field = Trim( lds_export_flds.GetItemString( p, "db_field_name" ) )
		ls_select_table = Trim( lds_export_flds.GetItemString( p, "db_table_name" ) )
		li_use_link = lds_export_flds.getitemnumber(p,"use_link")
		ls_fld_delim = lds_export_flds.GetItemString( p, "trailing_leading_characters")
		li_recd_no = lds_export_flds.getitemnumber(p,"intcred_record_number")
		li_facil_id = lds_export_flds.getitemnumber(p,"facility_id")
		ls_lu_field = lds_export_flds.GetItemstring( p, "lu_field_name" )
		ls_aggre = lds_export_flds.GetItemstring( p, "aggre_function" )
		ls_sort = lds_export_flds.GetItemstring( p, "sort_by" )
		li_act_format = lds_export_flds.getitemnumber(p,"export_fields_active_yesno")
		ls_text = lds_export_flds.getitemstring(p,"field_value") //maha 091305
		if upper(ls_lu_field) = "LOOKUP CODE" then ls_lu_field = "lookup_code"
		if isnull(ls_lu_field) then ls_lu_field = "code"
		ls_use_link_sql = ""
		ls_use_link_sql2 = ""
		li_sub_start = lds_export_flds.getitemnumber(p,"export_fields_substring_start")//maha 010306
		//messagebox("li_use_link",li_use_link)
		if pos(ls_select_table,"dba.",1) > 0 then //maha 122005 
			ls_select_table_trim = mid(ls_select_table,5) //dropping dba.
			ls_select_table = ls_select_table_trim  //maha 012306
		else
			ls_select_table_trim = ls_select_table
		end if
		ls_filter = lds_export_flds.getitemstring(p,"filter_query")
		li_billing = lds_export_flds.getitemnumber(p,"billing_link") //maha app080205
		if isnull(li_facil_id) then li_facil_id = 0
		if isnull(ls_filter) or ls_filter = "" then 
			ls_filter = ""
		else
			ls_filter = " and  " + ls_filter
			
	//Start Code Change ---- 11.03.2005 #24 maha check filter for prompt values and replace
			integer li_pos1
			li_pos1 = pos(upper(ls_filter),"PROMPT1",1)
			if li_pos1 > 0 then
				ls_filter = mid(ls_filter,1,li_pos1 - 1) + as_param1 + mid(ls_filter,li_pos1 + 7)
			end if
			li_pos1 = pos(upper(ls_filter),"PROMPT2",1)
			if li_pos1 > 0 then
				ls_filter = mid(ls_filter,1,li_pos1 - 1) + as_param2 + mid(ls_filter,li_pos1 + 7)
			end if
			li_pos1 = pos(upper(ls_filter),"PROMPT3",1)
			if li_pos1 > 0 then
				ls_filter = mid(ls_filter,1,li_pos1 - 1) + as_param3 + mid(ls_filter,li_pos1 + 7)
			end if
		end if
	//End Code Change---11.03.2005 	
		//set record delimiter/pad maha 060105
		choose case ls_rec_delim
			case "R" //return
				ls_rec_delim = "~r"
			case "T" //tab
				ls_rec_delim = "	"	
			case "D" //double return
				ls_rec_delim = "~r~n"
			case "S" // space
				ls_rec_delim = " "
			case "E" //empty string
				ls_rec_delim = ""
		end choose
		
		//maha 121205 //overwrite field delim if is a CSV file
		if ls_format = ".csv" then ls_rec_delim = ","
			
		//export_fields_use_link  sql
		if li_use_link = 1 then
			//messagebox("ls_select_table",ls_select_table)
			choose case ls_select_table
				case "pd_address"
					ls_use_link_sql = ",pd_address_link"
					debugbreak()
				case "pd_hosp_affil"
					ls_use_link_sql = ",pd_hosp_facility_link"
				case "pd_board_specialty"
					ls_use_link_sql = ",pd_spec_facility_link"
				case else
					ls_use_link_sql = ""
			end choose
		end if
		ls_sny_retrieve = "Select " + lower(ls_select_table) + ".prac_id, "
		
		if ls_select_table = "pd_address" and li_billing = 1 then //maha app080205
			ls_sny_retrieve = ls_sny_retrieve + " billing_address_id, "
		end if
		
		ls_db_lookup_type = lds_export_flds.GetItemString( p, "db_lookup_type" )
		if ls_select_field = "affiliation_status" then // setting lookup field and where
			//messagebox("ls_lu_field",ls_lu_field )
			ls_sny_retrieve = ls_sny_retrieve + " code_lookup."+ ls_lu_field + " from code_lookup," + lower(ls_select_table) +  ls_use_link_sql + " WHERE " + "(" + lower(ls_select_table) + "." + ls_select_field + " = code_lookup.code) and code_lookup.lookup_name = 'Affiliation Status' and "
			ls_prac_field = ls_select_table_trim + "_prac_id"
			ls_datatype = "C"
//Start Code Change ---- 11.28.2005 #112 maha			
			//if upper(gs_user_id) = "MASTER" then //maha 09-09-02	
				ls_select_field  = "code_lookup_" + ls_lu_field
			//else
			//	ls_select_field  = ls_lu_field
		//	end if
		
//End Code Change---11.28.2005 
		elseif upper(ls_db_lookup_type)  = "C" Then //code lookup table

				//if upper(ls_lu_field) <> "CODE" and ls_lu_field <> "description" and  upper(ls_lu_field) <> "LOOKUP_CODE" then
					//messagebox("ls_lu_field",ls_lu_field) //maha removed 011604  was causing problems with custom fields
//					messagebox("Data Error on field " + ls_export_field ,"The code lookup table name set for export field '" + ls_select_field + "' is improperly set.  This field is a code_lookup table. If using entity_name, change to description.  Please correct.")
//					close(w_export_progress)
//					return 0
					
				//else
					ls_sny_retrieve = ls_sny_retrieve + " code_lookup."+ ls_lu_field + " from code_lookup," + lower(ls_select_table) +  ls_use_link_sql + " WHERE " + "(" + lower(ls_select_table) + "." + ls_select_field + " = code_lookup.lookup_code) and "
					if upper(ls_lu_field) = "LOOKUP_CODE" then
						ls_datatype = "N"
					else
						ls_datatype = "C"
					end if
					ls_prac_field = ls_select_table_trim + "_prac_id"

//Start Code Change ---- 11.28.2005 #112 maha	
					//if upper(gs_user_id) = "MASTER" then //maha 09-09-02	
						ls_select_field  = "code_lookup_" + ls_lu_field
					//else
					//	ls_select_field  = ls_lu_field
					//end if
				//end if
			//end if
//End Code Change---11.28.2005 
		elseif upper(ls_db_lookup_type)  = "A" Then //address lookup table

				if ls_lu_field = "description"  then
					messagebox("Data Error on field " + ls_export_field,"The address lookup field set for export field '" + ls_select_field + "' is improperly set.  You cannot use description, try entity_name.  Please correct.")
					close(w_export_progress)
					return 0
					
				else
					ls_sny_retrieve = ls_sny_retrieve + " address_lookup." + ls_lu_field + " from address_lookup," + lower(ls_select_table) +  ls_use_link_sql + " WHERE " + "(" + lower(ls_select_table) + "." + ls_select_field + " = address_lookup.lookup_code) and "
					if upper(ls_lu_field) = "LOOKUP_CODE" then
						ls_datatype = "N"
					elseif upper(ls_lu_field) = "CUSTOM_1" OR upper(ls_lu_field) = "CUSTOM_2" then //maha 050704 
						ls_datatype = "N"
					else					
						ls_datatype = "C"
					end if
					ls_prac_field = ls_select_table_trim + "_prac_id"
//Start Code Change ---- 11.28.2005 #112 maha
					//if upper(gs_user_id) = "MASTER" then //maha 09-09-02	
						ls_select_field  = "address_lookup_" + ls_lu_field
					//else
					//	ls_select_field  = ls_lu_field
					//end if
//End Code Change---11.28.2005 
				end if
			//end if/
		else // NON LOOKUP FIELDS
			if len(ls_aggre) > 0 then //maha 012703 for aggregate functions still not being used as of 12-05
				ls_sny_retrieve = ls_sny_retrieve + ls_aggre + "("	+ ls_select_table + "." + ls_select_field + ") a" + ls_aggre + " from " + lower(ls_select_table) +  ls_use_link_sql + " WHERE " 
			else
				ls_sny_retrieve = ls_sny_retrieve + ls_select_table + "." +ls_select_field + " from " + lower(ls_select_table) +  ls_use_link_sql + " WHERE " 	
			end if

		//maha 122305	
	 	if gs_dbtype = "ASA" then
			SELECT sys.syscolumns.coltype into :ls_datatype FROM sys.syscolumns, sys.systable  WHERE ( sys.systable.table_name = sys.syscolumns.tname ) and  sys.syscolumns.cname = :ls_select_field and sys.systable.table_name = :ls_select_table_trim;    
		elseif gs_dbtype = "SQL" then
			SELECT v_syscolumns.coltype into :ls_datatype FROM v_syscolumns, v_systable  WHERE ( v_systable.table_name = v_syscolumns.tname ) and  v_syscolumns.cname = :ls_select_field and v_systable.table_name = :ls_select_table_trim;    
		end if

//v_systable.
			//if isnull(ls_datatype) then messagebox("datatype not anticipated","Retrieved null datatype")
 			if isnull(ls_datatype) then messagebox("Datatype Not Anticipated","Retrieved null datatype")
			if li_use_link = 1 then
				ls_prac_field = ls_select_table_trim + "_prac_id"
				//ls_prac_field = "prac_id"
			else
				ls_prac_field = "prac_id"
			end if
		end if
		
		
				//export_fields_use_link  sql
		if li_use_link = 1 then
			choose case ls_select_table
				case "pd_address"
					ls_use_link_sql2 = " (pd_address.rec_id = pd_address_link.address_id) and "
				case "pd_hosp_affil"
					ls_use_link_sql2 = " (pd_hosp_Affil.rec_id = pd_hosp_facility_link.hosp_affil_id) and "
				case "pd_board_specialty"
					ls_use_link_sql2 = " (pd_board_specialty.rec_id = pd_spec_facility_link.specialty_id) and "
				case else
					ls_use_link_sql2 = ""		
			end choose
			if upper(ls_db_lookup_type) = "A" or upper(ls_db_lookup_type) = "C" then
				//ls_select_field = ls_select_field
				//if ls_select_table = "pd_address" or ls_select_table = "pd_hosp_affil"  or ls_select_table = "pd_board_specialty" then
			else	
//Start Code Change ---- 11.28.2005 #112 maha
					//if upper(gs_user_id) = 'MASTER' then
						//ls_select_field = ls_select_table_trim + "_" + ls_select_field
					//else
						ls_select_field = ls_select_field //maha changed to this 121505
				//	end if
				//end if
//End Code Change---11.28.2005 
			end if
		end if
//messagebox("ls_sny_retrieve",ls_sny_retrieve)
		
		ls_sny_retrieve = ls_sny_retrieve + ls_use_link_sql2
		
//		if li_use_link = 1 then
//			if li_facil_id > 0 then
//				choose case ls_select_table
//					case "pd_address"
//						ls_sny_retrieve = ls_sny_retrieve + "(pd_address_link.facility_id = " + string(li_facil_id) + ") and "
//					case "pd_hosp_affil"
//						ls_sny_retrieve = ls_sny_retrieve + "(pd_hosp_facility_link.facility_id = " + string(li_facil_id) + ") and "
//					case "pd_board_specialty"
//						ls_sny_retrieve = ls_sny_retrieve + "(pd_spec_facility_link.facility_id = " + string(li_facil_id) + ") and "
//	
//				end choose			
//				//ls_sny_retrieve = ls_sny_retrieve + "(facility_id = " + string(li_facil_id) + ") and "
//			end if
//		end if
		
		//add facility where
		if li_facil_id > 0 then
			choose case ls_select_table
				case "pd_address"
					ls_sny_retrieve = ls_sny_retrieve + "(pd_address_link.facility_id = " + string(li_facil_id) + ") and "
				case "pd_hosp_affil"
					ls_sny_retrieve = ls_sny_retrieve + "(pd_hosp_facility_link.facility_id = " + string(li_facil_id) + ") and "
				case "pd_board_specialty"
					ls_sny_retrieve = ls_sny_retrieve + "(pd_spec_facility_link.facility_id = " + string(li_facil_id) + ") and "
				case "pd_affil_stat"
					ls_sny_retrieve = ls_sny_retrieve + "(pd_affil_stat.parent_facility_id = " + string(li_facil_id) + ") and "
				case else
					ls_sny_retrieve = ls_sny_retrieve +  + "(" + ls_select_table + ".facility_id = " + string(li_facil_id) + ") and "


			end choose
		end if
			
		//3rd last add  - prac where
		ls_bill_syn = ls_sny_retrieve //maha app080205
		ls_sny_retrieve = ls_sny_retrieve + lower(ls_select_table) + ".prac_id  in (" + ls_prac_ids  + ")"  + ls_filter
		
		//2nd last add  - prac where
		if len(ls_aggre) > 0 then //maha 012703 for aggregate functions
			ls_sny_retrieve = ls_sny_retrieve + " Group by " + lower(ls_select_table) + ".prac_id" + " , a" + ls_aggre
		end if

		//last add - order by
		ls_sny_retrieve = ls_sny_retrieve + " order by " + lower(ls_select_table) + ".prac_id"
		//aggre order
		if len(ls_aggre) > 0 then //maha 012703 for aggregate functions
			ls_select_field = "a" + ls_aggre //changing field name to what the aggregate field was called in the select
			ls_sny_retrieve = ls_sny_retrieve + " , " + ls_select_field
		end if
		//order
		if len(ls_sort) > 0 then //maha 022503 for sort by
			ls_sny_retrieve = ls_sny_retrieve + " , " + ls_sort
		end if
if gi_test_mode = 1 then		
	//openwithparm(w_sql_msg,ls_sny_retrieve)
end if
//messagebox("ls_sny_retrieve",ls_sny_retrieve)		
	
	
	
	//create the field datastore
		ls_presentation_str = "style(type=grid)"		

		ls_dwsyntax_str = SQLCA.SyntaxFromSQL(ls_sny_retrieve, ls_presentation_str, ERRORS)
		IF Len(ERRORS) > 0 THEN
			MessageBox("Caution on export field " + ls_export_field, &
			"SyntaxFromSQL caused these errors: " + ERRORS + "~r~r" + ls_sny_retrieve)
		//	MessageBox("ls_select_table",ls_select_table)
			close(w_export_progress)
			RETURN -1
		END IF
		lds_export_retrieve = CREATE n_ds
		w = lds_export_retrieve.Create( ls_dwsyntax_str, ERRORS)
		if w < 1 then
			//messagebox("error on create",errors)
 			messagebox("Error on Create",errors)
			close(w_export_progress)
			return -1
		end if
		lds_export_retrieve.SetTransObject( SQLCA )
		ll_ret_cnt = lds_export_retrieve.retrieve()
//stax = lds_export_retrieve.Object.DataWindow.Syntax
//messagebox("",stax)

//%%%%%%%%%%%%%%%%%%%%%%%%%%%% end of create syntax


		FOR i = 1 TO li_prac_id_cnt //get each prac data
			w_export_progress.st_export.text = string(p) + "   " + ls_select_table + "_" + ls_select_field    //maha 091002
			w_export_progress.st_export1.text = ls_select_field    // maha 091002

			//find data row for each practitioner
			ls_data_value = ""
			ls_value = ""
			ls_lookup_val = ""
			ldt_value = datetime(date("0000-00-00"),time("00:00:00"))
			ls_prac_field = lds_export_retrieve.describe("#1.name") //121905
			ls_find = ls_prac_field + " = " + string(al_prac_ids[i]) //create find string
						
			ll_find_no = 0
			//messagebox("ls_find",ls_find)

			//loop through the list of retrieved records to get the proper occurence number of the record (2nd record - second occurence if exists)
			for f = 1 to li_recd_no //get the correct record number value
				if ll_find_no < ll_ret_cnt then  //trap if the previous found record is the last row
					ll_prac_row = lds_export_retrieve.Find ( ls_find, ll_find_no + 1, ll_ret_cnt )
					ll_find_no = ll_prac_row //sets the start for find with record no greater than 1
				else
					ll_prac_row = 0
				end if
				if ll_find_no = 0 then
					exit
//					messagebox("record ",li_recd_no)
//					messagebox("ll_prac_row ",ll_prac_row)
				end if
			next
			//for ll_prac_row = 1 to lds_export_retrieve.rowcount()
				//ls_data_value = ""
				if ll_prac_row < 0 then //errors
					lds_export_retrieve.setcolumn(1)
					string fname
					fname = lds_export_retrieve.getcolumnname()
					messagebox("Find error on " + ls_select_field,string(ll_prac_row) + "~r" + ls_sny_retrieve + " ~r~r" + "find syntax:~r" + ls_find + " ~rDW column name is " + fname)
					close(w_export_progress)
					return 0
					
				elseif ll_prac_row > 0 then 
					if li_billing = 1 then //maha app080205 to get billing address data 
						ll_billing_id = lds_export_retrieve.getitemnumber(ll_prac_row, "pd_address_billing_address_id" )
						ls_data_value = of_get_billing(ll_billing_id,ls_datatype,ls_select_field,ls_field_format,ls_bill_syn)
						//messagebox("ls_data_value", ls_data_value )
					else
					//if lds_export_retrieve.getitemnumber(ll_prac_row,ls_prac_field) = al_prac_ids[1] then
						choose case upper(mid(ls_datatype,1,1))
							case "N","I"  //number
								ls_data_value = string(lds_export_retrieve.getitemnumber(ll_prac_row, 2))
							case "C","V","L"	//character
								//messagebox("ls_select_field",ls_select_field)
								//error.number = 0
								ls_data_value = lds_export_retrieve.getitemString( ll_prac_row, 2 )
								//if IsNull( ls_data_value ) then ls_data_value = "<Data=NULL>"
								//if error.number = 6 then MessageBox( "Invalid Column? " + ls_select_field, "Invalid row? " + string( ll_prac_row ) )
							case "T", "D"	//datetime //Start Code Change ---- 07.05.2007 #V7 maha  D added for SQL server
								ldt_value = lds_export_retrieve.getitemdatetime(ll_prac_row, 2 )
								//format the date
								ls_value = of_date_format(ls_field_format,ldt_value) //maha 070705
									//messagebox("date value",ls_value)
								ls_data_value = string(ls_value)
								//end if
							case else
								//messagebox("datatype not anticipated",ls_datatype)
  								messagebox("Datatype Not Anticipated",ls_datatype)
								ls_data_value = ""
						end choose
					end if
				else 	//ll_prac_row = 0 //if no record found //moved 082202
//					if lds_export_flds.GetItemnumber( p, "use_default" ) = 1 then
//						ls_data_value = lds_export_flds.GetItemString( p, "default_value" )
//					end if
				end if
			//next
			//messagebox("ls_data_value",ls_data_value)
			if ls_format = "export" then
				if isnull(ls_data_value) then ls_data_value = ""
			end if

			//***address format
			if ls_field_format = "(xxx)xxx-xxxx" then
				w = len(ls_data_value)
				if w > 0 then //maha 82202
					for a = w to 1 step - 1 //strip existing format
						if not isnumber(mid(ls_data_value,a,1)) then							
							ls_data_value = mid(ls_data_value,1,a - 1 ) + mid(ls_data_value,a + 1 )
						end if					
					next
					//messagebox("ls_data_value stripped",ls_data_value)
					ls_data_value = "(" + mid(ls_data_value,1,3 ) + ")" + mid(ls_data_value,4,3 ) + "-" + mid(ls_data_value,7,4 )
					//messagebox("ls_data_value reformed",ls_data_value)	
				end if
			end if
				
			//*****GET EXPORT CODES
			if lds_export_flds.GetItemnumber( p, "export_code" )  = 1 then //get export code if required
				ls_lookup_val = ls_data_value    //lds_export_data.getitemstring(i,p) //changed 100102
				//if isnull(ls_lookup_val) then ls_lookup_val = "0000000"
				//messagebox("ls_lookup_val",ls_lookup_val)
				select equiv_code into :ls_value from export_equiv_code where export_id = :ai_export_id and lookup_code =  :ls_lookup_val ;
				if not isnull(ls_value) then ls_data_value = ls_value //if no export code use org value
				if isnull(ls_data_value) then ls_data_value = ""
			end if				
				


			
//****Dept Chair data  maha 010704
			ls_dc_field = lds_export_flds.GetItemstring( p, "dept_sect_field" )
			//messagebox("ls_dc_field",ls_dc_field)
			if ls_dc_field = 'none' or isnull(ls_dc_field) then 
				//skip
			else  //if set to a field name get the data
				if isnumber(ls_data_value) then
					//messagebox("ls_dc_field","is number")
					if lds_dept_chair.retrieve(li_facil_id,long(ls_data_value)) > 0 then
						//messagebox("ls_dc_field","retieved")
						ls_data_value = lds_dept_chair.getitemstring(1,ls_dc_field)
					else
						ls_data_value = ""
					end if
				end if
				
			end if
//Active Status format for affil stat maha 083105
			if lds_export_flds.getitemnumber(p,"intcred_field") = 100000 then
				if li_act_format = 1 then
					if ls_data_value = "1" then
						ls_data_value = "Y"
					else
						ls_data_value = "N"
					end if
				elseif li_act_format = 2 then	
					choose case ls_data_value
						case "1"
							ls_data_value = "Active"
						case "2"
							ls_data_value = "Purge"
						case "3"
							ls_data_value = "Inactive"
						case "4"
							ls_data_value = "Pending"
						case "0"
							ls_data_value = "History"
					end choose
				end if
			end if
			
//*** substring function***************************maha 010305
			if li_sub_start > 1 then ls_data_value = mid(ls_data_value,li_sub_start,li_width)

			//***padding //note if avoid using return, double return, empty string or tab when padding
			ls_data_value = mid(ls_data_value,1,li_width) //shrink the length to size 
			if ls_field_format = "Leading Padding" or ls_field_format = "Trailing Padding" then 
				if li_width - len(ls_data_value) > 0 then
					li_dif = li_width - len(ls_data_value)
					ls_pad = "" //reset
					for a = 1 to li_dif  //pad field to width if required
						ls_pad = ls_pad + ls_fld_delim 
					next
					if ls_field_format = "Leading Padding" then
						ls_data_value = ls_pad + ls_data_value 
					else
						ls_data_value = ls_data_value + ls_pad
					end if
				end if
			elseif ls_field_format = "use text" then //allows a set value if data is found
				if len(ls_data_value) > 0 then
					ls_data_value = ls_text
				end if
			end if	

//****set default moved here 091305
			if ud > 0 then
				//Start Code Change ---- 05.03.2006 #449 maha
				if ud = 3 then
					ls_data_value = ls_def_val + ls_data_value
				end if
				//End Code Change---05.03.2006
				if isnull(ls_data_value) then ls_data_value = ""
				//messagebox(string(al_prac_ids[i]),ls_data_value)
				if ls_data_value = "" then
					//messagebox("is default","1")
					if ud = 1 then
						ls_data_value = ls_def_val
					elseif ud = 2 then //if set to column get the value out of that column
						if col < 1 or col > li_fld_cnt then //setting trap
							messagebox("Invalid setting","You are using a column default for column " + string(p) + " , but your default value is not a valid column number.~rThe default column number must be less than this column.")
							close(w_export_progress)
							return 0
						end if
						ls_data_value = lds_export_data.getitemstring(i,col)
					//	messagebox("al_prac_ids[i]",al_prac_ids[i])
					end if
				end if
			end if
			
	//*********value set**********
			if ls_strip_char <> "NONE" then
				ls_data_value = of_strip_char( ls_strip_char ,ls_data_value, "")
			end if
			lds_export_data.setitem(i,p,ls_data_value)
			
			

		next
	end if
next
//messagebox("","done populating")


//@@@@@@@@@@@@@@@@@@@multi row function @@@@@@@@@@@@@@@@

if li_multi_table > 0 then
	w = 1
	for a = 1 to li_fld_cnt  //get list of fields
		if lds_export_flds.getitemnumber(a,"intcred_table") = li_multi_table then
			li_multi_field[w] = a
			w++
		end if
	
	next
	of_multi_row(lds_export_data,"not used",li_multi_table,li_multi_field[],lds_export_flds,al_prac_ids[],"")
	
end if

//end multi row


if ai_save_data = 1 then //maha 021003
	w_export_progress.st_progress.text = "Saving File"
	w_export_progress.r_bar.Width = 500
	FOR i = 1 TO li_prac_id_cnt
		lds_export_data.setitem(i,"rec_id",al_prac_ids[i])
	next
	w_export_progress.r_bar.Width = 1000
	sd = lds_export_data.update()
	if sd < 1 then
		messagebox("Save error","Unable to save data to table")
	end if
	commit using sqlca;
end if


//******************************* CREATE FILE
w_export_progress.st_progress.text = "Creating File"
w_export_progress.r_bar.Width = 300
li_bar_ticks = 1000 / li_prac_id_cnt

//w_dw_view.dw_1.settransobject(sqlca)

//\/maha 121205 moved out of first portion of if statement below; rebuilt file naming

ls_save_path = as_path
//create name of file
if mid(ls_save_path,len(ls_save_path),1) <> "\" then //maha app 102405 if a file name is indicated do not tack on the table name
	ls_path = ls_save_path + ls_format
else
	if li_custom_save > 0 then  //maha new 121205 for custom naming of file
		ls_save_name = of_custom_name(li_custom_save,ls_table_name,ldt_date)
	else
		ls_save_name = ls_table_name
	end if
	ls_path = ls_save_path + ls_save_name + ls_format
end if
//messagebox("ls_path",ls_path)

//Added By Ken.Guo 2011-01-11.
If invo_rights.of_check_dir_right( Mid(ls_path, 1, LastPos(ls_path,'\')) ) <> 1 Then
	if li_custom_save > 0 then  //maha new 121205 for custom naming of file
		ls_save_name = of_custom_name(li_custom_save,ls_table_name,ldt_date)
	else
		ls_save_name = ls_table_name
	end if	
	ls_path = gs_dir_path + gs_DefDirName + "\ExportData\" + ls_save_name + ls_format
End If



if lb_export = false then  //if the auto export path is blank use the export path, if blank use the hard coded path
	//messagebox("ls_path",ls_path)li_custom_save  ls_save_name
	choose case ls_format
		case ".txt" //tab delimited
			if ls_header = "1" then 
				g = lds_export_data.saveas(ls_path,text!,true)
			else
				g = lds_export_data.saveas(ls_path,text!,false)
			end if
		case ".xls" //excel
			if ls_header = "1" then 
				g = lds_export_data.saveas(ls_path,excel!,true)
			else
				g = lds_export_data.saveas(ls_path,excel!,false)
			end if
		case ".csv" //excel
			if ls_header = "1" then 
				g = lds_export_data.saveas(ls_path,csv!,true)
			else
				g = lds_export_data.saveas(ls_path,csv!,false)
			end if
	end choose
	
	if g = -1 then messagebox("saveas -1","Unable to save file.  Check path (" + ls_path + ") and make sure a copy of the file is not open.")
else //export and csv files
	//build export text file

 	//messagebox("ls_format",ls_format)
	li_file_num = FileOpen(ls_path, lineMode!, Write!, LockWrite!, Replace!)//maha changed to line mode 091002
	
	for i = 1 to li_prac_id_cnt
		//messagebox("export test",i)
		//for each practitioners' record, create a string with the data values and 
		//delimiters and write to the file one row at a time
		w_export_progress.r_bar.Width = w_export_progress.r_bar.Width + li_bar_ticks
		
		ls_export_text_file = ""
		
		for p = 1 to li_fld_cnt
			ls_data_value = lds_export_data.Getitemstring(i,p)
			ls_fld_delim = lds_export_flds.GetItemString( p, "trailing_leading_characters")
			ls_field_format = lds_export_flds.getitemstring(p,"export_format")
//Start Code Change ---- 01.23.2006 #210 maha			
			if isnull(ls_data_value) then ls_data_value = ""  //maha 012306 added trap
//				messagebox(string(i),string(p))
//				return -1
//			end if
//End Code Change---01.23.2005 
			//maha 121205 in a csv file force all field delimiters to comma
			if ls_format = ".csv" then	
				ls_fld_delim = "," 
				ls_rec_delim = ""
			end if
			ls_field_format = lds_export_flds.getitemstring(p,"export_format")
			choose case ls_fld_delim
				case "E" //empty String
					ls_delim_value = ""
				case "S" // space
					ls_delim_value = " "
				case "T" //tab
					ls_delim_value = "	"
				case "R" //return
					ls_delim_value = "~r"	
				case "D" //return
					ls_delim_value = "~r~n"
				case else
					ls_delim_value = ls_fld_delim
			end choose
			if isnull(ls_delim_value) then ls_delim_value = ""
			if ls_field_format = "Leading Padding" or ls_field_format = "Trailing Padding" then //don't add delimit value
				ls_export_text_file = ls_export_text_file + ls_data_value
			else
				if ls_format = ".csv"  and p = li_fld_cnt then
					//messagebox("","csv")//skip last delim
				else
					ls_export_text_file = ls_export_text_file + ls_data_value + ls_delim_value
				end if
			end if
			
		next
		
		ls_export_text_file = ls_export_text_file + ls_rec_delim
		p = 1
		//messagebox("export test",ls_export_text_file)
		//following for line mode //set 091002
		
		//Start Code Change ---- 06.12.2006 #537 maha
			g = FileWrite ( li_file_num, ls_export_text_file)
			if g = -1 then 
				messagebox("File write error record # " + string(i) ,"Unable to write to file " + ls_path + " .")
				li_fail_count++
			end if
			
			
			if li_fail_count = 3 then 
				messagebox("File write error" ,"Repeted fail to write to file " + ls_path + " .  Aborting export write.  Check directory/file permissions.")
				exit
			end if
		//End Code Change---06.12.2006
		
	next
	

//	if gi_test_mode = 1 then
//		messagebox("export test",ls_export_text_file) 
//	end if
	
//	li_file_num = FileOpen(as_path + ls_table_name + ".txt", LineMode!, Write!, LockWrite!, Replace!)
	//streammode
		//FileWrite ( li_file_num, ls_export_text_file)
		
	fileclose(li_file_num)
	
end if

if ai_save_data > 1 then //this does not work
	//run(ls_path)
end if

//destroy the ds
destroy lds_export_flds
destroy lds_export_hdr
destroy lds_address_lookup
destroy lds_code_lookup
destroy lds_export_data
destroy lds_dept_chair

close(w_export_progress)

return 1

//messagebox("","Export Completed")
//

end function

public function string of_globalreplace (string as_source, string as_old, string as_new, boolean ab_ignorecase);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GlobalReplace
//
//	Access:  		public
//
//	Arguments:
//	as_Source		The string being searched.
//	as_Old			The old string being replaced.
//	as_New			The new string.
// ab_IgnoreCase	A boolean stating to ignore case sensitivity.
//
//	Returns:  		string
//						as_Source with all occurrences of as_Old replaced with as_New.
//						If any argument's value is NULL, function returns NULL.
//
//	Description:  	Replace all occurrences of one string inside another with
//						a new string.
//
//////////////////////////////////////////////////////////////////////////////
//
//<add> 07/17/2007 by: Andy
//
//////////////////////////////////////////////////////////////////////////////
Long	ll_Start
Long	ll_OldLen
Long	ll_NewLen
String ls_Source
String  ls_Temps,ls_Tempe

//Check parameters
If IsNull(as_source) or IsNull(as_old) or IsNull(as_new) or IsNull(ab_ignorecase) Then
	string ls_null
	SetNull(ls_null)
	Return ls_null
End If

//Get the string lenghts
ll_OldLen = Len(as_Old)
ll_NewLen = Len(as_New)

//Should function respect case.
If ab_ignorecase Then
	as_old = Lower(as_old)
	ls_source = Lower(as_source)
Else
	ls_source = as_source
End If

//Search for the first occurrence of as_Old
ll_Start = Pos(ls_Source, as_Old)

Do While ll_Start > 0
	ls_Temps = Mid(as_Source,ll_Start - 1,1)
	ls_Tempe = Mid(as_Source,ll_Start + ll_OldLen,1)
	if (ll_Start = 1  or ls_Temps = ' ' or ls_Temps = ')' or ls_Temps = '(' or ls_Temps = '+' or ls_Temps = '-' or ls_Temps = '*' or ls_Temps = '/' or ls_temps = ',') and &
		(ls_Tempe = '' or ls_Tempe = ' ' or ls_Tempe = ')' or ls_Tempe = '(' or ls_Tempe = '+' or ls_Tempe = '-' or ls_Tempe = '*' or ls_Tempe = '/' or ls_tempe = ',') then
		// replace as_Old with as_New
		as_Source = Replace(as_Source, ll_Start, ll_OldLen, as_New)
	end if
	
	//Should function respect case.
	If ab_ignorecase Then 
		ls_source = Lower(as_source)
	Else
		ls_source = as_source
	End If
	
	// find the next occurrence of as_Old
	ll_Start = Pos(ls_Source, as_Old, (ll_Start + ll_NewLen))
Loop

Return as_Source

end function

public subroutine of_bubblesort (ref long al_prac_ids[]);//////////////////////////////////////////////////////////////
//Function :of_bubblesort(long al_prac_ids[]) returns none
//arguments:long al_prac_ids[]
//describe :bubble sort the al_prac_ids array
//developer:Andy 
//date     :08/14/2007
/////////////////////////////////////////////////////////////
long    ll_i,ll_j,ll_n,ll_temp
boolean lb_flag

ll_n = UpperBound(al_prac_ids)
for ll_i = 1 to ll_n - 1
	lb_flag = false
	for ll_j = ll_n - 1 to ll_i step -1 
		if al_prac_ids[ll_j + 1] < al_prac_ids[ll_j] then
			ll_temp = al_prac_ids[ll_j + 1]
			al_prac_ids[ll_j + 1] = al_prac_ids[ll_j]
			al_prac_ids[ll_j] = ll_temp
			lb_flag = true
		end if
	next
	if Not lb_flag then
		exit
	end if
next
//end of BubbleSort
end subroutine

public subroutine of_export_calculatedfield (n_ds ads_export_datatemp, n_ds ads_export_data, string as_format);//////////////////////////////////////////////////////////////////////
//function :of_export_CalculatedField
//arguments:ads_export_dataTemp <n_ds>
//          ads_export_data     <n_ds>
//return   :None
//describe :
//move from of_export_data_with_text_ctx by: Andy 08/22/2007 
//set Calculated field value and format into ads_export_data 
//with the relative computer column in ads_export_dataTemp
//////////////////////////////////////////////////////////////////////

Long   ll_Cnt,ll_Tab,li_width,ll_pos1,ll_pos2,ll_pos3,ll_Num,ll_Start = 1
Long   w,a,li_dif
String ls_Objects,ls_objname,ls_ObjType,ls_ColType,ls_Field,ls_tag
String ls_field_format,ls_ComputerDataType,ls_fld_delim,ls_data_value
String ls_pad,ls_text

if Not isValid(ads_export_dataTemp) or Not isValid(ads_export_data) then return

//<add> 08/22/2007 by: Andy Reason:use PFC function
ads_export_dataTemp.of_setbase(true) 

ll_Cnt = ads_export_dataTemp.RowCount()
ls_Objects=ads_export_dataTemp.describe("DataWindow.Objects") + '~t'

ll_Tab =  Pos(ls_Objects, "~t", ll_Start)
DO WHILE ll_Tab > 0
	ls_objname  = Mid(ls_Objects, ll_Start, (ll_Tab - ll_Start))
	ls_ObjType  = ads_export_dataTemp.Describe(ls_objname + ".type")
	ls_ColType  = ads_export_dataTemp.Describe(ls_objname + ".ColType")
   
	if lower(ls_ObjType) = 'compute' then
		//relative column
		ls_Field = left(ls_objname,len(ls_objname) - 2)
		//<add> 08/23/2007
		if IsValid(w_export_progress) then
			w_export_progress.st_export.text  = ls_Field
			w_export_progress.st_export1.text = ls_Field  
		end if
		
		//get format,data type,width and delim
		ls_tag   = ''
		ls_tag   = ads_export_dataTemp.Describe(ls_objname + ".tag")
		if isnull(ls_tag) then ls_tag = ''

		ls_field_format = ''
		ls_ComputerDataType = ''
		li_width = 0
		ls_fld_delim = ''
		
		ll_pos1             = pos(ls_tag,'@^@')
		ll_pos2             = pos(ls_tag,'@^@',ll_pos1 + 3)
		ll_pos3             = pos(ls_tag,'@^@',ll_pos2 + 3)
		
		ls_field_format     = left (ls_tag,ll_pos1 - 1)
		ls_ComputerDataType = mid(ls_tag,ll_pos1 + 3,ll_pos2 - (ll_pos1 + 3))
		li_width            = Long(mid(ls_tag,ll_pos2 + 3,ll_pos3 - (ll_pos2 + 3)))
 		ls_fld_delim        = right(ls_tag,len(ls_tag) - ll_pos3 - 3)
		
		//<add> 06.13.2007 by: Andy Reason:fixed a bug		
		Choose Case Left ( ls_ColType , 5 )
			Case "char(", "char"
				ls_ComputerDataType = "S"
			Case "date"	,"datet"	,"time", "times"
				ls_ComputerDataType = "D"
			Case "decim","numbe", "doubl", "real","long", "ulong", "int"
				ls_ComputerDataType = "N"
		End Choose	
		//end of add
		
		//data transfer
		for ll_Num = 1 to ll_Cnt
			//get data
			//<add> 08/22/2007 by: Andy Reason:use PFC function
			ls_data_value = ads_export_dataTemp.inv_base.of_getitem(ll_Num,ls_objname)
			
			//comment 08.31.2007 by: Andy
			/*
			if upper(ls_ComputerDataType) = 'N' then 
				if long(ls_data_value) = 0 then setnull(ls_data_value)
			end if
			*/
			//<add> andy 2007.06.01 set value into the relative computer column 
			ads_export_dataTemp.SetItem(ll_Num,ls_Field,ls_data_value)
			//end of add
			
			//deal with format
			If as_format = "export" Then
				If IsNull(ls_data_value) Then ls_data_value = ""
			End If
			
			//<add> 08/28/2007 by: Andy
			of_data_format(ls_field_format,ls_ComputerDataType,ls_data_value)
			//end of add
			
			/*comment 08/28/2007 by:Andy Reson:use of_data_format function
			If ls_field_format = "(xxx)xxx-xxxx" Then
				w = Len(ls_data_value)
				If w > 0 Then 
					For a = w To 1 Step - 1 
						If Not IsNumber(Mid(ls_data_value,a,1)) Then
							ls_data_value = Mid(ls_data_value,1,a - 1 ) + Mid(ls_data_value,a + 1 )
						End If
					Next
					ls_data_value = "(" + Mid(ls_data_value,1,3 ) + ")" + Mid(ls_data_value,4,3 ) + "-" + Mid(ls_data_value,7,4 )
				End If
			End If
	
			If ls_field_format = "$##,###" Then
				If isnumber(ls_data_value) Then
					//<add> 06/22/2007 by: Andy fixed bug5(Contract Logix/Contract Logix_Issues_6-21-07.doc)
					//Because if value equal to 0,it will display "$".
					if long(ls_data_value) = 0 then setnull(ls_data_value)
					If isnumber(ls_data_value) Then
						ls_data_value = string(Round( double(ls_data_value), 0 ),"$##,###")
					end if
					//end of add
					//comment 06/22/2007 by: Andy
					//ls_data_value = string(long(ls_data_value),"$##,###")
				End If
			ElseIf ls_field_format = "$##,###.##" Then
				If isnumber(ls_data_value) Then
					//<add> 06/22/2007 by: Andy fixed bug5(Contract Logix/Contract Logix_Issues_6-21-07.doc)
					//Because if value equal to 0,it will display "$.".
					if double(ls_data_value) = 0 then setnull(ls_data_value)
					If isnumber(ls_data_value) Then
						ls_data_value = string(Round( double(ls_data_value), 0 ),"$##,###.##")
					end if
					//end of add
					//comment 06/22/2007 by: Andy
					//ls_data_value = string(double(ls_data_value),"$##,###.##")
				End If
			//<add> 06/20/2007 by: Andy
			elseif ls_field_format = "$##,###.00" Then
				If isnumber(ls_data_value) Then
					//<add> 06/22/2007 by: Andy fixed bug5(Contract Logix/Contract Logix_Issues_6-21-07.doc)
					//Because if value equal to 0,it will display "$.00".	
					if double(ls_data_value) = 0 then setnull(ls_data_value)
					If isnumber(ls_data_value) Then
						ls_data_value = string(Round( double(ls_data_value), 0 ),"$##,###.00")
					end if
					//end of add
					//comment 06/22/2007 by: Andy
					//ls_data_value = string(double(ls_data_value),"$##,###.00")
				End If
			//end of add
			End If			
			*/
			
			ls_data_value = Mid(ls_data_value,1,li_width) //shrink the length to size 
			If ls_field_format = "Leading Padding" Or ls_field_format = "Trailing Padding" Then
				If li_width - Len(ls_data_value) > 0 Then
					li_dif = li_width - Len(ls_data_value)
					ls_pad = "" //reset
					ls_pad = Fill ( ls_fld_delim, li_dif )
					If ls_field_format = "Leading Padding" Then
						ls_data_value = ls_pad + ls_data_value
					Else
						ls_data_value = ls_data_value + ls_pad
					End If
				End If
			ElseIf ls_field_format = "use text" Then //allows a set value if data is found
				If Len(ls_data_value) > 0 Then
					ls_data_value = ls_text//if export type equal 3 ,field_value is always null
				End If
			End If
			
			//set value into the relative field of ads_export_data
			ads_export_data.SetItem(ll_Num,ls_Field,ls_data_value)
		next		
	end if
	
	ll_Start = ll_Tab + 1
	ll_Tab =  Pos(ls_Objects, "~t", ll_Start)
LOOP

end subroutine

public function string of_get_dbtype ();///////////////////////////////////////////////////
//function: of_get_dbtype 
//return  : <string> return the db type
//author  : Andy 08/23/2007
//////////////////////////////////////////////////
String ls_temp,ls_dbtype
Long   ll_Pos

select top 1 @@version into :ls_temp from ids;

If pos(upper(ls_temp) , 'SQL SERVER') > 0 Then
	If pos(upper(ls_temp) , 'SQL SERVER 2005') > 0 Then
		ls_dbtype = 'SQL2005'
	elseif pos(upper(ls_temp) , 'SQL SERVER  2000') > 0 Then
		ls_dbtype = 'SQL2000'
	else 
		ls_dbtype = 'SQL2005'
	end if
Else
	//modify 08/24/2007 by: Andy
	ll_Pos  = POS(ls_temp,'.')
	ls_temp = Left(ls_temp,ll_Pos - 1)
	//if long(left(ls_temp,1)) >= 9 then 
	if long(ls_temp) >= 9 then 	
		ls_dbtype = 'ASA9'
	else
		ls_dbtype = 'ASA7'
	end if
End If

return ls_dbtype
end function

public subroutine of_replacespecchar (ref string as_string);//////////////////////////////////////////////////////////
//function : of_replacespecchar
//arguments: as_string <string> 
//describe : replace special character such as %, ;~"'[]{}/-.+=*\^&!|?()
//Andy 08/24/2007 by: Andy
n_cst_string lnvo_string

if pos(as_string," ") > 0 then as_string  = lnvo_string.of_globalreplace( as_string, " ", "_")
if pos(as_string,"-") > 0 then as_string  = lnvo_string.of_globalreplace( as_string, "-", "_")
if pos(as_string,"/") > 0 then as_string  = lnvo_string.of_globalreplace( as_string, "/", "_")
if pos(as_string,"'") > 0 then as_string  = lnvo_string.of_globalreplace( as_string, "'", "_")
if pos(as_string,'"') > 0 then as_string  = lnvo_string.of_globalreplace( as_string, '"', "_")
if pos(as_string,'(') > 0 then as_string  = lnvo_string.of_globalreplace( as_string, '(', "_")
if pos(as_string,')') > 0 then as_string  = lnvo_string.of_globalreplace( as_string, ')', "_")
if pos(as_string,'%') > 0 then as_string  = lnvo_string.of_globalreplace( as_string, '%', "_")
if pos(as_string,',') > 0 then as_string  = lnvo_string.of_globalreplace( as_string, ',', "_")
if pos(as_string,';') > 0 then as_string  = lnvo_string.of_globalreplace( as_string, ';', "_")

if pos(as_string,'*') > 0 then as_string  = lnvo_string.of_globalreplace( as_string, '*', "_")
if pos(as_string,'\') > 0 then as_string  = lnvo_string.of_globalreplace( as_string, '\', "_")
if pos(as_string,'^') > 0 then as_string  = lnvo_string.of_globalreplace( as_string, '^', "_")
if pos(as_string,'&') > 0 then as_string  = lnvo_string.of_globalreplace( as_string, '&', "_")
if pos(as_string,'!') > 0 then as_string  = lnvo_string.of_globalreplace( as_string, '!', "_")
if pos(as_string,'?') > 0 then as_string  = lnvo_string.of_globalreplace( as_string, '?', "_")
if pos(as_string,'[') > 0 then as_string  = lnvo_string.of_globalreplace( as_string, '[', "_")
if pos(as_string,']') > 0 then as_string  = lnvo_string.of_globalreplace( as_string, ']', "_")
if pos(as_string,'{') > 0 then as_string  = lnvo_string.of_globalreplace( as_string, '{', "_")
if pos(as_string,'}') > 0 then as_string  = lnvo_string.of_globalreplace( as_string, '}', "_")
if pos(as_string,'.') > 0 then as_string  = lnvo_string.of_globalreplace( as_string, '.', "_")
if pos(as_string,'+') > 0 then as_string  = lnvo_string.of_globalreplace( as_string, '+', "_")
if pos(as_string,'=') > 0 then as_string  = lnvo_string.of_globalreplace( as_string, '=', "_")
if pos(as_string,'|') > 0 then as_string  = lnvo_string.of_globalreplace( as_string, '|', "_")
if pos(as_string,'#') > 0 then as_string  = lnvo_string.of_globalreplace( as_string, '#', "_")

if pos(as_string,'~~') > 0 then as_string  = lnvo_string.of_globalreplace( as_string, '~~', "_")


end subroutine

public function long of_export_processdefault (n_ds ads_export_hdr, n_ds ads_export_flds, n_ds ads_export_datatemp, n_ds lds_export_data);////////////////////////////////////////////////////////////
//function : of_export_processdefault
//describe : process default value
//developer: Andy 08/27/2007
///////////////////////////////////////////////////////////
Long   ll_ColCnt,ll_i,ll_ud,ll_sub_start,ll_Col,ll_width,ll_fld_cnt,ll_Row
Long   ll_R,ll_dataCnt,ll_dif
String ls_def_val,ls_data_value,ls_strip_char,ls_field_format,ls_export_field
String ls_pad,ls_text,ls_fld_delim

if Not IsValid(ads_export_hdr) then return -1
if Not IsValid(ads_export_flds) then return -1
if Not IsValid(ads_export_dataTemp) then return -1
if Not IsValid(lds_export_data) then return -1

ll_fld_cnt = ads_export_flds.RowCount()
ads_export_flds.setfilter("export_type = 1 and use_default in (1,2,3)")
ads_export_flds.filter()
ll_ColCnt = ads_export_flds.RowCount()
//No field use defualt
if ll_ColCnt < 1 then 
	ads_export_flds.setfilter("")
	ads_export_flds.filter()
	return 1
end if

ll_dataCnt = lds_export_data.RowCount()
ls_strip_char = ads_export_hdr.getitemstring(1,"strip_char")
if isnull(ls_strip_char) or len(ls_strip_char) < 1 then ls_strip_char = "NONE"

FOR ll_i = 1 to ll_ColCnt
	ls_export_field = ads_export_flds.getitemstring(ll_i,"export_field_name")
	of_replacespecchar(ls_export_field)
	
	ls_text = ads_export_flds.getitemstring(ll_i,"field_value")
	ls_fld_delim = ads_export_flds.GetItemString( ll_i, "trailing_leading_characters")
	ll_width = ads_export_flds.getitemnumber(ll_i,"export_field_length")
	ls_field_format = ads_export_flds.getitemstring(ll_i,"export_format")
	ll_sub_start = ads_export_flds.getitemnumber(ll_i,"export_fields_substring_start")
	ll_ud = ads_export_flds.GetItemnumber( ll_i, "use_default" )
	if ll_ud = 1 or ll_ud = 3 then
		ls_def_val = ads_export_flds.GetItemString( ll_i, "default_value" )
	ELSEif ll_ud = 2 then
		ll_col = Long(ads_export_flds.GetItemString( ll_i, "default_value" ))
	else
		ls_def_val = ""
	end if
	
	ll_R = 0
	DO WHILE (1=1)
		ll_R = lds_export_data.find("IsNull("+ls_export_field+") OR trim(" + ls_export_field + ") = ''",ll_R,ll_dataCnt)
		if ll_R < 1 then exit		  
		//modify 10/12/2007 by: Andy
		//ls_data_value = ""
		setnull(ls_data_value)
		/*commit 10/12/2007 by:Andy 
		if ls_strip_char <> "NONE" then
			ls_data_value = of_strip_char( ls_strip_char ,ls_data_value, "")
		end if
		
		if ll_sub_start > 1 then ls_data_value = mid(ls_data_value,ll_sub_start,ll_width)
		
		ls_data_value = mid(ls_data_value,1,ll_width) //shrink the length to size 
		if ls_field_format = "Leading Padding" or ls_field_format = "Trailing Padding" then 
			if ll_width - len(ls_data_value) > 0 then
				ll_dif = ll_width - len(ls_data_value)
				ls_pad = "" //reset
				ls_pad = Fill ( ls_fld_delim, ll_dif )
				if ls_field_format = "Leading Padding" then
					ls_data_value = ls_pad + ls_data_value 
				else
					ls_data_value = ls_data_value + ls_pad
				end if
			end if
		elseif ls_field_format = "use text" then //allows a set value if data is found
			if len(ls_data_value) > 0 then
				ls_data_value = ls_text
			end if
		end if*/	

		if ll_ud = 3 then
			ls_data_value = ls_def_val + ls_data_value
		end if
		
		if isnull(ls_data_value) then ls_data_value = ""
		if ls_data_value = "" then
			if ll_ud = 1 then
				ls_data_value = ls_def_val
			elseif ll_ud = 2 then //if set to column get the value out of that column
				if ll_col < 1 or ll_col > ll_fld_cnt then //setting trap
					gnv_debug.of_output(true, 'Alarm  Export: ' + "You are using a column default for column " + ls_export_field + " , but your default value is not a valid column number.~rThe default column number must be less than this column.")//added by gavins 20120912
					messagebox("Invalid setting","You are using a column default for column " + ls_export_field + " , but your default value is not a valid column number.~rThe default column number must be less than this column.")
					ads_export_flds.setfilter("")
					ads_export_flds.filter()
					return -1
				end if
				ls_data_value = lds_export_data.getitemstring(ll_R,ll_col)
			end if
		end if
		
		if lower(lds_export_data.describe(ls_export_field + ".name")) = lower(ls_export_field) then
			lds_export_data.setitem(ll_R,ls_export_field,ls_data_value)
			ads_export_dataTemp.setitem(ll_R,ls_export_field,ls_data_value)
		end if

		ll_R ++
		if ll_R > ll_dataCnt then exit
	loop 	
next

ads_export_flds.setfilter("")
ads_export_flds.filter()

return 1
end function

public subroutine of_data_format (string as_format, string as_type, ref string as_data);////////////////////////////////////////////////////////
//Function : of_data_format
//arguments: as_format <string>   data format
//           as_type <string>     data type
//           as_data <ref string> data 
//developer: Andy 08/28/2007 
///////////////////////////////////////////////////////
Long     ll_dec = 0 ,ll_pos
String   ls_Temp
datetime ldt_value

if ISNULL(as_type) OR TRIM(as_type) = '' THEN RETURN
if ISNULL(as_data) OR TRIM(as_data) = '' THEN RETURN
if upper(as_type) = 'D' then 
	if ISNULL(as_format) OR UPPER(as_format) = 'NONE' then as_format = "yyyy-mm-dd hh:mm"
end if
IF upper(as_type) = 'T' THEN 
	if ISNULL(as_format) OR UPPER(as_format) = 'NONE' then as_format = "hh:mm"
END IF
if ISNULL(as_format) OR UPPER(as_format) = 'NONE' THEN RETURN
//Add 10/12/2007 by: Andy
if lower(as_format) = 'leading padding' OR lower(as_format) = 'trailing padding' OR &
	lower(as_format) = 'use text' OR lower(as_format) = 'numbers' then RETURN
//end of add

CHOOSE CASE upper(as_type)
		
	CASE 'N'
		if as_format = "(xxx)xxx-xxxx" then as_format = "(###)###-####"
		//Added By Mark Lee 05/13/2016 bug, the decimal data will be lost. 
//		if long(as_data) = 0 then setnull(as_data)				
		if dec(as_data) = 0 then setnull(as_data)
		/*
		ll_pos = pos(as_format,'.') 
		if ll_pos > 0 then
			ls_Temp = mid(as_format,ll_pos + 1)
			ll_dec = len(ls_Temp)
			if isnull(ll_dec) then ll_dec = 0 
		end if
		*/
		If isnumber(as_data) Then
			//as_data = string(Round( double(as_data), ll_dec ),as_format)
			as_data = string(double(as_data),as_format)
		end if
		
	CASE 'D','T'
		ldt_value = datetime(date(left(as_data,10)),time(right(as_data,5)))
		as_data   = string(ldt_value,as_format)
		
	CASE 'C','S'
		if as_format = "(xxx)xxx-xxxx" then as_format = "(@@@)@@@-@@@@"
		//is number
		if isnumber(as_data) and (pos(as_format,"#") > 0 or pos(as_format,"0") > 0) then
			//<add> 08/31/2007 by: Andy
			if long(as_data) = 0 then setnull(as_data)
			if isnumber(as_data) then 
				as_data = string(double(as_data),as_format)
			end if
		//is datetime
		elseif Len(as_data) = 16 and  isdate(left(as_data,10)) and istime(right(as_data,5)) and &
			(pos(lower(as_format),'y') > 0 or pos(lower(as_format),'m') > 0 or pos(lower(as_format),'d') > 0 or pos(lower(as_format),'h') > 0) then
			ldt_value = datetime(date(left(as_data,10)),time(right(as_data,5)))
			as_data   = string(ldt_value,as_format)
		//is date	
		elseif isdate(as_data) and &
			(pos(lower(as_format),'y') > 0 or pos(lower(as_format),'m') > 0 or pos(lower(as_format),'d') > 0 or pos(lower(as_format),'h') > 0) then
			as_data   = string(datetime(date(as_data)),as_format)
		//is char
		//modify 08/31/2007 by: Andy
		elseif pos(as_format,"@") > 0 then
			as_data   = string(as_data,as_format)
		end if
		
	CASE ELSE 
		//DO NOTHING
		
END CHOOSE
end subroutine

public function integer of_export_data_with_text (integer ai_export_id, long al_prac_ids[], ref string as_path, integer ai_save_data, string as_param1, string as_param2, string as_param3, integer ai_type, string as_sql);//function built by maha 07-2002
//<optimization> by Andy 07/05/2007 - 07/11/2007
// $<arguments>
//value integer  ai_save_data (0:Nothing / 1:save / 2:preview / 3:save & preview)
//value integer  ai_type      (1: specify SQL/2: specify array/3: between...and)
//value string   as_sql       (the specified SQL)
SetPointer( HourGlass! )
if isnull(as_path) or as_path = "" then
	messagebox("Data Error", "There is no save path for this file. Unable to continue this function.")
	return 0
end if
if ai_export_id < 1 then
	//messagebox("User Error", "No export selected.  Unable to continue this function.")
	messagebox("User Error", "No export selected.  Unable to proceed.")
	return 0
end if

open(w_export_progress)
w_export_progress.st_progress.text = "Creating export table"

IF of_create_export_table( ai_export_id,ai_save_data ) < 0 THEN
	close(w_export_progress)
	return 0
END IF

Boolean lb_table_found
boolean lb_export
Long ll_fld_val
Long i //practitioner
Long li_found_rec
Long li_field_width
Long p // rows in field list as well as column number
Long li_rec_no
Long li_file_num
Long li_array_index
Long li_search_from_row
Long li_prac_id_cnt
Long li_table_cnt
Long t
Long e
Long g
Long a
Long w
Long sd
Long li_data_rc
Long li_found_row
Long li_fld_cnt
Long li_filter_cnt
Long li_text_cnt
Long li_fld_type //maha
long ll_find_no //maha

Long li_use_link//maha
Long li_recd_no//maha
Long li_width//maha
Long f//maha
Long li_dif//maha
Long li_facil_id //maha

Long ud //maha 080103
Long col //maha 080103
Long li_act_format //maha 083105
Long li_multi_table
Long li_custom_save //maha 121205
Long li_multi_field[] //maha121905
Long li_sub_start //maha010306
Long li_fail_count //Start Code Change ---- 06.12.2006 #537 maha
datetime ldt_date //maha
datetime ldt_value //maha
String ls_trail_val
String ls_lookup_type
String ls_db_lookup_type
String ls_lookup_code
String ls_trail_record
String ls_pad
String ls_fixed_width
String ls_hdr_val
String ls_hdr_record
String Errors
String ls_export_record
String ls_export_field
String ls_fld_type
String ls_fld_delim
String ls_fld_val
String ls_lead_trail_char
String ls_format
String ls_table_name

String ls_table_names[]
String ls_sql_syntax
String ls_field_name
String ls_grey
String ls_presentation_str
String ls_dwsyntax_str
String ls_value
String ls_data_value
String ls_field_format//maha
String ls_sql //maha
String ls_month //maha
String ls_year //maha
String ls_day  //maha
String ls_hour //maha
String ls_minute //maha
String ls_save_format //maha
String ls_path //maha
Long li_exp_type //maha
Long li_bar_ticks //maha
Long li_billing //maha 080205
String ls_header //maha
String ls_filter //maha
String ls_lookup //maha
String ls_datatype //maha
String ls_prac_ids = ""
string ls_select_field //maha
string ls_prac_field //maha
string ls_select_table_trim //maha
string ls_select_table //maha
string ls_sny_retrieve //maha
string ls_find//maha
string ls_delim_value//maha
string ls_rec_delim//maha
string ls_lu_field//maha
string ls_use_link_sql//maha
string ls_use_link_sql2//maha
string ls_export_text_file = ""//maha
string ls_lookup_val//maha
string ls_save_path//maha
string stax
string s//maha
string ls_aggre//maha 012703
string ls_sort//maha 012703
string ls_dc_field //maha010704
string ls_bill_syn  //maha app080205
string ls_text //maha 120905
string ls_strip_char //maha 120905
string ls_save_name //maha 121205
long ll_prac_row //maha
long ll_ret_cnt
long ll_billing_id //maha app080205
//Start Code Change ----10.23.2008 #V85 maha - changed declaration to instance for destroy code could be functionalized
//n_ds lds_export_hdr
//n_ds lds_export_flds
//n_ds lds_export_retrieve //
//n_ds lds_field 
//n_ds lds_export_dataTemp
//n_ds lds_export_data
//n_ds lds_code_lookup
//n_ds lds_address_lookup
//n_ds lds_dept_chair //maha010704
//n_ds lds_billing_address //maha 080205
////<add> 08/17/2007 by: Andy
//datastore lds_tablepk

string ls_def_val
String       ls_ComputerDataType,ls_Expresstion,ls_Field,ls_FieldDataType
String       ls_Modify,ls_Err,ls_tag
n_cst_string lnvo_string
Long         ll_Cnt,ll_Num
Long   ll_Tab,ll_Start = 1,ll_pos1,ll_pos2,ll_pos3
String ls_Objects,ls_objname,ls_ObjType,ls_ColType
String ls_UnionSQL = "",ls_SqlSelect
String ls_OrderBy 
Boolean lb_flag = true
String  ls_billsynList[]
Long    ll_FieldSeqID = 0,ll_FieldCnt
Long    ll_export_code
Long    ll_intcred_field 
Long    ll_equivcode
Long ll_pracid
Long ll_FieldSeqIDold = -1
Long ll_R = 0
Long ll_Rorig = 0
Long ll_i = 1 
Long ll_j
Long ll_k
String  ls_tablelist[]
String  ls_fieldlist[]
String  ls_selectfieldlist[]
String  ls_formatList[]
String  ls_dcfieldList[]
String  ls_typelist[] //Alfee 11.13.2008
Long 	  li_billingList[] //Alfee 11.13.2008
Long li_recdnoList[]
Long    ll_exportcodeList[]
long    ll_intcredfieldList[]
Long li_substartList[]
Long li_widthList[]
String  ls_flddelimList[]
Long li_udList[]
String  ls_defvalList[]
String  ls_textList[]
Long    ll_pos
string  ls_prac_sql
String  ls_use_link_sqlsyn
Long li_facil_idList[]
Long li_act_formatList[]
str_pass lstr_pass
Long li_widthtemp
//Modify 08/08/2007 by: Andy
string ls_prac_sql_temp
long   ll_len
String ls_prac_sql_temp2
String ls_Sortsel
//<ADD> 08/14/2007 by: Andy 
String ls_top = "top 2147483647"
//<add> 08/15/2007 by: Andy
Long   ll_maxwidth

string  ls_tablepks[],ls_table[],ls_tablepk,ls_sortpk[],ls_dbtype
long    ll_n,ll_pkcnt,ll_Rcnt,ll_SpID,ll_lastpos
boolean lb_flagpk,lb_true = false,lb_ASA7 = false,lb_mulsel = false//,lb_sortpk
String  ls_RowNo = "",ls_RowNoSyn = "",ls_MySQL,ls_tabletemp
String  ls_synprefix = ""
//end of add
string ls_multi_where  //Start Code Change ---- 10.01.2007 #V7 maha

ldt_date = datetime(today(),now()) //maha
//<add> 08/23/2007 by: Andy
ls_dbtype = of_get_dbtype()
if upper(ls_dbtype) = 'SQL2005' OR upper(ls_dbtype) = 'ASA9' THEN
	ls_RowNo = ",Row_No"
	lb_true = true
elseif upper(ls_dbtype) = 'ASA7' then
	lb_ASA7 = true
end if

if Not lb_ASA7 THEN
	ls_synprefix = "select prac_id,FieldSeqID,billing_address_id,field_value,field_data_type" + ls_RowNo + " from ("
end if

//<add> 08/14/2007 by: Andy 
//Reason: Bubble sort the al_prac_ids array.
if ai_type = 2 then 
	of_bubblesort(al_prac_ids)
end if

//IF ls_dbType = 'ASA' THEN 
//	ls_top = ""
//END IF
//end of add

li_prac_id_cnt = UpperBound( al_prac_ids[] )

//<add> 08/17/2007 by: Andy
ids_tablepk = create datastore
IF left(upper(ls_dbType),3) = 'ASA' THEN 
	ids_tablepk.DataObject = "d_export_tablepk_asa_ctx"
	ls_top = ""
ELSE
	ids_tablepk.DataObject = "d_export_tablepk_sql_ctx"
END IF
ids_tablepk.SetTransObject( SQLCA )
//end of add

ids_field = Create n_ds
ids_field.DataObject = "d_export_fields"
ids_field.of_SetTransObject( SQLCA )
ids_field.Retrieve( ai_export_id )

ids_code_lookup = CREATE n_ds
ids_code_lookup.DataObject = "d_code_lookup"
ids_code_lookup.of_SetTransObject( SQLCA )

ids_address_lookup = CREATE n_ds
ids_address_lookup.DataObject = "d_address_lookup"
ids_address_lookup.of_SetTransObject( SQLCA )

ids_export_hdr = CREATE n_ds
ids_export_hdr.DataObject = "d_export_hdr"
ids_export_hdr.of_SetTransObject( SQLCA )

ids_export_flds = CREATE n_ds
ids_export_flds.DataObject = "d_export_flds_list_exp"
ids_export_flds.of_SetTransObject( SQLCA )

ids_dept_chair = CREATE n_ds //maha 010704
ids_dept_chair.DataObject = "d_dept_chair_exp"
ids_dept_chair.of_SetTransObject( SQLCA )

ids_export_retrieve = CREATE n_ds

ids_export_hdr.Retrieve( ai_export_id )
//<add> 07/05/2007 by: Andy
Long      ll_equivcodeCnt
//n_ds ids_export_equiv_code
ids_export_equiv_code = Create n_ds
ids_export_equiv_code.DataObject = "d_export_equiv_code_lds"
ids_export_equiv_code.SetTransObject( SQLCA )
//ll_equivcodeCnt = ids_export_equiv_code.Retrieve()
ll_equivcodeCnt = ids_export_equiv_code.Retrieve(ai_export_id) //Jervis 12.10.2010
//end of add
//--------------------------- APPEON BEGIN ---------------------------
//$<add> 04.25.2007 By: Jack
//$<reason> Fix a defect.
If ids_export_hdr.rowcount() < 1 Then 
	close(w_export_progress)
	//<add> andy 07.017.2007
	//destroy the ds
	//Start Code Change ----10.23.2008 #V85 maha
	of_cleanup_ds( )
//	if IsValid(lds_export_flds) then destroy lds_export_flds
//	if IsValid(lds_export_hdr) then destroy lds_export_hdr
//	if IsValid(lds_address_lookup) then destroy lds_address_lookup
//	if IsValid(lds_code_lookup) then destroy lds_code_lookup
//	if IsValid(lds_export_data) then destroy lds_export_data
//	if IsValid(lds_dept_chair) then destroy lds_dept_chair
//	if IsValid(lds_field) then Destroy lds_field
//	if IsValid(lds_export_dataTemp) then Destroy lds_export_dataTemp
//	if IsValid(lds_export_equiv_code) then Destroy lds_export_equiv_code
//	Destroy lds_tablepk
	//end of add
	Return -1
end if
//---------------------------- APPEON END ----------------------------
//HEADER INFO
ls_table_name = ids_export_hdr.getitemstring(1,"export_name")
ls_header = ids_export_hdr.getitemstring(1,"field_labels_as_header")//Y or N
ls_format = ids_export_hdr.getitemstring(1,"export_format")
if ls_format = "export"  then //maha 121205
	lb_export = true
	ls_format = ".txt"

elseif ls_format = ".csv" then
	lb_export = false
else //txt and xls files  files
	lb_export = false
end if

//<add> 08.29.2007 By: Andy Reason:print letters call
If is_called_type = '4' Then 
	ls_format = ".txt" 
	ls_header = '1'
END IF
//end of add

li_exp_type = ids_export_hdr.getitemnumber(1,"export_type")
ls_rec_delim = ids_export_hdr.getitemstring(1,"record_delimiter")
ls_save_path = ids_export_hdr.getitemstring(1,"save_path")
ls_save_path = gnv_string.of_replace_env_var(ls_save_path) //Added By Ken.Guo 12/10/2013

ls_multi_where = ids_export_hdr.getitemstring(1,"multi_screen_filter")  //Start Code Change ---- 10.01.2007 #V7 maha

//$<add> 05.07.2008 by Andy
select top 1 @@spid into :ll_SpID from ids;

//Modify 08/08/2007 by: Andy
//specify SQL
if ai_type = 1 then
	ls_prac_sql  = trim(as_sql)//trim(ids_export_hdr.getitemstring(1,"prac_sql"))
	if isnull(ls_prac_sql) then ls_prac_sql = ''
	if ls_prac_sql <> '' then 
		ll_pos = pos(ls_prac_sql,";")
		if ll_pos > 0 then 
			ls_prac_sql  = replace(ls_prac_sql,ll_pos,1,'')
		end if
		ll_len = len(ls_prac_sql)
		ls_prac_sql_temp = trim(mid(ls_prac_sql,7,ll_len))
		if lower(left(ls_prac_sql_temp,8)) = 'distinct' then
			ls_prac_sql_temp2 = trim(mid(ls_prac_sql_temp,9,ll_len))
			if lower(left(ls_prac_sql_temp2,3)) <> 'top' then
				//modify 08/14/2007 by: Andy
				//ls_prac_sql = 'select distinct top 2147483647 ' + ls_prac_sql_temp2
				ls_prac_sql = 'select distinct ' + ls_top + ' ' + ls_prac_sql_temp2
			end if
		elseif lower(left(ls_prac_sql_temp,3)) <> 'top' then
			//modify 08/14/2007 by: Andy
			//ls_prac_sql = 'select top 2147483647 ' + ls_prac_sql_temp
			ls_prac_sql = 'select ' + ls_top + ' ' + ls_prac_sql_temp
		end if
		
		//$<add> 05.06.2008 by Andy
		//del order by statement. Reason:if ORDER BY items isn't in the select list,then it will get error.
		//ORDER BY items must appear in the select list if the statement contains a UNION operator.
		ll_pos = pos(lower(ls_prac_sql)," order ")
		if ll_pos > 0 then
			ls_prac_sql = Left(ls_prac_sql,ll_pos - 1)
		end if
		//if select more than one field,then add a select statement outside the ls_prac_sql and
		//INSERT the result INTO a table.
		ll_pos = pos(lower(ls_prac_sql)," from ")
		ls_prac_sql_temp = Left(ls_prac_sql,ll_pos - 1)
		ll_pos = pos(ls_prac_sql,",")
		if ll_pos > 0 then
			lb_mulsel = true
			ls_prac_sql = "select distinct prac_id," + String(ll_spid) + " from (" + ls_prac_sql + ") cc order by prac_id"
			select top 1 1 into :ll_Cnt from sysobjects where name = 'export_temp' and type = 'U';
			if ll_Cnt = 1 then
				ls_Mysql = "DELETE FROM export_temp WHERE SpID = " + String(ll_spid) + ";"
			else
				ls_MySQL = "CREATE TABLE export_temp (prac_id int null,SpID int null)"
			end if
			EXECUTE IMMEDIATE :ls_Mysql;
			ls_MySQL = "INSERT INTO export_temp " + ls_prac_sql + ";"
			EXECUTE IMMEDIATE :ls_Mysql;
			ls_prac_sql = "select distinct prac_id from export_temp where SpID = " + String(ll_spid)
		end if
		//end add 05.06.2008
	end if
end if
//end of modify

//\/maha 120905
li_multi_table = ids_export_hdr.getitemnumber(1,"multi_row_table")
//Modify 08/22/2007 by: Andy
ls_strip_char = ids_export_hdr.getitemstring(1,"strip_char")
//end of Modify
if isnull(ls_strip_char) or len(ls_strip_char) < 1 then ls_strip_char = "NONE"
if ls_format = ".csv" then ls_strip_char = "," //maha 122005
li_custom_save = ids_export_hdr.getitemnumber(1,"custom_save_name") 
if li_custom_save = 5 then ib_nyp_fte = true //Start Code Change ---- 09.27.2007 #V7 maha
if isnull(li_custom_save) then li_custom_save = 0
//\maha 120905

//set record delimiter
choose case ls_rec_delim
	case "C"
		ls_rec_delim = ","
	case "R"
		ls_rec_delim = "~r"
	case "T"
		ls_rec_delim = "	"	
	case "D"
		ls_rec_delim = "~r~r"
	case "U"
	case else
		ls_rec_delim = ""
end choose
if isnull(ls_rec_delim) then ls_rec_delim = ""

if ls_format = ".csv" then ls_rec_delim = "~r"

li_fld_cnt = ids_export_flds.Retrieve( ai_export_id )
//<add> 08/23/2007 by: Andy
ll_maxwidth = Long(ids_export_flds.describe("evaluate('max(export_field_length)',0)"))
if ll_maxwidth < 30 then ll_maxwidth = 30

//CREATE SYNTAX FOR export DW
ls_sql_syntax = is_select_syntax
ls_presentation_str = "style(type=form)" 

ls_dwsyntax_str = SQLCA.SyntaxFromSQL(ls_sql_syntax, ls_presentation_str, ERRORS)
IF Len(ERRORS) > 0 THEN //this will fail if the table creation has not been completed
	if pos(ERRORS,"Table or view not found",1) > 0 then
		messagebox ("Error in of_export_data_with_text","Export data data store not able to be created.~rCheck the following:~rMake sure export field names have no spaces and contain only letters, numbers and underscores, and that all fields have a width.~rYou cannot have duplicate field names~rField names cannot start with a number." )
		close(w_export_progress)
		//<add> andy 07.017.2007
		//Start Code Change ----10.23.2008 #V85 maha
		of_cleanup_ds( )
		//destroy the ds
//		if IsValid(lds_export_flds) then destroy lds_export_flds
//		if IsValid(lds_export_hdr) then destroy lds_export_hdr
//		if IsValid(lds_address_lookup) then destroy lds_address_lookup
//		if IsValid(lds_code_lookup) then destroy lds_code_lookup
//		if IsValid(lds_export_data) then destroy lds_export_data
//		if IsValid(lds_dept_chair) then destroy lds_dept_chair
//		if IsValid(lds_field) then Destroy lds_field
//		if IsValid(lds_export_dataTemp) then Destroy lds_export_dataTemp
//		if IsValid(lds_export_equiv_code) then Destroy lds_export_equiv_code
//		Destroy lds_tablepk
		//end of add
		return -1
		
	else
		MessageBox("Caution", &
		"SyntaxFromSQL caused these errors: " + ERRORS)
		close(w_export_progress)
		//<add> andy 07.017.2007
		//destroy the ds
		//Start Code Change ----10.23.2008 #V85 maha
		of_cleanup_ds( )
//		if IsValid(lds_export_flds) then destroy lds_export_flds
//		if IsValid(lds_export_hdr) then destroy lds_export_hdr
//		if IsValid(lds_address_lookup) then destroy lds_address_lookup
//		if IsValid(lds_code_lookup) then destroy lds_code_lookup
//		if IsValid(lds_export_data) then destroy lds_export_data
//		if IsValid(lds_dept_chair) then destroy lds_dept_chair
//		if IsValid(lds_field) then Destroy lds_field
//		if IsValid(lds_export_dataTemp) then Destroy lds_export_dataTemp
//		if IsValid(lds_export_equiv_code) then Destroy lds_export_equiv_code
//		Destroy lds_tablepk
		//end of add
		RETURN -1
	end if
END IF
ids_export_data = CREATE n_ds
ids_export_data.Create( ls_dwsyntax_str, ERRORS)
ids_export_data.SetTransObject( SQLCA )

//<add> andy 07.05.2007
//save the original data that it's not format,in order to deal with the computer fields
ids_export_dataTemp = create n_ds
ids_export_dataTemp.create( ls_dwsyntax_str, Errors )
ids_export_dataTemp.SetTransObject( SQLCA )
//end of add

w_export_progress.r_bar.Width = 300

w_export_progress.st_progress.text = "Populating Data for " + string(li_prac_id_cnt) + " Practitioners"

//Modify 07/09/2007 by: Andy
//creates string of prac_ids for querys
//between...and...
if ai_type = 3 then
	if li_prac_id_cnt > 0 then 
		ls_prac_ids = "between " + string(al_prac_ids[1]) + " and " + string(al_prac_ids[li_prac_id_cnt])
	end if
end if

//$<modify> 05.05.2008 by Andy
//create rows for all practitioner data
FOR i = 1 TO li_prac_id_cnt
	//specify array
	if ai_type = 2 then
		ls_prac_ids = ls_prac_ids + String( al_prac_ids[i] ) + ","
	end if
	g = ids_export_data.insertrow(0)
next
if ai_type = 2 then
	ls_prac_ids = Left( ls_prac_ids, Len( ls_prac_ids ) -1 ) //remove last comma
end if

//Added By Ken.Guo 2011-07-21. 
Boolean lb_usingdb = False
String ls_client_id
If li_prac_id_cnt >= 100 Then
	lb_usingdb = True
	If inv_arr_db.of_array_to_db( al_prac_ids[],ls_client_id ) < 0 Then
		if isvalid(w_export_progress) then close(w_export_progress)
		of_cleanup_ds( )	
		lb_usingdb = False
		gnv_debug.of_output( True, 'Export data with text error, Failed to insert array to DB.')
		Messagebox('Export Error','Failed to insert array data to DB.')
	End If
End If

if ai_save_data = 1 or ai_save_data = 3 then
	ids_export_data.object.rec_id.Primary[] = al_prac_ids[]
end if
ids_export_data.Rowscopy( 1, ids_export_data.rowcount(), Primary!, ids_export_dataTemp, 1, Primary! )
//end modify 05.05.2008



w_export_progress.r_bar.Width = w_export_progress.r_bar.Width + 50
w_export_progress.st_export.text = "Form SQL Statement"

//<add> 08/23/2007 by: Andy
if lb_ASA7 then 
	//<del> 2008-05-04 by:nova
	//gnv_appeondb.of_startqueue( )
	//$<del> 05.07.2008 by Andy Reason:Move to above here
	//select top 1 @@spid into :ll_SpID from ids;
	// modified by nova 2008-05-04
	//ls_tabletemp = "#t_export" + String(ll_SpID)
	ls_tabletemp = "t_export" + String(ll_SpID)
	//For ASA7 Bug,Can't include ; in end.
	//ls_MySQL = "CREATE TABLE " + ls_tabletemp + " (prac_id int null,FieldSeqID int null, billing_address_id int null, field_value varchar( " + String(ll_maxwidth) + ") null, field_data_type CHAR(1));"
	ls_MySQL = "CREATE TABLE " + ls_tabletemp + " (prac_id int null,FieldSeqID int null, billing_address_id int null, field_value varchar( " + String(ll_maxwidth) + ") null, field_data_type CHAR(1))" 
	EXECUTE IMMEDIATE :ls_Mysql;
	if SQLCA.SQLCode <> 0 then
		messagebox(gnv_app.iapp_object.DisplayName,sqlca.sqlerrtext)
		close(w_export_progress)
		//Start Code Change ----10.23.2008 #V85 maha
		of_cleanup_ds( )
//		if IsValid(lds_export_flds) then destroy lds_export_flds
//		if IsValid(lds_export_hdr) then destroy lds_export_hdr
//		if IsValid(lds_address_lookup) then destroy lds_address_lookup
//		if IsValid(lds_code_lookup) then destroy lds_code_lookup
//		if IsValid(lds_export_data) then destroy lds_export_data
//		if IsValid(lds_dept_chair) then destroy lds_dept_chair
//		if IsValid(lds_field) then Destroy lds_field
//		if IsValid(lds_export_dataTemp) then Destroy lds_export_dataTemp
//		if IsValid(lds_export_equiv_code) then Destroy lds_export_equiv_code
//		Destroy lds_tablepk
		//<del> 2008-05-04 by:nova
		//$<add> 01.07.2008 by: Andy
		//gnv_appeondb.of_commitqueue( )
		RETURN -1
	END IF
END IF
//END OF ADD

FOR p = 1 TO li_fld_cnt
	li_width = ids_export_flds.getitemnumber(p,"export_field_length")
	ls_field_format = ids_export_flds.getitemstring(p,"export_format")
	ls_data_value = ""
	ls_value = ""
	ls_lookup_val = ""
	ls_dc_field = "none"
	li_sub_start=  0 //maha 010306
	ud = ids_export_flds.GetItemnumber( p, "use_default" )
	if ud = 1 or ud = 3 OR ud = 2 Or ud = 4 then //modified by gavins ud = 4 20151112
		ls_def_val = ids_export_flds.GetItemString( p, "default_value" )
		If trim(lower(ls_def_val)) = 'today' And ud = 4 Then ls_def_val = string( today() )
	ELSE
		ls_def_val = ""
	end if
	//****fixed text
	if ids_export_flds.getitemnumber(p,"export_type") = 2 then //set data for text fields
		ls_select_field = ids_export_flds.getitemstring(p,"export_field_name")
		ls_value = ids_export_flds.getitemstring(p,"field_value")
				
		if isnull(ls_value) then ls_value = ""
			
		if ls_value = "&TODAY&" then			  
			//<modify> 08/28/2007 by: Andy Reason:Support user-defined format.
			//ls_value = of_date_format(ls_field_format,ldt_date) //maha 070705 factored
			ls_value = String(ldt_date,"yyyy-mm-dd hh:mm")
			of_data_format(ls_field_format,'D',ls_value)
			//end of modify
		end if
		//Start Code Change ---- 11.03.2005 #21 maha  new for prompt values
		string ls_ptype
		ls_ptype = "" //maha 120905
		choose case upper(ls_value)
			case "&PROMPT1&" 
				ls_ptype = ids_export_hdr.getitemstring(1,"prompt_type1")
				ls_value = of_prompt_populate( ls_ptype, as_param1)
			case "&PROMPT2&" 
				ls_ptype = ids_export_hdr.getitemstring(1,"prompt_type2")
				ls_value = of_prompt_populate( ls_ptype, as_param2)
			case "&PROMPT3&"
				ls_ptype = ids_export_hdr.getitemstring(1,"prompt_type3")
				ls_value = of_prompt_populate( ls_ptype, as_param3)
		end choose
		//if the prompt type is date and it is a fixed text, get today() for the value 
		if	ls_ptype = 'D' then
			ldt_date = datetime(date(ls_value),now())
			//<modify> 08/28/2007 by: Andy Reason:Support user-defined format.
			//ls_value = of_date_format(ls_field_format,ldt_date) //format as necessary
			ls_value = String(ldt_date,"yyyy-mm-dd hh:mm")
			of_data_format(ls_field_format,'D',ls_value)
			//end of modify
		end if
		//End Code Change---11.03.2005 		

		//<add> 08/27/2007 by: Andy
		li_sub_start = ids_export_flds.getitemnumber(p,"export_fields_substring_start")
		if li_sub_start > 1 then ls_value = mid(ls_value,li_sub_start,li_width)		
		ls_value = mid(ls_value,1,li_width) //shrink the length to size 
		//end of add
		
		for i = 1 TO li_prac_id_cnt
			ids_export_data.setitem(i,p,ls_value)
			ids_export_dataTemp.SetItem(i,p,ls_value)//<add> andy 07.05.2007
		next
		
	//*******getting values from data
	//<Modify> andy 07.05.2007
	//else //get FIELDS DATA
	ElseIf ids_export_flds.GetItemNumber(p,"export_type") = 1 Then //get FIELDS DATA
	//end of modify
		//CREATE SYNTAX FOR each retrieve DW
		ls_export_field = ids_export_flds.getitemstring(p,"export_field_name")
		//<add> 08/24/2007 by: Andy
		of_replacespecchar(ls_export_field)
		//end of add
		ls_select_field = Trim( ids_export_flds.GetItemString( p, "db_field_name" ) )
		ls_datatype = Trim( ids_export_flds.GetItemString(p,"db_field_type") ) //Alfee 11.13.2008		
		ls_select_table = Trim( ids_export_flds.GetItemString( p, "db_table_name" ) )
		li_use_link = ids_export_flds.getitemnumber(p,"use_link")
		ls_fld_delim = ids_export_flds.GetItemString( p, "trailing_leading_characters")
		li_recd_no = ids_export_flds.getitemnumber(p,"intcred_record_number")
		//<add> 07/06/2007 by: Andy
		ll_FieldSeqID ++
		ll_export_code = ids_export_flds.GetItemnumber( p, "export_code" )
		ls_dc_field = ids_export_flds.GetItemstring( p, "dept_sect_field" )
		if isnull(ls_dc_field) or trim(ls_dc_field) = '' then ls_dc_field = "none"
		ll_intcred_field = ids_export_flds.getitemnumber(p,"intcred_field")
		//end of add	
		li_facil_id = ids_export_flds.getitemnumber(p,"facility_id")
		ls_lu_field = ids_export_flds.GetItemstring( p, "lu_field_name" )
		ls_aggre = ids_export_flds.GetItemstring( p, "aggre_function" )
		ls_sort = ids_export_flds.GetItemstring( p, "sort_by" )
		//<add> 08/09/2007 by: Andy
		ls_Sortsel = ls_sort
		if isnull(ls_Sortsel) then ls_Sortsel = ''
		if len(trim(ls_Sortsel)) > 0 then
			//$<Modify> 05.13.2008 by Andy
			of_get_sortsel(ls_Sortsel,'prac_id')
//			if pos(lower(ls_Sortsel),' desc') > 0 then
//				ls_Sortsel = lnvo_string.of_globalreplace( ls_Sortsel, ' desc', '')
//			end if
//			if pos(lower(ls_Sortsel),' asc') > 0 then
//				ls_Sortsel = lnvo_string.of_globalreplace( ls_Sortsel, ' asc', '')
//			end if
//			ls_Sortsel += ","
		end if		
		//end of add
		li_act_format = ids_export_flds.getitemnumber(p,"export_fields_active_yesno")
		ls_text = ids_export_flds.getitemstring(p,"field_value") //maha 091305
		if upper(ls_lu_field) = "LOOKUP CODE" then ls_lu_field = "lookup_code"
		if isnull(ls_lu_field) then ls_lu_field = "code"
		ls_use_link_sql = ""
		ls_use_link_sql2 = ""
		li_sub_start = ids_export_flds.getitemnumber(p,"export_fields_substring_start")//maha 010306
		if pos(ls_select_table,"dba.",1) > 0 then //maha 122005 
			ls_select_table_trim = mid(ls_select_table,5) //dropping dba.
			ls_select_table = ls_select_table_trim  //maha 012306
		else
			ls_select_table_trim = ls_select_table
		end if
		ls_filter = ids_export_flds.getitemstring(p,"filter_query")
		li_billing = ids_export_flds.getitemnumber(p,"billing_link") //maha app080205
		if isnull(li_facil_id) then li_facil_id = 0
		if isnull(ls_filter) or ls_filter = "" then 
			ls_filter = ""
		else
			//<Modify> 07/23/2007 by: Andy
			//ls_filter = " and  " + ls_filter
			ls_filter = " and  ( " + ls_filter + " )"
			//end of Modify
		//Start Code Change ---- 11.03.2005 #24 maha check filter for prompt values and replace
			Long li_pos1
			li_pos1 = pos(upper(ls_filter),"PROMPT1",1)
			if li_pos1 > 0 then
				ls_filter = mid(ls_filter,1,li_pos1 - 1) + as_param1 + mid(ls_filter,li_pos1 + 7)
			end if
			li_pos1 = pos(upper(ls_filter),"PROMPT2",1)
			if li_pos1 > 0 then
				ls_filter = mid(ls_filter,1,li_pos1 - 1) + as_param2 + mid(ls_filter,li_pos1 + 7)
			end if
			li_pos1 = pos(upper(ls_filter),"PROMPT3",1)
			if li_pos1 > 0 then
				ls_filter = mid(ls_filter,1,li_pos1 - 1) + as_param3 + mid(ls_filter,li_pos1 + 7)
			end if
		end if
		//End Code Change---11.03.2005 	
		//set record delimiter/pad maha 060105
		choose case ls_rec_delim
			case "R" //return
				ls_rec_delim = "~r"
			case "T" //tab
				ls_rec_delim = "	"	
			case "D" //double return
				ls_rec_delim = "~r~n"
			case "S" // space
				ls_rec_delim = " "
			case "E" //empty string
				ls_rec_delim = ""
		end choose
		
		//maha 121205 //overwrite field delim if is a CSV file
		if ls_format = ".csv" then ls_rec_delim = ","
			
		//export_fields_use_link  sql
		if li_use_link = 1 then
			//messagebox("ls_select_table",ls_select_table)
			choose case ls_select_table
				case "pd_address"
					ls_use_link_sql = ",pd_address_link"
//					debugbreak()
				case "pd_hosp_affil"
					ls_use_link_sql = ",pd_hosp_facility_link"
				case "pd_board_specialty"
					ls_use_link_sql = ",pd_spec_facility_link"
				case else
					ls_use_link_sql = ""
			end choose
		end if
		
		//Modify 07/06/2007 by: Andy
		ls_tablelist[ll_FieldSeqID] = ls_select_table
		ls_fieldlist[ll_FieldSeqID] = ls_export_field
		li_recdnoList[ll_FieldSeqID] = li_recd_no
		ls_selectfieldlist[ll_FieldSeqID] = ls_select_field
		ls_typelist[ll_FieldSeqID] = ls_datatype //Alfee 11.13.2008		
		li_billinglist[ll_FieldSeqID] = li_billing //Alfee 11.13.2008		
		ls_formatList[ll_FieldSeqID] = ls_field_format
		ll_exportcodeList[ll_FieldSeqID] = ll_export_code
		ls_dcfieldList[ll_FieldSeqID] = ls_dc_field
		ll_intcredfieldList[ll_FieldSeqID] = ll_intcred_field
		li_substartList[ll_FieldSeqID] = li_sub_start
		li_widthList[ll_FieldSeqID] = li_width
		//<add> 07/23/2007 by: Andy
		li_widthtemp = li_width
		if li_widthtemp < 30 then li_widthtemp = 30
		//end of add
		ls_flddelimList[ll_FieldSeqID] = ls_fld_delim
		li_udList[ll_FieldSeqID] = ud
		ls_defvalList[ll_FieldSeqID] = ls_def_val
		ls_textList[ll_FieldSeqID] = ls_text
		li_facil_idList[ll_FieldSeqID] = li_facil_id
		li_act_formatList[ll_FieldSeqID] = li_act_format

		ls_use_link_sqlsyn = ls_use_link_sql		
		if ai_type = 1 then
			ls_use_link_sql = ls_use_link_sql + ", (" + ls_prac_sql + ") bb "
		end if

		//<ad> 08/17/2007 by: Andy
		ls_tablepk= ""
		if ISNULL(ls_sort) OR trim(ls_sort) = "" then
			ls_sort = ""
			lb_flagpk = true
			//lb_sortpk = false
			ll_pkcnt = upperbound(ls_table)
			FOR ll_n = 1 to ll_pkcnt
				if lower(ls_select_table) = lower(ls_table[ll_n]) then
					ls_tablepk = ls_tablepks[ll_n]
					//ls_sort  = Left(ls_tablepk,len(ls_tablepk) - 2)
					ls_sort = ls_sortpk[ll_n]
					lb_flagpk = false
				end if
			next
			if lb_flagpk then
				ll_Rcnt = ids_tablepk.retrieve( ls_select_table)
				ls_sort = ls_select_table + '.prac_id, '
				for ll_n = 1 to ll_Rcnt
					if lower(ids_tablepk.getitemstring( ll_n, "column_name")) = 'prac_id' then
						//ls_sort = ls_select_table + '.prac_id, '
						continue
					end if
					ls_tablepk += ls_select_table + '.' + ids_tablepk.getitemstring( ll_n, "column_name") + ", "
				next				  
				//Modify 08/22/2007 by: Andy
				//ls_sort = ls_tablepk + ls_sort
				ls_sort = ls_sort + ls_tablepk
				//end of modify
				ls_sort  = Left(ls_sort,len(ls_sort) - 2)
				ls_sortpk[ll_pkcnt + 1] = ls_sort
				ls_table[ll_pkcnt+1] = ls_select_table
				ls_tablepks[ll_pkcnt+1] = ls_tablepk
			end if
		//<add> 08/22/2007 by: Andy
		else
			if pos(lower(ls_sort),'prac_id') < 1 then ls_sort = ls_select_table + '.prac_id, ' + ls_sort
		end if
		//<ADD> 08/23/2007 BY: Andy
 		if lb_ASA7 THEN 
			ls_tablepk = ""
			ls_Sortsel = ""//<add> 08/27/2007 by: Andy
		end if
		//end of add
		
		//<add> 08/23/2007 by: Andy
		if len(ls_aggre) > 0 then
			ls_sort = ls_sort + " , field_value"
		end if
		if Len(ls_sort) > 0 then ls_sort = "order by " + ls_sort
		//end of add
		
		//<add> 08/23/2007 by: Andy
		if lb_true THEN//SQL2005 and ASA9
			ls_RowNoSyn = ",row_number() over(" + ls_sort+") Row_No"
		end if
		//end of add
		
		ls_bill_syn     = "Select " + lower(ls_select_table) + ".prac_id, "	
		//Modify 08/14/2007 by: Andy
		//ls_sny_retrieve = "select prac_id,FieldSeqID,billing_address_id,field_value,field_data_type" + ls_RowNo + " from (Select " + ls_top + " " + lower(ls_select_table) + ".prac_id, " + ls_tablepk + ls_Sortsel + String(ll_FieldSeqID) + " FieldSeqID, "
		ls_sny_retrieve = ls_synprefix + "Select " + ls_top + " " + lower(ls_select_table) + ".prac_id, " + ls_tablepk + ls_Sortsel + String(ll_FieldSeqID) + " FieldSeqID, "
		//end of modify
		if ls_select_table = "pd_address" and li_billing = 1 then //maha app080205
			ls_bill_syn     = ls_bill_syn + " billing_address_id, "
			ls_sny_retrieve = ls_sny_retrieve + " billing_address_id, "
		//<add> 07/05/2007 by: Andy
		else 
			ls_sny_retrieve = ls_sny_retrieve + " 0 billing_address_id, "
		end if
		//end of add
		
		ls_db_lookup_type = ids_export_flds.GetItemString( p, "db_lookup_type" )
		if ls_select_field = "affiliation_status" then // setting lookup field and where
			ls_datatype = "C"
			//messagebox("ls_lu_field",ls_lu_field )
			ls_bill_syn     = ls_bill_syn + " code_lookup."+ ls_lu_field + " from code_lookup," + lower(ls_select_table) +  ls_use_link_sqlsyn + " WHERE " + "(convert(varchar," + lower(ls_select_table) + "." + ls_select_field + ") = convert(varchar,code_lookup.code)) and code_lookup.lookup_name = 'Affiliation Status' and "
			ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),code_lookup."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from code_lookup," + lower(ls_select_table) +  ls_use_link_sql + " WHERE " + "(convert(varchar," + lower(ls_select_table) + "." + ls_select_field + ") = convert(varchar,code_lookup.code)) and code_lookup.lookup_name = 'Affiliation Status' and "			
			//Start Code Change ---- 11.28.2005 #112 maha				
			ls_select_field  = "code_lookup_" + ls_lu_field		
			//End Code Change---11.28.2005 
		elseif upper(ls_db_lookup_type)  = "C" Then //code lookup table
			if upper(ls_lu_field) = "LOOKUP_CODE" then
				ls_datatype = "N"
			else
				ls_datatype = "C"
			end if
			ls_bill_syn     = ls_bill_syn + " code_lookup."+ ls_lu_field + " from code_lookup," + lower(ls_select_table) +  ls_use_link_sqlsyn + " WHERE " + "(convert(varchar," + lower(ls_select_table) + "." + ls_select_field + ") = convert(varchar,code_lookup.lookup_code)) and "
			ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),code_lookup."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from code_lookup," + lower(ls_select_table) +  ls_use_link_sql + " WHERE " + "(convert(varchar," + lower(ls_select_table) + "." + ls_select_field + ") = convert(varchar,code_lookup.lookup_code)) and "
			//Start Code Change ---- 11.28.2005 #112 maha	
			ls_select_field  = "code_lookup_" + ls_lu_field
			//End Code Change---11.28.2005 
		elseif upper(ls_db_lookup_type)  = "A" Then //address lookup table
			if ls_lu_field = "description"  then
				messagebox("Data Error on field " + ls_export_field,"The address lookup field set for export field '" + ls_select_field + "' is improperly set.  You cannot use description, try entity_name.  Please correct.")
				close(w_export_progress)
				//<add> 08/23/2007 by: Andy
				if lb_ASA7 then
					ls_Mysql = "DROP TABLE " + ls_tabletemp + ";"
					EXECUTE IMMEDIATE :ls_Mysql;
				end if
				//<add> andy 07.017.2007
				//destroy the ds
				//Start Code Change ----10.23.2008 #V85 maha
				of_cleanup_ds( )
//				if IsValid(lds_export_flds) then destroy lds_export_flds
//				if IsValid(lds_export_hdr) then destroy lds_export_hdr
//				if IsValid(lds_address_lookup) then destroy lds_address_lookup
//				if IsValid(lds_code_lookup) then destroy lds_code_lookup
//				if IsValid(lds_export_data) then destroy lds_export_data
//				if IsValid(lds_dept_chair) then destroy lds_dept_chair
//				if IsValid(lds_field) then Destroy lds_field
//				if IsValid(lds_export_dataTemp) then Destroy lds_export_dataTemp
//				if IsValid(lds_export_equiv_code) then Destroy lds_export_equiv_code
//				Destroy lds_tablepk
				//<del> 2008-05-04 by:nova
				//end of add
				//$<add> 01.07.2008 by: Andy
				//if lb_ASA7 then gnv_appeondb.of_commitqueue( )
				return 0					
			else
				if upper(ls_lu_field) = "LOOKUP_CODE" then
					ls_datatype = "N"
				elseif upper(ls_lu_field) = "CUSTOM_1" OR upper(ls_lu_field) = "CUSTOM_2" then //maha 050704 
					ls_datatype = "N"
				else					
					ls_datatype = "C"
				end if
				ls_bill_syn     = ls_bill_syn + " address_lookup." + ls_lu_field + " from address_lookup," + lower(ls_select_table) +  ls_use_link_sqlsyn + " WHERE " + "(convert(varchar," + lower(ls_select_table) + "." + ls_select_field + ") = convert(varchar,address_lookup.lookup_code)) and "
				ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),address_lookup." + ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from address_lookup," + lower(ls_select_table) +  ls_use_link_sql + " WHERE " + "(convert(varchar," + lower(ls_select_table) + "." + ls_select_field + ") = convert(varchar,address_lookup.lookup_code)) and "					
				//Start Code Change ---- 11.28.2005 #112 maha	
				ls_select_field  = "address_lookup_" + ls_lu_field
				//End Code Change---11.28.2005 
			end if
		//Start Code Change ----10.23.2008 #V85 maha
		elseif upper(ls_db_lookup_type)  = "F" Then //facility table
			if upper(ls_lu_field) = "FACILITY_ID" OR upper(ls_lu_field) = "RETURN_ZIP" then
				ls_datatype = "N"
			ELSE
				ls_datatype = "C"
			END IF
			ls_bill_syn     = ls_bill_syn + " facility." + ls_lu_field + " from facility," + lower(ls_select_table) +  ls_use_link_sqlsyn + " WHERE " + "(convert(varchar," + lower(ls_select_table) + "." + ls_select_field + ") = convert(varchar,facility.facility_id)) and "
			ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),facility." + ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from facility," + lower(ls_select_table) +  ls_use_link_sql + " WHERE " + "(convert(varchar," + lower(ls_select_table) + "." + ls_select_field + ") = convert(varchar,facility.facility_id)) and "						
			ls_select_field  = "facility_" + ls_lu_field
		//End Code Change---10.23.2008
		else // NON LOOKUP FIELDS
			//<add> 07/04/2007 by: Andy
			ls_datatype = ids_export_flds.getitemstring(p,"db_field_type")
			//end of add
			if len(ls_aggre) > 0 then //maha 012703 for aggregate functions still not being used as of 12-05 
				ls_bill_syn     = ls_bill_syn + ls_aggre + "("	+ ls_select_table + "." + ls_select_field + ") a" + ls_aggre + " from " + lower(ls_select_table) +  ls_use_link_sqlsyn + " WHERE " 
				//ls_sny_retrieve = ls_sny_retrieve + ls_aggre + "("	+ ls_select_table + "." + ls_select_field + ") a" + ls_aggre + " from " + lower(ls_select_table) +  ls_use_link_sql + " WHERE " 
				ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + ")," + ls_aggre + "("	+ ls_select_table + "." + ls_select_field + ")) field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + lower(ls_select_table) +  ls_use_link_sql + " WHERE " 
			else
				ls_bill_syn     = ls_bill_syn + ls_select_table + "." +ls_select_field + " from " + lower(ls_select_table) +  ls_use_link_sqlsyn + " WHERE " 	
				if upper(ls_datatype) = 'D' then 
					ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(16)," + ls_select_table + "." +ls_select_field + ",120) field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + lower(ls_select_table) +  ls_use_link_sql + " WHERE " 		
				else
					ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + ")," + ls_select_table + "." +ls_select_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + lower(ls_select_table) +  ls_use_link_sql + " WHERE " 	
				end if
			end if
			//if isnull(ls_datatype) then messagebox("datatype not anticipated","Retrieved null datatype")
		end if		
		//end of Modify
		ls_selectfieldlist[ll_FieldSeqID] = ls_select_field //Alfee 11.13.2008
		ls_typelist[ll_FieldSeqID] = ls_datatype //Alfee 11.13.200			
		
		//export_fields_use_link  sql
		if li_use_link = 1 then
			choose case ls_select_table
				case "pd_address"
					ls_use_link_sql2 = " (pd_address.rec_id = pd_address_link.address_id) and "
				case "pd_hosp_affil"
					ls_use_link_sql2 = " (pd_hosp_Affil.rec_id = pd_hosp_facility_link.hosp_affil_id) and "
				case "pd_board_specialty"
					ls_use_link_sql2 = " (pd_board_specialty.rec_id = pd_spec_facility_link.specialty_id) and "
				case else
					ls_use_link_sql2 = ""		
			end choose
		end if
		
		ls_bill_syn     = ls_bill_syn + ls_use_link_sql2
		ls_sny_retrieve = ls_sny_retrieve + ls_use_link_sql2
		
		//add facility where
		if li_facil_id > 0 then
			choose case ls_select_table
				case "pd_address"
					if li_use_link = 1 then//<add> 07/16/2007 by: Andy Reason:BugG062904
						ls_bill_syn     = ls_bill_syn + "(pd_address_link.facility_id = " + string(li_facil_id) + ") and "
						ls_sny_retrieve = ls_sny_retrieve + "(pd_address_link.facility_id = " + string(li_facil_id) + ") and "
					end if
				case "pd_hosp_affil"
					if li_use_link = 1 then//<add> 07/16/2007 by: Andy Reason:BugG062904
						ls_bill_syn     = ls_bill_syn + "(pd_hosp_facility_link.facility_id = " + string(li_facil_id) + ") and "
						ls_sny_retrieve = ls_sny_retrieve + "(pd_hosp_facility_link.facility_id = " + string(li_facil_id) + ") and "
					end if			
				case "pd_board_specialty"
					if li_use_link = 1 then//<add> 07/16/2007 by: Andy Reason:BugG062904
						ls_bill_syn     = ls_bill_syn + "(pd_spec_facility_link.facility_id = " + string(li_facil_id) + ") and "
						ls_sny_retrieve = ls_sny_retrieve + "(pd_spec_facility_link.facility_id = " + string(li_facil_id) + ") and "
					end if
				case "pd_affil_stat"
					ls_bill_syn     = ls_bill_syn + "(pd_affil_stat.parent_facility_id = " + string(li_facil_id) + ") and "
					ls_sny_retrieve = ls_sny_retrieve + "(pd_affil_stat.parent_facility_id = " + string(li_facil_id) + ") and "
				case else
					ls_bill_syn     = ls_bill_syn +  + "(" + ls_select_table + ".facility_id = " + string(li_facil_id) + ") and "
					ls_sny_retrieve = ls_sny_retrieve +  + "(" + ls_select_table + ".facility_id = " + string(li_facil_id) + ") and "

			end choose
		end if
			
		//3rd last add  - prac where
		//ls_bill_syn = ls_sny_retrieve //maha app080205
		ls_billsynList[ll_FieldSeqID] = ls_bill_syn
		if ai_type = 1 then
			ls_sny_retrieve = ls_sny_retrieve + lower(ls_select_table) + ".prac_id  = bb.prac_id "  + ls_filter
		elseif ai_type = 3 then 
			ls_sny_retrieve = ls_sny_retrieve + lower(ls_select_table) + ".prac_id " + ls_prac_ids + ls_filter
		elseif ai_type = 2 then 
			If lb_usingdb Then
				//ls_sny_retrieve = ls_sny_retrieve + lower(ls_select_table) + ".prac_id  in (" + ls_prac_ids  + ")"  + ls_filter
			Else
				ls_sny_retrieve = ls_sny_retrieve + lower(ls_select_table) + ".prac_id  in (" + ls_prac_ids  + ")"  + ls_filter
			End If
		end if
				
		//2nd last add  - prac where 
		if len(ls_aggre) > 0 then //maha 012703 for aggregate functions
			//ls_sny_retrieve = ls_sny_retrieve + " Group by " + lower(ls_select_table) + ".prac_id" + " , a" + ls_aggre
			ls_sny_retrieve = ls_sny_retrieve + " Group by " + lower(ls_select_table) + ".prac_id, FieldSeqID, billing_address_id, field_data_type" + ls_RowNo
		end if

		//comment 08/17/2007 by: Andy
		//ls_sny_retrieve = ls_sny_retrieve + "~r~n order by " + lower(ls_select_table) + ".prac_id , FieldSeqID "
		
		//modify 08/17/2007 by: Andy
		if len(ls_sort) > 0 and Not lb_true then//SQL2000 only  
			//ls_sny_retrieve = ls_sny_retrieve + "~r~n order by " + ls_sort
			ls_sny_retrieve = ls_sny_retrieve + "~r~n " + ls_sort
		end if
		
		/*comment 08/23/2007 by: Andy
		if len(ls_aggre) > 0 and Not lb_true then
			//ls_OrderBy = ls_OrderBy + " , field_value"
			ls_sny_retrieve = ls_sny_retrieve + " , field_value"
		end if
		*/
		
//			lb_flag = False
//		end if
		//end of add
		
		//modify 05/05/2008 by: Andy
		if Not lb_ASA7 then 
			ls_sny_retrieve = ls_sny_retrieve + " ) t" + String(ll_FieldSeqID)
		else
			ls_MySQL = "INSERT INTO " + ls_tabletemp + " ~r~n(prac_id,FieldSeqID, billing_address_id, field_value, field_data_type) ~r~n " + ls_sny_retrieve + " ;"
			EXECUTE IMMEDIATE :ls_Mysql;
			IF SQLCA.SQLCode <> 0 THEN
				MessageBox("Caution on export field " + ls_export_field, SQLCA.SQLERRTEXT)
				close(w_export_progress)
				//<add> 08/23/2007 by: Andy
				if lb_ASA7 then
					ls_Mysql = "DROP TABLE " + ls_tabletemp + ";"
					EXECUTE IMMEDIATE :ls_Mysql;
				end if
				//Start Code Change ----10.23.2008 #V85 maha
				of_cleanup_ds( )
//				if IsValid(lds_export_flds) then destroy lds_export_flds
//				if IsValid(lds_export_hdr) then destroy lds_export_hdr
//				if IsValid(lds_address_lookup) then destroy lds_address_lookup
//				if IsValid(lds_code_lookup) then destroy lds_code_lookup
//				if IsValid(lds_export_data) then destroy lds_export_data
//				if IsValid(lds_dept_chair) then destroy lds_dept_chair
//				if IsValid(lds_field) then Destroy lds_field
//				if IsValid(lds_export_dataTemp) then Destroy lds_export_dataTemp
//				if IsValid(lds_export_equiv_code) then Destroy lds_export_equiv_code
//				Destroy lds_tablepk
				//<del> 2008-05-04 by:nova
				//$<add> 01.07.2008 by: Andy
				//if lb_ASA7 then gnv_appeondb.of_commitqueue( )
				RETURN -1
			END IF
		END IF
		//end of add

		if isnull(ls_sny_retrieve) then ls_sny_retrieve = ""
		if Len(ls_sny_retrieve) > 0 then 
			//<add> 07/05/2007 by: Andy
			if ls_UnionSQL = "" then 
				ls_UnionSQL = ls_sny_retrieve
			else 
				ls_UnionSQL = ls_UnionSQL + "~r~n union all ~r~n" + ls_sny_retrieve
			end if
			//end of add
		end if
			
	//<add> andy 07.05.2007
	else //computer fields
		//Dynamic create computer columns in order to Calculate its value
		/*1.deal with Expression**************/
		ls_export_field     = ids_export_flds.GetItemString(p,"export_field_name")
		//<add> 08/24/2007 by: Andy
		of_replacespecchar(ls_export_field)
		//end of add
		ls_Expresstion      = Trim( ids_export_flds.GetItemString( p, "export_fields_expression" ) )//db_field_name
		ls_ComputerDataType = ids_export_flds.GetItemString(p,"ctx_column_datatype")
		if isnull(ls_export_field) then ls_export_field = ''
		if isnull(ls_Expresstion) then ls_Expresstion = ''
		if isnull(ls_ComputerDataType) then ls_ComputerDataType = ''
		if isnull(ls_field_format) then ls_field_format = ''
		if isnull(ls_fld_delim) then ls_fld_delim = ''
		ll_Cnt = ids_field.RowCount()
		
		//If the computer field is numeric,add the function number(  ) in to the Expresstion.
		//Replace symbol ' with "
		//comment 07/18/2007 by:Andy Reason:support other data type
		//if upper(ls_ComputerDataType) = 'N' then
		for ll_Num = 1 to ll_Cnt
			ls_Field         = ids_field.GetItemString(ll_Num,"export_field_name")
			ls_FieldDataType = ids_field.GetItemString(ll_Num,"ctx_column_datatype")
			if isnull(ls_Field) then ls_Field = ''
			if isnull(ls_FieldDataType) then ls_FieldDataType = ''
			//<add> 07/27/2007 by: Andy 
			//Reason:The Expresstion of a computer field cann't contain itself.
			if lower(ls_export_field) = lower(ls_Field) then continue
			//end of add
			
			//If the field used in then computer field and is number, 
			//add the function number(  ) in to the Expresstion 
			//Modify 07/18/2007 by: Andy
			if POS(lower(ls_Expresstion),lower(ls_Field)) > 0 then
				if upper(ls_FieldDataType) = 'N' then
					//Modify 07/17/2007 by: Andy if( isNull( rec_id  ), 0,  rec_id  )
					ls_Expresstion  = of_globalreplace( ls_Expresstion, ls_Field, "if( isNull( "+ls_Field+" ),0,number( " + ls_Field + " ))",true)
					//end of modify
				elseif upper(ls_FieldDataType) = 'S' then
					//string
					ls_Expresstion  = of_globalreplace( ls_Expresstion, ls_Field, "if( isNull( "+ls_Field+" ),''," + ls_Field + " )",true)
				//<add> 07/27/2007 by: Andy	
				ELSEIF upper(ls_FieldDataType) = 'D' then
					//Datetime
					ls_Expresstion  = of_globalreplace( ls_Expresstion, ls_Field, "if( isNull( "+ls_Field+" ),'1900-01-01'," + ls_Field + " )",true)
				end if
				//end of add
			end if
			//end of Modify
		next
		//end if
		
		//replace symbol ' with "
		ls_Expresstion  = lnvo_string.of_globalreplace( ls_Expresstion, '~~', '~~~~')
		ls_Expresstion  = lnvo_string.of_globalreplace( ls_Expresstion, '"', '~~"')//'"'
		//ls_Expresstion  = lnvo_string.of_globalreplace( ls_Expresstion, "'", "~~'")
		/*end of 1***************************/
		
		ls_tag = ls_field_format + '@^@' + ls_ComputerDataType + '@^@' + string(li_width) + '@^@' + ls_fld_delim
		//2.Dynamic create computer columns,the name equal ls_Field + '_c'
		ls_modify = "create compute(band=detail alignment='0' expression=~""+ls_Expresstion+"~" border='0' color='33554432' x='1157'" + &
		            " y='4' height='64' width='242' format='[GENERAL]' html.valueishtml='0'  name=" + ls_export_field + "_c visible='0'" + &
						" font.face='MS Sans Serif' font.height='-8' font.weight='400'  font.family='2' font.pitch='2' font.charset='0'" + &
						" background.mode='1' background.color='536870912' tag='" + ls_tag + "' )"
		ls_Err    = ids_export_dataTemp.Modify(ls_modify)
		//end of 2		
		//end of add
	End If
next
//<del> 2008-05-04 by:nova
//<add> 08/23/2007 by: Andy
//if lb_ASA7 then gnv_appeondb.of_commitqueue( )

w_export_progress.r_bar.Width = w_export_progress.r_bar.Width + 50
w_export_progress.st_export.text = "Retrieve Data"

ll_FieldCnt = ll_FieldSeqID
//Modify 07/05/2007 by:Andy 
if ls_UnionSQL <> "" then
	//Modify 08/23/2007 by: Andy
	if lb_true THEN//SQL2005 and ASA9
		//ls_UnionSQL = ls_UnionSQL + "~r~n order by " + "prac_id , FieldSeqID "//ls_OrderBy
		ls_UnionSQL = ls_UnionSQL + "~r~n order by " + "FieldSeqID, prac_id , Row_No"
	end if
	
	//modify 08/23/2007 by: Andy Reason:Moved before here
	//ll_maxwidth = Long(ids_export_flds.describe("evaluate('max(export_field_length)',0)"))
	//if ll_maxwidth < 30 then ll_maxwidth = 30
	
	//<modify> 08/23/2007 by: Andy
	if lb_true then ls_RowNo = ", 0 Row_No"//SQL2005 AND ASA9
	if lb_ASA7 then
		ls_SqlSelect = "Select prac_id,FieldSeqID,billing_address_id,field_value,field_data_type from " + ls_tabletemp
	else
		ls_SqlSelect = "Select top 1 0 prac_id, 1 FieldSeqID, 0 billing_address_id,  cast('' as varchar(" + String(ll_maxwidth) + ")) field_value,  ' ' field_data_type" + ls_RowNo + " from pd_basic"
	end if
	
	ls_presentation_str = "style(type=grid)"		
	
	ls_dwsyntax_str = SQLCA.SyntaxFromSQL(ls_SqlSelect, ls_presentation_str, ERRORS)
	IF Len(ERRORS) > 0 THEN
		// + ls_export_field
		MessageBox("Caution on export field ", &
		"SyntaxFromSQL caused these errors: " + ERRORS + "~r~r" + ls_SqlSelect)
		close(w_export_progress)
		//<add> 08/23/2007 by: Andy
		if lb_ASA7 then
			ls_Mysql = "DROP TABLE " + ls_tabletemp + ";"
			EXECUTE IMMEDIATE :ls_Mysql;
		end if
		//<add> andy 07.017.2007
		//destroy the ds
		//Start Code Change ----10.23.2008 #V85 maha
		of_cleanup_ds( )
//		if IsValid(lds_export_flds) then destroy lds_export_flds
//		if IsValid(lds_export_hdr) then destroy lds_export_hdr
//		if IsValid(lds_address_lookup) then destroy lds_address_lookup
//		if IsValid(lds_code_lookup) then destroy lds_code_lookup
//		if IsValid(lds_export_data) then destroy lds_export_data
//		if IsValid(lds_dept_chair) then destroy lds_dept_chair
//		if IsValid(lds_field) then Destroy lds_field
//		if IsValid(lds_export_dataTemp) then Destroy lds_export_dataTemp
//		if IsValid(lds_export_equiv_code) then Destroy lds_export_equiv_code
//		Destroy lds_tablepk
//		//end of add
		RETURN -1
	END IF

	ids_export_retrieve = CREATE n_ds
	w = ids_export_retrieve.Create( ls_dwsyntax_str, ERRORS)
	if w < 1 then
		//messagebox("error on create",errors)
 		messagebox("Error on Create",errors)
		close(w_export_progress)
		//<add> 08/23/2007 by: Andy
		if lb_ASA7 then
			ls_Mysql = "DROP TABLE " + ls_tabletemp + ";"
			EXECUTE IMMEDIATE :ls_Mysql;
		end if
		//<add> andy 07.017.2007
		//destroy the ds
		//Start Code Change ----10.23.2008 #V85 maha
		of_cleanup_ds( )
//		if IsValid(lds_export_flds) then destroy lds_export_flds
//		if IsValid(lds_export_hdr) then destroy lds_export_hdr
//		if IsValid(lds_address_lookup) then destroy lds_address_lookup
//		if IsValid(lds_code_lookup) then destroy lds_code_lookup
//		if IsValid(lds_export_data) then destroy lds_export_data
//		if IsValid(lds_dept_chair) then destroy lds_dept_chair
//		if IsValid(lds_field) then Destroy lds_field
//		if IsValid(lds_export_dataTemp) then Destroy lds_export_dataTemp
//		if IsValid(lds_export_equiv_code) then Destroy lds_export_equiv_code
//		Destroy lds_tablepk
		//end of add
		return -1
	end if
	
	//Modify 08/23/2007 by: Andy
	if Not lb_ASA7 then
		ids_export_retrieve.Modify('DataWindow.Table.Select="' + ls_UnionSQL + '"')
	end if
	
	ids_export_retrieve.SetTransObject( SQLCA )
	ll_ret_cnt = ids_export_retrieve.retrieve()
	
	//<add> 05/05/2008 by: Andy
	if ll_Ret_Cnt < 0 then		
		//Reason:check syntax
		ls_presentation_str = "style(type=grid)"
		
		ls_dwsyntax_str = SQLCA.SyntaxFromSQL(ls_UnionSQL, ls_presentation_str, ERRORS)
		IF Len(ERRORS) > 0 THEN
			MessageBox("Caution on export" , &
			"SyntaxFromSQL caused these errors: " + ERRORS)
			close(w_export_progress)

			if lb_ASA7 then
				ls_Mysql = "DROP TABLE " + ls_tabletemp + ";"
				EXECUTE IMMEDIATE :ls_Mysql;
			end if
		//Start Code Change ----10.23.2008 #V85 maha
			of_cleanup_ds( )
//			if IsValid(lds_export_flds) then destroy lds_export_flds
//			if IsValid(lds_export_hdr) then destroy lds_export_hdr
//			if IsValid(lds_address_lookup) then destroy lds_address_lookup
//			if IsValid(lds_code_lookup) then destroy lds_code_lookup
//			if IsValid(lds_export_data) then destroy lds_export_data
//			if IsValid(lds_dept_chair) then destroy lds_dept_chair
//			if IsValid(lds_field) then Destroy lds_field
//			if IsValid(lds_export_dataTemp) then Destroy lds_export_dataTemp
//			if IsValid(lds_export_equiv_code) then Destroy lds_export_equiv_code
//			Destroy lds_tablepk

			RETURN -1
		END IF		
	end if
	//end of add
	
end if
//end of Modify

w_export_progress.r_bar.Width = w_export_progress.r_bar.Width + 60
//Modify 08/22/2007 by: Andy
//li_bar_ticks = (1000 - 500) / li_prac_id_cnt
li_bar_ticks = (1000 - 500) / li_fld_cnt
//end of modiy

//%%%%%%%%%%%%%%%%%%%%%%%%%%%% end of create syntax

ls_prac_field = ids_export_retrieve.describe("#1.name")
//Modify 07/10/2007 by: Andy
DO WHILE (ll_i <= ll_ret_cnt)
	ll_j = 0
	ls_data_value = ""
	ls_value = ""
	ls_lookup_val = ""
	ldt_value = datetime(date("0000-00-00"),time("00:00:00"))
	
	ll_pracid       = ids_export_retrieve.GetitemNumber(ll_i,ls_prac_field)
	ll_FieldSeqID   = ids_export_retrieve.GetitemNumber(ll_i,"FieldSeqID")
	li_recd_no      = li_recdnoList[ll_FieldSeqID] 
	ls_select_table = ls_tablelist[ll_FieldSeqID]				
	ls_select_field = ls_selectfieldlist[ll_FieldSeqID]
	ls_datatype 	 = ls_typelist[ll_FieldSeqID] //Alfee 11.13.200		
	li_billing 		 = li_billinglist[ll_FieldSeqID] //Alfee 11.13.200		
	ls_export_field = ls_fieldlist[ll_FieldSeqID]			
	ls_field_format = ls_formatList[ll_FieldSeqID]		
	ll_export_code  = ll_exportcodeList[ll_FieldSeqID]
	li_sub_start    = li_substartList[ll_FieldSeqID]
	li_width        = li_widthList[ll_FieldSeqID]
	ls_fld_delim    = ls_flddelimList[ll_FieldSeqID]			
	ls_text         = ls_textList[ll_FieldSeqID]
	li_facil_id     = li_facil_idList[ll_FieldSeqID]
	li_act_format   = li_act_formatList[ll_FieldSeqID]
		
	ud = li_udList[ll_FieldSeqID]
	if ud = 1 or ud = 3 then
		ls_def_val = ls_defvalList[ll_FieldSeqID]
	elseif ud = 2 then //column default
		col = Long(ls_defvalList[ll_FieldSeqID])
	else
		ls_def_val = ""
	end if
	
	//Modify 08/22/2007 by: Andy
	if ll_FieldSeqIDold <> ll_FieldSeqID then	
		ll_R = 0 
		//ll_R = ids_export_data.Find("rec_id= " + String(ll_pracid),ll_R + 1,li_prac_id_cnt)
		ll_FieldSeqIDold = ll_FieldSeqID
		w_export_progress.st_export.text  = ls_select_table + "_" + ls_select_field    //string(ll_FieldSeqID) + "   " + 
		w_export_progress.st_export1.text = ls_select_field  
		
		w_export_progress.r_bar.Width = w_export_progress.r_bar.Width + li_bar_ticks //* (ll_R - ll_Rorig)
		//ll_Rorig = ll_R
	end if
	
	//MODIFY 10/12/2007 by:Andy
	//ll_R = ids_export_data.Find("rec_id= " + String(ll_pracid),ll_R + 1,li_prac_id_cnt)
	FOR ll_R = ll_R + 1 to li_prac_id_cnt
		IF al_prac_ids[ll_R] = ll_pracid THEN EXIT
	NEXT
	//end of modify
	
	//QQ:Find the max row of the current FieldSeqID
	/*modify 08/22/2007 by: Andy
	ls_find = "(" + ls_prac_field + " = " + String(ll_pracid) + " AND FieldSeqID > " + String(ll_FieldSeqID) + &
				 ") OR (" + ls_prac_field + " > " + String(ll_pracid) + ")"*/
	ls_find = "(" + ls_prac_field + " > " + String(ll_pracid) + " AND FieldSeqID = " + String(ll_FieldSeqID) + &
				 ") OR ( FieldSeqID  > " + String(ll_FieldSeqID) + ")"
	ll_j    = ids_export_retrieve.Find ( ls_find, ll_i + 1, ll_ret_cnt )
	if ll_j > 0 then 
		//The max row of the current FieldSeqID
		ll_j = ll_j - 1
	end if

	//Perhaps it is the last ll_pracid and it is the max FieldSeqID,
	//then set ll_j = ll_ret_cnt(max row in the ds)
	if ll_j = 0 then 
		ll_j = ll_ret_cnt
	end if
	//end of QQ
	
	//max - min + 1 = total(current FieldSeqID)
	if ll_j - ll_i + 1 >= li_recd_no then
		//find out
		ll_prac_row = ll_i + li_recd_no - 1 
	else
		//Not 
		ll_prac_row = 0
	end if
	
	//process data
	if ll_prac_row > 0 then
		//ls_datatype     = ids_export_retrieve.getitemString(ll_prac_row, "field_data_type" )	- commented by alfee 11.13.2008

		if li_billing = 1 then //maha app080205 to get billing address data 
			ll_billing_id   = ids_export_retrieve.getitemnumber(ll_prac_row, "billing_address_id" )
			ls_data_value = of_get_billing(ll_billing_id,ls_datatype,ls_select_field,ls_field_format,ls_billsynList[ll_FieldSeqID])//ls_bill_syn
		else
			ls_data_value = ids_export_retrieve.getitemString(ll_prac_row, "field_value")
			/*comment 08/28/2007 by:Andy Reson:use of_data_format function
			if ls_datatype = 'T' or ls_datatype = 'D' then
				ldt_value = datetime(date(left(ls_data_value,10)),time(right(ls_data_value,5)))
				//format the date
				ls_value = of_date_format(ls_field_format,ldt_value) //maha 070705
					//messagebox("date value",ls_value)
				ls_data_value = string(ls_value)
				//end if
			end if
			*/
		end if
	else
		//do nothing
	end if
	
	//comment 08/24/2007 by: Andy
	//ls_export_field = lnvo_string.of_globalreplace( ls_export_field, "#", "_")
	//<add> andy 07.05.2007 save original values
	if lower(ids_export_dataTemp.describe(ls_export_field + ".name")) = lower(ls_export_field) then
		//Begin - Added By Mark Lee 09/29/12 its cannot use double quote to merge data values in  the MS word.
		If Pos(ls_data_value,'"') > 0 Then 
			gnv_debug.of_output(true, 'Alarm  Export: Its used the double quote Replace the blank data in merged data value on the column ['+ls_export_field+'], and this current data value is the ['+ls_data_value+'].' )
			ls_data_value  = lnvo_string.of_globalreplace( ls_data_value, '"', ' ')
		End If
		//End - Added By Mark Lee 09/29/12
		ids_export_dataTemp.SetItem(ll_R,ls_export_field,ls_data_value)
	end if
	//end of add
		
	if ls_format = "export" then
		if isnull(ls_data_value) then ls_data_value = ""
	end if

	//<add> 08/28/2007 by: Andy
	of_data_format(ls_field_format,ls_datatype,ls_data_value)
	//end of add
	
	/*comment 08/28/2007 by:Andy Reson:use of_data_format function
	//address format
	if ls_field_format = "(xxx)xxx-xxxx" then
		w = len(ls_data_value)
		if w > 0 then //maha 82202
			for a = w to 1 step - 1 //strip existing format
				if not isnumber(mid(ls_data_value,a,1)) then							
					ls_data_value = mid(ls_data_value,1,a - 1 ) + mid(ls_data_value,a + 1 )
				end if					
			next
			ls_data_value = "(" + mid(ls_data_value,1,3 ) + ")" + mid(ls_data_value,4,3 ) + "-" + mid(ls_data_value,7,4 )
		end if
	end if
	
	//--------------------------- APPEON BEGIN ---------------------------
	//$<add> 04.13.2007 By: Jack
	If ls_field_format = "$##,###" Then
		If isnumber(ls_data_value) Then
			//<add> 06/22/2007 by: Andy fixed bug5(Contract Logix/Contract Logix_Issues_6-21-07.doc)
			//Because if value equal to 0,it will display "$".
			if double(ls_data_value) = 0 then setnull(ls_data_value)
			If isnumber(ls_data_value) Then
				ls_data_value = string(Round ( double(ls_data_value), 0 ),"$##,###")
			end if
			//end of add
			//comment 06/22/2007 by: Andy
			//ls_data_value = string(long(ls_data_value),"$##,###")
		End If
	ElseIf ls_field_format = "$##,###.##" Then
		If isnumber(ls_data_value) Then
			//<add> 06/22/2007 by: Andy fixed bug5(Contract Logix/Contract Logix_Issues_6-21-07.doc)
			//Because if value equal to 0,it will display "$.".
			if double(ls_data_value) = 0 then setnull(ls_data_value)
			If isnumber(ls_data_value) Then
				ls_data_value = string(Round( double(ls_data_value), 2 ),"$##,###.##")
			end if
			//end of add
			//comment 06/22/2007 by: Andy
			//ls_data_value = string(double(ls_data_value),"$##,###.##")
		End If
	//<add> 06/20/2007 by: Andy
	elseif ls_field_format = "$##,###.00" Then
		If isnumber(ls_data_value) Then
			//<add> 06/22/2007 by: Andy fixed bug5(Contract Logix/Contract Logix_Issues_6-21-07.doc)
			//Because if value equal to 0,it will display "$.00".	
			if double(ls_data_value) = 0 then setnull(ls_data_value)
			If isnumber(ls_data_value) Then
				ls_data_value = string(Round( double(ls_data_value), 2 ),"$##,###.00")
			end if
			//end of add
			//comment 06/22/2007 by: Andy
			//ls_data_value = string(double(ls_data_value),"$##,###.00")
		End If
	//end of add
	End If			
	//---------------------------- APPEON END ----------------------------
	*/
	
	//*****GET EXPORT CODES
	//if ids_export_flds.GetItemnumber( p, "export_code" )  = 1 then //get export code if required
	if ll_export_code  = 1 then //get export code if required
		ls_lookup_val = ls_data_value    //ids_export_data.getitemstring(i,p) //changed 100102
		//Modify 07/09/2007 by: Andy
		//use datastore
		if isnull(ls_lookup_val) then ls_lookup_val = ''
		ll_equivcode = ids_export_equiv_code.Find( "export_id = " + String(ai_export_id) + " and lookup_code= " + ls_lookup_val, 0, ll_equivcodeCnt)
		if ll_equivcode > 0 then
			ls_value = ids_export_equiv_code.GetitemString(ll_equivcode,"equiv_code")
		end if 
		if not isnull(ls_value) and trim(ls_value) <> '' then ls_data_value = ls_value //if no export code use org value
		//end of modify
		if isnull(ls_data_value) then ls_data_value = ""
	end if				
					
	//****Dept Chair data  maha 010704
	ls_dc_field = ls_dcfieldList[ll_FieldSeqID]	
	if ls_dc_field = 'none' or isnull(ls_dc_field) then 
		//skip
	else  //if set to a field name get the data
		if isnumber(ls_data_value) then
			if ids_dept_chair.retrieve(li_facil_id,long(ls_data_value)) > 0 then
				ls_data_value = ids_dept_chair.getitemstring(1,ls_dc_field)
			else
				ls_data_value = ""
			end if
		end if				
	end if
	//Active Status format for affil stat maha 083105
	//if ids_export_flds.getitemnumber(p,"intcred_field") = 100000 then
	ll_intcred_field = ll_intcredfieldList[ll_FieldSeqID]
	if ll_intcred_field = 100000 then
		if li_act_format = 1 then
			if ls_data_value = "1" then
				ls_data_value = "Y"
			else
				ls_data_value = "N"
			end if
		elseif li_act_format = 2 then	
			choose case ls_data_value
				case "1"
					ls_data_value = "Active"
				case "2"
					ls_data_value = "Purge"
				case "3"
					ls_data_value = "Inactive"
				case "4"
					ls_data_value = "Pending"
				case "0"
					ls_data_value = "History"
			end choose
		end if
	end if

	if ls_strip_char <> "NONE" then
		ls_data_value = of_strip_char( ls_strip_char ,ls_data_value, "")
	end if
	
	//*** substring function***************************maha 010305
	if li_sub_start > 1 then ls_data_value = mid(ls_data_value,li_sub_start,li_width)
	
	//***padding //note if avoid using return, double return, empty string or tab when padding
	ls_data_value = mid(ls_data_value,1,li_width) //shrink the length to size 
	if ls_field_format = "Leading Padding" or ls_field_format = "Trailing Padding" then 
		if li_width - len(ls_data_value) > 0 then
			li_dif = li_width - len(ls_data_value)
			ls_pad = "" //reset
			/*comment 07/09/2007 by: Andy
			//use Fill ( chars, n )
			for a = 1 to li_dif  //pad field to width if required
				ls_pad = ls_pad + ls_fld_delim 
			next
			*/
			ls_pad = Fill ( ls_fld_delim, li_dif )
			if ls_field_format = "Leading Padding" then
				ls_data_value = ls_pad + ls_data_value 
			else
				ls_data_value = ls_data_value + ls_pad
			end if
		end if
	elseif ls_field_format = "use text" then //allows a set value if data is found
		if len(ls_data_value) > 0 then
			ls_data_value = ls_text
		end if
	elseif ls_field_format = "Numbers" then //Start Code Change ----04.21.2008 #V8 maha - added for strip to numbers
		ls_data_value = of_strip_char( "#", ls_data_value ,  "@NUM@")
	end if	

	//****set default moved here 091305
	if ud > 0 then
		//Start Code Change ---- 05.03.2006 #449 maha
		if ud = 3 then
			ls_data_value = ls_def_val + ls_data_value
		end if
		//End Code Change---05.03.2006
		if isnull(ls_data_value) then ls_data_value = ""
		if ls_data_value = "" then
			if ud = 1 then
				ls_data_value = ls_def_val
			elseif ud = 2 then //if set to column get the value out of that column
				if col < 1 or col > li_fld_cnt then //setting trap
					messagebox("Invalid setting","You are using a column default for column " + ls_export_field + " , but your default value is not a valid column number.~rThe default column number must be less than this column.")
					close(w_export_progress)
					//<add> 08/23/2007 by: Andy
					if lb_ASA7 then
						ls_Mysql = "DROP TABLE " + ls_tabletemp + ";"
						EXECUTE IMMEDIATE :ls_Mysql;
					end if
					//<add> andy 07.017.2007
					//destroy the ds
		//Start Code Change ----10.23.2008 #V85 maha
					of_cleanup_ds( )
//					if IsValid(lds_export_flds) then destroy lds_export_flds
//					if IsValid(lds_export_hdr) then destroy lds_export_hdr
//					if IsValid(lds_address_lookup) then destroy lds_address_lookup
//					if IsValid(lds_code_lookup) then destroy lds_code_lookup
//					if IsValid(lds_export_data) then destroy lds_export_data
//					if IsValid(lds_dept_chair) then destroy lds_dept_chair
//					if IsValid(lds_field) then Destroy lds_field
//					if IsValid(lds_export_dataTemp) then Destroy lds_export_dataTemp
//					if IsValid(lds_export_equiv_code) then Destroy lds_export_equiv_code
//					Destroy lds_tablepk
					//end of add
					return 0
				end if
				ls_data_value = ids_export_data.getitemstring(ll_R,col)
			end if
		end if
	end if
	
	//*********value set**********
	if lower(ids_export_data.describe(ls_export_field + ".name")) = lower(ls_export_field) then
		ids_export_data.setitem(ll_R,ls_export_field,ls_data_value)
	end if
	
	//processing the next field(fieldseqid)
	ll_i = ll_j + 1	
LOOP 

//<add> 08/27/2007 by: Andy process default value
if of_export_processdefault(ids_export_hdr,ids_export_flds,ids_export_datatemp,ids_export_data) = -1 then 
	close(w_export_progress)
	if lb_ASA7 then
		ls_Mysql = "DROP TABLE " + ls_tabletemp + ";"
		EXECUTE IMMEDIATE :ls_Mysql;
	end if
	//Start Code Change ----10.23.2008 #V85 maha
	of_cleanup_ds( )
//	if IsValid(lds_export_flds) then destroy lds_export_flds
//	if IsValid(lds_export_hdr) then destroy lds_export_hdr
//	if IsValid(lds_address_lookup) then destroy lds_address_lookup
//	if IsValid(lds_code_lookup) then destroy lds_code_lookup
//	if IsValid(lds_export_data) then destroy lds_export_data
//	if IsValid(lds_dept_chair) then destroy lds_dept_chair
//	if IsValid(lds_field) then Destroy lds_field
//	if IsValid(lds_export_dataTemp) then Destroy lds_export_dataTemp
//	if IsValid(lds_export_equiv_code) then Destroy lds_export_equiv_code
//	Destroy lds_tablepk
	return 0	
end if
//end of add

//<add> andy 07.05.2007
//set Calculated field value and format into lds_export_data 
//with the relative computer column in lds_export_dataTemp
//Modify 08/22/2007 by: Andy
of_export_calculatedfield(ids_export_dataTemp,ids_export_data,ls_format)
//end of add

w_export_progress.r_bar.Width = 1000

//@@@@@@@@@@@@@@@@@@@multi row function @@@@@@@@@@@@@@@@

if li_multi_table > 0 then
	w = 1
	for a = 1 to li_fld_cnt  //get list of fields
		if ids_export_flds.getitemnumber(a,"intcred_table") = li_multi_table then
			li_multi_field[w] = a
			w++
		end if
	
	next
	//Start Code Change ---- 10.01.2007 #V7 maha added code for teh multi table where and modified function call
	li_pos1 = pos(upper(ls_multi_where),"PROMPT1",1)
	if li_pos1 > 0 then
		ls_multi_where = mid(ls_multi_where,1,li_pos1 - 1) + as_param1 + mid(ls_multi_where,li_pos1 + 7)
	end if
	li_pos1 = pos(upper(ls_multi_where),"PROMPT2",1)
	if li_pos1 > 0 then
		ls_multi_where = mid(ls_multi_where,1,li_pos1 - 1) + as_param2 + mid(ls_multi_where,li_pos1 + 7)
	end if
	li_pos1 = pos(upper(ls_multi_where),"PROMPT3",1)
	if li_pos1 > 0 then
		ls_multi_where = mid(ls_multi_where,1,li_pos1 - 1) + as_param3 + mid(ls_multi_where,li_pos1 + 7)
	end if
	
	of_multi_row(ids_export_data,"not used",li_multi_table,li_multi_field[],ids_export_flds,al_prac_ids[],ls_multi_where)
	//End Code Change---10.01.2007
end if

//end multi row
//Modify 07/18/2007 by: Andy
//if ai_save_data = 1 then //maha 021003
//1:save / 3:save & preview
if ai_save_data = 1 or ai_save_data = 3 then
//end of modify
	w_export_progress.st_progress.text = "Saving File"
	w_export_progress.r_bar.Width = 500
// comment 07/09/2007 by: Andy
//Reason: The rec_id's values have setted before here.
//	FOR i = 1 TO li_prac_id_cnt
//		ids_export_data.setitem(i,"rec_id",al_prac_ids[i])
//	next
// end of comment 
	sd = ids_export_data.update()
	if sd < 1 then
		messagebox("Save error","Unable to save data to table")
	end if
	commit using sqlca;
end if

w_export_progress.r_bar.Width = 1000

//******************************* CREATE FILE
//\/maha 121205 moved out of first portion of if statement below; rebuilt file naming
w_export_progress.st_progress.text = "Creating File"
w_export_progress.r_bar.Width = 300

//modify 08/22/2007 by: Andy
//li_bar_ticks = 1000 / li_prac_id_cnt
li_bar_ticks = 1000 / li_fld_cnt
//end of modify

ls_save_path = as_path
ls_save_path = gnv_string.of_replace_env_var(ls_save_path) //Added By Ken.Guo 12/10/2013

//<add> 08/28/2007 by: Andy
if right(ls_save_path,1) = ':' then ls_save_path = ls_save_path + "\"
ll_lastpos = LastPos(ls_save_path,'.') 
if ll_lastpos > 0 then
	ls_save_path = Left(ls_save_path,ll_lastpos - 1)
end if

//Added By Ken.Guo 2011-01-11.
If invo_rights.of_check_dir_right(ls_save_path) <> 1 Then
	//Messagebox('','')
	ls_save_path = gs_dir_path + gs_DefDirName + "\ExportData\"
	gnv_appeondll.of_parsepath(ls_save_path)	
End If

//create name of file
if mid(ls_save_path,len(ls_save_path),1) <> "\" then //maha app 102405 if a file name is indicated do not tack on the table name
	ls_path = ls_save_path + ls_format
else
	//Start Code Change ---- 09.27.2007 #V7 maha
	Choose case li_custom_save
		case 1,2,3
			ls_save_name = of_custom_name(li_custom_save,ls_table_name,ldt_date)
		case else  //0,509.27
			ls_save_name = ls_table_name
	end choose
	
//	if li_custom_save > 0 then  //maha new 121205 for custom naming of file
//		ls_save_name = of_custom_name(li_custom_save,ls_table_name,ldt_date)
//	else
//		ls_save_name = ls_table_name
//	end if
//End Code Change---09.27.2007
	ls_path = ls_save_path + ls_save_name + ls_format
end if

//<add> 08/28/2007 by: Andy 
as_path = ls_path
//end of add

//messagebox("ls_path",ls_path)

//Start Change Code By Jervis 07.24.2007
//Create path if not exists
ls_save_path = mid(ls_path,1,lastpos(ls_path,'\'))
gnv_appeondll.of_parsepath(ls_save_path)
//End Change Code By Jervis

gnv_rights.of_check_dir_right( ls_path, true, 'Export')

if lb_export = false then  //if the auto export path is blank use the export path, if blank use the hard coded path
	choose case ls_format
		case ".txt" //tab delimited
			if ls_header = "1" then 
				g = ids_export_data.saveas(ls_path,text!,true)
			else
				g = ids_export_data.saveas(ls_path,text!,false)
			end if
		case ".xls" //excel
			if ls_header = "1" then 
				g = ids_export_data.saveas(ls_path,excel!,true)
			else
				g = ids_export_data.saveas(ls_path,excel!,false)
			end if
		case ".csv" //excel
			if ls_header = "1" then 
				g = ids_export_data.saveas(ls_path,csv!,true)
			else
				g = ids_export_data.saveas(ls_path,csv!,false)
			end if
	end choose
	w_export_progress.r_bar.Width = 1000
	if g = -1 then messagebox("saveas -1","Unable to save file.  Check path (" + ls_path + ") and make sure a copy of the file is not open.")
else //export and csv files
	//build export text file
	li_file_num = FileOpen(ls_path, lineMode!, Write!, LockWrite!, Replace!)//maha changed to line mode 091002
	for i = 1 to li_prac_id_cnt	
		w_export_progress.r_bar.Width = w_export_progress.r_bar.Width + li_bar_ticks
		
		ls_export_text_file = ""
		
		for p = 1 to li_fld_cnt
			ls_data_value = ids_export_data.Getitemstring(i,p)
			ls_fld_delim = ids_export_flds.GetItemString( p, "trailing_leading_characters")
			ls_field_format = ids_export_flds.getitemstring(p,"export_format")
			//Start Code Change ---- 01.23.2006 #210 maha			
			if isnull(ls_data_value) then ls_data_value = ""  //maha 012306 added trap
			//End Code Change---01.23.2005 
			//maha 121205 in a csv file force all field delimiters to comma
			if ls_format = ".csv" then	
				ls_fld_delim = "," 
				ls_rec_delim = ""
			end if
			ls_field_format = ids_export_flds.getitemstring(p,"export_format")
			choose case ls_fld_delim
				case "E" //empty String
					ls_delim_value = ""
				case "S" // space
					ls_delim_value = " "
				case "T" //tab
					ls_delim_value = "	"
				case "R" //return
					ls_delim_value = "~r"	
				case "D" //return
					ls_delim_value = "~r~n"
				case else
					ls_delim_value = ls_fld_delim
			end choose
			if isnull(ls_delim_value) then ls_delim_value = ""
			if ls_field_format = "Leading Padding" or ls_field_format = "Trailing Padding" then //don't add delimit value
				ls_export_text_file = ls_export_text_file + ls_data_value
			else
				if ls_format = ".csv"  and p = li_fld_cnt then
					//messagebox("","csv")//skip last delim
				else
					ls_export_text_file = ls_export_text_file + ls_data_value + ls_delim_value
				end if
			end if
			
		next
		
		ls_export_text_file = ls_export_text_file + ls_rec_delim
		p = 1
		//following for line mode //set 091002
		
		//Start Code Change ---- 06.12.2006 #537 maha
			g = FileWrite ( li_file_num, ls_export_text_file)
			if g = -1 then 
				messagebox("File write error record # " + string(i) ,"Unable to write to file " + ls_path + " .")
				li_fail_count++
			end if
						
			if li_fail_count = 3 then 
				messagebox("File write error" ,"Repeted fail to write to file " + ls_path + " .  Aborting export write.  Check directory/file permissions.")
				exit
			end if
		//End Code Change---06.12.2006		
	next
		
	fileclose(li_file_num)	
end if

close(w_export_progress)

//Begin - Added By Mark Lee 07/23/2013. update the sqltext
of_update_export_sqltext(ai_export_id,ls_prac_sql,ls_UnionSQL)
//End - Added By Mark Lee 07/23/2013.

//$<add> 06.06.2008 by Andy
//$<Reason> When IntelliCred Email call it,Merge field failed,so add it.
ids_export_data = ids_export_data
//end 06.06.2008

//<add> 07/18/2007 by: Andy
//2:preview / 3:save & rpeview
if ai_save_data = 2 or ai_save_data = 3 then
	lstr_pass.s_string = is_select_syntax
	lstr_pass.s_ds = ids_export_data
	lstr_pass.s_string_array[1] = ls_UnionSQL
	openwithparm( w_export_previewdata, lstr_pass )
end if
//end of add

//<add> 08/23/2007 by: Andy
if lb_ASA7 then
	ls_Mysql = "DROP TABLE " + ls_tabletemp + ";"
	EXECUTE IMMEDIATE :ls_Mysql;
end if

//$<add> 05.07.2008 by Andy
if lb_mulsel then
	ls_Mysql = "DELETE FROM export_temp WHERE SpID = " + String(ll_spid) + ";"
	EXECUTE IMMEDIATE :ls_Mysql;
end if


//Start Code Change ----10.23.2008 #V85 maha
of_cleanup_ds( )
//destroy the ds
//destroy ids_export_flds
//destroy ids_export_hdr
//destroy ids_address_lookup
//destroy lds_code_lookup
////destroy lds_export_data //<del> 06.06.2008 by Andy
//destroy lds_dept_chair
////<add> andy 07.05.2007
//Destroy lds_field
//Destroy lds_export_dataTemp
//Destroy lds_export_equiv_code
//Destroy lds_tablepk
//end of add

return 1

end function

public function integer of_multi_row (n_ds ads_export, string as_table, integer ai_table, integer ai_col_num[], n_ds ads_exp_fields, long al_prac_ids[], string as_where);//maha created 121505 to create multiple data rows for each practitoner

w_export_progress.st_progress.text = "Adding multiple records"
w_export_progress.r_bar.Width = 300

long r
long rc
long org_cnt
long d
long dc
long ll_prac
long p
long pc
long ll_find
long alu
long clu
long row_cnt
integer a
integer ac
integer w
integer li_bar_ticks
integer li_sub_start
integer li_len
integer p1 //Start Code Change ---- 10.01.2007 #V7 maha
long ll_row_loc[]
long ll_dummy[]
datetime ldt_data
//string ls_datatype
string ls_syntax
string ls_fields
string ls_table
string ls_value
string ls_lu_type
string ls_lu_field
string ls_datatype[]
string ls_sny_retrieve
string ls_presentation_str
string ls_dwsyntax_str
string ERRORS
string ls_type[]
string ls_where  //Start Code Change ---- 10.01.2007 #V7 maha
string ls_fname  //Start Code Change ---- 10.01.2007 #V7 maha
n_ds lds_addr_lu
n_ds lds_code_lu
n_ds lds_getdata


org_cnt = ads_export.rowcount()

li_bar_ticks = 1000 / org_cnt
if org_cnt = 0 then //redundant trap
	messagebox("No Data","Ending of_multi_row")
	return -1
end if

lds_addr_lu = create n_ds
lds_code_lu = create n_ds

lds_addr_lu.dataobject = "d_dddw_address_lookup_all"
lds_code_lu.dataobject = "d_dddw_code_lookup_all"

lds_addr_lu.settransobject(sqlca)
lds_code_lu.settransobject(sqlca)

//create dynamic ds to retrieve each practitioners' data for the extra table
ads_exp_fields.setfilter("intcred_table = " + string(ai_table) )
ads_exp_fields.filter()
ac = ads_exp_fields.rowcount()

if ac = 0 then return 0	//Fix a bug By Jervis 07.05.2007

ls_table = ads_exp_fields.getitemstring(1,"db_table_name")



if ac <> upperbound(ai_col_num[]) then
	//messagebox("count mismatch","problem")
	messagebox("Error","Count mismatch.")
	return 0
end if

for a = 1 to ac
	ls_fields = ls_fields + ads_exp_fields.getitemstring(a,"db_field_name") + ","
	ls_type[a] = ads_exp_fields.getitemstring(a,"db_field_type")
	//messagebox("dtype",ls_fields + "  " + ls_type[a])
next

ls_fields = mid(ls_fields, 1,len(ls_fields) - 1)  //drop last comma

lds_getdata = CREATE n_ds
//for each row of practitioner data in the table copy the export row for that practitoner to the end of the export

pc = upperbound(al_prac_ids[])
//debugbreak()
row_cnt = 1
for r = 1 to pc //for the list of passed pracids
	//messagebox("",ads_export.rowcount())
	ll_row_loc = ll_dummy
	ll_prac = al_prac_ids[r]
	debugbreak()
	//ads_export.getitemnumber(r,ads_export.describe("#1.name"))
	ll_row_loc[1] = row_cnt
	
	//Start Code Change ---- 10.01.2007 #V7 maha
	//If ib_nyp_fte = true then //added for NYP FTE report
	//	ls_syntax = "SELECT * from " + ls_table //assumed to be their custom screen grad staff
//	else
		ls_syntax = "SELECT " + ls_fields + " from " + ls_table
//	end if
	ls_where = as_where
	//traps for AND and WHERE
	p1 = pos(upper(ls_where) , "AND" ,1)
	if p1  < 4 and p1 > 0 then //strip and if it exists
		ls_where = mid(as_where, p1 + 3)
	end if
	p1 = pos(upper(ls_where) , "WHERE" ,1)
	if p1  < 4 and p1 > 0  then //strip and if it exists
		ls_where = mid(as_where, p1 + 5)
	end if
	
	ls_where = " where prac_id = " + string(ll_prac)  + " and " + ls_where
	ls_syntax = ls_syntax + ls_where 
	//need to write traps if the correct table is not selected back in the main function
	If ib_nyp_fte = true then //added for NYP FTE report
		//ls_syntax = "SELECT " + ls_fields + " from " + ls_table + " where prac_id = " + string(ll_prac)  + " order by end_date ASC; "
		ls_syntax +=  " order by end_date ASC"
	end if
	
	ls_syntax += ";"
	//End Code Change---10.01.2007
	
	//create ds
		ls_presentation_str = "style(type=grid)"		

		ls_dwsyntax_str = SQLCA.SyntaxFromSQL(ls_syntax, ls_presentation_str, ERRORS)
		IF Len(ERRORS) > 0 THEN
			MessageBox("Caution on export field " ,  "SyntaxFromSQL caused these errors: " + ERRORS + "~r~r" + ls_syntax)
		//	MessageBox("ls_select_table",ls_select_table)
			close(w_export_progress)
			RETURN -1
		END IF
		
		w = lds_getdata.Create( ls_dwsyntax_str, ERRORS)
		if w < 1 then
			messagebox("Error creating table for multi row function",errors)
			
			return 0
		end if
		lds_getdata.SetTransObject( SQLCA )
		//Start Code Change ---- 10.01.2007 #V7 maha
	//dc = lds_getdata.retrieve()
	lds_getdata.retrieve()
//for each field in the m table that exists in the export get the data from the appropriate record and modify the the new export rows	
	If ib_nyp_fte = true then //added for NYP FTE report  - record filter and modification
		of_nyp_fte_rows(lds_getdata)
	end if
	dc = lds_getdata.rowcount()
	if dc > 1 then
		//copy and update as needed
		for d = 1 to dc
			ads_export.rowscopy(row_cnt,row_cnt,primary!,ads_export,row_cnt + 1,primary!)
			//ads_export.rowscopy(row_cnt,row_cnt,primary!,ads_export,100,primary!)
			row_cnt++
			//rc = ads_export.rowcount()
			ll_row_loc[d] = row_cnt
		next
			
		for d = 1 to dc
			for a = 1 to upperbound(ai_col_num[])
				//messagebox("",)
				ls_fname = ads_exp_fields.getitemstring(a,"export_field_name")
				//messagebox("ls_fields",ls_fields)
				ls_lu_field = ads_exp_fields.getitemstring(a,"lu_field_name")
				ls_lu_type = ads_exp_fields.getitemstring(a,"db_lookup_type") //maha 010305
				choose case ads_exp_fields.getitemstring(a,"db_field_type")
					case "C","L"   //char, long varchar, Text
						ls_value = lds_getdata.getitemstring(d,a)
					case "I","N"
						ls_value = string(lds_getdata.getitemnumber(d,a))						
					case "D","T" //date ,timestamp
						debugbreak()
						ls_value = of_date_format(ads_exp_fields.getitemstring(a,"export_format"),lds_getdata.getitemdatetime(d,a))
					  
				end choose
				
		
				choose case ls_lu_type
					case "A"
						if alu < 1 then alu = lds_addr_lu.retrieve()
							ll_find = lds_addr_lu.find("lookup_code = " + ls_value,1,alu)
						if ll_find > 0 then 
							
							choose case ls_lu_field
								case "lookup_code","zip"
									ls_value = string(lds_addr_lu.getitemnumber(ll_find,ads_exp_fields.getitemstring(a,"lu_field_name")))
								case else
									ls_value = lds_addr_lu.getitemstring(ll_find,ads_exp_fields.getitemstring(a,"lu_field_name"))
							end choose
						else 
							//messagebox("","not found")
						end if
							
						
					case "C"
						if clu < 1 then clu = lds_code_lu.retrieve()
							
						ll_find = lds_code_lu.find("lookup_code = " + ls_value,1,clu)
						if ll_find > 0 then 
							choose case ls_lu_field
								case "lookup_code"
									ls_value = string(lds_code_lu.getitemnumber(ll_find,ads_exp_fields.getitemstring(a,"lu_field_name")))
								case else
									ls_value = lds_code_lu.getitemstring(ll_find,ads_exp_fields.getitemstring(a,"lu_field_name"))
							end choose
						end if
				end choose
				
				li_len = ads_exp_fields.getitemnumber(a,"export_field_length")
				li_sub_start = ads_exp_fields.getitemnumber(a,"export_fields_substring_start")
				if li_sub_start < 2 or isnull(li_sub_start) then li_sub_start = 1 //maha 010405
				ls_value = mid(ls_value,li_sub_start,li_len)
				ads_export.setitem(ll_row_loc[d], ai_col_num[a], ls_value )		
			next
		next
	end if
	row_cnt++
	w_export_progress.r_bar.Width = w_export_progress.r_bar.Width + li_bar_ticks
next
//resort the data
//ads_export.setsort("prac_id")
//ads_export.sort()
//messagebox("multi row",ads_export.rowcount())

//clean up
ads_exp_fields.setfilter("" )
ads_exp_fields.filter()
ads_exp_fields.sort()

destroy lds_getdata
destroy lds_addr_lu
destroy lds_code_lu

//possible future development issues: wanting to 'identify' the records eg. address type; wanting to sort the multi records eg. date from.
return 1
end function

public function integer of_nyp_fte_rows (n_ds ads_rows);//Start Code Change ---- .2007 #V7 maha
//of_nyp_fte_rows function created 10.01.2007 maha for formatting rows for NYP customization  called from of_multi_row

integer r
integer rc
integer li_year
integer nr
string ls_pgyyear
date ld_end

rc = ads_rows.rowcount()

for r = rc to 1 step -1 //drop any rows where the pgy year is not a number (like XX)
	if not isnumber( ads_rows.getitemstring(r,"pgy_year")) then
		ads_rows.rowsdiscard(r,r,primary!)
	end if
next

rc = ads_rows.rowcount()
//loop through again and check for end date over the 06.30 date
//if found add additional row setting the original to 06.30 and the copied row start to 07.01
for r = 1 to rc
	ld_end = date(ads_rows.getitemdatetime(r,"end_date"))
	li_year = year(ld_end)
	if ld_end > date(string(li_year) +"/06/30") then
		ads_rows.rowscopy( r,r, primary!, ads_rows,1000, primary!)
		ads_rows.setitem(r, "end_date",datetime(date(string(li_year) +"/06/30"),time("00:00:00:")))
		ads_rows.setitem(ads_rows.rowcount(), "begin_date",datetime(date(string(li_year) +"/07/01"),time("00:00:00:")))
	end if
next

r = ads_rows.setsort("end_date asc")
if r < 1 then messagebox("Sort Failed","in function of_nyp_fte_rows")
ads_rows.sort()
		

return 1 

end function

public function string of_strip_char_not_used (string as_strip, string as_string, string as_replace);//maha created 120905 to strip/replace characters
//Start Code Change ----04.21.2008 #V8 maha - renames as should not be used (but did not yet want to delete)
//this function had 'disappeared' at some point and was recreated as a separate function (intellicred.pbl).  Should be using the application function.

string ls_ret
string ls_string
integer i
integer ic
integer li_pos
integer p1
integer li_len

li_len = len(as_strip)
ls_string = as_string
if isnull(as_replace) then as_replace = ""

if pos(ls_string,as_strip) > 0 then
	p1 = pos(ls_string,as_strip)
	do while p1 > 0
		//ls_string = mid(ls_string,1,p1 - 1) + mid(ls_string,p1 + li_len)
ls_string = mid(ls_string,1,p1 - 1) + as_replace + mid(ls_string,p1 + li_len)
		p1 = pos(ls_string,as_strip,p1)
	loop
	ls_ret = ls_string	
else
	ls_ret = as_string
end if


return ls_ret

end function

public subroutine of_get_sortsel (ref string as_sortsel, string as_delstr);//====================================================================
// Event: pfc_n_cst_ai_export_apb.of_get_sortsel()
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	reference	string	as_sortsel	
// 	value    	string	as_delstr 	
//--------------------------------------------------------------------
// Returns:  (none)
//--------------------------------------------------------------------
// Author:	Andy		05.13.2008
//--------------------------------------------------------------------
//	
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

Long   ll_Pos1,ll_Pos2
String ls_Left,ls_Right
n_cst_string lnvo_string

if pos(lower(as_sortsel),' desc') > 0 then
	as_sortsel = lnvo_string.of_globalreplace( as_sortsel, ' desc', '')
end if
if pos(lower(as_sortsel),' asc') > 0 then
	as_sortsel = lnvo_string.of_globalreplace( as_sortsel, ' asc', '')
end if
as_sortsel = "," + as_sortsel + ","

DO WHILE (1=1)
	ll_Pos1 = Pos(lower(as_sortsel),lower(as_delstr))
	if ll_Pos1 < 1 then exit
	
	ls_Left = Left(as_sortsel,ll_Pos1 + Len(as_delstr) - 1)
	ls_Right = Mid(as_sortsel,ll_Pos1 + Len(as_delstr))
	
	ll_Pos2 = lastpos(ls_Left,',')
	if ll_Pos2 > 0 then
		ls_Left = Left(ls_Left,ll_Pos2 - 1)
	end if
	
	as_sortsel = ls_Left + ls_Right
LOOP

if as_sortsel = "," then as_sortsel = ""
//del first ","
if Len(as_sortsel) > 0 then as_sortsel = Mid(as_sortsel,2)

end subroutine

public function integer of_get_export_data (long al_export_id, long al_data_id[], ref datastore ads_data);//////////////////////////////////////////////////////////////////////
// $<function>w_sheet_ctx_doc_painter/of_get_export_data()
// $<arguments>
//		value    	long     	al_export_id		
//		value    	long     	al_data_id  		ctx_id or prac_id
//		reference	datastore	ads_data    		
// $<returns> integer	1-Successful  0-No export found  -1-Failed
// $<description>
// $<description>
//////////////////////////////////////////////////////////////////////
// $<add> 2006-12-15 by Rodger Wu
//////////////////////////////////////////////////////////////////////
integer li_return, li_type
long ll_ctx_id[]
string ls_path, ls_export_name

IF isnull( al_export_id ) OR al_export_id = 0 THEN
	Messagebox( "Caution", "No export file selected!" )
	return 0;
END IF

SELECT save_path, export_type, export_name
INTO :ls_path, :li_type, :ls_export_name
FROM export_header WHERE export_id = :al_export_id;

IF isnull( ls_path ) or Trim( ls_path ) = '' THEN
	Messagebox( "Caution", "No Save Path set for current export file!" )
	return 0;
END IF

ll_ctx_id = al_data_id

IF li_type = 3 or li_type = 4 THEN
	li_return = of_export_data_with_text_ctx( al_export_id, ll_ctx_id, ls_path, 0, "","","",2,"" )
ELSE
	li_return = of_export_data_with_text( al_export_id, ll_ctx_id, ls_path, 0, "","","",2,"" )
END IF
IF li_return <> 1 and Not ib_writefile THEN return -1;  //modified by gavins 20121011

ads_data = ids_export_data
li_return = ads_data.rowcount()

IF li_return > 0 THEN
	return 1;
ELSE
	return li_return;
END IF
end function

public function integer of_cleanup_ds ();

return 1
end function

public function integer of_export_data_with_text_ctx_0305 (integer ai_export_id, long al_prac_ids[], ref string as_path, integer ai_save_data, string as_param1, string as_param2, string as_param3, integer ai_type, string as_sql);//////////////////////////////////////////////////////////////////////
// $<function>pfc_n_cst_ai_export_apb/of_export_data_with_text_ctx()
// $<arguments>
//		value	integer	ai_export_id 		
//		value	long   	al_prac_ids[]		
//		value	string 	as_path      		 
//    value integer  ai_save_data (0:Nothing / 1:save / 2:preview / 3:save & preview)
//		value	string 	as_param1    		
//		value	string 	as_param2    		
//		value	string 	as_param3
//    value integer  ai_type      (1: specify SQL/2: specify array/3: between...and)
//    value string   as_sql       (the specified SQL)
// $<returns> integer
// $<description> Used for export Contract Logix data.
// $<description>
//////////////////////////////////////////////////////////////////////
// $<add> 2006-11-28 by Rodger Wu (doc painter)
//////////////////////////////////////////////////////////////////////

//<optimization> by Andy 07/12/2007

SetPointer( HourGlass! )
If IsNull(as_path) Or as_path = "" Then
	MessageBox("Data Error", "There is no save path for this file. Unable to continue this function.")
	Return 0
End If
If ai_export_id < 1 Then
	//MessageBox("User Error", "No export selected.  Unable to continue this function.")
	messagebox("User Error", "No export selected.  Unable to proceed.")
	Return 0
End If

Open(w_export_progress)
//Start code changes 2.6.2007 Henry
If is_called_type = '1' Then
	w_export_progress.title = 'Merge Data Process'
	is_called_type = '0'
Elseif is_called_type = '2' Then // Rodger wu Added.
	w_export_progress.title = 'Merge Data Process'
	w_export_progress.st_6.text = "Progress of building data"
	
	w_export_progress.st_merge.visible = True
	w_export_progress.hpb_1.visible = True
//	w_export_progress.height = 1100
End If
//End code change 2.6.2007

w_export_progress.st_progress.Text = "Creating export table"

IF of_create_export_table( ai_export_id,ai_save_data ) < 0 THEN
	close(w_export_progress)
	return 0
END IF

//Boolean lb_table_found
//Long ll_fld_val
Long li_array_index, li_search_from_row, li_prac_id_cnt, li_table_cnt, t, e, g, a, w, sd,i,n,p
//Long li_data_rc, li_found_row, li_fld_cnt, li_filter_cnt, li_text_cnt, li_fld_type //maha
Long ll_find_no, ll_rowcount, ll_rowcount2, ll_find,li_rec_no, li_file_num,li_fld_cnt,li_act_format
Long li_fld_len, li_use_link, li_recd_no, li_width, f, li_dif, li_facil_id, li_save_data = 0, ud, col
DateTime ldt_date, ldt_value //maha
String ls_lookup_type, ls_db_lookup_type, ls_lookup_code, ls_pad, ls_fixed_width//ls_trail_val, ls_trail_record, 
String Errors, ls_export_record, ls_export_field, ls_fld_type, ls_fld_delim//ls_hdr_val, ls_hdr_record, 
String ls_fld_val, ls_lead_trail_char, ls_format, ls_table_name//, ls_table_new, ls_table_names[]
String ls_sql_syntax, ls_field_name, ls_grey, ls_presentation_str, ls_dwsyntax_str, ls_value, ls_data_value
String ls_field_format, ls_sql, ls_save_format, ls_path//ls_month, ls_year, ls_day, ls_hour, ls_minute, 
Long li_exp_type, li_billing
String ls_header, ls_filter, ls_lookup, ls_datatype, ls_prac_ids = "", ls_select_field, ls_prac_field
String ls_select_table_trim, ls_select_table, ls_sny_retrieve, ls_find, ls_delim_value, ls_rec_delim, ls_lu_field
String ls_use_link_sql, ls_use_link_sql2, ls_export_text_file = "", ls_lookup_val, ls_save_path, stax, s //maha
String ls_aggre, ls_sort, ls_dc_field, ls_bill_syn, ls_text, ls_def_val
Long ll_prac_row, ll_ret_cnt, ll_billing_id //maha app080205
n_ds lds_export_hdr, lds_export_flds, lds_export_retrieve, lds_export_data, lds_code_lookup, lds_address_lookup
n_ds lds_dept_chair, lds_billing_address, lds_dataobject
string ls_tempstr, ls_dddwdata, ls_dddwtable, ls_select_field_ctx, ls_dddw_column_dbname//ls_dataobject, 
datawindowchild ldwc_dddw
string ls_linkfromcol, ls_linktotable, ls_linktocol
datastore lds_linkto

//<add> andy 07/12/2007
n_ds      lds_field,lds_export_dataTemp
String    ls_ComputerDataType,ls_Expresstion,ls_Field,ls_FieldDataType,ls_Modify,ls_Err,ls_tag    
n_cst_string lnvo_string
Long      ll_Cnt,ll_Num,ll_Tab,ll_Start = 1,ll_pos1,ll_pos2,ll_pos3,ll_SpID
String ls_Objects,ls_objname,ls_ObjType,ls_ColType,ls_OrderBy,ls_UnionSQL = "",ls_SqlSelect,ls_flddelimList[]
Boolean lb_flagpk,lb_true = false,lb_ASA7 = false,lb_mulsel = false//lb_flag = true,
Long    ll_FieldSeqID = 0,ll_FieldCnt,ll_export_code,ll_intcred_field,ll_equivcode,ll_pracid,ll_LastPos    
Long ll_FieldSeqIDold = -1,ll_R = 0,ll_i = 1,ll_j,ll_k,ll_n,ll_pkcnt,ll_Rcnt,li_sub_start,li_custom_save
String  ls_tablelist[],ls_billsynList[],ls_fieldlist[],ls_selectfieldlist[],ls_formatList[],ls_dcfieldList[] 
Long li_recdnoList[],ll_exportcodeList[],ll_intcredfieldList[],li_substartList[],li_widthList[],ll_ctx_scrn_id 
Long li_udList[],ll_pos,li_facil_idList[],li_act_formatList[],li_bar_ticks,li_widthtemp,ll_maxwidth,ll_len
String  ls_defvalList[],ls_textList[],ls_prac_sql,ls_use_link_sqlsyn,ls_ic_area,ls_lu_fieldList[] 
str_pass lstr_pass
//<add> 08/08/2007 by: Andy
String ls_prac_sql_temp,ls_Sortsel,ls_prac_sql_temp2,ls_top = "top 2147483647",ls_usetable = ""
//<add> 08/16/2007 by: Andy
datastore lds_tablepk
string  ls_tablepks[],ls_table[],ls_tablepk,ls_sortpk[],ls_save_name,ls_strip_char,ls_dbtype
String  ls_RowNo = "",ls_RowNoSyn = "",ls_tabletemp,ls_synprefix = "",ls_MySQL
//end of add
boolean lb_export // Andy 03202008

ldt_date = DateTime(Today(),Now()) //maha
//<add> 08/23/2007 by: Andy
ls_dbtype = of_get_dbtype()
if upper(ls_dbtype) = 'SQL2005' OR upper(ls_dbtype) = 'ASA9' THEN
	ls_RowNo = ",Row_No"
	lb_true = true
elseif upper(ls_dbtype) = 'ASA7' then
	lb_ASA7 = true
end if

if Not lb_ASA7 THEN
	ls_synprefix = "select ctx_id,FieldSeqID,billing_address_id,field_value,field_data_type" + ls_RowNo + " from ("
end if

//<add> 08/14/2007 by: Andy 
//Reason: Bubble sort the al_prac_ids array.
if ai_type = 2 then 
	of_bubblesort(al_prac_ids)
end if

//IF left(upper(ls_dbType),3) = 'ASA' THEN 
//	ls_top = ""
//END IF
//end of add

li_prac_id_cnt = UpperBound( al_prac_ids[] )

//<add> 08/16/2007 by: Andy
lds_tablepk = create datastore
IF left(upper(ls_dbType),3) = 'ASA' THEN 
	lds_tablepk.DataObject = "d_export_tablepk_asa_ctx"
	ls_top = ""
ELSE
	lds_tablepk.DataObject = "d_export_tablepk_sql_ctx"
END IF
lds_tablepk.SetTransObject( SQLCA )
//end of add

//<add> andy 2007.05.25
lds_field = Create n_ds
lds_field.DataObject = "d_export_fields"
lds_field.of_SetTransObject( SQLCA )
//lds_field.Retrieve( ai_export_id )
//end of add

lds_code_lookup = Create n_ds
lds_code_lookup.DataObject = "d_code_lookup"
lds_code_lookup.of_SetTransObject( SQLCA )

lds_address_lookup = Create n_ds
lds_address_lookup.DataObject = "d_address_lookup"
lds_address_lookup.of_SetTransObject( SQLCA )

lds_export_hdr = Create n_ds
lds_export_hdr.DataObject = "d_export_hdr"
lds_export_hdr.of_SetTransObject( SQLCA )

lds_export_flds = Create n_ds
lds_export_flds.DataObject = "d_export_flds_list_exp_ctx"
lds_export_flds.of_SetTransObject( SQLCA )

lds_dept_chair = Create n_ds //maha 010704
lds_dept_chair.DataObject = "d_dept_chair_exp_all"
lds_dept_chair.of_SetTransObject( SQLCA )

n_ds lds_export_equiv_code
lds_export_equiv_code = Create n_ds
lds_export_equiv_code.DataObject = "d_export_equiv_code_lds"
lds_export_equiv_code.of_SetTransObject( SQLCA )

lds_export_retrieve = Create n_ds
lds_dataobject = Create n_ds
lds_linkto = create datastore

gnv_appeondb.of_startqueue( )

lds_dept_chair.Retrieve()
lds_export_flds.Retrieve( ai_export_id )
//lds_export_equiv_code.Retrieve()
lds_export_equiv_code.Retrieve(ai_export_id)	//Jervis 12.10.2010
lds_export_hdr.Retrieve( ai_export_id )
lds_field.Retrieve( ai_export_id )

gnv_appeondb.of_commitqueue( )

ll_rowcount = lds_dept_chair.RowCount()
ll_rowcount2 = lds_export_equiv_code.RowCount()

//HEADER INFO
ls_table_name = lds_export_hdr.GetItemString(1,"export_name")
ls_header = lds_export_hdr.GetItemString(1,"field_labels_as_header") //Y or N
ls_format = lds_export_hdr.GetItemString(1,"export_format")

//add 08/22/2007 by: Andy
ls_strip_char = lds_export_hdr.getitemstring(1,"strip_char")
if isnull(ls_strip_char) or len(ls_strip_char) < 1 then ls_strip_char = "NONE"
if ls_format = ".csv" then ls_strip_char = "," 
//end of add

//<add> 08/21/2007 by: Andy
li_custom_save = lds_export_hdr.getitemnumber(1,"custom_save_name") 
if isnull(li_custom_save) then li_custom_save = 0
//end of add

//-----------Begin Modified by alfee 05.25.2007-----------------------
//<$Reason>If merging data in document manager, agreement template or for email template,
//<$Reason>Then always use text with header format. It's also for performance tunning.
//If is_called_type = "2" Or is_called_type = '3' Then 
If is_called_type = "2" Or is_called_type = '3' or is_called_type = '4' Then //08.29.2007 Byy Jervis
	ls_format = ".txt" 
	ls_header = '1'
END IF

//$<modify> 03/20/2008 by: Andy
if ls_format = "export"  then
	lb_export = true
	ls_format = ".txt" 
else //txt and xls files  files
	lb_export = false
end if

//-----------End Modified ---------------------------------------------

if ls_format = ".csv" then
	if upper( appeongetclienttype() ) = "WEB" then		
		Messagebox( "ContractLogix", "The file type of CSV is unsupported on WEB.~r~nPlease go to Export painter to modify settings." )
		Close(w_export_progress)
		//<add> andy 07/17/2007
		Destroy lds_export_flds
		Destroy lds_export_hdr
		Destroy lds_address_lookup
		Destroy lds_code_lookup
		Destroy lds_dept_chair
		Destroy lds_export_equiv_code
		Destroy lds_dataobject
		Destroy lds_linkto
		Destroy lds_field
		Destroy lds_tablepk
		//Destroy lds_export_dataTemp
		//end of add
		Return -1
	end if
end if

li_exp_type = lds_export_hdr.GetItemNumber(1,"export_type")
ls_rec_delim = lds_export_hdr.GetItemString(1,"record_delimiter")
ls_save_path = lds_export_hdr.GetItemString(1,"save_path")

//$<add> 05.07.2008 by Andy
select top 1 @@spid into :ll_SpID from ids;

//Modify 08/08/2007 by: Andy
//specify SQL
if ai_type = 1 then
	ls_prac_sql  = trim(as_sql)//trim(lds_export_hdr.getitemstring(1,"prac_sql"))
	if isnull(ls_prac_sql) then ls_prac_sql = ''
	if ls_prac_sql <> '' then 
		ll_pos = pos(ls_prac_sql,";")
		if ll_pos > 0 then 
			ls_prac_sql  = replace(ls_prac_sql,ll_pos,1,'')
		end if
		ll_len = len(ls_prac_sql)
		ls_prac_sql_temp = trim(mid(ls_prac_sql,7,ll_len))
		if lower(left(ls_prac_sql_temp,8)) = 'distinct' then
			ls_prac_sql_temp2 = trim(mid(ls_prac_sql_temp,9,ll_len))
			if lower(left(ls_prac_sql_temp2,3)) <> 'top' then 
				//modify 08/14/2007 by: Andy
				//ls_prac_sql = 'select distinct top 2147483647 ' + ls_prac_sql_temp2
				ls_prac_sql = 'select distinct ' + ls_top + ' ' + ls_prac_sql_temp2
			end if
		elseif lower(left(ls_prac_sql_temp,3)) <> 'top' then
			//modify 08/14/2007 by: Andy
			//ls_prac_sql = 'select top 2147483647 ' + ls_prac_sql_temp
			ls_prac_sql = 'select ' + ls_top + ' ' + ls_prac_sql_temp
		end if
		
		//$<add> 05.06.2008 by Andy
		//del order by statement. Reason:if ORDER BY items isn't in the select list,then it will get error.
		//ORDER BY items must appear in the select list if the statement contains a UNION operator.
		ll_pos = pos(lower(ls_prac_sql)," order ")
		if ll_pos > 0 then
			ls_prac_sql = Left(ls_prac_sql,ll_pos - 1)
		end if
		//if select more than one field,then add a select statement outside the ls_prac_sql and
		//INSERT the result INTO a table.
		ll_pos = pos(lower(ls_prac_sql)," from ")
		ls_prac_sql_temp = Left(ls_prac_sql,ll_pos - 1)
		ll_pos = pos(ls_prac_sql,",")
		if ll_pos > 0 then
			lb_mulsel = true
			ls_prac_sql = "select distinct ctx_id," + String(ll_spid) + " from (" + ls_prac_sql + ") cc order by ctx_id"
			select top 1 1 into :ll_Cnt from sysobjects where name = 'export_temp' and type = 'U';
			if ll_Cnt = 1 then
				ls_Mysql = "DELETE FROM export_temp WHERE SpID = " + String(ll_spid) + ";"
			else
				ls_MySQL = "CREATE TABLE export_temp (prac_id int null,SpID int null)"
			end if
			EXECUTE IMMEDIATE :ls_Mysql;
			ls_MySQL = "INSERT INTO export_temp " + ls_prac_sql + ";"
			EXECUTE IMMEDIATE :ls_Mysql;
			ls_prac_sql = "select distinct prac_id as ctx_id from export_temp where SpID = " + String(ll_spid)
		end if
		//end add 05.06.2008
	end if
end if
//end of modify

//set record delimiter
Choose Case ls_rec_delim
	Case "C"
		ls_rec_delim = ","
	Case "R"
		ls_rec_delim = "~r"
	Case "T"
		ls_rec_delim = "	"
	Case "D"
		ls_rec_delim = "~r~r"
	Case "U"
	Case Else
		ls_rec_delim = ""
End Choose
If IsNull(ls_rec_delim) Then ls_rec_delim = ""

li_fld_cnt = lds_export_flds.RowCount()
//<add> 08/24/2007 by: Andy
ll_maxwidth = Long(lds_export_flds.describe("evaluate('max(export_field_length)',0)"))
if ll_maxwidth < 30 then ll_maxwidth = 30

//CREATE SYNTAX FOR export DW
//ls_sql_syntax = "Select * from exp_" + Lower(ls_table_new)
ls_sql_syntax = is_select_syntax
//modify 08/15/2007 by: Andy
//ls_presentation_str = "style(type=form)"
ls_presentation_str = "style(type=grid)"

ls_dwsyntax_str = SQLCA.SyntaxFromSQL(ls_sql_syntax, ls_presentation_str, Errors)
If Len(Errors) > 0 Then //this will fail if the table has not been completed
	If Pos(Errors,"Table or view not found",1) > 0 Then
		MessageBox ("Error in of_export_data_with_text","Export data data store not able to be created.~rCheck to make sure no export fields have any spaces, and that all have a width.  You cannot have duplicate field names, and fields cannot start with a number." )
		Close(w_export_progress)
		//<add> andy 07/17/2007
		Destroy lds_export_flds
		Destroy lds_export_hdr
		Destroy lds_address_lookup
		Destroy lds_code_lookup
		Destroy lds_dept_chair
		Destroy lds_export_equiv_code
		Destroy lds_dataobject
		Destroy lds_linkto
		Destroy lds_field
		Destroy lds_tablepk
		//Destroy lds_export_dataTemp
		//end of add
		Return -1
		
	Else
		MessageBox("Caution", &
			"SyntaxFromSQL caused these errors: " + Errors)
		Close(w_export_progress)
		//<add> andy 07/17/2007
		Destroy lds_export_flds
		Destroy lds_export_hdr
		Destroy lds_address_lookup
		Destroy lds_code_lookup
		Destroy lds_dept_chair
		Destroy lds_export_equiv_code
		Destroy lds_dataobject
		Destroy lds_linkto
		Destroy lds_field
		Destroy lds_tablepk
		//Destroy lds_export_dataTemp
		//end of add
		Return -1
	End If
End If
lds_export_data = Create n_ds
lds_export_data.Create( ls_dwsyntax_str, Errors)

lds_export_data.SetTransObject( SQLCA )

//<add> andy 2007.05.25 
//save the original data that it's not format,in order to deal with the computer fields
lds_export_dataTemp = create n_ds
lds_export_dataTemp.create( ls_dwsyntax_str, Errors )
lds_export_dataTemp.SetTransObject( SQLCA )
//end of add

//w_export_progress.r_bar.Width = 300
w_export_progress.hpb_bar.position = 10

w_export_progress.st_progress.Text = "Populating Data for " + String(li_prac_id_cnt) + " Contract(s)"

//li_bar_ticks = 80 / li_fld_cnt

//creates string of prac_ids for querys
//between...and...
if ai_type = 3 then
	//if ls_prac_sql = '' then
	if li_prac_id_cnt > 0 then 
		ls_prac_ids = "between " + string(al_prac_ids[1]) + " and " + string(al_prac_ids[li_prac_id_cnt])
	end if
	//end if
end if

//$<modify> 05.05.2008 by Andy
//create rows for all practitioner data
FOR i = 1 TO li_prac_id_cnt
	//specify array
	if ai_type = 2 then
		ls_prac_ids = ls_prac_ids + String( al_prac_ids[i] ) + ","
	end if
		
	g = lds_export_data.insertrow(0)
next
//if ai_save_data = 1 or ai_save_data = 3 then
if ai_save_data = 1 or ai_save_data = 3  or ib_gen_rec_id then //for Date Alarm - Alfee 06.11.2008
	lds_export_data.object.rec_id.Primary[] = al_prac_ids[]
end if
lds_export_data.Rowscopy( 1, lds_export_data.rowcount(), Primary!, lds_export_dataTemp, 1, Primary! )
//end modify 05.05.2008

//specify array
if ai_type = 2 then
	ls_prac_ids = Left( ls_prac_ids, Len( ls_prac_ids ) -1 ) //remove last comma
end if

//w_export_progress.r_bar.Width = w_export_progress.r_bar.Width + 50
w_export_progress.hpb_bar.position = 11
w_export_progress.st_export.text = "Form SQL Statement"

//Modify 08/22/2007 by: Andy
//n = int(li_prac_id_cnt/80) + 1
n = int(li_fld_cnt/80) + 1
//end of modify

//<add> 08/23/2007 by: Andy
if lb_ASA7 then 
	//<del> 2008-05-04 by:nova
	//gnv_appeondb.of_startqueue( )
	//$<del> 05.07.2008 by Andy Reason:Move to above here
	//select top 1 @@spid into :ll_SpID from ids;
	//<del> 2008-05-04 by:nova
	//ls_tabletemp = "#t_export" + String(ll_SpID)
	
	ls_tabletemp = "t_export" + String(ll_SpID)
	//For ASA7 Bug,Can't include ; in end.
	//ls_MySQL = "CREATE TABLE " + ls_tabletemp + " (prac_id int null,FieldSeqID int null, billing_address_id int null, field_value varchar( " + String(ll_maxwidth) + ") null, field_data_type CHAR(1));"
	ls_MySQL = "CREATE TABLE " + ls_tabletemp + " (prac_id int null,FieldSeqID int null, billing_address_id int null, field_value varchar( " + String(ll_maxwidth) + ") null, field_data_type CHAR(1))"
	
	EXECUTE IMMEDIATE :ls_Mysql;
	if SQLCA.SQLCode <> 0 then
		messagebox(gnv_app.iapp_object.DisplayName,sqlca.sqlerrtext)
		close(w_export_progress)
		if IsValid(lds_export_flds) then destroy lds_export_flds
		if IsValid(lds_export_hdr) then destroy lds_export_hdr
		if IsValid(lds_address_lookup) then destroy lds_address_lookup
		if IsValid(lds_code_lookup) then destroy lds_code_lookup
		if IsValid(lds_export_data) then destroy lds_export_data
		if IsValid(lds_dept_chair) then destroy lds_dept_chair
		if IsValid(lds_field) then Destroy lds_field
		if IsValid(lds_export_dataTemp) then Destroy lds_export_dataTemp
		if IsValid(lds_export_equiv_code) then Destroy lds_export_equiv_code
		Destroy lds_tablepk
		//<del> 2008-05-04 by:nova
		//$<add> 01.07.2008 by: Andy
		//gnv_appeondb.of_commitqueue( )
		RETURN -1
	END IF
END IF
//END OF ADD

For p = 1 To li_fld_cnt
	lds_dataobject.dataobject = lds_export_flds.GetItemString( p, "export_fields_ctx_scrn_dataobject" )
	
	li_width = lds_export_flds.GetItemNumber(p,"export_field_length")
	ls_field_format = lds_export_flds.GetItemString(p,"export_format")
	ls_data_value = ""
	ls_value = ""
	ls_lookup_val = ""
	ls_dc_field = "none"
	//<add> 08/21/2007 by: Andy
	li_sub_start=  0
	//end of add
	ls_dddwtable = ""
	ud = lds_export_flds.GetItemNumber( p, "use_default" )
	if ud = 1 OR ud = 2 then
		ls_def_val = lds_export_flds.GetItemString( p, "default_value" )
	ELSE
		ls_def_val = ""
	end if
	
	//hard coded text
	If lds_export_flds.GetItemNumber(p,"export_type") = 2 Then //set data for text fields
		ls_select_field = lds_export_flds.GetItemString(p,"export_field_name")
		ls_value = lds_export_flds.GetItemString(p,"field_value")
		
		If IsNull(ls_value) Then ls_value = ""
		
		If ls_value = "&TODAY&" Then
			//<modify> 08/28/2007 by: Andy Reason:Support user-defined format.
			//ls_value = of_date_format(ls_field_format,ldt_date) //maha 070705 factored
			ls_value = String(ldt_date,"yyyy-mm-dd hh:mm")
			of_data_format(ls_field_format,'D',ls_value)
			//end of modify
		End If
		//Start Code Change ---- 11.03.2005 #21 maha  for prompt values
		String ls_ptype
		Choose Case Upper(ls_value)
			Case "&PROMPT1&"
				ls_ptype = lds_export_hdr.GetItemString(1,"prompt_type1")
				ls_value = of_prompt_populate( ls_ptype, as_param1)
			Case "&PROMPT2&"
				ls_ptype = lds_export_hdr.GetItemString(1,"prompt_type2")
				ls_value = of_prompt_populate( ls_ptype, as_param2)
			Case "&PROMPT3&"
				ls_ptype = lds_export_hdr.GetItemString(1,"prompt_type3")
				ls_value = of_prompt_populate( ls_ptype, as_param3)
		End Choose
		If	ls_ptype = 'D' Then
			ldt_date = DateTime(Date(ls_value),Now())
			//<modify> 08/28/2007 by: Andy Reason:Support user-defined format.
			//ls_value = of_date_format(ls_field_format,ldt_date)
			ls_value = String(ldt_date,"yyyy-mm-dd hh:mm")
			of_data_format(ls_field_format,'D',ls_value)
			//end of modify
		End If
				
		//End Code Change---11.03.2005

		//<add> 08/27/2007 by: Andy
		li_sub_start = lds_export_flds.getitemnumber(p,"export_fields_substring_start")
		if li_sub_start > 1 then ls_value = mid(ls_value,li_sub_start,li_width)		
		ls_value = mid(ls_value,1,li_width) //shrink the length to size 
		//end of add
		
		For i = 1 To li_prac_id_cnt
			lds_export_data.SetItem(i,p,ls_value)
			lds_export_dataTemp.SetItem(i,p,ls_value)//<add> andy 2007.05.25 
		Next
	//<Modify> andy 2007.05.25
	//Else //get FIELDS DATA //comment by andy 
	ElseIf lds_export_flds.GetItemNumber(p,"export_type") = 1 Then //get FIELDS DATA
	//end of modify	
		//CREATE SYNTAX FOR each retrieve DW
		ls_export_field = lds_export_flds.GetItemString(p,"export_field_name")
		//<add> 08/24/2007 by: Andy
		of_replacespecchar(ls_export_field)
		//end of add
		ls_select_field_ctx = Trim( lds_export_flds.GetItemString( p, "db_field_name" ) )
		
		//--------------------------- APPEON BEGIN ---------------------------
		//$<modify> 03.16.2007 By: Jack (Export)
		//$<reason> Fix a defect.
				
		Choose Case ls_select_field_ctx
			Case "app_facility" 
				ls_tempstr = 'ctx_basic_info.app_facility'
				ls_select_table = f_get_token( ls_tempstr, "." )
				ls_select_field = ls_tempstr		
			Case "compute_1"
				ls_select_table = 'ctx_contract_contacts'
				ls_select_field = "compute_1"		
			Case "contact_phone" 
				ls_select_table = 'ctx_contract_contacts'
				ls_select_field = 'contact_phone'		
			Case "contact_email" 
				ls_select_table = 'ctx_contract_contacts'
				ls_select_field = 'contact_email'		
			Case Else
				ls_tempstr = lds_dataobject.Describe( ls_select_field_ctx + ".dbname" )
				ls_select_table = f_get_token( ls_tempstr, "." )
				ls_select_field = ls_tempstr		
		End Choose		
		//---------------------------- APPEON END ----------------------------

		li_use_link = lds_export_flds.GetItemNumber(p,"export_fields_ctx_uselink")
		if isnull( li_use_link ) then li_use_link = 0
		
		ll_ctx_scrn_id = lds_export_flds.GetItemNumber(p,"export_fields_ctx_scrn_id")  //Add by Jack 06/05/2007
		If ll_ctx_scrn_id = 6 Then 
			ls_ic_area = "E" 
		ElseIf ll_ctx_scrn_id = 7 Then 
			ls_ic_area = "I" 
		end if

		ls_fld_delim = lds_export_flds.GetItemString( p, "trailing_leading_characters")
		li_recd_no = lds_export_flds.GetItemNumber(p,"intcred_record_number")
		//<add> 07/06/2007 by: Andy
		ll_FieldSeqID ++
		ll_export_code = lds_export_flds.GetItemnumber( p, "export_code" )
		ls_dc_field = lds_export_flds.GetItemstring( p, "dept_sect_field" )
		if isnull(ls_dc_field) or trim(ls_dc_field) = '' then ls_dc_field = "none"
		ll_intcred_field = lds_export_flds.getitemnumber(p,"intcred_field")
		//end of add	
		li_facil_id = lds_export_flds.GetItemNumber(p,"facility_id")
		ls_lu_field = lds_export_flds.GetItemString( p, "lu_field_name" )
		ls_aggre = lds_export_flds.GetItemString( p, "aggre_function" )
		ls_sort = lds_export_flds.GetItemString( p, "sort_by" )
		//<add> 08/09/2007 by: Andy
		ls_Sortsel = ls_sort
		if isnull(ls_Sortsel) then ls_Sortsel = ''
		if len(trim(ls_Sortsel)) > 0 then
			//$<Modify> 05.13.2008 by Andy
			of_get_sortsel(ls_Sortsel,'ctx_id')
//			if pos(lower(ls_Sortsel),' desc') > 0 then
//				ls_Sortsel = lnvo_string.of_globalreplace( ls_Sortsel, ' desc', '')
//			end if
//			if pos(lower(ls_Sortsel),' asc') > 0 then
//				ls_Sortsel = lnvo_string.of_globalreplace( ls_Sortsel, ' asc', '')
//			end if
//			ls_Sortsel += ","
		end if		
		//end of add
		li_act_format = lds_export_flds.GetItemNumber(p,"export_fields_active_yesno")
		ls_text = lds_export_flds.GetItemString(p,"field_value") //maha 091305
		If Upper(ls_lu_field) = "LOOKUP CODE" Then ls_lu_field = "lookup_code"
		If IsNull(ls_lu_field) Then ls_lu_field = "code"
		ls_use_link_sql = ""
		ls_use_link_sql2 = ""
		//<add> 08/21/2007 by: Andy
		li_sub_start = lds_export_flds.getitemnumber(p,"export_fields_substring_start")
		//end of add
		if pos(ls_select_table,"dba.",1) > 0 then //maha 122005 
			ls_select_table_trim = mid(ls_select_table,5) //dropping dba.
			ls_select_table = ls_select_table_trim  //maha 012306
		else
			ls_select_table_trim = ls_select_table
		end if
		ls_filter = lds_export_flds.GetItemString(p,"filter_query")
		li_billing = lds_export_flds.GetItemNumber(p,"billing_link") //maha app080205
		If IsNull(li_facil_id) Then li_facil_id = 0

		If IsNull(ls_filter) Or Trim(ls_filter) = "" Then
			ls_filter = ""
		Else
			//<Modify> 07/23/2007 by: Andy 
			//ls_filter = " and  " + ls_filter
			ls_filter = " and  ( " + ls_filter + " )"
			//end of Modify
			
			//Start Code Change ---- 11.03.2005 #24 maha check filter for prompt values and replace
			Long li_pos1
			li_pos1 = Pos(Upper(ls_filter),"PROMPT1",1)
			If li_pos1 > 0 Then
				ls_filter = Mid(ls_filter,1,li_pos1 - 1) + as_param1 + Mid(ls_filter,li_pos1 + 7)
			End If
			li_pos1 = Pos(Upper(ls_filter),"PROMPT2",1)
			If li_pos1 > 0 Then
				ls_filter = Mid(ls_filter,1,li_pos1 - 1) + as_param2 + Mid(ls_filter,li_pos1 + 7)
			End If
			li_pos1 = Pos(Upper(ls_filter),"PROMPT3",1)
			If li_pos1 > 0 Then
				ls_filter = Mid(ls_filter,1,li_pos1 - 1) + as_param3 + Mid(ls_filter,li_pos1 + 7)
			End If
		End If
		//End Code Change---11.03.2005 	
		
		//set fields delimiter/pad maha 060105
		Choose Case ls_rec_delim
			Case "R" //return
				ls_rec_delim = "~r"
			Case "T" //tab
				ls_rec_delim = "	"
			Case "D" //double return
				ls_rec_delim = "~r~r"
			Case "S" // space
				ls_rec_delim = " "
			Case "E" //empty string
				ls_rec_delim = ""
		End Choose
		//export_fields_use_link  sql
		If li_use_link = 1 Then
			ls_linkfromcol = Trim( lds_export_flds.GetItemString( p, "export_fields_ctx_linkfromcolumn" ))
			ls_tempstr = lds_dataobject.Describe( ls_linkfromcol + ".dbname" )
			f_get_token( ls_tempstr, "." )
			ls_linkfromcol = ls_tempstr
			
			lds_linkto.dataobject = Trim( lds_export_flds.GetItemString( p, "export_fields_ctx_linktoscrndw" ))
			ls_linktocol = Trim( lds_export_flds.GetItemString( p, "export_fields_ctx_linktocolumn" ))
			ls_tempstr = lds_linkto.Describe( ls_linktocol + ".dbname" )
			ls_linktotable = f_get_token( ls_tempstr, "." )
			ls_linktocol = ls_tempstr
			
			ls_use_link_sql = ", " + ls_linktotable
		End If

		ls_tablelist[ll_FieldSeqID] = ls_select_table
		ls_fieldlist[ll_FieldSeqID] = ls_export_field
		li_recdnoList[ll_FieldSeqID] = li_recd_no
		ls_selectfieldlist[ll_FieldSeqID] = ls_select_field
		ls_formatList[ll_FieldSeqID] = ls_field_format
		ll_exportcodeList[ll_FieldSeqID] = ll_export_code
		ls_dcfieldList[ll_FieldSeqID] = ls_dc_field
		ll_intcredfieldList[ll_FieldSeqID] = ll_intcred_field
		//<add> 08/21/2007 by: Andy
		li_substartList[ll_FieldSeqID] = li_sub_start
		//end of add
		li_widthList[ll_FieldSeqID] = li_width
		//<add> 07/23/2007 by: Andy
		li_widthtemp = li_width
		if li_widthtemp < 30 then li_widthtemp = 30
		//end of add
		ls_flddelimList[ll_FieldSeqID] = ls_fld_delim
		li_udList[ll_FieldSeqID] = ud
		ls_defvalList[ll_FieldSeqID] = ls_def_val
		ls_textList[ll_FieldSeqID] = ls_text
		ls_lu_fieldList[ll_FieldSeqID] = ls_lu_field
		li_facil_idList[ll_FieldSeqID] = li_facil_id
		li_act_formatList[ll_FieldSeqID] = li_act_format

		ls_use_link_sqlsyn = ls_use_link_sql
		if ai_type = 1 then 
		//if ls_prac_sql <> '' then   
			ls_use_link_sql = ls_use_link_sql + ", (" + ls_prac_sql + ") bb "
		end if		

		//--------------------------- APPEON BEGIN ---------------------------
		//$<modify> 03.19.2007 By: Jack (Export)
		//$<reason> Fix a defect.
		//Modify 08/15/2007 by: Andy
		If ls_select_table <> 'app_facility' Then
			if li_use_link = 1 then
				ls_usetable = lower(ls_linktotable)
			else
				ls_usetable = lower(ls_select_table)
			end if
		else
			ls_usetable = "ctx_basic_info"
		end if
		
		//<ad> 08/16/2007 by: Andy
		ls_tablepk= ""
		if ISNULL(ls_sort) OR trim(ls_sort) = "" then
			ls_sort = ""
			lb_flagpk = true
			//lb_sortpk = false
			ll_pkcnt = upperbound(ls_table)
			FOR ll_n = 1 to ll_pkcnt
				if lower(ls_usetable) = lower(ls_table[ll_n]) then
					ls_tablepk = ls_tablepks[ll_n]
					//ls_sort  = Left(ls_tablepk,len(ls_tablepk) - 2)
					ls_sort = ls_sortpk[ll_n]
					lb_flagpk = false
				end if
			next
			if lb_flagpk then
				ll_Rcnt = lds_tablepk.retrieve( ls_usetable)
				ls_sort = ls_usetable + '.ctx_id, '
				for ll_n = 1 to ll_Rcnt
					if lower(lds_tablepk.getitemstring( ll_n, "column_name")) = 'ctx_id' then
						//ls_sort = ls_usetable + '.ctx_id, '
						continue
					end if
					ls_tablepk += ls_usetable + '.' + lds_tablepk.getitemstring( ll_n, "column_name") + ", "
				next
				//Modify 08/22/2007 by: Andy
				//ls_sort = ls_tablepk + ls_sort
				ls_sort = ls_sort + ls_tablepk
				//end of modify
				ls_sort  = Left(ls_sort,len(ls_sort) - 2)
				ls_sortpk[ll_pkcnt + 1] = ls_sort
				ls_table[ll_pkcnt+1] = ls_usetable
				ls_tablepks[ll_pkcnt+1] = ls_tablepk
			end if
		//<add> 08/22/2007 by: Andy
		else
			if pos(lower(ls_sort),'ctx_id') < 1 then ls_sort = ls_usetable + '.ctx_id, ' + ls_sort	
		end if
		//<ADD> 08/23/2007 BY: Andy
 		if lb_ASA7 THEN 
			ls_tablepk = ""
			ls_Sortsel = ""//<add> 08/27/2007 by: Andy
		end if
		//end of add
		
		//<add> 08/23/2007 by: Andy
		if len(ls_aggre) > 0 then
			ls_sort = ls_sort + " , field_value"
		end if
		if Len(ls_sort) > 0 then ls_sort = "order by " + ls_sort
		//end of add
		
		//<add> 08/23/2007 by: Andy
		if lb_true THEN//SQL2005 and ASA9
			ls_RowNoSyn = ",row_number() over(" + ls_sort+") Row_No"
		end if
		//end of add
		
		ls_bill_syn     = "Select " + lower(ls_usetable) + ".ctx_id, "
		ls_sny_retrieve = ls_synprefix + "Select " + ls_top + " " + ls_usetable + ".ctx_id, " + ls_tablepk + ls_Sortsel + String(ll_FieldSeqID) + " FieldSeqID, "
		//end of modify
		
		//---------------------------- APPEON END ----------------------------
		
		If ls_select_table = "pd_address" And li_billing = 1 Then //maha app080205
			ls_bill_syn     = ls_bill_syn + " billing_address_id, "
			ls_sny_retrieve = ls_sny_retrieve + " billing_address_id, "
		else 
			ls_sny_retrieve = ls_sny_retrieve + " 0 billing_address_id, "
		end if
		
		ls_db_lookup_type = lds_export_flds.GetItemString( p, "export_fields_ctx_lookup_type" )
		//--------------------------- APPEON BEGIN ---------------------------
		//$<modify> 04.04.2007 By: Jack 
		//$<reason> Fix a defect.

		If ls_select_table = 'app_facility' And ls_select_field_ctx = 'state' Then
			ls_dddwdata = ''
		Else
			ls_dddwdata = lower( lds_dataobject.Describe( ls_select_field_ctx + ".dddw.datacolumn" ) )
		End If
		//---------------------------- APPEON END ----------------------------
		
		if ls_dddwdata <> '?' and ls_dddwdata <> '!' and ls_dddwdata <> '' then
			ls_tempstr = lower( lds_dataobject.Describe( ls_select_field_ctx + ".dddw.displaycolumn" ) )
			if ls_tempstr <> '?' and ls_tempstr <> '!' and ls_tempstr <> '' then
				if isnull( ls_db_lookup_type ) then
					ls_db_lookup_type = "X"
					ls_lu_field = ls_tempstr
					
					lds_dataobject.GetChild( ls_select_field_ctx, ldwc_dddw )
					ls_tempstr = ldwc_dddw.Describe( ls_lu_field + ".dbname" )
					ls_dddwtable = f_get_token( ls_tempstr, "." )
					ls_dddw_column_dbname = ls_tempstr
				end if
			end if
		end if
			
		If ls_select_field = "affiliation_status" Then // setting lookup field and where
			ls_datatype = "C"
			ls_bill_syn     =     ls_bill_syn + " code_lookup."+ ls_lu_field + " from code_lookup," + lower(ls_select_table) +  ls_use_link_sqlsyn + " WHERE " + "(convert(varchar," + lower(ls_select_table) + "." + ls_select_field + ") = convert(varchar,code_lookup.code)) and code_lookup.lookup_name = 'Affiliation Status' and "
			ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),code_lookup."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from code_lookup," + lower(ls_select_table) +  ls_use_link_sql + " WHERE " + "(convert(varchar," + lower(ls_select_table) + "." + ls_select_field + ") = convert(varchar,code_lookup.code)) and code_lookup.lookup_name = 'Affiliation Status' and "			
			//ls_prac_field = ls_select_table_trim + "_ctx_id"
			ls_select_field  = "code_lookup_" + ls_lu_field			
		//--------------------------- APPEON BEGIN ---------------------------
		//$<add> 03.16.2007 By: Jack (Export)
		//$<reason> Fix a defect.
		ElseIf ls_select_field = 'app_facility' And Upper(ls_db_lookup_type)  = "C" Then
			ls_datatype = "C"
			ls_bill_syn     = ls_bill_syn + " app_facility."+ ls_lu_field + " from app_facility," + lower(ls_select_table) +  ls_use_link_sqlsyn + " WHERE " + "(" + lower(ls_select_table) + "." + ls_select_field + " = app_facility.facility_id) and "
			ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),app_facility."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from app_facility," + lower(ls_select_table) +  ls_use_link_sql + " WHERE " + "(" + lower(ls_select_table) + "." + ls_select_field + " = app_facility.facility_id) and "			
			//ls_prac_field = ls_select_table_trim + "_ctx_id"
			ls_select_field  = "app_facility_" + ls_lu_field			
		ElseIf ls_select_field = 'contact_id' Then
			//--------------------------- APPEON BEGIN ---------------------------
			//$<modify> 06.05.2007 By: Jack
			//$<reason> Fix a defect.
			If ls_lu_field = 'contact_department' or ls_lu_field = 'contact_type' or ls_lu_field = 'contact_id' Then	
				ls_datatype = "N"	
			Else
				ls_datatype = "C"	
			End If
			
			If ls_lu_field = 'phone' Then
				ls_bill_syn     = ls_bill_syn + " ctx_contacts_phone = (select top 1 A.phone from ctx_contacts_numbers A where A.contact_id = ctx_contract_contacts.contact_id and a.via = (select lookup_code from code_lookup where lookup_name = 'Contract Contact Via' and code = 'Phone' ) and a.phone is not null)  from ctx_contract_contacts,ctx_contacts where ctx_contract_contacts.contact_id = ctx_contacts.contact_id and ctx_contract_contacts.ic_area = '" + ls_ic_area + "' and "
				if ai_type = 1 then
				//if ls_prac_sql <> '' then
					ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),(select top 1 A.phone from ctx_contacts_numbers A where A.contact_id = ctx_contract_contacts.contact_id and a.via = (select lookup_code from code_lookup where lookup_name = 'Contract Contact Via' and code = 'Phone' ) and a.phone is not null)) field_value, '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from ctx_contract_contacts,ctx_contacts " + ", (" + ls_prac_sql + ") bb " + " where ctx_contract_contacts.contact_id = ctx_contacts.contact_id and ctx_contract_contacts.ic_area = '" + ls_ic_area + "' and "					
				else
					ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),(select top 1 A.phone from ctx_contacts_numbers A where A.contact_id = ctx_contract_contacts.contact_id and a.via = (select lookup_code from code_lookup where lookup_name = 'Contract Contact Via' and code = 'Phone' ) and a.phone is not null)) field_value, '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from ctx_contract_contacts,ctx_contacts where ctx_contract_contacts.contact_id = ctx_contacts.contact_id and ctx_contract_contacts.ic_area = '" + ls_ic_area + "' and "					
				end if
			ElseIf ls_lu_field = 'ext' Then
				ls_bill_syn     = ls_bill_syn + " ctx_contacts_ext = (select top 1 A.ext from ctx_contacts_numbers A where A.contact_id = ctx_contract_contacts.contact_id and	a.via = (select lookup_code from code_lookup where lookup_name = 'Contract Contact Via' and code = 'Phone' ) and a.ext is not null)  from ctx_contract_contacts,ctx_contacts where ctx_contract_contacts.contact_id = ctx_contacts.contact_id and ctx_contract_contacts.ic_area = '" + ls_ic_area + "' and "
				if ai_type = 1 then
				//if ls_prac_sql <> '' then
					ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),(select top 1 A.ext from ctx_contacts_numbers A where A.contact_id = ctx_contract_contacts.contact_id and	a.via = (select lookup_code from code_lookup where lookup_name = 'Contract Contact Via' and code = 'Phone' ) and a.ext is not null)) field_value, '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from ctx_contract_contacts,ctx_contacts " + ", (" + ls_prac_sql + ") bb " + " where ctx_contract_contacts.contact_id = ctx_contacts.contact_id and ctx_contract_contacts.ic_area = '" + ls_ic_area + "' and "					
				else
					ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),(select top 1 A.ext from ctx_contacts_numbers A where A.contact_id = ctx_contract_contacts.contact_id and	a.via = (select lookup_code from code_lookup where lookup_name = 'Contract Contact Via' and code = 'Phone' ) and a.ext is not null)) field_value, '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from ctx_contract_contacts,ctx_contacts where ctx_contract_contacts.contact_id = ctx_contacts.contact_id and ctx_contract_contacts.ic_area = '" + ls_ic_area + "' and "					
				end if
			ElseIf ls_lu_field = 'contact_email' Then
				ls_bill_syn     = ls_bill_syn + " ctx_contacts_contact_email = (select top 1 A.contact_email from ctx_contacts_numbers A where A.contact_id = ctx_contract_contacts.contact_id and a.via = (select lookup_code from code_lookup where lookup_name = 'Contract Contact Via' and code = 'Email' ) and a.contact_email is not null)  from ctx_contract_contacts,ctx_contacts where ctx_contract_contacts.contact_id = ctx_contacts.contact_id and ctx_contract_contacts.ic_area = '" + ls_ic_area + "' and "
				if ai_type = 1 then
				//if ls_prac_sql <> '' then
					ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),(select top 1 A.contact_email from ctx_contacts_numbers A where A.contact_id = ctx_contract_contacts.contact_id and a.via = (select lookup_code from code_lookup where lookup_name = 'Contract Contact Via' and code = 'Email' ) and a.contact_email is not null)) field_value, '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from ctx_contract_contacts,ctx_contacts " + ", (" + ls_prac_sql + ") bb " + " where ctx_contract_contacts.contact_id = ctx_contacts.contact_id and ctx_contract_contacts.ic_area = '" + ls_ic_area + "' and "									
				else
					ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),(select top 1 A.contact_email from ctx_contacts_numbers A where A.contact_id = ctx_contract_contacts.contact_id and a.via = (select lookup_code from code_lookup where lookup_name = 'Contract Contact Via' and code = 'Email' ) and a.contact_email is not null)) field_value, '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from ctx_contract_contacts,ctx_contacts where ctx_contract_contacts.contact_id = ctx_contacts.contact_id and ctx_contract_contacts.ic_area = '" + ls_ic_area + "' and "									
				end if
			Else
				ls_bill_syn     =     ls_bill_syn + " ctx_contacts."+ ls_lu_field + " from ctx_contacts," + lower(ls_select_table) +  ls_use_link_sqlsyn + " WHERE " + "(" + lower(ls_select_table) + "." + ls_select_field + " = ctx_contacts.contact_id) and "
				ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),ctx_contacts."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from ctx_contacts," + lower(ls_select_table) +  ls_use_link_sql + " WHERE " + "(" + lower(ls_select_table) + "." + ls_select_field + " = ctx_contacts.contact_id) and "							
			End If
			//---------------------------- APPEON END ----------------------------
			
			ls_select_field  = "ctx_contacts_" + ls_lu_field
			
		// Add by Jack 03/26/2007
		ElseIf ls_select_field = 'compute_1' Then
			ls_datatype = "C"
			ls_bill_syn = " select ctx_contract_contacts.ctx_id,isnull(ctx_contacts.last_name,'') + ','  + isnull(ctx_contacts.first_name,'') + ', ' + isnull(ctx_contacts.middle_name,'') compute_1 from ctx_contract_contacts,ctx_contacts where ctx_contract_contacts.contact_id = ctx_contacts.contact_id and ctx_contract_contacts.ic_area = '" + ls_ic_area + "' and "
			if ai_type = 1 then
				//Modify 07.18.2008 by: Andy fixed BugG071701
				ls_sny_retrieve = ls_synprefix + "Select " + ls_top + " ctx_contract_contacts.ctx_id, " + ls_tablepk + ls_Sortsel + String(ll_FieldSeqID) + " FieldSeqID, 0 billing_address_id, isnull(ctx_contacts.last_name,'') + ','  + isnull(ctx_contacts.first_name,'') + case when isnull(ctx_contacts.middle_name,'') <> '' THEN ', ' + isnull(ctx_contacts.middle_name,'') else '' END field_value, '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from ctx_contract_contacts,ctx_contacts " + ", (" + ls_prac_sql + ") bb " + " where ctx_contract_contacts.contact_id = ctx_contacts.contact_id and ctx_contract_contacts.ic_area = '" + ls_ic_area + "' and "
			else
				//Modify 07.18.2008 by: Andy fixed BugG071701
				ls_sny_retrieve = ls_synprefix + "Select " + ls_top + " ctx_contract_contacts.ctx_id, " + ls_tablepk + ls_Sortsel + String(ll_FieldSeqID) + " FieldSeqID, 0 billing_address_id, isnull(ctx_contacts.last_name,'') + ','  + isnull(ctx_contacts.first_name,'') + case when isnull(ctx_contacts.middle_name,'') <> '' THEN ', ' + isnull(ctx_contacts.middle_name,'') else '' END field_value, '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from ctx_contract_contacts,ctx_contacts where ctx_contract_contacts.contact_id = ctx_contacts.contact_id and ctx_contract_contacts.ic_area = '" + ls_ic_area + "' and "
			end if			
			ls_select_field  = "compute_1"
			
		ElseIf ls_select_field = 'contact_phone' Then
			ls_datatype = "C"
			ls_bill_syn = " SELECT ctx_contract_contacts.ctx_id,contact_phone = (select top 1 A.phone from ctx_contacts_numbers A where A.contact_id = ctx_contract_contacts.contact_id and	a.via = (select lookup_code from code_lookup where lookup_name = 'Contract Contact Via' and code = 'Phone' ) and a.phone is not null)  from ctx_contract_contacts,ctx_contacts where ctx_contract_contacts.contact_id = ctx_contacts.contact_id and ctx_contract_contacts.ic_area = '" + ls_ic_area + "' and "
			if ai_type = 1 then
				//Modify 08/14/2007 by: Andy
				ls_sny_retrieve = ls_synprefix + "Select " + ls_top + " ctx_contract_contacts.ctx_id, " + ls_tablepk + ls_Sortsel + String(ll_FieldSeqID) + " FieldSeqID, 0 billing_address_id, (select top 1 A.phone from ctx_contacts_numbers A where A.contact_id = ctx_contract_contacts.contact_id and	a.via = (select lookup_code from code_lookup where lookup_name = 'Contract Contact Via' and code = 'Phone' ) and a.phone is not null) field_value, '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from ctx_contract_contacts,ctx_contacts " + ", (" + ls_prac_sql + ") bb " + " where ctx_contract_contacts.contact_id = ctx_contacts.contact_id and ctx_contract_contacts.ic_area = '" + ls_ic_area + "' and "
			else
				//Modify 08/14/2007 by: Andy
				ls_sny_retrieve = ls_synprefix + "Select " + ls_top + " ctx_contract_contacts.ctx_id, " + ls_tablepk + ls_Sortsel + String(ll_FieldSeqID) + " FieldSeqID, 0 billing_address_id, (select top 1 A.phone from ctx_contacts_numbers A where A.contact_id = ctx_contract_contacts.contact_id and	a.via = (select lookup_code from code_lookup where lookup_name = 'Contract Contact Via' and code = 'Phone' ) and a.phone is not null) field_value, '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from ctx_contract_contacts,ctx_contacts where ctx_contract_contacts.contact_id = ctx_contacts.contact_id and ctx_contract_contacts.ic_area = '" + ls_ic_area + "' and "
			end if						
			ls_select_field  = "contact_phone"			
		ElseIf ls_select_field = 'contact_email' Then
			ls_datatype = "C"	
			ls_bill_syn = " SELECT ctx_contract_contacts.ctx_id,contact_email = (select top 1 A.contact_email from ctx_contacts_numbers A where A.contact_id = ctx_contract_contacts.contact_id and a.via = (select lookup_code from code_lookup where lookup_name = 'Contract Contact Via' and code = 'Email' ) and a.contact_email is not null)  from ctx_contract_contacts,ctx_contacts where ctx_contract_contacts.contact_id = ctx_contacts.contact_id and ctx_contract_contacts.ic_area = '" + ls_ic_area + "' and "
			if ai_type = 1 then
				//Modify 08/14/2007 by: Andy
				ls_sny_retrieve = ls_synprefix + "Select " + ls_top + " ctx_contract_contacts.ctx_id, " + ls_tablepk + ls_Sortsel + String(ll_FieldSeqID) + " FieldSeqID, 0 billing_address_id, (select top 1 A.contact_email from ctx_contacts_numbers A where A.contact_id = ctx_contract_contacts.contact_id and a.via = (select lookup_code from code_lookup where lookup_name = 'Contract Contact Via' and code = 'Email' ) and a.contact_email is not null) field_value, '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from ctx_contract_contacts,ctx_contacts " + ", (" + ls_prac_sql + ") bb " + " where ctx_contract_contacts.contact_id = ctx_contacts.contact_id and ctx_contract_contacts.ic_area = '" + ls_ic_area + "' and "
			else
				//Modify 08/14/2007 by: Andy
				ls_sny_retrieve = ls_synprefix + "Select " + ls_top + " ctx_contract_contacts.ctx_id, " + ls_tablepk + ls_Sortsel + String(ll_FieldSeqID) + " FieldSeqID, 0 billing_address_id, (select top 1 A.contact_email from ctx_contacts_numbers A where A.contact_id = ctx_contract_contacts.contact_id and a.via = (select lookup_code from code_lookup where lookup_name = 'Contract Contact Via' and code = 'Email' ) and a.contact_email is not null) field_value, '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from ctx_contract_contacts,ctx_contacts where ctx_contract_contacts.contact_id = ctx_contacts.contact_id and ctx_contract_contacts.ic_area = '" + ls_ic_area + "' and "
			end if						
			ls_select_field  = "contact_email"					
		//---------------------------- APPEON END ----------------------------
		ElseIf Upper(ls_db_lookup_type)  = "C" Then //code lookup table
			//--------------------------- APPEON BEGIN ---------------------------
			//$<modify> 03.19.2007 By: Jack (Export)
			//$<reason> Fix a defect.
			If Upper(ls_lu_field) = "LOOKUP_CODE" Then
				ls_datatype = "N"
			Else
				ls_datatype = "C"
			End If
			
			If ls_select_table <> 'app_facility' Then
				ls_bill_syn     =     ls_bill_syn + " code_lookup."+ ls_lu_field + " from code_lookup," + Lower(ls_select_table) +  ls_use_link_sqlsyn + " WHERE " + "(convert(varchar," + Lower(ls_select_table) + "." + ls_select_field + ") = convert(varchar,code_lookup.lookup_code)) and "
				ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),code_lookup."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from code_lookup," + lower(ls_select_table) +  ls_use_link_sql + " WHERE " + "(convert(varchar," + lower(ls_select_table) + "." + ls_select_field + ") = convert(varchar,code_lookup.lookup_code)) and "			
			Else
				ls_bill_syn     =     ls_bill_syn + " code_lookup."+ ls_lu_field + " from ctx_basic_info,code_lookup," + Lower(ls_select_table) +  ls_use_link_sqlsyn + " WHERE " + "(convert(varchar," + Lower(ls_select_table) + "." + ls_select_field + ") = convert(varchar,code_lookup.lookup_code)) and "
				ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),code_lookup."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from ctx_basic_info,code_lookup," + lower(ls_select_table) +  ls_use_link_sql + " WHERE " + "(convert(varchar," + lower(ls_select_table) + "." + ls_select_field + ") = convert(varchar,code_lookup.lookup_code)) and "			
			End If				
			//---------------------------- APPEON END ----------------------------
			ls_select_field  = "code_lookup_" + ls_lu_field			
		ElseIf Upper(ls_db_lookup_type)  = "A" Then //address lookup table		
			If ls_lu_field = "description"  Then
				MessageBox("Data Error on field " + ls_export_field,"The address lookup field set for export field '" + ls_select_field + "' is improperly set.  You cannot use description, try entity_name.  Please correct.")
				Close(w_export_progress)
				//<add> 08/24/2007 by: Andy
				if lb_ASA7 then
					ls_Mysql = "DROP TABLE " + ls_tabletemp + ";"
					EXECUTE IMMEDIATE :ls_Mysql;
				end if
				//<add> andy 07/17/2007
				Destroy lds_export_flds
				Destroy lds_export_hdr
				Destroy lds_address_lookup
				Destroy lds_code_lookup
				Destroy lds_dept_chair
				Destroy lds_export_equiv_code
				Destroy lds_dataobject
				Destroy lds_linkto
				Destroy lds_field
				Destroy lds_export_dataTemp
				Destroy lds_tablepk
				Destroy lds_export_data
				//<del> 2008-05-04 by:nova
				//end of add
				//$<add> 01.07.2008 by: Andy
				//if lb_ASA7 then gnv_appeondb.of_commitqueue( )
				Return 0
				
			Else
				If Upper(ls_lu_field) = "LOOKUP_CODE" Then
					ls_datatype = "N"
				ElseIf Upper(ls_lu_field) = "CUSTOM_1" Or Upper(ls_lu_field) = "CUSTOM_2" Then //maha 050704 
					ls_datatype = "N"
				Else
					ls_datatype = "C"
				End If
				
				ls_bill_syn     =     ls_bill_syn + " address_lookup." + ls_lu_field + " from address_lookup," + Lower(ls_select_table) +  ls_use_link_sqlsyn + " WHERE " + "(convert(varchar," + Lower(ls_select_table) + "." + ls_select_field + ") = convert(varchar,address_lookup.lookup_code)) and "
				ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),address_lookup."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from address_lookup," + lower(ls_select_table) +  ls_use_link_sql + " WHERE " + "(convert(varchar," + lower(ls_select_table) + "." + ls_select_field + ") = convert(varchar,address_lookup.lookup_code)) and "			
				ls_select_field  = "address_lookup_" + ls_lu_field
			End If
		Elseif ls_db_lookup_type = "X" Then//ToDo:
			
			ls_datatype = ldwc_dddw.Describe( ls_lu_field + ".coltype")
			Choose Case Left ( ls_datatype , 5 )
				Case "char(", "char"
					ls_datatype = "C"
				Case "date"	,"datet"	,"time", "times"
					ls_datatype = "D"
				Case "decim","numbe", "doubl", "real","long", "ulong", "int"
					ls_datatype = "N"
			End Choose
			
			ls_bill_syn     = ls_bill_syn + " " + ls_dddwtable + "."+ ls_dddw_column_dbname + " from " + ls_dddwtable + "," + &
									Lower(ls_select_table) +  ls_use_link_sqlsyn + " WHERE " + "(" + Lower(ls_select_table) + "." + &
									ls_select_field + " = " + ls_dddwtable + "." + ls_dddwdata + ") and "
			
			if upper(ls_datatype) = 'D' then 
				ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(16)," + ls_dddwtable + "."+ ls_dddw_column_dbname + ",120) field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + ls_dddwtable + "," + &
										Lower(ls_select_table) +  ls_use_link_sql + " WHERE " + "(" + Lower(ls_select_table) + "." + &
										ls_select_field + " = " + ls_dddwtable + "." + ls_dddwdata + ") and "
			else
				ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + ")," + ls_dddwtable + "."+ ls_dddw_column_dbname + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + ls_dddwtable + "," + &
										Lower(ls_select_table) +  ls_use_link_sql + " WHERE " + "(" + Lower(ls_select_table) + "." + &
										ls_select_field + " = " + ls_dddwtable + "." + ls_dddwdata + ") and "
			end if			
			//ls_prac_field = ls_select_table_trim + "_ctx_id"
			ls_select_field  = ls_dddwtable + "_" + ls_dddw_column_dbname
		Else // NON LOOKUP FIELDS
			
			ls_datatype = lds_dataobject.Describe( ls_select_field_ctx + ".coltype")
			Choose Case Left ( ls_datatype , 5 )
				Case "char(", "char"
					ls_datatype = "C"
				Case "date"	,"datet"	,"time", "times"
					ls_datatype = "D"
				Case "decim","numbe", "doubl", "real","long", "ulong", "int"
					ls_datatype = "N"
			End Choose
					
			//If IsNull(ls_datatype) Then MessageBox("datatype not anticipated","Retrieved null datatype")
 			if isnull(ls_datatype) then messagebox("Datatype Not Anticipated","Retrieved null datatype")
			
			If Len(ls_aggre) > 0 Then //maha 012703 for aggregate functions
				ls_bill_syn     =     ls_bill_syn + ls_aggre + "("	+ ls_select_table + "." + ls_select_field + ") a" + ls_aggre + " from " + Lower(ls_select_table) +  ls_use_link_sqlsyn + " WHERE "
				//ls_sny_retrieve = ls_sny_retrieve + ls_aggre + "("	+ ls_select_table + "." + ls_select_field + ") a" + ls_aggre + " from " + Lower(ls_select_table) +  ls_use_link_sql + " WHERE "
				ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + ")," + ls_aggre + "("	+ ls_select_table + "." + ls_select_field + ")) field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + lower(ls_select_table) +  ls_use_link_sql + " WHERE " 
			Else
				//--------------------------- APPEON BEGIN ---------------------------
				//$<modify> 03.19.2007 By: Jack (Export)
				//$<reason> Fix a defect.
				If ls_select_table <> 'app_facility' Then
					ls_bill_syn     =     ls_bill_syn + ls_select_table + "." +ls_select_field + " from " + Lower(ls_select_table) +  ls_use_link_sqlsyn + " WHERE "
					if upper(ls_datatype) = 'D' then
						ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(16),"+ ls_select_table + "." +ls_select_field + ",120) field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + Lower(ls_select_table) +  ls_use_link_sql + " WHERE "
					else
						ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),"+ ls_select_table + "." +ls_select_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + Lower(ls_select_table) +  ls_use_link_sql + " WHERE "
					end if
				Else
					ls_bill_syn     =     ls_bill_syn + ls_select_table + "." +ls_select_field + " from ctx_basic_info," + Lower(ls_select_table) +  ls_use_link_sqlsyn + " WHERE "
					if upper(ls_datatype) = 'D' then
						ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(16),"+ ls_select_table + "." +ls_select_field + ",120) field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from ctx_basic_info," + lower(ls_select_table) +  ls_use_link_sql + " WHERE "
					else
						ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),"+ ls_select_table + "." +ls_select_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from ctx_basic_info," + lower(ls_select_table) +  ls_use_link_sql + " WHERE "
					end if
				End If
				//---------------------------- APPEON END ----------------------------
			End If
		End If
		
		//export_fields_use_link  sql
		If li_use_link = 1 Then
			ls_use_link_sql2 = " (" + ls_linktotable + "." + ls_linktocol + " = " + ls_select_table + "." + ls_linkfromcol + ") and "

			If Upper(ls_db_lookup_type) = "A" Or Upper(ls_db_lookup_type) = "C" Then
			Else
				ls_select_field = ls_select_table_trim + "_" + ls_select_field
			End If
		End If
		
		ls_bill_syn     = ls_bill_syn + ls_use_link_sql2
		ls_sny_retrieve = ls_sny_retrieve + ls_use_link_sql2
		
		//add facility where
		If li_facil_id > 0 Then
			Choose Case ls_select_table
				Case "pd_address"
					ls_sny_retrieve = ls_sny_retrieve + "(pd_address_link.facility_id = " + String(li_facil_id) + ") and "
				Case "pd_hosp_affil"
					ls_sny_retrieve = ls_sny_retrieve + "(pd_hosp_facility_link.facility_id = " + String(li_facil_id) + ") and "
				Case "pd_board_specialty"
					ls_sny_retrieve = ls_sny_retrieve + "(pd_spec_facility_link.facility_id = " + String(li_facil_id) + ") and "
				Case "pd_affil_stat"
					ls_sny_retrieve = ls_sny_retrieve + "(pd_affil_stat.parent_facility_id = " + String(li_facil_id) + ") and "
				Case Else
					ls_sny_retrieve = ls_sny_retrieve +  + "(" + ls_select_table + ".facility_id = " + String(li_facil_id) + ") and "
					
					
			End Choose
		End If
		
		ls_billsynList[ll_FieldSeqID] = ls_bill_syn
		//--------------------------- APPEON BEGIN ---------------------------
		//$<modify> 03.19.2007 By: Jack (Export)
		//$<reason> Fix a defect.
		If ls_select_table <> 'app_facility' Then
			//modify 08/15/2007 by: Andy
			if ai_type = 1 then
			//if ls_prac_sql <> '' then 
				ls_sny_retrieve = ls_sny_retrieve + ls_usetable + ".ctx_id  = bb.ctx_id "  + ls_filter
			elseif ai_type = 3 then
				ls_sny_retrieve = ls_sny_retrieve + ls_usetable + ".ctx_id " + ls_prac_ids + ls_filter
			elseif ai_type = 2 then
				ls_sny_retrieve = ls_sny_retrieve + ls_usetable + ".ctx_id  in (" + ls_prac_ids  + ")"  + ls_filter
			end if
			//end of modify
		Else
			//------------------Begin Modified by Alfee on 08.18.2008------------------------------------
			//<$Reason>Fix a bug of duplicate records while 2 or more contracts have the same company 
			if ai_type = 1 then
				ls_sny_retrieve = ls_sny_retrieve + " ctx_basic_info.app_facility = app_facility.facility_id and ctx_basic_info.ctx_id = bb.ctx_id and " + lower(ls_select_table) + ".facility_id in (select ctx_basic_info.app_facility from ctx_basic_info where ctx_basic_info.ctx_id  = bb.ctx_id )"  + ls_filter
			elseif ai_type = 3 then 
				ls_sny_retrieve = ls_sny_retrieve + " ctx_basic_info.app_facility = app_facility.facility_id and ctx_basic_info.ctx_id " + ls_prac_ids + " and " + lower(ls_select_table) + ".facility_id in (select ctx_basic_info.app_facility from ctx_basic_info where ctx_basic_info.ctx_id " + ls_prac_ids  + " )"  + ls_filter
			elseif ai_type = 2 then
				ls_sny_retrieve = ls_sny_retrieve + " ctx_basic_info.app_facility = app_facility.facility_id and ctx_basic_info.ctx_id in (" + ls_prac_ids + ") and " + Lower(ls_select_table) + ".facility_id in (select ctx_basic_info.app_facility from ctx_basic_info where ctx_basic_info.ctx_id  in (" + ls_prac_ids  + "))"  + ls_filter
			end if					
			/* if ai_type = 1 then
			//if ls_prac_sql <> '' then 
				ls_sny_retrieve = ls_sny_retrieve + " ctx_basic_info.app_facility = app_facility.facility_id and " + lower(ls_select_table) + ".facility_id in (select ctx_basic_info.app_facility from ctx_basic_info where ctx_basic_info.ctx_id  = bb.ctx_id )"  + ls_filter
			elseif ai_type = 3 then 
				ls_sny_retrieve = ls_sny_retrieve + " ctx_basic_info.app_facility = app_facility.facility_id and " + lower(ls_select_table) + ".facility_id in (select ctx_basic_info.app_facility from ctx_basic_info where ctx_basic_info.ctx_id " + ls_prac_ids  + " )"  + ls_filter
			elseif ai_type = 2 then
				ls_sny_retrieve = ls_sny_retrieve + " ctx_basic_info.app_facility = app_facility.facility_id and " + Lower(ls_select_table) + ".facility_id in (select ctx_basic_info.app_facility from ctx_basic_info where ctx_basic_info.ctx_id  in (" + ls_prac_ids  + "))"  + ls_filter
			end if */
			//------------------End Modified -------------------------------------------------------------							
		End If	
		//---------------------------- APPEON END ----------------------------
		
		//2nd last add  - prac where
		If Len(ls_aggre) > 0 Then //maha 012703 for aggregate functions
			//modify 08/15/2007 by: Andy
			ls_sny_retrieve = ls_sny_retrieve + " Group by " + ls_usetable + ".ctx_id , FieldSeqID , billing_address_id , field_data_type" + ls_RowNo
		End If
		
		//last add - order by
		//--------------------------- APPEON BEGIN ---------------------------
		//$<modify> 03.19.2007 By: Jack (Export)
		//$<reason> Fix a defect.
		/*
		If ls_select_table <> 'app_facility' Then

			if li_use_link = 1 then
				ls_sny_retrieve = ls_sny_retrieve + " order by " + Lower(ls_linktotable) + ".ctx_id"
			else
				ls_sny_retrieve = ls_sny_retrieve + " order by " + Lower(ls_select_table) + ".ctx_id"
			end if

		Else
			//ls_sny_retrieve = ls_sny_retrieve + " order by ctx_basic_info.ctx_id"
			If isnull(ls_db_lookup_type) Then ls_db_lookup_type = ''
			If Upper(ls_db_lookup_type) <> "C" Then
				ls_select_field = 'app_facility_' + ls_select_field
			End If
		End If
		*/
		//comment 08/16/2007 by: Andy
		//ls_sny_retrieve = ls_sny_retrieve + "~r~n order by " + ls_usetable + ".ctx_id , FieldSeqID "

		//modify 08/23/2007 by: Andy
		if len(ls_sort) > 0 and Not lb_true then//SQL2000 only 
			//ls_sny_retrieve = ls_sny_retrieve + "~r~n order by " + ls_sort 
			ls_sny_retrieve = ls_sny_retrieve + "~r~n " + ls_sort
		end if
		//end of modify
		
		/*comment 08/23/2007 by: Andy
		if len(ls_aggre) > 0 and Not lb_true  then
			//ls_OrderBy = ls_OrderBy + " , field_value"
			ls_sny_retrieve = ls_sny_retrieve + " , field_value"
		end if			
		*/
		//modify 05/05/2008 by: Andy
		if Not lb_ASA7 then 
			ls_sny_retrieve = ls_sny_retrieve + " ) t" + String(ll_FieldSeqID)
		ELSE
			ls_MySQL = "INSERT INTO " + ls_tabletemp + " ~r~n(prac_id,FieldSeqID, billing_address_id, field_value, field_data_type) ~r~n " + ls_sny_retrieve + " ;"
			EXECUTE IMMEDIATE :ls_Mysql;
			IF SQLCA.SQLCode <> 0 THEN
				MessageBox("Caution on export field " + ls_export_field, SQLCA.SQLERRTEXT)
				close(w_export_progress)
				//<add> 08/24/2007 by: Andy
				if lb_ASA7 then
					ls_Mysql = "DROP TABLE " + ls_tabletemp + ";"
					EXECUTE IMMEDIATE :ls_Mysql;
				end if
				if IsValid(lds_export_flds) then destroy lds_export_flds
				if IsValid(lds_export_hdr) then destroy lds_export_hdr
				if IsValid(lds_address_lookup) then destroy lds_address_lookup
				if IsValid(lds_code_lookup) then destroy lds_code_lookup
				if IsValid(lds_export_data) then destroy lds_export_data
				if IsValid(lds_dept_chair) then destroy lds_dept_chair
				if IsValid(lds_field) then Destroy lds_field
				if IsValid(lds_export_dataTemp) then Destroy lds_export_dataTemp
				if IsValid(lds_export_equiv_code) then Destroy lds_export_equiv_code
				Destroy lds_tablepk
				//<del> 2008-05-04 by:nova
				//$<add> 01.07.2008 by: Andy
				//if lb_ASA7 then gnv_appeondb.of_commitqueue( )
				RETURN -1
			END IF
		END IF
		//end of add
		if isnull(ls_sny_retrieve) then ls_sny_retrieve = ""
		if Len(ls_sny_retrieve) > 0 then 
			if ls_UnionSQL = "" then 
				ls_UnionSQL = ls_sny_retrieve
			else 
				ls_UnionSQL = ls_UnionSQL + "~r~n union all ~r~n" + ls_sny_retrieve
			end if
		end if
	//<add> andy 2007.05.25 
	else //computer fields
		//Dynamic create computer columns in order to Calculate its value
		/*1.deal with Expression**************/
		ls_export_field     = lds_export_flds.GetItemString(p,"export_field_name")
		//<add> 08/24/2007 by: Andy
		of_replacespecchar(ls_export_field)
		//end of add
		ls_Expresstion      = Trim( lds_export_flds.GetItemString( p, "export_fields_expression" ) )//db_field_name
		ls_ComputerDataType = lds_export_flds.GetItemString(p,"ctx_column_datatype")
		if isnull(ls_export_field) then ls_export_field = ''
		if isnull(ls_Expresstion) then ls_Expresstion = ''
		if isnull(ls_ComputerDataType) then ls_ComputerDataType = ''
		if isnull(ls_field_format) then ls_field_format = ''
		if isnull(ls_fld_delim) then ls_fld_delim = ''
		ll_Cnt = lds_field.RowCount()
		
		//If the computer field is numeric,add the function number(  ) in to the Expresstion.
		//Replace symbol ' with "
		//comment 07/18/2007 by:Andy Reason:support other data type
		//if upper(ls_ComputerDataType) = 'N' then
		for ll_Num = 1 to ll_Cnt
			ls_Field         = lds_field.GetItemString(ll_Num,"export_field_name")
			ls_FieldDataType = lds_field.GetItemString(ll_Num,"ctx_column_datatype")
			if isnull(ls_Field) then ls_Field = ''
			if isnull(ls_FieldDataType) then ls_FieldDataType = ''
			//<add> 07/27/2007 by: Andy 
			//Reason:The Expresstion of a computer field cann't contain itself.
			if lower(ls_export_field) = lower(ls_Field) then continue
			//end of add
			
			//If the field used in then computer field and is number, 
			//add the function number(  ) in to the Expresstion 
			//Modify 07/18/2007 by: Andy
			if POS(lower(ls_Expresstion),lower(ls_Field)) > 0 then
				if upper(ls_FieldDataType) = 'N' then
					//Modify 07/17/2007 by: Andy if( isNull( rec_id  ), 0,  rec_id  )
					ls_Expresstion  = of_globalreplace( ls_Expresstion, ls_Field, "if( isNull( "+ls_Field+" ),0,number( " + ls_Field + " ))",true)
					//end of modify
				elseif upper(ls_FieldDataType) = 'S' then
					//string
					ls_Expresstion  = of_globalreplace( ls_Expresstion, ls_Field, "if( isNull( "+ls_Field+" ),''," + ls_Field + " )",true)
				//<add> 07/27/2007 by: Andy	
				ELSEIF upper(ls_FieldDataType) = 'D' then
					//Datetime
					ls_Expresstion  = of_globalreplace( ls_Expresstion, ls_Field, "if( isNull( "+ls_Field+" ),'1900-01-01'," + ls_Field + " )",true)
				//end of add	
				end if
			end if
			//end of Modify
		next
		//end if
		
		//replace symbol ' with "
		ls_Expresstion  = lnvo_string.of_globalreplace( ls_Expresstion, '~~', '~~~~')
		ls_Expresstion  = lnvo_string.of_globalreplace( ls_Expresstion, '"', '~~"')//'"'
		//ls_Expresstion  = lnvo_string.of_globalreplace( ls_Expresstion, "'", "~~'")//'"'
		/*end of 1***************************/
		
		ls_tag = ls_field_format + '@^@' + ls_ComputerDataType + '@^@' + string(li_width) + '@^@' + ls_fld_delim
		//2.Dynamic create computer columns,the name equal ls_Field + '_c'
		ls_modify = "create compute(band=detail alignment='0' expression=~""+ls_Expresstion+"~" border='0' color='33554432' x='1157'" + &
		            " y='4' height='64' width='242' format='[GENERAL]' html.valueishtml='0'  name=" + ls_export_field + "_c visible='0'" + &
						" font.face='MS Sans Serif' font.height='-8' font.weight='400'  font.family='2' font.pitch='2' font.charset='0'" + &
						" background.mode='1' background.color='536870912' tag='" + ls_tag + "' )"
		ls_Err    = lds_export_dataTemp.Modify(ls_modify)
		//end of 2		
		//end of add
	End If
Next
//<del> 2008-05-04 by:nova
//<add> 08/23/2007 by: Andy
//if lb_ASA7 then gnv_appeondb.of_commitqueue( )

w_export_progress.hpb_bar.position = 15
//w_export_progress.r_bar.Width = w_export_progress.r_bar.Width + 50
w_export_progress.st_export.text = "Retrieve Data"

ll_FieldCnt = ll_FieldSeqID
if ls_UnionSQL <> "" then
	//Modify 08/23/2007 by: Andy
	if lb_true THEN//SQL2005 and ASA9
		//ls_UnionSQL = ls_UnionSQL + "~r~n order by " + "ctx_id , FieldSeqID "//ls_OrderBy
		ls_UnionSQL = ls_UnionSQL + "~r~n order by " + "FieldSeqID, ctx_id , Row_No"
	end if

	//modify 08/24/2007 by: Andy Reason:Moved before here
	//create the field datastore
	//ll_maxwidth = Long(lds_export_flds.describe("evaluate('max(export_field_length)',0)"))
	//if ll_maxwidth < 30 then ll_maxwidth = 30
	
	//<add> 08/24/2007 by: Andy
	if lb_true then ls_RowNo = ", 0 Row_No"//SQL2005 AND ASA9
	if lb_ASA7 then
		ls_SqlSelect = "Select prac_id,FieldSeqID,billing_address_id,field_value,field_data_type from " + ls_tabletemp
	else
		ls_SqlSelect = "Select top 1 0 prac_id, 1 FieldSeqID, 0 billing_address_id,  cast('' as varchar(" + String(ll_maxwidth) + ")) field_value,  ' ' field_data_type" + ls_RowNo + " from pd_basic"
	end if
	
	//ls_presentation_str = "style(type=grid)"		
	
	ls_dwsyntax_str = SQLCA.SyntaxFromSQL(ls_SqlSelect, ls_presentation_str, ERRORS)
	IF Len(ERRORS) > 0 THEN
		// + ls_export_field
		MessageBox("Caution on export field ", &
		"SyntaxFromSQL caused these errors: " + ERRORS + "~r~r" + ls_SqlSelect)
		close(w_export_progress)
		//<add> 08/24/2007 by: Andy
		if lb_ASA7 then
			ls_Mysql = "DROP TABLE " + ls_tabletemp + ";"
			EXECUTE IMMEDIATE :ls_Mysql;
		end if
		//<add> andy 07/17/2007
		Destroy lds_export_flds
		Destroy lds_export_hdr
		Destroy lds_address_lookup
		Destroy lds_code_lookup
		Destroy lds_dept_chair
		Destroy lds_export_equiv_code
		Destroy lds_dataobject
		Destroy lds_linkto
		Destroy lds_field
		Destroy lds_export_dataTemp
		Destroy lds_tablepk
		Destroy lds_export_data
		//end of add
		RETURN -1
	END IF

	lds_export_retrieve = CREATE n_ds
	w = lds_export_retrieve.Create( ls_dwsyntax_str, ERRORS)
	if w < 1 then
		//messagebox("error on create",errors)
 		messagebox("Error on Create",errors)
		close(w_export_progress)
		//<add> 08/24/2007 by: Andy
		if lb_ASA7 then
			ls_Mysql = "DROP TABLE " + ls_tabletemp + ";"
			EXECUTE IMMEDIATE :ls_Mysql;
		end if
		//<add> andy 07/17/2007
		Destroy lds_export_flds
		Destroy lds_export_hdr
		Destroy lds_address_lookup
		Destroy lds_code_lookup
		Destroy lds_dept_chair
		Destroy lds_export_equiv_code
		Destroy lds_dataobject
		Destroy lds_linkto
		Destroy lds_field
		Destroy lds_export_dataTemp
		Destroy lds_tablepk
		Destroy lds_export_data
		//end of add
		return -1
	end if

	//Modify 08/23/2007 by: Andy
	if Not lb_ASA7 then
		lds_export_retrieve.Modify('DataWindow.Table.Select="' + ls_UnionSQL + '"')
	END IF
	
	lds_export_retrieve.SetTransObject( SQLCA )
	ll_ret_cnt = lds_export_retrieve.retrieve()
	
	//<add> 05/05/2008 by: Andy
	if ll_Ret_Cnt < 0 then		
		//Reason:check syntax
		ls_presentation_str = "style(type=grid)"
		
		ls_dwsyntax_str = SQLCA.SyntaxFromSQL(ls_UnionSQL, ls_presentation_str, ERRORS)
		IF Len(ERRORS) > 0 THEN
			MessageBox("Caution on export" , &
			"SyntaxFromSQL caused these errors: " + ERRORS)
			close(w_export_progress)

			if lb_ASA7 then
				ls_Mysql = "DROP TABLE " + ls_tabletemp + ";"
				EXECUTE IMMEDIATE :ls_Mysql;
			end if

			if IsValid(lds_export_flds) then destroy lds_export_flds
			if IsValid(lds_export_hdr) then destroy lds_export_hdr
			if IsValid(lds_address_lookup) then destroy lds_address_lookup
			if IsValid(lds_code_lookup) then destroy lds_code_lookup
			if IsValid(lds_export_data) then destroy lds_export_data
			if IsValid(lds_dept_chair) then destroy lds_dept_chair
			if IsValid(lds_field) then Destroy lds_field
			if IsValid(lds_export_dataTemp) then Destroy lds_export_dataTemp
			if IsValid(lds_export_equiv_code) then Destroy lds_export_equiv_code
			Destroy lds_tablepk

			RETURN -1
		END IF		
	end if
	//end of add
end if

w_export_progress.hpb_bar.position = 20
//Modify 08/22/2007 by: Andy
//li_bar_ticks = 70 / li_prac_id_cnt
li_bar_ticks = 70 / li_fld_cnt

//%%%%%%%%%%%%%%%%%%%%%%%%%%%% end of create syntax

ls_prac_field = lds_export_retrieve.describe("#1.name")

DO WHILE (ll_i <= ll_ret_cnt)
	ll_j = 0
	ls_data_value = ""
	ls_value = ""
	ls_lookup_val = ""
	ldt_value = datetime(date("0000-00-00"),time("00:00:00"))
	
	ll_pracid       = lds_export_retrieve.GetitemNumber(ll_i,ls_prac_field)
	ll_FieldSeqID   = lds_export_retrieve.GetitemNumber(ll_i,"FieldSeqID")
	li_recd_no      = li_recdnoList[ll_FieldSeqID]
	//add 08/22/2007 by: Andy
	ls_select_table = ls_tablelist[ll_FieldSeqID]
	ls_select_field = ls_selectfieldlist[ll_FieldSeqID]
	ls_export_field = ls_fieldlist[ll_FieldSeqID]			
	ls_field_format = ls_formatList[ll_FieldSeqID]		
	ll_export_code  = ll_exportcodeList[ll_FieldSeqID]
	//<add> 08/21/2007 by: Andy
	li_sub_start    = li_substartList[ll_FieldSeqID]
	//end of add
	li_width        = li_widthList[ll_FieldSeqID]
	ls_fld_delim    = ls_flddelimList[ll_FieldSeqID]			
	ls_text         = ls_textList[ll_FieldSeqID]
	ls_lu_field     = ls_lu_fieldList[ll_FieldSeqID]
	li_facil_id     = li_facil_idList[ll_FieldSeqID]
	li_act_format   = li_act_formatList[ll_FieldSeqID]
	
	ud = li_udList[ll_FieldSeqID]
	if ud = 1 then
		ls_def_val = ls_defvalList[ll_FieldSeqID]
	elseif ud = 2 then //column default
		col = Long(ls_defvalList[ll_FieldSeqID])
	else
		ls_def_val = ""
	end if
		
	//Modify 08/22/2007 by: Andy
	if ll_FieldSeqIDold <> ll_FieldSeqID then
		ll_R = 0 
		//ll_R = lds_export_data.Find("rec_id= " + String(ll_pracid),ll_R + 1,li_prac_id_cnt)
		ll_FieldSeqIDold = ll_FieldSeqID
		w_export_progress.st_export.text  = ls_select_table + "_" + ls_select_field    //string(ll_FieldSeqID) + "   " + 
		w_export_progress.st_export1.text = ls_select_field   
		
		//if mod(ll_R,n) = 0 then
		if mod(ll_FieldSeqID,n) = 0 then
			w_export_progress.hpb_bar.position = w_export_progress.hpb_bar.position + 1
		end if 
		//ll_Rorig = ll_R
	end if
	
	//MODIFY 10/12/2007 by:Andy
	//ll_R = lds_export_data.Find("rec_id= " + String(ll_pracid),ll_R + 1,li_prac_id_cnt)
	FOR ll_R = ll_R + 1 to li_prac_id_cnt
		IF al_prac_ids[ll_R] = ll_pracid THEN EXIT
	NEXT
	//end of modify
	
	//<ADD> 07/12/2007 by: Andy Find the max row of the current ll_FieldSeqID
	/*
	ls_find = "(" + ls_prac_field + " = " + String(ll_pracid) + " AND FieldSeqID > " + String(ll_FieldSeqID) + &
				 ") OR (" + ls_prac_field + " > " + String(ll_pracid) + ")"*/
	//modify 08/22/2007 by: Andy Find the max row of the current ll_pracid
	ls_find = "(" + ls_prac_field + " > " + String(ll_pracid) + " AND FieldSeqID = " + String(ll_FieldSeqID) + &
				 ") OR ( FieldSeqID  > " + String(ll_FieldSeqID) + ")"
	ll_j    = lds_export_retrieve.Find ( ls_find, ll_i + 1, ll_ret_cnt )
	if ll_j > 0 then 
		//The max row of the current FieldSeqID
		ll_j = ll_j - 1
	end if

	//Perhaps it is the last ll_pracid and it is the max FieldSeqID,
	//then set ll_j = ll_ret_cnt(max row in the ds)
	if ll_j = 0 then 
		ll_j = ll_ret_cnt
	end if
	
	//max - min + 1 = total(current FieldSeqID)
	if ll_j - ll_i + 1 >= li_recd_no then
		//find out
		ll_prac_row = ll_i + li_recd_no - 1 
	else
		//Not 
		ll_prac_row = 0
	end if
	//END OF addd
	
	//process data
	if ll_prac_row > 0 then
		ls_datatype     = lds_export_retrieve.getitemString(ll_prac_row, "field_data_type" )	
	
		if li_billing = 1 then //maha app080205 to get billing address data 
			ll_billing_id   = lds_export_retrieve.getitemnumber(ll_prac_row, "billing_address_id" )
			ls_data_value = of_get_billing(ll_billing_id,ls_datatype,ls_select_field,ls_field_format,ls_billsynList[ll_FieldSeqID])//ls_bill_syn
		else
			ls_data_value = lds_export_retrieve.getitemString(ll_prac_row, "field_value")
			/*comment 08/28/2007 by:Andy Reson:use of_data_format function
			if ls_datatype = 'T' or ls_datatype = 'D' then
				//<add> 07/12/2007 by: Andy 
				ldt_value = datetime(date(left(ls_data_value,10)),time(right(ls_data_value,5)))
				//format the date
				ls_value = of_date_format(ls_field_format,ldt_value) //maha 070705
					//messagebox("date value",ls_value)
				ls_data_value = string(ls_value)
				//end if
			end if
			*/
		end if
	else
		//do nothing
	end if
	
	//comment 08/24/2007 by: Andy
	//ls_export_field = lnvo_string.of_globalreplace( ls_export_field, "#", "_")
	//<add> andy 07.05.2007 save original values
	if lower(lds_export_dataTemp.describe(ls_export_field + ".name")) = lower(ls_export_field) then
		lds_export_dataTemp.SetItem(ll_R,ls_export_field,ls_data_value)
	end if
	//end of add
		
	if ls_format = "export" then
		if isnull(ls_data_value) then ls_data_value = ""
	end if
	
	//<add> 08/28/2007 by: Andy
	of_data_format(ls_field_format,ls_datatype,ls_data_value)
	//end of add
	
	/*comment 08/28/2007 by:Andy Reson:use of_data_format function
	//address format
	if ls_field_format = "(xxx)xxx-xxxx" then
		w = len(ls_data_value)
		if w > 0 then //maha 82202
			for a = w to 1 step - 1 //strip existing format
				if not isnumber(mid(ls_data_value,a,1)) then							
					ls_data_value = mid(ls_data_value,1,a - 1 ) + mid(ls_data_value,a + 1 )
				end if					
			next
			ls_data_value = "(" + mid(ls_data_value,1,3 ) + ")" + mid(ls_data_value,4,3 ) + "-" + mid(ls_data_value,7,4 )
		end if
	end if

	//--------------------------- APPEON BEGIN ---------------------------
	//$<add> 04.13.2007 By: Jack
	If ls_field_format = "$##,###" Then
		If isnumber(ls_data_value) Then
			//<add> 06/22/2007 by: Andy fixed bug5(Contract Logix/Contract Logix_Issues_6-21-07.doc)
			//Because if value equal to 0,it will display "$".
			if double(ls_data_value) = 0 then setnull(ls_data_value)
			If isnumber(ls_data_value) Then
				ls_data_value = string(Round( double(ls_data_value), 0 ),"$##,###")
			end if
			//end of add
			//comment 06/22/2007 by: Andy
			//ls_data_value = string(long(ls_data_value),"$##,###")
		End If
	ElseIf ls_field_format = "$##,###.##" Then
		If isnumber(ls_data_value) Then
			//<add> 06/22/2007 by: Andy fixed bug5(Contract Logix/Contract Logix_Issues_6-21-07.doc)
			//Because if value equal to 0,it will display "$.".
			if double(ls_data_value) = 0 then setnull(ls_data_value)
			If isnumber(ls_data_value) Then
				ls_data_value = string(Round( double(ls_data_value), 0 ),"$##,###.##")
			end if
			//end of add
			//comment 06/22/2007 by: Andy
			//ls_data_value = string(double(ls_data_value),"$##,###.##")
		End If
	//<add> 06/20/2007 by: Andy
	elseif ls_field_format = "$##,###.00" Then
		If isnumber(ls_data_value) Then
			//<add> 06/22/2007 by: Andy fixed bug5(Contract Logix/Contract Logix_Issues_6-21-07.doc)
			//Because if value equal to 0,it will display "$.00".	
			if double(ls_data_value) = 0 then setnull(ls_data_value)
			If isnumber(ls_data_value) Then
				ls_data_value = string(Round( double(ls_data_value), 0 ),"$##,###.00")
			end if
			//end of add
			//comment 06/22/2007 by: Andy
			//ls_data_value = string(double(ls_data_value),"$##,###.00")
		End If
	//end of add
	End If			
	//---------------------------- APPEON END ----------------------------
	*/
	
	//$<add> 05.29.2007 By: Jack
	//$<reason> Fix a defect.
	If ls_lu_field = 'contact_department' or ls_lu_field = 'contact_title' or ls_lu_field = 'contact_type' Then
		//modify 09/05/2007 by: Andy Reason:get description
		//ls_data_value = gnv_data.of_getitem('code_lookup', 'code', "lookup_code = " + ls_data_value)
		ls_data_value = gnv_data.of_getitem('code_lookup', 'description', "lookup_code = " + ls_data_value)
	End If

	//*****GET EXPORT CODES
	//if lds_export_flds.GetItemnumber( p, "export_code" )  = 1 then //get export code if required
	if ll_export_code  = 1 then //get export code if required
		ls_lookup_val = ls_data_value    //lds_export_data.getitemstring(i,p) //changed 100102
		if isnull(ls_lookup_val) then ls_lookup_val = ''
		//ll_find = lds_export_equiv_code.Find( "export_id = " + String(ai_export_id) + " and (lookup_code = " + ls_lookup_val , 1, ll_rowcount2 )
		ll_find = lds_export_equiv_code.Find( "export_id = " + String(ai_export_id) + " and (lookup_code = " + ls_lookup_val + " or code = '" + ls_lookup_val + "')", 1, ll_rowcount2 ) //Add code -- jervis 12.10.2010
		If ll_find > 0 Then
			ls_value = lds_export_equiv_code.GetItemString(ll_find,'equiv_code')
		End If
		
		if not isnull(ls_value) and trim(ls_value) <> '' then ls_data_value = ls_value //if no export code use org value
		if isnull(ls_data_value) then ls_data_value = ""
	end if				
			
	//****Dept Chair data  maha 010704
	ls_dc_field = ls_dcfieldList[ll_FieldSeqID]	
	if ls_dc_field = 'none' or isnull(ls_dc_field) then 
		//skip
	else  //if set to a field name get the data
		If IsNumber(ls_data_value) Then
			
			ll_find = lds_dept_chair.Find("facility_id = " +  String(li_facil_id) + " and department_code = " + "'" + ls_data_value + "'",1,ll_rowcount)
			If ll_find > 0 Then
				ls_data_value = lds_dept_chair.GetItemString(ll_find,ls_dc_field)
			Else
				ls_data_value = ""
			End If
		End If
	end if
	//Active Status format for affil stat maha 083105
	ll_intcred_field = ll_intcredfieldList[ll_FieldSeqID]
	if ll_intcred_field = 100000 then
		If li_act_format = 1 Then
			If ls_data_value = "1" Then
				ls_data_value = "Y"
			Else
				ls_data_value = "N"
			End If
		ElseIf li_act_format = 2 Then
			Choose Case ls_data_value
				Case "1"
					ls_data_value = "Active"
				Case "2"
					ls_data_value = "Purge"
				Case "3"
					ls_data_value = "Inactive"
				Case "4"
					ls_data_value = "Pending"
				Case "0"
					ls_data_value = "History"
			End Choose
		End If
	end if
	
	//<add> 08/22/2007 by: Andy
	if ls_strip_char <> "NONE" then
		ls_data_value = of_strip_char( ls_strip_char ,ls_data_value, "")
	end if
	
	//*** substring function***************************8
	//create datafield for substring_start
	//<add> 08/21/2007 by: Andy
	if li_sub_start > 1 then ls_data_value = mid(ls_data_value,li_sub_start,li_width)
	//end of add
	//***padding //note if avoid using return, double return, empty string or tab when padding
	ls_data_value = mid(ls_data_value,1,li_width) //shrink the length to size 
	if ls_field_format = "Leading Padding" or ls_field_format = "Trailing Padding" then 
		if li_width - len(ls_data_value) > 0 then
			li_dif = li_width - len(ls_data_value)
			ls_pad = "" //reset
			ls_pad = Fill ( ls_fld_delim, li_dif )
			if ls_field_format = "Leading Padding" then
				ls_data_value = ls_pad + ls_data_value 
			else
				ls_data_value = ls_data_value + ls_pad
			end if
		end if
	elseif ls_field_format = "use text" then //allows a set value if data is found
		if len(ls_data_value) > 0 then
			ls_data_value = ls_text
		end if
	end if	

	//****set default moved here 091305
	if ud > 0 then
		if isnull(ls_data_value) then ls_data_value = ""
		
		if ls_data_value = "" then
			if ud = 1 then
				ls_data_value = ls_def_val
			elseif ud = 2 then //if set to column get the value out of that column
				if col < 1 or col > li_fld_cnt then //setting trap
					messagebox("Invalid setting","You are using a column default for column " + ls_export_field + " , but your default value is not a valid column number.~rThe default column number must be less than this column.")
					close(w_export_progress)
					//<add> 08/24/2007 by: Andy
					if lb_ASA7 then
						ls_Mysql = "DROP TABLE " + ls_tabletemp + ";"
						EXECUTE IMMEDIATE :ls_Mysql;
					end if
					//<add> andy 07/17/2007
					Destroy lds_export_flds
					Destroy lds_export_hdr
					Destroy lds_address_lookup
					Destroy lds_code_lookup
					Destroy lds_dept_chair
					Destroy lds_export_equiv_code
					Destroy lds_dataobject
					Destroy lds_linkto
					Destroy lds_field
					Destroy lds_export_dataTemp
					Destroy lds_tablepk
					Destroy lds_export_data
					//end of add
					return 0
				end if
				ls_data_value = lds_export_data.getitemstring(ll_R,col)
			end if
		end if
	end if
	
	//*********value set**********	
	if li_fld_cnt = 1 then ls_data_value = ls_data_value + Char(9)	
	if lower(lds_export_data.describe(ls_export_field + ".name")) = lower(ls_export_field) then
		lds_export_data.setitem(ll_R,ls_export_field,ls_data_value)
	end if
	
	//processing the next field(fieldseqid)
	ll_i = ll_j + 1	
LOOP 

//<add> 08/27/2007 by: Andy process default value
if of_export_processdefault(lds_export_hdr,lds_export_flds,lds_export_datatemp,lds_export_data) = -1 then 
	close(w_export_progress)
	if lb_ASA7 then
		ls_Mysql = "DROP TABLE " + ls_tabletemp + ";"
		EXECUTE IMMEDIATE :ls_Mysql;
	end if
	Destroy lds_export_flds
	Destroy lds_export_hdr
	Destroy lds_address_lookup
	Destroy lds_code_lookup
	Destroy lds_dept_chair
	Destroy lds_export_equiv_code
	Destroy lds_dataobject
	Destroy lds_linkto
	Destroy lds_field
	Destroy lds_export_dataTemp
	Destroy lds_tablepk
	Destroy lds_export_data
	return 0	
end if
//end of add

//<add> andy 2007.05.25
//set Calculated field value and format into lds_export_data 
//with the relative computer column in lds_export_dataTemp
//Modify 08/22/2007 by: Andy
of_export_calculatedfield(lds_export_dataTemp,lds_export_data,ls_format)
//end of add

w_export_progress.hpb_bar.position = 94

//Modify 07/18/2007 by: Andy
//if ai_save_data = 1 then //maha 021003
//1:save / 3:save & preview
if ai_save_data = 1 or ai_save_data = 3 then
//end of modify
	w_export_progress.st_progress.Text = "Saving File"
	
	//gnv_appeondb.of_autocommit()
	sd = lds_export_data.Update()
	Commit Using SQLCA;
	
	If sd < 1 Then
		MessageBox("Save error","Unable to save data to table")
	End If

End If
w_export_progress.st_progress.Text = "Creating File"
w_export_progress.hpb_bar.position = 100
li_bar_ticks = 75 / li_prac_id_cnt
n = int(li_fld_cnt/80) + 1
//******************************* CREATE FILE

//Modify 08/28/2007 by: Andy
//If IsNull(as_path) Or as_path = "" Then
//	If IsNull(ls_save_path) Or ls_save_path = "" Then ls_save_path = gs_dir_path + gs_DefDirName + "\" + ls_table_name
//Else
ls_save_path = as_path
if right(ls_save_path,1) = ':' then ls_save_path = ls_save_path + "\"
ll_lastpos = LastPos(ls_save_path,'.') 
if ll_lastpos > 0 then
	ls_save_path = Left(ls_save_path,ll_lastpos - 1)
end if
//End If

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 05.23.2007 By: Jack
//$<reason> If the directory is not exists Then create it 
string ls_path1
If Mid(ls_save_path,Len(ls_save_path),1) = "\" Then
	ls_path1 = ls_save_path
Else
	ls_path1 = mid(ls_save_path,1,lastpos(ls_save_path,'\'))
End If
//Add By Jervis 11-19-2008
if ls_path1 = "" then
	IF AppeonGetClientType() = 'WEB' THEN
		ls_path1 = gs_dir_path + gs_DefDirName + "\ExportData\"
		ls_save_path = ls_path1 + ls_save_path
	else
		ls_path1 = Gs_Current_Directory + "\ExportData\"
		ls_save_path = ls_path1 + ls_save_path
	end if
Else
	//Added By Ken.Guo 2011-01-11.
	If invo_rights.of_check_dir_right(ls_path1) <> 1 Then
		ls_path1 = gs_dir_path + gs_DefDirName + "\ExportData\"
		ls_save_path = ls_path1
	End If
end if
//End By Jervis 
gnv_appeondll.of_parsepath(ls_path1)

//---------------------------- APPEON END ----------------------------

If Mid(ls_save_path,Len(ls_save_path),1) <> "\" Then //maha app 102405 if a file name is indicated do not tack on the table name
	ls_path = ls_save_path +  ls_format
Else
	//ls_path = ls_save_path + ls_table_name + ls_format
	if li_custom_save > 0 then  //maha new 121205 for custom naming of file
		ls_save_name = of_custom_name(li_custom_save,ls_table_name,ldt_date)
	else
		ls_save_name = ls_table_name
	end if
	ls_path = ls_save_path + ls_save_name + ls_format
End If

//<add> 08/28/2007 by: Andy 
as_path = ls_path
//end of add

//$<modify> 03.20.2008 by Andy
//If ls_format <> "export" Then  //if the auto export path is blank use the export path, if blank use the hard coded path
if lb_export = false then
//end of modify 03.20.2008

	gnv_rights.of_check_dir_right( ls_path, true, 'Export')
	Choose Case ls_format
		Case ".txt"
			If ls_header = "1" Then
				g = lds_export_data.SaveAs(ls_path,Text!,True)
			Else
				g = lds_export_data.SaveAs(ls_path,Text!,False)
			End If
		Case ".xls"
			If ls_header = "1" Then
				g = lds_export_data.SaveAs(ls_path,excel!,True)
			Else
				g = lds_export_data.SaveAs(ls_path,excel!,False)
			End If
		case ".csv"
			if ls_header = "1" then 
				g = lds_export_data.saveas(ls_path,csv!,true)
			else
				g = lds_export_data.saveas(ls_path,csv!,false)
			end if
	End Choose
	If g = -1 Then MessageBox("saveas -1","Unable to save file.  Check path (" + ls_path + ") and make sure a copy of the file is not open.")
Else
	//build export text file
	//modify 08/28/2007 by: Andy
	//li_file_num = FileOpen(as_path + ls_table_name + ".txt", lineMode!, Write!, LockWrite!, Replace!)//maha changed to line mode 091002
	li_file_num = FileOpen(ls_path, lineMode!, Write!, LockWrite!, Replace!)//maha changed to line mode 091002
	//end of modify
	w_export_progress.hpb_bar.position = 10
	For i = 1 To li_prac_id_cnt
		//w_export_progress.hpb_bar.position = w_export_progress.hpb_bar.position + li_bar_ticks
		if mod(i,n) = 0 then
			w_export_progress.hpb_bar.position = w_export_progress.hpb_bar.position + 1
		end if
		For p = 1 To li_fld_cnt
			ls_data_value = lds_export_data.GetItemString(i,p)
			ls_fld_delim = lds_export_flds.GetItemString( p, "trailing_leading_characters")
			ls_field_format = lds_export_flds.GetItemString(p,"export_format")
			Choose Case ls_fld_delim
				Case "E" //empty String
					ls_delim_value = ""
				Case "S" // space
					ls_delim_value = " "
				Case "T" //tab
					ls_delim_value = "	"
				Case "R" //return
					ls_delim_value = "~r"
				Case "D" //return
					ls_delim_value = "~r~r"
				Case Else
					ls_delim_value = ls_fld_delim
			End Choose
			If IsNull(ls_delim_value) Then ls_delim_value = ""
			If ls_field_format = "Leading Padding" Or ls_field_format = "Trailing Padding" Then //don't add delimit value
				ls_export_text_file = ls_export_text_file + ls_data_value
			Else
				ls_export_text_file = ls_export_text_file + ls_data_value + ls_delim_value
			End If
			
		Next
		ls_export_text_file = ls_export_text_file + ls_rec_delim
		p = 1
		FileWrite ( li_file_num, ls_export_text_file)
		ls_export_text_file = ""
	Next
	FileClose(li_file_num)
End If
//--------------------------- APPEON BEGIN ---------------------------
//$<add> 05.11.2007 By: Jack
//$<reason> Fix a defect.
ids_export_data = lds_export_data
//---------------------------- APPEON END ----------------------------

if is_called_type <> "2" and isvalid(w_export_progress) then
	w_export_progress.hpb_bar.position = 100
	Close(w_export_progress)
end if

//<add> 07/18/2007 by: Andy
//2:preview / 3:save & rpeview
if ai_save_data = 2 or ai_save_data = 3 then
	lstr_pass.s_string = is_select_syntax
	lstr_pass.s_ds = lds_export_data
	lstr_pass.s_string_array[1] = ls_UnionSQL
	openwithparm( w_export_previewdata, lstr_pass )
end if
//end of add

//<add> 08/24/2007 by: Andy
if lb_ASA7 then
	ls_Mysql = "DROP TABLE " + ls_tabletemp + ";"
	EXECUTE IMMEDIATE :ls_Mysql;
end if

//$<add> 05.07.2008 by Andy
if lb_mulsel then
	ls_Mysql = "DELETE FROM export_temp WHERE SpID = " + String(ll_spid) + ";"
	EXECUTE IMMEDIATE :ls_Mysql;
end if

Destroy lds_export_flds; Destroy lds_export_hdr; Destroy lds_address_lookup; Destroy lds_code_lookup
//Destroy lds_export_data; //Comment by Jack 05.11.2007
Destroy lds_dept_chair; Destroy lds_export_equiv_code; Destroy lds_dataobject
Destroy lds_linkto;

//<add> andy 2007.05.25
Destroy lds_field
Destroy lds_export_dataTemp
Destroy lds_tablepk
//end of add

Return 1
end function

public function integer of_export_data_with_text_ctx (integer ai_export_id, long al_ctx_ids[], ref string as_path, integer ai_save_data, string as_param1, string as_param2, string as_param3, integer ai_type, string as_sql);//Commented By Mark Lee 09/29/2013 overwrite
////////////////////////////////////////////////////////////////////////
//// $<function>pfc_n_cst_ai_export_apb/of_export_data_with_text_ctx()
//// $<arguments>
////		value	integer	ai_export_id 		
////		value	long   	al_ctx_ids[]		
////		value	string 	as_path      		 
////    value integer  ai_save_data (0:Nothing / 1:save / 2:preview / 3:save & preview)
////		value	string 	as_param1    		
////		value	string 	as_param2    		
////		value	string 	as_param3
////    value integer  ai_type      (1: specify SQL/2: specify array/3: between...and)
////    value string   as_sql       (the specified SQL)
//// $<returns> integer
//// $<description> Used for export Contract Logix data.
//// $<description>
////////////////////////////////////////////////////////////////////////
//// $<add> 2006-11-28 by Rodger Wu (doc painter)
////////////////////////////////////////////////////////////////////////
//
////<optimization> by Andy 07/12/2007
//SetPointer( HourGlass! )
//ib_writefile = false //added by gavins 20121011
//If IsNull(as_path) Or as_path = "" Then
//	MessageBox("Data Error", "There is no save path for this file. Unable to continue this function.")
//	Return 0
//End If
//
//If ai_export_id < 1 Then
//	//MessageBox("User Error", "No export selected.  Unable to continue this function.")
//	MessageBox("User Error", "No export selected.  Unable to proceed.")
//	Return 0
//End If
//
//Open(w_export_progress)
////Start code changes 2.6.2007 Henry
//If is_called_type = '1' Then
//	w_export_progress.Title = 'Merge Data Process'
//	is_called_type = '0'
//ElseIf is_called_type = '2' Then // Rodger wu Added.
//	w_export_progress.Title = 'Merge Data Process'
//	w_export_progress.st_6.Text = "Progress of building data"
//	
//	w_export_progress.st_merge.Visible = True
//	w_export_progress.hpb_1.Visible = True
//	//	w_export_progress.height = 1100
//End If
////End code change 2.6.2007
//
//w_export_progress.st_progress.Text = "Creating export table"
//
//If of_create_export_table( ai_export_id,ai_save_data ) < 0 Then
//	gnv_debug.of_output(true, 'Alarm Replace Export:of_create_export_table<0' + ' ai_export_id=' + string( ai_export_id ) + ' ai_save_data=' + string( ai_save_data ) )//added by gavins 20120912
//	Close(w_export_progress)
//	Return 0
//End If
//
////Boolean lb_table_found
////Long ll_fld_val
//Long   li_prac_id_cnt,  g, w, sd, i,n,p
//
//Long ll_find_no,  ll_rowcount2, ll_find,li_rec_no, li_file_num,li_fld_cnt,li_act_format
//Long li_fld_len, li_use_link, li_recd_no, li_width, f, li_dif,  li_save_data = 0, ud, col
//DateTime ldt_date, ldt_value //maha
//String ls_lookup_type, ls_db_lookup_type, ls_lookup_code ,ls_pad, ls_fixed_width//ls_trail_val, ls_trail_record, 
//String Errors, ls_export_record, ls_export_field, ls_fld_type, ls_fld_delim//ls_hdr_val, ls_hdr_record, 
//String ls_fld_val, ls_lead_trail_char, ls_format, ls_table_name//, ls_table_new, ls_table_names[]
//String ls_sql_syntax, ls_field_name, ls_grey, ls_presentation_str, ls_dwsyntax_str, ls_value, ls_data_value
//String ls_field_format, ls_sql, ls_save_format, ls_path //ls_month, ls_year, ls_day, ls_hour, ls_minute, 
//Long li_exp_type
//String ls_header, ls_filter, ls_lookup, ls_datatype, ls_prac_ids = "", ls_select_field, ls_prac_field
//String ls_select_table_trim, ls_select_table, ls_sny_retrieve, ls_find, ls_delim_value, ls_rec_delim, ls_lu_field
//String  ls_export_text_file = "", ls_lookup_val, ls_save_path, stax, s //maha
//String ls_aggre, ls_sort, ls_dc_field,  ls_text, ls_def_val
//Long ll_prac_row, ll_ret_cnt
//n_ds lds_export_hdr, lds_export_flds, lds_export_retrieve, lds_export_data, lds_code_lookup, lds_address_lookup
//n_ds lds_dataobject , lds_export_equiv_code
//String ls_tempstr, ls_dddwdata, ls_dddwtable, ls_select_field_ctx, ls_dddw_column_dbname //ls_dataobject, 
//datawindowchild ldwc_dddw
//String ls_linkfromcol, ls_linktotable, ls_linktocol
//datastore lds_linkto
//string ls_ic_link_area
//long ll_ctx_link_scrn_id
//string ls_datatype_ctx
//string ls_dddwname
//
////<add> andy 07/12/2007
//n_ds      lds_field,lds_export_dataTemp
//String    ls_ComputerDataType,ls_Expresstion,ls_Field,ls_FieldDataType,ls_Modify,ls_Err,ls_tag
//n_cst_string lnvo_string
//Long      ll_Cnt,ll_Num,ll_Tab,ll_Start = 1,ll_pos1,ll_pos2,ll_pos3,ll_SpID
//String ls_Objects,ls_objname,ls_ObjType,ls_ColType,ls_OrderBy,ls_UnionSQL = "",ls_SqlSelect,ls_flddelimList[]
//Boolean lb_flagpk,lb_true = False,lb_mulsel = False //lb_flag = true,
//Long    ll_FieldSeqID = 0,ll_FieldCnt,ll_export_code,ll_equivcode,ll_pracid,ll_LastPos
//Long ll_FieldSeqIDold = -1,ll_R = 0,ll_i = 1,ll_j,ll_k,ll_n,ll_pkcnt,ll_Rcnt,li_sub_start,li_custom_save
//String  ls_tablelist[],ls_fieldlist[],ls_selectfieldlist[],ls_formatList[]
//Long li_recdnoList[],ll_exportcodeList[],li_substartList[],li_widthList[],ll_ctx_scrn_id
//Long li_udList[],ll_pos,li_act_formatList[],li_bar_ticks,li_widthtemp,ll_maxwidth,ll_len
//String  ls_defvalList[],ls_textList[],ls_prac_sql,ls_ic_area,ls_lu_fieldList[]
//str_pass lstr_pass
////<add> 08/08/2007 by: Andy
//String ls_prac_sql_temp,ls_Sortsel,ls_prac_sql_temp2,ls_top = "top 2147483647",ls_usetable = ""
////<add> 08/16/2007 by: Andy
//datastore lds_tablepk
//String  ls_tablepks[],ls_table[],ls_tablepk,ls_sortpk[],ls_save_name,ls_strip_char,ls_dbtype
//String  ls_RowNo = "",ls_RowNoSyn = "",ls_tabletemp,ls_synprefix = "",ls_MySQL
////end of add
//Boolean lb_export // Andy 03202008
////Start add by jervis 
//Boolean lb_get_parent
//string ls_syn_parent
//string ls_select_table_on
//string ls_lu_codename
//string ls_field_value
//string ls_other_where
//string ls_ctx_table
//string ls_link_table
//string ls_link_table_on
//string ls_no_link_on
////End by jervis
//
//ldt_date = DateTime(Today(),Now()) //maha
////<add> 08/23/2007 by: Andy
//ls_dbtype = of_get_dbtype()
//If Upper(ls_dbtype) = 'SQL2005' Or Upper(ls_dbtype) = 'ASA9' Then
//	ls_RowNo = ",Row_No"
//	lb_true = True
//End If
//
//ls_synprefix = "select ctx_id,FieldSeqID,field_value,field_data_type" + ls_RowNo + " from ("
//
//
//
//
////<add> 08/14/2007 by: Andy 
////Reason: Bubble sort the al_ctx_ids array.
//If ai_type = 2 Then
//	of_bubblesort(al_ctx_ids)
//End If
//
//
//li_prac_id_cnt = UpperBound( al_ctx_ids[] )
//
////<add> 08/16/2007 by: Andy
//lds_tablepk = Create datastore
//If Left(Upper(ls_dbtype),3) = 'ASA' Then
//	lds_tablepk.DataObject = "d_export_tablepk_asa_ctx"
//	ls_top = ""
//Else
//	lds_tablepk.DataObject = "d_export_tablepk_sql_ctx"
//End If
//lds_tablepk.SetTransObject( SQLCA )
////end of add
//
//
////<add> andy 2007.05.25
//lds_field = Create n_ds
//lds_field.DataObject = "d_export_fields"
//lds_field.of_SetTransObject( SQLCA )
//
//lds_code_lookup = Create n_ds
//lds_code_lookup.DataObject = "d_code_lookup"
//lds_code_lookup.of_SetTransObject( SQLCA )
//
//lds_address_lookup = Create n_ds
//lds_address_lookup.DataObject = "d_address_lookup"
//lds_address_lookup.of_SetTransObject( SQLCA )
//
//lds_export_hdr = Create n_ds
//lds_export_hdr.DataObject = "d_export_hdr"
//lds_export_hdr.of_SetTransObject( SQLCA )
//
//lds_export_flds = Create n_ds
//lds_export_flds.DataObject = "d_export_flds_list_exp_ctx"
//lds_export_flds.of_SetTransObject( SQLCA )
//
//lds_export_equiv_code = Create n_ds
//lds_export_equiv_code.DataObject = "d_export_equiv_code_lds"
//lds_export_equiv_code.of_SetTransObject( SQLCA )
//
//
//lds_export_retrieve = Create n_ds
//lds_dataobject = Create n_ds
//lds_linkto = Create datastore
//
//gnv_appeondb.of_startqueue( )
//
//
//lds_export_flds.Retrieve( ai_export_id )
////lds_export_equiv_code.Retrieve()
//lds_export_equiv_code.Retrieve(ai_export_id)  //Jervis 12.10.2010
//lds_export_hdr.Retrieve( ai_export_id )
//lds_field.Retrieve( ai_export_id )
//
//gnv_appeondb.of_commitqueue( )
//
//ll_rowcount2 = lds_export_equiv_code.RowCount()
//
////HEADER INFO
//ls_table_name = lds_export_hdr.GetItemString(1,"export_name")
//ls_header = lds_export_hdr.GetItemString(1,"field_labels_as_header") //Y or N
//ls_format = lds_export_hdr.GetItemString(1,"export_format")
//
////add 08/22/2007 by: Andy
//ls_strip_char = lds_export_hdr.GetItemString(1,"strip_char")
//If IsNull(ls_strip_char) Or Len(ls_strip_char) < 1 Then ls_strip_char = "NONE"
//If ls_format = ".csv" Then ls_strip_char = ","
////end of add
//
////<add> 08/21/2007 by: Andy
//li_custom_save = lds_export_hdr.GetItemNumber(1,"custom_save_name")
//If IsNull(li_custom_save) Then li_custom_save = 0
////end of add
//
////-----------Begin Modified by alfee 05.25.2007-----------------------
////<$Reason>If merging data in document manager, agreement template or for email template,
////<$Reason>Then always use text with header format. It's also for performance tunning.
////If is_called_type = "2" Or is_called_type = '3' Then 
//If is_called_type = "2" Or is_called_type = '3' Or is_called_type = '4' Then //08.29.2007 Byy Jervis
//	ls_format = ".txt"
//	ls_header = '1'
//End If
//
////$<modify> 03/20/2008 by: Andy
//If ls_format = "export"  Then
//	lb_export = True
//	ls_format = ".txt"
//Else //txt and xls files  files
//	lb_export = False
//End If
//
////-----------End Modified ---------------------------------------------
//
//If ls_format = ".csv" Then
//	If Upper( appeongetclienttype() ) = "WEB" Then
//		MessageBox( "IntelliSoft", "The file type of CSV is unsupported on WEB.~r~nPlease go to Export painter to modify settings." )
//		gnv_debug.of_output(true, 'Alarm  Export:' +"The file type of CSV is unsupported on WEB.~r~nPlease go to Export painter to modify settings." ) //added by gaivns 20120912
//		Close(w_export_progress)
//		//<add> andy 07/17/2007
//		Destroy lds_export_flds
//		Destroy lds_export_hdr
//		Destroy lds_address_lookup
//		Destroy lds_code_lookup
//		Destroy lds_export_equiv_code
//		Destroy lds_dataobject
//		Destroy lds_linkto
//		Destroy lds_field
//		Destroy lds_tablepk
//		//Destroy lds_export_dataTemp
//		//end of add
//		Return -1
//	End If
//End If
//
//li_exp_type = lds_export_hdr.GetItemNumber(1,"export_type")
//ls_rec_delim = lds_export_hdr.GetItemString(1,"record_delimiter")
//ls_save_path = lds_export_hdr.GetItemString(1,"save_path")
//
////$<add> 05.07.2008 by Andy
//Select Top 1 @@spid Into :ll_SpID From ids;
//
////Modify 08/08/2007 by: Andy
////specify SQL
//If ai_type = 1 Then
//	ls_prac_sql  = Trim(as_sql) //trim(lds_export_hdr.getitemstring(1,"prac_sql"))
//	If IsNull(ls_prac_sql) Then ls_prac_sql = ''
//	If ls_prac_sql <> '' Then
//		ll_pos = Pos(ls_prac_sql,";")
//		If ll_pos > 0 Then
//			ls_prac_sql  = Replace(ls_prac_sql,ll_pos,1,'')
//		End If
//		ll_len = Len(ls_prac_sql)
//		ls_prac_sql_temp = Trim(Mid(ls_prac_sql,7,ll_len))
//		If Lower(Left(ls_prac_sql_temp,8)) = 'distinct' Then
//			ls_prac_sql_temp2 = Trim(Mid(ls_prac_sql_temp,9,ll_len))
//			If Lower(Left(ls_prac_sql_temp2,3)) <> 'top' Then
//				//modify 08/14/2007 by: Andy
//				//ls_prac_sql = 'select distinct top 2147483647 ' + ls_prac_sql_temp2
//				ls_prac_sql = 'select distinct ' + ls_top + ' ' + ls_prac_sql_temp2
//			End If
//		ElseIf Lower(Left(ls_prac_sql_temp,3)) <> 'top' Then
//			//modify 08/14/2007 by: Andy
//			//ls_prac_sql = 'select top 2147483647 ' + ls_prac_sql_temp
//			ls_prac_sql = 'select ' + ls_top + ' ' + ls_prac_sql_temp
//		End If
//		
//		//$<add> 05.06.2008 by Andy
//		//del order by statement. Reason:if ORDER BY items isn't in the select list,then it will get error.
//		//ORDER BY items must appear in the select list if the statement contains a UNION operator.
//		ll_pos = Pos(Lower(ls_prac_sql)," order ")
//		If ll_pos > 0 Then
//			ls_prac_sql = Left(ls_prac_sql,ll_pos - 1)
//		End If
//		//if select more than one field,then add a select statement outside the ls_prac_sql and
//		//INSERT the result INTO a table.
//		ll_pos = Pos(Lower(ls_prac_sql)," from ")
//		ls_prac_sql_temp = Left(ls_prac_sql,ll_pos - 1)
//		ll_pos = Pos(ls_prac_sql,",")
//		If ll_pos > 0 Then
//			lb_mulsel = True
//			ls_prac_sql = "select distinct ctx_id," + String(ll_SpID) + " from (" + ls_prac_sql + ") cc order by ctx_id"
//			Select Top 1 1 Into :ll_Cnt From sysobjects Where Name = 'export_temp' And Type = 'U';
//			If ll_Cnt = 1 Then
//				ls_MySQL = "DELETE FROM export_temp WHERE SpID = " + String(ll_SpID) + ";"
//			Else
//				ls_MySQL = "CREATE TABLE export_temp (prac_id int null,SpID int null)"
//			End If
//			Execute Immediate :ls_MySQL;
//			ls_MySQL = "INSERT INTO export_temp " + ls_prac_sql + ";"
//			Execute Immediate :ls_MySQL;
//			ls_prac_sql = "select distinct prac_id as ctx_id from export_temp where SpID = " + String(ll_SpID)
//		End If
//		//end add 05.06.2008
//	End If
//End If
////end of modify
//
////set record delimiter
//Choose Case ls_rec_delim
//	Case "C"
//		ls_rec_delim = ","
//	Case "R"
//		ls_rec_delim = "~r"
//	Case "T"
//		ls_rec_delim = "	"
//	Case "D"
//		ls_rec_delim = "~r~r"
//	Case "U"
//	Case Else
//		ls_rec_delim = ""
//End Choose
//If IsNull(ls_rec_delim) Then ls_rec_delim = ""
//
//li_fld_cnt = lds_export_flds.RowCount()
////<add> 08/24/2007 by: Andy
//ll_maxwidth = Long(lds_export_flds.Describe("evaluate('max(export_field_length)',0)"))
//If ll_maxwidth < 30 Then ll_maxwidth = 30
//
////CREATE SYNTAX FOR export DW
////ls_sql_syntax = "Select * from exp_" + Lower(ls_table_new)
//ls_sql_syntax = is_select_syntax
////modify 08/15/2007 by: Andy
//ls_presentation_str = "style(type=grid)"
//
//ls_dwsyntax_str = SQLCA.SyntaxFromSQL(ls_sql_syntax, ls_presentation_str, Errors)
//If Len(Errors) > 0 Then //this will fail if the table has not been completed
//	If Pos(Errors,"Table or view not found",1) > 0 Then
//		MessageBox ("Error in of_export_data_with_text","Export data data store not able to be created.~rCheck to make sure no export fields have any spaces, and that all have a width.  You cannot have duplicate field names, and fields cannot start with a number." )
//		Close(w_export_progress)
//		//<add> andy 07/17/2007
//		Destroy lds_export_flds
//		Destroy lds_export_hdr
//		Destroy lds_address_lookup
//		Destroy lds_code_lookup
//		Destroy lds_export_equiv_code
//		Destroy lds_dataobject
//		Destroy lds_linkto
//		Destroy lds_field
//		Destroy lds_tablepk
//		//Destroy lds_export_dataTemp
//		//end of add
//		Return -1
//		
//	Else
//		MessageBox("Caution", &
//			"SyntaxFromSQL caused these errors: " + Errors)
//		gnv_debug.of_output(true, 'Caution:' + " SyntaxFromSQL caused these errors: " + Errors)		//Added By Mark Lee 02/01/2013
//		Close(w_export_progress)
//		//<add> andy 07/17/2007
//		Destroy lds_export_flds
//		Destroy lds_export_hdr
//		Destroy lds_address_lookup
//		Destroy lds_code_lookup
//		Destroy lds_export_equiv_code
//		Destroy lds_dataobject
//		Destroy lds_linkto
//		Destroy lds_field
//		Destroy lds_tablepk
//		//Destroy lds_export_dataTemp
//		//end of add
//		Return -1
//	End If
//	gnv_debug.of_output(true, 'Alarm  Export:SyntaxFromSQL errors:' +  Errors ) //added by gaivns 20120912
//End If
//lds_export_data = Create n_ds
//lds_export_data.Create( ls_dwsyntax_str, Errors)
//If len( errors ) > 0 Then
//	gnv_debug.of_output(true, 'Alarm  Export:lds_export_data create errors:' +  Errors ) //added by gaivns 20120912	
//End If
//lds_export_data.SetTransObject( SQLCA )
//
////<add> andy 2007.05.25 
////save the original data that it's not format,in order to deal with the computer fields
//lds_export_dataTemp = Create n_ds
//lds_export_dataTemp.Create( ls_dwsyntax_str, Errors )
//lds_export_dataTemp.SetTransObject( SQLCA )
////end of add
//
////w_export_progress.r_bar.Width = 300
//w_export_progress.hpb_bar.Position = 10
//
//w_export_progress.st_progress.Text = "Populating Data for " + String(li_prac_id_cnt) + " Contract(s)"
//
////li_bar_ticks = 80 / li_fld_cnt
//
////creates string of prac_ids for querys
////between...and...
//If ai_type = 3 Then
//	//if ls_prac_sql = '' then
//	If li_prac_id_cnt > 0 Then
//		ls_prac_ids = "between " + String(al_ctx_ids[1]) + " and " + String(al_ctx_ids[li_prac_id_cnt])
//	End If
//	//end if
//End If
//
////$<modify> 05.05.2008 by Andy
////create rows for all practitioner data
//For i = 1 To li_prac_id_cnt
//	//specify array
//	If ai_type = 2 Then
//		ls_prac_ids = ls_prac_ids + String( al_ctx_ids[i] ) + ","
//	End If
//	g = lds_export_data.InsertRow(0)
//Next
//If ai_type = 2 Then
//	ls_prac_ids = Left( ls_prac_ids, Len( ls_prac_ids ) -1 ) //remove last comma
//End If
//
////Added By Ken.Guo 2011-07-21. 
//Boolean lb_usingdb = False
//String ls_client_id
//Long ll_arr_temp[]
//n_cst_string lnv_string
////ll_arr_temp[] = al_ctx_ids[]
//If li_prac_id_cnt >= 100 Then
//	lb_usingdb = True
//	//lnv_string.of_delete_duplicate(ll_arr_temp[])
//	If inv_arr_db.of_array_to_db( al_ctx_ids[],ls_client_id ) < 0 Then
//		is_client_id[UpperBound(is_client_id[]) + 1 ] = ls_client_id
//		if isvalid(w_export_progress) then close(w_export_progress)
//		of_cleanup_ds( )	
//		lb_usingdb = False
//		gnv_debug.of_output( True, 'Export data with text error, Failed to insert array to DB.')
//		Messagebox('Export Error','Failed to insert array data to DB.')
//	End If
//End If
//
////if ai_save_data = 1 or ai_save_data = 3 then
//If ai_save_data = 1 Or ai_save_data = 3  Or ib_gen_rec_id Then //for Date Alarm - Alfee 06.11.2008
//	lds_export_data.Object.rec_id.Primary[] = al_ctx_ids[]
//End If
//lds_export_data.RowsCopy( 1, lds_export_data.RowCount(), Primary!, lds_export_dataTemp, 1, Primary! )
////end modify 05.05.2008
//
//
//
////w_export_progress.r_bar.Width = w_export_progress.r_bar.Width + 50
//w_export_progress.hpb_bar.Position = 11
//w_export_progress.st_export.Text = "Form SQL Statement"
//
////Modify 08/22/2007 by: Andy
////n = int(li_prac_id_cnt/80) + 1
//n = Int(li_fld_cnt/80) + 1
////end of modify
//
//
//For p = 1 To li_fld_cnt
//	lds_dataobject.DataObject = lds_export_flds.GetItemString( p, "export_fields_ctx_scrn_dataobject" )
//	
//	li_width = lds_export_flds.GetItemNumber(p,"export_field_length")
//	ls_field_format = lds_export_flds.GetItemString(p,"export_format")
//	ls_data_value = ""
//	ls_value = ""
//	ls_lookup_val = ""
//	//ls_dc_field = "none"
//	//<add> 08/21/2007 by: Andy
//	li_sub_start =  0
//	//end of add
//	ls_dddwtable = ""
//	
//	lb_get_parent = false
//	ls_syn_parent = ""
//	ls_select_table_on = ""
//	ls_lu_codename = ""
//	ls_field_value = ""
//	ls_other_where = ""
//	ls_no_link_on = ""
//
//	ud = lds_export_flds.GetItemNumber( p, "use_default" )
//	If ud = 1 Or ud = 2 Then
//		ls_def_val = lds_export_flds.GetItemString( p, "default_value" )
//	Else
//		ls_def_val = ""
//	End If
//	
//	//Get Parent Level Data
//	if lds_export_flds.GetItemString( p,"record_level") = 'P' then lb_get_parent = true
//	
//	if lb_get_parent then
//		ls_syn_parent = "ctx_basic_info table_1 left join ctx_basic_info table_2 on (table_1.master_contract_id = table_2.ctx_id ) left join "
//	end if
//	
//	//Add by jervis -- 01.18.2010
//	//Leading Padding or Trailing Padding Process
//	ls_fld_delim = lds_export_flds.GetItemString( p, "trailing_leading_characters")
//	Choose Case ls_fld_delim
//		Case "R" //return
//			ls_fld_delim = "~r"
//		Case "T" //tab
//			ls_fld_delim = "	"
//		Case "D" //double return
//			ls_fld_delim = "~r~r"
//		Case "S" // space
//			ls_fld_delim = " "
//		Case "E" //empty string
//			ls_fld_delim = ""
//	End Choose
//	
//	//hard coded text
//	If lds_export_flds.GetItemNumber(p,"export_type") = 2 Then //set data for text fields
//		ls_select_field = lds_export_flds.GetItemString(p,"export_field_name")
//		ls_value = lds_export_flds.GetItemString(p,"field_value")
//		
//		If IsNull(ls_value) Then ls_value = ""
//		
//		If ls_value = "&TODAY&" Then
//			//<modify> 08/28/2007 by: Andy Reason:Support user-defined format.
//			//ls_value = of_date_format(ls_field_format,ldt_date) //maha 070705 factored
//			ls_value = String(ldt_date,"yyyy-mm-dd hh:mm")
//			of_data_format(ls_field_format,'D',ls_value)
//			//end of modify
//		End If
//		//Start Code Change ---- 11.03.2005 #21 maha  for prompt values
//		String ls_ptype
//		Choose Case Upper(ls_value)
//			Case "&PROMPT1&"
//				ls_ptype = lds_export_hdr.GetItemString(1,"prompt_type1")
//				ls_value = of_prompt_populate( ls_ptype, as_param1)
//			Case "&PROMPT2&"
//				ls_ptype = lds_export_hdr.GetItemString(1,"prompt_type2")
//				ls_value = of_prompt_populate( ls_ptype, as_param2)
//			Case "&PROMPT3&"
//				ls_ptype = lds_export_hdr.GetItemString(1,"prompt_type3")
//				ls_value = of_prompt_populate( ls_ptype, as_param3)
//		End Choose
//		If	ls_ptype = 'D' Then
//			ldt_date = DateTime(Date(ls_value),Now())
//			//<modify> 08/28/2007 by: Andy Reason:Support user-defined format.
//			//ls_value = of_date_format(ls_field_format,ldt_date)
//			ls_value = String(ldt_date,"yyyy-mm-dd hh:mm")
//			of_data_format(ls_field_format,'D',ls_value)
//			//end of modify
//		End If
//		
//		//End Code Change---11.03.2005
//		
//		//<add> 08/27/2007 by: Andy
//		li_sub_start = lds_export_flds.GetItemNumber(p,"export_fields_substring_start")
//		If li_sub_start > 1 Then ls_value = Mid(ls_value,li_sub_start,li_width)
//		ls_value = Mid(ls_value,1,li_width) //shrink the length to size 
//		//end of add
//		
//		
//		If ls_field_format = "Leading Padding" Or ls_field_format = "Trailing Padding" Then
//			If li_width - Len(ls_value) > 0 Then
//				li_dif = li_width - Len(ls_value)
//				ls_pad = "" //reset
//				ls_pad = Fill ( ls_fld_delim, li_dif )
//				If ls_field_format = "Leading Padding" Then
//					ls_value = ls_pad + ls_value
//				Else
//					ls_value = ls_value + ls_pad
//				End If
//			End If
//		End If
//		
//		
//		For i = 1 To li_prac_id_cnt
//			lds_export_data.SetItem(i,p,ls_value)
//			lds_export_dataTemp.SetItem(i,p,ls_value) //<add> andy 2007.05.25 
//		Next
//		//<Modify> andy 2007.05.25
//		//Else //get FIELDS DATA //comment by andy 
//	ElseIf lds_export_flds.GetItemNumber(p,"export_type") = 1 Then //get FIELDS DATA
//		
//		ll_ctx_scrn_id = lds_export_flds.GetItemNumber(p,"export_fields_ctx_scrn_id") //Add by Jack 06/05/2007
//		If ll_ctx_scrn_id = 6 Then
//			ls_ic_area = "E"
//		ElseIf ll_ctx_scrn_id = 7 Then
//			ls_ic_area = "I"
//		elseif ll_ctx_scrn_id = 14 or ll_ctx_scrn_id = 17 then //add other contact -- jervis 03.28.2011
//			ls_ic_area = "C"
//		End If
//		
//		//end of modify	
//		//CREATE SYNTAX FOR each retrieve DW
//		ls_export_field = lds_export_flds.GetItemString(p,"export_field_name")
//		//<add> 08/24/2007 by: Andy
//		of_replacespecchar(ls_export_field)
//		//end of add
//		ls_select_field_ctx = Trim( lds_export_flds.GetItemString( p, "db_field_name" ) )
//		
//		
//		Choose Case ls_select_field_ctx
//			Case "app_facility"
//				ls_tempstr = 'ctx_basic_info.app_facility'
//				ls_select_table = f_get_token( ls_tempstr, "." )
//				ls_select_field = ls_tempstr
//			Case "compute_1"
//				ls_select_table = 'ctx_contract_contacts'
//				ls_select_field = "compute_1"
//			Case "contact_phone"
//				ls_select_table = 'ctx_contract_contacts'
//				ls_select_field = 'contact_phone'
//			Case "contact_email"
//				if ll_ctx_scrn_id <> 2002 then //jervis 03.28.2011
//					ls_select_table = 'ctx_contract_contacts'
//					ls_select_field = 'contact_email'
//				else
//					ls_select_table = 'ctx_contacts_numbers'
//					ls_select_field = 'contact_email'
//				end if
//			Case Else
//				ls_tempstr = lds_dataobject.Describe( ls_select_field_ctx + ".dbname" )
//				if pos(ls_tempstr,".") > 0 then	//IF Exists Table Selection - jervis 03.17.2009
//					ls_select_table = f_get_token( ls_tempstr, "." )
//				else
//					ls_select_table = ""
//				end if 
//				ls_select_field = ls_tempstr
//				
//				if ll_ctx_scrn_id = 12 then //Export Requirement Profile Detail-- jervis 03.17.2009
//					ls_select_table = 'ctx_elements'
//				elseif ll_ctx_scrn_id = 2004 then
//					ls_select_table = 'sys_statusaudit'	//Export Contract Status tract - jervis 03.20.2009
//				elseif (ll_ctx_scrn_id = 6 or ll_ctx_scrn_id = 7) and ls_select_field = "facility_id" then
//					ls_select_table = 'ctx_contract_contacts'  //Export comany info with contact - jervis 01.30.2011
//				ElseIf ll_ctx_scrn_id = 22 Then
//					ls_select_table = 'ctx_orgs_contact'//added by gavins 20130314	
//				end if
//				   
//				
//		End Choose
//
//		
//		li_use_link = lds_export_flds.GetItemNumber(p,"export_fields_ctx_uselink")
//		If IsNull( li_use_link ) Then li_use_link = 0
//		
//		
//		
//		//ls_fld_delim = lds_export_flds.GetItemString( p, "trailing_leading_characters")
//		li_recd_no = lds_export_flds.GetItemNumber(p,"intcred_record_number")
//		//<add> 07/06/2007 by: Andy
//		ll_FieldSeqID ++
//		ll_export_code = lds_export_flds.GetItemNumber( p, "export_code" )
//		
//		//end of add	
//		ls_lu_field = lds_export_flds.GetItemString( p, "lu_field_name" )
//		ls_aggre = lds_export_flds.GetItemString( p, "aggre_function" )
//		ls_sort = lds_export_flds.GetItemString( p, "sort_by" )
//		//<add> 08/09/2007 by: Andy
//		ls_Sortsel = ls_sort
//		If IsNull(ls_Sortsel) Then ls_Sortsel = ''
//		If Len(Trim(ls_Sortsel)) > 0 Then
//			//$<Modify> 05.13.2008 by Andy
//			of_get_sortsel(ls_Sortsel,'ctx_id')
//		End If
//		//end of add
//		li_act_format = lds_export_flds.GetItemNumber(p,"export_fields_active_yesno")
//		ls_text = lds_export_flds.GetItemString(p,"field_value") //maha 091305
//		If Upper(ls_lu_field) = "LOOKUP CODE" Then ls_lu_field = "lookup_code"
//		If IsNull(ls_lu_field) Then ls_lu_field = "code"
//
//		//<add> 08/21/2007 by: Andy
//		li_sub_start = lds_export_flds.GetItemNumber(p,"export_fields_substring_start")
//		//end of add
//		If Pos(ls_select_table,"dba.",1) > 0 Then //maha 122005 
//			ls_select_table_trim = Mid(ls_select_table,5) //dropping dba.
//			ls_select_table = ls_select_table_trim  //maha 012306
//		Else
//			ls_select_table_trim = ls_select_table
//		End If
//		ls_filter = lds_export_flds.GetItemString(p,"filter_query")
//		
//		
//		If IsNull(ls_filter) Or Trim(ls_filter) = "" Then
//			ls_filter = ""
//		Else
//			//<Modify> 07/23/2007 by: Andy 
//			//ls_filter = " and  " + ls_filter
//			ls_filter = " and  ( " + ls_filter + " )"
//			//end of Modify
//			
//			//Start Code Change ---- 11.03.2005 #24 maha check filter for prompt values and replace
//			Long li_pos1
//			li_pos1 = Pos(Upper(ls_filter),"PROMPT1",1)
//			If li_pos1 > 0 Then
//				ls_filter = Mid(ls_filter,1,li_pos1 - 1) + as_param1 + Mid(ls_filter,li_pos1 + 7)
//			End If
//			li_pos1 = Pos(Upper(ls_filter),"PROMPT2",1)
//			If li_pos1 > 0 Then
//				ls_filter = Mid(ls_filter,1,li_pos1 - 1) + as_param2 + Mid(ls_filter,li_pos1 + 7)
//			End If
//			li_pos1 = Pos(Upper(ls_filter),"PROMPT3",1)
//			If li_pos1 > 0 Then
//				ls_filter = Mid(ls_filter,1,li_pos1 - 1) + as_param3 + Mid(ls_filter,li_pos1 + 7)
//			End If
//		End If
//		//End Code Change---11.03.2005 	
//		
//		//Replace ls_rec_delim to ls_fld_delim - jervis 12.30.2009
//		/*
//		//set fields delimiter/pad maha 060105
//		Choose Case ls_rec_delim
//			Case "R" //return
//				ls_rec_delim = "~r"
//			Case "T" //tab
//				ls_rec_delim = "	"
//			Case "D" //double return
//				ls_rec_delim = "~r~r"
//			Case "S" // space
//				ls_rec_delim = " "
//			Case "E" //empty string
//				ls_rec_delim = ""
//		End Choose
//		*/
//		
//		//export_fields_use_link  sql
//		If li_use_link = 1 Then
//			ls_linkfromcol = Trim( lds_export_flds.GetItemString( p, "export_fields_ctx_linkfromcolumn" ))
//			ls_tempstr = lds_dataobject.Describe( ls_linkfromcol + ".dbname" )
//			f_get_token( ls_tempstr, "." )
//			ls_linkfromcol = ls_tempstr
//			
//			lds_linkto.DataObject = Trim( lds_export_flds.GetItemString( p, "export_fields_ctx_linktoscrndw" ))
//			ls_linktocol = Trim( lds_export_flds.GetItemString( p, "export_fields_ctx_linktocolumn" ))
//			ls_tempstr = lds_linkto.Describe( ls_linktocol + ".dbname" )
//			ls_linktotable = f_get_token( ls_tempstr, "." )
//			ls_linktocol = ls_tempstr
//			
//			//Contacted contact or our company contact - jervis 01.27.2011
//			ll_ctx_link_scrn_id = lds_export_flds.GetItemNumber(p,"export_fields_ctx_linktoscrnid") 
//			If ll_ctx_link_scrn_id = 6 Then
//				ls_ic_link_area = "E"
//			ElseIf ll_ctx_link_scrn_id = 7 Then
//				ls_ic_link_area = "I"
//			elseif ll_ctx_link_scrn_id = 14 or ll_ctx_link_scrn_id = 17 then  //add other contact -- jervis 03.28.2011
//				ls_ic_link_area = "C"
//			End If
//		End If
//		
//		ls_tablelist[ll_FieldSeqID] = ls_select_table
//		ls_fieldlist[ll_FieldSeqID] = ls_export_field
//		li_recdnoList[ll_FieldSeqID] = li_recd_no
//		ls_selectfieldlist[ll_FieldSeqID] = ls_select_field
//		ls_formatList[ll_FieldSeqID] = ls_field_format
//		ll_exportcodeList[ll_FieldSeqID] = ll_export_code
//		//<add> 08/21/2007 by: Andy
//		li_substartList[ll_FieldSeqID] = li_sub_start
//		//end of add
//		li_widthList[ll_FieldSeqID] = li_width
//		//<add> 07/23/2007 by: Andy
//		li_widthtemp = li_width
//		If li_widthtemp < 30 Then li_widthtemp = 30
//		//end of add
//		ls_flddelimList[ll_FieldSeqID] = ls_fld_delim
//		li_udList[ll_FieldSeqID] = ud
//		ls_defvalList[ll_FieldSeqID] = ls_def_val
//		ls_textList[ll_FieldSeqID] = ls_text
//		ls_lu_fieldList[ll_FieldSeqID] = ls_lu_field
//		
//		li_act_formatList[ll_FieldSeqID] = li_act_format
//
//		//If ai_type = 1 Then
//		//	ls_use_link_sql = ls_use_link_sql + ", (" + ls_prac_sql + ") bb "
//		//End If
//		
//		//--------------------------- APPEON BEGIN ---------------------------
//		//$<modify> 03.19.2007 By: Jack (Export)
//		//$<reason> Fix a defect.
//		//Modify 08/15/2007 by: Andy
//		if (ll_ctx_scrn_id = 6 or ll_ctx_scrn_id = 7) and ls_select_field = 'facility_id' then
//			ls_usetable = "ctx_contract_contacts"
//		elseIf ls_select_table <> 'app_facility' Then
//			If li_use_link = 1 Then
//				ls_usetable = Lower(ls_linktotable)
//			Else
//				ls_usetable = Lower(ls_select_table)
//			End If
//		Else
//			ls_usetable = "ctx_basic_info"
//		End If
//		
//		if lb_get_parent then
//			ls_ctx_table = "table_1"
//		else
//			ls_ctx_table = ls_usetable
//		end if
//		
//		//<ad> 08/16/2007 by: Andy
//		ls_tablepk = ""
//		If IsNull(ls_sort) Or Trim(ls_sort) = "" Then
//			ls_sort = ""
//			lb_flagpk = True
//			//lb_sortpk = false
//			ll_pkcnt = UpperBound(ls_table)
//			For ll_n = 1 To ll_pkcnt
//				If Lower(ls_usetable) = Lower(ls_table[ll_n]) Then
//					ls_tablepk = ls_tablepks[ll_n]
//					//ls_sort  = Left(ls_tablepk,len(ls_tablepk) - 2)
//					ls_sort = ls_sortpk[ll_n]
//					lb_flagpk = False
//				End If
//			Next
//			If lb_flagpk Then
//				ll_Rcnt = lds_tablepk.Retrieve( ls_usetable)
//				ls_sort = ls_usetable + '.ctx_id, '
//				For ll_n = 1 To ll_Rcnt
//					If Lower(lds_tablepk.GetItemString( ll_n, "column_name")) = 'ctx_id' Then
//						//ls_sort = ls_usetable + '.ctx_id, '
//						Continue
//					End If
//					ls_tablepk += ls_usetable + '.' + lds_tablepk.GetItemString( ll_n, "column_name") + ", "
//				Next
//				//Modify 08/22/2007 by: Andy
//				//ls_sort = ls_tablepk + ls_sort
//				ls_sort = ls_sort + ls_tablepk
//				//end of modify
//				ls_sort  = Left(ls_sort,Len(ls_sort) - 2)
//				ls_sortpk[ll_pkcnt + 1] = ls_sort
//				ls_table[ll_pkcnt+1] = ls_usetable
//				ls_tablepks[ll_pkcnt+1] = ls_tablepk
//			End If
//			//<add> 08/22/2007 by: Andy
//		Else
//			If Pos(Lower(ls_sort),'ctx_id') < 1 Then ls_sort = ls_usetable + '.ctx_id, ' + ls_sort
//		End If
//		
//		
//		//<add> 08/23/2007 by: Andy
//		If Len(ls_aggre) > 0 Then
//			ls_sort = ls_sort + " , field_value"
//		End If
//		If Len(ls_sort) > 0 Then ls_sort = "order by " + ls_sort
//		//end of add
//		
//		//<add> 08/23/2007 by: Andy
//		If lb_true Then//SQL2005 and ASA9
//			ls_RowNoSyn = ",row_number() over(" + ls_sort+") Row_No"
//		End If
//		//end of add
//		
//		
//		ls_sny_retrieve = ls_synprefix + "Select " + ls_top + " " + ls_ctx_table + ".ctx_id, " + ls_tablepk + ls_Sortsel + String(ll_FieldSeqID) + " FieldSeqID, "
//
//		ls_db_lookup_type = lds_export_flds.GetItemString( p, "export_fields_ctx_lookup_type" )
//		//--------------------------- APPEON BEGIN ---------------------------
//		//$<modify> 04.04.2007 By: Jack 
//		//$<reason> Fix a defect.
//		
//		If ls_select_table = 'app_facility' And ls_select_field_ctx = 'state' Then
//			ls_dddwdata = ''
//		Else
//			ls_dddwdata = Lower( lds_dataobject.Describe( ls_select_field_ctx + ".dddw.datacolumn" ) )
//		End If
//		//---------------------------- APPEON END ----------------------------
//		
//		If ls_dddwdata <> '?' And ls_dddwdata <> '!' And ls_dddwdata <> '' Then
//			ls_tempstr = Lower( lds_dataobject.Describe( ls_select_field_ctx + ".dddw.displaycolumn" ) )
//			
//			//the edit style has been dynamic change for lookup or company dddw -- jervis 09.22.2011
//			ls_dddwname =  Lower( lds_dataobject.Describe( ls_select_field_ctx + ".dddw.name" ) )
//			if ls_dddwname = 'd_dddw_code_lookup' or ls_dddwname = 'd_dddw_company'  then  
//				ls_dddwdata = ''
//			else
//				If ls_tempstr <> '?' And ls_tempstr <> '!' And ls_tempstr <> '' Then
//					
//					If IsNull( ls_db_lookup_type ) Then
//						ls_db_lookup_type = "X"
//						ls_lu_field = ls_tempstr
//						
//						lds_dataobject.GetChild( ls_select_field_ctx, ldwc_dddw )
//						ls_tempstr = ldwc_dddw.Describe( ls_lu_field + ".dbname" )
//						ls_dddwtable = f_get_token( ls_tempstr, "." )
//						ls_dddw_column_dbname = ls_tempstr
//					End If
//				End If
//			end if
//		End If
//		
//		
//		
//		If li_use_link = 1 Then
//			//ls_use_link_sql2 = " (" + ls_linktotable + "." + ls_linktocol + " = " + ls_select_table + "." + ls_linkfromcol + ") and "
//			if lb_get_parent then
//				ls_link_table = ls_linktotable
//				ls_link_table_on = " on( table_2.ctx_id = " + ls_linktotable + ".ctx_id) left join "
//				if ls_select_table <> "app_facility" then
//					ls_no_link_on = " on (table_2.ctx_id = " + Lower(ls_select_table) + ".ctx_id) "
//				else
//					ls_no_link_on = " on (table_2.ctx_id = " + Lower(ls_usetable) + ".ctx_id) "
//				end if
//			else
//				ls_link_table = ls_linktotable + " left join "
//				ls_link_table_on = " "
//			end if
//			
//			ls_select_table_on = " on  (" + ls_linktotable + "." + ls_linktocol + " = " + ls_select_table + "." + ls_linkfromcol + ") "
//			
//			//Contracted contact or our company contact - jervis 01.27.2011
//			//add other contact - jervis 03.28.2011
//			If ll_ctx_link_scrn_id = 6 or ll_ctx_link_scrn_id = 7 or ll_ctx_link_scrn_id = 14 or ll_ctx_link_scrn_id = 17 Then
//				ls_other_where = " and " + ls_linktotable + ".ic_area ='" + ls_ic_link_area + "' "
//			end if
//		else
//			ls_link_table = " "
//			ls_link_table_on = " "
//			//Get select table on clause		-- jervis 03.04.2009
//			if lb_get_parent then
//				if ls_select_table <> "app_facility" then
//					ls_select_table_on = " on (table_2.ctx_id = " + Lower(ls_select_table) + ".ctx_id) "
//				else
//					ls_select_table_on = " on (table_2.ctx_id = " + Lower(ls_usetable) + ".ctx_id) "
//				end if
//			end if
//			ls_no_link_on = ls_select_table_on
//			//Get link table on clause		-jervis 03.04.2009
//		End If
//		
//		If ls_select_field = 'app_facility' And Upper(ls_db_lookup_type)  = "C" Then
//			ls_datatype = "C"
//
//			//ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),app_facility."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from app_facility," + Lower(ls_select_table) +  ls_use_link_sql + " WHERE " + "(" + Lower(ls_select_table) + "." + ls_select_field + " = app_facility.facility_id) and "
//			ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),app_facility."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//									ls_syn_parent + ls_link_table + ls_link_table_on +  Lower(ls_select_table) + ls_select_table_on + " left join app_facility on("+ Lower(ls_select_table) + "." + ls_select_field + " = app_facility.facility_id) "
//
//			ls_select_field  = "app_facility_" + ls_lu_field
//		//---------Start code by jervis 06.09.2009-------------
//		//Export location data
//		
//		//Export company info whit contracted conatct or our company contact -- jervis 01.30.2011
//		elseif (ll_ctx_scrn_id = 6 or ll_ctx_scrn_id = 7 or ll_ctx_link_scrn_id = 14 or ll_ctx_link_scrn_id = 17) and ls_select_field = 'facility_id' then
//			ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),app_facility."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//									ls_syn_parent + ls_link_table + ls_link_table_on +  Lower(ls_select_table) + ls_select_table_on + " left join ctx_contacts on (ctx_contract_contacts.contact_id = ctx_contacts.contact_id) left join app_facility on(ctx_contacts.facility_id = app_facility.facility_id) "
//
//			ls_select_field  = "app_facility_" + ls_lu_field
//			
//			//if (ll_ctx_scrn_id = 6 or ll_ctx_scrn_id = 7) Then
//				ls_other_where = " and ctx_contract_contacts.ic_area = '" +ls_ic_area + "' "
//			//end if
//			
//		elseif ls_select_field = 'loc_id' and upper(ls_db_lookup_type) = "L" then //Location
//			ls_datatype = "C"
//			if ls_lu_field = "state"  or ls_lu_field = "country" or ls_lu_field = "mailing_address" then
//				//Use code_lookup.code display value -- jervis 08.04.2009
//				ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),code_lookup.code) field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//									ls_syn_parent + ls_link_table + ls_link_table_on +  Lower(ls_select_table) + ls_select_table_on + " left join group_practice on("+ Lower(ls_select_table) + "." + ls_select_field + " = group_practice.rec_id) " + &
//									"left join code_lookup on ( group_practice." + ls_lu_field + " = code_lookup.lookup_code) " 
//			elseif  ls_lu_field = "county"  then
//				//Use code_lookup.describe display value -- jervis 08.04.2009
//				ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),code_lookup.description) field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//									ls_syn_parent + ls_link_table + ls_link_table_on +  Lower(ls_select_table) + ls_select_table_on + " left join group_practice on("+ Lower(ls_select_table) + "." + ls_select_field + " = group_practice.rec_id) " + &
//									"left join code_lookup on ( group_practice." + ls_lu_field + " = code_lookup.lookup_code) " 
//			elseif ls_lu_field = "mailing_address_desc" then		//Export Description - jervis 08.07.2009
//				ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),code_lookup.description) field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//									ls_syn_parent + ls_link_table + ls_link_table_on +  Lower(ls_select_table) + ls_select_table_on + " left join group_practice on("+ Lower(ls_select_table) + "." + ls_select_field + " = group_practice.rec_id) " + &					
//									"left join code_lookup on ( group_practice.mailing_address = code_lookup.lookup_code) " 
//			else
//				ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),group_practice."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//									ls_syn_parent + ls_link_table + ls_link_table_on +  Lower(ls_select_table) + ls_select_table_on + " left join group_practice on("+ Lower(ls_select_table) + "." + ls_select_field + " = group_practice.rec_id) "
//			end if
//			ls_select_field = "group_practice_" + ls_lu_field
//		//---------End code by jervis 06.09.2009-------------
//		
//		elseif ls_select_field = 'parent_comp_id' and Upper(ls_db_lookup_type) = "M" then	//Parent Organization -- jervis 06.23.2009
//			
//			ls_datatype = "C"
//			ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),group_multi_loc."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//									ls_syn_parent + ls_link_table + ls_link_table_on +  Lower(ls_select_table) + ls_select_table_on + " left join group_multi_loc on("+ Lower(ls_select_table) + "." + ls_select_field + " = group_multi_loc.rec_id) "
//			ls_select_field = "group_multi_loc_" + ls_lu_field
//
//		//---------Start code by jervis 03.17.2009-------------
//		//Export Requiments data
//		elseif ls_select_field = 'ctx_req_profile_id' and Upper(ls_db_lookup_type) = "R"	 then //Requiren profile dddw-jervis 03.17.2009
//			ls_Datatype = 'C'
//			ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),ctx_req_profile."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//									ls_syn_parent + ls_link_table + ls_link_table_on +  Lower(ls_select_table) + ls_select_table_on + " left join ctx_req_profile on("+ Lower(ls_select_table) + "." + ls_select_field + " = ctx_req_profile.ctx_req_profile_id) "
//			ls_select_field = "ctx_req_profile_" + ls_lu_field
//		
//		ElseIf ll_ctx_scrn_id = 22 Then
//			ls_datatype = of_get_coltype(lds_dataobject,ls_select_field_ctx) 
////					ls_select_table = 'ctx_orgs_contact'//added by gavins 20130314
//			If ls_select_field = 'org_type' then
//				ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),code_lookup."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//											ls_syn_parent + ls_link_table + ls_link_table_on +  Lower(ls_select_table) + ls_select_table_on + " inner join ctx_orgs on " + Lower(ls_select_table) + ".org_id"  +" = ctx_orgs.org_id  left join code_lookup on (ctx_orgs." + ls_select_field + " = code_lookup.lookup_code) "
//			Else
//				ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),ctx_orgs."+ ls_select_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//									ls_syn_parent + ls_link_table + ls_link_table_on +  Lower(ls_select_table) + ls_select_table_on + " inner join ctx_orgs on " + Lower(ls_select_table) + ".org_id"  +" = ctx_orgs.org_id  "
//			End if
//			ls_select_field  = "ctx_orgs_" + ls_select_field						
//		elseif ll_ctx_scrn_id = 12 then	//Export Requirements Profile Detail Data - jervis 03.17.2009
//			ls_datatype = of_get_coltype(lds_dataobject,ls_select_field_ctx)
//			choose case ls_select_field
//				case 'data_value'
//					ls_sny_retrieve = ls_sny_retrieve +  " convert(varchar(" + String(li_widthtemp) + "),(Case ctx_req_tmplt_element.value_type when 1 then convert(varchar," + ls_select_table + ".date_value ,101) when 2 then " + ls_select_table+ ".field_value when 3 then " + ls_select_table + ".char_value when 4 then cast(" +ls_select_table+".integer_value as varchar) when 6 then cast(" +ls_select_table+".money_value as varchar) when 5 then " +ls_select_table +" .field_value end)) field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " 
//											//ls_syn_parent + ls_link_table + ls_link_table_on + ls_select_table + ls_select_table_on + &
//											//"left join ctx_req_tmplt_element on (" + ls_select_table + ".ctx_req_tmplt_element_id = ctx_req_tmplt_element.ctx_req_tmplt_element_id)"
//					ls_select_field = ls_select_table + "_"+ls_select_field
//				case 'element_sort'	//in process....
//				case 'requirement'	
//					ls_sny_retrieve = ls_sny_retrieve +  " convert(varchar(" + String(li_widthtemp) + "),ctx_req_tmplt_element.element_name) field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " //+ &
//											//ls_syn_parent + ls_link_table + ls_link_table_on + ls_select_table + ls_select_table_on + &
//											//"left join ctx_req_tmplt_element  on (" + ls_select_table + ".ctx_req_tmplt_element_id = ctx_req_tmplt_element.ctx_req_tmplt_element_id)"
//					ls_select_field =  "ctx_req_tmplt_element_"+ls_select_field
//				case 'ctx_rqmnt_category_id'	//in process....
//				case 'ctx_req_profile_id'	//in process
//				case 'category_name'
//					ls_sny_retrieve = ls_sny_retrieve +  " convert(varchar(" + String(li_widthtemp) + "),ctx_rqmnt_category.category_name) field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " //+ &
//											//ls_syn_parent + ls_link_table + ls_link_table_on + ls_select_table + ls_select_table_on + &
//											//"left join ctx_req_tmplt_element on (" + ls_select_table + ".ctx_req_tmplt_element_id = ctx_req_tmplt_element.ctx_req_tmplt_element_id) " + &
//											//"left join ctx_rqmnt_category  on (ctx_req_tmplt_element.ctx_rqmnt_category_id = ctx_rqmnt_category.ctx_rqmnt_category_id and " + ls_linktotable + ".ctx_req_profile_id = ctx_rqmnt_category.ctx_req_profile_id)"
//					ls_select_field = "ctx_rqmnt_category_"+ls_select_field
//
//				case else		//case 'clause'
//					ls_sny_retrieve = ls_sny_retrieve +  " convert(varchar(" + String(li_widthtemp) + ")," + ls_select_table + "."+ ls_select_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " //+ &
//											//ls_syn_parent + ls_link_table + ls_link_table_on + ls_select_table + ls_select_table_on 
//											
//					ls_select_field = ls_select_table + "_"+ls_select_field
//			end choose
//			ls_sny_retrieve =  ls_sny_retrieve + ls_syn_parent + ls_link_table + ls_link_table_on + ls_select_table + ls_select_table_on + &
//									" left join ctx_req_tmplt_element on (" + ls_select_table + ".ctx_req_tmplt_element_id = ctx_req_tmplt_element.ctx_req_tmplt_element_id) " + &
//									" left join ctx_rqmnt_category  on (ctx_req_tmplt_element.ctx_rqmnt_category_id = ctx_rqmnt_category.ctx_rqmnt_category_id and " + ls_linktotable + ".ctx_req_profile_id = ctx_rqmnt_category.ctx_req_profile_id)"
//		//---------End code by jervis 03.17.2009-------------
//		
//		//-----------Start code by jervis 03.20.2009------------
//		//Export the Processing Setting for Contract status tract
//		elseif ll_ctx_scrn_id = 2004 and ls_select_field = "processing_setting"	 then
//			ls_datatype = 'C'
//			ls_sny_retrieve = ls_sny_retrieve +  " convert(varchar(" + String(li_widthtemp) + "),case code_lookup.custom_2 when 'On' then 'In Process' when 'Off' then 'On Hold' when 'Complete' then 'Executed' when 'NA' then 'N/A' else custom_2 end ) field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//									ls_syn_parent + ls_link_table + ls_link_table_on + ls_select_table + ls_select_table_on + &
//									" left join code_lookup on (" + ls_select_table+ ".status = code_lookup.lookup_code)" // and code_lookup.lookup_name = 'Contract Status')" -- comment by jervis -- 04.26.2011
//											
//			//ls_select_field = ls_select_table + "_"+ls_select_field
//		//---------End code by jervis 03.20.2009-------------
//		ElseIf ls_select_field = 'contact_id' and ll_ctx_scrn_id <> 2001 Then  //Add ll_ctx_scrn_id <> 2001 -- jervis 01.28.2011
//			//--------------------------- APPEON BEGIN ---------------------------
//			//$<modify> 06.05.2007 By: Jack
//			//$<reason> Fix a defect.
//			If ls_lu_field = 'contact_department' Or ls_lu_field = 'contact_type' Or ls_lu_field = 'contact_id' Then
//				ls_datatype = "N"
//			Else
//				ls_datatype = "C"
//			End If
//			
//			If ls_lu_field = 'phone' or ls_lu_field = "ext" or ls_lu_field = "contact_email" Then
//				if ls_lu_field = "contact_email" then
//					ls_lu_codename = "Email"
//				else
//					ls_lu_codename = "Phone"
//				end if
//				//ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),(select top 1 A.phone from ctx_contacts_numbers A where A.contact_id = ctx_contract_contacts.contact_id and a.via = (select lookup_code from code_lookup where lookup_name = 'Contract Contact Via' and code = 'Phone' ) and a.phone is not null)) field_value, '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from ctx_contract_contacts,ctx_contacts " + ", (" + ls_prac_sql + ") bb " + " where ctx_contract_contacts.contact_id = ctx_contacts.contact_id and ctx_contract_contacts.ic_area = '" + ls_ic_area + "' and "
//				ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),(select top 1 A." + ls_lu_field+ " from ctx_contacts_numbers A where A.contact_id = ctx_contract_contacts.contact_id and a.via = (select top 1 lookup_code from code_lookup where lookup_name = 'Contract Contact Via' and lower(code) = '" + lower(ls_lu_codename) + "' ) and a." + ls_lu_field + " is not null)) field_value, '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//										ls_syn_parent + " ctx_contract_contacts " + ls_no_link_on + " left join ctx_contacts on (ctx_contract_contacts.contact_id = ctx_contacts.contact_id )"
//				ls_other_where = " and ctx_contract_contacts.ic_area = '" +ls_ic_area + "' "
//	
//			Else
//				//ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),ctx_contacts."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from ctx_contacts," + Lower(ls_select_table) +  ls_use_link_sql + " WHERE " + "(" + Lower(ls_select_table) + "." + ls_select_field + " = ctx_contacts.contact_id) and "
//				ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),ctx_contacts."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//										ls_syn_parent +  ls_link_table + ls_link_table_on +  lower(ls_select_table) + ls_select_table_on + " left join ctx_contacts on(" + Lower(ls_select_table) + "." + ls_select_field + " = ctx_contacts.contact_id) "
//				//Add other contact - jervis 03.28.2011
//				if (ll_ctx_scrn_id = 6 or ll_ctx_scrn_id = 7 or ll_ctx_scrn_id = 14 or ll_ctx_scrn_id = 17) and lower(ls_select_table) = "ctx_contract_contacts" Then
//					ls_other_where = " and ctx_contract_contacts.ic_area = '" +ls_ic_area + "' "
//				end if
//			End If
//			//---------------------------- APPEON END ----------------------------
//			
//			ls_select_field  = "ctx_contacts_" + ls_lu_field
//			
//		
//		elseif ll_ctx_scrn_id = 2002 and (ls_select_field = 'phone' or ls_select_field = "ext" or ls_select_field = "contact_email") then  //Add by jervis 03.28.2011
//			ls_datatype = "C" 
//			//,(select top 1 A." + ls_lu_field+ " from ctx_contacts_numbers A where A.contact_id = ctx_contract_contacts.contact_id and a.via = (select top 1 lookup_code from code_lookup where lookup_name = 'Contract Contact Via' and lower(code) = '" + lower(ls_lu_codename) + "' ) and a." + ls_lu_field + " is not null))
//			ls_field_value = " convert(varchar(" + String(li_widthtemp) + "),"+ ls_select_table + "." +ls_select_field + ") "
//			
//			if ls_select_field = "contact_email" then
//				ls_lu_codename = "Email"
//			else
//				ls_lu_codename = "Phone"
//			end if
//				
//			ls_sny_retrieve = ls_sny_retrieve + ls_field_value + " field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//											ls_syn_parent +ls_link_table + ls_link_table_on +   Lower(ls_select_table) + ls_select_table_on
//			//overwrite link other where condition
//			if li_use_link = 1 and (ll_ctx_link_scrn_id = 6 or ll_ctx_link_scrn_id = 7 or ll_ctx_link_scrn_id = 14 or ll_ctx_link_scrn_id = 17) Then
//				ls_other_where = " and ("+ ls_select_table + ".via = (select top 1 lookup_code from code_lookup where lookup_name = 'Contract Contact Via' and lower(code) = '" + lower(ls_lu_codename) + "' and " + ls_select_table +  "." + ls_select_field + " is not null) and ctx_contract_contacts.ic_area = '" +ls_ic_link_area + "' ) "
//			end if
//		ElseIf ls_select_field = 'compute_1' Then
//			ls_datatype = "C"
//				
//			//ls_sny_retrieve = ls_synprefix + "Select " + ls_top + " ctx_contract_contacts.ctx_id, " + ls_tablepk + ls_Sortsel + String(ll_FieldSeqID) + " FieldSeqID,  isnull(ctx_contacts.last_name,'') + ','  + isnull(ctx_contacts.first_name,'') + case when isnull(ctx_contacts.middle_name,'') <> '' THEN ', ' + isnull(ctx_contacts.middle_name,'') else '' END field_value, '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from ctx_contract_contacts,ctx_contacts " + ", (" + ls_prac_sql + ") bb " + " where ctx_contract_contacts.contact_id = ctx_contacts.contact_id and ctx_contract_contacts.ic_area = '" + ls_ic_area + "' and "
//			if lb_get_parent then
//				ls_sny_retrieve = ls_synprefix + "Select " + ls_top + " table_1.ctx_id, " + ls_tablepk + ls_Sortsel + String(ll_FieldSeqID) + " FieldSeqID,  isnull(ctx_contacts.last_name,'') + ','  + isnull(ctx_contacts.first_name,'') + case when isnull(ctx_contacts.middle_name,'') <> '' THEN ', ' + isnull(ctx_contacts.middle_name,'') else '' END field_value, '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//										ls_syn_parent + " ctx_contract_contacts " + ls_no_link_on + " left join ctx_contacts on (ctx_contract_contacts.contact_id = ctx_contacts.contact_id and ctx_contract_contacts.ic_area = '" + ls_ic_area + "')"
//			ELSE
//				ls_sny_retrieve = ls_synprefix + "Select " + ls_top + " ctx_contract_contacts.ctx_id, " + ls_tablepk + ls_Sortsel + String(ll_FieldSeqID) + " FieldSeqID,  isnull(ctx_contacts.last_name,'') + ','  + isnull(ctx_contacts.first_name,'') + case when isnull(ctx_contacts.middle_name,'') <> '' THEN ', ' + isnull(ctx_contacts.middle_name,'') else '' END field_value, '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//										 " ctx_contract_contacts " +  " left join ctx_contacts on (ctx_contract_contacts.contact_id = ctx_contacts.contact_id and ctx_contract_contacts.ic_area = '" + ls_ic_area + "')"
//			END IF
//			ls_other_where = " and ctx_contract_contacts.ic_area = '" +ls_ic_area + "' "
//			ls_select_field  = "compute_1"
//		ElseIf ls_select_field = 'contact_phone' Then
//			ls_datatype = "C"
//			//ls_sny_retrieve = ls_synprefix + "Select " + ls_top + " ctx_contract_contacts.ctx_id, " + ls_tablepk + ls_Sortsel + String(ll_FieldSeqID) + " FieldSeqID,  (select top 1 A.phone from ctx_contacts_numbers A where A.contact_id = ctx_contract_contacts.contact_id and	a.via = (select lookup_code from code_lookup where lookup_name = 'Contract Contact Via' and code = 'Phone' ) and a.phone is not null) field_value, '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from ctx_contract_contacts,ctx_contacts where ctx_contract_contacts.contact_id = ctx_contacts.contact_id and ctx_contract_contacts.ic_area = '" + ls_ic_area + "' and "
//			if lb_get_parent then
//				ls_sny_retrieve = ls_synprefix + "Select " + ls_top + " table_1.ctx_id, " + ls_tablepk + ls_Sortsel + String(ll_FieldSeqID) + " FieldSeqID,  (select top 1 A.phone from ctx_contacts_numbers A where A.contact_id = ctx_contract_contacts.contact_id and	a.via = (select top 1 lookup_code from code_lookup where lookup_name = 'Contract Contact Via' and code = 'Phone' ) and a.phone is not null) field_value, '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//										ls_syn_parent + " ctx_contract_contacts " + ls_no_link_on + " left join ctx_contacts on(ctx_contract_contacts.contact_id = ctx_contacts.contact_id ) "
//			else
//				ls_sny_retrieve = ls_synprefix + "Select " + ls_top + " ctx_contract_contacts.ctx_id, " + ls_tablepk + ls_Sortsel + String(ll_FieldSeqID) + " FieldSeqID,  (select top 1 A.phone from ctx_contacts_numbers A where A.contact_id = ctx_contract_contacts.contact_id and	a.via = (select top 1 lookup_code from code_lookup where lookup_name = 'Contract Contact Via' and code = 'Phone' ) and a.phone is not null) field_value, '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//										" ctx_contract_contacts  left join ctx_contacts on(ctx_contract_contacts.contact_id = ctx_contacts.contact_id ) "
//			end if
//			ls_other_where = " and ctx_contract_contacts.ic_area = '" +ls_ic_area + "' "
//		ElseIf ls_select_field = 'contact_email' Then
//			ls_datatype = "C"
//			If lb_get_parent Then
//				//ls_sny_retrieve = ls_synprefix + "Select " + ls_top + " ctx_contract_contacts.ctx_id, " + ls_tablepk + ls_Sortsel + String(ll_FieldSeqID) + " FieldSeqID,  (select top 1 A.contact_email from ctx_contacts_numbers A where A.contact_id = ctx_contract_contacts.contact_id and a.via = (select lookup_code from code_lookup where lookup_name = 'Contract Contact Via' and code = 'Email' ) and a.contact_email is not null) field_value, '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from ctx_contract_contacts,ctx_contacts " + ", (" + ls_prac_sql + ") bb " + " where ctx_contract_contacts.contact_id = ctx_contacts.contact_id and ctx_contract_contacts.ic_area = '" + ls_ic_area + "' and "
//				ls_sny_retrieve = ls_synprefix + "Select " + ls_top + " table_1.ctx_id, " + ls_tablepk + ls_Sortsel + String(ll_FieldSeqID) + " FieldSeqID,  (select top 1 A.contact_email from ctx_contacts_numbers A where A.contact_id = ctx_contract_contacts.contact_id and	a.via = (select top 1 lookup_code from code_lookup where lookup_name = 'Contract Contact Via' and code = 'Email' ) and a.contact_email is not null) field_value, '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//										ls_syn_parent + " ctx_contract_contacts " + ls_no_link_on + " left join ctx_contacts on(ctx_contract_contacts.contact_id = ctx_contacts.contact_id ) "
//			Else
//				ls_sny_retrieve = ls_synprefix + "Select " + ls_top + " ctx_contract_contacts.ctx_id, " + ls_tablepk + ls_Sortsel + String(ll_FieldSeqID) + " FieldSeqID,  (select top 1 A.contact_email from ctx_contacts_numbers A where A.contact_id = ctx_contract_contacts.contact_id and	a.via = (select top 1 lookup_code from code_lookup where lookup_name = 'Contract Contact Via' and code = 'Email' ) and a.contact_email is not null) field_value, '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//										" ctx_contract_contacts  left join ctx_contacts on(ctx_contract_contacts.contact_id = ctx_contacts.contact_id ) "
//			End If
//			ls_other_where = " and ctx_contract_contacts.ic_area = '" +ls_ic_area + "' "
//		ElseIf Upper(ls_db_lookup_type)  = "C" Then //code lookup table
//			
//			ls_datatype_ctx = of_get_coltype(lds_dataobject,ls_select_field_ctx) //03.25.2011 by jervis
//			
//			//--------------------------- APPEON BEGIN ---------------------------
//			//$<modify> 03.19.2007 By: Jack (Export)
//			//$<reason> Fix a defect.
//			If Upper(ls_lu_field) = "LOOKUP_CODE" Then
//				ls_datatype = "N"
//			Else
//				ls_datatype = "C"
//			End If
//			
//			if ls_datatype_ctx = 'N' then //Non't convert - jervis 03.25.2011
//				If ls_select_table <> 'app_facility' Then
//					//ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),code_lookup."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from code_lookup," + Lower(ls_select_table) +  ls_use_link_sql + " WHERE " + "(convert(varchar," + Lower(ls_select_table) + "." + ls_select_field + ") = convert(varchar,code_lookup.lookup_code)) and "
//					ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),code_lookup."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//											ls_syn_parent + ls_link_table + ls_link_table_on +  Lower(ls_select_table) + ls_select_table_on + " left join code_lookup on (" + Lower(ls_select_table) + "." + ls_select_field + " = code_lookup.lookup_code) "
//				Else
//					//ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),code_lookup."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from ctx_basic_info,code_lookup," + lower(ls_select_table) +  ls_use_link_sql + " WHERE " + "(convert(varchar," + lower(ls_select_table) + "." + ls_select_field + ") = convert(varchar,code_lookup.lookup_code)) and "			
//					ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),code_lookup."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//											ls_syn_parent + ls_link_table + ls_link_table_on +  " ctx_basic_info " + ls_select_table_on + " left join app_facility on(ctx_basic_info.app_facility = app_facility.facility_id) left join code_lookup on (" + lower(ls_select_table) + "." + ls_select_field + " = code_lookup.lookup_code) "			
//				End If
//			else
//				If ls_select_table <> 'app_facility' Then
//					//ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),code_lookup."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from code_lookup," + Lower(ls_select_table) +  ls_use_link_sql + " WHERE " + "(convert(varchar," + Lower(ls_select_table) + "." + ls_select_field + ") = convert(varchar,code_lookup.lookup_code)) and "
//					ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),code_lookup."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//											ls_syn_parent + ls_link_table + ls_link_table_on +  Lower(ls_select_table) + ls_select_table_on + " left join code_lookup on (convert(varchar," + Lower(ls_select_table) + "." + ls_select_field + ") = convert(varchar,code_lookup.lookup_code)) "
//				Else
//					//ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),code_lookup."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from ctx_basic_info,code_lookup," + lower(ls_select_table) +  ls_use_link_sql + " WHERE " + "(convert(varchar," + lower(ls_select_table) + "." + ls_select_field + ") = convert(varchar,code_lookup.lookup_code)) and "			
//					ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),code_lookup."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//											ls_syn_parent + ls_link_table + ls_link_table_on +  " ctx_basic_info " + ls_select_table_on + " left join app_facility on(ctx_basic_info.app_facility = app_facility.facility_id) left join code_lookup on (convert(varchar," + lower(ls_select_table) + "." + ls_select_field + ") = convert(varchar,code_lookup.lookup_code)) "			
//				End If
//			end if
//			//---------------------------- APPEON END ----------------------------
//			ls_select_field  = "code_lookup_" + ls_lu_field
//		elseif Upper(ls_db_lookup_type) = "P" then
//			ls_datatype_ctx = of_get_coltype(lds_dataobject,ls_select_field_ctx) //03.25.2011 by jervis
//			//Company dddw process--jervis 12.9.2009
//			ls_datatype = "C"
//			if ls_datatype_ctx = 'N' then //Jervis 03.25.2011
//				ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),app_facility."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//									ls_syn_parent + ls_link_table + ls_link_table_on +  Lower(ls_select_table) + ls_select_table_on + " left join app_facility on(" + Lower(ls_select_table) + "." + ls_select_field + " = app_facility.facility_id) "
//			else
//				ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),app_facility."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//									ls_syn_parent + ls_link_table + ls_link_table_on +  Lower(ls_select_table) + ls_select_table_on + " left join app_facility on(convert(varchar," + Lower(ls_select_table) + "." + ls_select_field + ") = convert(varchar,app_facility.facility_id)) "
//			end if
//			ls_select_field  = "app_facility_" + ls_lu_field
//		ElseIf Upper(ls_db_lookup_type)  = "A" Then //address lookup table		
//			If ls_lu_field = "description"  Then
//				gnv_debug.of_output(true, 'Alarm  Export:' +  "The address lookup field set for export field '" + ls_select_field + "' is improperly set" ) //added by gaivns 20120912
//				MessageBox("Data Error on field " + ls_export_field,"The address lookup field set for export field '" + ls_select_field + "' is improperly set.  You cannot use description, try entity_name.  Please correct.")
//				Close(w_export_progress)
//				
//				Destroy lds_export_flds
//				Destroy lds_export_hdr
//				Destroy lds_address_lookup
//				Destroy lds_code_lookup
//				Destroy lds_export_equiv_code
//				Destroy lds_dataobject
//				Destroy lds_linkto
//				Destroy lds_field
//				Destroy lds_export_dataTemp
//				Destroy lds_tablepk
//				Destroy lds_export_data
//				//<del> 2008-05-04 by:nova
//				//end of add
//				//$<add> 01.07.2008 by: Andy
//				//if lb_ASA7 then gnv_appeondb.of_commitqueue( )
//				Return 0
//				
//			Else
//				If Upper(ls_lu_field) = "LOOKUP_CODE" Then
//					ls_datatype = "N"
//				ElseIf Upper(ls_lu_field) = "CUSTOM_1" Or Upper(ls_lu_field) = "CUSTOM_2" Then //maha 050704 
//					ls_datatype = "N"
//				Else
//					ls_datatype = "C"
//				End If
//				
//				//ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),address_lookup."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from address_lookup," + Lower(ls_select_table) +  ls_use_link_sql + " WHERE " + "(convert(varchar," + Lower(ls_select_table) + "." + ls_select_field + ") = convert(varchar,address_lookup.lookup_code)) and "
//				ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),address_lookup."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//										ls_syn_parent +  ls_link_table + ls_link_table_on +  Lower(ls_select_table) + ls_select_table_on + " left join address_lookup on (convert(varchar," + Lower(ls_select_table) + "." + ls_select_field + ") = convert(varchar,address_lookup.lookup_code)) "
//
//				ls_select_field  = "address_lookup_" + ls_lu_field
//			End If
//		ElseIf ls_db_lookup_type = "X" Then //ToDo:
//			ls_datatype = ldwc_dddw.Describe( ls_lu_field + ".coltype")
//			Choose Case Left ( ls_datatype , 5 )
//				Case "char(", "char"
//					ls_datatype = "C"
//				Case "date"	,"datet"	,"time", "times"
//					ls_datatype = "D"
//				Case "decim","numbe", "doubl", "real","long", "ulong", "int"
//					ls_datatype = "N"
//			End Choose
//			
//			
//			If Upper(ls_datatype) = 'D' Then
//				ls_field_value = " convert(varchar(16)," + ls_dddwtable + "."+ ls_dddw_column_dbname + ",120)"
//			else
//				ls_field_value = " convert(varchar(" + String(li_widthtemp) + ")," + ls_dddwtable + "."+ ls_dddw_column_dbname + ")"
//			end if
//			
//			//ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(16)," + ls_dddwtable + "."+ ls_dddw_column_dbname + ",120) field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + ls_dddwtable + "," + &
//			//		Lower(ls_select_table) +  ls_use_link_sql + " WHERE " + "(" + Lower(ls_select_table) + "." + &
//			//		ls_select_field + " = " + ls_dddwtable + "." + ls_dddwdata + ") and "
//			ls_sny_retrieve = ls_sny_retrieve + ls_field_value+ " field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//									ls_syn_parent + ls_link_table + ls_link_table_on +  Lower(ls_select_table) + ls_select_table_on + &
//									" left join " +ls_dddwtable + " on(" + Lower(ls_select_table) + "." +	ls_select_field + " = " + ls_dddwtable + "." + ls_dddwdata + ") "
//			ls_select_field  = ls_dddwtable + "_" + ls_dddw_column_dbname
//		Else // NON LOOKUP FIELDS
//			ls_datatype = of_get_coltype(lds_dataobject,ls_select_field_ctx) //03.17.2009 by jervis
//						
//			If IsNull(ls_datatype) Then MessageBox("Datatype Not Anticipated","Retrieved null datatype")
//			
//			If Len(ls_aggre) > 0 Then //maha 012703 for aggregate functions
//				//ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + ")," + ls_aggre + "("	+ ls_select_table + "." + ls_select_field + ")) field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + Lower(ls_select_table) +  ls_use_link_sql + " WHERE "
//				ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + ")," + ls_aggre + "("	+ ls_select_table + "." + ls_select_field + ")) field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//										ls_syn_parent + Lower(ls_select_table) + ls_select_table_on
//			Else
//				if Upper(ls_datatype) = "D" then
//					ls_field_value = " convert(varchar(16),"+ ls_select_table + "." +ls_select_field + ",120) "
//				else
//					ls_field_value = " convert(varchar(" + String(li_widthtemp) + "),"+ ls_select_table + "." +ls_select_field + ") "
//				end if
//				If ls_select_table <> 'app_facility' Then
//					//ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(16),"+ ls_select_table + "." +ls_select_field + ",120) field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + Lower(ls_select_table) +  ls_use_link_sql + " WHERE "
//					ls_sny_retrieve = ls_sny_retrieve + ls_field_value + " field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//											ls_syn_parent +ls_link_table + ls_link_table_on +   Lower(ls_select_table) + ls_select_table_on
//				Else
//					//ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(16),"+ ls_select_table + "." +ls_select_field + ",120) field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from ctx_basic_info," + Lower(ls_select_table) +  ls_use_link_sql + " WHERE "
//					ls_sny_retrieve = ls_sny_retrieve + ls_field_value + " field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//											ls_syn_parent + ls_link_table + ls_link_table_on +  " ctx_basic_info " + ls_select_table_on + " left join " + Lower(ls_select_table) + " on(ctx_basic_info.app_facility = app_facility.facility_id)"
//				End If
//			End If
//		End If
//		
//		//export_fields_use_link  sql
//		If li_use_link = 1 Then
//			//If Upper(ls_db_lookup_type) = "A" Or Upper(ls_db_lookup_type) = "C" Then
//			If Upper(ls_db_lookup_type) = "A" Or Upper(ls_db_lookup_type) = "C" or Upper(ls_db_lookup_type) = "X" or Upper(ls_db_lookup_type)  = 'R' Then
//			Else
//				ls_select_field = ls_select_table_trim + "_" + ls_select_field
//			End If
//		End If
//
//		//If ls_select_table <> 'app_facility' Then
//			//modify 08/15/2007 by: Andy
//			If ai_type = 1 Then
//				//ls_sny_retrieve = ls_sny_retrieve + ls_usetable + ".ctx_id  = bb.ctx_id "  + ls_filter
//				ls_sny_retrieve = ls_sny_retrieve + ", (" + ls_prac_sql + ") bb where " + ls_ctx_table + ".ctx_id  = bb.ctx_id and bb.ctx_id > 0 "  + ls_other_where + ls_filter	//jervis 08.26.2009 add bb.ctx_id > 0
//			ElseIf ai_type = 3 Then
//				//ls_sny_retrieve = ls_sny_retrieve + ls_usetable + ".ctx_id " + ls_prac_ids + ls_filter
//				ls_sny_retrieve = ls_sny_retrieve + " where " + ls_ctx_table + ".ctx_id " + ls_prac_ids + ls_other_where + ls_filter
//			ElseIf ai_type = 2 Then
//				If lb_usingdb Then
//					ls_sny_retrieve = ls_sny_retrieve + " Inner Join ic_client_data on (" + ls_ctx_table + ".ctx_id = ic_client_data.data_int and ic_client_data.client_id = '"+ls_client_id+"' ) where 1 = 1 "  + ls_other_where + ls_filter
//				Else
//					ls_sny_retrieve = ls_sny_retrieve + " where " + ls_ctx_table + ".ctx_id  in (" + ls_prac_ids  + ")"  + ls_other_where + ls_filter
//				End If
//				
//			End If
//			//end of modify
//		/*
//		Else
//			//------------------Begin Modified by Alfee on 08.18.2008------------------------------------
//			//<$Reason>Fix a bug of duplicate records while 2 or more contracts have the same company 
//			If ai_type = 1 Then
//				ls_sny_retrieve = ls_sny_retrieve + " ctx_basic_info.app_facility = app_facility.facility_id and ctx_basic_info.ctx_id = bb.ctx_id and " + Lower(ls_select_table) + ".facility_id in (select ctx_basic_info.app_facility from ctx_basic_info where ctx_basic_info.ctx_id  = bb.ctx_id )"  + ls_filter
//			ElseIf ai_type = 3 Then
//				ls_sny_retrieve = ls_sny_retrieve + " ctx_basic_info.app_facility = app_facility.facility_id and ctx_basic_info.ctx_id " + ls_prac_ids + " and " + Lower(ls_select_table) + ".facility_id in (select ctx_basic_info.app_facility from ctx_basic_info where ctx_basic_info.ctx_id " + ls_prac_ids  + " )"  + ls_filter
//			ElseIf ai_type = 2 Then
//				ls_sny_retrieve = ls_sny_retrieve + " ctx_basic_info.app_facility = app_facility.facility_id and ctx_basic_info.ctx_id in (" + ls_prac_ids + ") and " + Lower(ls_select_table) + ".facility_id in (select ctx_basic_info.app_facility from ctx_basic_info where ctx_basic_info.ctx_id  in (" + ls_prac_ids  + "))"  + ls_filter
//			End If
//			//------------------End Modified -------------------------------------------------------------							
//		End If
//		*/
//
//		
//		//2nd last add  - prac where
//		If Len(ls_aggre) > 0 Then //maha 012703 for aggregate functions
//			//modify 08/15/2007 by: Andy
//			ls_sny_retrieve = ls_sny_retrieve + " Group by " + ls_ctx_table + ".ctx_id , FieldSeqID ,  field_data_type" + ls_RowNo
//		End If
//		
//		//modify 08/23/2007 by: Andy
//		If Len(ls_sort) > 0 And Not lb_true Then//SQL2000 only 
//			//ls_sny_retrieve = ls_sny_retrieve + "~r~n order by " + ls_sort 
//			ls_sny_retrieve = ls_sny_retrieve + "~r~n " + ls_sort
//		End If
//		//end of modify
//		
//		//modify 05/05/2008 by: Andy
//		ls_sny_retrieve = ls_sny_retrieve + " ) t" + String(ll_FieldSeqID)
//		
//		
//		//end of add
//		If IsNull(ls_sny_retrieve) Then ls_sny_retrieve = ""
//		If Len(ls_sny_retrieve) > 0 Then
//			If ls_UnionSQL = "" Then
//				ls_UnionSQL = ls_sny_retrieve
//			Else
//				ls_UnionSQL = ls_UnionSQL + "~r~n union all ~r~n" + ls_sny_retrieve
//			End If
//		End If
//		//<add> andy 2007.05.25 
//	Else //computer fields
//		//Dynamic create computer columns in order to Calculate its value
//		/*1.deal with Expression**************/
//		ls_export_field     = lds_export_flds.GetItemString(p,"export_field_name")
//		//<add> 08/24/2007 by: Andy
//		of_replacespecchar(ls_export_field)
//		//end of add
//		ls_Expresstion      = Trim( lds_export_flds.GetItemString( p, "export_fields_expression" ) )//db_field_name
//		ls_ComputerDataType = lds_export_flds.GetItemString(p,"ctx_column_datatype")
//		If IsNull(ls_export_field) Then ls_export_field = ''
//		If IsNull(ls_Expresstion) Then ls_Expresstion = ''
//		If IsNull(ls_ComputerDataType) Then ls_ComputerDataType = ''
//		If IsNull(ls_field_format) Then ls_field_format = ''
//		If IsNull(ls_fld_delim) Then ls_fld_delim = ''
//		ll_Cnt = lds_field.RowCount()
//		
//		//If the computer field is numeric,add the function number(  ) in to the Expresstion.
//		//Replace symbol ' with "
//		//comment 07/18/2007 by:Andy Reason:support other data type
//		//if upper(ls_ComputerDataType) = 'N' then
//		For ll_Num = 1 To ll_Cnt
//			ls_Field         = lds_field.GetItemString(ll_Num,"export_field_name")
//			ls_FieldDataType = lds_field.GetItemString(ll_Num,"ctx_column_datatype")
//			If IsNull(ls_Field) Then ls_Field = ''
//			If IsNull(ls_FieldDataType) Then ls_FieldDataType = ''
//			//<add> 07/27/2007 by: Andy 
//			//Reason:The Expresstion of a computer field cann't contain itself.
//			If Lower(ls_export_field) = Lower(ls_Field) Then Continue
//			//end of add
//			
//			//If the field used in then computer field and is number, 
//			//add the function number(  ) in to the Expresstion 
//			//Modify 07/18/2007 by: Andy
//			If Pos(Lower(ls_Expresstion),Lower(ls_Field)) > 0 Then
//				If Upper(ls_FieldDataType) = 'N' Then
//					//Modify 07/17/2007 by: Andy if( isNull( rec_id  ), 0,  rec_id  )
//					ls_Expresstion  = of_globalreplace( ls_Expresstion, ls_Field, "if( isNull( "+ls_Field+" ),0,number( " + ls_Field + " ))",True)
//					//end of modify
//				ElseIf Upper(ls_FieldDataType) = 'S' Then
//					//string
//					ls_Expresstion  = of_globalreplace( ls_Expresstion, ls_Field, "if( isNull( "+ls_Field+" ),''," + ls_Field + " )",True)
//					//<add> 07/27/2007 by: Andy	
//				ElseIf Upper(ls_FieldDataType) = 'D' Then
//					//Datetime
//					ls_Expresstion  = of_globalreplace( ls_Expresstion, ls_Field, "if( isNull( "+ls_Field+" ),'1900-01-01'," + ls_Field + " )",True)
//					//end of add	
//				End If
//			End If
//			//end of Modify
//		Next
//		//end if
//		
//		//replace symbol ' with "
//		ls_Expresstion  = lnvo_string.of_globalreplace( ls_Expresstion, '~~', '~~~~')
//		ls_Expresstion  = lnvo_string.of_globalreplace( ls_Expresstion, '"', '~~"') //'"'
//		//ls_Expresstion  = lnvo_string.of_globalreplace( ls_Expresstion, "'", "~~'")//'"'
//		/*end of 1***************************/
//		
//		//Modify By Jervis 01.18.2010
//		//Tab and ~ exists bug
//		//ls_tag = ls_field_format + '@^@' + ls_ComputerDataType + '@^@' + String(li_width) + '@^@' + ls_fld_delim
//		ls_tag = ls_field_format + '@^@' + ls_ComputerDataType + '@^@' + String(li_width) + '@^@'
//		If ls_field_format = "Leading Padding" Or ls_field_format = "Trailing Padding" Then
//			ls_tag += ls_fld_delim
//		end if
//		//2.Dynamic create computer columns,the name equal ls_Field + '_c'
//		ls_Modify = "create compute(band=detail alignment='0' expression=~""+ls_Expresstion+"~" border='0' color='33554432' x='1157'" + &
//			" y='4' height='64' width='242' format='[GENERAL]' html.valueishtml='0'  name=" + ls_export_field + "_c visible='0'" + &
//			" font.face='MS Sans Serif' font.height='-8' font.weight='400'  font.family='2' font.pitch='2' font.charset='0'" + &
//			" background.mode='1' background.color='536870912' tag='" + ls_tag + "' )"
//		ls_Err    = lds_export_dataTemp.Modify(ls_Modify)
//		//end of 2		
//		//end of add
//	End If
//Next
////<del> 2008-05-04 by:nova
////<add> 08/23/2007 by: Andy
////if lb_ASA7 then gnv_appeondb.of_commitqueue( )
//
//w_export_progress.hpb_bar.Position = 15
////w_export_progress.r_bar.Width = w_export_progress.r_bar.Width + 50
//w_export_progress.st_export.Text = "Retrieve Data"
//
//ll_FieldCnt = ll_FieldSeqID
//If ls_UnionSQL <> "" Then
//	//Modify 08/23/2007 by: Andy
//	If lb_true Then//SQL2005 and ASA9
//		ls_UnionSQL = ls_UnionSQL + "~r~n order by " + "FieldSeqID, ctx_id , Row_No"
//	End If
//	
//	
//	//<add> 08/24/2007 by: Andy
//	If lb_true Then ls_RowNo = ", 0 Row_No"//SQL2005 AND ASA9
//	ls_SqlSelect = "Select top 1 0 prac_id, 1 FieldSeqID,   cast('' as varchar(" + String(ll_maxwidth) + ")) field_value,  ' ' field_data_type" + ls_RowNo + " from pd_basic"
//	
//	
//	ls_dwsyntax_str = SQLCA.SyntaxFromSQL(ls_SqlSelect, ls_presentation_str, Errors)
//	If Len(Errors) > 0 Then
//		gnv_debug.of_output(true, 'Alarm  Export:' +  "SyntaxFromSQL caused these errors: " + Errors + "~r~r" + ls_SqlSelect  ) //added by gaivns 20120912
//		// + ls_export_field
//		MessageBox("Caution on export field ", &
//			"SyntaxFromSQL caused these errors: " + Errors + "~r~r" + ls_SqlSelect)
//		Close(w_export_progress)
//		Destroy lds_export_flds
//		Destroy lds_export_hdr
//		Destroy lds_address_lookup
//		Destroy lds_code_lookup
//		Destroy lds_export_equiv_code
//		Destroy lds_dataobject
//		Destroy lds_linkto
//		Destroy lds_field
//		Destroy lds_export_dataTemp
//		Destroy lds_tablepk
//		Destroy lds_export_data
//		//end of add
//		Return -1
//	End If
//	
//	lds_export_retrieve = Create n_ds
//	w = lds_export_retrieve.Create( ls_dwsyntax_str, Errors)
//	If w < 1 Then
//		//messagebox("error on create",errors)
//		gnv_debug.of_output(true, 'Alarm  Export:' +  "lds_export_retrieve create  errors: " + Errors  + '~r' + ls_SqlSelect   ) //added by gaivns 20120912
//				MessageBox("Error on Create",Errors)
//		Close(w_export_progress)
//		Destroy lds_export_flds
//		Destroy lds_export_hdr
//		Destroy lds_address_lookup
//		Destroy lds_code_lookup
//		Destroy lds_export_equiv_code
//		Destroy lds_dataobject
//		Destroy lds_linkto
//		Destroy lds_field
//		Destroy lds_export_dataTemp
//		Destroy lds_tablepk
//		Destroy lds_export_data
//		//end of add
//		Return -1
//	End If
//	
//	//Modify 08/23/2007 by: Andy
//	lds_export_retrieve.Modify('DataWindow.Table.Select="' + ls_UnionSQL + '"')
//	
//	
//	lds_export_retrieve.SetTransObject( SQLCA )
//	ll_ret_cnt = lds_export_retrieve.Retrieve()
//	
//	//<add> 05/05/2008 by: Andy
//	If ll_ret_cnt < 0 Then
//		
//		gnv_debug.of_output(true, 'Alarm  Export:' +  "lds_export_retrieve retrieve<0 " + '~r' + ls_UnionSQL  ) //added by gaivns 20120912
//		//Reason:check syntax
//		ls_presentation_str = "style(type=grid)"
//		
//		ls_dwsyntax_str = SQLCA.SyntaxFromSQL(ls_UnionSQL, ls_presentation_str, Errors)
//		If Len(Errors) > 0 Then
//			gnv_debug.of_output(true, "Caution on export: " + "SyntaxFromSQL caused these errors: " + Errors)    //Added By Mark Lee 02/01/2013
//			MessageBox("Caution on export" , &
//				"SyntaxFromSQL caused these errors: " + Errors)
//			Close(w_export_progress)
//			If IsValid(lds_export_flds) Then Destroy lds_export_flds
//			If IsValid(lds_export_hdr) Then Destroy lds_export_hdr
//			If IsValid(lds_address_lookup) Then Destroy lds_address_lookup
//			If IsValid(lds_code_lookup) Then Destroy lds_code_lookup
//			If IsValid(lds_export_data) Then Destroy lds_export_data
//			If IsValid(lds_field) Then Destroy lds_field
//			If IsValid(lds_export_dataTemp) Then Destroy lds_export_dataTemp
//			If IsValid(lds_export_equiv_code) Then Destroy lds_export_equiv_code
//			Destroy lds_tablepk
//			
//			Return -1
//		End If
//	End If
//	//end of add
//End If
//
//w_export_progress.hpb_bar.Position = 20
////Modify 08/22/2007 by: Andy
////li_bar_ticks = 70 / li_prac_id_cnt
//li_bar_ticks = 70 / li_fld_cnt
//
////%%%%%%%%%%%%%%%%%%%%%%%%%%%% end of create syntax
//
//ls_prac_field = lds_export_retrieve.Describe("#1.name")
//
//Do While (ll_i <= ll_ret_cnt)
//
//	ll_j = 0
//	ls_data_value = ""
//	ls_value = ""
//	ls_lookup_val = ""
//	ldt_value = DateTime(Date("0000-00-00"),Time("00:00:00"))
//	
//	ll_pracid       = lds_export_retrieve.GetItemNumber(ll_i,ls_prac_field)
//	ll_FieldSeqID   = lds_export_retrieve.GetItemNumber(ll_i,"FieldSeqID")
//	li_recd_no      = li_recdnoList[ll_FieldSeqID]
//	//add 08/22/2007 by: Andy
//	ls_select_table = ls_tablelist[ll_FieldSeqID]
//	ls_select_field = ls_selectfieldlist[ll_FieldSeqID]
//	ls_export_field = ls_fieldlist[ll_FieldSeqID]
//	ls_field_format = ls_formatList[ll_FieldSeqID]
//	ll_export_code  = ll_exportcodeList[ll_FieldSeqID]
//	//<add> 08/21/2007 by: Andy
//	li_sub_start    = li_substartList[ll_FieldSeqID]
//	//end of add
//	li_width        = li_widthList[ll_FieldSeqID]
//	ls_fld_delim    = ls_flddelimList[ll_FieldSeqID]
//	ls_text         = ls_textList[ll_FieldSeqID]
//	ls_lu_field     = ls_lu_fieldList[ll_FieldSeqID]
//	li_act_format   = li_act_formatList[ll_FieldSeqID]
//	
//	ud = li_udList[ll_FieldSeqID]
//	If ud = 1 Then
//		ls_def_val = ls_defvalList[ll_FieldSeqID]
//	ElseIf ud = 2 Then //column default
//		col = Long(ls_defvalList[ll_FieldSeqID])
//	Else
//		ls_def_val = ""
//	End If
//	
//	//Modify 08/22/2007 by: Andy
//	If ll_FieldSeqIDold <> ll_FieldSeqID Then
//		ll_R = 0
//		//ll_R = lds_export_data.Find("rec_id= " + String(ll_pracid),ll_R + 1,li_prac_id_cnt)
//		ll_FieldSeqIDold = ll_FieldSeqID
//		w_export_progress.st_export.Text  = ls_select_table + "_" + ls_select_field //string(ll_FieldSeqID) + "   " + 
//		w_export_progress.st_export1.Text = ls_select_field
//		
//		//if mod(ll_R,n) = 0 then
//		If Mod(ll_FieldSeqID,n) = 0 Then
//			w_export_progress.hpb_bar.Position = w_export_progress.hpb_bar.Position + 1
//		End If
//		//ll_Rorig = ll_R
//	End If
//	
//	//MODIFY 10/12/2007 by:Andy
//	//ll_R = lds_export_data.Find("rec_id= " + String(ll_pracid),ll_R + 1,li_prac_id_cnt)
//	For ll_R = ll_R + 1 To li_prac_id_cnt
//		If al_ctx_ids[ll_R] = ll_pracid Then Exit
//	Next
//	//end of modify
//	
//	//<ADD> 07/12/2007 by: Andy Find the max row of the current ll_FieldSeqID
//	//modify 08/22/2007 by: Andy Find the max row of the current ll_pracid
//	ls_find = "(" + ls_prac_field + " > " + String(ll_pracid) + " AND FieldSeqID = " + String(ll_FieldSeqID) + &
//		") OR ( FieldSeqID  > " + String(ll_FieldSeqID) + ")"
//	ll_j    = lds_export_retrieve.Find ( ls_find, ll_i + 1, ll_ret_cnt )
//	If ll_j > 0 Then
//		//The max row of the current FieldSeqID
//		ll_j = ll_j - 1
//	End If
//	
//	//Perhaps it is the last ll_pracid and it is the max FieldSeqID,
//	//then set ll_j = ll_ret_cnt(max row in the ds)
//	If ll_j = 0 Then
//		ll_j = ll_ret_cnt
//	End If
//	
//	//max - min + 1 = total(current FieldSeqID)
//	If ll_j - ll_i + 1 >= li_recd_no Then
//		//find out
//		ll_prac_row = ll_i + li_recd_no - 1
//	Else
//		//Not 
//		ll_prac_row = 0
//	End If
//	//END OF addd
//	
//	//process data
//	If ll_prac_row > 0 Then
//		ls_datatype     = lds_export_retrieve.GetItemString(ll_prac_row, "field_data_type" )
//		
//		//if li_billing = 1 then //maha app080205 to get billing address data 
//		//	ll_billing_id   = lds_export_retrieve.getitemnumber(ll_prac_row, "billing_address_id" )
//		//	ls_data_value = of_get_billing(ll_billing_id,ls_datatype,ls_select_field,ls_field_format,ls_billsynList[ll_FieldSeqID])//ls_bill_syn
//		//else
//		ls_data_value = lds_export_retrieve.GetItemString(ll_prac_row, "field_value")
//		//end if
//	Else
//		//do nothing
//	End If
//	
//	//comment 08/24/2007 by: Andy
//	//ls_export_field = lnvo_string.of_globalreplace( ls_export_field, "#", "_")
//	//<add> andy 07.05.2007 save original values
//	If Lower(lds_export_dataTemp.Describe(ls_export_field + ".name")) = Lower(ls_export_field) Then
//		lds_export_dataTemp.SetItem(ll_R,ls_export_field,ls_data_value)
//	End If
//	//end of add
//	
//	If ls_format = "export" Then
//		If IsNull(ls_data_value) Then ls_data_value = ""
//	End If
//	
//	//<add> 08/28/2007 by: Andy
//	of_data_format(ls_field_format,ls_datatype,ls_data_value)
//	//end of add
//	
//	
//	//$<add> 05.29.2007 By: Jack
//	//$<reason> Fix a defect.
//	If ls_lu_field = 'contact_department' Or ls_lu_field = 'contact_title' Or ls_lu_field = 'contact_type' Then
//		//modify 09/05/2007 by: Andy Reason:get description
//		//ls_data_value = gnv_data.of_getitem('code_lookup', 'code', "lookup_code = " + ls_data_value)
//		ls_data_value = gnv_data.of_getitem('code_lookup', 'description', "lookup_code = " + ls_data_value)
//	End If
//	
//	//*****GET EXPORT CODES
//	//if lds_export_flds.GetItemnumber( p, "export_code" )  = 1 then //get export code if required
//	If ll_export_code  = 1 Then //get export code if required
//		ls_lookup_val = ls_data_value    //lds_export_data.getitemstring(i,p) //changed 100102
//		If IsNull(ls_lookup_val) Then ls_lookup_val = ''
//		
//		//Convert data type - jervis 03.25.2011
//		if isnumber(ls_lookup_val) then 
//			ls_lookup_code = string(long(ls_lookup_val))
//		else
//			ls_lookup_code = ls_lookup_val
//		end if
//		//ll_find = lds_export_equiv_code.Find( "export_id = " + String(ai_export_id) + " and lookup_code = " + ls_lookup_val, 1, ll_rowcount2 )
//		ll_find = lds_export_equiv_code.Find( "export_id = " + String(ai_export_id) + " and (string(lookup_code) = '" + ls_lookup_code + "' or code = '" + string(ls_lookup_val) + "')", 1, ll_rowcount2 ) //Add code -- jervis 03.25.2011
//		
//		
//		If ll_find > 0 Then
//			ls_value = lds_export_equiv_code.GetItemString(ll_find,'equiv_code')
//		End If
//		
//		If Not IsNull(ls_value) And Trim(ls_value) <> '' Then ls_data_value = ls_value //if no export code use org value
//		If IsNull(ls_data_value) Then ls_data_value = ""
//	End If
//	
//	
//	
//	//<add> 08/22/2007 by: Andy
//	If ls_strip_char <> "NONE" Then
//		ls_data_value = of_strip_char( ls_strip_char ,ls_data_value, "")
//	End If
//	
//	//*** substring function***************************8
//	//create datafield for substring_start
//	//<add> 08/21/2007 by: Andy
//	If li_sub_start > 1 Then ls_data_value = Mid(ls_data_value,li_sub_start,li_width)
//	//end of add
//	//***padding //note if avoid using return, double return, empty string or tab when padding
//	ls_data_value = Mid(ls_data_value,1,li_width) //shrink the length to size 
//	If ls_field_format = "Leading Padding" Or ls_field_format = "Trailing Padding" Then
//		If li_width - Len(ls_data_value) > 0 Then
//			li_dif = li_width - Len(ls_data_value)
//			ls_pad = "" //reset
//			ls_pad = Fill ( ls_fld_delim, li_dif )
//			If ls_field_format = "Leading Padding" Then
//				ls_data_value = ls_pad + ls_data_value
//			Else
//				ls_data_value = ls_data_value + ls_pad
//			End If
//		End If
//	ElseIf ls_field_format = "use text" Then //allows a set value if data is found
//		If Len(ls_data_value) > 0 Then
//			ls_data_value = ls_text
//		End If
//	End If
//	
//	//****set default moved here 091305
//	If ud > 0 Then
//		If IsNull(ls_data_value) Then ls_data_value = ""
//		
//		If ls_data_value = "" Then
//			If ud = 1 Then
//				ls_data_value = ls_def_val
//			ElseIf ud = 2 Then //if set to column get the value out of that column
//				If col < 1 Or col > li_fld_cnt Then //setting trap
//					gnv_debug.of_output(true, 'Alarm  Export:' +  "You are using a column default for column " + ls_export_field + " , but your default value is not a valid column number.~rThe default column number must be less than this column." ) //added by gaivns 20120912
//					MessageBox("Invalid setting","You are using a column default for column " + ls_export_field + " , but your default value is not a valid column number.~rThe default column number must be less than this column.")
//					Close(w_export_progress)
//					Destroy lds_export_flds
//					Destroy lds_export_hdr
//					Destroy lds_address_lookup
//					Destroy lds_code_lookup
//					Destroy lds_export_equiv_code
//					Destroy lds_dataobject
//					Destroy lds_linkto
//					Destroy lds_field
//					Destroy lds_export_dataTemp
//					Destroy lds_tablepk
//					Destroy lds_export_data
//					//end of add
//					Return 0
//				End If
//				ls_data_value = lds_export_data.GetItemString(ll_R,col)
//			End If
//		End If
//	End If
//	
//	//*********value set**********	
//	If li_fld_cnt = 1 Then ls_data_value = ls_data_value + Char(9)
//	If Lower(lds_export_data.Describe(ls_export_field + ".name")) = Lower(ls_export_field) Then
//		//Begin - Added By Mark Lee 09/29/12 its cannot use double quote to merge data values in  the MS word.
//		If Pos(ls_data_value,'"') > 0 Then 
//			gnv_debug.of_output(true, 'Alarm  Export: Its used the double quote Replace the blank data in merged data value on the column ['+ls_export_field+'], and this current data value is the ['+ls_data_value+'].' )
//			ls_data_value  = lnvo_string.of_globalreplace( ls_data_value, '"', ' ')
//		End If
//		//End - Added By Mark Lee 09/29/12
//		lds_export_data.SetItem(ll_R,ls_export_field,ls_data_value)
//	End If
//	
//	//processing the next field(fieldseqid)
//	ll_i = ll_j + 1
//Loop
//
////<add> 08/27/2007 by: Andy process default value
//If of_export_processdefault(lds_export_hdr,lds_export_flds,lds_export_dataTemp,lds_export_data) = -1 Then
//	gnv_debug.of_output(true, 'Alarm  Export: of_export_processdefault=-1 ' )//added by gavins 20120912
//	Close(w_export_progress)
//	Destroy lds_export_flds
//	Destroy lds_export_hdr
//	Destroy lds_address_lookup
//	Destroy lds_code_lookup
//	Destroy lds_export_equiv_code
//	Destroy lds_dataobject
//	Destroy lds_linkto
//	Destroy lds_field
//	Destroy lds_export_dataTemp
//	Destroy lds_tablepk
//	Destroy lds_export_data
//	Return 0
//End If
////end of add
//
////<add> andy 2007.05.25
////set Calculated field value and format into lds_export_data 
////with the relative computer column in lds_export_dataTemp
////Modify 08/22/2007 by: Andy
//of_export_calculatedfield(lds_export_dataTemp,lds_export_data,ls_format)
////end of add
//
//w_export_progress.hpb_bar.Position = 94
//
////Modify 07/18/2007 by: Andy
////if ai_save_data = 1 then //maha 021003
////1:save / 3:save & preview
//If ai_save_data = 1 Or ai_save_data = 3 Then
//	//end of modify
//	w_export_progress.st_progress.Text = "Saving File"
//	
//	//gnv_appeondb.of_autocommit()
//	sd = lds_export_data.Update()
//	Commit Using SQLCA;
//	
//	If sd < 1 Then
//		gnv_debug.of_output(true, 'Alarm  Export: lds_export_data update failed ' )//added by gavins 20120912
//		MessageBox("Save error","Unable to save data to table")
//	End If
//End If
//
////Begin - Added By Mark Lee 07/23/2013. update the sqltext
//of_update_export_sqltext(ai_export_id,ls_prac_sql,ls_UnionSQL)
////End - Added By Mark Lee 07/23/2013.
////-----------------------------------------------------------------------/
//ids_export_data = lds_export_data
//If ids_export_data.Rowcount( ) = 0 Then
//	gnv_debug.of_output(true, 'Alarm  Export: lds_export_data rowcount()=0 '  )//added by gavins 20120912
//Else
//	ib_writefile = true //added by gavins 20121011
//End If
////-----------------------------------------------------------------------/
//
//w_export_progress.st_progress.Text = "Creating File"
//w_export_progress.hpb_bar.Position = 100
//li_bar_ticks = 75 / li_prac_id_cnt
//n = Int(li_fld_cnt/80) + 1
////******************************* CREATE FILE
//
////Modify 08/28/2007 by: Andy
////If IsNull(as_path) Or as_path = "" Then
////	If IsNull(ls_save_path) Or ls_save_path = "" Then ls_save_path = gs_dir_path + gs_DefDirName + "\" + ls_table_name
////Else
//ls_save_path = as_path
//If Right(ls_save_path,1) = ':' Then ls_save_path = ls_save_path + "\"
//ll_LastPos = LastPos(ls_save_path,'.')
//If ll_LastPos > 0 Then
//	ls_save_path = Left(ls_save_path,ll_LastPos - 1)
//End If
////End If
//
////--------------------------- APPEON BEGIN ---------------------------
////$<add> 05.23.2007 By: Jack
////$<reason> If the directory is not exists Then create it 
//String ls_path1
//If Mid(ls_save_path,Len(ls_save_path),1) = "\" Then
//	ls_path1 = ls_save_path
//Else
//	ls_path1 = Mid(ls_save_path,1,LastPos(ls_save_path,'\'))
//End If
////Add By Jervis 11-19-2008
//If ls_path1 = "" Then
//	If appeongetclienttype() = 'WEB' Then
//		ls_path1 = gs_dir_path + gs_DefDirName + "\ExportData\"
//		ls_save_path = ls_path1 + ls_save_path
//	Else
//		ls_path1 = Gs_Current_Directory + "\ExportData\"
//		ls_save_path = ls_path1 + ls_save_path
//	End If
//Else
//	
//	//Added By Ken.Guo 2011-01-11.
//	If invo_rights.of_check_dir_right(ls_path1, True,'Export') <> 1 Then
//		gnv_debug.of_output(true, 'Alarm  Export: check dir right failed '  + ls_path1 )//added by gavins 20120912
//		If isvalid(lds_export_flds) Then Destroy lds_export_flds;
//		If isvalid(lds_export_hdr) Then Destroy lds_export_hdr;
//		If isvalid(lds_address_lookup) Then Destroy lds_address_lookup;
//		If isvalid(lds_code_lookup) Then Destroy lds_code_lookup
//		If isvalid(lds_export_equiv_code) Then Destroy lds_export_equiv_code;
//		If isvalid(lds_dataobject) Then Destroy lds_dataobject
//		If isvalid(lds_linkto) Then Destroy lds_linkto;
//		If isvalid(lds_field) Then Destroy lds_field
//		If isvalid(lds_export_dataTemp) Then Destroy lds_export_dataTemp
//		If isvalid(lds_tablepk) Then Destroy lds_tablepk
//		If isvalid(w_export_progress) Then Close(w_export_progress)		
//		Return 0
//		//ls_path1 = gs_dir_path + gs_DefDirName + "\ExportData\"
//		//ls_save_path = ls_path1
//	End If
//	
//End If
////End By Jervis 
//
//gnv_appeondll.of_parsepath(ls_path1)
//
////---------------------------- APPEON END ----------------------------
//
//If Mid(ls_save_path,Len(ls_save_path),1) <> "\" Then //maha app 102405 if a file name is indicated do not tack on the table name
//	ls_path = ls_save_path +  ls_format
//Else
//	//ls_path = ls_save_path + ls_table_name + ls_format
//	If li_custom_save > 0 Then  //maha new 121205 for custom naming of file
//		ls_save_name = of_custom_name(li_custom_save,ls_table_name,ldt_date)
//	Else
//		ls_save_name = ls_table_name
//	End If
//	ls_path = ls_save_path + ls_save_name + ls_format
//End If
//
////<add> 08/28/2007 by: Andy 
//as_path = ls_path
////end of add
//
////$<modify> 03.20.2008 by Andy
////If ls_format <> "export" Then  //if the auto export path is blank use the export path, if blank use the hard coded path
//If lb_export = False Then
//	//end of modify 03.20.2008
//	gnv_rights.of_check_dir_right( ls_path, true, 'Export')
//	Choose Case ls_format
//		Case ".txt"
//			If ls_header = "1" Then
//				g = lds_export_data.SaveAs(ls_path,Text!,True)
//			Else
//				g = lds_export_data.SaveAs(ls_path,Text!,False)
//			End If
//		Case ".xls"
//			If ls_header = "1" Then
//				g = lds_export_data.SaveAs(ls_path,excel!,True)
//			Else
//				g = lds_export_data.SaveAs(ls_path,excel!,False)
//			End If
//		Case ".csv"
//			If ls_header = "1" Then
//				g = lds_export_data.SaveAs(ls_path,csv!,True)
//			Else
//				g = lds_export_data.SaveAs(ls_path,csv!,False)
//			End If
//	End Choose
//	If g = -1 Then MessageBox("saveas -1","Unable to save file.  Check path (" + ls_path + ") and make sure a copy of the file is not open.")
//Else
//	//build export text file
//	//modify 08/28/2007 by: Andy
//	//li_file_num = FileOpen(as_path + ls_table_name + ".txt", lineMode!, Write!, LockWrite!, Replace!)//maha changed to line mode 091002
//	li_file_num = FileOpen(ls_path, lineMode!, Write!, LockWrite!, Replace!)//maha changed to line mode 091002
//	//end of modify
//	w_export_progress.hpb_bar.Position = 10
//	For i = 1 To li_prac_id_cnt
//		//w_export_progress.hpb_bar.position = w_export_progress.hpb_bar.position + li_bar_ticks
//		If Mod(i,n) = 0 Then
//			w_export_progress.hpb_bar.Position = w_export_progress.hpb_bar.Position + 1
//		End If
//		For p = 1 To li_fld_cnt
//			ls_data_value = lds_export_data.GetItemString(i,p)
//			ls_fld_delim = lds_export_flds.GetItemString( p, "trailing_leading_characters")
//			ls_field_format = lds_export_flds.GetItemString(p,"export_format")
//			Choose Case ls_fld_delim
//				Case "E" //empty String
//					ls_delim_value = ""
//				Case "S" // space
//					ls_delim_value = " "
//				Case "T" //tab
//					ls_delim_value = "	"
//				Case "R" //return
//					ls_delim_value = "~r"
//				Case "D" //return
//					ls_delim_value = "~r~r"
//				Case Else
//					ls_delim_value = ls_fld_delim
//			End Choose
//			If IsNull(ls_delim_value) Then ls_delim_value = ""
//			If ls_field_format = "Leading Padding" Or ls_field_format = "Trailing Padding" Then //don't add delimit value
//				ls_export_text_file = ls_export_text_file + ls_data_value
//			Else
//				ls_export_text_file = ls_export_text_file + ls_data_value + ls_delim_value
//			End If
//			
//		Next
//		ls_export_text_file = ls_export_text_file + ls_rec_delim
//		p = 1
//		FileWrite ( li_file_num, ls_export_text_file)
//		ls_export_text_file = ""
//	Next
//	FileClose(li_file_num)
//End If
////--------------------------- APPEON BEGIN ---------------------------
////$<add> 05.11.2007 By: Jack
////$<reason> Fix a defect.
//ids_export_data = lds_export_data
////---------------------------- APPEON END ----------------------------
//
//If is_called_type <> "2" And IsValid(w_export_progress) Then
//	w_export_progress.hpb_bar.Position = 100
//	If isvalid(w_export_progress) Then Close(w_export_progress)
//End If
//
////<add> 07/18/2007 by: Andy
////2:preview / 3:save & rpeview
//If ai_save_data = 2 Or ai_save_data = 3 Then
//	lstr_pass.s_string = is_select_syntax
//	lstr_pass.s_ds = lds_export_data
//	lstr_pass.s_string_array[1] = ls_UnionSQL
//	OpenWithParm( w_export_previewdata, lstr_pass )
//End If
////end of add
//
//
////$<add> 05.07.2008 by Andy
//If lb_mulsel Then
//	ls_MySQL = "DELETE FROM export_temp WHERE SpID = " + String(ll_SpID) + ";"
//	Execute Immediate :ls_MySQL;
//End If
//
//If isvalid(lds_export_flds) Then Destroy lds_export_flds;
//If isvalid(lds_export_hdr) Then Destroy lds_export_hdr;
//If isvalid(lds_address_lookup) Then Destroy lds_address_lookup;
//If isvalid(lds_code_lookup) Then Destroy lds_code_lookup
//If isvalid(lds_export_equiv_code) Then Destroy lds_export_equiv_code;
//If isvalid(lds_dataobject) Then Destroy lds_dataobject
//If isvalid(lds_linkto) Then Destroy lds_linkto;
//If isvalid(lds_field) Then Destroy lds_field
//If isvalid(lds_export_dataTemp) Then Destroy lds_export_dataTemp
//If isvalid(lds_tablepk) Then Destroy lds_tablepk
//If isvalid(w_export_progress) Then Close(w_export_progress)
//
//Return 1
//

return of_export_data_with_text_ctx( ai_export_id, al_ctx_ids, as_path,ai_save_data,as_param1, as_param2, as_param3, ai_type,as_sql, false)
end function

public function string of_get_coltype (datastore ads_object, string as_name);//Add function by Jervis 03.17.2009

string ls_datatype

//Get Column Type
ls_datatype = ads_object.Describe( as_name + ".coltype")
Choose Case Left ( ls_datatype , 5 )
	Case "char(", "char"
		ls_datatype = "C"
	Case "date"	,"datet"	,"time", "times"
		ls_datatype = "D"
	Case "decim","numbe", "doubl", "real","long", "ulong", "int"
		ls_datatype = "N"
End Choose
return ls_datatype
end function

public subroutine of_export_update_table_name ();
end subroutine

public subroutine of_update_export_sqltext (long al_export_id, string as_sql_param, string as_union_sql);//====================================================================
// Function: of_update_export_sqltext
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value    long      al_export_id
// 	value    string    as_sql_param
// 	value    string    as_union_sql
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:	Mark Lee		Date: 07/23/2013
//--------------------------------------------------------------------
//	Copyright (c) 2008-2013 Contract Logix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
n_cst_string		ln_cst_string
string 			ls_sql_text
Blob				lblob_sql

ls_sql_text = ln_cst_string.of_globalreplace( as_union_sql, as_sql_param, "(***)")
If not isnull(ls_sql_text) and trim(ls_sql_text) <> '' and 	pos(ls_sql_text, "(***)"	) > 0	and ib_standard = true Then 
	ib_standard = false
	lblob_sql = Blob(ls_sql_text)
	 UPDATEBLOB export_header SET sql_text = :lblob_sql
	 WHERE export_id = :al_export_id ;
	 
	 IF SQLCA.SQLCODE <> 0 THEN 
		gnv_debug.of_output(true, 'Update Export Sql_text::  export_id:'+string(al_export_id)+";user:"+gs_user_id+";error:"+ sqlca.sqlerrtext) 
		RETURN 
	END IF
	
End IF 
end subroutine

public function integer of_update_export_data (long al_export_id);
//Modified By Ken.Guo 2016-03-11
str_export_columns lstr_export_columns
Return of_update_export_data(al_export_id, lstr_export_columns)


////====================================================================
//// Function: of_update_export_data
////--------------------------------------------------------------------
//// Description:
////--------------------------------------------------------------------
//// Arguments:
//// 	value    long    al_export_id
////--------------------------------------------------------------------
//// Returns:  integer
////--------------------------------------------------------------------
//// Author:	Mark Lee		Date: 11/29/2013
////--------------------------------------------------------------------
////	Copyright (c) 2008-2013 Contract Logix, All rights reserved.
////--------------------------------------------------------------------
//// Modify History:
////	d_contract_dw_sql_all
////====================================================================
//n_ds 		ds_export_table_name,	ds_export, ds_export_filter,	ds_contract_screen
//long		i , ll_cnt, ll_rowcount, ll_screen_id, ll_view_id, ll_count,	ll_find
//String 	ls_table_name, ls_dataobject,  ls_tab_name, ls_view
//u_dw 		ldw[]
//string 	ls_dw_name[] , ls_dataobjects[]
//u_dw		ldw_screen 
//Integer 	li_return
//string 	 ls_export_name,	ls_err
//
//ls_err =''
//li_return = 0
//ll_count  = 0 
//If isnull(al_export_id) or al_export_id <= 0 Then 
//	return -1
//End If
//
//ds_export = Create n_ds
//ds_export.dataobject = 'ds_export_fields_for_request'
//ds_export.settransobject(Sqlca)
//
//ds_export_filter = Create n_ds
//ds_export_filter.dataobject = 'ds_export_fields_for_request'
//ds_export_filter.settransobject(Sqlca)
//
//ds_export_table_name = Create n_ds
//ds_export_table_name.dataobject = 'd_ctx_screen_for_export_fields'
//ds_export_table_name.settransobject(Sqlca)
//
//ds_contract_screen = create n_ds
//ds_contract_screen.dataobject = 'd_contract_dw_sql_all'
//ds_contract_screen.SetTransObject(SQLCA)
//
//gnv_appeondb.of_startqueue( )
//ds_export.retrieve(al_export_id)
//ds_export_table_name.retrieve( 1001, al_export_id)
//Select view_id, export_name Into :ll_view_id, :ls_export_name
//From export_header
//WHERE  export_header.export_id = :al_export_id ;
//
//Select Count(1) Into :ll_count
//from export_fields	where export_id = :al_export_id and ctx_scrn_id in (2001,2002,2003,2004) ;
//
//gnv_appeondb.of_commitqueue( )
//
//If isnull(ll_view_id) then ll_view_id = 1001
//ds_export.sharedata( ds_export_filter)
//IF ds_export.rowcount( ) > 0 then 
//	ll_rowcount = ds_export.rowcount( )
//	ll_cnt = ds_export_table_name.rowcount( )		
//	
//	//Added By Mark Lee 12/05/2014
//	ds_contract_screen.Retrieve(ll_view_id)
//	
//	If isvalid(w_hide) Then
//		Close(w_hide)
//	End If
//	Open(w_hide)
//										
//	For i = 1 to ll_cnt
//		ls_dataobject  =  ds_export_table_name.GetItemString(i, 'dataobject') 
//		ls_table_name = ds_export_table_name.GetItemString(i,'table_name')
//		ll_screen_id = ds_export_table_name.GetItemNumber(i,'screen_id')
//		
//		//Added By Mark 07/02/2014
//		if of_exists_export_table(ls_table_name) = false then 
//			continue
//		end if 
//		//create the screen
//		IF ls_dataobject = 'd_contract_det_contact_external' Then
//			If not isvalid(ldw_screen ) then 
//				ldw_screen = Create u_dw					
//			End if 
//			ldw_screen.dataobject = ls_dataobject
//			ldw_screen.Settransobject( sqlca)
//		Else
//			ldw_screen =	w_hide.dw_1
//			ls_tab_name = gnv_data.of_get_table_name( ll_screen_id, 'C', 'tab_name')
//			ldw[1] = ldw_screen
//			ls_dw_name[1] 	= gnv_data.of_get_table_name( ll_screen_id, 'C', 'dw_name')
//			ls_dataobjects[1] 	= ls_dataobject //gnv_data.of_get_table_name( long(data), 'C', 'dataobject')
//			ll_find = ds_contract_screen.find(	" dw_name = " + "'" + ls_dw_name[1] + "'" + " and  ( dataobject = " + "'" + ls_dataobject + "' or grid_dataobject='" + ls_dataobject + "' )" , 1, ds_contract_screen.rowcount( ) )
//			if ll_find > 0 then			
//				f_create_contract_dw(ll_view_id,ls_tab_name,ldw,ls_dw_name,ls_dataobjects)				//create the dw screen
//			else
//				//Added By Mark Lee 12/05/2014
//				ls_view = gnv_data.of_getitem( "data_view", "data_view_name"," data_view_id="+string(ll_view_id))
//				Messagebox(gnv_app.iapp_object.DisplayName,"The current table ("+ls_table_name+") does not exist in the "+ls_view+" view. ~r~nPlease change the view or delete the column definitions for the table ("+ls_table_name+") in the export "+ls_export_name+", then continue your operation." )
//				return -1
//			end if 
//		End If
//				
//		of_update_export_data_part(ll_screen_id,ls_table_name,ls_dataobject,ldw_screen,ds_export,ds_export_filter)		
//
//	Next 
//	
//	//regular screen
//	if ll_count > 0 then 
//		For i = 1 to 4
//			ll_screen_id = 2000 + i
//			choose case ll_screen_id
//				case 2001
//					ls_table_name = "ctx_contacts"
//					ls_dataobject = "d_cntx_master"
//				case 2002
//					ls_table_name = "ctx_contacts_numbers"	
//					ls_dataobject =  "d_cntx_phone"						
//				case 2003
//					ls_table_name = "app_facility"						
//					ls_dataobject =  "d_facility_detail"						
//				case 2004
//					ls_table_name = "sys_statusaudit"						
//					ls_dataobject =  "d_export_status_track"						
//			end choose 
//					
//			If not isvalid(ldw_screen ) then 
//				ldw_screen = Create u_dw					
//			End if 
//			ldw_screen.dataobject = ls_dataobject
//			ldw_screen.Settransobject( sqlca)
//				
//			of_update_export_data_part(ll_screen_id,ls_table_name,ls_dataobject,ldw_screen,ds_export,ds_export_filter)				
//		Next 
//	end if 
//	
//	If isvalid(w_hide) Then
//		Close(w_hide)
//	End If
//	if isvalid(ldw_screen) then 
//		Destroy ldw_screen
//	End if 
//	
//	//update 
//	If ds_export.modifiedcount() > 0 Then 
//		li_return	=	ds_export.update( )
//	End IF 
//End If
//
//destroy 	ds_export
//destroy	ds_export_filter
//destroy 	ds_export_table_name
//destroy 	ds_contract_screen
////if trim(ls_err) <> '' or len(ls_err) > 0 then 
////	ls_err = ls_err+ " from the export "+ls_export_name+" do not exist on the current screen, ~r~nso you cannot make them Visible in Request Form Painter."
////	Messagebox(gnv_app.iapp_object.DisplayName,ls_err)
////end if 
//
//return li_return
//
end function

public function integer of_run_export (long al_export_id, string as_path, string as_prac_sql, long al_type);Return of_run_export(al_export_id,as_path,as_prac_sql,al_type, false) //Modified By Ken.Guo 2016-11-23

////====================================================================
//// Function: of_run_export
////--------------------------------------------------------------------
//// Description:
////--------------------------------------------------------------------
//// Arguments:
//// 	value    long      al_export_id
//// 	value    string    as_path
//// 	value    string    as_prac_sql
//// 	value    long      al_type
////--------------------------------------------------------------------
//// Returns:  integer
////--------------------------------------------------------------------
//// Author:	Mark Lee		Date: 08/05/2013
////--------------------------------------------------------------------
////	Copyright (c) 2008-2013 Contract Logix, All rights reserved.
////--------------------------------------------------------------------
//// Modify History:
////
////====================================================================
//String 		ls_presentation_str, ERRORS,	ls_dwsyntax_str, ls_temp
//n_ds			lds_export_retrieve
//Long			i, ll_prac_row, prac_ids[], ll_pos, ll_pracid, ll_pracidold, ll_Num, ll_return
//Boolean		lbn_flag 
//
//
//IF isnull(as_prac_sql) or trim(as_prac_sql) = "" then
//	as_prac_sql = "Select distinct ctx_id from ctx_basic_info "
//	lbn_flag = false
//Else
//	lbn_flag = true
//	ll_pos = pos(lower(as_prac_sql)," from ")
//	ls_temp = Left(as_prac_sql,ll_pos - 1)
//	if al_type = 3 or al_type = 4 then		
//		if pos(lower(ls_temp), "ctx_id") < 1 then
//			gnv_debug.of_output(true, ' Export_apb:of_run_export();The Contract Retrieval SQL must contain the ctx_id column.' + ' ai_export_id=' + string( al_export_id )+ "; type=" + string(al_type))
//			RETURN -1
//		end if
//	else
//		if pos(lower(ls_temp), "prac_id") < 1 then
//			gnv_debug.of_output(true, ' Export_apb:of_run_export();The Contract Retrieval SQL must contain the prac_id column.' + ' ai_export_id=' + string( al_export_id )+ "; type=" + string(al_type))
//			RETURN -1
//		end if		
//	end if
//End If			
//
//ls_presentation_str = "style(type=grid)"		
//ls_dwsyntax_str = SQLCA.SyntaxFromSQL(as_prac_sql, ls_presentation_str, ERRORS)
//IF Len(ERRORS) > 0 THEN
//	gnv_debug.of_output(true, ' Export_apb:of_run_export();' + ' ai_export_id=' + string( al_export_id )+ "; type=" + string(al_type)+";~r~n SyntaxFromSQL caused these errors: " + ERRORS)
//	RETURN -1
//END IF
//	
//lds_export_retrieve = CREATE n_ds
//lds_export_retrieve.Create( ls_dwsyntax_str, ERRORS)
//lds_export_retrieve.SetTransObject( SQLCA )
//ll_prac_row = lds_export_retrieve.retrieve()
//if ll_prac_row < 1 then 
//	gnv_debug.of_output(true, ' Export_apb:of_run_export();No contract rows returned.' + ' ai_export_id=' + string( al_export_id )+ "; type=" + string(al_type))
//	if IsValid(lds_export_retrieve) then destroy lds_export_retrieve
//	return -2
//end if
//
//lds_export_retrieve.Setsort( "#1 A")
//lds_export_retrieve.Sort()
//
//If lbn_flag = false Then 
//	for i = 1 to ll_prac_row
//		prac_ids[i] = lds_export_retrieve.getitemnumber(i,1)
//	next
//Else
//	for i = 1 to ll_prac_row
//		ll_pracid   = lds_export_retrieve.getitemnumber(i,1)
//		if ll_pracid <> ll_pracidold and ll_pracid > 0 then 
//			ll_Num ++
//			prac_ids[ll_Num] = ll_pracid
//			ll_pracidold= ll_pracid
//		end if
//	next
//End If
//
//this.ib_gen_rec_id = False 
//if al_type = 3 or al_type = 4 then
//	ll_return = this.of_export_data_with_text_ctx( al_export_id, prac_ids,as_path,0,"","","",1,as_prac_sql )
//else
//	ll_return = this.of_export_data_with_text( al_export_id, prac_ids,as_path,0,"","","",1,as_prac_sql)	
//end if
//destroy lds_export_retrieve
//
//IF ll_return > 0 THEN
//	return 1;
//ELSE
//	return ll_return;
//END IF
//
end function

public function integer of_export_data_with_text_ctx (integer ai_export_id, long al_ctx_ids[], ref string as_path, integer ai_save_data, string as_param1, string as_param2, string as_param3, integer ai_type, string as_sql, boolean abn_update_sqltext);//Commented by Jay Chen 07-09-2014 overwrite
return of_export_data_with_text_ctx( ai_export_id, al_ctx_ids, as_path,ai_save_data,as_param1, as_param2, as_param3, ai_type,as_sql, abn_update_sqltext, false)

////====================================================================
//// Function: of_export_data_with_text_ctx
////--------------------------------------------------------------------
//// Description: The code copy from of_export_data_with_text_ctx() funcation.
////					Add param abn_update_sqltext for update the export sqltext.
////--------------------------------------------------------------------
//// Arguments:
//// 	value        integer    ai_export_id
//// 	value        long       al_ctx_ids[]
//// 	reference    string     as_path
//// 	value        integer    ai_save_data
//// 	value        string     as_param1
//// 	value        string     as_param2
//// 	value        string     as_param3
//// 	value        integer    ai_type
//// 	value        string     as_sql
//// 	value        boolean    abn_update_sqltext
////--------------------------------------------------------------------
//// Returns:  integer
////--------------------------------------------------------------------
//// Author:	Mark Lee		Date: 09/29/2013
////--------------------------------------------------------------------
////	Copyright (c) 2008-2013 Contract Logix, All rights reserved.
////--------------------------------------------------------------------
//// Modify History:
////
////====================================================================
//
////<optimization> by Andy 07/12/2007
//SetPointer( HourGlass! )
//ib_writefile = false //added by gavins 20121011
//If IsNull(as_path) Or as_path = "" Then
//	MessageBox("Data Error", "There is no save path for this file. Unable to continue this function.")
//	Return 0
//End If
//
//If ai_export_id < 1 Then
//	//MessageBox("User Error", "No export selected.  Unable to continue this function.")
//	MessageBox("User Error", "No export selected.  Unable to proceed.")
//	Return 0
//End If
//
//Open(w_export_progress)
//if abn_update_sqltext = true  then 
//	gnv_Status_Info.of_display("Updating the export syntax...")
//end if 
//yield()	//				//Added By Mark Lee 09/30/2013 APB bug.
//
////Start code changes 2.6.2007 Henry
//If is_called_type = '1' Then
//	w_export_progress.Title = 'Merge Data Process'
//	is_called_type = '0'
//ElseIf is_called_type = '2' Then // Rodger wu Added.
//	w_export_progress.Title = 'Merge Data Process'
//	w_export_progress.st_6.Text = "Progress of building data"
//	
//	w_export_progress.st_merge.Visible = True
//	w_export_progress.hpb_1.Visible = True
//	//	w_export_progress.height = 1100
//End If
////End code change 2.6.2007
//
//w_export_progress.st_progress.Text = "Creating export table"
//
//If of_create_export_table( ai_export_id,ai_save_data ) < 0 Then
//	gnv_debug.of_output(true, 'Alarm Replace Export:of_create_export_table<0' + ' ai_export_id=' + string( ai_export_id ) + ' ai_save_data=' + string( ai_save_data ) )//added by gavins 20120912
//	Close(w_export_progress)
//	Return 0
//End If
//
////Boolean lb_table_found
////Long ll_fld_val
//Long   li_prac_id_cnt,  g, w, sd, i,n,p
//
//Long ll_find_no,  ll_rowcount2, ll_find,li_rec_no, li_file_num,li_fld_cnt,li_act_format
//Long li_fld_len, li_use_link, li_recd_no, li_width, f, li_dif,  li_save_data = 0, ud, col
//DateTime ldt_date, ldt_value //maha
//String ls_lookup_type, ls_db_lookup_type, ls_lookup_code ,ls_pad, ls_fixed_width//ls_trail_val, ls_trail_record, 
//String Errors, ls_export_record, ls_export_field, ls_fld_type, ls_fld_delim//ls_hdr_val, ls_hdr_record, 
//String ls_fld_val, ls_lead_trail_char, ls_format, ls_table_name//, ls_table_new, ls_table_names[]
//String ls_sql_syntax, ls_field_name, ls_grey, ls_presentation_str, ls_dwsyntax_str, ls_value, ls_data_value
//String ls_field_format, ls_sql, ls_save_format, ls_path //ls_month, ls_year, ls_day, ls_hour, ls_minute, 
//Long li_exp_type
//String ls_header, ls_filter, ls_lookup, ls_datatype, ls_prac_ids = "", ls_select_field, ls_prac_field
//String ls_select_table_trim, ls_select_table, ls_sny_retrieve, ls_find, ls_delim_value, ls_rec_delim, ls_lu_field
//String  ls_export_text_file = "", ls_lookup_val, ls_save_path, stax, s //maha
//String ls_aggre, ls_sort, ls_dc_field,  ls_text, ls_def_val
//Long ll_prac_row, ll_ret_cnt
//n_ds lds_export_hdr, lds_export_flds, lds_export_retrieve, lds_export_data, lds_code_lookup, lds_address_lookup
//n_ds lds_dataobject , lds_export_equiv_code
//String ls_tempstr, ls_dddwdata, ls_dddwtable, ls_select_field_ctx, ls_dddw_column_dbname //ls_dataobject, 
//datawindowchild ldwc_dddw
//String ls_linkfromcol, ls_linktotable, ls_linktocol
//datastore lds_linkto
//string ls_ic_link_area
//long ll_ctx_link_scrn_id
//string ls_datatype_ctx
//string ls_dddwname
//string ls_name
//string ls_sqlerrtext,ls_parsesql,ls_parseoff
//
////<add> andy 07/12/2007
//n_ds      lds_field,lds_export_dataTemp
//String    ls_ComputerDataType,ls_Expresstion,ls_Field,ls_FieldDataType,ls_Modify,ls_Err,ls_tag
//n_cst_string lnvo_string
//Long      ll_Cnt,ll_Num,ll_Tab,ll_Start = 1,ll_pos1,ll_pos2,ll_pos3,ll_SpID
//String ls_Objects,ls_objname,ls_ObjType,ls_ColType,ls_OrderBy,ls_UnionSQL = "",ls_SqlSelect,ls_flddelimList[]
//Boolean lb_flagpk,lb_true = False,lb_mulsel = False //lb_flag = true,
//Long    ll_FieldSeqID = 0,ll_FieldCnt,ll_export_code,ll_equivcode,ll_pracid,ll_LastPos
//Long ll_FieldSeqIDold = -1,ll_R = 0,ll_i = 1,ll_j,ll_k,ll_n,ll_pkcnt,ll_Rcnt,li_sub_start,li_custom_save
//String  ls_tablelist[],ls_fieldlist[],ls_selectfieldlist[],ls_formatList[]
//Long li_recdnoList[],ll_exportcodeList[],li_substartList[],li_widthList[],ll_ctx_scrn_id
//Long li_udList[],ll_pos,li_act_formatList[],li_bar_ticks,li_widthtemp,ll_maxwidth,ll_len
//String  ls_defvalList[],ls_textList[],ls_prac_sql,ls_ic_area,ls_lu_fieldList[]
//str_pass lstr_pass
////<add> 08/08/2007 by: Andy
//String ls_prac_sql_temp,ls_Sortsel,ls_prac_sql_temp2,ls_top = "top 2147483647",ls_usetable = ""
////<add> 08/16/2007 by: Andy
//datastore lds_tablepk
//String  ls_tablepks[],ls_table[],ls_tablepk,ls_sortpk[],ls_save_name,ls_strip_char,ls_dbtype
//String  ls_RowNo = "",ls_RowNoSyn = "",ls_tabletemp,ls_synprefix = "",ls_MySQL
////end of add
//Boolean lb_export // Andy 03202008
////Start add by jervis 
//Boolean lb_get_parent
//string ls_syn_parent
//string ls_select_table_on
//string ls_lu_codename
//string ls_field_value
//string ls_other_where
//string ls_ctx_table
//string ls_link_table
//string ls_link_table_on
//string ls_no_link_on
////End by jervis
//
//ldt_date = DateTime(Today(),Now()) //maha
////<add> 08/23/2007 by: Andy
//ls_dbtype = of_get_dbtype()
//If Upper(ls_dbtype) = 'SQL2005' Or Upper(ls_dbtype) = 'ASA9' Then
//	ls_RowNo = ",Row_No"
//	lb_true = True
//End If
//
//ls_synprefix = "select ctx_id,FieldSeqID,field_value,field_data_type" + ls_RowNo + " from ("
//
//
//
//
////<add> 08/14/2007 by: Andy 
////Reason: Bubble sort the al_ctx_ids array.
//If ai_type = 2 Then
//	of_bubblesort(al_ctx_ids)
//End If
//
//
//li_prac_id_cnt = UpperBound( al_ctx_ids[] )
//
////<add> 08/16/2007 by: Andy
//lds_tablepk = Create datastore
//If Left(Upper(ls_dbtype),3) = 'ASA' Then
//	lds_tablepk.DataObject = "d_export_tablepk_asa_ctx"
//	ls_top = ""
//Else
//	lds_tablepk.DataObject = "d_export_tablepk_sql_ctx"
//End If
//lds_tablepk.SetTransObject( SQLCA )
////end of add
//
//
////<add> andy 2007.05.25
//lds_field = Create n_ds
//lds_field.DataObject = "d_export_fields"
//lds_field.of_SetTransObject( SQLCA )
//
//lds_code_lookup = Create n_ds
//lds_code_lookup.DataObject = "d_code_lookup"
//lds_code_lookup.of_SetTransObject( SQLCA )
//
//lds_address_lookup = Create n_ds
//lds_address_lookup.DataObject = "d_address_lookup"
//lds_address_lookup.of_SetTransObject( SQLCA )
//
//lds_export_hdr = Create n_ds
//lds_export_hdr.DataObject = "d_export_hdr"
//lds_export_hdr.of_SetTransObject( SQLCA )
//
//lds_export_flds = Create n_ds
//lds_export_flds.DataObject = "d_export_flds_list_exp_ctx"
//lds_export_flds.of_SetTransObject( SQLCA )
//
//lds_export_equiv_code = Create n_ds
//lds_export_equiv_code.DataObject = "d_export_equiv_code_lds"
//lds_export_equiv_code.of_SetTransObject( SQLCA )
//
//
//lds_export_retrieve = Create n_ds
//lds_dataobject = Create n_ds
//lds_linkto = Create datastore
//
//gnv_appeondb.of_startqueue( )
//
//
//lds_export_flds.Retrieve( ai_export_id )
////lds_export_equiv_code.Retrieve()
//lds_export_equiv_code.Retrieve(ai_export_id)  //Jervis 12.10.2010
//lds_export_hdr.Retrieve( ai_export_id )
//lds_field.Retrieve( ai_export_id )
//
//gnv_appeondb.of_commitqueue( )
//
//ll_rowcount2 = lds_export_equiv_code.RowCount()
//
////HEADER INFO
//ls_table_name = lds_export_hdr.GetItemString(1,"export_name")
//ls_header = lds_export_hdr.GetItemString(1,"field_labels_as_header") //Y or N
//ls_format = lds_export_hdr.GetItemString(1,"export_format")
//
////add 08/22/2007 by: Andy
//ls_strip_char = lds_export_hdr.GetItemString(1,"strip_char")
//If IsNull(ls_strip_char) Or Len(ls_strip_char) < 1 Then ls_strip_char = "NONE"
//If ls_format = ".csv" Then ls_strip_char = ","
////end of add
//
////<add> 08/21/2007 by: Andy
//li_custom_save = lds_export_hdr.GetItemNumber(1,"custom_save_name")
//If IsNull(li_custom_save) Then li_custom_save = 0
////end of add
//
////-----------Begin Modified by alfee 05.25.2007-----------------------
////<$Reason>If merging data in document manager, agreement template or for email template,
////<$Reason>Then always use text with header format. It's also for performance tunning.
////If is_called_type = "2" Or is_called_type = '3' Then 
//If is_called_type = "2" Or is_called_type = '3' Or is_called_type = '4' Then //08.29.2007 Byy Jervis
//	ls_format = ".txt"
//	ls_header = '1'
//End If
//
////$<modify> 03/20/2008 by: Andy
//If ls_format = "export"  Then
//	lb_export = True
//	ls_format = ".txt"
//Else //txt and xls files  files
//	lb_export = False
//End If
//
////-----------End Modified ---------------------------------------------
//
//If ls_format = ".csv" Then
//	If Upper( appeongetclienttype() ) = "WEB" Then
//		MessageBox( "ContractLogix", "The file type of CSV is unsupported on WEB.~r~nPlease go to Export painter to modify settings." )
//		gnv_debug.of_output(true, 'Alarm  Export:' +"The file type of CSV is unsupported on WEB.~r~nPlease go to Export painter to modify settings." ) //added by gaivns 20120912
//		Close(w_export_progress)
//		//<add> andy 07/17/2007
//		Destroy lds_export_flds
//		Destroy lds_export_hdr
//		Destroy lds_address_lookup
//		Destroy lds_code_lookup
//		Destroy lds_export_equiv_code
//		Destroy lds_dataobject
//		Destroy lds_linkto
//		Destroy lds_field
//		Destroy lds_tablepk
//		//Destroy lds_export_dataTemp
//		//end of add
//		Return -1
//	End If
//End If
//
//li_exp_type = lds_export_hdr.GetItemNumber(1,"export_type")
//ls_rec_delim = lds_export_hdr.GetItemString(1,"record_delimiter")
//ls_save_path = lds_export_hdr.GetItemString(1,"save_path")
//
////$<add> 05.07.2008 by Andy
//Select Top 1 @@spid Into :ll_SpID From ids;
//
////Modify 08/08/2007 by: Andy
////specify SQL
//If ai_type = 1 Then
//	ls_prac_sql  = Trim(as_sql) //trim(lds_export_hdr.getitemstring(1,"prac_sql"))
//	If IsNull(ls_prac_sql) Then ls_prac_sql = ''
//	If ls_prac_sql <> '' Then
//		ll_pos = Pos(ls_prac_sql,";")
//		If ll_pos > 0 Then
//			ls_prac_sql  = Replace(ls_prac_sql,ll_pos,1,'')
//		End If
//		ll_len = Len(ls_prac_sql)
//		ls_prac_sql_temp = Trim(Mid(ls_prac_sql,7,ll_len))
//		If Lower(Left(ls_prac_sql_temp,8)) = 'distinct' Then
//			ls_prac_sql_temp2 = Trim(Mid(ls_prac_sql_temp,9,ll_len))
//			If Lower(Left(ls_prac_sql_temp2,3)) <> 'top' Then
//				//modify 08/14/2007 by: Andy
//				//ls_prac_sql = 'select distinct top 2147483647 ' + ls_prac_sql_temp2
//				ls_prac_sql = 'select distinct ' + ls_top + ' ' + ls_prac_sql_temp2
//			End If
//		ElseIf Lower(Left(ls_prac_sql_temp,3)) <> 'top' Then
//			//modify 08/14/2007 by: Andy
//			//ls_prac_sql = 'select top 2147483647 ' + ls_prac_sql_temp
//			ls_prac_sql = 'select ' + ls_top + ' ' + ls_prac_sql_temp
//		End If
//		
//		//$<add> 05.06.2008 by Andy
//		//del order by statement. Reason:if ORDER BY items isn't in the select list,then it will get error.
//		//ORDER BY items must appear in the select list if the statement contains a UNION operator.
//		ll_pos = Pos(Lower(ls_prac_sql)," order ")
//		If ll_pos > 0 Then
//			ls_prac_sql = Left(ls_prac_sql,ll_pos - 1)
//		End If
//		//if select more than one field,then add a select statement outside the ls_prac_sql and
//		//INSERT the result INTO a table.
//		ll_pos = Pos(Lower(ls_prac_sql)," from ")
//		ls_prac_sql_temp = Left(ls_prac_sql,ll_pos - 1)
//		ll_pos = Pos(ls_prac_sql,",")
//		If ll_pos > 0 Then
//			lb_mulsel = True
//			ls_prac_sql = "select distinct ctx_id," + String(ll_SpID) + " from (" + ls_prac_sql + ") cc order by ctx_id"
//			Select Top 1 1 Into :ll_Cnt From sysobjects Where Name = 'export_temp' And Type = 'U';
//			If ll_Cnt = 1 Then
//				ls_MySQL = "DELETE FROM export_temp WHERE SpID = " + String(ll_SpID) + ";"
//			Else
//				ls_MySQL = "CREATE TABLE export_temp (prac_id int null,SpID int null)"
//			End If
//			Execute Immediate :ls_MySQL;
//			ls_MySQL = "INSERT INTO export_temp " + ls_prac_sql + ";"
//			Execute Immediate :ls_MySQL;
//			ls_prac_sql = "select distinct prac_id as ctx_id from export_temp where SpID = " + String(ll_SpID)
//		End If
//		//end add 05.06.2008
//	End If
//End If
////end of modify
//
////set record delimiter
//Choose Case ls_rec_delim
//	Case "C"
//		ls_rec_delim = ","
//	Case "R"
//		ls_rec_delim = "~r"
//	Case "T"
//		ls_rec_delim = "	"
//	Case "D"
//		ls_rec_delim = "~r~r"
//	Case "U"
//	Case Else
//		ls_rec_delim = ""
//End Choose
//If IsNull(ls_rec_delim) Then ls_rec_delim = ""
//
//li_fld_cnt = lds_export_flds.RowCount()
////<add> 08/24/2007 by: Andy
//ll_maxwidth = Long(lds_export_flds.Describe("evaluate('max(export_field_length)',0)"))
//If ll_maxwidth < 30 Then ll_maxwidth = 30
//
////CREATE SYNTAX FOR export DW
////ls_sql_syntax = "Select * from exp_" + Lower(ls_table_new)
//ls_sql_syntax = is_select_syntax
////modify 08/15/2007 by: Andy
//ls_presentation_str = "style(type=grid)"
//
//ls_dwsyntax_str = SQLCA.SyntaxFromSQL(ls_sql_syntax, ls_presentation_str, Errors)
//If Len(Errors) > 0 Then //this will fail if the table has not been completed
//	If Pos(Errors,"Table or view not found",1) > 0 Then
//		MessageBox ("Error in of_export_data_with_text","Export data data store not able to be created.~rCheck to make sure no export fields have any spaces, and that all have a width.  You cannot have duplicate field names, and fields cannot start with a number." )
//		Close(w_export_progress)
//		//<add> andy 07/17/2007
//		Destroy lds_export_flds
//		Destroy lds_export_hdr
//		Destroy lds_address_lookup
//		Destroy lds_code_lookup
//		Destroy lds_export_equiv_code
//		Destroy lds_dataobject
//		Destroy lds_linkto
//		Destroy lds_field
//		Destroy lds_tablepk
//		//Destroy lds_export_dataTemp
//		//end of add
//		Return -1
//		
//	Else
//		MessageBox("Caution", &
//			"SyntaxFromSQL caused these errors: " + Errors)
//		gnv_debug.of_output(true, 'Caution:' + " SyntaxFromSQL caused these errors: " + Errors)		//Added By Mark Lee 02/01/2013
//		Close(w_export_progress)
//		//<add> andy 07/17/2007
//		Destroy lds_export_flds
//		Destroy lds_export_hdr
//		Destroy lds_address_lookup
//		Destroy lds_code_lookup
//		Destroy lds_export_equiv_code
//		Destroy lds_dataobject
//		Destroy lds_linkto
//		Destroy lds_field
//		Destroy lds_tablepk
//		//Destroy lds_export_dataTemp
//		//end of add
//		Return -1
//	End If
//	gnv_debug.of_output(true, 'Alarm  Export:SyntaxFromSQL errors:' +  Errors ) //added by gaivns 20120912
//End If
//lds_export_data = Create n_ds
//lds_export_data.Create( ls_dwsyntax_str, Errors)
//If len( errors ) > 0 Then
//	gnv_debug.of_output(true, 'Alarm  Export:lds_export_data create errors:' +  Errors ) //added by gaivns 20120912	
//End If
//lds_export_data.SetTransObject( SQLCA )
//
////<add> andy 2007.05.25 
////save the original data that it's not format,in order to deal with the computer fields
//lds_export_dataTemp = Create n_ds
//lds_export_dataTemp.Create( ls_dwsyntax_str, Errors )
//lds_export_dataTemp.SetTransObject( SQLCA )
////end of add
//
////w_export_progress.r_bar.Width = 300
//w_export_progress.hpb_bar.Position = 10
//
//w_export_progress.st_progress.Text = "Populating Data for " + String(li_prac_id_cnt) + " Contract(s)"
//
////li_bar_ticks = 80 / li_fld_cnt
//
////creates string of prac_ids for querys
////between...and...
//If ai_type = 3 Then
//	//if ls_prac_sql = '' then
//	If li_prac_id_cnt > 0 Then
//		ls_prac_ids = "between " + String(al_ctx_ids[1]) + " and " + String(al_ctx_ids[li_prac_id_cnt])
//	End If
//	//end if
//End If
//
////$<modify> 05.05.2008 by Andy
////create rows for all practitioner data
//For i = 1 To li_prac_id_cnt
//	//specify array
//	If ai_type = 2 Then
//		ls_prac_ids = ls_prac_ids + String( al_ctx_ids[i] ) + ","
//	End If
//	g = lds_export_data.InsertRow(0)
//Next
//If ai_type = 2 Then
//	ls_prac_ids = Left( ls_prac_ids, Len( ls_prac_ids ) -1 ) //remove last comma
//End If
//
////Added By Ken.Guo 2011-07-21. 
//Boolean lb_usingdb = False
//String ls_client_id
//Long ll_arr_temp[]
//n_cst_string lnv_string
////ll_arr_temp[] = al_ctx_ids[]
//If li_prac_id_cnt >= 100 Then
//	lb_usingdb = True
//	//lnv_string.of_delete_duplicate(ll_arr_temp[])
//	If inv_arr_db.of_array_to_db( al_ctx_ids[],ls_client_id ) < 0 Then
//		is_client_id[UpperBound(is_client_id[]) + 1 ] = ls_client_id
//		if isvalid(w_export_progress) then close(w_export_progress)
//		of_cleanup_ds( )	
//		lb_usingdb = False
//		gnv_debug.of_output( True, 'Export data with text error, Failed to insert array to DB.')
//		Messagebox('Export Error','Failed to insert array data to DB.')
//	End If
//End If
//
////if ai_save_data = 1 or ai_save_data = 3 then
//If ai_save_data = 1 Or ai_save_data = 3  Or ib_gen_rec_id Then //for Date Alarm - Alfee 06.11.2008
//	lds_export_data.Object.rec_id.Primary[] = al_ctx_ids[]
//End If
//lds_export_data.RowsCopy( 1, lds_export_data.RowCount(), Primary!, lds_export_dataTemp, 1, Primary! )
////end modify 05.05.2008
//
//
//
////w_export_progress.r_bar.Width = w_export_progress.r_bar.Width + 50
//w_export_progress.hpb_bar.Position = 11
//w_export_progress.st_export.Text = "Form SQL Statement"
//
////Modify 08/22/2007 by: Andy
////n = int(li_prac_id_cnt/80) + 1
//n = Int(li_fld_cnt/80) + 1
////end of modify
//
//
//For p = 1 To li_fld_cnt
//	lds_dataobject.DataObject = lds_export_flds.GetItemString( p, "export_fields_ctx_scrn_dataobject" )
//	
//	li_width = lds_export_flds.GetItemNumber(p,"export_field_length")
//	ls_field_format = lds_export_flds.GetItemString(p,"export_format")
//	
//	//Added By Jay Chen 03-19-2014
//	ls_name = lds_export_flds.GetItemString(p,"export_field_name")
//	if is_get_export_field = '1' and ids_document_export_field.rowcount() > 0  then
//		ll_find = ids_document_export_field.find("lower(export_field) = '"+lower(ls_name)+"'",1, ids_document_export_field.rowcount())
//		if isnull( ll_find) then ll_find = 0
//		if ll_find < 1 then continue
//	end if
//	//End add
//	
//	ls_data_value = ""
//	ls_value = ""
//	ls_lookup_val = ""
//	//ls_dc_field = "none"
//	//<add> 08/21/2007 by: Andy
//	li_sub_start =  0
//	//end of add
//	ls_dddwtable = ""
//	
//	lb_get_parent = false
//	ls_syn_parent = ""
//	ls_select_table_on = ""
//	ls_lu_codename = ""
//	ls_field_value = ""
//	ls_other_where = ""
//	ls_no_link_on = ""
//
//	ud = lds_export_flds.GetItemNumber( p, "use_default" )
//	If ud = 1 Or ud = 2 Then
//		ls_def_val = lds_export_flds.GetItemString( p, "default_value" )
//	Else
//		ls_def_val = ""
//	End If
//	
//	//Get Parent Level Data
//	if lds_export_flds.GetItemString( p,"record_level") = 'P' then lb_get_parent = true
//	
//	if lb_get_parent then
//		ls_syn_parent = "ctx_basic_info table_1 left join ctx_basic_info table_2 on (table_1.master_contract_id = table_2.ctx_id ) left join "
//	end if
//	
//	//Add by jervis -- 01.18.2010
//	//Leading Padding or Trailing Padding Process
//	ls_fld_delim = lds_export_flds.GetItemString( p, "trailing_leading_characters")
//	Choose Case ls_fld_delim
//		Case "R" //return
//			ls_fld_delim = "~r"
//		Case "T" //tab
//			ls_fld_delim = "	"
//		Case "D" //double return
//			ls_fld_delim = "~r~r"
//		Case "S" // space
//			ls_fld_delim = " "
//		Case "E" //empty string
//			ls_fld_delim = ""
//	End Choose
//	
//	//hard coded text
//	If lds_export_flds.GetItemNumber(p,"export_type") = 2 Then //set data for text fields
//		ls_select_field = lds_export_flds.GetItemString(p,"export_field_name")
//		ls_value = lds_export_flds.GetItemString(p,"field_value")
//		
//		If IsNull(ls_value) Then ls_value = ""
//		
//		If ls_value = "&TODAY&" Then
//			//<modify> 08/28/2007 by: Andy Reason:Support user-defined format.
//			//ls_value = of_date_format(ls_field_format,ldt_date) //maha 070705 factored
//			ls_value = String(ldt_date,"yyyy-mm-dd hh:mm")
//			of_data_format(ls_field_format,'D',ls_value)
//			//end of modify
//		End If
//		//Start Code Change ---- 11.03.2005 #21 maha  for prompt values
//		String ls_ptype
//		Choose Case Upper(ls_value)
//			Case "&PROMPT1&"
//				ls_ptype = lds_export_hdr.GetItemString(1,"prompt_type1")
//				ls_value = of_prompt_populate( ls_ptype, as_param1)
//			Case "&PROMPT2&"
//				ls_ptype = lds_export_hdr.GetItemString(1,"prompt_type2")
//				ls_value = of_prompt_populate( ls_ptype, as_param2)
//			Case "&PROMPT3&"
//				ls_ptype = lds_export_hdr.GetItemString(1,"prompt_type3")
//				ls_value = of_prompt_populate( ls_ptype, as_param3)
//		End Choose
//		If	ls_ptype = 'D' Then
//			ldt_date = DateTime(Date(ls_value),Now())
//			//<modify> 08/28/2007 by: Andy Reason:Support user-defined format.
//			//ls_value = of_date_format(ls_field_format,ldt_date)
//			ls_value = String(ldt_date,"yyyy-mm-dd hh:mm")
//			of_data_format(ls_field_format,'D',ls_value)
//			//end of modify
//		End If
//		
//		//End Code Change---11.03.2005
//		
//		//<add> 08/27/2007 by: Andy
//		li_sub_start = lds_export_flds.GetItemNumber(p,"export_fields_substring_start")
//		If li_sub_start > 1 Then ls_value = Mid(ls_value,li_sub_start,li_width)
//		ls_value = Mid(ls_value,1,li_width) //shrink the length to size 
//		//end of add
//		
//		
//		If ls_field_format = "Leading Padding" Or ls_field_format = "Trailing Padding" Then
//			If li_width - Len(ls_value) > 0 Then
//				li_dif = li_width - Len(ls_value)
//				ls_pad = "" //reset
//				ls_pad = Fill ( ls_fld_delim, li_dif )
//				If ls_field_format = "Leading Padding" Then
//					ls_value = ls_pad + ls_value
//				Else
//					ls_value = ls_value + ls_pad
//				End If
//			End If
//		End If
//		
//		
//		For i = 1 To li_prac_id_cnt
//			lds_export_data.SetItem(i,p,ls_value)
//			lds_export_dataTemp.SetItem(i,p,ls_value) //<add> andy 2007.05.25 
//		Next
//		//<Modify> andy 2007.05.25
//		//Else //get FIELDS DATA //comment by andy 
//	ElseIf lds_export_flds.GetItemNumber(p,"export_type") = 1 Then //get FIELDS DATA
//		
//		ll_ctx_scrn_id = lds_export_flds.GetItemNumber(p,"export_fields_ctx_scrn_id") //Add by Jack 06/05/2007
//		If ll_ctx_scrn_id = 6 Then
//			ls_ic_area = "E"
//		ElseIf ll_ctx_scrn_id = 7 Then
//			ls_ic_area = "I"
//		elseif ll_ctx_scrn_id = 14 or ll_ctx_scrn_id = 17 then //add other contact -- jervis 03.28.2011
//			ls_ic_area = "C"
//		End If
//		
//		//end of modify	
//		//CREATE SYNTAX FOR each retrieve DW
//		ls_export_field = lds_export_flds.GetItemString(p,"export_field_name")
//		//<add> 08/24/2007 by: Andy
//		of_replacespecchar(ls_export_field)
//		//end of add
//		ls_select_field_ctx = Trim( lds_export_flds.GetItemString( p, "db_field_name" ) )
//		
//		
//		Choose Case ls_select_field_ctx
//			Case "app_facility"
//				ls_tempstr = 'ctx_basic_info.app_facility'
//				ls_select_table = f_get_token( ls_tempstr, "." )
//				ls_select_field = ls_tempstr
//			Case "compute_1"
//				ls_select_table = 'ctx_contract_contacts'
//				ls_select_field = "compute_1"
//			Case "contact_phone"
//				ls_select_table = 'ctx_contract_contacts'
//				ls_select_field = 'contact_phone'
//			Case "contact_email"
//				if ll_ctx_scrn_id <> 2002 then //jervis 03.28.2011
//					ls_select_table = 'ctx_contract_contacts'
//					ls_select_field = 'contact_email'
//				else
//					ls_select_table = 'ctx_contacts_numbers'
//					ls_select_field = 'contact_email'
//				end if
//			Case Else
//				ls_tempstr = lds_dataobject.Describe( ls_select_field_ctx + ".dbname" )
//				if pos(ls_tempstr,".") > 0 then	//IF Exists Table Selection - jervis 03.17.2009
//					ls_select_table = f_get_token( ls_tempstr, "." )
//				else
//					if ll_ctx_scrn_id = 56 then //Added By Jay Chen 03-11-2014 Remark: add external dddw fields for document browse 
//						ls_select_table = "ctx_am_document"
//					else
//						ls_select_table = ""
//					end if
//				end if 
//				if ll_ctx_scrn_id = 56 then //Added By Jay Chen 03-11-2014 Remark: add external dddw fields for document browse 
//					ls_select_field = lds_dataobject.Describe( ls_select_field_ctx + ".name" )
//				else
//					ls_select_field = ls_tempstr
//				end if
////				ls_select_field = ls_tempstr
//				
//				if ll_ctx_scrn_id = 12 then //Export Requirement Profile Detail-- jervis 03.17.2009
//					ls_select_table = 'ctx_elements'
//				elseif ll_ctx_scrn_id = 2004 then
//					ls_select_table = 'sys_statusaudit'	//Export Contract Status tract - jervis 03.20.2009
//				elseif (ll_ctx_scrn_id = 6 or ll_ctx_scrn_id = 7) and ls_select_field = "facility_id" then
//					ls_select_table = 'ctx_contract_contacts'  //Export comany info with contact - jervis 01.30.2011
//				ElseIf ll_ctx_scrn_id = 22 Then
//					ls_select_table = 'ctx_orgs_contact'//added by gavins 20130314	
//				end if
//				   
//				
//		End Choose
//
//		
//		li_use_link = lds_export_flds.GetItemNumber(p,"export_fields_ctx_uselink")
//		If IsNull( li_use_link ) Then li_use_link = 0
//		
//		
//		
//		//ls_fld_delim = lds_export_flds.GetItemString( p, "trailing_leading_characters")
//		li_recd_no = lds_export_flds.GetItemNumber(p,"intcred_record_number")
//		//<add> 07/06/2007 by: Andy
//		ll_FieldSeqID ++
//		ll_export_code = lds_export_flds.GetItemNumber( p, "export_code" )
//		
//		//end of add	
//		ls_lu_field = lds_export_flds.GetItemString( p, "lu_field_name" )
//		ls_aggre = lds_export_flds.GetItemString( p, "aggre_function" )
//		ls_sort = lds_export_flds.GetItemString( p, "sort_by" )
//		//<add> 08/09/2007 by: Andy
//		ls_Sortsel = ls_sort
//		If IsNull(ls_Sortsel) Then ls_Sortsel = ''
//		If Len(Trim(ls_Sortsel)) > 0 Then
//			//$<Modify> 05.13.2008 by Andy
//			of_get_sortsel(ls_Sortsel,'ctx_id')
//		End If
//		//end of add
//		li_act_format = lds_export_flds.GetItemNumber(p,"export_fields_active_yesno")
//		ls_text = lds_export_flds.GetItemString(p,"field_value") //maha 091305
//		If Upper(ls_lu_field) = "LOOKUP CODE" Then ls_lu_field = "lookup_code"
//		If IsNull(ls_lu_field) Then ls_lu_field = "code"
//
//		//<add> 08/21/2007 by: Andy
//		li_sub_start = lds_export_flds.GetItemNumber(p,"export_fields_substring_start")
//		//end of add
//		If Pos(ls_select_table,"dba.",1) > 0 Then //maha 122005 
//			ls_select_table_trim = Mid(ls_select_table,5) //dropping dba.
//			ls_select_table = ls_select_table_trim  //maha 012306
//		Else
//			ls_select_table_trim = ls_select_table
//		End If
//		ls_filter = lds_export_flds.GetItemString(p,"filter_query")
//		
//		
//		If IsNull(ls_filter) Or Trim(ls_filter) = "" Then
//			ls_filter = ""
//		Else
//			//<Modify> 07/23/2007 by: Andy 
//			//ls_filter = " and  " + ls_filter
//			ls_filter = " and  ( " + ls_filter + " )"
//			//end of Modify
//			
//			//Start Code Change ---- 11.03.2005 #24 maha check filter for prompt values and replace
//			Long li_pos1
//			li_pos1 = Pos(Upper(ls_filter),"PROMPT1",1)
//			If li_pos1 > 0 Then
//				ls_filter = Mid(ls_filter,1,li_pos1 - 1) + as_param1 + Mid(ls_filter,li_pos1 + 7)
//			End If
//			li_pos1 = Pos(Upper(ls_filter),"PROMPT2",1)
//			If li_pos1 > 0 Then
//				ls_filter = Mid(ls_filter,1,li_pos1 - 1) + as_param2 + Mid(ls_filter,li_pos1 + 7)
//			End If
//			li_pos1 = Pos(Upper(ls_filter),"PROMPT3",1)
//			If li_pos1 > 0 Then
//				ls_filter = Mid(ls_filter,1,li_pos1 - 1) + as_param3 + Mid(ls_filter,li_pos1 + 7)
//			End If
//		End If
//		//End Code Change---11.03.2005 	
//		
//		//Replace ls_rec_delim to ls_fld_delim - jervis 12.30.2009
//		/*
//		//set fields delimiter/pad maha 060105
//		Choose Case ls_rec_delim
//			Case "R" //return
//				ls_rec_delim = "~r"
//			Case "T" //tab
//				ls_rec_delim = "	"
//			Case "D" //double return
//				ls_rec_delim = "~r~r"
//			Case "S" // space
//				ls_rec_delim = " "
//			Case "E" //empty string
//				ls_rec_delim = ""
//		End Choose
//		*/
//		
//		//export_fields_use_link  sql
//		If li_use_link = 1 Then
//			ls_linkfromcol = Trim( lds_export_flds.GetItemString( p, "export_fields_ctx_linkfromcolumn" ))
//			ls_tempstr = lds_dataobject.Describe( ls_linkfromcol + ".dbname" )
//			f_get_token( ls_tempstr, "." )
//			ls_linkfromcol = ls_tempstr
//			
//			lds_linkto.DataObject = Trim( lds_export_flds.GetItemString( p, "export_fields_ctx_linktoscrndw" ))
//			ls_linktocol = Trim( lds_export_flds.GetItemString( p, "export_fields_ctx_linktocolumn" ))
//			ls_tempstr = lds_linkto.Describe( ls_linktocol + ".dbname" )
//			ls_linktotable = f_get_token( ls_tempstr, "." )
//			ls_linktocol = ls_tempstr
//			
//			//Contacted contact or our company contact - jervis 01.27.2011
//			ll_ctx_link_scrn_id = lds_export_flds.GetItemNumber(p,"export_fields_ctx_linktoscrnid") 
//			If ll_ctx_link_scrn_id = 6 Then
//				ls_ic_link_area = "E"
//			ElseIf ll_ctx_link_scrn_id = 7 Then
//				ls_ic_link_area = "I"
//			elseif ll_ctx_link_scrn_id = 14 or ll_ctx_link_scrn_id = 17 then  //add other contact -- jervis 03.28.2011
//				ls_ic_link_area = "C"
//			End If
//		End If
//		
//		ls_tablelist[ll_FieldSeqID] = ls_select_table
//		ls_fieldlist[ll_FieldSeqID] = ls_export_field
//		li_recdnoList[ll_FieldSeqID] = li_recd_no
//		ls_selectfieldlist[ll_FieldSeqID] = ls_select_field
//		ls_formatList[ll_FieldSeqID] = ls_field_format
//		ll_exportcodeList[ll_FieldSeqID] = ll_export_code
//		//<add> 08/21/2007 by: Andy
//		li_substartList[ll_FieldSeqID] = li_sub_start
//		//end of add
//		li_widthList[ll_FieldSeqID] = li_width
//		//<add> 07/23/2007 by: Andy
//		li_widthtemp = li_width
//		If li_widthtemp < 30 Then li_widthtemp = 30
//		//end of add
//		ls_flddelimList[ll_FieldSeqID] = ls_fld_delim
//		li_udList[ll_FieldSeqID] = ud
//		ls_defvalList[ll_FieldSeqID] = ls_def_val
//		ls_textList[ll_FieldSeqID] = ls_text
//		ls_lu_fieldList[ll_FieldSeqID] = ls_lu_field
//		
//		li_act_formatList[ll_FieldSeqID] = li_act_format
//
//		//If ai_type = 1 Then
//		//	ls_use_link_sql = ls_use_link_sql + ", (" + ls_prac_sql + ") bb "
//		//End If
//		
//		//--------------------------- APPEON BEGIN ---------------------------
//		//$<modify> 03.19.2007 By: Jack (Export)
//		//$<reason> Fix a defect.
//		//Modify 08/15/2007 by: Andy
//		if (ll_ctx_scrn_id = 6 or ll_ctx_scrn_id = 7) and ls_select_field = 'facility_id' then
//			ls_usetable = "ctx_contract_contacts"
//		elseIf ls_select_table <> 'app_facility' Then
//			If li_use_link = 1 Then
//				ls_usetable = Lower(ls_linktotable)
//			Else
//				ls_usetable = Lower(ls_select_table)
//			End If
//		Else
//			ls_usetable = "ctx_basic_info"
//		End If
//		
//		if lb_get_parent then
//			ls_ctx_table = "table_1"
//		else
//			ls_ctx_table = ls_usetable
//		end if
//		
//		//<ad> 08/16/2007 by: Andy
//		ls_tablepk = ""
//		If IsNull(ls_sort) Or Trim(ls_sort) = "" Then
//			ls_sort = ""
//			lb_flagpk = True
//			//lb_sortpk = false
//			ll_pkcnt = UpperBound(ls_table)
//			For ll_n = 1 To ll_pkcnt
//				If Lower(ls_usetable) = Lower(ls_table[ll_n]) Then
//					ls_tablepk = ls_tablepks[ll_n]
//					//ls_sort  = Left(ls_tablepk,len(ls_tablepk) - 2)
//					ls_sort = ls_sortpk[ll_n]
//					lb_flagpk = False
//				End If
//			Next
//			If lb_flagpk Then
//				ll_Rcnt = lds_tablepk.Retrieve( ls_usetable)
//				ls_sort = ls_usetable + '.ctx_id, '
//				For ll_n = 1 To ll_Rcnt
//					If Lower(lds_tablepk.GetItemString( ll_n, "column_name")) = 'ctx_id' Then
//						//ls_sort = ls_usetable + '.ctx_id, '
//						Continue
//					End If
//					ls_tablepk += ls_usetable + '.' + lds_tablepk.GetItemString( ll_n, "column_name") + ", "
//				Next
//				//Modify 08/22/2007 by: Andy
//				//ls_sort = ls_tablepk + ls_sort
//				ls_sort = ls_sort + ls_tablepk
//				//end of modify
//				ls_sort  = Left(ls_sort,Len(ls_sort) - 2)
//				ls_sortpk[ll_pkcnt + 1] = ls_sort
//				ls_table[ll_pkcnt+1] = ls_usetable
//				ls_tablepks[ll_pkcnt+1] = ls_tablepk
//			End If
//			//<add> 08/22/2007 by: Andy
//		Else
//			If Pos(Lower(ls_sort),'ctx_id') < 1 Then ls_sort = ls_usetable + '.ctx_id, ' + ls_sort
//		End If
//		
//		
//		//<add> 08/23/2007 by: Andy
//		If Len(ls_aggre) > 0 Then
//			ls_sort = ls_sort + " , field_value"
//		End If
//		If Len(ls_sort) > 0 Then ls_sort = "order by " + ls_sort
//		//end of add
//		
//		//<add> 08/23/2007 by: Andy
//		If lb_true Then//SQL2005 and ASA9
//			ls_RowNoSyn = ",row_number() over(" + ls_sort+") Row_No"
//		End If
//		//end of add
//		
//		
//		ls_sny_retrieve = ls_synprefix + "Select " + ls_top + " " + ls_ctx_table + ".ctx_id, " + ls_tablepk + ls_Sortsel + String(ll_FieldSeqID) + " FieldSeqID, "
//
//		ls_db_lookup_type = lds_export_flds.GetItemString( p, "export_fields_ctx_lookup_type" )
//		//--------------------------- APPEON BEGIN ---------------------------
//		//$<modify> 04.04.2007 By: Jack 
//		//$<reason> Fix a defect.
//		
//		If ls_select_table = 'app_facility' And ls_select_field_ctx = 'state' Then
//			ls_dddwdata = ''
//		Else
//			ls_dddwdata = Lower( lds_dataobject.Describe( ls_select_field_ctx + ".dddw.datacolumn" ) )
//		End If
//		//---------------------------- APPEON END ----------------------------
//		
//		If ls_dddwdata <> '?' And ls_dddwdata <> '!' And ls_dddwdata <> '' Then
//			ls_tempstr = Lower( lds_dataobject.Describe( ls_select_field_ctx + ".dddw.displaycolumn" ) )
//			
//			//the edit style has been dynamic change for lookup or company dddw -- jervis 09.22.2011
//			ls_dddwname =  Lower( lds_dataobject.Describe( ls_select_field_ctx + ".dddw.name" ) )
//			//Added By Mark Lee 03/05/2014 for ll_ctx_scrn_id = 2003
////			if ls_dddwname = 'd_dddw_code_lookup' or ls_dddwname = 'd_dddw_company'  then  
//			if ls_dddwname = 'd_dddw_code_lookup' or ls_dddwname = 'd_dddw_company'  or ls_dddwname = 'd_dddw_facility_link'   then  
//				ls_dddwdata = ''
//			else
//				If ls_tempstr <> '?' And ls_tempstr <> '!' And ls_tempstr <> '' Then
//					
//					If IsNull( ls_db_lookup_type ) Then
//						ls_db_lookup_type = "X"
//						ls_lu_field = ls_tempstr
//						
//						lds_dataobject.GetChild( ls_select_field_ctx, ldwc_dddw )
//						ls_tempstr = ldwc_dddw.Describe( ls_lu_field + ".dbname" )
//						ls_dddwtable = f_get_token( ls_tempstr, "." )
//						ls_dddw_column_dbname = ls_tempstr
//					End If
//				End If
//			end if
//		End If
//		
//		
//		
//		If li_use_link = 1 Then
//			//ls_use_link_sql2 = " (" + ls_linktotable + "." + ls_linktocol + " = " + ls_select_table + "." + ls_linkfromcol + ") and "
//			if lb_get_parent then
//				ls_link_table = ls_linktotable
//				ls_link_table_on = " on( table_2.ctx_id = " + ls_linktotable + ".ctx_id) left join "
//				if ls_select_table <> "app_facility" then
//					ls_no_link_on = " on (table_2.ctx_id = " + Lower(ls_select_table) + ".ctx_id) "
//				else
//					ls_no_link_on = " on (table_2.ctx_id = " + Lower(ls_usetable) + ".ctx_id) "
//				end if
//			else
//				ls_link_table = ls_linktotable + " left join "
//				ls_link_table_on = " "
//			end if
//			
//			ls_select_table_on = " on  (" + ls_linktotable + "." + ls_linktocol + " = " + ls_select_table + "." + ls_linkfromcol + ") "
//			
//			//Contracted contact or our company contact - jervis 01.27.2011
//			//add other contact - jervis 03.28.2011
//			If ll_ctx_link_scrn_id = 6 or ll_ctx_link_scrn_id = 7 or ll_ctx_link_scrn_id = 14 or ll_ctx_link_scrn_id = 17 Then
//				ls_other_where = " and " + ls_linktotable + ".ic_area ='" + ls_ic_link_area + "' "
//			end if
//		else
//			ls_link_table = " "
//			ls_link_table_on = " "
//			//Get select table on clause		-- jervis 03.04.2009
//			if lb_get_parent then
//				if ls_select_table <> "app_facility" then
//					ls_select_table_on = " on (table_2.ctx_id = " + Lower(ls_select_table) + ".ctx_id) "
//				else
//					ls_select_table_on = " on (table_2.ctx_id = " + Lower(ls_usetable) + ".ctx_id) "
//				end if
//			end if
//			ls_no_link_on = ls_select_table_on
//			//Get link table on clause		-jervis 03.04.2009
//		End If
//		
//		If ls_select_field = 'app_facility' And Upper(ls_db_lookup_type)  = "C" Then
//			ls_datatype = "C"
//
//			//ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),app_facility."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from app_facility," + Lower(ls_select_table) +  ls_use_link_sql + " WHERE " + "(" + Lower(ls_select_table) + "." + ls_select_field + " = app_facility.facility_id) and "
//			ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),app_facility."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//									ls_syn_parent + ls_link_table + ls_link_table_on +  Lower(ls_select_table) + ls_select_table_on + " left join app_facility on("+ Lower(ls_select_table) + "." + ls_select_field + " = app_facility.facility_id) "
//
//			ls_select_field  = "app_facility_" + ls_lu_field
//		//---------Start code by jervis 06.09.2009-------------
//		//Export location data
//		
//		//Export company info whit contracted conatct or our company contact -- jervis 01.30.2011
//		elseif (ll_ctx_scrn_id = 6 or ll_ctx_scrn_id = 7 or ll_ctx_link_scrn_id = 14 or ll_ctx_link_scrn_id = 17) and ls_select_field = 'facility_id' then
//			ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),app_facility."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//									ls_syn_parent + ls_link_table + ls_link_table_on +  Lower(ls_select_table) + ls_select_table_on + " left join ctx_contacts on (ctx_contract_contacts.contact_id = ctx_contacts.contact_id) left join app_facility on(ctx_contacts.facility_id = app_facility.facility_id) "
//
//			ls_select_field  = "app_facility_" + ls_lu_field
//			
//			//if (ll_ctx_scrn_id = 6 or ll_ctx_scrn_id = 7) Then
//				ls_other_where = " and ctx_contract_contacts.ic_area = '" +ls_ic_area + "' "
//			//end if
//			
//		elseif ls_select_field = 'loc_id' and upper(ls_db_lookup_type) = "L" then //Location
//			ls_datatype = "C"
//			if ls_lu_field = "state"  or ls_lu_field = "country" or ls_lu_field = "mailing_address" then
//				//Use code_lookup.code display value -- jervis 08.04.2009
//				ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),code_lookup.code) field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//									ls_syn_parent + ls_link_table + ls_link_table_on +  Lower(ls_select_table) + ls_select_table_on + " left join group_practice on("+ Lower(ls_select_table) + "." + ls_select_field + " = group_practice.rec_id) " + &
//									"left join code_lookup on ( group_practice." + ls_lu_field + " = code_lookup.lookup_code) " 
//			elseif  ls_lu_field = "county"  then
//				//Use code_lookup.describe display value -- jervis 08.04.2009
//				ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),code_lookup.description) field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//									ls_syn_parent + ls_link_table + ls_link_table_on +  Lower(ls_select_table) + ls_select_table_on + " left join group_practice on("+ Lower(ls_select_table) + "." + ls_select_field + " = group_practice.rec_id) " + &
//									"left join code_lookup on ( group_practice." + ls_lu_field + " = code_lookup.lookup_code) " 
//			elseif ls_lu_field = "mailing_address_desc" then		//Export Description - jervis 08.07.2009
//				ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),code_lookup.description) field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//									ls_syn_parent + ls_link_table + ls_link_table_on +  Lower(ls_select_table) + ls_select_table_on + " left join group_practice on("+ Lower(ls_select_table) + "." + ls_select_field + " = group_practice.rec_id) " + &					
//									"left join code_lookup on ( group_practice.mailing_address = code_lookup.lookup_code) " 
//			else
//				ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),group_practice."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//									ls_syn_parent + ls_link_table + ls_link_table_on +  Lower(ls_select_table) + ls_select_table_on + " left join group_practice on("+ Lower(ls_select_table) + "." + ls_select_field + " = group_practice.rec_id) "
//			end if
//			ls_select_field = "group_practice_" + ls_lu_field
//		//---------End code by jervis 06.09.2009-------------
//		
//		elseif ls_select_field = 'parent_comp_id' and Upper(ls_db_lookup_type) = "M" then	//Parent Organization -- jervis 06.23.2009
//			
//			ls_datatype = "C"
//			ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),group_multi_loc."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//									ls_syn_parent + ls_link_table + ls_link_table_on +  Lower(ls_select_table) + ls_select_table_on + " left join group_multi_loc on("+ Lower(ls_select_table) + "." + ls_select_field + " = group_multi_loc.rec_id) "
//			ls_select_field = "group_multi_loc_" + ls_lu_field
//
//		//---------Start code by jervis 03.17.2009-------------
//		//Export Requiments data
//		elseif ls_select_field = 'ctx_req_profile_id' and Upper(ls_db_lookup_type) = "R"	 then //Requiren profile dddw-jervis 03.17.2009
//			ls_Datatype = 'C'
//			ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),ctx_req_profile."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//									ls_syn_parent + ls_link_table + ls_link_table_on +  Lower(ls_select_table) + ls_select_table_on + " left join ctx_req_profile on("+ Lower(ls_select_table) + "." + ls_select_field + " = ctx_req_profile.ctx_req_profile_id) "
//			ls_select_field = "ctx_req_profile_" + ls_lu_field
//		
//		ElseIf ll_ctx_scrn_id = 22 Then
//			ls_datatype = of_get_coltype(lds_dataobject,ls_select_field_ctx) 
////					ls_select_table = 'ctx_orgs_contact'//added by gavins 20130314
//			If ls_select_field = 'org_type' then
//				ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),code_lookup."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//											ls_syn_parent + ls_link_table + ls_link_table_on +  Lower(ls_select_table) + ls_select_table_on + " inner join ctx_orgs on " + Lower(ls_select_table) + ".org_id"  +" = ctx_orgs.org_id  left join code_lookup on (ctx_orgs." + ls_select_field + " = code_lookup.lookup_code) "
//			Else
//				ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),ctx_orgs."+ ls_select_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//									ls_syn_parent + ls_link_table + ls_link_table_on +  Lower(ls_select_table) + ls_select_table_on + " inner join ctx_orgs on " + Lower(ls_select_table) + ".org_id"  +" = ctx_orgs.org_id  "
//			End if
//			ls_select_field  = "ctx_orgs_" + ls_select_field						
//		elseif ll_ctx_scrn_id = 12 then	//Export Requirements Profile Detail Data - jervis 03.17.2009
//			ls_datatype = of_get_coltype(lds_dataobject,ls_select_field_ctx)
//			choose case ls_select_field
//				case 'data_value'
//					ls_sny_retrieve = ls_sny_retrieve +  " convert(varchar(" + String(li_widthtemp) + "),(Case ctx_req_tmplt_element.value_type when 1 then convert(varchar," + ls_select_table + ".date_value ,101) when 2 then " + ls_select_table+ ".field_value when 3 then " + ls_select_table + ".char_value when 4 then cast(" +ls_select_table+".integer_value as varchar) when 6 then cast(" +ls_select_table+".money_value as varchar) when 5 then " +ls_select_table +" .field_value end)) field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " 
//											//ls_syn_parent + ls_link_table + ls_link_table_on + ls_select_table + ls_select_table_on + &
//											//"left join ctx_req_tmplt_element on (" + ls_select_table + ".ctx_req_tmplt_element_id = ctx_req_tmplt_element.ctx_req_tmplt_element_id)"
//					ls_select_field = ls_select_table + "_"+ls_select_field
//				case 'element_sort'	//in process....
//				case 'requirement'	
//					ls_sny_retrieve = ls_sny_retrieve +  " convert(varchar(" + String(li_widthtemp) + "),ctx_req_tmplt_element.element_name) field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " //+ &
//											//ls_syn_parent + ls_link_table + ls_link_table_on + ls_select_table + ls_select_table_on + &
//											//"left join ctx_req_tmplt_element  on (" + ls_select_table + ".ctx_req_tmplt_element_id = ctx_req_tmplt_element.ctx_req_tmplt_element_id)"
//					ls_select_field =  "ctx_req_tmplt_element_"+ls_select_field
//				case 'ctx_rqmnt_category_id'	//in process....
//				case 'ctx_req_profile_id'	//in process
//				case 'category_name'
//					ls_sny_retrieve = ls_sny_retrieve +  " convert(varchar(" + String(li_widthtemp) + "),ctx_rqmnt_category.category_name) field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " //+ &
//											//ls_syn_parent + ls_link_table + ls_link_table_on + ls_select_table + ls_select_table_on + &
//											//"left join ctx_req_tmplt_element on (" + ls_select_table + ".ctx_req_tmplt_element_id = ctx_req_tmplt_element.ctx_req_tmplt_element_id) " + &
//											//"left join ctx_rqmnt_category  on (ctx_req_tmplt_element.ctx_rqmnt_category_id = ctx_rqmnt_category.ctx_rqmnt_category_id and " + ls_linktotable + ".ctx_req_profile_id = ctx_rqmnt_category.ctx_req_profile_id)"
//					ls_select_field = "ctx_rqmnt_category_"+ls_select_field
//
//				case else		//case 'clause'
//					ls_sny_retrieve = ls_sny_retrieve +  " convert(varchar(" + String(li_widthtemp) + ")," + ls_select_table + "."+ ls_select_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " //+ &
//											//ls_syn_parent + ls_link_table + ls_link_table_on + ls_select_table + ls_select_table_on 
//											
//					ls_select_field = ls_select_table + "_"+ls_select_field
//			end choose
//			ls_sny_retrieve =  ls_sny_retrieve + ls_syn_parent + ls_link_table + ls_link_table_on + ls_select_table + ls_select_table_on + &
//									" left join ctx_req_tmplt_element on (" + ls_select_table + ".ctx_req_tmplt_element_id = ctx_req_tmplt_element.ctx_req_tmplt_element_id) " + &
//									" left join ctx_rqmnt_category  on (ctx_req_tmplt_element.ctx_rqmnt_category_id = ctx_rqmnt_category.ctx_rqmnt_category_id and " + ls_linktotable + ".ctx_req_profile_id = ctx_rqmnt_category.ctx_req_profile_id)"
//		//---------End code by jervis 03.17.2009-------------
//		
//		//-----------Start code by jervis 03.20.2009------------
//		//Export the Processing Setting for Contract status tract
//		elseif ll_ctx_scrn_id = 2004 and ls_select_field = "processing_setting"	 then
//			ls_datatype = 'C'
//			ls_sny_retrieve = ls_sny_retrieve +  " convert(varchar(" + String(li_widthtemp) + "),case code_lookup.custom_2 when 'On' then 'In Process' when 'Off' then 'On Hold' when 'Complete' then 'Executed' when 'NA' then 'N/A' else custom_2 end ) field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//									ls_syn_parent + ls_link_table + ls_link_table_on + ls_select_table + ls_select_table_on + &
//									" left join code_lookup on (" + ls_select_table+ ".status = code_lookup.lookup_code)" // and code_lookup.lookup_name = 'Contract Status')" -- comment by jervis -- 04.26.2011
//											
//			//ls_select_field = ls_select_table + "_"+ls_select_field
//		//---------End code by jervis 03.20.2009-------------
//		ElseIf ls_select_field = 'contact_id' and ll_ctx_scrn_id <> 2001 Then  //Add ll_ctx_scrn_id <> 2001 -- jervis 01.28.2011
//			//--------------------------- APPEON BEGIN ---------------------------
//			//$<modify> 06.05.2007 By: Jack
//			//$<reason> Fix a defect.
//			//Added By Mark Lee 03/05/2014
////			If ls_lu_field = 'contact_department' Or ls_lu_field = 'contact_type' Or ls_lu_field = 'contact_id' Then
//			If ls_lu_field = 'contact_department' Or ls_lu_field = 'contact_type' Or ls_lu_field = 'contact_id' or ( ll_ctx_scrn_id = 2002 ) Then
//				ls_datatype = "N"
//			Else
//				ls_datatype = "C"
//			End If
//			
//			If ls_lu_field = 'phone' or ls_lu_field = "ext" or ls_lu_field = "contact_email" Then
//				if ls_lu_field = "contact_email" then
//					ls_lu_codename = "Email"
//				else
//					ls_lu_codename = "Phone"
//				end if
//				//ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),(select top 1 A.phone from ctx_contacts_numbers A where A.contact_id = ctx_contract_contacts.contact_id and a.via = (select lookup_code from code_lookup where lookup_name = 'Contract Contact Via' and code = 'Phone' ) and a.phone is not null)) field_value, '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from ctx_contract_contacts,ctx_contacts " + ", (" + ls_prac_sql + ") bb " + " where ctx_contract_contacts.contact_id = ctx_contacts.contact_id and ctx_contract_contacts.ic_area = '" + ls_ic_area + "' and "
//				ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),(select top 1 A." + ls_lu_field+ " from ctx_contacts_numbers A where A.contact_id = ctx_contract_contacts.contact_id and a.via = (select top 1 lookup_code from code_lookup where lookup_name = 'Contract Contact Via' and lower(code) = '" + lower(ls_lu_codename) + "' ) and a." + ls_lu_field + " is not null)) field_value, '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//										ls_syn_parent + " ctx_contract_contacts " + ls_no_link_on + " left join ctx_contacts on (ctx_contract_contacts.contact_id = ctx_contacts.contact_id )"
//				ls_other_where = " and ctx_contract_contacts.ic_area = '" +ls_ic_area + "' "
//	
//			Else
//				//ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),ctx_contacts."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from ctx_contacts," + Lower(ls_select_table) +  ls_use_link_sql + " WHERE " + "(" + Lower(ls_select_table) + "." + ls_select_field + " = ctx_contacts.contact_id) and "
//				//Begin - Added By Mark Lee 03/05/2014			
////				ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),ctx_contacts."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
////										ls_syn_parent +  ls_link_table + ls_link_table_on +  lower(ls_select_table) + ls_select_table_on + " left join ctx_contacts on(" + Lower(ls_select_table) + "." + ls_select_field + " = ctx_contacts.contact_id) "
//				if  ll_ctx_scrn_id = 2002 then 
//					ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),ctx_contacts."+ ls_select_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//										ls_syn_parent +  ls_link_table + ls_link_table_on +  lower(ls_select_table) + ls_select_table_on + " left join ctx_contacts on(" + Lower(ls_select_table) + "." + ls_select_field + " = ctx_contacts.contact_id) "					
//				else					
//					ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),ctx_contacts."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//										ls_syn_parent +  ls_link_table + ls_link_table_on +  lower(ls_select_table) + ls_select_table_on + " left join ctx_contacts on(" + Lower(ls_select_table) + "." + ls_select_field + " = ctx_contacts.contact_id) "
//				end if										
//				//End - Added By Mark Lee 03/05/2014													
//				//Add other contact - jervis 03.28.2011
//				if (ll_ctx_scrn_id = 6 or ll_ctx_scrn_id = 7 or ll_ctx_scrn_id = 14 or ll_ctx_scrn_id = 17) and lower(ls_select_table) = "ctx_contract_contacts" Then
//					ls_other_where = " and ctx_contract_contacts.ic_area = '" +ls_ic_area + "' "
//				end if
//			End If
//			//---------------------------- APPEON END ----------------------------
//			//Begin - Added By Mark Lee 03/05/2014
//			if  ll_ctx_scrn_id <> 2002 then 
//				ls_select_field  = "ctx_contacts_" + ls_lu_field
//			end if 
//			//End - Added By Mark Lee 03/05/2014		
//		
//		elseif ll_ctx_scrn_id = 2002 and (ls_select_field = 'phone' or ls_select_field = "ext" or ls_select_field = "contact_email") then  //Add by jervis 03.28.2011
//			ls_datatype = "C" 
//			//,(select top 1 A." + ls_lu_field+ " from ctx_contacts_numbers A where A.contact_id = ctx_contract_contacts.contact_id and a.via = (select top 1 lookup_code from code_lookup where lookup_name = 'Contract Contact Via' and lower(code) = '" + lower(ls_lu_codename) + "' ) and a." + ls_lu_field + " is not null))
//			ls_field_value = " convert(varchar(" + String(li_widthtemp) + "),"+ ls_select_table + "." +ls_select_field + ") "
//			
//			if ls_select_field = "contact_email" then
//				ls_lu_codename = "Email"
//			else
//				ls_lu_codename = "Phone"
//			end if
//				
//			ls_sny_retrieve = ls_sny_retrieve + ls_field_value + " field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//											ls_syn_parent +ls_link_table + ls_link_table_on +   Lower(ls_select_table) + ls_select_table_on
//			//overwrite link other where condition
//			if li_use_link = 1 and (ll_ctx_link_scrn_id = 6 or ll_ctx_link_scrn_id = 7 or ll_ctx_link_scrn_id = 14 or ll_ctx_link_scrn_id = 17) Then
//				ls_other_where = " and ("+ ls_select_table + ".via = (select top 1 lookup_code from code_lookup where lookup_name = 'Contract Contact Via' and lower(code) = '" + lower(ls_lu_codename) + "' and " + ls_select_table +  "." + ls_select_field + " is not null) and ctx_contract_contacts.ic_area = '" +ls_ic_link_area + "' ) "
//			end if
//		ElseIf ls_select_field = 'compute_1' Then
//			ls_datatype = "C"
//				
//			//ls_sny_retrieve = ls_synprefix + "Select " + ls_top + " ctx_contract_contacts.ctx_id, " + ls_tablepk + ls_Sortsel + String(ll_FieldSeqID) + " FieldSeqID,  isnull(ctx_contacts.last_name,'') + ','  + isnull(ctx_contacts.first_name,'') + case when isnull(ctx_contacts.middle_name,'') <> '' THEN ', ' + isnull(ctx_contacts.middle_name,'') else '' END field_value, '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from ctx_contract_contacts,ctx_contacts " + ", (" + ls_prac_sql + ") bb " + " where ctx_contract_contacts.contact_id = ctx_contacts.contact_id and ctx_contract_contacts.ic_area = '" + ls_ic_area + "' and "
//			if lb_get_parent then
//				ls_sny_retrieve = ls_synprefix + "Select " + ls_top + " table_1.ctx_id, " + ls_tablepk + ls_Sortsel + String(ll_FieldSeqID) + " FieldSeqID,  isnull(ctx_contacts.last_name,'') + ','  + isnull(ctx_contacts.first_name,'') + case when isnull(ctx_contacts.middle_name,'') <> '' THEN ', ' + isnull(ctx_contacts.middle_name,'') else '' END field_value, '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//										ls_syn_parent + " ctx_contract_contacts " + ls_no_link_on + " left join ctx_contacts on (ctx_contract_contacts.contact_id = ctx_contacts.contact_id and ctx_contract_contacts.ic_area = '" + ls_ic_area + "')"
//			ELSE
//				ls_sny_retrieve = ls_synprefix + "Select " + ls_top + " ctx_contract_contacts.ctx_id, " + ls_tablepk + ls_Sortsel + String(ll_FieldSeqID) + " FieldSeqID,  isnull(ctx_contacts.last_name,'') + ','  + isnull(ctx_contacts.first_name,'') + case when isnull(ctx_contacts.middle_name,'') <> '' THEN ', ' + isnull(ctx_contacts.middle_name,'') else '' END field_value, '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//										 " ctx_contract_contacts " +  " left join ctx_contacts on (ctx_contract_contacts.contact_id = ctx_contacts.contact_id and ctx_contract_contacts.ic_area = '" + ls_ic_area + "')"
//			END IF
//			ls_other_where = " and ctx_contract_contacts.ic_area = '" +ls_ic_area + "' "
//			ls_select_field  = "compute_1"
//		ElseIf ls_select_field = 'contact_phone' Then
//			ls_datatype = "C"
//			//ls_sny_retrieve = ls_synprefix + "Select " + ls_top + " ctx_contract_contacts.ctx_id, " + ls_tablepk + ls_Sortsel + String(ll_FieldSeqID) + " FieldSeqID,  (select top 1 A.phone from ctx_contacts_numbers A where A.contact_id = ctx_contract_contacts.contact_id and	a.via = (select lookup_code from code_lookup where lookup_name = 'Contract Contact Via' and code = 'Phone' ) and a.phone is not null) field_value, '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from ctx_contract_contacts,ctx_contacts where ctx_contract_contacts.contact_id = ctx_contacts.contact_id and ctx_contract_contacts.ic_area = '" + ls_ic_area + "' and "
//			if lb_get_parent then
//				ls_sny_retrieve = ls_synprefix + "Select " + ls_top + " table_1.ctx_id, " + ls_tablepk + ls_Sortsel + String(ll_FieldSeqID) + " FieldSeqID,  (select top 1 A.phone from ctx_contacts_numbers A where A.contact_id = ctx_contract_contacts.contact_id and	a.via = (select top 1 lookup_code from code_lookup where lookup_name = 'Contract Contact Via' and code = 'Phone' ) and a.phone is not null) field_value, '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//										ls_syn_parent + " ctx_contract_contacts " + ls_no_link_on + " left join ctx_contacts on(ctx_contract_contacts.contact_id = ctx_contacts.contact_id ) "
//			else
//				ls_sny_retrieve = ls_synprefix + "Select " + ls_top + " ctx_contract_contacts.ctx_id, " + ls_tablepk + ls_Sortsel + String(ll_FieldSeqID) + " FieldSeqID,  (select top 1 A.phone from ctx_contacts_numbers A where A.contact_id = ctx_contract_contacts.contact_id and	a.via = (select top 1 lookup_code from code_lookup where lookup_name = 'Contract Contact Via' and code = 'Phone' ) and a.phone is not null) field_value, '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//										" ctx_contract_contacts  left join ctx_contacts on(ctx_contract_contacts.contact_id = ctx_contacts.contact_id ) "
//			end if
//			ls_other_where = " and ctx_contract_contacts.ic_area = '" +ls_ic_area + "' "
//		ElseIf ls_select_field = 'contact_email' Then
//			ls_datatype = "C"
//			If lb_get_parent Then
//				//ls_sny_retrieve = ls_synprefix + "Select " + ls_top + " ctx_contract_contacts.ctx_id, " + ls_tablepk + ls_Sortsel + String(ll_FieldSeqID) + " FieldSeqID,  (select top 1 A.contact_email from ctx_contacts_numbers A where A.contact_id = ctx_contract_contacts.contact_id and a.via = (select lookup_code from code_lookup where lookup_name = 'Contract Contact Via' and code = 'Email' ) and a.contact_email is not null) field_value, '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from ctx_contract_contacts,ctx_contacts " + ", (" + ls_prac_sql + ") bb " + " where ctx_contract_contacts.contact_id = ctx_contacts.contact_id and ctx_contract_contacts.ic_area = '" + ls_ic_area + "' and "
//				ls_sny_retrieve = ls_synprefix + "Select " + ls_top + " table_1.ctx_id, " + ls_tablepk + ls_Sortsel + String(ll_FieldSeqID) + " FieldSeqID,  (select top 1 A.contact_email from ctx_contacts_numbers A where A.contact_id = ctx_contract_contacts.contact_id and	a.via = (select top 1 lookup_code from code_lookup where lookup_name = 'Contract Contact Via' and code = 'Email' ) and a.contact_email is not null) field_value, '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//										ls_syn_parent + " ctx_contract_contacts " + ls_no_link_on + " left join ctx_contacts on(ctx_contract_contacts.contact_id = ctx_contacts.contact_id ) "
//			Else
//				ls_sny_retrieve = ls_synprefix + "Select " + ls_top + " ctx_contract_contacts.ctx_id, " + ls_tablepk + ls_Sortsel + String(ll_FieldSeqID) + " FieldSeqID,  (select top 1 A.contact_email from ctx_contacts_numbers A where A.contact_id = ctx_contract_contacts.contact_id and	a.via = (select top 1 lookup_code from code_lookup where lookup_name = 'Contract Contact Via' and code = 'Email' ) and a.contact_email is not null) field_value, '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//										" ctx_contract_contacts  left join ctx_contacts on(ctx_contract_contacts.contact_id = ctx_contacts.contact_id ) "
//			End If
//			ls_other_where = " and ctx_contract_contacts.ic_area = '" +ls_ic_area + "' "
//		ElseIf Upper(ls_db_lookup_type)  = "C" Then //code lookup table
//			
//			ls_datatype_ctx = of_get_coltype(lds_dataobject,ls_select_field_ctx) //03.25.2011 by jervis
//			
//			//--------------------------- APPEON BEGIN ---------------------------
//			//$<modify> 03.19.2007 By: Jack (Export)
//			//$<reason> Fix a defect.
//			If Upper(ls_lu_field) = "LOOKUP_CODE" Then
//				ls_datatype = "N"
//			Else
//				ls_datatype = "C"
//			End If
//			
//			if ls_datatype_ctx = 'N' then //Non't convert - jervis 03.25.2011
//				If ls_select_table <> 'app_facility' Then
//					//ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),code_lookup."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from code_lookup," + Lower(ls_select_table) +  ls_use_link_sql + " WHERE " + "(convert(varchar," + Lower(ls_select_table) + "." + ls_select_field + ") = convert(varchar,code_lookup.lookup_code)) and "
//					ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),code_lookup."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//											ls_syn_parent + ls_link_table + ls_link_table_on +  Lower(ls_select_table) + ls_select_table_on + " left join code_lookup on (" + Lower(ls_select_table) + "." + ls_select_field + " = code_lookup.lookup_code) "
//				Else
//					//ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),code_lookup."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from ctx_basic_info,code_lookup," + lower(ls_select_table) +  ls_use_link_sql + " WHERE " + "(convert(varchar," + lower(ls_select_table) + "." + ls_select_field + ") = convert(varchar,code_lookup.lookup_code)) and "			
//					ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),code_lookup."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//											ls_syn_parent + ls_link_table + ls_link_table_on +  " ctx_basic_info " + ls_select_table_on + " left join app_facility on(ctx_basic_info.app_facility = app_facility.facility_id) left join code_lookup on (" + lower(ls_select_table) + "." + ls_select_field + " = code_lookup.lookup_code) "			
//				End If
//			else
//				If ls_select_table <> 'app_facility' Then
//					//ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),code_lookup."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from code_lookup," + Lower(ls_select_table) +  ls_use_link_sql + " WHERE " + "(convert(varchar," + Lower(ls_select_table) + "." + ls_select_field + ") = convert(varchar,code_lookup.lookup_code)) and "
//					ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),code_lookup."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//											ls_syn_parent + ls_link_table + ls_link_table_on +  Lower(ls_select_table) + ls_select_table_on + " left join code_lookup on (convert(varchar," + Lower(ls_select_table) + "." + ls_select_field + ") = convert(varchar,code_lookup.lookup_code)) "
//				Else
//					//ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),code_lookup."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from ctx_basic_info,code_lookup," + lower(ls_select_table) +  ls_use_link_sql + " WHERE " + "(convert(varchar," + lower(ls_select_table) + "." + ls_select_field + ") = convert(varchar,code_lookup.lookup_code)) and "			
//					ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),code_lookup."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//											ls_syn_parent + ls_link_table + ls_link_table_on +  " ctx_basic_info " + ls_select_table_on + " left join app_facility on(ctx_basic_info.app_facility = app_facility.facility_id) left join code_lookup on (convert(varchar," + lower(ls_select_table) + "." + ls_select_field + ") = convert(varchar,code_lookup.lookup_code)) "			
//				End If
//			end if
//			//---------------------------- APPEON END ----------------------------
//			ls_select_field  = "code_lookup_" + ls_lu_field
//		elseif Upper(ls_db_lookup_type) = "P" then
//			ls_datatype_ctx = of_get_coltype(lds_dataobject,ls_select_field_ctx) //03.25.2011 by jervis
//			//Company dddw process--jervis 12.9.2009
//			ls_datatype = "C"
//			if ls_datatype_ctx = 'N' then //Jervis 03.25.2011
//				//Added By Mark Lee 03/05/2014 	for  ll_ctx_scrn_id = 2003
//				if  ll_ctx_scrn_id = 2003 then 
//					ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),app_facility."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//									ls_syn_parent + ls_link_table + ls_link_table_on +  " ctx_basic_info " + ls_select_table_on + " left join app_facility on(" + Lower(ls_select_table) + "." + ls_select_field + " = app_facility.facility_id) "					
//				else					
//					ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),app_facility."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//									ls_syn_parent + ls_link_table + ls_link_table_on +  Lower(ls_select_table) + ls_select_table_on + " left join app_facility on(" + Lower(ls_select_table) + "." + ls_select_field + " = app_facility.facility_id) "
//				end if									
//			else
//				ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),app_facility."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//									ls_syn_parent + ls_link_table + ls_link_table_on +  Lower(ls_select_table) + ls_select_table_on + " left join app_facility on(convert(varchar," + Lower(ls_select_table) + "." + ls_select_field + ") = convert(varchar,app_facility.facility_id)) "
//			end if
//			ls_select_field  = "app_facility_" + ls_lu_field
//		ElseIf Upper(ls_db_lookup_type)  = "A" Then //address lookup table		
//			If ls_lu_field = "description"  Then
//				gnv_debug.of_output(true, 'Alarm  Export:' +  "The address lookup field set for export field '" + ls_select_field + "' is improperly set" ) //added by gaivns 20120912
//				MessageBox("Data Error on field " + ls_export_field,"The address lookup field set for export field '" + ls_select_field + "' is improperly set.  You cannot use description, try entity_name.  Please correct.")
//				Close(w_export_progress)
//				
//				Destroy lds_export_flds
//				Destroy lds_export_hdr
//				Destroy lds_address_lookup
//				Destroy lds_code_lookup
//				Destroy lds_export_equiv_code
//				Destroy lds_dataobject
//				Destroy lds_linkto
//				Destroy lds_field
//				Destroy lds_export_dataTemp
//				Destroy lds_tablepk
//				Destroy lds_export_data
//				//<del> 2008-05-04 by:nova
//				//end of add
//				//$<add> 01.07.2008 by: Andy
//				//if lb_ASA7 then gnv_appeondb.of_commitqueue( )
//				Return 0
//				
//			Else
//				If Upper(ls_lu_field) = "LOOKUP_CODE" Then
//					ls_datatype = "N"
//				ElseIf Upper(ls_lu_field) = "CUSTOM_1" Or Upper(ls_lu_field) = "CUSTOM_2" Then //maha 050704 
//					ls_datatype = "N"
//				Else
//					ls_datatype = "C"
//				End If
//				
//				//ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),address_lookup."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from address_lookup," + Lower(ls_select_table) +  ls_use_link_sql + " WHERE " + "(convert(varchar," + Lower(ls_select_table) + "." + ls_select_field + ") = convert(varchar,address_lookup.lookup_code)) and "
//				ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),address_lookup."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//										ls_syn_parent +  ls_link_table + ls_link_table_on +  Lower(ls_select_table) + ls_select_table_on + " left join address_lookup on (convert(varchar," + Lower(ls_select_table) + "." + ls_select_field + ") = convert(varchar,address_lookup.lookup_code)) "
//
//				ls_select_field  = "address_lookup_" + ls_lu_field
//			End If
//		ElseIf ls_db_lookup_type = "X" Then //ToDo:
//			ls_datatype = ldwc_dddw.Describe( ls_lu_field + ".coltype")
//			Choose Case Left ( ls_datatype , 5 )
//				Case "char(", "char"
//					ls_datatype = "C"
//				Case "date"	,"datet"	,"time", "times"
//					ls_datatype = "D"
//				Case "decim","numbe", "doubl", "real","long", "ulong", "int"
//					ls_datatype = "N"
//			End Choose
//			
//			//Begin - Added By Mark Lee 03/06/2014
//			if ll_ctx_scrn_id = 51 and ( lower(ls_select_field) = 'received_by' or lower(ls_select_field) = 'doc_from_name' ) then 
//				ls_field_value = " convert(varchar(" + String(li_widthtemp) + ")," + & 
//									" case when "+ls_select_field+" is null then null when isnumeric("+ls_select_field+") = 1 then (SELECT top 1 " + &
//									" name = last_name + ',' + first_name + (CASE WHEN middle_name IS NULL or rtrim(middle_name) = '' THEN '' ELSE ','+middle_name END) " + &
//    									" FROM ctx_contacts WHERE ctx_contacts.contact_id = convert(int,"+ls_select_table+"."+ls_select_field+" ) )  else "+ls_select_field+" end " + &
//										 ")"
//				ls_sny_retrieve = ls_sny_retrieve + ls_field_value+ " field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//										ls_syn_parent + ls_link_table + ls_link_table_on +  Lower(ls_select_table) + ls_select_table_on 			
//			else						
//				If Upper(ls_datatype) = 'D' Then
//					ls_field_value = " convert(varchar(16)," + ls_dddwtable + "."+ ls_dddw_column_dbname + ",120)"
//				else
//					ls_field_value = " convert(varchar(" + String(li_widthtemp) + ")," + ls_dddwtable + "."+ ls_dddw_column_dbname + ")"
//				end if
//				
//				//ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(16)," + ls_dddwtable + "."+ ls_dddw_column_dbname + ",120) field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + ls_dddwtable + "," + &
//				//		Lower(ls_select_table) +  ls_use_link_sql + " WHERE " + "(" + Lower(ls_select_table) + "." + &
//				//		ls_select_field + " = " + ls_dddwtable + "." + ls_dddwdata + ") and "
//				ls_sny_retrieve = ls_sny_retrieve + ls_field_value+ " field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//										ls_syn_parent + ls_link_table + ls_link_table_on +  Lower(ls_select_table) + ls_select_table_on + &
//										" left join " +ls_dddwtable + " on(" + Lower(ls_select_table) + "." +	ls_select_field + " = " + ls_dddwtable + "." + ls_dddwdata + ") "
//				ls_select_field  = ls_dddwtable + "_" + ls_dddw_column_dbname
//			end if
//			//End - Added By Mark Lee 03/06/2014
//		Else // NON LOOKUP FIELDS
//			ls_datatype = of_get_coltype(lds_dataobject,ls_select_field_ctx) //03.17.2009 by jervis
//						
//			If IsNull(ls_datatype) Then MessageBox("Datatype Not Anticipated","Retrieved null datatype")
//			
//			If Len(ls_aggre) > 0 Then //maha 012703 for aggregate functions
//				//ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + ")," + ls_aggre + "("	+ ls_select_table + "." + ls_select_field + ")) field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + Lower(ls_select_table) +  ls_use_link_sql + " WHERE "
//				ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + ")," + ls_aggre + "("	+ ls_select_table + "." + ls_select_field + ")) field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//										ls_syn_parent + Lower(ls_select_table) + ls_select_table_on
//			Else
//				if Upper(ls_datatype) = "D" then
//					ls_field_value = " convert(varchar(16),"+ ls_select_table + "." +ls_select_field + ",120) "
//				else
//					ls_field_value = " convert(varchar(" + String(li_widthtemp) + "),"+ ls_select_table + "." +ls_select_field + ") "
//				end if
//				If ls_select_table <> 'app_facility' Then
//					//ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(16),"+ ls_select_table + "." +ls_select_field + ",120) field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + Lower(ls_select_table) +  ls_use_link_sql + " WHERE "
//					ls_sny_retrieve = ls_sny_retrieve + ls_field_value + " field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//											ls_syn_parent +ls_link_table + ls_link_table_on +   Lower(ls_select_table) + ls_select_table_on
//				Else
//					//ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(16),"+ ls_select_table + "." +ls_select_field + ",120) field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from ctx_basic_info," + Lower(ls_select_table) +  ls_use_link_sql + " WHERE "
//					ls_sny_retrieve = ls_sny_retrieve + ls_field_value + " field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//											ls_syn_parent + ls_link_table + ls_link_table_on +  " ctx_basic_info " + ls_select_table_on + " left join " + Lower(ls_select_table) + " on(ctx_basic_info.app_facility = app_facility.facility_id)"
//				End If
//			End If
//		End If
//		
//		//export_fields_use_link  sql
//		If li_use_link = 1 Then
//			//If Upper(ls_db_lookup_type) = "A" Or Upper(ls_db_lookup_type) = "C" Then
//			If Upper(ls_db_lookup_type) = "A" Or Upper(ls_db_lookup_type) = "C" or Upper(ls_db_lookup_type) = "X" or Upper(ls_db_lookup_type)  = 'R' Then
//			Else
//				ls_select_field = ls_select_table_trim + "_" + ls_select_field
//			End If
//		End If
//
//		//If ls_select_table <> 'app_facility' Then
//			//modify 08/15/2007 by: Andy
//			If ai_type = 1 Then
//				//ls_sny_retrieve = ls_sny_retrieve + ls_usetable + ".ctx_id  = bb.ctx_id "  + ls_filter
//				ls_sny_retrieve = ls_sny_retrieve + ", (" + ls_prac_sql + ") bb where " + ls_ctx_table + ".ctx_id  = bb.ctx_id and bb.ctx_id > 0 "  + ls_other_where + ls_filter	//jervis 08.26.2009 add bb.ctx_id > 0
//			ElseIf ai_type = 3 Then
//				//ls_sny_retrieve = ls_sny_retrieve + ls_usetable + ".ctx_id " + ls_prac_ids + ls_filter
//				ls_sny_retrieve = ls_sny_retrieve + " where " + ls_ctx_table + ".ctx_id " + ls_prac_ids + ls_other_where + ls_filter
//			ElseIf ai_type = 2 Then
//				If lb_usingdb Then
//					ls_sny_retrieve = ls_sny_retrieve + " Inner Join ic_client_data on (" + ls_ctx_table + ".ctx_id = ic_client_data.data_int and ic_client_data.client_id = '"+ls_client_id+"' ) where 1 = 1 "  + ls_other_where + ls_filter
//				Else
//					ls_sny_retrieve = ls_sny_retrieve + " where " + ls_ctx_table + ".ctx_id  in (" + ls_prac_ids  + ")"  + ls_other_where + ls_filter
//				End If
//				
//			End If
//			//end of modify
//		/*
//		Else
//			//------------------Begin Modified by Alfee on 08.18.2008------------------------------------
//			//<$Reason>Fix a bug of duplicate records while 2 or more contracts have the same company 
//			If ai_type = 1 Then
//				ls_sny_retrieve = ls_sny_retrieve + " ctx_basic_info.app_facility = app_facility.facility_id and ctx_basic_info.ctx_id = bb.ctx_id and " + Lower(ls_select_table) + ".facility_id in (select ctx_basic_info.app_facility from ctx_basic_info where ctx_basic_info.ctx_id  = bb.ctx_id )"  + ls_filter
//			ElseIf ai_type = 3 Then
//				ls_sny_retrieve = ls_sny_retrieve + " ctx_basic_info.app_facility = app_facility.facility_id and ctx_basic_info.ctx_id " + ls_prac_ids + " and " + Lower(ls_select_table) + ".facility_id in (select ctx_basic_info.app_facility from ctx_basic_info where ctx_basic_info.ctx_id " + ls_prac_ids  + " )"  + ls_filter
//			ElseIf ai_type = 2 Then
//				ls_sny_retrieve = ls_sny_retrieve + " ctx_basic_info.app_facility = app_facility.facility_id and ctx_basic_info.ctx_id in (" + ls_prac_ids + ") and " + Lower(ls_select_table) + ".facility_id in (select ctx_basic_info.app_facility from ctx_basic_info where ctx_basic_info.ctx_id  in (" + ls_prac_ids  + "))"  + ls_filter
//			End If
//			//------------------End Modified -------------------------------------------------------------							
//		End If
//		*/
//
//		
//		//2nd last add  - prac where
//		If Len(ls_aggre) > 0 Then //maha 012703 for aggregate functions
//			//modify 08/15/2007 by: Andy
//			ls_sny_retrieve = ls_sny_retrieve + " Group by " + ls_ctx_table + ".ctx_id , FieldSeqID ,  field_data_type" + ls_RowNo
//		End If
//		
//		//modify 08/23/2007 by: Andy
//		If Len(ls_sort) > 0 And Not lb_true Then//SQL2000 only 
//			//ls_sny_retrieve = ls_sny_retrieve + "~r~n order by " + ls_sort 
//			ls_sny_retrieve = ls_sny_retrieve + "~r~n " + ls_sort
//		End If
//		//end of modify
//		
//		//modify 05/05/2008 by: Andy
//		ls_sny_retrieve = ls_sny_retrieve + " ) t" + String(ll_FieldSeqID)
//		
//		//Added By Jay Chen 07-09-2014 remark:validate field sql syntax
//		if ib_validate_field_sql then
//			ls_sqlerrtext = ''	
//			ls_parsesql = "set parseonly on " + ls_sny_retrieve 
//			EXECUTE Immediate :ls_parsesql Using Sqlca;
//			ls_sqlerrtext = Sqlca.sqlerrtext
//			ls_parseoff = "set parseonly off "  
//			EXECUTE Immediate :ls_parseoff Using Sqlca;
//			if isnull(ls_sqlerrtext) then ls_sqlerrtext = ''
//			if ls_sqlerrtext <> '' then
//				MessageBox("Validate export setting","The setting of the export column name [" + ls_name + "] is error, please check and correct it.")
//				return -1				
//			end if
//		end if
//		//end add
//		
//		//end of add
//		If IsNull(ls_sny_retrieve) Then ls_sny_retrieve = ""
//		If Len(ls_sny_retrieve) > 0 Then
//			If ls_UnionSQL = "" Then
//				ls_UnionSQL = ls_sny_retrieve
//			Else
//				ls_UnionSQL = ls_UnionSQL + "~r~n union all ~r~n" + ls_sny_retrieve
//			End If
//		End If
//		//<add> andy 2007.05.25 
//	Else //computer fields
//		//Dynamic create computer columns in order to Calculate its value
//		/*1.deal with Expression**************/
//		ls_export_field     = lds_export_flds.GetItemString(p,"export_field_name")
//		//<add> 08/24/2007 by: Andy
//		of_replacespecchar(ls_export_field)
//		//end of add
//		ls_Expresstion      = Trim( lds_export_flds.GetItemString( p, "export_fields_expression" ) )//db_field_name
//		ls_ComputerDataType = lds_export_flds.GetItemString(p,"ctx_column_datatype")
//		If IsNull(ls_export_field) Then ls_export_field = ''
//		If IsNull(ls_Expresstion) Then ls_Expresstion = ''
//		If IsNull(ls_ComputerDataType) Then ls_ComputerDataType = ''
//		If IsNull(ls_field_format) Then ls_field_format = ''
//		If IsNull(ls_fld_delim) Then ls_fld_delim = ''
//		ll_Cnt = lds_field.RowCount()
//		
//		//If the computer field is numeric,add the function number(  ) in to the Expresstion.
//		//Replace symbol ' with "
//		//comment 07/18/2007 by:Andy Reason:support other data type
//		//if upper(ls_ComputerDataType) = 'N' then
//		For ll_Num = 1 To ll_Cnt
//			ls_Field         = lds_field.GetItemString(ll_Num,"export_field_name")
//			ls_FieldDataType = lds_field.GetItemString(ll_Num,"ctx_column_datatype")
//			If IsNull(ls_Field) Then ls_Field = ''
//			If IsNull(ls_FieldDataType) Then ls_FieldDataType = ''
//			//<add> 07/27/2007 by: Andy 
//			//Reason:The Expresstion of a computer field cann't contain itself.
//			If Lower(ls_export_field) = Lower(ls_Field) Then Continue
//			//end of add
//			
//			//If the field used in then computer field and is number, 
//			//add the function number(  ) in to the Expresstion 
//			//Modify 07/18/2007 by: Andy
//			If Pos(Lower(ls_Expresstion),Lower(ls_Field)) > 0 Then
//				If Upper(ls_FieldDataType) = 'N' Then
//					//Modify 07/17/2007 by: Andy if( isNull( rec_id  ), 0,  rec_id  )
//					ls_Expresstion  = of_globalreplace( ls_Expresstion, ls_Field, "if( isNull( "+ls_Field+" ),0,number( " + ls_Field + " ))",True)
//					//end of modify
//				ElseIf Upper(ls_FieldDataType) = 'S' Then
//					//string
//					ls_Expresstion  = of_globalreplace( ls_Expresstion, ls_Field, "if( isNull( "+ls_Field+" ),''," + ls_Field + " )",True)
//					//<add> 07/27/2007 by: Andy	
//				ElseIf Upper(ls_FieldDataType) = 'D' Then
//					//Datetime
//					ls_Expresstion  = of_globalreplace( ls_Expresstion, ls_Field, "if( isNull( "+ls_Field+" ),'1900-01-01'," + ls_Field + " )",True)
//					//end of add	
//				End If
//			End If
//			//end of Modify
//		Next
//		//end if
//		
//		//replace symbol ' with "
//		ls_Expresstion  = lnvo_string.of_globalreplace( ls_Expresstion, '~~', '~~~~')
//		ls_Expresstion  = lnvo_string.of_globalreplace( ls_Expresstion, '"', '~~"') //'"'
//		//ls_Expresstion  = lnvo_string.of_globalreplace( ls_Expresstion, "'", "~~'")//'"'
//		/*end of 1***************************/
//		
//		//Modify By Jervis 01.18.2010
//		//Tab and ~ exists bug
//		//ls_tag = ls_field_format + '@^@' + ls_ComputerDataType + '@^@' + String(li_width) + '@^@' + ls_fld_delim
//		ls_tag = ls_field_format + '@^@' + ls_ComputerDataType + '@^@' + String(li_width) + '@^@'
//		If ls_field_format = "Leading Padding" Or ls_field_format = "Trailing Padding" Then
//			ls_tag += ls_fld_delim
//		end if
//		//2.Dynamic create computer columns,the name equal ls_Field + '_c'
//		ls_Modify = "create compute(band=detail alignment='0' expression=~""+ls_Expresstion+"~" border='0' color='33554432' x='1157'" + &
//			" y='4' height='64' width='242' format='[GENERAL]' html.valueishtml='0'  name=" + ls_export_field + "_c visible='0'" + &
//			" font.face='MS Sans Serif' font.height='-8' font.weight='400'  font.family='2' font.pitch='2' font.charset='0'" + &
//			" background.mode='1' background.color='536870912' tag='" + ls_tag + "' )"
//		ls_Err    = lds_export_dataTemp.Modify(ls_Modify)
//		//end of 2		
//		//end of add
//	End If
//Next
//
////Added By Jay Chen 07-09-2014 remark:validate field sql syntax
//if ib_validate_field_sql then  
//	MessageBox("Validate export setting","The validate setting of the export column name is success.")
//	return 1
//end if
////end add
//
////<del> 2008-05-04 by:nova
////<add> 08/23/2007 by: Andy
////if lb_ASA7 then gnv_appeondb.of_commitqueue( )
//
//w_export_progress.hpb_bar.Position = 15
////w_export_progress.r_bar.Width = w_export_progress.r_bar.Width + 50
//w_export_progress.st_export.Text = "Retrieve Data"
//
//ll_FieldCnt = ll_FieldSeqID
//If ls_UnionSQL <> "" Then
//	//Modify 08/23/2007 by: Andy
//	If lb_true Then//SQL2005 and ASA9
//		ls_UnionSQL = ls_UnionSQL + "~r~n order by " + "FieldSeqID, ctx_id , Row_No"
//	End If
//	
//	
//	//<add> 08/24/2007 by: Andy
//	If lb_true Then ls_RowNo = ", 0 Row_No"//SQL2005 AND ASA9
//	ls_SqlSelect = "Select top 1 0 prac_id, 1 FieldSeqID,   cast('' as varchar(" + String(ll_maxwidth) + ")) field_value,  ' ' field_data_type" + ls_RowNo + " from pd_basic"
//	
//	
//	ls_dwsyntax_str = SQLCA.SyntaxFromSQL(ls_SqlSelect, ls_presentation_str, Errors)
//	If Len(Errors) > 0 Then
//		gnv_debug.of_output(true, 'Alarm  Export:' +  "SyntaxFromSQL caused these errors: " + Errors + "~r~r" + ls_SqlSelect  ) //added by gaivns 20120912
//		// + ls_export_field
//		MessageBox("Caution on export field ", &
//			"SyntaxFromSQL caused these errors: " + Errors + "~r~r" + ls_SqlSelect)
//		Close(w_export_progress)
//		Destroy lds_export_flds
//		Destroy lds_export_hdr
//		Destroy lds_address_lookup
//		Destroy lds_code_lookup
//		Destroy lds_export_equiv_code
//		Destroy lds_dataobject
//		Destroy lds_linkto
//		Destroy lds_field
//		Destroy lds_export_dataTemp
//		Destroy lds_tablepk
//		Destroy lds_export_data
//		//end of add
//		Return -1
//	End If
//	
//	lds_export_retrieve = Create n_ds
//	w = lds_export_retrieve.Create( ls_dwsyntax_str, Errors)
//	If w < 1 Then
//		//messagebox("error on create",errors)
//		gnv_debug.of_output(true, 'Alarm  Export:' +  "lds_export_retrieve create  errors: " + Errors  + '~r' + ls_SqlSelect   ) //added by gaivns 20120912
//				MessageBox("Error on Create",Errors)
//		Close(w_export_progress)
//		Destroy lds_export_flds
//		Destroy lds_export_hdr
//		Destroy lds_address_lookup
//		Destroy lds_code_lookup
//		Destroy lds_export_equiv_code
//		Destroy lds_dataobject
//		Destroy lds_linkto
//		Destroy lds_field
//		Destroy lds_export_dataTemp
//		Destroy lds_tablepk
//		Destroy lds_export_data
//		//end of add
//		Return -1
//	End If
//	
//	//Modify 08/23/2007 by: Andy
//	lds_export_retrieve.Modify('DataWindow.Table.Select="' + ls_UnionSQL + '"')
//	
//	
//	lds_export_retrieve.SetTransObject( SQLCA )
//	ll_ret_cnt = lds_export_retrieve.Retrieve()
//	
//	//<add> 05/05/2008 by: Andy
//	If ll_ret_cnt < 0 Then
//		
//		gnv_debug.of_output(true, 'Alarm  Export:' +  "lds_export_retrieve retrieve<0 " + '~r' + ls_UnionSQL  ) //added by gaivns 20120912
//		//Reason:check syntax
//		ls_presentation_str = "style(type=grid)"
//		
//		ls_dwsyntax_str = SQLCA.SyntaxFromSQL(ls_UnionSQL, ls_presentation_str, Errors)
//		If Len(Errors) > 0 Then
//			gnv_debug.of_output(true, "Caution on export: " + "SyntaxFromSQL caused these errors: " + Errors)    //Added By Mark Lee 02/01/2013
//			MessageBox("Caution on export" , &
//				"SyntaxFromSQL caused these errors: " + Errors)
//			Close(w_export_progress)
//			If IsValid(lds_export_flds) Then Destroy lds_export_flds
//			If IsValid(lds_export_hdr) Then Destroy lds_export_hdr
//			If IsValid(lds_address_lookup) Then Destroy lds_address_lookup
//			If IsValid(lds_code_lookup) Then Destroy lds_code_lookup
//			If IsValid(lds_export_data) Then Destroy lds_export_data
//			If IsValid(lds_field) Then Destroy lds_field
//			If IsValid(lds_export_dataTemp) Then Destroy lds_export_dataTemp
//			If IsValid(lds_export_equiv_code) Then Destroy lds_export_equiv_code
//			Destroy lds_tablepk
//			
//			Return -1
//		End If
//	End If
//	//end of add
//End If
//
//w_export_progress.hpb_bar.Position = 20
////Modify 08/22/2007 by: Andy
////li_bar_ticks = 70 / li_prac_id_cnt
//li_bar_ticks = 70 / li_fld_cnt
//
////%%%%%%%%%%%%%%%%%%%%%%%%%%%% end of create syntax
////Begin - Modified By Mark Lee 09/29/2013 add the abn_update_sqltext condition.
//if abn_update_sqltext = false then 		
//	ls_prac_field = lds_export_retrieve.Describe("#1.name")
//	
//	Do While (ll_i <= ll_ret_cnt)
//	
//		ll_j = 0
//		ls_data_value = ""
//		ls_value = ""
//		ls_lookup_val = ""
//		ldt_value = DateTime(Date("0000-00-00"),Time("00:00:00"))
//		
//		ll_pracid       = lds_export_retrieve.GetItemNumber(ll_i,ls_prac_field)
//		ll_FieldSeqID   = lds_export_retrieve.GetItemNumber(ll_i,"FieldSeqID")
//		li_recd_no      = li_recdnoList[ll_FieldSeqID]
//		//add 08/22/2007 by: Andy
//		ls_select_table = ls_tablelist[ll_FieldSeqID]
//		ls_select_field = ls_selectfieldlist[ll_FieldSeqID]
//		ls_export_field = ls_fieldlist[ll_FieldSeqID]
//		ls_field_format = ls_formatList[ll_FieldSeqID]
//		ll_export_code  = ll_exportcodeList[ll_FieldSeqID]
//		//<add> 08/21/2007 by: Andy
//		li_sub_start    = li_substartList[ll_FieldSeqID]
//		//end of add
//		li_width        = li_widthList[ll_FieldSeqID]
//		ls_fld_delim    = ls_flddelimList[ll_FieldSeqID]
//		ls_text         = ls_textList[ll_FieldSeqID]
//		ls_lu_field     = ls_lu_fieldList[ll_FieldSeqID]
//		li_act_format   = li_act_formatList[ll_FieldSeqID]
//		
//		ud = li_udList[ll_FieldSeqID]
//		If ud = 1 Then
//			ls_def_val = ls_defvalList[ll_FieldSeqID]
//		ElseIf ud = 2 Then //column default
//			col = Long(ls_defvalList[ll_FieldSeqID])
//		Else
//			ls_def_val = ""
//		End If
//		
//		//Modify 08/22/2007 by: Andy
//		If ll_FieldSeqIDold <> ll_FieldSeqID Then
//			ll_R = 0
//			//ll_R = lds_export_data.Find("rec_id= " + String(ll_pracid),ll_R + 1,li_prac_id_cnt)
//			ll_FieldSeqIDold = ll_FieldSeqID
//			w_export_progress.st_export.Text  = ls_select_table + "_" + ls_select_field //string(ll_FieldSeqID) + "   " + 
//			w_export_progress.st_export1.Text = ls_select_field
//			
//			//if mod(ll_R,n) = 0 then
//			If Mod(ll_FieldSeqID,n) = 0 Then
//				w_export_progress.hpb_bar.Position = w_export_progress.hpb_bar.Position + 1
//			End If
//			//ll_Rorig = ll_R
//		End If
//		
//		//MODIFY 10/12/2007 by:Andy
//		//ll_R = lds_export_data.Find("rec_id= " + String(ll_pracid),ll_R + 1,li_prac_id_cnt)
//		For ll_R = ll_R + 1 To li_prac_id_cnt
//			If al_ctx_ids[ll_R] = ll_pracid Then Exit
//		Next
//		//end of modify
//		
//		//<ADD> 07/12/2007 by: Andy Find the max row of the current ll_FieldSeqID
//		//modify 08/22/2007 by: Andy Find the max row of the current ll_pracid
//		ls_find = "(" + ls_prac_field + " > " + String(ll_pracid) + " AND FieldSeqID = " + String(ll_FieldSeqID) + &
//			") OR ( FieldSeqID  > " + String(ll_FieldSeqID) + ")"
//		ll_j    = lds_export_retrieve.Find ( ls_find, ll_i + 1, ll_ret_cnt )
//		If ll_j > 0 Then
//			//The max row of the current FieldSeqID
//			ll_j = ll_j - 1
//		End If
//		
//		//Perhaps it is the last ll_pracid and it is the max FieldSeqID,
//		//then set ll_j = ll_ret_cnt(max row in the ds)
//		If ll_j = 0 Then
//			ll_j = ll_ret_cnt
//		End If
//		
//		//max - min + 1 = total(current FieldSeqID)
//		If ll_j - ll_i + 1 >= li_recd_no Then
//			//find out
//			ll_prac_row = ll_i + li_recd_no - 1
//		Else
//			//Not 
//			ll_prac_row = 0
//		End If
//		//END OF addd
//		
//		//process data
//		If ll_prac_row > 0 Then
//			ls_datatype     = lds_export_retrieve.GetItemString(ll_prac_row, "field_data_type" )
//			
//			//if li_billing = 1 then //maha app080205 to get billing address data 
//			//	ll_billing_id   = lds_export_retrieve.getitemnumber(ll_prac_row, "billing_address_id" )
//			//	ls_data_value = of_get_billing(ll_billing_id,ls_datatype,ls_select_field,ls_field_format,ls_billsynList[ll_FieldSeqID])//ls_bill_syn
//			//else
//			ls_data_value = lds_export_retrieve.GetItemString(ll_prac_row, "field_value")
//			//end if
//		Else
//			//do nothing
//		End If
//		
//		//comment 08/24/2007 by: Andy
//		//ls_export_field = lnvo_string.of_globalreplace( ls_export_field, "#", "_")
//		//<add> andy 07.05.2007 save original values
//		If Lower(lds_export_dataTemp.Describe(ls_export_field + ".name")) = Lower(ls_export_field) Then
//			lds_export_dataTemp.SetItem(ll_R,ls_export_field,ls_data_value)
//		End If
//		//end of add
//		
//		If ls_format = "export" Then
//			If IsNull(ls_data_value) Then ls_data_value = ""
//		End If
//		
//		//<add> 08/28/2007 by: Andy
//		of_data_format(ls_field_format,ls_datatype,ls_data_value)
//		//end of add
//		
//		
//		//$<add> 05.29.2007 By: Jack
//		//$<reason> Fix a defect.
//		If ls_lu_field = 'contact_department' Or ls_lu_field = 'contact_title' Or ls_lu_field = 'contact_type' Then
//			//modify 09/05/2007 by: Andy Reason:get description
//			//ls_data_value = gnv_data.of_getitem('code_lookup', 'code', "lookup_code = " + ls_data_value)
//			ls_data_value = gnv_data.of_getitem('code_lookup', 'description', "lookup_code = " + ls_data_value)
//		End If
//		
//		//*****GET EXPORT CODES
//		//if lds_export_flds.GetItemnumber( p, "export_code" )  = 1 then //get export code if required
//		If ll_export_code  = 1 Then //get export code if required
//			ls_lookup_val = ls_data_value    //lds_export_data.getitemstring(i,p) //changed 100102
//			If IsNull(ls_lookup_val) Then ls_lookup_val = ''
//			
//			//Convert data type - jervis 03.25.2011
//			if isnumber(ls_lookup_val) then 
//				ls_lookup_code = string(long(ls_lookup_val))
//			else
//				ls_lookup_code = ls_lookup_val
//			end if
//			//ll_find = lds_export_equiv_code.Find( "export_id = " + String(ai_export_id) + " and lookup_code = " + ls_lookup_val, 1, ll_rowcount2 )
//			ll_find = lds_export_equiv_code.Find( "export_id = " + String(ai_export_id) + " and (string(lookup_code) = '" + ls_lookup_code + "' or code = '" + string(ls_lookup_val) + "')", 1, ll_rowcount2 ) //Add code -- jervis 03.25.2011
//			
//			
//			If ll_find > 0 Then
//				ls_value = lds_export_equiv_code.GetItemString(ll_find,'equiv_code')
//			End If
//			
//			If Not IsNull(ls_value) And Trim(ls_value) <> '' Then ls_data_value = ls_value //if no export code use org value
//			If IsNull(ls_data_value) Then ls_data_value = ""
//		End If
//		
//		
//		
//		//<add> 08/22/2007 by: Andy
//		If ls_strip_char <> "NONE" Then
//			ls_data_value = of_strip_char( ls_strip_char ,ls_data_value, "")
//		End If
//		
//		//*** substring function***************************8
//		//create datafield for substring_start
//		//<add> 08/21/2007 by: Andy
//		If li_sub_start > 1 Then ls_data_value = Mid(ls_data_value,li_sub_start,li_width)
//		//end of add
//		//***padding //note if avoid using return, double return, empty string or tab when padding
//		ls_data_value = Mid(ls_data_value,1,li_width) //shrink the length to size 
//		If ls_field_format = "Leading Padding" Or ls_field_format = "Trailing Padding" Then
//			If li_width - Len(ls_data_value) > 0 Then
//				li_dif = li_width - Len(ls_data_value)
//				ls_pad = "" //reset
//				ls_pad = Fill ( ls_fld_delim, li_dif )
//				If ls_field_format = "Leading Padding" Then
//					ls_data_value = ls_pad + ls_data_value
//				Else
//					ls_data_value = ls_data_value + ls_pad
//				End If
//			End If
//		ElseIf ls_field_format = "use text" Then //allows a set value if data is found
//			If Len(ls_data_value) > 0 Then
//				ls_data_value = ls_text
//			End If
//		End If
//		
//		//****set default moved here 091305
//		If ud > 0 Then
//			If IsNull(ls_data_value) Then ls_data_value = ""
//			
//			If ls_data_value = "" Then
//				If ud = 1 Then
//					ls_data_value = ls_def_val
//				ElseIf ud = 2 Then //if set to column get the value out of that column
//					If col < 1 Or col > li_fld_cnt Then //setting trap
//						gnv_debug.of_output(true, 'Alarm  Export:' +  "You are using a column default for column " + ls_export_field + " , but your default value is not a valid column number.~rThe default column number must be less than this column." ) //added by gaivns 20120912
//						MessageBox("Invalid setting","You are using a column default for column " + ls_export_field + " , but your default value is not a valid column number.~rThe default column number must be less than this column.")
//						Close(w_export_progress)
//						Destroy lds_export_flds
//						Destroy lds_export_hdr
//						Destroy lds_address_lookup
//						Destroy lds_code_lookup
//						Destroy lds_export_equiv_code
//						Destroy lds_dataobject
//						Destroy lds_linkto
//						Destroy lds_field
//						Destroy lds_export_dataTemp
//						Destroy lds_tablepk
//						Destroy lds_export_data
//						//end of add
//						Return 0
//					End If
//					ls_data_value = lds_export_data.GetItemString(ll_R,col)
//				End If
//			End If
//		End If
//		
//		//*********value set**********	
//		If li_fld_cnt = 1 Then ls_data_value = ls_data_value + Char(9)
//		If Lower(lds_export_data.Describe(ls_export_field + ".name")) = Lower(ls_export_field) Then
//			//Begin - Added By Mark Lee 09/29/12 its cannot use double quote to merge data values in  the MS word.
//			If Pos(ls_data_value,'"') > 0 Then 
//				gnv_debug.of_output(true, 'Alarm  Export: Its used the double quote Replace the blank data in merged data value on the column ['+ls_export_field+'], and this current data value is the ['+ls_data_value+'].' )
//				ls_data_value  = lnvo_string.of_globalreplace( ls_data_value, '"', ' ')
//			End If
//			//End - Added By Mark Lee 09/29/12
//			lds_export_data.SetItem(ll_R,ls_export_field,ls_data_value)
//		End If
//		
//		//processing the next field(fieldseqid)
//		ll_i = ll_j + 1
//	Loop
//	
//	//<add> 08/27/2007 by: Andy process default value
//	If of_export_processdefault(lds_export_hdr,lds_export_flds,lds_export_dataTemp,lds_export_data) = -1 Then
//		gnv_debug.of_output(true, 'Alarm  Export: of_export_processdefault=-1 ' )//added by gavins 20120912
//		Close(w_export_progress)
//		Destroy lds_export_flds
//		Destroy lds_export_hdr
//		Destroy lds_address_lookup
//		Destroy lds_code_lookup
//		Destroy lds_export_equiv_code
//		Destroy lds_dataobject
//		Destroy lds_linkto
//		Destroy lds_field
//		Destroy lds_export_dataTemp
//		Destroy lds_tablepk
//		Destroy lds_export_data
//		Return 0
//	End If
//	//end of add
//	
//	//<add> andy 2007.05.25
//	//set Calculated field value and format into lds_export_data 
//	//with the relative computer column in lds_export_dataTemp
//	//Modify 08/22/2007 by: Andy
//	of_export_calculatedfield(lds_export_dataTemp,lds_export_data,ls_format)
//	//end of add
//	
//	w_export_progress.hpb_bar.Position = 94
//	
//	//Modify 07/18/2007 by: Andy
//	//if ai_save_data = 1 then //maha 021003
//	//1:save / 3:save & preview
//	If ai_save_data = 1 Or ai_save_data = 3 Then
//		//end of modify
//		w_export_progress.st_progress.Text = "Saving File"
//		
//		//gnv_appeondb.of_autocommit()
//		sd = lds_export_data.Update()
//		Commit Using SQLCA;
//		
//		If sd < 1 Then
//			gnv_debug.of_output(true, 'Alarm  Export: lds_export_data update failed ' )//added by gavins 20120912
//			MessageBox("Save error","Unable to save data to table")
//		End If
//	End If
//	
//	
//	//Begin - Added By Mark Lee 07/23/2013. update the sqltext
//	of_update_export_sqltext(ai_export_id,ls_prac_sql,ls_UnionSQL)
//	//End - Added By Mark Lee 07/23/2013.
//	//-----------------------------------------------------------------------/
//	ids_export_data = lds_export_data
//	If ids_export_data.Rowcount( ) = 0 Then
//		gnv_debug.of_output(true, 'Alarm  Export: lds_export_data rowcount()=0 '  )//added by gavins 20120912
//	Else
//		ib_writefile = true //added by gavins 20121011
//	End If
//	//-----------------------------------------------------------------------/
//	
//	w_export_progress.st_progress.Text = "Creating File"
//	w_export_progress.hpb_bar.Position = 100
//	li_bar_ticks = 75 / li_prac_id_cnt
//	n = Int(li_fld_cnt/80) + 1
//	//******************************* CREATE FILE
//	
//	//Modify 08/28/2007 by: Andy
//	//If IsNull(as_path) Or as_path = "" Then
//	//	If IsNull(ls_save_path) Or ls_save_path = "" Then ls_save_path = gs_dir_path + gs_DefDirName + "\" + ls_table_name
//	//Else
//	ls_save_path = as_path
//	ls_save_path = gnv_string.of_replace_env_var(ls_save_path) //Added By Ken.Guo 12/10/2013
//	If Right(ls_save_path,1) = ':' Then ls_save_path = ls_save_path + "\"
//	ll_LastPos = LastPos(ls_save_path,'.')
//	If ll_LastPos > 0 Then
//		ls_save_path = Left(ls_save_path,ll_LastPos - 1)
//	End If
//	//End If
//	
//	//--------------------------- APPEON BEGIN ---------------------------
//	//$<add> 05.23.2007 By: Jack
//	//$<reason> If the directory is not exists Then create it 
//	String ls_path1
//	If Mid(ls_save_path,Len(ls_save_path),1) = "\" Then
//		ls_path1 = ls_save_path
//	Else
//		ls_path1 = Mid(ls_save_path,1,LastPos(ls_save_path,'\'))
//	End If
//	//Add By Jervis 11-19-2008
//	If ls_path1 = "" Then
//		If appeongetclienttype() = 'WEB' Then
//			ls_path1 = gs_dir_path + gs_DefDirName + "\ExportData\"
//			ls_save_path = ls_path1 + ls_save_path
//		Else
//			ls_path1 = Gs_Current_Directory + "\ExportData\"
//			ls_save_path = ls_path1 + ls_save_path
//		End If
//	Else
//		
//		//Added By Ken.Guo 2011-01-11.
//		If invo_rights.of_check_dir_right(ls_path1, True,'Export') <> 1 Then
//			gnv_debug.of_output(true, 'Alarm  Export: check dir right failed '  + ls_path1 )//added by gavins 20120912
//			If isvalid(lds_export_flds) Then Destroy lds_export_flds;
//			If isvalid(lds_export_hdr) Then Destroy lds_export_hdr;
//			If isvalid(lds_address_lookup) Then Destroy lds_address_lookup;
//			If isvalid(lds_code_lookup) Then Destroy lds_code_lookup
//			If isvalid(lds_export_equiv_code) Then Destroy lds_export_equiv_code;
//			If isvalid(lds_dataobject) Then Destroy lds_dataobject
//			If isvalid(lds_linkto) Then Destroy lds_linkto;
//			If isvalid(lds_field) Then Destroy lds_field
//			If isvalid(lds_export_dataTemp) Then Destroy lds_export_dataTemp
//			If isvalid(lds_tablepk) Then Destroy lds_tablepk
//			If isvalid(w_export_progress) Then Close(w_export_progress)		
//			Return 0
//			//ls_path1 = gs_dir_path + gs_DefDirName + "\ExportData\"
//			//ls_save_path = ls_path1
//		End If
//		
//	End If
//	//End By Jervis 
//	
//	gnv_appeondll.of_parsepath(ls_path1)
//	
//	//---------------------------- APPEON END ----------------------------
//	
//	If Mid(ls_save_path,Len(ls_save_path),1) <> "\" Then //maha app 102405 if a file name is indicated do not tack on the table name
//		ls_path = ls_save_path +  ls_format
//	Else
//		//ls_path = ls_save_path + ls_table_name + ls_format
//		If li_custom_save > 0 Then  //maha new 121205 for custom naming of file
//			ls_save_name = of_custom_name(li_custom_save,ls_table_name,ldt_date)
//		Else
//			ls_save_name = ls_table_name
//		End If
//		ls_path = ls_save_path + ls_save_name + ls_format
//	End If
//	
//	//<add> 08/28/2007 by: Andy 
//	as_path = ls_path
//	//end of add
//	
//	//$<modify> 03.20.2008 by Andy
//	//If ls_format <> "export" Then  //if the auto export path is blank use the export path, if blank use the hard coded path
//	If lb_export = False Then
//		//end of modify 03.20.2008
//		gnv_rights.of_check_dir_right( ls_path, true, 'Export')
//		Choose Case ls_format
//			Case ".txt"
//				If ls_header = "1" Then
//					g = lds_export_data.SaveAs(ls_path,Text!,True)
//				Else
//					g = lds_export_data.SaveAs(ls_path,Text!,False)
//				End If
//			Case ".xls"
//				If ls_header = "1" Then
//					g = lds_export_data.SaveAs(ls_path,excel!,True)
//				Else
//					g = lds_export_data.SaveAs(ls_path,excel!,False)
//				End If
//			Case ".csv"
//				If ls_header = "1" Then
//					g = lds_export_data.SaveAs(ls_path,csv!,True)
//				Else
//					g = lds_export_data.SaveAs(ls_path,csv!,False)
//				End If
//		End Choose
//		If g = -1 Then MessageBox("saveas -1","Unable to save file.  Check path (" + ls_path + ") and make sure a copy of the file is not open.")
//	Else
//		//build export text file
//		//modify 08/28/2007 by: Andy
//		//li_file_num = FileOpen(as_path + ls_table_name + ".txt", lineMode!, Write!, LockWrite!, Replace!)//maha changed to line mode 091002
//		li_file_num = FileOpen(ls_path, lineMode!, Write!, LockWrite!, Replace!)//maha changed to line mode 091002
//		//end of modify
//		w_export_progress.hpb_bar.Position = 10
//		For i = 1 To li_prac_id_cnt
//			//w_export_progress.hpb_bar.position = w_export_progress.hpb_bar.position + li_bar_ticks
//			If Mod(i,n) = 0 Then
//				w_export_progress.hpb_bar.Position = w_export_progress.hpb_bar.Position + 1
//			End If
//			For p = 1 To li_fld_cnt
//				ls_data_value = lds_export_data.GetItemString(i,p)
//				ls_fld_delim = lds_export_flds.GetItemString( p, "trailing_leading_characters")
//				ls_field_format = lds_export_flds.GetItemString(p,"export_format")
//				Choose Case ls_fld_delim
//					Case "E" //empty String
//						ls_delim_value = ""
//					Case "S" // space
//						ls_delim_value = " "
//					Case "T" //tab
//						ls_delim_value = "	"
//					Case "R" //return
//						ls_delim_value = "~r"
//					Case "D" //return
//						ls_delim_value = "~r~r"
//					Case Else
//						ls_delim_value = ls_fld_delim
//				End Choose
//				If IsNull(ls_delim_value) Then ls_delim_value = ""
//				If ls_field_format = "Leading Padding" Or ls_field_format = "Trailing Padding" Then //don't add delimit value
//					ls_export_text_file = ls_export_text_file + ls_data_value
//				Else
//					ls_export_text_file = ls_export_text_file + ls_data_value + ls_delim_value
//				End If
//				
//			Next
//			ls_export_text_file = ls_export_text_file + ls_rec_delim
//			p = 1
//			FileWrite ( li_file_num, ls_export_text_file)
//			ls_export_text_file = ""
//		Next
//		FileClose(li_file_num)
//	End If
//	//--------------------------- APPEON BEGIN ---------------------------
//	//$<add> 05.11.2007 By: Jack
//	//$<reason> Fix a defect.
//	ids_export_data = lds_export_data
//	//---------------------------- APPEON END ----------------------------
//	
//	If is_called_type <> "2" And IsValid(w_export_progress) Then
//		w_export_progress.hpb_bar.Position = 100
//		If isvalid(w_export_progress) Then Close(w_export_progress)
//	End If
//	
//	//<add> 07/18/2007 by: Andy
//	//2:preview / 3:save & rpeview
//	If ai_save_data = 2 Or ai_save_data = 3 Then
//		lstr_pass.s_string = is_select_syntax
//		lstr_pass.s_ds = lds_export_data
//		lstr_pass.s_string_array[1] = ls_UnionSQL
//		OpenWithParm( w_export_previewdata, lstr_pass )
//	End If
//	//end of add
//	
//	
//	//$<add> 05.07.2008 by Andy
//	If lb_mulsel Then
//		ls_MySQL = "DELETE FROM export_temp WHERE SpID = " + String(ll_SpID) + ";"
//		Execute Immediate :ls_MySQL;
//	End If
//else
//	//Added By Mark Lee 09/29/2013
//	of_update_export_sqltext(ai_export_id,ls_prac_sql,ls_UnionSQL)
//end if
////End - Modified By Mark Lee 09/29/2013
//
//If isvalid(lds_export_flds) Then Destroy lds_export_flds;
//If isvalid(lds_export_hdr) Then Destroy lds_export_hdr;
//If isvalid(lds_address_lookup) Then Destroy lds_address_lookup;
//If isvalid(lds_code_lookup) Then Destroy lds_code_lookup
//If isvalid(lds_export_equiv_code) Then Destroy lds_export_equiv_code;
//If isvalid(lds_dataobject) Then Destroy lds_dataobject
//If isvalid(lds_linkto) Then Destroy lds_linkto;
//If isvalid(lds_field) Then Destroy lds_field
//If isvalid(lds_export_dataTemp) Then Destroy lds_export_dataTemp
//If isvalid(lds_tablepk) Then Destroy lds_tablepk
//If isvalid(w_export_progress) Then Close(w_export_progress)
//
//Return 1
//
end function

public subroutine of_update_export_data_part (long al_screen, string as_table_name_screen, string as_dataobject, u_dw adw_screen, n_ds ads_export, n_ds ads_export_filter);//Modified By Ken.Guo 2016-03-11
str_export_columns lstr_export_columns
of_update_export_data_part(al_screen,as_table_name_screen,as_dataobject,adw_screen,ads_export,ads_export_filter,lstr_export_columns)

////====================================================================
//// Function: of_update_export_data_part
////--------------------------------------------------------------------
//// Description:
////--------------------------------------------------------------------
//// Arguments:
//// 	value    long      al_screen
//// 	value    string    as_table_name_screen
//// 	value    string    as_dataobject
//// 	value    u_dw      adw_screen
//// 	value    n_ds      ads_export
//// 	value    n_ds      ads_export_filter
////--------------------------------------------------------------------
//// Returns:  (None)
////--------------------------------------------------------------------
//// Author:	Mark		Date: 06/12/2014
////--------------------------------------------------------------------
////	Copyright (c) 2008-2013 Contractlogix, All rights reserved.
////--------------------------------------------------------------------
//// Modify History:
////
////====================================================================
//long		i , j, ll_rowcount, ll_find, ll_export_type
//String 	ls_table_name, ls_column_name,  ls_label,  ls_dbname, ls_dataobject, ls_ctx_lookup_type, ls_new_lookup_type, ls_dddw_data
//string 	ls_view_label, ls_web_visible, ls_lookup_code, ls_dddw_name
//string 	ls_field_style, ls_lu_field_name, ls_view_label_old, ls_field_style_old,	ls_err
//DatawindowChild			dwchild
//string 	ls_lu_field_name_old, ls_lookup_code_old, ls_checkvalues, ls_text, ls_mask_old, ls_mask
//Long		ll_rec_id, ll_auto_sync_field
//boolean lb_extra = false
//string ls_style
//
//if isnull(al_screen) or al_screen <=0 then  return
//
//ads_export_filter.setfilter( '')
//ads_export_filter.filter( )
//ads_export_filter.setfilter( ' ctx_scrn_id='+string(al_screen) )
//ads_export_filter.filter( )		
//		
//ll_rowcount = ads_export_filter.rowcount( )
//
//if ll_rowcount > 0 then 
//	For j = 1 to ll_rowcount
//		ll_rec_id		= ads_export_filter.GetItemNumber(j, 'rec_id')
//		ll_find =	ads_export.find( ' rec_id ='+string(ll_rec_id), 1, ads_export.rowcount( )	)				
//		
//		ls_table_name = ads_export_filter.GetItemString(j, 'ctx_table_name')
//		ll_export_type = ads_export_filter.GetItemNumber(j, 'export_type')
//		ls_column_name = ads_export_filter.GetItemString(j, 'ctx_column_name')									
//		ls_view_label = ads_export_filter.GetItemString(j, 'data_view_label')						
//		ls_web_visible = ads_export_filter.GetItemString(j, 'web_visible')	
//		
////		ls_dataobject 			= lower(ads_export_filter.GetItemString( j, "ctx_scrn_dataobject" ))
//		ls_ctx_lookup_type 	= ads_export_filter.GetItemString( j, "ctx_lookup_type" )			//Added By Mark 07/08/2014	need update error data if all auto update.
//		
//		ls_lu_field_name_old 	= ads_export_filter.GetItemString(j, 'lu_field_name')	
//		ls_lookup_code_old 	= ads_export_filter.GetItemString(j, 'lookup_code')	
//		ls_field_style_old	 	= ads_export_filter.GetItemString(j, 'lookup_field_style')		
////		ls_mask_old				= ads_export_filter.GetItemString(j, 'export_format')		//Added By Mark 06/25/2014 no need it
//		ll_auto_sync_field 		= ads_export_filter.GetItemNumber(j, 'auto_sync_field')				//Added By Mark Lee 02/09/2015
//		
//		//update table name 
//		IF isnull(ls_table_name) or trim(ls_table_name) = '' Then				
//			ads_export.setitem( ll_find, 'ctx_table_name', as_table_name_screen)		
//			ls_table_name = as_table_name_screen
//		End If
//		
//		//next update table name and web_visible
//		if (not isnull(ls_web_visible) and ls_web_visible = "1") then 
//			if ( isnull(ll_export_type) or ll_export_type <> 1 )  then 
//				ads_export.setitem(ll_find, 'web_visible', "0")
//				continue
//			end if 
//		
//			if of_exists_export_table(ls_table_name) = false then 
//				ads_export.setitem( ll_find, 'web_visible', "0")
//			end if
//			
//			if lower(ls_table_name) =  'ctx_basic_info' and lower(ls_column_name) = 'ctx_id'  then 
//				ads_export.setitem( ll_find, 'web_visible', "0")
//	//					continue
//			elseif lower(ls_table_name) =  'ctx_elements' and lower(ls_column_name) = 'category_name'  then 
//				ads_export.setitem( ll_find, 'web_visible', "0")
//	//					continue
//			end if 		
//	//			else
//	//				continue
//		end if 
//		
//		//update column lable
//	//	ls_table = lower( adw_screen.Describe( "Datawindow.table.updatetable" ) )
//	//	If as_dataobject = 'd_org_search2' And ls_table = 'ctx_orgs_contact' Then ls_table_name = 'ctx_orgs' 
//		IF (not isnull(ll_export_type) and ll_export_type = 1 ) and (not isnull(ls_column_name) and trim(ls_column_name)  <> '')  Then 
//		//&	and (isnull(ls_view_label) or trim(ls_view_label) ='' or isnull(ls_field_style_old) or trim(ls_field_style_old) ='' ) 
//			ls_dbname = lower( adw_screen.Describe(ls_column_name + ".dbname") )
//			// view label auto setting			
//			if isnull(ls_view_label) or trim(ls_view_label) ='' then 		
//				ls_label = ''
//				IF as_dataobject = 'd_contract_det_contact_external' Then
//					Choose Case ls_column_name
//						Case 'compute_1'
//							ls_label = 'Name'
//						Case 'contact_phone'
//							ls_label = 'Contact Phone'
//						Case 'contact_email'
//							ls_label = 'Contact Email'
//						Case 'contact_id'
//							ls_label = 'Contact ID'
//						Case 'association'
//							ls_label = 'Association'
//						Case 'Facility_id'
//							ls_label = 'Company ID'
//						Case 'association2'
//							ls_label = 'Association2'
//						Case 'association3'
//							ls_label = 'Association3'
//						Case 'association4'
//							ls_label = 'Association4'
//						Case 'association5'
//							ls_label = 'Association5'
//						Case 'association6'
//							ls_label = 'Association6'
//						Case 'association7'
//							ls_label = 'Association7'
//						Case 'association8'
//							ls_label = 'Association8'
//						Case 'association9'
//							ls_label = 'Association9'
//						Case 'association10'
//							ls_label = 'Association10'
//					End Choose
//				else
//					ls_label = adw_screen.Describe( ls_column_name + "_t.text")
//					if ls_label = "?" or ls_label = "!" then ls_label = ""
//					if ls_label = '' then ls_label = ls_dbname
//				end if 
//				ads_export.setitem( ll_find, 'data_view_label', ls_label)
//			end if 
//			
////			//	editmask.mask auto setting	
////			ls_mask 	=adw_screen.Describe(ls_column_name + ".editmask.mask")
////			If isnull(ls_mask) or ls_mask = '?' or ls_mask = '!' or trim(ls_mask) = '' or lower(ls_mask) = lower('None') & 
////				or lower(ls_mask) = lower('use text') or lower(ls_mask) = lower('[general]') 	then 
////				ls_mask ='None'
////			End If		
////			If isnull(ls_mask_old) or ls_mask_old = '?' or ls_mask_old = '!' or trim(ls_mask_old) = '' or lower(ls_mask_old) = lower('None') & 
////				or lower(ls_mask_old) = lower('use text') or lower(ls_mask_old) = lower('[general]') 	then 
////				ls_mask_old ='None'
////			End If	
////			if lower(ls_mask_old) <> lower(ls_mask ) then 
////				ads_export.setitem( ll_find, 'export_format', ls_mask)
////			end if 
//							
//			ls_lookup_code = ""
//			ls_field_style = ""			
//			ls_lu_field_name 	= ""	
//			ls_dddw_data = ""
////			ls_checkvalues 		= adw_screen.Describe(ls_column_name + ".values")		//APB settings is not same with PB code.
//			ls_text 				= adw_screen.Describe(ls_column_name + ".CheckBox.On")
//			If isnull(ls_text) or ls_text = '?' or ls_text = '!' or trim(ls_text) = ''  then 
//				ls_text =''
//			End If
//			// dddw setting
//			if adw_screen.getchild(ls_column_name,dwchild) = 1 then
//				ls_dddw_name 	= adw_screen.Describe(ls_column_name+".dddw.name")					
//				ls_lookup_code 	= adw_screen.Describe(ls_column_name + ".tag") 
//				ls_lu_field_name	= adw_screen.Describe(ls_column_name + ".dddw.displaycolumn") 
//				if lower(ls_dddw_name) = 'd_dddw_code_lookup' then //Modified By Jay Chen 07-03-2015
//					if lower(ls_lu_field_name) = 'compute_code_number' or lower(ls_lu_field_name) = 'compute_description_number' then 
//						ls_lu_field_name = 'Code' 
//					end if
//				end if
//				ls_dddw_data 		= lower( adw_screen.Describe( ls_column_name + ".dddw.datacolumn" ) )
//				
//				If isnull(ls_dddw_name) or ls_dddw_name = '?' or ls_dddw_name = '!' or trim(ls_dddw_name) = ''  then 
//					ls_dddw_name =''
//				End If
//
//				if isnull(ls_lookup_code) or ls_lookup_code = '?' or ls_lookup_code = '!' or trim(ls_lookup_code) = ''  then 
//					ls_lookup_code = ""		//reset
//					if (ls_column_name = 'app_facility'  and ls_dddw_name = 'dddw_contact_company_new' ) or ls_dddw_name = 'd_dddw_company_list' or &
//							ls_dddw_name = 'd_dddw_company' then 
//						ls_lu_field_name = "facility_name"
//						ls_field_style = "P"
//					elseif ls_dddw_name = "d_dddw_users" then
//						ls_lu_field_name = "user_id"
//						ls_field_style = "U"
//					elseif ls_dddw_name = "d_code_lookup_country" and as_dataobject = "d_facility_detail" and ls_column_name = "country" then
//						ls_lookup_code = "Country"	
//						ls_field_style = "C" 
//					else
//						ls_field_style = ""
//					end if 
//				else
//					//lookup code 'A','B','O',''		//F
//					if  ls_dddw_name ="d_dddw_company_list" or ls_dddw_name = 'd_dddw_company'  or ls_dddw_name = 'dddw_contact_company_new' then  //Modified By Jay Chen 12-03-2015 add dddw_contact_company_new
//						ls_field_style = "P"
//						ls_lu_field_name = "facility_name"
//					else
//						ls_field_style = "C"
//					end if 
//				end if 
//				
//				//Set data value
//				if isnull(ls_field_style_old ) or trim(ls_field_style_old) = "" or ls_field_style_old <>  ls_field_style	then 			 
//					ads_export.setitem( ll_find, 'lookup_field_style', ls_field_style)
//				end if 
//				
//				//Added By Mark 07/08/2014 only set value on the lookup field style.
//				if (isnull(ls_lu_field_name_old) or trim(ls_lu_field_name_old) = '' or ls_lu_field_name_old <>  ls_lu_field_name) and trim(ls_field_style) <> "" then
//					if not isnull(ll_auto_sync_field) and ll_auto_sync_field = 1 and not isnull(ls_lu_field_name_old) and trim(ls_lu_field_name_old) <> "" and not isnull(ls_lu_field_name) and trim(ls_lu_field_name) <> ""  then 
//						//
//					else
//						ads_export.setitem( ll_find, 'lu_field_name', ls_lu_field_name)
//					end if 
//				end if 					
//								
//				if isnull(ls_lookup_code_old ) or ls_lookup_code_old <>  ls_lookup_code	 then 	 
//					ads_export.setitem( ll_find, 'lookup_code', ls_lookup_code)
//				end if 
//				
//				//Added By Mark 07/09/2014	dirty data setting.
//				if not( isnull(ls_lu_field_name) or trim(ls_lu_field_name) = '' )then 
//					if (isnull(ls_ctx_lookup_type) or trim(ls_ctx_lookup_type) = "" ) and ls_field_style = 'C' then 
//						ls_new_lookup_type = "C"
//						ads_export.SetItem(ll_find,'ctx_lookup_type', ls_new_lookup_type)
//					else  //Added By Jay Chen 12-03-2015 need update ctx_lookup_type from old value to new value 
//						ads_export.SetItem(ll_find,'ctx_lookup_type', ls_field_style)
//					end if 
//				end if 
//			Else
//				If( len(ls_text) > 0) Then			//len(ls_checkvalues)  > 2 and
//					ls_field_style = 'B'
//					ls_lookup_code = adw_screen.Describe(ls_column_name + ".CheckBox.On") + ':'+ &
//						adw_screen.Describe(ls_column_name + ".CheckBox.Off")+";"+adw_screen.Describe(ls_column_name + ".checkbox.text")
//				End If
//
////				//check the data completedlly if the view was changed.				//Added By Mark 07/08/2014 don't set value clean auto.
////				if not isnull(ls_lu_field_name_old) and trim(ls_lu_field_name_old) <> ''  then 
////					ads_export.setitem( ll_find, 'lu_field_name', '')
////				end if 			
//
//				//Added By Jay Chen 02-01-2016 extra handle for app_facility custom and ctx_contact custom field.
//				ls_style = ''
//				lb_extra = false
//				if al_screen = 2003 and left(lower(ls_column_name),7)='custom_'  then
//					select field_style into :ls_style from ctx_contact_custom_config where field_falg='C' AND field_name=:ls_column_name;
//					if isnull(ls_style) then ls_style = ''
//					if lower(ls_style) <> 'edit' then lb_extra = true
//				end if
//				if al_screen = 2001 and left(lower(ls_column_name),7)='custom_'  then
//					select field_style into :ls_style from ctx_contact_custom_config where field_falg='P' AND field_name=:ls_column_name;
//					if isnull(ls_style) then ls_style = ''
//					if lower(ls_style) <> 'edit' then lb_extra = true
//				end if
//				//end
//				
//				if isnull(ls_field_style_old) or ls_field_style_old <> ls_field_style  then
////					ads_export.setitem( ll_find, 'lookup_field_style', ls_field_style)
//					if not lb_extra then ads_export.setitem( ll_find, 'lookup_field_style', ls_field_style)
//				end if 
//				
//				if isnull(ls_lookup_code_old ) or ls_lookup_code_old <>  ls_lookup_code	 then 	 
////					ads_export.setitem( ll_find, 'lookup_code', ls_lookup_code)
//					if not lb_extra then ads_export.setitem( ll_find, 'lookup_code', ls_lookup_code)
//				end if 
//			end if 
//			
//			//copy from w_export_painter.tab_1.tabpage_field_data.dw_detail.ue_column_check()
////			/////////////////////////////////////////////////////////////////////////////
////			If ( ls_dataobject = 'd_contract_det_contact_external' or ls_dataobject = 'd_contract_det_contact_contact' or ls_dataobject = 'd_contract_det_contact_contact_notes') And ls_column_name = 'contact_id' Then
////				ls_new_lookup_type = 'contact_id'
////			elseif ls_dataobject = 'd_profile_header' and ls_column_name = 'ctx_req_profile_id' then
////				ls_new_lookup_type = ls_column_name
////			elseif ls_dataobject = 'd_contract_group_linked_locations' and ls_column_name = 'loc_id' then
////				ls_new_lookup_type = ls_column_name
////			elseif ls_dataobject = "d_contract_multi_group_browse" and ls_column_name = "parent_comp_id" then
////				ls_new_lookup_type = ls_column_name
////			Else
////				ls_new_lookup_type = ls_column_name
////				if isnull(ls_new_lookup_type) then ls_new_lookup_type = ''
////				if len(trim(ls_dddw_data)) > 0  then
////					//copy from w_export_painter.tab_1.tabpage_field_data.dw_detail.ue_generate_dddw()
////	//				If ls_dataobject = 'd_contract_det_contact_external' Then
////	//					choose case ls_column_name
////	//						case 'association'
////	//							ls_new_lookup_type = 'C'
////	//						case 'facility_id'
////	//							ls_new_lookup_type = 'P'
////	//						case 'association2','association3','association4','association5','association6','association7','association8','association9','association10'
////	//							ls_new_lookup_type = 'C'
////	//					end choose 
////	//				else
////////						if not isnull(ls_dddw_data) and  ls_dddw_data = 'lookup_code' then
////////							ls_new_lookup_type = 'C'
////////						elseif  not isnull(ls_dddw_data) and ls_dddw_data = 'facility_id' and ls_field_style = 'P' and ls_column_name <> 'app_facility'   then
////////							ls_new_lookup_type = 'P'
////////						end if 
////	//				end if 
////					setnull(ls_new_lookup_type)			//Added By Mark 07/08/2014  set 
////				End If
////			End If
////			
////			if ls_new_lookup_type = '?' or ls_new_lookup_type = '!' then
////				setnull(ls_new_lookup_type)
////			elseif ls_new_lookup_type = "lookup_code" or ls_new_lookup_type = "C" then
////				ls_new_lookup_type = 'C'
////			elseif ls_new_lookup_type = "P" then
////				ls_new_lookup_type = "P"
////			elseif ls_new_lookup_type = 'facility_id'  Then		//company_id
////				ls_new_lookup_type = 'C'
////			elseif ls_new_lookup_type = 'contact_id' Then
////				ls_new_lookup_type = 'C'
////			elseif ls_new_lookup_type = 'ctx_req_profile_id' then	
////				ls_new_lookup_type = 'R'
////			elseif ls_new_lookup_type = "loc_id" then
////				ls_new_lookup_type = 'L'
////			elseif ls_new_lookup_type = "parent_comp_id" then	
////				ls_new_lookup_type = 'M'			
////			else
////				setnull(ls_new_lookup_type)
////			end if
////			
////			//Added By Mark 07/08/2014 need update dirty data
////			if (isnull(ls_ctx_lookup_type) and  not isnull(ls_new_lookup_type) ) or (not isnull(ls_ctx_lookup_type) and  isnull(ls_new_lookup_type) ) or &
////			(not isnull(ls_ctx_lookup_type) and  not isnull(ls_new_lookup_type) and ls_ctx_lookup_type <> ls_new_lookup_type ) then 
////				ads_export.SetItem(ll_find,'ctx_lookup_type', ls_new_lookup_type)		
////			end if 
//		/////////////////////////////////////////////////////////////////////////////
//			
//		end if
//		
//	Next		
//end if 
end subroutine

public function boolean of_exists_export_table (string as_table);//====================================================================
// Function: of_exists_export_table
//--------------------------------------------------------------------
// Description:	ctx_custom	ctx_products	ctx_fee_sched_nm		ctx_custom_multi_hdr		ctx_basic_info	ctx_custom_multi_detail
//--------------------------------------------------------------------
// Arguments:
// 	value    string    as_table
//--------------------------------------------------------------------
// Returns:  boolean
//--------------------------------------------------------------------
// Author:	Mark Lee		Date: 12/05/2013
//--------------------------------------------------------------------
//	Copyright (c) 2008-2013 Contract Logix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//ctx_contacts	ctx_contacts_numbers	app_facility	sys_statusaudit
//
//ctx_action_items		ctx_contract_contacts	ctx_group_access	ctx_am_document	ctx_am_action_item	ctx_fee_sched_hdr
//ctx_location_pracs	ctx_loc	ctx_location_specialty	ctx_orgs_contact	ctx_elements	ctx_req_profile_hdr
//
//ctx_fee_sched_data	ctx_fee_sched_locations	ctx_fee_sched_pracs	ctx_orgs	ctx_report_profile_det	ctx_report_profile_hdr
//====================================================================
boolean 				lbn_exists
string 				ls_exists_table,	ls_new 

lbn_exists = false
if isnull(as_table) or trim(as_table) = '' then return lbn_exists

//Added By Mark Lee 05/13/2015 	add tables [app_facility ,	ctx_contacts	,	ctx_contacts_numbers]
ls_exists_table = '[ctx_custom],[ctx_products],[ctx_fee_sched_nm],[ctx_custom_multi_hdr],[ctx_custom_multi_detail],[ctx_basic_info],[app_facility],[ctx_contacts],[ctx_contacts_numbers]'
ls_new = '['+ lower(as_table) +']'

if pos(ls_exists_table,ls_new) > 0 then 
	lbn_exists = true
end if 

return lbn_exists
end function

public function integer of_export_data_with_text_ctx_new (integer ai_export_id, long al_ctx_ids[], ref string as_path, integer ai_save_data, string as_param1, string as_param2, string as_param3, integer ai_type, string as_sql, datastore ads_data);//Modified By Jay Chen 03-19-2014
//return of_export_data_with_text_ctx( ai_export_id, al_ctx_ids, as_path,ai_save_data,as_param1, as_param2, as_param3, ai_type,as_sql, false)
if is_get_export_field = '0' then
  	return of_export_data_with_text_ctx( ai_export_id, al_ctx_ids, as_path,ai_save_data,as_param1, as_param2, as_param3, ai_type,as_sql, false)
else
	ids_document_export_field = ads_data
	return of_export_data_with_text_ctx( ai_export_id, al_ctx_ids, as_path,ai_save_data,as_param1, as_param2, as_param3, ai_type,as_sql, false)
end if


//Commented By Mark Lee 09/29/2013 overwrite
////////////////////////////////////////////////////////////////////////
//// $<function>pfc_n_cst_ai_export_apb/of_export_data_with_text_ctx()
//// $<arguments>
////		value	integer	ai_export_id 		
////		value	long   	al_ctx_ids[]		
////		value	string 	as_path      		 
////    value integer  ai_save_data (0:Nothing / 1:save / 2:preview / 3:save & preview)
////		value	string 	as_param1    		
////		value	string 	as_param2    		
////		value	string 	as_param3
////    value integer  ai_type      (1: specify SQL/2: specify array/3: between...and)
////    value string   as_sql       (the specified SQL)
//// $<returns> integer
//// $<description> Used for export Contract Logix data.
//// $<description>
////////////////////////////////////////////////////////////////////////
//// $<add> 2006-11-28 by Rodger Wu (doc painter)
////////////////////////////////////////////////////////////////////////
//
////<optimization> by Andy 07/12/2007
//SetPointer( HourGlass! )
//ib_writefile = false //added by gavins 20121011
//If IsNull(as_path) Or as_path = "" Then
//	MessageBox("Data Error", "There is no save path for this file. Unable to continue this function.")
//	Return 0
//End If
//
//If ai_export_id < 1 Then
//	//MessageBox("User Error", "No export selected.  Unable to continue this function.")
//	MessageBox("User Error", "No export selected.  Unable to proceed.")
//	Return 0
//End If
//
//Open(w_export_progress)
////Start code changes 2.6.2007 Henry
//If is_called_type = '1' Then
//	w_export_progress.Title = 'Merge Data Process'
//	is_called_type = '0'
//ElseIf is_called_type = '2' Then // Rodger wu Added.
//	w_export_progress.Title = 'Merge Data Process'
//	w_export_progress.st_6.Text = "Progress of building data"
//	
//	w_export_progress.st_merge.Visible = True
//	w_export_progress.hpb_1.Visible = True
//	//	w_export_progress.height = 1100
//End If
////End code change 2.6.2007
//
//w_export_progress.st_progress.Text = "Creating export table"
//
//If of_create_export_table( ai_export_id,ai_save_data ) < 0 Then
//	gnv_debug.of_output(true, 'Alarm Replace Export:of_create_export_table<0' + ' ai_export_id=' + string( ai_export_id ) + ' ai_save_data=' + string( ai_save_data ) )//added by gavins 20120912
//	Close(w_export_progress)
//	Return 0
//End If
//
////Boolean lb_table_found
////Long ll_fld_val
//Long   li_prac_id_cnt,  g, w, sd, i,n,p
//
//Long ll_find_no,  ll_rowcount2, ll_find,li_rec_no, li_file_num,li_fld_cnt,li_act_format
//Long li_fld_len, li_use_link, li_recd_no, li_width, f, li_dif,  li_save_data = 0, ud, col
//DateTime ldt_date, ldt_value //maha
//String ls_lookup_type, ls_db_lookup_type, ls_lookup_code ,ls_pad, ls_fixed_width//ls_trail_val, ls_trail_record, 
//String Errors, ls_export_record, ls_export_field, ls_fld_type, ls_fld_delim//ls_hdr_val, ls_hdr_record, 
//String ls_fld_val, ls_lead_trail_char, ls_format, ls_table_name//, ls_table_new, ls_table_names[]
//String ls_sql_syntax, ls_field_name, ls_grey, ls_presentation_str, ls_dwsyntax_str, ls_value, ls_data_value
//String ls_field_format, ls_sql, ls_save_format, ls_path //ls_month, ls_year, ls_day, ls_hour, ls_minute, 
//Long li_exp_type
//String ls_header, ls_filter, ls_lookup, ls_datatype, ls_prac_ids = "", ls_select_field, ls_prac_field
//String ls_select_table_trim, ls_select_table, ls_sny_retrieve, ls_find, ls_delim_value, ls_rec_delim, ls_lu_field
//String  ls_export_text_file = "", ls_lookup_val, ls_save_path, stax, s //maha
//String ls_aggre, ls_sort, ls_dc_field,  ls_text, ls_def_val
//Long ll_prac_row, ll_ret_cnt
//n_ds lds_export_hdr, lds_export_flds, lds_export_retrieve, lds_export_data, lds_code_lookup, lds_address_lookup
//n_ds lds_dataobject , lds_export_equiv_code
//String ls_tempstr, ls_dddwdata, ls_dddwtable, ls_select_field_ctx, ls_dddw_column_dbname //ls_dataobject, 
//datawindowchild ldwc_dddw
//String ls_linkfromcol, ls_linktotable, ls_linktocol
//datastore lds_linkto
//string ls_ic_link_area
//long ll_ctx_link_scrn_id
//string ls_datatype_ctx
//string ls_dddwname
//
////<add> andy 07/12/2007
//n_ds      lds_field,lds_export_dataTemp
//String    ls_ComputerDataType,ls_Expresstion,ls_Field,ls_FieldDataType,ls_Modify,ls_Err,ls_tag
//n_cst_string lnvo_string
//Long      ll_Cnt,ll_Num,ll_Tab,ll_Start = 1,ll_pos1,ll_pos2,ll_pos3,ll_SpID
//String ls_Objects,ls_objname,ls_ObjType,ls_ColType,ls_OrderBy,ls_UnionSQL = "",ls_SqlSelect,ls_flddelimList[]
//Boolean lb_flagpk,lb_true = False,lb_mulsel = False //lb_flag = true,
//Long    ll_FieldSeqID = 0,ll_FieldCnt,ll_export_code,ll_equivcode,ll_pracid,ll_LastPos
//Long ll_FieldSeqIDold = -1,ll_R = 0,ll_i = 1,ll_j,ll_k,ll_n,ll_pkcnt,ll_Rcnt,li_sub_start,li_custom_save
//String  ls_tablelist[],ls_fieldlist[],ls_selectfieldlist[],ls_formatList[]
//Long li_recdnoList[],ll_exportcodeList[],li_substartList[],li_widthList[],ll_ctx_scrn_id
//Long li_udList[],ll_pos,li_act_formatList[],li_bar_ticks,li_widthtemp,ll_maxwidth,ll_len
//String  ls_defvalList[],ls_textList[],ls_prac_sql,ls_ic_area,ls_lu_fieldList[]
//str_pass lstr_pass
////<add> 08/08/2007 by: Andy
//String ls_prac_sql_temp,ls_Sortsel,ls_prac_sql_temp2,ls_top = "top 2147483647",ls_usetable = ""
////<add> 08/16/2007 by: Andy
//datastore lds_tablepk
//String  ls_tablepks[],ls_table[],ls_tablepk,ls_sortpk[],ls_save_name,ls_strip_char,ls_dbtype
//String  ls_RowNo = "",ls_RowNoSyn = "",ls_tabletemp,ls_synprefix = "",ls_MySQL
////end of add
//Boolean lb_export // Andy 03202008
////Start add by jervis 
//Boolean lb_get_parent
//string ls_syn_parent
//string ls_select_table_on
//string ls_lu_codename
//string ls_field_value
//string ls_other_where
//string ls_ctx_table
//string ls_link_table
//string ls_link_table_on
//string ls_no_link_on
////End by jervis
//
//ldt_date = DateTime(Today(),Now()) //maha
////<add> 08/23/2007 by: Andy
//ls_dbtype = of_get_dbtype()
//If Upper(ls_dbtype) = 'SQL2005' Or Upper(ls_dbtype) = 'ASA9' Then
//	ls_RowNo = ",Row_No"
//	lb_true = True
//End If
//
//ls_synprefix = "select ctx_id,FieldSeqID,field_value,field_data_type" + ls_RowNo + " from ("
//
//
//
//
////<add> 08/14/2007 by: Andy 
////Reason: Bubble sort the al_ctx_ids array.
//If ai_type = 2 Then
//	of_bubblesort(al_ctx_ids)
//End If
//
//
//li_prac_id_cnt = UpperBound( al_ctx_ids[] )
//
////<add> 08/16/2007 by: Andy
//lds_tablepk = Create datastore
//If Left(Upper(ls_dbtype),3) = 'ASA' Then
//	lds_tablepk.DataObject = "d_export_tablepk_asa_ctx"
//	ls_top = ""
//Else
//	lds_tablepk.DataObject = "d_export_tablepk_sql_ctx"
//End If
//lds_tablepk.SetTransObject( SQLCA )
////end of add
//
//
////<add> andy 2007.05.25
//lds_field = Create n_ds
//lds_field.DataObject = "d_export_fields"
//lds_field.of_SetTransObject( SQLCA )
//
//lds_code_lookup = Create n_ds
//lds_code_lookup.DataObject = "d_code_lookup"
//lds_code_lookup.of_SetTransObject( SQLCA )
//
//lds_address_lookup = Create n_ds
//lds_address_lookup.DataObject = "d_address_lookup"
//lds_address_lookup.of_SetTransObject( SQLCA )
//
//lds_export_hdr = Create n_ds
//lds_export_hdr.DataObject = "d_export_hdr"
//lds_export_hdr.of_SetTransObject( SQLCA )
//
//lds_export_flds = Create n_ds
//lds_export_flds.DataObject = "d_export_flds_list_exp_ctx"
//lds_export_flds.of_SetTransObject( SQLCA )
//
//lds_export_equiv_code = Create n_ds
//lds_export_equiv_code.DataObject = "d_export_equiv_code_lds"
//lds_export_equiv_code.of_SetTransObject( SQLCA )
//
//
//lds_export_retrieve = Create n_ds
//lds_dataobject = Create n_ds
//lds_linkto = Create datastore
//
//gnv_appeondb.of_startqueue( )
//
//
//lds_export_flds.Retrieve( ai_export_id )
////lds_export_equiv_code.Retrieve()
//lds_export_equiv_code.Retrieve(ai_export_id)  //Jervis 12.10.2010
//lds_export_hdr.Retrieve( ai_export_id )
//lds_field.Retrieve( ai_export_id )
//
//gnv_appeondb.of_commitqueue( )
//
//ll_rowcount2 = lds_export_equiv_code.RowCount()
//
////HEADER INFO
//ls_table_name = lds_export_hdr.GetItemString(1,"export_name")
//ls_header = lds_export_hdr.GetItemString(1,"field_labels_as_header") //Y or N
//ls_format = lds_export_hdr.GetItemString(1,"export_format")
//
////add 08/22/2007 by: Andy
//ls_strip_char = lds_export_hdr.GetItemString(1,"strip_char")
//If IsNull(ls_strip_char) Or Len(ls_strip_char) < 1 Then ls_strip_char = "NONE"
//If ls_format = ".csv" Then ls_strip_char = ","
////end of add
//
////<add> 08/21/2007 by: Andy
//li_custom_save = lds_export_hdr.GetItemNumber(1,"custom_save_name")
//If IsNull(li_custom_save) Then li_custom_save = 0
////end of add
//
////-----------Begin Modified by alfee 05.25.2007-----------------------
////<$Reason>If merging data in document manager, agreement template or for email template,
////<$Reason>Then always use text with header format. It's also for performance tunning.
////If is_called_type = "2" Or is_called_type = '3' Then 
//If is_called_type = "2" Or is_called_type = '3' Or is_called_type = '4' Then //08.29.2007 Byy Jervis
//	ls_format = ".txt"
//	ls_header = '1'
//End If
//
////$<modify> 03/20/2008 by: Andy
//If ls_format = "export"  Then
//	lb_export = True
//	ls_format = ".txt"
//Else //txt and xls files  files
//	lb_export = False
//End If
//
////-----------End Modified ---------------------------------------------
//
//If ls_format = ".csv" Then
//	If Upper( appeongetclienttype() ) = "WEB" Then
//		MessageBox( "IntelliSoft", "The file type of CSV is unsupported on WEB.~r~nPlease go to Export painter to modify settings." )
//		gnv_debug.of_output(true, 'Alarm  Export:' +"The file type of CSV is unsupported on WEB.~r~nPlease go to Export painter to modify settings." ) //added by gaivns 20120912
//		Close(w_export_progress)
//		//<add> andy 07/17/2007
//		Destroy lds_export_flds
//		Destroy lds_export_hdr
//		Destroy lds_address_lookup
//		Destroy lds_code_lookup
//		Destroy lds_export_equiv_code
//		Destroy lds_dataobject
//		Destroy lds_linkto
//		Destroy lds_field
//		Destroy lds_tablepk
//		//Destroy lds_export_dataTemp
//		//end of add
//		Return -1
//	End If
//End If
//
//li_exp_type = lds_export_hdr.GetItemNumber(1,"export_type")
//ls_rec_delim = lds_export_hdr.GetItemString(1,"record_delimiter")
//ls_save_path = lds_export_hdr.GetItemString(1,"save_path")
//
////$<add> 05.07.2008 by Andy
//Select Top 1 @@spid Into :ll_SpID From ids;
//
////Modify 08/08/2007 by: Andy
////specify SQL
//If ai_type = 1 Then
//	ls_prac_sql  = Trim(as_sql) //trim(lds_export_hdr.getitemstring(1,"prac_sql"))
//	If IsNull(ls_prac_sql) Then ls_prac_sql = ''
//	If ls_prac_sql <> '' Then
//		ll_pos = Pos(ls_prac_sql,";")
//		If ll_pos > 0 Then
//			ls_prac_sql  = Replace(ls_prac_sql,ll_pos,1,'')
//		End If
//		ll_len = Len(ls_prac_sql)
//		ls_prac_sql_temp = Trim(Mid(ls_prac_sql,7,ll_len))
//		If Lower(Left(ls_prac_sql_temp,8)) = 'distinct' Then
//			ls_prac_sql_temp2 = Trim(Mid(ls_prac_sql_temp,9,ll_len))
//			If Lower(Left(ls_prac_sql_temp2,3)) <> 'top' Then
//				//modify 08/14/2007 by: Andy
//				//ls_prac_sql = 'select distinct top 2147483647 ' + ls_prac_sql_temp2
//				ls_prac_sql = 'select distinct ' + ls_top + ' ' + ls_prac_sql_temp2
//			End If
//		ElseIf Lower(Left(ls_prac_sql_temp,3)) <> 'top' Then
//			//modify 08/14/2007 by: Andy
//			//ls_prac_sql = 'select top 2147483647 ' + ls_prac_sql_temp
//			ls_prac_sql = 'select ' + ls_top + ' ' + ls_prac_sql_temp
//		End If
//		
//		//$<add> 05.06.2008 by Andy
//		//del order by statement. Reason:if ORDER BY items isn't in the select list,then it will get error.
//		//ORDER BY items must appear in the select list if the statement contains a UNION operator.
//		ll_pos = Pos(Lower(ls_prac_sql)," order ")
//		If ll_pos > 0 Then
//			ls_prac_sql = Left(ls_prac_sql,ll_pos - 1)
//		End If
//		//if select more than one field,then add a select statement outside the ls_prac_sql and
//		//INSERT the result INTO a table.
//		ll_pos = Pos(Lower(ls_prac_sql)," from ")
//		ls_prac_sql_temp = Left(ls_prac_sql,ll_pos - 1)
//		ll_pos = Pos(ls_prac_sql,",")
//		If ll_pos > 0 Then
//			lb_mulsel = True
//			ls_prac_sql = "select distinct ctx_id," + String(ll_SpID) + " from (" + ls_prac_sql + ") cc order by ctx_id"
//			Select Top 1 1 Into :ll_Cnt From sysobjects Where Name = 'export_temp' And Type = 'U';
//			If ll_Cnt = 1 Then
//				ls_MySQL = "DELETE FROM export_temp WHERE SpID = " + String(ll_SpID) + ";"
//			Else
//				ls_MySQL = "CREATE TABLE export_temp (prac_id int null,SpID int null)"
//			End If
//			Execute Immediate :ls_MySQL;
//			ls_MySQL = "INSERT INTO export_temp " + ls_prac_sql + ";"
//			Execute Immediate :ls_MySQL;
//			ls_prac_sql = "select distinct prac_id as ctx_id from export_temp where SpID = " + String(ll_SpID)
//		End If
//		//end add 05.06.2008
//	End If
//End If
////end of modify
//
////set record delimiter
//Choose Case ls_rec_delim
//	Case "C"
//		ls_rec_delim = ","
//	Case "R"
//		ls_rec_delim = "~r"
//	Case "T"
//		ls_rec_delim = "	"
//	Case "D"
//		ls_rec_delim = "~r~r"
//	Case "U"
//	Case Else
//		ls_rec_delim = ""
//End Choose
//If IsNull(ls_rec_delim) Then ls_rec_delim = ""
//
//li_fld_cnt = lds_export_flds.RowCount()
////<add> 08/24/2007 by: Andy
//ll_maxwidth = Long(lds_export_flds.Describe("evaluate('max(export_field_length)',0)"))
//If ll_maxwidth < 30 Then ll_maxwidth = 30
//
////CREATE SYNTAX FOR export DW
////ls_sql_syntax = "Select * from exp_" + Lower(ls_table_new)
//ls_sql_syntax = is_select_syntax
////modify 08/15/2007 by: Andy
//ls_presentation_str = "style(type=grid)"
//
//ls_dwsyntax_str = SQLCA.SyntaxFromSQL(ls_sql_syntax, ls_presentation_str, Errors)
//If Len(Errors) > 0 Then //this will fail if the table has not been completed
//	If Pos(Errors,"Table or view not found",1) > 0 Then
//		MessageBox ("Error in of_export_data_with_text","Export data data store not able to be created.~rCheck to make sure no export fields have any spaces, and that all have a width.  You cannot have duplicate field names, and fields cannot start with a number." )
//		Close(w_export_progress)
//		//<add> andy 07/17/2007
//		Destroy lds_export_flds
//		Destroy lds_export_hdr
//		Destroy lds_address_lookup
//		Destroy lds_code_lookup
//		Destroy lds_export_equiv_code
//		Destroy lds_dataobject
//		Destroy lds_linkto
//		Destroy lds_field
//		Destroy lds_tablepk
//		//Destroy lds_export_dataTemp
//		//end of add
//		Return -1
//		
//	Else
//		MessageBox("Caution", &
//			"SyntaxFromSQL caused these errors: " + Errors)
//		gnv_debug.of_output(true, 'Caution:' + " SyntaxFromSQL caused these errors: " + Errors)		//Added By Mark Lee 02/01/2013
//		Close(w_export_progress)
//		//<add> andy 07/17/2007
//		Destroy lds_export_flds
//		Destroy lds_export_hdr
//		Destroy lds_address_lookup
//		Destroy lds_code_lookup
//		Destroy lds_export_equiv_code
//		Destroy lds_dataobject
//		Destroy lds_linkto
//		Destroy lds_field
//		Destroy lds_tablepk
//		//Destroy lds_export_dataTemp
//		//end of add
//		Return -1
//	End If
//	gnv_debug.of_output(true, 'Alarm  Export:SyntaxFromSQL errors:' +  Errors ) //added by gaivns 20120912
//End If
//lds_export_data = Create n_ds
//lds_export_data.Create( ls_dwsyntax_str, Errors)
//If len( errors ) > 0 Then
//	gnv_debug.of_output(true, 'Alarm  Export:lds_export_data create errors:' +  Errors ) //added by gaivns 20120912	
//End If
//lds_export_data.SetTransObject( SQLCA )
//
////<add> andy 2007.05.25 
////save the original data that it's not format,in order to deal with the computer fields
//lds_export_dataTemp = Create n_ds
//lds_export_dataTemp.Create( ls_dwsyntax_str, Errors )
//lds_export_dataTemp.SetTransObject( SQLCA )
////end of add
//
////w_export_progress.r_bar.Width = 300
//w_export_progress.hpb_bar.Position = 10
//
//w_export_progress.st_progress.Text = "Populating Data for " + String(li_prac_id_cnt) + " Contract(s)"
//
////li_bar_ticks = 80 / li_fld_cnt
//
////creates string of prac_ids for querys
////between...and...
//If ai_type = 3 Then
//	//if ls_prac_sql = '' then
//	If li_prac_id_cnt > 0 Then
//		ls_prac_ids = "between " + String(al_ctx_ids[1]) + " and " + String(al_ctx_ids[li_prac_id_cnt])
//	End If
//	//end if
//End If
//
////$<modify> 05.05.2008 by Andy
////create rows for all practitioner data
//For i = 1 To li_prac_id_cnt
//	//specify array
//	If ai_type = 2 Then
//		ls_prac_ids = ls_prac_ids + String( al_ctx_ids[i] ) + ","
//	End If
//	g = lds_export_data.InsertRow(0)
//Next
//If ai_type = 2 Then
//	ls_prac_ids = Left( ls_prac_ids, Len( ls_prac_ids ) -1 ) //remove last comma
//End If
//
////Added By Ken.Guo 2011-07-21. 
//Boolean lb_usingdb = False
//String ls_client_id
//Long ll_arr_temp[]
//n_cst_string lnv_string
////ll_arr_temp[] = al_ctx_ids[]
//If li_prac_id_cnt >= 100 Then
//	lb_usingdb = True
//	//lnv_string.of_delete_duplicate(ll_arr_temp[])
//	If inv_arr_db.of_array_to_db( al_ctx_ids[],ls_client_id ) < 0 Then
//		is_client_id[UpperBound(is_client_id[]) + 1 ] = ls_client_id
//		if isvalid(w_export_progress) then close(w_export_progress)
//		of_cleanup_ds( )	
//		lb_usingdb = False
//		gnv_debug.of_output( True, 'Export data with text error, Failed to insert array to DB.')
//		Messagebox('Export Error','Failed to insert array data to DB.')
//	End If
//End If
//
////if ai_save_data = 1 or ai_save_data = 3 then
//If ai_save_data = 1 Or ai_save_data = 3  Or ib_gen_rec_id Then //for Date Alarm - Alfee 06.11.2008
//	lds_export_data.Object.rec_id.Primary[] = al_ctx_ids[]
//End If
//lds_export_data.RowsCopy( 1, lds_export_data.RowCount(), Primary!, lds_export_dataTemp, 1, Primary! )
////end modify 05.05.2008
//
//
//
////w_export_progress.r_bar.Width = w_export_progress.r_bar.Width + 50
//w_export_progress.hpb_bar.Position = 11
//w_export_progress.st_export.Text = "Form SQL Statement"
//
////Modify 08/22/2007 by: Andy
////n = int(li_prac_id_cnt/80) + 1
//n = Int(li_fld_cnt/80) + 1
////end of modify
//
//
//For p = 1 To li_fld_cnt
//	lds_dataobject.DataObject = lds_export_flds.GetItemString( p, "export_fields_ctx_scrn_dataobject" )
//	
//	li_width = lds_export_flds.GetItemNumber(p,"export_field_length")
//	ls_field_format = lds_export_flds.GetItemString(p,"export_format")
//	ls_data_value = ""
//	ls_value = ""
//	ls_lookup_val = ""
//	//ls_dc_field = "none"
//	//<add> 08/21/2007 by: Andy
//	li_sub_start =  0
//	//end of add
//	ls_dddwtable = ""
//	
//	lb_get_parent = false
//	ls_syn_parent = ""
//	ls_select_table_on = ""
//	ls_lu_codename = ""
//	ls_field_value = ""
//	ls_other_where = ""
//	ls_no_link_on = ""
//
//	ud = lds_export_flds.GetItemNumber( p, "use_default" )
//	If ud = 1 Or ud = 2 Then
//		ls_def_val = lds_export_flds.GetItemString( p, "default_value" )
//	Else
//		ls_def_val = ""
//	End If
//	
//	//Get Parent Level Data
//	if lds_export_flds.GetItemString( p,"record_level") = 'P' then lb_get_parent = true
//	
//	if lb_get_parent then
//		ls_syn_parent = "ctx_basic_info table_1 left join ctx_basic_info table_2 on (table_1.master_contract_id = table_2.ctx_id ) left join "
//	end if
//	
//	//Add by jervis -- 01.18.2010
//	//Leading Padding or Trailing Padding Process
//	ls_fld_delim = lds_export_flds.GetItemString( p, "trailing_leading_characters")
//	Choose Case ls_fld_delim
//		Case "R" //return
//			ls_fld_delim = "~r"
//		Case "T" //tab
//			ls_fld_delim = "	"
//		Case "D" //double return
//			ls_fld_delim = "~r~r"
//		Case "S" // space
//			ls_fld_delim = " "
//		Case "E" //empty string
//			ls_fld_delim = ""
//	End Choose
//	
//	//hard coded text
//	If lds_export_flds.GetItemNumber(p,"export_type") = 2 Then //set data for text fields
//		ls_select_field = lds_export_flds.GetItemString(p,"export_field_name")
//		ls_value = lds_export_flds.GetItemString(p,"field_value")
//		
//		If IsNull(ls_value) Then ls_value = ""
//		
//		If ls_value = "&TODAY&" Then
//			//<modify> 08/28/2007 by: Andy Reason:Support user-defined format.
//			//ls_value = of_date_format(ls_field_format,ldt_date) //maha 070705 factored
//			ls_value = String(ldt_date,"yyyy-mm-dd hh:mm")
//			of_data_format(ls_field_format,'D',ls_value)
//			//end of modify
//		End If
//		//Start Code Change ---- 11.03.2005 #21 maha  for prompt values
//		String ls_ptype
//		Choose Case Upper(ls_value)
//			Case "&PROMPT1&"
//				ls_ptype = lds_export_hdr.GetItemString(1,"prompt_type1")
//				ls_value = of_prompt_populate( ls_ptype, as_param1)
//			Case "&PROMPT2&"
//				ls_ptype = lds_export_hdr.GetItemString(1,"prompt_type2")
//				ls_value = of_prompt_populate( ls_ptype, as_param2)
//			Case "&PROMPT3&"
//				ls_ptype = lds_export_hdr.GetItemString(1,"prompt_type3")
//				ls_value = of_prompt_populate( ls_ptype, as_param3)
//		End Choose
//		If	ls_ptype = 'D' Then
//			ldt_date = DateTime(Date(ls_value),Now())
//			//<modify> 08/28/2007 by: Andy Reason:Support user-defined format.
//			//ls_value = of_date_format(ls_field_format,ldt_date)
//			ls_value = String(ldt_date,"yyyy-mm-dd hh:mm")
//			of_data_format(ls_field_format,'D',ls_value)
//			//end of modify
//		End If
//		
//		//End Code Change---11.03.2005
//		
//		//<add> 08/27/2007 by: Andy
//		li_sub_start = lds_export_flds.GetItemNumber(p,"export_fields_substring_start")
//		If li_sub_start > 1 Then ls_value = Mid(ls_value,li_sub_start,li_width)
//		ls_value = Mid(ls_value,1,li_width) //shrink the length to size 
//		//end of add
//		
//		
//		If ls_field_format = "Leading Padding" Or ls_field_format = "Trailing Padding" Then
//			If li_width - Len(ls_value) > 0 Then
//				li_dif = li_width - Len(ls_value)
//				ls_pad = "" //reset
//				ls_pad = Fill ( ls_fld_delim, li_dif )
//				If ls_field_format = "Leading Padding" Then
//					ls_value = ls_pad + ls_value
//				Else
//					ls_value = ls_value + ls_pad
//				End If
//			End If
//		End If
//		
//		
//		For i = 1 To li_prac_id_cnt
//			lds_export_data.SetItem(i,p,ls_value)
//			lds_export_dataTemp.SetItem(i,p,ls_value) //<add> andy 2007.05.25 
//		Next
//		//<Modify> andy 2007.05.25
//		//Else //get FIELDS DATA //comment by andy 
//	ElseIf lds_export_flds.GetItemNumber(p,"export_type") = 1 Then //get FIELDS DATA
//		
//		ll_ctx_scrn_id = lds_export_flds.GetItemNumber(p,"export_fields_ctx_scrn_id") //Add by Jack 06/05/2007
//		If ll_ctx_scrn_id = 6 Then
//			ls_ic_area = "E"
//		ElseIf ll_ctx_scrn_id = 7 Then
//			ls_ic_area = "I"
//		elseif ll_ctx_scrn_id = 14 or ll_ctx_scrn_id = 17 then //add other contact -- jervis 03.28.2011
//			ls_ic_area = "C"
//		End If
//		
//		//end of modify	
//		//CREATE SYNTAX FOR each retrieve DW
//		ls_export_field = lds_export_flds.GetItemString(p,"export_field_name")
//		//<add> 08/24/2007 by: Andy
//		of_replacespecchar(ls_export_field)
//		//end of add
//		ls_select_field_ctx = Trim( lds_export_flds.GetItemString( p, "db_field_name" ) )
//		
//		
//		Choose Case ls_select_field_ctx
//			Case "app_facility"
//				ls_tempstr = 'ctx_basic_info.app_facility'
//				ls_select_table = f_get_token( ls_tempstr, "." )
//				ls_select_field = ls_tempstr
//			Case "compute_1"
//				ls_select_table = 'ctx_contract_contacts'
//				ls_select_field = "compute_1"
//			Case "contact_phone"
//				ls_select_table = 'ctx_contract_contacts'
//				ls_select_field = 'contact_phone'
//			Case "contact_email"
//				if ll_ctx_scrn_id <> 2002 then //jervis 03.28.2011
//					ls_select_table = 'ctx_contract_contacts'
//					ls_select_field = 'contact_email'
//				else
//					ls_select_table = 'ctx_contacts_numbers'
//					ls_select_field = 'contact_email'
//				end if
//			Case Else
//				ls_tempstr = lds_dataobject.Describe( ls_select_field_ctx + ".dbname" )
//				if pos(ls_tempstr,".") > 0 then	//IF Exists Table Selection - jervis 03.17.2009
//					ls_select_table = f_get_token( ls_tempstr, "." )
//				else
//					ls_select_table = ""
//				end if 
//				ls_select_field = ls_tempstr
//				
//				if ll_ctx_scrn_id = 12 then //Export Requirement Profile Detail-- jervis 03.17.2009
//					ls_select_table = 'ctx_elements'
//				elseif ll_ctx_scrn_id = 2004 then
//					ls_select_table = 'sys_statusaudit'	//Export Contract Status tract - jervis 03.20.2009
//				elseif (ll_ctx_scrn_id = 6 or ll_ctx_scrn_id = 7) and ls_select_field = "facility_id" then
//					ls_select_table = 'ctx_contract_contacts'  //Export comany info with contact - jervis 01.30.2011
//				ElseIf ll_ctx_scrn_id = 22 Then
//					ls_select_table = 'ctx_orgs_contact'//added by gavins 20130314	
//				end if
//				   
//				
//		End Choose
//
//		
//		li_use_link = lds_export_flds.GetItemNumber(p,"export_fields_ctx_uselink")
//		If IsNull( li_use_link ) Then li_use_link = 0
//		
//		
//		
//		//ls_fld_delim = lds_export_flds.GetItemString( p, "trailing_leading_characters")
//		li_recd_no = lds_export_flds.GetItemNumber(p,"intcred_record_number")
//		//<add> 07/06/2007 by: Andy
//		ll_FieldSeqID ++
//		ll_export_code = lds_export_flds.GetItemNumber( p, "export_code" )
//		
//		//end of add	
//		ls_lu_field = lds_export_flds.GetItemString( p, "lu_field_name" )
//		ls_aggre = lds_export_flds.GetItemString( p, "aggre_function" )
//		ls_sort = lds_export_flds.GetItemString( p, "sort_by" )
//		//<add> 08/09/2007 by: Andy
//		ls_Sortsel = ls_sort
//		If IsNull(ls_Sortsel) Then ls_Sortsel = ''
//		If Len(Trim(ls_Sortsel)) > 0 Then
//			//$<Modify> 05.13.2008 by Andy
//			of_get_sortsel(ls_Sortsel,'ctx_id')
//		End If
//		//end of add
//		li_act_format = lds_export_flds.GetItemNumber(p,"export_fields_active_yesno")
//		ls_text = lds_export_flds.GetItemString(p,"field_value") //maha 091305
//		If Upper(ls_lu_field) = "LOOKUP CODE" Then ls_lu_field = "lookup_code"
//		If IsNull(ls_lu_field) Then ls_lu_field = "code"
//
//		//<add> 08/21/2007 by: Andy
//		li_sub_start = lds_export_flds.GetItemNumber(p,"export_fields_substring_start")
//		//end of add
//		If Pos(ls_select_table,"dba.",1) > 0 Then //maha 122005 
//			ls_select_table_trim = Mid(ls_select_table,5) //dropping dba.
//			ls_select_table = ls_select_table_trim  //maha 012306
//		Else
//			ls_select_table_trim = ls_select_table
//		End If
//		ls_filter = lds_export_flds.GetItemString(p,"filter_query")
//		
//		
//		If IsNull(ls_filter) Or Trim(ls_filter) = "" Then
//			ls_filter = ""
//		Else
//			//<Modify> 07/23/2007 by: Andy 
//			//ls_filter = " and  " + ls_filter
//			ls_filter = " and  ( " + ls_filter + " )"
//			//end of Modify
//			
//			//Start Code Change ---- 11.03.2005 #24 maha check filter for prompt values and replace
//			Long li_pos1
//			li_pos1 = Pos(Upper(ls_filter),"PROMPT1",1)
//			If li_pos1 > 0 Then
//				ls_filter = Mid(ls_filter,1,li_pos1 - 1) + as_param1 + Mid(ls_filter,li_pos1 + 7)
//			End If
//			li_pos1 = Pos(Upper(ls_filter),"PROMPT2",1)
//			If li_pos1 > 0 Then
//				ls_filter = Mid(ls_filter,1,li_pos1 - 1) + as_param2 + Mid(ls_filter,li_pos1 + 7)
//			End If
//			li_pos1 = Pos(Upper(ls_filter),"PROMPT3",1)
//			If li_pos1 > 0 Then
//				ls_filter = Mid(ls_filter,1,li_pos1 - 1) + as_param3 + Mid(ls_filter,li_pos1 + 7)
//			End If
//		End If
//		//End Code Change---11.03.2005 	
//		
//		//Replace ls_rec_delim to ls_fld_delim - jervis 12.30.2009
//		/*
//		//set fields delimiter/pad maha 060105
//		Choose Case ls_rec_delim
//			Case "R" //return
//				ls_rec_delim = "~r"
//			Case "T" //tab
//				ls_rec_delim = "	"
//			Case "D" //double return
//				ls_rec_delim = "~r~r"
//			Case "S" // space
//				ls_rec_delim = " "
//			Case "E" //empty string
//				ls_rec_delim = ""
//		End Choose
//		*/
//		
//		//export_fields_use_link  sql
//		If li_use_link = 1 Then
//			ls_linkfromcol = Trim( lds_export_flds.GetItemString( p, "export_fields_ctx_linkfromcolumn" ))
//			ls_tempstr = lds_dataobject.Describe( ls_linkfromcol + ".dbname" )
//			f_get_token( ls_tempstr, "." )
//			ls_linkfromcol = ls_tempstr
//			
//			lds_linkto.DataObject = Trim( lds_export_flds.GetItemString( p, "export_fields_ctx_linktoscrndw" ))
//			ls_linktocol = Trim( lds_export_flds.GetItemString( p, "export_fields_ctx_linktocolumn" ))
//			ls_tempstr = lds_linkto.Describe( ls_linktocol + ".dbname" )
//			ls_linktotable = f_get_token( ls_tempstr, "." )
//			ls_linktocol = ls_tempstr
//			
//			//Contacted contact or our company contact - jervis 01.27.2011
//			ll_ctx_link_scrn_id = lds_export_flds.GetItemNumber(p,"export_fields_ctx_linktoscrnid") 
//			If ll_ctx_link_scrn_id = 6 Then
//				ls_ic_link_area = "E"
//			ElseIf ll_ctx_link_scrn_id = 7 Then
//				ls_ic_link_area = "I"
//			elseif ll_ctx_link_scrn_id = 14 or ll_ctx_link_scrn_id = 17 then  //add other contact -- jervis 03.28.2011
//				ls_ic_link_area = "C"
//			End If
//		End If
//		
//		ls_tablelist[ll_FieldSeqID] = ls_select_table
//		ls_fieldlist[ll_FieldSeqID] = ls_export_field
//		li_recdnoList[ll_FieldSeqID] = li_recd_no
//		ls_selectfieldlist[ll_FieldSeqID] = ls_select_field
//		ls_formatList[ll_FieldSeqID] = ls_field_format
//		ll_exportcodeList[ll_FieldSeqID] = ll_export_code
//		//<add> 08/21/2007 by: Andy
//		li_substartList[ll_FieldSeqID] = li_sub_start
//		//end of add
//		li_widthList[ll_FieldSeqID] = li_width
//		//<add> 07/23/2007 by: Andy
//		li_widthtemp = li_width
//		If li_widthtemp < 30 Then li_widthtemp = 30
//		//end of add
//		ls_flddelimList[ll_FieldSeqID] = ls_fld_delim
//		li_udList[ll_FieldSeqID] = ud
//		ls_defvalList[ll_FieldSeqID] = ls_def_val
//		ls_textList[ll_FieldSeqID] = ls_text
//		ls_lu_fieldList[ll_FieldSeqID] = ls_lu_field
//		
//		li_act_formatList[ll_FieldSeqID] = li_act_format
//
//		//If ai_type = 1 Then
//		//	ls_use_link_sql = ls_use_link_sql + ", (" + ls_prac_sql + ") bb "
//		//End If
//		
//		//--------------------------- APPEON BEGIN ---------------------------
//		//$<modify> 03.19.2007 By: Jack (Export)
//		//$<reason> Fix a defect.
//		//Modify 08/15/2007 by: Andy
//		if (ll_ctx_scrn_id = 6 or ll_ctx_scrn_id = 7) and ls_select_field = 'facility_id' then
//			ls_usetable = "ctx_contract_contacts"
//		elseIf ls_select_table <> 'app_facility' Then
//			If li_use_link = 1 Then
//				ls_usetable = Lower(ls_linktotable)
//			Else
//				ls_usetable = Lower(ls_select_table)
//			End If
//		Else
//			ls_usetable = "ctx_basic_info"
//		End If
//		
//		if lb_get_parent then
//			ls_ctx_table = "table_1"
//		else
//			ls_ctx_table = ls_usetable
//		end if
//		
//		//<ad> 08/16/2007 by: Andy
//		ls_tablepk = ""
//		If IsNull(ls_sort) Or Trim(ls_sort) = "" Then
//			ls_sort = ""
//			lb_flagpk = True
//			//lb_sortpk = false
//			ll_pkcnt = UpperBound(ls_table)
//			For ll_n = 1 To ll_pkcnt
//				If Lower(ls_usetable) = Lower(ls_table[ll_n]) Then
//					ls_tablepk = ls_tablepks[ll_n]
//					//ls_sort  = Left(ls_tablepk,len(ls_tablepk) - 2)
//					ls_sort = ls_sortpk[ll_n]
//					lb_flagpk = False
//				End If
//			Next
//			If lb_flagpk Then
//				ll_Rcnt = lds_tablepk.Retrieve( ls_usetable)
//				ls_sort = ls_usetable + '.ctx_id, '
//				For ll_n = 1 To ll_Rcnt
//					If Lower(lds_tablepk.GetItemString( ll_n, "column_name")) = 'ctx_id' Then
//						//ls_sort = ls_usetable + '.ctx_id, '
//						Continue
//					End If
//					ls_tablepk += ls_usetable + '.' + lds_tablepk.GetItemString( ll_n, "column_name") + ", "
//				Next
//				//Modify 08/22/2007 by: Andy
//				//ls_sort = ls_tablepk + ls_sort
//				ls_sort = ls_sort + ls_tablepk
//				//end of modify
//				ls_sort  = Left(ls_sort,Len(ls_sort) - 2)
//				ls_sortpk[ll_pkcnt + 1] = ls_sort
//				ls_table[ll_pkcnt+1] = ls_usetable
//				ls_tablepks[ll_pkcnt+1] = ls_tablepk
//			End If
//			//<add> 08/22/2007 by: Andy
//		Else
//			If Pos(Lower(ls_sort),'ctx_id') < 1 Then ls_sort = ls_usetable + '.ctx_id, ' + ls_sort
//		End If
//		
//		
//		//<add> 08/23/2007 by: Andy
//		If Len(ls_aggre) > 0 Then
//			ls_sort = ls_sort + " , field_value"
//		End If
//		If Len(ls_sort) > 0 Then ls_sort = "order by " + ls_sort
//		//end of add
//		
//		//<add> 08/23/2007 by: Andy
//		If lb_true Then//SQL2005 and ASA9
//			ls_RowNoSyn = ",row_number() over(" + ls_sort+") Row_No"
//		End If
//		//end of add
//		
//		
//		ls_sny_retrieve = ls_synprefix + "Select " + ls_top + " " + ls_ctx_table + ".ctx_id, " + ls_tablepk + ls_Sortsel + String(ll_FieldSeqID) + " FieldSeqID, "
//
//		ls_db_lookup_type = lds_export_flds.GetItemString( p, "export_fields_ctx_lookup_type" )
//		//--------------------------- APPEON BEGIN ---------------------------
//		//$<modify> 04.04.2007 By: Jack 
//		//$<reason> Fix a defect.
//		
//		If ls_select_table = 'app_facility' And ls_select_field_ctx = 'state' Then
//			ls_dddwdata = ''
//		Else
//			ls_dddwdata = Lower( lds_dataobject.Describe( ls_select_field_ctx + ".dddw.datacolumn" ) )
//		End If
//		//---------------------------- APPEON END ----------------------------
//		
//		If ls_dddwdata <> '?' And ls_dddwdata <> '!' And ls_dddwdata <> '' Then
//			ls_tempstr = Lower( lds_dataobject.Describe( ls_select_field_ctx + ".dddw.displaycolumn" ) )
//			
//			//the edit style has been dynamic change for lookup or company dddw -- jervis 09.22.2011
//			ls_dddwname =  Lower( lds_dataobject.Describe( ls_select_field_ctx + ".dddw.name" ) )
//			if ls_dddwname = 'd_dddw_code_lookup' or ls_dddwname = 'd_dddw_company'  then  
//				ls_dddwdata = ''
//			else
//				If ls_tempstr <> '?' And ls_tempstr <> '!' And ls_tempstr <> '' Then
//					
//					If IsNull( ls_db_lookup_type ) Then
//						ls_db_lookup_type = "X"
//						ls_lu_field = ls_tempstr
//						
//						lds_dataobject.GetChild( ls_select_field_ctx, ldwc_dddw )
//						ls_tempstr = ldwc_dddw.Describe( ls_lu_field + ".dbname" )
//						ls_dddwtable = f_get_token( ls_tempstr, "." )
//						ls_dddw_column_dbname = ls_tempstr
//					End If
//				End If
//			end if
//		End If
//		
//		
//		
//		If li_use_link = 1 Then
//			//ls_use_link_sql2 = " (" + ls_linktotable + "." + ls_linktocol + " = " + ls_select_table + "." + ls_linkfromcol + ") and "
//			if lb_get_parent then
//				ls_link_table = ls_linktotable
//				ls_link_table_on = " on( table_2.ctx_id = " + ls_linktotable + ".ctx_id) left join "
//				if ls_select_table <> "app_facility" then
//					ls_no_link_on = " on (table_2.ctx_id = " + Lower(ls_select_table) + ".ctx_id) "
//				else
//					ls_no_link_on = " on (table_2.ctx_id = " + Lower(ls_usetable) + ".ctx_id) "
//				end if
//			else
//				ls_link_table = ls_linktotable + " left join "
//				ls_link_table_on = " "
//			end if
//			
//			ls_select_table_on = " on  (" + ls_linktotable + "." + ls_linktocol + " = " + ls_select_table + "." + ls_linkfromcol + ") "
//			
//			//Contracted contact or our company contact - jervis 01.27.2011
//			//add other contact - jervis 03.28.2011
//			If ll_ctx_link_scrn_id = 6 or ll_ctx_link_scrn_id = 7 or ll_ctx_link_scrn_id = 14 or ll_ctx_link_scrn_id = 17 Then
//				ls_other_where = " and " + ls_linktotable + ".ic_area ='" + ls_ic_link_area + "' "
//			end if
//		else
//			ls_link_table = " "
//			ls_link_table_on = " "
//			//Get select table on clause		-- jervis 03.04.2009
//			if lb_get_parent then
//				if ls_select_table <> "app_facility" then
//					ls_select_table_on = " on (table_2.ctx_id = " + Lower(ls_select_table) + ".ctx_id) "
//				else
//					ls_select_table_on = " on (table_2.ctx_id = " + Lower(ls_usetable) + ".ctx_id) "
//				end if
//			end if
//			ls_no_link_on = ls_select_table_on
//			//Get link table on clause		-jervis 03.04.2009
//		End If
//		
//		If ls_select_field = 'app_facility' And Upper(ls_db_lookup_type)  = "C" Then
//			ls_datatype = "C"
//
//			//ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),app_facility."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from app_facility," + Lower(ls_select_table) +  ls_use_link_sql + " WHERE " + "(" + Lower(ls_select_table) + "." + ls_select_field + " = app_facility.facility_id) and "
//			ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),app_facility."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//									ls_syn_parent + ls_link_table + ls_link_table_on +  Lower(ls_select_table) + ls_select_table_on + " left join app_facility on("+ Lower(ls_select_table) + "." + ls_select_field + " = app_facility.facility_id) "
//
//			ls_select_field  = "app_facility_" + ls_lu_field
//		//---------Start code by jervis 06.09.2009-------------
//		//Export location data
//		
//		//Export company info whit contracted conatct or our company contact -- jervis 01.30.2011
//		elseif (ll_ctx_scrn_id = 6 or ll_ctx_scrn_id = 7 or ll_ctx_link_scrn_id = 14 or ll_ctx_link_scrn_id = 17) and ls_select_field = 'facility_id' then
//			ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),app_facility."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//									ls_syn_parent + ls_link_table + ls_link_table_on +  Lower(ls_select_table) + ls_select_table_on + " left join ctx_contacts on (ctx_contract_contacts.contact_id = ctx_contacts.contact_id) left join app_facility on(ctx_contacts.facility_id = app_facility.facility_id) "
//
//			ls_select_field  = "app_facility_" + ls_lu_field
//			
//			//if (ll_ctx_scrn_id = 6 or ll_ctx_scrn_id = 7) Then
//				ls_other_where = " and ctx_contract_contacts.ic_area = '" +ls_ic_area + "' "
//			//end if
//			
//		elseif ls_select_field = 'loc_id' and upper(ls_db_lookup_type) = "L" then //Location
//			ls_datatype = "C"
//			if ls_lu_field = "state"  or ls_lu_field = "country" or ls_lu_field = "mailing_address" then
//				//Use code_lookup.code display value -- jervis 08.04.2009
//				ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),code_lookup.code) field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//									ls_syn_parent + ls_link_table + ls_link_table_on +  Lower(ls_select_table) + ls_select_table_on + " left join group_practice on("+ Lower(ls_select_table) + "." + ls_select_field + " = group_practice.rec_id) " + &
//									"left join code_lookup on ( group_practice." + ls_lu_field + " = code_lookup.lookup_code) " 
//			elseif  ls_lu_field = "county"  then
//				//Use code_lookup.describe display value -- jervis 08.04.2009
//				ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),code_lookup.description) field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//									ls_syn_parent + ls_link_table + ls_link_table_on +  Lower(ls_select_table) + ls_select_table_on + " left join group_practice on("+ Lower(ls_select_table) + "." + ls_select_field + " = group_practice.rec_id) " + &
//									"left join code_lookup on ( group_practice." + ls_lu_field + " = code_lookup.lookup_code) " 
//			elseif ls_lu_field = "mailing_address_desc" then		//Export Description - jervis 08.07.2009
//				ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),code_lookup.description) field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//									ls_syn_parent + ls_link_table + ls_link_table_on +  Lower(ls_select_table) + ls_select_table_on + " left join group_practice on("+ Lower(ls_select_table) + "." + ls_select_field + " = group_practice.rec_id) " + &					
//									"left join code_lookup on ( group_practice.mailing_address = code_lookup.lookup_code) " 
//			else
//				ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),group_practice."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//									ls_syn_parent + ls_link_table + ls_link_table_on +  Lower(ls_select_table) + ls_select_table_on + " left join group_practice on("+ Lower(ls_select_table) + "." + ls_select_field + " = group_practice.rec_id) "
//			end if
//			ls_select_field = "group_practice_" + ls_lu_field
//		//---------End code by jervis 06.09.2009-------------
//		
//		elseif ls_select_field = 'parent_comp_id' and Upper(ls_db_lookup_type) = "M" then	//Parent Organization -- jervis 06.23.2009
//			
//			ls_datatype = "C"
//			ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),group_multi_loc."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//									ls_syn_parent + ls_link_table + ls_link_table_on +  Lower(ls_select_table) + ls_select_table_on + " left join group_multi_loc on("+ Lower(ls_select_table) + "." + ls_select_field + " = group_multi_loc.rec_id) "
//			ls_select_field = "group_multi_loc_" + ls_lu_field
//
//		//---------Start code by jervis 03.17.2009-------------
//		//Export Requiments data
//		elseif ls_select_field = 'ctx_req_profile_id' and Upper(ls_db_lookup_type) = "R"	 then //Requiren profile dddw-jervis 03.17.2009
//			ls_Datatype = 'C'
//			ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),ctx_req_profile."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//									ls_syn_parent + ls_link_table + ls_link_table_on +  Lower(ls_select_table) + ls_select_table_on + " left join ctx_req_profile on("+ Lower(ls_select_table) + "." + ls_select_field + " = ctx_req_profile.ctx_req_profile_id) "
//			ls_select_field = "ctx_req_profile_" + ls_lu_field
//		
//		ElseIf ll_ctx_scrn_id = 22 Then
//			ls_datatype = of_get_coltype(lds_dataobject,ls_select_field_ctx) 
////					ls_select_table = 'ctx_orgs_contact'//added by gavins 20130314
//			If ls_select_field = 'org_type' then
//				ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),code_lookup."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//											ls_syn_parent + ls_link_table + ls_link_table_on +  Lower(ls_select_table) + ls_select_table_on + " inner join ctx_orgs on " + Lower(ls_select_table) + ".org_id"  +" = ctx_orgs.org_id  left join code_lookup on (ctx_orgs." + ls_select_field + " = code_lookup.lookup_code) "
//			Else
//				ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),ctx_orgs."+ ls_select_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//									ls_syn_parent + ls_link_table + ls_link_table_on +  Lower(ls_select_table) + ls_select_table_on + " inner join ctx_orgs on " + Lower(ls_select_table) + ".org_id"  +" = ctx_orgs.org_id  "
//			End if
//			ls_select_field  = "ctx_orgs_" + ls_select_field						
//		elseif ll_ctx_scrn_id = 12 then	//Export Requirements Profile Detail Data - jervis 03.17.2009
//			ls_datatype = of_get_coltype(lds_dataobject,ls_select_field_ctx)
//			choose case ls_select_field
//				case 'data_value'
//					ls_sny_retrieve = ls_sny_retrieve +  " convert(varchar(" + String(li_widthtemp) + "),(Case ctx_req_tmplt_element.value_type when 1 then convert(varchar," + ls_select_table + ".date_value ,101) when 2 then " + ls_select_table+ ".field_value when 3 then " + ls_select_table + ".char_value when 4 then cast(" +ls_select_table+".integer_value as varchar) when 6 then cast(" +ls_select_table+".money_value as varchar) when 5 then " +ls_select_table +" .field_value end)) field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " 
//											//ls_syn_parent + ls_link_table + ls_link_table_on + ls_select_table + ls_select_table_on + &
//											//"left join ctx_req_tmplt_element on (" + ls_select_table + ".ctx_req_tmplt_element_id = ctx_req_tmplt_element.ctx_req_tmplt_element_id)"
//					ls_select_field = ls_select_table + "_"+ls_select_field
//				case 'element_sort'	//in process....
//				case 'requirement'	
//					ls_sny_retrieve = ls_sny_retrieve +  " convert(varchar(" + String(li_widthtemp) + "),ctx_req_tmplt_element.element_name) field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " //+ &
//											//ls_syn_parent + ls_link_table + ls_link_table_on + ls_select_table + ls_select_table_on + &
//											//"left join ctx_req_tmplt_element  on (" + ls_select_table + ".ctx_req_tmplt_element_id = ctx_req_tmplt_element.ctx_req_tmplt_element_id)"
//					ls_select_field =  "ctx_req_tmplt_element_"+ls_select_field
//				case 'ctx_rqmnt_category_id'	//in process....
//				case 'ctx_req_profile_id'	//in process
//				case 'category_name'
//					ls_sny_retrieve = ls_sny_retrieve +  " convert(varchar(" + String(li_widthtemp) + "),ctx_rqmnt_category.category_name) field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " //+ &
//											//ls_syn_parent + ls_link_table + ls_link_table_on + ls_select_table + ls_select_table_on + &
//											//"left join ctx_req_tmplt_element on (" + ls_select_table + ".ctx_req_tmplt_element_id = ctx_req_tmplt_element.ctx_req_tmplt_element_id) " + &
//											//"left join ctx_rqmnt_category  on (ctx_req_tmplt_element.ctx_rqmnt_category_id = ctx_rqmnt_category.ctx_rqmnt_category_id and " + ls_linktotable + ".ctx_req_profile_id = ctx_rqmnt_category.ctx_req_profile_id)"
//					ls_select_field = "ctx_rqmnt_category_"+ls_select_field
//
//				case else		//case 'clause'
//					ls_sny_retrieve = ls_sny_retrieve +  " convert(varchar(" + String(li_widthtemp) + ")," + ls_select_table + "."+ ls_select_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " //+ &
//											//ls_syn_parent + ls_link_table + ls_link_table_on + ls_select_table + ls_select_table_on 
//											
//					ls_select_field = ls_select_table + "_"+ls_select_field
//			end choose
//			ls_sny_retrieve =  ls_sny_retrieve + ls_syn_parent + ls_link_table + ls_link_table_on + ls_select_table + ls_select_table_on + &
//									" left join ctx_req_tmplt_element on (" + ls_select_table + ".ctx_req_tmplt_element_id = ctx_req_tmplt_element.ctx_req_tmplt_element_id) " + &
//									" left join ctx_rqmnt_category  on (ctx_req_tmplt_element.ctx_rqmnt_category_id = ctx_rqmnt_category.ctx_rqmnt_category_id and " + ls_linktotable + ".ctx_req_profile_id = ctx_rqmnt_category.ctx_req_profile_id)"
//		//---------End code by jervis 03.17.2009-------------
//		
//		//-----------Start code by jervis 03.20.2009------------
//		//Export the Processing Setting for Contract status tract
//		elseif ll_ctx_scrn_id = 2004 and ls_select_field = "processing_setting"	 then
//			ls_datatype = 'C'
//			ls_sny_retrieve = ls_sny_retrieve +  " convert(varchar(" + String(li_widthtemp) + "),case code_lookup.custom_2 when 'On' then 'In Process' when 'Off' then 'On Hold' when 'Complete' then 'Executed' when 'NA' then 'N/A' else custom_2 end ) field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//									ls_syn_parent + ls_link_table + ls_link_table_on + ls_select_table + ls_select_table_on + &
//									" left join code_lookup on (" + ls_select_table+ ".status = code_lookup.lookup_code)" // and code_lookup.lookup_name = 'Contract Status')" -- comment by jervis -- 04.26.2011
//											
//			//ls_select_field = ls_select_table + "_"+ls_select_field
//		//---------End code by jervis 03.20.2009-------------
//		ElseIf ls_select_field = 'contact_id' and ll_ctx_scrn_id <> 2001 Then  //Add ll_ctx_scrn_id <> 2001 -- jervis 01.28.2011
//			//--------------------------- APPEON BEGIN ---------------------------
//			//$<modify> 06.05.2007 By: Jack
//			//$<reason> Fix a defect.
//			If ls_lu_field = 'contact_department' Or ls_lu_field = 'contact_type' Or ls_lu_field = 'contact_id' Then
//				ls_datatype = "N"
//			Else
//				ls_datatype = "C"
//			End If
//			
//			If ls_lu_field = 'phone' or ls_lu_field = "ext" or ls_lu_field = "contact_email" Then
//				if ls_lu_field = "contact_email" then
//					ls_lu_codename = "Email"
//				else
//					ls_lu_codename = "Phone"
//				end if
//				//ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),(select top 1 A.phone from ctx_contacts_numbers A where A.contact_id = ctx_contract_contacts.contact_id and a.via = (select lookup_code from code_lookup where lookup_name = 'Contract Contact Via' and code = 'Phone' ) and a.phone is not null)) field_value, '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from ctx_contract_contacts,ctx_contacts " + ", (" + ls_prac_sql + ") bb " + " where ctx_contract_contacts.contact_id = ctx_contacts.contact_id and ctx_contract_contacts.ic_area = '" + ls_ic_area + "' and "
//				ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),(select top 1 A." + ls_lu_field+ " from ctx_contacts_numbers A where A.contact_id = ctx_contract_contacts.contact_id and a.via = (select top 1 lookup_code from code_lookup where lookup_name = 'Contract Contact Via' and lower(code) = '" + lower(ls_lu_codename) + "' ) and a." + ls_lu_field + " is not null)) field_value, '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//										ls_syn_parent + " ctx_contract_contacts " + ls_no_link_on + " left join ctx_contacts on (ctx_contract_contacts.contact_id = ctx_contacts.contact_id )"
//				ls_other_where = " and ctx_contract_contacts.ic_area = '" +ls_ic_area + "' "
//	
//			Else
//				//ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),ctx_contacts."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from ctx_contacts," + Lower(ls_select_table) +  ls_use_link_sql + " WHERE " + "(" + Lower(ls_select_table) + "." + ls_select_field + " = ctx_contacts.contact_id) and "
//				ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),ctx_contacts."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//										ls_syn_parent +  ls_link_table + ls_link_table_on +  lower(ls_select_table) + ls_select_table_on + " left join ctx_contacts on(" + Lower(ls_select_table) + "." + ls_select_field + " = ctx_contacts.contact_id) "
//				//Add other contact - jervis 03.28.2011
//				if (ll_ctx_scrn_id = 6 or ll_ctx_scrn_id = 7 or ll_ctx_scrn_id = 14 or ll_ctx_scrn_id = 17) and lower(ls_select_table) = "ctx_contract_contacts" Then
//					ls_other_where = " and ctx_contract_contacts.ic_area = '" +ls_ic_area + "' "
//				end if
//			End If
//			//---------------------------- APPEON END ----------------------------
//			
//			ls_select_field  = "ctx_contacts_" + ls_lu_field
//			
//		
//		elseif ll_ctx_scrn_id = 2002 and (ls_select_field = 'phone' or ls_select_field = "ext" or ls_select_field = "contact_email") then  //Add by jervis 03.28.2011
//			ls_datatype = "C" 
//			//,(select top 1 A." + ls_lu_field+ " from ctx_contacts_numbers A where A.contact_id = ctx_contract_contacts.contact_id and a.via = (select top 1 lookup_code from code_lookup where lookup_name = 'Contract Contact Via' and lower(code) = '" + lower(ls_lu_codename) + "' ) and a." + ls_lu_field + " is not null))
//			ls_field_value = " convert(varchar(" + String(li_widthtemp) + "),"+ ls_select_table + "." +ls_select_field + ") "
//			
//			if ls_select_field = "contact_email" then
//				ls_lu_codename = "Email"
//			else
//				ls_lu_codename = "Phone"
//			end if
//				
//			ls_sny_retrieve = ls_sny_retrieve + ls_field_value + " field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//											ls_syn_parent +ls_link_table + ls_link_table_on +   Lower(ls_select_table) + ls_select_table_on
//			//overwrite link other where condition
//			if li_use_link = 1 and (ll_ctx_link_scrn_id = 6 or ll_ctx_link_scrn_id = 7 or ll_ctx_link_scrn_id = 14 or ll_ctx_link_scrn_id = 17) Then
//				ls_other_where = " and ("+ ls_select_table + ".via = (select top 1 lookup_code from code_lookup where lookup_name = 'Contract Contact Via' and lower(code) = '" + lower(ls_lu_codename) + "' and " + ls_select_table +  "." + ls_select_field + " is not null) and ctx_contract_contacts.ic_area = '" +ls_ic_link_area + "' ) "
//			end if
//		ElseIf ls_select_field = 'compute_1' Then
//			ls_datatype = "C"
//				
//			//ls_sny_retrieve = ls_synprefix + "Select " + ls_top + " ctx_contract_contacts.ctx_id, " + ls_tablepk + ls_Sortsel + String(ll_FieldSeqID) + " FieldSeqID,  isnull(ctx_contacts.last_name,'') + ','  + isnull(ctx_contacts.first_name,'') + case when isnull(ctx_contacts.middle_name,'') <> '' THEN ', ' + isnull(ctx_contacts.middle_name,'') else '' END field_value, '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from ctx_contract_contacts,ctx_contacts " + ", (" + ls_prac_sql + ") bb " + " where ctx_contract_contacts.contact_id = ctx_contacts.contact_id and ctx_contract_contacts.ic_area = '" + ls_ic_area + "' and "
//			if lb_get_parent then
//				ls_sny_retrieve = ls_synprefix + "Select " + ls_top + " table_1.ctx_id, " + ls_tablepk + ls_Sortsel + String(ll_FieldSeqID) + " FieldSeqID,  isnull(ctx_contacts.last_name,'') + ','  + isnull(ctx_contacts.first_name,'') + case when isnull(ctx_contacts.middle_name,'') <> '' THEN ', ' + isnull(ctx_contacts.middle_name,'') else '' END field_value, '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//										ls_syn_parent + " ctx_contract_contacts " + ls_no_link_on + " left join ctx_contacts on (ctx_contract_contacts.contact_id = ctx_contacts.contact_id and ctx_contract_contacts.ic_area = '" + ls_ic_area + "')"
//			ELSE
//				ls_sny_retrieve = ls_synprefix + "Select " + ls_top + " ctx_contract_contacts.ctx_id, " + ls_tablepk + ls_Sortsel + String(ll_FieldSeqID) + " FieldSeqID,  isnull(ctx_contacts.last_name,'') + ','  + isnull(ctx_contacts.first_name,'') + case when isnull(ctx_contacts.middle_name,'') <> '' THEN ', ' + isnull(ctx_contacts.middle_name,'') else '' END field_value, '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//										 " ctx_contract_contacts " +  " left join ctx_contacts on (ctx_contract_contacts.contact_id = ctx_contacts.contact_id and ctx_contract_contacts.ic_area = '" + ls_ic_area + "')"
//			END IF
//			ls_other_where = " and ctx_contract_contacts.ic_area = '" +ls_ic_area + "' "
//			ls_select_field  = "compute_1"
//		ElseIf ls_select_field = 'contact_phone' Then
//			ls_datatype = "C"
//			//ls_sny_retrieve = ls_synprefix + "Select " + ls_top + " ctx_contract_contacts.ctx_id, " + ls_tablepk + ls_Sortsel + String(ll_FieldSeqID) + " FieldSeqID,  (select top 1 A.phone from ctx_contacts_numbers A where A.contact_id = ctx_contract_contacts.contact_id and	a.via = (select lookup_code from code_lookup where lookup_name = 'Contract Contact Via' and code = 'Phone' ) and a.phone is not null) field_value, '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from ctx_contract_contacts,ctx_contacts where ctx_contract_contacts.contact_id = ctx_contacts.contact_id and ctx_contract_contacts.ic_area = '" + ls_ic_area + "' and "
//			if lb_get_parent then
//				ls_sny_retrieve = ls_synprefix + "Select " + ls_top + " table_1.ctx_id, " + ls_tablepk + ls_Sortsel + String(ll_FieldSeqID) + " FieldSeqID,  (select top 1 A.phone from ctx_contacts_numbers A where A.contact_id = ctx_contract_contacts.contact_id and	a.via = (select top 1 lookup_code from code_lookup where lookup_name = 'Contract Contact Via' and code = 'Phone' ) and a.phone is not null) field_value, '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//										ls_syn_parent + " ctx_contract_contacts " + ls_no_link_on + " left join ctx_contacts on(ctx_contract_contacts.contact_id = ctx_contacts.contact_id ) "
//			else
//				ls_sny_retrieve = ls_synprefix + "Select " + ls_top + " ctx_contract_contacts.ctx_id, " + ls_tablepk + ls_Sortsel + String(ll_FieldSeqID) + " FieldSeqID,  (select top 1 A.phone from ctx_contacts_numbers A where A.contact_id = ctx_contract_contacts.contact_id and	a.via = (select top 1 lookup_code from code_lookup where lookup_name = 'Contract Contact Via' and code = 'Phone' ) and a.phone is not null) field_value, '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//										" ctx_contract_contacts  left join ctx_contacts on(ctx_contract_contacts.contact_id = ctx_contacts.contact_id ) "
//			end if
//			ls_other_where = " and ctx_contract_contacts.ic_area = '" +ls_ic_area + "' "
//		ElseIf ls_select_field = 'contact_email' Then
//			ls_datatype = "C"
//			If lb_get_parent Then
//				//ls_sny_retrieve = ls_synprefix + "Select " + ls_top + " ctx_contract_contacts.ctx_id, " + ls_tablepk + ls_Sortsel + String(ll_FieldSeqID) + " FieldSeqID,  (select top 1 A.contact_email from ctx_contacts_numbers A where A.contact_id = ctx_contract_contacts.contact_id and a.via = (select lookup_code from code_lookup where lookup_name = 'Contract Contact Via' and code = 'Email' ) and a.contact_email is not null) field_value, '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from ctx_contract_contacts,ctx_contacts " + ", (" + ls_prac_sql + ") bb " + " where ctx_contract_contacts.contact_id = ctx_contacts.contact_id and ctx_contract_contacts.ic_area = '" + ls_ic_area + "' and "
//				ls_sny_retrieve = ls_synprefix + "Select " + ls_top + " table_1.ctx_id, " + ls_tablepk + ls_Sortsel + String(ll_FieldSeqID) + " FieldSeqID,  (select top 1 A.contact_email from ctx_contacts_numbers A where A.contact_id = ctx_contract_contacts.contact_id and	a.via = (select top 1 lookup_code from code_lookup where lookup_name = 'Contract Contact Via' and code = 'Email' ) and a.contact_email is not null) field_value, '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//										ls_syn_parent + " ctx_contract_contacts " + ls_no_link_on + " left join ctx_contacts on(ctx_contract_contacts.contact_id = ctx_contacts.contact_id ) "
//			Else
//				ls_sny_retrieve = ls_synprefix + "Select " + ls_top + " ctx_contract_contacts.ctx_id, " + ls_tablepk + ls_Sortsel + String(ll_FieldSeqID) + " FieldSeqID,  (select top 1 A.contact_email from ctx_contacts_numbers A where A.contact_id = ctx_contract_contacts.contact_id and	a.via = (select top 1 lookup_code from code_lookup where lookup_name = 'Contract Contact Via' and code = 'Email' ) and a.contact_email is not null) field_value, '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//										" ctx_contract_contacts  left join ctx_contacts on(ctx_contract_contacts.contact_id = ctx_contacts.contact_id ) "
//			End If
//			ls_other_where = " and ctx_contract_contacts.ic_area = '" +ls_ic_area + "' "
//		ElseIf Upper(ls_db_lookup_type)  = "C" Then //code lookup table
//			
//			ls_datatype_ctx = of_get_coltype(lds_dataobject,ls_select_field_ctx) //03.25.2011 by jervis
//			
//			//--------------------------- APPEON BEGIN ---------------------------
//			//$<modify> 03.19.2007 By: Jack (Export)
//			//$<reason> Fix a defect.
//			If Upper(ls_lu_field) = "LOOKUP_CODE" Then
//				ls_datatype = "N"
//			Else
//				ls_datatype = "C"
//			End If
//			
//			if ls_datatype_ctx = 'N' then //Non't convert - jervis 03.25.2011
//				If ls_select_table <> 'app_facility' Then
//					//ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),code_lookup."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from code_lookup," + Lower(ls_select_table) +  ls_use_link_sql + " WHERE " + "(convert(varchar," + Lower(ls_select_table) + "." + ls_select_field + ") = convert(varchar,code_lookup.lookup_code)) and "
//					ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),code_lookup."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//											ls_syn_parent + ls_link_table + ls_link_table_on +  Lower(ls_select_table) + ls_select_table_on + " left join code_lookup on (" + Lower(ls_select_table) + "." + ls_select_field + " = code_lookup.lookup_code) "
//				Else
//					//ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),code_lookup."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from ctx_basic_info,code_lookup," + lower(ls_select_table) +  ls_use_link_sql + " WHERE " + "(convert(varchar," + lower(ls_select_table) + "." + ls_select_field + ") = convert(varchar,code_lookup.lookup_code)) and "			
//					ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),code_lookup."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//											ls_syn_parent + ls_link_table + ls_link_table_on +  " ctx_basic_info " + ls_select_table_on + " left join app_facility on(ctx_basic_info.app_facility = app_facility.facility_id) left join code_lookup on (" + lower(ls_select_table) + "." + ls_select_field + " = code_lookup.lookup_code) "			
//				End If
//			else
//				If ls_select_table <> 'app_facility' Then
//					//ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),code_lookup."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from code_lookup," + Lower(ls_select_table) +  ls_use_link_sql + " WHERE " + "(convert(varchar," + Lower(ls_select_table) + "." + ls_select_field + ") = convert(varchar,code_lookup.lookup_code)) and "
//					ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),code_lookup."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//											ls_syn_parent + ls_link_table + ls_link_table_on +  Lower(ls_select_table) + ls_select_table_on + " left join code_lookup on (convert(varchar," + Lower(ls_select_table) + "." + ls_select_field + ") = convert(varchar,code_lookup.lookup_code)) "
//				Else
//					//ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),code_lookup."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from ctx_basic_info,code_lookup," + lower(ls_select_table) +  ls_use_link_sql + " WHERE " + "(convert(varchar," + lower(ls_select_table) + "." + ls_select_field + ") = convert(varchar,code_lookup.lookup_code)) and "			
//					ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),code_lookup."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//											ls_syn_parent + ls_link_table + ls_link_table_on +  " ctx_basic_info " + ls_select_table_on + " left join app_facility on(ctx_basic_info.app_facility = app_facility.facility_id) left join code_lookup on (convert(varchar," + lower(ls_select_table) + "." + ls_select_field + ") = convert(varchar,code_lookup.lookup_code)) "			
//				End If
//			end if
//			//---------------------------- APPEON END ----------------------------
//			ls_select_field  = "code_lookup_" + ls_lu_field
//		elseif Upper(ls_db_lookup_type) = "P" then
//			ls_datatype_ctx = of_get_coltype(lds_dataobject,ls_select_field_ctx) //03.25.2011 by jervis
//			//Company dddw process--jervis 12.9.2009
//			ls_datatype = "C"
//			if ls_datatype_ctx = 'N' then //Jervis 03.25.2011
//				ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),app_facility."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//									ls_syn_parent + ls_link_table + ls_link_table_on +  Lower(ls_select_table) + ls_select_table_on + " left join app_facility on(" + Lower(ls_select_table) + "." + ls_select_field + " = app_facility.facility_id) "
//			else
//				ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),app_facility."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//									ls_syn_parent + ls_link_table + ls_link_table_on +  Lower(ls_select_table) + ls_select_table_on + " left join app_facility on(convert(varchar," + Lower(ls_select_table) + "." + ls_select_field + ") = convert(varchar,app_facility.facility_id)) "
//			end if
//			ls_select_field  = "app_facility_" + ls_lu_field
//		ElseIf Upper(ls_db_lookup_type)  = "A" Then //address lookup table		
//			If ls_lu_field = "description"  Then
//				gnv_debug.of_output(true, 'Alarm  Export:' +  "The address lookup field set for export field '" + ls_select_field + "' is improperly set" ) //added by gaivns 20120912
//				MessageBox("Data Error on field " + ls_export_field,"The address lookup field set for export field '" + ls_select_field + "' is improperly set.  You cannot use description, try entity_name.  Please correct.")
//				Close(w_export_progress)
//				
//				Destroy lds_export_flds
//				Destroy lds_export_hdr
//				Destroy lds_address_lookup
//				Destroy lds_code_lookup
//				Destroy lds_export_equiv_code
//				Destroy lds_dataobject
//				Destroy lds_linkto
//				Destroy lds_field
//				Destroy lds_export_dataTemp
//				Destroy lds_tablepk
//				Destroy lds_export_data
//				//<del> 2008-05-04 by:nova
//				//end of add
//				//$<add> 01.07.2008 by: Andy
//				//if lb_ASA7 then gnv_appeondb.of_commitqueue( )
//				Return 0
//				
//			Else
//				If Upper(ls_lu_field) = "LOOKUP_CODE" Then
//					ls_datatype = "N"
//				ElseIf Upper(ls_lu_field) = "CUSTOM_1" Or Upper(ls_lu_field) = "CUSTOM_2" Then //maha 050704 
//					ls_datatype = "N"
//				Else
//					ls_datatype = "C"
//				End If
//				
//				//ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),address_lookup."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from address_lookup," + Lower(ls_select_table) +  ls_use_link_sql + " WHERE " + "(convert(varchar," + Lower(ls_select_table) + "." + ls_select_field + ") = convert(varchar,address_lookup.lookup_code)) and "
//				ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),address_lookup."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//										ls_syn_parent +  ls_link_table + ls_link_table_on +  Lower(ls_select_table) + ls_select_table_on + " left join address_lookup on (convert(varchar," + Lower(ls_select_table) + "." + ls_select_field + ") = convert(varchar,address_lookup.lookup_code)) "
//
//				ls_select_field  = "address_lookup_" + ls_lu_field
//			End If
//		ElseIf ls_db_lookup_type = "X" Then //ToDo:
//			ls_datatype = ldwc_dddw.Describe( ls_lu_field + ".coltype")
//			Choose Case Left ( ls_datatype , 5 )
//				Case "char(", "char"
//					ls_datatype = "C"
//				Case "date"	,"datet"	,"time", "times"
//					ls_datatype = "D"
//				Case "decim","numbe", "doubl", "real","long", "ulong", "int"
//					ls_datatype = "N"
//			End Choose
//			
//			
//			If Upper(ls_datatype) = 'D' Then
//				ls_field_value = " convert(varchar(16)," + ls_dddwtable + "."+ ls_dddw_column_dbname + ",120)"
//			else
//				ls_field_value = " convert(varchar(" + String(li_widthtemp) + ")," + ls_dddwtable + "."+ ls_dddw_column_dbname + ")"
//			end if
//			
//			//ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(16)," + ls_dddwtable + "."+ ls_dddw_column_dbname + ",120) field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + ls_dddwtable + "," + &
//			//		Lower(ls_select_table) +  ls_use_link_sql + " WHERE " + "(" + Lower(ls_select_table) + "." + &
//			//		ls_select_field + " = " + ls_dddwtable + "." + ls_dddwdata + ") and "
//			ls_sny_retrieve = ls_sny_retrieve + ls_field_value+ " field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//									ls_syn_parent + ls_link_table + ls_link_table_on +  Lower(ls_select_table) + ls_select_table_on + &
//									" left join " +ls_dddwtable + " on(" + Lower(ls_select_table) + "." +	ls_select_field + " = " + ls_dddwtable + "." + ls_dddwdata + ") "
//			ls_select_field  = ls_dddwtable + "_" + ls_dddw_column_dbname
//		Else // NON LOOKUP FIELDS
//			ls_datatype = of_get_coltype(lds_dataobject,ls_select_field_ctx) //03.17.2009 by jervis
//						
//			If IsNull(ls_datatype) Then MessageBox("Datatype Not Anticipated","Retrieved null datatype")
//			
//			If Len(ls_aggre) > 0 Then //maha 012703 for aggregate functions
//				//ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + ")," + ls_aggre + "("	+ ls_select_table + "." + ls_select_field + ")) field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + Lower(ls_select_table) +  ls_use_link_sql + " WHERE "
//				ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + ")," + ls_aggre + "("	+ ls_select_table + "." + ls_select_field + ")) field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//										ls_syn_parent + Lower(ls_select_table) + ls_select_table_on
//			Else
//				if Upper(ls_datatype) = "D" then
//					ls_field_value = " convert(varchar(16),"+ ls_select_table + "." +ls_select_field + ",120) "
//				else
//					ls_field_value = " convert(varchar(" + String(li_widthtemp) + "),"+ ls_select_table + "." +ls_select_field + ") "
//				end if
//				If ls_select_table <> 'app_facility' Then
//					//ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(16),"+ ls_select_table + "." +ls_select_field + ",120) field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + Lower(ls_select_table) +  ls_use_link_sql + " WHERE "
//					ls_sny_retrieve = ls_sny_retrieve + ls_field_value + " field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//											ls_syn_parent +ls_link_table + ls_link_table_on +   Lower(ls_select_table) + ls_select_table_on
//				Else
//					//ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(16),"+ ls_select_table + "." +ls_select_field + ",120) field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from ctx_basic_info," + Lower(ls_select_table) +  ls_use_link_sql + " WHERE "
//					ls_sny_retrieve = ls_sny_retrieve + ls_field_value + " field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//											ls_syn_parent + ls_link_table + ls_link_table_on +  " ctx_basic_info " + ls_select_table_on + " left join " + Lower(ls_select_table) + " on(ctx_basic_info.app_facility = app_facility.facility_id)"
//				End If
//			End If
//		End If
//		
//		//export_fields_use_link  sql
//		If li_use_link = 1 Then
//			//If Upper(ls_db_lookup_type) = "A" Or Upper(ls_db_lookup_type) = "C" Then
//			If Upper(ls_db_lookup_type) = "A" Or Upper(ls_db_lookup_type) = "C" or Upper(ls_db_lookup_type) = "X" or Upper(ls_db_lookup_type)  = 'R' Then
//			Else
//				ls_select_field = ls_select_table_trim + "_" + ls_select_field
//			End If
//		End If
//
//		//If ls_select_table <> 'app_facility' Then
//			//modify 08/15/2007 by: Andy
//			If ai_type = 1 Then
//				//ls_sny_retrieve = ls_sny_retrieve + ls_usetable + ".ctx_id  = bb.ctx_id "  + ls_filter
//				ls_sny_retrieve = ls_sny_retrieve + ", (" + ls_prac_sql + ") bb where " + ls_ctx_table + ".ctx_id  = bb.ctx_id and bb.ctx_id > 0 "  + ls_other_where + ls_filter	//jervis 08.26.2009 add bb.ctx_id > 0
//			ElseIf ai_type = 3 Then
//				//ls_sny_retrieve = ls_sny_retrieve + ls_usetable + ".ctx_id " + ls_prac_ids + ls_filter
//				ls_sny_retrieve = ls_sny_retrieve + " where " + ls_ctx_table + ".ctx_id " + ls_prac_ids + ls_other_where + ls_filter
//			ElseIf ai_type = 2 Then
//				If lb_usingdb Then
//					ls_sny_retrieve = ls_sny_retrieve + " Inner Join ic_client_data on (" + ls_ctx_table + ".ctx_id = ic_client_data.data_int and ic_client_data.client_id = '"+ls_client_id+"' ) where 1 = 1 "  + ls_other_where + ls_filter
//				Else
//					ls_sny_retrieve = ls_sny_retrieve + " where " + ls_ctx_table + ".ctx_id  in (" + ls_prac_ids  + ")"  + ls_other_where + ls_filter
//				End If
//				
//			End If
//			//end of modify
//		/*
//		Else
//			//------------------Begin Modified by Alfee on 08.18.2008------------------------------------
//			//<$Reason>Fix a bug of duplicate records while 2 or more contracts have the same company 
//			If ai_type = 1 Then
//				ls_sny_retrieve = ls_sny_retrieve + " ctx_basic_info.app_facility = app_facility.facility_id and ctx_basic_info.ctx_id = bb.ctx_id and " + Lower(ls_select_table) + ".facility_id in (select ctx_basic_info.app_facility from ctx_basic_info where ctx_basic_info.ctx_id  = bb.ctx_id )"  + ls_filter
//			ElseIf ai_type = 3 Then
//				ls_sny_retrieve = ls_sny_retrieve + " ctx_basic_info.app_facility = app_facility.facility_id and ctx_basic_info.ctx_id " + ls_prac_ids + " and " + Lower(ls_select_table) + ".facility_id in (select ctx_basic_info.app_facility from ctx_basic_info where ctx_basic_info.ctx_id " + ls_prac_ids  + " )"  + ls_filter
//			ElseIf ai_type = 2 Then
//				ls_sny_retrieve = ls_sny_retrieve + " ctx_basic_info.app_facility = app_facility.facility_id and ctx_basic_info.ctx_id in (" + ls_prac_ids + ") and " + Lower(ls_select_table) + ".facility_id in (select ctx_basic_info.app_facility from ctx_basic_info where ctx_basic_info.ctx_id  in (" + ls_prac_ids  + "))"  + ls_filter
//			End If
//			//------------------End Modified -------------------------------------------------------------							
//		End If
//		*/
//
//		
//		//2nd last add  - prac where
//		If Len(ls_aggre) > 0 Then //maha 012703 for aggregate functions
//			//modify 08/15/2007 by: Andy
//			ls_sny_retrieve = ls_sny_retrieve + " Group by " + ls_ctx_table + ".ctx_id , FieldSeqID ,  field_data_type" + ls_RowNo
//		End If
//		
//		//modify 08/23/2007 by: Andy
//		If Len(ls_sort) > 0 And Not lb_true Then//SQL2000 only 
//			//ls_sny_retrieve = ls_sny_retrieve + "~r~n order by " + ls_sort 
//			ls_sny_retrieve = ls_sny_retrieve + "~r~n " + ls_sort
//		End If
//		//end of modify
//		
//		//modify 05/05/2008 by: Andy
//		ls_sny_retrieve = ls_sny_retrieve + " ) t" + String(ll_FieldSeqID)
//		
//		
//		//end of add
//		If IsNull(ls_sny_retrieve) Then ls_sny_retrieve = ""
//		If Len(ls_sny_retrieve) > 0 Then
//			If ls_UnionSQL = "" Then
//				ls_UnionSQL = ls_sny_retrieve
//			Else
//				ls_UnionSQL = ls_UnionSQL + "~r~n union all ~r~n" + ls_sny_retrieve
//			End If
//		End If
//		//<add> andy 2007.05.25 
//	Else //computer fields
//		//Dynamic create computer columns in order to Calculate its value
//		/*1.deal with Expression**************/
//		ls_export_field     = lds_export_flds.GetItemString(p,"export_field_name")
//		//<add> 08/24/2007 by: Andy
//		of_replacespecchar(ls_export_field)
//		//end of add
//		ls_Expresstion      = Trim( lds_export_flds.GetItemString( p, "export_fields_expression" ) )//db_field_name
//		ls_ComputerDataType = lds_export_flds.GetItemString(p,"ctx_column_datatype")
//		If IsNull(ls_export_field) Then ls_export_field = ''
//		If IsNull(ls_Expresstion) Then ls_Expresstion = ''
//		If IsNull(ls_ComputerDataType) Then ls_ComputerDataType = ''
//		If IsNull(ls_field_format) Then ls_field_format = ''
//		If IsNull(ls_fld_delim) Then ls_fld_delim = ''
//		ll_Cnt = lds_field.RowCount()
//		
//		//If the computer field is numeric,add the function number(  ) in to the Expresstion.
//		//Replace symbol ' with "
//		//comment 07/18/2007 by:Andy Reason:support other data type
//		//if upper(ls_ComputerDataType) = 'N' then
//		For ll_Num = 1 To ll_Cnt
//			ls_Field         = lds_field.GetItemString(ll_Num,"export_field_name")
//			ls_FieldDataType = lds_field.GetItemString(ll_Num,"ctx_column_datatype")
//			If IsNull(ls_Field) Then ls_Field = ''
//			If IsNull(ls_FieldDataType) Then ls_FieldDataType = ''
//			//<add> 07/27/2007 by: Andy 
//			//Reason:The Expresstion of a computer field cann't contain itself.
//			If Lower(ls_export_field) = Lower(ls_Field) Then Continue
//			//end of add
//			
//			//If the field used in then computer field and is number, 
//			//add the function number(  ) in to the Expresstion 
//			//Modify 07/18/2007 by: Andy
//			If Pos(Lower(ls_Expresstion),Lower(ls_Field)) > 0 Then
//				If Upper(ls_FieldDataType) = 'N' Then
//					//Modify 07/17/2007 by: Andy if( isNull( rec_id  ), 0,  rec_id  )
//					ls_Expresstion  = of_globalreplace( ls_Expresstion, ls_Field, "if( isNull( "+ls_Field+" ),0,number( " + ls_Field + " ))",True)
//					//end of modify
//				ElseIf Upper(ls_FieldDataType) = 'S' Then
//					//string
//					ls_Expresstion  = of_globalreplace( ls_Expresstion, ls_Field, "if( isNull( "+ls_Field+" ),''," + ls_Field + " )",True)
//					//<add> 07/27/2007 by: Andy	
//				ElseIf Upper(ls_FieldDataType) = 'D' Then
//					//Datetime
//					ls_Expresstion  = of_globalreplace( ls_Expresstion, ls_Field, "if( isNull( "+ls_Field+" ),'1900-01-01'," + ls_Field + " )",True)
//					//end of add	
//				End If
//			End If
//			//end of Modify
//		Next
//		//end if
//		
//		//replace symbol ' with "
//		ls_Expresstion  = lnvo_string.of_globalreplace( ls_Expresstion, '~~', '~~~~')
//		ls_Expresstion  = lnvo_string.of_globalreplace( ls_Expresstion, '"', '~~"') //'"'
//		//ls_Expresstion  = lnvo_string.of_globalreplace( ls_Expresstion, "'", "~~'")//'"'
//		/*end of 1***************************/
//		
//		//Modify By Jervis 01.18.2010
//		//Tab and ~ exists bug
//		//ls_tag = ls_field_format + '@^@' + ls_ComputerDataType + '@^@' + String(li_width) + '@^@' + ls_fld_delim
//		ls_tag = ls_field_format + '@^@' + ls_ComputerDataType + '@^@' + String(li_width) + '@^@'
//		If ls_field_format = "Leading Padding" Or ls_field_format = "Trailing Padding" Then
//			ls_tag += ls_fld_delim
//		end if
//		//2.Dynamic create computer columns,the name equal ls_Field + '_c'
//		ls_Modify = "create compute(band=detail alignment='0' expression=~""+ls_Expresstion+"~" border='0' color='33554432' x='1157'" + &
//			" y='4' height='64' width='242' format='[GENERAL]' html.valueishtml='0'  name=" + ls_export_field + "_c visible='0'" + &
//			" font.face='MS Sans Serif' font.height='-8' font.weight='400'  font.family='2' font.pitch='2' font.charset='0'" + &
//			" background.mode='1' background.color='536870912' tag='" + ls_tag + "' )"
//		ls_Err    = lds_export_dataTemp.Modify(ls_Modify)
//		//end of 2		
//		//end of add
//	End If
//Next
////<del> 2008-05-04 by:nova
////<add> 08/23/2007 by: Andy
////if lb_ASA7 then gnv_appeondb.of_commitqueue( )
//
//w_export_progress.hpb_bar.Position = 15
////w_export_progress.r_bar.Width = w_export_progress.r_bar.Width + 50
//w_export_progress.st_export.Text = "Retrieve Data"
//
//ll_FieldCnt = ll_FieldSeqID
//If ls_UnionSQL <> "" Then
//	//Modify 08/23/2007 by: Andy
//	If lb_true Then//SQL2005 and ASA9
//		ls_UnionSQL = ls_UnionSQL + "~r~n order by " + "FieldSeqID, ctx_id , Row_No"
//	End If
//	
//	
//	//<add> 08/24/2007 by: Andy
//	If lb_true Then ls_RowNo = ", 0 Row_No"//SQL2005 AND ASA9
//	ls_SqlSelect = "Select top 1 0 prac_id, 1 FieldSeqID,   cast('' as varchar(" + String(ll_maxwidth) + ")) field_value,  ' ' field_data_type" + ls_RowNo + " from pd_basic"
//	
//	
//	ls_dwsyntax_str = SQLCA.SyntaxFromSQL(ls_SqlSelect, ls_presentation_str, Errors)
//	If Len(Errors) > 0 Then
//		gnv_debug.of_output(true, 'Alarm  Export:' +  "SyntaxFromSQL caused these errors: " + Errors + "~r~r" + ls_SqlSelect  ) //added by gaivns 20120912
//		// + ls_export_field
//		MessageBox("Caution on export field ", &
//			"SyntaxFromSQL caused these errors: " + Errors + "~r~r" + ls_SqlSelect)
//		Close(w_export_progress)
//		Destroy lds_export_flds
//		Destroy lds_export_hdr
//		Destroy lds_address_lookup
//		Destroy lds_code_lookup
//		Destroy lds_export_equiv_code
//		Destroy lds_dataobject
//		Destroy lds_linkto
//		Destroy lds_field
//		Destroy lds_export_dataTemp
//		Destroy lds_tablepk
//		Destroy lds_export_data
//		//end of add
//		Return -1
//	End If
//	
//	lds_export_retrieve = Create n_ds
//	w = lds_export_retrieve.Create( ls_dwsyntax_str, Errors)
//	If w < 1 Then
//		//messagebox("error on create",errors)
//		gnv_debug.of_output(true, 'Alarm  Export:' +  "lds_export_retrieve create  errors: " + Errors  + '~r' + ls_SqlSelect   ) //added by gaivns 20120912
//				MessageBox("Error on Create",Errors)
//		Close(w_export_progress)
//		Destroy lds_export_flds
//		Destroy lds_export_hdr
//		Destroy lds_address_lookup
//		Destroy lds_code_lookup
//		Destroy lds_export_equiv_code
//		Destroy lds_dataobject
//		Destroy lds_linkto
//		Destroy lds_field
//		Destroy lds_export_dataTemp
//		Destroy lds_tablepk
//		Destroy lds_export_data
//		//end of add
//		Return -1
//	End If
//	
//	//Modify 08/23/2007 by: Andy
//	lds_export_retrieve.Modify('DataWindow.Table.Select="' + ls_UnionSQL + '"')
//	
//	
//	lds_export_retrieve.SetTransObject( SQLCA )
//	ll_ret_cnt = lds_export_retrieve.Retrieve()
//	
//	//<add> 05/05/2008 by: Andy
//	If ll_ret_cnt < 0 Then
//		
//		gnv_debug.of_output(true, 'Alarm  Export:' +  "lds_export_retrieve retrieve<0 " + '~r' + ls_UnionSQL  ) //added by gaivns 20120912
//		//Reason:check syntax
//		ls_presentation_str = "style(type=grid)"
//		
//		ls_dwsyntax_str = SQLCA.SyntaxFromSQL(ls_UnionSQL, ls_presentation_str, Errors)
//		If Len(Errors) > 0 Then
//			gnv_debug.of_output(true, "Caution on export: " + "SyntaxFromSQL caused these errors: " + Errors)    //Added By Mark Lee 02/01/2013
//			MessageBox("Caution on export" , &
//				"SyntaxFromSQL caused these errors: " + Errors)
//			Close(w_export_progress)
//			If IsValid(lds_export_flds) Then Destroy lds_export_flds
//			If IsValid(lds_export_hdr) Then Destroy lds_export_hdr
//			If IsValid(lds_address_lookup) Then Destroy lds_address_lookup
//			If IsValid(lds_code_lookup) Then Destroy lds_code_lookup
//			If IsValid(lds_export_data) Then Destroy lds_export_data
//			If IsValid(lds_field) Then Destroy lds_field
//			If IsValid(lds_export_dataTemp) Then Destroy lds_export_dataTemp
//			If IsValid(lds_export_equiv_code) Then Destroy lds_export_equiv_code
//			Destroy lds_tablepk
//			
//			Return -1
//		End If
//	End If
//	//end of add
//End If
//
//w_export_progress.hpb_bar.Position = 20
////Modify 08/22/2007 by: Andy
////li_bar_ticks = 70 / li_prac_id_cnt
//li_bar_ticks = 70 / li_fld_cnt
//
////%%%%%%%%%%%%%%%%%%%%%%%%%%%% end of create syntax
//
//ls_prac_field = lds_export_retrieve.Describe("#1.name")
//
//Do While (ll_i <= ll_ret_cnt)
//
//	ll_j = 0
//	ls_data_value = ""
//	ls_value = ""
//	ls_lookup_val = ""
//	ldt_value = DateTime(Date("0000-00-00"),Time("00:00:00"))
//	
//	ll_pracid       = lds_export_retrieve.GetItemNumber(ll_i,ls_prac_field)
//	ll_FieldSeqID   = lds_export_retrieve.GetItemNumber(ll_i,"FieldSeqID")
//	li_recd_no      = li_recdnoList[ll_FieldSeqID]
//	//add 08/22/2007 by: Andy
//	ls_select_table = ls_tablelist[ll_FieldSeqID]
//	ls_select_field = ls_selectfieldlist[ll_FieldSeqID]
//	ls_export_field = ls_fieldlist[ll_FieldSeqID]
//	ls_field_format = ls_formatList[ll_FieldSeqID]
//	ll_export_code  = ll_exportcodeList[ll_FieldSeqID]
//	//<add> 08/21/2007 by: Andy
//	li_sub_start    = li_substartList[ll_FieldSeqID]
//	//end of add
//	li_width        = li_widthList[ll_FieldSeqID]
//	ls_fld_delim    = ls_flddelimList[ll_FieldSeqID]
//	ls_text         = ls_textList[ll_FieldSeqID]
//	ls_lu_field     = ls_lu_fieldList[ll_FieldSeqID]
//	li_act_format   = li_act_formatList[ll_FieldSeqID]
//	
//	ud = li_udList[ll_FieldSeqID]
//	If ud = 1 Then
//		ls_def_val = ls_defvalList[ll_FieldSeqID]
//	ElseIf ud = 2 Then //column default
//		col = Long(ls_defvalList[ll_FieldSeqID])
//	Else
//		ls_def_val = ""
//	End If
//	
//	//Modify 08/22/2007 by: Andy
//	If ll_FieldSeqIDold <> ll_FieldSeqID Then
//		ll_R = 0
//		//ll_R = lds_export_data.Find("rec_id= " + String(ll_pracid),ll_R + 1,li_prac_id_cnt)
//		ll_FieldSeqIDold = ll_FieldSeqID
//		w_export_progress.st_export.Text  = ls_select_table + "_" + ls_select_field //string(ll_FieldSeqID) + "   " + 
//		w_export_progress.st_export1.Text = ls_select_field
//		
//		//if mod(ll_R,n) = 0 then
//		If Mod(ll_FieldSeqID,n) = 0 Then
//			w_export_progress.hpb_bar.Position = w_export_progress.hpb_bar.Position + 1
//		End If
//		//ll_Rorig = ll_R
//	End If
//	
//	//MODIFY 10/12/2007 by:Andy
//	//ll_R = lds_export_data.Find("rec_id= " + String(ll_pracid),ll_R + 1,li_prac_id_cnt)
//	For ll_R = ll_R + 1 To li_prac_id_cnt
//		If al_ctx_ids[ll_R] = ll_pracid Then Exit
//	Next
//	//end of modify
//	
//	//<ADD> 07/12/2007 by: Andy Find the max row of the current ll_FieldSeqID
//	//modify 08/22/2007 by: Andy Find the max row of the current ll_pracid
//	ls_find = "(" + ls_prac_field + " > " + String(ll_pracid) + " AND FieldSeqID = " + String(ll_FieldSeqID) + &
//		") OR ( FieldSeqID  > " + String(ll_FieldSeqID) + ")"
//	ll_j    = lds_export_retrieve.Find ( ls_find, ll_i + 1, ll_ret_cnt )
//	If ll_j > 0 Then
//		//The max row of the current FieldSeqID
//		ll_j = ll_j - 1
//	End If
//	
//	//Perhaps it is the last ll_pracid and it is the max FieldSeqID,
//	//then set ll_j = ll_ret_cnt(max row in the ds)
//	If ll_j = 0 Then
//		ll_j = ll_ret_cnt
//	End If
//	
//	//max - min + 1 = total(current FieldSeqID)
//	If ll_j - ll_i + 1 >= li_recd_no Then
//		//find out
//		ll_prac_row = ll_i + li_recd_no - 1
//	Else
//		//Not 
//		ll_prac_row = 0
//	End If
//	//END OF addd
//	
//	//process data
//	If ll_prac_row > 0 Then
//		ls_datatype     = lds_export_retrieve.GetItemString(ll_prac_row, "field_data_type" )
//		
//		//if li_billing = 1 then //maha app080205 to get billing address data 
//		//	ll_billing_id   = lds_export_retrieve.getitemnumber(ll_prac_row, "billing_address_id" )
//		//	ls_data_value = of_get_billing(ll_billing_id,ls_datatype,ls_select_field,ls_field_format,ls_billsynList[ll_FieldSeqID])//ls_bill_syn
//		//else
//		ls_data_value = lds_export_retrieve.GetItemString(ll_prac_row, "field_value")
//		//end if
//	Else
//		//do nothing
//	End If
//	
//	//comment 08/24/2007 by: Andy
//	//ls_export_field = lnvo_string.of_globalreplace( ls_export_field, "#", "_")
//	//<add> andy 07.05.2007 save original values
//	If Lower(lds_export_dataTemp.Describe(ls_export_field + ".name")) = Lower(ls_export_field) Then
//		lds_export_dataTemp.SetItem(ll_R,ls_export_field,ls_data_value)
//	End If
//	//end of add
//	
//	If ls_format = "export" Then
//		If IsNull(ls_data_value) Then ls_data_value = ""
//	End If
//	
//	//<add> 08/28/2007 by: Andy
//	of_data_format(ls_field_format,ls_datatype,ls_data_value)
//	//end of add
//	
//	
//	//$<add> 05.29.2007 By: Jack
//	//$<reason> Fix a defect.
//	If ls_lu_field = 'contact_department' Or ls_lu_field = 'contact_title' Or ls_lu_field = 'contact_type' Then
//		//modify 09/05/2007 by: Andy Reason:get description
//		//ls_data_value = gnv_data.of_getitem('code_lookup', 'code', "lookup_code = " + ls_data_value)
//		ls_data_value = gnv_data.of_getitem('code_lookup', 'description', "lookup_code = " + ls_data_value)
//	End If
//	
//	//*****GET EXPORT CODES
//	//if lds_export_flds.GetItemnumber( p, "export_code" )  = 1 then //get export code if required
//	If ll_export_code  = 1 Then //get export code if required
//		ls_lookup_val = ls_data_value    //lds_export_data.getitemstring(i,p) //changed 100102
//		If IsNull(ls_lookup_val) Then ls_lookup_val = ''
//		
//		//Convert data type - jervis 03.25.2011
//		if isnumber(ls_lookup_val) then 
//			ls_lookup_code = string(long(ls_lookup_val))
//		else
//			ls_lookup_code = ls_lookup_val
//		end if
//		//ll_find = lds_export_equiv_code.Find( "export_id = " + String(ai_export_id) + " and lookup_code = " + ls_lookup_val, 1, ll_rowcount2 )
//		ll_find = lds_export_equiv_code.Find( "export_id = " + String(ai_export_id) + " and (string(lookup_code) = '" + ls_lookup_code + "' or code = '" + string(ls_lookup_val) + "')", 1, ll_rowcount2 ) //Add code -- jervis 03.25.2011
//		
//		
//		If ll_find > 0 Then
//			ls_value = lds_export_equiv_code.GetItemString(ll_find,'equiv_code')
//		End If
//		
//		If Not IsNull(ls_value) And Trim(ls_value) <> '' Then ls_data_value = ls_value //if no export code use org value
//		If IsNull(ls_data_value) Then ls_data_value = ""
//	End If
//	
//	
//	
//	//<add> 08/22/2007 by: Andy
//	If ls_strip_char <> "NONE" Then
//		ls_data_value = of_strip_char( ls_strip_char ,ls_data_value, "")
//	End If
//	
//	//*** substring function***************************8
//	//create datafield for substring_start
//	//<add> 08/21/2007 by: Andy
//	If li_sub_start > 1 Then ls_data_value = Mid(ls_data_value,li_sub_start,li_width)
//	//end of add
//	//***padding //note if avoid using return, double return, empty string or tab when padding
//	ls_data_value = Mid(ls_data_value,1,li_width) //shrink the length to size 
//	If ls_field_format = "Leading Padding" Or ls_field_format = "Trailing Padding" Then
//		If li_width - Len(ls_data_value) > 0 Then
//			li_dif = li_width - Len(ls_data_value)
//			ls_pad = "" //reset
//			ls_pad = Fill ( ls_fld_delim, li_dif )
//			If ls_field_format = "Leading Padding" Then
//				ls_data_value = ls_pad + ls_data_value
//			Else
//				ls_data_value = ls_data_value + ls_pad
//			End If
//		End If
//	ElseIf ls_field_format = "use text" Then //allows a set value if data is found
//		If Len(ls_data_value) > 0 Then
//			ls_data_value = ls_text
//		End If
//	End If
//	
//	//****set default moved here 091305
//	If ud > 0 Then
//		If IsNull(ls_data_value) Then ls_data_value = ""
//		
//		If ls_data_value = "" Then
//			If ud = 1 Then
//				ls_data_value = ls_def_val
//			ElseIf ud = 2 Then //if set to column get the value out of that column
//				If col < 1 Or col > li_fld_cnt Then //setting trap
//					gnv_debug.of_output(true, 'Alarm  Export:' +  "You are using a column default for column " + ls_export_field + " , but your default value is not a valid column number.~rThe default column number must be less than this column." ) //added by gaivns 20120912
//					MessageBox("Invalid setting","You are using a column default for column " + ls_export_field + " , but your default value is not a valid column number.~rThe default column number must be less than this column.")
//					Close(w_export_progress)
//					Destroy lds_export_flds
//					Destroy lds_export_hdr
//					Destroy lds_address_lookup
//					Destroy lds_code_lookup
//					Destroy lds_export_equiv_code
//					Destroy lds_dataobject
//					Destroy lds_linkto
//					Destroy lds_field
//					Destroy lds_export_dataTemp
//					Destroy lds_tablepk
//					Destroy lds_export_data
//					//end of add
//					Return 0
//				End If
//				ls_data_value = lds_export_data.GetItemString(ll_R,col)
//			End If
//		End If
//	End If
//	
//	//*********value set**********	
//	If li_fld_cnt = 1 Then ls_data_value = ls_data_value + Char(9)
//	If Lower(lds_export_data.Describe(ls_export_field + ".name")) = Lower(ls_export_field) Then
//		//Begin - Added By Mark Lee 09/29/12 its cannot use double quote to merge data values in  the MS word.
//		If Pos(ls_data_value,'"') > 0 Then 
//			gnv_debug.of_output(true, 'Alarm  Export: Its used the double quote Replace the blank data in merged data value on the column ['+ls_export_field+'], and this current data value is the ['+ls_data_value+'].' )
//			ls_data_value  = lnvo_string.of_globalreplace( ls_data_value, '"', ' ')
//		End If
//		//End - Added By Mark Lee 09/29/12
//		lds_export_data.SetItem(ll_R,ls_export_field,ls_data_value)
//	End If
//	
//	//processing the next field(fieldseqid)
//	ll_i = ll_j + 1
//Loop
//
////<add> 08/27/2007 by: Andy process default value
//If of_export_processdefault(lds_export_hdr,lds_export_flds,lds_export_dataTemp,lds_export_data) = -1 Then
//	gnv_debug.of_output(true, 'Alarm  Export: of_export_processdefault=-1 ' )//added by gavins 20120912
//	Close(w_export_progress)
//	Destroy lds_export_flds
//	Destroy lds_export_hdr
//	Destroy lds_address_lookup
//	Destroy lds_code_lookup
//	Destroy lds_export_equiv_code
//	Destroy lds_dataobject
//	Destroy lds_linkto
//	Destroy lds_field
//	Destroy lds_export_dataTemp
//	Destroy lds_tablepk
//	Destroy lds_export_data
//	Return 0
//End If
////end of add
//
////<add> andy 2007.05.25
////set Calculated field value and format into lds_export_data 
////with the relative computer column in lds_export_dataTemp
////Modify 08/22/2007 by: Andy
//of_export_calculatedfield(lds_export_dataTemp,lds_export_data,ls_format)
////end of add
//
//w_export_progress.hpb_bar.Position = 94
//
////Modify 07/18/2007 by: Andy
////if ai_save_data = 1 then //maha 021003
////1:save / 3:save & preview
//If ai_save_data = 1 Or ai_save_data = 3 Then
//	//end of modify
//	w_export_progress.st_progress.Text = "Saving File"
//	
//	//gnv_appeondb.of_autocommit()
//	sd = lds_export_data.Update()
//	Commit Using SQLCA;
//	
//	If sd < 1 Then
//		gnv_debug.of_output(true, 'Alarm  Export: lds_export_data update failed ' )//added by gavins 20120912
//		MessageBox("Save error","Unable to save data to table")
//	End If
//End If
//
////Begin - Added By Mark Lee 07/23/2013. update the sqltext
//of_update_export_sqltext(ai_export_id,ls_prac_sql,ls_UnionSQL)
////End - Added By Mark Lee 07/23/2013.
////-----------------------------------------------------------------------/
//ids_export_data = lds_export_data
//If ids_export_data.Rowcount( ) = 0 Then
//	gnv_debug.of_output(true, 'Alarm  Export: lds_export_data rowcount()=0 '  )//added by gavins 20120912
//Else
//	ib_writefile = true //added by gavins 20121011
//End If
////-----------------------------------------------------------------------/
//
//w_export_progress.st_progress.Text = "Creating File"
//w_export_progress.hpb_bar.Position = 100
//li_bar_ticks = 75 / li_prac_id_cnt
//n = Int(li_fld_cnt/80) + 1
////******************************* CREATE FILE
//
////Modify 08/28/2007 by: Andy
////If IsNull(as_path) Or as_path = "" Then
////	If IsNull(ls_save_path) Or ls_save_path = "" Then ls_save_path = gs_dir_path + gs_DefDirName + "\" + ls_table_name
////Else
//ls_save_path = as_path
//If Right(ls_save_path,1) = ':' Then ls_save_path = ls_save_path + "\"
//ll_LastPos = LastPos(ls_save_path,'.')
//If ll_LastPos > 0 Then
//	ls_save_path = Left(ls_save_path,ll_LastPos - 1)
//End If
////End If
//
////--------------------------- APPEON BEGIN ---------------------------
////$<add> 05.23.2007 By: Jack
////$<reason> If the directory is not exists Then create it 
//String ls_path1
//If Mid(ls_save_path,Len(ls_save_path),1) = "\" Then
//	ls_path1 = ls_save_path
//Else
//	ls_path1 = Mid(ls_save_path,1,LastPos(ls_save_path,'\'))
//End If
////Add By Jervis 11-19-2008
//If ls_path1 = "" Then
//	If appeongetclienttype() = 'WEB' Then
//		ls_path1 = gs_dir_path + gs_DefDirName + "\ExportData\"
//		ls_save_path = ls_path1 + ls_save_path
//	Else
//		ls_path1 = Gs_Current_Directory + "\ExportData\"
//		ls_save_path = ls_path1 + ls_save_path
//	End If
//Else
//	
//	//Added By Ken.Guo 2011-01-11.
//	If invo_rights.of_check_dir_right(ls_path1, True,'Export') <> 1 Then
//		gnv_debug.of_output(true, 'Alarm  Export: check dir right failed '  + ls_path1 )//added by gavins 20120912
//		If isvalid(lds_export_flds) Then Destroy lds_export_flds;
//		If isvalid(lds_export_hdr) Then Destroy lds_export_hdr;
//		If isvalid(lds_address_lookup) Then Destroy lds_address_lookup;
//		If isvalid(lds_code_lookup) Then Destroy lds_code_lookup
//		If isvalid(lds_export_equiv_code) Then Destroy lds_export_equiv_code;
//		If isvalid(lds_dataobject) Then Destroy lds_dataobject
//		If isvalid(lds_linkto) Then Destroy lds_linkto;
//		If isvalid(lds_field) Then Destroy lds_field
//		If isvalid(lds_export_dataTemp) Then Destroy lds_export_dataTemp
//		If isvalid(lds_tablepk) Then Destroy lds_tablepk
//		If isvalid(w_export_progress) Then Close(w_export_progress)		
//		Return 0
//		//ls_path1 = gs_dir_path + gs_DefDirName + "\ExportData\"
//		//ls_save_path = ls_path1
//	End If
//	
//End If
////End By Jervis 
//
//gnv_appeondll.of_parsepath(ls_path1)
//
////---------------------------- APPEON END ----------------------------
//
//If Mid(ls_save_path,Len(ls_save_path),1) <> "\" Then //maha app 102405 if a file name is indicated do not tack on the table name
//	ls_path = ls_save_path +  ls_format
//Else
//	//ls_path = ls_save_path + ls_table_name + ls_format
//	If li_custom_save > 0 Then  //maha new 121205 for custom naming of file
//		ls_save_name = of_custom_name(li_custom_save,ls_table_name,ldt_date)
//	Else
//		ls_save_name = ls_table_name
//	End If
//	ls_path = ls_save_path + ls_save_name + ls_format
//End If
//
////<add> 08/28/2007 by: Andy 
//as_path = ls_path
////end of add
//
////$<modify> 03.20.2008 by Andy
////If ls_format <> "export" Then  //if the auto export path is blank use the export path, if blank use the hard coded path
//If lb_export = False Then
//	//end of modify 03.20.2008
//	gnv_rights.of_check_dir_right( ls_path, true, 'Export')
//	Choose Case ls_format
//		Case ".txt"
//			If ls_header = "1" Then
//				g = lds_export_data.SaveAs(ls_path,Text!,True)
//			Else
//				g = lds_export_data.SaveAs(ls_path,Text!,False)
//			End If
//		Case ".xls"
//			If ls_header = "1" Then
//				g = lds_export_data.SaveAs(ls_path,excel!,True)
//			Else
//				g = lds_export_data.SaveAs(ls_path,excel!,False)
//			End If
//		Case ".csv"
//			If ls_header = "1" Then
//				g = lds_export_data.SaveAs(ls_path,csv!,True)
//			Else
//				g = lds_export_data.SaveAs(ls_path,csv!,False)
//			End If
//	End Choose
//	If g = -1 Then MessageBox("saveas -1","Unable to save file.  Check path (" + ls_path + ") and make sure a copy of the file is not open.")
//Else
//	//build export text file
//	//modify 08/28/2007 by: Andy
//	//li_file_num = FileOpen(as_path + ls_table_name + ".txt", lineMode!, Write!, LockWrite!, Replace!)//maha changed to line mode 091002
//	li_file_num = FileOpen(ls_path, lineMode!, Write!, LockWrite!, Replace!)//maha changed to line mode 091002
//	//end of modify
//	w_export_progress.hpb_bar.Position = 10
//	For i = 1 To li_prac_id_cnt
//		//w_export_progress.hpb_bar.position = w_export_progress.hpb_bar.position + li_bar_ticks
//		If Mod(i,n) = 0 Then
//			w_export_progress.hpb_bar.Position = w_export_progress.hpb_bar.Position + 1
//		End If
//		For p = 1 To li_fld_cnt
//			ls_data_value = lds_export_data.GetItemString(i,p)
//			ls_fld_delim = lds_export_flds.GetItemString( p, "trailing_leading_characters")
//			ls_field_format = lds_export_flds.GetItemString(p,"export_format")
//			Choose Case ls_fld_delim
//				Case "E" //empty String
//					ls_delim_value = ""
//				Case "S" // space
//					ls_delim_value = " "
//				Case "T" //tab
//					ls_delim_value = "	"
//				Case "R" //return
//					ls_delim_value = "~r"
//				Case "D" //return
//					ls_delim_value = "~r~r"
//				Case Else
//					ls_delim_value = ls_fld_delim
//			End Choose
//			If IsNull(ls_delim_value) Then ls_delim_value = ""
//			If ls_field_format = "Leading Padding" Or ls_field_format = "Trailing Padding" Then //don't add delimit value
//				ls_export_text_file = ls_export_text_file + ls_data_value
//			Else
//				ls_export_text_file = ls_export_text_file + ls_data_value + ls_delim_value
//			End If
//			
//		Next
//		ls_export_text_file = ls_export_text_file + ls_rec_delim
//		p = 1
//		FileWrite ( li_file_num, ls_export_text_file)
//		ls_export_text_file = ""
//	Next
//	FileClose(li_file_num)
//End If
////--------------------------- APPEON BEGIN ---------------------------
////$<add> 05.11.2007 By: Jack
////$<reason> Fix a defect.
//ids_export_data = lds_export_data
////---------------------------- APPEON END ----------------------------
//
//If is_called_type <> "2" And IsValid(w_export_progress) Then
//	w_export_progress.hpb_bar.Position = 100
//	If isvalid(w_export_progress) Then Close(w_export_progress)
//End If
//
////<add> 07/18/2007 by: Andy
////2:preview / 3:save & rpeview
//If ai_save_data = 2 Or ai_save_data = 3 Then
//	lstr_pass.s_string = is_select_syntax
//	lstr_pass.s_ds = lds_export_data
//	lstr_pass.s_string_array[1] = ls_UnionSQL
//	OpenWithParm( w_export_previewdata, lstr_pass )
//End If
////end of add
//
//
////$<add> 05.07.2008 by Andy
//If lb_mulsel Then
//	ls_MySQL = "DELETE FROM export_temp WHERE SpID = " + String(ll_SpID) + ";"
//	Execute Immediate :ls_MySQL;
//End If
//
//If isvalid(lds_export_flds) Then Destroy lds_export_flds;
//If isvalid(lds_export_hdr) Then Destroy lds_export_hdr;
//If isvalid(lds_address_lookup) Then Destroy lds_address_lookup;
//If isvalid(lds_code_lookup) Then Destroy lds_code_lookup
//If isvalid(lds_export_equiv_code) Then Destroy lds_export_equiv_code;
//If isvalid(lds_dataobject) Then Destroy lds_dataobject
//If isvalid(lds_linkto) Then Destroy lds_linkto;
//If isvalid(lds_field) Then Destroy lds_field
//If isvalid(lds_export_dataTemp) Then Destroy lds_export_dataTemp
//If isvalid(lds_tablepk) Then Destroy lds_tablepk
//If isvalid(w_export_progress) Then Close(w_export_progress)
//
//Return 1
//



end function

public subroutine of_batch_update_export_data (string as_filter);//====================================================================
// Function: of_batch_update_export_data
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value    string    as_filter
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:	Mark		Date: 06/12/2014
//--------------------------------------------------------------------
//	Copyright (c) 2008-2013 Contractlogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
n_ds			lds_export
Long 			i, ll_rowcount, ll_export_id,	ll_export_type
String 		ls_path, ls_prac_sql, ls_sql_text, ls_filter

lds_export = Create n_ds
lds_export.dataobject = 'ds_export_header'
lds_export.settransobject( sqlca)
lds_export.retrieve( )

ls_filter =''
If gb_contract_version Then
	ls_filter = ' export_type in (3,4) '
End If

if not isnull(as_filter) and trim(as_filter) <> '' then 
	if ls_filter <> '' then
		ls_filter =ls_filter +' and export_id in (' + as_filter+ ') '
	else
		ls_filter =' export_id in (' + as_filter+ ') '
	end if
end if

lds_export.setfilter(ls_filter)
lds_export.filter()

ll_rowcount = lds_export.rowcount()
If ll_rowcount > 0 then
	pfc_n_cst_ai_export_apb		ln_export_apb
	ln_export_apb = Create pfc_n_cst_ai_export_apb
	
	if Not isvalid( w_infodisp ) then open(w_infodisp)

	if isvalid(w_infodisp) then w_infodisp.title = "Update DB - of_update_export()"
	if isvalid(w_infodisp) then w_infodisp.Center = TRUE
	if isvalid(w_infodisp) then w_infodisp.st_complete.visible = false
	if isvalid(w_infodisp) then w_infodisp.st_3.visible = false
	if isvalid(w_infodisp) then w_infodisp.st_information.visible = false
	if isvalid(w_infodisp) then w_infodisp.st_1.text = 'of_update_export()' 
	if isvalid(w_infodisp) then w_infodisp.wf_set_min_max(1,ll_rowcount)
		
	For i = 1 to ll_rowcount
		ll_export_id = lds_export.GetItemNumber(i,'export_id')
		ls_path		=  lds_export.GetItemString(i,'save_path')
		ls_prac_sql	=	lds_export.GetItemString(i,'prac_sql')
		ll_export_type	= lds_export.GetItemNumber(i,'export_type')
		ls_sql_text 	=  lds_export.GetItemString(i,'sql_text')
		if isvalid(w_infodisp) then w_infodisp.st_1.text =  'Export Id:'+string(ll_export_id)+' Modification:' +string(i) +' of '+ string(ll_rowcount) +' Please stand by!'
		
		If isnull(ll_export_id) Or ll_export_id < 1 Then
			if isvalid(w_infodisp) then w_infodisp.wf_step_pbar(1)
			Continue
		End if
		
		//update sql_text
		If isnull(ls_sql_text) or trim(ls_sql_text) = '' Then 
			ln_export_apb.ib_standard = true					//Added By Mark Lee 09/05/2013
			ln_export_apb.of_run_export(ll_export_id, ls_path, ls_prac_sql,ll_export_type, true	) //Modified By Ken.Guo 2016-11-23. added ab_update_sql with True
		End If 
		
		//update the data_view_label and the table_name
		ln_export_apb.of_update_export_data( ll_export_id)
		
		if isvalid(w_infodisp) then w_infodisp.wf_step_pbar(1)
	Next

	If isvalid(ln_export_apb) Then Destroy ln_export_apb
	if isvalid(w_infodisp) then close(w_infodisp)	
End If

If isvalid(lds_export) Then Destroy lds_export


end subroutine

public function integer of_update_export_dddw (long al_view_id, long al_screen_id, string as_dw_syntax);//====================================================================
// Function: of_update_export_dddw
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value    long      al_view_id
// 	value    long      al_screen_id
// 	value    string    as_dw_syntax
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	Mark Lee		Date: 12/19/2013
//--------------------------------------------------------------------
//	Copyright (c) 2008-2013 Contract Logix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
// same funcation in the	appeon_workaround.pbl(w_screenbatchupdate).of_update_export_dddw(al_view,al_screen,ls_dw_syntax)
//pfc_cst_u_contract_data_design.of_update_export_dddw(il_data_view,ii_screen_id,ls_dw_syntax)	
//====================================================================
n_cst_datastore		lds_new
n_ds			lds_export
long			ll_count, ll_cnt,	ll_rtn, i , ll_find, ll_rec_id, ll_auto_sync_field
string 		ls_column_name,	ls_lookup_code_old, ls_field_style_old, ls_lu_field_name_old, ls_dddw_name, ls_tag, ls_ctx_lookup_type, ls_new_lookup_type
string 		ls_displaycolumn, ls_web_visible, ls_view_label, ls_ctx_table_name, ls_label, ls_table_name, ls_dataobject, ls_err, ls_dddw_data
string 		ls_update[], ls_export_rec_id, ls_text, ls_lu_field_name, ls_mask_old, ls_mask


ls_table_name = gnv_data.of_get_table_name(al_screen_id, 'C', 'table_name')
if of_exists_export_table(ls_table_name) = false then 
	return 0
end if 
		
lds_export = create n_ds
lds_export.dataobject = 'ds_screen_design_to_export'			
lds_export.Settransobject(sqlca)

ll_cnt = 0
ls_export_rec_id = ''
if isnull(al_view_id) then al_view_id = 1001

ll_count = lds_export.retrieve(al_view_id,al_screen_id)
if ll_count > 0 then 
	lds_new=create n_cst_datastore
	lds_new.reset()
	ll_rtn=lds_new.create(as_dw_syntax)
	if ll_rtn<>1 then 	
		messagebox("of_update_export_dddw() error:","Create datawindow syntax faile!")
		return -1
	end if		
	lds_new.insertrow(0)
	
	for i = 1 to ll_count				
		ls_column_name 		= lower(lds_export.GetItemString(i, 'export_fields_ctx_column_name'))
		ls_web_visible 			= lds_export.GetItemString(i, 'export_fields_web_visible')
		ls_view_label 			= lds_export.GetItemString(i, 'export_fields_data_view_label')
		ls_ctx_table_name 	= lds_export.GetItemString(i, 'export_fields_ctx_table_name')
//		ls_dataobject 			= lower(lds_export.GetItemString( i, "export_fields_ctx_scrn_dataobject" ))
////		ls_dataobject 			= gnv_data.of_get_table_name(al_screen_id, 'C', 'dataobject')						
		ls_ctx_lookup_type 	= lds_export.GetItemString( i, "export_fields_ctx_lookup_type" )			//Added By Mark 07/08/2014	need update error data.
		ll_rec_id 					= lds_export.GetItemNumber( i, "export_fields_rec_id" )
		
		ls_lookup_code_old	= lds_export.GetItemString(i, 'export_fields_lookup_code')
		ls_field_style_old		= lds_export.GetItemString(i, 'export_fields_lookup_field_style')
		ls_lu_field_name_old	= lds_export.GetItemString(i, 'export_fields_lu_field_name')		
//		ls_mask_old				= lds_export.GetItemString(i, 'export_fields_export_format')			//Added By Mark 06/25/2014
		ll_auto_sync_field 		= lds_export.GetItemNumber(i, 'export_fields_auto_sync_field')		//Added By Mark Lee 02/09/2015
		
		ls_dddw_name 		= lower(lds_new.describe(ls_column_name+".dddw.name") )
		ls_tag 					= lds_new.Describe(ls_column_name + ".tag") 
		ls_displaycolumn 		= lds_new.Describe(ls_column_name + ".dddw.displaycolumn") 
		if upper(ls_field_style_old) = 'C' then //Added By Jay Chen 07-03-2015
			if lower(ls_displaycolumn) = 'compute_code_number' or lower(ls_displaycolumn) = 'compute_description_number' then 
				ls_displaycolumn = 'Code' 
			end if
		end if
		ls_label 					= lds_new.Describe(ls_column_name + "_t.text") 
		ls_dddw_data 			= lower( lds_new.Describe( ls_column_name + ".dddw.datacolumn" ) )
		ls_text 					= lds_new.Describe(ls_column_name + ".CheckBox.On")
			
		if isnull(ls_field_style_old) or trim(ls_field_style_old) = '' then 
			ls_field_style_old = ''
		end if
		if isnull(ls_lookup_code_old) or trim(ls_lookup_code_old) = '' then 
			ls_lookup_code_old = ''
		end if
		if isnull(ls_lu_field_name_old) or trim(ls_lu_field_name_old) = '' then 
			ls_lu_field_name_old = ''
		end if
		
		if isnull(ls_dddw_name) or trim(ls_dddw_name) = '' or ls_dddw_name = '?' or ls_dddw_name = '!' then 
			ls_dddw_name = ''
		end if 
		if isnull(ls_tag) or trim(ls_tag) = '' or ls_tag = '?' or ls_tag = '!' then 
			ls_tag = ''
		end if 
		if isnull(ls_displaycolumn) or trim(ls_displaycolumn) = '' or ls_displaycolumn = '?' or ls_displaycolumn = '!' then 
			ls_displaycolumn = ''
		end if 
		if isnull(ls_label) or trim(ls_label) = '' or ls_label = '?' or ls_label = '!' then 
			ls_label = ''
		end if 
		If isnull(ls_text) or ls_text = '?' or ls_text = '!' or trim(ls_text) = ''  then 
			ls_text =''
		End If

		if len(trim(ls_dddw_name)) > 0  then
			if (ls_column_name = 'app_facility'  and ls_dddw_name = 'dddw_contact_company_new' ) or ls_dddw_name = 'd_dddw_company_list' or &
					ls_dddw_name = 'd_dddw_company' then 
				ls_dddw_name = 'P'
				ls_displaycolumn= 'facility_name'
			elseif ls_dddw_name = 'd_dddw_users' then 
				ls_dddw_name = 'U'
				ls_displaycolumn= 'user_id'
			elseif ls_column_name = 'country'  and ls_dddw_name = 'd_code_lookup_country' then 
				ls_dddw_name = 'C'	
				ls_tag = 'Country'
			else
				if len(ls_tag) > 0 then
					ls_dddw_name = 'C'				
//					ls_displaycolumn= 'code'						//don't need it, use the user's define.
				end if
			end if 
		else
			If( len(ls_text) > 0) Then		//checkbox
				ls_dddw_name = 'B'
				ls_tag = lds_new.Describe(ls_column_name + ".CheckBox.On") + ':'+ &
					lds_new.Describe(ls_column_name + ".CheckBox.Off")+";"+lds_new.Describe(ls_column_name + ".checkbox.text")
			Else
				ls_tag = ''
			End If		
			ls_displaycolumn = ''
		end if 
		
		//copy from w_export_painter.tab_1.tabpage_field_data.dw_detail.ue_column_check()
		/////////////////////////////////////////////////////////////////////////////
//		If ( ls_dataobject = 'd_contract_det_contact_external' or ls_dataobject = 'd_contract_det_contact_contact' or ls_dataobject = 'd_contract_det_contact_contact_notes') And ls_column_name = 'contact_id' Then
//			ls_new_lookup_type = 'contact_id'
//		elseif ls_dataobject = 'd_profile_header' and ls_column_name = 'ctx_req_profile_id' then
//			ls_new_lookup_type = ls_column_name
//		elseif ls_dataobject = 'd_contract_group_linked_locations' and ls_column_name = 'loc_id' then
//			ls_new_lookup_type = ls_column_name
//		elseif ls_dataobject = "d_contract_multi_group_browse" and ls_column_name = "parent_comp_id" then
//			ls_new_lookup_type = ls_column_name
//		Else
//			ls_new_lookup_type = ls_column_name
//			if isnull(ls_new_lookup_type) then ls_new_lookup_type = ''
//			if len(trim(ls_dddw_name)) > 0  then
//				//copy from w_export_painter.tab_1.tabpage_field_data.dw_detail.ue_generate_dddw()
////				If ls_dataobject = 'd_contract_det_contact_external' Then
////					choose case ls_column_name
////						case 'association'
////							ls_new_lookup_type = 'C'
////						case 'facility_id'
////							ls_new_lookup_type = 'P'
////						case 'association2','association3','association4','association5','association6','association7','association8','association9','association10'
////							ls_new_lookup_type = 'C'
////					end choose 
////				else
//					if not isnull(ls_dddw_data) and ls_dddw_data = 'lookup_code' then
//						ls_new_lookup_type = 'C'
//					elseif  not isnull(ls_dddw_data) and ls_dddw_data = 'facility_id' and ls_dddw_name = 'P' and ls_column_name <> 'app_facility'   then
//						ls_new_lookup_type = 'P'
//					end if 
////				end if 
//			End If
//		End If
//		
//		if ls_new_lookup_type = '?' or ls_new_lookup_type = '!' then
//			setnull(ls_new_lookup_type)
//		elseif ls_new_lookup_type = "lookup_code" or ls_new_lookup_type = "C" then
//			ls_new_lookup_type = 'C'
//		elseif ls_new_lookup_type = "P" then
//			ls_new_lookup_type = "P"
//		elseif ls_new_lookup_type = 'facility_id'  Then
//			ls_new_lookup_type = 'C'
//		elseif ls_new_lookup_type = 'contact_id' Then
//			ls_new_lookup_type = 'C'
//		elseif ls_new_lookup_type = 'ctx_req_profile_id' then	
//			ls_new_lookup_type = 'R'
//		elseif ls_new_lookup_type = "loc_id" then
//			ls_new_lookup_type = 'L'
//		elseif ls_new_lookup_type = "parent_comp_id" then	
//			ls_new_lookup_type = 'M'			
//		else
//			setnull(ls_new_lookup_type)
//		end if
//		/////////////////////////////////////////////////////////////////////////////
		
		if isnull(ls_ctx_table_name) or trim(ls_ctx_table_name) = '' or (not isnull(ls_table_name) and ls_ctx_table_name  <> ls_table_name ) then 
			lds_export.SetItem(i,'export_fields_ctx_table_name', ls_table_name)			
		end if 
		
		// view label auto setting			
		if (isnull(ls_view_label) or trim(ls_view_label) = '' ) and  len(ls_label) > 0 then
			lds_export.SetItem(i,'export_fields_data_view_label', ls_label)			
		end if 
		
//		//	editmask.mask auto setting	
//		ls_mask 	=lds_new.Describe(ls_column_name + ".editmask.mask")
//		If isnull(ls_mask) or ls_mask = '?' or ls_mask = '!' or trim(ls_mask) = '' or lower(ls_mask) = lower('None') & 
//			or lower(ls_mask) = lower('use text') or lower(ls_mask) = lower('[general]') 	then 
//			ls_mask ='None'
//		End If		
//		If isnull(ls_mask_old) or ls_mask_old = '?' or ls_mask_old = '!' or trim(ls_mask_old) = '' or lower(ls_mask_old) = lower('None') & 
//			or lower(ls_mask_old) = lower('use text') or lower(ls_mask_old) = lower('[general]') 	then 
//			ls_mask_old ='None'
//		End If	
//		if lower(ls_mask_old) <> lower(ls_mask ) then 
//			lds_export.setitem( i, 'export_fields_export_format', ls_mask)
//		end if 
		
		if lower(ls_dddw_name) <> lower(ls_field_style_old ) then 
			lds_export.SetItem(i,'export_fields_lookup_field_style', ls_dddw_name)
		end if
		
		if (isnull(ls_lu_field_name_old) or trim(ls_lu_field_name_old) = '' or ls_lu_field_name_old <>  ls_displaycolumn) and trim(ls_dddw_name) <> ""  and ls_dddw_name <> "B" then			
//		if lower(ls_displaycolumn) <> lower(ls_lu_field_name_old ) and trim(ls_dddw_name) <> "" and ls_dddw_name <> "B" then 
			//Added By Mark Lee 02/09/2015
			if not isnull(ll_auto_sync_field) and ll_auto_sync_field = 1 and not isnull(ls_lu_field_name_old) and trim(ls_lu_field_name_old) <> "" and not isnull(ls_displaycolumn) and trim(ls_displaycolumn) <> ""  then 
				//
			else			
				lds_export.SetItem(i,'export_fields_lu_field_name', ls_displaycolumn)		
			end if 
		end if
		
		if lower(ls_tag) <> lower(ls_lookup_code_old ) then 
			lds_export.SetItem(i,'export_fields_lookup_code', ls_tag)			
		end if

//		//Added By Mark 07/08/2014 need update dirty data
//		if (isnull(ls_ctx_lookup_type) and  not isnull(ls_new_lookup_type) ) or (not isnull(ls_ctx_lookup_type) and  isnull(ls_new_lookup_type) ) or &
//		(not isnull(ls_ctx_lookup_type) and  not isnull(ls_new_lookup_type) and ls_ctx_lookup_type <> ls_new_lookup_type ) then 
//			lds_export.SetItem(i,'export_fields_ctx_lookup_type', ls_new_lookup_type)		
//		end if 

		//Added By Mark 07/09/2014	dirty data setting.
		if not( isnull(ls_displaycolumn) or trim(ls_displaycolumn) = '' )then 
			if (isnull(ls_ctx_lookup_type) or trim(ls_ctx_lookup_type) = "")  and ls_dddw_name = 'C'  then 
				ls_new_lookup_type = "C"
				lds_export.SetItem(i,'export_fields_ctx_lookup_type', ls_new_lookup_type)		
			else  //Added By Jay Chen 11-30-2015 need update ctx_lookup_type from old value to new value 
				lds_export.SetItem(i,'export_fields_ctx_lookup_type', ls_dddw_name)
			end if 
		end if 

		ls_export_rec_id = ls_export_rec_id + string(ll_rec_id)+','
	next 
		
	destroy lds_new
end if 

if lds_export.modifiedcount() > 0 then 
	if right(ls_export_rec_id,1) =',' then
		ls_export_rec_id = left(ls_export_rec_id, len(ls_export_rec_id) - 1 )	
		ll_cnt ++  
		ls_update[ll_cnt] =  " update request_form set request_form.user_id = '"+gs_user_id+"' , request_form.modify_date = getdate() " + & 
				" from request_form,request_form_detail, export_header where request_form.request_id =  request_form_detail.request_id " + &
				" and request_form_detail.rec_id in ( " + ls_export_rec_id + ")  and request_form.export_id = export_header.export_id " + & 
				" and export_header.view_id = "+string(al_view_id)+" ; "
		gnv_string.of_execute_sql( ls_update, 'update the request_form table', 'update the last date ', false)		
	end if 
	
	ll_rtn	=	lds_export.update(true,true)
end if 
destroy lds_export

return 1
end function

public function integer of_export_data_with_text_ctx (integer ai_export_id, long al_ctx_ids[], ref string as_path, integer ai_save_data, string as_param1, string as_param2, string as_param3, integer ai_type, string as_sql, boolean abn_update_sqltext, boolean abn_validate_field_sql);//====================================================================
// Function: of_export_data_with_text_ctx
//--------------------------------------------------------------------
//	Description: The code copy from of_export_data_with_text_ctx() funcation.
//					Add param abn_validate_field_sql for validate the export column sql syntax.
//--------------------------------------------------------------------
// Arguments:
// 	value        integer    ai_export_id
// 	value        long       al_ctx_ids[]
// 	reference    string     as_path
// 	value        integer    ai_save_data
// 	value        string     as_param1
// 	value        string     as_param2
// 	value        string     as_param3
// 	value        integer    ai_type
// 	value        string     as_sql
// 	value        boolean    abn_update_sqltext
// 	value        boolean    abn_validate_field_sql
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	Jay Chen		Date: 07-09-2014
//--------------------------------------------------------------------
//	Copyright (c) 2008-2013 ContractLogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

//<optimization> by Andy 07/12/2007
SetPointer( HourGlass! )
ib_writefile = false //added by gavins 20121011
If IsNull(as_path) Or as_path = "" Then
	MessageBox("Data Error", "There is no save path for this file. Unable to continue this function.")
	Return 0
End If

If ai_export_id < 1 Then
	//MessageBox("User Error", "No export selected.  Unable to continue this function.")
	MessageBox("User Error", "No export selected.  Unable to proceed.")
	Return 0
End If

Open(w_export_progress)
if abn_update_sqltext = true  then 
	gnv_Status_Info.of_display("Updating the export syntax...")
end if 

//Added By Jay Chen 07-09-2014
if abn_validate_field_sql then 
	gnv_Status_Info.of_display("Validating export setting...")
end if
//end add

yield()	//				//Added By Mark Lee 09/30/2013 APB bug.

//Start code changes 2.6.2007 Henry
If is_called_type = '1' Then
	w_export_progress.Title = 'Merge Data Process'
	is_called_type = '0'
ElseIf is_called_type = '2' Then // Rodger wu Added.
	w_export_progress.Title = 'Merge Data Process'
	w_export_progress.st_6.Text = "Progress of building data"
	
	w_export_progress.st_merge.Visible = True
	w_export_progress.hpb_1.Visible = True
	//	w_export_progress.height = 1100
End If
//End code change 2.6.2007

w_export_progress.st_progress.Text = "Creating export table"

If of_create_export_table( ai_export_id,ai_save_data ) < 0 Then
	gnv_debug.of_output(true, 'Alarm Replace Export:of_create_export_table<0' + ' ai_export_id=' + string( ai_export_id ) + ' ai_save_data=' + string( ai_save_data ) )//added by gavins 20120912
	Close(w_export_progress)
	Return 0
End If

//Boolean lb_table_found
//Long ll_fld_val
Long   li_prac_id_cnt,  g, w, sd, i,n,p

Long ll_find_no,  ll_rowcount2, ll_find,li_rec_no, li_file_num,li_fld_cnt,li_act_format
Long li_fld_len, li_use_link, li_recd_no, li_width, f, li_dif,  li_save_data = 0, ud, col
DateTime ldt_date, ldt_value //maha
String ls_lookup_type, ls_db_lookup_type, ls_lookup_code ,ls_pad, ls_fixed_width//ls_trail_val, ls_trail_record, 
String Errors, ls_export_record, ls_export_field, ls_fld_type, ls_fld_delim//ls_hdr_val, ls_hdr_record, 
String ls_fld_val, ls_lead_trail_char, ls_format, ls_table_name//, ls_table_new, ls_table_names[]
String ls_sql_syntax, ls_field_name, ls_grey, ls_presentation_str, ls_dwsyntax_str, ls_value, ls_data_value
String ls_field_format, ls_sql, ls_save_format, ls_path //ls_month, ls_year, ls_day, ls_hour, ls_minute, 
Long li_exp_type
String ls_header, ls_filter, ls_lookup, ls_datatype, ls_prac_ids = "", ls_select_field, ls_prac_field
String ls_select_table_trim, ls_select_table, ls_sny_retrieve, ls_find, ls_delim_value, ls_rec_delim, ls_lu_field
String  ls_export_text_file = "", ls_lookup_val, ls_save_path, stax, s //maha
String ls_aggre, ls_sort, ls_dc_field,  ls_text, ls_def_val
Long ll_prac_row, ll_ret_cnt
n_ds lds_export_hdr, lds_export_flds, lds_export_retrieve, lds_export_data, lds_code_lookup, lds_address_lookup
n_ds lds_dataobject , lds_export_equiv_code
String ls_tempstr, ls_dddwdata, ls_dddwtable, ls_select_field_ctx, ls_dddw_column_dbname //ls_dataobject, 
datawindowchild ldwc_dddw
String ls_linkfromcol, ls_linktotable, ls_linktocol
datastore lds_linkto
string ls_ic_link_area
long ll_ctx_link_scrn_id
string ls_datatype_ctx
string ls_dddwname
string ls_name
string ls_sqlerrtext,ls_parsesql,ls_parseoff,ls_export_name,ls_message_err //Added By Jay Chen 07-09-2014
long ll_err_column_row,ll_pos_select
string ls_style,ls_display_field
string ls_temp

//<add> andy 07/12/2007
n_ds      lds_field,lds_export_dataTemp
String    ls_ComputerDataType,ls_Expresstion,ls_Field,ls_FieldDataType,ls_Modify,ls_Err,ls_tag
n_cst_string lnvo_string
Long      ll_Cnt,ll_Num,ll_Tab,ll_Start = 1,ll_pos1,ll_pos2,ll_pos3,ll_SpID
String ls_Objects,ls_objname,ls_ObjType,ls_ColType,ls_OrderBy,ls_UnionSQL = "",ls_SqlSelect,ls_flddelimList[]
Boolean lb_flagpk,lb_true = False,lb_mulsel = False //lb_flag = true,
Long    ll_FieldSeqID = 0,ll_FieldCnt,ll_export_code,ll_equivcode,ll_pracid,ll_LastPos
Long ll_FieldSeqIDold = -1,ll_R = 0,ll_i = 1,ll_j,ll_k,ll_n,ll_pkcnt,ll_Rcnt,li_sub_start,li_custom_save
String  ls_tablelist[],ls_fieldlist[],ls_selectfieldlist[],ls_formatList[]
Long li_recdnoList[],ll_exportcodeList[],li_substartList[],li_widthList[],ll_ctx_scrn_id
Long li_udList[],ll_pos,li_act_formatList[],li_bar_ticks,li_widthtemp,ll_maxwidth,ll_len
String  ls_defvalList[],ls_textList[],ls_prac_sql,ls_ic_area,ls_lu_fieldList[]
str_pass lstr_pass
//<add> 08/08/2007 by: Andy
String ls_prac_sql_temp,ls_Sortsel,ls_prac_sql_temp2,ls_top = "top 2147483647",ls_usetable = ""
//<add> 08/16/2007 by: Andy
datastore lds_tablepk
String  ls_tablepks[],ls_table[],ls_tablepk,ls_sortpk[],ls_save_name,ls_strip_char,ls_dbtype
String  ls_RowNo = "",ls_RowNoSyn = "",ls_tabletemp,ls_synprefix = "",ls_MySQL
//end of add
Boolean lb_export // Andy 03202008
//Start add by jervis 
Boolean lb_get_parent
string ls_syn_parent
string ls_select_table_on
string ls_lu_codename
string ls_field_value
string ls_other_where
string ls_ctx_table
string ls_link_table
string ls_link_table_on
string ls_no_link_on
boolean lb_write_log = true
//End by jervis
n_ds  lds_Multi_Fields  //added by gavins  20160322
Long	ll_View_ID, ll_Screen_ID
Long ll_FRow
Boolean lb_doc_action  //Added by Harry 2017-04-17 for task747
String ls_otherfilter  //Added by Harry 2017-04-17 for task747
//Added by Harry 2017-04-17 for task747
String ls_exp_selected_doc 
ls_exp_selected_doc = gnv_data.of_getitem("icred_settings","export_cur_selected_doc",false)
if isnull(ls_exp_selected_doc) or ls_exp_selected_doc = '' then ls_exp_selected_doc = '0'

ldt_date = DateTime(Today(),Now()) //maha
//<add> 08/23/2007 by: Andy
ls_dbtype = of_get_dbtype()
If Upper(ls_dbtype) = 'SQL2005' Or Upper(ls_dbtype) = 'ASA9' Then
	ls_RowNo = ",Row_No"
	lb_true = True
End If

ls_synprefix = "select ctx_id,FieldSeqID,field_value,field_data_type" + ls_RowNo + " from ("

//Added By Jay Chen 07-09-2014
select export_name into :ls_export_name from export_header where export_id = :ai_export_id;
ls_export_name =  ls_export_name +" (#"+string( ai_export_id )+")"
//end

//<add> 08/14/2007 by: Andy 
//Reason: Bubble sort the al_ctx_ids array.
If ai_type = 2 Then
	of_bubblesort(al_ctx_ids)
End If


li_prac_id_cnt = UpperBound( al_ctx_ids[] )

//<add> 08/16/2007 by: Andy
lds_tablepk = Create datastore
If Left(Upper(ls_dbtype),3) = 'ASA' Then
	lds_tablepk.DataObject = "d_export_tablepk_asa_ctx"
	ls_top = ""
Else
	lds_tablepk.DataObject = "d_export_tablepk_sql_ctx"
End If
lds_tablepk.SetTransObject( SQLCA )
//end of add


//<add> andy 2007.05.25
lds_field = Create n_ds
lds_field.DataObject = "d_export_fields"
lds_field.of_SetTransObject( SQLCA )

lds_code_lookup = Create n_ds
lds_code_lookup.DataObject = "d_code_lookup"
lds_code_lookup.of_SetTransObject( SQLCA )

lds_address_lookup = Create n_ds
lds_address_lookup.DataObject = "d_address_lookup"
lds_address_lookup.of_SetTransObject( SQLCA )

lds_export_hdr = Create n_ds
lds_export_hdr.DataObject = "d_export_hdr"
lds_export_hdr.of_SetTransObject( SQLCA )

lds_export_flds = Create n_ds
lds_export_flds.DataObject = "d_export_flds_list_exp_ctx"
lds_export_flds.of_SetTransObject( SQLCA )

lds_export_equiv_code = Create n_ds
lds_export_equiv_code.DataObject = "d_export_equiv_code_lds"
lds_export_equiv_code.of_SetTransObject( SQLCA )


lds_export_retrieve = Create n_ds
lds_dataobject = Create n_ds
lds_linkto = Create datastore

lds_Multi_Fields = Create n_ds
lds_Multi_Fields.DataObject =  'd_export_fields_multiselects'
lds_Multi_Fields.of_settransobject( SQLCA)

gnv_appeondb.of_startqueue( )


lds_export_flds.Retrieve( ai_export_id )
//lds_export_equiv_code.Retrieve()
lds_export_equiv_code.Retrieve(ai_export_id)  //Jervis 12.10.2010
lds_export_hdr.Retrieve( ai_export_id )
lds_field.Retrieve( ai_export_id )
lds_Multi_Fields.Retrieve( ) // added by gavins 20160322
gnv_appeondb.of_commitqueue( )

ll_rowcount2 = lds_export_equiv_code.RowCount()

//HEADER INFO
ls_table_name = lds_export_hdr.GetItemString(1,"export_name")
ls_header = lds_export_hdr.GetItemString(1,"field_labels_as_header") //Y or N
ls_format = lds_export_hdr.GetItemString(1,"export_format")
ll_view_id = lds_export_hdr.GetItemNumber( 1, 'view_id' ) //added by gavins 20160322


//add 08/22/2007 by: Andy
ls_strip_char = lds_export_hdr.GetItemString(1,"strip_char")
If IsNull(ls_strip_char) Or Len(ls_strip_char) < 1 Then ls_strip_char = "NONE"
If ls_format = ".csv" Then ls_strip_char = ","
//end of add

//<add> 08/21/2007 by: Andy
li_custom_save = lds_export_hdr.GetItemNumber(1,"custom_save_name")
If IsNull(li_custom_save) Then li_custom_save = 0
//end of add

//-----------Begin Modified by alfee 05.25.2007-----------------------
//<$Reason>If merging data in document manager, agreement template or for email template,
//<$Reason>Then always use text with header format. It's also for performance tunning.
//If is_called_type = "2" Or is_called_type = '3' Then 
If is_called_type = "2" Or is_called_type = '3' Or is_called_type = '4' Then //08.29.2007 Byy Jervis
	ls_format = ".txt"
	ls_header = '1'
End If

//$<modify> 03/20/2008 by: Andy
If ls_format = "export"  Then
	lb_export = True
	ls_format = ".txt"
Else //txt and xls files  files
	lb_export = False
End If

//-----------End Modified ---------------------------------------------

/***********Comment By Jay Chen 08-13-2014***********
If ls_format = ".csv" Then
	If Upper( appeongetclienttype() ) = "WEB" Then
		MessageBox( "ContractLogix", "The file type of CSV is unsupported on WEB.~r~nPlease go to Export painter to modify settings." )
		gnv_debug.of_output(true, 'Alarm  Export:' +"The file type of CSV is unsupported on WEB.~r~nPlease go to Export painter to modify settings." ) //added by gaivns 20120912
		Close(w_export_progress)
		//<add> andy 07/17/2007
		Destroy lds_export_flds
		Destroy lds_export_hdr
		Destroy lds_address_lookup
		Destroy lds_code_lookup
		Destroy lds_export_equiv_code
		Destroy lds_dataobject
		Destroy lds_linkto
		Destroy lds_field
		Destroy lds_tablepk
		//Destroy lds_export_dataTemp
		//end of add
		Return -1
	End If
End If
*********************************************/

li_exp_type = lds_export_hdr.GetItemNumber(1,"export_type")
ls_rec_delim = lds_export_hdr.GetItemString(1,"record_delimiter")
ls_save_path = lds_export_hdr.GetItemString(1,"save_path")

//$<add> 05.07.2008 by Andy
Select Top 1 @@spid Into :ll_SpID From ids;

//Modify 08/08/2007 by: Andy
//specify SQL
If ai_type = 1 Then
	ls_prac_sql  = Trim(as_sql) //trim(lds_export_hdr.getitemstring(1,"prac_sql"))
	If IsNull(ls_prac_sql) Then ls_prac_sql = ''
	If ls_prac_sql <> '' Then
		ll_pos = Pos(ls_prac_sql,";")
		If ll_pos > 0 Then
			ls_prac_sql  = Replace(ls_prac_sql,ll_pos,1,'')
		End If
		ll_len = Len(ls_prac_sql)
		ls_prac_sql_temp = Trim(Mid(ls_prac_sql,7,ll_len))
		If Lower(Left(ls_prac_sql_temp,8)) = 'distinct' Then
			ls_prac_sql_temp2 = Trim(Mid(ls_prac_sql_temp,9,ll_len))
			If Lower(Left(ls_prac_sql_temp2,3)) <> 'top' Then
				//modify 08/14/2007 by: Andy
				//ls_prac_sql = 'select distinct top 2147483647 ' + ls_prac_sql_temp2
				ls_prac_sql = 'select distinct ' + ls_top + ' ' + ls_prac_sql_temp2
			End If
		ElseIf Lower(Left(ls_prac_sql_temp,3)) <> 'top' Then
			//modify 08/14/2007 by: Andy
			//ls_prac_sql = 'select top 2147483647 ' + ls_prac_sql_temp
			ls_prac_sql = 'select ' + ls_top + ' ' + ls_prac_sql_temp
		End If
		
		//$<add> 05.06.2008 by Andy
		//del order by statement. Reason:if ORDER BY items isn't in the select list,then it will get error.
		//ORDER BY items must appear in the select list if the statement contains a UNION operator.
		ll_pos = Pos(Lower(ls_prac_sql)," order ")
		If ll_pos > 0 Then
			ls_prac_sql = Left(ls_prac_sql,ll_pos - 1)
		End If
		//if select more than one field,then add a select statement outside the ls_prac_sql and
		//INSERT the result INTO a table.
		ll_pos = Pos(Lower(ls_prac_sql)," from ")
		ls_prac_sql_temp = Left(ls_prac_sql,ll_pos - 1)
		ll_pos = Pos(ls_prac_sql,",")
		If ll_pos > 0 Then
			lb_mulsel = True
			ls_prac_sql = "select distinct ctx_id," + String(ll_SpID) + " from (" + ls_prac_sql + ") cc order by ctx_id"
			Select Top 1 1 Into :ll_Cnt From sysobjects Where Name = 'export_temp' And Type = 'U';
			If ll_Cnt = 1 Then
				ls_MySQL = "DELETE FROM export_temp WHERE SpID = " + String(ll_SpID) + ";"
			Else
				ls_MySQL = "CREATE TABLE export_temp (prac_id int null,SpID int null)"
			End If
			Execute Immediate :ls_MySQL;
			ls_MySQL = "INSERT INTO export_temp " + ls_prac_sql + ";"
			Execute Immediate :ls_MySQL;
			ls_prac_sql = "select distinct prac_id as ctx_id from export_temp where SpID = " + String(ll_SpID)
		End If
		//end add 05.06.2008
	End If
End If
//end of modify

//set record delimiter
Choose Case ls_rec_delim
	Case "C"
		ls_rec_delim = ","
	Case "R"
		ls_rec_delim = "~r"
	Case "T"
		ls_rec_delim = "	"
	Case "D"
		ls_rec_delim = "~r~r"	
	Case "U"
	Case Else
		ls_rec_delim = ""
End Choose
If IsNull(ls_rec_delim) Then ls_rec_delim = ""

li_fld_cnt = lds_export_flds.RowCount()
//<add> 08/24/2007 by: Andy
ll_maxwidth = Long(lds_export_flds.Describe("evaluate('max(export_field_length)',0)"))
If ll_maxwidth < 30 Then ll_maxwidth = 30

//CREATE SYNTAX FOR export DW
//ls_sql_syntax = "Select * from exp_" + Lower(ls_table_new)
ls_sql_syntax = is_select_syntax
//modify 08/15/2007 by: Andy
ls_presentation_str = "style(type=grid)"

ls_dwsyntax_str = SQLCA.SyntaxFromSQL(ls_sql_syntax, ls_presentation_str, Errors)
If Len(Errors) > 0 Then //this will fail if the table has not been completed
	If Pos(Errors,"Table or view not found",1) > 0 Then
		MessageBox ("Error in of_export_data_with_text","Export data data store not able to be created.~rCheck to make sure no export fields have any spaces, and that all have a width.  You cannot have duplicate field names, and fields cannot start with a number." )
		Close(w_export_progress)
		//<add> andy 07/17/2007
		Destroy lds_export_flds
		Destroy lds_export_hdr
		Destroy lds_address_lookup
		Destroy lds_code_lookup
		Destroy lds_export_equiv_code
		Destroy lds_dataobject
		Destroy lds_linkto
		Destroy lds_field
		Destroy lds_tablepk
		if isvalid(lds_Multi_Fields) then Destroy lds_Multi_Fields
		//Destroy lds_export_dataTemp
		//end of add
		Return -1
		
	Else
		MessageBox("Caution", &
			"SyntaxFromSQL caused these errors: " + Errors)
		gnv_debug.of_output(true, 'Caution:' + " SyntaxFromSQL caused these errors: " + Errors)		//Added By Mark Lee 02/01/2013
		Close(w_export_progress)
		//<add> andy 07/17/2007
		Destroy lds_export_flds
		Destroy lds_export_hdr
		Destroy lds_address_lookup
		Destroy lds_code_lookup
		Destroy lds_export_equiv_code
		Destroy lds_dataobject
		Destroy lds_linkto
		Destroy lds_field
		Destroy lds_tablepk
		if isvalid(lds_Multi_Fields) then Destroy lds_Multi_Fields
		//Destroy lds_export_dataTemp
		//end of add
		Return -1
	End If
	gnv_debug.of_output(true, 'Alarm  Export:SyntaxFromSQL errors:' +  Errors ) //added by gaivns 20120912
End If
lds_export_data = Create n_ds
lds_export_data.Create( ls_dwsyntax_str, Errors)
If len( errors ) > 0 Then
	gnv_debug.of_output(true, 'Alarm  Export:lds_export_data create errors:' +  Errors ) //added by gaivns 20120912	
End If
lds_export_data.SetTransObject( SQLCA )

//<add> andy 2007.05.25 
//save the original data that it's not format,in order to deal with the computer fields
lds_export_dataTemp = Create n_ds
lds_export_dataTemp.Create( ls_dwsyntax_str, Errors )
lds_export_dataTemp.SetTransObject( SQLCA )
//end of add

//w_export_progress.r_bar.Width = 300
w_export_progress.hpb_bar.Position = 10

w_export_progress.st_progress.Text = "Populating Data for " + String(li_prac_id_cnt) + " Contract(s)"

//li_bar_ticks = 80 / li_fld_cnt

//creates string of prac_ids for querys
//between...and...
If ai_type = 3 Then
	//if ls_prac_sql = '' then
	If li_prac_id_cnt > 0 Then
		ls_prac_ids = "between " + String(al_ctx_ids[1]) + " and " + String(al_ctx_ids[li_prac_id_cnt])
	End If
	//end if
End If

//$<modify> 05.05.2008 by Andy
//create rows for all practitioner data
For i = 1 To li_prac_id_cnt
	//specify array
	If ai_type = 2 Then
		ls_prac_ids = ls_prac_ids + String( al_ctx_ids[i] ) + ","
	End If
	g = lds_export_data.InsertRow(0)
Next
If ai_type = 2 Then
	ls_prac_ids = Left( ls_prac_ids, Len( ls_prac_ids ) -1 ) //remove last comma
End If

//Added By Ken.Guo 2011-07-21. 
Boolean lb_usingdb = False
String ls_client_id
Long ll_arr_temp[]
n_cst_string lnv_string
//ll_arr_temp[] = al_ctx_ids[]
If li_prac_id_cnt >= 100 Then
	lb_usingdb = True
	//lnv_string.of_delete_duplicate(ll_arr_temp[])
	If inv_arr_db.of_array_to_db( al_ctx_ids[],ls_client_id ) < 0 Then
		is_client_id[UpperBound(is_client_id[]) + 1 ] = ls_client_id
		if isvalid(w_export_progress) then close(w_export_progress)
		of_cleanup_ds( )	
		lb_usingdb = False
		gnv_debug.of_output( True, 'Export data with text error, Failed to insert array to DB.')
		Messagebox('Export Error','Failed to insert array data to DB.')
	End If
End If

//if ai_save_data = 1 or ai_save_data = 3 then
If ai_save_data = 1 Or ai_save_data = 3  Or ib_gen_rec_id Then //for Date Alarm - Alfee 06.11.2008
	lds_export_data.Object.rec_id.Primary[] = al_ctx_ids[]
End If
lds_export_data.RowsCopy( 1, lds_export_data.RowCount(), Primary!, lds_export_dataTemp, 1, Primary! )
//end modify 05.05.2008



//w_export_progress.r_bar.Width = w_export_progress.r_bar.Width + 50
w_export_progress.hpb_bar.Position = 11
w_export_progress.st_export.Text = "Form SQL Statement"

//Modify 08/22/2007 by: Andy
//n = int(li_prac_id_cnt/80) + 1
n = Int(li_fld_cnt/80) + 1
//end of modify


For p = 1 To li_fld_cnt
	lds_dataobject.DataObject = lds_export_flds.GetItemString( p, "export_fields_ctx_scrn_dataobject" )
	ll_Screen_ID = lds_export_flds.GetItemNumber( p, 'export_fields_ctx_scrn_id' )	//added by gavins 20160322
	
	li_width = lds_export_flds.GetItemNumber(p,"export_field_length")
	ls_field_format = lds_export_flds.GetItemString(p,"export_format")
	
	//Added By Jay Chen 03-19-2014
	ls_name = lds_export_flds.GetItemString(p,"export_field_name")
//	if is_get_export_field = '1' and ids_document_export_field.rowcount() > 0  then
//		ll_find = ids_document_export_field.find("lower(export_field) = '"+lower(ls_name)+"'",1, ids_document_export_field.rowcount())
//		if isnull( ll_find) then ll_find = 0
//		if ll_find < 1 then continue
//	end if
	//End add
	
	ls_data_value = ""
	ls_value = ""
	ls_lookup_val = ""
	//ls_dc_field = "none"
	//<add> 08/21/2007 by: Andy
	li_sub_start =  0
	//end of add
	ls_dddwtable = ""
	
	lb_get_parent = false
	ls_syn_parent = ""
	ls_select_table_on = ""
	ls_lu_codename = ""
	ls_field_value = ""
	ls_other_where = ""
	ls_no_link_on = ""

	ud = lds_export_flds.GetItemNumber( p, "use_default" )
	If ud = 1 Or ud = 2  Or ud = 4 Then //modified by gavin ud= 4 20151112
		ls_def_val = lds_export_flds.GetItemString( p, "default_value" )
		If trim(lower(ls_def_val)) = 'today'  and ud= 4 Then ls_def_val = string( today() )
	Else
		ls_def_val = ""
	End If
	
	//Get Parent Level Data
	if lds_export_flds.GetItemString( p,"record_level") = 'P' then lb_get_parent = true
	
	if lb_get_parent then
		ls_syn_parent = "ctx_basic_info table_1 left join ctx_basic_info table_2 on (table_1.master_contract_id = table_2.ctx_id ) left join "
	end if
	
	//Add by jervis -- 01.18.2010
	//Leading Padding or Trailing Padding Process
	ls_fld_delim = lds_export_flds.GetItemString( p, "trailing_leading_characters")
	Choose Case ls_fld_delim
		Case "R" //return
			ls_fld_delim = "~r"
		Case "T" //tab
			ls_fld_delim = "	"
		Case "D" //double return
			ls_fld_delim = "~r~r"
		Case "S" // space
			ls_fld_delim = " "
		Case "E" //empty string
			ls_fld_delim = ""
	End Choose
	
	//hard coded text
	If lds_export_flds.GetItemNumber(p,"export_type") = 2 Then //set data for text fields
		ls_select_field = lds_export_flds.GetItemString(p,"export_field_name")
		ls_value = lds_export_flds.GetItemString(p,"field_value")
		
		If IsNull(ls_value) Then ls_value = ""
		
		If ls_value = "&TODAY&" Then
			//<modify> 08/28/2007 by: Andy Reason:Support user-defined format.
			//ls_value = of_date_format(ls_field_format,ldt_date) //maha 070705 factored
			ls_value = String(ldt_date,"yyyy-mm-dd hh:mm")
			of_data_format(ls_field_format,'D',ls_value)
			//end of modify
		End If
		//Start Code Change ---- 11.03.2005 #21 maha  for prompt values
		String ls_ptype
		Choose Case Upper(ls_value)
			Case "&PROMPT1&"
				ls_ptype = lds_export_hdr.GetItemString(1,"prompt_type1")
				ls_value = of_prompt_populate( ls_ptype, as_param1)
			Case "&PROMPT2&"
				ls_ptype = lds_export_hdr.GetItemString(1,"prompt_type2")
				ls_value = of_prompt_populate( ls_ptype, as_param2)
			Case "&PROMPT3&"
				ls_ptype = lds_export_hdr.GetItemString(1,"prompt_type3")
				ls_value = of_prompt_populate( ls_ptype, as_param3)
		End Choose
		If	ls_ptype = 'D' Then
			ldt_date = DateTime(Date(ls_value),Now())
			//<modify> 08/28/2007 by: Andy Reason:Support user-defined format.
			//ls_value = of_date_format(ls_field_format,ldt_date)
			ls_value = String(ldt_date,"yyyy-mm-dd hh:mm")
			of_data_format(ls_field_format,'D',ls_value)
			//end of modify
		End If
		
		//End Code Change---11.03.2005
		
		//<add> 08/27/2007 by: Andy
		li_sub_start = lds_export_flds.GetItemNumber(p,"export_fields_substring_start")
		If li_sub_start > 1 Then ls_value = Mid(ls_value,li_sub_start,li_width)
		ls_value = Mid(ls_value,1,li_width) //shrink the length to size 
		//end of add
		
		
		If ls_field_format = "Leading Padding" Or ls_field_format = "Trailing Padding" Then
			If li_width - Len(ls_value) > 0 Then
				li_dif = li_width - Len(ls_value)
				ls_pad = "" //reset
				ls_pad = Fill ( ls_fld_delim, li_dif )
				If ls_field_format = "Leading Padding" Then
					ls_value = ls_pad + ls_value
				Else
					ls_value = ls_value + ls_pad
				End If
			End If
		End If
		
		
		For i = 1 To li_prac_id_cnt
			lds_export_data.SetItem(i,p,ls_value)
			lds_export_dataTemp.SetItem(i,p,ls_value) //<add> andy 2007.05.25 
		Next
		//<Modify> andy 2007.05.25
		//Else //get FIELDS DATA //comment by andy 
	ElseIf lds_export_flds.GetItemNumber(p,"export_type") = 1 Then //get FIELDS DATA
		
		ll_ctx_scrn_id = lds_export_flds.GetItemNumber(p,"export_fields_ctx_scrn_id") //Add by Jack 06/05/2007
		If ll_ctx_scrn_id = 6 Then
			ls_ic_area = "E"
		ElseIf ll_ctx_scrn_id = 7 Then
			ls_ic_area = "I"
		elseif ll_ctx_scrn_id = 14 or ll_ctx_scrn_id = 17 then //add other contact -- jervis 03.28.2011
			ls_ic_area = "C"
		End If
		
		//end of modify	
		//CREATE SYNTAX FOR each retrieve DW
		ls_export_field = lds_export_flds.GetItemString(p,"export_field_name")
		//<add> 08/24/2007 by: Andy
		of_replacespecchar(ls_export_field)
		//end of add
		ls_select_field_ctx = Trim( lds_export_flds.GetItemString( p, "db_field_name" ) )
		
		
		Choose Case ls_select_field_ctx
			Case "app_facility"
				ls_tempstr = 'ctx_basic_info.app_facility'
				ls_select_table = f_get_token( ls_tempstr, "." )
				ls_select_field = ls_tempstr
			Case "compute_1"
				ls_select_table = 'ctx_contract_contacts'
				ls_select_field = "compute_1"
			Case "contact_phone"
				ls_select_table = 'ctx_contract_contacts'
				ls_select_field = 'contact_phone'
			Case "contact_email"
				if ll_ctx_scrn_id <> 2002 then //jervis 03.28.2011
					ls_select_table = 'ctx_contract_contacts'
					ls_select_field = 'contact_email'
				else
					ls_select_table = 'ctx_contacts_numbers'
					ls_select_field = 'contact_email'
				end if
			Case Else
				ls_tempstr = lds_dataobject.Describe( ls_select_field_ctx + ".dbname" )
				if pos(ls_tempstr,".") > 0 then	//IF Exists Table Selection - jervis 03.17.2009
					ls_select_table = f_get_token( ls_tempstr, "." )
				else
					if ll_ctx_scrn_id = 56 then //Added By Jay Chen 03-11-2014 Remark: add external dddw fields for document browse 
						ls_select_table = "ctx_am_document"
					else
						ls_select_table = ""
					end if
				end if 
				if ll_ctx_scrn_id = 56 then //Added By Jay Chen 03-11-2014 Remark: add external dddw fields for document browse 
					ls_select_field = lds_dataobject.Describe( ls_select_field_ctx + ".name" )
				else
					ls_select_field = ls_tempstr
				end if
//				ls_select_field = ls_tempstr
				
				if ll_ctx_scrn_id = 12 then //Export Requirement Profile Detail-- jervis 03.17.2009
					ls_select_table = 'ctx_elements'
				elseif ll_ctx_scrn_id = 2004 then
					ls_select_table = 'sys_statusaudit'	//Export Contract Status tract - jervis 03.20.2009
				elseif (ll_ctx_scrn_id = 6 or ll_ctx_scrn_id = 7) and ls_select_field = "facility_id" then
					ls_select_table = 'ctx_contract_contacts'  //Export comany info with contact - jervis 01.30.2011
				ElseIf ll_ctx_scrn_id = 22 Then
					ls_select_table = 'ctx_orgs_contact'//added by gavins 20130314	
				ElseIf (ll_ctx_scrn_id = 33 or ll_ctx_scrn_id = 42) and (ls_select_field = 'letter_to_name' or ls_select_field = 'letter_from_name' )Then  //Added By Ken.Guo 2017-08-02
					ls_select_table = 'ctx_action_items'
				end if
				   
				
		End Choose

		//---------Begin Added by Harry 2017-04-17 for task747
		ls_otherfilter = ""
		lb_doc_action = false
		if ls_exp_selected_doc = '1' then
			if istr_action_item.module = '04' then
				if ls_select_table = 'ctx_am_document' then
					if not isnull(istr_action_item.doc_id) and istr_action_item.doc_id > 0 then
						ls_otherfilter += " and " + ls_select_table + ".doc_id = " + string(istr_action_item.doc_id)
						lb_doc_action = true
					end if
				end if
			end if
		end if
		//---------End Added ------------------------------------------------------
		
		li_use_link = lds_export_flds.GetItemNumber(p,"export_fields_ctx_uselink")
		If IsNull( li_use_link ) Then li_use_link = 0
		
		
		
		//ls_fld_delim = lds_export_flds.GetItemString( p, "trailing_leading_characters")
		li_recd_no = lds_export_flds.GetItemNumber(p,"intcred_record_number")
		if lb_doc_action and li_recd_no > 1 then li_recd_no = 1  //Added by Harry 2017-04-17 for task747
		//<add> 07/06/2007 by: Andy
		ll_FieldSeqID ++
		ll_export_code = lds_export_flds.GetItemNumber( p, "export_code" )
		
		//end of add	
		ls_lu_field = lds_export_flds.GetItemString( p, "lu_field_name" )
		ls_aggre = lds_export_flds.GetItemString( p, "aggre_function" )
		ls_sort = lds_export_flds.GetItemString( p, "sort_by" )
		//<add> 08/09/2007 by: Andy
		ls_Sortsel = ls_sort
		If IsNull(ls_Sortsel) Then ls_Sortsel = ''
		If Len(Trim(ls_Sortsel)) > 0 Then
			//$<Modify> 05.13.2008 by Andy
			of_get_sortsel(ls_Sortsel,'ctx_id')
		End If
		//end of add
		li_act_format = lds_export_flds.GetItemNumber(p,"export_fields_active_yesno")
		ls_text = lds_export_flds.GetItemString(p,"field_value") //maha 091305
		If Upper(ls_lu_field) = "LOOKUP CODE" Then ls_lu_field = "lookup_code"
		If IsNull(ls_lu_field) Then ls_lu_field = "code"

		//<add> 08/21/2007 by: Andy
		li_sub_start = lds_export_flds.GetItemNumber(p,"export_fields_substring_start")
		//end of add
		If Pos(ls_select_table,"dba.",1) > 0 Then //maha 122005 
			ls_select_table_trim = Mid(ls_select_table,5) //dropping dba.
			ls_select_table = ls_select_table_trim  //maha 012306
		Else
			ls_select_table_trim = ls_select_table
		End If
		ls_filter = lds_export_flds.GetItemString(p,"filter_query")
		
		
		If IsNull(ls_filter) Or Trim(ls_filter) = "" Then
			ls_filter = ""
		Else
			//<Modify> 07/23/2007 by: Andy 
			//ls_filter = " and  " + ls_filter
			ls_filter = " and  ( " + ls_filter + " )"
			//end of Modify
			
			//Start Code Change ---- 11.03.2005 #24 maha check filter for prompt values and replace
			Long li_pos1
			li_pos1 = Pos(Upper(ls_filter),"PROMPT1",1)
			If li_pos1 > 0 Then
				ls_filter = Mid(ls_filter,1,li_pos1 - 1) + as_param1 + Mid(ls_filter,li_pos1 + 7)
			End If
			li_pos1 = Pos(Upper(ls_filter),"PROMPT2",1)
			If li_pos1 > 0 Then
				ls_filter = Mid(ls_filter,1,li_pos1 - 1) + as_param2 + Mid(ls_filter,li_pos1 + 7)
			End If
			li_pos1 = Pos(Upper(ls_filter),"PROMPT3",1)
			If li_pos1 > 0 Then
				ls_filter = Mid(ls_filter,1,li_pos1 - 1) + as_param3 + Mid(ls_filter,li_pos1 + 7)
			End If
		End If
		//End Code Change---11.03.2005 	
		
		//Replace ls_rec_delim to ls_fld_delim - jervis 12.30.2009
		/*
		//set fields delimiter/pad maha 060105
		Choose Case ls_rec_delim
			Case "R" //return
				ls_rec_delim = "~r"
			Case "T" //tab
				ls_rec_delim = "	"
			Case "D" //double return
				ls_rec_delim = "~r~r"
			Case "S" // space
				ls_rec_delim = " "
			Case "E" //empty string
				ls_rec_delim = ""
		End Choose
		*/
		
		//export_fields_use_link  sql
		If li_use_link = 1 Then
			ls_linkfromcol = Trim( lds_export_flds.GetItemString( p, "export_fields_ctx_linkfromcolumn" ))
			ls_tempstr = lds_dataobject.Describe( ls_linkfromcol + ".dbname" )
			f_get_token( ls_tempstr, "." )
			ls_linkfromcol = ls_tempstr
			
			lds_linkto.DataObject = Trim( lds_export_flds.GetItemString( p, "export_fields_ctx_linktoscrndw" ))
			ls_linktocol = Trim( lds_export_flds.GetItemString( p, "export_fields_ctx_linktocolumn" ))
			ls_tempstr = lds_linkto.Describe( ls_linktocol + ".dbname" )
			ls_linktotable = f_get_token( ls_tempstr, "." )
			ls_linktocol = ls_tempstr
			
			//Contacted contact or our company contact - jervis 01.27.2011
			ll_ctx_link_scrn_id = lds_export_flds.GetItemNumber(p,"export_fields_ctx_linktoscrnid") 
			If ll_ctx_link_scrn_id = 6 Then
				ls_ic_link_area = "E"
			ElseIf ll_ctx_link_scrn_id = 7 Then
				ls_ic_link_area = "I"
			elseif ll_ctx_link_scrn_id = 14 or ll_ctx_link_scrn_id = 17 then  //add other contact -- jervis 03.28.2011
				ls_ic_link_area = "C"
			End If
		End If
		
		ls_tablelist[ll_FieldSeqID] = ls_select_table
		ls_fieldlist[ll_FieldSeqID] = ls_export_field
		li_recdnoList[ll_FieldSeqID] = li_recd_no
		ls_selectfieldlist[ll_FieldSeqID] = ls_select_field
		ls_formatList[ll_FieldSeqID] = ls_field_format
		ll_exportcodeList[ll_FieldSeqID] = ll_export_code
		//<add> 08/21/2007 by: Andy
		li_substartList[ll_FieldSeqID] = li_sub_start
		//end of add
		li_widthList[ll_FieldSeqID] = li_width
		//<add> 07/23/2007 by: Andy
		li_widthtemp = li_width
		If li_widthtemp < 30 Then li_widthtemp = 30
		//end of add
		ls_flddelimList[ll_FieldSeqID] = ls_fld_delim
		li_udList[ll_FieldSeqID] = ud
		ls_defvalList[ll_FieldSeqID] = ls_def_val
		ls_textList[ll_FieldSeqID] = ls_text
		ls_lu_fieldList[ll_FieldSeqID] = ls_lu_field
		
		li_act_formatList[ll_FieldSeqID] = li_act_format

		//If ai_type = 1 Then
		//	ls_use_link_sql = ls_use_link_sql + ", (" + ls_prac_sql + ") bb "
		//End If
		
		//--------------------------- APPEON BEGIN ---------------------------
		//$<modify> 03.19.2007 By: Jack (Export)
		//$<reason> Fix a defect.
		//Modify 08/15/2007 by: Andy
//		if (ll_ctx_scrn_id = 6 or ll_ctx_scrn_id = 7) and ls_select_field = 'facility_id' then
		if (ll_ctx_scrn_id = 6 or ll_ctx_scrn_id = 7) and (ls_select_field = 'facility_id' or lower(ls_select_field_ctx) = 'app_facility_contact' or left(lower(ls_select_field_ctx),20)='app_facility_custom_' or left(lower(ls_select_field_ctx),20)='ctx_contacts_custom_' ) then //Modified By Jay Chen 10-28-2015
			ls_usetable = "ctx_contract_contacts"
		elseIf ls_select_table <> 'app_facility' Then
			If li_use_link = 1 Then
				ls_usetable = Lower(ls_linktotable)
			Else
				ls_usetable = Lower(ls_select_table)
			End If
		Else
			ls_usetable = "ctx_basic_info"
		End If
		
		if lb_get_parent then
			ls_ctx_table = "table_1"
		else
			ls_ctx_table = ls_usetable
		end if
		
		//<ad> 08/16/2007 by: Andy
		ls_tablepk = ""
		If IsNull(ls_sort) Or Trim(ls_sort) = "" Then
			ls_sort = ""
			lb_flagpk = True
			//lb_sortpk = false
			ll_pkcnt = UpperBound(ls_table)
			For ll_n = 1 To ll_pkcnt
				If Lower(ls_usetable) = Lower(ls_table[ll_n]) Then
					ls_tablepk = ls_tablepks[ll_n]
					//ls_sort  = Left(ls_tablepk,len(ls_tablepk) - 2)
					ls_sort = ls_sortpk[ll_n]
					lb_flagpk = False
				End If
			Next
			If lb_flagpk Then
				ll_Rcnt = lds_tablepk.Retrieve( ls_usetable)
				ls_sort = ls_usetable + '.ctx_id, '
				For ll_n = 1 To ll_Rcnt
					If Lower(lds_tablepk.GetItemString( ll_n, "column_name")) = 'ctx_id' Then
						//ls_sort = ls_usetable + '.ctx_id, '
						Continue
					End If
					ls_tablepk += ls_usetable + '.' + lds_tablepk.GetItemString( ll_n, "column_name") + ", "
				Next
				//Modify 08/22/2007 by: Andy
				//ls_sort = ls_tablepk + ls_sort
				ls_sort = ls_sort + ls_tablepk
				//end of modify
				ls_sort  = Left(ls_sort,Len(ls_sort) - 2)
				ls_sortpk[ll_pkcnt + 1] = ls_sort
				ls_table[ll_pkcnt+1] = ls_usetable
				ls_tablepks[ll_pkcnt+1] = ls_tablepk
			End If
			//<add> 08/22/2007 by: Andy
		Else
			If Pos(Lower(ls_sort),'ctx_id') < 1 Then ls_sort = ls_usetable + '.ctx_id, ' + ls_sort
		End If
		
		
		//<add> 08/23/2007 by: Andy
		If Len(ls_aggre) > 0 Then
			ls_sort = ls_sort + " , field_value"
		End If
		If Len(ls_sort) > 0 Then ls_sort = "order by " + ls_sort
		//end of add
		
		//<add> 08/23/2007 by: Andy
		If lb_true Then//SQL2005 and ASA9
			ls_RowNoSyn = ",row_number() over(" + ls_sort+") Row_No"
		End If
		//end of add
		
		
		ls_sny_retrieve = ls_synprefix + "Select " + ls_top + " " + ls_ctx_table + ".ctx_id, " + ls_tablepk + ls_Sortsel + String(ll_FieldSeqID) + " FieldSeqID, "

		ls_db_lookup_type = lds_export_flds.GetItemString( p, "export_fields_ctx_lookup_type" )
		
		if ll_ctx_scrn_id = 2003 and Lower(ls_select_table) = 'app_facility'  and left(lower(ls_select_field_ctx),7)='custom_' then ls_db_lookup_type = ''  //Added By Jay Chen 01-23-2016
		if ll_ctx_scrn_id = 2001 and Lower(ls_select_table) = 'ctx_contacts'  and left(lower(ls_select_field_ctx),7)='custom_' then ls_db_lookup_type = ''  //Added By Jay Chen 01-23-2016
		
		//--------------------------- APPEON BEGIN ---------------------------
		//$<modify> 04.04.2007 By: Jack 
		//$<reason> Fix a defect.
		
		If ls_select_table = 'app_facility' And ls_select_field_ctx = 'state' Then
			ls_dddwdata = ''
		Else
			ls_dddwdata = Lower( lds_dataobject.Describe( ls_select_field_ctx + ".dddw.datacolumn" ) )
		End If
		//---------------------------- APPEON END ----------------------------
		
		If ls_dddwdata <> '?' And ls_dddwdata <> '!' And ls_dddwdata <> '' Then
			ls_tempstr = Lower( lds_dataobject.Describe( ls_select_field_ctx + ".dddw.displaycolumn" ) )
			
			//the edit style has been dynamic change for lookup or company dddw -- jervis 09.22.2011
			ls_dddwname =  Lower( lds_dataobject.Describe( ls_select_field_ctx + ".dddw.name" ) )
			//Added By Mark Lee 03/05/2014 for ll_ctx_scrn_id = 2003
//			if ls_dddwname = 'd_dddw_code_lookup' or ls_dddwname = 'd_dddw_company'  then  
			if ls_dddwname = 'd_dddw_code_lookup' or ls_dddwname = 'd_dddw_company'  or ls_dddwname = 'd_dddw_facility_link'   then  
				ls_dddwdata = ''
			else
				If ls_tempstr <> '?' And ls_tempstr <> '!' And ls_tempstr <> '' Then
					
					If IsNull( ls_db_lookup_type ) Then
						ls_db_lookup_type = "X"
						ls_lu_field = ls_tempstr
						
						lds_dataobject.GetChild( ls_select_field_ctx, ldwc_dddw )
						ls_tempstr = ldwc_dddw.Describe( ls_lu_field + ".dbname" )
						ls_dddwtable = f_get_token( ls_tempstr, "." )
						ls_dddw_column_dbname = ls_tempstr
					End If
				End If
			end if
		End If
		
		
		
		If li_use_link = 1 Then
			//ls_use_link_sql2 = " (" + ls_linktotable + "." + ls_linktocol + " = " + ls_select_table + "." + ls_linkfromcol + ") and "
			if lb_get_parent then
				ls_link_table = ls_linktotable
				ls_link_table_on = " on( table_2.ctx_id = " + ls_linktotable + ".ctx_id) left join "
				if ls_select_table <> "app_facility" then
					ls_no_link_on = " on (table_2.ctx_id = " + Lower(ls_select_table) + ".ctx_id) "
				else
					ls_no_link_on = " on (table_2.ctx_id = " + Lower(ls_usetable) + ".ctx_id) "
				end if
			else
				ls_link_table = ls_linktotable + " left join "
				ls_link_table_on = " "
			end if
			
			ls_select_table_on = " on  (" + ls_linktotable + "." + ls_linktocol + " = " + ls_select_table + "." + ls_linkfromcol + ") "
			
			//Contracted contact or our company contact - jervis 01.27.2011
			//add other contact - jervis 03.28.2011
			If ll_ctx_link_scrn_id = 6 or ll_ctx_link_scrn_id = 7 or ll_ctx_link_scrn_id = 14 or ll_ctx_link_scrn_id = 17 Then
				ls_other_where = " and " + ls_linktotable + ".ic_area ='" + ls_ic_link_area + "' "
			end if
		else
			ls_link_table = " "
			ls_link_table_on = " "
			//Get select table on clause		-- jervis 03.04.2009
			if lb_get_parent then
				if ls_select_table <> "app_facility" then
					ls_select_table_on = " on (table_2.ctx_id = " + Lower(ls_select_table) + ".ctx_id) "
				else
					ls_select_table_on = " on (table_2.ctx_id = " + Lower(ls_usetable) + ".ctx_id) "
				end if
			end if
			ls_no_link_on = ls_select_table_on
			//Get link table on clause		-jervis 03.04.2009
		End If
		
		If ls_select_field = 'app_facility' And Upper(ls_db_lookup_type)  = "C" Then
			ls_datatype = "C"

			//ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),app_facility."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from app_facility," + Lower(ls_select_table) +  ls_use_link_sql + " WHERE " + "(" + Lower(ls_select_table) + "." + ls_select_field + " = app_facility.facility_id) and "
			ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),app_facility."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
									ls_syn_parent + ls_link_table + ls_link_table_on +  Lower(ls_select_table) + ls_select_table_on + " left join app_facility on("+ Lower(ls_select_table) + "." + ls_select_field + " = app_facility.facility_id) "

			ls_select_field  = "app_facility_" + ls_lu_field
		//---------Start code by jervis 06.09.2009-------------
		//Export location data
		
		//Export company info whit contracted conatct or our company contact -- jervis 01.30.2011
		elseif (ll_ctx_scrn_id = 6 or ll_ctx_scrn_id = 7 or ll_ctx_link_scrn_id = 14 or ll_ctx_link_scrn_id = 17) and ls_select_field = 'facility_id' then
			ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),app_facility."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
									ls_syn_parent + ls_link_table + ls_link_table_on +  Lower(ls_select_table) + ls_select_table_on + " left join ctx_contacts on (ctx_contract_contacts.contact_id = ctx_contacts.contact_id) left join app_facility on(ctx_contacts.facility_id = app_facility.facility_id) "

			ls_select_field  = "app_facility_" + ls_lu_field
			
			//if (ll_ctx_scrn_id = 6 or ll_ctx_scrn_id = 7) Then
				ls_other_where = " and ctx_contract_contacts.ic_area = '" +ls_ic_area + "' "
			//end if
		
		 //Added By Ken.Guo 2017-08-02. Support letter_from_name, letter_to_name in Action Item Screen
		elseif  (ll_ctx_scrn_id = 33 or ll_ctx_scrn_id = 42) and (ls_select_field = 'letter_to_name' or ls_select_field = 'letter_from_name' )Then  
			Choose Case ls_select_field
				Case 'letter_from_name'
					If lb_get_parent Then
						ls_sny_retrieve = ls_sny_retrieve + " ISNULL((select last_name +','+first_name from ctx_contacts where contact_id = ctx_action_items.letter_from),   " + &
								"   (SELECT top 1 ctx_contacts.last_name +','+ ctx_contacts.first_name   FROM ctx_contacts,   	ctx_contract_contacts    " + &
								"		WHERE ctx_contract_contacts.contact_id = ctx_contacts.contact_id and  	ctx_contract_contacts.ctx_id = ctx_action_items.ctx_id   AND    " + &
								"		ctx_contract_contacts.ic_area = 'E'  AND 	ctx_contract_contacts.default_email  = 'Y'  )   )  field_value  ,  " + &
								" 		'C' field_data_type, " +&
								"		row_number() over(order by ctx_action_items.ctx_id) Row_No   " + &
								"		from  ctx_basic_info table_1 left join ctx_basic_info table_2 on (table_1.master_contract_id = table_2.ctx_id ) left join  		 " + &     	
  		     					"		ctx_action_items  on (ctx_action_items.ctx_id = table_2.ctx_id) 	"	
					Else
						ls_sny_retrieve = ls_sny_retrieve + " ISNULL((select last_name +','+first_name from ctx_contacts where contact_id = ctx_action_items.letter_from),   " + &
								"   (SELECT top 1 ctx_contacts.last_name +','+ ctx_contacts.first_name   FROM ctx_contacts,   	ctx_contract_contacts    " + &
								"		WHERE ctx_contract_contacts.contact_id = ctx_contacts.contact_id and  	ctx_contract_contacts.ctx_id = ctx_action_items.ctx_id   AND    " + &
								"		ctx_contract_contacts.ic_area = 'E'  AND 	ctx_contract_contacts.default_email  = 'Y'  )   )  field_value  ,  " + &
								"  	 	'C' field_data_type, " +&
								"		row_number() over(order by ctx_action_items.ctx_id) Row_No   " + &
								"		from  ctx_action_items 	"							
					End If
								
				Case 'letter_to_name'
					If lb_get_parent Then			
						ls_sny_retrieve = ls_sny_retrieve + " ISNULL((select last_name +','+first_name from ctx_contacts where contact_id = ctx_action_items.letter_to),   " + &
								"   (SELECT top 1 ctx_contacts.last_name +','+ ctx_contacts.first_name   FROM ctx_contacts,   	ctx_contract_contacts    " + &
								"		WHERE ctx_contract_contacts.contact_id = ctx_contacts.contact_id and  	ctx_contract_contacts.ctx_id = ctx_action_items.ctx_id   AND    " + &
								"		ctx_contract_contacts.ic_area = 'I'  AND 	ctx_contract_contacts.default_email  = 'Y'  )   )  field_value  ,  " + &
								" 		'C' field_data_type, " +&
								"		row_number() over(order by ctx_action_items.ctx_id) Row_No   " + &
								"		from  ctx_basic_info table_1 left join ctx_basic_info table_2 on (table_1.master_contract_id = table_2.ctx_id ) left join  		 " + &     	
  		     					"		ctx_action_items  on (ctx_action_items.ctx_id = table_2.ctx_id) 	"	
					Else
						ls_sny_retrieve = ls_sny_retrieve + " ISNULL((select last_name +','+first_name from ctx_contacts where contact_id = ctx_action_items.letter_to),   " + &
								"   (SELECT top 1 ctx_contacts.last_name +','+ ctx_contacts.first_name   FROM ctx_contacts,   	ctx_contract_contacts    " + &
								"		WHERE ctx_contract_contacts.contact_id = ctx_contacts.contact_id and  	ctx_contract_contacts.ctx_id = ctx_action_items.ctx_id   AND    " + &
								"		ctx_contract_contacts.ic_area = 'I'  AND 	ctx_contract_contacts.default_email  = 'Y'  )   )  field_value  ,  " + &
								"  	 	'C' field_data_type, " +&
								"		row_number() over(order by ctx_action_items.ctx_id) Row_No   " + &
								"		from  ctx_action_items 	"	
					End If		
			End Choose
			
		
		//Added By Jay Chen 11-03-2015 app_facility custom
		elseif ll_ctx_scrn_id = 2003 and Lower(ls_select_table) = 'app_facility'  and left(lower(ls_select_field_ctx),7)='custom_' then
			select field_dddw_display_column,field_style into :ls_display_field,:ls_style from ctx_contact_custom_config where field_falg='C' AND field_name=:ls_select_field_ctx;
			ls_display_field = ls_lu_field //Added By Jay Chen 01-23-2016
			choose case lower(ls_style)
				case 'company'
					ls_temp = "(case when " + "app_facility2." +ls_display_field + " is null then " + "app_facility." + ls_select_field + " else " + "app_facility2." +ls_display_field + " end)" //Added By Jay Chen 02-05-2016
					ls_field_value = " convert(varchar(" + String(li_widthtemp) + ")," + ls_temp + ") "
//					ls_field_value = " convert(varchar(" + String(li_widthtemp) + "),"+ "app_facility2." +ls_display_field + ") "
					ls_sny_retrieve = ls_sny_retrieve + ls_field_value + " field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
								   ls_syn_parent + ls_link_table + ls_link_table_on +  " ctx_basic_info " + ls_select_table_on + " left join " + Lower(ls_select_table) + " on(ctx_basic_info.app_facility = app_facility.facility_id)" + &
								   " left join app_facility app_facility2 on(cast(app_facility2.facility_id as varchar) = app_facility." + ls_select_field + ") "
				case 'code lookup'
					ls_temp = "(case when " + "code_lookup." +ls_display_field + " is null then " + "app_facility." + ls_select_field + " else " + "code_lookup." +ls_display_field + " end)" //Added By Jay Chen 02-05-2016
					ls_field_value = " convert(varchar(" + String(li_widthtemp) + ")," + ls_temp + ") "
//					ls_field_value = " convert(varchar(" + String(li_widthtemp) + ")," + "code_lookup." +ls_display_field + ") "
					ls_sny_retrieve = ls_sny_retrieve + ls_field_value + " field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
								   ls_syn_parent + ls_link_table + ls_link_table_on +  " ctx_basic_info " + ls_select_table_on + " left join " + Lower(ls_select_table) + " on(ctx_basic_info.app_facility = app_facility.facility_id)" + &
								  " left join code_lookup on(cast(code_lookup.lookup_code as varchar) = app_facility." + ls_select_field + ") " //Modified By Jay Chen 02-05-2016
//								  " left join code_lookup on(code_lookup.lookup_code = app_facility." + ls_select_field + ") "
				case else
					ls_field_value = " convert(varchar(" + String(li_widthtemp) + "),"+ ls_select_table + "." +ls_select_field + ") "
					ls_sny_retrieve = ls_sny_retrieve + ls_field_value + " field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
											ls_syn_parent + ls_link_table + ls_link_table_on +  " ctx_basic_info " + ls_select_table_on + " left join " + Lower(ls_select_table) + " on(ctx_basic_info.app_facility = app_facility.facility_id)"
			end choose
		
		//Added By Jay Chen 11-03-2015 ctx_contacts custom
		elseif ll_ctx_scrn_id = 2001 and Lower(ls_select_table) = 'ctx_contacts'  and left(lower(ls_select_field_ctx),7)='custom_' then
			select field_dddw_display_column,field_style into :ls_display_field,:ls_style from ctx_contact_custom_config where field_falg='P' AND field_name=:ls_select_field_ctx;
			ls_display_field = ls_lu_field //Added By Jay Chen 01-23-2016
			choose case lower(ls_style)
				case 'company'
					ls_temp = "(case when " + "app_facility." +ls_display_field + " is null then " + "ctx_contacts." + ls_select_field + " else " + "app_facility." +ls_display_field + " end)" //Added By Jay Chen 02-05-2016
					ls_field_value = " convert(varchar(" + String(li_widthtemp) + ")," + ls_temp + ") "
//					ls_field_value = " convert(varchar(" + String(li_widthtemp) + "),"+ "app_facility." +ls_display_field + ") "
					ls_sny_retrieve = ls_sny_retrieve + ls_field_value + " field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
										   ls_syn_parent +ls_link_table + ls_link_table_on +   Lower(ls_select_table) + ls_select_table_on + &
										   " left join app_facility on(cast(app_facility.facility_id as varchar) = ctx_contacts." + ls_select_field + ") "		
				case 'code lookup'
					ls_temp = "(case when " + "code_lookup." +ls_display_field + " is null then " + "ctx_contacts." + ls_select_field + " else " + "code_lookup." +ls_display_field + " end)" //Added By Jay Chen 02-05-2016
					ls_field_value = " convert(varchar(" + String(li_widthtemp) + ")," + ls_temp + ") "
//					ls_field_value = " convert(varchar(" + String(li_widthtemp) + "),"+ "code_lookup." +ls_display_field + ") "
					ls_sny_retrieve = ls_sny_retrieve + ls_field_value + " field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
										   ls_syn_parent +ls_link_table + ls_link_table_on +   Lower(ls_select_table) + ls_select_table_on + &
										   " left join code_lookup on(cast(code_lookup.lookup_code as varchar) = ctx_contacts." + ls_select_field + ") "	
				case else
					ls_field_value = " convert(varchar(" + String(li_widthtemp) + "),"+ ls_select_table + "." +ls_select_field + ") "
					ls_sny_retrieve = ls_sny_retrieve + ls_field_value + " field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
											ls_syn_parent +ls_link_table + ls_link_table_on +   Lower(ls_select_table) + ls_select_table_on
			end choose
		
	
		
		
		//Added By Jay Chen 10-28-2015 export app_facility_custom and ctx_contacts_custom fields
		elseif (ll_ctx_scrn_id = 6 or ll_ctx_scrn_id = 7) and (left(lower(ls_select_field_ctx),20)='app_facility_custom_'  or left(lower(ls_select_field_ctx),20)='ctx_contacts_custom_')  then
			//ls_db_lookup_type:P C 
			if left(lower(ls_select_field_ctx),20) = 'app_facility_custom_' then
				choose case upper(ls_db_lookup_type)
					case 'P'
						ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),app_facility2."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
										ls_syn_parent + ls_link_table + ls_link_table_on +  Lower(ls_select_table) + ls_select_table_on + " left join app_facility app_facility2 on (app_facility." + ls_select_field + " = app_facility2.facility_id) " + &
										" left join ctx_contacts on (ctx_contacts.facility_id = app_facility.facility_id) left join ctx_contract_contacts on(ctx_contract_contacts.contact_id = ctx_contacts.contact_id) "
					case 'C'
						ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),code_lookup."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
										ls_syn_parent + ls_link_table + ls_link_table_on +  Lower(ls_select_table) + ls_select_table_on + " left join code_lookup on ( " + ls_select_table + "." + ls_select_field + " = code_lookup.lookup_code) " + &
										" left join ctx_contacts on (ctx_contacts.facility_id = app_facility.facility_id) left join ctx_contract_contacts on(ctx_contract_contacts.contact_id = ctx_contacts.contact_id) "
									
					case else
						ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),app_facility."+ ls_select_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
										ls_syn_parent + ls_link_table + ls_link_table_on +  Lower(ls_select_table) + ls_select_table_on + " left join ctx_contacts on (ctx_contacts.facility_id = app_facility.facility_id) left join ctx_contract_contacts on(ctx_contract_contacts.contact_id = ctx_contacts.contact_id) "
				end choose
			elseif left(lower(ls_select_field_ctx),20) = 'ctx_contacts_custom_' then
				choose case upper(ls_db_lookup_type)
					case 'P'
						ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),app_facility2."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
										ls_syn_parent + ls_link_table + ls_link_table_on +  Lower(ls_select_table) + ls_select_table_on + " left join app_facility app_facility2 on (app_facility." + ls_select_field + " = app_facility2.facility_id) " + &
										" left join ctx_contract_contacts on(ctx_contract_contacts.contact_id = ctx_contacts.contact_id) "
					case 'C'
						ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),code_lookup."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
										ls_syn_parent + ls_link_table + ls_link_table_on +  Lower(ls_select_table) + ls_select_table_on + " left join code_lookup on ( " + ls_select_table + "." + ls_select_field + " = code_lookup.lookup_code) " + &
										" left join ctx_contract_contacts on(ctx_contract_contacts.contact_id = ctx_contacts.contact_id) "
					case else
						ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),ctx_contacts."+ ls_select_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
										ls_syn_parent + ls_link_table + ls_link_table_on +  Lower(ls_select_table) + ls_select_table_on + " left join ctx_contract_contacts on(ctx_contract_contacts.contact_id = ctx_contacts.contact_id) "
					end choose
			end if
			//ls_select_field  = "app_facility_" + ls_lu_field
			ls_other_where = " and ctx_contract_contacts.ic_area = '" +ls_ic_area + "' "
		elseif (ll_ctx_scrn_id = 6 or ll_ctx_scrn_id = 7) and lower(ls_select_field_ctx) = 'app_facility_contact' then //Added By Jay Chen 10-29-2015
			ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),app_facility.contact) field_value,  '" + ls_datatype + "' field_data_type, row_number() over(order by ctx_contract_contacts.ctx_id) Row_No from " + &
										ls_syn_parent + ls_link_table + ls_link_table_on +  Lower(ls_select_table) + ls_select_table_on + " left join ctx_contacts on (ctx_contacts.facility_id = app_facility.facility_id) left join ctx_contract_contacts on(ctx_contract_contacts.contact_id = ctx_contacts.contact_id) "
			ls_other_where = " and ctx_contract_contacts.ic_area = '" +ls_ic_area + "' "
		//end add
		elseif ls_select_field = 'loc_id' and upper(ls_db_lookup_type) = "L" then //Location
			ls_datatype = "C"
			if ls_lu_field = "state"  or ls_lu_field = "country" or ls_lu_field = "mailing_address" then
				//Use code_lookup.code display value -- jervis 08.04.2009
				ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),code_lookup.code) field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
									ls_syn_parent + ls_link_table + ls_link_table_on +  Lower(ls_select_table) + ls_select_table_on + " left join group_practice on("+ Lower(ls_select_table) + "." + ls_select_field + " = group_practice.rec_id) " + &
									"left join code_lookup on ( group_practice." + ls_lu_field + " = code_lookup.lookup_code) " 
			elseif  ls_lu_field = "county"  then
				//Use code_lookup.describe display value -- jervis 08.04.2009
				ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),code_lookup.description) field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
									ls_syn_parent + ls_link_table + ls_link_table_on +  Lower(ls_select_table) + ls_select_table_on + " left join group_practice on("+ Lower(ls_select_table) + "." + ls_select_field + " = group_practice.rec_id) " + &
									"left join code_lookup on ( group_practice." + ls_lu_field + " = code_lookup.lookup_code) " 
			elseif ls_lu_field = "mailing_address_desc" then		//Export Description - jervis 08.07.2009
				ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),code_lookup.description) field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
									ls_syn_parent + ls_link_table + ls_link_table_on +  Lower(ls_select_table) + ls_select_table_on + " left join group_practice on("+ Lower(ls_select_table) + "." + ls_select_field + " = group_practice.rec_id) " + &					
									"left join code_lookup on ( group_practice.mailing_address = code_lookup.lookup_code) " 
			else
				ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),group_practice."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
									ls_syn_parent + ls_link_table + ls_link_table_on +  Lower(ls_select_table) + ls_select_table_on + " left join group_practice on("+ Lower(ls_select_table) + "." + ls_select_field + " = group_practice.rec_id) "
			end if
			ls_select_field = "group_practice_" + ls_lu_field
		//---------End code by jervis 06.09.2009-------------
		
		elseif ls_select_field = 'parent_comp_id' and Upper(ls_db_lookup_type) = "M" then	//Parent Organization -- jervis 06.23.2009
			
			ls_datatype = "C"
			ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),group_multi_loc."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
									ls_syn_parent + ls_link_table + ls_link_table_on +  Lower(ls_select_table) + ls_select_table_on + " left join group_multi_loc on("+ Lower(ls_select_table) + "." + ls_select_field + " = group_multi_loc.rec_id) "
			ls_select_field = "group_multi_loc_" + ls_lu_field

		//---------Start code by jervis 03.17.2009-------------
		//Export Requiments data
		elseif ls_select_field = 'ctx_req_profile_id' and Upper(ls_db_lookup_type) = "R"	 then //Requiren profile dddw-jervis 03.17.2009
			ls_Datatype = 'C'
			ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),ctx_req_profile."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
									ls_syn_parent + ls_link_table + ls_link_table_on +  Lower(ls_select_table) + ls_select_table_on + " left join ctx_req_profile on("+ Lower(ls_select_table) + "." + ls_select_field + " = ctx_req_profile.ctx_req_profile_id) "
			ls_select_field = "ctx_req_profile_" + ls_lu_field
		
		ElseIf ll_ctx_scrn_id = 22 Then
			ls_datatype = of_get_coltype(lds_dataobject,ls_select_field_ctx) 
//					ls_select_table = 'ctx_orgs_contact'//added by gavins 20130314
			If ls_select_field = 'org_type' then
				ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),code_lookup."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
											ls_syn_parent + ls_link_table + ls_link_table_on +  Lower(ls_select_table) + ls_select_table_on + " inner join ctx_orgs on " + Lower(ls_select_table) + ".org_id"  +" = ctx_orgs.org_id  left join code_lookup on (ctx_orgs." + ls_select_field + " = code_lookup.lookup_code) "
			Else
				ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),ctx_orgs."+ ls_select_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
									ls_syn_parent + ls_link_table + ls_link_table_on +  Lower(ls_select_table) + ls_select_table_on + " inner join ctx_orgs on " + Lower(ls_select_table) + ".org_id"  +" = ctx_orgs.org_id  "
			End if
			ls_select_field  = "ctx_orgs_" + ls_select_field						
		elseif ll_ctx_scrn_id = 12 then	//Export Requirements Profile Detail Data - jervis 03.17.2009
			ls_datatype = of_get_coltype(lds_dataobject,ls_select_field_ctx)
			choose case ls_select_field
				case 'data_value'
					ls_sny_retrieve = ls_sny_retrieve +  " convert(varchar(" + String(li_widthtemp) + "),(Case ctx_req_tmplt_element.value_type when 1 then convert(varchar," + ls_select_table + ".date_value ,101) when 2 then " + ls_select_table+ ".field_value when 3 then " + ls_select_table + ".char_value when 4 then cast(" +ls_select_table+".integer_value as varchar) when 6 then cast(" +ls_select_table+".money_value as varchar) when 5 then " +ls_select_table +" .field_value end)) field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " 
											//ls_syn_parent + ls_link_table + ls_link_table_on + ls_select_table + ls_select_table_on + &
											//"left join ctx_req_tmplt_element on (" + ls_select_table + ".ctx_req_tmplt_element_id = ctx_req_tmplt_element.ctx_req_tmplt_element_id)"
					ls_select_field = ls_select_table + "_"+ls_select_field
				case 'element_sort'	//in process....
				case 'requirement'	
					ls_sny_retrieve = ls_sny_retrieve +  " convert(varchar(" + String(li_widthtemp) + "),ctx_req_tmplt_element.element_name) field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " //+ &
											//ls_syn_parent + ls_link_table + ls_link_table_on + ls_select_table + ls_select_table_on + &
											//"left join ctx_req_tmplt_element  on (" + ls_select_table + ".ctx_req_tmplt_element_id = ctx_req_tmplt_element.ctx_req_tmplt_element_id)"
					ls_select_field =  "ctx_req_tmplt_element_"+ls_select_field
				case 'ctx_rqmnt_category_id'	//in process....
				case 'ctx_req_profile_id'	//in process
				case 'category_name'
					ls_sny_retrieve = ls_sny_retrieve +  " convert(varchar(" + String(li_widthtemp) + "),ctx_rqmnt_category.category_name) field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " //+ &
											//ls_syn_parent + ls_link_table + ls_link_table_on + ls_select_table + ls_select_table_on + &
											//"left join ctx_req_tmplt_element on (" + ls_select_table + ".ctx_req_tmplt_element_id = ctx_req_tmplt_element.ctx_req_tmplt_element_id) " + &
											//"left join ctx_rqmnt_category  on (ctx_req_tmplt_element.ctx_rqmnt_category_id = ctx_rqmnt_category.ctx_rqmnt_category_id and " + ls_linktotable + ".ctx_req_profile_id = ctx_rqmnt_category.ctx_req_profile_id)"
					ls_select_field = "ctx_rqmnt_category_"+ls_select_field

				case else		//case 'clause'
					ls_sny_retrieve = ls_sny_retrieve +  " convert(varchar(" + String(li_widthtemp) + ")," + ls_select_table + "."+ ls_select_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " //+ &
											//ls_syn_parent + ls_link_table + ls_link_table_on + ls_select_table + ls_select_table_on 
											
					ls_select_field = ls_select_table + "_"+ls_select_field
			end choose
			ls_sny_retrieve =  ls_sny_retrieve + ls_syn_parent + ls_link_table + ls_link_table_on + ls_select_table + ls_select_table_on + &
									" left join ctx_req_tmplt_element on (" + ls_select_table + ".ctx_req_tmplt_element_id = ctx_req_tmplt_element.ctx_req_tmplt_element_id) " + &
									" left join ctx_rqmnt_category  on (ctx_req_tmplt_element.ctx_rqmnt_category_id = ctx_rqmnt_category.ctx_rqmnt_category_id and " + ls_linktotable + ".ctx_req_profile_id = ctx_rqmnt_category.ctx_req_profile_id)"
		//---------End code by jervis 03.17.2009-------------
		
		//-----------Start code by jervis 03.20.2009------------
		//Export the Processing Setting for Contract status tract
		elseif ll_ctx_scrn_id = 2004 and ls_select_field = "processing_setting"	 then
			ls_datatype = 'C'
			ls_sny_retrieve = ls_sny_retrieve +  " convert(varchar(" + String(li_widthtemp) + "),case code_lookup.custom_2 when 'On' then 'In Process' when 'Off' then 'On Hold' when 'Complete' then 'Executed' when 'NA' then 'N/A' else custom_2 end ) field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
									ls_syn_parent + ls_link_table + ls_link_table_on + ls_select_table + ls_select_table_on + &
									" left join code_lookup on (" + ls_select_table+ ".status = code_lookup.lookup_code)" // and code_lookup.lookup_name = 'Contract Status')" -- comment by jervis -- 04.26.2011
											
			//ls_select_field = ls_select_table + "_"+ls_select_field
		//---------End code by jervis 03.20.2009-------------
		ElseIf ls_select_field = 'contact_id' and ll_ctx_scrn_id <> 2001 Then  //Add ll_ctx_scrn_id <> 2001 -- jervis 01.28.2011
			//--------------------------- APPEON BEGIN ---------------------------
			//$<modify> 06.05.2007 By: Jack
			//$<reason> Fix a defect.
			//Added By Mark Lee 03/05/2014
//			If ls_lu_field = 'contact_department' Or ls_lu_field = 'contact_type' Or ls_lu_field = 'contact_id' Then
			If ls_lu_field = 'contact_department' Or ls_lu_field = 'contact_type' Or ls_lu_field = 'contact_id' or ( ll_ctx_scrn_id = 2002 ) Then
				ls_datatype = "N"
			Else
				ls_datatype = "C"
			End If
			
			If ls_lu_field = 'phone' or ls_lu_field = "ext" or ls_lu_field = "contact_email" Then
				if ls_lu_field = "contact_email" then
					ls_lu_codename = "Email"
				else
					ls_lu_codename = "Phone"
				end if
				//ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),(select top 1 A.phone from ctx_contacts_numbers A where A.contact_id = ctx_contract_contacts.contact_id and a.via = (select lookup_code from code_lookup where lookup_name = 'Contract Contact Via' and code = 'Phone' ) and a.phone is not null)) field_value, '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from ctx_contract_contacts,ctx_contacts " + ", (" + ls_prac_sql + ") bb " + " where ctx_contract_contacts.contact_id = ctx_contacts.contact_id and ctx_contract_contacts.ic_area = '" + ls_ic_area + "' and "
				ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),(select top 1 A." + ls_lu_field+ " from ctx_contacts_numbers A where A.contact_id = ctx_contract_contacts.contact_id and a.via = (select top 1 lookup_code from code_lookup where lookup_name = 'Contract Contact Via' and lower(code) = '" + lower(ls_lu_codename) + "' ) and a." + ls_lu_field + " is not null)) field_value, '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
										ls_syn_parent + " ctx_contract_contacts " + ls_no_link_on + " left join ctx_contacts on (ctx_contract_contacts.contact_id = ctx_contacts.contact_id )"
				ls_other_where = " and ctx_contract_contacts.ic_area = '" +ls_ic_area + "' "
	
			Else
				//ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),ctx_contacts."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from ctx_contacts," + Lower(ls_select_table) +  ls_use_link_sql + " WHERE " + "(" + Lower(ls_select_table) + "." + ls_select_field + " = ctx_contacts.contact_id) and "
				//Begin - Added By Mark Lee 03/05/2014			
//				ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),ctx_contacts."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//										ls_syn_parent +  ls_link_table + ls_link_table_on +  lower(ls_select_table) + ls_select_table_on + " left join ctx_contacts on(" + Lower(ls_select_table) + "." + ls_select_field + " = ctx_contacts.contact_id) "
				if  ll_ctx_scrn_id = 2002 then 
					ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),ctx_contacts."+ ls_select_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
										ls_syn_parent +  ls_link_table + ls_link_table_on +  lower(ls_select_table) + ls_select_table_on + " left join ctx_contacts on(" + Lower(ls_select_table) + "." + ls_select_field + " = ctx_contacts.contact_id) "					
				else					
					ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),ctx_contacts."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
										ls_syn_parent +  ls_link_table + ls_link_table_on +  lower(ls_select_table) + ls_select_table_on + " left join ctx_contacts on(" + Lower(ls_select_table) + "." + ls_select_field + " = ctx_contacts.contact_id) "
				end if										
				//End - Added By Mark Lee 03/05/2014													
				//Add other contact - jervis 03.28.2011
				if (ll_ctx_scrn_id = 6 or ll_ctx_scrn_id = 7 or ll_ctx_scrn_id = 14 or ll_ctx_scrn_id = 17) and lower(ls_select_table) = "ctx_contract_contacts" Then
					ls_other_where = " and ctx_contract_contacts.ic_area = '" +ls_ic_area + "' "
				end if
			End If
			//---------------------------- APPEON END ----------------------------
			//Begin - Added By Mark Lee 03/05/2014
			if  ll_ctx_scrn_id <> 2002 then 
				ls_select_field  = "ctx_contacts_" + ls_lu_field
			end if 
			//End - Added By Mark Lee 03/05/2014		
		
		elseif ll_ctx_scrn_id = 2002 and (ls_select_field = 'phone' or ls_select_field = "ext" or ls_select_field = "contact_email") then  //Add by jervis 03.28.2011
			ls_datatype = "C" 
			//,(select top 1 A." + ls_lu_field+ " from ctx_contacts_numbers A where A.contact_id = ctx_contract_contacts.contact_id and a.via = (select top 1 lookup_code from code_lookup where lookup_name = 'Contract Contact Via' and lower(code) = '" + lower(ls_lu_codename) + "' ) and a." + ls_lu_field + " is not null))
			ls_field_value = " convert(varchar(" + String(li_widthtemp) + "),"+ ls_select_table + "." +ls_select_field + ") "
			
			if ls_select_field = "contact_email" then
				ls_lu_codename = "Email"
			else
				ls_lu_codename = "Phone"
			end if
				
			ls_sny_retrieve = ls_sny_retrieve + ls_field_value + " field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
											ls_syn_parent +ls_link_table + ls_link_table_on +   Lower(ls_select_table) + ls_select_table_on
			//overwrite link other where condition
			if li_use_link = 1 and (ll_ctx_link_scrn_id = 6 or ll_ctx_link_scrn_id = 7 or ll_ctx_link_scrn_id = 14 or ll_ctx_link_scrn_id = 17) Then
				ls_other_where = " and ("+ ls_select_table + ".via = (select top 1 lookup_code from code_lookup where lookup_name = 'Contract Contact Via' and lower(code) = '" + lower(ls_lu_codename) + "' and " + ls_select_table +  "." + ls_select_field + " is not null) and ctx_contract_contacts.ic_area = '" +ls_ic_link_area + "' ) "
			end if
		ElseIf ls_select_field = 'compute_1' Then
			ls_datatype = "C"
				
			//ls_sny_retrieve = ls_synprefix + "Select " + ls_top + " ctx_contract_contacts.ctx_id, " + ls_tablepk + ls_Sortsel + String(ll_FieldSeqID) + " FieldSeqID,  isnull(ctx_contacts.last_name,'') + ','  + isnull(ctx_contacts.first_name,'') + case when isnull(ctx_contacts.middle_name,'') <> '' THEN ', ' + isnull(ctx_contacts.middle_name,'') else '' END field_value, '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from ctx_contract_contacts,ctx_contacts " + ", (" + ls_prac_sql + ") bb " + " where ctx_contract_contacts.contact_id = ctx_contacts.contact_id and ctx_contract_contacts.ic_area = '" + ls_ic_area + "' and "
			if lb_get_parent then
				ls_sny_retrieve = ls_synprefix + "Select " + ls_top + " table_1.ctx_id, " + ls_tablepk + ls_Sortsel + String(ll_FieldSeqID) + " FieldSeqID,  isnull(ctx_contacts.last_name,'') + ','  + isnull(ctx_contacts.first_name,'') + case when isnull(ctx_contacts.middle_name,'') <> '' THEN ', ' + isnull(ctx_contacts.middle_name,'') else '' END field_value, '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
										ls_syn_parent + " ctx_contract_contacts " + ls_no_link_on + " left join ctx_contacts on (ctx_contract_contacts.contact_id = ctx_contacts.contact_id and ctx_contract_contacts.ic_area = '" + ls_ic_area + "')"
			ELSE
				ls_sny_retrieve = ls_synprefix + "Select " + ls_top + " ctx_contract_contacts.ctx_id, " + ls_tablepk + ls_Sortsel + String(ll_FieldSeqID) + " FieldSeqID,  isnull(ctx_contacts.last_name,'') + ','  + isnull(ctx_contacts.first_name,'') + case when isnull(ctx_contacts.middle_name,'') <> '' THEN ', ' + isnull(ctx_contacts.middle_name,'') else '' END field_value, '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
										 " ctx_contract_contacts " +  " left join ctx_contacts on (ctx_contract_contacts.contact_id = ctx_contacts.contact_id and ctx_contract_contacts.ic_area = '" + ls_ic_area + "')"
			END IF
			ls_other_where = " and ctx_contract_contacts.ic_area = '" +ls_ic_area + "' "
			ls_select_field  = "compute_1"
		ElseIf ls_select_field = 'contact_phone' Then
			ls_datatype = "C"
			//ls_sny_retrieve = ls_synprefix + "Select " + ls_top + " ctx_contract_contacts.ctx_id, " + ls_tablepk + ls_Sortsel + String(ll_FieldSeqID) + " FieldSeqID,  (select top 1 A.phone from ctx_contacts_numbers A where A.contact_id = ctx_contract_contacts.contact_id and	a.via = (select lookup_code from code_lookup where lookup_name = 'Contract Contact Via' and code = 'Phone' ) and a.phone is not null) field_value, '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from ctx_contract_contacts,ctx_contacts where ctx_contract_contacts.contact_id = ctx_contacts.contact_id and ctx_contract_contacts.ic_area = '" + ls_ic_area + "' and "
			if lb_get_parent then
				ls_sny_retrieve = ls_synprefix + "Select " + ls_top + " table_1.ctx_id, " + ls_tablepk + ls_Sortsel + String(ll_FieldSeqID) + " FieldSeqID,  (select top 1 A.phone from ctx_contacts_numbers A where A.contact_id = ctx_contract_contacts.contact_id and	a.via = (select top 1 lookup_code from code_lookup where lookup_name = 'Contract Contact Via' and code = 'Phone' ) and a.phone is not null) field_value, '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
										ls_syn_parent + " ctx_contract_contacts " + ls_no_link_on + " left join ctx_contacts on(ctx_contract_contacts.contact_id = ctx_contacts.contact_id ) "
			else
				ls_sny_retrieve = ls_synprefix + "Select " + ls_top + " ctx_contract_contacts.ctx_id, " + ls_tablepk + ls_Sortsel + String(ll_FieldSeqID) + " FieldSeqID,  (select top 1 A.phone from ctx_contacts_numbers A where A.contact_id = ctx_contract_contacts.contact_id and	a.via = (select top 1 lookup_code from code_lookup where lookup_name = 'Contract Contact Via' and code = 'Phone' ) and a.phone is not null) field_value, '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
										" ctx_contract_contacts  left join ctx_contacts on(ctx_contract_contacts.contact_id = ctx_contacts.contact_id ) "
			end if
			ls_other_where = " and ctx_contract_contacts.ic_area = '" +ls_ic_area + "' "
		ElseIf ls_select_field = 'contact_email' Then
			ls_datatype = "C"
			If lb_get_parent Then
				//ls_sny_retrieve = ls_synprefix + "Select " + ls_top + " ctx_contract_contacts.ctx_id, " + ls_tablepk + ls_Sortsel + String(ll_FieldSeqID) + " FieldSeqID,  (select top 1 A.contact_email from ctx_contacts_numbers A where A.contact_id = ctx_contract_contacts.contact_id and a.via = (select lookup_code from code_lookup where lookup_name = 'Contract Contact Via' and code = 'Email' ) and a.contact_email is not null) field_value, '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from ctx_contract_contacts,ctx_contacts " + ", (" + ls_prac_sql + ") bb " + " where ctx_contract_contacts.contact_id = ctx_contacts.contact_id and ctx_contract_contacts.ic_area = '" + ls_ic_area + "' and "
				ls_sny_retrieve = ls_synprefix + "Select " + ls_top + " table_1.ctx_id, " + ls_tablepk + ls_Sortsel + String(ll_FieldSeqID) + " FieldSeqID,  (select top 1 A.contact_email from ctx_contacts_numbers A where A.contact_id = ctx_contract_contacts.contact_id and	a.via = (select top 1 lookup_code from code_lookup where lookup_name = 'Contract Contact Via' and code = 'Email' ) and a.contact_email is not null) field_value, '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
										ls_syn_parent + " ctx_contract_contacts " + ls_no_link_on + " left join ctx_contacts on(ctx_contract_contacts.contact_id = ctx_contacts.contact_id ) "
			Else
				ls_sny_retrieve = ls_synprefix + "Select " + ls_top + " ctx_contract_contacts.ctx_id, " + ls_tablepk + ls_Sortsel + String(ll_FieldSeqID) + " FieldSeqID,  (select top 1 A.contact_email from ctx_contacts_numbers A where A.contact_id = ctx_contract_contacts.contact_id and	a.via = (select top 1 lookup_code from code_lookup where lookup_name = 'Contract Contact Via' and code = 'Email' ) and a.contact_email is not null) field_value, '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
										" ctx_contract_contacts  left join ctx_contacts on(ctx_contract_contacts.contact_id = ctx_contacts.contact_id ) "
			End If
			ls_other_where = " and ctx_contract_contacts.ic_area = '" +ls_ic_area + "' "
		ElseIf Upper(ls_db_lookup_type)  = "C" Then //code lookup table
			
			ls_datatype_ctx = of_get_coltype(lds_dataobject,ls_select_field_ctx) //03.25.2011 by jervis
			
			//--------------------------- APPEON BEGIN ---------------------------
			//$<modify> 03.19.2007 By: Jack (Export)
			//$<reason> Fix a defect.
			If Upper(ls_lu_field) = "LOOKUP_CODE" Then
				ls_datatype = "N"
			Else
				ls_datatype = "C"
			End If
			
			if ls_datatype_ctx = 'N' then //Non't convert - jervis 03.25.2011
				If ls_select_table <> 'app_facility' Then
					//ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),code_lookup."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from code_lookup," + Lower(ls_select_table) +  ls_use_link_sql + " WHERE " + "(convert(varchar," + Lower(ls_select_table) + "." + ls_select_field + ") = convert(varchar,code_lookup.lookup_code)) and "
					//ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),code_lookup."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &  //Modified By Ken.Guo 2016-03-25
					ls_sny_retrieve = ls_sny_retrieve + " IsNull(convert(varchar(" + String(li_widthtemp) + "),code_lookup."+ ls_lu_field + ") , "+   "convert(varchar," + Lower(ls_select_table) + "." + ls_select_field       +")) field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
											ls_syn_parent + ls_link_table + ls_link_table_on +  Lower(ls_select_table) + ls_select_table_on + " left join code_lookup on (" + Lower(ls_select_table) + "." + ls_select_field + " = code_lookup.lookup_code) "
				Else
					//ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),code_lookup."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from ctx_basic_info,code_lookup," + lower(ls_select_table) +  ls_use_link_sql + " WHERE " + "(convert(varchar," + lower(ls_select_table) + "." + ls_select_field + ") = convert(varchar,code_lookup.lookup_code)) and "			
					ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),code_lookup."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
											ls_syn_parent + ls_link_table + ls_link_table_on +  " ctx_basic_info " + ls_select_table_on + " left join app_facility on(ctx_basic_info.app_facility = app_facility.facility_id) left join code_lookup on (" + lower(ls_select_table) + "." + ls_select_field + " = code_lookup.lookup_code) "			
				End If
			else
				If ls_select_table <> 'app_facility' Then
					//ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),code_lookup."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from code_lookup," + Lower(ls_select_table) +  ls_use_link_sql + " WHERE " + "(convert(varchar," + Lower(ls_select_table) + "." + ls_select_field + ") = convert(varchar,code_lookup.lookup_code)) and "
					//ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),code_lookup."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + & //Modified By Ken.Guo 2016-03-25
					//Added By Mark Lee 07/20/2016
					// Modified by gavins 20161107  CLX need to the function. mail "Next CLX Release"
//					ls_sny_retrieve = ls_sny_retrieve + " IsNULL(convert(varchar(" + String(li_widthtemp) + "),code_lookup."+ ls_lu_field + ") , "+   "convert(varchar," + Lower(ls_select_table) + "." + ls_select_field       +")) field_value ,   '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
//											ls_syn_parent + ls_link_table + ls_link_table_on +  Lower(ls_select_table) + ls_select_table_on + " left join code_lookup on (convert(varchar," + Lower(ls_select_table) + "." + ls_select_field + ") = convert(varchar,code_lookup.lookup_code)) "
					//Added By Mark Lee 07/26/2016 comment by customer! (Subject: RE: Task 576) 	change!
					// Modified by gavins 20161107  CLX need to the function. mail "Next CLX Release"
					ll_FRow = 0 
					if lds_Multi_Fields.rowcount( ) > 0 then 
						ll_FRow =  lds_Multi_Fields.Find( "view_id =" + string( ll_view_id ) + " and screen_id = " + string( ll_screen_id ) + " and object_name = '" + ls_select_field + "' and object_format = 'Y'", 1, lds_Multi_Fields.Rowcount( ) )
					end if
					if ls_datatype_ctx= 'C' then 
						//Added By Mark Lee 07/25/2016		change ? 
						if ll_FRow > 0 and ib_replace_multi_field_symbol = false then 
							ls_sny_retrieve = ls_sny_retrieve + " IsNULL(convert(varchar(" + String(li_widthtemp) + "),code_lookup."+ ls_lu_field + ") , "+ " replace("+  Lower(ls_select_table) + "." + ls_select_field+" , ',','|') "   +") field_value ,   '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
											ls_syn_parent + ls_link_table + ls_link_table_on +  Lower(ls_select_table) + ls_select_table_on + " left join code_lookup on (convert(varchar," + Lower(ls_select_table) + "." + ls_select_field + ") = convert(varchar,code_lookup.lookup_code)) "		
						else
							ls_sny_retrieve = ls_sny_retrieve + " IsNULL(convert(varchar(" + String(li_widthtemp) + "),code_lookup."+ ls_lu_field + ") , "+   Lower(ls_select_table) + "." + ls_select_field       +") field_value ,   '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
											ls_syn_parent + ls_link_table + ls_link_table_on +  Lower(ls_select_table) + ls_select_table_on + " left join code_lookup on (convert(varchar," + Lower(ls_select_table) + "." + ls_select_field + ") = convert(varchar,code_lookup.lookup_code)) "					
						end if 
					else
						ls_sny_retrieve = ls_sny_retrieve + " IsNULL(convert(varchar(" + String(li_widthtemp) + "),code_lookup."+ ls_lu_field + ") , "+   "convert(varchar," + Lower(ls_select_table) + "." + ls_select_field       +")) field_value ,   '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
											ls_syn_parent + ls_link_table + ls_link_table_on +  Lower(ls_select_table) + ls_select_table_on + " left join code_lookup on (convert(varchar," + Lower(ls_select_table) + "." + ls_select_field + ") = convert(varchar,code_lookup.lookup_code)) "						
					end if 
					// Modified by gavins 20161107  CLX need to the function. mail "Next CLX Release"
				Else
					//ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),code_lookup."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from ctx_basic_info,code_lookup," + lower(ls_select_table) +  ls_use_link_sql + " WHERE " + "(convert(varchar," + lower(ls_select_table) + "." + ls_select_field + ") = convert(varchar,code_lookup.lookup_code)) and " 
					ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),code_lookup."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
											ls_syn_parent + ls_link_table + ls_link_table_on +  " ctx_basic_info " + ls_select_table_on + " left join app_facility on(ctx_basic_info.app_facility = app_facility.facility_id) left join code_lookup on (convert(varchar," + lower(ls_select_table) + "." + ls_select_field + ") = convert(varchar,code_lookup.lookup_code)) "			
				End If
			end if
			//---------------------------- APPEON END ----------------------------
			ls_select_field  = "code_lookup_" + ls_lu_field
		elseif Upper(ls_db_lookup_type) = "P" then
			ls_datatype_ctx = of_get_coltype(lds_dataobject,ls_select_field_ctx) //03.25.2011 by jervis

			ll_FRow =  lds_Multi_Fields.Find( "view_id =" + string( ll_view_id ) + " and screen_id = " + string( ll_screen_id ) + " and object_name = '" + ls_select_field + "' and object_format = 'Y'", 1, lds_Multi_Fields.Rowcount( ) )
						
			//Company dddw process--jervis 12.9.2009
			ls_datatype = "C"
			If ll_Frow > 0 Then //Added by gavins 20160322  for mulit - select items  column attribution
				ls_datatype = of_get_coltype(lds_dataobject,ls_select_field_ctx)  
				if Upper(ls_datatype) = "D" then
					ls_field_value = " convert(varchar(16),"+ ls_select_table + "." +ls_select_field + ",120) "
				else
					ls_field_value = " convert(varchar(" + String(li_widthtemp) + "),"+ ls_select_table + "." +ls_select_field + ") "
				end if
				If ls_select_table <> 'app_facility' Then
					//ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(16),"+ ls_select_table + "." +ls_select_field + ",120) field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + Lower(ls_select_table) +  ls_use_link_sql + " WHERE "
					ls_sny_retrieve = ls_sny_retrieve + ls_field_value + " field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
											ls_syn_parent +ls_link_table + ls_link_table_on +   Lower(ls_select_table) + ls_select_table_on
				Else
					//ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(16),"+ ls_select_table + "." +ls_select_field + ",120) field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from ctx_basic_info," + Lower(ls_select_table) +  ls_use_link_sql + " WHERE "
					ls_sny_retrieve = ls_sny_retrieve + ls_field_value + " field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
											ls_syn_parent + ls_link_table + ls_link_table_on +  " ctx_basic_info " + ls_select_table_on + " left join " + Lower(ls_select_table) + " on(ctx_basic_info.app_facility = app_facility.facility_id)"
				End If
			
			Elseif ls_datatype_ctx = 'N' then //Jervis 03.25.2011
				//Added By Mark Lee 03/05/2014 	for  ll_ctx_scrn_id = 2003
				if  ll_ctx_scrn_id = 2003 then 
					ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),app_facility."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
									ls_syn_parent + ls_link_table + ls_link_table_on +  " ctx_basic_info " + ls_select_table_on + " left join app_facility on(" + Lower(ls_select_table) + "." + ls_select_field + " = app_facility.facility_id) "					
				else					
					ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),app_facility."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
									ls_syn_parent + ls_link_table + ls_link_table_on +  Lower(ls_select_table) + ls_select_table_on + " left join app_facility on(" + Lower(ls_select_table) + "." + ls_select_field + " = app_facility.facility_id) "
				end if									
			else
				ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),app_facility."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
									ls_syn_parent + ls_link_table + ls_link_table_on +  Lower(ls_select_table) + ls_select_table_on + " left join app_facility on(convert(varchar," + Lower(ls_select_table) + "." + ls_select_field + ") = convert(varchar,app_facility.facility_id)) "
			end if
			ls_select_field  = "app_facility_" + ls_lu_field
		ElseIf Upper(ls_db_lookup_type)  = "A" Then //address lookup table		
			If ls_lu_field = "description"  Then
				gnv_debug.of_output(true, 'Alarm  Export:' +  "The address lookup field set for export field '" + ls_select_field + "' is improperly set" ) //added by gaivns 20120912
				MessageBox("Data Error on field " + ls_export_field,"The address lookup field set for export field '" + ls_select_field + "' is improperly set.  You cannot use description, try entity_name.  Please correct.")
				Close(w_export_progress)
				
				Destroy lds_export_flds
				Destroy lds_export_hdr
				Destroy lds_address_lookup
				Destroy lds_code_lookup
				Destroy lds_export_equiv_code
				Destroy lds_dataobject
				Destroy lds_linkto
				Destroy lds_field
				Destroy lds_export_dataTemp
				Destroy lds_tablepk
				Destroy lds_export_data
				if isvalid(lds_Multi_Fields) then Destroy lds_Multi_Fields
				//<del> 2008-05-04 by:nova
				//end of add
				//$<add> 01.07.2008 by: Andy
				//if lb_ASA7 then gnv_appeondb.of_commitqueue( )
				Return 0
				
			Else
				If Upper(ls_lu_field) = "LOOKUP_CODE" Then
					ls_datatype = "N"
				ElseIf Upper(ls_lu_field) = "CUSTOM_1" Or Upper(ls_lu_field) = "CUSTOM_2" Then //maha 050704 
					ls_datatype = "N"
				Else
					ls_datatype = "C"
				End If
				
				//ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),address_lookup."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from address_lookup," + Lower(ls_select_table) +  ls_use_link_sql + " WHERE " + "(convert(varchar," + Lower(ls_select_table) + "." + ls_select_field + ") = convert(varchar,address_lookup.lookup_code)) and "
				ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + "),address_lookup."+ ls_lu_field + ") field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
										ls_syn_parent +  ls_link_table + ls_link_table_on +  Lower(ls_select_table) + ls_select_table_on + " left join address_lookup on (convert(varchar," + Lower(ls_select_table) + "." + ls_select_field + ") = convert(varchar,address_lookup.lookup_code)) "

				ls_select_field  = "address_lookup_" + ls_lu_field
			End If
		ElseIf ls_db_lookup_type = "X" Then //ToDo:
			ls_datatype = ldwc_dddw.Describe( ls_lu_field + ".coltype")
			Choose Case Left ( ls_datatype , 5 )
				Case "char(", "char"
					ls_datatype = "C"
				Case "date"	,"datet"	,"time", "times"
					ls_datatype = "D"
				Case "decim","numbe", "doubl", "real","long", "ulong", "int"
					ls_datatype = "N"
			End Choose
			
			//Begin - Added By Mark Lee 03/06/2014
			if ll_ctx_scrn_id = 51 and ( lower(ls_select_field) = 'received_by' or lower(ls_select_field) = 'doc_from_name' ) then 
				ls_field_value = " convert(varchar(" + String(li_widthtemp) + ")," + & 
									" case when "+ls_select_field+" is null then null when isnumeric("+ls_select_field+") = 1 then (SELECT top 1 " + &
									" name = last_name + ',' + first_name + (CASE WHEN middle_name IS NULL or rtrim(middle_name) = '' THEN '' ELSE ','+middle_name END) " + &
    									" FROM ctx_contacts WHERE ctx_contacts.contact_id = convert(int,"+ls_select_table+"."+ls_select_field+" ) )  else "+ls_select_field+" end " + &
										 ")"
				ls_sny_retrieve = ls_sny_retrieve + ls_field_value+ " field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
										ls_syn_parent + ls_link_table + ls_link_table_on +  Lower(ls_select_table) + ls_select_table_on 			
			else						
				If Upper(ls_datatype) = 'D' Then
					ls_field_value = " convert(varchar(16)," + ls_dddwtable + "."+ ls_dddw_column_dbname + ",120)"
				else
					ls_field_value = " convert(varchar(" + String(li_widthtemp) + ")," + ls_dddwtable + "."+ ls_dddw_column_dbname + ")"
				end if
				
				//ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(16)," + ls_dddwtable + "."+ ls_dddw_column_dbname + ",120) field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + ls_dddwtable + "," + &
				//		Lower(ls_select_table) +  ls_use_link_sql + " WHERE " + "(" + Lower(ls_select_table) + "." + &
				//		ls_select_field + " = " + ls_dddwtable + "." + ls_dddwdata + ") and "
				ls_sny_retrieve = ls_sny_retrieve + ls_field_value+ " field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
										ls_syn_parent + ls_link_table + ls_link_table_on +  Lower(ls_select_table) + ls_select_table_on + &
										" left join " +ls_dddwtable + " on(" + Lower(ls_select_table) + "." +	ls_select_field + " = " + ls_dddwtable + "." + ls_dddwdata + ") "
				ls_select_field  = ls_dddwtable + "_" + ls_dddw_column_dbname
			end if
			//End - Added By Mark Lee 03/06/2014
		Else // NON LOOKUP FIELDS
			ls_datatype = of_get_coltype(lds_dataobject,ls_select_field_ctx) //03.17.2009 by jervis
						
			If IsNull(ls_datatype) Then MessageBox("Datatype Not Anticipated","Retrieved null datatype")
			
			If Len(ls_aggre) > 0 Then //maha 012703 for aggregate functions
				//ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + ")," + ls_aggre + "("	+ ls_select_table + "." + ls_select_field + ")) field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + Lower(ls_select_table) +  ls_use_link_sql + " WHERE "
				ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(" + String(li_widthtemp) + ")," + ls_aggre + "("	+ ls_select_table + "." + ls_select_field + ")) field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
										ls_syn_parent + Lower(ls_select_table) + ls_select_table_on
			Else
				if Upper(ls_datatype) = "D" then
					ls_field_value = " convert(varchar(16),"+ ls_select_table + "." +ls_select_field + ",120) "
				else
					ls_field_value = " convert(varchar(" + String(li_widthtemp) + "),"+ ls_select_table + "." +ls_select_field + ") "
				end if
				If ls_select_table <> 'app_facility' Then
					//ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(16),"+ ls_select_table + "." +ls_select_field + ",120) field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + Lower(ls_select_table) +  ls_use_link_sql + " WHERE "
					ls_sny_retrieve = ls_sny_retrieve + ls_field_value + " field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
											ls_syn_parent +ls_link_table + ls_link_table_on +   Lower(ls_select_table) + ls_select_table_on
				Else
					//ls_sny_retrieve = ls_sny_retrieve + " convert(varchar(16),"+ ls_select_table + "." +ls_select_field + ",120) field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from ctx_basic_info," + Lower(ls_select_table) +  ls_use_link_sql + " WHERE "
					ls_sny_retrieve = ls_sny_retrieve + ls_field_value + " field_value,  '" + ls_datatype + "' field_data_type" + ls_RowNoSyn + " from " + &
											ls_syn_parent + ls_link_table + ls_link_table_on +  " ctx_basic_info " + ls_select_table_on + " left join " + Lower(ls_select_table) + " on(ctx_basic_info.app_facility = app_facility.facility_id)"
				End If
			End If
		End If
		
		//export_fields_use_link  sql
		If li_use_link = 1 Then
			//If Upper(ls_db_lookup_type) = "A" Or Upper(ls_db_lookup_type) = "C" Then
			If Upper(ls_db_lookup_type) = "A" Or Upper(ls_db_lookup_type) = "C" or Upper(ls_db_lookup_type) = "X" or Upper(ls_db_lookup_type)  = 'R' Then
			Else
				ls_select_field = ls_select_table_trim + "_" + ls_select_field
			End If
		End If

		//If ls_select_table <> 'app_facility' Then
			//modify 08/15/2007 by: Andy
			If ai_type = 1 Then
				//ls_sny_retrieve = ls_sny_retrieve + ls_usetable + ".ctx_id  = bb.ctx_id "  + ls_filter
				ls_sny_retrieve = ls_sny_retrieve + ", (" + ls_prac_sql + ") bb where " + ls_ctx_table + ".ctx_id  = bb.ctx_id and bb.ctx_id > 0 "  + ls_other_where + ls_filter	//jervis 08.26.2009 add bb.ctx_id > 0
			ElseIf ai_type = 3 Then
				//ls_sny_retrieve = ls_sny_retrieve + ls_usetable + ".ctx_id " + ls_prac_ids + ls_filter
				ls_sny_retrieve = ls_sny_retrieve + " where " + ls_ctx_table + ".ctx_id " + ls_prac_ids + ls_other_where + ls_filter
			ElseIf ai_type = 2 Then
				If lb_usingdb Then
					ls_sny_retrieve = ls_sny_retrieve + " Inner Join ic_client_data on (" + ls_ctx_table + ".ctx_id = ic_client_data.data_int and ic_client_data.client_id = '"+ls_client_id+"' ) where 1 = 1 "  + ls_other_where + ls_filter
				Else
					ls_sny_retrieve = ls_sny_retrieve + " where " + ls_ctx_table + ".ctx_id  in (" + ls_prac_ids  + ")"  + ls_other_where + ls_filter
				End If
				
			End If
			//end of modify
		/*
		Else
			//------------------Begin Modified by Alfee on 08.18.2008------------------------------------
			//<$Reason>Fix a bug of duplicate records while 2 or more contracts have the same company 
			If ai_type = 1 Then
				ls_sny_retrieve = ls_sny_retrieve + " ctx_basic_info.app_facility = app_facility.facility_id and ctx_basic_info.ctx_id = bb.ctx_id and " + Lower(ls_select_table) + ".facility_id in (select ctx_basic_info.app_facility from ctx_basic_info where ctx_basic_info.ctx_id  = bb.ctx_id )"  + ls_filter
			ElseIf ai_type = 3 Then
				ls_sny_retrieve = ls_sny_retrieve + " ctx_basic_info.app_facility = app_facility.facility_id and ctx_basic_info.ctx_id " + ls_prac_ids + " and " + Lower(ls_select_table) + ".facility_id in (select ctx_basic_info.app_facility from ctx_basic_info where ctx_basic_info.ctx_id " + ls_prac_ids  + " )"  + ls_filter
			ElseIf ai_type = 2 Then
				ls_sny_retrieve = ls_sny_retrieve + " ctx_basic_info.app_facility = app_facility.facility_id and ctx_basic_info.ctx_id in (" + ls_prac_ids + ") and " + Lower(ls_select_table) + ".facility_id in (select ctx_basic_info.app_facility from ctx_basic_info where ctx_basic_info.ctx_id  in (" + ls_prac_ids  + "))"  + ls_filter
			End If
			//------------------End Modified -------------------------------------------------------------							
		End If
		*/
		
		//---------Begin added by Harry 2017-04-17 for task747--------
		if Len(ls_otherfilter) > 0 then
			ls_sny_retrieve = ls_sny_retrieve + ls_otherfilter
		end if
		//---------End Added ------------------------------------------------------
		
		//2nd last add  - prac where
		If Len(ls_aggre) > 0 Then //maha 012703 for aggregate functions
			//modify 08/15/2007 by: Andy
			ls_sny_retrieve = ls_sny_retrieve + " Group by " + ls_ctx_table + ".ctx_id , FieldSeqID ,  field_data_type" + ls_RowNo
		End If
		
		//modify 08/23/2007 by: Andy
		If Len(ls_sort) > 0 And Not lb_true Then//SQL2000 only 
			//ls_sny_retrieve = ls_sny_retrieve + "~r~n order by " + ls_sort 
			ls_sny_retrieve = ls_sny_retrieve + "~r~n " + ls_sort
		End If
		//end of modify
		
		//modify 05/05/2008 by: Andy
		ls_sny_retrieve = ls_sny_retrieve + " ) t" + String(ll_FieldSeqID)
		
		//Added By Jay Chen 07-09-2014 remark:validate field sql syntax
		if abn_validate_field_sql then
			ls_sqlerrtext = ''	
			ls_parsesql = "set parseonly on " + ls_sny_retrieve 
			EXECUTE Immediate :ls_parsesql Using Sqlca;
			ls_sqlerrtext = Sqlca.sqlerrtext
			ls_parseoff = "set parseonly off "  
			EXECUTE Immediate :ls_parseoff Using Sqlca;
			if isnull(ls_sqlerrtext) then ls_sqlerrtext = ''
			if ls_sqlerrtext <> '' then
				gnv_debug.of_output(true, 'Validate export setting: the setting for the export column ' + ls_name + ' is invalid. ' + ls_sny_retrieve) //Added By Jay Chen 07-14-2014
				MessageBox("Validate export setting",'The setting for the export column "' + ls_name + '" is invalid. Please check and correct it.')
				gnv_Status_Info.of_display("")
				if isvalid(w_export_painter) then
					ll_err_column_row = w_export_painter.tab_1.tabpage_field_data.dw_fld_list.find("export_field_name = '"+ls_name+"'",1,w_export_painter.tab_1.tabpage_field_data.dw_fld_list.rowcount())
					if isnull(ll_err_column_row) then ll_err_column_row = 0
					if ll_err_column_row > 0 then
						w_export_painter.tab_1.tabpage_field_data.dw_fld_list.ScrollToRow(ll_err_column_row)
					end if
				end if
				return -1				
			end if
		end if
		//end add
		
		//Added By Jay Chen 07-09-2014	
		if is_get_export_field = '1' and ids_document_export_field.rowcount() > 0  then
			ll_find = ids_document_export_field.find("lower(export_field) = '"+lower(ls_name)+"'",1, ids_document_export_field.rowcount())
			if isnull( ll_find) then ll_find = 0
			if ll_find < 1 then continue
		end if
		//end add
	
		If IsNull(ls_sny_retrieve) Then ls_sny_retrieve = ""
		If Len(ls_sny_retrieve) > 0 Then
			If ls_UnionSQL = "" Then
				ls_UnionSQL = ls_sny_retrieve
			Else
				ls_UnionSQL = ls_UnionSQL + "~r~n union all ~r~n" + ls_sny_retrieve
			End If
		End If
		//<add> andy 2007.05.25 
	Else //computer fields
		//Dynamic create computer columns in order to Calculate its value
		/*1.deal with Expression**************/
		ls_export_field     = lds_export_flds.GetItemString(p,"export_field_name")
		//Added By Jay Chen 10-15-2014
		if is_get_export_field = '1' and ids_document_export_field.rowcount() > 0  then
			ll_find = ids_document_export_field.find("lower(export_field) = '"+lower(ls_export_field)+"'",1, ids_document_export_field.rowcount())
			if isnull( ll_find) then ll_find = 0
			if ll_find < 1 then continue
		end if
		//end
		//<add> 08/24/2007 by: Andy
		of_replacespecchar(ls_export_field)
		//end of add
		ls_Expresstion      = Trim( lds_export_flds.GetItemString( p, "export_fields_expression" ) )//db_field_name
		ls_ComputerDataType = lds_export_flds.GetItemString(p,"ctx_column_datatype")
		If IsNull(ls_export_field) Then ls_export_field = ''
		If IsNull(ls_Expresstion) Then ls_Expresstion = ''
		If IsNull(ls_ComputerDataType) Then ls_ComputerDataType = ''
		If IsNull(ls_field_format) Then ls_field_format = ''
		If IsNull(ls_fld_delim) Then ls_fld_delim = ''
		ll_Cnt = lds_field.RowCount()
		
		//If the computer field is numeric,add the function number(  ) in to the Expresstion.
		//Replace symbol ' with "
		//comment 07/18/2007 by:Andy Reason:support other data type
		//if upper(ls_ComputerDataType) = 'N' then
		For ll_Num = 1 To ll_Cnt
			ls_Field         = lds_field.GetItemString(ll_Num,"export_field_name")
			ls_FieldDataType = lds_field.GetItemString(ll_Num,"ctx_column_datatype")
			If IsNull(ls_Field) Then ls_Field = ''
			If IsNull(ls_FieldDataType) Then ls_FieldDataType = ''
			//<add> 07/27/2007 by: Andy 
			//Reason:The Expresstion of a computer field cann't contain itself.
			If Lower(ls_export_field) = Lower(ls_Field) Then Continue
			//end of add
			
			//If the field used in then computer field and is number, 
			//add the function number(  ) in to the Expresstion 
			//Modify 07/18/2007 by: Andy
			If Pos(Lower(ls_Expresstion),Lower(ls_Field)) > 0 Then
				If Upper(ls_FieldDataType) = 'N' Then
					//Modify 07/17/2007 by: Andy if( isNull( rec_id  ), 0,  rec_id  )
					ls_Expresstion  = of_globalreplace( ls_Expresstion, ls_Field, "if( isNull( "+ls_Field+" ),0,number( " + ls_Field + " ))",True)
					//end of modify
				ElseIf Upper(ls_FieldDataType) = 'S' Then
					//string
					ls_Expresstion  = of_globalreplace( ls_Expresstion, ls_Field, "if( isNull( "+ls_Field+" ),''," + ls_Field + " )",True)
					//<add> 07/27/2007 by: Andy	
				ElseIf Upper(ls_FieldDataType) = 'D' Then
					//Datetime
					ls_Expresstion  = of_globalreplace( ls_Expresstion, ls_Field, "if( isNull( "+ls_Field+" ),'1900-01-01'," + ls_Field + " )",True)
					//end of add	
				End If
			End If
			//end of Modify
		Next
		//end if
		
		//replace symbol ' with "
		ls_Expresstion  = lnvo_string.of_globalreplace( ls_Expresstion, '~~', '~~~~')
		ls_Expresstion  = lnvo_string.of_globalreplace( ls_Expresstion, '"', '~~"') //'"'
		//ls_Expresstion  = lnvo_string.of_globalreplace( ls_Expresstion, "'", "~~'")//'"'
		/*end of 1***************************/
		
		//Modify By Jervis 01.18.2010
		//Tab and ~ exists bug
		//ls_tag = ls_field_format + '@^@' + ls_ComputerDataType + '@^@' + String(li_width) + '@^@' + ls_fld_delim
		ls_tag = ls_field_format + '@^@' + ls_ComputerDataType + '@^@' + String(li_width) + '@^@'
		If ls_field_format = "Leading Padding" Or ls_field_format = "Trailing Padding" Then
			ls_tag += ls_fld_delim
		end if
		//2.Dynamic create computer columns,the name equal ls_Field + '_c'
		ls_Modify = "create compute(band=detail alignment='0' expression=~""+ls_Expresstion+"~" border='0' color='33554432' x='1157'" + &
			" y='4' height='64' width='242' format='[GENERAL]' html.valueishtml='0'  name=" + ls_export_field + "_c visible='0'" + &
			" font.face='MS Sans Serif' font.height='-8' font.weight='400'  font.family='2' font.pitch='2' font.charset='0'" + &
			" background.mode='1' background.color='536870912' tag='" + ls_tag + "' )"
		ls_Err    = lds_export_dataTemp.Modify(ls_Modify)
		//end of 2		
		//end of add
	End If
Next

//Added By Jay Chen 07-09-2014 remark:validate field sql syntax
if abn_validate_field_sql then  
	MessageBox("Validate export setting","The settings for this export are correct.")
	gnv_Status_Info.of_display("")
	return 1
end if
//end add

//<del> 2008-05-04 by:nova
//<add> 08/23/2007 by: Andy
//if lb_ASA7 then gnv_appeondb.of_commitqueue( )

w_export_progress.hpb_bar.Position = 15
//w_export_progress.r_bar.Width = w_export_progress.r_bar.Width + 50
w_export_progress.st_export.Text = "Retrieve Data"

ll_FieldCnt = ll_FieldSeqID
If ls_UnionSQL <> "" Then
	//Modify 08/23/2007 by: Andy
	If lb_true Then//SQL2005 and ASA9
		ls_UnionSQL = ls_UnionSQL + "~r~n order by " + "FieldSeqID, ctx_id , Row_No"
	End If
	
	
	//<add> 08/24/2007 by: Andy
	If lb_true Then ls_RowNo = ", 0 Row_No"//SQL2005 AND ASA9
	ls_SqlSelect = "Select top 1 0 prac_id, 1 FieldSeqID,   cast('' as varchar(" + String(ll_maxwidth) + ")) field_value,  ' ' field_data_type" + ls_RowNo + " from pd_basic"
	
	
	ls_dwsyntax_str = SQLCA.SyntaxFromSQL(ls_SqlSelect, ls_presentation_str, Errors)
	If Len(Errors) > 0 Then
		gnv_debug.of_output(true, 'Alarm  Export:' +  "SyntaxFromSQL caused these errors: " + Errors + "~r~r" + ls_SqlSelect  ) //added by gaivns 20120912
		// + ls_export_field
		MessageBox("Caution on export field ", &
			"SyntaxFromSQL caused these errors: " + Errors + "~r~r" + ls_SqlSelect)
		Close(w_export_progress)
		Destroy lds_export_flds
		Destroy lds_export_hdr
		Destroy lds_address_lookup
		Destroy lds_code_lookup
		Destroy lds_export_equiv_code
		Destroy lds_dataobject
		Destroy lds_linkto
		Destroy lds_field
		Destroy lds_export_dataTemp
		Destroy lds_tablepk
		Destroy lds_export_data
		if isvalid(lds_Multi_Fields) then Destroy lds_Multi_Fields
		//end of add
		Return -1
	End If
	
	lds_export_retrieve = Create n_ds
	w = lds_export_retrieve.Create( ls_dwsyntax_str, Errors)
	If w < 1 Then
		//messagebox("error on create",errors)
		gnv_debug.of_output(true, 'Alarm  Export:' +  "lds_export_retrieve create  errors: " + Errors  + '~r' + ls_SqlSelect   ) //added by gaivns 20120912
				MessageBox("Error on Create",Errors)
		Close(w_export_progress)
		Destroy lds_export_flds
		Destroy lds_export_hdr
		Destroy lds_address_lookup
		Destroy lds_code_lookup
		Destroy lds_export_equiv_code
		Destroy lds_dataobject
		Destroy lds_linkto
		Destroy lds_field
		Destroy lds_export_dataTemp
		Destroy lds_tablepk
		Destroy lds_export_data
		if isvalid(lds_Multi_Fields) then Destroy lds_Multi_Fields
		//end of add
		Return -1
	End If
	
	//Modify 08/23/2007 by: Andy
	lds_export_retrieve.Modify('DataWindow.Table.Select="' + ls_UnionSQL + '"')
	
	
	lds_export_retrieve.SetTransObject( SQLCA )
	ll_ret_cnt = lds_export_retrieve.Retrieve()
	
	//<add> 05/05/2008 by: Andy
	If ll_ret_cnt < 0 Then
		
		gnv_debug.of_output(true, 'Alarm  Export:' +  "lds_export_retrieve retrieve<0 " + '~r' + ls_UnionSQL  ) //added by gaivns 20120912
		//Reason:check syntax
		ls_presentation_str = "style(type=grid)"
		
		ls_dwsyntax_str = SQLCA.SyntaxFromSQL(ls_UnionSQL, ls_presentation_str, Errors)
		If Len(Errors) > 0 Then
			gnv_debug.of_output(true, "Caution on export: " + "SyntaxFromSQL caused these errors: " + Errors)    //Added By Mark Lee 02/01/2013
			//Added By Jay Chen 07-10-2014
			ll_pos_select = pos(Errors,'select')
			if ll_pos_select > 0 then ls_message_err = left(Errors,ll_pos_select - 1)
			//end
//			MessageBox("Caution on export" , "The settings for the export " +  ls_export_name + " are incorrect. Please go to the Export Painter and correct them. ~r" + "SyntaxFromSQL caused these errors: " + Errors) //Modified By Jay Chen 07-09-2014
			MessageBox("Caution on export" , "The settings for the export " +  ls_export_name + " are incorrect. Please go to the Export Painter and use the validate function to find out the cause and correct it. ~r" + "SyntaxFromSQL caused these errors: " + ls_message_err) //Modified By Jay Chen 07-09-2014
			Close(w_export_progress)
			If IsValid(lds_export_flds) Then Destroy lds_export_flds
			If IsValid(lds_export_hdr) Then Destroy lds_export_hdr
			If IsValid(lds_address_lookup) Then Destroy lds_address_lookup
			If IsValid(lds_code_lookup) Then Destroy lds_code_lookup
			If IsValid(lds_export_data) Then Destroy lds_export_data
			If IsValid(lds_field) Then Destroy lds_field
			If IsValid(lds_export_dataTemp) Then Destroy lds_export_dataTemp
			If IsValid(lds_export_equiv_code) Then Destroy lds_export_equiv_code
			Destroy lds_tablepk
			if isvalid(lds_Multi_Fields) then Destroy lds_Multi_Fields
			Return -1
		End If
	End If
	//end of add
End If

w_export_progress.hpb_bar.Position = 20
//Modify 08/22/2007 by: Andy
//li_bar_ticks = 70 / li_prac_id_cnt
li_bar_ticks = 70 / li_fld_cnt

//%%%%%%%%%%%%%%%%%%%%%%%%%%%% end of create syntax
//Begin - Modified By Mark Lee 09/29/2013 add the abn_update_sqltext condition.
if abn_update_sqltext = false then 		
	ls_prac_field = lds_export_retrieve.Describe("#1.name")
	
	Do While (ll_i <= ll_ret_cnt)
	
		ll_j = 0
		ls_data_value = ""
		ls_value = ""
		ls_lookup_val = ""
		ldt_value = DateTime(Date("0000-00-00"),Time("00:00:00"))
		
		ll_pracid       = lds_export_retrieve.GetItemNumber(ll_i,ls_prac_field)
		ll_FieldSeqID   = lds_export_retrieve.GetItemNumber(ll_i,"FieldSeqID")
		li_recd_no      = li_recdnoList[ll_FieldSeqID]
		//add 08/22/2007 by: Andy
		ls_select_table = ls_tablelist[ll_FieldSeqID]
		ls_select_field = ls_selectfieldlist[ll_FieldSeqID]
		ls_export_field = ls_fieldlist[ll_FieldSeqID]
		ls_field_format = ls_formatList[ll_FieldSeqID]
		ll_export_code  = ll_exportcodeList[ll_FieldSeqID]
		//<add> 08/21/2007 by: Andy
		li_sub_start    = li_substartList[ll_FieldSeqID]
		//end of add
		li_width        = li_widthList[ll_FieldSeqID]
		ls_fld_delim    = ls_flddelimList[ll_FieldSeqID]
		ls_text         = ls_textList[ll_FieldSeqID]
		ls_lu_field     = ls_lu_fieldList[ll_FieldSeqID]
		li_act_format   = li_act_formatList[ll_FieldSeqID]
		
		ud = li_udList[ll_FieldSeqID]
		If ud = 1 Then
			ls_def_val = ls_defvalList[ll_FieldSeqID]
		ElseIf ud = 2 Then //column default
			col = Long(ls_defvalList[ll_FieldSeqID])
		ElseIf ud = 4 Then
			ls_def_val = ls_defvalList[ll_FieldSeqID]
		Else
			ls_def_val = ""
		End If
		
		//Modify 08/22/2007 by: Andy
		If ll_FieldSeqIDold <> ll_FieldSeqID Then
			ll_R = 0
			//ll_R = lds_export_data.Find("rec_id= " + String(ll_pracid),ll_R + 1,li_prac_id_cnt)
			ll_FieldSeqIDold = ll_FieldSeqID
			w_export_progress.st_export.Text  = ls_select_table + "_" + ls_select_field //string(ll_FieldSeqID) + "   " + 
			w_export_progress.st_export1.Text = ls_select_field
			
			//if mod(ll_R,n) = 0 then
			If Mod(ll_FieldSeqID,n) = 0 Then
				w_export_progress.hpb_bar.Position = w_export_progress.hpb_bar.Position + 1
			End If
			//ll_Rorig = ll_R
		End If
		
		//MODIFY 10/12/2007 by:Andy
		//ll_R = lds_export_data.Find("rec_id= " + String(ll_pracid),ll_R + 1,li_prac_id_cnt)
		For ll_R = ll_R + 1 To li_prac_id_cnt
			If al_ctx_ids[ll_R] = ll_pracid Then Exit
		Next
		//end of modify
		
		//<ADD> 07/12/2007 by: Andy Find the max row of the current ll_FieldSeqID
		//modify 08/22/2007 by: Andy Find the max row of the current ll_pracid
		ls_find = "(" + ls_prac_field + " > " + String(ll_pracid) + " AND FieldSeqID = " + String(ll_FieldSeqID) + &
			") OR ( FieldSeqID  > " + String(ll_FieldSeqID) + ")"
		ll_j    = lds_export_retrieve.Find ( ls_find, ll_i + 1, ll_ret_cnt )
		If ll_j > 0 Then
			//The max row of the current FieldSeqID
			ll_j = ll_j - 1
		End If
		
		//Perhaps it is the last ll_pracid and it is the max FieldSeqID,
		//then set ll_j = ll_ret_cnt(max row in the ds)
		If ll_j = 0 Then
			ll_j = ll_ret_cnt
		End If
		
		//max - min + 1 = total(current FieldSeqID)
		If ll_j - ll_i + 1 >= li_recd_no Then
			//find out
			ll_prac_row = ll_i + li_recd_no - 1
		Else
			//Not 
			ll_prac_row = 0
		End If
		//END OF addd
		
		//process data
		If ll_prac_row > 0 Then
			ls_datatype     = lds_export_retrieve.GetItemString(ll_prac_row, "field_data_type" )
			
			//if li_billing = 1 then //maha app080205 to get billing address data 
			//	ll_billing_id   = lds_export_retrieve.getitemnumber(ll_prac_row, "billing_address_id" )
			//	ls_data_value = of_get_billing(ll_billing_id,ls_datatype,ls_select_field,ls_field_format,ls_billsynList[ll_FieldSeqID])//ls_bill_syn
			//else
			ls_data_value = lds_export_retrieve.GetItemString(ll_prac_row, "field_value")
			//end if
		Else
			//do nothing
		End If
		
		//comment 08/24/2007 by: Andy
		//ls_export_field = lnvo_string.of_globalreplace( ls_export_field, "#", "_")
		//<add> andy 07.05.2007 save original values
		If Lower(lds_export_dataTemp.Describe(ls_export_field + ".name")) = Lower(ls_export_field) Then
			lds_export_dataTemp.SetItem(ll_R,ls_export_field,ls_data_value)
		End If
		//end of add
		
		If ls_format = "export" Then
			If IsNull(ls_data_value) Then ls_data_value = ""
		End If
		
		//<add> 08/28/2007 by: Andy
		of_data_format(ls_field_format,ls_datatype,ls_data_value)
		//end of add
		
		
		//$<add> 05.29.2007 By: Jack
		//$<reason> Fix a defect.
		If ls_lu_field = 'contact_department' Or ls_lu_field = 'contact_title' Or ls_lu_field = 'contact_type' Then
			//modify 09/05/2007 by: Andy Reason:get description
			//ls_data_value = gnv_data.of_getitem('code_lookup', 'code', "lookup_code = " + ls_data_value)
			ls_data_value = gnv_data.of_getitem('code_lookup', 'description', "lookup_code = " + ls_data_value)
		End If
		
		//*****GET EXPORT CODES
		//if lds_export_flds.GetItemnumber( p, "export_code" )  = 1 then //get export code if required
		If ll_export_code  = 1 Then //get export code if required
			ls_lookup_val = ls_data_value    //lds_export_data.getitemstring(i,p) //changed 100102
			If IsNull(ls_lookup_val) Then ls_lookup_val = ''
			
			//Convert data type - jervis 03.25.2011
			if isnumber(ls_lookup_val) then 
				ls_lookup_code = string(long(ls_lookup_val))
			else
				ls_lookup_code = ls_lookup_val
			end if
			//ll_find = lds_export_equiv_code.Find( "export_id = " + String(ai_export_id) + " and lookup_code = " + ls_lookup_val, 1, ll_rowcount2 )
			ll_find = lds_export_equiv_code.Find( "export_id = " + String(ai_export_id) + " and (string(lookup_code) = '" + ls_lookup_code + "' or code = '" + string(ls_lookup_val) + "')", 1, ll_rowcount2 ) //Add code -- jervis 03.25.2011
			
			
			If ll_find > 0 Then
				ls_value = lds_export_equiv_code.GetItemString(ll_find,'equiv_code')
			End If
			
			If Not IsNull(ls_value) And Trim(ls_value) <> '' Then ls_data_value = ls_value //if no export code use org value
			If IsNull(ls_data_value) Then ls_data_value = ""
		End If
		
		
		
		//<add> 08/22/2007 by: Andy
		If ls_strip_char <> "NONE" Then
			ls_data_value = of_strip_char( ls_strip_char ,ls_data_value, "")
		End If
		
		//*** substring function***************************8
		//create datafield for substring_start
		//<add> 08/21/2007 by: Andy
		If li_sub_start > 1 Then ls_data_value = Mid(ls_data_value,li_sub_start,li_width)
		//end of add
		//***padding //note if avoid using return, double return, empty string or tab when padding
		ls_data_value = Mid(ls_data_value,1,li_width) //shrink the length to size 
		If ls_field_format = "Leading Padding" Or ls_field_format = "Trailing Padding" Then
			If li_width - Len(ls_data_value) > 0 Then
				li_dif = li_width - Len(ls_data_value)
				ls_pad = "" //reset
				ls_pad = Fill ( ls_fld_delim, li_dif )
				If ls_field_format = "Leading Padding" Then
					ls_data_value = ls_pad + ls_data_value
				Else
					ls_data_value = ls_data_value + ls_pad
				End If
			End If
		ElseIf ls_field_format = "use text" Then //allows a set value if data is found
			If Len(ls_data_value) > 0 Then
				ls_data_value = ls_text
			End If
		End If
		
		//****set default moved here 091305
		If ud > 0 Then
			If IsNull(ls_data_value) Then ls_data_value = ""
			
			If ls_data_value = ""  Then
				If ud = 1 or ud = 4 Then
					of_data_format(ls_field_format,ls_datatype,ls_def_val)  //added by gavins 20151112
					ls_data_value = ls_def_val
					
				ElseIf ud = 2 Then //if set to column get the value out of that column
					If col < 1 Or col > li_fld_cnt Then //setting trap
						gnv_debug.of_output(true, 'Alarm  Export:' +  "You are using a column default for column " + ls_export_field + " , but your default value is not a valid column number.~rThe default column number must be less than this column." ) //added by gaivns 20120912
						MessageBox("Invalid setting","You are using a column default for column " + ls_export_field + " , but your default value is not a valid column number.~rThe default column number must be less than this column.")
						Close(w_export_progress)
						Destroy lds_export_flds
						Destroy lds_export_hdr
						Destroy lds_address_lookup
						Destroy lds_code_lookup
						Destroy lds_export_equiv_code
						Destroy lds_dataobject
						Destroy lds_linkto
						Destroy lds_field
						Destroy lds_export_dataTemp
						Destroy lds_tablepk
						Destroy lds_export_data
						if isvalid(lds_Multi_Fields) then Destroy lds_Multi_Fields
						//end of add
						Return 0
					End If
					ls_data_value = lds_export_data.GetItemString(ll_R,col)
				End If
			End If
		End If
		
		//*********value set**********	
		If li_fld_cnt = 1 Then ls_data_value = ls_data_value + Char(9)
		If Lower(lds_export_data.Describe(ls_export_field + ".name")) = Lower(ls_export_field) Then
			//Begin - Added By Mark Lee 09/29/12 its cannot use double quote to merge data values in  the MS word.
			If Pos(ls_data_value,'"') > 0 Then 
				gnv_debug.of_output(true, 'Alarm  Export: Its used the double quote Replace the blank data in merged data value on the column ['+ls_export_field+'], and this current data value is the ['+ls_data_value+'].' )
				ls_data_value  = lnvo_string.of_globalreplace( ls_data_value, '"', ' ')
			End If
			//End - Added By Mark Lee 09/29/12
			lds_export_data.SetItem(ll_R,ls_export_field,ls_data_value)
		End If
		
		//processing the next field(fieldseqid)
		ll_i = ll_j + 1
	Loop
	
	//<add> 08/27/2007 by: Andy process default value
	If of_export_processdefault(lds_export_hdr,lds_export_flds,lds_export_dataTemp,lds_export_data) = -1 Then
		gnv_debug.of_output(true, 'Alarm  Export: of_export_processdefault=-1 ' )//added by gavins 20120912
		Close(w_export_progress)
		Destroy lds_export_flds
		Destroy lds_export_hdr
		Destroy lds_address_lookup
		Destroy lds_code_lookup
		Destroy lds_export_equiv_code
		Destroy lds_dataobject
		Destroy lds_linkto
		Destroy lds_field
		Destroy lds_export_dataTemp
		Destroy lds_tablepk
		Destroy lds_export_data
		if isvalid(lds_Multi_Fields) then Destroy lds_Multi_Fields
		Return 0
	End If
	//end of add
	
	//<add> andy 2007.05.25
	//set Calculated field value and format into lds_export_data 
	//with the relative computer column in lds_export_dataTemp
	//Modify 08/22/2007 by: Andy
	of_export_calculatedfield(lds_export_dataTemp,lds_export_data,ls_format)
	//end of add
	
	w_export_progress.hpb_bar.Position = 94
	
	//Modify 07/18/2007 by: Andy
	//if ai_save_data = 1 then //maha 021003
	//1:save / 3:save & preview
	If ai_save_data = 1 Or ai_save_data = 3 Then
		//end of modify
		w_export_progress.st_progress.Text = "Saving File"
		
		//gnv_appeondb.of_autocommit()
		sd = lds_export_data.Update()
		Commit Using SQLCA;
		
		If sd < 1 Then
			gnv_debug.of_output(true, 'Alarm  Export: lds_export_data update failed ' )//added by gavins 20120912
			MessageBox("Save error","Unable to save data to table")
		End If
	End If
	
	
	//Begin - Added By Mark Lee 07/23/2013. update the sqltext		//Added By Mark Lee 07/21/2016 add the abn_update_sqltext  adjudge
	if abn_update_sqltext = true then of_update_export_sqltext(ai_export_id,ls_prac_sql,ls_UnionSQL)
	//End - Added By Mark Lee 07/23/2013.
	//-----------------------------------------------------------------------/
	ids_export_data = lds_export_data
	If ids_export_data.Rowcount( ) = 0 Then
		gnv_debug.of_output(true, 'Alarm  Export: lds_export_data rowcount()=0 '  )//added by gavins 20120912
	Else
		ib_writefile = true //added by gavins 20121011
	End If
	//-----------------------------------------------------------------------/
	
	w_export_progress.st_progress.Text = "Creating File"
	w_export_progress.hpb_bar.Position = 100
	li_bar_ticks = 75 / li_prac_id_cnt
	n = Int(li_fld_cnt/80) + 1
	//******************************* CREATE FILE
	
	//Modify 08/28/2007 by: Andy
	//If IsNull(as_path) Or as_path = "" Then
	//	If IsNull(ls_save_path) Or ls_save_path = "" Then ls_save_path = gs_dir_path + gs_DefDirName + "\" + ls_table_name
	//Else
	ls_save_path = as_path
	ls_save_path = gnv_string.of_replace_env_var(ls_save_path) //Added By Ken.Guo 12/10/2013
	If Right(ls_save_path,1) = ':' Then ls_save_path = ls_save_path + "\"
	ll_LastPos = LastPos(ls_save_path,'.')
	If ll_LastPos > 0 Then
		ls_save_path = Left(ls_save_path,ll_LastPos - 1)
	End If
	//End If
	
	//--------------------------- APPEON BEGIN ---------------------------
	//$<add> 05.23.2007 By: Jack
	//$<reason> If the directory is not exists Then create it 
	String ls_path1
	If Mid(ls_save_path,Len(ls_save_path),1) = "\" Then
		ls_path1 = ls_save_path
	Else
		ls_path1 = Mid(ls_save_path,1,LastPos(ls_save_path,'\'))
	End If
	//Add By Jervis 11-19-2008
	If ls_path1 = "" Then
		If appeongetclienttype() = 'WEB' Then
			ls_path1 = gs_dir_path + gs_DefDirName + "\ExportData\"
			ls_save_path = ls_path1 + ls_save_path
		Else
			ls_path1 = Gs_Current_Directory + "\ExportData\"
			ls_save_path = ls_path1 + ls_save_path
		End If
	Else
		
		//Added By Ken.Guo 2011-01-11.
		If invo_rights.of_check_dir_right(ls_path1, True,'Export') <> 1 Then
			gnv_debug.of_output(true, 'Alarm  Export: check dir right failed '  + ls_path1 )//added by gavins 20120912
			If isvalid(lds_export_flds) Then Destroy lds_export_flds;
			If isvalid(lds_export_hdr) Then Destroy lds_export_hdr;
			If isvalid(lds_address_lookup) Then Destroy lds_address_lookup;
			If isvalid(lds_code_lookup) Then Destroy lds_code_lookup
			If isvalid(lds_export_equiv_code) Then Destroy lds_export_equiv_code;
			If isvalid(lds_dataobject) Then Destroy lds_dataobject
			If isvalid(lds_linkto) Then Destroy lds_linkto;
			If isvalid(lds_field) Then Destroy lds_field
			If isvalid(lds_export_dataTemp) Then Destroy lds_export_dataTemp
			If isvalid(lds_tablepk) Then Destroy lds_tablepk
			If isvalid(w_export_progress) Then Close(w_export_progress)
			if isvalid(lds_Multi_Fields) then Destroy lds_Multi_Fields
			Return 0
			//ls_path1 = gs_dir_path + gs_DefDirName + "\ExportData\"
			//ls_save_path = ls_path1
		End If
		
	End If
	//End By Jervis 
	
	gnv_appeondll.of_parsepath(ls_path1)
	
	//---------------------------- APPEON END ----------------------------
	
	If Mid(ls_save_path,Len(ls_save_path),1) <> "\" Then //maha app 102405 if a file name is indicated do not tack on the table name
		ls_path = ls_save_path +  ls_format
	Else
		//ls_path = ls_save_path + ls_table_name + ls_format
		If li_custom_save > 0 Then  //maha new 121205 for custom naming of file
			ls_save_name = of_custom_name(li_custom_save,ls_table_name,ldt_date)
		Else
			ls_save_name = ls_table_name
		End If
		ls_path = ls_save_path + ls_save_name + ls_format
	End If
	
	//<add> 08/28/2007 by: Andy 
	as_path = ls_path
	//end of add
	
	//$<modify> 03.20.2008 by Andy
	//If ls_format <> "export" Then  //if the auto export path is blank use the export path, if blank use the hard coded path
	If lb_export = False Then
		//end of modify 03.20.2008
		gnv_rights.of_check_dir_right( ls_path, true, 'Export')
		Choose Case ls_format
			Case ".txt"
				If ls_header = "1" Then
					g = lds_export_data.SaveAs(ls_path,Text!,True)
				Else
					g = lds_export_data.SaveAs(ls_path,Text!,False)
				End If
			Case ".xls"
				If ls_header = "1" Then
					g = lds_export_data.SaveAs(ls_path,excel!,True)
				Else
					g = lds_export_data.SaveAs(ls_path,excel!,False)
				End If
			Case ".csv"
				 //Added By Jay Chen 08-13-2014
				 string ls_new_path
				if AppeonGetClientType() = 'WEB' then
					ll_pos = pos(ls_path,'.csv')
					if ll_pos > 0 then ls_new_path = left(ls_path,ll_pos - 1) + '.xls'
					//1. save as excel first
					If ls_header = "1" Then
						g = lds_export_data.SaveAs(ls_new_path,excel!,True)
					Else
						g = lds_export_data.SaveAs(ls_new_path,excel!,False)
					End If
					//2. convert excel file to csv format file
					if g <> -1 then
						OleObject lole_Excel
						lole_Excel = Create OleObject
						If lole_Excel.ConnectToNewObject( "excel.application" ) = 0 Then
							lole_Excel.WorkBooks.open(ls_new_path)
							lole_Excel.ActiveWorkBook.Saved = true
							if FileExists(ls_path) then FileDelete(ls_path) 
							lole_Excel.ActiveWorkBook.SaveAs(ls_path,6)
							lole_Excel.ActiveWorkBook.close(0)
							FileDelete(ls_new_path) 
						else
							gnv_debug.of_output(True, 'System can not convert xls format to csv format as MS Excel is not correct installed.')
							lb_write_log = false
						end if
						lole_Excel.Quit( )
						lole_Excel.DisConnectObject( )
						Destroy( lole_Excel )
					end if
					//end add
				else
					If ls_header = "1" Then
						g = lds_export_data.SaveAs(ls_path,csv!,True)
					Else
						g = lds_export_data.SaveAs(ls_path,csv!,False)
					End If
				end if
		End Choose
		If g = -1 Then MessageBox("saveas -1","Unable to save file.  Check path (" + ls_path + ") and make sure a copy of the file is not open.")
		if lb_write_log then gnv_debug.of_output(False, 'lds_export_data.SaveAs() = '+String(g)+', Save export data to ' + ls_path + '.') //Modified By Jay Chen 08-14-2014
	Else
		//build export text file
		
		//Added By Mark Lee 08/07/2015
		//PB code: FileWrite sets the file pointer following the last character written. If the file was opened in line mode, FileWrite writes a carriage return (CR) and linefeed (LF) 
		// after the last character in variable and places the file pointer after the CR and LF.
				
		//modify 08/28/2007 by: Andy
		//li_file_num = FileOpen(as_path + ls_table_name + ".txt", lineMode!, Write!, LockWrite!, Replace!)//maha changed to line mode 091002
//		li_file_num = FileOpen(ls_path, lineMode!, Write!, LockWrite!, Replace!)	//maha changed to line mode 091002
		li_file_num = FileOpen(ls_path, TextMode!, Write!, LockWrite!, Replace!)	 
		ls_export_text_file	= ""																						//Added By Mark Lee 08/07/2015
		if ls_rec_delim="~r" then 
			ls_rec_delim="~r~n"
		elseif  ls_rec_delim="~r~r" then 
			ls_rec_delim="~r~n~r~n"			
		end if 
		//end of modify
		w_export_progress.hpb_bar.Position = 10
		For i = 1 To li_prac_id_cnt
			//w_export_progress.hpb_bar.position = w_export_progress.hpb_bar.position + li_bar_ticks
			If Mod(i,n) = 0 Then
				w_export_progress.hpb_bar.Position = w_export_progress.hpb_bar.Position + 1
			End If
			For p = 1 To li_fld_cnt
				ls_data_value = lds_export_data.GetItemString(i,p)
				ls_fld_delim = lds_export_flds.GetItemString( p, "trailing_leading_characters")
				ls_field_format = lds_export_flds.GetItemString(p,"export_format")
				//Added By Jay Chen 03-12-2015
				if isnull(ls_data_value) then ls_data_value = ''
				if isnull(ls_fld_delim) then ls_fld_delim = ''
				//end
				Choose Case ls_fld_delim
					Case "E" //empty String
						ls_delim_value = ""
					Case "S" // space
						ls_delim_value = " "
					Case "T" //tab
						ls_delim_value = "	"
					Case "R" //return
						ls_delim_value = "~r"
					Case "D" //return
						ls_delim_value = "~r~r"
					Case Else
						ls_delim_value = ls_fld_delim
				End Choose
				If IsNull(ls_delim_value) Then ls_delim_value = ""
				If ls_field_format = "Leading Padding" Or ls_field_format = "Trailing Padding" Then //don't add delimit value
					ls_export_text_file = ls_export_text_file + ls_data_value
				Else
					ls_export_text_file = ls_export_text_file + ls_data_value + ls_delim_value
				End If
				
			Next
			
			ls_export_text_file = ls_export_text_file + ls_rec_delim 			//Added By Mark Lee 08/07/2015  add it ("~n")
			p = 1
//			FileWrite ( li_file_num, ls_export_text_file)									//Commented By Mark Lee 08/07/2015
//			ls_export_text_file = ""
		Next
		FileWriteEx(li_file_num, ls_export_text_file)									//Added By Mark Lee 08/07/2015
		FileClose(li_file_num)
		gnv_debug.of_output(False, 'FileWrite() to ' + ls_export_text_file + '.')
	End If
	//--------------------------- APPEON BEGIN ---------------------------
	//$<add> 05.11.2007 By: Jack
	//$<reason> Fix a defect.
	ids_export_data = lds_export_data
	//---------------------------- APPEON END ----------------------------
	
	If is_called_type <> "2" And IsValid(w_export_progress) Then
		w_export_progress.hpb_bar.Position = 100
		If isvalid(w_export_progress) Then Close(w_export_progress)
	End If
	
	//<add> 07/18/2007 by: Andy
	//2:preview / 3:save & rpeview
	If ai_save_data = 2 Or ai_save_data = 3 Then
		lstr_pass.s_string = is_select_syntax
		lstr_pass.s_ds = lds_export_data
		lstr_pass.s_string_array[1] = ls_UnionSQL
		OpenWithParm( w_export_previewdata, lstr_pass )
	End If
	//end of add
	
	
	//$<add> 05.07.2008 by Andy
	If lb_mulsel Then
		ls_MySQL = "DELETE FROM export_temp WHERE SpID = " + String(ll_SpID) + ";"
		Execute Immediate :ls_MySQL;
	End If
else
	//Added By Mark Lee 09/29/2013
	of_update_export_sqltext(ai_export_id,ls_prac_sql,ls_UnionSQL)
end if
//End - Modified By Mark Lee 09/29/2013

If isvalid(lds_export_flds) Then Destroy lds_export_flds;
If isvalid(lds_export_hdr) Then Destroy lds_export_hdr;
If isvalid(lds_address_lookup) Then Destroy lds_address_lookup;
If isvalid(lds_code_lookup) Then Destroy lds_code_lookup
If isvalid(lds_export_equiv_code) Then Destroy lds_export_equiv_code;
If isvalid(lds_dataobject) Then Destroy lds_dataobject
If isvalid(lds_linkto) Then Destroy lds_linkto;
If isvalid(lds_field) Then Destroy lds_field
If isvalid(lds_export_dataTemp) Then Destroy lds_export_dataTemp
If isvalid(lds_tablepk) Then Destroy lds_tablepk
If isvalid(w_export_progress) Then Close(w_export_progress)
if isvalid(lds_Multi_Fields) then Destroy lds_Multi_Fields

Return 1

end function

public function integer of_update_export_data (long al_export_id, str_export_columns astr_export_columns);//====================================================================
// Function: of_update_export_data
//--------------------------------------------------------------------
// Description: Sync columns properties.
//--------------------------------------------------------------------
// Arguments:
//                al_export_id
//                astr_export_columns
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:         Ken.Guo 2016-03-10
//--------------------------------------------------------------------
//Copyright (c) 2008-2015 Contract Logix, Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History:  copy from of_update_export_data(long al_export_id)
//
//====================================================================


n_ds 		ds_export_table_name,	ds_export, ds_export_filter,	ds_contract_screen
long		i , ll_cnt, ll_rowcount, ll_screen_id, ll_view_id, ll_count,	ll_find
String 	ls_table_name, ls_dataobject,  ls_tab_name, ls_view
u_dw 		ldw[]
string 	ls_dw_name[] , ls_dataobjects[]
u_dw		ldw_screen 
Integer 	li_return
string 	 ls_export_name,	ls_err

ls_err =''
li_return = 0
ll_count  = 0 
If isnull(al_export_id) or al_export_id <= 0 Then 
	return -1
End If

ds_export = Create n_ds
ds_export.dataobject = 'ds_export_fields_for_request'
ds_export.settransobject(Sqlca)

ds_export_filter = Create n_ds
ds_export_filter.dataobject = 'ds_export_fields_for_request'
ds_export_filter.settransobject(Sqlca)

ds_export_table_name = Create n_ds
ds_export_table_name.dataobject = 'd_ctx_screen_for_export_fields'
ds_export_table_name.settransobject(Sqlca)

ds_contract_screen = create n_ds
ds_contract_screen.dataobject = 'd_contract_dw_sql_all'
ds_contract_screen.SetTransObject(SQLCA)

gnv_appeondb.of_startqueue( )
ds_export.retrieve(al_export_id)
ds_export_table_name.retrieve( 1001, al_export_id)
Select view_id, export_name Into :ll_view_id, :ls_export_name
From export_header
WHERE  export_header.export_id = :al_export_id ;

Select Count(1) Into :ll_count
from export_fields	where export_id = :al_export_id and ctx_scrn_id in (2001,2002,2003,2004) ;

gnv_appeondb.of_commitqueue( )

If isnull(ll_view_id) then ll_view_id = 1001
ds_export.sharedata( ds_export_filter)
IF ds_export.rowcount( ) > 0 then 
	ll_rowcount = ds_export.rowcount( )
	ll_cnt = ds_export_table_name.rowcount( )		
	
	//Added By Mark Lee 12/05/2014
	ds_contract_screen.Retrieve(ll_view_id)
	
	If isvalid(w_hide) Then
		Close(w_hide)
	End If
	Open(w_hide)
										
	For i = 1 to ll_cnt
		ls_dataobject  =  ds_export_table_name.GetItemString(i, 'dataobject') 
		ls_table_name = ds_export_table_name.GetItemString(i,'table_name')
		ll_screen_id = ds_export_table_name.GetItemNumber(i,'screen_id')
		
		//Modified By Ken.Guo 2016-03-11
		If isvalid(astr_export_columns.ads_columns) Then // for sync column properties. added screen 51 and 52.
		//always create dw by syntax.
//			if of_exists_export_table(ls_table_name) = false  and ll_screen_id <> 51 and  ll_screen_id <> 52 then  
//				continue
//			end if 
		Else
			//Added By Mark 07/02/2014 bug?? need mark check.
			if of_exists_export_table(ls_table_name) = false then  
				continue
			end if 			
		End If
	
		//create the screen //Modified By Ken.Guo 2016-05-17 add not isvalid(astr_export_columns.ads_columns). always create dw by syntax for syntc.
		IF ls_dataobject = 'd_contract_det_contact_external'  and not  isvalid(astr_export_columns.ads_columns)  Then
			If not isvalid(ldw_screen ) then 
				ldw_screen = Create u_dw					
			End if 
			ldw_screen.dataobject = ls_dataobject
			ldw_screen.Settransobject( sqlca)
		Else
			ldw_screen =	w_hide.dw_1
			ls_tab_name = gnv_data.of_get_table_name( ll_screen_id, 'C', 'tab_name')
			ldw[1] = ldw_screen
			ls_dw_name[1] 	= gnv_data.of_get_table_name( ll_screen_id, 'C', 'dw_name')
			ls_dataobjects[1] 	= ls_dataobject //gnv_data.of_get_table_name( long(data), 'C', 'dataobject')
			ll_find = ds_contract_screen.find(	" dw_name = " + "'" + ls_dw_name[1] + "'" + " and  ( dataobject = " + "'" + ls_dataobject + "' or grid_dataobject='" + ls_dataobject + "' )" , 1, ds_contract_screen.rowcount( ) )
			if ll_find > 0 then			
				f_create_contract_dw(ll_view_id,ls_tab_name,ldw,ls_dw_name,ls_dataobjects)				//create the dw screen
			else
				//Added By Mark Lee 12/05/2014
				ls_view = gnv_data.of_getitem( "data_view", "data_view_name"," data_view_id="+string(ll_view_id))
				Messagebox(gnv_app.iapp_object.DisplayName,"The current table ("+ls_table_name+") does not exist in the "+ls_view+" view. ~r~nPlease change the view or delete the column definitions for the table ("+ls_table_name+") in the export "+ls_export_name+", then continue your operation." )
				return -1
			end if 
		End If
				
		of_update_export_data_part(ll_screen_id,ls_table_name,ls_dataobject,ldw_screen,ds_export,ds_export_filter,astr_export_columns)		

	Next 
	
	//regular screen
	if ll_count > 0 then 
		For i = 1 to 4
			ll_screen_id = 2000 + i
			choose case ll_screen_id
				case 2001
					ls_table_name = "ctx_contacts"
					ls_dataobject = "d_cntx_master"
				case 2002
					ls_table_name = "ctx_contacts_numbers"	
					ls_dataobject =  "d_cntx_phone"						
				case 2003
					ls_table_name = "app_facility"						
					ls_dataobject =  "d_facility_detail"						
				case 2004
					ls_table_name = "sys_statusaudit"						
					ls_dataobject =  "d_export_status_track"						
			end choose 
					
			If not isvalid(ldw_screen ) then 
				ldw_screen = Create u_dw					
			End if 
			ldw_screen.dataobject = ls_dataobject
			ldw_screen.Settransobject( sqlca)
				
			of_update_export_data_part(ll_screen_id,ls_table_name,ls_dataobject,ldw_screen,ds_export,ds_export_filter,astr_export_columns)				
		Next 
	end if 
	
	If isvalid(w_hide) Then
		Close(w_hide)
	End If
	if isvalid(ldw_screen) then 
		Destroy ldw_screen
	End if 
	
	//update 
	If ds_export.modifiedcount() > 0 Then 
		li_return	=	ds_export.update( )
	End IF 
End If

destroy 	ds_export
destroy	ds_export_filter
destroy 	ds_export_table_name
destroy 	ds_contract_screen


return li_return

end function

public subroutine of_update_export_data_part (long al_screen, string as_table_name_screen, string as_dataobject, u_dw adw_screen, n_ds ads_export, n_ds ads_export_filter, str_export_columns astr_export_columns);//====================================================================
// Function: of_update_export_data
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value    long      al_screen
// 	value    string    as_table_name_screen
// 	value    string    as_dataobject
// 	value    u_dw      adw_screen
// 	value    n_ds      ads_export
// 	value    n_ds      ads_export_filter
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:	Mark		Date: 06/12/2014
//--------------------------------------------------------------------
//	Copyright (c) 2008-2013 Contractlogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
long		i , j, ll_rowcount, ll_find, ll_export_type
String 	ls_table_name, ls_column_name,  ls_label,  ls_dbname, ls_dataobject, ls_ctx_lookup_type, ls_new_lookup_type, ls_dddw_data
string 	ls_view_label, ls_web_visible, ls_lookup_code, ls_dddw_name
string 	ls_field_style, ls_lu_field_name, ls_view_label_old, ls_field_style_old,	ls_err
DatawindowChild			dwchild
string 	ls_lu_field_name_old, ls_lookup_code_old, ls_checkvalues, ls_text, ls_mask_old, ls_mask
Long		ll_rec_id, ll_auto_sync_field
boolean lb_extra = false
string ls_style
String ls_Null,  ls_display_field2,ls_lookup_field_style2,ls_lookup_code2 //Added By Ken.Guo 2016-04-28

if isnull(al_screen) or al_screen <=0 then  return

setnull(ls_null) //Added By Ken.Guo 2016-04-28

ads_export_filter.setfilter( '')
ads_export_filter.filter( )
ads_export_filter.setfilter( ' ctx_scrn_id='+string(al_screen) )
ads_export_filter.filter( )		
		
ll_rowcount = ads_export_filter.rowcount( )

if ll_rowcount > 0 then 
	For j = 1 to ll_rowcount
		ll_rec_id		= ads_export_filter.GetItemNumber(j, 'rec_id')
		
		//Added By Ken.Guo 2016-03-11. for sync column properties.
		If isvalid(astr_export_columns.ads_columns) Then 
			If astr_export_columns.ads_columns.find('rec_id = ' + string(ll_rec_id), 1, astr_export_columns.ads_columns.rowcount()) <= 0 Then
				//if not selected it.
				Continue
			End If
		End If
		
		ll_find =	ads_export.find( ' rec_id ='+string(ll_rec_id), 1, ads_export.rowcount( )	)				
		
		ls_table_name = ads_export_filter.GetItemString(j, 'ctx_table_name')
		ll_export_type = ads_export_filter.GetItemNumber(j, 'export_type')
		ls_column_name = ads_export_filter.GetItemString(j, 'ctx_column_name')									
		ls_view_label = ads_export_filter.GetItemString(j, 'data_view_label')						
		ls_web_visible = ads_export_filter.GetItemString(j, 'web_visible')	
		
//		ls_dataobject 			= lower(ads_export_filter.GetItemString( j, "ctx_scrn_dataobject" ))
		ls_ctx_lookup_type 	= ads_export_filter.GetItemString( j, "ctx_lookup_type" )			//Added By Mark 07/08/2014	need update error data if all auto update.
		
		ls_lu_field_name_old 	= ads_export_filter.GetItemString(j, 'lu_field_name')	
		ls_lookup_code_old 	= ads_export_filter.GetItemString(j, 'lookup_code')	
		ls_field_style_old	 	= ads_export_filter.GetItemString(j, 'lookup_field_style')		
		ls_mask_old				= ads_export_filter.GetItemString(j, 'export_format')		//Added By Mark 06/25/2014 no need it
		ll_auto_sync_field 		= ads_export_filter.GetItemNumber(j, 'auto_sync_field')				//Added By Mark Lee 02/09/2015
		
		//update table name 
		IF isnull(ls_table_name) or trim(ls_table_name) = '' Then				
			ads_export.setitem( ll_find, 'ctx_table_name', as_table_name_screen)		
			ls_table_name = as_table_name_screen
		End If
		
		//next update table name and web_visible
		if (not isnull(ls_web_visible) and ls_web_visible = "1") then 
			if ( isnull(ll_export_type) or ll_export_type <> 1 )  then 
				ads_export.setitem(ll_find, 'web_visible', "0")
				continue
			end if 
		
			if of_exists_export_table(ls_table_name) = false then 
				ads_export.setitem( ll_find, 'web_visible', "0")
			end if
			
			if lower(ls_table_name) =  'ctx_basic_info' and lower(ls_column_name) = 'ctx_id'  then 
				ads_export.setitem( ll_find, 'web_visible', "0")
	//					continue
			elseif lower(ls_table_name) =  'ctx_elements' and lower(ls_column_name) = 'category_name'  then 
				ads_export.setitem( ll_find, 'web_visible', "0")
	//					continue
			end if 		
	//			else
	//				continue
		end if 
		
		//update column lable
	//	ls_table = lower( adw_screen.Describe( "Datawindow.table.updatetable" ) )
	//	If as_dataobject = 'd_org_search2' And ls_table = 'ctx_orgs_contact' Then ls_table_name = 'ctx_orgs' 
		IF (not isnull(ll_export_type) and ll_export_type = 1 ) and (not isnull(ls_column_name) and trim(ls_column_name)  <> '')  Then 
		//&	and (isnull(ls_view_label) or trim(ls_view_label) ='' or isnull(ls_field_style_old) or trim(ls_field_style_old) ='' ) 
			ls_dbname = lower( adw_screen.Describe(ls_column_name + ".dbname") )
			// view label auto setting			
			if isnull(ls_view_label) or trim(ls_view_label) ='' then 		
				ls_label = ''
				IF as_dataobject = 'd_contract_det_contact_external' Then
					Choose Case ls_column_name
						Case 'compute_1'
							ls_label = 'Name'
						Case 'contact_phone'
							ls_label = 'Contact Phone'
						Case 'contact_email'
							ls_label = 'Contact Email'
						Case 'contact_id'
							ls_label = 'Contact ID'
						Case 'association'
							ls_label = 'Association'
						Case 'Facility_id'
							ls_label = 'Company ID'
						Case 'association2'
							ls_label = 'Association2'
						Case 'association3'
							ls_label = 'Association3'
						Case 'association4'
							ls_label = 'Association4'
						Case 'association5'
							ls_label = 'Association5'
						Case 'association6'
							ls_label = 'Association6'
						Case 'association7'
							ls_label = 'Association7'
						Case 'association8'
							ls_label = 'Association8'
						Case 'association9'
							ls_label = 'Association9'
						Case 'association10'
							ls_label = 'Association10'
					End Choose
				else
					ls_label = adw_screen.Describe( ls_column_name + "_t.text")
					if ls_label = "?" or ls_label = "!" then ls_label = ""
					if ls_label = '' then ls_label = ls_dbname
				end if 
				ads_export.setitem( ll_find, 'data_view_label', ls_label)
			end if 
			
			If isvalid(astr_export_columns.ads_columns) Then  //Added By Ken.Guo 2016-03-11. Added if statement. only sync column function need sync format.
				//	editmask.mask auto setting	
				ls_mask 	=adw_screen.Describe(ls_column_name + ".editmask.mask")
				If isnull(ls_mask) or ls_mask = '?' or ls_mask = '!' or trim(ls_mask) = '' or lower(ls_mask) = lower('None') & 
					or lower(ls_mask) = lower('use text') or lower(ls_mask) = lower('[general]') 	then 
					ls_mask ='None'
				End If		
				If isnull(ls_mask_old) or ls_mask_old = '?' or ls_mask_old = '!' or trim(ls_mask_old) = '' or lower(ls_mask_old) = lower('None') & 
					or lower(ls_mask_old) = lower('use text') or lower(ls_mask_old) = lower('[general]') 	then 
					ls_mask_old ='None'
				End If	
				if lower(ls_mask_old) <> lower(ls_mask ) then 
					ads_export.setitem( ll_find, 'export_format', ls_mask)
				end if 
			End If
							
			ls_lookup_code = ""
			ls_field_style = ""			
			ls_lu_field_name 	= ""	
			ls_dddw_data = ""
//			ls_checkvalues 		= adw_screen.Describe(ls_column_name + ".values")		//APB settings is not same with PB code.
			ls_text 				= adw_screen.Describe(ls_column_name + ".CheckBox.On")
			If isnull(ls_text) or ls_text = '?' or ls_text = '!' or trim(ls_text) = ''  then 
				ls_text =''
			End If
			// dddw setting
			if adw_screen.getchild(ls_column_name,dwchild) = 1 then
				ls_dddw_name 	= adw_screen.Describe(ls_column_name+".dddw.name")					
				ls_lookup_code 	= adw_screen.Describe(ls_column_name + ".tag") 
				ls_lu_field_name	= adw_screen.Describe(ls_column_name + ".dddw.displaycolumn") 
				if lower(ls_dddw_name) = 'd_dddw_code_lookup' then //Modified By Jay Chen 07-03-2015
					if lower(ls_lu_field_name) = 'compute_code_number' or lower(ls_lu_field_name) = 'compute_description_number' then 
						ls_lu_field_name = 'Code' 
					end if
				end if
				ls_dddw_data 		= lower( adw_screen.Describe( ls_column_name + ".dddw.datacolumn" ) )
				
				If isnull(ls_dddw_name) or ls_dddw_name = '?' or ls_dddw_name = '!' or trim(ls_dddw_name) = ''  then 
					ls_dddw_name =''
				End If

				if isnull(ls_lookup_code) or ls_lookup_code = '?' or ls_lookup_code = '!' or trim(ls_lookup_code) = ''  then 
					ls_lookup_code = ""		//reset
					if (ls_column_name = 'app_facility'  and ls_dddw_name = 'dddw_contact_company_new' ) or ls_dddw_name = 'd_dddw_company_list' or &
							ls_dddw_name = 'd_dddw_company' then 
						ls_lu_field_name = "facility_name"
						ls_field_style = "P"
					elseif ls_dddw_name = "d_dddw_users" then
						ls_lu_field_name = "user_id"
						ls_field_style = "U"
					elseif ls_dddw_name = "d_code_lookup_country" and as_dataobject = "d_facility_detail" and ls_column_name = "country" then
						ls_lookup_code = "Country"	
						ls_field_style = "C" 
					else
						ls_field_style = ""
					end if 
				else
					//lookup code 'A','B','O',''		//F
					if  ls_dddw_name ="d_dddw_company_list" or ls_dddw_name = 'd_dddw_company'  or ls_dddw_name = 'dddw_contact_company_new' then  //Modified By Jay Chen 12-03-2015 add dddw_contact_company_new
						ls_field_style = "P"
						ls_lu_field_name = "facility_name"
					else
						ls_field_style = "C"
					end if 
				end if 
				
				//Set data value
				if isnull(ls_field_style_old ) or trim(ls_field_style_old) = "" or ls_field_style_old <>  ls_field_style	then 			 
					ads_export.setitem( ll_find, 'lookup_field_style', ls_field_style)
				end if 
				
				//Added By Mark 07/08/2014 only set value on the lookup field style.
				if (isnull(ls_lu_field_name_old) or trim(ls_lu_field_name_old) = '' or ls_lu_field_name_old <>  ls_lu_field_name) and trim(ls_field_style) <> "" then
					if not isnull(ll_auto_sync_field) and ll_auto_sync_field = 1 and not isnull(ls_lu_field_name_old) and trim(ls_lu_field_name_old) <> "" and not isnull(ls_lu_field_name) and trim(ls_lu_field_name) <> ""  then 
						//
					else
						ads_export.setitem( ll_find, 'lu_field_name', ls_lu_field_name)
					end if 
				end if 					
								
				if isnull(ls_lookup_code_old ) or ls_lookup_code_old <>  ls_lookup_code	 then 	 
					ads_export.setitem( ll_find, 'lookup_code', ls_lookup_code)
				end if 
				
				//Added By Mark 07/09/2014	dirty data setting.
				if not( isnull(ls_lu_field_name) or trim(ls_lu_field_name) = '' )then 
					if (isnull(ls_ctx_lookup_type) or trim(ls_ctx_lookup_type) = "" ) and ls_field_style = 'C' then 
						ls_new_lookup_type = "C"
						ads_export.SetItem(ll_find,'ctx_lookup_type', ls_new_lookup_type)
					else  //Added By Jay Chen 12-03-2015 need update ctx_lookup_type from old value to new value 
						ads_export.SetItem(ll_find,'ctx_lookup_type', ls_field_style)
					end if 
				end if 
			Else
				If( len(ls_text) > 0) Then			//len(ls_checkvalues)  > 2 and
					ls_field_style = 'B'
					ls_lookup_code = adw_screen.Describe(ls_column_name + ".CheckBox.On") + ':'+ &
						adw_screen.Describe(ls_column_name + ".CheckBox.Off")+";"+adw_screen.Describe(ls_column_name + ".checkbox.text")
				End If

				//Added By Ken.Guo 2016-04-28
				If isvalid(astr_export_columns.ads_columns) Then
					If ls_field_style = ''  Then
						ads_export.setitem(ll_find,"ctx_lookup_type",ls_Null)				
						ads_export.setitem(ll_find,"lookup_field_style",ls_Null)			
						ads_export.setitem(ll_find,"lookup_code",ls_Null)
						ads_export.setitem(ll_find,"lu_field_name",'')
					End If
					
					//Added By Ken.Guo 2016-04-28
					if al_screen = 2003 and left(lower(ls_column_name),7)='custom_' then //app_facility custom
						select field_dddw_display_column,field_style,field_dddw_namedesc into :ls_display_field2,:ls_lookup_field_style2,:ls_lookup_code2 from ctx_contact_custom_config where field_falg='C' AND field_name=:ls_column_name;
						if isnull(ls_display_field2) then ls_display_field2 = ''
						if ls_lookup_field_style2 = 'Code Lookup' then
							ls_lookup_field_style2 = 'C'
						elseif ls_lookup_field_style2 = 'Company' then
							ls_lookup_field_style2 = 'P'
						elseif ls_lookup_field_style2 = 'User' then
							ls_lookup_field_style2 = 'U'
						end if
						if ls_display_field2 <> '' then
							ads_export.SetItem( ll_find, 'ctx_lookup_type','C')
							ads_export.SetItem( ll_find, "lu_field_name", ls_display_field2)
							ads_export.SetItem( ll_find, 'lookup_field_style',ls_lookup_field_style2)
							ads_export.SetItem( ll_find, 'lookup_code',ls_lookup_code2)
						end if
					end if
					if al_screen = 2001 and left(lower(ls_column_name),7)='custom_' then //ctx_contacts custom
						select field_dddw_display_column,field_style,field_dddw_namedesc into :ls_display_field2,:ls_lookup_field_style2,:ls_lookup_code2 from ctx_contact_custom_config where field_falg='P' AND field_name=:ls_column_name;
						if isnull(ls_display_field2) then ls_display_field2 = ''
						if ls_lookup_field_style2 = 'Code Lookup' then
							ls_lookup_field_style2 = 'C'
						elseif ls_lookup_field_style2 = 'Company' then
							ls_lookup_field_style2 = 'P'
						elseif ls_lookup_field_style2 = 'User' then
							ls_lookup_field_style2 = 'U'
						end if
						if ls_display_field2 <> '' then
							ads_export.SetItem( ll_find, 'ctx_lookup_type','C')
							ads_export.SetItem( ll_find, "lu_field_name", ls_display_field2)
							ads_export.SetItem( ll_find, 'lookup_field_style',ls_lookup_field_style2)
							ads_export.SetItem( ll_find, 'lookup_code',ls_lookup_code2)
						end if
					end if					
					
					
					
					
				End If

//				//check the data completedlly if the view was changed.				//Added By Mark 07/08/2014 don't set value clean auto.
//				if not isnull(ls_lu_field_name_old) and trim(ls_lu_field_name_old) <> ''  then 
//					ads_export.setitem( ll_find, 'lu_field_name', '')
//				end if 			

				//Added By Jay Chen 02-01-2016 extra handle for app_facility custom and ctx_contact custom field.
				ls_style = ''
				lb_extra = false
				if al_screen = 2003 and left(lower(ls_column_name),7)='custom_'  then
					select field_style into :ls_style from ctx_contact_custom_config where field_falg='C' AND field_name=:ls_column_name;
					if isnull(ls_style) then ls_style = ''
					if lower(ls_style) <> 'edit' then lb_extra = true
				end if
				if al_screen = 2001 and left(lower(ls_column_name),7)='custom_'  then
					select field_style into :ls_style from ctx_contact_custom_config where field_falg='P' AND field_name=:ls_column_name;
					if isnull(ls_style) then ls_style = ''
					if lower(ls_style) <> 'edit' then lb_extra = true
				end if
				//end
				
				if isnull(ls_field_style_old) or ls_field_style_old <> ls_field_style  then
//					ads_export.setitem( ll_find, 'lookup_field_style', ls_field_style)
					if not lb_extra then ads_export.setitem( ll_find, 'lookup_field_style', ls_field_style)
				end if 
				
				if isnull(ls_lookup_code_old ) or ls_lookup_code_old <>  ls_lookup_code	 then 	 
//					ads_export.setitem( ll_find, 'lookup_code', ls_lookup_code)
					if not lb_extra then ads_export.setitem( ll_find, 'lookup_code', ls_lookup_code)
				end if 
			end if 
			
			//copy from w_export_painter.tab_1.tabpage_field_data.dw_detail.ue_column_check()
//			/////////////////////////////////////////////////////////////////////////////
//			If ( ls_dataobject = 'd_contract_det_contact_external' or ls_dataobject = 'd_contract_det_contact_contact' or ls_dataobject = 'd_contract_det_contact_contact_notes') And ls_column_name = 'contact_id' Then
//				ls_new_lookup_type = 'contact_id'
//			elseif ls_dataobject = 'd_profile_header' and ls_column_name = 'ctx_req_profile_id' then
//				ls_new_lookup_type = ls_column_name
//			elseif ls_dataobject = 'd_contract_group_linked_locations' and ls_column_name = 'loc_id' then
//				ls_new_lookup_type = ls_column_name
//			elseif ls_dataobject = "d_contract_multi_group_browse" and ls_column_name = "parent_comp_id" then
//				ls_new_lookup_type = ls_column_name
//			Else
//				ls_new_lookup_type = ls_column_name
//				if isnull(ls_new_lookup_type) then ls_new_lookup_type = ''
//				if len(trim(ls_dddw_data)) > 0  then
//					//copy from w_export_painter.tab_1.tabpage_field_data.dw_detail.ue_generate_dddw()
//	//				If ls_dataobject = 'd_contract_det_contact_external' Then
//	//					choose case ls_column_name
//	//						case 'association'
//	//							ls_new_lookup_type = 'C'
//	//						case 'facility_id'
//	//							ls_new_lookup_type = 'P'
//	//						case 'association2','association3','association4','association5','association6','association7','association8','association9','association10'
//	//							ls_new_lookup_type = 'C'
//	//					end choose 
//	//				else
//////						if not isnull(ls_dddw_data) and  ls_dddw_data = 'lookup_code' then
//////							ls_new_lookup_type = 'C'
//////						elseif  not isnull(ls_dddw_data) and ls_dddw_data = 'facility_id' and ls_field_style = 'P' and ls_column_name <> 'app_facility'   then
//////							ls_new_lookup_type = 'P'
//////						end if 
//	//				end if 
//					setnull(ls_new_lookup_type)			//Added By Mark 07/08/2014  set 
//				End If
//			End If
//			
//			if ls_new_lookup_type = '?' or ls_new_lookup_type = '!' then
//				setnull(ls_new_lookup_type)
//			elseif ls_new_lookup_type = "lookup_code" or ls_new_lookup_type = "C" then
//				ls_new_lookup_type = 'C'
//			elseif ls_new_lookup_type = "P" then
//				ls_new_lookup_type = "P"
//			elseif ls_new_lookup_type = 'facility_id'  Then		//company_id
//				ls_new_lookup_type = 'C'
//			elseif ls_new_lookup_type = 'contact_id' Then
//				ls_new_lookup_type = 'C'
//			elseif ls_new_lookup_type = 'ctx_req_profile_id' then	
//				ls_new_lookup_type = 'R'
//			elseif ls_new_lookup_type = "loc_id" then
//				ls_new_lookup_type = 'L'
//			elseif ls_new_lookup_type = "parent_comp_id" then	
//				ls_new_lookup_type = 'M'			
//			else
//				setnull(ls_new_lookup_type)
//			end if
//			
//			//Added By Mark 07/08/2014 need update dirty data
//			if (isnull(ls_ctx_lookup_type) and  not isnull(ls_new_lookup_type) ) or (not isnull(ls_ctx_lookup_type) and  isnull(ls_new_lookup_type) ) or &
//			(not isnull(ls_ctx_lookup_type) and  not isnull(ls_new_lookup_type) and ls_ctx_lookup_type <> ls_new_lookup_type ) then 
//				ads_export.SetItem(ll_find,'ctx_lookup_type', ls_new_lookup_type)		
//			end if 
		/////////////////////////////////////////////////////////////////////////////
			
		end if
		
	Next		
end if 
end subroutine

public subroutine of_set_replace_multi_field_symbol (boolean abn_replace);//====================================================================
// Function: of_set_replace_multi_field_symbol
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value    boolean    abn_replace
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:	Mark Lee		Date: 07/20/2016
//--------------------------------------------------------------------
//	Copyright (c) 2008-2015 Contractlogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
ib_replace_multi_field_symbol = abn_replace
end subroutine

public function integer of_run_export (long al_export_id, string as_path, string as_prac_sql, long al_type, boolean ab_update_sql);//====================================================================
// Function: of_run_export
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//                al_export_id
//                as_path
//                as_prac_sql
//                al_type
//                ab_update_sql
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:         Ken.Guo 2016-11-23
//--------------------------------------------------------------------
//Copyright (c) 2008-2016 Contract Logix, Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History:
// added ab_update_sql argument
//====================================================================


String 		ls_presentation_str, ERRORS,	ls_dwsyntax_str, ls_temp
n_ds			lds_export_retrieve
Long			i, ll_prac_row, prac_ids[], ll_pos, ll_pracid, ll_pracidold, ll_Num, ll_return
Boolean		lbn_flag 


IF isnull(as_prac_sql) or trim(as_prac_sql) = "" then
	as_prac_sql = "Select distinct ctx_id from ctx_basic_info "
	lbn_flag = false
Else
	lbn_flag = true
	ll_pos = pos(lower(as_prac_sql)," from ")
	ls_temp = Left(as_prac_sql,ll_pos - 1)
	if al_type = 3 or al_type = 4 then		
		if pos(lower(ls_temp), "ctx_id") < 1 then
			gnv_debug.of_output(true, ' Export_apb:of_run_export();The Contract Retrieval SQL must contain the ctx_id column.' + ' ai_export_id=' + string( al_export_id )+ "; type=" + string(al_type))
			RETURN -1
		end if
	else
		if pos(lower(ls_temp), "prac_id") < 1 then
			gnv_debug.of_output(true, ' Export_apb:of_run_export();The Contract Retrieval SQL must contain the prac_id column.' + ' ai_export_id=' + string( al_export_id )+ "; type=" + string(al_type))
			RETURN -1
		end if		
	end if
End If			

ls_presentation_str = "style(type=grid)"		
ls_dwsyntax_str = SQLCA.SyntaxFromSQL(as_prac_sql, ls_presentation_str, ERRORS)
IF Len(ERRORS) > 0 THEN
	gnv_debug.of_output(true, ' Export_apb:of_run_export();' + ' ai_export_id=' + string( al_export_id )+ "; type=" + string(al_type)+";~r~n SyntaxFromSQL caused these errors: " + ERRORS)
	RETURN -1
END IF
	
lds_export_retrieve = CREATE n_ds
lds_export_retrieve.Create( ls_dwsyntax_str, ERRORS)
lds_export_retrieve.SetTransObject( SQLCA )
ll_prac_row = lds_export_retrieve.retrieve()
if ll_prac_row < 1 then 
	gnv_debug.of_output(true, ' Export_apb:of_run_export();No contract rows returned.' + ' ai_export_id=' + string( al_export_id )+ "; type=" + string(al_type))
	if IsValid(lds_export_retrieve) then destroy lds_export_retrieve
	return -2
end if

lds_export_retrieve.Setsort( "#1 A")
lds_export_retrieve.Sort()

If lbn_flag = false Then 
	for i = 1 to ll_prac_row
		prac_ids[i] = lds_export_retrieve.getitemnumber(i,1)
	next
Else
	for i = 1 to ll_prac_row
		ll_pracid   = lds_export_retrieve.getitemnumber(i,1)
		if ll_pracid <> ll_pracidold and ll_pracid > 0 then 
			ll_Num ++
			prac_ids[ll_Num] = ll_pracid
			ll_pracidold= ll_pracid
		end if
	next
End If

this.ib_gen_rec_id = False 
if al_type = 3 or al_type = 4 then
	ll_return = this.of_export_data_with_text_ctx( al_export_id, prac_ids,as_path,0,"","","",1,as_prac_sql ,ab_update_sql)
else
	ll_return = this.of_export_data_with_text( al_export_id, prac_ids,as_path,0,"","","",1,as_prac_sql)	
end if
destroy lds_export_retrieve

IF ll_return > 0 THEN
	return 1;
ELSE
	return ll_return;
END IF

end function

public subroutine of_set_str_action_item (str_action_item astr_action_item);//(Appeon)Harry 2017-04-17 for task747
istr_action_item = astr_action_item

end subroutine

on pfc_n_cst_ai_export_apb.create
call super::create
TriggerEvent( this, "constructor" )
end on

on pfc_n_cst_ai_export_apb.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event destructor;//--------------------------- APPEON BEGIN ---------------------------
//$<add> 05.18.2007 By: Jack
//$<reason> Fix a defect.
If isvalid(ids_export_data) Then
	//----Begin Modified by Alfee 05.25.2007-------------
	//<$Reason> if not called from replacing fields in email template, then...
	//If is_called_type <> '3' Then destroy ids_export_data
	If is_called_type <> '3' and is_called_type <> '2' Then destroy ids_export_data //alfee 10.28.2008
	//destroy ids_export_data
	//----End Modified ----------------------------------
End If
//---------------------------- APPEON END ----------------------------

If isvalid(invo_rights) Then Destroy invo_rights

If isvalid(inv_arr_db) Then 
	inv_arr_db.of_delete_temp_data(is_client_id[])
	Destroy inv_arr_db
End If
end event

event constructor;invo_rights = Create n_cst_rights

inv_arr_db = Create n_cst_array_db 

//Added By Jay Chen 03-19-2014
ids_document_export_field = create datastore
ids_document_export_field.dataobject = 'dw_ctx_export_field'
ids_document_export_field.settransobject(sqlca)

is_get_export_field = gnv_data.of_getitem("icred_settings","get_field_before_export",false)
if isnull(is_get_export_field) or is_get_export_field = '' then is_get_export_field = '1'
//end add
end event

