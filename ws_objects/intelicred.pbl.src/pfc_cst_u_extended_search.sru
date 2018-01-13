$PBExportHeader$pfc_cst_u_extended_search.sru
forward
global type pfc_cst_u_extended_search from userobject
end type
type cb_27 from u_search_letter_button within pfc_cst_u_extended_search
end type
type cb_26 from u_search_letter_button within pfc_cst_u_extended_search
end type
type cb_1 from u_search_letter_button within pfc_cst_u_extended_search
end type
type cb_2 from u_search_letter_button within pfc_cst_u_extended_search
end type
type cb_3 from u_search_letter_button within pfc_cst_u_extended_search
end type
type cb_4 from u_search_letter_button within pfc_cst_u_extended_search
end type
type cb_5 from u_search_letter_button within pfc_cst_u_extended_search
end type
type cb_6 from u_search_letter_button within pfc_cst_u_extended_search
end type
type cb_7 from u_search_letter_button within pfc_cst_u_extended_search
end type
type cb_8 from u_search_letter_button within pfc_cst_u_extended_search
end type
type cb_9 from u_search_letter_button within pfc_cst_u_extended_search
end type
type cb_10 from u_search_letter_button within pfc_cst_u_extended_search
end type
type cb_11 from u_search_letter_button within pfc_cst_u_extended_search
end type
type cb_12 from u_search_letter_button within pfc_cst_u_extended_search
end type
type cb_13 from u_search_letter_button within pfc_cst_u_extended_search
end type
type cb_14 from u_search_letter_button within pfc_cst_u_extended_search
end type
type cb_15 from u_search_letter_button within pfc_cst_u_extended_search
end type
type cb_16 from u_search_letter_button within pfc_cst_u_extended_search
end type
type cb_17 from u_search_letter_button within pfc_cst_u_extended_search
end type
type cb_18 from u_search_letter_button within pfc_cst_u_extended_search
end type
type cb_19 from u_search_letter_button within pfc_cst_u_extended_search
end type
type cb_20 from u_search_letter_button within pfc_cst_u_extended_search
end type
type cb_21 from u_search_letter_button within pfc_cst_u_extended_search
end type
type cb_22 from u_search_letter_button within pfc_cst_u_extended_search
end type
type cb_23 from u_search_letter_button within pfc_cst_u_extended_search
end type
type cb_24 from u_search_letter_button within pfc_cst_u_extended_search
end type
type cb_25 from u_search_letter_button within pfc_cst_u_extended_search
end type
type cb_28 from u_search_letter_button within pfc_cst_u_extended_search
end type
type dw_department from datawindow within pfc_cst_u_extended_search
end type
type cb_iverify from commandbutton within pfc_cst_u_extended_search
end type
type ddlb_search_type from dropdownlistbox within pfc_cst_u_extended_search
end type
type cbx_status from checkbox within pfc_cst_u_extended_search
end type
type dw_view from u_dw within pfc_cst_u_extended_search
end type
type cb_select from commandbutton within pfc_cst_u_extended_search
end type
type cb_search from u_cb within pfc_cst_u_extended_search
end type
type sle_srch_val from singlelineedit within pfc_cst_u_extended_search
end type
type gb_2 from groupbox within pfc_cst_u_extended_search
end type
type gb_department from groupbox within pfc_cst_u_extended_search
end type
type gb_search from groupbox within pfc_cst_u_extended_search
end type
type gb_view from groupbox within pfc_cst_u_extended_search
end type
type dw_search from u_dw within pfc_cst_u_extended_search
end type
type cb_close from commandbutton within pfc_cst_u_extended_search
end type
type cb_new from commandbutton within pfc_cst_u_extended_search
end type
type dw_dept from datawindow within pfc_cst_u_extended_search
end type
type dw_org_facility_select from pfc_cst_u_org_facility_selector_vertical within pfc_cst_u_extended_search
end type
type gb_facility from groupbox within pfc_cst_u_extended_search
end type
end forward

global type pfc_cst_u_extended_search from userobject
integer width = 3547
integer height = 1820
boolean border = true
long backcolor = 67108864
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event ue_cb_select ( )
cb_27 cb_27
cb_26 cb_26
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_4 cb_4
cb_5 cb_5
cb_6 cb_6
cb_7 cb_7
cb_8 cb_8
cb_9 cb_9
cb_10 cb_10
cb_11 cb_11
cb_12 cb_12
cb_13 cb_13
cb_14 cb_14
cb_15 cb_15
cb_16 cb_16
cb_17 cb_17
cb_18 cb_18
cb_19 cb_19
cb_20 cb_20
cb_21 cb_21
cb_22 cb_22
cb_23 cb_23
cb_24 cb_24
cb_25 cb_25
cb_28 cb_28
dw_department dw_department
cb_iverify cb_iverify
ddlb_search_type ddlb_search_type
cbx_status cbx_status
dw_view dw_view
cb_select cb_select
cb_search cb_search
sle_srch_val sle_srch_val
gb_2 gb_2
gb_department gb_department
gb_search gb_search
gb_view gb_view
dw_search dw_search
cb_close cb_close
cb_new cb_new
dw_dept dw_dept
dw_org_facility_select dw_org_facility_select
gb_facility gb_facility
end type
global pfc_cst_u_extended_search pfc_cst_u_extended_search

type variables
Long ll_all_departments[]

Integer il_facility_id
Integer li_num_of_departments
Integer li_num_of_departments_user_has_rights_to
String is_open_for
String is_select = 'S'

long il_dept = 0
integer ii_user_view

w_prac_data_1 iw_prac_folder

n_tr SQLCA_1

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-01
//$<add> 01.24.2006 By: Cao YongWang
//$<reason> Performance tuning
//$<modification> Define two datastores for caching data.
n_ds ids_views
n_ds ids_facilitys
//---------------------------- APPEON END ----------------------------

end variables

forward prototypes
public function integer of_select_prac (integer ai_row)
public function integer of_close (integer ai_value)
public function integer of_set_open_for (string as_open_for)
public function integer of_set_parent (w_prac_data_1 aw_win)
public function integer of_set_transaction (n_tr as_trans)
public function integer of_open_from_dash ()
public function integer of_select_all ()
public function integer of_se ()
public function integer of_hide_ssn ()
public function integer of_search_old (string letter)
public function integer of_search (string as_letter)
public function integer of_search_new (string as_letter)
public function integer of_search_trap (string as_type, string as_val)
public subroutine of_init_dddw ()
public function integer of_delete_prac (long al_prac)
public function string of_get_batch (integer ai_batch)
end prototypes

event ue_cb_select();////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  [PUBLIC]   : ue_cb_select
//==================================================================================================================
//  Purpose   	: Moved the code from the clicked event to this new event so that the it can bea accessed 
//==================================================================================================================
//  Arguments 	: [none] 
//==================================================================================================================
//  Returns   	: [long]     
//==================================================================================================================
//  Notes     	: 	  
//==================================================================================================================
//  Created By	: Michael Skinner  Thursday  October 28, 2004
//==================================================================================================================
//  Modification Log
//   Changed By             Change Date                                               Reason
// ------------------------------------------------------------------------------------------------------------------
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

IF dw_search.RowCount() > 0 THEN
	of_select_prac( dw_search.GetRow() )
END IF
end event

public function integer of_select_prac (integer ai_row);Long ll_prac_id
Integer li_parent_facility_id
Integer li_cnt
Integer li_active_status
String ls_full_name
String ls_names[]
Integer li_msg_ans
Integer li_rc
Integer i
integer r
Long ll_seq
Long ll_prac_ids[]
Integer li_facility_ids[]
long ll_affil_rec //maha 121702
//debugbreak()
IF ai_row < 1 THEN
	RETURN -1
END IF

if dw_search.DataObject = "d_extended_search_list_multi" then //maha 091505 for multi select of practitioners from reports meetings and letters
	gs_batch_search ist_search

	for i = 1 to dw_search.rowcount()
		if dw_search.getitemnumber(i,"selected" ) = 1 then
			r++
			ist_search.li_prac_id[r] = dw_search.getitemnumber(i,"prac_id")
			ist_search.ls_name[r] = dw_search.getitemstring(i,"v_full_name_full_name")
		end if
	next
	//--------------------------- APPEON BEGIN ---------------------------
	//$<add> 03/19/2008 By: Ken.Guo
	//$<reason> Add Trap,Fix BugS030510
	If UpperBound(ist_search.li_prac_id[]) = 0 Then Return -1
	//---------------------------- APPEON END ----------------------------
	Closewithreturn( Parent, ist_search)	
	RETURN 0	
end if

ll_prac_id = dw_search.GetItemNumber(ai_row, "prac_id")
// mskinner 28 Oct 2004 -- begin
gl_prac_id = ll_prac_id
gi_parent_facility = dw_search.GetItemNumber( ai_row, "parent_facility_id" )
if isnull(is_open_for) or len(is_open_for) < 1 then return 0
// mskinner 28 Oct 2004 -- end

IF is_open_for = "DATAENTRY" THEN
	gl_prac_id = ll_prac_id
	dw_view.AcceptText()
	IF dw_view.GetText() = "" OR IsNull( dw_view.GetText() )  THEN
		MessageBox("View", "Please select a view." )
		Return -1
	END IF
	gl_data_view_id = dw_view.GetItemNumber( 1, "data_view_id" )
	gi_parent_facility = dw_search.GetItemNumber( ai_row, "parent_facility_id" )
	
	if w_mdi.of_security_access(120) = 2 then //maha modified 040204 to only allow change of status if user has full rights to appt stat
		SELECT pd_affil_stat.active_status  
		INTO :li_active_status  
		  FROM pd_affil_stat  
		  WHERE ( pd_affil_stat.prac_id = :gl_prac_id ) AND  
				  ( pd_affil_stat.parent_facility_id = :gi_parent_facility ) AND
				pd_affil_stat.active_status <> 0;  // line added 091500 maha
	
		IF li_active_status = 3  THEN
			li_msg_ans = MessageBox("Inactive", "This is an inactive record. Do you want to Re-Active it?", Question!, YesNo!, 1 )
			IF li_msg_ans = 1 THEN
				li_parent_facility_id = dw_search.GetItemNumber( ai_row, "parent_facility_id" )
				
				select rec_id into :ll_affil_rec from pd_affil_stat 
				WHERE ( pd_affil_stat.prac_id = :ll_prac_id ) AND 
				( pd_affil_stat.parent_facility_id = :li_parent_facility_id )and (pd_affil_stat.active_status = 3);//maha 121702
				
				//--------------------------- APPEON BEGIN ---------------------------
				//$<ID> PT-02
            //$<add> 04.13.2006 By: Wangchao
				//$<reason> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.
				//$<reason> Add the Appeon Start Queue Labels. 
				
				gnv_appeondb.of_startqueue( )
				
				//---------------------------- APPEON END ----------------------------
				
				UPDATE pd_affil_stat  
				SET active_status = 1
				  where rec_id = :ll_affil_rec; //maha 121702
	//	   		WHERE ( pd_affil_stat.prac_id = :ll_prac_id ) AND  
	//         		( pd_affil_stat.parent_facility_id = :li_parent_facility_id )and
	//					(pd_affil_stat.active_status = 3);// line added 012201 maha
	
				UPDATE pd_comm_review
				SET active_status = 1 
				  where rec_id = :ll_affil_rec; //maha 121702
	//   			WHERE ( pd_comm_review.prac_id = :ll_prac_id ) AND  
	//         		( pd_comm_review.facility_id = :li_parent_facility_id ) and 
	//					(pd_comm_review.active_status = 3);// line added 012201 maha
						
				UPDATE pd_affil_dept  // added 100102 maha
				SET active_status = 1
				where rec_id = :ll_affil_rec; //maha 121702
	//   			WHERE ( pd_comm_review.prac_id = :ll_prac_id ) AND  
	//         		( pd_comm_review.facility_id = :li_parent_facility_id ) and 
	//					(pd_comm_review.active_status = 3);
						
				UPDATE pd_affil_staff_cat  // added 100102 maha
				SET active_status = 1
				where rec_id = :ll_affil_rec; //maha 121702
	//   			WHERE ( pd_comm_review.prac_id = :ll_prac_id ) AND  
	//         		( pd_comm_review.facility_id = :li_parent_facility_id ) and 
	//					(pd_comm_review.active_status = 3);
				
				UPDATE pd_affil_staff_leave  // added 100102 maha
				SET active_status = 1 
				where rec_id = :ll_affil_rec; //maha 121702
	//   			WHERE ( pd_comm_review.prac_id = :ll_prac_id ) AND  
	//         		( pd_comm_review.facility_id = :li_parent_facility_id ) and 
	//					(pd_comm_review.active_status = 3);
	
				//Start Code Change ---- 03.29.2006 #357 maha add audit record
				select max(seq_no) into :ll_seq from sys_audit where rec_id = :ll_affil_rec and field_id = 100000;

				//--------------------------- APPEON BEGIN ---------------------------
				//$<ID> PT-03
            //$<add> 04.13.2006 By: Wangchao
				//$<reason> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.
				//$<reason> Add an Appeon Commit Queue Label. 
				
				gnv_appeondb.of_commitqueue( )
				
				//---------------------------- APPEON END ----------------------------		
				
				if isnull(ll_seq) then ll_seq = 0
				ll_seq++
				
				//--------------------------- APPEON BEGIN ---------------------------
				//$<ID> PT-04
				//$<add> 06.19.2006 By: LeiWei
				//$<reason> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.
				/*
				INSERT INTO sys_audit (rec_id,field_id,seq_no,table_id,prac_id,old_value,new_value,user_id,date_time_modified, audit_type,exported,facility_id) VALUES (:ll_affil_rec	,	100000,	:ll_seq,	43,	:ll_prac_id,	'3',	'1',	:gs_user_id,	getdate(),	'E',	1,	:gi_parent_facility);
				commit using sqlca;
				*/
				gnv_appeondb.of_startqueue( )
				
				INSERT INTO sys_audit (rec_id,field_id,seq_no,table_id,prac_id,old_value,new_value,user_id,date_time_modified, audit_type,exported,facility_id) VALUES (:ll_affil_rec	,	100000,	:ll_seq,	43,	:ll_prac_id,	'3',	'1',	:gs_user_id,	getdate(),	'E',	1,	:gi_parent_facility);
				commit using sqlca;
				
				gnv_appeondb.of_commitqueue( )
				//---------------------------- APPEON END ----------------------------

				//End Code Change---03.29.2006
				
				//--------------------------- APPEON BEGIN ---------------------------
				//$<add> 12.22.2006 By: Jervis
				//$<reason> Added for Work Flow
				n_cst_workflow_triggers lnv_workflow
				long ll_wf_id
				str_action_item lstr_action
				
				If gb_workflow Then 
					lnv_workflow = create n_cst_workflow_triggers
					ll_wf_id = long(gnv_data.of_getitem("facility","facility_wf_practitioner_status_change","facility_id="+string(li_parent_facility_id)))
					
					//If there is no work flow is related to the facility, then return 
					If not isnull(ll_wf_id) and  ll_wf_id > 0 Then
						lstr_action.prac_id = ll_prac_id
						lstr_action.rec_id = ll_affil_rec
						lstr_action.facility_id = li_parent_facility_id
						lstr_action.wf_id = ll_wf_id
						lstr_action.screen_id = -10
						lnv_workflow.of_workflow_create_action_items(lstr_action)
					end if
					 
					if isvalid(lnv_workflow) then destroy lnv_workflow
				end if
				//---------------------------- APPEON END ----------------------------

				

			END IF
		END IF
	end if
	iw_prac_folder.of_retrieve_prac()
	Return 0
ELSEIF is_open_for = "INTELLIAPP" THEN
	li_rc = dw_search.RowCount()
	gl_prac_ids = ll_prac_ids
	gl_facility_ids = li_facility_ids
	gs_names = ls_names
	FOR i = 1 TO li_rc
		IF dw_search.GetItemNumber( i, "rec_id" ) = 0 THEN
			CONTINUE
		END IF
		li_cnt++
		gi_app_ids[ li_cnt ] = dw_search.GetItemNumber( i, "app_id" )
		gl_prac_ids[ li_cnt ] = dw_search.GetItemNumber( i, "prac_id" )
		gl_facility_ids[ li_cnt ] = dw_search.GetItemNumber( i, "parent_facility_id" )		
		IF Not IsNull( dw_search.GetItemString( i, "first_name" ) ) THEN
			ls_full_name = dw_search.GetItemString( i, "first_name" ) + " "
		END IF
		IF Not IsNull( dw_search.GetItemString( i, "middle_name" ) ) THEN
			ls_full_name = ls_full_name + dw_search.GetItemString( i, "middle_name" ) + " "
		END IF
		gs_names[ li_cnt ] = ls_full_name + dw_search.GetItemString( i, "last_name" )		
	END FOR
	Close( Parent ) //Start Code Change ----04.14.2008 #V8 maha -
ELSEIF is_open_for = "DELETE" THEN
	//Start Code Change ----04.14.2008 #V8 maha 
	//gl_prac_id = ll_prac_id
	//----Begin Modified by Alfee 12.11.2008 ----------------
	//of_delete_prac( ll_prac_id)
	//dw_search.deleterow(ai_row)
	IF of_delete_prac( ll_prac_id) >= 0 THEN dw_search.deleterow(ai_row)
	//----End Modified --------------------------------------
	//End Code Change---04.14.2008
ELSEIF is_open_for = "AUDIT" THEN
	gl_prac_id = ll_prac_id
	Close( Parent ) //Start Code Change ----04.14.2008 #V8 maha - 
ELSEIF is_open_for = "MEETINGS" OR is_open_for = "REPORTS" THEN
	gi_parent_facility = dw_search.GetItemNumber( ai_row, "parent_facility_id" )
	IF Not IsNull( dw_search.GetItemString( ai_row, "first_name" ) ) THEN
		ls_full_name = dw_search.GetItemString( ai_row, "first_name" ) + " "
	END IF
	IF Not IsNull( dw_search.GetItemString( ai_row, "middle_name" ) ) THEN
		ls_full_name = ls_full_name + dw_search.GetItemString( ai_row, "middle_name" ) + " "
	END IF
	ls_full_name = ls_full_name + dw_search.GetItemString( ai_row, "last_name" )
	CloseWithReturn( Parent, String( ll_prac_id ) + "-" + ls_full_name )
	Return -1
ELSEIF is_open_for = "ACTIONITEMS" THEN
	CloseWithReturn( Parent, String( ll_prac_id ))
	Return -1
END IF

//Close( Parent )  //Start Code Change ----04.14.2008 #V8 maha - removed so delete does not close window

RETURN 0


end function

public function integer of_close (integer ai_value);CloseWithReturn( Parent, ai_value )

Return 0
end function

public function integer of_set_open_for (string as_open_for);is_open_for = as_open_for
Integer li_facility
Boolean lb_from_dash = False
//debugbreak()
IF is_open_for = "AUDIT" THEN
	cb_new.Visible = False
	cb_new.Visible = False
	cb_iverify.Visible = False
ELSEIF Left(is_open_for, 7 ) = "REPORTS" THEN
	li_facility = Integer( Mid( is_open_for , 8, 10 ) )
	dw_org_facility_select.SetItem( 1, "facility_id", li_facility )	
	is_open_for = "REPORTS"
	dw_view.Visible = False
	gb_view.Visible = False
	dw_view.Object.data_view_id.Background.Color= String( RGB(192,192,192))
	cb_new.Visible = False
	cb_iverify.Visible = False	
	//dw_org_facility_select.Enabled = False
	//dw_org_facility_select.Object.facility_id.Background.Color= String( RGB(192,192,192))
ELSEIF Left( is_open_for, 10 ) = "INTELLIAPP" THEN
	li_facility = Integer( Mid( is_open_for , 11, 10 ) )
	//if open from the dash board then facility id will be 999.  Set facility to 0 =all
	IF li_facility = 999 THEN
		lb_from_dash = True
		li_facility = 0
		dw_org_facility_select.SetItem( 1, "facility_id", li_facility ) //maha moved here 020805 to allow user default facility
	END IF
	//dw_org_facility_select.SetItem( 1, "facility_id", li_facility )	
	is_open_for = "INTELLIAPP"
	//dw_search.DataObject = "d_extended_search_list_intelliapp" //removed maha 093005 set in of_search
	//dw_search.SetTransObject( SQLCA )
	dw_view.Visible = False
	gb_view.Visible = False
	dw_view.Object.data_view_id.Background.Color= String( RGB(192,192,192))	
	ddlb_search_type.Text = "Apps Needing Printed"
	cb_new.Visible = False
	cb_iverify.Visible = False
	IF lb_from_dash THEN
		cb_search.Event Clicked()
		of_select_all(  )
		cb_select.Event Clicked( )
		Return 1
	END IF
ELSEIF is_open_for = "DELETE" THEN
	is_open_for = "DELETE"
	cbx_status.Checked = False
	cbx_status.Enabled = False
	cb_new.Visible = False
	cb_iverify.Visible = False	
elseif is_open_for = "ACTIONITEMS" or is_open_for = 'MEETINGS' then	//12.12.2008 By Jervis
	cb_new.Visible = False
END IF

//is_original_sql = dw_search.Object.DataWindow.Table.Select

gl_prac_id = 0
gl_facility_id = 0
dw_search.SetFocus()

IF gb_se_version THEN
	of_se( )
END IF


Return 0
end function

public function integer of_set_parent (w_prac_data_1 aw_win);iw_prac_folder = aw_win

Return 0
end function

public function integer of_set_transaction (n_tr as_trans);SQLCA_1 = CREATE n_tr;

Integer i

//SELECT data_view.data_view_id
//Into: dd
//FROM data_view  
//WHERE data_view.data_view_id = 1
//using sqlca_1;
//
//IF SQLCA.SQLCODE = -1 THEN
//	messagebox("", sqlca_1.sqlerrtext)
//END IF

SQLCA_1 = as_trans

dw_view.of_SetTransObject( sqlca_1 )
dw_view.of_SetUpdateAble( False )
dw_view.InsertRow( 0 )

DatawindowChild dwchild
dw_view.GetChild( "data_view_id", dwchild )
dwchild.SetTransObject( sqlca_1 )
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-04
//$<modify> 01.24.2006 By: Cao YongWang
//$<reason> Write script to retrieve data from a cache instead of from the database.
//dwchild.Retrieve( gs_user_id )
If not isvalid(ids_views) Then of_init_dddw()
dwchild.reset()
ids_views.rowscopy(1,ids_views.rowcount(),Primary!,dwchild,1,primary!)
//---------------------------- APPEON END ----------------------------

if ii_user_view > 0 then //maha 052104
	dw_view.SetItem( 1, "data_view_id", ii_user_view )
else
	dw_view.SetItem( 1, "data_view_id", 1 )
end if
dw_view.SetRow( 1 )
dw_view.ScrollToRow( 1 )

dw_org_facility_select.SetTransObject( sqlca_1 )
dw_org_facility_select.InsertRow( 0 )

dw_org_facility_select.GetChild( "facility_id", dwchild )
dwchild.SetTransObject( SQLCA_1 )
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-05
//$<modify> 01.24.2006 By: Cao YongWang
//$<reason> Performance tuning
//$<reason> Write script to retrieve data from a cache instead of from the database.
//dwchild.Retrieve( gs_user_id )
dwchild.reset()
ids_facilitys.rowscopy(1,ids_facilitys.rowcount(),primary!, dwchild,1,primary!)
//---------------------------- APPEON END ----------------------------
dwchild.InsertRow(1)
dwchild.SetItem( 1, "facility_name", "All" )
dwchild.SetItem( 1, "facility_id", 0 )

dw_org_facility_select.SetItem( 1, "facility_id", 0 )

Integer li_facility_id
Integer li_find
String ls_facility_name

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-06
//$<modify> 01.24.2006 By: Cao YongWang
//$<reason> Performance tuning
//$<reason> Write script to retrieve data from a cache instead of from the database.
//SELECT security_users.default_search_facility  
//INTO :li_facility_id  
//FROM security_users  
//WHERE security_users.user_id = :gs_user_id;
li_facility_id = integer(gnv_data.of_getitem('security_users','default_search_facility',"upper(user_id)='"+upper(gs_user_id) + "'"))
//---------------------------- APPEON END ----------------------------


IF Not IsNull( li_facility_id ) THEN
	dw_org_facility_select.SetItem( 1, "facility_id", li_facility_id )
END IF

//dw_org_facility_select.GetChild( "facility_id", dwchild )
//
//li_find = dwchild.Find( "facility_id = " + String( li_facility_id ), 1, 100 )
//ls_facility_name = dwchild.GetItemString( li_find, "facility_name" )
//dw_org_facility_select.SetText( ls_facility_name ) 
//

// mskinner 15 Dec 2005 -- begin
// if there are less then 50 we retrieve the dw_search the problem is that there is no check box untill
// seach is clicked

IF UPPER(PARENT.CLASSNAME()) <> 'W_EXTENDED_SEARCH_NEW' THEN
	IF gi_auto_search = 1 THEN
		cb_search.TriggerEvent( Clicked! )
	END IF
END IF 

// mskinner 15 Dec 2005 -- end

	

Return 1
end function

public function integer of_open_from_dash ();cb_search.Event Clicked( )

Return 1

end function

public function integer of_select_all ();Integer i
Integer li_rc

li_rc = dw_search.RowCount()

FOR i = 1 TO li_rc
	IF is_select = "S" THEN
		dw_search.SetItem( i, "rec_id", 1 )
	ELSE
		dw_search.SetItem( i, "rec_id", 0 )
	END IF
END FOR
	
IF is_select = "S" THEN
	is_select = "U"
ELSE
	is_select = "S"
END IF

//IF is_open_for = "INTELLIAPP" THEN
//	MessageBox("Select", "You must check of the select box and then click the Select button to select practitioners.")
//	Return 0
//END IF

Return 0
end function

public function integer of_se ();gb_facility.Visible = False
dw_org_facility_select.Visible = False
dw_view.Visible = False
gb_view.Visible = False

gb_search.y =  26
ddlb_search_type.y = 90
cb_search.y = 90
sle_srch_val.y =  195
cbx_status.y =  290

//gb_search.y = gb_search.y - 1130
//cbx_status.y = cbx_status.y - 1125
//sle_srch_val.y = sle_srch_val.y - 1125
//cb_search.y = cb_search.y - 1125
//ddlb_search_type.y = ddlb_search_type.y - 1125


Return 1
end function

public function integer of_hide_ssn ();//function added maha app102405 called from search button and of_search()

integer i

i = of_get_app_setting("set_42","I")

if i = 1 then
	dw_search.modify("ssn.visible = false")
	dw_search.modify("date_of_birth.visible = false")
end if


return 1



end function

public function integer of_search_old (string letter);//created maha 112205 as a backup to original code not used in program

String ls_sql
String ls_depart_sql
Integer li_rc
Integer i
DataWindowChild dwchild
String ls_all_facilities

ls_depart_sql = ""

dw_search.SetRedraw( False )

IF is_open_for = "INTELLIAPP" THEN
	dw_search.DataObject = "d_extended_search_list_intelliapp"			
elseIF is_open_for = "REPORTS" THEN //maha 091605
	dw_search.DataObject = "d_extended_search_list_multi"	
ELSE
	dw_search.DataObject = "d_extended_search_list"	
END IF

letter = Upper(letter)

//Start Code Change ---- 01.13.2006 #196 maha
if of_search_trap( ddlb_search_type.Text, sle_srch_val.Text) = -1 then return -1
 
if of_get_app_setting("set_37","I") = 1 and li_num_of_departments_user_has_rights_to = 0 then
	messagebox("Department Security", "Your user_id has no rights to any departments.  You will not be able to view practitioner data.")
	return -1
end if
//End Code Change---01.13.2005
IF li_num_of_departments_user_has_rights_to <> li_num_of_departments THEN
	dw_department.GetChild( "department", dwchild )
	li_rc = dwchild.RowCount()
	ls_depart_sql = "("
	//start with 2 because 0 = all
	FOR i = 2 TO li_rc
		ls_depart_sql = ls_depart_sql + String( dwchild.GetItemNumber( i, "lookup_code" ) ) + ","
	END FOR
	ls_depart_sql = Mid( ls_depart_sql, 1, Len( ls_depart_sql ) -1 )
	ls_depart_sql = ls_depart_sql + ")"
END IF

sle_srch_val.Text = letter
//JAD 1/5/2001  need to keep apps needing printing where clause attached
IF ddlb_search_type.Text <> "Apps Needing Printed" OR is_open_for <> "INTELLIAPP" THEN
	ddlb_search_type.Text = "Last Name"
	dw_dept.visible = false
END IF

il_facility_id = dw_org_facility_select.GetItemNumber( 1, "facility_id" )


ls_sql =   "SELECT DISTINCT pd_basic.first_name, "+&   
         "pd_basic.middle_name,"+&      
         "pd_basic.title,"+&      
         "pd_basic.name_suffix,"+&      
         "pd_basic.prof_suffix,"+&      
         "pd_basic.ssn,"+&      
         "pd_basic.sex,"+&      
         "pd_basic.prac_category,"+&      
         "pd_basic.date_of_birth,"+&      
         "pd_basic.rec_id,"+&      
         "pd_basic.prac_id,"+&      
         "pd_affil_stat.parent_facility_id,"+&      
         "facility.facility_name,"+&      
         "facility.default_data_view_id,"+&      
         "pd_basic.last_name,"+&      
         "code_lookup.code "
    	IF is_open_for = "INTELLIAPP" THEN
//			IF ddlb_search_type.Text = "Apps Needing Printed" THEN //maha attempting to remove duplicates
          ls_sql = ls_sql + ",net_dev_action_items.action_type,"+&      
         "net_dev_action_items.app_id,"+&      	    
         "net_dev_action_items.action_status " +&
	   	"FROM {oj pd_basic  LEFT OUTER JOIN code_lookup  ON pd_basic.name_suffix = code_lookup.lookup_code}, "+&
	   	"{oj pd_affil_stat  LEFT OUTER JOIN net_dev_action_items  ON pd_affil_stat.parent_facility_id =  "+&
	  		"net_dev_action_items.facility_id AND pd_affil_stat.prac_id = net_dev_action_items.prac_id}, "+&      
     	   "facility "+&     
	  		"WHERE ( pd_basic.prac_id = pd_affil_stat.prac_id ) and "+&     
     	   "( pd_affil_stat.parent_facility_id = facility.facility_id ) "
//			else
//	   	ls_sql = ls_sql + "FROM {oj pd_basic  LEFT OUTER JOIN code_lookup  ON pd_basic.name_suffix = code_lookup.lookup_code}, "+&
//	   	"{oj pd_affil_stat  LEFT OUTER JOIN net_dev_action_items  ON pd_affil_stat.parent_facility_id =  "+&
//	  		"net_dev_action_items.facility_id AND pd_affil_stat.prac_id = net_dev_action_items.prac_id}, "+&      
//     	   "facility "+&     
//	  		"WHERE ( pd_basic.prac_id = pd_affil_stat.prac_id ) and "+&     
//     	   "( pd_affil_stat.parent_facility_id = facility.facility_id ) "
//			end if
	ELSE
		ls_sql = ls_sql + ",pd_affil_stat.date_app_audit_completed," +&   
      "pd_affil_stat.date_data_entry_completed," +&
	   "pd_affil_stat.date_verif_completed," +&  
     	"pd_affil_stat.apptmnt_start_date, " +&  
     	"pd_affil_stat.active_status "
	
		if is_open_for = "REPORTS" then
			ls_sql = ls_sql + ", selected = 0,  v_full_name.full_name "
		end if
		  		
     	ls_sql = ls_sql +  "FROM {oj pd_basic  LEFT OUTER JOIN code_lookup  ON pd_basic.name_suffix = code_lookup.lookup_code}, "+&
     	"facility, "+&   
		"pd_affil_stat "
		
		//if one department is selected or if all departments are selected and the number of departments the users
		//has rights to is less then the number of departments in lookup table then do this
		//if the number of departments in lookup are the same as the number of departments the user has rights to
		//then the department security is turned off or they have rights to all departments so do nothing
		if il_dept > 0 OR ( il_dept = 0 AND li_num_of_departments <> li_num_of_departments_user_has_rights_to ) then //maha 121002
			ls_sql = ls_sql + ", pd_affil_dept "
		end if
		
     	ls_sql = ls_sql +  "WHERE ( pd_basic.prac_id = pd_affil_stat.prac_id ) and "+&     
     		 "( pd_affil_stat.parent_facility_id = facility.facility_id ) "
		
		//if only 1 department is selected then do a regular where clause
		if il_dept > 0 then //maha 121002
			ls_sql = ls_sql + "and ( pd_affil_stat.rec_id = pd_affil_dept.rec_id ) and "+& 
			"( pd_affil_dept.primary_dept = 1 ) "
			ls_sql = ls_sql + " AND (pd_affil_dept.department = " + string(il_dept) + ")"
		//if ALL is selected and number of departments in lookup is not = to number of depart user has
		//rights to then department security is turned on so do this.
		elseif il_dept = 0 AND li_num_of_departments <> li_num_of_departments_user_has_rights_to THEN
				ls_sql = ls_sql + " and ( pd_affil_stat.rec_id = pd_affil_dept.rec_id ) and "+& 
			"( pd_affil_dept.primary_dept = 1 ) "
			//if il_dept > 0 then 
				ls_sql = ls_sql + " AND (pd_affil_dept.department in " + ls_depart_sql + ")"			
		end if
	END IF	    

//JAD 1/5/2001  when in intelliapp printing just want to show apps that need printing
IF is_open_for = "INTELLIAPP" THEN
	long anp 
	long ll_i
	long ll_c
	select lookup_code into :anp from code_lookup where code = 'App Out To MD';		
	select lookup_code into :ll_i from code_lookup where lookup_name = 'Action Status' and code = 'Incomplete';	
	select lookup_code into :ll_c from code_lookup where lookup_name = 'Action Status' and code = 'Complete';
	IF ddlb_search_type.Text = "Apps Needing Printed" THEN
		//\/maha 032002 replacing hard coded numbers
		ls_sql = ls_sql + "AND action_type = " + string(anp) + " AND action_status = " + string(ll_i)
		//ls_sql = ls_sql + "AND action_type = -3 AND action_status = -110"  //org
	else
		//ls_sql = ls_sql + " AND action_status not in(" + string(ll_i) + "," +string(ll_c) + ")"
	end if
end if



IF il_facility_id <> 0 THEN
	ls_sql = ls_sql + " AND pd_affil_stat.parent_facility_id = " + String( il_facility_id )
ELSE
	dw_org_facility_select.GetChild( "facility_id", dwchild )
	FOR i = 1 TO dwchild.RowCount()
		ls_all_facilities = ls_all_facilities + String( dwchild.GetItemNumber( i, "facility_id" ) ) + ","
	END FOR
	ls_all_facilities = Mid( ls_all_facilities , 1 , Len( ls_all_facilities ) -1 )
	ls_sql = ls_sql + " AND pd_affil_stat.parent_facility_id in (" + ls_all_facilities + ")"	
END IF

IF is_open_for <> "DELETE" THEN
	IF cbx_status.Checked = True THEN
		ls_sql = ls_sql + " AND (pd_affil_stat.active_status = 1 OR pd_affil_stat.active_status = 3 OR pd_affil_stat.active_status = 4)"  
	ELSE
		ls_sql = ls_sql + " AND (pd_affil_stat.active_status = 1 OR pd_affil_stat.active_status = 4 or pd_affil_stat.active_status = 5)"
	END IF
END IF

IF is_open_for = "DELETE" THEN
	ls_sql = ls_sql + " AND pd_affil_stat.active_status = 2 " 
END IF

ls_sql = ls_sql + " AND {fn left(pd_basic.last_name,1 )} = '" + letter + "'"

ls_sql = ls_sql + " ORDER BY pd_basic.last_name ASC"   



//clipboard(ls_sql)

dw_search.SetSQLSelect ( ls_sql )
dw_search.SetTransObject( SQLCA_1 )
li_rc = dw_search.Retrieve( )

FOR i = 1 TO li_rc
	dw_search.SetItem( i, "rec_id", 0 )
END FOR


dw_search.SetRedraw( True )
IF dw_search.RowCount() > 0 THEN
	dw_search.SelectRow( 0, False )
	dw_search.SelectRow( 1, True )
END IF

of_hide_ssn() //maha app102405


Return 0
end function

public function integer of_search (string as_letter);//Start Code Change ---- 11.22.2005 #105 maha
//modified maha 112205 so search code could be combined.  Original of_search is in of_search_old.

string ls_letter

ls_letter = upper(as_letter)

sle_srch_val.text = ls_letter

IF ddlb_search_type.Text <> "Apps Needing Printed" OR is_open_for <> "INTELLIAPP" THEN
	ddlb_search_type.Text = "Last Name"
	dw_dept.visible = false
END IF

of_search_new(ls_letter)
	
return 0
//End Code Change---11.22.2005 
end function

public function integer of_search_new (string as_letter);
//Start Code Change ---- 11.22.2005 #106 maha
//maha created 112205 to combine two separate search codes into 1
// the argument is not being used 112205
String ls_fld
String ls_sql
String ls_ssn
String ls_name
String ls_depart_sql
string ls_prac_list
string ls_search_type  //maha 100208
Integer li_name_len
Integer li_Rc
Integer li_val_len
Integer i
String ls_all_facilities
Long ll_action_type
Long ll_action_status
DataWindowChild dwchild

//Start Code Change ---- 01.13.2006 #196 maha
if of_search_trap( ddlb_search_type.Text, sle_srch_val.Text) = -1 then return -1
 
if of_get_app_setting("set_37","I") = 1 and li_num_of_departments_user_has_rights_to = 0 then
	messagebox("Department Security", "Your user_id has no rights to any departments.  You will not be able to view practitioner data.")
	return -1
end if
//End Code Change---01.13.2005
IF li_num_of_departments_user_has_rights_to <> li_num_of_departments THEN
	dw_department.GetChild( "department", dwchild )
	li_rc = dwchild.RowCount()
	ls_depart_sql = "("
	//start with 2 because 0 = all
	FOR i = 2 TO li_rc
		ls_depart_sql = ls_depart_sql + String( dwchild.GetItemNumber( i, "lookup_code" ) ) + ","
	END FOR
	ls_depart_sql = Mid( ls_depart_sql, 1, Len( ls_depart_sql ) -1 )
	ls_depart_sql = ls_depart_sql + ")"
END IF
//messagebox("",is_open_for)
IF is_open_for = "INTELLIAPP" THEN
	dw_search.DataObject = "d_extended_search_list_intelliapp"
elseif is_open_for = "REPORTS" THEN
	dw_search.DataObject = "d_extended_search_list_multi"
ELSE
	dw_search.DataObject = "d_extended_search_list"	
	
END IF

//Start Code Change ----10.02.2008 #V85 maha - added batch search; added variable; changed to case 
ls_search_type = ddlb_search_type.Text 

if as_letter = "BAT1" then ls_search_type = "BAT1"
if as_letter = "BAT2" then ls_search_type = "BAT2"

Choose case ls_search_type
	case "I.D."
		ls_fld = "prac_id"
	case  "Last Name" 
		ls_fld = "last_name"
	case "SS #" 
		ls_fld = "ssn"
	case "Provider ID" 
		ls_fld = "provider_id"
	case "Apps Needing Printed" 
		ls_fld = "Apps Needing Printed"	
	case "Primary Department" 
		ls_fld = "Primary Department"
	case "Custom Search"
		ls_fld = "Custom Search"
		open(w_search_query)
		ls_prac_list = message.stringparm
		if ls_prac_list = "Cancel" then return -1
	case "Address - Street 1" 
		ls_fld = "street"
	case "Address - Street 2" 
		ls_fld = "street_2"
	case "NPI #" 
		ls_fld = "npi_number"
	case "BAT1"
		ls_fld = "BAT1"
		ls_prac_list = of_get_batch( 1)
		if ls_prac_list = "Cancel" then return -1
	case "BAT2"
		ls_fld = "BAT2"
		ls_prac_list = of_get_batch( 2)
		if ls_prac_list = "Cancel" then return -1
END Choose
		
//IF ddlb_search_type.Text = "I.D." THEN
//	ls_fld = "prac_id"
//ELSEIF ddlb_search_type.Text = "Last Name" THEN
//	ls_fld = "last_name"
//ELSEIF ddlb_search_type.Text = "SS #" THEN
//	ls_fld = "ssn"
//ELSEIF ddlb_search_type.Text = "Provider ID" THEN //maha 081202
//	ls_fld = "provider_id"
//ELSEIF ddlb_search_type.Text = "Apps Needing Printed" THEN
//	ls_fld = "Apps Needing Printed"	
//ELSEIF ddlb_search_type.Text = "Primary Department" THEN
//	ls_fld = "Primary Department"
//ELSEIF ddlb_search_type.Text = "Custom Search" THEN //maha 1000604
//	ls_fld = "Custom Search"
//	//debugbreak()
//	open(w_search_query)
//	ls_prac_list = message.stringparm
//	if ls_prac_list = "Cancel" then return -1
//	//ls_prac_list = "1,2,3,4,5"
////--------------------------- APPEON BEGIN ---------------------------
////$<add> 10.11.2006 By: Jack (Inova)
////$<reason> Add ability to search on practitioner search screen by Street 1 or Street 2 values.
//ELSEIF ddlb_search_type.Text = "Address - Street 1" THEN 
//	ls_fld = "street"
//ELSEIF ddlb_search_type.Text = "Address - Street 2" THEN 
//	ls_fld = "street_2"
////---------------------------- APPEON END ----------------------------
//
////Start Code Change ----04.14.2008 #V8 maha
//ELSEIF ddlb_search_type.Text = "NPI #" THEN
//	ls_fld = "npi_number"
//END IF
//End Code Change---04.14.2008
//debugbreak()

//End Code Change---10.02.2008
li_val_len = Len(sle_srch_val.Text)


il_facility_id = dw_org_facility_select.GetItemNumber( 1, "facility_id" )

//Note: if adding additional fields to the data object, the new field(s) must be added to the following ls_sql set
//Also each of the dw objects must have the new fields added in the same order in the select statement before the adds below
//Start Code Change ---- 10.31.2007 #V7 maha	 added provider_id
ls_sql =   "SELECT DISTINCT pd_basic.first_name, "+&   
         "pd_basic.middle_name,"+&      
         "pd_basic.title,"+&      
         "pd_basic.name_suffix,"+&      
         "pd_basic.prof_suffix,"+&      
         "pd_basic.ssn,"+&      
         "pd_basic.sex,"+&      
         "pd_basic.prac_category,"+&      
         "pd_basic.date_of_birth,"+&      
         "pd_basic.rec_id,"+&      
         "pd_basic.prac_id,"+& 
         "pd_affil_stat.parent_facility_id,"+&      
         "facility.facility_name,"+&      
         "facility.default_data_view_id,"+&      
         "pd_basic.last_name,"+&      
         "code_lookup.code, "+&
	"pd_basic.provider_id" 
	  IF is_open_for = "INTELLIAPP" THEN
   // 	IF ls_fld = "Apps Needing Printed" THEN	    
          ls_sql = ls_sql + ",net_dev_action_items.action_type,"+&      
         "net_dev_action_items.app_id,"+&      	    
         "net_dev_action_items.action_status " +&
	   "FROM {oj pd_basic  LEFT OUTER JOIN code_lookup  ON pd_basic.name_suffix = code_lookup.lookup_code}, "+&
	    "{oj pd_affil_stat  LEFT OUTER JOIN net_dev_action_items  ON pd_affil_stat.parent_facility_id =  "+&
	    "net_dev_action_items.facility_id AND pd_affil_stat.prac_id = net_dev_action_items.prac_id}, "+&      
     	    "facility "
				
		//if one department is selected or if all departments are selected and the number of departments the users
		//has rights to is less then the number of departments in lookup table then do this
		//if the number of departments in lookup are the same as the number of departments the user has rights to
		//then the department security is turned off or they have rights to all departments so do nothing
		if il_dept > 0 OR ( il_dept = 0 AND li_num_of_departments <> li_num_of_departments_user_has_rights_to ) then //maha 121002
			ls_sql = ls_sql + ", pd_affil_dept "
		end if
		
     	ls_sql = ls_sql +  "WHERE ( pd_basic.prac_id = pd_affil_stat.prac_id ) and "+&     
     		 "( pd_affil_stat.parent_facility_id = facility.facility_id ) "
		
		//if only 1 department is selected then do a regular where clause
		if il_dept > 0 then //maha 121002
			ls_sql = ls_sql + "and ( pd_affil_stat.rec_id = pd_affil_dept.rec_id ) and "+& 
			"( pd_affil_dept.primary_dept = 1 ) "
			ls_sql = ls_sql + " AND (pd_affil_dept.department = " + string(il_dept) + ")"
		//if ALL is selected and number of departments in lookup is not = to number of depart user has
		//rights to then department security is turned on so do this.
		elseif il_dept = 0 AND li_num_of_departments <> li_num_of_departments_user_has_rights_to THEN
				ls_sql = ls_sql + " and ( pd_affil_stat.rec_id = pd_affil_dept.rec_id ) and "+& 
			"( pd_affil_dept.primary_dept = 1 ) "
			//if il_dept > 0 then 
				ls_sql = ls_sql + " AND (pd_affil_dept.department in " + ls_depart_sql + ")"			
		end if
	ELSE
		ls_sql = ls_sql + ",pd_affil_stat.date_app_audit_completed," +&   
      "pd_affil_stat.date_data_entry_completed," +&
	   "pd_affil_stat.date_verif_completed," +&  
     	"pd_affil_stat.apptmnt_start_date, " +& 
		"pd_affil_stat.active_status " 
		if dw_search.DataObject = "d_extended_search_list_multi" then //maha added 091605 not used
			ls_sql += " , 0 as selected, v_full_name.full_name "
		end if
		
		//--------------------------- APPEON BEGIN ---------------------------
		//$<modify> 10.11.2006 By: Jack (Inova)
		//$<reason> Add ability to search on practitioner search screen by Street 1 or Street 2 values.
		/*
	   ls_sql = ls_sql +  "FROM {oj pd_basic  LEFT OUTER JOIN code_lookup  ON pd_basic.name_suffix = code_lookup.lookup_code}, "+&
     	"facility, "+&   
		"pd_affil_stat "
		*/
		
		if ddlb_search_type.Text = "Address - Street 1" or ddlb_search_type.Text = "Address - Street 2" then
     		ls_sql = ls_sql +  "FROM pd_basic  LEFT OUTER JOIN code_lookup  ON pd_basic.name_suffix = code_lookup.lookup_code "+&
										  " LEFT OUTER JOIN pd_address ON pd_basic.prac_id = pd_address.prac_id, "+&
										   "facility, "+&   
										   "pd_affil_stat "
		else
			ls_sql = ls_sql +  "FROM {oj pd_basic  LEFT OUTER JOIN code_lookup  ON pd_basic.name_suffix = code_lookup.lookup_code}, "+&
			"facility, "+&   
			"pd_affil_stat "			
		end if
		//---------------------------- APPEON END ----------------------------
				
		if dw_search.DataObject = "d_extended_search_list_multi" then
			ls_sql += ", v_full_name "
		end if
		
		
		//if one department is selected or if all departments are selected and the number of departments the users
		//has rights to is less then the number of departments in lookup table then do this
		//if the number of departments in lookup are the same as the number of departments the user has rights to
		//then the department security is turned off or they have rights to all departments so do nothing
		if il_dept > 0 OR ( il_dept = 0 AND li_num_of_departments <> li_num_of_departments_user_has_rights_to ) then //maha 121002
			ls_sql = ls_sql + ", pd_affil_dept "
		end if
		
     	ls_sql = ls_sql +  "WHERE ( pd_basic.prac_id = pd_affil_stat.prac_id ) and "+&     
     		 "( pd_affil_stat.parent_facility_id = facility.facility_id ) "
		
		//if only 1 department is selected then do a regular where clause
		if il_dept > 0 then //maha 121002
			ls_sql = ls_sql + "and ( pd_affil_stat.rec_id = pd_affil_dept.rec_id ) and "+& 
			"( pd_affil_dept.primary_dept = 1 ) "
			ls_sql = ls_sql + " AND (pd_affil_dept.department = " + string(il_dept) + ")"
		//if ALL is selected and number of departments in lookup is not = to number of depart user has
		//rights to then department security is turned on so do this.
		elseif il_dept = 0 AND li_num_of_departments <> li_num_of_departments_user_has_rights_to THEN
				ls_sql = ls_sql + " and ( pd_affil_stat.rec_id = pd_affil_dept.rec_id ) and "+& 
			"( pd_affil_dept.primary_dept = 1 ) "
			//if il_dept > 0 then 
				ls_sql = ls_sql + " AND (pd_affil_dept.department in " + ls_depart_sql + ")"			
		end if
		if dw_search.DataObject = "d_extended_search_list_multi" then
			ls_sql += " and ( v_full_name.prac_id = pd_basic.prac_id ) "
		end if
	END IF	    
 //  "FROM {oj pd_basic  LEFT OUTER JOIN code_lookup  ON pd_basic.name_suffix = code_lookup.lookup_code}, "+&   	    
IF il_facility_id <> 0 THEN
	ls_sql = ls_sql + " AND pd_affil_stat.parent_facility_id = " + String( il_facility_id )
ELSE
	dw_org_facility_select.GetChild( "facility_id", dwchild )
	FOR i = 1 TO dwchild.RowCount()
		ls_all_facilities = ls_all_facilities + String( dwchild.GetItemNumber( i, "facility_id" ) ) + ","
	END FOR
	ls_all_facilities = Mid( ls_all_facilities , 1 , Len( ls_all_facilities ) -1 ) //gets rid of the extra comma
	ls_sql = ls_sql + " AND pd_affil_stat.parent_facility_id in (" + ls_all_facilities + ")"
END IF

//Start Code Change ---- 12.13.2005 #169 maha  correction for deletes
IF is_open_for = "DELETE" THEN
	ls_sql = ls_sql + " AND pd_affil_stat.active_status = 2 " 
else
	IF cbx_status.Checked = True THEN
		ls_sql = ls_sql + " AND (pd_affil_stat.active_status = 1 OR pd_affil_stat.active_status = 5 OR pd_affil_stat.active_status = 3 OR pd_affil_stat.active_status = 4 )" 
	ELSE
		ls_sql = ls_sql + " AND (pd_affil_stat.active_status = 1 OR pd_affil_stat.active_status = 4 or pd_affil_stat.active_status = 5)" 	
	END IF
END IF
//End Code Change---12.13.2005 
//messagebox("",ls_sql)
IF ls_fld = "Custom Search" THEN //maha 100604
		ls_sql = ls_sql + " AND pd_basic.prac_id in (" + ls_prac_list + ")"
ELSEIF ls_fld = "BAT1"  or ls_fld = "BAT2" THEN //Start Code Change ----10.02.2008 #V85 maha
		ls_sql = ls_sql + " AND pd_basic.prac_id in (" + ls_prac_list + ")"
ELSEIF Len(sle_srch_val.Text) > 0 OR ls_fld = "Apps Needing Printed" THEN
	IF ls_fld = "prac_id" THEN
		ls_sql = ls_sql + " AND pd_basic.prac_id = " + sle_srch_val.Text
	ELSEIF ls_fld = "last_name" THEN
		ls_name = sle_srch_val.Text
		li_name_len = Len( ls_name )
		FOR i = 1 TO li_name_len
			IF Mid(ls_name, i,1 )  = "'" THEN
				ls_name = Mid(ls_name, 1, i ) + "'" + Mid(ls_name, i+1 , 100 )
				i++
		END IF	
		END FOR
		ls_sql = ls_sql + " AND {fn left(pd_basic.last_name," + String( li_name_len ) + ")}  = '" + Upper(ls_name) + "'"
	ELSEIF ls_fld = "ssn" THEN
		ls_ssn = sle_srch_val.Text
		IF Pos( ls_ssn, "-" ) > 0 THEN
		 	ls_ssn = Mid( sle_srch_val.Text, 1, 3 ) + Mid( sle_srch_val.Text, 5, 2 ) + Mid( sle_srch_val.Text, 8, 4 )
		END IF
		ls_sql = ls_sql + " AND ssn = '" + ls_ssn + "'"
	ELSEIF ls_fld = "npi_number" THEN
		ls_ssn = sle_srch_val.Text
		IF Pos( ls_ssn, "-" ) > 0 THEN
		 	ls_ssn = Mid( sle_srch_val.Text, 1, 3 ) + Mid( sle_srch_val.Text, 5, 2 ) + Mid( sle_srch_val.Text, 8, 4 )
		END IF
		ls_sql = ls_sql + " AND npi_number = '" + ls_ssn + "'"
	elseIF ls_fld = "provider_id" THEN //maha 081202
		ls_sql = ls_sql + " AND pd_basic.provider_id = '" + sle_srch_val.Text + "'"
	//--------------------------- APPEON BEGIN ---------------------------
	//$<add> 10.11.2006 By: Jack (Inova)
	//$<reason> Add ability to search on practitioner search screen by Street 1 or Street 2 values.
	ELSEIF ls_fld = "street" THEN
		ls_sql = ls_sql + " AND pd_address.street like '" + sle_srch_val.Text + "%'"
	ELSEIF ls_fld = "street_2" THEN
		ls_sql = ls_sql + " AND pd_address.street_2 like '" + sle_srch_val.Text + "%'"
	//---------------------------- APPEON END ----------------------------		
	end if
	IF ls_fld = "Apps Needing Printed" THEN
		//\/maha 032102
		select lookup_code into :ll_action_type from code_lookup where lookup_name = 'Action Type' and code = 'App Out To MD';		
		IF SQLCA.SQLCODE = 100 THEN
				MessageBox("Error", "You need to add 'App Out To MD' to the Action Type lookup table." )
				Return -1
		end if
		select lookup_code into :ll_action_status from code_lookup where lookup_name = 'Action Status' and code = 'Incomplete';
		IF SQLCA.SQLCODE = 100 THEN
				MessageBox("Error", "You will need to add 'Incomplete' to the Action Status lookup table." )
				Return -1
		END IF
		//\maha
		ls_sql = ls_sql + "AND action_type = " + String( ll_action_type ) + " AND action_status = " + string(ll_action_status)  //-3 AND action_status = -110"
		
	END IF	
END IF

ls_sql = ls_sql + " ORDER BY pd_basic.last_name ASC"   
//openwithparm (w_sql_msg, ls_sql)
//CLIPBOARD( LS_SQL )
//messagebox("", dw_search.DataObject )
dw_search.SetTransObject( SQLCA_1 )

dw_search.SetSQLSelect ( ls_sql )
li_rc = dw_search.Retrieve( )

IF is_open_for = "INTELLIAPP" THEN	//2007.07.27 By Jervis Fix Web performance Bug
	FOR i = 1 TO li_rc
		dw_search.SetItem( i, "rec_id", 0 )
	END FOR
end if

of_hide_ssn()


sle_srch_val.SetFocus()			//Modified By Scofield on 2008-03-07

return 0


end function

public function integer of_search_trap (string as_type, string as_val);//Start Code Change ---- 01.12.2006 #194 maha
//function created 011306 to trap for search value called from of_search_new()

choose case as_type
	case "I.D.", "SS #"
		if not isnumber(as_val) then
			Messagebox( "Search error","The search value must be a number for the search type " + as_type)
			return -1
		end if
	case else
		return 1
end choose
		
return 1
//End Code Change---01.12.2005 
end function

public subroutine of_init_dddw ();//////////////////////////////////////////////////////////////////////
// $<function>pfc_cst_u_extended_searchof_init_dddw()
// $<arguments>
//		value	integer		
// $<returns> integer
// $<description>
// $<description>
//////////////////////////////////////////////////////////////////////
// $<add> 02.08.2006 by Cao YongWang
//////////////////////////////////////////////////////////////////////
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-07
//$<reason> Performance tuning
//$<reason> Retrieve data for ids_views and ids_facilitys from the database. (Pre-select data approach)
ids_views = create n_ds
ids_facilitys = create n_ds
ids_views.dataobject = 'd_dddw_select_view_with_user_param_bak'  //Start Code Change ---- 08.9.2007 #V7 maha changed from d_dddw_select_view_with_user_param because it didn't work properly
ids_facilitys.dataobject = 'd_dddw_facility_w_picture'

ids_views.of_settransobject(SQLCA)
ids_facilitys.of_settransobject(SQLCA)

gnv_appeondb.of_startqueue()
//--------------------------- APPEON BEGIN ---------------------------
//$<add> 07.20.2006 By: Liang QingShi
//$<reason> Contract Modify.
ids_views.retrieve(gs_user_id,'P')

//---------------------------- APPEON END ----------------------------
ids_facilitys.retrieve(gs_user_id)
gnv_appeondb.of_commitqueue()
//---------------------------- APPEON END ----------------------------

end subroutine

public function integer of_delete_prac (long al_prac);//Start Code Change ----04.14.2008 #V8 maha
//new function copied from w_mdi so that multiple pracs can be deleted without closing the search screen.
Long ll_prac_id
Integer li_ans
//gs_search lstr_search
n_ds lds_tables
integer t
integer tc
string ls_tname
string ls_sql


ll_prac_id = al_prac

li_ans = MessageBox("DELETE", "This will delete all of the data associated with the practitioner.  Continue?", Information!, YesNo!, 2 )

IF li_ans = 1 THEN
	li_ans = MessageBox("DELETE", "Are you sure?", Information!, YesNo!, 2 )
	IF li_ans = 2 THEN
		RETURN -1
	END IF
ELSE
	RETURN -1
END IF

COMMIT USING SQLCA;

// code rewritten maha 061804 (4.187)to catch all pd tables including customs.
lds_tables = create n_ds
lds_tables.dataobject = "d_pd_tables_for_prac_delete"
lds_tables.settransobject(sqlca)

//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 2005-11-11 By: owen chen
//$<reason> add database option for sql excution

string ls_sqlsyntax
//ls_sqlsyntax =   " SELECT systable.table_id, "+&  
//						"systable.table_name "+& 
//						"FROM systable "+& 
//						"WHERE systable.table_name like 'pd%'"  

choose case gs_dbtype
	case 'ASA'
		ls_sqlsyntax =   " SELECT systable.table_id, "+&  
         					"systable.table_name "+& 
    							"FROM systable "+& 
   							"WHERE systable.table_name like 'pd%'"  
	case 'SQL'
		ls_sqlsyntax =  " SELECT v_systable.table_id, "+&  
        						"v_systable.table_name "+& 
    							"FROM v_systable "+& 
   							"WHERE v_systable.table_name like 'pd%' "    
end choose
lds_tables.setSqlSelect(ls_sqlsyntax)

//---------------------------- APPEON END ----------------------------





tc = lds_tables.retrieve()

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-03
//$<add> 03.21.2006 By: LeiWei
//$<reason> Performance tuning
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.
 
gnv_appeondb.of_startqueue( )
//---------------------------- APPEON END ----------------------------

for t = 1 to tc
	ls_tname = lds_tables.getitemstring(t,"table_name")
	choose case ls_tname
		case "pd_basic", "pd_affil_stat"
			continue
		case else
			ls_sql = "DELETE FROM " + ls_tname + " where prac_id = " + string(ll_prac_id) + ";"
			execute immediate :ls_sql using sqlca;
			commit using sqlca;
	end choose
next
	
delete from pd_affil_stat
where prac_id = :ll_prac_id;
IF SQLCA.SQLCODE = -1 THEN
	MessageBox("Delete", SQLCA.SQLERRTEXT )
	RETURN -1
END IF

delete from verif_info
where prac_id = :ll_prac_id;
IF SQLCA.SQLCODE = -1 THEN
	MessageBox("Delete", SQLCA.SQLERRTEXT )
	RETURN -1
END IF

delete from net_dev_ids
where prac_id = :ll_prac_id;
IF SQLCA.SQLCODE = -1 THEN
	MessageBox("Delete", SQLCA.SQLERRTEXT )
	RETURN -1
END IF

delete from net_dev_action_items
where prac_id = :ll_prac_id;
IF SQLCA.SQLCODE = -1 THEN
	MessageBox("Delete", SQLCA.SQLERRTEXT )
	RETURN -1
END IF

//--------------------------- APPEON BEGIN ---------------------------
//$<Modify> 2008-07-10 By: Scofield
//$<Reason> Delete pd_photo's picture.

delete from pd_photo
where prac_id = :ll_prac_id;
IF SQLCA.SQLCODE = -1 THEN
	MessageBox("Delete", SQLCA.SQLERRTEXT )
	RETURN -1
END IF
//---------------------------- APPEON END ----------------------------

delete from pd_basic
where prac_id = :ll_prac_id;
IF SQLCA.SQLCODE = -1 THEN
	MessageBox("Delete", SQLCA.SQLERRTEXT )
	RETURN -1
END IF

COMMIT USING SQLCA;

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-04
//$<add> 03.21.2006 By: LeiWei
//$<reason> Performance tuning
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.
 
gnv_appeondb.of_commitqueue( )
//---------------------------- APPEON END ----------------------------

MessageBox("DELETE", "The record has been deleted.", Information! )

RETURN 0
end function

public function string of_get_batch (integer ai_batch);long li_batch
integer res
long i
long ic
long ll_prac
string ls_pracs
n_ds lds_batch


//get the user's batch for the button
if ai_batch = 1 then
	select set_1 into :li_batch from security_users where user_id = :gs_user_id;
elseif ai_batch = 2 then
	select set_2 into :li_batch from security_users where user_id = :gs_user_id;
end if

if isnull(li_batch ) or li_batch < 1 then
	res = messagebox("Batch search Providers","This button can be set to search a selected IntelliBatch.~rWould you like to select a batch that will be linked to this button for you.",question!,yesno!,1)
	if res = 2 then
		return "Cancel"
	end if 
end if
		
openwithparm(w_prac_batch_search,li_batch)

if message.stringparm = "C" then
	return "Cancel"
else
	li_batch = message.doubleparm
end if


lds_batch = CREATE n_ds
lds_batch.DataObject = "d_batch_items_list"
lds_batch.of_SetTransObject( SQLCA )
ic = lds_batch.retrieve(li_batch) 
debugbreak()
for i = 1 to ic
	ls_pracs += string(lds_batch.getitemnumber(i,"prac_id")) + ", "
next

ls_pracs = mid(ls_pracs,1,len(ls_pracs  ) - 2 ) 
//messagebox("",ls_pracs)
destroy lds_batch

if ai_batch = 1 then
	update security_users set set_1= :li_batch  where user_id = :gs_user_id;
elseif ai_batch = 2 then
	update security_users set set_2 = :li_batch  where user_id = :gs_user_id;
end if

return ls_pracs



end function

on pfc_cst_u_extended_search.create
this.cb_27=create cb_27
this.cb_26=create cb_26
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_4=create cb_4
this.cb_5=create cb_5
this.cb_6=create cb_6
this.cb_7=create cb_7
this.cb_8=create cb_8
this.cb_9=create cb_9
this.cb_10=create cb_10
this.cb_11=create cb_11
this.cb_12=create cb_12
this.cb_13=create cb_13
this.cb_14=create cb_14
this.cb_15=create cb_15
this.cb_16=create cb_16
this.cb_17=create cb_17
this.cb_18=create cb_18
this.cb_19=create cb_19
this.cb_20=create cb_20
this.cb_21=create cb_21
this.cb_22=create cb_22
this.cb_23=create cb_23
this.cb_24=create cb_24
this.cb_25=create cb_25
this.cb_28=create cb_28
this.dw_department=create dw_department
this.cb_iverify=create cb_iverify
this.ddlb_search_type=create ddlb_search_type
this.cbx_status=create cbx_status
this.dw_view=create dw_view
this.cb_select=create cb_select
this.cb_search=create cb_search
this.sle_srch_val=create sle_srch_val
this.gb_2=create gb_2
this.gb_department=create gb_department
this.gb_search=create gb_search
this.gb_view=create gb_view
this.dw_search=create dw_search
this.cb_close=create cb_close
this.cb_new=create cb_new
this.dw_dept=create dw_dept
this.dw_org_facility_select=create dw_org_facility_select
this.gb_facility=create gb_facility
this.Control[]={this.cb_27,&
this.cb_26,&
this.cb_1,&
this.cb_2,&
this.cb_3,&
this.cb_4,&
this.cb_5,&
this.cb_6,&
this.cb_7,&
this.cb_8,&
this.cb_9,&
this.cb_10,&
this.cb_11,&
this.cb_12,&
this.cb_13,&
this.cb_14,&
this.cb_15,&
this.cb_16,&
this.cb_17,&
this.cb_18,&
this.cb_19,&
this.cb_20,&
this.cb_21,&
this.cb_22,&
this.cb_23,&
this.cb_24,&
this.cb_25,&
this.cb_28,&
this.dw_department,&
this.cb_iverify,&
this.ddlb_search_type,&
this.cbx_status,&
this.dw_view,&
this.cb_select,&
this.cb_search,&
this.sle_srch_val,&
this.gb_2,&
this.gb_department,&
this.gb_search,&
this.gb_view,&
this.dw_search,&
this.cb_close,&
this.cb_new,&
this.dw_dept,&
this.dw_org_facility_select,&
this.gb_facility}
end on

on pfc_cst_u_extended_search.destroy
destroy(this.cb_27)
destroy(this.cb_26)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_4)
destroy(this.cb_5)
destroy(this.cb_6)
destroy(this.cb_7)
destroy(this.cb_8)
destroy(this.cb_9)
destroy(this.cb_10)
destroy(this.cb_11)
destroy(this.cb_12)
destroy(this.cb_13)
destroy(this.cb_14)
destroy(this.cb_15)
destroy(this.cb_16)
destroy(this.cb_17)
destroy(this.cb_18)
destroy(this.cb_19)
destroy(this.cb_20)
destroy(this.cb_21)
destroy(this.cb_22)
destroy(this.cb_23)
destroy(this.cb_24)
destroy(this.cb_25)
destroy(this.cb_28)
destroy(this.dw_department)
destroy(this.cb_iverify)
destroy(this.ddlb_search_type)
destroy(this.cbx_status)
destroy(this.dw_view)
destroy(this.cb_select)
destroy(this.cb_search)
destroy(this.sle_srch_val)
destroy(this.gb_2)
destroy(this.gb_department)
destroy(this.gb_search)
destroy(this.gb_view)
destroy(this.dw_search)
destroy(this.cb_close)
destroy(this.cb_new)
destroy(this.dw_dept)
destroy(this.dw_org_facility_select)
destroy(this.gb_facility)
end on

event constructor;IF gs_user_id = "SE" THEN
	dw_view.Visible = False
	gb_view.Visible = False
	dw_org_facility_select.Visible = False
	gb_facility.Visible = False
	cb_iverify.Visible = False	
	gb_search.y = 24
	ddlb_search_type.Y = 84
	cb_search.Y = 84
	sle_srch_val.Y = 196
END IF
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-08
//$<modify> 01.24.2006 By: Cao YongWang
//$<reason> Performance tuning
//$<reason> Write script to retrieve data from a cache instead of from the database.
//select default_view into :ii_user_view from security_users where user_id = :gs_user_id; //maha 073103
ii_user_view = integer(gnv_data.of_getitem('security_users','default_view',"upper(user_id)='" + upper(gs_user_id) + "'"))
//---------------------------- APPEON END ----------------------------

Integer li_dept_secure_setting
Integer i

//SELECT set_37
//INTO: li_dept_secure_setting
//FROM icred_settings;
//li_dept_secure_setting = of_get_app_setting("set_37","I")

IF gi_dept_security = 1 THEN
	gb_department.Visible = True
	dw_department.Visible = True
	dw_department.settransobject( SQLCA )
	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> PT-09
   //$<modify> 02.17.2006 By: Cao YongWang
	//$<reason> Performance tuning.
	//$<reason> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.
   //$<modification> Add the Appeon Start Queue label.
	/*
	dw_department.retrieve( )
	dw_department.insertrow(1)

	DataWindowChild dwchild
	
	dw_department.GetChild( "department", dwchild )
	dwchild.SetTransObject( SQLCA )
	dwchild.Retrieve( gs_user_id )
	
	//find out how many departments the user has access to 
	//(do this to determine if users have rights to all or only some of the departments)
	li_num_of_departments_user_has_rights_to = dwchild.RowCount( )

	dwchild.InsertRow( 1 )
	dwchild.SetItem( 1, "description","All" )
	dwchild.SetItem( 1, "lookup_code", 0 )	
	dw_department.SetItem( 1, "department", "All" )
	
	//find out how many departments in all there are
	//(do this to determine if users have rights to all or only some of the departments)
	SELECT Count( lookup_code )
	INTO :li_num_of_departments
	FROM code_lookup
	WHERE lookup_name = 'department';
	IF SQLCA.SQLCODE = -1 THEN
		MessageBox( "SQL Error", SQLCA.SQLERRTEXT )
		RETURN -1
	END IF	
	*/
	//Appeon start queue label
	gnv_appeondb.of_startqueue()
	
	dw_department.retrieve( )
	//dw_department.insertrow(1)

	DataWindowChild dwchild
	
	dw_department.GetChild( "department", dwchild )
	dwchild.SetTransObject( SQLCA )
	dwchild.Retrieve( gs_user_id )
	//
	SELECT Count( lookup_code )
	INTO :li_num_of_departments
	FROM code_lookup
	WHERE lookup_name = 'department';
	//Add the Appeon Commit Queue label
	gnv_appeondb.of_commitqueue()
	//find out how many departments the user has access to 
	//(do this to determine if users have rights to all or only some of the departments)
	li_num_of_departments_user_has_rights_to = dwchild.RowCount( )
   dw_department.insertrow(1)
	dwchild.InsertRow( 1 )
	dwchild.SetItem( 1, "description","All" )
	dwchild.SetItem( 1, "lookup_code", 0 )	
	dw_department.SetItem( 1, "department", "All" )
	
	//find out how many departments in all there are
	//(do this to determine if users have rights to all or only some of the departments)
//	SELECT Count( lookup_code )
//	INTO :li_num_of_departments
//	FROM code_lookup
//	WHERE lookup_name = 'department';
//	IF SQLCA.SQLCODE = -1 THEN
//		MessageBox( "SQL Error", SQLCA.SQLERRTEXT )
//		RETURN -1
//	END IF
	//---------------------------- APPEON END ----------------------------
	dw_department.SetItem( 1, "department", 0 )
ELSE 
	li_num_of_departments = 0
	li_num_of_departments_user_has_rights_to = 0
	SetNull( il_dept )
	dw_view.x = dw_department.x
	dw_view.y = dw_department.y
	gb_view.x = gb_department.x
	gb_view.y = gb_department.y
END IF

if isnull(ii_user_view) then ii_user_view = 0

//$<add> 07.07.2008 by Andy
String ls_label
SELECT TOP 1 app_stat_facility_label INTO :ls_label FROM icred_settings;

if Len(trim(ls_label)) > 0 then 
	gb_facility.text = 'Select ' + ls_label
end if
//end add 07.07.2008
end event

type cb_27 from u_search_letter_button within pfc_cst_u_extended_search
integer x = 759
integer y = 1048
integer height = 64
integer taborder = 310
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "B2"
end type

event clicked;call super::clicked;//Start Code Change ----10.02.2008 #V85 maha - search function for batch
of_search_new("BAT2")
end event

type cb_26 from u_search_letter_button within pfc_cst_u_extended_search
integer x = 759
integer y = 984
integer height = 64
integer taborder = 310
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "B1"
end type

event clicked;call super::clicked;//Start Code Change ----10.02.2008 #V85 maha - search function for batch
of_search_new("BAT1")

end event

type cb_1 from u_search_letter_button within pfc_cst_u_extended_search
integer x = 78
integer y = 664
integer height = 64
integer taborder = 120
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "A"
end type

event clicked;of_search(This.Text)
end event

type cb_2 from u_search_letter_button within pfc_cst_u_extended_search
integer x = 78
integer y = 728
integer height = 64
integer taborder = 130
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "B"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_3 from u_search_letter_button within pfc_cst_u_extended_search
integer x = 78
integer y = 792
integer height = 64
integer taborder = 140
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "C"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_4 from u_search_letter_button within pfc_cst_u_extended_search
integer x = 78
integer y = 856
integer height = 64
integer taborder = 150
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "D"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_5 from u_search_letter_button within pfc_cst_u_extended_search
integer x = 78
integer y = 920
integer height = 64
integer taborder = 160
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "E"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_6 from u_search_letter_button within pfc_cst_u_extended_search
integer x = 78
integer y = 984
integer height = 64
integer taborder = 170
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "F"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_7 from u_search_letter_button within pfc_cst_u_extended_search
integer x = 78
integer y = 1048
integer height = 64
integer taborder = 180
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "G"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_8 from u_search_letter_button within pfc_cst_u_extended_search
integer x = 302
integer y = 664
integer height = 64
integer taborder = 190
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "H"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_9 from u_search_letter_button within pfc_cst_u_extended_search
integer x = 302
integer y = 728
integer height = 64
integer taborder = 200
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "I"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_10 from u_search_letter_button within pfc_cst_u_extended_search
integer x = 302
integer y = 792
integer height = 64
integer taborder = 210
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "J"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_11 from u_search_letter_button within pfc_cst_u_extended_search
integer x = 302
integer y = 856
integer height = 64
integer taborder = 220
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "K"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_12 from u_search_letter_button within pfc_cst_u_extended_search
integer x = 302
integer y = 920
integer height = 64
integer taborder = 230
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "L"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_13 from u_search_letter_button within pfc_cst_u_extended_search
integer x = 302
integer y = 984
integer height = 64
integer taborder = 240
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "M"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_14 from u_search_letter_button within pfc_cst_u_extended_search
integer x = 302
integer y = 1048
integer height = 64
integer taborder = 250
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "N"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_15 from u_search_letter_button within pfc_cst_u_extended_search
integer x = 526
integer y = 664
integer height = 64
integer taborder = 260
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "O"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_16 from u_search_letter_button within pfc_cst_u_extended_search
integer x = 526
integer y = 728
integer height = 64
integer taborder = 270
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "P"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_17 from u_search_letter_button within pfc_cst_u_extended_search
integer x = 526
integer y = 792
integer height = 64
integer taborder = 280
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "Q"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_18 from u_search_letter_button within pfc_cst_u_extended_search
integer x = 526
integer y = 856
integer height = 64
integer taborder = 290
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "R"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_19 from u_search_letter_button within pfc_cst_u_extended_search
integer x = 526
integer y = 920
integer height = 64
integer taborder = 300
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "S"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_20 from u_search_letter_button within pfc_cst_u_extended_search
integer x = 526
integer y = 984
integer height = 64
integer taborder = 310
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "T"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_21 from u_search_letter_button within pfc_cst_u_extended_search
integer x = 526
integer y = 1048
integer height = 64
integer taborder = 320
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "U"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_22 from u_search_letter_button within pfc_cst_u_extended_search
integer x = 759
integer y = 664
integer height = 64
integer taborder = 330
boolean bringtotop = true
integer textsize = -8
string facename = "Microsoft Sans Serif"
string text = "V"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_23 from u_search_letter_button within pfc_cst_u_extended_search
integer x = 759
integer y = 728
integer height = 64
integer taborder = 340
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "W"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_24 from u_search_letter_button within pfc_cst_u_extended_search
integer x = 759
integer y = 792
integer height = 64
integer taborder = 350
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "X"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_25 from u_search_letter_button within pfc_cst_u_extended_search
integer x = 759
integer y = 856
integer height = 64
integer taborder = 360
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "Y"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_28 from u_search_letter_button within pfc_cst_u_extended_search
integer x = 759
integer y = 920
integer height = 64
integer taborder = 370
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "Z"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type dw_department from datawindow within pfc_cst_u_extended_search
boolean visible = false
integer x = 41
integer y = 260
integer width = 955
integer height = 84
integer taborder = 100
boolean bringtotop = true
string dataobject = "d_department_lookup_with_security"
boolean border = false
boolean livescroll = true
end type

event itemchanged;il_dept = long(data)
end event

type cb_iverify from commandbutton within pfc_cst_u_extended_search
boolean visible = false
integer x = 686
integer y = 1548
integer width = 334
integer height = 84
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&iVerify Add"
end type

event clicked;//gs_pass_ids gs_passed_parms
//
//gs_passed_parms.s_ids[1] = "New"
//
//OpenWithParm( w_iverify_summary, gs_passed_parms )
//
//Return 0
end event

type ddlb_search_type from dropdownlistbox within pfc_cst_u_extended_search
integer x = 46
integer y = 1220
integer width = 695
integer height = 388
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean vscrollbar = true
string item[] = {"Last Name","I.D.","SS #","NPI #","Apps Needing Printed","Provider ID","Primary Department","Custom Search","Address - Street 1","Address - Street 2"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;if this.text = "Primary Department" then
	dw_dept.visible = true
	sle_srch_val.text = ""
	dw_dept.settransobject(sqlca)
	dw_dept.retrieve()
	dw_dept.insertrow(1)
else
	dw_dept.visible = false
	il_dept = 0
end if

//Start Code Change ---- 02.08.2006 #262 maha
if this.text = "Custom Search" then
	cb_search.triggerevent(clicked!)
else
	sle_srch_val.SetFocus()
	sle_srch_val.text = ""  //maha 011306
end if
//End Code Change---02.08.2006
end event

event constructor;This.Text = "Last Name"
end event

type cbx_status from checkbox within pfc_cst_u_extended_search
integer x = 46
integer y = 1420
integer width = 786
integer height = 76
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Include Inactive files in search"
end type

type dw_view from u_dw within pfc_cst_u_extended_search
integer x = 41
integer y = 460
integer width = 955
integer height = 108
integer taborder = 110
boolean bringtotop = true
string dataobject = "d_select_views_dddw_list_with_user_param"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
borderstyle borderstyle = stylebox!
end type

event constructor;//
//
This.of_SetTransObject( sqlca_1 )
This.of_SetUpdateAble( False )
This.InsertRow( 0 )

DatawindowChild dwchild
This.GetChild( "data_view_id", dwchild )
dwchild.SetTransObject( sqlca )
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-10
//$<modify> 01.24.2006 By: Cao YongWang
//$<reason> Performance tuning
//$<reason> Write script to retrieve data from a cache instead of from the database.
//dwchild.Retrieve( gs_user_id )
If not isvalid(ids_views) Then of_init_dddw()
dwchild.reset()
long ll_i
ll_i = ids_views.rowscopy(1,ids_views.rowcount() , primary! , dwchild, 1, primary!)

//---------------------------- APPEON END ----------------------------

//This.SetItem( 1, "data_view_id", 1 )
//This.SetRow( 1 )
//This.ScrollToRow( 1 )

//
//
//
end event

type cb_select from commandbutton within pfc_cst_u_extended_search
integer x = 14
integer y = 1548
integer width = 334
integer height = 84
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Select"
end type

event clicked;//debugbreak()

parent.event ue_cb_select( )  //calls of_select_prac( dw_search.GetRow() )


end event

type cb_search from u_cb within pfc_cst_u_extended_search
integer x = 754
integer y = 1220
integer width = 229
integer height = 84
integer taborder = 30
boolean bringtotop = true
string text = "S&earch"
boolean default = true
end type

event clicked;of_search_new("")

//String ls_fld
//String ls_sql
//String ls_ssn
//String ls_name
//String ls_depart_sql
//string ls_prac_list
//Integer li_name_len
//Integer li_Rc
//Integer li_val_len
//Integer i
//String ls_all_facilities
//Long ll_action_type
//Long ll_action_status
//DataWindowChild dwchild
//
//IF li_num_of_departments_user_has_rights_to <> li_num_of_departments THEN
//	dw_department.GetChild( "department", dwchild )
//	li_rc = dwchild.RowCount()
//	ls_depart_sql = "("
//	//start with 2 because 0 = all
//	FOR i = 2 TO li_rc
//		ls_depart_sql = ls_depart_sql + String( dwchild.GetItemNumber( i, "lookup_code" ) ) + ","
//	END FOR
//	ls_depart_sql = Mid( ls_depart_sql, 1, Len( ls_depart_sql ) -1 )
//	ls_depart_sql = ls_depart_sql + ")"
//END IF
////messagebox("",is_open_for)
//IF is_open_for = "INTELLIAPP" THEN
//	dw_search.DataObject = "d_extended_search_list_intelliapp"
//elseif is_open_for = "REPORTS" THEN
//	dw_search.DataObject = "d_extended_search_list_multi"
//ELSE
//	dw_search.DataObject = "d_extended_search_list"	
//	
//END IF
//
//IF ddlb_search_type.Text = "I.D." THEN
//	ls_fld = "prac_id"
//ELSEIF ddlb_search_type.Text = "Last Name" THEN
//	ls_fld = "last_name"
//ELSEIF ddlb_search_type.Text = "SS #" THEN
//	ls_fld = "ssn"
//ELSEIF ddlb_search_type.Text = "Provider ID" THEN //maha 081202
//	ls_fld = "provider_id"
//ELSEIF ddlb_search_type.Text = "Apps Needing Printed" THEN
//	ls_fld = "Apps Needing Printed"	
//ELSEIF ddlb_search_type.Text = "Primary Department" THEN
//	ls_fld = "Primary Department"
//ELSEIF ddlb_search_type.Text = "Custom Search" THEN //maha 1000604
//	ls_fld = "Custom Search"
//	open(w_search_query)
//	ls_prac_list = message.stringparm
//	if ls_prac_list = "Cancel" then return
//	//ls_prac_list = "1,2,3,4,5"
//	
//END IF
//debugbreak()
//li_val_len = Len(sle_srch_val.Text)
//
//
//il_facility_id = dw_org_facility_select.GetItemNumber( 1, "facility_id" )
//
//ls_sql =   "SELECT DISTINCT pd_basic.first_name, "+&   
//         "pd_basic.middle_name,"+&      
//         "pd_basic.title,"+&      
//         "pd_basic.name_suffix,"+&      
//         "pd_basic.prof_suffix,"+&      
//         "pd_basic.ssn,"+&      
//         "pd_basic.sex,"+&      
//         "pd_basic.prac_category,"+&      
//         "pd_basic.date_of_birth,"+&      
//         "pd_basic.rec_id,"+&      
//         "pd_basic.prac_id,"+&      
//         "pd_affil_stat.parent_facility_id,"+&      
//         "facility.facility_name,"+&      
//         "facility.default_data_view_id,"+&      
//         "pd_basic.last_name,"+&      
//         "code_lookup.code "
//	  IF is_open_for = "INTELLIAPP" THEN
//   // 	IF ls_fld = "Apps Needing Printed" THEN	    
//          ls_sql = ls_sql + ",net_dev_action_items.action_type,"+&      
//         "net_dev_action_items.app_id,"+&      	    
//         "net_dev_action_items.action_status " +&
//	   "FROM {oj pd_basic  LEFT OUTER JOIN code_lookup  ON pd_basic.name_suffix = code_lookup.lookup_code}, "+&
//	    "{oj pd_affil_stat  LEFT OUTER JOIN net_dev_action_items  ON pd_affil_stat.parent_facility_id =  "+&
//	    "net_dev_action_items.facility_id AND pd_affil_stat.prac_id = net_dev_action_items.prac_id}, "+&      
//     	    "facility "
//				
//		//if one department is selected or if all departments are selected and the number of departments the users
//		//has rights to is less then the number of departments in lookup table then do this
//		//if the number of departments in lookup are the same as the number of departments the user has rights to
//		//then the department security is turned off or they have rights to all departments so do nothing
//		if il_dept > 0 OR ( il_dept = 0 AND li_num_of_departments <> li_num_of_departments_user_has_rights_to ) then //maha 121002
//			ls_sql = ls_sql + ", pd_affil_dept "
//		end if
//		
//     	ls_sql = ls_sql +  "WHERE ( pd_basic.prac_id = pd_affil_stat.prac_id ) and "+&     
//     		 "( pd_affil_stat.parent_facility_id = facility.facility_id ) "
//		
//		//if only 1 department is selected then do a regular where clause
//		if il_dept > 0 then //maha 121002
//			ls_sql = ls_sql + "and ( pd_affil_stat.rec_id = pd_affil_dept.rec_id ) and "+& 
//			"( pd_affil_dept.primary_dept = 1 ) "
//			ls_sql = ls_sql + " AND (pd_affil_dept.department = " + string(il_dept) + ")"
//		//if ALL is selected and number of departments in lookup is not = to number of depart user has
//		//rights to then department security is turned on so do this.
//		elseif il_dept = 0 AND li_num_of_departments <> li_num_of_departments_user_has_rights_to THEN
//				ls_sql = ls_sql + " and ( pd_affil_stat.rec_id = pd_affil_dept.rec_id ) and "+& 
//			"( pd_affil_dept.primary_dept = 1 ) "
//			//if il_dept > 0 then 
//				ls_sql = ls_sql + " AND (pd_affil_dept.department in " + ls_depart_sql + ")"			
//		end if
//	ELSE
//		ls_sql = ls_sql + ",pd_affil_stat.date_app_audit_completed," +&   
//      "pd_affil_stat.date_data_entry_completed," +&
//	   "pd_affil_stat.date_verif_completed," +&  
//     	"pd_affil_stat.apptmnt_start_date, " +& 
//		"pd_affil_stat.active_status " 
//		if dw_search.DataObject = "d_extended_search_list_multi" then //maha added 091605 not used
//			ls_sql += " , 0 as selected, v_full_name.full_name "
//		end if
//     	ls_sql = ls_sql +  "FROM {oj pd_basic  LEFT OUTER JOIN code_lookup  ON pd_basic.name_suffix = code_lookup.lookup_code}, "+&
//     	"facility, "+&   
//		"pd_affil_stat "
//		if dw_search.DataObject = "d_extended_search_list_multi" then
//			ls_sql += ", v_full_name "
//		end if
//		
//		
//		//if one department is selected or if all departments are selected and the number of departments the users
//		//has rights to is less then the number of departments in lookup table then do this
//		//if the number of departments in lookup are the same as the number of departments the user has rights to
//		//then the department security is turned off or they have rights to all departments so do nothing
//		if il_dept > 0 OR ( il_dept = 0 AND li_num_of_departments <> li_num_of_departments_user_has_rights_to ) then //maha 121002
//			ls_sql = ls_sql + ", pd_affil_dept "
//		end if
//		
//     	ls_sql = ls_sql +  "WHERE ( pd_basic.prac_id = pd_affil_stat.prac_id ) and "+&     
//     		 "( pd_affil_stat.parent_facility_id = facility.facility_id ) "
//		
//		//if only 1 department is selected then do a regular where clause
//		if il_dept > 0 then //maha 121002
//			ls_sql = ls_sql + "and ( pd_affil_stat.rec_id = pd_affil_dept.rec_id ) and "+& 
//			"( pd_affil_dept.primary_dept = 1 ) "
//			ls_sql = ls_sql + " AND (pd_affil_dept.department = " + string(il_dept) + ")"
//		//if ALL is selected and number of departments in lookup is not = to number of depart user has
//		//rights to then department security is turned on so do this.
//		elseif il_dept = 0 AND li_num_of_departments <> li_num_of_departments_user_has_rights_to THEN
//				ls_sql = ls_sql + " and ( pd_affil_stat.rec_id = pd_affil_dept.rec_id ) and "+& 
//			"( pd_affil_dept.primary_dept = 1 ) "
//			//if il_dept > 0 then 
//				ls_sql = ls_sql + " AND (pd_affil_dept.department in " + ls_depart_sql + ")"			
//		end if
//		if dw_search.DataObject = "d_extended_search_list_multi" then
//			ls_sql += " and ( v_full_name.prac_id = pd_basic.prac_id ) "
//		end if
//	END IF	    
// //  "FROM {oj pd_basic  LEFT OUTER JOIN code_lookup  ON pd_basic.name_suffix = code_lookup.lookup_code}, "+&   	    
//IF il_facility_id <> 0 THEN
//	ls_sql = ls_sql + " AND pd_affil_stat.parent_facility_id = " + String( il_facility_id )
//ELSE
//	dw_org_facility_select.GetChild( "facility_id", dwchild )
//	FOR i = 1 TO dwchild.RowCount()
//		ls_all_facilities = ls_all_facilities + String( dwchild.GetItemNumber( i, "facility_id" ) ) + ","
//	END FOR
//	ls_all_facilities = Mid( ls_all_facilities , 1 , Len( ls_all_facilities ) -1 ) //gets rid of the extra comma
//	ls_sql = ls_sql + " AND pd_affil_stat.parent_facility_id in (" + ls_all_facilities + ")"
//END IF
//
//IF cbx_status.Checked = True THEN
//	ls_sql = ls_sql + " AND (pd_affil_stat.active_status = 1 OR pd_affil_stat.active_status = 5 OR pd_affil_stat.active_status = 3 OR pd_affil_stat.active_status = 4 )" 
//ELSE
//	ls_sql = ls_sql + " AND (pd_affil_stat.active_status = 1 OR pd_affil_stat.active_status = 4 or pd_affil_stat.active_status = 5)" 	
//END IF
//IF is_open_for = "DELETE" THEN
//	ls_sql = ls_sql + " AND pd_affil_stat.active_status = 2 " 
//END IF
//
//IF ls_fld = "Custom Search" THEN //maha 1000604
//		ls_sql = ls_sql + " AND pd_basic.prac_id in (" + ls_prac_list + ")"
//ELSEIF Len(sle_srch_val.Text) > 0 OR ls_fld = "Apps Needing Printed" THEN
//	IF ls_fld = "prac_id" THEN
//		ls_sql = ls_sql + " AND pd_basic.prac_id = " + sle_srch_val.Text
//	ELSEIF ls_fld = "last_name" THEN
//		ls_name = sle_srch_val.Text
//		li_name_len = Len( ls_name )
//		FOR i = 1 TO li_name_len
//			IF Mid(ls_name, i,1 )  = "'" THEN
//				ls_name = Mid(ls_name, 1, i ) + "'" + Mid(ls_name, i+1 , 100 )
//				i++
//		END IF	
//		END FOR
//		ls_sql = ls_sql + " AND {fn left(pd_basic.last_name," + String( li_name_len ) + ")}  = '" + Upper(ls_name) + "'"
//	ELSEIF ls_fld = "ssn" THEN
//		ls_ssn = sle_srch_val.Text
//		IF Pos( ls_ssn, "-" ) > 0 THEN
//		 	ls_ssn = Mid( sle_srch_val.Text, 1, 3 ) + Mid( sle_srch_val.Text, 5, 2 ) + Mid( sle_srch_val.Text, 8, 4 )
//		END IF
//		ls_sql = ls_sql + " AND ssn = '" + ls_ssn + "'"
//	elseIF ls_fld = "provider_id" THEN //maha 081202
//		ls_sql = ls_sql + " AND pd_basic.provider_id = '" + sle_srch_val.Text + "'"
//	end if
//	IF ls_fld = "Apps Needing Printed" THEN
//		//\/maha 032102
//		select lookup_code into :ll_action_type from code_lookup where lookup_name = 'Action Type' and code = 'App Out To MD';		
//		IF SQLCA.SQLCODE = 100 THEN
//				MessageBox("Error", "You need to add 'App Out To MD' to the Action Type lookup table." )
//				Return -1
//		end if
//		select lookup_code into :ll_action_status from code_lookup where lookup_name = 'Action Status' and code = 'Incomplete';
//		IF SQLCA.SQLCODE = 100 THEN
//				MessageBox("Error", "You will need to add 'Incomplete' to the Action Status lookup table." )
//				Return -1
//		END IF
//		//\maha
//		ls_sql = ls_sql + "AND action_type = " + String( ll_action_type ) + " AND action_status = " + string(ll_action_status)  //-3 AND action_status = -110"
//		
//	END IF
//
//	
//END IF
//
//
//
//ls_sql = ls_sql + " ORDER BY pd_basic.last_name ASC"   
////messagebox("", ls_sql )
////CLIPBOARD( LS_SQL )
////messagebox("", dw_search.DataObject )
//dw_search.SetTransObject( SQLCA_1 )
//
//
//dw_search.SetSQLSelect ( ls_sql )
//li_rc = dw_search.Retrieve( )
//
//FOR i = 1 TO li_rc
//	dw_search.SetItem( i, "rec_id", 0 )
//END FOR
//
//of_hide_ssn()
//
//
//dw_search.SetFocus()
//	
end event

type sle_srch_val from singlelineedit within pfc_cst_u_extended_search
integer x = 46
integer y = 1328
integer width = 942
integer height = 80
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type gb_2 from groupbox within pfc_cst_u_extended_search
integer x = 14
integer y = 596
integer width = 1010
integer height = 548
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "First Letter of Last Name Search"
end type

type gb_department from groupbox within pfc_cst_u_extended_search
boolean visible = false
integer x = 14
integer y = 208
integer width = 1006
integer height = 172
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "Select Primary Department"
end type

type gb_search from groupbox within pfc_cst_u_extended_search
integer x = 14
integer y = 1160
integer width = 1015
integer height = 352
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "Search On:"
end type

type gb_view from groupbox within pfc_cst_u_extended_search
integer x = 14
integer y = 396
integer width = 1006
integer height = 180
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "Select View"
end type

type dw_search from u_dw within pfc_cst_u_extended_search
event ue_save_as_batch ( )
event ue_print_practitioner ( )
event ue_print_verification ( )
event ue_print_applications ( )
event ue_print_missing ( )
integer x = 1056
integer y = 48
integer width = 2432
integer height = 1588
integer taborder = 10
string dataobject = "d_extended_search_list"
boolean hscrollbar = true
end type

event ue_save_as_batch();//////////////////////////////////////////////////////////////////////
// $<event>u_dwue_save_as_batch()
// $<arguments>
//		value	integer		
// $<returns> 
// $<description> Right Click Functionality on Practitioner Search Screen.
// $<description>
//////////////////////////////////////////////////////////////////////
// $<add> 10.09.2006 by Jack (Inova)
//////////////////////////////////////////////////////////////////////

long ll_prac_id[]
long i,ll_rowcount
string ls_sql

dw_search.accepttext()
ll_rowcount = dw_search.rowcount()
if ll_rowcount <= 0 then return
for i = 1 to ll_rowcount
	ll_prac_id[i] = dw_search.getitemnumber(i,'prac_id')
next

ls_sql = dw_search.describe("datawindow.syntax")

of_create_batch(ll_prac_id,'',ls_sql)

end event

event ue_print_practitioner();//////////////////////////////////////////////////////////////////////
// $<event>u_dwue_print_practitioner()
// $<arguments>
//		value	integer		
// $<returns> 
// $<description> Right Click Functionality on Practitioner Search Screen.
// $<description> 1 New window: w_print_practitioner_verification,1 New structure: str_prac_id.
//////////////////////////////////////////////////////////////////////
// $<add> 10.09.2006 by Jack (Inova)
//////////////////////////////////////////////////////////////////////

str_prac_id lstr_prac_id

dw_search.accepttext()
lstr_prac_id.prac_id = dw_search.getitemnumber(dw_search.getrow(),'prac_id')
lstr_prac_id.facility_id = dw_search.getitemnumber(dw_search.getrow(),'parent_facility_id')
lstr_prac_id.view_id= dw_search.getitemnumber(dw_search.getrow(),'data_view_id')
lstr_prac_id.types = 'P'
openwithparm(w_print_practitioner_verification,lstr_prac_id)


end event

event ue_print_verification();//////////////////////////////////////////////////////////////////////
// $<event>u_dwue_print_practitioner()
// $<arguments>
//		value	integer		
// $<returns> 
// $<description> Right Click Functionality on Practitioner Search Screen.
// $<description>
//////////////////////////////////////////////////////////////////////
// $<add> 10.10.2006 by Jack (Inova)
//////////////////////////////////////////////////////////////////////

str_prac_id lstr_prac_id

dw_search.accepttext()
lstr_prac_id.prac_id = dw_search.getitemnumber(dw_search.getrow(),'prac_id')
lstr_prac_id.facility_id = dw_search.getitemnumber(dw_search.getrow(),'parent_facility_id')
lstr_prac_id.types = 'V'
openwithparm(w_print_practitioner_verification,lstr_prac_id)


end event

event ue_print_applications();//////////////////////////////////////////////////////////////////////
// $<event>u_dwue_print_practitioner()
// $<arguments>
//		value	integer		
// $<returns> 
// $<description> Right Click Functionality on Practitioner Search Screen.
// $<description>
//////////////////////////////////////////////////////////////////////
// $<add> 10.10.2006 by Jack (Inova)
//////////////////////////////////////////////////////////////////////
long ll_prac_id

dw_search.accepttext()
ll_prac_id = dw_search.getitemnumber(dw_search.getrow(),'prac_id')

Open( w_IntelliApp_Print )

w_IntelliApp_Print.uo_print.of_from_prac_folder( ll_prac_id )
w_IntelliApp_Print.uo_print.ib_open_from_prac_folder = True

end event

event ue_print_missing();//////////////////////////////////////////////////////////////////////
// $<event> ue_print_missing()
// $<arguments>
//		value	integer		
// $<returns> 
// $<description> Right Click Functionality on Practitioner Search Screen.
// $<description>
//////////////////////////////////////////////////////////////////////
// $<add> 10.10.2006 by Jack (Inova)
//////////////////////////////////////////////////////////////////////
datastore lds_app_audit_rqrd_data
datastore lds_app_audit_browse
long ll_facility_id,ll_prac_id,ll_rec_id,ll_rowcount

//Start Code Change ---- 05.21.2007 #V7 maha
// corrected error where facility was selected form facility search rather than the selected record causing an application error when the selector is set to ALL.
//ll_facility_id = dw_org_facility_select.getitemnumber(dw_org_facility_select.getrow(),'facility_id')
ll_facility_id = dw_search.getitemnumber(dw_search.getrow(),'parent_facility_id')
//End Code Change---05.21.2007
ll_prac_id = dw_search.getitemnumber(dw_search.getrow(),'prac_id')

lds_app_audit_rqrd_data = create datastore
lds_app_audit_rqrd_data.dataobject = 'd_pd_app_audit_rqrd_data_inova_1'
lds_app_audit_rqrd_data.settransobject(sqlca)

lds_app_audit_browse = create datastore
lds_app_audit_browse.dataobject = 'd_app_audit_browse'
lds_app_audit_browse.settransobject(sqlca)

lds_app_audit_browse.retrieve(ll_prac_id,ll_facility_id)
ll_rec_id = lds_app_audit_browse.GetItemNumber( 1, 'rec_id' )
ll_rowcount = lds_app_audit_rqrd_data.retrieve(ll_rec_id)

//--------------------------- APPEON BEGIN ---------------------------
//$<Add> 08.23.2007 By: Evan
//$<Reason> Need to destroy object.
if IsValid(lds_app_audit_browse) then Destroy lds_app_audit_browse
if IsValid(lds_app_audit_rqrd_data) then Destroy lds_app_audit_rqrd_data
//---------------------------- APPEON END ----------------------------

if ll_rowcount < 1 then
	messagebox('Print Missing Letter','There is no missing info letter to print.')
	return
end if

iw_prac_folder.tab_1.selecttab(3)
iw_prac_folder.event dynamic pfc_cst_compose_request()

end event

event constructor;This.of_SetSort(True)
This.inv_sort.of_SetStyle(3)
This.of_SetReqColumn(True)
This.of_SetUpdateable( False )

This.inv_sort.of_SetColumnHeader(True)

IF gs_cust_type = "C" THEN
	This.Modify( "facility_name_t.text = 'Client'" )
ELSEIF gs_cust_type = "I" THEN
	This.Modify( "facility_name_t.text = 'Payor/Hospital'" )
END IF

this.of_setrowselect( true)
this.inv_rowselect.of_SetStyle(this.inv_rowselect.single )


end event

event doubleclicked;IF dwo.Name = "select_t" THEN
	of_select_all(  )
	Return
END IF

IF is_open_for = "INTELLIAPP" THEN
	MessageBox("Select", "You must check of the select box and then click the Select button to select practitioners.")
	Return 0
END IF





parent.event ue_cb_select( )
// mskinner 04 nov 2004 -- begin
//of_select_prac( row )
// mskinner 04 nov 2004 -- end
end event

event retrieveend;call super::retrieveend;Integer li_default_data_view_id
Integer li_found
String ls_null
DataWindowChild dwchild

SetNull( ls_null )

This.SelectRow(0, False)
This.SelectRow(1, True)

IF This.RowCount() > 0 THEN
	This.SelectRow(0, False)
	This.SelectRow(This.GetRow(), True)
	if ii_user_view > 0 then //maha 073103 check user default view
		dw_view.GetChild( "data_view_id", dwchild )
		li_found = dwchild.Find( "data_view_id = " + String( ii_user_view ),1, 1000 )
		IF li_found > 0 THEN
			dw_view.SetItem( 1, "data_view_id", ii_user_view )
		end if
	else //if no user default view use the facility default view
		li_default_data_view_id = This.GetItemNumber( This.GetRow(), "data_view_id" )
		dw_view.GetChild( "data_view_id", dwchild )
		li_found = dwchild.Find( "data_view_id = " + String( li_default_data_view_id ),1, 1000 )
		IF li_found > 0 THEN
			dw_view.SetItem( 1, "data_view_id", li_default_data_view_id )
		ELSE
			dw_view.Reset()
			dw_view.InsertRow( 0 )
		END IF
	end if
END IF


//IF This.RowCount() > 0 THEN
//	li_default_data_view_id = This.GetItemNumber( 1, "data_view_id" )
//	
//	dw_view.GetChild( "data_view_id", dwchild )
//	li_found = dwchild.Find( "data_view_id = " + String( li_default_data_view_id ),1, 1000 )
//	IF li_found > 0 THEN
//		dw_view.SetItem( 1, "data_view_id", li_default_data_view_id )
//	ELSE
//		dw_view.Reset()
//		dw_view.InsertRow( 0 )
//	END IF
//END IF
end event

event rowfocuschanged;call super::rowfocuschanged;Integer li_default_data_view_id
Integer li_found
String ls_null
DataWindowChild dwchild

SetNull( ls_null )

IF currentrow > 0 THEN
	if ii_user_view > 0 then //maha 073103 check user default view
		dw_view.GetChild( "data_view_id", dwchild )
		li_found = dwchild.Find( "data_view_id = " + String( ii_user_view ),1, 1000 )
		IF li_found > 0 THEN
			dw_view.SetItem( 1, "data_view_id", ii_user_view )
		end if
	else //if no user default view use the facility default view
		li_default_data_view_id = This.GetItemNumber( currentrow, "data_view_id" )
		dw_view.GetChild( "data_view_id", dwchild )
		li_found = dwchild.Find( "data_view_id = " + String( li_default_data_view_id ),1, 1000 )
		IF li_found > 0 THEN
			dw_view.SetItem( 1, "data_view_id", li_default_data_view_id )
		ELSE
			dw_view.Reset()
			dw_view.InsertRow( 0 )
		END IF
	end if
	//--------------------------- APPEON BEGIN ---------------------------
	//$<add> 10.10.2006 By: Jack (Inova)
	//$<reason> Right Click Functionality on Practitioner Search Screen.
	
	if isvalid(iw_prac_folder) then
		if dw_search.getrow() > 1 then
			iw_prac_folder.of_setup_title_search()
		end if
	end if
	//---------------------------- APPEON END ----------------------------
END IF

end event

event rbuttonup;//--------------------------- APPEON BEGIN ---------------------------
//$<add> 10.09.2006 By: Jack (Inova)
//$<reason> Right Click Functionality on Practitioner Search Screen.
//$<reason> 1 New menu: m_inova

m_inova				lm_dw
integer li_set_iapps,li_num = 0,li_cnt,i
datetime ldt_date_app_audit_completed
long ll_prac_id,ll_action_type,ll_action_status
li_set_iapps = of_get_app_setting("set_iapps","I")

if this.rowcount() < 1 then return 0 //Start Code Change ---- 04.12.2007 #V7 maha trap user error
if this.DataObject = "d_extended_search_list_intelliapp" then return 0 //Start Code Change ---- 04.12.2007 #V7 maha trap user error

ldt_date_app_audit_completed = dw_search.getitemdatetime(dw_search.getrow(),'pd_affil_stat_date_app_audit_completed')
ll_prac_id = dw_search.getitemnumber(dw_search.getrow(),'prac_id')
ll_action_type = long(gnv_data.of_getitem("code_lookup","lookup_code","lookup_name = 'Action Type' and code = 'App Out To MD'"))
ll_action_status = long(gnv_data.of_getitem("code_lookup","lookup_code","lookup_name = 'Action Status' and code = 'Incomplete'"))

SELECT count(net_dev_action_items.rec_id) into :li_num  FROM net_dev_action_items  
WHERE ( net_dev_action_items.prac_id = :ll_prac_id ) AND  
      ( net_dev_action_items.action_type = :ll_action_type ) AND  
      ( net_dev_action_items.action_status = :ll_action_status );


// Create popup menu
lm_dw = Create m_inova
lm_dw.of_SetParent (This)

if li_set_iapps = 1 then
	lm_dw.m_table.m_printapplications.visible = true
else 
	lm_dw.m_table.m_printapplications.visible = false
end if

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 05/28/2008 By: Ken.Guo
//$<reason> Fix BugN050704. For w_extended_search_new
If Not isvalid(iw_prac_folder) Then
	lm_dw.m_table.m_printmissing.visible = False
End If
//---------------------------- APPEON END ----------------------------

if not isnull(ldt_date_app_audit_completed) then
	gnv_app.of_modify_menu_attr( lm_dw.m_table.m_printmissing,'enabled', false)
else
	gnv_app.of_modify_menu_attr( lm_dw.m_table.m_printmissing,'enabled', true)
end if

li_cnt = UpperBound( w_mdi.ii_security_action_id )

FOR i = 1 TO li_cnt
   IF w_mdi.ii_security_action_id[ i ] = 1580 THEN
      IF w_mdi.ii_security_action_value[ i ] = 0 THEN
			lm_dw.m_table.m_printpractitioner.visible = false
			lm_dw.m_table.m_printverification.visible = false
		ELSE
			lm_dw.m_table.m_printpractitioner.visible = true
			lm_dw.m_table.m_printverification.visible = true
      END IF
   END IF  
	//Start Code Change ---- 10.24.2006  maha
   IF w_mdi.ii_security_action_id[ i ] = 5820 THEN
      IF w_mdi.ii_security_action_value[ i ] = 0 THEN
			lm_dw.m_table.m_printsearch.visible = false
			lm_dw.m_table.m_printsearchpdf.visible = false
			lm_dw.m_table.m_exportsearch.visible = false
		ELSE
			lm_dw.m_table.m_printsearch.visible = true
			lm_dw.m_table.m_printsearchpdf.visible = false
			lm_dw.m_table.m_exportsearch.visible = true
      END IF
   END IF  
    IF w_mdi.ii_security_action_id[ i ] = 2000 THEN //save as IntelliBatch
      IF w_mdi.ii_security_action_value[ i ] = 0 THEN
		lm_dw.m_table.m_saveresults.visible = false
	ELSE
		lm_dw.m_table.m_saveresults.visible = true
      END IF
   END IF


NEXT

if li_num < 1 then
	gnv_app.of_modify_menu_attr( lm_dw.m_table.m_printapplications,'enabled', false)
	lm_dw.m_table.m_printapplications.text = 'Print Applications (' + string(li_num) + ')'
else
	gnv_app.of_modify_menu_attr( lm_dw.m_table.m_printapplications,'enabled', true)
	lm_dw.m_table.m_printapplications.text = 'Print Applications (' + string(li_num) + ')'
end if
//End Code Change---10.24.2006
// Popup menu

//lm_dw.m_table.PopMenu (iw_prac_folder.PointerX() + 5, iw_prac_folder.PointerY() + 210)
lm_dw.m_table.PopMenu ( w_mdi.PointerX(), w_mdi.PointerY() ) //Rodger wu changed on Oct 26, 2006

Destroy lm_dw

Return 1
//---------------------------- APPEON END ----------------------------



end event

event clicked;call super::clicked;//--------------------------- APPEON BEGIN ---------------------------
//$<add> 10.10.2006 By: Jack (Inova)
//$<reason> Right Click Functionality on Practitioner Search Screen.
if dw_search.getrow() = 1 then
//	iw_prac_folder.of_setup_title_search()
end if
//---------------------------- APPEON END ----------------------------

end event

type cb_close from commandbutton within pfc_cst_u_extended_search
integer x = 686
integer y = 1548
integer width = 334
integer height = 84
integer taborder = 380
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Close"
end type

event clicked;of_Close( -1)
end event

type cb_new from commandbutton within pfc_cst_u_extended_search
integer x = 352
integer y = 1548
integer width = 329
integer height = 84
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&New"
end type

event clicked;Integer li_rec_cnt
String ls_demo


IF dw_view.GetText() = "" OR IsNull( dw_view.GetText() )  THEN
	MessageBox("View", "Please select a view." )
	Return -1
END IF


ls_demo = ProfileString(gs_IniFilePathName, "setup", "demo", "None")
IF ls_demo = "1" THEN
	SELECT Count(prac_id)  
	INTO :li_rec_cnt  
	FROM pd_basic  ;
	IF li_rec_cnt > 10 THEN
		MessageBox("Limit", "You can only have up to 10 records in the trial version.")
		Return -1
	END IF
END IF


gl_prac_id = -9
gi_parent_facility = 0
dw_view.AcceptText()
IF dw_view.GetText() = "" OR IsNull( dw_view.GetText() )  THEN
	MessageBox("View", "Please select a view." )
	Return -1
END IF
gl_data_view_id = dw_view.GetItemNumber( 1, "data_view_id" )

//\/maha 012402
string ls_ssn
integer chk
integer ssncnt

//select set_4 into :chk from icred_settings;
chk = of_get_app_setting("set_4","I")
if chk > 0 then //Start Code Change ----04.14.2008 #V8 maha - changed to allow other than ssn search
//if chk = 1 then
	//open( w_get_ssn)
	//ls_ssn = message.stringparm
	//messagebox("ls_ssn",ls_ssn)
	//select count(prac_id) into :ssncnt from pd_basic where ssn = :ls_ssn;
	//if ssncnt > 0 then
		openwithparm(w_snn_check_prac_info, chk) //Start Code Change ----04.14.2008 #V8 maha - changed to allow other than ssn search
		gl_prac_id = message.doubleparm
	//end if
	if gl_prac_id > 0 then iw_prac_folder.ib_from_ssn = true //Start Code Change ---- 10.03.2006 #621 maha variable to allow found prac to be selected
end if

if gl_prac_id = -123 then return
//\maha


iw_prac_folder.of_retrieve_prac()
Return 0



end event

type dw_dept from datawindow within pfc_cst_u_extended_search
boolean visible = false
integer x = 41
integer y = 1316
integer width = 946
integer height = 84
integer taborder = 390
boolean bringtotop = true
string dataobject = "d_departments_lookup"
boolean border = false
boolean livescroll = true
end type

event constructor;//this.settransobject(sqlca)
//this.retrieve()
//this.insertrow(1)

end event

event itemchanged;il_dept = long(data)
end event

type dw_org_facility_select from pfc_cst_u_org_facility_selector_vertical within pfc_cst_u_extended_search
integer x = 41
integer y = 68
integer width = 955
integer height = 116
integer taborder = 90
string dataobject = "d_org_facility_select_vertical_no_label"
boolean border = false
borderstyle borderstyle = stylebox!
end type

event constructor;//This.Object.facilities_t.Visible = False
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-11
//$<modify> 01.24.2006 By: Cao YongWang
//$<reason> Performance tuning
//$<modification> The following script is copied from the ancester object pfc_cst_u_org_facility_selector_vertical.
//$<modification> Uncheck the Extend Ancester Script item from PowerBuilder painter.
DataWindowChild dwchild

This.SetTransObject( SQLCA )
This.InsertRow( 0 )

This.GetChild( "facility_id", dwchild )
dwchild.SetTransObject( SQLCA )
//dwchild.Retrieve( gs_user_id )
//Write scripts to retrieve data from the cache instead of retrieve.
If not isvalid(ids_facilitys) Then of_init_dddw()
dwchild.reset()
ids_facilitys.rowscopy(1, ids_facilitys.rowcount(),Primary!, dwchild , 1, Primary!)
dwchild.InsertRow(1)
dwchild.SetItem( 1, "facility_name", "All" )
dwchild.SetItem( 1, "facility_id", 0 )

This.SetItem( 1, "facility_id", 0 )
//---------------------------- APPEON END ----------------------------

end event

type gb_facility from groupbox within pfc_cst_u_extended_search
integer x = 14
integer y = 24
integer width = 1006
integer height = 168
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "Select Facility"
end type

event constructor;//BEGIN---Delete by Evan 09/19/2008
/*
IF gs_cust_type = "C" THEN
	This.Text = 'Client'
ELSEIF gs_cust_type = "I" THEN
	This.Text = 'Payor/Hospital'
END IF
*/
//BEGIN---Delete by Evan 09/19/2008
end event

