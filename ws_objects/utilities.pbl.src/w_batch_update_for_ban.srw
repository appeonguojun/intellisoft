$PBExportHeader$w_batch_update_for_ban.srw
forward
global type w_batch_update_for_ban from pfc_w_main
end type
type st_1 from statictext within w_batch_update_for_ban
end type
type mle_result from multilineedit within w_batch_update_for_ban
end type
type mle_tip from multilineedit within w_batch_update_for_ban
end type
type cb_query from commandbutton within w_batch_update_for_ban
end type
type cb_saveas from commandbutton within w_batch_update_for_ban
end type
type cb_run from commandbutton within w_batch_update_for_ban
end type
type cb_clear from commandbutton within w_batch_update_for_ban
end type
type dw_query from u_dw_contract within w_batch_update_for_ban
end type
type dw_log from u_dw_contract within w_batch_update_for_ban
end type
type cb_close from commandbutton within w_batch_update_for_ban
end type
type gb_log from groupbox within w_batch_update_for_ban
end type
type gb_2 from groupbox within w_batch_update_for_ban
end type
type dw_query_result from u_dw_contract within w_batch_update_for_ban
end type
end forward

global type w_batch_update_for_ban from pfc_w_main
integer width = 3401
integer height = 2004
string title = "Batch Update for Bankrate"
boolean maxbox = false
boolean resizable = false
boolean center = true
st_1 st_1
mle_result mle_result
mle_tip mle_tip
cb_query cb_query
cb_saveas cb_saveas
cb_run cb_run
cb_clear cb_clear
dw_query dw_query
dw_log dw_log
cb_close cb_close
gb_log gb_log
gb_2 gb_2
dw_query_result dw_query_result
end type
global w_batch_update_for_ban w_batch_update_for_ban

type variables
Boolean ib_updated = False
end variables

forward prototypes
public function integer of_data_check (integer ai_type)
end prototypes

public function integer of_data_check (integer ai_type);
If ai_type = 1 Then //Check Old Value
	If isnull(dw_query.GetItemNumber(1, 'old_category')) Then
		Messagebox('Data Checking','The Old Category field cannot be empty. Please select a value from the dropdown list.',Exclamation!)
		dw_query.setcolumn('old_category')
		dw_query.setfocus()
		Return -1
	End If
	If isnull(dw_query.GetItemNumber(1, 'old_division')) Then
		Messagebox('Data Checking','The Old Division field cannot be empty. Please select a value from the dropdown list.',Exclamation!)
		dw_query.setcolumn('old_division')
		dw_query.setfocus()
		Return -1
	End If
	If isnull(dw_query.GetItemNumber(1, 'old_department')) Then
		Messagebox('Data Checking','The Old Department field cannot be empty. Please select a value from the dropdown list.',Exclamation!)
		dw_query.setcolumn('old_department')
		dw_query.setfocus()
		Return -1
	End If		
End If

If ai_type = 2 Then //check New value and old value.
	If isnull(dw_query.GetItemNumber(1, 'new_category')) Then
		Messagebox('Data Checking','The New Category field cannot be empty. Please select a value from the dropdown list.',Exclamation!)
		dw_query.setcolumn('new_category')
		dw_query.setfocus()
		Return -1
	End If
	If isnull(dw_query.GetItemNumber(1, 'new_division')) Then
		Messagebox('Data Checking','The New Division field cannot be empty. Please select a value from the dropdown list.',Exclamation!)
		dw_query.setcolumn('new_division')
		dw_query.setfocus()
		Return -1
	End If
	If isnull(dw_query.GetItemNumber(1, 'new_department')) Then
		Messagebox('Data Checking','The New Department field cannot be empty. Please select a value from the dropdown list.',Exclamation!)
		dw_query.setcolumn('new_department')
		dw_query.setfocus()
		Return -1
	End If		 
End If

Return 1
end function

on w_batch_update_for_ban.create
int iCurrent
call super::create
this.st_1=create st_1
this.mle_result=create mle_result
this.mle_tip=create mle_tip
this.cb_query=create cb_query
this.cb_saveas=create cb_saveas
this.cb_run=create cb_run
this.cb_clear=create cb_clear
this.dw_query=create dw_query
this.dw_log=create dw_log
this.cb_close=create cb_close
this.gb_log=create gb_log
this.gb_2=create gb_2
this.dw_query_result=create dw_query_result
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.mle_result
this.Control[iCurrent+3]=this.mle_tip
this.Control[iCurrent+4]=this.cb_query
this.Control[iCurrent+5]=this.cb_saveas
this.Control[iCurrent+6]=this.cb_run
this.Control[iCurrent+7]=this.cb_clear
this.Control[iCurrent+8]=this.dw_query
this.Control[iCurrent+9]=this.dw_log
this.Control[iCurrent+10]=this.cb_close
this.Control[iCurrent+11]=this.gb_log
this.Control[iCurrent+12]=this.gb_2
this.Control[iCurrent+13]=this.dw_query_result
end on

on w_batch_update_for_ban.destroy
call super::destroy
destroy(this.st_1)
destroy(this.mle_result)
destroy(this.mle_tip)
destroy(this.cb_query)
destroy(this.cb_saveas)
destroy(this.cb_run)
destroy(this.cb_clear)
destroy(this.dw_query)
destroy(this.dw_log)
destroy(this.cb_close)
destroy(this.gb_log)
destroy(this.gb_2)
destroy(this.dw_query_result)
end on

event open;call super::open;//====================================================================
// Event: open
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:         Ken.Guo           Date: 10/08/2014
//--------------------------------------------------------------------
//Copyright (c) 2008-2013 Contract Logix, Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


cb_clear.event clicked( )
dw_query.event ue_populatedddws( )
dw_query.of_setupdateable(False)

dw_log.settransobject(sqlca)
dw_log.retrieve()
dw_log.of_setupdateable(False)
dw_log.of_setrowselect(True)
dw_log.inv_rowselect.of_setstyle(dw_log.inv_rowselect.single )

dw_query_result.of_setrowselect(True)
dw_query_result.inv_rowselect.of_setstyle(dw_query_result.inv_rowselect.single )
dw_query_result.settransobject(sqlca)
dw_query_result.of_setupdateable(False)


end event

type st_1 from statictext within w_batch_update_for_ban
integer x = 82
integer y = 340
integer width = 1033
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Notes: Department field is Custom_n15 field."
boolean focusrectangle = false
end type

type mle_result from multilineedit within w_batch_update_for_ban
event doubleclicked pbm_lbuttondblclk
boolean visible = false
integer x = 78
integer y = 608
integer width = 3218
integer height = 1120
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean vscrollbar = true
boolean autovscroll = true
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;If gb_log.text = 'Query Result' Then Return

This.hide()
cb_saveas.enabled = True
gb_log.text = 'Update Log (double click to show details)'

end event

type mle_tip from multilineedit within w_batch_update_for_ban
integer x = 37
integer y = 1764
integer width = 1970
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "Warning: You should backup the database before you run the update so you can restore it in case there is any mistake."
boolean border = false
boolean displayonly = true
end type

type cb_query from commandbutton within w_batch_update_for_ban
integer x = 2587
integer y = 328
integer width = 343
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Query"
end type

event clicked;//====================================================================
// Event: clicked
//--------------------------------------------------------------------
// Description: Search matched contracts and  templates.
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:         Ken.Guo           Date: 10/09/2014
//--------------------------------------------------------------------
//Copyright (c) 2008-2013 Contract Logix, Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History: 
//
//====================================================================


Long ll_oldcategory, ll_olddivision, ll_olddepartment, ll_include_template
Long ll_ctxid,i, ll_contract_cnt, ll_template_cnt
String ls_ctxlist, ls_templatelist, ls_company,ls_ctxname, ls_fullresult,ls_header

mle_result.text = ''
mle_result.hide()
cb_saveas.enabled = True

dw_query.AcceptText()

If of_data_check(2) < 0 Then Return 

ll_oldcategory = dw_query.GetItemNumber(1, 'old_category')
ll_olddivision = dw_query.GetItemNumber(1, 'old_division')
ll_olddepartment = dw_query.GetItemNumber(1, 'old_department')
ll_include_template = dw_query.GetItemNumber(1, 'include_template')

dw_query_result.Retrieve(ll_oldcategory,ll_olddivision,ll_olddepartment,ll_include_template)

If dw_query_result.rowcount() = 0 Then
	Messagebox('Query','No contract or template matches the criteria.')
	Return 
End If

ls_templatelist = 'Template List: ~r~n'
ls_ctxlist = 'Contract List: ~r~n'

ll_template_cnt = dw_query_result.GetItemNumber(dw_query_result.Rowcount(), 'compute_template_cnt')
ll_contract_cnt = dw_query_result.GetItemNumber(dw_query_result.Rowcount(), 'compute_contract_cnt')

//ls_header = &
//'From ~r~n' + &
//'Old Category = '+ dw_query.Describe ( "Evaluate('LookupDisplay(old_category)',1)" ) + ', ' + &
//'Old Division = '+ dw_query.Describe ( "Evaluate('LookupDisplay(old_division)',1)" ) + ', ' + &
//'Old Department = '+ dw_query.Describe ( "Evaluate('LookupDisplay(old_department)',1)" ) + ';~r~n' + &
//'To ~r~n' +&
//'New Category = '+ dw_query.Describe ( "Evaluate('LookupDisplay(new_category)',1)" ) + ', ' + &
//'New Division = '+ dw_query.Describe ( "Evaluate('LookupDisplay(new_division)',1)" ) + ', ' + &
//'New Department = '+ dw_query.Describe ( "Evaluate('LookupDisplay(new_department)',1)" ) + ';~r~n' 
//
For i = 1 To dw_query_result.rowcount()
	ll_ctxid = dw_query_result.GetItemNumber(i, 'ctx_basic_info_ctx_id')
	ls_ctxname = dw_query_result.GetItemString(i, 'compute_ctx')
	ls_company = dw_query_result.GetItemString(i, 'company')
	If ll_ctxid > 0 Then
		ls_ctxlist += '    '+ ls_ctxname
		If not isnull(ls_company) or ls_company <> '' Then
			ls_ctxlist += ' - ' + ls_company
		End If
		ls_ctxlist += '~r~n'
	Else
		ls_templatelist += '    '+ ls_ctxname
		If not isnull(ls_company) or ls_company <> '' Then
			//ls_templatelist += ' - ' + ls_company
		End If	
		ls_templatelist += '~r~n'
	End If
//	If Len(ls_ctxlist + ls_templatelist) > 7700 Then 
//		ls_ctxlist += '...~r~n' 
//		Exit
//	End If
Next
//ls_fullresult = ls_header

If ll_include_template = 1 Then
	ls_fullresult += 'There are ' + String(ll_template_cnt) + ' template(s) ' + ' and ' + String(ll_contract_cnt) + ' contract(s) match the criteria. '
	ls_fullresult += '~r~n' + ls_templatelist + '~r~n' + ls_ctxlist
Else
	ls_fullresult += 'There are ' + String(ll_contract_cnt) + ' contract(s) match the criteria.'
	ls_fullresult += '~r~n' + ls_ctxlist	
End If

mle_result.text = ls_fullresult
gb_log.text = 'Query Result'
mle_result.show()
cb_saveas.enabled = True



end event

type cb_saveas from commandbutton within w_batch_update_for_ban
integer x = 2587
integer y = 1772
integer width = 343
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Save As..."
end type

event clicked;dw_log.event ue_saveas_excel(True)
end event

type cb_run from commandbutton within w_batch_update_for_ban
integer x = 2944
integer y = 328
integer width = 343
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Run"
end type

event clicked;//====================================================================
// Event: clicked
//--------------------------------------------------------------------
// Description: Batch Update contracts and  templates.
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:         Ken.Guo           Date: 10/09/2014
//--------------------------------------------------------------------
//Copyright (c) 2008-2013 Contract Logix, Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History: 
//
//====================================================================


Long ll_oldcategory, ll_olddivision, ll_olddepartment, ll_include_template
Long ll_newcategory, ll_newdivision, ll_newdepartment
Long ll_ctxid,i, ll_contract_cnt, ll_template_cnt
String ls_ctxlist, ls_templatelist, ls_company,ls_ctxname, ls_fullresult,ls_header, ls_include_template
String ls_ctxidlist, ls_templateidlist


If Messagebox('Run','Please confirm whether you want to run the batch update process?',Question!, Yesno!) <> 1 Then
	Return 
End If

If of_data_check(2) < 0 Then Return 

mle_result.text = ''
mle_result.hide()
cb_saveas.enabled = True
gb_log.text =  'Update Log (double click to show details)'
dw_query.AcceptText()

ll_oldcategory = dw_query.GetItemNumber(1, 'old_category')
ll_olddivision = dw_query.GetItemNumber(1, 'old_division')
ll_olddepartment = dw_query.GetItemNumber(1, 'old_department')

ll_newcategory = dw_query.GetItemNumber(1, 'new_category')
ll_newdivision = dw_query.GetItemNumber(1, 'new_division')
ll_newdepartment = dw_query.GetItemNumber(1, 'new_department')

ll_include_template = dw_query.GetItemNumber(1, 'include_template')

If ll_include_template = 1 Then
	ls_include_template = 'True'
Else
	ls_include_template = 'False'
End If

dw_query_result.Retrieve(ll_oldcategory,ll_olddivision,ll_olddepartment,ll_include_template)

If dw_query_result.rowcount() = 0 Then
	Messagebox('Query','No contract or template matches the criteria.')
	Return 
End If

ll_template_cnt = dw_query_result.GetItemNumber(dw_query_result.Rowcount(), 'compute_template_cnt')
ll_contract_cnt = dw_query_result.GetItemNumber(dw_query_result.Rowcount(), 'compute_contract_cnt')

If ll_include_template = 0 and ll_contract_cnt = 0 Then
	Messagebox('Query','No matched contract(s).')
	Return 	
End If

If ll_include_template = 1 Then
	Update ctx_basic_info set category = :ll_newcategory, dvision = :ll_newdivision, custom_n15 = :ll_newdepartment
	Where category = :ll_oldcategory and dvision = :ll_olddivision and custom_n15 = :ll_olddepartment;
Else
	Update ctx_basic_info set category = :ll_newcategory, dvision = :ll_newdivision, custom_n15 = :ll_newdepartment
	Where category = :ll_oldcategory and dvision = :ll_olddivision and custom_n15 = :ll_olddepartment and ctx_id > 0;	
End If
If sqlca.sqlcode <> 0 Then
	Messagebox('Error','Failed to update. ' + sqlca.sqlerrtext,StopSign!)
	gnv_debug.of_output(True, sqlca.sqlerrtext)
	Return -1
End If

ls_header = &
'Update From ~r~n' + &
'Old Category = '+ dw_query.Describe ( "Evaluate('LookupDisplay(old_category)',1)" ) + ', ' + &
'Old Division = '+ dw_query.Describe ( "Evaluate('LookupDisplay(old_division)',1)" ) + ', ' + &
'Old Department = '+ dw_query.Describe ( "Evaluate('LookupDisplay(old_department)',1)" ) + ';~r~n' + &
'To ~r~n' +&
'New Category = '+ dw_query.Describe ( "Evaluate('LookupDisplay(new_category)',1)" ) + ', ' + &
'New Division = '+ dw_query.Describe ( "Evaluate('LookupDisplay(new_division)',1)" ) + ', ' + &
'New Department = '+ dw_query.Describe ( "Evaluate('LookupDisplay(new_department)',1)" ) + ';~r~n' + &
'Include Template = ' + ls_include_template + '~r~n'

ls_templatelist = 'Template(s) Updated: ~r~n'
ls_ctxlist = 'Contract(s) Updated: ~r~n'
For i = 1 To dw_query_result.rowcount()
	ll_ctxid = dw_query_result.GetItemNumber(i, 'ctx_basic_info_ctx_id')
	ls_ctxname = dw_query_result.GetItemString(i, 'compute_ctx')
	ls_company = dw_query_result.GetItemString(i, 'company')
	If ll_ctxid > 0 Then
		ls_ctxlist += '    '+ ls_ctxname
		If not isnull(ls_company) or ls_company <> '' Then
			ls_ctxlist += ' - ' + ls_company
		End If
		ls_ctxlist += '~r~n'
		ls_ctxidlist += String(ll_ctxid) + ';' 
	Else
		ls_templatelist += '    '+  ls_ctxname
		If not isnull(ls_company) or ls_company <> '' Then
			//ls_templatelist += ' - ' + ls_company
		End If	
		ls_templatelist += '~r~n'
		If ll_include_template = 1 Then
			ls_templateidlist += String(ll_ctxid) + ';' 
		End If
	End If
//	If Len(ls_ctxlist + ls_templatelist) > 7700 Then 
//		ls_ctxlist += '...' 
//		Exit
//	End If
Next

ls_fullresult = ''

If ll_include_template = 1 Then
	ls_fullresult +=  String(ll_template_cnt) + ' template(s) ' + ' and ' + String(ll_contract_cnt) + ' contract(s) updated. '
	ls_fullresult += '~r~n' + ls_templatelist + '~r~n' + ls_ctxlist
Else
	ls_fullresult +=  String(ll_contract_cnt) + ' contract(s) updated.'
	ls_fullresult += '~r~n' + ls_ctxlist	
End If

If Len(ls_ctxidlist) > 8000 Then ls_ctxidlist = Left(ls_ctxidlist, 7990) + '...'
If Len(ls_templateidlist) > 8000 Then ls_templateidlist = Left(ls_templateidlist, 7990) + '...'
If Len(ls_fullresult) > 8000 Then ls_fullresult = Left(ls_fullresult, 7990) + '...'

Insert into ctx_batch_update_log (login_user,update_text,update_result,update_log,update_date,update_ctxid_list, update_templateid_list )
Values(:gs_user_id, :ls_header,'Successful',:ls_fullresult,getdate(),:ls_ctxidlist, :ls_templateidlist);

If sqlca.sqlcode <> 0 Then
	Messagebox('Update','Batch update successful. Failed to write the log.')
	gnv_debug.of_output( True, 'Failed to write the batch update log.' + sqlca.sqlerrtext )
End If

dw_log.Retrieve()
dw_log.setrow(1)
dw_log.scrolltorow(1)
dw_log.setfocus()
ib_updated = True

Messagebox('Update','Batch update successful. You can review the recent update log.')


end event

type cb_clear from commandbutton within w_batch_update_for_ban
integer x = 2231
integer y = 328
integer width = 343
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "C&lear"
end type

event clicked;dw_query.reset()
dw_query.insertrow(0)
dw_query.setitem(1,'include_template', 1)

mle_result.text = ''
gb_log.text = 'Update Log (double click to show details)'
mle_result.hide()
cb_saveas.enabled = True
end event

type dw_query from u_dw_contract within w_batch_update_for_ban
integer x = 73
integer y = 96
integer width = 3218
integer height = 200
integer taborder = 10
string dataobject = "d_batch_update_ban"
boolean vscrollbar = false
boolean livescroll = false
end type

type dw_log from u_dw_contract within w_batch_update_for_ban
integer x = 73
integer y = 608
integer width = 3218
integer height = 1120
integer taborder = 10
string dataobject = "d_batch_update_all"
boolean hscrollbar = true
end type

event doubleclicked;call super::doubleclicked;String ls_log
If row <= 0 Then Return

ls_log += 'Operator: ' + dw_log.GetItemString(row, 'login_user') 
ls_log += ', Date Updated: ' + String(dw_log.GetItemDatetime(row, 'update_date'), 'mm/dd/yyyy HH:MM:SS')
ls_log += ', Update Result: ' +  dw_log.GetItemString(row, 'update_result') + ';~r~n'

ls_log += '~r~n' + dw_log.GetItemString(row, 'update_text')
ls_log += '~r~n' + dw_log.GetItemString(row, 'update_log')
mle_result.text = ls_log
gb_log.text = 'Update Log (double click to hide details)'

mle_result.show()
cb_saveas.enabled = False





end event

type cb_close from commandbutton within w_batch_update_for_ban
integer x = 2944
integer y = 1772
integer width = 343
integer height = 92
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Close"
boolean cancel = true
end type

event clicked;If ib_updated Then
	Messagebox('Close','Please exit and restart ContractLogix system.')
End If
Close(Parent)
end event

type gb_log from groupbox within w_batch_update_for_ban
integer x = 32
integer y = 540
integer width = 3305
integer height = 1212
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Update Log (double click to show details)"
end type

type gb_2 from groupbox within w_batch_update_for_ban
integer x = 32
integer y = 12
integer width = 3305
integer height = 460
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Please select update content"
end type

type dw_query_result from u_dw_contract within w_batch_update_for_ban
boolean visible = false
integer x = 2679
integer y = 1456
integer width = 558
integer height = 220
integer taborder = 20
boolean bringtotop = true
string dataobject = "d_ctx_batch_update_query"
boolean hscrollbar = true
boolean hsplitscroll = true
end type

