$PBExportHeader$w_sertifi_template.srw
forward
global type w_sertifi_template from window
end type
type cb_2 from commandbutton within w_sertifi_template
end type
type cb_1 from commandbutton within w_sertifi_template
end type
type cb_close from commandbutton within w_sertifi_template
end type
type cb_save from commandbutton within w_sertifi_template
end type
type dw_1 from datawindow within w_sertifi_template
end type
end forward

global type w_sertifi_template from window
integer width = 2171
integer height = 1364
boolean titlebar = true
string title = "Sertifi Template"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_2 cb_2
cb_1 cb_1
cb_close cb_close
cb_save cb_save
dw_1 dw_1
end type
global w_sertifi_template w_sertifi_template

on w_sertifi_template.create
this.cb_2=create cb_2
this.cb_1=create cb_1
this.cb_close=create cb_close
this.cb_save=create cb_save
this.dw_1=create dw_1
this.Control[]={this.cb_2,&
this.cb_1,&
this.cb_close,&
this.cb_save,&
this.dw_1}
end on

on w_sertifi_template.destroy
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.cb_close)
destroy(this.cb_save)
destroy(this.dw_1)
end on

event open;dw_1.settransobject(sqlca)
dw_1.retrieve()

gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17

end event

type cb_2 from commandbutton within w_sertifi_template
integer x = 1106
integer y = 1168
integer width = 343
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Delete"
end type

event clicked;long ll_row
ll_row = dw_1.getrow()
if ll_row < 1 then return
dw_1.deleterow(ll_row)

end event

type cb_1 from commandbutton within w_sertifi_template
integer x = 759
integer y = 1168
integer width = 343
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Add"
end type

event clicked;long ll_row
ll_row = dw_1.insertrow(0)
dw_1.setfocus( )
dw_1.setrow(ll_row)
dw_1.setcolumn("template_id")
end event

type cb_close from commandbutton within w_sertifi_template
integer x = 1801
integer y = 1168
integer width = 343
integer height = 92
integer taborder = 30
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

type cb_save from commandbutton within w_sertifi_template
integer x = 1454
integer y = 1168
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

event clicked;Long ll_rowcount,i,ll_findrow
String ls_name,ls_id1,ls_id2
dw_1.AcceptText()
SetPointer(HourGlass!)
ll_rowcount = dw_1.rowcount()
For i = 1 to ll_rowcount
	If ll_rowcount < 2 Then Exit
	ls_name = dw_1.GetItemString(i,'template_name')
	If dw_1.GetItemStatus(i,'template_name',Primary!) = NotModified! or ls_name = '' or Isnull(ls_name)  Then Continue
	//Finding duplicate row
	If i = 1 Then
		ll_findrow = dw_1.Find('template_name = "'+ls_name+'"',2,ll_rowcount)
	ElseIf i = ll_rowcount Then
		ll_findrow = dw_1.Find('template_name = "'+ls_name+'"',1,ll_rowcount -1 )	
	Else
		ll_findrow = dw_1.Find('template_name = "'+ls_name+'"',1,i - 1)		
		If ll_findrow < 1 Then
			ll_findrow = dw_1.Find('template_name = "'+ls_name+'"',i + 1,ll_rowcount)
		End If
	End If
	//If found
	If ll_findRow > 0 Then
		ls_id1 = dw_1.GetItemString(i,'template_id')
		ls_id2 = dw_1.GetItemString(ll_findrow,'template_id')
		Messagebox('Save Error','Template ID: "' +ls_id1+ '" and "'+ ls_id2 +'"'+ ' have been seted to the same template name. Please modify either of them before saving.')
		//SetRow
		dw_1.SetFocus()
		dw_1.ScrollToRow(i)
		dw_1.SetRow(i)
		dw_1.SetColumn('template_name')
		Return -1
	End If
Next

If dw_1.Update() = 1 Then
	Commit;
	Messagebox('Contractlogix','Succeed to save the sertifi template data.')
Else
	Rollback;
	Messagebox('Contractlogix','Failed to save the sertifi template data.')	
End If

end event

type dw_1 from datawindow within w_sertifi_template
integer x = 9
integer width = 2135
integer height = 1120
integer taborder = 10
string title = "none"
string dataobject = "dw_sertifi_template"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

