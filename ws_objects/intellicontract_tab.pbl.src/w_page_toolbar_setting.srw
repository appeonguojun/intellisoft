$PBExportHeader$w_page_toolbar_setting.srw
forward
global type w_page_toolbar_setting from w_response
end type
type cbx_use_icon from checkbox within w_page_toolbar_setting
end type
type p_icon4 from picture within w_page_toolbar_setting
end type
type p_icon3 from picture within w_page_toolbar_setting
end type
type p_icon2 from picture within w_page_toolbar_setting
end type
type p_icon1 from picture within w_page_toolbar_setting
end type
type cb_close from commandbutton within w_page_toolbar_setting
end type
type cb_save from commandbutton within w_page_toolbar_setting
end type
type dw_settings from u_dw within w_page_toolbar_setting
end type
end forward

global type w_page_toolbar_setting from w_response
integer width = 2011
integer height = 948
string title = "Page Toolbar Settings"
cbx_use_icon cbx_use_icon
p_icon4 p_icon4
p_icon3 p_icon3
p_icon2 p_icon2
p_icon1 p_icon1
cb_close cb_close
cb_save cb_save
dw_settings dw_settings
end type
global w_page_toolbar_setting w_page_toolbar_setting

type variables
n_cst_dm_utils inv_utils //Added By Jay Chen 03-17-2016
end variables

forward prototypes
public subroutine of_refresh ()
public subroutine of_set_icon (string as_name)
end prototypes

public subroutine of_refresh ();gnv_user_option.of_system_retrieve( )

String ls_value,ls_pic_file,ls_pic_file3

//ls_value = gnv_user_option.of_get_option_value( "page_toolbar_text_color" )
//If isnull(ls_value) or ls_value = '' Then ls_value = String(RGB(0,0,0))
//If not isnull(ls_value) and ls_value <> '' Then
//	dw_settings.SetItem(1, 'fields_textcolor', Long(ls_value))
//	dw_settings.modify("t_fields_textcolor.background.color = " + ls_value) 
//end if
//
//ls_value = gnv_user_option.of_get_option_value( "page_toolbar_back_color" )
//If isnull(ls_value) or ls_value = '' Then ls_value = String(RGB(244,245,245))
//If not isnull(ls_value) and ls_value <> '' Then
//	dw_settings.SetItem(1, 'fields_textbkcolor', Long(ls_value))
//	dw_settings.modify("t_fields_textbkcolor.background.color = " + ls_value) 
//end if

ls_value = gnv_user_option.of_get_option_value( "page_toolbar_x" )
If isnull(ls_value) or ls_value = '' Then ls_value = '3118'
dw_settings.SetItem(1, 'x', Long(ls_value))

ls_value = gnv_user_option.of_get_option_value( "page_toolbar_y" )
If isnull(ls_value) or ls_value = '' Then ls_value = '1716'
dw_settings.SetItem(1, 'y', Long(ls_value))

ls_value = gnv_user_option.of_get_option_value( "page_toolbar_width" )
If isnull(ls_value) or ls_value = '' Then ls_value = '670'
dw_settings.SetItem(1, 'width', Long(ls_value))

ls_value = gnv_user_option.of_get_option_value( "page_toolbar_height" )
If isnull(ls_value) or ls_value = '' Then ls_value = '100'
dw_settings.SetItem(1, 'height', Long(ls_value))

ls_value = gnv_user_option.of_get_option_value( "page_toolbar_icon1" )
If isnull(ls_value) then ls_value = ''
if ls_value = '' then ls_value = 'VCRFirst!'
if isnumber(ls_value) then
	inv_utils.of_download_picture( Long(ls_value), ls_pic_file)
end if
if ls_value <> '' then
	dw_settings.SetItem(1, 'pb_icon1', ls_value)
	dw_settings.Modify( 'p_pic1.filename = "' +ls_pic_file+ '"' )
	if not isnumber(ls_value) then of_set_icon('b_icon1' )
end if

ls_value = gnv_user_option.of_get_option_value( "page_toolbar_icon2" )
If isnull(ls_value) then ls_value = ''
if ls_value = '' then ls_value = 'VCRPrior!'
if isnumber(ls_value) then
	inv_utils.of_download_picture( Long(ls_value), ls_pic_file)
end if
if ls_value <> '' then
	dw_settings.SetItem(1, 'pb_icon2', ls_value)
	dw_settings.Modify( 'p_pic2.filename = "' +ls_pic_file+ '"' )
	if not isnumber(ls_value) then of_set_icon('b_icon2' )
end if

ls_value = gnv_user_option.of_get_option_value( "page_toolbar_icon3" )
If isnull(ls_value) then ls_value = ''
if ls_value = '' then ls_value = 'VCRNext!'
if isnumber(ls_value) then
	inv_utils.of_download_picture( Long(ls_value), ls_pic_file)
end if
if ls_value <> '' then
	dw_settings.SetItem(1, 'pb_icon3', ls_value)
	dw_settings.Modify( 'p_pic3.filename = "' +ls_pic_file+ '"' )
	if not isnumber(ls_value) then of_set_icon('b_icon3' )
end if

ls_value = gnv_user_option.of_get_option_value( "page_toolbar_icon4" )
If isnull(ls_value) then ls_value = ''
if ls_value = '' then ls_value = 'VCRLast!'
if isnumber(ls_value) then
	inv_utils.of_download_picture( Long(ls_value), ls_pic_file)
end if
if ls_value <> '' then
	dw_settings.SetItem(1, 'pb_icon4', ls_value)
	dw_settings.Modify( 'p_pic4.filename = "' +ls_pic_file+ '"' )
	if not isnumber(ls_value) then of_set_icon('b_icon4' )
end if

//ls_value = gnv_user_option.of_get_option_value( "page_toolbar_use_icon" )
//If isnull(ls_value) or ls_value = '' then ls_value = '0'
//if ls_value = '0' then
//	cbx_use_icon.checked = false
//	dw_settings.modify("b_icon1.enabled = false")
//	dw_settings.modify("b_icon2.enabled = false")
//	dw_settings.modify("b_icon3.enabled = false")
//	dw_settings.modify("b_icon4.enabled = false")
//	dw_settings.modify("t_fields_textcolor.visible = 1")
//	dw_settings.modify("t_fields_textbkcolor.visible = 1")
//	dw_settings.modify("fields_textcolor.background.color = " + string(RGB(255,255,255)) )
//	dw_settings.modify("fields_textbkcolor.background.color = " + string(RGB(255,255,255)) )
//else
//	cbx_use_icon.checked = true
//	dw_settings.modify("b_icon1.enabled = true")
//	dw_settings.modify("b_icon2.enabled = true")
//	dw_settings.modify("b_icon3.enabled = true")
//	dw_settings.modify("b_icon4.enabled = true")
//	dw_settings.modify("t_fields_textcolor.visible = 0")
//	dw_settings.modify("t_fields_textbkcolor.visible = 0")
//	dw_settings.modify("fields_textcolor.background.color = " + string(RGB(245,245,245)) )
//	dw_settings.modify("fields_textbkcolor.background.color = " + string(RGB(245,245,245)) )
//end if

end subroutine

public subroutine of_set_icon (string as_name);//Added By Jay Chen 03-24-2016

Long ll_icon_x,ll_icon_y
String ls_icon,ls_pic_file
Boolean lb_from_picture_painter

If dw_settings.RowCount() <= 0 Then Return
choose case as_name
	case 'b_icon1'
		ls_icon = dw_settings.GetItemString(1,'pb_icon1')
	case 'b_icon2'
		ls_icon = dw_settings.GetItemString(1,'pb_icon2')
	case 'b_icon3'
		ls_icon = dw_settings.GetItemString(1,'pb_icon3')
	case 'b_icon4'
		ls_icon = dw_settings.GetItemString(1,'pb_icon4')
end choose 

If isnull(ls_icon) or ls_icon = '' Then
	if as_name = 'b_icon1' then
		p_icon1.picturename = 'VCRFirst!'
		dw_settings.SetItem(1,'pb_icon1','VCRFirst!')
	elseif as_name = 'b_icon2' then
		p_icon2.picturename = 'VCRPrior!'
		dw_settings.SetItem(1,'pb_icon2','VCRPrior!')
	elseif as_name = 'b_icon3' then
		p_icon3.picturename = 'VCRNext!'
		dw_settings.SetItem(1,'pb_icon3','VCRNext!')
	else
		p_icon4.picturename = 'VCRLast!'
		dw_settings.SetItem(1,'pb_icon4','VCRLast!')
	end if
ElseIf isnumber(ls_icon) Then //From Picture Painter 
	inv_utils.of_download_picture( Long(ls_icon), ls_pic_file)
	if as_name = 'b_icon1' then
		p_icon1.picturename = "" 
		dw_settings.Modify( 'p_pic1.filename = "' +ls_pic_file+ '"' )
	elseif as_name = "b_icon2" then
		p_icon2.picturename = "" 
		dw_settings.Modify( 'p_pic2.filename = "' +ls_pic_file+ '"' )
	elseif as_name = "b_icon3" then
		p_icon3.picturename = "" 
		dw_settings.Modify( 'p_pic3.filename = "' +ls_pic_file+ '"' )
	else
		p_icon4.picturename = "" 
		dw_settings.Modify( 'p_pic4.filename = "' +ls_pic_file+ '"' )
	end if
Else
	if as_name = 'b_icon1' then
		p_icon1.picturename = ls_icon
	elseif as_name = "b_icon2" then
		p_icon2.picturename = ls_icon
	elseif as_name = "b_icon3" then
		p_icon3.picturename = ls_icon
	elseif as_name = "b_icon4" then
		p_icon4.picturename = ls_icon
	end if
End If

if as_name = 'b_icon1' then
	if p_icon1.picturename = '' then 
		p_icon1.visible = false
	else
		p_icon1.visible = true
	end if
//	dw_settings.SetRowFocusIndicator(p_icon1,p_icon1.x,p_icon1.y)
elseif as_name = "b_icon2" then
	if p_icon2.picturename = '' then 
		p_icon2.visible = false
	else
		p_icon2.visible = true
	end if
//	dw_settings.SetRowFocusIndicator(p_icon2,p_icon2.x,p_icon2.y)
elseif as_name = "b_icon3" then
	if p_icon3.picturename = '' then 
		p_icon3.visible = false
	else
		p_icon3.visible = true
	end if
//	dw_settings.SetRowFocusIndicator(p_icon3,p_icon3.x,p_icon3.y)
elseif as_name = "b_icon4" then
	if p_icon4.picturename = '' then 
		p_icon4.visible = false
	else
		p_icon4.visible = true
	end if
//	dw_settings.SetRowFocusIndicator(p_icon4,p_icon4.x,p_icon4.y)
end if








end subroutine

on w_page_toolbar_setting.create
int iCurrent
call super::create
this.cbx_use_icon=create cbx_use_icon
this.p_icon4=create p_icon4
this.p_icon3=create p_icon3
this.p_icon2=create p_icon2
this.p_icon1=create p_icon1
this.cb_close=create cb_close
this.cb_save=create cb_save
this.dw_settings=create dw_settings
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cbx_use_icon
this.Control[iCurrent+2]=this.p_icon4
this.Control[iCurrent+3]=this.p_icon3
this.Control[iCurrent+4]=this.p_icon2
this.Control[iCurrent+5]=this.p_icon1
this.Control[iCurrent+6]=this.cb_close
this.Control[iCurrent+7]=this.cb_save
this.Control[iCurrent+8]=this.dw_settings
end on

on w_page_toolbar_setting.destroy
call super::destroy
destroy(this.cbx_use_icon)
destroy(this.p_icon4)
destroy(this.p_icon3)
destroy(this.p_icon2)
destroy(this.p_icon1)
destroy(this.cb_close)
destroy(this.cb_save)
destroy(this.dw_settings)
end on

event open;call super::open;//Added By Jay Chen 03-29-2016
if isvalid(gw_contract.tab_contract_details.tabpage_search.uo_page) then
	gw_contract.of_save_pagebar_position()
end if

of_refresh()

end event

type cbx_use_icon from checkbox within w_page_toolbar_setting
boolean visible = false
integer x = 18
integer y = 772
integer width = 686
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Add icon for page toolbar"
boolean checked = true
end type

event clicked;if this.checked = false then
	dw_settings.modify("b_icon1.enabled = false")
	dw_settings.modify("b_icon2.enabled = false")
	dw_settings.modify("b_icon3.enabled = false")
	dw_settings.modify("b_icon4.enabled = false")
	dw_settings.modify("t_fields_textcolor.visible = 1")
	dw_settings.modify("t_fields_textbkcolor.visible = 1")
	dw_settings.modify("fields_textcolor.background.color = " + string(RGB(255,255,255)) )
	dw_settings.modify("fields_textbkcolor.background.color = " + string(RGB(255,255,255)) )
else
	dw_settings.modify("b_icon1.enabled = true")
	dw_settings.modify("b_icon2.enabled = true")
	dw_settings.modify("b_icon3.enabled = true")
	dw_settings.modify("b_icon4.enabled = true")
	dw_settings.modify("t_fields_textcolor.visible = 0")
	dw_settings.modify("t_fields_textbkcolor.visible = 0")
	dw_settings.modify("fields_textcolor.background.color = " + string(RGB(245,245,245)) )
	dw_settings.modify("fields_textbkcolor.background.color = " + string(RGB(245,245,245)) )
end if
end event

type p_icon4 from picture within w_page_toolbar_setting
boolean visible = false
integer x = 1563
integer y = 600
integer width = 91
integer height = 80
boolean focusrectangle = false
end type

type p_icon3 from picture within w_page_toolbar_setting
boolean visible = false
integer x = 517
integer y = 600
integer width = 91
integer height = 80
boolean focusrectangle = false
end type

type p_icon2 from picture within w_page_toolbar_setting
boolean visible = false
integer x = 1563
integer y = 440
integer width = 91
integer height = 80
boolean focusrectangle = false
end type

type p_icon1 from picture within w_page_toolbar_setting
boolean visible = false
integer x = 517
integer y = 440
integer width = 91
integer height = 80
boolean focusrectangle = false
end type

type cb_close from commandbutton within w_page_toolbar_setting
integer x = 1627
integer y = 752
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

type cb_save from commandbutton within w_page_toolbar_setting
integer x = 1266
integer y = 752
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

event clicked;//Added By Jay Chen 03-24-2016
String ls_value
Long ll_value,ll_x,ll_y,ll_width,ll_height
	
dw_settings.AcceptText()

//ll_value = dw_settings.GetItemNumber(1, 'fields_textcolor' )
//If Not isnull(ll_value) Then
//	gnv_user_option.of_set_option_value( "page_toolbar_text_color", String(ll_value) )
//	if isvalid(gw_contract.tab_contract_details.tabpage_search.uo_page) then
//		gw_contract.tab_contract_details.tabpage_search.uo_page.pb_1.textcolor = ll_value
//		gw_contract.tab_contract_details.tabpage_search.uo_page.pb_2.textcolor = ll_value
//		gw_contract.tab_contract_details.tabpage_search.uo_page.pb_3.textcolor = ll_value
//		gw_contract.tab_contract_details.tabpage_search.uo_page.pb_4.textcolor = ll_value
//		gw_contract.tab_contract_details.tabpage_search.uo_page.sle_page.textcolor = ll_value
//	end if
//End If

//ll_value = dw_settings.GetItemNumber(1, 'fields_textbkcolor' )
//If Not isnull(ll_value) Then
//	gnv_user_option.of_set_option_value( "page_toolbar_back_color", String(ll_value) )
//	if isvalid(gw_contract.tab_contract_details.tabpage_search.uo_page) then
//		gw_contract.tab_contract_details.tabpage_search.uo_page.pb_1.backcolor = ll_value
//		gw_contract.tab_contract_details.tabpage_search.uo_page.pb_2.backcolor = ll_value
//		gw_contract.tab_contract_details.tabpage_search.uo_page.pb_3.backcolor = ll_value
//		gw_contract.tab_contract_details.tabpage_search.uo_page.pb_4.backcolor = ll_value
//		gw_contract.tab_contract_details.tabpage_search.uo_page.sle_page.backcolor = ll_value
//	end if
//End If

ll_x = dw_settings.GetItemNumber(1, 'x' )
If Not isnull(ll_x) Then
	gnv_user_option.of_set_option_value( "page_toolbar_x", String(ll_x) )
End If

ll_y = dw_settings.GetItemNumber(1, 'y' )
If Not isnull(ll_y) Then
	gnv_user_option.of_set_option_value( "page_toolbar_y", String(ll_y) )
End If

ll_width = dw_settings.GetItemNumber(1, 'width' )
If Not isnull(ll_width) Then
	gnv_user_option.of_set_option_value( "page_toolbar_width", String(ll_width) )
End If

ll_height = dw_settings.GetItemNumber(1, 'height' )
If Not isnull(ll_height) Then
	gnv_user_option.of_set_option_value( "page_toolbar_height", String(ll_height) )
End If

//if isvalid(gw_contract.tab_contract_details.tabpage_search.uo_page) then
//	if not isnull(ll_x) and ll_x <> 0 then gw_contract.tab_contract_details.tabpage_search.uo_page.x = ll_x
//	if not isnull(ll_y) and ll_y <> 0 then gw_contract.tab_contract_details.tabpage_search.uo_page.y = ll_y
//	if not isnull(ll_width) and ll_width <> 0 then gw_contract.tab_contract_details.tabpage_search.uo_page.width = ll_width
//	if not isnull(ll_height) and ll_height <> 0 then gw_contract.tab_contract_details.tabpage_search.uo_page.height = ll_height
//end if

ls_value = dw_settings.GetItemString(1, 'pb_icon1' )
If Not isnull(ls_value) and ls_value <> '' Then
	gnv_user_option.of_set_option_value( "page_toolbar_icon1", ls_value )
End If

ls_value = dw_settings.GetItemString(1, 'pb_icon2' )
If Not isnull(ls_value) and ls_value <> '' Then
	gnv_user_option.of_set_option_value( "page_toolbar_icon2", ls_value )
End If

ls_value = dw_settings.GetItemString(1, 'pb_icon3' )
If Not isnull(ls_value) and ls_value <> '' Then
	gnv_user_option.of_set_option_value( "page_toolbar_icon3", ls_value )
End If

ls_value = dw_settings.GetItemString(1, 'pb_icon4' )
If Not isnull(ls_value) and ls_value <> '' Then
	gnv_user_option.of_set_option_value( "page_toolbar_icon4", ls_value )
End If

if cbx_use_icon.checked then
	ls_value = '1'
else
	ls_value = '0'
end if
gnv_user_option.of_set_option_value( "page_toolbar_use_icon", ls_value )

gnv_user_option.of_system_save( )

if isvalid(gw_contract) then
	gw_contract.tab_contract_details.tabpage_search.of_page_toolbar()
end if

//Parent.of_refresh( )
end event

type dw_settings from u_dw within w_page_toolbar_setting
integer x = 18
integer y = 8
integer width = 1957
integer height = 724
integer taborder = 10
string dataobject = "d_pagetoolbar_setting"
boolean vscrollbar = false
borderstyle borderstyle = stylebox!
end type

event clicked;call super::clicked;//Added By Jay Chen 03-24-2016

Long ll_color
Long ll_default_color[]

if row < 1 then return
this.AcceptText()

choose case dwo.name
	case 't_fields_textcolor'
		gl_custom_colors[16] = RGB(66,66,66)
		ll_color = long(This.describe("t_fields_textcolor.background.color"))
		ChooseColor(ll_color,gl_custom_colors[])
		This.modify("t_fields_textcolor.background.color = " + string(ll_color) )
		This.setitem(1, "fields_textcolor", ll_color)
		
	case 't_fields_textbkcolor'
		gl_custom_colors[16] = RGB(244,245,245)
		ll_color = long(This.describe("t_fields_textbkcolor.background.color"))
		ChooseColor(ll_color,gl_custom_colors[])
		This.modify("t_fields_textbkcolor.background.color = " + string(ll_color) )
		This.setitem(1, "fields_textbkcolor", ll_color)
end choose

end event

event constructor;call super::constructor;This.InsertRow(0)
This.of_setupdateable( False )

end event

event buttonclicked;call super::buttonclicked;//Added By Jay Chen 03-24-2016
String ls_icon,ls_new_icon
str_picture lstr_picture,lstr_picture_new

If dwo.name = 'b_icon1' or dwo.name = 'b_icon2' or dwo.name = 'b_icon3' or dwo.name = 'b_icon4' Then
	if dwo.name = 'b_icon1' then
		ls_icon = This.GetitemString(1,'pb_icon1')
		if isnull(ls_icon) or ls_icon = '' then ls_icon = 'VCRFirst!'
	elseif dwo.name = 'b_icon2' then
		ls_icon = This.GetitemString(1,'pb_icon2')
		if isnull(ls_icon) or ls_icon = '' then ls_icon = 'VCRPrior!'
	elseif dwo.name = 'b_icon3' then
		ls_icon = This.GetitemString(1,'pb_icon3')
		if isnull(ls_icon) or ls_icon = '' then ls_icon = 'VCRNext!'
	elseif dwo.name = 'b_icon4' then
		ls_icon = This.GetitemString(1,'pb_icon4')
		if isnull(ls_icon) or ls_icon = '' then ls_icon = 'VCRLast!'
	end if
	
	If isnumber(ls_icon) Then  
		lstr_picture.al_pic_id = Long(ls_icon)
		lstr_picture.ab_support_picture_painter = True
	Else 
		lstr_picture.as_pic_file  = ls_icon
		lstr_picture.ab_support_picture_painter = True		
	End If
	OpenwithParm(w_icon_select,lstr_picture)
	If isvalid(Message.powerobjectparm ) Then
		lstr_picture_new = Message.Powerobjectparm
		If lstr_picture_new.al_pic_id > 0 Then
			if dwo.name = 'b_icon1' then
				This.SetItem(1,'pb_icon1', String(lstr_picture_new.al_pic_id)) 
			elseif dwo.name = 'b_icon2' then
				This.SetItem(1,'pb_icon2', String(lstr_picture_new.al_pic_id)) 
			elseif dwo.name = 'b_icon3' then
				This.SetItem(1,'pb_icon3', String(lstr_picture_new.al_pic_id)) 
			elseif dwo.name = 'b_icon4' then
				This.SetItem(1,'pb_icon4', String(lstr_picture_new.al_pic_id)) 
			end if
		ElseIf lstr_picture_new.as_pic_file <> '' Then
			if dwo.name = 'b_icon1' then
				This.SetItem(1,'pb_icon1', lstr_picture_new.as_pic_file)
			elseif dwo.name = 'b_icon2' then
				This.SetItem(1,'pb_icon2', lstr_picture_new.as_pic_file) 
			elseif dwo.name = 'b_icon3' then
				This.SetItem(1,'pb_icon3', lstr_picture_new.as_pic_file)
			elseif dwo.name = 'b_icon4' then
				This.SetItem(1,'pb_icon4', lstr_picture_new.as_pic_file)
			end if
		End If
		of_set_icon(dwo.name)
	End If
End If


end event

event itemchanged;call super::itemchanged;////Added By Jay Chen 03-17-2016
//if dwo.name = 'style' then
//  choose case long(data)
//	case 1
//		this.modify("b_icon_browse1.enabled = false") 
//		this.modify("b_icon_browse3.enabled = false")
//	case 2
//		this.modify("b_icon_browse1.enabled = true")
//		this.modify("b_icon_browse3.enabled = true")
//end choose
//end if
end event

