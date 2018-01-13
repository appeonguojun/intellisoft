$PBExportHeader$w_audit_painter.srw
forward
global type w_audit_painter from w_sheet
end type
type st_info from statictext within w_audit_painter
end type
type cb_label from commandbutton within w_audit_painter
end type
type cb_filter from u_cb within w_audit_painter
end type
type cb_export from u_cb within w_audit_painter
end type
type cb_print from u_cb within w_audit_painter
end type
type dw_filter from u_dw within w_audit_painter
end type
type dw_audit from u_dw within w_audit_painter
end type
type gb_1 from groupbox within w_audit_painter
end type
end forward

global type w_audit_painter from w_sheet
integer width = 3918
integer height = 1960
string title = "Audit Information For Contract"
windowstate windowstate = maximized!
st_info st_info
cb_label cb_label
cb_filter cb_filter
cb_export cb_export
cb_print cb_print
dw_filter dw_filter
dw_audit dw_audit
gb_1 gb_1
end type
global w_audit_painter w_audit_painter

type variables
//Added By Ken.Guo 2017-04-12
String is_status  //running, end,
String IS_Running = 'running', IS_End = 'end'

end variables

forward prototypes
public function integer wf_run_filter ()
end prototypes

public function integer wf_run_filter ();//Run Filter Audit -- Add by Jervis 03.31.2011

String ls_sql
String ls_user
String ls_from_date
String ls_to_date
Integer li_screen_id
string ls_original_sql
long ll_ctx_id, ll_pos
string ls_edit

dw_audit.dataobject = ''
dw_audit.dataobject =  'd_view_audit_ctx'

ls_original_sql = dw_audit.Object.DataWindow.Table.Select

//added by gavins 20120815
ll_pos = Pos( ls_original_sql, 'sys_fields.field_name' )
If ll_Pos > 0 Then
	ls_original_sql = Replace( ls_original_sql, ll_Pos, Len(  'sys_fields.field_name'  ) , "isnull( sys_audit.tfield_name, sys_fields.field_name) field_name" )
End If
ll_pos = Pos( ls_original_sql, 'sys_fields.field_name_allias' )
If ll_Pos > 0 Then
	ls_original_sql = Replace( ls_original_sql, ll_Pos, Len(  'sys_fields.field_name_allias'  ) , "isnull( sys_audit.tfield_name_allias, sys_fields.field_name_allias) field_name_allias" )
End If



dw_filter.AcceptText()
ls_user = dw_filter.GetItemString( 1, "user_id" )

IF ls_user <> "All"  and not isnull(ls_user) THEN //Modified By Ken.Guo 2017-04-10. workaround web bug when it is null value.
	ls_sql = ls_sql + " AND sys_audit.user_id = '" + ls_user + "'"
END IF

li_screen_id = dw_filter.GetItemNumber( 1, "screen_id" )

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> UM-01
//$<modify> 04.22.2006 By: LeiWei
//$<reason> The way Appeon deals with the NULL value on the Web is different from that in PowerBuilder.
//$<modification> Modify the condition to make sure the applciation works correctly on the Web.
//IF li_screen_id <> 0 THEN
IF li_screen_id <> 0 AND NOT ISNULL(li_screen_id) THEN
//---------------------------- APPEON END ----------------------------
	ls_sql = ls_sql + " AND sys_audit.table_id = " + String( li_screen_id )
END IF



ls_from_date = String(dw_filter.GetItemDate( 1, "from_date" ), 'yyyy-mm-dd' ) 
ls_to_date =  String(dw_filter.GetItemDate( 1, "to_date" ), 'yyyy-mm-dd' ) 

ll_ctx_id = dw_filter.GetItemNumber( 1,"contract_id")
IF  not IsNull( ll_ctx_id ) and ll_ctx_id <> 0 THEN
	ls_sql = ls_sql + " AND sys_audit.prac_id= " + String( ll_ctx_id )
END IF


IF ls_from_date <> "" AND NOT IsNull( ls_from_date ) AND ls_from_date <> "00/00/0000" THEN
	IF ls_to_date = "" OR IsNull( ls_to_date ) OR ls_to_date = "00/00/0000" THEN		
		MessageBox("Select Error", "You must select a Thru Date" )
		dw_filter.SetColumn( "to_date" )
		Return -1
	END IF
END IF

IF ls_to_date <> "" AND NOT IsNull( ls_to_date ) AND ls_to_date <> "00/00/0000" THEN
	IF ls_from_date = "" OR IsNull( ls_from_date ) OR ls_from_date = "00/00/0000" THEN		
		MessageBox("Select Error", "You must select a From Date" )
   	dw_filter.SetColumn( "from_date" )
		Return -1
	END IF
END IF

IF ls_from_date <> "" AND NOT IsNull( ls_from_date ) AND ls_from_date <> "00/00/0000" THEN
	IF ls_to_date <> "" AND NOT IsNull( ls_to_date ) AND ls_to_date <> "00/00/0000" THEN	
		ls_from_date = "'" + ls_from_date + "'"
		ls_to_date = "'" + ls_to_date + "'"
		ls_sql = ls_sql + " AND convert(datetime,  convert( varchar, sys_audit.date_time_modified,102) )  >= " + ls_from_date +&
								" AND convert(datetime, convert( varchar, sys_audit.date_time_modified,102) )  <= " + ls_to_date 

	END IF
END IF

ls_edit = dw_filter.GetItemString( 1, 'edit_type')
if ls_edit <> "" and not isnull(ls_edit) and ls_edit <> 'A' then
	ls_sql = ls_sql + "and audit_type = '" + ls_edit + "'"
end if

//Added By Ken.Guo 2017-04-06
Long ll_contract_category, ll_contract_type, ll_contract_status
ll_contract_category = dw_filter.getitemnumber(1, 'contract_category')
If ll_contract_category > 0 Then
	ls_sql = ls_sql + " and ctx_basic_info.category=" + String(ll_contract_category)
End If 
ll_contract_type = dw_filter.getitemnumber(1, 'contract_type')
If ll_contract_type > 0 Then
	ls_sql = ls_sql + " and ctx_basic_info.contract_type=" + String(ll_contract_type)
End If 
ll_contract_status = dw_filter.getitemnumber(1, 'contract_status')
If ll_contract_status > 0 Then
	ls_sql = ls_sql + " and ctx_basic_info.status=" + String(ll_contract_status)
End If 



ls_sql = ls_original_sql + ls_sql

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> UM-02
//$<modify> 04.22.2006 By: LeiWei
//$<reason> SetSQLSelect doest not work correctly against SQL server database on the Web.
//$<modification> Change it to Modify() to make sure the application runs correctly against
//$<modification> both SQL server database and ASA database on the Web.
//dw_audit.SetSQLSelect ( ls_sql )
dw_audit.Modify('DataWindow.Table.Select="'+ls_sql + '"')
//---------------------------- APPEON END ----------------------------
//gnv_debug.of_output(false, 'Audit Painter. run filter. ls_sql = ' + ls_sql)

dw_audit.SetTransObject( SQLCA )

//Added By Ken.Guo 2017-04-07. Task 751
dw_audit.setfilter('')
dw_audit.setsort('date_time_modified desc')

dw_audit.Retrieve()



return 0
end function

on w_audit_painter.create
int iCurrent
call super::create
this.st_info=create st_info
this.cb_label=create cb_label
this.cb_filter=create cb_filter
this.cb_export=create cb_export
this.cb_print=create cb_print
this.dw_filter=create dw_filter
this.dw_audit=create dw_audit
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_info
this.Control[iCurrent+2]=this.cb_label
this.Control[iCurrent+3]=this.cb_filter
this.Control[iCurrent+4]=this.cb_export
this.Control[iCurrent+5]=this.cb_print
this.Control[iCurrent+6]=this.dw_filter
this.Control[iCurrent+7]=this.dw_audit
this.Control[iCurrent+8]=this.gb_1
end on

on w_audit_painter.destroy
call super::destroy
destroy(this.st_info)
destroy(this.cb_label)
destroy(this.cb_filter)
destroy(this.cb_export)
destroy(this.cb_print)
destroy(this.dw_filter)
destroy(this.dw_audit)
destroy(this.gb_1)
end on

event pfc_preopen;call super::pfc_preopen;long ll_i

this.of_SetResize( true)
this.inv_resize.of_setminsize( this.workspacewidth( ) ,this.workspaceheight( ) )
this.inv_resize.of_setorigsize(  this.workspacewidth( ) ,this.workspaceheight( ) )


FOR LL_I =  1 TO UPPERBOUND(this.CONTrol)
   this.inv_resize.of_Register (this.CONTrol[LL_I]  , this.inv_resize.scale	 )
NEXT


 
//Added By Ken.Guo 2017-04-06. add filter column.  //Added By Ken.Guo 2017-04-12 Cut from pfc_postopen(). workaround web bug. 
Datawindowchild ldwc_category, ldwc_type, ldwc_status,ldwc_category2, ldwc_type2, ldwc_status2

dw_filter.getchild( 'contract_category', ldwc_category)
dw_filter.getchild( 'contract_type', ldwc_type)
dw_filter.getchild( 'contract_status', ldwc_status)

ldwc_category.Settransobject(SQLCA)
ldwc_type.Settransobject(SQLCA)
ldwc_status.Settransobject(SQLCA)

gnv_appeondb.of_startqueue( )
	ldwc_category.Retrieve()
	ldwc_type.Retrieve()
	ldwc_status.Retrieve()
gnv_appeondb.of_commitqueue( )

ldwc_category.insertrow(1)
ldwc_type.insertrow(1)
ldwc_status.insertrow(1)


end event

event open;call super::open;//Set current contract id  when contract folder have been opened -- jervis 03.31.2011
long ll_ctx_id
if isvalid(gw_contract) then
	ll_ctx_id = gw_contract.tab_contract_details.tabpage_details.inv_contract_details.of_get_ctx_id( )
	if ll_ctx_id > 0 then
		dw_filter.SetItem( 1,'contract_id',ll_ctx_id)
		cb_filter.event clicked( )
	end if
end if
end event

event activate;call super::activate;long ll_ctx_id, ll_contract_id

//Switch MDI menu while to do list window get the focus. - jervis 05.09.2011
if w_mdi.MenuName <> "m_pfe_cst_mdi_menu" then
	w_mdi.ChangeMenu(m_pfe_cst_mdi_menu)
	w_mdi.of_menu_security(w_mdi.MenuName)
end if


//Set current contract id  when contract folder have been opened -- jervis 05.09.2011
if isvalid(gw_contract) then
	ll_ctx_id = gw_contract.tab_contract_details.tabpage_details.inv_contract_details.of_get_ctx_id( )
	//Added By Mark Lee 09/14/12
//	if ll_ctx_id > 0  and ll_ctx_id <> dw_filter.GetItemNumber( 1,'contract_id') then
	ll_contract_id	= dw_filter.GetItemNumber( 1,'contract_id')
	if ll_ctx_id > 0  and ll_ctx_id <> ll_contract_id and not isnull(ll_contract_id) then
		
		dw_filter.SetItem( 1,'contract_id',ll_ctx_id)
		cb_filter.event clicked( )
	end if
end if

end event

type st_info from statictext within w_audit_painter
integer x = 562
integer y = 1740
integer width = 1074
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 16711680
long backcolor = 67108864
boolean focusrectangle = false
end type

type cb_label from commandbutton within w_audit_painter
integer x = 32
integer y = 1736
integer width = 517
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Calculate the Label"
end type

event clicked;//====================================================================
// Event: clicked
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:         Ken.Guo 2017-04-07
//--------------------------------------------------------------------
//Copyright (c) 2008-2016 Contract Logix, Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


Integer li_ret
Long i, ll_cnt,ll_ctx_id, ll_screen_id, ll_view_id, ll_table_id, ll_find, ll_find2, ll_find3, ll_data_length, ll_ctx_id_ref
string ls_dataobject, ls_screenstyle, ls_sql, ls_err, ls_field_name,ls_label,ls_table_name_allias, ls_ctxs
n_ds lds_screen_list, lds_ctx, lds_tables,lds_screen_all, lds_date, lds_custom
long ll_pre_view_id, ll_pre_screen_id, ll_pre_table_id
Boolean lb_newscreen, lb_errors, lb_datescreen, lb_customscreen 
String ls_mess, ls_sql_datescreen, ls_sql_customscreen

If is_status = IS_RUNNING Then Return

ls_mess = &
'It would take more time to get the field labels. Do you want to refresh all of the labels or just get the missing ones?' + &
'~r~n~r~nClick Yes to refresh all the labels.' + &
'~r~nClick No to get the missing labels.' + &
'~r~nClick Cancel to do nothing. '
li_ret = messagebox('Contractlogix',ls_mess, question!, yesnocancel!) 



If li_ret = 3 Then Return

dw_filter.reset()
dw_filter.insertrow(0)
cb_filter.event clicked( )

If li_ret = 1 then
	dw_audit.setfilter( 'table_id > 1000 and table_id < 10000 and Len(field_name) > 0 ' )	
	dw_audit.filter()	
Else
	dw_audit.setfilter( '(field_label = "" or isnull(field_label) ) and table_id > 1000 and table_id < 10000 and len(field_name) > 0' )	
	dw_audit.filter()
End if

ll_cnt = dw_audit.rowcount()
If ll_cnt = 0 Then 
	messagebox('Contractlogix','There is no field label that needs to be updated')
	dw_audit.setfilter('')	
	dw_audit.filter()	
	Return 
End If

dw_audit.setsort("ctx_view asc, table_id asc")
dw_audit.sort()

lds_screen_list = create n_ds  //get dataobject
lds_screen_list.dataobject = 'd_contract_screen_list'
lds_screen_list.settransobject(sqlca)

lds_tables = create n_ds   //get table name
lds_tables.dataobject = 'd_sys_table_select_list'
lds_tables.settransobject(sqlca)

lds_screen_all = create n_ds  //get screen style
lds_screen_all.dataobject = 'ds_screen_restore'
lds_screen_all.settransobject(sqlca)

gnv_appeondb.of_startqueue( )
	lds_screen_list.retrieve()
	lds_tables.retrieve()
	lds_screen_all.retrieve()
gnv_appeondb.of_commitqueue( )

For i = 1 To ll_cnt
	Yield()
	If Not isvalid(w_audit_painter) Then 
		return
	End If
	
	is_status = IS_RUNNING
	
	SetPointer(HourGlass!)
	st_info.text = 'Updating '+String(i) + '/' + String(ll_cnt)+'... '	
	
	//Get screen id, view id
	ll_view_id =  dw_audit.getitemnumber(i, 'ctx_view')
	ll_table_id = dw_audit.getitemnumber(i, 'table_id')
	ls_field_name = dw_audit.getitemstring(i, 'field_name')
	ll_ctx_id = dw_audit.getitemnumber(i, 'prac_id')
	ll_ctx_id_ref = dw_audit.getitemnumber(i, 'ctx_id')
	ls_table_name_allias =  dw_audit.getitemstring(i, 'table_name_allias')
	If ll_table_id > 1000 and ll_table_id < 10000 and isnull(ll_ctx_id_ref) Then
		If pos(ls_ctxs + ',' , ',' + string(ll_ctx_id) + ',') = 0 Then
			gnv_debug.of_output( True, 'Audit Painter -> Batch get field label. ' + 'Failed to get the view of contract. Because the contract ' + string(ll_ctx_id) + ' does not exist.')
			ls_ctxs = ls_ctxs + ',' + String(ll_ctx_id)
			lb_errors = True		
		End If
		Continue
	End If
	
	If ll_view_id <> ll_pre_view_id or ll_table_id <> ll_pre_table_id Then
		lb_datescreen = False
		lb_customscreen = False
		Choose Case ll_table_id 
			Case 1044  //occi
				ll_screen_id = 7
			Case 1045  //ccci
				ll_screen_id = 6
			Case Else
				ll_find = lds_tables.find('table_id = ' + String(ll_table_id), 1, lds_tables.rowcount())
				If ll_find > 0 Then
					ls_dataobject = lds_tables.getitemstring(ll_find, 'table_name')
					If ls_dataobject <> '' and not isnull(ls_dataobject) Then
						ll_find2 = lds_screen_list.find(  'dataobject = "' +ls_dataobject + '"' , 1, lds_screen_list.rowcount())
						If ll_find2 > 0 Then
							ll_screen_id = lds_screen_list.getitemnumber(ll_find2, 'screen_id')
							If ll_screen_id > 0 Then
	
							Else
								Continue
							End If
						Else
							Continue
						End If
					End If
				Else
					Continue
				End if
		End Choose
		ll_find3 = lds_screen_all.Find('data_view_id = ' + String(ll_view_id) + ' and screen_id = ' + String(ll_screen_id), 1, lds_screen_all.rowcount())
		If ll_find3 > 0 Then
			ls_screenstyle = lds_screen_all.getitemstring(ll_find3, 'screen_style')
		End If
		
		//Get screen  Syntax
		ls_sql = ''
		ll_data_length = 0
		If ls_screenstyle = 'F' Then
			SELECT Datalength(dw_sql) INTO :ll_data_length  FROM ctx_screen WHERE data_view_id = :ll_view_id AND screen_id = :ll_screen_id;
			If ll_data_length > 0 Then
				ls_sql = f_get_screen_sql(ll_view_id,ll_screen_id,false)
			End If
		Else
			SELECT Datalength(grid_sql) INTO :ll_data_length FROM ctx_screen WHERE data_view_id = :ll_view_id AND screen_id = :ll_screen_id;
			If ll_data_length > 0 Then
				ls_sql = f_get_screen_gridsql(ll_view_id,ll_screen_id,false)  
			End If
		End If
		
		//Save var
		ll_pre_view_id = ll_view_id
		ll_pre_screen_id = ll_screen_id
		ll_pre_table_id = ll_table_id
		
		//Create Screen
		ls_Err = ''
		If Len(ls_sql) > 0 Then
			If not isvalid(lds_ctx) Then
				lds_ctx = Create n_ds
			End If
			lds_ctx.Create( ls_sql, ls_Err )
			lb_newscreen = True //run saving data per new screen.
		Else
			gnv_debug.of_output( True, 'Audit Painter -> Batch get field label. ' + 'Failed to get the screen syntax. please make sure the screen '+ls_table_name_allias+' is valid in the view. View_id = ' + String(ll_view_id)  + ', Screen_id = ' + String(ll_screen_id) + ', CTX_ID = ' + string(ll_ctx_id) + '.')
			lb_errors = True		
			ls_err = 'error'
			Continue
		End If
	
		If Len(ls_err) > 0 Then
			//Messagebox('Error','Failed to create datastore. view_id = ' + String(ll_view_id)  + ' screen_id = ' + String(ll_screen_id))
			gnv_debug.of_output( True, 'Audit Painter -> Batch get field label. ' + 'Failed to create screen '+ls_table_name_allias+ '. View_id = ' + String(ll_view_id)  + ', Screen_id = ' + String(ll_screen_id) + ', CTX_ID = ' + string(ll_ctx_id)  +'. '+ ls_err)
			lb_errors = True	
			Continue
		End If

		//Added By Ken.Guo 2017-04-20. Get custom field's label in the custom screen.
		If ll_screen_id = 3 Then
			//Date Screen
			SELECT Datalength(dw_sql) INTO :ll_data_length  FROM ctx_screen WHERE data_view_id = :ll_view_id AND screen_id = 5;
			If ll_data_length > 0 Then
				ls_sql_datescreen = f_get_screen_sql(ll_view_id,5,false)
				If Not isvalid(lds_date) Then
					lds_date = Create n_ds
				End If
				lds_date.Create( ls_sql_datescreen, ls_Err )
				If Len(ls_err) > 0 Then
					gnv_debug.of_output( True, 'Audit Painter -> Batch get field label. ' + 'Failed to create the Contract Date screen. View_id = ' + String(ll_view_id)  + ', Screen_id = ' + String(5) + ', CTX_ID = ' + string(ll_ctx_id)  +'. '+ ls_err)
				Else	
					lb_datescreen = True
				End If
				
			End If	
			//Custom Screen
			SELECT Datalength(dw_sql) INTO :ll_data_length  FROM ctx_screen WHERE data_view_id = :ll_view_id AND screen_id = 9;
			If ll_data_length > 0 Then
				ls_sql_customscreen = f_get_screen_sql(ll_view_id,9,false)
				If Not isvalid(lds_custom) Then
					lds_custom = Create n_ds
				End If
				lds_custom.Create( ls_sql_customscreen, ls_Err )
				If Len(ls_err) > 0 Then
					gnv_debug.of_output( True, 'Audit Painter -> Batch get field label. ' + 'Failed to create the Contract Custom screen. View_id = ' + String(ll_view_id)  + ', Screen_id = ' + String(9) + ', CTX_ID = ' + string(ll_ctx_id)  +'. '+ ls_err)
				Else
					lb_customscreen = True
				End If			
			End If				
		End If		
		
	End If
	

	
	//Get Field's Label
	If ls_err = '' Then
		
		If ll_screen_id = 3 and  left(ls_field_name, 7) = 'custom_' Then
			//Added By Ken.Guo 2017-04-20
			//Get from Custom Screen
			ls_label = ''
			If lds_custom.describe(ls_field_name + '.visible' ) = '1'  or len(lds_custom.describe(ls_field_name + '.visible' )) > 1 Then
				If long(lds_custom.describe(ls_field_name + '.y' ) ) < Long(lds_custom.describe( 'datawindow.detail.height' )) Then
					ls_label =  lds_custom.describe( ls_field_name + '_t.text') 
				End If
			End If
			//Get from Date Screen
			If ls_label = '' or ls_label = '?' or ls_label = '!' Then
				If lds_date.describe(ls_field_name + '.visible' ) = '1'  or len(lds_date.describe(ls_field_name + '.visible' )) > 1 Then
					If long(lds_date.describe(ls_field_name + '.y' ) ) < Long(lds_date.describe( 'datawindow.detail.height' )) Then
						ls_label =  lds_date.describe( ls_field_name + '_t.text') 
					End If
				End If				
			End If
			//Get from Detail Screen
			If ls_label = '' or ls_label = '?' or ls_label = '!' Then
				If lds_ctx.describe(ls_field_name + '.visible' ) = '1'  or len(lds_ctx.describe(ls_field_name + '.visible' )) > 1 Then
					If long(lds_ctx.describe(ls_field_name + '.y' ) ) < Long(lds_ctx.describe( 'datawindow.detail.height' )) Then
						ls_label =  lds_ctx.describe( ls_field_name + '_t.text') 
					End If
				End If				
			End If			
			
		Else
			ls_label =  lds_ctx.describe( ls_field_name + '_t.text') 
	
			//Specail fields 
			Choose Case ll_screen_id
				Case 7 //occi
					If ls_field_name = 'default_email' Then
						ls_label = 'Default From'
					End If
				Case 6 //ccci
					If ls_field_name = 'default_email' Then
						ls_label = 'Default To'
					End If			
			End Choose
			//Specail fields 		
			If ls_label = '!' or ls_label = '?' Then
				If ls_field_name = 'record_id' Then
					ls_label = 'Record ID'
				End If
				If ls_field_name = 'readonly_flag' Then
					ls_label = 'Readonly Flag'
				End If				
				Choose Case ll_screen_id 
					Case 47 //Document Manager-> AI -> Detail screen
						ls_label =  lds_ctx.describe( 'ctx_am_action_item_' + ls_field_name + '_t.text') 
					Case 3  //Details
						If ls_field_name = 'master_contract_name' Then
							ls_label =  lds_ctx.describe( 't_1.text') 
						End If
					Case 33  //DM action Items
						If ls_field_name = 'action_type_code' Then
							ls_label = 'Action Type Code'
						End If						
					Case 12  //Requirements Profile
						If ls_field_name = 'clause' Then
							ls_label = 'Clause'
						End If
						If Pos(ls_field_name, '_value') > 0 Then
							ls_label = 'Value'
						End If
		
				End Choose
			End If
		End If
		
		If ls_label <> '!' and ls_label <> '?' Then
			dw_audit.setitem(i, 'field_label', ls_label)
			dw_audit.setitem(i, 'field_label_updatedate', today())
		Else
			lb_errors = True
			gnv_debug.of_output(true, 'Audit Painter -> Batch get field label. ' + 'Failed to get the field label. the label object '+ls_field_name+'_t does not exists in the '+ls_table_name_allias+'.  View_id = ' + String(ll_view_id)  + ', Screen_id = ' + String(ll_screen_id) + ', CTX_ID = ' + string(ll_ctx_id) + '.' )
		End If
		
		//Save data
		If lb_newscreen Then
			If dw_audit.update() < 0 Then
				lb_errors = True
				Messagebox('Error','Failed to update the data. please  see the log.')
				st_info.text = ''
				If isvalid(lds_screen_list ) Then destroy lds_screen_list
				If isvalid(lds_tables ) Then destroy lds_tables
				If isvalid(lds_screen_all ) Then destroy lds_screen_all		
				If isvalid(lds_date ) Then destroy lds_date	
				If isvalid(lds_custom ) Then destroy lds_custom	
				If isvalid(lds_ctx ) Then destroy lds_ctx	
				is_status = IS_END
				Return
			End If
			lb_newscreen = False
		End If
	End If
	
Next

If dw_audit.update() < 0 Then
	lb_errors = True
	Messagebox('Error','Failed to update the data. please  see the log.')
	st_info.text = ''
	If isvalid(lds_screen_list ) Then destroy lds_screen_list
	If isvalid(lds_tables ) Then destroy lds_tables
	If isvalid(lds_screen_all ) Then destroy lds_screen_all
	If isvalid(lds_date ) Then destroy lds_date	
	If isvalid(lds_custom ) Then destroy lds_custom	
	If isvalid(lds_ctx ) Then destroy lds_ctx		
	is_status = IS_END
	Return
End If

st_info.text = ''

//Refresh all data
dw_audit.setfilter('')
//dw_audit.filter()
dw_filter.reset()
dw_filter.insertrow(0)
cb_filter.event clicked( )
SetPointer(Arrow!)

If isvalid(lds_screen_list ) Then destroy lds_screen_list
If isvalid(lds_tables ) Then destroy lds_tables
If isvalid(lds_screen_all ) Then destroy lds_screen_all
If isvalid(lds_date ) Then destroy lds_date	
If isvalid(lds_custom ) Then destroy lds_custom	
If isvalid(lds_ctx ) Then destroy lds_ctx	

If lb_errors Then
	Messagebox('Contractlogix','The system has finished getting the field labels. However, some of the field labels are not available. Please see the debug.log file for detail. ')
Else
	Messagebox('Contractlogix','The system has finished getting the field labels.')
End If

is_status = IS_END
end event

type cb_filter from u_cb within w_audit_painter
integer x = 3493
integer y = 236
integer taborder = 30
string text = "&Run Filter"
end type

event clicked;call super::clicked;If is_status = IS_RUNNING Then Return //Added By Ken.Guo 2017-04-12

wf_run_filter()

//Added By Ken.Guo 2017-04-06. add filter column. should run it again after modified table SQL.
Datawindowchild ldwc_category2, ldwc_type2, ldwc_status2
dw_audit.getchild( 'contract_category', ldwc_category2)
dw_audit.getchild( 'contract_type', ldwc_type2)
dw_audit.getchild( 'contract_status', ldwc_status2)
ldwc_category2.Settransobject(SQLCA)
ldwc_type2.Settransobject(SQLCA)
ldwc_status2.Settransobject(SQLCA)
gnv_appeondb.of_startqueue( )
	ldwc_category2.Retrieve()
	ldwc_type2.Retrieve()
	ldwc_status2.Retrieve()	
gnv_appeondb.of_commitqueue( )

end event

type cb_export from u_cb within w_audit_painter
integer x = 3493
integer y = 136
integer taborder = 20
string text = "&Export"
end type

event clicked;call super::clicked;dw_audit.saveas()
end event

type cb_print from u_cb within w_audit_painter
integer x = 3493
integer y = 36
integer taborder = 20
string text = "&Print"
end type

event clicked;call super::clicked;dw_audit.Print()
end event

type dw_filter from u_dw within w_audit_painter
integer x = 69
integer y = 64
integer width = 3337
integer height = 244
integer taborder = 10
string dataobject = "d_audit_filter"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
end type

event constructor;call super::constructor;DataWindowChild ldwc_Child

This.of_SetUpdateAble( False )
This.of_SetDropDownCalendar( TRUE )
This.iuo_calendar.of_Register(this.iuo_calendar.DDLB)

this.SetTransObject( sqlca)
this.InsertRow(0)

this.GetChild("screen_id", ldwc_Child)
ldwc_Child.InsertRow(1)
ldwc_Child.SetItem( 1, "table_name_allias", "All" )
ldwc_Child.SetItem( 1, "table_id", 0 )
this.SetItem(1,"screen_id",0)

//Added By Ken.Guo 05/04/2014
Long ll_row
ll_row = ldwc_Child.InsertRow(0)
ldwc_Child.SetItem( ll_row, "table_name_allias", "Clause Library Painter" )
ldwc_Child.SetItem( ll_row, "table_id", 10001 )
ll_row = ldwc_Child.InsertRow(0)
ldwc_Child.SetItem( ll_row, "table_name_allias", "Template Library Painter" )
ldwc_Child.SetItem( ll_row, "table_id", 10002 )
ll_row = ldwc_Child.InsertRow(0)
ldwc_Child.SetItem( ll_row, "table_name_allias", "Company" )
ldwc_Child.SetItem( ll_row, "table_id", 10003 )
ll_row = ldwc_Child.InsertRow(0)
ldwc_Child.SetItem( ll_row, "table_name_allias", "Contact" )
ldwc_Child.SetItem( ll_row, "table_id", 10004 )


This.GetChild( "user_id", ldwc_Child )
ldwc_Child.InsertRow( 1 )
ldwc_Child.SetItem( 1, "user_id", "All" )
This.SetItem( 1, "user_id", "All" )









end event

event rbuttondown;call super::rbuttondown;string 	ls_name
integer 	li_Rtn
datetime ldt_Null

SetNull(ldt_Null)

ls_name = dwo.name
if this.Describe( ls_name + ".ColType") = "date" THEN
	li_Rtn = MessageBox("Set Null?","Would you like to set this date to null?",question!,yesno!,2 )
	
	if li_Rtn = 1 then
		this.SetItem(Row,ls_name,ldt_Null)
	end if
end if

end event

type dw_audit from u_dw within w_audit_painter
integer x = 32
integer y = 356
integer width = 3813
integer height = 1352
integer taborder = 10
string dataobject = "d_view_audit_ctx"
boolean hscrollbar = true
end type

event constructor;call super::constructor;This.of_SetUpdateAble( False )

This.of_SetTransObject(SQLCA)

This.of_SetSort(True)
This.inv_sort.of_SetStyle(3)
This.inv_sort.of_SetColumnDisplayNameStyle( 2 )

This.of_SetFilter(True)
This.inv_Filter.of_SetStyle(1)

This.inv_sort.of_SetColumnHeader(True)


end event

type gb_1 from groupbox within w_audit_painter
integer x = 32
integer y = 12
integer width = 3419
integer height = 320
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Filter"
end type

