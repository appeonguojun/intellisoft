$PBExportHeader$w_facility_setup.srw
forward
global type w_facility_setup from w_response
end type
type uo_facility from pfc_cst_u_facility_setup within w_facility_setup
end type
end forward

global type w_facility_setup from w_response
integer x = 14
integer y = 144
integer width = 4059
integer height = 2024
string title = "Facility Setup"
long backcolor = 80269524
uo_facility uo_facility
end type
global w_facility_setup w_facility_setup

on w_facility_setup.create
int iCurrent
call super::create
this.uo_facility=create uo_facility
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_facility
end on

on w_facility_setup.destroy
call super::destroy
destroy(this.uo_facility)
end on

event open;call super::open;uo_facility.of_set_parent_window( This )
//$<add> 07.07.2008 by Andy
uo_facility.of_setlabel( )
//end add 07.07.2008
uo_facility.of_retrieve_detail()


end event

event pfc_postupdate;call super::pfc_postupdate;//integer facid
//
//facid = uo_facility.dw_detail.getitemnumber(1,"facility_id")
////set verif rules for duplicate letters maha 041801
//if uo_facility.dw_detail.getitemnumber(1,"dupeset") = 1 then
//	Update facility_ver_rules
//	set ver_ltr_doc = 1
//	where facility_id = :facid and screen_id in (7,10);
//else 
//	Update facility_ver_rules
//	set ver_ltr_doc = 0
//	where facility_id = :facid and screen_id in (7,10);
//end if
// 
// 
// 
// 
// 
 return 1
end event

type uo_facility from pfc_cst_u_facility_setup within w_facility_setup
integer width = 4032
integer height = 1920
integer taborder = 10
boolean bringtotop = true
boolean border = false
long backcolor = 79741120
end type

on uo_facility.destroy
call pfc_cst_u_facility_setup::destroy
end on

