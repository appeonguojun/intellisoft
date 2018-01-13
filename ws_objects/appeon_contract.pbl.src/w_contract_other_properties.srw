$PBExportHeader$w_contract_other_properties.srw
forward
global type w_contract_other_properties from w_popup
end type
type cb_cancel from u_cb within w_contract_other_properties
end type
type tab_1 from tab within w_contract_other_properties
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
type tab_1 from tab within w_contract_other_properties
tabpage_general tabpage_general
tabpage_position tabpage_position
end type
end forward

global type w_contract_other_properties from w_popup
integer width = 1280
integer height = 1788
string title = "Properties"
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
boolean center = true
cb_cancel cb_cancel
tab_1 tab_1
end type
global w_contract_other_properties w_contract_other_properties

type variables
pfc_cst_u_contract_data_design inv_data_design
pfc_cst_u_band					idw_band
String							is_SetObject, is_Objects[], is_Type=''

pfc_cst_u_band_painter inv_band

long il_pic_painter_id //Added By Jay Chen 12-13-2013
 //Added By Jay Chen 12-18-2013
long il_view,il_screen
long il_old_painter_id

end variables

forward prototypes
public subroutine wf_refreshdata (datawindow adw_syntax, string as_object)
public function string of_objectnameverify (string as_name)
public function integer of_parsecolor (ref long al_color)
public subroutine wf_resetdata ()
public function integer of_select_picture (ref string as_path, ref string as_file)
end prototypes

public subroutine wf_refreshdata (datawindow adw_syntax, string as_object);//

String					ls_Visible, ls_Band, ls_Color, ls_Border, ls_penwidth
String					ls_Expression
DataWindow		ldw_General
 //Added By Jay Chen 12-18-2013
string ls_objectname
long ll_find

If tab_1.tabpage_general.dw_general.RowCount( ) = 0 Then 
	tab_1.tabpage_general.dw_general.InsertRow( 0 )
	tab_1.tabpage_general.dw_general.ShareData( tab_1.tabpage_position.dw_Position )
End If

ldw_General = tab_1.tabpage_general.dw_general

is_Type = adw_syntax.Describe( as_object + ".type" )

this.title = wordcap(is_Type) + ' Properties' 

tab_1.tabpage_general.Text = wordcap(is_Type) + ' Display'

this.height = 1748 
tab_1.height = 1476
cb_cancel.y = 1504 

If is_Type = 'line' Then
	ldw_General.DataObject = 'd_contract_linegeneral_properties'
	ldw_General.InsertRow( 0 )
	ls_Visible = adw_Syntax.Describe( as_object + ".visible" )
	ldw_General.SetItem( ldw_General.RowCount( ), 'name', adw_Syntax.Describe( as_object + ".name" ) )
	If ls_Visible = '0' Or ls_Visible = '1' Then
		ldw_General.SetItem( ldw_General.RowCount( ), 'visible', ls_Visible )
		ldw_General.Modify( "visible.protect = 0" )
		ldw_General.Modify( "visible.color = 0" )
		ldw_General.Modify( "b_visible.color = '0'" )
	Else
		ldw_General.SetItem( ldw_General.RowCount( ), 'visibleexpress', ls_Visible )
		If Mid( ls_Visible, 2,1 ) = '0' Or Mid( ls_Visible, 2, 1 ) = '1' Then ldw_General.SetItem( ldw_General.RowCount( ), 'visible', Mid( ls_Visible, 2,1 ) )
		ldw_General.Modify( "visible.protect = 1" )
		ldw_General.Modify( "visible.color = 8421504" )
		ldw_General.Modify( "b_visible.color = '16711935'" )
	End If
	
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
	ldw_General.Modify( "t_line_backgroundcolor.background.color ='" + ls_color + "'" )
	ldw_General.SetItem( ldw_General.RowCount( ), 'backgroundcolor', ls_Color )
	ldw_General.SetItem( ldw_General.RowCount( ), 'backgroundcolorexpress', ls_Expression )
	ls_Expression = ''
	ls_Color = adw_Syntax.Describe( as_object + ".pen.color" )
	If pos( ls_color, '~t' ) > 0 Then 
		ls_Expression = Mid( ls_Color,  Pos( ls_color, '~t' ) + 1 ) 
		ls_Color =  Mid( ls_Color, 2, Pos( ls_color, '~t' ) - 2 ) 
		ldw_General.Modify( "b_pen_colorexpress.color = '16711935'" )
		If Right( ls_Expression, 1 ) = '"' Then ls_Expression = Left( ls_Expression, Len( ls_Expression ) - 1 )
	Else
		ldw_General.Modify( "b_pen_colorexpress.color = '0'" )
	End If
	ldw_General.Modify( "t_line_pencolor.background.color ='" + ls_color + "'" )
	ldw_General.SetItem( ldw_General.RowCount( ), 'pencolor',  ls_Color )
	ldw_General.SetItem( ldw_General.RowCount( ), 'pencolorexpress',  ls_Expression )
	
	ldw_General.SetItem( ldw_General.RowCount( ), 'penstyle', adw_Syntax.Describe( as_object + ".pen.style" ) )
	
	ls_PenWidth = adw_Syntax.Describe( as_object + ".pen.width" )
	
	ls_PenWidth = String( UnitsToPixels ( Long(ls_PenWidth ),xunitstopixels!) )

	ldw_General.SetItem( ldw_General.RowCount( ), 'penwidth',Long( ls_PenWidth	) )
	ls_Band = adw_Syntax.Describe( as_object + ".band" ) 
	If ls_Band <> 'background' And ls_Band <> 'foreground' Then ls_Band = 'band' 
	ldw_General.SetItem( ldw_General.RowCount( ), 'layer', WordCap( ls_Band )	 )
	ldw_General.SetItem( ldw_General.RowCount( ), 'x1', adw_Syntax.Describe( as_object + ".x1" ) )	
	ldw_General.SetItem( ldw_General.RowCount( ), 'x2', adw_Syntax.Describe( as_object + ".x2" ) )	
	ldw_General.SetItem( ldw_General.RowCount( ), 'y1', adw_Syntax.Describe( as_object + ".y1" ) )	
	ldw_General.SetItem( ldw_General.RowCount( ), 'y2', adw_Syntax.Describe( as_object + ".y2" ) )	
	ldw_General.SetItem( ldw_General.RowCount( ), 'slideup',  adw_Syntax.Describe( as_object + ".slideup" ) )	
ElseIf is_Type = 'bitmap' Then
	ls_Visible = adw_Syntax.Describe( as_object + ".visible" )
	ldw_General.DataObject = 'd_contract_picturegeneral_properties'
	ldw_General.InsertRow( 0 )
	//Added By Jay Chen 12-18-2013
	ls_objectname = adw_Syntax.Describe( as_object + ".name" )
	//Added By Jay Chen 01-02-2014
	long ll_seq
	if IsValid(w_contract_data_design) then 
		ll_seq = w_contract_data_design.uo_design.il_seqno 
	else
		ll_seq = w_contract_report_design.uo_design.il_seqno 
	end if
	if ll_seq = 0 then
		select max(seq_no) into :ll_seq from ctx_screen_bak_picture where data_view_id = :il_view and screen_id = :il_screen and pic_name = :ls_objectname;
	end if
	select pic_painter_id into :il_old_painter_id from ctx_screen_bak_picture where data_view_id = :il_view and screen_id = :il_screen and seq_no = :ll_seq and pic_name = :ls_objectname;
	if isnull(il_old_painter_id) then il_old_painter_id = 0
	if il_old_painter_id = 0 then 
		select pic_painter_id into :il_old_painter_id from conv_view_pic where view_id =:il_view and screen_id = :il_screen and pic_name = :ls_objectname;
	end if
	if isnull(il_old_painter_id) then il_old_painter_id = 0
	if il_old_painter_id = 0 then //search from have not save into database records
		//Modified By Jay Chen 12-25-2013
		if il_screen = 0 then //report
			if isvalid(w_contract_report_design) then
				ll_find = w_contract_report_design.uo_design.ids_pic.find("pic_name = '" + ls_objectname+ "'",1,w_contract_report_design.uo_design.ids_pic.RowCount())
				if ll_find > 0 then
					il_old_painter_id = w_contract_report_design.uo_design.ids_pic.getitemnumber(ll_find,"pic_painter_id")
					if isnull(il_old_painter_id) then il_old_painter_id = 0
				end if
			end if
		else   //view
			if isvalid(w_contract_data_design) then
				ll_find = w_contract_data_design.uo_design.ids_pic.find("pic_name = '" + ls_objectname+ "'",1,w_contract_data_design.uo_design.ids_pic.RowCount())
				if ll_find > 0 then
					il_old_painter_id = w_contract_data_design.uo_design.ids_pic.getitemnumber(ll_find,"pic_painter_id")
					if isnull(il_old_painter_id) then il_old_painter_id = 0
				end if
			end if
		end if
	end if
	
	ldw_General.SetItem( ldw_General.RowCount( ), 'name', adw_Syntax.Describe( as_object + ".name" ) )
	If ls_Visible = '0' Or ls_Visible = '1' Then
		ldw_General.SetItem( ldw_General.RowCount( ), 'visible', ls_Visible )
		ldw_General.Modify( "visible.protect = 0" )
		ldw_General.Modify( "visible.color = 0" )
		ldw_General.Modify( "b_visible.color = '0'" )
	Else
		ldw_General.SetItem( ldw_General.RowCount( ), 'visibleexpress', ls_Visible )
		If Mid( ls_Visible, 2,1 ) = '0' Or Mid( ls_Visible, 2, 1 ) = '1' Then ldw_General.SetItem( ldw_General.RowCount( ), 'visible', Mid( ls_Visible, 2,1 ) )
		ldw_General.Modify( "visible.protect = 1" )
		ldw_General.Modify( "visible.color = 8421504" )
		ldw_General.Modify( "b_visible.color = '16711935'" )
	End If
	ls_Border = (adw_Syntax.Describe( as_object + ".border" ) )
	If ls_Border = '?' Or ls_Border = '!' Then ls_Border = '0'
	ldw_General.SetItem( ldw_General.RowCount( ), 'border',  ls_Border	)
	ldw_General.SetItem( ldw_General.RowCount( ), 'filename', (adw_Syntax.Describe( as_object + ".filename" ) )	)
	If left( as_Object, 6 ) <> 'object' Then
		ldw_General.Modify( "filename.protect = '1' b_filename.enabled = false filename.color=8421504 visible.color='8421504' visible.protect = '1' b_visible.enabled = false" )
		
	End If
	ldw_General.SetItem( ldw_General.RowCount( ), 'slideup',  adw_Syntax.Describe( as_object + ".slideup" ) )	
	this.height = 1628 - 130
	tab_1.height = 1476 - 250
	cb_cancel.y = 1504 - 250
	
ElseIf is_Type = 'ellipse' Or  is_Type = 'rectangle' Then
	ldw_General.DataObject = 'd_contract_ovalgeneral_properties'
	ldw_General.InsertRow( 0 )
	ls_Visible = adw_Syntax.Describe( as_object + ".visible" )
	ldw_General.SetItem( ldw_General.RowCount( ), 'name', adw_Syntax.Describe( as_object + ".name" ) )
	If ls_Visible = '0' Or ls_Visible = '1' Then
		ldw_General.SetItem( ldw_General.RowCount( ), 'visible', ls_Visible )
		ldw_General.Modify( "visible.protect = 0" )
		ldw_General.Modify( "visible.color = 0" )
		ldw_General.Modify( "b_visible.color = '0'" )
	Else
		ldw_General.SetItem( ldw_General.RowCount( ), 'visibleexpress', ls_Visible )
		If Mid( ls_Visible, 2,1 ) = '0' Or Mid( ls_Visible, 2, 1 ) = '1' Then ldw_General.SetItem( ldw_General.RowCount( ), 'visible', Mid( ls_Visible, 2,1 ) )
		ldw_General.Modify( "visible.protect = 1" )
		ldw_General.Modify( "visible.color = 8421504" )
		ldw_General.Modify( "b_visible.color = '16711935'" )
	End If
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
	ldw_General.Modify( "t_line_backgroundcolor.background.color ='" + ls_color + "'" )
	ldw_General.SetItem( ldw_General.RowCount( ), 'backgroundcolor', ls_Color )
	ldw_General.SetItem( ldw_General.RowCount( ), 'backgroundcolorexpress', ls_Expression )
	ls_Expression = ''
	ls_Color = adw_Syntax.Describe( as_object + ".pen.color" )
	If pos( ls_color, '~t' ) > 0 Then 
		ls_Expression = Mid( ls_Color,  Pos( ls_color, '~t' ) + 1 ) 
		ls_Color =  Mid( ls_Color, 2, Pos( ls_color, '~t' ) - 2 ) 
		ldw_General.Modify( "b_pen_colorexpress.color = '16711935'" )
		If Right( ls_Expression, 1 ) = '"' Then ls_Expression = Left( ls_Expression, Len( ls_Expression ) - 1 )
	Else
		ldw_General.Modify( "b_pen_colorexpress.color = '0'" )
	End If
	ldw_General.Modify( "t_line_pencolor.background.color ='" + ls_color + "'" )
	ldw_General.SetItem( ldw_General.RowCount( ), 'pencolor',  ls_Color )
	ldw_General.SetItem( ldw_General.RowCount( ), 'pencolorexpress',  ls_Expression )
	
	ldw_General.SetItem( ldw_General.RowCount( ), 'penstyle', adw_Syntax.Describe( as_object + ".pen.style" ) )
	ldw_General.SetItem( ldw_General.RowCount( ), 'penwidth',UnitsToPixels ( Long(adw_Syntax.Describe( as_object + ".pen.width" ) ),xunitstopixels!)	)
	ls_Expression = ''
	ls_Color = adw_Syntax.Describe( as_object + ".brush.color" )
	If pos( ls_color, '~t' ) > 0 Then 
		ls_Expression = Mid( ls_Color,  Pos( ls_color, '~t' ) + 1 ) 
		ls_Color =  Mid( ls_Color, 2, Pos( ls_color, '~t' ) - 2 ) 
		ldw_General.Modify( "b_brush_colorexpress.color = '16711935'" )
		If Right( ls_Expression, 1 ) = '"' Then ls_Expression = Left( ls_Expression, Len( ls_Expression ) - 1 )
	Else
		ldw_General.Modify( "b_brush_colorexpress.color = '0'" )
	End If
	ldw_General.Modify( "t_brushcolor.background.color ='" + ls_color + "'" )
	ldw_General.SetItem( ldw_General.RowCount( ), 'brushcolor', ls_Color )
	ldw_General.SetItem( ldw_General.RowCount( ), 'brushcolorexpress', ls_Expression )
	
	ldw_General.SetItem( ldw_General.RowCount( ), 'brushhatch', adw_Syntax.Describe( as_object + ".brush.hatch" ) )
	
	If left( as_Object, 6 ) <> 'object'  or as_Object = 'object_related' Then
		ldw_General.Modify( "b_line_pen_color_default.enabled=false b_line_pen_color.enabled=false b_pen_colorexpress.enabled=false b_brush_colorexpress.enabled=false b_background_colorexpress.enabled=false backgroundcolor.protect ='1' backgroundcolor.color =8421504 b_line_background_color.enabled = false b_line_background_color_default.enabled=false brushcolor.protect='1' b_brushcolor_default.enabled=false brushhatch.protect = '1' brushhatch.color=8421504 b_brushcolor.enabled = false brushcolor.color=8421504 visible.color='8421504' visible.protect = '1' b_visible.enabled = false" )
	End If
	ldw_General.SetItem( ldw_General.RowCount( ), 'slideup',  adw_Syntax.Describe( as_object + ".slideup" ) )	
End If

//Added By Jay Chen 12-11-2013
string ls_str,ls_express
if is_Type = 'ellipse' Or  is_Type = 'rectangle'  Or is_Type = 'bitmap' then 
	ls_str = adw_syntax.Describe(as_Object + ".x")
elseif  is_Type = 'line' Then
 	ls_str = adw_syntax.Describe(as_Object + ".x1")
end if
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
ldw_General.Setitem(ldw_General.RowCount( ), "pic_x", long(ls_str))
ldw_General.Setitem(ldw_General.RowCount( ), "xexpress", ls_express)
If Not(trim( ls_express)= '' or isnull( ls_express ) ) Then
	ldw_General.Modify( "b_x.color = '16711935'" )	
Else
	ldw_General.Modify( "b_x.color = '0'" )	
End If

if is_Type = 'ellipse' Or  is_Type = 'rectangle'  Or is_Type = 'bitmap' then 
	ls_str = adw_syntax.Describe(as_Object + ".y")
elseif  is_Type = 'line' Then
 	ls_str = adw_syntax.Describe(as_Object + ".y1")
end if
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
ldw_General.Setitem(ldw_General.RowCount( ), "pic_y", long(ls_str))
ldw_General.Setitem(ldw_General.RowCount( ), "yexpress", ls_express)
If Not(trim( ls_express)= '' or isnull( ls_express ) ) Then
	ldw_General.Modify( "b_y.color = '16711935'" )	
Else
	ldw_General.Modify( "b_y.color = '0'" )	
End If

if is_Type = 'ellipse' Or  is_Type = 'rectangle'  Or is_Type = 'bitmap' then 
	ls_str = adw_syntax.Describe(as_Object + ".width")
elseif  is_Type = 'line' Then
 	ls_str = adw_syntax.Describe(as_Object + ".x2")
end if
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
ldw_General.Setitem(ldw_General.RowCount( ), "pic_width", long(ls_str))
ldw_General.Setitem(ldw_General.RowCount( ), "widthexpress", ls_express)
If Not(trim( ls_express)= '' or isnull( ls_express ) ) Then
	ldw_General.Modify( "b_width.color = '16711935'" )	
Else
	ldw_General.Modify( "b_width.color = '0'" )	
End If

if is_Type = 'ellipse' Or  is_Type = 'rectangle'  Or is_Type = 'bitmap' then 
	ls_str = adw_syntax.Describe(as_Object + ".height")
elseif  is_Type = 'line' Then
 	ls_str = adw_syntax.Describe(as_Object + ".y2")
end if
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
ldw_General.Setitem(ldw_General.RowCount( ), "pic_height", long(ls_str))
ldw_General.Setitem(ldw_General.RowCount( ), "heightexpress", ls_express)
If Not(trim( ls_express)= '' or isnull( ls_express ) ) Then
	ldw_General.Modify( "b_height.color = '16711935'" )	
Else
	ldw_General.Modify( "b_height.color = '0'" )	
End If
//end add



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

//close(  this )
end subroutine

public function integer of_select_picture (ref string as_path, ref string as_file);//====================================================================
// Function: of_select_picture
//--------------------------------------------------------------------
// Description: Ask users to select picture file from system local picture or from picture painter.
//--------------------------------------------------------------------
// Arguments:
// 	reference    string    as_path
// 	reference    string    as_filename
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	Jay Chen		Date: 12-13-2013
//--------------------------------------------------------------------
//	Copyright (c) 2008-2013 ContractLogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
string ls_type
long ll_picid,ll_pos
integer li_rtn
str_picture lstr_picture,lstr_picture_new
n_cst_dm_utils lnv_utils
n_getfilename ln_getfilename

//open(w_picture_browse_option) //Modified By Jay Chen 12-18-2013
OpenWithParm(w_picture_browse_option,string(il_old_painter_id))
ls_type = message.stringparm
if isnull(ls_type) or ls_type = '' then return 0
setnull(il_pic_painter_id)

if ls_type = 'system' then 
//	li_rtn = GetFileOpenName("Select File",  as_path, as_file, "bmp", &
//		    "Graphic Files (*.bmp;*.gif;*.jpg;*.jpeg;*.png),*.bmp;*.gif;*.jpg;*.jpeg;*.png"  &
//		   ,  gs_current_path , 18 )
	li_rtn = ln_getfilename.of_getopenfilename("Select File",  as_path, as_file, "bmp", &
		    "Graphic Files (*.bmp;*.gif;*.jpg;*.jpeg;*.png),*.bmp;*.gif;*.jpg;*.jpeg;*.png"  &
		   ,  gs_current_path , 18 )
elseif ls_type = 'painter' then    
	lstr_picture.as_type = 'select'
	lstr_picture.al_pic_id = il_old_painter_id
	Openwithparm(w_picture_painter, lstr_picture)
	If isvalid(Message.powerobjectparm) Then
		lstr_picture_new = Message.Powerobjectparm
		If lstr_picture_new.al_pic_id > 0 Then
			ll_picid = lstr_picture_new.al_pic_id
			il_pic_painter_id = ll_picid
			lnv_utils.of_download_picture(ll_picid, as_path)
			if not isnull(as_path) and as_path <> "" then
				ll_pos = LastPos( as_path, '\' )
				if ll_pos > 0 then
					as_file = mid(as_path,ll_pos + 1)
					li_rtn = 1
				else
					li_rtn = 0
				end if
			else
				li_rtn = 0
			end if
		else
			li_rtn = 0
		End If
	End If
end if

return li_rtn
end function

on w_contract_other_properties.create
int iCurrent
call super::create
this.cb_cancel=create cb_cancel
this.tab_1=create tab_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_cancel
this.Control[iCurrent+2]=this.tab_1
end on

on w_contract_other_properties.destroy
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
//Added By Jay Chen 12-18-2013
il_view = lstr_Pro.view_id
il_screen = lstr_Pro.screen_id

If tab_1.tabpage_general.dw_general.RowCount( ) = 0 Then tab_1.tabpage_general.dw_general.InsertRow( 0 )

tab_1.tabpage_general.dw_general.ShareData( tab_1.tabpage_position.dw_Position )

wf_refreshData(  inv_band.dw_Syntax  , is_SetObject )

If inv_data_design.is_open_style <> 'report' Then
	tab_1.tabpage_general.dw_general.Modify( "slideup.visible=0 slideup_t.visible=0" )
	
End If
end event

event key;call super::key;If key = KeyEscape! Then cb_cancel.Event  Clicked( )
end event

event closequery;//abrogate  inheritation
end event

type cb_cancel from u_cb within w_contract_other_properties
integer x = 878
integer y = 1584
integer width = 343
integer taborder = 20
boolean bringtotop = true
string text = "&Close"
boolean default = true
end type

event clicked;Close(Parent)
end event

type tab_1 from tab within w_contract_other_properties
integer x = 18
integer y = 8
integer width = 1234
integer height = 1568
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
integer width = 1198
integer height = 1452
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
integer width = 1198
integer height = 1448
integer taborder = 20
string dataobject = "d_contract_ovalgeneral_properties"
boolean vscrollbar = false
boolean border = false
borderstyle borderstyle = stylebox!
boolean ib_isupdateable = false
end type

event itemchanged;call super::itemchanged;String			ls_Object, ls_Modify, ls_Modify2, ls_Modify3, ls_Visible
String			ls_Err, ls_color
string ls_tmp,ls_expression
boolean lb_modify = true //Added By Jay Chen 12-20-2013
long ll_find

If row <=0 Then Return

ls_Object = dwo.Name

ls_Modify = ""
ls_Modify2 = ''
Choose Case ls_Object 
		
	case 'visible'
		ls_Modify = is_SetObject + ".visible='" + data + "' "
	case 'layer'
		idw_band.of_setobjectlayer( is_SetObject, Data )
		Return
	case 'backgroundcolor'
		If Not isnumber( data ) Then Return 2
		ls_Modify = is_SetObject + ".background.color='" + data + "' "
		ls_Modify2 = 	ls_Modify
		ls_Modify3 = "t_line_backgroundcolor.background.color=" + data 
	case 'pencolor'
		If Not isnumber( data ) Then Return 2
		ls_Modify = is_SetObject + ".pen.color='" + data + "' "
		ls_Modify2 = 	ls_Modify			
		ls_Modify3 = "t_line_pencolor.background.color=" + data 
	case 'penstyle'
		ls_Modify = is_SetObject + ".pen.style='" + data + "' "		
		ls_Modify2 = 	ls_Modify
	case 'penwidth'
		If Not isnumber( data ) Then Return 2
		ls_Modify = is_SetObject + ".pen.width='" + string(pixelstounits( Long(data), Xpixelstounits! )) + "'" 
		ls_Modify2 = 	is_SetObject + ".pen.width='" + data + "'" 		
	case 'border'
		ls_Modify = is_SetObject + ".border=" + data
		ls_Modify2 = 	ls_Modify		
	case 'filename'
		If FileExists( Data ) Then
//			ls_Modify = is_SetObject + ".file='" + data  + "' "
//			ls_Modify2 = 	ls_Modify	
			inv_data_design.of_picture_properties_sheet( is_SetObject ,   data, Mid( data, LastPos( data, '\' ) + 1 ) )
			Return
		End If
	case 'visibleexpress'
		ls_Visible = data
		If Pos( ls_Visible, '~t' ) > 0 Then ls_Visible = Mid( ls_Visible, pos( ls_Visible, '~t' ) + 1 )
		ls_Modify = is_SetObject + '.visible="' +GetItemString( row, 'visible' ) + '~t' +ls_Visible + '" '
	case 'brushcolor'
		If Not isnumber( data ) Then Return 2
		ls_Modify = is_SetObject + ".brush.color='" + data + "' "
		ls_Modify2 = 	ls_Modify
		ls_Modify3 = "t_brushcolor.background.color=" + data 
	case "brushhatch"
		ls_Modify = is_SetObject + ".brush.hatch=" + data
		ls_Modify2 = 	ls_Modify	
	case 'backgroundcolorexpress'
		ls_color = data
		If Pos( ls_color, '~t' ) > 0 Then ls_color = Mid( ls_color, pos( ls_color, '~t' ) + 1 )
		ls_Modify = is_SetObject + '.background.color="' +GetItemString( row, 'backgroundcolor' ) + '~t' +ls_color + '" '
	case 'pencolorexpress'
		ls_color = data
		If Pos( ls_color, '~t' ) > 0 Then ls_color = Mid( ls_color, pos( ls_color, '~t' ) + 1 )
		ls_Modify = is_SetObject + '.pen.color="' +GetItemString( row, 'pencolor' ) + '~t' +ls_color + '" '
	case 'brushcolorexpress'
		ls_color = data
		If Pos( ls_color, '~t' ) > 0 Then ls_color = Mid( ls_color, pos( ls_color, '~t' ) + 1 )
		ls_Modify = is_SetObject + '.brush.color="' +GetItemString( row, 'brushcolor' ) + '~t' +ls_color + '" '	
	case 'slideup'
		ls_Modify = is_SetObject + ".slideup=" + data
		ls_Modify2 = 	ls_Modify		
	//Added By Jay Chen 12-11-2013
	case 'pic_x'
		if is_Type = 'ellipse' Or  is_Type = 'rectangle'  Or is_Type = 'bitmap' then 
			ls_Modify = is_SetObject + ".x='" + data + "'"
		elseif  is_Type = 'line' Then
 			ls_Modify = is_SetObject + ".x1='" + data + "'"
		end if
		ls_Modify2 = 	ls_Modify	
	case 'pic_y'
		if is_Type = 'ellipse' Or  is_Type = 'rectangle'  Or is_Type = 'bitmap' then 
			ls_Modify = is_SetObject + ".y='" + data + "'"
		elseif  is_Type = 'line' Then
 			ls_Modify = is_SetObject + ".y1='" + data + "'"
		end if
		ls_Modify2 = 	ls_Modify	
	case 'pic_width'
		if is_Type = 'ellipse' Or  is_Type = 'rectangle'  Or is_Type = 'bitmap' then 
			ls_Modify = is_SetObject + ".width='" + data + "'"
		elseif  is_Type = 'line' Then
 			ls_Modify = is_SetObject + ".x2='" + data + "'"
		end if
		ls_Modify2 = 	ls_Modify	
	case 'pic_height'
		if is_Type = 'ellipse' Or  is_Type = 'rectangle'  Or is_Type = 'bitmap' then 
			ls_Modify = is_SetObject + ".height='" + data + "'"
		elseif  is_Type = 'line' Then
 			ls_Modify = is_SetObject + ".y2='" + data + "'"
		end if
		ls_Modify2 = 	ls_Modify	
	Case 'xexpress'
		lb_modify = false
		ls_tmp =  string(this.GetItemNumber(1, "pic_x"))
		If Isnull( ls_tmp ) Or Trim( ls_tmp ) = '' Then ls_tmp = '0'
		ls_expression =  this.GetItemString(1, "xexpress")
		if isnull(ls_expression) or ls_expression = '' then
			if is_Type = 'ellipse' Or  is_Type = 'rectangle'  Or is_Type = 'bitmap' then
				ls_Modify = is_SetObject + '.x = "' + ls_tmp +'"'
			elseif  is_Type = 'line' Then
				ls_Modify = is_SetObject + '.x1 = "' + ls_tmp +'"'
			end if
		else
			if is_Type = 'ellipse' Or  is_Type = 'rectangle'  Or is_Type = 'bitmap' then
				ls_Modify = is_SetObject + '.x = "' + ls_tmp + "~t" + ls_expression +'"'
			elseif  is_Type = 'line' Then
				ls_Modify = is_SetObject + '.x1 = "' + ls_tmp + "~t" + ls_expression +'"'
			end if
		end if	
		ls_Modify2 = 	ls_Modify	
		//Added By Jay Chen 01-20-2014
		ll_find = inv_data_design.ids_object.find("colname = '" + is_SetObject + "'",1,inv_data_design.ids_object.rowcount())
		if ll_find > 0 then
			inv_data_design.ids_object.setitem(ll_find,"xexp",ls_expression)
		end IF
	Case 'yexpress'
		lb_modify = false
		ls_tmp =  string(this.GetItemNumber(1, "pic_y"))
		If Isnull( ls_tmp ) Or Trim( ls_tmp ) = '' Then ls_tmp = '0'
		ls_expression =  this.GetItemString(1, "yexpress")
		if isnull(ls_expression) or ls_expression = '' then
			if is_Type = 'ellipse' Or  is_Type = 'rectangle'  Or is_Type = 'bitmap' then
				ls_Modify = is_SetObject + '.y = "' + ls_tmp +'"'
			elseif  is_Type = 'line' Then
				ls_Modify = is_SetObject + '.y1 = "' + ls_tmp +'"'
			end if	
		else
			if is_Type = 'ellipse' Or  is_Type = 'rectangle'  Or is_Type = 'bitmap' then
				ls_Modify = is_SetObject + '.y = "' + ls_tmp + "~t" + ls_expression +'"'
			elseif  is_Type = 'line' Then
				ls_Modify = is_SetObject + '.y1 = "' + ls_tmp + "~t" + ls_expression +'"'
			end if	
		end if	
		ls_Modify2 = 	ls_Modify	
		//Added By Jay Chen 01-20-2014
		ll_find = inv_data_design.ids_object.find("colname = '" + is_SetObject + "'",1,inv_data_design.ids_object.rowcount())
		if ll_find > 0 then
			inv_data_design.ids_object.setitem(ll_find,"yexp",ls_expression)
		end IF
	Case 'widthexpress'
		lb_modify = false
		ls_tmp =  string(this.GetItemNumber(1, "pic_width"))
		If Isnull( ls_tmp ) Or Trim( ls_tmp ) = '' Then ls_tmp = '0'
		ls_expression =  this.GetItemString(1, "widthexpress")
		if isnull(ls_expression) or ls_expression = '' then
			if is_Type = 'ellipse' Or  is_Type = 'rectangle'  Or is_Type = 'bitmap' then
				ls_Modify = is_SetObject + '.width = "' + ls_tmp +'"'
			elseif  is_Type = 'line' Then
				ls_Modify = is_SetObject + '.x2 = "' + ls_tmp +'"'
			end if	
		else
			if is_Type = 'ellipse' Or  is_Type = 'rectangle'  Or is_Type = 'bitmap' then
				ls_Modify = is_SetObject + '.width = "' + ls_tmp + "~t" + ls_expression +'"'
			elseif  is_Type = 'line' Then
				ls_Modify = is_SetObject + '.x2 = "' + ls_tmp + "~t" + ls_expression +'"'
			end if	
		end if	
		ls_Modify2 = 	ls_Modify	
		//Added By Jay Chen 01-20-2014
		ll_find = inv_data_design.ids_object.find("colname = '" + is_SetObject + "'",1,inv_data_design.ids_object.rowcount())
		if ll_find > 0 then
			inv_data_design.ids_object.setitem(ll_find,"wexp",ls_expression)
		end IF
	Case 'heightexpress'
		lb_modify = false
		ls_tmp =  string(this.GetItemNumber(1, "pic_height"))
		If Isnull( ls_tmp ) Or Trim( ls_tmp ) = '' Then ls_tmp = '0'
		ls_expression =  this.GetItemString(1, "heightexpress")
		if isnull(ls_expression) or ls_expression = '' then
			if is_Type = 'ellipse' Or  is_Type = 'rectangle'  Or is_Type = 'bitmap' then
				ls_Modify = is_SetObject + '.height = "' + ls_tmp +'"'
			elseif  is_Type = 'line' Then
				ls_Modify = is_SetObject + '.y2 = "' + ls_tmp +'"'
			end if	
		else
			if is_Type = 'ellipse' Or  is_Type = 'rectangle'  Or is_Type = 'bitmap' then
				ls_Modify = is_SetObject + '.height = "' + ls_tmp + "~t" + ls_expression +'"'
			elseif  is_Type = 'line' Then
				ls_Modify = is_SetObject + '.y2 = "' + ls_tmp + "~t" + ls_expression +'"'
			end if	
		end if	
		ls_Modify2 = 	ls_Modify	
		//Added By Jay Chen 01-20-2014
		ll_find = inv_data_design.ids_object.find("colname = '" + is_SetObject + "'",1,inv_data_design.ids_object.rowcount())
		if ll_find > 0 then
			inv_data_design.ids_object.setitem(ll_find,"hexp",ls_expression)
		end IF
		//end add
End Choose


If Len( ls_Modify ) > 0 Then
	inv_data_design.of_record_undolist(ls_Modify,is_SetObject,ls_object) //Added By Jay Chen 02-26-2016
	this.Modify( ls_Modify3 )
	
	if lb_modify = true then 
		ls_Err = idw_band.Modify( 	ls_Modify2  ) //Modified By Jay Chen 12-20-2013
		//Added By Jay Chen 12-31-2013
		if ls_Object = 'pic_x' or ls_Object = 'pic_y' or ls_Object = 'pic_width' or ls_Object = 'pic_height' then
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

event editchanged;call super::editchanged;If IsNull( data ) Or Trim( data ) = ''  Or Not IsNumber( data )  Then Return
choose case  dwo.Name 
	case 'pencolor'
		Modify( "t_line_pencolor.background.color=" + data  )
	Case 'brushcolor'
		Modify( "t_brushcolor.background.color=" + data		)
	Case 'backgroundcolor'
		Modify("t_line_backgroundcolor.background.color=" + data		)
	case 'penwidth' 
		AcceptText( )
	case  'pic_x','pic_y','pic_width','pic_height' //Added By Jay Chen 12-12-2013
		AcceptText( )
End choose
end event

event buttonclicked;call super::buttonclicked;long 			ll_Color, ll_Rtn
String			ls_Path, ls_File, ls_visible, ls_Color, ls_Column, ls_Default
str_pass 		lstr_pass
string ls_field //Added By Jay Chen 12-11-2013

this.AcceptText()
if Row <= 0 then Return

choose case dwo.name
	case "b_brushcolor"
		ll_Color = Long( this.object.brushcolor[Row] )
		of_ParseColor(ll_Color)
		if ChooseColor(ll_Color,gl_custom_colors[]) = 1 then
			this.object.brushcolor[Row] = String( ll_Color )
			this.SetColumn("brushcolor")
			this.Event ItemChanged(Row, this.object.brushcolor, String(ll_Color))
			this.SetItem(row,"brushcolorexpress","")
			This.Modify( "b_brush_colorexpress.color = '0'" )
			this.Modify( "brushcolor.protect = 0" )
		end if
	case "b_brushcolor_default"
		this.object.brushcolor[Row] = '16777215'
		this.SetColumn("brushcolor")
		this.Event ItemChanged(Row, this.object.brushcolor, "16777215")
		this.SetItem(row,"brushcolorexpress","")
		This.Modify( "b_brush_colorexpress.color = '0'" )	
		this.Modify( "brushcolor.protect = 0" )
	case "b_line_background_color"
		ll_Color = Long( this.object.backgroundcolor[Row] )
		of_ParseColor(ll_Color)
		if ChooseColor(ll_Color,gl_custom_colors[]) = 1 then
			this.object.backgroundcolor[Row] = String( ll_Color )
			this.SetColumn("backgroundcolor")
			this.Event ItemChanged(Row, this.object.backgroundcolor, String(ll_Color))
			this.SetItem(row,"backgroundcolorexpress","")
			This.Modify( "b_background_colorexpress.color = '0'" )	
			this.Modify( "backgroundcolor.protect = 0" )
		end if
	case "b_line_background_color_default"
		this.object.backgroundcolor[Row] = '33554432'
		this.SetColumn("backgroundcolor")
		this.Event ItemChanged(Row, this.object.backgroundcolor, "33554432")
		this.SetItem(row,"backgroundcolorexpress","")
		This.Modify( "b_background_colorexpress.color = '0'" )
		this.Modify( "backgroundcolor.protect = 0" )
	case "b_line_pen_color"
		ll_Color = Long (  this.object.pencolor[Row] )
		of_ParseColor(ll_Color)
		if ChooseColor(ll_Color,gl_custom_colors[]) = 1 then
			this.object.pencolor[Row] = String( ll_Color )
			this.SetColumn("pencolor")
			this.Event ItemChanged(Row, this.object.pencolor, String(ll_Color))
			this.SetItem(row,"pencolorexpress","")
			This.Modify( "b_pen_colorexpress.color = '0'" )	
			this.Modify( "pencolor.protect = 0" )
		end if
	case "b_line_pen_color_default"
		this.object.pencolor[Row] = '67108864'
		this.SetColumn("pencolor")
		this.Event ItemChanged(Row, this.object.pencolor, "67108864")
		this.SetItem(row,"pencolorexpress","")
		This.Modify( "b_pen_colorexpress.color = '0'" )	
		this.Modify( "pencolor.protect = 0" )
	case "b_filename" 
		//Modified By Jay Chen 12-13-2013
//		ll_rtn = GetFileOpenName("Select File",  ls_Path, ls_File, "bmp", &
//		    "Graphic Files (*.bmp;*.gif;*.jpg;*.jpeg;*.png),*.bmp;*.gif;*.jpg;*.jpeg;*.png"  &
//		   ,  gs_current_path , 18 )
		ll_rtn = of_select_picture(ls_Path,ls_File)
		If ll_Rtn = 1 Then
			this.object.filename[row] = ls_Path
			this.Event ItemChanged(Row, this.object.filename, ls_Path  )
		End If
	case 'b_visible' 
		ls_visible =  this.GetItemString(row,'visibleexpress')
		If Pos( ls_visible, '~t' ) > 0 Then ls_visible = Mid( ls_visible, pos( ls_visible, '~t' ) + 1 ) 
		If right( ls_visible , 1 ) = '"' or right( ls_visible, 1 ) = "'" Then ls_visible = left( ls_visible, len( ls_visible ) - 1 )
		lstr_pass.s_long[1] = 5	
		lstr_pass.s_string          = ls_visible
		lstr_pass.as_search_type = "visible"
		lstr_pass.s_string_array[1] = this.GetItemString( row,'name')
		lstr_pass.s_string_array[2] = is_Type
		lstr_pass.s_u_dw            = idw_band
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
				this.SetItem(row,"visibleexpress","")
				this.Event ItemChanged( Row, this.object.visible,  GetItemString( row, 'visible' ) )
				this.Modify( "visible.protect = 0" )
				this.Modify( "visible.color = 0" )
				This.Modify( "b_visible.color = '0'" )		
			end if
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
		ls_Default =  this.GetItemString( row, 'backgroundcolor' )
		If IsNull( ls_Default ) Or Trim( ls_Default ) = '' Then ls_Default = '0'
		lstr_pass.s_string_array[3] =ls_Default
		lstr_pass.s_u_dw            = idw_band
		OpenWithParm(w_export_expression,lstr_pass)
		lstr_pass = Message.PowerObjectParm
		if isvalid(lstr_pass) then
			if  trim(lstr_pass.s_string) <> "" then
				this.SetItem(row,ls_Column,lstr_pass.s_string)
				this.Event ItemChanged( Row, this.object.backgroundcolorexpress, lstr_pass.s_string)
				this.Modify( "backgroundcolor.protect = 1" )
				This.Modify( "b_background_colorexpress.color = '16711935'" )	
			Else
				this.SetItem(row,ls_Column,"")
				this.Event ItemChanged( Row, this.object.backgroundcolor,  GetItemString( row, 'backgroundcolor' ) )
				this.Modify( "backgroundcolor.protect = 0" )
				This.Modify( "b_background_colorexpress.color = '0'" )	
			end if
		end if
	Case 'b_brush_colorexpress'
		
		ls_Column = 'brushcolorexpress'
		
		ls_color =  this.GetItemString(row,ls_Column )
		If Pos( ls_color, '~t' ) > 0 Then ls_color = Mid( ls_color, pos( ls_color, '~t' ) + 1 ) 
		If right( ls_color , 1 ) = '"' or right( ls_color, 1 ) = "'" Then ls_color = left( ls_color, len( ls_color ) - 1 )
		lstr_pass.s_long[1] = 5	
		lstr_pass.s_string          = ls_color
		lstr_pass.as_search_type = "brush.color"
		lstr_pass.s_string_array[1] = this.GetItemString( row,'name')
		lstr_pass.s_string_array[2] = is_Type
		ls_Default =  this.GetItemString( row, 'brushcolor' )
		If IsNull( ls_Default ) Or Trim( ls_Default ) = '' Then ls_Default = '0'
		lstr_pass.s_string_array[3] =ls_Default
		lstr_pass.s_u_dw            = idw_band
		OpenWithParm(w_export_expression,lstr_pass)
		lstr_pass = Message.PowerObjectParm
		if isvalid(lstr_pass) then
			if  trim(lstr_pass.s_string) <> "" then
				this.SetItem(row,ls_Column,lstr_pass.s_string)
				this.Event ItemChanged( Row, this.object.brushcolorexpress, lstr_pass.s_string)
				this.Modify( "brushcolor.protect = 1" )
				This.Modify( "b_brush_colorexpress.color = '16711935'" )	
			Else
				this.SetItem(row,ls_Column,"")
				this.Event ItemChanged( Row, this.object.brushcolor,  GetItemString( row, 'brushcolor' ) )
				this.Modify( "brushcolor.protect = 0" )
				This.Modify( "b_brush_colorexpress.color = '0'" )	
			end if
		end if	
	Case  'b_pen_colorexpress'
		
		ls_Column = 'pencolorexpress'
		
		ls_color =  this.GetItemString(row,ls_Column )
		If Pos( ls_color, '~t' ) > 0 Then ls_color = Mid( ls_color, pos( ls_color, '~t' ) + 1 ) 
		If right( ls_color , 1 ) = '"' or right( ls_color, 1 ) = "'" Then ls_color = left( ls_color, len( ls_color ) - 1 )
		lstr_pass.s_long[1] = 5	
		lstr_pass.s_string          = ls_color
		lstr_pass.as_search_type = "pen.color"
		lstr_pass.s_string_array[1] = this.GetItemString( row,'name')
		lstr_pass.s_string_array[2] = is_Type
		ls_Default =  this.GetItemString( row, 'pencolor' )
		If IsNull( ls_Default ) Or Trim( ls_Default ) = '' Then ls_Default = '0'
		lstr_pass.s_string_array[3] =ls_Default
		lstr_pass.s_u_dw            = idw_band
		OpenWithParm(w_export_expression,lstr_pass)
		lstr_pass = Message.PowerObjectParm
		if isvalid(lstr_pass) then
			if  trim(lstr_pass.s_string) <> "" then
				this.SetItem(row,ls_Column,lstr_pass.s_string)
				this.Event ItemChanged( Row, this.object.pencolorexpress, lstr_pass.s_string)
				this.Modify( "pencolor.protect = 1" )
				This.Modify( "b_pen_colorexpress.color = '16711935'" )	
			Else
				this.SetItem(row,ls_Column,"")
				this.Event ItemChanged( Row, this.object.pencolor,  GetItemString( row, 'pencolor' ) )
				this.Modify( "pencolor.protect = 0" )
				This.Modify( "b_pen_colorexpress.color = '0'" )	
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
		if is_Type = 'ellipse' Or  is_Type = 'rectangle'  Or is_Type = 'bitmap' then
			lstr_pass.as_search_type = "x"
		elseif  is_Type = 'line' Then
			lstr_pass.as_search_type = "x1"
		end if
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
		if is_Type = 'ellipse' Or  is_Type = 'rectangle'  Or is_Type = 'bitmap' then
			lstr_pass.as_search_type = "y"
		elseif  is_Type = 'line' Then
			lstr_pass.as_search_type = "y1"
		end if
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
		if is_Type = 'ellipse' Or  is_Type = 'rectangle'  Or is_Type = 'bitmap' then
			lstr_pass.as_search_type = "width"
		elseif  is_Type = 'line' Then
			lstr_pass.as_search_type = "x2"
		end if
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
		if is_Type = 'ellipse' Or  is_Type = 'rectangle'  Or is_Type = 'bitmap' then
			lstr_pass.as_search_type = "height"
		elseif  is_Type = 'line' Then
			lstr_pass.as_search_type = "y2"
		end if
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

event itemerror;call super::itemerror;Return 3
end event

type tabpage_position from userobject within tab_1
boolean visible = false
integer x = 18
integer y = 100
integer width = 1198
integer height = 1452
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
string dataobject = "d_contract_lineposition_properties"
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

