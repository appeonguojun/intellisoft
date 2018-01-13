$PBExportHeader$w_todolist_settings.srw
forward
global type w_todolist_settings from w_response
end type
type p_icon3 from picture within w_todolist_settings
end type
type p_icon1 from picture within w_todolist_settings
end type
type cb_default from commandbutton within w_todolist_settings
end type
type uo_font_list from u_cst_fonts_list within w_todolist_settings
end type
type cb_close from commandbutton within w_todolist_settings
end type
type cb_save from commandbutton within w_todolist_settings
end type
type dw_settings from u_dw within w_todolist_settings
end type
end forward

global type w_todolist_settings from w_response
integer x = 214
integer y = 221
integer width = 2597
integer height = 1948
string title = "To Do List Global Settings"
p_icon3 p_icon3
p_icon1 p_icon1
cb_default cb_default
uo_font_list uo_font_list
cb_close cb_close
cb_save cb_save
dw_settings dw_settings
end type
global w_todolist_settings w_todolist_settings

type variables
n_cst_dm_utils inv_utils //Added By Jay Chen 03-17-2016
end variables

forward prototypes
public subroutine of_refresh ()
public subroutine of_set_icon (string as_name)
end prototypes

public subroutine of_refresh ();gnv_user_option.of_system_retrieve( )

String ls_value,ls_pic_file,ls_pic_file3

ls_value = gnv_user_option.of_get_option_value( "todolist_style" )
If ls_value = '' Then ls_value = '1'
dw_settings.SetItem(1, 'style', Long(ls_value))

ls_value = gnv_user_option.of_get_option_value( "todolist_tv_filter_font" )
If ls_value = '' Then ls_value = 'MS Sans Serif'
dw_settings.SetItem(1, 'tv_filter_font', ls_value)

ls_value = gnv_user_option.of_get_option_value( "todolist_tv_filter_font_size" )
If ls_value = '' Then ls_value = '9'
dw_settings.SetItem(1, 'tv_filter_font_size', Long(ls_value))

ls_value = gnv_user_option.of_get_option_value( "todolist_tv_filter_font_color" )
If ls_value = '' Then ls_value = String(RGB(0,0,0))
dw_settings.SetItem(1, 'tv_filter_font_color', Long(ls_value))

ls_value = gnv_user_option.of_get_option_value( "todolist_tv_bk_color" )
If ls_value = '' Then ls_value = String(RGB(255,255,255))
dw_settings.SetItem(1, 'tv_bk_color', Long(ls_value))

ls_value = gnv_user_option.of_get_option_value( "todolist_filter_bk_color" )
If ls_value = '' Then ls_value = dw_settings.Describe("DataWindow.Color") //'536870912'
dw_settings.SetItem(1, 'filter_bk_color', Long(ls_value))

ls_value = gnv_user_option.of_get_option_value( "todolist_whole_bk_color" )
If ls_value = '' Then ls_value = String(This.backcolor) //'536870912'
dw_settings.SetItem(1, 'whole_bk_color', Long(ls_value))

//Level 1 Font
ls_value = gnv_user_option.of_get_option_value( "todolist_tv_level1_font" )
If ls_value = '' Then ls_value = 'MS Sans Serif'
dw_settings.SetItem(1, 'tv_level1_font', ls_value)
ls_value = gnv_user_option.of_get_option_value( "todolist_tv_level1_font_size" )
If ls_value = '' Then ls_value = '9'
dw_settings.SetItem(1, 'tv_level1_font_size', Long(ls_value))
ls_value = gnv_user_option.of_get_option_value( "todolist_tv_level1_font_color" )
If ls_value = '' Then ls_value = String(RGB(0,0,0))
dw_settings.SetItem(1, 'tv_level1_font_color', Long(ls_value))
ls_value = gnv_user_option.of_get_option_value( "todolist_tv_level1_font_bold" )
If ls_value = '' Then ls_value = '1'
dw_settings.SetItem(1, 'tv_level1_font_bold', Long(ls_value))
ls_value = gnv_user_option.of_get_option_value( "todolist_tv_level1_font_italy" )
If ls_value = '' Then ls_value = '0'
dw_settings.SetItem(1, 'tv_level1_font_italy', Long(ls_value))
ls_value = gnv_user_option.of_get_option_value( "todolist_tv_level1_font_underline" )
If ls_value = '' Then ls_value = '0'
dw_settings.SetItem(1, 'tv_level1_font_underline', Long(ls_value))

//Level 2 Font
ls_value = gnv_user_option.of_get_option_value( "todolist_tv_level2_font" )
If ls_value = '' Then ls_value = 'MS Sans Serif'
dw_settings.SetItem(1, 'tv_level2_font', ls_value)
ls_value = gnv_user_option.of_get_option_value( "todolist_tv_level2_font_size" )
If ls_value = '' Then ls_value = '9'
dw_settings.SetItem(1, 'tv_level2_font_size', Long(ls_value))
ls_value = gnv_user_option.of_get_option_value( "todolist_tv_level2_font_color" )
If ls_value = '' Then ls_value = String(RGB(0,0,0))
dw_settings.SetItem(1, 'tv_level2_font_color', Long(ls_value))
ls_value = gnv_user_option.of_get_option_value( "todolist_tv_level2_font_bold" )
If ls_value = '' Then ls_value = '0'
dw_settings.SetItem(1, 'tv_level2_font_bold', Long(ls_value))
ls_value = gnv_user_option.of_get_option_value( "todolist_tv_level2_font_italy" )
If ls_value = '' Then ls_value = '0'
dw_settings.SetItem(1, 'tv_level2_font_italy', Long(ls_value))
ls_value = gnv_user_option.of_get_option_value( "todolist_tv_level2_font_underline" )
If ls_value = '' Then ls_value = '0'
dw_settings.SetItem(1, 'tv_level2_font_underline', Long(ls_value))

//Level 3 Font
ls_value = gnv_user_option.of_get_option_value( "todolist_tv_level3_font" )
If ls_value = '' Then ls_value = 'MS Sans Serif'
dw_settings.SetItem(1, 'tv_level3_font', ls_value)
ls_value = gnv_user_option.of_get_option_value( "todolist_tv_level3_font_size" )
If ls_value = '' Then ls_value = '9'
dw_settings.SetItem(1, 'tv_level3_font_size', Long(ls_value))
ls_value = gnv_user_option.of_get_option_value( "todolist_tv_level3_font_color" )
If ls_value = '' Then ls_value = String(RGB(0,0,0))
dw_settings.SetItem(1, 'tv_level3_font_color', Long(ls_value))
ls_value = gnv_user_option.of_get_option_value( "todolist_tv_level3_font_bold" )
If ls_value = '' Then ls_value = '0'
dw_settings.SetItem(1, 'tv_level3_font_bold', Long(ls_value))
ls_value = gnv_user_option.of_get_option_value( "todolist_tv_level3_font_italy" )
If ls_value = '' Then ls_value = '0'
dw_settings.SetItem(1, 'tv_level3_font_italy', Long(ls_value))
ls_value = gnv_user_option.of_get_option_value( "todolist_tv_level3_font_underline" )
If ls_value = '' Then ls_value = '0'
dw_settings.SetItem(1, 'tv_level3_font_underline', Long(ls_value))

//Field Widths
ls_value = gnv_user_option.of_get_option_value( "todolist_display_field1_width" )
If ls_value = '' Then ls_value = '500'
dw_settings.SetItem(1, 'display_field1_width', Long(ls_value))

ls_value = gnv_user_option.of_get_option_value( "todolist_display_field2_width" )
If ls_value = '' Then ls_value = '500'
dw_settings.SetItem(1, 'display_field2_width', Long(ls_value))

ls_value = gnv_user_option.of_get_option_value( "todolist_display_field3_width" )
If ls_value = '' Then ls_value = '500'
dw_settings.SetItem(1, 'display_field3_width', Long(ls_value))

ls_value = gnv_user_option.of_get_option_value( "todolist_display_field4_width" )
If ls_value = '' Then ls_value = '500'
dw_settings.SetItem(1, 'display_field4_width', Long(ls_value))

ls_value = gnv_user_option.of_get_option_value( "todolist_display_field5_width" )
If ls_value = '' Then ls_value = '500'
dw_settings.SetItem(1, 'display_field5_width', Long(ls_value))

ls_value = gnv_user_option.of_get_option_value( "todolist_display_field6_width" )
If ls_value = '' Then ls_value = '500'
dw_settings.SetItem(1, 'display_field6_width', Long(ls_value))

ls_value = gnv_user_option.of_get_option_value( "todolist_display_field7_width" )
If ls_value = '' Then ls_value = '500'
dw_settings.SetItem(1, 'display_field7_width', Long(ls_value))

ls_value = gnv_user_option.of_get_option_value( "todolist_display_field8_width" )
If ls_value = '' Then ls_value = '500'
dw_settings.SetItem(1, 'display_field8_width', Long(ls_value))

ls_value = gnv_user_option.of_get_option_value( "todolist_display_field9_width" )
If ls_value = '' Then ls_value = '500'
dw_settings.SetItem(1, 'display_field9_width', Long(ls_value))

ls_value = gnv_user_option.of_get_option_value( "todolist_display_field10_width" )
If ls_value = '' Then ls_value = '500'
dw_settings.SetItem(1, 'display_field10_width', Long(ls_value))

ls_value = gnv_user_option.of_get_option_value( "todolist_display_field11_width" )
If ls_value = '' Then ls_value = '500'
dw_settings.SetItem(1, 'display_field11_width', Long(ls_value))

ls_value = gnv_user_option.of_get_option_value( "todolist_display_field12_width" )
If ls_value = '' Then ls_value = '500'
dw_settings.SetItem(1, 'display_field12_width', Long(ls_value))

//Added By Jay Chen 03-17-2016
ls_value = gnv_user_option.of_get_option_value( "todolist_tv_level1_icon" )
If isnull(ls_value) then ls_value = ''
if isnumber(ls_value) then
	inv_utils.of_download_picture( Long(ls_value), ls_pic_file)
else
	ls_pic_file = ls_value//Added By Jay 2016-04-22
end if
//if ls_value <> '' then //Commented By Jay 2016-04-22
//	dw_settings.SetItem(1, 'tv_level1_icon', ls_value)
//	dw_settings.Modify( 'p_pic1.filename = "' +ls_pic_file+ '"' )
//	if not isnumber(ls_value) then of_set_icon('b_icon_browse1' )
//end if

if ls_value <> '' then
	dw_settings.SetItem(1, 'tv_level1_icon', ls_value)
	of_set_icon('b_icon_browse1' )
end if

ls_value = gnv_user_option.of_get_option_value( "todolist_tv_level3_icon" )
If isnull(ls_value) then ls_value = ''
if isnumber(ls_value) then
	inv_utils.of_download_picture( Long(ls_value), ls_pic_file3)
else
	ls_pic_file3 = ls_value //Added By Jay 2016-04-22
end if
//if ls_value <> '' then //Commented By Jay 2016-04-22
//	dw_settings.SetItem(1, 'tv_level3_icon', ls_value)
//	dw_settings.Modify( 'p_pic3.filename = "' +ls_pic_file3+ '"' )
//	if not isnumber(ls_value) then of_set_icon('b_icon_browse3' )
//end if

if ls_value <> '' then
	dw_settings.SetItem(1, 'tv_level3_icon', ls_value)
	of_set_icon('b_icon_browse3' )
end if

end subroutine

public subroutine of_set_icon (string as_name);//====================================================================
// Function: of_set_icon
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:	Jay Chen		Date: 03-17-2016
//--------------------------------------------------------------------
//	Copyright (c) 2008-2014 ContractLogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

Long ll_icon_x,ll_icon_y
String ls_tv_icon,ls_pic_file
Boolean lb_from_picture_painter

If dw_settings.RowCount() <= 0 Then Return
if as_name = 'b_icon_browse1' then
	ll_icon_x = Long(dw_settings.Describe('t_icon_pos1.x'))
	ll_icon_y = Long(dw_settings.Describe('t_icon_pos1.y'))
	ls_tv_icon = dw_settings.GetItemString(1,'tv_level1_icon')
else
	ll_icon_x = Long(dw_settings.Describe('t_icon_pos3.x'))
	ll_icon_y = Long(dw_settings.Describe('t_icon_pos3.y'))
	ls_tv_icon = dw_settings.GetItemString(1,'tv_level3_icon')
end if

dw_settings.SetReDraw ( False ) //Added By Jay 2016-04-22
If isnull(ls_tv_icon) or ls_tv_icon = '' Then
	if as_name = 'b_icon_browse1' then
		p_icon1.picturename = 'folderopen.gif'
		dw_settings.SetItem(1,'tv_level1_icon','folderopen.gif')
	else
		p_icon3.picturename = 'Script_No.gif'
		dw_settings.SetItem(1,'tv_level3_icon','Script_No.gif')
	end if
ElseIf isnumber(ls_tv_icon) Then //From Picture Painter 
	inv_utils.of_download_picture( Long(ls_tv_icon), ls_pic_file)
	if as_name = 'b_icon_browse1' then
		p_icon1.picturename = "" 
		dw_settings.Modify( 'p_pic1.visible = 1' )//Added By jay 2016-04-14
		p_icon1.visible = false //Added By jay 2016-04-14
	else
		p_icon3.picturename = "" 
		dw_settings.Modify( 'p_pic3.visible = 1' )//Added By jay 2016-04-14
		p_icon3.visible = false //Added By jay 2016-04-14
	end if
//Begin - Added By Jay 2016-04-22.
ElseIf AppeonGetClientType() = 'WEB' Then
	ls_pic_file = ls_tv_icon
	if as_name = 'b_icon_browse1' then
		p_icon1.picturename = "" 
		dw_settings.Modify( 'p_pic1.visible = 1' )
		p_icon1.visible = false 
	else
		p_icon3.picturename = "" 
		dw_settings.Modify( 'p_pic3.visible = 1' )
		p_icon3.visible = false
	end if
//End - Added By Jay 2016-04-22.
Else
	if as_name = 'b_icon_browse1' then
		p_icon1.picturename = ls_tv_icon
		
		p_icon1.visible = true //Added By jay 2016-04-14
		dw_settings.Modify( 'p_pic1.visible = 0' )//Added By jay 2016-04-14
	else
		p_icon3.picturename = ls_tv_icon
		p_icon3.visible = true //Added By jay 2016-04-14
		dw_settings.Modify( 'p_pic3.visible = 0' )//Added By jay 2016-04-14
	end if
	ls_pic_file = ls_tv_icon //Added By jay 2016-04-14
End If

if as_name = 'b_icon_browse1' then
	dw_settings.SetRowFocusIndicator(p_icon1,ll_icon_x,ll_icon_y)	
	dw_settings.Modify( 'p_pic1.filename = "' +ls_pic_file+ '"' )
else
	dw_settings.SetRowFocusIndicator(p_icon3,ll_icon_x,ll_icon_y)	
	dw_settings.Modify( 'p_pic3.filename = "' +ls_pic_file+ '"' )
end if

dw_settings.SetReDraw ( True ) //Added By Jay 2016-04-22



end subroutine

on w_todolist_settings.create
int iCurrent
call super::create
this.p_icon3=create p_icon3
this.p_icon1=create p_icon1
this.cb_default=create cb_default
this.uo_font_list=create uo_font_list
this.cb_close=create cb_close
this.cb_save=create cb_save
this.dw_settings=create dw_settings
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.p_icon3
this.Control[iCurrent+2]=this.p_icon1
this.Control[iCurrent+3]=this.cb_default
this.Control[iCurrent+4]=this.uo_font_list
this.Control[iCurrent+5]=this.cb_close
this.Control[iCurrent+6]=this.cb_save
this.Control[iCurrent+7]=this.dw_settings
end on

on w_todolist_settings.destroy
call super::destroy
destroy(this.p_icon3)
destroy(this.p_icon1)
destroy(this.cb_default)
destroy(this.uo_font_list)
destroy(this.cb_close)
destroy(this.cb_save)
destroy(this.dw_settings)
end on

event pfc_postopen;call super::pfc_postopen;Datawindowchild ldwc_text_fonts,ldwc_text_fonts1,ldwc_text_fonts2,ldwc_text_fonts3

dw_settings.GetChild('tv_filter_font',ldwc_text_fonts)
uo_font_list.idwc_fonts.RowsCopy(1,uo_font_list.idwc_fonts.RowCount(),primary!,ldwc_text_fonts,1,primary!)

dw_settings.GetChild('tv_level1_font',ldwc_text_fonts1)
uo_font_list.idwc_fonts.RowsCopy(1,uo_font_list.idwc_fonts.RowCount(),primary!,ldwc_text_fonts1,1,primary!)

dw_settings.GetChild('tv_level2_font',ldwc_text_fonts2)
uo_font_list.idwc_fonts.RowsCopy(1,uo_font_list.idwc_fonts.RowCount(),primary!,ldwc_text_fonts2,1,primary!)

dw_settings.GetChild('tv_level3_font',ldwc_text_fonts3)
uo_font_list.idwc_fonts.RowsCopy(1,uo_font_list.idwc_fonts.RowCount(),primary!,ldwc_text_fonts3,1,primary!)

end event

event open;call super::open;of_refresh()

//Added By Jay Chen 03-17-2016
If dw_settings.GetItemNumber(1, 'style') = 1 Then 
	dw_settings.modify("b_icon_browse1.enabled = false")
	dw_settings.modify("b_icon_browse3.enabled = false")
else
	dw_settings.modify("b_icon_browse1.enabled = true")
	dw_settings.modify("b_icon_browse3.enabled = true")
end if
end event

type p_icon3 from picture within w_todolist_settings
boolean visible = false
integer x = 2318
integer y = 1056
integer width = 87
integer height = 72
boolean originalsize = true
boolean focusrectangle = false
end type

type p_icon1 from picture within w_todolist_settings
boolean visible = false
integer x = 2313
integer y = 604
integer width = 87
integer height = 72
boolean originalsize = true
boolean focusrectangle = false
end type

type cb_default from commandbutton within w_todolist_settings
integer x = 1467
integer y = 1748
integer width = 343
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Default"
end type

event clicked;dw_settings.SetRedraw(False)
dw_settings.Reset()
dw_settings.InsertRow(0)
dw_settings.SetItem(1, 'filter_bk_color', Parent.backcolor)
dw_settings.SetItem(1, 'Whole_bk_color', Parent.backcolor)
dw_settings.SetRedraw(True)

end event

type uo_font_list from u_cst_fonts_list within w_todolist_settings
integer x = 2999
integer y = 3000
integer width = 0
integer height = 0
integer taborder = 40
end type

on uo_font_list.destroy
call u_cst_fonts_list::destroy
end on

type cb_close from commandbutton within w_todolist_settings
integer x = 2194
integer y = 1748
integer width = 343
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Close"
boolean cancel = true
end type

event clicked;Close(Parent)
end event

type cb_save from commandbutton within w_todolist_settings
integer x = 1833
integer y = 1748
integer width = 343
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Save"
boolean default = true
end type

event clicked;
String ls_value
Long ll_value

dw_settings.AcceptText()
ll_value = dw_settings.GetItemNumber(1, 'style' )
If Not isnull(ll_value) Then
	gnv_user_option.of_set_option_value( "todolist_style", String(ll_value) )
End If

ls_value = dw_settings.GetItemString(1, 'tv_filter_font' )
If Not isnull(ls_value) and ls_value <> '' Then
	gnv_user_option.of_set_option_value( "todolist_tv_filter_font", ls_value )
End If

ll_value = dw_settings.GetItemNumber(1, 'tv_filter_font_size' )
If Not isnull(ll_value) Then
	gnv_user_option.of_set_option_value( "todolist_tv_filter_font_size", String(ll_value) )
End If

ll_value = dw_settings.GetItemNumber(1, 'tv_filter_font_color' )
If Not isnull(ll_value) Then
	gnv_user_option.of_set_option_value( "todolist_tv_filter_font_color", String(ll_value) )
End If

ll_value = dw_settings.GetItemNumber(1, 'tv_bk_color' )
If Not isnull(ll_value) Then
	gnv_user_option.of_set_option_value( "todolist_tv_bk_color", String(ll_value) )
End If

ll_value = dw_settings.GetItemNumber(1, 'filter_bk_color' )
If Not isnull(ll_value) Then
	gnv_user_option.of_set_option_value( "todolist_filter_bk_color", String(ll_value) )
End If

ll_value = dw_settings.GetItemNumber(1, 'whole_bk_color' )
If Not isnull(ll_value) Then
	gnv_user_option.of_set_option_value( "todolist_whole_bk_color", String(ll_value) )
End If

//Level 1 Font
ls_value = dw_settings.GetItemString(1, 'tv_level1_font' )
If Not isnull(ls_value) and ls_value <> '' Then
	gnv_user_option.of_set_option_value( "todolist_tv_level1_font", ls_value )
End If
ll_value = dw_settings.GetItemNumber(1, 'tv_level1_font_size' )
If Not isnull(ll_value) Then
	gnv_user_option.of_set_option_value( "todolist_tv_level1_font_size", String(ll_value) )
End If
ll_value = dw_settings.GetItemNumber(1, 'tv_level1_font_color' )
If Not isnull(ll_value) Then
	gnv_user_option.of_set_option_value( "todolist_tv_level1_font_color", String(ll_value) )
End If
ll_value = dw_settings.GetItemNumber(1, 'tv_level1_font_bold' )
If Not isnull(ll_value) Then
	gnv_user_option.of_set_option_value( "todolist_tv_level1_font_bold", String(ll_value) )
End If
ll_value = dw_settings.GetItemNumber(1, 'tv_level1_font_italy' )
If Not isnull(ll_value) Then
	gnv_user_option.of_set_option_value( "todolist_tv_level1_font_italy", String(ll_value) )
End If
ll_value = dw_settings.GetItemNumber(1, 'tv_level1_font_underline' )
If Not isnull(ll_value) Then
	gnv_user_option.of_set_option_value( "todolist_tv_level1_font_underline", String(ll_value) )
End If
//Level 2 Font
ls_value = dw_settings.GetItemString(1, 'tv_level2_font' )
If Not isnull(ls_value) and ls_value <> '' Then
	gnv_user_option.of_set_option_value( "todolist_tv_level2_font", ls_value )
End If
ll_value = dw_settings.GetItemNumber(1, 'tv_level2_font_size' )
If Not isnull(ll_value) Then
	gnv_user_option.of_set_option_value( "todolist_tv_level2_font_size", String(ll_value) )
End If
ll_value = dw_settings.GetItemNumber(1, 'tv_level2_font_color' )
If Not isnull(ll_value) Then
	gnv_user_option.of_set_option_value( "todolist_tv_level2_font_color", String(ll_value) )
End If
ll_value = dw_settings.GetItemNumber(1, 'tv_level2_font_bold' )
If Not isnull(ll_value) Then
	gnv_user_option.of_set_option_value( "todolist_tv_level2_font_bold", String(ll_value) )
End If
ll_value = dw_settings.GetItemNumber(1, 'tv_level2_font_italy' )
If Not isnull(ll_value) Then
	gnv_user_option.of_set_option_value( "todolist_tv_level2_font_italy", String(ll_value) )
End If
ll_value = dw_settings.GetItemNumber(1, 'tv_level2_font_underline' )
If Not isnull(ll_value) Then
	gnv_user_option.of_set_option_value( "todolist_tv_level2_font_underline", String(ll_value) )
End If
//Level 3 Font
ls_value = dw_settings.GetItemString(1, 'tv_level3_font' )
If Not isnull(ls_value) and ls_value <> '' Then
	gnv_user_option.of_set_option_value( "todolist_tv_level3_font", ls_value )
End If
ll_value = dw_settings.GetItemNumber(1, 'tv_level3_font_size' )
If Not isnull(ll_value) Then
	gnv_user_option.of_set_option_value( "todolist_tv_level3_font_size", String(ll_value) )
End If
ll_value = dw_settings.GetItemNumber(1, 'tv_level3_font_color' )
If Not isnull(ll_value) Then
	gnv_user_option.of_set_option_value( "todolist_tv_level3_font_color", String(ll_value) )
End If
ll_value = dw_settings.GetItemNumber(1, 'tv_level3_font_bold' )
If Not isnull(ll_value) Then
	gnv_user_option.of_set_option_value( "todolist_tv_level3_font_bold", String(ll_value) )
End If
ll_value = dw_settings.GetItemNumber(1, 'tv_level3_font_italy' )
If Not isnull(ll_value) Then
	gnv_user_option.of_set_option_value( "todolist_tv_level3_font_italy", String(ll_value) )
End If
ll_value = dw_settings.GetItemNumber(1, 'tv_level3_font_underline' )
If Not isnull(ll_value) Then
	gnv_user_option.of_set_option_value( "todolist_tv_level3_font_underline", String(ll_value) )
End If


//Field Width
ll_value = dw_settings.GetItemNumber(1, 'display_field1_width' )
If Not isnull(ll_value) Then
	gnv_user_option.of_set_option_value( "todolist_display_field1_width", String(ll_value) )
End If

ll_value = dw_settings.GetItemNumber(1, 'display_field2_width' )
If Not isnull(ll_value) Then
	gnv_user_option.of_set_option_value( "todolist_display_field2_width", String(ll_value) )
End If

ll_value = dw_settings.GetItemNumber(1, 'display_field3_width' )
If Not isnull(ll_value) Then
	gnv_user_option.of_set_option_value( "todolist_display_field3_width", String(ll_value) )
End If

ll_value = dw_settings.GetItemNumber(1, 'display_field4_width' )
If Not isnull(ll_value) Then
	gnv_user_option.of_set_option_value( "todolist_display_field4_width", String(ll_value) )
End If

ll_value = dw_settings.GetItemNumber(1, 'display_field5_width' )
If Not isnull(ll_value) Then
	gnv_user_option.of_set_option_value( "todolist_display_field5_width", String(ll_value) )
End If

ll_value = dw_settings.GetItemNumber(1, 'display_field6_width' )
If Not isnull(ll_value) Then
	gnv_user_option.of_set_option_value( "todolist_display_field6_width", String(ll_value) )
End If

ll_value = dw_settings.GetItemNumber(1, 'display_field7_width' )
If Not isnull(ll_value) Then
	gnv_user_option.of_set_option_value( "todolist_display_field7_width", String(ll_value) )
End If

ll_value = dw_settings.GetItemNumber(1, 'display_field8_width' )
If Not isnull(ll_value) Then
	gnv_user_option.of_set_option_value( "todolist_display_field8_width", String(ll_value) )
End If

ll_value = dw_settings.GetItemNumber(1, 'display_field9_width' )
If Not isnull(ll_value) Then
	gnv_user_option.of_set_option_value( "todolist_display_field9_width", String(ll_value) )
End If

ll_value = dw_settings.GetItemNumber(1, 'display_field10_width' )
If Not isnull(ll_value) Then
	gnv_user_option.of_set_option_value( "todolist_display_field10_width", String(ll_value) )
End If

ll_value = dw_settings.GetItemNumber(1, 'display_field11_width' )
If Not isnull(ll_value) Then
	gnv_user_option.of_set_option_value( "todolist_display_field11_width", String(ll_value) )
End If

ll_value = dw_settings.GetItemNumber(1, 'display_field12_width' )
If Not isnull(ll_value) Then
	gnv_user_option.of_set_option_value( "todolist_display_field12_width", String(ll_value) )
End If

//Added By Jay Chen 03-17-2016
ls_value = dw_settings.GetItemString(1, 'tv_level1_icon' )
If Not isnull(ls_value) and ls_value <> '' Then
	gnv_user_option.of_set_option_value( "todolist_tv_level1_icon", ls_value )
End If

ls_value = dw_settings.GetItemString(1, 'tv_level3_icon' )
If Not isnull(ls_value) and ls_value <> '' Then
	gnv_user_option.of_set_option_value( "todolist_tv_level3_icon", ls_value )
End If

gnv_user_option.of_system_save( )

Parent.of_refresh( )
end event

type dw_settings from u_dw within w_todolist_settings
integer y = 8
integer width = 2574
integer height = 1716
integer taborder = 10
string dataobject = "d_todolist_settings"
boolean vscrollbar = false
boolean border = false
borderstyle borderstyle = stylebox!
end type

event clicked;call super::clicked;Long ll_color,ll_color_org 

If This.RowCount() = 0 Then Return

If This.GetItemNumber(1, 'style') = 1 Then Return //Classic

////For Text Color
//If dwo.name = 'r_text_color' Then
//	ll_color = This.GetItemNumber(1,'tv_font_color')
//	ll_color_org = ll_color
//	ChooseColor(ll_color,gl_custom_colors[])
//	If ll_color_org <> ll_color Then
//		This.SetItem(1,'tv_font_color',ll_color)
//	End If
//End If

//For TDL BK Color
If dwo.name = 'r_bk_color' Then
	ll_color = This.GetItemNumber(1,'tv_bk_color')
	ll_color_org = ll_color
	ChooseColor(ll_color,gl_custom_colors[])
	If ll_color_org <> ll_color Then
		This.SetItem(1,'tv_bk_color',ll_color)
	End If
End If

//For Filter BK Color
If dwo.name = 'r_filter_bk_color' Then
	ll_color = This.GetItemNumber(1,'filter_bk_color')
	ll_color_org = ll_color
	ChooseColor(ll_color,gl_custom_colors[])
	If ll_color_org <> ll_color Then
		This.SetItem(1,'filter_bk_color',ll_color)
	End If
End If

//For Whole BK Color
If dwo.name = 'r_whole_bk_color' Then
	ll_color = This.GetItemNumber(1,'whole_bk_color')
	ll_color_org = ll_color
	ChooseColor(ll_color,gl_custom_colors[])
	If ll_color_org <> ll_color Then
		This.SetItem(1,'whole_bk_color',ll_color)
	End If
End If

//For Level 1 Color
If dwo.name = 'r_level1_text_color' Then
	ll_color = This.GetItemNumber(1,'tv_level1_font_color')
	ll_color_org = ll_color
	ChooseColor(ll_color,gl_custom_colors[])
	If ll_color_org <> ll_color Then
		This.SetItem(1,'tv_level1_font_color',ll_color)
	End If
End If

//For Level 2 Color
If dwo.name = 'r_level2_text_color' Then
	ll_color = This.GetItemNumber(1,'tv_level2_font_color')
	ll_color_org = ll_color
	ChooseColor(ll_color,gl_custom_colors[])
	If ll_color_org <> ll_color Then
		This.SetItem(1,'tv_level2_font_color',ll_color)
	End If
End If

//For Level 3 Color
If dwo.name = 'r_level3_text_color' Then
	ll_color = This.GetItemNumber(1,'tv_level3_font_color')
	ll_color_org = ll_color
	ChooseColor(ll_color,gl_custom_colors[])
	If ll_color_org <> ll_color Then
		This.SetItem(1,'tv_level3_font_color',ll_color)
	End If
End If

String ls_dwoname, ls_fieldname,ls_fieldtype
Long ll_need_down = -1, ll_level
ls_dwoname = dwo.name
If Left( ls_dwoname , 7) = 'p_level' Then
	ll_level = Long(Mid(ls_dwoname, 8, 1))
	If Pos(ls_dwoname, '_down') > 0 Then
		ll_need_down = 0
	End If
	If Pos(ls_dwoname, '_up') > 0 Then
		ll_need_down = 1
	End If
	If ll_need_down <> -1 Then
		If Pos(ls_dwoname, '_bold') > 0 Then
			ls_fieldtype = 'bold'
		End If
		If Pos(ls_dwoname, '_italy') > 0 Then
			ls_fieldtype = 'italy'
		End If
		If Pos(ls_dwoname, '_underline') > 0 Then
			ls_fieldtype = 'underline'
		End If		
		If ls_fieldtype <> ''  Then
			ls_fieldname = 'tv_level' + String(ll_level) + '_font_' + ls_fieldtype
			If This.Describe(ls_fieldname+'.type') = 'column' Then
				This.SetItem(1,ls_fieldname,ll_need_down )
			End If
		End If
	End If
End If
		

end event

event constructor;call super::constructor;This.InsertRow(0)
This.of_setupdateable( False )

end event

event buttonclicked;call super::buttonclicked;//Added By Jay Chen 03-17-2016

String ls_icon,ls_new_icon
str_picture lstr_picture,lstr_picture_new
If dwo.name = 'b_icon_browse1' Then
	ls_icon = This.GetitemString(1,'tv_level1_icon')
	If isnumber(ls_icon) Then  //For Picture Painter
		lstr_picture.al_pic_id = Long(ls_icon)
		lstr_picture.ab_support_picture_painter = True
	Else //For system picture.
		lstr_picture.as_pic_file  = ls_icon
		lstr_picture.ab_support_picture_painter = True		
	End If
	
	//Begin - Added By jay 2016-04-14.  No support ico select for PB
	if AppeonGetClientType() = 'PB' then
		lstr_picture.as_support_ico_type = '0'
	Else
		lstr_picture.as_support_ico_type = '1'
	End If
	//End - Added By jay 2016-04-14.
	
	OpenwithParm(w_icon_select,lstr_picture)
	If isvalid(Message.powerobjectparm ) Then
		lstr_picture_new = Message.Powerobjectparm		
		If lstr_picture_new.al_pic_id > 0 Then
			This.SetItem(1,'tv_level1_icon', String(lstr_picture_new.al_pic_id)) 
			of_set_icon('b_icon_browse1')
		ElseIf lstr_picture_new.as_pic_file <> '' Then
			This.SetItem(1,'tv_level1_icon', lstr_picture_new.as_pic_file)
			of_set_icon('b_icon_browse1' )
		End If
	End If
End If

If dwo.name = 'b_icon_browse3' Then
	ls_icon = This.GetitemString(1,'tv_level3_icon')
	If isnumber(ls_icon) Then  //For Picture Painter
		lstr_picture.al_pic_id = Long(ls_icon)
		lstr_picture.ab_support_picture_painter = True
	Else //For system picture.
		lstr_picture.as_pic_file  = ls_icon
		lstr_picture.ab_support_picture_painter = True		
	End If
	
	//Begin - Added By jay 2016-04-14.  No support ico select for PB
	if AppeonGetClientType() = 'PB' then
		lstr_picture.as_support_ico_type = '0'
	Else
		lstr_picture.as_support_ico_type = '1'
	End If
	//End - Added By jay 2016-04-14.

	OpenwithParm(w_icon_select,lstr_picture)
	If isvalid(Message.powerobjectparm ) Then
		lstr_picture_new = Message.Powerobjectparm		
		If lstr_picture_new.al_pic_id > 0 Then
			This.SetItem(1,'tv_level3_icon', String(lstr_picture_new.al_pic_id)) 
			of_set_icon('b_icon_browse3')
		ElseIf lstr_picture_new.as_pic_file <> '' Then
			This.SetItem(1,'tv_level3_icon', lstr_picture_new.as_pic_file)
			of_set_icon('b_icon_browse3' )
		End If		
	End If
End If


end event

event itemchanged;call super::itemchanged;//Added By Jay Chen 03-17-2016
if dwo.name = 'style' then
  choose case long(data)
	case 1
		this.modify("b_icon_browse1.enabled = false") 
		this.modify("b_icon_browse3.enabled = false")
	case 2
		this.modify("b_icon_browse1.enabled = true")
		this.modify("b_icon_browse3.enabled = true")
end choose
end if
end event

