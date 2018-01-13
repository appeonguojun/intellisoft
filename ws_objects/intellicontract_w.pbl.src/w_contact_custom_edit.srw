$PBExportHeader$w_contact_custom_edit.srw
forward
global type w_contact_custom_edit from w_popup
end type
type progress_bar from u_progress within w_contact_custom_edit
end type
type cb_1 from u_cb within w_contact_custom_edit
end type
type cb_save from u_cb within w_contact_custom_edit
end type
type dw_3 from datawindow within w_contact_custom_edit
end type
type tab_properties from tab within w_contact_custom_edit
end type
type tabpage_1 from userobject within tab_properties
end type
type dw_1 from datawindow within tabpage_1
end type
type tabpage_1 from userobject within tab_properties
dw_1 dw_1
end type
type tabpage_2 from userobject within tab_properties
end type
type dw_2 from datawindow within tabpage_2
end type
type tabpage_2 from userobject within tab_properties
dw_2 dw_2
end type
type tab_properties from tab within w_contact_custom_edit
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type
type cb_cancel from u_cb within w_contact_custom_edit
end type
type cb_ok from u_cb within w_contact_custom_edit
end type
end forward

global type w_contact_custom_edit from w_popup
integer x = 1783
integer y = 32
integer width = 2199
integer height = 1648
string title = "Contact Custom Field Properties"
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
long backcolor = 67108864
boolean center = true
event ue_post_open pbm_custom01
event ue_bringtotop ( )
progress_bar progress_bar
cb_1 cb_1
cb_save cb_save
dw_3 dw_3
tab_properties tab_properties
cb_cancel cb_cancel
cb_ok cb_ok
end type
global w_contact_custom_edit w_contact_custom_edit

type variables
datastore ids_custom_field
string is_FieldName
boolean ib_have_modify = false
string is_field_flag //Added By Jay Chen 08-06-2015
end variables

forward prototypes
public function integer of_setbuttonenabled (long al_row)
public subroutine of_refresh_lookup_dddw ()
public subroutine of_set_dispalyname_dddw ()
public subroutine of_init_dddw (string as_field)
public function integer of_modify_column_property (string as_column_name, string as_property_name)
public subroutine of_display_custom_property ()
public subroutine of_update_property (string as_field, integer as_row)
public subroutine of_auto_update_contactsyntax (long al_view_id, long al_screen_id, string as_fieldname[])
public subroutine of_auto_update_contactsyntax (long al_view_id, long al_screen_id, string as_fieldname[], string as_contact_type)
end prototypes

event ue_post_open;//Integer i
//Integer li_col_cnt
//Integer li_sys_col_cnt
//Integer li_dv_col_cnt
//String ls_col_name
//String ls_sys_cols
//String ls_data_view_cols
//String ls_sys_fields_update[]
//String ls_dv_fields_update[]
//String  ls_sys_key_cols[ ] = {"sys_fields_table_id", "sys_fields_field_id"}
//String  ls_dv_key_cols[ ] = {"data_view_fields_data_view_id", "data_view_fields_screen_id"}
//
//
//dw_properties.of_SetMultiTable(TRUE)
//
//
//li_col_cnt = Integer( dw_properties.Object.DataWindow.Column.Count )
//
//FOR i = 1 TO li_col_cnt
//	
//	dw_properties.SetColumn( i )
//	ls_col_name = dw_properties.GetColumnName()
//	IF Upper(Mid(ls_col_name, 1, 10 )) = "SYS_FIELDS"  THEN
//		li_sys_col_cnt ++
//		ls_sys_fields_update[li_sys_col_cnt] = ls_col_name
//	ELSEIF Upper(Mid(ls_col_name, 1, 16 )) = "DATA_VIEW_FIELDS" THEN
//		li_dv_col_cnt ++
//		ls_dv_fields_update[li_dv_col_cnt] = ls_col_name
//	END IF
//	
//END FOR
//
//dw_properties.inv_multitable.of_Register( "sys_fields", ls_sys_key_cols , ls_sys_fields_update, TRUE, 0)
//dw_properties.inv_multitable.of_Register( "data_view_fields", ls_dv_key_cols , ls_dv_fields_update, TRUE, 0)
//
//
//
//
//
//
end event

event ue_bringtotop();//


This.bringtotop = true
end event

public function integer of_setbuttonenabled (long al_row);//string 	ls_lookup_field
//string 	ls_lookup_code
//String	ls_ColType
//
//if al_Row <= 0 then Return -1
//
//ls_lookup_field = Trim(dw_properties.GetItemString(al_Row, "sys_fields_lookup_field"))
//ls_lookup_code = Trim(dw_properties.GetItemString(al_Row, "sys_fields_lookup_code"))
//if IsNull(ls_lookup_field) then ls_lookup_field = ""
//if IsNull(ls_lookup_code) then ls_lookup_code = ""
//
//// cb_datafill
//if ls_lookup_field = "Y" and Len(ls_lookup_code) > 0 then
//	cb_datafill.Enabled = true	
//else
//	cb_datafill.Enabled = false	
//end if
//
//// cb_ok
///*
//if ls_lookup_field = "Y" and Len(ls_lookup_code) = 0 then
//	cb_ok.Enabled = false	
//else
//	cb_ok.Enabled = true	
//end if
//*/
//
//ls_ColType = dw_properties.GetItemString(al_Row,"sys_fields_field_type")
//if Upper(ls_ColType) = Upper("DateTime") or Upper(ls_ColType) = Upper("Date") then
//	cb_datafill.Enabled = true	
//end if
//
Return 1
//
end function

public subroutine of_refresh_lookup_dddw ();
end subroutine

public subroutine of_set_dispalyname_dddw ();datawindowchild dwchild
datastore lds_temp
long ll_i,ll_count,ll_row
string ls_name[]
string ls_objects
string ls_label
string ls_type
n_cst_string lvn_string

//Reset the dddw data for sys_fields_lookup_field_name field -- jervis 04.15.2011
//User tab_properties.tabpage_edit.dw_3 replace dw_properties - jervis 07.19.2011
tab_properties.tabpage_2.dw_2.GetChild( "sys_fields_lookup_field_name", dwchild )
dwchild.Reset()
lds_temp = create datastore
lds_temp.dataobject = 'd_dddw_company_list'
ls_objects = lds_temp.Describe( "datawindow.objects")

lvn_string.of_parsetoarray( ls_objects, "~t", ls_name)
ll_count = UpperBound(ls_name)
for ll_i = 1 to ll_count
	ls_type = lds_temp.describe( ls_name[ll_i] +".type")
	if ls_type = 'column' or ls_type = 'compute' then
		ls_label = lds_temp.describe( ls_name[ll_i] +"_t.text")
		if ls_label = '?' or ls_label = '!' then ls_label = ls_name[ll_i]
		ll_row = dwchild.insertrow( 0)
		dwchild.SetItem( ll_row,'field_name', ls_name[ll_i])
		dwchild.SetItem( ll_row,'field_label', ls_label)
	end if
next
destroy lds_temp
end subroutine

public subroutine of_init_dddw (string as_field);//====================================================================
// Function: of_init_dddw
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value    string    as_field
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:	Jay Chen		Date: 01-08-2014
//--------------------------------------------------------------------
//	Copyright (c) 2008-2013 ContractLogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

string ls_style,ls_coltype,ls_modify
long ll_row,ll_find
datawindowchild dwchild

ll_find = ids_custom_field.find("field_name = '"+ as_field +"' and field_falg = '"+is_field_flag+"' ",1,ids_custom_field.rowcount()) //Modified By Jay Chen 08-06-2015 add field_falg
ls_style = ids_custom_field.GetItemString(ll_find, "field_style" )
choose case ls_style
	case 'Code Lookup'
		ls_style = 'Y'
	case 'User'
		ls_style = 'U'
	case 'Company'
		ls_style = 'C'
	case 'Edit'
		ls_style = 'E'
end choose
		
choose case ls_style
	case 'Y'	
		tab_properties.tabpage_2.dw_2.Modify("sys_fields_lookup_code.dddw.name = 'd_dddw_lookup_select_for_contract' sys_fields_lookup_code.dddw.datacolumn ='lookup_name' sys_fields_lookup_code.dddw.displaycolumn = 'lookup_name'")
		tab_properties.tabpage_2.dw_2.Modify("sys_fields_default_value.dddw.name = 'd_dddw_code_lookup' sys_fields_default_value.dddw.datacolumn ='lookup_code' sys_fields_default_value.dddw.displaycolumn = 'code'")
		if tab_properties.tabpage_2.dw_2.GetChild( "sys_fields_lookup_code", dwchild ) = 1 then
			dwchild.SetTransObject( SQLCA )
			dwchild.Retrieve()
		end if
	case 'C'
		tab_properties.tabpage_2.dw_2.Modify("sys_fields_lookup_code.dddw.name = 'd_dddw_company_type' sys_fields_lookup_code.dddw.datacolumn ='company_type' sys_fields_lookup_code.dddw.displaycolumn = 'company_desc'")
		tab_properties.tabpage_2.dw_2.Modify("sys_fields_default_value.dddw.name = 'd_dddw_company_list' sys_fields_default_value.dddw.datacolumn ='facility_id' sys_fields_default_value.dddw.displaycolumn = 'facility_name'")
		of_set_dispalyname_dddw()

	case 'U'
		//dw_properties.Modify("sys_fields_default_value.dddw.name = 'd_dddw_company' sys_fields_default_value.dddw.datacolumn ='facility_id' sys_fields_default_value.dddw.displaycolumn = 'facility_name'")
		tab_properties.tabpage_2.dw_2.Modify("sys_fields_default_value.dddw.name = 'd_dddw_users' sys_fields_default_value.dddw.datacolumn ='user_id' sys_fields_default_value.dddw.displaycolumn = 'user_id'")
	case 'E'

end choose




end subroutine

public function integer of_modify_column_property (string as_column_name, string as_property_name);//====================================================================
// Function: of_Modify_Column_Property()
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value    string    as_Column_Name
// 	value    string    as_Property_Name
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	Scofield		Date: 2009-08-19
//--------------------------------------------------------------------
//	Copyright (c) 1999-2009 Contractlogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

String ls_Edit_Style,ls_EditMask,ls_UseAsBorder,ls_Protect
String ls_DefValue,ls_VScrollBar,ls_LabelBand
String ls_Column_Name,ls_Case,ls_DisplayOnly
String ls_Modify,ls_LabelName,ls_FieldLabel,ls_b_Name
String ls_Value,ls_Visible,ls_AutoHeight
Long   ll_Cnt,ll_Find
long ll_row
string ls_str
string ls_text,ls_3d,ls_on,ls_off,ls_other, ls_objects,	ls_tmp, ls_Color
string ls_expression
string ls_xexp,ls_yexp,ls_wexp,ls_hexp
pfc_cst_u_band	ldw_band

tab_properties.tabpage_2.dw_2.AcceptText()
ll_row = tab_properties.tabpage_2.dw_2.getrow()

if Right(as_Column_Name,2) = "_t" then
	ls_LabelName = as_Column_Name
	ls_Column_Name = Left(as_Column_Name,Len(as_Column_Name) - 2)
else
	ls_LabelName = as_Column_Name + "_t"
	ls_Column_Name = as_Column_Name
end if

if IsNull(ls_LabelName) or Trim(ls_LabelName) = "" then Return 1
if IsNull(ls_Column_Name) or Trim(ls_Column_Name) = "" then Return 1

if is_field_flag = 'P' then //Added By Jay Chen 08-06-2015
	ls_Edit_Style = w_contract_contact.tab_1.tabpage_custom.dw_2.Describe(ls_Column_Name + ".Edit.Style")
else
	ls_Edit_Style = w_contract_contact.tab_1.tabpage_custom_facility.dw_2.Describe(ls_Column_Name + ".Edit.Style")
end if

CHOOSE CASE as_Property_Name
	CASE "data_view_fields_field_label"
		ls_FieldLabel = tab_properties.tabpage_2.dw_2.GetItemString(ll_row, "data_view_fields_field_label")
		ls_Modify = ls_LabelName + ".text = ~"" + ls_FieldLabel + "~""
		if IsValid(w_contract_contact) then 
			if is_field_flag = 'P' then //Added By Jay Chen 08-06-2015
				w_contract_contact.tab_1.tabpage_custom.dw_2.Modify(ls_Modify)
			else
				w_contract_contact.tab_1.tabpage_custom_facility.dw_2.Modify(ls_Modify)
			end if
			ib_have_modify = true
		end if
	CASE "sys_fields_lookup_field"
		ls_str = tab_properties.tabpage_2.dw_2.GetItemString(ll_row, "sys_fields_lookup_field")		
		choose case ls_str
			case 'Y'	//Lookup code
				ls_Modify = ''
			case 'C'	//Company
				ls_Modify = ''
			case 'U'	//User
				ls_UseAsBorder = 'Yes'
				// Lookup Table
				ls_Modify = ls_Column_Name + ".dddw.VscrollBar = Yes " + ls_Column_Name + ".dddw.AutoHScroll = Yes " + ls_Column_Name + ".dddw.useasborder = " + ls_UseAsBorder + " " + &
								ls_Column_Name + ".dddw.NilIsNull= Yes " + ls_Column_Name + ".dddw.name = 'd_dddw_users' " + ls_Column_Name + ".dddw.datacolumn = 'user_id' " + &
								ls_Column_Name + ".dddw.displaycolumn = 'user_id' "  + ls_Column_Name + ".dddw.autoretrieve = No " + &
								ls_Column_Name + ".tag = ''"
		
				tab_properties.tabpage_2.dw_2.SetItem( ll_row, "sys_fields_default_value", "" )
				
			case 'N','E'	//Delete None, Add Edit - jervis 07.15.2011
				tab_properties.tabpage_2.dw_2.SetItem( ll_row, "sys_fields_lookup_type", "" )
				tab_properties.tabpage_2.dw_2.SetItem( ll_row, "sys_fields_lookup_code", "" )
				tab_properties.tabpage_2.dw_2.SetItem( ll_row, "sys_fields_lookup_field_name", "" )
				
				ls_Modify = ls_Column_Name + ".edit.AutoHScroll = Yes " + ls_Column_Name + ".edit.NilIsNull = Yes"
			
			case 'M' //editmask 
				// Mask
				ls_EditMask = tab_properties.tabpage_2.dw_2.GetItemString(ll_row,"sys_fields_field_mask")
				if IsNull(ls_EditMask) or Trim(ls_EditMask) = "" or Trim(ls_EditMask) = "null" then ls_EditMask = ""
				
				ls_Modify = ls_Column_Name + ".EditMask.Mask = '" + ls_EditMask + "' "
		end choose
		if IsValid(w_contract_contact) then 
			if is_field_flag = 'P' then //Added By Jay Chen 08-06-2015
				w_contract_contact.tab_1.tabpage_custom.dw_2.Modify(ls_Modify)
			else
				w_contract_contact.tab_1.tabpage_custom_facility.dw_2.Modify(ls_Modify)
			end if
			ib_have_modify = true
		end if
	
	CASE "sys_fields_lookup_code"
		ls_UseAsBorder = 'Yes'
		ls_str =tab_properties.tabpage_2.dw_2.GetItemString(ll_row, "sys_fields_lookup_field")
		choose case ls_str
			case 'Y'	// Lookup Table
				ls_Modify = ls_Column_Name + ".dddw.VscrollBar = Yes " + ls_Column_Name + ".dddw.AutoHScroll = Yes " + ls_Column_Name + ".dddw.useasborder = " + ls_UseAsBorder + " " + &
								ls_Column_Name + ".dddw.NilIsNull= Yes " + ls_Column_Name + ".dddw.name = 'd_dddw_code_lookup' " + ls_Column_Name + ".dddw.datacolumn = 'lookup_code' " + &
								ls_Column_Name + ".dddw.displaycolumn = 'code' "  + &
								ls_Column_Name + ".tag = '" + String(tab_properties.tabpage_2.dw_2.GetItemString(ll_row, "sys_fields_lookup_code")) + "'"
		
				tab_properties.tabpage_2.dw_2.SetItem( ll_row, "sys_fields_default_value", "" )
				tab_properties.tabpage_2.dw_2.SetItem( ll_row, "sys_fields_lookup_field_name", "code" )
				tab_properties.tabpage_2.dw_2.SetItem( ll_row, "fields_add_lookup", 'Y' ) 
				
			case 'C'	//Company
				//change 'd_dddw_company' to 'd_dddw_company_list' -- jervis 04.15.2011
				ls_Modify = ls_Column_Name + ".dddw.VscrollBar = Yes " + ls_Column_Name + ".dddw.AutoHScroll = Yes " + ls_Column_Name + ".dddw.useasborder = " + ls_UseAsBorder + " " + &
								ls_Column_Name + ".dddw.NilIsNull= Yes " + ls_Column_Name + ".dddw.name = 'd_dddw_company_list' " + ls_Column_Name + ".dddw.datacolumn = 'facility_id' " + &
								ls_Column_Name + ".dddw.displaycolumn = 'facility_name' "  + ls_Column_Name + ".dddw.autoretrieve = No "  +&
								ls_Column_Name + ".tag = '" + String(tab_properties.tabpage_2.dw_2.GetItemString(ll_row, "sys_fields_lookup_code")) + "'"
		
				tab_properties.tabpage_2.dw_2.SetItem( ll_row, "sys_fields_default_value", "" )
				tab_properties.tabpage_2.dw_2.SetItem( ll_row, "sys_fields_lookup_field_name", "facility_name" )
					
			case 'U'	//User
				ls_Modify = ls_Column_Name + ".dddw.VscrollBar = Yes " + ls_Column_Name + ".dddw.AutoHScroll = Yes " + ls_Column_Name + ".dddw.useasborder = Yes " + &
								ls_Column_Name + ".dddw.NilIsNull= Yes " + ls_Column_Name + ".dddw.name = 'd_dddw_users' " + ls_Column_Name + ".dddw.datacolumn = 'user_id' " + &
								ls_Column_Name + ".dddw.displaycolumn = 'user_id' "  + ls_Column_Name + ".dddw.autoretrieve = No " + &
								ls_Column_Name + ".tag = ''"
		end choose
		if IsValid(w_contract_contact) then 
			if is_field_flag = 'P' then //Added By Jay Chen 08-06-2015
				w_contract_contact.tab_1.tabpage_custom.dw_2.Modify(ls_Modify)
			else
				w_contract_contact.tab_1.tabpage_custom_facility.dw_2.Modify(ls_Modify)
			end if
			ib_have_modify = true
		end if
		
	CASE "sys_fields_lookup_field_name"
		// Lookup Field Name
		ls_Modify = ls_Column_Name + ".dddw.displaycolumn = '" + String(tab_properties.tabpage_2.dw_2.GetItemString(ll_row, "sys_fields_lookup_field_name")) + "'"
		
		//fixed bug -- jervis 05.13.2011
		ls_str =tab_properties.tabpage_2.dw_2.GetItemString(ll_row, "sys_fields_lookup_field")
		if is_field_flag = 'P' then
			if ls_str = 'C' and  w_contract_contact.tab_1.tabpage_custom.dw_2.describe( ls_column_name + ".dddw.name") = 'd_dddw_company' then
				ls_modify += ' ' + ls_column_name + ".dddw.name = 'd_dddw_company_list'"
			end if
		else
			if ls_str = 'C' and  w_contract_contact.tab_1.tabpage_custom_facility.dw_2.describe( ls_column_name + ".dddw.name") = 'd_dddw_company' then
				ls_modify += ' ' + ls_column_name + ".dddw.name = 'd_dddw_company_list'"
			end if
		end if
		
		if IsValid(w_contract_contact) then 
			if is_field_flag = 'P' then //Added By Jay Chen 08-06-2015
				w_contract_contact.tab_1.tabpage_custom.dw_2.Modify(ls_Modify)
			else
				w_contract_contact.tab_1.tabpage_custom_facility.dw_2.Modify(ls_Modify)
			end if
			ib_have_modify = true
		end if
		

	
	CASE else 
		RETURN 0
END CHOOSE

Return 1

end function

public subroutine of_display_custom_property ();//====================================================================
// Function: of_display_custom_property
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:	Jay Chen		Date: 01-08-2014
//--------------------------------------------------------------------
//	Copyright (c) 2008-2013 ContractLogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

long ll_row
string ls_label,ls_edit_style,ls_edit_codetable,ls_column_name,ls_editmask_codetable,ls_column_coltype,ls_str
datawindowchild dwchild
string ls_addflag

if isvalid(w_contract_contact) then
	if is_field_flag = 'P' then //Added By Jay Chen 08-06-2015
		ls_label = w_contract_contact.tab_1.tabpage_custom.dw_2.Describe(is_FieldName + "_t.text")
		ls_edit_style = Lower(w_contract_contact.tab_1.tabpage_custom.dw_2.Describe(is_FieldName+".Edit.Style"))
		ls_column_coltype	= left(w_contract_contact.tab_1.tabpage_custom.dw_2.Describe(is_FieldName +".COLType"),4)
	else
		ls_label = w_contract_contact.tab_1.tabpage_custom_facility.dw_2.Describe(is_FieldName + "_t.text")
		ls_edit_style = Lower(w_contract_contact.tab_1.tabpage_custom_facility.dw_2.Describe(is_FieldName+".Edit.Style"))
		ls_column_coltype	= left(w_contract_contact.tab_1.tabpage_custom_facility.dw_2.Describe(is_FieldName +".COLType"),4)
	end if
end if

ll_row = tab_properties.tabpage_2.dw_2.getrow()
tab_properties.tabpage_2.dw_2.setitem(ll_row,"sys_fields_field_name",is_FieldName)
tab_properties.tabpage_2.dw_2.setitem(ll_row,"data_view_fields_field_label",ls_label)

IF ls_edit_style = "dddw" THEN
	if is_field_flag = 'P' then //Added By Jay Chen 08-06-2015
		ls_str = w_contract_contact.tab_1.tabpage_custom.dw_2.Describe(is_FieldName + ".dddw.Name")
	else
		ls_str = w_contract_contact.tab_1.tabpage_custom_facility.dw_2.Describe(is_FieldName + ".dddw.Name")
	end if
	IF ls_str = "d_dddw_code_lookup" THEN
		select field_dddw_add_fly into :ls_addflag from ctx_contact_custom_config where field_name = :is_FieldName and field_falg = :is_field_flag;
		tab_properties.tabpage_2.dw_2.Setitem( ll_row, "fields_add_lookup", ls_addflag)
		tab_properties.tabpage_2.dw_2.Setitem( ll_row, "sys_fields_lookup_field", "Y")
		if is_field_flag = 'P' then
			ls_str = w_contract_contact.tab_1.tabpage_custom.dw_2.Describe(is_FieldName + ".tag")
		else
			ls_str = w_contract_contact.tab_1.tabpage_custom_facility.dw_2.Describe(is_FieldName + ".tag")
		end if
		tab_properties.tabpage_2.dw_2.Setitem( ll_row, "sys_fields_lookup_code", ls_str)
		if is_field_flag = 'P' then
			ls_str = w_contract_contact.tab_1.tabpage_custom.dw_2.Describe(is_FieldName + ".dddw.DisplayColumn")
		else
			ls_str = w_contract_contact.tab_1.tabpage_custom_facility.dw_2.Describe(is_FieldName + ".dddw.DisplayColumn")
		end if
		tab_properties.tabpage_2.dw_2.Setitem( ll_row, "sys_fields_lookup_field_name", ls_str)
		tab_properties.tabpage_2.dw_2.Setitem( ll_row, "disable_fields_lookup", 0)
		tab_properties.tabpage_2.dw_2.Modify("sys_fields_lookup_code.dddw.name = 'd_dddw_lookup_select_for_contract' sys_fields_lookup_code.dddw.datacolumn ='lookup_name' sys_fields_lookup_code.dddw.displaycolumn = 'lookup_name'")
		tab_properties.tabpage_2.dw_2.GetChild( "sys_fields_lookup_code", dwchild )                                           
		dwchild.SetTransObject( SQLCA )
		dwchild.Retrieve( )	
		tab_properties.tabpage_2.dw_2.Modify("sys_fields_lookup_field_name.dddw.name ='d_dddw_lookup_fld_nms_code'")	
	elseif ls_str = 'd_dddw_users' then
		tab_properties.tabpage_2.dw_2.Setitem( ll_row, "sys_fields_lookup_field", "U")
		if is_field_flag = 'P' then
			ls_str = w_contract_contact.tab_1.tabpage_custom.dw_2.Describe(is_FieldName + ".tag")
		else
			ls_str = w_contract_contact.tab_1.tabpage_custom_facility.dw_2.Describe(is_FieldName + ".tag")
		end if
		tab_properties.tabpage_2.dw_2.Setitem( ll_row, "sys_fields_lookup_code", ls_str)
		if is_field_flag = 'P' then
			ls_str = w_contract_contact.tab_1.tabpage_custom.dw_2.Describe(is_FieldName + ".dddw.DisplayColumn")
		else
			ls_str = w_contract_contact.tab_1.tabpage_custom_facility.dw_2.Describe(is_FieldName + ".dddw.DisplayColumn")
		end if
		tab_properties.tabpage_2.dw_2.Setitem( ll_row, "sys_fields_lookup_field_name", ls_str)
	elseif (ls_str = 'd_dddw_company' or ls_str = 'd_dddw_company_list' or ls_str = 'dddw_contact_company_new') then 
			tab_properties.tabpage_2.dw_2.Setitem( ll_row, "sys_fields_lookup_field", "C")
			if is_field_flag = 'P' then
				ls_str = w_contract_contact.tab_1.tabpage_custom.dw_2.Describe(is_FieldName + ".tag")
			else
				ls_str = w_contract_contact.tab_1.tabpage_custom_facility.dw_2.Describe(is_FieldName + ".tag")
			end if
			if ls_str = '?' then ls_str = 'All' 
			tab_properties.tabpage_2.dw_2.Setitem( ll_row, "sys_fields_lookup_code", ls_str)
			if is_field_flag = 'P' then
				ls_str = w_contract_contact.tab_1.tabpage_custom.dw_2.Describe(is_FieldName + ".dddw.DisplayColumn")
			else
				ls_str = w_contract_contact.tab_1.tabpage_custom_facility.dw_2.Describe(is_FieldName + ".dddw.DisplayColumn")
			end if
			tab_properties.tabpage_2.dw_2.Setitem( ll_row, "sys_fields_lookup_field_name", ls_str)	
			tab_properties.tabpage_2.dw_2.Modify("sys_fields_lookup_code.dddw.name = 'd_dddw_company_type' sys_fields_lookup_code.dddw.datacolumn ='company_type' sys_fields_lookup_code.dddw.displaycolumn = 'company_desc'")
			of_set_dispalyname_dddw()
		ELSE
			tab_properties.tabpage_2.dw_2.Setitem( ll_row, "disable_fields_lookup", 1)
		END IF
END IF
end subroutine

public subroutine of_update_property (string as_field, integer as_row);//====================================================================
// Function: of_update_property
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value    string    as_field
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:	Jay Chen		Date: 01-08-2014
//--------------------------------------------------------------------
//	Copyright (c) 2008-2013 ContractLogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

string ls_Edit_Style,ls_FieldName,ls_Proper,ls_ProExp
long ll_cnt,ll_dddw_width,ll_row
string ls_label,ls_dddw_name,ls_dddw_data,ls_dddw_display,ls_dddw_width
string ls_dddw_namedesc,ls_add_fly
string ls_lookup_field_style

ls_FieldName = as_field
ll_row = as_row
ls_Edit_Style = tab_properties.tabpage_2.dw_2.getitemstring(ll_row,"sys_fields_lookup_field")
ls_label = tab_properties.tabpage_2.dw_2.getitemstring(ll_row,"data_view_fields_field_label")
ls_dddw_namedesc = tab_properties.tabpage_2.dw_2.getitemstring(ll_row,"sys_fields_lookup_code")
ls_dddw_display = tab_properties.tabpage_2.dw_2.getitemstring(ll_row,"sys_fields_lookup_field_name")
ll_dddw_width = tab_properties.tabpage_2.dw_2.getitemnumber(ll_row,"sys_fields_drop_down_width")
ls_add_fly = tab_properties.tabpage_2.dw_2.getitemstring(ll_row,"fields_add_lookup")
ls_dddw_width = string(ll_dddw_width)

if isvalid(w_contract_contact) then 
	if is_field_flag = 'P' then //Added By Jay Chen 08-06-2015
		ls_dddw_name = w_contract_contact.tab_1.tabpage_custom.dw_2.describe(ls_FieldName + ".dddw.Name")
		ls_dddw_display = w_contract_contact.tab_1.tabpage_custom.dw_2.describe(ls_FieldName + ".dddw.DisplayColumn")
		ls_dddw_data = w_contract_contact.tab_1.tabpage_custom.dw_2.describe(ls_FieldName + ".dddw.DataColumn")
	else
		ls_dddw_name = w_contract_contact.tab_1.tabpage_custom_facility.dw_2.describe(ls_FieldName + ".dddw.Name")
		ls_dddw_display = w_contract_contact.tab_1.tabpage_custom_facility.dw_2.describe(ls_FieldName + ".dddw.DisplayColumn")
		ls_dddw_data = w_contract_contact.tab_1.tabpage_custom_facility.dw_2.describe(ls_FieldName + ".dddw.DataColumn")
	end if
end if

if ls_Edit_Style <> 'Y' then ls_add_fly = 'N'

choose case ls_Edit_Style
	case 'Y'
		ls_Edit_Style = 'Code Lookup'
		ls_lookup_field_style = 'C'
	case 'U'
		ls_Edit_Style = 'User'
		ls_lookup_field_style = 'U'
	case 'C'
		ls_Edit_Style = 'Company'
		ls_lookup_field_style = 'P'
		if upper(ls_dddw_namedesc) = 'OUR COMPANY' then
			ls_dddw_namedesc = 'A'
		elseif upper(ls_dddw_namedesc) = 'CONTRACTED COMPANY' then
			ls_dddw_namedesc = "B"
		elseif upper(ls_dddw_namedesc) = 'OTHER' then
			ls_dddw_namedesc = "O"
		end if
	case 'E'
		ls_Edit_Style = 'Edit'
		ls_lookup_field_style = ''
		ls_dddw_namedesc = ''
		ls_dddw_name = ''
		ls_dddw_display = ''
		ls_dddw_data = ''
end choose
		
select count(*) into :ll_cnt from ctx_contact_custom_config where field_name = :ls_FieldName and field_falg = :is_field_flag;
if isnull(ll_cnt) then ll_cnt = 0
choose case ls_Edit_Style
	case 'Edit'
//		if ll_cnt > 0 then
//			delete from ctx_contact_custom_config where field_name = :ls_FieldName;
//		end if
		if ll_cnt > 0  then
			update ctx_contact_custom_config
			set field_label = :ls_label,field_style = :ls_Edit_Style,field_dddw_namedesc = :ls_dddw_namedesc,field_dddw_name = :ls_dddw_name,field_dddw_display_column = :ls_dddw_display,field_dddw_data_column = :ls_dddw_data,field_dddw_add_fly = :ls_add_fly
			where field_name = :ls_FieldName and field_falg = :is_field_flag;
		else
			insert into ctx_contact_custom_config(field_name,field_label,field_style,field_dddw_namedesc,field_dddw_name,field_dddw_display_column,field_dddw_data_column,field_dddw_add_fly,field_falg)
			values(:ls_FieldName,:ls_label,:ls_Edit_Style,:ls_dddw_namedesc,:ls_dddw_name,:ls_dddw_display,:ls_dddw_data,:ls_add_fly,:is_field_flag);
		end if
	case else
		if ll_cnt > 0  then
			update ctx_contact_custom_config
			set field_label = :ls_label,field_style = :ls_Edit_Style,field_dddw_namedesc = :ls_dddw_namedesc,field_dddw_name = :ls_dddw_name,field_dddw_display_column = :ls_dddw_display,field_dddw_data_column = :ls_dddw_data,field_dddw_add_fly = :ls_add_fly
			where field_name = :ls_FieldName and field_falg = :is_field_flag;
		else
			insert into ctx_contact_custom_config(field_name,field_label,field_style,field_dddw_namedesc,field_dddw_name,field_dddw_display_column,field_dddw_data_column,field_dddw_add_fly,field_falg)
			values(:ls_FieldName,:ls_label,:ls_Edit_Style,:ls_dddw_namedesc,:ls_dddw_name,:ls_dddw_display,:ls_dddw_data,:ls_add_fly,:is_field_flag);
		end if
end choose

//Added By Jay Chen 02-05-2016 update export painter for custom field (ctx_lookup_type,lu_field_name,lookup_field_style,lookup_code)
if is_field_flag = 'P' then   //ctx_contacts
	if ls_lookup_field_style = '' then
		update export_fields
		set ctx_lookup_type = '',lu_field_name = '',lookup_field_style = '',lookup_code = ''
		where ctx_scrn_id = 2001 and ctx_column_name = :ls_FieldName;
	else
		update export_fields
		set ctx_lookup_type = 'C',lu_field_name = :ls_dddw_display,lookup_field_style = :ls_lookup_field_style,lookup_code = :ls_dddw_namedesc
		where ctx_scrn_id = 2001 and ctx_column_name = :ls_FieldName;
	end if
else
	if ls_lookup_field_style = '' then
		update export_fields
		set ctx_lookup_type = '',lu_field_name = '',lookup_field_style = '',lookup_code = ''
		where ctx_scrn_id = 2003 and ctx_column_name = :ls_FieldName;
	else
		update export_fields
		set ctx_lookup_type = 'C',lu_field_name = :ls_dddw_display,lookup_field_style = :ls_lookup_field_style,lookup_code = :ls_dddw_namedesc
		where ctx_scrn_id = 2003 and ctx_column_name = :ls_FieldName;
	end if
end if


commit;
end subroutine

public subroutine of_auto_update_contactsyntax (long al_view_id, long al_screen_id, string as_fieldname[]);//Modified by Ken.Guo 2017/02/15
of_auto_update_contactsyntax(al_view_id,al_screen_id,as_fieldname[], '' )

////====================================================================
//// Function: of_auto_update_contactsyntax
////--------------------------------------------------------------------
//// Description:
////--------------------------------------------------------------------
//// Arguments:
//// 	value    long      al_view_id
//// 	value    long      al_screen_id
//// 	value    string    as_fieldname[]
////--------------------------------------------------------------------
//// Returns:  (None)
////--------------------------------------------------------------------
//// Author:	Jay Chen		Date: 10-26-2015
////--------------------------------------------------------------------
////	Copyright (c) 2008-2014 ContractLogix, All rights reserved.
////--------------------------------------------------------------------
//// Modify History:
////
////====================================================================
//
//long		ll_Find, ll_dataviewid,ll_index,ll_found
//DateTime	ldt_Now
//dataStore	lds_test,lds_detail,lds_field_ex
//string ls_dw_syntax,ls_dw_opsyntax,ls_lookuplist,ls_null
//string ls_FieldName,ls_LabelName,ls_DetailSyntax,ls_DetailSyntax_new
//String	ls_Edit_Style,ls_Visible
//String	ls_Proper,ls_ProExp,ls_Proper_modify,ls_add_fly
//String	ls_ObjType, ls_Err
//long		ll_RtnVal
//datawindow ldw_custom
//string ls_FieldName_ori,ls_LabelName_ori
//
//if (al_screen_id <> 1 and al_screen_id <> 6 and al_screen_id <> 7) then Return
//if UpperBound(as_fieldname) = 0  then Return
//
//SetPointer(HourGlass!)
//
////if al_screen_id = 1 then //Added By Jay Chen 11-30-2015
////	ls_DetailSyntax = f_get_screen_sql(al_view_id,al_screen_id,false)
////else
////	ls_DetailSyntax = f_get_screen_gridsql(al_view_id,al_screen_id,false)
////end if
//ls_DetailSyntax = gf_get_view_screen(al_view_id,al_screen_id)
//if IsNull(ls_DetailSyntax) or Trim(ls_DetailSyntax) = "" then Return
//
//lds_detail = create DataStore
//lds_detail.Create(ls_DetailSyntax, ls_Err )
//If Len( ls_Err ) > 0 Then
//	Messagebox("Auto Update Company Contact Screen", "The Syntax:(View ID=" + string(al_view_id) + " Screen ID=" +string(al_screen_id) +") is error !" + ls_Err )
//	Return
//End If
//
//lds_field_ex = create datastore
//lds_field_ex.dataobject = 'd_contract_field_properties_ex'
//lds_field_ex.settransobject(sqlca)
//lds_field_ex.retrieve(al_view_id,al_screen_id)
//
//if isvalid(w_contract_contact) then
//	if is_field_flag = 'P' then 
//		ldw_custom = w_contract_contact.tab_1.tabpage_custom.dw_2
//	else
//		ldw_custom = w_contract_contact.tab_1.tabpage_custom_facility.dw_2
//	end if
//else
//	return
//end if
//
//for ll_index = 1 to UpperBound(as_fieldname)
//	if isnull(as_fieldname[ll_index]) or trim(as_fieldname[ll_index]) = '' then continue
//	if is_field_flag = 'P' then
//		If al_screen_id = 1 Then //Added by Ken.guo 2017/02/15. Task 543. support contact custom fields in the search screen.
//			ls_FieldName =  'occi_contacts_' + as_fieldname[ll_index]
//			ls_LabelName = 'occi_contacts_' + as_fieldname[ll_index] + "_t"			
//		Else
//			ls_FieldName =  'ctx_contacts_' + as_fieldname[ll_index]
//			ls_LabelName = 'ctx_contacts_' + as_fieldname[ll_index] + "_t"
//		End If
//	else
//		ls_FieldName =  'app_facility_' + as_fieldname[ll_index]
//		ls_LabelName = 'app_facility_' + as_fieldname[ll_index] + "_t"
//	end if
//	ls_FieldName_ori =  as_fieldname[ll_index]
//	ls_LabelName_ori = as_fieldname[ll_index] + "_t"
//
//	ls_Visible = lds_detail.Describe(ls_FieldName + ".Visible")
//	if (ls_Visible = "?" or ls_Visible = "!") then Return
//
//	ls_Proper = ls_LabelName_ori + ".Text"
//	ls_Proper_modify = ls_LabelName + ".Text"
//	ls_ProExp = ldw_custom.Describe(ls_Proper)
//	lds_detail.Modify(ls_Proper_modify + "='" + ls_ProExp + "'")
//
//	ls_Edit_Style = ldw_custom.Describe(ls_FieldName_ori + ".Edit.Style")
//	if ls_Edit_Style = "edit" then
//		ls_Proper = ls_FieldName_ori + "." + ls_Edit_Style + ".format"
//		ls_Proper_modify = ls_FieldName + "." + ls_Edit_Style + ".format"
//		ls_ProExp = ldw_custom.Describe(ls_Proper)
//		if not(ls_ProExp = '?' or ls_ProExp  = '!'  or trim( ls_Proper) = '') then lds_detail.Modify(ls_Proper_modify + "='" + ls_ProExp + "'")
//	elseif ls_Edit_Style = "editmask" then
//		ls_Proper = ls_FieldName_ori + "." + ls_Edit_Style + ".Mask"
//		ls_Proper_modify = ls_FieldName + "." + ls_Edit_Style + ".Mask"
//		ls_ProExp = ldw_custom.Describe(ls_Proper)
//		if not(ls_ProExp = '?' or ls_ProExp  = '!'  or trim( ls_Proper) = '') then lds_detail.Modify(ls_Proper_modify + "='" + ls_ProExp + "'")
//	elseif ls_Edit_Style = "dddw" then
//		ls_Proper = ls_FieldName_ori + ".dddw.VscrollBar"
//		ls_Proper_modify = ls_FieldName + ".dddw.VscrollBar"
//		ls_ProExp = ldw_custom.Describe(ls_Proper)
//		If ls_ProExp = '?' or ls_ProExp  = '!'  or trim( ls_Proper) = '' Then ls_ProExp = "no"
//		lds_detail.Modify(ls_Proper_modify + "='" + ls_ProExp + "'")
//		
//		ls_Proper = ls_FieldName_ori + ".dddw.AutoHScroll"
//		ls_Proper_modify = ls_FieldName + ".dddw.AutoHScroll"
//		ls_ProExp = ldw_custom.Describe(ls_Proper)
//		If ls_ProExp = '?' or ls_ProExp  = '!' or trim( ls_Proper) = ''  Then ls_ProExp = "no"
//		lds_detail.Modify(ls_Proper_modify + "='" + ls_ProExp + "'")
//		
//		if al_screen_id = 1 then //Added By Jay Chen 12-01-2015
//			ls_Proper = ls_FieldName_ori + ".dddw.UseAsBorder"
//			ls_Proper_modify = ls_FieldName + ".dddw.UseAsBorder"
//			ls_ProExp = ldw_custom.Describe(ls_Proper)
//			If ls_ProExp = '?' or ls_ProExp  = '!' or trim( ls_Proper) = ''  Then ls_ProExp = "no"
//			lds_detail.Modify(ls_Proper_modify + "='" + ls_ProExp + "'")
//		end if
//				
//		ls_Proper = ls_FieldName_ori + ".dddw.NilIsNull"
//		ls_Proper_modify = ls_FieldName + ".dddw.NilIsNull"
//		ls_ProExp = ldw_custom.Describe(ls_Proper)
//		If ls_ProExp = '?' or ls_ProExp  = '!'  or trim( ls_Proper) = ''  Then ls_ProExp = "no"
//		lds_detail.Modify(ls_Proper_modify + "='" + ls_ProExp + "'")
//		
//		ls_Proper = ls_FieldName_ori + ".dddw.Name"
//		ls_Proper_modify = ls_FieldName + ".dddw.Name"
//		ls_ProExp = ldw_custom.Describe(ls_Proper)
//		If ls_ProExp = '?' or ls_ProExp  = '!' or trim( ls_Proper) = ''  Then ls_ProExp = "none"
//		lds_detail.Modify(ls_Proper_modify + "='" + ls_ProExp + "'")
//		
//		ls_Proper = ls_FieldName_ori + ".dddw.DataColumn"
//		ls_Proper_modify = ls_FieldName + ".dddw.DataColumn"
//		ls_ProExp = ldw_custom.Describe(ls_Proper)
//		If ls_ProExp = '?' or ls_ProExp  = '!' or trim( ls_Proper) = ''   Then ls_ProExp = "none"
//		lds_detail.Modify(ls_Proper_modify + "='" + ls_ProExp + "'")
//		
//		ls_Proper = ls_FieldName_ori + ".dddw.DisplayColumn"
//		ls_Proper_modify = ls_FieldName + ".dddw.DisplayColumn"
//		ls_ProExp = ldw_custom.Describe(ls_Proper)
//		If ls_ProExp = '?' or ls_ProExp  = '!'  or trim( ls_Proper) = ''  Then ls_ProExp = "none"
//		lds_detail.Modify(ls_Proper_modify + "='" + ls_ProExp + "'")
//		
//		ls_Proper = ls_FieldName_ori + ".dddw.PercentWidth"
//		ls_Proper_modify = ls_FieldName + ".dddw.PercentWidth"
//		ls_ProExp = ldw_custom.Describe(ls_Proper)
//		If ls_ProExp = '?' or ls_ProExp  = '!'  or trim( ls_Proper) = ''  Then ls_ProExp = "0"
//		lds_detail.Modify(ls_Proper_modify + "='" + ls_ProExp + "'")
//		
//		ls_Proper = ls_FieldName_ori + ".tag"	
//		ls_Proper_modify = ls_FieldName + ".tag"
//		ls_ProExp = ldw_custom.Describe(ls_Proper)
//		If ls_ProExp = '?' or ls_ProExp  = '!' Then ls_ProExp = ""
//		choose case ls_ProExp
//			case "Other"
//				ls_ProExp = 'O'
//			case "Contracted Company"
//				ls_ProExp = 'B'
//			case "Our company"
//				ls_ProExp = 'A'
//		end choose
//		lds_detail.Modify(ls_Proper_modify + "='" + ls_ProExp + "'")
//		//add on fly
//		ll_find = tab_properties.tabpage_2.dw_2.find("sys_fields_field_name = '"+ls_FieldName_ori+"'", 1, tab_properties.tabpage_2.dw_2.rowcount())
//		if isnull(ll_find) then ll_find = 0
//		if ll_find > 0 then ls_add_fly = tab_properties.tabpage_2.dw_2.getitemstring(ll_find,"fields_add_lookup")
//		if isnull(ls_add_fly) then ls_add_fly = ''
//		ll_found = lds_field_ex.find( "field_name='" + ls_FieldName + "'" , 1, lds_field_ex.RowCount())
//		if isnull(ll_found) then ll_found = 0
//		if ll_found > 0 then 
//			lds_field_ex.SetItem(ll_found,"field_Add",ls_add_fly)
//		else
//			ll_found = lds_field_ex.InsertRow( 0)
//			lds_field_ex.SetItem(ll_found,"data_view_id",al_view_id )
//			lds_field_ex.SetItem(ll_found,"screen_id",al_screen_id )
//			lds_field_ex.SetItem(ll_found,"field_name",ls_FieldName)
//			lds_field_ex.SetItem(ll_found,"field_Add",ls_add_fly)
//		end if
//	end if
//next
//
//ls_DetailSyntax_new = lds_detail.Object.DataWindow.Syntax
//lds_Test = create DataStore
//lds_Test.Create( ls_DetailSyntax_new, ls_Err )
//If Len( ls_Err ) > 0 Then
//	gnv_debug.of_output( true, 'Failed to auto update!' + 'error=' + ls_Err + ',syntax=' + ls_DetailSyntax_new )
//	MessageBox( 'Tips', 'Failed to auto update property!' )
//	Return 		
//End If	
//	
//setnull(ls_null)
//if gf_get_opsyntax(ls_DetailSyntax_new,ls_null,ls_dw_opsyntax,ls_lookuplist) < 0 then ls_dw_opsyntax = ls_DetailSyntax_new
//lds_Test.Create( ls_dw_opsyntax , ls_Err )
//If Len( ls_Err ) > 0 Then
//	gnv_debug.of_output( true, 'Failed to auto update!' + 'error=' + ls_Err + ',syntax=' + ls_dw_opsyntax )
//	MessageBox( 'Tips', 'Failed to auto update property!' )
//	Return 
//End If
//
//If Isvalid( lds_Test ) Then destroy( lds_Test )
//If Isvalid( lds_detail ) Then destroy( lds_detail )
//
//if al_screen_id = 1 then //Added By Jay Chen 11-30-2015
//	Update ctx_screen  set  dw_sql = :ls_DetailSyntax_new, dw_opsql = :ls_dw_opsyntax where data_view_id = :al_view_id and screen_id = :al_screen_id; 
//else
//	Update ctx_screen  set  grid_sql = :ls_DetailSyntax_new, grid_opsql = :ls_dw_opsyntax where data_view_id = :al_view_id and screen_id = :al_screen_id; 
//end if
//
//If sqlca.sqlcode <> 0 Then
//	MessageBox( 'Tips', 'Failed to save for auto updating!' )
//	Return 
//End If
//
//ldt_Now =Datetime(Today(),Now())
//Update ctx_screen  set modify_date = :ldt_Now where data_view_id = :al_view_id and screen_id = :al_screen_id;  
//lds_field_ex.update()
//commit;
//
//If Isvalid( lds_field_ex ) Then destroy( lds_field_ex )
//SetPointer(Arrow!)
end subroutine

public subroutine of_auto_update_contactsyntax (long al_view_id, long al_screen_id, string as_fieldname[], string as_contact_type);//====================================================================
// Function: of_auto_update_contactsyntax
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value    long      al_view_id
// 	value    long      al_screen_id
// 	value    string    as_fieldname[]
//  value 	  string 	as_contact_type
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:	Jay Chen		Date: 10-26-2015
//--------------------------------------------------------------------
//	Copyright (c) 2008-2014 ContractLogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
// Added argument as_contact_type by Ken.Guo 2017/02/15 
//====================================================================

long		ll_Find, ll_dataviewid,ll_index,ll_found
DateTime	ldt_Now
dataStore	lds_test,lds_detail,lds_field_ex
string ls_dw_syntax,ls_dw_opsyntax,ls_lookuplist,ls_null
string ls_FieldName,ls_LabelName,ls_DetailSyntax,ls_DetailSyntax_new
String	ls_Edit_Style,ls_Visible
String	ls_Proper,ls_ProExp,ls_Proper_modify,ls_add_fly
String	ls_ObjType, ls_Err
long		ll_RtnVal
datawindow ldw_custom
string ls_FieldName_ori,ls_LabelName_ori

if (al_screen_id <> 1 and al_screen_id <> 6 and al_screen_id <> 7) then Return
if UpperBound(as_fieldname) = 0  then Return

SetPointer(HourGlass!)

//if al_screen_id = 1 then //Added By Jay Chen 11-30-2015
//	ls_DetailSyntax = f_get_screen_sql(al_view_id,al_screen_id,false)
//else
//	ls_DetailSyntax = f_get_screen_gridsql(al_view_id,al_screen_id,false)
//end if
ls_DetailSyntax = gf_get_view_screen(al_view_id,al_screen_id)
if IsNull(ls_DetailSyntax) or Trim(ls_DetailSyntax) = "" then Return

lds_detail = create DataStore
lds_detail.Create(ls_DetailSyntax, ls_Err )
If Len( ls_Err ) > 0 Then
	Messagebox("Auto Update Company Contact Screen", "The Syntax:(View ID=" + string(al_view_id) + " Screen ID=" +string(al_screen_id) +") is error !" + ls_Err )
	Return
End If

lds_field_ex = create datastore
lds_field_ex.dataobject = 'd_contract_field_properties_ex'
lds_field_ex.settransobject(sqlca)
lds_field_ex.retrieve(al_view_id,al_screen_id)

if isvalid(w_contract_contact) then
	if is_field_flag = 'P' then 
		ldw_custom = w_contract_contact.tab_1.tabpage_custom.dw_2
	else
		ldw_custom = w_contract_contact.tab_1.tabpage_custom_facility.dw_2
	end if
else
	return
end if

for ll_index = 1 to UpperBound(as_fieldname)
	if isnull(as_fieldname[ll_index]) or trim(as_fieldname[ll_index]) = '' then continue
	if is_field_flag = 'P' then
		If al_screen_id = 1 Then //Added by Ken.guo 2017/02/15. Task 543. support occi/ccci contact custom fields in the search screen.
			ls_FieldName =  as_contact_type + '_contacts_' + as_fieldname[ll_index]
			ls_LabelName = as_contact_type + '_contacts_' + as_fieldname[ll_index] + "_t"			
		Else
			ls_FieldName =  'ctx_contacts_' + as_fieldname[ll_index]
			ls_LabelName = 'ctx_contacts_' + as_fieldname[ll_index] + "_t"
		End If
	else
		ls_FieldName =  'app_facility_' + as_fieldname[ll_index]
		ls_LabelName = 'app_facility_' + as_fieldname[ll_index] + "_t"
	end if
	ls_FieldName_ori =  as_fieldname[ll_index]
	ls_LabelName_ori = as_fieldname[ll_index] + "_t"

	ls_Visible = lds_detail.Describe(ls_FieldName + ".Visible")
	if (ls_Visible = "?" or ls_Visible = "!") then Return

	ls_Proper = ls_LabelName_ori + ".Text"
	ls_Proper_modify = ls_LabelName + ".Text"
	ls_ProExp = ldw_custom.Describe(ls_Proper)
	lds_detail.Modify(ls_Proper_modify + "='" + ls_ProExp + "'")

	ls_Edit_Style = ldw_custom.Describe(ls_FieldName_ori + ".Edit.Style")
	if ls_Edit_Style = "edit" then
		ls_Proper = ls_FieldName_ori + "." + ls_Edit_Style + ".format"
		ls_Proper_modify = ls_FieldName + "." + ls_Edit_Style + ".format"
		ls_ProExp = ldw_custom.Describe(ls_Proper)
		if not(ls_ProExp = '?' or ls_ProExp  = '!'  or trim( ls_Proper) = '') then lds_detail.Modify(ls_Proper_modify + "='" + ls_ProExp + "'")
	elseif ls_Edit_Style = "editmask" then
		ls_Proper = ls_FieldName_ori + "." + ls_Edit_Style + ".Mask"
		ls_Proper_modify = ls_FieldName + "." + ls_Edit_Style + ".Mask"
		ls_ProExp = ldw_custom.Describe(ls_Proper)
		if not(ls_ProExp = '?' or ls_ProExp  = '!'  or trim( ls_Proper) = '') then lds_detail.Modify(ls_Proper_modify + "='" + ls_ProExp + "'")
	elseif ls_Edit_Style = "dddw" then
		ls_Proper = ls_FieldName_ori + ".dddw.VscrollBar"
		ls_Proper_modify = ls_FieldName + ".dddw.VscrollBar"
		ls_ProExp = ldw_custom.Describe(ls_Proper)
		If ls_ProExp = '?' or ls_ProExp  = '!'  or trim( ls_Proper) = '' Then ls_ProExp = "no"
		lds_detail.Modify(ls_Proper_modify + "='" + ls_ProExp + "'")
		
		ls_Proper = ls_FieldName_ori + ".dddw.AutoHScroll"
		ls_Proper_modify = ls_FieldName + ".dddw.AutoHScroll"
		ls_ProExp = ldw_custom.Describe(ls_Proper)
		If ls_ProExp = '?' or ls_ProExp  = '!' or trim( ls_Proper) = ''  Then ls_ProExp = "no"
		lds_detail.Modify(ls_Proper_modify + "='" + ls_ProExp + "'")
		
		if al_screen_id = 1 then //Added By Jay Chen 12-01-2015
			ls_Proper = ls_FieldName_ori + ".dddw.UseAsBorder"
			ls_Proper_modify = ls_FieldName + ".dddw.UseAsBorder"
			ls_ProExp = ldw_custom.Describe(ls_Proper)
			If ls_ProExp = '?' or ls_ProExp  = '!' or trim( ls_Proper) = ''  Then ls_ProExp = "no"
			lds_detail.Modify(ls_Proper_modify + "='" + ls_ProExp + "'")
		end if
				
		ls_Proper = ls_FieldName_ori + ".dddw.NilIsNull"
		ls_Proper_modify = ls_FieldName + ".dddw.NilIsNull"
		ls_ProExp = ldw_custom.Describe(ls_Proper)
		If ls_ProExp = '?' or ls_ProExp  = '!'  or trim( ls_Proper) = ''  Then ls_ProExp = "no"
		lds_detail.Modify(ls_Proper_modify + "='" + ls_ProExp + "'")
		
		ls_Proper = ls_FieldName_ori + ".dddw.Name"
		ls_Proper_modify = ls_FieldName + ".dddw.Name"
		ls_ProExp = ldw_custom.Describe(ls_Proper)
		If ls_ProExp = '?' or ls_ProExp  = '!' or trim( ls_Proper) = ''  Then ls_ProExp = "none"
		lds_detail.Modify(ls_Proper_modify + "='" + ls_ProExp + "'")
		
		ls_Proper = ls_FieldName_ori + ".dddw.DataColumn"
		ls_Proper_modify = ls_FieldName + ".dddw.DataColumn"
		ls_ProExp = ldw_custom.Describe(ls_Proper)
		If ls_ProExp = '?' or ls_ProExp  = '!' or trim( ls_Proper) = ''   Then ls_ProExp = "none"
		lds_detail.Modify(ls_Proper_modify + "='" + ls_ProExp + "'")
		
		ls_Proper = ls_FieldName_ori + ".dddw.DisplayColumn"
		ls_Proper_modify = ls_FieldName + ".dddw.DisplayColumn"
		ls_ProExp = ldw_custom.Describe(ls_Proper)
		If ls_ProExp = '?' or ls_ProExp  = '!'  or trim( ls_Proper) = ''  Then ls_ProExp = "none"
		lds_detail.Modify(ls_Proper_modify + "='" + ls_ProExp + "'")
		
		ls_Proper = ls_FieldName_ori + ".dddw.PercentWidth"
		ls_Proper_modify = ls_FieldName + ".dddw.PercentWidth"
		ls_ProExp = ldw_custom.Describe(ls_Proper)
		If ls_ProExp = '?' or ls_ProExp  = '!'  or trim( ls_Proper) = ''  Then ls_ProExp = "0"
		lds_detail.Modify(ls_Proper_modify + "='" + ls_ProExp + "'")
		
		ls_Proper = ls_FieldName_ori + ".tag"	
		ls_Proper_modify = ls_FieldName + ".tag"
		ls_ProExp = ldw_custom.Describe(ls_Proper)
		If ls_ProExp = '?' or ls_ProExp  = '!' Then ls_ProExp = ""
		choose case ls_ProExp
			case "Other"
				ls_ProExp = 'O'
			case "Contracted Company"
				ls_ProExp = 'B'
			case "Our company"
				ls_ProExp = 'A'
		end choose
		lds_detail.Modify(ls_Proper_modify + "='" + ls_ProExp + "'")
		//add on fly
		ll_find = tab_properties.tabpage_2.dw_2.find("sys_fields_field_name = '"+ls_FieldName_ori+"'", 1, tab_properties.tabpage_2.dw_2.rowcount())
		if isnull(ll_find) then ll_find = 0
		if ll_find > 0 then ls_add_fly = tab_properties.tabpage_2.dw_2.getitemstring(ll_find,"fields_add_lookup")
		if isnull(ls_add_fly) then ls_add_fly = ''
		ll_found = lds_field_ex.find( "field_name='" + ls_FieldName + "'" , 1, lds_field_ex.RowCount())
		if isnull(ll_found) then ll_found = 0
		if ll_found > 0 then 
			lds_field_ex.SetItem(ll_found,"field_Add",ls_add_fly)
		else
			ll_found = lds_field_ex.InsertRow( 0)
			lds_field_ex.SetItem(ll_found,"data_view_id",al_view_id )
			lds_field_ex.SetItem(ll_found,"screen_id",al_screen_id )
			lds_field_ex.SetItem(ll_found,"field_name",ls_FieldName)
			lds_field_ex.SetItem(ll_found,"field_Add",ls_add_fly)
		end if
	end if
next

ls_DetailSyntax_new = lds_detail.Object.DataWindow.Syntax
lds_Test = create DataStore
lds_Test.Create( ls_DetailSyntax_new, ls_Err )
If Len( ls_Err ) > 0 Then
	gnv_debug.of_output( true, 'Failed to auto update!' + 'error=' + ls_Err + ',syntax=' + ls_DetailSyntax_new )
	MessageBox( 'Tips', 'Failed to auto update property!' )
	Return 		
End If	
	
setnull(ls_null)
if gf_get_opsyntax(ls_DetailSyntax_new,ls_null,ls_dw_opsyntax,ls_lookuplist) < 0 then ls_dw_opsyntax = ls_DetailSyntax_new
lds_Test.Create( ls_dw_opsyntax , ls_Err )
If Len( ls_Err ) > 0 Then
	gnv_debug.of_output( true, 'Failed to auto update!' + 'error=' + ls_Err + ',syntax=' + ls_dw_opsyntax )
	MessageBox( 'Tips', 'Failed to auto update property!' )
	Return 
End If

If Isvalid( lds_Test ) Then destroy( lds_Test )
If Isvalid( lds_detail ) Then destroy( lds_detail )

if al_screen_id = 1 then //Added By Jay Chen 11-30-2015
	Update ctx_screen  set  dw_sql = :ls_DetailSyntax_new, dw_opsql = :ls_dw_opsyntax where data_view_id = :al_view_id and screen_id = :al_screen_id; 
else
	Update ctx_screen  set  grid_sql = :ls_DetailSyntax_new, grid_opsql = :ls_dw_opsyntax where data_view_id = :al_view_id and screen_id = :al_screen_id; 
end if

If sqlca.sqlcode <> 0 Then
	MessageBox( 'Tips', 'Failed to save for auto updating!' )
	Return 
End If

ldt_Now =Datetime(Today(),Now())
Update ctx_screen  set modify_date = :ldt_Now where data_view_id = :al_view_id and screen_id = :al_screen_id;  
lds_field_ex.update()
commit;

If Isvalid( lds_field_ex ) Then destroy( lds_field_ex )
SetPointer(Arrow!)
end subroutine

on w_contact_custom_edit.create
int iCurrent
call super::create
this.progress_bar=create progress_bar
this.cb_1=create cb_1
this.cb_save=create cb_save
this.dw_3=create dw_3
this.tab_properties=create tab_properties
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.progress_bar
this.Control[iCurrent+2]=this.cb_1
this.Control[iCurrent+3]=this.cb_save
this.Control[iCurrent+4]=this.dw_3
this.Control[iCurrent+5]=this.tab_properties
this.Control[iCurrent+6]=this.cb_cancel
this.Control[iCurrent+7]=this.cb_ok
end on

on w_contact_custom_edit.destroy
call super::destroy
destroy(this.progress_bar)
destroy(this.cb_1)
destroy(this.cb_save)
destroy(this.dw_3)
destroy(this.tab_properties)
destroy(this.cb_cancel)
destroy(this.cb_ok)
end on

event open;call super::open;long ll_row
string ls_label,ls_edit_style,ls_edit_codetable,ls_column_name,ls_editmask_codetable,ls_column_coltype,ls_str

gf_WinCenter(This)
progress_bar.st_1.x = progress_bar.x + (progress_bar.width / 2)

//Added By Jay Chen 08-06-2015
is_field_flag = message.stringparm
if isnull(is_field_flag) then is_field_flag = ''
if is_field_flag = '' then is_field_flag = 'P'
if is_field_flag = 'P' then
	this.title = 'Contact Custom Field Properties'
else
	this.title = 'Company Custom Field Properties'
end if

ids_custom_field = create datastore
ids_custom_field.dataobject = 'd_contact_custom_configlist'
ids_custom_field.settransobject(sqlca)
ids_custom_field.retrieve()
dw_3.selectrow(1,true)
ls_column_name = 'custom_1'
is_FieldName = ls_column_name

ll_row = tab_properties.tabpage_2.dw_2.insertrow(0)
tab_properties.tabpage_2.dw_2.accepttext()
tab_properties.tabpage_2.dw_2.setitem(ll_row,"sys_fields_field_name",is_FieldName)

of_display_custom_property()

of_init_dddw("custom_1")











end event

event key;call super::key;if Key = KeyEscape! then Close(This)

end event

type progress_bar from u_progress within w_contact_custom_edit
event destroy ( )
boolean visible = false
integer x = 9
integer y = 1440
integer width = 1129
integer height = 72
integer taborder = 50
borderstyle borderstyle = stylelowered!
end type

on progress_bar.destroy
call u_progress::destroy
end on

type cb_1 from u_cb within w_contact_custom_edit
integer x = 1157
integer y = 1428
integer width = 320
integer taborder = 40
boolean bringtotop = true
string text = "&Reset"
end type

event clicked;call super::clicked;//====================================================================
// Event: clicked
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	Jay Chen		Date: 09-26-2014
//--------------------------------------------------------------------
//	Copyright (c) 2008-2013 ContractLogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

long ll_row,ll_rtn
string ls_fieldname

ll_row = dw_3.getrow()
if ll_row < 1 then return
ls_fieldname = dw_3.getitemstring(ll_row,"field_name")
ll_rtn = MessageBox('Confirm Reset','Are you sure you want to reset the properties for ' + ls_fieldname + '? ',Question!,YesNo!,2)
if ll_rtn <> 1 then return

if isvalid(w_contract_contact) then
	w_contract_contact.of_load_default(ls_fieldname)
end if
	
Close(Parent)





end event

type cb_save from u_cb within w_contact_custom_edit
integer x = 1490
integer y = 1428
integer width = 320
integer taborder = 30
boolean bringtotop = true
string text = "&Save"
boolean default = true
end type

event clicked;call super::clicked;String 	ls_FieldName,ls_Visible, ls_TCol,ls_view
long		ll_Row,ll_rtn,ll_view,ll_pos,ll_viewlist[]
string		ls_sync_screen_contact,ls_field_name[]
n_cst_string lnv_string

tab_properties.tabpage_2.dw_2.AcceptText()
for ll_row = 1 to tab_properties.tabpage_2.dw_2.rowcount()
	ls_FieldName = tab_properties.tabpage_2.dw_2.GetItemString(ll_Row,"sys_fields_field_name")
	ls_field_name[upperbound(ls_field_name) + 1] = ls_FieldName
	of_update_property(ls_FieldName,ll_row)
next

if isvalid(w_contract_contact) then
	w_contract_contact.of_init_custom_dddw()
end if

//Added By Jay Chen 10-26-2015 sync screen syntax(Contracted Company Contact and Our Company Contact)
ls_sync_screen_contact = gnv_data.of_getitem("icred_settings", "sync_screen_contact", false)
if isnull(ls_sync_screen_contact) then ls_sync_screen_contact = '0'
if ls_sync_screen_contact = '1' and ib_have_modify  then
//	if Messagebox("Confirm Sync Contact Screen","Do you want to sync the labels and style to the Contract Folder?",Question!,YesNo!) = 1 then
		OpenWithParm( w_select_contact_view, "C" )
		ls_view = Message.StringParm
		if ls_view <> "Cancel" then
			lnv_string.of_parsetoarray(ls_view, ',', ll_viewlist)
			if upperbound(ll_viewlist) > 0 then progress_bar.visible = true
			for ll_row = 1 to upperbound(ll_viewlist)
				ll_view = ll_viewlist[ll_row]
				if isnull(ll_view) then ll_view = 0
				if ll_view = 0 then continue
				of_auto_update_contactsyntax(ll_view,6,ls_field_name)
				of_auto_update_contactsyntax(ll_view,7,ls_field_name)
				
				//Modified by Ken.Guo 2017/02/15
				//of_auto_update_contactsyntax(ll_view,1,ls_field_name) //Added By Jay Chen 11-30-2015
				If is_field_flag = 'P' Then
					of_auto_update_contactsyntax(ll_view,1,ls_field_name,'occi')  //Our Company Contact Info
					of_auto_update_contactsyntax(ll_view,1,ls_field_name,'ccci')  //Contracted Company Contact Info
				Else
					of_auto_update_contactsyntax(ll_view,1,ls_field_name)
				End If				
				
				progress_bar.uf_set_position (round(ll_row / upperbound(ll_viewlist),2)  * 100) 
				yield()
			next
		end if
//	end if
end if
//end
	
Close(Parent)

end event

type dw_3 from datawindow within w_contact_custom_edit
integer x = 14
integer y = 12
integer width = 521
integer height = 1400
integer taborder = 40
string title = "none"
string dataobject = "d_contact_custom_fieldlist"
boolean vscrollbar = true
boolean livescroll = true
end type

event clicked;long ll_rtn,ll_row,ll_find,ll_found
string ls_old_fieldname,ls_Edit_Style,ls_dddw_code,ls_addfly

if row <= 0 then return
this.selectrow(0,false)
this.selectrow(row,true)
ls_old_fieldname = tab_properties.tabpage_2.dw_2.getitemstring(tab_properties.tabpage_2.dw_2.getrow(),"sys_fields_field_name")
ls_edit_style = tab_properties.tabpage_2.dw_2.getitemstring(tab_properties.tabpage_2.dw_2.getrow(),"sys_fields_lookup_field")
ls_dddw_code= tab_properties.tabpage_2.dw_2.getitemstring(tab_properties.tabpage_2.dw_2.getrow(),"sys_fields_lookup_code")
if ls_edit_style = 'Y' then
	if isnull(ls_dddw_code) or trim(ls_dddw_code) = '' then
		 messagebox(gnv_app.iapp_object.DisplayName,'Lookup table name can not empty, please choose a lookup table name!')
		 tab_properties.tabpage_2.dw_2.setcolumn("sys_fields_lookup_code")
		 ll_found = dw_3.find("field_name = '"+ls_old_fieldname+"'",1, dw_3.rowcount())
		 if ll_found > 0 then
			dw_3.selectrow(0,false)
			dw_3.selectrow(ll_found,true)
		end if
		 return
	end if
end if

is_FieldName = this.getitemstring(row,"field_name")
ll_find = tab_properties.tabpage_2.dw_2.find("sys_fields_field_name = '"+is_FieldName+"'",1,tab_properties.tabpage_2.dw_2.rowcount())
if ll_find > 0 then
	tab_properties.tabpage_2.dw_2.scrolltorow(ll_find)
	tab_properties.tabpage_2.dw_2.setrow(ll_find)
else
	ll_row = tab_properties.tabpage_2.dw_2.insertrow(0)
	tab_properties.tabpage_2.dw_2.scrolltorow(ll_row)
	tab_properties.tabpage_2.dw_2.setrow(ll_row)
	tab_properties.tabpage_2.dw_2.accepttext()
	tab_properties.tabpage_2.dw_2.setitem(ll_row,"sys_fields_field_name",is_FieldName)
	tab_properties.tabpage_2.dw_2.setitem(ll_row,"data_view_fields_field_label",'')
	tab_properties.tabpage_2.dw_2.setitem(ll_row,"sys_fields_lookup_field",'E')
	tab_properties.tabpage_2.dw_2.setitem(ll_row,"sys_fields_lookup_code",'')
	of_display_custom_property()
end if

end event

type tab_properties from tab within w_contact_custom_edit
integer x = 553
integer y = 12
integer width = 1595
integer height = 1400
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 67108864
boolean fixedwidth = true
boolean raggedright = true
boolean focusonbuttondown = true
boolean boldselectedtext = true
alignment alignment = center!
integer selectedtab = 2
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type

on tab_properties.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.Control[]={this.tabpage_1,&
this.tabpage_2}
end on

on tab_properties.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
end on

type tabpage_1 from userobject within tab_properties
boolean visible = false
integer x = 18
integer y = 100
integer width = 1559
integer height = 1284
long backcolor = 67108864
string text = " Fields List"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_1 dw_1
end type

on tabpage_1.create
this.dw_1=create dw_1
this.Control[]={this.dw_1}
end on

on tabpage_1.destroy
destroy(this.dw_1)
end on

type dw_1 from datawindow within tabpage_1
boolean visible = false
integer x = 320
integer width = 818
integer height = 1260
integer taborder = 30
string title = "none"
string dataobject = "d_contact_custom_fieldlist"
boolean border = false
boolean livescroll = true
end type

type tabpage_2 from userobject within tab_properties
event create ( )
event destroy ( )
integer x = 18
integer y = 100
integer width = 1559
integer height = 1284
long backcolor = 67108864
string text = " Field Properties"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_2 dw_2
end type

on tabpage_2.create
this.dw_2=create dw_2
this.Control[]={this.dw_2}
end on

on tabpage_2.destroy
destroy(this.dw_2)
end on

type dw_2 from datawindow within tabpage_2
integer y = 32
integer width = 1550
integer height = 1196
integer taborder = 30
string title = "none"
string dataobject = "d_contact_custom_edit"
boolean border = false
boolean livescroll = true
end type

event itemchanged;String 	ls_lookup_field,ls_FieldName,ls_style
long		ll_Count,li_row,ll_null
Integer	li_Rtn
string ls_dddw_name,ls_dddw_data,ls_dddw_display,ls_dddw_namedesc
DataWindowChild dwchild,ldwchild

setnull(ll_null)
this.accepttext()
if dwo.name = 'sys_fields_lookup_field' then
	choose case data
		case 'Y'
			this.Modify("sys_fields_lookup_code.dddw.name = 'd_dddw_lookup_select_for_contract' sys_fields_lookup_code.dddw.datacolumn ='lookup_name' sys_fields_lookup_code.dddw.displaycolumn = 'lookup_name'")
			This.GetChild( "sys_fields_lookup_code", dwchild )
			dwchild.SetTransObject( SQLCA )
			dwchild.Retrieve( )
	
			this.Modify("sys_fields_default_value.dddw.name = 'd_dddw_code_lookup' sys_fields_default_value.dddw.datacolumn ='lookup_code' sys_fields_default_value.dddw.displaycolumn = 'code'")
			this.Modify("sys_fields_lookup_field_name.dddw.name ='d_dddw_lookup_fld_nms_code'") 
			this.SetItem(row,'sys_fields_lookup_field_name','')
			this.event ItemChanged(row,this.object.sys_fields_lookup_field_name,'')
			this.SetItem(row,'sys_fields_lookup_code','')
			this.event ItemChanged(row,this.object.sys_fields_lookup_code,'')
			
		case 'C'
			this.Modify("sys_fields_lookup_code.dddw.name = 'd_dddw_company_type' sys_fields_lookup_code.dddw.datacolumn ='company_type' sys_fields_lookup_code.dddw.displaycolumn = 'company_desc'")
			this.Modify("sys_fields_default_value.dddw.name = 'd_dddw_company_list' sys_fields_default_value.dddw.datacolumn ='facility_id' sys_fields_default_value.dddw.displaycolumn = 'facility_name'")
			
			of_set_dispalyname_dddw()
						
			this.SetItem(row,'sys_fields_lookup_code','A') 
			this.event ItemChanged(row,this.object.sys_fields_lookup_code,'A')			
			this.SetItem(row,'sys_fields_lookup_field_name','facility_name')
			this.event ItemChanged(row,this.object.sys_fields_lookup_field_name,'facility_name')
			
		case 'U'
			this.Modify("sys_fields_default_value.dddw.name = 'd_dddw_users' sys_fields_default_value.dddw.datacolumn ='user_id' sys_fields_default_value.dddw.displaycolumn = 'user_id'")
			This.GetChild( "sys_fields_default_value", dwchild )
			dwchild.SetTransObject( SQLCA )
			dwchild.Retrieve( )
			
			this.SetItem(row,'sys_fields_lookup_field_name','user_id')
			this.event ItemChanged(row,this.object.sys_fields_lookup_field_name,'User_id')
			this.SetItem(row,'sys_fields_lookup_code','')
			this.event ItemChanged(row,this.object.sys_fields_lookup_code,'')
			
		case 'E'
		
	end choose
	
end if

if dwo.name = 'fields_add_lookup' then 
	ib_have_modify = true
end if

of_modify_column_property(is_FieldName,dwo.name)

IF dwo.name = "sys_fields_lookup_field_name" OR dwo.name = "sys_fields_lookup_code" THEN
	ls_dddw_namedesc = tab_properties.tabpage_2.dw_2.getitemstring(row,"sys_fields_lookup_code")
	ls_style = tab_properties.tabpage_2.dw_2.getitemstring(row,"sys_fields_lookup_field")
	if ls_dddw_namedesc <> '' and not isnull(ls_dddw_namedesc) then
		if isvalid(w_contract_contact) then
			if is_field_flag = 'P' then //Added By Jay Chen 08-06-2015
				w_contract_contact.tab_1.tabpage_custom.dw_2.GetChild(is_FieldName, ldwchild )
			else
				w_contract_contact.tab_1.tabpage_custom_facility.dw_2.GetChild(is_FieldName, ldwchild )
			end if
			ldwchild.SetTransObject( SQLCA )
		 	ldwchild.Retrieve(ls_dddw_namedesc)
//			  choose case upper(ls_style) 
//				case 'Y'
//					li_row = ldwchild.insertrow(0)
//					ldwchild.setitem(li_row,'lookup_code',ll_null)
//					ldwchild.setitem(li_row,'description','No value selected')
//				case 'C'
//					li_row = ldwchild.insertrow(0)
//					ldwchild.setitem(li_row,'facility_id',ll_null)
//					ldwchild.setitem(li_row,'facility_name','No value selected')
//			end choose
		end if
	else
		if upper(ls_style) = 'U' then
			if is_field_flag = 'P' then //Added By Jay Chen 08-06-2015
				w_contract_contact.tab_1.tabpage_custom.dw_2.GetChild(is_FieldName, ldwchild )
			else
				w_contract_contact.tab_1.tabpage_custom_facility.dw_2.GetChild(is_FieldName, ldwchild )
			end if
			ldwchild.SetTransObject( SQLCA )
		 	ldwchild.Retrieve()
		end if
	end if
END IF

end event

event losefocus;this.accepttext()
end event

type cb_cancel from u_cb within w_contact_custom_edit
integer x = 1824
integer y = 1428
integer width = 320
integer taborder = 20
boolean bringtotop = true
string text = "&Close"
end type

event clicked;String 	ls_FieldName,ls_Visible, ls_TCol,ls_field_name[],ls_sync_screen_contact,ls_view
long		ll_Row,ll_rtn,ll_view,ll_viewlist[]
n_cst_string lnv_string

tab_properties.tabpage_2.dw_2.AcceptText()
if ib_have_modify  then
	ll_rtn = messagebox(gnv_app.iapp_object.DisplayName,'Do you want to save changes?',question!,yesnocancel!)
	if ll_rtn = 1 then
		for ll_row = 1 to tab_properties.tabpage_2.dw_2.rowcount()
			ls_FieldName = tab_properties.tabpage_2.dw_2.GetItemString(ll_Row,"sys_fields_field_name")
			ls_field_name[upperbound(ls_field_name) + 1] = ls_FieldName
			of_update_property(ls_FieldName,ll_row)
		next
	end if
end if

if isvalid(w_contract_contact) then
	w_contract_contact.of_init_custom_dddw()
end if

//Added By Jay Chen 10-26-2015 sync screen syntax(Contracted Company Contact and Our Company Contact)
if ll_rtn = 1 then
	ls_sync_screen_contact = gnv_data.of_getitem("icred_settings", "sync_screen_contact", false)
	if isnull(ls_sync_screen_contact) then ls_sync_screen_contact = '0'
	if ls_sync_screen_contact = '1' then
//		if Messagebox("Confirm Sync Contact Screen","Do you want to sync the labels and style to the Contract Folder?",Question!,YesNo!) = 1 then
			OpenWithParm( w_select_contact_view, "C" )
			ls_view = Message.StringParm
			if ls_view <> "Cancel" then
				lnv_string.of_parsetoarray(ls_view, ',', ll_viewlist)
				if upperbound(ll_viewlist) > 0 then progress_bar.visible = true
				for ll_row = 1 to upperbound(ll_viewlist)
					ll_view = ll_viewlist[ll_row]
					if isnull(ll_view) then ll_view = 0
					if ll_view = 0 then continue
					of_auto_update_contactsyntax(ll_view,6,ls_field_name)
					of_auto_update_contactsyntax(ll_view,7,ls_field_name)
					
					//Modified by Ken.Guo 2017/02/15
					//of_auto_update_contactsyntax(ll_view,1,ls_field_name) //Added By Jay Chen 11-30-2015
					If is_field_flag = 'P' Then
						of_auto_update_contactsyntax(ll_view,1,ls_field_name,'occi')  //Our Company Contact Info
						of_auto_update_contactsyntax(ll_view,1,ls_field_name,'ccci')  //Contracted Company Contact Info
					Else
						of_auto_update_contactsyntax(ll_view,1,ls_field_name)
					End If
					
					progress_bar.uf_set_position (round(ll_row / upperbound(ll_viewlist),2)  * 100) 
					yield()
				next
			end if
//		end if
	end if
end if
//end

if ll_rtn = 3 then return

Close(Parent)

end event

type cb_ok from u_cb within w_contact_custom_edit
boolean visible = false
integer x = 498
integer y = 2232
integer width = 343
integer taborder = 30
string text = "&OK"
end type

event clicked;Close( Parent )

end event

