$PBExportHeader$u_tabpg_contract_detail_audit.sru
forward
global type u_tabpg_contract_detail_audit from u_tabpg_contract_master
end type
type dw_1 from u_dw_contract within u_tabpg_contract_detail_audit
end type
end forward

global type u_tabpg_contract_detail_audit from u_tabpg_contract_master
integer width = 2757
integer height = 564
string text = "Audit Trail"
dw_1 dw_1
end type
global u_tabpg_contract_detail_audit u_tabpg_contract_detail_audit

type variables
long il_ctx_id

Boolean		ib_Update //added by gavins 20121227
end variables

forward prototypes
public subroutine of_create_dw_ag ()
end prototypes

public subroutine of_create_dw_ag ();//////////////////////////////////////////////////////////////////////
// Function: of_create_dw_ag
// Arguments:
//--------------------------------------------------------------------
// Return:  (None)
//--------------------------------------------------------------------
// Author:	 Ken.Guo 03/07/2012.
//--------------------------------------------------------------------
// Description: //dynamic create dw.  Copy from u_tabpg_detail_detail.tabpage_1.constructor()
//--------------------------------------------------------------------
//////////////////////////////////////////////////////////////////////

string ls_tab_name
string ls_dw_name[]
string ls_dataobject[]
integer li_view_id,ll_i
datawindow ld_dw[]

ls_tab_name = 'tabpage_details'

ld_dw[1] = dw_1
ls_dw_name[1] = 'dw_1'
ls_dataobject[1] = 'd_contract_det_custom_2'
f_create_contract_dw(gi_contract_view_id,ls_tab_name,ld_dw,ls_dw_name,ls_dataobject)		

dw_1.ib_retrieve_drop_downs = false
dw_1.event ue_populatedddws( )
dw_1.SetTransObject(SQLCA)


end subroutine

on u_tabpg_contract_detail_audit.create
int iCurrent
call super::create
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
end on

on u_tabpg_contract_detail_audit.destroy
call super::destroy
destroy(this.dw_1)
end on

type st_1 from u_tabpg_contract_master`st_1 within u_tabpg_contract_detail_audit
end type

type dw_1 from u_dw_contract within u_tabpg_contract_detail_audit
event ue_sync_to_salesforce ( )
string tag = "Audit Trail"
integer x = 5
integer y = 8
integer width = 2743
integer height = 548
integer taborder = 10
boolean bringtotop = true
string title = "Audit Trail"
boolean hscrollbar = true
boolean livescroll = false
boolean ib_isupdateable = false
boolean ib_rmbfocuschange = false
string dataobject_original = "d_view_audit2_ctx"
boolean ib_use_row_selection = true
boolean ib_allow_filter = true
boolean ib_allow_sort = true
end type

event ue_sync_to_salesforce();//Added by Harry 20170320 for task 749
n_cst_webapi lnv_webapi
long ll_import_id, ll_ctx_id, ll_count, ll_rtn
string ls_msg,ls_user,ls_pwd,ls_token 
string ls_salesforce_id, ls_sfurl

select a.import_id into :ll_import_id from import_hdr a,import_table_records b where a.import_id = b.import_id and a.import_type = '2' and a.import_flag = '1' and a.sync_salesforce = 1 and b.isoft_table_id = 1008;
if isnull(ll_import_id) then ll_import_id = 0
if ll_import_id <= 0 then 
	messagebox('Contractlogix','The system can not find the mapping for the Custom Data2 synchronization. Please make sure you have configured it correctly in the Data Synchronization Painter.')
	return 
end if


ll_ctx_id = this.getitemnumber(this.getrow(), 'ctx_id')
ls_msg =  'Are you sure you want to sync this custom data2 (ID = '+String(ll_ctx_id)+') to SalesForce?'

select top 1 salesforce_user,salesforce_pwd,salesforce_token, salesforceurl into :ls_user,:ls_pwd,:ls_token, :ls_sfurl from security_user_salesforce;
if isnull(ls_pwd)  then ls_pwd = ''
if isnull(ls_token)  then ls_token = ''
if isnull( ls_sfurl ) then ls_sfurl = ''	
ls_pwd += ls_token
if messagebox('Sync Custom Data2', ls_msg,Exclamation!,Yesno!,2) = 1 then
	//check the ctx_id if or not already sync to salesforce
	select count(*) into :ll_count from import_outbound_records where lower(ctx_tablename) = 'ctx_custom' and lower(ctx_fieldname) = 'ctx_id' and ctx_record_id = :ll_ctx_id and export_type = 1;
	if isnull(ll_count) then ll_count = 0
	if ll_count > 0 then 
		if messagebox('Sync Custom Data2', 'The custom data2 (ID = '+String(ll_ctx_id)+') has already been synchronized to SalesForce.~r~nAre you sure you want to overwrite the custom data2 information on SalesForce?',Exclamation!,Yesno!,2) <> 1 then
			return
		end if
	end if
	ll_rtn = lnv_webapi.of_outboundexternaldata(ls_user,ls_pwd, '1', ll_ctx_id, 0, 0, 0, ll_import_id, ls_salesforce_id, ls_sfurl, 0, 0)
	if len(ls_salesforce_id) <= 0 then
		messagebox('Sync Custom Data2', 'Failed to synchronize the custom data2 (ID = '+String(ll_ctx_id)+') to SalesForce.')
	else
		messagebox('Sync Custom Data2', 'Succeed to sync the custom data2 to salesforce.')
	end if					
end if
end event

event pfc_retrieve;call super::pfc_retrieve;long ll_count

ll_count = Retrieve(il_ctx_id)
if ll_count < 1 then

	//Modified By Ken.Guo 03/07/2012.  Workaround APB's Bug.
	//this.event pfc_insertrow( )
	Parent.of_create_dw_ag() 
	ll_count = Retrieve(il_ctx_id)
	If ll_count < 1 Then
		this.event pfc_insertrow( )
	End If

	 //Added By Ken.Guo 2016-11-16. task 679
	 If isvalid(gw_contract) Then
		gw_contract.tab_contract_details.tabpage_details.uo_1.event ue_set_security( )
	 End If
	 
end if

//Added By Jay Chen 01-11-2016 workaround APB BUG: cannot display company assemble
long ll_row,ll_column_count,ll_null
string ls_dddw_name,ls_colname,ls_coltype,ls_style,ls_value,ls_tag
datawindowchild dwchild
if AppeonGetClientType() = 'WEB' then
	ll_column_count = long(dw_1.object.datawindow.column.count)
	FOR ll_row = 1 TO ll_column_count
		ls_colname = dw_1.Describe("#" +string(ll_row) + ".Name")
		ls_coltype = dw_1.Describe(ls_colname+".coltype")
		ls_style = dw_1.Describe(ls_colname+".edit.style")
		if ls_style = 'dddw' and left(ls_coltype,4) = 'char' then
			ls_dddw_name = lower(dw_1.Describe("#" +string(ll_row) + ".DDDW.Name"))
			ls_tag = dw_1.describe(ls_colname +".tag")
			ls_value = dw_1.getitemstring(1, ls_colname)
			if ls_dddw_name = "d_dddw_company" or ls_dddw_name = "d_dddw_company_list" or ls_dddw_name = 'dddw_contact_company_new' then 
				if long(ls_value) = 0 then //data value is not single company
					dw_1.getchild(ls_colname, dwchild)
					if ls_dddw_name = 'dddw_contact_company_new' then
						dwchild.settransobject(sqlca)
						dwchild.retrieve(gs_user_id)
					else
						dwchild.settransobject(sqlca)
						dwchild.retrieve(ls_tag)
					end if
				end if
			end if
		end if 
	NEXT
end if
//end

//Refresh ctx_basic_info alarm flag -- //Added By Ken.Guo 05/18/2012
string ls_datascreen[],ls_customscreen[]
ls_customscreen = {'custom_date1','custom_date2','custom_date3','custom_date4','custom_date5','custom_date6','custom_date7','custom_date8','custom_date9','custom_date10','custom_date11','custom_date12','custom_date13','custom_date14','custom_date15'}
inv_contract_details.of_set_alarm_flag( dw_1 , 'ctx_custom', ls_customscreen, il_ctx_id,0,0,0)

return ll_count

end event

event pfc_prermbmenuproperty;call super::pfc_prermbmenuproperty;

am_dw.m_table.m_cut.Visible = false
am_dw.m_table.m_copy.Visible = false
am_dw.m_table.m_paste.Visible = false
am_dw.m_table.m_dash11.Visible = false
am_dw.m_table.m_insert.Visible = false
am_dw.m_table.m_addrow.Visible = false

am_dw.m_table.m_delete.Visible = false
am_dw.m_table.m_selectall.Visible = false
am_dw.m_table.m_restorerow.Visible = false


end event

event pfc_addrow;//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 08.23.2006 By: Liang QingShi
//$<reason> Contract module modification
//$<reason>Fix a defect.
//
return success
//---------------------------- APPEON END ----------------------------

end event

event pfc_deleterow;//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 08.23.2006 By: Liang QingShi
//$<reason> Contract module modification
//$<reason>Fix a defect.
//
return success
//---------------------------- APPEON END ----------------------------

end event

event rbuttonup;//
end event

event getfocus;call super::getfocus;//====================================================================
// Event: getfocus()
//--------------------------------------------------------------------
// Description: Set the add menu item disabled
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	Scofield		Date: 2008-11-14
//====================================================================

if IsValid(m_pfe_cst_mdi_menu_contract) then
	gnv_app.of_modify_menu_attr( m_pfe_cst_mdi_menu_contract.m_edit.m_insert,'enabled', false)
end if

end event

event pfc_preinsertrow;call super::pfc_preinsertrow;if this.rowcount( ) = 1 then
	return failure
end if 
return success
end event

event constructor;call super::constructor;This.of_setupdateable( True)
this.of_Setdropdowncalendar( true)
this.of_setrowselect( false)

//dw_1.modify("custom_15.dddw.autohscroll=no")
//dw_1.modify("custom_15.height.autosize=yes ")
//dw_1.Modify("DataWindow.Detail.Height.AutoSize=yes")
//dw_1.modify("custom_15.dddw.HScrollBar=no")
//dw_1.modify("custom_15.dddw.VScrollBar=yes")
//dw_1.modify("custom_15.dddw.allowedit=yes")

end event

event pfc_postinsertrow;call super::pfc_postinsertrow;if al_row > 0 then
	OF_ENABLE_SAVE()
	This.SetItem(al_row, 'ctx_id',il_ctx_id )
end if
end event

event buttonclicked;call super::buttonclicked;//Add ability to put alarms on all custom date fields -- jervis 05.18.2011
if of_check_read_only( ) then return success 
inv_contract_details.of_set_alarm( this,'ctx_custom', dwo)

end event

event pfc_preupdate;call super::pfc_preupdate;//Set ctx_id   -- jervis 05.24.2011
long ll_i,ll_count

ll_count = this.Rowcount( )
for ll_i = 1 to ll_count
	if this.GetItemStatus( ll_i,0,Primary!) = NewModified! then
		this.SetItem( ll_i,"ctx_id", il_ctx_id)
	end if
next
return success

end event

event rbuttondown;call super::rbuttondown;inv_contract_details.of_reset_alarm( this,'ctx_custom',dwo) //jervis 07.04.2011

//Added By Ken.Guo 2015-12-29
//Popup meu when it does not trigger the reset alarm.
m_main_vertical_print lm_vertical_print
if this.Describe("DataWindow.ReadOnly") = "yes" or this.Describe(dwo.name + ".protect") <> "0" or this.Describe(dwo.name + ".TabSequence") = "0" or this.Describe( dwo.name + ".ColType") <> "datetime" then 
	lm_vertical_print = Create m_main_vertical_print
	lm_vertical_print.idw_data = This
	
	//Added By Ken.Guo 2016-03-30
	m_dw_base lm_dw_base 
	Boolean lb_add_base_menu = True	 
	Integer i	
	If dwo.type = 'column' Then
		If this.describe(dwo.name+'.edit.style') = 'ddlb' Then
			If this.describe(dwo.name+'.DDLB.AllowEdit') = 'no' Then lb_add_base_menu = False
		End If
		If this.describe(dwo.name+'.edit.style') = 'dddw' Then
			If this.describe(dwo.name+'.dddw.AllowEdit') = 'no' Then lb_add_base_menu = False
		End If		
		If This.Object.DataWindow.Print.Preview = "yes" Then lb_add_base_menu = False
		If This.Object.DataWindow.ReadOnly = "yes" Then lb_add_base_menu = False
		If this.describe(dwo.name + '.protect') = '1' Then lb_add_base_menu = False
		If this.describe(dwo.name + '.TabSequence') = '0' Then lb_add_base_menu = False
		If this.describe(dwo.name+'.edit.style') = 'checkbox' or  this.describe(dwo.name+'.edit.style') = 'radiobutton'  Then
			lb_add_base_menu = False
		End If				
	Else
		lb_add_base_menu = False
	End If 
	If lb_add_base_menu Then
		lm_dw_base = Create m_dw_base
		lm_dw_base.of_setdw( this)
		for i = 1 to Upperbound(lm_dw_base.item[])
			if i = 1 Then lm_dw_base.item[i].visible =  True
			lm_vertical_print.item[upperbound(lm_vertical_print.item[]) + 1 ] = lm_dw_base.item[i]
		Next
	End If		
	lm_vertical_print.m_synctosf.visible = True  //Added by Harry 2017-03-17 for task749
	
	lm_vertical_print.POPmenu( w_mdi.PointerX(), w_mdi.PointerY())
End If


end event

event ue_post_itemchanged;call super::ue_post_itemchanged;//Added By Ken.Guo 05/08/2012. Check & Reset Date Alarm Status.
Long ll_ctx_id
n_cst_date_alarm lnv_date_alarm
If row <= 0 Then Return 
If dwoname = '' Then Return
If Describe(dwoname + '.ColType') = 'datetime' Then
	If This.GetItemDateTime(row, dwoname, Primary!, True) = This.GetItemDateTime(row, dwoname, Primary!, False)  Then
		//Do nothing
	Else
		lnv_date_alarm.of_reset_alart_status( 'ctx_custom', dwoname,il_ctx_id, 0,0,0)
	End If
End If

//Added By Jay Chen 01-11-2016
long ll_view,ll_screen
string ls_coltype,ls_style
ll_view = dw_1.il_viewid
ll_screen = dw_1.il_screenid
ls_coltype = dw_1.Describe(dwoname+".coltype")
ls_style = dw_1.Describe(dwoname+".edit.style")
ll_ctx_id = dw_1.getitemnumber(1,"ctx_id")

//Added By Ken.Guo 2017-05-09  Task 770. When a new contract is created, all Multi-select fields have values already selected
String ls_multi_select
ls_multi_select = gnv_data.of_getitem( 'multi_select_fields', 'object_format', 'view_id = ' + String(ll_view) + ' and screen_id = ' + String(ll_screen) + ' and object_name = "' +dwoname+ '"' + ' and object_type = "multi-select"' )

if ls_style = 'dddw' and left(ls_coltype,4) = 'char' and ls_multi_select = 'Y' then //Modified By Ken.Guo 2017-05-09
	delete from screen_field_select_item where view_id = :ll_view and screen_id = :ll_screen and field_name = :dwoname and ctx_id = :ll_ctx_id;
	insert into screen_field_select_item(view_id,screen_id,ctx_id,field_name,field_data)
	values(:ll_view,:ll_screen,:ll_ctx_id,:dwoname,:data);
end if

end event

event pfc_postupdate;call super::pfc_postupdate;string ls_datascreen[],ls_customscreen[]

gnv_appeondb.of_startqueue( )
If ib_Update Then gnv_data.of_retrieve( "ctx_notification" )
gnv_appeondb.of_commitqueue( )
//------End Modified -----------------------------------



ls_customscreen = {'custom_date1','custom_date2','custom_date3','custom_date4','custom_date5','custom_date6','custom_date7','custom_date8','custom_date9','custom_date10','custom_date11','custom_date12','custom_date13','custom_date14','custom_date15'}
inv_contract_details.of_set_alarm_flag( dw_1 , 'ctx_custom', ls_customscreen, il_ctx_id,0,0,0)


ib_Update = false
Return 1
end event

event resize;call super::resize;dw_1.y = 15				//Added By Mark Lee 01/31/2013
end event

event clicked;call super::clicked;//Added By Ken.Guo 2017-05-09. Workaround APB bug:  close the drop down list after lost focus.
String ls_multi_select, ls_dwoname

ls_dwoname = dwo.name
ls_multi_select = gnv_data.of_getitem( 'multi_select_fields', 'object_format', 'view_id = ' + String(dw_1.il_viewid) + ' and screen_id = ' + String(dw_1.il_screenid) + ' and object_name = "' +ls_dwoname+ '"' + ' and object_type = "multi-select"' )
If ls_multi_select = 'N' or isnull(ls_multi_select)  or ls_multi_select = '' Then	
	If  isvalid(dw_1.iuo_select) Then
		If dw_1.iuo_select.visible Then
			dw_1.iuo_select.dw_select.event losefocus( )
		End If
	End If
End If
end event

