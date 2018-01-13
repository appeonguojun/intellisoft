$PBExportHeader$w_contract_dw_properties.srw
forward
global type w_contract_dw_properties from w_popup
end type
type dw_properties_dw from u_dw within w_contract_dw_properties
end type
type cb_ok from u_cb within w_contract_dw_properties
end type
type cb_cancel from u_cb within w_contract_dw_properties
end type
end forward

global type w_contract_dw_properties from w_popup
integer x = 1783
integer y = 32
integer width = 1111
integer height = 1440
string title = "DataWindow Properties"
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
long backcolor = 79680469
boolean center = true
dw_properties_dw dw_properties_dw
cb_ok cb_ok
cb_cancel cb_cancel
end type
global w_contract_dw_properties w_contract_dw_properties

type variables
String		is_ScreenStyle
boolean ib_rowcolor = false,ib_required_rows = false
end variables

forward prototypes
public function integer of_showcolor ()
public function integer of_parsecolor (ref long al_color)
end prototypes

public function integer of_showcolor ();long ll_Row

dw_properties_dw.AcceptText()
ll_Row = dw_properties_dw.GetRow()
if ll_Row <= 0 then Return -1

dw_properties_dw.object.t_background_color.background.color = dw_properties_dw.object.background_color[ll_Row]
//Added By Jay Chen 01-15-2014
dw_properties_dw.object.t_screen_singlerow_color.background.color = dw_properties_dw.object.screen_singlerow_color[ll_Row]
dw_properties_dw.object.t_screen_doublerow_color.background.color = dw_properties_dw.object.screen_doublerow_color[ll_Row]

Return 1
end function

public function integer of_parsecolor (ref long al_color);if IsNull(al_Color) or al_Color = 33554432 then
	al_Color = RGB(0,0,0)
elseif al_Color = 67108864 then
	al_Color = RGB(212,208,200)
end if

Return 1
end function

on w_contract_dw_properties.create
int iCurrent
call super::create
this.dw_properties_dw=create dw_properties_dw
this.cb_ok=create cb_ok
this.cb_cancel=create cb_cancel
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_properties_dw
this.Control[iCurrent+2]=this.cb_ok
this.Control[iCurrent+3]=this.cb_cancel
end on

on w_contract_dw_properties.destroy
call super::destroy
destroy(this.dw_properties_dw)
destroy(this.cb_ok)
destroy(this.cb_cancel)
end on

event closequery;//override
end event

event pfc_postopen;call super::pfc_postopen;
string			ls_gd, ls_ff
string ls_alter_screenrow_flag,ls_singlerow_color,ls_doublerow_color,ls_string //Added By Jay Chen 01-15-2014
long ll_cnt
boolean lb_rowcolor_visible = false
string ls_multirow_screen=',2,4,6,7,11,14,15,16,18,19,20,21,22,25,26,27,28,29,31,33,42,43,46,47,50,53,54,55,56,57,'
string ls_required_rows = ',4,' //Added By Jay Chen 07-13-2015 
string ls_required_rows_flag

If dw_Properties_dw.getRow()>0 Then
	ls_gd = dw_Properties_dw.GetItemString( dw_Properties_dw.GetRow( ), 'grid_dataobject' )
	ls_ff = dw_Properties_dw.GetItemString( dw_Properties_dw.GetRow( ), 'dataobject' )	
	
	If   isnull(  ls_gd ) Or Trim(   ls_gd ) = '' or isnull( ls_ff) or trim( ls_ff) = ''  Then
		dw_Properties_dw.Modify("screen_style.RadioButtons.3D=No")
	Else
		dw_Properties_dw.Modify("screen_style.RadioButtons.3D=Yes") 
	End If
	is_ScreenStyle = dw_Properties_dw.GetItemString( dw_Properties_dw.GetRow( ), 'screen_style' )
	
	//Added By Jay Chen 01-21-2014
	if pos(ls_multirow_screen, ',' + string(w_contract_data_design.uo_design.ii_screen_id) + ',') <= 0 then
		dw_Properties_dw.modify("alter_screenrow_color_flag.visible = '0'")
		dw_Properties_dw.modify("b_color_setting.visible = '0'")
		dw_Properties_dw.modify("screen_singlerow_color_t.visible = '0'")
		dw_Properties_dw.modify("screen_singlerow_color.visible = '0'")
		dw_Properties_dw.modify("t_screen_singlerow_color.visible = '0'")
		dw_Properties_dw.modify("b_color1.visible = '0'")
		dw_Properties_dw.modify("b_default1.visible = '0'")
		dw_Properties_dw.modify("t_3.visible = '0'")
		dw_Properties_dw.modify("screen_doublerow_color.visible = '0'")
		dw_Properties_dw.modify("t_screen_doublerow_color.visible = '0'")
		dw_Properties_dw.modify("b_color2.visible = '0'")
		dw_Properties_dw.modify("b_default2.visible = '0'")
		dw_Properties_dw.modify("l_1.visible = '0'")
		dw_Properties_dw.modify("l_2.visible = '0'")
		dw_Properties_dw.modify("l_3.visible = '0'")
		ib_rowcolor = false
	else
		ib_rowcolor = true
	end if
	
	//Added By Jay Chen 01-15-2014
	if ib_rowcolor = true then
		ls_string = string(w_contract_data_design.uo_design.il_select_view) + '-' + string(w_contract_data_design.uo_design.ii_screen_id)
		ls_alter_screenrow_flag = gnv_user_option.of_get_option_value('screenrowcolor' + ls_string, "alter_screenrow_color_flag")
		ls_singlerow_color = gnv_user_option.of_get_option_value('screenrowcolor' + ls_string, "screen_singlerow_color")
		ls_doublerow_color = gnv_user_option.of_get_option_value('screenrowcolor' + ls_string, "screen_doublerow_color")
		if isnull(ls_alter_screenrow_flag) or ls_alter_screenrow_flag = '' then ls_alter_screenrow_flag='0'
		if isnull(ls_singlerow_color) or ls_singlerow_color = '' then ls_singlerow_color='16709598'
		if isnull(ls_doublerow_color) or ls_doublerow_color = '' then ls_doublerow_color='67108864'
		dw_Properties_dw.setitem(dw_Properties_dw.getRow(),"alter_screenrow_color_flag", ls_alter_screenrow_flag)
		dw_Properties_dw.setitem(dw_Properties_dw.getRow(),"screen_singlerow_color", long(ls_singlerow_color))
		dw_Properties_dw.setitem(dw_Properties_dw.getRow(),"screen_doublerow_color", long(ls_doublerow_color))
		dw_Properties_dw.SetItemStatus(dw_Properties_dw.getRow(),0, Primary!, NotModified!)
	end if
	
	//Added By Jay Chen 07-13-2015
	if pos(ls_required_rows, ',' + string(w_contract_data_design.uo_design.ii_screen_id) + ',') <= 0 then
		dw_Properties_dw.modify("required_rows.visible = '0'")
		dw_Properties_dw.modify("b_required_rows.visible = '0'")
		ib_required_rows = false
		dw_Properties_dw.modify("alter_screenrow_color_flag.y = 484")
		dw_Properties_dw.modify("b_color_setting.y = 480")
		dw_Properties_dw.modify("screen_singlerow_color_t.y = 548")
		dw_Properties_dw.modify("screen_singlerow_color.y = 548")
		dw_Properties_dw.modify("t_screen_singlerow_color.y = 548")
		dw_Properties_dw.modify("b_color1.y = 544")
		dw_Properties_dw.modify("b_default1.y = 544")
		dw_Properties_dw.modify("t_3.y = 628")
		dw_Properties_dw.modify("screen_doublerow_color.y = 628")
		dw_Properties_dw.modify("t_screen_doublerow_color.y = 628")
		dw_Properties_dw.modify("b_color2.y = 624")
		dw_Properties_dw.modify("b_default2.y = 624")
		dw_Properties_dw.modify("l_1.y1 = 556")
		dw_Properties_dw.modify("l_1.y2 = 660")
		dw_Properties_dw.modify("l_2.y1 = 584")
		dw_Properties_dw.modify("l_2.y2 = 584")
		dw_Properties_dw.modify("l_3.y1 = 660")
		dw_Properties_dw.modify("l_3.y2 = 660")
	else
		ib_required_rows = true
		ls_string = string(w_contract_data_design.uo_design.il_select_view) + '-' + string(w_contract_data_design.uo_design.ii_screen_id)
		ls_required_rows_flag = gnv_user_option.of_get_option_value('requiredrows' + ls_string, "required_rows")
		if isnull(ls_required_rows_flag) or ls_required_rows_flag = '' then ls_required_rows_flag='0'
		dw_Properties_dw.setitem(dw_Properties_dw.getRow(),"required_rows", ls_required_rows_flag)
		dw_Properties_dw.SetItemStatus(dw_Properties_dw.getRow(),0, Primary!, NotModified!)
	end if
	//end
	
End If

of_ShowColor()





end event

event key;call super::key;if Key = KeyEscape! then Close(This)

end event

type dw_properties_dw from u_dw within w_contract_dw_properties
integer x = 14
integer y = 12
integer width = 1061
integer height = 1176
integer taborder = 10
string dataobject = "d_contract_dw_properties"
boolean vscrollbar = false
end type

event buttonclicked;call super::buttonclicked;long ll_Color

this.AcceptText()
if Row <= 0 then Return

choose case dwo.name
	case "b_color"
		ll_Color = this.object.background_color[Row]
		of_ParseColor(ll_Color)
		if ChooseColor(ll_Color,gl_custom_colors[]) = 1 then
			this.object.background_color[Row] = ll_Color
			this.SetColumn("background_color")
			this.Event ItemChanged(Row, this.object.background_color, String(ll_Color))
		end if		
	case "b_default"
		this.object.background_color[Row] = 67108864
		this.SetColumn("background_color")
		this.Event ItemChanged(Row, this.object.background_color, "67108864")
	//Added By Jay Chen 01-15-2014
	case "b_color1"
		ll_Color = this.object.screen_singlerow_color[Row]
		of_ParseColor(ll_Color)
		if ChooseColor(ll_Color,gl_custom_colors[]) = 1 then
			this.object.screen_singlerow_color[Row] = ll_Color
			this.SetColumn("screen_singlerow_color")
			this.Event ItemChanged(Row, this.object.screen_singlerow_color, String(ll_Color))
		end if		
	case "b_color2"
		ll_Color = this.object.screen_doublerow_color[Row]
		of_ParseColor(ll_Color)
		if ChooseColor(ll_Color,gl_custom_colors[]) = 1 then
			this.object.screen_doublerow_color[Row] = ll_Color
			this.SetColumn("screen_doublerow_color")
			this.Event ItemChanged(Row, this.object.screen_doublerow_color, String(ll_Color))
		end if		
	case 'b_color_setting'
		Messagebox('Alternate Row Colors Setting Help',+&
		"When you turn on this function it will:~r~n" + &
		"Odd Row Color: The odd rows will display this setting color value.~r~n" + & 
		"Even Row Color:The even rows will display this setting color value.~r~n"+ & 
		"Automatically changes the background colors of all fields and texts to transparent color.~r~n"+ &
		"Reduces the speed to open the Contract Folder window by about one second.")
	case "b_default1"
		this.object.screen_singlerow_color[Row] = 67108864
		this.SetColumn("screen_singlerow_color")
		this.Event ItemChanged(Row, this.object.screen_singlerow_color, "67108864")
	case "b_default2"
		this.object.screen_doublerow_color[Row] = 67108864
		this.SetColumn("screen_doublerow_color")
		this.Event ItemChanged(Row, this.object.screen_doublerow_color, "67108864")
	case 'b_required_rows'
		Messagebox('Entry Required Help',"When checked the user must enter data in this screen before saving the contract.")
end choose


end event

event itemchanged;call super::itemchanged;if dwo.name = "background_color" or dwo.name = "screen_singlerow_color" or dwo.name = "screen_doublerow_color" then //Added By Jay Chen 01-16-2014
	of_ShowColor()
end if

//Added By Jay Chen 01-16-2014
if dwo.name = "alter_screenrow_color_flag" or dwo.name = "screen_singlerow_color" or dwo.name = "screen_doublerow_color" then
	w_contract_data_design.il_SaveResult = 1
end if
	
Long				ll_Handle, ll_FindRow

AcceptText( )

If dwo.name = 'screen_style' Then//added by gavins 20120307 grid
	If MessageBox( 'Screen', 'Are you sure you want to change the screen style?' ,question!, yesno!, 1 ) = 1 Then
		If w_contract_data_design.uo_design.of_CheckModified( )  = 1 Then 
			SetItem( row, 'screen_style', is_ScreenStyle )
			SetItemStatus( row, 'screen_style', Primary!, NotModified! )
			Return 2
		End If
		SetPointer( HourGlass! )
		ll_Handle = w_contract_data_design.uo_design.il_CurrentScreenHandle
		w_contract_data_design.uo_design.of_resetupdated( Data   )
		w_contract_data_design.uo_design.of_select_screen(0, w_contract_data_design.uo_design.ii_screen_id)
		w_contract_data_design.uo_design.Event ue_setModify( '' )
		is_ScreenStyle = Data
	Else
		SetItem( row, 'screen_style', is_ScreenStyle )
		SetItemStatus( row, 'screen_style', Primary!, NotModified! )
		Return 2
	End If
Else
	w_contract_data_design.uo_design.Post of_set_dw_properties(this.GetColumnName(), 1)
End If
end event

event losefocus;call super::losefocus;this.AcceptText()
end event

type cb_ok from u_cb within w_contract_dw_properties
boolean visible = false
integer x = 379
integer y = 1228
integer width = 343
integer taborder = 20
boolean bringtotop = true
string text = "&OK"
end type

event clicked;Close( Parent )

end event

type cb_cancel from u_cb within w_contract_dw_properties
integer x = 736
integer y = 1228
integer width = 343
integer taborder = 30
boolean bringtotop = true
string text = "&Close"
boolean default = true
end type

event clicked;//Added By Jay Chen 01-15-2014
string ls_alter_screenrow_flag,ls_singlerow_color,ls_doublerow_color,ls_string
long ll_row
string ls_required_rows

if ib_rowcolor = true then
	ll_row = dw_properties_dw.getrow( )
	if dw_properties_dw.modifiedcount( ) + dw_properties_dw.deletedcount( ) > 0 then
		if ll_row > 0 then 
			ls_string = string(w_contract_data_design.uo_design.il_select_view) + '-' + string(w_contract_data_design.uo_design.ii_screen_id)
			ls_singlerow_color = string(dw_properties_dw.object.screen_singlerow_color[ll_Row])
			ls_doublerow_color = string(dw_properties_dw.object.screen_doublerow_color[ll_Row])
			ls_alter_screenrow_flag = dw_properties_dw.object.alter_screenrow_color_flag[ll_Row]  
			gnv_user_option.of_Set_option_value('screenrowcolor' + ls_string, "alter_screenrow_color_flag",ls_alter_screenrow_flag )
			gnv_user_option.of_Set_option_value('screenrowcolor' + ls_string, "screen_singlerow_color",ls_singlerow_color )
			gnv_user_option.of_Set_option_value('screenrowcolor' + ls_string, "screen_doublerow_color",ls_doublerow_color )
			gnv_user_option.of_save( )
			//Added By Jay Chen 01-16-2014
			dw_Properties_dw.SetItemStatus(ll_Row,"alter_screenrow_color_flag", Primary!, NotModified!)
			dw_Properties_dw.SetItemStatus(ll_Row,"screen_singlerow_color", Primary!, NotModified!)
			dw_Properties_dw.SetItemStatus(ll_Row,"screen_doublerow_color", Primary!, NotModified!)
		end if
	end if
end if

//Added By Jay Chen 07-13-2015
if ib_required_rows then
	ll_row = dw_properties_dw.getrow( )
	if dw_properties_dw.modifiedcount( ) + dw_properties_dw.deletedcount( ) > 0 then
		if ll_row > 0 then 
			ls_string = string(w_contract_data_design.uo_design.il_select_view) + '-' + string(w_contract_data_design.uo_design.ii_screen_id)
			ls_required_rows = dw_properties_dw.object.required_rows[ll_Row]  
			gnv_user_option.of_Set_option_value('requiredrows' + ls_string, "required_rows",ls_required_rows )
			gnv_user_option.of_save( )
			dw_Properties_dw.SetItemStatus(ll_Row,"required_rows", Primary!, NotModified!)
		end if
	end if
end if

//Added By Jay Chen 07-24-2015
boolean lb_refresh = false
ll_row = dw_properties_dw.getrow( )
if ll_row > 0 then
	if dw_properties_dw.getitemstring(ll_row,"titlebar_visible",Primary!,false) <> dw_properties_dw.getitemstring(ll_row,"titlebar_visible",Primary!,true) then lb_refresh = true
	if dw_properties_dw.getitemstring(ll_row,"titlebar_text",Primary!,false) <> dw_properties_dw.getitemstring(ll_row,"titlebar_text",Primary!,true) then lb_refresh = true
	if dw_properties_dw.getitemstring(ll_row,"boarder_style",Primary!,false) <> dw_properties_dw.getitemstring(ll_row,"boarder_style",Primary!,true) then lb_refresh = true
end if
if lb_refresh then
	if isvalid(w_contract_data_design) then w_contract_data_design.ib_refresh = lb_refresh
end if
//end 
		
Close(Parent)
end event

