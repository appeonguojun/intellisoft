$PBExportHeader$pfc_n_cst_ai_export.sru
forward
global type pfc_n_cst_ai_export from userobject
end type
end forward

global type pfc_n_cst_ai_export from userobject
boolean visible = false
integer width = 2016
integer height = 1208
boolean border = true
long backcolor = 67108864
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
end type
global pfc_n_cst_ai_export pfc_n_cst_ai_export

forward prototypes
public function integer of_export_data (integer ai_export_id, long al_prac_ids[])
public function integer of_create_export_table (integer ai_exp_id, integer ai_save)
public function string of_date_format (string as_format, datetime as_datetime)
public function string of_get_billing (long al_id, string as_type, string as_field, string as_field_format, string as_syntax)
public function integer of_export_data_with_text (integer ai_export_id, long al_prac_ids[], string as_path, integer ai_save_data, string as_param1, string as_param2, string as_param3)
public function string of_prompt_syntax (string as_sql, string as_parm1, string as_parm2, string as_parm3)
public function string of_prompt_populate (string as_type, string as_value)
public function string of_strip_char (string as_strip, string as_string, string as_replace)
public function string of_custom_name (integer ai_custom, string as_table, datetime adt_date)
public function integer of_multi_row (n_ds ads_export, string as_table, integer ai_table, integer ai_col_num[], n_ds ads_exp_fields, long al_prac_ids[])
end prototypes

public function integer of_export_data (integer ai_export_id, long al_prac_ids[]);////old version; not being used
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
String ls_value
string ls_select_field //maha
string ls_select_table //maha
string ls_ft //maha
n_ds lds_export_hdr
n_ds lds_export_flds
n_ds lds_export_text
datawindow lds_export_data
n_ds lds_code_lookup
n_ds lds_address_lookup



//
lds_export_hdr = CREATE n_ds
lds_export_hdr.DataObject = "d_export_hdr"
lds_export_hdr.of_SetTransObject( SQLCA )

lds_export_flds = CREATE n_ds
lds_export_flds.DataObject = "d_export_flds_list_exp"
lds_export_flds.of_SetTransObject( SQLCA )

lds_export_text = CREATE n_ds
lds_export_text.DataObject = "d_export_flds_list_exp"
lds_export_text.of_SetTransObject( SQLCA )

t = lds_export_hdr.Retrieve( ai_exp_id )
if t < 1 then
	messagebox("Problem in of_create_export_table","No return on export header.")	
	return -2
end if

li_fld_cnt = lds_export_flds.Retrieve( ai_exp_id )



ls_table_name = lds_export_hdr.getitemstring(1,"export_name")
ls_table_new = ls_table_name
li_fld_len = len(ls_table_name)

//remove spaces from export name to make table name
g = pos(ls_table_name," ")
do while g <> 0
	ls_table_new = mid(ls_table_new,1,g - 1) + "_" + mid(ls_table_name,g + 1)	
//	messagebox("ls_table_new",ls_table_new)
	g = pos(ls_table_new," ")
loop

ls_table_name = "exp_" + ls_table_new 

//drop table
ls_sql_syntax = "drop TABLE " +ls_table_name + ";"
execute immediate :ls_sql_syntax using sqlca;
commit using sqlca;

//build table
ls_sql_syntax = "CREATE TABLE " +ls_table_name + " ( "
FOR p = 1 TO li_fld_cnt
	
	li_fld_len = lds_export_flds.getitemnumber(p,"export_field_length")

		ls_select_field = lds_export_flds.getitemstring(p,"export_field_name")
		ls_value = lds_export_flds.getitemstring(p,"field_value")
		if isnull(ls_value) then ls_value = ""
		
		ls_sql_syntax = ls_sql_syntax + ls_select_field + " CHAR(" +  string(li_fld_len) + ")"
		if len(ls_value) > 0 then
			ls_sql_syntax = ls_sql_syntax + " DEFAULT '" + ls_value + "'"
		end if
		ls_sql_syntax = ls_sql_syntax + ", "
	
next
ls_sql_syntax = Left( ls_sql_syntax, Len(ls_sql_syntax) -2 )

if ai_save = 1 then
	ls_sql_syntax = ls_sql_syntax + ", rec_id numeric(8,0), primary key(rec_id) "
end if

ls_sql_syntax = ls_sql_syntax + ");"

//messagebox("ls_sql_syntax",ls_sql_syntax)

execute immediate :ls_sql_syntax using sqlca;
commit using sqlca;

//	if gi_test_mode = 1 then
//		messagebox("table syntax", ls_sql_syntax)	
//	end if
//




























return 0
end function

public function string of_date_format (string as_format, datetime as_datetime);string ls_value
datetime ldt_date
string ls_month
string ls_year
string ls_day
string ls_hour
string ls_minute
string ls_second

ldt_date = as_datetime

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
integer r
datetime ldt_value
n_ds lds_billing


ls_sql_syntax = as_syntax + " rec_id = " + string(al_id) + ";"
ls_presentation_str = "style(type=form)" 
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
				ls_val = string(lds_billing.getitemnumber(1, as_field ))
			case "C","V","L"	//character
				ls_val = lds_billing.getitemString( 1, as_field )
			case "T"	//datetime
				ldt_value = lds_billing.getitemdatetime(1, as_field )
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

public function integer of_export_data_with_text (integer ai_export_id, long al_prac_ids[], string as_path, integer ai_save_data, string as_param1, string as_param2, string as_param3);//function built by maha 07-2002

SetPointer( HourGlass! )
if isnull(as_path) or as_path = "" then
	messagebox("Data Error", "There is no save path for this file. Unable to continue this function.")
	return 0
//else
//	messagebox("aspath",as_path)
//	return 0
end if
if ai_export_id < 1 then
	messagebox("User Error", "No export selected.  Unable to continue this function.")
	return 0
end if

open(w_export_progress)
w_export_progress.st_progress.text = "Creating export table"

of_create_export_table( ai_export_id,ai_save_data )

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
//HEADER INFO
ls_table_name = lds_export_hdr.getitemstring(1,"export_name")
ls_header = lds_export_hdr.getitemstring(1,"field_labels_as_header")//Y or N
ls_format = lds_export_hdr.getitemstring(1,"export_format")
if ls_format = "export" then //maha 121205
	lb_export = true
	ls_format = ".txt"
elseif ls_format = ".csv" then 
	lb_export = false
else //txt and xls files and dat files
	lb_export = false
end if
li_exp_type = lds_export_hdr.getitemnumber(1,"export_type")
ls_rec_delim = lds_export_hdr.getitemstring(1,"record_delimiter")
ls_save_path = lds_export_hdr.getitemstring(1,"save_path")
ls_save_path = gnv_string.of_replace_env_var(ls_save_path) //Added By Ken.Guo 12/10/2013
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
ls_sql_syntax = "Select * from exp_" + lower(ls_table_new)
ls_presentation_str = "style(type=form)" 

ls_dwsyntax_str = SQLCA.SyntaxFromSQL(ls_sql_syntax, ls_presentation_str, ERRORS)
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
						ll_billing_id = lds_export_retrieve.getitemnumber(ll_prac_row, "billing_address_id" )
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

								//--------------------------- APPEON BEGIN ---------------------------
								//$<modify> 01.13.2006 By: Luke
								//$<reason> The SQL server has data type 'datetime'.
	
								// case "T"	//datetime
								 case "T",'D'	//datetime
								//---------------------------- APPEON END ----------------------------

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
	of_multi_row(lds_export_data,"not used",li_multi_table,li_multi_field[],lds_export_flds,al_prac_ids[])
	
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
ls_save_path = gnv_string.of_replace_env_var(ls_save_path) //Added By Ken.Guo 12/10/2013


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

if lb_export = false then  //if the auto export path is blank use the export path, if blank use the hard coded path
	//messagebox("ls_path",ls_path)li_custom_save  ls_save_name

	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> PT-01
	//$<add> 01.13.2006 By: Cao YongWang
	//$<modification> Create the downloading directory if it does not exist.
	If appeongetclienttype() <> 'PB' Then
		n_appeon_download lnv_downlaod
		lnv_downlaod.of_parsepath( ls_path)
	End If
	//---------------------------- APPEON END ----------------------------
	gnv_rights.of_check_dir_right( ls_path, true, 'Export')
	
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

public function string of_prompt_syntax (string as_sql, string as_parm1, string as_parm2, string as_parm3);integer li_start
integer li_end
integer li_pos = 1
string ls_sql

ls_sql = as_sql
li_start = pos(as_sql,"PROMPT1",li_pos)

do while li_start > 0
	ls_sql = mid(ls_sql,li_pos,li_start - 1) + as_parm1 +mid(ls_sql,li_start + 7 )
	li_start = pos(ls_sql,"PROMPT1",li_start)
loop

return ls_sql

end function

public function string of_prompt_populate (string as_type, string as_value);//Start Code Change ---- 11.03.2005 #22 maha
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

public function string of_strip_char (string as_strip, string as_string, string as_replace);//maha created 120905 to strip/replace characters

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

public function string of_custom_name (integer ai_custom, string as_table, datetime adt_date);datetime ldt_now
string ls_ret
string ls_date

ldt_now = adt_date

choose case ai_custom
	case 1 //nyp pems cornell
		ls_date = of_date_format( "yyyymmddhhmmss", adt_date)
		ls_ret = "30200" + "_" + ls_date 
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

public function integer of_multi_row (n_ds ads_export, string as_table, integer ai_table, integer ai_col_num[], n_ds ads_exp_fields, long al_prac_ids[]);//maha created 121505 to create multiple data rows for each practitoner

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
ls_table = ads_exp_fields.getitemstring(1,"db_table_name")

if ac = 0 then return 0

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
	ls_syntax = "SELECT " + ls_fields + " from " + ls_table + " where prac_id = " + string(ll_prac) + ";"
	
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
	dc = lds_getdata.retrieve()
//for each field in the m table that exists in the export get the data from the appropriate record and modify the the new export rows	
	if dc > 1 then
		for d = 2 to dc
			ads_export.rowscopy(row_cnt,row_cnt,primary!,ads_export,row_cnt + 1,primary!)
			//ads_export.rowscopy(row_cnt,row_cnt,primary!,ads_export,100,primary!)
			row_cnt++
			//rc = ads_export.rowcount()
			ll_row_loc[d] = row_cnt
		next
			
		for d = 1 to dc
			for a = 1 to upperbound(ai_col_num[])
				//messagebox("",)
				ls_lu_field = ads_exp_fields.getitemstring(a,"lu_field_name")
				ls_lu_type = ads_exp_fields.getitemstring(a,"db_lookup_type") //maha 010305
				choose case ads_exp_fields.getitemstring(a,"db_field_type")
					case "C","L"
						ls_value = lds_getdata.getitemstring(d,a)
					case "I","N"
						ls_value = string(lds_getdata.getitemnumber(d,a))
						
					case "D"
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

on pfc_n_cst_ai_export.create
end on

on pfc_n_cst_ai_export.destroy
end on

