$PBExportHeader$pfc_n_cst_ai_printletters.sru
$PBExportComments$11-08-00
forward
global type pfc_n_cst_ai_printletters from pfc_n_cst_intcred_base
end type
end forward

global type pfc_n_cst_ai_printletters from pfc_n_cst_intcred_base
end type
global pfc_n_cst_ai_printletters pfc_n_cst_ai_printletters

type variables
w_action_items w_ai
n_ds ids_ai_detail
String is_letter_name
string is_doc_ids_exp[]
long il_ver_response






end variables

forward prototypes
public function integer of_set_aiwin (window a_aiwin)
public function integer of_setactionitem (u_dw adw_share)
public function integer of_setactionitemdetaildw (u_dw adw_share)
public function integer of_updateverifdata (u_dw adw_detail)
public function integer of_connecttoweb (string as_web_address)
public function integer of_setdetaildw (u_dw dw)
public function integer of_expiring_credentials ()
public function integer of_resend_letters ()
public function integer of_expiring_appointments ()
public function integer of_reverify_credentials ()
public function integer of_dialphone (string as_phone)
public function integer of_copy_required_data (long ll_appt_stat_id, integer ai_app_audit_facility_id, integer ai_parent_facility_id, long al_prac_id)
public function integer of_recred_no_verifs (integer ai_fac_id)
public function integer of_start_reappointment_processing (u_dw adw_ver_copy, u_dw adw_action_items, integer ai_parent_facility, long al_prac_id, string as_ver_type)
public function integer of_expiring_credentials_from_data ()
public function integer of_run_ai_query (integer ai_from)
public function integer of_printletters (string as_doc_id[], string as_affil_stat, string as_letter_name, string as_letter_type, u_dw adw_detail, string as_doc_name, boolean ab_print_preview, string as_sql, long as_pracids[], integer ai_facility)
public function integer of_expiring_credentials_from_data_old ()
public subroutine of_missing_info_90_days_generate ()
public function integer of_missing_info_90_days_print (string as_doc_id[], u_dw adw_detail)
public function integer of_wv_initiated_workflow ()
public function integer of_run_export (long al_pracs[], long al_export, ref string as_path)
public function integer of_privilege_renewal (long al_prac, long al_facil, integer ai_manual, long al_appt_rec)
public function integer of_find_missing_verifs (long al_prac, long al_v_facil, integer ai_silent, string as_appt_type)
public function integer of_start_reappointment_processing_new (u_dw adw_ver_copy, u_dw adw_action_items, integer ai_parent_facility, long al_prac_id, string as_ver_type, integer ai_silent)
public function integer of_retrieve_recred (datawindow adw_verifs, long al_prac, long al_vfacil)
public function integer of_set_send_info (long al_row, string as_response)
public function string of_set_i_r_filter (string as_type, integer ai_ver_facil)
public function integer of_exp_cred_letter_combined (long al_pracs[], string al_docids[], integer ai_facility, n_ds ads_rows, u_dw ads_docs, string as_from)
public function integer of_printletters_combined (string as_doc_id[], string as_affil_stat, string as_letter_name, string as_letter_type, u_dw adw_detail, string as_doc_name, boolean ab_print_preview, string as_sql, long al_pracids[], integer ai_facility, string as_funct_type, string as_from)
end prototypes

public function integer of_set_aiwin (window a_aiwin);w_ai = a_aiwin

RETURN 0
end function

public function integer of_setactionitem (u_dw adw_share);
ids_ai_detail = CREATE n_ds
ids_ai_detail.DataObject = "d_ver_summary_for_action_items"

adw_share.ShareData( ids_ai_detail )


RETURN 0
end function

public function integer of_setactionitemdetaildw (u_dw adw_share);Integer li_retval

ids_ai_detail = CREATE n_ds
ids_ai_detail.DataObject = "d_ver_summary_for_action_items"

li_retval = adw_share.ShareData( ids_ai_detail )

messagebox("share retval", li_retval)

RETURN 0
end function

public function integer of_updateverifdata (u_dw adw_detail);Integer li_rec_id_cnt
Integer s

ids_ai_detail = CREATE n_ds
ids_ai_detail.DataObject = "d_ver_summary_for_action_items"

adw_detail.ShareData( ids_ai_detail )
	
ids_ai_detail.SetFilter( "Upper(screen_name) = Upper('" + is_letter_name + "')" )
li_rec_id_cnt = ids_ai_detail.Filter( )
	
FOR s = 1 TO li_rec_id_cnt
	ids_ai_detail.SetItem( s, "number_sent", 1 )
	IF IsNull( ids_ai_detail.GetItemDateTime( s, "first_sent" ) ) THEN
		ids_ai_detail.SetItem( s, "first_sent", DateTime(Today(), Now()) )
	END IF
	ids_ai_detail.SetItem( s, "last_sent", DateTime(Today(), Now()) )
END FOR

RETURN 0
end function

public function integer of_connecttoweb (string as_web_address);//String ls_browser_path
//
//ls_browser_path = ProfileString(gs_dir_path + gs_DefDirName + "\intellicred.ini", "Paths","browser", "None")
//
IF len(as_web_address ) < 1 THEN
	MessageBox("Invalid WEB Address", "There is no web address setup for the selected entity." )
	Return -1
END IF
//
//Run( ls_browser_path + " " + as_web_address)

//maha rewrote 010505
inet iinet_base

if gi_citrix = 1 then
	of_open_web(as_web_address)
else
	//--------------------------- APPEON BEGIN ---------------------------
	//$<modify> 06.23.2006 By: Liang QingShi
	//$<reason>  GetContextService is currently unsupported. 
	//$<modification> Replace GetContextService with ShellExecuteA to provide the
	//$<modification> same functionality.
	/*
	GetContextService("Internet", iinet_base)
	iinet_base.HyperlinkToURL(as_web_address)
	*/
	String ls_url,ls_null
	setnull(ls_null)
	ls_url = as_web_address
	ShellExecuteA ( Handle( This ), "open", 'IEXPLORE', ls_url , ls_Null, 4)

	//---------------------------- APPEON END ----------------------------

end if

Return 0
end function

public function integer of_setdetaildw (u_dw dw);ids_ai_detail = CREATE n_ds
ids_ai_detail.DataObject = dw.DataObject

dw.ShareData( ids_ai_detail )


Return 0
end function

public function integer of_expiring_credentials ();
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-01
//$<modify> 02.23.2006 By: owen chen
//$<reason> Performance tuning
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

/*
n_ds lds_exp_cred
n_ds lds_exp_copy
n_ds lds_last_verif_seq_no
Integer li_row_cnt
Integer ll_seq_row_cnt
Integer i
Integer ll_seq_no
Integer li_nr
Integer nullint
Integer li_facility_id
DateTime nulldate
Long ll_ver_method_ltr 
Long ll_prac_id
Long ll_rec_id
String ls_doc_id
string ls_fails = ""
integer cnt = 0

SetNull( nullint )
SetNull( nulldate )
lds_exp_cred = CREATE n_ds
lds_exp_cred.DataObject = "d_exp_credentials"
lds_exp_cred.of_SetTransObject( SQLCA )
li_row_cnt = lds_exp_cred.Retrieve(  ) //maha app102105 removed today() argument from dw

lds_exp_copy = CREATE n_ds
lds_exp_copy.DataObject = "d_exp_credentials"
lds_exp_copy.of_SetTransObject( SQLCA )

lds_last_verif_seq_no = CREATE n_ds
lds_last_verif_seq_no.DataObject = "d_last_verif_seq_no"
lds_last_verif_seq_no.of_SetTransObject( SQLCA )

//MSKINNER 15 MARCH 2005 -- BEGIN
if isvalid(w_aiq_run) then  w_aiq_run.r_status.width = 150
//MSKINNER 15 MARCH 2005 -- END


SELECT code_lookup.lookup_code  
INTO :ll_ver_method_ltr
FROM code_lookup  
WHERE ( code_lookup.lookup_name = 'verification method' ) AND  
      ( code_lookup.code = 'exp cred ltr'  )   ;
IF SQLCA.SQLCODE = -1 THEN
	MessageBox("SQL ERROR", SQLCA.SQLERRTEXT)
	RETURN -1
END IF

FOR i = 1 TO li_row_cnt
	lds_exp_copy.reset()
	//find out the last seq no used for this ver record
	ll_rec_id = lds_exp_cred.GetItemNumber( i, "rec_id" )
	ll_prac_id = lds_exp_cred.GetItemNumber( i, "prac_id" )
	li_facility_id = lds_exp_cred.GetItemNumber( i, "facility_id" )
	 ll_seq_row_cnt = lds_last_verif_seq_no.Retrieve( ll_rec_id, ll_prac_id, li_facility_id )	// changed variable 091500 maha
	IF  ll_seq_row_cnt < 1 THEN
		MessageBox("Error", "Problem getting next sequence number." )
		Return -1
	ELSE
		ll_seq_no = lds_last_verif_seq_no.GetItemNumber( 1, "last_seq_no" ) + 1
	END IF	
	//ll_seq_no = lds_exp_cred.GetItemNumber( i, "seq_no" )
	lds_exp_cred.RowsCopy(i, i, Primary!, lds_exp_copy, 100000, Primary!)
	//ll_seq_no++
	li_nr = lds_exp_copy.RowCount()
	lds_exp_copy.SetItem( li_nr , "seq_no", ll_seq_no )
	lds_exp_copy.SetItem( li_nr, "first_sent", nulldate )
	lds_exp_copy.SetItem( li_nr, "last_sent", nulldate )
	lds_exp_copy.SetItem( li_nr, "number_sent", 0 )
	lds_exp_copy.SetItem( li_nr, "date_recieved", nulldate )
	lds_exp_copy.SetItem( li_nr, "user_name", "" )
	lds_exp_copy.SetItem( li_nr, "response_code", nullint )
	lds_exp_copy.SetItem( li_nr, "priority_user", "PUBLIC" )
	lds_exp_copy.SetItem( li_nr, "priority", 2 )
	lds_exp_copy.SetItem( li_nr, "exp_credential_flag", 1)
	lds_exp_copy.SetItem( li_nr, "verification_method", ll_ver_method_ltr )
	ls_doc_id = String( lds_exp_copy.GetItemNumber( li_nr, "rec_id" ) ) + "-"
	ls_doc_id = ls_doc_id + String( lds_exp_copy.GetItemNumber( li_nr, "prac_id" ) ) + "-"
	ls_doc_id = ls_doc_id + String( lds_exp_copy.GetItemNumber( li_nr, "facility_id" ) ) + "-"
	ls_doc_id = ls_doc_id + String( lds_exp_copy.GetItemNumber( li_nr, "seq_no" ) )
	lds_exp_copy.SetItem( li_nr, "doc_id", ls_doc_id )
	lds_exp_copy.SetItem( li_nr, "print_flag", 1 )

	IF lds_exp_copy.Update()  = 1 THEN
		COMMIT USING SQLCA;
		lds_exp_cred.SetItem( i, "exp_credential_flag", 2)
		cnt++
	else
		ls_fails = ls_fails + " " +  ls_doc_id
	end if
END FOR
*/

n_ds lds_exp_cred
n_ds lds_exp_copy
n_ds lds_last_verif_seq_no
Integer li_row_cnt
Long ll_seq_row_cnt
Integer i
Long ll_seq_no
Integer li_nr
Integer nullint
Integer li_facility_id[]
DateTime nulldate
Long ll_ver_method_ltr 
Long ll_prac_id[]
Long ll_rec_id[]
String ls_doc_id
string ls_fails = ""
integer cnt = 0
integer Bcnt = 0

SetNull( nullint )
SetNull( nulldate )
lds_exp_cred = CREATE n_ds
lds_exp_cred.DataObject = "d_exp_credentials"
lds_exp_cred.of_SetTransObject( SQLCA )
li_row_cnt = lds_exp_cred.Retrieve(  ) 

//<add> 06/27/2007 by: Andy set sort first
lds_exp_cred.setsort("rec_id A, prac_id A, facility_id A")
lds_exp_cred.sort()
//end of add

lds_exp_copy = CREATE n_ds
lds_exp_copy.DataObject = "d_exp_credentials"
lds_exp_copy.of_SetTransObject( SQLCA )

lds_last_verif_seq_no = CREATE n_ds
//<Modify> 07/24/2007 by: Andy
//lds_last_verif_seq_no.DataObject = "d_last_verif_seq_no_forpt"
//this gets the max seq_no for all the items that will be retrieved in "d_exp_credentials"
lds_last_verif_seq_no.DataObject = "d_last_verif_seq_no_forpt_credentials"
//end of modify
lds_last_verif_seq_no.of_SetTransObject( SQLCA )

//comment 07/26/2007 by: Andy
//Reason:optimize
//the data source of d_last_verif_seq_no_forpt_credentials is not need arguments.
/*
FOR i = 1 TO li_row_cnt
	ll_rec_id[i] = lds_exp_cred.GetItemNumber( i, "rec_id" )
	ll_prac_id[i] = lds_exp_cred.GetItemNumber( i, "prac_id" )
	li_facility_id[i] = lds_exp_cred.GetItemNumber( i, "facility_id" )
next

if UpperBound(ll_rec_id) = 0 then
	ll_rec_id[1] = 0
end if

if UpperBound(ll_prac_id) = 0 then
	ll_prac_id[1] = 0
end if

if UpperBound(li_facility_id) = 0 then
	li_facility_id[1] = 0
end if
*/

//<Modify> 07/24/2007 by: Andy
//lds_last_verif_seq_no.Retrieve( ll_rec_id, ll_prac_id, li_facility_id )
lds_last_verif_seq_no.Retrieve( )
//end of modify


if isvalid(w_aiq_run) then  w_aiq_run.r_status.width = 150



ll_ver_method_ltr = Long(gnv_data.of_getitem("code_lookup","lookup_code",&
"upper(lookup_name) = upper('verification method') AND upper(code) = upper('exp cred ltr')"))

gnv_appeondb.of_startqueue( )

//<add> 06/27/2007 by: Andy
Long    ll_rec_id_first      = -1
Long    ll_prac_id_first     = -1
Integer li_facility_id_first = -1
//end of add

FOR i = 1 TO li_row_cnt
	lds_exp_copy.reset()
	
	//<add> 07/26/2007 by: Andy
	ll_rec_id[i] = lds_exp_cred.GetItemNumber( i, "rec_id" )
	ll_prac_id[i] = lds_exp_cred.GetItemNumber( i, "prac_id" )
	li_facility_id[i] = lds_exp_cred.GetItemNumber( i, "facility_id" )
	//end of add
	
	//<add> 06/27/2007 by: Andy fixed a bug. 
	//attention:set sort first
	if ll_rec_id_first = ll_rec_id[i] and &
		ll_prac_id_first = ll_prac_id[i] and li_facility_id_first = li_facility_id[i] then
		//Start Code Change ---06.16.2008 #V81 maha - changed so that for duplicates only one exp cred verification will be created
		lds_exp_cred.SetItem( i, "exp_credential_flag", 2)
		continue		
		//ll_seq_no++
	else
	//end of add
		//find out the last seq no used for this ver record
		lds_last_verif_seq_no.setfilter('rec_id = '+string(ll_rec_id[i]) + 'and prac_id = '+string(ll_prac_id[i]) + 'and facility_id = '+string(li_facility_id[i])) 
		lds_last_verif_seq_no.filter( )
		ll_seq_row_cnt = lds_last_verif_seq_no.rowcount( )
		IF  ll_seq_row_cnt < 1 THEN
 			MessageBox("Error", "Error getting next sequence number." )
			Return -1
		ELSE
			ll_seq_no = lds_last_verif_seq_no.GetItemNumber( 1, "last_seq_no" ) + 1
		END IF
		//<add> 06/27/2007 by: Andy 
		ll_rec_id_first = ll_rec_id[i]
		ll_prac_id_first = ll_prac_id[i]
		li_facility_id_first = li_facility_id[i]
	end if
	//end of add
	
	//ll_seq_no = lds_exp_cred.GetItemNumber( i, "seq_no" )
	lds_exp_cred.RowsCopy(i, i, Primary!, lds_exp_copy, 100000, Primary!)
	//ll_seq_no++
	li_nr = lds_exp_copy.RowCount()
	lds_exp_copy.SetItem( li_nr , "seq_no", ll_seq_no )
	lds_exp_copy.SetItem( li_nr, "first_sent", nulldate )
	lds_exp_copy.SetItem( li_nr, "last_sent", nulldate )
	lds_exp_copy.SetItem( li_nr, "number_sent", 0 )
	lds_exp_copy.SetItem( li_nr, "date_recieved", nulldate )
	lds_exp_copy.SetItem( li_nr, "user_name", "" )
	lds_exp_copy.SetItem( li_nr, "response_code", nullint )
	lds_exp_copy.SetItem( li_nr, "priority_user", "PUBLIC" )
	lds_exp_copy.SetItem( li_nr, "priority", 2 )
	lds_exp_copy.SetItem( li_nr, "exp_credential_flag", 1)
	lds_exp_copy.SetItem( li_nr, "verification_method", ll_ver_method_ltr )
	ls_doc_id = String( lds_exp_copy.GetItemNumber( li_nr, "rec_id" ) ) + "-"
	ls_doc_id = ls_doc_id + String( lds_exp_copy.GetItemNumber( li_nr, "prac_id" ) ) + "-"
	ls_doc_id = ls_doc_id + String( lds_exp_copy.GetItemNumber( li_nr, "facility_id" ) ) + "-"
	ls_doc_id = ls_doc_id + String( lds_exp_copy.GetItemNumber( li_nr, "seq_no" ) )
	lds_exp_copy.SetItem( li_nr, "doc_id", ls_doc_id )
	lds_exp_copy.SetItem( li_nr, "print_flag", 1 )

	IF lds_exp_copy.Update()  = 1 THEN
		COMMIT USING SQLCA;
		lds_exp_cred.SetItem( i, "exp_credential_flag", 2)
		cnt++
	else
		ls_fails = ls_fails + " " +  ls_doc_id
		bcnt++
	end if
END FOR

gnv_appeondb.of_commitqueue( )

//---------------------------- APPEON END ----------------------------

//MSKINNER 15 MARCH 2005 -- BEGIN
if isvalid(w_aiq_run) THEN w_aiq_run.r_status.width = 600
//MSKINNER 15 MARCH 2005 -- END
//debugbreak()

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-02
//$<add> 03.29.2006 By: LeiWei
//$<reason> Performance tuning
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

gnv_appeondb.of_autocommit( )
//---------------------------- APPEON END ----------------------------

IF lds_exp_cred.Update ( True, False ) = 1 THEN
	COMMIT USING SQLCA;
	DESTROY lds_exp_cred
	DESTROY lds_exp_copy
	DESTROY lds_last_verif_seq_no
	
	if cnt > 1 then
	//	messagebox("Exp Cred records created",cnt)
	end if
	if bcnt > 1 then
		//messagebox("Exp Cred records failed",bcnt)
	end if
	if len(ls_fails) > 5 then
		messagebox("Exp Cred Failure","The following records could not be created~r " + ls_fails)
		bcnt++
	end if
	
	return 1
else
	MessageBox("Update Failed", "Update during expiring credentials query failed.")
	DESTROY lds_exp_cred
	DESTROY lds_exp_copy
	DESTROY lds_last_verif_seq_no
	return -1
END IF


end function

public function integer of_resend_letters ();n_ds lds_resend
Integer li_rc
Integer i
Long ll_seq_no
Integer li_facility_id
long ll_rec_id
long ll_pracid

lds_resend = CREATE n_ds;
lds_resend.DataObject = "d_resend_letters"
lds_resend.of_SetTransObject( SQLCA )
li_rc = lds_resend.Retrieve( )// maha app102105 removed arg from dw

w_aiq_run.r_status.width = 900
FOR i = 1 TO li_rc
	lds_resend.SetItem( i, "print_flag", 1)
END FOR

IF lds_resend.Update() = -1 THEN
	MessageBox("Update Failed", "Update of veir_info table failed during resend letter query!" )
	Return -1
END IF

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 11.24.2006 By: Jervis
//$<reason> 
lds_resend.DataObject = "d_resend_letters_app"
lds_resend.of_SetTransObject( SQLCA )
li_rc = lds_resend.Retrieve( )// maha app102105 removed arg from dw

w_aiq_run.r_status.width = 950
FOR i = 1 TO li_rc
	lds_resend.SetItem( i, "print_flag", 1)
END FOR

IF lds_resend.Update() = -1 THEN
	MessageBox("Update Failed", "Update of net_dev_action_items table failed during resend letter query!" )
	Return -1
END IF

//12.5.2006 By Jervis
lds_resend.DataObject = "d_resend_letters_Contract"
lds_resend.of_SetTransObject( SQLCA )
li_rc = lds_resend.Retrieve( )// maha app102105 removed arg from dw

w_aiq_run.r_status.width = 1000
FOR i = 1 TO li_rc
	lds_resend.SetItem( i, "print_flag", 1)
END FOR

IF lds_resend.Update() = -1 THEN
	MessageBox("Update Failed", "Update of net_dev_action_items table failed during resend letter query!" )
	Return -1
END IF

//01.22.2007 By Jervis
lds_resend.DataObject = "d_resend_letters_Document"
lds_resend.of_SetTransObject( SQLCA )
li_rc = lds_resend.Retrieve( )// maha app102105 removed arg from dw

w_aiq_run.r_status.width = 1050
FOR i = 1 TO li_rc
	lds_resend.SetItem( i, "print_flag", 1)
END FOR

IF lds_resend.Update() = -1 THEN
	MessageBox("Update Failed", "Update of ctx_am_action_item table failed during resend letter query!" )
	Return -1
END IF

destroy lds_resend
//---------------------------- APPEON END ----------------------------


Return 1
end function

public function integer of_expiring_appointments ();
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-03
//$<modify> 02.17.2006 By: Wangchao
//$<reason> Performance tuning
//$<modification> Write script to retrieve data from a cache instead of from the database.

/*
n_ds lds_exp_appointments
n_ds lds_verif_info
Integer li_row_cnt
Integer i
integer tp //maha 071403
Integer li_facility_id
Integer li_nr
Integer li_last_seq_no  
Long ll_rec_id
Long ll_exp_ltr
Long ll_prac_id
String ls_doc_id

lds_exp_appointments = CREATE n_ds
lds_verif_info = CREATE n_ds
lds_verif_info.DataObject = "d_verif_info"
lds_verif_info.of_SetTransObject( SQLCA )
*/

datastore lds_exp_appointments_1
datastore lds_exp_appointments_2
datastore lds_exp_appointments_3
datastore lds_last_verif_seq_no
n_ds lds_verif_info
Integer li_row_cnt
Integer i
integer tp //maha 071403
Integer li_facility_id
Integer li_nr
Integer li_last_seq_no  
Long ll_rec_id
Long ll_exp_ltr
Long ll_prac_id
String ls_doc_id
long ll_r

//<add> 06/27/2007 by: Andy
Long    ll_prac_id_first    
Integer li_facility_id_first
Long    ll_last_cnt
//end of add



lds_exp_appointments_1 = CREATE datastore
lds_exp_appointments_2 = CREATE datastore
lds_exp_appointments_3 = CREATE datastore
lds_last_verif_seq_no = CREATE datastore
lds_verif_info = CREATE n_ds
lds_verif_info.DataObject = "d_verif_info"
lds_verif_info.of_SetTransObject( SQLCA )
//---------------------------- APPEON END ----------------------------
//Added for Work Flow. 2/11/2006 Henry
long ll_prac_ids[] , ll_rec_ids[], ll_screen_ids[],ll_facility_ids[],ll_wf_ids[]
long ll_wf_expiring
String	ls_override = 'N'
//End added for work flow
//---------------------------- APPEON END ----------------------------

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-04
//$<modify> 02.17.2006 By: Wangchao
//$<reason> Performance tuning
//$<modification> Write script to retrieve data from a cache instead of from the database.

/*
SELECT code_lookup.lookup_code  
INTO :ll_exp_ltr
FROM code_lookup  
WHERE ( code_lookup.lookup_name = 'verification method' ) AND  
		( code_lookup.code = 'EXP APPT LTR'  )   ;
IF SQLCA.SQLCODE = -1 THEN
	MessageBox("SQL ERROR", SQLCA.SQLERRTEXT)
	RETURN -1
END IF
*/

ll_exp_ltr=long(gnv_data.of_getitem("code_lookup" ,'lookup_code', "upper(lookup_name) = '" + upper('verification method') + "'"+" and upper(code) = 'EXP APPT LTR'"))

//---------------------------- APPEON END ----------------------------

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-05
//$<add> 02.16.2006 By: Wangchao
//$<reason> Performance tuning
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

gnv_appeondb.of_startqueue( )

lds_exp_appointments_1.DataObject = "d_exp_appt_allied_health"
lds_exp_appointments_1.SetTransObject( SQLCA )
lds_exp_appointments_1.Retrieve(  )

lds_exp_appointments_2.DataObject = "d_exp_provisional"
lds_exp_appointments_2.SetTransObject( SQLCA )
lds_exp_appointments_2.Retrieve()

lds_exp_appointments_3.DataObject = "d_exp_appointments"
lds_exp_appointments_3.SetTransObject( SQLCA )
lds_exp_appointments_3.Retrieve()

lds_last_verif_seq_no.DataObject = "d_last_verif_seq_no_for_pt"
lds_last_verif_seq_no.SetTransObject( SQLCA )
lds_last_verif_seq_no.Retrieve()

//<add> 06/27/2007 by: Andy set sort first
lds_exp_appointments_1.setsort("prac_id A, parent_facility_id A")
lds_exp_appointments_1.sort()

lds_exp_appointments_2.setsort("prac_id A, parent_facility_id A")
lds_exp_appointments_2.sort()

lds_exp_appointments_3.setsort("prac_id A, parent_facility_id A")
lds_exp_appointments_3.sort()
//end of add
//---------------------------- APPEON END ----------------------------

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-06
//$<add> 02.17.2006 By: Wangchao
//$<reason> Performance tuning
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.
 

gnv_appeondb.of_commitqueue( )

ll_last_cnt = lds_last_verif_seq_no.RowCount()

integer li_row_cnt_1,li_row_cnt_2,li_row_cnt_3
li_row_cnt_1 = lds_exp_appointments_1.rowcount()
li_row_cnt_2 = lds_exp_appointments_2.rowcount()
li_row_cnt_3 = lds_exp_appointments_3.rowcount()
ll_rec_id = gnv_app.of_get_id("RECORD_ID",(li_row_cnt_1+li_row_cnt_2+li_row_cnt_3)*3) - 1
//---------------------------- APPEON END ----------------------------

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-07
//$<modify> 02.17.2006 By: Wangchao
//$<reason> Performance tuning
//$<modification> Write script to retrieve data from a cache instead of from the database.

/*
for tp = 1 to 3	//maha 071403 loop and create the 3 types of letters
	choose case tp
		case 1 //exp allied health create the exp ah first and the exp appts that would be generated off the same records will not be created
			//lds_exp_appointments = CREATE n_ds
			//MSKINNER 15 MARCH 2005 -- BEGIN
          if isvalid(w_aiq_run) then  w_aiq_run.r_status.width = 1300
         //MSKINNER 15 MARCH 2005 -- END	
			lds_exp_appointments.DataObject = "d_exp_appt_allied_health"
			lds_exp_appointments.of_SetTransObject( SQLCA )
			li_row_cnt = lds_exp_appointments.Retrieve(  )//Retrieve( Today() ) maha app102105 removed arg from dw
		case 2 //exp provisional
			//lds_exp_appointments = CREATE n_ds
			//MSKINNER 15 MARCH 2005 -- BEGIN
          if isvalid(w_aiq_run) then  w_aiq_run.r_status.width = 1500
         //MSKINNER 15 MARCH 2005 -- END
			lds_exp_appointments.DataObject = "d_exp_provisional"
			lds_exp_appointments.of_SetTransObject( SQLCA )
			li_row_cnt = lds_exp_appointments.Retrieve(  )//Retrieve( Today() )  maha app102105 removed arg from dw
		case 3 //exp appointments
			//lds_exp_appointments = CREATE n_ds
			lds_exp_appointments.DataObject = "d_exp_appointments"
			lds_exp_appointments.of_SetTransObject( SQLCA )
			li_row_cnt = lds_exp_appointments.Retrieve( )//Retrieve( Today() ) maha app102105 removed arg from dw
	end choose
	//lds_verif_info = CREATE n_ds
	//lds_verif_info.DataObject = "d_verif_info"
	lds_verif_info.reset()
	
	
	
	FOR i = 1 TO li_row_cnt
		li_nr = lds_verif_info.InsertRow( 0 )
		ll_rec_id = gnv_app.of_get_id("RECORD_ID")
		ll_prac_id = lds_exp_appointments.GetItemNumber( i, "prac_id")
		li_facility_id = lds_exp_appointments.GetItemNumber( i, "parent_facility_id") 
		lds_verif_info.SetItem( li_nr, "prac_id", ll_prac_id )
		lds_verif_info.SetItem( li_nr, "rec_id", ll_rec_id )
		lds_verif_info.SetItem( li_nr, "facility_id", li_facility_id )
		lds_verif_info.SetItem( li_nr, "direct_parent_facility_link", li_facility_id )
		choose case tp
			case 3 //exp appointments
				lds_verif_info.SetItem( li_nr, "reference_value", "Expiring Appointment Letter" )
			case 2 //exp provisional
				lds_verif_info.SetItem( li_nr, "reference_value", "Expiring Provisional Letter" )
			case 1 //exp allied health
				lds_verif_info.SetItem( li_nr, "reference_value", "Expiring Allied Health Letter" )
		end choose
		
		SELECT Max( seq_no )  
		INTO :li_last_seq_no  
		FROM verif_info  
		WHERE ( verif_info.prac_id = :ll_prac_id ) AND  
				( verif_info.verification_method = :ll_exp_ltr ) AND  
				( verif_info.facility_id = :li_facility_id )   ;
		IF IsNull( li_last_seq_no ) THEN
			li_last_seq_no = 0
		END IF
		li_last_seq_no++
		lds_verif_info.SetItem( li_nr, "seq_no", li_last_seq_no )
		lds_verif_info.SetItem( li_nr, "screen_id", 1 )	
		lds_verif_info.SetItem( li_nr, "verification_method", ll_exp_ltr )	
		lds_verif_info.SetItem( li_nr, "priority_user", "Public" )	
		lds_verif_info.SetItem( li_nr, "priority", 2 )	
		lds_verif_info.SetItem( li_nr, "active_status", 1 )
		lds_verif_info.SetItem( li_nr, "exp_credential_flag", 1 )
		lds_verif_info.SetItem( li_nr, "print_flag", 1 )
		ls_doc_id = String( ll_rec_id ) + "-" + String( ll_prac_id ) + "-" + String( li_facility_id ) + "-" +  String( li_last_seq_no )	
		lds_verif_info.SetItem( li_nr, "doc_id", ls_doc_id )
	END FOR
	
	IF lds_verif_info.Update() <> 1 THEN
		choose case tp
			case 3 //exp appointments
				MessageBox("Update Failed", "Expiring Appointment update to verif_info table failed!" )
			case 2 //exp provisional
				MessageBox("Update Failed", "Expiring Provisional update to verif_info table failed!" )
			case 1 //exp allied health
				MessageBox("Update Failed", "Expiring Allied Health update to verif_info table failed!" )
		end choose
		Return -1
	END IF
	
	COMMIT USING SQLCA;  

next
*/

for tp = 1 to 3	//maha 071403 loop and create the 3 types of letters
	choose case tp
		case 1 //exp allied health create the exp ah first and the exp appts that would be generated off the same records will not be created
			//MSKINNER 15 MARCH 2005 -- BEGIN
          if isvalid(w_aiq_run) then  w_aiq_run.r_status.width = 1300
         //MSKINNER 15 MARCH 2005 -- END	
			li_row_cnt = li_row_cnt_1
		case 2 //exp provisional			
			//MSKINNER 15 MARCH 2005 -- BEGIN
          if isvalid(w_aiq_run) then  w_aiq_run.r_status.width = 1500
         //MSKINNER 15 MARCH 2005 -- END
			li_row_cnt = li_row_cnt_2
		case 3 //exp appointments					
			li_row_cnt = li_row_cnt_3
	end choose
	
	lds_verif_info.reset()

	//<add> 06/27/2007 by: Andy
	ll_prac_id_first     = -1
	li_facility_id_first = -1
	//end of add
	
	FOR i = 1 TO li_row_cnt
		//--------------------------- APPEON BEGIN ---------------------------
		//$<modify> 11.28.2006 by Henry
		//$<modification> Add the Appointment Expiring work flow triggers
		/*
		li_nr = lds_verif_info.InsertRow( 0 )				
		ll_rec_id ++	
		
		choose case tp
			case 3 //exp appointments
				ll_prac_id = lds_exp_appointments_3.GetItemNumber( i, "prac_id")
				li_facility_id = lds_exp_appointments_3.GetItemNumber( i, "parent_facility_id") 
				lds_verif_info.SetItem( li_nr, "reference_value", "Expiring Appointment Letter" )
			case 2 //exp provisional
				ll_prac_id = lds_exp_appointments_2.GetItemNumber( i, "prac_id")
				li_facility_id = lds_exp_appointments_2.GetItemNumber( i, "parent_facility_id") 
				lds_verif_info.SetItem( li_nr, "reference_value", "Expiring Provisional Letter" )
			case 1 //exp allied health
				ll_prac_id = lds_exp_appointments_1.GetItemNumber( i, "prac_id")
				li_facility_id = lds_exp_appointments_1.GetItemNumber( i, "parent_facility_id") 
				lds_verif_info.SetItem( li_nr, "reference_value", "Expiring Allied Health Letter" )
		end choose
		
		lds_verif_info.SetItem( li_nr, "prac_id", ll_prac_id )
		lds_verif_info.SetItem( li_nr, "rec_id", ll_rec_id )
		lds_verif_info.SetItem( li_nr, "facility_id", li_facility_id )
		lds_verif_info.SetItem( li_nr, "direct_parent_facility_link", li_facility_id )
		
		ll_r=lds_last_verif_seq_no.find('prac_id='+string(ll_prac_id)+' and verification_method='+string(ll_exp_ltr)+' and facility_id='+string(li_facility_id),1,lds_last_verif_seq_no.rowcount())
		if ll_r>0 then 
			li_last_seq_no = lds_last_verif_seq_no.getitemnumber(ll_r,'last_seq_no')
		else
			setnull(li_last_seq_no)	
		end if
		
		IF IsNull( li_last_seq_no ) THEN
			li_last_seq_no = 0
		END IF
		li_last_seq_no++
		lds_verif_info.SetItem( li_nr, "seq_no", li_last_seq_no )
		lds_verif_info.SetItem( li_nr, "screen_id", 1 )	
		lds_verif_info.SetItem( li_nr, "verification_method", ll_exp_ltr )	
		lds_verif_info.SetItem( li_nr, "priority_user", "Public" )	
		lds_verif_info.SetItem( li_nr, "priority", 2 )	
		lds_verif_info.SetItem( li_nr, "active_status", 1 )
		lds_verif_info.SetItem( li_nr, "exp_credential_flag", 1 )
		lds_verif_info.SetItem( li_nr, "print_flag", 1 )
		ls_doc_id = String( ll_rec_id ) + "-" + String( ll_prac_id ) + "-" + String( li_facility_id ) + "-" +  String( li_last_seq_no )	
		lds_verif_info.SetItem( li_nr, "doc_id", ls_doc_id )
		*/
		
		
		choose case tp
			case 3 //exp appointments
				ll_prac_id = lds_exp_appointments_3.GetItemNumber( i, "prac_id")
				li_facility_id = lds_exp_appointments_3.GetItemNumber( i, "parent_facility_id") 
				//lds_verif_info.SetItem( li_nr, "reference_value", "Expiring Appointment Letter" ) Jervis 12.20.2006
			case 2 //exp provisional
				ll_prac_id = lds_exp_appointments_2.GetItemNumber( i, "prac_id")
				li_facility_id = lds_exp_appointments_2.GetItemNumber( i, "parent_facility_id") 
				//lds_verif_info.SetItem( li_nr, "reference_value", "Expiring Provisional Letter" ) Jervis 12.20.2006
			case 1 //exp allied health
				ll_prac_id = lds_exp_appointments_1.GetItemNumber( i, "prac_id")
				li_facility_id = lds_exp_appointments_1.GetItemNumber( i, "parent_facility_id") 
				//lds_verif_info.SetItem( li_nr, "reference_value", "Expiring Allied Health Letter" ) Jervis 12.20.2006
		end choose
		
		If gb_workflow Then
			ll_wf_expiring = long(gnv_data.of_getitem("facility","facility_wf_expiring_appointment","facility_id="+string(li_facility_id)))
			If ll_wf_expiring > 0 Then
				ll_prac_ids[upperbound(ll_prac_ids) + 1]  = ll_prac_id
				ll_rec_ids[upperbound(ll_rec_ids) + 1] = ll_rec_id
				ll_screen_ids[upperbound(ll_screen_ids) + 1] = -10
				ll_facility_ids[upperbound(ll_facility_ids) + 1] = li_facility_id
				ll_wf_ids[upperbound(ll_wf_ids) + 1] = ll_wf_expiring
			End If
			ls_override = gnv_data.of_getitem( 'facility', 'facility_wf_exp_appt', 'facility_id=' + string(li_facility_id))
			if isnull(ls_override) Then ls_override = 'N'
		End If
		
		//if [x] Override IntelliCred Expiring Appointment Letter Action Item Creation is checked in facility painter
		//then just don't create the Exp Appt Ltr that the system normally creates.
		If ls_override <> 'Y' Then
			li_nr = lds_verif_info.InsertRow( 0 )				
			ll_rec_id ++	
			
			//--------------------------- APPEON BEGIN ---------------------------
			//$<add> 12.20.2006 By: Jervis
			//$<reason> Fix a defect
			choose case tp
				case 3 //exp appointments
					lds_verif_info.SetItem( li_nr, "reference_value", "Expiring Appointment Letter" )
				case 2 //exp provisional
					lds_verif_info.SetItem( li_nr, "reference_value", "Expiring Provisional Letter" )
				case 1 //exp allied health
					lds_verif_info.SetItem( li_nr, "reference_value", "Expiring Allied Health Letter" )
			end choose
			//---------------------------- APPEON END ----------------------------

			lds_verif_info.SetItem( li_nr, "prac_id", ll_prac_id )
			lds_verif_info.SetItem( li_nr, "rec_id", ll_rec_id )
			lds_verif_info.SetItem( li_nr, "facility_id", li_facility_id )
			lds_verif_info.SetItem( li_nr, "direct_parent_facility_link", li_facility_id )
			
			//<add> 06/27/2007 by: Andy fixed a bug. 
			//attention:set sort first
			if ll_prac_id_first = ll_prac_id and li_facility_id_first = li_facility_id then 
				li_last_seq_no++
			else
			//end of add
				//Modify 07/26/2007 by: Andy
				//ll_r=lds_last_verif_seq_no.find('prac_id='+string(ll_prac_id)+' and verification_method='+string(ll_exp_ltr)+' and facility_id='+string(li_facility_id),1,lds_last_verif_seq_no.Rowcount())
				ll_r=lds_last_verif_seq_no.find('prac_id='+string(ll_prac_id)+' and verification_method='+string(ll_exp_ltr)+' and facility_id='+string(li_facility_id),1,ll_last_cnt)
				//end of modify
				if ll_r>0 then 
					li_last_seq_no = lds_last_verif_seq_no.getitemnumber(ll_r,'last_seq_no')
				else
					setnull(li_last_seq_no)	
				end if
				
				IF IsNull( li_last_seq_no ) THEN
					li_last_seq_no = 0
				END IF
				li_last_seq_no++
				//<add> 06/27/2007 by: Andy
				ll_prac_id_first     = ll_prac_id
				li_facility_id_first = li_facility_id
			end if
			//end of add
			
			lds_verif_info.SetItem( li_nr, "seq_no", li_last_seq_no )
			lds_verif_info.SetItem( li_nr, "screen_id", 1 )	
			lds_verif_info.SetItem( li_nr, "verification_method", ll_exp_ltr )	
			lds_verif_info.SetItem( li_nr, "priority_user", "Public" )	
			lds_verif_info.SetItem( li_nr, "priority", 2 )	
			lds_verif_info.SetItem( li_nr, "active_status", 1 )
			lds_verif_info.SetItem( li_nr, "exp_credential_flag", 1 )
			lds_verif_info.SetItem( li_nr, "print_flag", 1 )
			ls_doc_id = String( ll_rec_id ) + "-" + String( ll_prac_id ) + "-" + String( li_facility_id ) + "-" +  String( li_last_seq_no )	
			lds_verif_info.SetItem( li_nr, "doc_id", ls_doc_id )
		End If
		
	END FOR
	
	IF lds_verif_info.Update() <> 1 THEN
		choose case tp
			//--------------------------- APPEON BEGIN ---------------------------
			//$<modify> 2007.08.31 By: Jack
			//$<reason> Fix a defect.
			/*				
			case 3 //exp appointments
				MessageBox("Update Failed", "Expiring Appointment update to verif_info table failed!" )
			case 2 //exp provisional
				MessageBox("Update Failed", "Expiring Provisional update to verif_info table failed!" )
			case 1 //exp allied health
				MessageBox("Update Failed", "Expiring Allied Health update to verif_info table failed!" )
			*/
			case 3 //exp appointments
  				MessageBox("Update Failed", "Failed to update Expiring Appointment to verif_info table!" )
			case 2 //exp provisional
  				MessageBox("Update Failed", "Failed to update Expiring Provisional to verif_info table!" )
			case 1 //exp allied health
  				MessageBox("Update Failed", "Failed to update Expiring Allied Health to verif_info table!" )
			//---------------------------- APPEON END ----------------------------
		end choose
		Return -1
	END IF
	
	COMMIT USING SQLCA;  

next
//---------------------------- APPEON END ----------------------------
//Added for work flow. Trigger of the related work flow for practitioner expiring appointment. 2/11/2006 Henry
ll_r = upperbound(ll_prac_ids)
If ll_r > 0 and gb_workflow Then
	n_cst_workflow_triggers lnv_triggers
	lnv_triggers = create n_cst_workflow_triggers
	str_action_item lstr_action[]
	for i = 1 to ll_r
		lstr_action[i].prac_id = ll_prac_ids[i]
		lstr_action[i].rec_id = ll_rec_ids[i]
		lstr_action[i].facility_id = ll_facility_ids[i]
		lstr_action[i].screen_id = ll_screen_ids[i]
		lstr_action[i].wf_id = ll_wf_ids[i]
	next
	lnv_triggers.of_workflow_triggers(lstr_action)
	
	destroy lnv_triggers
End If
//End added for Work Flow

DESTROY lds_exp_appointments_1
DESTROY lds_exp_appointments_2
DESTROY lds_exp_appointments_3
DESTROY lds_last_verif_seq_no
DESTROY lds_verif_info

Return 0
end function

public function integer of_reverify_credentials ();//lds_reapp = CREATE n_ds
//lds_reapp.DataObject = adw_ver_copy.DataObject 
//lds_reapp.of_SetTransObject( SQLCA )
//adw_ver_copy.ShareData( lds_reapp )
//
//lds_exp_copy = CREATE n_ds
//lds_exp_copy.DataObject = "d_copy_verification"
//lds_exp_copy.of_SetTransObject( SQLCA )
//
//li_row_cnt = lds_reapp.RowCount()
//
//IF li_row_cnt = 0 THEN
//	Return 0
//END IF
//
//FOR i = 1 TO li_row_cnt
//	//if credential has (not) been selected then it does not have to be verified
//	IF lds_reapp.GetItemNumber( i, "selected" ) = 0 THEN
//		CONTINUE
//	END IF
//	lds_reapp.RowsCopy(i, i, Primary!, lds_exp_copy, 100000, Primary!)
//	li_seq_no = lds_reapp.GetItemNumber( i, "seq_no" )
//	li_seq_no++
//	li_nr = lds_exp_copy.RowCount()
//	lds_exp_copy.SetItem( li_nr , "seq_no", li_seq_no )
//	lds_exp_copy.SetItem( li_nr, "first_sent", nulldate )
//	lds_exp_copy.SetItem( li_nr, "last_sent", nulldate )
//	lds_exp_copy.SetItem( li_nr, "number_sent", 0 )
//	lds_exp_copy.SetItem( li_nr, "date_recieved", nulldate )
//	lds_exp_copy.SetItem( li_nr, "user_name", "" )
//	lds_exp_copy.SetItem( li_nr, "response_code", nullint )
//	lds_exp_copy.SetItem( li_nr, "priority_user", "PUBLIC" )
//	lds_exp_copy.SetItem( li_nr, "priority", 2 )
//	lds_exp_copy.SetItem( li_nr, "exp_credential_flag", 0)
//	//find out what the user has selected for the new verificatin method
//	ll_new_ver_method = lds_reapp.GetItemNumber( i, "new_verification_method" )
//	lds_exp_copy.SetItem( li_nr, "verification_method", ll_new_ver_method )
//	ls_doc_id = String( lds_exp_copy.GetItemNumber( li_nr, "rec_id" ) )
//	ll_prac_id = lds_exp_copy.GetItemNumber( li_nr, "prac_id" )
//	ls_doc_id = ls_doc_id + String( ll_prac_id )
//	ls_doc_id = ls_doc_id + String( lds_exp_copy.GetItemNumber( li_nr, "facility_id" ) )
//	ls_doc_id = ls_doc_id + String( lds_exp_copy.GetItemNumber( li_nr, "seq_no" ) )
//	lds_exp_copy.SetItem( li_nr, "doc_id", ls_doc_id )
//	lds_exp_copy.SetItem( li_nr, "print_flag", 1 )
//	//make current verif entry inactive
//	lds_reapp.SetItem( i, "active_status", 0 )
//END FOR

RETURN 0
end function

public function integer of_dialphone (string as_phone);String ls_dialer_path
String ls_dialer_ini_path

ls_dialer_ini_path = ProfileString(gs_IniFilePathName, "Paths","dialer_ini_path", "None")

SetProfileString( ls_dialer_ini_path + "dialer.ini", "Speed Dial Settings", "Name1", "IntelliCred" )
SetProfileString( ls_dialer_ini_path + "dialer.ini", "Speed Dial Settings", "Number1", as_phone )
ls_dialer_path = ProfileString(gs_IniFilePathName, "Paths","dialer", "None")

Run( ls_dialer_path + "dialer.exe")

Return 0
end function

public function integer of_copy_required_data (long ll_appt_stat_id, integer ai_app_audit_facility_id, integer ai_parent_facility_id, long al_prac_id);n_ds ldw_app_audit_facility
n_ds lds_last_app_audit_seq_no
n_ds ldw_rqrd_data
n_ds ldw_audit
Integer li_row_cnt
Integer i
Long ll_seq_no
Long ll_seq_row_cnt
Long ll_record_id
Long ll_app_audit_id
Integer li_facility_row_cnt
String ls_version

//check to see if security is installed, if it is not then give access to new view
//ls_version = ProfileString(gs_IniFilePathName, "setup", "version", "None")
ls_version = "EE448738514625"
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-08
//$<modify> 01.17.2006 By: Cao YongWang
//$<reason> Performance tuning. There is no need for the Web application to read local INI files. The Web application
//$<reason> reads INI files from the server.
//$<modification> Write the following script to make sure when IntelliCred runs on the Web, it does not read the local
//$<modification> INI files.

//IF NOT FileExists( gs_dir_path + gs_DefDirName + "\intellicred.ini" ) THEN
//	MessageBox("ini File Error", "No intellicred.ini file found at: " + gs_dir_path + gs_DefDirName + "\intellicred.ini" )
//	Return -1
//END IF
If appeongetclienttype() = 'PB' Then
	IF NOT FileExists(gs_IniFilePathName) THEN
		//--------------------------- APPEON BEGIN ---------------------------
		//$<modify> 2007.08.31 By: Jack
		//$<reason> Fix a defect.
		/*
		MessageBox("ini File Error", "No intellicred.ini file found at: " + gs_IniFilePathName )
		*/
		MessageBox("INI File Error", "No intellicred.ini file was found at: " + gs_IniFilePathName )
		//---------------------------- APPEON END ----------------------------
		Return -1
	END IF
End If
//---------------------------- APPEON END ----------------------------

//IF ls_version = "None" THEN
//	//--------------------------- APPEON BEGIN ---------------------------
//	//$<modify> 2007.08.31 By: Jack
//	//$<reason> Fix a defect.
//	/*
//	MessageBox("Error", "Version number not setup.")
//	*/
//	MessageBox("Error", "Version number is not setup.")
//	//---------------------------- APPEON END ----------------------------
//	RETURN -1
//END IF
//
////app audit
//IF MID( ls_version, 11, 1) <> "4" THEN
//	RETURN 0
//END IF


ldw_audit = CREATE n_ds
ldw_audit.DataObject = "d_pd_app_audit_rqrd_data"
ldw_audit.of_SetTransObject( SQLCA )

ldw_rqrd_data = CREATE n_ds
ldw_rqrd_data.DataObject = "d_app_audit_rqrd_data"
ldw_rqrd_data.of_SetTransObject( SQLCA )

li_row_cnt = ldw_rqrd_data.Retrieve( ai_app_audit_facility_id, 'R' )

//<add> 06/27/2007 by: Andy set sort first
ldw_rqrd_data.setsort("app_audit_id A")
ldw_rqrd_data.sort()

Long    ll_app_audit_id_first= -1
//end of add

lds_last_app_audit_seq_no = CREATE n_ds
lds_last_app_audit_seq_no.DataObject = "d_last_app_audit_seq_no"
lds_last_app_audit_seq_no.of_SetTransObject( SQLCA )

FOR i = 1 TO li_row_cnt
	//--------------------------- APPEON BEGIN ---------------------------
	//$<modify> 10.17.2006 By: Jack (Inova)
	//$<reason> Required Documents Check Box on Data Entry Screen.
	/*
	ldw_audit.InsertRow( 0 )
	*/
	integer li_auto_generate,li_row
	li_auto_generate = ldw_rqrd_data.getitemnumber(i,'auto_generate')
	if li_auto_generate = 1 then
		continue
	end if
	li_row = ldw_audit.InsertRow( 0 )
	//---------------------------- APPEON END ----------------------------
	ll_record_id = gnv_app.of_get_id("RECORD_ID")
	ll_app_audit_id = ldw_rqrd_data.GetItemNumber( i, "app_audit_id" )
	//--------------------------- APPEON BEGIN ---------------------------
	//$<modify> 10.18.2006 By: Jack (Inova)
	//$<reason> Required Documents Check Box on Data Entry Screen.
	/*
	ldw_audit.SetItem( i, "rec_id", ll_record_id )
	ldw_audit.SetItem( i, "appt_stat_id", ll_appt_stat_id )
	ldw_audit.SetItem( i, "prac_id", al_prac_id )
	ldw_audit.SetItem( i, "facility_id", ai_parent_facility_id )
	ldw_audit.SetItem( i, "app_audit_id", ll_app_audit_id )
	*/
	ldw_audit.SetItem( li_row, "rec_id", ll_record_id )
	ldw_audit.SetItem( li_row, "appt_stat_id", ll_appt_stat_id )
	ldw_audit.SetItem( li_row, "prac_id", al_prac_id )
	ldw_audit.SetItem( li_row, "facility_id", ai_parent_facility_id )
	ldw_audit.SetItem( li_row, "app_audit_id", ll_app_audit_id )
	
	//---------------------------- APPEON END ----------------------------
	
	//<add> 06/27/2007 by: Andy fixed a bug. 
	//attention:set sort first
	if ll_app_audit_id_first = ll_app_audit_id then 
		ll_seq_no++
	else
	//end of add
		//find out the last seq no used
		ll_seq_row_cnt = lds_last_app_audit_seq_no.Retrieve( ll_app_audit_id, al_prac_id, ai_app_audit_facility_id )	
		IF ll_seq_row_cnt < 1 THEN
			ll_seq_no = 1 
		ELSE
			ll_seq_no = lds_last_app_audit_seq_no.GetItemNumber( 1, "last_seq_no" ) + 1
		END IF
		//<add> 06/27/2007 by: Andy 
		ll_app_audit_id_first = ll_app_audit_id
	end if
	//end of add
	
	//--------------------------- APPEON BEGIN ---------------------------
	//$<add> 10.17.2006 By: Jack (Inova)
	//$<reason> Required Documents Check Box on Data Entry Screen.
	/*
	ldw_audit.SetItem( i, "seq_no", ll_seq_no	) 		
	ldw_audit.SetItem( i, "active_status", 1 )
	ldw_audit.SetItem( i, "pd_app_audit_fax_message", ldw_rqrd_data.GetItemString( i, "fax_description" )	) 	
	ldw_audit.SetItem( i, "description", ldw_rqrd_data.GetItemString( i, "description" )	) 		
	*/
	ldw_audit.SetItem( li_row, "seq_no", ll_seq_no	) 		
	ldw_audit.SetItem( li_row, "active_status", 1 )
	ldw_audit.SetItem( li_row, "pd_app_audit_fax_message", ldw_rqrd_data.GetItemString( i, "fax_description" )	) 	
	ldw_audit.SetItem( li_row, "description", ldw_rqrd_data.GetItemString( i, "description" )	) 		
	ldw_audit.SetItem( li_row, "app_type", ldw_rqrd_data.GetItemString( i, "app_type" )	)		
	//---------------------------- APPEON END ----------------------------
END FOR

IF ldw_audit.Update() = -1 THEN
	messagebox("", sqlca.sqlerrtext)
	MessageBox( "Update Error" , "Error updating application audit data.")
	Return -1
END IF

DESTROY ldw_audit
DESTROY ldw_rqrd_data
DESTROY ldw_app_audit_facility
DESTROY lds_last_app_audit_seq_no

RETURN 0

end function

public function integer of_recred_no_verifs (integer ai_fac_id);//// this function no longer being used 011703 rolled in to of_start_recred_process
//
//
//
//n_ds lds_last_app_audit_seq_no
//n_ds ldw_rqrd_data
//n_ds ldw_audit
//n_ds ldw_action_items
//n_ds lds_appt_dept
//n_ds lds_appt_comms
//n_ds lds_appt_stat
//n_ds lds_appt_staff_cat
//n_ds lds_appt_leave
//
//Integer li_seq_row_cnt
//Integer ll_exp_appt_ltr  
//Integer li_retval
//Integer li_row_cnt
//Integer i
//Integer li_seq_no
//Integer li_nr
//Integer nullint
//Integer li_action_item_row
//Integer li_parent_facility_id
//Integer li_audit_facility_id
//Integer li_verif_facility_id
//Integer li_facility_row_cnt
//integer res
//String ls_version
//String ls_doc_id
//String ls_rec_id
//integer li_set23 //maha 121602
//
//Long ll_appt_stat_id
//Long ll_prac_id
//Long ll_rec_id
//Long ll_new_rec_id
//Long ll_new_ver_method
//Long ll_response_code  
//Long ll_record_id
//Long ll_app_audit_id
//long ll_test1 //maha 110800
//long ll_test2 //maha 110800
//
//DateTime nulldate
//
//li_parent_facility_id = ai_fac_id
//ll_prac_id = gl_prac_id
//
//res = messagebox("Are you sure?","This function will complete the recredentialing process without creating new verification items. Do you wish to continue?",question!,yesno!,2)
//if res = 2 then return 0
//res = messagebox("","Are you sure?",question!,yesno!,2)
//if res = 2 then return 0
//
//
//SetNull( nullint )
//SetNull( nulldate )
//
////li_parent_facility_id = ai_facility_id
//
////instantiate all the datastores so you can copy all the appointment status info 
//lds_appt_stat = CREATE n_ds
//lds_appt_stat.DataObject = "d_pd_affil_status"
////\/maha 030602
//datawindowchild dwchild
//lds_appt_stat.GetChild( "parent_facility_id", dwchild )
//dwchild.settransobject(sqlca)
//dwchild.retrieve(gs_user_id)
//lds_appt_stat.GetChild( "verifying_facility", dwchild )
//dwchild.settransobject(sqlca)
//dwchild.retrieve(gs_user_id)
////\maha
//lds_appt_stat.of_SetTransObject( SQLCA )
//li_row_cnt = lds_appt_stat.Retrieve( ll_prac_id, li_parent_facility_id,gs_user_id )
//
//if li_row_cnt < 1 then
//	messagebox("Retrieve Error","Unable to retrieve affiliation status for practitioner " + string(ll_prac_id))
//	return -1
//end if
//
//lds_appt_stat.SetFilter( "active_status = 1" )
//lds_appt_stat.Filter( )
//
//if lds_appt_stat.rowcount() < 1 then //maha 010303
//	messagebox("Status Error"," The active status of the practitioner's Appointment record must be set to Active to complete the recredentialing process")
//	return -1
//end if
////make the status record inactive
//lds_appt_stat.SetItem( 1, "active_status", 0 )
////grab the last sequence number
//li_seq_no = lds_appt_stat.GetItemNumber( 1, "seq_no" )
//ll_rec_id = lds_appt_stat.GetItemNumber( 1, "rec_id" )
////grab the audit and verifying and app audit facility id(s)
//li_audit_facility_id = lds_appt_stat.GetItemNumber( 1, "application_audit_facility" )
//li_verif_facility_id = lds_appt_stat.GetItemNumber( 1, "verifying_facility" )
////get a new record id
//ll_new_rec_id = gnv_app.of_get_id("RECORD_ID")
//
//ll_appt_stat_id = ll_new_rec_id
////add a new row to appointment status
//li_nr = lds_appt_stat.InsertRow( 0 )
//lds_appt_stat.SetItem( li_nr, "rec_id", ll_new_rec_id )
//lds_appt_stat.SetItem( li_nr, "prac_id", ll_prac_id )
//lds_appt_stat.SetItem( li_nr, "parent_facility_id", li_parent_facility_id )
//li_seq_no++
//lds_appt_stat.SetItem( li_nr, "seq_no", li_seq_no )
//lds_appt_stat.SetItem( li_nr, "verifying_facility", li_verif_facility_id )
//lds_appt_stat.SetItem( li_nr, "application_audit_facility", li_audit_facility_id )
//lds_appt_stat.SetItem( li_nr, "apptmnt_type", "R" )
//lds_appt_stat.SetItem( li_nr, "affiliation_status", lds_appt_stat.GetItemstring( 1, "affiliation_status" ) )//maha 112102
//lds_appt_stat.SetItem( li_nr, "inital_appmnt_date", lds_appt_stat.GetItemdatetime( 1, "inital_appmnt_date" ) )//maha 112102
//SELECT set_23 INTO :li_set23 FROM icred_settings;
//IF li_set23 = 1 THEN 
//	lds_appt_stat.SetItem( li_nr, "custom_4", lds_appt_stat.GetItemdatetime( 1, "custom_4" ) )//maha 121602 lij
//end if
//
////staff category
//lds_appt_staff_cat = CREATE n_ds
//lds_appt_staff_cat.DataObject = "d_pd_affil_staff_cat"
//lds_appt_staff_cat.of_SetTransObject( SQLCA )
//li_row_cnt = lds_appt_staff_cat.Retrieve( ll_rec_id )
//IF li_row_cnt > 0 THEN
//	lds_appt_staff_cat.SetSort("seq_no")
//	lds_appt_staff_cat.Sort()
//	li_seq_no = lds_appt_staff_cat.GetItemNumber( li_row_cnt , "seq_no" )
//	FOR i = 1 TO li_row_cnt
//		li_seq_no++
//		lds_appt_staff_cat.RowsCopy( i, i, Primary!, lds_appt_staff_cat, 1000, Primary! )
//		lds_appt_staff_cat.SetItem( i, "active_status", 0 )
//		lds_appt_staff_cat.SetItem( lds_appt_staff_cat.RowCount(), "rec_id", ll_new_rec_id )
//		lds_appt_staff_cat.SetItem( lds_appt_staff_cat.RowCount(), "from_date", nulldate )
//		lds_appt_staff_cat.SetItem( lds_appt_staff_cat.RowCount(), "to_date", nulldate )
//		lds_appt_staff_cat.SetItem( lds_appt_staff_cat.RowCount(), "active_status", 1 )
//		lds_appt_staff_cat.SetItem( lds_appt_staff_cat.RowCount(), "seq_no", li_seq_no )
//	END FOR
//END IF
//
////department info
//lds_appt_dept = CREATE n_ds
//lds_appt_dept.DataObject = "d_pd_affil_departments"
//lds_appt_dept.of_SetTransObject( SQLCA )
//li_row_cnt = lds_appt_dept.Retrieve( ll_rec_id )
//IF li_row_cnt > 0 THEN
//	lds_appt_dept.SetSort("seq_no")
//	lds_appt_dept.Sort()
//	li_seq_no = lds_appt_dept.GetItemNumber( li_row_cnt , "seq_no" )	
//	FOR i = 1 TO li_row_cnt
//		li_seq_no++
//		lds_appt_dept.RowsCopy( i, i, Primary!, lds_appt_dept, 1000, Primary! )
//		lds_appt_dept.SetItem( i, "active_status", 0 )
//		lds_appt_dept.SetItem( lds_appt_dept.RowCount(), "rec_id", ll_new_rec_id )		
//		lds_appt_dept.SetItem( lds_appt_dept.RowCount(), "active_status", 1 )
//		lds_appt_dept.SetItem( lds_appt_dept.RowCount(), "seq_no", li_seq_no )		
//	END FOR
//END IF
//
////credentialing review commitee(s)
//lds_appt_comms = CREATE n_ds
//lds_appt_comms.DataObject = "d_pd_comm_review"
//lds_appt_comms.of_SetTransObject( SQLCA )
//li_row_cnt = lds_appt_comms.Retrieve( ll_rec_id,gs_user_id )
//IF li_row_cnt > 0 THEN
//	lds_appt_comms.SetSort( "seq_no" )
//	lds_appt_comms.Sort()
//	li_seq_no = lds_appt_comms.GetItemNumber( li_row_cnt , "seq_no" )	
//	FOR i = 1 TO li_row_cnt
//		li_seq_no++				
//		lds_appt_comms.RowsCopy( i, i, Primary!, lds_appt_comms, 1000, Primary! )
//		lds_appt_comms.SetItem( i, "active_status", 0 )
//		lds_appt_comms.SetItem( lds_appt_comms.RowCount(), "rec_id", ll_new_rec_id )		
//		lds_appt_comms.SetItem( lds_appt_comms.RowCount(), "active_status", 1 )
//		lds_appt_comms.SetItem( lds_appt_comms.RowCount(), "review_results", nullint )		
//		lds_appt_comms.SetItem( lds_appt_comms.RowCount(), "date_back_from_review", nulldate )		
//		lds_appt_comms.SetItem( lds_appt_comms.RowCount(), "date_sent_for_review", nulldate )
//		lds_appt_comms.SetItem( lds_appt_comms.RowCount(), "seq_no", li_seq_no )				
//	END FOR
//END IF
//
////leave info
//lds_appt_leave = CREATE n_ds
//lds_appt_leave.DataObject = "d_pd_affil_leave"
//lds_appt_leave.of_SetTransObject( SQLCA )
//li_row_cnt = lds_appt_leave.Retrieve( ll_rec_id )
//IF li_row_cnt > 0 THEN
//	lds_appt_leave.SetSort("seq_no")
//	lds_appt_leave.Sort()
//	li_seq_no = lds_appt_leave.GetItemNumber( li_row_cnt , "seq_no" )	
//	FOR i = 1 TO li_row_cnt
//		li_seq_no++
//		lds_appt_leave.RowsCopy( i, i, Primary!, lds_appt_leave, 1000, Primary! )
//		lds_appt_leave.SetItem( i, "active_status", 0 )
//		lds_appt_leave.SetItem( lds_appt_leave.RowCount(), "rec_id", ll_new_rec_id )		
//		lds_appt_leave.SetItem( lds_appt_leave.RowCount(), "active_status", 1 )
//		lds_appt_leave.SetItem( lds_appt_leave.RowCount(), "seq_no", li_seq_no )		
//	END FOR
//END IF
//
//
////add app audit list
//
////check to see if security is installed, if it is not then give access to new view
//
//IF ls_version = "None" THEN
//	MessageBox("Error", "Version number not setup.")
//	RETURN -1
//END IF
//
////app audit
//IF MID( ls_version, 11, 1) <> "4" THEN
//	RETURN 0
//END IF
//
//
//ldw_audit = CREATE n_ds
//ldw_audit.DataObject = "d_pd_app_audit_rqrd_data"
//ldw_audit.of_SetTransObject( SQLCA )
//
//ldw_rqrd_data = CREATE n_ds
//ldw_rqrd_data.DataObject = "d_app_audit_rqrd_data"
//ldw_rqrd_data.of_SetTransObject( SQLCA )
//
//li_row_cnt = ldw_rqrd_data.Retrieve( li_audit_facility_id, 'R' )
//
//lds_last_app_audit_seq_no = CREATE n_ds
//lds_last_app_audit_seq_no.DataObject = "d_last_app_audit_seq_no"
//lds_last_app_audit_seq_no.of_SetTransObject( SQLCA )
//
//FOR i = 1 TO li_row_cnt
//	ldw_audit.InsertRow( 0 )
//	ll_record_id = gnv_app.of_get_id("RECORD_ID")
//	ll_app_audit_id = ldw_rqrd_data.GetItemNumber( i, "app_audit_id" )
//	ldw_audit.SetItem( i, "rec_id", ll_record_id )
//	ldw_audit.SetItem( i, "appt_stat_id", ll_appt_stat_id )
//	ldw_audit.SetItem( i, "prac_id", ll_prac_id )
//	ldw_audit.SetItem( i, "facility_id", li_parent_facility_id )
//	ldw_audit.SetItem( i, "app_audit_id", ll_app_audit_id )
//
//	//find out the last seq no used
//	li_seq_row_cnt = lds_last_app_audit_seq_no.Retrieve( ll_app_audit_id, ll_prac_id, li_audit_facility_id )	
//	IF li_seq_row_cnt < 1 THEN
//		li_seq_no = 1 
//	ELSE
//		li_seq_no = lds_last_app_audit_seq_no.GetItemNumber( 1, "last_seq_no" ) + 1
//	END IF	
//	
//	ldw_audit.SetItem( i, "seq_no", li_seq_no	) 		
//	ldw_audit.SetItem( i, "active_status", 1 )
//	ldw_audit.SetItem( i, "pd_app_audit_fax_message", ldw_rqrd_data.GetItemString( i, "fax_description" )	) 	
//	ldw_audit.SetItem( i, "description", ldw_rqrd_data.GetItemString( i, "description" )	) 		
//END FOR
//
//
//
//
//
//SELECT code_lookup.lookup_code  
//INTO :ll_response_code  
//FROM code_lookup  
//WHERE code_lookup.code = 'APP-RCVD'   ;
//
////update the action item record
//SELECT code_lookup.lookup_code  
//INTO :ll_exp_appt_ltr  
//FROM code_lookup  
//WHERE code_lookup.code = 'Exp Appt Ltr';
////messagebox("ll_exp_appt_ltr",ll_exp_appt_ltr)
//
//ldw_action_items = CREATE n_ds
//ldw_action_items.DataObject = "d_exp_appt_verif"
//ldw_action_items.of_SetTransObject( SQLCA )
////messagebox("ll_prac_id",ll_prac_id)
////messagebox("li_parent_facility_id",li_parent_facility_id)
//ldw_action_items.retrieve(ll_prac_id,li_parent_facility_id,ll_exp_appt_ltr)
//li_action_item_row = ldw_action_items.RowCount()
////messagebox("li_action_item_row",li_action_item_row)
//IF ldw_action_items.RowCount() > 0 THEN
//	if isnull(ldw_action_items.getItemdatetime( li_action_item_row, "date_recieved")) then
//		ldw_action_items.SetItem( li_action_item_row, "user_name", gnv_app.of_getuserid() )
//		ldw_action_items.SetItem( li_action_item_row, "date_recieved", Today() )
//	end if
//	ldw_action_items.SetItem( li_action_item_row, "response_code", ll_response_code  )
//	ldw_action_items.SetItem( li_action_item_row, "active_status", 0 )
//END IF
//
//
//IF lds_appt_stat.Update ( True, False ) = 1 THEN						
//	IF lds_appt_staff_cat.Update ( True, False ) = 1 THEN
//		IF lds_appt_dept.Update ( True, False ) = 1 THEN
//			IF lds_appt_comms.Update ( True, False ) = 1 THEN						
//				IF lds_appt_leave.Update ( True, False ) = 1 THEN													
//					IF ldw_action_items.Update ( True, False ) = 1 THEN						
//						IF ldw_audit.Update( True, False) = 1 THEN									
//							//Open up window with new appointment status information
//							gl_facility_id = li_parent_facility_id
//							gl_prac_id = ll_prac_id
//							gs_param = "REAPP"
//							Open( w_back_from_committee )
//							IF Message.StringParm = "Cancel" THEN
//								ROLLBACK USING SQLCA;
//								RETURN -1
//							END IF
//								//Commit all changes
//								COMMIT USING SQLCA;
//								ldw_action_items.ResetUpdate()
//								lds_appt_staff_cat.ResetUpdate()
//								lds_appt_dept.ResetUpdate()
//								lds_appt_stat.ResetUpdate()
//								lds_appt_comms.ResetUpdate()
//								lds_appt_leave.ResetUpdate()
//								ldw_audit.ResetUpdate()
//								ldw_rqrd_data.ResetUpdate()
//								lds_last_app_audit_seq_no.ResetUpdate()
//								update verif_info set active_status = 0 where screen_id = 1 and prac_id = :ll_prac_id;
//								commit using sqlca;		
//								Return 1
//							
//								ELSE
//								MessageBox("Update Failed", "Update during initiation of recredentialing query failed. (ldw_app_audit)")
//								ROLLBACK USING SQLCA;
//								return -1	
//							END IF
//						ELSE
//							MessageBox("Update Failed", "Update during initiation of recredentialing query failed. (ldw_action_items)")
//							ROLLBACK USING SQLCA;
//							Return -1																								
//						END IF
//					ELSE
//						MessageBox("Update Failed", "Update during initiation of recredentialing query failed. (lds_appt_leave)")
//						ROLLBACK USING SQLCA;
//						Return -1																								
//					END IF
//				ELSE
//					MessageBox("Update Failed", "Update during initiation of recredentialing query failed. (lds_appt_comms)")
//					ROLLBACK USING SQLCA;
//					Return -1																	
//				END IF
//			ELSE
//				MessageBox("Update Failed", "Update during initiation of recredentialing query failed. (lds_appt_dept)")
//				ROLLBACK USING SQLCA;
//				Return -1										
//
//			END IF
//		ELSE
//			MessageBox("Update Failed", "Update during initiation of recredentialing query failed. (lds_appt_staff_cat)")
//			ROLLBACK USING SQLCA;
//			Return -1
//		END IF
//	ELSE
//		MessageBox("Update Failed", "Update during initiation of recredentialing query failed. (lds_appt_stat)")
//		ROLLBACK USING SQLCA;
//		Return -1	
//	
//END IF
//
//DESTROY lds_last_app_audit_seq_no
//DESTROY ldw_rqrd_data
//DESTROY ldw_audit
//
//DESTROY ldw_action_items
//
//DESTROY lds_appt_dept
//DESTROY lds_appt_comms
//DESTROY lds_appt_stat
//DESTROY lds_appt_staff_cat
//DESTROY lds_appt_leave
//
//
RETURN 0
end function

public function integer of_start_reappointment_processing (u_dw adw_ver_copy, u_dw adw_action_items, integer ai_parent_facility, long al_prac_id, string as_ver_type);
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-09
//$<modify> 02.16.2006 By: LeiWei
//$<reason> Performance tuning
//$<modification> Define datastores for caching data.

/*
n_ds lds_last_app_audit_seq_no
n_ds 
n_ds lds_appt_dept
n_ds lds_appt_comms
n_ds lds_appt_leave
n_ds lds_appt_staff_cat
*/

//datastore lds_last_app_audit_seq_no
//datastore ldw_rqrd_data
datastore lds_appt_dept
datastore lds_appt_comms
datastore lds_appt_leave
datastore lds_appt_staff_cat
Long ll_verif_info_maxseqno
//---------------------------- APPEON END ----------------------------
datawindow ldw_audit
n_ds lds_reapp
//n_ds lds_reapp_copy
n_ds lds_action_items
n_ds lds_exp_copy
n_ds lds_appt_stat

Long ll_seq_row_cnt
Integer ll_exp_appt_ltr  
Integer li_retval
Long li_row_cnt
Integer i
integer t //maha 110800
integer trows //maha 110800
Long ll_seq_no
Integer li_nr
Integer nullint
Integer li_action_item_row
long li_parent_facility_id
long li_audit_facility_id
long li_verif_facility_id
Integer li_facility_row_cnt
integer li_set23 //maha 121602
integer li_set32 //maha 121602
integer li_no_copy  = 0//maha 030304

String ls_version
String ls_doc_id
String ls_rec_id
string ls_assn_user  //Start Code Change ---- 10.03.2006 #640 maha

Long ll_appt_stat_id
//Long ll_prac_id
Long ll_rec_id
Long ll_new_rec_id
Long ll_new_ver_method
Long ll_response_code  
Long ll_record_id
Long ll_app_audit_id
long ll_test1 //maha 110800
long ll_test2 //maha 110800

DateTime nulldate
DateTime dt_cust4
DateTime dt_prior_start
DateTime dt_prior_end


SetNull( nullint )
SetNull( nulldate )

adw_ver_copy.AcceptText()

//create appointment store
lds_appt_stat = CREATE n_ds
lds_appt_stat.DataObject = "d_pd_affil_status"
lds_appt_stat.of_SetTransObject( SQLCA )

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-10
//$<add> 02.17.2006 By: LeiWei
//$<reason> Performance tuning
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.
 
gnv_appeondb.of_startqueue( )
//---------------------------- APPEON END ----------------------------

datawindowchild dwchild
lds_appt_stat.GetChild( "parent_facility_id", dwchild )
dwchild.settransobject(sqlca)
dwchild.retrieve(gs_user_id)
lds_appt_stat.GetChild( "verifying_facility", dwchild )
dwchild.settransobject(sqlca)
dwchild.retrieve(gs_user_id)
lds_appt_stat.Retrieve( al_prac_id, ai_parent_facility,gs_user_id )

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-11
//$<add> 02.17.2006 By: LeiWei
//$<reason> Performance tuning
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

gnv_appeondb.of_commitqueue( )
li_row_cnt = lds_appt_stat.rowcount()
//---------------------------- APPEON END ----------------------------

//filter only active record
lds_appt_stat.SetFilter( "active_status = 1" )
lds_appt_stat.Filter( )

if lds_appt_stat.rowcount() < 1 then //maha 010303
	messagebox("Status Error","Unable to find ACTIVE appointment record for this practitioner and facility.~n The active status of the practitioner's Appointment record must be set to Active to complete the recredentialing process")
	return -1
end if 
//get verifiying facility
li_verif_facility_id = lds_appt_stat.GetItemNumber( 1, "verifying_facility" )

//\/******************* Verification creation *************************************
//create verif store
if as_ver_type <> "NOVER" then
	lds_reapp = CREATE n_ds
	lds_reapp.DataObject = adw_ver_copy.DataObject //adw_ver_copy should be d_copy_verification
	lds_reapp.of_SetTransObject( SQLCA )
	adw_ver_copy.ShareData( lds_reapp )
	//ll_prac_id = al_prac_id
	//messagebox("",gl_prac_id)
	//return -1
	
	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> PT-12
	//$<comment> 02.16.2006 By: LeiWei
	//$<reason> Performance tuning
	//$<modification> Move the following script to PT-10. It is integrated with other SQL statements
	//$<modification> into Appeon Queue labels to reduce client-server interactions.
	/*
	li_row_cnt = lds_appt_stat.Retrieve( al_prac_id, ai_parent_facility,gs_user_id )
	*/
	//---------------------------- APPEON END ----------------------------
	
//	//create store to update active status this is lds_reapp without and deleted duplicates from other facilities 
//	lds_reapp_copy = CREATE n_ds
//	lds_reapp_copy.DataObject = "d_copy_verification"
//	lds_reapp_copy.of_SetTransObject( SQLCA )
//	li_retval = lds_reapp.RowsCopy(1,lds_reapp.rowcount() , Primary!, lds_reapp_copy, 100000, Primary!)
//	IF li_retval = -1 THEN
//		Messagebox("Error","Error copying to lds_reapp_copy")
//		Return -1
//	END IF
	//create copy store
	lds_exp_copy = CREATE n_ds
	lds_exp_copy.DataObject = "d_copy_verification"
	lds_exp_copy.of_SetTransObject( SQLCA )
	
	li_row_cnt = lds_reapp.RowCount()
	
	IF li_row_cnt = 0 THEN
		Return 0
	END IF

	//\/maha 110800 to test for duplicate verifications
	trows = li_row_cnt
	FOR i = 1 TO li_row_cnt //test for duplicate verifications
		IF lds_reapp.GetItemNumber( i, "selected" ) = 1 THEN
			ll_test1 = lds_reapp.GetItemNumber( i, "rec_id" )
			for t = 1 to trows
				IF lds_reapp.GetItemNumber( t, "selected" ) = 1 THEN
					ll_test2 = lds_reapp.GetItemNumber( t, "rec_id" )
					if i <> t and ll_test1 = ll_test2 then
						messagebox("Copy Error","There are duplicate records selected for reverification.~n~rPlease deselect the duplicates")
						return 0
					end if
				end if
			next
		end if
	next
	//\maha

	//<add> 06/27/2007 by: Andy set sort first
	lds_reapp.setsort("rec_id A, facility_id A")
	lds_reapp.sort()
	
	Long    ll_rec_id_first      = -1
	Integer li_facility_id_first = -1
	//end of add

	ll_seq_no = 0
	FOR i = 1 TO li_row_cnt   
		if lds_reapp.GetItemNumber( i, "facility_id" ) = li_verif_facility_id then //maha 011603 only reset active status if is the same facility
			lds_reapp.SetItem( i, "active_status", 0 )
		end if
		//if credential has (not) been selected then it does not have to be reverified
		IF lds_reapp.GetItemNumber( i, "selected" ) = 0 THEN	
			CONTINUE
		END IF
		li_retval = lds_reapp.RowsCopy(i, i, Primary!, lds_exp_copy, 100000, Primary!)
		IF li_retval = -1 THEN
			Messagebox("Error","Error copying record")
			Return -1
		END IF
		//get just copied row number
		li_nr = lds_exp_copy.RowCount()
	
		ll_rec_id = lds_exp_copy.GetItemNumber( li_nr, "rec_id" ) 
		
		//<add> 06/27/2007 by: Andy fixed a bug. 
		//attention:set sort first
		if ll_rec_id_first = ll_rec_id and li_facility_id_first = li_verif_facility_id then 
			ll_seq_no++
		else
		//end of add
		//--------------------------- APPEON BEGIN ---------------------------
		//$<ID> PT-13
		//$<modify> 02.21.2006 By: LeiWei
		//$<reason> Performance tuning
		//$<modification> Add a condition to make the application get the maximum value of
		//$<modification> ll_seq_no from database only in the first time when the following loop runs.
		/*
		The changed logic is incorrect.  The seq_no should be the max for practitioner/facility combination only.
		Changed back to original code. //Start Code Change ---- 10.03.2006 #641 maha
		*/
			SELECT Max( seq_no )  
			INTO :ll_seq_no  
			FROM verif_info  
			WHERE verif_info.rec_id = :ll_rec_id  and facility_id = :li_verif_facility_id; 
		
			/*
			IF ll_seq_no = 0 THEN
				SELECT Max( seq_no )  
				INTO :ll_seq_no  
				FROM verif_info;
			END IF
			*/
			//---------------------------- APPEON END ----------------------------
	
			if isnull(ll_seq_no) then ll_seq_no = 0
			ll_seq_no++
			//<add> 06/27/2007 by: Andy
			ll_rec_id_first = ll_rec_id
			li_facility_id_first = li_verif_facility_id
		end if
		//end of add
	
		lds_exp_copy.SetItem( li_nr , "facility_id", li_verif_facility_id )
		lds_exp_copy.SetItem( li_nr , "seq_no", ll_seq_no )
		lds_exp_copy.SetItem( li_nr, "first_sent", nulldate )
		lds_exp_copy.SetItem( li_nr, "last_sent", nulldate )
		lds_exp_copy.SetItem( li_nr, "number_sent", 0 )
		lds_exp_copy.SetItem( li_nr, "date_recieved", nulldate )
		lds_exp_copy.SetItem( li_nr, "user_name", "" )
		lds_exp_copy.SetItem( li_nr, "response_code", nullint )
		//lds_exp_copy.SetItem( li_nr, "priority_user", "PUBLIC" ) //removed 010703
		lds_exp_copy.SetItem( li_nr, "priority", 2 )
		lds_exp_copy.SetItem( li_nr, "exp_credential_flag", 0)
		//find out what the user has selected for the new verificatin method
		ll_new_ver_method = lds_reapp.GetItemNumber( i, "new_verification_method" )
		lds_exp_copy.SetItem( li_nr, "verification_method", ll_new_ver_method )
		//concantenate doc_id
		ls_doc_id = String(ll_rec_id) + "-" + string(al_prac_id) + "-" + string(li_verif_facility_id) + "-" + string(ll_seq_no)
		lds_exp_copy.SetItem( li_nr, "doc_id", ls_doc_id )
		lds_exp_copy.SetItem( li_nr, "print_flag", 1 )
		//make current verif entry inactive
		lds_exp_copy.SetItem( li_nr, "verif_info_notes", "" ) // added 092800 maha
		lds_exp_copy.SetItem( li_nr, "active_status", 1 )
	END FOR
END IF	
//\******************* end of verification creation *************************************




	
li_parent_facility_id = ai_parent_facility


lds_appt_stat.SetItem( 1, "active_status", 0 )
//grab the last sequence number
ll_seq_no = lds_appt_stat.GetItemNumber( 1, "seq_no" )
ll_rec_id = lds_appt_stat.GetItemNumber( 1, "rec_id" )
//grab the audit and verifying and app audit facility id(s)
li_audit_facility_id = lds_appt_stat.GetItemNumber( 1, "application_audit_facility" )
li_verif_facility_id = lds_appt_stat.GetItemNumber( 1, "verifying_facility" )
dt_prior_start = lds_appt_stat.GetItemdatetime( 1, "apptmnt_start_date" )
dt_prior_end = lds_appt_stat.GetItemdatetime( 1, "apptmnt_end_date" )
//get a new record id
ll_new_rec_id = gnv_app.of_get_id("RECORD_ID")

//Start Code Change ---- 10.03.2006 #642 maha
select reap_user into :i from facility where facility_id = :li_parent_facility_id;
if isnull(i) then i = 0
choose case i
	case 0 //default
		ls_assn_user = "PUBLIC"
	case 1 //copy
		ls_assn_user = lds_appt_stat.GetItemstring( 1, "priority_user" )
	case 2 //current user
		ls_assn_user = gs_user_id
end choose
//End Code Change---10.03.2006

ll_appt_stat_id = ll_new_rec_id
//add a new row to appointment status
li_nr = lds_appt_stat.InsertRow( 0 )
lds_appt_stat.SetItem( li_nr, "rec_id", ll_new_rec_id )
lds_appt_stat.SetItem( li_nr, "prac_id", al_prac_id )
lds_appt_stat.SetItem( li_nr, "parent_facility_id", li_parent_facility_id )
ll_seq_no++
lds_appt_stat.SetItem( li_nr, "seq_no", ll_seq_no )
lds_appt_stat.SetItem( li_nr, "verifying_facility", li_verif_facility_id )
lds_appt_stat.SetItem( li_nr, "application_audit_facility", li_audit_facility_id )
lds_appt_stat.SetItem( li_nr, "apptmnt_type", "R" )
lds_appt_stat.SetItem( li_nr, "affiliation_status", lds_appt_stat.GetItemstring( 1, "affiliation_status" ) )//maha 112102
lds_appt_stat.SetItem( li_nr, "inital_appmnt_date", lds_appt_stat.GetItemdatetime( 1, "inital_appmnt_date" ) )//maha 112102
lds_appt_stat.SetItem( li_nr, "prior_appt_start", dt_prior_start )//maha 071403
lds_appt_stat.SetItem( li_nr, "prior_appt_end", dt_prior_end )//maha 071403
lds_appt_stat.SetItem( li_nr, "prov_status", 0 )//maha 092303
lds_appt_stat.SetItem( li_nr, "admit_priv", lds_appt_stat.GetItemnumber( 1, "admit_priv" ) )  //Start Code Change ---- 05.14.2007 #V7 maha
lds_appt_stat.SetItem( li_nr, "priority_user", ls_assn_user ) //Start Code Change ---- 10.03.2006 #643 maha

//SELECT set_23 INTO :li_set23 FROM icred_settings;
li_set23 = of_get_app_setting("set_23","I")
IF li_set23 = 1 THEN
	dt_cust4 =  lds_appt_stat.GetItemdatetime( 1, "custom_4" ) //maha 121602 lij
	lds_appt_stat.SetItem( li_nr, "custom_4",dt_cust4 )
end if

//staff category
//SELECT set_32 INTO :li_set32 FROM icred_settings; //inova rules maha 092303
li_set32 = of_get_app_setting("set_32","I")

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-14
//$<add> 02.21.2006 By: LeiWei
//$<reason> Performance tuning
//$<modification> Integrate the SQL statements in the following script and integrate
//$<modification> them into Appeon Queue labels to reduce client-server interactions.
//$<modification> Refer to PT-15/16/17/18 for more information.

lds_appt_staff_cat = CREATE datastore
lds_appt_staff_cat.DataObject = "d_pd_affil_staff_cat"
lds_appt_staff_cat.SetTransObject( SQLCA )

//department info
lds_appt_dept = CREATE datastore
lds_appt_dept.DataObject = "d_pd_affil_departments"
lds_appt_dept.SetTransObject( SQLCA )

//credentialing review commitee(s)
lds_appt_comms = CREATE datastore
lds_appt_comms.DataObject = "d_pd_comm_review"
lds_appt_comms.SetTransObject( SQLCA )

//leave info
lds_appt_leave = CREATE datastore
lds_appt_leave.DataObject = "d_pd_affil_leave"
lds_appt_leave.SetTransObject( SQLCA )

gnv_appeondb.of_startqueue( )

lds_appt_staff_cat.Retrieve( ll_rec_id,gs_user_id )
lds_appt_dept.Retrieve( ll_rec_id,gs_user_id )
lds_appt_comms.Retrieve( ll_rec_id, gs_user_id )
lds_appt_leave.Retrieve( ll_rec_id, gs_user_id )

gnv_appeondb.of_commitqueue( )

//---------------------------- APPEON END ----------------------------

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-15
//$<modify> 02.21.2006 By: LeiWei
//$<reason> Performance tuning
//$<modification> Move the following script to PT-14 and it is integrate with
//$<modification> other SQLs into Appeon labels to reduce client-server interactions.

/*
lds_appt_staff_cat = CREATE n_ds
lds_appt_staff_cat.DataObject = "d_pd_affil_staff_cat"
lds_appt_staff_cat.of_SetTransObject( SQLCA )
li_row_cnt = lds_appt_staff_cat.Retrieve( ll_rec_id,gs_user_id )
*/

li_row_cnt = lds_appt_staff_cat.Rowcount( )

//---------------------------- APPEON END ----------------------------

IF li_row_cnt > 0 THEN
	lds_appt_staff_cat.SetSort("seq_no")
	lds_appt_staff_cat.Sort()
	ll_seq_no = lds_appt_staff_cat.GetItemNumber( li_row_cnt , "seq_no" )
	FOR i = 1 TO li_row_cnt
		ll_seq_no++
		li_no_copy = 0
		//code rearranged 030304 maha
		//copy all records unless setting is 1 and the record is inactive
		//traditional method clears dates and set to active requested
		//set to 1 (inova) leaves dates and checks the values of the requested status
		IF li_set32 = 1 THEN //inova
			if lds_appt_staff_cat.getItemnumber( i, "requested" ) = 0 then //dont copy inactive maha 081403
				li_no_copy = 1
			end if
		end if
		if li_no_copy = 0 then
			lds_appt_staff_cat.RowsCopy( i, i, Primary!, lds_appt_staff_cat, 1000, Primary! )
			lds_appt_staff_cat.SetItem( i, "active_status", 0 )
			lds_appt_staff_cat.SetItem( lds_appt_staff_cat.RowCount(), "rec_id", ll_new_rec_id )
			
			lds_appt_staff_cat.SetItem( lds_appt_staff_cat.RowCount(), "active_status", 1 )
			lds_appt_staff_cat.SetItem( lds_appt_staff_cat.RowCount(), "seq_no", ll_seq_no )
			if li_set32 < 1 then //standard method null dates
				lds_appt_staff_cat.SetItem( lds_appt_staff_cat.RowCount(), "from_date", nulldate )
				lds_appt_staff_cat.SetItem( lds_appt_staff_cat.RowCount(), "to_date", nulldate )
				lds_appt_staff_cat.SetItem( lds_appt_staff_cat.RowCount(), "requested", 1 )
		
			elseif li_set32 = 1 then  //inova requested rules maha 092303
				if not isnull(lds_appt_staff_cat.GetItemdatetime( i , "to_date" )) then
					lds_appt_staff_cat.SetItem( lds_appt_staff_cat.RowCount(), "requested", 0 ) //history
				elseif not isnull(lds_appt_staff_cat.GetItemdatetime( i , "from_date" )) then
					lds_appt_staff_cat.SetItem( lds_appt_staff_cat.RowCount(), "requested", 1 ) //active
				else
					lds_appt_staff_cat.SetItem( lds_appt_staff_cat.RowCount(), "requested", 2 ) //requested
				end if
			end if
		end if
			
	END FOR
END IF


//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-16
//$<modify> 02.21.2006 By: LeiWei
//$<reason> Performance tuning
//$<modification> Move the following script to PT-14 and it is integrate with
//$<modification> other SQLs into Appeon labels to reduce client-server interactions.

/*
//department info
lds_appt_dept = CREATE n_ds
lds_appt_dept.DataObject = "d_pd_affil_departments"
lds_appt_dept.of_SetTransObject( SQLCA )
li_row_cnt = lds_appt_dept.Retrieve( ll_rec_id,gs_user_id )
*/

li_row_cnt = lds_appt_dept.Rowcount( )

//---------------------------- APPEON END ----------------------------

IF li_row_cnt > 0 THEN
	lds_appt_dept.SetSort("seq_no")
	lds_appt_dept.Sort()
	ll_seq_no = lds_appt_dept.GetItemNumber( li_row_cnt , "seq_no" )	
	FOR i = 1 TO li_row_cnt
		ll_seq_no++
		lds_appt_dept.RowsCopy( i, i, Primary!, lds_appt_dept, 1000, Primary! )
		lds_appt_dept.SetItem( i, "active_status", 0 )
		lds_appt_dept.SetItem( lds_appt_dept.RowCount(), "rec_id", ll_new_rec_id )		
		lds_appt_dept.SetItem( lds_appt_dept.RowCount(), "active_status", 1 )
		lds_appt_dept.SetItem( lds_appt_dept.RowCount(), "seq_no", ll_seq_no )		
	END FOR
END IF

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-17
//$<modify> 02.21.2006 By: LeiWei
//$<reason> Performance tuning
//$<modification> Move the following script to PT-14 and it is integrate with
//$<modification> other SQLs into Appeon labels to reduce client-server interactions.

/*
//credentialing review commitee(s)
lds_appt_comms = CREATE n_ds
lds_appt_comms.DataObject = "d_pd_comm_review"
lds_appt_comms.of_SetTransObject( SQLCA )
li_row_cnt = lds_appt_comms.Retrieve( ll_rec_id, gs_user_id )
*/

li_row_cnt = lds_appt_comms.Rowcount( )

//---------------------------- APPEON END ----------------------------

IF li_row_cnt > 0 THEN
	lds_appt_comms.SetSort( "seq_no" )
	lds_appt_comms.Sort()
	ll_seq_no = lds_appt_comms.GetItemNumber( li_row_cnt , "seq_no" )	
	FOR i = 1 TO li_row_cnt
		ll_seq_no++				
		lds_appt_comms.RowsCopy( i, i, Primary!, lds_appt_comms, 1000, Primary! )
		lds_appt_comms.SetItem( i, "active_status", 0 )//set org record to history
		lds_appt_comms.SetItem( lds_appt_comms.RowCount(), "rec_id", ll_new_rec_id )		
		lds_appt_comms.SetItem( lds_appt_comms.RowCount(), "active_status", 1 )
		lds_appt_comms.SetItem( lds_appt_comms.RowCount(), "review_results", nullint )		
		lds_appt_comms.SetItem( lds_appt_comms.RowCount(), "date_back_from_review", nulldate )		
		lds_appt_comms.SetItem( lds_appt_comms.RowCount(), "date_sent_for_review", nulldate )
		lds_appt_comms.SetItem( lds_appt_comms.RowCount(), "seq_no", ll_seq_no )				
	END FOR
END IF

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-18
//$<modify> 02.21.2006 By: LeiWei
//$<reason> Performance tuning
//$<modification> Move the following script to PT-14 and it is integrate with
//$<modification> other SQLs into Appeon labels to reduce client-server interactions.

/*
//leave info
lds_appt_leave = CREATE n_ds
lds_appt_leave.DataObject = "d_pd_affil_leave"
lds_appt_leave.of_SetTransObject( SQLCA )
li_row_cnt = lds_appt_leave.Retrieve( ll_rec_id, gs_user_id )
*/

li_row_cnt = lds_appt_leave.Rowcount( )

//---------------------------- APPEON END ----------------------------

IF li_row_cnt > 0 THEN
	lds_appt_leave.SetSort("seq_no")
	lds_appt_leave.Sort()
	ll_seq_no = lds_appt_leave.GetItemNumber( li_row_cnt , "seq_no" )	
	FOR i = 1 TO li_row_cnt
		ll_seq_no++
		lds_appt_leave.RowsCopy( i, i, Primary!, lds_appt_leave, 1000, Primary! )
		lds_appt_leave.SetItem( i, "active_status", 0 )
		lds_appt_leave.SetItem( lds_appt_leave.RowCount(), "rec_id", ll_new_rec_id )		
		lds_appt_leave.SetItem( lds_appt_leave.RowCount(), "active_status", 1 )
		lds_appt_leave.SetItem( lds_appt_leave.RowCount(), "seq_no", ll_seq_no )		
	END FOR
END IF

//add app audit list

//check to see if security is installed, if it is not then give access to new view
//ls_version = ProfileString(gs_IniFilePathName, "setup", "version", "None")
ls_version = "EE448738514625"

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-19
//$<modify> 01.17.2006 By: Cao YongWang
//$<reason> There is no need to have the Web application read local INI files. The Web application
//$<reason> reads INI files from Web server.
//$<modification> Write the following script to make sure that when IntelliCred is running on the Web, it
//$<modification> does not read local INI files.
//IF NOT FileExists( gs_dir_path + gs_DefDirName + "\intellicred.ini" ) THEN
//	MessageBox("ini File Error", "No intellicred.ini file found at: " + gs_dir_path + gs_DefDirName + "\intellicred.ini" )
//	Return -1
//END IF
If appeongetclienttype() = 'PB' Then 
	IF NOT FileExists(gs_IniFilePathName) THEN
		//--------------------------- APPEON BEGIN ---------------------------
		//$<modify> 2007.08.31 By: Jack
		//$<reason> Fix a defect.
		/*
		MessageBox("ini File Error", "No intellicred.ini file found at: " + gs_IniFilePathName )
		*/
		MessageBox("INI File Error", "No intellicred.ini file was found at: " + gs_IniFilePathName )
		//---------------------------- APPEON END ----------------------------
		Return -1
	END IF
End If
//---------------------------- APPEON END ----------------------------

//IF ls_version = "None" THEN
//	//$<modify> 2007.08.31 By: Jack
//	//$<reason> Fix a defect.
//	/*
//	MessageBox("Error", "Version number not setup.")
//	*/
//	MessageBox("Error", "Version number was not setup.")
//	//---------------------------- APPEON END ----------------------------
//	RETURN -1
//END IF
//
////app audit
//IF MID( ls_version, 11, 1) <> "4" THEN
//	RETURN 0
//END IF


ldw_audit = CREATE datawindow
ldw_audit.DataObject = "d_pd_app_audit_rqrd_data"
ldw_audit.SetTransObject( SQLCA )

//Start Code Change ---- 10.30.2006 #1 maha remved functionality for creation of App audit items from this function
/*@@@@@@@@@@@@@@@APP AUDIT

	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> PT-20
	//$<modify> 02.16.2006 By: LeiWei
	//$<reason> Performance tuning
	//$<modification> Copy the script from the following loop. This changes
	//$<modification> is based on the pre-select data approach.

	/*
	ldw_rqrd_data = CREATE n_ds
	ldw_rqrd_data.DataObject = "d_app_audit_rqrd_data"
	ldw_rqrd_data.of_SetTransObject( SQLCA )

	li_row_cnt = ldw_rqrd_data.Retrieve( li_audit_facility_id, 'R' )
	
	lds_last_app_audit_seq_no = CREATE n_ds
	lds_last_app_audit_seq_no.DataObject = "d_last_app_audit_seq_no"
	lds_last_app_audit_seq_no.of_SetTransObject( SQLCA )
	*/

	ldw_rqrd_data = CREATE datastore
	ldw_rqrd_data.DataObject = "d_app_audit_rqrd_data"
	ldw_rqrd_data.SetTransObject( SQLCA )
	li_row_cnt = ldw_rqrd_data.Retrieve( li_audit_facility_id, 'R' )

	Long ll_app_audit_id_arr[]
	FOR i = 1 TO li_row_cnt
		ll_app_audit_id = ldw_rqrd_data.GetItemNumber( i, "app_audit_id" )
		ll_app_audit_id_arr[i] = ll_app_audit_id
	NEXT

	lds_last_app_audit_seq_no = CREATE datastore
	lds_last_app_audit_seq_no.DataObject = "d_last_app_audit_seq_no_forpt"
	lds_last_app_audit_seq_no.SetTransObject( SQLCA )
	lds_last_app_audit_seq_no.Retrieve( ll_app_audit_id_arr, al_prac_id ,li_audit_facility_id)	
	//---------------------------- APPEON END ----------------------------


//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-28
//$<add> 02.17.2006 By: LeiWei
//$<reason> Performance tuning
//$<modification> Define a variable to 1)get the first ID; 2)Update the final ID
//$<modification> value into database.
ll_record_id = gnv_app.of_get_id("RECORD_ID" , li_row_cnt) - 1
//---------------------------- APPEON END ----------------------------
FOR i = 1 TO li_row_cnt
	//--------------------------- APPEON BEGIN ---------------------------
	//$<modify> 10.17.2006 By: Jack (Inova)
	//$<reason> Required Documents Check Box on Data Entry Screen.
	/*
	ldw_audit.InsertRow( 0 )
	*/
	integer li_auto_generate,li_row
	li_auto_generate = ldw_rqrd_data.getitemnumber(i,'auto_generate')
	if li_auto_generate = 1 then
		continue
	end if
	li_row =	ldw_audit.InsertRow( 0 )
	//---------------------------- APPEON END ----------------------------
	

	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> PT-29
	//$<modify> 02.17.2006 By: LeiWei
	//$<reason> Performance tuning
	//$<modification> Comment out the following script to reduce client-server interaction.
	//$<modification> refer to PT-28 and of_get_id for more information.
	/*
	ll_record_id = gnv_app.of_get_id("RECORD_ID")
	*/
	ll_record_id ++
	//---------------------------- APPEON END ----------------------------
	ll_app_audit_id = ldw_rqrd_data.GetItemNumber( i, "app_audit_id" )
	//--------------------------- APPEON BEGIN ---------------------------
	//$<modify> 10.18.2006 By: Jack (Inova)
	//$<reason> Required Documents Check Box on Data Entry Screen.
	/*
	ldw_audit.SetItem( i, "rec_id", ll_record_id )
	ldw_audit.SetItem( i, "appt_stat_id", ll_appt_stat_id )
	ldw_audit.SetItem( i, "prac_id", al_prac_id)
	ldw_audit.SetItem( i, "facility_id", li_parent_facility_id )
	ldw_audit.SetItem( i, "app_audit_id", ll_app_audit_id )
	*/
	ldw_audit.SetItem( li_row, "rec_id", ll_record_id )
	ldw_audit.SetItem( li_row, "appt_stat_id", ll_appt_stat_id )
	ldw_audit.SetItem( li_row, "prac_id", al_prac_id)
	ldw_audit.SetItem( li_row, "facility_id", li_parent_facility_id )
	ldw_audit.SetItem( li_row, "app_audit_id", ll_app_audit_id )
	
	//---------------------------- APPEON END ----------------------------

	//find out the last seq no used

	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> PT-21
	//$<modify> 02.16.2006 By: LeiWei
	//$<reason> Performance tuning
	//$<modification> Write script to retrieve data from a cache in PT-20 instead of from the database.

	/*
		ll_seq_row_cnt = lds_last_app_audit_seq_no.Retrieve( ll_app_audit_id, al_prac_id, li_audit_facility_id )	
	*/
	lds_last_app_audit_seq_no.SetFilter("app_audit_id = "+string(ll_app_audit_id))
	lds_last_app_audit_seq_no.filter( )
	ll_seq_row_cnt = lds_last_app_audit_seq_no.rowcount()
	//---------------------------- APPEON END ----------------------------

	IF ll_seq_row_cnt < 1 THEN
		ll_seq_no = 1 
	ELSE
		ll_seq_no = lds_last_app_audit_seq_no.GetItemNumber( 1, "last_seq_no" ) + 1
	END IF	
	
	//--------------------------- APPEON BEGIN ---------------------------
	//$<modify> 10.17.2006 By: Jack (Inova)
	//$<reason> Required Documents Check Box on Data Entry Screen.
	/*
	ldw_audit.SetItem( i, "seq_no", ll_seq_no	) 		
	ldw_audit.SetItem( i, "active_status", 1 )
	ldw_audit.SetItem( i, "pd_app_audit_fax_message", ldw_rqrd_data.GetItemString( i, "fax_description" )	) 	
	ldw_audit.SetItem( i, "description", ldw_rqrd_data.GetItemString( i, "description" )	) 		
	*/
	ldw_audit.SetItem( li_row, "seq_no", ll_seq_no	) 		
	ldw_audit.SetItem( li_row, "active_status", 1 )
	ldw_audit.SetItem( li_row, "pd_app_audit_fax_message", ldw_rqrd_data.GetItemString( i, "fax_description" )	) 	
	ldw_audit.SetItem( li_row, "description", ldw_rqrd_data.GetItemString( i, "description" )	) 		
	
	ldw_audit.SetItem( li_row, "app_type", ldw_rqrd_data.GetItemString( i, "app_type" )	)		
	//---------------------------- APPEON END ----------------------------
END FOR
@@@@@@@@@@@@@maha */


//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-22
//$<modify> 02.16.2006 By: LeiWei
//$<reason> Performance tuning
//$<modification> Write script to retrieve data from a cache instead of from the database.

/*
	//get lookup data and set the exp letter completion values
	SELECT code_lookup.lookup_code  
	INTO :ll_response_code  
	FROM code_lookup  
	WHERE code_lookup.code = 'APP-RCVD'   ;
	
	SELECT code_lookup.lookup_code  
	INTO :ll_exp_appt_ltr  
	FROM code_lookup  
	WHERE code_lookup.code = 'Exp Appt Ltr';
*/
gnv_data.of_getitem( "code_lookup", 'lookup_code', "upper(code) = 'APP-RCVD'")
gnv_data.of_getitem( "code_lookup", 'lookup_code', "upper(code) = upper('Exp Appt Ltr')")
//---------------------------- APPEON END ----------------------------

IF adw_action_items.RowCount() > 0 THEN
	for i = 1 to adw_action_items.Rowcount( )	
		IF adw_action_items.GetItemNumber( i, "verification_method" ) = ll_exp_appt_ltr THEN
			if	adw_action_items.GetItemNumber( i, "prac_id" ) = al_prac_id and adw_action_items.GetItemNumber( i, "parent_facility_id" ) = ai_parent_facility then //trap for act items maha092503
				if isnull(adw_action_items.getItemdatetime( i, "date_recieved")) then
					adw_action_items.SetItem( i, "user_name", gnv_app.of_getuserid() )
					adw_action_items.SetItem( i, "date_recieved", Today() )
				end if
				adw_action_items.SetItem( i, "response_code", ll_response_code  )
				adw_action_items.SetItem( i, "active_status", 0 )
				exit //once found drop loop
			end if
		END IF
	next
END IF


//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-27
//$<modify> 02.16.2006 By: LeiWei
//$<reason> Performance tuning
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

/*
//commit work
SQLCA.AutoCommit = false //to allow rollbacks readded 032002

IF  as_ver_type <> "NOVER" then  //initiate recred process
	IF lds_reapp.Update( True, False ) = 1 THEN
		IF lds_exp_copy.Update ( True, False ) = 1 THEN		
			IF adw_action_items.Update ( True, False ) = 1 THEN
				IF lds_appt_stat.Update ( True, False ) = 1 THEN						
					IF lds_appt_staff_cat.Update ( True, False ) = 1 THEN
						IF lds_appt_dept.Update ( True, False ) = 1 THEN
							IF lds_appt_comms.Update ( True, False ) = 1 THEN						
								IF lds_appt_leave.Update ( True, False ) = 1 THEN													
						
									IF ldw_audit.Update( True, False) = 1 THEN									
										//Open up window with new appointment status information
										gl_facility_id = li_parent_facility_id
										gl_prac_id = al_prac_id
										gs_param = "REAPP"
										Open( w_back_from_committee )
										
										IF Message.StringParm = "Cancel" THEN
											ROLLBACK USING SQLCA;
											RETURN -1
										END IF
										//Commit all changes
										COMMIT USING SQLCA;
													
										lds_reapp.ResetUpdate()
										lds_exp_copy.ResetUpdate()
										adw_action_items.ResetUpdate()
										lds_appt_staff_cat.ResetUpdate()
										lds_appt_dept.ResetUpdate()
										lds_appt_stat.ResetUpdate()
										lds_appt_comms.ResetUpdate()
										adw_action_items.ResetUpdate()
										lds_appt_leave.ResetUpdate()
										ldw_audit.ResetUpdate()
										ldw_rqrd_data.ResetUpdate()
										lds_last_app_audit_seq_no.ResetUpdate()
										// move npdb, corresp letters etc. to history  //maha added here 03073
										update verif_info set active_status = 0 where screen_id = 1 and prac_id = :al_prac_id and facility_id = :li_parent_facility_id;
										commit using sqlca;
										Return 1
									else 
										MessageBox("Update Failed", "Update during initiation of recredentialing query failed. (lds_audit)")
										ROLLBACK USING SQLCA;
										Return -1										
									END IF
								else
									MessageBox("Update Failed", "Update during initiation of recredentialing query failed. (lds_appt_leave)")
									ROLLBACK USING SQLCA;
									Return -1
								END IF
							ELSE
								MessageBox("Update Failed", "Update during initiation of recredentialing query failed. (lds_appt_comms)")
								ROLLBACK USING SQLCA;
								Return -1																								
							END IF
						ELSE
							MessageBox("Update Failed", "Update during initiation of recredentialing query failed. (lds_appt_dept)")
							ROLLBACK USING SQLCA;
							Return -1																	
						END IF
					ELSE
						MessageBox("Update Failed", "Update during initiation of recredentialing query failed. (lds_appt_staff_cat)")
						ROLLBACK USING SQLCA;
						Return -1										
					END IF
				ELSE
					MessageBox("Update Failed", "Update during initiation of recredentialing query failed. (lds_appt_stat)")
					ROLLBACK USING SQLCA;
					Return -1				
				END IF
			ELSE
				MessageBox("Update Failed", "Update during initiation of recredentialing query failed. (lds_action_items)")
				ROLLBACK USING SQLCA;
				Return -1
			END IF
		ELSE
			MessageBox("Update Failed", "Update during initiation of recredentialing query failed. (lds_exp_copy)")
			ROLLBACK USING SQLCA;
			Return -1
		END IF
	ELSE
		MessageBox("Update Failed", "Update during initiation of recredentialing query failed. (lds_reapp_copy)")	
		ROLLBACK USING SQLCA;
		Return -1
	END IF
ELSE //for recred no verif process
			IF adw_action_items.Update ( True, False ) = 1 THEN
				IF lds_appt_stat.Update ( True, False ) = 1 THEN						
					IF lds_appt_staff_cat.Update ( True, False ) = 1 THEN
						IF lds_appt_dept.Update ( True, False ) = 1 THEN
							IF lds_appt_comms.Update ( True, False ) = 1 THEN						
								IF lds_appt_leave.Update ( True, False ) = 1 THEN													
						
									IF ldw_audit.Update( True, False) = 1 THEN									
										//Open up window with new appointment status information
										gl_facility_id = li_parent_facility_id
										gl_prac_id = al_prac_id
										gs_param = "REAPP"
										Open( w_back_from_committee )
										
										IF Message.StringParm = "Cancel" THEN
											ROLLBACK USING SQLCA;
											RETURN -1
										END IF
										//Commit all changes
										COMMIT USING SQLCA;
										
										adw_action_items.ResetUpdate()
										lds_appt_staff_cat.ResetUpdate()
										lds_appt_dept.ResetUpdate()
										lds_appt_stat.ResetUpdate()
										lds_appt_comms.ResetUpdate()
										adw_action_items.ResetUpdate()
										lds_appt_leave.ResetUpdate()
										ldw_audit.ResetUpdate()
										ldw_rqrd_data.ResetUpdate()
										lds_last_app_audit_seq_no.ResetUpdate()
										
										update verif_info set active_status = 0 where screen_id = 1 and prac_id = :al_prac_id and facility_id = :li_verif_facility_id;
										commit using sqlca;										
										Return 1
									eLSE 
										MessageBox("Update Failed", "Update during initiation of recredentialing query failed. (lds_audit)")
										ROLLBACK USING SQLCA;
										Return -1										
									END IF
							ELSE
								MessageBox("Update Failed", "Update during initiation of recredentialing query failed. (lds_appt_leave)")
								ROLLBACK USING SQLCA;
								Return -1																								
							END IF
						ELSE
							MessageBox("Update Failed", "Update during initiation of recredentialing query failed. (lds_appt_comm)")
							ROLLBACK USING SQLCA;
							Return -1																	
						END IF
					ELSE
						MessageBox("Update Failed", "Update during initiation of recredentialing query failed. (lds_appt_dept)")
						ROLLBACK USING SQLCA;
						Return -1										
					END IF
				ELSE
					MessageBox("Update Failed", "Update during initiation of recredentialing query failed. (lds_appt_staff_cat)")
					ROLLBACK USING SQLCA;
					Return -1				
				END IF
			ELSE
				MessageBox("Update Failed", "Update during initiation of recredentialing query failed. (lds_appt_stat)")
				ROLLBACK USING SQLCA;
				Return -1																	
			END IF
		ELSE
			MessageBox("Update Failed", "Update during initiation of recredentialing query failed. (lds_action_items)")
			ROLLBACK USING SQLCA;
			Return -1
		END IF
END IF





commit using sqlca;
SQLCA.AutoCommit = true
*/

//commit work
commit;
sqlca.autocommit = false
//--------------------------- APPEON BEGIN ---------------------------
//$<add> 10.18.2006 By: Jack (Inova)
//$<reason> Required Documents Check Box on Data Entry Screen.
long ll_prac_id[]
long ll_rec_id1[]
pfc_cst_nv_data_entry_functions lnv_data_entry
lnv_data_entry = create pfc_cst_nv_data_entry_functions
//---------------------------- APPEON END ----------------------------

IF  as_ver_type <> "NOVER" then  //initiate recred process
	gnv_appeondb.of_startqueue( )
		
		lds_reapp.update(true,false)
		lds_exp_copy.update(true,false)
		adw_action_items.update(true,false)
		lds_appt_stat.update(true,false)
		lds_appt_staff_cat.update(true,false)
		lds_appt_dept.update(true,false)
		lds_appt_comms.update(true,false)
		lds_appt_leave.update(true,false)
		ldw_audit.update(true,false)
		
	gnv_appeondb.of_commitqueue( )
	
	//Open up window with new appointment status information
	gl_facility_id = li_parent_facility_id
	gl_prac_id = al_prac_id
	gs_param = "REAPP"
	Open( w_back_from_committee )
	IF Message.StringParm = "Cancel" THEN
		ROLLBACK USING SQLCA;
		sqlca.autocommit = true
		
		RETURN -1
	END IF
	
	lds_reapp.ResetUpdate()
	lds_exp_copy.ResetUpdate()
	adw_action_items.ResetUpdate()
	lds_appt_staff_cat.ResetUpdate()
	lds_appt_dept.ResetUpdate()
	lds_appt_stat.ResetUpdate()
	lds_appt_comms.ResetUpdate()
	adw_action_items.ResetUpdate()
	lds_appt_leave.ResetUpdate()
	ldw_audit.ResetUpdate()
//	ldw_rqrd_data.ResetUpdate()
//	lds_last_app_audit_seq_no.ResetUpdate()

	//--------------------------- APPEON BEGIN ---------------------------
	//$<add> 2007-01-25 By: Rodger Wu (attest quest)
	//$<reason> Generate attest questions from question template.
	lnv_data_entry.of_generate_attest_questions( "reapp", ai_parent_facility, al_prac_id, ll_new_rec_id )
	//---------------------------- APPEON END ----------------------------

	gnv_appeondb.of_startqueue( )
		// move npdb, corresp letters etc. to history  //maha added here 03073
		update verif_info set active_status = 0 where screen_id = 1 and prac_id = :al_prac_id and facility_id = :li_parent_facility_id;
		commit using sqlca;
	gnv_appeondb.of_commitqueue( )
	//--------------------------- APPEON BEGIN ---------------------------
	//$<add> 10.18.2006 By: Jack (Inova)
	//$<reason> Required Documents Check Box on Data Entry Screen.
	ll_prac_id[1] = al_prac_id
	ll_rec_id1[1] = ll_rec_id
	ll_rec_id1[2] = ll_new_rec_id
	//long prac
//	lnv_data_entry.of_create_application_audit_record('R',ll_prac_id,0,ll_rec_id1,'')
	lnv_data_entry.of_app_audit_items_add( li_parent_facility_id, al_prac_id, ll_new_rec_id ,li_audit_facility_id,"Reapp",ldw_audit	, "R" )

	destroy lnv_data_entry
	
	//---------------------------- APPEON END ----------------------------

	sqlca.autocommit = true

	//--------------------------- APPEON BEGIN ---------------------------
	//$<comment> 2007-01-26 By: Rodger Wu (attest quest)
	//$<reason> The following script line should be deleted.
	//Return 1
	//---------------------------- APPEON END ----------------------------

ELSE
	gnv_appeondb.of_startqueue( )

	
		adw_action_items.update(true,false)
		lds_appt_stat.update(true,false)
		lds_appt_staff_cat.update(true,false)
		lds_appt_dept.update(true,false)
		lds_appt_comms.update(true,false)
		lds_appt_leave.update(true,false)
		
	gnv_appeondb.of_commitqueue( )

	//Open up window with new appointment status information
	gl_facility_id = li_parent_facility_id
	gl_prac_id = al_prac_id
	gs_param = "REAPP"
	Open( w_back_from_committee )
		
	IF Message.StringParm = "Cancel" THEN
		ROLLBACK USING SQLCA;
		sqlca.autocommit = true
		RETURN -1
	END IF

	adw_action_items.ResetUpdate()
	lds_appt_staff_cat.ResetUpdate()
	lds_appt_dept.ResetUpdate()
	lds_appt_stat.ResetUpdate()
	lds_appt_comms.ResetUpdate()
	adw_action_items.ResetUpdate()
	lds_appt_leave.ResetUpdate()
	ldw_audit.ResetUpdate()
//	ldw_rqrd_data.ResetUpdate()
//	lds_last_app_audit_seq_no.ResetUpdate()

	//--------------------------- APPEON BEGIN ---------------------------
	//$<add> 2007-01-25 By: Rodger Wu (attest quest)
	//$<reason> Generate attest questions from question template.
	lnv_data_entry.of_generate_attest_questions( "reapp", ai_parent_facility, al_prac_id, ll_new_rec_id )
	//---------------------------- APPEON END ----------------------------

	gnv_appeondb.of_startqueue( )
		// move npdb, corresp letters etc. to history  //maha added here 03073
		update verif_info set active_status = 0 where screen_id = 1 and prac_id = :al_prac_id and facility_id = :li_parent_facility_id;
		commit using sqlca;

	gnv_appeondb.of_commitqueue( )
	//--------------------------- APPEON BEGIN ---------------------------
	//$<add> 10.18.2006 By: Jack (Inova)
	//$<reason> Required Documents Check Box on Data Entry Screen.
	ll_prac_id[1] = al_prac_id
	ll_rec_id1[1] = ll_rec_id
	ll_rec_id1[2] = ll_new_rec_id
//	lnv_data_entry.of_create_application_audit_record('R',ll_prac_id,0,ll_rec_id1,'')
	lnv_data_entry.of_app_audit_items_add( li_parent_facility_id, al_prac_id, ll_new_rec_id ,li_audit_facility_id,"Reapp",ldw_audit	, "R" )

	destroy lnv_data_entry
	
	//---------------------------- APPEON END ----------------------------

	sqlca.autocommit = true

//	Return 1
END IF

//---------------------------- APPEON END ----------------------------

//Added for work Flow. Trigger the related work flow for practitioner reappointment. 2/11/2006 Henry
If gb_workflow Then //Enable the work flow
	long ll_wf_id
	ll_wf_id = long(gnv_data.of_getitem("facility", "facility_wf_reappointment_initiated" , "facility_id="+string(ai_parent_facility)))
	If ll_wf_id > 0 Then
		n_cst_workflow_triggers lnv_triggers
		lnv_triggers = create n_cst_workflow_triggers
		//--------------------------- APPEON BEGIN ---------------------------
		//$<modify> 11.17.2006 By: Jervis
		//$<reason> 
		//lnv_triggers.of_workflow_create_action_items( al_prac_id, 0, 1, ai_parent_facility, ll_wf_id)			
		str_action_item lstr_action
		lstr_action.prac_id = al_prac_id
		lstr_action.rec_id = 0
		lstr_action.screen_id = -10
		lstr_action.facility_id = ai_parent_facility
		lstr_action.wf_id = ll_wf_id
		lnv_triggers.of_workflow_create_action_items(lstr_action)
		//---------------------------- APPEON END ----------------------------
		destroy lnv_triggers
	End If
End If
//End added for Work Flow

IF as_ver_type = "NOVER" then
	DESTROY lds_exp_copy
	DESTROY lds_reapp
end if

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 2007.10.19 By: Frank.Gui
//$<reason> Change E-Sign flag
  UPDATE wv_esign_log  
     SET isdisabled = 1  
   WHERE ( wv_esign_log.facility_id = :ai_parent_facility ) AND  
         ( wv_esign_log.prac_id = :al_prac_id )   ;
//---------------------------- APPEON END ----------------------------
//DESTROY lds_last_app_audit_seq_no
//DESTROY ldw_rqrd_data
//End Code Change---10.30.2006
DESTROY ldw_audit
DESTROY lds_action_items
DESTROY lds_appt_dept
DESTROY lds_appt_comms
DESTROY lds_appt_stat
DESTROY lds_appt_staff_cat
DESTROY lds_appt_leave


RETURN 0

end function

public function integer of_expiring_credentials_from_data ();
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-23
//$<modify> 03.29.2006 By: LeiWei
//$<reason> Performance tuning
//$<modification> 1)Move the original scripts in of_expiring_credentials_from_data to of_expiring_credentials_from_data_old.
//$<modification> 2)Rewrite of_expiring_credentials_from_data.
//$<modification> The reason for the rewrite is: the original function hits the database over 1000 times and negatively affects
//$<modification> the runtime performance on the Web. After modification, the function hits the database only several times. 

/*
//Original
of_expiring_credentials_from_data_old()
*/
long s
long sc
long d
long dc
long f
long fc
long cnt = 0
long tcnt = 0
integer chk
long ll_rec
long ll_prac
long ll_facil 
Long ll_seq
integer li_screen
string ls_screen_name
integer li_act_stat
integer li_complete = 1
long ll_resp_code = 2
long ll_verif_method = 1
string ls_ref_value
long ll_ref1no
string ls_datatype
long ll_ref1
long ll_ref2
long ll_ref_exp
integer li_days
string ls_ref1_lu
string ls_ref2_lu
string ls_ref1_lutype
string ls_ref2_lutype
string ls_ref1_dtype
string ls_ref2_dtype
string ls_ref1_lufield
string ls_ref2_lufield
string ls_ref1_name
string ls_ref2_name
string ls_refexp_name
string ls_priority_user
string ldw
integer li_priority
integer li_exp_flag
string ls_doc_id
integer exp_days
long ll_rowcount
long r
long ll_newrow
datetime ldt_exp_date
long ll_null_no
integer li_bs_year
datetime ld_exp
integer ll_code
integer ac
string ls_reference1
string ls_reference2
string ls_reference
integer li_month
datetime ldt_null_date
long ll_address_code
integer li_exp_days
date ld_exp_ret
integer li_found
integer clicks
long ll_lookup_address_r
datastore lds_screen
datastore lds_facils
datastore lds_sys_field
datastore lds_verif
datastore lds_data

lds_screen = CREATE datastore
lds_screen.dataobject = "d_verif_screens_exp"
lds_facils = CREATE datastore
lds_facils.dataobject = "d_prac_affils_verif_forpt"
lds_sys_field = CREATE datastore
lds_sys_field.dataobject = "d_field_data_forpt"
lds_verif = CREATE datastore
lds_verif.dataobject = "d_verif_exp_4_record_forpt"
lds_verif.Settransobject(SQLCA)

//MSKINNER 15 MARCH 2005 -- BEGIN
if isvalid(w_aiq_run) then  w_aiq_run.r_status.width = 100
//MSKINNER 15 MARCH 2005 -- END


setnull(ldt_null_date)
lds_sys_field.settransobject(sqlca)
lds_facils.settransobject(sqlca)
lds_screen.settransobject(sqlca)//d_verif_screens_exp
sc = lds_screen.retrieve()//gets all distinct verif rules where data_view = 1, screen > 1 and exp_days > 0 and the screen has an exp_field
if sc < 1 then 
	messagebox("Expiring Credentials", "There are no verification rules set up for expiring Verifications.  Skipping this function.")
	//--------------------------- APPEON BEGIN ---------------------------
	//$<Add> 08.22.2007 By: Evan
	//$<Reason> Need to destroy object.
	if IsValid(lds_screen) then Destroy lds_screen
	if IsValid(lds_facils) then Destroy lds_facils
	if IsValid(lds_sys_field) then Destroy lds_sys_field
	if IsValid(lds_verif) then Destroy lds_verif
	//---------------------------- APPEON END ----------------------------	
	return -1
	
end if
ll_verif_method = Long(gnv_data.of_getitem( "code_lookup", "lookup_code", "upper(code) = upper('Exp Cred Ltr')"))
if ll_verif_method < 1 then
	messagebox("Missing Data", "You do not have a Verification Method lookup with the code of 'Exp Cred Ltr'.~rUnable to continue.")
	//--------------------------- APPEON BEGIN ---------------------------
	//$<Add> 08.22.2007 By: Evan
	//$<Reason> Need to destroy object.
	if IsValid(lds_screen) then Destroy lds_screen
	if IsValid(lds_facils) then Destroy lds_facils
	if IsValid(lds_sys_field) then Destroy lds_sys_field
	if IsValid(lds_verif) then Destroy lds_verif
	//---------------------------- APPEON END ----------------------------	
	return -1
end if
clicks = integer(700/sc)

/*****         LOOP 1 BEGIN    *************************************************************************/
Long ll_ref1_arr[],ll_ref1_arr_i,ll_dataobject_arr_i,ll_dataobject_arr_cnt
String ls_dataobject, ls_dataobject_arr[]
Datastore lds_dataobject_arr[]
Boolean lb_existing

for s = 1 to sc
	li_screen = lds_screen.getitemnumber(s,"screen_id")
	ll_ref1 = lds_screen.getitemnumber(s,"reference_field_1")
	ll_ref2 = lds_screen.getitemnumber(s,"reference_field_2")

	ll_ref1_arr_i ++
	ll_ref1_arr[ll_ref1_arr_i] = ll_ref1
	ll_ref1_arr_i ++
	ll_ref1_arr[ll_ref1_arr_i] = ll_ref2
	
	ls_dataobject = ""
	CHOOSE CASE li_screen
		CASE 4//"License"
			ls_dataobject = "d_exp_license_verif"
		CASE 5 //"DEA"
			ls_dataobject = "d_exp_dea_verif"
		CASE 9 //Special Certs
			ls_dataobject = "d_exp_spec_certs_verif"
		CASE 15 //"Insurance"
			ls_dataobject = "d_exp_insurance_verif"
		CASE 19 //"Board/Specialty"
			ls_dataobject = "d_exp_spec_verif"
		CASE 23 //Other Ids
			ls_dataobject = "d_exp_other_ids_verif"
		CASE else
			continue
	END CHOOSE
	if ls_dataobject = "" then
		continue
	end if

	lb_existing = FALSE
	FOR ll_dataobject_arr_i = 1 TO ll_dataobject_arr_cnt
		IF ls_dataobject_arr[ll_dataobject_arr_i] = ls_dataobject THEN
			lb_existing = TRUE
			EXIT
		END IF
	END FOR
	
	IF NOT lb_existing THEN
		ll_dataobject_arr_cnt ++
		ls_dataobject_arr[ll_dataobject_arr_cnt] = ls_dataobject
		lds_dataobject_arr[ll_dataobject_arr_cnt] = Create Datastore
		lds_dataobject_arr[ll_dataobject_arr_cnt].Dataobject = ls_dataobject
		lds_dataobject_arr[ll_dataobject_arr_cnt].Settransobject( SQLCA )
	END IF
end for

gnv_appeondb.of_startqueue( )

lds_sys_field.Retrieve( ll_ref1_arr[] )

FOR ll_dataobject_arr_i = 1 TO ll_dataobject_arr_cnt
	lds_dataobject_arr[ll_dataobject_arr_cnt].Retrieve( today() )
END FOR
	
gnv_appeondb.of_commitqueue( )
/*****         LOOP 1 END       *************************************************************************/

Long ll_code_arr[],ll_code_arr_i
Long ll_prac_arr[],ll_prac_arr_i
Integer li_screen_arr[],li_screen_arr_i

/*****         LOOP 2 BEGIN     *************************************************************************/
for s = 1 to sc
	li_screen = lds_screen.getitemnumber(s,"screen_id")

	// get li_screen value in loop 2
	li_screen_arr_i ++
	li_screen_arr[li_screen_arr_i] = li_screen

	ls_screen_name = lds_screen.getitemstring(s,"screen_name")
	ll_ref1 = lds_screen.getitemnumber(s,"reference_field_1")
	ll_ref2 = lds_screen.getitemnumber(s,"reference_field_2")
	ll_ref_exp = lds_screen.getitemnumber(s,"exp_field")
	lds_sys_field.SetFilter("field_id = " + String(ll_ref1))
	lds_sys_field.Filter( )
	If lds_sys_field.Rowcount( ) < 1 Then
		ll_ref1  = 0
	else		//ref one data
		ls_ref1_dtype = lds_sys_field.getitemstring(1,"field_type")
		ls_ref1_name = lds_sys_field.getitemstring(1,"field_name")
		ls_ref1_lu = lds_sys_field.getitemstring(1,"lookup_field")
		if ls_ref1_lu = "Y" then
			ls_ref1_lutype = lds_sys_field.getitemstring(1,"lookup_type")
			ls_ref1_lufield = lds_sys_field.getitemstring(1,"lookup_field_name")
		end if
	end if

	lds_sys_field.SetFilter("field_id = " + String(ll_ref2))
	lds_sys_field.Filter( )
	If lds_sys_field.Rowcount( ) < 1 Then
		ll_ref2 = 0
	else	 //ref 2 data
		ls_ref2_dtype = lds_sys_field.getitemstring(1,"field_type")
		ls_ref2_name = lds_sys_field.getitemstring(1,"field_name")
		ls_ref2_lu = lds_sys_field.getitemstring(1,"lookup_field")
		if ls_ref2_lu = "Y" then
			ls_ref2_lutype = lds_sys_field.getitemstring(1,"lookup_type")
			ls_ref2_lufield = lds_sys_field.getitemstring(1,"lookup_field_name")
		end if
	end if

	lds_sys_field.SetFilter("field_id = " + String(ll_ref_exp))
	lds_sys_field.Filter( )
	If lds_sys_field.Rowcount( ) < 1 Then
		ll_ref_exp = 0
	else
		ls_refexp_name = lds_sys_field.getitemstring(1,"field_name")
	end if

	ls_dataobject = ""
	CHOOSE CASE li_screen
		CASE 4//"License"
			ls_dataobject = "d_exp_license_verif"
		CASE 5 //"DEA"
			ls_dataobject = "d_exp_dea_verif"
		CASE 9 //Special Certs
			ls_dataobject = "d_exp_spec_certs_verif"
		CASE 15 //"Insurance"
			ls_dataobject = "d_exp_insurance_verif"
		CASE 19 //"Board/Specialty"
			ls_dataobject = "d_exp_spec_verif"
		CASE 23 //Other Ids
			ls_dataobject = "d_exp_other_ids_verif"
		CASE else
			continue
	END CHOOSE
	if ls_dataobject = "" then
		continue
	end if
	
	FOR ll_dataobject_arr_i = 1 TO ll_dataobject_arr_cnt
		IF ls_dataobject_arr[ll_dataobject_arr_i] = ls_dataobject THEN
			lds_data = lds_dataobject_arr[ll_dataobject_arr_i]
			EXIT
		END IF
	END FOR
	
	dc = lds_data.Rowcount()

	cnt = 0

	if dc < 1 then continue
	for d = 1 to dc
		ll_rec = lds_data.getitemnumber(d,"rec_id")
		ll_prac = lds_data.getitemnumber(d,"prac_id")

		IF ll_ref_exp > 0 THEN
		ELSE
			continue
		END IF
	//*************** reference data *******************
		IF ll_ref1 > 0 THEN
			IF ls_ref1_dtype = "N" or ls_ref1_dtype = "I" then
				ls_reference1 =  string(lds_data.GetItemNumber( d, ls_ref1_name ))
			elseif ls_ref1_dtype = "C" then
				ls_reference1 =  lds_data.GetItemstring( d, ls_ref1_name )
			elseif ls_ref1_dtype = "D" then
				ls_reference1 =  string(date(lds_data.GetItemdatetime( d, ls_ref1_name )))
			end if
			if ls_ref1_lu = "Y" then
				ll_code = long(ls_reference1)
				if ls_ref1_lutype = "A" then
					//get ll_code value in loop 2
					ll_code_arr_i ++
					ll_code_arr[ll_code_arr_i] = ll_code
				end if
			end if
		end if			
		if isnull(ls_reference1) then ls_reference1 = ""
					
		//get reference 2 data
		IF ll_ref2 > 0 THEN
			IF ls_ref2_dtype = "N" or ls_ref2_dtype = "I" then
				ls_reference2 =  string(lds_data.GetItemNumber( d, ls_ref2_name ))
			elseif ls_ref2_dtype = "C" then
				ls_reference2 =  lds_data.GetItemstring( d, ls_ref2_name )
			elseif ls_ref2_dtype = "D" then
				ls_reference2 =  string(date(lds_data.GetItemdatetime( d, ls_ref2_name )))
			end if
			if ls_ref2_lu = "Y" then
				ll_code = long(ls_reference2)
				if ls_ref2_lutype = "A" then
					//get ll_code value in loop 2
					ll_code_arr_i ++
					ll_code_arr[ll_code_arr_i] = ll_code
				end if
			end if
		END IF
		// get ll_prac value in loop 2
		ll_prac_arr_i ++
		ll_prac_arr[ll_prac_arr_i] = ll_prac
	next
next
/*****         LOOP 2 END       *************************************************************************/

gnv_appeondb.of_startqueue( )

IF ll_prac_arr_i > 0 THEN
	lds_facils.retrieve(ll_prac_arr[],li_screen_arr[])
END IF
IF ll_code_arr_i > 0 THEN
	Datastore lds_address_lookup
	lds_address_lookup = Create Datastore
	lds_address_lookup.Dataobject = "d_lookup_address_search_all"
	lds_address_lookup.Settransobject( SQLCA )
	lds_address_lookup.retrieve(ll_code_arr[])
END IF

gnv_appeondb.of_commitqueue( )

Long ll_rec_arr[],ll_rec_arr_i
Long ll_facil_arr[],ll_facil_arr_i

/*****         LOOP 3 BEGIN     *************************************************************************/
for s = 1 to sc
	li_screen = lds_screen.getitemnumber(s,"screen_id")	//Add By Jervis 11-04-2008
	ls_dataobject = ""
	CHOOSE CASE li_screen
		CASE 4//"License"
			ls_dataobject = "d_exp_license_verif"
		CASE 5 //"DEA"
			ls_dataobject = "d_exp_dea_verif"
		CASE 9 //Special Certs
			ls_dataobject = "d_exp_spec_certs_verif"
		CASE 15 //"Insurance"
			ls_dataobject = "d_exp_insurance_verif"
		CASE 19 //"Board/Specialty"
			ls_dataobject = "d_exp_spec_verif"
		CASE 23 //Other Ids
			ls_dataobject = "d_exp_other_ids_verif"
		CASE else
			continue
	END CHOOSE
	if ls_dataobject = "" then
		continue
	end if
	
	FOR ll_dataobject_arr_i = 1 TO ll_dataobject_arr_cnt
		IF ls_dataobject_arr[ll_dataobject_arr_i] = ls_dataobject THEN
			lds_data = lds_dataobject_arr[ll_dataobject_arr_i]
			EXIT
		END IF
	END FOR
	
	dc = lds_data.Rowcount()
	for d = 1 to dc
		ll_rec = lds_data.getitemnumber(d,"rec_id")
		ll_prac = lds_data.getitemnumber(d,"prac_id")
		
		//get ll_rec value in loop 3
		ll_rec_arr_i++
		ll_rec_arr[ll_rec_arr_i] = ll_rec

		lds_facils.Setfilter( "prac_id = " + String(ll_prac) + " AND facility_ver_rules_screen_id = " + String(li_screen))
		lds_facils.Filter( )
		fc = lds_facils.Rowcount( )
		for f = 1 to fc
			ll_facil = lds_facils.getitemnumber(f,"verifying_facility")
			// get ll_facil value in loop 3
			ll_facil_arr_i ++
			ll_facil_arr[ll_facil_arr_i] = ll_facil
		next
	next
next
/*****         LOOP 3 END       *************************************************************************/

IF ll_facil_arr_i > 0 THEN
	lds_verif.Retrieve( ll_rec_arr[], ll_prac_arr[], ll_facil_arr[])
END IF

/*****         LOOP FINALLY BEGIN         ***************************************************************/
for s = 1 to sc
	li_screen = lds_screen.getitemnumber(s,"screen_id")
	ls_screen_name = lds_screen.getitemstring(s,"screen_name")
	ll_ref1 = lds_screen.getitemnumber(s,"reference_field_1")
	ll_ref2 = lds_screen.getitemnumber(s,"reference_field_2")
	ll_ref_exp = lds_screen.getitemnumber(s,"exp_field")
	lds_sys_field.SetFilter("field_id = " + String(ll_ref1))
	lds_sys_field.Filter( )
	If lds_sys_field.Rowcount( ) < 1 Then
		ll_ref1  = 0
	else		//ref one data
		ls_ref1_dtype = lds_sys_field.getitemstring(1,"field_type")
		ls_ref1_name = lds_sys_field.getitemstring(1,"field_name")
		ls_ref1_lu = lds_sys_field.getitemstring(1,"lookup_field")
		if ls_ref1_lu = "Y" then
			ls_ref1_lutype = lds_sys_field.getitemstring(1,"lookup_type")
			ls_ref1_lufield = lds_sys_field.getitemstring(1,"lookup_field_name")
		end if
	end if

	lds_sys_field.SetFilter("field_id = " + String(ll_ref2))
	lds_sys_field.Filter( )
	If lds_sys_field.Rowcount( ) < 1 Then
		ll_ref2 = 0
	else	 //ref 2 data
		ls_ref2_dtype = lds_sys_field.getitemstring(1,"field_type")
		ls_ref2_name = lds_sys_field.getitemstring(1,"field_name")
		ls_ref2_lu = lds_sys_field.getitemstring(1,"lookup_field")
		if ls_ref2_lu = "Y" then
			ls_ref2_lutype = lds_sys_field.getitemstring(1,"lookup_type")
			ls_ref2_lufield = lds_sys_field.getitemstring(1,"lookup_field_name")
		end if
	end if

	lds_sys_field.SetFilter("field_id = " + String(ll_ref_exp))
	lds_sys_field.Filter( )
	If lds_sys_field.Rowcount( ) < 1 Then
		ll_ref_exp = 0
	else
		ls_refexp_name = lds_sys_field.getitemstring(1,"field_name")
	end if

	ls_dataobject = ""
	CHOOSE CASE li_screen

		CASE 4//"License"
			ls_dataobject = "d_exp_license_verif"
			//MSKINNER 15 MARCH 2005 -- BEGIN
         if isvalid(w_aiq_run) then  w_aiq_run.st_1.text = "Checking for Expiring Licenses"
         //MSKINNER 15 MARCH 2005 -- END
		CASE 5 //"DEA"
			ls_dataobject = "d_exp_dea_verif"
			if isvalid(w_aiq_run) then  w_aiq_run.st_1.text = "Checking for Expiring DEAs"

		CASE 9 //Special Certs
			ls_dataobject = "d_exp_spec_certs_verif"
			if isvalid(w_aiq_run) then  w_aiq_run.st_1.text = "Checking for Expiring Special Certifications"

		CASE 15 //"Insurance"
			ls_dataobject = "d_exp_insurance_verif"
			if isvalid(w_aiq_run) then  w_aiq_run.st_1.text = "Checking for Expiring Insurance Records"

		CASE 19 //"Board/Specialty"
			ls_dataobject = "d_exp_spec_verif"
			if isvalid(w_aiq_run) then  w_aiq_run.st_1.text = "Checking for Expiring Board Certifications"

		CASE 23 //Other Ids
			ls_dataobject = "d_exp_other_ids_verif"
			if isvalid(w_aiq_run) then  w_aiq_run.st_1.text = "Checking for Expiring Other IDS"

		CASE else
			messagebox("Continue","This utility does not support Expiring verification Creation for the " + ls_screen_name + " screen.")
			continue
	END CHOOSE
	if ls_dataobject = "" then
		continue
	end if
	
	FOR ll_dataobject_arr_i = 1 TO ll_dataobject_arr_cnt
		IF ls_dataobject_arr[ll_dataobject_arr_i] = ls_dataobject THEN
			lds_data = lds_dataobject_arr[ll_dataobject_arr_i]
			EXIT
		END IF
	END FOR
	
	dc = lds_data.Rowcount()

	cnt = 0

	if dc < 1 then continue
	for d = 1 to dc

		ll_rec = lds_data.getitemnumber(d,"rec_id")
		ll_prac = lds_data.getitemnumber(d,"prac_id")

		//move expiration date to verif info table if there is one
		IF ll_ref_exp > 0 THEN
			IF ls_refexp_name = "certification_expires" THEN	
				ldt_exp_date = DateTime(Date( "12-30-" + String( lds_data.GetItemNumber( d, ls_refexp_name ) ) ),Now())
				
			ELSEIF ls_refexp_name = "cert_expiration_year" THEN
				li_month = lds_data.GetItemNumber( d, "cert_expiration_month" )
				choose case li_month
					case 2
						li_days = 28
					case 1,3,5,7,8,10,12
						li_days = 31
					case else
						li_days = 31
				end choose
				if isnull(li_month) then
					ldt_exp_date = DateTime(Date( "12-31-" + String( lds_data.GetItemNumber( d, ls_refexp_name ) ) ),Now())
				else
					ldt_exp_date = DateTime(Date(String(li_month) + String(li_days) + String( lds_data.GetItemNumber( d, ls_refexp_name ) ) ),Now())
				end if
			ELSE
				ldt_exp_date = lds_data.GetItemDateTime( d, ls_refexp_name )
			END IF
		ELSE
			continue
		END IF
	//*************** reference data *******************
		IF ll_ref1 > 0 THEN
			IF ls_ref1_dtype = "N" or ls_ref1_dtype = "I" then
				ls_reference1 =  string(lds_data.GetItemNumber( d, ls_ref1_name ))
			elseif ls_ref1_dtype = "C" then
				ls_reference1 =  lds_data.GetItemstring( d, ls_ref1_name )
			elseif ls_ref1_dtype = "D" then
				ls_reference1 =  string(date(lds_data.GetItemdatetime( d, ls_ref1_name )))
			end if
			if ls_ref1_lu = "Y" then
				ll_code = long(ls_reference1)
				if isnumber(ls_reference1) then ll_address_code = ll_code
				if ls_ref1_lutype = "A" then
					ll_lookup_address_r = lds_address_lookup.Find( "lookup_code = " + String(ll_code),1 ,lds_address_lookup.Rowcount() )
					ls_reference1 = ""
					If ll_lookup_address_r > 0 THEN
					if upper(ls_ref1_lufield) = "ENTITY NAME" THEN
						ls_reference1 = lds_address_lookup.GetitemString(ll_lookup_address_r, "entity_name")
					else
						ls_reference1 = lds_address_lookup.GetitemString(ll_lookup_address_r, "code")
					end if
					END IF
				elseif ls_ref1_lutype = "C" then
					if upper(ls_ref1_lufield) = "DESCRIPTION" THEN
						ls_reference1 = gnv_data.of_getitem( "code_lookup", "description", "lookup_code = " + String(ll_code))
					else
						ls_reference1 = gnv_data.of_getitem( "code_lookup", "code", "lookup_code = " + String(ll_code))
					end if
				end if
			end if
		end if			
		if isnull(ls_reference1) then ls_reference1 = ""
					
		//get reference 2 data
		IF ll_ref2 > 0 THEN
			IF ls_ref2_dtype = "N" or ls_ref2_dtype = "I" then
				ls_reference2 =  string(lds_data.GetItemNumber( d, ls_ref2_name ))
			elseif ls_ref2_dtype = "C" then
				ls_reference2 =  lds_data.GetItemstring( d, ls_ref2_name )
			elseif ls_ref2_dtype = "D" then
				ls_reference2 =  string(date(lds_data.GetItemdatetime( d, ls_ref2_name )))
			end if
			if ls_ref2_lu = "Y" then
				ll_code = long(ls_reference2)
				if isnumber(ls_reference2) then ll_address_code = ll_code
				if ls_ref2_lutype = "A" then
					ll_lookup_address_r = lds_address_lookup.Find( "lookup_code = " + String(ll_code),1 ,lds_address_lookup.Rowcount() )
					ls_reference2 = ""
					If ll_lookup_address_r > 0 THEN
					if upper(ls_ref2_lufield) = "ENTITY NAME" THEN
						ls_reference2 = lds_address_lookup.GetitemString(ll_lookup_address_r, "entity_name")
					else
						ls_reference2 = lds_address_lookup.GetitemString(ll_lookup_address_r, "code")
					end if
					END IF
				elseif ls_ref2_lutype = "C" then
					if upper(ls_ref2_lufield) = "DESCRIPTION" THEN
						ls_reference2 = gnv_data.of_getitem( "code_lookup", "description", "lookup_code = " + String(ll_code))
					else
						ls_reference2 = gnv_data.of_getitem( "code_lookup", "code", "lookup_code = " + String(ll_code))
					end if
				end if
			end if
		END IF
		if isnull(ls_reference2) then ls_reference2 = ""
		ls_reference = ls_reference1 + " - " + ls_reference2
		
		IF li_screen = 4 THEN					
			ll_address_code = lds_data.GetItemNumber( d, "verifying_agency" )
		end if

		lds_facils.Setfilter( "prac_id = " + String(ll_prac) + " AND facility_ver_rules_screen_id = " + String(li_screen))
		lds_facils.Filter( )
		fc = lds_facils.Rowcount( )
		if fc < 1 then
			continue
		end if
		for f = 1 to fc
			li_found = 0
			ll_facil = lds_facils.getitemnumber(f,"verifying_facility")
			exp_days = lds_facils.getitemnumber(f,"exp_cred_que_letters_days")
			ls_priority_user = lds_facils.getitemstring(f,"priority_user")
			if RelativeDate ( today(), exp_days ) <  date(ldt_exp_date) then continue //skip if has not expired yet by these rules
			
			cnt = lds_verif.Find("rec_id = " + String(ll_rec) + " AND prac_id = " + String(ll_prac) +&
			" AND facility_id = " + String(ll_facil), 1 ,lds_verif.Rowcount())
			//--------------------------- APPEON BEGIN ---------------------------
			//$<modify> 2007.08.31 By: Jack
			//$<reason> Fix a defect.
			/*
			if cnt < 0 then messagebox("retrieval failure",cnt)
			*/
 			if cnt < 0 then messagebox("Retrieval Failure",cnt)
			//---------------------------- APPEON END ----------------------------
			if cnt > 0 then
				continue
			else
				if isnull(ll_seq) or ll_seq = 0 Then					
					select max(seq_no) into :ll_seq from verif_info;
					if isnull(ll_seq) then ll_seq = 0
				end if
				ll_seq++
			
				//********* create verif ****************
				ll_newrow = lds_verif.insertrow(0)
					
				lds_verif.setitem(ll_newrow,"rec_id",ll_rec)
				lds_verif.setitem(ll_newrow,"prac_id",ll_prac)
				lds_verif.setitem(ll_newrow,"facility_id",ll_facil)
				lds_verif.setitem(ll_newrow,"seq_no",ll_seq)
				lds_verif.setitem(ll_newrow,"screen_id",li_screen)
				lds_verif.setitem(ll_newrow,"active_status",1)
				lds_verif.setitem(ll_newrow,"number_sent",0)
				lds_verif.setitem(ll_newrow,"source","P")
				lds_verif.setitem(ll_newrow,"expiration_date",ldt_exp_date)
				lds_verif.setitem(ll_newrow,"address_lookup_code",ll_address_code)
				lds_verif.setitem(ll_newrow,"verification_method",ll_verif_method)
				lds_verif.setitem(ll_newrow,"reference_value",ls_reference)
				lds_verif.setitem(ll_newrow,"priority_user",ls_priority_user)
				lds_verif.setitem(ll_newrow,"priority",1)
				lds_verif.setitem(ll_newrow,"exp_credential_flag",1)
				ls_doc_id = String( ll_rec ) + "-" + String( ll_prac ) + "-" + String( ll_facil ) + "-" + String( ll_seq )
				lds_verif.setitem(ll_newrow,"doc_id",ls_doc_id)
				lds_verif.setitem(ll_newrow,"print_flag",0)
				lds_verif.setitem(ll_newrow,"notes","eieio")
				
				tcnt++			
			end if
			
		next
	next
	if isvalid(w_aiq_run) then  w_aiq_run.r_status.width = w_aiq_run.r_status.width + clicks
next

gnv_appeondb.of_autocommit()
lds_verif.update()
commit using sqlca;
/*****         LOOP FINALLY END           ***************************************************************/

destroy lds_screen
destroy lds_facils
destroy lds_sys_field
destroy lds_verif
destroy lds_data

FOR ll_dataobject_arr_i = 1 TO ll_dataobject_arr_cnt
	Destroy lds_dataobject_arr[ll_dataobject_arr_i]
END FOR

Destroy lds_address_lookup

if isvalid(w_aiq_run) then  w_aiq_run.r_status.width = 800
return 1

//---------------------------- APPEON END ----------------------------

end function

public function integer of_run_ai_query (integer ai_from);//maha added 082903
integer xtype
integer db

//select set_26 into :xtype from icred_settings;
xtype = of_get_app_setting("set_26","I")

open(w_aiq_run) 

w_aiq_run.st_1.text = "Checking for Expiring Credential Verifications"
if xtype = 1 then
	of_expiring_credentials_from_data()
else
	of_expiring_credentials()
end if
if isvalid(w_aiq_run) then  w_aiq_run.r_status.width = 800

w_aiq_run.st_1.text = "Checking for Letters that need to be reprinted"
of_resend_letters()
if isvalid(w_aiq_run) then  w_aiq_run.r_status.width = 1100

if isvalid(w_aiq_run) then  w_aiq_run.st_1.text = "Checking for Expiring Appointment Verifications"
of_expiring_appointments()
if isvalid(w_aiq_run) then  w_aiq_run.r_status.width = 1495

if ai_from = 1 then //daily login process
	//select set_33 into :db from icred_settings;
	db = of_get_app_setting("set_33","I")
	if db = 1 then
		string ls_path
		string ls_state

		select database_backup_path into :ls_path from ids;
		
		if isnull(ls_path) then
			messagebox("No path","A default save path must be specified from the utilities Back up Database function.")
		else
			w_aiq_run.st_1.text = "BACKING UP DATABASE (This may take a few minutes.)"
			setpointer(hourglass!)
			ls_state = "BACKUP DATABASE DIRECTORY " + "'" + ls_path + "'" + ";"
			if isvalid(w_aiq_run) then  w_aiq_run.r_status.width = 250
			//messagebox("",ls_state)
			execute immediate :ls_state using sqlca;
			setpointer(arrow!)
			if isvalid(w_aiq_run) then  w_aiq_run.r_status.width = 1595
		end if
	end if
end if

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 2006-10-16 By: Rodger Wu (Inova)
//$<reason> Create verifications based on missing items existing 90 days.

of_missing_info_90_days_generate()

//---------------------------- APPEON END ----------------------------

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 03.09.2007 By: Jervis
//$<reason> WebView Practitioner Application Initiated Work Flow
if isvalid(w_aiq_run) then  w_aiq_run.r_status.width = 1700
w_aiq_run.st_1.text = "Create Work Flow For WebView.This may take a few minutes."
of_wv_Initiated_workflow()
//---------------------------- APPEON END ----------------------------

if isvalid(w_aiq_run) then  close(w_aiq_run)

return 1

end function

public function integer of_printletters (string as_doc_id[], string as_affil_stat, string as_letter_name, string as_letter_type, u_dw adw_detail, string as_doc_name, boolean ab_print_preview, string as_sql, long as_pracids[], integer ai_facility);Boolean lb_error_rec
Boolean lb_print_release 
Boolean lb_print_priv
Boolean lb_found
Boolean lb_print_label = False
String ls_notes
String ls_doc_name
String ls_path
String ls_letter
String ls_file_name
String ls_image_file_name
String ls_image_path
String ls_letter_dw
String ls_style
String ls_entity[]
String ls_val
String ls_val_1
String ls_verifying_facility_name[]
String ls_word_path
String ls_letter_path
String ls_letter_paths_all[]
String ls_doc_id
String ls_verifying_facility_nm
string ls_from //maha 052802
string ls_to //maha 052802
string ls_c
string ls_run_path
string ls_open_doc
string ls_open_merge
string ls_exportname
n_ds lds_letter
Integer li_error_cnt
Integer e
Integer li_doc_id_cnt
Integer d
Integer b
Integer li_len
Integer li_start_page
Integer li_to_page
Integer li_num_pages  
Integer l
long li_ltr_rec_cnt//maha101000 to long
Integer li_retval
Integer li_total_letter_path_cnt
Integer li_last_num_sent
Integer li_rc
Integer li_total_letters
Integer i
Integer li_val
Integer li_found
Integer s
Integer li_ent_cnt
Integer li_pos
Integer li_ans
Integer li_ltr_cnt
Integer li_verif_facility_id
Integer li_total_facilities_cnt
Integer li_verif_facility_ids_all[]
Integer li_address_cnt
integer li_set6//maha
integer li_export_id = 0 //maha
integer li_export_on = 0  //maha 021704
integer li_corr_response = -1 //maha 041008 
Long ll_prac_id
Long ll_loop_count
long li_facility_id = ai_facility//maha 021704
long ll_ver_response //maha 041008
string docid //maha
integer res  //maha
integer li_image_cnt //maha 021904
integer lcnt

Boolean lb_retrieved = false  //Ken.Guo 10/31/2007
ls_doc_name = as_doc_name  //Ken.Guo 11/01/2007 Fix bug

is_letter_name = as_letter_name

//as_doc_name is the name of the document no path
//as_letter_name is the screen name for verif letters ; the document name for correspondence letters

//messagebox("as_letter_name",as_letter_name)
//Start Code Change ---- 01.23.2006 #215 maha
ls_run_path = of_letter_paths("L") //letter path
ls_open_merge = of_letter_paths("D") //merge document path
//End Code Change---01.23.2006 

gnv_rights.of_check_dir_right(ls_run_path, true, 'Letter Path')
gnv_rights.of_check_dir_right(ls_open_merge, true, 'Letter Path')

//Start Code Change ---- 09.27.2007 #V7 maha
if as_letter_type = "P" then //for correspondence letter get the export info
	select count(letter_name) into :lcnt from sys_letters where letter_name = :as_letter_name;	
	if lcnt < 1 then
		messagebox("Letter Error","Letter '" + as_letter_name + "' does not exist in the letter Painter.  Unable to run letter." )
		return -1
	else
		select use_export, export_id, letter_name into :li_export_on,:li_export_id, :is_letter_name from sys_letters where letter_name = :as_letter_name;		
	end if
end if
//End Code Change---09.27.2007
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-24
//$<add> 01.13.2006 By: Cao YongWang
//$<reason> Performance tuning
//$<modification> Create the downloading directory if it does not exist.
n_appeon_download lnv_download
If gnv_data.of_getitem('icred_settings' ,'set_50' , False ) = '1' or &
   Upper( appeongetclienttype() ) = 'WEB' Then

	//Down load the file from database
	n_appeon_storage_area lnv_storage_area

	IF lnv_storage_area.of_retrieve_doc_from_db( ai_facility, as_doc_name, ls_letter_path) < 0 THEN //
		Messagebox("Download File",'The MSWord document '+  as_doc_name  +'  does not exist in the database. (of_printletters)')
		RETURN -1
	END IF	
	
	as_doc_name = ls_letter_path + as_doc_name
	
	lnv_download.of_parsepath( ls_open_merge)
End If
//---------------------------- APPEON END ----------------------------

//SELECT set_6 INTO :li_set6 FROM icred_settings;
li_set6 = of_get_app_setting("set_6","I")
//messagebox("ls_open_merge",ls_open_merge)
//messagebox("as_doc_name",as_doc_name) //as_doc_name is the path and the letter name
//return 1
li_pos = Pos( is_letter_name, "/" )  //replacing / and spaces with _
IF li_pos > 0 THEN
	is_letter_name = Mid( is_letter_name, 1, li_pos -1) + "_" + Mid( is_letter_name, li_pos+1, 500 )
END IF

li_pos = Pos( is_letter_name, " " )
IF li_pos > 0 THEN
	is_letter_name = Mid( is_letter_name, 1, li_pos -1) + "_" + Mid( is_letter_name, li_pos+1 )
END IF

li_pos = Pos( is_letter_name, " " )
IF li_pos > 0 THEN
	is_letter_name = Mid( is_letter_name, 1, li_pos -1) + "_" + Mid( is_letter_name, li_pos+1 )
END IF


ls_letter_dw = Lower( "d_ltr_" + is_letter_name )
if as_letter_type = "P" then ls_letter_dw =  "d_ltr_general_corros_act_items" //maha 081601
//messagebox("ls_letter_dw",ls_letter_dw)

//create the action items detail dw and share it with the one on the action item interface
ids_ai_detail = CREATE n_ds
ids_ai_detail.DataObject = adw_detail.DataObject 
adw_detail.ShareData( ids_ai_detail )
//messagebox("adw_detail.DataObject",adw_detail.DataObject)
//GarbageCollect ( )maha removed 073002

//create the letters datawindow and retrieve using the doc id
lds_letter = CREATE n_ds
IF as_sql = '' OR IsNull( as_sql ) THEN //verification letters
	//--------------------------- APPEON BEGIN ---------------------------
	//$<modify> 10/31/2007 By: Ken.Guo
	//$<reason> For retrieve performance
	//lds_letter.DataObject = ls_letter_dw
	If Upper(appeongetclienttype()) = 'WEB' Then
		Choose Case ls_letter_dw
			Case 'd_ltr_expiring_dea_registration_w_cat'  //long name
				lds_letter.DataObject = 'd_ltr_expiring_dea_registration_w_catweb'
			Case 'd_ltr_expiring_special_certifications' // long name
				lds_letter.DataObject = 'd_ltr_expiring_special_certificationsweb'
			Case Else 
				lds_letter.DataObject = ls_letter_dw + '_web'
		End Choose
	Else
		lds_letter.DataObject = ls_letter_dw 
	End If
	//---------------------------- APPEON END ----------------------------	
	li_retval =lds_letter.of_SetTransObject( SQLCA )
	//MessageBox("Letter dw","")
	IF li_retval =-1 THEN
		MessageBox("Letter dw","Invalid Letter Datawindow name  -" + ls_letter_dw )
		Return -1
	END IF
ELSE  //for all valid standard letters
	String ls_group_syntax
	String ls_grey
	String ls_white
	String ls_presentation_str
	String ls_dwsyntax_str
	String Errors
	ls_group_syntax = ""
	ls_grey = String(rgb(192,192,192))
	ls_white = String(rgb(255,255,255))
	ls_presentation_str = "style( type=Group) Column(Border=0) Datawindow(Color=" + ls_white + " )" + "Text(Border=6 Background.Color=" + ls_grey + ")"
	
	as_sql = as_sql + " AND ( doc_id IN ("
	
	li_doc_id_cnt = UpperBound( as_doc_id[] )

	FOR d = 1 TO li_doc_id_cnt
		as_sql = as_sql + "'" +  as_doc_id[d] + "',"
	END FOR
	
	as_sql = Mid( as_sql, 1, Len( as_sql )-1 ) + "))"
	
	ls_dwsyntax_str = SQLCA.SyntaxFromSQL(as_sql, ls_presentation_str, ERRORS)
	
	//ClipBoard( as_sql )

	IF Len(ERRORS) > 0 THEN
		MessageBox("Caution", &
		"SyntaxFromSQL caused these errors: " + ERRORS)
		RETURN -1
	END IF

	lds_letter.Create( ls_dwsyntax_str, ERRORS)
	
	IF Len(ERRORS) > 0 THEN
		MessageBox("Caution", &
		"Create cause these errors: " + ERRORS)
		RETURN -1
	END IF
	
	lds_letter.SetTransObject( SQLCA )
	lds_letter.Retrieve( )
	lb_retrieved = True  //Ken.Guo 10/31/2007
END IF


//messagebox("docid",docid)
//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 10/31/2007 By: Ken.Guo
//$<reason> For Web Performance
//li_ltr_rec_cnt = lds_letter.Retrieve( as_doc_id )
//n_cst_arr_to_db 
string ls_client_id
n_cst_array_db ln_cst_array_db_case
If lb_retrieved = False Then 
	If Upper(appeongetclienttype()) = 'WEB' Then
		ln_cst_array_db_case = Create n_cst_array_db
		ln_cst_array_db_case.of_array_to_db( as_doc_id, ls_client_id)
		li_ltr_rec_cnt = lds_letter.Retrieve( ls_client_id )
		ln_cst_array_db_case.of_delete_temp_data(ls_client_id)
		Destroy ln_cst_array_db_case
	Else
		li_ltr_rec_cnt = lds_letter.Retrieve( as_doc_id )
	End If
End If
//---------------------------- APPEON END ----------------------------


//messagebox("li_ltr_rec_cnt",li_ltr_rec_cnt)
IF li_ltr_rec_cnt < 1 THEN
	MessageBox(" Retrieval Error", "Letter query did not return any results. Check for missing data." )		
	RETURN -1
ELSE
	//************************************************************************
	//EXPORT CODE
	//\/maha 110402 check and create export file for merge document 
	if gi_export_on = 1 then 
		if as_letter_type = "P" then //for correspondence letter get the export info
			//select use_export, export_id into :li_export_on,:li_export_id from sys_letters where letter_name = :as_letter_name;		
			select use_export, export_id,response_required into :li_export_on,:li_export_id, :li_corr_response from sys_letters where letter_name = :as_letter_name;	
			if li_export_on = 1 then
				if li_export_id > 0 then
					res = of_run_export(as_pracids[],li_export_id,ls_open_merge)
					if res < 1 then 
						messagebox("Export Error","Failed to create file from export.")
						li_export_on = 0
					else
						select export_name into :ls_exportname from export_header where export_id = :li_export_id;
					end if
				end if
			end if
		else
			IF as_letter_name = "expiring_appointment"  THEN
				SELECT reapp_export, reapp_export_id
				INTO:li_export_on,
					 :li_export_id 
				FROM facility
				WHERE facility_id = :ai_facility;
				IF SQLCA.SQLCODE = -1 THEN
					MessageBox("SQL ERROR", SQLCA.SQLERRTEXT )
					Return -1
				END IF
			elseif as_letter_name = "expiring_provisional" then
				SELECT prov_export, prov_export_id
				INTO:li_export_on,
					 :li_export_id
				FROM facility
				WHERE facility_id = :ai_facility;
				IF SQLCA.SQLCODE = -1 THEN
					MessageBox("SQL ERROR", SQLCA.SQLERRTEXT )
					Return -1
				END IF	
			elseif as_letter_name = "expiring_allied_health"  then
				SELECT reappah_export, reappah_export_id
				INTO:li_export_on,
					 :li_export_id
				FROM facility
				WHERE facility_id = :ai_facility;
				IF SQLCA.SQLCODE = -1 THEN
					MessageBox("SQL ERROR", SQLCA.SQLERRTEXT )
					Return -1
				END IF
			END IF
			if li_export_on = 1 then
				if li_export_id > 0 then
					res = of_run_export(as_pracids[],li_export_id,ls_open_merge)
					if res < 1 then 
						messagebox("Export Error","Failed to create file from export.")
						li_export_on = 0
					else
						select export_name into :ls_exportname from export_header where export_id = :li_export_id;
					end if
				end if
			end if	
		end if
	end if
	//\maha	
END IF

//If its a list letter figure out the different places it has to go
IF Upper(as_letter_type) = "L" THEN
	ls_style = "list"
	FOR i = 1 TO li_rc //maha 041008 - this block of code does nothing because li_rc has no value (0)
		ls_val = lds_letter.GetItemString(  i, "entity_name" )
		lb_found = False
		FOR s = 1 TO li_ent_cnt
			IF ls_val = ls_entity[ s ] THEN
				lb_found = True
				Exit
			END IF
		END FOR
		IF NOT lb_found THEN
			li_ent_cnt++
			li_total_letters++
			ls_entity[ li_ent_cnt ] = ls_val
		END IF
 	END FOR
ELSE
	li_total_letters = 1
	ls_style = "ind"
END IF


li_ltr_cnt = 0 //w_ai_print_letters_new.dw_letters.GetItemNumber( w_ai_print_letters_new.dw_letters.GetRow(), "ctotal_letters"  )

//loop through for each letter that needs to be printed



FOR i = 1 TO li_total_letters
//		IF w_ai_print_letters_new.dw_letters.GetItemnumber( 1, "num_printed" ) > 0  THEN  //maha added 051501
//		continue
//	END IF
	//for each letter path that is different a different letter will need to be printed
		// if its a list letter then filter out by each entity
		IF Upper(as_letter_type) = "L" THEN
			//lds_letter.SetFilter( " Upper(entity_name) = Upper('" + ls_entity[ i ] + "') AND verifying_facility = " + String( li_verif_facility_ids_all[l] ) )
			lds_letter.SetFilter( " Upper(entity_name) = Upper('" + ls_entity[ i ] + "')" )
			lds_letter.Filter()
		END IF
		
		li_rc = lds_letter.RowCount( )
			
		IF li_rc < 1 THEN
				RETURN -1 //CONTINUE
				messagebox("","no li_rc")
		END IF
		
	//	IF lds_letter.Describe( "doc_id" ) <> "!" THEN
		//lds_letter.SetSort( "doc_id" )
		//lds_letter.Sort( )
	//	END IF
		//if gi_citrix = 1 then //if citrix save to user folder
			lds_letter.SaveAs( ls_open_merge + is_letter_name + ".txt", Text!, True )		
			lds_letter.SaveAs( ls_open_merge + "mailing_labels_ver_letter.txt", Text!, True )		
			lds_letter.SaveAs( ls_open_merge + "ind_generic_corrospondence.txt", Text!, True )
			//if running from an export set the merge variable to the export name 
			if li_export_on = 1 then
				//08.28.2007 By Jervis return by of_run_export function
				//ls_open_merge =  ls_open_merge + ls_exportname + ".txt"
			else
				ls_open_merge =  ls_open_merge + is_letter_name + ".txt"
			end if


	 	//word path code removed 02 2405 maha 4.517 readded 071805 to allow as option
		if li_set6 = 5 then
			ls_word_path = ProfileString(gs_IniFilePathName, "paths", "word", "None")
			
			//--------------------------- APPEON BEGIN ---------------------------
			//$<ID> PT-25
			//$<modify> 01.17.2006 By: Cao YongWang
			//$<reason> There is no need to have the Web application read local INI files. The Web application
			//$<reason> reads INI files from Web server.
			//$<modification> Write the following script to make sure that when IntelliCred is running on the Web, it
			//$<modification> does not read local INI files.
			//IF NOT FileExists( gs_dir_path + gs_DefDirName + "\intellicred.ini" ) THEN
			//	MessageBox("ini File Error", "No intellicred.ini file found at: " + gs_dir_path + gs_DefDirName + "\intellicred.ini" )
			//	Return -1
			//END IF
			If appeongetclienttype() = 'PB' Then
				IF NOT FileExists(gs_IniFilePathName) THEN
   					MessageBox("INI File Error", "No intellicred.ini file was found at: " + gs_IniFilePathName )
					Return -1
				END IF
			End If
			//---------------------------- APPEON END ----------------------------

	
			//get the verification letter path
			//ls_letter_path  = ls_letter_paths_all[ l ]
	
			//check to see if ms word path set in ini file is correct
			IF NOT FileExists( ls_word_path ) THEN 
  				MessageBox("Print Error", "Invalid MS Word for Windows path set in INI file: " + ls_word_path )
				Return -1
			END IF
		end if

		//s:\letters\education.doc"
		li_len = Len( as_doc_name )

		//jad 4/25/02       why?
		FOR b = li_len TO 1 STEP -1	
			ls_letter = Mid( as_doc_name, b, 1 )
			IF ls_letter = "\" THEN
				EXIT
			END IF
		END FOR
		//break as_doc_name into path and letter
		ls_path = Mid( as_doc_name, 1, b )
		//messagebox("", ls_path ) //ls_path is the location where the letter if found before copying
		ls_file_name = Mid( as_doc_name, b+1, 100 )  //jad 4/25/02
		//ls_file_name = Mid( as_doc_name, 
		//messagebox("", ls_file_name )

		//copy down to local drive from network?	//jad 4/25/02	
		
		
		IF li_set6 = 1 THEN //copy letter
			if upper(ls_path) = upper(ls_run_path) then //maha 050602 trap against copying to same location
  				messagebox("Path error","Your letter path is set to " + ls_run_path + " ~rand the Copy Letters setting is turned on. ~rGo to System->Utilities->Application settings and set Copy Letters to No to run letters normally.")
				return -1
			end if
			//check to make sure letter and path exists
			IF NOT FileExists(as_doc_name ) THEN
				MessageBox("Print Error", "Cannot find word letter " + ls_file_name + " in directory: " + ls_path )
				Return -1
			else
				ls_from  = as_doc_name
			END IF
			
			ls_to = ls_run_path + ls_file_name
				//copy letter  then run
				if fileexists(ls_to) then
					if FileDelete( ls_to) = false then //maha040705
						//messagebox("Copying letter from server","Unable to delete existing letter " + ls_doc_name + " in " + gs_dir_path + gs_DefDirName + "\Letters\Standard prior to copy.~r  Check letter properties to see if letter is Read Only.")
						messagebox("Copying letter from server","Unable to delete existing letter " + ls_to + " prior to copy.~r  Check letter properties to see if letter is Read Only.")  //Start Code Change ----02.28.2008 #V8 maha - corrected message to correct path
					end if
				end if
				//Run( ls_path + "copyltr.bat " + as_doc_name, Minimized! )
				CopyFileA( ls_from, ls_to, true )
				
				ls_letter_path = ls_to
				DO WHILE NOT FileExists( ls_to )
					ll_loop_count++
					IF ll_loop_count = 1000000 THEN
						MessageBox("Timeout", "Timed out trying to copy Word file.  ~rfrom: " + ls_from + "~r to: " + ls_to)
						EXIT
					END IF
				LOOP
		else //if not copied use as_doc_name
			ls_letter_path = as_doc_name
		END IF
		
		//check to make sure letter and path exists
		IF NOT FileExists(ls_letter_path ) THEN
			MessageBox("Print Error", "Invalid letter document path: " + ls_letter_path )
			Return -1
		END IF

		//as_affil_stat = "S" all the time right now because I decided there would be one letter for initial and reapp
//		as_affil_stat = "S"
//		IF as_affil_stat = "S" THEN
//			IF ab_print_preview THEN
//				ls_doc_name = as_doc_name + " /mpreview"
//			ELSE
//				ls_doc_name = as_doc_name //+ " /mmergeclose"					
//			END IF

//			Run( ls_word_path + " " + ls_doc_name, Maximized! )				
//		END IF
	
		if li_set6 = 5 then //maha 071805 to allow old method cannot be used with copy letters
			Run( ls_word_path + " " + ls_letter_path , Maximized!)//" /mpreview"
		else
			// mskinner 04 Oct 2005 - begin
			//Start Code Change ---- 03.27.2006 #345 maha added trap return
			if gnv_app.gnvlo_msword.of_open_word_document( ls_letter_path, ls_open_merge, "Verification") = -1 then
				return -1
			end if
			//End Code Change---03.27.2006
			//of_open_letter(ls_letter_path,ls_open_merge,"Verification")
			// mskinner 04 Oct 2005 - end 
		end if
	
	
		//jad  03/08/04 fax stuff
		gs_fax lgs_fax

	//	ls_letter_path = gs_dir_path + gs_DefDirName + "\letters\standard\"
//		ls_letter_path = ls_run_path
		
		//--------------------------- APPEON BEGIN ---------------------------
		//$<modify> 07.04.2006 By: LeiWei
		//$<reason> Doc save to db
		/*
		IF Pos( Upper(ls_letter_dw), "EXPIRING" ) > 0 THEN //changed 020201 maha
			lgs_fax.ss_mail_label_doc = ls_run_path + "mailing_labels_prac_corro_letters.doc"// + "/mpreview"
		ELSE			
			lgs_fax.ss_mail_label_doc = ls_run_path + "mailing_labels_ver_letter.doc"// + "/mpreview"
		END IF
		*/
		If gnv_data.of_getitem('icred_settings' ,'set_50' , False ) = '1' or &
	   Upper( appeongetclienttype() ) = 'WEB' Then
			IF Pos( Upper(ls_letter_dw), "EXPIRING" ) > 0 THEN //changed 020201 maha
				lgs_fax.ss_mail_label_doc = "mailing_labels_prac_corro_letters.doc"// + "/mpreview"
			ELSE			
				lgs_fax.ss_mail_label_doc = "mailing_labels_ver_letter.doc"// + "/mpreview"
			END IF
		else
			IF Pos( Upper(ls_letter_dw), "EXPIRING" ) > 0 THEN //changed 020201 maha
				lgs_fax.ss_mail_label_doc = ls_run_path + "mailing_labels_prac_corro_letters.doc"// + "/mpreview"
			ELSE			
				lgs_fax.ss_mail_label_doc = ls_run_path + "mailing_labels_ver_letter.doc"// + "/mpreview"
			END IF
		end if
		//---------------------------- APPEON END ----------------------------

		lgs_fax.ss_message = "Did the " + is_letter_name + " letter print Ok?"
		lgs_fax.ss_letter_name =  ls_style + "_" + is_letter_name + "_letter" 
		lgs_fax.ss_letter_document_name = ls_doc_name// + "/mpreview"
		lgs_fax.sdw_letter = lds_letter

		IF is_letter_name = "expiring_appointment"  OR is_letter_name = "expiring_provisional" OR is_letter_name = "expiring_allied_health" THEN
			lgs_fax.ss_letter_type = "ExpAppt"
		elseif as_letter_type = "P" then //maha 062705
			lgs_fax.ss_letter_type = "Corro"
		ELSEIF Pos( Upper(ls_letter_dw), "EXPIRING" ) > 0 THEN
			lgs_fax.ss_letter_type = "ExpLtr"								
		ELSE
			lgs_fax.ss_letter_type = "Verif"			
		END IF		
		//messagebox("lettertype",lgs_fax.ss_letter_type)
		//end here	

		//OpenWithParm( w_ai_print_msg_box, "Did the " + is_letter_name + " letter print ok?" + "," + ls_style + "_" + is_letter_name + "_letter"  )
		OpenWithParm( w_ai_print_msg_box, lgs_fax )		
		gs_fax_error_records lst_fax_error_records
		lst_fax_error_records = Message.PowerObjectParm
		IF lst_fax_error_records.il_error_rec_num[ 1 ] = -2 THEN		
			Return -1
		END IF		
		
		li_error_cnt = UpperBound( lst_fax_error_records.il_error_rec_num )
		
		//update the action item detail screen with date/time user stamps
		FOR s = 1 TO li_rc
			
			lb_error_rec = False
			FOR e = 1 TO li_error_cnt
				IF lst_fax_error_records.il_error_rec_num[e] = s THEN
					lb_error_rec = True
					Exit
				END IF
			END FOR
			IF lb_error_rec THEN
				CONTINUE
			END IF
			
			ls_doc_id = lds_letter.GetItemString( s, "doc_id" )
			li_found = ids_ai_detail.Find( "doc_id = '" +  ls_doc_id + "'" , 1, 1000 )
			//--------------------------- APPEON BEGIN ---------------------------
			//$<add> 2006-10-08 By: Liu Hongxin
			//$<reason> Fix bug: if reprint, the print return 0.
			IF li_found < 1 THEN Continue
			//---------------------------- APPEON END ----------------------------
			li_last_num_sent = ids_ai_detail.GetItemNumber( li_found, "number_sent" )
			IF IsNull(li_last_num_sent) THEN
				li_last_num_sent = 0
			END IF
			li_last_num_sent++
			ids_ai_detail.SetItem( li_found, "number_sent", li_last_num_sent )
			ids_ai_detail.SetItem( li_found, "print_flag", 0 )			
			IF IsNull( ids_ai_detail.GetItemDateTime( li_found, "first_sent" ) ) THEN
				ids_ai_detail.SetItem( li_found, "first_sent", DateTime(Today(), Now()) )
			END IF
			
			//IF lst_fax_error_records.il_error_rec_num[ 1 ] = -5 OR lst_fax_error_records.il_error_rec_num[ 1 ] > 0 THEN		
				ls_notes = 	ids_ai_detail.GetItemString( li_found, "notes" ) 
				IF IsNull( ls_notes ) OR ls_notes = "" THEN
					ls_notes = ""
				END IF
				//messagebox("","in the adding notes fax if statement" )
				//ids_ai_detail.SetItem( li_found, "notes", ls_notes + " (Faxed-" + String(Today()) +")" )
			//END IF				
			ids_ai_detail.SetItem( li_found, "last_sent", DateTime(Today(), Now()) )
			//Start Code Change ----04.10.2008 #V8 maha
			if as_letter_type = "P" then // Correspondence (Approval) letters only
				if li_corr_response = 0 then //if needs response is set to No complete the verification
					SELECT code_lookup.lookup_code  	INTO :ll_ver_response	FROM code_lookup WHERE ( code_lookup.lookup_name = 'Credentials Verification Response' ) AND   ( code_lookup.code = 'N/A'  )   ;
					ids_ai_detail.SetItem(  li_found, "response_code", ll_ver_response )
					ids_ai_detail.SetItem(  li_found, "date_recieved", DateTime( Today(),Now()) )
					ids_ai_detail.SetItem(  li_found, "user_name", gs_user_id )
				end if
			end if
		//End Code Change---04.10.2008
		END FOR
						
		IF Upper(as_letter_type) = "L" THEN 
			li_ltr_cnt ++
		ELSE
			li_ltr_cnt = 1 //li_ltr_cnt = li_ltr_rec_cnt
		END IF
		
END FOR
	

//if all the letters were printed successfully then put a check next to the letter
IF li_ltr_cnt = li_total_letters THEN 
	w_ai_print_letters_new.dw_letters.SetItem( w_ai_print_letters_new.dw_letters.GetRow(), "num_printed", li_rc)	//maha 051501	
	w_ai_print_letters_new.dw_letters.SetItem( w_ai_print_letters_new.dw_letters.GetRow(), "print_status", 1 )
END IF 

//update the action item detail view by updating then re-retrieving data
IF ids_ai_detail.Update() <> 1 THEN
	MessageBox("Update Failed", "Error while updating " + adw_detail.DataObject )
ELSE
	COMMIT USING SQLCA;
	adw_detail.Event pfc_Retrieve()
END IF


Destroy ids_ai_detail
Destroy lds_letter
Destroy ids_ai_detail

Return 0
end function

public function integer of_expiring_credentials_from_data_old ();long s
long sc
long d
long dc
long f
long fc
long cnt = 0
long tcnt = 0
integer chk
long ll_rec
long ll_prac
long ll_facil 
Long ll_seq
integer li_screen
string ls_screen_name
integer li_act_stat
integer li_complete = 1
long ll_resp_code = 2
long ll_verif_method = 1
string ls_ref_value
long ll_ref1no
string ls_datatype
long ll_ref1
long ll_ref2
long ll_ref_exp
integer li_days
string ls_ref1_lu
string ls_ref2_lu
string ls_ref1_lutype
string ls_ref2_lutype
string ls_ref1_dtype
string ls_ref2_dtype
string ls_ref1_lufield
string ls_ref2_lufield
string ls_ref1_name
string ls_ref2_name
string ls_refexp_name
string ls_priority_user
string ldw
integer li_priority
integer li_exp_flag
string ls_doc_id
integer exp_days
long ll_rowcount
long r
long ll_newrow
datetime ldt_exp_date
long ll_null_no
integer li_bs_year
datetime ld_exp
integer ll_code
integer ac
string ls_reference1
string ls_reference2
string ls_reference
integer li_month
datetime ldt_null_date
long ll_address_code
integer li_exp_days
date ld_exp_ret
integer li_found
integer clicks
datastore lds_screen
datastore lds_facils
datastore lds_sys_field
datastore lds_verif
datastore lds_data

lds_screen = CREATE datastore
lds_screen.dataobject = "d_verif_screens_exp"
lds_facils = CREATE datastore
lds_facils.dataobject = "d_prac_affils_verif"
lds_sys_field = CREATE datastore
lds_sys_field.dataobject = "d_field_data"
lds_verif = CREATE datastore
lds_verif.dataobject = "d_verif_exp_4_record"
lds_data = CREATE datastore

//MSKINNER 15 MARCH 2005 -- BEGIN
if isvalid(w_aiq_run) then  w_aiq_run.r_status.width = 100
//MSKINNER 15 MARCH 2005 -- END


setnull(ldt_null_date)
lds_sys_field.settransobject(sqlca)
lds_facils.settransobject(sqlca)
lds_screen.settransobject(sqlca)//d_verif_screens_exp
sc = lds_screen.retrieve()//gets all distinct verif rules where data_view = 1, screen > 1 and exp_days > 0 and the screen has an exp_field
//st_sc.text = string(sc)
if sc < 1 then 
	messagebox("Expiring Credentials", "There are no verification rules set up for expiring Verifications.  Skipping this function.")
	return -1
	
end if

select lookup_code into :ll_verif_method from code_lookup where code = 'Exp Cred Ltr'; 
if ll_verif_method < 1 then
	messagebox("Missing Data", "You do not have a Verification Method lookup with the code of 'Exp Cred Ltr'.~rUnable to continue.")
	return -1
end if
clicks = integer(700/sc)
debugbreak()
for s = 1 to sc
//	st_cs.text = string(s)
	li_screen = lds_screen.getitemnumber(s,"screen_id")
	ls_screen_name = lds_screen.getitemstring(s,"screen_name")
	ll_ref1 = lds_screen.getitemnumber(s,"reference_field_1")
	ll_ref2 = lds_screen.getitemnumber(s,"reference_field_2")
	ll_ref_exp = lds_screen.getitemnumber(s,"exp_field")
	//messagebox("ll_ref_exp",ll_ref_exp)
	//ls_datatype = lds_screen.getitemstring(s,"field_type")
//	st_screen.text = ls_screen_name
	if lds_sys_field.retrieve(ll_ref1) < 1 then
		ll_ref1  = 0
		//messagebox("ll_ref1",ll_ref1)
	else		//ref one data
		ls_ref1_dtype = lds_sys_field.getitemstring(1,"field_type")
		ls_ref1_name = lds_sys_field.getitemstring(1,"field_name")
		ls_ref1_lu = lds_sys_field.getitemstring(1,"lookup_field")
		if ls_ref1_lu = "Y" then
			ls_ref1_lutype = lds_sys_field.getitemstring(1,"lookup_type")
			ls_ref1_lufield = lds_sys_field.getitemstring(1,"lookup_field_name")
		end if
	end if
	if lds_sys_field.retrieve(ll_ref2) < 1 then
		ll_ref2 = 0
	else	 //ref 2 data
		ls_ref2_dtype = lds_sys_field.getitemstring(1,"field_type")
		ls_ref2_name = lds_sys_field.getitemstring(1,"field_name")
		ls_ref2_lu = lds_sys_field.getitemstring(1,"lookup_field")
		if ls_ref2_lu = "Y" then
			ls_ref2_lutype = lds_sys_field.getitemstring(1,"lookup_type")
			ls_ref2_lufield = lds_sys_field.getitemstring(1,"lookup_field_name")
		end if
	end if
	//exp field
	if lds_sys_field.retrieve(ll_ref_exp) < 1 then //check for exp field (should be filtered for in retrieve)
		//messagebox("exp_ret",exp_ret)
		ll_ref_exp = 0
	else
		ls_refexp_name = lds_sys_field.getitemstring(1,"field_name")
	end if

	lds_data.dataobject = ""
	CHOOSE CASE li_screen

		CASE 4//"License"
			lds_data.dataobject = "d_exp_license_verif"
			//MSKINNER 15 MARCH 2005 -- BEGIN
         if isvalid(w_aiq_run) then  w_aiq_run.st_1.text = "Checking for Expiring Licenses"
         //MSKINNER 15 MARCH 2005 -- END
			
			
		CASE 5 //"DEA"
			lds_data.dataobject = "d_exp_dea_verif"
			if isvalid(w_aiq_run) then  w_aiq_run.st_1.text = "Checking for Expiring DEAs"

		CASE 9 //Special Certs
			lds_data.dataobject = "d_exp_spec_certs_verif"
			if isvalid(w_aiq_run) then  w_aiq_run.st_1.text = "Checking for Expiring Special Certifications"

		CASE 15 //"Insurance"
			lds_data.dataobject = "d_exp_insurance_verif"
			if isvalid(w_aiq_run) then  w_aiq_run.st_1.text = "Checking for Expiring Insurance Records"

		CASE 19 //"Board/Specialty"
			lds_data.dataobject = "d_exp_spec_verif"
			if isvalid(w_aiq_run) then  w_aiq_run.st_1.text = "Checking for Expiring Board Certifications"

		CASE 23 //Other Ids
			lds_data.dataobject = "d_exp_other_ids_verif"
			if isvalid(w_aiq_run) then  w_aiq_run.st_1.text = "Checking for Expiring Other IDS"

		CASE else
			messagebox("Continue","This utility does not support Expiring verification Creation for the " + ls_screen_name + " screen.")
			continue
	END CHOOSE
	//lds_data.dataobject = ldw
	if lds_data.dataobject = "" then
		continue
	end if
	lds_data.settransobject(sqlca)
	dc = lds_data.retrieve(today())
//	messagebox("dc",dc)
	cnt = 0
//	st_cnt.text = string(dc)
	if dc < 1 then continue
	for d = 1 to dc
//		st_rec.text = string(d)
		
		ll_rec = lds_data.getitemnumber(d,"rec_id")
		ll_prac = lds_data.getitemnumber(d,"prac_id")
//		choose case ll_rec
//			case 13000,12956,12204,2042,2043
//				debugbreak()
//				//messagebox("recid",ll_ref_exp)
//		end choose
		//move expiration date to verif info table if there is one
		IF ll_ref_exp > 0 THEN
			IF ls_refexp_name = "certification_expires" THEN	
				ldt_exp_date = DateTime(Date( "12-30-" + String( lds_data.GetItemNumber( d, ls_refexp_name ) ) ),Now())
				
			ELSEIF ls_refexp_name = "cert_expiration_year" THEN
				li_month = lds_data.GetItemNumber( d, "cert_expiration_month" )
				choose case li_month
					case 2
						li_days = 28
					case 1,3,5,7,8,10,12
						li_days = 31
					case else
						li_days = 31
				end choose
				if isnull(li_month) then
					ldt_exp_date = DateTime(Date( "12-31-" + String( lds_data.GetItemNumber( d, ls_refexp_name ) ) ),Now())
				else
					ldt_exp_date = DateTime(Date(String(li_month) + String(li_days) + String( lds_data.GetItemNumber( d, ls_refexp_name ) ) ),Now())
				end if
			ELSE
				ldt_exp_date = lds_data.GetItemDateTime( d, ls_refexp_name )
			END IF
		ELSE
			continue
		END IF
	//*************** reference data *******************
		//get reference 1 data
		
		IF ll_ref1 > 0 THEN
			IF ls_ref1_dtype = "N" or ls_ref1_dtype = "I" then
				ls_reference1 =  string(lds_data.GetItemNumber( d, ls_ref1_name ))
			elseif ls_ref1_dtype = "C" then
				ls_reference1 =  lds_data.GetItemstring( d, ls_ref1_name )
			elseif ls_ref1_dtype = "D" then
				ls_reference1 =  string(date(lds_data.GetItemdatetime( d, ls_ref1_name )))
			end if
			if ls_ref1_lu = "Y" then
				ll_code = long(ls_reference1)
				if isnumber(ls_reference1) then ll_address_code = ll_code
				if ls_ref1_lutype = "A" then
					if upper(ls_ref1_lufield) = "ENTITY NAME" THEN
						select entity_name into :ls_reference1 from address_lookup where lookup_code = :ll_code;
					else
						select code into :ls_reference1 from address_lookup where lookup_code = :ll_code;
					end if
				elseif ls_ref1_lutype = "C" then
					if upper(ls_ref1_lufield) = "DESCRIPTION" THEN
						select description into :ls_reference1 from code_lookup where lookup_code = :ll_code;
					else
						select code into :ls_reference1 from code_lookup where lookup_code = :ll_code;
					end if
				end if
			end if
		end if			
		if isnull(ls_reference1) then ls_reference1 = ""
					
		//get reference 2 data
		IF ll_ref2 > 0 THEN
			IF ls_ref2_dtype = "N" or ls_ref2_dtype = "I" then
				ls_reference2 =  string(lds_data.GetItemNumber( d, ls_ref2_name ))
			elseif ls_ref2_dtype = "C" then
				ls_reference2 =  lds_data.GetItemstring( d, ls_ref2_name )
			elseif ls_ref2_dtype = "D" then
				ls_reference2 =  string(date(lds_data.GetItemdatetime( d, ls_ref2_name )))
			end if
			if ls_ref2_lu = "Y" then
				ll_code = long(ls_reference2)
				if isnumber(ls_reference2) then ll_address_code = ll_code
				if ls_ref2_lutype = "A" then
					if upper(ls_ref2_lufield) = "ENTITY NAME" THEN
						select entity_name into :ls_reference2 from address_lookup where lookup_code = :ll_code;
					else
						select code into :ls_reference2 from address_lookup where lookup_code = :ll_code;
					end if
				elseif ls_ref2_lutype = "C" then
					if upper(ls_ref2_lufield) = "DESCRIPTION" THEN
						select description into :ls_reference2 from code_lookup where lookup_code = :ll_code;
					else
						select code into :ls_reference2 from code_lookup where lookup_code = :ll_code;
					end if
				end if
			end if
		END IF
		if isnull(ls_reference2) then ls_reference2 = ""
		ls_reference = ls_reference1 + " - " + ls_reference2
		
			//IF ls_screen_name = "Licensure" THEN
		IF li_screen = 4 THEN					
			ll_address_code = lds_data.GetItemNumber( d, "verifying_agency" )
		end if
		lds_facils.settransobject(sqlca)
		fc = lds_facils.retrieve(ll_prac,li_screen) //check the rules for each of the practitioners' verifying facilities 
		if fc < 1 then
			//messagebox("fc",fc)
			continue
		end if
		for f = 1 to fc
			li_found = 0
			ll_facil = lds_facils.getitemnumber(f,"verifying_facility")
			exp_days = lds_facils.getitemnumber(f,"exp_cred_que_letters_days")
			ls_priority_user = lds_facils.getitemstring(f,"priority_user")
			if RelativeDate ( today(), exp_days ) <  date(ldt_exp_date) then continue //skip if has not expired yet by these rules
			//select count(seq_no) into :cnt from verif_info where rec_id = :ll_prac and prac_id = :ll_prac and facility_id = :ll_facil and active_status = 1 and exp_credential_flag in (0,1);
			//d_verif_exp_4_record //any active record with no response code
			lds_verif.settransobject(sqlca)
			cnt = lds_verif.retrieve(ll_rec,ll_prac,ll_facil)
			if cnt < 0 then messagebox("retrieval failure",cnt)
			if cnt > 0 then
				continue
			else
				 //messagebox("",cnt)
				select max(seq_no) into :ll_seq from verif_info where rec_id = :ll_rec and prac_id = :ll_prac and facility_id = :ll_facil;
				if isnull(ll_seq) then ll_seq = 0
				ll_seq++
			
				//DaysAfter ( date1, date2 )
				//********* create verif ****************
				ll_newrow = lds_verif.insertrow(0)
					
				lds_verif.setitem(ll_newrow,"rec_id",ll_rec)
				lds_verif.setitem(ll_newrow,"prac_id",ll_prac)
				lds_verif.setitem(ll_newrow,"facility_id",ll_facil)
				lds_verif.setitem(ll_newrow,"seq_no",ll_seq)
				lds_verif.setitem(ll_newrow,"screen_id",li_screen)
				lds_verif.setitem(ll_newrow,"active_status",1)
				lds_verif.setitem(ll_newrow,"number_sent",0)
				lds_verif.setitem(ll_newrow,"source","P")
				lds_verif.setitem(ll_newrow,"expiration_date",ldt_exp_date)
				lds_verif.setitem(ll_newrow,"address_lookup_code",ll_address_code)
				lds_verif.setitem(ll_newrow,"verification_method",ll_verif_method)
				lds_verif.setitem(ll_newrow,"reference_value",ls_reference)
				lds_verif.setitem(ll_newrow,"priority_user",ls_priority_user)
				lds_verif.setitem(ll_newrow,"priority",1)
				lds_verif.setitem(ll_newrow,"exp_credential_flag",1)
				ls_doc_id = String( ll_rec ) + "-" + String( ll_prac ) + "-" + String( ll_facil ) + "-" + String( ll_seq )
				lds_verif.setitem(ll_newrow,"doc_id",ls_doc_id)
				lds_verif.setitem(ll_newrow,"print_flag",0)
				lds_verif.setitem(ll_newrow,"notes","eieio")
				
				tcnt++			
//				st_added.text = string(tcnt)
				debugbreak()
				lds_verif.update()
				commit using sqlca;
			end if
			
		next
//		lds_verif.update()
//		commit using sqlca;
	next
		
if isvalid(w_aiq_run) then  w_aiq_run.r_status.width = w_aiq_run.r_status.width + clicks
next

destroy lds_screen
destroy lds_facils
destroy lds_sys_field
destroy lds_verif
destroy lds_data

if isvalid(w_aiq_run) then  w_aiq_run.r_status.width = 800
return 1
end function

public subroutine of_missing_info_90_days_generate ();//////////////////////////////////////////////////////////////////////
// $<function>pfc_n_cst_ai_printletters/of_missing_info_90_days_generate()
// $<arguments>
//		value	integer
// $<returns> (none)
// $<description> Create verifications based on missing items existing
// $<description> 90 days from date_app_rcvd.
//////////////////////////////////////////////////////////////////////
// $<add> 2006-10-13 by Rodger Wu (Inova)

//Attention!!
/*
New DataWindows: 
	d_missinfo90_affil_stat
	d_missinfo90_existed_verif
	d_missinfo90_app_audit_incom
	d_missinfo90_verif_incom
	d_missinfo90_verif_maxsno
*/

//////////////////////////////////////////////////////////////////////
//comment 07/25/2007 by: Andy
n_ds lds_affil_stat, lds_verif_existed_90, lds_verif_maxsno//, lds_app_audit_incom, lds_verif_incom 
Integer i, li_found, li_rows, li_inserted, li_sno
//comment 07/25/2007 by: Andy
//Integer li_rows_verif_existed_90, li_rows_app_audit_incom, li_rows_verif_incom
Integer li_rows_verif_maxsno
Long ll_prac_id, ll_verif_fac, ll_recid_affil
//<add> 07/25/2007 by: Andy
Long ll_prac_id_first = -1, ll_verif_fac_first = -1, ll_recid_affil_first = -1

//comment 07/25/2007 by: Andy
//Long ll_rec_id_ar[], ll_fac_id_ar[], ll_prac_id_ar[]

lds_affil_stat = CREATE n_ds
lds_verif_existed_90 = CREATE n_ds
//comment 07/25/2007 by: Andy
//lds_app_audit_incom = CREATE n_ds
//lds_verif_incom = CREATE n_ds
lds_verif_maxsno = CREATE n_ds

//Modify 07/25/2007 by: Andy
//lds_affil_stat.DataObject = "d_missinfo90_affil_stat"				//Get pd_affil_stat records that exceed 90 days.
lds_affil_stat.DataObject = "d_missinfo90_affil_stat_new"				//Get pd_affil_stat records that exceed 90 days.
//end of modify
lds_verif_existed_90.DataObject = "d_missinfo90_existed_verif" //Get existed Missing Info 90 verification records, and this datastore will be used to update new Missing Info 90 records into database.
//comment 07/25/2007 by: Andy
//lds_app_audit_incom.DataObject = "d_missinfo90_app_audit_incom"//Get incomplete app. audit records.
//lds_verif_incom.DataObject = "d_missinfo90_verif_incom"        //Get incomplete verification records.
//end of comment

//Modify 07/25/2007 by: Andy
//lds_verif_maxsno.DataObject = "d_missinfo90_verif_maxsno"      //Get verification seq_no in order to avoid Primary Key violent.
lds_verif_maxsno.DataObject = "d_missinfo90_verif_maxsno_new"      //Get verification seq_no in order to avoid Primary Key violent.
//end of modify

lds_affil_stat.SetTransObject( SQLCA )
lds_verif_existed_90.SetTransObject( SQLCA )
//comment 07/25/2007 by: Andy
//lds_app_audit_incom.SetTransObject( SQLCA )
//lds_verif_incom.SetTransObject( SQLCA )
//end of comment
lds_verif_maxsno.SetTransObject( SQLCA )

gnv_appeondb.of_startqueue()
lds_affil_stat.Retrieve()
lds_verif_existed_90.Retrieve()
//comment 07/25/2007 by: Andy
//lds_app_audit_incom.Retrieve()
//lds_verif_incom.Retrieve()
//end of comment 
gnv_appeondb.of_commitqueue()

//comment 07/25/2007 by: Andy
//li_rows_verif_existed_90 = lds_verif_existed_90.RowCount()
//li_rows_app_audit_incom = lds_app_audit_incom.Rowcount()
//li_rows_verif_incom = lds_verif_incom.Rowcount()
//end of comment 

/*
//comment 07/25/2007 by: Andy 
//Reason:Optimize.
//       Not only the data source of d_missinfo90_affil_stat_new 
//       but also the data source of d_missinfo90_verif_maxsno_new have already processed these.
For i = lds_affil_stat.RowCount() to 1 Step -1
	
	ll_prac_id = lds_affil_stat.GetItemNumber( i, "prac_id" )
	ll_verif_fac = lds_affil_stat.GetItemNumber( i, "verifying_facility" )
	ll_recid_affil = lds_affil_stat.GetItemNumber( i, "rec_id" )
	
	li_found = lds_verif_existed_90.Find( "prac_id = " + string( ll_prac_id ) + &
					" and facility_id = " + string( ll_verif_fac ), 1, li_rows_verif_existed_90 )
	if li_found > 0 then
		lds_affil_stat.DeleteRow( i )//Not necessary to add a 90 day letter if Missing Info 90 verification has existed.
		Continue;
	end if
	
	li_found = lds_app_audit_incom.Find( "appt_stat_id = " + string( ll_recid_affil ), 1, li_rows_app_audit_incom )
	if li_found > 0 then
		ll_prac_id_ar[ upperbound( ll_prac_id_ar ) + 1 ] = ll_prac_id
		ll_rec_id_ar[ upperbound( ll_rec_id_ar ) + 1 ] = ll_recid_affil
		ll_fac_id_ar[ upperbound( ll_fac_id_ar ) + 1 ] = ll_verif_fac
		continue;  //Incomplete app. audit record existed.
	end if
	
	li_found = lds_verif_incom.Find( "prac_id = " + string( ll_prac_id ) + " and facility_id = " + string( ll_verif_fac ), 1, li_rows_verif_incom )
	if li_found > 0 then
		ll_prac_id_ar[ upperbound( ll_prac_id_ar ) + 1 ] = ll_prac_id
		ll_rec_id_ar[ upperbound( ll_rec_id_ar ) + 1 ] = ll_recid_affil
		ll_fac_id_ar[ upperbound( ll_fac_id_ar ) + 1 ] = ll_verif_fac
		continue;  //Incomplete verification record existed.
	end if
	
	lds_affil_stat.DeleteRow( i )   //Not necessary to add a 90 day letter due to no incomplete record found.
	
Next
*/

if lds_affil_stat.Rowcount() < 1 then
	//<add> 07/25/2007 by: Andy
	if isValid(lds_affil_stat) then destroy lds_affil_stat
	if isValid(lds_verif_existed_90) then destroy lds_verif_existed_90
	if isValid(lds_verif_maxsno) then destroy lds_verif_maxsno
	//end of add
	Return //No requirement of generating Missing Info 90 letter.
end if

//Modify 07/25/2007 by: Andy
//li_rows_verif_maxsno = lds_verif_maxsno.Retrieve( ll_rec_id_ar, ll_prac_id_ar, ll_fac_id_ar )
li_rows_verif_maxsno = lds_verif_maxsno.Retrieve()
//end of modify

For i = 1 to lds_affil_stat.rowcount()
	ll_recid_affil = lds_affil_stat.GetItemNumber( i, "rec_id" )
	ll_prac_id = lds_affil_stat.GetItemNumber( i, "prac_id" )
	ll_verif_fac = lds_affil_stat.GetItemNumber( i, "verifying_facility" )
	
	//<add> 07/25/2007 by: Andy 
	//The data source of lds_affil_stat has already setted sort.
	if ll_prac_id_first = ll_prac_id and &
		ll_verif_fac_first = ll_verif_fac and ll_recid_affil_first = ll_recid_affil then
		li_sno ++
	else
	//end of add
		//Get max seq_no + 1.
		li_found = lds_verif_maxsno.Find( "rec_id = " + string( ll_recid_affil ) + " and prac_id = " + string( ll_prac_id ) + &
													 " and facility_id = " + string( ll_verif_fac ), 1, li_rows_verif_maxsno )
		if li_found > 0 then
			li_sno = lds_verif_maxsno.GetItemNumber( li_found, "seq_no" ) + 1
		else
			li_sno = 1
		end if
		//<add> 07/25/2007 by: Andy
		ll_prac_id_first = ll_prac_id
		ll_verif_fac_first = ll_verif_fac
		ll_recid_affil_first = ll_recid_affil
	end if
	//end of add
	
	//Add Missing Info 90 letter into database.
	li_inserted = lds_verif_existed_90.InsertRow( 0 )
	lds_verif_existed_90.SetItem( li_inserted, "rec_id", ll_recid_affil )
	lds_verif_existed_90.SetItem( li_inserted, "prac_id", ll_prac_id )
	lds_verif_existed_90.SetItem( li_inserted, "facility_id",  ll_verif_fac)
	lds_verif_existed_90.SetItem( li_inserted, "seq_no", li_sno )
	lds_verif_existed_90.SetItem( li_inserted, "screen_id", 1 )
	lds_verif_existed_90.SetItem( li_inserted, "verification_method", -300 ) //-300 means miss info 90 in code lookup.
	lds_verif_existed_90.SetItem( li_inserted, "reference_value", "Applications Audit Missing 90 days" )
	lds_verif_existed_90.SetItem( li_inserted, "doc_id", string(ll_recid_affil) + '-' + string( ll_prac_id ) + '-' + string( ll_verif_fac ) + '-' + string( li_sno ))
	lds_verif_existed_90.SetItem( li_inserted, "direct_parent_facility_link", lds_affil_stat.GetItemNumber( i, "parent_facility_id" ))
Next

if lds_verif_existed_90.Update() = 1 then
	Commit Using SQLCA;
else
	Rollback Using SQLCA;
	Messagebox( "ContractLogix", "Generating Missing Info 90 days Letter failed!" )
end if

//<add> 07/25/2007 by: Andy
if isValid(lds_affil_stat) then destroy lds_affil_stat
if isValid(lds_verif_existed_90) then destroy lds_verif_existed_90
if isValid(lds_verif_maxsno) then destroy lds_verif_maxsno
//end of add
end subroutine

public function integer of_missing_info_90_days_print (string as_doc_id[], u_dw adw_detail);//////////////////////////////////////////////////////////////////////
// $<function>pfc_n_cst_ai_printletters/of_missing_info_90_days_print()
// $<arguments>
//		value	integer		
// $<returns> integer
// $<description>
// $<description>
//////////////////////////////////////////////////////////////////////
// $<add> 2006-10-17 by Rodger Wu (Inova)
/*
New DataWindows
    ds_verifications_getbydocid
	 ds_verifications_incom_getbypracid
	 ds_affil_stat_getbyrecid
Modified for added 3 fields called cdate_app_sent, cdate_app_rcvd and cdate_app_signed.
	 d_pd_app_audit_miss_rqst_data_pt
	 d_pd_app_audit_miss_rqst_data_w_vers_pt
*/
//////////////////////////////////////////////////////////////////////

n_ds lds_app_audit_incom, lds_address_info, lds_copy, lds_verif_incom
n_ds lds_verif_toprint, lds_affil_stat
Datastore lds_codelookup_affil_dept_description
Datastore lds_codelookup_affil_staff_description
Integer li_rows_verif_toprint, li_facility_id[], li_verif_fac[], li_last_num_sent, li_found
Long ll_prac_id[], ll_affil_stat_id[]
Long ll_codelookup_affil_dept_description
Long ll_codelookup_affil_staff_description
String ls_doc_id
Integer li_letters_toprint = 0
Boolean lb_allowtoprint[]

String ls_open_merge
Integer i
Integer m, n
String ls_descr
Integer li_prac_cnt
String ls_local_area_code
String ls_dept //maha 090304
Integer li_address_rc
String ls_fax_number
Integer li_miss_cnt
String ls_file_name = "ind_missing_info_request_90_days.doc"
String ls_doc_name
String ls_word_path
String ls_letter_path
String ls_note //maha 092403
String ls_reference //maha 083104
String ls_run_path //maha 021805

ls_run_path = of_letter_paths("L")
ls_open_merge = of_letter_paths("D")

n_appeon_download lnv_download
If gnv_data.of_getitem('icred_settings' ,'set_50' , False ) = '1' or &
   Upper( appeongetclienttype() ) = 'WEB' Then
	lnv_download.of_parsepath( ls_open_merge)
End If

lds_verif_toprint = CREATE n_ds
lds_verif_toprint.DataObject = "ds_verifications_getbydocid"
lds_verif_toprint.SetTransObject( SQLCA )
li_rows_verif_toprint = lds_verif_toprint.Retrieve( as_doc_id )
if li_rows_verif_toprint < 1 then return 0;//no record needs to print.

for i = 1 to li_rows_verif_toprint
	ll_prac_id[i] = lds_verif_toprint.GetItemNumber( i, "prac_id" )
	ll_affil_stat_id[i] = lds_verif_toprint.GetItemNumber( i, "rec_id" )
	li_facility_id[i] = lds_verif_toprint.GetItemNumber( i, "direct_parent_facility_link" )
	li_verif_fac[i] = lds_verif_toprint.GetItemNumber( i, "facility_id" )
	lb_allowtoprint[i] = True
next

lds_app_audit_incom = Create n_ds //Get incomplete App.Audit records.
lds_app_audit_incom.DataObject = "d_pd_app_audit_rqrd_data_pt"
lds_app_audit_incom.of_SetTransObject( SQLCA )

lds_verif_incom = CREATE n_ds     //Get incomplete verifications records.
lds_verif_incom.DataObject = "ds_verifications_incom_getbypracid"
lds_verif_incom.SetTransObject( SQLCA )

lds_address_info = Create n_ds    //Used to take data.
lds_address_info.DataObject = "d_pd_app_audit_miss_rqst_data_pt"
lds_address_info.of_SetTransObject( SQLCA )

lds_copy = Create n_ds 
lds_copy.DataObject = "d_pd_app_audit_miss_rqst_data_pt"
lds_copy.of_SetTransObject( SQLCA )

lds_affil_stat = Create n_ds
lds_affil_stat.DataObject = "ds_affil_stat_getbyrecid"
lds_affil_stat.SetTransObject( SQLCA )

lds_codelookup_affil_dept_description = Create Datastore
lds_codelookup_affil_dept_description.Dataobject = "d_codelookup_affil_dept_description_pt"
lds_codelookup_affil_dept_description.Settransobject( SQLCA )

lds_codelookup_affil_staff_description = Create Datastore
lds_codelookup_affil_staff_description.Dataobject = "d_codelookup_affil_staff_description_pt"
lds_codelookup_affil_staff_description.Settransobject( SQLCA )

gnv_appeondb.of_startqueue( )

lds_verif_incom.Retrieve( ll_prac_id )
lds_address_info.Retrieve( li_facility_id[ ], ll_prac_id[ ] )
lds_app_audit_incom.Retrieve( ll_affil_stat_id[] )
lds_affil_stat.Retrieve( ll_affil_stat_id[] )
lds_codelookup_affil_dept_description.Retrieve( ll_prac_id[], li_facility_id[] )
lds_codelookup_affil_staff_description.Retrieve( ll_prac_id[], li_facility_id[] )

gnv_appeondb.of_commitqueue( )


For i = 1 To li_rows_verif_toprint
	lds_address_info.SetFilter("pd_address_link_facility_id = " + String(li_facility_id[ i ]) + " and pd_address_link_prac_id = " + String(ll_prac_id[ i ]) )
	lds_address_info.Filter()
	li_address_rc = lds_address_info.Rowcount( )

	If li_address_rc < 1 Then
		//--------------------------- APPEON BEGIN ---------------------------
		//$<modify> 2007.08.31 By: Jack
		//$<reason> Fix a defect.
		/*
		MessageBox("Address", "You must have a mailing address links for practitioner id of " + String(ll_prac_id[ i ]) + " for facility_id " + String(li_facility_id[ i ]) + " before using this option.")
		*/
		MessageBox("Address", "You must have a mailing address link for practitioner id of " + String(ll_prac_id[ i ]) + " for facility_id " + String(li_facility_id[ i ]) + " before using this option.")
		//---------------------------- APPEON END ----------------------------
		lb_allowtoprint[i] = False
		Continue //GOTO ERROR
	Else

		lds_app_audit_incom.SetFilter( "appt_stat_id = " + String(ll_affil_stat_id[i]))
		lds_app_audit_incom.Filter( )

		li_miss_cnt = lds_app_audit_incom.RowCount()
		For m = 1 To li_miss_cnt
			If m > 60 Then //new trap 110304
				MessageBox("Missing information","There are more than 60 missing items.  This letter will generate only the first 60.")
				Exit
			Else
				ls_descr = lds_app_audit_incom.GetItemString( m, "pd_app_audit_fax_message" )
				ls_note = lds_app_audit_incom.GetItemString( m, "notes" )
				ls_reference = lds_app_audit_incom.GetItemString( m, "identifying_number" )
				lds_address_info.SetItem( 1, "cmissing_info_" + String( m ), ls_descr )
				lds_address_info.SetItem( 1, "missing_info__note_" + String( m ), ls_note )
				lds_address_info.SetItem( 1, "missing_info_reference_" + String( m ), ls_note )
			End If
		Next
		
		lds_verif_incom.SetFilter( "prac_id = " + string( ll_prac_id[i] ) + " and facility_id = " + string( li_verif_fac[i] ) )
		lds_verif_incom.Filter()
		li_miss_cnt = lds_verif_incom.Rowcount()
		For n = 1 to li_miss_cnt
			If m + n > 60 Then //new trap 110304
				MessageBox("Missing information","There are more than 60 missing items.  This letter will generate only the first 60.")
				Exit
			Else
				ls_descr = lds_verif_incom.GetItemString( n, "reference_value" )
				
				lds_address_info.SetItem( 1, "cmissing_info_" + String( m+n ), ls_descr )
				lds_address_info.SetItem( 1, "missing_info__note_" + String( m+n ), lds_verif_incom.GetItemString( n, "notes" ) )
				lds_address_info.SetItem( 1, "missing_info_reference_" + String( m+n ), '' )
			End If
		Next
		
		ll_codelookup_affil_dept_description = lds_codelookup_affil_dept_description.Find( "prac_id = " + String(ll_prac_id[ i ]) +&
		" and facility_id = " + String(li_facility_id[ i ]) + " and lookup_code = department",1 ,lds_codelookup_affil_dept_description.rowcount()) 
		If ll_codelookup_affil_dept_description > 0 Then ls_dept = lds_codelookup_affil_dept_description.GetitemString(ll_codelookup_affil_dept_description, "description")
		lds_address_info.SetItem( 1, "prime_dept", ls_dept )
		ls_dept = '' //clear or the next blank will duplicate

		ll_codelookup_affil_dept_description = lds_codelookup_affil_dept_description.Find( "prac_id = " + String(ll_prac_id[ i ]) +&
		" and facility_id = " + String(li_facility_id[ i ]) + " and lookup_code = section",1 ,lds_codelookup_affil_dept_description.rowcount()) 
		If ll_codelookup_affil_dept_description > 0 Then ls_dept = lds_codelookup_affil_dept_description.GetitemString(ll_codelookup_affil_dept_description, "description")
		lds_address_info.SetItem( 1, "prime_section", ls_dept )
		ls_dept = '' //clear or the next blank will duplicate

		ll_codelookup_affil_dept_description = lds_codelookup_affil_dept_description.Find( "prac_id = " + String(ll_prac_id[ i ]) +&
		" and facility_id = " + String(li_facility_id[ i ]) + " and lookup_code = rank",1 ,lds_codelookup_affil_dept_description.rowcount()) 
		If ll_codelookup_affil_dept_description > 0 Then ls_dept = lds_codelookup_affil_dept_description.GetitemString(ll_codelookup_affil_dept_description, "description")
		lds_address_info.SetItem( 1, "prime_division", ls_dept )
		ls_dept = '' //clear or the next blank will duplicate

		ll_codelookup_affil_staff_description = lds_codelookup_affil_staff_description.Find( "prac_id = " + String(ll_prac_id[ i ]) +&
		" and facility_id = " + String(li_facility_id[ i ]) ,1 ,lds_codelookup_affil_staff_description.rowcount()) 
		If ll_codelookup_affil_staff_description > 0 Then ls_dept = lds_codelookup_affil_staff_description.GetitemString(ll_codelookup_affil_staff_description, "description")
		lds_address_info.SetItem( 1, "staff_cat", ls_dept )
		ls_dept = '' //clear or the next blank will duplicate

		ls_fax_number = lds_address_info.GetItemString( 1, "fax" )
		ls_local_area_code = ProfileString(gs_IniFilePathName, "Setup","local_area_code", "None")
		
		If IsNull( ls_local_area_code ) Or ls_local_area_code = "" Then
			MessageBox("Setup Error", "You must setup your local area code in the INTELLICRED.INI file under the [setup] section.")
			Return -1
		End If
		
		If Pos( ls_fax_number, "(" ) > 0 Then
			If Mid(ls_fax_number, Pos( ls_fax_number, "(" ) +1 ,3) = ls_local_area_code Then
				ls_fax_number = Mid( ls_fax_number, Pos( ls_fax_number, ")" ) +1, 100 )
			End If
		Else
			If Mid(ls_fax_number,1,3) = ls_local_area_code Then
				ls_fax_number = Mid( ls_fax_number, 4, 100 )
			End If
		End If
		
		lds_address_info.SetItem( 1, "fax", ls_fax_number )
	End If
	
	li_found = lds_affil_stat.Find( "rec_id = " + string( ll_affil_stat_id[i] ), 1, lds_affil_stat.rowcount() )
	if li_found > 0 then
		lds_address_info.SetItem( 1, "cdate_app_sent", string( lds_affil_stat.GetItemDateTime( li_found, "date_app_sent" ), "mm/dd/yyyy" ))
		lds_address_info.SetItem( 1, "cdate_app_rcvd", string( lds_affil_stat.GetItemDateTime( li_found, "date_app_rcvd" ), "mm/dd/yyyy" ))
		lds_address_info.SetItem( 1, "cdate_app_signed", string( lds_affil_stat.GetItemDateTime( li_found, "date_app_signed" ), "mm/dd/yyyy" ))
	end if
	
	lds_address_info.SetItem( 1, "cnumber_of_requests", lds_verif_toprint.GetItemNumber( i, "number_sent" ) )
	lds_address_info.RowsCopy(1,1,primary!,lds_copy,10000,primary!)
	li_letters_toprint++
Next

If lds_copy.RowCount() < 1 Then
	Destroy lds_app_audit_incom
	Destroy lds_address_info
	Destroy lds_copy
	Destroy lds_verif_incom
	Destroy lds_verif_toprint
	Destroy lds_codelookup_affil_dept_description
	Destroy lds_codelookup_affil_staff_description
	Return -1
End If

lds_copy.SaveAs( ls_open_merge + "ind_missing_info_request_90_days.txt", Text!, True ) //maha moved outside of loop 072903
ls_open_merge = ls_open_merge + "ind_missing_info_request_90_days.txt"

Integer li_word_storage_type
li_word_storage_type = Integer(gnv_data.of_getitem( "icred_settings", "set_50", FALSE))
IF Isnull(li_word_storage_type) THEN li_word_storage_type = 0
IF Upper( AppeonGetClientType() ) = "PB" AND li_word_storage_type = 0 THEN
	Select facility.letter_path
		Into :ls_letter_path
		From facility
		Where facility.facility_id = :li_facility_id[1]   ;
ELSE
	n_appeon_storage_area lnv_storage_area
	IF lnv_storage_area.of_retrieve_doc_from_db( 1, ls_file_name, ls_letter_path) < 0 THEN
		Messagebox("Download File",'The MSWord document '+  ls_file_name  +'  does not exist in the database.')
		RETURN -1
	END IF
END IF

If SQLCA.SQLCode = -1 Then
	MessageBox("SQL ERROR", SQLCA.SQLErrText )

	Destroy lds_app_audit_incom
	Destroy lds_address_info
	Destroy lds_copy
	Destroy lds_verif_incom
	Destroy lds_verif_toprint
	Destroy lds_codelookup_affil_dept_description
	Destroy lds_codelookup_affil_staff_description
	Return -1
End If

ls_word_path = ProfileString(gs_IniFilePathName, "paths", "word", "None")

ls_doc_name = ls_letter_path + ls_file_name

If Not FileExists( ls_doc_name ) Then
	MessageBox("Open Letter Error", "Invalid Word Letter path: " + ls_doc_name  )
	Return -1
End If

// mskinner 04 oct 2005 - begin
gnv_app.gnvlo_msword.of_open_word_document( ls_doc_name, ls_open_merge, "Missing Information")
//of_open_letter(ls_doc_name, ls_open_merge,"Missing Information")
// mskinner 04 oct 2005 - end

gs_fax lgs_fax
n_ds lds_letters
Integer li_Retval

lgs_fax.ss_message = "Did the Missing Information Letter print ok?"
lgs_fax.ss_letter_document_name = ls_doc_name + " /mpreview"
lgs_fax.ss_letter_name = "Missing Information Letter 90 days"
lgs_fax.sdw_letter = lds_copy
lgs_fax.ss_letter_type = "MissInfo90"

OpenWithParm( w_ai_print_msg_box, lgs_fax )

gs_fax_error_records lst_fax_error_records
lst_fax_error_records = Message.PowerObjectParm
If lst_fax_error_records.il_error_rec_num[ 1 ] = -2 Then
	Destroy lds_app_audit_incom
	Destroy lds_address_info
	Destroy lds_copy
	Destroy lds_verif_incom
	Destroy lds_verif_toprint
	Destroy lds_codelookup_affil_dept_description
	Destroy lds_codelookup_affil_staff_description
	Return -1
End If

for i = 1 to li_rows_verif_toprint
	
	if Not lb_allowtoprint[i] then continue;
	ls_doc_id = lds_verif_toprint.GetItemString( i, "doc_id" )
	
	li_found = adw_detail.Find( "doc_id = '" + ls_doc_id + "'", 1, adw_detail.rowcount() )
	if li_found > 0 then
		li_last_num_sent = adw_detail.GetItemNumber( i, "number_sent" )
		IF IsNull(li_last_num_sent) THEN li_last_num_sent = 0

		li_last_num_sent++
		adw_detail.SetItem( i, "number_sent", li_last_num_sent )
		adw_detail.SetItem( i, "print_flag", 0 )			
		IF IsNull( adw_detail.GetItemDateTime( i, "first_sent" ) ) THEN
			adw_detail.SetItem( i, "first_sent", DateTime(Today(), Now()) )
		END IF
	
		adw_detail.SetItem( i, "last_sent", DateTime(Today(), Now()) )
	end if
next

//if all the letters were printed successfully then put a check next to the letter
//IF li_ltr_cnt = li_total_letters THEN 
	w_ai_print_letters_new.dw_letters.SetItem( w_ai_print_letters_new.dw_letters.GetRow(), "num_printed", li_letters_toprint)
	w_ai_print_letters_new.dw_letters.SetItem( w_ai_print_letters_new.dw_letters.GetRow(), "print_status", 1 )
//END IF 

//update the action item detail view by updating then re-retrieving data
IF adw_detail.Update() <> 1 THEN
	MessageBox("Update Failed", "Error while updating " + adw_detail.DataObject )
ELSE
	COMMIT USING SQLCA;
	adw_detail.event pfc_retrieve()
END IF
gnv_appeondb.of_autocommit( )

Destroy lds_app_audit_incom
Destroy lds_address_info
Destroy lds_copy
Destroy lds_verif_incom
Destroy lds_verif_toprint
Destroy lds_codelookup_affil_dept_description
Destroy lds_codelookup_affil_staff_description

Return 1;
end function

public function integer of_wv_initiated_workflow ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_wv_initiated_workflow
//
//	Arguments:  none
//
//	Returns:  none
//
//	Description:
//	Trigger off WebView Practitioner Application Initiated work flow
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright ?2001-2006 Appeon, Inc. All rights reserved.
//
//////////////////////////////////////////////////////////////////////////////

//When the IntelliCred User logs in to IntelliCred and the Action Items Query Runs,
//the program will look for pd_affil_stat.wvbeg_cred = 1.  For these records, 
//the Work Flow Trigger called WebView Practitioner Application Initiated will 
//create the Work Flow.
DataStore lds_addil_stat
datastore lds_esign_log
n_cst_workflow_triggers lnv_workflow
str_action_item  lstr_action
long ll_count,ll_i,ll_wv_begin_cred
long ll_rec_id,ll_prac_id,ll_facility_id
long ll_step


lds_addil_stat = Create DataStore
lds_esign_log = create datastore
lnv_workflow = create n_cst_workflow_triggers

lnv_workflow.of_set_message( false)	//08.28.2007 don't display message
gnv_appeondb.of_startqueue( )

lds_esign_log.dataobject = "d_wf_wv_esign_log"
lds_esign_log.SetTransObject(sqlca)
lds_esign_log.Retrieve()

lds_addil_stat.Dataobject = "d_wf_affil_stat"
lds_addil_stat.SetTransObject(sqlca)
ll_count = lds_addil_stat.Retrieve()

gnv_appeondb.of_commitqueue()

for ll_i = 1 to ll_count
	ll_wv_begin_cred = lds_addil_stat.GetItemNumber(ll_i,"wv_begin_cred")
	
	lstr_action.rec_id = lds_addil_stat.GetItemNumber(ll_i,"rec_id")
	lstr_action.prac_id = lds_addil_stat.GetItemNumber(ll_i,"prac_id")
	lstr_action.facility_id = lds_addil_stat.GetItemNumber(ll_i,"parent_facility_id")
	
	//Trigger off Work Flow for webview application_initiated
	if ll_wv_begin_cred = 1 then
		lstr_action.seq_no = lds_addil_stat.GetItemNumber(ll_i,"seq_no")
		lstr_action.wf_id = lds_addil_stat.GetItemNumber(ll_i,"wf_webview_application_initiated")
		lstr_action.screen_id = -10
		if lnv_workflow.of_workflow_create_action_items( lstr_action) = 1 then
			lds_addil_stat.SetItem(ll_i,"wv_begin_cred",2)
		end if
	end if
	
	if ll_wv_begin_cred = 2 then
		lds_esign_log.SetFilter("app_status_id = " + string(lstr_action.rec_id))
		lds_esign_log.Filter()
		if lds_esign_log.RowCount() = 5 then
			lstr_action.seq_no = lds_addil_stat.GetItemNumber(ll_i,"seq_no")
			lstr_action.wf_id = lds_addil_stat.GetItemNumber(ll_i,"facility_wf_webview_application_complete")
			lstr_action.screen_id = -10
			if lnv_workflow.of_workflow_create_action_items( lstr_action) = 1 then
				lds_addil_stat.SetItem(ll_i,"wv_begin_cred",3)
			end if
		end if
	end if
	if (isvalid(w_aiq_run) and w_aiq_run.r_status.width < w_aiq_run.r_1.width) then  w_aiq_run.r_status.width += 20
next


gnv_appeondb.of_autocommitrollback( )
lds_addil_stat.update()
commit;

if isvalid(lds_addil_stat) then destroy lds_addil_stat
if isvalid(lnv_workflow) then destroy lnv_workflow

//--------------------------- APPEON BEGIN ---------------------------
//$<Modify> 08.22.2007 By: Evan
//$<Reason> Need to destroy object.
//if isvalid(lds_addil_stat) then destroy lds_addil_stat
if IsValid(lds_esign_log) then Destroy lds_esign_log
//---------------------------- APPEON END ----------------------------

return 1

end function

public function integer of_run_export (long al_pracs[], long al_export, ref string as_path);// created 021704 maha called from of_printletters

integer i
string ls_path
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> UM-01
//$<modify> 01.13.2006 By: WangChao
//$<reason> It is currently unsupported to dynamically create a visual object.
//$<modification> Replace the visual object with an non-visual object.
//pfc_n_cst_ai_export n_export
pfc_n_cst_ai_export_apb n_export
//---------------------------- APPEON END ----------------------------
integer res

ls_path = as_path//gs_dir_path + gs_DefDirName + "\letters\data\"// + ls_exp_name + ".txt" cahnged 022003 the file name is set in the export routine


//--------------------------- APPEON BEGIN ---------------------------
//$<ID> UM-02
//$<modify> 01.13.2006 By: WangChao
//$<reason> It is currently unsupported to dynamically create a visual object.
//$<modification> Replace the visual object with an non-visual object.
//n_export = CREATE pfc_n_cst_ai_export
n_export = CREATE pfc_n_cst_ai_export_apb
//---------------------------- APPEON END ----------------------------
n_export.is_called_type = '4'	//08.29.2007 Export format set to .txt By Jervis
res = n_export.of_export_data_with_text( al_export, al_pracs[],ls_path,0 ,"","","",2,"")


destroy n_export
//messagebox("res",res)
if res < 0 then
	return -1
else
	as_path = ls_path	//08.28.2007 By Jervis Reutrn path
	return 1
end if
end function

public function integer of_privilege_renewal (long al_prac, long al_facil, integer ai_manual, long al_appt_rec);integer p 
integer pc
integer cr
long ll_status
long ll_rec
datetime ldt_nulldate

if ai_manual = 1 then
	//open the privilege add window
	openwithparm(w_clin_area_select,"P*" + string(al_facil) + "@" + string(al_prac) )
	//user completes
	
else //automatic
	n_ds lds_privs
	lds_privs = create n_ds
	
	lds_privs.dataobject = "d_priv_recred_list"
	lds_privs.settransobject(sqlca)
	pc = lds_privs.retrieve(al_prac,al_facil) //this will get all 'granted' privs
	
	select max(rec_id) into :ll_rec from pd_priv_list;
	
	//ll_rec = gnv_app.of_get_id( "RECORD_ID" , pc )
	
	setnull(ldt_nulldate)
	ll_status =	long(gnv_data.of_getitem('code_lookup','lookup_code',"upper(lookup_name) = 'PRIVILEGE STATUS' and upper(code) = 'REQST'"))
	if ll_status =  0 then
		messagebox("Privilege update","There is no Requested lookup (Code = REQST) in the Privilege Status table.  Unable to process Privileges")
		return -1
	end if		
	
	//copy all existing granted privileges
	lds_privs.rowscopy( p, pc, primary!, lds_privs, 10000, primary!)
	
	for p = pc + 1 to lds_privs.rowcount()
		ll_rec++
		lds_privs.setitem(p,"rec_id", ll_rec )
		lds_privs.setitem(p,"ir_code", "R" )
		lds_privs.setitem(p,"status_code", ll_status )
		lds_privs.setitem(p,"start_date", ldt_nulldate )
		lds_privs.setitem(p,"end_date",ldt_nulldate  )
		lds_privs.setitem(p,"enter_date", today() )
		lds_privs.setitem(p,"app_stat_id", al_appt_rec )
	next
	
	for p = 1 to pc //send org records to history
		lds_privs.setitem(p,"active_status", 0 )
	next
	
	lds_privs.update()

end if


return 1
end function

public function integer of_find_missing_verifs (long al_prac, long al_v_facil, integer ai_silent, string as_appt_type);//Start Code Change ----function created 07.10.2008 #V81 maha - to get verification that are 'missing' from the provider folderinteger i
boolean rf1 = true
boolean rf2 = true
boolean rfx = true
datetime ldt_x
integer i
integer ic
integer d
integer dc
integer ck
integer v
integer vc
integer nr
integer li_screen
long ll_rec
long ll_rec_created
long ll_seq
long ll_addr_id
long ll_temp
string ls_sql
string ls_table
string ls_field1
string ls_field2
string ls_type1
string ls_type2
string ls_exp
string ls_prac_field
string ls_rec_field
string ls_reference
string ls_r1
string ls_r2
string ls_sort
string ls_doc
string ls_presentation_str
string ls_dwsyntax_str
string ERRORS
string ls_screen
string lu
string lut
string luc
string luf
datastore lds_rules
datastore lds_data
datastore lds_verif
datastore lds_verif_cur


//retrieve the list of screens that rules state are used for the appt type
lds_rules = create datastore
lds_data = create datastore
lds_verif = create datastore
lds_verif_cur = create datastore

lds_verif_cur.dataobject = "d_missing_verif_get_data_base"
lds_verif_cur.settransobject(sqlca)
lds_verif.dataobject = "d_copy_verification_missing"
lds_verif.settransobject(sqlca)
lds_rules.dataobject = "d_missing_verif_rules"
lds_rules.settransobject(sqlca)
ic = lds_rules.retrieve(as_appt_type, al_v_facil )


// for each screen get the data records for the provider
for i = 1 to ic
	rf1 = true
	rf2 = true
	ls_table = lds_rules.getitemstring ( i,"sys_tables_table_name")
	li_screen = lds_rules.getitemnumber ( i,"data_view_screen_screen_id")
	ls_screen = lds_rules.getitemstring( i,"data_view_screen_screen_name")
	ls_prac_field = ls_table + ".prac_id "
	ls_rec_field  = ls_table + ".rec_id, "
	ls_field1= lds_rules.getitemstring ( i,"sys_fields_ref_field1")
	ls_sort =  ls_table + "_rec_id A,  verif_info_active_status D"
	if isnull(ls_field1) or len(ls_field1 ) = 0 then
		ls_field1 =  " ," + ls_table + "." + "cust_1"
		rf1 = false
	else
		ls_field1 =   " ," + ls_table + "." + ls_field1
		ls_type1 = lds_rules.getitemstring ( i,"sys_fields_field_type1")
	end if
	
	ls_field2 = lds_rules.getitemstring ( i,"sys_fields_ref_field2")
	if isnull(ls_field2) or len(ls_field2 ) = 0 then
		ls_field2 =  " ," + ls_table + "." + "cust_1"
		rf2 = false
	else
		ls_field2 =  " ," + ls_table + "." + ls_field2 
		ls_type2 = lds_rules.getitemstring ( i,"sys_fields_field_type2")
	end if

	ls_exp = lds_rules.getitemstring ( i,"sys_fields_ref_fieldexp")
	if isnull(ls_exp) or len(ls_exp ) = 0 then
		ls_exp =  " ," + ls_table + "." + "cust_d1"
		rfx = false
	else
		ls_exp =  " ," + ls_table + "." + ls_exp
	end if         

	ls_sql = "Select distinct " + ls_rec_field + ls_prac_field + ls_field1 + ls_field2 +  ls_exp 
	
	ls_sql  = ls_sql + "  From " + ls_table //+ " LEFT OUTER JOIN verif_info ON " + ls_table + ".rec_id = verif_info.rec_id AND " + ls_table + ".prac_id = verif_info.prac_id "
	ls_sql  = ls_sql +  "  WHERE " + ls_table + ".prac_id = " + string(al_prac) +  ";"
	
	//openwithparm(w_sql_msg,ls_sql)
	
	ls_presentation_str = "style(type=grid)"		

	ls_dwsyntax_str = SQLCA.SyntaxFromSQL(ls_sql, ls_presentation_str, ERRORS)
	IF Len(ERRORS) > 0 THEN
		MessageBox("Caution on export field " + ls_sql, &
		"SyntaxFromSQL caused these errors: " + ERRORS + "~r~r" + ls_sql)
	//	MessageBox("ls_select_table",ls_select_table)
		
		RETURN -1
	END IF
	
	lds_data = CREATE n_ds
	ck = lds_data.Create( ls_dwsyntax_str, ERRORS)
	if ck < 1 then
		messagebox("error on data create",errors)
	end if
	 	
	//lds_data.SetSQLSelect ( ls_sql )
	lds_data.settransobject(sqlca)
	
	dc = lds_data.retrieve()
	lds_data.setsort(ls_sort )
	lds_data.sort()
	
	if dc > 0 then
		lds_verif_cur.retrieve(al_prac, al_v_facil, li_screen )
	end if
	
//	fields:
//	1 - rec
//	2 - prac
//	3 - ref1
//	4 - ref2
//	5 - exp

//check against the verifications to see if they exist
	for d = 1 to dc
		ll_rec = lds_data.getitemnumber (d,1) // recid
		ll_rec_created = lds_verif_cur.find( "verif_info_rec_id = " + string(ll_rec),1, vc)
		if ll_rec_created > 0 then continue  //if exists skip;

		 //if not exist  create verification records
		ll_rec = lds_data.getitemnumber (d,1)
		nr = lds_verif.insertrow(0)
		v++
		lds_verif.setitem(nr,"rec_id",ll_rec )
		lds_verif.setitem(nr,"prac_id",al_prac )
		lds_verif.setitem(nr,"facility_id",al_v_facil )
		lds_verif.setitem(nr,"screen_id",li_screen)
		//get seq no
		select max(seq_no) into :ll_seq from verif_info where prac_id = :al_prac and rec_id = :ll_rec and facility_id = :al_v_facil;
		if isnull(ll_seq)  then ll_seq = 0
		ll_seq++
		lds_verif.setitem(nr,"seq_no",ll_seq)
		lds_verif.setitem(nr,"active_status",1)
		ls_doc = string(ll_rec ) + "-" + string(al_prac ) + "-" + string(al_v_facil ) + "-" + string(ll_seq ) 
		lds_verif.setitem(nr,"doc_id", ls_doc)
			
		//create reference %^^&*&*%$!?%%!!!
		if rf1 = true then
			choose case ls_type1
				case "I","N"
					ll_temp =  lds_data.getitemnumber (d,3)
					lu = lds_rules.getitemstring ( i,"sys_fields_islookup1")
					lut = lds_rules.getitemstring ( i,"sys_fields_lookup_type1") 
					luf = lds_rules.getitemstring ( i,"sys_fields_lookup_field1")
					if lu = "Y" then
						if lut = "A" then
							ll_addr_id = ll_temp
							if Upper(luf) = "ENTITY_NAME" then
								select entity_name into :ls_r1 from address_lookup where lookup_code = :ll_temp;
							else
								select code into :ls_r1 from address_lookup where lookup_code = :ll_temp;
							end if
							//ls_r1 = gnv_data.of_getitem("address_lookup",lds_rules.getitemstring ( i,"sys_fields_lookup_field1"),"lookup_name = '" + lds_rules.getitemstring ( i,"sys_fields_lookup_table1") + "' and lookup_code = " + string(ll_temp))
						else //code lookup
							ls_r1 = gnv_data.of_getitem("code_lookup",lds_rules.getitemstring ( i,"sys_fields_lookup_field1"),"lookup_name = '" + lds_rules.getitemstring ( i,"sys_fields_lookup_table1") + "' and lookup_code = " + string(ll_temp))
						end if
					else
						ls_r1 = string(ll_temp)
					end if	
				case "C"
					ls_r1 = lds_data.getitemstring (d,3)
				case "D"
					ls_r1 = string(lds_data.getitemdatetime (d,3))
			end choose
		else
			ls_r1 = ""
		end if
		
		if isnull(ls_r1) then ls_r1 = ""
		
		if rf2 = true then
			choose case ls_type2
				case "I","N"
					ll_temp =  lds_data.getitemnumber (d,4)
					lu = lds_rules.getitemstring ( i,"sys_fields_islookup2")
					lut = lds_rules.getitemstring ( i,"sys_fields_lookup_type2") 
					luf = lds_rules.getitemstring ( i,"sys_fields_lookup_field2")
					if lu = "Y" then
						if lut = "A" then
							ll_addr_id = ll_temp
							if Upper(luf) = "ENTITY NAME" then
								select entity_name into :ls_r1 from address_lookup where lookup_code = :ll_temp;
							else
								select code into :ls_r1 from address_lookup where lookup_code = :ll_temp;
							end if	
						else
							ls_r2 = gnv_data.of_getitem("code_lookup",lds_rules.getitemstring ( i,"sys_fields_lookup_field2"),"lookup_name = '" + lds_rules.getitemstring ( i,"sys_fields_lookup_table2") + "' and lookup_code = " + string(ll_temp))
						end if
					else
						ls_r2 = string(ll_temp)
					end if	
				case "C"
					ls_r2 = lds_data.getitemstring (d,4)
				case "D"
					ls_r2 = string(lds_data.getitemdatetime (d,4))
			end choose
			
		else
			ls_r2 = ""
		end if
		
		if isnull(ls_r2) then ls_r2 = ""
		
		ls_reference = ls_r1 + " - " + ls_r2
		lds_verif.setitem(nr,"reference_value", ls_reference)
		
		lds_verif.setitem(nr,"verification_method", lds_rules.getitemnumber ( i,"facility_ver_rules_default_verif_means"))
		lds_verif.setitem(nr,"new_verification_method", lds_rules.getitemnumber ( i,"facility_ver_rules_default_verif_means"))
		lds_verif.setitem(nr,"priority" , 2)
		lds_verif.setitem(nr,"priority_user","PUBLIC")
		lds_verif.setitem(nr,"exp_credential_flag", 0)
		//get expiration date
		if rfx = true then
			ldt_x = lds_data.getitemdatetime (d,5)
			lds_verif.setitem(nr,"expiration_date", ldt_x)
		end if
		//????
		lds_verif.setitem(nr,"address_lookup_code",ll_addr_id )
		lds_verif.setitem(nr,"print_flag",0)
		lds_verif.setitem(nr,"selected",1)
		lds_verif.setitem(nr,"color",1)
		lds_verif.setitem(nr,"data_view_screen_screen_name",ls_screen)
		
	next
next		

//if silent, add to the provider verification (batch process)


//if manual display in window for user to accept.
if ai_silent = 0 then
	openwithparm(w_missing_verifs,lds_verif)
else
	lds_verif.update()
	commit using sqlca;
end if
//lds_verif.rowscopy( 1, v, primary!, w_missing_verifs.dw_1,1000, primary!)


destroy lds_rules
destroy lds_data
destroy lds_verif
destroy lds_verif_cur

//messagebox("verifs created",v)

return 1






end function

public function integer of_start_reappointment_processing_new (u_dw adw_ver_copy, u_dw adw_action_items, integer ai_parent_facility, long al_prac_id, string as_ver_type, integer ai_silent);//Start Code Change ----06.05.2008 #V81 maha - new function for batch recred and manual recred
datastore lds_appt_dept
datastore lds_appt_comms
datastore lds_appt_leave
datastore lds_appt_staff_cat
datawindow ldw_audit 
n_ds lds_reapp
n_ds lds_action_items
n_ds lds_exp_copy
n_ds lds_appt_stat

Integer ll_exp_appt_ltr  
Integer li_retval
Integer i
integer t 
integer trows 
Integer li_nr
Integer nullint
Integer li_action_item_row
Integer li_facility_row_cnt
integer li_set23
integer li_set32 
integer li_no_copy  = 0

Long ll_seq_no
String ls_version
String ls_doc_id
String ls_rec_id
string ls_assn_user 
string ls_runtype

Long li_row_cnt
Long ll_verif_info_maxseqno
Long ll_seq_row_cnt
long li_parent_facility_id
long li_audit_facility_id
long li_verif_facility_id
Long ll_appt_stat_id
Long ll_rec_id
Long ll_new_rec_id
Long ll_new_ver_method
Long ll_response_code  
Long ll_record_id
Long ll_app_audit_id
long ll_test1 
long ll_test2
long ll_prac_id[]
long ll_rec_id1[]

DateTime nulldate
DateTime dt_cust4
DateTime dt_prior_start
DateTime dt_prior_end
DateTime ldt_now //maha 082808

pfc_cst_nv_data_entry_functions lnv_data_entry
lnv_data_entry = create pfc_cst_nv_data_entry_functions


SetNull( nullint )
SetNull( nulldate )

adw_ver_copy.AcceptText()

//create appointment store
lds_appt_stat = CREATE n_ds
lds_appt_stat.DataObject = "d_pd_affil_status"
lds_appt_stat.of_SetTransObject( SQLCA )

gnv_appeondb.of_startqueue( )

datawindowchild dwchild
lds_appt_stat.GetChild( "parent_facility_id", dwchild )
dwchild.settransobject(sqlca)
dwchild.retrieve(gs_user_id)
lds_appt_stat.GetChild( "verifying_facility", dwchild )
dwchild.settransobject(sqlca)
dwchild.retrieve(gs_user_id)
li_row_cnt = lds_appt_stat.Retrieve( al_prac_id, ai_parent_facility,gs_user_id )

gnv_appeondb.of_commitqueue( )
li_row_cnt = lds_appt_stat.rowcount()

//filter only active record
lds_appt_stat.SetFilter( "active_status = 1" )
lds_appt_stat.Filter( )

if lds_appt_stat.rowcount() < 1 then 
	messagebox("Status Error","Unable to find ACTIVE appointment record for this practitioner and facility.~n The active status of the practitioner's Appointment record must be set to Active to complete the recredentialing process")
	return -1
end if 

//get verifiying facility
li_verif_facility_id = lds_appt_stat.GetItemNumber( 1, "verifying_facility" )
debugbreak()
//\/******************* Verification creation *************************************
//create verif store
if as_ver_type <> "NOVER" then
	lds_reapp = CREATE n_ds
	lds_reapp.DataObject = adw_ver_copy.DataObject //adw_ver_copy should be d_copy_verification
	lds_reapp.of_SetTransObject( SQLCA )
	adw_ver_copy.ShareData( lds_reapp )

	//create copy store
	lds_exp_copy = CREATE n_ds
	lds_exp_copy.DataObject = "d_copy_verification"
	lds_exp_copy.of_SetTransObject( SQLCA )
	
	li_row_cnt = lds_reapp.RowCount()
	
	IF li_row_cnt = 0 THEN
		Return 0
	END IF


	lds_reapp.setsort("rec_id A, facility_id A")
	lds_reapp.sort()
	
	Long    ll_rec_id_first      = -1
	Integer li_facility_id_first = -1
	//end of add

	ll_seq_no = 0
	FOR i = 1 TO li_row_cnt   
		if lds_reapp.GetItemNumber( i, "facility_id" ) = li_verif_facility_id then //maha 011603 only reset active status if is the same facility
			lds_reapp.SetItem( i, "active_status", 0 )
		end if
		//if credential has (not) been selected then it does not have to be reverified
		IF lds_reapp.GetItemNumber( i, "selected" ) = 0 THEN	
			CONTINUE
		END IF
		li_retval = lds_reapp.RowsCopy(i, i, Primary!, lds_exp_copy, 100000, Primary!)
		IF li_retval = -1 THEN
			Messagebox("Error","Error copying record")
			Return -1
		END IF
		
		//get just copied row number
		li_nr = lds_exp_copy.RowCount()
		ll_rec_id = lds_exp_copy.GetItemNumber( li_nr, "rec_id" ) 
		
		//attention:set sort first
		if ll_rec_id_first = ll_rec_id and li_facility_id_first = li_verif_facility_id then 
			ll_seq_no++
		else
		//end of add

			SELECT Max( seq_no )  
			INTO :ll_seq_no  
			FROM verif_info  
			WHERE verif_info.rec_id = :ll_rec_id  and facility_id = :li_verif_facility_id; 

			if isnull(ll_seq_no) then ll_seq_no = 0
			ll_seq_no++
			ll_rec_id_first = ll_rec_id
			li_facility_id_first = li_verif_facility_id
		end if
	
		lds_exp_copy.SetItem( li_nr , "facility_id", li_verif_facility_id )
		lds_exp_copy.SetItem( li_nr , "seq_no", ll_seq_no )
		lds_exp_copy.SetItem( li_nr, "first_sent", nulldate )
		lds_exp_copy.SetItem( li_nr, "last_sent", nulldate )
		lds_exp_copy.SetItem( li_nr, "number_sent", 0 )
		lds_exp_copy.SetItem( li_nr, "date_recieved", nulldate )
		lds_exp_copy.SetItem( li_nr, "user_name", "" )
		lds_exp_copy.SetItem( li_nr, "response_code", nullint )
		//lds_exp_copy.SetItem( li_nr, "priority_user", "PUBLIC" ) //removed 010703
		lds_exp_copy.SetItem( li_nr, "priority", 2 )
		lds_exp_copy.SetItem( li_nr, "exp_credential_flag", 0)
		//find out what the user has selected for the new verificatin method
		ll_new_ver_method = lds_reapp.GetItemNumber( i, "new_verification_method" )
		lds_exp_copy.SetItem( li_nr, "verification_method", ll_new_ver_method )
		//concantenate doc_id
		ls_doc_id = String(ll_rec_id) + "-" + string(al_prac_id) + "-" + string(li_verif_facility_id) + "-" + string(ll_seq_no)
		lds_exp_copy.SetItem( li_nr, "doc_id", ls_doc_id )
		lds_exp_copy.SetItem( li_nr, "print_flag", 1 )
		//make current verif entry inactive
		lds_exp_copy.SetItem( li_nr, "verif_info_notes", "" ) // added 092800 maha
		lds_exp_copy.SetItem( li_nr, "active_status", 1 )
	END FOR
END IF	
//\******************* end of verification creation *************************************
debugbreak()

li_parent_facility_id = ai_parent_facility

lds_appt_stat.SetItem( 1, "active_status", 0 )
//grab the last sequence number
ll_seq_no = lds_appt_stat.GetItemNumber( 1, "seq_no" )
ll_rec_id = lds_appt_stat.GetItemNumber( 1, "rec_id" )
//grab the audit and verifying and app audit facility id(s)
li_audit_facility_id = lds_appt_stat.GetItemNumber( 1, "application_audit_facility" )
li_verif_facility_id = lds_appt_stat.GetItemNumber( 1, "verifying_facility" )
dt_prior_start = lds_appt_stat.GetItemdatetime( 1, "apptmnt_start_date" )
dt_prior_end = lds_appt_stat.GetItemdatetime( 1, "apptmnt_end_date" )
//get a new record id
ll_new_rec_id = gnv_app.of_get_id("RECORD_ID")


select reap_user into :i from facility where facility_id = :li_parent_facility_id;
if isnull(i) then i = 0
choose case i
	case 0 //default
		ls_assn_user = "PUBLIC"
	case 1 //copy
		ls_assn_user = lds_appt_stat.GetItemstring( 1, "priority_user" )
	case 2 //current user
		ls_assn_user = gs_user_id
end choose


ll_appt_stat_id = ll_new_rec_id

if isvalid(w_recred_batch) then w_recred_batch.il_appt_id = ll_new_rec_id // set in batch window if exists for priv functionality
//add a new row to appointment status
li_nr = lds_appt_stat.InsertRow( 0 )
lds_appt_stat.SetItem( li_nr, "rec_id", ll_new_rec_id )
lds_appt_stat.SetItem( li_nr, "prac_id", al_prac_id )
lds_appt_stat.SetItem( li_nr, "parent_facility_id", li_parent_facility_id )
ll_seq_no++
lds_appt_stat.SetItem( li_nr, "seq_no", ll_seq_no )
lds_appt_stat.SetItem( li_nr, "verifying_facility", li_verif_facility_id )
lds_appt_stat.SetItem( li_nr, "application_audit_facility", li_audit_facility_id )
lds_appt_stat.SetItem( li_nr, "apptmnt_type", "R" )
lds_appt_stat.SetItem( li_nr, "affiliation_status", lds_appt_stat.GetItemstring( 1, "affiliation_status" ) )
lds_appt_stat.SetItem( li_nr, "inital_appmnt_date", lds_appt_stat.GetItemdatetime( 1, "inital_appmnt_date" ) )
lds_appt_stat.SetItem( li_nr, "prior_appt_start", dt_prior_start )
lds_appt_stat.SetItem( li_nr, "prior_appt_end", dt_prior_end )
lds_appt_stat.SetItem( li_nr, "prov_status", 0 )
lds_appt_stat.SetItem( li_nr, "admit_priv", lds_appt_stat.GetItemnumber( 1, "admit_priv" ) )  
lds_appt_stat.SetItem( li_nr, "priority_user", ls_assn_user ) 

li_set23 = of_get_app_setting("set_23","I")
IF li_set23 = 1 THEN
	dt_cust4 =  lds_appt_stat.GetItemdatetime( 1, "custom_4" ) //lij custom
	lds_appt_stat.SetItem( li_nr, "custom_4",dt_cust4 )
end if

//staff category
//SELECT set_32 INTO :li_set32 FROM icred_settings; //inova rules maha 092303
li_set32 = of_get_app_setting("set_32","I")

lds_appt_staff_cat = CREATE datastore
lds_appt_staff_cat.DataObject = "d_pd_affil_staff_cat"
lds_appt_staff_cat.SetTransObject( SQLCA )

//department info
lds_appt_dept = CREATE datastore
lds_appt_dept.DataObject = "d_pd_affil_departments"
lds_appt_dept.SetTransObject( SQLCA )

//credentialing review commitee(s)
lds_appt_comms = CREATE datastore
lds_appt_comms.DataObject = "d_pd_comm_review"
lds_appt_comms.SetTransObject( SQLCA )

//leave info
lds_appt_leave = CREATE datastore
lds_appt_leave.DataObject = "d_pd_affil_leave"
lds_appt_leave.SetTransObject( SQLCA )

gnv_appeondb.of_startqueue( )

lds_appt_staff_cat.Retrieve( ll_rec_id,gs_user_id )
lds_appt_dept.Retrieve( ll_rec_id,gs_user_id )
lds_appt_comms.Retrieve( ll_rec_id, gs_user_id )
lds_appt_leave.Retrieve( ll_rec_id, gs_user_id )

gnv_appeondb.of_commitqueue( )

//staff cat creation
li_row_cnt = lds_appt_staff_cat.Rowcount( )

IF li_row_cnt > 0 THEN
	lds_appt_staff_cat.SetSort("seq_no")
	lds_appt_staff_cat.Sort()
	ll_seq_no = lds_appt_staff_cat.GetItemNumber( li_row_cnt , "seq_no" )
	FOR i = 1 TO li_row_cnt
		ll_seq_no++
		li_no_copy = 0
		//code rearranged 030304 maha
		//copy all records unless setting is 1 and the record is inactive
		//traditional method clears dates and set to active requested
		//set to 1 (inova) leaves dates and checks the values of the requested status
		IF li_set32 = 1 THEN //inova
			if lds_appt_staff_cat.getItemnumber( i, "requested" ) = 0 then //dont copy inactive maha 081403
				li_no_copy = 1
			end if
		end if
		if li_no_copy = 0 then
			lds_appt_staff_cat.RowsCopy( i, i, Primary!, lds_appt_staff_cat, 1000, Primary! )
			lds_appt_staff_cat.SetItem( i, "active_status", 0 )
			lds_appt_staff_cat.SetItem( lds_appt_staff_cat.RowCount(), "rec_id", ll_new_rec_id )
			
			lds_appt_staff_cat.SetItem( lds_appt_staff_cat.RowCount(), "active_status", 1 )
			lds_appt_staff_cat.SetItem( lds_appt_staff_cat.RowCount(), "seq_no", ll_seq_no )
			if li_set32 < 1 then //standard method null dates
				lds_appt_staff_cat.SetItem( lds_appt_staff_cat.RowCount(), "from_date", nulldate )
				lds_appt_staff_cat.SetItem( lds_appt_staff_cat.RowCount(), "to_date", nulldate )
				lds_appt_staff_cat.SetItem( lds_appt_staff_cat.RowCount(), "requested", 1 )
		
			elseif li_set32 = 1 then  //inova requested rules maha 092303
				if not isnull(lds_appt_staff_cat.GetItemdatetime( i , "to_date" )) then
					lds_appt_staff_cat.SetItem( lds_appt_staff_cat.RowCount(), "requested", 0 ) //history
				elseif not isnull(lds_appt_staff_cat.GetItemdatetime( i , "from_date" )) then
					lds_appt_staff_cat.SetItem( lds_appt_staff_cat.RowCount(), "requested", 1 ) //active
				else
					lds_appt_staff_cat.SetItem( lds_appt_staff_cat.RowCount(), "requested", 2 ) //requested
				end if
			end if
		end if
			
	END FOR
END IF


//dept creation
li_row_cnt = lds_appt_dept.Rowcount( )

IF li_row_cnt > 0 THEN
	lds_appt_dept.SetSort("seq_no")
	lds_appt_dept.Sort()
	ll_seq_no = lds_appt_dept.GetItemNumber( li_row_cnt , "seq_no" )	
	FOR i = 1 TO li_row_cnt
		ll_seq_no++
		lds_appt_dept.RowsCopy( i, i, Primary!, lds_appt_dept, 1000, Primary! )
		lds_appt_dept.SetItem( i, "active_status", 0 )
		lds_appt_dept.SetItem( lds_appt_dept.RowCount(), "rec_id", ll_new_rec_id )		
		lds_appt_dept.SetItem( lds_appt_dept.RowCount(), "active_status", 1 )
		lds_appt_dept.SetItem( lds_appt_dept.RowCount(), "seq_no", ll_seq_no )		
	END FOR
END IF

//committees creation
li_row_cnt = lds_appt_comms.Rowcount( )

IF li_row_cnt > 0 THEN
	lds_appt_comms.SetSort( "seq_no" )
	lds_appt_comms.Sort()
	ll_seq_no = lds_appt_comms.GetItemNumber( li_row_cnt , "seq_no" )	
	FOR i = 1 TO li_row_cnt
		ll_seq_no++				
		lds_appt_comms.RowsCopy( i, i, Primary!, lds_appt_comms, 1000, Primary! )
		lds_appt_comms.SetItem( i, "active_status", 0 )//set org record to history
		lds_appt_comms.SetItem( lds_appt_comms.RowCount(), "rec_id", ll_new_rec_id )		
		lds_appt_comms.SetItem( lds_appt_comms.RowCount(), "active_status", 1 )
		lds_appt_comms.SetItem( lds_appt_comms.RowCount(), "review_results", nullint )		
		lds_appt_comms.SetItem( lds_appt_comms.RowCount(), "date_back_from_review", nulldate )		
		lds_appt_comms.SetItem( lds_appt_comms.RowCount(), "date_sent_for_review", nulldate )
		lds_appt_comms.SetItem( lds_appt_comms.RowCount(), "seq_no", ll_seq_no )				
	END FOR
END IF

//leave creation
li_row_cnt = lds_appt_leave.Rowcount( )

IF li_row_cnt > 0 THEN
	lds_appt_leave.SetSort("seq_no")
	lds_appt_leave.Sort()
	ll_seq_no = lds_appt_leave.GetItemNumber( li_row_cnt , "seq_no" )	
	FOR i = 1 TO li_row_cnt
		ll_seq_no++
		lds_appt_leave.RowsCopy( i, i, Primary!, lds_appt_leave, 1000, Primary! )
		lds_appt_leave.SetItem( i, "active_status", 0 )
		lds_appt_leave.SetItem( lds_appt_leave.RowCount(), "rec_id", ll_new_rec_id )		
		lds_appt_leave.SetItem( lds_appt_leave.RowCount(), "active_status", 1 )
		lds_appt_leave.SetItem( lds_appt_leave.RowCount(), "seq_no", ll_seq_no )		
	END FOR
END IF


gnv_data.of_getitem( "code_lookup", 'lookup_code', "upper(code) = 'APP-RCVD'")
gnv_data.of_getitem( "code_lookup", 'lookup_code', "upper(code) = upper('Exp Appt Ltr')")
//---------------------------- APPEON END ----------------------------

IF adw_action_items.RowCount() > 0 THEN
	for i = 1 to adw_action_items.Rowcount( )	
		IF adw_action_items.GetItemNumber( i, "verification_method" ) = ll_exp_appt_ltr THEN
			if	adw_action_items.GetItemNumber( i, "prac_id" ) = al_prac_id and adw_action_items.GetItemNumber( i, "parent_facility_id" ) = ai_parent_facility then //trap for act items maha092503
				if isnull(adw_action_items.getItemdatetime( i, "date_recieved")) then
					adw_action_items.SetItem( i, "user_name", gnv_app.of_getuserid() )
					adw_action_items.SetItem( i, "date_recieved", Today() )
				end if
				adw_action_items.SetItem( i, "response_code", ll_response_code  )
				adw_action_items.SetItem( i, "active_status", 0 )
				exit //once found drop loop
			end if
		END IF
	next
END IF


//commit;
sqlca.autocommit = false

gnv_appeondb.of_startqueue( )

IF  as_ver_type <> "NOVER" then
	debugbreak()
	lds_reapp.update(true,false)
	lds_exp_copy.update(true,false)
end if
adw_action_items.update(true,false)
lds_appt_stat.update(true,false)
lds_appt_staff_cat.update(true,false)
lds_appt_dept.update(true,false)
lds_appt_comms.update(true,false)
lds_appt_leave.update(true,false)

		
gnv_appeondb.of_commitqueue( )
//@@@@need test
//open appointment window if manual
if ai_silent = 0 	then
	//Open up window with new appointment status information
	gl_facility_id = li_parent_facility_id
	gl_prac_id = al_prac_id
	gs_param = "REAPP"
	Open( w_back_from_committee )
	IF Message.StringParm = "Cancel" THEN
		ROLLBACK USING SQLCA;
		sqlca.autocommit = true
		
		RETURN -1
	END IF
end if

IF  as_ver_type <> "NOVER" then
	lds_reapp.ResetUpdate()
	lds_exp_copy.ResetUpdate()
end if
adw_action_items.ResetUpdate()
lds_appt_staff_cat.ResetUpdate()
lds_appt_dept.ResetUpdate()
lds_appt_stat.ResetUpdate()
lds_appt_comms.ResetUpdate()
adw_action_items.ResetUpdate()
lds_appt_leave.ResetUpdate()

//create attest questions
lnv_data_entry.of_generate_attest_questions( "reapp", ai_parent_facility, al_prac_id, ll_new_rec_id )

//Start Code Change ----08.27.2008 #V85 maha - set run type for log
if ai_silent = 1 then
	ls_runtype = "BAT"
else
	ls_runtype = "MAN"
end if
ldt_now = datetime (today(),now())
//End Code Change---08.27.2008

// move npdb, corresp letters etc. to history  //maha added here 03073
gnv_appeondb.of_startqueue( )

update verif_info set active_status = 0 where screen_id = 1 and prac_id = :al_prac_id and facility_id = :li_parent_facility_id;
//Start Code Change ----08.27.2008 #V85 maha - create log entry
insert into sys_recred_log (rec_id,prac_id, facility_id, date_run, run_by, run_type) values( :ll_new_rec_id  , :al_prac_id ,:li_parent_facility_id  , :ldt_now, :gs_user_id ,  :ls_runtype)
//End Code Change---08.27.2008
commit using sqlca;

gnv_appeondb.of_commitqueue( )


//add app audit data
ll_prac_id[1] = al_prac_id
ll_rec_id1[1] = ll_rec_id
ll_rec_id1[2] = ll_new_rec_id

lnv_data_entry.of_app_audit_items_add( li_parent_facility_id, al_prac_id, ll_new_rec_id ,li_audit_facility_id,"Reapp",ldw_audit	, "R" )

destroy lnv_data_entry

sqlca.autocommit = true


//Added for work Flow. Trigger the related work flow for practitioner reappointment. 2/11/2006 Henry
If gb_workflow Then //Enable the work flow
	long ll_wf_id
	ll_wf_id = long(gnv_data.of_getitem("facility", "facility_wf_reappointment_initiated" , "facility_id="+string(ai_parent_facility)))
	If ll_wf_id > 0 Then
		n_cst_workflow_triggers lnv_triggers
		lnv_triggers = create n_cst_workflow_triggers
			
		str_action_item lstr_action
		lstr_action.prac_id = al_prac_id
		lstr_action.rec_id = 0
		lstr_action.screen_id = -10
		lstr_action.facility_id = ai_parent_facility
		lstr_action.wf_id = ll_wf_id
		lnv_triggers.of_workflow_create_action_items(lstr_action)
		
		destroy lnv_triggers
	End If
End If
//End added for Work Flow

IF as_ver_type = "NOVER" then
	DESTROY lds_exp_copy
	DESTROY lds_reapp
end if

  UPDATE wv_esign_log  
     SET isdisabled = 1  
   WHERE ( wv_esign_log.facility_id = :ai_parent_facility ) AND  
         ( wv_esign_log.prac_id = :al_prac_id )   ;

DESTROY ldw_audit
DESTROY lds_action_items
DESTROY lds_appt_dept
DESTROY lds_appt_comms
DESTROY lds_appt_stat
DESTROY lds_appt_staff_cat
DESTROY lds_appt_leave


RETURN 0

end function

public function integer of_retrieve_recred (datawindow adw_verifs, long al_prac, long al_vfacil);//Start Code Change ----07.17.2008 #V85 maha - Function Created to replace code in verification object so it can be used for action items and batch recreds
integer li_rc
integer i
integer li_check
long t
long del
long ll_test1
long ll_test2
long ll_rec
datetime ldt_end
datetime ldt_check

li_rc = adw_verifs.Retrieve( al_prac)
//set selected based on verify rule
FOR i = 1 TO li_rc
	IF adw_verifs.GetItemString( i, "verify_data" ) = "B" THEN
		adw_verifs.SetItem( i, "selected", 1 )
	//Start Code Change ----08.12.2008 #V85 maha	
	// deselect hosp/training verifications based on check years setting.	 Note: this will only work for the full end_date field, not with month and year
		li_check = adw_verifs.getitemnumber(i,"check_back_years")
		if not isnull(li_check)  and li_check > 0 then
			ll_rec = adw_verifs.GetItemNumber( i, "rec_id" )
			//get end date
			if adw_verifs.GetItemNumber( i, "screen_id" ) = 10 then  //hospital
				select end_date into :ldt_end from pd_hosp_affil where rec_id = :ll_rec;
			elseif adw_verifs.GetItemNumber( i, "screen_id" ) = 7 then //training
				select end_date into :ldt_end from pd_training where rec_id = :ll_rec;
			end if
			//compare end date to today less check back years
			if not isnull(ldt_end) then
				t =  0 - li_check * 365
				if relativedate(today(),t ) > date(ldt_end) then
					adw_verifs.SetItem( i, "selected", 0 ) //if older than deselect
				end if
			end if
	
		end if
	//End Code Change---08.12.2008		
		
	ELSE
		adw_verifs.SetItem( i, "selected", 0 )
	END IF
	
	IF adw_verifs.GetItemnumber( i, "facility_id" ) = al_vfacil THEN
		adw_verifs.SetItem( i, "color", 1 )
	else
		adw_verifs.SetItem( i, "selected", 0 )
	end if
			
		

END FOR
adw_verifs.Sort()
adw_verifs.GroupCalc() 

FOR i = 1 TO li_rc
		ll_test1 = adw_verifs.GetItemNumber( i, "rec_id" )
		del = adw_verifs.GetItemNumber( i, "del" )
		if del = 1 then continue
		for t = 1 to li_rc
				ll_test2 = adw_verifs.GetItemNumber( t, "rec_id" )
				if i <> t and ll_test1 = ll_test2 and isnull(adw_verifs.GetItemnumber( i, "verification_id" )) and isnull(adw_verifs.GetItemnumber( t, "verification_id" )) then
					adw_verifs.SetItem( t, "del", 1 )
			   end if
		next
next
FOR i =  li_rc to 1 step -1
	if adw_verifs.getItemnumber( i, "del") = 1 then
		adw_verifs.SetItem( i, "selected", 0 )
	end if
next
	
return 1
end function

public function integer of_set_send_info (long al_row, string as_response);//Start Code Change ----06.16.2008 #V81 maha - function created for setting sent values
long li_found
integer li_last_num_sent
string ls_notes

li_found = al_row

li_last_num_sent = ids_ai_detail.GetItemNumber( li_found, "number_sent" )
IF IsNull(li_last_num_sent) THEN
	li_last_num_sent = 0
END IF
li_last_num_sent++
ids_ai_detail.SetItem( li_found, "number_sent", li_last_num_sent )
ids_ai_detail.SetItem( li_found, "print_flag", 0 )			
IF IsNull( ids_ai_detail.GetItemDateTime( li_found, "first_sent" ) ) THEN
	ids_ai_detail.SetItem( li_found, "first_sent", DateTime(Today(), Now()) )
END IF
		
ls_notes = ids_ai_detail.GetItemString( li_found, "notes" ) 
IF IsNull( ls_notes ) OR ls_notes = "" THEN
	ls_notes = ""
END IF
		
ids_ai_detail.SetItem( li_found, "last_sent", DateTime(Today(), Now()) )

if as_response = "Y" then // Correspondence (Approval) letters only
	ids_ai_detail.SetItem(  li_found, "response_code", il_ver_response )
	ids_ai_detail.SetItem(  li_found, "date_recieved", DateTime( Today(),Now()) )
	ids_ai_detail.SetItem(  li_found, "user_name", gs_user_id )
end if

return 1
end function

public function string of_set_i_r_filter (string as_type, integer ai_ver_facil);//Start Code Change ----09.30.2008 #V85 maha - added for ccvs customization; called from of_retrieve_detail
integer i
integer ic
integer li_screen
string ls_filter = " and ( screen_id =  1 or"
datastore lds_rules
debugbreak()
lds_rules  = create datastore

lds_rules.dataobject = "d_ver_rules_for_ccvs_filter"
lds_rules.settransobject(sqlca)

ic = lds_rules.retrieve(  ai_ver_facil ) //get verif rules for facility

if ic > 0 then
	for i = 1 to ic
		li_screen  = lds_rules.getitemnumber(i, "screen_id")
		if li_screen > 1 then
			choose case as_type
				case 'R'  //if recred only get 'B' records
					if  lds_rules.getitemstring(i, "verify_data") = 'B' then
						ls_filter += " screen_id =  " + string(li_screen) + " or"
					end if
				case 'I' //if initial get all
					ls_filter += " screen_id =  " + string(li_screen) + " or"
			end choose
		end if
	next
end if

ls_filter = mid( ls_filter ,1,len(ls_filter ) - 2) //strip off last 'or'

ls_filter = ls_filter + ") "

//is_i_r_filter = ls_filter

//messagebox("is_i_r_filter",is_i_r_filter)
destroy lds_rules

//of_ver_filter( )

return ls_filter
end function

public function integer of_exp_cred_letter_combined (long al_pracs[], string al_docids[], integer ai_facility, n_ds ads_rows, u_dw ads_docs, string as_from);//Start Code Change ----7.21.2008 #V85 maha - new function. Called from of_print letters_combined
long p
long i
long ic
long pc
integer li_found
integer chk
long ll_prac[]
long ll_prac_get
string ls_filter
string ls_field
long ll_method
string ls_doc
string ls_org_filter

//ads_docs is the verification records from the original screen action items or prac folder
//ads_rows is the letter ds

ll_prac[] = al_pracs[]

	//	get exception list of non retrieved providers / list of good providers  from base
	//	refilter by exp cred letter and base data pracs
	//	copy filtered rows to temp ds
	//	for each prac
	//		filter temp data
	//		extract data values and populate base data
	//	sort by name
	//	save data
//get prac list from verif data

choose case as_from
	case "AC"	
		ls_org_filter = w_action_items.is_combined_filters
		
end choose
//ids_ai_detail.setredraw = false
//ls_org_filter = ids_ai_detail.describe("datawindow.table.filter") 
//messagebox("",ls_org_filter)

datetime ldt_exp
string ls_test
//	retrieve basic data
pc = ads_rows.retrieve(ll_prac[] , ai_facility)
ll_method = long(gnv_data.of_getitem("code_lookup","lookup_code","lookup_name = 'Verification Method' and upper(code) = 'EXP CRED LTR'"))
for p = 1 to upperbound(ll_prac)
	ll_prac_get = ll_prac[p]
	li_found = ads_rows.find("prac_id = " + string(ll_prac_get ),1,pc)
	if li_found > 0 then //if the prac base info is retrieved, then filter for the other exp cred letters
		ls_filter = "prac_id = " + string(ll_prac_get ) + " and verification_method = " + string(ll_method ) + " and isnull(response_code) "
		chk = ids_ai_detail.setfilter(ls_filter)
		if chk = -1 then messagebox ("of_exp_cred_combined function","Filter failed. Contact Support")
		ids_ai_detail.filter()
		ic = ids_ai_detail.rowcount()
			//debugbreak()
		for i = 1 to ic
			ls_field = "reference_" + string(i)
			ls_test = ads_rows.dataobject
			//messagebox("dataobject", ls_test)
			ls_test = ads_docs.getitemstring(i,"reference_value")
			ads_rows.setitem(li_found,ls_field, ls_test )//ads_docs.getitemstring(i,"verif_info_reference_value") )
			ls_field = "screen_" + string(i)
			ads_rows.setitem(li_found,ls_field, ads_docs.getitemstring(i,"screen_alias") )
			ls_field = "exp_date_" + string(i)
			ldt_exp = ads_docs.getitemdatetime(i,"expiration_date")
			ads_rows.setitem(li_found,ls_field, string(date(ldt_exp)) )
			is_doc_ids_exp[i] = ads_docs.getitemstring(i,"doc_id")
			//messagebox("doc_id",is_doc_ids_exp[i] )
			//of_set_send_info(i)
		next
	end if //found
next

//clear the filter
ids_ai_detail.setfilter(ls_org_filter)
ids_ai_detail.filter()
 //ids_ai_detail.setredraw = true

return 1
end function

public function integer of_printletters_combined (string as_doc_id[], string as_affil_stat, string as_letter_name, string as_letter_type, u_dw adw_detail, string as_doc_name, boolean ab_print_preview, string as_sql, long al_pracids[], integer ai_facility, string as_funct_type, string as_from);//Start Code Change ----06.13.2008 #V81 maha - new function for combining all print letter functionalities
Boolean lb_error_rec
Boolean lb_print_release 
Boolean lb_print_priv
Boolean lb_found
Boolean lb_print_label = False
Boolean lb_retrieved = false
boolean lb_exp_combined = false //maha 081308
Integer li_error_cnt
Integer e
long li_doc_id_cnt
Integer d
Integer b
Integer li_len
Integer li_start_page
Integer li_to_page
Integer li_num_pages  
Integer l
Integer li_retval
Integer li_total_letter_path_cnt
Integer li_last_num_sent
Integer li_rc
Integer li_total_letters
Integer i
Integer li_val
Integer li_found
Integer s
Integer li_ent_cnt
Integer li_pos
Integer li_ans
Integer li_ltr_cnt
Integer li_verif_facility_id
Integer li_total_facilities_cnt
Integer li_verif_facility_ids_all[]
Integer li_address_cnt
integer li_setcopy
integer li_export_id = 0
integer li_export_on = 0 
integer li_corr_response = -1
integer res  
integer li_image_cnt
integer lcnt
integer li_store_in_db
Long ll_prac_id
Long ll_loop_count
long li_facility_id = ai_facility
long ll_ver_response 
long li_ltr_rec_cnt
string docid 
String ls_notes
String ls_doc_name  
String ls_path
String ls_letter
String ls_letter_from_path
//String ls_file_name
String ls_image_file_name
String ls_image_path
String ls_letter_dw
String ls_style
String ls_entity[]
String ls_val
String ls_val_1
String ls_verifying_facility_name[]
String ls_word_path
String ls_added_data_to_letter
//String ls_letter_path
String ls_letter_paths_all[]
String ls_doc_id
String ls_verifying_facility_nm
string ls_from 
string ls_to
string ls_c
string ls_run_path
string ls_open_doc
string ls_open_merge
string ls_exportname
String ls_group_syntax
String ls_grey
String ls_white
String ls_presentation_str
String ls_dwsyntax_str
String Errors
string ls_client_id
n_ds lds_letter
n_appeon_download lnv_download
n_appeon_storage_area lnv_storage_area
n_cst_array_db ln_cst_array_db_case
gs_fax lgs_fax


li_setcopy = of_get_app_setting("set_6","I")
li_store_in_db = of_get_app_setting("set_50","I")

//as_doc_name is the name of the document (no path if using db storage
//as_letter_name is the screen name for verif letters ; the document name for correspondence letters
ls_doc_name = as_doc_name 
is_letter_name = as_letter_name
ls_added_data_to_letter = as_funct_type

//Corresp letter name trap
if as_letter_type = "P" then //for correspondence letter get the export info
	select count(letter_name) into :lcnt from sys_letters where letter_name = :is_letter_name;	
	if lcnt < 1 then
		messagebox("Letter Error","Letter '" + is_letter_name + "' does not exist in the letter Painter.  Unable to run letter." )
		return -1
	else
//new	@@@@	select use_export, export_id, letter_name, added_data into :li_export_on,:li_export_id, :is_letter_name, :ls_added_data_to_letter from sys_letters where letter_name = :as_letter_name;		
		select use_export, export_id, letter_name into :li_export_on,:li_export_id, :is_letter_name from sys_letters where letter_name = :as_letter_name;		
	end if
	//for type P letters get the response code value
	SELECT code_lookup.lookup_code  	INTO :il_ver_response	FROM code_lookup WHERE ( code_lookup.lookup_name = 'Credentials Verification Response' ) AND   ( code_lookup.code = 'N/A'  )   ;
end if

//Down load the file from database if necessary; set letter from path
If li_store_in_db = 1 or  Upper( appeongetclienttype() ) = 'WEB' Then
	IF lnv_storage_area.of_retrieve_doc_from_db( ai_facility, ls_doc_name, ls_letter_from_path) < 0 THEN //
		Messagebox("Download File",'The MSWord document '+  ls_doc_name  +'  does not exist in the database. (of_printletters)')
		RETURN -1
	END IF	
	lnv_download.of_parsepath( ls_open_merge) //checks for directory
else
	for i = 1 to 50 //loop through find end of path
		b =  pos(ls_doc_name,"\",d + 1)
		if b = 0 then
			exit
		else
			d = b
		end if
	next
	ls_doc_name = mid (ls_doc_name , d + 1)
	ls_letter_from_path = mid (ls_doc_name , 1, d )	
End If

//set the save paths
ls_run_path = of_letter_paths("L") //letter path
ls_open_merge = of_letter_paths("D") //merge document path

ls_to = ls_run_path + ls_doc_name
ls_from = ls_letter_from_path + ls_doc_name

gnv_rights.of_check_dir_right(ls_run_path, true, 'Letter Path')
gnv_rights.of_check_dir_right(ls_open_merge, true, 'Letter Path')

//Corresp letter name trap
if as_letter_type = "P" then //for correspondence letter get the export info
	select count(letter_name) into :lcnt from sys_letters where letter_name = :is_letter_name;	
	if lcnt < 1 then
		messagebox("Letter Error","Letter '" + is_letter_name + "' does not exist in the letter Painter.  Unable to run letter." )
		return -1
	else
//new	@@@@	select use_export, export_id, letter_name, added_data into :li_export_on,:li_export_id, :is_letter_name, :ls_added_data_to_letter from sys_letters where letter_name = :as_letter_name;		
		select use_export, export_id, letter_name into :li_export_on,:li_export_id, :is_letter_name from sys_letters where letter_name = :as_letter_name;		
	end if
end if

li_pos = Pos( is_letter_name, "/" )  //replacing / and spaces with _
IF li_pos > 0 THEN
	is_letter_name = Mid( is_letter_name, 1, li_pos -1) + "_" + Mid( is_letter_name, li_pos+1, 500 )
END IF

li_pos = Pos( is_letter_name, " " )
IF li_pos > 0 THEN
	is_letter_name = Mid( is_letter_name, 1, li_pos -1) + "_" + Mid( is_letter_name, li_pos+1 )
END IF

li_pos = Pos( is_letter_name, " " )
IF li_pos > 0 THEN
	is_letter_name = Mid( is_letter_name, 1, li_pos -1) + "_" + Mid( is_letter_name, li_pos+1 )
END IF

//set the name of the letter dw object
if as_letter_type = "P" then  //prac corresp letters
	if isnull(ls_added_data_to_letter) or  ls_added_data_to_letter = "" then ls_added_data_to_letter = "C"
	choose case ls_added_data_to_letter
		case "C" //regular corresp letter
			ls_letter_dw =  "d_ltr_general_corros_act_items" 
		case "A" // missing app audit
			
		case "B" //both app audit and verification
			
		case "V" //incomplete verifications
			
		case "N" //net dev
			
		case "P" //case review
			
		case "Q" //QA
			
	end choose
elseif as_letter_type = "M" then // missing info letter
	if ls_added_data_to_letter = "V" then
		//add the verifications to the missing letter
	end if
else
	choose case  ls_added_data_to_letter
		case "E" //exp cred letters combined
			ls_letter_dw = "d_ltr_exp_cred_combined"
			is_letter_name = "expiring_combined"
			lb_exp_combined = true
		case "F" //add facilities on exp appt letters	
			//customization requested but not approved 7-08
		case else //standard verif letter
			ls_letter_dw = Lower( "d_ltr_" + is_letter_name )
		end choose
end if
//messagebox("ls_letter_dw",ls_letter_dw)

//create the action items detail dw and share it with the one on the action item interface
ids_ai_detail = CREATE n_ds
ids_ai_detail.DataObject = adw_detail.DataObject 
adw_detail.ShareData( ids_ai_detail )

//create the letters datawindow and retrieve using the doc id
lds_letter = CREATE n_ds

IF  lb_exp_combined = true then
	//debugbreak()
	lds_letter.dataobject = ls_letter_dw
	lds_letter.settransobject(sqlca)
	//messagebox("","1")
	of_exp_cred_letter_combined(al_pracids[], as_doc_id[] ,ai_facility, lds_letter, adw_detail, as_from)
	//messagebox("","2")
	lb_retrieved = true
	li_ltr_rec_cnt = lds_letter.rowcount()
ELSEIF as_sql = '' OR IsNull( as_sql ) THEN //verification letters
	If Upper(appeongetclienttype()) = 'WEB' Then
		Choose Case ls_letter_dw
			Case 'd_ltr_expiring_dea_registration_w_cat'  //long name
				lds_letter.DataObject = 'd_ltr_expiring_dea_registration_w_catweb'
			Case 'd_ltr_expiring_special_certifications' // long name
				lds_letter.DataObject = 'd_ltr_expiring_special_certificationsweb'
			Case Else 
				lds_letter.DataObject = ls_letter_dw + '_web'
		End Choose
	Else
		lds_letter.DataObject = ls_letter_dw 
	End If
	//---------------------------- APPEON END ----------------------------	
	li_retval =lds_letter.of_SetTransObject( SQLCA )
	//MessageBox("Letter dw","")
	IF li_retval =-1 THEN
		MessageBox("Letter dw","Invalid Letter Datawindow name  -" + ls_letter_dw )
		Return -1
	END IF

ELSE  //for all valid standard letters

	ls_group_syntax = ""
	ls_grey = String(rgb(192,192,192))
	ls_white = String(rgb(255,255,255))
	ls_presentation_str = "style( type=Group) Column(Border=0) Datawindow(Color=" + ls_white + " )" + "Text(Border=6 Background.Color=" + ls_grey + ")"
	
	as_sql = as_sql + " AND ( doc_id IN ("
	
	li_doc_id_cnt = UpperBound( as_doc_id[] )

	FOR d = 1 TO li_doc_id_cnt
		as_sql = as_sql + "'" +  as_doc_id[d] + "',"
	END FOR
	
	as_sql = Mid( as_sql, 1, Len( as_sql )-1 ) + "))"
	
	ls_dwsyntax_str = SQLCA.SyntaxFromSQL(as_sql, ls_presentation_str, ERRORS)
	
	//ClipBoard( as_sql )

	IF Len(ERRORS) > 0 THEN
		MessageBox("Caution", &
		"SyntaxFromSQL caused these errors: " + ERRORS)
		RETURN -1
	END IF

	lds_letter.Create( ls_dwsyntax_str, ERRORS)
	
	IF Len(ERRORS) > 0 THEN
		MessageBox("Caution", &
		"Create cause these errors: " + ERRORS)
		RETURN -1
	END IF
	
	lds_letter.SetTransObject( SQLCA )
	lds_letter.Retrieve( )
	lb_retrieved = True  
END IF

If lb_retrieved = False Then 
	If Upper(appeongetclienttype()) = 'WEB' Then
		ln_cst_array_db_case = Create n_cst_array_db
		ln_cst_array_db_case.of_array_to_db( as_doc_id, ls_client_id)
		li_ltr_rec_cnt = lds_letter.Retrieve( ls_client_id )
		ln_cst_array_db_case.of_delete_temp_data(ls_client_id)
		Destroy ln_cst_array_db_case
	Else
		li_ltr_rec_cnt = lds_letter.Retrieve( as_doc_id )
	End If
End If

IF li_ltr_rec_cnt < 1 THEN
	MessageBox(" Retrieval Error", "Letter query did not return any results. Check for missing data." )		
	RETURN -1
ELSE
	//************************************************************************
	//EXPORT CODE
	//\/maha 110402 check and create export file for merge document 
	if gi_export_on = 1 then 
		if as_letter_type = "P" then //for correspondence letter get the export info
			if li_export_on = 1 then
				if li_export_id > 0 then
					res = of_run_export(al_pracids[],li_export_id,ls_open_merge)
					if res < 1 then 
						messagebox("Export Error","Failed to create file from export.")
						li_export_on = 0
					else
						select export_name into :ls_exportname from export_header where export_id = :li_export_id;
					end if
				end if
			end if
		else
			IF as_letter_name = "expiring_appointment"  THEN
				SELECT reapp_export, reapp_export_id
				INTO:li_export_on,
					 :li_export_id 
				FROM facility
				WHERE facility_id = :ai_facility;
				IF SQLCA.SQLCODE = -1 THEN
					MessageBox("SQL ERROR", SQLCA.SQLERRTEXT )
					Return -1
				END IF
			elseif as_letter_name = "expiring_provisional" then
				SELECT prov_export, prov_export_id
				INTO:li_export_on,
					 :li_export_id
				FROM facility
				WHERE facility_id = :ai_facility;
				IF SQLCA.SQLCODE = -1 THEN
					MessageBox("SQL ERROR", SQLCA.SQLERRTEXT )
					Return -1
				END IF	
			elseif as_letter_name = "expiring_allied_health"  then
				SELECT reappah_export, reappah_export_id
				INTO:li_export_on,
					 :li_export_id
				FROM facility
				WHERE facility_id = :ai_facility;
				IF SQLCA.SQLCODE = -1 THEN
					MessageBox("SQL ERROR", SQLCA.SQLERRTEXT )
					Return -1
				END IF
			END IF
			if li_export_on = 1 then
				if li_export_id > 0 then
					res = of_run_export(al_pracids[],li_export_id,ls_open_merge)
					if res < 1 then 
						messagebox("Export Error","Failed to create file from export.")
						li_export_on = 0
					else
						select export_name into :ls_exportname from export_header where export_id = :li_export_id;
					end if
				end if
			end if	
		end if
	end if
	//\maha	
END IF

ls_style = "ind"

li_ltr_cnt = 0 //w_ai_print_letters_new.dw_letters.GetItemNumber( w_ai_print_letters_new.dw_letters.GetRow(), "ctotal_letters"  )

li_rc = lds_letter.RowCount( )
			
IF li_rc < 1 THEN
		RETURN -1 //CONTINUE
		messagebox("","no li_rc")
END IF
	//debugbreak()
//save the data source
lds_letter.SaveAs( ls_open_merge + is_letter_name + ".txt", Text!, True )		
lds_letter.SaveAs( ls_open_merge + "mailing_labels_ver_letter.txt", Text!, True )		
lds_letter.SaveAs( ls_open_merge + "ind_generic_corrospondence.txt", Text!, True )

//if running from an export set the merge variable to the export name 
if li_export_on = 1 then
	// return by of_run_export function if using an export
	else
		ls_open_merge =  ls_open_merge + is_letter_name + ".txt"
end if


//word path code removed 02 2405 maha 4.517 readded 071805 to allow as option
if li_setcopy = 5 then //specific setting to use old open word functionality
	ls_word_path = ProfileString(gs_IniFilePathName, "paths", "word", "None")
		
	If appeongetclienttype() = 'PB' Then
		IF NOT FileExists(gs_IniFilePathName) THEN
			MessageBox("INI File Error", "No intellicred.ini file was found at: " + gs_IniFilePathName )
			Return -1
		END IF
	End If

	//check to see if ms word path set in ini file is correct
	IF NOT FileExists( ls_word_path ) THEN 
		MessageBox("Print Error", "Invalid MS Word for Windows path set in INI file: " + ls_word_path )
		Return -1
	END IF
end if

//s:\letters\education.doc"
//li_len = Len( ls_doc_name )
//debugbreak()
//copy letter function		
IF li_setcopy = 1 THEN //copy letter
	if upper(ls_letter_from_path) = upper(ls_run_path) then //maha 050602 trap against copying to same location
		messagebox("Path error","Your letter path is set to " + ls_run_path + " ~rand the Copy Letters setting is turned on. ~rGo to System->Utilities->Application settings and set Copy Letters to No to run letters normally.")
		return -1
	end if
	//check to make sure letter and path exists
	IF NOT FileExists(ls_letter_from_path + ls_doc_name ) THEN
		MessageBox("Print Error", "Cannot find word letter " +  ls_doc_name + " in directory: " + ls_letter_from_path )
		Return -1
	else 
		ls_from  = ls_letter_from_path + ls_doc_name
	END IF
			
	//copy letter  then run
	if fileexists(ls_to) then
		if FileDelete( ls_to) = false then //maha040705
			//messagebox("Copying letter from server","Unable to delete existing letter " + ls_doc_name + " in " + gs_dir_path + gs_DefDirName + "\Letters\Standard prior to copy.~r  Check letter properties to see if letter is Read Only.")
			messagebox("Copying letter from server","Unable to delete existing letter " + ls_to + " prior to copy.~r  Check letter properties to see if letter is Read Only.")  //Start Code Change ----02.28.2008 #V8 maha - corrected message to correct path
		end if
	end if

	CopyFileA( ls_from, ls_to, true )
				
	DO WHILE NOT FileExists( ls_to )
		ll_loop_count++
		IF ll_loop_count = 1000000 THEN
			MessageBox("Timeout", "Timed out trying to copy Word file.  ~rfrom: " + ls_from + "~r to: " + ls_to)
			EXIT
		END IF
	LOOP
END IF
		
//check to make sure letter and path exists
IF NOT FileExists(ls_to ) THEN
	MessageBox("Print Error", "Invalid letter document path: " + ls_to)
	Return -1
END IF

if li_setcopy = 5 then //maha 071805 to allow old method cannot be used with copy letters
	Run( ls_word_path + " " + ls_to , Maximized!)//" /mpreview"
else
	if gnv_app.gnvlo_msword.of_open_word_document( ls_to , ls_open_merge, "Verification") = -1 then
		return -1
	end if
end if
	
	
If gnv_data.of_getitem('icred_settings' ,'set_50' , False ) = '1' or   Upper( appeongetclienttype() ) = 'WEB' Then
	IF Pos( Upper(ls_letter_dw), "EXPIRING" ) > 0 THEN 
		lgs_fax.ss_mail_label_doc = "mailing_labels_prac_corro_letters.doc"
	ELSE			
		lgs_fax.ss_mail_label_doc = "mailing_labels_ver_letter.doc"
	END IF
else
	IF Pos( Upper(ls_letter_dw), "EXPIRING" ) > 0 THEN 
		lgs_fax.ss_mail_label_doc = ls_run_path + "mailing_labels_prac_corro_letters.doc"
	ELSE			
		lgs_fax.ss_mail_label_doc = ls_run_path + "mailing_labels_ver_letter.doc"
	END IF
end if


//settings for print message box
lgs_fax.ss_message = "Did the " + is_letter_name + " letter print Ok?"
lgs_fax.ss_letter_name =  ls_style + "_" + is_letter_name + "_letter" 
lgs_fax.ss_letter_document_name = ls_doc_name// + "/mpreview"
lgs_fax.sdw_letter = lds_letter

//@@@@@@@ may need addtional for missing/ appl
IF is_letter_name = "expiring_appointment"  OR is_letter_name = "expiring_provisional" OR is_letter_name = "expiring_allied_health" THEN
	lgs_fax.ss_letter_type = "ExpAppt"
elseif as_letter_type = "P" then //correspond letter
	lgs_fax.ss_letter_type = "Corro"
ELSEIF Pos( Upper(ls_letter_dw), "EXPIRING" ) > 0 THEN
	lgs_fax.ss_letter_type = "ExpLtr"								
ELSE
	lgs_fax.ss_letter_type = "Verif"			
END IF		
	
//wait for user to ok the printing
OpenWithParm( w_ai_print_msg_box, lgs_fax )
debugbreak()
gs_fax_error_records lst_fax_error_records
lst_fax_error_records = Message.PowerObjectParm
IF lst_fax_error_records.il_error_rec_num[ 1 ] = -2 THEN		
	Return -1
END IF		
		
li_error_cnt = UpperBound( lst_fax_error_records.il_error_rec_num )
		
//update the action item detail screen with date/time user stamps

IF lb_exp_combined = true then
	for s = 1 to upperbound(as_doc_id[])
		ls_doc_id = as_doc_id[s]
		li_found = ids_ai_detail.Find( "doc_id = '" +  ls_doc_id + "'" , 1, 1000 )
		IF li_found < 1 THEN Continue
		of_set_send_info(li_found, "N")
		w_ai_print_letters_new.dw_letters.SetItem( li_found , "num_printed", li_rc)	//maha 051501	
		w_ai_print_letters_new.dw_letters.SetItem( li_found, "print_status", 1 )
	next
	
	
Else	//all letters other than the exp cred combined
	FOR s = 1 TO li_rc
		lb_error_rec = False
		FOR e = 1 TO li_error_cnt
			IF lst_fax_error_records.il_error_rec_num[e] = s THEN
				lb_error_rec = True
				Exit
			END IF
		END FOR
		IF lb_error_rec THEN
			CONTINUE
		END IF
		
		ls_doc_id = lds_letter.GetItemString( s, "doc_id" )
		li_found = ids_ai_detail.Find( "doc_id = '" +  ls_doc_id + "'" , 1, 1000 )
	
		IF li_found < 1 THEN Continue
	
		//of_set_send_info(li_found)
	
		if as_letter_type = "P" and li_corr_response = 0 then// Correspondence (Approval) letters only and  if needs response is set to No complete the verification
			of_set_send_info(li_found, "Y")
		else
			of_set_send_info(li_found, "N")
		end if
	
	END FOR
	
	//if all the letters were printed successfully then put a check next to the letter
	IF li_ltr_cnt = li_total_letters THEN //@@@@@@ where get these values  also in combined sets or all letters
		w_ai_print_letters_new.dw_letters.SetItem( w_ai_print_letters_new.dw_letters.GetRow(), "num_printed", li_rc)	//maha 051501	
		w_ai_print_letters_new.dw_letters.SetItem( w_ai_print_letters_new.dw_letters.GetRow(), "print_status", 1 )
	END IF 
End If
						
//update the action item detail view by updating then re-retrieving data
IF ids_ai_detail.Update() <> 1 THEN
	MessageBox("Update Failed", "Error while updating " + adw_detail.DataObject )
ELSE
	COMMIT USING SQLCA;
	adw_detail.Event pfc_Retrieve()
END IF


Destroy ids_ai_detail
Destroy lds_letter
Destroy ids_ai_detail

Return 0
end function

on pfc_n_cst_ai_printletters.create
call super::create
end on

on pfc_n_cst_ai_printletters.destroy
call super::destroy
end on

