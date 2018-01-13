$PBExportHeader$pfc_ia_cst_nv_net_dev_new_action_items.sru
forward
global type pfc_ia_cst_nv_net_dev_new_action_items from pfc_ia_cst_nv_net_dev_new
end type
end forward

global type pfc_ia_cst_nv_net_dev_new_action_items from pfc_ia_cst_nv_net_dev_new
integer width = 3561
integer height = 1784
end type
global pfc_ia_cst_nv_net_dev_new_action_items pfc_ia_cst_nv_net_dev_new_action_items

type variables
Integer li_cnt
Boolean ib_done_once = False

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-01
//$<add> 04.13.2006 By: LeiWei
//$<reason> Performance tuning
//$<reason> Define a variable to be used in subsequent script.
boolean ib_retr_for_aciton_item
//---------------------------- APPEON END ----------------------------

end variables

on pfc_ia_cst_nv_net_dev_new_action_items.create
call super::create
end on

on pfc_ia_cst_nv_net_dev_new_action_items.destroy
call super::destroy
end on

event constructor;call super::constructor;lb_from_prac_folder = False
tab_1.tabpage_ai.dw_net_dev.Modify( "facility_name.height = '56'" )
tab_1.tabpage_ai.dw_net_dev.Modify( "facility_name.width = '2583'" )

of_set_facility_id( -99 )

CHOOSE CASE gi_intelliapp_type
		//SINGLE GROUP
	CASE 0
		dw_orgs_facilities.Height = 1672
		//MULTI SITE GROUP
	CASE 1
//		ddlb_group_by.DeleteItem( 2 )
//		ddlb_group_by.AddItem( "Group" )
//		ddlb_group_by.AddItem( "Group/Application" )						
		dw_orgs_facilities.Height = 820
		dw_payors.Height = 832
		//BILLING COMPANY
	CASE 2
	//	ddlb_group_by.DeleteItem( 2 )		
	//	ddlb_group_by.AddItem( "Client" )		
	//	ddlb_group_by.AddItem( "Client/Application" )				
		dw_orgs_facilities.Height = 820
		dw_payors.Height = 832		
END CHOOSE






end event

event pfc_cst_net_dev_filter;
Open( w_net_dev_filter)

IF gs_cust_type = "I" THEN
	w_net_dev_filter.is_open_from1 = "PFIA"
ELSE
	w_net_dev_filter.is_open_from1 = "PFCA"	
END IF
w_net_dev_filter.y = w_net_dev_filter.y + 200

//st_as_msg.Visible = False


end event

type tab_1 from pfc_ia_cst_nv_net_dev_new`tab_1 within pfc_ia_cst_nv_net_dev_new_action_items
integer x = 763
integer y = 20
integer height = 1660
end type

event tab_1::selectionchanged;call super::selectionchanged;IF Not ib_done_once THEN
	ib_done_once = True
	
	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> PT-02
	//$<modfiy> 04.13.2006 By: LeiWei
	//$<reason> Performance tuning
	//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

	/*
	tab_1.tabpage_ai.dw_net_dev.DataObject = "d_net_dev_action_items"
	tab_1.tabpage_ai.dw_net_dev.Of_SetTransObject( sqlca )
	
	DataWindowChild dwchild

	tab_1.tabpage_ai.dw_net_dev.GetChild( "action_dept", dwchild )
	dwchild.SetTransObject( SQLCA )
	dwchild.Retrieve("Action Department")

	tab_1.tabpage_ai.dw_net_dev.GetChild( "action_status", dwchild )
	dwchild.SetTransObject( SQLCA )
	dwchild.Retrieve("Action Status")
	*/

	tab_1.tabpage_ai.dw_net_dev.DataObject = "d_net_dev_action_items"
	tab_1.tabpage_ai.dw_net_dev.Of_SetTransObject( sqlca )
	
	DataWindowChild dwchild

	gnv_appeondb.of_startqueue( )

	tab_1.tabpage_ai.dw_net_dev.GetChild( "action_dept", dwchild )
	dwchild.SetTransObject( SQLCA )
	dwchild.Retrieve("Action Department")

	tab_1.tabpage_ai.dw_net_dev.GetChild( "action_status", dwchild )
	dwchild.SetTransObject( SQLCA )
	dwchild.Retrieve("Action Status")

	gnv_appeondb.of_commitqueue( )

	//---------------------------- APPEON END ----------------------------

	tab_1.tabpage_ai.dw_net_dev.of_SetDropDownCalendar( TRUE )
	tab_1.tabpage_ai.dw_net_dev.iuo_calendar.of_Register(tab_1.tabpage_ai.dw_net_dev.iuo_calendar.DDLB)

END IF

//IF newindex = 1 THEN
//	dw_report.Visible = False
//ELSE
//	dw_report.Visible = True
//END IF

//messagebox("","select tab")
end event

type tabpage_ai from pfc_ia_cst_nv_net_dev_new`tabpage_ai within tab_1
integer height = 1532
end type

type dw_net_dev from pfc_ia_cst_nv_net_dev_new`dw_net_dev within tabpage_ai
integer x = 9
integer y = 8
integer width = 2674
integer height = 1244
string dataobject = "d_net_dev_action_items"
end type

event dw_net_dev::constructor;call super::constructor;//This.of_SetUpdateable( True )
end event

type dw_appoint_stat from pfc_ia_cst_nv_net_dev_new`dw_appoint_stat within tabpage_ai
boolean visible = false
end type

type gb_filter_1 from pfc_ia_cst_nv_net_dev_new`gb_filter_1 within tabpage_ai
integer x = 9
integer y = 1296
integer width = 2674
end type

type tabpage_ids from pfc_ia_cst_nv_net_dev_new`tabpage_ids within tab_1
boolean visible = false
integer height = 1532
end type

type dw_ids from pfc_ia_cst_nv_net_dev_new`dw_ids within tabpage_ids
end type

type tabpage_notes from pfc_ia_cst_nv_net_dev_new`tabpage_notes within tab_1
boolean visible = false
integer height = 1532
long backcolor = 80269524
long tabbackcolor = 80269524
end type

type dw_notes from pfc_ia_cst_nv_net_dev_new`dw_notes within tabpage_notes
end type

type tabpage_report from pfc_ia_cst_nv_net_dev_new`tabpage_report within tab_1
integer height = 1532
end type

type cb_export from pfc_ia_cst_nv_net_dev_new`cb_export within tabpage_report
end type

type rb_par_sum from pfc_ia_cst_nv_net_dev_new`rb_par_sum within tabpage_report
end type

type rb_ai_wn from pfc_ia_cst_nv_net_dev_new`rb_ai_wn within tabpage_report
end type

type rb_par from pfc_ia_cst_nv_net_dev_new`rb_par within tabpage_report
end type

type rb_ai from pfc_ia_cst_nv_net_dev_new`rb_ai within tabpage_report
end type

type dw_report_data from pfc_ia_cst_nv_net_dev_new`dw_report_data within tabpage_report
string dataobject = "d_net_dev_action_items_report_by_prac_ai"
end type

type gb_filter_2 from pfc_ia_cst_nv_net_dev_new`gb_filter_2 within tabpage_report
end type

type dw_orgs_facilities from pfc_ia_cst_nv_net_dev_new`dw_orgs_facilities within pfc_ia_cst_nv_net_dev_new_action_items
integer y = 20
integer height = 812
string dataobject = "d_pd_affil_status_orgs_ia_action_items"
end type

event dw_orgs_facilities::constructor;call super::constructor;//This.Retrieve( gs_user_id ) removed maha 031506
end event

event dw_orgs_facilities::rowfocuschanged;//dw_qf.SetItem( 1, "quick_filter", "No Filter Selected" )

//st_as_msg.Visible = False
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-03
//$<add> 04.13.2006 By: LeiWei
//$<reason> Performance tuning
//$<modification> Write a condition that when ib_retr_for_action_item is TRUE, 
//$<modification> the RowFocusChanged event will not be executed.
If ib_retr_for_aciton_item Then Return
//---------------------------- APPEON END ----------------------------

IF This.GetItemNumber( 1, "parent_facility_id" ) <> 0 THEN
	Return
END IF

IF currentrow > 0 THEN
	ii_facility_id = This.GetItemNumber( currentrow, "parent_facility_id")
	of_retrieve_detail( ii_facility_id )
	This.SelectRow( 0, False )
	This.SelectRow( currentrow, True )
END IF


IF gi_intelliapp_type > 0 THEN
	IF ii_facility_id = 0 THEN
		dw_payors.DataObject = "d_net_dev_payors_hospitals_ai_all" //maha chamged 063005
		dw_payors.SetTRansObject( SQLCA )
		dw_payors.Retrieve( il_prac_id )
	ELSE	
		dw_payors.DataObject = "d_net_dev_payors_hospitals_ai"
		dw_payors.SetTRansObject( SQLCA )	
		dw_payors.Retrieve( ii_facility_id )
		//messagebox( string( il_prac_id), string( ii_facility_id ))
	END IF
END IF

st_as_msg.visible = false //maha 063005
//IF NOT ib_filter_set THEN //maha 063005 removed filter added to dw query
//	tab_1.tabpage_ai.dw_net_dev.SetFilter( "active_status = 1" )
//	tab_1.tabpage_ai.dw_net_dev.Filter( )
//END IF
end event

event dw_orgs_facilities::clicked;
IF This.GetClickedRow() > 0 THEN

//	IF This.RowCount() > 0  THEN
//		li_cnt++
//		IF li_cnt = 1 THEN
//			of_set_facility_id( -99 )		
//		END IF		
//   	ii_facility_id = This.GetItemNumber( row, "parent_facility_id")
//		of_retrieve_detail( ii_facility_id )
//
//	END IF
//
//	IF NOT ib_filter_set THEN
//		tab_1.tabpage_ai.dw_net_dev.SetFilter( "active_status = 1" )
//		tab_1.tabpage_ai.dw_net_dev.Filter( )
//	END IF
END IF
end event

event dw_orgs_facilities::u_after_retrieve;call super::u_after_retrieve;//This.SelectRow( 0, False )	



end event

type cb_1 from pfc_ia_cst_nv_net_dev_new`cb_1 within pfc_ia_cst_nv_net_dev_new_action_items
boolean visible = false
end type

type p_1 from pfc_ia_cst_nv_net_dev_new`p_1 within pfc_ia_cst_nv_net_dev_new_action_items
boolean visible = false
end type

type dw_payors from pfc_ia_cst_nv_net_dev_new`dw_payors within pfc_ia_cst_nv_net_dev_new_action_items
integer y = 840
integer height = 832
end type

event dw_payors::rowfocuschanged;call super::rowfocuschanged;//st_as_msg.Visible = False

//dw_qf.SetItem( 1, "quick_filter", "No Filter Selected" )
end event

type st_filter from pfc_ia_cst_nv_net_dev_new`st_filter within pfc_ia_cst_nv_net_dev_new_action_items
end type

type dw_qf from pfc_ia_cst_nv_net_dev_new`dw_qf within pfc_ia_cst_nv_net_dev_new_action_items
end type

type st_group_by from pfc_ia_cst_nv_net_dev_new`st_group_by within pfc_ia_cst_nv_net_dev_new_action_items
end type

type ddlb_group_by from pfc_ia_cst_nv_net_dev_new`ddlb_group_by within pfc_ia_cst_nv_net_dev_new_action_items
end type

type st_zoom from pfc_ia_cst_nv_net_dev_new`st_zoom within pfc_ia_cst_nv_net_dev_new_action_items
end type

type ddlb_zoom from pfc_ia_cst_nv_net_dev_new`ddlb_zoom within pfc_ia_cst_nv_net_dev_new_action_items
end type

type st_as_msg from pfc_ia_cst_nv_net_dev_new`st_as_msg within pfc_ia_cst_nv_net_dev_new_action_items
integer y = 1688
end type

type dw_facility_add from pfc_ia_cst_nv_net_dev_new`dw_facility_add within pfc_ia_cst_nv_net_dev_new_action_items
end type

type cb_batch from pfc_ia_cst_nv_net_dev_new`cb_batch within pfc_ia_cst_nv_net_dev_new_action_items
boolean visible = false
end type

type p_2 from pfc_ia_cst_nv_net_dev_new`p_2 within pfc_ia_cst_nv_net_dev_new_action_items
boolean visible = false
end type

