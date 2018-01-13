$PBExportHeader$w_contact_information.srw
forward
global type w_contact_information from w_response
end type
type cb_2 from commandbutton within w_contact_information
end type
type dw_app_addresses from u_dw within w_contact_information
end type
type dw_practice_addresses from u_dw within w_contact_information
end type
type gb_client from groupbox within w_contact_information
end type
type gb_payor from groupbox within w_contact_information
end type
type gb_1 from groupbox within w_contact_information
end type
type dw_facility from u_dw within w_contact_information
end type
end forward

global type w_contact_information from w_response
integer x = 425
integer y = 96
integer width = 2702
integer height = 2172
string title = "Contact Information"
long backcolor = 79680469
cb_2 cb_2
dw_app_addresses dw_app_addresses
dw_practice_addresses dw_practice_addresses
gb_client gb_client
gb_payor gb_payor
gb_1 gb_1
dw_facility dw_facility
end type
global w_contact_information w_contact_information

on w_contact_information.create
int iCurrent
call super::create
this.cb_2=create cb_2
this.dw_app_addresses=create dw_app_addresses
this.dw_practice_addresses=create dw_practice_addresses
this.gb_client=create gb_client
this.gb_payor=create gb_payor
this.gb_1=create gb_1
this.dw_facility=create dw_facility
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_2
this.Control[iCurrent+2]=this.dw_app_addresses
this.Control[iCurrent+3]=this.dw_practice_addresses
this.Control[iCurrent+4]=this.gb_client
this.Control[iCurrent+5]=this.gb_payor
this.Control[iCurrent+6]=this.gb_1
this.Control[iCurrent+7]=this.dw_facility
end on

on w_contact_information.destroy
call super::destroy
destroy(this.cb_2)
destroy(this.dw_app_addresses)
destroy(this.dw_practice_addresses)
destroy(this.gb_client)
destroy(this.gb_payor)
destroy(this.gb_1)
destroy(this.dw_facility)
end on

event open;call super::open;Integer li_retval
Long ll_prac_id
Long ll_app_facility_id
Long li_facility_id
Long ll_app_id

gs_pass_ids str_ids
str_ids = Message.PowerObjectParm

dw_app_addresses.of_SetTransObject( SQLCA )
dw_practice_addresses.of_SetTransObject( SQLCA )
dw_facility.of_SetTransObject( SQLCA )

ll_prac_id = str_ids.prac_id
li_facility_id = str_ids.facility_id
ll_app_id = str_ids.l_app_id

//messagebox( "prac_id", ll_prac_id )
//messagebox( "facility" , li_facility_id )
//messagebox( "app",  ll_app_id )

SELECT facility_id
INTO :ll_app_facility_id
FROM app_hdr
WHERE app_id = :ll_app_id;
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-01
//$<add> 02.16.2006 By: Cao YongWang
//$<reason> Performance tuning.
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.
gnv_appeondb.of_startqueue()
//---------------------------- APPEON END ----------------------------

dw_app_addresses.Retrieve( ll_app_facility_id )
dw_facility.Retrieve( li_facility_id )
dw_practice_addresses.Retrieve( ll_prac_id, li_facility_id )
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-02
//$<add> 02.16.2006 By: Cao YongWang
//$<reason> Performance tuning.
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.
gnv_appeondb.of_commitqueue()
//---------------------------- APPEON END ----------------------------

gb_client.Text = str_ids.sl_label1 + " Contact Info"
gb_payor.Text = str_ids.sl_label2 + " Contact Info"
end event

type cb_2 from commandbutton within w_contact_information
integer x = 2350
integer y = 16
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
string text = "&Close"
boolean default = true
end type

event clicked;Close( Parent )
end event

type dw_app_addresses from u_dw within w_contact_information
integer x = 1490
integer y = 1104
integer width = 1065
integer height = 760
integer taborder = 10
boolean bringtotop = true
string dataobject = "d_contact_application"
boolean vscrollbar = false
boolean livescroll = false
borderstyle borderstyle = stylebox!
end type

type dw_practice_addresses from u_dw within w_contact_information
integer x = 110
integer y = 200
integer width = 1230
integer height = 1668
integer taborder = 20
boolean bringtotop = true
string dataobject = "d_contact_prac_address"
end type

type gb_client from groupbox within w_contact_information
integer x = 1449
integer y = 128
integer width = 1157
integer height = 880
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "Client Contact Information"
end type

type gb_payor from groupbox within w_contact_information
integer x = 1449
integer y = 1036
integer width = 1157
integer height = 880
integer taborder = 50
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "Payor/Application Contact Information"
end type

type gb_1 from groupbox within w_contact_information
integer x = 59
integer y = 128
integer width = 1326
integer height = 1784
integer taborder = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "Practice Address Contact Information"
end type

type dw_facility from u_dw within w_contact_information
integer x = 1490
integer y = 196
integer width = 1065
integer height = 760
integer taborder = 11
boolean bringtotop = true
string dataobject = "d_contact_facility"
boolean vscrollbar = false
boolean livescroll = false
borderstyle borderstyle = stylebox!
end type

