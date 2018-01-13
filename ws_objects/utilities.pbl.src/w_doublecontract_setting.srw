$PBExportHeader$w_doublecontract_setting.srw
forward
global type w_doublecontract_setting from w_response
end type
type st_1 from statictext within w_doublecontract_setting
end type
type cbx_save from checkbox within w_doublecontract_setting
end type
type cbx_template from checkbox within w_doublecontract_setting
end type
type cbx_copy from checkbox within w_doublecontract_setting
end type
type cbx_new from checkbox within w_doublecontract_setting
end type
type cb_select from commandbutton within w_doublecontract_setting
end type
type cb_ok from commandbutton within w_doublecontract_setting
end type
type cbx_check from checkbox within w_doublecontract_setting
end type
type dw_1 from datawindow within w_doublecontract_setting
end type
type cb_cancel from commandbutton within w_doublecontract_setting
end type
type gb_1 from groupbox within w_doublecontract_setting
end type
end forward

global type w_doublecontract_setting from w_response
integer x = 214
integer y = 221
integer width = 1865
integer height = 2092
string title = "Set Check For Duplicate Contract"
st_1 st_1
cbx_save cbx_save
cbx_template cbx_template
cbx_copy cbx_copy
cbx_new cbx_new
cb_select cb_select
cb_ok cb_ok
cbx_check cbx_check
dw_1 dw_1
cb_cancel cb_cancel
gb_1 gb_1
end type
global w_doublecontract_setting w_doublecontract_setting

type variables
String			is_Sort
end variables

on w_doublecontract_setting.create
int iCurrent
call super::create
this.st_1=create st_1
this.cbx_save=create cbx_save
this.cbx_template=create cbx_template
this.cbx_copy=create cbx_copy
this.cbx_new=create cbx_new
this.cb_select=create cb_select
this.cb_ok=create cb_ok
this.cbx_check=create cbx_check
this.dw_1=create dw_1
this.cb_cancel=create cb_cancel
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.cbx_save
this.Control[iCurrent+3]=this.cbx_template
this.Control[iCurrent+4]=this.cbx_copy
this.Control[iCurrent+5]=this.cbx_new
this.Control[iCurrent+6]=this.cb_select
this.Control[iCurrent+7]=this.cb_ok
this.Control[iCurrent+8]=this.cbx_check
this.Control[iCurrent+9]=this.dw_1
this.Control[iCurrent+10]=this.cb_cancel
this.Control[iCurrent+11]=this.gb_1
end on

on w_doublecontract_setting.destroy
call super::destroy
destroy(this.st_1)
destroy(this.cbx_save)
destroy(this.cbx_template)
destroy(this.cbx_copy)
destroy(this.cbx_new)
destroy(this.cb_select)
destroy(this.cb_ok)
destroy(this.cbx_check)
destroy(this.dw_1)
destroy(this.cb_cancel)
destroy(this.gb_1)
end on

event closequery;Integer		li_msg


If dw_1.ModifiedCount( ) > 0 Then
	li_msg = of_MessageBox ("pfc_master_closequery_savechanges", &
				gnv_app.iapp_object.DisplayName, &
				"Do you want to save changes?", exclamation!, YesNoCancel!, 1)
End If
 
Choose Case li_msg
	Case 1
		 cb_ok.Triggerevent( Clicked! )
	Case 3
		return 0
End Choose
end event

event open;call super::open;string			ls_Item, ls_check , ls_Columns[]
Integer		li_i, li_Find
DataStore	lds_Option

dw_1.SetTransObject( sqlca )
dw_1.Retrieve( )

ls_Item = "FindDoubleContractBasicSpecificColumn"

ls_check = gnv_user_option.of_Get_option_value(  "contractlogix-super-master"   ,  ls_Item  + "-checked")

lds_Option = Create DataStore
lds_Option = gnv_user_option.of_System_Filter(  "Left( lower(Option_name), " + string ( len(ls_Item) ) + ") = '" + lower(ls_item)+"'"  )

For li_i = 1 To  lds_Option.Rowcount( )
	ls_Columns[li_i] = lds_Option.GetItemString( li_i, 'option_value' ) 
	If ls_columns[li_i] = '1' Then continue
	li_Find = dw_1.Find( "syscolumns_name = '" + ls_columns[li_i] + "'",1, dw_1.RowCount( ) )
	If li_Find > 0 Then dw_1.SetItem( li_find, 'selected' , '1' )
Next
dw_1.ResetUpdate( )

If ls_check= '1' Then cbx_check.checked = true

//Added By Ken.Guo 07/03/2014. Check Each type for new/save/copy/template.
String ls_item2, ls_type
ls_item2 = "FindDoubleContractCheckType"
ls_type = 'new'
ls_check = gnv_user_option.of_Get_option_value(  "contractlogix-super-master"   ,  ls_Item2 +'_'+ lower(ls_type) + "-checked")
If ls_check = '1' Then cbx_new.checked = true
ls_type = 'copy'
ls_check = gnv_user_option.of_Get_option_value(  "contractlogix-super-master"   ,  ls_Item2 +'_'+ lower(ls_type) + "-checked")
If ls_check = '1' Then cbx_copy.checked = true
ls_type = 'save'
ls_check = gnv_user_option.of_Get_option_value(  "contractlogix-super-master"   ,  ls_Item2 +'_'+ lower(ls_type) + "-checked")
If ls_check = '1' Then cbx_save.checked = true
ls_type = 'template'
ls_check = gnv_user_option.of_Get_option_value(  "contractlogix-super-master"   ,  ls_Item2 +'_'+ lower(ls_type) + "-checked")
If ls_check = '1' Then cbx_template.checked = true

cbx_check.event clicked( )

/*
If cbx_check.Checked Then
	dw_1.Modify( "	selected.Protect = '0' " )
	cb_select.enabled = true
	dw_1.Modify("access.checkbox.3D = 'YES'")
	dw_1.Modify("datawindow.color='"+String(RGB(255,255,255))+"'")
Else
	dw_1.Modify( "	selected.Protect = '1' " )
	dw_1.Modify("access.checkbox.3D = 'NO'")
	dw_1.Modify("datawindow.color='"+ string(this.BackColor)+"'")
	cb_select.enabled = false
End If
*/


end event

type st_1 from statictext within w_doublecontract_setting
integer x = 14
integer y = 452
integer width = 1833
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Please select the column(s) you want to use to determine if a contract is a duplicate."
boolean focusrectangle = false
end type

type cbx_save from checkbox within w_doublecontract_setting
integer x = 919
integer y = 220
integer width = 558
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Save Existing Contract"
end type

type cbx_template from checkbox within w_doublecontract_setting
integer x = 919
integer y = 312
integer width = 567
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Use Contract Template"
end type

type cbx_copy from checkbox within w_doublecontract_setting
integer x = 142
integer y = 304
integer width = 375
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Copy Contract"
end type

type cbx_new from checkbox within w_doublecontract_setting
integer x = 146
integer y = 212
integer width = 443
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "New Contract"
end type

type cb_select from commandbutton within w_doublecontract_setting
integer x = 5
integer y = 1884
integer width = 288
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Select All"
end type

event clicked;//==============================APPEON BEGIN==========================

Long i

If not cbx_check.Checked Then return

IF cb_select.Text = '&Select All' THEN
	cb_select.Text = '&Deselect All'
	FOR i = 1 To dw_1.RowCount()
		dw_1.SetItem(i,'selected','1')
	NEXT
ELSE
	cb_select.Text = '&Select All'
	FOR i = 1 To dw_1.RowCount()
		dw_1.SetItem(i,'selected','0')
	NEXT
END IF



end event

type cb_ok from commandbutton within w_doublecontract_setting
integer x = 1065
integer y = 1884
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
end type

event clicked;n_cst_contract			ln_cst_contract
Integer					li_i, li_Find
string						ls_checked

ln_cst_contract = create n_cst_contract

If cbx_check.checked Then
	ls_Checked = '1'
	li_Find = dw_1.Find( "selected = '1'" , 1, dw_1.RowCount( ) )
	If li_Find <=0 Then
		MessageBox( 'Set Check For Duplicate Contract', 'Please select fields for duplicate check.' )
		Return 
	End If
Else
	ls_checked = '0' 
End If


If dw_1.ModifiedCount( ) > 0 Then
	ln_cst_contract.of_delete_set_checkdoublecontract( )
	
	For li_i = 1 To dw_1.RowCount( )
		If dw_1.GetItemString( li_i, 'selected' ) = '0' Then continue
		
		ln_cst_contract.of_set_checkdoublecontract( "-"+ lower( dw_1.GetItemString( li_i, 'syscolumns_name' ) ),  lower(   dw_1.GetItemString( li_i, 'syscolumns_name' ) )   )
	Next	
	dw_1.ResetUpdate( )
End If
//must last set checked
ln_cst_contract.of_set_checkdoublecontract( "-checked",   ls_checked   )

//Added By Ken.Guo 07/03/2014. Check Each type for new/save/copy/template.
String ls_item2, ls_type
ls_item2 = "FindDoubleContractCheckType"
If cbx_new.checked Then
	gnv_user_option.of_set_option_value(  "contractlogix-super-master"   ,  ls_Item2 +'_new' + "-checked", '1')
Else
	gnv_user_option.of_set_option_value(  "contractlogix-super-master"   ,  ls_Item2 +'_new' + "-checked", '0')
End If
If cbx_copy.checked Then
	gnv_user_option.of_set_option_value(  "contractlogix-super-master"   ,  ls_Item2 +'_copy' + "-checked", '1')
Else
	gnv_user_option.of_set_option_value(  "contractlogix-super-master"   ,  ls_Item2 +'_copy' + "-checked", '0')
End If
If cbx_save.checked Then
	gnv_user_option.of_set_option_value(  "contractlogix-super-master"   ,  ls_Item2 +'_save' + "-checked", '1')
Else
	gnv_user_option.of_set_option_value(  "contractlogix-super-master"   ,  ls_Item2 +'_save' + "-checked", '0')
End If
If cbx_template.checked Then
	gnv_user_option.of_set_option_value(  "contractlogix-super-master"   ,  ls_Item2 +'_template' + "-checked", '1')
Else
	gnv_user_option.of_set_option_value(  "contractlogix-super-master"   ,  ls_Item2 +'_template' + "-checked", '0')
End If

gnv_user_option.of_save( )

close( parent )
end event

type cbx_check from checkbox within w_doublecontract_setting
integer x = 23
integer y = 12
integer width = 1705
integer height = 116
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = " Check for duplicate contracts during contract creation or saving."
end type

event clicked;If this.Checked Then
	dw_1.Modify( "	selected.Protect = '0' " )
	cb_select.enabled = true
	dw_1.Modify("access.checkbox.3D = 'YES'")
	dw_1.Modify("datawindow.color='"+String(RGB(255,255,255))+"'")
	
	//Added By Ken.Guo 07/03/2014
	cbx_new.enabled = True
	cbx_copy.enabled = True
	cbx_save.enabled = True
	cbx_template.enabled = True
	
Else
	dw_1.Modify( "	selected.Protect = '1' " )
	dw_1.Modify("access.checkbox.3D = 'NO'")
	dw_1.Modify("datawindow.color='"+ string(this.BackColor)+"'")
	cb_select.enabled = false
	
	//Added By Ken.Guo 07/03/2014
	cbx_new.enabled = false
	cbx_copy.enabled = false
	cbx_save.enabled = false
	cbx_template.enabled = false
	
End If
end event

type dw_1 from datawindow within w_doublecontract_setting
integer x = 9
integer y = 520
integer width = 1810
integer height = 1328
integer taborder = 10
string title = "none"
string dataobject = "d_doublecontract_setting"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;
If row > 0 Then
	This.SelectRow(0, FALSE)
	This.scrolltorow(row)
	This.SelectRow(row, TRUE)
End If


If row = 0 and ( dwo.name = 'selected_t'  or dwo.name = 'syscolumns_name_t' ) Then
	If is_Sort = "" or is_Sort = 'A' Then
		If dwo.name = 'selected_t' Then
			SetSort( "selected" )
		Else
			SetSort( "syscolumns_name" )		
		End If
		is_Sort = "D"
	Else
		If dwo.name = 'selected_t' Then
			SetSort( "selected desc" )
		Else
			SetSort( "syscolumns_name desc" )		
		End If
		is_Sort = 'A'
	End If
	Sort( )
End If
end event

event rowfocuschanged;this.SelectRow(0, false)
this.SelectRow(CurrentRow, true)

end event

type cb_cancel from commandbutton within w_doublecontract_setting
integer x = 1445
integer y = 1884
integer width = 343
integer height = 92
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Cancel"
end type

event clicked;close( parent )
end event

type gb_1 from groupbox within w_doublecontract_setting
integer x = 59
integer y = 128
integer width = 1650
integer height = 296
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Check Range"
end type

