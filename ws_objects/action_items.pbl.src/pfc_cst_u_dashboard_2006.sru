﻿$PBExportHeader$pfc_cst_u_dashboard_2006.sru
forward
global type pfc_cst_u_dashboard_2006 from userobject
end type
type dw_data from datawindow within pfc_cst_u_dashboard_2006
end type
type dw_list from u_dw within pfc_cst_u_dashboard_2006
end type
type st_u_audit from statictext within pfc_cst_u_dashboard_2006
end type
type st_u_over from statictext within pfc_cst_u_dashboard_2006
end type
type st_u_print from statictext within pfc_cst_u_dashboard_2006
end type
type st_u_follow from statictext within pfc_cst_u_dashboard_2006
end type
type st_u_part from statictext within pfc_cst_u_dashboard_2006
end type
type st_u_exp from statictext within pfc_cst_u_dashboard_2006
end type
type st_u_today from statictext within pfc_cst_u_dashboard_2006
end type
type st_user from statictext within pfc_cst_u_dashboard_2006
end type
type st_ai_due_today from statictext within pfc_cst_u_dashboard_2006
end type
type st_time from statictext within pfc_cst_u_dashboard_2006
end type
type cb_1 from commandbutton within pfc_cst_u_dashboard_2006
end type
type dw_query from datawindow within pfc_cst_u_dashboard_2006
end type
type cbx_1 from checkbox within pfc_cst_u_dashboard_2006
end type
type st_miss from statictext within pfc_cst_u_dashboard_2006
end type
type ddplb_1 from dropdownpicturelistbox within pfc_cst_u_dashboard_2006
end type
type st_1 from statictext within pfc_cst_u_dashboard_2006
end type
type st_print from statictext within pfc_cst_u_dashboard_2006
end type
type st_ai_prac_follow_up from statictext within pfc_cst_u_dashboard_2006
end type
type st_ai_par from statictext within pfc_cst_u_dashboard_2006
end type
type st_expiring from statictext within pfc_cst_u_dashboard_2006
end type
type st_6 from statictext within pfc_cst_u_dashboard_2006
end type
type st_7 from statictext within pfc_cst_u_dashboard_2006
end type
type st_9 from statictext within pfc_cst_u_dashboard_2006
end type
type st_ai_over_due from statictext within pfc_cst_u_dashboard_2006
end type
type p_1 from picture within pfc_cst_u_dashboard_2006
end type
type uo_1 from uo_clock within pfc_cst_u_dashboard_2006
end type
type gb_1 from groupbox within pfc_cst_u_dashboard_2006
end type
type gb_2 from groupbox within pfc_cst_u_dashboard_2006
end type
end forward

global type pfc_cst_u_dashboard_2006 from userobject
integer width = 1920
integer height = 2024
boolean border = true
long backcolor = 16777215
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_data dw_data
dw_list dw_list
st_u_audit st_u_audit
st_u_over st_u_over
st_u_print st_u_print
st_u_follow st_u_follow
st_u_part st_u_part
st_u_exp st_u_exp
st_u_today st_u_today
st_user st_user
st_ai_due_today st_ai_due_today
st_time st_time
cb_1 cb_1
dw_query dw_query
cbx_1 cbx_1
st_miss st_miss
ddplb_1 ddplb_1
st_1 st_1
st_print st_print
st_ai_prac_follow_up st_ai_prac_follow_up
st_ai_par st_ai_par
st_expiring st_expiring
st_6 st_6
st_7 st_7
st_9 st_9
st_ai_over_due st_ai_over_due
p_1 p_1
uo_1 uo_1
gb_1 gb_1
gb_2 gb_2
end type
global pfc_cst_u_dashboard_2006 pfc_cst_u_dashboard_2006

forward prototypes
public function integer of_query ()
public function integer of_run_action (integer ai_action)
public function integer of_query_data ()
public function integer of_get_actions ()
public function integer of_filter_actions (string as_filter, string as_user, integer ai_row)
end prototypes

public function integer of_query ();dw_query.SetTransObject( SQLCA )
dw_query.Retrieve( )

DataWindowChild dwchild
Integer li_miss_info_cnt
Integer li_rc
Integer li_nr
Integer li_exp_ltr_cnt
Long ll_app_out_to_md
Long ll_ver_method_exp_ltr
Long ll_action_status
Long ll_par
Long ll_app_rcvd_prac
Long ll_app_rcvd_payor
//Start Code Change ---- 02.22.2006 #275 maha
string ls_user_filter
string ls_filter

setpointer(hourglass!)


dw_query.InsertRow( 0)

dw_query.GetChild( "quick_filter", dwchild )

select lookup_code into :ll_action_status from code_lookup where lookup_name = 'Action Status' and code = 'Incomplete';
IF SQLCA.SQLCODE = 100 THEN
	//--------------------------- APPEON BEGIN ---------------------------
	//$<modify> 2007.08.31 By: Jack
	//$<reason> Fix a defect.
	/*
	MessageBox("Lookup missing", "You will need to add a 'Incomplete' code to the Action Status lookup table." )
	*/
	MessageBox("Lookup missing", "You will need to add an 'Incomplete' code to the Action Status lookup table." )
	//---------------------------- APPEON END ----------------------------
END IF

select lookup_code into :ll_par from code_lookup where lookup_name = 'Action Type' and code = 'PAR';
IF SQLCA.SQLCODE = 100 THEN
	//--------------------------- APPEON BEGIN ---------------------------
	//$<modify> 2007.08.31 By: Jack
	//$<reason> Fix a defect.
	/*
	MessageBox("Lookup missing", "Adding a 'PAR' code to the Action Type lookup table." )
	*/
	MessageBox("Lookup missing", "You will need to add a 'PAR' code to the Action Type lookup table." )
	//---------------------------- APPEON END ----------------------------
	select lookup_code_id into :ll_par from ids;
	ll_par++
	update dba_ids set lookup_code_id = :ll_par;
	insert into code_lookup (lookup_code,lookup_name,code,description,custom_1) values (:ll_par,'Action Type','PAR','Participating','PAR');
	commit using sqlca;
END IF

select lookup_code into :ll_app_rcvd_prac from code_lookup where lookup_name = 'Action Type' and code = 'App Rcvd Prac';
IF SQLCA.SQLCODE = 100 THEN
	//--------------------------- APPEON BEGIN ---------------------------
	//$<modify> 2007.08.31 By: Jack
	//$<reason> Fix a defect.
	/*
	MessageBox("Lookup missing", "You will need to add a 'App Rcvd Prac' code to the Action Type lookup table." )
	*/
	MessageBox("Lookup missing", "You will need to add an 'App Rcvd Prac' code to the Action Type lookup table." )
	//---------------------------- APPEON END ----------------------------
END IF

select lookup_code into :ll_app_rcvd_payor from code_lookup where lookup_name = 'Action Type' and code = 'App Rcvd Payor';
IF SQLCA.SQLCODE = 100 THEN
	//--------------------------- APPEON BEGIN ---------------------------
	//$<modify> 2007.08.31 By: Jack
	//$<reason> Fix a defect.
	/*
	MessageBox("Lookup missing", "You will need to add a 'App Rcvd Payor' code to the Action Type lookup table." )
	*/
	MessageBox("Lookup missing", "You will need to add an 'App Rcvd Payor' code to the Action Type lookup table." )
	//---------------------------- APPEON END ----------------------------
END IF

select lookup_code into :ll_app_out_to_md from code_lookup where lookup_name = 'Action Type' and code = 'App Out To MD';
IF SQLCA.SQLCODE = 100 THEN
	MessageBox("Lookup missing", "You will need to add a 'PAR' code to the Action Type lookup table." )
END IF

st_user.text = gs_user_id
////Due Today
//li_nr = dwchild.InsertRow( 0 )
//dwchild.SetItem( li_nr, "filter_code", "Items Due TODAY" )
//dwchild.SetItem( li_nr, "filter_description", "Displays a list of Action Item due TODAY." )
//dwchild.SetItem( li_nr, "filter_syntax", "active_status = 1 AND DaysAfter( due_date, today() ) = 0 AND action_status = " + String( ll_action_status )  )
ls_user_filter = " and action_user = '" + gs_user_id + "'"
//Due Today
ls_filter = "active_status = 1 AND DaysAfter( due_date, today() ) = 0 AND action_status = " + String( ll_action_status )
dw_query.SetFilter( ls_filter )
dw_query.Filter( )
li_rc = dw_query.RowCount( )
st_ai_due_today.Text = "There Are " + String( li_rc ) + " Application Action items due Today"
dw_query.SetFilter( ls_filter + ls_user_filter )
dw_query.Filter( )
st_u_today.text = string(dw_query.rowcount())

//You have # Application Status action items over due
ls_filter =  "active_status = 1 AND DaysAfter( today(), due_date ) < 0 AND action_status = " + String( ll_action_status ) 
dw_query.SetFilter(ls_filter)
dw_query.Filter( )
li_rc = dw_query.RowCount( )
st_ai_over_due.Text = "There Are " + String( li_rc ) + " Application Action items Overdue"
dw_query.SetFilter( ls_filter + ls_user_filter )
dw_query.Filter( )
st_u_over.text = string(dw_query.rowcount())

//You have # App Rcvd Prac follow letters to send
ls_filter =  "active_status = 1 AND action_type = " + String( ll_app_rcvd_prac ) + " AND DaysAfter( today(), due_date ) <= 0 AND action_status = " + String( ll_action_status )  
dw_query.SetFilter(ls_filter)
dw_query.Filter( )
li_rc = dw_query.RowCount( )
st_ai_prac_follow_up.Text = "There Are " + String( li_rc ) + " App Rcvd Prac follow up letters to send"
dw_query.SetFilter( ls_filter + ls_user_filter )
dw_query.Filter( )
st_u_follow.text = string(dw_query.rowcount())

//You have # Participation follow letters to send
ls_filter =  "active_status = 1 AND action_type = " + String( ll_par ) + " AND DaysAfter( today(), due_date ) <= 0 AND action_status = " + String( ll_action_status ) 
dw_query.SetFilter(ls_filter)
dw_query.Filter( )
li_rc = dw_query.RowCount( )
st_ai_par.Text = "There Are " + String( li_rc ) + " Participation follow up letters to send"
dw_query.SetFilter( ls_filter + ls_user_filter )
dw_query.Filter( )
st_u_part.text = string(dw_query.rowcount())

//You have # applications to print
//"active_status = 1 AND action_type = " + String( ll_app_out ) + " AND DaysAfter( today(), due_date ) <= 0 AND action_status = " + String( ll_action_status )  )
ls_filter =  "active_status = 1 AND action_type = " + String( ll_app_out_to_md ) + "  AND action_status = " + String( ll_action_status ) 
//dw_query.SetFilter( "active_status = 1 AND action_type = " + String( ll_app_out_to_md ) + " AND DaysAfter( today(), due_date ) <= 0 AND action_status = " + String( ll_action_status ) )
dw_query.SetFilter(ls_filter)
dw_query.Filter( )
li_rc = dw_query.RowCount( )
st_print.Text = "There Are " + String( li_rc ) + " Applications to print"
dw_query.SetFilter( ls_filter + ls_user_filter )
dw_query.Filter( )
st_u_print.text = string(dw_query.rowcount())

//expiring credentials
SELECT code_lookup.lookup_code  
INTO :ll_ver_method_exp_ltr
FROM code_lookup  
WHERE ( code_lookup.lookup_name = 'verification method' ) AND  
      ( code_lookup.code = 'EXP CRED LTR'  ) ; 
IF SQLCA.SQLCODE = -1 THEN
	MessageBox("SQL ERROR", SQLCA.SQLERRTEXT)
	RETURN -1
END IF

//SELECT distinct Count( rec_id )
//INTO :li_exp_ltr_cnt
//FROM verif_info
//WHERE verif_info.print_flag = 1 AND verif_info.verification_method = :ll_ver_method_exp_ltr and verif_info.response_code IS NULL and active_status = 1; //maha modified 102904
//maha modified to better match ai graph
SELECT count( distinct verif_info.doc_id)//Start Code Change ---- 05.03.2006 #428 maha added distinct
 INTO :li_exp_ltr_cnt
    FROM verif_info,
			pd_affil_stat,
			security_user_facilities  
   WHERE 
			( security_user_facilities.facility_id = pd_affil_stat.parent_facility_id ) and
			( security_user_facilities.access_rights = 1 ) AND
			( security_user_facilities.user_id = :gs_user_id) and
        ( verif_info.facility_id = pd_affil_stat.verifying_facility ) and  
			( verif_info.prac_id = pd_affil_stat.prac_id ) and
			( pd_affil_stat.active_status  in (1,4) ) AND
         ( verif_info.active_status = 1 ) AND
			
			( verif_info.response_code is null ) AND
			( verif_info.verification_method = :ll_ver_method_exp_ltr ) AND
			( verif_info.print_flag = 1 ) ;

st_expiring.Text = "There Are " + String( li_exp_ltr_cnt) + " Expiring Credential letters to send"
///\/maha 022206
SELECT count( verif_info.doc_id)
 INTO :li_exp_ltr_cnt
    FROM verif_info,
			pd_affil_stat,
			security_user_facilities  
   WHERE 
			( security_user_facilities.facility_id = pd_affil_stat.parent_facility_id ) and
			( security_user_facilities.access_rights = 1 ) AND
			( security_user_facilities.user_id = :gs_user_id) and
        ( verif_info.facility_id = pd_affil_stat.verifying_facility ) and  
			( verif_info.prac_id = pd_affil_stat.prac_id ) and
			( pd_affil_stat.active_status  in (1,4) ) AND
         ( verif_info.active_status = 1 ) AND
			
			( verif_info.response_code is null ) AND
			( verif_info.verification_method = :ll_ver_method_exp_ltr ) AND
			( verif_info.print_flag = 1 and
			verif_info.priority_user = :gs_user_id) ;

st_u_exp.text = string(li_exp_ltr_cnt)
//\maha
//You have # Missing Information Items
SELECT DISTINCT Count( pd_app_audit.facility_id )
INTO :li_miss_info_cnt
FROM pd_app_audit,   
     data_view_app_audit,   
     pd_affil_stat,   
     v_full_name,   
     facility  
WHERE ( data_view_app_audit.app_audit_id = pd_app_audit.app_audit_id ) and  
      ( pd_affil_stat.apptmnt_type = data_view_app_audit.app_type ) and  
      ( pd_affil_stat.rec_id = pd_app_audit.appt_stat_id ) and  
      ( pd_app_audit.prac_id = v_full_name.prac_id ) and  
      ( pd_app_audit.facility_id = facility.facility_id ) and  
      ( ( pd_app_audit.date_completed is null ) AND  
      ( pd_affil_stat.active_status in (1,4) ) AND  
      ( pd_affil_stat.apptmnt_start_date is null ));

st_miss.Text = "There Are " + String( li_miss_info_cnt ) + " Missing Information Items"

SELECT DISTINCT Count( pd_app_audit.facility_id )
INTO :li_miss_info_cnt
FROM pd_app_audit,   
     data_view_app_audit,   
     pd_affil_stat,   
     v_full_name,   
     facility  
WHERE ( data_view_app_audit.app_audit_id = pd_app_audit.app_audit_id ) and  
      ( pd_affil_stat.apptmnt_type = data_view_app_audit.app_type ) and  
      ( pd_affil_stat.rec_id = pd_app_audit.appt_stat_id ) and  
      ( pd_app_audit.prac_id = v_full_name.prac_id ) and  
      ( pd_app_audit.facility_id = facility.facility_id ) and  
      ( ( pd_app_audit.date_completed is null ) AND  
      ( pd_affil_stat.active_status in (1,4) ) AND  
      ( pd_affil_stat.apptmnt_start_date is null )
		and pd_affil_stat.priority_user = :gs_user_id) ;

st_u_audit.text = string(li_exp_ltr_cnt)
//End Code Change---02.22.2006
st_time.Text = "Last refreshed " + String( Now( ), "hh:mm" )

//Application Not Back From Provider
//li_nr = dwchild.InsertRow( 0 )
//dwchild.SetItem( li_nr, "filter_code", "Applications Not Back From Provider" )
//dwchild.SetItem( li_nr, "filter_description", "Displays a list of App Rcvd Prac Action Item that are overdue." )
//dwchild.SetItem( li_nr, "filter_syntax", "active_status = 1 AND action_type = " + String( ll_app_rcvd_prac ) + " AND DaysAfter( today(), due_date ) <= 0 AND action_status = " + String( ll_action_status )  )
//dwchild.SetItem( li_nr, "filter_index", 2  )
//
////Items Due in the next 7 days
//li_nr = dwchild.InsertRow( 0 )
//dwchild.SetItem( li_nr, "filter_code", "Items Due in the next 7 days" )
//dwchild.SetItem( li_nr, "filter_description", "Displays a list of Action Item that are due in the next 7 days." )
//dwchild.SetItem( li_nr, "filter_syntax", "active_status = 1 AND DaysAfter( today(), due_date ) >= 0 AND DaysAfter( RelativeDate(today(),7), due_date ) <= 7 AND action_status = " + String( ll_action_status )  )
//dwchild.SetItem( li_nr, "filter_index", 4  )
setpointer(arrow!)

Return 1
end function

public function integer of_run_action (integer ai_action);//function created maha 101204
//Start Code Change ---- 03.27.2006 #344 maha redundant call corrected
w_dash.WindowState = Minimized!
IF gs_cust_type = "I" THEN
	IF Not IsValid( w_action_items_ia ) THEN
		OpenSheetWithParm( w_action_items_ia, 99, w_mdi, 4, Layered! )
		w_action_items_ia.ii_dashboard_macro = ai_action
	else
		w_action_items_ia.ii_dashboard_macro = ai_action
		w_action_items_ia.Event pfc_postopen( )
	END IF
ELSE
	IF Not IsValid( w_action_items ) THEN
		OpenSheetWithParm( w_action_items, 99, w_mdi, 4, Layered! )
		w_action_items.ii_dashboard_macro = ai_action
	else
		w_action_items.ii_dashboard_macro = ai_action
		w_action_items.Event pfc_postopen( )
	end if

END IF
//End Code Change---03.27.2006


return 1
end function

public function integer of_query_data ();//Start Code Change ---- 10.04.2006 #638 maha





DataWindowChild dwchild
Integer li_miss_info_cnt
long li_rc
Integer li_nr
Integer li_exp_ltr_cnt
integer li_tid
integer i
integer ic
integer li_app = 0
long li_uc
Long ll_app_out_to_md
Long ll_ver_method_exp_ltr
Long ll_action_status
Long ll_par
Long ll_app_rcvd_prac
Long ll_app_rcvd_payor
//Start Code Change ---- 02.22.2006 #275 maha
string ls_user_filter
string ls_filter

of_get_actions()  //gets the appropriate list of actions

ic = dw_list.rowcount()
if ic < 1 then 
	close(w_dash_2006)
	return -1
else
	//open progress window
	setpointer(hourglass!)
	//st_user.text = gs_user_id//change this to the dw lable
	for i = 1 to ic
		if dw_list.getitemstring(i,"task_type") = "A" then //set the data; exit the loop
			li_app = 1
			exit
		end if
	next
end if

if li_app = 1 then  //get data and lookup_codes
	dw_query.SetTransObject( SQLCA )
	dw_query.Retrieve( )

	dw_query.InsertRow( 0)
	dw_query.GetChild( "quick_filter", dwchild )

	select lookup_code into :ll_action_status from code_lookup where lookup_name = 'Action Status' and code = 'Incomplete';
	IF SQLCA.SQLCODE = 100 THEN
		//--------------------------- APPEON BEGIN ---------------------------
		//$<modify> 2007.08.31 By: Jack
		//$<reason> Fix a defect.
		/*
		MessageBox("Lookup missing", "You will need to add a 'Incomplete' code to the Action Status lookup table." )
		*/
		MessageBox("Lookup missing", "You will need to add an 'Incomplete' code to the Action Status lookup table." )
		//---------------------------- APPEON END ----------------------------
	END IF
	
	select lookup_code into :ll_par from code_lookup where lookup_name = 'Action Type' and code = 'PAR';
	IF SQLCA.SQLCODE = 100 THEN
		//--------------------------- APPEON BEGIN ---------------------------
		//$<modify> 2007.08.31 By: Jack
		//$<reason> Fix a defect.
		/*
		MessageBox("Lookup missing", "Adding a 'PAR' code to the Action Type lookup table." )
		*/
		MessageBox("Lookup missing", "You will need to add a 'PAR' code to the Action Type lookup table." )
		//---------------------------- APPEON END ----------------------------
		select lookup_code_id into :ll_par from ids;
		ll_par++
		update dba_ids set lookup_code_id = :ll_par;
		insert into code_lookup (lookup_code,lookup_name,code,description,custom_1) values (:ll_par,'Action Type','PAR','Participating','PAR');
		commit using sqlca;
	END IF
	
	select lookup_code into :ll_app_rcvd_prac from code_lookup where lookup_name = 'Action Type' and code = 'App Rcvd Prac';
	IF SQLCA.SQLCODE = 100 THEN
		//--------------------------- APPEON BEGIN ---------------------------
		//$<modify> 2007.08.31 By: Jack
		//$<reason> Fix a defect.
		/*
		MessageBox("Lookup missing", "You will need to add a 'App Rcvd Prac' code to the Action Type lookup table." )
		*/
		MessageBox("Lookup missing", "You will need to add an 'App Rcvd Prac' code to the Action Type lookup table." )
		//---------------------------- APPEON END ----------------------------
	END IF
	
	select lookup_code into :ll_app_rcvd_payor from code_lookup where lookup_name = 'Action Type' and code = 'App Rcvd Payor';
	IF SQLCA.SQLCODE = 100 THEN
		//--------------------------- APPEON BEGIN ---------------------------
		//$<modify> 2007.08.31 By: Jack
		//$<reason> Fix a defect.
		/*
		MessageBox("Lookup missing", "You will need to add a 'App Rcvd Payor' code to the Action Type lookup table." )
		*/
		MessageBox("Lookup missing", "You will need to add an 'App Rcvd Payor' code to the Action Type lookup table." )
		//---------------------------- APPEON END ----------------------------
	END IF
	
	select lookup_code into :ll_app_out_to_md from code_lookup where lookup_name = 'Action Type' and code = 'App Out To MD';
	IF SQLCA.SQLCODE = 100 THEN
		MessageBox("Lookup missing", "You will need to add a 'PAR' code to the Action Type lookup table." )
	END IF
	
end if


for i = 1 to ic
	li_tid = dw_list.getitemnumber(i,"task_id")
	li_rc = 0
	li_uc = 0
	choose case li_tid
		case 0		//Due Today
			ls_user_filter = " and action_user = '" + gs_user_id + "'"
			ls_filter = "active_status = 1 AND DaysAfter( due_date, today() ) = 0 AND action_status = " + String( ll_action_status )
			of_filter_actions(ls_filter,ls_user_filter,i)
		case 1		//overdue
			ls_filter =  "active_status = 1 AND DaysAfter( today(), due_date ) < 0 AND action_status = " + String( ll_action_status ) 
			ls_user_filter = " and action_user = '" + gs_user_id + "'"
			of_filter_actions(ls_filter,ls_user_filter,i)
		case 2		//print apps
			ls_filter =  "active_status = 1 AND action_type = " + String( ll_app_out_to_md ) + "  AND action_status = " + String( ll_action_status ) 
			ls_user_filter = " and action_user = '" + gs_user_id + "'"
			of_filter_actions(ls_filter,ls_user_filter,i)
		case 3		//app rcvd prac follow up
			ls_filter =  "active_status = 1 AND action_type = " + String( ll_app_rcvd_prac ) + " AND DaysAfter( today(), due_date ) <= 0 AND action_status = " + String( ll_action_status )  
			ls_user_filter = " and action_user = '" + gs_user_id + "'"
			of_filter_actions(ls_filter,ls_user_filter,i)
		case 4		//particip followup
			ls_filter = "active_status = 1 AND action_type = " + String( ll_par ) + " AND DaysAfter( today(), due_date ) <= 0 AND action_status = " + String( ll_action_status ) 
			ls_user_filter = " and action_user = '" + gs_user_id + "'"
			of_filter_actions(ls_filter,ls_user_filter,i)
		case 5		//expiring creds
			SELECT code_lookup.lookup_code  
			INTO :ll_ver_method_exp_ltr
			FROM code_lookup  
			WHERE ( code_lookup.lookup_name = 'verification method' ) AND  
					( code_lookup.code = 'EXP CRED LTR'  ) ; 
			IF SQLCA.SQLCODE = -1 THEN
				MessageBox("SQL ERROR", SQLCA.SQLERRTEXT)
				RETURN -1
			END IF
			
			SELECT count( distinct verif_info.doc_id)//Start Code Change ---- 05.03.2006 #428 maha added distinct
			 INTO :li_rc
				 FROM verif_info,
						pd_affil_stat,
						security_user_facilities  
				WHERE 
						( security_user_facilities.facility_id = pd_affil_stat.parent_facility_id ) and
						( security_user_facilities.access_rights = 1 ) AND
						( security_user_facilities.user_id = :gs_user_id) and
					  ( verif_info.facility_id = pd_affil_stat.verifying_facility ) and  
						( verif_info.prac_id = pd_affil_stat.prac_id ) and
						( pd_affil_stat.active_status  in (1,4) ) AND
						( verif_info.active_status = 1 ) AND
						
						( verif_info.response_code is null ) AND
						( verif_info.verification_method = :ll_ver_method_exp_ltr ) AND
						( verif_info.print_flag = 1 ) ;
			
			SELECT count( verif_info.doc_id)
			 INTO :li_uc
				 FROM verif_info,
						pd_affil_stat,
						security_user_facilities  
				WHERE 
						( security_user_facilities.facility_id = pd_affil_stat.parent_facility_id ) and
						( security_user_facilities.access_rights = 1 ) AND
						( security_user_facilities.user_id = :gs_user_id) and
					  ( verif_info.facility_id = pd_affil_stat.verifying_facility ) and  
						( verif_info.prac_id = pd_affil_stat.prac_id ) and
						( pd_affil_stat.active_status  in (1,4) ) AND
						( verif_info.active_status = 1 ) AND
						
						( verif_info.response_code is null ) AND
						( verif_info.verification_method = :ll_ver_method_exp_ltr ) AND
						( verif_info.print_flag = 1 and
						verif_info.priority_user = :gs_user_id) ;
		dw_list.setitem(i,"t_count",li_rc)
		dw_list.setitem(i,"u_count",li_uc)		
		
	case 10
		SELECT DISTINCT Count( pd_app_audit.facility_id )
		INTO :li_rc
		FROM pd_app_audit,   
			  data_view_app_audit,   
			  pd_affil_stat,   
			  v_full_name,   
			  facility  
		WHERE ( data_view_app_audit.app_audit_id = pd_app_audit.app_audit_id ) and  
				( pd_affil_stat.apptmnt_type = data_view_app_audit.app_type ) and  
				( pd_affil_stat.rec_id = pd_app_audit.appt_stat_id ) and  
				( pd_app_audit.prac_id = v_full_name.prac_id ) and  
				( pd_app_audit.facility_id = facility.facility_id ) and  
				( ( pd_app_audit.date_completed is null ) AND  
				( pd_affil_stat.active_status in (1,4) ) AND  
				( pd_affil_stat.apptmnt_start_date is null ));
		
		st_miss.Text = "There Are " + String( li_miss_info_cnt ) + " Missing Information Items"
		
		SELECT DISTINCT Count( pd_app_audit.facility_id )
		INTO :li_uc
		FROM pd_app_audit,   
			  data_view_app_audit,   
			  pd_affil_stat,   
			  v_full_name,   
			  facility  
		WHERE ( data_view_app_audit.app_audit_id = pd_app_audit.app_audit_id ) and  
				( pd_affil_stat.apptmnt_type = data_view_app_audit.app_type ) and  
				( pd_affil_stat.rec_id = pd_app_audit.appt_stat_id ) and  
				( pd_app_audit.prac_id = v_full_name.prac_id ) and  
				( pd_app_audit.facility_id = facility.facility_id ) and  
				( ( pd_app_audit.date_completed is null ) AND  
				( pd_affil_stat.active_status in (1,4) ) AND  
				( pd_affil_stat.apptmnt_start_date is null )
				and pd_affil_stat.priority_user = :gs_user_id) ;
		
		dw_list.setitem(i,"t_count",li_rc)
		dw_list.setitem(i,"u_count",li_uc)
		
	end choose

next
		


st_u_audit.text = string(li_exp_ltr_cnt)
//End Code Change---02.22.2006
st_time.Text = "Last refreshed " + String( Now( ), "hh:mm" )

//Application Not Back From Provider
//li_nr = dwchild.InsertRow( 0 )
//dwchild.SetItem( li_nr, "filter_code", "Applications Not Back From Provider" )
//dwchild.SetItem( li_nr, "filter_description", "Displays a list of App Rcvd Prac Action Item that are overdue." )
//dwchild.SetItem( li_nr, "filter_syntax", "active_status = 1 AND action_type = " + String( ll_app_rcvd_prac ) + " AND DaysAfter( today(), due_date ) <= 0 AND action_status = " + String( ll_action_status )  )
//dwchild.SetItem( li_nr, "filter_index", 2  )
//
////Items Due in the next 7 days
//li_nr = dwchild.InsertRow( 0 )
//dwchild.SetItem( li_nr, "filter_code", "Items Due in the next 7 days" )
//dwchild.SetItem( li_nr, "filter_description", "Displays a list of Action Item that are due in the next 7 days." )
//dwchild.SetItem( li_nr, "filter_syntax", "active_status = 1 AND DaysAfter( today(), due_date ) >= 0 AND DaysAfter( RelativeDate(today(),7), due_date ) <= 7 AND action_status = " + String( ll_action_status )  )
//dwchild.SetItem( li_nr, "filter_index", 4  )
setpointer(arrow!)

Return 1

end function

public function integer of_get_actions ();//Start Code Change ---- 10.04.2006 #639 maha

integer i
integer ic
integer li_prod
integer li_app
string ls_filt
string ls_type


dw_data.settransobject(sqlca)
ic = dw_data.retrieve()

if ic < 1 then return -1

li_prod = of_get_app_setting("set_9","I")
li_app = of_get_app_setting("set_iapps","I")

if li_prod = 0 and li_app = 1 then //cred w/apps
	ls_filt = "B"
elseif li_prod = 1 then //intellapp
	ls_filt = "A"
else   //intellicred
	ls_filt = "C"
end if


//must program for security rights.
for i = 1 to ic
	ls_type = dw_data.getitemstring(i,"task_type")
	
	choose case ls_type
		case "B"
			dw_data.rowscopy( i, i, primary!, dw_list, 1000, primary!)
		case "A"
			if ls_filt = "A" or ls_filt = "B" then
				dw_data.rowscopy( i, i, primary!, dw_list, 1000, primary!)
			end if
		case "C"
			if ls_filt = "C" or ls_filt = "B" then
				dw_data.rowscopy( i, i, primary!, dw_list, 1000, primary!)
			end if
			
	end choose
next






return 1
end function

public function integer of_filter_actions (string as_filter, string as_user, integer ai_row);long li_rc
long li_uc

dw_query.SetFilter( as_filter )
dw_query.Filter( )
li_rc = dw_query.RowCount( )
dw_query.SetFilter( as_filter + as_user)
dw_query.Filter( )
li_uc = dw_query.RowCount( )
dw_list.setitem(ai_row,"t_count",li_rc)
dw_list.setitem(ai_row,"u_count",li_uc)

return 1








end function

on pfc_cst_u_dashboard_2006.create
this.dw_data=create dw_data
this.dw_list=create dw_list
this.st_u_audit=create st_u_audit
this.st_u_over=create st_u_over
this.st_u_print=create st_u_print
this.st_u_follow=create st_u_follow
this.st_u_part=create st_u_part
this.st_u_exp=create st_u_exp
this.st_u_today=create st_u_today
this.st_user=create st_user
this.st_ai_due_today=create st_ai_due_today
this.st_time=create st_time
this.cb_1=create cb_1
this.dw_query=create dw_query
this.cbx_1=create cbx_1
this.st_miss=create st_miss
this.ddplb_1=create ddplb_1
this.st_1=create st_1
this.st_print=create st_print
this.st_ai_prac_follow_up=create st_ai_prac_follow_up
this.st_ai_par=create st_ai_par
this.st_expiring=create st_expiring
this.st_6=create st_6
this.st_7=create st_7
this.st_9=create st_9
this.st_ai_over_due=create st_ai_over_due
this.p_1=create p_1
this.uo_1=create uo_1
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.dw_data,&
this.dw_list,&
this.st_u_audit,&
this.st_u_over,&
this.st_u_print,&
this.st_u_follow,&
this.st_u_part,&
this.st_u_exp,&
this.st_u_today,&
this.st_user,&
this.st_ai_due_today,&
this.st_time,&
this.cb_1,&
this.dw_query,&
this.cbx_1,&
this.st_miss,&
this.ddplb_1,&
this.st_1,&
this.st_print,&
this.st_ai_prac_follow_up,&
this.st_ai_par,&
this.st_expiring,&
this.st_6,&
this.st_7,&
this.st_9,&
this.st_ai_over_due,&
this.p_1,&
this.uo_1,&
this.gb_1,&
this.gb_2}
end on

on pfc_cst_u_dashboard_2006.destroy
destroy(this.dw_data)
destroy(this.dw_list)
destroy(this.st_u_audit)
destroy(this.st_u_over)
destroy(this.st_u_print)
destroy(this.st_u_follow)
destroy(this.st_u_part)
destroy(this.st_u_exp)
destroy(this.st_u_today)
destroy(this.st_user)
destroy(this.st_ai_due_today)
destroy(this.st_time)
destroy(this.cb_1)
destroy(this.dw_query)
destroy(this.cbx_1)
destroy(this.st_miss)
destroy(this.ddplb_1)
destroy(this.st_1)
destroy(this.st_print)
destroy(this.st_ai_prac_follow_up)
destroy(this.st_ai_par)
destroy(this.st_expiring)
destroy(this.st_6)
destroy(this.st_7)
destroy(this.st_9)
destroy(this.st_ai_over_due)
destroy(this.p_1)
destroy(this.uo_1)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event constructor;//get the list filtered by program setting and user rights.
//for each row get system and user counts

of_query( )
end event

type dw_data from datawindow within pfc_cst_u_dashboard_2006
boolean visible = false
integer x = 1394
integer y = 1224
integer width = 389
integer height = 136
integer taborder = 30
string title = "none"
string dataobject = "d_task_data_items"
boolean livescroll = true
end type

type dw_list from u_dw within pfc_cst_u_dashboard_2006
integer x = 23
integer y = 28
integer width = 1856
integer height = 1168
integer taborder = 20
string dataobject = "d_task_data_items"
borderstyle borderstyle = stylebox!
end type

event constructor;call super::constructor;this.settransobject(sqlca)

end event

type st_u_audit from statictext within pfc_cst_u_dashboard_2006
integer x = 4750
integer y = 712
integer width = 174
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 16777215
string text = "none"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_u_over from statictext within pfc_cst_u_dashboard_2006
integer x = 4750
integer y = 260
integer width = 174
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 16777215
string text = "none"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_u_print from statictext within pfc_cst_u_dashboard_2006
integer x = 4750
integer y = 352
integer width = 174
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 16777215
string text = "none"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_u_follow from statictext within pfc_cst_u_dashboard_2006
integer x = 4750
integer y = 440
integer width = 174
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 16777215
string text = "none"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_u_part from statictext within pfc_cst_u_dashboard_2006
integer x = 4750
integer y = 532
integer width = 174
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 16777215
string text = "none"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_u_exp from statictext within pfc_cst_u_dashboard_2006
integer x = 4750
integer y = 624
integer width = 174
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 16777215
string text = "none"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_u_today from statictext within pfc_cst_u_dashboard_2006
integer x = 4750
integer y = 172
integer width = 174
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 16777215
string text = "none"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_user from statictext within pfc_cst_u_dashboard_2006
integer x = 4576
integer y = 60
integer width = 361
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 16777215
string text = "user"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_ai_due_today from statictext within pfc_cst_u_dashboard_2006
integer x = 3223
integer y = 172
integer width = 1477
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean underline = true
long textcolor = 16711680
long backcolor = 16777215
string text = "You have # Application Status action items due Today"
boolean focusrectangle = false
end type

event clicked;//w_mdi.SetRedraw( false )
//IF gs_cust_type = "I" THEN
//	IF Not IsValid( w_action_items_ia ) THEN
//		OpenSheetWithParm( w_action_items_ia, 99, w_mdi, 4, Layered! )
//	END IF
//	w_action_items_ia.ii_dashboard_macro = 0
//	w_action_items_ia.Event pfc_postopen( )	
//ELSE
//	//OpenSheet( w_action_items,  w_mdi, 4)
//END IF
//
//w_dash.WindowState = Minimized!
of_run_action(0)
end event

type st_time from statictext within pfc_cst_u_dashboard_2006
integer x = 347
integer y = 1236
integer width = 672
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 8421504
long backcolor = 16777215
string text = "Last Refreshed 10:00am"
boolean focusrectangle = false
end type

type cb_1 from commandbutton within pfc_cst_u_dashboard_2006
integer x = 87
integer y = 1232
integer width = 247
integer height = 72
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Refresh"
end type

event clicked;of_query( )
end event

type dw_query from datawindow within pfc_cst_u_dashboard_2006
boolean visible = false
integer x = 1477
integer y = 696
integer width = 311
integer height = 200
integer taborder = 40
string dataobject = "d_net_dev_action_items"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cbx_1 from checkbox within pfc_cst_u_dashboard_2006
boolean visible = false
integer x = 123
integer y = 724
integer width = 759
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 16777215
string text = "Automatically retrieve on open"
boolean checked = true
end type

type st_miss from statictext within pfc_cst_u_dashboard_2006
integer x = 3223
integer y = 712
integer width = 1531
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean underline = true
long textcolor = 16711680
long backcolor = 16777215
string text = "You have # Missing Information Items"
boolean focusrectangle = false
end type

event clicked;//IF gs_cust_type = "I" THEN
//	IF Not IsValid( w_action_items_ia ) THEN
//		OpenSheetWithParm( w_action_items_ia, 99, w_mdi, 4, Layered! )
//	END IF
//	w_action_items_ia.ii_dashboard_macro = 10
//	w_action_items_ia.Event pfc_postopen( )	
//ELSE
//	//OpenSheet( w_action_items,  w_mdi, 4)
//END IF
//
//w_dash.WindowState = Minimized!
of_run_action(10)
end event

type ddplb_1 from dropdownpicturelistbox within pfc_cst_u_dashboard_2006
boolean visible = false
integer x = 78
integer y = 84
integer width = 1783
integer height = 728
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
string picturename[] = {"Custom039!"}
long picturemaskcolor = 536870912
end type

type st_1 from statictext within pfc_cst_u_dashboard_2006
boolean visible = false
integer x = 73
integer y = 20
integer width = 549
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 16777215
boolean enabled = false
string text = "Go to Practitioner Folder"
boolean focusrectangle = false
end type

type st_print from statictext within pfc_cst_u_dashboard_2006
integer x = 3223
integer y = 352
integer width = 1486
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean underline = true
long textcolor = 16711680
long backcolor = 16777215
string text = "You have # Applications to print"
boolean focusrectangle = false
end type

event clicked;
Open( w_IntelliApp_Print )
w_intelliapp_print.uo_print.ii_open_from_dash = 0
w_intelliapp_print.uo_print.tab_1.tabpage_pl.cb_add.Event Clicked( )

//IF IsValid( w_dash ) THEN
//	w_dash.WindowState = Minimized!
//END IF
end event

type st_ai_prac_follow_up from statictext within pfc_cst_u_dashboard_2006
integer x = 3223
integer y = 440
integer width = 1531
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean underline = true
long textcolor = 16711680
long backcolor = 16777215
string text = "You have # App Rcvd Prac follow letters to send"
boolean focusrectangle = false
end type

event clicked;//IF gs_cust_type = "I" THEN
//	IF Not IsValid( w_action_items_ia ) THEN
//		OpenSheetWithParm( w_action_items_ia, 99, w_mdi, 4, Layered! )
//	END IF
//	w_action_items_ia.ii_dashboard_macro = 3
//	w_action_items_ia.Event pfc_postopen( )	
//ELSE
//	//OpenSheet( w_action_items,  w_mdi, 4)
//END IF
//
//w_dash.WindowState = Minimized!
of_run_action(3)
end event

type st_ai_par from statictext within pfc_cst_u_dashboard_2006
integer x = 3223
integer y = 532
integer width = 1531
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean underline = true
long textcolor = 16711680
long backcolor = 16777215
string text = "You have # Participation follow letters to send"
boolean focusrectangle = false
end type

event clicked;//IF gs_cust_type = "I" THEN
//	IF Not IsValid( w_action_items_ia ) THEN
//		OpenSheetWithParm( w_action_items_ia, 99, w_mdi, 4, Layered! )
//	END IF
//	w_action_items_ia.ii_dashboard_macro = 4
//	w_action_items_ia.Event pfc_postopen( )	
//ELSE
//	//OpenSheet( w_action_items,  w_mdi, 4)
//END IF
//
//w_dash.WindowState = Minimized!
of_run_action(4)
end event

type st_expiring from statictext within pfc_cst_u_dashboard_2006
integer x = 3218
integer y = 620
integer width = 1531
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean underline = true
long textcolor = 16711680
long backcolor = 16777215
string text = "You have # Expiring letters to send"
boolean focusrectangle = false
end type

event clicked;//IF gs_cust_type = "I" THEN
//	IF Not IsValid( w_action_items_ia ) THEN
//		OpenSheetWithParm( w_action_items_ia, 99, w_mdi, 4, Layered! )
//	END IF
//	w_action_items_ia.ii_dashboard_macro = 5
//	w_action_items_ia.Event pfc_postopen( )	
//ELSE
//	//OpenSheet( w_action_items,  w_mdi, 4)
//END IF
//
//w_dash.WindowState = Minimized!
of_run_action(5)
end event

type st_6 from statictext within pfc_cst_u_dashboard_2006
integer x = 3223
integer y = 1096
integer width = 1157
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean underline = true
long textcolor = 8388736
long backcolor = 16777215
string text = "Application Status Report by Plan"
boolean focusrectangle = false
end type

event clicked;//w_mdi.SetRedraw( false )
//IF gs_cust_type = "I" THEN
//	IF Not IsValid( w_action_items_ia ) THEN
//		OpenSheetWithParm( w_action_items_ia, 99, w_mdi, 4, Layered! )
//	END IF
//	w_action_items_ia.ii_dashboard_macro = 7
//	w_action_items_ia.Event pfc_postopen( )	
//ELSE
//	//OpenSheet( w_action_items,  w_mdi, 4)
//END IF
//
//w_dash.WindowState = Minimized!
of_run_action(7)
end event

type st_7 from statictext within pfc_cst_u_dashboard_2006
integer x = 3223
integer y = 1004
integer width = 1303
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean underline = true
long textcolor = 8388736
long backcolor = 16777215
string text = "Application Status Report by Practitioner"
boolean focusrectangle = false
end type

event clicked;////w_mdi.SetRedraw( false )
//IF gs_cust_type = "I" THEN
//	IF Not IsValid( w_action_items_ia ) THEN
//		OpenSheetWithParm( w_action_items_ia, 99, w_mdi, 4, Layered! )
//	END IF
//	w_action_items_ia.ii_dashboard_macro = 6
//	w_action_items_ia.Event pfc_postopen( )	
//ELSE
//	//OpenSheet( w_action_items,  w_mdi, 4)
//END IF
//
//w_dash.WindowState = Minimized!
of_run_action(6)
end event

type st_9 from statictext within pfc_cst_u_dashboard_2006
boolean visible = false
integer x = 123
integer y = 1140
integer width = 1303
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean underline = true
long textcolor = 8388736
long backcolor = 16777215
string text = "Plan Participation Status Report"
boolean focusrectangle = false
end type

event clicked;of_run_action(8)
end event

type st_ai_over_due from statictext within pfc_cst_u_dashboard_2006
integer x = 3223
integer y = 260
integer width = 1477
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean underline = true
long textcolor = 16711680
long backcolor = 16777215
string text = "You have # Application Status action items over due"
boolean focusrectangle = false
end type

event clicked;//w_mdi.SetRedraw( false )
//IF gs_cust_type = "I" THEN
//	IF Not IsValid( w_action_items_ia ) THEN
//		OpenSheetWithParm( w_action_items_ia, 99, w_mdi, 4, Layered! )
//	END IF
//	w_action_items_ia.ii_dashboard_macro = 1
//	w_action_items_ia.Event pfc_postopen( )	
//ELSE
//	//OpenSheet( w_action_items,  w_mdi, 4)
//END IF
//
//w_dash.WindowState = Minimized!
of_run_action(1)
end event

type p_1 from picture within pfc_cst_u_dashboard_2006
integer x = 562
integer y = 1660
integer width = 2194
integer height = 1536
string picturename = "logo.bmp"
boolean focusrectangle = false
end type

type uo_1 from uo_clock within pfc_cst_u_dashboard_2006
integer x = 59
integer y = 1620
integer width = 434
integer height = 376
integer taborder = 20
borderstyle borderstyle = styleraised!
end type

on uo_1.destroy
call uo_clock::destroy
end on

type gb_1 from groupbox within pfc_cst_u_dashboard_2006
integer x = 3163
integer y = 108
integer width = 1774
integer height = 824
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 16777215
string text = "Action Items"
end type

type gb_2 from groupbox within pfc_cst_u_dashboard_2006
integer x = 3173
integer y = 924
integer width = 1774
integer height = 312
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 16777215
string text = "Reports"
end type

