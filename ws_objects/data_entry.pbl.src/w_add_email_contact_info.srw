$PBExportHeader$w_add_email_contact_info.srw
forward
global type w_add_email_contact_info from w_response
end type
type dw_1 from datawindow within w_add_email_contact_info
end type
type cb_1 from commandbutton within w_add_email_contact_info
end type
type cb_2 from commandbutton within w_add_email_contact_info
end type
end forward

global type w_add_email_contact_info from w_response
integer x = 645
integer y = 352
integer width = 2231
integer height = 1604
string title = "Add Email Contact"
long backcolor = 80269524
dw_1 dw_1
cb_1 cb_1
cb_2 cb_2
end type
global w_add_email_contact_info w_add_email_contact_info

on w_add_email_contact_info.create
int iCurrent
call super::create
this.dw_1=create dw_1
this.cb_1=create cb_1
this.cb_2=create cb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
this.Control[iCurrent+2]=this.cb_1
this.Control[iCurrent+3]=this.cb_2
end on

on w_add_email_contact_info.destroy
call super::destroy
destroy(this.dw_1)
destroy(this.cb_1)
destroy(this.cb_2)
end on

event open;call super::open;dw_1.SetTransObject( SQLCA )
dw_1.InsertRow( 1 )

end event

type dw_1 from datawindow within w_add_email_contact_info
integer x = 37
integer y = 64
integer width = 2117
integer height = 1224
integer taborder = 10
boolean bringtotop = true
string dataobject = "d_add_email_contact_info"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_1 from commandbutton within w_add_email_contact_info
integer x = 1627
integer y = 1324
integer width = 247
integer height = 84
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&OK"
boolean default = true
end type

event clicked;Long ll_lookup_code

dw_1.AcceptText()

IF IsNull( dw_1.GetItemString( 1, "entity_name" ) ) THEN
	MessageBox("Required Field", "Organization name must be filled in." )
	dw_1.SetColumn( "entity_name" )
	dw_1.SetFocus( )
	Return -1
END IF

IF IsNull( dw_1.GetItemString( 1, "contact_name" ) ) THEN
	MessageBox("Required Field", "Contact name must be filled in." )
	dw_1.SetColumn( "email_address" )
	dw_1.SetFocus( )
	Return -1
END IF

IF IsNull( dw_1.GetItemString( 1, "email_address" ) ) THEN
	MessageBox("Required Field", "Email Address must be filled in." )
	dw_1.SetColumn( "email_address" )
	dw_1.SetFocus( )
	Return -1
END IF

ll_lookup_code = gnv_app.of_get_id("LOOKUP")
dw_1.SetItem( 1, "lookup_code", ll_lookup_code)
dw_1.SetItem( 1, "code", Mid( dw_1.GetItemString( 1, "email_address" ) , 1, 15))
dw_1.Update( )
CloseWithReturn( Parent, dw_1.GetItemString( 1, "email_address" ) )


end event

type cb_2 from commandbutton within w_add_email_contact_info
integer x = 1906
integer y = 1324
integer width = 247
integer height = 84
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Cancel"
end type

event clicked;CloseWithReturn( Parent, "Cancel" )
end event

