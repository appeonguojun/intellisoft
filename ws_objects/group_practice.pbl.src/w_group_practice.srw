$PBExportHeader$w_group_practice.srw
forward
global type w_group_practice from w_main
end type
type tab_1 from tab within w_group_practice
end type
type tabpage_gp from userobject within tab_1
end type
type cb_next from commandbutton within tabpage_gp
end type
type cb_prior from commandbutton within tabpage_gp
end type
type cb_add_gp from commandbutton within tabpage_gp
end type
type dw_pop from datawindow within tabpage_gp
end type
type cb_find_gp from commandbutton within tabpage_gp
end type
type cb_save from commandbutton within tabpage_gp
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
type rb_loc from radiobutton within tabpage_browse
end type
type rb_l_p from radiobutton within tabpage_browse
end type
type gb_search from groupbox within tabpage_browse
end type
type cb_sort from commandbutton within tabpage_browse
end type
type tabpage_browse from userobject within tab_2
dw_browse dw_browse
dw_search dw_search
cb_search cb_search
cb_clear cb_clear
cbx_anp cbx_anp
rb_loc rb_loc
rb_l_p rb_l_p
gb_search gb_search
cb_sort cb_sort
end type
type tabpage_detail from userobject within tab_2
end type
type dw_detail from u_dw within tabpage_detail
end type
type tabpage_detail from userobject within tab_2
dw_detail dw_detail
end type
type tabpage_data from userobject within tab_2
end type
type uo_data from pfc_cst_u_group_data within tabpage_data
end type
type tabpage_data from userobject within tab_2
uo_data uo_data
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
tabpage_data tabpage_data
tabpage_ass_prac tabpage_ass_prac
tabpage_survey tabpage_survey
end type
type cb_delete from commandbutton within tabpage_gp
end type
type cb_print from commandbutton within tabpage_gp
end type
type cb_export from commandbutton within tabpage_gp
end type
type cb_import from commandbutton within tabpage_gp
end type
type dw_imp_surv from datawindow within tabpage_gp
end type
type tabpage_gp from userobject within tab_1
cb_next cb_next
cb_prior cb_prior
cb_add_gp cb_add_gp
dw_pop dw_pop
cb_find_gp cb_find_gp
cb_save cb_save
tab_2 tab_2
cb_delete cb_delete
cb_print cb_print
cb_export cb_export
cb_import cb_import
dw_imp_surv dw_imp_surv
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
type dw_mg_detail from datawindow within tabpage_group_master
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
tab_3 tab_3
dw_mg_detail dw_mg_detail
end type
type tab_1 from tab within w_group_practice
tabpage_gp tabpage_gp
tabpage_group_master tabpage_group_master
end type
type cb_about from commandbutton within w_group_practice
end type
type cb_close from commandbutton within w_group_practice
end type
end forward

global type w_group_practice from w_main
integer x = 5
integer y = 4
integer width = 3557
integer height = 2256
string title = "Practice Location"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
boolean center = true
tab_1 tab_1
cb_about cb_about
cb_close cb_close
end type
global w_group_practice w_group_practice

type variables
n_ds ids_datastore

String is_open_for
String is_original_sql

Integer il_facility_id
long il_group_id
long ii_mgp_id

String is_sql

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-01
//$<add> 02.09.2006 By: LeiWei
//$<reason> Performance tuning
//$<modification> Define variables to be used in subsequent script.
Boolean ib_tabpage_data_created = False
Boolean ib_tabpage_detail_created = False
Boolean ib_tabpage_ass_prac_created = False
Boolean ib_tabpage_survey_created = False
Boolean ib_delete = False
//---------------------------- APPEON END ----------------------------

long	il_CurPractice,il_CurGroup			//Added by Scofield on 2008-01-04

end variables

forward prototypes
public function integer of_next_record (string as_dir)
end prototypes

public function integer of_next_record (string as_dir);//Start Code Change ---- 06.08.2006 #527 maha 
//function added new 060806 for additional data prior/next buttons

datawindow ldw_browse
datawindow ldw_detail
integer li_cnt
integer r
integer nr
integer go = 0

ldw_browse = tab_1.tabpage_gp.tab_2.tabpage_data.uo_data.tab_1.tabpage_browse.dw_browse
ldw_detail = tab_1.tabpage_gp.tab_2.tabpage_data.uo_data.tab_1.tabpage_detail.dw_detail

li_cnt = ldw_browse.rowcount()
r = ldw_browse.getrow()
//debugbreak()
if ldw_browse.rowcount() > 1 then
	choose case as_dir
		case "N"
			if r < li_cnt then
				nr = r + 1
				go = 1
			end if
		case "P"
			if r > 1 then
				nr = r - 1
				go = 1
			end if
	end choose
	if go = 1 then
		ldw_browse.scrolltorow(nr)
		ldw_browse.setrow(nr )
		ldw_browse.selectrow(0,false)
		ldw_browse.selectrow(nr,true)
		ldw_detail.scrolltorow(nr )
		ldw_detail.setrow(nr)
	end if
end if

return 1
end function

event open;call super::open;//--------------------------- APPEON BEGIN ---------------------------
//$<add> 09.13.2006 By: LeiWei
//$<reason> Making the Contract Module a Standalone Product
IF gb_contract_version THEN
	Title = "Locations"
	tab_1.tabpage_gp.text = "Location"
	tab_1.tabpage_group_master.text = "Multi-Locations"
	//Start Code Change ----04.21.2008 #V8 maha - not needed for contacts only
	tab_1.tabpage_gp.tab_2.tabpage_browse.rb_l_p .visible = false
	tab_1.tabpage_gp.tab_2.tabpage_browse.rb_loc .visible = false
//tab_1.tabpage_gp.tab_2.tabpage_browse.cbx_amc .visible = false //Start Code Change ----07.28.2008 #V85 maha - removed, no functionality attached
	tab_1.tabpage_gp.tab_2.tabpage_browse.cbx_anp .visible = false
	//End Code Change---04.21.2008
END IF
//---------------------------- APPEON END ----------------------------

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-02
//$<comment> 01.23.2006 By: LeiWei
//$<reason> Performance tuning
//$<modification> Move the following script to the Constructor event of tab_1.
//$<modification> due to the usage of CreateOnDemand property. Refer to PT-03 for more information.
/*
//Move the following script to Constructor event of tab_1.tabpage_gp.tab_2.tabpage_browse.dw_browse.
is_sql = tab_1.tabpage_gp.tab_2.tabpage_browse.dw_browse.GetSqlSelect()

//Move the following script to Constructor event of tab_1.tabpage_gp.tab_2.tabpage_browse.
tab_1.tabpage_gp.tab_2.tabpage_browse.rb_l_p.bringtotop = true
tab_1.tabpage_gp.tab_2.tabpage_browse.rb_loc.bringtotop = true

//Move the following script to Constructor event of tab_1.tabpage_group_master
integer i
tab_1.tabpage_group_master.dw_mg_browse.settransobject(sqlca)

i = tab_1.tabpage_group_master.dw_mg_browse.retrieve()
IF i > 0 THEN
	ii_mgp_id = tab_1.tabpage_group_master.dw_mg_browse.getitemnumber( 1, "rec_id")
	tab_1.tabpage_group_master.dw_mg_detail.retrieve(ii_mgp_id)
	tab_1.tabpage_group_master.dw_loc_links.retrieve(ii_mgp_id)
	tab_1.tabpage_group_master.dw_mg_browse.SelectRow( 0, False )
	tab_1.tabpage_group_master.dw_mg_browse.SelectRow( 1, True )
END IF

//$<reason> The scripts moved to tab_1.tabpage_gp::constructor event.
//Start Code Change ---- 05.11.2006 #436 maha  //added module security
if of_get_app_setting("set_site","I") = 0 then
	tab_1.tabpage_gp.tab_2.tabpage_survey.visible = false
else
	if w_mdi.of_security_access( 1430 ) = 0 then
		tab_1.tabpage_gp.tab_2.tabpage_survey.visible = false
	end if
end if
//End Code Change---05.10.2006

tab_1.tabpage_gp.tab_2.tabpage_browse.cb_search.triggerevent(clicked!)
*/ 
//---------------------------- APPEON END ----------------------------

end event

on w_group_practice.create
int iCurrent
call super::create
this.tab_1=create tab_1
this.cb_about=create cb_about
this.cb_close=create cb_close
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.tab_1
this.Control[iCurrent+2]=this.cb_about
this.Control[iCurrent+3]=this.cb_close
end on

on w_group_practice.destroy
call super::destroy
destroy(this.tab_1)
destroy(this.cb_about)
destroy(this.cb_close)
end on

event closequery;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  closequery
//
//	Description:
//	Search for unsaved datawindows prompting the user if any
//	pending updates are found.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0   Initial version
// 6.0	Enhanced control on what objects are to be updated.
// 6.0.01 Make sure the window is not minimized and behind other windows.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

Constant Integer	ALLOW_CLOSE = 0
Constant Integer	PREVENT_CLOSE = 1

Integer	li_msg
Integer	li_rc
String	ls_msgparms[]
Powerobject lpo_updatearray[]

// Check if the CloseQuery process has been disabled
If ib_disableclosequery Then
	Return ALLOW_CLOSE
End If

// Call event to perform any pre-CloseQuery processing
If This.Event pfc_preclose ( ) <> 1 Then
	// Prevent the window from closing
	Return PREVENT_CLOSE 
End If

// Prevent validation error messages from appearing while the window is closing
// and allow others to check if the  CloseQuery process is in progress
ib_closestatus = True

// Determine the objects for which an update will be attempted.
// For the CloseQuery, the order sequence is as follows: 
//		1) Specified permananent sequence (thru of_SetUpdateObjects(...)).
//		2) None was specified, so use default window control array.
If UpperBound(ipo_updateobjects) > 0 Then
	lpo_updatearray = ipo_updateobjects
Else
	lpo_updatearray = This.Control		
End If

// Check for any pending updates
li_rc = of_UpdateChecks(lpo_updatearray)
If li_rc = 0 Then
	// Updates are NOT pending, allow the window to be closed.
	ib_closestatus = False
	Return ALLOW_CLOSE
ElseIf li_rc < 0 Then
	// Make sure the window is not minimized and behind other windows.
	If this.WindowState = Minimized! Then
		this.WindowState = Normal!
	End If
	this.BringToTop = True

	// There are Updates pending, but at least one data entry error was found.
	// Give the user an opportunity to close the window without saving changes
	If IsValid(gnv_app.inv_error) Then
		li_msg = gnv_app.inv_error.of_Message('pfc_closequery_failsvalidation', &
					 ls_msgparms, gnv_app.iapp_object.DisplayName)
	Else
		li_msg = of_MessageBox ("pfc_master_closequery_failsvalidation", &
					gnv_app.iapp_object.DisplayName, &
					"The information entered does not pass validation and "  + &
					"must be corrected before changes can be saved.~r~n~r~n" + &
					"Close without saving changes?", &
					exclamation!, YesNo!, 2)
	End If
	If li_msg = 1 Then
		ib_closestatus = False
		Return ALLOW_CLOSE
	End If
Else
	// Make sure the window is not minimized and behind other windows.
	If this.WindowState = Minimized! Then
		this.WindowState = Normal!
	End If	
	this.BringToTop = True
	
	// Changes are pending, prompt the user to determine if they should be saved
	If IsValid(gnv_app.inv_error) Then
		li_msg = gnv_app.inv_error.of_Message('pfc_closequery_savechanges',  &
					ls_msgparms, gnv_app.iapp_object.DisplayName)		
	Else
		li_msg = of_MessageBox ("pfc_master_closequery_savechanges", &
					gnv_app.iapp_object.DisplayName, &
					"Do you want to save changes?", exclamation!, YesNoCancel!, 1)
	End If
	Choose Case li_msg
		Case 1
			// YES - Update
			// If the update fails, prevent the window from closing
			tab_1.tabpage_gp.cb_save.Event Clicked()		//Add by Scofield 2007-09-25
			If This.Event pfc_save() >= 1 Then
				// Successful update, allow the window to be closed
				ib_closestatus = False
				Return ALLOW_CLOSE
			End If
		Case 2
			// NO - Allow the window to be closed without saving changes
			ib_closestatus = False
			Return ALLOW_CLOSE
		Case 3
			// CANCEL -  Prevent the window from closing
	End Choose
End If

// Prevent the window from closing
ib_closestatus = False
Return PREVENT_CLOSE
end event

type tab_1 from tab within w_group_practice
event create ( )
event destroy ( )
integer x = 9
integer y = 8
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
boolean createondemand = true
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
event ue_init ( )
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
cb_next cb_next
cb_prior cb_prior
cb_add_gp cb_add_gp
dw_pop dw_pop
cb_find_gp cb_find_gp
cb_save cb_save
tab_2 tab_2
cb_delete cb_delete
cb_print cb_print
cb_export cb_export
cb_import cb_import
dw_imp_surv dw_imp_surv
end type

on tabpage_gp.create
this.cb_next=create cb_next
this.cb_prior=create cb_prior
this.cb_add_gp=create cb_add_gp
this.dw_pop=create dw_pop
this.cb_find_gp=create cb_find_gp
this.cb_save=create cb_save
this.tab_2=create tab_2
this.cb_delete=create cb_delete
this.cb_print=create cb_print
this.cb_export=create cb_export
this.cb_import=create cb_import
this.dw_imp_surv=create dw_imp_surv
this.Control[]={this.cb_next,&
this.cb_prior,&
this.cb_add_gp,&
this.dw_pop,&
this.cb_find_gp,&
this.cb_save,&
this.tab_2,&
this.cb_delete,&
this.cb_print,&
this.cb_export,&
this.cb_import,&
this.dw_imp_surv}
end on

on tabpage_gp.destroy
destroy(this.cb_next)
destroy(this.cb_prior)
destroy(this.cb_add_gp)
destroy(this.dw_pop)
destroy(this.cb_find_gp)
destroy(this.cb_save)
destroy(this.tab_2)
destroy(this.cb_delete)
destroy(this.cb_print)
destroy(this.cb_export)
destroy(this.cb_import)
destroy(this.dw_imp_surv)
end on

event ue_init();//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-03
//$<modify> 01.23.2006 By: LeiWei
//$<reason> Performance tuning
//$<modification> Copy the following script from the Open event of w_group_practice due
//$<modification> to the usage of CreateOnDemand. Refer to PT-02 for more information.

//$<modify> 09.13.2006 By: LeiWei
//Start Code Change ---- 05.11.2006 #436 maha  //added module security
/*
if of_get_app_setting("set_site","I") = 0 then
	tab_1.tabpage_gp.tab_2.tabpage_survey.hide()
else
	if w_mdi.of_security_access( 1430 ) = 0 then
		tab_1.tabpage_gp.tab_2.tabpage_survey.hide()
	end if
end if
//End Code Change---05.10.2006
*/
IF gb_contract_version THEN
	This.setredraw( False )

	tab_1.tabpage_gp.tab_2.tabpage_survey.hide()
	tab_2.tabpage_ass_prac.Hide() //rodger wu added.
	tab_1.tabpage_gp.tab_2.tabpage_browse.rb_l_p.Hide( )
	tab_1.tabpage_gp.tab_2.tabpage_browse.dw_browse.Modify("practice_type_t.text='Location Name' ")

	tab_1.tabpage_gp.tab_2.selecttab( 3 )
	tab_1.tabpage_gp.tab_2.selecttab( 1 )

	tab_1.tabpage_gp.tab_2.tabpage_Data.text = "Additional Detail"
	
	This.setredraw( True )
ELSE
	//Start Code Change ---- 05.11.2006 #436 maha  //added module security
	if of_get_app_setting("set_site","I") = 0 then
		tab_1.tabpage_gp.tab_2.tabpage_survey.hide()
	else
		if w_mdi.of_security_access( 1430 ) = 0 then
			tab_1.tabpage_gp.tab_2.tabpage_survey.hide()
		end if
	end if
	//End Code Change---05.10.2006
END IF

tab_1.tabpage_gp.tab_2.tabpage_browse.cb_search.triggerevent(clicked!)
//---------------------------- APPEON END ----------------------------

end event

event constructor;//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-04  Brayn
//$<add> 02.09.2006 By: LeiWei
//$<reason> Performance tuning

//$<reason> Beacuse the tab_1.tabpage_gp.tab_2 control is set createondemand property
//$<reason> So create the tab_1.tabpage_gp.tab_2.tabpage_detail if it has not been created
tab_1.tabpage_gp.tab_2.selecttab(2)
tab_1.tabpage_gp.tab_2.selecttab(1)

//$<reason> Adds the user-defined event ue_init to the end of event queue in the tabpage.
This.TriggerEvent( "ue_init" )

//---------------------------- APPEON END ----------------------------

end event

type cb_next from commandbutton within tabpage_gp
boolean visible = false
integer x = 1865
integer y = 24
integer width = 187
integer height = 84
integer taborder = 21
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Next->"
end type

event clicked;//Start Code Change ---- 06.08.2006 #526 maha
of_next_record("N")
end event

type cb_prior from commandbutton within tabpage_gp
boolean visible = false
integer x = 1678
integer y = 24
integer width = 183
integer height = 84
integer taborder = 21
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "<-Prior"
end type

event clicked;//Start Code Change ---- 06.08.2006 #525 maha
of_next_record("P")
end event

type cb_add_gp from commandbutton within tabpage_gp
integer x = 2062
integer y = 24
integer width = 347
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

IF tab_2.SelectedTab = 5 THEN //site
	tab_1.tabpage_gp.tab_2.tabpage_survey.uo_survey.of_new_record ( il_group_id )
elseif tab_2.SelectedTab = 3 THEN //other data
	tab_1.tabpage_gp.tab_2.tabpage_data.uo_data.of_add()
ELSE
	tab_2.selecttab(2) //detail
	
	if tab_1.tabpage_gp.tab_2.tabpage_detail.dw_detail.rowcount() > 0 then //maha 061004
		if IsNull(tab_1.tabpage_gp.tab_2.tabpage_detail.dw_detail.getitemnumber(1,"state")) then
			MessageBox("Data Incomplete","Please add data for state.")
			return
		end if
	end if
	
	cb_save.TriggerEvent(Clicked!)
	tab_1.tabpage_gp.tab_2.tabpage_detail.dw_detail.reset()
	li_newrow = tab_1.tabpage_gp.tab_2.tabpage_detail.dw_detail.insertrow(1)
	//tab_1.tabpage_gp.cbx_update.visible = false // removed maha 060904
	tab_1.tabpage_gp.cb_find_gp.visible = true
	tab_1.tabpage_gp.tab_2.tabpage_detail.dw_detail.SetFocus( )
	
	tab_1.tabpage_gp.tab_2.tabpage_browse.dw_browse.selectrow(0,false)	//Start Code Change ----04.21.2008 #V8 maha - adding code so a new record can be deleted.
	
	
	
END IF

end event

type dw_pop from datawindow within tabpage_gp
boolean visible = false
integer x = 27
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
integer x = 1321
integer y = 24
integer width = 347
integer height = 84
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Find"
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
integer x = 2775
integer y = 24
integer width = 347
integer height = 84
integer taborder = 12
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



//Comment by jervis -- 12.17.2009
/*
if tab_1.tabpage_gp.tab_2.tabpage_detail.dw_detail.rowcount() > 0 then //maha 061004
	if isnull(tab_1.tabpage_gp.tab_2.tabpage_detail.dw_detail.getitemnumber(1,"state")) then
		messagebox("Data Incomplete","Please add data for state.")
		return
	end if
end if
*/

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
	//openwithparm(w_gp_prac_update,il_group_id)
	IF not gb_contract_version THEN openwithparm(w_gp_prac_update,il_group_id) //Alfee 04.22.2008
	
	//end if

//elseif tab_1.tabpage_gp.tab_2.tabpage_survey.uo_survey.tab_review.tabpage_setup.dw_setup.getitemstatus(1,0,primary!) = newmodified! then //maha111202
//	ll_recid = gnv_app.of_get_id( "RECORD_ID" )
//	messagebox("","Saving")
//	tab_1.tabpage_gp.tab_2.tabpage_survey.uo_survey.tab_review.tabpage_setup.dw_setup.setitem(1,"rec_id",ll_recid)
//	tab_1.tabpage_gp.tab_2.tabpage_survey.uo_survey.tab_review.tabpage_setup.dw_setup.setitem(1,"address_id",il_group_id)
//	tab_1.tabpage_gp.tab_2.tabpage_survey.uo_survey.tab_review.tabpage_setup.dw_setup.update()
elseif tab_1.tabpage_gp.tab_2.selectedtab = 3 then 
	tab_1.tabpage_gp.tab_2.tabpage_data.uo_data.of_save()
else
	w_group_practice.Event pfc_Save()
end if





//tab_1.tabpage_gp.tab_2.tabpage_browse.dw_browse.retrieve()



//w_group_practice.Event pfc_Save()

tab_1.tabpage_gp.cb_find_gp.visible = false
end event

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
boolean createondemand = true
tabposition tabposition = tabsonbottom!
integer selectedtab = 1
tabpage_browse tabpage_browse
tabpage_detail tabpage_detail
tabpage_data tabpage_data
tabpage_ass_prac tabpage_ass_prac
tabpage_survey tabpage_survey
end type

on tab_2.create
this.tabpage_browse=create tabpage_browse
this.tabpage_detail=create tabpage_detail
this.tabpage_data=create tabpage_data
this.tabpage_ass_prac=create tabpage_ass_prac
this.tabpage_survey=create tabpage_survey
this.Control[]={this.tabpage_browse,&
this.tabpage_detail,&
this.tabpage_data,&
this.tabpage_ass_prac,&
this.tabpage_survey}
end on

on tab_2.destroy
destroy(this.tabpage_browse)
destroy(this.tabpage_detail)
destroy(this.tabpage_data)
destroy(this.tabpage_ass_prac)
destroy(this.tabpage_survey)
end on

event selectionchanging;integer gp_id
integer r

gp_id = il_group_id

tab_1.tabpage_gp.cb_save.triggerevent(clicked!)	  //Start Code Change ----04.21.2008 #V8 maha



//r = tab_1.tabpage_gp.tab_2.tabpage_detail.dw_detail.retrieve(gp_id)
//messagebox('rc',r)
//tab_1.tabpage_prac.dw_prac.retrieve(gp_id)
//tab_1.tabpage_site.dw_site.retrieve(gp_id)


end event

event selectionchanged;//debugbreak()
tab_1.tabpage_gp.cb_export.visible = false
tab_1.tabpage_gp.cb_import.visible = false
tab_1.tabpage_gp.cb_print.visible = false
tab_1.tabpage_gp.cb_next.visible = false
tab_1.tabpage_gp.cb_prior.visible = false
if newindex = 1 then
	//cb_find_gp.visible = false

	//tab_1.tabpage_gp.tab_2.tabpage_browse.gb_search.visible = true
	//tab_1.tabpage_gp.tab_2.tabpage_browse.cb_search.visible = true
	tab_1.tabpage_gp.tab_2.tabpage_browse.cb_clear.visible = true	
	tab_1.tabpage_gp.tab_2.tabpage_browse.dw_search.visible = true
	tab_1.tabpage_gp.tab_2.tabpage_browse.cbx_anp.visible = true
//	tab_1.tabpage_gp.tab_2.tabpage_browse.cbx_amc.visible = true  //Start Code Change ----07.28.2008 #V85 maha - removed, no functionality attached
	tab_1.tabpage_gp.cb_delete.visible = true
	tab_1.tabpage_gp.tab_2.tabpage_browse.rb_l_p.bringtotop = true
	tab_1.tabpage_gp.tab_2.tabpage_browse.rb_loc.bringtotop = true
	
	//--------------------------- APPEON BEGIN ---------------------------
	//$<add> 09.13.2006 By: LeiWei
	//$<reason> Making the Contract Module a Standalone Product
	IF gb_contract_version THEN
		tab_1.tabpage_gp.tab_2.tabpage_browse.cbx_anp.visible = FALSE
//		tab_1.tabpage_gp.tab_2.tabpage_browse.cbx_amc.visible = FALSE  //Start Code Change ----07.28.2008 #V85 maha - removed, no functionality attached
	END IF
	//---------------------------- APPEON END ----------------------------

elseif newindex = 2 then //detail
	//cb_find_gp.visible = true
//	tab_1.tabpage_gp.tab_2.tabpage_browse.cb_search.visible = false
//	tab_1.tabpage_gp.tab_2.tabpage_browse.gb_search.visible = false
	tab_1.tabpage_gp.tab_2.tabpage_browse.cb_clear.visible = false
	tab_1.tabpage_gp.tab_2.tabpage_browse.dw_search.Visible = False	
	tab_1.tabpage_gp.tab_2.tabpage_browse.cbx_anp.visible = false
//	tab_1.tabpage_gp.tab_2.tabpage_browse.cbx_amc.visible = false  //Start Code Change ----07.28.2008 #V85 maha - removed, no functionality attached
	tab_1.tabpage_gp.cb_delete.visible = true
elseif newindex = 3 then //data
	tab_1.tabpage_gp.tab_2.tabpage_data.uo_data.dw_select_section.retrieve()
	tab_1.tabpage_gp.cb_delete.visible = true
	tab_1.tabpage_gp.cb_next.visible = true
	tab_1.tabpage_gp.cb_prior.visible = true

elseif newindex = 4 then //practitioners
//	tab_1.tabpage_gp.tab_2.tabpage_ass_prac.dw_prac.retrieve(il_group_id)
	tab_1.tabpage_gp.cb_delete.visible = false	
elseif newindex = 5 then //site survey
	
	tab_1.tabpage_gp.tab_2.tabpage_survey.uo_survey.il_gp_id = il_group_id
	
	tab_1.tabpage_gp.cb_delete.visible = true	
	tab_1.tabpage_gp.cb_export.visible = true
	tab_1.tabpage_gp.cb_import.visible = true
	tab_1.tabpage_gp.cb_print.visible = true
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
rb_loc rb_loc
rb_l_p rb_l_p
gb_search gb_search
cb_sort cb_sort
end type

on tabpage_browse.create
this.dw_browse=create dw_browse
this.dw_search=create dw_search
this.cb_search=create cb_search
this.cb_clear=create cb_clear
this.cbx_anp=create cbx_anp
this.rb_loc=create rb_loc
this.rb_l_p=create rb_l_p
this.gb_search=create gb_search
this.cb_sort=create cb_sort
this.Control[]={this.dw_browse,&
this.dw_search,&
this.cb_search,&
this.cb_clear,&
this.cbx_anp,&
this.rb_loc,&
this.rb_l_p,&
this.gb_search,&
this.cb_sort}
end on

on tabpage_browse.destroy
destroy(this.dw_browse)
destroy(this.dw_search)
destroy(this.cb_search)
destroy(this.cb_clear)
destroy(this.cbx_anp)
destroy(this.rb_loc)
destroy(this.rb_l_p)
destroy(this.gb_search)
destroy(this.cb_sort)
end on

type dw_browse from u_dw within tabpage_browse
integer x = 46
integer y = 692
integer width = 3333
integer height = 1036
integer taborder = 30
boolean bringtotop = true
string dataobject = "d_group_prac_search"
boolean hscrollbar = true
boolean hsplitscroll = true
end type

event clicked;call super::clicked;integer li_Row

li_Row = this.getclickedrow()

IF li_Row > 0 THEN
	tab_1.tabpage_gp.tab_2.tabpage_browse.dw_browse.setrow(li_Row)
	tab_1.tabpage_gp.tab_2.tabpage_browse.dw_browse.scrolltorow(li_Row)
	tab_1.tabpage_gp.tab_2.tabpage_browse.dw_browse.selectrow(0,false)
	tab_1.tabpage_gp.tab_2.tabpage_browse.dw_browse.selectrow(li_Row,true)
	
	if li_Row = il_CurPractice then This.Trigger Event RowFocusChanged(li_Row)	//Added by Scofield on 2008-01-04
END IF

end event

event constructor;//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-05
//$<add> 02.09.2006 By: LeiWei
//$<reason> Performance tuning
//$<modification> 1) Copy the following script from the Open event of w_group_practice due
//$<modification> to the usage of CreateOnDemand. Refer to PT-02 for more information.
//$<modification> 2) Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

is_sql = tab_1.tabpage_gp.tab_2.tabpage_browse.dw_browse.GetSqlSelect()

gnv_appeondb.of_startqueue( )
//---------------------------- APPEON END ----------------------------

this.of_settransobject(sqlca)
This.of_SetUpdateAble( true )

DataWindowChild dwchild


This.GetChild( "state", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("state")
//dwchild.InsertRow( 1 )

This.GetChild( "county", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("county")
//dwchild.InsertRow( 1 )

This.GetChild( "country", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("country")
//dwchild.InsertRow( 1 )

This.GetChild( "mailing_address", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("address type")
//dwchild.InsertRow( 1 )

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-06
//$<add> 02.09.2006 By: LeiWei
//$<reason> Performance tuning
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

gnv_appeondb.of_commitqueue( )

This.GetChild( "state", dwchild )
dwchild.InsertRow( 1 )

This.GetChild( "county", dwchild )
dwchild.InsertRow( 1 )

This.GetChild( "country", dwchild )
dwchild.InsertRow( 1 )

This.GetChild( "mailing_address", dwchild )
dwchild.InsertRow( 1 )
//---------------------------- APPEON END ----------------------------

This.of_SetFilter(True)
this.settransobject(sqlca)
This.inv_Filter.of_SetStyle(inv_Filter.simple   )
This.inv_Filter.of_SetColumnDisplayNameStyle( 2 )
this.inv_filter.of_setrequestor( this)

end event

event doubleclicked;call super::doubleclicked;if row > 0 then
	tab_1.tabpage_gp.tab_2.selecttab(2)
end if

end event

event retrieveend;call super::retrieveend;//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 04.05.2006 By: LiuHongXin
//$<reason> Fix a defect.
/*
IF rowcount > 0 THEN
*/
IF tab_1.tabpage_gp.tab_2.tabpage_browse.dw_browse.RowCount() > 0 THEN
//---------------------------- APPEON END ----------------------------
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

	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> PT-07
	//$<modify> 02.09.2006 By: LeiWei
	//$<reason> Performance tuning
	//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.
	/*
	tab_1.tabpage_gp.tab_2.tabpage_data.uo_data.il_gpid = il_group_id //set variable in dat user object
	tab_1.tabpage_gp.tab_2.tabpage_detail.dw_detail.retrieve(il_group_id)
	tab_1.tabpage_gp.tab_2.tabpage_ass_prac.dw_prac.retrieve(il_group_id)
	tab_1.tabpage_gp.tab_2.tabpage_survey.uo_survey.of_reset()//maha 061603
	*/
	gnv_appeondb.of_startqueue( )

	If ib_tabpage_data_created Then tab_1.tabpage_gp.tab_2.tabpage_data.uo_data.il_gpid = il_group_id //set variable in dat user object
	If ib_tabpage_detail_created Then tab_1.tabpage_gp.tab_2.tabpage_detail.dw_detail.retrieve(il_group_id)
	If ib_tabpage_ass_prac_created Then tab_1.tabpage_gp.tab_2.tabpage_ass_prac.dw_prac.retrieve(il_group_id)
	If ib_tabpage_survey_created Then tab_1.tabpage_gp.tab_2.tabpage_survey.uo_survey.of_reset()//maha 061603

	gnv_appeondb.of_commitqueue( )
	//---------------------------- APPEON END ----------------------------

	//--------------------------- APPEON BEGIN ---------------------------
	//$<modify> 09.13.2006 By: LeiWei
	//$<reason> Making the Contract Module a Standalone Product
	//	w_group_practice.Title = "Practice Locations     (" + This.GetItemString( currentrow, "full_address" ) + ")"//maha moved here from d-click 082404
	IF gb_contract_version THEN
		w_group_practice.Title = "Locations (" + This.GetItemString( currentrow, "full_address" ) + ")"//maha moved here from d-click 082404
	ELSE
		w_group_practice.Title = "Practice Locations (" + This.GetItemString( currentrow, "full_address" ) + ")"//maha moved here from d-click 082404
	END IF
	//---------------------------- APPEON END ----------------------------
	il_CurPractice = CurrentRow		//Added by Scofield on 2008-01-04
END IF
end event

type dw_search from u_dw within tabpage_browse
integer x = 91
integer y = 156
integer width = 2080
integer height = 424
integer taborder = 20
boolean bringtotop = true
string dataobject = "d_group_search"
boolean hscrollbar = true
end type

event constructor;call super::constructor;This.of_SetUpdateAble( False )
This.InsertRow( 0 )
This.InsertRow( 0 )
This.InsertRow( 0 )
This.InsertRow( 0 )				//Added by Scofield on 2008-03-17

//This.SetItem( 1, "search_type", "street" )

end event

event itemchanged;call super::itemchanged;//--------------------------- APPEON BEGIN ---------------------------
//$<Commnet> 2008-04-16 By: Scofield
//$<Reason > Move it to dropdown event.
/*
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
		CASE ELSE
			dwchild.reset()
			this.setitem(row,'criteria','')
	END CHOOSE
END IF*/
//---------------------------- APPEON END ----------------------------

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

event dropdown;call super::dropdown;//--------------------------- APPEON BEGIN ---------------------------
//$< Add  > 2008-04-16 By: Scofield
//$<Reason> Refresh the drop down datawindow value

String	ls_Type
long		ll_Row

DataWindowChild ldwc_Child

if This.GetColumnName() = "criteria" then
	This.GetChild("criteria",ldwc_Child)
	ldwc_Child.SetTransObject(SQLCA)
	
	ll_Row = This.GetRow()
	ls_Type = This.GetItemString(ll_Row,'search_type')
	Choose Case Upper(ls_Type)
		Case "COUNTY"
			ldwc_Child.Retrieve("county")
		Case "STATE"
			ldwc_Child.Retrieve("State")
		Case "LANGUAGE"
			ldwc_Child.Retrieve("Foreign Languages")
		Case "SPECIALTY"
			ldwc_Child.Retrieve("PRACTITIONER SPECIALTIES")
		Case "PROVIDER_TYPE"
			ldwc_Child.Retrieve("Provider Types")
		Case else
			ldwc_Child.Reset()
	End Choose
End if
//---------------------------- APPEON END ----------------------------

end event

type cb_search from commandbutton within tabpage_browse
integer x = 2194
integer y = 320
integer width = 347
integer height = 92
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

SetPointer(HourGlass!) //alfee 12.12.2008

if rb_l_p.checked = true then //practitoners and locations
	//--------------------------- APPEON BEGIN ---------------------------
	//$<add> 2005-11-24 By: Zhang Lingping
	//$<reason> When query is filter, do not need key words 'and'
	ls_where = ""
	//---------------------------- APPEON END ----------------------------
	FOR i = 1 TO li_rc
	//Start Code Change ----04.01.2008 #V8 maha - corrected some of theis bad code causing failure on filters; used variable
	//also modifies some of the field names in d_group_prac_search_all to work correctly with the filters
		stype = dw_search.GetItemString( i, "search_type" )
		IF IsNull( stype )  THEN
			CONTINUE
		elseif stype = "street" then //04.01.2008 #V8 maha
			stype = "group_practice_group_street"
		END IF
		//--------------------------- APPEON BEGIN ---------------------------
		//$<modify> 08.25.2006 By: LeiWei
		//$<reason> Fix a defect.
		/*
		ls_where = ls_where + dw_search.GetItemString( i, "search_type" ) +&
		" like '" + dw_search.GetItemString( i, "criteria" ) +"%' AND "
		*/		
		//ls_where = ls_where + "(" + stype + " like '" + dw_search.GetItemString( i, "criteria" ) +"%') AND "
		ls_where = ls_where + "(Upper(" + stype + ") like '" + Upper(dw_search.GetItemString( i, "criteria" )) +"%') AND "		
		//---------------------------- APPEON END ----------------------------
	END FOR
	
	ls_where = Mid( ls_where, 1, Len( ls_where ) - 5 )
	
	//--------------------------- APPEON BEGIN ---------------------------
	//$<modify> 2005-11-24 By: Zhang Lingping
	//$<reason> The column in datawindow d_group_prac_search_all has alias,
	//$<reason> It is unsupported in SQL DB. So We changed the query mode from
	//$<reason> setsqlselect to setfilter.
	//IF cbx_anp.Checked THEN
	//	ls_where = ls_where + " AND pd_address.accepting_new_patients = 581"
	//END IF

	//dw_browse.SetSqlSelect( is_sql + " " + ls_where )

	IF cbx_anp.Checked THEN
		IF trim(ls_where) = "" THEN
			ls_where = "  accept_new_patient  = 581"
		ELSE
			ls_where = ls_where + " AND  accept_new_patient  = 581"
		END IF
	END IF

	integer lr 
	
	dw_browse.SetTransObject( SQLCA )
	
	if isnull(ls_where) then ls_where = ""
	
	SetRedraw(FALSE) //alfee 12.12.2008
	dw_browse.setfilter("")
	dw_browse.filter()
	lr = dw_browse.setfilter(ls_where)
	if lr < 0 then 
		SetRedraw(TRUE) //alfee 12.12.2008
		Messagebox("Setfilter","Error in w_group_practice cb_search::clicked: " + ls_where )
		return
	end if
	//---------------------------- APPEON END ----------------------------
	dw_browse.Retrieve()
	SetRedraw(TRUE) //alfee 12.12.2008

else //locations only

	FOR i = 1 TO li_rc
		stype = dw_search.GetItemString( i, "search_type" )
		if stype = "Specialty" or stype = "Language" or stype = "Provider_type" then
			Messagebox("Search Error","You cannot use " + stype + " as a search criteria for a Locations Only search.")
			return
		end if
		
			IF IsNull( dw_search.GetItemString( i, "search_type" ) )  THEN
				CONTINUE
			END IF
			
			//--------------------------- APPEON BEGIN ---------------------------
			//$<modify> 08.12.2006 By: LeiWei
			//$<reason> Fix a defect.
			/*
			ls_where = ls_where + dw_search.GetItemString( i, "search_type" ) +&
			" like '" + dw_search.GetItemString( i, "criteria" ) +"%' AND "
			*/
			IF gs_dbtype = "SQL" THEN
				IF Lower(stype) = "state" THEN stype = "code_lookup_a.description"
				IF Lower(stype) = "county" THEN stype = "code_lookup_b.description"
			END IF
				
			ls_where = ls_where + stype + " like '" + dw_search.GetItemString( i, "criteria" ) +"%' AND "
			//---------------------------- APPEON END ----------------------------
		END FOR
		
		ls_where = Mid( ls_where, 1, Len( ls_where ) - 5 )
	   // mskinner 09 Jan 2005 -- begin
		// do not make the change if not needed
		if len(trim(ls_where)) > 0 then 
			//--------------------------- APPEON BEGIN ---------------------------
			//$<modify> 2005-11-24 By: Chenyinghao
			//$<reason> Fix bug
			//	dw_browse.SetSqlSelect( is_sql + " " + ls_where)
			dw_browse.Modify('DataWindow.Table.Select="'+is_sql + '' + ls_where+'"')
			//---------------------------- APPEON END ----------------------------
		end if 
		// mskinner 09 Jan 2005 -- end
		
		SetRedraw(FALSE) //alfee 12.12.2008		
		dw_browse.SetTransObject( SQLCA )
		dw_browse.Retrieve()
		dw_browse.Modify("DataWindow.Table.updatetable='group_practice'") //maha 082404 reset update table to allow deletes
		SetRedraw(TRUE) //alfee 12.12.2008
end if

if dw_browse.rowcount() > 0 then 
	dw_browse.setrow(dw_browse.rowcount())
	dw_browse.setrow(1)
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
integer x = 2194
integer y = 156
integer width = 347
integer height = 92
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

dw_browse.SetSqlSelect( is_sql)

//--------------------------- APPEON BEGIN ---------------------------
//$< Add  > 2008-03-17 By: Scofield
//$<Reason> Reset update table to allow deletes.

dw_browse.SetTransObject( SQLCA )
dw_browse.Modify("DataWindow.Table.updatetable='group_practice'")
//---------------------------- APPEON END ----------------------------

dw_browse.retrieve()

end event

type cbx_anp from checkbox within tabpage_browse
integer x = 1545
integer y = 64
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
boolean checked = true
end type

event clicked;//--------------------------- APPEON BEGIN ---------------------------
//$<add> 09.13.2006 By: LeiWei
//$<reason> Fix a defect.
IF This.checked and gb_contract_version THEN RETURN		//Modified by Scofield on 2008-03-14: Add gb_contract_version condition
//---------------------------- APPEON END ----------------------------

dw_browse.dataobject = "d_group_prac_search"//"d_group_prac_search1"
dw_browse.of_settransobject(sqlca)
is_sql = dw_browse.GetSqlSelect()
//dw_browse.retrieve()

//cbx_amc.visible = false  //Start Code Change ----07.28.2008 #V85 maha - removed, no functionality attached
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
end type

event clicked;dw_browse.dataobject = "d_group_prac_search_all"
dw_browse.of_settransobject(sqlca)
is_sql = dw_browse.GetSqlSelect()

//cbx_amc.visible = true //Start Code Change ----07.28.2008 #V85 maha - removed; no functionality connected
cbx_anp.visible = true

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 09.13.2006 By: LeiWei
//$<reason> Making the Contract Module a Standalone Product
//IF gb_contract_version THEN//Start Code Change ----04.21.2008 #V8 maha - removed ; not needed - done in open event
//	tab_1.tabpage_gp.tab_2.tabpage_browse.cbx_anp.visible = FALSE
//	tab_1.tabpage_gp.tab_2.tabpage_browse.cbx_amc.visible = FALSE
//END IF
//---------------------------- APPEON END ----------------------------

end event

type gb_search from groupbox within tabpage_browse
integer x = 46
integer y = 16
integer width = 2560
integer height = 644
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

type cb_sort from commandbutton within tabpage_browse
integer x = 2194
integer y = 488
integer width = 347
integer height = 92
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Sort"
end type

event clicked;string null_str

SetNull(null_str)
dw_browse.SetSort(null_str)
dw_browse.Sort( )

dw_browse.SetFocus()
end event

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

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-09
//$<add> 02.09.2006 By: LeiWei
//$<reason> Performance tuning
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

gnv_appeondb.of_startqueue( )
//---------------------------- APPEON END ----------------------------

This.GetChild( "state", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("state")
//dwchild.InsertRow( 1 )

This.GetChild( "county", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("county")
//dwchild.InsertRow( 1 )

This.GetChild( "country", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("country")
//dwchild.InsertRow( 1 )

This.GetChild( "public_transportation", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("yes/no")
//dwchild.InsertRow( 1 )

This.GetChild( "handicapped_access", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("yes/no")
//dwchild.InsertRow( 1 )

This.GetChild( "mailing_address", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("address type")
//dwchild.InsertRow( 1 )

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-10
//$<add> 02.09.2006 By: LeiWei
//$<reason> Performance tuning
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

gnv_appeondb.of_commitqueue( )

This.GetChild( "state", dwchild )
dwchild.InsertRow( 1 )

This.GetChild( "county", dwchild )
dwchild.InsertRow( 1 )

This.GetChild( "country", dwchild )
dwchild.InsertRow( 1 )

This.GetChild( "public_transportation", dwchild )
dwchild.InsertRow( 1 )

This.GetChild( "handicapped_access", dwchild )
dwchild.InsertRow( 1 )

This.GetChild( "mailing_address", dwchild )
dwchild.InsertRow( 1 )

ib_tabpage_detail_created = True
//---------------------------- APPEON END ----------------------------


//--------------------------- APPEON BEGIN ---------------------------
//$<add> 09.13.2006 By: LeiWei
//$<reason> Making the Contract Module a Standalone Product
IF gb_contract_version THEN
	Modify(" gb_3.Visible=0 routine_visit_appt_t.Visible=0 routine_visit_appt.Visible=0 urgent_visit_appt_t.Visible=0 urgent_visit_appt.Visible=0 emergency_visit_appt_t.Visible=0 emergency_visit_appt.Visible=0 non_emergency_appt_t.Visible=0 non_emergency_appt.Visible=0 ")
	Modify(" practice_type_t.text='Location Name' ")
END IF
//---------------------------- APPEON END ----------------------------


end event

event losefocus;call super::losefocus;this.accepttext()
end event

event doubleclicked;call super::doubleclicked;//--------------------------- APPEON BEGIN ---------------------------
//$<  Add > 2007-10-29 By: Scofield
//$<Reason> Popup a dialog to input the phone

String	ls_Phone,ls_fax,ls_RetParm

This.AcceptText()
if row > 0 and row <= This.RowCount() then
	if dwo.name = 'phone' then
		ls_Phone = This.GetItemString(row,'phone')
		OpenWithParm(w_phonedetail,ls_Phone)
		
		ls_RetParm = Message.StringParm
		
		if ls_RetParm <> 'Cancel' then
			This.SetItem(row,'phone',ls_RetParm)
		end if
		This.SetColumn('phone')
	elseif dwo.name = 'fax' then
		ls_fax = This.GetItemString(row,'fax')
		if IsNull(ls_fax) then ls_fax = ""
		OpenWithParm(w_phonedetail,"Fax:" + ls_fax)
		
		ls_RetParm = Message.StringParm
		
		if ls_RetParm <> 'Cancel' then
			This.SetItem(row,'fax',ls_RetParm)
		end if
		This.SetColumn('fax')
	end if
end if

//---------------------------- APPEON END ----------------------------

end event

event buttonclicked;call super::buttonclicked;//--------------------------- APPEON BEGIN ---------------------------
//$<  Add > 2007-12-06 By: Scofield
//$<Reason> Popup a dialog to input the phone or fax

String	ls_Phone,ls_fax,ls_RetParm

This.AcceptText()
if row > 0 and row <= This.RowCount() then
	if dwo.name = 'b_phone' then
		ls_Phone = This.GetItemString(row,'phone')
		OpenWithParm(w_phonedetail,ls_Phone)
		
		ls_RetParm = Message.StringParm
		
		if ls_RetParm <> 'Cancel' then
			This.SetItem(row,'phone',ls_RetParm)
		end if
		This.SetColumn('phone')
	elseif dwo.name = 'b_fax' then
		ls_fax = This.GetItemString(row,'fax')
		if IsNull(ls_fax) then ls_fax = ""
		OpenWithParm(w_phonedetail,"Fax:" + ls_fax)
		
		ls_RetParm = Message.StringParm
		
		if ls_RetParm <> 'Cancel' then
			This.SetItem(row,'fax',ls_RetParm)
		end if
		This.SetColumn('fax')
	end if
end if

//---------------------------- APPEON END ----------------------------

end event

type tabpage_data from userobject within tab_2
integer x = 18
integer y = 16
integer width = 3424
integer height = 1768
long backcolor = 80269524
string text = "Practice Data"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
string picturename = "DataWindow5!"
long picturemaskcolor = 536870912
uo_data uo_data
end type

on tabpage_data.create
this.uo_data=create uo_data
this.Control[]={this.uo_data}
end on

on tabpage_data.destroy
destroy(this.uo_data)
end on

type uo_data from pfc_cst_u_group_data within tabpage_data
integer x = 5
integer height = 1716
integer taborder = 40
end type

on uo_data.destroy
call pfc_cst_u_group_data::destroy
end on

event constructor;call super::constructor;//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-11
//$<add> 02.09.2006 By: LeiWei
//$<reason> Performance tuning
//$<modification> Copy the following script from the Rowfocuschanged event of dw_browse due
//$<modification> to the usage of CreateOnDemand. Refer to PT-02 for more information.

If NOT ib_tabpage_data_created Then This.il_gpid = il_group_id
ib_tabpage_data_created = TRUE
//---------------------------- APPEON END ----------------------------

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

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-12
//$<add> 02.09.2006 By: LeiWei
//$<reason> Performance tuning
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

gnv_appeondb.of_startqueue( )
//---------------------------- APPEON END ----------------------------

This.GetChild( "specialty", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("practitioner specialties")
//dwchild.InsertRow( 1 )

This.GetChild( "specialty_order", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("specialty order")
//dwchild.InsertRow( 1 )

This.GetChild( "accepting_new_patients", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("yes/no")
//dwchild.InsertRow( 1 )

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-13
//$<add> 01.17.2006 By: LeiWei
//$<reason> Performance tuning
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

gnv_appeondb.of_commitqueue( )

This.GetChild( "specialty", dwchild )
dwchild.InsertRow( 1 )

This.GetChild( "specialty_order", dwchild )
dwchild.InsertRow( 1 )

This.GetChild( "accepting_new_patients", dwchild )
dwchild.InsertRow( 1 )

//$<reason> Because the tab_1.tabpage_gp.tab_2 control is set the createondemand property.
//$<reason> The scripts moved from tab_1.tabpage_gp.tab_2.tabpage_browse.dw_browse::rowfocuschanged event.
If Not ib_tabpage_ass_prac_created Then This.retrieve(il_group_id)
ib_tabpage_ass_prac_created = True
//---------------------------- APPEON END ----------------------------

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
	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> PT-14
	//$<add> 02.09.2006 By: LeiWei
	//$<reason> Performance tuning
	//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

	gnv_appeondb.of_startqueue( )
	//---------------------------- APPEON END ----------------------------
	
	dw_prac.update()
	commit using sqlca;
	dw_prac.retrieve(il_group_id)
	
	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> PT-15
	//$<add> 02.09.2006 By: LeiWei
	//$<reason> Performance tuning
	//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

	gnv_appeondb.of_commitqueue( )
	//---------------------------- APPEON END ----------------------------
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
string picturename = "StyleLibraryList5!"
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

event constructor;call super::constructor;//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-16
//$<add> 02.09.2006 By: LeiWei
//$<reason> Performance tuning
//$<modification> Copy the following script from the Rowfocuschanged event of dw_browse due
//$<modification> to the usage of CreateOnDemand. Refer to PT-02 for more information.

If NOT ib_tabpage_survey_created Then This.of_reset()
ib_tabpage_survey_created = TRUE
//---------------------------- APPEON END ----------------------------

end event

type cb_delete from commandbutton within tabpage_gp
integer x = 2418
integer y = 24
integer width = 347
integer height = 84
integer taborder = 11
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Delete"
end type

event clicked;boolean 	lb_match
integer 	res
integer 	li_CurRow
long 		loc_id
long 		pcnt,loc_cnt
long 		ll_dtl_id

if tab_1.selectedtab = 1 then //maha061603
	if tab_1.tabpage_gp.tab_2.selectedtab = 5 then //survey
		tab_1.tabpage_gp.tab_2.tabpage_survey.uo_survey.of_delete_survey()
	elseif tab_1.tabpage_gp.tab_2.selectedtab = 3 then //group data
		tab_1.tabpage_gp.tab_2.tabpage_data.uo_data.of_delete()
	else
		if tab_1.tabpage_gp.tab_2.tabpage_browse.rb_l_p.checked = true then
			messagebox("Delete Practice Location","You can only delete from the locations only list.") 
			return
		end if
		
		li_CurRow = tab_1.tabpage_gp.tab_2.tabpage_browse.dw_browse.getrow()
		if li_CurRow <= 0 then return			//Added By Scofield on 2008-03-17
		
		loc_id = tab_1.tabpage_gp.tab_2.tabpage_browse.dw_browse.getitemnumber(li_CurRow,"rec_id")
		//Start Code Change ----04.21.2008 #V8 maha
		ll_dtl_id = 	tab_1.tabpage_gp.tab_2.tabpage_detail.dw_detail.getitemnumber(1,"rec_id")
		
		if loc_id <> ll_dtl_id then 
			lb_match = false
			loc_id = ll_dtl_id
		end if
		//End Code Change---04.21.2008
		
		//Add by jervis 07.06.2010
		select count(loc_id) into :loc_cnt from ctx_loc where loc_id = :loc_id;
		if loc_cnt > 0 then //trap for connected contract records
//			messagebox("Delete","There are " + string(loc_cnt) + " Contract location record(s) linked to this Practice Location.  They must be deleted in Contracts before this record can be removed.")
//			return
			//Modified By Jay Chen 03-27-2014
			res = messagebox("Delete Location","There are " + string(loc_cnt) + " location record(s) in the contract(s) that are linked to this location. Are you sure you want to delete all these record(s) in the contract(s)?",question!,yesno!,2)
		else
			res = messagebox("Delete Location","Are you sure you want to delete this record?",question!,yesno!,2)
		end if
		if res = 2 then return
		
		select count(gp_id) into :pcnt from pd_address where gp_id = :loc_id;
		
		//Start Code Change ---- 04.13.2006 #393 maha corrected > sign and added delete of other data tables 
		if pcnt > 0 then
			res = messagebox("Delete Practice Location","This location has " + string(pcnt) + " Address record(s) connected to it.  Are you sure you want to delete the selected Practice location and clear the practice links from the addresses?",question!,yesno!,2)
		else
			if res = 0 then
				res = messagebox("Delete Practice Location","Are you sure you want to delete the selected Practice location?",question!,yesno!,2)
			end if
		end if
		
		if res = 2 then return
		
		//Start Code Change ----04.21.2008 #V8 maha - code added for delete of a new record not having been retrieved.
		if lb_match = true then
			tab_1.tabpage_gp.tab_2.tabpage_browse.dw_browse.of_SetUpdateAble( true )
			tab_1.tabpage_gp.tab_2.tabpage_browse.dw_browse.deleterow(li_CurRow)
			tab_1.tabpage_gp.tab_2.tabpage_detail.dw_detail.reset()
			
			//--------------------------- APPEON BEGIN ---------------------------
			//$< Add  > 2007-08-10 By: Scofield
			//$<Reason> Fix a defect.
			li_CurRow = tab_1.tabpage_gp.tab_2.tabpage_browse.dw_browse.getrow()
			if li_CurRow > 0 and li_CurRow <= tab_1.tabpage_gp.tab_2.tabpage_browse.dw_browse.RowCount() then
				tab_1.tabpage_gp.tab_2.tabpage_browse.dw_browse.Trigger Event RowFocusChanged(li_CurRow)
			end if
			//---------------------------- APPEON END ----------------------------
			res = tab_1.tabpage_gp.tab_2.tabpage_browse.dw_browse.update()
		else //maha new 04.21.08
			tab_1.tabpage_gp.tab_2.tabpage_detail.dw_detail.deleterow(1)
			res = tab_1.tabpage_gp.tab_2.tabpage_detail.dw_detail.update()
		end if
		
		if res > 0 then //maha mod 010504
			//--------------------------- APPEON BEGIN ---------------------------
			//$<ID> PT-01
			//$<modify> 06.19.2006 By: LeiWei
			//$<reason> Performance tuning
			//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.
			/*
			Update pd_address set gp_id = null where gp_id = :loc_id;
			delete from gp_insurance where rec_id = :loc_id;
			delete from gp_language where rec_id = :loc_id;
			delete from gp_other_ids where rec_id = :loc_id;
			delete from gp_partner_covering where rec_id = :loc_id;
			delete from gp_questions where rec_id = :loc_id;
			delete from gp_plan where rec_id = :loc_id;
			delete from group_loc_link where loc_id = :loc_id;
			//maha 041306 need some trapping for contracts connected to groups

			commit using sqlca;
			*/

			gnv_appeondb.of_startqueue( )
			//Start code by jervis - 07.12.2010
			Update pd_address set gp_id = null where gp_id = :loc_id;
			delete from gp_insurance where gp_id = :loc_id;
			delete from gp_language where gp_id = :loc_id;
			delete from gp_other_ids where gp_id = :loc_id;
			delete from gp_partner_covering where gp_id = :loc_id;
			delete from gp_questions where gp_id = :loc_id;
			delete from gp_plans where gp_id = :loc_id;
			delete from group_loc_link where group_id = :loc_id;
			DELETE FROM CTX_LOC WHERE loc_id = :loc_id; //Added By Jay Chen 03-27-2014 
			/* delete from gp_insurance where rec_id = :loc_id;
			delete from gp_language where rec_id = :loc_id;
			delete from gp_other_ids where rec_id = :loc_id;
			delete from gp_partner_covering where rec_id = :loc_id;
			delete from gp_questions where rec_id = :loc_id;
			delete from gp_plan where rec_id = :loc_id;
			delete from group_loc_link where loc_id = :loc_id; */
			//-----End Modified ------------------------------------
			//maha 041306 need some trapping for contracts connected to groups

			commit using sqlca;
			
			gnv_appeondb.of_commitqueue( )

			//---------------------------- APPEON END ----------------------------

			//tab_1.tabpage_gp.tab_2.tabpage_browse.dw_browse.deleterow(g)
		end if
		//End Code Change---04.13.2006
	end if
end if

end event

type cb_print from commandbutton within tabpage_gp
boolean visible = false
integer x = 960
integer y = 24
integer width = 347
integer height = 84
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Print"
end type

event clicked;tab_1.tabpage_gp.tab_2.tabpage_survey.uo_survey.tab_review.tabpage_questions.dw_questions.print()
end event

type cb_export from commandbutton within tabpage_gp
integer x = 242
integer y = 24
integer width = 347
integer height = 84
integer taborder = 21
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Export Survey"
end type

event clicked;//function added maha 061004 for intellisite

long ll_pd_rev
long ll_gpid
long ll_export
long ll_review
integer r
integer c
integer res

r = tab_1.tabpage_gp.tab_2.tabpage_survey.uo_survey.tab_review.tabpage_setup.dw_setup.getrow()

if r < 1 then //trap
	messagebox("No Survey","No survey to export.")
	return
end if

ll_gpid = il_group_id
ll_pd_rev = tab_1.tabpage_gp.tab_2.tabpage_survey.uo_survey.tab_review.tabpage_setup.dw_setup.getitemnumber(r,"rec_id")
ll_review = tab_1.tabpage_gp.tab_2.tabpage_survey.uo_survey.tab_review.tabpage_setup.dw_setup.getitemnumber(r,"review_id")

select export_id into :ll_export from pd_review_export where pd_review_id = :ll_pd_rev;

if ll_export > 0 then  //check to see if was exported
	res = messagebox("Survey Found","This survey was previously exported.  Do you want to export again?", question!,yesno!,2)
	if res = 2 then return
else
	select max(export_id) into :ll_export from pd_review_export;
	if isnull(ll_export) then ll_export =  0 
	ll_export++
	
	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> PT-17
	//$<add> 02.09.2006 By: LeiWei
	//$<reason> Performance tuning
	//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

	gnv_appeondb.of_startqueue( )
	//---------------------------- APPEON END ----------------------------

	insert into pd_review_export (export_id,review_id, pd_review_id,gp_id) values (:ll_export, :ll_review, :ll_pd_rev, :ll_gpid);
	commit using sqlca;

	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> PT-18
	//$<add> 02.09.2006 By: LeiWei
	//$<reason> Performance tuning
	//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

	gnv_appeondb.of_commitqueue( )
	//---------------------------- APPEON END ----------------------------
end if


openwithparm(w_survey_export,ll_export)
end event

type cb_import from commandbutton within tabpage_gp
integer x = 599
integer y = 24
integer width = 347
integer height = 84
integer taborder = 21
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Import Survey"
end type

event clicked;string ls_docid
string ls_surv
integer res
long ll_recid
long ll_export
long ll_sid
long ll_pd_rev
long s_cnt
integer cnt
long r
long f
integer i
long li_id

r = tab_1.tabpage_gp.tab_2.tabpage_survey.uo_survey.tab_review.tabpage_setup.dw_setup.getrow()

if r < 1 then //trap
	messagebox("No Survey","No survey to import.")
	return
end if

ll_pd_rev = tab_1.tabpage_gp.tab_2.tabpage_survey.uo_survey.tab_review.tabpage_setup.dw_setup.getitemnumber(1,"rec_id")

select export_id into :ll_export from pd_review_export where pd_review_id = :ll_pd_rev;

if ll_export < 1 or isnull(ll_export) then  //check to see if was exported
	messagebox("Export not Found","This survey was not previously exported.  Unable to import")
	return
else
	select doc_id into :ls_docid from pd_review_export where pd_review_id = :ll_pd_rev;
	if isnull(ls_docid) or ls_docid = "" then
		messagebox("Import Error","Unable to get the document id for this record.  Unable to import.")
		return
	end if
end if

//ls_docid = tab_1.tabpage_gp.tab_2.tabpage_survey.uo_survey.tab_review.tabpage_setup.dw_setup.getitemstring(1,"doc_id")
ls_surv = gs_dir_path + gs_DefDirName + "\intellisite\imports\" + ls_docid + "_surveyback.txt"

//messagebox("ls_surv",ls_surv)

if not fileexists(ls_surv) then 
	messagebox("No Survey File","Cannot find Survey file " + ls_surv)
	return
end if
//
dw_imp_surv.settransobject(sqlca)
dw_imp_surv.reset()

s_cnt = dw_imp_surv.importfile(ls_surv)
if s_cnt < 1 then
	messagebox("Import error","Unable to import survey data")
	return
end if

for i = 1 to s_cnt //set the imported data so that it can be updated
	dw_imp_surv.SetItemStatus ( i, 0, primary!,datamodified! )
	dw_imp_surv.SetItemStatus ( i, "answer_on_off", primary!,datamodified! )
	dw_imp_surv.SetItemStatus ( i, "score", primary!,datamodified! )
	dw_imp_surv.SetItemStatus ( i, "notes", primary!,datamodified! )
	
next

res = dw_imp_surv.update()

//messagebox("",res)

if res < 1 then
	messagebox("Import Error","Unable to update Survey data.")
else
	tab_1.tabpage_gp.tab_2.tabpage_survey.uo_survey.of_retrieve_detail(ll_pd_rev)
	messagebox("Survey Import","Import Complete")
end if



end event

type dw_imp_surv from datawindow within tabpage_gp
boolean visible = false
integer x = 55
integer y = 36
integer width = 165
integer height = 52
integer taborder = 30
boolean bringtotop = true
string dataobject = "d_pd_survey_import"
boolean resizable = true
boolean livescroll = true
end type

type tabpage_group_master from userobject within tab_1
event create ( )
event destroy ( )
event ue_init ( )
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
tab_3 tab_3
dw_mg_detail dw_mg_detail
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
this.tab_3=create tab_3
this.dw_mg_detail=create dw_mg_detail
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
this.tab_3,&
this.dw_mg_detail}
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
destroy(this.tab_3)
destroy(this.dw_mg_detail)
end on

event ue_init();//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-19
//$<add> 02.09.2006 By: LeiWei
//$<reason> Performance tuning
//$<modification> Copy the following script from the Open event of w_group_practice due
//$<modification> to the usage of CreateOnDemand. Refer to PT-02 for more information.
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

integer i
tab_1.tabpage_group_master.dw_mg_browse.settransobject(sqlca)

i = tab_1.tabpage_group_master.dw_mg_browse.retrieve()
IF i > 0 THEN
	ii_mgp_id = tab_1.tabpage_group_master.dw_mg_browse.getitemnumber( 1, "rec_id")
	
	gnv_appeondb.of_startqueue( )
	
	tab_1.tabpage_group_master.dw_mg_detail.retrieve(ii_mgp_id)
	tab_1.tabpage_group_master.dw_loc_links.retrieve(ii_mgp_id)

	gnv_appeondb.of_commitqueue( )

	tab_1.tabpage_group_master.dw_mg_browse.SelectRow( 0, False )
	tab_1.tabpage_group_master.dw_mg_browse.SelectRow( 1, True )
END IF
//---------------------------- APPEON END ----------------------------

end event

event constructor;//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-20
//$<add> 02.09.2006 By: LeiWei
//$<reason> Performance tuning
//$<modification> Call ue_init, since CreateOnDemand is used, some script in Open 
//$<modification> event of w_group_practice is moved to ue_init. Refer to PT-19 for
//$<modification> for more information.

This.Postevent( "ue_init" )
//---------------------------- APPEON END ----------------------------

end event

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

event clicked;cb_LinkSave.TriggerEvent(Clicked!)		//Added by Scofield on 2008-01-04

dw_mg_browse.Visible = False
dw_mg_detail.Visible = True	

tab_3.SelectedTab = 2

tab_1.tabpage_group_master.dw_mg_detail.Reset()
tab_1.tabpage_group_master.dw_mg_detail.insertrow(1)
dw_mg_detail.SetFocus()
dw_mg_detail.SetColumn( "gp_name" )

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 08.04.2006 By: LeiWei
//$<reason> Fix a defect.
tab_1.tabpage_group_master.dw_loc_links.Reset( )
//---------------------------- APPEON END ----------------------------

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

tab_1.tabpage_group_master.dw_mg_detail.AcceptText()
if tab_1.tabpage_group_master.dw_mg_detail.getitemstatus(1,0,primary!) = newmodified! then
	select max(rec_id) into :li_mgroup_id from group_multi_loc;
	if li_mgroup_id < 1 OR IsNull( li_mgroup_id) then li_mgroup_id = 0
	li_mgroup_id++
	ii_mgp_id = li_mgroup_id
	tab_1.tabpage_group_master.dw_mg_detail.setitem(1,"rec_id",li_mgroup_id)
end if

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-21
//$<add> 02.09.2006 By: LeiWei
//$<reason> Performance tuning
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

gnv_appeondb.of_startqueue( )
//---------------------------- APPEON END ----------------------------

tab_1.tabpage_group_master.dw_mg_detail.update()

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 03.29.2006 By: Liang QingShi
//$<reason> Fix a defect.
if ib_delete = True then
	dw_loc_links.update()
	dw_mg_browse.update()
end if
//---------------------------- APPEON END ----------------------------

commit using sqlca;
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-22
//$<add> 02.09.2006 By: LeiWei
//$<reason> Performance tuning
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

gnv_appeondb.of_commitqueue( )
//---------------------------- APPEON END ----------------------------

tab_1.tabpage_group_master.dw_mg_browse.retrieve()

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-23
//$<comment> 04.11.2006 By: Liang QingShi
//$<reason> Performance tuning
//$<modification> Move the following script to PT-19, it is integrated into Appeon
//$<modification> Queue labels with other SQLs to reduce client-server interactions.
/*
tab_1.tabpage_group_master.dw_loc_links.Retrieve(ii_mgp_id )
*/
//---------------------------- APPEON END ----------------------------

i = tab_1.tabpage_group_master.dw_mg_browse.find("rec_id = " + string(ii_mgp_id),1,tab_1.tabpage_group_master.dw_mg_browse.rowcount())

if i > 0 then
	tab_1.tabpage_group_master.dw_mg_browse.setrow(i)
	tab_1.tabpage_group_master.dw_mg_browse.scrolltorow(i)
	tab_1.tabpage_group_master.dw_mg_browse.selectrow(0,false)
	tab_1.tabpage_group_master.dw_mg_browse.selectrow(i,true)
end if


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
long ll_cnt, ll_found //04.22.2008

if tab_1.tabpage_group_master.dw_mg_browse.rowcount() < 1 then return

cb_linksave.triggerevent(clicked!)
open(w_practice_to_addr_find)

li_loc_id = message.doubleparm
if li_loc_id < 1 then return

//----------Begin Added by Alfee on 04.22.2008---------------------
//Check to avoid duplicate records 
ll_cnt = tab_1.tabpage_group_master.dw_loc_links.RowCount()
IF ll_cnt > 0 THEN
	ll_found = tab_1.tabpage_group_master.dw_loc_links.find( "group_loc_link_loc_id = " + String(li_loc_id), 1, ll_cnt)
	IF ll_found > 0  THEN RETURN	
END IF
//----------End Added ---------------------------------------------

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

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-24
//$<add> 02.09.2006 By: LeiWei
//$<reason> Performance tuning
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

gnv_appeondb.of_startqueue( )
//---------------------------- APPEON END ----------------------------

tab_1.tabpage_group_master.dw_loc_links.update()
commit using sqlca;

tab_1.tabpage_group_master.dw_loc_links.retrieve(ii_mgp_id)

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-25
//$<add> 02.09.2006 By: LeiWei
//$<reason> Performance tuning
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

gnv_appeondb.of_commitqueue( )
//---------------------------- APPEON END ----------------------------

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

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-26
//$<add> 02.09.2006 By: LeiWei
//$<reason> Performance tuning
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

gnv_appeondb.of_startqueue( )
//---------------------------- APPEON END ----------------------------

This.GetChild( "state", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("state")
//dwchild.InsertRow( 1 )


This.GetChild( "practice_type", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("practice type")
//dwchild.InsertRow( 1 )

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-27
//$<add> 02.09.2006 By: LeiWei
//$<reason> Performance tuning
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

gnv_appeondb.of_commitqueue( )

This.GetChild( "state", dwchild )
dwchild.InsertRow( 1 )

This.GetChild( "practice_type", dwchild )
dwchild.InsertRow( 1 )
//---------------------------- APPEON END ----------------------------

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 09.13.2006 By: LeiWei
//$<reason> Making the Contract Module a Standalone Product
IF gb_contract_version THEN
	Modify( "group_practice_street_t.text = 'Location Name'" )
END IF
//---------------------------- APPEON END ----------------------------

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

event clicked;integer	li_Rtn
long		ll_Row,ll_CurRow,ll_Cycle,ll_RowCnt,ll_count
Decimal	ldc_RecID,ldc_RecID2

//--------------------------- APPEON BEGIN ---------------------------
//$< Add  > 2008-09-24 By: Scofield
//$<Reason> Delete Unsaved row.

if tab_1.tabpage_group_master.dw_mg_detail.Visible then
	ll_Row = tab_1.tabpage_group_master.dw_mg_detail.GetRow()
	if ll_Row <= 0 or ll_Row > tab_1.tabpage_group_master.dw_mg_detail.RowCount() then return
	
	ldc_RecID = tab_1.tabpage_group_master.dw_mg_detail.GetItemDecimal(ll_Row,"rec_id")
	if IsNull(ldc_RecID) then
		li_Rtn = MessageBox("Confirm Delete","Are you sure you want to delete this row?",question!,yesno!,2)
		if li_Rtn = 1 then
			tab_1.tabpage_group_master.dw_mg_detail.DeleteRow(0)
			tab_1.tabpage_group_master.Tab_3.SelectTab(1)
			
			ll_Row = tab_1.tabpage_group_master.dw_mg_browse.GetRow()
			if ll_Row > 0 or ll_Row <= tab_1.tabpage_group_master.dw_mg_browse.RowCount() then
				tab_1.tabpage_group_master.dw_mg_browse.Trigger Event RowFocusChanged(ll_Row)
			end if
		end if
		
		Return
	end if
end if
//---------------------------- APPEON END ----------------------------

ll_Row = tab_1.tabpage_group_master.dw_mg_browse.GetRow()
if ll_Row <= 0 or ll_Row > tab_1.tabpage_group_master.dw_mg_browse.RowCount() then return
ldc_RecID2 = tab_1.tabpage_group_master.dw_mg_browse.GetItemDecimal(ll_Row,"rec_id")

//li_Rtn = Messagebox("Confirm Delete","Are you sure you want to delete the selected Group and all its links?(will not effect practice locations)",question!,yesno!,2)
SELECT count(loc_id) into :ll_count FROM ctx_loc WHERE parent_comp_id = :ldc_RecID2 AND loc_id <> 0;
if ll_count > 0 then
	li_Rtn = Messagebox("Delete Group","There are " + string(ll_count) + " group record(s) in the contract(s) that are linked to this group. Are you sure you want to delete all these record(s) in the contract(s)?",question!,yesno!,2)	
else
	li_Rtn = Messagebox("Delete Group","Are you sure you want to delete this record?",question!,yesno!,2)
end if
if li_Rtn <> 1 then return 

//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 03.29.2006 By: Liang QingShi
//$<reason> Fix a defect.
/*
for r = 1 to tab_1.tabpage_group_master.dw_loc_links.rowcount()
	tab_1.tabpage_group_master.dw_loc_links.deleterow(r)
next
*/
tab_1.tabpage_group_master.dw_loc_links.SetFocus()
ll_RowCnt = tab_1.tabpage_group_master.dw_loc_links.RowCount()
DELETE FROM CTX_LOC WHERE loc_id IN(SELECT loc_id FROM group_loc_link WHERE group_id = :ldc_RecID2); //Added By Jay Chen 03-27-2014
for ll_Cycle = 1 to ll_RowCnt
	tab_1.tabpage_group_master.dw_loc_links.deleterow(0)	
next
ib_delete = True
//---------------------------- APPEON END ----------------------------

tab_1.tabpage_group_master.dw_loc_links.Update()		//Added by Scofield on 2008-01-03
tab_1.tabpage_group_master.dw_mg_browse.deleterow(0)
tab_1.tabpage_group_master.dw_mg_browse.Update()		//Added by Scofield on 2008-01-03
commit using sqlca;

//--------------------------- APPEON BEGIN ---------------------------
//$<Modify> 2007-08-10 By: Scofield
//$<Reason> Refresh the detail area's data
ll_CurRow = tab_1.tabpage_group_master.dw_mg_browse.GetRow()
if ll_CurRow > 0 and ll_CurRow <= tab_1.tabpage_group_master.dw_mg_browse.RowCount() then
	tab_1.tabpage_group_master.dw_mg_browse.ScrollToRow(ll_CurRow)
	tab_1.tabpage_group_master.dw_mg_browse.SelectRow( 0, False )
	tab_1.tabpage_group_master.dw_mg_browse.SelectRow( ll_CurRow, true )
	ii_mgp_id = tab_1.tabpage_group_master.dw_mg_browse.getitemnumber(ll_CurRow, "rec_id") 
	tab_1.tabpage_group_master.dw_mg_browse.Trigger Event RowFocusChanged(ll_CurRow)
else
	tab_1.tabpage_group_master.dw_mg_detail.Reset()
end if
//---------------------------- APPEON END ----------------------------

/*dw_mg_browse.Visible = True
dw_mg_detail.Visible = False*/

tab_1.tabpage_group_master.Tab_3.SelectTab(1)			//Added by Scofield on 2008-09-24

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

event clicked;long		ll_Row
integer 	li_Rtn

ll_Row = tab_1.tabpage_group_master.dw_loc_links.GetRow()
if ll_Row <= 0 or ll_Row > tab_1.tabpage_group_master.dw_loc_links.RowCount() then return

li_Rtn = MessageBox("Confirm Delete","Are you sure you want to delete the selected link?",question!,yesno!,2)

if li_Rtn = 1 then
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

if li_Row = il_CurGroup then This.Trigger Event RowFocusChanged(li_Row)	//Added by Scofield on 2008-01-04

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

event rowfocuschanged;
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-28
//$<modify> 03.29.2006 By: Liang QingShi
//$<reason> Performance tuning
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.
/*
tab_1.tabpage_group_master.dw_mg_detail.retrieve(ii_mgp_id)
tab_1.tabpage_group_master.dw_loc_links.retrieve(ii_mgp_id)
*/

IF not this.rowcount() > 0 then return
gnv_appeondb.of_startqueue( )
tab_1.tabpage_group_master.dw_mg_detail.retrieve(ii_mgp_id)
tab_1.tabpage_group_master.dw_loc_links.retrieve(ii_mgp_id)
gnv_appeondb.of_commitqueue( )

//---------------------------- APPEON END ----------------------------

il_CurGroup = CurrentRow		//Added by Scofield on 2008-01-04

end event

event doubleclicked;
IF row > 0 THEN
	dw_mg_browse.Visible = False
	dw_mg_detail.Visible = True	
	tab_3.SelectedTab = 2
END IF

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

event updateend;//--------------------------- APPEON BEGIN ---------------------------
//$<add> 03.24.2006 By: LeiWei
//$<reason> Fix a defect.

gnv_app.inv_dwcache.of_unRegister('dddw_contracted_entity')
gnv_app.inv_dwcache.of_Register('dddw_contracted_entity', 'dddw_contracted_entity', SQLCA, true)

//---------------------------- APPEON END ----------------------------

end event

event doubleclicked;//--------------------------- APPEON BEGIN ---------------------------
//$<  Add > 2007-10-29 By: Scofield
//$<Reason> Popup a dialog to input the phone
String	ls_Phone,ls_RetParm

This.AcceptText()
if row > 0 and row <= This.RowCount() then
	if dwo.name = 'phone' then
		ls_Phone = This.GetItemString(row,'phone')
		OpenWithParm(w_phonedetail,ls_Phone)
		
		ls_RetParm = Message.StringParm
		
		if ls_RetParm <> 'Cancel' then
			This.SetItem(row,'phone',ls_RetParm)
		end if
	end if
end if
//---------------------------- APPEON END ----------------------------

end event

event buttonclicked;//--------------------------- APPEON BEGIN ---------------------------
//$<  Add > 2007-12-06 By: Scofield
//$<Reason> Popup a dialog to input the phone
String	ls_Phone,ls_RetParm

This.AcceptText()
if row > 0 and row <= This.RowCount() then
	if dwo.name = 'b_phone' then
		ls_Phone = This.GetItemString(row,'phone')
		OpenWithParm(w_phonedetail,ls_Phone)
		
		ls_RetParm = Message.StringParm
		
		if ls_RetParm <> 'Cancel' then
			This.SetItem(row,'phone',ls_RetParm)
		end if
		This.SetColumn('phone')
	end if
end if
//---------------------------- APPEON END ----------------------------

end event

type cb_about from commandbutton within w_group_practice
boolean visible = false
integer x = 1207
integer y = 8
integer width = 347
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

type cb_close from commandbutton within w_group_practice
integer x = 3159
integer y = 8
integer width = 347
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
end type

event clicked;close(parent)
end event

