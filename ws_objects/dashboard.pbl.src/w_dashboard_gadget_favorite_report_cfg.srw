$PBExportHeader$w_dashboard_gadget_favorite_report_cfg.srw
forward
global type w_dashboard_gadget_favorite_report_cfg from w_dashboard_gadget_favorite_config_base
end type
end forward

global type w_dashboard_gadget_favorite_report_cfg from w_dashboard_gadget_favorite_config_base
end type
global w_dashboard_gadget_favorite_report_cfg w_dashboard_gadget_favorite_report_cfg

event open;call super::open;of_register('report_id')
end event

on w_dashboard_gadget_favorite_report_cfg.create
call super::create
end on

on w_dashboard_gadget_favorite_report_cfg.destroy
call super::destroy
end on

event ue_ok;//Override Ancestor Script
Integer i,li_cnt,li_ret
Integer li_selected_org,li_selected_new
Long ll_data_id
String ls_type

//If no changes
If dw_data.Modifiedcount( ) = 0 Then Return 1

li_cnt = dw_data.RowCount()
If li_cnt = 0 Then Return 1

For i = 1 to li_cnt
	li_selected_org = dw_data.GetItemNumber(i,'selected',Primary!,True)
	li_selected_new = dw_data.GetItemNumber(i,'selected',Primary!,False)
	If li_selected_org = li_selected_new Then Continue
	ll_data_id = dw_data.GetItemNumber(i,is_col_name)
	ls_type = dw_data.GetItemString(i,'report_type')
	If li_selected_new = 1 Then
		iuo_gadget.Dynamic Event ue_add_2(ls_type,ll_data_id)
	Else
		iuo_gadget.Dynamic Event ue_delete_2(ls_type,ll_data_id)		
	End If
Next

li_ret = iuo_gadget.Dynamic Event ue_save()
iuo_gadget.iuo_tabpge_gadget.Event ue_retrieve_same_gadget(iuo_gadget.classname())
iuo_gadget.iuo_tabpge_gadget.of_refresh_ui()

Return li_ret
end event

event closequery;//Override Ancestor Script
Return 0 //ALLOW_CLOSE
end event

type st_2 from w_dashboard_gadget_favorite_config_base`st_2 within w_dashboard_gadget_favorite_report_cfg
end type

type st_1 from w_dashboard_gadget_favorite_config_base`st_1 within w_dashboard_gadget_favorite_report_cfg
end type

type ddlb_rows_number from w_dashboard_gadget_favorite_config_base`ddlb_rows_number within w_dashboard_gadget_favorite_report_cfg
end type

type cb_cancel from w_dashboard_gadget_favorite_config_base`cb_cancel within w_dashboard_gadget_favorite_report_cfg
end type

type cb_ok from w_dashboard_gadget_favorite_config_base`cb_ok within w_dashboard_gadget_favorite_report_cfg
end type

type dw_data from w_dashboard_gadget_favorite_config_base`dw_data within w_dashboard_gadget_favorite_report_cfg
string dataobject = "d_dashb_gadget_favorite_report_select"
end type

type gb_1 from w_dashboard_gadget_favorite_config_base`gb_1 within w_dashboard_gadget_favorite_report_cfg
end type

