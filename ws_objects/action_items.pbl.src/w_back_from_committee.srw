﻿$PBExportHeader$w_back_from_committee.srw
forward
global type w_back_from_committee from w_response
end type
type tab_bfc from tab within w_back_from_committee
end type
type tabpage_status from userobject within tab_bfc
end type
type uo_status from pfc_cst_u_apptmnt_status_back_from_comm within tabpage_status
end type
type tabpage_status from userobject within tab_bfc
uo_status uo_status
end type
type tab_bfc from tab within w_back_from_committee
tabpage_status tabpage_status
end type
type cb_1 from u_cb within w_back_from_committee
end type
type cb_2 from u_cb within w_back_from_committee
end type
end forward

global type w_back_from_committee from w_response
integer x = 347
integer y = 32
integer width = 2953
integer height = 2244
string title = "Appointment Status"
long backcolor = 79680469
tab_bfc tab_bfc
cb_1 cb_1
cb_2 cb_2
end type
global w_back_from_committee w_back_from_committee

type variables
String is_opened_for
end variables

on w_back_from_committee.create
int iCurrent
call super::create
this.tab_bfc=create tab_bfc
this.cb_1=create cb_1
this.cb_2=create cb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.tab_bfc
this.Control[iCurrent+2]=this.cb_1
this.Control[iCurrent+3]=this.cb_2
end on

on w_back_from_committee.destroy
call super::destroy
destroy(this.tab_bfc)
destroy(this.cb_1)
destroy(this.cb_2)
end on

event open;call super::open;String ls_name

tab_bfc.tabpage_status.uo_status.of_setup_dw() //maha 082201
tab_bfc.tabpage_status.uo_status.of_set_select_facility_invisible( False )
tab_bfc.tabpage_status.uo_status.of_set_prac_id( gl_prac_id )
tab_bfc.tabpage_status.uo_status.of_set_parent_facility_id( gl_facility_id )

tab_bfc.tabpage_status.uo_status.of_retrieve_detail( )
tab_bfc.tabpage_status.uo_status.of_filter_just_active( True )									
is_opened_for = gs_param

IF is_opened_for <> "REAPP" THEN
	tab_bfc.tabpage_status.uo_status.of_set_comm_protected( )
else // reappointment process  //maha 123002 to allow data to save without any changes being made.
	tab_bfc.tabpage_status.uo_status.tab_view.tabpage_detail_1.dw_apptmnt_status.SetItemStatus (1, 0,primary!, datamodified! ) 
END IF

nv_prac_info lnv_full_name
lnv_full_name = CREATE nv_prac_info
ls_name = lnv_full_name.of_get_name( gl_prac_id )
DESTROY lnv_full_name	

This.Title = This.Title + "  (" + ls_name + ")"

end event

event pfc_preupdate;call super::pfc_preupdate;IF is_opened_for <> "REAPP" THEN
	IF tab_bfc.tabpage_status.uo_status.of_back_from_commit_rqrd_flds() = -1  THEN
		Return -1
	END IF
END IF

Return 1
end event

event closequery;//overwriting pfc code to prevent asking Do you want to save changes during recred process //maha 011403
end event

type tab_bfc from tab within w_back_from_committee
integer x = 41
integer y = 36
integer width = 2848
integer height = 1936
integer taborder = 10
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 79741120
boolean fixedwidth = true
boolean raggedright = true
alignment alignment = center!
integer selectedtab = 1
tabpage_status tabpage_status
end type

on tab_bfc.create
this.tabpage_status=create tabpage_status
this.Control[]={this.tabpage_status}
end on

on tab_bfc.destroy
destroy(this.tabpage_status)
end on

type tabpage_status from userobject within tab_bfc
integer x = 18
integer y = 100
integer width = 2811
integer height = 1820
long backcolor = 79741120
string text = "Affiliation Status"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
uo_status uo_status
end type

on tabpage_status.create
this.uo_status=create uo_status
this.Control[]={this.uo_status}
end on

on tabpage_status.destroy
destroy(this.uo_status)
end on

type uo_status from pfc_cst_u_apptmnt_status_back_from_comm within tabpage_status
event destroy ( )
integer x = 46
integer y = 48
integer taborder = 20
boolean bringtotop = true
boolean border = false
end type

on uo_status.destroy
call pfc_cst_u_apptmnt_status_back_from_comm::destroy
end on

type cb_1 from u_cb within w_back_from_committee
integer x = 2144
integer y = 1992
integer height = 84
integer taborder = 30
boolean bringtotop = true
string text = "Ok"
boolean default = true
end type

event clicked;Integer li_retval

li_retval = Parent.Event pfc_save()

IF li_retval = 0 THEN
	MessageBox("No Changes Made", "No changes made to the record.  A change must be made to this record for it to save.~rUse the cancel button to close window.")
	Return 1
ELSEIF  li_retval < 0 THEN
	Return 1
END IF
CloseWithReturn( Parent, "Ok" )
end event

type cb_2 from u_cb within w_back_from_committee
integer x = 2537
integer y = 1992
integer height = 84
integer taborder = 20
boolean bringtotop = true
string text = "Cancel"
boolean cancel = true
end type

event clicked;CloseWithReturn( Parent, "Cancel" )
end event

