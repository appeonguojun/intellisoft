$PBExportHeader$pfc_ia_cst_nv_net_dev_new.sru
forward
global type pfc_ia_cst_nv_net_dev_new from pfc_cst_nv_net_dev_prac_folder
end type
type dw_appoint_stat from u_dw within tabpage_ai
end type
type gb_filter_1 from groupbox within tabpage_ai
end type
type cb_2 from commandbutton within tabpage_report
end type
type gb_filter_2 from groupbox within tabpage_report
end type
type cb_1 from commandbutton within pfc_ia_cst_nv_net_dev_new
end type
type p_1 from picture within pfc_ia_cst_nv_net_dev_new
end type
type dw_payors from u_dw within pfc_ia_cst_nv_net_dev_new
end type
type st_filter from statictext within pfc_ia_cst_nv_net_dev_new
end type
type dw_qf from datawindow within pfc_ia_cst_nv_net_dev_new
end type
type st_group_by from statictext within pfc_ia_cst_nv_net_dev_new
end type
type ddlb_group_by from dropdownlistbox within pfc_ia_cst_nv_net_dev_new
end type
type st_zoom from statictext within pfc_ia_cst_nv_net_dev_new
end type
type ddlb_zoom from dropdownlistbox within pfc_ia_cst_nv_net_dev_new
end type
type st_as_msg from statictext within pfc_ia_cst_nv_net_dev_new
end type
type dw_facility_add from u_dw within pfc_ia_cst_nv_net_dev_new
end type
type cb_batch from commandbutton within pfc_ia_cst_nv_net_dev_new
end type
type p_2 from picture within pfc_ia_cst_nv_net_dev_new
end type
end forward

global type pfc_ia_cst_nv_net_dev_new from pfc_cst_nv_net_dev_prac_folder
long backcolor = 80269524
event pfc_cst_reappoint ( )
event pfc_cst_manual_workflow ( )
cb_1 cb_1
p_1 p_1
dw_payors dw_payors
st_filter st_filter
dw_qf dw_qf
st_group_by st_group_by
ddlb_group_by ddlb_group_by
st_zoom st_zoom
ddlb_zoom ddlb_zoom
st_as_msg st_as_msg
dw_facility_add dw_facility_add
cb_batch cb_batch
p_2 p_2
end type
global pfc_ia_cst_nv_net_dev_new pfc_ia_cst_nv_net_dev_new

type variables
Boolean ib_payors_just_retrieved = True
Boolean ib_save = False

Boolean ib_done_retrieving_orgs = False
Boolean ib_report_filter = false

pfc_cst_nv_data_entry_functions inv_data_entry //maha 011706

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-01
//$<add> 02.16.2006 By: Cao YongWang
//$<reason> Performance tuning
//$<modification> Define DataStores to be used in subsequent script.
datastore ids_spec_link
datastore ids_all_spec
datastore ids_address_link
datastore ids_all_addresses
datastore ids_hosp_link
datastore ids_all_hosp
datastore ids_cred_comms
datastore ids_cred_committees
datastore ids_address_linked
//---------------------------- APPEON END ----------------------------

end variables

forward prototypes
public function integer of_multi_add ()
public function integer of_reappoint ()
public function integer of_filter_ids ()
public function integer of_save ()
public function integer of_set_quick_filter (string as_filter_syntax)
public function long of_get_id_count (n_ds ads_cache, integer ai_facility_ids[])
public function integer of_out_to_md_ai (integer ai_facility_id, long ai_app_id, string as_action_type, integer ai_rec_id)
public subroutine of_add_data_links (long al_prac_id, integer ai_facility_id, integer al_rec_id)
public function integer of_refresh_data ()
public function long of_down_image (long al_rec_id, long al_prac_id, long al_app_id, string as_picname)
public function integer of_report_selected_ver9 (string as_report)
public function integer of_par_report_filter ()
end prototypes

event pfc_cst_reappoint;of_reappoint()
end event

event pfc_cst_manual_workflow();//Added for work flow trigger. 14/11/2006 Henry
String ls_rtn

str_manual_wf lstr_workflow

lstr_workflow.is_module = '02'

lstr_workflow.il_prac_id =  il_prac_id

lstr_workflow.il_facility_id = ii_facility_id

OpenWithParm(w_manual_workflow_list , lstr_workflow)

ls_rtn = Message.stringparm

If ls_rtn = 'OK' then of_retrieve_facilities()
end event

public function integer of_multi_add ();Integer z
Integer li_rc
String li_app_id
Long ll_rec_id
Long ll_action_type			
Long ll_action_status
Long ll_action_dept
String ls_app_type
String ls_action_notes
DateTime ldt_action_date
Integer li_fac_cnt = 0
Integer f
Boolean lb_facility_created
Integer li_facility_id
Integer li_facility_cnt
Integer li_address_cnt
Integer li_cnt
Integer i
Integer li_facility_ids[]
//Start Code Change ---- 01.17.2006 #197 maha
integer li_ver_facility //maha 011706
integer li_app_audit_facility //maha 011706
gs_pass_ids lstr_ids
long	ll_recid_app  //Start Code Change ----04.16.2008 #V8 maha - changed from inappropriate integer to long also changed variable name and all code refering to it
long ll_find , ll_id_count

datastore lds_facility
n_ds lds_facility_cnt


Open( w_select_payor )

IF Message.StringParm = "Cancel" THEN
	Return 0
ELSE
	lstr_ids = Message.PowerObjectParm
END IF

li_cnt = UpperBound( lstr_ids.i_facility_ids )

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-02
//$<modify> 02.16.2006 By: Cao YongWang
//$<reason> Performance tuning.
//$<modification> 1)Comment out the following script since it is not used in of_multi_add at all.
//$<modification> 2)Use datastores to retrieve data from database instead of using SQLs in
//$<modification> of_field_audit, of_add_address_link, of_add_hosp_link and of_add_spec_link
//$<modification> 3)Get the IDs from database by li_recids.
//$<modification> 4)Integrate the SQLs to retrieve data for the datastores in Appeon Queue labels 
//$<modification> to reduce client-server interactions. Refer to PT-06 for more information.

/*
SELECT Count( rec_id )
INTO :li_address_cnt
FROM pd_address
WHERE prac_id = :il_prac_id;
IF SQLCA.SQLCODE = -1 THEN
	MessageBox("Database Error", SQLCA.SQLERRTEXT )
	Return -1
END IF			
*/


li_facility_cnt = -9
//Add Appeon start queue label
gnv_appeondb.of_startqueue()

ids_address_link = CREATE datastore
ids_address_link.DataObject = "d_address_link_prac"
ids_address_link.settransobject( SQLCA)
//ids_address_link.retrieve( il_prac_id )

ids_all_addresses = CREATE datastore
ids_all_addresses.DataObject = "d_address_link_all_addresses"
ids_all_addresses.settransobject( SQLCA)
ids_all_addresses.retrieve( il_prac_id )

//
ids_address_linked = CREATE datastore
ids_address_linked.DataObject = "d_pd_address_link_all_pt"
ids_address_linked.settransobject( SQLCA)
ids_address_linked.retrieve( il_prac_id , lstr_ids.i_facility_ids[])
//

ids_hosp_link = CREATE datastore
ids_hosp_link.DataObject = "d_hf_link"
ids_hosp_link.SetTransObject( SQLCA )
ids_hosp_link.Retrieve( il_prac_id )

ids_all_hosp = CREATE datastore
ids_all_hosp.DataObject = "d_hosp_affil_prac"
ids_all_hosp.SetTransObject( SQLCA )
ids_all_hosp.Retrieve( il_prac_id )

ids_spec_link = CREATE datastore
ids_spec_link.DataObject = "d_sf_link"
ids_spec_link.SetTransObject( SQLCA )
ids_spec_link.Retrieve( il_prac_id )

ids_all_spec = CREATE datastore
ids_all_spec.DataObject = "d_spec_of_prac"
ids_all_spec.SetTransObject( SQLCA )
//ids_all_spec.Retrieve( al_prac_id )

lds_facility_cnt = create n_ds
lds_facility_cnt.dataobject= "d_pd_affil_stat_parent_facility_id_cnt"
lds_facility_cnt.settransobject(SQLCA)
lds_facility_cnt.retrieve(il_prac_id , lstr_ids.i_facility_ids[])
//
lds_facility = create datastore
lds_facility.dataobject = 'd_facility_id_list'
lds_facility.settransobject(SQLCA)
lds_facility.retrieve(lstr_ids.i_facility_ids[])
//
ids_cred_comms = create datastore
ids_cred_comms.dataobject = 'd_dddw_credentialing_committees_all_pt'
ids_cred_comms.settransobject(sqlca)
ids_cred_comms.retrieve(lstr_ids.i_facility_ids[])

ids_cred_committees = create datastore
ids_cred_committees.dataobject = 'd_pd_comm_review'
ids_cred_committees.settransobject(sqlca)

gnv_appeondb.of_commitqueue()
//---------------------------- APPEON END ----------------------------


//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-31
//$<add> 02.16.2006 By: Cao YongWang
//$<reason> Performance tuning
//$<modification> Define a variable to 1)get the first ID; 2)Update the final ID
//$<modification> value into database.
//Get none facility id count
ll_id_count = of_get_id_count(lds_facility_cnt , lstr_ids.i_facility_ids[])
If ll_id_count > 0 Then ll_rec_id = gnv_app.of_Get_Id("RECORD_ID" , ll_id_count) - 1
ll_recid_app = gnv_app.of_Get_Id("RECORD_ID" , (li_cnt + li_cnt * upperbound(lstr_ids.s_action_type))) - 1
//---------------------------- APPEON END ----------------------------

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-03
//$<add> 02.16.2006 By: Cao YongWang
//$<reason> Performance tuning
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

gnv_appeondb.of_startqueue()
//---------------------------- APPEON END ----------------------------

dw_facility_add.settransobject(sqlca)

FOR i = 1 TO li_cnt
	
	//messagebox("", "fdfas" )

	li_facility_id = lstr_ids.i_facility_ids[ i ]
	li_app_id = lstr_ids.s_ids[ i ]
	
	IF gs_cust_type = "I" THEN
		li_app_audit_facility = 1   
		li_ver_facility = 1
	ELSE
		//get default facility values
		//--------------------------- APPEON BEGIN ---------------------------
		//$<ID> PT-04
		//$<modify> 02.16.2006 By: Cao YongWang
		//$<reason> Performance tuning.
		//$<modification> Write script to retrieve data from a cache instead of from the database.

		/*
		SELECT facility.default_audit_temp,   
				 facility.default_verif_facility  
		INTO :li_app_audit_facility,   
			  :li_ver_facility  
		FROM facility  
		WHERE facility.facility_id = :li_facility_id   ;
		IF SQLCA.SQLCODE = -1 THEN
			MessageBox("SQL Error", SQLCA.SQLERRTEXT )
			Return -1
		END IF
		if isnull(li_app_audit_facility) then li_app_audit_facility = 1
		if isnull(li_ver_facility) then li_ver_facility = 1
		*/
		ll_find = lds_facility.find( "facility_id="+string(li_facility_id), 1,lds_facility.RowCount())
		If not ll_find > 0 Then 
			li_app_audit_facility = 1
			li_ver_facility = 1
		Else
			li_app_audit_facility = lds_facility.getitemnumber(ll_find,'default_audit_temp')
			li_ver_facility =  lds_facility.getitemnumber(ll_find,'default_verif_facility')
		End If
		//--------------------------- APPEON END ---------------------------
	END IF
	
	//check to see if the selected facility is already there
	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> PT-05
	//$<modify> 02.16.2006 By: Cao YongWang
	//$<reason> Performance tuning.
	//$<modification> Write script to retrieve data from a cache instead of from the database.
	/*
	SELECT Count( parent_facility_id )
	INTO :li_facility_cnt
	FROM pd_affil_stat
	WHERE prac_id = :il_prac_id AND
	      parent_facility_id = :li_facility_id;
	IF SQLCA.SQLCODE = -1 THEN
		MessageBox("Database Error", SQLCA.SQLERRTEXT )
		Return -1
	END IF			
	*/
	ll_find = lds_facility_cnt.find( "parent_facility_id="+string(li_facility_id), 1,lds_facility_cnt.RowCount())
	If ll_find > 0 Then
		li_facility_cnt = lds_facility_cnt.getitemnumber(ll_find,'cnt')
	else
		li_facility_cnt = 0
	end if
	//---------------------------- APPEON END ----------------------------
	
	if li_facility_cnt = 0 then
			//--------------------------- APPEON BEGIN ---------------------------
			//$<ID> PT-32
			//$<modify> 02.16.2006 By: Cao YongWang
			//$<modification> Comment out the following script to reduce client-server interaction.
			//$<modification> refer to PT-31 and of_get_id for more information.
			/*
			ll_rec_id = gnv_app.of_Get_Id("RECORD_ID")
			*/
			ll_rec_id++
			//---------------------------- APPEON END ----------------------------

			//maha 011706 replaced insert code with datawindow to allow audit function call
			dw_facility_add.reset()
			dw_facility_add.insertrow(1)
			dw_facility_add.setitem(1,"rec_id",ll_rec_id)
			dw_facility_add.setitem(1,"prac_id",il_prac_id)
			dw_facility_add.setitem(1,"seq_no",1)
			dw_facility_add.setitem(1,"affiliation_status","M")
			//Start Code Change ---- 03.08.2006 #315 maha		
			dw_facility_add.setitem(1,"parent_facility_id",li_facility_id)
			//End Code Change---03.08.2006
			dw_facility_add.setitem(1,"apptmnt_type","I")
			dw_facility_add.setitem(1,"verifying_facility",li_ver_facility)
			dw_facility_add.setitem(1,"application_audit_facility",li_app_audit_facility)
			dw_facility_add.setitem(1,"active_status",1)
			dw_facility_add.setitem(1,"priority_user","PUBLIC")
			dw_facility_add.setitem(1,"priority",1)

//			INSERT INTO pd_affil_stat  
//				( rec_id,   
//				  prac_id,   
//				  seq_no,
//				  affiliation_status,   
//				  parent_facility_id,   
//				  apptmnt_type,   
//				  verifying_facility,   
//				  application_audit_facility,
//				  active_status)  
//			VALUES ( :ll_rec_id,   
//				  :il_prac_id,   
//				  1,
//				  'M',   
//				  :li_facility_id,   
//				  'I',   
//				  1,   
//				  1,
//				 1)  ;
//			IF SQLCA.SQLCODE = -1 THEN
//				MessageBox("SQL Error Inserting  Appointment Record", SQLCA.SQLERRTEXT )
//				Return -1
//			END IF

			//--------------------------- APPEON BEGIN ---------------------------
			//$<ID> PT-06
			//$<add> 02.16.2006 By: Cao YongWang
			//$<reason> Performance tuning.
			//$<modification> 1)Comment out the following script. 
			//$<modification> 2)The fucntionality for the four functions to retrieve data from database is replaced
			//$<modification> by the script in PT-02.
			//$<modification> 3)Other functionality besides retrievals is moved to of_add_data_links
			//$<modification> 4)Write script to retrieve data from the datastores in PT-02.
			//$<modification> 5)Call of_add_data_links function
			/*
			if dw_facility_add.update() = -1 then
				return -1
			end if
			
			inv_data_entry.of_field_audit( dw_facility_add ) //maha 011706
			inv_data_entry.of_add_address_link( il_prac_id, li_facility_id )
			inv_data_entry.of_add_hosp_link( li_facility_id , il_prac_id)
			inv_data_entry.of_add_spec_link( li_facility_id , il_prac_id )
			if gs_cust_type <> "I" then
				inv_data_entry.of_add_committees( il_prac_id, li_facility_id, ll_rec_id ) //maha 011706
			end if
			*/
			ids_cred_comms.setfilter("facility_id=" + string(li_facility_id))
			ids_cred_comms.filter( )
			of_add_data_links(il_prac_id , li_facility_id , ll_rec_id)
			//--------------------------- APPEON END ---------------------------
//End Code Change---01.17.2006
	END IF
	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> PT-07
	//$<add> 02.16.2006 By: Cao YongWang
	//$<reason> Performance tuning.
	//$<modification> Use li_recids to get the IDs in PT-02 instead of using SQLs in of_out_to_md_ai.
	//$<modification> And then pass li_receds to of_out_to_md_ai as an argument to reduce client
	//$<modification> -server interactions.
	/*
	IF of_out_to_md_ai( li_facility_id, long( li_app_id ), "App Out To MD" ) = -1 THEN //changed to long from integer 040704 maha
		Return -1
	END IF
	*/
	ll_recid_app++
	IF of_out_to_md_ai( li_facility_id, long( li_app_id ), "App Out To MD" ,ll_recid_app) = -1 THEN //Start Code Change ----04.16.2008 #V8 maha - corrected for variable
		Return -1
	END IF
	//---------------------------- APPEON END ----------------------------
	li_rc = UpperBound( lstr_ids.s_action_type[] )

	FOR z = 1 TO li_rc
		//--------------------------- APPEON BEGIN ---------------------------
		//$<ID> PT-08
		//$<add> 02.16.2006 By: Cao YongWang
		//$<reason> Performance tuning.
		//$<modification> Use ll_recid_app to get the IDs in PT-02 instead of using SQLs in of_out_to_md_ai.
		//$<modification> And then pass li_receds to of_out_to_md_ai as an argument to reduce client
		//$<modification> -server interactions.
		/*
		IF of_out_to_md_ai( li_facility_id, Integer( li_app_id ), lstr_ids.s_action_type[z] ) = -1 THEN
			Return -1
		END IF
		*/
		ll_recid_app++
		IF of_out_to_md_ai( li_facility_id, Integer( li_app_id ), lstr_ids.s_action_type[z],ll_recid_app ) = -1 THEN  //Start Code Change ----04.16.2008 #V8 maha - corrected for variable
			Return -1
		END IF
		//---------------------------- APPEON END ----------------------------
	END FOR

END FOR
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-09
//$<add> 02.16.2006 By: Cao YongWang
//$<reason> Performance tuning.
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.
dw_facility_add.update() 

ids_spec_link.update()
ids_address_link.update()
ids_hosp_link.update()
ids_cred_committees.update()
gnv_appeondb.of_commitqueue()

destroy ids_spec_link
destroy ids_all_spec
destroy ids_address_link
destroy ids_all_addresses
destroy ids_hosp_link
destroy ids_all_hosp
destroy lds_facility_cnt
destroy ids_cred_committees
destroy ids_cred_comms
destroy lds_facility
//---------------------------- APPEON END ----------------------------

MessageBox( "Data Links", "Make sure you update your Address, Hospital and Specialty links for the new Payer/Hospitals you have added.", Information! )



dw_orgs_facilities.Retrieve( il_prac_id, gs_user_id )

tab_1.tabpage_ai.dw_net_dev.SetRedraw( True )

//dw_orgs_facilities.SelectRow( 1, True )

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 2006-09-22 By: Rodger Wu
//$<reason> Set variables as follows and added facility will be retrieved
//$<reason> as the user goes to the individual tab as needed.

IF  Isvalid(w_prac_data_1) then  //Start Code Change ---- 02.07.2007 #V7 maha added trap for intelliapp window.
	w_prac_data_1.ib_app_audit_retrieved = False
	w_prac_data_1.ib_affil_stat_retrieved = False
	w_prac_data_1.ib_verif_info_retrieved = False
	w_prac_data_1.ib_priv_retrieved = False
end if

//---------------------------- APPEON END ----------------------------

Return 1


end function

public function integer of_reappoint ();Integer li_rc
Integer i
Integer li_ans
Integer li_facility_id
Long ll_action_type
Long ll_app_id
String ls_payor

// mskinner 17 Dec 2005 -- begin
// due to menu management issues the function is being call at inappropriate time
// added trap to prevent the crash. Need to fix the menus
if dw_orgs_facilities.GetRow( ) < 1 then return -1
// mskinner 17 Dec 2005 -- end

ls_payor = dw_orgs_facilities.GetItemString( dw_orgs_facilities.GetRow( ), "parent_facility" )
li_facility_id = dw_orgs_facilities.GetItemNumber( dw_orgs_facilities.GetRow( ), "parent_facility_id" )
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-10
//$<modify> 02.15.2006 By: Cao YongWang
//$<reason> Performance tuning.
//$<modification> Write script to retrieve data from a cache instead of from the database.

/*
SELECT lookup_code INTO :ll_action_type from code_lookup where lookup_name = 'Action Type' and code = 'App Out To MD';
IF SQLCA.SQLCODE = 100 THEN
	MessageBox("Error 1", "To automatically create an Network Development Action item for IntelliApp you will need to add 'App Out To MD' to the Action Type lookup table." )
	Return -1
END IF
*/
ll_action_type = long(gnv_data.of_getitem("code_lookup","lookup_code","upper(lookup_name) = 'ACTION TYPE' and upper(code) = 'APP OUT TO MD'"))
//---------------------------- APPEON END ----------------------------

IF gi_intelliapp_type > 0 THEN
	IF il_app_id = 0 THEN
		MessageBox("Reappointment", "You must select a specific payor/hospital.  Please try again." )
		Return -1
	END IF
	ll_app_id = il_app_id
ELSE
	SELECT Distinct net_dev_action_items.app_id  
	INTO :ll_app_id  
	FROM net_dev_action_items  
	WHERE ( net_dev_action_items.prac_id = :il_prac_id ) AND  
      ( net_dev_action_items.facility_id = :li_facility_id ) AND  
      ( net_dev_action_items.active_status = 1 ) AND  
      ( net_dev_action_items.action_type = :ll_action_type )   ;
END IF
IF SQLCA.SQLCODE = -1 THEN
	MessageBox( "SQL Error 2", SQLCA.SQLERRTEXT )
	Return 0
END IF

IF IsNull( ll_app_id ) THEN
	ll_app_id = 0
END IF

OpenWithParm( w_initiate_reappointment, ls_payor + "-" + String( ll_app_id ) )

IF Message.StringParm = "Cancel" THEN
	Return 0
END IF
		
UPDATE net_dev_action_items
SET active_status = 0
WHERE prac_id = :il_prac_id AND
      facility_id = :li_facility_id AND
		active_status = 1;
IF SQLCA.SQLCODE = -1 THEN
	MessageBox( "SQL Error 3", SQLCA.SQLERRTEXT )
	Return 0
END IF
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-33
//$<modify> 02.15.2006 By: Cao YongWang 
//$<reason> Performance tuning.
//$<modification> Use li_recids to get the IDs instead of using SQLs in of_out_to_md_ai.
//$<modification> And then pass li_receds to of_out_to_md_ai as an argument to reduce client
//$<modification> -server interactions.
/*
IF of_out_to_md_ai( li_facility_id, ll_app_id, "App Out To MD" ) = -1 THEN
	Return -1
END IF
*/
long ll_rec_id
ll_rec_id = gnv_app.of_Get_Id("RECORD_ID")	
IF of_out_to_md_ai( li_facility_id, ll_app_id, "App Out To MD" ,ll_rec_id) = -1 THEN
	Return -1
END IF
//---------------------------- APPEON END ----------------------------
		
of_retrieve_detail( li_facility_id )
of_report_selected_ver9( "NONE") //Start Code Change ----11.10.2008 #V85 maha

Return 0
end function

public function integer of_filter_ids ();Integer li_rc
Integer i
String ls_filter

IF dw_payors.RowCount( ) = 1 THEN
	tab_1.tabpage_ids.dw_ids.SetFilter( "facility_id = 999" )
	tab_1.tabpage_ids.dw_ids.Filter( )	
	Return 1
END IF

IF il_app_id > 0 THEN
	ls_filter = "app_id = " + String( il_app_id ) 
	IF ii_facility_id > 0 THEN
		ls_filter = ls_filter + " AND facility_id = " + String( ii_facility_id ) 	
	END IF
	tab_1.tabpage_ids.dw_ids.SetFilter( ls_filter )
	tab_1.tabpage_ids.dw_ids.Filter( )
	dw_payors.PostEvent( "ue_after_retrieve" )
	//messagebox("1", ls_filter )
elseif ii_facility_id > 0 THEN
	ls_filter = ls_filter + " facility_id = " + String( ii_facility_id ) 
	tab_1.tabpage_ids.dw_ids.SetFilter( ls_filter )
	tab_1.tabpage_ids.dw_ids.Filter( )	
	//messagebox("2", ls_filter )	
ELSE
	tab_1.tabpage_ids.dw_ids.SetFilter( "" )
	tab_1.tabpage_ids.dw_ids.Filter( )		
	IF tab_1.tabpage_ids.dw_ids.RowCount( ) > 0 THEN
		IF tab_1.tabpage_ids.dw_ids.GetItemStatus( 1, 0, Primary! ) = New! THEN
			tab_1.tabpage_ids.dw_ids.DeleteRow( 1 )
		END IF
	END IF
	//messagebox("1", "none" )	
END IF

//messagebox("", ls_filter )

RETURN 0

end function

public function integer of_save ();Integer li_retval = 0

IF ib_save THEN
	tab_1.tabpage_ids.dw_ids.AcceptText()
	tab_1.tabpage_ai.dw_net_dev.AcceptText()	
	tab_1.tabpage_ai.dw_appoint_stat.AcceptText()
	IF lb_from_prac_folder THEN
		IF IsValid( w_prac_data_intelliapp ) THEN
			li_retval = w_prac_data_intelliapp.Event pfc_save()
		ELSEIF IsValid( w_prac_data_1 ) THEN
			li_retval = w_prac_data_1.Event pfc_save()
		END IF
	ELSE
		IF IsValid( w_action_items ) THEN
			li_retval = w_action_items.Event pfc_save()
		END IF
	END IF
	ib_save = False
END IF

Return li_retval
end function

public function integer of_set_quick_filter (string as_filter_syntax);//--------------------------- APPEON BEGIN ---------------------------
//$<add> 03/18/2008 By: Ken.Guo
//$<reason> Save data before filter,Fix BugJ022705.
Long li_retval
li_retval = of_save()
IF li_retval < 0 THEN
	Return 1
END IF
//---------------------------- APPEON END ----------------------------


dwitemstatus idw
if tab_1.tabpage_ai.dw_net_dev.rowcount() = 1 then
	idw =  tab_1.tabpage_ai.dw_net_dev.getitemstatus(1,0,primary!)
	Choose Case idw
		case new!
			tab_1.tabpage_ai.dw_net_dev.deleterow(1)
	End choose
end if

String ls_filter

//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 11.08.2006 By: Jervis
//$<reason> modify work flow
/*
ls_filter = as_filter_syntax
IF IsNull( ls_filter ) OR ls_filter = "" THEN
	tab_1.tabpage_ai.dw_net_dev.SetFilter( "" )
ELSE
	tab_1.tabpage_ai.dw_net_dev.SetFilter( ls_filter)
END IF
*/
ls_filter = as_filter_syntax
IF IsNull( ls_filter ) OR ls_filter = "" THEN
	tab_1.tabpage_ai.dw_net_dev.SetFilter( "active_status >= 0" )
ELSE
	tab_1.tabpage_ai.dw_net_dev.SetFilter( ls_filter + " and active_status >= 0" )
END IF
//---------------------------- APPEON END ----------------------------


//messagebox("", ls_filter )

ib_filter_set = True

tab_1.tabpage_ai.dw_net_dev.Filter( )
tab_1.tabpage_ai.dw_net_dev.GroupCalc ( ) //maha 062905
st_as_msg.visible = false //maha 062905

Return 1
end function

public function long of_get_id_count (n_ds ads_cache, integer ai_facility_ids[]);//////////////////////////////////////////////////////////////////////
// $<function>pfc_ia_cst_nv_net_dev_new.of_get_id_count()
// $<arguments>
//		value	n_ds   	ads_cache        		
//		value	integer	ai_facility_ids[]		
// $<returns> long
// $<description>
// $<description>
//////////////////////////////////////////////////////////////////////
// $<add> 02.16.2006 by Cao YongWang
//////////////////////////////////////////////////////////////////////
long	ll_id_count = 0
long	ll_i , ll_find

For ll_i = 1 To upperbound(ai_facility_ids[])
	ll_find = ads_cache.find("parent_facility_id = "  +string(ai_facility_ids[ll_i]) , 1 , ads_cache.Rowcount())
	If not ll_find > 0 Then ll_id_count++
Next

return ll_id_count
end function

public function integer of_out_to_md_ai (integer ai_facility_id, long ai_app_id, string as_action_type, integer ai_rec_id);//Add an argument ai_rec_id which will replace the script 'll_rec_id = gnv_app.of_Get_Id("RECORD_ID")'


	Long ll_action_type
	Long ll_action_status
	Long ll_action_dept
	Long ll_rec_id
	String ls_action_notes
	String ls_app_type
	DateTime ldt_action_date
	Date ld_due_date
	
	ld_due_date = Today()
	//maha changed app id in function declaration to long 040704
	
	//\/maha 101901
	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> PT-11
	//$<modify> 02.15.2006 By: Cao YongWang
	//$<reason> Performance tuning.
	//$<modification> Write script to retrieve data from a cache instead of from the database.

	/*
	select lookup_code into :ll_action_type from code_lookup where lookup_name = 'Action Type' and code = :as_action_type;
	IF SQLCA.SQLCODE = 100 THEN
		MessageBox("Error", "To automatically create an Network Development Action item for IntelliApp you will need to add 'App Out To MD' to the Action Type lookup table." )
		Return -1
	END IF
	*/
	ll_action_type=long(gnv_data.of_getitem("code_lookup","lookup_code","upper(lookup_name) = 'ACTION TYPE' and upper(code) = '"+upper(as_action_type)+"'"))
	//---------------------------- APPEON END ----------------------------

	//ll_action_type = -3
	//if its not app out to md then use a pending status
	IF as_action_type <> "App Out To MD" THEN
		//--------------------------- APPEON BEGIN ---------------------------
		//$<ID> PT-12
		//$<modify> 02.15.2006 By: Cao YongWang
		//$<reason> Performance tuning.
		//$<modification> Write script to retrieve data from a cache instead of from the database.
		/*
		select lookup_code into :ll_action_status from code_lookup where lookup_name = 'Action Status' and code = 'Pending';
		IF SQLCA.SQLCODE = 100 THEN
			MessageBox("Error", "To automatically create an Network Development Action item for IntelliApp you will need to add 'Incomplete' to the Action Status lookup table." )
			Return -1
		END IF				
		*/
		ll_action_status=long(gnv_data.of_getitem("code_lookup","lookup_code","upper(lookup_name) = 'ACTION STATUS' and upper(code) = '"+upper('Pending')+"'"))
		//---------------------------- APPEON END ---------------------------	
	ELSE
		//--------------------------- APPEON BEGIN ---------------------------
		//$<ID> PT-13
		//$<modify> 02.15.2006 By: Cao YongWang
		//$<reason> Performance tuning.
		//$<modification> Write script to retrieve data from a cache instead of from the database.
		/*
		select lookup_code into :ll_action_status from code_lookup where lookup_name = 'Action Status' and code = 'Incomplete';
		IF SQLCA.SQLCODE = 100 THEN
			MessageBox("Error", "To automatically create an Network Development Action item for IntelliApp you will need to add 'Incomplete' to the Action Status lookup table." )
			Return -1
		END IF					
		*/
		ll_action_status=long(gnv_data.of_getitem("code_lookup","lookup_code","upper(lookup_name) = 'ACTION STATUS' and upper(code) = '"+upper('Incomplete')+"'"))
		//---------------------------- APPEON END ---------------------------	
	END IF
	
	//ll_action_status = -110
	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> PT-14
	//$<modify> 02.15.2006 By: Cao YongWang
	//$<reason> Performance tuning.
	//$<modification> Write script to retrieve data from a cache instead of from the database.

	/*
	select lookup_code into :ll_action_dept from code_lookup where lookup_name = 'Action Department' and code = 'Credentialing';
	IF SQLCA.SQLCODE = 100 THEN
		MessageBox("Error", "To automatically create an Network Development Action item for IntelliApp you will need to add 'Credentailing' to the Action Department lookup table." )
		Return -1
	END IF	
	ll_rec_id = gnv_app.of_Get_Id("RECORD_ID")							
	*/
	ll_action_dept=long(gnv_data.of_getitem("code_lookup","lookup_code","upper(lookup_name) = 'ACTION DEPARTMENT' and upper(code) = '"+upper('Credentialing')+"'"))
	ll_rec_id = ai_rec_id
	//---------------------------- APPEON END ---------------------------	

	//--------------------------- APPEON BEGIN ---------------------------
	//$<comment> 2005-11-17 By: Zhang Lingping
	//$<reason> The parameter value '"' is not validate in ODBC. 
	// ls_action_notes = ""
	//---------------------------- APPEON END ----------------------------
	
	IF as_action_type <> "App Out To MD" THEN
		//IF NOT app out to md leave as blank date
		SetNull( ldt_action_date )
	ELSE
		ldt_action_date = DateTime( Today(), Now() )
	END IF
	
	//--------------------------- APPEON BEGIN ---------------------------
	//$<modify> 2005-11-17 By: Zhang Lingping
	//$<reason> The notes column is text column in SQL DB. Thr value "" will
	//$<reason> can not pass ODBC check.
	
//	INSERT INTO net_dev_action_items  
//   		    ( rec_id,   
//	    	      prac_id,   
//				   seq_no,
//     	     	   action_type,   
//			      action_date,   
//	    			action_dept,   
//     	     	   action_user,   
//		     	   next_action_date,   
//			      notes,   
//		     	   action_status,   
//				   facility_id,
//				   app_id,
//				   app_type,
//				   active_status,
//					due_date)  
//	VALUES ( :ll_rec_id,   
//     	      :il_prac_id,  
//				:ll_rec_id,					
//	    	   :ll_action_type,   
//	     	   null,   
//				:ll_action_dept,   
//	     		:gs_user_id,   
//				null,   
//		     	:ls_action_notes ,   
//			   :ll_action_status,   
//	     		:ai_facility_id,
//				:ai_app_id,
//				:ls_app_type,
//				1,
//				:ld_due_date)
// 	USING SQLCA;

	INSERT INTO net_dev_action_items  
   		    ( rec_id,   
	    	      prac_id,   
				   seq_no,
     	     	   action_type,   
			      action_date,   
	    			action_dept,   
     	     	   action_user,   
		     	   next_action_date,   
			      notes,   
		     	   action_status,   
				   facility_id,
				   app_id,
				   app_type,
				   active_status,
					due_date)  
	VALUES ( :ll_rec_id,   
     	      :il_prac_id,  
				:ll_rec_id,					
	    	   :ll_action_type,   
	     	   null,   
				:ll_action_dept,   
	     		:gs_user_id,   
				null,   
		     	'',   
			   :ll_action_status,   
	     		:ai_facility_id,
				:ai_app_id,
				:ls_app_type,
				1,
				:ld_due_date)
 	USING SQLCA;
	//---------------------------- APPEON END ----------------------------

	IF SQLCA.SQLCODE = -1 THEN
			MessageBox("Database Error", SQLCA.SQLERRTEXT )
			Return -1
	END IF			
	
	RETURN 0

end function

public subroutine of_add_data_links (long al_prac_id, integer ai_facility_id, integer al_rec_id);//////////////////////////////////////////////////////////////////////
// $<function>pfc_ia_cst_nv_net_dev_new.of_add_data_links()
// $<arguments>
//		value	long	al_prac_id    		
//		value	long	al_facility_id		
// $<returns> (none)
// $<description> Add data links. Add address link , Add hospital link, Add specialty link.
// $<description> This function contain the funtion of of_add_address_link funtion,of_add_hosp_link function 
// $<description> and of_add_spec_link function in pfc_cst_nv_data_entry_functions userobject
//////////////////////////////////////////////////////////////////////
// $<add> 02.16.2006 by Cao YongWang
//////////////////////////////////////////////////////////////////////

Integer li_hosp_cnt , li_spec_cnt , li_address_cnt
Integer i 
Integer li_nr
Integer li_found
long ll_rec //maha 121702
Long ll_hosp_id , ll_address_id , ll_addr_id //maha 02-26-01
integer li_num_comms , c , cnt
long ll_comm_id

//Add address link

li_address_cnt = ids_all_addresses.Rowcount()

//for each address put an entry in the address link table for the new facility being added
FOR i = 1 TO li_address_cnt
	//\/maha 02-26-01 check to see if link already exists 
	ll_addr_id = ids_all_addresses.GetItemNumber( i, "rec_id" )	
	
	cnt = ids_address_linked.find("address_id=" + string(ll_addr_id),1,ids_address_linked.Rowcount())
	if cnt > 0 then continue
	//\maha
	li_nr = ids_address_link.InsertRow( 0 )	
	ids_address_link.SetItem( li_nr, "prac_id", il_prac_id )
	ids_address_link.SetItem( li_nr, "address_id", ll_addr_id )
	ids_address_link.SetItem( li_nr, "facility_id", ai_facility_id )
	ids_address_link.SetItem( li_nr, "billing", 0 )//maha app100305
	ids_address_link.SetItem( li_nr, "mailing", 0 )//maha app100305
//Start Code Change ---- 01.25.2006 #221 maha
	ids_address_link.SetItem( li_nr, "home_address", 0 )
	ids_address_link.SetItem( li_nr, "primary_office", 0 )
	ids_address_link.SetItem( li_nr, "additional_office", 0 )
	ids_address_link.SetItem( li_nr, "include_in_directory", 0 )
	ids_address_link.SetItem( li_nr, "exp_letters", 0 )
//End Code Change---01.25.2006 			
			
	
END FOR



//Add the hosp link
li_hosp_cnt = ids_all_hosp.Rowcount()

//for each hospital put an entry in the hospital link table for the new facility being added
FOR i = 1 TO li_hosp_cnt
	ll_rec = ids_all_hosp.GetItemNumber( i, "rec_id" )

	li_found = ids_hosp_link.Find( "facility_id = " + String( ai_facility_id ) + " and hosp_affil_id = " + string(ll_rec), 1, 1000 )
	IF li_found > 0 THEN
		CONTINUE
	END IF
	li_nr = ids_hosp_link.InsertRow( 0 )	
	ids_hosp_link.SetItem( li_nr, "prac_id", al_prac_id )
	ids_hosp_link.SetItem( li_nr, "hosp_affil_id", ll_rec )
	ids_hosp_link.SetItem( li_nr, "facility_id", ai_facility_id )
END FOR

//Add specialty link
li_spec_cnt = ids_all_spec.Rowcount()

//for each specialty put an entry in the specialty link table for the new facility being added
FOR i = 1 TO li_spec_cnt
	ll_rec = ids_all_spec.GetItemNumber( i, "rec_id" ) //maha 121702
	li_found = ids_spec_link.Find( "facility_id = " + String( ai_facility_id ) + " and specialty_id = " + string(ll_rec), 1, 1000 )
	IF li_found > 0 THEN
		CONTINUE
	END IF	
	li_nr = ids_spec_link.InsertRow( 0 )	
	ids_spec_link.SetItem( li_nr, "prac_id", al_prac_id )
	ids_spec_link.SetItem( li_nr, "specialty_id", ll_rec )
	ids_spec_link.SetItem( li_nr, "facility_id", ai_facility_id )
	ids_spec_link.SetItem( li_nr, "practicing", 582 )
next

//Add committee lind
if gs_cust_type <> "I" then

	li_num_comms = ids_cred_comms.RowCount()
	FOR c = 1 TO li_num_comms
		li_nr = ids_cred_committees.InsertRow( 0 )
		ll_comm_id = ids_cred_comms.GetItemNumber( c, "committee_id" )
		ids_cred_committees.SetItem( li_nr, "facility_id", ai_facility_id )
		ids_cred_committees.SetItem( li_nr, "committee_id", ll_comm_id )
		ids_cred_committees.SetItem( li_nr, "active_status", 1 )
		ids_cred_committees.SetItem( li_nr, "rec_id", al_rec_id )
		ids_cred_committees.SetItem( li_nr, "prac_id", al_prac_id )
		ids_cred_committees.SetItem( li_nr, "seq_no", 1 )
	END FOR
End If
end subroutine

public function integer of_refresh_data ();//--------------------------- APPEON BEGIN ---------------------------
//$<add> 11.08.2006 By: Jervis
//$<reason> modify workflow,refresh data when active status changed
integer li_rc

li_rc = tab_1.tabpage_ai.dw_net_dev.Retrieve( )
if li_rc = 0 then
	tab_1.tabpage_ai.dw_net_dev.InsertRow( 0 )
end if

tab_1.tabpage_report.dw_report_data.SetSort( "v_full_name_full_name a, facility_name1 a, action_date a" )
tab_1.tabpage_report.dw_report_data.Sort( )
//---------------------------- APPEON END ----------------------------

return 0

end function

public function long of_down_image (long al_rec_id, long al_prac_id, long al_app_id, string as_picname);//------------------------------------------------------------------------------
// Function: of_Down_Image()
//------------------------------------------------------------------------------
// Description: DownLoad Image to Local directory
// Arguments:
//		1 -- al_rec_id
//		2 -- al_prac_id
//		3 -- al_app_id
//		3 -- as_PicName
// Return Value: 
//	  -1 -- Failed
//		1 -- Sucess
//------------------------------------------------------------------------------
// Author:	Scofield		Date: 2008-07-09
//------------------------------------------------------------------------------
// Revision History: 
//				1.0   Initial version
//==============================================================================

long		ll_FileNo,ll_Cycle,ll_DataLen,ll_Count,ll_Start,ll_FileLen
Blob		lblb_Buffer

long 		READ_ONE_COUNT = 8000

SetPointer (HourGlass!)

if FileExists(as_PicName) then ll_FileLen = FileLength(as_PicName)

SELECT Datalength(net_dev_action_images.image_data)
  INTO :ll_DataLen
  FROM net_dev_action_images
 WHERE rec_id = :al_rec_id AND prac_id = :al_prac_id AND app_id = :al_app_id ;

if IsNull(ll_DataLen) or ll_DataLen <= 0 then Return -1
if ll_DataLen = ll_FileLen then Return 1

ll_FileNo = FileOpen(as_PicName,StreamMode!,Write!,LockReadWrite!,Replace!)
if ll_FileNo <= 0 then Return -1

ll_Count = Ceiling(ll_DataLen/READ_ONE_COUNT)

if AppeonGetClientType() = 'PB' and gs_dbtype = 'SQL' and ll_DataLen > READ_ONE_COUNT then
	for ll_Cycle = 1 To ll_Count
		ll_Start = (ll_Cycle - 1) * READ_ONE_COUNT + 1
		SELECTBLOB SubString(image_data,:ll_Start,:READ_ONE_COUNT)
		      INTO :lblb_Buffer
		      FROM net_dev_action_images
		     WHERE rec_id = :al_rec_id AND prac_id = :al_prac_id AND app_id = :al_app_id ;
		
		FileWrite(ll_FileNo,lblb_Buffer)
	next
else
	SELECTBLOB image_data
	      INTO :lblb_Buffer
	      FROM net_dev_action_images
 		  WHERE rec_id = :al_rec_id AND prac_id = :al_prac_id AND app_id = :al_app_id ;
	
	for ll_Cycle = 1 To ll_Count
		FileWrite(ll_FileNo,BlobMid(lblb_Buffer,(ll_Cycle - 1) * READ_ONE_COUNT + 1,READ_ONE_COUNT))
	next
end if

FileClose(ll_FileNo)

SetPointer (Arrow!)

Return 1

end function

public function integer of_report_selected_ver9 (string as_report);//Start Code Change ----11.10.2008 #V85 maha - created to supercede of_report selected for easier reading
Integer li_retval
Long ll_prac_ids[1]
DataWindowChild dwchild
boolean lb_ret
string ls_report
//messagebox("",as_report)
if as_report = "NONE" then
	if tab_1.tabpage_report.rb_ai.checked then
		ls_report = "Status"
	elseif tab_1.tabpage_report.rb_ai_wn.checked then
		ls_report = "StatusWithNotes"
	elseif tab_1.tabpage_report.rb_par.checked then
		ls_report = "ParNums"		
	elseif tab_1.tabpage_report.rb_par_sum.checked then
		ls_report = "ParNumsSum"
	end if
else
	ls_report = as_report
end if
		

Choose case ls_report
	case "Status"  //button 1
		lb_ret = true
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
	case "StatusWithNotes" //button 2
		lb_ret = true
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
	case "ParNums" //button 3
		lb_ret = false
		tab_1.tabpage_report.dw_report_data.DataObject = "d_rpt_par_numbers_detailed"
		tab_1.tabpage_report.dw_report_data.of_SetTransObject( SQLCA )
		ll_prac_ids[1] = il_prac_id
		tab_1.tabpage_report.dw_report_data.Retrieve( ll_prac_ids[] )
		of_par_report_filter( )
	case "ParNumsSum" //button 4
		lb_ret = false
		tab_1.tabpage_report.dw_report_data.DataObject = "d_rpt_par_numbers_summary"
		tab_1.tabpage_report.dw_report_data.of_SetTransObject( SQLCA )
		ll_prac_ids[1] = il_prac_id
		tab_1.tabpage_report.dw_report_data.Retrieve( ll_prac_ids[] )
		of_par_report_filter( )

end choose

if lb_ret = true then	//action items reports
	li_retval = tab_1.tabpage_ai.dw_net_dev.ShareData( tab_1.tabpage_report.dw_report_data )

	tab_1.tabpage_report.dw_report_data.SetSort(tab_1.tabpage_report.dw_report_data.Describe("DataWindow.Table.Sort") )
	tab_1.tabpage_report.dw_report_data.Sort()
	tab_1.tabpage_report.dw_report_data.groupcalc()

	gnv_appeondb.of_startqueue()

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

	gnv_appeondb.of_commitqueue()
end if


tab_1.tabpage_report.dw_report_data.GroupCalc( )
tab_1.tabpage_ai.dw_net_dev.ShareData( tab_1.tabpage_report.dw_report_data )


tab_1.tabpage_report.dw_report_data.Modify( "datawindow.print.preview=Yes" )

Return 0
end function

public function integer of_par_report_filter ();//Start Code Change ----11.10.2008 #V85 maha - function added for filtering of participation reports

string ls_filter
integer res

IF il_app_id < 1 and  ii_facility_id < 1 THEN return 1

IF il_app_id > 0 THEN
	ls_filter = "net_dev_ids_app_id = " + String( il_app_id ) +  " and"
END IF
	
IF ii_facility_id > 0 THEN
	ls_filter += " facility_facility_id = " + String( ii_facility_id ) + " and"
END IF

ls_filter = mid(ls_filter,1, len(ls_filter) - 4 )
//messagebox("Set filter" ,ls_filter)
res = tab_1.tabpage_report.dw_report_data.setfilter(ls_filter)
if res < 1 then messagebox("of_part_report_filter","Set filter failed. Please contact ContractLogix Support~n~n" + ls_filter)
tab_1.tabpage_report.dw_report_data.filter()
	
return 1
end function

on pfc_ia_cst_nv_net_dev_new.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.p_1=create p_1
this.dw_payors=create dw_payors
this.st_filter=create st_filter
this.dw_qf=create dw_qf
this.st_group_by=create st_group_by
this.ddlb_group_by=create ddlb_group_by
this.st_zoom=create st_zoom
this.ddlb_zoom=create ddlb_zoom
this.st_as_msg=create st_as_msg
this.dw_facility_add=create dw_facility_add
this.cb_batch=create cb_batch
this.p_2=create p_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.p_1
this.Control[iCurrent+3]=this.dw_payors
this.Control[iCurrent+4]=this.st_filter
this.Control[iCurrent+5]=this.dw_qf
this.Control[iCurrent+6]=this.st_group_by
this.Control[iCurrent+7]=this.ddlb_group_by
this.Control[iCurrent+8]=this.st_zoom
this.Control[iCurrent+9]=this.ddlb_zoom
this.Control[iCurrent+10]=this.st_as_msg
this.Control[iCurrent+11]=this.dw_facility_add
this.Control[iCurrent+12]=this.cb_batch
this.Control[iCurrent+13]=this.p_2
end on

on pfc_ia_cst_nv_net_dev_new.destroy
call super::destroy
destroy(this.cb_1)
destroy(this.p_1)
destroy(this.dw_payors)
destroy(this.st_filter)
destroy(this.dw_qf)
destroy(this.st_group_by)
destroy(this.ddlb_group_by)
destroy(this.st_zoom)
destroy(this.ddlb_zoom)
destroy(this.st_as_msg)
destroy(this.dw_facility_add)
destroy(this.cb_batch)
destroy(this.p_2)
end on

event constructor;call super::constructor;inv_data_entry = CREATE pfc_cst_nv_data_entry_functions //maha 011306

lb_from_prac_folder = True
//Start Code Change ----03.25.2008 #V8 maha - removed code for cb_1
CHOOSE CASE gi_intelliapp_type
		//SINGLE GROUP
	CASE 0
		//dw_orgs_facilities.Title = "Add Payor / Hospital" //Delete by Evan 09/19/2008
		//cb_1.Text = "Add Payor / Hospital"
		dw_orgs_facilities.Height = 1470 //1560 //Start Code Change ----04.16.2008 #V8 maha
		dw_payors.Visible = False
		//MULTI SITE GROUP
	CASE 1
		//dw_orgs_facilities.Title = "Group" //Delete by Evan 09/19/2008
		//cb_1.Text = "Add Payor / Hospital"	
		dw_orgs_facilities.Height = 696	
		//BILLING COMPANY
	CASE 2
		//dw_orgs_facilities.Title = "Client" //Delete by Evan 09/19/2008
		//cb_1.Text = "Add Payor / Hospital"			
		dw_orgs_facilities.Height = 696	
END CHOOSE
//End Code Change---03.25.2008

end event

event destructor;call super::destructor;destroy inv_data_entry //maha 011306

if IsValid(ids_spec_link) then
	Destroy ids_spec_link
end if

if IsValid(ids_all_spec) then
	Destroy ids_all_spec
end if

if IsValid(ids_address_link) then
	Destroy ids_address_link
end if

if IsValid(ids_all_addresses) then
	Destroy ids_all_addresses
end if

if IsValid(ids_hosp_link) then
	Destroy ids_hosp_link
end if

if IsValid(ids_all_hosp) then
	Destroy ids_all_hosp
end if

if IsValid(ids_cred_comms) then
	Destroy ids_cred_comms
end if

if IsValid(ids_cred_committees) then
	Destroy ids_cred_committees
end if

if IsValid(ids_address_linked) then
	Destroy ids_address_linked
end if

end event

type tab_1 from pfc_cst_nv_net_dev_prac_folder`tab_1 within pfc_ia_cst_nv_net_dev_new
integer x = 759
integer y = 4
integer width = 2729
integer height = 1676
integer taborder = 40
end type

event tab_1::selectionchanged;call super::selectionchanged;dw_qf.Enabled = True
ddlb_group_by.Enabled = True
dw_payors.Enabled = True
dw_orgs_facilities.Enabled = True
tab_1.tabpage_report.gb_filter_2.Text = "Filter"


//changed to ACTION
tab_1.tabpage_ai.gb_filter_1.Visible = False
tab_1.tabpage_report.gb_filter_2.Visible = False
IF newindex = 1 THEN
	tab_1.tabpage_ai.gb_filter_1.Visible = True
	//gb_filter.Visible = True
	st_filter.Visible = True
	dw_qf.Visible = True
	st_group_by.Visible = False
	ddlb_group_by.Visible = False
	st_zoom.Visible = False
	ddlb_zoom.Visible = False
//changed to REPORTS
ELSEIF newindex = 4 THEN
	tab_1.tabpage_report.gb_filter_2.Visible = True	
	st_filter.Visible = True
	st_group_by.Visible = True
	dw_qf.Visible = True
	ddlb_group_by.Visible = True	
	st_zoom.Visible = True
	ddlb_zoom.Visible = True	
	IF tab_1.tabpage_report.rb_par.Checked OR tab_1.tabpage_report.rb_par_sum.Checked THEN
		dw_qf.Enabled = False
		ddlb_group_by.Enabled = False
		//dw_payors.Enabled = False //Start Code Change ----11.10.2008 #V85 maha - removed to allow changing from reports
		//dw_orgs_facilities.Enabled = False
		tab_1.tabpage_report.gb_filter_2.Text = "Filters do not work for selected report"
	END IF
ELSE
	st_filter.Visible = False
	st_group_by.Visible = False
	dw_qf.Visible = False
	ddlb_group_by.Visible = False	
	st_zoom.Visible = False
	ddlb_zoom.Visible = False		
END IF



end event

type tabpage_ai from pfc_cst_nv_net_dev_prac_folder`tabpage_ai within tab_1
integer width = 2693
integer height = 1548
long picturemaskcolor = 12632256
dw_appoint_stat dw_appoint_stat
gb_filter_1 gb_filter_1
end type

on tabpage_ai.create
this.dw_appoint_stat=create dw_appoint_stat
this.gb_filter_1=create gb_filter_1
int iCurrent
call super::create
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_appoint_stat
this.Control[iCurrent+2]=this.gb_filter_1
end on

on tabpage_ai.destroy
call super::destroy
destroy(this.dw_appoint_stat)
destroy(this.gb_filter_1)
end on

type dw_net_dev from pfc_cst_nv_net_dev_prac_folder`dw_net_dev within tabpage_ai
integer y = 312
integer width = 2661
integer height = 956
end type

event dw_net_dev::clicked;call super::clicked;IF dwo.Name = "facility_name" THEN
	This.SetSort( "facility_name" )
	This.Sort( )
	Return 
END IF

end event

event dw_net_dev::editchanged;call super::editchanged;ib_save = True
end event

event dw_net_dev::pfc_deleterow;call super::pfc_deleterow;ib_save = True

Return Success
end event

event dw_net_dev::itemchanged;call super::itemchanged;ib_save = True
end event

event dw_net_dev::pfc_ddcalendar;call super::pfc_ddcalendar;ib_save = True

Return Success
end event

event dw_net_dev::buttonclicked;call super::buttonclicked;
IF dwo.name = 'b_notes' THEN
	OpenWithParm( w_ai_notes, This.GetItemString( row, "notes" ))

	IF Message.StringParm = "Cancel" THEN
		Return -1
	ELSE
		This.SetItem( row, "notes", Message.StringParm )
	END IF
ELSEIF dwo.name = "bcontact" then
	gs_pass_ids lstr_ids
	
	lstr_ids.facility_id = This.GetItemNumber( row, "facility_id")
	lstr_ids.l_app_id = This.GetItemNumber( row, "app_id")
	lstr_ids.prac_id = il_prac_id
	
	IF dw_payors.Visible THEN
		lstr_ids.sl_label1 = dw_orgs_facilities.Title
	ELSE
		lstr_ids.sl_label1 = "Facility"
	END IF
	lstr_ids.sl_label2 = dw_payors.Title + " / App "
	
	OpenWithParm( w_contact_information, lstr_ids )
//--------------------------- APPEON BEGIN ---------------------------
//$< Add  > 2008-07-09 By: Scofield
//$<Reason> Add image preview process.

ELSEIF dwo.name = "b_enpreview" then
	String	ls_PicName,ls_PicDir
	long		ll_rec_id,ll_prac_id,ll_app_id
	
	ll_rec_id = This.GetItemNumber(row,"rec_id")
	ll_prac_id = This.GetItemNumber(row,"prac_id")
	ll_app_id = This.GetItemNumber(row,"app_id")
	
	ls_PicDir = gs_dir_path + gs_DefDirName + "\Images\"
	if Not DirectoryExists(ls_PicDir) then CreateDirectory (ls_PicDir)
	
	ls_PicName = ls_PicDir + String(ll_rec_id) + "_" + String(ll_prac_id) + "_"  + String(ll_app_id) + ".tif"
	of_Down_Image(ll_rec_id,ll_prac_id,ll_app_id,ls_PicName)
		
	if FileExists(ls_PicName) then
		OpenWithParm(w_image_display,ls_PicName)
	else
		MessageBox(gnv_app.iapp_object.DisplayName,ls_PicName + " is not exist!")
	end if
END IF
//---------------------------- APPEON END ----------------------------

end event

event dw_net_dev::retrieveend;call super::retrieveend;of_set_quick_filter( dw_qf.GetItemString( 1, "quick_filter" ) )
end event

event dw_net_dev::pfc_postupdate;call super::pfc_postupdate;//--------------------------- APPEON BEGIN ---------------------------
//$<add> 11.08.2006 By: Jervis
//$<reason> modify workflow,refresh data when active status changed
of_refresh_data()
return 1
//---------------------------- APPEON END ----------------------------

end event

event dw_net_dev::constructor;call super::constructor;//--------------------------- APPEON BEGIN ---------------------------
//$< Add  > 2008-07-09 By: Scofield
//$<Reason> Init b_EnPreview and b_DisPreview's Enabled property.

long ll_StAppImgInDB

SELECT TOP 1 set_StAppImgInDB INTO :ll_StAppImgInDB FROM icred_settings ;
if ll_StAppImgInDB <> 1 then
	This.Modify("b_DisPreview.Visible = yes")
	This.Modify("b_EnPreview.Visible = no")
end if
//---------------------------- APPEON END ----------------------------

end event

event dw_net_dev::pfc_preupdate;//--------------------------- APPEON BEGIN ---------------------------
//$< Add  > 2008-07-09 By: Scofield
//$<Reason> Delete Image before delete record.

long	ll_Cycle,ll_Cnts,ll_rec_id,ll_prac_id,ll_app_id

ll_Cnts = This.DeletedCount()
for ll_Cycle = 1 to ll_Cnts
	ll_rec_id = This.GetItemNumber(ll_Cycle,'rec_id',Delete!,false)
	ll_prac_id = This.GetItemNumber(ll_Cycle,'prac_id',Delete!,false)
	ll_app_id = This.GetItemNumber(ll_Cycle,'app_id',Delete!,false)
	
	DELETE FROM net_dev_action_images WHERE rec_id = :ll_rec_id AND prac_id = :ll_prac_id AND app_id = :ll_app_id ;
next

COMMIT USING SQLCA;

Return Super::Event pfc_preupdate()
//---------------------------- APPEON END ----------------------------

end event

event dw_net_dev::pfc_addrow;call super::pfc_addrow;//Start Code Change ----09.09.2008 #V85 maha
long ll_app

IF dw_payors.Visible THEN
	ll_app = dw_payors.getitemnumber(dw_payors.getrow(),"app_id" )
	if ll_app > 0 then
		this.setitem(this.getrow(),"app_id", ll_app)
	end if
end if

return 1
//End Code Change---09.09.2008
end event

type tabpage_ids from pfc_cst_nv_net_dev_prac_folder`tabpage_ids within tab_1
integer width = 2693
integer height = 1548
long picturemaskcolor = 12632256
end type

type dw_ids from pfc_cst_nv_net_dev_prac_folder`dw_ids within tabpage_ids
integer width = 2656
end type

event dw_ids::editchanged;call super::editchanged;ib_save = True
end event

event dw_ids::pfc_deleterow;call super::pfc_deleterow;ib_save = True

Return Success
end event

event dw_ids::itemchanged;call super::itemchanged;ib_save = True
end event

event dw_ids::pfc_preupdate;call super::pfc_preupdate;Integer li_rc
Integer i


li_rc = tab_1.tabpage_ids.dw_ids.RowCount()
//messagebox("", "fdfa")
FOR i = 1 TO li_rc
	IF Len( tab_1.tabpage_ids.dw_ids.GetItemString( i, "plan_assigned_id" ) ) = 0 OR IsNull(tab_1.tabpage_ids.dw_ids.GetItemString( i, "plan_assigned_id" ) )THEN
		MessageBox("Required Data", "You must enter in a Plan ID.  Please Correct." )
		tab_1.tabpage_ids.dw_ids.SetRow( i )
		tab_1.tabpage_ids.dw_ids.ScrollToRow( i )
		tab_1.tabpage_ids.dw_ids.SetColumn( "plan_assigned_id" )
		tab_1.tabpage_ids.dw_ids.SetFocus( )
		tab_1.SelectTab( 2 )
		Return -1
	END IF
	IF IsNull( tab_1.tabpage_ids.dw_ids.GetItemNumber( i, "plan_type" ) ) THEN
		MessageBox("Required Data", "You must enter in a Plan Type.  Please Correct." )
		tab_1.tabpage_ids.dw_ids.SetRow( i )
		tab_1.tabpage_ids.dw_ids.ScrollToRow( i )
		tab_1.tabpage_ids.dw_ids.SetColumn( "plan_type" )
		tab_1.tabpage_ids.dw_ids.SetFocus( )
		tab_1.SelectTab( 2 )		
		Return -1
	END IF	
END FOR

	
li_rc = This.RowCount()

//Start Code Change ---- 10.05.2007 #V7 maha
// correct a bug for a specific setting
IF gi_intelliapp_type > 0 THEN
	//--------------------------- APPEON BEGIN ---------------------------
	//$<add> 04.05.2006 By: Liang QingShi
	//$<reason> Fix a defect
	il_app_id = dw_payors.getitemnumber(dw_payors.getrow(),'app_id')
	//---------------------------- APPEON END ----------------------------
	
	FOR i = 1 TO li_rc
		IF This.GetItemStatus( i, 0, Primary! ) = NewModified! THEN
			This.SetItem( i, "app_id", il_app_id )
		END IF
	END FOR
End if
//End Code Change---10.05.2007


Return 1
end event

type tabpage_notes from pfc_cst_nv_net_dev_prac_folder`tabpage_notes within tab_1
integer width = 2693
integer height = 1548
long picturemaskcolor = 12632256
end type

type dw_notes from pfc_cst_nv_net_dev_prac_folder`dw_notes within tabpage_notes
integer y = 4
integer width = 2674
end type

type tabpage_report from pfc_cst_nv_net_dev_prac_folder`tabpage_report within tab_1
integer width = 2693
integer height = 1548
long picturemaskcolor = 12632256
cb_2 cb_2
gb_filter_2 gb_filter_2
end type

on tabpage_report.create
this.cb_2=create cb_2
this.gb_filter_2=create gb_filter_2
int iCurrent
call super::create
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_2
this.Control[iCurrent+2]=this.gb_filter_2
end on

on tabpage_report.destroy
call super::destroy
destroy(this.cb_2)
destroy(this.gb_filter_2)
end on

type cb_export from pfc_cst_nv_net_dev_prac_folder`cb_export within tabpage_report
end type

type rb_par_sum from pfc_cst_nv_net_dev_prac_folder`rb_par_sum within tabpage_report
end type

event rb_par_sum::clicked;call super::clicked;of_report_selected_ver9( "ParNumsSum" )
dw_qf.Enabled = False
ddlb_group_by.Enabled = False
//dw_payors.Enabled = False //Start Code Change ----11.10.2008 #V85 maha - removed
//dw_orgs_facilities.Enabled = False

gb_filter_2.Text = "Filters do not work for selected report."

end event

type rb_ai_wn from pfc_cst_nv_net_dev_prac_folder`rb_ai_wn within tabpage_report
end type

event rb_ai_wn::clicked;call super::clicked;of_report_selected_ver9( "StatusWithNotes" )
dw_qf.Enabled = True
ddlb_group_by.Enabled = True
dw_payors.Enabled = True
dw_orgs_facilities.Enabled = True

gb_filter_2.Text = "Filter"
end event

type rb_par from pfc_cst_nv_net_dev_prac_folder`rb_par within tabpage_report
end type

event rb_par::clicked;call super::clicked;of_report_selected_ver9( "ParNums" )
dw_qf.Enabled = False
ddlb_group_by.Enabled = False
//dw_payors.Enabled = False   //Start Code Change ----11.10.2008 #V85 maha - removed
//dw_orgs_facilities.Enabled = False

gb_filter_2.Text = "Filters do not work for selected report."
end event

type rb_ai from pfc_cst_nv_net_dev_prac_folder`rb_ai within tabpage_report
end type

event rb_ai::clicked;call super::clicked;of_report_selected_ver9( "Status" )
dw_qf.Enabled = True
ddlb_group_by.Enabled = True
dw_payors.Enabled = True
dw_orgs_facilities.Enabled = True

gb_filter_2.Text = "Filter"
end event

type dw_report_data from pfc_cst_nv_net_dev_prac_folder`dw_report_data within tabpage_report
integer width = 2665
integer height = 1180
end type

event dw_report_data::constructor;call super::constructor;This.of_SetUpdateAble( False )
end event

type dw_orgs_facilities from pfc_cst_nv_net_dev_prac_folder`dw_orgs_facilities within pfc_ia_cst_nv_net_dev_new
event u_after_retrieve ( )
integer height = 696
string title = ""
string dataobject = "d_pd_affil_status_orgs_ia"
end type

event dw_orgs_facilities::u_after_retrieve;This.InsertRow( 1 )
This.SetItem( 1, "parent_facility", "All " )
This.SetItem( 1, "parent_facility_id", 0 )	



This.SelectRow( 0, False )	
This.SelectRow( 2, True )
This.ScrollToRow( 2 )
This.SetRow( 2 )






end event

event dw_orgs_facilities::rowfocuschanged;//messagebox("facility", "rowfocus" )
//IF gi_intelliapp_type > 0 THEN
//	tab_1.tabpage_ai.dw_net_dev.SetRedraw( False )
//END IF
//this is an OVERRIDE event

tab_1.tabpage_ai.dw_net_dev.SetRedraw ( false )
IF This.RowCount() > 0  THEN
	IF This.GetItemNumber( 1, "parent_facility_id" ) <> 0 THEN //maha 092204 moved inside rowcount trap
		Return 
	else
		ii_facility_id = This.GetItemNumber( currentrow, "parent_facility_id") //maha 112304 moved in front of the of_retrieve_detail
		of_retrieve_detail( ii_facility_id )
		//of_report_selected_ver9( "NONE") //Start Code Change ----11.10.2008 #V85 maha
		ib_report_filter = true
		tab_1.tabpage_ai.dw_net_dev.SetRedraw ( true )
	END IF
END IF
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-14
//$<add> 02.16.2006 By: Cao YongWang
//$<reason> Performance tuning.
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.
gnv_appeondb.of_startqueue()
//---------------------------- APPEON END ----------------------------

tab_1.tabpage_ai.dw_appoint_stat.Retrieve( il_prac_id, ii_facility_id )

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-15
//$<add> 02.16.2006 By: Cao YongWang
//$<reason> Performance tuning.
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.
IF gi_intelliapp_type > 0 THEN
	il_app_id = 0
	IF ii_facility_id = 0 THEN
		dw_payors.DataObject = "d_net_dev_payors_hospitals_all"
		dw_payors.SetTRansObject( SQLCA )
		dw_payors.Retrieve( il_prac_id )
	ELSE	
		//messagebox("", "1")
		dw_payors.DataObject = "d_net_dev_payors_hospitals"
		dw_payors.SetTRansObject( SQLCA )	
		dw_payors.Retrieve( il_prac_id, ii_facility_id )
		//messagebox("", "2")		
	END IF
END IF
gnv_appeondb.of_commitqueue()
//---------------------------- APPEON END ----------------------------

IF gi_intelliapp_type > 0 THEN
	il_app_id = 0
	IF ii_facility_id = 0 THEN
		//--------------------------- APPEON BEGIN ---------------------------
		//$<ID> PT-16
		//$<comment> 02.16.2006 By: Cao YongWang
		//$<reason>
		//$<modification> Move the following script to PT-15 and integrate them with other
		//$<modification> SQL statements to reduce client-server interactions.
		/*
		dw_payors.DataObject = "d_net_dev_payors_hospitals_all"
		dw_payors.SetTRansObject( SQLCA )
		dw_payors.Retrieve( il_prac_id )
		*/
		//---------------------------- APPEON END ----------------------------
	ELSE	
		//messagebox("", "1")
		//--------------------------- APPEON BEGIN ---------------------------
		//$<ID> PT-17
		//$<comment> 02.16.2006 By: Cao YongWang
		//$<reason>
		//$<modification> Move the following script to PT-15 and integrate them with other
		//$<modification> SQL statements to reduce client-server interactions.
		/*
		dw_payors.DataObject = "d_net_dev_payors_hospitals"
		dw_payors.SetTRansObject( SQLCA )	
		dw_payors.Retrieve( il_prac_id, ii_facility_id )
		*/
		//---------------------------- APPEON END ----------------------------
		dw_payors.SetRow( 2 )
		dw_payors.ScrollToRow( 2 )
		//messagebox("", "2")		
	END IF
END IF

IF NOT ib_filter_set THEN
	tab_1.tabpage_ai.dw_net_dev.SetFilter( "active_status = 1" )
	tab_1.tabpage_ai.dw_net_dev.Filter( )
END IF

tab_1.tabpage_ai.dw_net_dev.SetRedraw ( true )
//st_as_msg.visible = false //maha 062905
end event

event dw_orgs_facilities::retrieveend;//Modified by Nova.zhang on 2008-10-29
//PostEvent( "u_after_retrieve" )

triggerEvent( "u_after_retrieve" )

//$<del> 07.09.2008 by Andy
/*
CHOOSE CASE gi_intelliapp_type
		//SINGLE GROUP
	CASE 0
		dw_orgs_facilities.Title = "Payor / Hospital"
		//MULTI SITE GROUP
	CASE 1
		dw_orgs_facilities.Title = "Group"
		//BILLING COMPANY
	CASE 2
		dw_orgs_facilities.Title = "Client"
END CHOOSE
*/
//end del 07.09.2008



end event

event dw_orgs_facilities::rowfocuschanging;call super::rowfocuschanging;//Integer li_retval
//
//li_retval = of_save()
////messagebox("top", li_retval )
//IF li_retval < 0 THEN
//	Return 1
//END IF
//
end event

event dw_orgs_facilities::retrievestart;call super::retrievestart;ib_done_retrieving_orgs = False
end event

event dw_orgs_facilities::clicked;Integer li_retval
//debugbreak()

li_retval = of_save()

IF li_retval < 0 THEN
	Return 1
END IF

Integer li_row

li_row = This.GetClickedRow( )

IF li_row = 0 THEN
	tab_1.tabpage_ai.dw_net_dev.SetFocus( )
	Return -1
END IF

This.SelectRow( 0, False )
This.SelectRow( li_row, True )
This.ScrollToRow( li_row )
This.SetRow( li_row )
end event

type dw_appoint_stat from u_dw within tabpage_ai
integer x = 9
integer y = 8
integer width = 2683
integer height = 252
integer taborder = 11
boolean bringtotop = true
string dataobject = "d_pd_affil_status_ia"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
borderstyle borderstyle = stylebox!
end type

event constructor;call super::constructor;This.SetTransObject( SQLCA )

dw_appoint_stat.of_SetDropDownCalendar( TRUE )
//dw_appoint_stat.iuo_calendar.of_Register(dw_appoint_stat.iuo_calendar.DDLB)

end event

event itemchanged;call super::itemchanged;IF This.GetColumnName() = "active_status" AND (data = '3' OR data = '2') THEN
	Integer li_facility_id		
	Integer li_ans
	Integer li_rc
	Integer i
	String ls_msg_hdr
		
	IF data = '3' THEN
		ls_msg_hdr = "Inactive"
	ELSE
		ls_msg_hdr = "Purge"
	END IF

	IF ls_msg_hdr = "Inactive" THEN
			li_ans = MessageBox( ls_msg_hdr,  "This will cause all action items under this Payor/Hospital to become InActive also.~n You will not be able to make them active again.~n~n        Continue?", Exclamation!, YesNo!, 2 )
		
			IF li_ans = 1 THEN
				if li_ans = MessageBox( ls_msg_hdr,  "Are you Sure?", Question!, YesNo!, 2 ) then
					li_rc = tab_1.tabpage_ai.dw_net_dev.RowCount()
					FOR i = 1 TO li_rc
						If tab_1.tabpage_ai.dw_net_dev.GetItemStatus(i,0,Primary!) = New! Then Continue //Added By Ken.Guo 06.25.2008
						tab_1.tabpage_ai.dw_net_dev.SetItem( i, "active_status", 3 )
					END FOR
					//--------------------------- APPEON BEGIN ---------------------------
					//$<ID> PT-18
					//$<add> 03.29.2006 By: Cao YongWang
					//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.
					gnv_appeondb.of_startqueue()
					//---------------------------- APPEON END ----------------------------
					//tab_1.tabpage_ai.dw_net_dev.Update( )  //Commented By Ken.Guo 06.25.2008
					tab_1.tabpage_ai.dw_net_dev.Trigger Event Pfc_Update(True,True)  //Added By Ken.Guo 06.25.2008
					This.Update( )
					//--------------------------- APPEON BEGIN ---------------------------
					//$<ID> PT-19
					//$<add> 03.29.2006 By: Cao YongWang
					//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.
					 
					gnv_appeondb.of_commitqueue()
					//---------------------------- APPEON END ----------------------------
				else
					return 2 //alfee 12.11.2008						
				end if				
			ELSE
				return 2 //alfee 12.11.2008					
			END IF
			
	ElSEIF ls_msg_hdr = 'Purge' THEN  //modified maha 082604 to function more like the Appt Stat Purge
			li_ans = MessageBox( ls_msg_hdr,  "This will cause ALL data under this Payor/Hospital to be DELETED.     Continue?", Exclamation!, YesNo!, 2 )
			IF li_ans = 1 THEN
				if li_ans = MessageBox( ls_msg_hdr,  "Are you Sure?", Question!, YesNo!, 2 ) then
					li_rc = tab_1.tabpage_ai.dw_net_dev.RowCount()
					FOR i = 1 TO li_rc
						tab_1.tabpage_ai.dw_net_dev.DeleteRow( 0 )
					END FOR
					//--------------------------- APPEON BEGIN ---------------------------
					//$<ID> PT-20
					//$<add> 03.29.2006 By: Cao YongWang
					//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.
					gnv_appeondb.of_startqueue()
					//---------------------------- APPEON END ----------------------------
					tab_1.tabpage_ai.dw_net_dev.Update( )
					This.Update( )
					
					li_facility_id = This.GetItemNumber( row, "parent_facility_id" )
					
					DELETE 
					FROM net_dev_ids
					WHERE facility_id = :li_facility_id AND
							prac_id = : il_prac_id;
					IF SQLCA.SQLCODE = -1 THEN
						MessageBox("SQL Error 1", SQLCA.SQLERRTEXT )
						Return -1
					END IF
					//--------------------------- APPEON BEGIN ---------------------------
					//$<ID> PT-21
					//$<add> 03.29.2006 By: Cao YongWang
					//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.
					gnv_appeondb.of_commitqueue()
					//---------------------------- APPEON END ----------------------------					

					//---------Begin Added by Alfee on 12.11.2008-------------------------
					//<$Reason>Moved up the code
					gnv_appeondb.of_startqueue()
					dw_appoint_stat.Update( )		
					of_reset( )
					of_retrieve_facilities( )
					gnv_appeondb.of_commitqueue()
					//---------End Added --------------------------------------------------
	
					//DELETE 
					//FROM pd_address_link
					//WHERE facility_id = :li_facility_id AND
					//		prac_id = : il_prac_id;
					//IF SQLCA.SQLCODE = -1 THEN
					//	MessageBox("SQL Error 2", SQLCA.SQLERRTEXT )
					//	Return -1
					//END IF
					//					
					//DELETE 
					//FROM pd_affil_dept
					//WHERE facility_id = :li_facility_id AND
					//		prac_id = : il_prac_id;
					//IF SQLCA.SQLCODE = -1 THEN
					//	MessageBox("SQL Error 4", SQLCA.SQLERRTEXT )
					//	Return -1
					//END IF
					//
					//DELETE 
					//FROM pd_affil_staff_cat
					//WHERE facility_id = :li_facility_id AND
					//		prac_id = : il_prac_id;
					//IF SQLCA.SQLCODE = -1 THEN
					//	MessageBox("SQL Error 5", SQLCA.SQLERRTEXT )
					//	Return -1
					//END IF
					//
					//DELETE 
					//FROM pd_affil_staff_leave
					//WHERE facility_id = :li_facility_id AND
					//		prac_id = : il_prac_id;
					//IF SQLCA.SQLCODE = -1 THEN
					//	MessageBox("SQL Error 6", SQLCA.SQLERRTEXT )
					//	Return -1
					//END IF
					//
					//DELETE 
					//FROM pd_app_audit
					//WHERE facility_id = :li_facility_id AND
					//		prac_id = : il_prac_id;
					//IF SQLCA.SQLCODE = -1 THEN
					//	MessageBox("SQL Error 7", SQLCA.SQLERRTEXT )
					//	Return -1
					//END IF
					//
					//DELETE 
					//FROM pd_hosp_facility_link
					//WHERE facility_id = :li_facility_id AND
					//		prac_id = : il_prac_id;
					//IF SQLCA.SQLCODE = -1 THEN
					//	MessageBox("SQL Error 8", SQLCA.SQLERRTEXT )
					//	Return -1
					//END IF
					//
					//DELETE 
					//FROM pd_spec_facility_link
					//WHERE facility_id = :li_facility_id AND
					//		prac_id = : il_prac_id;
					//IF SQLCA.SQLCODE = -1 THEN
					//	MessageBox("SQL Error 9", SQLCA.SQLERRTEXT )
					//	Return -1
					//END IF
				else
					return 2 //alfee 12.11.2008					
				end if
				MessageBox("Purge", "To completely remove practitioner from the system go to the System->Delete Practitioner menu option." )
			ELSE
				return 2 //alfee 12.11.2008				
			END IF

			//--------Begin Commented by Alfee on 12.11.2008 -------------------------
			//<$Reason> Should be moved to the above
			/*  
			//dw_appoint_stat.DeleteRow( 0 )
			//--------------------------- APPEON BEGIN ---------------------------
			//$<ID> PT-22
			//$<add> 03.29.2006 By: Cao YongWang
			//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.
			gnv_appeondb.of_startqueue()
			//---------------------------- APPEON END ----------------------------
			dw_appoint_stat.Update( )
			
			of_reset( )
			of_retrieve_facilities( )
			//--------------------------- APPEON BEGIN ---------------------------
			//$<ID> PT-23
			//$<add> 03.29.2006 By: Cao YongWang
			//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.> 
			gnv_appeondb.of_commitqueue()
			//---------------------------- APPEON END ----------------------------
			*/  
			//--------End Commented ---------------------------------------------------
		END IF
END IF
end event

event rbuttondown;call super::rbuttondown;integer col
integer ret
datetime dtn
string colname
STRING DT

setnull(dtn)

col = this.getclickedcolumn()
colname = this.getcolumnname() 

if this.Describe( colname + ".ColType") = "datetime" THEN
	//messagebox("dt","dt")
	ret = messagebox("Set Null?","Would you like to set this Date to null?",question!,yesno!,2 )
	if ret = 1 then
		this.setitem(row,col,dtn)
	end if
END IF
end event

event pfc_deleterow;Integer li_ans
Integer li_rc
Integer i

IF dw_orgs_facilities.RowCount() <= 1 THEN
	MessageBox("Delete", "You need to have at least one Group record." )
	Return 0
END IF

if ii_facility_id = 1 then
	MessageBox("Delete", "You cannot delete this Group from the practitioner." )
	return 0
end if

li_ans = MessageBox( "Delete","Are you sure you want to delete this Group/Client, and all connected data including Action Items and Plan IDs?", Question!, YesNo!, 2 )

IF li_ans = 1 THEN
	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> PT-24
	//$<add> 03.29.2006 By: Cao YongWang
	//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.
	gnv_appeondb.of_startqueue()
	//---------------------------- APPEON END ----------------------------
	delete from pd_affil_dept
	where facility_id = :ii_facility_id and prac_id = :il_prac_id;

	delete from pd_comm_review
	where facility_id = :ii_facility_id and prac_id = :il_prac_id;
	
   delete from pd_affil_staff_cat
	where facility_id = :ii_facility_id and prac_id = :il_prac_id;
	
	delete from pd_affil_staff_leave
	where facility_id = :ii_facility_id and prac_id = :il_prac_id;
	
	delete from pd_address_link
	where facility_id = :ii_facility_id and prac_id = :il_prac_id;
	
	delete from pd_questions
	where facility_id = :ii_facility_id and prac_id = :il_prac_id;
	
	delete from pd_group_providers
	where facility_id = :ii_facility_id and prac_id = :il_prac_id;
	
	delete from pd_hosp_facility_link 
	where facility_id = :ii_facility_id and prac_id = :il_prac_id;
	
	delete from pd_spec_facility_link 
	where facility_id = :ii_facility_id and prac_id = :il_prac_id;
	
	delete from net_dev_action_items
	where facility_id = :ii_facility_id and prac_id = :il_prac_id;
	
	delete from net_dev_ids
	where facility_id = :ii_facility_id and prac_id = :il_prac_id;
	Commit Using SQLCA;
	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> PT-25
	//$<add> 03.29.2006 By: Cao YongWang
	//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.	gnv_appeondb.of_commitqueue()
	//---------------------------- APPEON END ----------------------------
	
	//Start Code Change ---- 01.17.2006 #198 maha
	inv_data_entry.of_field_audit( This ) //maha 011706
	//End Code Change---01.17.2006 

	This.DeleteRow( This.GetRow() )
	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> PT-26
	//$<add> 03.29.2006 By: Cao YongWang
	//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.	gnv_appeondb.of_startqueue()
	//---------------------------- APPEON END ----------------------------
	This.Update()
	
	Commit Using SQLCA;
	
	dw_orgs_facilities.Retrieve( il_prac_id,gs_user_id )
	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> PT-27
	//$<add> 03.29.2006 By: Cao YongWang
	//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.
	gnv_appeondb.of_commitqueue()
	//---------------------------- APPEON END ----------------------------
END IF

Return -1
end event

event pfc_preupdate;call super::pfc_preupdate;
//Start Code Change ---- 01.17.2006 #199 maha
inv_data_entry.of_field_audit( This ) //maha 011706
//End Code Change---01.17.2006 
return 1
end event

type gb_filter_1 from groupbox within tabpage_ai
integer x = 14
integer y = 1304
integer width = 2665
integer height = 212
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "Filter"
end type

type cb_2 from commandbutton within tabpage_report
boolean visible = false
integer x = 2235
integer y = 8
integer width = 123
integer height = 64
integer taborder = 21
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "sort"
end type

event clicked;string null_str

SetNull(null_str)

tab_1.tabpage_report.dw_report_data.SetSort(null_str)

tab_1.tabpage_report.dw_report_data.Sort( )
end event

type gb_filter_2 from groupbox within tabpage_report
integer x = 14
integer y = 1300
integer width = 2661
integer height = 212
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "Filter"
end type

type cb_1 from commandbutton within pfc_ia_cst_nv_net_dev_new
integer x = 5
integer y = 1580
integer width = 731
integer height = 96
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Multi App"
end type

event clicked;of_multi_add()
end event

type p_1 from picture within pfc_ia_cst_nv_net_dev_new
integer x = 32
integer y = 1600
integer width = 73
integer height = 64
boolean bringtotop = true
boolean originalsize = true
string picturename = "facility.bmp"
boolean focusrectangle = false
end type

event clicked;of_multi_add()
end event

type dw_payors from u_dw within pfc_ia_cst_nv_net_dev_new
event ue_after_retrieve ( )
integer x = 5
integer y = 700
integer width = 736
integer height = 764
integer taborder = 10
boolean titlebar = true
string title = "Payor / Hospital"
string dataobject = "d_net_dev_payors_hospitals"
borderstyle borderstyle = stylebox!
end type

event ue_after_retrieve;IF tab_1.tabpage_ids.dw_ids.RowCount() = 0 AND il_app_id > 0 THEN
	tab_1.tabpage_ids.dw_ids.InsertRow( 0 )
END IF
end event

event clicked;Integer li_retval

li_retval = of_save()

IF li_retval < 0 THEN
	Return 1
END IF

Integer li_row

li_row = This.GetClickedRow( )

IF li_row = 0 THEN
	tab_1.tabpage_ai.dw_net_dev.SetFocus( )
	Return -1
END IF

ib_report_filter = true ////Start Code Change ----11.10.2008 #V85 maha
This.SelectRow( 0, False )
This.SelectRow( li_row, True )
This.ScrollToRow( li_row )
This.SetRow( li_row )

end event

event constructor;call super::constructor;This.of_SetTransObject( SQLCA )
This.of_SetUpdateAble( False )

//$<add> 07.07.2008 by Andy
String ls_lable
SELECT TOP 1 app_stat_app_label INTO :ls_lable FROM icred_settings;

IF Len(Trim(ls_lable)) > 0 then
	this.Title = ls_lable
END IF
//end add 07.07.2008
end event

event retrieveend;call super::retrieveend;il_app_id = 0
IF This.RowCount() > 0 THEN
	This.InsertRow( 1 )
	This.SetItem( 1, "app_id", 0 )	
	This.SetItem( 1, "application_name", "All" )

	IF rowcount > 1 THEN
		This.SetRow( 2 )
		This.SelectRow( 0, False )
		This.SelectRow( 2, True )		
	END IF	
	
	of_filter_ids( )		
	
ELSE
	This.InsertRow( 1 )
	This.SetItem( 1, "app_id", 0 )		
	This.SetItem( 1, "application_name", "**No Payor / Hospital**" )	
	//tab_1.tabpage_ids.dw_ids.Reset( )
END IF


//messagebox("", "set to true")
//ib_done_retrieving_orgs = True


end event

event rowfocuschanged;call super::rowfocuschanged;String ls_sql
Integer li_rc

//messagebox("payor", "rowfocus" )
IF currentrow > 0 THEN

	IF This.GetItemNumber( 1, "app_id" ) <> 0 THEN
		Return
	END IF	

	This.SelectRow( 0, False )
	This.SelectRow( currentrow, True )
	
	il_app_id = This.GetItemNumber( currentrow, "app_id" )
	ls_sql = is_sql
	
	IF il_app_id > 0 THEN
		//ls_sql = ls_sql + " AND net_dev_action_items.app_id = " + String( il_app_id ) //Commented By Ken.Guo 09-24-2008
		ls_sql = ls_sql + " AND net_dev_action_items.app_id = " + String( il_app_id ) //Added By Ken.Guo 09-24-2008
	END IF
	
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
	//--------------------------- APPEON BEGIN ---------------------------
	//$<modify> 2005-11-09 By: Cao YongWang
	//$<reason> Replaced SetSqlSelect function with modify function
	//	tab_1.tabpage_ai.dw_net_dev.SetSQlSelect( ls_sql )	
	//tab_1.tabpage_ai.dw_net_dev.modify('datawindow.table.select="'+ ls_sql + '"')	//Commented By Ken.Guo 09-24-2008
	tab_1.tabpage_ai.dw_net_dev.modify("datawindow.table.select='"+ ls_sql + "'")  //Added By Ken.Guo 09-24-2008. must use single quotes.
	//---------------------------- APPEON END ----------------------------
	tab_1.tabpage_ai.dw_net_dev.SetTransObject( SQLCA )
	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> PT-28
	//$<add> 03.16.2006 By: Liang QingShi
	//$<reason> Performance tuning
	//$<modification> Add Appeon Commit label to reduce client-server interactions to improve runtime performance.

 	gnv_appeondb.of_imdcall()
	//---------------------------- APPEON END ----------------------------
	li_rc = tab_1.tabpage_ai.dw_net_dev.Retrieve( )

	IF li_rc = 0 THEN
		tab_1.tabpage_ai.dw_net_dev.InsertRow( 0 )
		tab_1.tabpage_notes.dw_notes.InsertRow( 0 )		
	END IF

	tab_1.tabpage_ai.dw_net_dev.Modify("DataWindow.Table.UpdateTable='net_dev_action_items'")	
	
	IF tab_1.SelectedTab = 1 THEN
		tab_1.tabpage_ai.dw_net_dev.SetFocus( )
	ELSEIF tab_1.SelectedTab = 2 THEN
		tab_1.tabpage_ids.dw_ids.SetFocus( )
	ELSEIF tab_1.SelectedTab = 3 THEN
		tab_1.tabpage_notes.dw_notes.SetFocus( )
	END IF
	
END IF

IF gi_intelliapp_type > 0 THEN
	tab_1.tabpage_ai.dw_net_dev.SetRedraw( True )
END IF
st_as_msg.visible = false //maha 062905

of_filter_ids( )
if ib_report_filter then
	of_report_selected_ver9( "NONE") //Start Code Change ----11.10.2008 #V85 maha
	ib_report_filter = false
end if
	
end event

event rowfocuschanging;call super::rowfocuschanging;IF currentrow > 0 THEN
	IF tab_1.tabpage_ids.dw_ids.GetItemStatus( 1, 0, Primary! ) = New! THEN
		tab_1.tabpage_ids.dw_ids.DeleteRow( 1 )
	END IF
END IF

//Integer li_retval
//
//li_retval = of_save()
////messagebox("bottom", li_retval )
//IF li_retval < 0 THEN
//	Return 1
//END IF
//
end event

type st_filter from statictext within pfc_ia_cst_nv_net_dev_new
integer x = 823
integer y = 1412
integer width = 265
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Quick Filter:"
boolean focusrectangle = false
end type

type dw_qf from datawindow within pfc_ia_cst_nv_net_dev_new
integer x = 1083
integer y = 1400
integer width = 1029
integer height = 92
integer taborder = 50
boolean bringtotop = true
string dataobject = "d_quick_filter"
boolean border = false
boolean livescroll = true
end type

event constructor;DataWindowChild dwchild
Integer li_nr
Long ll_action_status
Long ll_par
Long ll_app_rcvd_prac
Long ll_app_rcvd_payor
Long ll_app_out_to_md

This.InsertRow( 0)

This.GetChild( "quick_filter", dwchild )

li_nr = dwchild.InsertRow( 0 )
dwchild.SetItem( li_nr, "filter_code", "No Filter Selected" )
dwchild.SetItem( li_nr, "filter_description", "No Filter Selected" )
dwchild.SetItem( li_nr, "filter_syntax", "active_status = 1" )
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-29
//$<modify> 02.15.2006 By: Cao YongWang
//$<reason> Performance tuning.
//$<modification> Write script to retrieve data from a cache instead of from the database.

/*
select lookup_code into :ll_action_status from code_lookup where lookup_name = 'Action Status' and code = 'Incomplete';
IF SQLCA.SQLCODE = 100 THEN
	MessageBox("Lookup missing", "You will need to add a 'Incomplete' code to the Action Status lookup table." )
END IF

select lookup_code into :ll_par from code_lookup where lookup_name = 'Action Type' and code = 'PAR';
IF SQLCA.SQLCODE = 100 THEN
	MessageBox("Lookup missing", "You will need to add a 'PAR' code to the Action Type lookup table." )
END IF

select lookup_code into :ll_app_out_to_md from code_lookup where lookup_name = 'Action Type' and code = 'App Out To MD';
IF SQLCA.SQLCODE = 100 THEN
	MessageBox("Lookup missing", "You will need to add a 'PAR' code to the Action Type lookup table." )
END IF


select lookup_code into :ll_app_rcvd_prac from code_lookup where lookup_name = 'Action Type' and code = 'App Rcvd Prac';
IF SQLCA.SQLCODE = 100 THEN
	MessageBox("Lookup missing", "You will need to add a 'App Rcvd Prac' code to the Action Type lookup table." )
END IF

select lookup_code into :ll_app_rcvd_payor from code_lookup where lookup_name = 'Action Type' and code = 'App Rcvd Payor';
IF SQLCA.SQLCODE = 100 THEN
	MessageBox("Lookup missing", "You will need to add a 'App Rcvd Payor' code to the Action Type lookup table." )
END IF
*/
//select lookup_code into :ll_action_status from code_lookup where lookup_name = 'Action Status' and code = 'Incomplete';
ll_action_status = long(gnv_data.of_getitem("code_lookup","lookup_code","upper(lookup_name) = '"+upper('Action Status') + "' and upper(code) = '"+upper('Incomplete') +"'"))

//select lookup_code into :ll_par from code_lookup where lookup_name = 'Action Type' and code = 'PAR';
ll_par = long(gnv_data.of_getitem("code_lookup","lookup_code","upper(lookup_name) = '"+upper('Action Type') + "' and upper(code) = '"+upper('PAR') +"'"))

//select lookup_code into :ll_app_out_to_md from code_lookup where lookup_name = 'Action Type' and code = 'App Out To MD';
ll_app_out_to_md = long(gnv_data.of_getitem("code_lookup","lookup_code","upper(lookup_name) = '"+upper('Action Type') + "' and upper(code) = '"+upper('App Out To MD') +"'"))

//select lookup_code into :ll_app_rcvd_prac from code_lookup where lookup_name = 'Action Type' and code = 'App Rcvd Prac';
ll_app_rcvd_prac = long(gnv_data.of_getitem("code_lookup","lookup_code","upper(lookup_name) = '"+upper('Action Type') + "' and upper(code) = '"+upper('App Rcvd Prac') +"'"))

//select lookup_code into :ll_app_rcvd_payor from code_lookup where lookup_name = 'Action Type' and code = 'App Rcvd Payor';
ll_app_rcvd_payor = long(gnv_data.of_getitem("code_lookup","lookup_code","upper(lookup_name) = '"+upper('Action Type') + "' and upper(code) = '"+upper('App Rcvd Payor') +"'"))
//---------------------------- APPEON END ----------------------------

//Due Today
li_nr = dwchild.InsertRow( 0 )
dwchild.SetItem( li_nr, "filter_code", "Items Due TODAY" )
dwchild.SetItem( li_nr, "filter_description", "Displays a list of Action Item due TODAY." )
dwchild.SetItem( li_nr, "filter_syntax", "active_status = 1 AND DaysAfter( due_date, today() ) = 0 AND action_status = " + String( ll_action_status )  )

//Over Due items
li_nr = dwchild.InsertRow( 0 )
dwchild.SetItem( li_nr, "filter_code", "Items Over Due" )
dwchild.SetItem( li_nr, "filter_description", "Displays a list of Action Item that are overdue." )
dwchild.SetItem( li_nr, "filter_syntax", "active_status = 1 AND DaysAfter( today(), due_date ) < 0 AND action_status = " + String( ll_action_status )  )
dwchild.SetItem( li_nr, "filter_index", 1  )

//Application Not Back From Provider
li_nr = dwchild.InsertRow( 0 )
dwchild.SetItem( li_nr, "filter_code", "Applications Not Back From Provider" )
dwchild.SetItem( li_nr, "filter_description", "Displays a list of App Rcvd Prac Action Item that are overdue." )
dwchild.SetItem( li_nr, "filter_syntax", "active_status = 1 AND action_type = " + String( ll_app_rcvd_prac ) + " AND DaysAfter( today(), due_date ) <= 0 AND action_status = " + String( ll_action_status )  )
dwchild.SetItem( li_nr, "filter_index", 2  )

//Applications needing printing
li_nr = dwchild.InsertRow( 0 )
dwchild.SetItem( li_nr, "filter_code", "Applications Needing Printed" )
dwchild.SetItem( li_nr, "filter_description", "Displays a list of Applications needing prining." )
dwchild.SetItem( li_nr, "filter_syntax", "active_status = 1 AND action_type = " + String( ll_app_out_to_md ) + " AND DaysAfter( today(), due_date ) <= 0 AND action_status = " + String( ll_action_status )  )
dwchild.SetItem( li_nr, "filter_index", 2  )

//Application Not Back From Plan/Org
li_nr = dwchild.InsertRow( 0 )
dwchild.SetItem( li_nr, "filter_code", "PAR # Not Back From Payor" )
dwchild.SetItem( li_nr, "filter_description", "Displays a list of Par # Action Items that are overdue." )
dwchild.SetItem( li_nr, "filter_syntax", "active_status = 1 AND action_type = " + String( ll_par ) + " AND DaysAfter( today(), due_date ) <= 0 AND action_status = " + String( ll_action_status )  )
dwchild.SetItem( li_nr, "filter_index", 3  )

//Items Due in the next 7 days
li_nr = dwchild.InsertRow( 0 )
dwchild.SetItem( li_nr, "filter_code", "Items Due in the next 7 days" )
dwchild.SetItem( li_nr, "filter_description", "Displays a list of Action Item that are due in the next 7 days." )
dwchild.SetItem( li_nr, "filter_syntax", "active_status = 1 AND DaysAfter( today(), due_date ) >= 0 AND DaysAfter( RelativeDate(today(),7), due_date ) <= 7 AND action_status = " + String( ll_action_status )  )
dwchild.SetItem( li_nr, "filter_index", 4  )

//Show Inactive History records
li_nr = dwchild.InsertRow( 0 )
dwchild.SetItem( li_nr, "filter_code", "Show History Records" )
dwchild.SetItem( li_nr, "filter_description", "Displays a list of all Action Item that are Inactive (History)." )
dwchild.SetItem( li_nr, "filter_syntax", "active_status = 0" )
dwchild.SetItem( li_nr, "filter_index", 5  )

//Outstanding PAR # 0 - 30 Days
li_nr = dwchild.InsertRow( 0 )
dwchild.SetItem( li_nr, "filter_code", "Outstanding PAR # 0 - 30 Days" )
dwchild.SetItem( li_nr, "filter_description", "Displays a list of PAR Action Item that have been incomplete for between 1 - 30." )
dwchild.SetItem( li_nr, "filter_syntax", "active_status = 1 AND action_type = " + String( ll_par ) + " AND action_status = " + String( ll_action_status ) + " AND (action_date <= RelativeDate( Today(), -30) AND action_date >= Today() )" )
dwchild.SetItem( li_nr, "filter_index", 6  )

//Outstanding PAR # 31 - 60 Days
li_nr = dwchild.InsertRow( 0 )
dwchild.SetItem( li_nr, "filter_code", "Outstanding PAR # 30 - 60 Days" )
dwchild.SetItem( li_nr, "filter_description", "Displays a list of PAR Action Item that have been incomplete for between 30 - 60 days." )
dwchild.SetItem( li_nr, "filter_syntax", "active_status = 1 AND action_type = " + String( ll_par ) + " AND action_status = " + String( ll_action_status ) + " AND (action_date <= RelativeDate( Today(), -30) AND action_date >= RelativeDate( Today(), -60))" )
dwchild.SetItem( li_nr, "filter_index", 7  )

//Outstanding PAR # 61 - 90 Days
li_nr = dwchild.InsertRow( 0 )
dwchild.SetItem( li_nr, "filter_code", "Outstanding PAR # 60 - 90 Days" )
dwchild.SetItem( li_nr, "filter_description", "Displays a list of PAR Action Item that have been incomplete for between 60 - 90 days." )
dwchild.SetItem( li_nr, "filter_syntax", "active_status = 1 AND action_type = " + String( ll_par ) + " AND action_status = " + String( ll_action_status ) + " AND action_date <= RelativeDate( Today(), -90)" )
dwchild.SetItem( li_nr, "filter_index", 8  )

//Outstanding PAR # > 90 Days
li_nr = dwchild.InsertRow( 0 )
dwchild.SetItem( li_nr, "filter_code", "Outstanding PAR # > 90 Days" )
dwchild.SetItem( li_nr, "filter_description", "Displays a list of PAR Action Item that have been incomplete for over 90 days." )
dwchild.SetItem( li_nr, "filter_syntax", "active_status = 1 AND action_type = " + String( ll_par ) + " AND action_status = " + String( ll_action_status ) + " AND action_date <= RelativeDate( Today(), -90)" )
dwchild.SetItem( li_nr, "filter_index", 9  )

//applications not received back from prac in last 15 days
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-30
//$<modify> 02.15.2006 By: Cao YongWang
//$<reason> Performance tuning.
//$<modification> Write script to retrieve data from a cache instead of from the database.
/*
select lookup_code into :ll_par from code_lookup where lookup_name = 'Action Type' and code = 'App Rcvd Prac';
IF SQLCA.SQLCODE = 100 THEN
	MessageBox("Error 3", "You will need to add a 'App Rcvd Prac' code to the Action Status lookup table." )
END IF
*/
ll_par = long(gnv_data.of_getitem("code_lookup","lookup_code","upper(lookup_name) = '"+upper('Action Type') + "' and upper(code) = '"+upper('App Rcvd Prac') +"'"))
//---------------------------- APPEON END ----------------------------

//Outstanding PAR # 1 - 7 Days
li_nr = dwchild.InsertRow( 0 )
dwchild.SetItem( li_nr, "filter_code", "Apps Not Recieved From Prac 0 - 7 Days" )
dwchild.SetItem( li_nr, "filter_description", "Displays a list of practitioners that have not sent back there applications for between 1 and 7 days." )
dwchild.SetItem( li_nr, "filter_syntax", "active_status = 1 AND action_type = " + String( ll_par ) + " AND action_status = " + String( ll_action_status ) + " AND (action_date <= RelativeDate( Today(), -7) AND action_date >= Today() )" )
dwchild.SetItem( li_nr, "filter_index", 10  )

//Outstanding PAR # 7 - 15 Days
li_nr = dwchild.InsertRow( 0 )
dwchild.SetItem( li_nr, "filter_code", "Apps Not Recieved From Prac 7 - 15 Days" )
dwchild.SetItem( li_nr, "filter_description", "Displays a list of practitioners that have not sent back there applications for between 7 and 15 days." )
dwchild.SetItem( li_nr, "filter_syntax", "active_status = 1 AND action_type = " + String( ll_par ) + " AND action_status = " + String( ll_action_status ) + " AND (action_date <= RelativeDate( Today(), -7) AND action_date >= RelativeDate( Today(), -15))" )
dwchild.SetItem( li_nr, "filter_index", 11  )

//Outstanding PAR # 15 - 30 Days
li_nr = dwchild.InsertRow( 0 )
dwchild.SetItem( li_nr, "filter_code", "Apps Not Recieved From Prac 15 - 30 Days" )
dwchild.SetItem( li_nr, "filter_description", "Displays a list of practitioners that have not sent back there applications for between 15 and 30 days." )
dwchild.SetItem( li_nr, "filter_syntax", "active_status = 1 AND action_type = " + String( ll_par ) + " AND action_status = " + String( ll_action_status ) + " AND (action_date <= RelativeDate( Today(), -15) AND action_date >= RelativeDate( Today(), -30))" )
dwchild.SetItem( li_nr, "filter_index", 12  )

//Outstanding PAR # - 30 Days
li_nr = dwchild.InsertRow( 0 )
dwchild.SetItem( li_nr, "filter_code", "Apps Not Recieved From Prac Over 30 Days" )
dwchild.SetItem( li_nr, "filter_description", "Displays a list of practitioners that have not sent back there applications for more than 30 days." )
dwchild.SetItem( li_nr, "filter_syntax", "active_status = 1 AND action_type = " + String( ll_par ) + " AND action_status = " + String( ll_action_status ) + " AND (action_date <= RelativeDate( Today(), -30))" )
dwchild.SetItem( li_nr, "filter_index", 13  )


end event

event itemchanged;
//String ls_filter

//ls_filter = data

of_set_quick_filter( data )

//IF IsNull( ls_filter ) OR ls_filter = "" THEN
//	tab_1.tabpage_ai.dw_net_dev.SetFilter( "" )
//ELSE
//	tab_1.tabpage_ai.dw_net_dev.SetFilter( ls_filter )
//END IF
//
//tab_1.tabpage_ai.dw_net_dev.Filter( )
//
////st_as_msg.Visible = False
end event

type st_group_by from statictext within pfc_ia_cst_nv_net_dev_new
integer x = 2126
integer y = 1416
integer width = 224
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Group By:"
boolean focusrectangle = false
end type

type ddlb_group_by from dropdownlistbox within pfc_ia_cst_nv_net_dev_new
integer x = 2359
integer y = 1404
integer width = 663
integer height = 444
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Practitioner","Payer","Client/Group"}
borderstyle borderstyle = stylelowered!
end type

event constructor;This.Text =  "Practitioner"
end event

event selectionchanged;//Is_group_by

IF index = 1 THEN
	is_group_by = "Practitioner"
ELSEIF index = 2 THEN
	is_group_by = "Payor"
ELSE
	is_group_by = "Client"
END IF

//of_report_selected( "" )
of_report_selected_ver9( "NONE") //Start Code Change ----11.10.2008 #V85 maha

//Integer li_facility_id
//
//IF index = 2 THEN
//	IF ib_status_with_notes THEN
//		tab_1.tabpage_report.dw_report_data.DataObject = "d_net_dev_action_items_rep_by_payer_wn"
//	ELSE
//		tab_1.tabpage_report.dw_report_data.DataObject = "d_net_dev_action_items_report_by_payer"
//	END IF
//	CHOOSE CASE gi_intelliapp_type
//		//SINGLE GROUP
//	CASE 0
//		//MULTI SITE GROUP
//	CASE 1
//		tab_1.tabpage_report.dw_report_data.Modify( "type_t.text = 'Group'" )
//		//BILLING COMPANY
//	CASE 2
//		tab_1.tabpage_report.dw_report_data.Modify( "type_t.text = 'Client'" )		
//	END CHOOSE	
//ELSEIF index = 3 THEN
//	tab_1.tabpage_report.dw_report_data.DataObject = "d_net_dev_action_items_report_by_payer_m"
//	CHOOSE CASE gi_intelliapp_type
//		//SINGLE GROUP
//	CASE 0
//		//MULTI SITE GROUP
//	CASE 1
//		tab_1.tabpage_report.dw_report_data.Modify( "type_t.text = 'Group/Application'" )
//		//BILLING COMPANY
//	CASE 2
//		tab_1.tabpage_report.dw_report_data.Modify( "type_t.text = 'Client/Application'" )		
//	END CHOOSE		
//ELSEIF index = 1 THEN
//	IF ib_status_with_notes THEN
//		tab_1.tabpage_report.dw_report_data.DataObject = "d_net_dev_action_items_report_by_prac_wn"		
//	ELSE
//		tab_1.tabpage_report.dw_report_data.DataObject = "d_net_dev_action_items_report_by_prac"
//	END IF
//END IF
//
//li_facility_id = dw_orgs_facilities.GetItemNumber( dw_orgs_facilities.GetRow(), "parent_facility_id")
//tab_1.tabpage_report.dw_report_data.Reset()
//tab_1.tabpage_report.dw_report_data.SetTransObject( sqlca )
////tab_1.tabpage_report.dw_report_data.Modify("DataWindow.Zoom = 90")
//of_retrieve_detail( ii_facility_id )
//
//DataWindowChild dwchild
//
//tab_1.tabpage_report.dw_report_data.GetChild( "action_dept", dwchild )
//dwchild.SetTransObject( SQLCA )
//dwchild.Retrieve( "Action Department" )
//
//tab_1.tabpage_report.dw_report_data.GetChild( "action_type", dwchild )
//dwchild.SetTransObject( SQLCA )
//dwchild.Retrieve( "Action Type" )
//
//tab_1.tabpage_report.dw_report_data.GetChild( "action_status", dwchild )
//dwchild.SetTransObject( SQLCA )
//dwchild.Retrieve( "Action Status" )
//
//tab_1.tabpage_report.dw_report_data.GetChild( "app_id", dwchild )
//dwchild.SetTransObject( SQLCA )
//dwchild.Retrieve( )
//
//
//IF index = 2 THEN
//	tab_1.tabpage_report.dw_report_data.SetSort( "v_full_name_full_name A, facility_name1 A, action_date D" )
//ELSEIF index = 3 THEN
//	tab_1.tabpage_report.dw_report_data.SetSort( "facility_name1 A, app_id A, v_full_name_full_name A, action_date D" )
//ELSEIF index = 1 THEN
//	tab_1.tabpage_report.dw_report_data.SetSort( "facility_name1 A, v_full_name_full_name A, action_date D" )
//END IF
//
//tab_1.tabpage_report.dw_report_data.Sort()
end event

type st_zoom from statictext within pfc_ia_cst_nv_net_dev_new
integer x = 3067
integer y = 1416
integer width = 146
integer height = 68
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Zoom:"
boolean focusrectangle = false
end type

type ddlb_zoom from dropdownlistbox within pfc_ia_cst_nv_net_dev_new
integer x = 3223
integer y = 1400
integer width = 197
integer height = 524
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean vscrollbar = true
string item[] = {"100%","90%","80%","70%","60%","50%"}
borderstyle borderstyle = stylelowered!
end type

event constructor;This.Text = "90%"
end event

event selectionchanged;tab_1.tabpage_report.dw_report_data.Modify("DataWindow.Zoom = " + Mid(ddlb_zoom.Text, 1, Len(ddlb_zoom.Text) -1 ) )
end event

type st_as_msg from statictext within pfc_ia_cst_nv_net_dev_new
integer x = 27
integer y = 1728
integer width = 3154
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 255
long backcolor = 67108864
boolean enabled = false
boolean focusrectangle = false
end type

type dw_facility_add from u_dw within pfc_ia_cst_nv_net_dev_new
boolean visible = false
integer x = 498
integer y = 576
integer width = 361
integer height = 252
integer taborder = 11
boolean bringtotop = true
string dataobject = "d_pd_affil_status_ia"
end type

type cb_batch from commandbutton within pfc_ia_cst_nv_net_dev_new
integer x = 5
integer y = 1476
integer width = 731
integer height = 96
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Batch Add"
end type

event clicked;openwithparm(w_batch_add_apps_facilities_response, string(gl_prac_id) + "*P" ) //Start Code Change ----12.11.2008 #V85 maha - changed window for modal problem

dw_orgs_facilities.Retrieve( il_prac_id, gs_user_id )
end event

type p_2 from picture within pfc_ia_cst_nv_net_dev_new
integer x = 32
integer y = 1492
integer width = 73
integer height = 64
boolean bringtotop = true
boolean originalsize = true
string picturename = "facility.bmp"
boolean focusrectangle = false
end type

event clicked;of_multi_add()
end event

