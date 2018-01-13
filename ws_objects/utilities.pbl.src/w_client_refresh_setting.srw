$PBExportHeader$w_client_refresh_setting.srw
forward
global type w_client_refresh_setting from w_response
end type
type cbx_close_word_before_open from checkbox within w_client_refresh_setting
end type
type cbx_wordinstance from checkbox within w_client_refresh_setting
end type
type cbx_cachefiles from checkbox within w_client_refresh_setting
end type
type cbx_checkmsword from checkbox within w_client_refresh_setting
end type
type cb_help_border from commandbutton within w_client_refresh_setting
end type
type cbx_border from checkbox within w_client_refresh_setting
end type
type cbx_refresh_cache from checkbox within w_client_refresh_setting
end type
type cbx_auto_modify_owner from checkbox within w_client_refresh_setting
end type
type cbx_auto_add_owner from checkbox within w_client_refresh_setting
end type
type cbx_registry from checkbox within w_client_refresh_setting
end type
type cbx_window_classic from checkbox within w_client_refresh_setting
end type
type cbx_checkdb_size from checkbox within w_client_refresh_setting
end type
type cbx_trusted_sites from checkbox within w_client_refresh_setting
end type
type cbx_scfs from checkbox within w_client_refresh_setting
end type
type dw_general_setting from datawindow within w_client_refresh_setting
end type
type ddlb_approve from dropdownlistbox within w_client_refresh_setting
end type
type ddlb_signature from dropdownlistbox within w_client_refresh_setting
end type
type cb_close from commandbutton within w_client_refresh_setting
end type
type cb_save from commandbutton within w_client_refresh_setting
end type
type cb_refreshnow from commandbutton within w_client_refresh_setting
end type
type st_4 from statictext within w_client_refresh_setting
end type
type st_3 from statictext within w_client_refresh_setting
end type
type st_2 from statictext within w_client_refresh_setting
end type
type st_1 from statictext within w_client_refresh_setting
end type
type gb_1 from groupbox within w_client_refresh_setting
end type
type gb_2 from groupbox within w_client_refresh_setting
end type
end forward

global type w_client_refresh_setting from w_response
string tag = "General Settings"
integer width = 2098
integer height = 2504
string title = "General Settings"
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
event ue_closecontract ( )
event ue_opencontract ( )
cbx_close_word_before_open cbx_close_word_before_open
cbx_wordinstance cbx_wordinstance
cbx_cachefiles cbx_cachefiles
cbx_checkmsword cbx_checkmsword
cb_help_border cb_help_border
cbx_border cbx_border
cbx_refresh_cache cbx_refresh_cache
cbx_auto_modify_owner cbx_auto_modify_owner
cbx_auto_add_owner cbx_auto_add_owner
cbx_registry cbx_registry
cbx_window_classic cbx_window_classic
cbx_checkdb_size cbx_checkdb_size
cbx_trusted_sites cbx_trusted_sites
cbx_scfs cbx_scfs
dw_general_setting dw_general_setting
ddlb_approve ddlb_approve
ddlb_signature ddlb_signature
cb_close cb_close
cb_save cb_save
cb_refreshnow cb_refreshnow
st_4 st_4
st_3 st_3
st_2 st_2
st_1 st_1
gb_1 gb_1
gb_2 gb_2
end type
global w_client_refresh_setting w_client_refresh_setting

type variables
DataStore	ids_SearchTemp,ids_SearchDevTemp
long il_CurCtxID
Boolean ib_RetrieveStatus
string is_show_activate_buttons, is_show_activate_ori //Added By Gavin.Jay 2017-04-19
private:
Boolean  ib_Modified = False
end variables

forward prototypes
public function integer wf_checkvalue ()
public function integer wf_run_now ()
end prototypes

event ue_closecontract();//====================================================================
// Event: ue_closecontract
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:	Jay Chen		Date: 05-19-2015
//--------------------------------------------------------------------
//	Copyright (c) 2008-2014 ContractLogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

long	ll_Row,ll_RowCnt

DataWindow	ldw_Search,ldw_SearDt

il_CurCtxID = gw_Contract.tab_contract_details.tabpage_search.il_ctx_id
gw_Contract.of_BackupFocusObject(gw_Contract.Control[])

ldw_Search = gw_contract.tab_contract_details.tabpage_search.dw_search
//ldw_SearDt = gw_contract.tab_contract_details.tabpage_search.dw_search_det1

//ids_SearchTemp.DataObject = ldw_Search.DataObject
//ids_SearchDevTemp.DataObject = ldw_SearDt.DataObject
//modified by gavins 20120423
ids_SearchTemp.create( ldw_Search.describe( "datawindow.syntax" )  )
//ids_SearchDevTemp.create( ldw_SearDt.describe( "datawindow.syntax" )  )

ldw_Search.RowsCopy(1,ldw_Search.RowCount(),Primary!,ids_SearchTemp,1,Primary!)
//ldw_SearDt.RowsCopy(1,ldw_SearDt.RowCount(),Primary!,ids_SearchDevTemp,1,Primary!)

ib_RetrieveStatus = gw_Contract.tab_contract_details.tabpage_search.ib_AutoRetrieve
gw_Contract.tab_contract_details.tabpage_search.ib_AutoRetrieve = false

gw_Contract.TriggerEvent("pfc_close")

end event

event ue_opencontract();//====================================================================
// Event: ue_opencontract
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:	Jay Chen		Date: 05-19-2015
//--------------------------------------------------------------------
//	Copyright (c) 2008-2014 ContractLogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

long	ll_Row,ll_RowCnt

DataWindow	ldw_Search,ldw_SearDt

SetPointer(HourGlass!)

gw_Contract.SetRedraw( false)

ldw_Search = gw_contract.tab_contract_details.tabpage_search.dw_search
//ldw_SearDt = gw_contract.tab_contract_details.tabpage_search.dw_search_det1

ldw_Search.Reset()
ids_SearchTemp.RowsCopy(1,ids_SearchTemp.RowCount(),Primary!,ldw_Search,1,Primary!)
//ids_SearchDevTemp.RowsCopy(1,ids_SearchDevTemp.RowCount(),Primary!,ldw_SearDt,1,Primary!)

gw_Contract.tab_contract_details.tabpage_search.cbx_1.Checked = ib_RetrieveStatus
gw_Contract.tab_contract_details.tabpage_search.ib_autoretrieve = ib_RetrieveStatus
gw_contract.tab_contract_details.tabpage_search.ib_retrieve = true

//ll_RowCnt = ldw_SearDt.RowCount()

//Set Tab Enable - jervis 09.26.2010
IF ll_RowCnt < 1 THEN 
	gw_contract.Dynamic Function wf_set_tab_enabled(False)
Else
	gw_contract.Dynamic Function wf_set_tab_enabled(True)
end if


//ll_Row = ldw_SearDt.Find("ctx_id = " + String(il_CurCtxID),1,ll_RowCnt)
//if ll_Row > 0 then
//	ldw_SearDt.ScrollToRow(ll_Row)
//	ldw_SearDt.SetRow(ll_Row)
//	ldw_SearDt.Event RowFocusChanging(ll_Row,ll_Row)
//	ldw_SearDt.Event RowFocusChanged(ll_Row)
//end if
//
gw_Contract.of_RestoreFocusObject(gw_Contract.Control[])

SetPointer(Arrow!)
gw_Contract.SetRedraw( true)

il_CurCtxID = 0

end event

public function integer wf_checkvalue ();string			ls_serti, ls_approve, ls_checkdb_size

//Begin - Added By Mark Lee 09/05/12
//ls_serti = ddlb_signature.Text
//ls_approve = ddlb_approve.Text
If dw_general_setting.rowcount( ) <= 0  Then
	Return 1
End If
ls_Serti = String(dw_general_setting.GetItemNumber(dw_general_setting.getrow(),'refresh_sertifi_time'))
ls_approve = String(dw_general_setting.GetItemNumber(dw_general_setting.getrow(),'refresh_approve_time'))
//End - Added By Mark Lee 09/05/12

If IsNull( ls_Serti ) Or Trim( ls_serti) = ''  Then 
	MessageBox( 'Error', "Please enter a value for 'Refresh Document Signature Data'" )
	Return 1
End If
If IsNull( ls_approve ) Or Trim( ls_approve ) = '' Then
	MessageBox( 'Error', "Please enter a value for 'Refresh Document Approval Data'" )
	Return 1
End If
If Not IsNumber( ls_Serti ) Then
	MessageBox( 'Error', "Please enter a number for 'Refresh Document Signature Data'" )
	Return 1
End If
If Not IsNumber( ls_approve ) Then
	MessageBox( 'Error', "Please enter a number for 'Refresh Document Approval Data'" )
	Return 1	
End If

Return 0
end function

public function integer wf_run_now ();//====================================================================
// Function: wf_run_now
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	Mark Lee		Date: 09/04/12
//--------------------------------------------------------------------
//	Copyright (c) 2008-2012 Contract Logix,Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
If gnv_data.of_getitem( 'icred_settings', 'esign', False) = '1' Then
//		gnv_sertifi.of_refresh_sertifi_status()
//		gnv_echosign.of_refresh_sertifi_status() //Added By Jay Chen 10-16-2013
//		gnv_docusign.of_refresh_sertifi_status() //Added By Jay Chen 04-15-2014
	gnv_app.of_refresh_sign( true)						//Added By Mark Lee 04/03/2015
End If
	
gnv_webapprove.of_refresh_status( )


Return 1
end function

on w_client_refresh_setting.create
int iCurrent
call super::create
this.cbx_close_word_before_open=create cbx_close_word_before_open
this.cbx_wordinstance=create cbx_wordinstance
this.cbx_cachefiles=create cbx_cachefiles
this.cbx_checkmsword=create cbx_checkmsword
this.cb_help_border=create cb_help_border
this.cbx_border=create cbx_border
this.cbx_refresh_cache=create cbx_refresh_cache
this.cbx_auto_modify_owner=create cbx_auto_modify_owner
this.cbx_auto_add_owner=create cbx_auto_add_owner
this.cbx_registry=create cbx_registry
this.cbx_window_classic=create cbx_window_classic
this.cbx_checkdb_size=create cbx_checkdb_size
this.cbx_trusted_sites=create cbx_trusted_sites
this.cbx_scfs=create cbx_scfs
this.dw_general_setting=create dw_general_setting
this.ddlb_approve=create ddlb_approve
this.ddlb_signature=create ddlb_signature
this.cb_close=create cb_close
this.cb_save=create cb_save
this.cb_refreshnow=create cb_refreshnow
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.gb_1=create gb_1
this.gb_2=create gb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cbx_close_word_before_open
this.Control[iCurrent+2]=this.cbx_wordinstance
this.Control[iCurrent+3]=this.cbx_cachefiles
this.Control[iCurrent+4]=this.cbx_checkmsword
this.Control[iCurrent+5]=this.cb_help_border
this.Control[iCurrent+6]=this.cbx_border
this.Control[iCurrent+7]=this.cbx_refresh_cache
this.Control[iCurrent+8]=this.cbx_auto_modify_owner
this.Control[iCurrent+9]=this.cbx_auto_add_owner
this.Control[iCurrent+10]=this.cbx_registry
this.Control[iCurrent+11]=this.cbx_window_classic
this.Control[iCurrent+12]=this.cbx_checkdb_size
this.Control[iCurrent+13]=this.cbx_trusted_sites
this.Control[iCurrent+14]=this.cbx_scfs
this.Control[iCurrent+15]=this.dw_general_setting
this.Control[iCurrent+16]=this.ddlb_approve
this.Control[iCurrent+17]=this.ddlb_signature
this.Control[iCurrent+18]=this.cb_close
this.Control[iCurrent+19]=this.cb_save
this.Control[iCurrent+20]=this.cb_refreshnow
this.Control[iCurrent+21]=this.st_4
this.Control[iCurrent+22]=this.st_3
this.Control[iCurrent+23]=this.st_2
this.Control[iCurrent+24]=this.st_1
this.Control[iCurrent+25]=this.gb_1
this.Control[iCurrent+26]=this.gb_2
end on

on w_client_refresh_setting.destroy
call super::destroy
destroy(this.cbx_close_word_before_open)
destroy(this.cbx_wordinstance)
destroy(this.cbx_cachefiles)
destroy(this.cbx_checkmsword)
destroy(this.cb_help_border)
destroy(this.cbx_border)
destroy(this.cbx_refresh_cache)
destroy(this.cbx_auto_modify_owner)
destroy(this.cbx_auto_add_owner)
destroy(this.cbx_registry)
destroy(this.cbx_window_classic)
destroy(this.cbx_checkdb_size)
destroy(this.cbx_trusted_sites)
destroy(this.cbx_scfs)
destroy(this.dw_general_setting)
destroy(this.ddlb_approve)
destroy(this.ddlb_signature)
destroy(this.cb_close)
destroy(this.cb_save)
destroy(this.cb_refreshnow)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;call super::open;String		ls_serti, ls_approve
Integer	li_i
String 	ls_tmp,ls_registry			//Added By Mark Lee 09/04/12
String ls_auto_add_owner,ls_auto_modify_owner  //Added By Jay Chen 10-28-2013
String ls_refresh_cache //Added By Jay Chen 02-10-2014
String ls_line,ls_display_page //Added By Jay Chen 05-12-2015
string ls_hide_tag
//get value
//Begin - Added By Mark Lee 09/04/12
//ls_serti =  gnv_data.of_GetItem( 'security_users', 'refresh_sertifi_time', 'user_id = "' + gs_user_id + '"' )
//ddlb_signature.Text = ls_Serti
//
//ls_approve =  gnv_data.of_GetItem( 'security_users', 'refresh_approve_time', 'user_id = "' + gs_user_id + '"' )
//ddlb_approve.Text = ls_approve
dw_general_setting.settransobject( sqlca)
dw_general_setting.retrieve(gs_user_id )

If dw_general_setting.rowcount( ) = 0 Then 
	dw_general_setting.insertrow( 0)
End If
//End - Added By Mark Lee 09/04/12


//check rights
If gnv_data.of_getitem( 'icred_settings', 'esign', False) = '1' Then
Else
	//Added By Mark Lee 09/04/12
//	ddlb_signature.Enabled = False
	dw_general_setting.modify("refresh_sertifi_time.protect=1 refresh_sertifi_time.background.color='553648127' ")
End If

ls_tmp = ''
//initial value
For li_i = 0 To 180 / 15
	//Begin - Added By Mark Lee 09/04/12
//	ddlb_signature.additem(  string(li_i * 15  ) )
//	ddlb_approve.additem(  string(li_i * 15  ) )
	ls_tmp = ls_tmp + string(li_i * 15  )+"	"+string(li_i * 15  )+"/"
	//End - Added By Mark Lee 09/04/12
Next

If not isnull(ls_tmp) and trim(ls_tmp) <> "" Then
	dw_general_setting.object.refresh_sertifi_time.values = ls_tmp
	dw_general_setting.object.refresh_approve_time.values = ls_tmp
End If

If 	gnv_user_option.of_get_option_value(gs_user_id, "restore_contract_state" ) = '1' Then
	cbx_scfs.checked = True
Else
	cbx_scfs.checked = False
End if

ls_tmp = gnv_user_option.of_get_option_value(gs_user_id, "trusted_sites" ) 
If  ls_tmp	= '1'  or isnull(ls_tmp) or trim(ls_tmp ) = '' Then
	cbx_trusted_sites.checked = True
Else
	cbx_trusted_sites.checked = False
End if

//Added By Ken.Guo 05/31/2013
ls_registry = gnv_user_option.of_get_option_value(gs_user_id, "check_registry")
If  ls_registry	= '1'  or isnull(ls_registry) or trim(ls_registry ) = '' Then
	cbx_registry.checked = True
Else
	cbx_registry.checked = False
End if

//Added By Jay Chen 10-28-2013
ls_auto_add_owner = gnv_user_option.of_get_option_value(gs_user_id, "auto_add_owner")
If  ls_auto_add_owner	= '1'  or isnull(ls_auto_add_owner) or trim(ls_auto_add_owner ) = '' Then
	cbx_auto_add_owner.checked = True
Else
	cbx_auto_add_owner.checked = False
End if

//Added By Jay Chen 01-22-2014
ls_auto_modify_owner = gnv_user_option.of_get_option_value(gs_user_id, "auto_modify_owner")
If  ls_auto_modify_owner = '1'   Then
	cbx_auto_modify_owner.checked = True
Else
	cbx_auto_modify_owner.checked = False
End if

//Added By Jay Chen 02-10-2014
ls_refresh_cache = gnv_user_option.of_get_option_value(gs_user_id, "refresh_contract_cache")
If  ls_refresh_cache = '1'   Then
	cbx_refresh_cache.checked = True
Else
	cbx_refresh_cache.checked = False
End if

If 	gnv_user_option.of_get_option_value(gs_user_id, "database_free_disk_space" ) = '1' Then
	cbx_checkdb_size.checked = True
Else
	cbx_checkdb_size.checked = False
End if

//Added By Mark Lee 03/07/2013
If 	gnv_user_option.of_get_option_value(gs_user_id, "Use_Windows_Classic_theme" ) = '1' Then
	cbx_window_classic.checked = True
Else
	cbx_window_classic.checked = False
End if

//added by gavins 20130313
If  gb_show_EZMenu  Then
	dw_general_setting.SetItem( dw_general_setting.rowCount( ), 'showezmenu'  , 1 )
End If

If gnv_user_option.of_Get_option_value( gs_user_id, "m_pfe_cst_master_menu.m_autoresize" )  = '1' Then
	dw_general_setting.SetItem( dw_general_setting.rowCount( ), 'set_autoresize'  , 1 )
Else
	dw_general_setting.SetItem( dw_general_setting.rowCount( ), 'set_autoresize'  , 0 )
End If
//Added By Jay Chen 10-22-2014
If gnv_user_option.of_Get_option_value( gs_user_id, "use_web_merge" )  = '1' Then
	dw_general_setting.SetItem( dw_general_setting.rowCount( ), 'use_web_merge'  , 1 )
Else
	dw_general_setting.SetItem( dw_general_setting.rowCount( ), 'use_web_merge'  , 0 )
End If
//end
//Added By Jay Chen 05-12-2015
ls_line = gnv_user_option.of_Get_option_value( gs_user_id, "perpage_rows" )
if isnull(ls_line) or ls_line = '' then ls_line = '100'
if long(ls_line) > 0 then
	dw_general_setting.SetItem( dw_general_setting.rowCount( ), 'perpage_rows'  , long(ls_line) )
end if
ls_display_page = gnv_user_option.of_Get_option_value( gs_user_id, "display_page" )
if isnull(ls_display_page) or ls_display_page = '' then ls_display_page = '0'
dw_general_setting.SetItem( dw_general_setting.rowCount( ), 'display_page'  , long(ls_display_page) )
If appeongetclienttype() = 'PB' Then
	dw_general_setting.modify("display_page.protect=1 display_page.color ='8421504' ")
	dw_general_setting.modify("perpage_rows.protect=1 perpage_rows.color ='8421504' ")
	dw_general_setting.modify("t_3.color ='8421504' ")
end if
//end
//Added By Jay Chen 07-09-2015
ls_hide_tag = gnv_user_option.of_Get_option_value( gs_user_id, "hide_docusign_tag" )
if isnull(ls_hide_tag) or ls_hide_tag = '' then ls_hide_tag = '0'
dw_general_setting.SetItem( dw_general_setting.rowCount( ), 'hide_docusign_tag'  , long(ls_hide_tag) )
//end

//Added By Ken.Guo 2016-03-16
String ls_wincolor_on, ls_wincolor_value
ls_wincolor_on = gnv_user_option.of_Get_option_value( gs_user_id, "custom_window_bkcolor_on" )
If ls_wincolor_on = '1' Then
	dw_general_setting.SetItem(1, 'win_bkcolor_on'  , 1 )
Else
	dw_general_setting.SetItem(1, 'win_bkcolor_on'  , 0 )
End If
ls_wincolor_value = gnv_user_option.of_Get_option_value( gs_user_id, "custom_window_bkcolor_value" )
If ls_wincolor_value <> '' Then
	dw_general_setting.SetItem(1, 'win_bkcolor_value'  , Long(ls_wincolor_value) )
Else
	dw_general_setting.SetItem(1, 'win_bkcolor_value'  , this.il_org_win_bkcolor )
End If

String ls_screen_border_on, ls_screen_border_value
ls_screen_border_on = gnv_user_option.of_Get_option_value( gs_user_id, "custom_screen_border_on" )
If ls_screen_border_on = '1' Then
	dw_general_setting.SetItem(1, 'screen_border_on'  , 1 )
Else
	dw_general_setting.SetItem(1, 'screen_border_on'  , 0 )
End If
ls_screen_border_value = gnv_user_option.of_Get_option_value( gs_user_id, "custom_screen_border_value" )
If ls_screen_border_value <> ''  Then
	dw_general_setting.SetItem(1, 'screen_border_value'  , Long(ls_screen_border_value ))
Else
	dw_general_setting.SetItem(1, 'screen_border_value'  , 5 )
End If

//Begin - Added By Gavin.Jay 2017-04-19
string ls_Value
ls_value = gnv_user_option.of_get_option_value('contractlogix-super-master','office_show_activate_buttons' )
If IsNull ( ls_value ) Or Trim ( ls_value ) = "" Then
	ls_value = "0"
End If
is_show_activate_buttons = ls_value
If is_show_activate_buttons = "0" Then
	dw_general_setting.modify("office_show_activate.visible=0 office_show_activate.protect=1 office_show_activate.color ='8421504' ") //Modified By Gavin.Jay 2017-06-08
End If

ls_value = gnv_user_option.of_get_option_value(gs_user_id,'office_show_activate_buttons' )
If IsNull ( ls_value ) Or Trim ( ls_value ) = "" Then
	ls_value = "0"
End If
is_show_activate_ori = ls_value
dw_general_setting.SetItem(1, 'office_show_activate'  , is_show_activate_ori )
//End - Added By Gavin.Jay 2017-04-19

dw_general_setting.SetItemStatus( dw_general_setting.rowCount( ), 0, Primary!, NotModified! )

//Added By Ken.Guo 09/23/2013
If gnv_data.of_getitem( 'icred_settings', 'check_registry', False ) <> '1' Then
	cbx_registry.enabled = False
	cbx_registry.checked = False
End If
If gnv_data.of_getitem( 'icred_settings', 'check_trusted_sites', False ) <> '1' Then
	cbx_trusted_sites.enabled = False
	cbx_trusted_sites.checked = False
End If

//Begin - Added By Mark Lee 02/17/2014	
if w_mdi.of_security_access(7001) = 1 then //Preload Contract Folder objects 	  set_prelod_ctx.background.color='536870912'   set_prelod_ctx.background.color='553648127' 
	dw_general_setting.modify("set_prelod_ctx.protect=0 set_prelod_ctx.color='33554432' ")
else
	dw_general_setting.modify("set_prelod_ctx.protect=1 set_prelod_ctx.color ='8421504' ")
end if 

if w_mdi.of_security_access(7002) = 1 then //Save Contract Folder State		
	cbx_scfs.enabled = True 
else
	cbx_scfs.enabled = False 
end if 
//End - Added By Mark Lee 02/17/2014

//Added By Ken.Guo 11/03/2014
If appeongetclienttype() = 'PB' Then
	cbx_border.enabled = False
Else
	If gnv_user_option.of_get_option_value(gs_user_id, "modify_windows_border_padding" ) = '1' Then
		cbx_border.checked = True
	Else
		cbx_border.checked = False
	End If
End If

//Added By Ken.Guo 01/07/2015
If gnv_user_option.of_get_option_value(gs_user_id, "check_msword" ) = '1' or gnv_user_option.of_get_option_value(gs_user_id, "check_msword" ) = '' Then
	cbx_checkmsword.checked = True
Else
	cbx_checkmsword.checked = False
End If

//Added By Ken.Guo 2015-07-28
If gnv_user_option.of_get_option_value(gs_user_id, "cache_files" ) = '0' Then
	cbx_cachefiles.checked = False
Else
	cbx_cachefiles.checked = True
End If

//Added By Ken.Guo 2015-07-30
If gnv_user_option.of_get_option_value(gs_user_id, "word_new_instance" ) = '1' Then
	cbx_wordinstance.checked = True
Else
	cbx_wordinstance.checked = False
End If

////Added By Ken.Guo 2015-08-10
//If gnv_user_option.of_get_option_value(gs_user_id, "close_word_before_open" ) = '0' Then
//	cbx_close_word_before_open.checked = False 
//Else
//	cbx_close_word_before_open.checked = True
//End If


end event

event closequery;Integer		li_Msg

cb_close.SetFocus( )
if IsValid(ids_SearchTemp) then Destroy ids_SearchTemp
if IsValid(ids_SearchDevTemp) then Destroy ids_SearchDevTemp
			
//Added By Mark Lee 09/05/12
//If ib_Modified Then
If ib_Modified OR dw_general_setting.ModifiedCount() > 0 Then
	li_msg = of_MessageBox ("pfc_master_closequery_savechanges", &
					gnv_app.iapp_object.DisplayName, &
					"Do you want to save changes?", exclamation!, YesNoCancel!, 1)
	Choose Case li_msg
		Case 1
			If wf_checkvalue( ) = 1 Then Return 1
			cb_save.Event clicked( )			
		Case 2
			// NO - Allow the window to be closed without saving changes
		Case 3
			Return 1
	End Choose
End If



end event

type cbx_close_word_before_open from checkbox within w_client_refresh_setting
boolean visible = false
integer x = 82
integer y = 2428
integer width = 1687
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Close current word before open next word document."
boolean lefttext = true
end type

event clicked;ib_Modified = true
end event

type cbx_wordinstance from checkbox within w_client_refresh_setting
integer x = 105
integer y = 800
integer width = 1783
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Create a shortcut for MS Word and open word files in a separate instance"
boolean lefttext = true
end type

event clicked;ib_Modified = true
end event

type cbx_cachefiles from checkbox within w_client_refresh_setting
integer x = 105
integer y = 724
integer width = 1783
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Use local cache files"
boolean lefttext = true
end type

event clicked;ib_Modified = true
end event

type cbx_checkmsword from checkbox within w_client_refresh_setting
integer x = 105
integer y = 324
integer width = 1783
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Check if MS Word is installed"
boolean lefttext = true
end type

event clicked;ib_Modified = true
end event

type cb_help_border from commandbutton within w_client_refresh_setting
integer x = 1915
integer y = 644
integer width = 78
integer height = 64
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "?"
end type

event clicked;Messagebox('Help Tip','Avoid cutting off toolbar text by modifying the Windows border padding. It takes effect after you log off Windows. Ignore this option for Windows XP.')
end event

type cbx_border from checkbox within w_client_refresh_setting
integer x = 105
integer y = 644
integer width = 1783
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Use best display effect for toolbar text (for web version)"
boolean lefttext = true
end type

event clicked;ib_Modified = true
end event

type cbx_refresh_cache from checkbox within w_client_refresh_setting
integer x = 105
integer y = 564
integer width = 1783
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Auto refresh contract cache data when opening the contract folder"
boolean lefttext = true
end type

event clicked;ib_Modified = true
end event

type cbx_auto_modify_owner from checkbox within w_client_refresh_setting
integer x = 105
integer y = 484
integer width = 1783
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Auto set as the Owner when Adding/Editing/Checking in Document "
boolean lefttext = true
end type

event clicked;ib_Modified = true
end event

type cbx_auto_add_owner from checkbox within w_client_refresh_setting
integer x = 105
integer y = 404
integer width = 1783
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Auto add the login user as the Owner when creating a new contract"
boolean lefttext = true
end type

event clicked;ib_Modified = true
end event

type cbx_registry from checkbox within w_client_refresh_setting
integer x = 105
integer y = 244
integer width = 1783
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Check Registry Permissions"
boolean lefttext = true
end type

event clicked;ib_Modified = true
end event

type cbx_window_classic from checkbox within w_client_refresh_setting
boolean visible = false
integer x = 2267
integer y = 1056
integer width = 1687
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Use Windows Classic theme  "
boolean lefttext = true
end type

event clicked;ib_Modified = true
end event

type cbx_checkdb_size from checkbox within w_client_refresh_setting
boolean visible = false
integer x = 2272
integer y = 1048
integer width = 1687
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Check if the system is less than 50MB free disk space for database"
boolean lefttext = true
end type

event clicked;ib_Modified = true
end event

type cbx_trusted_sites from checkbox within w_client_refresh_setting
integer x = 105
integer y = 164
integer width = 1783
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Check if the current URL is in IE~'s trusted sites "
boolean lefttext = true
end type

event clicked;ib_Modified = true
end event

type cbx_scfs from checkbox within w_client_refresh_setting
integer x = 105
integer y = 84
integer width = 1783
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Save contract folder state "
boolean lefttext = true
end type

event clicked;ib_Modified = true
end event

type dw_general_setting from datawindow within w_client_refresh_setting
integer x = 37
integer y = 936
integer width = 1998
integer height = 1320
integer taborder = 60
string title = "none"
string dataobject = "d_general_setting"
boolean border = false
boolean livescroll = true
end type

event buttonclicked;Long ll_color,ll_color_org

//Added By Mark Lee 09/04/12
If row > 0 Then 
	Choose Case dwo.name 
		Case 'b_refreshnow'
			parent.wf_run_now()
		Case 'b_wincolor' //Added By Ken.Guo 2016-03-16 
			If dwo.name = 'b_wincolor' and this.getitemnumber(1, 'win_bkcolor_on') = 1 Then
				ll_color = This.GetItemNumber(1,'win_bkcolor_value')
				ll_color_org = ll_color
				ChooseColor(ll_color,gl_custom_colors[])
				If ll_color_org <> ll_color Then
					This.SetItem(1,'win_bkcolor_value',ll_color)
				End If
			End If	
		Case 'b_wincolor_help' //Added By Ken.Guo 2016-03-16 
			Messagebox('Tips','1. You can customize the background color of the windows in the system.~r~n2. Contract Window and its sub-windows are not affected by this setting. They can be customized in Screen Painter.')
		Case 'b_border_help'
			Messagebox('Tips','1. You can customize the border style of the screens in the system.~r~n2. Contract Window and its sub-windows are not affected by this setting. They can be customized in Screen Painter.')
		Case Else
	End Choose
End If



end event

event editchanged;If dwo.Name = 'perpage_rows' and row > 0 Then
	If Len( data ) > 0  And not IsNumber( data ) Then 	
		messagebox('Input Error','Please enter a valid number.')
		return 1
	end if
End If
end event

type ddlb_approve from dropdownlistbox within w_client_refresh_setting
boolean visible = false
integer x = 3529
integer y = 1316
integer width = 315
integer height = 344
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean allowedit = true
boolean sorted = false
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;ib_Modified = true
end event

event modified;ib_Modified = true
end event

type ddlb_signature from dropdownlistbox within w_client_refresh_setting
boolean visible = false
integer x = 3525
integer y = 1184
integer width = 315
integer height = 468
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean allowedit = true
boolean sorted = false
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event modified;ib_Modified = true
end event

event selectionchanged;ib_Modified = true
end event

type cb_close from commandbutton within w_client_refresh_setting
integer x = 1673
integer y = 2288
integer width = 343
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Close"
boolean cancel = true
end type

event clicked;Close( parent )
end event

type cb_save from commandbutton within w_client_refresh_setting
integer x = 1280
integer y = 2288
integer width = 375
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Save Settings"
boolean default = true
end type

event clicked;String			ls_serti, ls_approve,ls_use_web_merge,ls_line,ls_display_page,ls_hide_tag
integer 		li_rtn
String 		ls_save_contract_folder_state,	ls_trusted_sites, ls_set_prelod_ctx
String 		ls_set_autoresize, ls_checkdb_size, ls_registry,ls_auto_add_owner
String		ls_auto_modify_owner,ls_refresh_cache, ls_checkmsword, ls_cachefile, ls_wordinstance
dwItemStatus	ldws_set_prelod_ctx,	ldws_set_autoresize, ldws_set_showezmenu
dwItemStatus ldws_use_web_merge,ldws_perpage_rows,ldws_display_page,ldws_hide_tag
dwItemStatus ldws_wincolor_on, ldws_wincolor_value,ldws_screen_border_on, ldws_screen_border_value
boolean lb_refresh_contract
String ls_close_word_before_open ,ls_wincolor_on,ls_wincolor_value //Added By Ken.Guo 2016-03-16
String ls_screen_border_on, ls_screen_border_value 
String ls_show_activate //Added By Gavin.Jay 2017-04-19

// save data
//Begin - Added By Mark Lee 09/05/12
If ib_Modified = True Then	
	If ib_Modified = True Then
		If  cbx_scfs.checked = True Then
			ls_save_contract_folder_state 	= '1'
			gb_restore_contract_state = True
		Else
			ls_save_contract_folder_state 	= '0'
			gb_restore_contract_state = False
		End If
		
		gnv_user_option.of_Set_option_value(gs_user_id, "restore_contract_state",ls_save_contract_folder_state )
//		gnv_user_option.of_save( )	
		
		If isvalid(m_pfe_cst_master_menu) Then 
			gnv_app.of_modify_menu_attr( m_pfe_cst_master_menu.m_window.m_savecontractfolderstate,'Checked', gb_restore_contract_state)
		End If
		
		If  cbx_trusted_sites.checked = True Then
			ls_trusted_sites 	= '1'
		Else
			ls_trusted_sites 	= '0'
		End If
		gnv_user_option.of_Set_option_value(gs_user_id, "trusted_sites",ls_trusted_sites )
		
		//Added By Jay Chen 10-28-2013
		If  cbx_auto_add_owner.checked = True Then
			ls_auto_add_owner 	= '1'
		Else
			ls_auto_add_owner 	= '0'
		End If		
		gnv_user_option.of_Set_option_value(gs_user_id, "auto_add_owner",ls_auto_add_owner )
		
		//Added By Jay Chen 01-22-2014
		If  cbx_auto_modify_owner.checked = True Then
			ls_auto_modify_owner 	= '1'
		Else
			ls_auto_modify_owner 	= '0'
		End If		
		gnv_user_option.of_Set_option_value(gs_user_id, "auto_modify_owner",ls_auto_modify_owner )
		
		//Added By Jay Chen 02-10-2014
		If  cbx_refresh_cache.checked = True Then
			ls_refresh_cache = '1'
		Else
			ls_refresh_cache = '0'
		End If		
		gnv_user_option.of_Set_option_value(gs_user_id, "refresh_contract_cache",ls_refresh_cache )

		//Added By Ken.Guo 05/31/2013
		If  cbx_registry.checked = True Then
			ls_registry 	= '1'
		Else
			ls_registry 	= '0'
		End If		
		gnv_user_option.of_Set_option_value(gs_user_id, "check_registry",ls_registry )
		
		//Added By Mark Lee 09/11/12
		If  cbx_checkdb_size.checked = True Then
			ls_checkdb_size 	= '1'
		Else
			ls_checkdb_size 	= '0'
		End If
		gnv_user_option.of_Set_option_value(gs_user_id, "database_free_disk_space",ls_checkdb_size )
		
		//Added By Mark Lee 03/07/2013  	//Added By Mark Lee 04/07/2013  do not need it ,this is useer control for dw title bar .
		If cbx_window_classic.checked = True Then 
			gnv_user_option.of_Set_option_value(gs_user_id, "Use_Windows_Classic_theme" ,'1') 
		Else
			gnv_user_option.of_Set_option_value(gs_user_id, "Use_Windows_Classic_theme", '0' ) 
		End if
		
		//Added By Ken.Guo 11/03/2014
		If cbx_border.checked = True Then 
			gnv_user_option.of_Set_option_value(gs_user_id, "modify_windows_border_padding" ,'1') 
			gf_set_windows_border_padding('-15')
		Else
			gnv_user_option.of_Set_option_value(gs_user_id, "modify_windows_border_padding", '0' ) 
			gf_set_windows_border_padding('-60')
		End if
		
		//Added By Ken.Guo 01/07/2015
		If  cbx_checkmsword.checked = True Then
			ls_checkmsword 	= '1'
		Else
			ls_checkmsword 	= '0'
		End If
		gnv_user_option.of_Set_option_value(gs_user_id, "check_msword",ls_checkmsword )
		
		//Added By Ken.Guo 2015-07-28
		If cbx_cachefiles.checked = True Then
			ls_cachefile = '1'
		Else
			ls_cachefile = '0'
		End If
		gnv_user_option.of_Set_option_value(gs_user_id, "cache_files",ls_cachefile )
	
		//Added By Ken.Guo 2015-07-30
		If cbx_wordinstance.checked = True Then
			ls_wordinstance = '1'
		Else
			ls_wordinstance = '0'
		End If
		gnv_user_option.of_Set_option_value(gs_user_id, "word_new_instance",ls_wordinstance )

//		//Added By Ken.Guo 2015-08-10.//Commented By Ken.Guo 2015-08-14
//		If cbx_close_word_before_open.checked = True Then
//			ls_close_word_before_open = '1'
//		Else
//			ls_close_word_before_open = '0'
//		End If
//		gnv_user_option.of_Set_option_value(gs_user_id, "close_word_before_open",ls_close_word_before_open )
		
		gnv_user_option.of_save( )	
		
		ib_Modified = false		
	End If

End If

dw_general_setting.accepttext() //Added By Jay Chen 05-12-2015
If dw_general_setting.ModifiedCount() > 0 Then
	If wf_checkvalue( ) = 1 Then Return
	
//	set_prelod_ctx set_autoresize
	ldws_set_prelod_ctx = dw_general_setting.getitemstatus(dw_general_setting.getrow() , 'set_prelod_ctx', Primary!)
	ldws_set_autoresize = dw_general_setting.getitemstatus(dw_general_setting.getrow() , 'set_autoresize', Primary!)
	ldws_set_showezmenu= dw_general_setting.getitemstatus(dw_general_setting.getrow() , 'showezmenu', Primary!)
	ldws_use_web_merge = dw_general_setting.getitemstatus(dw_general_setting.getrow() , 'use_web_merge', Primary!) //Added By Jay Chen 10-22-2014
	//Added By Jay Chen 05-12-2015
	ldws_perpage_rows = dw_general_setting.getitemstatus(dw_general_setting.getrow() , 'perpage_rows', Primary!) 
	ldws_display_page = dw_general_setting.getitemstatus(dw_general_setting.getrow() , 'display_page', Primary!)
	ldws_hide_tag = dw_general_setting.getitemstatus(dw_general_setting.getrow() , 'hide_docusign_tag', Primary!)
	
	//Added By Ken.Guo 2016-03-16
	ldws_wincolor_on = dw_general_setting.getitemstatus(dw_general_setting.getrow() , 'win_bkcolor_on', Primary!)
	ldws_wincolor_value = dw_general_setting.getitemstatus(dw_general_setting.getrow() , 'win_bkcolor_value', Primary!)
	ldws_screen_border_on = dw_general_setting.getitemstatus(dw_general_setting.getrow() , 'screen_border_on', Primary!)
	ldws_screen_border_value = dw_general_setting.getitemstatus(dw_general_setting.getrow() , 'screen_border_value', Primary!)
		
	li_rtn = dw_general_setting.update( )
//	If SQLCA.SQLCODE <> 0 Then
	if li_rtn <> 1 then
		ROLLBACK USING SQLCA;
		gnv_debug.of_output( true, "Failed to Save the General Settings. SqlErrText:"+ Sqlca.SQLErrText )					//Added By Mark Lee 07/01/2015
		MessageBox( 'Error', "Failed to Save!" +  Sqlca.SQLErrText  )
		Return	
	else
		COMMIT USING SQLCA;
	End If	
	
	gnv_data.of_Retrieve( 'security_users' )
	
	If ldws_set_prelod_ctx = NewModified! Or ldws_set_prelod_ctx = DataModified!	Then
		ls_set_prelod_ctx = String(dw_general_setting.GetitemNumber( dw_general_setting.getrow(),'set_prelod_ctx'))
		If ls_set_prelod_ctx = '1' Then
			gb_PreloadCTX  = True
		Else
			gb_PreloadCTX = False
		End If
		If isvalid(m_pfe_cst_master_menu) Then 
			gnv_app.of_modify_menu_attr( m_pfe_cst_master_menu.m_window.m_preload,'Checked', gb_PreloadCTX)
		End If
	End If

	If ldws_set_autoresize = NewModified! Or ldws_set_autoresize = DataModified!	Then
		ls_set_autoresize = String(dw_general_setting.GetitemNumber( dw_general_setting.getrow(),'set_autoresize'))
		If ls_set_autoresize = '1' Then
			gb_autozoom  = True
		Else
			gb_autozoom = False
		End If
		If isvalid(m_pfe_cst_master_menu) Then 
			gnv_app.of_modify_menu_attr( m_pfe_cst_master_menu.m_window.m_autoresize,'Checked', gb_autozoom) //modified by gavins 20130107
		End If
		IF gb_autozoom THEN//modified by gavins 20130107
			gnv_user_option.of_Set_option_value( gs_user_id, "m_pfe_cst_master_menu.m_autoresize",'1' )
		ELSE
			gnv_user_option.of_Set_option_value( gs_user_id, "m_pfe_cst_master_menu.m_autoresize",'0' )
		END IF
		gnv_user_option.of_Save( )
	End If
	
	If ldws_set_showezmenu = NewModified! Or  ldws_set_showezmenu = DataModified!	Then//added by gavins 20130313
		ls_set_autoresize = String(dw_general_setting.GetitemNumber( dw_general_setting.getrow(),'showezmenu'))
		If ls_set_autoresize = '1' Then
			gb_show_EZMenu  = True
		Else
			gb_show_EZMenu = False
		End If
		if gb_show_EZMenu then
			gnv_user_option.of_Set_option_value(gs_user_id, "EZMENU_SHOW","1" ) //Modified By Jay Chen 07-25-2014 remark:modify EZMENU_SHOW as user level parameter
//			gnv_user_option.of_Set_option_value("contractlogix-super-master", "EZMENU_SHOW","1" )//modify by gavins 20130524
		else
//			gnv_user_option.of_Set_option_value("contractlogix-super-master", "EZMENU_SHOW","0" )
			gnv_user_option.of_Set_option_value(gs_user_id, "EZMENU_SHOW","0" )
		end if		
		gnv_user_option.of_save( )

		If isvalid(w_mdi) Then 
			w_mdi.of_showezmenu( gb_show_EZMenu )
			w_mdi.event ue_RefreshEZMenu( )
		End If
	End If
	
	//Added By Jay Chen 10-22-2014
	If ldws_use_web_merge = NewModified! Or  ldws_use_web_merge = DataModified!	Then
		ls_use_web_merge = String(dw_general_setting.GetitemNumber( dw_general_setting.getrow(),'use_web_merge'))
		if isnull(ls_use_web_merge) then ls_use_web_merge = '0'
		gnv_user_option.of_Set_option_value(gs_user_id, "use_web_merge",ls_use_web_merge)
		gnv_user_option.of_save( )
	End If
	//end
	
	//Added By Jay Chen 05-12-2015
	If ldws_perpage_rows = NewModified! Or  ldws_perpage_rows = DataModified!	Then
		ls_line = String(dw_general_setting.GetitemNumber( dw_general_setting.getrow(),'perpage_rows'))
		if isnull(ls_line) then ls_line = '100'
		if long(ls_line) <= 0 then
			messagebox('Input Error','Please enter a number greater than zero.')
			dw_general_setting.setfocus()
			dw_general_setting.setcolumn("perpage_rows")
			return 
		end if
		gnv_user_option.of_Set_option_value(gs_user_id, "perpage_rows",ls_line)
		gnv_user_option.of_save( )
		lb_refresh_contract = true
	End If
	If ldws_display_page = NewModified! Or  ldws_display_page = DataModified!	Then
		ls_display_page = String(dw_general_setting.GetitemNumber( dw_general_setting.getrow(),'display_page'))
		if isnull(ls_display_page) then ls_display_page = '0'
		gnv_user_option.of_Set_option_value(gs_user_id, "display_page",ls_display_page)
		gnv_user_option.of_save( )
		lb_refresh_contract = true
	End If
	if lb_refresh_contract then
		if IsValid(gw_Contract) then
			PowerObject lpo_NullParm
			gw_Contract.SetRedraw( false)
			if Not IsValid(ids_SearchTemp) then ids_SearchTemp = Create DataStore
			if Not IsValid(ids_SearchDevTemp) then ids_SearchDevTemp = Create DataStore
			Trigger Event ue_CloseContract()
			gf_OpenContractFolder(lpo_NullParm)
			Post Event ue_OpenContract()
		end if
	end if
	//end
	
	//Added By Jay Chen 07-09-2015
	If ldws_hide_tag = NewModified! Or  ldws_hide_tag = DataModified!	Then
		ls_hide_tag = String(dw_general_setting.GetitemNumber( dw_general_setting.getrow(),'hide_docusign_tag'))
		if isnull(ls_hide_tag) then ls_hide_tag = '0'
		gnv_user_option.of_Set_option_value(gs_user_id, "hide_docusign_tag",ls_hide_tag)
		gnv_user_option.of_save( )
	End If

	//Added By Ken.Guo 2016-03-16
	If ldws_wincolor_on = NewModified! Or  ldws_wincolor_on = DataModified!	Then
		ls_wincolor_on = String(dw_general_setting.GetitemNumber( dw_general_setting.getrow(),'win_bkcolor_on'))
		if isnull(ls_wincolor_on) then ls_wincolor_on = '0'
		gnv_user_option.of_Set_option_value(gs_user_id, "custom_window_bkcolor_on",ls_wincolor_on)
		gnv_user_option.of_save( )
	End If
	If ldws_wincolor_value = NewModified! Or  ldws_wincolor_value = DataModified!	Then
		ls_wincolor_value = String(dw_general_setting.GetitemNumber( dw_general_setting.getrow(),'win_bkcolor_value'))
		if isnull(ls_wincolor_value) then ls_wincolor_value = '0'
		gnv_user_option.of_Set_option_value(gs_user_id, "custom_window_bkcolor_value",ls_wincolor_value)
		gnv_user_option.of_save( )
	End If	
	
	If ldws_screen_border_on = NewModified! Or  ldws_screen_border_on = DataModified!	Then
		ls_screen_border_on = String(dw_general_setting.GetitemNumber( dw_general_setting.getrow(),'screen_border_on'))
		if isnull(ls_screen_border_on) then ls_screen_border_on = '0'
		gnv_user_option.of_Set_option_value(gs_user_id, "custom_screen_border_on",ls_screen_border_on)
		gnv_user_option.of_save( )
	End If
	If ldws_screen_border_value = NewModified! Or  ldws_screen_border_value = DataModified!	Then
		ls_screen_border_value = String(dw_general_setting.GetitemNumber( dw_general_setting.getrow(),'screen_border_value'))
		if isnull(ls_screen_border_value) then ls_screen_border_value = '0'
		gnv_user_option.of_Set_option_value(gs_user_id, "custom_screen_border_value",ls_screen_border_value)
		gnv_user_option.of_save( )
	End If		
	
	//Begin - Added By Gavin.Jay 2017-04-19
	ls_show_activate =  dw_general_setting.GetItemString(dw_general_setting.getrow() , 'office_show_activate')
	If ls_show_activate <> is_show_activate_ori Then
		gnv_user_option.of_set_option_value( gs_user_id,'office_show_activate_buttons', ls_show_activate)
		gnv_user_option.of_save()
		is_show_activate_ori = ls_show_activate
	End If
	//End - Added By Gavin.Jay 2017-04-19

End If

//Added By Ken.Guo 2015-07-30
n_cst_word_addins lnv_word
If cbx_wordinstance.checked Then
	lnv_word.of_add_word_shortcut( )
	lnv_word.of_set_word_new_instance(1, True)
Else
	lnv_word.of_delete_word_shortcut( )
	lnv_word.of_set_word_new_instance(0, False) //hide the message when user unchecked the option.
End If


end event

type cb_refreshnow from commandbutton within w_client_refresh_setting
boolean visible = false
integer x = 3022
integer y = 1496
integer width = 343
integer height = 92
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Run Now"
end type

event clicked;
If gnv_data.of_getitem( 'icred_settings', 'esign', False) = '1' Then
//	gnv_sertifi.of_refresh_sertifi_status()
//	gnv_echosign.of_refresh_sertifi_status() //Added By Jay Chen 10-16-2013
//	gnv_docusign.ib_ping_server = false //Added By Jay Chen 07-24-2014
//	gnv_docusign.of_refresh_sertifi_status() //Added By Jay Chen 04-15-2014
//	gnv_docusign.ib_ping_server = true
	gnv_app.of_refresh_sign( true)						//Added By Mark Lee 04/03/2015
End If

gnv_webapprove.of_refresh_status( )
end event

type st_4 from statictext within w_client_refresh_setting
boolean visible = false
integer x = 3182
integer y = 1332
integer width = 869
integer height = 84
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Refresh Every [                        ] Minutes"
boolean focusrectangle = false
end type

type st_3 from statictext within w_client_refresh_setting
boolean visible = false
integer x = 3182
integer y = 1188
integer width = 869
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Refresh Every [                        ] Minutes"
boolean focusrectangle = false
end type

type st_2 from statictext within w_client_refresh_setting
boolean visible = false
integer x = 2263
integer y = 1332
integer width = 928
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Refresh Document Approval Data                            "
boolean focusrectangle = false
end type

type st_1 from statictext within w_client_refresh_setting
boolean visible = false
integer x = 2263
integer y = 1188
integer width = 928
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Refresh Document Signature Data                           "
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_client_refresh_setting
integer x = 55
integer y = 12
integer width = 1957
integer height = 892
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "General"
end type

type gb_2 from groupbox within w_client_refresh_setting
boolean visible = false
integer x = 2208
integer y = 1096
integer width = 1911
integer height = 356
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Refresh Document Signature and Approval Data"
end type

