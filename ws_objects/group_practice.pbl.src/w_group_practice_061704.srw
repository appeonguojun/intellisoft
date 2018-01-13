$PBExportHeader$w_group_practice_061704.srw
forward
global type w_group_practice_061704 from w_main
end type
type tab_1 from tab within w_group_practice_061704
end type
type tabpage_gp from userobject within tab_1
end type
type cb_add_gp from commandbutton within tabpage_gp
end type
type dw_pop from datawindow within tabpage_gp
end type
type cb_find_gp from commandbutton within tabpage_gp
end type
type cb_save from commandbutton within tabpage_gp
end type
type cbx_update from checkbox within tabpage_gp
end type
type tab_2 from tab within tabpage_gp
end type
type tabpage_browse from userobject within tab_2
end type
type dw_browse from u_dw within tabpage_browse
end type
type dw_search from u_dw within tabpage_browse
end type
type cb_search from commandbutton within tabpage_browse
end type
type cb_clear from commandbutton within tabpage_browse
end type
type cbx_anp from checkbox within tabpage_browse
end type
type cbx_amc from checkbox within tabpage_browse
end type
type rb_loc from radiobutton within tabpage_browse
end type
type rb_l_p from radiobutton within tabpage_browse
end type
type gb_search from groupbox within tabpage_browse
end type
type tabpage_browse from userobject within tab_2
dw_browse dw_browse
dw_search dw_search
cb_search cb_search
cb_clear cb_clear
cbx_anp cbx_anp
cbx_amc cbx_amc
rb_loc rb_loc
rb_l_p rb_l_p
gb_search gb_search
end type
type tabpage_detail from userobject within tab_2
end type
type dw_detail from u_dw within tabpage_detail
end type
type tabpage_detail from userobject within tab_2
dw_detail dw_detail
end type
type tabpage_ass_prac from userobject within tab_2
end type
type dw_prac from u_dw within tabpage_ass_prac
end type
type cb_link_prac from commandbutton within tabpage_ass_prac
end type
type st_3 from statictext within tabpage_ass_prac
end type
type cb_3 from commandbutton within tabpage_ass_prac
end type
type tabpage_ass_prac from userobject within tab_2
dw_prac dw_prac
cb_link_prac cb_link_prac
st_3 st_3
cb_3 cb_3
end type
type tabpage_survey from userobject within tab_2
end type
type uo_survey from pfc_cst_u_site_survey_collect_data within tabpage_survey
end type
type tabpage_survey from userobject within tab_2
uo_survey uo_survey
end type
type tab_2 from tab within tabpage_gp
tabpage_browse tabpage_browse
tabpage_detail tabpage_detail
tabpage_ass_prac tabpage_ass_prac
tabpage_survey tabpage_survey
end type
type cb_delete from commandbutton within tabpage_gp
end type
type cb_print from commandbutton within tabpage_gp
end type
type tabpage_gp from userobject within tab_1
cb_add_gp cb_add_gp
dw_pop dw_pop
cb_find_gp cb_find_gp
cb_save cb_save
cbx_update cbx_update
tab_2 tab_2
cb_delete cb_delete
cb_print cb_print
end type
type tabpage_group_master from userobject within tab_1
end type
type cb_addmgp from commandbutton within tabpage_group_master
end type
type cb_linksave from commandbutton within tabpage_group_master
end type
type cb_addloc from commandbutton within tabpage_group_master
end type
type dw_loc_links from datawindow within tabpage_group_master
end type
type cb_1 from commandbutton within tabpage_group_master
end type
type cb_2 from commandbutton within tabpage_group_master
end type
type ln_1 from line within tabpage_group_master
end type
type ln_2 from line within tabpage_group_master
end type
type ln_3 from line within tabpage_group_master
end type
type ln_4 from line within tabpage_group_master
end type
type ln_5 from line within tabpage_group_master
end type
type ln_6 from line within tabpage_group_master
end type
type ln_7 from line within tabpage_group_master
end type
type ln_8 from line within tabpage_group_master
end type
type st_33 from statictext within tabpage_group_master
end type
type dw_mg_browse from datawindow within tabpage_group_master
end type
type dw_mg_detail from datawindow within tabpage_group_master
end type
type tab_3 from tab within tabpage_group_master
end type
type tabpage_parent_browse from userobject within tab_3
end type
type st_1 from statictext within tabpage_parent_browse
end type
type tabpage_parent_browse from userobject within tab_3
st_1 st_1
end type
type tabpage_parent_detail from userobject within tab_3
end type
type st_54 from statictext within tabpage_parent_detail
end type
type tabpage_parent_detail from userobject within tab_3
st_54 st_54
end type
type tab_3 from tab within tabpage_group_master
tabpage_parent_browse tabpage_parent_browse
tabpage_parent_detail tabpage_parent_detail
end type
type tabpage_group_master from userobject within tab_1
cb_addmgp cb_addmgp
cb_linksave cb_linksave
cb_addloc cb_addloc
dw_loc_links dw_loc_links
cb_1 cb_1
cb_2 cb_2
ln_1 ln_1
ln_2 ln_2
ln_3 ln_3
ln_4 ln_4
ln_5 ln_5
ln_6 ln_6
ln_7 ln_7
ln_8 ln_8
st_33 st_33
dw_mg_browse dw_mg_browse
dw_mg_detail dw_mg_detail
tab_3 tab_3
end type
type tab_1 from tab within w_group_practice_061704
tabpage_gp tabpage_gp
tabpage_group_master tabpage_group_master
end type
type cb_about from commandbutton within w_group_practice_061704
end type
type cb_close from commandbutton within w_group_practice_061704
end type
type cb_4 from commandbutton within w_group_practice_061704
end type
end forward

global type w_group_practice_061704 from w_main
integer x = 5
integer y = 4
integer width = 3666
integer height = 2412
string title = "Practice Location"
tab_1 tab_1
cb_about cb_about
cb_close cb_close
cb_4 cb_4
end type
global w_group_practice_061704 w_group_practice_061704

type variables
n_ds ids_datastore

String is_open_for
String is_original_sql

Integer il_facility_id
long il_group_id
long ii_mgp_id

String is_sql
end variables

event open;call super::open;integer i

is_sql = tab_1.tabpage_gp.tab_2.tabpage_browse.dw_browse.GetSqlSelect()

tab_1.tabpage_gp.tab_2.tabpage_browse.rb_l_p.bringtotop = true
tab_1.tabpage_gp.tab_2.tabpage_browse.rb_loc.bringtotop = true

tab_1.tabpage_group_master.dw_mg_browse.settransobject(sqlca)
i = tab_1.tabpage_group_master.dw_mg_browse.retrieve()
IF i > 0 THEN
	ii_mgp_id = tab_1.tabpage_group_master.dw_mg_browse.getitemnumber( 1, "rec_id")
	tab_1.tabpage_group_master.dw_mg_detail.retrieve(ii_mgp_id)
	tab_1.tabpage_group_master.dw_loc_links.retrieve(ii_mgp_id)
	tab_1.tabpage_group_master.dw_mg_browse.SelectRow( 0, False )
	tab_1.tabpage_group_master.dw_mg_browse.SelectRow( 1, True )
END IF

if w_mdi.of_security_access( 1430 ) = 0 then
	tab_1.tabpage_gp.tab_2.tabpage_survey.visible = false
end if
 
 

end event

on w_group_practice_061704.create
int iCurrent
call super::create
this.tab_1=create tab_1
this.cb_about=create cb_about
this.cb_close=create cb_close
this.cb_4=create cb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.tab_1
this.Control[iCurrent+2]=this.cb_about
this.Control[iCurrent+3]=this.cb_close
this.Control[iCurrent+4]=this.cb_4
end on

on w_group_practice_061704.destroy
call super::destroy
destroy(this.tab_1)
destroy(this.cb_about)
destroy(this.cb_close)
destroy(this.cb_4)
end on

type tab_1 from tab within w_group_practice_061704
event create ( )
event destroy ( )
integer x = 41
integer y = 28
integer width = 3557
integer height = 2180
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 67108864
boolean raggedright = true
alignment alignment = right!
integer selectedtab = 1
tabpage_gp tabpage_gp
tabpage_group_master tabpage_group_master
end type

on tab_1.create
this.tabpage_gp=create tabpage_gp
this.tabpage_group_master=create tabpage_group_master
this.Control[]={this.tabpage_gp,&
this.tabpage_group_master}
end on

on tab_1.destroy
destroy(this.tabpage_gp)
destroy(this.tabpage_group_master)
end on

event selectionchanged;//if newindex = 2 then
//	tab_1.tabpage_group_master.dw_mg_browse.settransobject(sqlca)
//	tab_1.tabpage_group_master.dw_mg_browse.retrieve()
//end if
//
end event

type tabpage_gp from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 3520
integer height = 2052
long backcolor = 79741120
string text = "Practice Locations"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "Library5!"
long picturemaskcolor = 553648127
cb_add_gp cb_add_gp
dw_pop dw_pop
cb_find_gp cb_find_gp
cb_save cb_save
cbx_update cbx_update
tab_2 tab_2
cb_delete cb_delete
cb_print cb_print
end type

on tabpage_gp.create
this.cb_add_gp=create cb_add_gp
this.dw_pop=create dw_pop
this.cb_find_gp=create cb_find_gp
this.cb_save=create cb_save
this.cbx_update=create cbx_update
this.tab_2=create tab_2
this.cb_delete=create cb_delete
this.cb_print=create cb_print
this.Control[]={this.cb_add_gp,&
this.dw_pop,&
this.cb_find_gp,&
this.cb_save,&
this.cbx_update,&
this.tab_2,&
this.cb_delete,&
this.cb_print}
end on

on tabpage_gp.destroy
destroy(this.cb_add_gp)
destroy(this.dw_pop)
destroy(this.cb_find_gp)
destroy(this.cb_save)
destroy(this.cbx_update)
destroy(this.tab_2)
destroy(this.cb_delete)
destroy(this.cb_print)
end on

type cb_add_gp from commandbutton within tabpage_gp
integer x = 1961
integer y = 24
integer width = 297
integer height = 84
integer taborder = 10
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Add"
end type

event clicked;integer li_newrow

IF tab_2.SelectedTab = 4 THEN
	tab_1.tabpage_gp.tab_2.tabpage_survey.uo_survey.of_new_record ( il_group_id )
ELSE
	tab_2.selecttab(2)
	tab_1.tabpage_gp.tab_2.tabpage_detail.dw_detail.reset()
	li_newrow = tab_1.tabpage_gp.tab_2.tabpage_detail.dw_detail.insertrow(1)
	tab_1.tabpage_gp.cbx_update.visible = false
	tab_1.tabpage_gp.cb_find_gp.visible = true
END IF










end event

type dw_pop from datawindow within tabpage_gp
boolean visible = false
integer x = 795
integer y = 32
integer width = 133
integer height = 68
integer taborder = 20
boolean bringtotop = true
string dataobject = "d_group_prac_pop"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_find_gp from commandbutton within tabpage_gp
boolean visible = false
integer x = 1719
integer y = 20
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
string text = "Find"
end type

event clicked;long ll_addr
long ll_group
integer res

if tab_1.tabpage_gp.tab_2.tabpage_detail.dw_detail.rowcount() < 1 then return


open(w_practice_find)

ll_addr = message.doubleparm

if isnull(ll_addr) then return
if ll_addr = 0 then return

dw_pop.settransobject(sqlca)
dw_pop.retrieve(ll_addr)

ll_group = tab_1.tabpage_gp.tab_2.tabpage_detail.dw_detail.getitemnumber(1,"rec_id")

if not(isnull(ll_group)) then 
	res = messagebox("Repopulating existing Group Practice Information","This Group Practice already has an address.~n~r If you continue, you will have to update all practitioners connected to this group.~n~r Do you want to continue repopulating the address information?",question!,Yesno!,2)
end if

if res = 2 then return
//	return
//else
//	dw_pop.rowscopy(1, 1,primary!,tab_1.tabpage_gp.tab_2.tabpage_detail.dw_detail, 1000000, primary! )
//end if


tab_1.tabpage_gp.tab_2.tabpage_detail.dw_detail.setitem(1,"street",dw_pop.getitemstring(1,"street"))
tab_1.tabpage_gp.tab_2.tabpage_detail.dw_detail.setitem(1,"street_2",dw_pop.getitemstring(1,"street_2"))
tab_1.tabpage_gp.tab_2.tabpage_detail.dw_detail.setitem(1,"city",dw_pop.getitemstring(1,"city"))
tab_1.tabpage_gp.tab_2.tabpage_detail.dw_detail.setitem(1,"state",dw_pop.getitemnumber(1,"state"))
tab_1.tabpage_gp.tab_2.tabpage_detail.dw_detail.setitem(1,"zip",dw_pop.getitemstring(1,"zip"))
tab_1.tabpage_gp.tab_2.tabpage_detail.dw_detail.setitem(1,"county",dw_pop.getitemnumber(1,"county"))
tab_1.tabpage_gp.tab_2.tabpage_detail.dw_detail.setitem(1,"country",dw_pop.getitemnumber(1,"country"))
tab_1.tabpage_gp.tab_2.tabpage_detail.dw_detail.setitem(1,"phone",dw_pop.getitemstring(1,"phone"))
tab_1.tabpage_gp.tab_2.tabpage_detail.dw_detail.setitem(1,"fax",dw_pop.getitemstring(1,"fax"))
tab_1.tabpage_gp.tab_2.tabpage_detail.dw_detail.setitem(1,"e_mail_address",dw_pop.getitemstring(1,"e_mail_address"))
tab_1.tabpage_gp.tab_2.tabpage_detail.dw_detail.setitem(1,"web_address",dw_pop.getitemstring(1,"web_address"))
tab_1.tabpage_gp.tab_2.tabpage_detail.dw_detail.setitem(1,"contact_person",dw_pop.getitemstring(1,"contact_person"))
tab_1.tabpage_gp.tab_2.tabpage_detail.dw_detail.setitem(1,"business_mgr",dw_pop.getitemstring(1,"business_mgr"))
tab_1.tabpage_gp.tab_2.tabpage_detail.dw_detail.setitem(1,"office_mgr",dw_pop.getitemstring(1,"office_mgr"))
tab_1.tabpage_gp.tab_2.tabpage_detail.dw_detail.setitem(1,"tax_id",dw_pop.getitemstring(1,"tax_id"))
tab_1.tabpage_gp.tab_2.tabpage_detail.dw_detail.setitem(1,"routine_visit_appt",dw_pop.getitemstring(1,"routine_visit_appt"))
tab_1.tabpage_gp.tab_2.tabpage_detail.dw_detail.setitem(1,"urgent_visit_appt",dw_pop.getitemstring(1,"urgent_visit_appt"))
tab_1.tabpage_gp.tab_2.tabpage_detail.dw_detail.setitem(1,"emergency_visit_appt",dw_pop.getitemstring(1,"emergency_visit_appt"))
tab_1.tabpage_gp.tab_2.tabpage_detail.dw_detail.setitem(1,"handicapped_access",dw_pop.getitemnumber(1,"handicapped_access"))
tab_1.tabpage_gp.tab_2.tabpage_detail.dw_detail.setitem(1,"public_transportation",dw_pop.getitemnumber(1,"public_transportation"))
tab_1.tabpage_gp.tab_2.tabpage_detail.dw_detail.setitem(1,"non_emergency_appt",dw_pop.getitemstring(1,"non_emergency_appt"))

tab_1.tabpage_gp.tab_2.tabpage_detail.dw_detail.setitem(1,"mon_from",dw_pop.getitemstring(1,"mon_from"))
tab_1.tabpage_gp.tab_2.tabpage_detail.dw_detail.setitem(1,"mon_to",dw_pop.getitemstring(1,"mon_to"))
tab_1.tabpage_gp.tab_2.tabpage_detail.dw_detail.setitem(1,"tue_from",dw_pop.getitemstring(1,"tue_from"))
tab_1.tabpage_gp.tab_2.tabpage_detail.dw_detail.setitem(1,"tue_to",dw_pop.getitemstring(1,"tue_to"))
tab_1.tabpage_gp.tab_2.tabpage_detail.dw_detail.setitem(1,"wed_from",dw_pop.getitemstring(1,"wed_from"))
tab_1.tabpage_gp.tab_2.tabpage_detail.dw_detail.setitem(1,"wed_to",dw_pop.getitemstring(1,"wed_to"))
tab_1.tabpage_gp.tab_2.tabpage_detail.dw_detail.setitem(1,"thu_from",dw_pop.getitemstring(1,"thu_from"))
tab_1.tabpage_gp.tab_2.tabpage_detail.dw_detail.setitem(1,"thu_to",dw_pop.getitemstring(1,"thu_to"))
tab_1.tabpage_gp.tab_2.tabpage_detail.dw_detail.setitem(1,"fri_from",dw_pop.getitemstring(1,"fri_from"))
tab_1.tabpage_gp.tab_2.tabpage_detail.dw_detail.setitem(1,"fri_to",dw_pop.getitemstring(1,"fri_to"))
tab_1.tabpage_gp.tab_2.tabpage_detail.dw_detail.setitem(1,"sat_from",dw_pop.getitemstring(1,"sat_from"))
tab_1.tabpage_gp.tab_2.tabpage_detail.dw_detail.setitem(1,"sat_to",dw_pop.getitemstring(1,"sat_to"))
tab_1.tabpage_gp.tab_2.tabpage_detail.dw_detail.setitem(1,"sun_from",dw_pop.getitemstring(1,"sun_from"))
tab_1.tabpage_gp.tab_2.tabpage_detail.dw_detail.setitem(1,"sun_to",dw_pop.getitemstring(1,"sun_to"))

tab_1.tabpage_gp.tab_2.tabpage_detail.dw_detail.setitem(1,"mon_from2",dw_pop.getitemstring(1,"mon_from2"))
tab_1.tabpage_gp.tab_2.tabpage_detail.dw_detail.setitem(1,"mon_to2",dw_pop.getitemstring(1,"mon_to2"))
tab_1.tabpage_gp.tab_2.tabpage_detail.dw_detail.setitem(1,"tue_from2",dw_pop.getitemstring(1,"tue_from2"))
tab_1.tabpage_gp.tab_2.tabpage_detail.dw_detail.setitem(1,"tue_to2",dw_pop.getitemstring(1,"tue_to2"))
tab_1.tabpage_gp.tab_2.tabpage_detail.dw_detail.setitem(1,"wed_from2",dw_pop.getitemstring(1,"wed_from2"))
tab_1.tabpage_gp.tab_2.tabpage_detail.dw_detail.setitem(1,"wed_to2",dw_pop.getitemstring(1,"wed_to2"))
tab_1.tabpage_gp.tab_2.tabpage_detail.dw_detail.setitem(1,"thu_from2",dw_pop.getitemstring(1,"thu_from2"))
tab_1.tabpage_gp.tab_2.tabpage_detail.dw_detail.setitem(1,"thu_to2",dw_pop.getitemstring(1,"thu_to2"))
tab_1.tabpage_gp.tab_2.tabpage_detail.dw_detail.setitem(1,"fri_from2",dw_pop.getitemstring(1,"fri_from2"))
tab_1.tabpage_gp.tab_2.tabpage_detail.dw_detail.setitem(1,"fri_to2",dw_pop.getitemstring(1,"fri_to2"))
tab_1.tabpage_gp.tab_2.tabpage_detail.dw_detail.setitem(1,"sat_from2",dw_pop.getitemstring(1,"sat_from2"))
tab_1.tabpage_gp.tab_2.tabpage_detail.dw_detail.setitem(1,"sat_to2",dw_pop.getitemstring(1,"sat_to2"))
tab_1.tabpage_gp.tab_2.tabpage_detail.dw_detail.setitem(1,"sun_from2",dw_pop.getitemstring(1,"sun_from2"))
tab_1.tabpage_gp.tab_2.tabpage_detail.dw_detail.setitem(1,"sun_to2",dw_pop.getitemstring(1,"sun_to2"))












end event

type cb_save from commandbutton within tabpage_gp
integer x = 2569
integer y = 24
integer width = 297
integer height = 84
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Save"
end type

event clicked;long li_gp_id
long ll_recid

if isnull(tab_1.tabpage_gp.tab_2.tabpage_detail.dw_detail.getitemnumber(1,"state")) then
	messagebox("Data Incomplete","Please add data for state.")
	return
end if

if tab_1.tabpage_gp.tab_2.tabpage_detail.dw_detail.getitemstatus(1,0,primary!) = newmodified! then
	
	select max(rec_id) //maha moved here 103102
	into :li_gp_id
	from group_practice;
	
	if li_gp_id < 1 or isnull(li_gp_id) then li_gp_id = 0
	
	li_gp_id++
	
	tab_1.tabpage_gp.tab_2.tabpage_detail.dw_detail.setitem(1,"rec_id",li_gp_id)
	//tab_1.tabpage_gp.tab_2.tabpage_detail.dw_detail.update() //maha020303
	//commit using sqlca;
//	tab_1.tabpage_gp.cbx_update.visible = true
//	tab_1.tabpage_gp.cbx_update.checked = false
w_group_practice.Event pfc_Save()
	il_group_id = li_gp_id  //maha moved here 103102
elseif tab_1.tabpage_gp.tab_2.tabpage_detail.dw_detail.getitemstatus(1,0,primary!) = datamodified! then //maha111202
	//tab_1.tabpage_gp.tab_2.tabpage_detail.dw_detail.update()
	//commit using sqlca;
w_group_practice.Event pfc_Save()	
	//if tab_1.tabpage_gp.cbx_update.checked = true then //maha 111202
		openwithparm(w_gp_prac_update,il_group_id)
	//end if

//elseif tab_1.tabpage_gp.tab_2.tabpage_survey.uo_survey.tab_review.tabpage_setup.dw_setup.getitemstatus(1,0,primary!) = newmodified! then //maha111202
//	ll_recid = gnv_app.of_get_id( "RECORD_ID" )
//	messagebox("","Saving")
//	tab_1.tabpage_gp.tab_2.tabpage_survey.uo_survey.tab_review.tabpage_setup.dw_setup.setitem(1,"rec_id",ll_recid)
//	tab_1.tabpage_gp.tab_2.tabpage_survey.uo_survey.tab_review.tabpage_setup.dw_setup.setitem(1,"address_id",il_group_id)
//	tab_1.tabpage_gp.tab_2.tabpage_survey.uo_survey.tab_review.tabpage_setup.dw_setup.update()
else
	w_group_practice.Event pfc_Save()
end if





//tab_1.tabpage_gp.tab_2.tabpage_browse.dw_browse.retrieve()



//w_group_practice.Event pfc_Save()

tab_1.tabpage_gp.cb_find_gp.visible = false
end event

type cbx_update from checkbox within tabpage_gp
boolean visible = false
integer x = 1701
integer y = 32
integer width = 786
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Update associated practioners"
boolean checked = true
end type

type tab_2 from tab within tabpage_gp
event create ( )
event destroy ( )
integer x = 32
integer y = 132
integer width = 3461
integer height = 1896
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 80269524
boolean fixedwidth = true
boolean raggedright = true
tabposition tabposition = tabsonbottom!
integer selectedtab = 1
tabpage_browse tabpage_browse
tabpage_detail tabpage_detail
tabpage_ass_prac tabpage_ass_prac
tabpage_survey tabpage_survey
end type

on tab_2.create
this.tabpage_browse=create tabpage_browse
this.tabpage_detail=create tabpage_detail
this.tabpage_ass_prac=create tabpage_ass_prac
this.tabpage_survey=create tabpage_survey
this.Control[]={this.tabpage_browse,&
this.tabpage_detail,&
this.tabpage_ass_prac,&
this.tabpage_survey}
end on

on tab_2.destroy
destroy(this.tabpage_browse)
destroy(this.tabpage_detail)
destroy(this.tabpage_ass_prac)
destroy(this.tabpage_survey)
end on

event selectionchanging;integer gp_id
integer r

gp_id = il_group_id


//r = tab_1.tabpage_gp.tab_2.tabpage_detail.dw_detail.retrieve(gp_id)
//messagebox('rc',r)
//tab_1.tabpage_prac.dw_prac.retrieve(gp_id)
//tab_1.tabpage_site.dw_site.retrieve(gp_id)


end event

event selectionchanged;debugbreak()
if newindex = 1 then
	//cb_find_gp.visible = false

	tab_1.tabpage_gp.tab_2.tabpage_browse.gb_search.visible = true
	tab_1.tabpage_gp.tab_2.tabpage_browse.cb_search.visible = true
	tab_1.tabpage_gp.tab_2.tabpage_browse.cb_clear.visible = true	
	tab_1.tabpage_gp.tab_2.tabpage_browse.dw_search.visible = true
	tab_1.tabpage_gp.tab_2.tabpage_browse.cbx_anp.visible = true
	tab_1.tabpage_gp.tab_2.tabpage_browse.cbx_amc.visible = true
	tab_1.tabpage_gp.cb_delete.visible = true
	tab_1.tabpage_gp.tab_2.tabpage_browse.rb_l_p.bringtotop = true
	tab_1.tabpage_gp.tab_2.tabpage_browse.rb_loc.bringtotop = true

elseif newindex = 2 then //detail
	//cb_find_gp.visible = true
	tab_1.tabpage_gp.tab_2.tabpage_browse.cb_search.visible = false
	tab_1.tabpage_gp.tab_2.tabpage_browse.gb_search.visible = false
	tab_1.tabpage_gp.tab_2.tabpage_browse.cb_clear.visible = false
	tab_1.tabpage_gp.tab_2.tabpage_browse.dw_search.Visible = False	
	tab_1.tabpage_gp.tab_2.tabpage_browse.cbx_anp.visible = false
	tab_1.tabpage_gp.tab_2.tabpage_browse.cbx_amc.visible = false
	tab_1.tabpage_gp.cb_delete.visible = true
elseif newindex = 3 then //practitioners
//	tab_1.tabpage_gp.tab_2.tabpage_ass_prac.dw_prac.retrieve(il_group_id)
	tab_1.tabpage_gp.cb_delete.visible = false	
elseif newindex = 4 then //site survey
	tab_1.tabpage_gp.cb_delete.visible = true	
	Integer li_ans
	Integer li_cnt
	//Long ll_address_id
	String ls_full_address

	//ll_address_id = dw_address_search.GetItemNumber( dw_address_search.GetRow(), "rec_id" )
	//ls_full_address = dw_address_search.GetItemString( dw_address_search.GetRow(), "full_address" )

	SELECT Count( rec_id )  
	INTO :li_cnt  
	FROM pd_review_hdr  
	WHERE pd_review_hdr.address_id = :il_group_id   ;

	IF li_cnt = 0 THEN
		li_ans = MessageBox("Not Found", "There was no survey found for the selected address.  ~n~r Would you like to create a survey for this address?", Question!, YesNo!, 1 )
		IF li_ans = 2 THEN
			Return
		END IF
		tab_1.tabpage_gp.tab_2.tabpage_survey.uo_survey.of_new_record( il_group_id )
	ELSE
		tab_1.tabpage_gp.tab_2.tabpage_survey.uo_survey.of_retrieve_browse( il_group_id )		
	END IF

	//w_site_surveys.Title = "Site Survey    ( " + ls_full_address + " )"
end if
end event

type tabpage_browse from userobject within tab_2
event create ( )
event destroy ( )
integer x = 18
integer y = 16
integer width = 3424
integer height = 1768
long backcolor = 80269524
string text = "Location Search"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
string picturename = "Search!"
long picturemaskcolor = 553648127
dw_browse dw_browse
dw_search dw_search
cb_search cb_search
cb_clear cb_clear
cbx_anp cbx_anp
cbx_amc cbx_amc
rb_loc rb_loc
rb_l_p rb_l_p
gb_search gb_search
end type

on tabpage_browse.create
this.dw_browse=create dw_browse
this.dw_search=create dw_search
this.cb_search=create cb_search
this.cb_clear=create cb_clear
this.cbx_anp=create cbx_anp
this.cbx_amc=create cbx_amc
this.rb_loc=create rb_loc
this.rb_l_p=create rb_l_p
this.gb_search=create gb_search
this.Control[]={this.dw_browse,&
this.dw_search,&
this.cb_search,&
this.cb_clear,&
this.cbx_anp,&
this.cbx_amc,&
this.rb_loc,&
this.rb_l_p,&
this.gb_search}
end on

on tabpage_browse.destroy
destroy(this.dw_browse)
destroy(this.dw_search)
destroy(this.cb_search)
destroy(this.cb_clear)
destroy(this.cbx_anp)
destroy(this.cbx_amc)
destroy(this.rb_loc)
destroy(this.rb_l_p)
destroy(this.gb_search)
end on

type dw_browse from u_dw within tabpage_browse
integer x = 46
integer y = 696
integer width = 3333
integer height = 1036
integer taborder = 30
boolean bringtotop = true
string dataobject = "d_group_prac_search_all"
boolean hscrollbar = true
boolean hsplitscroll = true
end type

event clicked;call super::clicked;integer li_row

li_row = this.getclickedrow()

IF li_row > 0 THEN
	tab_1.tabpage_gp.tab_2.tabpage_browse.dw_browse.setrow(li_row)
	tab_1.tabpage_gp.tab_2.tabpage_browse.dw_browse.scrolltorow(li_row)
	tab_1.tabpage_gp.tab_2.tabpage_browse.dw_browse.selectrow(0,false)
	tab_1.tabpage_gp.tab_2.tabpage_browse.dw_browse.selectrow(li_row,true)

	//il_group_id = tab_1.tabpage_gp.tab_2.tabpage_browse.dw_browse.getitemnumber(li_row,"rec_id")
END IF



//messagebox("il_group_id",il_group_id)





end event

event constructor;call super::constructor;this.settransobject(sqlca)

DataWindowChild dwchild


This.GetChild( "state", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("state")
dwchild.InsertRow( 1 )

This.GetChild( "county", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("county")
dwchild.InsertRow( 1 )

This.GetChild( "country", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("country")
dwchild.InsertRow( 1 )

This.GetChild( "mailing_address", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("address type")
dwchild.InsertRow( 1 )
end event

event doubleclicked;call super::doubleclicked;IF row > 0 THEN
	tab_1.tabpage_gp.tab_2.selecttab(2)
	w_group_practice.Title = "Practice Locations     (" + This.GetItemString( row, "full_address" ) + ")"
END IF
end event

event retrieveend;call super::retrieveend;
IF rowcount > 0 THEN
	tab_1.tabpage_gp.tab_2.tabpage_browse.dw_browse.selectrow(1,True)
	il_group_id = tab_1.tabpage_gp.tab_2.tabpage_browse.dw_browse.getitemnumber(1,"rec_id")
END IF
end event

event rowfocuschanged;call super::rowfocuschanged;//integer gp_id
//
//gp_id = il_group_id
//messagebox("gp_id",gp_id)
//tab_1.tabpage_gp.tab_2.tabpage_detail.dw_detail.retrieve(gp_id)
//tab_1.tabpage_prac.dw_prac.retrieve(gp_id)
//tab_1.tabpage_site.dw_site.retrieve(gp_id)

IF currentrow > 0 THEN
	il_group_id = tab_1.tabpage_gp.tab_2.tabpage_browse.dw_browse.getitemnumber(currentrow, "rec_id" )
	tab_1.tabpage_gp.tab_2.tabpage_detail.dw_detail.retrieve(il_group_id)
	tab_1.tabpage_gp.tab_2.tabpage_ass_prac.dw_prac.retrieve(il_group_id)
	tab_1.tabpage_gp.tab_2.tabpage_survey.uo_survey.of_reset()//maha 061603
END IF
end event

type dw_search from u_dw within tabpage_browse
integer x = 91
integer y = 156
integer width = 2149
integer height = 476
integer taborder = 20
boolean bringtotop = true
string dataobject = "d_group_search"
boolean hscrollbar = true
end type

event constructor;call super::constructor;This.of_SetUpdateAble( False )
This.InsertRow( 0 )
This.InsertRow( 0 )
This.InsertRow( 0 )

//This.SetItem( 1, "search_type", "street" )
end event

event itemchanged;call super::itemchanged;
IF This.GetColumnName() = "search_type" THEN
	DataWindowChild dwchild
	This.GetChild( "criteria", dwchild )
	dwchild.SetTransObject( SQLCA )
	CHOOSE CASE Upper( data )
		CASE "COUNTY"
			dwchild.Retrieve("county")	
		CASE "STATE"
			dwchild.Retrieve("State")			
		CASE "LANGUAGE"
			dwchild.Retrieve("Foreign Languages")					
		CASE "SPECIALTY"
			dwchild.Retrieve("PRACTITIONER SPECIALTIES")			
		CASE "PROVIDER_TYPE"
			dwchild.Retrieve("Provider Types")									
	END CHOOSE
END IF




end event

event rowfocuschanged;call super::rowfocuschanged;if this.rowcount() < 1 then return //maha 092903
//IF This.GetColumnName() = "search_type" THEN
	DataWindowChild dwchild
	This.GetChild( "criteria", dwchild )
	dwchild.SetTransObject( SQLCA )
	CHOOSE CASE Upper( This.GetItemString( currentrow, "search_type" ))
		CASE "COUNTY"
			dwchild.Retrieve("county")	
		CASE "STATE"
			dwchild.Retrieve("State")			
		CASE "LANGUAGE"
			dwchild.Retrieve("Foreign Languages")					
		CASE "SPECIALTY"
			dwchild.Retrieve("PRACTITIONER SPECIALTIES")			
		CASE "PROVIDER_TYPE"
			dwchild.Retrieve("Provider Types")						
	END CHOOSE
//END IF




end event

type cb_search from commandbutton within tabpage_browse
integer x = 2277
integer y = 260
integer width = 311
integer height = 84
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Search"
end type

event clicked;Integer i
Integer li_rc
String ls_where
string stype

ls_where = " and " 

li_rc = dw_search.RowCount() 

dw_search.AcceptText()


if rb_l_p.checked = true then
	
	
	FOR i = 1 TO li_rc
		IF IsNull( dw_search.GetItemString( i, "search_type" ) )  THEN
			CONTINUE
		END IF
		ls_where = ls_where + dw_search.GetItemString( i, "search_type" ) +&
		" like '" + dw_search.GetItemString( i, "criteria" ) +"%' AND "
	END FOR
	
	ls_where = Mid( ls_where, 1, Len( ls_where ) - 5 )
	
	IF cbx_anp.Checked THEN
		ls_where = ls_where + " AND pd_address.accepting_new_patients = 581"
	END IF
	
	dw_browse.SetSqlSelect( is_sql + " " + ls_where )
	dw_browse.SetTransObject( SQLCA )
	dw_browse.Retrieve()


else

FOR i = 1 TO li_rc
	stype = dw_search.GetItemString( i, "search_type" )
	if stype = "Specialty" or stype = "Language" or stype = "Provider_type" then
		Messagebox("Search Error","You cannot use " + stype + " as a search criteria for a Locations Only search.")
		return
	end if
	
		IF IsNull( dw_search.GetItemString( i, "search_type" ) )  THEN
			CONTINUE
		END IF
		ls_where = ls_where + dw_search.GetItemString( i, "search_type" ) +&
		" like '" + dw_search.GetItemString( i, "criteria" ) +"%' AND "
	END FOR
	
	ls_where = Mid( ls_where, 1, Len( ls_where ) - 5 )
	
	
	dw_browse.SetSqlSelect( is_sql + " " + ls_where )
	dw_browse.SetTransObject( SQLCA )
	dw_browse.Retrieve()


end if







//string ls_filter = ""
//integer li_rtnval
//
//if isnull(sle_1.text) then return
//
//ls_filter = upper(sle_1.text)
//
//if ls_filter = "" then 
//	ls_filter = ""
//else
//	ls_filter = "upper(street) like '%" + ls_filter + "%'"
//
//end if
//	
//
//
////messagebox("filter",ls_filter)
////li_rtnval = 
//tab_1.tabpage_gp.tab_2.tabpage_browse.dw_browse.setfilter(ls_filter)  
////if li_rtnval = 1 then
//tab_1.tabpage_gp.tab_2.tabpage_browse.dw_browse.filter()
end event

type cb_clear from commandbutton within tabpage_browse
integer x = 2277
integer y = 152
integer width = 311
integer height = 84
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Clear"
end type

event clicked;dw_search.Reset()
dw_search.InsertRow( 0 )
dw_search.InsertRow( 0 )
dw_search.InsertRow( 0 )
dw_search.InsertRow( 0 )
//dw_search.SetItem( 1, "search_type", "street" )
end event

type cbx_anp from checkbox within tabpage_browse
integer x = 114
integer y = 544
integer width = 631
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Accepting New Patients   "
end type

type cbx_amc from checkbox within tabpage_browse
integer x = 750
integer y = 544
integer width = 539
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Accept Medicaid"
end type

type rb_loc from radiobutton within tabpage_browse
integer x = 91
integer y = 72
integer width = 425
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Locations only"
end type

event clicked;dw_browse.dataobject = "d_group_prac_search"//"d_group_prac_search1"
dw_browse.of_settransobject(sqlca)
is_sql = dw_browse.GetSqlSelect()
//dw_browse.retrieve()

cbx_amc.visible = false
cbx_anp.visible = false
end event

type rb_l_p from radiobutton within tabpage_browse
integer x = 526
integer y = 72
integer width = 709
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Locations and Practitioners"
boolean checked = true
end type

event clicked;dw_browse.dataobject = "d_group_prac_search_all"
dw_browse.of_settransobject(sqlca)
is_sql = dw_browse.GetSqlSelect()

cbx_amc.visible = true
cbx_anp.visible = true
end event

type gb_search from groupbox within tabpage_browse
integer x = 46
integer y = 16
integer width = 2615
integer height = 660
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "Search Criteria"
end type

type tabpage_detail from userobject within tab_2
event create ( )
event destroy ( )
integer x = 18
integer y = 16
integer width = 3424
integer height = 1768
long backcolor = 79741120
string text = "Location Detail"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "Cursor!"
long picturemaskcolor = 553648127
dw_detail dw_detail
end type

on tabpage_detail.create
this.dw_detail=create dw_detail
this.Control[]={this.dw_detail}
end on

on tabpage_detail.destroy
destroy(this.dw_detail)
end on

type dw_detail from u_dw within tabpage_detail
integer x = 41
integer y = 40
integer width = 3355
integer height = 1700
integer taborder = 11
boolean bringtotop = true
string dataobject = "d_group_data_entry"
boolean vscrollbar = false
end type

event constructor;call super::constructor;This.settransobject(sqlca)

DataWindowChild dwchild

This.GetChild( "state", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("state")
dwchild.InsertRow( 1 )

This.GetChild( "county", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("county")
dwchild.InsertRow( 1 )

This.GetChild( "country", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("country")
dwchild.InsertRow( 1 )

This.GetChild( "public_transportation", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("yes/no")
dwchild.InsertRow( 1 )

This.GetChild( "handicapped_access", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("yes/no")
dwchild.InsertRow( 1 )

This.GetChild( "mailing_address", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("address type")
dwchild.InsertRow( 1 )
end event

event losefocus;call super::losefocus;this.accepttext()
end event

type tabpage_ass_prac from userobject within tab_2
event create ( )
event destroy ( )
integer x = 18
integer y = 16
integer width = 3424
integer height = 1768
long backcolor = 79741120
string text = "Associated Practitioners"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "Picture!"
long picturemaskcolor = 553648127
dw_prac dw_prac
cb_link_prac cb_link_prac
st_3 st_3
cb_3 cb_3
end type

on tabpage_ass_prac.create
this.dw_prac=create dw_prac
this.cb_link_prac=create cb_link_prac
this.st_3=create st_3
this.cb_3=create cb_3
this.Control[]={this.dw_prac,&
this.cb_link_prac,&
this.st_3,&
this.cb_3}
end on

on tabpage_ass_prac.destroy
destroy(this.dw_prac)
destroy(this.cb_link_prac)
destroy(this.st_3)
destroy(this.cb_3)
end on

type dw_prac from u_dw within tabpage_ass_prac
integer x = 32
integer y = 196
integer width = 3337
integer height = 1500
integer taborder = 11
boolean bringtotop = true
string dataobject = "d_group_practitioners"
end type

event constructor;call super::constructor;this.settransobject(sqlca)

DataWindowChild dwchild


This.GetChild( "specialty", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("practitioner specialties")
dwchild.InsertRow( 1 )



This.GetChild( "specialty_order", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("specialty order")
dwchild.InsertRow( 1 )

This.GetChild( "accepting_new_patients", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("yes/no")
dwchild.InsertRow( 1 )



end event

event clicked;call super::clicked;integer r

r = this.getclickedrow()

this.setrow(r)
this.selectrow(0,false)
this.selectrow(r,true)



end event

type cb_link_prac from commandbutton within tabpage_ass_prac
integer x = 37
integer y = 56
integer width = 626
integer height = 88
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Establish Practitioner Links"
end type

event clicked;if il_group_id < 1 then
	messagebox("No practice selected.","Please go to the browse tab and select a practice location. ")
	return
end if

openwithparm(w_gp_prac_link,il_group_id)


tab_1.tabpage_gp.tab_2.tabpage_ass_prac.dw_prac.retrieve(il_group_id)
end event

type st_3 from statictext within tabpage_ass_prac
integer x = 3369
integer y = 1612
integer width = 64
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = right!
boolean focusrectangle = false
end type

event clicked;open(w_addr_gp_conversion)
end event

type cb_3 from commandbutton within tabpage_ass_prac
integer x = 672
integer y = 56
integer width = 672
integer height = 88
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Unlink Selected Practitioner"
end type

event clicked;integer res
long nullnum
setnull(nullnum)

res = messagebox("Delete Link?","Are you sure you want to remove the link for the selected pratitioner?",question!,yesno!,2)

if res = 1 then
	dw_prac.setitem(dw_prac.getrow(),"pd_address_gp_id",nullnum)
	dw_prac.update()
	commit using sqlca;
	dw_prac.retrieve(il_group_id)
end if
















end event

type tabpage_survey from userobject within tab_2
integer x = 18
integer y = 16
integer width = 3424
integer height = 1768
long backcolor = 79741120
string text = "Site Survey"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "DosEdit!"
long picturemaskcolor = 553648127
uo_survey uo_survey
end type

on tabpage_survey.create
this.uo_survey=create uo_survey
this.Control[]={this.uo_survey}
end on

on tabpage_survey.destroy
destroy(this.uo_survey)
end on

type uo_survey from pfc_cst_u_site_survey_collect_data within tabpage_survey
integer x = 18
integer y = 20
integer width = 3515
integer taborder = 21
boolean bringtotop = true
boolean border = false
end type

on uo_survey.destroy
call pfc_cst_u_site_survey_collect_data::destroy
end on

type cb_delete from commandbutton within tabpage_gp
integer x = 2267
integer y = 24
integer width = 293
integer height = 84
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Delete"
end type

event clicked;integer res
long loc_id
integer g

if tab_1.selectedtab = 1 then //maha061603
	if tab_1.tabpage_gp.tab_2.selectedtab = 4 then
		tab_1.tabpage_gp.tab_2.tabpage_survey.uo_survey.of_delete_survey()
	else
		if tab_1.tabpage_gp.tab_2.tabpage_browse.rb_l_p.checked = true then
			messagebox("Delete Practice Location","You can only delete from the locations only list.") 
			return
		end if
		
		res = messagebox("Delete Practice Location","Are you sure you want to delete the selected Practice location?",question!,yesno!,2)
		
		if res = 2 then return
		
		g = tab_1.tabpage_gp.tab_2.tabpage_browse.dw_browse.getrow()
		
		loc_id = tab_1.tabpage_gp.tab_2.tabpage_browse.dw_browse.getitemnumber(g,"rec_id")
		
		Update pd_address
		set gp_id = null
		where gp_id = :loc_id;
		commit using sqlca;
		
		tab_1.tabpage_gp.tab_2.tabpage_detail.dw_detail.deleterow(tab_1.tabpage_gp.tab_2.tabpage_detail.dw_detail.getrow())
		res = tab_1.tabpage_gp.tab_2.tabpage_detail.dw_detail.update()
		if res > 0 then //maha mod 010504
			commit using sqlca;
			tab_1.tabpage_gp.tab_2.tabpage_browse.dw_browse.deleterow(g)
		end if
	end if
end if

end event

type cb_print from commandbutton within tabpage_gp
boolean visible = false
integer x = 2098
integer y = 20
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
string text = "Print"
end type

event clicked;tab_1.tabpage_gp.tab_2.tabpage_survey.uo_survey.tab_review.tabpage_questions.dw_questions.print()
end event

type tabpage_group_master from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 3520
integer height = 2052
long backcolor = 79741120
string text = "Multi-location Groups"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "CreateLibrary5!"
long picturemaskcolor = 553648127
cb_addmgp cb_addmgp
cb_linksave cb_linksave
cb_addloc cb_addloc
dw_loc_links dw_loc_links
cb_1 cb_1
cb_2 cb_2
ln_1 ln_1
ln_2 ln_2
ln_3 ln_3
ln_4 ln_4
ln_5 ln_5
ln_6 ln_6
ln_7 ln_7
ln_8 ln_8
st_33 st_33
dw_mg_browse dw_mg_browse
dw_mg_detail dw_mg_detail
tab_3 tab_3
end type

on tabpage_group_master.create
this.cb_addmgp=create cb_addmgp
this.cb_linksave=create cb_linksave
this.cb_addloc=create cb_addloc
this.dw_loc_links=create dw_loc_links
this.cb_1=create cb_1
this.cb_2=create cb_2
this.ln_1=create ln_1
this.ln_2=create ln_2
this.ln_3=create ln_3
this.ln_4=create ln_4
this.ln_5=create ln_5
this.ln_6=create ln_6
this.ln_7=create ln_7
this.ln_8=create ln_8
this.st_33=create st_33
this.dw_mg_browse=create dw_mg_browse
this.dw_mg_detail=create dw_mg_detail
this.tab_3=create tab_3
this.Control[]={this.cb_addmgp,&
this.cb_linksave,&
this.cb_addloc,&
this.dw_loc_links,&
this.cb_1,&
this.cb_2,&
this.ln_1,&
this.ln_2,&
this.ln_3,&
this.ln_4,&
this.ln_5,&
this.ln_6,&
this.ln_7,&
this.ln_8,&
this.st_33,&
this.dw_mg_browse,&
this.dw_mg_detail,&
this.tab_3}
end on

on tabpage_group_master.destroy
destroy(this.cb_addmgp)
destroy(this.cb_linksave)
destroy(this.cb_addloc)
destroy(this.dw_loc_links)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.ln_1)
destroy(this.ln_2)
destroy(this.ln_3)
destroy(this.ln_4)
destroy(this.ln_5)
destroy(this.ln_6)
destroy(this.ln_7)
destroy(this.ln_8)
destroy(this.st_33)
destroy(this.dw_mg_browse)
destroy(this.dw_mg_detail)
destroy(this.tab_3)
end on

type cb_addmgp from commandbutton within tabpage_group_master
integer x = 64
integer y = 964
integer width = 366
integer height = 84
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Add Parent"
end type

event clicked;
dw_mg_browse.Visible = False
dw_mg_detail.Visible = True	

tab_3.SelectedTab = 2

tab_1.tabpage_group_master.dw_mg_detail.Reset()
tab_1.tabpage_group_master.dw_mg_detail.insertrow(1)
dw_mg_detail.SetFocus()
dw_mg_detail.SetColumn( "gp_name" )
end event

type cb_linksave from commandbutton within tabpage_group_master
integer x = 2569
integer y = 24
integer width = 297
integer height = 84
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Save"
end type

event clicked;integer li_mgroup_id
integer i

if tab_1.tabpage_group_master.dw_mg_detail.getitemstatus(1,0,primary!) = newmodified! then
	select max(rec_id)
	into :li_mgroup_id
	from group_multi_loc;
	//messagebox("",li_mgroup_id)
	if li_mgroup_id < 1 OR IsNull( li_mgroup_id) then li_mgroup_id = 0
	
	li_mgroup_id++
	//messagebox("",li_mgroup_id)
	ii_mgp_id = li_mgroup_id
	//messagebox("",ii_mgp_id)
	tab_1.tabpage_group_master.dw_mg_detail.setitem(1,"rec_id",li_mgroup_id)
end if

tab_1.tabpage_group_master.dw_mg_detail.update()
commit using sqlca;

tab_1.tabpage_group_master.dw_mg_browse.retrieve()

i = tab_1.tabpage_group_master.dw_mg_browse.find("rec_id = " + string(ii_mgp_id),1,tab_1.tabpage_group_master.dw_mg_browse.rowcount())
//messagebox("",i)
if i > 0 then
	tab_1.tabpage_group_master.dw_mg_browse.setrow(i)
	tab_1.tabpage_group_master.dw_mg_browse.scrolltorow(i)
	tab_1.tabpage_group_master.dw_mg_browse.selectrow(0,false)
	tab_1.tabpage_group_master.dw_mg_browse.selectrow(i,true)
end if
tab_1.tabpage_group_master.dw_loc_links.Retrieve(ii_mgp_id )


end event

type cb_addloc from commandbutton within tabpage_group_master
integer x = 27
integer y = 1916
integer width = 366
integer height = 84
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Add Location"
end type

event clicked;long li_linkrow
long li_link_id
long li_loc_id
long li_mgp_id


if tab_1.tabpage_group_master.dw_mg_browse.rowcount() < 1 then return

cb_linksave.triggerevent(clicked!)

open(w_practice_to_addr_find)

li_loc_id = message.doubleparm
if li_loc_id < 1 then return

li_mgp_id = ii_mgp_id

li_linkrow = tab_1.tabpage_group_master.dw_loc_links.insertrow(0)
 
//tab_1.tabpage_group_master.dw_loc_links.setrow(li_linkrow) 
//tab_1.tabpage_group_master.dw_loc_links.scrolltorow(li_linkrow)
//tab_1.tabpage_group_master.dw_loc_links.selectrow(0,false)
//tab_1.tabpage_group_master.dw_loc_links.selectrow(li_linkrow,true)
 

select max(rec_id)
into :li_link_id
from group_loc_link;
	
if li_link_id < 1 OR IsNull( li_link_id ) then li_link_id = 0
	
li_link_id++
tab_1.tabpage_group_master.dw_loc_links.setitem( li_linkrow,"group_loc_link_rec_id",li_link_id)
//messagebox("li_loc_id",li_loc_id)
tab_1.tabpage_group_master.dw_loc_links.setitem( li_linkrow,"group_loc_link_loc_id",li_loc_id)
//messagebox("li_mgp_id",li_mgp_id)
tab_1.tabpage_group_master.dw_loc_links.setitem( li_linkrow,"group_loc_link_group_id",li_mgp_id)

tab_1.tabpage_group_master.dw_loc_links.update()
commit using sqlca;

tab_1.tabpage_group_master.dw_loc_links.retrieve(ii_mgp_id)

end event

type dw_loc_links from datawindow within tabpage_group_master
integer x = 23
integer y = 1228
integer width = 3465
integer height = 660
integer taborder = 50
boolean bringtotop = true
string dataobject = "d_group_linked_locations"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)

DataWindowChild dwchild


This.GetChild( "state", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("state")
dwchild.InsertRow( 1 )


This.GetChild( "practice_type", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("practice type")
dwchild.InsertRow( 1 )

end event

event clicked;integer li_row

li_row = this.getclickedrow()

IF li_row > 0 THEN
	this.setrow(li_row)
	this.scrolltorow(li_row)
	this.selectrow(0,false)
	this.selectrow(li_row,true)

END IF
end event

type cb_1 from commandbutton within tabpage_group_master
integer x = 439
integer y = 964
integer width = 366
integer height = 84
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Delete Parent"
end type

event clicked;integer res
integer r

res = messagebox("Delete","Are you sure you want to delete the selected Group and all its links?(will not effect practice locations)",question!,yesno!,2)

if res = 1 then
	for r = 1 to tab_1.tabpage_group_master.dw_loc_links.rowcount()
		tab_1.tabpage_group_master.dw_loc_links.deleterow(r)
	next
	tab_1.tabpage_group_master.dw_mg_browse.deleterow(0)
end if

dw_mg_browse.Visible = True
dw_mg_detail.Visible = False	

end event

type cb_2 from commandbutton within tabpage_group_master
integer x = 402
integer y = 1916
integer width = 366
integer height = 84
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Delete Location"
end type

event clicked;integer res

res = messagebox("Delete","Are you sure you want to delete the selected link?",question!,yesno!,2)

if res = 1 then
	tab_1.tabpage_group_master.dw_loc_links.deleterow(0)

tab_1.tabpage_group_master.dw_loc_links.update()
commit using sqlca;

end if
end event

type ln_1 from line within tabpage_group_master
long linecolor = 32768
integer linethickness = 8
integer beginx = 1728
integer beginy = 1068
integer endx = 1728
integer endy = 1128
end type

type ln_2 from line within tabpage_group_master
long linecolor = 33554432
integer linethickness = 8
integer beginx = 2606
integer beginy = 3688
integer endx = 2606
integer endy = 3764
end type

type ln_3 from line within tabpage_group_master
long linecolor = 33554432
integer linethickness = 8
integer beginx = 2789
integer beginy = 3688
integer endx = 2789
integer endy = 3764
end type

type ln_4 from line within tabpage_group_master
long linecolor = 33554432
integer linethickness = 8
integer beginx = 2446
integer beginy = 3688
integer endx = 2446
integer endy = 3764
end type

type ln_5 from line within tabpage_group_master
long linecolor = 33554432
integer linethickness = 8
integer beginx = 2263
integer beginy = 3688
integer endx = 2263
integer endy = 3764
end type

type ln_6 from line within tabpage_group_master
long linecolor = 32768
integer linethickness = 8
integer beginx = 1449
integer beginy = 1132
integer endx = 2007
integer endy = 1136
end type

type ln_7 from line within tabpage_group_master
long linecolor = 32768
integer linethickness = 8
integer beginx = 2007
integer beginy = 1136
integer endx = 2007
integer endy = 1232
end type

type ln_8 from line within tabpage_group_master
long linecolor = 32768
integer linethickness = 8
integer beginx = 1454
integer beginy = 1140
integer endx = 1454
integer endy = 1236
end type

type st_33 from statictext within tabpage_group_master
integer x = 32
integer y = 1164
integer width = 763
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
boolean enabled = false
string text = "Associated Group / Location"
boolean focusrectangle = false
end type

type dw_mg_browse from datawindow within tabpage_group_master
integer x = 64
integer y = 208
integer width = 3369
integer height = 740
integer taborder = 30
string dataobject = "d_multi_group_browse"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event clicked;integer li_row

li_row = this.getclickedrow()

tab_1.tabpage_group_master.dw_mg_detail.setrow(li_row)
tab_1.tabpage_group_master.dw_mg_detail.scrolltorow(li_row)

IF li_row < 1 then return
ii_mgp_id = this.getitemnumber( li_row, "rec_id") 
This.SelectRow( 0, False )
This.SelectRow( li_row, True )
end event

event constructor;This.settransobject(sqlca)
dw_mg_detail.settransobject(sqlca)
dw_loc_links.settransobject(sqlca)
This.Retrieve()


end event

event retrieveend;
//IF rowcount > 0 THEN
//	//ii_mgp_id = this.getitemnumber( 1, "rec_id")
//	tab_1.tabpage_group_master.dw_mg_detail.retrieve(ii_mgp_id)
//	tab_1.tabpage_group_master.dw_loc_links.retrieve(ii_mgp_id)
//	This.SelectRow( 0, False )
//	This.SelectRow( 1, True )
//END IF

end event

event rowfocuschanged;tab_1.tabpage_group_master.dw_mg_detail.retrieve(ii_mgp_id)
tab_1.tabpage_group_master.dw_loc_links.retrieve(ii_mgp_id)
end event

event doubleclicked;
IF row > 0 THEN
	dw_mg_browse.Visible = False
	dw_mg_detail.Visible = True	
	tab_3.SelectedTab = 2
END IF
end event

type dw_mg_detail from datawindow within tabpage_group_master
integer x = 64
integer y = 208
integer width = 3369
integer height = 740
integer taborder = 40
string dataobject = "d_multi_group_detail"
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)

end event

type tab_3 from tab within tabpage_group_master
integer x = 18
integer y = 28
integer width = 3474
integer height = 1048
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 80269524
boolean fixedwidth = true
boolean raggedright = true
integer selectedtab = 1
tabpage_parent_browse tabpage_parent_browse
tabpage_parent_detail tabpage_parent_detail
end type

on tab_3.create
this.tabpage_parent_browse=create tabpage_parent_browse
this.tabpage_parent_detail=create tabpage_parent_detail
this.Control[]={this.tabpage_parent_browse,&
this.tabpage_parent_detail}
end on

on tab_3.destroy
destroy(this.tabpage_parent_browse)
destroy(this.tabpage_parent_detail)
end on

event selectionchanged;IF newindex = 1 THEN
	dw_mg_browse.Visible = True
	dw_mg_detail.Visible = False
ELSE
	dw_mg_browse.Visible = False
	dw_mg_detail.Visible = True	
END IF
end event

type tabpage_parent_browse from userobject within tab_3
integer x = 18
integer y = 112
integer width = 3438
integer height = 920
long backcolor = 80269524
string text = "Browse"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
string picturename = "Justify!"
long picturemaskcolor = 553648127
st_1 st_1
end type

on tabpage_parent_browse.create
this.st_1=create st_1
this.Control[]={this.st_1}
end on

on tabpage_parent_browse.destroy
destroy(this.st_1)
end on

type st_1 from statictext within tabpage_parent_browse
integer x = 27
integer y = 12
integer width = 594
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
boolean enabled = false
string text = "Parent Organization"
boolean focusrectangle = false
end type

type tabpage_parent_detail from userobject within tab_3
integer x = 18
integer y = 112
integer width = 3438
integer height = 920
long backcolor = 80269524
string text = "Detail"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
string picturename = "ArrangeTables!"
long picturemaskcolor = 553648127
st_54 st_54
end type

on tabpage_parent_detail.create
this.st_54=create st_54
this.Control[]={this.st_54}
end on

on tabpage_parent_detail.destroy
destroy(this.st_54)
end on

type st_54 from statictext within tabpage_parent_detail
integer x = 27
integer y = 12
integer width = 594
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
boolean enabled = false
string text = "Parent Organization"
boolean focusrectangle = false
end type

type cb_about from commandbutton within w_group_practice_061704
integer x = 2930
integer y = 164
integer width = 311
integer height = 84
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&About"
end type

event clicked;messagebox("Using the Group Practice Module","The Group practice module allows users to connect practitioners addresses to a practice.  These links can then be used for group practice reporting and Site surveys." +& 
"  ")
end event

type cb_close from commandbutton within w_group_practice_061704
integer x = 3250
integer y = 164
integer width = 297
integer height = 84
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Close"
end type

event clicked;close(parent)
end event

type cb_4 from commandbutton within w_group_practice_061704
boolean visible = false
integer x = 1778
integer y = 28
integer width = 247
integer height = 108
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "none"
end type

event clicked;messagebox("il_group_id",il_group_id)
end event

