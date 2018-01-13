$PBExportHeader$pfc_n_cst_npdb_org.sru
forward
global type pfc_n_cst_npdb_org from nonvisualobject
end type
end forward

global type pfc_n_cst_npdb_org from nonvisualobject
end type
global pfc_n_cst_npdb_org pfc_n_cst_npdb_org

type prototypes
Function Long Convert (String file_name, String replace_char ) library "FileConvert.dll" alias for "Convert;Ansi"
end prototypes

type variables

end variables

forward prototypes
public function string of_npdb_sub (string as_command)
end prototypes

public function string of_npdb_sub (string as_command);//example of running npdb.exe with parameters
//"\development\version 1.5.3\npdb.exe" "intellicred client-p2*c:\icd\"

String ls_check_sum
String ls_icd_upload_dir = gs_dir_path + "icd\upload\"
String ls_icd_dir = gs_dir_path + "icd\"
String ls_data_source
String ls_prac_facility_id
String ls_retrieve_type
String ls_sql
String null_char
Long ll_id
String ls_version
Integer li_mark1
Integer li_mark2


//figure out the command line parameters
as_command = Mid( as_command, 2, 1000 )
as_command = Mid( as_command, 1, Len( as_command ) )

ls_data_source = Mid( as_command, 1, Pos( as_command, "-" ) -1 )

//messagebox("", ls_data_source)
IF Upper( ls_data_source ) = "INTELLICRED CLIENT" THEN
	ls_version = "Windows"
ELSE
	ls_version = "Web"
END IF

li_mark1 = Pos( as_command, "-" ) 
li_mark2 = Pos( as_command, "*" )

ls_prac_facility_id = Mid( as_command, li_mark1 + 1, li_mark2 - li_mark1 -1 )

ls_icd_dir = Mid( as_command, li_mark2+1, 1000 )
ls_icd_upload_dir = ls_icd_dir + "upload\"


IF Upper( Mid( ls_prac_facility_id, 1, 1 ) ) = "F" THEN
	ls_retrieve_type = "F"
ELSE
	ls_retrieve_type = "P"
END IF

ll_id =  Long( Mid( ls_prac_facility_id, 2, 100 ) )

//Messagebox("", as_command )
//MessageBox("DB", ls_Data_source )
//MessageBox("Retrieve", ls_retrieve_type )
//Messagebox("ID", ls_id )
//Messagebox("dir", ls_icd_dir )
//Messagebox("dir", ls_icd_upload_dir )

//debugbreak()

IF ls_version = "Web" THEN
	SQLCA.DBMS="ODBC"
	SQLCA.DbParm="ConnectString='DSN=" + ls_data_source + ";UID=dba;PWD=sql;',DelimitIdentifier='Yes'"
	SQLCA.AutoCommit = TRUE
	
	//--------------------------- APPEON BEGIN ---------------------------
	//$< Add  > 2007-09-14 By: Scofield
	//$<Reason> Set the connection cache dynamically on Web
	if AppeonGetClientType() = 'WEB' then
		SQLCA.DBMS = gs_CacheType
		SQLCA.DBParm = gs_CacheSet
	end if
	//---------------------------- APPEON END ----------------------------

	CONNECT USING SQLCA;

	IF SQLCA.SQLCODE = -1 THEN
		IF ls_version = "Windows" THEN
			MessageBox("1", "Connection Failed" )
		ELSE
			UPDATE ids
			SET export_id = 1;
		END IF
		Return "-1"
	END IF
END IF

//UPDATE THE EXPORT ID TO 0
UPDATE ids
SET export_id = 1;


datastore lds_action_items_NPDB
datastore lds_action_items_HIPDB
datastore lds_name
datastore lds_license
datastore lds_school
datastore lds_address
datastore lds_npdb_fields
Integer li_found
Integer li_hipdb_rc
Integer li_parent_facility_id
Integer li_asci_val
Integer li_sub_file_len
Integer li_FileNum
Integer li_pad_len
Integer li_num_sent
Integer li_field_len
Integer li_name_rc
Integer li_license_rc
Integer li_school_rc
Integer li_address_rc
Integer li
Integer li_get_row
Integer li_row_cnt
Integer li_field_cnt
Integer i
Integer f
Integer li_rc
Integer li_retval
Long ll_prac_id
Long ll_check_sum
String ls_char
String ls_sub_file
String ls_prac_id
String ls_doc_id
String ls_field_nm
String ls_record
String ls_message_header
String ls_section
String ls_field_val
String ls_file_nm
String ls_ssn1

//new npdb variables
String ls_1_hdr_data_rec
String ls_2_qry_data_rec
String ls_3_cert_data_rec
String ls_4_ind_subj_data_rec
String ls_5_drug_enforc_data_rec
String ls_6_ind_lic_data_rec
String ls_7_prof_school_data_rec
String ls_8_other_name_data_rec
String ls_9_ssn_data_Rec
STring ls_10_femin_data_rec
String ls_11_napi_data_rec
String ls_12_upin_data_rec
String ls_13_cust_data_rec
String ls_14_trailer

String nc
String ls_dbid_entity_nbr
String ls_dbid_entity_pass
String ls_dbid_agent_nbr 
String ls_credit_card_nbr
String ls_credit_card_exp
String ls_payment_type = "C"
String ls_cert_name
String ls_cert_title
String ls_cert_phone
String ls_cert_ext
String ls_cert_date

//variables for the individual subject data record
String ls_lname
String ls_fname
String ls_mname
String ls_suffix
String ls_gender
String ls_home_addr1
String ls_home_addr2
String ls_home_city
String ls_home_state
String ls_home_cntry
String ls_home_zip5
String ls_home_zip4
String ls_org_name 
String ls_org_type
String ls_org_type_descr
String ls_work_addr1
String ls_work_addr2
String ls_work_city 
String ls_work_state
String ls_work_cntry
String ls_work_zip_5
String ls_work_zip_4
String ls_dob
String ls_reserved_deceased
String ls_reserved_deceased_dt

//ini file minipulation variables
String ls_ini_data
Integer li_filenum2
Integer li_start_pos
Integer li_end_pos

//variables for license data record
String ls_isofl_fld1
String ls_o_isofl_description 
String ls_isofl_nbr
String ls_isofl_st1
String ls_specialty

//variables for proff school data record
String ls_school1 
String ls_grad_yr1


//payment type
//A = Electronic Payment
//C = Credit Card
ls_payment_type = "C"

String ls_trans_code
String ls_query_type
String ls_parent_facility_id
String ls_npdb_hipdb
//query types
// P Employment
// M Hospital mandetory 2 year



//nc = Char( 0 )
//SetNull( nc )
//nc = "~000"
//nc = Char( 0 )

nc = "@" //"*"  //"~h00"


//SELECT ids.null_value  
//INTO :null_char 
//FROM ids  ;

//IF IsNull( nc ) THEN
//	MessageBox("", "it is null" )
//END IF

//grap the npdb action items
lds_action_items_NPDB = CREATE datastore
IF ls_retrieve_type = "F" THEN
	lds_action_items_NPDB.DataObject = "d_npdb_action_items_facility_id"
ELSE
	lds_action_items_NPDB.DataObject = "d_npdb_action_items_prac_id"
END IF
lds_action_items_NPDB.SetTransObject( SQLCA )

//17 represents the NPDB Query verification method
li_row_cnt =lds_action_items_NPDB.Retrieve( 17, ll_id )
//MessageBox("li_row_cnt", li_row_cnt )
IF li_row_cnt = 0 THEN
	IF ls_version = "Windows" THEN
		MessageBox("2", "No data returned" )
	ELSE
		UPDATE ids
		SET export_id = 2;
	END IF
	Return "-1"
END IF
//figure out if the hipdb info is to be queried also
ls_npdb_hipdb = lds_action_items_NPDB.GetItemString( 1, "queries" )

IF li_row_cnt = 1 THEN
	ls_trans_code = "1L"
ELSE
	ls_trans_code = "1A"
END IF

//IF the hipdb is to be verified also
IF ls_npdb_hipdb = "B" THEN
	//grap the HIPDB action items
	lds_action_items_HIPDB = CREATE datastore
	IF ls_retrieve_type = "F" THEN
		lds_action_items_HIPDB.DataObject = "d_npdb_action_items_facility_id"
	ELSE
		lds_action_items_HIPDB.DataObject = "d_npdb_action_items_prac_id"
	END IF
	lds_action_items_HIPDB.SetTransObject( SQLCA )
	//14 represents the HIPDB Query verification method
	li_hipdb_rc = lds_action_items_HIPDB.Retrieve( 14, ll_id )
END IF



li_parent_facility_id = lds_action_items_NPDB.GetItemNumber( 1, "parent_facility_id" )
ls_parent_facility_id = String(li_parent_facility_id, "###")
IF Len(ls_parent_facility_id) = 1 THEN
	ls_parent_facility_id = "00" + ls_parent_facility_id
ELSEIF Len(ls_parent_facility_id) = 2 THEN
	ls_parent_facility_id = "0" + ls_parent_facility_id		
END IF

ls_dbid_entity_nbr = lds_action_items_NPDB.GetItemString( 1, "npdb_entity_dbid" )
ls_dbid_entity_pass = lds_action_items_NPDB.GetItemString( 1, "npdb_pass" )
ls_dbid_agent_nbr = lds_action_items_NPDB.GetItemString( 1, "npdb_agent_dbid" )
ls_credit_card_nbr = lds_action_items_NPDB.GetItemString( 1, "npdb_cc_nbr" )
ls_credit_card_exp = lds_action_items_NPDB.GetItemString( 1, "npdb_cc_exp" )
ls_payment_type = lds_action_items_NPDB.GetItemString( 1, "npdb_pay_type" )
ls_cert_name = lds_action_items_NPDB.GetItemString( 1, "npdb_cert_name" )
ls_cert_title = lds_action_items_NPDB.GetItemString( 1, "npdb_cert_title" )
ls_cert_phone = lds_action_items_NPDB.GetItemString( 1, "npdb_cert_phone" )
ls_cert_ext = lds_action_items_NPDB.GetItemString( 1, "npdb_cert_ext" )
IF IsNull( ls_cert_ext ) THEN
	ls_cert_ext = ""
END IF
ls_cert_date = String( lds_action_items_NPDB.GetItemDate( 1, "npdb_cert_date" ), "mmddyyyy" )
ls_query_type = "P"  //Privileging or Employment Refer to section 6 list e for query type codes  //lds_action_items_NPDB.GetItemString( 1, "npdb_query_type" )


//create a file name
ls_file_nm = String( Today(), "mmdd" ) + String(Hour(Now())) + String(Second(Now()))
//messagebox("", ls_icd_upload_dir + ls_file_nm + ".fil" )
li_FileNum = FileOpen( ls_icd_upload_dir + ls_file_nm + ".fil" , StreamMode!, Write!, LockWrite!, Replace!)
//messagebox("", li_filenum)

//modify the uploadfile name in the itp.ini file
//li_FileNum2 = FileOpen( ls_icd_dir + "itp.ini", StreamMode!, Read!)
//FileRead( li_filenum2, ls_ini_data )
//li_start_pos = Pos( ls_ini_data, "UploadFile=" ) + 10
//li_end_pos = li_start_pos + 13
//FileClose( li_filenum2 )
ls_ini_data = Left( ls_ini_data, li_start_pos )  + ls_file_nm  + ".fil" + Mid( ls_ini_data, li_end_pos, 1000 )
ls_ini_data = ls_icd_upload_dir + ls_ini_data
li_FileNum2 = FileOpen( ls_icd_dir + "upload.lst", StreamMode!, Write!, LockWrite!, Replace!)
//messagebox("", ls_ini_data)
FileWrite( li_filenum2, ls_ini_data )
FileClose( li_filenum2 )

//0. message header
ls_message_header = "~~|~~NPDB-Q~~|~~ VER: 3.00                      TY1NY                     "

//1. header data record
ls_1_hdr_data_rec = "HDR" + nc + ls_dbid_entity_nbr + nc + ls_dbid_entity_pass + nc + ls_trans_code + nc + "R5.0" + nc + ls_file_nm + nc + String( Today(), "mmddyyyy" ) + nc + ls_dbid_agent_nbr + nc + "~n"

//concat after check sum calculateion
ls_sub_file = ls_sub_file + ls_1_hdr_data_rec

//FileWrite( li_filenum, ls_sub_file )
//FileClose( li_filenum )
//Run( ls_icd_upload_dir + "conv.bat " + ls_icd_upload_dir + " " + ls_icd_upload_dir + ls_file_nm + ".fil " + ls_icd_upload_dir + ls_file_nm + ".fil", Minimized! )
//Return "d"
//

//2. Query Data Record
ls_2_qry_data_rec = "QRY" + nc + ls_query_type + nc + String( li_row_cnt ) + nc + ls_payment_type + nc + ls_credit_card_nbr + nc + ls_credit_card_exp + nc + nc + "~n"
ls_sub_file = ls_sub_file + ls_2_qry_data_rec

//3. Certification Data Record
ls_3_cert_data_rec = "CERT" + nc + ls_cert_name + nc + ls_cert_title + nc + ls_cert_phone + nc + ls_cert_ext + nc + ls_cert_date + nc + "~n"

ls_sub_file = ls_sub_file + ls_3_cert_data_rec

//name info
lds_name = CREATE datastore
lds_name.DataObject = "d_npdb_name_info"
lds_name.SetTransObject( SQLCA )

//address info
lds_address = CREATE datastore
lds_address.DataObject = "d_npdb_address"
lds_address.SetTransObject( SQLCA )

//license info
lds_license = CREATE datastore
lds_license.DataObject = "d_npdb_license"
lds_license.SetTransObject( SQLCA )

//school info
lds_school = CREATE datastore
lds_school.DataObject = "d_npdb_school"
lds_school.SetTransObject( SQLCA )

//lds_action_items_NPDB.SetFilter( "verification_method = 17" )
//lds_action_items_NPDB.Filter( )
//li_row_cnt = lds_action_items_NPDB.RowCount()
//

//debugbreak()
FOR i = 1 TO li_row_cnt

	//grap the practitioner id
	ll_prac_id = lds_action_items_NPDB.GetItemNumber( i, "prac_id" )
	//messagebox("prac_id", ll_prac_id )
	//4. Individual Subject Data Record
	li_name_rc = lds_name.Retrieve( ll_prac_id )		
	IF li_name_rc < 1 THEN
		IF ls_version = "Windows" THEN
			MessageBox("Step 3; processed #" + string(i), "No data for Individual Subject Data Record for practitioner " + string(ll_prac_id ))
		ELSE
			UPDATE ids
			SET export_id = 3;
		END IF
		//--------------------------- APPEON BEGIN ---------------------------
		//$<Add> 08.23.2007 By: Evan
		//$<Reason> Need to destroy object.
		if IsValid(lds_action_items_HIPDB) then Destroy lds_action_items_HIPDB
		//---------------------------- APPEON END ----------------------------		
		Return "-1"
	END IF	

	li_address_rc = lds_address.Retrieve( ll_prac_id )		
	IF li_address_rc < 1 THEN
		IF ls_version = "Windows" THEN
			MessageBox("Step 4; processed #" + string(i), "No data for Individual address Data Record for practitioner " + string(ll_prac_id) )
		ELSE
			UPDATE ids
			SET export_id = 4;
		END IF
		//--------------------------- APPEON BEGIN ---------------------------
		//$<Add> 08.23.2007 By: Evan
		//$<Reason> Need to destroy object.
		if IsValid(lds_action_items_HIPDB) then Destroy lds_action_items_HIPDB
		//---------------------------- APPEON END ----------------------------		
		Return "-1"
	END IF
	
//	DEBUGBREAK()
	ls_lname = lds_name.GetItemString( 1, "last_name" ) + nc
	ls_fname = lds_name.GetItemString( 1, "first_name" ) + nc	
	ls_mname = ""  + nc
	ls_suffix = ""  + nc
	ls_gender = Left( lds_name.GetItemString( 1, "gender" )	, 1 )  + nc
	ls_home_addr1 = ""  + nc
	ls_home_addr2 = ""  + nc
	ls_home_city = ""  + nc
	ls_home_state = ""  + nc
	ls_home_cntry = ""  + nc
	ls_home_zip5 = ""  + nc
	ls_home_zip4 = ""  + nc
	ls_org_name = lds_address.GetItemString( 1, "organization_name" )  + nc
	ls_org_type = ""  + nc
	ls_org_type_descr = ""  + nc
	ls_work_addr1 = lds_address.GetItemString( 1, "address" )  + nc
	ls_work_addr2 = ""  + nc
	ls_work_city = lds_address.GetItemString( 1, "city" )  + nc
	ls_work_state = lds_address.GetItemString( 1, "state" )  + nc
	ls_work_cntry = ""  + nc
	ls_work_zip_5 = Left( lds_address.GetItemString( 1, "zip" ), 5 )  + nc
	ls_work_zip_4 = ""  + nc
	ls_dob = String( lds_name.GetItemDateTime( 1, "date_of_birth" ), "mmddyyyy" )  + nc
	ls_reserved_deceased = ""  + nc
	ls_reserved_deceased_dt = ""  + nc

	
	ls_4_ind_subj_data_rec = "ISUBJ" + nc + ls_lname + ls_fname + ls_mname + ls_suffix + ls_gender +&
						ls_home_addr1 + ls_home_addr2 + ls_home_city + ls_home_state +&
						ls_home_cntry + ls_home_zip5 + ls_home_zip4 + ls_org_name +&
						ls_org_type + ls_org_type_descr + ls_work_addr1 + ls_work_addr2 +&
						ls_work_city + ls_work_state + ls_work_cntry + ls_work_zip_5 +&
						ls_work_zip_4 + ls_dob + ls_reserved_deceased +ls_reserved_deceased_dt + "~n"	

	ls_sub_file = ls_sub_file + ls_4_ind_subj_data_rec
	
	//5. drug enforcement administration data record
	ls_5_drug_enforc_data_rec = "DEA" + nc + nc + nc + "~n"
	
	ls_sub_file = ls_sub_file + ls_5_drug_enforc_data_rec
	
	//6. individual subject license data record
	li_license_rc = lds_license.Retrieve( ll_prac_id )		
	IF li_license_rc < 1 THEN
		IF ls_version = "Windows" THEN
			MessageBox("Step 5; processed #" + string(i), "No data for license Data Record for practitioner " + string(ll_prac_id ))
		ELSE
			UPDATE ids
			SET export_id = 5;
		END IF
		//--------------------------- APPEON BEGIN ---------------------------
		//$<Add> 08.23.2007 By: Evan
		//$<Reason> Need to destroy object.
		if IsValid(lds_action_items_HIPDB) then Destroy lds_action_items_HIPDB
		//---------------------------- APPEON END ----------------------------		
		Return "-1"
	END IF
	
	ls_isofl_fld1 = lds_license.GetItemString( 1, "field" ) + nc
	ls_o_isofl_description = "" + nc
	ls_isofl_nbr = lds_license.GetItemString( 1, "number" ) + nc
	ls_isofl_st1 = lds_license.GetItemString( 1, "state" ) + nc
	ls_specialty = nc + nc
	
	ls_6_ind_lic_data_rec = "ISOFL" + nc + ls_isofl_fld1 + ls_o_isofl_description + ls_isofl_nbr +&
						ls_isofl_st1 + ls_specialty + nc + "~n"
						
	ls_sub_file = ls_sub_file + ls_6_ind_lic_data_rec
	
	//7.professional school data record	
	li_school_rc = lds_school.Retrieve( ll_prac_id )		
	IF li_school_rc < 1 THEN
		lds_school.DataObject = "d_npdb_school_other"
		lds_school.SetTransObject( SQLCA )
		li_school_rc = lds_school.Retrieve( ll_prac_id )		
		IF li_school_rc < 1 THEN
			IF ls_version = "Windows" THEN
				MessageBox("Step 6; processed #" + string(i), "No data for school Data Record for practitioner " + string(ll_prac_id) )
			ELSE
				UPDATE ids
				SET export_id = 6;
			END IF
			//--------------------------- APPEON BEGIN ---------------------------
			//$<Add> 08.23.2007 By: Evan
			//$<Reason> Need to destroy object.
			if IsValid(lds_action_items_HIPDB) then Destroy lds_action_items_HIPDB
			//---------------------------- APPEON END ----------------------------			
			Return "-1"
		END IF
	END IF
	ls_school1 = lds_school.GetItemString( 1, "school" )
	ls_grad_yr1 = String( lds_school.GetItemNumber( 1, "year" ) )
	IF Len( ls_grad_yr1 ) = 2  THEN
		ls_grad_yr1 = "19" + ls_grad_yr1
	END IF
		
	ls_7_prof_school_data_rec = "GRAD" + nc + ls_school1 + nc + ls_grad_yr1 + nc + "~n"

	ls_sub_file = ls_sub_file + ls_7_prof_school_data_rec
		
	//8. Other names used data record
	ls_8_other_name_data_rec = "ALIAS" + nc + nc + nc + nc + nc + nc + "~n"
	
	ls_sub_file = ls_sub_file + ls_8_other_name_data_rec	
	
	//9. Social Security Number data record
	ls_ssn1 = lds_name.GetItemString( 1, "ssn" ) + nc	
	ls_9_ssn_data_Rec = "SSN" + nc + ls_ssn1 + nc + "~n"
	
	ls_sub_file = ls_sub_file + ls_9_ssn_data_Rec
	
	//10. Federal Employer Identfication Number Data Record
	ls_10_femin_data_rec = "FEIN" + nc + nc + nc + "~n" 
	
	ls_sub_file = ls_sub_file + ls_10_femin_data_rec
	
	//11. national provider identifier data record	
	ls_11_napi_data_rec = "NPI" + nc + nc + nc + "~n"
	
	ls_sub_file = ls_sub_file + ls_11_napi_data_rec
	
	//12. uniqu physican identification number data record
	ls_12_upin_data_rec = "UPIN" + nc + nc + nc + "~n"
	
	ls_sub_file = ls_sub_file + ls_12_upin_data_rec
	
	ls_doc_id = lds_action_items_NPDB.GetItemString( i, "doc_id" ) 
	
	//13. customer use data record
	ls_13_cust_data_rec = "CUSE" + nc + ls_doc_id + nc + "~n"

	ls_sub_file = ls_sub_file + ls_13_cust_data_rec
	
	//update NPDB action item dates
	li_num_sent = lds_action_items_NPDB.GetItemNumber( i, "number_sent" )
	li_num_sent++
	lds_action_items_NPDB.SetItem( i, "number_sent", 1 )
	lds_action_items_NPDB.SetItem( i, "print_flag", 0 )
	IF IsNull( lds_action_items_NPDB.GetItemDateTime( i, "first_sent" ) ) THEN
		lds_action_items_NPDB.SetItem( i, "first_sent", DateTime(Today(), Now()) )
	END IF
	lds_action_items_NPDB.SetItem( i, "last_sent", DateTime(Today(), Now()) )

END FOR
//update the action item detail view by updating then re-retrieving data
//IF lds_action_items_NPDB.Update() <> 1 THEN
//	IF ls_version = "Windows" THEN
//		MessageBox("7 Update Failed", "Error while updating " + lds_action_items_NPDB.DataObject )
//	ELSE
//		UPDATE ids
//		SET export_id = 7;
//	END IF
//	Return "-1"
//ELSE
//	COMMIT USING SQLCA;
//	lds_action_items_NPDB.Retrieve()
//END IF
//

IF ls_npdb_hipdb = "B" THEN
	//14 represents the HIPDB Query verification method
	FOR i = 1 TO li_hipdb_rc
		//update HIPDB action item dates
		li_num_sent = lds_action_items_HIPDB.GetItemNumber( i, "number_sent" )
		li_num_sent++
		lds_action_items_HIPDB.SetItem( i, "number_sent", 1 )
		lds_action_items_HIPDB.SetItem( i, "print_flag", 0 )
		IF IsNull( lds_action_items_HIPDB.GetItemDateTime( i, "first_sent" ) ) THEN
			lds_action_items_HIPDB.SetItem( i, "first_sent", DateTime(Today(), Now()) )
		END IF
		lds_action_items_HIPDB.SetItem( i, "last_sent", DateTime(Today(), Now()) )
	END FOR	
END IF
//update the action item detail view by updating then re-retrieving data
//IF lds_action_items_HIPDB.Update() <> 1 THEN
//	IF ls_version = "Windows" THEN
//		MessageBox("7 Update Failed", "Error while updating " + lds_action_items_NPDB.DataObject )
//	ELSE
//		UPDATE ids
//		SET export_id = 7;
//	END IF
//	Return "-1"
//ELSE
//	COMMIT USING SQLCA;
//END IF


ls_sub_file = ls_sub_file + "TRLR" + nc

li_sub_file_len = Len( ls_sub_file )

FOR i = 1 TO li_sub_file_len
	ls_char = Mid( ls_sub_file, i, 1 )
	IF ls_char = "*" THEN
		CONTINUE
	END IF
	li_asci_val = Asc( ls_char )
	ll_check_sum = ll_check_sum + li_asci_val
END FOR
//debugbreak()
ll_check_sum = Mod( ll_check_sum, 256 )

ls_check_sum = String( ll_check_sum )

ls_check_sum = Fill( "0", 3 - Len( ls_check_sum ) ) + ls_check_sum

ls_14_trailer =  ls_check_sum  + nc + "~n" 

ls_sub_file = ls_message_header + ls_sub_file + ls_14_trailer

FileWrite( li_filenum, ls_sub_file )

FileClose( li_filenum )

messagebox("", ls_icd_upload_dir + ls_file_nm + ".fil" )
Convert(   ls_icd_upload_dir + ls_file_nm + ".fil", "@" )
//Run( ls_icd_upload_dir + "conv.bat " + ls_icd_upload_dir + " " + ls_icd_upload_dir + ls_file_nm + ".fil " + ls_icd_upload_dir + ls_file_nm + ".fil", Minimized! )


UPDATE ids
SET export_id = 0;

//messagebox("hello", ls_icd_upload_dir + ls_file_nm + ".fil")

//MessageBox("NPDB", "The NPDB export file has be saved as " + ls_icd_upload_dir + ls_file_nm )

//--------------------------- APPEON BEGIN ---------------------------
//$<Add> 08.23.2007 By: Evan
//$<Reason> Need to destroy object.
if IsValid(lds_action_items_HIPDB) then Destroy lds_action_items_HIPDB
//---------------------------- APPEON END ----------------------------

Return ls_ini_data
end function

on pfc_n_cst_npdb_org.create
call super::create
TriggerEvent( this, "constructor" )
end on

on pfc_n_cst_npdb_org.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

