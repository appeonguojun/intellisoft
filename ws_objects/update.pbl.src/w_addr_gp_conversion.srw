$PBExportHeader$w_addr_gp_conversion.srw
forward
global type w_addr_gp_conversion from window
end type
type cb_1 from commandbutton within w_addr_gp_conversion
end type
type st_1 from statictext within w_addr_gp_conversion
end type
type dw_find from datawindow within w_addr_gp_conversion
end type
type cbx_wait from checkbox within w_addr_gp_conversion
end type
type cbx_cust from checkbox within w_addr_gp_conversion
end type
type cbx_hours from checkbox within w_addr_gp_conversion
end type
type cbx_access from checkbox within w_addr_gp_conversion
end type
type cbx_address from checkbox within w_addr_gp_conversion
end type
type dw_link from datawindow within w_addr_gp_conversion
end type
type dw_phones from datawindow within w_addr_gp_conversion
end type
type cb_help from commandbutton within w_addr_gp_conversion
end type
type cb_close from commandbutton within w_addr_gp_conversion
end type
type cb_link from commandbutton within w_addr_gp_conversion
end type
type gb_2 from groupbox within w_addr_gp_conversion
end type
type cb_find from commandbutton within w_addr_gp_conversion
end type
end forward

global type w_addr_gp_conversion from window
integer x = 256
integer y = 148
integer width = 3150
integer height = 2084
boolean titlebar = true
string title = "Link Practitioners to Group Practice"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 79741120
cb_1 cb_1
st_1 st_1
dw_find dw_find
cbx_wait cbx_wait
cbx_cust cbx_cust
cbx_hours cbx_hours
cbx_access cbx_access
cbx_address cbx_address
dw_link dw_link
dw_phones dw_phones
cb_help cb_help
cb_close cb_close
cb_link cb_link
gb_2 gb_2
cb_find cb_find
end type
global w_addr_gp_conversion w_addr_gp_conversion

type variables
long il_rec
end variables

on w_addr_gp_conversion.create
this.cb_1=create cb_1
this.st_1=create st_1
this.dw_find=create dw_find
this.cbx_wait=create cbx_wait
this.cbx_cust=create cbx_cust
this.cbx_hours=create cbx_hours
this.cbx_access=create cbx_access
this.cbx_address=create cbx_address
this.dw_link=create dw_link
this.dw_phones=create dw_phones
this.cb_help=create cb_help
this.cb_close=create cb_close
this.cb_link=create cb_link
this.gb_2=create gb_2
this.cb_find=create cb_find
this.Control[]={this.cb_1,&
this.st_1,&
this.dw_find,&
this.cbx_wait,&
this.cbx_cust,&
this.cbx_hours,&
this.cbx_access,&
this.cbx_address,&
this.dw_link,&
this.dw_phones,&
this.cb_help,&
this.cb_close,&
this.cb_link,&
this.gb_2,&
this.cb_find}
end on

on w_addr_gp_conversion.destroy
destroy(this.cb_1)
destroy(this.st_1)
destroy(this.dw_find)
destroy(this.cbx_wait)
destroy(this.cbx_cust)
destroy(this.cbx_hours)
destroy(this.cbx_access)
destroy(this.cbx_address)
destroy(this.dw_link)
destroy(this.dw_phones)
destroy(this.cb_help)
destroy(this.cb_close)
destroy(this.cb_link)
destroy(this.gb_2)
destroy(this.cb_find)
end on

event open;//integer gp_id
//integer rc
//
//gp_id = message.doubleparm
//
////messagebox ("gp_id",gp_id)
//dw_find.settransobject(sqlca)
//rc = dw_find.retrieve(gp_id)
//if rc < 1 then return
//dw_link.settransobject(sqlca)
//
//sle_group.text = dw_find.getitemstring(1,"street")
//sle_street.text = dw_find.getitemstring(1,"street_2")
//sle_phone.text = dw_find.getitemstring(1,"phone")
//
gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17

end event

type cb_1 from commandbutton within w_addr_gp_conversion
integer x = 923
integer y = 292
integer width = 247
integer height = 108
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Save"
end type

event clicked;integer res


	res = dw_link.update()
	commit using sqlca;
if res < 1 then 
	messagebox("Error","Unable to save.")
	return
end if
end event

type st_1 from statictext within w_addr_gp_conversion
boolean visible = false
integer x = 261
integer y = 432
integer width = 2514
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 16711680
long backcolor = 67108864
boolean enabled = false
string text = "Please select one address to use as the practice location and click the create location button"
boolean focusrectangle = false
end type

type dw_find from datawindow within w_addr_gp_conversion
integer x = 59
integer y = 524
integer width = 2962
integer height = 860
integer taborder = 30
string dataobject = "d_gp_pracs_linking3"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
end event

type cbx_wait from checkbox within w_addr_gp_conversion
integer x = 1655
integer y = 136
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
boolean checked = true
end type

type cbx_cust from checkbox within w_addr_gp_conversion
integer x = 1056
integer y = 144
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
boolean checked = true
end type

type cbx_hours from checkbox within w_addr_gp_conversion
integer x = 1655
integer y = 56
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
boolean checked = true
end type

type cbx_access from checkbox within w_addr_gp_conversion
integer x = 1056
integer y = 64
integer width = 562
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
boolean checked = true
end type

type cbx_address from checkbox within w_addr_gp_conversion
boolean visible = false
integer x = 1056
integer y = 56
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

type dw_link from datawindow within w_addr_gp_conversion
integer x = 46
integer y = 1396
integer width = 2976
integer height = 496
integer taborder = 60
string dataobject = "d_gp_conv"
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

event constructor;this.settransobject(sqlca)
end event

type dw_phones from datawindow within w_addr_gp_conversion
integer x = 512
integer y = 24
integer width = 375
integer height = 376
integer taborder = 50
string dataobject = "d_all_address_phones"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event buttonclicked;integer i
integer rc

rc = this.rowcount()

i = this.getrow()

i++
this.scrolltorow(i)
this.setrow(i)
this.selectrow(0,false)
this.selectrow(1,true)
end event

event rowfocuschanged;string addr



addr = this.getitemstring(currentrow,"phone")
dw_find.settransobject(sqlca)
dw_find.retrieve(addr)
st_1.visible = true
end event

event constructor;this.settransobject(sqlca)
end event

type cb_help from commandbutton within w_addr_gp_conversion
integer x = 2811
integer y = 188
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

event clicked;messagebox("Creating Practice Locations","To create practice locations from existing practitioners' addresses, start by clicking the START button.~r  		Click on the NEXT button to retrieve the addresses for the next phone number in the Phone list.~r  		Select the checkbox of the one address in the address window that you wish to use as a practice location.  		Click the CREATE LOCATION button to add the Location. ~r  		If you wish to create a second location from the same address list, deselect the original address and select the new one.~r 		When you have finished Creating the locations, click SAVE to save the new locations into the database."  )
end event

type cb_close from commandbutton within w_addr_gp_conversion
integer x = 2811
integer y = 52
integer width = 247
integer height = 108
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

type cb_link from commandbutton within w_addr_gp_conversion
integer x = 46
integer y = 300
integer width = 434
integer height = 108
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Create Location"
end type

event clicked;integer r
integer f
long rc

integer res
integer check = 0

rc = dw_find.rowcount()

if rc < 1 then
	messagebox("No practitioners to link","Use find first.")
	return
end if


il_rec++

for f = 1 to rc
	if dw_find.getitemstring(f,"pd_address_cust_6") = "1" then
		r = dw_link.insertrow(0)
		dw_link.setitem(r,"street",dw_find.getitemstring(f,"pd_address_street"))
		dw_link.setitem(r,"street_2",dw_find.getitemstring(f,"pd_address_street_2"))
		dw_link.setitem(r,"city",dw_find.getitemstring(f,"pd_address_city"))
		dw_link.setitem(r,"state",dw_find.getitemnumber(f,"pd_address_state"))
		dw_link.setitem(r,"zip",dw_find.getitemstring(f,"pd_address_zip"))
		dw_link.setitem(r,"county",dw_find.getitemnumber(f,"pd_address_county"))
		dw_link.setitem(r,"country",dw_find.getitemnumber(f,"pd_address_country"))
		dw_link.setitem(r,"phone",dw_find.getitemstring(f,"pd_address_phone"))
		dw_link.setitem(r,"fax",dw_find.getitemstring(f,"pd_address_fax"))
		dw_link.setitem(r,"e_mail_address",dw_find.getitemstring(f,"pd_address_e_mail_address"))
		dw_link.setitem(r,"web_address",dw_find.getitemstring(f,"pd_address_web_address"))
		dw_link.setitem(r,"contact_person",dw_find.getitemstring(f,"pd_address_contact_person"))
		dw_link.setitem(r,"business_mgr",dw_find.getitemstring(f,"pd_address_business_mgr"))
		dw_link.setitem(r,"office_mgr",dw_find.getitemstring(f,"pd_address_office_mgr"))
		dw_link.setitem(r,"tax_id",dw_find.getitemstring(f,"pd_address_tax_id"))
		dw_link.setitem(r,"rec_id",il_rec)
				
		if cbx_wait.checked = true then
			dw_link.setitem(r,"routine_visit_appt",dw_find.getitemstring(f,"pd_address_routine_visit_appt"))
			dw_link.setitem(r,"urgent_visit_appt",dw_find.getitemstring(f,"pd_address_urgent_visit_appt"))
			dw_link.setitem(r,"emergency_visit_appt",dw_find.getitemstring(f,"pd_address_emergency_visit_appt"))
			dw_link.setitem(r,"non_emergency_appt",dw_find.getitemstring(f,"pd_address_non_emergency_appt"))
		end if
		if cbx_access.checked = true then
			dw_link.setitem(r,"handicapped_access",dw_find.getitemnumber(f,"pd_address_handicapped_access"))
			dw_link.setitem(r,"public_transportation",dw_find.getitemnumber(f,"pd_address_public_transportation"))
		end if
		if cbx_hours.checked = true then	
			dw_link.setitem(r,"mon_from",dw_find.getitemstring(f,"pd_address_mon_from"))
			dw_link.setitem(r,"mon_to",dw_find.getitemstring(f,"pd_address_mon_to"))
			dw_link.setitem(r,"tue_from",dw_find.getitemstring(f,"pd_address_tue_from"))
			dw_link.setitem(r,"tue_to",dw_find.getitemstring(f,"pd_address_tue_to"))
			dw_link.setitem(r,"wed_from",dw_find.getitemstring(f,"pd_address_wed_from"))
			dw_link.setitem(r,"wed_to",dw_find.getitemstring(f,"pd_address_wed_to"))
			dw_link.setitem(r,"thu_from",dw_find.getitemstring(f,"pd_address_thu_from"))
			dw_link.setitem(r,"thu_to",dw_find.getitemstring(f,"pd_address_thu_to"))
			dw_link.setitem(r,"fri_from",dw_find.getitemstring(f,"pd_address_fri_from"))
			dw_link.setitem(r,"fri_to",dw_find.getitemstring(f,"pd_address_fri_to"))
			dw_link.setitem(r,"sat_from",dw_find.getitemstring(f,"pd_address_sat_from"))
			dw_link.setitem(r,"sat_to",dw_find.getitemstring(f,"pd_address_sat_to"))
			dw_link.setitem(r,"sun_from",dw_find.getitemstring(f,"pd_address_sun_from"))
			dw_link.setitem(r,"sun_to",dw_find.getitemstring(f,"pd_address_sun_to"))
			
			dw_link.setitem(r,"mon_from2",dw_find.getitemstring(f,"pd_address_mon_from2"))
			dw_link.setitem(r,"mon_to2",dw_find.getitemstring(f,"pd_address_mon_to2"))
			dw_link.setitem(r,"tue_from2",dw_find.getitemstring(f,"pd_address_tue_from2"))
			dw_link.setitem(r,"tue_to2",dw_find.getitemstring(f,"pd_address_tue_to2"))
			dw_link.setitem(r,"wed_from2",dw_find.getitemstring(f,"pd_address_wed_from2"))
			dw_link.setitem(r,"wed_to2",dw_find.getitemstring(f,"pd_address_wed_to2"))
			dw_link.setitem(r,"thu_from2",dw_find.getitemstring(f,"pd_address_thu_from2"))
			dw_link.setitem(r,"thu_to2",dw_find.getitemstring(f,"pd_address_thu_to2"))
			dw_link.setitem(r,"fri_from2",dw_find.getitemstring(f,"pd_address_fri_from2"))
			dw_link.setitem(r,"fri_to2",dw_find.getitemstring(f,"pd_address_fri_to2"))
			dw_link.setitem(r,"sat_from2",dw_find.getitemstring(f,"pd_address_sat_from2"))
			dw_link.setitem(r,"sat_to2",dw_find.getitemstring(f,"pd_address_sat_to2"))
			dw_link.setitem(r,"sun_from2",dw_find.getitemstring(f,"pd_address_sun_from2"))
			dw_link.setitem(r,"sun_to2",dw_find.getitemstring(f,"pd_address_sun_to2"))
		end if
		if cbx_cust.checked = true then			
			dw_link.setitem(r,"cust_1",dw_find.getitemstring(f,"pd_address_cust_1"))
			dw_link.setitem(r,"cust_2",dw_find.getitemstring(f,"pd_address_cust_2"))
			dw_link.setitem(r,"cust_3",dw_find.getitemstring(f,"pd_address_cust_3"))
			dw_link.setitem(r,"cust_4",dw_find.getitemstring(f,"pd_address_cust_4"))
			dw_link.setitem(r,"cust_5",dw_find.getitemstring(f,"pd_address_cust_5"))
		
		end if
		check = 1
		exit

	end if
	
next
 
//res = messagebox("Updates completed","Do you want to save changes?",question!,yesno!,2)
if check = 0 then 
	messagebox("Nothing selected","Please select an address and click again.")
	return
end if
//	dw_link.Object.DataWindow.Table.UpdateTable='pd_address'
//	res = dw_link.update()
//	commit using sqlca;
//if res < 1 then return
//

end event

type gb_2 from groupbox within w_addr_gp_conversion
integer x = 942
integer width = 1239
integer height = 252
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Select Info to use for the new Location"
end type

type cb_find from commandbutton within w_addr_gp_conversion
integer x = 59
integer y = 64
integer width = 247
integer height = 108
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Start"
end type

event clicked;integer i
integer rc




i = dw_phones.retrieve()


select max(rec_id)
into :il_rec
from group_practice;

if isnull(il_rec) then il_rec = 0





//string ls_sql
//string ls_sql_org
//string ls_group
//string ls_street
//string ls_phone
//integer rows
//
//ls_sql = dw_link.Object.DataWindow.Table.Select	
//ls_sql_org = ls_sql
//ls_group = upper(sle_group.text)
//ls_street = upper(sle_street.text)
//ls_phone = sle_phone.text
//
//
//
//if rb_group.checked = true then
//	ls_sql = ls_sql + " and upper(street) like '%" + ls_group + "%'"
//elseif rb_street.checked = true then
//	ls_sql = ls_sql + " and upper(street_2) like '%" + ls_street + "%'"
//elseif rb_phone.checked = true then
//	ls_sql = ls_sql + " and phone like '%" + ls_phone + "%'"
//end if
//
//dw_link.SetSQLSelect ( ls_sql )
//		//openwithparm( w_sql_msg, ls_sql )
//dw_link.SetTransObject( SQLCA )
//rows = dw_link.Retrieve()
//
//if rows < 1 then
//		messagebox("No rows","There are no Practitioners' address data that meet the search criteria")
//end if
//
//
//dw_link.SetSQLSelect ( ls_sql_org )
end event

