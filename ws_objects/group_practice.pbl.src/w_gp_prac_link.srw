$PBExportHeader$w_gp_prac_link.srw
forward
global type w_gp_prac_link from window
end type
type cbx_wait from checkbox within w_gp_prac_link
end type
type cbx_cust from checkbox within w_gp_prac_link
end type
type cbx_hours from checkbox within w_gp_prac_link
end type
type cbx_access from checkbox within w_gp_prac_link
end type
type cbx_address from checkbox within w_gp_prac_link
end type
type sle_phone from singlelineedit within w_gp_prac_link
end type
type sle_street from singlelineedit within w_gp_prac_link
end type
type sle_group from singlelineedit within w_gp_prac_link
end type
type rb_phone from radiobutton within w_gp_prac_link
end type
type rb_street from radiobutton within w_gp_prac_link
end type
type rb_group from radiobutton within w_gp_prac_link
end type
type dw_link from datawindow within w_gp_prac_link
end type
type dw_find from datawindow within w_gp_prac_link
end type
type cb_help from commandbutton within w_gp_prac_link
end type
type cb_close from commandbutton within w_gp_prac_link
end type
type cb_link from commandbutton within w_gp_prac_link
end type
type gb_2 from groupbox within w_gp_prac_link
end type
type gb_1 from groupbox within w_gp_prac_link
end type
type cb_find from commandbutton within w_gp_prac_link
end type
end forward

global type w_gp_prac_link from window
integer x = 256
integer y = 148
integer width = 2976
integer height = 2152
boolean titlebar = true
string title = "Link Practitioners to Group Practice"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 79741120
cbx_wait cbx_wait
cbx_cust cbx_cust
cbx_hours cbx_hours
cbx_access cbx_access
cbx_address cbx_address
sle_phone sle_phone
sle_street sle_street
sle_group sle_group
rb_phone rb_phone
rb_street rb_street
rb_group rb_group
dw_link dw_link
dw_find dw_find
cb_help cb_help
cb_close cb_close
cb_link cb_link
gb_2 gb_2
gb_1 gb_1
cb_find cb_find
end type
global w_gp_prac_link w_gp_prac_link

on w_gp_prac_link.create
this.cbx_wait=create cbx_wait
this.cbx_cust=create cbx_cust
this.cbx_hours=create cbx_hours
this.cbx_access=create cbx_access
this.cbx_address=create cbx_address
this.sle_phone=create sle_phone
this.sle_street=create sle_street
this.sle_group=create sle_group
this.rb_phone=create rb_phone
this.rb_street=create rb_street
this.rb_group=create rb_group
this.dw_link=create dw_link
this.dw_find=create dw_find
this.cb_help=create cb_help
this.cb_close=create cb_close
this.cb_link=create cb_link
this.gb_2=create gb_2
this.gb_1=create gb_1
this.cb_find=create cb_find
this.Control[]={this.cbx_wait,&
this.cbx_cust,&
this.cbx_hours,&
this.cbx_access,&
this.cbx_address,&
this.sle_phone,&
this.sle_street,&
this.sle_group,&
this.rb_phone,&
this.rb_street,&
this.rb_group,&
this.dw_link,&
this.dw_find,&
this.cb_help,&
this.cb_close,&
this.cb_link,&
this.gb_2,&
this.gb_1,&
this.cb_find}
end on

on w_gp_prac_link.destroy
destroy(this.cbx_wait)
destroy(this.cbx_cust)
destroy(this.cbx_hours)
destroy(this.cbx_access)
destroy(this.cbx_address)
destroy(this.sle_phone)
destroy(this.sle_street)
destroy(this.sle_group)
destroy(this.rb_phone)
destroy(this.rb_street)
destroy(this.rb_group)
destroy(this.dw_link)
destroy(this.dw_find)
destroy(this.cb_help)
destroy(this.cb_close)
destroy(this.cb_link)
destroy(this.gb_2)
destroy(this.gb_1)
destroy(this.cb_find)
end on

event open;long gp_id
long rc

gp_id = message.doubleparm

//messagebox ("gp_id",gp_id)
dw_find.settransobject(sqlca)
rc = dw_find.retrieve(gp_id)
if rc < 1 then return
dw_link.settransobject(sqlca)

sle_group.text = dw_find.getitemstring(1,"street")
sle_street.text = dw_find.getitemstring(1,"street_2")
sle_phone.text = dw_find.getitemstring(1,"phone")

gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17

end event

type cbx_wait from checkbox within w_gp_prac_link
integer x = 1883
integer y = 448
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

type cbx_cust from checkbox within w_gp_prac_link
integer x = 1883
integer y = 288
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

type cbx_hours from checkbox within w_gp_prac_link
integer x = 1883
integer y = 368
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

type cbx_access from checkbox within w_gp_prac_link
integer x = 1883
integer y = 208
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

type cbx_address from checkbox within w_gp_prac_link
integer x = 1883
integer y = 128
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

type sle_phone from singlelineedit within w_gp_prac_link
integer x = 375
integer y = 420
integer width = 1321
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type sle_street from singlelineedit within w_gp_prac_link
integer x = 375
integer y = 276
integer width = 1321
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type sle_group from singlelineedit within w_gp_prac_link
integer x = 375
integer y = 132
integer width = 1321
integer height = 96
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type rb_phone from radiobutton within w_gp_prac_link
integer x = 105
integer y = 424
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
string text = "Phone"
boolean checked = true
end type

type rb_street from radiobutton within w_gp_prac_link
integer x = 105
integer y = 284
integer width = 261
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Street 2"
end type

type rb_group from radiobutton within w_gp_prac_link
integer x = 105
integer y = 140
integer width = 247
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Street 1"
end type

type dw_link from datawindow within w_gp_prac_link
integer x = 41
integer y = 696
integer width = 2853
integer height = 1232
integer taborder = 80
string dataobject = "d_gp_pracs_linking2"
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
	//--------------------------- APPEON BEGIN ---------------------------
	//$<modify> 08.04.2006 By: LeiWei
	//$<reason> Fix a defect.
	//this.setitem(r,"pd_address_cust_6","1")
	this.setitem(r,"selected",1)
	//---------------------------- APPEON END ----------------------------
next

end event

type dw_find from datawindow within w_gp_prac_link
boolean visible = false
integer x = 827
integer y = 608
integer width = 375
integer height = 68
integer taborder = 70
string dataobject = "d_gp_criteria_select"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_help from commandbutton within w_gp_prac_link
integer x = 2373
integer y = 580
integer width = 247
integer height = 84
integer taborder = 40
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

type cb_close from commandbutton within w_gp_prac_link
integer x = 2647
integer y = 580
integer width = 247
integer height = 84
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Close"
end type

event clicked;close(parent)
end event

type cb_link from commandbutton within w_gp_prac_link
integer x = 1792
integer y = 580
integer width = 553
integer height = 84
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Update Pratitioner Data"
end type

event clicked;integer r
long rc
integer res
long cnt //maha022208

rc = dw_link.rowcount()

if rc < 1 then
	messagebox("No practitioners to link","Use find first.")
	return
end if

//Start Code Change ----02.22.2008 #V8 maha - additional trapping
for r = 1 to rc
	if dw_link.getitemnumber(r,"selected") = 1 then
		cnt++
	end if
next

if cnt = 0 then 
	messagebox("No records selected","Please select records to update.")
	return
end if

res = messagebox("Address Update","You have " + string(cnt) + " records selected to update.~r~rDo you wish to continue update?",question!,yesno!,2)
if res = 2 then
	return
end if
//End Code Change---02.22.2008

if cbx_address.checked = false then
	res = messagebox("Address Update Not Checked","You have unchecked the Address update checkbox.  If you continue you can potentially link Address records to this practice that to not have that address.~r~rDo you want to continue?",question!,yesno!,2)
	if res = 2 then
		return
	end if
end if


for r = 1 to rc
	//--------------------------- APPEON BEGIN ---------------------------
	//$<modify> 08.04.2006 By: LeiWei
	//$<reason> Fix a defect.
	//if dw_link.getitemstring(r,"pd_address_cust_6") = "1" then
	if dw_link.getitemnumber(r,"selected") = 1 then
	//---------------------------- APPEON END ----------------------------
		if cbx_address.checked = true then
			dw_link.setitem(r,"pd_address_street",dw_find.getitemstring(1,"street"))
			dw_link.setitem(r,"pd_address_street_2",dw_find.getitemstring(1,"street_2"))
			dw_link.setitem(r,"pd_address_city",dw_find.getitemstring(1,"city"))
			dw_link.setitem(r,"pd_address_state",dw_find.getitemnumber(1,"state"))
			dw_link.setitem(r,"pd_address_zip",dw_find.getitemstring(1,"zip"))
			dw_link.setitem(r,"pd_address_county",dw_find.getitemnumber(1,"county"))
			dw_link.setitem(r,"pd_address_country",dw_find.getitemnumber(1,"country"))
			dw_link.setitem(r,"pd_address_phone",dw_find.getitemstring(1,"phone"))
			dw_link.setitem(r,"pd_address_fax",dw_find.getitemstring(1,"fax"))
			dw_link.setitem(r,"pd_address_e_mail_address",dw_find.getitemstring(1,"e_mail_address"))
			dw_link.setitem(r,"pd_address_web_address",dw_find.getitemstring(1,"web_address"))
			dw_link.setitem(r,"pd_address_contact_person",dw_find.getitemstring(1,"contact_person"))
			dw_link.setitem(r,"pd_address_business_mgr",dw_find.getitemstring(1,"business_mgr"))
			dw_link.setitem(r,"pd_address_office_mgr",dw_find.getitemstring(1,"office_mgr"))
			dw_link.setitem(r,"pd_address_tax_id",dw_find.getitemstring(1,"tax_id"))
			dw_link.setitem(r,"pd_address_gp_id",dw_find.getitemnumber(1,"rec_id"))
		end if	
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
	end if
next

//res = messagebox("Updates completed","Do you want to save changes?",question!,yesno!,2)
//if res = 1 then 
	dw_link.Object.DataWindow.Table.UpdateTable='pd_address'
	dw_link.update()
	commit using sqlca;
//end if
end event

type gb_2 from groupbox within w_gp_prac_link
integer x = 1792
integer y = 44
integer width = 736
integer height = 516
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Select Data to Update"
end type

type gb_1 from groupbox within w_gp_prac_link
integer x = 41
integer y = 40
integer width = 1719
integer height = 516
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Select  Address Criteria to Search"
end type

type cb_find from commandbutton within w_gp_prac_link
integer x = 1509
integer y = 580
integer width = 247
integer height = 84
integer taborder = 90
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Find"
end type

event clicked;string ls_sql
string ls_sql_org
string ls_group
string ls_street
string ls_phone
integer rows
integer chk //maha 022208

ls_sql = dw_link.Object.DataWindow.Table.Select	
ls_sql_org = ls_sql
ls_group = upper(sle_group.text)
ls_street = upper(sle_street.text)
ls_phone = sle_phone.text

//Start Code Change ----02.22.2008 #V8 maha - monkey trap
if rb_group.checked = true then
	if len(ls_group) = 0 then chk = 1	
elseif rb_street.checked = true then
	if len(ls_street) = 0 then chk = 1	
elseif rb_phone.checked = true then
	if len(ls_phone) = 0 then chk = 1	
end if

if chk = 1 then
	messagebox("User Error","You must have a search value for the selected Search Criteria")
	return
end if
//End Code Change---02.22.2008
if rb_group.checked = true then
	ls_sql = ls_sql + " and upper(street) like '%" + ls_group + "%'"
elseif rb_street.checked = true then
	ls_sql = ls_sql + " and upper(street_2) like '%" + ls_street + "%'"
elseif rb_phone.checked = true then
	ls_sql = ls_sql + " and phone like '%" + ls_phone + "%'"
end if

dw_link.SetSQLSelect ( ls_sql )
		//openwithparm( w_sql_msg, ls_sql )
dw_link.SetTransObject( SQLCA )
rows = dw_link.Retrieve()

if rows < 1 then
		messagebox("No records found","There are no Practitioners' address data that meet the specified search criteria")
end if

//reset to org after retrieval
dw_link.SetSQLSelect ( ls_sql_org )
dw_link.SetTransObject( SQLCA )
end event

