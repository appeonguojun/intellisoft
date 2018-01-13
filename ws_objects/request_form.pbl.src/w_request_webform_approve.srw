$PBExportHeader$w_request_webform_approve.srw
forward
global type w_request_webform_approve from w_sheet
end type
type tab_1 from u_tab_request_webform within w_request_webform_approve
end type
type tab_1 from u_tab_request_webform within w_request_webform_approve
end type
end forward

global type w_request_webform_approve from w_sheet
string tag = "Request Webform Approve"
integer x = 214
integer y = 221
integer width = 4142
integer height = 2504
string title = "Request Webform Approve"
windowstate windowstate = maximized!
boolean center = true
tab_1 tab_1
end type
global w_request_webform_approve w_request_webform_approve

type variables
long il_winview_just_open //Added By Jay Chen 06-09-2014
boolean ib_tab_change = false //Added By Jay Chen 06-10-2014
end variables

on w_request_webform_approve.create
int iCurrent
call super::create
this.tab_1=create tab_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.tab_1
end on

on w_request_webform_approve.destroy
call super::destroy
destroy(this.tab_1)
end on

event pfc_preopen;call super::pfc_preopen;long ll_i
string ls_scale
//Added By Jay Chen 06-09-2014
long ll_Dynamic,ll_SearchTab_View_id
Boolean	lb_DefaultViewSearch

This.of_SetResize(True)
this.inv_resize.of_setminsize( 800, 600 )
This.inv_resize.of_SetOrigSize (This.workspacewidth(),This.workspaceheight())
ls_scale = this.inv_resize.scale

For ll_i =  1 To upperbound(This.CONTrol)
   This.inv_resize.of_Register (This.CONTrol[ll_i],ls_scale)
Next

//Added By Jay Chen 06-09-2014
//SELECT Dynamic_Search_Tab
//INTO :ll_Dynamic
//FROM security_users 
//WHERE user_id = :gs_user_id;
//	
//if ll_Dynamic = 0  then
//	lb_DefaultViewSearch = false
//else
//	lb_DefaultViewSearch = true
//end if
	
//if lb_DefaultViewSearch then
//	ll_SearchTab_View_id = long(gnv_data.of_getitem('security_users','contract_default_view',"upper(user_id)='" + Upper(gs_user_id) + "'"))
//end if
ll_SearchTab_View_id = long(gnv_data.of_getitem('security_users','contract_default_view',"upper(user_id)='" + Upper(gs_user_id) + "'"))
if IsNull(ll_SearchTab_View_id) or ll_SearchTab_View_id = 0 then ll_SearchTab_View_id = 1001
gl_SearchTab_otherwin_View = ll_SearchTab_View_id
	

tab_1.triggerevent("ue_show_constructor")








end event

event close;call super::close;w_mdi.ChangeMenu(m_pfe_cst_mdi_menu)
w_mdi.of_menu_security( w_mdi.MenuName )

//Added By Jay Chen 06-11-2014
if isvalid(m_pfe_cst_mdi_menu) then
	gnv_app.of_modify_menu_attr( m_pfe_cst_mdi_menu.m_system.m_painters.m_contractdatascreenpainter,'ToolbarItemVisible', false)
end if
end event

event activate;call super::activate;long ll_handle

If w_mdi.menuname <> 'm_pfe_cst_mdi_menu' Then 
	ll_handle = handle(w_mdi)
	w_mdi.ChangeMenu( m_pfe_cst_mdi_menu )
	w_mdi.SetToolbarPos ( 2, 1, 200, False )
	w_mdi.of_menu_security( w_mdi.MenuName )
	gnv_appeondll.of_settoolbarpos(ll_handle)
End If

//Added By Jay Chen 06-09-2014
//if isvalid(m_pfe_cst_mdi_menu) then
//	gnv_app.of_modify_menu_attr( m_pfe_cst_mdi_menu.m_system.m_painters.m_contractdatascreenpainter,'ToolbarItemVisible', true)
//else
//	gnv_app.of_modify_menu_attr( m_pfe_cst_mdi_menu.m_system.m_painters.m_contractdatascreenpainter,'ToolbarItemVisible', false)
//end if
end event

event pfc_postopen;call super::pfc_postopen;//Added By Jay Chen 06-10-2014
if ib_tab_change then
	tab_1.selectedtab = 2
	ib_tab_change = false
end if


end event

type tab_1 from u_tab_request_webform within w_request_webform_approve
integer y = 4
integer width = 4110
integer height = 2388
integer taborder = 11
end type

