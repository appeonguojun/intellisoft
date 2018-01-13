$PBExportHeader$w_dm_checkout_document.srw
forward
global type w_dm_checkout_document from w_response
end type
type rb_echosign from radiobutton within w_dm_checkout_document
end type
type cb_tutorials from commandbutton within w_dm_checkout_document
end type
type st_1 from statictext within w_dm_checkout_document
end type
type mle_notes from multilineedit within w_dm_checkout_document
end type
type rb_saveas from radiobutton within w_dm_checkout_document
end type
type rb_weblink from radiobutton within w_dm_checkout_document
end type
type rb_email from radiobutton within w_dm_checkout_document
end type
type rb_sertifi from radiobutton within w_dm_checkout_document
end type
type rb_approval from radiobutton within w_dm_checkout_document
end type
type cb_4 from commandbutton within w_dm_checkout_document
end type
type cb_3 from commandbutton within w_dm_checkout_document
end type
type gb_1 from groupbox within w_dm_checkout_document
end type
end forward

global type w_dm_checkout_document from w_response
integer x = 214
integer y = 221
integer width = 1435
integer height = 1008
string title = "Check Out"
rb_echosign rb_echosign
cb_tutorials cb_tutorials
st_1 st_1
mle_notes mle_notes
rb_saveas rb_saveas
rb_weblink rb_weblink
rb_email rb_email
rb_sertifi rb_sertifi
rb_approval rb_approval
cb_4 cb_4
cb_3 cb_3
gb_1 gb_1
end type
global w_dm_checkout_document w_dm_checkout_document

type variables
str_add_doc istr_add_doc
end variables

on w_dm_checkout_document.create
int iCurrent
call super::create
this.rb_echosign=create rb_echosign
this.cb_tutorials=create cb_tutorials
this.st_1=create st_1
this.mle_notes=create mle_notes
this.rb_saveas=create rb_saveas
this.rb_weblink=create rb_weblink
this.rb_email=create rb_email
this.rb_sertifi=create rb_sertifi
this.rb_approval=create rb_approval
this.cb_4=create cb_4
this.cb_3=create cb_3
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rb_echosign
this.Control[iCurrent+2]=this.cb_tutorials
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.mle_notes
this.Control[iCurrent+5]=this.rb_saveas
this.Control[iCurrent+6]=this.rb_weblink
this.Control[iCurrent+7]=this.rb_email
this.Control[iCurrent+8]=this.rb_sertifi
this.Control[iCurrent+9]=this.rb_approval
this.Control[iCurrent+10]=this.cb_4
this.Control[iCurrent+11]=this.cb_3
this.Control[iCurrent+12]=this.gb_1
end on

on w_dm_checkout_document.destroy
call super::destroy
destroy(this.rb_echosign)
destroy(this.cb_tutorials)
destroy(this.st_1)
destroy(this.mle_notes)
destroy(this.rb_saveas)
destroy(this.rb_weblink)
destroy(this.rb_email)
destroy(this.rb_sertifi)
destroy(this.rb_approval)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.gb_1)
end on

event open;call super::open;
IF Isvalid( Message.PowerObjectparm ) THEN
	istr_add_doc = Message.PowerObjectparm
	
	//Added By Ken.Guo 2009-12-31.
	If istr_add_doc.doc_from = 'Clause' Then
		rb_approval.enabled = False
		rb_sertifi.enabled = False
		rb_weblink.enabled = False
	End If
	
	If AppeonGetClientType() = 'PB' Then 
//		rb_approval.enabled = False
		rb_weblink.enabled = False		
	End If
	
	if istr_add_doc.ab_weblink_unable then rb_weblink.enabled = False //Added By Jay Chen 09-22-2015
	
	If gnv_data.of_getitem( 'icred_settings', 'esign', False) <> '1' Then
		rb_sertifi.enabled = False
	End If
END IF

gnv_win_backcolor.of_ChangeWindowBackColor(this) //Added By Ken.Guo 2011-07-08. 
choose case gs_esigntype //Added By Jay Chen 10-11-2013
	case 'sertifi'
		rb_sertifi.text = 'Send for Electronic Signature --- Sertifi' 
	case 'echosign'
		rb_sertifi.text = 'Send for Electronic Signature --- Echosign'
	case 'docusign'
		rb_sertifi.text = 'Send for Electronic Signature --- Docusign'
end choose
end event

type rb_echosign from radiobutton within w_dm_checkout_document
boolean visible = false
integer x = 96
integer y = 260
integer width = 718
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Send for Echosign Signature "
end type

type cb_tutorials from commandbutton within w_dm_checkout_document
integer x = 37
integer y = 800
integer width = 343
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Tutorials"
end type

event clicked;of_open_web("http://www.contractlogix.com/tutorials.asp")
end event

type st_1 from statictext within w_dm_checkout_document
integer x = 41
integer y = 560
integer width = 343
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Notes:"
boolean focusrectangle = false
end type

type mle_notes from multilineedit within w_dm_checkout_document
integer x = 37
integer y = 620
integer width = 1349
integer height = 164
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type rb_saveas from radiobutton within w_dm_checkout_document
integer x = 96
integer y = 452
integer width = 1234
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Save As"
boolean checked = true
end type

type rb_weblink from radiobutton within w_dm_checkout_document
integer x = 96
integer y = 368
integer width = 1234
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Send Email and Include an Online Link to Document"
end type

type rb_email from radiobutton within w_dm_checkout_document
integer x = 96
integer y = 284
integer width = 1234
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Send Email and Attach Document"
end type

type rb_sertifi from radiobutton within w_dm_checkout_document
integer x = 96
integer y = 200
integer width = 1234
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Send for Electronic Signature "
end type

type rb_approval from radiobutton within w_dm_checkout_document
integer x = 96
integer y = 116
integer width = 1234
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Send for Approval"
end type

event clicked;//Added By Ken.Guo 07/05/2012.
If gnv_data.of_getItem( 'icred_settings', 'checkoutforapproval', False) = '0' or isnull(gnv_data.of_getItem( 'icred_settings', 'checkoutforapproval', False)) Then
	Messagebox('ContractLogix','This option is only available if you purchase the Workflow Module. ~r~nPlease contact Contract Logix sales at 866-371-4445 for more information' )
	This.checked = False
	rb_saveas.checked = True
	Return 1
End If
end event

type cb_4 from commandbutton within w_dm_checkout_document
integer x = 1061
integer y = 800
integer width = 315
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Cancel"
boolean cancel = true
end type

event clicked;close(parent)
end event

type cb_3 from commandbutton within w_dm_checkout_document
integer x = 736
integer y = 800
integer width = 315
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&OK"
boolean default = true
end type

event clicked;String ls_type
String ls_notes

If rb_echosign.checked Then //Added By Jay Chen 09-29-2013
	ls_type = '7'
End If
If rb_approval.checked Then
	ls_type = '6'
End If
If rb_sertifi.checked Then
	ls_type = '5'
End If
If rb_email.checked Then
	ls_type = '3'
End If
If rb_weblink.checked Then
	ls_type = '4'
End If
If rb_saveas.checked Then
	ls_type = '2'
End If

If ls_type = '' Then
	Messagebox('Check Out','Please select an action.')
	Return 
End If

ls_notes = mle_notes.text


//--------Begin Modified by Alfee 12.14.2007--------------------------------
//<$Reason>avoiding to call a response window from another response window
str_checkout lstr_checkout
lstr_checkout.checkout_type = ls_type
lstr_checkout.checkout_notes = ls_notes

CloseWithReturn(Parent, lstr_checkout)

end event

type gb_1 from groupbox within w_dm_checkout_document
integer x = 37
integer y = 36
integer width = 1349
integer height = 520
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Check Out Action"
end type

