$PBExportHeader$n_cst_appmanager.sru
forward
global type n_cst_appmanager from pfc_n_cst_appmanager
end type
end forward

global type n_cst_appmanager from pfc_n_cst_appmanager
event of_set_contract_path ( string as_path )
end type
global n_cst_appmanager n_cst_appmanager

type variables

n_cst_msword gnvlo_msword


string ls_mail_notify[]
string is_application_path
boolean ib_ref_cache

// mskinner 16 feb 2006 -- begin
long il_itle_time
// mskinner 16 feb 2006 -- end

n_cst_string inv_string
String is_lookupnamelist[]  //Added By Ken.Guo 12/31/2011. 

Boolean ib_hide_calendar = true //Added By Jay Chen 04-20-2015 remend date time control visible

Protected:
Integer il_organization_id
Integer il_facility_id
Boolean ib_field_object_cache = False
string is_contract_path

String VERSION
// start code change --- 1.2.2005 MSKINNER
CONSTANT String Build_date  = ' Build Date: ' + String( Today() ,'MMMM dd, yyyy' ) //+ ' ' + String( Now() , 'hh:mm AM/PM' ) //Commented By Ken.Guo 2010-08-23
// end code change --- 1.2.2005 MSKINNER

//Start Code change --11.30.2006 Added by henry.
DataStore ids_lookup_date , ids_lookup_modify
//End Code change --11.30.2006

// Added by davis 01.05.2007
String is_drop_downs[]

Boolean		ib_EZMenu_Refresh  //added by gavins 20130325
integer		ii_postnumber, ii_nownumber

//--------------- <RP> 1.5.2017----------------------------------------------------------------
// Used for running benchmark timer tests; set ib_benchmark = TRUE to enable
boolean ib_benchmark = FALSE
time it_firstMark, it_lastMark
string	is_benchmark_descr = ""
//----------------------------------------------------------------------------------------------

//--------------- <RP> 1.19.2017----------------------------------------------------------------
// Used to keep track of individual cache retrieval status
datastore ids_cache_list
//----------------------------------------------------------------------------------------------

end variables

forward prototypes
public function integer of_get_facility_id ()
public function integer of_set_facility_id (integer ai_facility_id)
public function boolean of_get_field_object_cache ()
public function integer of_set_field_object_cache (boolean ab_val)
public function long of_get_id (string id_type)
public function string of_get_contract_path ()
public function integer of_set_contract_path ()
public function integer of_set_contract_path (string as_path)
public function integer of_setcontraccache ()
public function long of_get_id (string id_type, integer ai_increasevalue)
public function integer of_setcontraccache_code_lookup (string as_lookup_name)
public function integer of_setcontraccache_code_lookup (string as_lookup_name, boolean ab_refresh)
public function integer of_setcontraccache_code_lookup (boolean ab_refresh_all)
public function integer of_setcontraccache_register ()
public function string of_getversionlabel ()
public subroutine of_modify_menu_attr (menu am_menu, string as_attribute, any aa_value)
public subroutine of_refresh_ezmenu ()
public subroutine of_set_ezmenu_refresh_state (boolean ab_state)
public subroutine of_refresh_sign (boolean abln_swith)
public subroutine of_window_basic_code (window aw_target)
public function integer of_benchmarklabel (string as_label)
public function integer of_benchmarkdisplay ()
public function integer of_setcachestatus (string as_cache_name, long al_status)
public function long of_getcachestatus (string as_cache_name)
end prototypes

event of_set_contract_path(string as_path);/******************************************************************************************************************
**  [PUBLIC]   : of_set_contract_path( )
**==================================================================================================================
**  Purpose   	: sets the contract path
**==================================================================================================================
**  Arguments 	: [none] 
**==================================================================================================================
**  Returns   	: [none]   
**==================================================================================================================
**  Notes     	: 	   
**==================================================================================================================
**  Created By	: Michael B. Skinner 18 August 2005  © Intellisoftgroup, Inc
**==================================================================================================================
**  Modification Log
**   Changed By             Change Date                                               Reason
** ------------------------------------------------------------------------------------------------------------------
********************************************************************************************************************/



is_contract_path = as_path
end event

public function integer of_get_facility_id ();Return il_facility_id
end function

public function integer of_set_facility_id (integer ai_facility_id);il_facility_id = ai_facility_id

Return 0
end function

public function boolean of_get_field_object_cache ();Return ib_field_object_cache
end function

public function integer of_set_field_object_cache (boolean ab_val);ib_field_object_cache = ab_val

Return 1
end function

public function long of_get_id (string id_type);//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-01
//$<modify> 02.17.2006 By: LeiWei
//$<reason> Performance tuning
//$<modification> Overload the function. Refer to PT-02 for more information. 
/*
Long ll_next_id


CHOOSE CASE UPPER(id_type)

	CASE "RIGHTS"
		SELECT ids.rights_id  
		INTO :ll_next_id  
		FROM ids  ;

		ll_next_id ++

	   UPDATE ids  
      SET rights_id = :ll_next_id  ;

	   IF SQLCA.SQLCODE <> 0 THEN
		  RETURN -1
	   END IF		
		
	CASE "APPAUDIT"
		SELECT ids.app_audit_id  
		INTO :ll_next_id  
		FROM ids  ;

		ll_next_id ++

	   UPDATE ids  
      SET app_audit_id = :ll_next_id  ;

		IF SQLCA.SQLCODE <> 0 THEN
			RETURN -1
	   END IF		
	
	CASE "LOOKUP"
		SELECT ids.lookup_code_id  
		INTO :ll_next_id  
		FROM ids  ;

		ll_next_id ++

	   UPDATE ids  
      SET lookup_code_id = :ll_next_id  ;

		IF SQLCA.SQLCODE <> 0 THEN
		  RETURN -1
	   END IF		
	
	CASE "COMMITTEE"
		SELECT ids.committee_id  
		INTO :ll_next_id  
		FROM ids  ;

		ll_next_id ++

	   UPDATE ids  
      SET committee_id = :ll_next_id  ;

	   IF SQLCA.SQLCODE <> 0 THEN
			  RETURN -1
	   END IF		

 CASE "EXPORT"
		SELECT ids.export_id  
		INTO :ll_next_id  
		FROM ids  ;

		ll_next_id ++

	   UPDATE ids  
      SET export_id = :ll_next_id  ;

	   IF SQLCA.SQLCODE <> 0 THEN
			  RETURN -1
	   END IF		
			
	CASE "MEETING"
		SELECT ids.meeting_id  
		INTO :ll_next_id  
		FROM ids  ;

		ll_next_id ++

	   UPDATE ids  
      SET meeting_id = :ll_next_id  ;

	   IF SQLCA.SQLCODE <> 0 THEN
			  RETURN -1
	   END IF		
	
	CASE "PRAC_ID"
		SELECT ids.prac_id  
		INTO :ll_next_id  
		FROM ids  ;

		ll_next_id ++

	   UPDATE ids  
      SET prac_id = :ll_next_id  ;

	   IF SQLCA.SQLCODE <> 0 THEN
			  RETURN -1
	   END IF		
	
	CASE "RECORD_ID"
		SELECT ids.record_id  
		INTO :ll_next_id  
		FROM ids  ;

		ll_next_id ++

	   UPDATE ids  
      SET record_id = :ll_next_id  ;

	   IF SQLCA.SQLCODE <> 0 THEN
			  RETURN -1
	   END IF		


END CHOOSE

RETURN ll_next_id
*/

RETURN of_get_id(id_type,1)

//---------------------------- APPEON END ----------------------------

end function

public function string of_get_contract_path ();/******************************************************************************************************************
**  [PUBLIC]   : of_get_contract_path
**==================================================================================================================
**  Purpose   	: returns the contract_path
**==================================================================================================================
**  Arguments 	: [none] 
**==================================================================================================================
**  Returns   	: [none]   
**==================================================================================================================
**  Notes     	: 	   
**==================================================================================================================
**  Created By	: Michael B. Skinner 18 August 2005  © Intellisoftgroup, Inc
**==================================================================================================================
**  Modification Log
**   Changed By             Change Date                                               Reason
** ------------------------------------------------------------------------------------------------------------------
********************************************************************************************************************/


return is_contract_path
end function

public function integer of_set_contract_path ();/******************************************************************************************************************
**  [PUBLIC]   : of_get_contract_path
**==================================================================================================================
**  Purpose   	: 
**==================================================================================================================
**  Arguments 	: [none] 
**==================================================================================================================
**  Returns   	: [none]   
**==================================================================================================================
**  Notes     	: 	   
**==================================================================================================================
**  Created By	: Michael B. Skinner 18 August 2005  © Intellisoftgroup, Inc
**==================================================================================================================
**  Modification Log
**   Changed By             Change Date                                               Reason
** ------------------------------------------------------------------------------------------------------------------
********************************************************************************************************************/

//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 03.15.2006 By: Cao YongWang
//$<reason> Performance tuning.Write script to retrieve data from a cache instead of a SQL statement.
/*
long ll_count

//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 2005-11-11 By: owen chen
//$<reason> add database option for sql excution
choose case gs_dbtype
	case 'ASA'
		select count(*) 
		into :ll_count
		from sys.syscolumn 
		where column_name ='contract_path';
	case 'SQL'
		select count(*) 
		into :ll_count
		from v_syscolumn 
		where column_name ='contract_path';		
end choose
//---------------------------- APPEON END ----------------------------

if ll_count > 0 THEN 
	
	 SELECT ids.contract_path  
	 INTO :is_contract_path  
	 FROM ids  ;
end if 
*/
is_contract_path = gnv_data.of_getitem("ids" , "contract_path" , False)
//---------------------------- APPEON END ----------------------------

return 0
end function

public function integer of_set_contract_path (string as_path);/******************************************************************************************************************
**  [PUBLIC]   : of_set_contract_path
**==================================================================================================================
**  Purpose   	: 
**==================================================================================================================
**  Arguments 	: [none] 
**==================================================================================================================
**  Returns   	: [none]   
**==================================================================================================================
**  Notes     	: 	   
**==================================================================================================================
**  Created By	: Michael B. Skinner 18 August 2005  © Intellisoftgroup, Inc
**==================================================================================================================
**  Modification Log
**   Changed By             Change Date                                               Reason
** ------------------------------------------------------------------------------------------------------------------
********************************************************************************************************************/

IS_Contract_path = AS_PATH


return 0
end function

public function integer of_setcontraccache ();//--------------------------- APPEON BEGIN ---------------------------
//$<add> 01.05.2007 By: Davis
//$<reason> The original function move to of_setcontraccache_register().
//$<reason> Referesh contract cache.

Integer ll_i
gnv_appeondb.of_startqueue()

FOR ll_i = 1 TO upperbound(is_drop_downs)
	gnv_app.inv_dwcache.of_refresh( is_drop_downs[ll_i] )
END FOR

gnv_appeondb.of_commitqueue()

Return 1

//---------------------------- APPEON END ----------------------------

end function

public function long of_get_id (string id_type, integer ai_increasevalue);//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-02
//$<add> 02.17.2006 By: LeiWei
//$<reason> Performance tuning
//$<modification> Modify the of_get_id function to 1) get the ID from database; 2) add the value of 
//$<modification> ai_increasevalue, whose value equals to the loop times; 3) update the new value
//$<modification> for the ID in the database. After modification, the final ID value is updated to the database
//$<modification> in one time, compared to the multiple times in the original of_get_id (the times depends 
//$<modification> on the loops times). Refer to PT-01 for more information.


if ai_increasevalue <= 0 THEN RETURN 0

Long ll_next_id

CHOOSE CASE UPPER(id_type)

	CASE "RIGHTS"
		gnv_appeondb.of_startqueue( )

		SELECT ids.rights_id 
		INTO :ll_next_id  
		FROM ids  ;

	   UPDATE ids  
      SET rights_id = (isnull(rights_id,0)  + :ai_increasevalue);

		gnv_appeondb.of_commitqueue( )
		if isnull(ll_next_id) then ll_next_id = 0
		ll_next_id ++

	   IF SQLCA.SQLCODE <> 0 THEN
		  RETURN -1
	   END IF		
		
	CASE "APPAUDIT"
		gnv_appeondb.of_startqueue( )

		SELECT ids.app_audit_id  
		INTO :ll_next_id  
		FROM ids  ;

	   UPDATE ids  
      SET app_audit_id = (isnull(app_audit_id,0)  + :ai_increasevalue);

		gnv_appeondb.of_commitqueue( )
		if isnull(ll_next_id) then ll_next_id = 0
		ll_next_id ++

		IF SQLCA.SQLCODE <> 0 THEN
			RETURN -1
	   END IF		
	
	CASE "LOOKUP"
		gnv_appeondb.of_startqueue( )

		SELECT ids.lookup_code_id  
		INTO :ll_next_id  
		FROM ids  ;

	   UPDATE ids  
      SET lookup_code_id = (isnull(lookup_code_id,0)  + :ai_increasevalue);

		gnv_appeondb.of_commitqueue( )
		if isnull(ll_next_id) then ll_next_id = 0
		ll_next_id ++

		IF SQLCA.SQLCODE <> 0 THEN
		  RETURN -1
	   END IF		
	
	CASE "COMMITTEE"
		gnv_appeondb.of_startqueue( )

		SELECT ids.committee_id  
		INTO :ll_next_id  
		FROM ids  ;

	   UPDATE ids  
      SET committee_id = (isnull(committee_id,0)  + :ai_increasevalue);

		gnv_appeondb.of_commitqueue( )
		if isnull(ll_next_id) then ll_next_id = 0
		ll_next_id ++

	   IF SQLCA.SQLCODE <> 0 THEN
			  RETURN -1
	   END IF		

 CASE "EXPORT"
		gnv_appeondb.of_startqueue( )

		SELECT ids.export_id  
		INTO :ll_next_id  
		FROM ids  ;

	   UPDATE ids  
      SET export_id = (isnull(export_id,0)  + :ai_increasevalue);

		gnv_appeondb.of_commitqueue( )
		if isnull(ll_next_id) then ll_next_id = 0
		ll_next_id ++

	   IF SQLCA.SQLCODE <> 0 THEN
			  RETURN -1
	   END IF		
			
	CASE "MEETING"
		gnv_appeondb.of_startqueue( )

		SELECT ids.meeting_id  
		INTO :ll_next_id  
		FROM ids  ;

	   UPDATE ids  
      SET meeting_id = (isnull(meeting_id,0)  + :ai_increasevalue);

		gnv_appeondb.of_commitqueue( )
		if isnull(ll_next_id) then ll_next_id = 0
		ll_next_id ++

	   IF SQLCA.SQLCODE <> 0 THEN
			  RETURN -1
	   END IF		
	
	CASE "PRAC_ID"
		gnv_appeondb.of_startqueue( )

		SELECT ids.prac_id  
		INTO :ll_next_id  
		FROM ids  ;

	   UPDATE ids  
      SET prac_id = (isnull(prac_id,0)  + :ai_increasevalue);

		gnv_appeondb.of_commitqueue( )
		if isnull(ll_next_id) then ll_next_id = 0
		ll_next_id ++

	   IF SQLCA.SQLCODE <> 0 THEN
			  RETURN -1
	   END IF		
	
	CASE "RECORD_ID"
		gnv_appeondb.of_startqueue( )

		SELECT ids.record_id  
		INTO :ll_next_id  
		FROM ids  ;

	   UPDATE ids  
      SET record_id = (isnull(record_id,0)  + :ai_increasevalue);

		gnv_appeondb.of_commitqueue( )
		if isnull(ll_next_id) then ll_next_id = 0
		ll_next_id ++

	   IF SQLCA.SQLCODE <> 0 THEN
			  RETURN -1
	   END IF		
		
	CASE "WORKFLOW" //Added for Work flow id. 10.23.2006 Henry
		gnv_appeondb.of_startqueue( )

		SELECT ids.wf_id  
		INTO :ll_next_id  
		FROM ids  ;

		UPDATE ids  
		SET wf_id = (isnull(wf_id , 0)  + :ai_increasevalue);

		gnv_appeondb.of_commitqueue( )
		If isnull(ll_next_id) Then ll_next_id = 0
		ll_next_id ++

		IF SQLCA.SQLCODE <> 0 THEN
			  RETURN -1
		END IF		
		//--------------------------- APPEON BEGIN ---------------------------
		//$<modify> 03.27.2007 By: Machongmin
		//$<reason> Fix a defect.	
	case "DOC_ID"
		gnv_appeondb.of_startqueue( )
		commit; //It sometimes can't get doc_id,So add it. 				//Added By Mark Lee 08/29/12
		SELECT ids.doc_id  
		INTO :ll_next_id  
		FROM ids  ;

		UPDATE ids  
		SET doc_id = (isnull(doc_id , 0)  + :ai_increasevalue);

		gnv_appeondb.of_commitqueue( )
		If isnull(ll_next_id) Then ll_next_id = 0
		ll_next_id ++

		IF SQLCA.SQLCODE <> 0 THEN
			//Added By Mark Lee 08/29/12
			Rollback;
			  RETURN -1
		ELSE
			//Added By Mark Lee 08/29/12
			COMMIT;
		END IF		
		
		//---------------------------- APPEON END ----------------------------
		
		
	//--------------------------- APPEON BEGIN ---------------------------
	//$<add> 04.17.2007 By: Jack
	//$<reason> 

	case "CTX_ID"
		gnv_appeondb.of_startqueue( )

		SELECT ids.ctx_id  
		INTO :ll_next_id  
		FROM ids  ;

		UPDATE ids  
		SET ctx_id = (isnull(ctx_id , 0)  + :ai_increasevalue);

		gnv_appeondb.of_commitqueue( )
		If isnull(ll_next_id) Then ll_next_id = 0
		ll_next_id ++

		IF SQLCA.SQLCODE <> 0 THEN
			  RETURN -1
		END IF		
	case upper("ctx_acp_folder_id")
		gnv_appeondb.of_startqueue( )

		SELECT ids.ctx_acp_folder_id  
		INTO :ll_next_id  
		FROM ids  ;

		UPDATE ids  
		SET ctx_acp_folder_id = (isnull(ctx_acp_folder_id , 0)  + :ai_increasevalue);

		gnv_appeondb.of_commitqueue( )
		If isnull(ll_next_id) Then ll_next_id = 0
		ll_next_id ++

		IF SQLCA.SQLCODE <> 0 THEN
			  RETURN -1
		END IF		
	case upper("ctx_acp_clause_id")
		gnv_appeondb.of_startqueue( )

		SELECT ids.ctx_acp_clause_id  
		INTO :ll_next_id  
		FROM ids  ;

		UPDATE ids  
		SET ctx_acp_clause_id = (isnull(ctx_acp_clause_id , 0)  + :ai_increasevalue);

		gnv_appeondb.of_commitqueue( )
		If isnull(ll_next_id) Then ll_next_id = 0
		ll_next_id ++

		IF SQLCA.SQLCODE <> 0 THEN
			  RETURN -1
		END IF		
	case upper("ctx_acp_template_id")
		gnv_appeondb.of_startqueue( )

		SELECT ids.ctx_acp_template_id  
		INTO :ll_next_id  
		FROM ids  ;

		UPDATE ids  
		SET ctx_acp_template_id = (isnull(ctx_acp_template_id , 0)  + :ai_increasevalue);

		gnv_appeondb.of_commitqueue( )
		If isnull(ll_next_id) Then ll_next_id = 0
		ll_next_id ++

		IF SQLCA.SQLCODE <> 0 THEN
			  RETURN -1
		END IF		
	case upper("ctx_acp_document_id")
		gnv_appeondb.of_startqueue( )

		SELECT ids.ctx_acp_document_id  
		INTO :ll_next_id  
		FROM ids  ;

		UPDATE ids  
		SET ctx_acp_document_id = (isnull(ctx_acp_document_id , 0)  + :ai_increasevalue);

		gnv_appeondb.of_commitqueue( )
		If isnull(ll_next_id) Then ll_next_id = 0
		ll_next_id ++

		IF SQLCA.SQLCODE <> 0 THEN
			  RETURN -1
		END IF		
	case upper("facility_id")
		gnv_appeondb.of_startqueue( )

		SELECT ids.facility_id  
		INTO :ll_next_id  
		FROM ids  ;

		UPDATE ids  
		SET facility_id = (isnull(facility_id , 0)  + :ai_increasevalue);

		gnv_appeondb.of_commitqueue( )
		If isnull(ll_next_id) Then ll_next_id = 0
		ll_next_id ++

		IF SQLCA.SQLCODE <> 0 THEN
			  RETURN -1
		END IF		
	case upper("contact_id")
		gnv_appeondb.of_startqueue( )

		SELECT ids.contact_id  
		INTO :ll_next_id  
		FROM ids  ;

		UPDATE ids  
		SET contact_id = (isnull(contact_id , 0)  + :ai_increasevalue);

		gnv_appeondb.of_commitqueue( )
		If isnull(ll_next_id) Then ll_next_id = 0
		ll_next_id ++

		IF SQLCA.SQLCODE <> 0 THEN
			  RETURN -1
		END IF		
	case upper("email_id")
		gnv_appeondb.of_startqueue( )

		SELECT ids.email_id  
		INTO :ll_next_id  
		FROM ids  ;

		UPDATE ids  
		SET email_id = (isnull(email_id , 0)  + :ai_increasevalue);

		gnv_appeondb.of_commitqueue( )
		If isnull(ll_next_id) Then ll_next_id = 0
		ll_next_id ++

		IF SQLCA.SQLCODE <> 0 THEN
			  RETURN -1
		END IF		
		
		
	//added by ken at 2007-05-18	
	case upper('user_facility_id')
		gnv_appeondb.of_startqueue( )

		SELECT ids.user_facility_id  
		INTO :ll_next_id  
		FROM ids  ;

		UPDATE ids  
		SET user_facility_id = (isnull(user_facility_id , 0)  + :ai_increasevalue);

		gnv_appeondb.of_commitqueue( )
		If isnull(ll_next_id) Then ll_next_id = 0
		ll_next_id ++

		IF SQLCA.SQLCODE <> 0 THEN
			  RETURN -1
		END IF		
		
	//added by ken at 2007-05-18		
	case upper('user_view_id')
		gnv_appeondb.of_startqueue( )
		commit; //It sometimes can't get user_ivew_id,So add it. 
		SELECT ids.user_view_id  
		INTO :ll_next_id  
		FROM ids  ;

		UPDATE ids  
		SET user_view_id = (isnull(user_view_id , 0)  + :ai_increasevalue);

		gnv_appeondb.of_commitqueue( )
		If isnull(ll_next_id) Then ll_next_id = 0
		ll_next_id ++

		IF SQLCA.SQLCODE <> 0 THEN
			  RETURN -1
		END IF						
	
	Case upper('ctx_template_id') //ctx_template_id less than 0. save in ctx_basic_info table.
		gnv_appeondb.of_startqueue( )

		SELECT ids.ctx_template_id  
		INTO :ll_next_id  
		FROM ids  ;

		UPDATE ids  
		SET ctx_template_id = (isnull(ctx_template_id , 0)  - :ai_increasevalue);

		gnv_appeondb.of_commitqueue( )
		If isnull(ll_next_id) Then ll_next_id = -1001
		ll_next_id --

		IF SQLCA.SQLCODE <> 0 THEN
			  RETURN -1
		END IF				
		//---------------------------- APPEON END ----------------------------
	case upper('multi_ID')  //Custom Multi ID - jervis 06.02.2011
		gnv_appeondb.of_startqueue( )
		commit; //It sometimes can't get user_ivew_id,So add it. 
		SELECT ids.custom_id1  
		INTO :ll_next_id  
		FROM ids  ;

		UPDATE ids  
		SET custom_id1 = (isnull(custom_id1 , 0)  + :ai_increasevalue);

		gnv_appeondb.of_commitqueue( )
		If isnull(ll_next_id) Then ll_next_id = 0
		ll_next_id ++

		IF SQLCA.SQLCODE <> 0 THEN
			  RETURN -1
		END IF								
	case upper('approve_id')  //Added By Ken.Guo 12/05/2011. 
		gnv_appeondb.of_startqueue( )
		commit; //It sometimes can't get user_ivew_id,So add it. 
		SELECT ids.approve_id  
		INTO :ll_next_id  
		FROM ids  ;

		UPDATE ids  
		SET approve_id = (isnull(approve_id , 0)  + :ai_increasevalue);

		gnv_appeondb.of_commitqueue( )
		If isnull(ll_next_id) Then ll_next_id = 0
		ll_next_id ++

		IF SQLCA.SQLCODE <> 0 THEN
			  RETURN -1
		END IF
		
	case upper('picture_id') //Added By Ken.Guo 02/05/2013
		gnv_appeondb.of_startqueue( )
		commit; 
		SELECT ids.picture_id  
		INTO :ll_next_id  
		FROM ids  ;

		UPDATE ids  
		SET picture_id = (isnull(picture_id , 0)  + :ai_increasevalue);

		gnv_appeondb.of_commitqueue( )
		If isnull(ll_next_id) Then ll_next_id = 0
		ll_next_id ++

		IF SQLCA.SQLCODE <> 0 THEN
			  RETURN -1
		END IF		
		
	case upper('request_form_detail_id') 			//Added By Mark Lee 09/10/2013
		gnv_appeondb.of_startqueue( )
		commit; 
		SELECT ids.request_form_detail_id  
		INTO :ll_next_id  
		FROM ids  ;

		UPDATE ids  
		SET request_form_detail_id = (isnull(request_form_detail_id , 0)  + :ai_increasevalue);

		gnv_appeondb.of_commitqueue( )
		If isnull(ll_next_id) Then ll_next_id = 0
		ll_next_id ++

		IF SQLCA.SQLCODE <> 0 THEN
			  RETURN -1
		END IF	
	case upper('request_form_document_id') 			//Added By Mark Lee 09/24/2013
		gnv_appeondb.of_startqueue( )
		commit; 
		SELECT ids.request_form_document_id  
		INTO :ll_next_id  
		FROM ids  ;

		UPDATE ids  
		SET request_form_document_id = (isnull(request_form_document_id , 0)  + :ai_increasevalue);

		gnv_appeondb.of_commitqueue( )
		If isnull(ll_next_id) Then ll_next_id = 0
		ll_next_id ++

		IF SQLCA.SQLCODE <> 0 THEN
			  RETURN -1
		END IF	
	case upper('request_form_role_id') 			//Added By Mark Lee 11/01/2013
		gnv_appeondb.of_startqueue( )
		commit; 
		SELECT ids.request_form_role_id  
		INTO :ll_next_id  
		FROM ids  ;

		UPDATE ids  
		SET request_form_role_id = (isnull(request_form_role_id , 0)  + :ai_increasevalue);

		gnv_appeondb.of_commitqueue( )
		If isnull(ll_next_id) Then ll_next_id = 0
		ll_next_id ++

		IF SQLCA.SQLCODE <> 0 THEN
			  RETURN -1
		END IF		
	case upper('request_form_id') 			//Added By Mark Lee 12/10/2013
		gnv_appeondb.of_startqueue( )
		commit; 
		SELECT ids.request_form_id  
		INTO :ll_next_id  
		FROM ids  ;

		UPDATE ids  
		SET request_form_id = (isnull(request_form_id , 0)  + :ai_increasevalue);

		gnv_appeondb.of_commitqueue( )
		If isnull(ll_next_id) Then ll_next_id = 0
		ll_next_id ++

		IF SQLCA.SQLCODE <> 0 THEN
			  RETURN -1
		END IF			
END CHOOSE

RETURN ll_next_id
//--------------------------- APPEON END ---------------------------

end function

public function integer of_setcontraccache_code_lookup (string as_lookup_name);//--------------------------- APPEON BEGIN ---------------------------
//$<add> 09.29.2006 By: LeiWei
//$<reason> To register code lookup.
RETURN of_setcontraccache_code_lookup( as_lookup_name, TRUE )
//---------------------------- APPEON END ----------------------------

end function

public function integer of_setcontraccache_code_lookup (string as_lookup_name, boolean ab_refresh);//--------------------------- APPEON BEGIN ---------------------------
//$<add> 09.29.2006 By: LeiWei
//$<reason> To register code lookup.

Datastore lds_tmp
STRING ls_lookup_name
STRING ls_condition
n_ds lnds_user 
Long ll_lookup_code
setpointer(hourglass!)

// <RP> 1.9.2017 ----------------
// Retrieve ids_code_lookup if empty
gnv_data.of_retrieveIfNecessary("code_lookup", FALSE)
// <RP>

lds_tmp = gnv_data.ids_code_lookup

ls_lookup_name = Lower(as_lookup_name)
IF Isnull(ls_lookup_name) OR LEN(ls_lookup_name) = 0 THEN RETURN 0

//Added By Ken.Guo 12/31/2011. reminber the lookup_name list
If Not inv_string.of_isexists(is_lookupnamelist[],ls_lookup_name)  Then
	is_lookupnamelist[Upperbound(is_lookupnamelist) + 1] = ls_lookup_name
End If


ls_condition = "lower(lookup_name) = '" + ls_lookup_name + "'"
lds_tmp.setfilter(ls_condition)
lds_tmp.filter()

// Copy data from global cache
IF ab_refresh THEN
	// <RP> 1.9.2017 Need to use other variation of of_getRegistered, so that cache is not refreshed
	IF gnv_app.inv_dwcache.of_GetRegistered (ls_lookup_name, lnds_user, FALSE) = 1 THEN
//	IF gnv_app.inv_dwcache.of_GetRegistered (ls_lookup_name, lnds_user) = 1 THEN
	// <RP>
		lnds_user.Reset( )
		lds_tmp.rowscopy(1,lds_tmp.rowcount(),Primary! , lnds_user , 1,Primary!)
	ELSE
		gnv_app.inv_dwcache.of_unRegister(ls_lookup_name)
		gnv_app.inv_dwcache.of_Register(ls_lookup_name, lds_tmp, TRUE )
	END IF
ELSE
	gnv_app.inv_dwcache.of_unRegister(ls_lookup_name)
	gnv_app.inv_dwcache.of_Register(ls_lookup_name, lds_tmp, TRUE )
END IF

// Add other value
// <RP> 1.9.2017 Need to use other variation of of_getRegistered, so that cache is not refreshed
IF gnv_app.inv_dwcache.of_GetRegistered (ls_lookup_name, lnds_user, FALSE) = 1 THEN
//IF gnv_app.inv_dwcache.of_GetRegistered (ls_lookup_name, lnds_user) = 1 THEN
// <RP?
	IF ls_lookup_name <> 'title' THEN
		lnds_user.InsertRow(1)
		lnds_user.setitem(1,"lookup_code",-777)
		lnds_user.setitem(1,"code",'*Add lookup Code*')
		lnds_user.setitem(1,"description",'*Add lookup Code*') //2008.8.15 By Jervis
		lnds_user.setitem(1,"custom_1",'*Add lookup Code*')
		lnds_user.setItem(1,"large_description_1",'*Add lookup Code*')
		lnds_user.setItem(1,"large_description_2",'*Add lookup Code*')
	END IF
	
	CHOOSE CASE ls_lookup_name
		CASE 'contract organization type'
			ll_lookup_code = -1
		CASE 'contract action type'
			ll_lookup_code = -999
		CASE 'contract carve out code type','contract local code','contract schedule type'
			ll_lookup_code = 10000
		CASE ELSE
			SetNull(ll_lookup_code)
	END CHOOSE
	
	IF Isnull(ll_lookup_code) OR ll_lookup_code <> 10000 THEN
		lnds_user.InsertRow(1)
		lnds_user.setitem(1,"lookup_code",ll_lookup_code)
		//--------------------------- APPEON BEGIN ---------------------------
		//$<Modify> 2007-08-30 By: Scofield
		//$<Reason> Change '(NONE)' to ''
		
		lnds_user.setitem(1,"lookup_name","")
		lnds_user.setitem(1,"code","")
		lnds_user.setitem(1,"custom_1","")
		lnds_user.setitem(1,"description","") //Modified By Ken.Guo 2015-05-26. Task #119
		//---------------------------- APPEON END ----------------------------
	END IF
END IF

IF ab_refresh THEN
	lds_tmp.setfilter("")
	lds_tmp.filter()
END IF

return success

//---------------------------- APPEON END ----------------------------

end function

public function integer of_setcontraccache_code_lookup (boolean ab_refresh_all);//--------------------------- APPEON BEGIN ---------------------------
//$<add> 09.06.2006 By: LeiWei
//$<reason> Performance tuning
String ls_drop_downs[] , ls_drop_specify[]
Integer ll_i
long ll_find
string ls_retrieved , ls_modify , ls_lookup_name , ls_condition
datetime ldt_modify
datastore lds_tmp
setpointer(hourglass!)
ls_drop_downs[upperbound(ls_drop_downs) + 1 ] = 'Contract Department'				//'dddw_contact_department' 			//4
ls_drop_downs[upperbound(ls_drop_downs) + 1 ] = 'title'									//'dddw_contact_title' 				//6
ls_drop_downs[upperbound(ls_drop_downs) + 1 ] = 'Contract Contact Type'				//'dddw_contact_type' 					//7
ls_drop_downs[upperbound(ls_drop_downs) + 1 ] = 'Contract Contact VIA'				//'dddw_contact_via' 					//8
ls_drop_downs[upperbound(ls_drop_downs) + 1 ] = 'Contract Action Status'			//'dddw_contract_action_status' 	//9
ls_drop_downs[upperbound(ls_drop_downs) + 1 ] = 'Contract Action Type'				//'dddw_contract_action_type' 		//10
ls_drop_downs[upperbound(ls_drop_downs) + 1 ] = 'Contract Carve Out Code Type'	//'dddw_contract_carve_out_code' 	//11
ls_drop_downs[upperbound(ls_drop_downs) + 1 ] = 'Contract Category'					//'dddw_contract_category' 			//12
ls_drop_downs[upperbound(ls_drop_downs) + 1 ] = 'Contract Division'					//'dddw_contract_division' 			//14
ls_drop_downs[upperbound(ls_drop_downs) + 1 ] = 'Contract Local Code'				//'dddw_contract_local_code' 		//17
ls_drop_downs[upperbound(ls_drop_downs) + 1 ] = 'Contract Organization Type'		//'dddw_contract_organization_type'//18
ls_drop_downs[upperbound(ls_drop_downs) + 1 ] = 'Contract Product Name'				//'dddw_contract_product_name'     //19
ls_drop_downs[upperbound(ls_drop_downs) + 1 ] = 'Contract Schedule Type'			//'dddw_contract_schedule_type'    //20
ls_drop_downs[upperbound(ls_drop_downs) + 1 ] = 'Contract Term Reason'				//'dddw_contract_term_reason'      //21
ls_drop_downs[upperbound(ls_drop_downs) + 1 ] = 'Contract Type'						//'dddw_contract_type'             //22
ls_drop_downs[upperbound(ls_drop_downs) + 1 ] = 'Practitioner Specialties' 		//'dddw_practitioner_specialties'  //28
ls_drop_downs[upperbound(ls_drop_downs) + 1 ] = 'State'									//'dddw_states'                    //29
ls_drop_downs[upperbound(ls_drop_downs) + 1 ] = 'Contract Status'						//'d_dddw_contract_contract_status' //30
ls_drop_downs[upperbound(ls_drop_downs) + 1 ] = 'Contract Product Type'				//'d_dddw_contract_product_type'   //31
ls_drop_downs[upperbound(ls_drop_downs) + 1 ] = 'Contract Practitioner Contract Stat'//'dddw_contract_practitioner_contract_stat'//37
ls_drop_downs[upperbound(ls_drop_downs) + 1 ] = 'Contract Fee Schd Cat. (NM)'		//'dddw_contract_fee_schd_cat_nm' // 39
ls_drop_downs[upperbound(ls_drop_downs) + 1 ] = 'Contract Fee Sched Stat. (NM)'	//'dddw_contract_fee_sched_stat_nm' // 40
ls_drop_downs[upperbound(ls_drop_downs) + 1 ] = 'Contract Service (NM)'				//'dddw_contract_service_nm' // 41
ls_drop_downs[upperbound(ls_drop_downs) + 1 ] = 'Contract Supp. Doc.Type'			//'dddw_contract_supp_doc_type' // 42
ls_drop_downs[upperbound(ls_drop_downs) + 1 ] = 'Contract Billing Cycle'			//'dddw_contract_billing_cycle' // 43

// <RP> 1.9.2017 --------------- Add condition - the retrieve is not necessary if ab_refresh_all
IF NOT ab_refresh_all THEN
	//Start code change 11.30.2006 Henry. Refresh the cache data which has been modifyed in code lookup.
	// <RP> 1.9.2017 ----------------
	// Retrieve ids_code_lookup if empty
	gnv_data.of_retrieveIfNecessary("code_lookup", FALSE)
	// <RP>
	lds_tmp = gnv_data.ids_code_lookup
	ids_lookup_date.settransobject( SQLCA )
	ids_lookup_date.retrieve(ls_drop_downs)
END IF
// <RP>

FOR ll_i = 1 TO UpperBound(ls_drop_downs)
	If ab_refresh_all Then
		of_setcontraccache_code_lookup( ls_drop_downs[ll_i], FALSE )
	Else
		ls_lookup_name = ls_drop_downs[ll_i]
		
		ls_retrieved = gnv_data.of_getitem("code_lookup_2","modify_date","upper(lookup_name)='" + upper(ls_lookup_name) + "'")
		ll_find = ids_lookup_date.find("upper(lookup_name)='" + upper(ls_lookup_name) + "'" , 1, ids_lookup_date.rowcount())
		If ll_find > 0 Then
			ls_modify = string(ids_lookup_date.getitemdatetime(ll_find , 'modify_date'))
		End If
		If isnull(ls_modify) then ls_modify = ""
		If isnull(ls_retrieved) then ls_retrieved = ""
		
		If ls_retrieved <> ls_modify Then
			ls_drop_specify[upperbound(ls_drop_specify) + 1] = ls_drop_downs[ll_i]
						
			ids_lookup_modify.settransobject( SQLCA )
			ids_lookup_modify.retrieve( ls_lookup_name )
			ls_condition = "lower(lookup_name) <> '" + lower(ls_lookup_name) + "'"
			lds_tmp.setfilter(ls_condition)
			lds_tmp.filter()
			lds_tmp.rowsdiscard( 1, lds_tmp.filteredcount(), filter!)
			ids_lookup_modify.Rowscopy(1,ids_lookup_modify.rowcount(),primary!,lds_tmp,1,primary!)
			of_setcontraccache_code_lookup( ls_drop_downs[ll_i], TRUE )
		End If
		//
	End if
NEXT
If upperbound(ls_drop_specify) > 0 Then gnv_data.of_retrieve('code_lookup_2')
//End code change 11.30.2006

gnv_data.ids_code_lookup.setfilter("")
gnv_data.ids_code_lookup.filter()

return success

//---------------------------- APPEON END ----------------------------

end function

public function integer of_setcontraccache_register ();/******************************************************************************************************************
**  [PUBLIC]   : of_setcontraccache_register( )
**==================================================================================================================
**  Purpose   	: registers drop down data windows for caching
**==================================================================================================================
**  Arguments 	: [none] 
**==================================================================================================================
**  Returns   	: [none]   
**==================================================================================================================
**  Notes     	: 	   
**==================================================================================================================
**  Created By	: Michael B. Skinner 01 event December 2005  © Intellisoftgroup, Inc
**==================================================================================================================
**  Modification Log
**   Changed By             Change Date                                               Reason
** ------------------------------------------------------------------------------------------------------------------
********************************************************************************************************************/

//if of_get_app_setting("set_cont","I") = 0 then return success		
//--------------------------- APPEON BEGIN ---------------------------
//$<comment> 01.05.2007 By: Davis
string ls_drop_downs[]
//---------------------------- APPEON END ----------------------------

is_drop_downs=ls_drop_downs//added by nova 2008-05-12 initial instance variable
long ll_i
integer i
setpointer(hourglass!)
//Start Code Change ---- 01.25.2006 #219 maha
//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 03.15.2006 By: Cao YongWang
//$<reason> Performance tuning. Write scripts to retrieve data from a cache instead of a SQL statement.
/*
select set_cont into :i from icred_settings;
*/
i = integer(gnv_data.of_getitem("icred_settings" , "set_cont" , False))
//---------------------------- APPEON END ----------------------------
if i = 0 then return success	
//End Code Change---01.25.2005 

choose case gs_dbtype
	case 'ASA'
		
			select COUNT(*) 
			INTO :LL_i
			From systable 
			where table_name='CTX_BASIC_INFO' and 
			table_type='BASE' ;
	
	case 'SQL'
		
		n_ds lds_find_systable
		lds_find_systable = create N_DS
		lds_find_systable.dataobject = 'd_find_systable'
		lds_find_systable.of_settransobject( sqlca)
		LL_i = lds_find_systable.retrieve('CTX_BASIC_INFO')
		

end choose 

if LL_i < 1 then return success

//--------------------------- APPEON BEGIN ---------------------------
//$<comment> 01.05.2007 By: Davis
//$<reason> No necessary to get data from local file.
/*
n_cst_filesrvwin32 inv_filesrv
inv_filesrv = create n_cst_filesrvwin32

string ls_cach_path
ls_cach_path = gnv_app.is_application_path + '\cachedata'

IF NOT inv_filesrv.of_DirectoryExists (ls_cach_path) THEN
       inv_filesrv.of_CreateDirectory (ls_cach_path)
END IF

ls_drop_downs[upperbound(ls_drop_downs) + 1 ] = 'dddw_action_type'  					//1 
ls_drop_downs[upperbound(ls_drop_downs) + 1 ] = 'dddw_cntx_profiles' 				//2
ls_drop_downs[upperbound(ls_drop_downs) + 1 ] = 'dddw_contact_company' 				//3
ls_drop_downs[upperbound(ls_drop_downs) + 1 ] = 'dddw_contact_department' 			//4
ls_drop_downs[upperbound(ls_drop_downs) + 1 ] = 'dddw_contact_facility' 			//5
ls_drop_downs[upperbound(ls_drop_downs) + 1 ] = 'dddw_contact_title' 				//6
ls_drop_downs[upperbound(ls_drop_downs) + 1 ] = 'dddw_contact_type' 					//7
ls_drop_downs[upperbound(ls_drop_downs) + 1 ] = 'dddw_contact_via' 					//8
ls_drop_downs[upperbound(ls_drop_downs) + 1 ] = 'dddw_contract_action_status' 	//9
ls_drop_downs[upperbound(ls_drop_downs) + 1 ] = 'dddw_contract_action_type' 		//10
ls_drop_downs[upperbound(ls_drop_downs) + 1 ] = 'dddw_contract_carve_out_code' 	//11
ls_drop_downs[upperbound(ls_drop_downs) + 1 ] = 'dddw_contract_category' 			//12
ls_drop_downs[upperbound(ls_drop_downs) + 1 ] = 'dddw_contract_contact_type' 		//13
ls_drop_downs[upperbound(ls_drop_downs) + 1 ] = 'dddw_contract_division' 			//14
ls_drop_downs[upperbound(ls_drop_downs) + 1 ] = 'dddw_contract_fee_basis' 			//15
ls_drop_downs[upperbound(ls_drop_downs) + 1 ] = 'dddw_contract_group_id' 			//16
ls_drop_downs[upperbound(ls_drop_downs) + 1 ] = 'dddw_contract_local_code' 		//17
ls_drop_downs[upperbound(ls_drop_downs) + 1 ] = 'dddw_contract_organization_type'//18
ls_drop_downs[upperbound(ls_drop_downs) + 1 ] = 'dddw_contract_product_name'     //19
ls_drop_downs[upperbound(ls_drop_downs) + 1 ] = 'dddw_contract_schedule_type'    //20
ls_drop_downs[upperbound(ls_drop_downs) + 1 ] = 'dddw_contract_term_reason'      //21
ls_drop_downs[upperbound(ls_drop_downs) + 1 ] = 'dddw_contract_type'             //22
ls_drop_downs[upperbound(ls_drop_downs) + 1 ] = 'dddw_contracted_entity'         //23
ls_drop_downs[upperbound(ls_drop_downs) + 1 ] = 'dddw_ctx_product_names'         //24
ls_drop_downs[upperbound(ls_drop_downs) + 1 ] = 'dddw_ext_data_type'             //25
ls_drop_downs[upperbound(ls_drop_downs) + 1 ] = 'dddw_lookup_select'             //26
ls_drop_downs[upperbound(ls_drop_downs) + 1 ] = 'dddw_notification_users'        //27
ls_drop_downs[upperbound(ls_drop_downs) + 1 ] = 'dddw_practitioner_specialties'  //28
ls_drop_downs[upperbound(ls_drop_downs) + 1 ] = 'dddw_states'                    //29
ls_drop_downs[upperbound(ls_drop_downs) + 1 ] = 'd_dddw_contract_contract_status' //30
ls_drop_downs[upperbound(ls_drop_downs) + 1 ] = 'd_dddw_contract_product_type'   //31
ls_drop_downs[upperbound(ls_drop_downs) + 1 ] = 'd_dddw_users'                   //32
ls_drop_downs[upperbound(ls_drop_downs) + 1 ] = 'd_dddw_ctx_ids'                 //33
ls_drop_downs[upperbound(ls_drop_downs) + 1 ] = 'd_ctx_sys_audit'                //34
ls_drop_downs[upperbound(ls_drop_downs) + 1 ] = 'd_ctx_sys_fields'               //35
ls_drop_downs[upperbound(ls_drop_downs) + 1 ] = 'dddw_contract_code_tempate'     //36
// mskinner 28 March 2006 -- begin
ls_drop_downs[upperbound(ls_drop_downs) + 1 ] = 'dddw_contract_practitioner_contract_stat'//37
ls_drop_downs[upperbound(ls_drop_downs) + 1 ] = 'dddw_security_users' //38
ls_drop_downs[upperbound(ls_drop_downs) + 1 ] = 'dddw_contract_fee_schd_cat_nm' // 39
ls_drop_downs[upperbound(ls_drop_downs) + 1 ] = 'dddw_contract_fee_sched_stat_nm' // 40
ls_drop_downs[upperbound(ls_drop_downs) + 1 ] = 'dddw_contract_service_nm' // 41
ls_drop_downs[upperbound(ls_drop_downs) + 1 ] = 'dddw_contract_supp_doc_type' // 42
// mskinner 28 March 2006 -- end
ls_drop_downs[upperbound(ls_drop_downs) + 1 ] = 'dddw_contract_billing_cycle' // 42

for ll_i = 1 to upperbound(ls_drop_downs)
	if fileexists(ls_cach_path + "\" + ls_drop_downs[ll_i] + '.txt') and not ib_ref_cache then
	 string(gnv_app.inv_dwcache.of_Register(ls_drop_downs[ll_i], ls_drop_downs[ll_i], ls_cach_path + "\" + ls_drop_downs[ll_i]+ '.txt'))
	else 
	 gnv_app.inv_dwcache.of_unRegister(ls_drop_downs[ll_i])
	gnv_app.inv_dwcache.of_Register(ls_drop_downs[ll_i], ls_drop_downs[ll_i], SQLCA, true)
	// messagebox(ls_drop_downs[ll_i],'ret')
   end if
next

gnv_app.inv_dwcache.of_refresh( )

n_ds dslist[ ]
gnv_app.inv_dwcache.of_GetRegistered (dslist)
long ll_ret
for ll_i = 1 to upperbound(dslist)
	if not fileexists(ls_cach_path + "\" + ls_drop_downs[ll_i] +'.txt' ) or ib_ref_cache then
	   ll_ret = dslist[ll_i].SaveAs (ls_cach_path + "\"+ string(dslist[ll_i].dataobject) + ".txt" , text!,false)
   end if 
next

ib_ref_cache = false 

*/

is_drop_downs[upperbound(is_drop_downs) + 1 ] = 'dddw_action_type'  					//1 
is_drop_downs[upperbound(is_drop_downs) + 1 ] = 'dddw_cntx_profiles' 				//2
is_drop_downs[upperbound(is_drop_downs) + 1 ] = 'dddw_contact_company' 				//3
is_drop_downs[upperbound(is_drop_downs) + 1 ] = 'dddw_contact_facility' 			//5
is_drop_downs[upperbound(is_drop_downs) + 1 ] = 'dddw_contract_contact_type' 		//13
is_drop_downs[upperbound(is_drop_downs) + 1 ] = 'dddw_contract_fee_basis' 			//15
is_drop_downs[upperbound(is_drop_downs) + 1 ] = 'dddw_contract_group_id' 			//16
is_drop_downs[upperbound(is_drop_downs) + 1 ] = 'dddw_contracted_entity'         //23
is_drop_downs[upperbound(is_drop_downs) + 1 ] = 'dddw_ctx_product_names'         //24
is_drop_downs[upperbound(is_drop_downs) + 1 ] = 'dddw_ext_data_type'             //25
is_drop_downs[upperbound(is_drop_downs) + 1 ] = 'dddw_lookup_select'             //26
is_drop_downs[upperbound(is_drop_downs) + 1 ] = 'dddw_notification_users'        //27
is_drop_downs[upperbound(is_drop_downs) + 1 ] = 'd_dddw_users'                   //32
is_drop_downs[upperbound(is_drop_downs) + 1 ] = 'd_dddw_ctx_ids'                 //33
is_drop_downs[upperbound(is_drop_downs) + 1 ] = 'd_ctx_sys_audit'                //34
is_drop_downs[upperbound(is_drop_downs) + 1 ] = 'd_ctx_sys_fields'               //35
is_drop_downs[upperbound(is_drop_downs) + 1 ] = 'dddw_contract_code_tempate'     //36
is_drop_downs[upperbound(is_drop_downs) + 1 ] = 'dddw_security_users' //38
//<add> 12.12.2007 by: Andy
is_drop_downs[upperbound(is_drop_downs) + 1 ] = 'dddw_contact_company_search' 				//39
//end of add

//$<reason> It is not necessary to get data from a local file.
//$<reason> Get data from database each time cache is refreshed so as to make sure data is the latest.
//$<reason> The ib_ref_cache makes no sense.

FOR ll_i = 1 TO upperbound(is_drop_downs)
	gnv_app.inv_dwcache.of_Register(is_drop_downs[ll_i], is_drop_downs[ll_i], SQLCA, False)
NEXT

//----------------------<RP> 1.9.2017------------------------------------------------------------------
// Comment out bulk refresh of cache; don't do that unless user specifically invokes
//// Refresh cache
//THIS.of_setcontraccache()
//----------------------<RP> 3.9.2017------------------------------------------------------------------

//---------------------------- APPEON END ----------------------------

return success

end function

public function string of_getversionlabel ();//////////////////////////////////////////////////////////////////////
// $<Function>  of_getversionlabel()
// $<arguments> (None)
// $<returns>   string
// $<description> Get windows or web version label.
//////////////////////////////////////////////////////////////////////
// $<add> 11/11/2008 by Evan
//////////////////////////////////////////////////////////////////////

Return "Product " + VERSION
end function

public subroutine of_modify_menu_attr (menu am_menu, string as_attribute, any aa_value);Boolean				lb_value
String					ls_value, ls_Class, ls_ParenName
Long					ll_value
Menu					lm_Temp



ls_Class = Lower(classname( aa_value ))
Choose Case ls_Class
	Case 'boolean'
		lb_Value =  aa_value 
	Case 'string'
		ls_Value =  aa_value
	case 'integer', 'long', 'number'
		ll_value = aa_value
End Choose


Choose Case lower( as_attribute )
	Case 'enabled'
		am_Menu.enabled = lb_value
	case 'toolbaritemtext'
		am_Menu.toolbaritemtext = ls_value
	case 'toolbaritemvisible'
		am_Menu.toolbaritemvisible = lb_value
	case 'toolbaritemdown'
		am_Menu.toolbaritemdown = lb_value
	case 'toolbaritemname'
		am_Menu.toolbaritemname = ls_value		
	case 'checked'
		am_Menu.checked = lb_value
	case 'visible'
		am_Menu.visible = lb_value
	case 'tag'
		am_Menu.tag = ls_value	
	case 'microhelp	'	
		am_Menu.microhelp = ls_value	
	case 'toolbaritemorder'
		am_Menu.ToolbarItemOrder = ll_value	
	case 'toolbaritembarindex'
		am_Menu.ToolbarItemBarIndex = ll_value	
	case 'toolbaritemspace'
		am_Menu.ToolbarItemSpace = ll_value		
	case else
		MessageBox( 'Tips', 'please coding for ' + as_attribute + "." )
		Return
End Choose

If ib_EZMenu_Refresh Then Return

If IsValid( w_mdi ) Then
	ls_Class = am_menu.ClassName( )
	ls_ParenName = ls_Class 
	lm_Temp = am_menu.GetParent( )
	Do While IsValid( lm_Temp )
		ls_ParenName = lm_Temp.ClassName( )	
		lm_Temp = lm_Temp.GetParent( )
	Loop
		
	If ls_ParenName = w_mdi.MenuID.ClassName( ) Then
		Choose Case lower( as_attribute )
			case 'enabled' 
				w_mdi.of_Set_EZMenu_Enabled( '', ls_Class, lb_value )
			Case 'checked', 'toolbaritemdown'
				w_mdi.of_Set_EZMenu_Check( '', ls_Class, lb_value )
			Case 'toolbaritemvisible'
				w_mdi.of_Set_EZMenu_visible( '', ls_Class, lb_value )
			case 'toolbaritemtext'
				w_mdi.of_Set_EZMenu_Text( '', ls_Class, ls_value )
			Case 'toolbaritemname'
				w_mdi.of_set_ezmenu_pic( '', ls_Class, ls_Value )
			Case 'toolbaritemorder',  'toolbaritembarindex'
//				w_mdi.Event ue_refreshezmenu( )   by yourself
			case else
				Return
		End Choose		
	End If	
End If


end subroutine

public subroutine of_refresh_ezmenu ();//

ii_PostNumber ++
If gb_show_EZMenu And IsValid( w_MDI ) And ii_nownumber = ii_PostNumber Then
	w_MDI.Post Event ue_RefreshEZMenu( )	
	Post of_Set_EZMenu_Refresh_State( FALSE )
	ii_PostNumber =0
	ii_nownumber = 0
End If
end subroutine

public subroutine of_set_ezmenu_refresh_state (boolean ab_state);If ab_state Then ii_nownumber++
ib_EZMenu_Refresh = ab_state
//SetPointer( arrow! )
end subroutine

public subroutine of_refresh_sign (boolean abln_swith);//====================================================================
// Function: of_refresh_sign
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value    boolean    abln_swith
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:	Mark Lee		Date: 04/03/2015
//--------------------------------------------------------------------
//	Copyright (c) 2008-2013 Contractlogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

if isnull(abln_swith ) then return 

if abln_swith =  true then 
	gb_message = true
	if not isvalid(gnv_debug) then gnv_debug = Create n_cst_debug 
	gnv_debug.of_setmessage( true)
	gnv_debug.of_clearlog( )
end if 

gnv_sertifi.of_refresh_sertifi_status()
gnv_echosign.of_refresh_sertifi_status()
gnv_docusign.ib_ping_server = false 
gnv_docusign.of_refresh_sertifi_status()
gnv_docusign.ib_ping_server = true 

if abln_swith =  true then 
	if gnv_debug.ids_debuglog.rowcount( ) > 0 then 
		gnv_debug.of_setalwaysontop( false)
		gnv_debug.of_openlog( true)				
		gnv_debug.of_title(true,"Message Log")
		gnv_debug.of_output_debug_log()
	end if 
	
	gnv_debug.of_setmessage( false)
	gb_message = false
end if 
end subroutine

public subroutine of_window_basic_code (window aw_target);//====================================================================
// Function: of_basic_code
//--------------------------------------------------------------------
// Description:  Many windows do not inhert pfc_w_master,  so they do not run the pfc code,.
// Add this function to all these windows' open event now. 
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:         Ken.Guo 2016-03-17
//--------------------------------------------------------------------
//Copyright (c) 2008-2015 Contract Logix, Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History:
// 
//====================================================================

//Added By Ken.Guo 2016-03-17.  Change bk color.
gnv_win_backcolor.of_ChangeWindowBackColor(aw_target)  

//add other function here if you want.




end subroutine

public function integer of_benchmarklabel (string as_label);//	of_benchmarkLabel
//	1.5.2017		Initial version by <RP>
//					Mark time with a label
//
//	Args:
//		as_label - if empty, then clear description and start timer over
//
time lt_now
string ls_time
long ll_msec_last, ll_msec_now, ll_msec_elapsed, ll_msec_first, ll_total_msec_elapsed
decimal ldec_seconds_elapsed, ldec_total_seconds_elapsed

lt_now = now()

IF NOT ib_benchMark THEN
	/* Not in benchmark mode */
	return 0
ELSEIF as_label = "" THEN
	is_benchmark_descr = ""
	return 0
ELSEIF is_benchmark_descr = ""THEN
	/* This is the first label we are marking. */
	it_firstMark = lt_now
	is_benchmark_descr = as_label + ": start"
ELSE
	/* Convert times to milliseconds */
	/* Last marked time */
	ls_time = string(it_lastMark, "hhmmssfff")
	/* hours */
	ll_msec_last = long(mid(ls_time, 1, 2)) * 60 * 60 * 1000
	/* minutes */
	ll_msec_last += long(mid(ls_time, 3, 2)) * 60 * 1000
	/* seconds */
	ll_msec_last += long(mid(ls_time, 5, 2)) * 1000
	/* milliseconds */
	ll_msec_last += long(mid(ls_time, 7, 3))

	/* First marked time */
	ls_time = string(it_firstMark, "hhmmssfff")
	/* hours */
	ll_msec_first = long(mid(ls_time, 1, 2)) * 60 * 60 * 1000
	/* minutes */
	ll_msec_first += long(mid(ls_time, 3, 2)) * 60 * 1000
	/* seconds */
	ll_msec_first += long(mid(ls_time, 5, 2)) * 1000
	/* milliseconds */
	ll_msec_first += long(mid(ls_time, 7, 3))

	/* Current time */
	ls_time = string(lt_now, "hhmmssfff")
	/* hours */
	ll_msec_now = long(mid(ls_time, 1, 2)) * 60 * 60 * 1000
	/* minutes */
	ll_msec_now += long(mid(ls_time, 3, 2)) * 60 * 1000
	/* seconds */
	ll_msec_now += long(mid(ls_time, 5, 2)) * 1000
	/* milliseconds */
	ll_msec_now += long(mid(ls_time, 7, 3))

	/* Determine time elapsed since last mark in milliseconds */
	ll_msec_elapsed = ll_msec_now - ll_msec_last
	ldec_seconds_elapsed = ll_msec_elapsed/1000

	/* Determine time elapsed since first mark in milliseconds */
	ll_total_msec_elapsed = ll_msec_now - ll_msec_first
	ldec_total_seconds_elapsed = ll_total_msec_elapsed/1000

	is_benchmark_descr += char(13) + char(10) + as_label + ": " + string(ldec_seconds_elapsed) + " seconds" + "; ~t Total elapsed: " + string(ldec_total_seconds_elapsed) + " seconds"
END IF

it_lastMark = lt_now

return 1

end function

public function integer of_benchmarkdisplay ();//	of_benchmarkDisplay
//	1.5.2017		Initial version by <RP>
//					Display labels and time durations
//
/* Show the benchmark time intervals */
IF NOT ib_benchmark THEN
	return 0
ELSE
//	messageBox("Display Benchmark", is_benchmark_descr)
	f_message_console(is_benchmark_descr)
	return 1
END IF

end function

public function integer of_setcachestatus (string as_cache_name, long al_status);//	Function of_SetCacheStatus
// 
//	Arguments
//		as_cache_name - name of the data cache
//		al_status - status of the cache
//			1 - cache has been refreshed
//			0 - cache needs to be refreshed when it is next accessed
//
//	Returns:
//	1 - success
//	-1 - error
//	Description:
//	Marks the status of as_cache_name as al_status
//
//	1.19.2017		Initial version by <RP>
//	
//
long ll_row
IF NOT isValid(ids_cache_list) THEN
	return -1
END IF

ll_row = ids_cache_list.find("cache_name = '" + as_cache_name + "'", 1, ids_cache_list.rowCount())
IF ll_row = 0 THEN
	ll_row = ids_cache_list.insertRow(0)
	IF ll_row > 0 THEN
		ids_cache_list.object.cache_name[ll_row] = as_cache_name
	END IF
END IF
IF ll_row > 0 THEN
	ids_cache_list.object.refreshed_status[ll_row] = al_status
	return 1
END IF

return -1

end function

public function long of_getcachestatus (string as_cache_name);//	Function of_GetCacheStatus
// 
//	Arguments
//		as_cache_name - name of the data cache
//
//	Returns:
//	The refresh status of the named cache
//	1 - cache has been refreshed
//	0 - cache needs to be refreshed
//	Description:
//	Returns the refresh status of the data cache as_cache_name
//
//	1.19.2017		Initial version by <RP>
//	
long ll_row

ll_row = ids_cache_list.find("cache_name = '" + as_cache_name + "'", 1, ids_cache_list.rowCount())
IF isNull(ll_row) THEN
	return -1
END IF

IF ll_row > 0 THEN
	return ids_cache_list.object.refreshed_status[ll_row]
ELSE
	return 0
END IF

end function

on n_cst_appmanager.create
call super::create
end on

on n_cst_appmanager.destroy
call super::destroy
end on

event constructor;call super::constructor; 
gnvlo_msword = CREATE n_cst_msword

////////////////////////////////////////////////////////////////////////////////////
// get the current directory path
////////////////////////////////////////////////////////////////////////////////////

n_cst_filesrvwin32  inv_filesrv
inv_filesrv =  CREATE n_cst_filesrvwin32
is_application_path = inv_filesrv.of_GetCurrentDirectory()
//--------------------------- APPEON BEGIN ---------------------------
//$<add> 03.21.2006 By: Cao YongWang
//$<reason> The current directory is DESKTOP in web application, changed it to gs_DefDirName.
//$<reason> If the is_application_path directory is not exists in the client, Then create it.
If appeongetclienttype() <> 'PB' Then
	is_application_path = gs_dir_path + gs_DefDirName
	If not inv_filesrv.of_directoryexists(is_application_path) Then inv_filesrv.of_createdirectory(is_application_path)
End If
//---------------------------- APPEON END ----------------------------

destroy inv_filesrv

// Name of the application
//iapp_object.DisplayName="IntelliSoft Group"
iapp_object.DisplayName="ContractLogix"

of_SetDwCache(TRUE)

//Start Code change --11.30.2006 Added by henry.
ids_lookup_date = create DataStore
ids_lookup_date.dataobject = 'd_code_lookup_modify_date'

ids_lookup_modify = create DataStore
ids_lookup_modify.dataobject = 'd_dddw_code_lookup'
//End Code change --11.30.2006


long OldTime, NewTime

NewTime = 1 /* 1 second */

OldTime = GarbageCollectSetTimeLimit(NewTime)


//--------------- <RP> 1.19.2017----------------------------------------------------------------
// Used to keep track of individual cache retrieval status
ids_cache_list = CREATE datastore
ids_cache_list.dataobject = "d_ext_cache_list"
//----------------------------------------------------------------------------------------------

////////////////////////////////////////////////////////////////////////////////////
// SET THE IDLE TIME
////////////////////////////////////////////////////////////////////////////////////


// mskinner 16 feb 2005 -- begin
il_itle_time = 3600/2
Idle(il_itle_time)  
// mskinner 16 feb 2005 -- end

end event

event destructor;call super::destructor;


IF ISVALID(gnvlo_msword) THEN 
	DESTROY gnvlo_msword
END IF 

//Start Code change --11.30.2006 Added by henry.
If isvalid(ids_lookup_date) Then destroy ids_lookup_date
If isvalid(ids_lookup_modify) Then destroy ids_lookup_modify
//End Code change --11.30.2006

//--------------- <RP> 1.19.2017----------------------------------------------------------------
IF isValid(ids_cache_list) THEN DESTROY ids_cache_list
//----------------------------------------------------------------------------------------------

end event

event pfc_open;call super::pfc_open;//
//
//
//
//
//// Enable the error service.
//of_setError(TRUE)
//inv_error.of_SetPredefinedSource(SQLCA)
//inv_error.of_SetLogFile("errlog.txt")
////this.inv_error.of_SetNotifySeverity(5)
////this.inv_error.of_SetLogSeverity(4)
//
//string ls_address[]
//ls_mail_notify[1] = 'mskinner@IntelliSoftGroup.com'
////ls_mail_notify[1] = 'maha@IntelliSoftGroup.com'
////ls_mail_notify[2] = 'smurphy@intellisoftgroup.com'
////ls_mail_notify[2] = 'msskinner@intellisoftgroup.com'
//inv_error.of_setnotifywho(ls_mail_notify) 
//
//
//
//
//
//



n_versioninfo inv_versionInfo


inv_versionInfo =  create  n_versioninfo


string ls_EXEName
string ls_PropertyValue

ls_EXEName = ''				//Set EXEName to Empty; Modified by Scofield on 2009-03-16
if Len(ls_EXEName) = 0 then
	setNull(ls_EXEName)
end if

// set the indicator value as to whether this is or is not a PB-generated application
inv_versionInfo.setIsPBApp(true)

// get and display the various version information strings (the string <NULL> displays if the
// version information was not accessible based on the information not being stamped within
// the EXE file or because of a programming error).

//ls_PropertyValue = inv_versionInfo.getDescription(ls_EXEName)
//if IsNull(ls_PropertyValue) THEN ls_PropertyValue = "<NULL>"


//ls_PropertyValue = inv_versionInfo.getCompanyName(ls_EXEName)
//if IsNull(ls_PropertyValue) THEN ls_PropertyValue = "<NULL>"
//
//
//ls_PropertyValue = inv_versionInfo.getCopyright(ls_EXEName)
//if IsNull(ls_PropertyValue) THEN ls_PropertyValue = "<NULL>"
//
//
//ls_PropertyValue = inv_versionInfo.getProductName(ls_EXEName)
//if IsNull(ls_PropertyValue) THEN ls_PropertyValue = "<NULL>"
//
//
ls_PropertyValue = inv_versionInfo.getVersion(ls_EXEName)
if IsNull(ls_PropertyValue) THEN ls_PropertyValue = "<NULL>"




// start code change --- 1.2.2005 MSKINNER
//Start Code Change ---- 11.09.2006 #1 maha exception for the web version
//messagebox("path",gs_current_path)
string ls_inipath
ls_inipath=gs_current_path + '\IntelliCred.ini'

//Begin - Modified By Ken.Guo 12/16/2014. Get version from INI Both C/S and Web. 
 version=ProfileString(ls_inipath, "Setup","DeployVersion", "None")
 /*
If appeongetclienttype() = 'PB' Then
	ls_PropertyValue=ProfileString(ls_inipath, "Setup","DeployVersion", "None")
//	VERSION  = 'Version:'+ ls_PropertyValue  +  Build_date					//Added By Mark Lee 04/07/2013
	VERSION  =  ls_PropertyValue  +  Build_date
else //web
	//VERSION = Build_date
	//==============================APPEON BEGIN==========================
  // $<Added>:   Date: Oct 29,2007       Author:Nova
  //--------------------------------------------------------------------
  // $<reason>   Fix a defect.
	  version=ProfileString(ls_inipath, "Setup","DeployVersion", "None")
	//==============================APPEON END============================  

end if
*/
//End - Modified By Ken.Guo 12/16/2014

// end code change --- 1.2.2005 MSKINNER
//End Code Change---11.09.2006
of_setversion( version)
end event

event pfc_idle;call super::pfc_idle;






// mskinner 16 feb 2005 -- begin
open(w_idle)
// mskinner 16 feb 2005 -- end
end event

