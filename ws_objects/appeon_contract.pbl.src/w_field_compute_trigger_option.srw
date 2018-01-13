$PBExportHeader$w_field_compute_trigger_option.srw
forward
global type w_field_compute_trigger_option from w_response
end type
type cb_cancel from commandbutton within w_field_compute_trigger_option
end type
type cb_ok from commandbutton within w_field_compute_trigger_option
end type
type cbx_3 from checkbox within w_field_compute_trigger_option
end type
type cbx_2 from checkbox within w_field_compute_trigger_option
end type
type cbx_1 from checkbox within w_field_compute_trigger_option
end type
type gb_1 from groupbox within w_field_compute_trigger_option
end type
end forward

global type w_field_compute_trigger_option from w_response
integer x = 214
integer y = 221
integer width = 2866
integer height = 660
string title = "Trigger Option for Auto Populate"
cb_cancel cb_cancel
cb_ok cb_ok
cbx_3 cbx_3
cbx_2 cbx_2
cbx_1 cbx_1
gb_1 gb_1
end type
global w_field_compute_trigger_option w_field_compute_trigger_option

on w_field_compute_trigger_option.create
int iCurrent
call super::create
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
this.cbx_3=create cbx_3
this.cbx_2=create cbx_2
this.cbx_1=create cbx_1
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_cancel
this.Control[iCurrent+2]=this.cb_ok
this.Control[iCurrent+3]=this.cbx_3
this.Control[iCurrent+4]=this.cbx_2
this.Control[iCurrent+5]=this.cbx_1
this.Control[iCurrent+6]=this.gb_1
end on

on w_field_compute_trigger_option.destroy
call super::destroy
destroy(this.cb_cancel)
destroy(this.cb_ok)
destroy(this.cbx_3)
destroy(this.cbx_2)
destroy(this.cbx_1)
destroy(this.gb_1)
end on

event open;call super::open;If gnv_user_option.of_get_option_value( 'autopopulate_triggeredby_retrieve')  = '1' Then
	cbx_2.checked = True
Else
	cbx_2.checked = False
End If

If gnv_user_option.of_get_option_value( 'autopopulate_triggeredby_save')  = '1' Then
	cbx_3.checked = True
Else
	cbx_3.checked = False
End If


end event

type cb_cancel from commandbutton within w_field_compute_trigger_option
integer x = 2437
integer y = 432
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

event clicked;Close(Parent)
end event

type cb_ok from commandbutton within w_field_compute_trigger_option
integer x = 2062
integer y = 432
integer width = 343
integer height = 92
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&OK"
end type

event clicked;String ls_retrieve_triggered, ls_save_triggered
If cbx_2.checked Then
	ls_retrieve_triggered = '1'
Else
	ls_retrieve_triggered = '0'
End If

If cbx_3.checked Then
	ls_save_triggered = '1'
Else
	ls_save_triggered = '0'
End If

If gnv_user_option.of_get_option_value( 'autopopulate_triggeredby_retrieve') <>  ls_retrieve_triggered Then
	gnv_user_option.of_set_option_value( 'autopopulate_triggeredby_retrieve', ls_retrieve_triggered)
End If
If gnv_user_option.of_get_option_value( 'autopopulate_triggeredby_save') <>  ls_save_triggered Then
	gnv_user_option.of_set_option_value( 'autopopulate_triggeredby_save', ls_save_triggered)
End If

gnv_user_option.of_system_save( )

Close(Parent)


end event

type cbx_3 from checkbox within w_field_compute_trigger_option
integer x = 101
integer y = 268
integer width = 2665
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Trigger for all the rows on the current screen when a field value is modified on the screen and the save button is clicked. "
end type

event clicked;If this.checked Then
	Messagebox('Notes','When this option is enabled, it will automatically modify all associated data in the screen when you save the contract record. ~r~nPlease make sure the expression and associated settings are configured correctly.')
End If
end event

type cbx_2 from checkbox within w_field_compute_trigger_option
integer x = 101
integer y = 180
integer width = 2551
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Trigger for all the rows on the current screen when you open the screen. But it will not automatically save."
end type

event clicked;If this.checked Then
	Messagebox('Notes','When this option is enabled, it will automatically modify all associated data in the screen when you open the screen. ~r~nPlease make sure the expression and associated settings are configured correctly.')
End If
end event

type cbx_1 from checkbox within w_field_compute_trigger_option
integer x = 101
integer y = 92
integer width = 2464
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
string text = "Trigger for the current row when the user modifies a field value in the screen. It will not automatically save."
boolean automatic = false
boolean checked = true
end type

type gb_1 from groupbox within w_field_compute_trigger_option
integer x = 27
integer y = 12
integer width = 2784
integer height = 380
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "System Level"
end type

