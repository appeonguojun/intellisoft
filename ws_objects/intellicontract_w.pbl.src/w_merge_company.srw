$PBExportHeader$w_merge_company.srw
forward
global type w_merge_company from w_response
end type
type cb_10 from commandbutton within w_merge_company
end type
type cb_9 from commandbutton within w_merge_company
end type
type cb_8 from commandbutton within w_merge_company
end type
type dw_contact from datawindow within w_merge_company
end type
type st_3 from statictext within w_merge_company
end type
type st_4 from statictext within w_merge_company
end type
type dw_5 from datawindow within w_merge_company
end type
type cb_7 from commandbutton within w_merge_company
end type
type cb_6 from commandbutton within w_merge_company
end type
type cb_5 from commandbutton within w_merge_company
end type
type cb_4 from commandbutton within w_merge_company
end type
type cb_3 from commandbutton within w_merge_company
end type
type cb_2 from commandbutton within w_merge_company
end type
type dw_4 from u_dw within w_merge_company
end type
type dw_3 from u_dw within w_merge_company
end type
type cb_1 from commandbutton within w_merge_company
end type
type dw_2 from u_dw within w_merge_company
end type
type dw_1 from u_dw within w_merge_company
end type
type dw_company from datawindow within w_merge_company
end type
type st_2 from statictext within w_merge_company
end type
type ddlb_1 from dropdownlistbox within w_merge_company
end type
type st_1 from statictext within w_merge_company
end type
type gb_1 from groupbox within w_merge_company
end type
type gb_2 from groupbox within w_merge_company
end type
type gb_3 from groupbox within w_merge_company
end type
type r_1 from rectangle within w_merge_company
end type
type r_2 from rectangle within w_merge_company
end type
type r_3 from rectangle within w_merge_company
end type
type r_4 from rectangle within w_merge_company
end type
end forward

global type w_merge_company from w_response
integer x = 214
integer y = 221
integer width = 3995
integer height = 2448
string title = "Merge Company"
cb_10 cb_10
cb_9 cb_9
cb_8 cb_8
dw_contact dw_contact
st_3 st_3
st_4 st_4
dw_5 dw_5
cb_7 cb_7
cb_6 cb_6
cb_5 cb_5
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
dw_4 dw_4
dw_3 dw_3
cb_1 cb_1
dw_2 dw_2
dw_1 dw_1
dw_company dw_company
st_2 st_2
ddlb_1 ddlb_1
st_1 st_1
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
r_1 r_1
r_2 r_2
r_3 r_3
r_4 r_4
end type
global w_merge_company w_merge_company

type variables
string is_contact_type2,is_filter_company_contact
datastore ids_select_facility,ids_select_contact
end variables

on w_merge_company.create
int iCurrent
call super::create
this.cb_10=create cb_10
this.cb_9=create cb_9
this.cb_8=create cb_8
this.dw_contact=create dw_contact
this.st_3=create st_3
this.st_4=create st_4
this.dw_5=create dw_5
this.cb_7=create cb_7
this.cb_6=create cb_6
this.cb_5=create cb_5
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.dw_4=create dw_4
this.dw_3=create dw_3
this.cb_1=create cb_1
this.dw_2=create dw_2
this.dw_1=create dw_1
this.dw_company=create dw_company
this.st_2=create st_2
this.ddlb_1=create ddlb_1
this.st_1=create st_1
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_3=create gb_3
this.r_1=create r_1
this.r_2=create r_2
this.r_3=create r_3
this.r_4=create r_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_10
this.Control[iCurrent+2]=this.cb_9
this.Control[iCurrent+3]=this.cb_8
this.Control[iCurrent+4]=this.dw_contact
this.Control[iCurrent+5]=this.st_3
this.Control[iCurrent+6]=this.st_4
this.Control[iCurrent+7]=this.dw_5
this.Control[iCurrent+8]=this.cb_7
this.Control[iCurrent+9]=this.cb_6
this.Control[iCurrent+10]=this.cb_5
this.Control[iCurrent+11]=this.cb_4
this.Control[iCurrent+12]=this.cb_3
this.Control[iCurrent+13]=this.cb_2
this.Control[iCurrent+14]=this.dw_4
this.Control[iCurrent+15]=this.dw_3
this.Control[iCurrent+16]=this.cb_1
this.Control[iCurrent+17]=this.dw_2
this.Control[iCurrent+18]=this.dw_1
this.Control[iCurrent+19]=this.dw_company
this.Control[iCurrent+20]=this.st_2
this.Control[iCurrent+21]=this.ddlb_1
this.Control[iCurrent+22]=this.st_1
this.Control[iCurrent+23]=this.gb_1
this.Control[iCurrent+24]=this.gb_2
this.Control[iCurrent+25]=this.gb_3
this.Control[iCurrent+26]=this.r_1
this.Control[iCurrent+27]=this.r_2
this.Control[iCurrent+28]=this.r_3
this.Control[iCurrent+29]=this.r_4
end on

on w_merge_company.destroy
call super::destroy
destroy(this.cb_10)
destroy(this.cb_9)
destroy(this.cb_8)
destroy(this.dw_contact)
destroy(this.st_3)
destroy(this.st_4)
destroy(this.dw_5)
destroy(this.cb_7)
destroy(this.cb_6)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.dw_4)
destroy(this.dw_3)
destroy(this.cb_1)
destroy(this.dw_2)
destroy(this.dw_1)
destroy(this.dw_company)
destroy(this.st_2)
destroy(this.ddlb_1)
destroy(this.st_1)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_3)
destroy(this.r_1)
destroy(this.r_2)
destroy(this.r_3)
destroy(this.r_4)
end on

event open;call super::open;datawindowchild ldwc,ldwc_contact,ldwc2
long ll_find,ll_facility_id,ll_contact_id,ll_find2


ddlb_1.selectitem(4)
is_contact_type2 = ''
dw_company.setfocus( )
dw_company.insertrow(0)
dw_company.getchild("facility_name",ldwc)
ldwc.settransobject(sqlca)
 
dw_5.insertrow(0)
dw_5.getchild("facility_name",ldwc2)
ldwc2.settransobject(sqlca)
dw_contact.insertrow(0)
dw_contact.getchild("contact_name",ldwc_contact)
ldwc_contact.settransobject(sqlca)
dw_1.settransobject(sqlca)
dw_2.settransobject(sqlca)
dw_3.settransobject(sqlca)
dw_4.settransobject(sqlca)
 
gnv_appeondb.of_startqueue()
ldwc.retrieve()
ldwc2.retrieve()
ldwc_contact.retrieve()
dw_1.retrieve()
dw_2.retrieve()
dw_3.retrieve()
dw_4.retrieve()
gnv_appeondb.of_commitqueue( )
 
ids_select_facility = create datastore
ids_select_facility.dataobject = 'd_contact_company_list'
ids_select_facility.settransobject(sqlca)

ids_select_contact = create datastore
ids_select_contact.dataobject = 'd_contact_ext_list'
ids_select_contact.settransobject(sqlca)

//if ldwc.rowcount() > 0 then
//	ll_facility_id = ldwc.getitemnumber(1,"facility_id")
//	dw_company.setitem(1,"facility_id",ll_facility_id)
//	ll_find = dw_1.find(" facility_id = " + string(ll_facility_id),1, dw_1.rowcount())
//	if isnull(ll_find) then ll_find = 0
//	if ll_find > 0 then
//		dw_1.setrow(ll_find)
//		dw_1.selectrow(0,false)
//		dw_1.selectrow(ll_find,true)
//	end if
//end if
//if ldwc_contact.rowcount( ) > 0 then
//	ll_contact_id = ldwc_contact.getitemnumber(1,"contact_id")
//	dw_contact.setitem(1,"contact_id",ll_contact_id)
//	ll_find2 = dw_2.find(" contact_id = " + string(ll_contact_id),1, dw_2.rowcount())
//	if isnull(ll_find2) then ll_find2 = 0
//	if ll_find2 > 0 then
//		dw_2.setrow(ll_find2)
//		dw_2.selectrow(0,false)
//		dw_2.selectrow(ll_find2,true)
//	end if
//end if
 
//Added By Jay Chen 11-23-2015
is_filter_company_contact = gnv_data.of_getitem("icred_settings", "filter_company_contact", false)
if is_filter_company_contact = '1' then
	dw_1.setfilter("")
	dw_1.filter()
	dw_1.setfilter("status = 'A' ")
	dw_1.filter()
 
	dw_2.setfilter("")
	dw_2.filter()
	dw_2.setfilter("status = 'A' ")
	dw_2.filter()
 
	dw_3.setfilter("")
	dw_3.filter()
	dw_3.setfilter("status = 'A' ")
	dw_3.filter()
 
	dw_4.setfilter("")
	dw_4.filter()
	dw_4.setfilter("status = 'A' ")
	dw_4.filter()
 
	ldwc.setfilter("")
	ldwc.filter()
	ldwc.setfilter("status = 'A' ")
	ldwc.filter()
	ldwc2.setfilter("")
	ldwc2.filter()
	ldwc2.setfilter("status = 'A' ")
	ldwc2.filter()
 
	ldwc_contact.setfilter("")
	ldwc_contact.filter()
	ldwc_contact.setfilter("status = 'A' ")
	ldwc_contact.filter()
end if
//end
 
end event

event pfc_validation;return 1
end event

type cb_10 from commandbutton within w_merge_company
integer x = 1705
integer y = 1600
integer width = 571
integer height = 120
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Select All Contacts"
end type

event clicked;long i,ll_cnt,ll_contact_id,ll_find,ll_insert_row
string ls_name

ll_cnt = dw_2.rowcount() 
If ll_cnt = 0 Then Return

If This.text = '&Deselect All Contact' Then
	This.Text = '&Select All Contact'
	For i = 1 to ll_cnt
		dw_2.object.selected[i] = 0
		ll_contact_id = dw_2.getitemnumber(i,"contact_id")
		ls_name =  dw_2.getitemstring(i,"contact_name")
		ll_find = ids_select_contact.find("contact_id = " +string(ll_contact_id),1, ids_select_contact.rowcount())
		if isnull(ll_find) then ll_find = 0
		if ll_find > 0 then
			ids_select_contact.deleterow(ll_find)
		end if
	Next
Else
	This.Text = '&Deselect All Contact'
	For i = 1 to ll_cnt
		dw_2.object.selected[i] = 1
		ll_contact_id = dw_2.getitemnumber(i,"contact_id")
		ls_name =  dw_2.getitemstring(i,"contact_name")
		ll_find = ids_select_contact.find("contact_id = " +string(ll_contact_id),1, ids_select_contact.rowcount())
		if isnull(ll_find) then ll_find = 0
		if ll_find = 0 then
			ll_insert_row = ids_select_contact.insertrow(0)
			ids_select_contact.setitem(ll_insert_row,"contact_id",ll_contact_id)
			ids_select_contact.setitem(ll_insert_row,"contact_name",ls_name)
		end if
	Next
End If


end event

type cb_9 from commandbutton within w_merge_company
integer x = 1705
integer y = 476
integer width = 571
integer height = 120
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Select All Companies"
end type

event clicked;long i,ll_cnt,ll_facility_id,ll_find,ll_insert_row
string ls_name

ll_cnt = dw_1.rowcount() 
If ll_cnt = 0 Then Return

If This.text = '&Deselect All Company' Then
	This.Text = '&Select All Company'
	For i = 1 to ll_cnt
		dw_1.object.selected[i] = 0
		ll_facility_id = dw_1.getitemnumber(i,"facility_id")
		ls_name =  dw_1.getitemstring(i,"facility_name")
		ll_find = ids_select_facility.find("facility_id = " +string(ll_facility_id),1, ids_select_facility.rowcount())
		if isnull(ll_find) then ll_find = 0
		if ll_find > 0 then
			ids_select_facility.deleterow(ll_find)
		end if
	Next
Else
	This.Text = '&Deselect All Company'
	For i = 1 to ll_cnt
		dw_1.object.selected[i] = 1
		ll_facility_id = dw_1.getitemnumber(i,"facility_id")
		ls_name =  dw_1.getitemstring(i,"facility_name")
		ll_find = ids_select_facility.find("facility_id = " +string(ll_facility_id),1, ids_select_facility.rowcount())
		if isnull(ll_find) then ll_find = 0
		if ll_find = 0 then
			ll_insert_row = ids_select_facility.insertrow(0)
			ids_select_facility.setitem(ll_insert_row,"facility_id",ll_facility_id)
			ids_select_facility.setitem(ll_insert_row,"facility_name",ls_name)
		end if
	Next
End If


end event

type cb_8 from commandbutton within w_merge_company
integer x = 1472
integer y = 1288
integer width = 201
integer height = 88
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Search"
end type

event clicked;string ls_filter,ls_contact_name,ls_text,ls_facility_name
long ll_facility_id,ll_find

dw_contact.accepttext( )
ls_contact_name = trim(dw_contact.getitemstring(1,"contact_name")) 
if isnull(ls_contact_name) then ls_contact_name = ''
if ls_contact_name <> '' then
	ls_contact_name = gnv_string.of_globalreplace( ls_contact_name, "'", "~~~'")					//Added By Mark Lee 02/18/2016
	ls_contact_name = gnv_string.of_globalreplace( ls_contact_name, '"', '~~~"')						//Added By Mark Lee 02/18/2016	
	ls_text = '%' + ls_contact_name + '%'
	ls_filter = " (lower(contact_name) like '"+lower(ls_text)+"') "
end if

if dw_1.getrow() > 0 then 
	ll_facility_id = dw_1.getitemnumber(dw_1.getrow(),"facility_id") 
else
	ll_facility_id = 0
end if
if isnull(ll_facility_id) then ll_facility_id = 0
//if ll_facility_id <> 0 then
	ls_filter = ls_filter + " and (facility_id =  " + string(ll_facility_id)  + ")"
//end if

if is_contact_type2 <> '' then ls_filter = ls_filter + " and (contact_type2 =  '"+is_contact_type2+"') "
if is_filter_company_contact = '1' then ls_filter = ls_filter + " and (status =  'A') " //Added By Jay Chen 11-23-2015
if left(trim(ls_filter),3) = 'and' then ls_filter = right(ls_filter,len(ls_filter) - 4)

dw_2.setfilter("")
dw_2.filter()
dw_2.selectrow(0,false)
dw_2.setfilter(ls_filter)
dw_2.filter()
dw_2.setsort("contact_name A")
dw_2.sort()
ll_find = dw_2.find(" contact_name = '"+ls_contact_name+"' ",1, dw_2.rowcount())
if isnull(ll_find) then ll_find = 0
//if ll_find = 0 then ll_find = 1
if ll_find > 0 then
	dw_2.setrow(ll_find)
	dw_2.scrolltorow(ll_find)
	dw_2.selectrow(0,false)
	dw_2.selectrow(ll_find,true)
end if

end event

type dw_contact from datawindow within w_merge_company
integer x = 553
integer y = 1292
integer width = 910
integer height = 88
integer taborder = 50
string dataobject = "d_contact_ext_list"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event editchanged;long ll_facility_id,ll_null
datawindowchild ldwc_contact
string ls_text,ls_filter

setnull(ll_null)
if row < 1 then return

if isnull(data) then data = ''
if data <> '' then
	data = gnv_string.of_globalreplace( data, "'", "~~~'")					//Added By Mark Lee 02/18/2016
	data = gnv_string.of_globalreplace( data, '"', '~~~"')						//Added By Mark Lee 02/18/2016
	ls_text = '%' + data + '%'
	ls_filter = " (lower(contact_name) like '"+lower(ls_text)+"') "
end if

if dw_1.getrow() > 0 then 
	ll_facility_id = dw_1.getitemnumber(dw_1.getrow(),"facility_id") 
else
	ll_facility_id = 0
end if
if isnull(ll_facility_id) then ll_facility_id = 0
//if ll_facility_id <> 0 then
	ls_filter = ls_filter + " and (facility_id =  " + string(ll_facility_id)  + ")"
//end if

if is_contact_type2 <> '' then ls_filter = ls_filter + " and (contact_type2 =  '"+is_contact_type2+"') "
if is_filter_company_contact = '1' then ls_filter = ls_filter + " and (status =  'A') " //Added By Jay Chen 11-23-2015
if left(trim(ls_filter),3) = 'and' then ls_filter = right(ls_filter,len(ls_filter) - 4)

dw_contact.getchild("contact_name",ldwc_contact)
ldwc_contact.setfilter("")
ldwc_contact.filter()
ldwc_contact.setfilter(ls_filter)
ldwc_contact.filter()
ldwc_contact.setsort("contact_name A")
ldwc_contact.sort()
end event

type st_3 from statictext within w_merge_company
integer x = 27
integer y = 1304
integer width = 503
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 80263581
string text = "Source Contact Name:"
boolean focusrectangle = false
end type

type st_4 from statictext within w_merge_company
integer x = 2304
integer y = 204
integer width = 521
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 80263581
string text = "Target Company Name:"
boolean focusrectangle = false
end type

type dw_5 from datawindow within w_merge_company
integer x = 2825
integer y = 196
integer width = 910
integer height = 88
integer taborder = 30
string dataobject = "d_contact_company_list"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event editchanged;long ll_facility_id,ll_null
datawindowchild ldwc_facility
string ls_text,ls_filter

setnull(ll_null)
if row < 1 then return

if isnull(data) then data = ''
if data <> '' then
	data = gnv_string.of_globalreplace( data, "'", "~~~'")					//Added By Mark Lee 02/18/2016
	data = gnv_string.of_globalreplace( data, '"', '~~~"')						//Added By Mark Lee 02/18/2016
	ls_text = '%' + data + '%'
	ls_filter = " (lower(facility_name) like '"+lower(ls_text)+"') "
end if
if is_contact_type2 <> '' then ls_filter = ls_filter + " and (contact_type2 =  '"+is_contact_type2+"') "
if is_filter_company_contact = '1' then ls_filter = ls_filter + " and (status =  'A') " //Added By Jay Chen 11-23-2015
if left(trim(ls_filter),3) = 'and' then ls_filter = right(ls_filter,len(ls_filter) - 4)
dw_5.getchild("facility_name",ldwc_facility)
ldwc_facility.setfilter("")
ldwc_facility.filter()
ldwc_facility.setfilter(ls_filter)
ldwc_facility.filter()
ldwc_facility.setsort("facility_name A")
ldwc_facility.sort()

end event

type cb_7 from commandbutton within w_merge_company
integer x = 3744
integer y = 192
integer width = 201
integer height = 88
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Search"
end type

event clicked;long ll_facility_id,ll_find
string ls_facility_name,ls_filter,ls_text

dw_5.accepttext( )

ls_facility_name = dw_5.getitemstring(1,"facility_name") 
if isnull(ls_facility_name) then ls_facility_name = ''
if ls_facility_name <> '' then
	ls_facility_name = gnv_string.of_globalreplace( ls_facility_name, "'", "~~~'")					//Added By Mark Lee 02/18/2016
	ls_facility_name = gnv_string.of_globalreplace( ls_facility_name, '"', '~~~"')						//Added By Mark Lee 02/18/2016
	ls_text = '%' + ls_facility_name + '%'
	ls_filter = " (lower(facility_name) like '"+lower(ls_text)+"') "
end if
if is_contact_type2 <> '' then ls_filter = ls_filter + " and (contact_type2 =  '"+is_contact_type2+"') "
if is_filter_company_contact = '1' then ls_filter = ls_filter + " and (status =  'A') " //Added By Jay Chen 11-23-2015
if left(trim(ls_filter),3) = 'and' then ls_filter = right(ls_filter,len(ls_filter) - 4)
dw_3.setfilter("")
dw_3.filter()
dw_3.setfilter(ls_filter)
dw_3.filter()
dw_3.setsort("facility_name A")
dw_3.sort()
ll_find = dw_3.find(" facility_name = '"+ls_facility_name+"' ",1, dw_3.rowcount())
if isnull(ll_find) then ll_find = 0
if ll_find = 0 then ll_find = 1
if ll_find > 0 then
	dw_3.setrow(ll_find)
	dw_3.scrolltorow(ll_find)
	dw_3.selectrow(0,false)
	dw_3.selectrow(ll_find,true)
end if
if dw_3.getrow() < 1 then 
	ll_facility_id = 0
else
	ll_facility_id = dw_3.getitemnumber(dw_3.getrow(),"facility_id")
end if
dw_4.setfilter("")
dw_4.filter()
ls_filter = "facility_id=" + string(ll_facility_id)
dw_4.setfilter(ls_filter)
dw_4.filter()
dw_4.setsort("contact_name A")
dw_4.sort()
end event

type cb_6 from commandbutton within w_merge_company
integer x = 1705
integer y = 2064
integer width = 571
integer height = 120
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Delete Source Contact"
end type

event clicked;long ll_row,ll_select,ll_contact_id,ll_find,ll_facility_id,ll_ctx_id
boolean lb_SuccessFlag = true
string ls_filter,ls_source_name,ls_name,ls_template_name
datawindowchild ldwc_contact

//source contact name
for ll_row = 1 to ids_select_contact.rowcount( )
	ls_name = ids_select_contact.getitemstring(ll_row, "contact_name")
	if isnull(ls_name) then ls_name = ''
	if ls_source_name = '' then
		ls_source_name = ls_name
	else
		ls_source_name = ls_source_name + ' ;' + ls_name
	end if
next

if ids_select_contact.rowcount() = 0 then
	MessageBox('Contractlogix','You must select at least one source contact  to delete !')
	dw_2.setfocus( )
	return -1
end if

if len(ls_source_name) > 200 then ls_source_name = left(ls_source_name,200) + '...'
if MessageBox('Confirm Delete Contact','Are you sure you want to delete the contact(s): ' + ls_source_name + '? ',Question!,YesNo!,2) <> 1 then return

//delete contact info
for ll_row = 1 to ids_select_contact.rowcount()
	ll_contact_id = ids_select_contact.getitemnumber(ll_row, "contact_id")
	ls_name =      ids_select_contact.getitemstring(ll_row, "contact_name")
	setnull( ll_ctx_id )
	Select Top 1 ctx_id Into :ll_ctx_id From ctx_contract_contacts Where contact_id = :ll_contact_id;
	If ll_ctx_id < 0 Then	//using by CTX Template
		Select template_name into :ls_template_name from ctx_templates_info Where ctx_id = :ll_ctx_id;
		Messagebox("Delete contact", "Can't delete the contact:" + ls_name + ". The contact person is referenced by the contract template '" + String(ls_template_name) + "'.")
		Return 
	End If
		
	if ll_ctx_id > 0 Then
//		Messagebox("Delete contact", "Can't delete the contact:" + ls_name + ". The contact person is referenced by the contract " + String(ll_ctx_id) + ".")
		If Messagebox("Delete contact", "Can't delete the contact. The contact person is referenced by the contract #" + String(ll_ctx_id) + ".~r~rDo you want to open the Contract Contact Batch Update window?", question!, yesno! ) = 1  Then
				If isvalid( gw_contract ) Then
					openwithparm( w_contract_contact_batchreplace, string( ll_contact_id ), gw_contract )
					close( parent )
					return
				ElseIf Isvalid( w_mdi ) Then
					openwithparm( w_contract_contact_batchreplace, string( ll_contact_id ), w_mdi )
					close( parent )
					return
				End If
			End If
		Return 
	End If
	
	DELETE FROM ctx_contacts_numbers WHERE contact_id = :ll_contact_id;
	DELETE FROM ctx_contacts WHERE contact_id = :ll_contact_id ;
	 
	if SQLCA.SQLCode = 0 then
		COMMIT USING SQLCA;
	else
		MessageBox('Error',SQLCA.SQLErrText,StopSign!)
		ROLLBACK USING SQLCA;
		lb_SuccessFlag = false
	end if
	
next

//refresh interface
dw_2.settransobject(sqlca)
dw_4.settransobject(sqlca)
dw_contact.getchild("contact_name",ldwc_contact)
ldwc_contact.settransobject(sqlca)
gnv_appeondb.of_startqueue()
dw_2.retrieve()
dw_4.retrieve()
ldwc_contact.retrieve()
gnv_appeondb.of_commitqueue( )

//ll_find = dw_3.find(" facility_id = " + string(ll_target_facility[1]),1, dw_3.rowcount())
//if isnull(ll_find) then ll_find = 0
//if ll_find > 0 then
//	dw_3.setrow(ll_find)
//	dw_3.scrolltorow(ll_find)
//	dw_3.selectrow(0,false)
//	dw_3.selectrow(ll_find,true)
//end if
if dw_3.getrow() > 0 then
	ll_facility_id = dw_3.getitemnumber(dw_3.getrow(),"facility_id")
	dw_4.setfilter("")
	dw_4.filter()
	ls_filter = "facility_id=" + string(ll_facility_id)
	dw_4.setfilter(ls_filter)
	dw_4.filter()
	dw_4.setsort("contact_name A")
	dw_4.sort( )
end if

if dw_1.getrow() > 0 then
	ll_facility_id = dw_1.getitemnumber(dw_1.getrow(),"facility_id")
	dw_2.setfilter("")
	dw_2.filter()
	ls_filter = "facility_id=" + string(ll_facility_id)
	dw_2.setfilter(ls_filter)
	dw_2.filter()
	dw_2.setsort("contact_name A")
	dw_2.sort( )
end if

ids_select_contact.reset()

if lb_SuccessFlag then 
	MessageBox('Contractlogix','Delete contact successful!')
end if
end event

type cb_5 from commandbutton within w_merge_company
integer x = 1705
integer y = 988
integer width = 571
integer height = 120
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Delete Source Company"
end type

event clicked;long ll_row,ll_facility_id,ll_ctx_id,ll_rnt
boolean lb_SuccessFlag = true
string ls_filter,ls_source_name,ls_target_name,ls_name,ls_template_name
datawindowchild ldwc,ldwc2

//source company name
for ll_row = 1 to ids_select_facility.rowcount( )
	ls_name = ids_select_facility.getitemstring(ll_row, "facility_name")
	if isnull(ls_name) then ls_name = ''
	if ls_source_name = '' then
		ls_source_name = ls_name
	else
		ls_source_name = ls_source_name + '; ' + ls_name
	end if
next
ls_source_name = trim(ls_source_name)

if ids_select_facility.rowcount() = 0 then
	MessageBox('Contractlogix','You must select at least one source company to delete!')
	dw_1.setfocus( )
	return -1
end if

if len(ls_source_name) > 200 then ls_source_name = left(ls_source_name,200) + '...'
if MessageBox('Confirm Delete Company','Are you sure you want to delete the company "' + ls_source_name +'"? ',Question!,YesNo!,2) <> 1 then return

//delete company info
for ll_row = 1 to ids_select_facility.rowcount()
	ll_facility_id = ids_select_facility.getitemnumber(ll_row, "facility_id")
	ls_name = 	   ids_select_facility.getitemstring(ll_row, "facility_name")
	setnull(ll_ctx_id)
	gnv_appeondb.of_startqueue( )
	SELECT COUNT(*)
	INTO :ll_rnt
	FROM ctx_contacts
	WHERE facility_id = :ll_facility_id;
		
	Select top 1 ctx_id Into :ll_ctx_id From ctx_basic_info where app_facility = :ll_facility_id  ;
	gnv_appeondb.of_commitqueue( )
		
	if ll_rnt > 0 then
		Messagebox("Delete Company", "Can't delete the source company:" + ls_name +". The company is referenced by some contact. ")
		Return
	END IF
		
	If ll_ctx_id < 0 Then //using by CTX template
		Select template_name into :ls_template_name from ctx_templates_info Where ctx_id = :ll_ctx_id;
		Messagebox("Delete Company", "Can't delete the source company. The company is referenced by the contract template '" + String(ls_template_name) + "'.")
		Return 
	End If
		
	If ll_ctx_id > 0 Then
		Messagebox("Delete Company", "Can't delete the source company. The company is referenced by the contract #" + String(ll_ctx_id) + ".")
		Return	
	End If
	DELETE FROM app_facility WHERE  facility_id = :ll_facility_id ;
	DELETE FROM app_facility_group_access WHERE facility_id = :ll_facility_id;	//delete group access
	DELETE FROM ctx_contacts WHERE facility_id = :ll_facility_id ;
	if SQLCA.SQLCode = 0 then
		COMMIT USING SQLCA;
	else
		MessageBox('Error',SQLCA.SQLErrText,StopSign!)
		ROLLBACK USING SQLCA;
		lb_SuccessFlag = false
	end if
	
next

//refresh interface
dw_1.settransobject(sqlca)
dw_2.settransobject(sqlca)
dw_3.settransobject(sqlca)
dw_4.settransobject(sqlca)
dw_company.getchild("facility_name",ldwc)
ldwc.settransobject(sqlca)
gnv_appeondb.of_startqueue()
dw_1.retrieve()
dw_2.retrieve()
dw_3.retrieve()
dw_4.retrieve()
ldwc.retrieve()
gnv_appeondb.of_commitqueue( )

ids_select_facility.reset()

if lb_SuccessFlag then 
	MessageBox('Contractlogix','Delete company successful!')
end if
end event

type cb_4 from commandbutton within w_merge_company
integer x = 1705
integer y = 1832
integer width = 571
integer height = 120
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Move Contact To"
end type

event clicked;long ll_row,ll_select,ll_contact_id,ll_find,ll_target_facility[],ll_facility_id,ll_count
boolean lb_SuccessFlag = true
string ls_filter,ls_source_name,ls_target_name,ls_name,ls_status
boolean lb_update_status

//source contact name
for ll_row = 1 to ids_select_contact.rowcount( )
	ls_name = ids_select_contact.getitemstring(ll_row, "contact_name")
	if isnull(ls_name) then ls_name = ''
	if ls_source_name = '' then
		ls_source_name = ls_name
	else
		ls_source_name = ls_source_name + '; ' + ls_name
	end if
next
ls_source_name = trim(ls_source_name)

//target company name
for ll_row = 1 to dw_3.rowcount( )
	ll_select = dw_3.getitemnumber(ll_row, "selected")
	ll_facility_id = dw_3.getitemnumber(ll_row, "facility_id")
	ls_name = dw_3.getitemstring(ll_row, "facility_name")
	if isnull(ls_name) then ls_name = ''
	if ll_select = 1 then
		ll_target_facility[upperbound(ll_target_facility) + 1] = ll_facility_id
		if ls_target_name = '' then
			ls_target_name = ls_name
		else
			ls_target_name = ls_target_name + '; ' + ls_name
		end if
	end if
next

if ids_select_contact.rowcount() = 0 then
	MessageBox('Contractlogix','You must select at least one contact of source company to move the contact(s)!')
	dw_2.setfocus( )
	return -1
end if

if upperbound(ll_target_facility) > 1 or upperbound(ll_target_facility) = 0 then
	MessageBox('Contractlogix','You must select one target company to move the contact(s)!')
	dw_3.setfocus( )
	return -1
end if

if len(ls_source_name) > 200 then ls_source_name = left(ls_source_name,200) + '...'
if MessageBox('Confirm Move Contact','Are you sure you want to move the contact(s) "' + ls_source_name + '" to the company "' +  ls_target_name +'"? ',Question!,YesNo!,2) <> 1 then return

select count(*) into :ll_count from ctx_contacts where facility_id = :ll_target_facility[1] and DefaultTo = '1';
if isnull(ll_count) then ll_count = 0

//update contact info
for ll_row = 1 to ids_select_contact.rowcount()
	ll_contact_id = ids_select_contact.getitemnumber(ll_row, "contact_id")
	
	if ll_count > 0 then
		UPDATE ctx_contacts
		SET  DefaultTo = '0'
	 	WHERE contact_id = :ll_contact_id ;
	end if
	
	ls_status = ''
	select status into :ls_status from ctx_contacts where contact_id = :ll_contact_id ;
	if isnull(ls_status) then ls_status = ''
	if ls_status = 'A' then lb_update_status = true
	
	UPDATE ctx_contacts
		SET  facility_id = :ll_target_facility[1]
	 WHERE contact_id = :ll_contact_id ;
	 
	if SQLCA.SQLCode = 0 then
		COMMIT USING SQLCA;
	else
		MessageBox('Error',SQLCA.SQLErrText,StopSign!)
		ROLLBACK USING SQLCA;
		lb_SuccessFlag = false
	end if
	
next

if lb_update_status then
	update app_facility set status = 'A' where facility_id = :ll_target_facility[1];
end if

//refresh interface
dw_2.settransobject(sqlca)
dw_4.settransobject(sqlca)
gnv_appeondb.of_startqueue()
dw_2.retrieve()
dw_4.retrieve()
gnv_appeondb.of_commitqueue( )

//ll_find = dw_3.find(" facility_id = " + string(ll_target_facility[1]),1, dw_3.rowcount())
//if isnull(ll_find) then ll_find = 0
//if ll_find > 0 then
//	dw_3.setrow(ll_find)
//	dw_3.scrolltorow(ll_find)
//	dw_3.selectrow(0,false)
//	dw_3.selectrow(ll_find,true)
//end if
dw_4.setfilter("")
dw_4.filter()
ls_filter = "facility_id=" + string(ll_target_facility[1])
dw_4.setfilter(ls_filter)
dw_4.filter()
dw_4.setsort("contact_name A")
dw_4.sort( )

if dw_1.getrow() > 0 then
	ll_facility_id = dw_1.getitemnumber(dw_1.getrow(),"facility_id")
	dw_2.setfilter("")
	dw_2.filter()
	ls_filter = "facility_id=" + string(ll_facility_id)
	dw_2.setfilter(ls_filter)
	dw_2.filter()
end if

ids_select_contact.reset()

if lb_SuccessFlag then 
	MessageBox('Contractlogix','Move contact successful!')
end if
end event

type cb_3 from commandbutton within w_merge_company
integer x = 1705
integer y = 732
integer width = 571
integer height = 120
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Merge Company"
end type

event clicked;long ll_source_facility[],ll_target_facility[],ll_row,ll_select,ll_facility_id,ll_find,ll_cnt,ll_count
boolean lb_SuccessFlag = true
string ls_filter,ls_source_name,ls_target_name,ls_name,ls_status
boolean lb_update_status

//target company name
for ll_row = 1 to dw_3.rowcount( )
	ll_select = dw_3.getitemnumber(ll_row, "selected")
	ll_facility_id = dw_3.getitemnumber(ll_row, "facility_id")
	ls_name = dw_3.getitemstring(ll_row, "facility_name")
	if isnull(ls_name) then ls_name = ''
	if ll_select = 1 then
		ll_target_facility[upperbound(ll_target_facility) + 1] = ll_facility_id
		if ls_target_name = '' then
			ls_target_name = ls_name
		else
			ls_target_name = ls_target_name + '; ' + ls_name
		end if
	end if
next

//source company name
for ll_row = 1 to ids_select_facility.rowcount( )
	ll_facility_id = ids_select_facility.getitemnumber(ll_row, "facility_id")
	ls_name = ids_select_facility.getitemstring(ll_row, "facility_name")
	if ll_facility_id = ll_target_facility[1] then
		MessageBox('Contractlogix','The source company can not be the same as the target company!')
		dw_3.setfocus( )
		return -1
	end if
	if isnull(ls_name) then ls_name = ''
	if ls_source_name = '' then
		ls_source_name = ls_name
	else
		ls_source_name = ls_source_name + '; ' + ls_name
	end if
next
ls_source_name = trim(ls_source_name)

if ids_select_facility.rowcount() = 0 then
	MessageBox('Contractlogix','You must select at least one source company to merge!')
	dw_1.setfocus( )
	return -1
end if

if upperbound(ll_target_facility) > 1 or upperbound(ll_target_facility) = 0 then
	MessageBox('Contractlogix','You must select one target company to merge!')
	dw_3.setfocus( )
	return -1
end if

if len(ls_source_name) > 200 then ls_source_name = left(ls_source_name,200) + '...'
if MessageBox('Confirm Merge Company','Are you sure you want to merge the company(ies) "' + ls_source_name + '" to the company "' +  ls_target_name +'"? If you continue, all contacts from the source company will be moved to the target company.',Question!,YesNo!,2) <> 1 then return

select count(*) into :ll_count from ctx_contacts where facility_id = :ll_target_facility[1] and DefaultTo = '1';
if isnull(ll_count) then ll_count = 0

//update contact info
for ll_row = 1 to ids_select_facility.rowcount()
	ll_facility_id = ids_select_facility.getitemnumber(ll_row, "facility_id")
	ls_name = ids_select_facility.getitemstring(ll_row, "facility_name")
	Select count(*) Into :ll_cnt From ctx_basic_info where app_facility = :ll_facility_id  ;
	If isnull(ll_cnt) Then ll_cnt = 0	
	If ll_cnt > 0 Then
		if MessageBox('Confirm Merge Company','The company:' + ls_name +' is referenced by some contract. Are you sure you want to continue to merge?',Question!,YesNo!,2) <> 1 then return
	End If
	
	if ll_count > 0 then
		UPDATE ctx_contacts
		SET  DefaultTo = '0'
	 	WHERE facility_id = :ll_facility_id ;
	end if
	
	UPDATE ctx_contacts
		SET  facility_id = :ll_target_facility[1]
	 WHERE facility_id = :ll_facility_id ;
	 
	 UPDATE ctx_basic_info 
	 	 SET app_facility = :ll_target_facility[1]
	 WHERE app_facility = :ll_facility_id ;
	 
	 ls_status = ''
	 select status into :ls_status from app_facility where facility_id = :ll_facility_id;
	 if isnull(ls_status) then ls_status = ''
	 if ls_status = 'A' then lb_update_status = true
	 
	if SQLCA.SQLCode = 0 then
		COMMIT USING SQLCA;
	else
		MessageBox('Error',SQLCA.SQLErrText,StopSign!)
		ROLLBACK USING SQLCA;
		lb_SuccessFlag = false
	end if
	
next

if lb_update_status then
	update app_facility set status = 'A' where facility_id = :ll_target_facility[1];
end if

//refresh interface
dw_2.settransobject(sqlca)
dw_4.settransobject(sqlca)
gnv_appeondb.of_startqueue()
dw_2.retrieve()
dw_4.retrieve()
gnv_appeondb.of_commitqueue( )

//ll_find = dw_3.find(" facility_id = " + string(ll_target_facility[1]),1, dw_3.rowcount())
//if isnull(ll_find) then ll_find = 0
//if ll_find > 0 then
//	dw_3.setrow(ll_find)
//	dw_3.scrolltorow(ll_find)
//	dw_3.selectrow(0,false)
//	dw_3.selectrow(ll_find,true)
//end if
dw_4.setfilter("")
dw_4.filter()
ls_filter = "facility_id=" + string(ll_target_facility[1])
dw_4.setfilter(ls_filter)
dw_4.filter()
dw_4.setsort("contact_name A")
dw_4.sort( )

if dw_1.getrow() > 0 then
	ll_facility_id = dw_1.getitemnumber(dw_1.getrow(),"facility_id")
	dw_2.setfilter("")
	dw_2.filter()
	ls_filter = "facility_id=" + string(ll_facility_id)
	dw_2.setfilter(ls_filter)
	dw_2.filter()
end if

//dw_1.reset( )
//dw_1.settransobject(sqlca)
//dw_1.retrieve()
//ll_find = dw_1.find(" facility_id = " + string(ll_facility_id),1, dw_1.rowcount())
//if isnull(ll_find) then ll_find = 0
//if ll_find > 0 then
//	dw_1.setrow(ll_find)
//	dw_1.scrolltorow(ll_find)
//	dw_1.selectrow(0,false)
//	dw_1.selectrow(ll_find,true)
//end if

//ids_select_facility.reset()

if lb_SuccessFlag then 
	MessageBox('Contractlogix','Merge company successful!')
end if
end event

type cb_2 from commandbutton within w_merge_company
integer x = 1472
integer y = 192
integer width = 201
integer height = 88
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Search"
end type

event clicked;long ll_facility_id,ll_find
string ls_facility_name,ls_filter,ls_text
datawindowchild ldwc_contact

dw_company.accepttext( )

ls_facility_name = dw_company.getitemstring(1,"facility_name") 
if isnull(ls_facility_name) then ls_facility_name = ''
if ls_facility_name <> '' then
	ls_facility_name = gnv_string.of_globalreplace( ls_facility_name, "'", "~~~'")					//Added By Mark Lee 02/18/2016
	ls_facility_name = gnv_string.of_globalreplace( ls_facility_name, '"', '~~~"')						//Added By Mark Lee 02/18/2016
	ls_text = '%' + ls_facility_name + '%'
	ls_filter = " (lower(facility_name) like '"+lower(ls_text)+"') "
end if
if is_contact_type2 <> '' then ls_filter = ls_filter + " and (contact_type2 =  '"+is_contact_type2+"') "
if is_filter_company_contact = '1' then ls_filter = ls_filter + " and (status =  'A') " //Added By Jay Chen 11-23-2015
if left(trim(ls_filter),3) = 'and' then ls_filter = right(ls_filter,len(ls_filter) - 4)
dw_1.setfilter("")
dw_1.filter()
dw_1.setfilter(ls_filter)
dw_1.filter()
dw_1.setsort("facility_name A")
dw_1.sort()
ll_find = dw_1.find(" facility_name = '"+ls_facility_name+"' ",1, dw_1.rowcount())
if isnull(ll_find) then ll_find = 0
if ll_find = 0 then ll_find = 1
if ll_find > 0 then
	dw_1.setrow(ll_find)
	dw_1.scrolltorow(ll_find)
	dw_1.selectrow(0,false)
	dw_1.selectrow(ll_find,true)
end if

if dw_1.getrow() < 1 then 
	ll_facility_id = 0
else
	ll_facility_id = dw_1.getitemnumber(dw_1.getrow(),"facility_id")
end if
dw_2.setfilter("")
dw_2.filter()
ls_filter = "facility_id=" + string(ll_facility_id)
dw_2.setfilter(ls_filter)
dw_2.filter()
dw_2.setsort("contact_name A")
dw_2.sort()

dw_contact.getchild("contact_name",ldwc_contact)
ldwc_contact.setfilter("")
ldwc_contact.filter()
ldwc_contact.setfilter(ls_filter)
ldwc_contact.filter()	
ldwc_contact.setsort("contact_name A")
ldwc_contact.sort()

end event

type dw_4 from u_dw within w_merge_company
string tag = "dw_tables"
integer x = 2304
integer y = 1408
integer width = 1655
integer height = 932
integer taborder = 60
string dragicon = "row.ico"
boolean titlebar = true
string title = "Contact Information Of Target Company"
string dataobject = "d_merge_contacts_list2"
boolean controlmenu = false
borderstyle borderstyle = stylebox!
end type

event other;call super::other;if Message.WordParm = 61458 then 
	Message.Processed = true
	Message.ReturnValue = 0 
end if
end event

event constructor;call super::constructor;this.of_setupdateable(false)
this.modify("selected.visible = false")
end event

event getfocus;call super::getfocus;r_3.visible = true
end event

event losefocus;call super::losefocus;r_3.visible = false
end event

type dw_3 from u_dw within w_merge_company
string tag = "dw_tables"
integer x = 2304
integer y = 316
integer width = 1655
integer height = 932
integer taborder = 50
string dragicon = "row.ico"
boolean titlebar = true
string title = "Target Company Information"
string dataobject = "d_merge_company_list"
boolean controlmenu = false
borderstyle borderstyle = stylebox!
end type

event other;call super::other;if Message.WordParm = 61458 then 
	Message.Processed = true
	Message.ReturnValue = 0 
end if
end event

event constructor;call super::constructor;this.of_setupdateable(false)
end event

event getfocus;call super::getfocus;r_4.visible = true
end event

event losefocus;call super::losefocus;r_4.visible = false
end event

event itemchanged;call super::itemchanged;long		i,	ll_rowcount
	
if row <= 0 then return 	

choose case dwo.name
	case "selected"
		ll_rowcount = this.rowcount( )
		if long(data) = 1 then 
			for i = 1 to ll_rowcount
				if i = row then continue
				this.SetItem(i,"selected",0)
			next 
		end if 	 
end choose 
end event

event rowfocuschanged;call super::rowfocuschanged;long ll_facility_id
string ls_filter

if currentrow < 1 then return
this.selectrow(0,false)
this.selectrow(currentrow,true)
ll_facility_id = this.getitemnumber(currentrow,"facility_id")

dw_4.setfilter("")
dw_4.filter()
ls_filter = "facility_id=" + string(ll_facility_id)
dw_4.setfilter(ls_filter)
dw_4.filter()
end event

type cb_1 from commandbutton within w_merge_company
boolean visible = false
integer x = 2519
integer y = 56
integer width = 201
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Search"
end type

event clicked;long ll_facility_id,ll_find

dw_1.selectrow(0,false)
ll_facility_id = dw_company.getitemnumber(1,"facility_id")
if isnull(ll_facility_id) then ll_facility_id = 0
if ll_facility_id <> 0 then
	ll_find = dw_1.find(" facility_id = " + string(ll_facility_id),1, dw_1.rowcount())
	if isnull(ll_find) then ll_find = 0
	if ll_find > 0 then
		dw_1.setrow(ll_find)
		dw_1.scrolltorow(ll_find)
		dw_1.selectrow(ll_find,true)
	end if
end if

end event

type dw_2 from u_dw within w_merge_company
string tag = "dw_tables"
integer x = 18
integer y = 1408
integer width = 1655
integer height = 932
integer taborder = 40
string dragicon = "row.ico"
boolean titlebar = true
string title = "Contact Information Of Source Company"
string dataobject = "d_merge_contacts_list"
boolean controlmenu = false
borderstyle borderstyle = stylebox!
end type

event other;call super::other;if Message.WordParm = 61458 then 
	Message.Processed = true
	Message.ReturnValue = 0 
end if
end event

event constructor;call super::constructor;this.of_setupdateable(false)
end event

event getfocus;call super::getfocus;r_2.visible = true
end event

event losefocus;call super::losefocus;r_2.visible = false
end event

event itemchanged;call super::itemchanged;long	i,	ll_rowcount,ll_insert_row,ll_contact_id,ll_find
string ls_contact_name
	
if row <= 0 then return 
ll_rowcount = this.rowcount( )

choose case dwo.name
	case "selected"
		ll_contact_id = this.getitemnumber(row,"contact_id")
		ls_contact_name = this.getitemstring(row, "contact_name")
		ll_find = ids_select_contact.find("contact_id = " +string(ll_contact_id),1, ids_select_contact.rowcount())
		if isnull(ll_find) then ll_find = 0
		if long(data) = 1 then 
			if ll_find = 0 then
				ll_insert_row = ids_select_contact.insertrow(0)
				ids_select_contact.setitem(ll_insert_row,"contact_id",ll_contact_id)
				ids_select_contact.setitem(ll_insert_row,"contact_name",ls_contact_name)
			end if
		else
			if ll_find > 0 then
				 ids_select_contact.deleterow(ll_find)
			end if
		end if 	 
end choose 
end event

event rowfocuschanged;call super::rowfocuschanged;if currentrow < 1 then return
this.selectrow(0,false)
this.selectrow(currentrow,true)
end event

type dw_1 from u_dw within w_merge_company
event ue_dragdrop ( )
string tag = "dw_tables"
integer x = 18
integer y = 316
integer width = 1655
integer height = 932
integer taborder = 30
string dragicon = "row.ico"
boolean titlebar = true
string title = "Source Company Information"
string dataobject = "d_merge_company_list"
boolean controlmenu = false
borderstyle borderstyle = stylebox!
end type

event other;call super::other;if Message.WordParm = 61458 then 
	Message.Processed = true
	Message.ReturnValue = 0 
end if
end event

event constructor;call super::constructor;this.of_setupdateable(false)
end event

event getfocus;call super::getfocus;r_1.visible = true
end event

event losefocus;call super::losefocus;r_1.visible = false
end event

event itemchanged;call super::itemchanged;long	i,	ll_rowcount,ll_insert_row,ll_facility_id,ll_find
string ls_name
	
if row <= 0 then return 	
ll_rowcount = this.rowcount( )

choose case dwo.name
	case "selected"
		ll_facility_id = this.getitemnumber(row,"facility_id")
		ls_name =  this.getitemstring(row,"facility_name")
		ll_find = ids_select_facility.find("facility_id = " +string(ll_facility_id),1, ids_select_facility.rowcount())
		if isnull(ll_find) then ll_find = 0
		if long(data) = 1 then 
			if ll_find = 0 then
				ll_insert_row = ids_select_facility.insertrow(0)
				ids_select_facility.setitem(ll_insert_row,"facility_id",ll_facility_id)
				ids_select_facility.setitem(ll_insert_row,"facility_name",ls_name)
			end if
		else
			if ll_find > 0 then
				 ids_select_facility.deleterow(ll_find)
			end if
		end if 	 
end choose 
end event

event rowfocuschanged;call super::rowfocuschanged;long ll_facility_id
string ls_filter
datawindowchild ldwc_contact

if currentrow < 1 then return
this.selectrow(0,false)
this.selectrow(currentrow,true)
ll_facility_id = this.getitemnumber(currentrow,"facility_id")

dw_2.setfilter("")
dw_2.filter()
ls_filter = "facility_id=" + string(ll_facility_id)
dw_2.setfilter(ls_filter)
dw_2.filter()
dw_2.setsort("contact_name A")
dw_2.sort()

if dw_contact.getrow() > 0 then dw_contact.setitem(dw_contact.getrow(),"contact_name",'')
dw_contact.getchild("contact_name",ldwc_contact)
ldwc_contact.setfilter("")
ldwc_contact.filter()
ldwc_contact.setfilter(ls_filter)
ldwc_contact.filter()	
ldwc_contact.setsort("contact_name A")
ldwc_contact.sort()
end event

type dw_company from datawindow within w_merge_company
integer x = 549
integer y = 196
integer width = 910
integer height = 88
integer taborder = 20
string dataobject = "d_contact_company_list"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;//long ll_facility_id,ll_null
//datawindowchild ldwc_contact
//
//setnull(ll_null)
//if row < 1 then return
//ll_facility_id = long(data)
//
//dw_contact.getchild("contact_id",ldwc_contact)
//ldwc_contact.setfilter("")
//ldwc_contact.filter()
//ldwc_contact.setfilter(" facility_id = " + string(ll_facility_id))
//ldwc_contact.filter()
//ldwc_contact.setsort("last_name A")
//ldwc_contact.sort()
//if ldwc_contact.rowcount( ) > 0 then
//	dw_contact.setitem(1,"contact_id",ldwc_contact.getitemnumber(1,"contact_id"))
//else
//	dw_contact.setitem(1,"contact_id",ll_null)
//end if
end event

event editchanged;long ll_facility_id,ll_null
datawindowchild ldwc_facility
string ls_text,ls_filter

setnull(ll_null)
if row < 1 then return

if isnull(data) then data = ''
if data <> '' then
	data = gnv_string.of_globalreplace( data, "'", "~~~'")					//Added By Mark Lee 02/18/2016
	data = gnv_string.of_globalreplace( data, '"', '~~~"')						//Added By Mark Lee 02/18/2016
	ls_text = '%' + data + '%'
	ls_filter = " (lower(facility_name) like '"+lower(ls_text)+"') "
end if
if is_contact_type2 <> '' then ls_filter = ls_filter + " and (contact_type2 =  '"+is_contact_type2+"') "
if is_filter_company_contact = '1' then ls_filter = ls_filter + " and (status =  'A') " //Added By Jay Chen 11-23-2015
if left(trim(ls_filter),3) = 'and' then ls_filter = right(ls_filter,len(ls_filter) - 4)
dw_company.getchild("facility_name",ldwc_facility)
ldwc_facility.setfilter("")
ldwc_facility.filter()
ldwc_facility.setfilter(ls_filter)
ldwc_facility.filter()
ldwc_facility.setsort("facility_name A")
ldwc_facility.sort()
//if ldwc_facility.rowcount( ) > 0 then
//	dw_contact.setitem(1,"facility_id",ldwc_facility.getitemnumber(1,"facility_id"))
//else
//	dw_contact.setitem(1,"facility_id",ll_null)
//end if
end event

type st_2 from statictext within w_merge_company
integer x = 27
integer y = 204
integer width = 535
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 80263581
string text = "Source Company Name:"
boolean focusrectangle = false
end type

type ddlb_1 from dropdownlistbox within w_merge_company
integer x = 553
integer y = 48
integer width = 910
integer height = 384
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 16777215
boolean sorted = false
string item[] = {"Our Company","Contracted Company","Other","All"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;string ls_contact_type,ls_filter
datawindowchild ldwc,ldwc_contact,ldwc2
long ll_facility_id,ll_contact_id

setnull(ll_facility_id)
setnull(ll_contact_id)
ls_contact_type = this.text
choose case ls_contact_type
	case 'Our Company'
		ls_filter = " contact_type2 = 'A' "
		is_contact_type2 = 'A'
	case 'Contracted Company'
		ls_filter = " contact_type2 = 'B' "
		is_contact_type2 = 'B'
	case 'Other'
		ls_filter = " contact_type2 = 'O' "
		is_contact_type2 = 'O'
	case 'All'
		ls_filter = ''
		is_contact_type2 = ''
end choose


//company name
dw_company.getchild("facility_name",ldwc)
ldwc.setfilter("")
ldwc.filter()
ldwc.setfilter(ls_filter)
ldwc.filter()
ldwc.setsort("facility_name A")
ldwc.sort()

dw_5.getchild("facility_name",ldwc2)
ldwc2.setfilter("")
ldwc2.filter()
ldwc2.setfilter(ls_filter)
ldwc2.filter()
ldwc2.setsort("facility_name A")
ldwc2.sort()
//if ldwc.rowcount() > 0 then
//	ll_facility_id = ldwc.getitemnumber(1,"facility_id")
//	dw_company.setitem(1,"facility_id",ll_facility_id)
	//contact name
	dw_contact.getchild("contact_name",ldwc_contact)
	ldwc_contact.setfilter("")
	ldwc_contact.filter()
	ldwc_contact.setfilter(ls_filter)
	ldwc_contact.filter()
	ldwc_contact.setsort("contact_name A")
	ldwc_contact.sort()
//	if ldwc_contact.rowcount() > 0 then
//		dw_contact.setitem(1,"contact_id",ldwc_contact.getitemnumber(1,"contact_id"))
//	else
//		dw_contact.setitem(1,"contact_id",ll_contact_id)
//	end if
//else
//	dw_contact.getchild("contact_id",ldwc_contact)
//	ldwc_contact.setfilter("")
//	ldwc_contact.filter()
//	ldwc_contact.setfilter(" facility_id = 0 " )
//	ldwc_contact.filter()
//	ldwc_contact.setsort("last_name A")
//	ldwc_contact.sort()
//	dw_company.setitem(1,"facility_id",ll_facility_id)
//	dw_contact.setitem(1,"contact_id",ll_contact_id)
//	end if
////company info
//	dw_1.setfilter("")
//	dw_1.filter()
//	dw_1.setfilter(ls_filter)
//	dw_1.filter()
//	dw_1.setsort("facility_name A")
//	dw_1.sort()
//	//contact info
//	dw_2.setfilter("")
//	dw_2.filter()
//	dw_2.setfilter(ls_filter)
//	dw_2.filter()
//	dw_2.setsort("last_name A")
//	dw_2.sort()

end event

type st_1 from statictext within w_merge_company
integer x = 27
integer y = 56
integer width = 535
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 80263581
string text = "Company Category:"
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_merge_company
integer x = 18
integer width = 3941
integer height = 160
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 80263581
borderstyle borderstyle = stylebox!
end type

type gb_2 from groupbox within w_merge_company
integer x = 18
integer y = 144
integer width = 3941
integer height = 160
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 80263581
borderstyle borderstyle = stylebox!
end type

type gb_3 from groupbox within w_merge_company
integer x = 18
integer y = 1252
integer width = 3941
integer height = 140
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 80263581
borderstyle borderstyle = stylebox!
end type

type r_1 from rectangle within w_merge_company
boolean visible = false
long linecolor = 255
integer linethickness = 4
long fillcolor = 16777215
integer x = 14
integer y = 312
integer width = 1664
integer height = 940
end type

type r_2 from rectangle within w_merge_company
boolean visible = false
long linecolor = 255
integer linethickness = 4
long fillcolor = 16777215
integer x = 14
integer y = 1404
integer width = 1664
integer height = 940
end type

type r_3 from rectangle within w_merge_company
boolean visible = false
long linecolor = 255
integer linethickness = 4
long fillcolor = 16777215
integer x = 2299
integer y = 1404
integer width = 1664
integer height = 940
end type

type r_4 from rectangle within w_merge_company
boolean visible = false
long linecolor = 255
integer linethickness = 4
long fillcolor = 16777215
integer x = 2299
integer y = 312
integer width = 1664
integer height = 940
end type

