﻿$PBExportHeader$uo_peer_review_alternate.sru
forward
global type uo_peer_review_alternate from userobject
end type
type dw_report from datawindow within uo_peer_review_alternate
end type
type tab_1 from tab within uo_peer_review_alternate
end type
type tabpage_browse from userobject within tab_1
end type
type dw_browse from u_dw within tabpage_browse
end type
type tabpage_browse from userobject within tab_1
dw_browse dw_browse
end type
type tabpage_detail from userobject within tab_1
end type
type tab_2 from tab within tabpage_detail
end type
type tabpage_case_detail from userobject within tab_2
end type
type dw_physicians from u_dw within tabpage_case_detail
end type
type dw_detail from u_dw within tabpage_case_detail
end type
type tabpage_case_detail from userobject within tab_2
dw_physicians dw_physicians
dw_detail dw_detail
end type
type tabpage_ai from userobject within tab_2
end type
type dw_ai_report from u_dw within tabpage_ai
end type
type dw_action_item from u_dw within tabpage_ai
end type
type tabpage_ai from userobject within tab_2
dw_ai_report dw_ai_report
dw_action_item dw_action_item
end type
type tab_2 from tab within tabpage_detail
tabpage_case_detail tabpage_case_detail
tabpage_ai tabpage_ai
end type
type tabpage_detail from userobject within tab_1
tab_2 tab_2
end type
type tab_1 from tab within uo_peer_review_alternate
tabpage_browse tabpage_browse
tabpage_detail tabpage_detail
end type
end forward

global type uo_peer_review_alternate from userobject
integer width = 3287
integer height = 1856
boolean border = true
long backcolor = 67108864
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event pfc_cst_letter ( )
event pfc_cst_print_report ( )
event pfc_cst_filter ( )
event pfc_cst_ai_report ( )
dw_report dw_report
tab_1 tab_1
end type
global uo_peer_review_alternate uo_peer_review_alternate

type variables
w_main parent_window

String ls_letter_printed
end variables

forward prototypes
public function integer of_setup ()
public function integer of_add_case ()
public function integer of_add_doc ()
public function integer of_letter ()
public function integer of_letter_ai (string as_letter_name, string as_letter_type, integer ab_response_required, long al_prac_ids[])
public function integer of_filter ()
public function integer of_ai_report ()
public function integer of_peer_review_profile ()
end prototypes

event pfc_cst_letter;of_letter( )
end event

event pfc_cst_print_report;DataWindowChild dwchild

IF tab_1.SelectedTab = 1 THEN
	
	dw_report.DataObject = "d_rpt_case_review_browse"
	dw_report.SetTransObject( SQLCA )
	dw_report.Retrieve()
ELSEIF tab_1.SelectedTab = 2 THEN
	IF tab_1.tabpage_detail.tab_2.SelectedTab = 1 THEN
		dw_report.DataObject = "d_rpt_case_review_detail"
		dw_report.SetTransObject( SQLCA )
		dw_report.Retrieve( tab_1.tabpage_detail.tab_2.tabpage_case_detail.dw_detail.GetItemNumber( 1, "case_number" ))		
		//dw_report.Object.rpt_1.GetChild( "severity_grade", dwchild )
		//dwchild.SetTransObject( SQLCA )
		//dwchild.Retrieve("Case Review Severity Grade")
		//dwchild.InsertRow( 1 )
		
	ELSEIF tab_1.tabpage_detail.tab_2.SelectedTab = 2 THEN
		of_ai_report()
	END IF
END IF

dw_report.GetChild( "review_status", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("Case Review Status")
dwchild.InsertRow( 1 )

dw_report.GetChild( "review_reason", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("Case Review Reason")
dwchild.InsertRow( 1 )

dw_report.GetChild( "sex", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("Gender")
dwchild.InsertRow( 1 )

dw_report.Print()
end event

event pfc_cst_filter;of_filter( )
end event

event pfc_cst_ai_report;of_ai_report()
end event

public function integer of_setup ();long	ll_Count

DataWindowChild dwchild

tab_1.tabpage_detail.tab_2.tabpage_case_detail.dw_detail.SetTransObject( SQLCA )


//tab_1.tabpage_detail.tab_2.tabpage_case_detail.dw_detail.ShareData( tab_1.tabpage_browse.dw_browse )

tab_1.tabpage_detail.tab_2.tabpage_case_detail.dw_physicians.SetTransObject( SQLCA )

tab_1.tabpage_detail.tab_2.tabpage_ai.dw_action_item.SetTransObject( SQLCA )

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-01
//$<modify> 01.17.2006 By: LeiWei
//$<reason> Performance tuning
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

/*
tab_1.tabpage_detail.tab_2.tabpage_case_detail.dw_detail.GetChild( "review_status", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("Case/Peer Review Status")
dwchild.InsertRow( 1 )

tab_1.tabpage_detail.tab_2.tabpage_case_detail.dw_detail.GetChild( "review_reason", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("Case/Peer Review Reason")
dwchild.InsertRow( 1 )

tab_1.tabpage_detail.tab_2.tabpage_case_detail.dw_detail.GetChild( "sex", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("Gender")
dwchild.InsertRow( 1 )

tab_1.tabpage_detail.tab_2.tabpage_case_detail.dw_physicians.GetChild( "severity_grade", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("Case/Peer Review Severity Grade")
dwchild.InsertRow( 1 )

//tab_1.tabpage_detail.tab_2.tabpage_ai.dw_action_item.GetChild( "committee_name", dwchild )
//dwchild.SetTransObject( SQLCA )
//dwchild.Retrieve("Case/Peer Review Committee")
//dwchild.InsertRow( 1 )
//
tab_1.tabpage_detail.tab_2.tabpage_ai.dw_action_item.GetChild( "action_type", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("Case/Peer Review Action Item Type")
dwchild.InsertRow( 1 )

tab_1.tabpage_detail.tab_2.tabpage_ai.dw_action_item.GetChild( "action_status", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("Case/Peer Review Action Item Status")
dwchild.InsertRow( 1 )

tab_1.tabpage_detail.tab_2.tabpage_ai.dw_action_item.GetChild( "action_to", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("Case/Peer Review Action Item To")
dwchild.InsertRow( 1 )

tab_1.tabpage_browse.dw_browse.GetChild( "review_status", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("Case/Peer Review Status")
dwchild.InsertRow( 1 )

tab_1.tabpage_browse.dw_browse.GetChild( "review_reason", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("Case/Peer Review Reason")
dwchild.InsertRow( 1 )

tab_1.tabpage_browse.dw_browse.GetChild( "sex", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("Gender")
dwchild.InsertRow( 1 )


//Case/Peer Review Action Item Type

tab_1.tabpage_detail.tab_2.tabpage_case_detail.dw_detail.of_SetRowManager( TRUE )
tab_1.tabpage_detail.tab_2.tabpage_case_detail.dw_detail.of_SetReqColumn(True)
tab_1.tabpage_detail.tab_2.tabpage_case_detail.dw_detail.of_SetDropDownCalendar( TRUE )
tab_1.tabpage_detail.tab_2.tabpage_case_detail.dw_detail.iuo_calendar.of_Register( tab_1.tabpage_detail.tab_2.tabpage_case_detail.dw_detail.iuo_calendar.DDLB )

tab_1.tabpage_detail.tab_2.tabpage_ai.dw_action_item.of_SetRowManager( TRUE )
tab_1.tabpage_detail.tab_2.tabpage_ai.dw_action_item.of_SetReqColumn(True)
tab_1.tabpage_detail.tab_2.tabpage_ai.dw_action_item.of_SetDropDownCalendar( TRUE )
tab_1.tabpage_detail.tab_2.tabpage_ai.dw_action_item.iuo_calendar.of_Register( tab_1.tabpage_detail.tab_2.tabpage_ai.dw_action_item.iuo_calendar.DDLB )


tab_1.tabpage_browse.dw_browse.SetTransObject( SQLCA )
tab_1.tabpage_browse.dw_browse.Retrieve( )
*/
DataWindowChild dwchild1,dwchild2,dwchild3,dwchild4,dwchild5,dwchild6,dwchild7,dwchild8,dwchild9,dwchild10

gnv_appeondb.of_startqueue( )

tab_1.tabpage_detail.tab_2.tabpage_case_detail.dw_detail.GetChild( "review_status", dwchild1 )
dwchild1.SetTransObject( SQLCA )
dwchild1.Retrieve("Case/Peer Review Status")

tab_1.tabpage_detail.tab_2.tabpage_case_detail.dw_detail.GetChild( "review_reason", dwchild2 )
dwchild2.SetTransObject( SQLCA )
dwchild2.Retrieve("Case/Peer Review Reason")

tab_1.tabpage_detail.tab_2.tabpage_case_detail.dw_detail.GetChild( "sex", dwchild3 )
dwchild3.SetTransObject( SQLCA )
dwchild3.Retrieve("Gender")

tab_1.tabpage_detail.tab_2.tabpage_case_detail.dw_physicians.GetChild( "severity_grade", dwchild4 )
dwchild4.SetTransObject( SQLCA )
dwchild4.Retrieve("Case/Peer Review Severity Grade")

tab_1.tabpage_detail.tab_2.tabpage_ai.dw_action_item.GetChild( "action_type", dwchild5 )
dwchild5.SetTransObject( SQLCA )
dwchild5.Retrieve("Case/Peer Review Action Item Type")

tab_1.tabpage_detail.tab_2.tabpage_ai.dw_action_item.GetChild( "action_status", dwchild6 )
dwchild6.SetTransObject( SQLCA )
dwchild6.Retrieve("Case/Peer Review Action Item Status")

tab_1.tabpage_detail.tab_2.tabpage_ai.dw_action_item.GetChild( "action_to", dwchild7 )
dwchild7.SetTransObject( SQLCA )
dwchild7.Retrieve("Case/Peer Review Action Item To")

tab_1.tabpage_browse.dw_browse.GetChild( "review_status", dwchild8 )
dwchild8.SetTransObject( SQLCA )
dwchild8.Retrieve("Case/Peer Review Status")

tab_1.tabpage_browse.dw_browse.GetChild( "review_reason", dwchild9 )
dwchild9.SetTransObject( SQLCA )
dwchild9.Retrieve("Case/Peer Review Reason")

tab_1.tabpage_browse.dw_browse.GetChild( "sex", dwchild10 )
dwchild10.SetTransObject( SQLCA )
dwchild10.Retrieve("Gender")

tab_1.tabpage_browse.dw_browse.SetTransObject( SQLCA )
tab_1.tabpage_browse.dw_browse.Retrieve( gs_user_id )

//--------------------------- APPEON BEGIN ---------------------------
//$<Add  > 2007-09-24 By: Scofield
//$<Reason> Select the first row when initialized
ll_Count = tab_1.tabpage_browse.dw_browse.RowCount()
if ll_Count >= 1 then
	tab_1.tabpage_browse.dw_browse.SetRow(1)
	tab_1.tabpage_browse.dw_browse.SelectRow(0,false)
	tab_1.tabpage_browse.dw_browse.SelectRow(1,true)
end if
//---------------------------- APPEON END ----------------------------

gnv_appeondb.of_commitqueue( )

dwchild1.InsertRow( 1 )
dwchild2.InsertRow( 1 )
dwchild3.InsertRow( 1 )
dwchild4.InsertRow( 1 )
dwchild5.InsertRow( 1 )
dwchild6.InsertRow( 1 )
dwchild7.InsertRow( 1 )
dwchild8.InsertRow( 1 )
dwchild9.InsertRow( 1 )
dwchild10.InsertRow( 1 )

//Case/Peer Review Action Item Type
tab_1.tabpage_detail.tab_2.tabpage_case_detail.dw_detail.of_SetRowManager( TRUE )
tab_1.tabpage_detail.tab_2.tabpage_case_detail.dw_detail.of_SetReqColumn(True)
tab_1.tabpage_detail.tab_2.tabpage_case_detail.dw_detail.of_SetDropDownCalendar( TRUE )
tab_1.tabpage_detail.tab_2.tabpage_case_detail.dw_detail.iuo_calendar.of_Register( tab_1.tabpage_detail.tab_2.tabpage_case_detail.dw_detail.iuo_calendar.DDLB )

tab_1.tabpage_detail.tab_2.tabpage_ai.dw_action_item.of_SetRowManager( TRUE )
tab_1.tabpage_detail.tab_2.tabpage_ai.dw_action_item.of_SetReqColumn(True)
tab_1.tabpage_detail.tab_2.tabpage_ai.dw_action_item.of_SetDropDownCalendar( TRUE )
tab_1.tabpage_detail.tab_2.tabpage_ai.dw_action_item.iuo_calendar.of_Register( tab_1.tabpage_detail.tab_2.tabpage_ai.dw_action_item.iuo_calendar.DDLB )

//---------------------------- APPEON END ----------------------------

RETURN -1
end function

public function integer of_add_case ();if IsValid(Parent_Window) then parent_window.Event pfc_save()

tab_1.SelectTab( 2 )

tab_1.tabpage_detail.tab_2.tabpage_case_detail.dw_detail.Reset( )
tab_1.tabpage_detail.tab_2.tabpage_case_detail.dw_detail.SetFocus( )

tab_1.tabpage_detail.tab_2.tabpage_case_detail.dw_physicians.Reset( )
tab_1.tabpage_detail.tab_2.tabpage_case_detail.dw_physicians.Visible = true		//Added by Scofield on 2008-04-21

tab_1.tabpage_detail.tab_2.tabpage_case_detail.dw_detail.InsertRow( 0 )

Return 0
end function

public function integer of_add_doc ();/******************************************************************************************************************
**  [PUBLIC]   : of_add_doc( )
**==================================================================================================================
**  Purpose   	: 
**==================================================================================================================
**  Arguments 	: [none] 
**==================================================================================================================
**  Returns   	: [none]   
**==================================================================================================================
**  Notes     	: 	   
**==================================================================================================================
**  Created By	:  ?Intellisoftgroup, Inc
**==================================================================================================================
**  Modification Log
**   Changed By             Change Date                                               Reason
** ------------------------------------------------------------------------------------------------------------------
** MSkinner           05 April 2006                                      Sometimes w_extended_search_new returns 
**																								 gs_batch_search insted of gs_search. Added code to
**                                                                       accomidate this.
********************************************************************************************************************/

Long li_nr
Long li_find
Long ll_prac_id
Decimal ldec_case_number
Long li_facility_id
Long ll_i
String ls_full_name
gs_search lstr_search


li_facility_id = tab_1.tabpage_detail.tab_2.tabpage_case_detail.dw_detail.GetItemNumber( 1, "facility_id" )

lstr_search.stran_transaction = SQLCA
lstr_search.ls_open_for = "REPORTS" + String( li_facility_id ) 

OpenWithParm( w_extended_search_new , lstr_search )

IF Message.DoubleParm = -1 THEN
	Return -1
END IF

// mskinner 05 april 2006 -- begin
if message.powerobjectparm.classname() = 'gs_batch_search' then 
	 gs_batch_search lstr_search2
    lstr_search2 = message.powerobjectparm
	 for ll_i = 1 to upperbound(lstr_search2.li_prac_id)
			 ll_prac_id = lstr_search2.li_prac_id[ll_i]
			 ls_full_name = lstr_search2.ls_name[ll_i]
			 li_find = tab_1.tabpage_detail.tab_2.tabpage_case_detail.dw_physicians.Find( "prac_id = " + String( ll_prac_id ), 1, 1000 )
		
			 IF li_find < 1 THEN
				 li_nr = tab_1.tabpage_detail.tab_2.tabpage_case_detail.dw_physicians.InsertRow( 0 )
				 ldec_case_number = tab_1.tabpage_detail.tab_2.tabpage_case_detail.dw_detail.GetItemNumber( 1, "case_number" )
				 tab_1.tabpage_detail.tab_2.tabpage_case_detail.dw_physicians.SetItem( li_nr, "prac_id", ll_prac_id )
				 tab_1.tabpage_detail.tab_2.tabpage_case_detail.dw_physicians.SetItem( li_nr, "rec_id", 0 )
				 tab_1.tabpage_detail.tab_2.tabpage_case_detail.dw_physicians.SetItem( li_nr, "full_name", ls_full_name )
				 tab_1.tabpage_detail.tab_2.tabpage_case_detail.dw_physicians.SetItem( li_nr, "case_number", ldec_case_number )
			 END IF
     next
	 
  return 1
else 
	 ll_prac_id = Long( Mid( Message.StringParm, 1, Pos( Message.StringParm, "-" ) -1 ) )
    ls_full_name = Mid( Message.StringParm, Pos( Message.StringParm, "-" ) +1, 100 )
end if 
// mskinner 05 april 2006 -- end

li_find = tab_1.tabpage_detail.tab_2.tabpage_case_detail.dw_physicians.Find( "prac_id = " + String( ll_prac_id ), 1, 1000 )

IF li_find > 0 THEN
	MessageBox("Select Error", "You have already selected this person (id# " + string(ll_prac_id) + "), Please reselect." )
	Return -1
END IF

li_nr = tab_1.tabpage_detail.tab_2.tabpage_case_detail.dw_physicians.InsertRow( 0 )

ldec_case_number = tab_1.tabpage_detail.tab_2.tabpage_case_detail.dw_detail.GetItemNumber( 1, "case_number" )

tab_1.tabpage_detail.tab_2.tabpage_case_detail.dw_physicians.SetItem( li_nr, "prac_id", ll_prac_id )
tab_1.tabpage_detail.tab_2.tabpage_case_detail.dw_physicians.SetItem( li_nr, "rec_id", 0 )
tab_1.tabpage_detail.tab_2.tabpage_case_detail.dw_physicians.SetItem( li_nr, "full_name", ls_full_name )
tab_1.tabpage_detail.tab_2.tabpage_case_detail.dw_physicians.SetItem( li_nr, "case_number", ldec_case_number )



Return 1
end function

public function integer of_letter ();Long ll_prac_ids[]
Decimal ldec_case_number
Integer li_facility_id
Integer li_rc
Integer p

li_rc = tab_1.tabpage_detail.tab_2.tabpage_case_detail.dw_physicians.RowCount( )

IF li_rc = 0 THEN
	MessageBox("Letter Error", "There must be at least one attributring physician to genarate a letter." )
	Return -1
END IF


FOR p = 1 TO li_Rc
	IF tab_1.tabpage_detail.tab_2.tabpage_case_detail.dw_physicians.GetItemNumber( p, "selected" ) = 1 THEN
		ll_prac_ids[p] = tab_1.tabpage_detail.tab_2.tabpage_case_detail.dw_physicians.GetItemNumber( p, "prac_id" )
		tab_1.tabpage_detail.tab_2.tabpage_case_detail.dw_physicians.SetItem( p, "selected", 0 )		
	END IF
END FOR

Open( w_letter_generator )


ldec_case_number = tab_1.tabpage_detail.tab_2.tabpage_case_detail.dw_physicians.GetItemNumber( 1, "case_number" )
li_facility_id = tab_1.tabpage_detail.tab_2.tabpage_case_detail.dw_detail.GetItemNumber( 1, "facility_id" )
w_letter_generator.of_case_review_letter( ll_prac_ids, ldec_case_number, li_facility_id )



Return 0
end function

public function integer of_letter_ai (string as_letter_name, string as_letter_type, integer ab_response_required, long al_prac_ids[]);Integer i
Integer li_cr
Integer li_rc
Long ll_ai_type
Long ll_ai_status
Long ll_ai_to
String ls_full_name

IF as_letter_type = "Practitioner" THEN
	li_rc = UpperBound( al_prac_ids[] )
ELSE
	li_rc = 1
END IF


SELECT lookup_code
INTO: ll_ai_type
FROM code_lookup
WHERE lookup_name = 'Case/Peer Review Action Item Type' AND
      code = 'Letter';
IF SQLCA.SQLCODE = 100 THEN
	MessageBox("Select Error", "You must have a CODE entry equal to (Letter) in the Case Review Action Item Type lookup table. Go to your Lookup Painter to Correct." )
	Return -1
ELSEIF SQLCA.SQLCODE = -1 THEN
	MessageBox("SQL ERROR", SQLCA.SQLERRTEXT )
	Return -1
END IF

SELECT lookup_code
INTO: ll_ai_to
FROM code_lookup
WHERE lookup_name = 'Case/Peer Review Action Item To' AND
      code = :as_letter_type;
IF SQLCA.SQLCODE = 100 THEN
	MessageBox("Select Error", "You must have a CODE entry equal to (" + as_letter_type + ") in the Case Review Action Item To lookup table. Go to your Lookup Painter to Correct." )
	Return -1
ELSEIF SQLCA.SQLCODE = -1 THEN
	MessageBox("SQL ERROR", SQLCA.SQLERRTEXT )
	Return -1	
END IF

IF ab_response_required = 1 THEN
	SELECT lookup_code
	INTO: ll_ai_status
	FROM code_lookup
	WHERE lookup_name = 'Case/Peer Review Action Item Status' AND
   	   code = 'Waiting';
	IF SQLCA.SQLCODE = 100 THEN
		MessageBox("Select Error", "You must have a CODE entry equal to (Waiting) in the Case Review Action Item Status lookup table. Go to your Lookup Painter to Correct." )
		Return -1
	ELSEIF SQLCA.SQLCODE = -1 THEN
		MessageBox("SQL ERROR", SQLCA.SQLERRTEXT )
		Return -1		
	END IF
ELSE
	SELECT lookup_code
	INTO: ll_ai_status
	FROM code_lookup
	WHERE lookup_name = 'Case/Peer Review Action Item Status' AND
   	   code = 'Complete';
	IF SQLCA.SQLCODE = 100 THEN
		MessageBox("Select Error", "You must have a CODE entry equal to (Completed) in the Case Review Action Item Status lookup table. Go to your Lookup Painter to Correct." )
		Return -1
	ELSEIF SQLCA.SQLCODE = -1 THEN
		MessageBox("SQL ERROR", SQLCA.SQLERRTEXT )
		Return -1		
	END IF	
END IF

FOR i = 1 TO li_rc
	tab_1.tabpage_detail.tab_2.tabpage_ai.dw_action_item.Event pfc_addrow()
	li_cr =  tab_1.tabpage_detail.tab_2.tabpage_ai.dw_action_item.RowCount( )
	IF as_letter_type = "Practitioner" THEN
		SELECT full_name INTO :ls_full_name FROM v_full_name WHERE prac_id = :al_prac_ids[i];
		tab_1.tabpage_detail.tab_2.tabpage_ai.dw_action_item.SetItem( li_cr, "action_to_name", ls_full_name )		
	END IF
	tab_1.tabpage_detail.tab_2.tabpage_ai.dw_action_item.SetItem( li_cr, "action_type", ll_ai_type )
	tab_1.tabpage_detail.tab_2.tabpage_ai.dw_action_item.SetItem( li_cr, "action_to", ll_ai_to )
	tab_1.tabpage_detail.tab_2.tabpage_ai.dw_action_item.SetItem( li_cr, "action_status", ll_ai_status )
	tab_1.tabpage_detail.tab_2.tabpage_ai.dw_action_item.SetItem( li_cr, "action_user", gs_user_id )
	tab_1.tabpage_detail.tab_2.tabpage_ai.dw_action_item.SetItem( li_cr, "notes", "Letter Printed - " + as_letter_name )
	tab_1.tabpage_detail.tab_2.tabpage_ai.dw_action_item.SetItem( li_cr, "action_date", Today( ) )
END FOR

parent_window.Event pfc_save()

Return 0

//tab_1.tabpage_detail.tab_2.tabpage_ai.dw_action_item.GetChild( "action_type", dwchild )
//dwchild.SetTransObject( SQLCA )
//dwchild.Retrieve("Case Review Action Item Type")
//dwchild.InsertRow( 1 )
//
//tab_1.tabpage_detail.tab_2.tabpage_ai.dw_action_item.GetChild( "action_status", dwchild )
//dwchild.SetTransObject( SQLCA )
//dwchild.Retrieve("Case Review Action Item Status")
//dwchild.InsertRow( 1 )
//
//tab_1.tabpage_detail.tab_2.tabpage_ai.dw_action_item.GetChild( "action_to", dwchild )
//dwchild.SetTransObject( SQLCA )
//dwchild.Retrieve("Case Review Action Item To")
//dwchild.InsertRow( 1 )
//
end function

public function integer of_filter ();//from case review window
OpenWithParm( w_case_review_filter, "CRW" )

Return 0
end function

public function integer of_ai_report ();DataWindowChild dwchild

tab_1.tabpage_detail.tab_2.tabpage_ai.dw_ai_report.of_SetTRansObject( sqlca )

tab_1.tabpage_detail.tab_2.tabpage_ai.dw_ai_report.GetChild( "action_type", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("Case/Peer Review Action Item Type")
dwchild.InsertRow( 1 )

tab_1.tabpage_detail.tab_2.tabpage_ai.dw_ai_report.GetChild( "action_status", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("Case/Peer Review Action Item Status")
dwchild.InsertRow( 1 )

tab_1.tabpage_detail.tab_2.tabpage_ai.dw_ai_report.GetChild( "action_to", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("Case/Peer Review Action Item To")
dwchild.InsertRow( 1 )


tab_1.tabpage_detail.tab_2.tabpage_ai.dw_ai_report.Reset( )
tab_1.tabpage_detail.tab_2.tabpage_ai.dw_action_item.RowsCopy( 1, 100000, Primary!, tab_1.tabpage_detail.tab_2.tabpage_ai.dw_ai_report, 1, Primary! )
tab_1.tabpage_detail.tab_2.tabpage_ai.dw_ai_report.Print( )

Return 0
end function

public function integer of_peer_review_profile ();Integer li_facility_id
Long ll_prac_id

pfc_cst_u_reports rept

rept = CREATE pfc_cst_u_reports;

li_facility_id = tab_1.tabpage_detail.tab_2.tabpage_case_detail.dw_detail.GetItemNumber( 1, "facility_id" )
ll_prac_id =  tab_1.tabpage_detail.tab_2.tabpage_case_detail.dw_physicians.GetItemNumber( 1, "prac_id" )
rept.of_peer_review_profile( ll_prac_id, li_facility_id )

Return 0
end function

on uo_peer_review_alternate.create
this.dw_report=create dw_report
this.tab_1=create tab_1
this.Control[]={this.dw_report,&
this.tab_1}
end on

on uo_peer_review_alternate.destroy
destroy(this.dw_report)
destroy(this.tab_1)
end on

event constructor;//--------------------------- APPEON BEGIN ---------------------------
//$<add> 2006-09-01 By: Liu HongXin
//$<reason> Fix defect.
DataWindowChild dw_child
integer 	ll_rtn
long		ll_RowCnt

ll_rtn = tab_1.tabpage_detail.tab_2.tabpage_case_detail.dw_detail.GetChild('facility_id', dw_child)

IF ll_rtn = -1 THEN MessageBox("Error", "Not a DataWindowChild")

//--------------------------- APPEON BEGIN ---------------------------
//$< Add  > 2007-09-14 By: Scofield
//$<Reason> Set the connection cache dynamically on Web
if AppeonGetClientType() = 'WEB' then
	SQLCA.DBMS = gs_CacheType
	SQLCA.DBParm = gs_CacheSet
end if
//---------------------------- APPEON END ----------------------------


CONNECT USING SQLCA;
dw_child.SetTransObject(SQLCA)
ll_RowCnt = dw_child.Retrieve(gs_user_id)
if ll_RowCnt <= 0 then dw_child.InsertRow(0)			//Added by Scofield on 2008-04-22
//---------------------------- APPEON END ----------------------------

end event

type dw_report from datawindow within uo_peer_review_alternate
integer x = 361
integer y = 1872
integer width = 325
integer height = 316
integer taborder = 20
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type tab_1 from tab within uo_peer_review_alternate
integer width = 3250
integer height = 1832
integer taborder = 10
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
tabpage_browse tabpage_browse
tabpage_detail tabpage_detail
end type

on tab_1.create
this.tabpage_browse=create tabpage_browse
this.tabpage_detail=create tabpage_detail
this.Control[]={this.tabpage_browse,&
this.tabpage_detail}
end on

on tab_1.destroy
destroy(this.tabpage_browse)
destroy(this.tabpage_detail)
end on

event selectionchanged;//--------------------------- APPEON BEGIN ---------------------------
//$< Add  > 2007-09-24 By: Scofield
//$<Reason> When change the tabpage,then retrieve the detail information

long 		ll_row,ll_Count
decimal 	ldec_case_number

ll_row = tab_1.tabpage_browse.dw_browse.getrow()

if oldindex = 1 and newindex = 2 then
	if ll_row > 0 and ll_row <= tab_1.tabpage_browse.dw_browse.RowCount() then
		tab_1.tabpage_detail.tab_2.tabpage_case_detail.dw_physicians.Visible = true
		ldec_case_number = tab_1.tabpage_browse.dw_browse.GetItemNumber(ll_row, "case_number")
		gnv_appeondb.of_startqueue( )
		tab_1.tabpage_detail.tab_2.tabpage_case_detail.dw_detail.Retrieve( ldec_case_number )
		tab_1.tabpage_detail.tab_2.tabpage_case_detail.dw_physicians.Retrieve( ldec_case_number )
		tab_1.tabpage_detail.tab_2.tabpage_ai.dw_action_item.Retrieve( ldec_case_number )
		gnv_appeondb.of_commitqueue( )
	else
		if tab_1.tabpage_detail.tab_2.tabpage_case_detail.dw_detail.RowCount() <= 0 then
			tab_1.tabpage_detail.tab_2.tabpage_case_detail.dw_physicians.Visible = false
		end if
	end if
elseif oldindex = 2 and newindex = 1 then
	tab_1.tabpage_browse.dw_browse.Retrieve(gs_user_id)
	ll_Count = tab_1.tabpage_browse.dw_browse.RowCount()
	
	if ll_row > 0 and ll_row <= ll_Count then
		tab_1.tabpage_browse.dw_browse.ScrollToRow(ll_row)
		tab_1.tabpage_browse.dw_browse.SetRow(ll_row)
		tab_1.tabpage_browse.dw_browse.SelectRow(0,false)
		tab_1.tabpage_browse.dw_browse.SelectRow(ll_row,true)
	end if
end if
//---------------------------- APPEON END ----------------------------

end event

event selectionchanging;integer	li_Rtn

if oldindex = 2 and newindex = 1 and IsValid(parent_window) then //Modify by Evan 01/11/2008
	li_Rtn = parent_window.Event pfc_Save()
	if li_Rtn < 0 then
		return 1
	end if
end if

end event

type tabpage_browse from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3214
integer height = 1704
long backcolor = 80269524
string text = "Browse"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
string picturename = "Justify!"
long picturemaskcolor = 553648127
dw_browse dw_browse
end type

on tabpage_browse.create
this.dw_browse=create dw_browse
this.Control[]={this.dw_browse}
end on

on tabpage_browse.destroy
destroy(this.dw_browse)
end on

type dw_browse from u_dw within tabpage_browse
integer x = 5
integer y = 16
integer width = 3195
integer height = 1668
integer taborder = 20
string dataobject = "d_case_review_browse"
boolean hscrollbar = true
end type

event pfc_addrow;call super::pfc_addrow;of_add_case()

Return 1
end event

event doubleclicked;call super::doubleclicked;//Decimal ldec_case_number
//
////--------------------------- APPEON BEGIN ---------------------------
////$<add> 2005-11-11 By: Liang QingShi
////$<reason> Fix a defect.
//
//if row <= 0 then return
//
////---------------------------- APPEON END ----------------------------
//
//ldec_case_number = This.GetItemNumber( row, "case_number" )
//
////--------------------------- APPEON BEGIN ---------------------------
////$<ID> PT-02
////$<add> 02.08.2006 By: LeiWei
////$<reason> Performance tuning
////$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.
//
//gnv_appeondb.of_startqueue( )
////---------------------------- APPEON END ----------------------------
//
//tab_1.tabpage_detail.tab_2.tabpage_case_detail.dw_detail.Retrieve( ldec_case_number )
//tab_1.tabpage_detail.tab_2.tabpage_case_detail.dw_physicians.Retrieve( ldec_case_number )
//tab_1.tabpage_detail.tab_2.tabpage_ai.dw_action_item.Retrieve(  ldec_case_number )
//
////--------------------------- APPEON BEGIN ---------------------------
////$<ID> PT-03
////$<add> 02.08.2006 By: LeiWei
////$<reason> Performance tuning
////$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.
//
//gnv_appeondb.of_commitqueue( )
////---------------------------- APPEON END ----------------------------

tab_1.SelectTab( 2 )
end event

event clicked;call super::clicked;This.SelectRow( 0, False )
This.SelectRow( row, True )
end event

event retrieveend;call super::retrieveend;//IF rowcount > 0 THEN						//Commented by Scofield on 2007-09-24
//	This.SelectRow( 1, True )
//END IF
end event

event pfc_deleterow;//--------------------------- APPEON BEGIN ---------------------------
//$< Add  > 2008-04-21 By: Scofield
//$<Reason> Forbid user to delete data in this tabpage.

long	ll_RowCnt

ll_RowCnt = tab_1.tabpage_browse.dw_browse.RowCount()

if ll_RowCnt > 0 then
	MessageBox(gnv_app.iapp_object.DisplayName,'If you want to delete the data, please delete it in the Detail tab page.')
end if

Return 1
//---------------------------- APPEON END ----------------------------

end event

type tabpage_detail from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3214
integer height = 1704
long backcolor = 80269524
string text = "Detail"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
string picturename = "ArrangeTables!"
long picturemaskcolor = 553648127
tab_2 tab_2
end type

on tabpage_detail.create
this.tab_2=create tab_2
this.Control[]={this.tab_2}
end on

on tabpage_detail.destroy
destroy(this.tab_2)
end on

type tab_2 from tab within tabpage_detail
integer x = 14
integer y = 28
integer width = 3182
integer height = 1648
integer taborder = 30
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
tabpage_case_detail tabpage_case_detail
tabpage_ai tabpage_ai
end type

on tab_2.create
this.tabpage_case_detail=create tabpage_case_detail
this.tabpage_ai=create tabpage_ai
this.Control[]={this.tabpage_case_detail,&
this.tabpage_ai}
end on

on tab_2.destroy
destroy(this.tabpage_case_detail)
destroy(this.tabpage_ai)
end on

event selectionchanged;IF newindex = 2 THEN
	tab_1.tabpage_detail.tab_2.tabpage_ai.dw_action_item.SetFocus( )
ELSE
	tab_1.tabpage_detail.tab_2.tabpage_case_detail.dw_detail.SetFocus( )
END IF
end event

type tabpage_case_detail from userobject within tab_2
integer x = 18
integer y = 16
integer width = 3145
integer height = 1520
long backcolor = 80269524
string text = "Case Information"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
string picturename = "Custom081!"
long picturemaskcolor = 553648127
dw_physicians dw_physicians
dw_detail dw_detail
end type

on tabpage_case_detail.create
this.dw_physicians=create dw_physicians
this.dw_detail=create dw_detail
this.Control[]={this.dw_physicians,&
this.dw_detail}
end on

on tabpage_case_detail.destroy
destroy(this.dw_physicians)
destroy(this.dw_detail)
end on

type dw_physicians from u_dw within tabpage_case_detail
integer x = 64
integer y = 592
integer width = 1499
integer height = 360
integer taborder = 11
string dataobject = "d_case_review_attrib_physicians"
end type

event pfc_addrow;of_add_doc()

Return 0
end event

event getfocus;call super::getfocus;borderstyle = styleraised!

end event

event losefocus;call super::losefocus;borderstyle = stylelowered!
end event

type dw_detail from u_dw within tabpage_case_detail
integer x = 14
integer y = 12
integer width = 3122
integer height = 1488
integer taborder = 21
string dataobject = "d_case_review_detail"
boolean vscrollbar = false
end type

event pfc_deleterow;//--------------------------- APPEON BEGIN ---------------------------
//$<Modify> 2007-09-24 By: Scofield
//$<Reason> Add a tip information before delete record
Integer	li_Rtn
long		ll_Cycle,ll_RowCnt

li_Rtn = MessageBox(gnv_app.iapp_object.DisplayName,'Are you sure you want to delete this row?',Question!,YesNo!,2)

if li_Rtn = 1 then
	ll_RowCnt = tab_1.tabpage_detail.tab_2.tabpage_case_detail.dw_physicians.RowCount()
	for ll_Cycle = 1 to ll_RowCnt
		tab_1.tabpage_detail.tab_2.tabpage_case_detail.dw_physicians.DeleteRow(1)
	next
	
	ll_RowCnt = tab_1.tabpage_detail.tab_2.tabpage_ai.dw_action_item.RowCount()
	for ll_Cycle = 1 to ll_RowCnt
		tab_1.tabpage_detail.tab_2.tabpage_ai.dw_action_item.DeleteRow(1)
	next
	
	tab_1.tabpage_detail.tab_2.tabpage_case_detail.dw_physicians.Visible = false
	return Super::Event pfc_deleteRow()
else
	return 1
end if

//---------------------------- APPEON END ----------------------------
end event

event pfc_addrow;//--------------------------- APPEON BEGIN ---------------------------
//$< Add  > 2008-04-21 By: Scofield
//$<Reason> Make the dw_physicians is visible.

of_add_case()

Return 1
//---------------------------- APPEON END ----------------------------

end event

type tabpage_ai from userobject within tab_2
integer x = 18
integer y = 16
integer width = 3145
integer height = 1520
long backcolor = 80269524
string text = "Action Items"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
string picturename = "Watcom!"
long picturemaskcolor = 553648127
dw_ai_report dw_ai_report
dw_action_item dw_action_item
end type

on tabpage_ai.create
this.dw_ai_report=create dw_ai_report
this.dw_action_item=create dw_action_item
this.Control[]={this.dw_ai_report,&
this.dw_action_item}
end on

on tabpage_ai.destroy
destroy(this.dw_ai_report)
destroy(this.dw_action_item)
end on

type dw_ai_report from u_dw within tabpage_ai
boolean visible = false
integer x = 283
integer y = 632
integer width = 1467
integer height = 680
integer taborder = 11
string dataobject = "d_case_action_items_report"
end type

event constructor;call super::constructor;This.of_SetUpdateAble( False )
end event

type dw_action_item from u_dw within tabpage_ai
integer x = 14
integer y = 12
integer width = 3113
integer height = 1448
integer taborder = 11
string dataobject = "d_case_action_items"
end type

event pfc_addrow;call super::pfc_addrow;Long LL_Rec_id

//--------------------------- APPEON BEGIN ---------------------------
//$<Add> 03/18/2008 By: Ken.Guo
//$<Reason> Add trap
If tab_1.tabpage_detail.tab_2.tabpage_case_detail.dw_detail.GetRow() < 1 Then
	If This.GetRow() > 0 Then This.Deleterow(This.GetRow()) //Delete added row
	Messagebox('Information','You must add data to the "Case Information" tab first before adding action items data here.')
	Return -1
End If
//---------------------------- APPEON END ----------------------------


This.SetItem( This.GetRow( ), "case_number", tab_1.tabpage_detail.tab_2.tabpage_case_detail.dw_detail.GetItemNumber( tab_1.tabpage_detail.tab_2.tabpage_case_detail.dw_detail.GetRow(), "case_number" ))
This.SetItem( This.GetRow( ), "rec_id", gnv_app.of_get_id( "RECORD_ID" ) )

Return 0
end event

