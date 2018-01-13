﻿$PBExportHeader$u_tabpg_detail_detail.sru
$PBExportComments$[intellicontract_tab] The contract locations Tab Page
forward
global type u_tabpg_detail_detail from u_tab
end type
type tabpage_custom from u_tabpg_contract_detail_cus within u_tabpg_detail_detail
end type
type tabpage_custom from u_tabpg_contract_detail_cus within u_tabpg_detail_detail
end type
type tabpage_1 from u_tabpg_contract_detail_audit within u_tabpg_detail_detail
end type
type tabpage_1 from u_tabpg_contract_detail_audit within u_tabpg_detail_detail
end type
type tabpage_notes from u_tabpg_contract_detail_notes within u_tabpg_detail_detail
end type
type tabpage_notes from u_tabpg_contract_detail_notes within u_tabpg_detail_detail
end type
type tabpage_2 from u_tabpg_contract_detail_linked_contracts within u_tabpg_detail_detail
end type
type tabpage_2 from u_tabpg_contract_detail_linked_contracts within u_tabpg_detail_detail
end type
type tabpage_group_access from u_tabpg_contract_detail_group_access within u_tabpg_detail_detail
end type
type tabpage_group_access from u_tabpg_contract_detail_group_access within u_tabpg_detail_detail
end type
end forward

global type u_tabpg_detail_detail from u_tab
integer width = 2770
integer height = 700
boolean boldselectedtext = true
boolean createondemand = true
alignment alignment = center!
tabpage_custom tabpage_custom
tabpage_1 tabpage_1
tabpage_notes tabpage_notes
tabpage_2 tabpage_2
tabpage_group_access tabpage_group_access
end type
global u_tabpg_detail_detail u_tabpg_detail_detail

type variables
Boolean	ib_NeedRefreshTrail,ib_NeedRefreshLink,ib_NeedRefreshAccess

boolean ib_created_1,ib_created_2,ib_created_3,ib_created_4,ib_created_5
end variables

forward prototypes
public subroutine of_set_flag ()
public subroutine of_adjust_size (integer ai_choose_item)
end prototypes

public subroutine of_set_flag ();//long	ll_ctx_id
//string ls_datascreen[],ls_customscreen[]
//
//ll_ctx_id = inv_contract_details.of_get_ctx_id()
//
////Refresh ctx_basic_info alarm flag -- jervis 05.19.2011
//ls_datascreen = {'effective_date','expriation_date','review_date','last_revis_date','other_date_1','term_date','other_date_2','version_date', &
//				'custom_date1','custom_date2','custom_date3','custom_date4','custom_date5','custom_date6','custom_date7','custom_date8','custom_date9','custom_date10','custom_date11','custom_date12','custom_date13','custom_date14','custom_date15','custom_date16','custom_date17'}//added by gavins 20120401   
//
//ls_customscreen = {'custom_date1','custom_date2','custom_date3','custom_date4','custom_date5','custom_date6','custom_date7','custom_date8','custom_date9','custom_date10','custom_date11','custom_date12','custom_date13','custom_date14','custom_date15'}
//inv_contract_details.of_set_alarm_flag( dw_contract_dates, 'ctx_basic_info', ls_datascreen, ll_ctx_id,0,0,0)
//inv_contract_details.of_set_alarm_flag( tab_1.tabpage_custom.dw_1, 'ctx_basic_info', ls_customscreen, ll_ctx_id,0,0,0)
//inv_contract_details.of_set_alarm_flag( tab_1.tabpage_1.dw_1 , 'ctx_custom', ls_customscreen, ll_ctx_id,0,0,0)
end subroutine

public subroutine of_adjust_size (integer ai_choose_item);//====================================================================
// Function: of_adjust_size
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//                ai_choose_item
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:	Mark Lee		Date: 03/13/2013
//--------------------------------------------------------------------
//	Copyright (c) 2008-2012 Contract Logix,Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

Choose Case ai_choose_item
	Case 1 
		IF abs(this.tabpage_custom.width - this.tabpage_custom.dw_1.width) > 30 and  abs(this.tabpage_custom.height - this.tabpage_custom.dw_1.height) > 30  Then
			this.tabpage_custom.dw_1.width = this.tabpage_custom.width - this.tabpage_custom.dw_1.x  
			this.tabpage_custom.dw_1.height = this.tabpage_custom.height  - this.tabpage_custom.dw_1.y  
		End If
	Case 2
		IF abs(this.tabpage_1.width - this.tabpage_1.dw_1.width) > 30 and  abs(this.tabpage_1.height - this.tabpage_1.dw_1.height) > 30  Then
			this.tabpage_1.dw_1.width = this.tabpage_1.width - this.tabpage_1.dw_1.x 
			this.tabpage_1.dw_1.height = this.tabpage_1.height - this.tabpage_1.dw_1.y  
		End IF 
	Case 3
		IF abs(this.tabpage_notes.width - this.tabpage_notes.dw_1.width) > 30 and  abs(this.tabpage_notes.height - this.tabpage_notes.dw_1.height) > 30  Then
			this.tabpage_notes.dw_1.width = this.tabpage_notes.width - this.tabpage_notes.dw_1.x
			this.tabpage_notes.dw_1.height = this.tabpage_notes.height  - this.tabpage_notes.dw_1.y
		End If
	Case 4
		IF abs(this.tabpage_2.width - this.tabpage_2.dw_1.width) > 30 and  abs(this.tabpage_2.height - this.tabpage_2.dw_1.height) > 30  Then
			this.tabpage_2.dw_1.width = this.tabpage_2.width - this.tabpage_2.dw_1.x
			this.tabpage_2.dw_1.height = this.tabpage_2.height  - this.tabpage_2.dw_1.y
		End If
	Case 5
		IF abs(this.tabpage_group_access.width - this.tabpage_group_access.dw_1.width) > 30 and  abs(this.tabpage_group_access.height - this.tabpage_group_access.dw_1.height) > 30  Then
		this.tabpage_group_access.dw_1.width = this.tabpage_group_access.width - this.tabpage_group_access.dw_1.x
		this.tabpage_group_access.dw_1.height = this.tabpage_group_access.height  - this.tabpage_group_access.dw_1.y
		End If
Case Else 
		//
End Choose
	
end subroutine

on u_tabpg_detail_detail.create
this.tabpage_custom=create tabpage_custom
this.tabpage_1=create tabpage_1
this.tabpage_notes=create tabpage_notes
this.tabpage_2=create tabpage_2
this.tabpage_group_access=create tabpage_group_access
int iCurrent
call super::create
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.tabpage_custom
this.Control[iCurrent+2]=this.tabpage_1
this.Control[iCurrent+3]=this.tabpage_notes
this.Control[iCurrent+4]=this.tabpage_2
this.Control[iCurrent+5]=this.tabpage_group_access
end on

on u_tabpg_detail_detail.destroy
call super::destroy
destroy(this.tabpage_custom)
destroy(this.tabpage_1)
destroy(this.tabpage_notes)
destroy(this.tabpage_2)
destroy(this.tabpage_group_access)
end on

event selectionchanged;call super::selectionchanged;//====================================================================
// Event: selectionchanged()
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value    integer    oldindex
// 	value    integer    newindex
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	Scofield		Date: 2009-05-25
//--------------------------------------------------------------------
//	Copyright (c) 1999-2009 Contractlogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

if This.SelectedTab =2 then
	if ib_NeedRefreshTrail then
		This.Tabpage_1.dw_1.Event pfc_Retrieve()
		ib_NeedRefreshTrail = false
	end if
elseif This.SelectedTab = 4 then
	if ib_NeedRefreshLink then
		This.tabpage_2.dw_1.Event pfc_Retrieve()
		ib_NeedRefreshLink = false
	end if
elseif This.SelectedTab = 5 then
	if ib_NeedRefreshAccess then
		This.Tabpage_Group_Access.dw_1.Event pfc_Retrieve()
		ib_NeedRefreshAccess = false
	end if
end if

//Added By Mark Lee 03/13/2013
of_adjust_size(This.SelectedTab )

end event

type tabpage_custom from u_tabpg_contract_detail_cus within u_tabpg_detail_detail
integer x = 18
integer y = 112
integer width = 2734
integer height = 572
string text = "Custom Data"
string picturename = "Custom081!"
long picturemaskcolor = 12632256
string powertiptext = "Custom Data"
end type

event constructor;call super::constructor;//dynamic create dw 
string ls_tab_name
string ls_dw_name[]
string ls_dataobject[]
integer li_view_id,ll_i
datawindow ld_dw[]

ls_tab_name = 'tabpage_details'

ld_dw[1] = this.dw_1
ls_dw_name[1] = 'dw_1'
ls_dataobject[1] = 'd_contract_det_custom'
f_create_contract_dw(gi_contract_view_id,ls_tab_name,ld_dw,ls_dw_name,ls_dataobject)		
//Added By Mark Lee 05/15/12
this.dw_1.of_set_properties(this.dw_1.il_ViewID, this.dw_1.il_ScreenID, "N")
ib_created_1 = true


this.dw_1.ib_retrieve_drop_downs = false
tabpage_custom.dw_1.event ue_populatedddws( )
//dw_1.sharedata( tabpage_custom.dw_1)



end event

type tabpage_1 from u_tabpg_contract_detail_audit within u_tabpg_detail_detail
integer x = 18
integer y = 112
integer width = 2734
integer height = 572
string text = "Custom Data 2"
string picturename = "custom082!"
long picturemaskcolor = 12632256
string powertiptext = "Custom Data 2"
end type

event constructor;call super::constructor;//dynamic create dw 
string ls_tab_name
string ls_dw_name[]
string ls_dataobject[]
integer li_view_id,ll_i
datawindow ld_dw[]

ls_tab_name = 'tabpage_details'

ld_dw[1] = this.dw_1
ls_dw_name[1] = 'dw_1'
ls_dataobject[1] = 'd_contract_det_custom_2'
f_create_contract_dw(gi_contract_view_id,ls_tab_name,ld_dw,ls_dw_name,ls_dataobject)		
//Added By Mark Lee 05/15/12
this.dw_1.of_set_properties(this.dw_1.il_ViewID, this.dw_1.il_ScreenID, "N")

ib_created_2 = true


tabpage_1.dw_1.ib_retrieve_drop_downs = false
tabpage_1.dw_1.event ue_populatedddws( )


Event ue_set_Security( )//added by gavins 20120806
end event

event ue_set_security;call super::ue_set_security;//Added By Jay Chen 04-02-2015
boolean lb_protect 
lb_protect = inv_contract_details.of_get_protect_tabpg()
if not lb_protect then
	if w_mdi.of_security_access(2093) = 1 then
		this.dw_1.of_disable_columns()
	end if
end if
end event

type tabpage_notes from u_tabpg_contract_detail_notes within u_tabpg_detail_detail
integer x = 18
integer y = 112
integer width = 2734
integer height = 572
string text = "Notes"
string picturename = "custom070!"
long picturemaskcolor = 12632256
string powertiptext = "Notes"
end type

event constructor;call super::constructor;//dynamic create dw 
string ls_tab_name
string ls_dw_name[]
string ls_dataobject[]
integer li_view_id,ll_i
datawindow ld_dw[]

ls_tab_name = 'tabpage_details'

ld_dw[1] = this.dw_1
ls_dw_name[1] = 'dw_1'
ls_dataobject[1] = 'd_contract_det_notes'
f_create_contract_dw(gi_contract_view_id,ls_tab_name,ld_dw,ls_dw_name,ls_dataobject)		
//Added By Mark Lee 05/15/12
this.dw_1.of_set_properties(this.dw_1.il_ViewID, this.dw_1.il_ScreenID, "N")

ib_created_3 = true


tabpage_notes.dw_1.ib_retrieve_drop_downs = false
tabpage_notes.dw_1.event ue_populatedddws( )
//dw_1.sharedata(tabpage_notes.dw_1 )

Event ue_set_Security( )//added by gavins 20120806
end event

event ue_set_security;call super::ue_set_security;//Added By Ken.Guo 2015-08-07
boolean lb_protect 
lb_protect = inv_contract_details.of_get_protect_tabpg()
if not lb_protect then
	if w_mdi.of_security_access(2092) = 1 then
		this.dw_1.of_disable_columns()
	end if
end if
end event

type tabpage_2 from u_tabpg_contract_detail_linked_contracts within u_tabpg_detail_detail
integer x = 18
integer y = 112
integer width = 2734
integer height = 572
string text = "Linked Contracts"
string picturename = "Custom085!"
long picturemaskcolor = 12632256
string powertiptext = "Linked Contracts"
end type

event constructor;call super::constructor;//dynamic create dw 
string ls_tab_name
string ls_dw_name[]
string ls_dataobject[]
integer li_view_id,ll_i
datawindow ld_dw[]

ls_tab_name = 'tabpage_details'

ld_dw[1] = this.dw_1
ls_dw_name[1] = 'dw_1'
ls_dataobject[1] = 'd_sp_contract_search'
f_create_contract_dw(gi_contract_view_id,ls_tab_name,ld_dw,ls_dw_name,ls_dataobject)		
//Added By Mark Lee 05/15/12
this.dw_1.of_set_properties(this.dw_1.il_ViewID, this.dw_1.il_ScreenID, "N")

ib_created_4 = true


tabpage_2.dw_1.ib_retrieve_drop_downs = false
tabpage_2.dw_1.event ue_populatedddws( )
	
Event ue_set_Security( )//added by gavins 20120806
end event

type tabpage_group_access from u_tabpg_contract_detail_group_access within u_tabpg_detail_detail
integer x = 18
integer y = 112
integer width = 2734
integer height = 572
string text = "Group Access"
string picturename = "ArrangeIcons!"
long picturemaskcolor = 12632256
string powertiptext = "Group Accesss"
end type

event constructor;call super::constructor;//dynamic create dw 
string ls_tab_name
string ls_dw_name[]
string ls_dataobject[]
integer li_view_id,ll_i
datawindow ld_dw[]

ls_tab_name = 'tabpage_details'

ld_dw[1] = this.dw_1
ls_dw_name[1] = 'dw_1'
ls_dataobject[1] = 'd_contract_det_group_access'
f_create_contract_dw(gi_contract_view_id,ls_tab_name,ld_dw,ls_dw_name,ls_dataobject)		

//Added By Mark Lee 05/15/12
this.dw_1.of_set_properties(this.dw_1.il_ViewID, this.dw_1.il_ScreenID, "N")

ib_created_5 = true




Event ue_set_Security( )//added by gavins 20120806
end event

event ue_set_security;call super::ue_set_security;//Added By Ken.Guo 2015-08-07
boolean lb_protect 
lb_protect = inv_contract_details.of_get_protect_tabpg()
if not lb_protect then
	if w_mdi.of_security_access(6951) = 1 then
		this.dw_1.of_disable_columns()
	end if
end if
end event

