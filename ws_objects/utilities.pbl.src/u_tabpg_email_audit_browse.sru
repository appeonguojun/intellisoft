$PBExportHeader$u_tabpg_email_audit_browse.sru
forward
global type u_tabpg_email_audit_browse from u_tabpg
end type
type st_splitbar from u_st_splitbar within u_tabpg_email_audit_browse
end type
type dw_search from u_dw within u_tabpg_email_audit_browse
end type
type dw_browse from u_dw within u_tabpg_email_audit_browse
end type
end forward

global type u_tabpg_email_audit_browse from u_tabpg
integer width = 3918
integer height = 2344
event ue_filter ( )
event ue_report ( long al_id )
event ue_export ( )
event ue_report_alarm ( string as_where )
st_splitbar st_splitbar
dw_search dw_search
dw_browse dw_browse
end type
global u_tabpg_email_audit_browse u_tabpg_email_audit_browse

type variables
Boolean ib_retrieved = False
String is_sql_org, is_ext_where

boolean	ib_alarm = False  //added by gavins 20130905 
end variables

forward prototypes
public subroutine of_filter ()
public subroutine of_setalarmfilter (datetime adt_from, datetime adt_to, string as_userid, string as_computeinfo)
end prototypes

event ue_filter();
dw_browse.SetRedraw(False)

//Filter Data
of_filter()

dw_browse.title = 'Email Browse (' + String(dw_browse.RowCount()) + ')'
dw_browse.SetRedraw(True)
Return 
end event

event ue_report(long al_id);String ls_where

//Reset UI //modified by gavins 20130905
//dw_search.hide( )
//dw_browse.Move(0,0)
//dw_browse.Height = Height - 20
//st_splitbar.visible = false
//Build SQL
ls_where = ' Where 1 = 1 '
ls_where += " And em_mail_audit.user_id = '" + gs_user_id + "'"
If Not isnull(al_id) Then
	ls_where += " And em_mail_audit.id > " + String(al_id ) + " " 
End If

//Retrieve Data
dw_browse.SetRedraw(False)
dw_browse.SetSQLSelect(is_sql_org + ls_where)
dw_browse.Settransobject(SQLCA)
If dw_browse.Retrieve() = -1 Then
	Messagebox('Error','Failed to retrieve the data. Please call support.~r~n~r~n' + is_sql_org+ls_where)
End If
dw_browse.title = 'Email Browse (' + String(dw_browse.RowCount()) + ')'
dw_browse.SetRedraw(True)

Return 
end event

event ue_export();gf_load_dir_path() 
String ls_file,ls_null
Setnull(ls_null)
ls_file = ''

If dw_browse.SaveAs(ls_file,Excel5!,True) = 1 Then
	If FileExists(ls_file) Then
		ShellExecuteA(Handle(This),'open',ls_file,ls_null,ls_null,4)
	End If
Else
	//Messagebox('Error','Failed to export data.')
End If

gf_save_dir_path(' ') 
end event

event ue_report_alarm(string as_where);String ls_where

//Reset UI //modified by gavins 20130905
dw_search.hide( )
dw_browse.Move(0,0)
dw_browse.Height = Height - 20
st_splitbar.visible = false

//Retrieve Data
dw_browse.SetRedraw(False)
dw_browse.SetSQLSelect(is_sql_org + as_where)
dw_browse.Settransobject(SQLCA)
If dw_browse.Retrieve() = -1 Then
	Messagebox('Error','Failed to retrieve the data. Please call support.~r~n~r~n' + is_sql_org+ls_where)
End If
dw_browse.title = 'Email Browse (' + String(dw_browse.RowCount()) + ')'
dw_browse.SetRedraw(True)

Return
end event

public subroutine of_filter ();String ls_where
String ls_user_id, ls_mail_from,ls_mail_to,ls_errtext,ls_compute_info
String ls_subject,ls_fieldname, ls_company,ls_notes,ls_ctx_id,ls_email_type
Datetime ldt_datefrom,ldt_dateto
Integer li_sendresult
Long li_wf_id,ll_email_id

dw_search.Accepttext( )
ls_user_id = dw_search.GetItemString(1,'user_id')
ls_mail_from = dw_search.GetItemString(1,'mail_from')
ls_mail_to = dw_search.GetItemString(1,'mail_to')
ldt_datefrom = dw_search.GetItemDatetime(1,'date_from')
ldt_dateto = dw_search.GetItemDatetime(1,'date_to')
li_sendresult = dw_search.GetItemNumber(1,'send_result')
ls_errtext = dw_search.GetItemString(1,'error_text')
ls_subject = dw_search.GetItemString(1,'mail_subject')
li_wf_id = dw_search.GetItemNumber(1,'wf_id')
ls_fieldname = dw_search.GetItemString(1,'field_name')
ls_ctx_id = dw_search.GetItemString(1,'ctx_id_list')
ls_company = dw_search.GetItemString(1,'company_name')
ls_notes = dw_search.GetItemString(1,'notes')
ls_email_type = dw_search.GetItemString(1,'alarm_type')
ll_email_id = dw_search.GetItemNumber(1,'mail_template_id')
ls_compute_info = dw_search.GetItemString(1,'compute_info') 


ls_where = ' Where 1 = 1 '
If ls_user_id <> '' and Not isnull(ls_user_id) Then
	ls_where += " And em_mail_audit.user_id = '" + ls_user_id + "'"
End If

If ls_mail_from <> '' and Not isnull(ls_mail_from) Then
	ls_where += " And CharIndex('" + ls_mail_from + "', em_mail_audit.mail_from) > 0 "
End If

If ls_mail_to <> '' and Not isnull(ls_mail_to) Then
	ls_where += " And CharIndex('" + ls_mail_to + "', em_mail_audit.mail_to) > 0 "
End If

If Not isnull(li_sendresult) Then
	ls_where += " And em_mail_audit.send_result = " + String(li_sendresult ) + " " 
End If

If ls_errtext <> '' and Not isnull(ls_errtext) Then
	ls_where += " And CharIndex('" + ls_errtext + "', em_mail_audit.error_text) > 0 "
End If

If ls_subject <> '' and Not isnull(ls_subject) Then
	ls_where += " And CharIndex('" + ls_subject + "', em_mail_audit.mail_subject) > 0 "
End If

If Not isnull(li_wf_id) Then
	ls_where += " And em_mail_audit.wf_id = " + String(li_wf_id ) + " " 
End If

If ls_fieldname <> '' and Not isnull(ls_fieldname) Then
	ls_where += " And CharIndex('" + ls_fieldname + "', em_mail_audit.field_name) > 0 "
End If

If ls_ctx_id <> '' and Not isnull(ls_ctx_id) Then
	ls_where += " And CharIndex('" + ls_ctx_id + "', em_mail_audit.ctx_id_list) > 0 "
End If

If ls_company <> '' and Not isnull(ls_company) Then
	ls_where += " And (CharIndex('" + ls_company + "', app_facility.facility_name) > 0 or  " + " CharIndex('" + ls_company + "', em_mail_audit.notes) > 0 )"
End If

If ls_notes <> '' and Not isnull(ls_notes) Then
	ls_where += " And CharIndex('" + ls_notes + "', em_mail_audit.notes) > 0 "
End If

//modified by gavins 20130905
If ib_alarm Then
	If Not isnull(ldt_datefrom) Then
		ls_where += " And mail_date >= Convert(Datetime,'" + String(ldt_datefrom)+":000' ) " 
	End If
	
	If Not isnull(ldt_dateto) Then
		ls_where += " And mail_date <= Convert(Datetime,'" + String(ldt_dateto,"yyyy-mm-dd hh:mm:59" ) + ":999' ) " 
	End If
Else

	If Not isnull(ldt_datefrom) Then
		ls_where += " And mail_date >= Convert(Datetime,'" + String(ldt_datefrom,"yyyy-mm-dd") + " 00:00:00') " 
	End If
	
	If Not isnull(ldt_dateto) Then
		ls_where += " And mail_date <= Convert(Datetime,'" + String(ldt_dateto,"yyyy-mm-dd") + " 23:59:59') " 
	End If
End If

If ls_email_type <> '' and Not isnull(ls_email_type) Then
	ls_where += " And CharIndex('" + ls_email_type + "', em_mail_audit.alarm_type) > 0 "
End If

If Not isnull(ll_email_id) Then
	ls_where += " And em_mail_audit.mail_template_id = " + String(ll_email_id ) + " " 
End If

If ls_compute_info <> '' and Not isnull(ls_compute_info) Then
	ls_where += " And CharIndex('" + ls_compute_info + "', em_mail_audit.compute_info) > 0 "
End If

If Not isnull(ldt_datefrom) and Not isnull(ldt_dateto) and ldt_datefrom > ldt_dateto Then
	Messagebox('Search','Date To can not be less than Date From.',Exclamation!)
	Return
End If

dw_browse.SetSQLSelect(is_sql_org + ls_where + is_ext_where )

dw_browse.Settransobject(SQLCA)
If dw_browse.Retrieve() = -1 Then
	Messagebox('Error','Failed to retrieve the data. Please call support.~r~n~r~n' + is_sql_org+ls_where)
End If


Return
end subroutine

public subroutine of_setalarmfilter (datetime adt_from, datetime adt_to, string as_userid, string as_computeinfo);if( dw_search.getrow( ) > 0 ) then
	dw_search.setitem( dw_search.getrow( ), 'date_from' ,  adt_from  )
	dw_search.setitem( dw_search.getrow( ), 'date_to' ,  adt_to )
	dw_search.setitem( dw_search.getrow( ), 'user_id' , as_userid )
	dw_search.setitem( dw_search.getrow( ), 'compute_info' , as_computeinfo )	
	ib_alarm = true
	Event ue_filter()
	ib_alarm = false
end if
end subroutine

on u_tabpg_email_audit_browse.create
int iCurrent
call super::create
this.st_splitbar=create st_splitbar
this.dw_search=create dw_search
this.dw_browse=create dw_browse
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_splitbar
this.Control[iCurrent+2]=this.dw_search
this.Control[iCurrent+3]=this.dw_browse
end on

on u_tabpg_email_audit_browse.destroy
call super::destroy
destroy(this.st_splitbar)
destroy(this.dw_search)
destroy(this.dw_browse)
end on

type st_splitbar from u_st_splitbar within u_tabpg_email_audit_browse
integer y = 776
integer width = 3931
integer height = 8
end type

event constructor;call super::constructor;this.of_register( dw_search, 3)
this.of_register( dw_browse, 4)
end event

type dw_search from u_dw within u_tabpg_email_audit_browse
integer width = 3909
integer height = 776
integer taborder = 10
boolean titlebar = true
string title = "Search Criteria"
string dataobject = "d_email_audit_search"
boolean vscrollbar = false
boolean livescroll = false
end type

event constructor;This.InsertRow(0)
This.of_setupdateable(False)
This.Post of_setdropdowncalendar(True)

end event

event buttonclicked;call super::buttonclicked;Choose Case dwo.name 
	Case 'b_clear'
		dw_search.Reset()
		dw_search.InsertRow(0)
		//is_ext_where = ''
	Case 'b_search'
		Parent.Dynamic Event ue_filter()
End Choose

end event

event ue_key;call super::ue_key;If Key = Keyenter! Then
	Parent.Dynamic Event ue_filter()
End If
end event

event other;call super::other;If Message.WordParm = 61458 Then 
		Message.Processed = True
		Message.ReturnValue = 0 
End If
end event

type dw_browse from u_dw within u_tabpg_email_audit_browse
integer y = 784
integer width = 3909
integer height = 1552
integer taborder = 10
boolean titlebar = true
string title = "Email Browse"
string dataobject = "d_email_audit_browse"
boolean hscrollbar = true
boolean livescroll = false
end type

event constructor;call super::constructor;This.of_setupdateable(False)
This.of_setrowselect(True)
This.Modify("Datawindow.readonly = Yes")

this.of_SetSort(true)
This.inv_sort.of_SetColumnHeader(true)

This.SetTransObject(SQLCA)
is_sql_org = This.GetSQLSelect()


end event

event doubleclicked;call super::doubleclicked;iw_parent.Dynamic Event ue_show_detail()
end event

event other;call super::other;If Message.WordParm = 61458 Then 
		Message.Processed = True
		Message.ReturnValue = 0 
End If
end event

