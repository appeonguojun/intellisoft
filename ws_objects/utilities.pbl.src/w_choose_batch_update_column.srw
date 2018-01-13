$PBExportHeader$w_choose_batch_update_column.srw
forward
global type w_choose_batch_update_column from w_response
end type
type dw_screen from u_dw within w_choose_batch_update_column
end type
type dw_field from u_dw within w_choose_batch_update_column
end type
type cb_cancel from commandbutton within w_choose_batch_update_column
end type
type cb_ok from commandbutton within w_choose_batch_update_column
end type
type gb_1 from groupbox within w_choose_batch_update_column
end type
end forward

global type w_choose_batch_update_column from w_response
integer width = 1074
integer height = 888
string title = "Batch Update Contract"
dw_screen dw_screen
dw_field dw_field
cb_cancel cb_cancel
cb_ok cb_ok
gb_1 gb_1
end type
global w_choose_batch_update_column w_choose_batch_update_column

type variables

DatawindowChild idwc_views, idwc_screens, idwc_fields

String is_tablename, is_fieldname, is_fielddatatype, is_fieldlookuptype, is_fieldname_alias, is_fieldformat
Long il_screenid, il_viewid

str_batch_update_field istr_batch_update_field
end variables

on w_choose_batch_update_column.create
int iCurrent
call super::create
this.dw_screen=create dw_screen
this.dw_field=create dw_field
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_screen
this.Control[iCurrent+2]=this.dw_field
this.Control[iCurrent+3]=this.cb_cancel
this.Control[iCurrent+4]=this.cb_ok
this.Control[iCurrent+5]=this.gb_1
end on

on w_choose_batch_update_column.destroy
call super::destroy
destroy(this.dw_screen)
destroy(this.dw_field)
destroy(this.cb_cancel)
destroy(this.cb_ok)
destroy(this.gb_1)
end on

event open;call super::open;//====================================================================
// Event: open
//--------------------------------------------------------------------
// Description: Choose Update Field Base on a view.
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:         Ken.Guo 03/25/2015
//--------------------------------------------------------------------
//Copyright (c) 2008-2015 Contract Logix, Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


dw_field.InsertRow(0)

dw_field.GetChild('view_id', idwc_views)
dw_field.GetChild('screen_id', idwc_screens)
dw_field.GetChild('field_name', idwc_fields)

idwc_views.SetTransObject(SQLCA)
idwc_screens.SetTransObject(SQLCA)
idwc_fields.SetTransObject(SQLCA)

idwc_views.Retrieve()


end event

type dw_screen from u_dw within w_choose_batch_update_column
boolean visible = false
integer x = 50
integer y = 876
integer width = 133
integer height = 64
integer taborder = 20
end type

type dw_field from u_dw within w_choose_batch_update_column
event ue_generate_dddw ( string dwoname,  string data,  long row )
integer x = 64
integer y = 92
integer width = 910
integer height = 524
integer taborder = 10
string dataobject = "d_choose_batch_update_field"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
borderstyle borderstyle = stylebox!
end type

event ue_generate_dddw(string dwoname, string data, long row);//Added By Ken.Guo 03/25/2015
//This function is copied from w_export_painter and modify it.

//datawindow dw_screen
datawindowchild ldwc_ctxscrn, ldwc_fields//, ldwc_linkfromcolumn
string ls_table, ls_colname, ls_dbname, ls_temp, ls_label, ls_dataobject
integer li_found, li_cols, i, li_inserted, li_getrow
String  ls_DataTypeTemp,ls_DataType
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
string ls_lookupname
string ls_mask

setnull(ls_table_name)
This.GetChild( dwoname, ldwc_ctxscrn )
li_found = ldwc_ctxscrn.Find( "screen_id = " + string( data ), 1, ldwc_ctxscrn.rowcount() )
if li_found > 0 then
	This.GetChild( "field_name", ldwc_fields )
//	This.GetChild( "export_fields_ctx_linkfromcolumn", ldwc_linkfromcolumn )
	ldwc_fields.SetFilter("field_screen = " + string(data))
	ldwc_fields.Filter( )
//	ldwc_linkfromcolumn.SetFilter("field_screen = " + string(data))
//	ldwc_linkfromcolumn.Filter( )
	
	if data = '12' then	//12-Exprot Profile Detail- jervis 03.17.2009
		ls_dataobject = 'd_export_contract_profile'
		ls_table_name	= 'ctx_elements'															//Added By Mark Lee 07/19/2013
	else
		ls_dataobject = ldwc_ctxscrn.GetItemString( li_found, "dataobject" )
		If dwoname = 'screen_id' Then 
			ls_table_name  = ldwc_ctxscrn.GetItemString( li_found, "table_name" )			//Added By Mark Lee 07/19/2013
		End IF 
	end if
	
		
	if ldwc_fields.RowCount() < 1 then   
		dw_screen.dataobject = ls_dataobject
		
		If ls_dataobject = 'd_contract_det_contact_external' Then

		else
			//dw_screen = create u_dw		
			//Dynamic generate dddw base on view -- jervis 08.06.2009
			if data <> '12' and long(data) < 1000 then	
				ls_tab_name = gnv_data.of_get_table_name( long(data), 'C', 'tab_name')
		
				ldw[1] = dw_screen
				
				ls_dw_name[1] 		= gnv_data.of_get_table_name( long(data), 'C', 'dw_name')
				ls_dataobjects[1] 	= ls_dataobject //gnv_data.of_get_table_name( long(data), 'C', 'dataobject')
				
				f_create_contract_dw(This.GetItemNumber(1, 'view_id'),ls_tab_name,ldw,ls_dw_name,ls_dataobjects)
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
				
				ls_label = dw_screen.Describe( ls_colname + "_t.text")
				if ls_label = "?" or ls_label = "!" then ls_label = ""
				if ls_label = '' then ls_label = ls_dbname
				ls_format = dw_screen.Describe("#"+string( i ) + ".format") //jervis 09.06.2010.
				ls_mask = dw_screen.Describe("#"+string( i ) + ".EditMask.Mask")
				If ls_mask <> '?'  and ls_mask <> '!'  and ls_mask <> '' Then  //Use mask `
					ls_format = ls_mask
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
				if ls_temp = ls_table  or data = '12' or data = '56' then	//12-Export Profile detail-jervis 03.17.2009 //Added By Jay Chen 03-11-2014 Remark:add dddw fields Document Manager->Document Tab->Document Browse
					li_inserted = ldwc_fields.insertrow( 0 )
					ldwc_fields.setitem( li_inserted, "field_name", ls_colname )
					//ldwc_fields.setitem( li_inserted, "field_name", ls_dbname )	//03.16.2009 by Jervis
					ldwc_fields.setitem( li_inserted, "field_name_alias", ls_label )
					//<add> andy 2007.05.23
					ldwc_fields.setitem( li_inserted, "field_datatype", ls_DataType )
					//end of add
					ldwc_fields.setitem( li_inserted, "field_screen", data )	//08.07.2009 by jervis

					//Add field format - jervis 09.06.2010
					if ls_format <> "" and ls_format <> "?" then
						ldwc_fields.setitem( li_inserted, "field_format", ls_format )
					end if
					
					//Get DDDW Type -- jervis 11.26.2009
					ls_dddw_data = lower( dw_screen.Describe( "#"+string( i ) + ".dddw.datacolumn" ) )
					if ls_dddw_data = 'lookup_code' then
						ls_lookupname = dw_screen.Describe( "#"+string( i ) + ".tag" ) 
						
						ldwc_fields.SetItem(li_inserted,"field_type","C" + "," + ls_lookupname )
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
					elseif ls_dddw_data = 'user_id' then 
						ldwc_fields.SetItem(li_inserted,"field_type","U")
					end if
					
					//Set fixed value for category and status fields.
					Choose Case Lower(ls_colname)
						Case 'category'
							ldwc_fields.SetItem(li_inserted,"field_type","C,Contract Category")
						Case 'status'
							ldwc_fields.SetItem(li_inserted,"field_type","C,Contract Status")
					End Choose
				end if
			next
		end if

	end if
	//Sort by field name
	ldwc_fields.Sort()
//	ldwc_linkfromcolumn.Sort( )
end if

end event

event constructor;call super::constructor;This.of_setupdateable( False)
end event

event itemchanged;call super::itemchanged;Long ll_null, ll_find
String ls_null

SetNull(ll_null)
SetNull(ls_null)

Choose Case dwo.name
	Case 'view_id'
		il_viewid = Long(data)
		idwc_screens.SetTransObject(SQLCA)
		idwc_screens.Retrieve(il_viewid)
		idwc_screens.SetFilter('table_name = "ctx_basic_info"')
		idwc_screens.Filter()
		idwc_fields.Reset()
		This.SetItem(1, 'screen_id', ll_null )
		This.SetItem(1, 'field_name', ls_null)
	Case 'screen_id'
		il_screenid = Long(data)
		idwc_fields.Reset()
		Event ue_generate_dddw(dwo.name, data, row)
		This.SetItem(1, 'field_name', ls_null)
		
		idwc_fields.SetFilter('(field_name <> "ctx_id" and field_name <> "app_facility" and Pos(field_name, "notes") = 0 ) and (field_type <> "P" or isnull(field_type)) ') //These fields not allow be updated.  
		idwc_fields.Filter()
	Case 'field_name' 
		is_fieldname = data
		ll_find = idwc_fields.find('field_name = "' + is_fieldname + '"', 1, idwc_fields.Rowcount() )
		If ll_find > 0 Then
			is_fielddatatype = idwc_fields.getitemstring(ll_find,'field_datatype')
			is_fieldlookuptype = idwc_fields.getitemstring(ll_find, 'field_type')
			is_fieldname_alias = idwc_fields.getitemstring(ll_find, 'field_name_alias')
			is_fieldformat = idwc_fields.getitemstring(ll_find, 'field_format')
		Else
			is_fielddatatype = ''
			is_fieldlookuptype = ''
			is_fieldname_alias = ''
			is_fieldformat = ''
		End If
		//Messagebox(is_fielddatatype, is_fieldlookuptype)
End Choose


end event

type cb_cancel from commandbutton within w_choose_batch_update_column
integer x = 640
integer y = 684
integer width = 343
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Cancel"
end type

event clicked;Close(Parent)
end event

type cb_ok from commandbutton within w_choose_batch_update_column
integer x = 270
integer y = 684
integer width = 343
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&OK"
end type

event clicked;//workaround bug. failed to get viewid and screen id
il_viewid = dw_field.GetItemNumber(1, 'view_id')
il_screenid = dw_field.GetItemNumber(1, 'screen_id')

//Check Data
If il_viewid = 0 or isnull(il_viewid) Then
	Messagebox('Batch Update','Please choose a value for Base On View.')
	Return
End If
If il_screenid = 0 or isnull(il_screenid) Then
	Messagebox('Batch Update','Please choose a value for Contract Logix Screen.')
	Return
End If
If is_fieldname = '' or isnull(is_fieldname) Then
	Messagebox('Batch Update','Please choose a value for Contract Logix Field.')
	Return
End If
 
//Open Batch Update Window
istr_batch_update_field.al_viewid = il_viewid
istr_batch_update_field.al_screenid = il_screenid
istr_batch_update_field.as_fieldname = is_fieldname
istr_batch_update_field.as_fielddatatype = is_fielddatatype
istr_batch_update_field.as_fieldlookuptype = is_fieldlookuptype
istr_batch_update_field.as_fieldname_alias = is_fieldname_alias
istr_batch_update_field.as_fieldformat = is_fieldformat
OpenwithParm(w_batch_update_contract_search, istr_batch_update_field)
Close(Parent)
end event

type gb_1 from groupbox within w_choose_batch_update_column
integer x = 37
integer y = 32
integer width = 951
integer height = 604
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Please choose the target field"
end type

