$PBExportHeader$pfc_cst_u_extended_search_horizontal.sru
forward
global type pfc_cst_u_extended_search_horizontal from userobject
end type
type dw_department from datawindow within pfc_cst_u_extended_search_horizontal
end type
type ddlb_search_type from dropdownlistbox within pfc_cst_u_extended_search_horizontal
end type
type cbx_status from checkbox within pfc_cst_u_extended_search_horizontal
end type
type dw_view from u_dw within pfc_cst_u_extended_search_horizontal
end type
type cb_select from commandbutton within pfc_cst_u_extended_search_horizontal
end type
type cb_search from u_cb within pfc_cst_u_extended_search_horizontal
end type
type gb_department from groupbox within pfc_cst_u_extended_search_horizontal
end type
type gb_view from groupbox within pfc_cst_u_extended_search_horizontal
end type
type gb_2 from groupbox within pfc_cst_u_extended_search_horizontal
end type
type cb_28 from u_search_letter_button within pfc_cst_u_extended_search_horizontal
end type
type cb_25 from u_search_letter_button within pfc_cst_u_extended_search_horizontal
end type
type cb_24 from u_search_letter_button within pfc_cst_u_extended_search_horizontal
end type
type cb_23 from u_search_letter_button within pfc_cst_u_extended_search_horizontal
end type
type cb_22 from u_search_letter_button within pfc_cst_u_extended_search_horizontal
end type
type cb_21 from u_search_letter_button within pfc_cst_u_extended_search_horizontal
end type
type cb_20 from u_search_letter_button within pfc_cst_u_extended_search_horizontal
end type
type cb_19 from u_search_letter_button within pfc_cst_u_extended_search_horizontal
end type
type cb_18 from u_search_letter_button within pfc_cst_u_extended_search_horizontal
end type
type cb_17 from u_search_letter_button within pfc_cst_u_extended_search_horizontal
end type
type cb_16 from u_search_letter_button within pfc_cst_u_extended_search_horizontal
end type
type cb_15 from u_search_letter_button within pfc_cst_u_extended_search_horizontal
end type
type cb_14 from u_search_letter_button within pfc_cst_u_extended_search_horizontal
end type
type cb_13 from u_search_letter_button within pfc_cst_u_extended_search_horizontal
end type
type cb_12 from u_search_letter_button within pfc_cst_u_extended_search_horizontal
end type
type cb_11 from u_search_letter_button within pfc_cst_u_extended_search_horizontal
end type
type cb_10 from u_search_letter_button within pfc_cst_u_extended_search_horizontal
end type
type cb_9 from u_search_letter_button within pfc_cst_u_extended_search_horizontal
end type
type cb_8 from u_search_letter_button within pfc_cst_u_extended_search_horizontal
end type
type cb_7 from u_search_letter_button within pfc_cst_u_extended_search_horizontal
end type
type cb_6 from u_search_letter_button within pfc_cst_u_extended_search_horizontal
end type
type cb_5 from u_search_letter_button within pfc_cst_u_extended_search_horizontal
end type
type cb_4 from u_search_letter_button within pfc_cst_u_extended_search_horizontal
end type
type cb_3 from u_search_letter_button within pfc_cst_u_extended_search_horizontal
end type
type cb_2 from u_search_letter_button within pfc_cst_u_extended_search_horizontal
end type
type cb_1 from u_search_letter_button within pfc_cst_u_extended_search_horizontal
end type
type dw_search from u_dw within pfc_cst_u_extended_search_horizontal
end type
type cb_close from commandbutton within pfc_cst_u_extended_search_horizontal
end type
type cb_new from commandbutton within pfc_cst_u_extended_search_horizontal
end type
type dw_org_facility_select from pfc_cst_u_org_facility_selector_vertical within pfc_cst_u_extended_search_horizontal
end type
type gb_facility from groupbox within pfc_cst_u_extended_search_horizontal
end type
type sle_srch_val from singlelineedit within pfc_cst_u_extended_search_horizontal
end type
type gb_search from groupbox within pfc_cst_u_extended_search_horizontal
end type
type cb_iverify from commandbutton within pfc_cst_u_extended_search_horizontal
end type
type dw_dept from datawindow within pfc_cst_u_extended_search_horizontal
end type
end forward

global type pfc_cst_u_extended_search_horizontal from userobject
integer width = 3547
integer height = 1680
boolean border = true
long backcolor = 67108864
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_department dw_department
ddlb_search_type ddlb_search_type
cbx_status cbx_status
dw_view dw_view
cb_select cb_select
cb_search cb_search
gb_department gb_department
gb_view gb_view
gb_2 gb_2
cb_28 cb_28
cb_25 cb_25
cb_24 cb_24
cb_23 cb_23
cb_22 cb_22
cb_21 cb_21
cb_20 cb_20
cb_19 cb_19
cb_18 cb_18
cb_17 cb_17
cb_16 cb_16
cb_15 cb_15
cb_14 cb_14
cb_13 cb_13
cb_12 cb_12
cb_11 cb_11
cb_10 cb_10
cb_9 cb_9
cb_8 cb_8
cb_7 cb_7
cb_6 cb_6
cb_5 cb_5
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
dw_search dw_search
cb_close cb_close
cb_new cb_new
dw_org_facility_select dw_org_facility_select
gb_facility gb_facility
sle_srch_val sle_srch_val
gb_search gb_search
cb_iverify cb_iverify
dw_dept dw_dept
end type
global pfc_cst_u_extended_search_horizontal pfc_cst_u_extended_search_horizontal

type variables
Integer il_facility_id
String is_open_for
String is_select = 'S'
long il_dept = 0
integer ii_user_view

w_prac_data_1 iw_prac_folder

n_tr SQLCA_1
end variables

forward prototypes
public function integer of_search (string letter)
public function integer of_select_prac (integer ai_row)
public function integer of_close (integer ai_value)
public function integer of_set_open_for (string as_open_for)
public function integer of_set_parent (w_prac_data_1 aw_win)
public function integer of_set_transaction (n_tr as_trans)
public function integer of_open_from_dash ()
public function integer of_select_all ()
end prototypes

public function integer of_search (string letter);String ls_sql
Integer li_rc
Integer i
DataWindowChild dwchild
String ls_all_facilities

dw_search.SetRedraw( False )

IF is_open_for = "INTELLIAPP" THEN
	dw_search.DataObject = "d_extended_search_list_intelliapp"				
ELSE
	dw_search.DataObject = "d_extended_search_list"	
END IF

letter = Upper(letter)

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
     	"pd_affil_stat.apptmnt_start_date "
		  		
     	ls_sql = ls_sql +  "FROM {oj pd_basic  LEFT OUTER JOIN code_lookup  ON pd_basic.name_suffix = code_lookup.lookup_code}, "+&
     	"facility, "+&   
		"pd_affil_stat "
		
		if il_dept > 0 then //maha 121002
			ls_sql = ls_sql + ", pd_affil_dept "
		end if
		
     	ls_sql = ls_sql +  "WHERE ( pd_basic.prac_id = pd_affil_stat.prac_id ) and "+&     
     		 "( pd_affil_stat.parent_facility_id = facility.facility_id ) "
				
		if il_dept > 0 then //maha 121002
			ls_sql = ls_sql + "and ( pd_affil_stat.rec_id = pd_affil_dept.rec_id ) and "+& 
			"( pd_affil_dept.primary_dept = 1 ) "
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



//messagebox("", ls_sql)

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


Return 0
end function

public function integer of_select_prac (integer ai_row);Long ll_prac_id
Integer li_parent_facility_id
Integer li_cnt
Integer li_active_status
String ls_full_name
String ls_names[]
Integer li_msg_ans
Integer li_rc
Integer i
Long ll_prac_ids[]
Integer li_facility_ids[]
long ll_affil_rec //maha 121702

IF ai_row < 1 THEN
	RETURN -1
END IF

ll_prac_id = dw_search.GetItemNumber(ai_row, "prac_id")

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
				//messagebox("",string(ll_affil_rec))
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
ELSEIF is_open_for = "DELETE" THEN
	gl_prac_id = ll_prac_id
ELSEIF is_open_for = "AUDIT" THEN
	gl_prac_id = ll_prac_id
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

Close( Parent )

RETURN 0


end function

public function integer of_close (integer ai_value);CloseWithReturn( Parent, ai_value )

Return 0
end function

public function integer of_set_open_for (string as_open_for);is_open_for = as_open_for
Integer li_facility
Boolean lb_from_dash = False

IF is_open_for = "AUDIT" THEN
	cb_new.Visible = False
	cb_new.Visible = False
	cb_iverify.Visible = False	
ELSEIF Left(is_open_for, 7 ) = "REPORTS" THEN
	li_facility = Integer( Mid( is_open_for , 8, 10 ) )
	dw_org_facility_select.SetItem( 1, "facility_id", li_facility )	
	is_open_for = "REPORTS"
	dw_view.Visible = False
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
	END IF
	dw_org_facility_select.SetItem( 1, "facility_id", li_facility )	
	is_open_for = "INTELLIAPP"
	dw_search.DataObject = "d_extended_search_list_intelliapp"
	dw_search.SetTransObject( SQLCA )
	dw_view.Visible = False
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
END IF

//is_original_sql = dw_search.Object.DataWindow.Table.Select

gl_prac_id = 0
gl_facility_id = 0

dw_search.SetFocus()





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
dwchild.Retrieve( gs_user_id )

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
dwchild.Retrieve( gs_user_id )
dwchild.InsertRow(1)
dwchild.SetItem( 1, "facility_name", "All" )
dwchild.SetItem( 1, "facility_id", 0 )

dw_org_facility_select.SetItem( 1, "facility_id", 0 )

Integer li_facility_id
Integer li_find
String ls_facility_name

SELECT security_users.default_search_facility  
INTO :li_facility_id  
FROM security_users  
WHERE security_users.user_id = :gs_user_id;

IF Not IsNull( li_facility_id ) THEN
	dw_org_facility_select.SetItem( 1, "facility_id", li_facility_id )
END IF

//dw_org_facility_select.GetChild( "facility_id", dwchild )
//
//li_find = dwchild.Find( "facility_id = " + String( li_facility_id ), 1, 100 )
//ls_facility_name = dwchild.GetItemString( li_find, "facility_name" )
//dw_org_facility_select.SetText( ls_facility_name ) 
//


IF gi_auto_search = 1 THEN
	cb_search.TriggerEvent( Clicked! )
END IF
	

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

on pfc_cst_u_extended_search_horizontal.create
this.dw_department=create dw_department
this.ddlb_search_type=create ddlb_search_type
this.cbx_status=create cbx_status
this.dw_view=create dw_view
this.cb_select=create cb_select
this.cb_search=create cb_search
this.gb_department=create gb_department
this.gb_view=create gb_view
this.gb_2=create gb_2
this.cb_28=create cb_28
this.cb_25=create cb_25
this.cb_24=create cb_24
this.cb_23=create cb_23
this.cb_22=create cb_22
this.cb_21=create cb_21
this.cb_20=create cb_20
this.cb_19=create cb_19
this.cb_18=create cb_18
this.cb_17=create cb_17
this.cb_16=create cb_16
this.cb_15=create cb_15
this.cb_14=create cb_14
this.cb_13=create cb_13
this.cb_12=create cb_12
this.cb_11=create cb_11
this.cb_10=create cb_10
this.cb_9=create cb_9
this.cb_8=create cb_8
this.cb_7=create cb_7
this.cb_6=create cb_6
this.cb_5=create cb_5
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_search=create dw_search
this.cb_close=create cb_close
this.cb_new=create cb_new
this.dw_org_facility_select=create dw_org_facility_select
this.gb_facility=create gb_facility
this.sle_srch_val=create sle_srch_val
this.gb_search=create gb_search
this.cb_iverify=create cb_iverify
this.dw_dept=create dw_dept
this.Control[]={this.dw_department,&
this.ddlb_search_type,&
this.cbx_status,&
this.dw_view,&
this.cb_select,&
this.cb_search,&
this.gb_department,&
this.gb_view,&
this.gb_2,&
this.cb_28,&
this.cb_25,&
this.cb_24,&
this.cb_23,&
this.cb_22,&
this.cb_21,&
this.cb_20,&
this.cb_19,&
this.cb_18,&
this.cb_17,&
this.cb_16,&
this.cb_15,&
this.cb_14,&
this.cb_13,&
this.cb_12,&
this.cb_11,&
this.cb_10,&
this.cb_9,&
this.cb_8,&
this.cb_7,&
this.cb_6,&
this.cb_5,&
this.cb_4,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.dw_search,&
this.cb_close,&
this.cb_new,&
this.dw_org_facility_select,&
this.gb_facility,&
this.sle_srch_val,&
this.gb_search,&
this.cb_iverify,&
this.dw_dept}
end on

on pfc_cst_u_extended_search_horizontal.destroy
destroy(this.dw_department)
destroy(this.ddlb_search_type)
destroy(this.cbx_status)
destroy(this.dw_view)
destroy(this.cb_select)
destroy(this.cb_search)
destroy(this.gb_department)
destroy(this.gb_view)
destroy(this.gb_2)
destroy(this.cb_28)
destroy(this.cb_25)
destroy(this.cb_24)
destroy(this.cb_23)
destroy(this.cb_22)
destroy(this.cb_21)
destroy(this.cb_20)
destroy(this.cb_19)
destroy(this.cb_18)
destroy(this.cb_17)
destroy(this.cb_16)
destroy(this.cb_15)
destroy(this.cb_14)
destroy(this.cb_13)
destroy(this.cb_12)
destroy(this.cb_11)
destroy(this.cb_10)
destroy(this.cb_9)
destroy(this.cb_8)
destroy(this.cb_7)
destroy(this.cb_6)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_search)
destroy(this.cb_close)
destroy(this.cb_new)
destroy(this.dw_org_facility_select)
destroy(this.gb_facility)
destroy(this.sle_srch_val)
destroy(this.gb_search)
destroy(this.cb_iverify)
destroy(this.dw_dept)
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

select default_view into :ii_user_view from security_users where user_id = :gs_user_id; //maha 073103

Integer li_dept_secure_setting

//SELECT set_37
//INTO: li_dept_secure_setting
//FROM icred_settings;
//li_dept_secure_setting = of_get_app_setting("set_37","I")

IF gi_dept_security = 1 THEN
	gb_department.Visible = True
	dw_department.Visible = True
	dw_department.settransobject(sqlca)
	dw_department.retrieve()
	dw_department.insertrow(1)
	DataWindowChild dwchild
	dw_department.GetChild( "description", dwchild )
	dwchild.InsertRow( 1 )
	dwchild.SetItem( 1, "description","All" )
	dwchild.SetItem( 1, "lookup_code", 0 )	
	dw_department.SetItem( 1, "description", "All" )
ELSE 
	SetNull( il_dept )
	dw_view.x = dw_department.x
	dw_view.y = dw_department.y
	gb_view.x = gb_department.x
	gb_view.y = gb_department.y
END IF

if isnull(ii_user_view) then ii_user_view = 0

end event

type dw_department from datawindow within pfc_cst_u_extended_search_horizontal
boolean visible = false
integer x = 2322
integer y = 72
integer width = 946
integer height = 84
integer taborder = 370
boolean bringtotop = true
string dataobject = "d_departments_lookup"
boolean border = false
boolean livescroll = true
end type

event itemchanged;il_dept = long(data)
end event

type ddlb_search_type from dropdownlistbox within pfc_cst_u_extended_search_horizontal
integer x = 210
integer y = 272
integer width = 937
integer height = 388
integer taborder = 400
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean vscrollbar = true
string item[] = {"Last Name","I.D.","SS #","Apps Needing Printed","Provider ID","Primary Department"}
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

sle_srch_val.SetFocus()
end event

event constructor;This.Text = "Last Name"
end event

type cbx_status from checkbox within pfc_cst_u_extended_search_horizontal
integer x = 1783
integer y = 264
integer width = 443
integer height = 96
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Include Inactive "
end type

type dw_view from u_dw within pfc_cst_u_extended_search_horizontal
integer x = 197
integer y = 72
integer width = 955
integer height = 108
integer taborder = 70
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
dwchild.Retrieve( gs_user_id )

//This.SetItem( 1, "data_view_id", 1 )
//This.SetRow( 1 )
//This.ScrollToRow( 1 )


//
//
//
end event

type cb_select from commandbutton within pfc_cst_u_extended_search_horizontal
integer x = 2651
integer y = 260
integer width = 293
integer height = 92
integer taborder = 320
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Select"
end type

event clicked;IF dw_search.RowCount() > 0 THEN
	of_select_prac( dw_search.GetRow() )
END IF
end event

type cb_search from u_cb within pfc_cst_u_extended_search_horizontal
integer x = 2327
integer y = 260
integer width = 302
integer taborder = 350
boolean bringtotop = true
string text = "&Search"
boolean default = true
end type

event clicked;String ls_fld
String ls_sql
String ls_ssn
String ls_name
Integer li_name_len
Integer li_Rc
Integer li_val_len
Integer i
String ls_all_facilities
Long ll_action_type
Long ll_action_status

DatawindowChild dwchild

IF is_open_for = "INTELLIAPP" THEN
	dw_search.DataObject = "d_extended_search_list_intelliapp"				
ELSE
	dw_search.DataObject = "d_extended_search_list"	
END IF
//dw_search.DataObject = "d_extended_search_list"
//debugbreak()
IF ddlb_search_type.Text = "I.D." THEN
	ls_fld = "prac_id"
ELSEIF ddlb_search_type.Text = "Last Name" THEN
	ls_fld = "last_name"
ELSEIF ddlb_search_type.Text = "SS #" THEN
	ls_fld = "ssn"
ELSEIF ddlb_search_type.Text = "Provider ID" THEN //maha 081202
	ls_fld = "provider_id"
ELSEIF ddlb_search_type.Text = "Apps Needing Printed" THEN
	ls_fld = "Apps Needing Printed"	
ELSEIF ddlb_search_type.Text = "Primary Department" THEN
	ls_fld = "Primary Department"
//	IF is_open_for = "INTELLIAPP" THEN  //maha 110901 moved to above
//		dw_search.DataObject = "d_extended_search_list_intelliapp"				
//	ELSE
//		dw_search.DataObject = "d_extended_search_list"	
//	END IF

END IF
debugbreak()
li_val_len = Len(sle_srch_val.Text)


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
   // 	IF ls_fld = "Apps Needing Printed" THEN	    
          ls_sql = ls_sql + ",net_dev_action_items.action_type,"+&      
         "net_dev_action_items.app_id,"+&      	    
         "net_dev_action_items.action_status " +&
	   "FROM {oj pd_basic  LEFT OUTER JOIN code_lookup  ON pd_basic.name_suffix = code_lookup.lookup_code}, "+&
	    "{oj pd_affil_stat  LEFT OUTER JOIN net_dev_action_items  ON pd_affil_stat.parent_facility_id =  "+&
	    "net_dev_action_items.facility_id AND pd_affil_stat.prac_id = net_dev_action_items.prac_id}, "+&      
     	    "facility "
				
		if il_dept > 0 then //maha 121002
			ls_sql = ls_sql + ", pd_affil_dept "
		end if
		
		
	  ls_sql = ls_sql + "WHERE ( pd_basic.prac_id = pd_affil_stat.prac_id ) and "+&     
     	    "( pd_affil_stat.parent_facility_id = facility.facility_id ) "
				
		if il_dept > 0 then //maha 121002
			ls_sql = ls_sql + "and ( pd_affil_stat.rec_id = pd_affil_dept.rec_id ) and "+& 
			"( pd_affil_dept.primary_dept = 1 ) "
			//if il_dept > 0 then 
				ls_sql = ls_sql + " AND (pd_affil_dept.department = " + string(il_dept) + ")"
			//end if
		end if
	ELSE
		ls_sql = ls_sql + ",pd_affil_stat.date_app_audit_completed," +&   
      "pd_affil_stat.date_data_entry_completed," +&
	   "pd_affil_stat.date_verif_completed," +&  
     	"pd_affil_stat.apptmnt_start_date "
		  		
     	ls_sql = ls_sql +  "FROM {oj pd_basic  LEFT OUTER JOIN code_lookup  ON pd_basic.name_suffix = code_lookup.lookup_code}, "+&
     	"facility, "+&   
		"pd_affil_stat "
		
		if il_dept > 0  then //maha 121002
			ls_sql = ls_sql + ", pd_affil_dept "
		end if
		
     	ls_sql = ls_sql +  "WHERE ( pd_basic.prac_id = pd_affil_stat.prac_id ) and "+&     
     		 "( pd_affil_stat.parent_facility_id = facility.facility_id ) "
				
		if il_dept > 0 then 
			ls_sql = ls_sql + "and ( pd_affil_stat.rec_id = pd_affil_dept.rec_id ) and "+& 
			"( pd_affil_dept.primary_dept = 1 ) "

			ls_sql = ls_sql + " AND (pd_affil_dept.department = " + string(il_dept) + ")"
			
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

IF cbx_status.Checked = True THEN
	ls_sql = ls_sql + " AND (pd_affil_stat.active_status = 1 OR pd_affil_stat.active_status = 5 OR pd_affil_stat.active_status = 3 OR pd_affil_stat.active_status = 4 )" 
ELSE
	ls_sql = ls_sql + " AND (pd_affil_stat.active_status = 1 OR pd_affil_stat.active_status = 4 or pd_affil_stat.active_status = 5)" 	
END IF
IF is_open_for = "DELETE" THEN
	ls_sql = ls_sql + " AND pd_affil_stat.active_status = 2 " 
END IF

IF Len(sle_srch_val.Text) > 0 OR ls_fld = "Apps Needing Printed" THEN
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
	elseIF ls_fld = "provider_id" THEN //maha 081202
		ls_sql = ls_sql + " AND pd_basic.provider_id = '" + sle_srch_val.Text + "'"
	
	END IF
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
//messagebox("", ls_sql )
CLIPBOARD( LS_SQL )
//messagebox("", dw_search.DataObject )
dw_search.SetTransObject( SQLCA_1 )


dw_search.SetSQLSelect ( ls_sql )
li_rc = dw_search.Retrieve( )

FOR i = 1 TO li_rc
	dw_search.SetItem( i, "rec_id", 0 )
END FOR

dw_search.SetFocus()
	
end event

type gb_department from groupbox within pfc_cst_u_extended_search_horizontal
boolean visible = false
integer x = 2295
integer y = 8
integer width = 997
integer height = 180
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "Select Department"
end type

type gb_view from groupbox within pfc_cst_u_extended_search_horizontal
integer x = 178
integer y = 8
integer width = 992
integer height = 180
integer taborder = 60
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

type gb_2 from groupbox within pfc_cst_u_extended_search_horizontal
integer x = 133
integer y = 1456
integer width = 3163
integer height = 180
integer taborder = 90
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

type cb_28 from u_search_letter_button within pfc_cst_u_extended_search_horizontal
integer x = 448
integer y = 1524
integer width = 110
integer taborder = 250
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "z"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_25 from u_search_letter_button within pfc_cst_u_extended_search_horizontal
integer x = 558
integer y = 1524
integer width = 110
integer taborder = 200
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "y"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_24 from u_search_letter_button within pfc_cst_u_extended_search_horizontal
integer x = 667
integer y = 1524
integer width = 110
integer taborder = 160
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "x"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_23 from u_search_letter_button within pfc_cst_u_extended_search_horizontal
integer x = 777
integer y = 1524
integer width = 110
integer taborder = 120
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "c"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_22 from u_search_letter_button within pfc_cst_u_extended_search_horizontal
integer x = 887
integer y = 1524
integer width = 110
integer taborder = 110
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "d"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_21 from u_search_letter_button within pfc_cst_u_extended_search_horizontal
integer x = 997
integer y = 1524
integer width = 110
integer taborder = 390
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "u"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_20 from u_search_letter_button within pfc_cst_u_extended_search_horizontal
integer x = 1106
integer y = 1524
integer width = 110
integer taborder = 280
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "t"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_19 from u_search_letter_button within pfc_cst_u_extended_search_horizontal
integer x = 1216
integer y = 1524
integer width = 110
integer taborder = 240
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "s"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_18 from u_search_letter_button within pfc_cst_u_extended_search_horizontal
integer x = 1326
integer y = 1524
integer width = 110
integer taborder = 210
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "r"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_17 from u_search_letter_button within pfc_cst_u_extended_search_horizontal
integer x = 1435
integer y = 1524
integer width = 110
integer taborder = 170
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "q"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_16 from u_search_letter_button within pfc_cst_u_extended_search_horizontal
integer x = 1545
integer y = 1524
integer width = 110
integer taborder = 130
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "p"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_15 from u_search_letter_button within pfc_cst_u_extended_search_horizontal
integer x = 1655
integer y = 1524
integer width = 110
integer taborder = 100
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "o"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_14 from u_search_letter_button within pfc_cst_u_extended_search_horizontal
integer x = 1765
integer y = 1524
integer width = 110
integer taborder = 420
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "n"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_13 from u_search_letter_button within pfc_cst_u_extended_search_horizontal
integer x = 1874
integer y = 1524
integer width = 110
integer taborder = 290
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "m"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_12 from u_search_letter_button within pfc_cst_u_extended_search_horizontal
integer x = 1984
integer y = 1524
integer width = 110
integer taborder = 260
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "l"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_11 from u_search_letter_button within pfc_cst_u_extended_search_horizontal
integer x = 2094
integer y = 1524
integer width = 110
integer taborder = 220
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "k"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_10 from u_search_letter_button within pfc_cst_u_extended_search_horizontal
integer x = 2203
integer y = 1524
integer width = 110
integer taborder = 180
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "j"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_9 from u_search_letter_button within pfc_cst_u_extended_search_horizontal
integer x = 2313
integer y = 1524
integer width = 110
integer taborder = 140
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "i"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_8 from u_search_letter_button within pfc_cst_u_extended_search_horizontal
integer x = 2423
integer y = 1524
integer width = 110
integer taborder = 80
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "h"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_7 from u_search_letter_button within pfc_cst_u_extended_search_horizontal
integer x = 2533
integer y = 1524
integer width = 110
integer taborder = 430
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "g"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_6 from u_search_letter_button within pfc_cst_u_extended_search_horizontal
integer x = 2642
integer y = 1524
integer width = 110
integer taborder = 300
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "f"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_5 from u_search_letter_button within pfc_cst_u_extended_search_horizontal
integer x = 2752
integer y = 1524
integer width = 110
integer taborder = 270
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "e"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_4 from u_search_letter_button within pfc_cst_u_extended_search_horizontal
integer x = 2862
integer y = 1524
integer width = 110
integer taborder = 230
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "d"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_3 from u_search_letter_button within pfc_cst_u_extended_search_horizontal
integer x = 2971
integer y = 1524
integer width = 110
integer taborder = 190
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "c"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_2 from u_search_letter_button within pfc_cst_u_extended_search_horizontal
integer x = 338
integer y = 1524
integer width = 110
integer taborder = 150
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "b"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_1 from u_search_letter_button within pfc_cst_u_extended_search_horizontal
integer x = 229
integer y = 1524
integer width = 110
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "a"
end type

event clicked;of_search(This.Text)
end event

type dw_search from u_dw within pfc_cst_u_extended_search_horizontal
integer x = 178
integer y = 416
integer width = 3113
integer height = 1024
integer taborder = 10
string dataobject = "d_extended_search_list"
boolean hscrollbar = true
end type

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
end event

event doubleclicked;IF dwo.Name = "select_t" THEN
	of_select_all(  )
	Return
END IF

IF is_open_for = "INTELLIAPP" THEN
	MessageBox("Select", "You must check of the select box and then click the Select button to select practitioners.")
	Return 0
END IF
of_select_prac( row )
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
	This.SelectRow(0, False)
	This.SelectRow(This.GetRow(), True)
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
END IF

end event

type cb_close from commandbutton within pfc_cst_u_extended_search_horizontal
integer x = 3374
integer y = 1512
integer width = 110
integer height = 92
integer taborder = 330
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

type cb_new from commandbutton within pfc_cst_u_extended_search_horizontal
integer x = 2967
integer y = 260
integer width = 288
integer height = 92
integer taborder = 310
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "New"
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

if chk = 1 then
	//open( w_get_ssn)
	//ls_ssn = message.stringparm
	//messagebox("ls_ssn",ls_ssn)
	//select count(prac_id) into :ssncnt from pd_basic where ssn = :ls_ssn;
	//if ssncnt > 0 then
		open(w_snn_check_prac_info)
		gl_prac_id = message.doubleparm
	//end if
	
end if

if gl_prac_id = -123 then return
//\maha


iw_prac_folder.of_retrieve_prac()
Return 0



end event

type dw_org_facility_select from pfc_cst_u_org_facility_selector_vertical within pfc_cst_u_extended_search_horizontal
integer x = 1257
integer y = 60
integer width = 965
integer height = 116
integer taborder = 30
string dataobject = "d_org_facility_select_vertical_no_label"
boolean border = false
borderstyle borderstyle = stylebox!
end type

event constructor;call super::constructor;//This.Object.facilities_t.Visible = False
end event

type gb_facility from groupbox within pfc_cst_u_extended_search_horizontal
integer x = 1239
integer y = 8
integer width = 992
integer height = 180
integer taborder = 20
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

event constructor;IF gs_cust_type = "C" THEN
	This.Text = 'Client'
ELSEIF gs_cust_type = "I" THEN
	This.Text = 'Payor/Hospital'
END IF
end event

type sle_srch_val from singlelineedit within pfc_cst_u_extended_search_horizontal
integer x = 1257
integer y = 272
integer width = 485
integer height = 80
integer taborder = 360
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

type gb_search from groupbox within pfc_cst_u_extended_search_horizontal
integer x = 178
integer y = 212
integer width = 3113
integer height = 168
integer taborder = 410
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "Custom Search"
end type

type cb_iverify from commandbutton within pfc_cst_u_extended_search_horizontal
boolean visible = false
integer x = 3360
integer y = 1284
integer width = 110
integer height = 92
integer taborder = 340
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "iVerify Add"
end type

event clicked;//gs_pass_ids gs_passed_parms
//
//gs_passed_parms.s_ids[1] = "New"
//
//OpenWithParm( w_iverify_summary, gs_passed_parms )
//
//Return 0
end event

type dw_dept from datawindow within pfc_cst_u_extended_search_horizontal
boolean visible = false
integer x = 1211
integer y = 268
integer width = 960
integer height = 84
integer taborder = 380
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

