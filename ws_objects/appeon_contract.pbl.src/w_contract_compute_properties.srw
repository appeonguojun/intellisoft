﻿$PBExportHeader$w_contract_compute_properties.srw
forward
global type w_contract_compute_properties from w_popup
end type
type cb_cancel from u_cb within w_contract_compute_properties
end type
type tab_1 from tab within w_contract_compute_properties
end type
type tabpage_general from userobject within tab_1
end type
type dw_general from u_dw within tabpage_general
end type
type tabpage_general from userobject within tab_1
dw_general dw_general
end type
type tabpage_position from userobject within tab_1
end type
type dw_position from u_dw within tabpage_position
end type
type tabpage_position from userobject within tab_1
dw_position dw_position
end type
type tab_1 from tab within w_contract_compute_properties
tabpage_general tabpage_general
tabpage_position tabpage_position
end type
end forward

global type w_contract_compute_properties from w_popup
integer x = 214
integer y = 221
integer width = 1838
integer height = 2120
string title = "Properties"
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
boolean center = true
cb_cancel cb_cancel
tab_1 tab_1
end type
global w_contract_compute_properties w_contract_compute_properties

type variables
pfc_cst_u_contract_data_design inv_data_design
pfc_cst_u_band					idw_band
String							is_SetObject, is_Objects[], is_Type
Boolean						ib_ItemChangeVisible = false

pfc_cst_u_band_painter inv_band


end variables

forward prototypes
public subroutine wf_refreshdata (datawindow adw_syntax, string as_object)
public function string of_objectnameverify (string as_name)
public function integer of_parsecolor (ref long al_color)
public subroutine wf_resetdata ()
public function integer of_showcolor ()
public function integer of_showcolor (string as_class, string as_data)
end prototypes

public subroutine wf_refreshdata (datawindow adw_syntax, string as_object);//

String					ls_Visible, ls_Band, ls_Color, ls_Border, ls_VisibleExpress, ls_Expression
String					ls_DataObject, ls_DefaultExpression, ls_slideup, ls_Link
DataWindow		ldw_General
Long					ll_Color
dataStore			lds_Default

If tab_1.tabpage_general.dw_general.RowCount( ) = 0 Then 
	tab_1.tabpage_general.dw_general.InsertRow( 0 )
	tab_1.tabpage_general.dw_general.ShareData( tab_1.tabpage_position.dw_Position )
End If

ldw_General = tab_1.tabpage_general.dw_general

is_Type = adw_syntax.Describe( as_object + ".type" )

This.title = wordcap(is_Type) + ' Properties' 

tab_1.tabpage_general.Text = wordcap(is_Type) + ' Display'


ldw_General.SetItem(1, "name", as_Object)

ls_Visible = adw_syntax.Describe(as_Object + ".visible") //added by gavins 20120503
If ls_Visible = '-1' Then ls_Visible = '1'
If Pos( ls_Visible, '~t' ) > 0   Then
	ls_VisibleExpress =  ls_Visible
	ls_Visible = "1"
	ldw_General.Modify( "visible.protect = 1" )
 	ldw_General.Modify( "visible.color = 8421504" )
	ldw_General.Modify( "b_visible.color = '16711935'" )
Else
	ldw_General.Modify( "visible.protect = 0" )
 	ldw_General.Modify( "visible.color = 0" )
	ldw_General.Modify( "b_visible.color = '0'" )
	ls_VisibleExpress = ""
End If

ldw_General.SetItem(1, "visible", ls_Visible )
ldw_General.SetItem(1, "visibleexpress", ls_VisibleExpress )

//ldw_General.SetItem(1, "text", adw_syntax.Describe(as_Object + ".text"))
ldw_General.SetItem(1, "alignment", adw_syntax.Describe(as_Object + ".alignment"))
ldw_General.SetItem(1, "border", adw_syntax.Describe(as_Object + ".border"))

ldw_General.SetItem(1, "format", adw_syntax.Describe(as_Object + ".format"))

ldw_General.SetItem(1, "Express", adw_syntax.Describe(as_Object + ".Expression"))

//ll_Color = Long(adw_syntax.Describe(as_Object + ".color"))
//ldw_General.SetItem(1, "text_color", ll_Color)
//ll_Color = Long(adw_syntax.Describe(as_Object + ".background.color"))
//ldw_General.SetItem(1, "background_color", ll_Color)

ls_Color =  adw_Syntax.Describe( as_object + ".background.color" )
ls_Expression = ''
If pos( ls_color, '~t' ) > 0 Then 
	ls_Expression = Mid( ls_Color,  Pos( ls_color, '~t' ) + 1 ) 
	ls_Color =  Mid( ls_Color, 2, Pos( ls_color, '~t' ) - 2 ) 
	ldw_General.Modify( "b_background_colorexpress.color = '16711935'" )
	If Right( ls_Expression, 1 ) = '"' Then ls_Expression = Left( ls_Expression, Len( ls_Expression ) - 1 )
Else
	ldw_General.Modify( "b_background_colorexpress.color = '0'" )
End If
ldw_General.SetItem( ldw_General.RowCount( ), 'background_color', Long(ls_Color ) )
ldw_General.SetItem( ldw_General.RowCount( ), 'backgroundcolorexpress', ls_Expression )

ls_Color =  adw_Syntax.Describe( as_object + ".color" )
ls_Expression = ''
If pos( ls_color, '~t' ) > 0 Then 
	ls_Expression = Mid( ls_Color,  Pos( ls_color, '~t' ) + 1 ) 
	If Right( ls_Expression, 1 ) = '"' Then ls_Expression = Left( ls_Expression, Len( ls_Expression ) - 1 )
	ls_Color =  Mid( ls_Color, 2, Pos( ls_color, '~t' ) - 2 ) 
	ldw_General.Modify( "b_font_colorexpress.color = '16711935'" )
Else
	ldw_General.Modify( "b_font_colorexpress.color = '0'" )
End If
ldw_General.SetItem( ldw_General.RowCount( ), 'text_color', Long(ls_Color ) )
ldw_General.SetItem( ldw_General.RowCount( ), 'fontcolorexpress', ls_Expression )


//Add font.properties  - jervis 09.06.2011
string	ls_fonts_face,ls_fonts_size,ls_fonts_bold,ls_fonts_italic,ls_fonts_underline,ls_fonts_strikeout
ls_fonts_face = adw_syntax.Describe(as_Object + ".font.face")
ldw_General.SetItem(1,"font_face",ls_fonts_face)

ls_fonts_size = adw_syntax.Describe(as_Object + ".font.height")
if ls_fonts_size = '?' then ls_fonts_size = '-8'
ls_fonts_size = string(Abs(long(ls_fonts_size)))
ldw_General.SetItem(1,"font_height",long(ls_fonts_size))

ls_fonts_bold = adw_syntax.Describe(as_Object + ".font.weight")
ldw_General.SetItem(1,"font_weight",ls_fonts_bold)

ls_fonts_italic = adw_syntax.Describe(as_Object + ".font.italic")
if ls_fonts_italic = '?' then ls_fonts_italic = '0'
ldw_General.SetItem(1,"font_italic",ls_fonts_italic)

ls_fonts_underline = adw_syntax.Describe(as_Object + ".font.underline")
if ls_fonts_underline = '?' then ls_fonts_underline = '0'
ldw_General.SetItem(1,"font_underline",ls_fonts_underline)

ls_fonts_strikeout = adw_syntax.Describe(as_Object + ".font.strikethrough")
if ls_fonts_strikeout = '?' then ls_fonts_strikeout = '0'
ldw_General.SetItem(1,"font_strikethrough",ls_fonts_strikeout)

ls_slideup = adw_syntax.Describe(as_Object + ".slideup")
if ls_slideup = '?' then ls_slideup = 'no'
ldw_General.SetItem(1,"slideup",ls_slideup)

ldw_General.Modify( "b_visible.enabled = true" )
lds_Default = Create DataStore
ls_DataObject = inv_data_design.of_get_screendataobject( )
If Len( ls_DataObject ) > 0 Then
	lds_Default.dataObject = ls_DataObject
	ls_DefaultExpression = lds_Default.Describe(   as_Object    + ".visible")
	If  Pos( ls_DefaultExpression , '~t' ) > 0 Then
		ldw_General.Modify( "visible.protect = 1" )
		ldw_General.Modify( "visible.color = 8421504" )
		ldw_General.Modify( "b_visible.enabled = false" )
	End If
End If	

//added by gavins 20120611	
ls_Link = adw_syntax.Describe(as_Object + ".html.LinkTarget")
if ls_Link = '?' then ls_Link = '0'
If ls_Link = 'link' Then 
	ls_Link = '1'
Else
	ls_Link = '0'
End If

ldw_General.SetItem(1,"hyperlink",ls_Link )

//Added By Jay Chen 12-11-2013
string ls_str,ls_express
long ll_find
ls_str = adw_syntax.Describe(as_Object + ".x")
ls_express = ""
If Pos( ls_str, '~t' ) > 0 Then 
	ls_express = Mid( ls_str, Pos( ls_str, '~t' ) + 1 )
	ls_express = Left( ls_express, Len( ls_express ) - 1 )
	ls_str = Mid( ls_str, 2, Pos( ls_str, '~t' ) - 2 )
else //Added By Jay Chen 12-20-2013
	ll_find = inv_data_design.ids_object.find("colname = '" + as_Object + "'",1,inv_data_design.ids_object.rowcount())
	if ll_find > 0 then
		ls_express = inv_data_design.ids_object.getitemstring(ll_find,"xexp")
	end if
End If
ldw_General.Setitem( 1, "compute_x", long(ls_str))
ldw_General.Setitem( 1, "xexpress", ls_express)
If Not(trim( ls_express)= '' or isnull( ls_express ) ) Then
	ldw_General.Modify( "b_x.color = '16711935'" )	
Else
	ldw_General.Modify( "b_x.color = '0'" )	
End If

ls_str = adw_syntax.Describe(as_Object + ".y")
ls_express = ""
If Pos( ls_str, '~t' ) > 0 Then 
	ls_express = Mid( ls_str, Pos( ls_str, '~t' ) + 1 )
	ls_express = Left( ls_express, Len( ls_express ) - 1 )
	ls_str = Mid( ls_str, 2, Pos( ls_str, '~t' ) - 2 )
else //Added By Jay Chen 12-20-2013
	ll_find = inv_data_design.ids_object.find("colname = '" + as_Object + "'",1,inv_data_design.ids_object.rowcount())
	if ll_find > 0 then
		ls_express = inv_data_design.ids_object.getitemstring(ll_find,"yexp")
	end if
End If
ldw_General.Setitem( 1, "compute_y", long(ls_str))
ldw_General.Setitem( 1, "yexpress", ls_express)
If Not(trim( ls_express)= '' or isnull( ls_express ) ) Then
	ldw_General.Modify( "b_y.color = '16711935'" )	
Else
	ldw_General.Modify( "b_y.color = '0'" )	
End If
	
ls_str = adw_syntax.Describe(as_Object + ".width")
ls_express = ""
If Pos( ls_str, '~t' ) > 0 Then 
	ls_express = Mid( ls_str, Pos( ls_str, '~t' ) + 1 )
	ls_express = Left( ls_express, Len( ls_express ) - 1 )
	ls_str = Mid( ls_str, 2, Pos( ls_str, '~t' ) - 2 )
else //Added By Jay Chen 12-20-2013
	ll_find = inv_data_design.ids_object.find("colname = '" + as_Object + "'",1,inv_data_design.ids_object.rowcount())
	if ll_find > 0 then
		ls_express = inv_data_design.ids_object.getitemstring(ll_find,"wexp")
	end if
End If
ldw_General.Setitem( 1, "compute_width", long(ls_str))
ldw_General.Setitem( 1, "widthexpress", ls_express)
If Not(trim( ls_express)= '' or isnull( ls_express ) ) Then
	ldw_General.Modify( "b_width.color = '16711935'" )	
Else
	ldw_General.Modify( "b_width.color = '0'" )	
End If

ls_str = adw_syntax.Describe(as_Object + ".height")
ls_express = ""
If Pos( ls_str, '~t' ) > 0 Then 
	ls_express = Mid( ls_str, Pos( ls_str, '~t' ) + 1 )
	ls_express = Left( ls_express, Len( ls_express ) - 1 )
	ls_str = Mid( ls_str, 2, Pos( ls_str, '~t' ) - 2 )
else //Added By Jay Chen 12-20-2013
	ll_find = inv_data_design.ids_object.find("colname = '" + as_Object + "'",1,inv_data_design.ids_object.rowcount())
	if ll_find > 0 then
		ls_express = inv_data_design.ids_object.getitemstring(ll_find,"hexp")
	end if
End If
ldw_General.Setitem( 1, "compute_height", long(ls_str))
ldw_General.Setitem( 1, "heightexpress", ls_express)
If Not(trim( ls_express)= '' or isnull( ls_express ) ) Then
	ldw_General.Modify( "b_height.color = '16711935'" )	
Else
	ldw_General.Modify( "b_height.color = '0'" )	
End If
//end add

of_ShowColor()


If Isvalid( lds_Default ) Then destroy( lds_Default )//added by gavins 20140714




end subroutine

public function string of_objectnameverify (string as_name);//====================================================================
// Function: of_ObjectNameVerify()
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value    string    as_name
//--------------------------------------------------------------------
// Returns:  string
//--------------------------------------------------------------------
// Author:	Scofield		Date: 2009-06-22
//--------------------------------------------------------------------
//	Copyright (c) 1999-2009 Contractlogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

String	ls_SingleLetter
long		ll_Cycle,ll_Length

STRING ERROR_NOTVALID

as_Name = Lower(as_Name)

ERROR_NOTVALID   = "'" + as_name + "' is not a valid name."

ls_SingleLetter = Left(as_Name,1)
if Not (ls_SingleLetter >= 'a' and ls_SingleLetter <= 'z') then
	Return ERROR_NOTVALID
end if

ll_Length = Len(as_Name)
for ll_Cycle = 2 to ll_Length
	ls_SingleLetter = Mid(as_Name,ll_Cycle,1)
	if Not (ls_SingleLetter >= 'a' and ls_SingleLetter <= 'z' or ls_SingleLetter >= '0' and ls_SingleLetter <= '9' or ls_SingleLetter = '_') then
		Return ERROR_NOTVALID
	end if
next

Return ""

end function

public function integer of_parsecolor (ref long al_color);if IsNull(al_Color) or al_Color = 33554432 then
	al_Color = RGB(0,0,0)
elseif al_Color = 67108864 then
	al_Color = RGB(212,208,200)
end if

Return 1
end function

public subroutine wf_resetdata ();//

tab_1.tabpage_general.dw_general.Reset()

//close( this )
end subroutine

public function integer of_showcolor ();long ll_Row


ll_Row = tab_1.tabpage_general.dw_general.GetRow()
tab_1.tabpage_general.dw_general.AcceptText( )
if ll_Row <= 0 then Return -1

//modified by gavins 20120503

tab_1.tabpage_general.dw_general.object.t_text_color.background.color = tab_1.tabpage_general.dw_general.object.text_color[ll_Row]
tab_1.tabpage_general.dw_general.object.t_background_color.background.color = tab_1.tabpage_general.dw_general.object.background_color[ll_Row]


Return 1
end function

public function integer of_showcolor (string as_class, string as_data);
If Not IsNumber( as_data ) Then Return 0

If as_class = 'text_color' Then
	tab_1.tabpage_general.dw_general.object.t_text_color.background.color = as_data
Else
	tab_1.tabpage_general.dw_general.object.t_background_color.background.color =as_data
End If


Return 1
end function

on w_contract_compute_properties.create
int iCurrent
call super::create
this.cb_cancel=create cb_cancel
this.tab_1=create tab_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_cancel
this.Control[iCurrent+2]=this.tab_1
end on

on w_contract_compute_properties.destroy
call super::destroy
destroy(this.cb_cancel)
destroy(this.tab_1)
end on

event open;call super::open;str_set_properties       lstr_pro


lstr_pro = Message.Powerobjectparm

inv_data_design = lstr_Pro.lst_data_design

inv_band = lstr_Pro.lst_band_painter

idw_band = lstr_Pro.lst_band

is_SetObject = lstr_Pro.lst_code

is_Objects = lstr_Pro.lst_object


If tab_1.tabpage_general.dw_general.RowCount( ) = 0 Then tab_1.tabpage_general.dw_general.InsertRow( 0 )


tab_1.tabpage_general.dw_general.ShareData( tab_1.tabpage_position.dw_Position )

wf_refreshData(  inv_band.dw_Syntax  , is_SetObject )

If inv_data_design.is_open_style <> 'report' Then
	//Modified By Jay Chen 12-11-2013
//	tab_1.tabpage_general.dw_general.Modify( "slideup.visible=0 slideup_t.visible=0 express.height=220" )
	tab_1.tabpage_general.dw_general.Modify( "slideup.visible=0 slideup_t.visible=0 " )
End If
end event

event key;call super::key;If key = KeyEscape! Then cb_cancel.Event  Clicked( )
end event

event closequery;//abrogate  inheritation
end event

type cb_cancel from u_cb within w_contract_compute_properties
integer x = 1449
integer y = 1920
integer width = 343
integer taborder = 20
boolean bringtotop = true
string text = "&Close"
boolean default = true
end type

event clicked;Close(Parent)
end event

type tab_1 from tab within w_contract_compute_properties
integer x = 5
integer y = 8
integer width = 1806
integer height = 1896
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
boolean focusonbuttondown = true
alignment alignment = center!
integer selectedtab = 1
tabpage_general tabpage_general
tabpage_position tabpage_position
end type

on tab_1.create
this.tabpage_general=create tabpage_general
this.tabpage_position=create tabpage_position
this.Control[]={this.tabpage_general,&
this.tabpage_position}
end on

on tab_1.destroy
destroy(this.tabpage_general)
destroy(this.tabpage_position)
end on

type tabpage_general from userobject within tab_1
integer x = 18
integer y = 100
integer width = 1769
integer height = 1780
long backcolor = 79741120
string text = "General"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
dw_general dw_general
end type

on tabpage_general.create
this.dw_general=create dw_general
this.Control[]={this.dw_general}
end on

on tabpage_general.destroy
destroy(this.dw_general)
end on

type dw_general from u_dw within tabpage_general
integer x = 9
integer y = 4
integer width = 1760
integer height = 1784
integer taborder = 20
string dataobject = "d_contract_computegeneral_properties"
boolean vscrollbar = false
boolean border = false
borderstyle borderstyle = stylebox!
boolean ib_isupdateable = false
end type

event itemchanged;call super::itemchanged;String			ls_Object, ls_Modify, ls_Modify2, ls_Modify3, ls_Visible,ls_Linkargs
String			ls_Err, ls_color, ls_Nullarray[], ls_Expression
n_cst_string  lnvo_string
string ls_tmp //Added By Jay Chen 12-11-2013
boolean lb_modify=true //Added By Jay Chen 12-20-2013
long ll_find
string ls_undo_modify,ls_ori_value //Added By Jay Chen 03-01-2016

If row <=0 Then Return

ls_Object = dwo.Name

ls_Modify = ""
ls_Modify2 = ''
Choose Case ls_Object 
	case 'visible'
		ls_Modify = is_SetObject + ".visible='" + data + "' "
		ls_undo_modify = ls_Modify

		if IsValid(idw_band.iuo_Parent) then
			If   UPPER(   idw_band.iuo_Parent.is_CurBand ) =  'DETAIL' And  idw_band.iuo_Parent.il_dw_style = 1  Then
				If  data = '0'  and  Not ib_ItemChangeVisible Then
					If MessageBox( 'Prompt', 'Modification of the visible property: ~r~n1. “Invisible”, the column will be hidden and moved to the end of all columns. ~r~n2. When the property is changed from “invisible” to “visible”, the column will be displayed at the end of all visible columns. ~r~nAre you sure you want to modify it? ', &
							question!, yesno!, 1 )  <> 1 Then
						SetItem( row, 'visible', '1' )	
						Return 2
					End If
					 idw_band.iuo_Parent.of_showHideGridcolumn( ls_Nullarray, { is_SetObject }, 0,0,'' )
					 Return
				ElseIf data = '1' and Not ib_ItemChangeVisible Then
					idw_band.iuo_Parent.of_ShowHidegridcolumn( ls_Nullarray,{ is_SetObject }, 0, 0, 'show' )
					 Return
				End If
			End If
		End If
			
	case 'layer'
		idw_band.of_setobjectlayer( is_SetObject, Data )
		Return
	case 'background_color'
		ls_Modify = is_SetObject + ".background.color='" + data + "' " + is_SetObject + ".background.mode = '2'"
		ls_Modify2 = 	ls_Modify
		ls_Modify3 = "t_background_color.background.color=" + data 
		ls_undo_modify = ls_Modify
	case "text_color"
		ls_Modify =  is_SetObject + ".html.Link = '"  + data + "' "//added by gavins 20120611

		ls_Modify += is_SetObject + ".color='" + data + "' "
		
		ls_Modify2 = 	ls_Modify
		ls_Modify3 = "t_text_color.background.color=" + data 
		ls_undo_modify = ls_Modify3

	case 'border'
		ls_Modify = is_SetObject + ".border=" + data
		ls_Modify2 = 	ls_Modify	
		ls_undo_modify = ls_Modify
	case 'express'
		ls_Expression = data
		If Left( ls_Expression,1 ) = '"' Then ls_Expression  = lnvo_string.of_globalreplace( ls_Expression, '"','~~"')
		If Right( ls_Expression,1 ) = '"'  And Mid( ls_Expression, Len( ls_Expression) - 1 , 1 ) <> '~~' Then ls_Expression  = lnvo_string.of_globalreplace( ls_Expression, '"','~~"')
		
		ls_Modify = is_SetObject + '.expression="' + ls_Expression + '"'
		ls_Modify2 = 	ls_Modify	
		ls_undo_modify = ls_Modify
	case 'alignment'
		ls_Modify = is_SetObject + ".alignment=" + data
		ls_ori_value = this.getitemstring(1, 'alignment',primary!,true)
		ls_undo_modify = is_SetObject + ".alignment=" + ls_ori_value
		//added by gavins 20120510
		inv_data_design.of_synchronization_toolbar( data )
		ls_Modify2 = 	ls_Modify	
	case 'format'
		ls_Modify = is_SetObject + ".format='" + data + "'"
		ls_Modify2 = 	ls_Modify		
		ls_undo_modify = ls_Modify
	case 'font_face'
		ls_Modify = is_SetObject + ".font.face='" + data + "'"
		ls_Modify2 = 	ls_Modify	
		ls_undo_modify = ls_Modify
	case 'font_height'
		ls_Modify = is_SetObject + ".font.height='-" + data + "'"
		ls_Modify2 = 	ls_Modify	
		ls_undo_modify = ls_Modify
	case 'font_weight'
		ls_Modify = is_SetObject + ".font.weight='" + data + "'"
		ls_Modify2 = 	ls_Modify		
		ls_ori_value = this.getitemstring(1, 'font_weight',primary!,true)
		ls_undo_modify = is_SetObject + ".font.weight=" + ls_ori_value
		//added by gavins 20120510
		inv_data_design.of_synchronization_toolbar( "bold" )
	case 'font_italic'
		ls_Modify = is_SetObject + ".font.italic='" + data + "'"
		ls_Modify2 = 	ls_Modify	
		if data = '1' then
			ls_undo_modify = is_SetObject + ".font.italic = '0' "
		else
			ls_undo_modify = is_SetObject + ".font.italic = '1' "
		end if	
		//added by gavins 20120510
		inv_data_design.of_synchronization_toolbar( "italic" )
	case 'font_underline'
		ls_Modify = is_SetObject + ".font.underline='" + data + "'"
		ls_Modify2 = 	ls_Modify	
		if data = '1' then
			ls_undo_modify = is_SetObject + ".font.underline = '0' "
		else
			ls_undo_modify = is_SetObject + ".font.underline = '1' "
		end if	
		//added by gavins 20120510
		inv_data_design.of_synchronization_toolbar( "underline" )
	case 'font_strikethrough'
		ls_Modify = is_SetObject + ".font.strikethrough='" + data + "'"
		ls_Modify2 = 	ls_Modify		
		if data = '1' then
			ls_undo_modify = is_SetObject + ".font.strikethrough = '0' "
		else
			ls_undo_modify = is_SetObject + ".font.strikethrough = '1' "
		end if	
	case 'visibleexpress'
		ls_Visible = data
		If Pos( ls_Visible, '~t' ) > 0 Then ls_Visible = Mid( ls_Visible, pos( ls_Visible, '~t' ) + 1 )
		
//		ls_Visible  = lnvo_string.of_globalreplace( ls_Visible, '~~', '~~~~')
//		ls_Visible  = lnvo_string.of_globalreplace( ls_Visible, '"','~~"')
		
		ls_Modify = is_SetObject + '.visible="' +GetItemString( row, 'visible' ) + '~t' +ls_Visible + '" '
		ls_undo_modify = ls_Modify
	case 'backgroundcolorexpress'
		ls_color = data
		If Pos( ls_color, '~t' ) > 0 Then ls_color = Mid( ls_color, pos( ls_color, '~t' ) + 1 )
		ls_Modify = is_SetObject + '.background.color="' +string(GetItemNumber( row, 'background_color' ) )+ '~t' +ls_color + '" ' + is_SetObject + ".background.mode=2 "	
		ls_undo_modify = ls_Modify
	case 'fontcolorexpress'
		ls_color = data
		If Pos( ls_color, '~t' ) > 0 Then ls_color = Mid( ls_color, pos( ls_color, '~t' ) + 1 )

//		ls_Modify =  is_SetObject + '.html.Link = "~~"'  +ls_color+ '~~""'
		ls_Modify =  is_SetObject + '.html.Link = "'  +ls_color+ '"'
		ls_Modify2 = ls_Modify
		ls_Modify += is_SetObject + '.color="' +string(GetItemnumber( row, 'text_color' ) )+ '~t' +ls_color + '" '		
		ls_undo_modify = ls_Modify

	Case 'slideup'
		ls_Modify = is_SetObject + ".slideup='" + data + "'"
		ls_Modify2 = 	ls_Modify		
		ls_undo_modify = ls_Modify
	Case 'hyperlink'//added by gavins 20120611
	
		ls_Linkargs = idw_band.describe( is_SetObject + ".html.Link" )

		If IsNull(ls_Linkargs) Or Trim( ls_Linkargs ) = '' Or ls_Linkargs = "?" Then
			ls_Linkargs = "0"
			ls_color =  idw_band.Describe( is_SetObject + ".color" )
			If Pos( ls_color, '~t' ) > 0 Then ls_color = Mid( ls_color, pos( ls_color, '~t' ) + 1 )
			ls_Modify =   is_SetObject + '.html.Link = "'  + ls_color + '" '
		Else
			If Left( ls_Linkargs, 1) = '"' Then ls_Linkargs = Mid( ls_Linkargs, 2 )
			If Right( ls_Linkargs, 1 ) = '"' Then ls_Linkargs = Left( ls_Linkargs, Len( ls_Linkargs ) - 1 )
		End If
		
		ls_Color = string( This.GetItemNumber(  row , 'text_color' ) )
		ls_Expression = ''
		If pos( ls_Linkargs, ',' ) > 0 Or Not( isnumber( ls_Linkargs ) ) Then 
			ls_Expression = ls_Linkargs
			ls_Linkargs = ls_color + "~t" + ls_Linkargs
			This.Modify( "b_font_colorexpress.color = '16711935'" )
		Else
			ls_color = ls_Linkargs
			This.Modify( "b_font_colorexpress.color = '0'" )
		End If

		If data = '1' Then
			ls_Color =  "16711680"
			ls_Expression = ""
			ls_Modify += is_SetObject + ".html.linktarget='link' " + is_SetObject + ".color ='16711680' " + is_SetObject + ".font.underline =yes " +  is_SetObject + ".pointer ='Hyperlink!'"
			This.SetItem(  row , 'font_underline', '1' )
			This.Modify( "b_font_colorexpress.color = '0'" )
		Else
			This.SetItem(  row , 'font_underline', '0' )
			ls_Modify = is_SetObject + ".html.linktarget='' " + is_SetObject + '.color="' + ls_Linkargs + '" '  + is_SetObject + ".font.underline =no " + is_SetObject + ".pointer ='Arrow!'"
		End If
		ls_Modify2 = 	ls_Modify		
		ls_undo_modify = ls_Modify

		This.SetItem(  row , 'text_color', Long(ls_Color ) )
		This.SetItem(  row , 'fontcolorexpress', ls_Expression )
		of_ShowColor()
      //Added By Jay Chen 12-11-2013
	case 'compute_x'
		ls_Modify = is_SetObject + ".x='" + data + "'"
		ls_Modify2 = 	ls_Modify	
		ls_undo_modify = ls_Modify
	case 'compute_y'
		ls_Modify = is_SetObject + ".y='" + data + "'"
		ls_Modify2 = 	ls_Modify	
		ls_undo_modify = ls_Modify
	case 'compute_width'
		ls_Modify = is_SetObject + ".width='" + data + "'"
		ls_Modify2 = 	ls_Modify	
		ls_undo_modify = ls_Modify
	case 'compute_height'
		ls_Modify = is_SetObject + ".height='" + data + "'"
		ls_Modify2 = 	ls_Modify	
		ls_undo_modify = ls_Modify
	Case 'xexpress'
		lb_modify=false
		ls_tmp =  string(this.GetItemNumber(1, "compute_x"))
		If Isnull( ls_tmp ) Or Trim( ls_tmp ) = '' Then ls_tmp = '0'
		ls_expression =  this.GetItemString(1, "xexpress")
		if isnull(ls_expression) or ls_expression = '' then
			ls_Modify = is_SetObject + '.x = "' + ls_tmp +'"'
		else
			ls_Modify = is_SetObject + '.x = "' + ls_tmp + "~t" + ls_expression +'"'
		end if	
		ls_Modify2 = 	ls_Modify	
		ls_undo_modify = ls_Modify
		//Added By Jay Chen 01-20-2014
		ll_find = inv_data_design.ids_object.find("colname = '" + is_SetObject + "'",1,inv_data_design.ids_object.rowcount())
		if ll_find > 0 then
			inv_data_design.ids_object.setitem(ll_find,"xexp",ls_expression)
		end IF
	Case 'yexpress'
		lb_modify=false
		ls_tmp =  string(this.GetItemNumber(1, "compute_y"))
		If Isnull( ls_tmp ) Or Trim( ls_tmp ) = '' Then ls_tmp = '0'
		ls_expression =  this.GetItemString(1, "yexpress")
		if isnull(ls_expression) or ls_expression = '' then
			ls_Modify = is_SetObject + '.y = "' + ls_tmp +'"'
		else
			ls_Modify = is_SetObject + '.y = "' + ls_tmp + "~t" + ls_expression +'"'
		end if	
		ls_Modify2 = 	ls_Modify	
		ls_undo_modify = ls_Modify
		//Added By Jay Chen 01-20-2014
		ll_find = inv_data_design.ids_object.find("colname = '" + is_SetObject + "'",1,inv_data_design.ids_object.rowcount())
		if ll_find > 0 then
			inv_data_design.ids_object.setitem(ll_find,"yexp",ls_expression)
		end IF
	Case 'widthexpress'
		lb_modify=false
		ls_tmp =  string(this.GetItemNumber(1, "compute_width"))
		If Isnull( ls_tmp ) Or Trim( ls_tmp ) = '' Then ls_tmp = '0'
		ls_expression =  this.GetItemString(1, "widthexpress")
		if isnull(ls_expression) or ls_expression = '' then
			ls_Modify = is_SetObject + '.width = "' + ls_tmp +'"'
		else
			ls_Modify = is_SetObject + '.width = "' + ls_tmp + "~t" + ls_expression +'"'
		end if	
		ls_Modify2 = 	ls_Modify	
		ls_undo_modify = ls_Modify
		//Added By Jay Chen 01-20-2014
		ll_find = inv_data_design.ids_object.find("colname = '" + is_SetObject + "'",1,inv_data_design.ids_object.rowcount())
		if ll_find > 0 then
			inv_data_design.ids_object.setitem(ll_find,"wexp",ls_expression)
		end IF
	Case 'heightexpress'
		lb_modify=false
		ls_tmp =  string(this.GetItemNumber(1, "compute_height"))
		If Isnull( ls_tmp ) Or Trim( ls_tmp ) = '' Then ls_tmp = '0'
		ls_expression =  this.GetItemString(1, "heightexpress")
		if isnull(ls_expression) or ls_expression = '' then
			ls_Modify = is_SetObject + '.height = "' + ls_tmp +'"'
		else
			ls_Modify = is_SetObject + '.height = "' + ls_tmp + "~t" + ls_expression +'"'
		end if	
		ls_Modify2 = 	ls_Modify
		ls_undo_modify = ls_Modify
			//Added By Jay Chen 01-20-2014
		ll_find = inv_data_design.ids_object.find("colname = '" + is_SetObject + "'",1,inv_data_design.ids_object.rowcount())
		if ll_find > 0 then
			inv_data_design.ids_object.setitem(ll_find,"hexp",ls_expression)
		end IF
End Choose


If Len( ls_Modify ) > 0 Then
	//Added By Jay Chen 02-26-2016
	if ls_object = 'font_italic' then
		ls_object = 'italic'
	elseif ls_object = 'font_underline' then
		ls_object = 'underline'
	elseif ls_object = 'font_strikethrough' then
		ls_object = 'strikethrough'	
	end if
	inv_data_design.of_record_undolist(ls_undo_modify,is_SetObject,ls_object) 
	//end
	this.Modify( ls_Modify3 )
	
	//Added By Jay Chen 12-20-2013 
	if lb_modify = true then 
		ls_Err = idw_band.Modify( 	ls_Modify2  )
		//Added By Jay Chen 12-31-2013
		if ls_Object = 'compute_x' or ls_Object = 'compute_y' or ls_Object = 'compute_width' or ls_Object = 'compute_height' then
//			if isvalid(w_contract_data_design) then
				inv_data_design.of_refreshmarkpos()
//			end if
		end if
	end if
	If Len( ls_Err ) > 0 Then
		MessageBox( 'Tips', ls_Err )
		Return 2
	End If
	ls_Err = inv_data_design.Event ue_SetModify( ls_Modify )
	If Len( ls_Err ) > 0 Then
		MessageBox( 'Tips', ls_Err )
		Return 2
	End If
//	.of_RefreshMarkPos()
End If
end event

event losefocus;call super::losefocus;this.AcceptText()
end event

event editchanged;call super::editchanged;If row> 0 Then
	If IsNull( data ) Or Trim( data ) = '' Then Return
	choose case dwo.name 
		case "text_color", "background_color"
			of_ShowColor( string( dwo.name  ),data )
		case  'compute_x','compute_y','compute_width','compute_height' //Added By Jay Chen 12-12-2013
			AcceptText( )
	end choose
End If
end event

event buttonclicked;call super::buttonclicked;long 			ll_Color
String			ls_visible, ls_Expression, ls_Column, ls_Color, ls_Default,ls_field
str_pass		lstr_pass
n_cst_string lnvo_string

this.AcceptText()
if Row <= 0 then Return

choose case dwo.name
	case "b_text_color"
		ll_Color = this.object.text_color[Row]
		of_ParseColor(ll_Color)
		if ChooseColor(ll_Color,gl_custom_colors[]) = 1 then
			this.object.text_color[Row] = ll_Color
			this.SetColumn("text_color")
			this.Event ItemChanged(Row, this.object.text_color, String(ll_Color))
			This.Modify( "b_font_colorexpress.color = '0'" )	
			this.Modify( "text_color.protect = 0" )
			setItem( row, 'fontcolorexpress', '' )
		end if
	case "b_text_color_def"
		this.object.text_color[Row] = 33554432
		this.SetColumn("text_color")
		this.Event ItemChanged(Row, this.object.text_color, "33554432")
		This.Modify( "b_font_colorexpress.color = '0'" )	
		this.Modify( "text_color.protect = 0" )
		setItem( row, 'fontcolorexpress', '' )		
	case "b_background_color"
		ll_Color = this.object.background_color[Row]
		of_ParseColor(ll_Color)
		if ChooseColor(ll_Color,gl_custom_colors[]) = 1 then
			this.object.background_color[Row] = ll_Color
			this.SetColumn("background_color")
			this.Event ItemChanged(Row, this.object.background_color, String(ll_Color))
			This.Modify( "b_background_colorexpress.color = '0'" )	
			this.Modify( "background_color.protect = 0" )
			setItem( row, 'backgroundcolorexpress', '' )
		end if
	case "b_background_color_def"
		this.object.background_color[Row] = 67108864
		this.SetColumn("background_color")
		this.Event ItemChanged(Row, this.object.background_color, "67108864")
		This.Modify( "b_background_colorexpress.color = '0'" )	
		this.Modify( "background_color.protect = 0" )
		setItem( row, 'backgroundcolorexpress', '' )	
	case "b_visible"
		ls_visible =  this.GetItemString(row,'visibleexpress')
		If Pos( ls_visible, '~t' ) > 0 Then ls_visible = Mid( ls_visible, pos( ls_visible, '~t' ) + 1 ) 
		If right( ls_visible , 1 ) = '"' or right( ls_visible, 1 ) = "'" Then ls_visible = left( ls_visible, len( ls_visible ) - 1 )
		lstr_pass.s_long[1] = 5	
		lstr_pass.s_string          = ls_visible
		lstr_pass.as_search_type = "visible"
		lstr_pass.s_string_array[1] = this.GetItemString( row,'name')
		lstr_pass.s_string_array[2] = "text"
		lstr_pass.s_u_dw   = idw_band
		OpenWithParm(w_export_expression,lstr_pass)
		lstr_pass = Message.PowerObjectParm
		if isvalid(lstr_pass) then
			
			if  trim(lstr_pass.s_string) <> "" then
				this.SetItem(row,"visibleexpress",lstr_pass.s_string)
				this.Event ItemChanged( Row, this.object.visibleexpress, lstr_pass.s_string)
				this.Modify( "visible.protect = 1" )
				this.Modify( "visible.color = 8421504" )
				This.Modify( "b_visible.color = '16711935'" )
			Else
				this.SetItem(row,"visibleexpress",lstr_pass.s_string)
				ib_ItemChangeVisible = True
				this.Event ItemChanged( Row, this.object.visible, GetItemString( row, 'visible' ) )
				ib_ItemChangeVisible = False
				this.Modify( "visible.protect = 0" )
				this.Modify( "visible.color = 0" )
				This.Modify( "b_visible.color = '0'" )
			end if
		end if	
	Case "b_expression"
		ls_Expression = this.GetItemString(row,'express')
		if isnull(ls_Expression) then ls_Expression = ''
		IF Upper( appeongetclienttype() ) = 'PB' THEN
			if Left(ls_Expression,1) = '"' and Right(ls_Expression,1) = '"' then
				ls_Expression = Mid(ls_Expression,2,Len(ls_Expression) - 2)
			end if
			ls_Expression = lnvo_string.of_globalreplace( ls_Expression, '~~"', '"')
		end if

		lstr_pass.s_long[1] = 6	
		lstr_pass.s_string   = ls_Expression//expression
		lstr_pass.s_string_array[1] =  this.GetItemString( row,'name')
		lstr_pass.s_u_dw   = idw_band//relative dw
		openwithparm(w_export_expression,lstr_pass)
		
		//Modified the Fee Schedule screen and calc_field_1 or calc_field_2 or calc_field_2 field
		lstr_pass = message.Powerobjectparm
		if isvalid(lstr_pass) then
			if inv_data_design.ii_screen_id = 31 and ls_Expression <> lstr_pass.s_string then
				if this.GetItemString( row,'name') = "calc_field_1" then inv_data_design.ib_calc1_changed = true
				if this.GetItemString( row,'name') = "calc_field_2" then inv_data_design.ib_calc2_changed = true
				if this.GetItemString( row,'name') = "calc_field_3" then inv_data_design.ib_calc3_changed = true
			end if
			IF Upper( appeongetclienttype() ) = 'PB' THEN
				if Left( lstr_pass.s_string ,1) = '"' and Right(lstr_pass.s_string,1) = '"' then
					lstr_pass.s_string = lnvo_string.of_globalreplace( lstr_pass.s_string, '"', '~~"' )
				end if				
			end if
			this.SetItem( row, 'express',  lstr_pass.s_string  )
			this.Event ItemChanged( Row, this.object.express, lstr_pass.s_string  )
		end if
	case 'b_background_colorexpress' 
		
		ls_Column = 'backgroundcolorexpress'
		
		ls_color =  this.GetItemString(row,ls_Column )
		If Pos( ls_color, '~t' ) > 0 Then ls_color = Mid( ls_color, pos( ls_color, '~t' ) + 1 ) 
		If right( ls_color , 1 ) = '"' or right( ls_color, 1 ) = "'" Then ls_color = left( ls_color, len( ls_color ) - 1 )
		lstr_pass.s_long[1] = 5	
		lstr_pass.s_string          = ls_color
		lstr_pass.as_search_type = "background.color"
		lstr_pass.s_string_array[1] = this.GetItemString( row,'name')
		lstr_pass.s_string_array[2] = is_Type
		ls_Default =  string( this.GetItemnumber( row, 'background_color' ) )
		If IsNull( ls_Default ) Or Trim( ls_Default ) = '' Then ls_Default = '0'
		lstr_pass.s_string_array[3] =ls_Default
		lstr_pass.s_u_dw            = idw_band
		OpenWithParm(w_export_expression,lstr_pass)
		lstr_pass = Message.PowerObjectParm
		if isvalid(lstr_pass) then
			if  trim(lstr_pass.s_string) <> "" then

				this.SetItem(row,ls_Column,lstr_pass.s_string)
				this.Event ItemChanged( Row, this.object.backgroundcolorexpress, lstr_pass.s_string)
				this.Modify( "background_color.protect = 1" )
				This.Modify( "b_background_colorexpress.color = '16711935'" )	
			Else
				this.SetItem(row,ls_Column,"")
				this.Event ItemChanged( Row, this.object.background_color,  string( GetItemnumber( row, 'background_color' ) ) )
				this.Modify( "background_color.protect = 0" )
				This.Modify( "b_background_colorexpress.color = '0'" )	
			end if
		end if	
	case 'b_font_colorexpress' 
		
		ls_Column = 'fontcolorexpress'
		
		ls_color =  this.GetItemString(row,ls_Column )
		If Pos( ls_color, '~t' ) > 0 Then ls_color = Mid( ls_color, pos( ls_color, '~t' ) + 1 ) 
		If right( ls_color , 1 ) = '"' or right( ls_color, 1 ) = "'" Then ls_color = left( ls_color, len( ls_color ) - 1 )
		lstr_pass.s_long[1] = 5	
		lstr_pass.s_string          = ls_color
		lstr_pass.as_search_type = "color"
		lstr_pass.s_string_array[1] = this.GetItemString( row,'name')
		lstr_pass.s_string_array[2] = is_Type
		ls_Default =  string(this.GetItemNumber( row, 'text_color' ) )
		If IsNull( ls_Default ) Or Trim( ls_Default ) = '' Then ls_Default = '0'
		lstr_pass.s_string_array[3] =ls_Default
		lstr_pass.s_u_dw            = idw_band
		OpenWithParm(w_export_expression,lstr_pass)
		lstr_pass = Message.PowerObjectParm
		if isvalid(lstr_pass) then
			if  trim(lstr_pass.s_string) <> "" then
	
				this.SetItem(row,ls_Column,lstr_pass.s_string)
				this.Event ItemChanged( Row, this.object.fontcolorexpress, lstr_pass.s_string)
				this.Modify( "text_color.protect = 1" )
				This.Modify( "b_font_colorexpress.color = '16711935'" )	
			Else
				this.SetItem(row,ls_Column,"")
				this.Event ItemChanged( Row, this.object.text_color,  String(GetItemNumber( row, 'text_color' ) ) )
				this.Modify( "text_color.protect = 0" )
				This.Modify( "b_font_colorexpress.color = '0'" )	
			end if
		end if	
	//Added By Jay Chen 12-11-2013
	case 'b_x'
		ls_column = 'xexpress'
		ls_field =  this.GetItemString(row,ls_column)
		If Pos( ls_field, '~t' ) > 0 Then ls_field = Mid( ls_field, pos( ls_field, '~t' ) + 1 ) 
		If right( ls_field , 1 ) = '"' or right( ls_field, 1 ) = "'" Then ls_field = left( ls_field, len( ls_field ) - 1 )
		lstr_pass.s_long[1] = 5	
		lstr_pass.s_string          = ls_field
		lstr_pass.as_search_type = "x"
		lstr_pass.s_string_array[1] = this.GetItemString( row,'name')
		lstr_pass.s_string_array[2] = is_Type
		lstr_pass.s_u_dw   = idw_band
		OpenWithParm(w_export_expression,lstr_pass)
		lstr_pass = Message.PowerObjectParm
		if isvalid(lstr_pass) then
			if  trim(lstr_pass.s_string) <> "" then
				this.SetItem(row,ls_column,lstr_pass.s_string)
				this.Event ItemChanged( Row, this.object.xexpress, lstr_pass.s_string)
				This.Modify( "b_x.color = '16711935'" )
			Else
				this.SetItem(row,ls_column,"")
				this.Event ItemChanged( Row, this.object.xexpress, GetItemString( row, 'xexpress' ) )
				This.Modify( "b_x.color = '0'" )
			end if
		end if
	case 'b_y'
		ls_column = 'yexpress'
		ls_field =  this.GetItemString(row,ls_column)
		If Pos( ls_field, '~t' ) > 0 Then ls_field = Mid( ls_field, pos( ls_field, '~t' ) + 1 ) 
		If right( ls_field , 1 ) = '"' or right( ls_field, 1 ) = "'" Then ls_field = left( ls_field, len( ls_field ) - 1 )
		lstr_pass.s_long[1] = 5	
		lstr_pass.s_string          = ls_field
		lstr_pass.as_search_type = "y"
		lstr_pass.s_string_array[1] = this.GetItemString( row,'name')
		lstr_pass.s_string_array[2] = is_Type
		lstr_pass.s_u_dw   = idw_band
		OpenWithParm(w_export_expression,lstr_pass)
		lstr_pass = Message.PowerObjectParm
		if isvalid(lstr_pass) then
			if  trim(lstr_pass.s_string) <> "" then
				this.SetItem(row,ls_column,lstr_pass.s_string)
				this.Event ItemChanged( Row, this.object.yexpress, lstr_pass.s_string)
				This.Modify( "b_y.color = '16711935'" )
			Else
				this.SetItem(row,ls_column,"")
				this.Event ItemChanged( Row, this.object.yexpress, GetItemString( row, 'yexpress' ) )
				This.Modify( "b_y.color = '0'" )
			end if
		end if
	case 'b_width'
		ls_column = 'widthexpress'
		ls_field =  this.GetItemString(row,ls_column)
		If Pos( ls_field, '~t' ) > 0 Then ls_field = Mid( ls_field, pos( ls_field, '~t' ) + 1 ) 
		If right( ls_field , 1 ) = '"' or right( ls_field, 1 ) = "'" Then ls_field = left( ls_field, len( ls_field ) - 1 )
		lstr_pass.s_long[1] = 5	
		lstr_pass.s_string          = ls_field
		lstr_pass.as_search_type = "width"
		lstr_pass.s_string_array[1] = this.GetItemString( row,'name')
		lstr_pass.s_string_array[2] = is_Type
		lstr_pass.s_u_dw   = idw_band
		OpenWithParm(w_export_expression,lstr_pass)
		lstr_pass = Message.PowerObjectParm
		if isvalid(lstr_pass) then
			if  trim(lstr_pass.s_string) <> "" then
				this.SetItem(row,ls_column,lstr_pass.s_string)
				this.Event ItemChanged( Row, this.object.widthexpress, lstr_pass.s_string)
				This.Modify( "b_width.color = '16711935'" )
			Else
				this.SetItem(row,ls_column,"")
				this.Event ItemChanged( Row, this.object.widthexpress, GetItemString( row, 'widthexpress' ) )
				This.Modify( "b_width.color = '0'" )
			end if
		end if
	case 'b_height'
		ls_column = 'heightexpress'
		ls_field =  this.GetItemString(row,ls_column)
		If Pos( ls_field, '~t' ) > 0 Then ls_field = Mid( ls_field, pos( ls_field, '~t' ) + 1 ) 
		If right( ls_field , 1 ) = '"' or right( ls_field, 1 ) = "'" Then ls_field = left( ls_field, len( ls_field ) - 1 )
		lstr_pass.s_long[1] = 5	
		lstr_pass.s_string          = ls_field
		lstr_pass.as_search_type = "height"
		lstr_pass.s_string_array[1] = this.GetItemString( row,'name')
		lstr_pass.s_string_array[2] = is_Type
		lstr_pass.s_u_dw   = idw_band
		OpenWithParm(w_export_expression,lstr_pass)
		lstr_pass = Message.PowerObjectParm
		if isvalid(lstr_pass) then
			if  trim(lstr_pass.s_string) <> "" then
				this.SetItem(row,ls_column,lstr_pass.s_string)
				this.Event ItemChanged( Row, this.object.heightexpress, lstr_pass.s_string)
				This.Modify( "b_height.color = '16711935'" )
			Else
				this.SetItem(row,ls_column,"")
				this.Event ItemChanged( Row, this.object.heightexpress, GetItemString( row, 'heightexpress' ) )
				This.Modify( "b_height.color = '0'" )
			end if
		end if
end choose
end event

event constructor;call super::constructor;String ls_fonts[]
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

event itemerror;call super::itemerror;Return 3
end event

type tabpage_position from userobject within tab_1
boolean visible = false
integer x = 18
integer y = 100
integer width = 1769
integer height = 1780
boolean enabled = false
long backcolor = 79741120
string text = "Position"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
dw_position dw_position
end type

on tabpage_position.create
this.dw_position=create dw_position
this.Control[]={this.dw_position}
end on

on tabpage_position.destroy
destroy(this.dw_position)
end on

type dw_position from u_dw within tabpage_position
integer width = 1198
integer height = 1360
integer taborder = 10
string dataobject = "d_contract_computegeneral_properties"
boolean vscrollbar = false
boolean border = false
borderstyle borderstyle = stylebox!
end type

event itemchanged;call super::itemchanged;String			ls_Object, ls_Modify, ls_Modify2, ls_Band


ls_Object = dwo.Name

ls_Modify = ""
ls_Modify2 = ''
Choose Case ls_Object 
		
	case 'layer'
		ls_Band = data
		If data = 'band' Then
			CHOOSE CASE UPPER( inv_data_design.is_CurBand)
				CASE 'HEADER'
					ls_Band = 'header'
				CASE 'DETAIL'
					ls_Band = 'detail'
				CASE 'SUMMARY'
					ls_Band = 'summary'
				CASE 'FOOTER'
					ls_Band = 'footer'
				CASE 'HEADERGROUP','HEADER.1'
					ls_Band = 'header.1'
				CASE 'TRAILERGROUP','TRAILER.1'
					ls_Band = 'trailer.1'
				CASE else
					Return
			END CHOOSE
			
		End If
		ls_Modify = is_SetObject + ".band='" + ls_Band + "' "
		ls_Modify2 = 	ls_Modify
	case 'x1'
		If Long( data ) < 0 Or Not IsNumber( data ) Then
			SetItem(Row, ls_Object, '0' )
		End If
		ls_Modify = is_SetObject + ".x1='" + data + "' "
		ls_Modify2 = 	ls_Modify
	case 'x2'
		If Long( data ) < 0 Or Not IsNumber( data ) Then
			SetItem(Row, ls_Object, '0' )
		End If
		ls_Modify = is_SetObject + ".x2r='" + data + "' "
		ls_Modify2 = 	ls_Modify			
	case 'y1'
		If Long( data ) < 0 Or Not IsNumber( data ) Then
			SetItem(Row, ls_Object, '0' )
		End If
		ls_Modify = is_SetObject + ".y1='" + data + "' "		
		ls_Modify2 = 	ls_Modify
	case 'y2'
		If Long( data ) < 0 Or Not IsNumber( data ) Then
			SetItem(Row, ls_Object, '0' )
		End If	
		ls_Modify = is_SetObject + ".y2='" + data + "' "
		ls_Modify2 = 	ls_Modify		
End Choose


If Len( ls_Modify ) > 0 Then
	idw_band.Modify( 	ls_Modify2  )
	inv_data_design.of_SetModify( ls_Modify )
//	.of_RefreshMarkPos()
End If
end event
