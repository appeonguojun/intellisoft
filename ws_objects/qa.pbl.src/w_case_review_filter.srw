$PBExportHeader$w_case_review_filter.srw
forward
global type w_case_review_filter from window
end type
type dw_filter from u_dw within w_case_review_filter
end type
type cb_2 from commandbutton within w_case_review_filter
end type
type cb_1 from commandbutton within w_case_review_filter
end type
type cb_filter from commandbutton within w_case_review_filter
end type
end forward

global type w_case_review_filter from window
integer x = 27
integer y = 2088
integer width = 3250
integer height = 356
boolean titlebar = true
string title = "Filter"
windowtype windowtype = popup!
long backcolor = 80269524
event ue_post_open ( )
dw_filter dw_filter
cb_2 cb_2
cb_1 cb_1
cb_filter cb_filter
end type
global w_case_review_filter w_case_review_filter

type variables
String is_open_from1



end variables

on w_case_review_filter.create
this.dw_filter=create dw_filter
this.cb_2=create cb_2
this.cb_1=create cb_1
this.cb_filter=create cb_filter
this.Control[]={this.dw_filter,&
this.cb_2,&
this.cb_1,&
this.cb_filter}
end on

on w_case_review_filter.destroy
destroy(this.dw_filter)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.cb_filter)
end on

event close;IF is_open_from1 = 'PFI' THEN
	//w_prac_data_intelliapp.tab_1.tabpage_net.uo_net.of_clear_filter( )
ELSEIF is_open_from1 = 'PFC' THEN
	//w_prac_data_1.tab_1.tabpage_net.uo_net.of_clear_filter( )
ELSEIF is_open_from1 = 'PFIA' THEN
	//w_action_items_ia.tab_1.tabpage_net_dev.uo_net_dev.of_filter( "dd", dw_filter )	
ELSEIF is_open_from1 = 'PFCA' THEN
	//	w_action_items.tab_1.tabpage_net_dev.uo_net_dev.of_filter( "dd", dw_filter )	
END IF
end event

event open;is_open_from1 = Message.StringParm

gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17

end event

type dw_filter from u_dw within w_case_review_filter
integer width = 2834
integer height = 576
integer taborder = 10
string dataobject = "d_case_action_items_filter"
boolean vscrollbar = false
boolean border = false
borderstyle borderstyle = stylebox!
end type

event constructor;call super::constructor;DataWindowChild dwchild

This.SetTransObject( sqlca )

This.GetChild( "action_type", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("Case/Peer Review Action Item Type")
dwchild.InsertRow( 1 )

This.GetChild( "action_status", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("Case/Peer Review Action Item Status")
dwchild.InsertRow( 1 )

This.GetChild( "action_to", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("Case/Peer Review Action Item To")
dwchild.InsertRow( 1 )

//This.of_SetRowManager( TRUE )
//This.of_SetReqColumn(True)
//This.of_SetDropDownCalendar( TRUE )
//This.iuo_calendar.of_Register( This.iuo_calendar.DDLB )
//
This.InsertRow( 0 )
end event

type cb_2 from commandbutton within w_case_review_filter
integer x = 2880
integer y = 172
integer width = 320
integer height = 72
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Close"
boolean cancel = true
end type

event clicked;

Close( Parent )
end event

type cb_1 from commandbutton within w_case_review_filter
integer x = 2880
integer y = 16
integer width = 320
integer height = 72
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Clear Filter"
end type

event clicked;dw_filter.Reset()
dw_filter.InsertRow( 0 )

IF is_open_from1 = 'PFI' THEN
	w_prac_data_intelliapp.tab_1.tabpage_net.uo_net.of_clear_filter( )
ELSEIF is_open_from1 = 'PFC' THEN
	w_prac_data_1.tab_1.tabpage_net.uo_net.of_clear_filter( )
ELSEIF is_open_from1 = 'PFIA' THEN
	//w_action_items_ia.tab_1.tabpage_net_dev.uo_net_dev.of_filter( "dd", dw_filter )	
ELSEIF is_open_from1 = 'PFCA' THEN
	//	w_action_items.tab_1.tabpage_net_dev.uo_net_dev.of_filter( "dd", dw_filter )	
END IF


end event

type cb_filter from commandbutton within w_case_review_filter
integer x = 2880
integer y = 92
integer width = 320
integer height = 72
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Apply Filter"
boolean default = true
end type

event clicked;Long ll_ai_type
Long ll_ai_to
Long ll_ai_status
String ls_user
String ls_ai_to_name
String ls_filter
Date ld_ai_date_from
Date ld_ai_date_to
Date ld_ai_date_completed

dw_filter.AcceptText( )

IF is_open_from1 = 'CRW' THEN
	
	IF Not IsNull( dw_filter.GetItemNumber( 1, "action_type" ) ) THEN
		ll_ai_type = dw_filter.GetItemNumber( 1, "action_type" ) 
		ls_filter = ls_filter + " action_type = " + String( ll_ai_type ) + " AND "
	END IF
	
	IF Not IsNull( dw_filter.GetItemString( 1, "action_user" ) ) THEN
		ls_user = dw_filter.GetItemString( 1, "action_user" ) 
		ls_filter = ls_filter + " action_user = '" + String( ls_user ) + "' AND "
	END IF
	
	IF Not IsNull( dw_filter.GetItemString( 1, "action_to_name" ) ) THEN
		ls_ai_to_name = dw_filter.GetItemString( 1, "action_to_name" ) 
		ls_filter = ls_filter + " action_to_name = '" + String( ls_ai_to_name ) + "' AND "
	END IF
	
	IF Not IsNull( dw_filter.GetItemNumber( 1, "action_status" ) ) THEN
		ll_ai_status = dw_filter.GetItemNumber( 1, "action_status" ) 
		ls_filter = ls_filter + " action_status = " + String( ll_ai_status ) + " AND "
	END IF	
	
	IF Not IsNull( dw_filter.GetItemNumber( 1, "action_to" ) ) THEN
		ll_ai_to = dw_filter.GetItemNumber( 1, "action_to" ) 
		ls_filter = ls_filter + " action_to = " + String( ll_ai_to ) + " AND "
	END IF	
	
	IF Not IsNull( dw_filter.GetItemDate( 1, "date_completed" ) ) THEN
		ld_ai_date_completed = dw_filter.GetItemDate( 1, "date_completed" ) 
		ls_filter = ls_filter + " date_completed = Date('" + String( ld_ai_date_completed ) + "') AND "
	END IF	
	
	IF Not IsNull( dw_filter.GetItemDate( 1, "action_date_from" ) ) AND IsNull( dw_filter.GetItemDate( 1, "action_date_from" ) ) THEN
		MessageBox("Action Date", "Both the Action Date From and Action Date To must have a date to filter." )
		dw_filter.SetColumn( "action_date_from" )
		dw_filter.SetFocus( )
	END IF

	IF IsNull( dw_filter.GetItemDate( 1, "action_date_from" ) ) AND NOT IsNull( dw_filter.GetItemDate( 1, "action_date_from" ) ) THEN
		MessageBox("Action Date", "Both the Action Date From and Action Date To must have a date to filter." )
		dw_filter.SetColumn( "action_date_from" )
		dw_filter.SetFocus( )
	END IF

	
	IF Not IsNull( dw_filter.GetItemDate( 1, "action_date_from" ) ) THEN
		ld_ai_date_from = dw_filter.GetItemDate( 1, "action_date_from" ) 
		ld_ai_date_to = dw_filter.GetItemDate( 1, "action_date_to" ) 		
		//--------------------------- APPEON BEGIN ---------------------------
		//$<add> 01.16.2006 By: LeiWei
		//$<reason> Fix a defect.
		If Isnull(ld_ai_date_to) Then
			ld_ai_date_to = ld_ai_date_from
		End If
		//---------------------------- APPEON END ----------------------------
		ls_filter = ls_filter + " (action_date >= Date('" + String( ld_ai_date_from ) + "') AND action_date <= Date('" + String( ld_ai_date_to ) + "')) AND "
	END IF	

	
	
	ls_filter = Mid( ls_filter, 1, Len( ls_filter ) - 5	)
	
//	messagebox("", ls_filter )

	w_case_review.uo_case_review.tab_1.tabpage_detail.tab_2.tabpage_ai.dw_action_item.SetFilter( ls_filter )
	w_case_review.uo_case_review.tab_1.tabpage_detail.tab_2.tabpage_ai.dw_action_item.Filter(  )
END IF



//CloseWithReturn( Parent, dw_filter )
end event

