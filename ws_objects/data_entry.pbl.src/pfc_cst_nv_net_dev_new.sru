$PBExportHeader$pfc_cst_nv_net_dev_new.sru
forward
global type pfc_cst_nv_net_dev_new from userobject
end type
type tab_1 from tab within pfc_cst_nv_net_dev_new
end type
type tabpage_ai from userobject within tab_1
end type
type dw_net_dev from u_dw within tabpage_ai
end type
type tabpage_ai from userobject within tab_1
dw_net_dev dw_net_dev
end type
type tabpage_ids from userobject within tab_1
end type
type dw_ids from u_dw within tabpage_ids
end type
type tabpage_ids from userobject within tab_1
dw_ids dw_ids
end type
type tabpage_notes from userobject within tab_1
end type
type dw_notes from u_dw within tabpage_notes
end type
type tabpage_notes from userobject within tab_1
dw_notes dw_notes
end type
type tabpage_report from userobject within tab_1
end type
type cb_export from commandbutton within tabpage_report
end type
type rb_par_sum from radiobutton within tabpage_report
end type
type rb_ai_wn from radiobutton within tabpage_report
end type
type rb_par from radiobutton within tabpage_report
end type
type rb_ai from radiobutton within tabpage_report
end type
type dw_report_data from u_dw within tabpage_report
end type
type tabpage_report from userobject within tab_1
cb_export cb_export
rb_par_sum rb_par_sum
rb_ai_wn rb_ai_wn
rb_par rb_par
rb_ai rb_ai
dw_report_data dw_report_data
end type
type tab_1 from tab within pfc_cst_nv_net_dev_new
tabpage_ai tabpage_ai
tabpage_ids tabpage_ids
tabpage_notes tabpage_notes
tabpage_report tabpage_report
end type
end forward

global type pfc_cst_nv_net_dev_new from userobject
integer width = 2789
integer height = 1532
boolean border = true
long backcolor = 79741120
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event pfc_cst_print_net_dev_ltr ( )
event pfc_cst_print_net_dev_report ( )
event pfc_cst_net_dev_filter ( )
event pfc_cst_print_apps_from_pf ( )
event pfc_cst_refresh_net_dev_ai ( )
event pfc_cst_make_inactive ( )
event pfc_cst_make_active ( )
tab_1 tab_1
end type
global pfc_cst_nv_net_dev_new pfc_cst_nv_net_dev_new

type variables
Boolean lb_from_prac_folder = False

Long il_prac_id
Long il_last_prac_id
Long il_rec_id
Long il_app_id

Integer ii_facility_id

String is_sql = ''
String is_filter_sql = ''

String Is_group_by = "Practitioner"

Boolean ib_filter_set = False
Boolean ib_status_with_notes = False

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 11.03.2006 By: Jervis
//$<reason> 
str_action_item	istr_action[]
//---------------------------- APPEON END ----------------------------

//12.5.2006 by Jervis
string is_prior


end variables

forward prototypes
public function integer of_gen_ltr ()
public function integer of_set_facility_id (integer ai_facility_id)
public function integer of_set_prac_id (long al_prac_id)
public function integer of_sql ()
public function integer of_retrieve_detail (integer ai_facility_id)
public function integer of_gen_report ()
public function integer of_reset ()
public function long of_set_rec_id (long al_rec_id)
public function integer of_filter (string as_from, u_dw adw_filter)
public function integer of_print_apps ()
public function integer of_clear_filter ()
public function integer of_set_active_status (integer ai_active_status)
public function integer of_report_selected (string as_report)
public function integer of_set_next_due_date (string as_action_type)
end prototypes

event pfc_cst_print_net_dev_ltr;
of_gen_ltr()
end event

event pfc_cst_print_net_dev_report;of_gen_report()
end event

event pfc_cst_net_dev_filter();//Start Code Change ----12.02.2008 #V85 maha - passed parm to set in open event
//Open( w_net_dev_filter)
//IF gs_cust_type = "I" THEN
//	w_net_dev_filter.is_open_from1 = "PFI"
//ELSE
//	w_net_dev_filter.is_open_from1 = "PFC"	
//END IF
//
string ls_pass

IF gs_cust_type = "I" THEN
	ls_pass = "PFI"
ELSE
	ls_pass = "PFC"	
END IF

Openwithparm( w_net_dev_filter,ls_pass )
//End Code Change---12.02.2008
end event

event pfc_cst_print_apps_from_pf;of_print_apps()
end event

event pfc_cst_refresh_net_dev_ai;of_retrieve_detail( ii_facility_id )
end event

event pfc_cst_make_inactive;of_set_active_status( 3 )
end event

event pfc_cst_make_active;of_set_active_status( 1 )
end event

public function integer of_gen_ltr ();Long ll_prac_id[]
Long ll_action_type[]
Long ll_action_status[]
Long ll_temp_id
Boolean ll_found_id
Integer li_app_ids[]
Integer p
Integer i
Integer li_rc
Integer li_cnt
Integer li_cnt_2
Integer li_cnt_3
Integer li_temp_facility_id
Integer li_facility_ids[] 

tab_1.tabpage_ai.dw_net_dev.AcceptText()

li_rc = tab_1.tabpage_ai.dw_net_dev.RowCount()

ll_temp_id = 0
FOR i = 1 TO li_rc
	ll_temp_id = tab_1.tabpage_ai.dw_net_dev.GetItemNumber( i, "facility_id" )
	IF ll_temp_id = 0 THEN
		Continue
	END IF		
	ll_found_id = False
	FOR p = 1 TO UpperBound( li_facility_ids )
		IF li_facility_ids[ p ] = ll_temp_id THEN
			ll_found_id = True
		END IF
	END FOR
	IF ll_found_id = False THEN
		li_cnt_2++
		li_facility_ids[ li_cnt_2 ] = ll_temp_id
		//messagebox(string(li_cnt_2 ), ll_temp_id )
	END IF
END FOR	


ll_temp_id = 0
FOR i = 1 TO li_rc
	ll_temp_id = tab_1.tabpage_ai.dw_net_dev.GetItemNumber( i, "app_id" )
	IF ll_temp_id = 0 THEN
		Continue
	END IF		
	ll_found_id = False
	FOR p = 1 TO UpperBound( li_app_ids )
		IF li_app_ids[ p ] = ll_temp_id THEN
			ll_found_id = True
		END IF
	END FOR
	IF ll_found_id = False THEN
		li_cnt_3++
		li_app_ids[ li_cnt_3 ] = ll_temp_id
		//messagebox(string(li_cnt_2 ), ll_temp_id )
	END IF
END FOR	


IF NOT lb_from_prac_folder THEN
	li_rc = tab_1.tabpage_ai.dw_net_dev.RowCount()
	IF li_rc = 0 THEN
		MessageBox("Selection Error", "Nothing selected to print." )
		Return -1
	END IF	
	li_cnt=0
	FOR i = 1 TO li_rc
		IF li_cnt = 0 THEN
			li_temp_facility_id = tab_1.tabpage_ai.dw_net_dev.GetItemNumber( i, "facility_id" )
		ELSE
			//IF tab_1.tabpage_ai.dw_net_dev.GetItemNumber( i, "facility_id" ) <> li_temp_facility_id THEN
			//	MessageBox("Selection Error", "You can only print letters for groups of practitioners in the same facility." )
			//	Return -1
			//END IF
		END IF
		li_cnt++
		ll_prac_id[ li_cnt ] = tab_1.tabpage_ai.dw_net_dev.GetItemNumber( i, "prac_id" )
		//messagebox("prac_ids", ll_prac_id[li_cnt])
		//--------------------------- APPEON BEGIN ---------------------------
		//$<modify> 11.24.2006 By: Jervis
		//$<reason> 
		//ll_action_type[ li_cnt ] = tab_1.tabpage_ai.dw_net_dev.GetItemNumber( i, "action_type" )
		//ll_action_status[ li_cnt ] = tab_1.tabpage_ai.dw_net_dev.GetItemNumber( i, "action_status" )		
		//---------------------------- APPEON END ----------------------------

		
	END FOR
ELSE
	ll_prac_id[ 1 ] = il_prac_id
	li_temp_facility_id = ii_facility_id	
	//li_facility_ids[ 1 ] = ii_facility_id
END IF

Open( w_letter_generator )

w_letter_generator.SetRedraw( False )

IF lb_from_prac_folder THEN
	w_letter_generator.ib_from_prac_folder=True
ELSE
	w_letter_generator.ib_from_prac_folder=False
END IF

ii_facility_id = li_temp_facility_id

//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 11.24.2006 By: Jervis
//$<reason> 
//w_letter_generator.of_Net_Dev_Ltr( ll_prac_id[], li_facility_ids[], ll_action_type[], ll_action_status[], li_app_ids[] )
w_letter_generator.of_Net_Dev_Ltr( ll_prac_id[], li_facility_ids[], li_app_ids[] ,tab_1.tabpage_ai.dw_net_dev)
//---------------------------- APPEON END ----------------------------




Return 0
end function

public function integer of_set_facility_id (integer ai_facility_id);ii_facility_id = ai_facility_id

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-01
//$<comment> 03.28.2006 By: LeiWei
//$<reason> Performance tuning
//$<modification> Move the following script to the Constructor event of pfc_cst_nv_net_dev_new. 
//$<modification> This modification reduces client-server interactions since the script will only be
//$<modification> executed and retrieve data from the database once. Refer to PT-09 for more information.
/*

DataWindowChild dwchild


of_sql()

//setup dw_net_dev datawindow
tab_1.tabpage_ai.dw_net_dev.of_SetRowManager( TRUE )
tab_1.tabpage_ai.dw_net_dev.of_SetReqColumn(TRUE)
tab_1.tabpage_ai.dw_net_dev.of_SetTransObject(SQLCA)



//jad 05/14/02  created special lookup for action type so they can select the name they want in custom_1 field of lookup table
//tab_1.tabpage_ai.dw_net_dev.GetChild( "action_type", dwchild )
//dwchild.SetTransObject( SQLCA )
//dwchild.Retrieve("Action Type")
//


tab_1.tabpage_ai.dw_net_dev.GetChild( "action_dept", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("Action Department")

tab_1.tabpage_ai.dw_net_dev.GetChild( "action_status", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("Action Status")

tab_1.tabpage_report.dw_report_data.GetChild( "app_id", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve( )	

tab_1.tabpage_report.dw_report_data.GetChild( "action_dept", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("Action Department")

tab_1.tabpage_report.dw_report_data.GetChild( "action_type", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("Action Type")

tab_1.tabpage_report.dw_report_data.GetChild( "action_status", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("Action Status")

// mskinner 22 March 2006 - causing a crash
//IF F_VALIDSTR(tab_1.tabpage_ai.dw_net_dev.DATAOBJECT) THEN 
//tab_1.tabpage_ai.dw_net_dev.of_SetDropDownCalendar( TRUE )
//tab_1.tabpage_ai.dw_net_dev.iuo_calendar.of_Register(tab_1.tabpage_ai.dw_net_dev.iuo_calendar.DDLB)
//END IF
//
// mskinner 22 March 2006 - end causung a crash


////setup filter data window
//tab_1.tabpage_ai.dw_filter.of_SetUpdateAble( False )
//
//tab_1.tabpage_ai.dw_filter.InsertRow( 0 )
//
//
//tab_1.tabpage_ai.dw_filter.of_SetRowManager( TRUE )
//tab_1.tabpage_ai.dw_filter.of_SetReqColumn(TRUE)
//tab_1.tabpage_ai.dw_filter.of_SetTransObject(SQLCA)
//
//tab_1.tabpage_ai.dw_filter.GetChild( "action_type", dwchild )
//dwchild.SetTransObject( SQLCA )
//dwchild.Retrieve("Action Type")
//dwchild.InsertRow( 1 )
//dwchild.SetItem( 1, "code", "ALL" )
//dwchild.SetItem( 1, "lookup_code", 0 )
//
//tab_1.tabpage_ai.dw_filter.GetChild( "action_dept", dwchild )
//dwchild.SetTransObject( SQLCA )
//dwchild.Retrieve("Action Department")
//dwchild.InsertRow( 1 )
//dwchild.SetItem( 1, "code", "ALL" )
//dwchild.SetItem( 1, "lookup_code", 0 )
//
//tab_1.tabpage_ai.dw_filter.GetChild( "action_status", dwchild )
//dwchild.SetTransObject( SQLCA )
//dwchild.Retrieve("Action Status")
//dwchild.InsertRow( 1 )
//dwchild.SetItem( 1, "code", "ALL" )
//dwchild.SetItem( 1, "lookup_code", 0 )
//
//tab_1.tabpage_ai.dw_filter.GetChild( "action_user", dwchild )
//dwchild.SetTransObject( SQLCA )
//dwchild.Retrieve()
//dwchild.InsertRow( 1 )
//dwchild.SetItem( 1, "user_id", "ALL" )
//
//tab_1.tabpage_ai.dw_filter.SetItem( 1, "action_type", 0 )
//tab_1.tabpage_ai.dw_filter.SetItem( 1, "action_dept", 0 )
//tab_1.tabpage_ai.dw_filter.SetItem( 1, "action_user", "ALL" )
//tab_1.tabpage_ai.dw_filter.SetItem( 1, "action_status", 0 )
// mskinner 22 March 2006 - causing a crash
//tab_1.tabpage_ai.dw_filter.of_SetDropDownCalendar( TRUE )
//tab_1.tabpage_ai.dw_filter.iuo_calendar.of_Register(tab_1.tabpage_ai.dw_filter.iuo_calendar.DDLB)
// mskinner 22 March 2006 - causing a crash


//setup ids datawindow

tab_1.tabpage_ids.dw_ids.of_SetRowManager( TRUE )
tab_1.tabpage_ids.dw_ids.of_SetReqColumn(TRUE)
tab_1.tabpage_ids.dw_ids.of_SetTransObject(SQLCA)

tab_1.tabpage_ids.dw_ids.GetChild( "plan_type", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("Plan Type")

//tab_1.tabpage_ids.dw_ids.of_SetDropDownCalendar( TRUE )
//tab_1.tabpage_ids.dw_ids.iuo_calendar.of_Register(tab_1.tabpage_ids.dw_ids.iuo_calendar.DDLB)
//
//added tier field to net_dev_ids   -   12/16/02
tab_1.tabpage_ids.dw_ids.GetChild( "Tier", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("Tier")
*/
//---------------------------- APPEON END ----------------------------


Return 0
end function

public function integer of_set_prac_id (long al_prac_id);il_prac_id = al_prac_id

//of_sql()

lb_from_prac_folder = True



tab_1.tabpage_ai.dw_net_dev.Modify("DataWindow.Header.1.Height='0'")

Return 0
end function

public function integer of_sql ();tab_1.tabpage_ai.dw_net_dev.Reset()
if lb_from_prac_folder then //maha 063005 bypass if action items
	tab_1.tabpage_ai.dw_net_dev.DataObject = "d_net_dev_action_items_no_group"
end if
tab_1.tabpage_ai.dw_net_dev.SetTransObject( SQLCA )
is_sql = tab_1.tabpage_ai.dw_net_dev.GetSqlSelect()

Return 0
end function

public function integer of_retrieve_detail (integer ai_facility_id);//IF ii_facility_id = ai_facility_id THEN
//	Return 0
//END IF

//messagebox("", "retrieving detail")

Integer li_rc
Integer li_retval
Integer li_facility_id
String ls_sql
ls_sql = is_sql
//messagebox("is_sql",is_sql)
ii_facility_id = ai_facility_id

//messagebox("ii_facility_id",ii_facility_id)
IF lb_from_prac_folder THEN //from practitioner appl status
	IF ib_filter_set THEN
		ls_sql = ls_sql + is_filter_sql
	END IF
	ls_sql = ls_sql + " AND net_dev_action_items.prac_id = " + String( il_prac_id ) 

	IF lb_from_prac_folder THEN //maha 063005
		IF ii_facility_id > 0 THEN
			ls_sql = ls_sql + " AND net_dev_action_items.facility_id = " + String( ai_facility_id )
			tab_1.tabpage_ai.dw_net_dev.Modify( "facility_name.height = '0'" )
			tab_1.tabpage_ai.dw_net_dev.Modify( "facility_name.width = '0'" )			
		ELSE
			tab_1.tabpage_ai.dw_net_dev.Modify( "facility_name.height = '56'" )
			tab_1.tabpage_ai.dw_net_dev.Modify( "facility_name.width = '2583'" )		
		END IF
	end if
	//--------------------------- APPEON BEGIN ---------------------------
	//$<modify> 2005-11-09 By: Cao YongWang
	//$<reason> Replaced setsqlselect function with modify function
	//	tab_1.tabpage_ai.dw_net_dev.SetSqlSelect( ls_sql )
	//tab_1.tabpage_ai.dw_net_dev.modify('datawindow.table.select = "' +  ls_sql + '"')
	tab_1.tabpage_ai.dw_net_dev.modify("datawindow.table.select = '" +  ls_sql + "'") //Modified by Ken.Guo on 2008-10-23. Must use single quotation marks.
	//---------------------------- APPEON END ----------------------------
	tab_1.tabpage_ai.dw_net_dev.Modify( "DataWindow.Table.UpdateTable='net_dev_action_items'" )
ELSE //from action items
	IF ii_facility_id > 0 THEN
		ls_sql = ls_sql + " AND net_dev_action_items.facility_id = " + String( ai_facility_id ) //maha 063005 active status added to the sql query + " AND net_dev_action_items.active_status = 1"
	END IF
	
	//--------------------------- APPEON BEGIN ---------------------------
	//$<modify> 2005-11-09 By: Zhang Lingping
	//$<reason> Replaced setsqlselect function with modify function
	//	tab_1.tabpage_ai.dw_net_dev.SetSqlSelect( ls_sql )	
	//tab_1.tabpage_ai.dw_net_dev.modify('datawindow.table.select = "' +  ls_sql + '"')
	tab_1.tabpage_ai.dw_net_dev.modify("datawindow.table.select = '" +  ls_sql + "'") //Modified by Ken.Guo on 2008-10-23. Must use single quotation marks.
	//---------------------------- APPEON END ----------------------------
END IF

//messagebox("net dev retrieve",ls_sql)
//clipboard( ls_sql )
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-02
//$<add> 02.15.2006 By: Cao YongWang
//$<reason> Performance tuning.
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.
//---------------------------- APPEON END ----------------------------
//gnv_appeondb.of_startqueue() - alfee 12.11.2008

li_rc = tab_1.tabpage_ai.dw_net_dev.Retrieve( )
if li_rc < 0 then messagebox("of_retrieve_detail","Retrieve failed, Contact ContractLogix Support") //alfee 12.11.2008
//if li_rc < 1 then messagebox("of_retrieve_detail","Retrieve failed, Contact IntelliSoft Support") ////Start Code Change ----11.10.2008 #V85 maha - trap added 
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-03
//$<add> 02.15.2006 By: Cao YongWang
//$<reason> Performance tuning.
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.
gnv_appeondb.of_startqueue() //alfee 12.11.2008

IF lb_from_prac_folder THEN 
	tab_1.tabpage_notes.dw_notes.Retrieve( il_prac_id )
	tab_1.tabpage_ids.dw_ids.Retrieve( il_prac_id )
End If

gnv_appeondb.of_commitqueue()
li_rc = tab_1.tabpage_ai.dw_net_dev.Rowcount()
//---------------------------- APPEON END ----------------------------

IF li_rc = 0 THEN
	tab_1.tabpage_ai.dw_net_dev.InsertRow( 0 )
	//tab_1.tabpage_notes.dw_notes.InsertRow( 0 )		
END IF

IF lb_from_prac_folder THEN //maha 063005 added this line for only in prac folder
	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> PT-04
	//$<modify> 02.15.2006 By: Cao YongWang
	//$<reason> Performance tuning.
	//$<modification> Comment out the following script since it has been moved to Appeon
	//$<modification> Queue labels in previous script.
	/*
	li_rc = tab_1.tabpage_notes.dw_notes.Retrieve( il_prac_id )	
	*/
	li_rc = tab_1.tabpage_notes.dw_notes.Rowcount()	
	//---------------------------- APPEON END ----------------------------
	IF li_rc = 0 THEN
		tab_1.tabpage_notes.dw_notes.InsertRow( 0 )		
	END IF
   //--------------------------- APPEON BEGIN ---------------------------
	//$<ID> PT-05
	//$<modify> 02.15.2006 By: Cao YongWang
	//$<reason> Performance tuning.
	//$<modification> Comment out the following script since it has been moved to Appeon
	//$<modification> Queue labels in previous script.
	/*
	li_rc = tab_1.tabpage_ids.dw_ids.Retrieve( il_prac_id )	
	*/
	
	//---------------------------- APPEON END ----------------------------
	   //messagebox("","retrieve detail")
		 //messagebox("il_app_id",il_app_id)
		// messagebox("gi_intelliapp_type",gi_intelliapp_type)
		// messagebox("ai_facility_id",ai_facility_id)
		IF gi_intelliapp_type > 0 then  //commented code below is superceded by later code in retrieveend of payor dw
	//		if  il_app_id = 0 and ai_facility_id = 0 THEN //maha 031803
	//			tab_1.tabpage_ids.dw_ids.SetFilter( "" )
	//			tab_1.tabpage_ids.dw_ids.Filter( )
	//		elseif  il_app_id > 0 and ai_facility_id = 0 THEN //maha 031803
	//			tab_1.tabpage_ids.dw_ids.SetFilter( "app_id = " + String( il_app_id ) )
	//			tab_1.tabpage_ids.dw_ids.Filter( )
	//		elseif il_app_id = 0  and ai_facility_id > 0 then //maha 031803
	//			tab_1.tabpage_ids.dw_ids.SetFilter( "facility_id = " + String( ii_facility_id ) )
	//			tab_1.tabpage_ids.dw_ids.Filter( )
	//		elseif il_app_id > 0 and ai_facility_id > 0 then //maha 031803
	//			tab_1.tabpage_ids.dw_ids.SetFilter( "facility_id = " + String( ii_facility_id ) + " and app_id = " + String( il_app_id ) )
	//			tab_1.tabpage_ids.dw_ids.Filter( )
	//		end if
		else	// gi_intelliapp_type = 0 ; doesn't use appid
			if ai_facility_id = 0 then //maha 021103
				tab_1.tabpage_ids.dw_ids.SetFilter("")
				tab_1.tabpage_ids.dw_ids.Filter( )
			elseif ai_facility_id > 0 then //maha 021103
				tab_1.tabpage_ids.dw_ids.SetFilter( "facility_id = " + String( ai_facility_id ) )
				//messagebox("fac",ai_facility_id )
				tab_1.tabpage_ids.dw_ids.Filter( )
			end if
		END IF
	
	IF tab_1.tabpage_ids.dw_ids.rowcount() = 0 THEN
		tab_1.tabpage_ids.dw_ids.InsertRow( 0 )		
	end if
end if

IF tab_1.SelectedTab = 1 THEN
	tab_1.tabpage_ai.dw_net_dev.SetFocus()
ELSEIF tab_1.SelectedTab = 2 THEN
	tab_1.tabpage_ids.dw_ids.SetFocus( )
ELSE
	tab_1.tabpage_notes.dw_notes.SetFocus()
END IF


//Start Code Change ----09.04.2008 #V85 maha - corrected issue where export button would not work unless report rb was clicked
//of_report_selected( "Status") //Start Code Change ----11.10.2008 #V85 maha - moved function call to inheritor object
//tab_1.tabpage_ai.dw_net_dev.ShareData( tab_1.tabpage_report.dw_report_data )
//End Code Change---09.04.2008

//tab_1.tabpage_report.dw_report_data.SetSort( "v_full_name_full_name a, facility_name1 a, action_date a" )
//tab_1.tabpage_report.dw_report_data.Sort( )

Return 0

end function

public function integer of_gen_report ();Integer li_retval

//li_retval = tab_1.tabpage_ai.dw_net_dev.RowsCopy( 1, tab_1.tabpage_ai.dw_net_dev.RowCount(), Primary!, dw_report, 1, Primary! )

//IF tab_1.SelectedTab = 1 OR lb_from_prac_folder = False THEN
//	tab_1.tabpage_report.dw_report_data.Print( )
//ELSE
//	n_ds ids_report
//	ids_report = CREATE n_ds;
//	ids_report.DataObject = "d_rpt_par_numbers_detailed"
//	ids_report.of_SetTransObject( SQLCA )
//	ids_report.Retrieve( il_prac_id )
//	ids_report.Print( )
//	Destroy ids_report;
//END IF

//maha recoded for all tabs 022805
IF tab_1.SelectedTab = 1 THEN
	tab_1.tabpage_ai.dw_net_dev.Print( )
ELSEif tab_1.SelectedTab = 2 then
	tab_1.tabpage_ids.dw_ids.Print( )
ELSEif tab_1.SelectedTab = 3 then
	tab_1.tabpage_notes.dw_notes.Print( )
ELSEif tab_1.SelectedTab = 4 then
	tab_1.tabpage_report.dw_report_data.Print( )
end if

Return 0
end function

public function integer of_reset ();tab_1.tabpage_ai.dw_net_dev.Reset()
tab_1.tabpage_notes.dw_notes.Reset()
tab_1.tabpage_ids.dw_ids.Reset()

Return 0
end function

public function long of_set_rec_id (long al_rec_id);il_rec_id = al_rec_id

Return 1
end function

public function integer of_filter (string as_from, u_dw adw_filter);Long ll_act_type
Long ll_act_dept
Long ll_act_stat
Long ll_app_id
Integer li_rc
Integer li_active_status 
integer li_err
String ls_act_user
String ls_sql
String ls_new_sql
String ls_app_type
DateTime ldt_next_act_date
DateTime ldt_act_date
Date ldt_next_act_date_2
Date ldt_act_date_2

tab_1.tabpage_ai.dw_net_dev.SetFilter( "" )
tab_1.tabpage_ai.dw_net_dev.Filter ( )
tab_1.tabpage_ai.dw_net_dev.Reset( )

adw_filter.AcceptText()
adw_filter.SetColumn( "action_type" )

//messagebox("", il_app_id)

ls_sql = is_sql		

//IF its a multi site intelliapp then the app_id is contolled by the payor/hospital pick list
IF gi_intelliapp_type = 0 THEN
	ll_app_id = adw_filter.GetItemNumber( 1, "app_id" )
	IF Not IsNull( ll_app_id ) AND ll_app_id <> 0 THEN
		ls_new_sql = ls_new_sql + " AND net_dev_action_items.app_id = " + String( ll_app_id )
	END IF
ELSE
		IF il_app_id > 0 THEN
			ls_new_sql = ls_new_sql + " AND net_dev_action_items.app_id = " + String( il_app_id )
		END IF
END IF

ll_act_type = adw_filter.GetItemNumber( 1, "action_type" )
IF Not IsNull( ll_act_type ) AND ll_act_type <> 0 THEN
	ls_new_sql = ls_new_sql + " AND net_dev_action_items.action_type = " + String( ll_act_type )
END IF

ll_act_dept = adw_filter.GetItemNumber( 1, "action_dept" )
IF Not IsNull( ll_act_dept ) AND ll_act_dept <> 0 THEN
	ls_new_sql = ls_new_sql + " AND net_dev_action_items.action_dept = " + String( ll_act_dept )
END IF

ls_act_user = adw_filter.GetItemString( 1, "action_user" )
IF Not IsNull( ls_act_user ) AND ls_act_user <> "ALL" THEN
	ls_new_sql = ls_new_sql + " AND net_dev_action_items.action_user = '" + ls_act_user + "'"
END IF

ls_app_type = adw_filter.GetItemString( 1, "app_type" )
IF Not IsNull( ls_app_type ) AND ls_app_type <> "A" THEN
	ls_new_sql = ls_new_sql + " AND net_dev_action_items.app_type = '" + ls_app_type + "'"
END IF

li_active_status = adw_filter.GetItemNumber( 1, "active_status" )
IF Not IsNull( li_active_status ) AND li_active_status <> 99 THEN
	ls_new_sql = ls_new_sql + " AND net_dev_action_items.active_status = " + String( li_active_status )
END IF

ldt_act_date = adw_filter.GetItemDateTime( 1, "action_date" )
ldt_act_date_2 = adw_filter.GetItemDate( 1, "action_date_2" )
IF Not IsNull( ldt_act_date ) THEN
	IF Not IsNull( ldt_act_date_2 ) THEN
		ls_new_sql = ls_new_sql + " AND action_date Between '" + String( Date( ldt_act_date ), "yyyy-mm-dd" ) + "' AND '" + String( ldt_act_date_2 , "yyyy-mm-dd" ) + "'"
	ELSE
		ls_new_sql = ls_new_sql + " AND net_dev_action_items.action_date = '" + String( Date( ldt_act_date ), "yyyy-mm-dd" ) + "'"
	END IF
END IF

ll_act_stat = adw_filter.GetItemNumber( 1, "action_status" )
IF Not IsNull( ll_act_stat ) AND ll_act_stat <> 0 THEN
	ls_new_sql = ls_new_sql + " AND net_dev_action_items.action_status = " + String( ll_act_stat )
END IF

ldt_next_act_date = adw_filter.GetItemDateTime( 1, "next_action_date" )
ldt_next_act_date_2 = adw_filter.GetItemDate( 1, "next_action_date_2" )
IF Not IsNull( ldt_next_act_date ) THEN
	IF Not IsNull( ldt_act_date_2 ) THEN
		ls_new_sql = ls_new_sql + " AND net_dev_action_items.next_action_date Between '" + String( Date( ldt_next_act_date ), "yyyy-mm-dd" ) + "' AND '" + String( ldt_next_act_date_2 , "yyyy-mm-dd" ) + "'"		
	ELSE
		ls_new_sql = ls_new_sql + " AND net_dev_action_items.next_action_date = '" + String( Date( ldt_next_act_date ), "yyyy-mm-dd" ) + "'"
	END IF
END IF

is_filter_sql = ls_new_sql

//messagebox("", is_filter_sql )

IF lb_from_prac_folder THEN
	ls_sql = ls_sql + " AND net_dev_action_items.prac_id = " + String( il_prac_id ) 
	IF ii_facility_id > 0 THEN
		ls_sql = ls_sql + " AND net_dev_action_items.facility_id = " + String( ii_facility_id )
	END IF
ELSE
	IF ii_facility_id <> 0 THEN
		ls_sql = ls_sql + " AND net_dev_action_items.facility_id = " + String( ii_facility_id )
	END IF
END IF

ls_sql = ls_sql + " " + ls_new_sql

if gi_test_mode = 1 then
	messagebox("", ls_sql )
	clipboard(ls_sql)
end if

IF ii_facility_id > 0 AND lb_from_prac_folder THEN
	tab_1.tabpage_ai.dw_net_dev.Modify( "facility_name.height = '0'" )
	tab_1.tabpage_ai.dw_net_dev.Modify( "facility_name.width = '0'" )	
ELSE
	tab_1.tabpage_ai.dw_net_dev.Modify( "facility_name.height = '56'" )
	tab_1.tabpage_ai.dw_net_dev.Modify( "facility_name.width = '2583'" )
END IF
//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 2005-11-09 By: Cao YongWang
//$<reason> Replaced setsqlselect function with modify function

//Start Code Change ----12.02.2008 #V85 maha - re-replaced with setsqlselect because modify failed.
li_err = tab_1.tabpage_ai.dw_net_dev.SetSQlSelect( ls_sql )

if li_err < 0  then
	messagebox("of_filter error","Set SQL Select error")
end if

//tab_1.tabpage_ai.dw_net_dev.modify('datawindow.table.select = "' +  ls_sql  + '"')
//End Code Change---12.02.2008
//---------------------------- APPEON END ----------------------------
tab_1.tabpage_ai.dw_net_dev.SetTransObject( SQLCA )
ls_sql = tab_1.tabpage_ai.dw_net_dev.GetSQLSelect()


li_rc = tab_1.tabpage_ai.dw_net_dev.Retrieve( )
IF li_rc = 0 THEN
	tab_1.tabpage_ai.dw_net_dev.InsertRow( 0 )
	tab_1.tabpage_notes.dw_notes.InsertRow( 0 )		
elseif li_rc < 0 then //Start Code Change ----12.02.2008 #V85 maha - added error trap
	messagebox("of_filter error", "Retrieve failure")		
END IF

tab_1.tabpage_ai.dw_net_dev.Modify("DataWindow.Table.UpdateTable='net_dev_action_items'")

ib_filter_set = True

Return 0
end function

public function integer of_print_apps ();
Open( w_IntelliApp_Print )

w_IntelliApp_Print.uo_print.of_from_prac_folder( il_prac_id )
w_IntelliApp_Print.uo_print.ib_open_from_prac_folder = True


Return 1
end function

public function integer of_clear_filter ();
ib_filter_set = False
IF lb_from_prac_folder THEN
	tab_1.tabpage_ai.dw_net_dev.Modify( "facility_name.height = '0'" )
	tab_1.tabpage_ai.dw_net_dev.Modify( "facility_name.width = '0'" )	
END IF

of_Retrieve_Detail( ii_facility_id )

tab_1.tabpage_ai.dw_net_dev.SetFilter( "active_status = 1" )
tab_1.tabpage_ai.dw_net_dev.Filter( )


Return 0

end function

public function integer of_set_active_status (integer ai_active_status);Integer li_rc
Integer i


li_rc = tab_1.tabpage_ai.dw_net_dev.RowCount( )

FOR i = 1 TO li_rc
	IF tab_1.tabpage_ai.dw_net_dev.GetItemNumber( i, "selected" )  = 1 THEN
		tab_1.tabpage_ai.dw_net_dev.SetItem( i, "active_status", ai_active_status )
		tab_1.tabpage_ai.dw_net_dev.SetItem( i, "selected", 0 )
	END IF
END FOR


Return 1
end function

public function integer of_report_selected (string as_report);Integer li_retval
Long ll_prac_ids[1]
DataWindowChild dwchild

//li_retval = tab_1.tabpage_ai.dw_net_dev.RowsCopy( 1, tab_1.tabpage_ai.dw_net_dev.RowCount(), Primary!, dw_report, 1, Primary! )
// //*# added maha 063005
IF tab_1.tabpage_report.rb_ai.Checked OR tab_1.tabpage_report.rb_ai_wn.Checked THEN
	IF tab_1.tabpage_report.rb_ai_wn.Checked THEN  //1 of 4
		IF is_group_by = "Practitioner" THEN
			if lb_from_prac_folder then
				tab_1.tabpage_report.dw_report_data.DataObject = "d_net_dev_action_items_report_by_prac_wn"
			else //action items
				tab_1.tabpage_report.dw_report_data.DataObject = "d_net_dev_action_items_rpt_by_prac_wn_ai" //*#
			end if
		ELSEIF is_group_by = "Client" THEN 
			if lb_from_prac_folder then
				tab_1.tabpage_report.dw_report_data.DataObject = "d_net_dev_action_items_rep_by_payer_m_wn"
			else //action items
				tab_1.tabpage_report.dw_report_data.DataObject = "d_net_dev_action_item_rt_by_payor_mwn_ai" //*#
			end if
		ELSE //payor
			if lb_from_prac_folder then
				tab_1.tabpage_report.dw_report_data.DataObject = "d_net_dev_action_items_rep_by_payer_wn"	
			else //action items
				tab_1.tabpage_report.dw_report_data.DataObject = "d_net_dev_action_item_rpt_by_payor_wn_ai" //*#
			end if
		END IF
	ELSE //2 of 4
		IF is_group_by = "Practitioner" THEN
			if lb_from_prac_folder then
				tab_1.tabpage_report.dw_report_data.DataObject = "d_net_dev_action_items_report_by_prac" //default dw prac folder  //Error? Preview data in PB Painter???
			else //action items
				tab_1.tabpage_report.dw_report_data.DataObject = "d_net_dev_action_items_report_by_prac_ai" //default dw action items //*# ???
			end if
		ELSEIF is_group_by = "Client" THEN
			if lb_from_prac_folder then
				tab_1.tabpage_report.dw_report_data.DataObject = "d_net_dev_action_items_report_by_payer_m"			
			else //action items
				tab_1.tabpage_report.dw_report_data.DataObject = "d_net_dev_action_items_rpt_by_payer_m_ai"  //*#
			end if
		ELSE //payor
			if lb_from_prac_folder then
				tab_1.tabpage_report.dw_report_data.DataObject = "d_net_dev_action_items_report_by_payer"
			else //action items
				tab_1.tabpage_report.dw_report_data.DataObject = "d_net_dev_action_items_rpt_by_payer_ai"  //*#
			end if
		END IF
	END IF
	
	li_retval = tab_1.tabpage_ai.dw_net_dev.ShareData( tab_1.tabpage_report.dw_report_data )
	//--------------------------- APPEON BEGIN ---------------------------
	//$<add> 10.23.2008 By: Ken.Guo
	//$<reason> ReSort data.
	tab_1.tabpage_report.dw_report_data.SetSort(tab_1.tabpage_report.dw_report_data.Describe("DataWindow.Table.Sort") )
	tab_1.tabpage_report.dw_report_data.Sort()
	tab_1.tabpage_report.dw_report_data.groupcalc()
	//---------------------------- APPEON END ----------------------------

	//if li_retval < 1 then messagebox("Can not Share to report",li_retval)
	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> PT-05
	//$<add> 02.15.2006 By: Cao YongWang
	//$<reason> Performance tuning.
	//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

	gnv_appeondb.of_startqueue()
	//---------------------------- APPEON END ----------------------------

	tab_1.tabpage_report.dw_report_data.GetChild( "action_dept", dwchild )
	dwchild.SetTransObject( SQLCA )
	dwchild.Retrieve("Action Department")

	tab_1.tabpage_report.dw_report_data.GetChild( "action_type", dwchild )
	dwchild.SetTransObject( SQLCA )
	dwchild.Retrieve("Action Type")

	tab_1.tabpage_report.dw_report_data.GetChild( "action_status", dwchild )
	dwchild.SetTransObject( SQLCA )
	dwchild.Retrieve("Action Status")
	
	tab_1.tabpage_report.dw_report_data.GetChild( "app_id", dwchild )
	dwchild.SetTransObject( SQLCA )
	dwchild.Retrieve( )
	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> PT-06
	//$<add> 02.15.2006 By: Cao YongWang
	//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

	gnv_appeondb.of_commitqueue()
	//---------------------------- APPEON END ----------------------------
ELSE //only used from prac folder  
	IF tab_1.tabpage_report.rb_par.Checked THEN //3 of 4
		tab_1.tabpage_report.dw_report_data.DataObject = "d_rpt_par_numbers_detailed"
		tab_1.tabpage_report.dw_report_data.of_SetTransObject( SQLCA )
		ll_prac_ids[1] = il_prac_id
		tab_1.tabpage_report.dw_report_data.Retrieve( ll_prac_ids[] )
	ELSE //4 of 4
		tab_1.tabpage_report.dw_report_data.DataObject = "d_rpt_par_numbers_summary"
		tab_1.tabpage_report.dw_report_data.of_SetTransObject( SQLCA )
		ll_prac_ids[1] = il_prac_id
		tab_1.tabpage_report.dw_report_data.Retrieve( ll_prac_ids[] )		
	END IF
END IF

tab_1.tabpage_report.dw_report_data.GroupCalc( )
tab_1.tabpage_ai.dw_net_dev.ShareData( tab_1.tabpage_report.dw_report_data )

//tab_1.tabpage_report.dw_report_data.Modify("DataWindow.Zoom = 90")

tab_1.tabpage_report.dw_report_data.Modify( "datawindow.print.preview=Yes" )

Return 0
end function

public function integer of_set_next_due_date (string as_action_type);Integer li_rc
Integer i
Integer li_num_days_app_rcvd_prac
Integer li_num_days_par
Date ld_current_date
Long ll_app_rcvd_prac
Long ll_action_status
Long ll_par
String ls_num_days_app_rcvd_prac
String ls_num_days_par

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-07
//$<modify> 03.23.2006 By: LeiWei
//$<reason> Performance tuning
//$<modification> Write script to retrieve data from a cache instead of from the database.

/*
select lookup_code into :ll_action_status from code_lookup where lookup_name = 'Action Status' and code = 'Incomplete';
IF SQLCA.SQLCODE = 100 THEN
	MessageBox("Lookup missing", "You will need to add a 'Incomplete' code to the Action Status lookup table." )
END IF

select lookup_code into :ll_app_rcvd_prac from code_lookup where lookup_name = 'Action Type' and code = 'App Rcvd Prac';
IF SQLCA.SQLCODE = 100 THEN
	MessageBox("Lookup missing", "You will need to add a 'App Rcvd Prac' code to the Action Type lookup table." )
END IF

select lookup_code into :ll_par from code_lookup where lookup_name = 'Action Type' and code = 'Par';
IF SQLCA.SQLCODE = 100 THEN
	MessageBox("Lookup missing", "You will need to add a 'PAR' code to the Action Type lookup table." )
END IF

select custom_3 into :ls_num_days_app_rcvd_prac from code_lookup where lookup_name = 'Action Type' and code = 'App Rcvd Prac';
IF SQLCA.SQLCODE = 100 THEN
	MessageBox("Lookup missing", "You will need to add a 'App Rcvd Prac' code to the Action Type lookup table." )
END IF
IF Len( ls_num_days_app_rcvd_prac ) = 0 OR IsNull( ls_num_days_app_rcvd_prac ) THEN
	MessageBox("Next Due Date", "The NEXT due date field will be set to 30 days in the future for follow up.  To set this to another value go to you Action Item lookup table and change the Next Follow Up Days field to the number of days that you want to wait until your next follow up.")
	li_num_days_app_rcvd_prac = 30
ELSE
	li_num_days_app_rcvd_prac = Integer( ls_num_days_app_rcvd_prac )
END IF

select custom_3 into :ls_num_days_par from code_lookup where lookup_name = 'Action Type' and code = 'Par';
IF SQLCA.SQLCODE = 100 THEN
	MessageBox("Lookup missing", "You will need to add a 'PAR' code to the Action Type lookup table." )
END IF
*/
ll_action_status = long(gnv_data.of_getitem( 'code_lookup', 'lookup_code', &
		"upper(lookup_name) = upper('Action Status') and upper(code) = upper('Incomplete')"))
IF ll_action_status = 0 THEN
	//MessageBox("Lookup missing", "You will need to add a 'Incomplete' code to the Action Status lookup table." )
	MessageBox("Lookup missing", "You will need to add an 'Incomplete' code to the Action Status lookup table." )
END IF

ll_app_rcvd_prac = long(gnv_data.of_getitem( 'code_lookup', 'lookup_code', &
		"upper(lookup_name) = upper('Action Type') and upper(code) = upper('App Rcvd Prac')"))
IF ll_app_rcvd_prac = 0 THEN
	//MessageBox("Lookup missing", "You will need to add a 'App Rcvd Prac' code to the Action Type lookup table." )
	MessageBox("Lookup missing", "You will need to add an 'App Rcvd Prac' code to the Action Type lookup table." )
END IF

ll_par = long(gnv_data.of_getitem( 'code_lookup', 'lookup_code', &
		"upper(lookup_name) = upper('Action Type') and upper(code) = upper('Par')"))
IF ll_par = 0 THEN
	MessageBox("Lookup missing", "You will need to add a 'PAR' code to the Action Type lookup table." )
END IF

ls_num_days_app_rcvd_prac = gnv_data.of_getitem( 'code_lookup', 'custom_3', &
		"upper(lookup_name) = upper('Action Type') and upper(code) = upper('App Rcvd Prac')")
IF ls_num_days_app_rcvd_prac = "" THEN
	//MessageBox("Lookup missing", "You will need to add a 'App Rcvd Prac' code to the Action Type lookup table." )
	MessageBox("Lookup missing", "You will need to add an 'App Rcvd Prac' code to the Action Type lookup table." )
END IF
IF Len( ls_num_days_app_rcvd_prac ) = 0 OR IsNull( ls_num_days_app_rcvd_prac ) THEN
	MessageBox("Next Due Date", "The NEXT due date field will be set to 30 days in the future for follow up.  To set this to another value go to you Action Item lookup table and change the Next Follow Up Days field to the number of days that you want to wait until your next follow up.")
	li_num_days_app_rcvd_prac = 30
ELSE
	li_num_days_app_rcvd_prac = Integer( ls_num_days_app_rcvd_prac )
END IF

ls_num_days_par = gnv_data.of_getitem( 'code_lookup', 'custom_3', &
		"upper(lookup_name) = upper('Action Type') and upper(code) = upper('Par')")
IF ls_num_days_par = "" THEN
	MessageBox("Lookup missing", "You will need to add a 'PAR' code to the Action Type lookup table." )
END IF

//---------------------------- APPEON END ----------------------------
IF Len( ls_num_days_par ) = 0 OR IsNull( ls_num_days_par ) THEN
	MessageBox("Next Due Date", "The NEXT due date field will be set to 30 days in the future for follow up.  To set this to another value go to you Action Item lookup table and change the Next Follow Up Days field to the number of days that you want to wait until your next follow up.")
	li_num_days_par = 30	
ELSE
	li_num_days_par = Integer( ls_num_days_par )	
END IF

li_rc = tab_1.tabpage_ai.dw_net_dev.RowCount( )

FOR i = 1 TO li_rc
	ld_current_date = tab_1.tabpage_ai.dw_net_dev.GetItemDate( i, "due_date" )
	IF as_action_type = "App Rcvd Prac" THEN
		IF tab_1.tabpage_ai.dw_net_dev.GetItemNumber( i, "action_type" ) = ll_app_rcvd_prac AND +&
			tab_1.tabpage_ai.dw_net_dev.GetItemNumber( i, "action_status" ) = ll_action_status THEN
			tab_1.tabpage_ai.dw_net_dev.SetItem( i, "due_date", RelativeDate( ld_current_date, li_num_days_app_rcvd_prac ) )
		END IF
	ELSE

		IF tab_1.tabpage_ai.dw_net_dev.GetItemNumber( i, "action_type" ) = ll_par AND +&
			tab_1.tabpage_ai.dw_net_dev.GetItemNumber( i, "action_status" ) = ll_action_status THEN

			tab_1.tabpage_ai.dw_net_dev.SetItem( i, "due_date", RelativeDate( ld_current_date, li_num_days_par ) )
		END IF
	END IF
END FOR

//of_save( )

Return -1
end function

on pfc_cst_nv_net_dev_new.create
this.tab_1=create tab_1
this.Control[]={this.tab_1}
end on

on pfc_cst_nv_net_dev_new.destroy
destroy(this.tab_1)
end on

event constructor;//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-09
//$<add> 03.28.2006 By: LeiWei
//$<reason> Performance tuning
//$<modification> The following script is moved from the of_set_facility_id function to
//$<modification> reduce client-server interactions. Refer to PT-01 for more inoformation

DataWindowChild dwchild

of_sql()

//setup dw_net_dev datawindow
tab_1.tabpage_ai.dw_net_dev.of_SetRowManager( TRUE )
tab_1.tabpage_ai.dw_net_dev.of_SetReqColumn(TRUE)
tab_1.tabpage_ai.dw_net_dev.of_SetTransObject(SQLCA)

gnv_appeondb.of_startqueue( )

tab_1.tabpage_ai.dw_net_dev.GetChild( "action_dept", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("Action Department")

tab_1.tabpage_ai.dw_net_dev.GetChild( "action_status", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("Action Status")

tab_1.tabpage_report.dw_report_data.GetChild( "app_id", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve( )	

tab_1.tabpage_report.dw_report_data.GetChild( "action_dept", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("Action Department")

tab_1.tabpage_report.dw_report_data.GetChild( "action_type", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("Action Type")

tab_1.tabpage_report.dw_report_data.GetChild( "action_status", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("Action Status")


tab_1.tabpage_ids.dw_ids.GetChild( "plan_type", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("Plan Type")

//added tier field to net_dev_ids   -   12/16/02
tab_1.tabpage_ids.dw_ids.GetChild( "Tier", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("Tier")

gnv_appeondb.of_commitqueue( )

tab_1.tabpage_ai.dw_net_dev.of_SetDropDownCalendar( TRUE )

//setup ids datawindow
tab_1.tabpage_ids.dw_ids.of_SetRowManager( TRUE )
tab_1.tabpage_ids.dw_ids.of_SetReqColumn(TRUE)
tab_1.tabpage_ids.dw_ids.of_SetTransObject(SQLCA)

tab_1.tabpage_ids.dw_ids.of_SetDropDownCalendar( TRUE )

//---------------------------- APPEON END ----------------------------

end event

type tab_1 from tab within pfc_cst_nv_net_dev_new
event create ( )
event destroy ( )
integer x = 5
integer width = 2752
integer height = 1512
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
tabposition tabposition = tabsonbottom!
integer selectedtab = 1
tabpage_ai tabpage_ai
tabpage_ids tabpage_ids
tabpage_notes tabpage_notes
tabpage_report tabpage_report
end type

on tab_1.create
this.tabpage_ai=create tabpage_ai
this.tabpage_ids=create tabpage_ids
this.tabpage_notes=create tabpage_notes
this.tabpage_report=create tabpage_report
this.Control[]={this.tabpage_ai,&
this.tabpage_ids,&
this.tabpage_notes,&
this.tabpage_report}
end on

on tab_1.destroy
destroy(this.tabpage_ai)
destroy(this.tabpage_ids)
destroy(this.tabpage_notes)
destroy(this.tabpage_report)
end on

type tabpage_ai from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 16
integer width = 2715
integer height = 1384
long backcolor = 80269524
string text = "Actions"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
string picturename = "Watcom!"
long picturemaskcolor = 553648127
dw_net_dev dw_net_dev
end type

on tabpage_ai.create
this.dw_net_dev=create dw_net_dev
this.Control[]={this.dw_net_dev}
end on

on tabpage_ai.destroy
destroy(this.dw_net_dev)
end on

type dw_net_dev from u_dw within tabpage_ai
integer x = 14
integer y = 16
integer width = 2683
integer height = 1332
integer taborder = 21
string dataobject = "d_net_dev_action_items_no_group"
end type

event constructor;call super::constructor;This.of_SetSort(True)
This.inv_sort.of_SetStyle(3)
This.of_SetReqColumn(True)
This.inv_sort.of_SetColumnHeader(True)
end event

event itemchanged;call super::itemchanged;//Start Code Change ---- 05.19.2006 #470 maha
Long ll_complete_action_status
Long ll_action_type
Long ll_action_status
Long ll_rec_id
Long ll_app_id
long ll_prac
long ll_facid
String ls_num_due_date_days
String ls_action_type
String ls_app_type
String ls_action_user
string ls_find
Integer li_nr
Integer li_ans
Integer li_num_due_date_days
Date ld_due_date
integer li_recalc
//--------------------------- APPEON BEGIN ---------------------------
//$<add> 01.13.2006 By: LeiWei
String ls_ll_app_id,ls_ll_prac
//--------------------------- APPEON END ---------------------------

IF Upper(This.GetColumnName( )) = "ACTION_DATE" THEN
	datawindowchild dwchild
	Integer li_find
	Integer li_days
	This.GetChild( "action_type", dwchild )
	li_find = dwchild.Find( "lookup_code = " + String( This.GetItemNumber( row, "action_type")), 1, 1000 )
	li_days = Integer( dwchild.GetItemString( li_find, "custom_2" ) )
	This.SetItem( row, "due_date", RelativeDate( Date(data), li_days ))

ELSEIF Upper(This.GetColumnName( )) = "ACTION_STATUS" THEN
	
	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> PT-10
	//$<modify> 02.27.2006 By: LeiWei
	//$<reason> Performance tuning.
	//$<modification> Write script to retrieve data from a cache instead of from the database.
	/*
	select lookup_code into :ll_complete_action_status from code_lookup where lookup_name = 'Action Status' and code = 'Complete';
	IF SQLCA.SQLCODE = 100 THEN
	*/
	ll_complete_action_status = Long(gnv_data.of_getitem( 'code_lookup', 'lookup_code', "upper(lookup_name) = upper('Action Status') and upper(code) = upper('Complete')"))
	IF ll_complete_action_status = 0 THEN
	//---------------------------- APPEON END ----------------------------	
		//MessageBox("Error", "You will need to add an 'Complete' code to the Action Status lookup table." )
		MessageBox("Error", "You will need to add a 'Complete' code to the Action Status lookup table." )
		Return -1
	END IF
	
	//IF complete then make the Action Date today() if it is null otherwise make the action
	IF Long( data ) = ll_complete_action_status THEN
						
		ll_action_type = This.GetItemNumber( row, "action_type" )
		ll_app_id = This.GetItemNumber( row, "app_id" )
		ls_app_type = This.GetItemString( row, "app_type" )
		ll_prac = This.GetItemnumber( row, "prac_id" )
		ll_facid = This.GetItemnumber( row, "facility_id" )
		//--------------------------- APPEON BEGIN ---------------------------
		//$<ID> PT-11
		//$<modify> 02.27.2006 By: LeiWei
		//$<reason> Performance tuning.
		//$<modification> Write script to retrieve data from a cache instead of from the database.
		/*
		select code into :ls_action_type from code_lookup where lookup_code = :ll_action_type;
		IF SQLCA.SQLCODE = 100 THEN
		*/
		ls_action_type = gnv_data.of_getitem( 'code_lookup', 'code', "lookup_code = " + String(ll_action_type))
		IF ll_complete_action_status = 0 THEN
		//---------------------------- APPEON END ----------------------------	
			MessageBox("Lookup missing", "You must have deleted an action type that was previously used." )
			Return -1
		END IF

		IF IsNull( This.GetItemDateTime( row, "action_date" ) ) THEN
			This.SetItem( row, "action_date", Today() )
		END IF
		
		CHOOSE CASE Upper( ls_action_type ) //Upper( This.GetItemNumber( row, "action_type" ) )
			CASE "APP RCVD PRAC"
				
				//--------------------------- APPEON BEGIN ---------------------------
				//$<ID> PT-12
				//$<modify> 02.27.2006 By: LeiWei
				//$<reason> Performance tuning.
				//$<modification> Write script to retrieve data from a cache instead of from the database.
				/*
				select lookup_code into :ll_action_status from code_lookup where lookup_name = 'Action Status' and code = 'Incomplete';
				IF SQLCA.SQLCODE = 100 THEN
				*/
				ll_action_status = Long(gnv_data.of_getitem( 'code_lookup', 'lookup_code', "upper(lookup_name) = upper('Action Status') and upper(code) = upper('Incomplete')"))
				IF ll_action_status = 0 THEN
				//---------------------------- APPEON END ----------------------------	
					MessageBox("Error", "You will need to add an 'Incomplete' code to the Action Status lookup table." )
					Return -1
				END IF
			
				//--------------------------- APPEON BEGIN ---------------------------
				//$<ID> PT-13
				//$<modify> 02.27.2006 By: LeiWei
				//$<reason> Performance tuning.
				//$<modification> Write script to retrieve data from a cache instead of from the database.
				/*
				select lookup_code into :ll_action_type from code_lookup where lookup_name = 'Action Type' and code = 'App Mail Payor';
				IF SQLCA.SQLCODE = 100 THEN
				*/
				ll_action_type = Long(gnv_data.of_getitem( 'code_lookup', 'lookup_code', "upper(lookup_name) = upper('Action Type') and upper(code) = upper('App Mail Payor')"))
				IF ll_action_type = 0 THEN
				//---------------------------- APPEON END ----------------------------	
					MessageBox("Error", "You will need to add an 'App Mail Payor' code to the Action Type lookup table." )
					Return -1
				END IF
				//find modified maha 062905 to be app and prac specific to work in action items
				//--------------------------- APPEON BEGIN ---------------------------
				//$<ID> UM-01
				//$<modify> 01.13.2006 By: LeiWei
				//$<reason> Appeon deals with the NULL value differently from that in PowerBuilder.
				//$<modification> Set the NULL to zero if the value of a variable is NULL.
				
				//IF This.Find( "action_type = " + String( ll_action_type ) + " AND active_status = 1 AND app_id = " + string(ll_app_id) + " AND prac_id = " + string(ll_prac), 1, 1000 ) = 0 THEN
				IF Isnull(ll_app_id) Then ls_ll_app_id = '0' Else ls_ll_app_id = String(ll_app_id)
				IF Isnull(ll_prac) Then ls_ll_prac = '0' Else ls_ll_prac = String(ll_prac)
				IF This.Find( "action_type = " + String( ll_action_type ) + " AND active_status = 1 AND app_id = " + ls_ll_app_id + " AND prac_id = " + ls_ll_prac, 1, 1000 ) = 0 THEN
				//---------------------------- APPEON END ----------------------------
					li_ans = MessageBox( "App Mail Payor", "Would you like to add an App Mailed for Approval Action Item?", Question!, YesNo!, 1 )				
					IF li_ans = 1 THEN				
						//--------------------------- APPEON BEGIN ---------------------------
						//$<ID> PT-14
						//$<modify> 02.27.2006 By: LeiWei
						//$<reason> Performance tuning.
						//$<modification> Write script to retrieve data from a cache instead of from the database.
						/*
						select custom_3 into :ls_num_due_date_days from code_lookup where lookup_name = 'Action Type' and code = 'App Mail Payor';
						IF SQLCA.SQLCODE = 100 THEN
						*/
						ls_num_due_date_days = gnv_data.of_getitem( 'code_lookup', 'custom_3', "upper(lookup_name) = upper('Action Type') and upper(code) = upper('App Mail Payor')")
						IF ls_num_due_date_days = "" THEN
						//---------------------------- APPEON END ----------------------------	
							//MessageBox("Lookup missing", "You will need to add a 'App Mail Payor' code to the Action Type lookup table." )
							MessageBox("Lookup missing", "You will need to add an 'App Mail Payor' code to the Action Type lookup table." )
						END IF
						IF Len( ls_num_due_date_days ) = 0 OR IsNull( ls_num_due_date_days ) THEN
							MessageBox("Next Due Date", "The NEXT due date field will be set to 30 days in the future for follow up.  To set this to another value go to the Action Type lookup table and change the Next Follow Up Days field to the number of days that you want to wait until your next follow up.")
							li_num_due_date_days = 30
						ELSE
							li_num_due_date_days = Integer( ls_num_due_date_days )
						END IF

						ll_rec_id = gnv_app.of_Get_Id("RECORD_ID")	

						ld_due_date = RelativeDate( Today(), li_num_due_date_days )
						
						li_nr = This.InsertRow( row + 1 )
						
						//This.SetItem( li_nr, "rec_id", ll_rec_id )
						This.SetItem( li_nr, "prac_id", ll_prac)
						This.SetItem( li_nr, "seq_no", ll_rec_id )
						This.SetItem( li_nr, "action_type", ll_action_type )
						This.SetItem( li_nr, "action_user", gs_user_id )
						This.SetItem( li_nr, "action_status", ll_action_status )
						This.SetItem( li_nr, "facility_id", ll_facid )
						This.SetItem( li_nr, "app_type", ls_app_type )
						This.SetItem( li_nr, "app_id", ll_app_id )
						This.SetItem( li_nr, "due_date", ld_due_date )
						This.SetItem( li_nr, "active_status", 1 ) //maha 071105
						li_recalc = 1
					END IF
				END IF
			CASE "APP MAIL PAYOR"
				
				//--------------------------- APPEON BEGIN ---------------------------
				//$<ID> PT-15
				//$<modify> 02.27.2006 By: LeiWei
				//$<reason> Performance tuning.
				//$<modification> Write script to retrieve data from a cache instead of from the database.
				/*
				select lookup_code into :ll_action_status from code_lookup where lookup_name = 'Action Status' and code = 'Incomplete';
				IF SQLCA.SQLCODE = 100 THEN
				*/
				ll_action_status = Long(gnv_data.of_getitem( 'code_lookup', 'lookup_code', "upper(lookup_name) = upper('Action Status') and upper(code) = upper('Incomplete')"))
				IF ll_action_status = 0 THEN
				//---------------------------- APPEON END ----------------------------	
					MessageBox("Error", "You will need to add an 'Incomplete' code to the Action Status lookup table." )
					Return -1
				END IF
				
				//--------------------------- APPEON BEGIN ---------------------------
				//$<ID> PT-16
				//$<modify> 02.27.2006 By: LeiWei
				//$<reason> Performance tuning.
				//$<modification> Write script to retrieve data from a cache instead of from the database.
				/*
				select lookup_code into :ll_action_type from code_lookup where lookup_name = 'Action Type' and code = 'PAR';
				IF SQLCA.SQLCODE = 100 THEN
				*/
				ll_action_type = Long(gnv_data.of_getitem( 'code_lookup', 'lookup_code', "upper(lookup_name) = upper('Action Type') and upper(code) = upper('PAR')"))
				IF ll_action_type = 0 THEN
				//---------------------------- APPEON END ----------------------------	
					//MessageBox("Error", "You will need to add an 'PAR' code to the Action Type lookup table." )
   				MessageBox("Error", "You will need to add a 'PAR' code to the Action Type lookup table." )
					Return -1
				END IF
				//--------------------------- APPEON BEGIN ---------------------------
				//$<ID> UM-02
				//$<modify> 01.13.2006 By: LeiWei
				//$<reason> Appeon deals with the NULL value differently from that in PowerBuilder.
				//$<modification> Set the NULL to zero if the value of a variable is NULL.
				
				//IF This.Find( "action_type = " + String( ll_action_type ) + " AND active_status = 1 AND app_id = " + string(ll_app_id) + " AND prac_id = " + string(ll_prac), 1, 1000 ) = 0 THEN
				IF Isnull(ll_app_id) Then ls_ll_app_id = '0' Else ls_ll_app_id = String(ll_app_id)
				IF Isnull(ll_prac) Then ls_ll_prac = '0' Else ls_ll_prac = String(ll_prac)
				IF This.Find( "action_type = " + String( ll_action_type ) + " AND active_status = 1 AND app_id = " + ls_ll_app_id + " AND prac_id = " + ls_ll_prac, 1, 1000 ) = 0 THEN
				//---------------------------- APPEON END ----------------------------
					li_ans = MessageBox( "PAR", "Would you like to add a Participation Approved Action Item", Question!, YesNo!, 1 )				
					IF li_ans = 1 THEN							
						//--------------------------- APPEON BEGIN ---------------------------
						//$<ID> PT-17
						//$<modify> 01.13.2006 By: LeiWei
						//$<reason> Appeon deals with the NULL value differently from that in PowerBuilder.
						//$<modification> Set the NULL to zero if the value of a variable is NULL.
						/*
						select custom_3 into :ls_num_due_date_days from code_lookup where lookup_name = 'Action Type' and code = 'PAR';
						IF SQLCA.SQLCODE = 100 THEN
						*/
						ls_num_due_date_days = gnv_data.of_getitem( 'code_lookup', 'custom_3', "upper(lookup_name) = upper('Action Type') and upper(code) = upper('PAR')")
						IF ls_num_due_date_days = "" THEN
						//---------------------------- APPEON END ----------------------------	
							MessageBox("Lookup missing", "You will need to add a 'PAR' code to the Action Type lookup table." )
						END IF
						IF Len( ls_num_due_date_days ) = 0 OR IsNull( ls_num_due_date_days ) THEN
							MessageBox("Next Due Date", "The NEXT due date field will be set to 30 days in the future for follow up.  To set this to another value go to the Action Type lookup table and change the Next Follow Up Days field to the number of days that you want to wait until your next follow up.")
							li_num_due_date_days = 30
						ELSE
							li_num_due_date_days = Integer( ls_num_due_date_days )
						END IF

						ll_rec_id = gnv_app.of_Get_Id("RECORD_ID")	
	
						ld_due_date = RelativeDate( Today(), li_num_due_date_days )
						
						li_nr = This.InsertRow( row + 1 )
						
						//This.SetItem( li_nr, "rec_id", ll_rec_id )
						This.SetItem( li_nr, "prac_id", ll_prac)
						This.SetItem( li_nr, "seq_no", ll_rec_id )
						This.SetItem( li_nr, "action_type", ll_action_type )
						This.SetItem( li_nr, "action_user", gs_user_id )
						This.SetItem( li_nr, "action_status", ll_action_status )
						This.SetItem( li_nr, "facility_id", ll_facid )
						This.SetItem( li_nr, "app_type", ls_app_type )
						This.SetItem( li_nr, "app_id", ll_app_id )
						This.SetItem( li_nr, "due_date", ld_due_date )
						This.SetItem( li_nr, "active_status", 1 ) //maha 071105
						li_recalc = 1
					END IF
				END IF				
			END CHOOSE
	END IF
	
END IF

if li_recalc = 1 then //maha 071905 needed primarily for action items
//	this.sort()
//	this.GroupCalc( )
end if
//End Code Change---05.19.2006	


end event

event pfc_preupdate;call super::pfc_preupdate;Long ll_rec_id
Integer li_rc
Integer i
Long ll_seq_no,ll_seq
Long ll_temp_seq_no = 1

//i =this.of_setupdateable(true)
//messagebox("udateable",i)
debugbreak()
//--------------------------- APPEON BEGIN ---------------------------
//$<add> 11.20.2006 By: Jervis
//$<reason> 
str_action_item lstr_init[]

//Reset str_action_item value
istr_action = lstr_init

long ll_ori,ll_cur
//---------------------------- APPEON END ----------------------------

li_rc = This.RowCount()
ll_seq = 1
FOR i = 1 TO li_rc
	ll_seq_no = This.GetItemNumber( i, "seq_no" )
	IF ll_seq_no > ll_temp_seq_no THEN
		ll_temp_seq_no = ll_seq_no
	END IF
END FOR
ll_seq_no = ll_temp_seq_no

//Start Code Change ---- 05.17.2006 #495 maha from version 4.5
FOR i = 1 TO li_rc
	IF This.GetItemStatus( i, 0, Primary! ) = NewModified! THEN
		if isnull(This.getItemnumber( i, "rec_id" )) then //maha added isnull checks 072805
			ll_rec_id = gnv_app.of_Get_Id("RECORD_ID")
			This.SetItem( i, "rec_id", ll_rec_id )
		end if
		if isnull(This.getItemnumber( i, "prac_id" )) then
			This.SetItem( i, "prac_id", il_prac_id)
		end if
		if isnull(This.getItemnumber( i, "facility_id" )) then
			This.SetItem( i, "facility_id", ii_facility_id )
		end if
		if isnull(This.getItemnumber( i, "seq_no" )) then
			ll_seq_no++
			This.SetItem( i, "seq_no", ll_seq_no )
		end if
	END IF
	//--------------------------- APPEON BEGIN ---------------------------
	//$<modify> 11.20.2006 By: Jervis
	//$<reason> modify work flow
	If gb_workflow Then
		IF This.GetItemStatus( i, 0, Primary! ) = DataModified! then
			//if this.GetItemNumber(i,"action_status",primary!,true) <> this.GetItemNumber(i,"action_status") Then
			ll_ori = this.GetItemNumber(i,"action_status",primary!,true)
			ll_cur = this.GetItemNumber(i,"action_status")
			if ((ll_ori <> ll_cur) or (isnull(ll_ori) and not isnull(ll_cur)) or (not isnull(ll_ori) and isnull(ll_cur))) Then
				istr_action[ll_seq].rec_id = This.getItemnumber( i, "rec_id" )
				istr_action[ll_seq].prac_id = This.getItemnumber( i, "prac_id" )
				istr_action[ll_seq].facility_id = This.getItemnumber( i, "facility_id" )
				istr_action[ll_seq].wf_id = this.GetItemNumber(i,"net_dev_action_items_wf_id")
				istr_action[ll_seq].wf_action_status_id = this.GetItemNumber(i,"action_status")
				istr_action[ll_seq].wf_action_type_id = this.GetItemNumber(i,"action_type")
				istr_action[ll_seq].module = "02"	//Contract Logix
				istr_action[ll_seq].trigger_by = "008"		//Trigger By Action Item Changed
				istr_action[ll_seq].screen_id = -10
				if istr_action[ll_seq].wf_id > 0 and this.GetItemString(i,"net_dev_action_items_wf_complete_flag") = "N" THEN				
					istr_action[ll_seq].wf_step_id = this.GetItemNumber(i,"net_dev_action_items_wf_action_type_id")
					istr_action[ll_seq].seq_no = This.getItemnumber( i, "seq_no" )		
					istr_action[ll_seq].notes = this.GetItemString(i,"notes")
					istr_action[ll_seq].status_changed_flag = true
				end if
				ll_seq++
			//elseif this.GetItemNumber(i,"action_type",primary!,true) <> this.GetItemNumber(i,"action_type") Then
			else
				ll_ori = this.GetItemNumber(i,"action_type",primary!,true)
				ll_cur = this.GetItemNumber(i,"action_type")
				if ((ll_ori <> ll_cur) or (isnull(ll_ori) and not isnull(ll_cur)) or (not isnull(ll_ori) and isnull(ll_cur))) Then
					istr_action[ll_seq].rec_id = This.getItemnumber( i, "rec_id" )
					istr_action[ll_seq].prac_id = This.getItemnumber( i, "prac_id" )
					istr_action[ll_seq].facility_id = This.getItemnumber( i, "facility_id" )
					istr_action[ll_seq].wf_action_status_id = this.GetItemNumber(i,"action_status")
					istr_action[ll_seq].wf_action_type_id = this.GetItemNumber(i,"action_type")
					istr_action[ll_seq].status_changed_flag = false
					istr_action[ll_seq].module = "02"	//Contract Logix
					istr_action[ll_seq].trigger_by = "008"		//Trigger By Action Item Changed
					istr_action[ll_seq].screen_id = -10
					ll_seq++
				end if
			end if
		END IF
	End if
	
	//---------------------------- APPEON END ----------------------------
	
END FOR
//End Code Change---05.17.2006

Return 0
end event

event retrieveend;call super::retrieveend;Integer li_rc
//messagebox("", rowcount)

// mskinner 17 dec 2005 -- begin
// appeon fix
if this.rowcount() < 1 then return success
// mskinner 17 dec 2005 -- end
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-18
//$<modify> 02.16.2006 By: Cao YongWang
//$<reason> Performance tuning.
//$<modification> Comment out the folloiwng script since dw_notes has already retrieved
//$<modification> data from the database in previous script.
/*
IF rowcount > 0 AND This.RowCount() > 0 THEN
	il_prac_id = This.GetItemNumber( 1, "prac_id" )

	li_rc = tab_1.tabpage_notes.dw_notes.Retrieve( il_prac_id )
	
	IF li_rc = 0 THEN
		tab_1.tabpage_notes.dw_notes.InsertRow( 0 )
	END IF
	
END IF
*/
IF rowcount > 0 AND This.RowCount() > 0 THEN il_prac_id = This.GetItemNumber( 1, "prac_id" )
//---------------------------- APPEON END ----------------------------
dw_net_dev.of_SetDropDownCalendar( TRUE )// maha 032306
dw_net_dev.iuo_calendar.of_UnRegister()			
dw_net_dev.iuo_calendar.of_Register(dw_net_dev.iuo_calendar.DDLB)		
dw_net_dev.of_SetReqColumn(TRUE)
end event

event rowfocuschanged;call super::rowfocuschanged;Integer li_rc
Integer li_facility_id
Long ll_prac_id

IF currentrow > 0 AND This.RowCount() > 0 THEN
	IF Not IsNull( This.GetItemNumber( currentrow, "prac_id" ) ) THEN
		ll_prac_id = This.GetItemNumber( currentrow, "prac_id" )
		li_facility_id = This.GetItemNumber( currentrow, "facility_id" )
		//--------------------------- APPEON BEGIN ---------------------------
		//$<ID> PT-19
		//$<modify> 02.16.2006 By: Cao YongWang
		//$<reason> Performance tuning.
		//$<modification> Comment out the folloiwng script since dw_notes has already retrieved
		//$<modification> data from the database in previous script.
		/*
		li_rc = tab_1.tabpage_notes.dw_notes.Retrieve( il_prac_id )
		IF li_rc = 0 THEN
			tab_1.tabpage_notes.dw_notes.InsertRow( 0 )
		END IF
		if gi_intelliapp_type > 0 then //maha app101805 for Cornell
			li_rc = tab_1.tabpage_ids.dw_ids.Retrieve( li_facility_id, ll_prac_id )
		end if
		IF li_rc = 0 THEN
			tab_1.tabpage_ids.dw_ids.InsertRow( 0 )		
		END IF
		*/
		li_rc = tab_1.tabpage_notes.dw_notes.Rowcount()
		IF li_rc = 0 THEN
			tab_1.tabpage_notes.dw_notes.InsertRow( 0 )
		END IF
		
		li_rc = tab_1.tabpage_ids.dw_ids.Rowcount()
		IF li_rc = 0 THEN
			tab_1.tabpage_ids.dw_ids.InsertRow( 0 )		
		END IF
		//---------------------------- APPEON END ----------------------------
	END IF
END IF
end event

event pfc_postupdate;call super::pfc_postupdate;//--------------------------- APPEON BEGIN ---------------------------
//$<add> 11.06.2006 By: Jervis
//$<reason> modify work flow
long ll_i,ll_count
n_cst_workflow_triggers    lnv_trigger

If not gb_workflow Then return 1
lnv_trigger = create n_cst_workflow_triggers


ll_count = UpperBound(istr_action)


//2006-11-20 by jervis
For ll_i = 1 to ll_count
	if istr_action[ll_i].status_changed_flag then
		lnv_trigger.of_status_changed( istr_action[ll_i])
	end if
Next

//Create Work Flow By Action Item Changed
lnv_trigger.of_workflow_triggers(istr_action)   
//2006-11-20

destroy lnv_trigger

return 1
//---------------------------- APPEON END ----------------------------


end event

event itemfocuschanged;call super::itemfocuschanged;//--------------------------- APPEON BEGIN ---------------------------
//$<add> 12.05.2006 By: Jervis
//$<reason> Filter Status
datawindowchild ldwc
long ll_wf_id,ll_wf_step_id
string ls_filter

ll_wf_id = this.GetItemNumber(row,"net_dev_action_items_wf_id")
ll_wf_step_id = this.GetItemNumber(row,"net_dev_action_items_wf_action_type_id")
	
if dwo.name = "action_status" and ll_wf_id > 0 then
	if this.GetChild(dwo.name,ldwc) = 1 then
		ls_filter = "wf_id =" + string(ll_wf_id) + " and step_id = " + string(ll_wf_step_id) 
		ls_filter = gnv_data.of_get_filter_data("workflow_status_filter",ls_filter,"lookup_code")
		if ls_filter <> "" then
			ls_filter += " or isnull(lookup_code) or lookup_code = -777"
		else
			ls_filter = "isnull(lookup_code) or lookup_code = -777"
		end if
		ldwc.SetFilter( ls_filter)
		ldwc.Filter()
		//this.SetRedraw( false)
		is_prior = dwo.name
	end if
elseif is_prior = "action_status" then
	if this.GetChild(is_prior,ldwc) = 1 then
		ldwc.SetFilter("")
		ldwc.Filter()
		is_prior = ""
		this.SetRedraw( true )
	end if
end if

//---------------------------- APPEON END ----------------------------

end event

type tabpage_ids from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 16
integer width = 2715
integer height = 1384
long backcolor = 80269524
string text = "ID~'s"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
string picturename = "Custom092!"
long picturemaskcolor = 553648127
dw_ids dw_ids
end type

on tabpage_ids.create
this.dw_ids=create dw_ids
this.Control[]={this.dw_ids}
end on

on tabpage_ids.destroy
destroy(this.dw_ids)
end on

type dw_ids from u_dw within tabpage_ids
integer x = 18
integer y = 16
integer width = 2683
integer height = 1344
integer taborder = 11
string dataobject = "d_net_dev_ids"
end type

event pfc_preupdate;call super::pfc_preupdate;Long ll_rec_id
Integer li_rc
Integer i

li_rc = This.RowCount()

//FOR i = 1 TO li_rc
//	IF Len( This.GetItemString( i, "plan_assigned_id" ) ) = 0 OR IsNull( This.GetItemString( i, "plan_assigned_id" ) ) THEN
//		MessageBox("Required Data", "You must enter in a Plan ID.  Please Correct." )
//		This.SetRow( i )
//		This.ScrollToRow( i )
//		This.SetColumn( "plan_assigned_id" )
//		Goto Error;
//	END IF
//	IF IsNull( This.GetItemNumber( i, "plan_type" ) ) THEN
//		MessageBox("Required Data", "You must enter in a Plan Type.  Please Correct." )
//		This.SetRow( i )
//		This.ScrollToRow( i )
//		This.SetColumn( "plan_type" )
//		Goto Error;
//	END IF	
//END FOR

FOR i = 1 TO li_rc
	IF This.GetItemStatus( i, 0, Primary! ) = NewModified! THEN
		ll_rec_id = gnv_app.of_Get_Id("RECORD_ID")
		This.SetItem( i, "facility_id", ii_facility_id ) //tab_1.tabpage_ai.dw_net_dev.GetItemNumber( tab_1.tabpage_ai.dw_net_dev.GetRow(), "facility_id" ) )
		This.SetItem( i, "prac_id", il_prac_id )//tab_1.tabpage_ai.dw_net_dev.GetItemNumber( tab_1.tabpage_ai.dw_net_dev.GetRow(), "prac_id" ) )		
		This.SetItem( i, "rec_id", ll_rec_id )				
		IF gi_intelliapp_type > 0 THEN
			This.SetItem( i, "app_id", il_app_id )				
		END IF
	END IF
END FOR

Return 1
//
//Error:
//debugbreak()
//Return -1
end event

event pfc_checkrequirederror;call super::pfc_checkrequirederror;
	IF as_columnname = "plan_assigned_id" THEN
		//MessageBox("Required Data", "You must enter in a Plan ID.  Please Correct." )
		MessageBox("Required Data", "You must enter a Plan ID.  Please Correct." )
		This.SetRow( al_row )
		This.ScrollToRow( al_row )
		This.SetColumn( "plan_assigned_id" )
	END IF
	IF as_columnname = "plan_type" THEN
		//MessageBox("Required Data", "You must enter in a Plan Type.  Please Correct." )
		MessageBox("Required Data", "You must enter a Plan Type.  Please Correct." )
		This.SetRow( al_row )
		This.ScrollToRow( al_row )
		This.SetColumn( "plan_type" )
	END IF	


Return 0
end event

type tabpage_notes from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 16
integer width = 2715
integer height = 1384
long backcolor = 79741120
string text = "Notes"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "DosEdit!"
long picturemaskcolor = 553648127
dw_notes dw_notes
end type

on tabpage_notes.create
this.dw_notes=create dw_notes
this.Control[]={this.dw_notes}
end on

on tabpage_notes.destroy
destroy(this.dw_notes)
end on

type dw_notes from u_dw within tabpage_notes
integer width = 2743
integer height = 1356
integer taborder = 11
string dataobject = "d_net_dev_notes"
boolean vscrollbar = false
boolean border = false
borderstyle borderstyle = stylebox!
end type

event constructor;call super::constructor;This.of_SetTransObject(SQLCA)
end event

event pfc_addrow;//Override
Return 0
end event

event pfc_preupdate;call super::pfc_preupdate;Long ll_rec_id
Integer li_rc
Integer i



IF This.GetItemStatus( 1, 0, Primary! ) = NewModified! THEN
	This.SetItem( 1, "prac_id", il_prac_id)
END IF


Return 0
end event

type tabpage_report from userobject within tab_1
integer x = 18
integer y = 16
integer width = 2715
integer height = 1384
long backcolor = 80269524
string text = "Report"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
string picturename = "RunReport5!"
long picturemaskcolor = 553648127
cb_export cb_export
rb_par_sum rb_par_sum
rb_ai_wn rb_ai_wn
rb_par rb_par
rb_ai rb_ai
dw_report_data dw_report_data
end type

on tabpage_report.create
this.cb_export=create cb_export
this.rb_par_sum=create rb_par_sum
this.rb_ai_wn=create rb_ai_wn
this.rb_par=create rb_par
this.rb_ai=create rb_ai
this.dw_report_data=create dw_report_data
this.Control[]={this.cb_export,&
this.rb_par_sum,&
this.rb_ai_wn,&
this.rb_par,&
this.rb_ai,&
this.dw_report_data}
end on

on tabpage_report.destroy
destroy(this.cb_export)
destroy(this.rb_par_sum)
destroy(this.rb_ai_wn)
destroy(this.rb_par)
destroy(this.rb_ai)
destroy(this.dw_report_data)
end on

type cb_export from commandbutton within tabpage_report
integer x = 2437
integer y = 8
integer width = 247
integer height = 84
integer taborder = 21
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Export"
end type

event clicked;dw_report_data.saveas()
end event

type rb_par_sum from radiobutton within tabpage_report
integer x = 1157
integer y = 12
integer width = 549
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Participation Number"
end type

event clicked;//of_report_selected( "ParNumsSum" )//Start Code Change ----11.10.2008 #V85 maha  - removed for inheritor code
end event

type rb_ai_wn from radiobutton within tabpage_report
integer x = 539
integer y = 12
integer width = 800
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Action Items (with notes)"
end type

event clicked;//of_report_selected( "StatusWithNotes" ) //Start Code Change ----11.10.2008 #V85 maha  - removed for inheritor code
end event

type rb_par from radiobutton within tabpage_report
integer x = 1705
integer y = 12
integer width = 699
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Participation Number Detail"
end type

event clicked;//of_report_selected( "ParNums" )//Start Code Change ----11.10.2008 #V85 maha  - removed for inheritor code
end event

type rb_ai from radiobutton within tabpage_report
integer x = 5
integer y = 12
integer width = 695
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Action Items Report "
boolean checked = true
end type

event clicked;//of_report_selected( "Status" ) //Start Code Change ----11.10.2008 #V85 maha  - removed for inheritor code
end event

type dw_report_data from u_dw within tabpage_report
integer x = 14
integer y = 104
integer width = 2697
integer height = 1252
integer taborder = 11
string dataobject = "d_net_dev_action_items_report_by_prac"
boolean hscrollbar = true
end type

event constructor;call super::constructor;This.Of_SetUpdateable( False )
This.Modify( "datawindow.print.preview=Yes" )
end event

