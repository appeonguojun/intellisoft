$PBExportHeader$n_cst_backcolor_settings.sru
forward
global type n_cst_backcolor_settings from nonvisualobject
end type
end forward

global type n_cst_backcolor_settings from nonvisualobject
end type
global n_cst_backcolor_settings n_cst_backcolor_settings

type variables
long il_win_backcolor
DataStore ids_window
String is_winfrom //Added By Ken.Guo 2016-03-16 'VIEW','PERSONAL'
end variables

forward prototypes
public function integer of_changewindowbackcolor (window aw_window)
public function long of_getobjectbackcolor (string as_type, powerobject apo_object)
public function integer of_setobjectbackcolor (powerobject apo_object)
public function long of_getdefaultviewwinbackcolor ()
public function integer of_setobjectbackcolor (powerobject apo_object, long al_color)
public function integer of_setdwcolumn_color (datawindow adw_data, long al_color)
public function boolean of_ignore_column (datawindow adw_target, string as_column)
public function integer of_changewindowbackcolor (window aw_window, boolean ab_always_use_personal_color)
end prototypes

public function integer of_changewindowbackcolor (window aw_window);Return of_changewindowbackcolor(aw_window, False)

////////////////////////////////////////////////////////////////////////
//// $<function>  of_changewindowbackcolor
//// $<arguments> 
//// 		window	aw_window
//// $<returns>   integer
//// $<description> Change back color of window and all child objects
////////////////////////////////////////////////////////////////////////
//// $<add> 11/20/2008 by Evan
////////////////////////////////////////////////////////////////////////
//
//long ll_FindRow
//long ll_BackColor
//string ls_WinName
//String ls_wincolor_on, ls_wincolor_value
//
//if not IsValid(aw_window) then Return -1
//if not gb_contract_version then Return -1
//	
//ls_WinName = aw_window.ClassName()
//ll_FindRow = ids_window.Find("win_name = '" + ls_WinName + "'", 1, ids_window.RowCount())
//
////Modified By Ken.Guo 2016-03-16
////if ll_FindRow <= 0 then Return -1
//If ll_FindRow > 0 Then
//	//For contract window or subwindow. depend on view settings.
//	is_winfrom = 'VIEW'
//	choose case ls_WinName
//		case "w_contract"
//			ll_BackColor = of_GetObjectBackColor("window!", aw_window)
//			if IsNull(ll_BackColor) then ll_BackColor = 67108864
//			
//			aw_Window.Dynamic of_SetBkColor(ll_BackColor)
//		case else
//			of_SetObjectBackcolor(aw_window)
//	end choose
//Else
//	//for other window, depend on personal settings.
//	is_winfrom = 'PERSONAL'
//	ls_wincolor_on = gnv_user_option.of_Get_option_value( gs_user_id, "custom_window_bkcolor_on" )
//	ls_wincolor_value = gnv_user_option.of_Get_option_value( gs_user_id, "custom_window_bkcolor_value" )
//	If ls_wincolor_on = '1' Then
//		If ls_wincolor_value <> '' Then
//			ll_BackColor = Long(ls_wincolor_value)
//			of_SetObjectBackcolor(aw_window,ll_BackColor )
//		End If
//	End If
//End If
//
//Return 1
//
//
end function

public function long of_getobjectbackcolor (string as_type, powerobject apo_object);//////////////////////////////////////////////////////////////////////
// $<function>  of_getobjectbackcolor
// $<arguments> 
//			string		as_type
// 		powerobject	apo_object
// $<returns>   long
// $<description> Get object back color
//////////////////////////////////////////////////////////////////////
// $<add> 11/20/2008 by Evan
//////////////////////////////////////////////////////////////////////

/*
You can get back color according to following methods:
1. Get back color from Datastore according to as_Type
2. Get back color from Datastore according to apo_Object.ClassName()
*/

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 2009-07-10 By: Ken.Guo
//$<reason> Get View ID from Contract if contract window is opened.
Long ll_ctx_view_id,ll_row
Long ll_win_ctx_backcolor
string ls_value
If isvalid(gw_contract) Then
	If gw_contract.tab_contract_details.tabpage_search.dw_search_det1.RowCount() > 0 Then
		ls_value = gnv_data.of_getitem( 'data_view','win_backcolor', 'data_view_id = ' + String(gw_contract.il_data_view_id) )
		if (not isnumber(ls_value)) or isnull(ls_value) then  //Add by jervis 12.27.2010
			setnull(ll_win_ctx_backcolor)	
		else
			ll_win_ctx_backcolor =  Long(ls_value	)
		end if
		Return ll_win_ctx_backcolor
	End If
elseif isvalid(w_request_webform_document) or isvalid(w_request_webform_email_setting) then //Added By Jay Chen 06-13-2014
	ls_value = gnv_data.of_getitem( 'data_view','win_backcolor', 'data_view_id = ' + String(gl_SearchTab_otherwin_View) )
	if (not isnumber(ls_value)) or isnull(ls_value) then 
		setnull(ll_win_ctx_backcolor)	
	else
		ll_win_ctx_backcolor =  Long(ls_value	)
	end if
	Return ll_win_ctx_backcolor
End If
//---------------------------- APPEON END ----------------------------

Return il_win_backcolor
end function

public function integer of_setobjectbackcolor (powerobject apo_object);//Modified By Ken.Guo 2016-03-16
Long ll_color
setnull(ll_color)
Return of_setobjectbackcolor(apo_object, ll_color)

////////////////////////////////////////////////////////////////////////
//// $<function>  of_setobjectbackcolor
//// $<arguments> 
//// 		powerobject	apo_object
//// $<returns>   integer
//// $<description> Modify object back color
////////////////////////////////////////////////////////////////////////
//// $<add> 11/20/2008 by Evan
////////////////////////////////////////////////////////////////////////
//
//window            lwo_window
//tab               lwo_tab
//userobject        lwo_userobject
////
//checkbox          lwo_checkbox
////commandbutton     lwo_commandbutton
//datawindow        lwo_datawindow
////dropdownlistbox   lwo_dropdownlistbox
//graph             lwo_graph
//groupbox          lwo_groupbox
////hprogressbar      lwo_hprogressbar
////hscrollbar        lwo_hscrollbar
////htrackbar         lwo_htrackbar
////listbox           lwo_listbox
////listview          lwo_listview
////multilineedit     lwo_multilineedit
////omcontrol         lwo_omcontrol
////picture           lwo_picture
//radiobutton       lwo_radiobutton
////richtextedit      lwo_richtextedit
//statictext        lwo_statictext
//statichyperlink   lwo_statichyperlike
////treeview          lwo_treeview
////vprogressbar      lwo_vprogressbar
////vscrollbar        lwo_vscrollbar
////vtrackbar         lwo_vtrackbar
////
////line              lwo_line
//oval              lwo_oval
//rectangle         lwo_rectangle
//roundrectangle    lwo_roundrectangle
//multilineedit lwo_mle //Added By Ken.Guo 03/10/2014
////
//long    ll_BackColor
//integer i, li_Count
//
//if not IsValid(apo_object) then Return -1
//if not gb_contract_version then Return -1
//
//choose case apo_object.TypeOf()
//	// Container objects
//	case window!
//		lwo_window = apo_object
//		ll_BackColor = of_GetObjectBackColor("window!", apo_object)
//		if not IsNull(ll_BackColor) then lwo_window.BackColor = ll_BackColor
//		li_Count = UpperBound(lwo_window.control[])
//		for i = 1 to li_Count
//			of_SetObjectBackColor(lwo_window.control[i])
//		next
//	case tab!
//		lwo_tab = apo_object
//		ll_BackColor = of_GetObjectBackColor("tab!", apo_object)
//		if not IsNull(ll_BackColor) then lwo_tab.BackColor = ll_BackColor
//		li_Count = UpperBound(lwo_tab.control[])
//		for i = 1 to li_Count
//			of_SetObjectBackColor(lwo_tab.control[i])
//		next
//	case userobject!
//		lwo_userobject = apo_object
//		ll_BackColor = of_GetObjectBackColor("userobject!", apo_object)
//		if not IsNull(ll_BackColor) then
//			lwo_userobject.BackColor = ll_BackColor
//			lwo_userobject.TabBackColor = ll_BackColor
//		end if
//		li_Count = UpperBound(lwo_userobject.control[])
//		for i = 1 to li_Count
//			of_SetObjectBackColor(lwo_userobject.control[i])
//		next
//	// Control objects
//	case datawindow!
//		lwo_datawindow = apo_object
//		ll_BackColor = of_GetObjectBackColor("datawindow!", apo_object)
//		if not IsNull(ll_BackColor) then
//			lwo_datawindow.Modify("datawindow.color=" + String(ll_BackColor))
//		end if
//	case checkbox!
//		lwo_checkbox = apo_object
//		ll_BackColor = of_GetObjectBackColor("checkbox!", apo_object)
//		if not IsNull(ll_BackColor) then lwo_checkbox.BackColor = ll_BackColor
//	case graph!
//		lwo_graph = apo_object
//		ll_BackColor = of_GetObjectBackColor("graph!", apo_object)
//		if not IsNull(ll_BackColor) then lwo_graph.BackColor = ll_BackColor		
//	case groupbox!
//		lwo_groupbox = apo_object
//		ll_BackColor = of_GetObjectBackColor("groupbox!", apo_object)
//		if not IsNull(ll_BackColor) then lwo_groupbox.BackColor = ll_BackColor
//	case radiobutton!
//		lwo_radiobutton = apo_object
//		ll_BackColor = of_GetObjectBackColor("radiobutton!", apo_object)
//		if not IsNull(ll_BackColor) then lwo_radiobutton.BackColor = ll_BackColor
//	case statictext!
//      lwo_statictext = apo_object
//		ll_BackColor = of_GetObjectBackColor("statictext!", apo_object)
//		if not IsNull(ll_BackColor) then	lwo_statictext.BackColor = ll_BackColor
//	case statichyperlink!
//		lwo_statichyperlike = apo_object
//		ll_BackColor = of_GetObjectBackColor("statichyperlink!", apo_object)
//		if not IsNull(ll_BackColor) then lwo_statichyperlike.BackColor = ll_BackColor
//	case oval!
//		lwo_oval = apo_object
//		ll_BackColor = of_GetObjectBackColor("oval!", apo_object)
//		if not IsNull(ll_BackColor) then lwo_oval.FillColor = ll_BackColor
//	case rectangle!
//		lwo_rectangle = apo_object
//		ll_BackColor = of_GetObjectBackColor("rectangle!", apo_object)
//		if not IsNull(ll_BackColor) then lwo_rectangle.FillColor = ll_BackColor
//	case roundrectangle!
//		lwo_roundrectangle = apo_object
//		ll_BackColor = of_GetObjectBackColor("roundrectangle!", apo_object)
//		if not IsNull(ll_BackColor) then lwo_roundrectangle.FillColor = ll_BackColor
//	case multilineedit! //Added By Ken.Guo 03/10/2014. Set for MLE control.
//		lwo_mle = apo_object
//		ll_BackColor = of_GetObjectBackColor("multilineedit!", apo_object)
//		if not IsNull(ll_BackColor) then lwo_mle.BackColor = ll_BackColor		
//	case else
//		Return -1
//end choose
//
//Return 1
end function

public function long of_getdefaultviewwinbackcolor ();//////////////////////////////////////////////////////////////////////
// $<function>  of_getdefaultviewwinbackcolor
// $<arguments> (None)
// $<returns>   long
// $<description> Get window back color of default view
//////////////////////////////////////////////////////////////////////
// $<add> 11/25/2008 by Evan
//////////////////////////////////////////////////////////////////////

SetNull(il_win_backcolor)

SELECT data_view.win_backcolor INTO :il_win_backcolor
FROM  security_users, data_view
WHERE data_view.data_view_id = security_users.contract_default_view AND
      security_users.user_id = :gs_user_id;

Return il_win_backcolor
end function

public function integer of_setobjectbackcolor (powerobject apo_object, long al_color);//////////////////////////////////////////////////////////////////////
// $<function>  of_setobjectbackcolor
// $<arguments> 
// 		powerobject	apo_object
//		long al_color
// $<returns>   integer
// $<description> Modify object back color
//////////////////////////////////////////////////////////////////////
// $<add> 11/20/2008 by Evan
// Modified By Ken.Guo 2016-03-16. added al_color argument. 
//////////////////////////////////////////////////////////////////////

window            lwo_window
tab               lwo_tab
userobject        lwo_userobject
//
checkbox          lwo_checkbox
//commandbutton     lwo_commandbutton
datawindow        lwo_datawindow
//dropdownlistbox   lwo_dropdownlistbox
graph             lwo_graph
groupbox          lwo_groupbox
//hprogressbar      lwo_hprogressbar
//hscrollbar        lwo_hscrollbar
//htrackbar         lwo_htrackbar
listbox           lwo_listbox
listview          lwo_listview
//multilineedit     lwo_multilineedit
//omcontrol         lwo_omcontrol
//picture           lwo_picture
radiobutton       lwo_radiobutton
//richtextedit      lwo_richtextedit
statictext        lwo_statictext
statichyperlink   lwo_statichyperlike
treeview          lwo_treeview
//vprogressbar      lwo_vprogressbar
//vscrollbar        lwo_vscrollbar
//vtrackbar         lwo_vtrackbar
//
//line              lwo_line
oval              lwo_oval
rectangle         lwo_rectangle
roundrectangle    lwo_roundrectangle
multilineedit lwo_mle //Added By Ken.Guo 03/10/2014
richtextedit lwo_rte //Added By Ken.Guo 2016-03-17
singlelineedit lwo_sle //Added By Ken.Guo 2016-03-23
dropdownlistbox lwo_ddlb //Added By Ken.Guo 2016-03-23
//
long    ll_BackColor
integer i, li_Count
string ls_dw_border //Added By Ken.Guo 2016-03-22

if not IsValid(apo_object) then Return -1
if not gb_contract_version then Return -1

//Added By Ken.Guo 2016-03-16
If isnull(al_color) Then
	ll_BackColor = of_GetObjectBackColor("", apo_object)
Else
	ll_BackColor = al_color
End If

choose case apo_object.TypeOf()
	// Container objects
	case window!
		lwo_window = apo_object
		//ll_BackColor = of_GetObjectBackColor("window!", apo_object)
		if not IsNull(ll_BackColor) then lwo_window.BackColor = ll_BackColor
		li_Count = UpperBound(lwo_window.control[])
		for i = 1 to li_Count
			of_SetObjectBackColor(lwo_window.control[i],al_color)
		next
	case tab!
		lwo_tab = apo_object
		//ll_BackColor = of_GetObjectBackColor("tab!", apo_object)
		if not IsNull(ll_BackColor) then lwo_tab.BackColor = ll_BackColor
		li_Count = UpperBound(lwo_tab.control[])
		for i = 1 to li_Count
			of_SetObjectBackColor(lwo_tab.control[i],al_color)
		next
	case userobject!
		lwo_userobject = apo_object
		//ll_BackColor = of_GetObjectBackColor("userobject!", apo_object)
		if not IsNull(ll_BackColor) then
			lwo_userobject.BackColor = ll_BackColor
			lwo_userobject.TabBackColor = ll_BackColor
		end if
		li_Count = UpperBound(lwo_userobject.control[])
		for i = 1 to li_Count
			of_SetObjectBackColor(lwo_userobject.control[i],al_color)
		next
	// Control objects
	case datawindow!
		lwo_datawindow = apo_object
		If lwo_datawindow.dataobject = 'd_ezmenu_list' Then Return 0 //Added By Ken.Guo 2016-03-16
		//ll_BackColor = of_GetObjectBackColor("datawindow!", apo_object)
		if not IsNull(ll_BackColor) then
			lwo_datawindow.Modify("datawindow.color=" + String(ll_BackColor))
		end if
		//Added By Ken.Guo 2016-03-16
		If is_winfrom = 'PERSONAL'  and not IsNull(ll_BackColor) Then
			of_setdwcolumn_color(lwo_datawindow,ll_BackColor)
		End If
		If is_winfrom = 'PERSONAL'  Then
			If gnv_user_option.of_Get_option_value( gs_user_id, "custom_screen_border_on" ) = '1' Then
				ls_dw_border = gnv_user_option.of_Get_option_value( gs_user_id, "custom_screen_border_value" )
				Choose Case ls_dw_border
					Case '0' //no border
						lwo_datawindow.border = False 
						//lwo_datawindow.borderstyle  = 1
					Case '1' //
						lwo_datawindow.border = true
						lwo_datawindow.borderstyle  = StyleBox!
					Case '2' //
						lwo_datawindow.border = true
						lwo_datawindow.borderstyle  = StyleLowered!						
					Case '3' //
						lwo_datawindow.border = true
						lwo_datawindow.borderstyle  = StyleRaised!						
					Case '4' //
						lwo_datawindow.border = true
						lwo_datawindow.borderstyle  = StyleShadowBox!							
				End Choose	
			End If
		End If
		
		
	case checkbox!
		lwo_checkbox = apo_object
		//ll_BackColor = of_GetObjectBackColor("checkbox!", apo_object)
		if not IsNull(ll_BackColor) then lwo_checkbox.BackColor = ll_BackColor
	case graph!
		lwo_graph = apo_object
		//ll_BackColor = of_GetObjectBackColor("graph!", apo_object)
		if not IsNull(ll_BackColor) then lwo_graph.BackColor = ll_BackColor		
	case groupbox!
		lwo_groupbox = apo_object
		//ll_BackColor = of_GetObjectBackColor("groupbox!", apo_object)
		if not IsNull(ll_BackColor) then lwo_groupbox.BackColor = ll_BackColor
	case radiobutton!
		lwo_radiobutton = apo_object
		//ll_BackColor = of_GetObjectBackColor("radiobutton!", apo_object)
		if not IsNull(ll_BackColor) then lwo_radiobutton.BackColor = ll_BackColor
	case statictext!
     		lwo_statictext = apo_object
		//ll_BackColor = of_GetObjectBackColor("statictext!", apo_object)
		if not IsNull(ll_BackColor) then	lwo_statictext.BackColor = ll_BackColor
	case statichyperlink!
		lwo_statichyperlike = apo_object
		//ll_BackColor = of_GetObjectBackColor("statichyperlink!", apo_object)
		if not IsNull(ll_BackColor) then lwo_statichyperlike.BackColor = ll_BackColor
	case oval!
		lwo_oval = apo_object
		//ll_BackColor = of_GetObjectBackColor("oval!", apo_object)
		if not IsNull(ll_BackColor) then lwo_oval.FillColor = ll_BackColor
	case rectangle!
		lwo_rectangle = apo_object
		//ll_BackColor = of_GetObjectBackColor("rectangle!", apo_object)
		if not IsNull(ll_BackColor) then lwo_rectangle.FillColor = ll_BackColor
	case roundrectangle!
		lwo_roundrectangle = apo_object
		//ll_BackColor = of_GetObjectBackColor("roundrectangle!", apo_object)
		if not IsNull(ll_BackColor) then lwo_roundrectangle.FillColor = ll_BackColor
	case multilineedit! //Added By Ken.Guo 03/10/2014. Set for MLE control.
		lwo_mle = apo_object
		//ll_BackColor = of_GetObjectBackColor("multilineedit!", apo_object)
		if not IsNull(ll_BackColor) then lwo_mle.BackColor = ll_BackColor		
	Case treeview! //Added By Ken.Guo 2016-03-16
		lwo_treeview = apo_object
		if not IsNull(ll_BackColor) then lwo_treeview.BackColor = ll_BackColor	
	Case listview! //Added By Ken.Guo 2016-03-16
		lwo_listview = apo_object
		if not IsNull(ll_BackColor) then lwo_listview.BackColor = ll_BackColor
	Case richtextedit! //Added By Ken.Guo 2016-03-17
		lwo_rte = apo_object
		if not IsNull(ll_BackColor) then lwo_rte.BackColor = ll_BackColor
	Case listbox! //Added By Ken.Guo 2016-03-17
		lwo_listbox = apo_object
		if not IsNull(ll_BackColor) then lwo_listbox.BackColor = ll_BackColor
	Case singlelineedit! //Added By Ken.Guo 2016-03-23
		lwo_sle = apo_object
		if not IsNull(ll_BackColor) then lwo_sle.BackColor = ll_BackColor
	Case dropdownlistbox! //Added By Ken.Guo 2016-03-23
		 lwo_ddlb = apo_object
		 if not IsNull(ll_BackColor) then lwo_ddlb.BackColor = ll_BackColor
	case else
		Return -1
end choose

Return 1
end function

public function integer of_setdwcolumn_color (datawindow adw_data, long al_color);//====================================================================
// Function: of_setdwcolumn_color
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//                adw_data
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:         Ken.Guo 2016-03-16
//--------------------------------------------------------------------
//Copyright (c) 2008-2015 Contract Logix, Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

String ls_objects, ls_object_arr[],ls_ColName,ls_Visible, ls_Band,ls_ObjType, ls_color
Long ll_TabPos,ll_StartPos,i
n_cst_string lnv_string

adw_data.modify("DataWindow.Detail.Color= '" +String(al_color)+ "'")
adw_data.modify("DataWindow.Header.Color= '" +String(al_color)+ "'")
adw_data.modify("DataWindow.Summary.Color= '" +String(al_color)+ "'")
adw_data.modify("DataWindow.Footer.Color= '" +String(al_color)+ "'")

ls_objects = adw_data.describe('datawindow.objects') + "~t"
lnv_string.of_ParseToArray(ls_objects, "~t", ls_object_arr[])
For i = 1 to Upperbound(ls_object_arr[])
	ls_ColName = ls_object_arr[i]
	If of_ignore_column(adw_data,ls_colname) Then Continue
	Choose Case adw_data.describe(ls_colname + '.type')
		Case 'column'
			If Len(adw_data.describe(ls_colname + '.width')) > 2 Then //if the column is destroy
				adw_data.modify(ls_colname+ ".Background.Color='" +String(al_color)+ "'" )
			End If
		Case 'compute','groupbox'
			adw_data.modify(ls_colname+ ".Background.Color='" +String(al_color)+ "'" )
		Case 'text'
			ls_color = adw_data.Describe(ls_colname+ ".Background.Color")
			If Pos(ls_color, '~t') = 0 Then //if it is a expression(e.g. color painter in EZ Painter), then need not modify the color.
				adw_data.modify(ls_colname+ ".Background.Color='" +String(al_color)+ "'" )
			End If
	End Choose
	
	ll_StartPos = ll_TabPos + 1
	ll_TabPos   = Pos(ls_Objects,"~t",ll_StartPos)
Next

Return 1
end function

public function boolean of_ignore_column (datawindow adw_target, string as_column);//====================================================================
// Function: of_ignore_column
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//                adw_target
//                as_column
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:         Ken.Guo 2016-03-23
//--------------------------------------------------------------------
//Copyright (c) 2008-2015 Contract Logix, Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

String ldw_classname[], ldw_dwobject[], ldw_colname[] 
Long i

ldw_classname[1] = "dw_user_role"
ldw_dwobject[1] = "d_dashboard_user_access"
ldw_colname[1] = ";tdl_other_user;othercolname;"

ldw_classname[2] = "dw_1"
ldw_dwobject[2] = "d_workflow_report"
ldw_colname[2] = ""  //all columns
//you can add other dw& column here


For i = 1 To UpperBound(ldw_classname)
	If ldw_classname[i] = adw_target.classname()  and ldw_dwobject[i] =  adw_target.dataobject Then
		If ldw_colname[i] = '' or Pos(ldw_colname[i], ';' + as_column + ';')> 0 Then 
			Return True //find it
		End If
	End If
Next


Return False


end function

public function integer of_changewindowbackcolor (window aw_window, boolean ab_always_use_personal_color);//////////////////////////////////////////////////////////////////////
// $<function>  of_changewindowbackcolor
// $<arguments> 
// 		window	aw_window
// 		Boolean ab_always_use_personal_color
// $<returns>   integer
// $<description> Change back color of window and all child objects
//////////////////////////////////////////////////////////////////////
// $<add> 11/20/2008 by Evan
//Modified By Ken.Guo 2016-04-26 . added argument ab_always_use_personal_color 
//////////////////////////////////////////////////////////////////////

long ll_FindRow
long ll_BackColor
string ls_WinName
String ls_wincolor_on, ls_wincolor_value

if not IsValid(aw_window) then Return -1
if not gb_contract_version then Return -1
	
ls_WinName = aw_window.ClassName()
ll_FindRow = ids_window.Find("win_name = '" + ls_WinName + "'", 1, ids_window.RowCount())

//Added By Ken.Guo 2016-04-26
If ab_always_use_personal_color Then
	ll_FindRow = -1
End If

//Modified By Ken.Guo 2016-03-16
//if ll_FindRow <= 0 then Return -1
If ll_FindRow > 0 Then
	//For contract window or subwindow. depend on view settings.
	is_winfrom = 'VIEW'
	choose case ls_WinName
		case "w_contract"
			ll_BackColor = of_GetObjectBackColor("window!", aw_window)
			if IsNull(ll_BackColor) then ll_BackColor = 67108864
			
			aw_Window.Dynamic of_SetBkColor(ll_BackColor)
		case else
			of_SetObjectBackcolor(aw_window)
	end choose
Else
	//for other window, depend on personal settings.
	is_winfrom = 'PERSONAL'
	ls_wincolor_on = gnv_user_option.of_Get_option_value( gs_user_id, "custom_window_bkcolor_on" )
	ls_wincolor_value = gnv_user_option.of_Get_option_value( gs_user_id, "custom_window_bkcolor_value" )
	If ls_wincolor_on = '1' Then
		If ls_wincolor_value <> '' Then
			ll_BackColor = Long(ls_wincolor_value)
			of_SetObjectBackcolor(aw_window,ll_BackColor )
		End If
	End If
End If

Return 1


end function

on n_cst_backcolor_settings.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_backcolor_settings.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;//////////////////////////////////////////////////////////////////////
// $<event>  constructor
// $<arguments> 
// $<returns>   long
// $<description> constructor
//////////////////////////////////////////////////////////////////////
// $<add> 11/20/2008 by Evan
//////////////////////////////////////////////////////////////////////

SetNull(il_win_backcolor)

ids_window = Create DataStore
ids_window.DataObject = "d_backcolor_windows"
end event

event destructor;//////////////////////////////////////////////////////////////////////
// $<event>  destructor
// $<arguments> 
// $<returns>   long
// $<description> destructor
//////////////////////////////////////////////////////////////////////
// $<add> 11/20/2008 by Evan
//////////////////////////////////////////////////////////////////////

Destroy ids_window
end event

