$PBExportHeader$w_word_addins.srw
forward
global type w_word_addins from w_popup
end type
type cb_restore from commandbutton within w_word_addins
end type
type cb_select from commandbutton within w_word_addins
end type
type cb_refresh from commandbutton within w_word_addins
end type
type cb_close from commandbutton within w_word_addins
end type
type cb_save from commandbutton within w_word_addins
end type
type dw_1 from u_dw within w_word_addins
end type
end forward

global type w_word_addins from w_popup
integer width = 2267
integer height = 1628
string title = "Manage Com Add-ins of MS Word"
boolean center = true
cb_restore cb_restore
cb_select cb_select
cb_refresh cb_refresh
cb_close cb_close
cb_save cb_save
dw_1 dw_1
end type
global w_word_addins w_word_addins

type variables

n_cst_word_addins inv_word_addins
end variables

on w_word_addins.create
int iCurrent
call super::create
this.cb_restore=create cb_restore
this.cb_select=create cb_select
this.cb_refresh=create cb_refresh
this.cb_close=create cb_close
this.cb_save=create cb_save
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_restore
this.Control[iCurrent+2]=this.cb_select
this.Control[iCurrent+3]=this.cb_refresh
this.Control[iCurrent+4]=this.cb_close
this.Control[iCurrent+5]=this.cb_save
this.Control[iCurrent+6]=this.dw_1
end on

on w_word_addins.destroy
call super::destroy
destroy(this.cb_restore)
destroy(this.cb_select)
destroy(this.cb_refresh)
destroy(this.cb_close)
destroy(this.cb_save)
destroy(this.dw_1)
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
// Author:         Ken.Guo 2015-07-14
//--------------------------------------------------------------------
//Copyright (c) 2008-2015 Contract Logix, Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

cb_refresh.event clicked( )
end event

type cb_restore from commandbutton within w_word_addins
integer x = 695
integer y = 1384
integer width = 352
integer height = 100
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "R&estore"
end type

event clicked;
If Messagebox('Restore','Do you want to restore the Com Add-ins?', Question!, Yesno!) = 1 Then
	If inv_word_addins.of_restore_key( dw_1) = 1 Then
		cb_save.enabled = False
		cb_refresh.event clicked( )
	End If
End If


end event

type cb_select from commandbutton within w_word_addins
integer x = 59
integer y = 1384
integer width = 457
integer height = 100
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Reference Sans Serif"
string text = "Deselect &All"
end type

event clicked;Long i

If cb_select.text = 'Deselect &All' Then
	For i = 1 To dw_1.rowcount()		
		dw_1.setItem(i,'loadbehavior', '0')						
	Next
	cb_select.text = 'Select &All'
Else
	For i = 1 To dw_1.rowcount()		
		dw_1.setItem(i,'loadbehavior', '1')					
	Next	
	cb_select.text = 'Deselect &All'
End If



end event

type cb_refresh from commandbutton within w_word_addins
integer x = 1070
integer y = 1384
integer width = 352
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Refresh"
end type

event clicked;n_ds lds_word_addins



lds_word_addins = Create n_ds
lds_word_addins.dataobject = 'd_word_comaddins'

inv_word_addins.of_get_word_addins( lds_word_addins)

dw_1.Reset()
lds_word_addins.RowsCopy(1, lds_word_addins.Rowcount(), Primary!,dw_1,1, Primary!)

dw_1.resetupdate( )

If isvalid(lds_word_addins) Then Destroy lds_word_addins
end event

type cb_close from commandbutton within w_word_addins
integer x = 1833
integer y = 1384
integer width = 352
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Close"
boolean cancel = true
end type

event clicked;Close(Parent)
end event

type cb_save from commandbutton within w_word_addins
integer x = 1454
integer y = 1384
integer width = 352
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Save"
end type

event clicked;inv_word_addins.of_save_addins(dw_1)
end event

type dw_1 from u_dw within w_word_addins
integer x = 32
integer y = 36
integer width = 2149
integer height = 1312
integer taborder = 10
string dataobject = "d_word_comaddins"
boolean hscrollbar = true
end type

event constructor;call super::constructor;this.of_setupdateable( False)
end event

