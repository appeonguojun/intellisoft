$PBExportHeader$w_contract_field_properties.srw
forward
global type w_contract_field_properties from w_popup
end type
type dw_dddw_sort_filter from datawindow within w_contract_field_properties
end type
type mle_notes from multilineedit within w_contract_field_properties
end type
type tab_properties from tab within w_contract_field_properties
end type
type tabpage_general from userobject within tab_properties
end type
type dw_1 from u_dw within tabpage_general
end type
type tabpage_general from userobject within tab_properties
dw_1 dw_1
end type
type tabpage_edit from userobject within tab_properties
end type
type dw_3 from u_dw within tabpage_edit
end type
type tabpage_edit from userobject within tab_properties
dw_3 dw_3
end type
type tabpage_font from userobject within tab_properties
end type
type dw_4 from u_dw within tabpage_font
end type
type tabpage_font from userobject within tab_properties
dw_4 dw_4
end type
type tabpage_label from userobject within tab_properties
end type
type dw_2 from u_dw within tabpage_label
end type
type tabpage_label from userobject within tab_properties
dw_2 dw_2
end type
type tabpage_1 from userobject within tab_properties
end type
type ddlb_2 from dropdownlistbox within tabpage_1
end type
type st_4 from statictext within tabpage_1
end type
type rb_4 from radiobutton within tabpage_1
end type
type cb_1 from u_cb within tabpage_1
end type
type ddlb_1 from dropdownlistbox within tabpage_1
end type
type st_3 from statictext within tabpage_1
end type
type rb_3 from radiobutton within tabpage_1
end type
type rb_2 from radiobutton within tabpage_1
end type
type rb_1 from radiobutton within tabpage_1
end type
type gb_1 from groupbox within tabpage_1
end type
type tabpage_1 from userobject within tab_properties
ddlb_2 ddlb_2
st_4 st_4
rb_4 rb_4
cb_1 cb_1
ddlb_1 ddlb_1
st_3 st_3
rb_3 rb_3
rb_2 rb_2
rb_1 rb_1
gb_1 gb_1
end type
type tab_properties from tab within w_contract_field_properties
tabpage_general tabpage_general
tabpage_edit tabpage_edit
tabpage_font tabpage_font
tabpage_label tabpage_label
tabpage_1 tabpage_1
end type
type cb_datafill from u_cb within w_contract_field_properties
end type
type cb_cancel from u_cb within w_contract_field_properties
end type
type st_1 from statictext within w_contract_field_properties
end type
type st_2 from statictext within w_contract_field_properties
end type
type cb_ok from u_cb within w_contract_field_properties
end type
type dw_properties from u_dw within w_contract_field_properties
end type
end forward

global type w_contract_field_properties from w_popup
integer x = 1783
integer y = 32
integer width = 2039
integer height = 2268
string title = "Field Properties"
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
long backcolor = 67108864
boolean center = true
event ue_post_open pbm_custom01
event ue_bringtotop ( )
dw_dddw_sort_filter dw_dddw_sort_filter
mle_notes mle_notes
tab_properties tab_properties
cb_datafill cb_datafill
cb_cancel cb_cancel
st_1 st_1
st_2 st_2
cb_ok cb_ok
dw_properties dw_properties
end type
global w_contract_field_properties w_contract_field_properties

type variables
//modify by gavin on 2009/3/5
pfc_cst_u_contract_data_design inv_data_design
uo_contract_design_menu  inv_menu
pfc_cst_u_band_painter inv_band
datawindow  idw_properties
pfc_cst_u_band   idw_band

boolean ib_change_special_attribute = false,ib_new_field = false //Added By Jay Chen 11-17-2014
boolean ib_save_btn = false //Added By Jay Chen 11-18-2014
string is_field_name,is_field_type

datastore ids_extra_record_undo //Added By Jay Chen 02-29-2016
end variables

forward prototypes
public function integer of_setbuttonenabled (long al_row)
public function integer of_showcolor ()
public function integer of_parsecolor (ref long al_color)
public subroutine of_refresh_lookup_dddw ()
public subroutine of_set_dispalyname_dddw ()
public function integer wf_setvisibleexpress ()
public function integer of_showcolor (string as_object, string as_color)
public subroutine of_setnotes ()
public subroutine of_save_special_data ()
public subroutine of_set_dispalyname_dddw (string as_style)
public function integer of_set_auto_populate ()
public subroutine of_save_tip ()
public subroutine of_set_tip (string as_field_name)
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

public function integer of_setbuttonenabled (long al_row);string 	ls_lookup_field
string 	ls_lookup_code
String	ls_ColType
String 	ls_ColName

if al_Row <= 0 then Return -1

ls_lookup_field = Trim(dw_properties.GetItemString(al_Row, "sys_fields_lookup_field"))
ls_lookup_code = Trim(dw_properties.GetItemString(al_Row, "sys_fields_lookup_code"))
if IsNull(ls_lookup_field) then ls_lookup_field = ""
if IsNull(ls_lookup_code) then ls_lookup_code = ""

// cb_datafill
if (ls_lookup_field = "Y" or ls_lookup_field = "C") and Len(ls_lookup_code) > 0 then //Added By Ken.Guo 2015-11-26 add 'C' for Company Data Fill
	cb_datafill.Enabled = true	
else
	cb_datafill.Enabled = false	
end if

// cb_ok
/*
if ls_lookup_field = "Y" and Len(ls_lookup_code) = 0 then
	cb_ok.Enabled = false	
else
	cb_ok.Enabled = true	
end if
*/

ls_ColType = dw_properties.GetItemString(al_Row,"sys_fields_field_type")
if Upper(ls_ColType) = Upper("DateTime") or Upper(ls_ColType) = Upper("Date") then
	cb_datafill.Enabled = true	
end if

//Begin - Added By Jay 2016-07-05
ls_ColName = dw_properties.GetItemString ( al_row, 'sys_fields_field_name' )
if Upper(ls_ColName) = Upper("category") And (inv_data_design.ii_screen_id = 51 Or inv_data_design.ii_screen_id = 52 ) then
	cb_datafill.Enabled = true	
end if
//End - Added By Jay 2016-07-05

Return 1

end function

public function integer of_showcolor ();long ll_Row


dw_properties.AcceptText( )
tab_properties.tabpage_general.dw_1.AcceptText()
tab_properties.tabpage_label.dw_2.AcceptText( )
ll_Row = tab_properties.tabpage_general.dw_1.GetRow()
if ll_Row <= 0 then Return -1

tab_properties.tabpage_label.dw_2.object.t_fields_label_textcolor.background.color = tab_properties.tabpage_label.dw_2.object.fields_label_textcolor[ll_Row]
tab_properties.tabpage_label.dw_2.object.t_fields_label_textbkcolor.background.color = tab_properties.tabpage_label.dw_2.object.fields_label_textbkcolor[ll_Row]

//BEGIN---Modify by Scofield on 2009-08-27
tab_properties.tabpage_general.dw_1.object.t_fields_textcolor.background.color = tab_properties.tabpage_general.dw_1.object.fields_textcolor[ll_Row]
tab_properties.tabpage_general.dw_1.object.t_fields_textbkcolor.background.color =tab_properties.tabpage_general.dw_1.object.fields_textbkcolor[ll_Row]
//END---Modify by Scofield on 2009-08-27

//Modified by gavins 20120502
This.Title =   "Field Properties | " + dw_properties.GetItemString( dw_properties.GetRow(), "sys_fields_field_name" ) + " – " + dw_properties.GetItemString( dw_properties.GetRow(), "sys_fields_field_type" ) + " |"

Return 1

end function

public function integer of_parsecolor (ref long al_color);if IsNull(al_Color) or al_Color = 33554432 then
	al_Color = RGB(0,0,0)
elseif al_Color = 67108864 then
	al_Color = RGB(212,208,200)
end if

Return 1
end function

public subroutine of_refresh_lookup_dddw ();//====================================================================
// Function: of_Refresh_Lookup_dddw()
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:	Scofield		Date: 2009-10-12
//--------------------------------------------------------------------
//	Copyright (c) 1999-2009 ContractLogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

DataWindowChild	ldwc_Child

//dw_Properties.GetChild("sys_fields_lookup_code",ldwc_Child) -- jervis 07.20.2011
tab_properties.tabpage_edit.dw_3.GetChild("sys_fields_lookup_code",ldwc_Child)

ldwc_Child.SetTransObject(SQLCA)
ldwc_Child.Retrieve()

end subroutine

public subroutine of_set_dispalyname_dddw ();of_set_dispalyname_dddw("C") //Modified By Ken.Guo 2016-04-15

//datawindowchild dwchild
//datastore lds_temp
//long ll_i,ll_count,ll_row
//string ls_name[]
//string ls_objects
//string ls_label
//string ls_type
//n_cst_string lvn_string
//
////Reset the dddw data for sys_fields_lookup_field_name field -- jervis 04.15.2011
////User tab_properties.tabpage_edit.dw_3 replace dw_properties - jervis 07.19.2011
//tab_properties.tabpage_edit.dw_3.GetChild( "sys_fields_lookup_field_name", dwchild )
//dwchild.Reset()
//lds_temp = create datastore
//lds_temp.dataobject = 'd_dddw_company_list'
//ls_objects = lds_temp.Describe( "datawindow.objects")
//
//lvn_string.of_parsetoarray( ls_objects, "~t", ls_name)
//ll_count = UpperBound(ls_name)
//for ll_i = 1 to ll_count
//	ls_type = lds_temp.describe( ls_name[ll_i] +".type")
//	if ls_type = 'column' or ls_type = 'compute' then
//		ls_label = lds_temp.describe( ls_name[ll_i] +"_t.text")
//		if ls_label = '?' or ls_label = '!' then ls_label = ls_name[ll_i]
//		ll_row = dwchild.insertrow( 0)
//		dwchild.SetItem( ll_row,'field_name', ls_name[ll_i])
//		dwchild.SetItem( ll_row,'field_label', ls_label)
//	end if
//next
//destroy lds_temp
end subroutine

public function integer wf_setvisibleexpress ();string			ls_Visible, ls_Color, ls_DefaultExpression, ls_DataObject,ls_express,ls_protect
DataStore	lds_Default

/*******************************************************/
ls_Visible =  dw_properties.GetItemString(dw_properties.GetRow( ), "fields_visibleexpress")

tab_properties.tabpage_general.dw_1.Modify( "b_visible.enabled = true" )

If Not ( Upper(ls_Visible) = 'N' Or Upper( ls_Visible ) = 'Y' Or ls_Visible = '-1'  Or ls_Visible = '?' Or ls_Visible = '!'  or ls_Visible = '' or isnull( ls_visible ) ) Then
	tab_properties.tabpage_general.dw_1.Modify( "data_view_fields_visible.protect = 1" )
	tab_properties.tabpage_general.dw_1.Modify( "data_view_fields_visible.color = 8421504" )
	tab_properties.tabpage_general.dw_1.Modify( "b_visible.color = '16711935'" )
Else
	tab_properties.tabpage_general.dw_1.Modify( "data_view_fields_visible.protect = 0" )
	tab_properties.tabpage_general.dw_1.Modify( "data_view_fields_visible.color = 0" )
	tab_properties.tabpage_general.dw_1.Modify( "b_visible.color = '0'" )
End If

//Added By Jay Chen 09-10-2015
ls_protect =  dw_properties.GetItemString(dw_properties.GetRow( ), "fields_protectexpress")
tab_properties.tabpage_general.dw_1.Modify( "b_protect.enabled = true" )
If Not (ls_protect = '1' Or ls_protect = '0' Or ls_protect = '-1'  Or ls_protect = '?' Or ls_protect = '!'  or ls_protect = '' or isnull( ls_protect ) ) Then
	tab_properties.tabpage_general.dw_1.Modify( "fields_protect.protect = 1" )
	tab_properties.tabpage_general.dw_1.Modify( "fields_protect.color = 8421504" )
	tab_properties.tabpage_general.dw_1.Modify( "b_protect.color = '16711935'" )
Else
	tab_properties.tabpage_general.dw_1.Modify( "fields_protect.protect = 0" )
	tab_properties.tabpage_general.dw_1.Modify( "fields_protect.color = 0" )
	tab_properties.tabpage_general.dw_1.Modify( "b_protect.color = '0'" )
End If
//end

ls_Color = dw_properties.GetItemString(dw_properties.GetRow( ), "fields_backgroundcolorexpress")

If Not(trim( ls_color)= '' or isnull( ls_color ) ) Then
	tab_properties.tabpage_general.dw_1.Modify( "b_background_colorexpress.color = '16711935'" )	
Else
	tab_properties.tabpage_general.dw_1.Modify( "b_background_colorexpress.color = '0'" )	
End If
ls_Color = dw_properties.GetItemString(dw_properties.GetRow( ), "fields_fontcolorexpress")

If Not(trim( ls_color)= '' or isnull( ls_color ) ) Then
	tab_properties.tabpage_general.dw_1.Modify( "b_font_colorexpress.color = '16711935'" )	
Else
	tab_properties.tabpage_general.dw_1.Modify( "b_font_colorexpress.color = '0'" )	
End If

ls_Color = dw_properties.GetItemString(dw_properties.GetRow( ), "label_backgroundcolorexpress")

If Not(trim( ls_color)= '' or isnull( ls_color ) ) Then
	tab_properties.tabpage_label.dw_2.Modify( "b_background_colorexpress.color = '16711935'" )	
Else
	tab_properties.tabpage_label.dw_2.Modify( "b_background_colorexpress.color = '0'" )	
End If
ls_Color = dw_properties.GetItemString(dw_properties.GetRow( ), "label_fontcolorexpress")

If Not(trim( ls_color)= '' or isnull( ls_color ) ) Then
	tab_properties.tabpage_label.dw_2.Modify( "b_font_colorexpress.color = '16711935'" )	
Else
	tab_properties.tabpage_label.dw_2.Modify( "b_font_colorexpress.color = '0'" )	
End If

//Added By Jay Chen 12-09-2013
ls_express = dw_properties.GetItemString(dw_properties.GetRow( ), "fields_xexpress")
If Not(trim( ls_express)= '' or isnull( ls_express ) ) Then
	tab_properties.tabpage_general.dw_1.Modify( "b_fields_x.color = '16711935'" )	
Else
	tab_properties.tabpage_general.dw_1.Modify( "b_fields_x.color = '0'" )	
End If
ls_express = dw_properties.GetItemString(dw_properties.GetRow( ), "fields_yexpress")
If Not(trim( ls_express)= '' or isnull( ls_express ) ) Then
	tab_properties.tabpage_general.dw_1.Modify( "b_fields_y.color = '16711935'" )	
Else
	tab_properties.tabpage_general.dw_1.Modify( "b_fields_y.color = '0'" )	
End If
ls_express = dw_properties.GetItemString(dw_properties.GetRow( ), "fields_widthexpress")
If Not(trim( ls_express)= '' or isnull( ls_express ) ) Then
	tab_properties.tabpage_general.dw_1.Modify( "b_fields_width.color = '16711935'" )	
Else
	tab_properties.tabpage_general.dw_1.Modify( "b_fields_width.color = '0'" )	
End If
ls_express = dw_properties.GetItemString(dw_properties.GetRow( ), "fields_heightexpress")
If Not(trim( ls_express)= '' or isnull( ls_express ) ) Then
	tab_properties.tabpage_general.dw_1.Modify( "b_fields_height.color = '16711935'" )	
Else
	tab_properties.tabpage_general.dw_1.Modify( "b_fields_height.color = '0'" )	
End If
//end add
lds_Default = Create DataStore
ls_DataObject = inv_data_design.of_get_screendataobject( )
If Len( ls_DataObject ) > 0 Then
	lds_Default.dataObject = ls_DataObject
	ls_DefaultExpression = lds_Default.Describe(    dw_properties.GetItemString(dw_properties.GetRow( ), "sys_fields_field_name")    + ".visible")
	If  Pos( ls_DefaultExpression , '~t' ) > 0 Then
		tab_properties.tabpage_general.dw_1.Modify( "data_view_fields_visible.protect = 1" )
		tab_properties.tabpage_general.dw_1.Modify( "data_view_fields_visible.color = 8421504" )
		tab_properties.tabpage_general.dw_1.Modify( "b_visible.enabled = false" )
	End If
	//added by gavins 20130528
	ls_DefaultExpression = lds_Default.Describe(    dw_properties.GetItemString(dw_properties.GetRow( ), "sys_fields_field_name")    + ".protect")
	If  Pos( ls_DefaultExpression , '~t' ) > 0 Then
		tab_properties.tabpage_general.dw_1.Modify( "fields_protect.protect = 1" )
		tab_properties.tabpage_general.dw_1.Modify( "fields_protect.color = 8421504" )
		tab_properties.tabpage_general.dw_1.Modify( "b_protect.enabled = false" ) //Added By Jay Chen 09-10-2015
//	Else
//		tab_properties.tabpage_general.dw_1.Modify( "fields_protect.protect = 0" )
//		tab_properties.tabpage_general.dw_1.Modify( "fields_protect.color = 0" )
	End If
	
End If
If Isvalid( lds_Default ) Then destroy( lds_Default )//added by gavins 20140714
/*******************************************************/

//Added By Ken.Guo 09/17/2014
of_setnotes()

Return 1
end function

public function integer of_showcolor (string as_object, string as_color);

choose case as_object
	case 'fields_label_textcolor' 
			tab_properties.tabpage_label.dw_2.object.t_fields_label_textcolor.background.color =as_color
	case 'fields_label_textbkcolor'
			tab_properties.tabpage_label.dw_2.object.t_fields_label_textbkcolor.background.color =as_color
	case 'fields_textcolor'
		    tab_properties.tabpage_general.dw_1.object.t_fields_textcolor.background.color = as_color
	case 'fields_textbkcolor'
		tab_properties.tabpage_general.dw_1.object.t_fields_textbkcolor.background.color =as_color
end choose


Return 1

end function

public subroutine of_setnotes ();//====================================================================
// Function: of_setnotes
//--------------------------------------------------------------------
// Description: Add notes function for fee_sched_calc_field_* fields.
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:         Ken.Guo           Date: 09/17/2014
//--------------------------------------------------------------------
//Copyright (c) 2008-2013 Contract Logix, Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


String ls_notes, ls_fieldname
Long ll_screen_id

If idw_properties.Getrow() = 0 Then Return

ll_screen_id = idw_properties.GetitemNumber(idw_properties.getrow(), 'data_view_fields_screen_id')
ls_fieldname = idw_properties.GetitemString(idw_properties.getrow(), 'sys_fields_field_name')

If (ll_screen_id = 2 or ll_screen_id = 3 or ll_screen_id = 4 or ll_screen_id = 5 or ll_screen_id = 8 or ll_screen_id = 9 ) Then
	Choose Case ls_fieldname
		Case 'fee_sched_calc_field_1'
			ls_notes = "Note: This column will be filled automatically with the value in column 'calc_field_1' from the Fee Schedule (NM) screen."
		Case 'fee_sched_calc_field_2'
			ls_notes = "Note: This column will be filled automatically with the value in column 'calc_field_2' from the Fee Schedule (NM) screen."
		Case 'fee_sched_calc_field_3'
			ls_notes = "Note: This column will be filled automatically with the value in column 'calc_field_3' from the Fee Schedule (NM) screen."
	End Choose
End If

mle_notes.text =  ls_notes
end subroutine

public subroutine of_save_special_data ();//====================================================================
// Function: of_save_special_data
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:	Jay Chen		Date: 11-17-2014
//--------------------------------------------------------------------
//	Copyright (c) 2008-2014 ContractLogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

string ls_type,ls_format,ls_object_name
long ll_cnt,ll_view,ll_screen
boolean lb_SuccessFlag = false
string ls_name

if dw_properties.GetRow() < 1 then return
ls_object_name = dw_properties.GetItemString(dw_properties.GetRow(), "sys_fields_field_name" )

ll_screen = inv_data_design.ii_Screen_id
ll_view = inv_data_design.il_data_view_id

if tab_properties.tabpage_1.rb_1.checked then
	ls_type = 'auto_number_p'
elseif tab_properties.tabpage_1.rb_4.checked then
	ls_type = 'auto_number_c'
elseif tab_properties.tabpage_1.rb_2.checked then
	ls_type = 'sum_source_field'
elseif tab_properties.tabpage_1.rb_3.checked then
	ls_type = 'sum_store_field'
end if

if ls_type = 'auto_number_p' then 
	ls_format = tab_properties.tabpage_1.ddlb_1.text
	if isnull(ls_format) or ls_format = '' then
		ls_format = '###'
	end if
end if

if ls_type = 'auto_number_c' then 
	ls_format = tab_properties.tabpage_1.ddlb_2.text
	if isnull(ls_format) or ls_format = '' then
		ls_format = '###'
	end if
end if

if isnull(ls_type) or ls_type = '' then
	MessageBox('Contractlogix','Please choose special attribute type!')
	return
end if

if ib_new_field then
	select object_name into :ls_name from screen_field_special_attribute where view_id = :ll_view and screen_id = :ll_screen and object_type = :ls_type;
	if isnull(ls_name) then ls_name = ''
	if trim(ls_name) <> '' then
		if MessageBox('Update Special Attribute','You have already setted (' + ls_name + ') as the property value. Are you sure you want to replace the property value? ',Question!,YesNo!,2) <> 1 then return
		delete from screen_field_special_attribute where view_id = :ll_view and screen_id = :ll_screen and object_type = :ls_type;
	end if
	insert into screen_field_special_attribute(view_id,screen_id,object_type,object_name,object_format)
	values(:ll_view,:ll_screen,:ls_type,:ls_object_name,:ls_format);
	if sqlca.sqlcode = 0 then lb_SuccessFlag = true
else
	select count(1) into :ll_cnt from screen_field_special_attribute where view_id = :ll_view and screen_id = :ll_screen and object_type = :ls_type and object_name <> :ls_object_name;
	if isnull(ll_cnt) then ll_cnt = 0
	if ll_cnt > 0 then
		delete from screen_field_special_attribute where view_id = :ll_view and screen_id = :ll_screen and object_type = :ls_type;
	end if
	update screen_field_special_attribute
	set object_name = :ls_object_name,object_format = :ls_format,object_type = :ls_type
	where view_id = :ll_view and screen_id = :ll_screen and object_name = :ls_object_name;
	if sqlca.sqlcode = 0 then lb_SuccessFlag = true
end if

if lb_SuccessFlag then
	MessageBox('Contractlogix','Save special attribute information successful!')
end if
end subroutine

public subroutine of_set_dispalyname_dddw (string as_style);datawindowchild dwchild
datastore lds_temp
long ll_i,ll_count,ll_row
string ls_name[]
string ls_objects
string ls_label
string ls_type
n_cst_string lvn_string
		
Choose Case as_style
	Case  'C'
		//Reset the dddw data for sys_fields_lookup_field_name field -- jervis 04.15.2011
		//User tab_properties.tabpage_edit.dw_3 replace dw_properties - jervis 07.19.2011
		tab_properties.tabpage_edit.dw_3.GetChild( "sys_fields_lookup_field_name", dwchild )
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
		
	Case 'Y' //Added By Ken.Guo 2016-04-15
		tab_properties.tabpage_edit.dw_3.GetChild( "sys_fields_lookup_field_name", dwchild )
		dwchild.Reset()
		lds_temp = create datastore
		lds_temp.dataobject = 'd_dddw_lookup_fld_nms_code'  
		ll_count = lds_temp.rowcount()
		lds_temp.rowscopy(1, ll_count, primary!,dwchild, 1, primary!)
		destroy lds_temp		

End Choose


end subroutine

public function integer of_set_auto_populate ();//====================================================================
// Function: of_set_auto_populate
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:         Ken.Guo 2016-08-18
//--------------------------------------------------------------------
//Copyright (c) 2008-2016 Contract Logix, Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

Long ll_screenid
ll_ScreenId = inv_data_design.ii_screen_id 
If inv_data_design.is_open_style = 'report' or&
	(ll_ScreenID = 1 and dw_properties.GetItemString(1,'sys_fields_field_name') = 'facility_name' ) Then
	This.tab_properties.tabpage_edit.dw_3.Modify("field_use_compute.visible='0' field_compute_expression.visible='0' b_compute_expression.visible='0'")
Else
	This.tab_properties.tabpage_edit.dw_3.Modify("field_use_compute.visible='1' field_compute_expression.visible='1' b_compute_expression.visible='1'")	
End If

return 1
end function

public subroutine of_save_tip ();string ls_tip, ls_field_name
long ll_find,ll_insert
tab_properties.tabpage_edit.dw_3.AcceptText()
ls_field_name = dw_properties.GetItemString( dw_properties.GetRow(), "sys_fields_field_name" )

ls_tip = tab_properties.tabpage_edit.dw_3.getitemstring(1,"field_tip")
//if len(ls_tip) > 0 then inv_data_design.is_field_tip_new = ls_tip
inv_data_design.is_field_tip_new = ls_tip
if inv_data_design.is_field_tip_new <> inv_data_design.is_field_tip_old then
	//Added By Harry 2016-11-08
	ll_find = inv_data_design.ids_field_tip.find("field_name = '"+ls_field_name+"'",1,inv_data_design.ids_field_tip.rowcount())
	if isnull(ll_find) then ll_find = 0
	if ll_find = 0 then
		ll_insert = inv_data_design.ids_field_tip.insertrow(0)
		inv_data_design.ids_field_tip.setitem(ll_insert,"field_name",ls_field_name)
		inv_data_design.ids_field_tip.setitem(ll_insert,"field_value",inv_data_design.is_field_tip_new)
		inv_data_design.ids_field_tip.setitem(ll_insert,"data_view_id",inv_data_design.il_data_view)
		inv_data_design.ids_field_tip.setitem(ll_insert,"screen_id",inv_data_design.ii_screen_id)
	else
		inv_data_design.ids_field_tip.setitem(ll_find,"field_value",inv_data_design.is_field_tip_new)
	end if
	//end 
	if IsValid(m_pfe_cst_contract_data_design) then
		gnv_app.of_modify_menu_attr( m_pfe_cst_contract_data_design.m_file.m_save,'Enabled', true)
		inv_data_design.ib_field_tip = true  //Added By Harry 2016-11-08
	end if 
end if
end subroutine

public subroutine of_set_tip (string as_field_name);Long ll_find
String ls_tip
ll_find = inv_data_design.ids_field_tip.find("field_name = '"+as_field_name+"'",1,inv_data_design.ids_field_tip.rowcount())
if ll_find > 0 then
	ls_tip = inv_data_design.ids_field_tip.getitemstring(ll_find, 'field_value')
else
	select field_tip into :ls_tip from ctx_screen_field_tips where view_id = :inv_data_design.il_data_view_id and screen_id = :inv_data_design.ii_screen_id and field_name = :as_field_name; 
end if
tab_properties.tabpage_edit.dw_3.setitem(1, "field_tip", ls_tip)
inv_data_design.is_field_tip_old = ls_tip 
end subroutine

on w_contract_field_properties.create
int iCurrent
call super::create
this.dw_dddw_sort_filter=create dw_dddw_sort_filter
this.mle_notes=create mle_notes
this.tab_properties=create tab_properties
this.cb_datafill=create cb_datafill
this.cb_cancel=create cb_cancel
this.st_1=create st_1
this.st_2=create st_2
this.cb_ok=create cb_ok
this.dw_properties=create dw_properties
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_dddw_sort_filter
this.Control[iCurrent+2]=this.mle_notes
this.Control[iCurrent+3]=this.tab_properties
this.Control[iCurrent+4]=this.cb_datafill
this.Control[iCurrent+5]=this.cb_cancel
this.Control[iCurrent+6]=this.st_1
this.Control[iCurrent+7]=this.st_2
this.Control[iCurrent+8]=this.cb_ok
this.Control[iCurrent+9]=this.dw_properties
end on

on w_contract_field_properties.destroy
call super::destroy
destroy(this.dw_dddw_sort_filter)
destroy(this.mle_notes)
destroy(this.tab_properties)
destroy(this.cb_datafill)
destroy(this.cb_cancel)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.cb_ok)
destroy(this.dw_properties)
end on

event open;call super::open;DatawindowChild dwchild,dwchild2
//start  Modified by gavin on 2009-03-05
str_set_properties lstr_item
string ls_coltype,ls_modify
string ls_style, ls_Visible
long ll_row

lstr_item = message.PowerObjectParm
inv_data_design = lstr_item.lst_data_design
inv_band = lstr_item.lst_band_painter
idw_properties = lstr_item.dw_item
idw_band = lstr_item.lst_band

//BEGIN---Modify by Scofield on 2009-05-15
if inv_data_design.is_open_style = 'report' then
	dw_properties.DataObject = "d_custom_report_field_properties"
	tab_properties.tabpage_general.dw_1.dataobject = 'd_report_field_properties_general'
	tab_properties.tabpage_label.dw_2.dataobject = 'd_report_field_properties_label'
	cb_datafill.Visible = false
	
	//dw_properties.Height = 1248
	//cb_cancel.Y   = dw_properties.Y + dw_properties.Height + 32
	//This.Height   = cb_cancel.Y + cb_cancel.Height + 130
	tab_properties.tabpage_edit.visible = false
else
	dw_properties.DataObject = "d_contract_field_properties"
	cb_datafill.Visible = true
end if

gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-04-11


IF gb_se_version THEN
	dw_properties.Height = 708
	cb_ok.y = 920
	cb_cancel.y = 920
	This.Height = 1150
end if

gf_WinCenter(This)
//END---Modify by Scofield on 2009-05-15

//w_contract_data_design.uo_design.dw_properties.ShareData(dw_properties)
idw_properties.ShareData(dw_properties)
//end  Modified by gavin on 2009-03-05

//Share Data - jervis 07.19.2011
//if inv_data_design.is_open_style <> 'report' then
	idw_properties.ShareData(tab_properties.tabpage_general.dw_1 )
	idw_properties.ShareData(tab_properties.tabpage_label.dw_2 )
	idw_properties.ShareData(tab_properties.tabpage_edit.dw_3 )
	idw_properties.ShareData(tab_properties.tabpage_font.dw_4 ) //jervis 09.01.2011
//end if
/*******************************************************/
This.wf_setvisibleexpress( )
/*******************************************************/
//Retrieve dddw value -- jervis 12.7.2009
ls_style = dw_properties.GetItemString(dw_properties.GetRow(), "sys_fields_lookup_field" )
ls_coltype = dw_properties.GetItemString(dw_properties.GetRow(), "sys_fields_field_type" )
ls_coltype = Left(ls_coltype,5)
if ls_coltype = "char(" or ls_coltype = "char" or ls_coltype = "decim" or ls_coltype = "numbe" or ls_coltype = "doubl" or ls_coltype = "real" or ls_coltype =  "long" or ls_coltype =  "int" or ls_coltype =  "ulong" then
	ls_modify = "sys_fields_lookup_field.values = 'Code Lookup	Y/Company	C/User	U/Edit	E/EditMask	M/CheckBox	B/'" //None	N/  modified by gavins20120608
	tab_properties.tabpage_edit.dw_3.Modify(ls_modify)
end if
		
choose case ls_style
	case 'Y'	//
		tab_properties.tabpage_edit.dw_3.Modify("sys_fields_lookup_code.dddw.name = 'd_dddw_lookup_select_for_contract' sys_fields_lookup_code.dddw.datacolumn ='lookup_name' sys_fields_lookup_code.dddw.displaycolumn = 'lookup_name'")
		tab_properties.tabpage_edit.dw_3.Modify("sys_fields_default_value.dddw.name = 'd_dddw_code_lookup' sys_fields_default_value.dddw.datacolumn ='lookup_code' sys_fields_default_value.dddw.displaycolumn = 'code'")
		if tab_properties.tabpage_edit.dw_3.GetChild( "sys_fields_lookup_code", dwchild ) = 1 then
			dwchild.SetTransObject( SQLCA )
			dwchild.Retrieve()
		end if
	case 'C'
		tab_properties.tabpage_edit.dw_3.Modify("sys_fields_lookup_code.dddw.name = 'd_dddw_company_type' sys_fields_lookup_code.dddw.datacolumn ='company_type' sys_fields_lookup_code.dddw.displaycolumn = 'company_desc'")
		//change d_dddw_company to d_dddw_company_list - jervis 04.15.2011
		tab_properties.tabpage_edit.dw_3.Modify("sys_fields_default_value.dddw.name = 'd_dddw_company_list' sys_fields_default_value.dddw.datacolumn ='facility_id' sys_fields_default_value.dddw.displaycolumn = 'facility_name'")
		of_set_dispalyname_dddw()

	case 'U'
		//dw_properties.Modify("sys_fields_default_value.dddw.name = 'd_dddw_company' sys_fields_default_value.dddw.datacolumn ='facility_id' sys_fields_default_value.dddw.displaycolumn = 'facility_name'")
		tab_properties.tabpage_edit.dw_3.Modify("sys_fields_default_value.dddw.name = 'd_dddw_users' sys_fields_default_value.dddw.datacolumn ='user_id' sys_fields_default_value.dddw.displaycolumn = 'user_id'") //jervis 04.15.2011
		//Added By Jay Chen 09-02-2014 remark:add user name in diaplay dropdown list
		tab_properties.tabpage_edit.dw_3.GetChild( "sys_fields_lookup_field_name", dwchild2 )
		dwchild2.Reset()
		ll_row = dwchild2.insertrow( 0)
		dwchild2.SetItem( ll_row,'field_name', 'user_id')
		dwchild2.SetItem( ll_row,'field_label', 'user_id')
		ll_row = dwchild2.insertrow( 0)
		dwchild2.SetItem( ll_row,'field_name', 'user_name')
		dwchild2.SetItem( ll_row,'field_label', 'user_name')
		tab_properties.tabpage_edit.dw_3.SetItem(tab_properties.tabpage_edit.dw_3.getrow(),'sys_fields_lookup_code','User')
		//end
	case 'N','E'
	case 'M'  //EditMask - jervis 07.18.2011
	case 'B'  //check box-- jervis 07.18.2011

end choose
if tab_properties.tabpage_edit.dw_3.GetChild( "sys_fields_default_value", dwchild ) = 1 then
	dwchild.SetTransObject( SQLCA )
	dwchild.Retrieve( dw_properties.GetItemString( dw_properties.GetRow(), "sys_fields_lookup_code" ))
end if


//<add> 09/25/2007 by: Andy
//Reason: if edit.style <> 'edit' then data_view_fields_display_only.protect='1'
String ls_edit_style,ls_column_name
ls_column_name = dw_properties.getitemstring(dw_properties.GetRow(), "sys_fields_field_name")

//Modified by gavin on 2009-03-05
//ls_edit_style = Lower(w_contract_data_design.uo_design.uo_band.dw_syntax.Describe(ls_column_name+".Edit.Style"))
ls_edit_style = Lower(inv_band.dw_syntax.Describe(ls_column_name+".Edit.Style"))

//Comment by jervis 07.20.2011  //modified by gavins 20120523
if ls_edit_style <> 'edit' THEN 
	tab_properties.tabpage_general.dw_1.Modify("data_view_fields_display_only.protect='1' data_view_fields_display_only.Background.Mode='2' data_view_fields_display_only.Color='" + string(rgb(128,128,128)) + "'")
end if


//--------------------------- APPEON BEGIN ---------------------------
//$<  Add > 2007-10-25 By: Scofield
//$<Reason> Control the button datafill if enabled

String	ls_LookupField

ls_LookupField = dw_properties.GetItemString(dw_properties.GetRow(), "sys_fields_lookup_field")

//modify by gavin on 2009/3/5
if inv_data_design.is_open_style = 'report' then
	dw_properties.object.disable_fields_lookup[dw_properties.GetRow()] = 1
end if

if ls_LookupField = 'Y' then
	cb_datafill.Enabled = true
else
	cb_datafill.Enabled = false
end if

//---------------------------- APPEON END ----------------------------

//Added By Jay Chen 11-17-2014
string ls_field_type,ls_field_name,ls_object_type,ls_object_format,ls_enable_special_attribute
boolean lb_special_visible
ls_enable_special_attribute = gnv_data.of_getitem("icred_settings","enable_special_attribute",false)
if isnull(ls_enable_special_attribute) or ls_enable_special_attribute = '' then ls_enable_special_attribute = '0'
ls_field_name = dw_properties.GetItemString( dw_properties.GetRow(), "sys_fields_field_name" ) //Modified By Jay Chen 02-14-2016
if ls_enable_special_attribute = '1' then
//	ls_field_name = dw_properties.GetItemString( dw_properties.GetRow(), "sys_fields_field_name" )
	ls_field_type = left(lower(dw_properties.GetItemString( dw_properties.GetRow(), "sys_fields_field_type" )),3)
	if ls_field_type = 'cha' or ls_field_type = 'var' or ls_field_type = 'int' or ls_field_type = 'lon' or ls_field_type = 'dec' or &
	    ls_field_type = 'num' or ls_field_type = 'dou' or ls_field_type = 'rea' or ls_field_type = 'ulo' or ls_field_type = 'mon' then
		lb_special_visible = true
	else
		lb_special_visible = false
	end if
	if (inv_data_design.ii_screen_id = 3 or inv_data_design.ii_screen_id = 9) and  lb_special_visible then
		tab_properties.tabpage_1.visible = true
		ib_save_btn = true
		if ls_field_type<> 'cha' and ls_field_type <> 'var' then 
			tab_properties.tabpage_1.ddlb_1.deleteitem(2)
			tab_properties.tabpage_1.ddlb_2.deleteitem(2)
			if inv_data_design.ii_screen_id = 9 then
				tab_properties.tabpage_1.rb_2.enabled = true
				tab_properties.tabpage_1.rb_3.enabled = true
			else
				tab_properties.tabpage_1.rb_2.enabled = false
				tab_properties.tabpage_1.rb_3.enabled = false
			end if
		else
			tab_properties.tabpage_1.rb_2.enabled = false
			tab_properties.tabpage_1.rb_3.enabled = false
		end if
		select object_type,object_format into :ls_object_type,:ls_object_format from screen_field_special_attribute
		where view_id = :inv_data_design.il_data_view_id and screen_id = :inv_data_design.ii_screen_id and object_name = :ls_field_name;
		if isnull(ls_object_type) then ls_object_type = '' 
		if isnull(ls_object_format) then ls_object_format = '' 
		if ls_object_type = 'auto_number_p' then
			tab_properties.tabpage_1.rb_1.checked = true
		elseif ls_object_type = 'auto_number_c' then
			tab_properties.tabpage_1.rb_4.checked = true
		elseif ls_object_type = 'sum_source_field' then
			tab_properties.tabpage_1.rb_2.checked = true
		elseif ls_object_type = 'sum_store_field' then
			tab_properties.tabpage_1.rb_3.checked = true
		end if
		if ls_object_type = '' then
			ib_new_field = true
		else
			ib_new_field = false
		end if
		if ls_object_format <> '' then 
			if ls_object_type = 'auto_number_p' then
				tab_properties.tabpage_1.ddlb_1.text = ls_object_format
			else
				tab_properties.tabpage_1.ddlb_2.text = ls_object_format
			end if
		end if
	else
		tab_properties.tabpage_1.visible = false
		ib_save_btn = false
	end if
else
	tab_properties.tabpage_1.visible = false
	ib_save_btn = false
end if
//end add

//Added By Jay Chen 07-20-2015
string ls_tip
//Modified by Harry 11-08-2016
/*
ls_tip = tab_properties.tabpage_edit.dw_3.getitemstring(1,"field_tip")
select field_tip into :ls_tip from ctx_screen_field_tips where view_id = :inv_data_design.il_data_view_id and screen_id = :inv_data_design.ii_screen_id and field_name = :ls_field_name; 
tab_properties.tabpage_edit.dw_3.setitem(1, "field_tip", ls_tip)
if len(ls_tip) > 0 then inv_data_design.is_field_tip_old = ls_tip 
*/
//Long ll_find
//ll_find = inv_data_design.ids_field_tip.find("field_name = '"+ls_field_name+"'",1,inv_data_design.ids_field_tip.rowcount())
//if ll_find > 0 then
//	ls_tip = inv_data_design.ids_field_tip.getitemstring(ll_find, 'field_value')
//else
//	select field_tip into :ls_tip from ctx_screen_field_tips where view_id = :inv_data_design.il_data_view_id and screen_id = :inv_data_design.ii_screen_id and field_name = :ls_field_name; 
//end if
//tab_properties.tabpage_edit.dw_3.setitem(1, "field_tip", ls_tip)
//inv_data_design.is_field_tip_old = ls_tip 
of_set_tip(ls_field_name)
//end

//Added By Jay Chen 12-22-2015
string ls_multi_select
ls_field_type = lower(dw_properties.GetItemString( dw_properties.GetRow(), "sys_fields_field_type" ))
is_field_name = ls_field_name
is_field_type = ls_field_type
if (inv_data_design.ii_screen_id = 9 or inv_data_design.ii_screen_id = 10) and left(ls_field_name,7) = 'custom_' and left(ls_field_type,4) = 'char' then
	//Modified By Ken.Guo 2017-05-25
	/*
	select object_format into :ls_multi_select from screen_field_select_item_attribute where view_id = :inv_data_design.il_data_view_id and screen_id = :inv_data_design.ii_screen_id and object_name = :ls_field_name and object_type = 'multi-select'; 
	if isnull(ls_multi_select) then ls_multi_select = ''
	if ls_multi_select = '' then ls_multi_select = 'N'
	tab_properties.tabpage_edit.dw_3.setitem(1, "fields_multi_select", ls_multi_select)
	inv_data_design.is_multi_select_old = ls_multi_select
	*/
		long ll_find
		if isvalid(inv_data_design.ids_select_item_attribute) then 
			//Get value from local cache first
			ll_find = inv_data_design.ids_select_item_attribute.find("field_name = '"+ls_field_name+"'",1,inv_data_design.ids_select_item_attribute.rowcount())
			if isnull(ll_find) then ll_find = 0
			if ll_find > 0 then
				ls_multi_select = inv_data_design.ids_select_item_attribute.getitemstring(ll_find, 'field_value')
			Else
				//Get value from global cache.
				ls_multi_select = gnv_data.of_getitem( 'multi_select_fields', 'object_format', 'view_id = ' + String(inv_data_design.il_data_view_id ) + ' and screen_id = ' + String(inv_data_design.ii_screen_id) + ' and object_name = "' +ls_field_name+ '"' + ' and object_type = "multi-select"' )
			End If
		Else
			//Get value from global cache.
			ls_multi_select = gnv_data.of_getitem( 'multi_select_fields', 'object_format', 'view_id = ' + String(inv_data_design.il_data_view_id ) + ' and screen_id = ' + String(inv_data_design.ii_screen_id) + ' and object_name = "' +ls_field_name+ '"' + ' and object_type = "multi-select"' )
		End If

		If isnull(ls_multi_select) or ls_multi_select = '' Then ls_multi_select = 'N'
		tab_properties.tabpage_edit.dw_3.setitem(1, "fields_multi_select", ls_multi_select)
		inv_data_design.is_multi_select_old = ls_multi_select			
end if


//Added By Jay Chen 02-29-2016
ids_extra_record_undo = create datastore
ids_extra_record_undo.dataobject = 'dw_record_field_style_list'

of_SetButtonEnabled(dw_properties.GetRow()) //Add by Evan 01.30.2008


end event

event pfc_postopen;call super::pfc_postopen;of_ShowColor() //Add by Evan 07/24/2008

of_set_auto_populate() //Added By Ken.Guo 2016-08-18
end event

event key;call super::key;if Key = KeyEscape! then Close(This)

end event

type dw_dddw_sort_filter from datawindow within w_contract_field_properties
boolean visible = false
integer x = 123
integer y = 2420
integer width = 686
integer height = 400
integer taborder = 50
string title = "none"
boolean border = false
boolean livescroll = true
end type

type mle_notes from multilineedit within w_contract_field_properties
integer x = 32
integer y = 2028
integer width = 1102
integer height = 192
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 134217856
long backcolor = 67108864
boolean border = false
boolean displayonly = true
end type

type tab_properties from tab within w_contract_field_properties
integer x = 23
integer y = 12
integer width = 1952
integer height = 2000
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
integer selectedtab = 1
tabpage_general tabpage_general
tabpage_edit tabpage_edit
tabpage_font tabpage_font
tabpage_label tabpage_label
tabpage_1 tabpage_1
end type

on tab_properties.create
this.tabpage_general=create tabpage_general
this.tabpage_edit=create tabpage_edit
this.tabpage_font=create tabpage_font
this.tabpage_label=create tabpage_label
this.tabpage_1=create tabpage_1
this.Control[]={this.tabpage_general,&
this.tabpage_edit,&
this.tabpage_font,&
this.tabpage_label,&
this.tabpage_1}
end on

on tab_properties.destroy
destroy(this.tabpage_general)
destroy(this.tabpage_edit)
destroy(this.tabpage_font)
destroy(this.tabpage_label)
destroy(this.tabpage_1)
end on

event selectionchanged;//Added By Jay Chen 11-18-2014
if newindex = 5 then
	if ib_save_btn then
		tab_properties.tabpage_1.cb_1.visible = true
	else
		tab_properties.tabpage_1.cb_1.visible = false
	end if
else
	tab_properties.tabpage_1.cb_1.visible = false
end if
end event

type tabpage_general from userobject within tab_properties
integer x = 18
integer y = 100
integer width = 1915
integer height = 1884
long backcolor = 67108864
string text = "  Field Display  "
long tabtextcolor = 33554432
long tabbackcolor = 1073741824
long picturemaskcolor = 553648127
dw_1 dw_1
end type

on tabpage_general.create
this.dw_1=create dw_1
this.Control[]={this.dw_1}
end on

on tabpage_general.destroy
destroy(this.dw_1)
end on

type dw_1 from u_dw within tabpage_general
integer x = 27
integer y = 28
integer width = 1829
integer height = 1688
integer taborder = 10
string dataobject = "d_contract_field_properties_general"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
borderstyle borderstyle = stylebox!
end type

event constructor;call super::constructor;This.of_SetUpdateable(False)


String ls_fonts[]
datawindowchild ldwc_fonts
int i,j
n_cst_appeondll lnv_appeon_dll


if this.getchild("font_face",ldwc_fonts) = 1 then
	lnv_appeon_dll.of_getfonts(ls_fonts)
	
	For i = 1 To UpperBound(ls_fonts[])
		If Trim(ls_fonts[i]) = '' Then Continue
		If i > 1 Then
			If ls_fonts[i - 1] = ls_fonts[i] Then Continue
		End If
		j = ldwc_fonts.InsertRow(0)
		ldwc_fonts.SetItem(j,1,ls_fonts[i])
	Next
	
	If ldwc_fonts.RowCount() = 0 Then
		ldwc_fonts.InsertRow(1)
		ldwc_fonts.SetItem(1,1,'MS Sans Serif')
	End If
	
	ldwc_fonts.SetSort('fonts_face A')
	ldwc_fonts.Sort()
	this.InsertRow(0)
end if
end event

event itemchanged;call super::itemchanged;String 	ls_lookup_field,ls_FieldName
long		ll_ViewId,ll_ScreenId,ll_Count,ll_RtnVal
Integer	li_Rtn
DataWindowChild dwchild

//BEGIN---Add by Evan 07/24/2008
choose case dwo.name 
	case "fields_label_textcolor", "fields_label_textbkcolor", "fields_textcolor", "fields_textbkcolor"
		of_ShowColor()
end choose
//END---Add by Evan 07/24/2008

//BEGIN---Modify by Scofield on 2010-02-02
if Lower(dwo.Name) = Lower("Fields_AutoHeight") then
	if Lower(Data) = Lower("Yes") then
		ll_RtnVal = MessageBox(gnv_app.iapp_object.DisplayName,"Turning On auto height will adjust the height of the field dynamically during runtime but can slow down the retrieval of data during runtime. Continue?",Question!,YesNo!,2)
		if ll_RtnVal <> 1 then
			This.Post SetItem(This.GetRow(),"Fields_AutoHeight",Lower("No"))
			Return
		end if
	end if
end if
//END---Modify by Scofield on 2010-02-02

//--------------------------- APPEON BEGIN ---------------------------
//$<  Add > 2007-10-25 By: Scofield
//$<Reason> Clear the Data Fill if lookup field is not selected

if dwo.name = 'sys_fields_lookup_field' then
	if data <> 'Y' then //if data = 'N' then -- jervis 12.4.2009
		ll_ViewId = inv_data_design.il_data_view                      //Modified by gavin on 2009-03-05
		ll_ScreenId = inv_data_design.ii_screen_id   					  //Modified by gavin on 2009-03-05
		ls_FieldName = dw_properties.GetItemString(1,'sys_fields_field_name')
		
		Select Count(*)
		  into :ll_Count
		  from ctx_screen_datafill
		 where data_view_id = :ll_ViewId and screen_id = :ll_ScreenId  and field_name = :ls_FieldName ;
		
		if ll_Count > 0 then
			li_Rtn = MessageBox(gnv_app.iapp_object.DisplayName,'If this property is set to "No", all data you defined for the current field in the ~r~nData Fill Properties dialog will be removed. ~r~n~r~nDo you want to continue?',Question!,YesNo!,2)
			if li_Rtn = 2 then
				dw_properties.Post SetItem(1,'sys_fields_lookup_field','Y')
				Post of_SetButtonEnabled(1) //Add by Evan 01.30.2008
				return
			else
				delete from ctx_screen_datafill  
						where data_view_id = :ll_ViewId and screen_id = :ll_ScreenId  and field_name = :ls_FieldName ;
			end if
		end if
		//cb_datafill.Enabled = false
	end if
	
	//Set dddw for default- jervis 12.5.2009
	choose case data
		case 'Y'
			this.Modify("sys_fields_lookup_code.dddw.name = 'd_dddw_lookup_select_for_contract' sys_fields_lookup_code.dddw.datacolumn ='lookup_name' sys_fields_lookup_code.dddw.displaycolumn = 'lookup_name'")
			This.GetChild( "sys_fields_lookup_code", dwchild )
			dwchild.SetTransObject( SQLCA )
			dwchild.Retrieve( )
	
			this.Modify("sys_fields_default_value.dddw.name = 'd_dddw_code_lookup' sys_fields_default_value.dddw.datacolumn ='lookup_code' sys_fields_default_value.dddw.displaycolumn = 'code'")
			this.Modify("sys_fields_lookup_field_name.dddw.name ='d_dddw_lookup_fld_nms_code'") //Reset the dddw of display name field - jervis 04.15.2011
			this.SetItem(row,'sys_fields_lookup_field_name','')
			this.event ItemChanged(row,this.object.sys_fields_lookup_field_name,'')
			this.SetItem(row,'sys_fields_lookup_code','')
			this.event ItemChanged(row,this.object.sys_fields_lookup_code,'')
		case 'C'
			this.Modify("sys_fields_lookup_code.dddw.name = 'd_dddw_company_type' sys_fields_lookup_code.dddw.datacolumn ='company_type' sys_fields_lookup_code.dddw.displaycolumn = 'company_desc'")
			this.Modify("sys_fields_default_value.dddw.name = 'd_dddw_company_list' sys_fields_default_value.dddw.datacolumn ='facility_id' sys_fields_default_value.dddw.displaycolumn = 'facility_name'")
			
			//Reset the dddw data for sys_fields_lookup_field_name field -- jervis 04.15.2011
			of_set_dispalyname_dddw()
			
			
			this.SetItem(row,'sys_fields_lookup_code','A')  //Default to our company
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
		case 'N','E'
		case 'B' //Jervis 07.18.2011
			
	end choose

end if
//---------------------------- APPEON END ----------------------------

IF dwo.name = "sys_fields_lookup_field_name" OR dwo.name = "sys_fields_lookup_code" THEN

	This.GetChild( "sys_fields_default_value", dwchild )
	dwchild.SetTransObject( SQLCA )
	IF dwo.name = "sys_fields_lookup_code" THEN
		dwchild.Retrieve( data )
	ELSE
		dwchild.Retrieve( This.GetItemString( row, "sys_fields_lookup_code" ))
	END IF
END IF
//--------------------------- APPEON BEGIN ---------------------------
//$<add> 05.06.2007 By: Jack
//$<reason> Fix a defect.
this.accepttext()
/***************************************/ //added by gavins 20120308 grid
If dwo.Name = 'data_view_fields_visible' Then
	//Begin - Added By Mark Lee 12/18/2013
	If Data = 'N' then
		if inv_data_design.of_checkmodified_for_export() < 0 then 
			SetItem( row, 'data_view_fields_visible', 'Y' )
			SetItemStatus( row, 'data_view_fields_visible', primary!, notmodified! )
			return 2
		end if
	end if 
	//End - Added By Mark Lee 12/18/2013
	
	If Data = 'N'  and inv_data_design.il_dw_style = 1  Then
		If MessageBox( 'Prompt', 'Modification of the visible property: ~r~n1. “Invisible”, the column will be hidden and moved to the end of all columns. ~r~n2. When the property is changed from “invisible” to “visible”, the column will be displayed at the end of all visible columns. ~r~nAre you sure you want to modify it? ', &
						question!, yesno!, 1 )  = 1 Then
		Else
			SetItem( row, 'data_view_fields_visible', 'Y' )
			SetItemStatus( row, 'data_view_fields_visible', primary!, notmodified! )
			Return 2
		End If	
	End If
	
	//Added By Jay Chen 04-21-2015
	if data = 'N' then
		if tab_properties.tabpage_edit.dw_3.getrow() > 0 then
			tab_properties.tabpage_edit.dw_3.setitem(tab_properties.tabpage_edit.dw_3.getrow() , "fields_add_lookup", 'N')
		end if
	end if
	
End If
/***************************************/
IF dwo.name = "data_view_fields_visible"  Then
	If this.getitemstring(this.getrow(),'data_view_fields_visible') = 'N' Then
		If this.getitemstring(this.getrow(),'data_view_fields_required') = 'Y' Then
			messagebox('Prompt','System will automatically set the Required property to False when the Visible property is set to False. This will cause saving failure if the field is not allowed to be null in the database.')
			this.setitem(this.getrow(),'data_view_fields_required','N')
//			w_contract_data_design.uo_design.POST of_set_dw_properties('data_view_fields_required', 1) //Modify by Evan 07.18.2008, add flag in argument lists
//			w_contract_data_design.uo_design.POST of_set_dw_properties('data_view_fields_required', 2)	//modified by Nova.zhang on 2008-12-09
			inv_data_design.POST of_set_dw_properties('data_view_fields_required', 2)	//Modified by gavin on 2009-03-05
		End If
	End If
End If
IF dwo.name = "data_view_fields_required"  Then
	If this.getitemstring(this.getrow(),'data_view_fields_required') = 'N' Then
		messagebox('Prompt','When the Required property is set to False, saving error may occur if the field is not allowed to be null in the database.')
	End If
End If

//---------------------------- APPEON END ----------------------------

//w_contract_data_design.uo_design.POST of_set_dw_properties(dwo.name, 2) //Modify by Evan 07.18.2008, add flag in argument lists
inv_data_design.POST of_set_dw_properties(dwo.name, 2) //Modify by Evan 07.18.2008, add flag in argument lists
Post of_SetButtonEnabled(1) //Add by Evan 01.30.2008

if dwo.Name = "data_view_fields_field_label" or dwo.Name = "sys_fields_lookup_code" or dwo.Name = "sys_fields_lookup_field_name" or dwo.Name = "sys_fields_field_mask" then
	inv_data_design.ib_HasNewModify = true
end if

end event

event buttonclicked;call super::buttonclicked;long ll_Color
window	lw_Temp
String			ls_visible, ls_Color, ls_Column, ls_Default,ls_field,ls_protect
str_pass		lstr_pass

this.AcceptText()
if Row <=0 then Return

choose case dwo.name
	case "b_text_color"
		ll_Color = this.object.fields_label_textcolor[Row]
		of_ParseColor(ll_Color)
		if ChooseColor(ll_Color,gl_custom_colors[]) = 1 then
			this.object.fields_label_textcolor[Row] = ll_Color
			this.SetColumn("fields_label_textcolor")
			this.Event ItemChanged(Row, this.object.fields_label_textcolor, String(ll_Color))
		end if
	case "b_text_color_def"
		this.object.fields_label_textcolor[Row] = 33554432
		this.SetColumn("fields_label_textcolor")
		this.Event ItemChanged(Row, this.object.fields_label_textcolor, "33554432")
		
	case "b_text_bk_color"
		ll_Color = this.object.fields_label_textbkcolor[Row]
		of_ParseColor(ll_Color)
		if ChooseColor(ll_Color,gl_custom_colors[]) = 1 then
			this.object.fields_label_textbkcolor[Row] = ll_Color
			this.SetColumn("fields_label_textbkcolor")
			this.Event ItemChanged(Row, this.object.fields_label_textbkcolor, String(ll_Color))
		end if
	case "b_text_bk_color_def"
		this.object.fields_label_textbkcolor[Row] = 67108864
		this.SetColumn("fields_label_textbkcolor")
		this.Event ItemChanged(Row, this.object.fields_label_textbkcolor, "67108864")

	//BEGIN---Modify by Scofield on 2009-08-27
	case "b_fields_textcolor"
		ll_Color = this.object.fields_textcolor[Row]
		of_ParseColor(ll_Color)
		if ChooseColor(ll_Color,gl_custom_colors[]) = 1 then
			this.object.fields_textcolor[Row] = ll_Color
			this.SetColumn("fields_textcolor")
			this.Event ItemChanged(Row, this.object.fields_textcolor, String(ll_Color))
			This.Modify( "b_font_colorexpress.color = '0'" )	
			this.SetItem(row,'fields_fontcolorexpress',"")	
			this.Modify( "fields_textcolor.protect = 0" )
		end if
	case "b_fields_textcolor_def"
		this.object.fields_textcolor[Row] = 0
		this.SetColumn("fields_textcolor")
		this.Event ItemChanged(Row, this.object.fields_textcolor, "0")
		This.Modify( "b_font_colorexpress.color = '0'" )	
		this.SetItem(row,'fields_fontcolorexpress',"")
		this.Modify( "fields_textcolor.protect = 0" )
	case "b_fields_textbkcolor"
		ll_Color = this.object.fields_textbkcolor[Row]
		of_ParseColor(ll_Color)
		if ChooseColor(ll_Color,gl_custom_colors[]) = 1 then
			this.object.fields_textbkcolor[Row] = ll_Color
			this.SetColumn("fields_textbkcolor")
			this.Event ItemChanged(Row, this.object.fields_textbkcolor, String(ll_Color))
			This.Modify( "b_background_colorexpress.color = '0'" )	
			this.SetItem(row,'fields_backgroundcolorexpress',"")
			this.Modify( "fields_textbkcolor.protect = 0" )
		end if
	case "b_fields_textbkcolor_def"
		this.object.fields_textbkcolor[Row] = 16777215
		this.SetColumn("fields_textbkcolor")
		this.Event ItemChanged(Row, this.object.fields_textbkcolor, "16777215")
		This.Modify( "b_background_colorexpress.color = '0'" )	
		this.SetItem(row,'fields_backgroundcolorexpress',"")
		this.Modify( "fields_textbkcolor.protect = 0" )
	case "b_lookup"
		If isvalid(w_lookup_maint) Then
			w_lookup_maint.bringtotop = True
			w_lookup_maint.Event ue_change_lookupname(this.GetItemString(row,'sys_fields_lookup_code'))
		Else
			OpenSheetwithparm(w_lookup_maint,this.GetItemString(row,'sys_fields_lookup_code'), w_mdi, 4, original!) //Add parm -- jervis 11.26.2009
		End If
		This.SetColumn("sys_fields_lookup_code")
				
		lw_Temp = tab_properties.GetParent( )
		
		If IsValid( lw_Temp ) Then close( lw_Temp  )
	case "b_visible"
		ls_visible =  this.GetItemString(row,'fields_visibleexpress')
		If Pos( ls_visible, '~t' ) > 0 Then ls_visible = Mid( ls_visible, pos( ls_visible, '~t' ) + 1 ) 
		If right( ls_visible , 1 ) = '"' or right( ls_visible, 1 ) = "'" Then ls_visible = left( ls_visible, len( ls_visible ) - 1 )
		lstr_pass.s_long[1] = 5	
		lstr_pass.s_string          = ls_visible
		lstr_pass.as_search_type = "visible"
		lstr_pass.s_string_array[1] = this.GetItemString( row,'sys_fields_field_name')
		lstr_pass.s_string_array[2] = "column"
		lstr_pass.s_u_dw   = idw_band
		OpenWithParm(w_export_expression,lstr_pass)
		lstr_pass = Message.PowerObjectParm
		if isvalid(lstr_pass) then
			
			if  trim(lstr_pass.s_string) <> "" then
				this.SetItem(row,"fields_visibleexpress",lstr_pass.s_string)
				this.Event ItemChanged( Row, this.object.fields_visibleexpress, lstr_pass.s_string)
				this.Modify( "data_view_fields_visible.protect = 1" )
				this.Modify( "data_view_fields_visible.color = 8421504" )
				This.Modify( "b_visible.color = '16711935'" )
			Else
				this.SetItem(row,"fields_visibleexpress",lstr_pass.s_string)
				this.Event ItemChanged( Row, this.object.data_view_fields_visible, GetItemString( row, 'data_view_fields_visible' ) )
				this.Modify( "data_view_fields_visible.protect = 0" )
				this.Modify( "data_view_fields_visible.color = 0" )
				This.Modify( "b_visible.color = '0'" )
			end if
		end if
		
	//END---Modify by Scofield on 2009-08-27
	case 'b_background_colorexpress' 
		
		ls_Column = 'fields_backgroundcolorexpress'
		
		ls_color =  this.GetItemString(row,ls_Column )
		If Pos( ls_color, '~t' ) > 0 Then ls_color = Mid( ls_color, pos( ls_color, '~t' ) + 1 ) 
		If right( ls_color , 1 ) = '"' or right( ls_color, 1 ) = "'" Then ls_color = left( ls_color, len( ls_color ) - 1 )
		lstr_pass.s_long[1] = 5	
		lstr_pass.s_string          = ls_color
		lstr_pass.as_search_type = "background.color"
		lstr_pass.s_string_array[1] = this.GetItemString( row,'sys_fields_field_name')
		lstr_pass.s_string_array[2] = "column"
		ls_Default =  String( this.GetItemNumber( row, 'fields_textbkcolor' ) )
		If IsNull( ls_Default ) Or Trim( ls_Default ) = '' Then ls_Default = '0'
		lstr_pass.s_string_array[3] =ls_Default
		lstr_pass.s_u_dw            = idw_band
		OpenWithParm(w_export_expression,lstr_pass)
		lstr_pass = Message.PowerObjectParm
		if isvalid(lstr_pass) then
			if  trim(lstr_pass.s_string) <> "" then
				this.SetItem(row,ls_Column,lstr_pass.s_string)
				this.Event ItemChanged( Row, this.object.fields_backgroundcolorexpress, lstr_pass.s_string)
				this.Modify( "fields_textbkcolor.protect = 1" )
				This.Modify( "b_background_colorexpress.color = '16711935'" )	
			Else
				this.SetItem(row,ls_Column,"")
				this.Event ItemChanged( Row, this.object.fields_textbkcolor,  String( GetItemNumber( row, 'fields_textbkcolor' ) ) )
				this.Modify( "fields_textbkcolor.protect = 0" )
				This.Modify( "b_background_colorexpress.color = '0'" )	
			end if
		end if
	case 'b_font_colorexpress' 
		
		ls_Column = 'fields_fontcolorexpress'
		
		ls_color =  this.GetItemString(row,ls_Column )
		If Pos( ls_color, '~t' ) > 0 Then ls_color = Mid( ls_color, pos( ls_color, '~t' ) + 1 ) 
		If right( ls_color , 1 ) = '"' or right( ls_color, 1 ) = "'" Then ls_color = left( ls_color, len( ls_color ) - 1 )
		lstr_pass.s_long[1] = 5	
		lstr_pass.s_string          = ls_color
		lstr_pass.as_search_type = "color"
		lstr_pass.s_string_array[1] = this.GetItemString( row,'sys_fields_field_name')
		lstr_pass.s_string_array[2] = "column"
		ls_Default =  string( this.GetItemNumber( row, 'fields_textcolor' ) )
		If IsNull( ls_Default ) Or Trim( ls_Default ) = '' Then ls_Default = '0'
		lstr_pass.s_string_array[3] =ls_Default
		lstr_pass.s_u_dw            = idw_band
		OpenWithParm(w_export_expression,lstr_pass)
		lstr_pass = Message.PowerObjectParm
		if isvalid(lstr_pass) then
			if  trim(lstr_pass.s_string) <> "" then
				this.SetItem(row,ls_Column,lstr_pass.s_string)
				this.Event ItemChanged( Row, this.object.fields_fontcolorexpress, lstr_pass.s_string)
				this.Modify( "fields_textcolor.protect = 1" )
				This.Modify( "b_font_colorexpress.color = '16711935'" )	
			Else
				this.SetItem(row,ls_Column,"")
				this.Event ItemChanged( Row, this.object.fields_textcolor,  string(GetItemNumber( row, 'fields_textcolor' ) ) )
				this.Modify( "fields_textcolor.protect = 0" )
				This.Modify( "b_font_colorexpress.color = '0'" )	
			end if
		end if	
	//Added By Jay Chen 12-09-2013
	case 'b_fields_x'
		ls_column = 'fields_xexpress'
		ls_field =  this.GetItemString(row,ls_column)
		If Pos( ls_field, '~t' ) > 0 Then ls_field = Mid( ls_field, pos( ls_field, '~t' ) + 1 ) 
		If right( ls_field , 1 ) = '"' or right( ls_field, 1 ) = "'" Then ls_field = left( ls_field, len( ls_field ) - 1 )
		lstr_pass.s_long[1] = 5	
		lstr_pass.s_string          = ls_field
		lstr_pass.as_search_type = "x"
		lstr_pass.s_string_array[1] = this.GetItemString( row,'sys_fields_field_name')
		lstr_pass.s_string_array[2] = "column"
		lstr_pass.s_u_dw   = idw_band
		OpenWithParm(w_export_expression,lstr_pass)
		lstr_pass = Message.PowerObjectParm
		if isvalid(lstr_pass) then
			if  trim(lstr_pass.s_string) <> "" then
				this.SetItem(row,ls_column,lstr_pass.s_string)
				this.Event ItemChanged( Row, this.object.fields_xexpress, lstr_pass.s_string)
				This.Modify( "b_fields_x.color = '16711935'" )
			Else
				this.SetItem(row,ls_column,"")
				this.Event ItemChanged( Row, this.object.fields_xexpress, GetItemString( row, 'fields_xexpress' ) )
				This.Modify( "b_fields_x.color = '0'" )
			end if
		end if
	case 'b_fields_y'
		ls_column = 'fields_yexpress'
		ls_field =  this.GetItemString(row,ls_column)
		If Pos( ls_field, '~t' ) > 0 Then ls_field = Mid( ls_field, pos( ls_field, '~t' ) + 1 ) 
		If right( ls_field , 1 ) = '"' or right( ls_field, 1 ) = "'" Then ls_field = left( ls_field, len( ls_field ) - 1 )
		lstr_pass.s_long[1] = 5	
		lstr_pass.s_string          = ls_field
		lstr_pass.as_search_type = "y"
		lstr_pass.s_string_array[1] = this.GetItemString( row,'sys_fields_field_name')
		lstr_pass.s_string_array[2] = "column"
		lstr_pass.s_u_dw   = idw_band
		OpenWithParm(w_export_expression,lstr_pass)
		lstr_pass = Message.PowerObjectParm
		if isvalid(lstr_pass) then
			if  trim(lstr_pass.s_string) <> "" then
				this.SetItem(row,ls_column,lstr_pass.s_string)
				this.Event ItemChanged( Row, this.object.fields_yexpress, lstr_pass.s_string)
				This.Modify( "b_fields_y.color = '16711935'" )
			Else
				this.SetItem(row,ls_column,"")
				this.Event ItemChanged( Row, this.object.fields_yexpress, GetItemString( row, 'fields_yexpress' ) )
				This.Modify( "b_fields_y.color = '0'" )
			end if
		end if
	case 'b_fields_width'
		ls_column = 'fields_widthexpress'
		ls_field =  this.GetItemString(row,ls_column)
		If Pos( ls_field, '~t' ) > 0 Then ls_field = Mid( ls_field, pos( ls_field, '~t' ) + 1 ) 
		If right( ls_field , 1 ) = '"' or right( ls_field, 1 ) = "'" Then ls_field = left( ls_field, len( ls_field ) - 1 )
		lstr_pass.s_long[1] = 5	
		lstr_pass.s_string          = ls_field
		lstr_pass.as_search_type = "width"
		lstr_pass.s_string_array[1] = this.GetItemString( row,'sys_fields_field_name')
		lstr_pass.s_string_array[2] = "column"
		lstr_pass.s_u_dw   = idw_band
		OpenWithParm(w_export_expression,lstr_pass)
		lstr_pass = Message.PowerObjectParm
		if isvalid(lstr_pass) then
			if  trim(lstr_pass.s_string) <> "" then
				this.SetItem(row,ls_column,lstr_pass.s_string)
				this.Event ItemChanged( Row, this.object.fields_widthexpress, lstr_pass.s_string)
				This.Modify( "b_fields_width.color = '16711935'" )
			Else
				this.SetItem(row,ls_column,"")
				this.Event ItemChanged( Row, this.object.fields_widthexpress, GetItemString( row, 'fields_widthexpress' ) )
				This.Modify( "b_fields_width.color = '0'" )
			end if
		end if
	case 'b_fields_height'
		ls_column = 'fields_heightexpress'
		ls_field =  this.GetItemString(row,ls_column)
		If Pos( ls_field, '~t' ) > 0 Then ls_field = Mid( ls_field, pos( ls_field, '~t' ) + 1 ) 
		If right( ls_field , 1 ) = '"' or right( ls_field, 1 ) = "'" Then ls_field = left( ls_field, len( ls_field ) - 1 )
		lstr_pass.s_long[1] = 5	
		lstr_pass.s_string          = ls_field
		lstr_pass.as_search_type = "height"
		lstr_pass.s_string_array[1] = this.GetItemString( row,'sys_fields_field_name')
		lstr_pass.s_string_array[2] = "column"
		lstr_pass.s_u_dw   = idw_band
		OpenWithParm(w_export_expression,lstr_pass)
		lstr_pass = Message.PowerObjectParm
		if isvalid(lstr_pass) then
			if  trim(lstr_pass.s_string) <> "" then
				this.SetItem(row,ls_column,lstr_pass.s_string)
				this.Event ItemChanged( Row, this.object.fields_heightexpress, lstr_pass.s_string)
				This.Modify( "b_fields_height.color = '16711935'" )
			Else
				this.SetItem(row,ls_column,"")
				this.Event ItemChanged( Row, this.object.fields_heightexpress, GetItemString( row, 'fields_heightexpress' ) )
				This.Modify( "b_fields_height.color = '0'" )
			end if
		end if
		
		//Added By Jay Chen 09-10-2015
	case 'b_protect'
			ls_protect =  this.GetItemString(row,'fields_protectexpress')
			If Pos( ls_protect, '~t' ) > 0 Then ls_protect = Mid( ls_protect, pos( ls_protect, '~t' ) + 1 ) 
			If right( ls_protect , 1 ) = '"' or right( ls_protect, 1 ) = "'" Then ls_protect = left( ls_protect, len( ls_protect ) - 1 )
			lstr_pass.s_long[1] = 5	
			lstr_pass.s_string          = ls_protect
			lstr_pass.as_search_type = "protect"
			lstr_pass.s_string_array[1] = this.GetItemString( row,'sys_fields_field_name')
			lstr_pass.s_string_array[2] = "column"
			lstr_pass.s_u_dw   = idw_band
			OpenWithParm(w_export_expression,lstr_pass)
			lstr_pass = Message.PowerObjectParm
			if isvalid(lstr_pass) then
			
				if  trim(lstr_pass.s_string) <> "" then
					this.SetItem(row,"fields_protectexpress",lstr_pass.s_string)
					this.Event ItemChanged( Row, this.object.fields_protectexpress, lstr_pass.s_string)
					this.Modify( "fields_protect.protect = 1" )
					this.Modify( "fields_protect.color = 8421504" )
					This.Modify( "b_protect.color = '16711935'" )
				Else
					this.SetItem(row,"fields_protectexpress",lstr_pass.s_string)
					this.Event ItemChanged( Row, this.object.fields_protectexpress, GetItemString( row, 'fields_protectexpress' ) )
					this.Modify( "fields_protect.protect = 0" )
					this.Modify( "fields_protect.color = 0" )
					This.Modify( "b_protect.color = '0'" )
				end if
			end if
		
end choose


Event ue_BringToTop( )
end event

event editchanged;call super::editchanged;If row> 0 Then
	If IsNull( data ) Or Trim( data ) = ''  Or Not IsNumber( data )  Then Return
	choose case dwo.name 
	case "fields_label_textcolor", "fields_label_textbkcolor", "fields_textcolor", "fields_textbkcolor"
		of_showcolor( string( dwo.name  ), data )
	case  'data_view_fields_field_x','data_view_fields_field_y','data_view_fields_field_width','data_view_fields_field_height' //Added By Jay Chen 12-12-2013
		AcceptText( )
	end choose
End If
end event

event losefocus;call super::losefocus;AcceptText( )
end event

event itemerror;call super::itemerror;Return 3
end event

type tabpage_edit from userobject within tab_properties
integer x = 18
integer y = 100
integer width = 1915
integer height = 1884
long backcolor = 67108864
string text = "  Field Style  "
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_3 dw_3
end type

on tabpage_edit.create
this.dw_3=create dw_3
this.Control[]={this.dw_3}
end on

on tabpage_edit.destroy
destroy(this.dw_3)
end on

type dw_3 from u_dw within tabpage_edit
integer x = 27
integer y = 28
integer width = 1879
integer height = 1860
integer taborder = 10
string dataobject = "d_contract_field_properties_edit"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
borderstyle borderstyle = stylebox!
end type

event constructor;call super::constructor;This.of_SetUpdateable(False)
end event

event itemchanged;call super::itemchanged;String 	ls_lookup_field,ls_FieldName, ls_FieldType, ls_data, ls_type, ls_fields_validation
long		ll_ViewId,ll_ScreenId,ll_Count,ll_RtnVal,ll_row,ll_insert
Integer	li_Rtn, li_num
DataWindowChild dwchild,dwchild2

//BEGIN---Add by Evan 07/24/2008
choose case dwo.name 
	case "fields_label_textcolor", "fields_label_textbkcolor", "fields_textcolor", "fields_textbkcolor"
		of_ShowColor()
	case "sys_fields_default_value" //added by gavins 20140827
		If row > 0 Then
			ls_FieldType =  dw_properties.GetItemString(dw_properties.GetRow(), "sys_fields_field_type" )
			If Pos( ls_FieldType, 'char' )> 0 Then
				ls_FieldType = Mid( ls_FieldType, Pos( ls_FieldType, '(' ) + 1 )
				ls_FieldType = Trim(Left( ls_FieldType, Len( ls_FieldType ) -1 ))
				If IsNumber( ls_FieldType ) And lower( data ) <> 'null' Then
					If Len( data ) > Integer( ls_FieldType) Then
						MessageBox( 'Tips', 'The value entered exceeds the maximum length defined for the field.' )
						SetItem( row, 'sys_fields_default_value', left( data, Integer( ls_FieldType) ) )
						return 2
					End If
				End If
			End If
			If Pos( ls_FieldType, 'datetime' )> 0 Then
				If Not isDate( data ) and lower( data ) <> 'null' and lower( data ) <> 'today' Then
					MessageBox( 'Tips', 'Please enter a date format values.' )
					SetItem( row, 'sys_fields_default_value', '' )
					return 2
				End If
			End If
			If Pos( ls_FieldType, 'decimal' )> 0 Or Pos( ls_FieldType, 'long' )> 0 Or Pos( ls_FieldType, 'int' )> 0 Or Pos( ls_FieldType, 'number' )> 0 Then
				If Not isnumber( data ) and lower( data ) <> 'null'   Then
					MessageBox( 'Tips', 'Please enter a number format values.' )
					SetItem( row, 'sys_fields_default_value', '' )
					return 2
				End If
			End If
		End If 
end choose
//END---Add by Evan 07/24/2008

//BEGIN---Modify by Scofield on 2010-02-02
if Lower(dwo.Name) = Lower("Fields_AutoHeight") then
	if Lower(Data) = Lower("Yes") then
		ll_RtnVal = MessageBox(gnv_app.iapp_object.DisplayName,"Turning On auto height will adjust the height of the field dynamically during runtime but can slow down the retrieval of data during runtime. Continue?",Question!,YesNo!,2)
		if ll_RtnVal <> 1 then
			This.Post SetItem(This.GetRow(),"Fields_AutoHeight",Lower("No"))
			Return
		end if
	end if
end if
//END---Modify by Scofield on 2010-02-02
//Begin - Added By Mark Lee 09/22/2014.
if dwo.name = "sys_fields_lookup_code" then
	ll_ScreenId = inv_data_design.ii_screen_id
	ls_FieldName = dw_properties.GetItemString(1,'sys_fields_field_name')
	//Document Manager->Document Tab->Added Document Properties			51
	//Document Manager->Document Tab->Created Document Properties		52
	if (ll_ScreenId = 51 or ll_ScreenId  = 52)  and ls_FieldName = lower("status") then
		if string(data) <>  "Contract Document Status" then 			
			if dw_properties.GetItemString(1,'sys_fields_lookup_field') = 'Y' then 
				SetItem( row, 'sys_fields_lookup_code', 'Contract Document Status' )
			else
				SetItem( row, 'sys_fields_lookup_code', '' )
			end if
			MessageBox( gnv_app.iapp_object.DisplayName, 'This Status column’s Field Style must be set to Code Lookup, and its Lookup Table Name must be set to Contract Document Status. ~r~nNo other options should be used. ~r~nOtherwise, it would cause exceptions to associated functions.' )
			return 2
		end if 
	end if 
end if 
//End - Added By Mark Lee 09/22/2014.

//Begin - Added By Mark Lee 10/29/2014.
if dwo.name = "sys_fields_field_mask" then
	ls_FieldType =  dw_properties.GetItemString(dw_properties.GetRow(), "sys_fields_field_type" )
	ls_FieldType  = lower(ls_FieldType )
	If (Pos( ls_FieldType, 'decimal' )> 0 or Pos( ls_FieldType, 'numeric' )> 0  or Pos( ls_FieldType, 'double' )> 0 ) and pos(string(data) ,'.') > 0 then 
		ls_data = right(data, len(data) - pos(string(data) ,'.')  )
		ls_data = gnv_string.of_globalreplace(ls_data,  "%","") 
		if (pos(ls_FieldType,"(") > 0 and  pos(ls_FieldType,")")  > 0 ) and len(ls_data) > 0  then
			li_num = integer( mid(ls_FieldType,pos(ls_FieldType,"(") + 1, pos(ls_FieldType,")") - 1  - pos(ls_FieldType,"(") )  )
			ls_type = left(ls_FieldType,pos(ls_FieldType,"(") - 1)
			if li_num < len(ls_data) then
				MessageBox( gnv_app.iapp_object.DisplayName, 'This field’s data type is '+ls_FieldType+' so you cannot have more than '+string(li_num)+' '+ls_type+' places for its format. ' )
	//		return 2
			end if
		end if 
	end if 
End if 
//End - Added By Mark Lee 10/29/2014.

//--------------------------- APPEON BEGIN ---------------------------
//$<  Add > 2007-10-25 By: Scofield
//$<Reason> Clear the Data Fill if lookup field is not selected

if dwo.name = 'sys_fields_lookup_field' then
	if data <> 'Y' then //if data = 'N' then -- jervis 12.4.2009
		ll_ViewId = inv_data_design.il_data_view                      //Modified by gavin on 2009-03-05
		ll_ScreenId = inv_data_design.ii_screen_id   					  //Modified by gavin on 2009-03-05
		ls_FieldName = dw_properties.GetItemString(1,'sys_fields_field_name')
		
		Select Count(*)
		  into :ll_Count
		  from ctx_screen_datafill
		 where data_view_id = :ll_ViewId and screen_id = :ll_ScreenId  and field_name = :ls_FieldName ;
		
		if ll_Count > 0 then
			li_Rtn = MessageBox(gnv_app.iapp_object.DisplayName,'If this property is set to "No", all data you defined for the current field in the ~r~nData Fill Properties dialog will be removed. ~r~n~r~nDo you want to continue?',Question!,YesNo!,2)
			if li_Rtn = 2 then
				dw_properties.Post SetItem(1,'sys_fields_lookup_field','Y')
				Post of_SetButtonEnabled(1) //Add by Evan 01.30.2008
				return
			else
				delete from ctx_screen_datafill  
						where data_view_id = :ll_ViewId and screen_id = :ll_ScreenId  and field_name = :ls_FieldName ;
			end if
		end if
		//cb_datafill.Enabled = false
	end if
	
	//Set dddw for default- jervis 12.5.2009
	choose case data
		case 'Y'
			this.Modify("sys_fields_lookup_code.dddw.name = 'd_dddw_lookup_select_for_contract' sys_fields_lookup_code.dddw.datacolumn ='lookup_name' sys_fields_lookup_code.dddw.displaycolumn = 'lookup_name'")
			This.GetChild( "sys_fields_lookup_code", dwchild )
			dwchild.SetTransObject( SQLCA )
			dwchild.Retrieve( )
	
			this.Modify("sys_fields_default_value.dddw.name = 'd_dddw_code_lookup' sys_fields_default_value.dddw.datacolumn ='lookup_code' sys_fields_default_value.dddw.displaycolumn = 'code'")
			this.Modify("sys_fields_lookup_field_name.dddw.name ='d_dddw_lookup_fld_nms_code'") //Reset the dddw of display name field - jervis 04.15.2011
			of_set_dispalyname_dddw('Y')
			this.SetItem(row,'sys_fields_lookup_field_name','')
			this.event ItemChanged(row,this.object.sys_fields_lookup_field_name,'')
			this.SetItem(row,'sys_fields_lookup_code','')
			this.event ItemChanged(row,this.object.sys_fields_lookup_code,'')
			//Added By Jay Chen 02-29-2016
			ll_insert = ids_extra_record_undo.insertrow(0)
			ids_extra_record_undo.setitem(ll_insert, "as_field", is_field_name)
			ids_extra_record_undo.setitem(ll_insert, "as_property", "Lookup Table Name")
			ids_extra_record_undo.setitem(ll_insert, "ab_record_undo", "0")
			ll_insert = ids_extra_record_undo.insertrow(0)
			ids_extra_record_undo.setitem(ll_insert, "as_field", is_field_name)
			ids_extra_record_undo.setitem(ll_insert, "as_property", "Display Name")
			ids_extra_record_undo.setitem(ll_insert, "ab_record_undo", "1")
			ll_insert = ids_extra_record_undo.insertrow(0)
			ids_extra_record_undo.setitem(ll_insert, "as_field", is_field_name)
			ids_extra_record_undo.setitem(ll_insert, "as_property", "Field Style")
			ids_extra_record_undo.setitem(ll_insert, "ab_record_undo", "0")
		case 'C'
			this.Modify("sys_fields_lookup_code.dddw.name = 'd_dddw_company_type' sys_fields_lookup_code.dddw.datacolumn ='company_type' sys_fields_lookup_code.dddw.displaycolumn = 'company_desc'")
			this.Modify("sys_fields_default_value.dddw.name = 'd_dddw_company_list' sys_fields_default_value.dddw.datacolumn ='facility_id' sys_fields_default_value.dddw.displaycolumn = 'facility_name'")
			
			//Reset the dddw data for sys_fields_lookup_field_name field -- jervis 04.15.2011
			of_set_dispalyname_dddw()
			
			this.SetItem(row,'sys_fields_lookup_code','A')  //Default to our company
			this.event ItemChanged(row,this.object.sys_fields_lookup_code,'A')	
			this.SetItem(row,'sys_fields_lookup_field_name','facility_name')
			this.event ItemChanged(row,this.object.sys_fields_lookup_field_name,'facility_name')
			//Added By Jay Chen 02-29-2016
			ll_insert = ids_extra_record_undo.insertrow(0)
			ids_extra_record_undo.setitem(ll_insert, "as_field", is_field_name)
			ids_extra_record_undo.setitem(ll_insert, "as_property", "Lookup Table Name")
			ids_extra_record_undo.setitem(ll_insert, "ab_record_undo", "1")
			ll_insert = ids_extra_record_undo.insertrow(0)
			ids_extra_record_undo.setitem(ll_insert, "as_field", is_field_name)
			ids_extra_record_undo.setitem(ll_insert, "as_property", "Display Name")
			ids_extra_record_undo.setitem(ll_insert, "ab_record_undo", "0")
			ll_insert = ids_extra_record_undo.insertrow(0)
			ids_extra_record_undo.setitem(ll_insert, "as_field", is_field_name)
			ids_extra_record_undo.setitem(ll_insert, "as_property", "Field Style")
			ids_extra_record_undo.setitem(ll_insert, "ab_record_undo", "0")
		case 'U'
			this.Modify("sys_fields_default_value.dddw.name = 'd_dddw_users' sys_fields_default_value.dddw.datacolumn ='user_id' sys_fields_default_value.dddw.displaycolumn = 'user_id'")
			This.GetChild( "sys_fields_default_value", dwchild )
			dwchild.SetTransObject( SQLCA )
			dwchild.Retrieve( )
			
			//Added By Jay Chen 09-02-2014 remark:add user name in diaplay dropdown list
			this.GetChild( "sys_fields_lookup_field_name", dwchild2 )
			dwchild2.Reset()
			ll_row = dwchild2.insertrow( 0)
			dwchild2.SetItem( ll_row,'field_name', 'user_id')
			dwchild2.SetItem( ll_row,'field_label', 'user_id')
			ll_row = dwchild2.insertrow( 0)
			dwchild2.SetItem( ll_row,'field_name', 'user_name')
			dwchild2.SetItem( ll_row,'field_label', 'user_name')
			//end
	
			this.SetItem(row,'sys_fields_lookup_field_name','user_id')
			this.event ItemChanged(row,this.object.sys_fields_lookup_field_name,'User_id')
//			this.SetItem(row,'sys_fields_lookup_code','')
			this.SetItem(row,'sys_fields_lookup_code','User') //Modified By Jay Chen 09-02-2014
			this.event ItemChanged(row,this.object.sys_fields_lookup_code,'')
			//Added By Jay Chen 02-29-2016
			ll_insert = ids_extra_record_undo.insertrow(0)
			ids_extra_record_undo.setitem(ll_insert, "as_field", is_field_name)
			ids_extra_record_undo.setitem(ll_insert, "as_property", "Lookup Table Name")
			ids_extra_record_undo.setitem(ll_insert, "ab_record_undo", "0")
			ll_insert = ids_extra_record_undo.insertrow(0)
			ids_extra_record_undo.setitem(ll_insert, "as_field", is_field_name)
			ids_extra_record_undo.setitem(ll_insert, "as_property", "Display Name")
			ids_extra_record_undo.setitem(ll_insert, "ab_record_undo", "1")
			ll_insert = ids_extra_record_undo.insertrow(0)
			ids_extra_record_undo.setitem(ll_insert, "as_field", is_field_name)
			ids_extra_record_undo.setitem(ll_insert, "as_property", "Field Style")
			ids_extra_record_undo.setitem(ll_insert, "ab_record_undo", "0")
			
		case 'N', 'E'
			
		case 'B' //Jervis 07.18.2011
			this.setitem( row, "fields_3dlock", 'yes' )//added by gavins 20130514
	end choose
	
	ls_fields_validation = this.GetItemString(row,"fields_validation")							//Added By Mark Lee 07/31/2015
	if not isnull(ls_fields_validation) and trim(ls_fields_validation) <> "" and  string(data) <> 'E' then 
		this.SetItem(row,"fields_validation","")	
		inv_data_design.POST of_set_dw_properties('fields_validation', 2)
	end if 
	
	//Added By Ken.Guo 2017-03-02 Task 722. reset the sort/filter expression after itemchanged.
	this.setitem(row, 'sort_expression', '')
	this.Event ItemChanged(Row, this.object.sort_expression, '')			
	this.setitem(row, 'filter_expression', '')
	this.Event ItemChanged(Row, this.object.filter_expression, '')			
	
end if
//---------------------------- APPEON END ----------------------------

IF dwo.name = "sys_fields_lookup_field_name" OR dwo.name = "sys_fields_lookup_code" THEN

	This.GetChild( "sys_fields_default_value", dwchild )
	dwchild.SetTransObject( SQLCA )
	IF dwo.name = "sys_fields_lookup_code" THEN
		dwchild.Retrieve( data )
	ELSE
		dwchild.Retrieve( This.GetItemString( row, "sys_fields_lookup_code" ))
	END IF
	
	//Added By Jay Chen 02-29-2016 reset specila fiels style undo list
	ids_extra_record_undo.reset()
	//end
	
END IF
//--------------------------- APPEON BEGIN ---------------------------
//$<add> 05.06.2007 By: Jack
//$<reason> Fix a defect.
this.accepttext()
IF dwo.name = "data_view_fields_visible"  Then
	If this.getitemstring(this.getrow(),'data_view_fields_visible') = 'N' Then
		If this.getitemstring(this.getrow(),'data_view_fields_required') = 'Y' Then
			messagebox('Prompt','System will automatically set the Required property to False when the Visible property is set to False. This will cause saving failure if the field is not allowed to be null in the database.')
			this.setitem(this.getrow(),'data_view_fields_required','N')
//			w_contract_data_design.uo_design.POST of_set_dw_properties('data_view_fields_required', 1) //Modify by Evan 07.18.2008, add flag in argument lists
//			w_contract_data_design.uo_design.POST of_set_dw_properties('data_view_fields_required', 2)	//modified by Nova.zhang on 2008-12-09
			inv_data_design.POST of_set_dw_properties('data_view_fields_required', 2)	//Modified by gavin on 2009-03-05
		End If
	End If
End If
IF dwo.name = "data_view_fields_required"  Then
	If data = 'N' Then
		messagebox('Prompt','When the Required property is set to False, saving error may occur if the field is not allowed to be null in the database.')
	End If
End If

//---------------------------- APPEON END ----------------------------

//Added By Harry 11-08-2016
IF dwo.name = "field_tip"  Then
	of_save_tip()
End If

//Begin - Added By Mark Lee 07/28/2015.
//IF dwo.name = "fields_validation"  Then
//	inv_data_design.POST of_set_dw_properties('fields_validation', 2)				//Added By Mark Lee 07/30/2015		
	//
//end if 
//End - Added By Mark Lee 07/28/2015.

//w_contract_data_design.uo_design.POST of_set_dw_properties(dwo.name, 2) //Modify by Evan 07.18.2008, add flag in argument lists
inv_data_design.POST of_set_dw_properties(dwo.name, 2) //Modify by Evan 07.18.2008, add flag in argument lists
Post of_SetButtonEnabled(1) //Add by Evan 01.30.2008

if dwo.Name = "data_view_fields_field_label" or dwo.Name = "sys_fields_lookup_code" or dwo.Name = "sys_fields_lookup_field_name" or dwo.Name = "sys_fields_field_mask" then
	inv_data_design.ib_HasNewModify = true
end if

//Added By Ken.Guo 2017-05-25. Fix bug. the property has not beed save when the properties window has not been close during change this property.
string ls_multi_select
long ll_find
If dwo.name  =  'fields_multi_select' Then 
	if (inv_data_design.ii_screen_id = 9 or inv_data_design.ii_screen_id = 10) and left(is_field_name,7) = 'custom_' and left(is_field_type,4) = 'char' then
		ls_multi_select = data
		if isnull(ls_multi_select) then ls_multi_select = ''
		if ls_multi_select = '' then ls_multi_select = 'N'
		if len(ls_multi_select) > 0 then inv_data_design.is_multi_select_new = ls_multi_select
		if inv_data_design.is_multi_select_new <> inv_data_design.is_multi_select_old then
			if IsValid(m_pfe_cst_contract_data_design) then
				gnv_app.of_modify_menu_attr( m_pfe_cst_contract_data_design.m_file.m_save,'Enabled', true)
			end if
			//Added By Jay Chen 01-20-2016
			if not isvalid(inv_data_design.ids_select_item_attribute) then 
				inv_data_design.ids_select_item_attribute = create datastore
				inv_data_design.ids_select_item_attribute.dataobject = 'dw_select_item_attribute'
			end if
			ll_find = inv_data_design.ids_select_item_attribute.find("field_name = '"+is_field_name+"'",1,inv_data_design.ids_select_item_attribute.rowcount())
			if isnull(ll_find) then ll_find = 0
			if ll_find = 0 then
				ll_insert = inv_data_design.ids_select_item_attribute.insertrow(0)
				inv_data_design.ids_select_item_attribute.setitem(ll_insert,"field_name",is_field_name)
				inv_data_design.ids_select_item_attribute.setitem(ll_insert,"field_value",ls_multi_select)
			else
				inv_data_design.ids_select_item_attribute.setitem(ll_find,"field_value",ls_multi_select)
			end if
		end if
	end if
end if

end event

event itemfocuschanged;call super::itemfocuschanged;String ls_col_type
DataWindowChild dwchild	

IF This.GetColumnName() = "sys_fields_default_value" THEN
	String ls_field_name
	ls_field_name = Upper( This.GetItemString( row, "sys_fields_lookup_field_name" ) )

	//Begin - Modified By Ken.Guo 2010-10-14
	/*
		This.GetChild( "sys_fields_default_value" , dwchild )
		dwchild.SetTransObject( SQLCA )
		dwchild.Retrieve( This.GetItemString( row, "sys_fields_lookup_code" ) )	
	*/
	ls_col_type = This.GetItemString(row,'sys_fields_field_type')
	If Left(ls_col_type,4) = 'date' or Left(ls_col_type,4) = 'time' Then
		This.Modify("sys_fields_default_value.DDDW.DataColumn = 'code'")
		If This.GetChild( "sys_fields_default_value" , dwchild ) = 1 Then
			dwchild.SetTransObject( SQLCA )
			dwchild.InsertRow(0)
			dwchild.SetItem(1,'code','Today')
			dwchild.SetItem(1,'lookup_code',-999)
		End If
	Else
		if lower(this.describe("sys_fields_default_value.DDDW.DataColumn")) = 'code' then //Added By Jay Chen 09-24-2014 
			This.Modify("sys_fields_default_value.DDDW.DataColumn = 'lookup_code'")
			This.GetChild( "sys_fields_default_value" , dwchild )
			dwchild.SetTransObject( SQLCA )
			dwchild.Retrieve( This.GetItemString( row, "sys_fields_lookup_code" ) )	
		end if			
	End If
	//End - Modified By Ken.Guo 2010-10-14
	
END IF
end event

event buttonclicked;call super::buttonclicked;long ll_Color
window	lw_Temp

//Added By Ken.Guo 2016-08-16
String ls_column, ls_field_compute_express
str_pass lstr_pass

//Added By Ken.Guo 2017-03-02
String ls_sys_fields_lookup_field, ls_null, ls_sort, ls_sort_new, ls_filter, ls_filter_new

this.AcceptText()
if Row <=0 then Return

choose case dwo.name
	case "b_text_color"
		ll_Color = this.object.fields_label_textcolor[Row]
		of_ParseColor(ll_Color)
		if ChooseColor(ll_Color,gl_custom_colors[]) = 1 then
			this.object.fields_label_textcolor[Row] = ll_Color
			this.SetColumn("fields_label_textcolor")
			this.Event ItemChanged(Row, this.object.fields_label_textcolor, String(ll_Color))
		end if
	case "b_text_color_def"
		this.object.fields_label_textcolor[Row] = 33554432
		this.SetColumn("fields_label_textcolor")
		this.Event ItemChanged(Row, this.object.fields_label_textcolor, "33554432")
		
	case "b_text_bk_color"
		ll_Color = this.object.fields_label_textbkcolor[Row]
		of_ParseColor(ll_Color)
		if ChooseColor(ll_Color,gl_custom_colors[]) = 1 then
			this.object.fields_label_textbkcolor[Row] = ll_Color
			this.SetColumn("fields_label_textbkcolor")
			this.Event ItemChanged(Row, this.object.fields_label_textbkcolor, String(ll_Color))
		end if
	case "b_text_bk_color_def"
		this.object.fields_label_textbkcolor[Row] = 67108864
		this.SetColumn("fields_label_textbkcolor")
		this.Event ItemChanged(Row, this.object.fields_label_textbkcolor, "67108864")
	
	//BEGIN---Modify by Scofield on 2009-08-27
	case "b_fields_textcolor"
		ll_Color = this.object.fields_textcolor[Row]
		of_ParseColor(ll_Color)
		if ChooseColor(ll_Color,gl_custom_colors[]) = 1 then
			this.object.fields_textcolor[Row] = ll_Color
			this.SetColumn("fields_textcolor")
			this.Event ItemChanged(Row, this.object.fields_textcolor, String(ll_Color))
		end if
	case "b_fields_textcolor_def"
		this.object.fields_textcolor[Row] = 0
		this.SetColumn("fields_textcolor")
		this.Event ItemChanged(Row, this.object.fields_textcolor, "0")
		
	case "b_fields_textbkcolor"
		ll_Color = this.object.fields_textbkcolor[Row]
		of_ParseColor(ll_Color)
		if ChooseColor(ll_Color,gl_custom_colors[]) = 1 then
			this.object.fields_textbkcolor[Row] = ll_Color
			this.SetColumn("fields_textbkcolor")
			this.Event ItemChanged(Row, this.object.fields_textbkcolor, String(ll_Color))
		end if
	case "b_fields_textbkcolor_def"
		this.object.fields_textbkcolor[Row] = 16777215
		this.SetColumn("fields_textbkcolor")
		this.Event ItemChanged(Row, this.object.fields_textbkcolor, "16777215")
	case "b_lookup"
				
		If isvalid(w_lookup_maint) Then
			w_lookup_maint.bringtotop = True
			w_lookup_maint.Event ue_change_lookupname(this.GetItemString(row,'sys_fields_lookup_code'))
		Else
			OpenSheetwithparm(w_lookup_maint,this.GetItemString(row,'sys_fields_lookup_code'), w_mdi, 4, original!) //Add parm -- jervis 11.26.2009
		End If
		This.SetColumn("sys_fields_lookup_code")
		
		lw_Temp = tab_properties.GetParent( )
		
		If IsValid( lw_Temp ) Then close( lw_Temp  )
		
	//END---Modify by Scofield on 2009-08-27
Case "b_compute_expression" //Added By Ken.Guo 2016-08-16
		If this.GetItemNumber(row, 'field_use_compute') = 1 Then
			ls_column = 'field_compute_expression'
			ls_field_compute_express =  this.GetItemString(row,ls_column)
			If Pos( ls_field_compute_express, '~t' ) > 0 Then ls_field_compute_express = Mid( ls_field_compute_express, pos( ls_field_compute_express, '~t' ) + 1 ) 
			//If right( ls_field_compute_express , 1 ) = '"' or right( ls_field_compute_express, 1 ) = "'" Then ls_field_compute_express = left( ls_field_compute_express, len( ls_field_compute_express ) - 1 )  //Commented by Harry 2017-08-02 Task 811:Auto Populate strips off the last quotation mark in the formula
			lstr_pass.s_long[1] = 7	
			lstr_pass.s_string          = ls_field_compute_express
			lstr_pass.as_search_type = "compute"
			lstr_pass.s_string_array[1] = this.GetItemString( row,'sys_fields_field_name')
			lstr_pass.s_string_array[2] = "column"
			lstr_pass.s_u_dw   = idw_band
			OpenWithParm(w_export_expression,lstr_pass)
			lstr_pass = Message.PowerObjectParm
			if isvalid(lstr_pass) then
				if  trim(lstr_pass.s_string) <> "" then
					this.SetItem(row,ls_column,lstr_pass.s_string)
					this.Event ItemChanged(Row, this.object.field_compute_expression, ls_field_compute_express)
				Else
					this.SetItem(row,ls_column,"")
				end if
			end if
		End If
Case "b_sort" //Added By Ken.Guo 2017-03-02 Task 722
	SetNull(ls_null)
	ls_sort = this.getitemstring(row, 'sort_expression')
	If isnull(ls_sort) Then ls_sort = ''
	ls_sys_fields_lookup_field = this.getitemstring(row, 'sys_fields_lookup_field') 
	Choose Case ls_sys_fields_lookup_field
		Case 'Y'
			dw_dddw_sort_filter.dataobject = 'd_dddw_code_lookup'
		Case 'C'
			dw_dddw_sort_filter.dataobject = 'd_dddw_company_list'
		Case Else
			Return 
	End Choose
	dw_dddw_sort_filter.settransobject(sqlca)
	dw_dddw_sort_filter.setsort(ls_sort) //restore 
	dw_dddw_sort_filter.setsort(ls_null) //open sort window
	ls_sort_new = trim(dw_dddw_sort_filter.describe(("DataWindow.Table.Sort")))
	If ls_sort_new = '?' or ls_sort_new = '!' Then ls_sort_new = ''
	If ls_sort_new <>  ls_sort and (ls_sort_new = ''  or  Len(ls_sort_new ) > 2)  Then
		this.setitem(row, 'sort_expression', ls_sort_new)
		this.Event ItemChanged(Row, this.object.sort_expression, ls_sort_new)			
	End If
Case "b_filter" //Added By Ken.Guo 2017-03-02 Task 722
	SetNull(ls_null)
	ls_filter = this.getitemstring(row, 'filter_expression')
	If isnull(ls_filter) Then ls_filter = ''
	ls_sys_fields_lookup_field = this.getitemstring(row, 'sys_fields_lookup_field') 
	Choose Case ls_sys_fields_lookup_field
		Case 'Y'
			dw_dddw_sort_filter.dataobject = 'd_dddw_code_lookup'
		Case 'C'
			dw_dddw_sort_filter.dataobject = 'd_dddw_company_list'
		Case Else
			Return 
	End Choose
	dw_dddw_sort_filter.settransobject(sqlca)
	dw_dddw_sort_filter.setfilter(ls_filter) //restore 
	dw_dddw_sort_filter.setfilter(ls_null) //open sort window
	ls_filter_new = trim(dw_dddw_sort_filter.describe(("DataWindow.Table.Filter")))
	If ls_filter_new = '?' or ls_filter_new = '!' Then ls_filter_new = ''
	If ls_filter_new <>  ls_filter and (ls_filter_new = ''  or  Len(ls_filter_new ) > 2)  Then
		this.setitem(row, 'filter_expression', ls_filter_new)
		this.Event ItemChanged(Row, this.object.filter_expression, ls_filter_new)			
	End If		
end choose

end event

event losefocus;call super::losefocus;AcceptText( )
end event

type tabpage_font from userobject within tab_properties
boolean visible = false
integer x = 18
integer y = 100
integer width = 1915
integer height = 1884
long backcolor = 67108864
string text = "Font"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_4 dw_4
end type

on tabpage_font.create
this.dw_4=create dw_4
this.Control[]={this.dw_4}
end on

on tabpage_font.destroy
destroy(this.dw_4)
end on

type dw_4 from u_dw within tabpage_font
integer x = 27
integer y = 28
integer width = 1847
integer height = 1568
integer taborder = 10
string dataobject = "d_contract_field_properties_font"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
borderstyle borderstyle = stylebox!
end type

event constructor;call super::constructor;This.of_SetUpdateable(False)

String ls_fonts[]
datawindowchild ldwc_fonts
int i,j
n_cst_appeondll lnv_appeon_dll


if this.getchild("font_face",ldwc_fonts) = 1 then
	lnv_appeon_dll.of_getfonts(ls_fonts)
	
	For i = 1 To UpperBound(ls_fonts[])
		If Trim(ls_fonts[i]) = '' Then Continue
		If i > 1 Then
			If ls_fonts[i - 1] = ls_fonts[i] Then Continue
		End If
		j = ldwc_fonts.InsertRow(0)
		ldwc_fonts.SetItem(j,1,ls_fonts[i])
	Next
	
	If ldwc_fonts.RowCount() = 0 Then
		ldwc_fonts.InsertRow(1)
		ldwc_fonts.SetItem(1,1,'MS Sans Serif')
	End If
	
	ldwc_fonts.SetSort('fonts_face A')
	ldwc_fonts.Sort()
	this.InsertRow(0)
end if
end event

event itemchanged;call super::itemchanged;String 	ls_lookup_field,ls_FieldName
long		ll_ViewId,ll_ScreenId,ll_Count,ll_RtnVal
Integer	li_Rtn
DataWindowChild dwchild

//BEGIN---Add by Evan 07/24/2008
choose case dwo.name 
	case "fields_label_textcolor", "fields_label_textbkcolor", "fields_textcolor", "fields_textbkcolor"
		of_ShowColor()
end choose
//END---Add by Evan 07/24/2008

//BEGIN---Modify by Scofield on 2010-02-02
if Lower(dwo.Name) = Lower("Fields_AutoHeight") then
	if Lower(Data) = Lower("Yes") then
		ll_RtnVal = MessageBox(gnv_app.iapp_object.DisplayName,"Turning On auto height will adjust the height of the field dynamically during runtime but can slow down the retrieval of data during runtime. Continue?",Question!,YesNo!,2)
		if ll_RtnVal <> 1 then
			This.Post SetItem(This.GetRow(),"Fields_AutoHeight",Lower("No"))
			Return
		end if
	end if
end if
//END---Modify by Scofield on 2010-02-02

//--------------------------- APPEON BEGIN ---------------------------
//$<  Add > 2007-10-25 By: Scofield
//$<Reason> Clear the Data Fill if lookup field is not selected

if dwo.name = 'sys_fields_lookup_field' then
	if data <> 'Y' then //if data = 'N' then -- jervis 12.4.2009
		ll_ViewId = inv_data_design.il_data_view                      //Modified by gavin on 2009-03-05
		ll_ScreenId = inv_data_design.ii_screen_id   					  //Modified by gavin on 2009-03-05
		ls_FieldName = dw_properties.GetItemString(1,'sys_fields_field_name')
		
		Select Count(*)
		  into :ll_Count
		  from ctx_screen_datafill
		 where data_view_id = :ll_ViewId and screen_id = :ll_ScreenId  and field_name = :ls_FieldName ;
		
		if ll_Count > 0 then
			li_Rtn = MessageBox(gnv_app.iapp_object.DisplayName,'If this property is set to "No", all data you defined for the current field in the ~r~nData Fill Properties dialog will be removed. ~r~n~r~nDo you want to continue?',Question!,YesNo!,2)
			if li_Rtn = 2 then
				dw_properties.Post SetItem(1,'sys_fields_lookup_field','Y')
				Post of_SetButtonEnabled(1) //Add by Evan 01.30.2008
				return
			else
				delete from ctx_screen_datafill  
						where data_view_id = :ll_ViewId and screen_id = :ll_ScreenId  and field_name = :ls_FieldName ;
			end if
		end if
		//cb_datafill.Enabled = false
	end if
	
	//Set dddw for default- jervis 12.5.2009
	choose case data
		case 'Y'
			this.Modify("sys_fields_lookup_code.dddw.name = 'd_dddw_lookup_select_for_contract' sys_fields_lookup_code.dddw.datacolumn ='lookup_name' sys_fields_lookup_code.dddw.displaycolumn = 'lookup_name'")
			This.GetChild( "sys_fields_lookup_code", dwchild )
			dwchild.SetTransObject( SQLCA )
			dwchild.Retrieve( )
	
			this.Modify("sys_fields_default_value.dddw.name = 'd_dddw_code_lookup' sys_fields_default_value.dddw.datacolumn ='lookup_code' sys_fields_default_value.dddw.displaycolumn = 'code'")
			this.Modify("sys_fields_lookup_field_name.dddw.name ='d_dddw_lookup_fld_nms_code'") //Reset the dddw of display name field - jervis 04.15.2011
			this.SetItem(row,'sys_fields_lookup_field_name','')
			this.event ItemChanged(row,this.object.sys_fields_lookup_field_name,'')
			this.SetItem(row,'sys_fields_lookup_code','')
			this.event ItemChanged(row,this.object.sys_fields_lookup_code,'')
		case 'C'
			this.Modify("sys_fields_lookup_code.dddw.name = 'd_dddw_company_type' sys_fields_lookup_code.dddw.datacolumn ='company_type' sys_fields_lookup_code.dddw.displaycolumn = 'company_desc'")
			this.Modify("sys_fields_default_value.dddw.name = 'd_dddw_company_list' sys_fields_default_value.dddw.datacolumn ='facility_id' sys_fields_default_value.dddw.displaycolumn = 'facility_name'")
			
			//Reset the dddw data for sys_fields_lookup_field_name field -- jervis 04.15.2011
			of_set_dispalyname_dddw()
			
			
			this.SetItem(row,'sys_fields_lookup_code','A')  //Default to our company
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
		case 'N','E'
		case 'B' //Jervis 07.18.2011
			
	end choose

end if
//---------------------------- APPEON END ----------------------------

IF dwo.name = "sys_fields_lookup_field_name" OR dwo.name = "sys_fields_lookup_code" THEN

	This.GetChild( "sys_fields_default_value", dwchild )
	dwchild.SetTransObject( SQLCA )
	IF dwo.name = "sys_fields_lookup_code" THEN
		dwchild.Retrieve( data )
	ELSE
		dwchild.Retrieve( This.GetItemString( row, "sys_fields_lookup_code" ))
	END IF
END IF
//--------------------------- APPEON BEGIN ---------------------------
//$<add> 05.06.2007 By: Jack
//$<reason> Fix a defect.
this.accepttext()
IF dwo.name = "data_view_fields_visible"  Then
	If this.getitemstring(this.getrow(),'data_view_fields_visible') = 'N' Then
		If this.getitemstring(this.getrow(),'data_view_fields_required') = 'Y' Then
			messagebox('Prompt','System will automatically set the Required property to False when the Visible property is set to False. This will cause saving failure if the field is not allowed to be null in the database.')
			this.setitem(this.getrow(),'data_view_fields_required','N')
//			w_contract_data_design.uo_design.POST of_set_dw_properties('data_view_fields_required', 1) //Modify by Evan 07.18.2008, add flag in argument lists
//			w_contract_data_design.uo_design.POST of_set_dw_properties('data_view_fields_required', 2)	//modified by Nova.zhang on 2008-12-09
			inv_data_design.POST of_set_dw_properties('data_view_fields_required', 2)	//Modified by gavin on 2009-03-05
		End If
	End If
End If
IF dwo.name = "data_view_fields_required"  Then
	If this.getitemstring(this.getrow(),'data_view_fields_required') = 'N' Then
		messagebox('Prompt','When the Required property is set to False, saving error may occur if the field is not allowed to be null in the database.')
	End If
End If

//---------------------------- APPEON END ----------------------------

//w_contract_data_design.uo_design.POST of_set_dw_properties(dwo.name, 2) //Modify by Evan 07.18.2008, add flag in argument lists
inv_data_design.POST of_set_dw_properties(dwo.name, 2) //Modify by Evan 07.18.2008, add flag in argument lists
Post of_SetButtonEnabled(1) //Add by Evan 01.30.2008

if dwo.Name = "data_view_fields_field_label" or dwo.Name = "sys_fields_lookup_code" or dwo.Name = "sys_fields_lookup_field_name" or dwo.Name = "sys_fields_field_mask" then
	inv_data_design.ib_HasNewModify = true
end if

end event

type tabpage_label from userobject within tab_properties
integer x = 18
integer y = 100
integer width = 1915
integer height = 1884
long backcolor = 67108864
string text = "  Label Display  "
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_2 dw_2
end type

on tabpage_label.create
this.dw_2=create dw_2
this.Control[]={this.dw_2}
end on

on tabpage_label.destroy
destroy(this.dw_2)
end on

type dw_2 from u_dw within tabpage_label
integer x = 27
integer y = 28
integer width = 1879
integer height = 1848
integer taborder = 10
string dataobject = "d_contract_field_properties_label"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
borderstyle borderstyle = stylebox!
end type

event constructor;call super::constructor;This.of_SetUpdateable(False)

String ls_fonts[]
datawindowchild ldwc_fonts
int i,j
n_cst_appeondll lnv_appeon_dll


if this.getchild("label_font_face",ldwc_fonts) = 1 then
	lnv_appeon_dll.of_getfonts(ls_fonts)
	
	For i = 1 To UpperBound(ls_fonts[])
		If Trim(ls_fonts[i]) = '' Then Continue
		If i > 1 Then
			If ls_fonts[i - 1] = ls_fonts[i] Then Continue
		End If
		j = ldwc_fonts.InsertRow(0)
		ldwc_fonts.SetItem(j,1,ls_fonts[i])
	Next
	
	If ldwc_fonts.RowCount() = 0 Then
		ldwc_fonts.InsertRow(1)
		ldwc_fonts.SetItem(1,1,'MS Sans Serif')
	End If
	
	ldwc_fonts.SetSort('fonts_face A')
	ldwc_fonts.Sort()
	this.InsertRow(0)
end if
end event

event itemchanged;call super::itemchanged;String 	ls_lookup_field,ls_FieldName
long		ll_ViewId,ll_ScreenId,ll_Count,ll_RtnVal
Integer	li_Rtn
DataWindowChild dwchild

//BEGIN---Add by Evan 07/24/2008
choose case dwo.name 
	case "fields_label_textcolor", "fields_label_textbkcolor", "fields_textcolor", "fields_textbkcolor"
		of_ShowColor()
end choose
//END---Add by Evan 07/24/2008

//BEGIN---Modify by Scofield on 2010-02-02
if Lower(dwo.Name) = Lower("Fields_AutoHeight") then
	if Lower(Data) = Lower("Yes") then
		ll_RtnVal = MessageBox(gnv_app.iapp_object.DisplayName,"Turning On auto height will adjust the height of the field dynamically during runtime but can slow down the retrieval of data during runtime. Continue?",Question!,YesNo!,2)
		if ll_RtnVal <> 1 then
			This.Post SetItem(This.GetRow(),"Fields_AutoHeight",Lower("No"))
			Return
		end if
	end if
end if
//END---Modify by Scofield on 2010-02-02
if dwo.Name = "data_view_fields_field_label" or dwo.Name = "sys_fields_lookup_code" or dwo.Name = "sys_fields_lookup_field_name" or dwo.Name = "sys_fields_field_mask" then
	inv_data_design.ib_HasNewModify = true
end if

//--------------------------- APPEON BEGIN ---------------------------
//$<  Add > 2007-10-25 By: Scofield
//$<Reason> Clear the Data Fill if lookup field is not selected

if dwo.name = 'sys_fields_lookup_field' then
	if data <> 'Y' then //if data = 'N' then -- jervis 12.4.2009
		ll_ViewId = inv_data_design.il_data_view                      //Modified by gavin on 2009-03-05
		ll_ScreenId = inv_data_design.ii_screen_id   					  //Modified by gavin on 2009-03-05
		ls_FieldName = dw_properties.GetItemString(1,'sys_fields_field_name')
		
		Select Count(*)
		  into :ll_Count
		  from ctx_screen_datafill
		 where data_view_id = :ll_ViewId and screen_id = :ll_ScreenId  and field_name = :ls_FieldName ;
		
		if ll_Count > 0 then
			li_Rtn = MessageBox(gnv_app.iapp_object.DisplayName,'If this property is set to "No", all data you defined for the current field in the ~r~nData Fill Properties dialog will be removed. ~r~n~r~nDo you want to continue?',Question!,YesNo!,2)
			if li_Rtn = 2 then
				dw_properties.Post SetItem(1,'sys_fields_lookup_field','Y')
				Post of_SetButtonEnabled(1) //Add by Evan 01.30.2008
				return
			else
				delete from ctx_screen_datafill  
						where data_view_id = :ll_ViewId and screen_id = :ll_ScreenId  and field_name = :ls_FieldName ;
			end if
		end if
		//cb_datafill.Enabled = false
	end if
	
	//Set dddw for default- jervis 12.5.2009
	choose case data
		case 'Y'
			this.Modify("sys_fields_lookup_code.dddw.name = 'd_dddw_lookup_select_for_contract' sys_fields_lookup_code.dddw.datacolumn ='lookup_name' sys_fields_lookup_code.dddw.displaycolumn = 'lookup_name'")
			This.GetChild( "sys_fields_lookup_code", dwchild )
			dwchild.SetTransObject( SQLCA )
			dwchild.Retrieve( )
	
			this.Modify("sys_fields_default_value.dddw.name = 'd_dddw_code_lookup' sys_fields_default_value.dddw.datacolumn ='lookup_code' sys_fields_default_value.dddw.displaycolumn = 'code'")
			this.Modify("sys_fields_lookup_field_name.dddw.name ='d_dddw_lookup_fld_nms_code'") //Reset the dddw of display name field - jervis 04.15.2011
			this.SetItem(row,'sys_fields_lookup_field_name','')
			this.event ItemChanged(row,this.object.sys_fields_lookup_field_name,'')
			this.SetItem(row,'sys_fields_lookup_code','')
			this.event ItemChanged(row,this.object.sys_fields_lookup_code,'')
		case 'C'
			this.Modify("sys_fields_lookup_code.dddw.name = 'd_dddw_company_type' sys_fields_lookup_code.dddw.datacolumn ='company_type' sys_fields_lookup_code.dddw.displaycolumn = 'company_desc'")
			this.Modify("sys_fields_default_value.dddw.name = 'd_dddw_company_list' sys_fields_default_value.dddw.datacolumn ='facility_id' sys_fields_default_value.dddw.displaycolumn = 'facility_name'")
			
			//Reset the dddw data for sys_fields_lookup_field_name field -- jervis 04.15.2011
			of_set_dispalyname_dddw()
			
			
			this.SetItem(row,'sys_fields_lookup_code','A')  //Default to our company
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
		case 'N','E'
		case 'B' //Jervis 07.18.2011
			
	end choose

end if
//---------------------------- APPEON END ----------------------------

IF dwo.name = "sys_fields_lookup_field_name" OR dwo.name = "sys_fields_lookup_code" THEN

	This.GetChild( "sys_fields_default_value", dwchild )
	dwchild.SetTransObject( SQLCA )
	IF dwo.name = "sys_fields_lookup_code" THEN
		dwchild.Retrieve( data )
	ELSE
		dwchild.Retrieve( This.GetItemString( row, "sys_fields_lookup_code" ))
	END IF
END IF
//--------------------------- APPEON BEGIN ---------------------------
//$<add> 05.06.2007 By: Jack
//$<reason> Fix a defect.
this.accepttext()
IF dwo.name = "data_view_fields_visible"  Then
	If this.getitemstring(this.getrow(),'data_view_fields_visible') = 'N' Then
		If this.getitemstring(this.getrow(),'data_view_fields_required') = 'Y' Then
			messagebox('Prompt','System will automatically set the Required property to False when the Visible property is set to False. This will cause saving failure if the field is not allowed to be null in the database.')
			this.setitem(this.getrow(),'data_view_fields_required','N')
//			w_contract_data_design.uo_design.POST of_set_dw_properties('data_view_fields_required', 1) //Modify by Evan 07.18.2008, add flag in argument lists
//			w_contract_data_design.uo_design.POST of_set_dw_properties('data_view_fields_required', 2)	//modified by Nova.zhang on 2008-12-09
			inv_data_design.POST of_set_dw_properties('data_view_fields_required', 2)	//Modified by gavin on 2009-03-05
		End If
	End If
End If
IF dwo.name = "data_view_fields_required"  Then
	If this.getitemstring(this.getrow(),'data_view_fields_required') = 'N' Then
		messagebox('Prompt','When the Required property is set to False, saving error may occur if the field is not allowed to be null in the database.')
	End If
End If

//---------------------------- APPEON END ----------------------------

//w_contract_data_design.uo_design.POST of_set_dw_properties(dwo.name, 2) //Modify by Evan 07.18.2008, add flag in argument lists
inv_data_design.POST of_set_dw_properties(dwo.name, 2) //Modify by Evan 07.18.2008, add flag in argument lists
Post of_SetButtonEnabled(1) //Add by Evan 01.30.2008


end event

event buttonclicked;call super::buttonclicked;long ll_Color
window lw_Temp
String			ls_Column,ls_Default, ls_color
str_Pass		lstr_Pass

this.AcceptText()
if Row <=0 then Return

choose case dwo.name
	case "b_text_color"
		ll_Color = this.object.fields_label_textcolor[Row]
		of_ParseColor(ll_Color)
		if ChooseColor(ll_Color,gl_custom_colors[]) = 1 then
			this.object.fields_label_textcolor[Row] = ll_Color
			this.SetColumn("fields_label_textcolor")
			this.Event ItemChanged(Row, this.object.fields_label_textcolor, String(ll_Color))
			This.Modify( "b_font_colorexpress.color = '0'" )	
			this.SetItem(row,'label_fontcolorexpress',"")
			this.Modify( "fields_label_textcolor.protect = 0" )
		end if
	case "b_text_color_def"
		this.object.fields_label_textcolor[Row] = 33554432
		this.SetColumn("fields_label_textcolor")
		this.Event ItemChanged(Row, this.object.fields_label_textcolor, "33554432")
		This.Modify( "b_font_colorexpress.color = '0'" )	
		this.SetItem(row,'label_fontcolorexpress',"")
		this.Modify( "fields_label_textcolor.protect = 0" )
	case "b_text_bk_color"
		ll_Color = this.object.fields_label_textbkcolor[Row]
		of_ParseColor(ll_Color)
		if ChooseColor(ll_Color,gl_custom_colors[]) = 1 then
			this.object.fields_label_textbkcolor[Row] = ll_Color
			this.SetColumn("fields_label_textbkcolor")
			this.Event ItemChanged(Row, this.object.fields_label_textbkcolor, String(ll_Color))
			This.Modify( "b_background_colorexpress.color = '0'" )	
			this.SetItem(row,'label_backgroundcolorexpress',"")	
			this.Modify( "fields_label_textbkcolor.protect = 0" )
		end if
	case "b_text_bk_color_def"
		this.object.fields_label_textbkcolor[Row] = 67108864
		this.SetColumn("fields_label_textbkcolor")
		this.Event ItemChanged(Row, this.object.fields_label_textbkcolor, "67108864")
		This.Modify( "b_background_colorexpress.color = '0'" )	
		this.SetItem(row,'label_backgroundcolorexpress',"")
		this.Modify( "fields_label_textbkcolor.protect = 0" )
	
	//BEGIN---Modify by Scofield on 2009-08-27
	case "b_fields_textcolor"
		ll_Color = this.object.fields_textcolor[Row]
		of_ParseColor(ll_Color)
		if ChooseColor(ll_Color,gl_custom_colors[]) = 1 then
			this.object.fields_textcolor[Row] = ll_Color
			this.SetColumn("fields_textcolor")
			this.Event ItemChanged(Row, this.object.fields_textcolor, String(ll_Color))
		end if
	case "b_fields_textcolor_def"
		this.object.fields_textcolor[Row] = 0
		this.SetColumn("fields_textcolor")
		this.Event ItemChanged(Row, this.object.fields_textcolor, "0")
		
	case "b_fields_textbkcolor"
		ll_Color = this.object.fields_textbkcolor[Row]
		of_ParseColor(ll_Color)
		if ChooseColor(ll_Color,gl_custom_colors[]) = 1 then
			this.object.fields_textbkcolor[Row] = ll_Color
			this.SetColumn("fields_textbkcolor")
			this.Event ItemChanged(Row, this.object.fields_textbkcolor, String(ll_Color))
		end if
	case "b_fields_textbkcolor_def"
		this.object.fields_textbkcolor[Row] = 16777215
		this.SetColumn("fields_textbkcolor")
		this.Event ItemChanged(Row, this.object.fields_textbkcolor, "16777215")
	case "b_lookup"
		If isvalid(w_lookup_maint) Then
			w_lookup_maint.bringtotop = True
			w_lookup_maint.Event ue_change_lookupname(this.GetItemString(row,'sys_fields_lookup_code'))
		Else
			OpenSheetwithparm(w_lookup_maint,this.GetItemString(row,'sys_fields_lookup_code'), w_mdi, 4, original!) //Add parm -- jervis 11.26.2009
		End If
		This.SetColumn("sys_fields_lookup_code")
		
		lw_Temp = tab_properties.GetParent( )
		
		If IsValid( lw_Temp ) Then close( lw_Temp  )
	//END---Modify by Scofield on 2009-08-27
	case 'b_background_colorexpress' 
		
		ls_Column = 'label_backgroundcolorexpress'
		
		ls_color =  this.GetItemString(row,ls_Column )
		If Pos( ls_color, '~t' ) > 0 Then ls_color = Mid( ls_color, pos( ls_color, '~t' ) + 1 ) 
		If right( ls_color , 1 ) = '"' or right( ls_color, 1 ) = "'" Then ls_color = left( ls_color, len( ls_color ) - 1 )
		lstr_pass.s_long[1] = 5	
		lstr_pass.s_string          = ls_color
		lstr_pass.as_search_type = "background.color"
		lstr_pass.s_string_array[1] = this.GetItemString( row,'sys_fields_field_name') + "_t"
		lstr_pass.s_string_array[2] = "column"
		ls_Default =  String( this.GetItemNumber( row, 'fields_label_textbkcolor' ) )
		If IsNull( ls_Default ) Or Trim( ls_Default ) = '' Then ls_Default = '0'
		lstr_pass.s_string_array[3] =ls_Default
		lstr_pass.s_u_dw            = idw_band
		OpenWithParm(w_export_expression,lstr_pass)
		lstr_pass = Message.PowerObjectParm
		if isvalid(lstr_pass) then
			if  trim(lstr_pass.s_string) <> "" then
				this.SetItem(row,ls_Column,lstr_pass.s_string)
				this.Event ItemChanged( Row, this.object.label_backgroundcolorexpress, lstr_pass.s_string)
				this.Modify( "fields_label_textbkcolor.protect = 1" )
				This.Modify( "b_background_colorexpress.color = '16711935'" )	
			Else
				this.SetItem(row,ls_Column,"")
				this.Event ItemChanged( Row, this.object.fields_label_textbkcolor,  String( GetItemNumber( row, 'fields_label_textbkcolor' ) ) )
				this.Modify( "fields_label_textbkcolor.protect = 0" )
				This.Modify( "b_background_colorexpress.color = '0'" )	
			end if
		end if
	case 'b_font_colorexpress' 
		
		ls_Column = 'label_fontcolorexpress'
		
		ls_color =  this.GetItemString(row,ls_Column )
		If Pos( ls_color, '~t' ) > 0 Then ls_color = Mid( ls_color, pos( ls_color, '~t' ) + 1 ) 
		If right( ls_color , 1 ) = '"' or right( ls_color, 1 ) = "'" Then ls_color = left( ls_color, len( ls_color ) - 1 )
		lstr_pass.s_long[1] = 5	
		lstr_pass.s_string          = ls_color
		lstr_pass.as_search_type = "color"
		lstr_pass.s_string_array[1] = this.GetItemString( row,'sys_fields_field_name') + "_t"
		lstr_pass.s_string_array[2] = "text"
		ls_Default =  String ( this.GetItemNumber( row, 'fields_label_textcolor' ) )
		If IsNull( ls_Default ) Or Trim( ls_Default ) = '' Then ls_Default = '0'
		lstr_pass.s_string_array[3] =ls_Default
		lstr_pass.s_u_dw            = idw_band
		OpenWithParm(w_export_expression,lstr_pass)
		lstr_pass = Message.PowerObjectParm
		if isvalid(lstr_pass) then
			if  trim(lstr_pass.s_string) <> "" then
				this.SetItem(row,ls_Column,lstr_pass.s_string)
				this.Event ItemChanged( Row, this.object.label_fontcolorexpress, lstr_pass.s_string)
				this.Modify( "fields_label_textcolor.protect = 1" )
				This.Modify( "b_font_colorexpress.color = '16711935'" )	
			Else
				this.SetItem(row,ls_Column,"")
				this.Event ItemChanged( Row, this.object.fields_label_textcolor, String(  GetItemNumber( row, 'fields_label_textcolor' ) ) )
				this.Modify( "fields_label_textcolor.protect = 0" )
				This.Modify( "b_font_colorexpress.color = '0'" )	
			end if
		end if		
end choose

Event ue_BringToTop( )
end event

event editchanged;call super::editchanged;

If IsNull( data ) Or Trim( data ) = ''  Or Not IsNumber( data )  Then Return
choose case dwo.name 
	case "fields_label_textcolor", "fields_label_textbkcolor", "fields_textcolor", "fields_textbkcolor"
		of_showcolor( string( dwo.name) , data )
end choose
end event

event itemerror;call super::itemerror;Return 3
end event

event losefocus;call super::losefocus;AcceptText( )
end event

type tabpage_1 from userobject within tab_properties
integer x = 18
integer y = 100
integer width = 1915
integer height = 1884
long backcolor = 67108864
string text = "Special Attribute"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
ddlb_2 ddlb_2
st_4 st_4
rb_4 rb_4
cb_1 cb_1
ddlb_1 ddlb_1
st_3 st_3
rb_3 rb_3
rb_2 rb_2
rb_1 rb_1
gb_1 gb_1
end type

on tabpage_1.create
this.ddlb_2=create ddlb_2
this.st_4=create st_4
this.rb_4=create rb_4
this.cb_1=create cb_1
this.ddlb_1=create ddlb_1
this.st_3=create st_3
this.rb_3=create rb_3
this.rb_2=create rb_2
this.rb_1=create rb_1
this.gb_1=create gb_1
this.Control[]={this.ddlb_2,&
this.st_4,&
this.rb_4,&
this.cb_1,&
this.ddlb_1,&
this.st_3,&
this.rb_3,&
this.rb_2,&
this.rb_1,&
this.gb_1}
end on

on tabpage_1.destroy
destroy(this.ddlb_2)
destroy(this.st_4)
destroy(this.rb_4)
destroy(this.cb_1)
destroy(this.ddlb_1)
destroy(this.st_3)
destroy(this.rb_3)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.gb_1)
end on

type ddlb_2 from dropdownlistbox within tabpage_1
integer x = 1125
integer y = 288
integer width = 494
integer height = 264
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 16777215
boolean sorted = false
boolean vscrollbar = true
string item[] = {"###","#####-###"}
end type

event selectionchanged;ib_change_special_attribute = true
end event

type st_4 from statictext within tabpage_1
integer x = 951
integer y = 300
integer width = 183
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Format:"
boolean focusrectangle = false
end type

type rb_4 from radiobutton within tabpage_1
integer x = 96
integer y = 300
integer width = 841
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Auto Number for a child contract"
end type

event clicked;ib_change_special_attribute = true
end event

type cb_1 from u_cb within tabpage_1
integer x = 1394
integer y = 804
integer width = 343
integer taborder = 70
boolean bringtotop = true
string text = "&Save"
end type

event clicked;call super::clicked; //Added By Jay Chen 11-17-2014
if tab_properties.tabpage_1.visible and ib_change_special_attribute  then
	of_save_special_data()
	ib_change_special_attribute = false
end if
//end add
end event

type ddlb_1 from dropdownlistbox within tabpage_1
integer x = 1125
integer y = 108
integer width = 494
integer height = 264
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 16777215
boolean sorted = false
boolean vscrollbar = true
string item[] = {"###","#####-###"}
end type

event selectionchanged;ib_change_special_attribute = true
end event

type st_3 from statictext within tabpage_1
integer x = 951
integer y = 120
integer width = 183
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Format:"
boolean focusrectangle = false
end type

type rb_3 from radiobutton within tabpage_1
integer x = 96
integer y = 660
integer width = 1280
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Accumulative Sum"
end type

event clicked;ib_change_special_attribute = true
end event

type rb_2 from radiobutton within tabpage_1
integer x = 96
integer y = 480
integer width = 1280
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Source Field for Accumulative Sum"
end type

event clicked;ib_change_special_attribute = true
end event

type rb_1 from radiobutton within tabpage_1
integer x = 96
integer y = 120
integer width = 841
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Auto Number for a sibling contract"
end type

event clicked;ib_change_special_attribute = true
end event

type gb_1 from groupbox within tabpage_1
integer x = 18
integer y = 12
integer width = 1742
integer height = 936
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
end type

type cb_datafill from u_cb within w_contract_field_properties
integer x = 1230
integer y = 2052
integer width = 343
integer taborder = 50
boolean bringtotop = true
string text = "&Data Fill..."
end type

event clicked;call super::clicked;String	ls_ColType

ls_ColType = dw_properties.GetItemString(1,"sys_fields_field_type")

if Upper(ls_ColType) = Upper("DateTime") or Upper(ls_ColType) = Upper("Date") then
	OpenWithParm(w_contract_field_properties_dt_fill,'')
else
	OpenWithParm(w_contract_field_properties_datafill,'')
end if

end event

type cb_cancel from u_cb within w_contract_field_properties
integer x = 1591
integer y = 2052
integer width = 343
integer taborder = 30
boolean bringtotop = true
string text = "&Close"
boolean default = true
end type

event clicked;//BEGIN---Modify by Scofield on 2009-09-29
String 	ls_FieldName,ls_Visible, ls_TCol,ls_sync_screen_contact
long		ll_Row,ll_AlwaysUpdate,ll_RtnVal,ll_rtn

ll_Row = dw_Properties.GetRow()

dw_Properties.AcceptText()

//Added By Ken.Guo 11/26/2013. popup message if user set the same value for check on or off.
If dw_Properties.GetItemString(ll_row, "sys_fields_lookup_field") = 'B' Then
	If (dw_Properties.GetItemString(ll_row, "fields_cbx_on") = dw_Properties.GetItemString(ll_row, "fields_cbx_off")) &
	   Or ( isnull(dw_Properties.GetItemString(ll_row, "fields_cbx_on")) and isnull(dw_Properties.GetItemString(ll_row, "fields_cbx_off")) )	Then
		Messagebox('Field Properties','It is recommended that you do not use the same value for both the Data Value for On and the Data Value for Off.')
		tab_properties.SelectTab(2)
		tab_properties.tabpage_edit.dw_3.SetColumn('fields_cbx_on')
		tab_properties.tabpage_edit.dw_3.SetFocus()
		Return 
	End If
End If

//Added By Ken.Guo 2016-08-16
String ls_expression
If dw_Properties.GetItemNumber(ll_row, "field_use_compute") = 1 Then
	ls_expression = dw_Properties.GetItemString(ll_row, "field_compute_expression") 
	If Trim(ls_expression) = '' or isnull(ls_expression) Then	
		tab_properties.SelectTab(2)
		tab_properties.tabpage_edit.dw_3.SetColumn('field_compute_expression')
		tab_properties.tabpage_edit.dw_3.SetFocus()	
		messagebox('Field Properties','The compute expression is empty. Please click the "E" button to set it.')	
		Return 
	End If
End If


ls_FieldName = dw_Properties.GetItemString(ll_Row,"sys_fields_field_name")

ls_Visible = dw_properties.GetItemString(ll_Row, "data_view_fields_visible")
if ls_Visible = "N" then
	dw_properties.SetItem(ll_Row, "data_view_fields_field_label",ls_FieldName)
	inv_data_design.Post of_set_dw_properties("data_view_fields_field_label", 2)
end if

if inv_data_design.is_open_style = "screen" and inv_data_design.ib_HasNewModify and inv_data_design.ii_Screen_id >=3 and inv_data_design.ii_Screen_id <= 10   Then
	If	( inv_data_design.ii_Screen_id >=6 and inv_data_design.ii_Screen_id  <=7  and Pos( lower(ls_FieldName),'owner' ) > 0 )  then
		inv_data_design.Post of_AutoUpdateSearchScreen(ls_FieldName, 'owner' )		
	ElseIf Not( inv_data_design.ii_Screen_id >=6 and inv_data_design.ii_Screen_id  <=7 ) Then
		if inv_data_design.ii_Screen_id = 10 then //Added By Jay Chen 07-03-2014
			ls_TCol = 'custom2_' + ls_FieldName
			inv_data_design.Post of_AutoUpdateSearchScreen(ls_FieldName, ls_TCol )	
			inv_data_design.Post of_AutoUpdateDetailScreen(ls_FieldName)
		else
			inv_data_design.Post of_AutoUpdateSearchScreen(ls_FieldName)
			inv_data_design.Post of_AutoUpdateDetailScreen(ls_FieldName)	//Jervis 10.21.2010
		end if
	End If
//Added By Mark Lee 11/14/2014
elseif (inv_data_design.is_open_style = "screen" and inv_data_design.ib_HasNewModify and (inv_data_design.ii_Screen_id = 53 or inv_data_design.ii_Screen_id  =54)) Then
	inv_data_design.Post of_AutoUpdateScreen("Custom Multi",ls_FieldName)	
end if
//END---Modify by Scofield on 2009-09-29
//added by gavins 20120329
if inv_data_design.is_open_style = "screen" and inv_data_design.ib_HasNewModify and ( inv_data_design.ii_Screen_id = 6 Or inv_data_design.ii_Screen_id = 7 or inv_data_design.ii_Screen_id = 1) then //Added By Jay Chen 11-30-2015 add screen = 1 
	if inv_data_design.ii_Screen_id <> 1 then //Added By Jay Chen 11-30-2015
		If inv_data_design.ii_Screen_id = 6 Then
			ls_TCol = 'ccci_' + ls_FieldName
		Else
			ls_TCol = 'occi_' + ls_FieldName
		ENd If
		If Pos(  'association,custom_n1, custom_1' , lower(ls_FieldName) ) > 0  Or  Pos(  'association_t,custom_n1_t, custom_1_t' , lower(ls_FieldName) ) > 0  Then
			inv_data_design.Post of_AutoUpdateSearchScreen(ls_FieldName, ls_TCol )		
	//		inv_data_design.Post of_AutoUpdateSearchScreen(ls_FieldName, ls_TCol )	
		End If
	end if
	
	//Added By Jay Chen 10-27-2015
	ls_sync_screen_contact = gnv_data.of_getitem("icred_settings", "sync_screen_contact", false)
	if isnull(ls_sync_screen_contact) then ls_sync_screen_contact = '0'
	if ls_sync_screen_contact = '1' then
		if left(lower(ls_FieldName),20) = 'ctx_contacts_custom_' or left(lower(ls_FieldName),20) = 'app_facility_custom_' then
			//Added By Jay Chen 12-15-2015
			if Not inv_data_design.ib_alwayssync then
				if inv_data_design.ib_alwayssync then 
					ll_AlwaysUpdate = 10 
				else 
					ll_AlwaysUpdate = 0
				end if
				OpenWithParm(w_sync_confirm,String(ll_AlwaysUpdate))
				ll_RtnVal = Message.DoubleParm
				if ll_RtnVal >= 10 then
					inv_data_design.ib_alwayssync = true
				else
					inv_data_design.ib_alwayssync = false
				end if
				ll_rtn = Mod(ll_RtnVal,2) 
			else
				ll_rtn = 1
			end if
			//end
			if ll_rtn = 1 then
//			if Messagebox("Confirm Sync","Do you want to sync the labels and style to the Contact Window?",Question!,YesNo!) = 1 then
				inv_data_design.of_auto_update_contact_custom(ls_FieldName)
				//Added By Jay Chen 11-30-2015 sync search screen and contract contact screen
				if left(lower(ls_FieldName),20) = 'app_facility_custom_' then
					if inv_data_design.ii_Screen_id = 1 then
						inv_data_design.of_auto_update_contactsyntax(6, ls_FieldName)
						inv_data_design.of_auto_update_contactsyntax(7, ls_FieldName)
					elseif inv_data_design.ii_Screen_id = 6 then
						inv_data_design.of_auto_update_contactsyntax(1, ls_FieldName)
						inv_data_design.of_auto_update_contactsyntax(7, ls_FieldName)
					elseif inv_data_design.ii_Screen_id = 7 then
						inv_data_design.of_auto_update_contactsyntax(1, ls_FieldName)
						inv_data_design.of_auto_update_contactsyntax(6, ls_FieldName)
					end if
				end if
				//end
			end if
		end if
	end if
	//end

End If
//added by gavins 20120607
if inv_data_design.is_open_style = "screen" and inv_data_design.ib_HasNewModify and ( inv_data_design.ii_Screen_id =31 ) then
	ls_TCol = 'feesched_' + ls_FieldName
	inv_data_design.Post of_AutoUpdateSearchScreen(ls_FieldName, ls_TCol )		
//	inv_data_design.Post of_AutoUpdateSearchScreen(ls_FieldName, ls_TCol )	
	
End If
If inv_data_design.is_open_style = "screen" and inv_data_design.ib_HasNewModify and ( inv_data_design.ii_Screen_id =51 or inv_data_design.ii_Screen_id =52 Or inv_data_design.ii_Screen_id =56 ) then
	inv_data_design.Post of_AutoUpdateDocumentScreen(ls_FieldName )	
End If

//Added By Jay Chen 01-20-2014
inv_data_design.of_Refresh_Object_Inforamtion()

//Added By Jay Chen 07-20-2015

string ls_tip
long ll_find,ll_insert
tab_properties.tabpage_edit.dw_3.AcceptText()
/*
ls_tip = tab_properties.tabpage_edit.dw_3.getitemstring(1,"field_tip")
//if len(ls_tip) > 0 then inv_data_design.is_field_tip_new = ls_tip
inv_data_design.is_field_tip_new = ls_tip
if inv_data_design.is_field_tip_new <> inv_data_design.is_field_tip_old then
	//Added By Harry 2016-11-08
	ll_find = inv_data_design.ids_field_tip.find("field_name = '"+is_field_name+"'",1,inv_data_design.ids_field_tip.rowcount())
	if isnull(ll_find) then ll_find = 0
	if ll_find = 0 then
		ll_insert = inv_data_design.ids_field_tip.insertrow(0)
		inv_data_design.ids_field_tip.setitem(ll_insert,"field_name",is_field_name)
		inv_data_design.ids_field_tip.setitem(ll_insert,"field_value",inv_data_design.is_field_tip_new)
		inv_data_design.ids_field_tip.setitem(ll_insert,"data_view_id",inv_data_design.il_data_view)
		inv_data_design.ids_field_tip.setitem(ll_insert,"screen_id",inv_data_design.ii_screen_id)
	else
		inv_data_design.ids_field_tip.setitem(ll_find,"field_value",inv_data_design.is_field_tip_new)
	end if
	//end 
	if IsValid(m_pfe_cst_contract_data_design) then
		gnv_app.of_modify_menu_attr( m_pfe_cst_contract_data_design.m_file.m_save,'Enabled', true)
		inv_data_design.ib_field_tip = true  //Added By Harry 2016-11-08
	end if 
end if
*/

//end

//Added By Jay Chen 12-22-2015
string ls_multi_select
//long ll_find,ll_insert
if (inv_data_design.ii_screen_id = 9 or inv_data_design.ii_screen_id = 10) and left(is_field_name,7) = 'custom_' and left(is_field_type,4) = 'char' then
	ls_multi_select = tab_properties.tabpage_edit.dw_3.getitemstring(1,"fields_multi_select")
	if isnull(ls_multi_select) then ls_multi_select = ''
	if ls_multi_select = '' then ls_multi_select = 'N'
	if len(ls_multi_select) > 0 then inv_data_design.is_multi_select_new = ls_multi_select
	if inv_data_design.is_multi_select_new <> inv_data_design.is_multi_select_old then
		if IsValid(m_pfe_cst_contract_data_design) then
			gnv_app.of_modify_menu_attr( m_pfe_cst_contract_data_design.m_file.m_save,'Enabled', true)
		end if
		//Added By Jay Chen 01-20-2016
		if not isvalid(inv_data_design.ids_select_item_attribute) then 
			inv_data_design.ids_select_item_attribute = create datastore
			inv_data_design.ids_select_item_attribute.dataobject = 'dw_select_item_attribute'
		end if
		ll_find = inv_data_design.ids_select_item_attribute.find("field_name = '"+is_field_name+"'",1,inv_data_design.ids_select_item_attribute.rowcount())
		if isnull(ll_find) then ll_find = 0
		if ll_find = 0 then
			ll_insert = inv_data_design.ids_select_item_attribute.insertrow(0)
			inv_data_design.ids_select_item_attribute.setitem(ll_insert,"field_name",is_field_name)
			inv_data_design.ids_select_item_attribute.setitem(ll_insert,"field_value",ls_multi_select)
		else
			inv_data_design.ids_select_item_attribute.setitem(ll_find,"field_value",ls_multi_select)
		end if
		//end
	end if
end if
//end

Close(Parent)

end event

type st_1 from statictext within w_contract_field_properties
boolean visible = false
integer x = 2107
integer y = 2012
integer width = 855
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 16711680
long backcolor = 67108864
boolean enabled = false
string text = "Fields in BLUE are View specific. "
boolean focusrectangle = false
end type

type st_2 from statictext within w_contract_field_properties
boolean visible = false
integer x = 2107
integer y = 2072
integer width = 914
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 255
long backcolor = 67108864
boolean enabled = false
string text = "If Required is RED, it cannot be changed."
boolean focusrectangle = false
end type

type cb_ok from u_cb within w_contract_field_properties
boolean visible = false
integer x = 1947
integer y = 2304
integer width = 343
integer taborder = 40
string text = "&OK"
end type

event clicked;Close( Parent )

end event

type dw_properties from u_dw within w_contract_field_properties
boolean visible = false
integer x = 2606
integer y = 2048
integer width = 1184
integer height = 524
integer taborder = 10
string dataobject = "d_contract_field_properties"
boolean vscrollbar = false
boolean livescroll = false
end type

event itemchanged;call super::itemchanged;String 	ls_lookup_field,ls_FieldName
long		ll_ViewId,ll_ScreenId,ll_Count,ll_RtnVal
Integer	li_Rtn
DataWindowChild dwchild

//BEGIN---Add by Evan 07/24/2008
choose case dwo.name 
	case "fields_label_textcolor", "fields_label_textbkcolor", "fields_textcolor", "fields_textbkcolor"
		of_ShowColor()
end choose
//END---Add by Evan 07/24/2008

//BEGIN---Modify by Scofield on 2010-02-02
if Lower(dwo.Name) = Lower("Fields_AutoHeight") then
	if Lower(Data) = Lower("Yes") then
		ll_RtnVal = MessageBox(gnv_app.iapp_object.DisplayName,"Turning On auto height will adjust the height of the field dynamically during runtime but can slow down the retrieval of data during runtime. Continue?",Question!,YesNo!,2)
		if ll_RtnVal <> 1 then
			This.Post SetItem(This.GetRow(),"Fields_AutoHeight",Lower("No"))
			Return
		end if
	end if
end if
//END---Modify by Scofield on 2010-02-02

//--------------------------- APPEON BEGIN ---------------------------
//$<  Add > 2007-10-25 By: Scofield
//$<Reason> Clear the Data Fill if lookup field is not selected

if dwo.name = 'sys_fields_lookup_field' then
	if data <> 'Y' then //if data = 'N' then -- jervis 12.4.2009
		ll_ViewId = inv_data_design.il_data_view                      //Modified by gavin on 2009-03-05
		ll_ScreenId = inv_data_design.ii_screen_id   					  //Modified by gavin on 2009-03-05
		ls_FieldName = dw_properties.GetItemString(1,'sys_fields_field_name')
		
		Select Count(*)
		  into :ll_Count
		  from ctx_screen_datafill
		 where data_view_id = :ll_ViewId and screen_id = :ll_ScreenId  and field_name = :ls_FieldName ;
		
		if ll_Count > 0 then
			li_Rtn = MessageBox(gnv_app.iapp_object.DisplayName,'If this property is set to "No", all data you defined for the current field in the ~r~nData Fill Properties dialog will be removed. ~r~n~r~nDo you want to continue?',Question!,YesNo!,2)
			if li_Rtn = 2 then
				dw_properties.Post SetItem(1,'sys_fields_lookup_field','Y')
				Post of_SetButtonEnabled(1) //Add by Evan 01.30.2008
				return
			else
				delete from ctx_screen_datafill  
						where data_view_id = :ll_ViewId and screen_id = :ll_ScreenId  and field_name = :ls_FieldName ;
			end if
		end if
		//cb_datafill.Enabled = false
	end if
	
	//Set dddw for default- jervis 12.5.2009
	choose case data
		case 'Y'
			this.Modify("sys_fields_lookup_code.dddw.name = 'd_dddw_lookup_select_for_contract' sys_fields_lookup_code.dddw.datacolumn ='lookup_name' sys_fields_lookup_code.dddw.displaycolumn = 'lookup_name'")
			This.GetChild( "sys_fields_lookup_code", dwchild )
			dwchild.SetTransObject( SQLCA )
			dwchild.Retrieve( )
	
			this.Modify("sys_fields_default_value.dddw.name = 'd_dddw_code_lookup' sys_fields_default_value.dddw.datacolumn ='lookup_code' sys_fields_default_value.dddw.displaycolumn = 'code'")
			this.Modify("sys_fields_lookup_field_name.dddw.name ='d_dddw_lookup_fld_nms_code'") //Reset the dddw of display name field - jervis 04.15.2011
			this.SetItem(row,'sys_fields_lookup_field_name','')
			this.event ItemChanged(row,this.object.sys_fields_lookup_field_name,'')
			this.SetItem(row,'sys_fields_lookup_code','')
			this.event ItemChanged(row,this.object.sys_fields_lookup_code,'')
		case 'C'
			this.Modify("sys_fields_lookup_code.dddw.name = 'd_dddw_company_type' sys_fields_lookup_code.dddw.datacolumn ='company_type' sys_fields_lookup_code.dddw.displaycolumn = 'company_desc'")
			this.Modify("sys_fields_default_value.dddw.name = 'd_dddw_company_list' sys_fields_default_value.dddw.datacolumn ='facility_id' sys_fields_default_value.dddw.displaycolumn = 'facility_name'")
			
			//Reset the dddw data for sys_fields_lookup_field_name field -- jervis 04.15.2011
			of_set_dispalyname_dddw()
			
			
			this.SetItem(row,'sys_fields_lookup_code','A')  //Default to our company
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
		case 'N','E'
		case 'B' //Jervis 07.18.2011
			
	end choose

end if
//---------------------------- APPEON END ----------------------------

IF dwo.name = "sys_fields_lookup_field_name" OR dwo.name = "sys_fields_lookup_code" THEN

	This.GetChild( "sys_fields_default_value", dwchild )
	dwchild.SetTransObject( SQLCA )
	IF dwo.name = "sys_fields_lookup_code" THEN
		dwchild.Retrieve( data )
	ELSE
		dwchild.Retrieve( This.GetItemString( row, "sys_fields_lookup_code" ))
	END IF
END IF
//--------------------------- APPEON BEGIN ---------------------------
//$<add> 05.06.2007 By: Jack
//$<reason> Fix a defect.
this.accepttext()
IF dwo.name = "data_view_fields_visible"  Then
	If this.getitemstring(this.getrow(),'data_view_fields_visible') = 'N' Then
		If this.getitemstring(this.getrow(),'data_view_fields_required') = 'Y' Then
			messagebox('Prompt','System will automatically set the Required property to False when the Visible property is set to False. This will cause saving failure if the field is not allowed to be null in the database.')
			this.setitem(this.getrow(),'data_view_fields_required','N')
//			w_contract_data_design.uo_design.POST of_set_dw_properties('data_view_fields_required', 1) //Modify by Evan 07.18.2008, add flag in argument lists
//			w_contract_data_design.uo_design.POST of_set_dw_properties('data_view_fields_required', 2)	//modified by Nova.zhang on 2008-12-09
			inv_data_design.POST of_set_dw_properties('data_view_fields_required', 2)	//Modified by gavin on 2009-03-05
		End If
	End If
End If
IF dwo.name = "data_view_fields_required"  Then
	If this.getitemstring(this.getrow(),'data_view_fields_required') = 'N' Then
		messagebox('Prompt','When the Required property is set to False, saving error may occur if the field is not allowed to be null in the database.')
	End If
End If

//---------------------------- APPEON END ----------------------------

//w_contract_data_design.uo_design.POST of_set_dw_properties(dwo.name, 2) //Modify by Evan 07.18.2008, add flag in argument lists
inv_data_design.POST of_set_dw_properties(dwo.name, 2) //Modify by Evan 07.18.2008, add flag in argument lists
Post of_SetButtonEnabled(1) //Add by Evan 01.30.2008

if dwo.Name = "data_view_fields_field_label" or dwo.Name = "sys_fields_lookup_code" or dwo.Name = "sys_fields_lookup_field_name" or dwo.Name = "sys_fields_field_mask" then
	inv_data_design.ib_HasNewModify = true
end if

end event

event constructor;call super::constructor;This.of_SetUpdateable(False)

end event

event itemfocuschanged;call super::itemfocuschanged;String ls_col_type
DataWindowChild dwchild	

IF This.GetColumnName() = "sys_fields_default_value" THEN
	String ls_field_name
	ls_field_name = Upper( This.GetItemString( row, "sys_fields_lookup_field_name" ) )

	//Begin - Modified By Ken.Guo 2010-10-14
	/*
		This.GetChild( "sys_fields_default_value" , dwchild )
		dwchild.SetTransObject( SQLCA )
		dwchild.Retrieve( This.GetItemString( row, "sys_fields_lookup_code" ) )	
	*/
	ls_col_type = This.GetItemString(row,'sys_fields_field_type')
	If Left(ls_col_type,4) = 'date' or Left(ls_col_type,4) = 'time' Then
		This.Modify("sys_fields_default_value.DDDW.DataColumn = 'code'")
		This.GetChild( "sys_fields_default_value" , dwchild )
		dwchild.SetTransObject( SQLCA )
		dwchild.InsertRow(0)
		dwchild.SetItem(1,'code','Today')
		dwchild.SetItem(1,'lookup_code',-999)
	Else
		This.Modify("sys_fields_default_value.DDDW.DataColumn = 'lookup_code'")
		This.GetChild( "sys_fields_default_value" , dwchild )
		dwchild.SetTransObject( SQLCA )
		dwchild.Retrieve( This.GetItemString( row, "sys_fields_lookup_code" ) )			
	End If
	//End - Modified By Ken.Guo 2010-10-14
	
END IF
end event

event buttonclicked;call super::buttonclicked;long ll_Color

this.AcceptText()
if Row <=0 then Return

choose case dwo.name
	case "b_text_color"
		ll_Color = this.object.fields_label_textcolor[Row]
		of_ParseColor(ll_Color)
		if ChooseColor(ll_Color,gl_custom_colors[]) = 1 then
			this.object.fields_label_textcolor[Row] = ll_Color
			this.SetColumn("fields_label_textcolor")
			this.Event ItemChanged(Row, this.object.fields_label_textcolor, String(ll_Color))
		end if
	case "b_text_color_def"
		this.object.fields_label_textcolor[Row] = 33554432
		this.SetColumn("fields_label_textcolor")
		this.Event ItemChanged(Row, this.object.fields_label_textcolor, "33554432")
		
	case "b_text_bk_color"
		ll_Color = this.object.fields_label_textbkcolor[Row]
		of_ParseColor(ll_Color)
		if ChooseColor(ll_Color,gl_custom_colors[]) = 1 then
			this.object.fields_label_textbkcolor[Row] = ll_Color
			this.SetColumn("fields_label_textbkcolor")
			this.Event ItemChanged(Row, this.object.fields_label_textbkcolor, String(ll_Color))
		end if
	case "b_text_bk_color_def"
		this.object.fields_label_textbkcolor[Row] = 67108864
		this.SetColumn("fields_label_textbkcolor")
		this.Event ItemChanged(Row, this.object.fields_label_textbkcolor, "67108864")
	
	//BEGIN---Modify by Scofield on 2009-08-27
	case "b_fields_textcolor"
		ll_Color = this.object.fields_textcolor[Row]
		of_ParseColor(ll_Color)
		if ChooseColor(ll_Color,gl_custom_colors[]) = 1 then
			this.object.fields_textcolor[Row] = ll_Color
			this.SetColumn("fields_textcolor")
			this.Event ItemChanged(Row, this.object.fields_textcolor, String(ll_Color))
		end if
	case "b_fields_textcolor_def"
		this.object.fields_textcolor[Row] = 0
		this.SetColumn("fields_textcolor")
		this.Event ItemChanged(Row, this.object.fields_textcolor, "0")
		
	case "b_fields_textbkcolor"
		ll_Color = this.object.fields_textbkcolor[Row]
		of_ParseColor(ll_Color)
		if ChooseColor(ll_Color,gl_custom_colors[]) = 1 then
			this.object.fields_textbkcolor[Row] = ll_Color
			this.SetColumn("fields_textbkcolor")
			this.Event ItemChanged(Row, this.object.fields_textbkcolor, String(ll_Color))
		end if
	case "b_fields_textbkcolor_def"
		this.object.fields_textbkcolor[Row] = 16777215
		this.SetColumn("fields_textbkcolor")
		this.Event ItemChanged(Row, this.object.fields_textbkcolor, "16777215")
	case "b_lookup"
		If isvalid(w_lookup_maint) Then
			w_lookup_maint.bringtotop = True
			w_lookup_maint.Event ue_change_lookupname(this.GetItemString(row,'sys_fields_lookup_code'))
		Else
			OpenSheetwithparm(w_lookup_maint,this.GetItemString(row,'sys_fields_lookup_code'), w_mdi, 4, original!) //Add parm -- jervis 11.26.2009
		End If
		This.SetColumn("sys_fields_lookup_code")
		Parent.Hide()
	//END---Modify by Scofield on 2009-08-27
end choose

end event

