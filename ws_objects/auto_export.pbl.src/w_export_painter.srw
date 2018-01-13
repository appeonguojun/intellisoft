$PBExportHeader$w_export_painter.srw
forward
global type w_export_painter from w_sheet
end type
type cb_3 from commandbutton within w_export_painter
end type
type cb_batch_update from commandbutton within w_export_painter
end type
type sle_rep from singlelineedit within w_export_painter
end type
type sle_tc from singlelineedit within w_export_painter
end type
type sle_tt from singlelineedit within w_export_painter
end type
type cb_2 from commandbutton within w_export_painter
end type
type gb_1 from groupbox within w_export_painter
end type
type cb_new from u_cb within w_export_painter
end type
type cb_save from u_cb within w_export_painter
end type
type cb_quit from u_cb within w_export_painter
end type
type cb_auto from commandbutton within w_export_painter
end type
type cb_test from commandbutton within w_export_painter
end type
type cb_delete from u_cb within w_export_painter
end type
type cbx_open from checkbox within w_export_painter
end type
type dw_select from datawindow within w_export_painter
end type
type cbx_previewdata from checkbox within w_export_painter
end type
type st_field from statictext within w_export_painter
end type
type cbx_savedata from checkbox within w_export_painter
end type
type st_field1 from statictext within w_export_painter
end type
type tab_1 from tab within w_export_painter
end type
type tabpage_export_hdr from userobject within tab_1
end type
type dw_export_file from u_dw within tabpage_export_hdr
end type
type tabpage_export_hdr from userobject within tab_1
dw_export_file dw_export_file
end type
type tabpage_field_data from userobject within tab_1
end type
type dw_findcolumn from datawindow within tabpage_field_data
end type
type st_find from statictext within tabpage_field_data
end type
type cb_findcolumn from commandbutton within tabpage_field_data
end type
type cbx_autosave from checkbox within tabpage_field_data
end type
type dw_fld_list from u_dw within tabpage_field_data
end type
type dw_detail from u_dw within tabpage_field_data
end type
type cb_add from u_cb within tabpage_field_data
end type
type cb_delete_col from u_cb within tabpage_field_data
end type
type cb_insert from u_cb within tabpage_field_data
end type
type cb_1 from commandbutton within tabpage_field_data
end type
type cb_reorder from commandbutton within tabpage_field_data
end type
type cb_copy from commandbutton within tabpage_field_data
end type
type st_next from statictext within tabpage_field_data
end type
type cb_4 from commandbutton within tabpage_field_data
end type
type mle_1 from multilineedit within tabpage_field_data
end type
type st_1 from statictext within tabpage_field_data
end type
type st_vbar_export from u_st_splitbar within tabpage_field_data
end type
type cb_sync from commandbutton within tabpage_field_data
end type
type tabpage_field_data from userobject within tab_1
dw_findcolumn dw_findcolumn
st_find st_find
cb_findcolumn cb_findcolumn
cbx_autosave cbx_autosave
dw_fld_list dw_fld_list
dw_detail dw_detail
cb_add cb_add
cb_delete_col cb_delete_col
cb_insert cb_insert
cb_1 cb_1
cb_reorder cb_reorder
cb_copy cb_copy
st_next st_next
cb_4 cb_4
mle_1 mle_1
st_1 st_1
st_vbar_export st_vbar_export
cb_sync cb_sync
end type
type tab_1 from tab within w_export_painter
tabpage_export_hdr tabpage_export_hdr
tabpage_field_data tabpage_field_data
end type
type dw_screen from u_dw within w_export_painter
end type
end forward

global type w_export_painter from w_sheet
integer x = 0
integer y = 0
integer width = 4224
integer height = 2196
string title = "Export Painter"
windowstate windowstate = maximized!
long backcolor = 79680469
cb_3 cb_3
cb_batch_update cb_batch_update
sle_rep sle_rep
sle_tc sle_tc
sle_tt sle_tt
cb_2 cb_2
gb_1 gb_1
cb_new cb_new
cb_save cb_save
cb_quit cb_quit
cb_auto cb_auto
cb_test cb_test
cb_delete cb_delete
cbx_open cbx_open
dw_select dw_select
cbx_previewdata cbx_previewdata
st_field st_field
cbx_savedata cbx_savedata
st_field1 st_field1
tab_1 tab_1
dw_screen dw_screen
end type
global w_export_painter w_export_painter

type variables
Integer il_export_id
Integer il_table_id
integer testcnt
long il_recid
Boolean lb_insert = False

Boolean lb_new = False

//<add> andy 2007.06.04
Boolean ib_lockcol = True
//end of add

//==============================APPEON BEGIN==========================
// $<Added>:   Date: Nov 01,2007       Author:Nova
//--------------------------------------------------------------------
// $<reason>   Fix a defect.
int ii_win_width, ii_win_height, ii_win_frame_w, ii_win_frame_h
str_size size_ctrl [] 
long il_tabpage1
//Boolean variable to stop recursion
boolean ib_exec = false
//==============================APPEON END============================

long il_view_id 	//08.07.2009
boolean		ib_export_save = false 			//Added By Mark Lee 09/27/2013
long il_insert_row //Added By Jay Chen 03-03-2014

end variables

forward prototypes
public function long of_get_id ()
public subroutine of_ctx_add_scrn ()
public subroutine of_ctx_generate_linktocolumn (string dwoname, string data, integer row)
public subroutine of_set_lookup_dddw ()
public subroutine of_setui (long al_exporttype)
public function long of_check ()
public subroutine of_updatehistorydata ()
public function integer wf_size_it ()
public function integer wf_resize_it (double size_factor)
public function boolean of_field_name_check (string as_fieldname)
public subroutine of_set_dddw (ref datawindowchild dwchild, string as_dataobject)
public function string of_get_coltype (ref datastore ads_object, string as_name)
public function string of_build_alias (string as_label)
public subroutine wf_resize_tab ()
public function integer of_save (boolean abn_force)
public function integer of_create_export (boolean abn_update_sqltext)
public function integer of_save_mulrow (boolean abn_force)
public function string of_build_alias_mulrow (string as_label)
public subroutine of_reset_find_filed_name (long al_export_id)
end prototypes

public function long of_get_id ();long rec

select max(rec_id) into :rec from export_fields; 
if isnull(rec) then rec = 0  //Start Code Change ---- 06.06.2006 #515 maha  trap if no fields exist
rec++

return rec 
end function

public subroutine of_ctx_add_scrn ();//--------------------------- APPEON BEGIN ---------------------------
//$<add> 2006-12-13 By: Rodger Wu

datawindowchild ldwc_screen
integer li_inserted
Long ll_ctx_linkscrnid, li_found

tab_1.tabpage_field_data.dw_detail.GetChild( "export_fields_ctx_scrn_id", ldwc_screen )

li_found = ldwc_screen.Find( "screen_id = 2001", 1, ldwc_screen.rowcount() )
if li_found < 1 then
	li_inserted = ldwc_screen.insertrow( 0 )
	ldwc_screen.SetItem( li_inserted, "screen_name", "Contacts->Detail" )
	ldwc_screen.SetItem( li_inserted, "screen_id", 2001 )
	ldwc_screen.SetItem( li_inserted, "dataobject", "d_cntx_master" )
	ldwc_screen.SetItem( li_inserted, "table_name", "ctx_contacts" )			//Added By Mark Lee 10/15/2013
end if

li_found = ldwc_screen.Find( "screen_id = 2002", 1, ldwc_screen.rowcount() )
if li_found < 1 then
	li_inserted = ldwc_screen.insertrow( 0 )
	ldwc_screen.SetItem( li_inserted, "screen_name", "Contacts->Phone Numbers" )
	ldwc_screen.SetItem( li_inserted, "screen_id", 2002 )
	ldwc_screen.SetItem( li_inserted, "dataobject", "d_cntx_phone" )
	ldwc_screen.SetItem( li_inserted, "table_name", "ctx_contacts_numbers" )			//Added By Mark Lee 10/15/2013	
end if

li_found = ldwc_screen.Find( "screen_id = 2003", 1, ldwc_screen.rowcount() )
if li_found < 1 then
	li_inserted = ldwc_screen.insertrow( 0 )
	ldwc_screen.SetItem( li_inserted, "screen_name", "Company->Detail" )
	ldwc_screen.SetItem( li_inserted, "screen_id", 2003 )
	ldwc_screen.SetItem( li_inserted, "dataobject", "d_facility_detail" )
	ldwc_screen.SetItem( li_inserted, "table_name", "app_facility" )			//Added By Mark Lee 10/15/2013			
end if

//---------------------------- APPEON END ----------------------------

//Start Add by jervis 03.20.2009	
//Export Contract Status track data
li_found = ldwc_screen.Find( "screen_id = 2004", 1, ldwc_screen.rowcount() )
if li_found < 1 then
	li_inserted = ldwc_screen.insertrow( 0 )
	ldwc_screen.SetItem( li_inserted, "screen_name", "Contract Status Track" )
	ldwc_screen.SetItem( li_inserted, "screen_id", 2004 )
	ldwc_screen.SetItem( li_inserted, "dataobject", "d_export_status_track" )
	ldwc_screen.SetItem( li_inserted, "table_name", "sys_statusaudit" )			//Added By Mark Lee 10/15/2013				
end if
//End by jervis 03.20.2009

ldwc_screen.Sort( )

end subroutine

public subroutine of_ctx_generate_linktocolumn (string dwoname, string data, integer row);//--------------------------- APPEON BEGIN ---------------------------
//$<add> 2006-12-13 By: Rodger Wu (architecture)
datawindowchild ldwc_ctxscrn, ldwc_fields
string ls_table, ls_colname, ls_dbname, ls_temp, ls_label, ls_dataobject
integer li_found, li_cols, i, li_inserted, li_getrow
string ls_tab_name,ls_dw_name[]
datawindow ldw[]
string ls_dataobjects[]

tab_1.tabpage_field_data.dw_detail.GetChild( dwoname, ldwc_ctxscrn )
li_found = ldwc_ctxscrn.Find( "screen_id = " + string( data ), 1, ldwc_ctxscrn.rowcount() )
if li_found > 0 then
	tab_1.tabpage_field_data.dw_detail.GetChild( "export_fields_ctx_linktocolumn", ldwc_fields )
	ldwc_fields.SetFilter("field_screen = " + string(data))
	ldwc_fields.Filter( )
	ls_dataobject = ldwc_ctxscrn.GetItemString( li_found, "dataobject" )


	if row > 0 then
		tab_1.tabpage_field_data.dw_detail.SetItem( row, "export_fields_ctx_linktoscrndw", ls_dataobject )
	end if
	
	if ldwc_fields.RowCount() < 1 then   
		//dw_screen = create u_dw		
		//Dynamic generate dddw base on view -- jervis 08.06.2009
		dw_screen.dataobject = ls_dataobject
		if long(data) < 1000 then	
			ls_tab_name = gnv_data.of_get_table_name( long(data), 'C', 'tab_name')
	
			ldw[1] = dw_screen
			
			ls_dw_name[1] 		= gnv_data.of_get_table_name( long(data), 'C', 'dw_name')
			ls_dataobjects[1] 	= ls_dataobject //gnv_data.of_get_table_name( long(data), 'C', 'dataobject')
			
			f_create_contract_dw(il_view_id,ls_tab_name,ldw,ls_dw_name,ls_dataobjects)
		end if
		ls_table = lower( dw_screen.Describe( "Datawindow.table.updatetable" ) )
		li_cols = integer( dw_screen.Describe( "DataWindow.Column.Count" ) )


		for i = 1 to li_cols
			ls_dbname = lower( dw_screen.Describe("#"+string( i ) + ".dbname") )
			ls_temp = f_get_token( ls_dbname, '.' )
	
			ls_colname = lower( dw_screen.Describe("#"+string( i ) + ".name") )
			ls_label = dw_screen.Describe( ls_colname + "_t.text")
			if ls_label = "?" or ls_label = "!" then ls_label = ""
			if ls_label = '' then ls_label = ls_dbname
			
			if ls_temp = ls_table then
				li_inserted = ldwc_fields.insertrow( 0 )
				ldwc_fields.setitem( li_inserted, "field_name", ls_colname )
				ldwc_fields.setitem( li_inserted, "field_name_alias", ls_label )
				ldwc_fields.setitem( li_inserted, "field_screen", ls_colname )
			end if
		next
	end if
end if
//---------------------------- APPEON END ----------------------------

end subroutine

public subroutine of_set_lookup_dddw ();//////////////////////////////////////////////////////////////////////
// $<function>w_export_painterof_set_lookup_dddw()
// $<arguments>
//		value	integer		
// $<returns> (none)
// $<description>
// $<description>
//////////////////////////////////////////////////////////////////////
// $<add> 03.20.2007 by Jack (Export)
//////////////////////////////////////////////////////////////////////
string ls_ctx_column_name,ls_ctx_lookup_type
string ls_field_name[],	ls_field_name1,	ls_field_disply[]	,	ls_field_disply1
String ls_dataType[]	//<add> andy 2007.06.01
long i,ll_row,ll_find,ll_screen_id
string ls_style
datawindowchild dwchild
n_ds 									lds_cc_custom_fields_falg


tab_1.tabpage_field_data.dw_detail.accepttext()
ls_ctx_column_name = tab_1.tabpage_field_data.dw_detail.getitemstring(tab_1.tabpage_field_data.dw_detail.getrow(),'export_fields_ctx_column_name')
ls_ctx_lookup_type = tab_1.tabpage_field_data.dw_detail.getitemstring(tab_1.tabpage_field_data.dw_detail.getrow(),'export_fields_ctx_lookup_type')
ll_screen_id = tab_1.tabpage_field_data.dw_detail.getitemnumber(tab_1.tabpage_field_data.dw_detail.getrow(),'export_fields_ctx_scrn_id') //Added By Jay Chen 01-23-2016

//If ls_ctx_column_name = 'app_facility' And ls_ctx_lookup_type = 'C' Then
//Add Company dddw process-- jervis 12.9.2009
If (ls_ctx_column_name = 'app_facility' And ls_ctx_lookup_type = 'C') or ls_ctx_lookup_type = "P" Then
	tab_1.tabpage_field_data.dw_detail.modify("t_10.text = 'Company Table Field:'")
	tab_1.tabpage_field_data.dw_detail.getchild("lu_field_name",dwchild)

	dwchild.reset()
	ls_field_name[1] = 'facility_id'
	ls_field_name[2] = 'facility_name'
	ls_field_name[3] = 'contact_type2'
	ls_field_name[4] = 'status'
	ls_field_name[5] = 'street'
	ls_field_name[6] = 'street_2'
	ls_field_name[7] = 'street_3'
	ls_field_name[8] = 'city'
	ls_field_name[9] = 'state'
	ls_field_name[10] = 'zip'
	ls_field_name[11] = 'country'
	ls_field_name[12] = 'phone'
	ls_field_name[13] = 'ext'
	ls_field_name[14] = 'fax'
	ls_field_name[15] = 'corp_office_flag'
	ls_field_name[16] = 'contact'
	ls_field_name[17] = 'corp_office_link'
	ls_field_name[18] = 'web_address'
	ls_field_name[19] = 'email_address'
	
	//Added By Mark Lee 05/25/2016
	ls_field_disply[1] = 'Facility Id'
	ls_field_disply[2] = 'Company Name'
	ls_field_disply[3] = 'Company Category'
	ls_field_disply[4] = 'Status'
	ls_field_disply[5] = 'Street 1'
	ls_field_disply[6] = 'Street 2'
	ls_field_disply[7] = 'Street 3'
	ls_field_disply[8] = 'City'
	ls_field_disply[9] = 'State'
	ls_field_disply[10] = 'Zip'
	ls_field_disply[11] = 'Country'
	ls_field_disply[12] = 'Phone'
	ls_field_disply[13] = 'Ext'
	ls_field_disply[14] = 'Fax'
	ls_field_disply[15] = 'Corporate Office'
	ls_field_disply[16] = 'ID #'
	ls_field_disply[17] = 'Corp Office Link'
	ls_field_disply[18] = 'Web Address'
	ls_field_disply[19] = 'Email Address'

	//<add> andy 2007.06.01 
	//corresponding data type 
	ls_dataType[1]='N'
	ls_dataType[2]='S' 
	ls_dataType[3]='S'
	ls_dataType[4]='S'
	ls_dataType[5]='S'
	ls_dataType[6]='S'
	ls_dataType[7]='S'
	ls_dataType[8]='S'
	ls_dataType[9]='S'
	ls_dataType[10]='S'
	ls_dataType[11]='N'
	ls_dataType[12]='S'
	ls_dataType[13]='S'
	ls_dataType[14]='S'
	ls_dataType[15]='N'
	ls_dataType[16]='S'
	ls_dataType[17]='N'
	ls_dataType[18]='S'
	ls_dataType[19]='S'
	//end of add
	
	//Begin - Added By Mark Lee 05/25/2016.	13 --- 19 
	if not isvalid(lds_cc_custom_fields_falg) then 
		lds_cc_custom_fields_falg = Create n_ds
		lds_cc_custom_fields_falg.dataobject = 'd_contact_custom_configlist_field'
		lds_cc_custom_fields_falg.settransobject(sqlca)
	end if 
	lds_cc_custom_fields_falg.retrieve('C')
	
	for i = 1 to 10 
		ls_field_name1 = "custom_"+string(i)
		ls_field_name[upperbound(ls_field_name) + 1 ] = ls_field_name1
		ls_field_disply1 = ""
		if lds_cc_custom_fields_falg.rowcount() > 0 then 
			ll_find = lds_cc_custom_fields_falg.find(" field_name ='"+ls_field_name1+"' ", 1, lds_cc_custom_fields_falg.rowcount())	
			if ll_find > 0 then 
				ls_field_disply1 = lds_cc_custom_fields_falg.GetItemString(ll_find, 'field_label')
			end if 
		end if 
		
		If Not isnull(ls_field_disply1) and trim(ls_field_disply1) <> '' Then
			ls_field_disply[upperbound(ls_field_disply) +1 ] = ls_field_disply1
		else
			ls_field_disply[upperbound(ls_field_disply) +1 ] =  "Custom "+string(i)				
		end if 
		
		ls_dataType[upperbound(ls_dataType) + 1 ] = 'S'
	Next 
	destroy lds_cc_custom_fields_falg	
	//End - Added By Mark Lee 05/25/2016.
	
	For i = 1 To upperbound(ls_field_name)
		ll_row = dwchild.insertrow(0)
		ls_field_name1 = ls_field_name[i]
		ls_field_disply1 = ls_field_disply[i]
		dwchild.setitem(ll_row,'field_name',ls_field_name1)
//		dwchild.setitem(ll_row,'field_display',ls_field_name1) // jervis 06.09.2009
		dwchild.setitem(ll_row,'field_display',ls_field_disply1)						
		//<add> andy 2007.06.01 
      //save data type to dwchild
		dwchild.setitem(ll_row,'datatype',ls_dataType[i])
		//end of add
	Next
	tab_1.tabpage_field_data.dw_detail.getchild("export_fields_ctx_column_name",dwchild)
	ll_find = dwchild.find("field_name = 'app_facility'",1,dwchild.rowcount())
	If ll_find > 0 Then
		dwchild.setitem(ll_find,'field_name_alias','Company ID')
	End If
ElseIf ls_ctx_column_name = 'contact_id' And ls_ctx_lookup_type = 'C' Then
	tab_1.tabpage_field_data.dw_detail.modify("t_10.text = 'Contact Table Field:'")
	tab_1.tabpage_field_data.dw_detail.getchild("lu_field_name",dwchild)
	dwchild.reset()
	ls_field_name[1] = 'contact_id'
	ls_field_name[2] = 'first_name'
	ls_field_name[3] = 'last_name'
	ls_field_name[4] = 'middle_name'
	//--------------------------- APPEON BEGIN ---------------------------
	//$<modify> 05.29.2007 By: Jack
	//$<reason> Fix a defect.
	/*
	ls_field_name[5] = 'street_1'
	ls_field_name[6] = 'street_2'
	ls_field_name[7] = 'street_3'
	ls_field_name[8] = 'city'
	ls_field_name[9] = 'zip'
	ls_field_name[10] = 'user_d'
	*/
	ls_field_name[5] = 'contact_department'
	ls_field_name[6] = 'contact_title'
	ls_field_name[7] = 'contact_type'
	ls_field_name[8] = 'user_d'
	//Add by Jack 06/05/2007
	ls_field_name[9] = 'phone'
	ls_field_name[10] = 'ext'
	ls_field_name[11] = 'contact_email'
	
	//---------------------------- APPEON END ----------------------------
	
	//<add> andy 2007.06.01 
	ls_dataType[1]='N'
	ls_dataType[2]='S' 
	ls_dataType[3]='S'
	ls_dataType[4]='S'
	ls_dataType[5]='S'
	ls_dataType[6]='S'
	ls_dataType[7]='S'
	ls_dataType[8]='S'
	ls_dataType[9]='S'
	ls_dataType[10]='S'
	ls_dataType[11]='S'
	//end of add
	
	For i = 1 To upperbound(ls_field_name)
		ll_row = dwchild.insertrow(0)
		ls_field_name1 = ls_field_name[i]
		dwchild.setitem(ll_row,'field_name',ls_field_name1)
		dwchild.setitem(ll_row,'field_display',ls_field_name1) // jervis 06.09.2009
		//<add> andy 2007.06.01 
      //save data type to dwchild
		dwchild.setitem(ll_row,'datatype',ls_dataType[i])
		//end of add
	Next
//03.16.2009 by jervis 
//Export CTX Profile Table
elseif ls_ctx_column_name = 'ctx_req_profile_id' And ls_ctx_lookup_type = 'R' Then
	tab_1.tabpage_field_data.dw_detail.modify("t_10.text = 'Profile Table Field:'")
	tab_1.tabpage_field_data.dw_detail.getchild("lu_field_name",dwchild)
	dwchild.reset()
	
	ls_field_name[1] = 'rqmnt_name'
	ls_field_name[2] = 'rqmnt_description'
	ls_dataType[1]='S'
	ls_dataType[2]='S' 

	
	For i = 1 To upperbound(ls_field_name)
		ll_row = dwchild.insertrow(0)
		ls_field_name1 = ls_field_name[i]
		dwchild.setitem(ll_row,'field_name',ls_field_name1)
		dwchild.setitem(ll_row,'field_display',ls_field_name1) // jervis 06.09.2009
		dwchild.setitem(ll_row,'datatype',ls_dataType[i])
	Next
//--------------Start Code 06.09.2009 by jervis---------------
//Export Location
elseif ls_ctx_column_name = 'loc_id' and ls_ctx_lookup_type = "L" then
	tab_1.tabpage_field_data.dw_detail.modify("t_10.text = 'Location Table Field:'")
	tab_1.tabpage_field_data.dw_detail.getchild("lu_field_name",dwchild)
	dwchild.reset()
	of_Set_dddw(dwchild,"d_export_group_location")  // jervis 06.09.2009
//--------------End code---------------------------------------

//Export Parent Organization -- Jervis 06.23.2009
elseif ls_ctx_column_name = "parent_comp_id" and ls_ctx_lookup_type = "M" then
	tab_1.tabpage_field_data.dw_detail.modify("t_10.text = 'Parent Organization Field:'")
	tab_1.tabpage_field_data.dw_detail.getchild("lu_field_name",dwchild)
	dwchild.reset()
	of_Set_dddw(dwchild,"d_export_multi_group_location") 
elseif ll_screen_id = 2001 and left(lower(ls_ctx_column_name),7)='custom_' then  //Added By Jay Chen 01-23-2016 for ctx_contacts custom
	//reset dwchild
	tab_1.tabpage_field_data.dw_detail.getchild("lu_field_name",dwchild)
	dwchild.reset()
	select field_style into :ls_style from ctx_contact_custom_config where field_falg='P' AND field_name=:ls_ctx_column_name;
	if isnull(ls_style) then ls_style = ''
	if lower(ls_style) = 'company' then
		ls_field_name[1] = 'facility_id'
		ls_field_name[2] = 'facility_name'
		ls_field_name[3] = 'city'
		ls_field_name[4] = 'state'
		ls_field_name[5] = 'country'
		ls_field_name[6] = 'street'
		ls_field_name[7] = 'zip'
		ls_dataType[1]='N'
		ls_dataType[2]='S' 
		ls_dataType[3]='S'
		ls_dataType[4]='S'
		ls_dataType[5]='N'
		ls_dataType[6]='S'
		ls_dataType[7]='S'
	elseif lower(ls_style) = 'code lookup' then
		ls_field_name[1] = 'code'
		ls_field_name[2] = 'description'
		ls_field_name[3] = 'large_description_1'
		ls_field_name[4] = 'large_description_2'
		ls_dataType[1]='S'
		ls_dataType[2]='S' 
		ls_dataType[3]='S'
		ls_dataType[4]='S'
	elseif lower(ls_style) = 'user' then
		ls_field_name[1] = 'user_id'
		ls_dataType[1]='S'
	end if
	For i = 1 To upperbound(ls_field_name)
		ll_row = dwchild.insertrow(0)
		ls_field_name1 = ls_field_name[i]
		dwchild.setitem(ll_row,'field_name',ls_field_name1)
		dwchild.setitem(ll_row,'field_display',ls_field_name1)
		dwchild.setitem(ll_row,'datatype',ls_dataType[i])
	Next
elseif ll_screen_id = 2003 and left(lower(ls_ctx_column_name),7)='custom_' then  //Added By Jay Chen 01-23-2016 for app_facility custom
	//reset dwchild
	tab_1.tabpage_field_data.dw_detail.getchild("lu_field_name",dwchild)
	dwchild.reset()
	select field_style into :ls_style from ctx_contact_custom_config where field_falg='C' AND field_name=:ls_ctx_column_name;
	if isnull(ls_style) then ls_style = ''
	if lower(ls_style) = 'company' then
		ls_field_name[1] = 'facility_id'
		ls_field_name[2] = 'facility_name'
		ls_field_name[3] = 'city'
		ls_field_name[4] = 'state'
		ls_field_name[5] = 'country'
		ls_field_name[6] = 'street'
		ls_field_name[7] = 'zip'
		ls_dataType[1]='N'
		ls_dataType[2]='S' 
		ls_dataType[3]='S'
		ls_dataType[4]='S'
		ls_dataType[5]='N'
		ls_dataType[6]='S'
		ls_dataType[7]='S'
	elseif lower(ls_style) = 'code lookup' then
		ls_field_name[1] = 'code'
		ls_field_name[2] = 'description'
		ls_field_name[3] = 'large_description_1'
		ls_field_name[4] = 'large_description_2'
		ls_dataType[1]='S'
		ls_dataType[2]='S' 
		ls_dataType[3]='S'
		ls_dataType[4]='S'
	elseif lower(ls_style) = 'user' then
		ls_field_name[1] = 'user_id'
		ls_dataType[1]='S'
	end if
	For i = 1 To upperbound(ls_field_name)
		ll_row = dwchild.insertrow(0)
		ls_field_name1 = ls_field_name[i]
		dwchild.setitem(ll_row,'field_name',ls_field_name1)
		dwchild.setitem(ll_row,'field_display',ls_field_name1)
		dwchild.setitem(ll_row,'datatype',ls_dataType[i])
	Next
Else
	tab_1.tabpage_field_data.dw_detail.modify("t_10.text = 'Lookup Table Field:'")
	tab_1.tabpage_field_data.dw_detail.getchild("lu_field_name",dwchild)
	dwchild.reset()
	ls_field_name[1] = 'Lookup Code'
	ls_field_name[2] = 'Code'
	ls_field_name[3] = 'description'
	ls_field_name[4] = 'Entity_Name'
	ls_field_name[5] = 'Street1'
	ls_field_name[6] = 'Street2'
	ls_field_name[7] = 'City'
	ls_field_name[8] = 'State'
	ls_field_name[9] = 'Zip'
	ls_field_name[10] = 'County'
	ls_field_name[11] = 'Country'
	ls_field_name[12] = 'contact_name'
	ls_field_name[13] = 'Custom_1'
	ls_field_name[14] = 'Custom_2'
	ls_field_name[15] = 'Custom_3'
	ls_field_name[16] = 'Custom_4'
	ls_field_name[17] = 'Custom_5'
	ls_field_name[18] = 'Custom_6'
	ls_field_name[19] = 'large_description_1'		//Added by Scofield on 2007-06-12
	ls_field_name[20] = 'large_description_2'		//Added by Scofield on 2007-06-12
	
	//--------------------------- APPEON BEGIN ---------------------------
	//$< Add  > 2008-01-15 By: Scofield
	//$<Reason> Add ten columns.

	ls_field_name[21] = 'money_1'
	ls_field_name[22] = 'money_2'
	ls_field_name[23] = 'integer_1'
	ls_field_name[24] = 'integer_2'
	ls_field_name[25] = 'integer_3'
	ls_field_name[26] = 'integer_4'
	ls_field_name[27] = 'integer_5'					
	ls_field_name[28] = 'integer_6'
	ls_field_name[29] = 'integer_7'
	ls_field_name[30] = 'integer_8'
	ls_field_name[31] = 'datetime_1'
	ls_field_name[32] = 'datetime_2'
	//---------------------------- APPEON END ----------------------------
	//<add> andy 2007.06.01 
	ls_dataType[1]='N'
	ls_dataType[2]='S' 
	ls_dataType[3]='S'
	ls_dataType[4]='S'
	ls_dataType[5]='S'
	ls_dataType[6]='S'
	ls_dataType[7]='S'
	ls_dataType[8]='S'
	ls_dataType[9]='S'
	ls_dataType[10]='S'
	ls_dataType[11]='S'
	ls_dataType[12]='S'
	ls_dataType[13]='S'
	ls_dataType[14]='S'
	ls_dataType[15]='S'
	ls_dataType[16]='S'
	ls_dataType[17]='S'
	ls_dataType[18]='S'
	//end of add
	ls_dataType[19]='S'		//Added by Scofield on 2007-06-12
	ls_dataType[20]='S'		//Added by Scofield on 2007-06-12
	
	//--------------------------- APPEON BEGIN ---------------------------
	//$< Add  > 2008-01-15 By: Scofield
	//$<Reason> Add ten columns.
	ls_dataType[21]='N'
	ls_dataType[22]='N'
	ls_dataType[23]='N'
	ls_dataType[24]='N'
	ls_dataType[25]='N'
	ls_dataType[26]='N'
	ls_dataType[27]='N'
	ls_dataType[28]='N'
	ls_dataType[29]='N'
	ls_dataType[30]='N'
	ls_dataType[31]='D'
	ls_dataType[32]='D'
	//---------------------------- APPEON END ----------------------------
	
	For i = 1 To upperbound(ls_field_name)
		ll_row = dwchild.insertrow(0)
		ls_field_name1 = ls_field_name[i]
		dwchild.setitem(ll_row,'field_name',ls_field_name1)
		dwchild.setitem(ll_row,'field_display',ls_field_name1) // jervis 06.09.2009
		//<add> andy 2007.06.01 
      //save data type to dwchild
		dwchild.setitem(ll_row,'datatype',ls_dataType[i])
		//end of add
	Next
End If
tab_1.tabpage_field_data.dw_detail.SetRedraw(true)

end subroutine

public subroutine of_setui (long al_exporttype);/*
Function  : of_setui(long al_exporttype) returns integer
Arguments :al_exporttype long //export type
describe  :Set UI base on export type
author    :andy 2007.05.23
*/
String ls_ctx_column,ls_color,ls_Modify
Long   ll_Row
u_dw   ldw_Temp

ldw_Temp = this.tab_1.tabpage_field_data.dw_detail
ls_color = ldw_Temp.Describe("DataWindow.Color")

choose case al_exporttype
	case 1,2
		ls_Modify = "filter_query.protect='0'~tfilter_query.Background.Color='16777215'~tfilter_wizard.enabled=true"+&
						"~tsort_by.protect='0'~tsort_by.Background.Color='16777215'"
		ldw_Temp.Modify(ls_Modify)
		this.tab_1.tabpage_field_data.cb_1.enabled = true
		this.tab_1.tabpage_field_data.st_1.Visible = false
		this.tab_1.tabpage_field_data.mle_1.Visible = false
		this.tab_1.tabpage_field_data.cb_4.Visible = false
		this.tab_1.tabpage_field_data.mle_1.text = ''
	case 3
		ls_Modify = "filter_query.protect='1'~tfilter_query.Background.Color='" +ls_color+"'~tfilter_wizard.enabled=false"+&
						"~tsort_by.protect='1'~tsort_by.Background.Color='"+ls_color+"'"
		ldw_Temp.Modify(ls_Modify)
		this.tab_1.tabpage_field_data.cb_1.enabled = false
		this.tab_1.tabpage_field_data.st_1.Visible = true
		this.tab_1.tabpage_field_data.mle_1.Visible = true
		this.tab_1.tabpage_field_data.cb_4.Visible = true

		ll_Row = this.tab_1.tabpage_field_data.dw_detail.GetRow()
		if ll_Row > 0 then
			ls_ctx_column = this.tab_1.tabpage_field_data.dw_detail.GetItemString(ll_Row,"export_fields_expression")
			if isnull(ls_ctx_column) then ls_ctx_column = ''
			this.tab_1.tabpage_field_data.mle_1.text = ls_ctx_column
		end if
		wf_resize_tab()				//Added By Mark Lee 07/19/2013
	case else
		//do nothing
		
end choose

end subroutine

public function long of_check ();/************************************************
Function: of_check
describe:verify Calculation formula
return  :0 successful/-1 failed
author  : andy 2007.05.24
*************************************************/
Long    ll_Row,ll_Num,ll_Cnt
String  ls_Field,ls_Datatype,ls_Source,ls_Err,ls_ComputerField
boolean lb_flag = true
n_ds      lds_field
Long    ll_pos
pfc_n_cst_ai_export_apb  n_export
n_cst_string lnvo_string

if trim(tab_1.tabpage_field_data.mle_1.text)='' or isnull(tab_1.tabpage_field_data.mle_1.text) then
	messagebox(gnv_app.iapp_object.DisplayName,"NULL expression is not valid.")
	tab_1.tabpage_field_data.mle_1.setfocus( )
	return -1
end if

ls_Source = tab_1.tabpage_field_data.mle_1.text

n_export = CREATE pfc_n_cst_ai_export_apb

lds_field = Create n_ds
lds_field.DataObject = "d_export_fields"
lds_field.of_SetTransObject( SQLCA )
lds_field.Retrieve( il_export_id )

ll_Row = tab_1.tabpage_field_data.dw_detail.GetRow()
//filter current computer fields
if ll_Row > 0 then
	ls_ComputerField = tab_1.tabpage_field_data.dw_detail.GetItemString(ll_Row,"export_field_name")
	if isnull(ls_ComputerField) then ls_ComputerField = ''
	lds_field.setFilter("export_field_name<>'" + ls_ComputerField + "'")
	lds_field.Filter( )
end if

//If exists the field of lds_field in the expresstion,
//replace it with 0 for number data type or replace it with '' for string data type.
ll_Cnt = lds_field.RowCount()
for ll_Num = 1 to ll_Cnt
	ls_Field    = lds_field.GetItemString(ll_Num,"export_field_name")
	ls_Datatype = lds_field.GetItemString(ll_Num,"ctx_column_datatype")
	//Modify 07/17/2007 by: Andy Reason:BugG071701
	ll_pos      = pos(lower(ls_Source),lower(ls_Field))
	if ll_pos < 1 then continue
	
	if upper(ls_Datatype) = 'N' then
		ls_Source  = n_export.of_globalreplace( ls_Source, ls_Field, 'compute_2',true)
	elseif upper(ls_Datatype) = 'S' then
		lb_flag = false
		ls_Source  = n_export.of_globalreplace( ls_Source, ls_Field, 'compute_3',true)
	elseif upper(ls_Datatype) = 'D' then
		lb_flag = false
		ls_Source  = n_export.of_globalreplace( ls_Source, ls_Field, '1900-01-01',true)
	end if
	//end of modify
next

//replace ' with "
ls_Source  = lnvo_string.of_globalreplace( ls_Source, '~~', '~~~~')
ls_Source  = lnvo_string.of_globalreplace( ls_Source, '"', '~~"')
if POS(ls_Source,'"') > 0 or POS(ls_Source,"~~'") > 0 then lb_flag = false

ls_Err = lds_field.modify('compute_1.Expression="' + ls_Source + '"')
if ls_Err <> '' then
	messagebox(gnv_app.iapp_object.DisplayName,"Expression is not valid.")
	tab_1.tabpage_field_data.mle_1.setfocus( )
	if IsValid(lds_field) then Destroy lds_field
	if IsValid(n_export) then Destroy n_export
	return -1
end if



ls_Err=lds_field.Describe('Evaluate("'+ls_Source+'", 1)')
ls_Datatype = ''

if  not isnumber(ls_Err) then 
	//not OK
	if ls_Err = '!' then
		messagebox(gnv_app.iapp_object.DisplayName,"Expression is not valid.")
		tab_1.tabpage_field_data.mle_1.setfocus( )
		if IsValid(lds_field) then Destroy lds_field
		if IsValid(n_export) then Destroy n_export
		return -1
	else
		ls_Datatype = 'S'
		//OK(denominator is 0)
		if ls_Err = '' and lb_flag then ls_Datatype = 'N'
	end if
else
	//OK
	if lb_flag then ls_Datatype = 'N' else ls_Datatype = 'S' 
end if 

//set values
if ll_Row > 0 then
	tab_1.tabpage_field_data.dw_detail.setitem(ll_Row,"ctx_column_datatype",ls_Datatype)
	tab_1.tabpage_field_data.dw_detail.SetItem(ll_Row,"export_fields_expression", tab_1.tabpage_field_data.mle_1.text )
end if

if IsValid(lds_field) then Destroy lds_field
if IsValid(n_export) then Destroy n_export

return 0

end function

public subroutine of_updatehistorydata ();/***************************************************
function: of_updatehistorydata() returns (none)
describe: 
Update the data type of the export column 
where the data type is null(only execute one time),
in order to resolve the history data.
Because the data type is very important for Calculated fields.
author  : andy 2007.06.01
***************************************************/
long   ll_Cnt = 0,ll_rec_id,ll_find,ll_Ret,ll_Num,ll_Row,ll_ExportType
string ls_ctx_column_name,ls_lu_field_name,ls_datatype,ls_Sql,ls_Syntax,ls_presentation,ls_Err
u_dw   ldw_Temp
datawindowchild dwchild
n_ds   lds_Temp
Long   ll_intcred_field,ll_intcred_table

SELECT TOP 1 1 
	INTO :ll_Cnt 
	FROM export_fields 
	WHERE (ctx_column_datatype is null or ctx_column_datatype in ('A','C','B'))
		and ((export_type = 1 and (isnull(ctx_column_name,'') <> '' or isnull(intcred_field,0) <> 0)) or (export_type = 2) )
		and export_id = :il_export_id;//<add> 07/12/2007 by: Andy optimize
//if not exists ctx_column_datatype is null then do nothing
if ll_Cnt < 1 then return 

setpointer(HourGlass!)

ls_Sql = "select rec_id from  export_fields WHERE (ctx_column_datatype is null or ctx_column_datatype in ('A','C','B')) " + &
		   " and ((export_type = 1 and (isnull(ctx_column_name,'') <> '' or isnull(intcred_field,0) <> 0)) or (export_type = 2) ) and export_id = " + String(il_export_id)
ls_presentation = "style(type=form)"
ls_Syntax = SQLCA.SyntaxFromSQL(ls_Sql, ls_presentation, ls_Err)

lds_Temp = create n_ds
lds_Temp.create(ls_Syntax,ls_Err)
lds_Temp.settransobject(sqlca)
ll_Ret = lds_Temp.Retrieve()

ib_lockcol = false
ldw_Temp = tab_1.tabpage_field_data.dw_detail
ldw_Temp.setredraw(false)

FOR ll_Num = 1 to ll_Ret
	ll_rec_id =lds_Temp.GetitemNumber(ll_Num,"rec_id")
	
	ll_Row    =ldw_Temp.retrieve(ll_rec_id )
	if ll_Row > 0 then
		ll_intcred_field   = ldw_Temp.GetItemNumber(1,"intcred_field")
		ls_ctx_column_name = ldw_Temp.GetItemString(1,"export_fields_ctx_column_name")
		ls_lu_field_name   = ldw_Temp.GetItemString(1,"lu_field_name")
		ll_ExportType      = ldw_Temp.GetItemNumber(1,"export_fields_export_type")
		ll_intcred_table   = ldw_Temp.GetItemNumber(1,"intcred_table")

		if isnull(ls_ctx_column_name) then ls_ctx_column_name = ''
		if isnull(ls_lu_field_name) then ls_lu_field_name = ''
		if isnull(ll_intcred_field) then ll_intcred_field = 0
		if isnull(ll_intcred_table) then ll_intcred_table = 0
		
		if ldw_Temp.getchild("intcred_field",dwchild) = 1 then
			dwchild.Settransobject( SQLCA)
			IF dwchild.Retrieve(ll_intcred_table ) < 1 THEN dwchild.INSERTROW(0)
		end if
		
		
		if ldw_Temp.getchild("export_fields_ctx_column_name",dwchild) = 1 then
			ll_find = dwchild.find("field_name = '" + ls_ctx_column_name +"'",1,dwchild.rowcount())
			If ll_find > 0 Then
				ls_DataType = dwchild.GetItemString(ll_find,"field_datatype")
				ldw_Temp.setitem(1,'ctx_column_datatype',ls_DataType)
			End If
		end if

		//<add> 07/13/2007  by: Andy
		if ldw_Temp.GetChild( "intcred_field", dwchild ) = 1 then
			ll_find = dwchild.Find("field_id=" + String(ll_intcred_field) ,1,dwchild.RowCount())
			if ll_find > 0 then
				ls_DataType = dwchild.GetItemString(ll_find,"field_type")
				if isnull(ls_DataType) then ls_DataType = ''
				if UPPER(ls_DataType) = 'L' OR UPPER(ls_DataType) = 'I' THEN ls_DataType = 'N'
				if UPPER(ls_DataType) = 'C' THEN ls_DataType = 'S'
				ldw_Temp.setitem(1,'ctx_column_datatype',ls_DataType)
			end if
		end if
		//end of add
		
		if ldw_Temp.getchild("lu_field_name",dwchild) = 1 then 
			ll_find = dwchild.find("field_name = '" + ls_lu_field_name +"'",1,dwchild.rowcount())
			If ll_find > 0 Then
				ls_DataType = dwchild.GetItemString(ll_find,"datatype")
				ldw_Temp.setitem(1,'ctx_column_datatype',ls_DataType)
			End If
		end if
		
		//fixed text
		if ll_ExportType = 2 then
			ldw_Temp.setitem(1,'ctx_column_datatype','S')
		end if
		
		if ldw_Temp.update() = 1 then 
			commit;
		else
			rollback;
		end if
				
	end if
next

ldw_Temp.reset()
ib_lockcol = true
ldw_Temp.setredraw(true)
if IsValid(lds_Temp) then Destroy lds_Temp
end subroutine

public function integer wf_size_it ();////////////////////////////////////////////////////////////////////////////////////////////////// //
// function: wf_size_it
////////////////////////////////////////////////////////////////////////////////////////////////////

// save the original sizes of the window and all of the objects on the window
// NOTE !!!! this process does not work on objects that are not descended
// from the dragobject class.
//==============================APPEON BEGIN==========================
// $<Added>:   Date: Nov 01,2007       Author:Nova
//--------------------------------------------------------------------
// $<reason>   Fix a defect.


dragobject temp
Int cnt,i
ii_win_width  = This.Width
ii_win_height = This.Height
ii_win_frame_w = This.Width - This.WorkSpaceWidth()
ii_win_frame_h = This.Height - This.WorkSpaceHeight()

cnt = UpperBound(This.Control)
FOR i = cnt To 1 Step -1
	temp = This.Control[i]
	
	// everything has a x,y,width and height
	size_ctrl[i].X = temp.X
	size_ctrl[i].Width = temp.Width
	size_ctrl[i].Y = temp.Y
	size_ctrl[i].Height = temp.Height
	
	// now go get text size information
	CHOOSE CASE TypeOf(temp)
		CASE commandbutton!
			commandbutton cb
			cb = temp
			size_ctrl[i].fontsize = cb.TextSize
			
		CASE singlelineedit!
			singlelineedit sle
			sle = temp
			size_ctrl[i].fontsize = sle.TextSize
			
		CASE editmask!
			editmask em
			em = temp
			size_ctrl[i].fontsize  	 = 	em.TextSize
			
		CASE statictext!
			statictext st
			st = temp
			size_ctrl[i].fontsize  	 = 	st.TextSize
			
		CASE picturebutton!
			picturebutton pb
			pb = temp
			size_ctrl[i].fontsize = pb.TextSize
			
		CASE checkbox!
			checkbox cbx
			cbx = temp
			size_ctrl[i].fontsize  	 = 	cbx.TextSize
			
		CASE dropdownlistbox!
			dropdownlistbox ddlb
			ddlb = temp
			size_ctrl[i].fontsize  	 = 	ddlb.TextSize
			
		CASE groupbox!
			groupbox gb
			gb = temp
			size_ctrl[i].fontsize  	 = 	gb.TextSize
			
		CASE listbox!
			listbox lb
			lb = temp
			size_ctrl[i].fontsize  	 = 	lb.TextSize
			
		CASE multilineedit!
			multilineedit mle
			mle = temp
			size_ctrl[i].fontsize  	 = 	mle.TextSize
		CASE radiobutton!
			radiobutton rb
			rb = temp
			size_ctrl[i].fontsize  	 = 	rb.TextSize
	END CHOOSE
NEXT

RETURN 1
//==============================APPEON END============================
end function

public function integer wf_resize_it (double size_factor);////////////////////////////////////////////////////////////////////////////////////////////////// //
// function: wf_resize_it
////////////////////////////////////////////////////////////////////////////////////////////////////
//==============================APPEON BEGIN==========================
// $<Added>:   Date: Nov 01,2007       Author:Nova
//--------------------------------------------------------------------
// $<reason>   Fix a defect.
// loop through off of the objects captured in the wf_size_it function and resize them
// Note !! radio buttons and checkboxes do not size properly as they are of fixed size.

dragobject temp
Int cnt,i

ib_exec = False // keep the function from being called recursively
//this.hide()

// resize the window
This.Width = ((  ii_win_width - ii_win_frame_w) * size_factor) + ii_win_frame_w

This.Height = ((  ii_win_height - ii_win_frame_h) * size_factor) + ii_win_frame_h

// for each control in the list, resize it and it's textsize (as applicable)
cnt = UpperBound(This.Control)
FOR i = cnt To 1 Step -1
	temp = This.Control[i]
	Boolean ib_flag = True
	IF TypeOf(temp) = commandbutton! THEN
		commandbutton cbtemp
		cbtemp = temp
		IF cbtemp.Text = "&Save" THEN
			ib_flag = False
		ELSE
			ib_flag = True
		END IF
	ELSE
		ib_flag = True
	END IF
	IF ib_flag THEN
		temp.X		 = size_ctrl[i].X * size_factor
		temp.Width   = size_ctrl[i].Width  * size_factor
		temp.Y		 = size_ctrl[i].Y * size_factor
		temp.Height  = size_ctrl[i].Height * size_factor
		
	END IF
	CHOOSE CASE TypeOf(temp)
		CASE commandbutton!
			commandbutton cb
			cb = temp
			//messagebox("",cb.text)
			IF ib_flag THEN
				cb.TextSize =  size_ctrl[i].fontsize * size_factor
			END IF
			
		CASE singlelineedit!
			singlelineedit sle
			sle = temp
			sle.TextSize =  size_ctrl[i].fontsize * size_factor
			
		CASE editmask!
			editmask em
			em = temp
			em.TextSize =  size_ctrl[i].fontsize * size_factor
			
		CASE statictext!
			statictext st
			st = temp
			st.TextSize =  size_ctrl[i].fontsize * size_factor
			
		CASE datawindow! // datawindows get zoomed
			datawindow dw
			dw = temp
//			dw.Object.datawindow.zoom = String(Int(size_factor*100))
			If gb_autozoom Then dw.Object.datawindow.zoom = String(Int(size_factor*100)) //modified by gavins 20130107
		CASE picturebutton!
			picturebutton pb
			pb = temp
			pb.TextSize =  size_ctrl[i].fontsize * size_factor
			
		CASE checkbox!
			checkbox cbx
			cbx = temp
			cbx.TextSize =  size_ctrl[i].fontsize * size_factor
			
		CASE dropdownlistbox!
			dropdownlistbox ddlb
			ddlb = temp
			ddlb.TextSize =  size_ctrl[i].fontsize * size_factor
			
		CASE groupbox!
			groupbox gb
			gb = temp
			gb.TextSize =  size_ctrl[i].fontsize * size_factor
			
		CASE listbox!
			listbox lb
			lb = temp
			lb.TextSize  =  size_ctrl[i].fontsize * size_factor
			
		CASE multilineedit!
			multilineedit mle
			mle = temp
			mle.TextSize =  size_ctrl[i].fontsize * size_factor
			
		CASE radiobutton!
			radiobutton rb
			rb = temp
			rb.TextSize =  size_ctrl[i].fontsize * size_factor
			
	END CHOOSE//"yes_or_no.Color ='"
NEXT
//messagebox("",string(tab_1.tabpage_export_hdr.dw_export_file.height))
//tab_1.height=this.workspaceheight( ) -tab_1.y -80
//tab_1.width =this.workspacewidth( ) -tab_1.x -55
//tab_1.tabpage_export_hdr.dw_export_file.height=tab_1.height - tab_1.tabpage_export_hdr.dw_export_file.y -118
//tab_1.tabpage_export_hdr.dw_export_file.width=tab_1.width - tab_1.tabpage_export_hdr.dw_export_file.y -
////tab_1.tabpage_export_hdr.dw_export_file.Modify("DataWindow.Zoom='"+string((size_factor)*100)+"'")
cb_save.Y = tab_1.Y +120
ib_exec = True
RETURN 1
//==============================APPEON END============================
end function

public function boolean of_field_name_check (string as_fieldname);//====================================================================
// Function: of_Field_Name_Check()
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value    string    as_FieldName
//--------------------------------------------------------------------
// Returns:  boolean
//--------------------------------------------------------------------
// Author:	Scofield		Date: 2009-05-15
//--------------------------------------------------------------------
//	Copyright (c) 1999-2009 Contractlogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

Char	lc_First,lc_Other
long	ll_Cycle,ll_Length

lc_First = Char(as_FieldName)
if Not (lc_First >= 'a' and lc_First <= 'z' or lc_First >= 'A' and lc_First <= 'Z') then Return false

ll_Length = Len(as_FieldName)
for ll_Cycle = 2 to ll_Length
	lc_Other = Char(Mid(as_FieldName,ll_Cycle,1))
	if Not (lc_Other >= 'a' and lc_Other <= 'z' or lc_Other >= 'A' and lc_Other <= 'Z' or lc_Other >= '0' and lc_Other <= '9' or lc_Other = '_') then Return false
next

Return true

end function

public subroutine of_set_dddw (ref datawindowchild dwchild, string as_dataobject);//Add function by jervis 06.09.2009

datastore lds_obj
long ll_i,ll_count
string ls_field_name
string ls_field_display
string ls_datatype
long ll_row

lds_obj = create datastore
lds_obj.dataobject = as_dataobject
ll_count = long(lds_obj.Describe( "datawindow.column.count"))
for ll_i = 1 to ll_count
	if lds_obj.describe( "#"+string(ll_i)+".visible") = "1" then
		ls_field_name = lds_obj.Describe( "#"+string(ll_i)+".name")
		ls_field_display = lds_obj.describe( ls_field_name+"_t.text")
		if ls_field_display = "!" then continue
		ls_dataType = of_get_coltype(lds_obj,ls_field_name)
		
		ll_row = dwchild.insertrow( 0)
		dwchild.setitem(ll_row,'field_name',ls_field_name)
		dwchild.setitem(ll_row,'field_display',ls_field_display) 
		dwchild.setitem(ll_row,'datatype',ls_dataType)
	end if
next
destroy lds_obj
end subroutine

public function string of_get_coltype (ref datastore ads_object, string as_name);//Add function by Jervis 03.17.2009

string ls_datatype

//Get Column Type
ls_datatype = ads_object.Describe( as_name + ".coltype")
Choose Case Left ( ls_datatype , 5 )
	Case "char(", "char"
		ls_datatype = "S"
	Case "date"	,"datet"	,"time", "times"
		ls_datatype = "D"
	Case "decim","numbe", "doubl", "real","long", "ulong", "int"
		ls_datatype = "N"
End Choose
return ls_datatype
end function

public function string of_build_alias (string as_label);//Add by jervis -- 11.20.2009

string ls_alias
int li_i,li_count
string ls_char
string ls_other_alias
boolean lb_duplicates
int li_pos
string ls_num


ls_alias = as_label
//More than 40
if len(ls_alias) > 40 then ls_alias = left(ls_alias,40)

//Replace first char to 'c'
if not ((Asc(ls_alias)>=65 and Asc(ls_alias) <= 90) or (Asc(ls_alias)>=97 and Asc(ls_alias) <= 122))  then
	ls_alias = Replace(ls_alias,1,1,'c')
end if

//if = column then change to column_c

//Replact to '_'(0-9,a-z,A-Z,_)
li_count = len(ls_alias)
for li_i = 1 to li_count
	ls_char = mid(ls_alias,li_i,1)
	if not ((Asc(ls_char)>=48 and Asc(ls_char) <= 57) or (Asc(ls_char)>=65 and Asc(ls_char) <= 90) or (Asc(ls_char)>=97 and Asc(ls_char) <= 122)) and ls_char <> '_' then
		ls_alias = Replace(ls_alias,li_i,1,'_')
	end if
next

//Column name Repeat 
For li_i = 1 To tab_1.tabpage_field_data.dw_fld_list.rowcount() 
	//if li_i = al_row then continue
	ls_other_alias = tab_1.tabpage_field_data.dw_fld_list.getitemstring(li_i,'export_field_name')
	If lower(ls_other_alias) = lower(ls_alias) Then
		li_pos = lastpos(ls_alias,"_")
		if li_pos  > 0 then
			ls_num = mid(ls_alias,li_pos + 1)
			if isnumber(ls_num) then
				ls_alias = mid(ls_alias,1,li_pos) + string(integer(ls_num) + 1)
			else
				ls_alias = ls_alias + "_1"
			end if
		else
			ls_alias = ls_alias + "_1"
		end if
		li_i = 0
	End If
Next

return ls_alias
end function

public subroutine wf_resize_tab ();//Added By Mark Lee 07/19/2013 this is move from the resize event. 
//tab_1.tabpage_field_data.cb_1.x=long(tab_1.tabpage_field_data.dw_detail.Object.sort_by.X) +tab_1.tabpage_field_data.dw_fld_list.width+50
tab_1.tabpage_field_data.cb_1.x=long(tab_1.tabpage_field_data.dw_detail.x ) + long(tab_1.tabpage_field_data.dw_detail.Object.sort_by.x) 
tab_1.tabpage_field_data.cb_1.y=tab_1.tabpage_field_data.dw_detail.y + long(tab_1.tabpage_field_data.dw_detail.Object.sort_by.y) +long(tab_1.tabpage_field_data.dw_detail.Object.sort_by.height) + 10

tab_1.tabpage_field_data.st_1.x=long(tab_1.tabpage_field_data.dw_detail.Object.gb_1.x) + long(tab_1.tabpage_field_data.dw_detail.x	) + 20
tab_1.tabpage_field_data.st_1.y=tab_1.tabpage_field_data.dw_detail.y + long(tab_1.tabpage_field_data.dw_detail.Object.gb_1.y) + 80

tab_1.tabpage_field_data.mle_1.x = long(tab_1.tabpage_field_data.dw_detail.Object.gb_1.x) + long(tab_1.tabpage_field_data.dw_detail.x	) + 20
tab_1.tabpage_field_data.mle_1.y = tab_1.tabpage_field_data.st_1.y + tab_1.tabpage_field_data.st_1.height + 10
tab_1.tabpage_field_data.mle_1.width = long(tab_1.tabpage_field_data.dw_detail.Object.gb_1.width) - 140
tab_1.tabpage_field_data.mle_1.height = long(tab_1.tabpage_field_data.dw_detail.Object.gb_1.height) - 150

tab_1.tabpage_field_data.cb_4.y = tab_1.tabpage_field_data.mle_1.y 
tab_1.tabpage_field_data.cb_4.x = tab_1.tabpage_field_data.mle_1.x + tab_1.tabpage_field_data.mle_1.width + 10

end subroutine

public function integer of_save (boolean abn_force);//Added By Mark Lee 09/27/2013 move it from cb_save button clicked event.
Integer li_retval
integer r
string s
long recid
integer i
integer rc
DataWindowChild dwchild
integer col
long    ll_FieldType//<add> andy 2007.05.24
//debugbreak()
string 		ls_save_path,	ls_export_name
long			ll_count
long			ll_Export_ID 
dwItemStatus ldis_status

li_retval = tab_1.tabpage_field_data.dw_fld_list.update()
//commit using sqlca;

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 04.10.2007 By: Jack
//$<reason> Fix a defect.
tab_1.tabpage_export_hdr.dw_export_file.accepttext()
tab_1.tabpage_field_data.dw_detail.accepttext()

//Added By Jay Chen 07-08-2014
if tab_1.tabpage_export_hdr.dw_export_file.getrow( ) > 0 then
	ls_save_path = tab_1.tabpage_export_hdr.dw_export_file.getitemstring(tab_1.tabpage_export_hdr.dw_export_file.getrow( ), "save_path")
	ls_export_name = lower(tab_1.tabpage_export_hdr.dw_export_file.getitemstring(tab_1.tabpage_export_hdr.dw_export_file.getrow( ), "export_name"))
	ll_Export_ID  = tab_1.tabpage_export_hdr.dw_export_file.getitemNumber(tab_1.tabpage_export_hdr.dw_export_file.getrow( ), "export_id") //Added by gavins 20160322
	
	ldis_status = tab_1.tabpage_export_hdr.dw_export_file.GetItemStatus( tab_1.tabpage_export_hdr.dw_export_file.getrow( ),"export_name",Primary!)
	if (lb_new or ldis_status =DataModified! or ldis_status =NewModified! ) and (not isnull(ls_export_name) and trim(ls_export_name)<>"" ) then 					//Added By Mark Lee 03/16/2016
		ll_count = 0 
		If IsNull( ll_Export_ID ) Then ll_Export_ID = -999 //Modified by gavins 20160322 
		SELECT count(1)   Into :ll_count FROM export_header   Where export_name =:ls_export_name and export_id <> :ll_Export_ID ;
		if ll_count > 0 then 
			messagebox("Invalid Export Name","Export name cannot be duplicate.")
			return -1
		end if 				 
	end if 
end if
if isnull(ls_save_path) then ls_save_path = ''
if lower(trim(ls_save_path)) = '%appdata%' or lower(trim(ls_save_path)) = '%appdata%\' then
	if tab_1.selectedtab = 2 then tab_1.selectedtab = 1
	tab_1.tabpage_export_hdr.dw_export_file.setfocus()
	tab_1.tabpage_export_hdr.dw_export_file.setcolumn("save_path")
	messagebox(gnv_app.iapp_object.DisplayName,"The save to file name is invalid. Please correct it (e.g. %appdata%\test.txt). ")
	return -1
end if
//end

////Added By Mark Lee 08/01/2013
//if abn_force = true then
//	if ib_export_save = true Then 
////		li_retval = MessageBox(gnv_app.iapp_object.DisplayName,"It may take a few minutes to generate the associated export data when saving the changes.~r~n~r~nDo you want to continue?",Information! ,OKCancel!)
//		li_retval = MessageBox(gnv_app.iapp_object.DisplayName,"It may take a few minutes to generate the associated export data when saving the changes.")		
////		IF li_retval = 2 Then
////			Return 0
////		End If
//	end if 
//end if 

If tab_1.tabpage_export_hdr.dw_export_file.modifiedcount() > 0 Or lb_new Or tab_1.tabpage_field_data.dw_detail.modifiedcount() > 0  Or tab_1.tabpage_field_data.dw_detail.deletedcount() > 0  Then
//---------------------------- APPEON END ----------------------------
	if tab_1.tabpage_field_data.dw_detail.rowcount() > 0 then
		//<add> andy 2007.05.24
		ll_FieldType   = tab_1.tabpage_field_data.dw_detail.GetItemNumber( 1, "export_fields_export_type")
		if ll_FieldType = 3 then
			//check valid and set mle_1.text into export_fields_ctx_column_name 
			if of_check() = -1 then return -1 // Modify by Evan 01.31.2008
		end if
		//end of add
		
		if isnull(tab_1.tabpage_field_data.dw_detail.getItemnumber( 1, "rec_id" )) then
			recid = of_get_id( )
			tab_1.tabpage_field_data.dw_detail.SetItem( 1, "rec_id", recid )
			il_recid = recid
		end if
	end if
	testcnt++
	if tab_1.tabpage_field_data.dw_detail.rowcount() > 0 then
		if tab_1.tabpage_field_data.dw_detail.getItemnumber( 1, "use_default" ) = 2 then
			tab_1.tabpage_field_data.dw_detail.accepttext()
			col = integer(tab_1.tabpage_field_data.dw_detail.getItemstring( 1, "default_value" ))
			//messagebox("col",col)
			if col < 1 or col > tab_1.tabpage_field_data.dw_fld_list.rowcount() then
				//messagebox("Invalid setting","You are using a column default this column, but your default value is not a valid column number")
  				messagebox("Invalid setting","You are using a column default for this column, but your default value is not a valid column number")
				return -1 // Modify by Evan 01.31.2008
			end if
		end if
	end if
	
	//--------------------------- APPEON BEGIN ---------------------------
	//$<add> 2006-11-28 By: Rodger Wu
	integer li_module_type, li_getrow, li_ctx_uselink
	string ls_modify
	
	if tab_1.tabpage_field_data.dw_detail.rowcount() > 0 then
		li_module_type = tab_1.tabpage_field_data.dw_detail.GetItemNumber( 1, "export_fields_module_type" )
		li_ctx_uselink = tab_1.tabpage_field_data.dw_detail.GetItemNumber( 1, "export_fields_ctx_uselink" )
		if isnull( li_ctx_uselink ) then li_ctx_uselink = 0
		if li_module_type = 3 or li_module_type = 4 then
			ls_modify = "intcred_table.dddw.Required = 'No' intcred_field.dddw.Required = 'No' " + &
							"export_fields_ctx_scrn_id.dddw.Required = 'Yes' export_fields_ctx_column_name.dddw.Required = 'Yes'"
			if li_ctx_uselink = 0 then
				ls_modify += " export_fields_ctx_linkfromcolumn.dddw.Required = 'No' export_fields_ctx_linktoscrnid.dddw.Required = 'No'" + &
								 " export_fields_ctx_linktocolumn.dddw.Required = 'No'"
			else
				ls_modify += " export_fields_ctx_linkfromcolumn.dddw.Required = 'Yes' export_fields_ctx_linktoscrnid.dddw.Required = 'Yes'" + &
								 " export_fields_ctx_linktocolumn.dddw.Required = 'Yes'"
			end if
		else
			ls_modify = "intcred_table.dddw.Required = 'Yes' intcred_field.dddw.Required = 'Yes' " + &
							"export_fields_ctx_scrn_id.dddw.Required = 'No' export_fields_ctx_column_name.dddw.Required = 'No' " + &
							"export_fields_ctx_linkfromcolumn.dddw.Required = 'No' export_fields_ctx_linktoscrnid.dddw.Required = 'No' " + &
							"export_fields_ctx_linktocolumn.dddw.Required = 'No'"
		end if
		
		tab_1.tabpage_field_data.dw_detail.modify( ls_modify )
	end if
	//---------------------------- APPEON END ----------------------------
	
	//--------------------------- APPEON BEGIN ---------------------------
	//$<add> 04.10.2007 By: Jack
	If tab_1.tabpage_field_data.dw_detail.rowcount() > 0 Then
		string ls_export_field_name,ls_export_field_name1
		int li_pos,li_num
		long ll_rec_id,ll_rec_id1
		boolean lb_duplicates = False
		
		ls_export_field_name = tab_1.tabpage_field_data.dw_detail.getitemstring(1,'export_field_name')
		if Not of_Field_Name_Check(ls_export_field_name) then
			MessageBox("Invalid Column Name","Column Name is invalid.~r~n~r~nColumn Name must start with a letter, can include any combination of~r~nletters, numbers, and underscores.")
			Return -1
		end if
		If tab_1.tabpage_field_data.dw_detail.describe( "lu_field_name.visible" )  = '1' Then
			If IsNull( tab_1.tabpage_field_data.dw_detail.getitemstring(1,'lu_field_name') ) Or Trim( tab_1.tabpage_field_data.dw_detail.getitemstring(1,'lu_field_name') ) = '' Then
				messagebox("Invalid setting","Value is not a valid in 'Lookup Table Field'.")
				Return -1			
			End If
		End If
		/*
		li_pos = pos(trim(ls_export_field_name),' ')
		If li_pos > 0 Then
			messagebox("Invalid Column Name","Field name cannot contain space.")
			tab_1.tabpage_field_data.dw_detail.setfocus()
			tab_1.tabpage_field_data.dw_detail.setcolumn('export_field_name')
			Return -1
		End If
		*/		
		ll_rec_id = tab_1.tabpage_field_data.dw_detail.getitemnumber(1,'rec_id')
		If isnull(ll_rec_id) Then ll_rec_id = 0
		For i = 1 To tab_1.tabpage_field_data.dw_fld_list.rowcount()
			ls_export_field_name1 = tab_1.tabpage_field_data.dw_fld_list.getitemstring(i,'export_field_name')
			ll_rec_id1 = tab_1.tabpage_field_data.dw_fld_list.getitemnumber(i,'rec_id')		
			If lower(ls_export_field_name1) = lower(ls_export_field_name) And ll_rec_id1 <> ll_rec_id Then //Modified By Jay Chen 08-18-2014 add lower() 
				lb_duplicates = True
				exit
			End If
		Next
		If lb_duplicates Then
			//messagebox("Invalid Column Name","Field name cannot duplicates.")
 			messagebox("Invalid Column Name","Field name cannot be duplicate.")
			tab_1.tabpage_field_data.dw_detail.setfocus()
			tab_1.tabpage_field_data.dw_detail.setcolumn('export_field_name')
			Return -1 // Modify by Evan 01.31.2008
		End If
	End If
	
	//---------------------------- APPEON END ----------------------------
	
	
	li_retval = Event pfc_Save()
	
	IF li_retval < 0 THEN
		tab_1.tabpage_field_data.dw_detail.Modify("b_edit.visible = true ")
		Return li_retval // Modify by Evan 01.31.2008
	END IF
	
	//Begin - Added By Mark Lee 08/01/2013.	check the update data for export store procedure
	pfc_n_cst_ai_export_apb  n_export
	n_export = CREATE pfc_n_cst_ai_export_apb
	li_retval =	n_export.of_update_export_data( il_export_id)
	Destroy n_export
	ib_export_save = true
	//End - Added By Mark Lee 08/01/2013.	
		
	//--------------------------- APPEON BEGIN ---------------------------
	//$<add> 05.23.2007 By: Jack
	//$<reason> Fix a defect.
	dw_select.event constructor()	
	//---------------------------- APPEON END ----------------------------
	
//	dw_select.GetChild( "export_id", dwchild )
//	dwchild.settransobject(sqlca)
//	dwchild.retrieve()
	recid = il_recid

	rc = tab_1.tabpage_field_data.dw_fld_list.retrieve(il_export_id)
	s = "rec_id = " + string(recid)
	of_reset_find_filed_name(il_export_id)											//Added By Mark Lee 08/06/2015
	
	//find the current row and set it
	r = tab_1.tabpage_field_data.dw_fld_list.find(s,1,rc)
	
	if r > 0 then 
		tab_1.tabpage_field_data.dw_fld_list.scrolltorow(r)
		tab_1.tabpage_field_data.dw_fld_list.setrow(r)
	end if
		
	if lb_new = true then //remodified maha 081104
		//messagebox("","new")
	//	dw_select.retrieve()
		dw_select.GetChild( "export_id", dwchild )
		dwchild.settransobject(sqlca)
		rc = dwchild.retrieve()
		s = "export_id = " + string(il_export_id)
		
		//find the current row and set it
		r = dwchild.find(s,1,rc)
		
		if r > 0 then 
			dwchild.scrolltorow(r)
			dwchild.setrow(r)
		else
			dw_select.insertrow(1)
			//messagebox("il_export_id",il_export_id)
		end if	
		dw_select.setitem(dw_select.getrow(),'export_id',il_export_id)  //Add 04.27.2007 by Jack
		
		//dwchild.insertrow(1)
		//dw_select.retrieve()
	end if
	
	lb_new = false
	tab_1.tabpage_field_data.st_next.text = "Next Col " + (string(tab_1.tabpage_field_data.dw_fld_list.rowcount()+ 1))

End If

//Begin - Added By Mark Lee 08/01/2013.	check the update data for export store procedure
if abn_force = true then 
	if ib_export_save = true then 
		//update sqltext syntax
//		cb_test.event clicked( )
		of_create_export(true)
		ib_export_save = false		
	end if 
end if 
//End - Added By Mark Lee 07/31/2013.

tab_1.tabpage_field_data.dw_detail.Modify("b_edit.visible = true ") //Added By Jay Chen 07-31-2014

Return 1 // Add by Evan 01.31.2008
end function

public function integer of_create_export (boolean abn_update_sqltext);//====================================================================
// Function: of_create_export
//--------------------------------------------------------------------
// Description:The code copy from the cb_test.clicked event(). 
//					Change only for update the export sqltext value.
//--------------------------------------------------------------------
// Arguments:
// 	value    boolean    abn_update_sqltext
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	Mark Lee		Date: 09/29/2013
//--------------------------------------------------------------------
//	Copyright (c) 2008-2013 Contract Logix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
Long prac_ids[]
string ls_presentation_str
string ls_sny_retrieve
string ls_dwsyntax_str
string ERRORS
string ls_path
long ll_prac_row
n_ds lds_export_retrieve
long ll_from
long ll_to
string ls_return
long i
long ic
long ll_pracid
integer li_savedata = 0
string ls_prompt1
string ls_prompt2
string ls_prompt3
string ls_prompt
string ls_arg
string ls_parm1 = ""
string ls_parm2 = ""
string ls_parm3 = ""
integer p1
integer p2
integer p3
String  ls_Temp1,ls_Temp2
String  ls_name
Long    ll_pracidold = -1
Long    ll_Num = 0,ll_pos
integer li_type1
String  ls_SQL = '',ls_temp
integer li_type
pfc_n_cst_ai_export_apb  n_export

//Added By Mark 06/11/2014
If tab_1.tabpage_export_hdr.dw_export_file.Modifiedcount( )  > 0 Then
	i = messagebox(gnv_app.iapp_object.DisplayName,"The data need to be saved before you can run the current step. ~r~n~r~nClick Yes to save the data automatically.",Question!, YesNo!)
	if i =1 then 
		if of_save( false) <= 0 then
			return 0
		End if 
	else
		Return 0	
	End if
End If

n_export = CREATE pfc_n_cst_ai_export_apb

il_export_id = dw_select.getitemnumber(dw_select.getrow(),'export_id')
If	tab_1.tabpage_field_data.dw_fld_list.rowcount() < 1 Then
	messagebox("Export error","No Export Column.")
	if IsValid(n_export) then destroy n_export
	Return 0
End If

if isnull(il_export_id) or il_export_id < 1 then
	messagebox("Select error","Please select an export.")
	if IsValid(n_export) then destroy n_export
	return 0
end if

ls_path = tab_1.tabpage_export_hdr.dw_export_file.getitemstring(1,"save_path")
ls_sny_retrieve = tab_1.tabpage_export_hdr.dw_export_file.getitemstring(1,"prac_sql")
ls_prompt1 = tab_1.tabpage_export_hdr.dw_export_file.getitemstring(1,"prompt_type1")
ls_prompt2 = tab_1.tabpage_export_hdr.dw_export_file.getitemstring(1,"prompt_type2")
ls_prompt3 = tab_1.tabpage_export_hdr.dw_export_file.getitemstring(1,"prompt_type3")

choose case ls_prompt1
	case "C","D","N"
		ls_prompt = ls_prompt1
end choose
choose case ls_prompt2
	case "C","D","N"
		ls_prompt += "*" + ls_prompt2
end choose
choose case ls_prompt3
	case "C","D","N"
		ls_prompt += "*" + ls_prompt3
end choose

li_type = tab_1.tabpage_export_hdr.dw_export_file.GetItemNumber( 1, "export_type" )
IF isnull(ls_sny_retrieve) or trim(ls_sny_retrieve) = "" then
	open(w_export_test_param)
	ls_return = message.stringparm
	
	if ls_return = "Cancel" then
		if IsValid(n_export) then destroy n_export
		return 0
	end if
	
	ll_from = long(mid(ls_return,1,pos(ls_return,"@") - 1))
	ll_to = long(mid(ls_return,pos(ls_return,"@") + 1))
	ic = ll_to - ll_from + 1
	if ic < 0 then
		messagebox("Input Error","The To value must be greater than the From value.")
		if IsValid(n_export) then destroy n_export
		return 0
	end if

	if li_type = 3 or li_type = 4 then
		ls_sny_retrieve = 'Select distinct ctx_id from ctx_basic_info where ctx_id between ' + string(ll_from) + ' and ' + string(ll_to) + ';'
	else
		ls_sny_retrieve = 'Select distinct prac_id from pd_basic where prac_id between ' + string(ll_from) + ' and ' + string(ll_to) + ';'
	end if
	
	ls_presentation_str = "style(type=grid)"		
	ls_dwsyntax_str = SQLCA.SyntaxFromSQL(ls_sny_retrieve, ls_presentation_str, ERRORS)
	IF Len(ERRORS) > 0 THEN
		MessageBox("Caution", &
		"SyntaxFromSQL caused these errors: " + ERRORS)
		if IsValid(n_export) then destroy n_export		
		RETURN -1
	END IF
	
	lds_export_retrieve = CREATE n_ds
	lds_export_retrieve.Create( ls_dwsyntax_str, ERRORS)
	lds_export_retrieve.SetTransObject( SQLCA )
	ll_prac_row = lds_export_retrieve.retrieve()
	if ll_prac_row < 1 then 
		if li_type = 3 or li_type = 4 then
			messagebox("Information","No contract rows returned.")
		else
			messagebox("Information","No practitioner rows returned.")
		end if
		if IsValid(n_export) then destroy n_export
		if IsValid(lds_export_retrieve) then destroy lds_export_retrieve
		return -2
	end if

	lds_export_retrieve.Setsort( "#1 A")
	lds_export_retrieve.Sort()
		
	for i = 1 to ll_prac_row
		prac_ids[i] = lds_export_retrieve.getitemnumber(i,1)
	next

	li_type1 = 3
else

	if len(ls_prompt) > 0 then 
		openwithparm(w_export_prompt,ls_prompt)
		ls_prompt = message.stringparm
		if ls_prompt = "Cancel" then
			if IsValid(n_export) then destroy n_export
			if IsValid(lds_export_retrieve) then destroy lds_export_retrieve
			return -1
		else
		//parses the return into separate variables
		ls_parm1 = ""
		ls_parm2 = ""
		ls_parm3 = ""
		
		ls_arg = ls_prompt
		p1 = pos(ls_arg,"*",1)
		ls_parm1 = mid(ls_arg,1,p1 - 1)
		p2 = pos(ls_arg,"*",p1 + 1)
		if p2 > 0 then 
			ls_parm2 = mid(ls_arg,p1 + 1,p2 - p1 - 1)
			if p2 < len(ls_arg) then //check for third param
				ls_parm3 = mid(ls_arg,p2 + 1)
			end if
		end if
		ls_sny_retrieve = n_export.of_prompt_syntax(ls_sny_retrieve,ls_parm1,ls_parm2,ls_parm3)
		end if
	end if

	li_type1 = 1
	ls_SQL = ls_sny_retrieve
	ll_pos = pos(lower(ls_sny_retrieve)," from ")
	ls_temp = Left(ls_sny_retrieve,ll_pos - 1)
	if li_type = 3 or li_type = 4 then		
		if pos(lower(ls_temp), "ctx_id") < 1 then
			MessageBox("Caution","The Contract Retrieval SQL must contain the ctx_id column.")
			if IsValid(n_export) then destroy n_export		
			RETURN -1
		end if
	else
		if pos(lower(ls_temp), "prac_id") < 1 then
			MessageBox("Caution","The Practitioner Retrieval SQL must contain the prac_id column.")
			if IsValid(n_export) then destroy n_export		
			RETURN -1
		end if		
	end if
	
	ls_presentation_str = "style(type=grid)"		
	ls_dwsyntax_str = SQLCA.SyntaxFromSQL(ls_sny_retrieve, ls_presentation_str, ERRORS)
	IF Len(ERRORS) > 0 THEN
		MessageBox("Caution", &
		"SyntaxFromSQL caused these errors: " + ERRORS)
		if IsValid(n_export) then destroy n_export
		RETURN -1
	END IF
	
	lds_export_retrieve = CREATE n_ds
	lds_export_retrieve.Create( ls_dwsyntax_str, ERRORS)
	lds_export_retrieve.SetTransObject( SQLCA )
	ll_prac_row = lds_export_retrieve.retrieve()
	
	if ll_prac_row < 1 then 
		if li_type = 3 or li_type = 4 then
			messagebox("Information","No contract rows returned.")
		else
			messagebox("Information","No practitioner rows returned.")
		end if
		if IsValid(n_export) then destroy n_export
		if IsValid(lds_export_retrieve) then destroy lds_export_retrieve
		return -2
	end if

	lds_export_retrieve.Setsort( "#1 A")
	lds_export_retrieve.Sort()

	for i = 1 to ll_prac_row
		ll_pracid   = lds_export_retrieve.getitemnumber(i,1)
		if ll_pracid <> ll_pracidold and ll_pracid > 0 then 
			ll_Num ++
			prac_ids[ll_Num] = ll_pracid
			ll_pracidold= ll_pracid
		end if
	next
end if

if cbx_savedata.checked and cbx_previewdata.checked then 
	//save & preview
	li_savedata = 3
elseif cbx_previewdata.checked then
	//preview
	li_savedata = 2
elseif cbx_savedata.checked then
	//save
	li_savedata = 1
else
	//do nothing
	li_savedata = 0
end if

n_export.ib_gen_rec_id = False
n_export.ib_standard = true		
//Added By Mark Lee 07/21/2016
n_export.of_set_replace_multi_field_symbol( abn_update_sqltext)
if li_type = 3 or li_type = 4 then
//	i = n_export.of_export_data_with_text_ctx( il_export_id, prac_ids,ls_path,li_savedata,ls_parm1,ls_parm2,ls_parm3,li_type1,ls_SQL )		//Added By Mark Lee 09/29/2013
	i = n_export.of_export_data_with_text_ctx( il_export_id, prac_ids,ls_path,li_savedata,ls_parm1,ls_parm2,ls_parm3,li_type1,ls_SQL, abn_update_sqltext )
else
	i = n_export.of_export_data_with_text( il_export_id, prac_ids,ls_path,li_savedata,ls_parm1,ls_parm2,ls_parm3,li_type1,ls_SQL)	
end if

destroy n_export;
destroy lds_export_retrieve

return 1
end function

public function integer of_save_mulrow (boolean abn_force);//Added By Mark Lee 09/27/2013 move it from cb_save button clicked event.
Integer li_retval
integer r
string s,ls_export_field_name
long recid,ll_row
integer i
integer rc
DataWindowChild dwchild
integer col
long    ll_FieldType//<add> andy 2007.05.24
long ll_last_progress_position
//debugbreak()

//Added By Jay Chen 03-03-2014
string ls_linkfromcolumn,ls_linktocolumn,ls_ctx_column_name,ls_fieldname
long ll_linktoscrnid,ll_ctx_scrn_id,ll_intcred_table,ll_intcred_field

li_retval = tab_1.tabpage_field_data.dw_fld_list.update()
//commit using sqlca;

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 04.10.2007 By: Jack
//$<reason> Fix a defect.
tab_1.tabpage_export_hdr.dw_export_file.accepttext()
tab_1.tabpage_field_data.dw_detail.accepttext()

////Added By Mark Lee 08/01/2013
//if abn_force = true then
//	if ib_export_save = true Then 
////		li_retval = MessageBox(gnv_app.iapp_object.DisplayName,"It may take a few minutes to generate the associated export data when saving the changes.~r~n~r~nDo you want to continue?",Information! ,OKCancel!)
//		li_retval = MessageBox(gnv_app.iapp_object.DisplayName,"It may take a few minutes to generate the associated export data when saving the changes.")		
////		IF li_retval = 2 Then
////			Return 0
////		End If
//	end if 
//end if 

If tab_1.tabpage_export_hdr.dw_export_file.modifiedcount() > 0 Or lb_new Or tab_1.tabpage_field_data.dw_detail.modifiedcount() > 0  Or tab_1.tabpage_field_data.dw_detail.deletedcount() > 0  Then
//---------------------------- APPEON END ----------------------------
	for ll_row = 1 to tab_1.tabpage_field_data.dw_detail.rowcount()
		il_insert_row++
		//<add> andy 2007.05.24
		ll_FieldType   = tab_1.tabpage_field_data.dw_detail.GetItemNumber( ll_row, "export_fields_export_type")
		if ll_FieldType = 3 then
			//check valid and set mle_1.text into export_fields_ctx_column_name 
			if of_check() = -1 then return -1 // Modify by Evan 01.31.2008
		end if
		//end of add
		
		if isnull(tab_1.tabpage_field_data.dw_detail.getItemnumber( ll_row, "rec_id" )) then
			if il_insert_row = 1 then
				recid = of_get_id( )
				il_recid = recid
			else
				il_recid++
			end if
			tab_1.tabpage_field_data.dw_detail.SetItem( ll_row, "rec_id", il_recid )
		end if
		
		//Added By Jay Chen 03-04-2014
		ls_export_field_name = tab_1.tabpage_field_data.dw_detail.getitemstring(ll_row,"export_field_name")
		if isnumber(mid(ls_export_field_name,1,1)) then
			messagebox("Field Name Error","The Export Column Name [" + ls_export_field_name + "] cannot start with a number")
			return -1
		end if
		if gnv_string.of_exists_sql_keyword(ls_export_field_name) < 0 then 
			ls_fieldname = lower(ls_export_field_name) + '_1'
			ls_fieldname = of_build_alias_mulrow(ls_fieldname)
			if len(ls_fieldname) >40 then ls_fieldname = left(ls_fieldname,40)							//Added By Mark Lee 04/15/2015
			tab_1.tabpage_field_data.dw_detail.setitem(ll_row,"export_field_name",ls_fieldname)
			messagebox("Field Name Error","The name you supplied for the current field [" + ls_export_field_name + "] is a SQL key word (reserved word). ~r~nSystem auto set a different name [" + ls_fieldname +"].")	
//			return -1
		end if 
		//end add
	
		testcnt++
		if tab_1.tabpage_field_data.dw_detail.getItemnumber( ll_row, "use_default" ) = 2 then
			tab_1.tabpage_field_data.dw_detail.accepttext()
			col = integer(tab_1.tabpage_field_data.dw_detail.getItemstring( ll_row, "default_value" ))
			//messagebox("col",col)
			if col < 1 or col > tab_1.tabpage_field_data.dw_fld_list.rowcount() then
				//messagebox("Invalid setting","You are using a column default this column, but your default value is not a valid column number")
  				messagebox("Invalid setting","You are using a column default for this column, but your default value is not a valid column number")
				return -1 // Modify by Evan 01.31.2008
			end if
		end if
	
	
		//--------------------------- APPEON BEGIN ---------------------------
		//$<add> 2006-11-28 By: Rodger Wu
		integer li_module_type, li_getrow, li_ctx_uselink
		string ls_modify
	
		li_module_type = tab_1.tabpage_field_data.dw_detail.GetItemNumber( ll_row, "export_fields_module_type" )
		li_ctx_uselink = tab_1.tabpage_field_data.dw_detail.GetItemNumber( ll_row, "export_fields_ctx_uselink" )
		if isnull( li_ctx_uselink ) then li_ctx_uselink = 0
		if li_module_type = 3 or li_module_type = 4 then 
			//Modified By Jay Chen 03-03-2014
			/**********
			ls_modify = "intcred_table.dddw.Required = 'No' intcred_field.dddw.Required = 'No' " + &
							"export_fields_ctx_scrn_id.dddw.Required = 'Yes' export_fields_ctx_column_name.dddw.Required = 'Yes'"
			**********/
			ls_ctx_column_name = tab_1.tabpage_field_data.dw_detail.GetItemString( ll_row, "export_fields_ctx_column_name" )
			ll_ctx_scrn_id = tab_1.tabpage_field_data.dw_detail.GetItemNumber( ll_row, "export_fields_ctx_scrn_id" )
			if isnull(ls_ctx_column_name) then ls_ctx_column_name = ''
			if isnull(ll_ctx_scrn_id) then ll_ctx_scrn_id = 0
			if ls_ctx_column_name = '' then
				MessageBox("Information","The value for Contract Logix Field is required for row " + string (ll_row))
			end if
			if ll_ctx_scrn_id = 0 then
				MessageBox("Information","The value for Contract Logix Screen is required for row " + string (ll_row))
			end if
			
			if li_ctx_uselink = 0 then
				/***************
				ls_modify += " export_fields_ctx_linkfromcolumn.dddw.Required = 'No' export_fields_ctx_linktoscrnid.dddw.Required = 'No'" + &
								 " export_fields_ctx_linktocolumn.dddw.Required = 'No'"
				**************/
			else
				/*******
				ls_modify += " export_fields_ctx_linkfromcolumn.dddw.Required = 'Yes' export_fields_ctx_linktoscrnid.dddw.Required = 'Yes'" + &
								 " export_fields_ctx_linktocolumn.dddw.Required = 'Yes'"
				********/
				ls_linkfromcolumn = tab_1.tabpage_field_data.dw_detail.GetItemString( ll_row, "export_fields_ctx_linkfromcolumn" )
				ls_linktocolumn = tab_1.tabpage_field_data.dw_detail.GetItemString( ll_row, "export_fields_ctx_linktocolumn" )
				ll_linktoscrnid = tab_1.tabpage_field_data.dw_detail.GetItemNumber( ll_row, "export_fields_ctx_linktoscrnid" )
				if isnull(ls_linkfromcolumn) then ls_linkfromcolumn = ''
				if isnull(ls_linktocolumn) then ls_linktocolumn = ''
				if isnull(ll_linktoscrnid) then ll_linktoscrnid = 0
				if ls_linkfromcolumn = '' then
					MessageBox("Information","The value for Link From is required for row " + string (ll_row))
				end if
				if ls_linktocolumn = '' then
					MessageBox("Information","The value for Link To Column is required for row " + string (ll_row))
				end if
				if ll_linktoscrnid = 0 then
					MessageBox("Information","The value for Link To Screen is required for row " + string (ll_row))
				end if
			end if
		else
			/***********
			ls_modify = "intcred_table.dddw.Required = 'Yes' intcred_field.dddw.Required = 'Yes' " + &
							"export_fields_ctx_scrn_id.dddw.Required = 'No' export_fields_ctx_column_name.dddw.Required = 'No' " + &
							"export_fields_ctx_linkfromcolumn.dddw.Required = 'No' export_fields_ctx_linktoscrnid.dddw.Required = 'No' " + &
							"export_fields_ctx_linktocolumn.dddw.Required = 'No'"
			**********/
			ll_intcred_table =  tab_1.tabpage_field_data.dw_detail.GetItemNumber( ll_row, "intcred_table" )
			ll_intcred_field =  tab_1.tabpage_field_data.dw_detail.GetItemNumber( ll_row, "intcred_field" )
			if isnull(ll_intcred_table) then ll_intcred_table = 0
			if isnull(ll_intcred_field) then ll_intcred_field = 0
			if ll_intcred_table = 0 then
				MessageBox("Information","The value for IntelliCred Table is required for row " + string (ll_row))
			end if
			if ll_intcred_field = 0 then
				MessageBox("Information","The value for IntelliCred Field is required for row " + string (ll_row))
			end if
		end if
		
		ls_modify += " intcred_table.dddw.Required = 'No' intcred_field.dddw.Required = 'No' " + &
						  " export_fields_ctx_scrn_id.dddw.Required = 'No' export_fields_ctx_column_name.dddw.Required = 'No'" + &
						  " export_fields_ctx_linkfromcolumn.dddw.Required = 'No' export_fields_ctx_linktoscrnid.dddw.Required = 'No'" + &
						  " export_fields_ctx_linktocolumn.dddw.Required = 'No'"
		tab_1.tabpage_field_data.dw_detail.modify( ls_modify )

		//---------------------------- APPEON END ----------------------------
	
		//--------------------------- APPEON BEGIN ---------------------------
		//$<add> 04.10.2007 By: Jack
		string ls_export_field_name1
		int li_pos,li_num
		long ll_rec_id,ll_rec_id1
		boolean lb_duplicates = False
		
		ls_export_field_name = tab_1.tabpage_field_data.dw_detail.getitemstring(ll_row,'export_field_name')
		if Not of_Field_Name_Check(ls_export_field_name) then
			MessageBox("Invalid Column Name","Column Name is invalid.~r~n~r~nColumn Name must start with a letter, can include any combination of~r~nletters, numbers, and underscores.")
			Return -1
		end if
		If tab_1.tabpage_field_data.dw_detail.describe( "lu_field_name.visible" )  = '1' Then
			If IsNull( tab_1.tabpage_field_data.dw_detail.getitemstring(ll_row,'lu_field_name') ) Or Trim( tab_1.tabpage_field_data.dw_detail.getitemstring(ll_row,'lu_field_name') ) = '' Then
				messagebox("Invalid setting","Value is not a valid in 'Lookup Table Field'.")
				Return -1			
			End If
		End If
		/*
		li_pos = pos(trim(ls_export_field_name),' ')
		If li_pos > 0 Then
			messagebox("Invalid Column Name","Field name cannot contain space.")
			tab_1.tabpage_field_data.dw_detail.setfocus()
			tab_1.tabpage_field_data.dw_detail.setcolumn('export_field_name')
			Return -1
		End If
		*/
		ll_rec_id = tab_1.tabpage_field_data.dw_detail.getitemnumber(ll_row,'rec_id')
		If isnull(ll_rec_id) Then ll_rec_id = 0
		For i = 1 To tab_1.tabpage_field_data.dw_fld_list.rowcount()
			ls_export_field_name1 = tab_1.tabpage_field_data.dw_fld_list.getitemstring(i,'export_field_name')
			ll_rec_id1 = tab_1.tabpage_field_data.dw_fld_list.getitemnumber(i,'rec_id')		
			If lower(ls_export_field_name1) = lower(ls_export_field_name) And ll_rec_id1 <> ll_rec_id Then //Modified By Jay Chen 08-18-2014
				lb_duplicates = True
				exit
			End If
		Next
		If lb_duplicates Then
			//messagebox("Invalid Column Name","Field name cannot duplicates.")
 			messagebox("Invalid Column Name","Field name cannot be duplicate.")
			tab_1.tabpage_field_data.dw_detail.setfocus()
			tab_1.tabpage_field_data.dw_detail.setcolumn('export_field_name')
			Return -1 // Modify by Evan 01.31.2008
		End If
	 
	 //Added By Jay Chen 05-28-2014
	 if isvalid(w_auto_add_fields) then
		ll_last_progress_position = w_auto_add_fields.il_last_progress_position + 0.5 * (round(ll_row / tab_1.tabpage_field_data.dw_detail.rowcount(),2)  * 100)
		w_auto_add_fields.progress_bar.uf_set_position (ll_last_progress_position)
	end if
next
	//---------------------------- APPEON END ----------------------------
	
	
	li_retval = Event pfc_Save()
	
	//Added By Jay Chen 03-03-2014 Remark: restore the dddw's required property
	ll_row = tab_1.tabpage_field_data.dw_detail.getrow()
	ls_modify = ''
	if ll_row < 1 then return -1
	li_module_type = tab_1.tabpage_field_data.dw_detail.GetItemNumber( ll_row, "export_fields_module_type" )
	li_ctx_uselink = tab_1.tabpage_field_data.dw_detail.GetItemNumber( ll_row, "export_fields_ctx_uselink" )
	if isnull( li_ctx_uselink ) then li_ctx_uselink = 0
	if li_module_type = 3 or li_module_type = 4 then
		ls_modify = "intcred_table.dddw.Required = 'No' intcred_field.dddw.Required = 'No' " + &
						"export_fields_ctx_scrn_id.dddw.Required = 'Yes' export_fields_ctx_column_name.dddw.Required = 'Yes'"
		if li_ctx_uselink = 0 then
			ls_modify += " export_fields_ctx_linkfromcolumn.dddw.Required = 'No' export_fields_ctx_linktoscrnid.dddw.Required = 'No'" + &
							 " export_fields_ctx_linktocolumn.dddw.Required = 'No'"
		else
			ls_modify += " export_fields_ctx_linkfromcolumn.dddw.Required = 'Yes' export_fields_ctx_linktoscrnid.dddw.Required = 'Yes'" + &
								" export_fields_ctx_linktocolumn.dddw.Required = 'Yes'"
		end if
	else
		ls_modify = "intcred_table.dddw.Required = 'Yes' intcred_field.dddw.Required = 'Yes' " + &
						"export_fields_ctx_scrn_id.dddw.Required = 'No' export_fields_ctx_column_name.dddw.Required = 'No' " + &
						"export_fields_ctx_linkfromcolumn.dddw.Required = 'No' export_fields_ctx_linktoscrnid.dddw.Required = 'No' " + &
						"export_fields_ctx_linktocolumn.dddw.Required = 'No'"
	end if
	tab_1.tabpage_field_data.dw_detail.modify( ls_modify )
	
	
	IF li_retval < 0 THEN
		Return li_retval // Modify by Evan 01.31.2008
	END IF
	
	//Begin - Added By Mark Lee 08/01/2013.	check the update data for export store procedure
	pfc_n_cst_ai_export_apb  n_export
	n_export = CREATE pfc_n_cst_ai_export_apb
	li_retval =	n_export.of_update_export_data( il_export_id)
	Destroy n_export
	ib_export_save = true
	//End - Added By Mark Lee 08/01/2013.	
		
	//--------------------------- APPEON BEGIN ---------------------------
	//$<add> 05.23.2007 By: Jack
	//$<reason> Fix a defect.
	dw_select.event constructor()	
	//---------------------------- APPEON END ----------------------------
	
//	dw_select.GetChild( "export_id", dwchild )
//	dwchild.settransobject(sqlca)
//	dwchild.retrieve()
	recid = il_recid
	rc = tab_1.tabpage_field_data.dw_fld_list.retrieve(il_export_id)
	s = "rec_id = " + string(recid)
	of_reset_find_filed_name(il_export_id)													//Added By Mark Lee 08/06/2015
		
	//find the current row and set it
	r = tab_1.tabpage_field_data.dw_fld_list.find(s,1,rc)
	
	if r > 0 then 
		tab_1.tabpage_field_data.dw_fld_list.scrolltorow(r)
		tab_1.tabpage_field_data.dw_fld_list.setrow(r)
	end if
		
	if lb_new = true then //remodified maha 081104
		//messagebox("","new")
	//	dw_select.retrieve()
		dw_select.GetChild( "export_id", dwchild )
		dwchild.settransobject(sqlca)
		rc = dwchild.retrieve()
		s = "export_id = " + string(il_export_id)
		
		//find the current row and set it
		r = dwchild.find(s,1,rc)
		
		if r > 0 then 
			dwchild.scrolltorow(r)
			dwchild.setrow(r)
		else
			dw_select.insertrow(1)
			//messagebox("il_export_id",il_export_id)
		end if	
		dw_select.setitem(dw_select.getrow(),'export_id',il_export_id)  //Add 04.27.2007 by Jack
		
		//dwchild.insertrow(1)
		//dw_select.retrieve()
	end if
	
	lb_new = false
	tab_1.tabpage_field_data.st_next.text = "Next Col " + (string(tab_1.tabpage_field_data.dw_fld_list.rowcount()+ 1))

End If

//Begin - Added By Mark Lee 08/01/2013.	check the update data for export store procedure
if abn_force = true then 
	if ib_export_save = true then 
		//update sqltext syntax
//		cb_test.event clicked( )
		of_create_export(true)
		ib_export_save = false		
	end if 
end if 
//End - Added By Mark Lee 07/31/2013.

tab_1.tabpage_field_data.dw_detail.Modify("b_edit.visible = true ") //Added By Jay Chen 07-31-2014

il_insert_row = 0

Return 1 // Add by Evan 01.31.2008
end function

public function string of_build_alias_mulrow (string as_label);//====================================================================
// Function: of_build_alias_mulrow
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value    string    as_label
//--------------------------------------------------------------------
// Returns:  string
//--------------------------------------------------------------------
// Author:	Jay Chen		Date: 03-04-2014
//--------------------------------------------------------------------
//	Copyright (c) 2008-2013 ContractLogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

string ls_alias
int li_i,li_count
string ls_char
string ls_other_alias
boolean lb_duplicates
int li_pos
string ls_num
long ll_row

ls_alias = as_label
//More than 40
if len(ls_alias) > 40 then ls_alias = left(ls_alias,40)

//Replace first char to 'c'
if not ((Asc(ls_alias)>=65 and Asc(ls_alias) <= 90) or (Asc(ls_alias)>=97 and Asc(ls_alias) <= 122))  then
	ls_alias = Replace(ls_alias,1,1,'c')
end if

//if = column then change to column_c

//Replact to '_'(0-9,a-z,A-Z,_)
li_count = len(ls_alias)
for li_i = 1 to li_count
	ls_char = mid(ls_alias,li_i,1)
	if not ((Asc(ls_char)>=48 and Asc(ls_char) <= 57) or (Asc(ls_char)>=65 and Asc(ls_char) <= 90) or (Asc(ls_char)>=97 and Asc(ls_char) <= 122)) and ls_char <> '_' then
		ls_alias = Replace(ls_alias,li_i,1,'_')
	end if
next

if isvalid(w_auto_add_fields) then
	w_auto_add_fields.ids_field_name.setsort("export_field_name A")
	w_auto_add_fields.ids_field_name.sort()
	For li_i = 1 To w_auto_add_fields.ids_field_name.rowcount() 
		ls_other_alias = w_auto_add_fields.ids_field_name.getitemstring(li_i,'export_field_name')
		If lower(ls_other_alias) = lower(ls_alias) Then
			li_pos = lastpos(ls_alias,"_")
			if li_pos  > 0 then
				ls_num = mid(ls_alias,li_pos + 1)
				if isnumber(ls_num) then
					ls_alias = mid(ls_alias,1,li_pos) + string(integer(ls_num) + 1)
				else
					ls_alias = ls_alias + "_1"
				end if
			else
				ls_alias = ls_alias + "_1"
			end if
			li_i = 0
		End If
	Next
end if


return ls_alias
end function

public subroutine of_reset_find_filed_name (long al_export_id);//====================================================================
// Function: of_reset_find_filed_name
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:	Mark Lee		Date: 08/06/2015
//--------------------------------------------------------------------
//	Copyright (c) 2008-2015 Contractlogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
DatawindowChild			ldwc_name
long							ll_export_id 

tab_1.tabpage_field_data.dw_findcolumn.reset()	
tab_1.tabpage_field_data.dw_findcolumn.insertrow(0)		
tab_1.tabpage_field_data.dw_findcolumn.getchild("export_column_name",ldwc_name)
ldwc_name.settransobject( sqlca)
ldwc_name.retrieve(al_export_id )
						 
end subroutine

on w_export_painter.create
int iCurrent
call super::create
this.cb_3=create cb_3
this.cb_batch_update=create cb_batch_update
this.sle_rep=create sle_rep
this.sle_tc=create sle_tc
this.sle_tt=create sle_tt
this.cb_2=create cb_2
this.gb_1=create gb_1
this.cb_new=create cb_new
this.cb_save=create cb_save
this.cb_quit=create cb_quit
this.cb_auto=create cb_auto
this.cb_test=create cb_test
this.cb_delete=create cb_delete
this.cbx_open=create cbx_open
this.dw_select=create dw_select
this.cbx_previewdata=create cbx_previewdata
this.st_field=create st_field
this.cbx_savedata=create cbx_savedata
this.st_field1=create st_field1
this.tab_1=create tab_1
this.dw_screen=create dw_screen
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_3
this.Control[iCurrent+2]=this.cb_batch_update
this.Control[iCurrent+3]=this.sle_rep
this.Control[iCurrent+4]=this.sle_tc
this.Control[iCurrent+5]=this.sle_tt
this.Control[iCurrent+6]=this.cb_2
this.Control[iCurrent+7]=this.gb_1
this.Control[iCurrent+8]=this.cb_new
this.Control[iCurrent+9]=this.cb_save
this.Control[iCurrent+10]=this.cb_quit
this.Control[iCurrent+11]=this.cb_auto
this.Control[iCurrent+12]=this.cb_test
this.Control[iCurrent+13]=this.cb_delete
this.Control[iCurrent+14]=this.cbx_open
this.Control[iCurrent+15]=this.dw_select
this.Control[iCurrent+16]=this.cbx_previewdata
this.Control[iCurrent+17]=this.st_field
this.Control[iCurrent+18]=this.cbx_savedata
this.Control[iCurrent+19]=this.st_field1
this.Control[iCurrent+20]=this.tab_1
this.Control[iCurrent+21]=this.dw_screen
end on

on w_export_painter.destroy
call super::destroy
destroy(this.cb_3)
destroy(this.cb_batch_update)
destroy(this.sle_rep)
destroy(this.sle_tc)
destroy(this.sle_tt)
destroy(this.cb_2)
destroy(this.gb_1)
destroy(this.cb_new)
destroy(this.cb_save)
destroy(this.cb_quit)
destroy(this.cb_auto)
destroy(this.cb_test)
destroy(this.cb_delete)
destroy(this.cbx_open)
destroy(this.dw_select)
destroy(this.cbx_previewdata)
destroy(this.st_field)
destroy(this.cbx_savedata)
destroy(this.st_field1)
destroy(this.tab_1)
destroy(this.dw_screen)
end on

event open;call super::open;integer i
String 		ls_pos




if w_mdi.of_security_access( 1420 ) = 0 then ////Start Code Change ----01.04.2008 #V8 maha
	cb_auto.visible = false
end if

//dw_select.of_SetUpdateAble( False )
dw_select.SetTransObject( SQLCA )
dw_select.retrieve()
dw_select.InsertRow( 1 )

dw_select.SetFocus()

tab_1.enabled = false

////Begin - Added By Mark Lee 07/19/2013.
//ls_pos = gnv_user_option.of_Get_option_value(gs_user_id, "w_export_painter_st_vbar_export.x" )
//gnv_string.of_convert_numeric_for_language( ls_pos)			
//If not isnull(ls_pos) and trim(ls_pos)  <> '' and  IsNumber(ls_pos) Then 
//	this.tab_1.tabpage_field_data.st_vbar_export.x =  Dec(ls_pos)  *  this.tab_1.tabpage_field_data.width
//End If
//this.tab_1.tabpage_field_data.dw_fld_list.width = this.tab_1.tabpage_field_data.st_vbar_export.x - this.tab_1.tabpage_field_data.dw_fld_list.x
//this.tab_1.tabpage_field_data.dw_detail.x =  this.tab_1.tabpage_field_data.st_vbar_export.x + this.tab_1.tabpage_field_data.st_vbar_export.width
//this.tab_1.tabpage_field_data.dw_detail.width = this.tab_1.tabpage_field_data.width - this.tab_1.tabpage_field_data.dw_detail.x 
////End - Added By Mark Lee 07/19/2013.

/*
<add> andy 2007.06.04
Update the data type of the export column 
where the data type is null(only execute one time),
in order to resolve the history data.
Because the data type is very important for Calculated fields.
*/
//comment 07/12/2007 by: Andy optimize
//Move to dw_select.itemchanged event
//of_updatehistorydata()
//end of add

//messagebox("",string(inv_resize.scale))

//==============================APPEON BEGIN==========================
// $<Added>:   Date: Nov 01,2007       Author:Nova
// $<reason>   Fix a defect.
//--------------------------------------------------------------------
of_setresize(true)
inv_resize.of_setminsize( this.workspacewidth( ) , this.WorkSpaceHeight()	)
inv_resize.of_setorigsize( this.workspacewidth() ,this.WorkSpaceHeight())
//inv_resize.of_setminsize( this.width , this.Height)

//$<comment> 04.22.2008  
//inv_resize.of_register( this.cb_save ,inv_resize.fixedright )//fixedrightbottom
//inv_resize.of_register( this.cb_auto ,inv_resize.fixedright )
//inv_resize.of_register( this.cb_quit ,inv_resize.fixedright )
//inv_resize.of_register( this.cb_test ,inv_resize.fixedright )
////inv_resize.of_register( this.cb_3 ,inv_resize.fixedrightbottom )

////inv_resize.of_register( this.tab_1.tabpage_field_data.cb_1 ,inv_resize.scale )
//inv_resize.of_register( this.cbx_open ,inv_resize.fixedright )//fixedbottom
//inv_resize.of_register( this.cbx_previewdata ,inv_resize.fixedright )
//inv_resize.of_register( this.cbx_savedata ,inv_resize.fixedright )
//
inv_resize.of_register( tab_1,inv_resize.scalerightbottom )

inv_resize.of_register( tab_1.tabpage_export_hdr.dw_export_file, inv_resize.scalerightbottom )
inv_resize.of_register( tab_1.tabpage_field_data.dw_detail, inv_resize.scalerightbottom )
inv_resize.of_register( tab_1.tabpage_field_data.dw_fld_list, inv_resize.scalebottom )
inv_resize.of_register( this.tab_1.tabpage_field_data.cb_1 ,inv_resize.fixedbottom )
inv_resize.of_register( this.tab_1.tabpage_field_data.st_1 ,inv_resize.fixedbottom )
inv_resize.of_register( this.tab_1.tabpage_field_data.mle_1 ,inv_resize.fixedbottom )
inv_resize.of_register( this.tab_1.tabpage_field_data.cb_4 ,inv_resize.fixedbottom )
inv_resize.of_register( this.tab_1.tabpage_field_data.st_vbar_export ,inv_resize.scalebottom )					//Added By Mark Lee 07/19/2013
//==============================APPEON END============================

//Post wf_resize_tab()				//Added By Mark Lee 07/19/2013
end event

event close;//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 04.23.2007 By: Jack
//$<reason> Fix a defect.

//---------------------------- APPEON END ----------------------------

end event

event closequery;//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 04.23.2007 By: Jack
//$<reason> Fix a defect.
If ib_closestatus = False Then
   cb_quit.event clicked() 
End If
//---------------------------- APPEON END ----------------------------

end event

event resize;call super::resize;
//////////////////////////////////////////////////////////////////////////////////////////////////////
//// resize script for w_export_painter
//////////////////////////////////////////////////////////////////////////////////////////////////////
////==============================APPEON BEGIN==========================
//// $<Added>:   Date: Nov 01,2007       Author:Nova
////--------------------------------------------------------------------
//// $<reason>   Fix a defect.
//double ratiow, ratio, ratioh
//int rc
//// recalculate the new ratios and then use the minimum
//if ib_exec then  // Check to see if wf_resize_it is already running.
//	ratioh = this.height /ii_win_height
//	ratiow = this.width / ii_win_width
//	ratio = min(ratioh, ratiow)
//	rc = wf_resize_it(ratio)
//end if
////==============================APPEON END============================
//
//windowobject lwo_temp[]
//n_cst_resize lnvo_resize
//
//lnvo_resize = create n_cst_resize
//lwo_temp[1] = tab_1.tabpage_export_hdr.dw_export_file
//lnvo_resize.of_resize(lwo_temp,handle(this))
//destroy lnvo_resize
//

//Begin - Added By Mark Lee 07/19/2013. move to wf_resize_tab() function.
//tab_1.tabpage_field_data.dw_detail.Object.sort_by.X
//tab_1.tabpage_field_data.cb_1.x=long(tab_1.tabpage_field_data.dw_detail.Object.sort_by.X) +tab_1.tabpage_field_data.dw_fld_list.width+50
//tab_1.tabpage_field_data.st_1.y=tab_1.tabpage_field_data.dw_detail.y + long(tab_1.tabpage_field_data.dw_detail.Object.gb_1.y) + 80
//tab_1.tabpage_field_data.mle_1.y = tab_1.tabpage_field_data.st_1.y + tab_1.tabpage_field_data.st_1.height + 10
//tab_1.tabpage_field_data.cb_4.y = tab_1.tabpage_field_data.mle_1.y 
//tab_1.tabpage_field_data.mle_1.width = long(tab_1.tabpage_field_data.dw_detail.Object.gb_1.width) - 140
//tab_1.tabpage_field_data.mle_1.height = long(tab_1.tabpage_field_data.dw_detail.Object.gb_1.height) - 150
//tab_1.tabpage_field_data.cb_4.x = tab_1.tabpage_field_data.mle_1.x + tab_1.tabpage_field_data.mle_1.width + 10
//End - Added By Mark Lee 07/19/2013.
wf_resize_tab()				//Added By Mark Lee 07/19/2013
end event

event activate;call super::activate;//--------------------------- APPEON BEGIN ---------------------------
//$<  Add > 2007-11-06 By: Scofield
//$<Reason> Change to m_pfe_cst_mdi_menu menu

If w_mdi.menuname <> "m_pfe_cst_mdi_menu" Then
	w_mdi.ChangeMenu( m_pfe_cst_mdi_menu )
	w_mdi.of_menu_security( w_mdi.MenuName )
END IF
//---------------------------- APPEON END ----------------------------

end event

event pfc_postopen;call super::pfc_postopen;//Begin - Added By Mark Lee 07/19/2013.
string 		ls_pos
ls_pos = gnv_user_option.of_Get_option_value(gs_user_id, "w_export_painter_st_vbar_export.x" )
gnv_string.of_convert_numeric_for_language( ls_pos)			
If not isnull(ls_pos) and trim(ls_pos)  <> '' and  IsNumber(ls_pos) Then 
	this.tab_1.tabpage_field_data.st_vbar_export.x =  Dec(ls_pos)  *  this.tab_1.tabpage_field_data.width
End If
this.tab_1.tabpage_field_data.dw_fld_list.width = this.tab_1.tabpage_field_data.st_vbar_export.x - this.tab_1.tabpage_field_data.dw_fld_list.x
this.tab_1.tabpage_field_data.dw_detail.x =  this.tab_1.tabpage_field_data.st_vbar_export.x + this.tab_1.tabpage_field_data.st_vbar_export.width
this.tab_1.tabpage_field_data.dw_detail.width = this.tab_1.tabpage_field_data.width - this.tab_1.tabpage_field_data.dw_detail.x 

wf_resize_tab()				//Added By Mark Lee 07/19/2013
//End - Added By Mark Lee 07/19/2013.


end event

type cb_3 from commandbutton within w_export_painter
integer x = 3282
integer y = 48
integer width = 302
integer height = 84
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Validate"
end type

event clicked;Long prac_ids[]
string ls_presentation_str
string ls_sny_retrieve
string ls_dwsyntax_str
string ERRORS
string ls_path
long ll_prac_row
n_ds lds_export_retrieve
long ll_from
long ll_to
string ls_return
long i
long ic
long ll_pracid
integer li_savedata = 0
string ls_prompt1
string ls_prompt2
string ls_prompt3
string ls_prompt
string ls_arg
string ls_parm1 = ""
string ls_parm2 = ""
string ls_parm3 = ""
integer p1
integer p2
integer p3
String  ls_Temp1,ls_Temp2
String  ls_name
Long    ll_pracidold = -1
Long    ll_Num = 0,ll_pos
integer li_type1
String  ls_SQL = '',ls_temp
integer li_type
pfc_n_cst_ai_export_apb  n_export

//Added By Mark 06/11/2014
If tab_1.tabpage_export_hdr.dw_export_file.Modifiedcount( )  > 0 Then
	i = messagebox(gnv_app.iapp_object.DisplayName,"The data need to be saved before you can run the current step. ~r~n~r~nClick Yes to save the data automatically.",Question!, YesNo!)
	if i =1 then 
		if of_save( false) <= 0 then
			return 0
		End if 
	else
		Return 0	
	End if
End If

n_export = CREATE pfc_n_cst_ai_export_apb

il_export_id = dw_select.getitemnumber(dw_select.getrow(),'export_id')
If	tab_1.tabpage_field_data.dw_fld_list.rowcount() < 1 Then
	messagebox("Export error","No Export Column.")
	if IsValid(n_export) then destroy n_export
	Return 0
End If

if isnull(il_export_id) or il_export_id < 1 then
	messagebox("Select error","Please select an export.")
	if IsValid(n_export) then destroy n_export
	return 0
end if

ls_path = tab_1.tabpage_export_hdr.dw_export_file.getitemstring(1,"save_path")
ls_sny_retrieve = tab_1.tabpage_export_hdr.dw_export_file.getitemstring(1,"prac_sql")
ls_prompt1 = tab_1.tabpage_export_hdr.dw_export_file.getitemstring(1,"prompt_type1")
ls_prompt2 = tab_1.tabpage_export_hdr.dw_export_file.getitemstring(1,"prompt_type2")
ls_prompt3 = tab_1.tabpage_export_hdr.dw_export_file.getitemstring(1,"prompt_type3")

choose case ls_prompt1
	case "C","D","N"
		ls_prompt = ls_prompt1
end choose
choose case ls_prompt2
	case "C","D","N"
		ls_prompt += "*" + ls_prompt2
end choose
choose case ls_prompt3
	case "C","D","N"
		ls_prompt += "*" + ls_prompt3
end choose

li_type = tab_1.tabpage_export_hdr.dw_export_file.GetItemNumber( 1, "export_type" )
IF isnull(ls_sny_retrieve) or trim(ls_sny_retrieve) = "" then
	open(w_export_test_param)
	ls_return = message.stringparm
	
	if ls_return = "Cancel" then
		if IsValid(n_export) then destroy n_export
		return 0
	end if
	
	ll_from = long(mid(ls_return,1,pos(ls_return,"@") - 1))
	ll_to = long(mid(ls_return,pos(ls_return,"@") + 1))
	ic = ll_to - ll_from + 1
	if ic < 0 then
		messagebox("Input Error","The To value must be greater than the From value.")
		if IsValid(n_export) then destroy n_export
		return 0
	end if

	if li_type = 3 or li_type = 4 then
		ls_sny_retrieve = 'Select distinct ctx_id from ctx_basic_info where ctx_id between ' + string(ll_from) + ' and ' + string(ll_to) + ';'
	else
		ls_sny_retrieve = 'Select distinct prac_id from pd_basic where prac_id between ' + string(ll_from) + ' and ' + string(ll_to) + ';'
	end if
	
	ls_presentation_str = "style(type=grid)"		
	ls_dwsyntax_str = SQLCA.SyntaxFromSQL(ls_sny_retrieve, ls_presentation_str, ERRORS)
	IF Len(ERRORS) > 0 THEN
		MessageBox("Caution", &
		"SyntaxFromSQL caused these errors: " + ERRORS)
		if IsValid(n_export) then destroy n_export		
		RETURN -1
	END IF
	
	lds_export_retrieve = CREATE n_ds
	lds_export_retrieve.Create( ls_dwsyntax_str, ERRORS)
	lds_export_retrieve.SetTransObject( SQLCA )
	ll_prac_row = lds_export_retrieve.retrieve()
	if ll_prac_row < 1 then 
		if li_type = 3 or li_type = 4 then
			messagebox("Information","No contract rows returned.")
		else
			messagebox("Information","No practitioner rows returned.")
		end if
		if IsValid(n_export) then destroy n_export
		if IsValid(lds_export_retrieve) then destroy lds_export_retrieve
		return -2
	end if

	lds_export_retrieve.Setsort( "#1 A")
	lds_export_retrieve.Sort()
		
	for i = 1 to ll_prac_row
		prac_ids[i] = lds_export_retrieve.getitemnumber(i,1)
	next

	li_type1 = 3
else

	if len(ls_prompt) > 0 then 
		openwithparm(w_export_prompt,ls_prompt)
		ls_prompt = message.stringparm
		if ls_prompt = "Cancel" then
			if IsValid(n_export) then destroy n_export
			if IsValid(lds_export_retrieve) then destroy lds_export_retrieve
			return -1
		else
		//parses the return into separate variables
		ls_parm1 = ""
		ls_parm2 = ""
		ls_parm3 = ""
		
		ls_arg = ls_prompt
		p1 = pos(ls_arg,"*",1)
		ls_parm1 = mid(ls_arg,1,p1 - 1)
		p2 = pos(ls_arg,"*",p1 + 1)
		if p2 > 0 then 
			ls_parm2 = mid(ls_arg,p1 + 1,p2 - p1 - 1)
			if p2 < len(ls_arg) then //check for third param
				ls_parm3 = mid(ls_arg,p2 + 1)
			end if
		end if
		ls_sny_retrieve = n_export.of_prompt_syntax(ls_sny_retrieve,ls_parm1,ls_parm2,ls_parm3)
		end if
	end if

	li_type1 = 1
	ls_SQL = ls_sny_retrieve
	ll_pos = pos(lower(ls_sny_retrieve)," from ")
	ls_temp = Left(ls_sny_retrieve,ll_pos - 1)
	if li_type = 3 or li_type = 4 then		
		if pos(lower(ls_temp), "ctx_id") < 1 then
			MessageBox("Caution","The Contract Retrieval SQL must contain the ctx_id column.")
			if IsValid(n_export) then destroy n_export		
			RETURN -1
		end if
	else
		if pos(lower(ls_temp), "prac_id") < 1 then
			MessageBox("Caution","The Practitioner Retrieval SQL must contain the prac_id column.")
			if IsValid(n_export) then destroy n_export		
			RETURN -1
		end if		
	end if
	
	ls_presentation_str = "style(type=grid)"		
	ls_dwsyntax_str = SQLCA.SyntaxFromSQL(ls_sny_retrieve, ls_presentation_str, ERRORS)
	IF Len(ERRORS) > 0 THEN
		MessageBox("Caution", &
		"SyntaxFromSQL caused these errors: " + ERRORS)
		if IsValid(n_export) then destroy n_export
		RETURN -1
	END IF
	
	lds_export_retrieve = CREATE n_ds
	lds_export_retrieve.Create( ls_dwsyntax_str, ERRORS)
	lds_export_retrieve.SetTransObject( SQLCA )
	ll_prac_row = lds_export_retrieve.retrieve()
	
	if ll_prac_row < 1 then 
		if li_type = 3 or li_type = 4 then
			messagebox("Information","No contract rows returned.")
		else
			messagebox("Information","No practitioner rows returned.")
		end if
		if IsValid(n_export) then destroy n_export
		if IsValid(lds_export_retrieve) then destroy lds_export_retrieve
		return -2
	end if

	lds_export_retrieve.Setsort( "#1 A")
	lds_export_retrieve.Sort()

	for i = 1 to ll_prac_row
		ll_pracid   = lds_export_retrieve.getitemnumber(i,1)
		if ll_pracid <> ll_pracidold and ll_pracid > 0 then 
			ll_Num ++
			prac_ids[ll_Num] = ll_pracid
			ll_pracidold= ll_pracid
		end if
	next
end if

if cbx_savedata.checked and cbx_previewdata.checked then 
	//save & preview
	li_savedata = 3
elseif cbx_previewdata.checked then
	//preview
	li_savedata = 2
elseif cbx_savedata.checked then
	//save
	li_savedata = 1
else
	//do nothing
	li_savedata = 0
end if

n_export.ib_gen_rec_id = False
n_export.ib_standard = true		
if li_type = 3 or li_type = 4 then
//	i = n_export.of_export_data_with_text_ctx( il_export_id, prac_ids,ls_path,li_savedata,ls_parm1,ls_parm2,ls_parm3,li_type1,ls_SQL )		//Added By Mark Lee 09/29/2013
	i = n_export.of_export_data_with_text_ctx( il_export_id, prac_ids,ls_path,li_savedata,ls_parm1,ls_parm2,ls_parm3,li_type1,ls_SQL, false, true )
else
	i = n_export.of_export_data_with_text( il_export_id, prac_ids,ls_path,li_savedata,ls_parm1,ls_parm2,ls_parm3,li_type1,ls_SQL)	
end if

destroy n_export;
destroy lds_export_retrieve

return 1
end event

type cb_batch_update from commandbutton within w_export_painter
integer x = 2021
integer y = 48
integer width = 539
integer height = 84
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Batch Update Request"
end type

event clicked;string 	ls_message
//of_batch_update_export_data

Open(w_export_batch_select)

ls_message = Message.stringparm

if not isnull(ls_message) and trim(ls_message) <> '' then
	pfc_n_cst_ai_export_apb  n_export
	n_export = CREATE pfc_n_cst_ai_export_apb
	n_export.of_batch_update_export_data(ls_message)
	
	Destroy n_export
end if
end event

type sle_rep from singlelineedit within w_export_painter
boolean visible = false
integer x = 4389
integer y = 368
integer width = 343
integer height = 92
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type sle_tc from singlelineedit within w_export_painter
boolean visible = false
integer x = 4384
integer y = 264
integer width = 343
integer height = 92
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type sle_tt from singlelineedit within w_export_painter
boolean visible = false
integer x = 4379
integer y = 156
integer width = 343
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type cb_2 from commandbutton within w_export_painter
boolean visible = false
integer x = 4443
integer y = 80
integer width = 178
integer height = 64
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "strip"
end type

event clicked;string tt
string cc
string res
string rr
pfc_n_cst_ai_export nv_e
debugbreak()
tt = sle_tt.text
cc = sle_tc.text
rr = sle_rep.text

nv_e = create pfc_n_cst_ai_export

res = nv_e.of_strip_char( cc,tt, rr)
messagebox("",res)

destroy nv_e
end event

type gb_1 from groupbox within w_export_painter
integer x = 23
integer width = 1989
integer height = 156
integer taborder = 130
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "Select Export File"
end type

type cb_new from u_cb within w_export_painter
integer x = 1129
integer y = 48
integer width = 411
integer height = 84
integer taborder = 10
boolean bringtotop = true
string text = "&New Export File"
end type

event clicked;long ll_export_id
Integer li_nr

ll_export_id = gnv_app.of_get_id("MEETING")
lb_new = true
tab_1.enabled = true

il_export_id = ll_export_id
li_nr = tab_1.tabpage_export_hdr.dw_export_file.InsertRow( 1 )
tab_1.tabpage_export_hdr.dw_export_file.SetItem( li_nr, "export_id", ll_export_id)
tab_1.tabpage_export_hdr.dw_export_file.SetItem( li_nr, "field_delimiter", "T")
tab_1.tabpage_export_hdr.dw_export_file.SetItem( li_nr, "record_delimiter", "R")
//Added By Mark 06/11/2014
tab_1.tabpage_export_hdr.dw_export_file.SetItem( li_nr, "prac_sql", 'Select Distinct ctx_id From ctx_basic_info Where ctx_id Between 1 And 5;')
tab_1.tabpage_export_hdr.dw_export_file.SetItem( li_nr,"view_id",1001)

tab_1.tabpage_export_hdr.dw_export_file.ScrollToRow( li_nr )
tab_1.tabpage_export_hdr.dw_export_file.SetRow( li_nr )
tab_1.tabpage_export_hdr.dw_export_file.SetFocus( )
tab_1.selecttab(1)
tab_1.tabpage_field_data.dw_fld_list.reset()
tab_1.tabpage_field_data.dw_detail.reset()
//--------------------------- APPEON BEGIN ---------------------------
//$<add> 05.23.2007 By: Jack
//$<reason> Fix a defect.
dw_select.reset()
dw_select.insertrow(0)
//---------------------------- APPEON END ----------------------------

//<add> andy 2007.05.30
//set mle_1¡¢st_1¡¢cb_4 visible = false
of_setui(1)
//end of add
end event

type cb_save from u_cb within w_export_painter
integer x = 3584
integer y = 48
integer width = 302
integer height = 84
integer taborder = 90
boolean bringtotop = true
string text = "&Save"
boolean default = true
end type

event clicked;//Integer li_retval
//integer r
//string s
//long recid
//integer i
//integer rc
//DataWindowChild dwchild
//integer col
//long    ll_FieldType//<add> andy 2007.05.24
////debugbreak()
//
//li_retval = tab_1.tabpage_field_data.dw_fld_list.update()
////commit using sqlca;
//
////--------------------------- APPEON BEGIN ---------------------------
////$<add> 04.10.2007 By: Jack
////$<reason> Fix a defect.
//tab_1.tabpage_export_hdr.dw_export_file.accepttext()
//tab_1.tabpage_field_data.dw_detail.accepttext()
//If tab_1.tabpage_export_hdr.dw_export_file.modifiedcount() > 0 Or lb_new Or tab_1.tabpage_field_data.dw_detail.modifiedcount() > 0  Or tab_1.tabpage_field_data.dw_detail.deletedcount() > 0 Then
////---------------------------- APPEON END ----------------------------
//	//Added By Mark Lee 08/01/2013
//	li_retval = MessageBox(gnv_app.iapp_object.DisplayName,"It may take a few minutes to generate the associated export data when saving the changes.~r~n~r~nDo you want to continue?",Information! ,OKCancel!)
//	IF li_retval = 2 Then
//		Return 0
//	End If
//	if tab_1.tabpage_field_data.dw_detail.rowcount() > 0 then
//		//<add> andy 2007.05.24
//		ll_FieldType   = tab_1.tabpage_field_data.dw_detail.GetItemNumber( 1, "export_fields_export_type")
//		if ll_FieldType = 3 then
//			//check valid and set mle_1.text into export_fields_ctx_column_name 
//			if of_check() = -1 then return -1 // Modify by Evan 01.31.2008
//		end if
//		//end of add
//		
//		if isnull(tab_1.tabpage_field_data.dw_detail.getItemnumber( 1, "rec_id" )) then
//			recid = of_get_id( )
//			tab_1.tabpage_field_data.dw_detail.SetItem( 1, "rec_id", recid )
//			il_recid = recid
//		end if
//	end if
//	testcnt++
//	if tab_1.tabpage_field_data.dw_detail.rowcount() > 0 then
//		if tab_1.tabpage_field_data.dw_detail.getItemnumber( 1, "use_default" ) = 2 then
//			tab_1.tabpage_field_data.dw_detail.accepttext()
//			col = integer(tab_1.tabpage_field_data.dw_detail.getItemstring( 1, "default_value" ))
//			//messagebox("col",col)
//			if col < 1 or col > tab_1.tabpage_field_data.dw_fld_list.rowcount() then
//				//messagebox("Invalid setting","You are using a column default this column, but your default value is not a valid column number")
//  				messagebox("Invalid setting","You are using a column default for this column, but your default value is not a valid column number")
//				return -1 // Modify by Evan 01.31.2008
//			end if
//		end if
//	end if
//	
//	//--------------------------- APPEON BEGIN ---------------------------
//	//$<add> 2006-11-28 By: Rodger Wu
//	integer li_module_type, li_getrow, li_ctx_uselink
//	string ls_modify
//	
//	if tab_1.tabpage_field_data.dw_detail.rowcount() > 0 then
//		li_module_type = tab_1.tabpage_field_data.dw_detail.GetItemNumber( 1, "export_fields_module_type" )
//		li_ctx_uselink = tab_1.tabpage_field_data.dw_detail.GetItemNumber( 1, "export_fields_ctx_uselink" )
//		if isnull( li_ctx_uselink ) then li_ctx_uselink = 0
//		if li_module_type = 3 or li_module_type = 4 then
//			ls_modify = "intcred_table.dddw.Required = 'No' intcred_field.dddw.Required = 'No' " + &
//							"export_fields_ctx_scrn_id.dddw.Required = 'Yes' export_fields_ctx_column_name.dddw.Required = 'Yes'"
//			if li_ctx_uselink = 0 then
//				ls_modify += " export_fields_ctx_linkfromcolumn.dddw.Required = 'No' export_fields_ctx_linktoscrnid.dddw.Required = 'No'" + &
//								 " export_fields_ctx_linktocolumn.dddw.Required = 'No'"
//			else
//				ls_modify += " export_fields_ctx_linkfromcolumn.dddw.Required = 'Yes' export_fields_ctx_linktoscrnid.dddw.Required = 'Yes'" + &
//								 " export_fields_ctx_linktocolumn.dddw.Required = 'Yes'"
//			end if
//		else
//			ls_modify = "intcred_table.dddw.Required = 'Yes' intcred_field.dddw.Required = 'Yes' " + &
//							"export_fields_ctx_scrn_id.dddw.Required = 'No' export_fields_ctx_column_name.dddw.Required = 'No' " + &
//							"export_fields_ctx_linkfromcolumn.dddw.Required = 'No' export_fields_ctx_linktoscrnid.dddw.Required = 'No' " + &
//							"export_fields_ctx_linktocolumn.dddw.Required = 'No'"
//		end if
//		
//		tab_1.tabpage_field_data.dw_detail.modify( ls_modify )
//	end if
//	//---------------------------- APPEON END ----------------------------
//	
//	//--------------------------- APPEON BEGIN ---------------------------
//	//$<add> 04.10.2007 By: Jack
//	If tab_1.tabpage_field_data.dw_detail.rowcount() > 0 Then
//		string ls_export_field_name,ls_export_field_name1
//		int li_pos,li_num
//		long ll_rec_id,ll_rec_id1
//		boolean lb_duplicates = False
//		
//		ls_export_field_name = tab_1.tabpage_field_data.dw_detail.getitemstring(1,'export_field_name')
//		if Not of_Field_Name_Check(ls_export_field_name) then
//			MessageBox("Invalid Column Name","Column Name is invalid.~r~n~r~nColumn Name must start with a letter, can include any combination of~r~nletters, numbers, and underscores.")
//			Return -1
//		end if
//		If tab_1.tabpage_field_data.dw_detail.describe( "lu_field_name.visible" )  = '1' Then
//			If IsNull( tab_1.tabpage_field_data.dw_detail.getitemstring(1,'lu_field_name') ) Or Trim( tab_1.tabpage_field_data.dw_detail.getitemstring(1,'lu_field_name') ) = '' Then
//				messagebox("Invalid setting","Value is not a valid in 'Lookup Table Field'.")
//				Return -1			
//			End If
//		End If
//		/*
//		li_pos = pos(trim(ls_export_field_name),' ')
//		If li_pos > 0 Then
//			messagebox("Invalid Column Name","Field name cannot contain space.")
//			tab_1.tabpage_field_data.dw_detail.setfocus()
//			tab_1.tabpage_field_data.dw_detail.setcolumn('export_field_name')
//			Return -1
//		End If
//		*/
//		ll_rec_id = tab_1.tabpage_field_data.dw_detail.getitemnumber(1,'rec_id')
//		If isnull(ll_rec_id) Then ll_rec_id = 0
//		For i = 1 To tab_1.tabpage_field_data.dw_fld_list.rowcount()
//			ls_export_field_name1 = tab_1.tabpage_field_data.dw_fld_list.getitemstring(i,'export_field_name')
//			ll_rec_id1 = tab_1.tabpage_field_data.dw_fld_list.getitemnumber(i,'rec_id')		
//			If ls_export_field_name1 = ls_export_field_name And ll_rec_id1 <> ll_rec_id Then
//				lb_duplicates = True
//				exit
//			End If
//		Next
//		If lb_duplicates Then
//			//messagebox("Invalid Column Name","Field name cannot duplicates.")
// 			messagebox("Invalid Column Name","Field name cannot be duplicate.")
//			tab_1.tabpage_field_data.dw_detail.setfocus()
//			tab_1.tabpage_field_data.dw_detail.setcolumn('export_field_name')
//			Return -1 // Modify by Evan 01.31.2008
//		End If
//	End If
//	
//	//---------------------------- APPEON END ----------------------------
//	
//	
//	li_retval = Parent.Event pfc_Save()
//	
//	IF li_retval < 0 THEN
//		Return li_retval // Modify by Evan 01.31.2008
//	END IF
//	
//	//Begin - Added By Mark Lee 08/01/2013.	check the update data for export store procedure
//	pfc_n_cst_ai_export_apb  n_export
//	n_export = CREATE pfc_n_cst_ai_export_apb
//	li_retval =	n_export.of_update_export_data( il_export_id)
//	Destroy n_export
//	//End - Added By Mark Lee 08/01/2013.
//	//--------------------------- APPEON BEGIN ---------------------------
//	//$<add> 05.23.2007 By: Jack
//	//$<reason> Fix a defect.
//	dw_select.event constructor()	
//	//---------------------------- APPEON END ----------------------------
//	
//	
//	//	dw_select.GetChild( "export_id", dwchild )
//	//	dwchild.settransobject(sqlca)
//	//	dwchild.retrieve()
//		recid = il_recid
//		rc = tab_1.tabpage_field_data.dw_fld_list.retrieve(il_export_id)
//		s = "rec_id = " + string(recid)
//		
//		//find the current row and set it
//		r = tab_1.tabpage_field_data.dw_fld_list.find(s,1,rc)
//		
//		if r > 0 then 
//			tab_1.tabpage_field_data.dw_fld_list.scrolltorow(r)
//			tab_1.tabpage_field_data.dw_fld_list.setrow(r)
//			//Added By Mark Lee 08/02/2013
////			IF li_retval =  1 Then 
////				tab_1.tabpage_field_data.dw_detail.Retrieve( recid)
//////				tab_1.tabpage_field_data.dw_fld_list.Trigger Event rowfocuschanged( r )
////			End If
//		end if
//	if lb_new = true then //remodified maha 081104
//		//messagebox("","new")
//	//	dw_select.retrieve()
//		dw_select.GetChild( "export_id", dwchild )
//		dwchild.settransobject(sqlca)
//		rc = dwchild.retrieve()
//		s = "export_id = " + string(il_export_id)
//		
//		//find the current row and set it
//		r = dwchild.find(s,1,rc)
//		
//		if r > 0 then 
//			dwchild.scrolltorow(r)
//			dwchild.setrow(r)
//		else
//			dw_select.insertrow(1)
//			//messagebox("il_export_id",il_export_id)
//		end if	
//		dw_select.setitem(dw_select.getrow(),'export_id',il_export_id)  //Add 04.27.2007 by Jack
//		
//		//dwchild.insertrow(1)
//		//dw_select.retrieve()
//	end if
//	
//	lb_new = false
//	
//	tab_1.tabpage_field_data.st_next.text = "Next Col " + (string(tab_1.tabpage_field_data.dw_fld_list.rowcount()+ 1))
//	//Begin - Added By Mark Lee 07/31/2013.
//	cb_test.event clicked( )
//	//End - Added By Mark Lee 07/31/2013.
//
//End If
//
//Return 1 // Add by Evan 01.31.2008
//Added By Mark Lee 09/27/2013
return of_save(false)
end event

type cb_quit from u_cb within w_export_painter
integer x = 3886
integer y = 48
integer width = 302
integer height = 84
integer taborder = 60
boolean bringtotop = true
string text = "&Close"
boolean cancel = true
end type

event clicked;//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 04.23.2007 By: Jack
//$<reason> Fix a defect.
/*
Parent.Event pfc_close()
*/
int li_mes
tab_1.tabpage_field_data.dw_detail.accepttext( )
tab_1.tabpage_export_hdr.dw_export_file.accepttext( )
If tab_1.tabpage_export_hdr.dw_export_file.modifiedcount() > 0 Or tab_1.tabpage_field_data.dw_detail.modifiedcount() > 0  Or tab_1.tabpage_field_data.dw_detail.deletedcount() > 0 Then
//	li_mes = messagebox('ContractLogix','Do you want to save changes?',Question!,YesNoCancel!)			//Added By Mark Lee 09/29/2013
	li_mes = messagebox('ContractLogix','Do you want to save changes?',Question!,OKCancel! )
	If li_mes = 1 Then
//		cb_save.triggerevent(clicked!)			//Added By Mark Lee 09/29/2013
		ib_export_save = true
		of_save(true)
		close(parent)
		//Commented By Mark Lee 09/29/2013
//	Elseif li_mes = 2 then
//		ib_closestatus = True
//		close(parent)
	Else
		Return -1
	End If
Else
	//Begin - Added By Mark Lee 09/29/2013
	if ib_export_save = true then 
		of_save(true)
	end if 
	//End - Added By Mark Lee 09/29/2013
	close(parent)	
End If
//---------------------------- APPEON END ----------------------------

end event

type cb_auto from commandbutton within w_export_painter
integer x = 2560
integer y = 48
integer width = 421
integer height = 84
integer taborder = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Open Auto Export"
end type

event clicked;//Long prac_ids[]
//
//prac_ids[1] = 1
//prac_ids[2] = 3
//prac_ids[3] = 4
//
//pfc_n_cst_ai_export  n_export
//
//
//n_export = CREATE pfc_n_cst_ai_export
//
//n_export.of_export_data( il_export_id, prac_ids )

IF IsValid(w_auto_export) THEN 				//Added By Mark Lee 09/07/2015
	if w_auto_export.WindowState =Minimized! then 
		 w_auto_export.WindowState=Normal!
	else 
		w_auto_export.show()
	end if 
else
	openwithparm(w_auto_export,"I")
end if 



end event

type cb_test from commandbutton within w_export_painter
integer x = 2981
integer y = 48
integer width = 302
integer height = 84
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Run &Export"
end type

event clicked;//Commented By Mark Lee 09/29/2013 move to of_create_export() function.
//Long prac_ids[]
//string ls_presentation_str
//string ls_sny_retrieve
//string ls_dwsyntax_str
//string ERRORS
//string ls_path
//long ll_prac_row
//n_ds lds_export_retrieve
////Start Code Change ---- 11.03.2005 #26 maha
//long ll_from
//long ll_to
//string ls_return
//long i
//long ic
//long ll_pracid
//integer li_savedata = 0
//string ls_prompt1
//string ls_prompt2
//string ls_prompt3
//string ls_prompt
//string ls_arg
//string ls_parm1 = ""
//string ls_parm2 = ""
//string ls_parm3 = ""
//integer p1
//integer p2
//integer p3
////<add> 07/13/2007 by: Andy
//String  ls_Temp1,ls_Temp2
//String  ls_name
//Long    ll_pracidold = -1
//Long    ll_Num = 0,ll_pos
//integer li_type1
//String  ls_SQL = '',ls_temp
////end of add
////--------------------------- APPEON BEGIN ---------------------------
////$<add> 2006-12-25 By: Rodger Wu
//integer li_type
////---------------------------- APPEON END ----------------------------
//
////--------------------------- APPEON BEGIN ---------------------------
////$<ID> UM-01
////$<modify> 01.13.2006 By: Wang Chao
////$<reason> It is currently unsupported to dynamically create a visual object.
////$<modification> Replaced the visual object with a non-visual object.
////pfc_n_cst_ai_export  n_export
////n_export = CREATE pfc_n_cst_ai_export
//
//pfc_n_cst_ai_export_apb  n_export
//n_export = CREATE pfc_n_cst_ai_export_apb
////---------------------------- APPEON END ----------------------------
//
////--------------------------- APPEON BEGIN ---------------------------
////$<add> 05.23.2007 By: Jack
////$<reason> Fix a defect.
//il_export_id = dw_select.getitemnumber(dw_select.getrow(),'export_id')
//If	tab_1.tabpage_field_data.dw_fld_list.rowcount() < 1 Then
//	messagebox("Export error","No Export Column.")
//	if IsValid(n_export) then destroy n_export
//	Return
//End If
////---------------------------- APPEON END ----------------------------
//
//if isnull(il_export_id) or il_export_id < 1 then
//	messagebox("Select error","Please select an export.")
//	if IsValid(n_export) then destroy n_export
//	return
//end if
//
//ls_path = tab_1.tabpage_export_hdr.dw_export_file.getitemstring(1,"save_path")
////--------------------------- APPEON BEGIN ---------------------------
////$<add> 03.28.2007 By: Jack 
////$<reason> Fix a defect.
////Comment 08/21/2007 by: Andy Reason:BugG081801
///*
//string ls_file
//ls_file = right(ls_path,1)
//If ls_file = '\' Then
//	ls_path = mid(ls_path,1,len(ls_path) - 1)
//End If
//*/
////---------------------------- APPEON END ----------------------------
//
//ls_sny_retrieve = tab_1.tabpage_export_hdr.dw_export_file.getitemstring(1,"prac_sql")
//
//ls_prompt1 = tab_1.tabpage_export_hdr.dw_export_file.getitemstring(1,"prompt_type1")
//ls_prompt2 = tab_1.tabpage_export_hdr.dw_export_file.getitemstring(1,"prompt_type2")
//ls_prompt3 = tab_1.tabpage_export_hdr.dw_export_file.getitemstring(1,"prompt_type3")
//
//choose case ls_prompt1
//	case "C","D","N"
//		ls_prompt = ls_prompt1
//end choose
//choose case ls_prompt2
//	case "C","D","N"
//		ls_prompt += "*" + ls_prompt2
//end choose
//choose case ls_prompt3
//	case "C","D","N"
//		ls_prompt += "*" + ls_prompt3
//end choose
//
////--------------------------- APPEON BEGIN ---------------------------
////$<add> 2006-11-28 By: Rodger Wu (doc painter)
//li_type = tab_1.tabpage_export_hdr.dw_export_file.GetItemNumber( 1, "export_type" )
////---------------------------- APPEON END ----------------------------
//
//IF isnull(ls_sny_retrieve) or trim(ls_sny_retrieve) = "" then
//	open(w_export_test_param)
//	ls_return = message.stringparm
//	
//	if ls_return = "Cancel" then
//		if IsValid(n_export) then destroy n_export
//		return
//	end if
//	
//	ll_from = long(mid(ls_return,1,pos(ls_return,"@") - 1))
//	//messagebox("ls_from",ll_from)
//	ll_to = long(mid(ls_return,pos(ls_return,"@") + 1))
//	//messagebox("ll_to",ll_to)
//	ic = ll_to - ll_from + 1
//	//messagebox("ic",ic)
//	if ic < 0 then
//		//messagebox("Input Error","The To: value cannot be less that the From: value.")
//		messagebox("Input Error","The To value must be greater than the From value.")
//		if IsValid(n_export) then destroy n_export
//		return
//	end if
//		
//	//--------------------------- APPEON BEGIN ---------------------------
//	//$<modify> 05.18.2007 By: Jack
//	//$<reason> Fix a defect.
//	/*
//	ll_pracid = ll_from
//	for i = 1 to ic
//		prac_ids[i] = ll_pracid
//		ll_pracid++
//	next
//	*/
//	//Modify 07/13/2007 by: Andy
//	//ls_sny_retrieve = 'Select distinct ctx_id from ctx_basic_info where ctx_id between ' + string(ll_from) + ' and ' + string(ll_to) + ';'
//	if li_type = 3 or li_type = 4 then
//		ls_sny_retrieve = 'Select distinct ctx_id from ctx_basic_info where ctx_id between ' + string(ll_from) + ' and ' + string(ll_to) + ';'
//	else
//		ls_sny_retrieve = 'Select distinct prac_id from pd_basic where prac_id between ' + string(ll_from) + ' and ' + string(ll_to) + ';'
//	end if
//	//end of modify
//	
//	ls_presentation_str = "style(type=grid)"		
//	
//	ls_dwsyntax_str = SQLCA.SyntaxFromSQL(ls_sny_retrieve, ls_presentation_str, ERRORS)
//	IF Len(ERRORS) > 0 THEN
//		MessageBox("Caution", &
//		"SyntaxFromSQL caused these errors: " + ERRORS)
//		if IsValid(n_export) then destroy n_export		
//		RETURN -1
//	END IF
//	
//	lds_export_retrieve = CREATE n_ds
//	lds_export_retrieve.Create( ls_dwsyntax_str, ERRORS)
//	lds_export_retrieve.SetTransObject( SQLCA )
//	ll_prac_row = lds_export_retrieve.retrieve()
//	if ll_prac_row < 1 then 
//		if li_type = 3 or li_type = 4 then
//			messagebox("Information","No contract rows returned.")
//		else
//			messagebox("Information","No practitioner rows returned.")
//		end if
//		if IsValid(n_export) then destroy n_export
//		if IsValid(lds_export_retrieve) then destroy lds_export_retrieve
//		return -2
//	end if
//	
//	//<add> 07/12/2007 by: Andy
//	lds_export_retrieve.Setsort( "#1 A")
//	lds_export_retrieve.Sort()
//	//end of add
//		
//	for i = 1 to ll_prac_row
//		prac_ids[i] = lds_export_retrieve.getitemnumber(i,1)
//	next
//	
//	//<add> 07/17/2007 by: Andy
//	li_type1 = 3
//	//end of add
//	
//	//---------------------------- APPEON END ----------------------------
//else
//	
//	if len(ls_prompt) > 0 then //maha 110305 for prompts
//		openwithparm(w_export_prompt,ls_prompt)
//		ls_prompt = message.stringparm
//		if ls_prompt = "Cancel" then
//			if IsValid(n_export) then destroy n_export
//			if IsValid(lds_export_retrieve) then destroy lds_export_retrieve
//			return -1
//		else
//		//parses the return into separate variables
//		ls_parm1 = ""
//		ls_parm2 = ""
//		ls_parm3 = ""
//		
//		ls_arg = ls_prompt
//		
//		p1 = pos(ls_arg,"*",1)
//		ls_parm1 = mid(ls_arg,1,p1 - 1)
//		
//		p2 = pos(ls_arg,"*",p1 + 1)
//		if p2 > 0 then 
//			ls_parm2 = mid(ls_arg,p1 + 1,p2 - p1 - 1)
//		
//			if p2 < len(ls_arg) then //check for third param
//				ls_parm3 = mid(ls_arg,p2 + 1)
//			end if
//		end if
//		
//		ls_sny_retrieve = n_export.of_prompt_syntax(ls_sny_retrieve,ls_parm1,ls_parm2,ls_parm3)
//
//		end if
//	end if
//
//	//<add> 07/17/2007 by: Andy
//	li_type1 = 1
//	ls_SQL = ls_sny_retrieve
//	//end of add
//	
//	//$<add> 05.06.2008 by Andy
//	ll_pos = pos(lower(ls_sny_retrieve)," from ")
//	ls_temp = Left(ls_sny_retrieve,ll_pos - 1)
//	if li_type = 3 or li_type = 4 then		
//		if pos(lower(ls_temp), "ctx_id") < 1 then
//			MessageBox("Caution","The Contract Retrieval SQL must contain the ctx_id column.")
//			if IsValid(n_export) then destroy n_export		
//			RETURN -1
//		end if
//	else
//		if pos(lower(ls_temp), "prac_id") < 1 then
//			MessageBox("Caution","The Practitioner Retrieval SQL must contain the prac_id column.")
//			if IsValid(n_export) then destroy n_export		
//			RETURN -1
//		end if		
//	end if
//	//end add 05.06.2008
//	
//	ls_presentation_str = "style(type=grid)"		
//	
//	ls_dwsyntax_str = SQLCA.SyntaxFromSQL(ls_sny_retrieve, ls_presentation_str, ERRORS)
//	IF Len(ERRORS) > 0 THEN
//		MessageBox("Caution", &
//		"SyntaxFromSQL caused these errors: " + ERRORS)
//		if IsValid(n_export) then destroy n_export
//		RETURN -1
//	END IF
//	
//	lds_export_retrieve = CREATE n_ds
//	lds_export_retrieve.Create( ls_dwsyntax_str, ERRORS)
//	lds_export_retrieve.SetTransObject( SQLCA )
//	ll_prac_row = lds_export_retrieve.retrieve()
//	
////$<del> 05.06.2008 by Andy
////$<Reason> Allow select more than one field,maybe the old customers have many Retrieval SQL that select more than one field.	
////	//<add> 07/13/2007 by: Andy
////	if li_type = 3 or li_type = 4 then
////		ls_Temp1 = "The Contract Retrieval SQL"
////		ls_Temp2 = "ctx_id"
////	else
////		ls_Temp1 = "The Practitioner Retrieval SQL"
////		ls_Temp2 = "prac_id"
////	end if
//
////	//The Practitioner Retrieval SQL can only contain the prac_id column.	
////	if long(lds_export_retrieve.Describe( "DataWindow.Column.Count")) <> 1 then
////		messagebox(gnv_app.iapp_object.DisplayName,ls_Temp1 + " can only contain the " + ls_Temp2 + " column.")
////		if IsValid(n_export) then destroy n_export
////		if IsValid(lds_export_retrieve) then destroy lds_export_retrieve
////		return -1
////	end if
//	
////	ls_name = lds_export_retrieve.Describe( "#1.name")
////	if li_type = 3 or li_type = 4 then
////		if pos(ls_name,"ctx_id") < 1 then
////			messagebox(gnv_app.iapp_object.DisplayName,ls_Temp1 + " must contain the " + ls_Temp2 + " column.")
////			if IsValid(n_export) then destroy n_export
////			if IsValid(lds_export_retrieve) then destroy lds_export_retrieve
////			return -1
////		end if		
////	else
////		if pos(ls_name,"prac_id") < 1 then
////			messagebox(gnv_app.iapp_object.DisplayName,ls_Temp1 + " must contain the " + ls_Temp2 + " column.")
////			if IsValid(n_export) then destroy n_export
////			if IsValid(lds_export_retrieve) then destroy lds_export_retrieve
////			return -1
////		end if			
////	end if
////	//end of add
//	
//	if ll_prac_row < 1 then 
//		//--------------------------- APPEON BEGIN ---------------------------
//		//$<modify> 2006-11-28 By: Rodger Wu (doc painter)
//		if li_type = 3 or li_type = 4 then
//			messagebox("Information","No contract rows returned.")
//		else
//			messagebox("Information","No practitioner rows returned.")
//		end if
//		//---------------------------- APPEON END ----------------------------
//		if IsValid(n_export) then destroy n_export
//		if IsValid(lds_export_retrieve) then destroy lds_export_retrieve
//		return -2
//	end if
//
//	//<add> 07/12/2007 by: Andy
//	lds_export_retrieve.Setsort( "#1 A")
//	lds_export_retrieve.Sort()
//	//end of add
//	
//	//lds_export_retrieve.retrieve()
//	//Modify 07/13/2007 by: Andy Reason:filter repeated data
//	for i = 1 to ll_prac_row
//		ll_pracid   = lds_export_retrieve.getitemnumber(i,1)
//		//if ll_pracid <> ll_pracidold then
//		if ll_pracid <> ll_pracidold and ll_pracid > 0 then  //jervis 08.26.2009
//			ll_Num ++
//			prac_ids[ll_Num] = ll_pracid
//			ll_pracidold= ll_pracid
//		end if
//	next
//	//end of modify
//end if
//
///*comment 07/18/2007 by: Andy
//if cbx_savedata.checked = true then
//	//save
//	li_savedata = 1
//end if
//
////--------------------------- APPEON BEGIN ---------------------------
////$<modify> 2006-11-28 By: Rodger Wu (doc painter)
//
//if cbx_previewdata.checked then
//	li_savedata = 1
//	cbx_savedata.checked = True
//end if
//*/
//
////<add> 07/18/2007 by: Andy
//if cbx_savedata.checked and cbx_previewdata.checked then 
//	//save & preview
//	li_savedata = 3
//elseif cbx_previewdata.checked then
//	//preview
//	li_savedata = 2
//elseif cbx_savedata.checked then
//	//save
//	li_savedata = 1
//else
//	//do nothing
//	li_savedata = 0
//end if
////end of add
//
//n_export.ib_gen_rec_id = False //Added By Ken.Guo 2010-06-30.
//n_export.ib_standard = true		//Added By Mark Lee 09/05/2013
//if li_type = 3 or li_type = 4 then
//	i = n_export.of_export_data_with_text_ctx( il_export_id, prac_ids,ls_path,li_savedata,ls_parm1,ls_parm2,ls_parm3,li_type1,ls_SQL )
//else
//	i = n_export.of_export_data_with_text( il_export_id, prac_ids,ls_path,li_savedata,ls_parm1,ls_parm2,ls_parm3,li_type1,ls_SQL)	
//end if
//
////comment 07/18/2007 by: Andy 
////Reason:Move to pfc_n_cst_ai_export_apb
////if i = 1 and cbx_previewdata.checked then
////	openwithparm( w_export_previewdata, n_export.is_select_syntax )
////end if
////end of comment
//
//destroy n_export;
//destroy lds_export_retrieve//<add> 07/13/2007 by: Andy
////End Code Change---11.03.2005
////---------------------------- APPEON END ----------------------------
//
ib_export_save = false		
return of_create_export(false)
end event

type cb_delete from u_cb within w_export_painter
integer x = 1541
integer y = 48
integer width = 453
integer height = 84
integer taborder = 20
boolean bringtotop = true
string text = "Delete Export &File"
end type

event clicked;Integer li_export_id
Integer li_nr
integer res
string 	ls_export_name,  ls_name, ls_clause_name, ls_Template_Name, ls_email_name

li_export_id = dw_select.getitemnumber(1,'export_id')
IF li_export_id < 0 or isnull(li_export_id) THEN 
	//messagebox('Delete','Please first select a export file to delete.')
	messagebox('Delete','Please first select an export file to delete.')
	return
END IF

res = messagebox("Delete","Are you sure you want to delete the selected export file?",question!,yesno!,2)
if res = 1 then	
	li_export_id = tab_1.tabpage_export_hdr.dw_export_file.getItemnumber(tab_1.tabpage_export_hdr.dw_export_file.getrow(),"export_id")	
	//Begin - Added By Mark Lee 09/27/2013
	gnv_appeondb.of_StartQueue()
	Select top 1 request_name 	
	Into :ls_name
	From request_form
	Where export_id = :li_export_id using sqlca;
	
	Select top 1 clause_name 	
	Into :ls_clause_name
	From ctx_acp_clause
	Where export_id = :li_export_id using sqlca;
	
	Select top 1 Template_Name 	
	Into :ls_Template_Name
	From ctx_acp_template
	Where export_id = :li_export_id using sqlca;//Added By Mark 07/07/2014	
	
	//Added By Ken.Guo 2015-05-12.
	Select top 1 email_name 	
	Into :ls_email_name
	From wf_email
	Where export_id = :li_export_id using sqlca;	
	
	gnv_appeondb.of_CommitQueue()
	
	if not isnull(ls_name) and trim(ls_name) <> "" then 
//		ls_export_name =  tab_1.tabpage_export_hdr.dw_export_file.getItemString(tab_1.tabpage_export_hdr.dw_export_file.getrow(),"export_name")			 
		Messagebox(gnv_app.iapp_object.DisplayName,"You cannot delete this export as it is already used in the Request Form ("+ls_name+").")															
		return 
	end if
	//Added By Mark 07/07/2014 
	if not isnull(ls_clause_name) and trim(ls_clause_name) <> "" then 
		Messagebox(gnv_app.iapp_object.DisplayName,"You cannot delete this export as it is already used in the Clause Library ("+ls_clause_name+").")
		return 
	end if
	if not isnull(ls_Template_Name) and trim(ls_Template_Name) <> "" then 
		Messagebox(gnv_app.iapp_object.DisplayName,"You cannot delete this export as it is already used in the Template Library ("+ls_Template_Name+").")
		return 
	end if	
	//End - Added By Mark Lee 09/27/2013
	
	//Added By Ken.Guo 2015-05-12
	if not isnull(ls_email_name) and trim(ls_email_name) <> "" then 
		Messagebox(gnv_app.iapp_object.DisplayName,"You cannot delete this export as it is already used in the Email Template ("+ls_email_name+").")
		return 
	end if		
	
	tab_1.tabpage_export_hdr.dw_export_file.deleterow(tab_1.tabpage_export_hdr.dw_export_file.getrow())
	tab_1.tabpage_field_data.dw_detail.reset() //maha 081104
	lb_new = true
	il_export_id = 0 //maha 081104
//	res = cb_save.Event Clicked()		//Added By Mark Lee 09/29/2013
	res = of_save(false)
	if res = 1 then
		gnv_appeondb.of_StartQueue()
		delete from export_fields where export_id = :li_export_id;
		commit;
		gnv_appeondb.of_CommitQueue()
	else
		SetNull(li_export_id)
		dw_select.SetItem(1, "export_id", li_export_id)
		tab_1.SelectTab(1)
		tab_1.Enabled = false
	end if
	//---------------------------- APPEON END ----------------------------
end if
end event

type cbx_open from checkbox within w_export_painter
boolean visible = false
integer x = 2185
integer y = 152
integer width = 466
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
string text = "Open saved file"
end type

type dw_select from datawindow within w_export_painter
integer x = 46
integer y = 52
integer width = 1079
integer height = 80
integer taborder = 50
boolean bringtotop = true
string dataobject = "d_export_hdr_list"
boolean border = false
boolean livescroll = true
end type

event itemchanged;integer cnt
long ll_count
datawindowchild dwchild

il_export_id = Integer( data )

/*
<add> andy 07/13/2007
Update the data type of the export column 
where the data type is null(only execute one time),
in order to resolve the history data.
Because the data type is very important for Calculated fields.
*/
//of_updatehistorydata()  Unnecessary comment by jervis 10.08.2011
//end of add

ll_count = tab_1.tabpage_export_hdr.dw_export_file.Retrieve( il_export_id )

tab_1.tabpage_export_hdr.dw_export_file.GetChild( "multi_row_table", dwchild )
//dwchild.settransobject(sqlca)
//dwchild.retrieve()
dwchild.insertrow(1)

//Dynamic Retrieve Screens
if ll_count > 0 then	il_view_id = tab_1.tabpage_export_hdr.dw_export_file.GetItemNumber( 1,"view_id")
if isnull(il_view_id) or il_view_id = 0 then il_view_id = 1001

tab_1.tabpage_field_data.dw_detail.GetChild("export_fields_ctx_scrn_id",dwchild)
dwchild.SetTransObject(sqlca)
if dwchild.Retrieve(il_view_id) < 1 then	dwchild.insertrow(1)
tab_1.tabpage_field_data.dw_detail.GetChild("export_fields_ctx_linktoscrnid",dwchild)
dwchild.SetTransObject(sqlca)
if dwchild.Retrieve(il_view_id) < 1 then	dwchild.insertrow(1)

//maha 121205
//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 07.22.2006 By: Rodger Wu
//$<reason> Fix a defect.

/* cnt = tab_1.tabpage_field_data.dw_fld_list.Retrieve( il_export_id ) */

Integer li_currentrow

li_currentrow = tab_1.tabpage_field_data.dw_fld_list.GetRow()
cnt = tab_1.tabpage_field_data.dw_fld_list.Retrieve( il_export_id )
of_reset_find_filed_name(il_export_id)														//Added By Mark Lee 08/06/2015
if cnt > 0 and li_currentrow = 1 then
	tab_1.tabpage_field_data.dw_fld_list.Trigger Event rowfocuschanged( 1 )
end if

//<add>    andy 2007.05.30 
//<reason> Fix a defect. bug:BugG053001
if cnt = 0 then tab_1.tabpage_field_data.dw_detail.reset()
//end of add

//---------------------------- APPEON END ----------------------------

//tab_1.tabpage_field_data.dw_detail.Retrieve( tab_1.tabpage_field_data.dw_fld_list.getitemnumber(1,"rec_id") )
tab_1.enabled = true

if cnt < 1 then
	tab_1.selecttab(1)
else 
	tab_1.selecttab(2)
	tab_1.tabpage_field_data.dw_detail.Retrieve( tab_1.tabpage_field_data.dw_fld_list.getitemnumber(1,"rec_id") )
	tab_1.tabpage_field_data.dw_fld_list.setfocus()
	tab_1.tabpage_field_data.dw_detail.Modify("export_field_name.protect='1'~texport_field_name.background.color='12632256'")    //Added By Jay Chen 07-31-2014
end if

//tab_1.tabpage_field_data.dw_fld_list.ShareData( tab_1.tabpage_field_data.dw_detail
end event

event constructor;//--------------------------- APPEON BEGIN ---------------------------
//$<add> 04.04.2007 By: Jack 
//$<reason> Fix a defect
datawindowchild child
string ls_value
this.getchild("export_id",child)
child.settransobject(sqlca)
child.retrieve()
If gb_contract_version Then
	child.setfilter("export_type in (3,4)")
	child.filter()
	ls_value = 'CTX Agreement Export~t3/CTX Export~t4/'
Else
	child.setfilter('')
	child.filter()
	ls_value = 'Data~t1/Data and Text~t2/CTX Agreement Export~t3/CTX Export~t4/'
End If
tab_1.tabpage_export_hdr.dw_export_file.modify("export_type.values = " + "'" + ls_value + "'")
//---------------------------- APPEON END ----------------------------

end event

type cbx_previewdata from checkbox within w_export_painter
integer x = 2944
integer y = 152
integer width = 421
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
string text = "Preview Data"
end type

event clicked;//--------------------------- APPEON BEGIN ---------------------------
//$<add> 2006-12-25 By: Rodger Wu
//comment 07/18/2007 by: Andy 
//if it saves data into db,it will very slowly
//if this.checked then cbx_savedata.checked = true
//---------------------------- APPEON END ----------------------------
end event

type st_field from statictext within w_export_painter
integer x = 2743
integer y = 52
integer width = 1321
integer height = 76
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

type cbx_savedata from checkbox within w_export_painter
integer x = 2194
integer y = 152
integer width = 773
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Save Data to export table"
end type

type st_field1 from statictext within w_export_painter
integer x = 2135
integer y = 180
integer width = 814
integer height = 76
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

type tab_1 from tab within w_export_painter
event create ( )
event destroy ( )
string tag = "Auto save"
integer x = 23
integer y = 172
integer width = 4133
integer height = 1880
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 79680469
boolean fixedwidth = true
boolean raggedright = true
alignment alignment = center!
integer selectedtab = 1
tabpage_export_hdr tabpage_export_hdr
tabpage_field_data tabpage_field_data
end type

on tab_1.create
this.tabpage_export_hdr=create tabpage_export_hdr
this.tabpage_field_data=create tabpage_field_data
this.Control[]={this.tabpage_export_hdr,&
this.tabpage_field_data}
end on

on tab_1.destroy
destroy(this.tabpage_export_hdr)
destroy(this.tabpage_field_data)
end on

event selectionchanged;if newindex = 2 then
//	cb_save.triggerevent(clicked!)		//Added By Mark Lee 09/29/2013
	of_save(true)
	tab_1.tabpage_field_data.st_next.text = "Next Col " + (string(tab_1.tabpage_field_data.dw_fld_list.rowcount()+ 1))
end if
end event

type tabpage_export_hdr from userobject within tab_1
integer x = 18
integer y = 100
integer width = 4096
integer height = 1764
long backcolor = 79741120
string text = "Export File Properties"
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
dw_export_file dw_export_file
end type

on tabpage_export_hdr.create
this.dw_export_file=create dw_export_file
this.Control[]={this.dw_export_file}
end on

on tabpage_export_hdr.destroy
destroy(this.dw_export_file)
end on

type dw_export_file from u_dw within tabpage_export_hdr
integer x = 9
integer y = 16
integer width = 4078
integer height = 1740
integer taborder = 11
string dataobject = "d_export_hdr"
boolean vscrollbar = false
boolean livescroll = false
borderstyle borderstyle = stylebox!
end type

event constructor;
This.of_SetReqColumn( TRUE )
of_SetTransObject( SQLCA )
//==============================APPEON BEGIN==========================
// $<Added>:   Date: Nov 05,2007       Author:Nova
//--------------------------------------------------------------------
// $<reason>   Fix a defect.
this.of_setresize(true)
this.inv_resize.of_setorigsize( this.width,this.height)
this.inv_resize.of_setminsize( this.width,this.height)
this.inv_resize.of_register(this.inv_resize.scale)
this.inv_resize.of_SetDetailHeight(true)
//==============================APPEON END============================

end event

event buttonclicked;call super::buttonclicked;string docname, named, path
integer value
integer li_type
long ll_pos
n_getfilename ln_getfilename
	
if dwo.Name = "cb_browse" THEN
	gf_load_dir_path() //Added by Ken.Guo on 2009-03-10
	//modified by gavins 20140814
//	value = GetFilesaveName("Select Directory and enter file name to be used for saved file.",&
//	+ docname, named, "DOC", &
//		+ "text Files (*.txt),*.txt")
	value = ln_getfilename.of_getsavefilename	("Select Directory and enter file name to be used for saved file.",&
	+ docname, named, "DOC", &
		+ "text Files (*.txt),*.txt")
	gf_save_dir_path(docname) //Added by Ken.Guo on 2009-03-10
	//ChangeDirectory(gs_current_path) //Add by Evan 12/11/2008
	
	IF value = 1 THEN
		path = mid(docname,1,pos(docname,".txt",1) - 1)
		this.setitem(1,"save_path",path) 
	END IF
end if

//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 2006-11-28 By: Rodger Wu (doc painter)
//$<reason> added example for contracts
if dwo.Name = "cb_paste" THEN
	li_type = This.GetItemNumber( row, "export_type" )
	if li_type = 3 or li_type = 4 then
		named = "Select Distinct ctx_id From ctx_basic_info Where ctx_id In (1,2,3,4,5);"
	else
		named = "Select distinct prac_id from pd_basic where prac_id in (1,2,3,4,5);"
	end if
	
	tab_1.tabpage_export_hdr.dw_export_file.setitem(1,"prac_sql",named)
end if
//Added By Mark 06/11/2014
if dwo.Name = "cb_paste1" THEN
	li_type = This.GetItemNumber( row, "export_type" )
	if li_type = 3 or li_type = 4 then
		named = "Select Distinct ctx_id From ctx_basic_info Where ctx_id Between 1 And 5;"
	else
		named = "Select distinct prac_id from pd_basic where prac_id Between 1 And 5;"
	end if
	
	tab_1.tabpage_export_hdr.dw_export_file.setitem(1,"prac_sql",named)
end if
//---------------------------- APPEON END ----------------------------

if dwo.Name = "cb_batch" THEN
	openwithparm(w_batch_prac_select_new,"E")
	named = message.stringparm
	if named <> "Cancel" then
		//Start Code Change ----12.14.2007 #V8 maha -- strip out order by
		ll_pos = pos(named,"order by",1)
		if ll_pos > 1 then
			named  = mid(named,1,ll_pos -1) + ";"
		end if
		//End Code Change---12.14.2007
		
		//$<add> 01.12.2008 by Andy
		ll_pos = pos(named," from ",1)
		if ll_pos > 1 then
			named = "select distinct v_full_name.prac_id " + mid(named,ll_pos)
		end if
		//end of add 01.12.2008
		tab_1.tabpage_export_hdr.dw_export_file.setitem(1,"prac_sql",named)
	end if
end if
end event

event itemchanged;call super::itemchanged;if This.GetColumnName() = "export_format" THEN
	this.accepttext()
	//messagebox("",data)
	//this.prac_sql.y = 1340
	if data = ".txt" or  data = ".xls" then
		this.setitem(1,"field_labels_as_header",1)
	end if
end if

//Dynamic change screens/field base on selected view -- jervis 08.06.2009
datawindowchild dwchild
if dwo.name = "view_id" then
	il_view_id = long(data)
	if isnull(il_view_id) then il_view_id = 1001
	tab_1.tabpage_field_data.dw_detail.GetChild("export_fields_ctx_scrn_id",dwchild)
	dwchild.SetTransObject(sqlca)
	if dwchild.Retrieve(il_view_id) < 1 then	dwchild.insertrow(1)
	tab_1.tabpage_field_data.dw_detail.GetChild("export_fields_ctx_linktoscrnid",dwchild)
	dwchild.SetTransObject(sqlca)
	if dwchild.Retrieve(il_view_id) < 1 then	dwchild.insertrow(1)
end if


end event

event pfc_preupdate;call super::pfc_preupdate;//<add> 07/18/2007 by: Andy
if RowCount() < 1 then return 1
//end of add

//Start Code Change ---- 03.01.2006 #305 maha
if this.getitemstatus( 1, 0, primary!) = datamodified! then
	this.setitem(1,"save_path",of_check_path(this.GetItemString( 1, "save_path" ),0)) 
end if

//<add> 07/16/2007 by: Andy
string ls_presentation_str
string ls_sny_retrieve
string ls_dwsyntax_str
string ERRORS
//n_ds lds_export_retrieve
integer li_type
//String  ls_Temp1,ls_Temp2,ls_name
String  ls_prompt_type1,ls_prompt_type2,ls_prompt_type3,ls_temp
n_cst_string lnvo_string
Long ll_pos

ls_sny_retrieve = getitemstring(1,"prac_sql")
ls_prompt_type1 = getitemstring(1,"prompt_type1")
ls_prompt_type2 = getitemstring(1,"prompt_type2")
ls_prompt_type3 = getitemstring(1,"prompt_type3")

IF isnull(ls_sny_retrieve) then ls_sny_retrieve = ''
IF isnull(ls_prompt_type1) then ls_prompt_type1 = ''
IF isnull(ls_prompt_type2) then ls_prompt_type2 = ''
IF isnull(ls_prompt_type3) then ls_prompt_type3 = ''

if ls_prompt_type1 = 'C' then 
	ls_prompt_type1 = "''"
elseif ls_prompt_type1 = 'D' then 
	ls_prompt_type1 = "'1900-01-01'"
elseif ls_prompt_type1 = 'N' then 
	ls_prompt_type1 = "0"
end if

if ls_prompt_type2 = 'C' then 
	ls_prompt_type2 = "''"
elseif ls_prompt_type2 = 'D' then 
	ls_prompt_type2 = "'1900-01-01'"
elseif ls_prompt_type2 = 'N' then 
	ls_prompt_type2 = "0"
end if

if ls_prompt_type3 = 'C' then 
	ls_prompt_type3 = "''"
elseif ls_prompt_type3 = 'D' then 
	ls_prompt_type3 = "'1900-01-01'"
elseif ls_prompt_type3 = 'N' then 
	ls_prompt_type3 = "0"
end if

if len(ls_prompt_type1) > 0 and Pos(lower(ls_sny_retrieve),'prompt1') > 0 then 
	ls_sny_retrieve = lnvo_string.of_globalreplace( ls_sny_retrieve, 'prompt1', ls_prompt_type1)
end if

if len(ls_prompt_type2) > 0 and Pos(lower(ls_sny_retrieve),'prompt2') > 0 then 
	ls_sny_retrieve = lnvo_string.of_globalreplace( ls_sny_retrieve, 'prompt2', ls_prompt_type2)
end if

if len(ls_prompt_type3) > 0 and Pos(lower(ls_sny_retrieve),'prompt3') > 0 then 
	ls_sny_retrieve = lnvo_string.of_globalreplace( ls_sny_retrieve, 'prompt3', ls_prompt_type3)
end if

IF trim(ls_sny_retrieve) <> "" then
	//$<add> 05.06.2008 by Andy
	li_type = GetItemNumber( 1, "export_type" )
	ll_pos = pos(lower(ls_sny_retrieve)," from ")
	ls_temp = Left(ls_sny_retrieve,ll_pos - 1)	
	if li_type = 3 or li_type = 4 then
		if pos(lower(ls_temp), "ctx_id") < 1 then
			MessageBox("Caution","The Contract Retrieval SQL must contain the ctx_id column.")		
			RETURN 1
		end if
	else
		if pos(lower(ls_temp), "prac_id") < 1 then
			MessageBox("Caution","The Practitioner Retrieval SQL must contain the prac_id column.")		
			RETURN 1
		end if		
	end if
	//end add 05.06.2008
	
	ls_presentation_str = "style(type=grid)"		
	
	ls_dwsyntax_str = SQLCA.SyntaxFromSQL(ls_sny_retrieve, ls_presentation_str, ERRORS)
	IF Len(ERRORS) > 0 THEN
		MessageBox("Note: Retrieval Query is invalid", &
		"SyntaxFromSQL caused these errors: " + ERRORS)
		//RETURN -1
		RETURN 1//Start Code Change ---- 10.01.2007 #V7 maha
	END IF
	
//$<del> 05.06.2008 by Andy
//$<Reason> Allow select more than one field,maybe the old customers have many Retrieval SQL that select more than one field.
//	lds_export_retrieve = CREATE n_ds
//	lds_export_retrieve.Create( ls_dwsyntax_str, ERRORS)
//	lds_export_retrieve.SetTransObject( SQLCA )
//	
//	li_type = GetItemNumber( 1, "export_type" )
//	if li_type = 3 or li_type = 4 then
//		ls_Temp1 = "The Contract Retrieval SQL"
//		ls_Temp2 = "ctx_id"
//	else
//		ls_Temp1 = "The Practitioner Retrieval SQL"
//		ls_Temp2 = "prac_id"
//	end if

//	//The Practitioner Retrieval SQL can only contain the prac_id column.	
//	if long(lds_export_retrieve.Describe( "DataWindow.Column.Count")) <> 1 then
//		messagebox(gnv_app.iapp_object.DisplayName,ls_Temp1 + " can only contain the " + ls_Temp2 + " column.")
//		if IsValid(lds_export_retrieve) then destroy lds_export_retrieve
//		return -1
//	end if
	
//	ls_name = lds_export_retrieve.Describe( "#1.name")
//	if li_type = 3 or li_type = 4 then
//		if pos(ls_name,"ctx_id") < 1 then
//			messagebox(gnv_app.iapp_object.DisplayName,ls_Temp1 + " can only contain the " + ls_Temp2 + " column.")
//			if IsValid(lds_export_retrieve) then destroy lds_export_retrieve
//			return -1
//		end if		
//	else
//		if pos(ls_name,"prac_id") < 1 then
//			messagebox(gnv_app.iapp_object.DisplayName,ls_Temp1 + " can only contain the " + ls_Temp2 + " column.")
//			if IsValid(lds_export_retrieve) then destroy lds_export_retrieve
//			return -1
//		end if			
//	end if
//	
//	destroy lds_export_retrieve
else
		 Messagebox(gnv_app.iapp_object.DisplayName,"The Contract Retrieval SQL is a required field. ~r~nPlease input a value before saving.")
		 Return  -1
end if
//end of add

return 1
//End Code Change---03.01.2006


end event

event resize;call super::resize;////long ll_percent,ll_per
//////
////
//////PixelsToUnits ( newwidth, XPixelsToUnits! )
////ll_percent = PixelsToUnits ( newwidth, XPixelsToUnits! )/this.width*100 
////////ll_per=newheight/this.height*100
////messagebox(string(PixelsToUnits ( newwidth, XPixelsToUnits! )),string(this.width))
////this.modify("datawindow.zoom = '" +string(ll_percent) + "'")
//
//
//long ll_width
//long ll_percent
//
//ll_width = pixelstoUnits(newwidth,XPixelsToUnits!)
//ll_percent = ll_width/3365 * 100
//this.modify("datawindow.zoom = '" +string(ll_percent) + "'")
end event

type tabpage_field_data from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 100
integer width = 4096
integer height = 1764
long backcolor = 79741120
string text = "Columns Properties"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
dw_findcolumn dw_findcolumn
st_find st_find
cb_findcolumn cb_findcolumn
cbx_autosave cbx_autosave
dw_fld_list dw_fld_list
dw_detail dw_detail
cb_add cb_add
cb_delete_col cb_delete_col
cb_insert cb_insert
cb_1 cb_1
cb_reorder cb_reorder
cb_copy cb_copy
st_next st_next
cb_4 cb_4
mle_1 mle_1
st_1 st_1
st_vbar_export st_vbar_export
cb_sync cb_sync
end type

on tabpage_field_data.create
this.dw_findcolumn=create dw_findcolumn
this.st_find=create st_find
this.cb_findcolumn=create cb_findcolumn
this.cbx_autosave=create cbx_autosave
this.dw_fld_list=create dw_fld_list
this.dw_detail=create dw_detail
this.cb_add=create cb_add
this.cb_delete_col=create cb_delete_col
this.cb_insert=create cb_insert
this.cb_1=create cb_1
this.cb_reorder=create cb_reorder
this.cb_copy=create cb_copy
this.st_next=create st_next
this.cb_4=create cb_4
this.mle_1=create mle_1
this.st_1=create st_1
this.st_vbar_export=create st_vbar_export
this.cb_sync=create cb_sync
this.Control[]={this.dw_findcolumn,&
this.st_find,&
this.cb_findcolumn,&
this.cbx_autosave,&
this.dw_fld_list,&
this.dw_detail,&
this.cb_add,&
this.cb_delete_col,&
this.cb_insert,&
this.cb_1,&
this.cb_reorder,&
this.cb_copy,&
this.st_next,&
this.cb_4,&
this.mle_1,&
this.st_1,&
this.st_vbar_export,&
this.cb_sync}
end on

on tabpage_field_data.destroy
destroy(this.dw_findcolumn)
destroy(this.st_find)
destroy(this.cb_findcolumn)
destroy(this.cbx_autosave)
destroy(this.dw_fld_list)
destroy(this.dw_detail)
destroy(this.cb_add)
destroy(this.cb_delete_col)
destroy(this.cb_insert)
destroy(this.cb_1)
destroy(this.cb_reorder)
destroy(this.cb_copy)
destroy(this.st_next)
destroy(this.cb_4)
destroy(this.mle_1)
destroy(this.st_1)
destroy(this.st_vbar_export)
destroy(this.cb_sync)
end on

type dw_findcolumn from datawindow within tabpage_field_data
event ue_key pbm_dwnkey
integer x = 338
integer y = 8
integer width = 443
integer height = 88
integer taborder = 70
string dataobject = "d_find_export_column_name"
borderstyle borderstyle = stylelowered!
end type

event ue_key;//Added By Jay Chen 11-02-2015
if Key = KeyEnter! and keyflags = 0  then
	cb_findcolumn.event clicked()
end if
return 0
end event

event constructor;this.settransobject( sqlca)
end event

event editchanged;//Added By Mark Lee 08/06/2015
DataWindowChild				ldwc_name
string 							ls_find
long								ll_row

if lower(string(dwo.name)) = "export_column_name" then 
	this.getchild("export_column_name",ldwc_name) 
	ldwc_name.settransobject( sqlca)

	if ldwc_name.rowcount( ) > 0 then 
		ll_row = ldwc_name.find( "lower(export_field_name) like '"+lower(string(data))+"%' ",1, ldwc_name.rowcount())		
		if ll_row > 0 then 
			ldwc_name.scrolltorow(ll_row)
			ldwc_name.selectrow( 0, false)
			ldwc_name.setrow( ll_row)			
			ldwc_name.selectrow( ll_row, true)					
		end if 
	end if 
end if 
end event

type st_find from statictext within tabpage_field_data
integer x = 23
integer y = 8
integer width = 347
integer height = 84
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Column Name:"
boolean focusrectangle = false
end type

type cb_findcolumn from commandbutton within tabpage_field_data
integer x = 782
integer y = 8
integer width = 215
integer height = 84
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Find"
end type

event clicked;//Added By Mark Lee 08/06/2015
string 			ls_text
long				ll_find
dwobject 		dwo


if cbx_autosave.checked then 
	tab_1.tabpage_field_data.dw_fld_list.setredraw( false)
	tab_1.tabpage_field_data.dw_detail.accepttext()
	if tab_1.tabpage_field_data.dw_detail.ModifiedCount() > 0 then
		of_save(false)
	end if
	tab_1.tabpage_field_data.dw_fld_list.setredraw( true)
end if

if tab_1.tabpage_field_data.dw_fld_list.rowcount( ) > 0  then 
	tab_1.tabpage_field_data.dw_findcolumn.accepttext( )
	ls_text = trim(tab_1.tabpage_field_data.dw_findcolumn.getitemstring(tab_1.tabpage_field_data.dw_findcolumn.getrow(), "export_column_name") )
	if not isnull(ls_text) and ls_text <> "" then 
		ll_find = tab_1.tabpage_field_data.dw_fld_list.find( "lower(export_field_name) like '"+lower(ls_text)+"%' ",1, tab_1.tabpage_field_data.dw_fld_list.rowcount() )
		if ll_find > 0 then 
//			dwo = tab_1.tabpage_field_data.dw_fld_list.object.export_field_name	
			tab_1.tabpage_field_data.dw_fld_list.scrolltorow(ll_find)
			tab_1.tabpage_field_data.dw_fld_list.selectrow( 0, false)
			tab_1.tabpage_field_data.dw_fld_list.setrow( ll_find)			
//			tab_1.tabpage_field_data.dw_fld_list.selectrow( ll_find, true)	
			
//			tab_1.tabpage_field_data.dw_fld_list.event clicked( 0,0, ll_find, dwo)
//			tab_1.tabpage_field_data.dw_fld_list.event rowfocuschanged(ll_find)
		else
			Messagebox(gnv_app.iapp_object.DisplayName,"The value '"+ls_text+"' cannot be found in the export column names.")			
		end if 
	end if 
end if 
end event

type cbx_autosave from checkbox within tabpage_field_data
boolean visible = false
integer x = 2405
integer y = 56
integer width = 800
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Auto Save when changing fields"
boolean checked = true
end type

type dw_fld_list from u_dw within tabpage_field_data
integer x = 23
integer y = 120
integer width = 960
integer height = 1632
integer taborder = 11
boolean bringtotop = true
string dataobject = "d_export_flds_list"
boolean hscrollbar = true
borderstyle borderstyle = stylebox!
end type

event constructor;This.SetRowFocusIndicator( Hand! )
This.of_SetReqColumn( TRUE )
This.of_SetTransObject( SQLCA )

end event

event rowfocuschanged;call super::rowfocuschanged;Integer li_table_id
long recid
datawindowchild dwchild
//IF NOT lb_new THEN
//	dw_detail.ScrollToRow( currentrow )
//	dw_detail.SetRow( currentrow )
//END IF
IF currentrow < 1 THEN
	Return
END IF

recid = this.getitemnumber(currentrow,"rec_id")
il_recid = recid
dw_detail.settransobject(sqlca)
dw_detail.retrieve(recid )

IF dw_detail.RowCount() > 0 THEN
	li_table_id = dw_detail.GetItemNumber( 1, "intcred_table" )
	dw_detail.GetChild( "intcred_field", dwchild )
	dwchild.SetTransObject( SQLCA )
	//messagebox("li_table_id",li_table_id)
	dwchild.Retrieve( li_table_id )
	dwchild.insertrow(1)//maha
	dwchild.setitem(1,"table_id",0)//maha
	//dwchild.setitem(1,"table_name_allias","None")//maha
	//Start Code Change ----10.23.2008 #V85 maha - filter field list
	long ll_field
	long ll_find
	string s
	string ls_lookup_type
	string ls_type_filter
	ll_field = dw_detail.getitemnumber(1,"intcred_field")
	ll_find = dwchild.Find("field_id=" + string(ll_field),1,dwchild.RowCount())
	if ll_find > 0 then
		s = dwchild.GetItemString(ll_find,"field_name")
		ls_lookup_type = dwchild.GetItemString(ll_find,"lookup_type")
		dw_detail.GetChild( "lu_field_name", dwchild ) //set list filter
		if len(ls_lookup_type) > 0 then
			This.GetChild( "lu_field_name", dwchild )
			choose case ls_lookup_type
				case "A","C"
					ls_type_filter  = "type = '" + ls_lookup_type + "' or type = 'B'"
				case else
					ls_type_filter  = "type = '" + ls_lookup_type + "'"
			end choose
			integer res
			res = dwchild.setfilter(ls_type_filter )
			if res < 1 then
				messagebox("rowfocuschanged;  filter failed",ls_type_filter )
			else
				dwchild.filter()
			end if
		end if
	end if
	//End Code Change---10.23.2008
	dw_detail.Modify("export_field_name.protect='1'~texport_field_name.background.color='12632256'")  //Added By Jay Chen 07-31-2014
END IF

//messagebox("cnt",testcnt)
end event

event clicked;call super::clicked;Integer li_row
//integer recid
//datawindowchild dwchild
//
li_row = this.getclickedrow() 
//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 04.28.2006 By: Liu Hongxin
//$<reason> Fix a defect.
/*
if li_row < 1 THEN
	Return
END IF

if cbx_autosave.checked then //maha 061405
	//if tab_1.tabpage_field_data.dw_detail.getitemstatus(1,0,primary!) = newmodified! or tab_1.tabpage_field_data.dw_detail.getitemstatus(1,0,Primary!) = datamodified! then
		setredraw( false)
		cb_save.triggerevent(clicked!)
*/
if li_row < 1 or li_row = this.GetRow() THEN
	Return
END IF

if cbx_autosave.checked then //maha 061405
		setredraw( false)
		dw_detail.accepttext() //Start Code Change ---- 12.06.2006 #V7 maha
		if dw_detail.ModifiedCount() > 0 then
//			cb_save.triggerevent(clicked!)			//Added By Mark Lee 09/29/2013
			of_save(false)
		end if
//---------------------------- APPEON END ----------------------------

		//--------------------------- APPEON BEGIN ---------------------------
		//$<ID> PT-01
		//$<comment> 04.28.2006 By: Liu Hongxin
		//$<reason> Performance tuning.
		//$<modification> Comment out the following script since cb_save has alreay provided the same
		//$<modification> functionality.
		/*
		this.setrow(li_row)
		this.scrolltorow(li_row)
		*/
		//---------------------------- APPEON END ----------------------------
		setredraw( true)
	//end if
end if

//
//recid = this.getitemnumber(row,"rec_id")
//
//dw_detail.settransobject(sqlca)
//
//dw_detail.retrieve(recid )
//

//IF dw_detail.RowCount() > 0 THEN
//	li_table_id = dw_detail.GetItemNumber( dw_detail.getrow(), "intcred_table" )
//	dw_detail.GetChild( "intcred_field", dwchild )
//	dwchild.SetTransObject( SQLCA )
//	dwchild.Retrieve( li_table_id )
////	dwchild.insertrow(1)//maha
////	dwchild.setitem(1,"table_id",0)//maha
////	dwchild.setitem(1,"table_name_allias","None")//maha
//END IF


end event

type dw_detail from u_dw within tabpage_field_data
event ue_generate_dddw ( string dwoname,  string data,  integer row,  ref boolean ab_ctx_id_existed )
event ue_column_check ( string data,  integer row )
event ue_set_reqfilter ( long al_req_id )
integer x = 1006
integer y = 120
integer width = 2478
integer height = 1632
integer taborder = 11
boolean bringtotop = true
string dataobject = "d_export_flds_detail"
boolean livescroll = false
borderstyle borderstyle = stylebox!
end type

event ue_generate_dddw(string dwoname, string data, integer row, ref boolean ab_ctx_id_existed);//--------------------------- APPEON BEGIN ---------------------------
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

//Added By Ken.Guo 2016-05-24
String ls_find
Long ll_find
n_ds lds_cc_custom_fields
lds_cc_custom_fields = Create n_ds
lds_cc_custom_fields.dataobject = 'd_contact_custom_configlist'
lds_cc_custom_fields.settransobject(sqlca)
lds_cc_custom_fields.retrieve()

setnull(ls_table_name)
This.GetChild( dwoname, ldwc_ctxscrn )
li_found = ldwc_ctxscrn.Find( "screen_id = " + string( data ), 1, ldwc_ctxscrn.rowcount() )
if li_found > 0 then
	This.GetChild( "export_fields_ctx_column_name", ldwc_fields )
	This.GetChild( "export_fields_ctx_linkfromcolumn", ldwc_linkfromcolumn )
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
		This.SetItem( row, "export_fields_ctx_scrn_dataobject", ls_dataobject )
		If dwoname = 'export_fields_ctx_scrn_id' Then 
			This.SetItem( row, "export_fields_ctx_table_name", ls_table_name )				//Added By Mark Lee 07/19/2013
			ls_export_fields_web_visible = this.GetItemString(row,'export_fields_web_visible')
			if not isnull(ls_export_fields_web_visible) and ls_export_fields_web_visible = '1' then 
				if not isvalid(ln_export_apb ) then ln_export_apb = Create pfc_n_cst_ai_export_apb
				if ln_export_apb.of_exists_export_table(ls_table_name) = false then 
					This.SetItem( row, "export_fields_web_visible", '0' )	
				end if 
				Destroy ln_export_apb
			end if 			
		End IF 
	end if
		
	if ldwc_fields.RowCount() < 1 then   
		dw_screen.dataobject = ls_dataobject
		//Dynamic generate dddw base on view -- jervis 08.06.2009
			if data <> '12' and long(data) < 1000 then	
				ls_tab_name = gnv_data.of_get_table_name( long(data), 'C', 'tab_name')
		
				ldw[1] = dw_screen
				
				ls_dw_name[1] 		= gnv_data.of_get_table_name( long(data), 'C', 'dw_name')
				ls_dataobjects[1] 	= ls_dataobject //gnv_data.of_get_table_name( long(data), 'C', 'dataobject')
				
				f_create_contract_dw(il_view_id,ls_tab_name,ldw,ls_dw_name,ls_dataobjects)
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
				//Added By Mark Lee 03/05/2014
				if ls_dataobject = 'd_cntx_action_items_browse' and (lower(ls_colname) = 'selected' or lower(ls_colname) = 'letter_to_name' or lower(ls_colname) = 'letter_from_name'  or lower(ls_colname) = 'alm_action_title')	then continue
				if ls_dataobject = 'd_contract_det_master' and lower(ls_colname) = 'total_processing_time' then continue
				if ls_dataobject = 'd_dm_new_sell_document' and lower(ls_colname) = 'from_templete_id' then continue
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
				if data = '57' or  data = '1' or  data = '43' or  data = '32'  then continue 
				if (data = '6' or data = '7') and (lower(ls_colname) = 'phone_ext' or lower(ls_colname) = 'contact_type' or lower(ls_colname) = 'contact_title' or lower(ls_colname) = 'contact_department' or lower(ls_colname) = 'facility_name') then continue //Added By Jay Chen 10-29-2015
				
				ls_label = dw_screen.Describe( ls_colname + "_t.text")
				if ls_label = "?" or ls_label = "!" then ls_label = ""
				if ls_label = '' then ls_label = ls_dbname
				
				//Modified By Ken.Guo 2017-07-07. check editmask. use editmask first.
				If  dw_screen.Describe("#"+string( i ) + ".edit.style") = 'editmask' Then
					ls_format = dw_screen.Describe("#"+string( i ) + ".editmask.mask")
				Else
					ls_format = dw_screen.Describe("#"+string( i ) + ".format") //jervis 09.06.2010
				End If
		
				//Added By Ken.Guo 2016-05-24. Get the custom field Label from Contact Window
				If (data = '2001'  or data = '2003') and Left(ls_colname, 7) = 'custom_'  Then
					If data = '2001' Then
						ls_find = ' field_name =  "' + ls_colname +  '" and field_falg = "P"'
					End If
					If data = '2003' Then
						ls_find = ' field_name =  "' + ls_colname +  '" and field_falg = "C"'
					End If					
					ll_find = lds_cc_custom_fields.find(ls_find, 1, lds_cc_custom_fields.rowcount())		
					If ll_find > 0 Then
						If trim(lds_cc_custom_fields.GetItemString(ll_find, 'field_label')) <> '' and Not isnull(lds_cc_custom_fields.GetItemString(ll_find, 'field_label')) Then
							ls_label = lds_cc_custom_fields.GetItemString(ll_find, 'field_label')
						End If
					End If
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
//				if ls_temp = ls_table  or data = '12' or data = '56' then	//12-Export Profile detail-jervis 03.17.2009 //Added By Jay Chen 03-11-2014 Remark:add dddw fields Document Manager->Document Tab->Document Browse
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
						ldwc_fields.SetItem(li_inserted,"field_display_name",ls_dddw_display)
					//elseif ls_dddw_data = 'facility_id' and dw_screen.Describe("#"+string( i ) + ".dddw.name") = 'd_dddw_company' then
					elseif ls_dddw_data = 'facility_id' and (dw_screen.Describe("#"+string( i ) + ".dddw.name") = 'd_dddw_company' or dw_screen.Describe("#"+string( i ) + ".dddw.name") = 'd_dddw_company_list') then
						ldwc_fields.SetItem(li_inserted,"field_type","P")
						//Added By Mark Lee 03/05/2014
					elseif ls_dddw_data = 'facility_id' and (dw_screen.Describe("#"+string( i ) + ".dddw.name") = 'd_dddw_facility_link' ) then 
						//   WHERE app_facility.corp_office_flag = 1    
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

end event

event ue_column_check(string data, integer row);//--------------------------- APPEON BEGIN ---------------------------
//$<add> 2006-11-29 By: Rodger Wu (doc painter)
//$<reason> New event.

datastore lds_dataobject
string ls_dataobject, ls_temp
char lc_null
datawindowchild dwchild
long ll_find
string 		ls_tag, ls_dddw_name

SetNull( lc_null )

ls_dataobject = This.GetItemString( row, "export_fields_ctx_scrn_dataobject" )
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
	//comment by jervis 11.26.2009
	/*
	lds_dataobject = create datastore
	lds_dataobject.dataobject = ls_dataobject
	ls_temp = lower( lds_dataobject.Describe( data + ".dddw.datacolumn" ) )
	*/
	//Add Comany dddw process -- Jervis 12.9.2009
	ls_temp = data
	if isnull(ls_temp) then ls_temp = ''
	if this.getchild("export_fields_ctx_column_name",dwchild) = 1 then
		ll_find = dwchild.find("field_name = '" + ls_temp +"'",1,dwchild.rowcount())
		If ll_find > 0 Then ls_temp = dwchild.GetItemString(ll_find,"field_type")
	End If
End If
//---------------------------- APPEON END ----------------------------
if ls_temp = '?' or ls_temp = '!' then
	This.SetItem( row, "export_fields_ctx_lookup_type", lc_null )
	This.SetItem( row, "lu_field_name", lc_null )
elseif ls_temp = "lookup_code" or ls_temp = "C" then
	This.SetItem( row, "export_fields_ctx_lookup_type", 'C' )
elseif ls_temp = "P" then	//Company dddw -- jervis 12.9.2009
	This.SetItem( row, "export_fields_ctx_lookup_type", 'P' )
//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 03.20.2007 By: Jack (Export)
//$<reason> Fix a defect.
/*
else
	This.SetItem( row, "export_fields_ctx_lookup_type", lc_null )	
	This.SetItem( row, "lu_field_name", lc_null )
*/
elseif ls_temp = 'facility_id' and This.getitemstring(row,'export_field_name') = 'company_id' Then
	This.SetItem( row, "export_fields_ctx_lookup_type", 'C' )
elseif ls_temp = 'contact_id' Then
	This.SetItem( row, "export_fields_ctx_lookup_type", 'C' )
elseif ls_temp = 'ctx_req_profile_id' then	//Jervis 03.16.2009
	This.SetItem( row, "export_fields_ctx_lookup_type", 'R' )
elseif ls_temp = "loc_id" then
	This.SetItem( row, "export_fields_ctx_lookup_type", 'L' ) // Jervis 06.09.2009
elseif ls_temp = "parent_comp_id" then	//06.23.2009 by jervis
	This.SetItem( row, "export_fields_ctx_lookup_type", 'M' ) 			
else
	This.SetItem( row, "export_fields_ctx_lookup_type", lc_null )	
	This.SetItem( row, "lu_field_name", lc_null )
//---------------------------- APPEON END ----------------------------
end if

//Begin - Added By Mark Lee 10/16/2013
if ls_temp = '?' or ls_temp = '!' then
	This.Setitem(row,"lookup_field_style",lc_null)			//Added By Mark Lee 10/16/2013				
	This.Setitem(row,"lookup_code",lc_null)			//Added By Mark Lee 10/16/2013		
else
	if isvalid(dw_screen) then 
		ls_dddw_name = dw_screen.describe( data+".dddw.name")
		if not (isnull(ls_dddw_name) or ls_dddw_name = '?' or ls_dddw_name = '!' or trim(ls_dddw_name) = '' ) then
			ls_tag = dw_screen.describe( data+".tag")
			if isnull(ls_tag) or ls_tag = '?' or ls_tag = '!' or trim(ls_tag) = '' then
				if string(data ) = "app_facility" and  ls_dddw_name = "dddw_contact_company_new" then 
					SetItem( row, "lu_field_name", "facility_name" )						//data value is facility_id. 
					SetItem( row, 'lookup_code', ""  )				
					Setitem(row,"lookup_field_style",'P')			
				elseif ls_dddw_name = "d_dddw_users" then
					SetItem( row, "lu_field_name", "user_id" )	
					SetItem( row, 'lookup_code', ""  )				
					Setitem(row,"lookup_field_style",'U')		
				elseif ls_dddw_name = "d_code_lookup_country" and ls_dataobject = "d_facility_detail" and string(data ) = "country" then
					SetItem( row, 'lookup_code', "Country"  )				
					Setitem(row,"lookup_field_style",'C')		
				else
					Setitem(row,"lookup_field_style",lc_null)			
					SetItem( row, 'lookup_code', lc_null)				
				end if 
			else
				if len(ls_tag) = 1 and ls_dddw_name ="d_dddw_company_list" then 
					SetItem( row, 'lookup_code', ls_tag  )				
					Setitem(row,"lookup_field_style",'P')											//Added By Mark Lee 10/16/2013	default is code_lookup	
					SetItem( row, "lu_field_name", "facility_name" )	
				else
					SetItem( row, 'lookup_code', ls_tag  )				
					Setitem(row,"lookup_field_style",'C')											//Added By Mark Lee 10/16/2013	default is code_lookup	
				end if
			end if 
			
		end if 
		//Added By Jay Chen 03-05-2014
		if isnull(ls_dddw_name) or ls_dddw_name = '?' or ls_dddw_name = '!' or trim(ls_dddw_name) = '' then
			if lower(ls_dataobject) = 'd_contract_det_contact_external' then
				if lower(data) = 'contact_id' then SetItem( row, "lu_field_name", "contact_id" )	
				if lower(data) = 'facility_id' then SetItem( row, "lu_field_name", "facility_name" )	
			end if
			//Added By Jay Chen 06-24-2014 Remark: set location table field default value = 'Location Name' when select column loc_id
			if lower(ls_dataobject) = 'd_contract_group_linked_locations' then
				if lower(data) = 'loc_id' then SetItem( row, "lu_field_name", "street" )
			end if
			//end
		end if
		//end add
	end if 
end if 
//End - Added By Mark Lee 10/16/2013

end event

event ue_set_reqfilter(long al_req_id);//Set Req Filter
//ctx_req_profile_hdr.ctx_req_profile_id = 1 and 
//ctx_rqmnt_category.category_name = 'Categroy two' and
//ctx_req_tmplt_element.element_name = 'two-Req-two'

long ll_profield_id
string ls_category_name
string ls_req_name
string ls_filter

select element_name,ctx_req_tmplt_element.ctx_req_profile_id,category_name 
into :ls_req_name,:ll_profield_id,:ls_category_name
from ctx_req_tmplt_element,ctx_rqmnt_category
where ctx_req_tmplt_element.ctx_rqmnt_category_id = ctx_rqmnt_category.ctx_rqmnt_category_id 
	and ctx_req_tmplt_element.ctx_req_profile_id = ctx_rqmnt_category.ctx_req_profile_id 
	and ctx_req_tmplt_element_id = :al_req_id;

ls_filter = "ctx_req_profile_hdr.ctx_req_profile_id = " + string(ll_profield_id) + &
				" and ctx_rqmnt_category.category_name = '" + ls_category_name + "' " + &
				" and ctx_req_tmplt_element.element_name = '" + ls_req_name + "'"
				
this.SetItem( 1,"filter_query",ls_filter)
end event

event constructor;This.of_SetReqColumn( TRUE )
//This.of_SetUpdateAble( False )
This.of_SetTransObject( SQLCA )

DataWindowChild dwchild

This.GetChild( "facility_id", dwchild )
dwchild.settransobject(sqlca)
dwchild.retrieve()
dwchild.insertrow(1)

//This.GetChild( "lu_field_name", dwchild )
//dwchild.settransobject(sqlca)
//dwchild.retrieve()
//dwchild.insertrow(1)

//==============================APPEON BEGIN==========================
// $<Added>:   Date: Nov 05,2007       Author:Nova
//--------------------------------------------------------------------
// $<reason>   Fix a defect.
this.of_setresize(true)
this.inv_resize.of_setorigsize( this.width,this.height)
this.inv_resize.of_setminsize( this.width,this.height)
this.inv_resize.of_register(this.inv_resize.scale)
this.inv_resize.of_SetDetailHeight(true)
//==============================APPEON end=========================






end event

event itemchanged;call super::itemchanged;integer e
//--------------------------- APPEON BEGIN ---------------------------
//$<add> 03.20.2007 By: Jack (Export)
//$<reason> Fix a defect.
datawindowchild dwchild
long ll_find
string ls_null
String ls_field,ls_DataType//<add> andy 2007.05.23
int li_null
string ls_lookup_type //maha 2008.10.23
string ls_type_filter  //maha 2008.10.23
string ls_dddwtype
string ls_lu_name
string ls_format
string ls_export_name, ls_field_name_alias
string ls_column, ls_table, ls_tmp, ls_tag,	ls_web_visible
long 		ll_export_type
long 		ll_rec_id
pfc_n_cst_ai_export_apb  ln_export_apb
//---------------------------- APPEON END ----------------------------
IF This.GetColumnName() = "intcred_table" THEN
	//--------------------------- APPEON BEGIN ---------------------------
	//$<comment> 03.21.2007 By: Jack (Export)
	//$<reason> Fix a defect.
	/*
	datawindowchild dwchild
	*/
	//---------------------------- APPEON END ----------------------------
	This.GetChild( "intcred_field", dwchild )
	dwchild.SetTransObject( SQLCA )
	il_table_id = 	Integer( data )
	dwchild.Retrieve(il_table_id )

END IF

IF This.GetColumnName() = "intcred_field" THEN
	This.accepttext()
	//<add> 07/13/2007  by: Andy
	This.GetChild( "intcred_field", dwchild )
	dwchild.SetTransObject( SQLCA )
	ll_find = dwchild.Find("field_id=" + data,1,dwchild.RowCount())
	if ll_find > 0 then 
		ls_DataType = dwchild.GetItemString(ll_find,"field_type")
		if isnull(ls_DataType) then ls_DataType = ''
		if UPPER(ls_DataType) = 'L' OR UPPER(ls_DataType) = 'I' THEN ls_DataType = 'N'
		if UPPER(ls_DataType) = 'C' THEN ls_DataType = 'S'
		setitem(row,'ctx_column_datatype',ls_DataType)
		//<add> 08/21/2007 by: Andy 
		setitem(row,'db_lookup_type',dwchild.GetItemString(ll_find,"lookup_type"))
		//Start Code Change ----10.23.2008 #V85 maha - filter field list
		ls_lookup_type = dwchild.GetItemString(ll_find,"lookup_type")
		if len(ls_lookup_type) > 0 then
			This.GetChild( "lu_field_name", dwchild )
			choose case ls_lookup_type
				case "A","C"
					ls_type_filter  = "type = '" + ls_lookup_type + "' or type = 'B'"
				case else
					ls_type_filter  = "type = '" + ls_lookup_type + "'"
			end choose
			integer res
			res = dwchild.setfilter(ls_type_filter )
			if res < 1 then
				messagebox("itemchanged;  filter failed",ls_type_filter )
			else
				dwchild.filter()
			end if
		end if
		//End Code Change---10.23.2008
	end if
	//end of add
END IF

IF This.GetColumnName() = "export_fields_export_type" THEN
	this.accepttext( )
	if integer(data) = 2 then
		//Begin - Added By Mark Lee 10/14/2013
		ll_rec_id = this.GetItemNumber( row, "rec_id")
		if not isnull(ll_rec_id) and ll_rec_id > 0 then 
			ls_tmp = ""
			select top 1 request_form.request_name 
			into :ls_tmp
			from request_form, request_form_detail
			where request_form.request_id = request_form_detail.request_id and request_form_detail.rec_id = :ll_rec_id
			using sqlca;
			
			if len(ls_tmp) > 0 then
				this.setItem( row, "export_fields_export_type", 1)
				messagebox(gnv_app.iapp_object.DisplayName,"This column data is already used in the Request Form "+ls_tmp+" ~r~nso you cannot change it.")
				return 2
			end if 
		end if
		//End - Added By Mark Lee 10/14/2013
		
		//<add> andy 2007.05.28
		//<reason> Fix a defect. bug:BugG053002
		this.setitem(row,"export_fields_ctx_scrn_id",0)
		this.setitem(row,"export_fields_ctx_column_name",'')
		this.setitem(row,"ctx_column_datatype",'S')
		//end of add
		this.setitem(row,"intcred_record_number",0)
		this.setitem(row,"intcred_table",0)
		this.setitem(row,"intcred_field",0)
		//<add> 08/21/2007 by: Andy
		setnull( ls_null )
		this.setitem(row,"export_fields_ctx_lookup_type",ls_Null)
		this.setitem(row,"lookup_field_style",ls_Null)			//Added By Mark Lee 10/16/2013
		this.setitem(row,"lookup_code",ls_Null)			//Added By Mark Lee 10/16/2013		
		this.SetItem(row,"record_level",'C') //05.12.2009 by jervis
		This.Setitem( Row, 'export_fields_ctx_table_name', ls_Null)				//Added By Mark Lee 08/02/2013
		This.setitem( Row, 'export_fields_data_view_label', ls_Null)					//Added By Mark Lee 08/02/2013
		this.SetItem( row, "export_fields_web_visible", '0')							//Added By Mark Lee 09/23/2013
	elseif integer(data) = 1 then
		this.setitem(row,"intcred_record_number",1)
		//$<add> 04.14.2008 by Andy
		SetNull(li_null)
		This.SetItem( row, "export_fields_ctx_scrn_id", li_null)
		//end 04.14.2008
	//<add> andy 2007.05.24	
	elseif long(data) = 3 then
		//Begin - Added By Mark Lee 10/14/2013
		ll_rec_id = this.GetItemNumber( row, "rec_id")
		if not isnull(ll_rec_id) and ll_rec_id > 0 then 
			ls_tmp = ""
			select top 1 request_form.request_name 
			into :ls_tmp
			from request_form, request_form_detail
			where request_form.request_id = request_form_detail.request_id and request_form_detail.rec_id = :ll_rec_id
			using sqlca;
			
			if len(ls_tmp) > 0 then
				this.setItem( row, "export_fields_export_type", 1)
				messagebox(gnv_app.iapp_object.DisplayName,"This column data is already used in the Request Form "+ls_tmp+" ~r~nso you cannot change it.")
				return 2
			end if 
		end if
		//End - Added By Mark Lee 10/14/2013
		this.setitem(row,"export_fields_ctx_scrn_id",0)
		this.setitem(row,"export_fields_ctx_scrn_dataobject",'')
		this.setitem(row,"export_fields_ctx_column_name",'')
	//end of add
		//<add> andy 2007.07.13	
		this.setitem(row,"intcred_table",0)
		this.setitem(row,"intcred_field",0)
		//end of add
		//<add> 08/21/2007 by: Andy
		setnull( ls_null )
		this.setitem(row,"export_fields_ctx_lookup_type",ls_Null)
		this.setitem(row,"lookup_field_style",ls_Null)			//Added By Mark Lee 10/16/2013		
		this.setitem(row,"lookup_code",ls_Null)			//Added By Mark Lee 10/16/2013			
		this.SetItem(row,"record_level",'C') //05.12.2009 by jervis
		This.Setitem( Row, 'export_fields_ctx_table_name', ls_Null)				//Added By Mark Lee 08/02/2013
		This.setitem(Row, 'export_fields_data_view_label', ls_Null)					//Added By Mark Lee 08/02/2013
		this.SetItem( row, "export_fields_web_visible", '0')							//Added By Mark Lee 09/23/2013
		 //e = tab_1.tabpage_export_hdr.dw_export_file.getitemnumber(1,"export_type")
		// messagebox("export_type","test")
//		if e = 1 then// this is not working
//			messagebox("Data Entry Error","You have selected Data Only as the export type for this export and have selected Fixed text for the field type.  If you wish to use text in the export you must change the export type to Text & Data")
//			return
//		end if
	end if
	//<add> andy 2007.05.23
	of_setui(long(data))
	//end of add
END IF

if This.GetColumnName() = "export_code" THEN
	//Only code Lookup -- jervis 08.07.2009
	this.GetChild( "lu_field_name",dwchild)
	if isnumber(dwchild.Describe("lookup_code.x")) then
		this.setitem(row,"lu_field_name","lookup_code")
	end if
end if

if This.GetColumnName() = "dept_sect_field" THEN
		this.setitem(row,"lu_field_name","lookup_code")
end if

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 2006-11-28 By: Rodger Wu


boolean lb_ctx_id_existed

if dwo.name = "export_fields_ctx_scrn_id" then
	This.Trigger Event ue_generate_dddw( dwo.name, data, row, lb_ctx_id_existed )
	setnull( ls_null )
	This.SetItem( row, "export_fields_ctx_column_name", ls_null )
	This.SetItem( row, "export_fields_ctx_lookup_type", ls_null )
	This.setitem(row,"lookup_field_style",ls_Null)			//Added By Mark Lee 10/16/2013	
	this.setitem(row,"lookup_code",ls_Null)			//Added By Mark Lee 10/16/2013		
	This.SetItem( row, "lu_field_name", ls_null )	
	This.SetItem( row,"filter_query",ls_null)												//Added By Mark Lee 02/01/2013
	//--------------------------- APPEON BEGIN ---------------------------
	//$<add> 03.26.2007 By: Jack (Export)
	//$<reason> Fix a defect.
	If data = '2003' Then lb_ctx_id_existed = True
	//---------------------------- APPEON END ----------------------------

	if lb_ctx_id_existed then
		This.SetItem( row, "export_fields_ctx_uselink", 0 )
	else
		This.SetItem( row, "export_fields_ctx_uselink", 1 )
	end if
	
	
	if data = "12" then  //Set Default link for Profile detail -- 06.25.2009 by jervis
		this.SetItem(row,"export_fields_ctx_linkfromcolumn","ctx_req_profile_hdr_id")
		this.SetItem(row,"export_fields_ctx_linktoscrnid",11)
		of_ctx_generate_linktocolumn("export_fields_ctx_linktoscrnid", "11", row )
		this.SetItem(row,"export_fields_ctx_linktocolumn","ctx_req_profile_hdr_id")
		
		this.SetItem(row,"export_fields_ctx_column_name","data_value")	//jervis 08.31.2009 - from john request.
	elseif data = '2001' or data = '2002' then//Set Default link for contact detail and contact number - jervis 03.30.2011
		this.SetItem(row,"export_fields_ctx_linkfromcolumn","contact_id")
		this.SetItem(row,"export_fields_ctx_linktoscrnid",7)
		of_ctx_generate_linktocolumn("export_fields_ctx_linktoscrnid", "7", row )
		this.SetItem(row,"export_fields_ctx_linktocolumn","contact_id")
	else
		setnull( li_null )
		This.SetItem( row, "export_fields_ctx_linkfromcolumn", ls_null )
		This.SetItem( row, "export_fields_ctx_linktoscrnid", li_null )
		This.SetItem( row, "export_fields_ctx_linktocolumn", ls_null )
	end if
	//--------------------------- APPEON BEGIN ---------------------------
	//$<add> 03.20.2007 By: Jack (Export)
	//$<reason> Fix a defect.
	If This.getitemstring(row,'export_field_name') = 'company_id' Then
		dw_detail.getchild("export_fields_ctx_column_name",dwchild)
		ll_find = dwchild.find("field_name = 'app_facility'",1,dwchild.rowcount())
		If ll_find > 0 Then
			dwchild.setitem(ll_find,'field_name_alias','Company ID')
		End If
	End If
	//---------------------------- APPEON END ----------------------------	

	//Set Default Filter Value For Location Facility--jervis 06.11.2009
	if data = "19" then		//Location Facility Screen
		ls_type_filter = this.GetItemString(row,"filter_query")
		if ls_type_filter = "" or isnull(ls_type_filter) then
			this.SetItem( row,"filter_query","ctx_loc.loc_id <> 0")
		end if
	end if
	if data = '18' then	//Parent Organization screen
		ls_type_filter = this.GetItemString(row,"filter_query")
		if ls_type_filter = "" or isnull(ls_type_filter) then
			this.SetItem( row,"filter_query","ctx_loc.loc_id = 0")
		end if
	end if
end if

if dwo.name = "export_fields_ctx_linktoscrnid" then
	of_ctx_generate_linktocolumn( dwo.name, data, row )
	setnull( ls_null )
	This.SetItem( row, "export_fields_ctx_linktocolumn", ls_null )
end if

if dwo.name = "export_fields_ctx_column_name" then
	setnull( ls_null )
	SetItem( row, 'lu_field_name', ''  )
	SetItem( row, 'lookup_code', ls_null )			//Added By Mark Lee 10/15/2013
	SetItem( row, "lookup_field_style",ls_null)			//Added By Mark Lee 10/16/2013				

	This.Trigger Event ue_column_check( data, row )
	//--------------------------- APPEON BEGIN ---------------------------
	//$<add> 03.20.2007 By: Jack (Export)
	//$<reason> Fix a defect.
	of_set_lookup_dddw()	
	
	//<add> andy 2007.05.23 set ctx_column_datatype
	ls_field = data
	if isnull(ls_field) then ls_field = ''
	if this.getchild("export_fields_ctx_column_name",dwchild) = 1 then
		ll_find = dwchild.find("field_name = '" + ls_field +"'",1,dwchild.rowcount())
		If ll_find > 0 Then
			ls_DataType = dwchild.GetItemString(ll_find,"field_datatype")
			ls_dddwtype = dwchild.GetItemString(ll_find,"field_type")	//jervis 09.06.2010
			setitem(row,'ctx_column_datatype',ls_DataType)
			
			//Add by jervis -- 11.26.2009
			//ls_dddwtype = dwchild.GetItemString(ll_find,"field_type")
			//setitem(row,'export_fields_ctx_lookup_type',ls_dddwtype)
			
			//Init field format and lookup - jervis 09.06.2010
			if ls_dddwtype = 'C' then
				ls_lu_name = dwchild.GetItemString(ll_find,"field_display_name")
				if ls_lu_name = 'compute_code_number' or ls_lu_name = 'compute_description_number' then ls_lu_name = 'Code' //Modified By Jay Chen 07-03-2015
				this.SetItem( row, "lu_field_name", ls_lu_name)
			end if
			
			ls_format = this.GetItemString( row, "Export_format")
			if  ls_format = "None" or ls_format = "" or isnull(ls_format) then
				ls_format = dwchild.GetItemString(ll_find,"field_format")
				if not isnull(ls_format) and ls_format <> "" and ls_format <> '[general]' then
					this.SetItem( row,"export_format",ls_format)
				end if
			end if
			//Begin - Added By Mark Lee 07/22/2013.
			ls_field_name_alias = dwchild.GetItemString(ll_find,"field_name_alias")
			this.SetItem( row, 'export_fields_data_view_label',ls_field_name_alias)
			//End - Added By Mark Lee 07/22/2013.
			 
			//Init Export Field Name - jervis 09.06.2010
			ls_export_name = this.GetItemString( row, "Export_Field_name")
			if ls_export_name = "" or isnull(ls_export_name) then
				ls_export_name = of_build_alias(dwchild.GetItemString(ll_find,"field_name_alias"))
				if len(ls_export_name) >40 then ls_export_name = left(ls_export_name,40)							//Added By Mark Lee 04/15/2015
				if ls_export_name <> "" then this.SetItem( row, "Export_Field_name",ls_export_name)
			end if
			
			//Added By Jay Chen 01-23-2016
			string ls_display_field,ls_lookup_field_style,ls_lookup_code
			if this.GetItemNumber(row,"export_fields_ctx_scrn_id") = 2003 and left(lower(ls_field),7)='custom_' then //app_facility custom
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
					this.SetItem( row, 'export_fields_ctx_lookup_type','C')
					this.SetItem( row, "lu_field_name", ls_display_field)
					this.SetItem( row, 'lookup_field_style',ls_lookup_field_style)
					this.SetItem( row, 'lookup_code',ls_lookup_code)
				end if
			end if
			if this.GetItemNumber(row,"export_fields_ctx_scrn_id") = 2001 and left(lower(ls_field),7)='custom_' then //ctx_contacts custom
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
					this.SetItem( row, 'export_fields_ctx_lookup_type','C')
					this.SetItem( row, "lu_field_name", ls_display_field)
					this.SetItem( row, 'lookup_field_style',ls_lookup_field_style)
					this.SetItem( row, 'lookup_code',ls_lookup_code)
				end if
			end if
			//end
			
		End If		
	end if
	//end of add
	
	//Begin - Added By Mark Lee 09/23/2013.
	ls_web_visible = this.GetItemString(row,"export_fields_web_visible")
	if not isnull(ls_web_visible) and ls_web_visible = '1' then 
		ls_column = this.GetItemString(row,"export_fields_ctx_column_name")
		ls_table = this.GetItemString(row,"export_fields_ctx_table_name")			

		if not isvalid(ln_export_apb ) then ln_export_apb = Create pfc_n_cst_ai_export_apb
		if ln_export_apb.of_exists_export_table(ls_table) = false then 
			this.SetItem( row, "export_fields_web_visible", '0')	
			Destroy ln_export_apb	
			return 
		end if
		Destroy ln_export_apb	
		
		if (lower(trim(ls_column)) ='category_name' ) and lower(trim(ls_table)) ='ctx_elements'	then
			this.SetItem( row, "export_fields_web_visible", '0')
		elseif not isnull(ls_column) and not isnull(ls_table) and ls_table ='ctx_basic_info' and ls_column = 'ctx_id' then
			this.SetItem( row, "export_fields_web_visible", '0')
		elseif not isnull(ls_column) and not isnull(ls_table) and ls_table ='ctx_contacts' and (ls_column = 'contact_id' or ls_column = 'user_d') then					//Added By Mark Lee 05/25/2015
			this.SetItem( row, "export_fields_web_visible", '0')
		elseif not isnull(ls_column) and not isnull(ls_table) and ls_table ='ctx_contacts_numbers' and (ls_column = 'contact_id' or ls_column = 'contact_num_id' or ls_column = 'record_id' or ls_column = 'via') then
			this.SetItem( row, "export_fields_web_visible", '0')			
		else
			Select count(1)
			Into :ll_find
			From syscolumns , systypes 
			Where syscolumns.xtype = systypes.xtype and object_name(syscolumns.id) = :ls_table and syscolumns.name = :ls_column 
			using sqlca;
			if ll_find = 0 then 
				this.SetItem( row, "export_fields_web_visible", '0')
		//		Messagebox(gnv_app.iapp_object.DisplayName,"The Contract Logix Field is compute column, it cannot be visible in Request Form Painter. ")
			end if
		end if 
	end if 
	//End - Added By Mark Lee 09/23/2013.
	//---------------------------- APPEON END ----------------------------
end if

//<add> andy 2007.06.01 
//Use the data type of the displayed column as the data type of the column
if dwo.name = "lu_field_name" then 
	ls_field = data
	if isnull(ls_field) then ls_field = ''
	if this.getchild("lu_field_name",dwchild) = 1 then 
		ll_find = dwchild.find("field_name = '" + ls_field +"'",1,dwchild.rowcount())
		If ll_find > 0 Then
			ls_DataType = dwchild.GetItemString(ll_find,"datatype")
			setitem(row,'ctx_column_datatype',ls_DataType)
		End If
	end if
end if
//end of add
//---------------------------- APPEON END ----------------------------


//Begin - Added By Mark Lee 09/23/2013.
if dwo.name = "export_fields_web_visible" then 
	This.accepttext()
	
	if integer(data) = 0 then 
		//Begin - Added By Mark Lee 10/14/2013
		ll_rec_id = this.GetItemNumber( row, "rec_id")
		if not isnull(ll_rec_id) and ll_rec_id > 0 then 
			ls_tmp = ""
			select top 1 request_form.request_name 
			into :ls_tmp
			from request_form, request_form_detail
			where request_form.request_id = request_form_detail.request_id and request_form_detail.rec_id = :ll_rec_id
			using sqlca;
			
			if len(ls_tmp) > 0 then
				this.SetItem( row, "export_fields_web_visible", '1')
				messagebox(gnv_app.iapp_object.DisplayName,"This column data is already used in the Request Form "+ls_tmp+" ~r~nso you cannot change it.")
				return 2
			end if 
		end if
	else
		//Added By Mark Lee 11/14/2013
		ls_column = this.GetItemString(row,"export_fields_ctx_column_name")
		ls_table = this.GetItemString(row,"export_fields_ctx_table_name")	
		

		//End - Added By Mark Lee 10/14/2013
			ll_export_type  = this.GetItemNumber(row,"export_fields_export_type")
			if not isnull(ll_export_type) and ll_export_type = 1 then 
				ls_column = this.GetItemString(row,"export_fields_ctx_column_name")
				ls_table = this.GetItemString(row,"export_fields_ctx_table_name")			
				
				if not isvalid(ln_export_apb ) then ln_export_apb = Create pfc_n_cst_ai_export_apb
				if ln_export_apb.of_exists_export_table(ls_table) = false then 
					this.SetItem( row, "export_fields_web_visible", '0')
					Messagebox(gnv_app.iapp_object.DisplayName,"The Contract Logix Field cannot check the Visible in Request Form Painter option.")
					Destroy ln_export_apb
					return 2
				end if 
				Destroy ln_export_apb
		
				if (lower(trim(ls_column)) ='category_name' ) and lower(trim(ls_table)) ='ctx_elements'	then
					this.SetItem( row, "export_fields_web_visible", '0')
					Messagebox(gnv_app.iapp_object.DisplayName,"The Contract Logix Field you selected is a custom field so you cannot check the Visible in Request Form Painter option. ")
					return 2
				elseif not isnull(ls_column) and not isnull(ls_table) and ls_table ='ctx_basic_info' and ls_column = 'ctx_id' then
					this.SetItem( row, "export_fields_web_visible", '0')
					Messagebox(gnv_app.iapp_object.DisplayName,"The ctx_id column cannot be visible in Request Form Painter. ")
					return 2
				elseif not isnull(ls_column) and not isnull(ls_table) and ls_table ='ctx_contacts' and (ls_column = 'contact_id' or ls_column = 'user_d' ) then						//Added By Mark Lee 05/25/2015
					this.SetItem( row, "export_fields_web_visible", '0')
					Messagebox(gnv_app.iapp_object.DisplayName,"The "+ls_column+" column cannot be visible in Request Form Painter. ")
					return 2
				elseif not isnull(ls_column) and not isnull(ls_table) and ls_table ='ctx_contacts_numbers' and ( ls_column = 'contact_id' or ls_column = 'contact_num_id'  or ls_column = 'record_id' or ls_column = 'via') then
					this.SetItem( row, "export_fields_web_visible", '0')
					Messagebox(gnv_app.iapp_object.DisplayName,"The  "+ls_column+" column cannot be visible in Request Form Painter. ")
					return 2					
				else
					Select count(1)
					Into :ll_find
					From syscolumns , systypes 
					Where syscolumns.xtype = systypes.xtype and object_name(syscolumns.id) = :ls_table and syscolumns.name = :ls_column 
					using sqlca;
					
					if ll_find = 0 then 
						this.SetItem( row, "export_fields_web_visible", '0')
						Messagebox(gnv_app.iapp_object.DisplayName,"The Contract Logix Field you selected is a compute field so you cannot check the Visible in Request Form Painter option. ")
						return 2
					end if 
				end if
			elseif not isnull(ll_export_type) and ll_export_type <> 1 then 
				this.SetItem( row, "export_fields_web_visible", '0')
				Messagebox(gnv_app.iapp_object.DisplayName,"The Visible in Request Form Painter option can only be used when the Field Type is set to Data Field.")
				return 2
			end if 
	end if 		
end if 
//End - Added By Mark Lee 09/23/2013.

//Added By Mark Lee 02/09/2015
if dwo.name = "auto_sync_field" then 
	This.accepttext()
	if integer(data) = 0 then 
		Messagebox(gnv_app.iapp_object.DisplayName,"After you click the Save button, the system will automatically synchronize the Lookup Table Field property with the setting in the Screen Painter. ")		
	end if 
end if 

//Added by gavins 20151112
If dwo.Name = 'use_default' Then
	If Data = '4' Then
		ls_column = this.GetItemString(row,"export_fields_ctx_column_name")
		ls_tmp = dw_Screen.Describe( ls_Column + ".initial" )
		If Not( ls_tmp = '!'  or ls_tmp = '?' or isnull( ls_tmp) or trim( ls_tmp ) = '' or trim(lower(ls_tmp)) = 'null' ) Then
			SetItem( row, 'default_value', ls_tmp )			
		End If
	End If	
End If

end event

event buttonclicked;call super::buttonclicked;string ls_mess,	ls_web_visible, ls_new, ls_ata_view_label
integer li_table_id

IF dwo.Name = "filter_wizard" THEN

	//--------------------------- APPEON BEGIN ---------------------------
	//$<add> 2006-11-28 By: Rodger Wu (doc painter)
	//$<reason> 
	integer li_module_type, li_found
	long ll_ctx_scrnid
	string ls_dataobject, ls_screen_alias
	datawindowchild ldwc_screen

	li_module_type = This.GetItemNumber( row, "export_fields_module_type" )
	if not isnull( li_module_type ) and ( li_module_type = 3 or li_module_type = 4 ) then
		ll_ctx_scrnid = This.GetItemNumber( 1, "export_fields_ctx_scrn_id" )
		if isnull( ll_ctx_scrnid ) then return;
		
		//Start code by jervis 05.21.2009
		if ll_ctx_scrnid = 12 then
			ls_screen_alias = "Profile detail"
			ls_dataobject = "d_export_contract_profile_wizard"
		else
		//End code by jervis 05.21.2009
			This.GetChild( "export_fields_ctx_scrn_id", ldwc_screen )
			li_found = ldwc_screen.Find( "screen_id = " + string( ll_ctx_scrnid ), 1, ldwc_screen.rowcount() )
			
			if li_found > 0 then
				ls_screen_alias = ldwc_screen.GetitemString( li_found, "screen_name" )
			end if
			ls_dataobject = This.GetItemString( row, "export_fields_ctx_scrn_dataobject" )
		end if
		
		openwithparm(w_query_wizard, ls_screen_alias + "~t" + ls_dataobject )
		ls_mess = message.stringparm
		if isnull(ls_mess) then ls_mess = '' //Added By Jay Chen 04-25-2014
		if ls_mess = "Cancel" or ls_mess = '' then //Modified By Jay Chen 04-25-2014
			return
		else
			this.setitem(row,"filter_query",ls_mess)
		end if
		
		return;
	end if
	
	//---------------------------- APPEON END ----------------------------

	li_table_id = this.getitemnumber(row,"intcred_table")
	if li_table_id = 0 or isnull(li_table_id)then
		return
	else
		openwithparm(w_query_wizard,li_table_id)
		ls_mess = message.stringparm
		if isnull(ls_mess) then ls_mess = '' //Added By Jay Chen 04-25-2014
		if ls_mess = "Cancel"  or ls_mess = '' then //Modified By Jay Chen 04-25-2014
			return
		else
			this.setitem(row,"filter_query",ls_mess)
		end if
	end if
end if

IF dwo.Name = "td" THEN
	this.setitem(row,"export_fields_field_value","&TODAY&")
end if

//Add by jervis 08.26.2009
if dwo.name = 'b_req' then	
	str_ole_ctxid lstr_parm
	lstr_parm.sl_opentype = 1
	lstr_parm.sdw_object = this
	OpenWithParm(w_agreement_template_insert_requirement,lstr_parm)
	if Message.longparm > 0 then
	end if
end if

//Added By Jay Chen 07-31-2014
if dwo.name = 'b_edit' then
	if MessageBox('Confirm Modify','You are not recommended to modify the Export Column Name because, if it is used in a template or document, it would cause the merge function to fail. Please confirm if you want to continue to modify it.',Question!,YesNo!,2) <> 1 then return
	this.Modify("export_field_name.protect='0'~texport_field_name.background.color='16777215'") 
end if
	
//Added By Mark Lee 10/08/2015	
if dwo.name = 'b_data_view_label' then
	if row > 0 then 
		ls_ata_view_label = This.GetItemString( row, "export_fields_data_view_label" )
		if isnull(ls_ata_view_label) then ls_ata_view_label = ''
		OpenWithParm( w_mle_text, "$<t***>"+"Default Request Form Label "+"<t***>$"+ls_ata_view_label)
		IF Message.StringParm = "Cancel" THEN
			Return failure				//
		ELSE
			ls_ata_view_label = String(Message.StringParm)
			if not isnull(ls_ata_view_label ) and len(ls_ata_view_label ) > 500 then ls_ata_view_label  = left(ls_ata_view_label ,500)				//Added By Mark Lee 10/09/2015
			This.SetItem( row, "export_fields_data_view_label", ls_ata_view_label  )
			this.event Itemchanged(row,object.export_fields_data_view_label,ls_ata_view_label)
		END IF		
	end if 
end if 
end event

event retrieveend;call super::retrieveend;Integer li_table_id
datawindowchild dwchild
string ls_lookup_type
string ls_type_filter
long ll_find
long ll_field
//IF rowcount < 1 THEN
//	Return
//END IF
//
if ib_lockcol then//<add> andy 2007.06.04 Because it is not need when update the history data 
	li_table_id = tab_1.tabpage_export_hdr.dw_export_file.GetItemNumber( 1, "lock_cols" )
	if isnull(li_table_id) then li_table_id = 1 //Added By Jay Chen 07-31-2014
 	if li_table_id = 1 then
	//	//messagebox("","0")
		this.object.export_field_name.protect = true
		this.object.export_field_name.background.color = 12632256
	//	//this.object.field_value.bringtotop = true
	else
			this.object.export_field_name.protect = false
		this.object.export_field_name.background.color = 16777215 //white
	//	//messagebox("",li_table_id)
	//	This.GetChild( "intcred_field", dwchild )
	//	dwchild.SetTransObject( SQLCA )
	//	dwchild.Retrieve( li_table_id )
	//	//this.object.sle_value.bringtotop = false
	//	//this.object.st_value.visible = false
	end if
end if

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 2006-11-28 By: Rodger Wu (doc painter)
//$<reason> 
integer li_module_type
long ll_ctx_scrnid, ll_ctx_linktoscrnid
boolean lb_ctx_id_existed
long ll_ExportType//<add> andy 2007.05.23

if rowcount > 0 then
	
	li_module_type = This.GetItemNumber( 1, "export_fields_module_type" )
	if not isnull( li_module_type ) and ( li_module_type = 3 or li_module_type = 4 ) then
		ll_ctx_scrnid = This.GetItemNumber( 1, "export_fields_ctx_scrn_id" )
		if not isnull( ll_ctx_scrnid ) then
			This.Trigger Event ue_generate_dddw( "export_fields_ctx_scrn_id", string( ll_ctx_scrnid ), 0, lb_ctx_id_existed )
		end if

		of_ctx_add_scrn()
		
		ll_ctx_linktoscrnid = This.GetItemNumber( 1, "export_fields_ctx_linktoscrnid" )
		if not isnull( ll_ctx_linktoscrnid ) then
			of_ctx_generate_linktocolumn( "export_fields_ctx_linktoscrnid", string( ll_ctx_linktoscrnid ), 0 )
		end if
		//--------------------------- APPEON BEGIN ---------------------------
		//$<add> 03.16.2007 By: Jack (Export)
		//$<reason> Fix a defect.
		of_set_lookup_dddw()
		//---------------------------- APPEON END ----------------------------

	end if
	//<add> andy 2007.05.23 set UI
	ll_ExportType = This.GetItemNumber(1,"export_fields_export_type")
	of_setui(ll_ExportType)
	//end of add
end if
//---------------------------- APPEON END ----------------------------


end event

event pfc_preupdate;call super::pfc_preupdate;//maha added to validate field name 062005
integer i
string 	ls_export_field_name

if this.rowcount() < 1 then
	//trap added maha 070605
else
	i = this.getrow()

	if isnumber(mid(this.getitemstring(i,"export_field_name"),1,1)) then
		messagebox("Field name Error","The field name cannot start with a number")
		return -1
	end if
	
	//Begin - Added By Mark Lee 11/29/2013
	ls_export_field_name = this.getitemstring(i,"export_field_name")
	if gnv_string.of_exists_sql_keyword(ls_export_field_name) < 0 then 
		messagebox("Field name Error","The name you supplied for the current field is a SQL key word (reserved word). ~r~nPlease choose a different name.")
		return -1
	end if 
	//End - Added By Mark Lee 11/29/2013
end if


return 1
end event

event doubleclicked;call super::doubleclicked;//messagebox('',String(dwo.name))
end event

type cb_add from u_cb within tabpage_field_data
integer x = 1783
integer y = 8
integer width = 384
integer height = 84
integer taborder = 11
boolean bringtotop = true
string text = "&Add Column..."
end type

event clicked;Integer li_nr
Long ll_rec_id

//Added By Jay Chen 02-27-2014
string ls_type
open(w_add_fields_option)
ls_type = message.stringparm
if isnull(ls_type) or ls_type = '' then return
if ls_type = 'manual' then
	lb_new = True
	//$<Modify> 03.19.2008 by Andy
	//if cb_save.triggerevent(clicked!) < 1 then return
	//if cb_save.event clicked( ) < 0 then return			//Added By Mark Lee 09/29/2013
	if of_save(false) < 0 then return
	dw_detail.Reset()
	//end of add 03.19.2008

	//ll_rec_id = gnv_app.of_get_id( "RECORD_ID" )
	//il_recid = ll_rec_id

	//$<add> 03.17.2008 by Andy
	Long ll_order
	ll_order = Long(dw_fld_list.describe("Evaluate('max(export_order)',0)"))
	if isnull(ll_order) then ll_order = 0
	ll_order += 10 //Jervis 02.21.2010
	//end of add 03.17.2008

	li_nr = dw_detail.InsertRow( 1 )
	//dw_detail.SetItem( li_nr, "rec_id", ll_rec_id )
	dw_detail.SetItem( li_nr, "export_id", il_export_id )
	//$<modify> 03.17.2008 by Andy
	//dw_detail.SetItem( li_nr, "export_order", dw_fld_list.RowCount( ) + 1 )
	dw_detail.SetItem( li_nr, "export_order", ll_order )
	//end of modify 03.17.2008
	dw_detail.SetItem( li_nr, "export_code",0 )
	dw_detail.SetItem( li_nr, "export_fixed","N" )
	dw_detail.SetItem( li_nr, "use_link", 0 )
	dw_detail.SetItem( li_nr, "use_default", 0 )
	dw_detail.SetItem( li_nr, "export_field_length", 15 )
	dw_detail.SetItem( li_nr, "export_fields_export_type", 1 )
	//<add> andy 2007.05.24 set UI
	dw_detail.SetItem( li_nr,'record_level','C')	//jervis 09.03.2009
	of_setui(1)
	//end of add
	dw_detail.SetItem( li_nr, "intcred_record_number", 1 )
	dw_detail.SetItem( li_nr, "billing_link", 0 ) //maha 080205

	//--------------------------- APPEON BEGIN ---------------------------
	//$<add> 2006-11-27 By: Rodger Wu

	Integer li_export_type

	if tab_1.tabpage_export_hdr.dw_export_file.rowcount() > 0 then
		li_export_type = tab_1.tabpage_export_hdr.dw_export_file.getitemnumber( 1, "export_type" )
		dw_detail.SetItem( li_nr, "export_fields_module_type", li_export_type )

		if not isnull( li_export_type ) and ( li_export_type = 3 or li_export_type = 4 ) then
			of_ctx_add_scrn()
		end if
	end if
	//---------------------------- APPEON END ----------------------------

	//dw_detail.ScrollToRow( li_nr )
	dw_detail.SetRow( li_nr )
	//
	//dw_detail.ScrollToRow( li_nr )
	//dw_detail.SetRow( li_nr )
	//
	//<add> 07/17/2007 by: Andy
	dw_detail.Modify("export_field_name.protect='0'~texport_field_name.background.color='16777215'")
	//end of add
	dw_detail.SetColumn( "export_field_name" )

	dw_detail.SetFocus( )

	lb_new = False
	
	dw_detail.Modify("b_edit.visible = false ") //Added By Jay Chen 07-31-2014

else   //auto
	if isnull(il_view_id) then il_view_id = 0
	if il_view_id = 0 then
		Messagebox('Export File Properties','Base On View is required.')
		Return 
	end if
	openwithparm(w_auto_add_fields,'add'+string(il_view_id))
	
end if


end event

type cb_delete_col from u_cb within tabpage_field_data
integer x = 2560
integer y = 8
integer width = 384
integer height = 84
integer taborder = 11
boolean bringtotop = true
string text = "&Delete Column"
end type

event clicked;call super::clicked;//<add> andy 2007.05.29
//if the column is used in the Calculated field,can not delete.
long   ll_Row,	ll_rec_id
String ls_Column,ls_Computer, ls_name

ll_Row    = dw_detail.getRow()
if dw_detail.GetItemStatus(ll_Row,0,primary!) = datamodified! or &
	dw_detail.GetItemStatus(ll_Row,0,primary!) = notmodified! then
	ls_Column = dw_detail.GetItemString(ll_Row,"export_field_name")
	ll_rec_id =dw_detail.GetItemNumber(ll_Row,"rec_id")
	
	if isnull(ls_Column) then ls_Column = ''	
	if ls_Column <> '' then
		SELECT TOP 1 export_field_name INTO :ls_Computer 
			FROM export_fields 
			WHERE charindex(:ls_Column,export_fields_expression) > 0 
				and export_id = :il_export_id
				and export_field_name <> :ls_Column;
		if sqlca.sqlcode = 0 then
			messagebox(gnv_app.iapp_object.DisplayName,"The column is used in the Calculated field,~rcan not delete.")
			return 
		end if
	end if
	
	//Begin - Added By Mark Lee 09/27/2013
	if not isnull(ll_rec_id) then
		Select top 1 request_form.request_name 
		Into :ls_name
		From request_form_detail , request_form 
		Where request_form.request_id = request_form_detail.request_id
		and  request_form_detail.export_id = :il_export_id 
		and request_form_detail.rec_id = :ll_rec_id
		using sqlca;
		
		if not isnull(ls_name) and trim(ls_name) <> "" then
			messagebox(gnv_app.iapp_object.DisplayName,"This column is already used in the Request Form "+ls_name+" ~r~nso you cannot delete it.")
			return 
		end if		
	end if 
	//End - Added By Mark Lee 09/27/2013
		
end if
//end of add

//Added By Mark Lee 03/01/2015  
//if MessageBox('Confirm Delete','You are not recommended to delete the Export Column because, if it is used in a template or document, it would cause the merge function to fail. Please confirm if you want to continue to delete it.',Question!,YesNo!,2) <> 1 then return //Added By Jay Chen 07-31-2014
if MessageBox('Confirm Delete','It is not recommended to delete the Export Column because, if it is used in a template or document, it would cause the merge function to fail. Please confirm if you want to continue to delete it.',Question!,YesNo!,2) <> 1 then return 
dw_detail.deleteRow( dw_detail.getRow() )
dw_detail.Modify("b_edit.visible = true ") //Added By Jay Chen 07-31-2014

//<add> andy 2007.05.29
//set mle_1¡¢st_1¡¢cb_4 visible = false
of_setui(1)
//end of add
end event

type cb_insert from u_cb within tabpage_field_data
integer x = 2171
integer y = 8
integer width = 384
integer height = 84
integer taborder = 11
boolean bringtotop = true
string text = "&Insert Column..."
end type

event clicked;Integer li_nr
Long ll_rec_id
Integer li_fld_cnt
Integer i
integer a
integer li_ord

//Added By Jay Chen 03-03-2014
string ls_type
open(w_add_fields_option)
ls_type = message.stringparm
if isnull(ls_type) or ls_type = '' then return
if ls_type = 'manual' then
	lb_new = True
	
	//ll_rec_id = gnv_app.of_get_id( "RECORD_ID" )
	//il_recid = ll_rec_id

	//$<add>  03.19.2008 by Andy
	//$Reason:Reorder the Order field.(fixed BugA012301)
	li_fld_cnt = dw_fld_list.RowCount( )
	FOR i = 1 TO li_fld_cnt
		dw_fld_list.SetItem( i, "export_order", i )
	NEXT
	//Reason:fixed BugA012302
	//if cb_save.event clicked( ) < 0 then return			//Added By Mark Lee 09/29/2013
	if of_save(false) < 0 then return 
	dw_detail.Reset()
	//end of add 03.19.2008

	li_nr = dw_detail.InsertRow( 1 )
	a = dw_fld_list.GetRow( )
	//--------------------------- APPEON BEGIN ---------------------------
	//$<modify> 03.22.2007 By: Jack (Export)
	//$<reason> Fix a defect.
	/*
	li_ord = dw_fld_list.Getitemnumber(a,"export_order")
	*/
	If a > 1 Then
		li_ord = dw_fld_list.Getitemnumber(a,"export_order")
	Else
		li_ord = 1
	End If
	//---------------------------- APPEON END ----------------------------
	//dw_detail.SetItem( li_nr, "rec_id", ll_rec_id )
	dw_detail.SetItem( li_nr, "export_id", il_export_id )
	dw_detail.SetItem( li_nr, "export_order", li_ord  )
	dw_detail.SetItem( li_nr, "export_code",0 )
	dw_detail.SetItem( li_nr, "export_fixed","N" )
	dw_detail.SetItem( li_nr, "use_link", 0 )
	dw_detail.SetItem( li_nr, "use_default", 0 )
	dw_detail.SetItem( li_nr, "export_field_length", 15 )
	dw_detail.SetItem( li_nr, "export_fields_export_type", 1 )
	//<add> andy 2007.05.24 set UI
	dw_detail.SetItem( li_nr,'record_level','C')	//jervis 09.03.2009
	of_setui(1)
	//end of add
	dw_detail.SetItem( li_nr, "intcred_record_number", 1 )
	dw_detail.SetItem( li_nr, "billing_link", 0 ) //maha 080205

	//--------------------------- APPEON BEGIN ---------------------------
	//$<add> 2006-11-27 By: Rodger Wu
	Integer li_export_type

	if tab_1.tabpage_export_hdr.dw_export_file.rowcount() > 0 then
		li_export_type = tab_1.tabpage_export_hdr.dw_export_file.getitemnumber( 1, "export_type" )
		dw_detail.SetItem( li_nr, "export_fields_module_type", li_export_type )

		if not isnull( li_export_type ) and ( li_export_type = 3 or li_export_type = 4 ) then
			of_ctx_add_scrn()
		end if
	end if
	//---------------------------- APPEON END ----------------------------

	li_fld_cnt = dw_fld_list.RowCount( )
	FOR i = 1 TO li_fld_cnt
		if i >= a then
			dw_fld_list.SetItem( i, "export_order", i + 1)
		end if 
	END FOR

	//dw_detail.ScrollToRow( li_nr )
	//dw_detail.SetRow( li_nr )

	//dw_detail.ScrollToRow( li_nr )
	//dw_detail.SetRow( li_nr )

	//<add> 07/17/2007 by: Andy
	dw_detail.Modify("export_field_name.protect='0'~texport_field_name.background.color='16777215'")
	//end of add
	dw_detail.SetColumn( "export_field_name" )

	dw_detail.SetFocus( )

	lb_new = False
	
	dw_detail.Modify("b_edit.visible = false ") //Added By Jay Chen 07-31-2014

else   //auto
	if isnull(il_view_id) then il_view_id = 0
	if il_view_id = 0 then
		Messagebox('Export File Properties','Base On View is required.')
		Return 
	end if
	openwithparm(w_auto_add_fields,'ins'+string(il_view_id))
	
end if


end event

type cb_1 from commandbutton within tabpage_field_data
integer x = 2606
integer y = 1660
integer width = 471
integer height = 84
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Edit Export Codes..."
end type

event clicked;openwithparm(w_export_code_equiv,il_export_id)
end event

type cb_reorder from commandbutton within tabpage_field_data
integer x = 1006
integer y = 8
integer width = 384
integer height = 84
integer taborder = 21
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Reorder"
end type

event clicked;integer i,li_fld_cnt

li_fld_cnt = dw_fld_list.RowCount( )
FOR i = 1 TO li_fld_cnt
	//if a >= i then
		dw_fld_list.SetItem( i, "export_order", i )
	//end if 
END FOR

//cb_save.triggerevent(clicked!)				//Added By Mark Lee 09/29/2013
of_save(false)
end event

type cb_copy from commandbutton within tabpage_field_data
integer x = 1394
integer y = 8
integer width = 384
integer height = 84
integer taborder = 21
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Co&py Fields from:"
end type

event clicked;integer i

openwithparm(w_export_copy,il_export_id)

i = tab_1.tabpage_field_data.dw_fld_list.Retrieve( il_export_id )
of_reset_find_filed_name(il_export_id)											//Added By Mark Lee 08/06/2015

tab_1.tabpage_field_data.dw_fld_list.scrolltorow(i)

tab_1.tabpage_field_data.dw_fld_list.setrow(i)

tab_1.tabpage_field_data.st_next.text = "Next Col " + (string(tab_1.tabpage_field_data.dw_fld_list.rowcount()+ 1))


end event

type st_next from statictext within tabpage_field_data
integer x = 2985
integer y = 20
integer width = 576
integer height = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 16711680
long backcolor = 80269524
boolean enabled = false
string text = "Next Col"
boolean focusrectangle = false
end type

type cb_4 from commandbutton within tabpage_field_data
boolean visible = false
integer x = 2437
integer y = 1068
integer width = 96
integer height = 76
integer taborder = 110
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "..."
end type

event clicked;//<add> andy 2007.05.28
//Open a window in order to define Expression
str_pass lstr_pass, lstr_Ret
Long     ll_Row
u_dw     ldw_Temp
String   ls_Expression,ls_field

ldw_Temp = tab_1.tabpage_field_data.dw_detail
ll_Row   = ldw_Temp.GetRow()
if ll_Row > 0 then
	ls_Expression = ldw_Temp.GetItemString(ll_Row,"export_fields_expression")
	ls_field      = ldw_Temp.GetItemString(ll_Row,"export_field_name")
end if
if isnull(ls_Expression) then ls_Expression = ''
if isnull(ls_field) then ls_field = ''

lstr_pass.s_long[1] = 1	//1-Export Call, 2- Screen Painter Call, 3- Advanced Update call	--jervis 03.12.2009
lstr_pass.l_facility_id     = il_export_id
lstr_pass.s_string          = ls_Expression
lstr_pass.s_string_array[1] = ls_field
lstr_pass.s_u_dw            = ldw_Temp

openwithparm(w_export_expression,lstr_pass)

lstr_Ret = message.Powerobjectparm
if Not IsValid(lstr_Ret) or ISNULL(lstr_Ret) THEN return

tab_1.tabpage_field_data.mle_1.text = lstr_Ret.s_string 
end event

type mle_1 from multilineedit within tabpage_field_data
boolean visible = false
integer x = 1083
integer y = 1072
integer width = 1339
integer height = 608
integer taborder = 100
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event modified;//<add> andy 2007.05.28 
long ll_Row
u_dw ldw_Temp

ldw_Temp = tab_1.tabpage_field_data.dw_detail
ll_Row   = ldw_Temp.GetRow()
if ll_Row > 0 then
	ldw_Temp.SetItem(ll_Row,"export_fields_expression", tab_1.tabpage_field_data.mle_1.text )
end if
end event

type st_1 from statictext within tabpage_field_data
boolean visible = false
integer x = 1083
integer y = 1004
integer width = 453
integer height = 52
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean underline = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Expression"
boolean focusrectangle = false
end type

type st_vbar_export from u_st_splitbar within tabpage_field_data
integer x = 987
integer y = 120
integer width = 18
integer height = 1632
boolean bringtotop = true
end type

event constructor;call super::constructor;//Added By Mark Lee 07/19/2013
this.of_Register(dw_fld_list, LEFT)
this.of_Register(dw_detail, RIGHT)
//this.of_Register(st_1, RIGHT)
//this.of_Register(mle_1, RIGHT)
//this.of_Register(cb_4, RIGHT)
//this.of_Register(cb_1, RIGHT)						//Added By Mark Lee 07/19/2013 it is need manual modify the position 

this.of_SetMinobjectsize( 300)

end event

event lbuttonup;call super::lbuttonup;gnv_user_option.of_Set_option_value(gs_user_id, "w_export_painter_st_vbar_export.x",string(this.x  / parent.width ) )
gnv_user_option.of_save( )

wf_resize_tab()	
end event

type cb_sync from commandbutton within tabpage_field_data
integer x = 3607
integer y = 8
integer width = 425
integer height = 92
integer taborder = 120
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Sync Properties..."
end type

event clicked;//====================================================================
// Event: clicked
//--------------------------------------------------------------------
// Description: Sync Columns Properties.
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:         Ken.Guo 2016-03-10
//--------------------------------------------------------------------
//Copyright (c) 2008-2015 Contract Logix, Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History: 
//
//====================================================================

PowerObject lpo
str_export_columns lstr_columns

//check data saved
tab_1.tabpage_field_data.dw_detail.accepttext( )
tab_1.tabpage_export_hdr.dw_export_file.accepttext( )
If tab_1.tabpage_export_hdr.dw_export_file.modifiedcount() > 0 Or tab_1.tabpage_field_data.dw_detail.modifiedcount() > 0  Or tab_1.tabpage_field_data.dw_detail.deletedcount() > 0 Then
	Messagebox('Tips','Please save the data first.')
	Return 
End If

//Open select column windows
If il_export_id <= 0 Then Return 
Openwithparm(w_export_columns_select,il_export_id)
If Not isvalid(message.powerobjectparm) Then Return 

//check return value
lpo = message.powerobjectparm
If lpo.classname( ) <> 'str_export_columns' then Return

//get the return value
lstr_columns = message.powerobjectparm

setpointer(hourglass!)
pfc_n_cst_ai_export_apb lnv_export
lnv_export = Create pfc_n_cst_ai_export_apb
lnv_export.of_update_export_data( il_export_id, lstr_columns)

//find the current row and set it
Long recid,rc,r
recid = tab_1.tabpage_field_data.dw_fld_list.getitemnumber(tab_1.tabpage_field_data.dw_fld_list.getrow(),'rec_id')
rc = tab_1.tabpage_field_data.dw_fld_list.retrieve(il_export_id)
of_reset_find_filed_name(il_export_id)											
r = tab_1.tabpage_field_data.dw_fld_list.find("rec_id = " + string(recid),1,rc)
if r > 0 then 
	tab_1.tabpage_field_data.dw_fld_list.scrolltorow(r)
	tab_1.tabpage_field_data.dw_fld_list.setrow(r)
	if r = 1 then tab_1.tabpage_field_data.dw_fld_list.event rowfocuschanged(1)
end if
setpointer(arrow!)
end event

type dw_screen from u_dw within w_export_painter
boolean visible = false
integer x = 2359
integer y = 3348
integer width = 206
integer height = 48
integer taborder = 80
end type

