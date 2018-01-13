$PBExportHeader$w_contract_mul_field_properties.srw
forward
global type w_contract_mul_field_properties from w_popup
end type
type progress_bar from u_progress within w_contract_mul_field_properties
end type
type dw_properties from u_dw within w_contract_mul_field_properties
end type
type cb_ok from u_cb within w_contract_mul_field_properties
end type
type cb_cancel from u_cb within w_contract_mul_field_properties
end type
end forward

global type w_contract_mul_field_properties from w_popup
integer x = 1783
integer y = 32
integer width = 1335
integer height = 1972
string title = "Group Properties"
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
long backcolor = 79680469
progress_bar progress_bar
dw_properties dw_properties
cb_ok cb_ok
cb_cancel cb_cancel
end type
global w_contract_mul_field_properties w_contract_mul_field_properties

type variables
//modify by gavin on 2009/3/5
pfc_cst_u_contract_data_design inv_data_design
uo_contract_design_menu  inv_menu
pfc_cst_u_band_painter inv_band
datawindow  idw_properties
boolean ib_sync_other = false

datastore ids_extra_record_undo //Added By Jay Chen 03-01-2016
end variables

forward prototypes
public function integer of_showcolor ()
public function integer of_parsecolor (ref long al_color)
public function integer of_auto_sync_screen ()
public subroutine of_set_dispalyname_dddw (string as_style)
public subroutine of_set_dispalyname_dddw ()
end prototypes

public function integer of_showcolor ();long ll_Row

dw_properties.AcceptText()
ll_Row = dw_properties.GetRow()
if ll_Row <= 0 then Return -1

dw_properties.object.t_fields_label_textcolor.background.color = dw_properties.object.fields_label_textcolor[ll_Row]
dw_properties.object.t_fields_label_textbkcolor.background.color = dw_properties.object.fields_label_textbkcolor[ll_Row]

//BEGIN---Modify by Scofield on 2009-09-01
dw_properties.object.t_fields_textcolor.background.color = dw_properties.object.fields_textcolor[ll_Row]
dw_properties.object.t_fields_textbkcolor.background.color = dw_properties.object.fields_textbkcolor[ll_Row]
//END---Modify by Scofield on 2009-09-01
Return 1

end function

public function integer of_parsecolor (ref long al_color);if IsNull(al_Color) or al_Color = 33554432 then
	al_Color = RGB(0,0,0)
elseif al_Color = 67108864 then
	al_Color = RGB(212,208,200)
end if

Return 1
end function

public function integer of_auto_sync_screen ();//====================================================================
// Function: of_auto_sync_screen
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	Jay Chen		Date: 02-23-2016
//--------------------------------------------------------------------
//	Copyright (c) 2008-2014 ContractLogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

//BEGIN---Modify by Scofield on 2009-09-29
String 	ls_FieldName,ls_Visible, ls_TCol,ls_sync_screen_contact,ls_ObjName,ls_Type,ls_ColName
long		ll_Row,ll_AlwaysUpdate,ll_RtnVal,ll_rtn,ll_Cnts,ll_Cycle1

ll_Cnts = UpperBound(inv_data_design.istr_selectobj)
if ll_Cnts <= 0 then Return -1
progress_bar.visible = true

for ll_Cycle1 = 1 to ll_Cnts
	ls_FieldName = inv_data_design.istr_SelectObj[ll_Cycle1].FName
	if IsNull(ls_FieldName) or Trim(ls_FieldName) = "" then CONTINUE
	
	ls_Type = inv_data_design.istr_SelectObj[ll_Cycle1].FBand.Describe(ls_FieldName + ".Type")
	if ls_Type <> "column" and ls_Type <> "text" then CONTINUE
	
	if ls_Type = "column" then
		ls_ColName = ls_FieldName
		if inv_data_design.is_open_style = "screen" and inv_data_design.ii_Screen_id >=3 and inv_data_design.ii_Screen_id <= 10   Then
			if ( inv_data_design.ii_Screen_id >=6 and inv_data_design.ii_Screen_id  <=7  and Pos( lower(ls_FieldName),'owner' ) > 0 )  then
				inv_data_design.Post of_AutoUpdateSearchScreen(ls_FieldName, 'owner' )		
			elseif Not( inv_data_design.ii_Screen_id >=6 and inv_data_design.ii_Screen_id  <=7 ) Then
				if inv_data_design.ii_Screen_id = 10 then 
					ls_TCol = 'custom2_' + ls_FieldName
					inv_data_design.of_AutoUpdateSearchScreen(ls_FieldName, ls_TCol )	
					inv_data_design.of_AutoUpdateDetailScreen(ls_FieldName)
				else
					inv_data_design.Post of_AutoUpdateSearchScreen(ls_FieldName)
					inv_data_design.Post of_AutoUpdateDetailScreen(ls_FieldName)	
				end if
			end if
		elseif (inv_data_design.is_open_style = "screen" and (inv_data_design.ii_Screen_id = 53 or inv_data_design.ii_Screen_id  =54)) Then
			inv_data_design.Post of_AutoUpdateScreen("Custom Multi",ls_FieldName)	
		end if

		if inv_data_design.is_open_style = "screen" and ( inv_data_design.ii_Screen_id = 6 Or inv_data_design.ii_Screen_id = 7 or inv_data_design.ii_Screen_id = 1) then  
			if inv_data_design.ii_Screen_id <> 1 then 
				If inv_data_design.ii_Screen_id = 6 Then
					ls_TCol = 'ccci_' + ls_FieldName
				Else
					ls_TCol = 'occi_' + ls_FieldName
				ENd If
				If Pos( 'association,custom_n1, custom_1' , lower(ls_FieldName) ) > 0  Or  Pos(  'association_t,custom_n1_t, custom_1_t' , lower(ls_FieldName) ) > 0  Then
					inv_data_design.Post of_AutoUpdateSearchScreen(ls_FieldName, ls_TCol )		
			//		inv_data_design.Post of_AutoUpdateSearchScreen(ls_FieldName, ls_TCol )	
				End If
			end if
	
			ls_sync_screen_contact = gnv_data.of_getitem("icred_settings", "sync_screen_contact", false)
			if isnull(ls_sync_screen_contact) then ls_sync_screen_contact = '0'
			if ls_sync_screen_contact = '1' then
				if left(lower(ls_FieldName),20) = 'ctx_contacts_custom_' or left(lower(ls_FieldName),20) = 'app_facility_custom_' then
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
					if ll_rtn = 1 then
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
		end if
		//added by gavins 20120607
		if inv_data_design.is_open_style = "screen" and ( inv_data_design.ii_Screen_id =31 ) then
			ls_TCol = 'feesched_' + ls_FieldName
			inv_data_design.Post of_AutoUpdateSearchScreen(ls_FieldName, ls_TCol )		
		End If
			
		If inv_data_design.is_open_style = "screen" and ( inv_data_design.ii_Screen_id =51 or inv_data_design.ii_Screen_id =52 Or inv_data_design.ii_Screen_id =56 ) then
			inv_data_design.Post of_AutoUpdateDocumentScreen(ls_FieldName )	
		End If
		
	end if
	progress_bar.uf_set_position(round(ll_Cycle1 / ll_Cnts,2)  * 100) 
	yield()
Next

////Added By Jay Chen 01-20-2014
//inv_data_design.of_Refresh_Object_Inforamtion()


return 1
end function

public subroutine of_set_dispalyname_dddw (string as_style);//====================================================================
// Function: of_set_dispalyname_dddw
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:	Jay Chen		Date: 02-19-2016
//--------------------------------------------------------------------
//	Copyright (c) 2008-2014 ContractLogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

datawindowchild dwchild
datastore lds_temp
long ll_i,ll_count,ll_row
string ls_name[]
string ls_objects
string ls_label
string ls_type
n_cst_string lvn_string

Choose Case as_style 
	Case 'C'  //Company
		dw_properties.GetChild( "sys_fields_lookup_field_name", dwchild )
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
	Case 'Y' //code lookup
		dw_properties.GetChild( "sys_fields_lookup_field_name", dwchild )
		dwchild.Reset()
		lds_temp = create datastore
		lds_temp.dataobject = 'd_dddw_lookup_fld_nms_code'  
		ll_count = lds_temp.rowcount()
		lds_temp.rowscopy(1, ll_count, primary!,dwchild, 1, primary!)
		destroy lds_temp		
End Choose

Return 
end subroutine

public subroutine of_set_dispalyname_dddw ();//Added By Ken.Guo 2016-04-15
of_set_dispalyname_dddw('C')
end subroutine

on w_contract_mul_field_properties.create
int iCurrent
call super::create
this.progress_bar=create progress_bar
this.dw_properties=create dw_properties
this.cb_ok=create cb_ok
this.cb_cancel=create cb_cancel
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.progress_bar
this.Control[iCurrent+2]=this.dw_properties
this.Control[iCurrent+3]=this.cb_ok
this.Control[iCurrent+4]=this.cb_cancel
end on

on w_contract_mul_field_properties.destroy
call super::destroy
destroy(this.progress_bar)
destroy(this.dw_properties)
destroy(this.cb_ok)
destroy(this.cb_cancel)
end on

event pfc_postopen;call super::pfc_postopen;of_ShowColor() //Add by Evan 07/24/2008
end event

event open;call super::open;long	ll_Row,ll_find

str_FieldProperty	lstr_Property
datawindowchild dwchild
string ls_str

lstr_Property = Message.PowerObjectParm

inv_data_design = lstr_Property.data_design

ll_Row = dw_properties.InsertRow(0)

if Not IsNull(lstr_Property.Field_Visible) then
	if lstr_Property.Field_Visible = '1' then
		dw_properties.SetItem(ll_Row,"data_view_fields_visible",'Y')
	else
		dw_properties.SetItem(ll_Row,"data_view_fields_visible",'N')
	end if
end if

if Not IsNull(lstr_Property.Label_Color) then
	dw_properties.SetItem(ll_Row,"fields_label_textcolor",long(lstr_Property.Label_Color))
end if

if Not IsNull(lstr_Property.Label_BkColor) then
	dw_properties.SetItem(ll_Row,"fields_label_textbkcolor",long(lstr_Property.Label_BkColor))
end if

if Not IsNull(lstr_Property.Label_Alignment) then
	dw_properties.SetItem(ll_Row,"data_view_fields_label_justification",long(lstr_Property.Label_Alignment))
end if

if Not IsNull(lstr_Property.Label_Border) then
	dw_properties.SetItem(ll_Row,"fields_label_border",lstr_Property.Label_Border)
end if

if Not IsNull(lstr_Property.Field_Required) then
	if Upper(lstr_Property.Field_Required) = Upper('Yes') then
		dw_properties.SetItem(ll_Row,"data_view_fields_required",'Y')
	else
		dw_properties.SetItem(ll_Row,"data_view_fields_required",'N')
	end if
end if

if Not IsNull(lstr_Property.Field_Mask) then
	dw_properties.SetItem(ll_Row,"sys_fields_field_mask",lstr_Property.Field_Mask)
end if

if Not IsNull(lstr_Property.Field_Alignment) then
	dw_properties.SetItem(ll_Row,"data_view_fields_justification",long(lstr_Property.Field_Alignment))
end if

if Not IsNull(lstr_Property.Field_display_only) then
	if Upper(lstr_Property.Field_display_only) = Upper('Yes') then
		dw_properties.SetItem(ll_Row,"data_view_fields_display_only",'Y')
	else
		dw_properties.SetItem(ll_Row,"data_view_fields_display_only",'N')
	end if
end if

if Not IsNull(lstr_Property.Field_Color) then
	dw_properties.SetItem(ll_Row,"fields_textcolor",long(lstr_Property.Field_Color))
end if

if Not IsNull(lstr_Property.Field_BKColor) then
	dw_properties.SetItem(ll_Row,"fields_textbkcolor",long(lstr_Property.Field_BKColor))
end if

if Not IsNull(lstr_Property.Field_Border) then
	dw_properties.SetItem(ll_Row,"fields_border",lstr_Property.Field_Border)
end if

if Not IsNull(lstr_Property.Field_Word_Wrap) then
	if Upper(lstr_Property.Field_Word_Wrap) = Upper('Yes') then
		dw_properties.SetItem(ll_Row,"fields_vscrollbar",'Y')
	else
		dw_properties.SetItem(ll_Row,"fields_vscrollbar",'N')
	end if
end if

if Not IsNull(lstr_Property.label_font_face) then //added by gavins 20121214
	dw_properties.SetItem(ll_Row,"label_font_face",lstr_Property.label_font_face)
end if

if Not IsNull(lstr_Property.label_font_height) then
	dw_properties.SetItem(ll_Row,"label_font_height",long( lstr_Property.label_font_height) )
end if

if Not IsNull(lstr_Property.field_font_face) then
	dw_properties.SetItem(ll_Row,"fields_font_face",lstr_Property.field_font_face)
end if

if Not IsNull(lstr_Property.field_font_height) then
	dw_properties.SetItem(ll_Row,"fields_font_height",long( lstr_Property.field_font_height) )
end if

//Added By Jay Chen 02-22-2016
if Not IsNull(lstr_Property.field_style_disable) then
	dw_properties.SetItem(ll_Row,"field_style_disable",lstr_Property.field_style_disable)
end if
if Not IsNull(lstr_Property.sys_fields_lookup_field) then
	dw_properties.SetItem(ll_Row,"sys_fields_lookup_field",lstr_Property.sys_fields_lookup_field)
end if
if Not IsNull(lstr_Property.sys_fields_lookup_code) then
	if lstr_Property.sys_fields_lookup_field = 'C' then
		choose case upper(lstr_Property.sys_fields_lookup_code)
			case 'A'
				ls_str = 'Our company'
			case 'B'
				ls_str = 'Contracted Company'
			case 'O'
				ls_str = 'Other'
			case 'ALL'
				ls_str = 'All'
		end choose
	else
		ls_str = lstr_Property.sys_fields_lookup_code
	end if
	choose case lstr_Property.sys_fields_lookup_field
		case 'Y'
			dw_properties.Modify("sys_fields_lookup_code.dddw.name = 'd_dddw_lookup_select_for_contract' sys_fields_lookup_code.dddw.datacolumn ='lookup_name' sys_fields_lookup_code.dddw.displaycolumn = 'lookup_name'")
			dw_properties.GetChild( "sys_fields_lookup_code", dwchild )
			dwchild.SetTransObject( SQLCA )
			dwchild.Retrieve( )
			dw_properties.Modify("sys_fields_default_value.dddw.name = 'd_dddw_code_lookup' sys_fields_default_value.dddw.datacolumn ='lookup_code' sys_fields_default_value.dddw.displaycolumn = 'code'")
			dw_properties.Modify("sys_fields_lookup_field_name.dddw.name ='d_dddw_lookup_fld_nms_code'") 
		case 'C'
			dw_properties.Modify("sys_fields_lookup_code.dddw.name = 'd_dddw_company_type' sys_fields_lookup_code.dddw.datacolumn ='company_type' sys_fields_lookup_code.dddw.displaycolumn = 'company_desc'")
			dw_properties.Modify("sys_fields_default_value.dddw.name = 'd_dddw_company_list' sys_fields_default_value.dddw.datacolumn ='facility_id' sys_fields_default_value.dddw.displaycolumn = 'facility_name'")
			of_set_dispalyname_dddw('C')
		case 'U'
			dw_properties.Modify("sys_fields_default_value.dddw.name = 'd_dddw_users' sys_fields_default_value.dddw.datacolumn ='user_id' sys_fields_default_value.dddw.displaycolumn = 'user_id'")
			dw_properties.GetChild( "sys_fields_default_value", dwchild )
			dwchild.SetTransObject( SQLCA )
			dwchild.Retrieve( )
	end choose
	dw_properties.SetItem(ll_Row,"sys_fields_lookup_code",ls_str)
	dw_properties.GetChild( "sys_fields_lookup_code", dwchild )
	dwchild.SetTransObject( sqlca )
	dwchild.Retrieve()
end if
if Not IsNull(lstr_Property.sys_fields_lookup_field_name) then
	dw_properties.SetItem(ll_Row,"sys_fields_lookup_field_name",lstr_Property.sys_fields_lookup_field_name)
end if
if Not IsNull(lstr_Property.sys_fields_drop_down_width) then
	dw_properties.SetItem(ll_Row,"sys_fields_drop_down_width",long(lstr_Property.sys_fields_drop_down_width))
end if
if Not IsNull(lstr_Property.sys_fields_default_value) then
	dw_properties.SetItem(ll_Row,"sys_fields_default_value",lstr_Property.sys_fields_default_value)
	if len(lstr_Property.sys_fields_default_value) > 0 then
		if lstr_Property.sys_fields_lookup_field <> 'U' then
			dw_properties.GetChild( "sys_fields_default_value", dwchild )
			dwchild.SetTransObject( sqlca )
//			dwchild.Retrieve( dw_properties.GetItemString( ll_Row, "sys_fields_lookup_code" ))
			dwchild.Retrieve( lstr_Property.sys_fields_lookup_code)
		end if
	end if
end if
if Not IsNull(lstr_Property.fields_add_lookup) then
	dw_properties.SetItem(ll_Row,"fields_add_lookup",lstr_Property.fields_add_lookup)
end if
if Not IsNull(lstr_Property.sys_fields_field_case) then
	dw_properties.SetItem(ll_Row,"sys_fields_field_case",lstr_Property.sys_fields_field_case)
end if
if Not IsNull(lstr_Property.fields_cbx_text) then
	dw_properties.SetItem(ll_Row,"fields_cbx_text",lstr_Property.fields_cbx_text)
end if
if Not IsNull(lstr_Property.fields_cbx_on) then
	dw_properties.SetItem(ll_Row,"fields_cbx_on",lstr_Property.fields_cbx_on)
end if
if Not IsNull(lstr_Property.fields_cbx_off) then
	dw_properties.SetItem(ll_Row,"fields_cbx_off",lstr_Property.fields_cbx_off)
end if
if Not IsNull(lstr_Property.fields_3dlock) then
	dw_properties.SetItem(ll_Row,"fields_3dlock",lstr_Property.fields_3dlock)
end if
//Added By Jay Chen 02-23-2016
if lstr_Property.field_coltype_list > 1 then
	dw_properties.modify( "sys_fields_lookup_field.values='Code Lookup	Y/Company	C/Edit	E/EditMask	M/CheckBox	B'")
end if
progress_bar.st_1.x = progress_bar.x + (progress_bar.width / 2)
//end

//Added By Jay Chen 03-01-2016
ids_extra_record_undo = create datastore
ids_extra_record_undo.dataobject = 'dw_record_field_style_list'

gf_WinCenter(This)

end event

type progress_bar from u_progress within w_contract_mul_field_properties
event destroy ( )
boolean visible = false
integer x = 14
integer y = 1792
integer width = 914
integer height = 72
integer taborder = 30
borderstyle borderstyle = stylelowered!
end type

on progress_bar.destroy
call u_progress::destroy
end on

type dw_properties from u_dw within w_contract_mul_field_properties
integer x = 14
integer y = 24
integer width = 1280
integer height = 1724
integer taborder = 10
boolean bringtotop = true
string dataobject = "d_contract_mul_field_properties"
boolean livescroll = false
end type

event itemchanged;call super::itemchanged;String 	ls_lookup_field,ls_FieldName,ls_Type, ls_ret
long		ll_ViewId,ll_ScreenId,ll_Count,ll_row,ll_cnt
Integer	li_Rtn,ll_insert
DataWindowChild dwchild,dwchild2

This.AcceptText()

choose case dwo.name
	case "fields_label_textcolor", "fields_label_textbkcolor", "fields_textcolor", "fields_textbkcolor"
		of_ShowColor()
end choose

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
End If
/***************************************/

IF This.GetColumnName( ) = "data_view_fields_visible"  Then
	If This.GetItemString(This.GetRow(),'data_view_fields_visible') = 'N' Then
		If This.GetItemString(This.GetRow(),'data_view_fields_required') = 'Y' Then
			MessageBox('Prompt','System will automatically set the Required property to False when the Visible property is set to False. This will cause saving failure if the field is not allowed to be null in the database.')
			This.SetItem(This.GetRow(),'data_view_fields_required','N')
			inv_data_design.Post of_Modify_Column_Property('data_view_fields_required','N')
		End If
	End If
End If

IF This.GetColumnName( ) = "data_view_fields_required" Then
	If This.getitemstring(This.getrow(),'data_view_fields_required') = 'N' Then
		MessageBox('Prompt','When the Required property is set to False, saving error may occur if the field is not allowed to be null in the database.')
	End If
End If

//Added By Jay Chen 02-19-2016
if dwo.name = 'sys_fields_lookup_field' then
	//inv_data_design.dw_properties.setitem(1,"sys_fields_lookup_field", data)
	//inv_data_design.of_Modify_Column_Property(dwo.Name,Data) //Added By Ken.Guo 2016-04-14. should run first. because sys_fields_lookup_field_name and sys_fields_lookup_code will trigger it.
	inv_data_design.of_Modify_Column_Style(data)
	choose case data
		case 'Y'
			ls_ret = this.Modify("sys_fields_lookup_code.dddw.name = 'd_dddw_lookup_select_for_contract' sys_fields_lookup_code.dddw.datacolumn ='lookup_name' sys_fields_lookup_code.dddw.displaycolumn = 'lookup_name'")
			If ls_ret <> '' Then
				gnv_debug.of_output(true, 'Failed to modify field style. Return: ' + ls_ret + '. Syntax: ' + "sys_fields_lookup_code.dddw.name = 'd_dddw_lookup_select_for_contract' sys_fields_lookup_code.dddw.datacolumn ='lookup_name' sys_fields_lookup_code.dddw.displaycolumn = 'lookup_name'") 
			End If
			This.GetChild( "sys_fields_lookup_code", dwchild )
			dwchild.SetTransObject( SQLCA )
			dwchild.Retrieve( )
		
			this.Modify("sys_fields_default_value.dddw.name = 'd_dddw_code_lookup' sys_fields_default_value.dddw.datacolumn ='lookup_code' sys_fields_default_value.dddw.displaycolumn = 'code'")
			ls_ret = this.Modify("sys_fields_lookup_field_name.dddw.name ='d_dddw_lookup_fld_nms_code'") 
			If ls_ret <> '' Then
				gnv_debug.of_output(true, 'Failed to modify field style. Return: ' + ls_ret + '. Syntax: ' + "sys_fields_lookup_field_name.dddw.name ='d_dddw_lookup_fld_nms_code'") 
			End If			
			//Added By Ken.Guo 2016-04-15 workaround apb bug. need manaul add child dw data
			of_set_dispalyname_dddw('Y')
			
			//Added By Jay Chen 03-01-2016
			for ll_cnt = 1 to UpperBound( inv_data_design.istr_SelectObj)
				ls_FieldName = inv_data_design.istr_SelectObj[ll_cnt].FName
				if IsNull(ls_FieldName) or Trim(ls_FieldName) = "" then CONTINUE
				ls_Type = inv_data_design.istr_SelectObj[ll_cnt].FBand.Describe(ls_FieldName + ".Type")
				if ls_Type <> "column" then CONTINUE
				ll_insert = ids_extra_record_undo.insertrow(0)
				ids_extra_record_undo.setitem(ll_insert, "as_field", ls_FieldName)
				ids_extra_record_undo.setitem(ll_insert, "as_property", "Lookup Table Name")
				ids_extra_record_undo.setitem(ll_insert, "ab_record_undo", "0")
				ll_insert = ids_extra_record_undo.insertrow(0)
				ids_extra_record_undo.setitem(ll_insert, "as_field", ls_FieldName)
				ids_extra_record_undo.setitem(ll_insert, "as_property", "Display Name")
				ids_extra_record_undo.setitem(ll_insert, "ab_record_undo", "1")
				ll_insert = ids_extra_record_undo.insertrow(0)
				ids_extra_record_undo.setitem(ll_insert, "as_field", ls_FieldName)
				ids_extra_record_undo.setitem(ll_insert, "as_property", "Field Style")
				ids_extra_record_undo.setitem(ll_insert, "ab_record_undo", "0")
			next
			this.SetItem(row,'sys_fields_lookup_field_name','')
			this.event ItemChanged(row,this.object.sys_fields_lookup_field_name,'')
			this.SetItem(row,'sys_fields_lookup_code','')
			this.event ItemChanged(row,this.object.sys_fields_lookup_code,'')
			dw_properties.SetItem(1, "sys_fields_lookup_field_name", "code" )
			dw_properties.SetItem(1, "sys_fields_drop_down_width", 300 )
			dw_properties.SetItem(1, "fields_add_lookup", 'N' )
		case 'C'
			this.Modify("sys_fields_lookup_code.dddw.name = 'd_dddw_company_type' sys_fields_lookup_code.dddw.datacolumn ='company_type' sys_fields_lookup_code.dddw.displaycolumn = 'company_desc'")
			this.Modify("sys_fields_default_value.dddw.name = 'd_dddw_company_list' sys_fields_default_value.dddw.datacolumn ='facility_id' sys_fields_default_value.dddw.displaycolumn = 'facility_name'")
			
			of_set_dispalyname_dddw('C')
			//Added By Jay Chen 03-01-2016
			for ll_cnt = 1 to UpperBound( inv_data_design.istr_SelectObj)
				ls_FieldName = inv_data_design.istr_SelectObj[ll_cnt].FName
				if IsNull(ls_FieldName) or Trim(ls_FieldName) = "" then CONTINUE
				ls_Type = inv_data_design.istr_SelectObj[ll_cnt].FBand.Describe(ls_FieldName + ".Type")
				if ls_Type <> "column" then CONTINUE
				ll_insert = ids_extra_record_undo.insertrow(0)
				ids_extra_record_undo.setitem(ll_insert, "as_field", ls_FieldName)
				ids_extra_record_undo.setitem(ll_insert, "as_property", "Lookup Table Name")
				ids_extra_record_undo.setitem(ll_insert, "ab_record_undo", "1")
				ll_insert = ids_extra_record_undo.insertrow(0)
				ids_extra_record_undo.setitem(ll_insert, "as_field", ls_FieldName)
				ids_extra_record_undo.setitem(ll_insert, "as_property", "Display Name")
				ids_extra_record_undo.setitem(ll_insert, "ab_record_undo", "0")
				ll_insert = ids_extra_record_undo.insertrow(0)
				ids_extra_record_undo.setitem(ll_insert, "as_field", ls_FieldName)
				ids_extra_record_undo.setitem(ll_insert, "as_property", "Field Style")
				ids_extra_record_undo.setitem(ll_insert, "ab_record_undo", "0")
			next			
			this.SetItem(row,'sys_fields_lookup_code','A')  
			this.event ItemChanged(row,this.object.sys_fields_lookup_code,'A')			
			this.SetItem(row,'sys_fields_lookup_field_name','facility_name')
			this.event ItemChanged(row,this.object.sys_fields_lookup_field_name,'facility_name')
			dw_properties.SetItem( 1, "sys_fields_default_value", "" )
			dw_properties.SetItem( 1, "sys_fields_drop_down_width", 300 )
				
		case 'U'
			this.Modify("sys_fields_default_value.dddw.name = 'd_dddw_users' sys_fields_default_value.dddw.datacolumn ='user_id' sys_fields_default_value.dddw.displaycolumn = 'user_id'")
			This.GetChild( "sys_fields_default_value", dwchild )
			dwchild.SetTransObject( SQLCA )
			dwchild.Retrieve( )
			
			this.GetChild( "sys_fields_lookup_field_name", dwchild2 )
			dwchild2.Reset()
			ll_row = dwchild2.insertrow( 0)
			dwchild2.SetItem( ll_row,'field_name', 'user_id')
			dwchild2.SetItem( ll_row,'field_label', 'user_id')
			ll_row = dwchild2.insertrow( 0)
			dwchild2.SetItem( ll_row,'field_name', 'user_name')
			dwchild2.SetItem( ll_row,'field_label', 'user_name')
			
			//Added By Jay Chen 03-01-2016
			for ll_cnt = 1 to UpperBound( inv_data_design.istr_SelectObj)
				ls_FieldName = inv_data_design.istr_SelectObj[ll_cnt].FName
				if IsNull(ls_FieldName) or Trim(ls_FieldName) = "" then CONTINUE
				ls_Type = inv_data_design.istr_SelectObj[ll_cnt].FBand.Describe(ls_FieldName + ".Type")
				if ls_Type <> "column" then CONTINUE
				ll_insert = ids_extra_record_undo.insertrow(0)
				ids_extra_record_undo.setitem(ll_insert, "as_field", ls_FieldName)
				ids_extra_record_undo.setitem(ll_insert, "as_property", "Lookup Table Name")
				ids_extra_record_undo.setitem(ll_insert, "ab_record_undo", "0")
				ll_insert = ids_extra_record_undo.insertrow(0)
				ids_extra_record_undo.setitem(ll_insert, "as_field", ls_FieldName)
				ids_extra_record_undo.setitem(ll_insert, "as_property", "Display Name")
				ids_extra_record_undo.setitem(ll_insert, "ab_record_undo", "1")
				ll_insert = ids_extra_record_undo.insertrow(0)
				ids_extra_record_undo.setitem(ll_insert, "as_field", ls_FieldName)
				ids_extra_record_undo.setitem(ll_insert, "as_property", "Field Style")
				ids_extra_record_undo.setitem(ll_insert, "ab_record_undo", "0")
			next
			
			this.SetItem(row,'sys_fields_lookup_field_name','user_id')
			this.event ItemChanged(row,this.object.sys_fields_lookup_field_name,'User_id')
			this.SetItem(row,'sys_fields_lookup_code','User') 
			this.event ItemChanged(row,this.object.sys_fields_lookup_code,'')
			dw_properties.SetItem( 1, "sys_fields_drop_down_width", 100 )
			
		case 'N', 'E'
			
		case 'B' 
			this.setitem( row, "fields_3dlock", 'Yes' )
	end choose
end if

IF dwo.name = "sys_fields_lookup_field_name" OR dwo.name = "sys_fields_lookup_code" THEN
	This.GetChild( "sys_fields_default_value", dwchild )
	dwchild.SetTransObject( SQLCA )
	IF dwo.name = "sys_fields_lookup_code" THEN
		dwchild.Retrieve( data )
	ELSE
		dwchild.Retrieve( This.GetItemString( row, "sys_fields_lookup_code" ))
	END IF
	//Added By Jay Chen 03-01-2016 reset specila fiels style undo list
//	ids_extra_record_undo.reset()
	//end
END IF

if dwo.Name = "sys_fields_lookup_code" or dwo.Name = "sys_fields_lookup_field_name" or dwo.Name = "sys_fields_field_mask" then
	inv_data_design.ib_HasNewModify = true
end if
//end  add

//Added By Jay Chen 02-22-2016
if dwo.name = 'sys_fields_lookup_field' or dwo.Name = "sys_fields_lookup_code" or dwo.Name = "sys_fields_lookup_field_name" or dwo.Name = "sys_fields_field_mask" then
	ib_sync_other = true
	inv_data_design.of_Modify_Column_Style( this.getitemstring(1, 'sys_fields_lookup_field')) 
end if
 
inv_data_design.of_Modify_Column_Property(dwo.Name,Data)

//gnv_debug.of_output(False, 'Field Properties Itemchanged().  dwo.name=' + dwo.name + ', data=' + data + '.' )



end event

event constructor;call super::constructor;This.of_SetUpdateable(False)
String ls_fonts[]
datawindowchild ldwc_fonts, ldwc_fonts2
int i,j
n_cst_appeondll lnv_appeon_dll

lnv_appeon_dll.of_getfonts(ls_fonts)

if this.getchild("label_font_face",ldwc_fonts) = 1 then
	
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

end if

If  this.getchild("fields_font_face",ldwc_fonts2 ) = 1 Then
	For i = 1 To UpperBound(ls_fonts[])
		If Trim(ls_fonts[i]) = '' Then Continue
		If i > 1 Then
			If ls_fonts[i - 1] = ls_fonts[i] Then Continue
		End If
		j = ldwc_fonts2.InsertRow(0)
		ldwc_fonts2.SetItem(j,1,ls_fonts[i])
	Next
	
	If ldwc_fonts2.RowCount() = 0 Then
		ldwc_fonts2.InsertRow(1)
		ldwc_fonts2.SetItem(1,1,'MS Sans Serif')
	End If
	
	ldwc_fonts2.SetSort('fonts_face A')
	ldwc_fonts2.Sort()

End If
end event

event itemfocuschanged;call super::itemfocuschanged;IF This.GetColumnName() = "sys_fields_default_value" THEN
	String ls_field_name
	ls_field_name = Upper( This.GetItemString( row, "sys_fields_lookup_field_name" ) )
	DataWindowChild dwchild	
	This.GetChild( "sys_fields_default_value" , dwchild )
	dwchild.SetTransObject( SQLCA )
	dwchild.Retrieve( This.GetItemString( row, "sys_fields_lookup_code" ) )	
END IF
end event

event buttonclicked;call super::buttonclicked;long ll_Color

This.AcceptText()
if Row <=0 then Return

choose case dwo.name
	case "b_text_color"
		ll_Color = This.object.fields_label_textcolor[Row]
		of_ParseColor(ll_Color)
		if ChooseColor(ll_Color,gl_custom_colors[]) = 1 then
			This.object.fields_label_textcolor[Row] = ll_Color
			This.SetColumn("fields_label_textcolor")
			This.Event ItemChanged(Row, This.object.fields_label_textcolor, String(ll_Color))
		end if
	case "b_text_color_def"
		This.object.fields_label_textcolor[Row] = 33554432
		This.SetColumn("fields_label_textcolor")
		This.Event ItemChanged(Row, This.object.fields_label_textcolor, "33554432")
		
	case "b_text_bk_color"
		ll_Color = This.object.fields_label_textbkcolor[Row]
		of_ParseColor(ll_Color)
		if ChooseColor(ll_Color,gl_custom_colors[]) = 1 then
			This.object.fields_label_textbkcolor[Row] = ll_Color
			This.SetColumn("fields_label_textbkcolor")
			This.Event ItemChanged(Row, This.object.fields_label_textbkcolor, String(ll_Color))
		end if
	case "b_text_bk_color_def"
		This.object.fields_label_textbkcolor[Row] = 67108864
		This.SetColumn("fields_label_textbkcolor")
		This.Event ItemChanged(Row, This.object.fields_label_textbkcolor, "67108864")
	//BEGIN---Modify by Scofield on 2009-09-01
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
	//END---Modify by Scofield on 2009-09-01
end choose

end event

type cb_ok from u_cb within w_contract_mul_field_properties
boolean visible = false
integer x = 503
integer y = 1092
integer width = 343
integer taborder = 30
boolean bringtotop = true
string text = "&OK"
end type

event clicked;Close(Parent)

end event

type cb_cancel from u_cb within w_contract_mul_field_properties
integer x = 951
integer y = 1780
integer width = 343
integer taborder = 20
boolean bringtotop = true
fontcharset fontcharset = ansi!
string text = "&Close"
boolean default = true
end type

event clicked;//Added By Jay Chen 02-23-2016
dw_Properties.accepttext()
If dw_Properties.GetItemString(1, "sys_fields_lookup_field") = 'B' Then
	If (dw_Properties.GetItemString(1, "fields_cbx_on") = dw_Properties.GetItemString(1, "fields_cbx_off")) &
	   Or ( isnull(dw_Properties.GetItemString(1, "fields_cbx_on")) and isnull(dw_Properties.GetItemString(1, "fields_cbx_off")) )	Then
		Messagebox('Field Properties','It is recommended that you do not use the same value for both the Data Value for On and the Data Value for Off.')
		dw_Properties.SetColumn('fields_cbx_on')
		dw_Properties.SetFocus()
		Return 
	End If
End If
if ib_sync_other then
	of_auto_sync_screen()
	inv_data_design.ib_HasNewModify = false
end if
//end

Close(Parent)
end event

