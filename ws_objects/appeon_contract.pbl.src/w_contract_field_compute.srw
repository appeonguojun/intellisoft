$PBExportHeader$w_contract_field_compute.srw
forward
global type w_contract_field_compute from w_response
end type
type cb_1 from commandbutton within w_contract_field_compute
end type
type dw_detail from u_dw within w_contract_field_compute
end type
type dw_syntax from u_dw_contract within w_contract_field_compute
end type
type cb_delete from commandbutton within w_contract_field_compute
end type
type cb_add from commandbutton within w_contract_field_compute
end type
type dw_list from u_dw within w_contract_field_compute
end type
type cb_save from commandbutton within w_contract_field_compute
end type
type cb_close from commandbutton within w_contract_field_compute
end type
type gb_lookup from groupbox within w_contract_field_compute
end type
type gb_screen from groupbox within w_contract_field_compute
end type
end forward

global type w_contract_field_compute from w_response
integer width = 3643
integer height = 2480
string title = "Screen Auto Populate Settings"
cb_1 cb_1
dw_detail dw_detail
dw_syntax dw_syntax
cb_delete cb_delete
cb_add cb_add
dw_list dw_list
cb_save cb_save
cb_close cb_close
gb_lookup gb_lookup
gb_screen gb_screen
end type
global w_contract_field_compute w_contract_field_compute

type variables
str_pass istr_pass
string is_screen_type[]
boolean ib_retrieve = true
string	is_depend_dddw_type, is_expression_true_type, is_expression_false_type
end variables

forward prototypes
public function integer of_check ()
end prototypes

public function integer of_check ();String ls_expression_true, ls_expression_false, ls_expression_fields_true, ls_expression_fields_false

//Check expression when true
dw_detail.accepttext()
If dw_detail.rowcount() <> 1 Then Return 0
ls_expression_true = dw_detail.getitemstring(1, 'field_compute_expression_true')
ls_expression_fields_true = dw_detail.getitemstring(1, 'field_compute_fields_true')
If trim(ls_expression_true) <> '' Then
	
End If

/*
ls_Expression  = lnvo_string.of_globalreplace( ls_Expression, '~~', '~~~~')
ls_Expression  = lnvo_string.of_globalreplace( ls_Expression, '"', '~~"')//'"'

if Not IsValid(istr_pass) then 
	messagebox(gnv_app.iapp_object.DisplayName,"Expression is not valid.",StopSign!)
	mle_1.setfocus( )
	return -1
end if

if Not IsValid(istr_pass.s_u_dw) or upperbound(istr_pass.s_string_array) = 0 then
	messagebox(gnv_app.iapp_object.DisplayName,"Expression is not valid.",StopSign!)
	mle_1.setfocus( )
	return -1
end if

lds = create n_ds
lds.SetTransObject(SQLCA)
ls_Systax = istr_pass.s_u_dw.describe("DataWindow.Syntax")
lds.create( ls_Systax, ls_Err)

ls_Err = ''

//Modified By Ken.Guo 2016-08-16
String ls_Modify,ls_coltype_source, ls_coltype_target,ls_coltype_source2, ls_coltype_target2
If as_attribute = 'compute' Then	
	//Added By Ken.Guo 2016-08-16 //check datatype
	ls_Modify = 'create compute(band=detail alignment="0" expression="" border="5" color="0" x="0" y="0" height="52" width="520"  name=compute_field_temp font.face="MS Sans Serif" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="553648127" )'
	lds.modify(ls_Modify)
	 ls_Err = lds.modify('compute_field_temp.expression="' +ls_Expression+ '"')
	 If ls_Err = '' Then
		ls_coltype_source = istr_pass.s_u_dw.Describe(istr_pass.s_string_array[1]+ ".coltype")
		Choose Case Left ( ls_coltype_source , 5 )
			Case "char(", "char"
				ls_coltype_source2 = 'S'
			Case "date"	,"datet"	,"time", "times"
				ls_coltype_source2 = 'D'
			Case "decim","numbe", "doubl", "real","long", "ulong", "int"
				ls_coltype_source2 = 'N'
		End Choose	
		ls_coltype_target = lds.Describe("compute_field_temp.coltype")		
		Choose Case Left ( ls_coltype_target , 5 )
			Case "char(", "char"
				ls_coltype_target2 = 'S'
			Case "date"	,"datet"	,"time", "times"
				ls_coltype_target2 = 'D'
			Case "decim","numbe", "doubl", "real","long", "ulong", "int"
				ls_coltype_target2 = 'N'
		End Choose				
		If istr_pass.s_long[1] = 7 and ls_coltype_source2 <> ls_coltype_target2 Then			
			Messagebox('Compute Expression', 'Invalid compute expression. The expression returns a '+ls_coltype_target+' type value. A '+ls_coltype_source+' type value is expected. '  )
			if IsValid(lds) then destroy lds
			Return -1
		End If
		is_exptype = ls_coltype_target
		*/
Return 1
end function

on w_contract_field_compute.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.dw_detail=create dw_detail
this.dw_syntax=create dw_syntax
this.cb_delete=create cb_delete
this.cb_add=create cb_add
this.dw_list=create dw_list
this.cb_save=create cb_save
this.cb_close=create cb_close
this.gb_lookup=create gb_lookup
this.gb_screen=create gb_screen
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.dw_detail
this.Control[iCurrent+3]=this.dw_syntax
this.Control[iCurrent+4]=this.cb_delete
this.Control[iCurrent+5]=this.cb_add
this.Control[iCurrent+6]=this.dw_list
this.Control[iCurrent+7]=this.cb_save
this.Control[iCurrent+8]=this.cb_close
this.Control[iCurrent+9]=this.gb_lookup
this.Control[iCurrent+10]=this.gb_screen
end on

on w_contract_field_compute.destroy
call super::destroy
destroy(this.cb_1)
destroy(this.dw_detail)
destroy(this.dw_syntax)
destroy(this.cb_delete)
destroy(this.cb_add)
destroy(this.dw_list)
destroy(this.cb_save)
destroy(this.cb_close)
destroy(this.gb_lookup)
destroy(this.gb_screen)
end on

event pfc_preopen;call super::pfc_preopen;istr_pass = message.powerobjectparm

If istr_pass.s_long[1] = 0 or istr_pass.s_long[2] = 0 Then
	messagebox('Error','Failed to pass the value.')
	close(this)
End If

end event

event open;call super::open;//====================================================================
// Event: open
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:         Ken.Guo 2016-08-18
//--------------------------------------------------------------------
//Copyright (c) 2008-2016 Contract Logix, Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


dw_list.event pfc_retrieve( )
end event

type cb_1 from commandbutton within w_contract_field_compute
integer x = 69
integer y = 2244
integer width = 343
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Options..."
end type

event clicked;Open(w_field_compute_trigger_option)

end event

type dw_detail from u_dw within w_contract_field_compute
integer x = 69
integer y = 1120
integer width = 3479
integer height = 1048
integer taborder = 30
string dataobject = "d_contract_field_compute_detail"
boolean vscrollbar = false
boolean livescroll = false
end type

event constructor;call super::constructor;this.of_setupdateable( False)

end event

event buttonclicked;call super::buttonclicked;String ls_oldvalue,ls_column,ls_newvalue
str_pass lstr_pass, lstr_pass_new

Choose Case dwo.name
	Case "b_conditions" 
		ls_column = "field_compute_conditions"
		lstr_pass.s_long[1] = 10
		ls_oldvalue =  this.GetItemString(row,"field_compute_conditions")
	Case "b_expression_true"
		ls_column = "field_compute_expression_true"
		lstr_pass.s_long[1] = 11
		ls_oldvalue =  this.GetItemString(row,"field_compute_expression_true")
	Case "b_field_true"
		ls_column = "field_compute_fields_true"
		lstr_pass.s_long[1] = 12
		ls_oldvalue =  this.GetItemString(row,"field_compute_fields_true")		
	Case "b_expression_false"
		ls_column = "field_compute_expression_false"
		lstr_pass.s_long[1] = 21
		ls_oldvalue =  this.GetItemString(row,"field_compute_expression_false")
	Case "b_field_false"
		ls_column = "field_compute_fields_false"
		lstr_pass.s_long[1] = 22
		ls_oldvalue =  this.GetItemString(row,"field_compute_fields_false")	
End Choose

If Upperbound(lstr_pass.s_long[]) > 0 Then
	Choose Case lstr_pass.s_long[1]
		Case 10,11,21
			If Pos( ls_oldvalue, '~t' ) > 0 Then ls_oldvalue = Mid( ls_oldvalue, pos( ls_oldvalue, '~t' ) + 1 ) 
			If right( ls_oldvalue , 1 ) = '"' or right( ls_oldvalue, 1 ) = "'" Then ls_oldvalue = left( ls_oldvalue, len( ls_oldvalue ) - 1 )
			lstr_pass.s_string          = ls_oldvalue
			lstr_pass.s_string_array[1] = ls_column
			lstr_pass.as_search_type = "compute"
			lstr_pass.s_string_array[2] = "column"
			lstr_pass.s_u_dw   = istr_pass.s_u_dw
			OpenWithParm(w_export_expression,lstr_pass)
			lstr_pass_new = Message.PowerObjectParm
			if isvalid(lstr_pass_new) then
				if  trim(lstr_pass_new.s_string) <> "" then
					this.SetItem(row,ls_column,lstr_pass_new.s_string)
					If lstr_pass.s_long[1] = 11 Then
						is_expression_true_type = lstr_pass_new.s_string_array[2]
						dw_detail.modify('t_type_true.text="(The data type of expression is [' + is_expression_true_type + '] )"' )
					ElseIf  lstr_pass.s_long[1] = 21  Then
						is_expression_false_type = lstr_pass_new.s_string_array[2]
						dw_detail.modify('t_type_false.text="(The data type of expression is [' + is_expression_false_type + '] )"' )
					End If
				Else
					this.SetItem(row,ls_column,"")
				end if
			end if
		Case 12,22
			lstr_pass.s_string   = ls_oldvalue
			lstr_pass.s_u_dw   = istr_pass.s_u_dw			
			OpenwithParm(w_expression_choose_fields,lstr_pass)
			ls_newvalue = Message.stringparm
			Choose Case ls_newvalue
				Case 'Cancel'
					//
				Case 'No Data'
					this.SetItem(row,ls_column,'')
				Case Else
					this.SetItem(row,ls_column,ls_newvalue)
			End Choose
	
	End Choose
	
End If
end event

event rowfocuschanged;call super::rowfocuschanged;If this.getrow() > 0 and dw_list.getrow() <> this.getrow()  Then
	dw_list.scrolltorow(this.getrow())
	dw_list.setrow(this.getrow())
End If
end event

type dw_syntax from u_dw_contract within w_contract_field_compute
boolean visible = false
integer x = 3982
integer y = 1248
integer width = 320
integer height = 332
integer taborder = 20
end type

type cb_delete from commandbutton within w_contract_field_compute
integer x = 3209
integer y = 208
integer width = 343
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Delete"
end type

event clicked;dw_list.event pfc_deleterow()
end event

type cb_add from commandbutton within w_contract_field_compute
integer x = 3209
integer y = 88
integer width = 343
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Add"
end type

event clicked;Long ll_row
ll_row = dw_list.insertrow(0)

If ll_row > 0 Then
	dw_list.setitem(ll_row, 'view_id', istr_pass.s_long[1] )
	dw_list.setitem(ll_row, 'screen_id', istr_pass.s_long[2] )
	dw_list.scrolltorow(ll_row)
	dw_list.setrow(ll_row)
End If

end event

type dw_list from u_dw within w_contract_field_compute
integer x = 69
integer y = 92
integer width = 3104
integer height = 896
integer taborder = 20
string dataobject = "d_contract_field_compute_list"
boolean hscrollbar = true
boolean livescroll = false
end type

event constructor;call super::constructor;this.of_setrowselect( true)
this.of_setupdateable( true)
this.SetTransObject(sqlca)
this.sharedata(dw_detail)
end event

event pfc_retrieve;call super::pfc_retrieve;return this.Retrieve(istr_pass.s_long[1],istr_pass.s_long[2] )
end event

event rowfocuschanged;call super::rowfocuschanged;If this.getrow() > 0 and dw_detail.getrow() <> this.getrow()  Then
	dw_detail.scrolltorow(this.getrow())
	dw_detail.setrow(this.getrow())
End If
end event

type cb_save from commandbutton within w_contract_field_compute
integer x = 2903
integer y = 2244
integer width = 343
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Save"
end type

event clicked;dw_detail.accepttext()

If Parent. of_check() < 0  Then Return 

If dw_detail.update() = 1 Then
	gnv_data.of_retrieve('field_compute_expression_mul')
	messagebox('Save', 'Save data successfully.')
Else
	messagebox('Save','Failed to save it, please view the log file.')
End If

end event

type cb_close from commandbutton within w_contract_field_compute
integer x = 3250
integer y = 2244
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

event clicked;//Refresh cache
gnv_data.of_retrieve( 'field_use_compute')


close(parent)
end event

type gb_lookup from groupbox within w_contract_field_compute
integer x = 27
integer y = 1052
integer width = 3570
integer height = 1160
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "Details"
end type

type gb_screen from groupbox within w_contract_field_compute
integer x = 27
integer y = 8
integer width = 3570
integer height = 1016
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "Auto Populate Browse"
end type

