$PBExportHeader$w_email_send_settings.srw
forward
global type w_email_send_settings from w_response
end type
type mle_1 from multilineedit within w_email_send_settings
end type
type dw_1 from u_dw within w_email_send_settings
end type
type cb_cancel from commandbutton within w_email_send_settings
end type
type cb_save from commandbutton within w_email_send_settings
end type
type gb_1 from groupbox within w_email_send_settings
end type
end forward

global type w_email_send_settings from w_response
integer width = 2377
integer height = 548
string title = "Email Send Settings – System Level"
mle_1 mle_1
dw_1 dw_1
cb_cancel cb_cancel
cb_save cb_save
gb_1 gb_1
end type
global w_email_send_settings w_email_send_settings

on w_email_send_settings.create
int iCurrent
call super::create
this.mle_1=create mle_1
this.dw_1=create dw_1
this.cb_cancel=create cb_cancel
this.cb_save=create cb_save
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.mle_1
this.Control[iCurrent+2]=this.dw_1
this.Control[iCurrent+3]=this.cb_cancel
this.Control[iCurrent+4]=this.cb_save
this.Control[iCurrent+5]=this.gb_1
end on

on w_email_send_settings.destroy
call super::destroy
destroy(this.mle_1)
destroy(this.dw_1)
destroy(this.cb_cancel)
destroy(this.cb_save)
destroy(this.gb_1)
end on

event open;call super::open;String ls_email_type_list
String ls_email_type[]
String ls_email_type_temp
Int i
Int li_null
Int li_findrow
Int li_currow
Long ll_rowcount

DataWindowChild ldwc_Child

ls_email_type_list = Message.stringparm

If IsNull(ls_email_type_list) or ls_email_type_list = '' Then Return 

gnv_string.of_parsetoarray(ls_email_type_list, ';', ls_email_type)

if UpperBound(ls_email_type) <= 0 Then Return


SetNull(li_null)

//initialize dddw
dw_1.GetChild("email_template_id",ldwc_Child)
ldwc_Child.SetTransObject(SQLCA)
ldwc_Child.Reset()
ldwc_Child.Retrieve()

ldwc_Child.SetFilter("module = '03' or module = '04' ")
ldwc_Child.Filter( )

li_currow = ldwc_Child.InsertRow(1)
ldwc_Child.SetItem(li_currow, 'email_id', li_null)
ldwc_Child.SetItem(li_currow, 'email_name', '')

dw_1.Retrieve(ls_email_type)

ll_rowcount = dw_1.RowCount()

For i = 1 to UpperBound(ls_email_type)
	ls_email_type_temp = ls_email_type[i]
	li_findrow = dw_1.Find("email_type = '" + ls_email_type_temp  + "'", 1, ll_rowcount)
	If li_findrow <= 0 Then
		li_currow = dw_1.Insertrow(0)
		dw_1.SetItem(li_currow, 'email_type', ls_email_type_temp)
		dw_1.SetItem(li_currow, 'email_template_id', li_null)
		li_findrow = li_currow
	End If
	dw_1.SetItem(li_findrow, 'sort', i )
	dw_1.SetItemStatus(li_findrow, 'sort', Primary!, NotModified!)
Next 

dw_1.SetSort("sort")
dw_1.Sort( )

long ll_reduce_height = 84
If dw_1.rowcount() < 2 Then
	dw_1.height = dw_1.height - ll_reduce_height
	gb_1.height = gb_1.height - ll_reduce_height
	mle_1.y = mle_1.y - ll_reduce_height
	cb_save.y = cb_save.y - ll_reduce_height
	cb_cancel.y = cb_cancel.y - ll_reduce_height
End If
end event

type mle_1 from multilineedit within w_email_send_settings
integer x = 14
integer y = 312
integer width = 1582
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Note: the system default email will be used if no email template is selected in the options above."
boolean border = false
boolean displayonly = true
end type

type dw_1 from u_dw within w_email_send_settings
integer x = 37
integer y = 48
integer width = 2290
integer height = 228
integer taborder = 20
string dataobject = "d_email_send_settings"
boolean border = false
borderstyle borderstyle = stylebox!
end type

type cb_cancel from commandbutton within w_email_send_settings
integer x = 1998
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
string text = "Close"
end type

event clicked;Close(Parent)
end event

type cb_save from commandbutton within w_email_send_settings
integer x = 1655
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
string text = "Save"
end type

event clicked;String ls_errtext
dw_1.accepttext( )

If dw_1.RowCount( ) <= 0 Then Return 

If dw_1.Update( ) = 1 Then
	gnv_data.of_retrieve('email_template_settings') //Added By Ken.Guo 2016-08-24
Else
	ls_errtext = sqlca.sqlerrtext
	Messagebox("Prompt","Save Failed! " + ls_errtext)
End If
end event

type gb_1 from groupbox within w_email_send_settings
integer x = 27
integer width = 2309
integer height = 288
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

