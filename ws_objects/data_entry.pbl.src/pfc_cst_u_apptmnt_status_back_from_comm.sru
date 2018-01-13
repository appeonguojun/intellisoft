$PBExportHeader$pfc_cst_u_apptmnt_status_back_from_comm.sru
forward
global type pfc_cst_u_apptmnt_status_back_from_comm from pfc_cst_u_apptmnt_status
end type
end forward

global type pfc_cst_u_apptmnt_status_back_from_comm from pfc_cst_u_apptmnt_status
integer width = 2747
integer height = 1796
end type
global pfc_cst_u_apptmnt_status_back_from_comm pfc_cst_u_apptmnt_status_back_from_comm

on pfc_cst_u_apptmnt_status_back_from_comm.create
call super::create
end on

on pfc_cst_u_apptmnt_status_back_from_comm.destroy
call super::destroy
end on

event constructor;call super::constructor;If Upper(appeongetclienttype()) = "WEB" Then
	if tab_view.tabpage_browse.visible = false then
		if tab_view.selectedtab = 1 then
			tab_view.selectedtab = 2
		end if
	end if		
End If
end event

type st_recs from pfc_cst_u_apptmnt_status`st_recs within pfc_cst_u_apptmnt_status_back_from_comm
integer x = 2272
integer y = 1688
end type

type dw_orgs_facilities from pfc_cst_u_apptmnt_status`dw_orgs_facilities within pfc_cst_u_apptmnt_status_back_from_comm
boolean visible = false
end type

type tab_view from pfc_cst_u_apptmnt_status`tab_view within pfc_cst_u_apptmnt_status_back_from_comm
integer x = 9
integer height = 1760
end type

type tabpage_browse from pfc_cst_u_apptmnt_status`tabpage_browse within tab_view
boolean visible = false
integer height = 1632
end type

type dw_browse from pfc_cst_u_apptmnt_status`dw_browse within tabpage_browse
end type

type tabpage_detail_1 from pfc_cst_u_apptmnt_status`tabpage_detail_1 within tab_view
integer height = 1632
end type

type dw_apptmnt_status from pfc_cst_u_apptmnt_status`dw_apptmnt_status within tabpage_detail_1
integer height = 1156
boolean bringtotop = true
end type

type gb_6 from pfc_cst_u_apptmnt_status`gb_6 within tabpage_detail_1
integer height = 440
end type

type gb_1 from pfc_cst_u_apptmnt_status`gb_1 within tabpage_detail_1
integer y = 1072
integer height = 516
end type

type dw_comm_review from pfc_cst_u_apptmnt_status`dw_comm_review within tabpage_detail_1
integer y = 1236
integer height = 368
end type

type tabpage_detail_2 from pfc_cst_u_apptmnt_status`tabpage_detail_2 within tab_view
integer height = 1632
end type

type dw_leave from pfc_cst_u_apptmnt_status`dw_leave within tabpage_detail_2
end type

type dw_cvo from pfc_cst_u_apptmnt_status`dw_cvo within tabpage_detail_2
end type

type gb_5 from pfc_cst_u_apptmnt_status`gb_5 within tabpage_detail_2
end type

type gb_2 from pfc_cst_u_apptmnt_status`gb_2 within tabpage_detail_2
end type

type gb_3 from pfc_cst_u_apptmnt_status`gb_3 within tabpage_detail_2
end type

type dw_staff_cat from pfc_cst_u_apptmnt_status`dw_staff_cat within tabpage_detail_2
end type

type gb_4 from pfc_cst_u_apptmnt_status`gb_4 within tabpage_detail_2
end type

type dw_departments from pfc_cst_u_apptmnt_status`dw_departments within tabpage_detail_2
end type

type tabpage_quest from pfc_cst_u_apptmnt_status`tabpage_quest within tab_view
integer height = 1632
end type

type dw_quest from pfc_cst_u_apptmnt_status`dw_quest within tabpage_quest
end type

