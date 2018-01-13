$PBExportHeader$w_auto_add_fields.srw
forward
global type w_auto_add_fields from window
end type
type progress_bar from u_progress within w_auto_add_fields
end type
type dw_select_field from datawindow within w_auto_add_fields
end type
type dw_screen from u_dw within w_auto_add_fields
end type
type cb_ok from commandbutton within w_auto_add_fields
end type
type tab_1 from tab within w_auto_add_fields
end type
type tabpage_1 from userobject within tab_1
end type
type cb_next from commandbutton within tabpage_1
end type
type cb_select from commandbutton within tabpage_1
end type
type dw_1 from datawindow within tabpage_1
end type
type tabpage_1 from userobject within tab_1
cb_next cb_next
cb_select cb_select
dw_1 dw_1
end type
type tabpage_2 from userobject within tab_1
end type
type cb_2 from commandbutton within tabpage_2
end type
type cb_1 from commandbutton within tabpage_2
end type
type dw_2 from datawindow within tabpage_2
end type
type tabpage_2 from userobject within tab_1
cb_2 cb_2
cb_1 cb_1
dw_2 dw_2
end type
type tab_1 from tab within w_auto_add_fields
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type
type cb_cancel from commandbutton within w_auto_add_fields
end type
end forward

global type w_auto_add_fields from window
integer width = 2606
integer height = 2160
boolean titlebar = true
string title = "Select Column(s) From Screen"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
progress_bar progress_bar
dw_select_field dw_select_field
dw_screen dw_screen
cb_ok cb_ok
tab_1 tab_1
cb_cancel cb_cancel
end type
global w_auto_add_fields w_auto_add_fields

type variables
integer il_view_id
Integer il_export_type
string is_action
long il_insert_num
datawindow dw_detail,dw_fld_list
datastore ids_field_name,ids_select_field //Added By Jay Chen 03-04-2014
long il_last_progress_position
end variables

forward prototypes
public subroutine of_generate_field (string data)
public subroutine of_add_ctx_scrn_data (long row, integer ai_screen, long field_row)
public subroutine of_add_constant_data (long field_row)
public subroutine of_add_ctx_column_data (integer row, string as_colname, long field_row)
public subroutine of_column_check (string data, integer row, long field_row)
public subroutine of_generate_dddw (string dwoname, string data, integer row, ref boolean ab_ctx_id_existed)
public function integer of_check_filed_exist (string as_table, string as_colname)
end prototypes

public subroutine of_generate_field (string data);//--------------------------- APPEON BEGIN ---------------------------
//$<add> 2006-11-28 By: Rodger Wu

//datawindow dw_screen
datawindowchild ldwc_ctxscrn, ldwc_linkfromcolumn
string ls_table, ls_colname, ls_dbname, ls_temp, ls_label, ls_dataobject
integer li_found, li_cols, i, li_inserted, li_getrow
String  ls_DataTypeTemp,ls_DataType//<add> andy 2007.05.23
string ls_dwsyntax
string ls_tab_name
datawindow ldw[]
string ls_dw_name[]
string ls_dataobjects[]
string ls_dddw_data
string ls_dddw_display
string ls_format
string ls_export_name, ls_table_name,	ls_export_fields_web_visible,ls_string
pfc_n_cst_ai_export_apb  ln_export_apb
long ll_cnt,ll_find

li_found = tab_1.tabpage_1.dw_1.Find( "screen_id = " + string( data ), 1, tab_1.tabpage_1.dw_1.rowcount() )
if li_found > 0 then
	if data = '12' then	//12-Exprot Profile Detail- jervis 03.17.2009
		ls_dataobject = 'd_export_contract_profile'
		ls_table_name	= 'ctx_elements'														
	else
		ls_dataobject = tab_1.tabpage_1.dw_1.GetItemString( li_found, "dataobject" )
		ls_table_name  = tab_1.tabpage_1.dw_1.GetItemString( li_found, "table_name" )			
	end if
	
//	if row > 0 then
//		This.SetItem( row, "export_fields_ctx_scrn_dataobject", ls_dataobject )
//		If dwoname = 'export_fields_ctx_scrn_id' Then 
//			This.SetItem( row, "export_fields_ctx_table_name", ls_table_name )				
//			ls_export_fields_web_visible = this.GetItemString(row,'export_fields_web_visible')
//			if not isnull(ls_export_fields_web_visible) and ls_export_fields_web_visible = '1' then 
//				if not isvalid(ln_export_apb ) then ln_export_apb = Create pfc_n_cst_ai_export_apb
//				if ln_export_apb.of_exists_export_table(ls_table_name) = false then 
//					This.SetItem( row, "export_fields_web_visible", '0' )	
//				end if 
//				Destroy ln_export_apb
//			end if 			
//		End IF 
//	end if
		
		dw_screen.dataobject = ls_dataobject
		
//		If ls_dataobject = 'd_contract_det_contact_external' Then
//			li_inserted = tab_1.tabpage_2.dw_2.insertrow( 0 )
//			tab_1.tabpage_2.dw_2.setitem( li_inserted, "field_name", 'compute_1' )
//			tab_1.tabpage_2.dw_2.setitem( li_inserted, "field_name_alias", 'Name' )
//			tab_1.tabpage_2.dw_2.setitem( li_inserted, "field_datatype", 'S' )
//			tab_1.tabpage_2.dw_2.setitem( li_inserted, "field_screen", data )
//			if of_check_filed_exist(ls_table_name,'compute_1') < 1 then
//				tab_1.tabpage_2.dw_2.setitem( li_inserted, "desc", "This column already exists in the export painter" )
//				tab_1.tabpage_2.dw_2.setitem( li_inserted, "is_exist", "1" )
//				tab_1.tabpage_2.dw_2.setitem( li_inserted, "is_select", "1" )
//			end if
//			ll_find = dw_select_field.find("export_field_name = 'compute_1' and field_screen = '"+data+"'",1,dw_select_field.rowcount())
//			if isnull(ll_find) then ll_find = 0
//			if ll_find > 0 then
//				tab_1.tabpage_2.dw_2.setitem( li_inserted, "is_select", "1" )
//			end if
//			
//			li_inserted = tab_1.tabpage_2.dw_2.insertrow( 0 )
//			tab_1.tabpage_2.dw_2.setitem( li_inserted, "field_name", 'contact_phone' )
//			tab_1.tabpage_2.dw_2.setitem( li_inserted, "field_name_alias", 'Contact Phone' )
//			tab_1.tabpage_2.dw_2.setitem( li_inserted, "field_datatype", 'S' )
//			tab_1.tabpage_2.dw_2.setitem( li_inserted, "field_screen", data )
//			if of_check_filed_exist(ls_table_name,'contact_phone') < 1 then
//				tab_1.tabpage_2.dw_2.setitem( li_inserted, "desc", "This column already exists in the export painter" )
//				tab_1.tabpage_2.dw_2.setitem( li_inserted, "is_exist", "1" )
//				tab_1.tabpage_2.dw_2.setitem( li_inserted, "is_select", "1" )
//			end if
//			ll_find = dw_select_field.find("export_field_name = 'contact_phone' and field_screen = '"+data+"'",1,dw_select_field.rowcount())
//			if isnull(ll_find) then ll_find = 0
//			if ll_find > 0 then
//				tab_1.tabpage_2.dw_2.setitem( li_inserted, "is_select", "1" )
//			end if
//		
//			li_inserted = tab_1.tabpage_2.dw_2.insertrow( 0 )
//			tab_1.tabpage_2.dw_2.setitem( li_inserted, "field_name", 'contact_email' )
//			tab_1.tabpage_2.dw_2.setitem( li_inserted, "field_name_alias", 'Contact Email' )
//			tab_1.tabpage_2.dw_2.setitem( li_inserted, "field_datatype", 'S' )
//			tab_1.tabpage_2.dw_2.setitem( li_inserted, "field_screen", data )
//			if of_check_filed_exist(ls_table_name,'contact_email') < 1 then
//				tab_1.tabpage_2.dw_2.setitem( li_inserted, "desc", "This column already exists in the export painter" )
//				tab_1.tabpage_2.dw_2.setitem( li_inserted, "is_exist", "1" )
//				tab_1.tabpage_2.dw_2.setitem( li_inserted, "is_select", "1" )
//			end if
//			ll_find = dw_select_field.find("export_field_name = 'contact_email' and field_screen = '"+data+"'",1,dw_select_field.rowcount())
//			if isnull(ll_find) then ll_find = 0
//			if ll_find > 0 then
//				tab_1.tabpage_2.dw_2.setitem( li_inserted, "is_select", "1" )
//			end if
//			
//			//Add contact_id and association -- jervis 01.28.2011
//			li_inserted = tab_1.tabpage_2.dw_2.insertrow( 0 )
//			tab_1.tabpage_2.dw_2.setitem( li_inserted, "field_name", 'contact_id' )
//			tab_1.tabpage_2.dw_2.setitem( li_inserted, "field_name_alias", 'Contact ID' )
//			tab_1.tabpage_2.dw_2.setitem( li_inserted, "field_datatype", 'N' )
//			tab_1.tabpage_2.dw_2.setitem( li_inserted, "field_screen", data )
//			if of_check_filed_exist(ls_table_name,'contact_id') < 1 then
//				tab_1.tabpage_2.dw_2.setitem( li_inserted, "desc", "This column already exists in the export painter" )
//				tab_1.tabpage_2.dw_2.setitem( li_inserted, "is_exist", "1" )
//				tab_1.tabpage_2.dw_2.setitem( li_inserted, "is_select", "1" )
//			end if
//			ll_find = dw_select_field.find("export_field_name = 'contact_id' and field_screen = '"+data+"'",1,dw_select_field.rowcount())
//			if isnull(ll_find) then ll_find = 0
//			if ll_find > 0 then
//				tab_1.tabpage_2.dw_2.setitem( li_inserted, "is_select", "1" )
//			end if
//			   
//			li_inserted = tab_1.tabpage_2.dw_2.insertrow( 0 )
//			tab_1.tabpage_2.dw_2.setitem( li_inserted, "field_name", 'association' )
//			tab_1.tabpage_2.dw_2.setitem( li_inserted, "field_name_alias", 'Association' )
//			tab_1.tabpage_2.dw_2.setitem( li_inserted, "field_datatype", 'S' )
//			tab_1.tabpage_2.dw_2.setitem( li_inserted, "field_screen", data )
//			tab_1.tabpage_2.dw_2.SetItem( li_inserted, "field_type", 'C' )
//			if of_check_filed_exist(ls_table_name,'association') < 1 then
//				tab_1.tabpage_2.dw_2.setitem( li_inserted, "desc", "This column already exists in the export painter" )
//				tab_1.tabpage_2.dw_2.setitem( li_inserted, "is_exist", "1" )
//				tab_1.tabpage_2.dw_2.setitem( li_inserted, "is_select", "1" )
//			end if
//			ll_find = dw_select_field.find("export_field_name = 'association' and field_screen = '"+data+"'",1,dw_select_field.rowcount())
//			if isnull(ll_find) then ll_find = 0
//			if ll_find > 0 then
//				tab_1.tabpage_2.dw_2.setitem( li_inserted, "is_select", "1" )
//			end if
//			
//			li_inserted = tab_1.tabpage_2.dw_2.insertrow( 0 )
//			tab_1.tabpage_2.dw_2.setitem( li_inserted, "field_name", 'Facility_id' )
//			tab_1.tabpage_2.dw_2.setitem( li_inserted, "field_name_alias", 'Company ID' )
//			tab_1.tabpage_2.dw_2.setitem( li_inserted, "field_datatype", 'N' )
//			tab_1.tabpage_2.dw_2.setitem( li_inserted, "field_screen", data )
//			tab_1.tabpage_2.dw_2.SetItem( li_inserted, "field_type", 'P' )
//			if of_check_filed_exist(ls_table_name,'Facility_id') < 1 then
//				tab_1.tabpage_2.dw_2.setitem( li_inserted, "desc", "This column already exists in the export painter" )
//				tab_1.tabpage_2.dw_2.setitem( li_inserted, "is_exist", "1" )
//				tab_1.tabpage_2.dw_2.setitem( li_inserted, "is_select", "1" )
//			end if
//			ll_find = dw_select_field.find("export_field_name = 'Facility_id' and field_screen = '"+data+"'",1,dw_select_field.rowcount())
//			if isnull(ll_find) then ll_find = 0
//			if ll_find > 0 then
//				tab_1.tabpage_2.dw_2.setitem( li_inserted, "is_select", "1" )
//			end if
//					
//			li_inserted = tab_1.tabpage_2.dw_2.insertrow( 0 )
//			tab_1.tabpage_2.dw_2.setitem( li_inserted, "field_name", 'association2' )
//			tab_1.tabpage_2.dw_2.setitem( li_inserted, "field_name_alias", 'Association2' )
//			tab_1.tabpage_2.dw_2.setitem( li_inserted, "field_datatype", 'S' )
//			tab_1.tabpage_2.dw_2.setitem( li_inserted, "field_screen", data )
//			tab_1.tabpage_2.dw_2.SetItem( li_inserted, "field_type", 'C' )
//			if of_check_filed_exist(ls_table_name,'association2') < 1 then
//				tab_1.tabpage_2.dw_2.setitem( li_inserted, "desc", "This column already exists in the export painter" )
//				tab_1.tabpage_2.dw_2.setitem( li_inserted, "is_exist", "1" )
//				tab_1.tabpage_2.dw_2.setitem( li_inserted, "is_select", "1" )
//			end if
//			ll_find = dw_select_field.find("export_field_name = 'association2' and field_screen = '"+data+"'",1,dw_select_field.rowcount())
//			if isnull(ll_find) then ll_find = 0
//			if ll_find > 0 then
//				tab_1.tabpage_2.dw_2.setitem( li_inserted, "is_select", "1" )
//			end if
//			
//			li_inserted = tab_1.tabpage_2.dw_2.insertrow( 0 )
//			tab_1.tabpage_2.dw_2.setitem( li_inserted, "field_name", 'association3' )
//			tab_1.tabpage_2.dw_2.setitem( li_inserted, "field_name_alias", 'Association3' )
//			tab_1.tabpage_2.dw_2.setitem( li_inserted, "field_datatype", 'S' )
//			tab_1.tabpage_2.dw_2.setitem( li_inserted, "field_screen", data )
//			tab_1.tabpage_2.dw_2.SetItem( li_inserted, "field_type", 'C' )
//			if of_check_filed_exist(ls_table_name,'association3') < 1 then
//				tab_1.tabpage_2.dw_2.setitem( li_inserted, "desc", "This column already exists in the export painter" )
//				tab_1.tabpage_2.dw_2.setitem( li_inserted, "is_exist", "1" )
//				tab_1.tabpage_2.dw_2.setitem( li_inserted, "is_select", "1" )
//			end if
//			ll_find = dw_select_field.find("export_field_name = 'association3' and field_screen = '"+data+"'",1,dw_select_field.rowcount())
//			if isnull(ll_find) then ll_find = 0
//			if ll_find > 0 then
//				tab_1.tabpage_2.dw_2.setitem( li_inserted, "is_select", "1" )
//			end if
//			
//			li_inserted = tab_1.tabpage_2.dw_2.insertrow( 0 )
//			tab_1.tabpage_2.dw_2.setitem( li_inserted, "field_name", 'association4' )
//			tab_1.tabpage_2.dw_2.setitem( li_inserted, "field_name_alias", 'Association4' )
//			tab_1.tabpage_2.dw_2.setitem( li_inserted, "field_datatype", 'S' )
//			tab_1.tabpage_2.dw_2.setitem( li_inserted, "field_screen", data )
//			tab_1.tabpage_2.dw_2.SetItem( li_inserted, "field_type", 'C' )
//			if of_check_filed_exist(ls_table_name,'association4') < 1 then
//				tab_1.tabpage_2.dw_2.setitem( li_inserted, "desc", "This column already exists in the export painter" )
//				tab_1.tabpage_2.dw_2.setitem( li_inserted, "is_exist", "1" )
//				tab_1.tabpage_2.dw_2.setitem( li_inserted, "is_select", "1" )
//			end if
//			ll_find = dw_select_field.find("export_field_name = 'association4' and field_screen = '"+data+"'",1,dw_select_field.rowcount())
//			if isnull(ll_find) then ll_find = 0
//			if ll_find > 0 then
//				tab_1.tabpage_2.dw_2.setitem( li_inserted, "is_select", "1" )
//			end if
//			
//			li_inserted = tab_1.tabpage_2.dw_2.insertrow( 0 )
//			tab_1.tabpage_2.dw_2.setitem( li_inserted, "field_name", 'association5' )
//			tab_1.tabpage_2.dw_2.setitem( li_inserted, "field_name_alias", 'Association5' )
//			tab_1.tabpage_2.dw_2.setitem( li_inserted, "field_datatype", 'S' )
//			tab_1.tabpage_2.dw_2.setitem( li_inserted, "field_screen", data )
//			tab_1.tabpage_2.dw_2.SetItem( li_inserted, "field_type", 'C' )
//			if of_check_filed_exist(ls_table_name,'association5') < 1 then
//				tab_1.tabpage_2.dw_2.setitem( li_inserted, "desc", "This column already exists in the export painter" )
//				tab_1.tabpage_2.dw_2.setitem( li_inserted, "is_exist", "1" )
//				tab_1.tabpage_2.dw_2.setitem( li_inserted, "is_select", "1" )
//			end if
//			ll_find = dw_select_field.find("export_field_name = 'association5' and field_screen = '"+data+"'",1,dw_select_field.rowcount())
//			if isnull(ll_find) then ll_find = 0
//			if ll_find > 0 then
//				tab_1.tabpage_2.dw_2.setitem( li_inserted, "is_select", "1" )
//			end if
//			
//			li_inserted = tab_1.tabpage_2.dw_2.insertrow( 0 )
//			tab_1.tabpage_2.dw_2.setitem( li_inserted, "field_name", 'association6' )
//			tab_1.tabpage_2.dw_2.setitem( li_inserted, "field_name_alias", 'Association6' )
//			tab_1.tabpage_2.dw_2.setitem( li_inserted, "field_datatype", 'S' )
//			tab_1.tabpage_2.dw_2.setitem( li_inserted, "field_screen", data )
//			tab_1.tabpage_2.dw_2.SetItem( li_inserted, "field_type", 'C' )
//			if of_check_filed_exist(ls_table_name,'association6') < 1 then
//				tab_1.tabpage_2.dw_2.setitem( li_inserted, "desc", "This column already exists in the export painter" )
//				tab_1.tabpage_2.dw_2.setitem( li_inserted, "is_exist", "1" )
//				tab_1.tabpage_2.dw_2.setitem( li_inserted, "is_select", "1" )
//			end if
//			ll_find = dw_select_field.find("export_field_name = 'association6' and field_screen = '"+data+"'",1,dw_select_field.rowcount())
//			if isnull(ll_find) then ll_find = 0
//			if ll_find > 0 then
//				tab_1.tabpage_2.dw_2.setitem( li_inserted, "is_select", "1" )
//			end if
//			
//			li_inserted = tab_1.tabpage_2.dw_2.insertrow( 0 )
//			tab_1.tabpage_2.dw_2.setitem( li_inserted, "field_name", 'association7' )
//			tab_1.tabpage_2.dw_2.setitem( li_inserted, "field_name_alias", 'Association7' )
//			tab_1.tabpage_2.dw_2.setitem( li_inserted, "field_datatype", 'S' )
//			tab_1.tabpage_2.dw_2.setitem( li_inserted, "field_screen", data )
//			tab_1.tabpage_2.dw_2.SetItem( li_inserted, "field_type", 'C' )
//			if of_check_filed_exist(ls_table_name,'association7') < 1 then
//				tab_1.tabpage_2.dw_2.setitem( li_inserted, "desc", "This column already exists in the export painter" )
//				tab_1.tabpage_2.dw_2.setitem( li_inserted, "is_exist", "1" )
//				tab_1.tabpage_2.dw_2.setitem( li_inserted, "is_select", "1" )
//			end if
//			ll_find = dw_select_field.find("export_field_name = 'association7' and field_screen = '"+data+"'",1,dw_select_field.rowcount())
//			if isnull(ll_find) then ll_find = 0
//			if ll_find > 0 then
//				tab_1.tabpage_2.dw_2.setitem( li_inserted, "is_select", "1" )
//			end if
//			
//			li_inserted = tab_1.tabpage_2.dw_2.insertrow( 0 )
//			tab_1.tabpage_2.dw_2.setitem( li_inserted, "field_name", 'association8' )
//			tab_1.tabpage_2.dw_2.setitem( li_inserted, "field_name_alias", 'Association8' )
//			tab_1.tabpage_2.dw_2.setitem( li_inserted, "field_datatype", 'S' )
//			tab_1.tabpage_2.dw_2.setitem( li_inserted, "field_screen", data )
//			tab_1.tabpage_2.dw_2.SetItem( li_inserted, "field_type", 'C' )
//			if of_check_filed_exist(ls_table_name,'association8') < 1 then
//				tab_1.tabpage_2.dw_2.setitem( li_inserted, "desc", "This column already exists in the export painter" )
//				tab_1.tabpage_2.dw_2.setitem( li_inserted, "is_exist", "1" )
//				tab_1.tabpage_2.dw_2.setitem( li_inserted, "is_select", "1" )
//			end if
//			ll_find = dw_select_field.find("export_field_name = 'association8' and field_screen = '"+data+"'",1,dw_select_field.rowcount())
//			if isnull(ll_find) then ll_find = 0
//			if ll_find > 0 then
//				tab_1.tabpage_2.dw_2.setitem( li_inserted, "is_select", "1" )
//			end if
//			
//			li_inserted = tab_1.tabpage_2.dw_2.insertrow( 0 )
//			tab_1.tabpage_2.dw_2.setitem( li_inserted, "field_name", 'association9' )
//			tab_1.tabpage_2.dw_2.setitem( li_inserted, "field_name_alias", 'Association9' )
//			tab_1.tabpage_2.dw_2.setitem( li_inserted, "field_datatype", 'S' )
//			tab_1.tabpage_2.dw_2.setitem( li_inserted, "field_screen", data )
//			tab_1.tabpage_2.dw_2.SetItem( li_inserted, "field_type", 'C' )
//			if of_check_filed_exist(ls_table_name,'association9') < 1 then
//				tab_1.tabpage_2.dw_2.setitem( li_inserted, "desc", "This column already exists in the export painter" )
//				tab_1.tabpage_2.dw_2.setitem( li_inserted, "is_exist", "1" )
//				tab_1.tabpage_2.dw_2.setitem( li_inserted, "is_select", "1" )
//			end if
//			ll_find = dw_select_field.find("export_field_name = 'association9' and field_screen = '"+data+"'",1,dw_select_field.rowcount())
//			if isnull(ll_find) then ll_find = 0
//			if ll_find > 0 then
//				tab_1.tabpage_2.dw_2.setitem( li_inserted, "is_select", "1" )
//			end if
//			
//			li_inserted = tab_1.tabpage_2.dw_2.insertrow( 0 )
//			tab_1.tabpage_2.dw_2.setitem( li_inserted, "field_name", 'association10' )
//			tab_1.tabpage_2.dw_2.setitem( li_inserted, "field_name_alias", 'Association10' )
//			tab_1.tabpage_2.dw_2.setitem( li_inserted, "field_datatype", 'S' )
//			tab_1.tabpage_2.dw_2.setitem( li_inserted, "field_screen", data )
//			tab_1.tabpage_2.dw_2.SetItem( li_inserted, "field_type", 'C' )
//			if of_check_filed_exist(ls_table_name,'association10') < 1 then
//				tab_1.tabpage_2.dw_2.setitem( li_inserted, "desc", "This column already exists in the export painter" )
//				tab_1.tabpage_2.dw_2.setitem( li_inserted, "is_exist", "1" )
//				tab_1.tabpage_2.dw_2.setitem( li_inserted, "is_select", "1" )
//			end if
//			ll_find = dw_select_field.find("export_field_name = 'association10' and field_screen = '"+data+"'",1,dw_select_field.rowcount())
//			if isnull(ll_find) then ll_find = 0
//			if ll_find > 0 then
//				tab_1.tabpage_2.dw_2.setitem( li_inserted, "is_select", "1" )
//			end if
//		else
			//dw_screen = create u_dw		
			//Dynamic generate dddw base on view -- jervis 08.06.2009
			if data <> '12' and long(data) < 1000 then	
				ls_tab_name = gnv_data.of_get_table_name( long(data), 'C', 'tab_name')
		
				ldw[1] = dw_screen
				
				ls_dw_name[1] 		= gnv_data.of_get_table_name( long(data), 'C', 'dw_name')
				ls_dataobjects[1] 	= ls_dataobject //gnv_data.of_get_table_name( long(data), 'C', 'dataobject')
				
				f_create_contract_dw(il_view_id,ls_tab_name,ldw,ls_dw_name,ls_dataobjects)
				dw_screen.bringtotop = false
			end if
			
			ls_table = lower( dw_screen.Describe( "Datawindow.table.updatetable" ) )
			li_cols = integer( dw_screen.Describe( "DataWindow.Column.Count" ) )
			
			If ls_dataobject = 'd_org_search2' And ls_Table = 'ctx_orgs_contact' Then ls_Table = 'ctx_orgs' //added by gavins 20130314

			for i = 1 to li_cols
				if dw_screen.Describe("#"+string( i ) + ".visible") = "0" then 
					if data <> "2002" then continue //Jervis 09.19.2010
				end if
				ls_dbname = lower( dw_screen.Describe("#"+string( i ) + ".dbname") )
				if pos(ls_dbname,".") > 0 then	//If Exists Table selection- jervis 03.17.2009
					ls_temp = f_get_token( ls_dbname, '.' )
				end if
				
		
				ls_colname = lower( dw_screen.Describe("#"+string( i ) + ".name") )
				//Added By Jay Chen 03-05-2014
				if lower(ls_dataobject) = 'd_cntx_action_items_browse' then
					if lower(ls_colname) = 'selected' or lower(ls_colname) = 'letter_to_name' or lower(ls_colname) = 'letter_from_name'  or lower(ls_colname) = 'alm_action_title' then continue
				end if
				if lower(ls_dataobject) = 'd_contract_det_master' and lower(ls_colname) = 'total_processing_time' then continue
				if lower(ls_dataobject) = 'd_dm_new_sell_document' and lower(ls_colname) = 'from_templete_id' then continue
				//Added By Jay Chen 03-11-2014 
				if data = '56' then
					if lower(ls_colname) = 'row' or lower(ls_colname) = 'style' or lower(ls_colname) = 'level' or lower(ls_colname) = 'audit_version' then continue
					if lower(ls_colname) = 'audit_status' or lower(ls_colname) = 'audit_date' or lower(ls_colname) = 'audit_user' or lower(ls_colname) = 'audit_note' then continue
					if lower(ls_colname) = 'audit_count' or lower(ls_colname) = 'modify_date' or lower(ls_colname) = 'compare_status' or lower(ls_colname) = 'audit_doc_ext' then continue
				end if
				if data = '42' then
					if lower(ls_colname) = 'due_date_flag' or lower(ls_colname) = 'action_type_code' then continue
				end if
				if data = '31' then
					if lower(ls_colname) = 'start_date_flag' or lower(ls_colname) = 'end_date_flag' then continue
				end if
				if data = '33' then
					if lower(ls_colname) = 'selected' or lower(ls_colname) = 'alm_action_title'  or lower(ls_colname) = 'action_type_code' then continue
				end if
				if data = '53' then
					if pos(ls_colname,'_flag') > 0 and pos(ls_colname,'custom_date') > 0 then continue
				end if
				if data = '51' or data = '52'then
					if pos(ls_colname,'date_flag') > 0  then continue
					if pos(ls_colname,'_flag') > 0 and pos(ls_colname,'custom_date') > 0 then continue
				end if
				if data = '57' or  data = '1' or  data = '43' or  data = '32'  then continue //Added By Jay Chen 05-28-2014
				if data = '12' and ls_colname <> 'data_value' then continue //Added By Jay Chen 05-28-2014
				if (data = '6' or data = '7') and (lower(ls_colname) = 'phone_ext' or lower(ls_colname) = 'contact_type' or lower(ls_colname) = 'contact_title' or lower(ls_colname) = 'contact_department' or lower(ls_colname) = 'facility_name') then continue //Added By Jay Chen 10-29-2015
				
				ls_label = dw_screen.Describe( ls_colname + "_t.text")
				if ls_label = "?" or ls_label = "!" then ls_label = ""
				if ls_label = '' then ls_label = ls_dbname
				
				//Modified By Ken.Guo 2017-07-10. check editmask. use editmask first.
				If  dw_screen.Describe("#"+string( i ) + ".edit.style") = 'editmask' Then
					ls_format = dw_screen.Describe("#"+string( i ) + ".editmask.mask")
				Else
					ls_format = dw_screen.Describe("#"+string( i ) + ".format") //jervis 09.06.2010
				End If			
		
		
				//<add> andy 2007.05.23
				ls_DataType = ''
				ls_DataTypeTemp = lower( dw_screen.Describe("#"+string( i ) + ".ColType") )
				choose case left(ls_DataTypeTemp,5)
					case 'char('
						ls_DataType = 'S'
					case 'date','datet'
						ls_DataType = 'D'
					case 'decim','int','long','number','real','ulong'
						ls_DataType = 'N'
				end choose
				//end of add
				
				
				
				//if ls_temp = ls_table then
				if ls_temp = ls_table  or data = '12' or data = '56' or data = '6' or data = '7' then	//12-Export Profile detail-jervis 03.17.2009 //Added By Jay Chen 03-11-2014 Remark:add dddw fields Document Manager->Document Tab->Document Browse
					li_inserted = tab_1.tabpage_2.dw_2.insertrow( 0 )
					tab_1.tabpage_2.dw_2.setitem( li_inserted, "field_name", ls_colname )
					//tab_1.tabpage_2.dw_2.setitem( li_inserted, "field_name", ls_dbname )	//03.16.2009 by Jervis
					tab_1.tabpage_2.dw_2.setitem( li_inserted, "field_name_alias", ls_label )
					//<add> andy 2007.05.23
					tab_1.tabpage_2.dw_2.setitem( li_inserted, "field_datatype", ls_DataType )
					//end of add
					tab_1.tabpage_2.dw_2.setitem( li_inserted, "field_screen", data )	//08.07.2009 by jervis
					if of_check_filed_exist(ls_table_name,ls_colname) < 1 then
						tab_1.tabpage_2.dw_2.setitem( li_inserted, "desc", "This column already exists in the export painter" )
						tab_1.tabpage_2.dw_2.setitem( li_inserted, "is_exist", "1" )
						tab_1.tabpage_2.dw_2.setitem( li_inserted, "is_select", "1" )
					end if
					ll_find = dw_select_field.find("export_field_name = '"+ls_colname+"' and field_screen = '"+data+"'",1,dw_select_field.rowcount())
					if isnull(ll_find) then ll_find = 0
					if ll_find > 0 then
						tab_1.tabpage_2.dw_2.setitem( li_inserted, "is_select", "1" )
					end if
					
					//Add field format - jervis 09.06.2010
					if ls_format <> "" and ls_format <> "?" then
						tab_1.tabpage_2.dw_2.setitem( li_inserted, "field_format", ls_format )
					end if
					
					//Get DDDW Type -- jervis 11.26.2009
					ls_dddw_data = lower( dw_screen.Describe( "#"+string( i ) + ".dddw.datacolumn" ) )
					if ls_dddw_data = 'lookup_code' then
						tab_1.tabpage_2.dw_2.SetItem(li_inserted,"field_type","C")
						//Add display name = jervis 09.06.2010
						ls_dddw_display = lower( dw_screen.Describe( "#"+string( i ) + ".dddw.displaycolumn" ) )
						if ls_dddw_display = 'compute_code_number' or ls_dddw_display = 'compute_description_number' then ls_dddw_display = 'code' //Modified By Jay Chen 07-03-2015
						tab_1.tabpage_2.dw_2.SetItem(li_inserted,"field_display_name",ls_dddw_display)
					//elseif ls_dddw_data = 'facility_id' and dw_screen.Describe("#"+string( i ) + ".dddw.name") = 'd_dddw_company' then
					elseif ls_dddw_data = 'facility_id' and (dw_screen.Describe("#"+string( i ) + ".dddw.name") = 'd_dddw_company' or dw_screen.Describe("#"+string( i ) + ".dddw.name") = 'd_dddw_company_list') then
						tab_1.tabpage_2.dw_2.SetItem(li_inserted,"field_type","P")
					end if
					
				end if
		
				//if Not ab_ctx_id_existed then
				//	if lower( ls_dbname ) = "ctx_id" then ab_ctx_id_existed = true
				//end if	
			next
			
//			//Added By Jay Chen 10-28-2015
			If ls_dataobject = 'd_contract_det_contact_external' Then
				li_inserted = tab_1.tabpage_2.dw_2.insertrow( 0 )
				tab_1.tabpage_2.dw_2.setitem( li_inserted, "field_name", 'compute_1' )
				tab_1.tabpage_2.dw_2.setitem( li_inserted, "field_name_alias", 'Name' )
				tab_1.tabpage_2.dw_2.setitem( li_inserted, "field_datatype", 'S' )
				tab_1.tabpage_2.dw_2.setitem( li_inserted, "field_screen", data )
				if of_check_filed_exist(ls_table_name,'compute_1') < 1 then
					tab_1.tabpage_2.dw_2.setitem( li_inserted, "desc", "This column already exists in the export painter" )
					tab_1.tabpage_2.dw_2.setitem( li_inserted, "is_exist", "1" )
					tab_1.tabpage_2.dw_2.setitem( li_inserted, "is_select", "1" )
				end if
				ll_find = dw_select_field.find("export_field_name = 'compute_1' and field_screen = '"+data+"'",1,dw_select_field.rowcount())
				if isnull(ll_find) then ll_find = 0
				if ll_find > 0 then
					tab_1.tabpage_2.dw_2.setitem( li_inserted, "is_select", "1" )
				end if
				
				li_inserted = tab_1.tabpage_2.dw_2.insertrow( 0 )
				tab_1.tabpage_2.dw_2.setitem( li_inserted, "field_name", 'contact_id' )
				tab_1.tabpage_2.dw_2.setitem( li_inserted, "field_name_alias", 'Contact ID' )
				tab_1.tabpage_2.dw_2.setitem( li_inserted, "field_datatype", 'N' )
				tab_1.tabpage_2.dw_2.setitem( li_inserted, "field_screen", data )
				if of_check_filed_exist(ls_table_name,'contact_id') < 1 then
					tab_1.tabpage_2.dw_2.setitem( li_inserted, "desc", "This column already exists in the export painter" )
					tab_1.tabpage_2.dw_2.setitem( li_inserted, "is_exist", "1" )
					tab_1.tabpage_2.dw_2.setitem( li_inserted, "is_select", "1" )
				end if
				ll_find = dw_select_field.find("export_field_name = 'contact_id' and field_screen = '"+data+"'",1,dw_select_field.rowcount())
				if isnull(ll_find) then ll_find = 0
				if ll_find > 0 then
					tab_1.tabpage_2.dw_2.setitem( li_inserted, "is_select", "1" )
				end if
			
				li_inserted = tab_1.tabpage_2.dw_2.insertrow( 0 )
				tab_1.tabpage_2.dw_2.setitem( li_inserted, "field_name", 'Facility_id' )
				tab_1.tabpage_2.dw_2.setitem( li_inserted, "field_name_alias", 'Company ID' )
				tab_1.tabpage_2.dw_2.setitem( li_inserted, "field_datatype", 'N' )
				tab_1.tabpage_2.dw_2.setitem( li_inserted, "field_screen", data )
				tab_1.tabpage_2.dw_2.SetItem( li_inserted, "field_type", 'P' )
				if of_check_filed_exist(ls_table_name,'Facility_id') < 1 then
					tab_1.tabpage_2.dw_2.setitem( li_inserted, "desc", "This column already exists in the export painter" )
					tab_1.tabpage_2.dw_2.setitem( li_inserted, "is_exist", "1" )
					tab_1.tabpage_2.dw_2.setitem( li_inserted, "is_select", "1" )
				end if
				ll_find = dw_select_field.find("export_field_name = 'Facility_id' and field_screen = '"+data+"'",1,dw_select_field.rowcount())
				if isnull(ll_find) then ll_find = 0
				if ll_find > 0 then
					tab_1.tabpage_2.dw_2.setitem( li_inserted, "is_select", "1" )
				end if
			end if
//			//end add
			
//		end if
		
	
end if





end subroutine

public subroutine of_add_ctx_scrn_data (long row, integer ai_screen, long field_row);boolean lb_ctx_id_existed
string ls_export_fields_web_visible,ls_null
string ls_dataobject,ls_table_name,ls_type_filter
long ll_find
integer li_null
datawindowchild dwchild

ll_find = tab_1.tabpage_1.dw_1.find("screen_id = "+string(ai_screen)+"",1,tab_1.tabpage_1.dw_1.rowcount())
if ll_find > 0 then
	ls_dataobject = tab_1.tabpage_1.dw_1.getitemstring(ll_find,"dataobject")
	ls_table_name = tab_1.tabpage_1.dw_1.getitemstring(ll_find,"table_name")
end if
dw_detail.setitem(row,"intcred_record_number",1)
dw_detail.SetItem( row, "export_fields_ctx_scrn_dataobject", ls_dataobject )
dw_detail.SetItem( row, "export_fields_ctx_table_name", ls_table_name )	
	
setnull( ls_null )


of_generate_dddw( "export_fields_ctx_scrn_id", string( ai_screen ), row, lb_ctx_id_existed )

dw_detail.setitem(row,"lookup_field_style",ls_Null)			//Added By Mark Lee 10/16/2013	
dw_detail.setitem(row,"lookup_code",ls_Null)			//Added By Mark Lee 10/16/2013		
dw_detail.SetItem( row, "lu_field_name", ls_null )	
dw_detail.SetItem( row,"filter_query",ls_null)												//Added By Mark Lee 02/01/2013

If ai_screen = 2003 Then lb_ctx_id_existed = True
if lb_ctx_id_existed then
	dw_detail.SetItem( row, "export_fields_ctx_uselink", 0 )
else
	dw_detail.SetItem( row, "export_fields_ctx_uselink", 1 )
end if

	
if ai_screen = 12 then  //Set Default link for Profile detail -- 06.25.2009 by jervis
	dw_detail.SetItem(row,"export_fields_ctx_linkfromcolumn","ctx_req_profile_hdr_id")
	dw_detail.SetItem(row,"export_fields_ctx_linktoscrnid",11)
	if isvalid(w_export_painter) then w_export_painter.of_ctx_generate_linktocolumn("export_fields_ctx_linktoscrnid", "11", row )
	dw_detail.SetItem(row,"export_fields_ctx_linktocolumn","ctx_req_profile_hdr_id")
	dw_detail.SetItem(row,"export_fields_ctx_column_name","data_value")	//jervis 08.31.2009 - from john request.
elseif ai_screen = 2001 or ai_screen = 2002 then//Set Default link for contact detail and contact number - jervis 03.30.2011
	dw_detail.SetItem(row,"export_fields_ctx_linkfromcolumn","contact_id")
	dw_detail.SetItem(row,"export_fields_ctx_linktoscrnid",7)
	if isvalid(w_export_painter) then w_export_painter.of_ctx_generate_linktocolumn("export_fields_ctx_linktoscrnid", "7", row )
	dw_detail.SetItem(row,"export_fields_ctx_linktocolumn","contact_id")
else
	setnull( li_null )
	dw_detail.SetItem( row, "export_fields_ctx_linkfromcolumn", ls_null )
	dw_detail.SetItem( row, "export_fields_ctx_linktoscrnid", li_null )
	dw_detail.SetItem( row, "export_fields_ctx_linktocolumn", ls_null )
end if

	//--------------------------- APPEON BEGIN ---------------------------
	//$<add> 03.20.2007 By: Jack (Export)
	//$<reason> Fix a defect.
If dw_detail.getitemstring(row,'export_field_name') = 'company_id' Then
	dw_detail.getchild("export_fields_ctx_column_name",dwchild)
	ll_find = dwchild.find("field_name = 'app_facility'",1,dwchild.rowcount())
	If ll_find > 0 Then
			dwchild.setitem(ll_find,'field_name_alias','Company ID')
		End If
	End If
	//---------------------------- APPEON END ----------------------------	

	//Set Default Filter Value For Location Facility--jervis 06.11.2009
	if ai_screen = 19 then		//Location Facility Screen
		ls_type_filter = dw_detail.GetItemString(row,"filter_query")
		if ls_type_filter = "" or isnull(ls_type_filter) then
			dw_detail.SetItem( row,"filter_query","ctx_loc.loc_id <> 0")
		end if
	end if
	if ai_screen = 18 then	//Parent Organization screen
		ls_type_filter = dw_detail.GetItemString(row,"filter_query")
		if ls_type_filter = "" or isnull(ls_type_filter) then
			dw_detail.SetItem( row,"filter_query","ctx_loc.loc_id = 0")
		end if
	end if

end subroutine

public subroutine of_add_constant_data (long field_row);Integer li_nr,i
Long ll_rec_id,ll_order,ll_screen,ll_row,ll_fld_cnt,ll_get_row
string ls_field_name

ll_screen = long(tab_1.tabpage_2.dw_2.getitemstring(field_row,"field_screen"))
ls_field_name = tab_1.tabpage_2.dw_2.getitemstring(field_row,"field_name")

if isvalid(w_export_painter) then
	il_insert_num++
//	dw_detail.reset()
	dw_detail.accepttext( )
	if is_action = 'add' then 
		ll_order = Long(dw_fld_list.describe("Evaluate('max(export_order)',0)"))
		if isnull(ll_order) then ll_order = 0
		if il_insert_num = 1 then
			ll_order = ll_order + 10 
		else
			ll_order = ll_order + 10 * il_insert_num
		end if
		li_nr = dw_detail.InsertRow( 1 )
	elseif is_action = 'ins' then
		li_nr = dw_detail.InsertRow( 1 )
		ll_get_row = dw_fld_list.GetRow( )
		If ll_get_row > 1 Then
			ll_order = dw_fld_list.Getitemnumber(ll_get_row,"export_order")
		Else
			ll_order = 1
		End If
		if il_insert_num > 1 then 
			ll_order = ll_order + (il_insert_num - 1)
		end if
	end if
	dw_detail.SetItem( li_nr, "export_order", ll_order )
	dw_detail.SetItem( li_nr, "export_fields_ctx_scrn_id",ll_screen)
	dw_detail.SetItem( li_nr, "export_fields_ctx_column_name",ls_field_name)
	dw_detail.SetItem( li_nr, "export_id", w_export_painter.il_export_id )
	dw_detail.SetItem( li_nr, "export_code",0 )
	dw_detail.SetItem( li_nr, "export_fixed","N" )
	dw_detail.SetItem( li_nr, "use_link", 0 )
	dw_detail.SetItem( li_nr, "use_default", 0 )
	dw_detail.SetItem( li_nr, "export_field_length", 50 )
	dw_detail.SetItem( li_nr, "export_fields_export_type", 1 )
	dw_detail.SetItem( li_nr,'record_level','C')	
	dw_detail.SetItem( li_nr, "intcred_record_number", 1 )
	dw_detail.SetItem( li_nr, "billing_link", 0 )
	dw_detail.SetItem( li_nr, "export_fields_module_type", il_export_type )
else
	return
end if

of_add_ctx_scrn_data(li_nr,ll_screen,field_row)
of_add_ctx_column_data(li_nr,ls_field_name,field_row)


end subroutine

public subroutine of_add_ctx_column_data (integer row, string as_colname, long field_row);string ls_null,ls_field,ls_datatype,ls_dddwtype,ls_lu_name,ls_format,ls_field_name_alias,ls_export_name,ls_web_visible,ls_column,ls_table
long ll_find,li_row
pfc_n_cst_ai_export_apb  ln_export_apb

setnull( ls_null )
dw_detail.SetItem( row, 'lu_field_name', ''  )
dw_detail.SetItem( row, 'lookup_code', ls_null )			//Added By Mark Lee 10/15/2013
dw_detail.SetItem( row, "lookup_field_style",ls_null)			//Added By Mark Lee 10/16/2013				
of_column_check( as_colname, row,field_row )

w_export_painter.of_set_lookup_dddw()	
	
ls_field = as_colname
if isnull(ls_field) then ls_field = ''
ll_find = tab_1.tabpage_2.dw_2.find("field_name = '" + ls_field +"'",1,tab_1.tabpage_2.dw_2.rowcount())
If ll_find > 0 Then
	ls_DataType = tab_1.tabpage_2.dw_2.GetItemString(ll_find,"field_datatype")
	ls_dddwtype = tab_1.tabpage_2.dw_2.GetItemString(ll_find,"field_type")	//jervis 09.06.2010
	dw_detail.setitem(row,'ctx_column_datatype',ls_DataType)
	if ls_dddwtype = 'C' then
		ls_lu_name = tab_1.tabpage_2.dw_2.GetItemString(ll_find,"field_display_name")
		dw_detail.SetItem( row, "lu_field_name", ls_lu_name)
	end if
			
	ls_format = dw_detail.GetItemString( row, "Export_format")
	if  ls_format = "None" or ls_format = "" or isnull(ls_format) then
		ls_format = tab_1.tabpage_2.dw_2.GetItemString(ll_find,"field_format")
		if not isnull(ls_format) and ls_format <> "" and ls_format <> '[general]' then
			dw_detail.SetItem( row,"export_format",ls_format)
		end if
	end if
	//Begin - Added By Mark Lee 07/22/2013.
	ls_field_name_alias = tab_1.tabpage_2.dw_2.GetItemString(ll_find,"field_name_alias")
	dw_detail.SetItem( row, 'export_fields_data_view_label',ls_field_name_alias)
	//End - Added By Mark Lee 07/22/2013.
			 
	//Init Export Field Name - jervis 09.06.2010
	ls_export_name = dw_detail.GetItemString( row, "Export_Field_name")
	if ls_export_name = "" or isnull(ls_export_name) then
		ls_export_name = w_export_painter.of_build_alias_mulrow(tab_1.tabpage_2.dw_2.GetItemString(ll_find,"field_name_alias"))
		if ls_export_name <> "" then 
			if len(ls_export_name) >40 then ls_export_name = left(ls_export_name,40)							//Added By Mark Lee 04/15/2015
			dw_detail.SetItem( row, "Export_Field_name",ls_export_name)
			li_row = ids_field_name.insertrow(0)
			ids_field_name.setitem(li_row,'export_field_name',ls_export_name)
		end if
	end if
	
	//Added By Jay Chen 01-23-2016
	string ls_display_field,ls_lookup_field_style,ls_lookup_code
	if dw_detail.GetItemNumber(row,"export_fields_ctx_scrn_id") = 2003 and left(lower(ls_field),7)='custom_' then //app_facility custom
		select field_dddw_display_column,field_style,field_dddw_namedesc into :ls_display_field,:ls_lookup_field_style,:ls_lookup_code from ctx_contact_custom_config where field_falg='C' AND field_name=:ls_field;
		if isnull(ls_display_field) then ls_display_field = ''
		if ls_lookup_field_style = 'Code Lookup' then
			ls_lookup_field_style = 'C'
		elseif ls_lookup_field_style = 'Company' then
			ls_lookup_field_style = 'P'
		elseif ls_lookup_field_style = 'User' then
			ls_lookup_field_style = 'U'
		end if
		if ls_display_field <> '' then
			dw_detail.SetItem( row, 'export_fields_ctx_lookup_type','C')
			dw_detail.SetItem( row, "lu_field_name", ls_display_field)
			dw_detail.SetItem( row, 'lookup_field_style',ls_lookup_field_style)
			dw_detail.SetItem( row, 'lookup_code',ls_lookup_code)
		end if
	end if
	if dw_detail.GetItemNumber(row,"export_fields_ctx_scrn_id") = 2001 and left(lower(ls_field),7)='custom_' then //ctx_contacts custom
		select field_dddw_display_column,field_style,field_dddw_namedesc into :ls_display_field,:ls_lookup_field_style,:ls_lookup_code from ctx_contact_custom_config where field_falg='P' AND field_name=:ls_field;
		if isnull(ls_display_field) then ls_display_field = ''
		if ls_lookup_field_style = 'Code Lookup' then
			ls_lookup_field_style = 'C'
		elseif ls_lookup_field_style = 'Company' then
			ls_lookup_field_style = 'P'
		elseif ls_lookup_field_style = 'User' then
			ls_lookup_field_style = 'U'
		end if
		if ls_display_field <> '' then
			dw_detail.SetItem( row, 'export_fields_ctx_lookup_type','C')
			dw_detail.SetItem( row, "lu_field_name", ls_display_field)
			dw_detail.SetItem( row, 'lookup_field_style',ls_lookup_field_style)
			dw_detail.SetItem( row, 'lookup_code',ls_lookup_code)
		end if
	end if
	//end
			
End If

	
//Begin - Added By Mark Lee 09/23/2013.
ls_web_visible = dw_detail.GetItemString(row,"export_fields_web_visible")
if not isnull(ls_web_visible) and ls_web_visible = '1' then 
	ls_column = dw_detail.GetItemString(row,"export_fields_ctx_column_name")
	ls_table = dw_detail.GetItemString(row,"export_fields_ctx_table_name")			

	if not isvalid(ln_export_apb ) then ln_export_apb = Create pfc_n_cst_ai_export_apb
	if ln_export_apb.of_exists_export_table(ls_table) = false then 
		dw_detail.SetItem( row, "export_fields_web_visible", '0')	
		Destroy ln_export_apb	
		return 
	end if
	Destroy ln_export_apb	
		
	if (lower(trim(ls_column)) ='category_name' ) and lower(trim(ls_table)) ='ctx_elements'	then
		dw_detail.SetItem( row, "export_fields_web_visible", '0')
	elseif not isnull(ls_column) and not isnull(ls_table) and ls_table ='ctx_basic_info' and ls_column = 'ctx_id' then
		dw_detail.SetItem( row, "export_fields_web_visible", '0')
	elseif not isnull(ls_column) and not isnull(ls_table) and ls_table ='ctx_contacts' and (ls_column = 'contact_id' or ls_column = 'user_d') then					//Added By Mark Lee 05/25/2015
		dw_detail.SetItem( row, "export_fields_web_visible", '0')
	elseif not isnull(ls_column) and not isnull(ls_table) and ls_table ='ctx_contacts_numbers' and (ls_column = 'contact_id' or ls_column = 'contact_num_id' or ls_column = 'record_id' or ls_column = 'via') then
		dw_detail.SetItem( row, "export_fields_web_visible", '0')			
	else
		Select count(1)
		Into :ll_find
		From syscolumns , systypes 
		Where syscolumns.xtype = systypes.xtype and object_name(syscolumns.id) = :ls_table and syscolumns.name = :ls_column 
		using sqlca;
		if ll_find = 0 then 
				dw_detail.SetItem( row, "export_fields_web_visible", '0')
		//		Messagebox(gnv_app.iapp_object.DisplayName,"The Contract Logix Field is compute column, it cannot be visible in Request Form Painter. ")
		end if
	end if 
end if 
//End - Added By Mark Lee 09/23/2013.
	
end subroutine

public subroutine of_column_check (string data, integer row, long field_row);//--------------------------- APPEON BEGIN ---------------------------
//$<add> 2006-11-29 By: Rodger Wu (doc painter)
//$<reason> New event.

datastore lds_dataobject
string ls_dataobject, ls_temp,ls_field_screen
char lc_null
long ll_find
string ls_tag, ls_dddw_name
datawindow ldw_screen
if isvalid(w_export_painter) then
	ldw_screen = w_export_painter.dw_screen
else
	return
end if

SetNull( lc_null )

//ls_field_screen = tab_1.tabpage_2.dw_2.getitemstring(field_row,"field_screen")
//ll_find = tab_1.tabpage_1.dw_1.find("screen_id = "+long(ls_field_screen)+"", 1, tab_1.tabpage_1.dw_1.rowcount())

ls_dataobject = dw_detail.GetItemString( row, "export_fields_ctx_scrn_dataobject" )
//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 03.20.2007 By: Jack (Export)
//$<reason> Fix a defect.
/*
lds_dataobject = create datastore
lds_dataobject.dataobject = ls_dataobject
ls_temp = lower( lds_dataobject.Describe( data + ".dddw.datacolumn" ) )
*/
//If ls_dataobject = 'd_contract_det_contact_external' And data = 'contact_id' Then
//Modified by Nova on 2008-08-22
If ( ls_dataobject = 'd_contract_det_contact_external' or ls_dataobject = 'd_contract_det_contact_contact' or ls_dataobject = 'd_contract_det_contact_contact_notes') And data = 'contact_id' Then
	ls_temp = 'contact_id'
//Add by jervis 03.16.2009
//Export Requirements Profile data
elseif ls_dataobject = 'd_profile_header' and data = 'ctx_req_profile_id' then
	ls_temp = data
//Add by Jervis 06.09.2009
elseif ls_dataobject = 'd_contract_group_linked_locations' and data = 'loc_id' then
	ls_temp = data
elseif ls_dataobject = "d_contract_multi_group_browse" and data = "parent_comp_id" then
	ls_temp = data
Else
	ls_temp = data
	if isnull(ls_temp) then ls_temp = ''
	ll_find = tab_1.tabpage_2.dw_2.find("field_name = '" + ls_temp +"'",1,tab_1.tabpage_2.dw_2.rowcount())
	If ll_find > 0 Then ls_temp = tab_1.tabpage_2.dw_2.GetItemString(ll_find,"field_type")
End If
//---------------------------- APPEON END ----------------------------
if ls_temp = '?' or ls_temp = '!' then
	dw_detail.SetItem( row, "export_fields_ctx_lookup_type", lc_null )
	dw_detail.SetItem( row, "lu_field_name", lc_null )
elseif ls_temp = "lookup_code" or ls_temp = "C" then
	dw_detail.SetItem( row, "export_fields_ctx_lookup_type", 'C' )
elseif ls_temp = "P" then	//Company dddw -- jervis 12.9.2009
	dw_detail.SetItem( row, "export_fields_ctx_lookup_type", 'P' )
elseif ls_temp = 'facility_id' and dw_detail.getitemstring(row,'export_field_name') = 'company_id' Then
	dw_detail.SetItem( row, "export_fields_ctx_lookup_type", 'C' )
elseif ls_temp = 'contact_id' Then
	dw_detail.SetItem( row, "export_fields_ctx_lookup_type", 'C' )
elseif ls_temp = 'ctx_req_profile_id' then	//Jervis 03.16.2009
	dw_detail.SetItem( row, "export_fields_ctx_lookup_type", 'R' )
elseif ls_temp = "loc_id" then
	dw_detail.SetItem( row, "export_fields_ctx_lookup_type", 'L' ) // Jervis 06.09.2009
elseif ls_temp = "parent_comp_id" then	//06.23.2009 by jervis
	dw_detail.SetItem( row, "export_fields_ctx_lookup_type", 'M' ) 			
else
	dw_detail.SetItem( row, "export_fields_ctx_lookup_type", lc_null )	
	dw_detail.SetItem( row, "lu_field_name", lc_null )
//---------------------------- APPEON END ----------------------------
end if

//Begin - Added By Mark Lee 10/16/2013
if ls_temp = '?' or ls_temp = '!' then
	dw_detail.Setitem(row,"lookup_field_style",lc_null)			//Added By Mark Lee 10/16/2013				
	dw_detail.Setitem(row,"lookup_code",lc_null)			//Added By Mark Lee 10/16/2013		
else
	if isvalid(ldw_screen) then 
		ls_dddw_name = ldw_screen.describe( data+".dddw.name")
		if not (isnull(ls_dddw_name) or ls_dddw_name = '?' or ls_dddw_name = '!' or trim(ls_dddw_name) = '' ) then
			ls_tag = ldw_screen.describe( data+".tag")
			if isnull(ls_tag) or ls_tag = '?' or ls_tag = '!' or trim(ls_tag) = '' then
				if string(data ) = "app_facility" and  ls_dddw_name = "dddw_contact_company_new" then 
					dw_detail.SetItem( row, "lu_field_name", "facility_name" )						//data value is facility_id. 
					dw_detail.SetItem( row, 'lookup_code', ""  )				
					dw_detail.Setitem(row,"lookup_field_style",'P')			
				elseif ls_dddw_name = "d_dddw_users" then
					dw_detail.SetItem( row, "lu_field_name", "user_id" )	
					dw_detail.SetItem( row, 'lookup_code', ""  )				
					dw_detail.Setitem(row,"lookup_field_style",'U')		
				elseif ls_dddw_name = "d_code_lookup_country" and ls_dataobject = "d_facility_detail" and string(data ) = "country" then
					dw_detail.SetItem( row, 'lookup_code', "Country"  )				
					dw_detail.Setitem(row,"lookup_field_style",'C')		
				else
					dw_detail.Setitem(row,"lookup_field_style",lc_null)			
					dw_detail.SetItem( row, 'lookup_code', lc_null)				
				end if 
			else
				if len(ls_tag) = 1 and ls_dddw_name ="d_dddw_company_list" then 
					dw_detail.SetItem( row, 'lookup_code', ls_tag  )				
					dw_detail.Setitem(row,"lookup_field_style",'P')											//Added By Mark Lee 10/16/2013	default is code_lookup	
					dw_detail.SetItem( row, "lu_field_name", "facility_name" )	
				else
					dw_detail.SetItem( row, 'lookup_code', ls_tag  )				
					dw_detail.Setitem(row,"lookup_field_style",'C')											//Added By Mark Lee 10/16/2013	default is code_lookup	
				end if
			end if 
			
		end if 
		
		//Added By Jay Chen 03-05-2014
		if isnull(ls_dddw_name) or ls_dddw_name = '?' or ls_dddw_name = '!' or trim(ls_dddw_name) = '' then
			if lower(ls_dataobject) = 'd_contract_det_contact_external' then
				if lower(data) = 'contact_id' then dw_detail.SetItem( row, "lu_field_name", "contact_id" )	
				if lower(data) = 'facility_id' then dw_detail.SetItem( row, "lu_field_name", "facility_name" )	
			end if
			//Added By Jay Chen 06-24-2014 Remark: set location table field default value = 'Location Name' when select column loc_id
			if lower(ls_dataobject) = 'd_contract_group_linked_locations' then
				if lower(data) = 'loc_id' then dw_detail.SetItem( row, "lu_field_name", "street" )
			end if
			//end
		end if
		//end add
		
	end if 
end if 
//End - Added By Mark Lee 10/16/2013

end subroutine

public subroutine of_generate_dddw (string dwoname, string data, integer row, ref boolean ab_ctx_id_existed);//--------------------------- APPEON BEGIN ---------------------------
//$<add> 2006-11-28 By: Rodger Wu

//datawindow dw_screen
datawindowchild ldwc_ctxscrn, ldwc_fields, ldwc_linkfromcolumn
string ls_table, ls_colname, ls_dbname, ls_temp, ls_label, ls_dataobject
integer li_found, li_cols, i, li_inserted, li_getrow
String  ls_DataTypeTemp,ls_DataType//<add> andy 2007.05.23
string ls_dwsyntax
string ls_tab_name
datawindow ldw[]
string ls_dw_name[]
string ls_dataobjects[]
string ls_dddw_data
string ls_dddw_display
string ls_format
string ls_export_name, ls_table_name,	ls_export_fields_web_visible
pfc_n_cst_ai_export_apb  ln_export_apb

setnull(ls_table_name)
dw_detail.GetChild( dwoname, ldwc_ctxscrn )
li_found = ldwc_ctxscrn.Find( "screen_id = " + string( data ), 1, ldwc_ctxscrn.rowcount() )
if li_found > 0 then
	dw_detail.GetChild( "export_fields_ctx_column_name", ldwc_fields )
	dw_detail.GetChild( "export_fields_ctx_linkfromcolumn", ldwc_linkfromcolumn )
	ldwc_fields.SetFilter("field_screen = " + string(data))
	ldwc_fields.Filter( )
	ldwc_linkfromcolumn.SetFilter("field_screen = " + string(data))
	ldwc_linkfromcolumn.Filter( )
	
	if data = '12' then	//12-Exprot Profile Detail- jervis 03.17.2009
		ls_dataobject = 'd_export_contract_profile'
		ls_table_name	= 'ctx_elements'															//Added By Mark Lee 07/19/2013
	else
		ls_dataobject = ldwc_ctxscrn.GetItemString( li_found, "dataobject" )
		If dwoname = 'export_fields_ctx_scrn_id' Then 
			ls_table_name  = ldwc_ctxscrn.GetItemString( li_found, "table_name" )			//Added By Mark Lee 07/19/2013
		End IF 
	end if
	
	if row > 0 then
		dw_detail.SetItem( row, "export_fields_ctx_scrn_dataobject", ls_dataobject )
		If dwoname = 'export_fields_ctx_scrn_id' Then 
			dw_detail.SetItem( row, "export_fields_ctx_table_name", ls_table_name )				//Added By Mark Lee 07/19/2013
			ls_export_fields_web_visible = dw_detail.GetItemString(row,'export_fields_web_visible')
			if not isnull(ls_export_fields_web_visible) and ls_export_fields_web_visible = '1' then 
				if not isvalid(ln_export_apb ) then ln_export_apb = Create pfc_n_cst_ai_export_apb
				if ln_export_apb.of_exists_export_table(ls_table_name) = false then 
					dw_detail.SetItem( row, "export_fields_web_visible", '0' )	
				end if 
				Destroy ln_export_apb
			end if 			
		End IF 
	end if
		
	if ldwc_fields.RowCount() < 1 then   
		dw_screen.dataobject = ls_dataobject
		
//		If ls_dataobject = 'd_contract_det_contact_external' Then //Modified By Jay Chen 10-28-2015
			/*****************************
			li_inserted = ldwc_fields.insertrow( 0 )
			ldwc_fields.setitem( li_inserted, "field_name", 'compute_1' )
			ldwc_fields.setitem( li_inserted, "field_name_alias", 'Name' )
			//<add> andy 2007.06.04
			ldwc_fields.setitem( li_inserted, "field_datatype", 'S' )
			//end of add
			ldwc_fields.setitem( li_inserted, "field_screen", data )
			
			li_inserted = ldwc_linkfromcolumn.insertrow( 0 )
			ldwc_linkfromcolumn.setitem( li_inserted, "field_name", 'compute_1' )
			ldwc_linkfromcolumn.setitem( li_inserted, "field_name_alias", 'Name' )
			ldwc_linkfromcolumn.setitem( li_inserted, "field_screen", data )
			
			li_inserted = ldwc_fields.insertrow( 0 )
			ldwc_fields.setitem( li_inserted, "field_name", 'contact_phone' )
			ldwc_fields.setitem( li_inserted, "field_name_alias", 'Contact Phone' )
			//<add> andy 2007.06.04
			ldwc_fields.setitem( li_inserted, "field_datatype", 'S' )
			//end of add
			ldwc_fields.setitem( li_inserted, "field_screen", data )
			
			li_inserted = ldwc_linkfromcolumn.insertrow( 0 )
			ldwc_linkfromcolumn.setitem( li_inserted, "field_name", 'contact_phone' )
			ldwc_linkfromcolumn.setitem( li_inserted, "field_name_alias", 'Contact Phone' )
			ldwc_linkfromcolumn.setitem( li_inserted, "field_screen", data )
			
			li_inserted = ldwc_fields.insertrow( 0 )
			ldwc_fields.setitem( li_inserted, "field_name", 'contact_email' )
			ldwc_fields.setitem( li_inserted, "field_name_alias", 'Contact Email' )
			//<add> andy 2007.06.04
			ldwc_fields.setitem( li_inserted, "field_datatype", 'S' )
			//end of add
			ldwc_fields.setitem( li_inserted, "field_screen", data )
			
			li_inserted = ldwc_linkfromcolumn.insertrow( 0 )
			ldwc_linkfromcolumn.setitem( li_inserted, "field_name", 'contact_email' )
			ldwc_linkfromcolumn.setitem( li_inserted, "field_name_alias", 'Contact Email' )
			ldwc_linkfromcolumn.setitem( li_inserted, "field_screen", data )
			
			//Add contact_id and association -- jervis 01.28.2011
			li_inserted = ldwc_fields.insertrow( 0 )
			ldwc_fields.setitem( li_inserted, "field_name", 'contact_id' )
			ldwc_fields.setitem( li_inserted, "field_name_alias", 'Contact ID' )
			ldwc_fields.setitem( li_inserted, "field_datatype", 'N' )
			ldwc_fields.setitem( li_inserted, "field_screen", data )
			   
			 
			li_inserted = ldwc_fields.insertrow( 0 )
			ldwc_fields.setitem( li_inserted, "field_name", 'association' )
			ldwc_fields.setitem( li_inserted, "field_name_alias", 'Association' )
			ldwc_fields.setitem( li_inserted, "field_datatype", 'S' )
			ldwc_fields.setitem( li_inserted, "field_screen", data )
			ldwc_fields.SetItem( li_inserted, "field_type", 'C' )
			
			li_inserted = ldwc_fields.insertrow( 0 )
			ldwc_fields.setitem( li_inserted, "field_name", 'Facility_id' )
			ldwc_fields.setitem( li_inserted, "field_name_alias", 'Company ID' )
			ldwc_fields.setitem( li_inserted, "field_datatype", 'N' )
			ldwc_fields.setitem( li_inserted, "field_screen", data )
			ldwc_fields.SetItem( li_inserted, "field_type", 'P' )
					
			li_inserted = ldwc_fields.insertrow( 0 )
			ldwc_fields.setitem( li_inserted, "field_name", 'association2' )
			ldwc_fields.setitem( li_inserted, "field_name_alias", 'Association2' )
			ldwc_fields.setitem( li_inserted, "field_datatype", 'S' )
			ldwc_fields.setitem( li_inserted, "field_screen", data )
			ldwc_fields.SetItem( li_inserted, "field_type", 'C' )
			li_inserted = ldwc_fields.insertrow( 0 )
			ldwc_fields.setitem( li_inserted, "field_name", 'association3' )
			ldwc_fields.setitem( li_inserted, "field_name_alias", 'Association3' )
			ldwc_fields.setitem( li_inserted, "field_datatype", 'S' )
			ldwc_fields.setitem( li_inserted, "field_screen", data )
			ldwc_fields.SetItem( li_inserted, "field_type", 'C' )
			li_inserted = ldwc_fields.insertrow( 0 )
			ldwc_fields.setitem( li_inserted, "field_name", 'association4' )
			ldwc_fields.setitem( li_inserted, "field_name_alias", 'Association4' )
			ldwc_fields.setitem( li_inserted, "field_datatype", 'S' )
			ldwc_fields.setitem( li_inserted, "field_screen", data )
			ldwc_fields.SetItem( li_inserted, "field_type", 'C' )
			li_inserted = ldwc_fields.insertrow( 0 )
			ldwc_fields.setitem( li_inserted, "field_name", 'association5' )
			ldwc_fields.setitem( li_inserted, "field_name_alias", 'Association5' )
			ldwc_fields.setitem( li_inserted, "field_datatype", 'S' )
			ldwc_fields.setitem( li_inserted, "field_screen", data )
			ldwc_fields.SetItem( li_inserted, "field_type", 'C' )
			li_inserted = ldwc_fields.insertrow( 0 )
			ldwc_fields.setitem( li_inserted, "field_name", 'association6' )
			ldwc_fields.setitem( li_inserted, "field_name_alias", 'Association6' )
			ldwc_fields.setitem( li_inserted, "field_datatype", 'S' )
			ldwc_fields.setitem( li_inserted, "field_screen", data )
			ldwc_fields.SetItem( li_inserted, "field_type", 'C' )
			li_inserted = ldwc_fields.insertrow( 0 )
			ldwc_fields.setitem( li_inserted, "field_name", 'association7' )
			ldwc_fields.setitem( li_inserted, "field_name_alias", 'Association7' )
			ldwc_fields.setitem( li_inserted, "field_datatype", 'S' )
			ldwc_fields.setitem( li_inserted, "field_screen", data )
			ldwc_fields.SetItem( li_inserted, "field_type", 'C' )
			li_inserted = ldwc_fields.insertrow( 0 )
			ldwc_fields.setitem( li_inserted, "field_name", 'association8' )
			ldwc_fields.setitem( li_inserted, "field_name_alias", 'Association8' )
			ldwc_fields.setitem( li_inserted, "field_datatype", 'S' )
			ldwc_fields.setitem( li_inserted, "field_screen", data )
			ldwc_fields.SetItem( li_inserted, "field_type", 'C' )
			li_inserted = ldwc_fields.insertrow( 0 )
			ldwc_fields.setitem( li_inserted, "field_name", 'association9' )
			ldwc_fields.setitem( li_inserted, "field_name_alias", 'Association9' )
			ldwc_fields.setitem( li_inserted, "field_datatype", 'S' )
			ldwc_fields.setitem( li_inserted, "field_screen", data )
			ldwc_fields.SetItem( li_inserted, "field_type", 'C' )
			li_inserted = ldwc_fields.insertrow( 0 )
			ldwc_fields.setitem( li_inserted, "field_name", 'association10' )
			ldwc_fields.setitem( li_inserted, "field_name_alias", 'Association10' )
			ldwc_fields.setitem( li_inserted, "field_datatype", 'S' )
			ldwc_fields.setitem( li_inserted, "field_screen", data )
			ldwc_fields.SetItem( li_inserted, "field_type", 'C' )
			****************************/
//		else
			//dw_screen = create u_dw		
			//Dynamic generate dddw base on view -- jervis 08.06.2009
			if data <> '12' and long(data) < 1000 then	
				ls_tab_name = gnv_data.of_get_table_name( long(data), 'C', 'tab_name')
		
				ldw[1] = dw_screen
				
				ls_dw_name[1] 		= gnv_data.of_get_table_name( long(data), 'C', 'dw_name')
				ls_dataobjects[1] 	= ls_dataobject //gnv_data.of_get_table_name( long(data), 'C', 'dataobject')
				
				f_create_contract_dw(il_view_id,ls_tab_name,ldw,ls_dw_name,ls_dataobjects)
				dw_screen.bringtotop = false
			end if
			
			ls_table = lower( dw_screen.Describe( "Datawindow.table.updatetable" ) )
			li_cols = integer( dw_screen.Describe( "DataWindow.Column.Count" ) )
			
			If ls_dataobject = 'd_org_search2' And ls_Table = 'ctx_orgs_contact' Then ls_Table = 'ctx_orgs' //added by gavins 20130314

			for i = 1 to li_cols
				if dw_screen.Describe("#"+string( i ) + ".visible") = "0" then 
					if data <> "2002" then continue //Jervis 09.19.2010
				end if
				ls_dbname = lower( dw_screen.Describe("#"+string( i ) + ".dbname") )
				if pos(ls_dbname,".") > 0 then	//If Exists Table selection- jervis 03.17.2009
					ls_temp = f_get_token( ls_dbname, '.' )
				end if
				
		
				ls_colname = lower( dw_screen.Describe("#"+string( i ) + ".name") )
				ls_label = dw_screen.Describe( ls_colname + "_t.text")
				if ls_label = "?" or ls_label = "!" then ls_label = ""
				if ls_label = '' then ls_label = ls_dbname
				
				//Modified By Ken.Guo 2017-07-10. check editmask. use editmask first.
				If  dw_screen.Describe("#"+string( i ) + ".edit.style") = 'editmask' Then
					ls_format = dw_screen.Describe("#"+string( i ) + ".editmask.mask")
				Else
					ls_format = dw_screen.Describe("#"+string( i ) + ".format") //jervis 09.06.2010
				End If		
		
		
				//<add> andy 2007.05.23
				ls_DataType = ''
				ls_DataTypeTemp = lower( dw_screen.Describe("#"+string( i ) + ".ColType") )
				choose case left(ls_DataTypeTemp,5)
					case 'char('
						ls_DataType = 'S'
					case 'date','datet'
						ls_DataType = 'D'
					case 'decim','int','long','number','real','ulong'
						ls_DataType = 'N'
				end choose
				//end of add
				
				
				
				//if ls_temp = ls_table then
//				if ls_temp = ls_table  or data = '12' then	//12-Export Profile detail-jervis 03.17.2009
				if ls_temp = ls_table  or data = '12' or data = '56' or data = '6' or data = '7' then	 //Added By Jay Chen 10-28-2015 add screen =6 or 7
					li_inserted = ldwc_fields.insertrow( 0 )
					ldwc_fields.setitem( li_inserted, "field_name", ls_colname )
					//ldwc_fields.setitem( li_inserted, "field_name", ls_dbname )	//03.16.2009 by Jervis
					ldwc_fields.setitem( li_inserted, "field_name_alias", ls_label )
					//<add> andy 2007.05.23
					ldwc_fields.setitem( li_inserted, "field_datatype", ls_DataType )
					//end of add
					ldwc_fields.setitem( li_inserted, "field_screen", data )	//08.07.2009 by jervis
					
					li_inserted = ldwc_linkfromcolumn.insertrow( 0 )
					//ldwc_linkfromcolumn.setitem( li_inserted, "field_name", ls_colname )
					ldwc_linkfromcolumn.setitem( li_inserted, "field_name", ls_colname ) //03.16.2009 by Jervis
					ldwc_linkfromcolumn.setitem( li_inserted, "field_name_alias", ls_label )
					ldwc_linkfromcolumn.setitem( li_inserted, "field_screen", data )	//08.07.2009 by jervis
					
					//Add field format - jervis 09.06.2010
					if ls_format <> "" and ls_format <> "?" then
						ldwc_fields.setitem( li_inserted, "field_format", ls_format )
					end if
					
					//Get DDDW Type -- jervis 11.26.2009
					ls_dddw_data = lower( dw_screen.Describe( "#"+string( i ) + ".dddw.datacolumn" ) )
					if ls_dddw_data = 'lookup_code' then
						ldwc_fields.SetItem(li_inserted,"field_type","C")
						//Add display name = jervis 09.06.2010
						ls_dddw_display = lower( dw_screen.Describe( "#"+string( i ) + ".dddw.displaycolumn" ) )
						if ls_dddw_display = 'compute_code_number' or ls_dddw_display = 'compute_description_number' then ls_dddw_display = 'code' //Modified By Jay Chen 07-03-2015
						ldwc_fields.SetItem(li_inserted,"field_display_name",ls_dddw_display)
					//elseif ls_dddw_data = 'facility_id' and dw_screen.Describe("#"+string( i ) + ".dddw.name") = 'd_dddw_company' then
					elseif ls_dddw_data = 'facility_id' and (dw_screen.Describe("#"+string( i ) + ".dddw.name") = 'd_dddw_company' or dw_screen.Describe("#"+string( i ) + ".dddw.name") = 'd_dddw_company_list') then
						ldwc_fields.SetItem(li_inserted,"field_type","P")
					end if
					
				end if
		
				//if Not ab_ctx_id_existed then
				//	if lower( ls_dbname ) = "ctx_id" then ab_ctx_id_existed = true
				//end if	
			next
			//Added By Jay Chen 10-28-2015
			If ls_dataobject = 'd_contract_det_contact_external' Then
				li_inserted = ldwc_fields.insertrow( 0 )
				ldwc_fields.setitem( li_inserted, "field_name", 'compute_1' )
				ldwc_fields.setitem( li_inserted, "field_name_alias", 'Name' )
				ldwc_fields.setitem( li_inserted, "field_datatype", 'S' )
				ldwc_fields.setitem( li_inserted, "field_screen", data )
			
				li_inserted = ldwc_linkfromcolumn.insertrow( 0 )
				ldwc_linkfromcolumn.setitem( li_inserted, "field_name", 'compute_1' )
				ldwc_linkfromcolumn.setitem( li_inserted, "field_name_alias", 'Name' )
				ldwc_linkfromcolumn.setitem( li_inserted, "field_screen", data )
				
				li_inserted = ldwc_fields.insertrow( 0 )
				ldwc_fields.setitem( li_inserted, "field_name", 'contact_id' )
				ldwc_fields.setitem( li_inserted, "field_name_alias", 'Contact ID' )
				ldwc_fields.setitem( li_inserted, "field_datatype", 'N' )
				ldwc_fields.setitem( li_inserted, "field_screen", data )
				
				li_inserted = ldwc_fields.insertrow( 0 )
				ldwc_fields.setitem( li_inserted, "field_name", 'Facility_id' )
				ldwc_fields.setitem( li_inserted, "field_name_alias", 'Company ID' )
				ldwc_fields.setitem( li_inserted, "field_datatype", 'N' )
				ldwc_fields.setitem( li_inserted, "field_screen", data )
				ldwc_fields.SetItem( li_inserted, "field_type", 'P' )
			end if
			//end add
			
//		end if
		
		if len(dw_screen.Describe( "ctx_id.name")) > 1 then
			 ab_ctx_id_existed = true
		end if
		
		//Added By Jay Chen 03-11-2014 Remark: invisible link fields when select Document Manager->Document Tab->Document Browse
		if data = '56' then  ab_ctx_id_existed = true
		
	end if
	//Sort by field name
	ldwc_fields.Sort()
	ldwc_linkfromcolumn.Sort( )
end if
//---------------------------- APPEON END ----------------------------

//--------------------------- APPEON BEGIN ---------------------------
//$<Add> 08.23.2007 By: Evan
//$<Reason> Need to destroy object.
//if IsValid(dw_screen) then Destroy dw_screen
//---------------------------- APPEON END ----------------------------

end subroutine

public function integer of_check_filed_exist (string as_table, string as_colname);long ll_find

if isvalid(w_export_painter) then
	ll_find = w_export_painter.tab_1.tabpage_field_data.dw_fld_list.find("export_fields_ctx_table_name = '"+as_table+"' and export_fields_ctx_column_name = '"+as_colname+"' ",1,w_export_painter.tab_1.tabpage_field_data.dw_fld_list.rowcount())
	if ll_find > 0 then
		return -1
	else
		return 1
	end if
end if

return 1

end function

on w_auto_add_fields.create
this.progress_bar=create progress_bar
this.dw_select_field=create dw_select_field
this.dw_screen=create dw_screen
this.cb_ok=create cb_ok
this.tab_1=create tab_1
this.cb_cancel=create cb_cancel
this.Control[]={this.progress_bar,&
this.dw_select_field,&
this.dw_screen,&
this.cb_ok,&
this.tab_1,&
this.cb_cancel}
end on

on w_auto_add_fields.destroy
destroy(this.progress_bar)
destroy(this.dw_select_field)
destroy(this.dw_screen)
destroy(this.cb_ok)
destroy(this.tab_1)
destroy(this.cb_cancel)
end on

event open;long ll_view
string ls_value
datawindowchild ldwc

ls_value = message.stringparm
is_action = left(ls_value,3)
ll_view = long(right(ls_value,len(ls_value) - 3))
il_view_id = ll_view

if isvalid(w_export_painter) then
	if w_export_painter.tab_1.tabpage_export_hdr.dw_export_file.rowcount() > 0 then
		il_export_type = w_export_painter.tab_1.tabpage_export_hdr.dw_export_file.getitemnumber( 1, "export_type" )
		if not isnull( il_export_type ) and ( il_export_type = 3 or il_export_type = 4 ) then
			tab_1.tabpage_1.dw_1.dataobject = 'd_aoto_add_contract_screen2'
			tab_1.tabpage_2.dw_2.Modify("field_screen.dddw.name = 'd_aoto_add_contract_screen2'")
		else
			tab_1.tabpage_1.dw_1.dataobject = 'd_aoto_add_contract_screen'
		end if
	end if
end if

tab_1.tabpage_1.dw_1.settransobject(sqlca)
tab_1.tabpage_1.dw_1.retrieve(ll_view)

tab_1.tabpage_2.dw_2.getchild("field_screen",ldwc)
ldwc.settransobject(sqlca)
ldwc.retrieve(il_view_id)

gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17

end event

type progress_bar from u_progress within w_auto_add_fields
event destroy ( )
boolean visible = false
integer x = 9
integer y = 1984
integer width = 1655
integer height = 68
integer taborder = 120
borderstyle borderstyle = stylelowered!
end type

on progress_bar.destroy
call u_progress::destroy
end on

type dw_select_field from datawindow within w_auto_add_fields
boolean visible = false
integer x = 1339
integer y = 1992
integer width = 686
integer height = 400
integer taborder = 110
string title = "none"
string dataobject = "d_auto_fields_name_list"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_screen from u_dw within w_auto_add_fields
boolean visible = false
integer x = 983
integer y = 1712
integer width = 0
integer height = 0
integer taborder = 110
end type

type cb_ok from commandbutton within w_auto_add_fields
integer x = 1851
integer y = 1972
integer width = 352
integer height = 88
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "&OK"
boolean default = true
end type

event clicked;string ls_select,ls_exist,ls_alias
long ll_row,ll_fld_cnt,i,ll_get_row,li_row,ll_add_count,ll_current_index = 1
datawindow ldw_2
datawindowchild dwchild,ldwc_ctxscrn

ldw_2 = tab_1.tabpage_2.dw_2
if ldw_2.rowcount() < 1 then return

if isvalid(w_export_painter) then
	dw_detail = w_export_painter.tab_1.tabpage_field_data.dw_detail
	dw_fld_list = w_export_painter.tab_1.tabpage_field_data.dw_fld_list
	dw_detail.Reset()
	//Added By Jay Chen 03-05-2014
	dw_detail.GetChild( 'export_fields_ctx_scrn_id', ldwc_ctxscrn )
	ldwc_ctxscrn.reset()
	ldwc_ctxscrn.settransobject(sqlca)
	ldwc_ctxscrn.retrieve(il_view_id)
	w_export_painter.of_ctx_add_scrn()
	//end
	ids_field_name = create datastore
	ids_field_name.dataobject='d_auto_fields_name_list'
	ids_field_name.Reset()
	For ll_row = 1 To dw_fld_list.rowcount()
		ls_alias = dw_fld_list.getitemstring(ll_row,'export_field_name')
		if isnull(ls_alias) then continue
		li_row = ids_field_name.insertrow(0)
		if len(ls_alias) >40 then ls_alias = left(ls_alias,40)							//Added By Mark Lee 04/15/2015
		ids_field_name.setitem(li_row,'export_field_name',ls_alias)
	next
else
	return
end if

dw_detail.setredraw(false)
dw_detail.visible = false

if is_action = 'ins' then
	ll_fld_cnt = dw_fld_list.RowCount( )
	FOR ll_row = 1 TO ll_fld_cnt
		dw_fld_list.SetItem( ll_row, "export_order", ll_row)
	NEXT
	if w_export_painter.of_save(false) < 0 then return 
end if

//compute all waiting insert/add column count
for ll_row = 1 to ldw_2.rowcount( )
	ls_select = ldw_2.getitemstring(ll_row,"is_select")
	ls_exist = ldw_2.getitemstring(ll_row,"is_exist")
	if ls_exist = '1' then continue
	if ls_select = '1' then
		ll_add_count++
	end if
next

if ll_add_count > 0 then 
	progress_bar.visible = true
end if

for ll_row = 1 to ldw_2.rowcount( )
	ls_select = ldw_2.getitemstring(ll_row,"is_select")
	ls_exist = ldw_2.getitemstring(ll_row,"is_exist")
	if ls_exist = '1' then continue
	if ls_select = '1' then
		of_add_constant_data(ll_row)
		il_last_progress_position = 0.5 * (round(ll_current_index / ll_add_count,2)  * 100)
		progress_bar.uf_set_position (il_last_progress_position) //Added By Jay Chen 05-27-2014
		ll_current_index ++
	end if
next

if is_action = 'ins' then
	ll_fld_cnt = dw_fld_list.RowCount( )
	ll_get_row = dw_fld_list.GetRow( )
	FOR i = 1 TO ll_fld_cnt
		if i >= ll_get_row then
			dw_fld_list.SetItem( i, "export_order", i + il_insert_num)
		end if 
	END FOR
end if

w_export_painter.of_save_mulrow(false)
il_insert_num = 0

dw_detail.setredraw(true)
dw_detail.visible = true

if isvalid(w_export_painter) then
	dw_detail.Modify("export_field_name.protect='1'~texport_field_name.background.color='12632256'")
	dw_detail.SetColumn( "export_field_name" )
	dw_detail.SetFocus( )
end if

close(parent)
end event

type tab_1 from tab within w_auto_add_fields
integer y = 48
integer width = 2583
integer height = 1908
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
boolean boldselectedtext = true
integer selectedtab = 1
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.Control[]={this.tabpage_1,&
this.tabpage_2}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
end on

event selectionchanged;long ll_row,ll_select,ll_find,li_row
string ls_screen,ls_field_screen,ls_field_name,ls_select

if this.selectedtab = 2 then
	tab_1.tabpage_2.dw_2.setredraw(false)
	for ll_row = 1 to tab_1.tabpage_1.dw_1.rowcount()
		if ll_row = 1 then tab_1.tabpage_2.dw_2.reset()
		ll_select = tab_1.tabpage_1.dw_1.getitemnumber(ll_row,"ck")
		ls_screen = string( tab_1.tabpage_1.dw_1.getitemnumber(ll_row,"screen_id"))
		if ll_select = 1 then
			of_generate_field(ls_screen)
		end if
	next
	tab_1.tabpage_2.dw_2.GroupCalc()
	tab_1.tabpage_2.dw_2.setredraw(true)
	cb_ok.enabled = true
else
	for ll_row = 1 to tab_1.tabpage_2.dw_2.rowcount()
		ls_select = tab_1.tabpage_2.dw_2.getitemstring(ll_row,"is_select")
		ls_field_screen = tab_1.tabpage_2.dw_2.getitemstring(ll_row,"field_screen")
		ls_field_name = tab_1.tabpage_2.dw_2.getitemstring(ll_row,"field_name")
		if ls_select = '1' then
			ll_find = dw_select_field.find("export_field_name = '"+ls_field_name+"' and field_screen = '"+ls_field_screen+"' ",1,dw_select_field.rowcount())
			if isnull(ll_find) then ll_find = 0
			if ll_find < 1 then
				li_row = dw_select_field.insertrow(0)
				if len(ls_field_name) > 40 then ls_field_name = left(ls_field_name,40)							//Added By Mark Lee 04/15/2015
				dw_select_field.setitem(li_row,"export_field_name",ls_field_name)
				dw_select_field.setitem(li_row,"field_screen",ls_field_screen)
			end if
		end if
	next
	cb_ok.enabled = false
end if



end event

type tabpage_1 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 100
integer width = 2546
integer height = 1792
long backcolor = 67108864
string text = "Screen List"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_next cb_next
cb_select cb_select
dw_1 dw_1
end type

on tabpage_1.create
this.cb_next=create cb_next
this.cb_select=create cb_select
this.dw_1=create dw_1
this.Control[]={this.cb_next,&
this.cb_select,&
this.dw_1}
end on

on tabpage_1.destroy
destroy(this.cb_next)
destroy(this.cb_select)
destroy(this.dw_1)
end on

type cb_next from commandbutton within tabpage_1
integer x = 375
integer y = 1700
integer width = 352
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Next ->"
end type

event clicked;tab_1.selectedtab = 2
end event

type cb_select from commandbutton within tabpage_1
integer x = 14
integer y = 1700
integer width = 352
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Select All"
end type

event clicked;long i
If cb_select.text = '&Select All' Then
	cb_select.text = '&Deselect All'
	For i = 1 To tab_1.tabpage_1.dw_1.rowcount()
		tab_1.tabpage_1.dw_1.setitem(i,'ck',1)
   Next
Else
	cb_select.text = '&Select All'
	For i = 1 To tab_1.tabpage_1.dw_1.rowcount()
		tab_1.tabpage_1.dw_1.setitem(i,'ck',0)
   Next
End If

end event

type dw_1 from datawindow within tabpage_1
integer x = 9
integer y = 16
integer width = 2528
integer height = 1676
integer taborder = 20
string title = "none"
string dataobject = "d_aoto_add_contract_screen"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row < 1 then return

this.selectrow(0,false)
this.selectrow(row,true)
end event

type tabpage_2 from userobject within tab_1
integer x = 18
integer y = 100
integer width = 2546
integer height = 1792
long backcolor = 67108864
string text = "Field List"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_2 cb_2
cb_1 cb_1
dw_2 dw_2
end type

on tabpage_2.create
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_2=create dw_2
this.Control[]={this.cb_2,&
this.cb_1,&
this.dw_2}
end on

on tabpage_2.destroy
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_2)
end on

type cb_2 from commandbutton within tabpage_2
integer x = 370
integer y = 1700
integer width = 352
integer height = 92
integer taborder = 150
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "<- &Back"
end type

event clicked;tab_1.selectedtab = 1
end event

type cb_1 from commandbutton within tabpage_2
integer x = 9
integer y = 1700
integer width = 352
integer height = 92
integer taborder = 140
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Select All"
end type

event clicked;long i
string ls_exist

If tab_1.tabpage_2.cb_1.text = '&Select All' Then
	tab_1.tabpage_2.cb_1.text = '&Deselect All'
	For i = 1 To tab_1.tabpage_2.dw_2.rowcount()
		tab_1.tabpage_2.dw_2.setitem(i,'is_select','1')
   Next
Else
	tab_1.tabpage_2.cb_1.text = '&Select All'
	For i = 1 To tab_1.tabpage_2.dw_2.rowcount()
		ls_exist = tab_1.tabpage_2.dw_2.getitemstring(i,"is_exist")
		if ls_exist = '1' then continue
		tab_1.tabpage_2.dw_2.setitem(i,'is_select','0')
   Next
End If

end event

type dw_2 from datawindow within tabpage_2
integer x = 9
integer y = 16
integer width = 2528
integer height = 1676
integer taborder = 30
string title = "none"
string dataobject = "d_auto_add_fields_list"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row < 1 then return

this.selectrow(0,false)
this.selectrow(row,true)
end event

type cb_cancel from commandbutton within w_auto_add_fields
integer x = 2217
integer y = 1968
integer width = 352
integer height = 88
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Cancel"
boolean cancel = true
end type

event clicked;close(parent)

end event

