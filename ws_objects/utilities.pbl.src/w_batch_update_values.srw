$PBExportHeader$w_batch_update_values.srw
forward
global type w_batch_update_values from w_response
end type
type st_2 from statictext within w_batch_update_values
end type
type st_1 from statictext within w_batch_update_values
end type
type em_increment from editmask within w_batch_update_values
end type
type em_start from editmask within w_batch_update_values
end type
type rb_in1 from radiobutton within w_batch_update_values
end type
type rb_in10 from radiobutton within w_batch_update_values
end type
type rb_seq from radiobutton within w_batch_update_values
end type
type rb_fixed from radiobutton within w_batch_update_values
end type
type cb_ok from commandbutton within w_batch_update_values
end type
type cb_cancel from commandbutton within w_batch_update_values
end type
type dw_value from u_dw_contract within w_batch_update_values
end type
type gb_2 from groupbox within w_batch_update_values
end type
type gb_1 from groupbox within w_batch_update_values
end type
end forward

global type w_batch_update_values from w_response
integer width = 1257
integer height = 1048
string title = "Batch Set Value"
long backcolor = 67108864
string icon = "AppIcon!"
st_2 st_2
st_1 st_1
em_increment em_increment
em_start em_start
rb_in1 rb_in1
rb_in10 rb_in10
rb_seq rb_seq
rb_fixed rb_fixed
cb_ok cb_ok
cb_cancel cb_cancel
dw_value dw_value
gb_2 gb_2
gb_1 gb_1
end type
global w_batch_update_values w_batch_update_values

type variables
DataWindow idw_data

str_batch_update_field istr_batch_update_field
end variables

forward prototypes
public subroutine of_hide_auto_number ()
end prototypes

public subroutine of_hide_auto_number ();rb_seq.visible = False
rb_seq.enabled = False
rb_in10.visible = False
rb_in1.visible = False
gb_2.visible = False

cb_ok.y = 436
cb_cancel.y = 436
This.height = 700
end subroutine

on w_batch_update_values.create
int iCurrent
call super::create
this.st_2=create st_2
this.st_1=create st_1
this.em_increment=create em_increment
this.em_start=create em_start
this.rb_in1=create rb_in1
this.rb_in10=create rb_in10
this.rb_seq=create rb_seq
this.rb_fixed=create rb_fixed
this.cb_ok=create cb_ok
this.cb_cancel=create cb_cancel
this.dw_value=create dw_value
this.gb_2=create gb_2
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_2
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.em_increment
this.Control[iCurrent+4]=this.em_start
this.Control[iCurrent+5]=this.rb_in1
this.Control[iCurrent+6]=this.rb_in10
this.Control[iCurrent+7]=this.rb_seq
this.Control[iCurrent+8]=this.rb_fixed
this.Control[iCurrent+9]=this.cb_ok
this.Control[iCurrent+10]=this.cb_cancel
this.Control[iCurrent+11]=this.dw_value
this.Control[iCurrent+12]=this.gb_2
this.Control[iCurrent+13]=this.gb_1
end on

on w_batch_update_values.destroy
call super::destroy
destroy(this.st_2)
destroy(this.st_1)
destroy(this.em_increment)
destroy(this.em_start)
destroy(this.rb_in1)
destroy(this.rb_in10)
destroy(this.rb_seq)
destroy(this.rb_fixed)
destroy(this.cb_ok)
destroy(this.cb_cancel)
destroy(this.dw_value)
destroy(this.gb_2)
destroy(this.gb_1)
end on

event open;//====================================================================
// Event: open
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:         Ken.Guo 03/26/2015
//--------------------------------------------------------------------
//Copyright (c) 2008-2015 Contract Logix, Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

String ls_syntax, ls_ret
Long ll_pos
Datawindowchild ldwc_newfield
Integer Li_value
String ls_coltag
n_ds lnds_user

dw_value.InsertRow(0)

istr_batch_update_field = Message.powerobjectparm

//Create the field
ll_pos = Pos(istr_batch_update_field.as_syntax_field, 'id=' + String(istr_batch_update_field.al_fieldid ))
If ll_pos > 0 Then
	Choose Case Upper(istr_batch_update_field.as_fielddatatype)
		Case 'S'
			istr_batch_update_field.as_syntax_field = Replace(istr_batch_update_field.as_syntax_field, ll_pos + 3, Len(String(istr_batch_update_field.al_fieldid)) , '1')			
		Case 'D'
			istr_batch_update_field.as_syntax_field = Replace(istr_batch_update_field.as_syntax_field, ll_pos + 3, Len(String(istr_batch_update_field.al_fieldid)) , '2')
		Case 'N'
			istr_batch_update_field.as_syntax_field = Replace(istr_batch_update_field.as_syntax_field, ll_pos + 3, Len(String(istr_batch_update_field.al_fieldid)) , '3')
	End Choose
End If
If istr_batch_update_field.as_syntax_field = '' or isnull(istr_batch_update_field.as_syntax_field) Then
	Messagebox('Error','Failed to set the field id.')
	Return
End If

ls_ret = dw_value.Modify(istr_batch_update_field.as_syntax_field )
If ls_ret <> '' Then
	gnv_debug.of_output(True, 'Batch Update Contract. Failed to create the value object.')
	gnv_debug.of_output(True, 'Return:  ' + ls_ret)
	gnv_debug.of_output(True, 'Syntax of column:  ' + istr_batch_update_field.as_syntax_field )
	Messagebox('Error','Failed to create the columns. please see the log file.')
//	Return
End If

//Modify Field Position and Label
ls_syntax = 	istr_batch_update_field.as_fieldname + '_1.x = 41 ' + &
			istr_batch_update_field.as_fieldname + '_1.y = 84 ' + &
			istr_batch_update_field.as_fieldname + '_1.width = 946 ' + &
			istr_batch_update_field.as_fieldname + '_1.height = 96 ' + &
			istr_batch_update_field.as_fieldname + '_1.background.color="16777215" ' + & 
			't_label.text = "' +istr_batch_update_field.as_fieldname_alias + '"'
ls_ret = dw_value.Modify(ls_syntax)
If istr_batch_update_field.as_fielddatatype = 'N'  or istr_batch_update_field.as_fielddatatype = 'D' and isnull(istr_batch_update_field.as_fieldlookuptype ) Then
	dw_value.Modify(istr_batch_update_field.as_fieldname + '_1.height = 76 ')
End If

If ls_ret <> '' Then
	gnv_debug.of_output(True, 'Batch Update Contract. Failed to modify the value object.')
	gnv_debug.of_output(True, 'Return:  ' + ls_ret)
	gnv_debug.of_output(True, 'Syntax of column:  ' + ls_syntax)
	Messagebox('Error','Failed to create the columns. please see the log file.')
	Return
End If					

//Retrieve DWC data
If istr_batch_update_field.as_fieldlookuptype = 'U' Then  //User DDDW
	dw_value.Modify(istr_batch_update_field.as_fieldname + '_1.dddw.percentwidth=150')
	dw_value.Getchild(istr_batch_update_field.as_fieldname + '_1',ldwc_newfield)
	If istr_batch_update_field.as_fieldlookuptype = 'U' Then
		dw_value.GetChild( istr_batch_update_field.as_fieldname + '_1', ldwc_newfield)
		ldwc_newfield.SettransObject(SQLCA)
		ldwc_newfield.Retrieve()
	End If		
	This.of_hide_auto_number( )
ElseIf Left(istr_batch_update_field.as_fieldlookuptype,1 ) = 'C' Then  //Lookup DDDW
	//PopulateDDDW for new column
	dw_value.Modify(istr_batch_update_field.as_fieldname + '_1.dddw.percentwidth=150')
	ls_coltag = Mid(istr_batch_update_field.as_fieldlookuptype, 3, Len(istr_batch_update_field.as_fieldlookuptype))
	If ls_coltag <> '' Then
		li_value = gnv_app.inv_dwcache.of_GetRegistered (ls_coltag,lnds_user)
		IF li_value <> 1 THEN
			gnv_app.of_setcontraccache_code_lookup( ls_coltag )
			li_value = gnv_app.inv_dwcache.of_GetRegistered (ls_coltag,lnds_user)
		END IF
		dw_value.GetChild( istr_batch_update_field.as_fieldname + '_1' , ldwc_newfield)
		lnds_user.ShareData ( ldwc_newfield )	
	End If	
	This.of_hide_auto_number( )
ElseIf istr_batch_update_field.as_fielddatatype = 'D' Then  //Datetime Column
	//Modify Mask for Datetime field
	If Len(istr_batch_update_field.as_fieldformat) > 1 Then
		dw_value.Modify(istr_batch_update_field.as_fieldname + "_1.EditMask.Mask='"+istr_batch_update_field.as_fieldformat+"'")
	Else
		dw_value.Modify(istr_batch_update_field.as_fieldname + "_1.EditMask.Mask='mm/dd/yyyy'")
	End If
	This.of_hide_auto_number( )
ElseIf  isnull(istr_batch_update_field.as_fieldlookuptype) and istr_batch_update_field.as_fieldformat <> '[general]' and Len(istr_batch_update_field.as_fieldformat) > 0  Then
	dw_value.Modify(istr_batch_update_field.as_fieldname + "_1.EditMask.Mask='"+istr_batch_update_field.as_fieldformat+"'")
End If

dw_value.SetFocus()
dw_value.SetColumn( istr_batch_update_field.as_fieldname + '_1')
			
gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17


	
			
			
end event

type st_2 from statictext within w_batch_update_values
integer x = 672
integer y = 580
integer width = 411
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Increment"
boolean focusrectangle = false
end type

type st_1 from statictext within w_batch_update_values
integer x = 151
integer y = 580
integer width = 411
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Initial Value"
boolean focusrectangle = false
end type

type em_increment from editmask within w_batch_update_values
integer x = 672
integer y = 656
integer width = 347
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean enabled = false
string text = "1"
borderstyle borderstyle = stylelowered!
string mask = "#######"
end type

type em_start from editmask within w_batch_update_values
integer x = 146
integer y = 656
integer width = 343
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean enabled = false
string text = "1"
borderstyle borderstyle = stylelowered!
string mask = "#######"
end type

type rb_in1 from radiobutton within w_batch_update_values
boolean visible = false
integer x = 151
integer y = 1188
integer width = 859
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
string text = "Increase of 1, e.g. 1, 2, 3, 4 ..."
end type

type rb_in10 from radiobutton within w_batch_update_values
boolean visible = false
integer x = 142
integer y = 1088
integer width = 878
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
string text = "Increase of 10, e.g. 10, 20, 30, 40 ..."
boolean checked = true
end type

type rb_seq from radiobutton within w_batch_update_values
integer x = 55
integer y = 456
integer width = 626
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Use Auto Number Value"
end type

event clicked;If This.Checked Then
	em_start.enabled = True
	em_increment.enabled = True
	dw_value.enabled = False
	dw_value.modify( istr_batch_update_field.as_fieldname + '_1.background.color="16250354"' )
End If
end event

type rb_fixed from radiobutton within w_batch_update_values
integer x = 41
integer y = 24
integer width = 439
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Use Fixed Value"
boolean checked = true
end type

event clicked;If This.Checked Then
	em_start.enabled = False
	em_increment.enabled = False
	dw_value.enabled = True
	dw_value.modify( istr_batch_update_field.as_fieldname + '_1.background.color="16777215"' )
End If


end event

type cb_ok from commandbutton within w_batch_update_values
integer x = 466
integer y = 832
integer width = 343
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&OK"
boolean default = true
end type

event clicked;String ls_value
Datetime ldt_value

dw_value.AcceptText()
If rb_fixed.checked Then
	If istr_batch_update_field.as_fielddatatype = 'D' Then
		ldt_value = dw_value.getitemdatetime(1, istr_batch_update_field.as_fieldname + '_1' )
		If isnull(ldt_value) Then
			If Messagebox('Set Value','Do you want  to batch set the field~'s value to empty?', question!,yesno!) = 2 Then
				Return
			End If
		End If
		istr_batch_update_field.adt_fieldvalue = ldt_value
	ElseIf istr_batch_update_field.as_fielddatatype = 'S' Then
		ls_value = dw_value.getitemstring(1, istr_batch_update_field.as_fieldname + '_1' )
		If isnull(ls_value) Then
			If Messagebox('Set Value','Do you want  to batch set the field~'s value to empty?', question!,yesno!) = 2 Then
				Return
			End If
		End If
		istr_batch_update_field.as_fieldvalue = ls_value
	Else
		ls_value = String(dw_value.getitemdecimal(1, istr_batch_update_field.as_fieldname + '_1' ))
		If isnull(ls_value) Then
			If Messagebox('Set Value','Do you want  to batch set the field~'s value to empty?', question!,yesno!) = 2 Then
				Return
			End If
		End If
		If Not isnumber(ls_value) Then
			Messagebox('Error','Please enter a valid number.')
			dw_value.setfocus()
			Return
		End If
		istr_batch_update_field.as_fieldvalue = ls_value		
	End If
	ClosewithReturn(Parent,istr_batch_update_field )
ElseIf rb_seq.visible and rb_seq.enabled Then
	istr_batch_update_field.as_fieldvalue = em_start.text + '%AutoNumber%'+em_increment.text
	ClosewithReturn(Parent,istr_batch_update_field )
End If

Return

end event

type cb_cancel from commandbutton within w_batch_update_values
integer x = 837
integer y = 832
integer width = 343
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Cancel"
boolean cancel = true
end type

event clicked;Close(Parent)
end event

type dw_value from u_dw_contract within w_batch_update_values
integer x = 133
integer y = 140
integer width = 1015
integer height = 216
integer taborder = 10
string dataobject = "d_batch_update_value"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
borderstyle borderstyle = stylebox!
boolean ib_isupdateable = false
end type

type gb_2 from groupbox within w_batch_update_values
integer x = 105
integer y = 512
integer width = 1074
integer height = 284
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
end type

type gb_1 from groupbox within w_batch_update_values
integer x = 105
integer y = 80
integer width = 1074
integer height = 316
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
end type

