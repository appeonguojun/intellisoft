$PBExportHeader$w_email_audit.srw
forward
global type w_email_audit from w_sheet
end type
type st_servermsg from statictext within w_email_audit
end type
type cb_saveas from commandbutton within w_email_audit
end type
type cb_close from commandbutton within w_email_audit
end type
type tab_1 from tab within w_email_audit
end type
type tabpage_alarmlog from userobject within tab_1
end type
type dw_alarm from u_dw within tabpage_alarmlog
end type
type tabpage_alarmlog from userobject within tab_1
dw_alarm dw_alarm
end type
type tabpage_browse from u_tabpg_email_audit_browse within tab_1
end type
type tabpage_browse from u_tabpg_email_audit_browse within tab_1
end type
type tabpage_detail from u_tabpg_email_audit_detail within tab_1
end type
type tabpage_detail from u_tabpg_email_audit_detail within tab_1
end type
type tab_1 from tab within w_email_audit
tabpage_alarmlog tabpage_alarmlog
tabpage_browse tabpage_browse
tabpage_detail tabpage_detail
end type
end forward

global type w_email_audit from w_sheet
integer x = 214
integer y = 221
integer width = 3959
integer height = 2584
string title = "Alarm Log And Emails Log"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
event ue_show_detail ( )
st_servermsg st_servermsg
cb_saveas cb_saveas
cb_close cb_close
tab_1 tab_1
end type
global w_email_audit w_email_audit

type variables
str_pass istr_pass
Boolean ib_report_mode = False, ib_alarm_report = False
n_cst_webapi inv_webapi
string is_accesstoken

end variables

event ue_show_detail();
Tab_1.Selecttab(3)

end event

on w_email_audit.create
int iCurrent
call super::create
this.st_servermsg=create st_servermsg
this.cb_saveas=create cb_saveas
this.cb_close=create cb_close
this.tab_1=create tab_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_servermsg
this.Control[iCurrent+2]=this.cb_saveas
this.Control[iCurrent+3]=this.cb_close
this.Control[iCurrent+4]=this.tab_1
end on

on w_email_audit.destroy
call super::destroy
destroy(this.st_servermsg)
destroy(this.cb_saveas)
destroy(this.cb_close)
destroy(this.tab_1)
end on

event pfc_preopen;call super::pfc_preopen;integer i

If isvalid(Message.powerobjectparm) Then
	istr_pass = Message.powerobjectparm
	
	If istr_pass.s_string <> '' Then //Added By Ken.Guo 12/26/2012. Support alarm report.
		ib_alarm_report = True
	Else
		ib_report_mode = True
	End If
End If

this.of_SetResize(true)
this.inv_resize.of_setorigsize(3950, 2512)
for i =  1 to UpperBound(this.Control)
	this.inv_resize.of_Register(this.Control[i], this.inv_resize.scale)
next

tab_1.tabpage_browse.dw_browse.ShareData(tab_1.tabpage_detail.dw_1 )



end event

event open;call super::open;DatawindowChild ldwc_email_search,ldwc_email_browse,ldwc_email_detail
DatawindowChild ldwc_wf_search,ldwc_wf_browse,ldwc_wf_detail
DatawindowChild ldwc_email_type,ldwc_company,ldwc_user_id,ldwc_pc_info

Tab_1.tabpage_browse.dw_search.GetChild('compute_info',ldwc_pc_info)
Tab_1.tabpage_browse.dw_search.GetChild('user_id',ldwc_user_id)

Tab_1.tabpage_browse.dw_search.GetChild('mail_template_id',ldwc_email_search)
Tab_1.tabpage_browse.dw_browse.GetChild('mail_template_id',ldwc_email_browse)
Tab_1.tabpage_detail.dw_1.GetChild('mail_template_id',ldwc_email_detail)

Tab_1.tabpage_browse.dw_search.GetChild('wf_id',ldwc_wf_search)
Tab_1.tabpage_browse.dw_browse.GetChild('wf_id',ldwc_wf_browse)
Tab_1.tabpage_detail.dw_1.GetChild('wf_id',ldwc_wf_detail)

Tab_1.tabpage_browse.dw_search.GetChild('alarm_type',ldwc_email_type)
Tab_1.tabpage_browse.dw_search.GetChild('company_name',ldwc_company)



ldwc_email_search.SetTransObject(SQLCA)
ldwc_email_browse.SetTransObject(SQLCA)
ldwc_email_detail.SetTransObject(SQLCA)
ldwc_wf_search.SetTransObject(SQLCA)
ldwc_wf_browse.SetTransObject(SQLCA)
ldwc_wf_detail.SetTransObject(SQLCA)
ldwc_email_type.SetTransObject(SQLCA)
ldwc_company.SetTransObject(SQLCA)
ldwc_user_id.SetTransObject(SQLCA)
ldwc_pc_info.SetTransObject(SQLCA)

gnv_appeondb.of_startqueue( )
	ldwc_email_search.Retrieve()
	ldwc_wf_search.Retrieve()
	ldwc_email_type.Retrieve()
	ldwc_company.Retrieve('all')
	ldwc_user_id.Retrieve()
	ldwc_pc_info.Retrieve()
gnv_appeondb.of_commitqueue( )

ldwc_email_search.ShareData(ldwc_email_browse)
ldwc_email_search.ShareData(ldwc_email_detail)
ldwc_wf_search.ShareData(ldwc_wf_browse)
ldwc_wf_search.ShareData(ldwc_wf_detail)

If ib_report_mode Then
	Tab_1.tabpage_browse.Dynamic Event ue_report(istr_pass.l_facility_id)
End If

//Added By Ken.Guo 12/26/2012
If ib_alarm_report Then
	Tab_1.tabpage_browse.Dynamic Event ue_report_alarm(istr_pass.s_string )
	This.Title = istr_pass.s_string_array[1] 
End IF

//Added by Jimmy Lee 09/03/2013
//If gnv_data.of_getitem( 'icred_settings', 'use_web_email', False) = '1' Then

If Not ib_alarm_report  Then
	tab_1.tabpage_alarmlog.show( )
	If not ( isnull( inv_webapi.is_webapi_url ) or trim( inv_webapi.is_webapi_url ) = '' ) and gnv_data.of_getitem( 'icred_settings', 'use_web_email', False) = '1' then 
		
		//Added By Mark Lee 09/13/2013
		if isnull(gs_accesstoken) or trim(gs_accesstoken) = '' then gs_accesstoken = inv_webapi.of_convert_json_token( )
		if len(gs_accesstoken) > 0 then
			is_accesstoken = gs_accesstoken
			//inv_webapi.post of_alarmemail(ls_accesstoken)
			st_servermsg.visible = true
			trigger event timer( )
			timer(15)
		else
		//		st_servermsg.visible = false
			timer(0)
		end if
	Else
		st_servermsg.visible = true
		If  tab_1.tabpage_alarmlog.dw_alarm.Retrieve( )> 0 Then
			st_servermsg.text  = "Last Alarm: Start Time: " + string( tab_1.tabpage_alarmlog.dw_alarm.GetItemDateTime( 1, 'begintime' ), 'mm/dd/yyyy hh:mm:ss' ) + &
										"~rLast Alarm: Finish Time: " + string( tab_1.tabpage_alarmlog.dw_alarm.GetItemDateTime( 1, 'endtime' ), 'mm/dd/yyyy hh:mm:ss' ) 			
		 end If
	End If
	tab_1.post selecttab( 1 )
End If



end event

event timer;call super::timer;int li_rtn = -1
string ls_total, ls_success , ls_failure , ls_error, ls_running

If gnv_data.of_getitem( 'icred_settings', 'use_web_email', False) = '1' Then
	li_rtn = inv_webapi.of_getalarmemailstate(ref ls_total, ref ls_success , ref ls_failure ,  ref ls_error, ref ls_running)
End If

//Modify by gavins 20130905
if ls_running = "1"  then
	if(ls_success="" or isnull( ls_success ) ) then ls_success = "0"
	if(ls_failure="" or isnull( ls_failure ) ) then ls_failure = "0"
	if(ls_total="" or isnull( ls_total ) ) then ls_total = "0"	
	st_servermsg.text = "Alarm sending in progress: success: "+ls_success+", failed: " + ls_failure+ ", total: " + ls_total 
	if len(ls_error) > 0 then
		st_servermsg.text = st_servermsg.text  + ", Error:" + ls_error 
	end if
Else
	If tab_1.tabpage_alarmlog.dw_alarm.retrieve( )> 0 Then
		st_servermsg.text  = "Last Alarm: Start Time: " + string( tab_1.tabpage_alarmlog.dw_alarm.GetItemDateTime( 1, 'begintime' ), 'mm/dd/yyyy hh:mm:ss' ) + &
									"~rLast Alarm: Finish Time: " + string( tab_1.tabpage_alarmlog.dw_alarm.GetItemDateTime( 1, 'endtime' ), 'mm/dd/yyyy hh:mm:ss' ) 			
		
	End If
	
	timer(60)
End If

end event

type st_servermsg from statictext within w_email_audit
boolean visible = false
integer x = 1687
integer y = 2384
integer width = 1513
integer height = 104
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 255
long backcolor = 67108864
boolean focusrectangle = false
end type

type cb_saveas from commandbutton within w_email_audit
integer x = 3232
integer y = 2380
integer width = 343
integer height = 92
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Export..."
end type

event clicked;//tab_1.tabpage_browse.dynamic Event ue_export()

//Modified By Ken.Guo 2011-05-24. workaround PB's bug
m_npdb_options NewMenu 
NewMenu = CREATE m_npdb_options
NewMenu.of_setparent(tab_1.tabpage_browse.dw_browse)
NewMenu.m_options.m_mailall.visible = false
NewMenu.m_options.m_printall.visible = false
NewMenu.m_options.m_printcurrent.text = 'Print'
NewMenu.m_options.m_mailcurrent.visible = False
NewMenu.m_options.PopMenu(Parent.pointerx(),Parent.pointerY())
end event

type cb_close from commandbutton within w_email_audit
integer x = 3584
integer y = 2380
integer width = 343
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Close"
end type

event clicked;Close(Parent)
end event

type tab_1 from tab within w_email_audit
integer width = 3945
integer height = 2468
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
tabposition tabposition = tabsonbottom!
alignment alignment = center!
integer selectedtab = 2
tabpage_alarmlog tabpage_alarmlog
tabpage_browse tabpage_browse
tabpage_detail tabpage_detail
end type

on tab_1.create
this.tabpage_alarmlog=create tabpage_alarmlog
this.tabpage_browse=create tabpage_browse
this.tabpage_detail=create tabpage_detail
this.Control[]={this.tabpage_alarmlog,&
this.tabpage_browse,&
this.tabpage_detail}
end on

on tab_1.destroy
destroy(this.tabpage_alarmlog)
destroy(this.tabpage_browse)
destroy(this.tabpage_detail)
end on

event selectionchanged;long ll_row



If newindex = 2 Then

	ll_row = tabpage_detail.dw_1.GetRow()
	tabpage_browse.dw_browse.ScrollToRow(ll_row)
	tabpage_browse.dw_browse.SetRow(ll_row)	
	tabpage_detail.dw_1.SetFocus()
ElseIf newindex = 3 Then
	ll_row = tabpage_browse.dw_browse.GetRow()
	tabpage_detail.dw_1.ScrollToRow(ll_row)
	tabpage_detail.dw_1.SetRow(ll_row)	
	tabpage_browse.dw_browse.SetFocus()
ElseIf newindex = 1 then
	tab_1.tabpage_alarmlog.dw_alarm.retrieve( )
End If


end event

type tabpage_alarmlog from userobject within tab_1
boolean visible = false
integer x = 18
integer y = 16
integer width = 3909
integer height = 2340
long backcolor = 79741120
string text = "Alarm Log"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "DosEdit!"
long picturemaskcolor = 536870912
dw_alarm dw_alarm
end type

on tabpage_alarmlog.create
this.dw_alarm=create dw_alarm
this.Control[]={this.dw_alarm}
end on

on tabpage_alarmlog.destroy
destroy(this.dw_alarm)
end on

type dw_alarm from u_dw within tabpage_alarmlog
integer y = 8
integer width = 3895
integer height = 2308
integer taborder = 20
string title = "none"
string dataobject = "d_email_audit_alarmlog"
end type

event constructor;SetTransObject( SQLCA )
This.of_setrowselect(True)
end event

event doubleclicked;call super::doubleclicked;if( row = 0 ) then return

if dw_alarm.GetItemNumber( row, 'total' ) = 0 then return

string ls_computinfo

ls_computinfo = dw_alarm.getitemstring( row, 'category' )
if ls_computinfo = 'pb' then
	ls_computinfo = ""
else
	ls_computinfo = "server" 
end if
tab_1.selecttab( 2 )
tab_1.tabpage_browse.of_setalarmfilter( dw_alarm.getitemdatetime( row, 'begintime' ), dw_alarm.getitemdatetime( row, 'endtime' ) , &
	dw_alarm.getitemstring( row, 'sender' ), ls_computinfo )

end event

type tabpage_browse from u_tabpg_email_audit_browse within tab_1
string tag = "Browse"
integer x = 18
integer y = 16
integer width = 3909
integer height = 2340
string text = "Email Log Browse"
string picturename = "custom065!"
end type

type tabpage_detail from u_tabpg_email_audit_detail within tab_1
string tag = "Detail"
integer x = 18
integer y = 16
integer width = 3909
integer height = 2340
string text = "Email Log Detail "
string picturename = "custom100!"
boolean ib_isupdateable = false
end type

