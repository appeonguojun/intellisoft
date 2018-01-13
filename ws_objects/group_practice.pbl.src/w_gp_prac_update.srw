$PBExportHeader$w_gp_prac_update.srw
forward
global type w_gp_prac_update from window
end type
type cbx_email from checkbox within w_gp_prac_update
end type
type cbx_wait from checkbox within w_gp_prac_update
end type
type cbx_cust from checkbox within w_gp_prac_update
end type
type cbx_hours from checkbox within w_gp_prac_update
end type
type cbx_access from checkbox within w_gp_prac_update
end type
type cbx_address from checkbox within w_gp_prac_update
end type
type dw_link from datawindow within w_gp_prac_update
end type
type dw_find from datawindow within w_gp_prac_update
end type
type cb_help from commandbutton within w_gp_prac_update
end type
type cb_close from commandbutton within w_gp_prac_update
end type
type gb_2 from groupbox within w_gp_prac_update
end type
type cb_link from commandbutton within w_gp_prac_update
end type
end forward

global type w_gp_prac_update from window
integer x = 1074
integer y = 736
integer width = 965
integer height = 1084
boolean titlebar = true
string title = "Update Associated Practitioners"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
cbx_email cbx_email
cbx_wait cbx_wait
cbx_cust cbx_cust
cbx_hours cbx_hours
cbx_access cbx_access
cbx_address cbx_address
dw_link dw_link
dw_find dw_find
cb_help cb_help
cb_close cb_close
gb_2 gb_2
cb_link cb_link
end type
global w_gp_prac_update w_gp_prac_update

on w_gp_prac_update.create
this.cbx_email=create cbx_email
this.cbx_wait=create cbx_wait
this.cbx_cust=create cbx_cust
this.cbx_hours=create cbx_hours
this.cbx_access=create cbx_access
this.cbx_address=create cbx_address
this.dw_link=create dw_link
this.dw_find=create dw_find
this.cb_help=create cb_help
this.cb_close=create cb_close
this.gb_2=create gb_2
this.cb_link=create cb_link
this.Control[]={this.cbx_email,&
this.cbx_wait,&
this.cbx_cust,&
this.cbx_hours,&
this.cbx_access,&
this.cbx_address,&
this.dw_link,&
this.dw_find,&
this.cb_help,&
this.cb_close,&
this.gb_2,&
this.cb_link}
end on

on w_gp_prac_update.destroy
destroy(this.cbx_email)
destroy(this.cbx_wait)
destroy(this.cbx_cust)
destroy(this.cbx_hours)
destroy(this.cbx_access)
destroy(this.cbx_address)
destroy(this.dw_link)
destroy(this.dw_find)
destroy(this.cb_help)
destroy(this.cb_close)
destroy(this.gb_2)
destroy(this.cb_link)
end on

event open;integer gp_id
integer rc

gp_id = message.doubleparm

//messagebox ("gp_id",gp_id)
dw_find.settransobject(sqlca)

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 02.13.2006 By: LeiWei
//$<reason> Performance tuning
//$<reason> Reduce the frequency of client-server interactions to improve runtime performance.
//$<reason> Add the Appeon Queue Labels. 
gnv_appeondb.of_startqueue( )
//---------------------------- APPEON END ----------------------------

rc = dw_find.retrieve(gp_id)
dw_link.settransobject(sqlca)
dw_link.retrieve(gp_id)

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 02.13.2006 By: LeiWei
//$<reason> Performance tuning
//$<reason> Reduce the frequency of client-server interactions to improve runtime performance.
//$<reason> Add an Appeon Commit Queue Label. 
gnv_appeondb.of_commitqueue( )
rc = dw_find.rowcount( )
//---------------------------- APPEON END ----------------------------


if rc < 1 then close(this)

gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17


end event

type cbx_email from checkbox within w_gp_prac_update
integer x = 178
integer y = 196
integer width = 613
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Overwrite Existing Email "
end type

type cbx_wait from checkbox within w_gp_prac_update
integer x = 178
integer y = 516
integer width = 425
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Waiting Times"
end type

type cbx_cust from checkbox within w_gp_prac_update
integer x = 178
integer y = 356
integer width = 430
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Custom Fields"
end type

type cbx_hours from checkbox within w_gp_prac_update
integer x = 178
integer y = 436
integer width = 247
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Hours"
end type

type cbx_access from checkbox within w_gp_prac_update
integer x = 178
integer y = 276
integer width = 571
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Access Information"
end type

type cbx_address from checkbox within w_gp_prac_update
integer x = 178
integer y = 120
integer width = 603
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Address and Contacts"
boolean checked = true
end type

type dw_link from datawindow within w_gp_prac_update
boolean visible = false
integer x = 763
integer y = 612
integer width = 146
integer height = 72
integer taborder = 50
string dataobject = "d_gp_pracs_update"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event buttonclicked;integer r
long rc

rc = this.rowcount()

if rc < 1 then return

//messagebox("rc",rc)
for r = 1 to rc
	this.setitem(r,"pd_address_cust_6","1")
next
end event

type dw_find from datawindow within w_gp_prac_update
boolean visible = false
integer x = 41
integer y = 580
integer width = 55
integer height = 52
integer taborder = 40
string dataobject = "d_gp_criteria_select"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_help from commandbutton within w_gp_prac_update
integer x = 1102
integer y = 200
integer width = 247
integer height = 108
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Help"
end type

event clicked;messagebox("Linking Practitioners to Practices","To link existing practitioners' addresses to a group practice, start by selecting a criteria type.~r  You can change the search parameter for that type if you wish. For example: ('Main' instead of '123 Main St').~r  When you click the find button, any addresses that match your criteria will be retrieved to the records window.~r  Select the practitioners you wish to link by clicking the check box for that practitioner.~r If the chain icon appears under the select box, that pratitioner has previously been linked.~r  The select data checkboxes allow you to decide which data fields get copied from the Group Practice file to the Practitioner's address file.~r You can select any or none. If you select none, the GP-Practitioner link will still be made.~r Click Update Practitioner Data to complete the update."  )
end event

type cb_close from commandbutton within w_gp_prac_update
integer x = 165
integer y = 788
integer width = 581
integer height = 84
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Cancel"
end type

event clicked;close(parent)
end event

type gb_2 from groupbox within w_gp_prac_update
integer x = 87
integer y = 36
integer width = 736
integer height = 596
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "Select Data to Update"
end type

type cb_link from commandbutton within w_gp_prac_update
integer x = 165
integer y = 676
integer width = 581
integer height = 84
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Update Practitioner Data"
end type

event clicked;integer r
long rc
integer res
string ls_phone //maha 061008

rc = dw_link.rowcount()

if rc < 1 then
	messagebox("No data to update","There are no practitioner address records connected to this location.")
	return
end if

for r = 1 to rc
	if cbx_address.checked = true then
		dw_link.setitem(r,"pd_address_street",dw_find.getitemstring(1,"street"))
		dw_link.setitem(r,"pd_address_street_2",dw_find.getitemstring(1,"street_2"))
		dw_link.setitem(r,"pd_address_city",dw_find.getitemstring(1,"city"))
		dw_link.setitem(r,"pd_address_state",dw_find.getitemnumber(1,"state"))
		dw_link.setitem(r,"pd_address_zip",dw_find.getitemstring(1,"zip"))
		dw_link.setitem(r,"pd_address_county",dw_find.getitemnumber(1,"county"))
		dw_link.setitem(r,"pd_address_country",dw_find.getitemnumber(1,"country"))
		//Start Code Change ----06.10.2008 #V81 maha - strip format characters
		ls_phone =  of_strip_char("",dw_find.getitemstring(1,"phone") ,"@NUM@")
		dw_link.setitem(r,"pd_address_phone",ls_phone)
		//End Code Change---06.10.2008
		dw_link.setitem(r,"pd_address_fax",dw_find.getitemstring(1,"fax"))
		dw_link.setitem(r,"pd_address_suite_apart",dw_find.getitemstring(1,"suite_apart"))  //Start Code Change ---- 10.27.2006 #1 maha
		if isnull(dw_link.getitemstring(r,"pd_address_e_mail_address")) then //maha 090805 to not overwrite existing data in prac record
			dw_link.setitem(r,"pd_address_e_mail_address",dw_find.getitemstring(1,"e_mail_address"))
		end if
		dw_link.setitem(r,"pd_address_web_address",dw_find.getitemstring(1,"web_address"))
		dw_link.setitem(r,"pd_address_contact_person",dw_find.getitemstring(1,"contact_person"))
		dw_link.setitem(r,"pd_address_business_mgr",dw_find.getitemstring(1,"business_mgr"))
		dw_link.setitem(r,"pd_address_office_mgr",dw_find.getitemstring(1,"office_mgr"))
		dw_link.setitem(r,"pd_address_tax_id",dw_find.getitemstring(1,"tax_id"))
		if isnull(dw_link.getitemstring(r,"pd_address_tax_id_other_1")) then
			dw_link.setitem(r,"pd_address_tax_id_other_1",dw_find.getitemstring(1,"tax_id_other_1")) //maha 101404
		end if	
		if isnull(dw_link.getitemstring(r,"pd_address_tax_id_other_2")) then
			dw_link.setitem(r,"pd_address_tax_id_other_2",dw_find.getitemstring(1,"tax_id_other_2"))
		end if
		dw_link.setitem(r,"pd_address_gp_id",dw_find.getitemnumber(1,"rec_id"))
	end if	
	//Start Code Change ----04.21.2008 #V8 maha - allows overwrite of email address
	if cbx_email.checked = true then
		dw_link.setitem(r,"pd_address_e_mail_address",dw_find.getitemstring(1,"e_mail_address"))
	end if
	//End Code Change---04.21.2008
	if cbx_wait.checked = true then
		dw_link.setitem(r,"pd_address_routine_visit_appt",dw_find.getitemstring(1,"routine_visit_appt"))
		dw_link.setitem(r,"pd_address_urgent_visit_appt",dw_find.getitemstring(1,"urgent_visit_appt"))
		dw_link.setitem(r,"pd_address_emergency_visit_appt",dw_find.getitemstring(1,"emergency_visit_appt"))
		dw_link.setitem(r,"pd_address_non_emergency_appt",dw_find.getitemstring(1,"non_emergency_appt"))
	end if
	
	if cbx_access.checked = true then
		dw_link.setitem(r,"pd_address_handicapped_access",dw_find.getitemnumber(1,"handicapped_access"))
		dw_link.setitem(r,"pd_address_public_transportation",dw_find.getitemnumber(1,"public_transportation"))
	end if
	
	if cbx_hours.checked = true then	
		dw_link.setitem(r,"pd_address_mon_from",dw_find.getitemstring(1,"mon_from"))
		dw_link.setitem(r,"pd_address_mon_to",dw_find.getitemstring(1,"mon_to"))
		dw_link.setitem(r,"pd_address_tue_from",dw_find.getitemstring(1,"tue_from"))
		dw_link.setitem(r,"pd_address_tue_to",dw_find.getitemstring(1,"tue_to"))
		dw_link.setitem(r,"pd_address_wed_from",dw_find.getitemstring(1,"wed_from"))
		dw_link.setitem(r,"pd_address_wed_to",dw_find.getitemstring(1,"wed_to"))
		dw_link.setitem(r,"pd_address_thu_from",dw_find.getitemstring(1,"thu_from"))
		dw_link.setitem(r,"pd_address_thu_to",dw_find.getitemstring(1,"thu_to"))
		dw_link.setitem(r,"pd_address_fri_from",dw_find.getitemstring(1,"fri_from"))
		dw_link.setitem(r,"pd_address_fri_to",dw_find.getitemstring(1,"fri_to"))
		dw_link.setitem(r,"pd_address_sat_from",dw_find.getitemstring(1,"sat_from"))
		dw_link.setitem(r,"pd_address_sat_to",dw_find.getitemstring(1,"sat_to"))
		dw_link.setitem(r,"pd_address_sun_from",dw_find.getitemstring(1,"sun_from"))
		dw_link.setitem(r,"pd_address_sun_to",dw_find.getitemstring(1,"sun_to"))
		
		dw_link.setitem(r,"pd_address_mon_from2",dw_find.getitemstring(1,"mon_from2"))
		dw_link.setitem(r,"pd_address_mon_to2",dw_find.getitemstring(1,"mon_to2"))
		dw_link.setitem(r,"pd_address_tue_from2",dw_find.getitemstring(1,"tue_from2"))
		dw_link.setitem(r,"pd_address_tue_to2",dw_find.getitemstring(1,"tue_to2"))
		dw_link.setitem(r,"pd_address_wed_from2",dw_find.getitemstring(1,"wed_from2"))
		dw_link.setitem(r,"pd_address_wed_to2",dw_find.getitemstring(1,"wed_to2"))
		dw_link.setitem(r,"pd_address_thu_from2",dw_find.getitemstring(1,"thu_from2"))
		dw_link.setitem(r,"pd_address_thu_to2",dw_find.getitemstring(1,"thu_to2"))
		dw_link.setitem(r,"pd_address_fri_from2",dw_find.getitemstring(1,"fri_from2"))
		dw_link.setitem(r,"pd_address_fri_to2",dw_find.getitemstring(1,"fri_to2"))
		dw_link.setitem(r,"pd_address_sat_from2",dw_find.getitemstring(1,"sat_from2"))
		dw_link.setitem(r,"pd_address_sat_to2",dw_find.getitemstring(1,"sat_to2"))
		dw_link.setitem(r,"pd_address_sun_from2",dw_find.getitemstring(1,"sun_from2"))
		dw_link.setitem(r,"pd_address_sun_to2",dw_find.getitemstring(1,"sun_to2"))
	end if
	
	if cbx_cust.checked = true then			
		dw_link.setitem(r,"pd_address_cust_1",dw_find.getitemstring(1,"cust_1"))
		dw_link.setitem(r,"pd_address_cust_2",dw_find.getitemstring(1,"cust_2"))
		dw_link.setitem(r,"pd_address_cust_3",dw_find.getitemstring(1,"cust_3"))
		dw_link.setitem(r,"pd_address_cust_4",dw_find.getitemstring(1,"cust_4"))
		dw_link.setitem(r,"pd_address_cust_5",dw_find.getitemstring(1,"cust_5"))
	end if
//end if
next

//res = messagebox("Updates completed","Do you want to save changes?",question!,yesno!,2)
//if res = 1 then 
	dw_link.Object.DataWindow.Table.UpdateTable='pd_address'

	//--------------------------- APPEON BEGIN ---------------------------
	//$<add> 02.13.2006 By: LeiWei
	//$<reason> Performance tuning
	//$<reason> Reduce the frequency of client-server interactions to improve runtime performance.
	//$<reason> Add the Appeon Queue Labels. 
	gnv_appeondb.of_autocommit( )
	//---------------------------- APPEON END ----------------------------
	dw_link.update()
	commit using sqlca;
//end if
close(parent)
end event

