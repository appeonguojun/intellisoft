$PBExportHeader$w_export_report.srw
forward
global type w_export_report from pfc_w_main
end type
type tab_1 from tab within w_export_report
end type
type tabpage_browse from userobject within tab_1
end type
type cb_1 from commandbutton within tabpage_browse
end type
type cb_select from commandbutton within tabpage_browse
end type
type dw_report_list from u_dw within tabpage_browse
end type
type cb_next_1 from commandbutton within tabpage_browse
end type
type cb_delete from commandbutton within tabpage_browse
end type
type tabpage_browse from userobject within tab_1
cb_1 cb_1
cb_select cb_select
dw_report_list dw_report_list
cb_next_1 cb_next_1
cb_delete cb_delete
end type
type tabpage_tables from userobject within tab_1
end type
type dw_view_tables from datawindow within tabpage_tables
end type
type dw_view_links from datawindow within tabpage_tables
end type
type cb_view_add_tbl from commandbutton within tabpage_tables
end type
type cb_view_del_tbl from commandbutton within tabpage_tables
end type
type cb_next_2 from commandbutton within tabpage_tables
end type
type cb_view_del_link from commandbutton within tabpage_tables
end type
type cb_view_add_link from commandbutton within tabpage_tables
end type
type cb_9 from commandbutton within tabpage_tables
end type
type cbx_distinct from checkbox within tabpage_tables
end type
type tabpage_tables from userobject within tab_1
dw_view_tables dw_view_tables
dw_view_links dw_view_links
cb_view_add_tbl cb_view_add_tbl
cb_view_del_tbl cb_view_del_tbl
cb_next_2 cb_next_2
cb_view_del_link cb_view_del_link
cb_view_add_link cb_view_add_link
cb_9 cb_9
cbx_distinct cbx_distinct
end type
type tabpage_columns from userobject within tab_1
end type
type dw_fields_list from datawindow within tabpage_columns
end type
type dw_view_fields from datawindow within tabpage_columns
end type
type dw_all_fields from datawindow within tabpage_columns
end type
type cb_next_3 from commandbutton within tabpage_columns
end type
type cb_10 from commandbutton within tabpage_columns
end type
type cb_11 from commandbutton within tabpage_columns
end type
type cb_33 from commandbutton within tabpage_columns
end type
type cb_34 from commandbutton within tabpage_columns
end type
type tabpage_columns from userobject within tab_1
dw_fields_list dw_fields_list
dw_view_fields dw_view_fields
dw_all_fields dw_all_fields
cb_next_3 cb_next_3
cb_10 cb_10
cb_11 cb_11
cb_33 cb_33
cb_34 cb_34
end type
type tabpage_filter from userobject within tab_1
end type
type dw_view_where from datawindow within tabpage_filter
end type
type cb_12 from commandbutton within tabpage_filter
end type
type cb_16 from commandbutton within tabpage_filter
end type
type cb_3 from commandbutton within tabpage_filter
end type
type cb_next_4 from commandbutton within tabpage_filter
end type
type tabpage_filter from userobject within tab_1
dw_view_where dw_view_where
cb_12 cb_12
cb_16 cb_16
cb_3 cb_3
cb_next_4 cb_next_4
end type
type tabpage_sort from userobject within tab_1
end type
type cb_next_5 from commandbutton within tabpage_sort
end type
type dw_fields_list_sort from datawindow within tabpage_sort
end type
type dw_view_sort from u_dw within tabpage_sort
end type
type tabpage_sort from userobject within tab_1
cb_next_5 cb_next_5
dw_fields_list_sort dw_fields_list_sort
dw_view_sort dw_view_sort
end type
type tabpage_preview from userobject within tab_1
end type
type dw_preview from u_dw within tabpage_preview
end type
type cb_7 from commandbutton within tabpage_preview
end type
type st_obj_name from statictext within tabpage_preview
end type
type cb_14 from commandbutton within tabpage_preview
end type
type gb_1 from groupbox within tabpage_preview
end type
type gb_2 from groupbox within tabpage_preview
end type
type rb_p from radiobutton within tabpage_preview
end type
type rb_l from radiobutton within tabpage_preview
end type
type em_font from editmask within tabpage_preview
end type
type st_2 from statictext within tabpage_preview
end type
type st_left from statictext within tabpage_preview
end type
type st_5 from statictext within tabpage_preview
end type
type st_center from statictext within tabpage_preview
end type
type st_right from statictext within tabpage_preview
end type
type st_f_right from statictext within tabpage_preview
end type
type st_f_center from statictext within tabpage_preview
end type
type st_f_left from statictext within tabpage_preview
end type
type st_6 from statictext within tabpage_preview
end type
type dw_label from datawindow within tabpage_preview
end type
type st_4 from statictext within tabpage_preview
end type
type hsb_2 from hscrollbar within tabpage_preview
end type
type st_3 from statictext within tabpage_preview
end type
type st_1 from statictext within tabpage_preview
end type
type hsb_1 from hscrollbar within tabpage_preview
end type
type cbx_move_all from checkbox within tabpage_preview
end type
type cb_2 from commandbutton within tabpage_preview
end type
type tabpage_preview from userobject within tab_1
dw_preview dw_preview
cb_7 cb_7
st_obj_name st_obj_name
cb_14 cb_14
gb_1 gb_1
gb_2 gb_2
rb_p rb_p
rb_l rb_l
em_font em_font
st_2 st_2
st_left st_left
st_5 st_5
st_center st_center
st_right st_right
st_f_right st_f_right
st_f_center st_f_center
st_f_left st_f_left
st_6 st_6
dw_label dw_label
st_4 st_4
hsb_2 hsb_2
st_3 st_3
st_1 st_1
hsb_1 hsb_1
cbx_move_all cbx_move_all
cb_2 cb_2
end type
type tabpage_run from userobject within tab_1
end type
type dw_run from u_dw within tabpage_run
end type
type cb_next_run from commandbutton within tabpage_run
end type
type cb_saveas from commandbutton within tabpage_run
end type
type cb_print from commandbutton within tabpage_run
end type
type cb_filter from commandbutton within tabpage_run
end type
type cb_sort from commandbutton within tabpage_run
end type
type cb_17 from commandbutton within tabpage_run
end type
type st_step from statictext within tabpage_run
end type
type dw_wizard from u_dw within tabpage_run
end type
type st_sql from statictext within tabpage_run
end type
type tabpage_run from userobject within tab_1
dw_run dw_run
cb_next_run cb_next_run
cb_saveas cb_saveas
cb_print cb_print
cb_filter cb_filter
cb_sort cb_sort
cb_17 cb_17
st_step st_step
dw_wizard dw_wizard
st_sql st_sql
end type
type tab_1 from tab within w_export_report
tabpage_browse tabpage_browse
tabpage_tables tabpage_tables
tabpage_columns tabpage_columns
tabpage_filter tabpage_filter
tabpage_sort tabpage_sort
tabpage_preview tabpage_preview
tabpage_run tabpage_run
end type
end forward

global type w_export_report from pfc_w_main
integer x = 14
integer y = 4
integer width = 3630
integer height = 2360
string title = "Export Query Painter"
long backcolor = 80269524
tab_1 tab_1
end type
global w_export_report w_export_report

type variables
Integer ii_with_data = 0
Integer ii_total_where_values
Integer ii_current_wizard_step = 1
Integer ii_total_wizard_steps = 0
String is_wizard_lookup_name[]
String is_wizard_lookup_type[]
String is_wizard_field_name[]
String is_sql_where
String is_wizard_compare_field[]

Integer ii_project_id = 99

Integer ii_col_count

Integer ii_tag

Long il_view_id

Long il_next_table_id
Long il_next_link_id
Long il_next_where_id

Long il_next_field_id  
Long il_next_sort_id

String is_filter

String is_obj_name

String ls_label_name[]
String ls_column_name[]

Boolean ib_new
end variables

forward prototypes
public function integer of_save ()
public function string of_build_view_sql ()
public function integer of_get_next_ids ()
public function integer of_help (string selected_tab, string option)
public function integer of_preview (datawindow adw_preview)
public function integer of_wizard_setup ()
public function integer of_next_wizard ()
public function integer of_clean_up ()
end prototypes

public function integer of_save ();Integer li_rc
Integer li_found
Integer i
Integer l
Integer ll_cnt
String ls_tbl_nm
String ls_fld_nm
String ls_table_nm
String ls_table_ids[]
String ls_field
DataWindowChild dwchild

//dw_view.Update( )

tab_1.tabpage_tables.dw_view_tables.AcceptText( )

li_rc = tab_1.tabpage_tables.dw_view_tables.RowCount( )
FOR i = 1 TO li_rc
	IF IsNull( tab_1.tabpage_tables.dw_view_tables.GetItemNumber( i, "cust_table_name" ) ) THEN
		MessageBox("Missing Data", "You can not leave the table field blank." )
		tab_1.tabpage_tables.dw_view_tables.SetColumn( "cust_table_name" )
		tab_1.tabpage_tables.dw_view_tables.SetRow( i )
		tab_1.tabpage_tables.dw_view_tables.SetFocus( )		
		Return -1
	END IF
END FOR

tab_1.tabpage_tables.dw_view_tables.Update( )
tab_1.tabpage_tables.dw_view_links.Update( )
tab_1.tabpage_columns.dw_view_fields.Update( )
tab_1.tabpage_sort.dw_view_sort.Update( )
li_rc = tab_1.tabpage_filter.dw_view_where.RowCount( )
FOR i = 1 TO li_rc
	IF IsNull( tab_1.tabpage_filter.dw_view_where.GetItemString( i, "table_field_name" ) ) OR +&
  	   IsNull( tab_1.tabpage_filter.dw_view_where.GetItemString( i, "operator" ) ) OR +&
	   IsNull( tab_1.tabpage_filter.dw_view_where.GetItemString( i, "value" ) ) THEN
		MessageBox("Missing Data", "All fields must be completed." )
		tab_1.tabpage_filter.dw_view_where.SetColumn( "table_field_name" )
		tab_1.tabpage_filter.dw_view_where.SetRow( i )
		tab_1.tabpage_filter.dw_view_where.SetFocus( )		
		Return -1
	END IF
END FOR
tab_1.tabpage_filter.dw_view_where.Update( )

tab_1.tabpage_tables.dw_view_tables.Retrieve( il_view_id )

li_rc = tab_1.tabpage_tables.dw_view_tables.RowCount()

FOR i = 1 TO li_rc
	ls_table_ids[i] = tab_1.tabpage_tables.dw_view_tables.GetItemString( i, "table_name" ) 
END FOR

IF li_rc > 0 THEN
	tab_1.tabpage_columns.dw_fields_list.Retrieve( ls_table_ids )
	tab_1.tabpage_columns.dw_all_fields.Retrieve(  ls_table_ids  )
END IF

li_rc = tab_1.tabpage_columns.dw_view_fields.RowCount()
FOR i = 1 TO li_rc
	ls_tbl_nm = tab_1.tabpage_columns.dw_view_fields.GetItemString( i, "table_name" )
	ls_fld_nm = tab_1.tabpage_columns.dw_view_fields.GetItemString( i, "field_name" )
	li_found = tab_1.tabpage_columns.dw_fields_list.Find( "table_name = '" + ls_tbl_nm + "' AND field_name ='" + ls_fld_nm + "'" , 1, 1000 )
	IF li_found > 0 THEN
		tab_1.tabpage_columns.dw_fields_list.DeleteRow( li_found )
	END IF	
END FOR

tab_1.tabpage_sort.dw_view_sort.Retrieve(  il_view_id  )	
tab_1.tabpage_sort.dw_fields_list_sort.Retrieve(  il_view_id  )	
li_rc = tab_1.tabpage_sort.dw_view_sort.RowCount()

FOR i = 1 TO li_rc
	ls_field = tab_1.tabpage_sort.dw_view_sort.GetItemString( i, "field_name" )
	li_found = tab_1.tabpage_sort.dw_fields_list_sort.Find( "field_name = '" + ls_field + "'", 1, 10000 )
	IF li_found > 0 THEN
		tab_1.tabpage_sort.dw_fields_list_sort.DeleteRow( li_found )
	END IF
END FOR

Return 0
end function

public function string of_build_view_sql ();Integer i
Integer li_add_rec_fld  
Integer li_distinct_sql
Integer li_rc
Integer li_remove_len = 5
String ls_sql
String ls_table_field
Boolean 	lb_multi_table 

lb_multi_table = False

of_save()

SELECT conv_view.distinct_sql
INTO :li_distinct_sql  
FROM conv_view  
WHERE conv_view.view_id = :il_view_id   ;

IF li_distinct_sql  = 1 THEN
	ls_sql = "SELECT DISTINCT"  + "~n"
ELSE
	ls_sql = "SELECT "  + "~n"
END IF

//build the select field 
li_rc = tab_1.tabpage_columns.dw_view_fields.RowCount()

FOR i = 1 TO li_rc
	//IF
	//Pos(tab_1.tabpage_columns.dw_view_fields.GetItemString( i, "field_name" ) ,"." ) > 0 THEN	
	IF POS( tab_1.tabpage_columns.dw_view_fields.GetItemString( i, "table_field" ), "=" ) > 0 THEN
		ls_table_field = tab_1.tabpage_columns.dw_view_fields.GetItemString( i, "table_field" )
		ls_table_field = Mid( ls_table_field, POS( ls_table_field, "=" ) + 1 , 1000 )
		ls_sql = ls_sql + "~t" + tab_1.tabpage_columns.dw_view_fields.GetItemString( i, "field_alias" ) + " = " + ls_table_field + ",  " + "~n"			
		//ls_sql = ls_sql + "~t" + ls_table_field + ",  " + "~n"					
	ELSE
		ls_sql = ls_sql + "~t" + tab_1.tabpage_columns.dw_view_fields.GetItemString( i, "field_alias" ) + " = " + tab_1.tabpage_columns.dw_view_fields.GetItemString( i, "table_field" ) + ",  " + "~n"	
		//ls_sql = ls_sql + "~t" + tab_1.tabpage_columns.dw_view_fields.GetItemString( i, "table_field" ) + ",  " + "~n"			
	END IF
	//ls_sql = ls_sql + "~t" + tab_1.tabpage_columns.dw_view_fields.GetItemString( i, "table_field" ) + ",  " + "~n"
	//ELSE
	//	ls_sql = ls_sql + "~t" + tab_1.tabpage_columns.dw_view_fields.GetItemString( i, "table_field" ) + " as " +&
	//						tab_1.tabpage_columns.dw_view_fields.GetItemString( i, "field_alias" )+ ", " + "~n"
	//END IF
	//messagebox("", ls_sql)
END FOR

ls_sql = Left( ls_sql, Len( ls_sql ) - 4 ) + "~n"

SELECT conv_view.add_rec_id_fld  
INTO :li_add_rec_fld  
FROM conv_view  
WHERE conv_view.view_id = :il_view_id   ;

IF li_add_rec_fld  = 1 THEN
	ls_sql = ls_sql + "~t, rec_id = 100000000~n"
END IF


//build from clause
ls_sql = ls_sql + "FROM " + "~n"
li_rc = tab_1.tabpage_tables.dw_view_tables.RowCount()

FOR i = 1 TO li_rc
	ls_sql = ls_sql + "~t" + "" + tab_1.tabpage_tables.dw_view_tables.GetItemString( i, "table_name" ) + ", "  + "~n"
END FOR

ls_sql = Left( ls_sql, Len( ls_sql ) - 3 ) + "~n"

//build where clause for joins
li_rc = tab_1.tabpage_tables.dw_view_links.RowCount()

IF li_rc > 0 THEN
	ls_sql = ls_sql + "WHERE " + "~n"	
	FOR i = 1 TO li_rc
		lb_multi_table = True
		ls_sql = ls_sql + "~t" + "(" + tab_1.tabpage_tables.dw_view_links.GetItemString( i, "from_table_field" ) 
		ls_sql = ls_sql + " " + tab_1.tabpage_tables.dw_view_links.GetItemString( i, "link_type" ) + " "
		ls_sql = ls_sql + tab_1.tabpage_tables.dw_view_links.GetItemString( i, "to_table_field" ) 	+ ") AND ~n"
	END FOR

	ls_sql = Left( ls_sql, Len( ls_sql ) - 5 ) 
END IF

//build where filter
li_rc = tab_1.tabpage_filter.dw_view_where.RowCount()
IF li_rc > 0 THEN
	IF lb_multi_table = True THEN
		ls_sql = ls_sql + " AND ~n"
	ELSE
		ls_sql = ls_sql + " WHERE " + "~n"	
	END IF
	FOR i = 1 TO li_rc				
		ls_sql = ls_sql + "~t" + "(" + tab_1.tabpage_filter.dw_view_where.GetItemString( i, "table_field_name" ) 
		ls_sql = ls_sql + " " + tab_1.tabpage_filter.dw_view_where.GetItemString( i, "operator" ) + " "
		IF tab_1.tabpage_filter.dw_view_where.GetItemString( i, "operator" ) = "In" THEN
			ls_sql = ls_sql + "("
		END IF	
		ls_sql = ls_sql + tab_1.tabpage_filter.dw_view_where.GetItemString( i, "value" )
		IF tab_1.tabpage_filter.dw_view_where.GetItemString( i, "operator" ) = "In" THEN
			ls_sql = ls_sql + ")"
			//li_remove_len = 6
		END IF
		ls_sql = ls_sql +  ") AND ~n"	
	END FOR
	ls_sql = Left( ls_sql, Len( ls_sql ) - 5 ) + "~n"	
END IF

IF Len( is_sql_where ) > 0 THEN
	ls_sql = ls_sql + is_sql_where
END IF

//build order by clause
li_rc = tab_1.tabpage_sort.dw_view_sort.RowCount()
IF li_rc > 0 THEN
	ls_sql = ls_sql + "ORDER BY " + "~n"
	FOR i = 1 TO li_rc				
		ls_sql = ls_sql + "~t" + tab_1.tabpage_sort.dw_view_sort.GetItemString( i, "table_name" ) + "."
		ls_sql = ls_sql + tab_1.tabpage_sort.dw_view_sort.GetItemString( i, "field_name" ) + ","
	END FOR
	ls_sql = Left( ls_sql, Len( ls_sql ) - 1 ) + "~n"	
END IF


tab_1.tabpage_run.st_sql.Text = ls_sql
ClipBoard( ls_sql )
tab_1.tabpage_run.st_sql.Visible = True



Return ls_sql



end function

public function integer of_get_next_ids ();SELECT Max( table_id )  
INTO :il_next_table_id  
FROM conv_view_table;

IF IsNull( il_next_table_id ) THEN
	il_next_table_id = 1
END IF

SELECT Max( link_id )  
INTO :il_next_link_id  
FROM conv_view_links;

IF IsNull( il_next_link_id ) THEN
	il_next_link_id = 1
END IF


SELECT Max( sort_id )  
INTO :il_next_sort_id  
FROM conv_view_sort;

IF IsNull( il_next_sort_id ) THEN
	il_next_sort_id = 1
END IF


SELECT Max( field_id )  
INTO :il_next_field_id  
FROM conv_view_fields;

IF IsNull( il_next_field_id ) THEN
	il_next_field_id = 1
END IF

SELECT Max( where_id )  
INTO :il_next_where_id  
FROM conv_view_where;

IF IsNull( il_next_where_id ) THEN
	il_next_where_id = 1
END IF

Return 0
end function

public function integer of_help (string selected_tab, string option);//st_help_1.Visible = False
//st_help_2.Visible = False
//
//IF selected_tab = "browse" AND option = "" THEN
//	st_help_1.Visible = True
//	st_help_1.Text = "The browse tab displays all of the custom reports currently available and also allows you to create New custom reports.~n~r~n~r" +&
//			     "NEW            -  Create a new custom report.~n~r" +&
//				"DELETE       -  Delete a custom report.~n~r" +&
//				"SELECT       -  Select a custom report for edit or preview.  ( Double clicking the entry also selects the report.)"						
//END IF
//

Return 0
end function

public function integer of_preview (datawindow adw_preview);String ls_table_field
String ls_group_syntax
String ls_grey
String ls_align
String ls_white
String ls_presentation_str
String ls_dwsyntax_str
String ls_sql
String Errors
String ls_font
Integer z
Integer li_cnt
Integer li_return
Integer i
Integer li_FileNum
Long ll_last_fld_width
Long ll_start_position
Long ll_longest_width
Long ll_fld_x
Long ll_last_fld_x
Long ll_fld_id
Long ll_fld_width
String ls_db_nm
String ls_imp_file_nm
String ls_data_line
String ls_data_all

SetPointer( HourGlass! )

//This.SetRedraw( False )

ls_sql = of_build_view_sql()
//messagebox("", ls_sql)
//debugbreak()

adw_preview.Reset()
adw_preview.DataObject = ''

//"Style ( Type=value property=value ... )
//	DataWindow ( property=value ... )
//	Column ( property=value ... )
//	Group groupby_colnum1 Fby_colnum2 ... property ... )
//	Text property=value ... )
//	Title ( 'titlestring' )"
//


//new_syntax = SyntaxFromSQL("SELECT employee_id, salary FROM employee",
//"Style(Type=Group) Group(1)", Error)


ls_group_syntax = ""

ls_grey = String(rgb(192,192,192))
ls_white = String(rgb(255,255,255))
//ls_presentation_str = "style( type=Group) Group(1) Column(Border=0) Datawindow(Color=" + ls_white + " )" + "Text(Border=6 Background.Color=" + ls_grey + ")"
//IF adw_preview = tab_1.tabpage_preview.dw_preview THEN
	ls_presentation_str = "style( type=Group) Column(Border=0) Datawindow(Color=" + ls_white + " )" + "Text(Border=6 Background.Color=" + ls_grey + ")"
//ELSE
//	ls_presentation_str = "style( type=grid ) Group(1) Column(Border=0) Datawindow(Color=" + ls_white + " )" + "Text(Border=6 Background.Color=" + ls_grey + ")"	
//END IF

//ls_presentation_str = "style( type=grid ) Group(1) Column(Border=0) Datawindow(Color=" + ls_white + " )" + "Text(Border=6 Background.Color=" + ls_grey + ")"


//messagebox("", ls_presentation_str)
ls_dwsyntax_str = SQLCA.SyntaxFromSQL(ls_sql, &
	ls_presentation_str, ERRORS)

IF Len(ERRORS) > 0 THEN
	MessageBox("Caution", &
	"SyntaxFromSQL caused these errors: " + ERRORS)
	RETURN -1
END IF

//Open( w_preview_data )

adw_preview.Create( ls_dwsyntax_str, ERRORS)

IF Len(ERRORS) > 0 THEN
	MessageBox("Caution", &
	"Create cause these errors: " + ERRORS)
	RETURN -1
END IF


Integer li_rc
String ls_label
String ls_column
String ls_label_text
String ls_title
String ls_x
String ls_field_allias
Long ll_width

adw_preview.SetTransObject( SQLCA )
adw_preview.Modify("DataWindow.Header.Height='420'")
//adw_preview.Modify("DataWindow.Detail.Height='500'")
li_rc = tab_1.tabpage_columns.dw_view_fields.RowCount()

ii_col_count = li_rc


FOR i = 1 TO li_rc
	ls_field_allias = tab_1.tabpage_columns.dw_view_fields.GetItemString( i, "field_alias" ) 
	ls_label = ls_field_allias + "_t"
	ls_column = ls_field_allias
	
	//ls_table_field = tab_1.tabpage_columns.dw_view_fields.GetItemString( i, "table_field" )
	//ls_table_field = Mid( ls_table_field, POS( ls_table_field, "=" ) + 1 , 1000 )
	//ls_label = ls_table_field + "_t"
	//ls_label = Mid( ls_column, 1, POS( ls_column, "." ) -1 ) + "_" + Mid( ls_column, POS( ls_column, "." ) +1, 100 )
	//messagebox("", ls_column)
	
	
//	IF tab_1.tabpage_columns.dw_view_fields.GetItemNumber( i, "sel_field_id" ) > 0 THEN
//		IF tab_1.tabpage_tables.dw_view_tables.RowCount() > 1 THEN
//			ls_label = tab_1.tabpage_columns.dw_view_fields.GetItemString( i, "table_field" )
//			ls_column	= Mid( ls_label, 1, POS( ls_label, "." )-1 ) + "_" + Mid( ls_label, POS( ls_label, "." ) + 1 , 100 )		
//			ls_label = Mid( ls_label, 1, POS( ls_label, "." )-1 ) + "_" + Mid( ls_label, POS( ls_label, "." ) + 1 , 100 ) + "_t"					
//		ELSE
//			ls_label = tab_1.tabpage_columns.dw_view_fields.GetItemString( i, "field_name" )
//			ls_column  = ls_label			
//			ls_label = ls_label + "_t"
//		END IF
//	ELSE
//		ls_label = tab_1.tabpage_columns.dw_view_fields.GetItemString( i, "table_name" )
//		//ls_label = tab_1.tabpage_columns.dw_view_fields.GetItemString( i, "table_field" )
//		ls_column = ls_label
//		ls_label = ls_label + '_t'
//	END IF
//	
	ls_column = Mid( ls_column, 1, 40 )
	ls_label = Mid( ls_label, 1, 40 )
	
	string ls_return
	//messagebox("column name 1", adw_preview.describe( "#1.name" ))
	//messagebox("column name 2", adw_preview.describe( "#2.name" ))
	//messagebox("column name 3", adw_preview.describe( "#3.name" ))	
	//messagebox("label variable", ls_label )
	ls_return = adw_preview.Modify( ls_label + ".y='260'")	
	//messagebox("return value", ls_return)

	//ls_label_text = tab_1.tabpage_columns.dw_view_fields.GetItemString( i, "field_alias" ) 
	ls_label_text = tab_1.tabpage_columns.dw_view_fields.GetItemString( i, "label_text" ) 
	adw_preview.Modify( ls_label + ".Text='" + ls_label_text + "'")	
	
	adw_preview.Modify( ls_label + ".height='120'")		

	adw_preview.Modify( ls_label + ".Border='1'")		

	ls_label_name[i] = adw_preview.Describe( ls_label + ".name")			
	ls_column_name[i] = adw_preview.Describe( ls_column + ".name")			
	adw_preview.Modify( ls_label + ".tag ='" + String( i ) + "'")			
	adw_preview.Modify( ls_column + ".tag ='" + String( i ) + "'")			
	
	//adw_preview.Modify(ls_column + ".Border='2'")
	
	IF IsNull( tab_1.tabpage_columns.dw_view_fields.GetItemString( i, "field_display_width" ) ) OR +&
		tab_1.tabpage_columns.dw_view_fields.GetItemString( i, "field_display_width" ) = ""  THEN		
		ll_width = Long( adw_preview.Describe( ls_column + ".width") )
		tab_1.tabpage_columns.dw_view_fields.SetItem( i, "field_display_width", String( ll_width ) )	
	ELSE
		ll_width = Long(tab_1.tabpage_columns.dw_view_fields.GetItemString( i, "field_display_width" ))
		//adw_preview.Modify( ls_label + ".width ='" + String( ll_width ) + "'")			
		//adw_preview.Modify( ls_column + ".width ='" + String( ll_width ) + "'")			
	END IF

	IF tab_1.tabpage_columns.dw_view_fields.GetItemNumber( i, "field_visible" ) = 0 THEN				
		ll_width = 0
	END IF
	adw_preview.Modify( ls_label + ".width ='" + String( ll_width ) + "'")			
	adw_preview.Modify( ls_column + ".width ='" + String( ll_width ) + "'")			



		IF IsNull( tab_1.tabpage_columns.dw_view_fields.GetItemNumber( i, "field_x" ) ) OR +&
			tab_1.tabpage_columns.dw_view_fields.GetItemNumber( i, "field_x" ) = 0  THEN
			//Messagebox("", "field_x = 0")
			IF NOT ib_new THEN
				//MessageBox("", "not new" )
				ll_last_fld_x = 0
				FOR z = 1 TO li_rc
					ll_fld_x = tab_1.tabpage_columns.dw_view_fields.GetItemNumber( z, "field_x" ) 
					IF ll_fld_x > ll_last_fld_x THEN
						ll_last_fld_x = ll_fld_x
						ll_last_fld_width = Long( tab_1.tabpage_columns.dw_view_fields.GetItemString( z, "field_display_width" ) )
					END IF
				END FOR
				ls_x = String( ll_last_fld_x + ll_last_fld_width + 20 )
				tab_1.tabpage_columns.dw_view_fields.SetItem( i, "field_x", ll_last_fld_x + ll_last_fld_width + 20 )			
				adw_preview.Modify( ls_label + ".x ='"  + ls_x  + "'")			
				adw_preview.Modify( ls_column + ".x ='" + ls_x  + "'")										
			ELSE	
				ls_x = adw_preview.Describe( ls_column + ".x") 
				tab_1.tabpage_columns.dw_view_fields.SetItem( i, "field_x", Long(ls_x)  )
			END IF
		ELSE
			ls_x = String(tab_1.tabpage_columns.dw_view_fields.GetItemNumber( i, "field_x" ))
			adw_preview.Modify( ls_label + ".x ='"  + ls_x  + "'")			
			adw_preview.Modify( ls_column + ".x ='" + ls_x  + "'")					
			tab_1.tabpage_columns.dw_view_fields.SetItem( i, "field_x", Long(ls_x)  )								
		END IF	


END FOR

ls_title = tab_1.tabpage_browse.dw_report_list.GetItemString( tab_1.tabpage_browse.dw_report_list.GetRow(), "view_name" )

IF tab_1.tabpage_browse.dw_report_list.GetItemString( tab_1.tabpage_browse.dw_report_list.GetRow(), "orientation" ) =  "P" THEN
	adw_preview.Modify("DataWindow.Print.Orientation= '2'")
	tab_1.tabpage_preview.rb_p.Checked = True
	tab_1.tabpage_preview.rb_l.Checked = False	
ELSE
	adw_preview.Modify("DataWindow.Print.Orientation= '1'")	
	tab_1.tabpage_preview.rb_p.Checked = False
	tab_1.tabpage_preview.rb_l.Checked = True	
END IF

adw_preview.Modify("create text(band=header text='Report: " + ls_title + "' border='0' color='0' x='10' y='10' height='60' width='1400'  font.face='MS Sans Serif' font.height='-11' font.weight='600'  font.family='2' font.pitch='2' font.charset='0' background.mode='1' background.color='553648127' name=title1_t)" )
adw_preview.Modify("create text(band=header text='Date: " + String( Today() ) + "' border='0' color='0' x='10' y='80' height='60' width='1400'  font.face='MS Sans Serif' font.height='-11' font.weight='600'  font.family='2' font.pitch='2' font.charset='0' background.mode='1' background.color='553648127' name=title2_t)" )
adw_preview.Modify("create text(band=header text='Filter: " + is_filter + "' border='0' color='0' x='10' y='150' height='60' width='1400'  font.face='MS Sans Serif' font.height='-11' font.weight='600'  font.family='2' font.pitch='2' font.charset='0' background.mode='1' background.color='553648127' name=title3_t)" )

IF adw_preview = tab_1.tabpage_run.dw_run OR ii_with_data = 1 THEN
	adw_preview.Retrieve()
END IF


tab_1.tabpage_preview.st_left.BorderStyle = StyleRaised!
tab_1.tabpage_preview.st_center.BorderStyle = StyleRaised!
tab_1.tabpage_preview.st_right.BorderStyle = StyleRaised!		
tab_1.tabpage_preview.st_f_left.BorderStyle = StyleRaised!
tab_1.tabpage_preview.st_f_center.BorderStyle = StyleRaised!
tab_1.tabpage_preview.st_f_right.BorderStyle = StyleRaised!		

IF IsNull( tab_1.tabpage_browse.dw_report_list.GetItemNumber( tab_1.tabpage_browse.dw_report_list.GetRow(), "font_size" ) ) THEN
	ls_font = Mid( adw_preview.Describe( ls_column_name[ 1 ] + ".Font.Height" ),2,100)	
	tab_1.tabpage_preview.em_font.Text = ls_font
ELSE
	ls_font = String( tab_1.tabpage_browse.dw_report_list.GetItemNumber( tab_1.tabpage_browse.dw_report_list.GetRow(), "font_size" ))
	tab_1.tabpage_preview.em_font.Text = ls_font
END IF

FOR i = 1 TO ii_col_count
	adw_preview.Modify( ls_column_name[ i ] + ".Font.Face='MS Sans Serif'")		
	adw_preview.Modify( ls_column_name[ i ] + ".Font.Height='-" + ls_font + "'")	
	adw_preview.Modify( ls_label_name[ i ] + ".Font.Height='-" + ls_font + "'")	
	IF adw_preview.Describe( ls_column_name[ i ] + ".coltype" ) = "datetime" THEN
		adw_preview.SetFormat( ls_column_name[ i ], "mm/dd/yyyy" )
	END IF	
	ls_align = String( tab_1.tabpage_columns.dw_view_fields.GetItemNumber( i, "field_align" )	)
	adw_preview.Modify( ls_column_name[ i ] + ".alignment = '" + ls_align + "'" )		
	ls_align = String( tab_1.tabpage_columns.dw_view_fields.GetItemNumber( i, "label_align" )	)
	adw_preview.Modify( ls_label_name[ i ] + ".alignment = '" + ls_align + "'" )			
END FOR


IF adw_preview.Title = "" THEN
	adw_preview.Modify("DataWindow.Print.Preview=No")
ELSE
	adw_preview.Modify("DataWindow.Print.Preview=Yes")
END IF

//adw_preview.Modify("DataWindow.Print.Preview.Rulers=Yes")

//messagebox("", adw_preview.Describe("DataWindow.Syntax") )

adw_preview.Modify("DataWindow.Grid.Lines='1'" )

//This.SetRedraw( True )

Return 0


end function

public function integer of_wizard_setup ();Integer i
Integer li_cnt
Integer li_rc


li_rc = tab_1.tabpage_columns.dw_view_fields.RowCount()

FOR i = 1 TO li_rc
	IF Len( tab_1.tabpage_columns.dw_view_fields.GetItemString( i, "field_wizard_name" ) ) > 0 THEN
		li_cnt++		
		is_wizard_lookup_name[ li_cnt ] = tab_1.tabpage_columns.dw_view_fields.GetItemString( i, "field_wizard_name" )
		is_wizard_lookup_type[ li_cnt ] = tab_1.tabpage_columns.dw_view_fields.GetItemString( i, "field_wizard_type" )
		is_wizard_field_name[ li_cnt ] = tab_1.tabpage_columns.dw_view_fields.GetItemString( i, "field_name" )
		is_wizard_compare_field[ li_cnt ] = tab_1.tabpage_columns.dw_view_fields.GetItemString( i, "field_options" )		
	END IF
END FOR


ii_total_wizard_steps = li_cnt
ii_current_wizard_step = 0

of_next_wizard()

//tab_1.tabpage_run.dw_wizard.SetTransObject( SQLCA )
//tab_1.tabpage_run.dw_wizard.Retrieve( is_wizard_lookup_name[ 1 ] )
//tab_1.tabpage_run.dw_wizard.Modify( "st_name.text = '" + is_wizard_lookup_name[ 1 ] + "'" )
//
Return 0
end function

public function integer of_next_wizard ();Integer li_rc
Integer i
Integer li_first_param
String ls_from_date
String ls_to_date

IF ii_current_wizard_step = 0 THEN
	ii_total_where_values = 0
	IF tab_1.tabpage_tables.dw_view_tables.RowCount() = 1 THEN
		is_sql_where = " WHERE "
	ELSE
		is_sql_where = ""
	END IF
END IF

//Process current wizard step
//DEBUGBREAK()
IF ii_current_wizard_step > 0 THEN
	IF ( tab_1.tabpage_tables.dw_view_tables.RowCount() > 1 AND ii_current_wizard_step = 1 ) OR ii_total_where_values > 0 THEN
		is_sql_where = is_sql_where + " AND "
	END IF

	tab_1.tabpage_run.dw_wizard.AcceptText()
	li_first_param=0
	
	IF tab_1.tabpage_run.dw_wizard.DataObject = "d_crit_date_range_custom" THEN
		ls_from_date = String( tab_1.tabpage_run.dw_wizard.GetItemDate( 1, "from_date" ), 'yyyy/mm/dd' )
		ls_to_date = String( tab_1.tabpage_run.dw_wizard.GetItemDate( 1, "to_date" ), 'yyyy/mm/dd' )		
		IF NOT IsNull( ls_from_date + ls_to_date ) AND ls_from_date + ls_to_date <> "" THEN
			is_sql_where = is_sql_where + "( Date( " + is_wizard_field_name[ ii_current_wizard_step ] + " )  >= Cast('" + ls_from_date + "' AS DATE ) AND " +&
				                           "Date( " + is_wizard_field_name[ ii_current_wizard_step ] + " )  <= Cast('" + ls_to_date + "' AS DATE ) )"		
			ii_total_where_values++								
		END IF
	ELSEIF tab_1.tabpage_run.dw_wizard.DataObject = "d_crit_single_date_custom" THEN
		//--------------------------- APPEON BEGIN ---------------------------
		//$<modify> 12.01.2006 By: Davis
		//$<reason> Fix a defect.
		//is_sql_where = is_sql_where + "DateFormat( " + is_wizard_field_name[ ii_current_wizard_step ] + ", 'mm/dd/yyyy' ) = '" + String( tab_1.tabpage_run.dw_wizard.GetItemDate( 1, "from_date" ), 'mm/dd/yyyy' ) + "'"		
		is_sql_where = is_sql_where + "Convert(varchar(10), " + is_wizard_field_name[ ii_current_wizard_step ] + ", 101 ) = '" + String( tab_1.tabpage_run.dw_wizard.GetItemDate( 1, "from_date" ), 'mm/dd/yyyy' ) + "'"		
		//---------------------------- APPEON END ----------------------------
		ii_total_where_values++	
	ELSE
		IF tab_1.tabpage_run.dw_wizard.GetItemNumber( 1, "selected" ) = 0 THEN
			li_rc = tab_1.tabpage_run.dw_wizard.RowCount()	
			FOR i = 1 TO li_rc
				ii_total_where_values++
				IF tab_1.tabpage_run.dw_wizard.GetItemNumber( i, "selected" ) = 1 THEN
					li_first_param++
					IF li_first_param = 1 THEN
						is_sql_where = is_sql_where + "("
					END IF
					is_sql_where = is_sql_where + is_wizard_field_name[ ii_current_wizard_step ] + " = '" 
					IF is_wizard_lookup_type[ ii_current_wizard_step ] = "C" THEN
						IF is_wizard_compare_field[ ii_current_wizard_step ] = "C" THEN
							is_sql_where = is_sql_where + tab_1.tabpage_run.dw_wizard.GetItemString( i, "code" ) + "' OR " 
						ELSE
							is_sql_where = is_sql_where + tab_1.tabpage_run.dw_wizard.GetItemString( i, "description" ) + "' OR " 
						END IF
					ELSEIF is_wizard_lookup_type[ ii_current_wizard_step ] = "A" THEN
						IF is_wizard_compare_field[ ii_current_wizard_step ] = "C" THEN						
							is_sql_where = is_sql_where + tab_1.tabpage_run.dw_wizard.GetItemString( i, "code" ) + "' OR " 							
						ELSE
							is_sql_where = is_sql_where + tab_1.tabpage_run.dw_wizard.GetItemString( i, "entity_name" ) + "' OR " 
						END IF
					ELSEIF  is_wizard_lookup_type[ ii_current_wizard_step ] = "F" THEN
							is_sql_where = is_sql_where + tab_1.tabpage_run.dw_wizard.GetItemString( i, "facility_name" ) + "' OR " 
							
					END IF
				END IF
			END FOR
			is_sql_where = Mid( is_sql_where, 1, Len( is_sql_where ) -3 ) + ")"		
			IF li_first_param = 0 THEN
				is_sql_where = Mid( is_sql_where, 1, Len( is_sql_where ) -2 )
			END IF
		ELSE
			IF Left( is_sql_where, 5 ) = " AND " THEN
				is_sql_where = Mid( is_sql_where, 1, Len( is_sql_where ) -5 )
			END IF		
		END IF
	END IF
END IF

//MessageBox("", is_sql_where )

ii_current_wizard_step++
//Goto next wizard step or run report if its the last step
IF ii_current_wizard_step > ii_total_wizard_steps THEN
	IF Right( is_sql_where, 5 ) = " AND " THEN
		is_sql_where = Mid( is_sql_where, 1, Len( is_sql_where ) -5 )
	END IF			
	IF Right( is_sql_where, 7 ) = " WHERE " THEN
		is_sql_where = Mid( is_sql_where, 1, Len( is_sql_where ) -7 )
	END IF				
	//IF Len( is_sql_where ) = 5 THEN
	//	is_sql_where = ""
	//END IF
	of_preview( tab_1.tabpage_run.dw_run )
	ii_current_wizard_step = 0
	tab_1.tabpage_run.dw_wizard.Reset()
	tab_1.tabpage_run.cb_next_run.Enabled = False
ELSE
	tab_1.tabpage_run.st_step.Text = "Step " + String( ii_current_wizard_step ) + " of " + String( ii_total_wizard_steps )
	IF is_wizard_lookup_type[ ii_current_wizard_step ] = "C" THEN
		tab_1.tabpage_run.dw_wizard.DataObject = "d_crit_custom"		
	//if its a date range
	ELSEIF is_wizard_lookup_type[ ii_current_wizard_step ] = "R" THEN
		tab_1.tabpage_run.dw_wizard.DataObject = "d_crit_date_range_custom"		
	ELSEIF is_wizard_lookup_type[ ii_current_wizard_step ] = "D" THEN		
		tab_1.tabpage_run.dw_wizard.DataObject = "d_crit_single_date_custom"				
	ELSEIF is_wizard_lookup_type[ ii_current_wizard_step ] = "F" THEN		
		tab_1.tabpage_run.dw_wizard.DataObject = "d_crit_facility"						
	ELSE
		tab_1.tabpage_run.dw_wizard.DataObject = "d_crit_custom_address"
	END IF
	tab_1.tabpage_run.dw_wizard.of_SetRowManager( TRUE )
	tab_1.tabpage_run.dw_wizard.of_SetReqColumn(True)

	tab_1.tabpage_run.dw_wizard.of_SetDropDownCalendar( TRUE )
	tab_1.tabpage_run.dw_wizard.iuo_calendar.of_Register(tab_1.tabpage_run.dw_wizard.iuo_calendar.DDLB)
	
	tab_1.tabpage_run.dw_wizard.SetTransObject( SQLCA )
	tab_1.tabpage_run.dw_wizard.Retrieve( is_wizard_lookup_name[ ii_current_wizard_step ] )
	tab_1.tabpage_run.dw_wizard.Modify( "st_name.text = '" + is_wizard_lookup_name[ ii_current_wizard_step ] + " for " + is_wizard_field_name[ ii_current_wizard_step ] + "'" )
END IF

RETURN 0
end function

public function integer of_clean_up ();
tab_1.tabpage_tables.dw_view_tables.Reset()
tab_1.tabpage_tables.dw_view_links.Reset()
tab_1.tabpage_columns.dw_view_fields.Reset()
tab_1.tabpage_filter.dw_view_where.Reset()
tab_1.tabpage_sort.dw_view_sort.Reset()


Return 1
end function

on w_export_report.create
int iCurrent
call super::create
this.tab_1=create tab_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.tab_1
end on

on w_export_report.destroy
call super::destroy
destroy(this.tab_1)
end on

type tab_1 from tab within w_export_report
event create ( )
event destroy ( )
integer x = 18
integer y = 36
integer width = 3520
integer height = 2176
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
tabpage_browse tabpage_browse
tabpage_tables tabpage_tables
tabpage_columns tabpage_columns
tabpage_filter tabpage_filter
tabpage_sort tabpage_sort
tabpage_preview tabpage_preview
tabpage_run tabpage_run
end type

on tab_1.create
this.tabpage_browse=create tabpage_browse
this.tabpage_tables=create tabpage_tables
this.tabpage_columns=create tabpage_columns
this.tabpage_filter=create tabpage_filter
this.tabpage_sort=create tabpage_sort
this.tabpage_preview=create tabpage_preview
this.tabpage_run=create tabpage_run
this.Control[]={this.tabpage_browse,&
this.tabpage_tables,&
this.tabpage_columns,&
this.tabpage_filter,&
this.tabpage_sort,&
this.tabpage_preview,&
this.tabpage_run}
end on

on tab_1.destroy
destroy(this.tabpage_browse)
destroy(this.tabpage_tables)
destroy(this.tabpage_columns)
destroy(this.tabpage_filter)
destroy(this.tabpage_sort)
destroy(this.tabpage_preview)
destroy(this.tabpage_run)
end on

event selectionchanging;IF newindex = 1 THEN
	//st_help_1.Visible = True
	//st_help_2.Visible = True	
	of_help( "browse", "" )
ELSEIF newindex = 6 THEN
	//of_preview( tab_1.tabpage_preview.dw_preview )
	of_preview( tab_1.tabpage_preview.dw_preview )	
ELSEIF newindex = 5 THEN
	of_save()
	//tab_1.tabpage_sort.dw_fields_list_sort.Retrieve( il_view_id )
ELSEIF newindex = 7 THEN
	//st_help_1.Visible = False
	//st_help_2.Visible = False
	tab_1.tabpage_run.st_sql.Text = ""
	tab_1.tabpage_run.st_sql.Visible = False	
	tab_1.tabpage_run.cb_next_run.Enabled = True
	of_wizard_setup()
END IF

IF oldindex = 2 THEN
	IF tab_1.tabpage_tables.cbx_distinct.Checked THEN
		UPDATE conv_view
		SET distinct_sql = 1
		WHERE conv_view.view_id = :il_view_id ;
	ELSE
		UPDATE conv_view
		SET distinct_sql = 0
		WHERE conv_view.view_id = :il_view_id ;	
	END IF
	IF SQLCA.SQLCODE = -1 THEN
		MessageBox("DB Error", SQLCA.SQLERRTEXT )
	END IF
END IF
	
end event

type tabpage_browse from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 3483
integer height = 2048
long backcolor = 79741120
string text = "Browse"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "PlaceColumn5!"
long picturemaskcolor = 12632256
cb_1 cb_1
cb_select cb_select
dw_report_list dw_report_list
cb_next_1 cb_next_1
cb_delete cb_delete
end type

on tabpage_browse.create
this.cb_1=create cb_1
this.cb_select=create cb_select
this.dw_report_list=create dw_report_list
this.cb_next_1=create cb_next_1
this.cb_delete=create cb_delete
this.Control[]={this.cb_1,&
this.cb_select,&
this.dw_report_list,&
this.cb_next_1,&
this.cb_delete}
end on

on tabpage_browse.destroy
destroy(this.cb_1)
destroy(this.cb_select)
destroy(this.dw_report_list)
destroy(this.cb_next_1)
destroy(this.cb_delete)
end on

type cb_1 from commandbutton within tabpage_browse
integer x = 59
integer y = 1892
integer width = 247
integer height = 84
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&New"
end type

event clicked;ib_new = True

of_get_next_ids()

cb_next_1.Enabled = True

Integer li_nr
Long ll_next_view_id  

li_nr = dw_report_list.InsertRow( 0 )

dw_report_list.ScrollToRow( li_nr )
dw_report_list.SetRow( li_nr )
dw_report_list.SetFocus()
dw_report_list.SelectRow( 0, False )
dw_report_list.SelectRow( li_nr, TRue )

cb_next_1.Enabled = True

SELECT Max( view_id )  
INTO :ll_next_view_id  
FROM conv_view  ;

IF IsNull( ll_next_view_id ) THEN
	ll_next_view_id = 1
ELSE
	ll_next_view_id ++
END IF

il_view_id = ll_next_view_id

dw_report_list.SetItem( li_nr, "view_id", ll_next_view_id  )
dw_report_list.SetItem( li_nr, "project_id", ii_project_id )

of_clean_up()

tab_1.tabpage_run.Enabled = False
tab_1.tabpage_preview.Enabled = False
tab_1.tabpage_filter.Enabled = False
tab_1.tabpage_sort.Enabled = False
tab_1.tabpage_columns.Enabled = False
tab_1.tabpage_tables.Enabled = False

tab_1.tabpage_columns.dw_view_fields.Retrieve( il_view_id )

tab_1.tabpage_tables.cbx_distinct.Checked = True
end event

type cb_select from commandbutton within tabpage_browse
integer x = 608
integer y = 1892
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
boolean enabled = false
string text = "&Select"
end type

event clicked;dw_report_list.TriggerEvent( doubleClicked! )
end event

type dw_report_list from u_dw within tabpage_browse
integer x = 59
integer y = 56
integer width = 1312
integer height = 1808
integer taborder = 20
boolean bringtotop = true
string dataobject = "d_export_query_list"
end type

event constructor;call super::constructor;This.of_SetTransObject(SQLCA)
This.Retrieve()

IF dw_report_list.RowCount() > 0 THEN
	dw_report_list.SetRow( 1 )
	dw_report_list.SelectRow( 0, False )
	dw_report_list.SelectRow( 1, True )
END IF
end event

event clicked;call super::clicked;IF row > 0 THEN
	This.SetRow( row )
	This.SelectRow( 0 , False )
	This.SelectRow( row, True )
	This.ScrollToRow( row )
END IF
end event

event doubleclicked;call super::doubleclicked;Integer li_rc
Integer i
Integer li_found
Integer li_add_rec_fld
Integer li_distinct_sql
String ls_field
String ls_table_ids[]

ib_new = False

tab_1.tabpage_columns.Enabled = True
tab_1.tabpage_filter.Enabled = True
tab_1.tabpage_preview.Enabled = True
tab_1.tabpage_run.Enabled = True
tab_1.tabpage_sort.Enabled = True
tab_1.tabpage_tables.Enabled = True

IF row > 0 THEN
	il_view_id = This.GetItemNumber( row, "view_id" )
	tab_1.tabpage_tables.dw_view_tables.Retrieve( il_view_id )
	of_get_next_ids()
	li_rc = tab_1.tabpage_tables.dw_view_tables.RowCount()
	FOR i = 1 TO li_rc
		ls_table_ids[i] = tab_1.tabpage_tables.dw_view_tables.GetItemString( i, "table_name" ) 
	END FOR
	
	IF li_rc > 0 THEN
		tab_1.tabpage_columns.dw_fields_list.Retrieve( ls_table_ids )
		tab_1.tabpage_columns.dw_all_fields.Retrieve( ls_table_ids )
	END IF	
	
	tab_1.tabpage_tables.dw_view_links.Retrieve( il_view_id )
	tab_1.tabpage_columns.dw_view_fields.Retrieve( il_view_id )
	tab_1.tabpage_filter.dw_view_where.Retrieve( il_view_id )
	


	li_rc = tab_1.tabpage_columns.dw_view_fields.RowCount()
	FOR i = 1 TO li_rc
		ls_field = tab_1.tabpage_columns.dw_view_fields.GetItemString( i, "table_field" )
		li_found = tab_1.tabpage_columns.dw_fields_list.Find( "table_field = '" + ls_field + "'", 1, 10000 )
		IF li_found > 0 THEN
			tab_1.tabpage_columns.dw_fields_list.DeleteRow( li_found )
		END IF
	END FOR

	SELECT conv_view.add_rec_id_fld  
	INTO :li_add_rec_fld  
	FROM conv_view  
	WHERE conv_view.view_id = :il_view_id   ;

	IF li_add_rec_fld  = 1 THEN
		//cbx_rec_id.Checked = True
	ELSE
		//cbx_rec_id.Checked = False
	END IF

	SELECT conv_view.distinct_sql
	INTO :li_distinct_sql  
	FROM conv_view  
	WHERE conv_view.view_id = :il_view_id   ;

	IF li_distinct_sql  = 1 THEN
		tab_1.tabpage_tables.cbx_distinct.Checked = True
	ELSE
		tab_1.tabpage_tables.cbx_distinct.Checked = False
	END IF
	tab_1.SelectTab( 2 )
	
	of_save()
	
END IF




end event

event retrieveend;call super::retrieveend;IF rowcount > 0 THEN
	cb_select.Enabled = True
	cb_delete.Enabled = True
END IF
end event

type cb_next_1 from commandbutton within tabpage_browse
integer x = 3109
integer y = 1892
integer width = 334
integer height = 84
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "Next ->"
end type

event clicked;dw_report_list.AcceptText()
IF IsNull( dw_report_list.GetItemString( dw_report_list.GetRow(), "view_name" )) THEN
	MessageBox("Missing Data", "The name of the report must be filled in." )
	dw_report_list.SetFocus()
	Return 
END IF
dw_report_list.Update()

tab_1.tabpage_tables.Enabled = True

tab_1.SelectTab( 2 )
end event

type cb_delete from commandbutton within tabpage_browse
integer x = 334
integer y = 1892
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
boolean enabled = false
string text = "&Delete"
end type

event clicked;Integer li_view_id

IF dw_report_list.RowCount() = 0 THEN
	Return
END IF

li_view_id = dw_report_list.GetItemNumber( dw_report_list.GetRow(), "view_id" )

Delete 
From conv_view_where
Where view_id = :li_view_id;
IF SQLCA.SQLCODE = -1 THEN
	MessageBox( "Error", SQLCA.SQLERRTEXT )
	Return -1
END IF

Delete 
From conv_view_table
Where view_id = :li_view_id;
IF SQLCA.SQLCODE = -1 THEN
	MessageBox( "Error", SQLCA.SQLERRTEXT )
	Return -1
END IF

Delete 
From conv_view_fields
Where view_id = :li_view_id;
IF SQLCA.SQLCODE = -1 THEN
	MessageBox( "Error", SQLCA.SQLERRTEXT )
	Return -1
END IF

Delete 
From conv_view_links
Where view_id = :li_view_id;
IF SQLCA.SQLCODE = -1 THEN
	MessageBox( "Error", SQLCA.SQLERRTEXT )
	Return -1
END IF

Delete 
From conv_view_sort //maha 042202
Where view_id = :li_view_id;
IF SQLCA.SQLCODE = -1 THEN
	MessageBox( "Error", SQLCA.SQLERRTEXT )
	Return -1
END IF

Delete 
From conv_view
Where view_id = :li_view_id;
IF SQLCA.SQLCODE = -1 THEN
	MessageBox( "Error", SQLCA.SQLERRTEXT )
	Return -1
END IF



dw_report_list.Retrieve()
IF dw_report_list.RowCount() > 0 THEN
	dw_report_list.SetRow( 1 )
	dw_report_list.SelectRow( 0, False )
	dw_report_list.SelectRow( 1, True )
END IF


end event

type tabpage_tables from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 3483
integer height = 2048
boolean enabled = false
long backcolor = 79741120
string text = "Tables"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "DataWindow!"
long picturemaskcolor = 12632256
dw_view_tables dw_view_tables
dw_view_links dw_view_links
cb_view_add_tbl cb_view_add_tbl
cb_view_del_tbl cb_view_del_tbl
cb_next_2 cb_next_2
cb_view_del_link cb_view_del_link
cb_view_add_link cb_view_add_link
cb_9 cb_9
cbx_distinct cbx_distinct
end type

on tabpage_tables.create
this.dw_view_tables=create dw_view_tables
this.dw_view_links=create dw_view_links
this.cb_view_add_tbl=create cb_view_add_tbl
this.cb_view_del_tbl=create cb_view_del_tbl
this.cb_next_2=create cb_next_2
this.cb_view_del_link=create cb_view_del_link
this.cb_view_add_link=create cb_view_add_link
this.cb_9=create cb_9
this.cbx_distinct=create cbx_distinct
this.Control[]={this.dw_view_tables,&
this.dw_view_links,&
this.cb_view_add_tbl,&
this.cb_view_del_tbl,&
this.cb_next_2,&
this.cb_view_del_link,&
this.cb_view_add_link,&
this.cb_9,&
this.cbx_distinct}
end on

on tabpage_tables.destroy
destroy(this.dw_view_tables)
destroy(this.dw_view_links)
destroy(this.cb_view_add_tbl)
destroy(this.cb_view_del_tbl)
destroy(this.cb_next_2)
destroy(this.cb_view_del_link)
destroy(this.cb_view_add_link)
destroy(this.cb_9)
destroy(this.cbx_distinct)
end on

type dw_view_tables from datawindow within tabpage_tables
integer x = 59
integer y = 56
integer width = 1221
integer height = 632
integer taborder = 30
boolean titlebar = true
string title = "2. Select Tables To Use In View"
string dataobject = "d_conv_view_tables_report"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;This.SetTransObject( SQLCA )
end event

event itemchanged;//Integer li_Rc
//Integer i
//String ls_table_ids[]
//String ls_table_name
//Long ll_table_id
//
//li_rc = dw_view_tables.RowCount()
//
//
//cb_view_save.PostEvent( Clicked! )
//
end event

type dw_view_links from datawindow within tabpage_tables
integer x = 55
integer y = 900
integer width = 3301
integer height = 600
integer taborder = 40
boolean titlebar = true
string title = "3. Create View Table Links"
string dataobject = "d_conv_view_links"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event buttonclicked;String ls_name
String ls_table_name
String ls_obj_nm
Long ll_obj_id



ls_name = dwo.name

IF ls_name = "from_table" OR ls_name = "to_table" THEN
	OpenWithParm( w_conv_select_table, il_view_id )
	IF Message.StringParm = "Cancel" THEN
		Return
	END IF
	ls_obj_nm = Mid( Message.StringParm, Pos( Message.StringParm, "-" ) +1, 1000 )
	ll_obj_id = Long( Mid( Message.StringParm, 1, Pos( Message.StringParm, "-" ) -1 ) )
	IF ls_name = "from_table"  THEN
		dw_view_links.SetItem( row, "link_from_table_nm", ls_obj_nm )
		dw_view_links.SetItem( row, "link_from_table", ll_obj_id )	
	ELSE
		dw_view_links.SetItem( row, "link_to_table_nm", ls_obj_nm )
		dw_view_links.SetItem( row, "link_to_table", ll_obj_id )			
	END IF
ELSEIF ls_name = "from_field" OR ls_name = "to_field" THEN
	IF ls_name = "from_field"  THEN
		ls_table_name = This.GetItemString( row, "link_from_table_nm" )
		//ll_obj_id = This.GetItemNumber( row, "link_from_table" )
	ELSE
		ls_table_name = This.GetItemString( row, "link_to_table_nm" )		
		//ll_obj_id = This.GetItemNumber( row, "link_to_table" )		
	END IF
	OpenWithParm( w_conv_select_fields, ls_table_name )
	IF Message.StringParm = "Cancel" THEN
		Return
	END IF
	ls_obj_nm = Mid( Message.StringParm, Pos( Message.StringParm, "-" ) +1, 1000 )
	ll_obj_id = Long( Mid( Message.StringParm, 1, Pos( Message.StringParm, "-" ) -1 ) )
	IF ls_name = "from_field"  THEN
		dw_view_links.SetItem( row, "link_from_field_nm", ls_obj_nm )
		dw_view_links.SetItem( row, "link_from_field", ll_obj_id )	
	ELSE
		dw_view_links.SetItem( row, "link_to_field_nm", ls_obj_nm )
		dw_view_links.SetItem( row, "link_to_field", ll_obj_id )			
	END IF	
END IF
end event

event constructor;This.SetTransObject( SQLCA )
end event

event getfocus;DatawindowChild dwchild

//IF This.GetColumnName() = "link_from_table" OR This.GetColumnName() = "link_to_table" THEN
	This.GetChild( "link_from_table", dwchild )
	dwchild.SetTransObject( SQLCA )
	dwchild.Retrieve( il_view_id )

	This.GetChild( "link_to_table", dwchild )
	dwchild.SetTransObject( SQLCA )
	dwchild.Retrieve( il_view_id )	
//END IF
end event

event itemfocuschanged;//DatawindowChild dwchild
//Long li_table_id
//
//debugbreak()
//
////IF This.GetColumnName() = "link_from_field" OR This.GetColumnName() = "link_to_field" THEN
////	li_table_id = This.GetItemNumber( row, "link_from_table" )
////	This.GetChild( "link_from_field", dwchild )
////	dwchild.SetTransObject( SQLCA )
////	//dwchild.Retrieve( li_table_id )
////	IF Not IsNull( li_table_id ) THEN	
//		dwchild.SetFilter( "id = " + String( li_table_id ) )
//		dwchild.Filter( )
//	END IF
//
//	li_table_id = This.GetItemNumber( row, "link_to_table" )
//	This.GetChild( "link_to_field", dwchild )
//	dwchild.SetTransObject( SQLCA )
//	//dwchild.Retrieve( li_table_id )
//	IF Not IsNull( li_table_id ) THEN
//		dwchild.SetFilter( "id = " + String( li_table_id ) )
//		dwchild.Filter( )
//	END IF
//END IF
end event

type cb_view_add_tbl from commandbutton within tabpage_tables
integer x = 64
integer y = 704
integer width = 320
integer height = 84
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Add Table"
end type

event clicked;Integer li_nr

li_nr = dw_view_tables.InsertRow( 0 )
dw_view_tables.SetRow( li_nr )
dw_view_tables.ScrollToRow( li_nr )

il_next_table_id++

dw_view_tables.SetItem( li_nr, "table_id", il_next_table_id )
dw_view_tables.SetItem( li_nr, "view_id", il_view_id )
dw_view_tables.SetItem( li_nr, "project_id", ii_project_id )

dw_view_tables.SetFocus( )


end event

type cb_view_del_tbl from commandbutton within tabpage_tables
integer x = 398
integer y = 704
integer width = 384
integer height = 84
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Delete Table"
end type

event clicked;Long ll_table_id

ll_table_id = dw_view_tables.GetItemNumber( dw_view_tables.GetRow(), "cust_table_name" ) 

dw_view_tables.DeleteRow( 0 )

DELETE FROM conv_view_links  
WHERE ( conv_view_links.link_from_table = :ll_table_id  OR  
       conv_view_links.link_to_table = :ll_table_id ) AND  
      ( conv_view_links.view_id = :il_view_id )   ;
	 
	 
of_save()



end event

type cb_next_2 from commandbutton within tabpage_tables
integer x = 3109
integer y = 1888
integer width = 334
integer height = 84
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Next ->"
end type

event clicked;IF dw_view_tables.RowCount() = 0 THEN
	MessageBox( "Tables", "You must select at least one table to report on." )
	Return 
END IF

IF dw_view_tables.RowCount() > 1 AND dw_view_links.RowCount() = 0  THEN
	MessageBox( "Links", "You have more than 1 table selected but no links.  Please link the tables in the Create View Table Links Box." )
	Return 
END IF


IF of_save() = -1 THEN
	Return -1
END IF

//dw_view_tables.Update()
//dw_view_links.Update()

tab_1.tabpage_columns.Enabled = True


tab_1.SelectTab( 3 )



end event

type cb_view_del_link from commandbutton within tabpage_tables
integer x = 389
integer y = 1520
integer width = 384
integer height = 84
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Delete Link"
end type

event clicked;dw_view_links.DeleteRow( 0 )
end event

type cb_view_add_link from commandbutton within tabpage_tables
integer x = 55
integer y = 1520
integer width = 320
integer height = 84
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Add Link"
end type

event clicked;Integer li_nr

dw_view_tables.Update()

li_nr = dw_view_links.InsertRow( 0 )
dw_view_links.SetRow( li_nr )
dw_view_links.ScrollToRow( li_nr )

il_next_link_id++

dw_view_links.SetItem( li_nr, "link_id", il_next_link_id )
dw_view_links.SetItem( li_nr, "view_id", il_view_id )
dw_view_links.SetItem( li_nr, "project_id", ii_project_id )

dw_view_links.SetFocus( )


end event

type cb_9 from commandbutton within tabpage_tables
integer x = 891
integer y = 704
integer width = 384
integer height = 84
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Auto Link"
end type

event clicked;Integer li_rc
Integer i
Integer li_table_id
String ls_table_name
String ls_first_table_name


dw_view_tables.AcceptText()
dw_view_tables.Update()
dw_view_tables.Retrieve( il_view_id )

li_rc = dw_view_tables.RowCount()
IF li_rc = 1 THEN
	MessageBox( "Link Failure", "You need to select at least 2 tables to use the Auto Link Function." )
	Return
END IF

ls_first_table_name = dw_view_tables.GetItemString( 1, "table_name" )

FOR i = 2 TO li_rc
	ls_table_name = dw_view_tables.GetItemString( i, "table_name" )
	cb_view_add_link.TriggerEvent( Clicked! )
	dw_view_links.SetItem( i - 1, "link_type", "=" )				
	dw_view_links.SetItem( i - 1, "link_from_table_nm", ls_first_table_name )				
	dw_view_links.SetItem( i - 1, "link_from_field_nm", "prac_id" )			
	dw_view_links.SetItem( i - 1, "link_to_table_nm", ls_table_name )				
	dw_view_links.SetItem( i - 1, "link_to_field_nm", "prac_id" )				
END FOR

//dw_view_links.Update()
//dw_view_links.Retrieve( il_view_id )
end event

type cbx_distinct from checkbox within tabpage_tables
integer x = 965
integer y = 68
integer width = 297
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Distinct"
end type

event clicked;
IF This.Checked THEN
	UPDATE conv_view
	SET distinct_sql = 1
	WHERE conv_view.view_id = :il_view_id ;
ELSE
	UPDATE conv_view
	SET distinct_sql = 0
	WHERE conv_view.view_id = :il_view_id ;	
END IF
IF SQLCA.SQLCODE = -1 THEN
	MessageBox("DB Error", SQLCA.SQLERRTEXT )
END IF
end event

type tabpage_columns from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 3483
integer height = 2048
boolean enabled = false
long backcolor = 79741120
string text = "Columns"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "SingleLineEdit5!"
long picturemaskcolor = 12632256
dw_fields_list dw_fields_list
dw_view_fields dw_view_fields
dw_all_fields dw_all_fields
cb_next_3 cb_next_3
cb_10 cb_10
cb_11 cb_11
cb_33 cb_33
cb_34 cb_34
end type

on tabpage_columns.create
this.dw_fields_list=create dw_fields_list
this.dw_view_fields=create dw_view_fields
this.dw_all_fields=create dw_all_fields
this.cb_next_3=create cb_next_3
this.cb_10=create cb_10
this.cb_11=create cb_11
this.cb_33=create cb_33
this.cb_34=create cb_34
this.Control[]={this.dw_fields_list,&
this.dw_view_fields,&
this.dw_all_fields,&
this.cb_next_3,&
this.cb_10,&
this.cb_11,&
this.cb_33,&
this.cb_34}
end on

on tabpage_columns.destroy
destroy(this.dw_fields_list)
destroy(this.dw_view_fields)
destroy(this.dw_all_fields)
destroy(this.cb_next_3)
destroy(this.cb_10)
destroy(this.cb_11)
destroy(this.cb_33)
destroy(this.cb_34)
end on

type dw_fields_list from datawindow within tabpage_columns
integer x = 59
integer y = 56
integer width = 1211
integer height = 1776
integer taborder = 50
boolean titlebar = true
string title = "4. Select Fields To Use In View"
string dataobject = "d_conv_view_fields"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;IF row > 0 THEN
	This.SelectRow( 0, False )
	This.SelectRow( row, True )
	This.SetRow( row )
END IF
end event

event constructor;This.SetTransObject( SQLCA )
//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 2005-11-11 By: owen chen
//$<reason> add database option for sql excution

string ls_sqlsyntax

choose case gs_dbtype
	case 'ASA'
		ls_sqlsyntax =   "  SELECT systable.table_name, "+&  
									"systable.table_id, "+&
									"sys.syscolumns.cname, "+&  
									"sys.syscolumns.colno, "+&  
									"sys.syscolumns.coltype, "+&  
									"sys.syscolumns.length "+& 
								 "FROM sys.syscolumns, "+&  
										"systable "+& 
									"WHERE ( sys.syscolumns.tname = systable.table_name ) and "+&  
										  " ( ( sys.syscolumns.tname in ( :table_name ) ) ) "  
	case 'SQL'
		ls_sqlsyntax =  "  SELECT v_systable.table_name, "+&  
										"v_systable.table_id, "+&
										"v_syscolumns.cname, "+&  
										"v_syscolumns.colno, "+&  
										"v_syscolumns.coltype, "+&  
										"v_syscolumns.length "+& 
								 "FROM v_syscolumns, "+&  
										"v_systable "+& 
								"WHERE ( v_syscolumns.tname = v_systable.table_name ) and "+&  
									  " ( ( v_syscolumns.tname in ( :table_name ) ) ) " 
end choose
this.modify("DataWindow.Table.Select='"+ls_sqlsyntax+"'")

//---------------------------- APPEON END ----------------------------

end event

event doubleclicked;Integer li_nr
Long ll_field_id
Long ll_max_x
Long ll_width

if row > 0 then //maha 042202
li_nr = dw_view_fields.InsertRow( 0 )

il_next_field_id++
dw_view_fields.SetItem( li_nr, "field_id", il_next_field_id )
dw_view_fields.SetItem( li_nr, "project_id", ii_project_id )
dw_view_fields.SetItem( li_nr, "view_id", il_view_id )

//Added By Mark Lee 03/26/2015	The APB 6.8 don't support the SetItem Number value's length more than 10. 
//dw_view_fields.SetItem( li_nr, "sel_field_id", This.GetItemNumber( row, "field_id" ) )
//dw_view_fields.SetItem( li_nr, "sel_table_id", This.GetItemNumber( row, "table_id" ) )
dw_view_fields.object.sel_field_id[li_nr] = 	this.object.field_id[row]
dw_view_fields.object.sel_table_id[li_nr] = 	this.object.table_id[row]

dw_view_fields.SetItem( li_nr, "field_name", This.GetItemString( row, "field_name" ) )
dw_view_fields.SetItem( li_nr, "field_alias", Mid( This.GetItemString( row, "field_name" ),1, 38) )
dw_view_fields.SetItem( li_nr, "label_text", Mid( This.GetItemString( row, "field_name" ),1, 38) )
dw_view_fields.SetItem( li_nr, "table_name", This.GetItemString( row, "table_name" ) )

//IF This.GetItemNumber( row, "syscolumns_length" ) > 20 THEN
//	ll_width = 20
//ELSE
//	ll_width = This.GetItemNumber( row, "syscolumns_length" )
//END IF
//messagebox("", ll_width )

dw_view_fields.SetItem( li_nr, "field_display_width", This.GetItemNumber( row, "syscolumns_length" ))

dw_view_fields.SetItem( li_nr, "field_order",li_nr * 10 )
dw_view_fields.SetItem( li_nr, "field_x", 0 )

dw_view_fields.SetItem( li_nr, "field_align", 0 )
dw_view_fields.SetItem( li_nr, "label_align", 2 )

This.DeleteRow( row )

//SELECT  Max( field_x )  
//INTO  :ll_max_x  
//FROM conv_view_fields  
//WHERE conv_view_fields.view_id = :il_view_id   ;
//

dw_view_fields.AcceptText()

dw_view_fields.Update( )

end if



end event

type dw_view_fields from datawindow within tabpage_columns
integer x = 1307
integer y = 52
integer width = 2135
integer height = 1776
integer taborder = 60
boolean titlebar = true
string title = "Selected Fields"
string dataobject = "d_view_selected_fields"
boolean minbox = true
boolean maxbox = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;IF row > 0 THEN
	This.SelectRow( 0, False )
	This.SelectRow( row, True )
	This.SetRow( row )
END IF
end event

event constructor;This.SetTransObject( SQLCA )

end event

event doubleclicked;if row > 0 then
	This.DeleteRow( row )

	of_save()
end if
end event

event itemchanged;IF This.GetColumnName() = "field_wizard_name" THEN
	DataWindowChild dwchild
	Integer li_found
	This.GetChild( "field_wizard_name", dwchild )
	li_found = dwchild.Find( "lookup_name = '" + data + "'", 1, dwchild.GetRow() )
	IF li_found > 0 THEN
		This.SetItem( row, "field_wizard_type", dwchild.GetItemString( li_found, "type" ) )
	END IF
ELSEIF This.GetColumnName() = "field_visible" THEN
	IF data = "0" THEN
		This.SetItem( row, "field_x", -1 )
	ELSE
		This.SetItem( row, "field_x", 0 )		
	END IF
END IF
end event

event retrieveend;DataWindowChild dwchild
Integer i

This.GetChild( "field_wizard_name", dwchild )
dwchild.InsertRow( 1 )
dwchild.SetItem( 1, "lookup_name", "Single Date Comparison" )
dwchild.SetItem( 1, "type", "D" )

dwchild.InsertRow( 1 )
dwchild.SetItem( 1, "lookup_name", "Date Range Comparison" )
dwchild.SetItem( 1, "type", "R" )


dwchild.InsertRow( 1 )
dwchild.SetItem( 1, "lookup_name", "Facility" )
dwchild.SetItem( 1, "type", "F" )

FOR i = 1 TO rowcount
	IF Long( This.GetItemNumber( i, "field_x" ) ) > 0 THEN
		This.SetItem( i, "field_visible", 1 )
	ELSE
		This.SetItem( i, "field_visible", 0 )
	END IF
END FOR


//Integer i
//Integer li_found
//String ls_tbl_nm
//String ls_fld_nm
//
//FOR i = 1 TO rowcount
//	ls_tbl_nm = This.GetItemString( i, "table_name" )
//	ls_fld_nm = This.GetItemString( i, "field_name" )
//	li_found = dw_fields_list.Find( "table_name = '" + ls_tbl_nm + "' AND field_name ='" + ls_fld_nm + "'" , 1, 1000 )
//	IF li_found > 0 THEN
//		dw_fields_list.DeleteRow( li_found )
//	END IF
//END FOR
end event

type dw_all_fields from datawindow within tabpage_columns
boolean visible = false
integer x = 325
integer y = 912
integer width = 603
integer height = 352
integer taborder = 50
boolean titlebar = true
string title = "4. Select Fields To Use In View"
string dataobject = "d_conv_view_fields"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;This.SetTransObject( sqlca )
//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 2005-11-11 By: owen chen
//$<reason> add database option for sql excution

string ls_sqlsyntax

choose case gs_dbtype
	case 'ASA'
		ls_sqlsyntax =   "  SELECT systable.table_name, "+&  
									"systable.table_id, "+&
									"sys.syscolumns.cname, "+&  
									"sys.syscolumns.colno, "+&  
									"sys.syscolumns.coltype, "+&  
									"sys.syscolumns.length "+& 
								 "FROM sys.syscolumns, "+&  
										"systable "+& 
									"WHERE ( sys.syscolumns.tname = systable.table_name ) and "+&  
										  " ( ( sys.syscolumns.tname in ( :table_name ) ) ) "  
	case 'SQL'
		ls_sqlsyntax =  "  SELECT v_systable.table_name, "+&  
										"v_systable.table_id, "+&
										"v_syscolumns.cname, "+&  
										"v_syscolumns.colno, "+&  
										"v_syscolumns.coltype, "+&  
										"v_syscolumns.length "+& 
								 "FROM v_syscolumns, "+&  
										"v_systable "+& 
								"WHERE ( v_syscolumns.tname = v_systable.table_name ) and "+&  
									  " ( ( v_syscolumns.tname in ( :table_name ) ) ) " 
end choose
this.modify("DataWindow.Table.Select='"+ls_sqlsyntax+"'")

//---------------------------- APPEON END ----------------------------

end event

type cb_next_3 from commandbutton within tabpage_columns
integer x = 3104
integer y = 1864
integer width = 334
integer height = 84
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Next ->"
end type

event clicked;Integer li_rc
Integer i

IF dw_view_fields.RowCount() = 0 THEN
	MessageBox( "Fields", "You must select at least one field to report on." )
	Return 
END IF

li_rc = dw_view_fields.RowCount()

dw_view_fields.AcceptText()


FOR i = 1 TO li_rc
	IF Not IsNull( dw_view_fields.GetItemString( i, "field_wizard_name" ) ) THEN
		IF IsNull( dw_view_fields.GetItemString( i, "field_options" ) ) OR dw_view_fields.GetItemString( i, "field_options" )  = '' THEN
			//MessageBox("", "You need to fill in the Compare To column." )
 			MessageBox("Missing Data", "You need to fill in the Compare To column." )
			dw_view_fields.SetRow( i )
			dw_view_fields.ScrollToRow( i )
			dw_view_fields.SetColumn( "field_options" )
			Return
		END IF
		
		IF IsNull( dw_view_fields.GetItemString( i, "field_alias" ) ) OR dw_view_fields.GetItemString( i, "field_alias" )  = '' THEN
			//MessageBox("", "You need to fill in the Field Alias column." )
 			MessageBox("Missing Data", "You need to fill in the Field Alias column." )
			dw_view_fields.SetRow( i )
			dw_view_fields.ScrollToRow( i )
			dw_view_fields.SetColumn( "field_alias" )
			Return
		END IF		
	END IF
END FOR

of_save( )

tab_1.tabpage_filter.Enabled = True

tab_1.SelectTab( 4 )
end event

type cb_10 from commandbutton within tabpage_columns
integer x = 1312
integer y = 1864
integer width = 192
integer height = 84
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Up"
end type

event clicked;Integer li_order
Integer i
Integer li_cr
Integer li_rc

li_cr = dw_view_fields.GetRow( )

IF li_cr = 1 THEN
	Return
END IF

li_cr --

li_order = dw_view_fields.GetItemNumber( dw_view_fields.GetRow(), "field_order" )

dw_view_fields.SetItem( dw_view_fields.GetRow(), "field_order", li_order -11 )

dw_view_fields.SetSort( "field_order a" )
dw_view_fields.Sort()

li_rc = dw_view_fields.RowCount()

FOR i = 1 TO li_rc
	dw_view_fields.SetItem( i, "field_order", i * 10 )
END FOR

dw_view_fields.SetSort( "field_order a" )
dw_view_fields.Sort()

dw_view_fields.SetFocus()

dw_view_fields.SelectRow( 0, False )
dw_view_fields.SelectRow( li_cr, True )
dw_view_fields.SetRow( li_cr )
end event

type cb_11 from commandbutton within tabpage_columns
integer x = 1518
integer y = 1864
integer width = 178
integer height = 84
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Down"
end type

event clicked;Integer li_order
Integer i
Integer li_rc
Integer li_cr

li_cr = dw_view_fields.GetRow( )

IF li_cr = dw_view_fields.RowCount( ) THEN
	Return
END IF

li_cr ++

li_order = dw_view_fields.GetItemNumber( dw_view_fields.GetRow(), "field_order" )

dw_view_fields.SetItem( dw_view_fields.GetRow(), "field_order", li_order +11 )

dw_view_fields.SetSort( "field_order a" )
dw_view_fields.Sort()

li_rc = dw_view_fields.RowCount()

FOR i = 1 TO li_rc
	dw_view_fields.SetItem( i, "field_order", i * 10 )
END FOR

dw_view_fields.SetSort( "field_order a" )
dw_view_fields.Sort()

dw_view_fields.SetFocus()

dw_view_fields.SelectRow( 0, False )
dw_view_fields.SelectRow( li_cr, True )
dw_view_fields.SetRow( li_cr )
end event

type cb_33 from commandbutton within tabpage_columns
integer x = 1710
integer y = 1864
integer width = 361
integer height = 84
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Add Computed"
end type

event clicked;Integer li_nr
String ls_formula
String ls_field

OpenWithParm( w_calc_field_report, "New" )

IF Message.StringParm = "Cancel" THEN
	Return
END IF

ls_field = Mid( Message.StringParm, 1, Pos( Message.StringParm, "-" )-1 )
ls_formula = Mid( Message.StringParm, Pos( Message.StringParm, "-" )+1, 1000 )

li_nr = dw_view_fields.InsertRow( 0 )

il_next_field_id++
dw_view_fields.SetItem( li_nr, "field_id", il_next_field_id )
dw_view_fields.SetItem( li_nr, "project_id", ii_project_id )
dw_view_fields.SetItem( li_nr, "view_id", il_view_id )
dw_view_fields.SetItem( li_nr, "field_alias", ls_field )

dw_view_fields.SetItem( li_nr, "sel_field_id", 0 )
dw_view_fields.SetItem( li_nr, "sel_table_id", 0 )

dw_view_fields.SetItem( li_nr, "field_name", ls_formula )
dw_view_fields.SetItem( li_nr, "table_name", ls_field )

dw_view_fields.SetItem( li_nr, "field_order",li_nr * 10 )

//This.DeleteRow( row )

dw_view_fields.Update( )



end event

type cb_34 from commandbutton within tabpage_columns
integer x = 2085
integer y = 1864
integer width = 411
integer height = 84
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Edit Computed"
end type

event clicked;Integer li_nr
String ls_formula
String ls_field

li_nr = dw_view_fields.GetRow()

ls_formula = dw_view_fields.GetItemString( li_nr , "field_name" )
ls_field = dw_view_fields.GetItemString( li_nr, "table_name" )

OpenWithParm( w_calc_field, ls_field + "-" + ls_formula )

IF Message.StringParm = "Cancel" THEN
	Return
END IF

ls_field = Mid( Message.StringParm, 1, Pos( Message.StringParm, "-" )-1 )
ls_formula = Mid( Message.StringParm, Pos( Message.StringParm, "-" )+1, 1000 )

//li_nr = dw_view_fields.InsertRow( 0 )

//il_next_field_id++
dw_view_fields.SetItem( li_nr, "field_id", il_next_field_id )
dw_view_fields.SetItem( li_nr, "project_id", ii_project_id )
dw_view_fields.SetItem( li_nr, "view_id", il_view_id )

dw_view_fields.SetItem( li_nr, "sel_field_id", 0 )
dw_view_fields.SetItem( li_nr, "sel_table_id", 0 )

dw_view_fields.SetItem( li_nr, "field_name", ls_formula )
dw_view_fields.SetItem( li_nr, "table_name", ls_field )

dw_view_fields.SetItem( li_nr, "field_order",li_nr * 10 )

//This.DeleteRow( row )

dw_view_fields.Update( )



end event

type tabpage_filter from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3483
integer height = 2048
boolean enabled = false
long backcolor = 79741120
string text = "Filter"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "Query!"
long picturemaskcolor = 12632256
dw_view_where dw_view_where
cb_12 cb_12
cb_16 cb_16
cb_3 cb_3
cb_next_4 cb_next_4
end type

on tabpage_filter.create
this.dw_view_where=create dw_view_where
this.cb_12=create cb_12
this.cb_16=create cb_16
this.cb_3=create cb_3
this.cb_next_4=create cb_next_4
this.Control[]={this.dw_view_where,&
this.cb_12,&
this.cb_16,&
this.cb_3,&
this.cb_next_4}
end on

on tabpage_filter.destroy
destroy(this.dw_view_where)
destroy(this.cb_12)
destroy(this.cb_16)
destroy(this.cb_3)
destroy(this.cb_next_4)
end on

type dw_view_where from datawindow within tabpage_filter
integer x = 59
integer y = 80
integer width = 2034
integer height = 1776
integer taborder = 50
boolean titlebar = true
string title = "5. Filter"
string dataobject = "d_view_where"
boolean minbox = true
boolean maxbox = true
boolean hscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;This.SetTransObject( SQLCA )
end event

type cb_12 from commandbutton within tabpage_filter
integer x = 64
integer y = 1884
integer width = 384
integer height = 84
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Add Filter"
end type

event clicked;Integer li_nr
DataWindowChild dwchild

dw_view_where.GetChild( "table_field_name", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve( il_view_id )

li_nr = dw_view_where.InsertRow( 0 )
dw_view_where.SetRow( li_nr )
dw_view_where.ScrollToRow( li_nr )

il_next_where_id++

dw_view_where.SetItem( li_nr, "where_id", il_next_where_id )
dw_view_where.SetItem( li_nr, "view_id", il_view_id )
dw_view_where.SetItem( li_nr, "project_id", ii_project_id )

dw_view_where.SetFocus( )


end event

type cb_16 from commandbutton within tabpage_filter
integer x = 466
integer y = 1884
integer width = 384
integer height = 84
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Delete Filter"
end type

event clicked;Long ll_table_id

dw_view_where.DeleteRow( 0 )
	 
of_save()



end event

type cb_3 from commandbutton within tabpage_filter
integer x = 873
integer y = 1884
integer width = 384
integer height = 84
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Preview SQL"
end type

event clicked;MessageBox(" SQL  ", of_build_view_sql() )
end event

type cb_next_4 from commandbutton within tabpage_filter
integer x = 3109
integer y = 1892
integer width = 334
integer height = 84
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Next ->"
end type

event clicked;IF dw_view_where.AcceptText() = -1 THEN
	Return -1
END IF

IF of_save( ) = -1 THEN
	Return
END IF

//of_preview( tab_1.tabpage_preview.dw_preview )

tab_1.tabpage_sort.Enabled = True

tab_1.SelectTab( 5 )
end event

type tabpage_sort from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3483
integer height = 2048
boolean enabled = false
long backcolor = 79741120
string text = "Sort"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "Sort!"
long picturemaskcolor = 12632256
cb_next_5 cb_next_5
dw_fields_list_sort dw_fields_list_sort
dw_view_sort dw_view_sort
end type

on tabpage_sort.create
this.cb_next_5=create cb_next_5
this.dw_fields_list_sort=create dw_fields_list_sort
this.dw_view_sort=create dw_view_sort
this.Control[]={this.cb_next_5,&
this.dw_fields_list_sort,&
this.dw_view_sort}
end on

on tabpage_sort.destroy
destroy(this.cb_next_5)
destroy(this.dw_fields_list_sort)
destroy(this.dw_view_sort)
end on

type cb_next_5 from commandbutton within tabpage_sort
integer x = 3109
integer y = 1892
integer width = 334
integer height = 84
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Next ->"
end type

event clicked;of_save( )

//of_preview( tab_1.tabpage_preview.dw_preview )
//ib_new = False

tab_1.tabpage_preview.Enabled = True
tab_1.tabpage_run.Enabled = True

tab_1.SelectTab( 6 )
end event

type dw_fields_list_sort from datawindow within tabpage_sort
integer x = 59
integer y = 56
integer width = 1211
integer height = 1776
integer taborder = 20
boolean titlebar = true
string title = "6. Select Fields To Sort By"
string dataobject = "d_view_selected_sort_fields"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;IF row > 0 THEN
	This.SelectRow( 0, False )
	This.SelectRow( row, True )
	This.SetRow( row )
END IF
end event

event constructor;This.SetTransObject( SQLCA )
end event

event doubleclicked;Integer li_nr
Long ll_field_id
Long ll_max_x

if row > 0 then
li_nr = dw_view_sort.InsertRow( 0 )

dw_view_sort.SetItem( li_nr, "project_id", ii_project_id )
dw_view_sort.SetItem( li_nr, "view_id", il_view_id )

il_next_sort_id ++
dw_view_sort.SetItem( li_nr, "sort_id", il_next_sort_id )

dw_view_sort.SetItem( li_nr, "field_name", This.GetItemString( row, "field_name" ) )

dw_view_sort.SetItem( li_nr, "table_name", This.GetItemString( row, "table_name" ) )

dw_view_sort.SetItem( li_nr, "sort_dir", "D" )

This.DeleteRow( row )

dw_view_sort.AcceptText()

dw_view_sort.Update( )

end if



end event

type dw_view_sort from u_dw within tabpage_sort
integer x = 1358
integer y = 56
integer width = 1687
integer height = 1776
integer taborder = 11
boolean bringtotop = true
boolean titlebar = true
string title = "Sort Fields"
string dataobject = "d_cust_report_sort"
end type

event constructor;call super::constructor;This.SetTransObject( SQLCA )
end event

event doubleclicked;call super::doubleclicked;if row > 0 then

	This.DeleteRow( row )

	of_save()

end if
end event

event clicked;call super::clicked;IF row > 0 THEN
	This.SelectRow( 0, False )
	This.SelectRow( row, True )
	This.SetRow( row )
END IF
end event

type tabpage_preview from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3483
integer height = 2048
boolean enabled = false
long backcolor = 79741120
string text = "Design"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "Custom032!"
long picturemaskcolor = 12632256
dw_preview dw_preview
cb_7 cb_7
st_obj_name st_obj_name
cb_14 cb_14
gb_1 gb_1
gb_2 gb_2
rb_p rb_p
rb_l rb_l
em_font em_font
st_2 st_2
st_left st_left
st_5 st_5
st_center st_center
st_right st_right
st_f_right st_f_right
st_f_center st_f_center
st_f_left st_f_left
st_6 st_6
dw_label dw_label
st_4 st_4
hsb_2 hsb_2
st_3 st_3
st_1 st_1
hsb_1 hsb_1
cbx_move_all cbx_move_all
cb_2 cb_2
end type

on tabpage_preview.create
this.dw_preview=create dw_preview
this.cb_7=create cb_7
this.st_obj_name=create st_obj_name
this.cb_14=create cb_14
this.gb_1=create gb_1
this.gb_2=create gb_2
this.rb_p=create rb_p
this.rb_l=create rb_l
this.em_font=create em_font
this.st_2=create st_2
this.st_left=create st_left
this.st_5=create st_5
this.st_center=create st_center
this.st_right=create st_right
this.st_f_right=create st_f_right
this.st_f_center=create st_f_center
this.st_f_left=create st_f_left
this.st_6=create st_6
this.dw_label=create dw_label
this.st_4=create st_4
this.hsb_2=create hsb_2
this.st_3=create st_3
this.st_1=create st_1
this.hsb_1=create hsb_1
this.cbx_move_all=create cbx_move_all
this.cb_2=create cb_2
this.Control[]={this.dw_preview,&
this.cb_7,&
this.st_obj_name,&
this.cb_14,&
this.gb_1,&
this.gb_2,&
this.rb_p,&
this.rb_l,&
this.em_font,&
this.st_2,&
this.st_left,&
this.st_5,&
this.st_center,&
this.st_right,&
this.st_f_right,&
this.st_f_center,&
this.st_f_left,&
this.st_6,&
this.dw_label,&
this.st_4,&
this.hsb_2,&
this.st_3,&
this.st_1,&
this.hsb_1,&
this.cbx_move_all,&
this.cb_2}
end on

on tabpage_preview.destroy
destroy(this.dw_preview)
destroy(this.cb_7)
destroy(this.st_obj_name)
destroy(this.cb_14)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.rb_p)
destroy(this.rb_l)
destroy(this.em_font)
destroy(this.st_2)
destroy(this.st_left)
destroy(this.st_5)
destroy(this.st_center)
destroy(this.st_right)
destroy(this.st_f_right)
destroy(this.st_f_center)
destroy(this.st_f_left)
destroy(this.st_6)
destroy(this.dw_label)
destroy(this.st_4)
destroy(this.hsb_2)
destroy(this.st_3)
destroy(this.st_1)
destroy(this.hsb_1)
destroy(this.cbx_move_all)
destroy(this.cb_2)
end on

type dw_preview from u_dw within tabpage_preview
integer x = 46
integer y = 436
integer width = 3346
integer height = 1484
integer taborder = 11
boolean bringtotop = true
boolean hscrollbar = true
end type

event clicked;call super::clicked;String ls_type
Integer li_align
Integer i

dw_label.SetItem( 1, "label", "" )

ls_type = dwo.type

IF ls_type = "column" OR ls_type = "text" THEN
	is_obj_name =  dwo.name
	//messagebox("", is_obj_name )
	ii_tag = Integer( dwo.tag )
	st_obj_name.Text = is_obj_name
	FOR i = 1 TO ii_col_count
		tab_1.tabpage_preview.dw_preview.Modify( ls_label_name[ i ] + ".color='0'")		
	END FOR	
	IF ii_tag > 0 THEN
		tab_1.tabpage_preview.dw_preview.Modify( ls_label_name[ ii_tag ] + ".color='16711808'")				
	END IF
ELSE
	st_obj_name.Text = "None"
END IF

IF ls_type = "text"  And Pos( is_obj_name, "title" ) = 0 THEN
	dw_label.SetItem( 1, "label", dwo.Text )
END IF

IF ii_tag > 0 THEN
	//allign label
	li_align = tab_1.tabpage_columns.dw_view_fields.GetItemNumber( ii_tag, "label_align" )
	IF li_align = 0 THEN
		tab_1.tabpage_preview.st_left.BorderStyle = StyleLowered!
		tab_1.tabpage_preview.st_center.BorderStyle = StyleRaised!
		tab_1.tabpage_preview.st_right.BorderStyle = StyleRaised!		
	ELSEIF li_align = 2 THEN
		tab_1.tabpage_preview.st_left.BorderStyle = StyleRaised!
		tab_1.tabpage_preview.st_center.BorderStyle = StyleLowered!
		tab_1.tabpage_preview.st_right.BorderStyle = StyleRaised!				
	ELSEIF li_align = 1 THEN
		tab_1.tabpage_preview.st_left.BorderStyle = StyleRaised!
		tab_1.tabpage_preview.st_center.BorderStyle = StyleRaised!						
		tab_1.tabpage_preview.st_right.BorderStyle = StyleLowered!
	END IF

	//allign field
	li_align = tab_1.tabpage_columns.dw_view_fields.GetItemNumber( ii_tag, "field_align" )
	IF li_align = 0 THEN
		tab_1.tabpage_preview.st_f_left.BorderStyle = StyleLowered!
		tab_1.tabpage_preview.st_f_center.BorderStyle = StyleRaised!
		tab_1.tabpage_preview.st_f_right.BorderStyle = StyleRaised!		
	ELSEIF li_align = 2 THEN
		tab_1.tabpage_preview.st_f_left.BorderStyle = StyleRaised!
		tab_1.tabpage_preview.st_f_center.BorderStyle = StyleLowered!
		tab_1.tabpage_preview.st_f_right.BorderStyle = StyleRaised!				
	ELSEIF li_align = 1 THEN
		tab_1.tabpage_preview.st_f_left.BorderStyle = StyleRaised!
		tab_1.tabpage_preview.st_f_center.BorderStyle = StyleRaised!						
		tab_1.tabpage_preview.st_f_right.BorderStyle = StyleLowered!
	END IF	
END IF

end event

type cb_7 from commandbutton within tabpage_preview
integer x = 384
integer y = 1944
integer width = 370
integer height = 84
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Quick Preview"
end type

event clicked;ii_with_data = 1
of_preview( dw_preview )
ii_with_data = 0
end event

type st_obj_name from statictext within tabpage_preview
integer x = 1870
integer y = 1944
integer width = 1531
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
boolean enabled = false
string text = "None"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_14 from commandbutton within tabpage_preview
integer x = 59
integer y = 1944
integer width = 297
integer height = 84
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Save"
end type

event clicked;of_save()

ib_new = False
end event

type gb_1 from groupbox within tabpage_preview
integer x = 59
integer y = 4
integer width = 2016
integer height = 376
integer taborder = 100
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "Column Properties"
end type

type gb_2 from groupbox within tabpage_preview
integer x = 2103
integer y = 4
integer width = 1298
integer height = 376
integer taborder = 70
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "Report Properties"
end type

type rb_p from radiobutton within tabpage_preview
integer x = 2167
integer y = 88
integer width = 352
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
string text = "Portrait"
boolean checked = true
end type

event clicked;tab_1.tabpage_browse.dw_report_list.SetItem( tab_1.tabpage_browse.dw_report_list.GetRow(), "orientation", "P" )
dw_preview.Modify("DataWindow.Print.Orientation= '2'")

end event

type rb_l from radiobutton within tabpage_preview
integer x = 2167
integer y = 164
integer width = 352
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
string text = "Landscape "
end type

event clicked;tab_1.tabpage_browse.dw_report_list.SetItem( tab_1.tabpage_browse.dw_report_list.GetRow(), "orientation", "L" )
dw_preview.Modify("DataWindow.Print.Orientation= '1'")
end event

type em_font from editmask within tabpage_preview
integer x = 2615
integer y = 132
integer width = 247
integer height = 92
integer taborder = 90
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
string text = "Font Size"
borderstyle borderstyle = stylelowered!
string mask = "#####"
boolean spin = true
string minmax = "6~~14"
end type

event modified;Integer i


FOR i = 1 TO ii_col_count
	dw_preview.Modify( ls_column_name[ i ] + ".Font.Face='MS Sans Serif'")		
	dw_preview.Modify( ls_column_name[ i ] + ".Font.Height='-" + This.Text + "'")	
	dw_preview.Modify( ls_label_name[ i ] + ".Font.Height='-" + This.Text + "'")		
END FOR

tab_1.tabpage_browse.dw_report_list.SetItem( tab_1.tabpage_browse.dw_report_list.GetRow(), "font_size" , Integer(This.Text )) 

end event

event other;//Integer i
//
//
//FOR i = 1 TO ii_col_count
//	dw_preview.Modify( ls_column_name[ i ] + ".Font.Face='MS Sans Serif'")		
//	dw_preview.Modify( ls_column_name[ i ] + ".Font.Height='-" + This.Text + "'")	
//	dw_preview.Modify( ls_label_name[ i ] + ".Font.Height='-" + This.Text + "'")		
//END FOR
//
////messagebox("",  ls_label_name[ 1 ] + ".Font.Height='-" + This.Text + "'" )
//
end event

type st_2 from statictext within tabpage_preview
integer x = 2592
integer y = 72
integer width = 247
integer height = 60
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
string text = "Font Size"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_left from statictext within tabpage_preview
integer x = 1609
integer y = 116
integer width = 119
integer height = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 79741120
string text = "L"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

event clicked;Integer i

This.BorderStyle = StyleLowered!
st_center.BorderStyle = StyleRaised!
st_right.BorderStyle = StyleRaised!

//w_prac_data_design.tab_1.tabpage_design.uo_design.idw_detail.Modify( w_prac_data_design.tab_1.tabpage_design.uo_design.is_last_object[i] + ".alignment = '0'")
tab_1.tabpage_preview.dw_preview.Modify( ls_label_name[ ii_tag ] + ".alignment = '0'")		
tab_1.tabpage_columns.dw_view_fields.SetItem( ii_tag, "label_align", 0  )	
	


end event

type st_5 from statictext within tabpage_preview
integer x = 1609
integer y = 56
integer width = 352
integer height = 56
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
string text = "Label Alignment"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_center from statictext within tabpage_preview
integer x = 1737
integer y = 116
integer width = 119
integer height = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "C"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

event clicked;Integer i

This.BorderStyle = StyleLowered!
st_left.BorderStyle = StyleRaised!
st_right.BorderStyle = StyleRaised!

tab_1.tabpage_preview.dw_preview.Modify( ls_label_name[ ii_tag ] + ".alignment = '2'")		
tab_1.tabpage_columns.dw_view_fields.SetItem( ii_tag, "label_align", 2  )	


end event

type st_right from statictext within tabpage_preview
integer x = 1865
integer y = 116
integer width = 119
integer height = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "R"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

event clicked;Integer i

This.BorderStyle = StyleLowered!
st_center.BorderStyle = StyleRaised!
st_left.BorderStyle = StyleRaised!

tab_1.tabpage_preview.dw_preview.Modify( ls_label_name[ ii_tag ] + ".alignment = '1'")		
tab_1.tabpage_columns.dw_view_fields.SetItem( ii_tag, "label_align", 1  )	

end event

type st_f_right from statictext within tabpage_preview
integer x = 1865
integer y = 272
integer width = 119
integer height = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "R"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

event clicked;Integer i

This.BorderStyle = StyleLowered!
st_f_center.BorderStyle = StyleRaised!
st_f_left.BorderStyle = StyleRaised!

tab_1.tabpage_preview.dw_preview.Modify( ls_column_name[ ii_tag ] + ".alignment = '1'")		
tab_1.tabpage_columns.dw_view_fields.SetItem( ii_tag, "field_align", 1  )	

end event

type st_f_center from statictext within tabpage_preview
integer x = 1737
integer y = 272
integer width = 119
integer height = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "C"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

event clicked;Integer i

This.BorderStyle = StyleLowered!
st_f_left.BorderStyle = StyleRaised!
st_f_right.BorderStyle = StyleRaised!

tab_1.tabpage_preview.dw_preview.Modify( ls_column_name[ ii_tag ] + ".alignment = '2'")		
tab_1.tabpage_columns.dw_view_fields.SetItem( ii_tag, "field_align", 2  )	


end event

type st_f_left from statictext within tabpage_preview
integer x = 1609
integer y = 272
integer width = 119
integer height = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 79741120
string text = "L"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

event clicked;Integer i

This.BorderStyle = StyleLowered!
st_f_center.BorderStyle = StyleRaised!
st_f_right.BorderStyle = StyleRaised!

//w_prac_data_design.tab_1.tabpage_design.uo_design.idw_detail.Modify( w_prac_data_design.tab_1.tabpage_design.uo_design.is_last_object[i] + ".alignment = '0'")
tab_1.tabpage_preview.dw_preview.Modify( ls_column_name[ ii_tag ] + ".alignment = '0'")		
tab_1.tabpage_columns.dw_view_fields.SetItem( ii_tag, "field_align", 0  )	
	


end event

type st_6 from statictext within tabpage_preview
integer x = 1605
integer y = 212
integer width = 334
integer height = 56
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
string text = "Field Alignment"
alignment alignment = center!
boolean focusrectangle = false
end type

type dw_label from datawindow within tabpage_preview
integer x = 690
integer y = 120
integer width = 809
integer height = 108
integer taborder = 10
boolean bringtotop = true
string dataobject = "d_design_label_editor"
boolean border = false
boolean livescroll = true
end type

event editchanged;tab_1.tabpage_preview.dw_preview.Modify( ls_label_name[ ii_tag ] + ".text='" + data + "'" )
//tab_1.tabpage_columns.dw_view_fields.SetItem( ii_tag, "field_alias", data )

tab_1.tabpage_columns.dw_view_fields.SetItem( ii_tag, "label_text", data )
end event

event constructor;This.InsertRow( 0 )
end event

type st_4 from statictext within tabpage_preview
integer x = 699
integer y = 72
integer width = 283
integer height = 56
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
string text = "Modify Label"
alignment alignment = center!
boolean focusrectangle = false
end type

type hsb_2 from hscrollbar within tabpage_preview
integer x = 96
integer y = 288
integer width = 311
integer height = 52
boolean bringtotop = true
integer minposition = 3
integer maxposition = 1
integer position = 2
end type

event lineleft;IF st_obj_name.Text = "None" THEN
	Return
END IF

Long ll_x
Long ll_x_pos
Long ll_start_x
Integer i

ll_start_x = Long(tab_1.tabpage_preview.dw_preview.Describe( ls_label_name[ ii_tag ] + ".x" ))
IF cbx_move_all.Checked THEN
	FOR i = ii_tag TO ii_col_count
		ll_x_pos = tab_1.tabpage_columns.dw_view_fields.GetItemNumber( i, "field_x"  )			
		IF ll_x_pos >= ll_start_x THEN
			ll_x = Long(tab_1.tabpage_preview.dw_preview.Describe( ls_label_name[ i ] + ".x" ))		
			ll_x = ll_x - 25
			tab_1.tabpage_preview.dw_preview.Modify( ls_label_name[ i ] + ".x='" + String( ll_x ) + "'")		
			tab_1.tabpage_preview.dw_preview.Modify( ls_column_name[ i ] + ".x='" + String( ll_x ) + "'")			
			tab_1.tabpage_columns.dw_view_fields.SetItem( i, "field_x", ll_x  )			
		END IF
	END FOR
ELSE
	ll_x = Long(tab_1.tabpage_preview.dw_preview.Describe( ls_label_name[ ii_tag ] + ".x" ))
	ll_x = ll_x - 25
	tab_1.tabpage_preview.dw_preview.Modify( ls_label_name[ ii_tag ] + ".x='" + String( ll_x ) + "'")		
	tab_1.tabpage_preview.dw_preview.Modify( ls_column_name[ ii_tag ] + ".x='" + String( ll_x ) + "'")			
	tab_1.tabpage_columns.dw_view_fields.SetItem( ii_tag, "field_x", ll_x  )	
END IF

end event

event lineright;IF st_obj_name.Text = "None" THEN
	Return
END IF

Long ll_x
Long ll_x_pos
Long ll_start_x
Integer i

ll_start_x = Long(tab_1.tabpage_preview.dw_preview.Describe( ls_label_name[ ii_tag ] + ".x" ))
IF cbx_move_all.Checked THEN
	FOR i = ii_tag TO ii_col_count
		ll_x_pos = tab_1.tabpage_columns.dw_view_fields.GetItemNumber( i, "field_x"  )			
		IF ll_x_pos >= ll_start_x THEN
			ll_x = Long(tab_1.tabpage_preview.dw_preview.Describe( ls_label_name[ i ] + ".x" ))		
			ll_x = ll_x + 25
			tab_1.tabpage_preview.dw_preview.Modify( ls_label_name[ i ] + ".x='" + String( ll_x ) + "'")		
			tab_1.tabpage_preview.dw_preview.Modify( ls_column_name[ i ] + ".x='" + String( ll_x ) + "'")			
			tab_1.tabpage_columns.dw_view_fields.SetItem( i, "field_x", ll_x  )			
		END IF
	END FOR
ELSE
	ll_x = Long(tab_1.tabpage_preview.dw_preview.Describe( ls_label_name[ ii_tag ] + ".x" ))
	ll_x = ll_x + 25
	tab_1.tabpage_preview.dw_preview.Modify( ls_label_name[ ii_tag ] + ".x='" + String( ll_x ) + "'")		
	tab_1.tabpage_preview.dw_preview.Modify( ls_column_name[ ii_tag ] + ".x='" + String( ll_x ) + "'")			
	tab_1.tabpage_columns.dw_view_fields.SetItem( ii_tag, "field_x", ll_x  )	
END IF

end event

event pageleft;IF st_obj_name.Text = "None" THEN
	Return
END IF

Long ll_x
Long ll_x_pos
Long ll_start_x
Integer i

ll_start_x = Long(tab_1.tabpage_preview.dw_preview.Describe( ls_label_name[ ii_tag ] + ".x" ))
IF cbx_move_all.Checked THEN
	FOR i = ii_tag TO ii_col_count
		ll_x_pos = tab_1.tabpage_columns.dw_view_fields.GetItemNumber( i, "field_x"  )			
		IF ll_x_pos >= ll_start_x THEN
			ll_x = Long(tab_1.tabpage_preview.dw_preview.Describe( ls_label_name[ i ] + ".x" ))		
			ll_x = ll_x - 75
			tab_1.tabpage_preview.dw_preview.Modify( ls_label_name[ i ] + ".x='" + String( ll_x ) + "'")		
			tab_1.tabpage_preview.dw_preview.Modify( ls_column_name[ i ] + ".x='" + String( ll_x ) + "'")			
			tab_1.tabpage_columns.dw_view_fields.SetItem( i, "field_x", ll_x  )			
		END IF
	END FOR
ELSE
	ll_x = Long(tab_1.tabpage_preview.dw_preview.Describe( ls_label_name[ ii_tag ] + ".x" ))
	ll_x = ll_x - 75
	tab_1.tabpage_preview.dw_preview.Modify( ls_label_name[ ii_tag ] + ".x='" + String( ll_x ) + "'")		
	tab_1.tabpage_preview.dw_preview.Modify( ls_column_name[ ii_tag ] + ".x='" + String( ll_x ) + "'")			
	tab_1.tabpage_columns.dw_view_fields.SetItem( ii_tag, "field_x", ll_x  )	
END IF
end event

event pageright;IF st_obj_name.Text = "None" THEN
	Return
END IF

Long ll_x
Long ll_x_pos
Long ll_start_x
Integer i

ll_start_x = Long(tab_1.tabpage_preview.dw_preview.Describe( ls_label_name[ ii_tag ] + ".x" ))
IF cbx_move_all.Checked THEN
	FOR i = ii_tag TO ii_col_count
		ll_x_pos = tab_1.tabpage_columns.dw_view_fields.GetItemNumber( i, "field_x"  )			
		IF ll_x_pos >= ll_start_x THEN
			ll_x = Long(tab_1.tabpage_preview.dw_preview.Describe( ls_label_name[ i ] + ".x" ))		
			ll_x = ll_x + 75
			tab_1.tabpage_preview.dw_preview.Modify( ls_label_name[ i ] + ".x='" + String( ll_x ) + "'")		
			tab_1.tabpage_preview.dw_preview.Modify( ls_column_name[ i ] + ".x='" + String( ll_x ) + "'")			
			tab_1.tabpage_columns.dw_view_fields.SetItem( i, "field_x", ll_x  )			
		END IF
	END FOR
ELSE
	ll_x = Long(tab_1.tabpage_preview.dw_preview.Describe( ls_label_name[ ii_tag ] + ".x" ))
	ll_x = ll_x + 75
	tab_1.tabpage_preview.dw_preview.Modify( ls_label_name[ ii_tag ] + ".x='" + String( ll_x ) + "'")		
	tab_1.tabpage_preview.dw_preview.Modify( ls_column_name[ ii_tag ] + ".x='" + String( ll_x ) + "'")			
	tab_1.tabpage_columns.dw_view_fields.SetItem( ii_tag, "field_x", ll_x  )	
END IF
end event

event constructor;This.MinPosition = 1
This.MaxPosition = 3
This.Position = 2
end event

type st_3 from statictext within tabpage_preview
integer x = 82
integer y = 228
integer width = 187
integer height = 56
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
string text = "Move "
alignment alignment = center!
boolean focusrectangle = false
end type

type st_1 from statictext within tabpage_preview
integer x = 73
integer y = 72
integer width = 329
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
string text = "Adjust Width"
alignment alignment = center!
boolean focusrectangle = false
end type

type hsb_1 from hscrollbar within tabpage_preview
integer x = 96
integer y = 140
integer width = 315
integer height = 52
boolean bringtotop = true
end type

event lineleft;IF st_obj_name.Text = "None" THEN
	Return
END IF

Long ll_width
Integer i
Integer li_start_col
Long ll_x

ll_width = Long( dw_preview.Describe( is_obj_name + ".width")	)

ll_width = ll_width - 25

tab_1.tabpage_preview.dw_preview.Modify( ls_label_name[ ii_tag ] + ".width='" + String( ll_width ) + "'")			
tab_1.tabpage_preview.dw_preview.Modify( ls_column_name[ ii_tag ] + ".width='" + String( ll_width ) + "'")			

li_start_col = ii_tag + 1 

FOR i = li_start_col TO ii_col_count
	ll_x = Long(tab_1.tabpage_preview.dw_preview.Describe( ls_label_name[ i ] + ".x" ))
	ll_x = ll_x - 25
	tab_1.tabpage_preview.dw_preview.Modify( ls_label_name[ i ] + ".x='" + String( ll_x ) + "'")		
	tab_1.tabpage_preview.dw_preview.Modify( ls_column_name[ i ] + ".x='" + String( ll_x ) + "'")			
	tab_1.tabpage_columns.dw_view_fields.SetItem( i, "field_x", ll_x  )	
END FOR

tab_1.tabpage_columns.dw_view_fields.SetItem( ii_tag, "field_display_width", String( ll_width ) )




end event

event lineright;IF st_obj_name.Text = "None" THEN
	Return
END IF

Long ll_width
Integer i
Integer li_start_col
Long ll_x

ll_width = Long( dw_preview.Describe( is_obj_name + ".width")	)

ll_width = ll_width + 25

tab_1.tabpage_preview.dw_preview.Modify( ls_label_name[ ii_tag ] + ".width='" + String( ll_width ) + "'")			
tab_1.tabpage_preview.dw_preview.Modify( ls_column_name[ ii_tag ] + ".width='" + String( ll_width ) + "'")			

li_start_col = ii_tag + 1 

FOR i = li_start_col TO ii_col_count
	ll_x = Long(tab_1.tabpage_preview.dw_preview.Describe( ls_label_name[ i ] + ".x" ))
	ll_x = ll_x + 25
	tab_1.tabpage_preview.dw_preview.Modify( ls_label_name[ i ] + ".x='" + String( ll_x ) + "'")		
	tab_1.tabpage_preview.dw_preview.Modify( ls_column_name[ i ] + ".x='" + String( ll_x ) + "'")			
	tab_1.tabpage_columns.dw_view_fields.SetItem( i, "field_x", ll_x  )	
END FOR

tab_1.tabpage_columns.dw_view_fields.SetItem( ii_tag, "field_display_width", String( ll_width ) )





end event

event constructor;This.MinPosition = 1
This.MaxPosition = 3
This.Position = 2
end event

event pageleft;IF st_obj_name.Text = "None" THEN
	Return
END IF

Long ll_width
Integer i
Integer li_start_col
Long ll_x

ll_width = Long( dw_preview.Describe( is_obj_name + ".width")	)

ll_width = ll_width - 75

tab_1.tabpage_preview.dw_preview.Modify( ls_label_name[ ii_tag ] + ".width='" + String( ll_width ) + "'")			
tab_1.tabpage_preview.dw_preview.Modify( ls_column_name[ ii_tag ] + ".width='" + String( ll_width ) + "'")			

li_start_col = ii_tag + 1 

FOR i = li_start_col TO ii_col_count
	ll_x = Long(tab_1.tabpage_preview.dw_preview.Describe( ls_label_name[ i ] + ".x" ))
	ll_x = ll_x - 75
	tab_1.tabpage_preview.dw_preview.Modify( ls_label_name[ i ] + ".x='" + String( ll_x ) + "'")		
	tab_1.tabpage_preview.dw_preview.Modify( ls_column_name[ i ] + ".x='" + String( ll_x ) + "'")			
	tab_1.tabpage_columns.dw_view_fields.SetItem( i, "field_x", ll_x  )	
END FOR

tab_1.tabpage_columns.dw_view_fields.SetItem( ii_tag, "field_display_width", String( ll_width ) )





end event

event pageright;IF st_obj_name.Text = "None" THEN
	Return
END IF

Long ll_width
Integer i
Integer li_start_col
Long ll_x

ll_width = Long( dw_preview.Describe( is_obj_name + ".width")	)

ll_width = ll_width + 75

tab_1.tabpage_preview.dw_preview.Modify( ls_label_name[ ii_tag ] + ".width='" + String( ll_width ) + "'")			
tab_1.tabpage_preview.dw_preview.Modify( ls_column_name[ ii_tag ] + ".width='" + String( ll_width ) + "'")			

li_start_col = ii_tag + 1 

FOR i = li_start_col TO ii_col_count
	ll_x = Long(tab_1.tabpage_preview.dw_preview.Describe( ls_label_name[ i ] + ".x" ))
	ll_x = ll_x + 75
	tab_1.tabpage_preview.dw_preview.Modify( ls_label_name[ i ] + ".x='" + String( ll_x ) + "'")		
	tab_1.tabpage_preview.dw_preview.Modify( ls_column_name[ i ] + ".x='" + String( ll_x ) + "'")			
	tab_1.tabpage_columns.dw_view_fields.SetItem( i, "field_x", ll_x  )	
END FOR

tab_1.tabpage_columns.dw_view_fields.SetItem( ii_tag, "field_display_width", String( ll_width ) )





end event

type cbx_move_all from checkbox within tabpage_preview
integer x = 462
integer y = 284
integer width = 722
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
string text = "Move All (select first label)"
end type

type cb_2 from commandbutton within tabpage_preview
integer x = 2176
integer y = 264
integer width = 247
integer height = 80
integer taborder = 100
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Ruler"
end type

event clicked;dw_preview.Modify("DataWindow.Print.Preview=Yes")
dw_preview.Modify("DataWindow.Print.Preview.Rulers=Yes")

end event

type tabpage_run from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 3483
integer height = 2048
boolean enabled = false
long backcolor = 79741120
string text = "Run Report"
long tabbackcolor = 79741120
string picturename = "Run!"
long picturemaskcolor = 12632256
dw_run dw_run
cb_next_run cb_next_run
cb_saveas cb_saveas
cb_print cb_print
cb_filter cb_filter
cb_sort cb_sort
cb_17 cb_17
st_step st_step
dw_wizard dw_wizard
st_sql st_sql
end type

on tabpage_run.create
this.dw_run=create dw_run
this.cb_next_run=create cb_next_run
this.cb_saveas=create cb_saveas
this.cb_print=create cb_print
this.cb_filter=create cb_filter
this.cb_sort=create cb_sort
this.cb_17=create cb_17
this.st_step=create st_step
this.dw_wizard=create dw_wizard
this.st_sql=create st_sql
this.Control[]={this.dw_run,&
this.cb_next_run,&
this.cb_saveas,&
this.cb_print,&
this.cb_filter,&
this.cb_sort,&
this.cb_17,&
this.st_step,&
this.dw_wizard,&
this.st_sql}
end on

on tabpage_run.destroy
destroy(this.dw_run)
destroy(this.cb_next_run)
destroy(this.cb_saveas)
destroy(this.cb_print)
destroy(this.cb_filter)
destroy(this.cb_sort)
destroy(this.cb_17)
destroy(this.st_step)
destroy(this.dw_wizard)
destroy(this.st_sql)
end on

type dw_run from u_dw within tabpage_run
integer x = 1385
integer y = 72
integer width = 2089
integer height = 1784
integer taborder = 21
boolean bringtotop = true
boolean titlebar = true
string title = "Report Preview"
boolean minbox = true
boolean maxbox = true
boolean hscrollbar = true
end type

event constructor;call super::constructor;This.SetTransObject( SQLCA )
end event

event retrieveend;call super::retrieveend;tab_1.tabpage_run.st_step.Text = "Report Returned " + String( rowcount ) + " Rows"
end event

event resize;call super::resize;cb_print.BringToTop = True
cb_filter.BringToTop = True
cb_saveas.BringToTop = True
cb_sort.BringToTop = True

end event

event clicked;call super::clicked;//messagebox("", dw_run.GetClickedColumn ( ))
end event

type cb_next_run from commandbutton within tabpage_run
integer x = 293
integer y = 1872
integer width = 247
integer height = 84
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Next-->"
end type

event clicked;of_next_wizard()

//dw_run.Describe("<Reportname>.Name")
//dw_run.Modify("Width='<the width of the object in the units specified for the DataWindow>'")

//dw_run.Modify("DataWindow.Print.Paper.Size='1'")
//IF tab_1.tabpage_browse.dw_report_list.GetItemString( tab_1.tabpage_browse.dw_report_list.GetRow(), "orientation" ) =  "P" THEN
//	dw_run.Modify("DataWindow.Print.Orientation= '2'")
//ELSE
//	dw_run.Modify("DataWindow.Print.Orientation= '1'")	
//END IF
//

//of_preview( dw_run )
end event

type cb_saveas from commandbutton within tabpage_run
integer x = 2190
integer y = 1872
integer width = 256
integer height = 84
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Save As.."
end type

event clicked;dw_run.SaveAs()
//restore Directory  
//added by nova 2008-04-29
ChangeDirectory ( gs_dir_path )

end event

type cb_print from commandbutton within tabpage_run
integer x = 1911
integer y = 1872
integer width = 256
integer height = 84
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Print"
end type

event clicked;dw_run.Print()
end event

type cb_filter from commandbutton within tabpage_run
integer x = 1646
integer y = 1872
integer width = 247
integer height = 84
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Filter.."
end type

event clicked;String ls_null
Long ll_row_count

SetNull( ls_null )

dw_run.SetFilter( ls_null )
dw_run.Filter()

ll_row_count = dw_run.RowCount( )

tab_1.tabpage_run.st_step.Text = "Report Returned " + String( ll_row_count ) + " Rows"
end event

type cb_sort from commandbutton within tabpage_run
integer x = 1381
integer y = 1872
integer width = 247
integer height = 84
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Sort.."
end type

event clicked;String ls_null

SetNull( ls_null )

dw_run.SetSort( ls_null )
dw_run.Sort()
end event

type cb_17 from commandbutton within tabpage_run
integer x = 27
integer y = 1872
integer width = 247
integer height = 84
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Reset"
end type

event clicked;of_wizard_setup()
tab_1.tabpage_run.st_sql.Text = ""
tab_1.tabpage_run.st_sql.Visible = False
tab_1.tabpage_run.cb_next_run.Enabled = True

end event

type st_step from statictext within tabpage_run
integer x = 590
integer y = 1884
integer width = 750
integer height = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 8388608
long backcolor = 67108864
boolean enabled = false
boolean focusrectangle = false
end type

type dw_wizard from u_dw within tabpage_run
integer x = 27
integer y = 72
integer width = 1307
integer height = 1772
integer taborder = 11
string dataobject = "d_crit_custom"
boolean hscrollbar = true
end type

event retrieveend;call super::retrieveend;This.InsertRow( 1 )
IF This.DataObject <> "d_crit_date_range_custom" AND This.DataObject <> "d_crit_single_date_custom" AND This.DataObject <> "d_crit_facility" THEN
	This.SetItem( 1, "selected", 1 )
	This.SetItem( 1, "lookup_code", 0 )
	This.SetItem( 1, "code", "All" )
	IF is_wizard_lookup_type[ ii_current_wizard_step ] = "C" THEN
		This.SetItem( 1, "description", "Include All selections" )		
	ELSE
		This.SetItem( 1, "entity_name", "Include All selections" )			
	END IF
ELSEIF This.DataObject = "d_crit_facility"  THEN
	This.SetItem( 1, "selected", 1 )
	This.SetItem( 1, "facility_id", 0 )
	This.SetItem( 1, "facility_name", "All" )	
END IF
end event

event constructor;call super::constructor;//This.SetUpdatAble( False )

end event

event itemchanged;call super::itemchanged;IF data = "1" AND row = 1 THEN
	Integer li_rc
	Integer i
	li_rc = This.RowCount()
	FOR i = 2 TO li_rc
		This.SetItem( i, "selected", 0 )
	END FOR
ELSEIF data = "1" AND row <> 1 THEN
	This.SetItem( 1, "selected", 0 )
END IF
end event

type st_sql from statictext within tabpage_run
integer x = 37
integer y = 80
integer width = 1289
integer height = 1752
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 16777215
boolean enabled = false
boolean focusrectangle = false
end type

