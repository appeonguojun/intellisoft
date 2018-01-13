$PBExportHeader$pfc_cst_u_security_user_painter.sru
forward
global type pfc_cst_u_security_user_painter from userobject
end type
type cb_ad from commandbutton within pfc_cst_u_security_user_painter
end type
type cb_5 from commandbutton within pfc_cst_u_security_user_painter
end type
type cb_requester from commandbutton within pfc_cst_u_security_user_painter
end type
type cb_4 from commandbutton within pfc_cst_u_security_user_painter
end type
type dw_group_users from u_dw within pfc_cst_u_security_user_painter
end type
type dw_group_list from u_dw within pfc_cst_u_security_user_painter
end type
type cb_batchaddgroup from commandbutton within pfc_cst_u_security_user_painter
end type
type cb_select from commandbutton within pfc_cst_u_security_user_painter
end type
type cb_group from commandbutton within pfc_cst_u_security_user_painter
end type
type st_group_user from statictext within pfc_cst_u_security_user_painter
end type
type st_group_select from statictext within pfc_cst_u_security_user_painter
end type
type st_2 from statictext within pfc_cst_u_security_user_painter
end type
type cb_3 from commandbutton within pfc_cst_u_security_user_painter
end type
type cb_2 from commandbutton within pfc_cst_u_security_user_painter
end type
type cb_1 from u_cb within pfc_cst_u_security_user_painter
end type
type dw_departments from datawindow within pfc_cst_u_security_user_painter
end type
type cb_sad from u_cb within pfc_cst_u_security_user_painter
end type
type st_view from statictext within pfc_cst_u_security_user_painter
end type
type dw_department from u_dw within pfc_cst_u_security_user_painter
end type
type cb_sav from u_cb within pfc_cst_u_security_user_painter
end type
type cb_saf from u_cb within pfc_cst_u_security_user_painter
end type
type dw_facility from u_dw within pfc_cst_u_security_user_painter
end type
type cb_save from u_cb within pfc_cst_u_security_user_painter
end type
type cb_delete from u_cb within pfc_cst_u_security_user_painter
end type
type dw_select_user from u_dw within pfc_cst_u_security_user_painter
end type
type cb_new from u_cb within pfc_cst_u_security_user_painter
end type
type dw_views from u_dw within pfc_cst_u_security_user_painter
end type
type st_1 from statictext within pfc_cst_u_security_user_painter
end type
type st_department from statictext within pfc_cst_u_security_user_painter
end type
type cb_close from u_cb within pfc_cst_u_security_user_painter
end type
type cb_print from u_cb within pfc_cst_u_security_user_painter
end type
type gb_select from groupbox within pfc_cst_u_security_user_painter
end type
type gb_main from groupbox within pfc_cst_u_security_user_painter
end type
type gb_1 from groupbox within pfc_cst_u_security_user_painter
end type
type dw_roles from u_dw within pfc_cst_u_security_user_painter
end type
type gb_2 from groupbox within pfc_cst_u_security_user_painter
end type
end forward

global type pfc_cst_u_security_user_painter from userobject
integer width = 4379
integer height = 1864
boolean border = true
long backcolor = 67108864
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_ad cb_ad
cb_5 cb_5
cb_requester cb_requester
cb_4 cb_4
dw_group_users dw_group_users
dw_group_list dw_group_list
cb_batchaddgroup cb_batchaddgroup
cb_select cb_select
cb_group cb_group
st_group_user st_group_user
st_group_select st_group_select
st_2 st_2
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
dw_departments dw_departments
cb_sad cb_sad
st_view st_view
dw_department dw_department
cb_sav cb_sav
cb_saf cb_saf
dw_facility dw_facility
cb_save cb_save
cb_delete cb_delete
dw_select_user dw_select_user
cb_new cb_new
dw_views dw_views
st_1 st_1
st_department st_department
cb_close cb_close
cb_print cb_print
gb_select gb_select
gb_main gb_main
gb_1 gb_1
dw_roles dw_roles
gb_2 gb_2
end type
global pfc_cst_u_security_user_painter pfc_cst_u_security_user_painter

type variables
String is_user_id
w_security_user_painter iw_win
Integer ii_dept_secure_setting

DataStore ids_facility //added by Alfee 06.11.2007
end variables

forward prototypes
public function integer of_create_user ()
public function integer of_delete ()
public function integer of_set_parent_window (w_security_user_painter aw_win)
public function integer of_copy_user ()
public function boolean of_isexceedmaxuserscnt ()
public function boolean of_isexceedmaxuserscnt (string as_user_id, long al_readonly)
public function integer of_check_date_alarm_user ()
end prototypes

public function integer of_create_user ();
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-01
//$<comment> 04.12.2006 By: Rodger Wu
//$<reason> Performance Tuning 
//$<modification> Comment out the following script. Use the global datastore gnv_data.ids_facility
//$<modification> to replace the local datastore.
/* n_ds lds_facility */
//---------------------------- APPEON END ----------------------------
n_ds 	lds_roles
n_ds 	lds_views
long	li_nr,ll_Row,ll_CurUserCnts,ll_MaxCnts

DataWindowChild dwchild

//--------------------------- APPEON BEGIN ---------------------------
//$<Modify> 2008-04-17 By: Scofield
//$<Reason> Save the data before create user.

//li_retval = iw_win.Event pfc_save()
//IF li_retval < 0 THEN
//	Return 1
//END IF

//if cb_save.TriggerEvent(Clicked!) < 0 then return -1					//Added By Mark Lee 05/11/2016 bug
if cb_save.event clicked( ) < 0 then return -1
//---------------------------- APPEON END ----------------------------

Open( w_get_user_id_v5 )  //maha 083105 changed window name
IF Message.StringParm = "Cancel" THEN
	Return -1
ELSE
	is_user_id = Message.StringParm
END IF

dw_Roles.enabled = true  //Start Code Change ----04.28.2008 #V8 maha
if len(is_user_id) < 1 then return -1 //maha 082203 
dw_Roles.Reset()
dw_Roles.SetTransObject( SQLCA )

/*  //Commented By Ken.Guo 2009-05-12
dw_facility.Reset()
dw_facility.SetTransObject( SQLCA )
dw_views.Reset()
dw_views.SetTransObject( SQLCA )
*/


/*  //Commented By Ken.Guo 2009-05-12
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-04
//$<add> 04.12.2006 By: Rodger Wu
//$<reason> Performance tuning
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.
IF dw_department.Visible THEN
	Long ll_security_dept_code
	dw_departments.SetTransObject( SQLCA )
End If
lds_views = CREATE n_ds
lds_views.DataObject = "ds_dataview_all"
lds_views.SetTransObject( SQLCA )

gnv_appeondb.of_StartQueue()
lds_views.Retrieve()
IF dw_department.Visible THEN
	SELECT MAX( user_depart_id ) 
	INTO :ll_security_dept_code
	FROM security_user_department;
	
	dw_departments.Retrieve()
	
	IF SQLCA.SQLCODE = -1 THEN
		MessageBox( "SQL Error", SQLCA.SQLERRTEXT )
	END IF
End If	
gnv_appeondb.of_CommitQueue()
//---------------------------- APPEON END ----------------------------
*/


/*  //Commented By Ken.Guo 2009-05-12
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-15
//$<modify> 02.17.2006 By: owen chen
//$<reason> Performance tuning
//$<modification> Define a variable to 1)get the first ID; 2)Update the final ID
//$<modification> value into database.
//li_rc = lds_views.Rowcount() + li_rc_facility
//li_rec_id = gnv_app.of_get_id( "RIGHTS" ,li_rc) - 1
li_rec_id = gnv_app.of_get_id( "user_facility_id" ,li_rc_facility) - 1
li_rc = li_rc_facility
//---------------------------- APPEON END ----------------------------
FOR i = 1 TO li_rc
	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> PT-06
	//$<modify> 02.17.2006 By: owen chen
	//$<reason> Performance tuning
	//$<modification> Comment out the following script to reduce client-server interaction.
	//$<modification> refer to PT-15 and of_get_id for more information.
	/*
	li_rec_id = gnv_app.of_get_id( "RIGHTS" )
	dw_facility.InsertRow( 0 )
	dw_facility.SetItem( i, "user_facility_id", li_rec_id )
	dw_facility.SetItem( i, "user_id", is_user_id )
	dw_facility.SetItem( i, "facility_id", lds_facility.GetItemNumber( i, "facility_id" ) )
	*/
	li_rec_id ++
	dw_facility.InsertRow( 0 )
	dw_facility.SetItem( i, "user_facility_id", li_rec_id )
	dw_facility.SetItem( i, "user_id", is_user_id )
	//---------Begin Modified by Alfee 06.11.2007------------------------
	dw_facility.SetItem( i, "facility_id", ids_facility.GetItemNumber( i, "facility_id" ) )
	//dw_facility.SetItem( i, "facility_id", gnv_data.ids_facility.GetItemNumber( i, "facility_id" ) )
	//---------End Modified ----------------------------------------------
	//---------------------------- APPEON END ----------------------------
	dw_facility.SetItem( i, "access_rights", 0 )
END FOR
*/

////role_id, role_name
//lds_roles = CREATE n_ds
//lds_roles.DataObject = "d_dddw_security_roles"
//lds_roles.SetTransObject( SQLCA )
//li_rc = lds_roles.Retrieve()
//
//FOR i = 1 TO li_rc
//	ll_rec_id = gnv_app.of_get_id( "RECORD_ID" )
//	dw_Roles.InsertRow( 0 )
//	dw_Roles.SetItem( i, "security_user_roles_user_role_id", ll_rec_id )
//	dw_Roles.SetItem( i, "security_user_roles_user_id", is_user_id )
//	dw_Roles.SetItem( i, "security_user_roles_access_rights", 0 )	
//	dw_Roles.SetItem( i, "security_user_roles_role_id", lds_roles.GetItemNumber( i, "role_id" ))	
//END FOR
//

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-07
//$<comment> 04.12.2006 By: Rodger Wu
//$<reason> Performance Tuning 
//$<modification> Move the following script to PT-04. It is integrated into Appeon Queue
//$<modification> labels to reduce client-server interactions.
/*
//data_view_id, data_view_name
lds_views = CREATE n_ds
lds_views.DataObject = "d_dddw_select_view"
lds_views.SetTransObject( SQLCA )
li_rc = lds_views.Retrieve()
*/
//---------------------------- APPEON END ----------------------------


//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-08
//$<modify> 02.17.2006 By: owen chen
//$<reason> Performance tuning
//$<reason> Reduce the frequency of client-server interactions to improve runtime performance.
/*
FOR i = 1 TO li_rc
	li_rec_id = gnv_app.of_get_id( "RIGHTS" )
*/
/*  //Commented By Ken.Guo 2009-05-12
li_rc = lds_views.Rowcount()
li_rec_id = gnv_app.of_get_id( "user_view_id" ,li_rc) - 1
FOR i = 1 TO li_rc
	li_rec_id ++
//---------------------------- APPEON END ----------------------------
	dw_views.InsertRow( 0 )
	dw_views.SetItem( i, "user_view_id", li_rec_id )
	dw_views.SetItem( i, "user_id", is_user_id )
	dw_views.SetItem( i, "access_rights", 0 )	
	dw_views.SetItem( i, "view_id", lds_views.GetItemNumber( i, "data_view_id" ) )	
END FOR
*/

dw_select_user.GetChild( "user_id", dwchild )
dwchild.SetTransObject( SQLCA )


li_nr = dwchild.InsertRow( 0 )
dwchild.SetItem( li_nr, "user_id", is_user_id )
dwchild.SetItem( li_nr, "user_password", "123" )
dwchild.SetItem( li_nr, "image_flag", "0" )
dwchild.SetItem( li_nr, "contract_default_view", 1001 )


/*  //Commented By Ken.Guo 2009-05-12
//add department data for security_user_department
IF dw_department.Visible THEN
		
	Integer li_dept_cnt
	Integer li_user_cnt
	Integer d
	Integer u
	Long ll_department
	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> PT-09
	//$<comment> 04.12.2006 By: Rodger Wu
	//$<reason> Performance Tuning 
	//$<modification> Move the following script to PT-04. It is integrated into Appeon Queue
	//$<modification> labels to reduce client-server interactions.
	/*
	Long ll_security_dept_code
	
	SELECT MAX( user_depart_id ) 
	INTO :ll_security_dept_code
	FROM security_user_department;
	IF SQLCA.SQLCODE = -1 THEN
		MessageBox( "SQL Error", SQLCA.SQLERRTEXT )
	END IF
	
	dw_departments.SetTransObject( SQLCA )
	dw_departments.Retrieve( )
	*/
	//---------------------------- APPEON END ----------------------------

	li_dept_cnt = dw_departments.RowCount( )
		
	//Loop through all department and setup department security
	FOR d = 1 TO li_dept_cnt
		ll_security_dept_code ++
		ll_department = dw_departments.GetItemNumber( d, "lookup_code" )
							
		li_nr = dw_department.InsertRow( 0 )
		dw_department.SetItem( li_nr, "user_depart_id", ll_security_dept_code )
		dw_department.SetItem( li_nr, "user_id", is_user_id )
		dw_department.SetItem( li_nr, "department_id", ll_department )		
		dw_department.SetItem( li_nr, "access_rights", 0 )
	END FOR			

END IF
*/

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-10
//$<modify> 02.17.2006 By: owen chen
//$<reason> Performance tuning
//$<modification> Add Appeon Update label to reduce client-server interactions to improve runtime performance.
/*
SQLCA.AutoCommit = false //maha 111604 because some of the data was not rolling back
IF dwchild.Update( True, False ) = 1 THEN
	IF dw_facility.Update( True, False ) = 1 THEN
		IF dw_Roles.Update( True, False ) = 1 THEN
			IF dw_views.Update( True, False ) = 1 THEN
				IF dw_department.Update( True, False ) = 1 THEN
					dw_facility.ResetUpdate()
					dw_Roles.ResetUpdate()
					dw_views.ResetUpdate()
					dwchild.ResetUpdate()
					dw_department.ResetUpdate()					
					COMMIT USING SQLCA;
				ELSE
					ROLLBACK USING SQLCA;
					RETURN -1				
				END IF
			ELSE
				ROLLBACK USING SQLCA;
				RETURN -1
			END IF
		ELSE
			ROLLBACK USING SQLCA;
			RETURN -1
		END IF
	ELSE
		ROLLBACK USING SQLCA;	
		RETURN -1
	END IF
ELSE
	ROLLBACK USING SQLCA;	
	RETURN -1	
END IF
SQLCA.AutoCommit = TRUE
*/

//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 2009-05-12 By: Ken.Guo
//$<reason> Delete useless DW
/*
int li_updateflag = 1
li_updateflag = gnv_appeondb.of_update( dwchild, dw_facility, dw_Roles)
if li_updateflag < 0 then
	ROLLBACK USING SQLCA;
	RETURN -1
end if
li_updateflag = gnv_appeondb.of_update( dw_views, dw_department)
if li_updateflag < 0 then
	ROLLBACK USING SQLCA;
	RETURN -1
else
	dw_facility.ResetUpdate()
	dw_Roles.ResetUpdate()
	dw_views.ResetUpdate()
	dwchild.ResetUpdate()
	dw_department.ResetUpdate()	
	COMMIT USING SQLCA;
end if
*/

/*
int li_updateflag = 1
li_updateflag = gnv_appeondb.of_update( dwchild, dw_Roles)
gnv_appeondb.of_update
if li_updateflag < 0 then
	ROLLBACK USING SQLCA;
	RETURN -1
else
	dw_Roles.ResetUpdate()
	dwchild.ResetUpdate()
	COMMIT USING SQLCA;
end if
*/

//Moidfy by jervis 09.22.2009
if dw_roles.update(true,false ) = 1 then 
	dw_roles.resetUpdate( )
	commit;
else
	rollback;
	return -1
end if
	

//---------------------------- APPEON END ----------------------------

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-11
//$<modify> 02.17.2006 By: owen chen
//$<reason> Performance tuning
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

/*
dw_facility.Retrieve( is_user_id )
IF dw_facility.RowCount() > 0 THEN
	dw_Roles.InsertRow( 0 )
END IF
dw_views.Retrieve( is_user_id )
dw_select_user.SetItem( 1, "user_id", is_user_id )
dw_Roles.Retrieve( is_user_id )

IF dw_department.Visible THEN
	dw_department.Retrieve( is_user_id )
END IF
*/

/*   //Commented By Ken.Guo 2009-05-12. Replace with itemchange event to retrieve data.
gnv_appeondb.of_startqueue( )
dw_Roles.Retrieve( is_user_id )
dw_facility.Retrieve( is_user_id )   
dw_views.Retrieve( is_user_id )  
IF dw_department.Visible THEN
	dw_department.Retrieve( is_user_id )
END IF
gnv_appeondb.of_commitqueue( )
*/

//BEGIN---Modify by Scofield on 2009-05-14

SELECT Count(*) INTO :ll_CurUserCnts FROM security_users WHERE user_id <> :is_user_id and readonly = 0;
SELECT MaxFullUserCnt INTO :ll_MaxCnts FROM icred_settings;

if IsNull(ll_CurUserCnts) then ll_CurUserCnts = 0
if IsNull(ll_MaxCnts) then ll_MaxCnts = 0

if ll_MaxCnts > 0 and ll_CurUserCnts >= ll_MaxCnts then
	UPDATE security_users SET ReadOnly = 1 WHERE user_id = :is_user_id;
end if

//END---Modify by Scofield on 2009-05-14

//Added By Jay Chen 09-06-2014
insert into personal_license_setting(user_id,esign_type) values(:is_user_id,'sertifi');
insert into personal_license_setting(user_id,esign_type) values(:is_user_id,'echosign');
insert into personal_license_setting(user_id,esign_type) values(:is_user_id,'docusign');
//end 

dw_select_user.SetItem( 1, "user_id", is_user_id )
dw_select_user.event itemchanged( 1, dw_select_user.object.user_id, is_user_id)   //Added By Ken.Guo 2009-05-12
//---------------------------- APPEON END ----------------------------

Return 1

end function

public function integer of_delete ();DataWindowChild dwchild

Integer li_ans
//comment 08/01/2007 by: Andy
//Long ll_cnt 
String ls_sql
//<add> 08/01/2007 by: Andy
String ls_first_name,ls_last_name
//end of add

if upper( is_user_id) = "MASTER" then  //Start Code Change ----05.20.2008 #V8 maha - added trap for master user
	 MessageBox("Delete", "User MASTER cannot be deleted as it is used for support purposes." )
	 RETURN -1
end if

li_ans = MessageBox("Delete", "Are you sure you want to delete this User " + Upper( is_user_id ) + "?", Question!, YesNo!, 2 )
IF li_ans = 2 THEN
	RETURN -1
END IF

/*comment 08/01/2007 by: Andy
//Reason:Instead these codes with the below code.
//---------Begin Added by Alfee 06.12.2007-----------------------------------
Select count(*) Into :ll_cnt From ctx_contacts Where user_d = :is_user_id ;
If ll_cnt > 0 Then
	MessageBox("Delete","This user id has been used a contact in contracts, and can't be deleted!")
	Return -1
End If
//----------End Added --------------------------------------------------------
*/

//add 08/01/2007 by: Andy
Select TOP 1 ISNULL(first_name,''),ISNULL(last_name,'') Into :ls_first_name,:ls_last_name From ctx_contacts Where user_d = :is_user_id ;
If SQLCA.sqlcode = 0 Then
	MessageBox("Delete","This user id is linked to " + ls_first_name + " " + ls_last_name +  "'s Contact record and can't be deleted.")
	Return -1
End If
//end of add

dw_department.Reset( )
dw_department.SetTransObject( SQLCA )

dw_facility.Reset()
dw_facility.SetTransObject( SQLCA )

dw_roles.Reset()
dw_roles.SetTransObject( SQLCA )

dw_views.Reset()
dw_views.SetTransObject( SQLCA )

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-12
//$<modify> 02.17.2006 By: owen chen
//$<reason> Performance tuning
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

/*
DELETE FROM security_user_department
WHERE security_user_department.user_id = :is_user_id   ;
IF SQLCA.SQLCODE = -1 THEN
	MessageBox("Delete Error", SQLCA.SQLERRTEXT )
	RETURN -1
END IF

DELETE FROM security_user_facilities  
WHERE security_user_facilities.user_id = :is_user_id   ;
IF SQLCA.SQLCODE = -1 THEN
	MessageBox("Delete Error", SQLCA.SQLERRTEXT )
	RETURN -1
END IF

DELETE FROM security_user_roles
WHERE security_user_roles.user_id = :is_user_id   ;
IF SQLCA.SQLCODE = -1 THEN
	MessageBox("Delete Error", SQLCA.SQLERRTEXT )
	RETURN -1
END IF

DELETE FROM security_user_views
WHERE security_user_views.user_id = :is_user_id   ;
IF SQLCA.SQLCODE = -1 THEN
	MessageBox("Delete Error", SQLCA.SQLERRTEXT )
	RETURN -1
END IF

DELETE FROM security_users
WHERE security_users.user_id = :is_user_id   ;
IF SQLCA.SQLCODE = -1 THEN
	MessageBox("Delete Error", SQLCA.SQLERRTEXT )
	RETURN -1
END IF

COMMIT USING SQLCA;
*/
gnv_appeondb.of_startqueue( )

DELETE FROM security_user_department
WHERE security_user_department.user_id = :is_user_id   ;

DELETE FROM security_user_facilities  
WHERE security_user_facilities.user_id = :is_user_id   ;

DELETE FROM security_user_roles
WHERE security_user_roles.user_id = :is_user_id   ;

DELETE FROM security_user_views
WHERE security_user_views.user_id = :is_user_id   ;

DELETE FROM security_users
WHERE security_users.user_id = :is_user_id   ;

DELETE FROM em_smtp_accounts
WHERE em_smtp_accounts.user_id = :is_user_id; //Add by Evan 09/17/2008

DELETE FROM security_group_users
WHERE security_group_users.user_id = :is_user_id;   //Added By Ken.Guo 2009-05-12

DELETE FROM personal_license_setting //Added By Jay Chen 09-06-2014
WHERE user_id = :is_user_id   ;

//Added By Ken.Guo 2017-03-13task 721
DELETE FROM idp_users
WHERE map_user_id = :is_user_id   ;


gnv_appeondb.of_commitqueue( )

IF SQLCA.SQLCODE = -1 THEN
	MessageBox("Delete Error", SQLCA.SQLERRTEXT )
	RETURN -1
END IF

//---------------------------- APPEON END ----------------------------

dw_select_user.GetChild( "user_id", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve()
dw_select_user.Reset()
dw_select_User.InsertRow( 0 )

if upper(is_user_id) <> "DBA" then //Start Code Change ---- 05.17.2007 #V7 maha added trap for DBA
	ls_sql = "revoke connect from " + is_user_id  + ";"
end if

If dwchild.RowCount() > 0 Then
	dw_select_user.SetItem(1,'user_id',dwchild.GetItemString(1,'user_id'))   //Added By Ken.Guo 2009-05-12
	dw_select_user.event itemchanged( 1, dw_select_user.object.user_id, dwchild.GetItemString(1,'user_id'))   //Added By Ken.Guo 2009-05-12
End If


RETURN 1



end function

public function integer of_set_parent_window (w_security_user_painter aw_win);iw_win = aw_win
//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 01.19.2009 By: Ken.Guo
//$<reason> 
/*
//Commented by Ken.Guo on 2009-01-15
//IF ii_dept_secure_setting = 1 THEN	
IF ii_dept_secure_setting = 1 and not gb_contract_version  THEN //08.10.2007 By Jervis
	//iw_win.Width = 3232 // Delete by Evan 01.31.2008
	iw_win.Width = 3260 // Add by Evan 01.31.2008
END IF
IF gb_contract_version THEN
	//iw_win.height =  996  //Start Code Change ----11.29.2008 #V8 maha changed from 900
	//iw_win.height = 830 // Add by Evan 01.31.2008
	iw_win.height = 962 // Add by Ken 08.26.2008
END IF
*/
If gnv_data.of_getitem( 'icred_settings', 'group_access', False) = '1' Then
	iw_win.height = This.Height + 134
Else
	iw_win.height = gb_1.y + gb_1.height + 134
End If
//---------------------------- APPEON END ----------------------------

//Begin - Added By Mark Lee 11/12/2012
If dw_select_user.rowcount( ) > 0 then
	dw_select_user.SetItem( 1, "user_id", gs_user_id )
	dw_select_user.event itemchanged( 1, dw_select_user.object.user_id, gs_user_id) 
End If
//End - Added By Mark Lee 11/12/2012


Return 1
end function

public function integer of_copy_user ();//--------------------------- APPEON BEGIN ---------------------------
//$<modified> 2007-05-24 By: Wu ZhiJun
//$<reason> Fix a bug
Integer	li_Rtn,i
long		ll_Cycle,ll_Count,ll_Row,ll_FindRow
long		ll_MaxFac,ll_MaxView,ll_MaxDep
String	ls_UserId
Long ll_group_org[]   //Added By Ken.Guo 2009-05-12
DataStore lds_user_group_new //Added By Ken.Guo 2009-05-12
DataWindowChild dwchild

ll_Row = dw_Select_User.GetRow()
ls_UserId = dw_Select_User.GetItemString(ll_Row,'user_id')
if IsNull(ls_UserId) or Trim(ls_UserId) = '' then
	MessageBox(gnv_app.iapp_object.DisplayName,'Please select an user first!')
	Return -1
end if

if cb_save.TriggerEvent(Clicked!) < 0 then return -1

//Added By Ken.Guo 2009-05-12
For i = 1 To dw_group_list.RowCount()
	If dw_group_list.GetItemNumber(i,'Selected') = 1 Then
		ll_group_org[UpperBound(ll_group_org[]) + 1] = dw_group_list.GetItemNumber(i,'ID')	
	End If
Next


Open(w_get_user_id_v5 )

if Message.StringParm = "Cancel" then
	Return 0
else
	is_user_id = Message.StringParm
end if

if len(is_user_id) < 1 then return -1

//Modify by jervis 09.22.2009
/*
ll_Row = dw_roles.GetRow()
dw_roles.SetItem(ll_Row,'user_id',is_user_id)
dw_roles.SetItem(ll_Row,'email_id',"")
dw_roles.SetItemStatus(ll_Row,0,Primary!,NewModified!)
*/
//delete 'security_users.user_name = security_users_1.user_name, ' - jervis 01.18.2011

//Modified by harry 20170412 Web requester project -merge (add  security_users.submission_approver = security_users_1.submission_approver)
update security_users
set security_users.role_id = security_users_1.role_id,   
         security_users.email_id =  '',   
         security_users.default_search_facility = security_users_1.default_search_facility,   
         security_users.default_view = security_users_1.default_view,   
         security_users.audit_type = security_users_1.audit_type,   
         security_users.wv_role_id = security_users_1.wv_role_id,   
         security_users.contract_default_view = security_users_1.contract_default_view,   
         security_users.image_flag = security_users_1.image_flag,   
         security_users.prac_id = security_users_1.prac_id,   
         security_users.npdb_user_id = security_users_1.npdb_user_id,   
         security_users.set_tdl =security_users_1.set_tdl,   
         security_users.set_task = security_users_1.set_task,   
         security_users.set_go_on_open = security_users_1.set_go_on_open,   
         security_users.npdb_password = security_users_1.npdb_password,   
         security_users.readonly = security_users_1.readonly,   
         security_users.set_dashboard = security_users_1.set_dashboard,   
         security_users.default_dashboard_id = security_users_1.default_dashboard_id,   
         security_users.dynamic_search_tab   =security_users_1.dynamic_search_tab,
	  	security_users.AutoExport	=security_users_1.AutoExport,   
         security_users.run_date_alarm =security_users_1.run_date_alarm,   
         security_users.refresh_sertifi =security_users_1.refresh_sertifi,   
         security_users.refresh_sertifi_dm=security_users_1.refresh_sertifi_dm,   
         security_users.check_email =security_users_1.check_email,   
         security_users.disabled_status =security_users_1.disabled_status,   
         security_users.email_account_day =security_users_1.email_account_day,   
         security_users.email_account_date  =security_users_1.email_account_date,
	     security_users.submission_approver = security_users_1.submission_approver
    FROM (select * from security_users where user_id = :ls_userid)  security_users_1
   WHERE security_users.user_id = :is_user_id ;



//Added By Ken.Guo 2009-05-12
lds_user_group_new = Create DataStore
lds_user_group_new.DataObject = 'd_security_group_users'
lds_user_group_new.SetTransObject(SQLCA)
For i = 1 To UpperBound(ll_group_org[])
	ll_Row = lds_user_group_new.InsertRow(0)
	lds_user_group_new.SetItem(ll_row,'user_id',is_user_id)
	lds_user_group_new.SetItem(ll_row,'group_id',ll_group_org[i])	
Next

/*   //Commented By Ken.Guo 2009-05-12
ll_Count = dw_facility.RowCount()
ll_MaxFac = gnv_app.of_get_id("user_facility_id" ,ll_Count) - 1
for ll_Cycle = 1 to ll_Count
	dw_facility.SetItem(ll_Cycle, "user_facility_id", ll_MaxFac + ll_Cycle)
	dw_facility.SetItem(ll_Cycle, "user_id", is_user_id )
	dw_facility.SetItemStatus(ll_Cycle,0,Primary!,NewModified!)
next

ll_Count = dw_department.RowCount()
Select Max(user_depart_id)
  into :ll_MaxDep
  from security_user_department ;
for ll_Cycle = 1 to ll_Count
	dw_department.SetItem(ll_Cycle, "user_depart_id", ll_MaxDep + ll_Cycle)
	dw_department.SetItem(ll_Cycle, "user_id", is_user_id )
	dw_department.SetItemStatus(ll_Cycle,0,Primary!,NewModified!)
next

ll_Count = dw_views.RowCount()
ll_MaxView = gnv_app.of_get_id("user_view_id" ,ll_Count) - 1
for ll_Cycle = 1 to ll_Count
	dw_views.SetItem(ll_Cycle, "user_view_id", ll_MaxView + ll_Cycle )
	dw_views.SetItem(ll_Cycle, "user_id", is_user_id )
	dw_views.SetItemStatus(ll_Cycle,0,Primary!,NewModified!)
next
*/

//if dw_roles.Update() < 1 then
//	MessageBox('Copy the role failed',SQLCA.SQLErrText,StopSign!)
//	ROLLBACK USING SQLCA;
//	return -1
//end if

dw_select_user.GetChild("user_id", dwchild)
dwchild.SetTransObject(SQLCA)
ll_Count = dwchild.Retrieve()
//Comment by jervis 09.22.2009
/*
ll_FindRow = dwchild.Find("user_id='" + is_user_id + "'",1,ll_Count)
if ll_FindRow > 0 then
	dwchild.SetItem(ll_FindRow, "user_password", "123")
	dwchild.SetItem(ll_FindRow, "contract_default_view", 1001 )
end if

if dwchild.Update() < 1 then
	MessageBox('Copy user failed',SQLCA.SQLErrText,StopSign!)
	ROLLBACK USING SQLCA;
	return -1
end if
*/

//Added By Ken.Guo 2009-05-12
If lds_user_group_new.Update() < 1 Then
	Destroy lds_user_group_new
	ROLLBACK USING SQLCA;
	return -1
End If


/*   //Commented By Ken.Guo 2009-05-12
if dw_facility.Update() < 1 then
	MessageBox('Copy user failed',SQLCA.SQLErrText,StopSign!)
	ROLLBACK USING SQLCA;
	return -1
end if

if dw_department.Update() < 1 then
	MessageBox('Copy user failed',SQLCA.SQLErrText,StopSign!)
	ROLLBACK USING SQLCA;
	return -1
end if

if dw_views.Update() < 1 then
	MessageBox('Copy user failed',SQLCA.SQLErrText,StopSign!)
	ROLLBACK USING SQLCA;
	return -1
end if
*/
COMMIT USING SQLCA;

/*   //Commented By Ken.Guo 2009-05-12.Replace with itemchange event to retrieve data.
dw_roles.Retrieve(is_user_id)
dw_facility.Retrieve(is_user_id)
dw_department.Retrieve(is_user_id)
dw_views.Retrieve(is_user_id)
*/

//Added By Jay Chen 09-06-2014
insert into personal_license_setting(user_id,esign_type) values(:is_user_id,'sertifi');
insert into personal_license_setting(user_id,esign_type) values(:is_user_id,'echosign');
insert into personal_license_setting(user_id,esign_type) values(:is_user_id,'docusign');
//end 

dw_select_user.SetItem(1, "user_id", is_user_id )
dw_select_user.event itemchanged( 1, dw_select_user.object.user_id, is_user_id)   //Added By Ken.Guo 2009-05-12
If Isvalid(lds_user_group_new) Then Destroy lds_user_group_new  //Added By Ken.Guo 2009-05-12

Return 1
//--------------------------- APPEON END -----------------------------
end function

public function boolean of_isexceedmaxuserscnt ();//====================================================================
// Function: of_IsExceedMaxUsersCnt()
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  boolean
//--------------------------------------------------------------------
// Author:	Scofield		Date: 2009-05-12
//--------------------------------------------------------------------
//	Copyright (c) 1999-2009 Contractlogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

long	ll_CurFullCnts,ll_CurReadOnlyCnts,ll_MaxFullCnts,ll_MaxReadOnlyCnts

SELECT Count(*) INTO :ll_CurFullCnts FROM security_users WHERE readonly = 0;
SELECT MaxFullUserCnt INTO :ll_MaxFullCnts FROM icred_settings;
if IsNull(ll_CurFullCnts) then ll_CurFullCnts = 0
if IsNull(ll_MaxFullCnts) then ll_MaxFullCnts = 0

SELECT Count(*) INTO :ll_CurReadOnlyCnts FROM security_users WHERE readonly = 1;
SELECT MaxReadOnlyUserCnt INTO :ll_MaxReadOnlyCnts FROM icred_settings;
if IsNull(ll_CurReadOnlyCnts) then ll_CurReadOnlyCnts = 0
if IsNull(ll_MaxReadOnlyCnts) then ll_MaxReadOnlyCnts = 0

if (ll_MaxFullCnts > 0 and ll_CurFullCnts >= ll_MaxFullCnts) and (ll_MaxReadOnlyCnts > 0 and ll_CurReadOnlyCnts >= ll_MaxReadOnlyCnts) then
	MessageBox(gnv_app.iapp_object.DisplayName,"Your record limit for the number of full users and the number of read-only users has been reached.  ~r~n~r~nCall Contract Logix sales at 866-371-4445 to purchase an upgrade.")
	Return true
end if

Return false

end function

public function boolean of_isexceedmaxuserscnt (string as_user_id, long al_readonly);//====================================================================
// Function: of_IsExceedMaxUsersCnt()
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value    string    as_user_id
// 	value    long      al_ReadOnly
//--------------------------------------------------------------------
// Returns:  boolean
//--------------------------------------------------------------------
// Author:	Scofield		Date: 2009-05-14
//--------------------------------------------------------------------
//	Copyright (c) 1999-2009 Contractlogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

long		ll_CurUserCnts,ll_MaxCnts
String	ls_UserFlag

SELECT Count(*) INTO :ll_CurUserCnts FROM security_users WHERE user_id <> :as_user_id and readonly = :al_ReadOnly;

if al_ReadOnly = 1 then
	ls_UserFlag = "read-only"
	SELECT MaxReadOnlyUserCnt INTO :ll_MaxCnts FROM icred_settings;
else
	ls_UserFlag = "full"
	SELECT MaxFullUserCnt INTO :ll_MaxCnts FROM icred_settings;
end if

if IsNull(ll_CurUserCnts) then ll_CurUserCnts = 0
if IsNull(ll_MaxCnts) then ll_MaxCnts = 0

if (ll_MaxCnts > 0 and ll_CurUserCnts >= ll_MaxCnts) then
	MessageBox(gnv_app.iapp_object.DisplayName,"Your record limit for the number of " + ls_UserFlag + " users has been reached.  ~r~n~r~nCall Contract Logix sales at 866-371-4445 to purchase an upgrade.")
	Return true
end if

Return false

end function

public function integer of_check_date_alarm_user ();Long li_cnt

Select Count(1) into :li_cnt From security_users Where run_date_alarm = 1 and user_id <> :gs_user_id ;

If li_cnt = 0 or isnull(li_cnt) Then
	Messagebox('Warning','The Email Notification will not be triggered if the Run Data Email Alarm on Login option has not be checked by any users.')
	Return -1
	 
End If

Return 1
end function

on pfc_cst_u_security_user_painter.create
this.cb_ad=create cb_ad
this.cb_5=create cb_5
this.cb_requester=create cb_requester
this.cb_4=create cb_4
this.dw_group_users=create dw_group_users
this.dw_group_list=create dw_group_list
this.cb_batchaddgroup=create cb_batchaddgroup
this.cb_select=create cb_select
this.cb_group=create cb_group
this.st_group_user=create st_group_user
this.st_group_select=create st_group_select
this.st_2=create st_2
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_departments=create dw_departments
this.cb_sad=create cb_sad
this.st_view=create st_view
this.dw_department=create dw_department
this.cb_sav=create cb_sav
this.cb_saf=create cb_saf
this.dw_facility=create dw_facility
this.cb_save=create cb_save
this.cb_delete=create cb_delete
this.dw_select_user=create dw_select_user
this.cb_new=create cb_new
this.dw_views=create dw_views
this.st_1=create st_1
this.st_department=create st_department
this.cb_close=create cb_close
this.cb_print=create cb_print
this.gb_select=create gb_select
this.gb_main=create gb_main
this.gb_1=create gb_1
this.dw_roles=create dw_roles
this.gb_2=create gb_2
this.Control[]={this.cb_ad,&
this.cb_5,&
this.cb_requester,&
this.cb_4,&
this.dw_group_users,&
this.dw_group_list,&
this.cb_batchaddgroup,&
this.cb_select,&
this.cb_group,&
this.st_group_user,&
this.st_group_select,&
this.st_2,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.dw_departments,&
this.cb_sad,&
this.st_view,&
this.dw_department,&
this.cb_sav,&
this.cb_saf,&
this.dw_facility,&
this.cb_save,&
this.cb_delete,&
this.dw_select_user,&
this.cb_new,&
this.dw_views,&
this.st_1,&
this.st_department,&
this.cb_close,&
this.cb_print,&
this.gb_select,&
this.gb_main,&
this.gb_1,&
this.dw_roles,&
this.gb_2}
end on

on pfc_cst_u_security_user_painter.destroy
destroy(this.cb_ad)
destroy(this.cb_5)
destroy(this.cb_requester)
destroy(this.cb_4)
destroy(this.dw_group_users)
destroy(this.dw_group_list)
destroy(this.cb_batchaddgroup)
destroy(this.cb_select)
destroy(this.cb_group)
destroy(this.st_group_user)
destroy(this.st_group_select)
destroy(this.st_2)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_departments)
destroy(this.cb_sad)
destroy(this.st_view)
destroy(this.dw_department)
destroy(this.cb_sav)
destroy(this.cb_saf)
destroy(this.dw_facility)
destroy(this.cb_save)
destroy(this.cb_delete)
destroy(this.dw_select_user)
destroy(this.cb_new)
destroy(this.dw_views)
destroy(this.st_1)
destroy(this.st_department)
destroy(this.cb_close)
destroy(this.cb_print)
destroy(this.gb_select)
destroy(this.gb_main)
destroy(this.gb_1)
destroy(this.dw_roles)
destroy(this.gb_2)
end on

event constructor;
//--------------------------- APPEON BEGIN ---------------------------
//$<add> 11.19.2008 By: Ken.Guo
//$<reason> 
If gnv_data.of_GetItem( "icred_settings", "set_dashb", False ) = '0' Then
	dw_roles.Modify( "default_dashboard_id.visible=0 t_16.visible=0" )
	dw_roles.Modify( "set_dashboard.visible=0 t_15.visible=0" )	
End If
//---------------------------- APPEON END ----------------------------

IF appeongetclienttype() = 'PB' THEN
	dw_roles.Modify("image_flag.Visible = 0") 
END IF

//--------------------------- APPEON BEGIN ---------------------------
//$< Add  > 2009-03-24 By: Scofield
//$<Reason> Adjust the user painter interface.

if gnv_data.of_GetItem( "icred_settings", "set_59", false ) = '1' then
	cb_close.X = cb_save.X
	cb_save.X = cb_3.X
	cb_3.Visible = false
	dw_roles.Modify("image_flag.Visible = 0 t_7.Visible = 0 contract_default_view.Visible = 0 dynamic_search_tab.Visible = 0 t_13.Visible = 0 set_tdl.Visible = 0 t_16.Visible = 0 default_dashboard_id.Visible = 0 t_15.Visible = 0 set_dashboard.Visible = 0 autoexport.visible = 0 autoexport_t.visible = 0")
end if
//---------------------------- APPEON END ----------------------------

end event

event destructor;//Destroy ids_facility //Aded by Alfee 06.11.2007 //Commented By Ken.Guo 2009-05-12
end event

type cb_ad from commandbutton within pfc_cst_u_security_user_painter
integer x = 2894
integer y = 64
integer width = 311
integer height = 84
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "AD User"
end type

event clicked;//====================================================================
// Event: clicked
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:         Ken.Guo 2016-06-15
//--------------------------------------------------------------------
//Copyright (c) 2008-2015 Contract Logix, Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


string ls_user_id
If Dw_roles.RowCount() > 0 Then
	ls_user_id = Dw_roles.GetItemString(1,'user_id')
End If
OpenWithParm(w_security_ad_user,ls_user_id)
end event

type cb_5 from commandbutton within pfc_cst_u_security_user_painter
integer x = 3200
integer y = 64
integer width = 507
integer height = 84
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&E-Signature License"
end type

event clicked;string ls_Message

ls_Message = dw_select_user.object.user_id[1]
if IsNull(ls_Message) then ls_Message = ""

OpenWithParm(w_security_license_user,ls_Message)
end event

type cb_requester from commandbutton within pfc_cst_u_security_user_painter
integer x = 1463
integer y = 64
integer width = 466
integer height = 84
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Requester Account"
end type

event clicked;string ls_Message

ls_Message = dw_select_user.object.user_id[1]
if IsNull(ls_Message) then ls_Message = ""
ls_Message = "ALL|" + ls_Message

OpenWithParm(w_requester_account_edit,ls_Message) 
end event

type cb_4 from commandbutton within pfc_cst_u_security_user_painter
integer x = 2610
integer y = 64
integer width = 288
integer height = 84
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&SAML"
end type

event clicked;//Button added to replace on on dw object
string ls_Message

ls_Message = dw_select_user.object.user_id[1]
if IsNull(ls_Message) then ls_Message = ""
ls_Message = "ALL|" + ls_Message

OpenWithParm(w_saml_config_setting,ls_Message)
end event

type dw_group_users from u_dw within pfc_cst_u_security_user_painter
integer x = 1065
integer y = 984
integer width = 969
integer height = 736
integer taborder = 100
string dataobject = "d_group_users"
end type

event constructor;call super::constructor;This.of_SetUpdateAble( True )
This.of_SetTransObject( SQLCA )
This.of_setrowselect( True)
end event

event rowfocuschanged;call super::rowfocuschanged;This.SelectRow(0,False)
This.SelectRow(CurrentRow,True)
end event

type dw_group_list from u_dw within pfc_cst_u_security_user_painter
event ue_retrieve_group_users ( long al_row )
event type integer ue_save ( )
integer x = 55
integer y = 984
integer width = 969
integer height = 736
integer taborder = 90
string dataobject = "d_group_select"
end type

event ue_retrieve_group_users(long al_row);//////////////////////////////////////////////////////////////////////
// $<event>dw_group_list::ue_retrieve_group_users()
// $<arguments>
//		value	long	al_row		
// $<returns> 
// $<description>
// $<description>
//////////////////////////////////////////////////////////////////////
// $<add> 01.19.2009 by Ken.Guo
//////////////////////////////////////////////////////////////////////

long ll_group_id
String ls_group_name

If al_row > 0 Then
	This.SetRow(al_row)
	This.SelectRow(0,False)
	This.SelectRow(al_row,True)
	ll_group_id = This.GetItemNumber(al_row,'id')
	ls_group_name = This.GetItemString(al_row,'Group_name')
	dw_group_users.Retrieve(ll_group_id,is_user_id)
	st_group_user.text = 'Other User(s) in '+ls_group_name+':'
Else
	dw_group_users.Reset()
	st_group_user.text = 'Other User(s) in the group:'
End If
end event

event type integer ue_save();//////////////////////////////////////////////////////////////////////
// $<event>dw_group_list::ue_save()
// $<arguments>(None)
// $<returns> integer
// $<description>
// $<description>
//////////////////////////////////////////////////////////////////////
// $<add> 01.20.2009 by Ken.Guo
//////////////////////////////////////////////////////////////////////

Long ll_cnt,i,ll_find_row,ll_row
Integer li_selected,ll_ret
Long ll_group_id

If This.ModifiedCount() <= 0 Then Return 1

DataStore lds_user_groups
lds_user_groups = Create DataStore
lds_user_groups.DataObject = 'd_security_user_groups'
lds_user_groups.SetTransObject(SQLCA)
lds_user_groups.Retrieve(is_user_id)

//Add or Delete data.
ll_cnt = dw_group_list.rowcount()
For i = 1 To ll_cnt
	If dw_group_list.GetItemStatus(i,0,Primary!) = DataModified! Then
		li_selected = dw_group_list.GetItemNumber(i,'Selected')	
		ll_group_id = dw_group_list.GetItemNumber(i,'id')
		ll_find_row = lds_user_groups.Find('group_id = '+String(ll_group_id),1,lds_user_groups.RowCount())			
		If li_selected = 0 Then
			//Delete Row
			If ll_find_row > 0 Then 
				lds_user_groups.DeleteRow(ll_find_row)
			End If
		Else
			//Add Row
			If ll_find_row = 0 Then
				ll_row = lds_user_groups.InsertRow(0)
				lds_user_groups.SetItem(ll_row,'group_id',ll_group_id)
				lds_user_groups.SetItem(ll_row,'user_id',is_user_id)
			End If
		End If
	End If
Next


//Update data
If lds_user_groups.ModifiedCount() + lds_user_groups.DeletedCount() > 0 Then
	gnv_appeondb.of_autocommitrollback()
	If lds_user_groups.Update() = 1 Then
		Commit;
		dw_group_list.ResetUpdate ( ) //Refresh Row/Column status
		ll_ret = 1
	Else
		Rollback;
		Messagebox('Save Group','Failed to save data, please call support.')
		ll_ret = -1	
		lds_user_groups.Retrieve(is_user_id) //Refresh data.
	End If
End If

Return ll_ret

end event

event constructor;call super::constructor;This.of_SetUpdateAble( False )
This.of_SetTransObject( SQLCA )
This.of_setrowselect( True)
end event

event rowfocuschanged;call super::rowfocuschanged;//////////////////////////////////////////////////////////////////////
// $<event>dw_group_list::rowfocuschanged()
// $<arguments>
//		value	long	currentrow		
// $<returns> long
// $<description>
// $<description>
//////////////////////////////////////////////////////////////////////
// $<add> 01.19.2009 by Ken.Guo
//////////////////////////////////////////////////////////////////////

Event ue_retrieve_group_users(currentrow)
end event

event retrieveend;call super::retrieveend;//////////////////////////////////////////////////////////////////////
// $<event>dw_group_list::retrieveend()
// $<arguments>
//		value	long	rowcount		
// $<returns> long
// $<description>
// $<description>
//////////////////////////////////////////////////////////////////////
// $<add> 01.19.2009 by Ken.Guo
//////////////////////////////////////////////////////////////////////

If This.RowCount() > 0 Then
	Event ue_retrieve_group_users(1)
Else
	Event ue_retrieve_group_users(0)
End If
end event

type cb_batchaddgroup from commandbutton within pfc_cst_u_security_user_painter
integer x = 827
integer y = 1736
integer width = 1033
integer height = 84
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Batch Add/Delete Groups to all Contracts..."
end type

event clicked;Open(w_batch_add_groups_to_contracts)
end event

type cb_select from commandbutton within pfc_cst_u_security_user_painter
integer x = 55
integer y = 1736
integer width = 366
integer height = 84
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Select &All"
end type

event clicked;Long ll_cnt,i
Integer li_select_value[],li_deselect_value[]
ll_cnt = dw_group_list.RowCount()
If ll_cnt = 0 Then Return 1

For i = 1 to ll_cnt
	li_select_value[i] = 1
	li_deselect_value[i] = 0
Next

If This.Text = 'Deselect &All' Then
	dw_group_list.object.selected[1,ll_cnt] = li_deselect_value[]
	This.Text = 'Select &All'
Else
	dw_group_list.object.selected[1,ll_cnt] = li_select_value[]
	This.Text = 'Deselect &All'
End If

end event

type cb_group from commandbutton within pfc_cst_u_security_user_painter
integer x = 439
integer y = 1736
integer width = 366
integer height = 84
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Group Painter"
end type

event clicked;Long ll_group_id,ll_find_row

If dw_group_list.Trigger Event ue_save() < 0 Then Return 

If dw_group_list.GetRow() > 0 Then
	ll_group_id = dw_group_list.GetItemNumber(dw_group_list.GetRow(),'id')
End If
OpenwithParm(w_group_painter,ll_group_id)

If Message.Doubleparm > 0 and is_user_id <> '' Then 
	dw_group_list.SetRedraw(False)
	dw_group_list.Retrieve(is_user_id)
	ll_find_row = dw_group_list.Find('id = '+String(ll_group_id),1,dw_group_list.RowCount()) 
	If ll_find_row > 0 Then
		dw_group_list.SetRow(ll_find_row)
		dw_group_list.ScrolltoRow(ll_find_row)
		dw_group_list.SelectRow(0,False)
		dw_group_list.SelectRow(ll_find_row,True)		
	End If
	dw_group_list.SetRedraw(True)	
End If
	
end event

type st_group_user from statictext within pfc_cst_u_security_user_painter
integer x = 1074
integer y = 916
integer width = 974
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 67108864
string text = "Other User(s) in the group"
boolean focusrectangle = false
end type

type st_group_select from statictext within pfc_cst_u_security_user_painter
integer x = 59
integer y = 916
integer width = 969
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 67108864
string text = "Add the user to following Group(s)"
boolean focusrectangle = false
end type

type st_2 from statictext within pfc_cst_u_security_user_painter
integer x = 2871
integer y = 200
integer width = 224
integer height = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "Options"
boolean focusrectangle = false
end type

type cb_3 from commandbutton within pfc_cst_u_security_user_painter
integer x = 2304
integer y = 64
integer width = 311
integer height = 84
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Auto-Login"
end type

event clicked;//Start Code Change ----11.21.2008 #V7 maha
//Button added to replace on on dw object
string ls_user_id
If Dw_roles.RowCount() > 0 Then
	ls_user_id = Dw_roles.GetItemString(1,'user_id')
End If
OpenWithParm(w_security_ldap_user,ls_user_id)
end event

type cb_2 from commandbutton within pfc_cst_u_security_user_painter
integer x = 1925
integer y = 64
integer width = 384
integer height = 84
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Email Properties"
end type

event clicked;string ls_Message

ls_Message = dw_select_user.object.user_id[1]
if IsNull(ls_Message) then ls_Message = ""
ls_Message = "ALL|" + ls_Message

////Start Code Change ----10.08.2008 #V85 maha
//if of_get_app_setting("set_56","I") = 1 then
//	OpenWithParm(w_email_account_edit_for_outlook, ls_Message)
//else
//	OpenWithParm(w_email_account_edit, ls_Message)
//end if
////End Code Change---10.08.2008
OpenWithParm(w_email_account_edit, ls_Message) //Modified By Ken.Guo 06/04/2013
end event

type cb_1 from u_cb within pfc_cst_u_security_user_painter
integer x = 1157
integer y = 64
integer width = 311
integer height = 84
integer taborder = 20
fontcharset fontcharset = ansi!
string text = "C&opy User"
end type

event clicked;call super::clicked;if of_IsExceedMaxUsersCnt() then Return

//--------------------------- APPEON BEGIN ---------------------------
//$<Modified> 2007-05-24 By: Wu ZhiJun
//$<reason> Fixed a bug

//Start Code Change ----01.04.2008 #V8 maha - trap added
if dw_roles.rowcount() < 1 then 
	messagebox("Copy User","Select a user to copy.")
	return
end if
//End Code Change---01.04.2008

if of_copy_user() = 1 then
	if Not cb_delete.Enabled then
		cb_delete.Enabled = true
	end if
end if
//--------------------------- APPEON END -----------------------------

end event

type dw_departments from datawindow within pfc_cst_u_security_user_painter
boolean visible = false
integer x = 2843
integer y = 3140
integer width = 270
integer height = 68
integer taborder = 30
string dataobject = "d_all_departments"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_sad from u_cb within pfc_cst_u_security_user_painter
boolean visible = false
integer x = 2469
integer y = 3068
integer width = 338
integer height = 84
integer taborder = 140
string text = "Select All"
end type

event clicked;call super::clicked;Integer 	i
Integer 	li_rc
Integer 	li_select_val
long		ll_Row
String	ls_UserID

//--------------------------- APPEON BEGIN ---------------------------
//$< Add  > 2008-09-27 By: Scofield
//$<Reason> Check the user_id if is valid.

ll_Row = dw_select_user.GetRow()
if ll_Row <= 0 or ll_Row > dw_select_user.RowCount() then Return

ls_UserID = dw_select_user.GetItemString(ll_Row,"user_id")
if IsNull(ls_UserID) or Trim(ls_UserID) = "" then Return

//---------------------------- APPEON END ----------------------------

IF cb_sad.Text = "Select All" THEN
	cb_sad.text = "Unselect All"
	li_select_val = 1
ELSE
	cb_sad.Text = "Select All" 
	li_select_val = 0	
END IF

li_rc = dw_department.RowCount()

FOR i = 1 TO li_rc
	dw_department.SetItem( i, "access_rights", li_select_val )
END FOR
end event

type st_view from statictext within pfc_cst_u_security_user_painter
boolean visible = false
integer x = 1129
integer y = 2212
integer width = 347
integer height = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "View Access"
boolean focusrectangle = false
end type

type dw_department from u_dw within pfc_cst_u_security_user_painter
boolean visible = false
integer x = 2126
integer y = 2280
integer width = 974
integer height = 764
integer taborder = 100
string dataobject = "d_security_user_department_access"
end type

event constructor;call super::constructor;This.of_SetTransObject( SQLCA )
end event

type cb_sav from u_cb within pfc_cst_u_security_user_painter
boolean visible = false
integer x = 1458
integer y = 3068
integer width = 338
integer height = 84
integer taborder = 150
string text = "Select All"
end type

event clicked;Integer 	li_select_val
long		ll_Cycle,ll_RowCnt,ll_Row,ll_DefView,ll_View
String	ls_Dispaly,ls_UserID

//--------------------------- APPEON BEGIN ---------------------------
//$< Add  > 2008-09-27 By: Scofield
//$<Reason> Check the user_id if is valid.

ll_Row = dw_select_user.GetRow()
if ll_Row <= 0 or ll_Row > dw_select_user.RowCount() then Return

ls_UserID = dw_select_user.GetItemString(ll_Row,"user_id")
if IsNull(ls_UserID) or Trim(ls_UserID) = "" then Return

//---------------------------- APPEON END ----------------------------

IF cb_sav.Text = "Select All" THEN
	cb_sav.text = "Unselect All"
	li_select_val = 1
ELSE
	cb_sav.Text = "Select All" 
	li_select_val = 0	
END IF

//--------------------------- APPEON BEGIN ---------------------------
//$<Modify> 2008-04-21 By: Scofield
//$<Reason> If current view is Practitioner Default View. Can't be cancel.

ll_Row = dw_Roles.GetRow()
ll_DefView = dw_Roles.GetItemNumber(ll_Row,'default_view')
ls_Dispaly = dw_Roles.Describe("Evaluate('LookUpDisplay(default_view)'," + String(ll_Row) + ")")
		
ll_RowCnt = dw_views.RowCount()
FOR ll_Cycle = 1 TO ll_RowCnt
	if li_select_val = 0 then
		ll_View = dw_views.GetItemNumber(ll_Cycle,'view_id')
		if ll_View = ll_DefView then
			MessageBox(gnv_app.iapp_object.DisplayName,ls_Dispaly + " is Practitioner Default View. Can't be cancel.")
		else
			dw_views.SetItem(ll_Cycle, "access_rights", li_select_val )
		end if
	else
		dw_views.SetItem(ll_Cycle, "access_rights", li_select_val )
	end if
next
//---------------------------- APPEON END ----------------------------

end event

type cb_saf from u_cb within pfc_cst_u_security_user_painter
boolean visible = false
integer x = 398
integer y = 3064
integer width = 338
integer height = 84
integer taborder = 130
string text = "Select All"
end type

event clicked;Integer 	li_select_val
long		ll_Cycle,ll_RowCnt,ll_Row,ll_DefFacility,ll_Facility
String	ls_Dispaly,ls_UserID

//--------------------------- APPEON BEGIN ---------------------------
//$< Add  > 2008-09-27 By: Scofield
//$<Reason> Check the user_id if is valid.

ll_Row = dw_select_user.GetRow()
if ll_Row <= 0 or ll_Row > dw_select_user.RowCount() then Return

ls_UserID = dw_select_user.GetItemString(ll_Row,"user_id")
if IsNull(ls_UserID) or Trim(ls_UserID) = "" then Return

//---------------------------- APPEON END ----------------------------

IF cb_saf.Text = "Select All" THEN
	cb_saf.text = "Unselect All"
	li_select_val = 1
ELSE
	cb_saf.Text = "Select All" 
	li_select_val = 0	
END IF

//--------------------------- APPEON BEGIN ---------------------------
//$<Modify> 2008-04-21 By: Scofield
//$<Reason> If current facility is Default Search Facility. Can't be cancel.

ll_Row = dw_Roles.GetRow()
ll_DefFacility = dw_Roles.GetItemNumber(ll_Row,'default_search_facility')
ls_Dispaly = dw_Roles.Describe("Evaluate('LookUpDisplay(default_search_facility)'," + String(ll_Row) + ")")

ll_RowCnt = dw_facility.RowCount()
FOR ll_Cycle = 1 TO ll_RowCnt
	if li_select_val = 0 then
		ll_Facility = dw_facility.GetItemNumber(ll_Cycle,'facility_id')
		if ll_Facility = ll_DefFacility then
			MessageBox(gnv_app.iapp_object.DisplayName,ls_Dispaly + " is Default Search Facility. Can't be cancel.")
		else
			dw_facility.SetItem(ll_Cycle, "access_rights", li_select_val )
		end if
	else
		dw_facility.SetItem(ll_Cycle, "access_rights", li_select_val )
	end if
next
//---------------------------- APPEON END ----------------------------

end event

type dw_facility from u_dw within pfc_cst_u_security_user_painter
boolean visible = false
integer x = 101
integer y = 2280
integer width = 983
integer height = 764
integer taborder = 90
string dataobject = "d_security_user_facility_access"
end type

event constructor;This.of_SetTransObject( SQLCA )
end event

event itemchanged;call super::itemchanged;//--------------------------- APPEON BEGIN ---------------------------
//$< Add  > 2008-04-18 By: Scofield
//$<Reason> This facility is Default Search Facility. Can't be cancel.

long	ll_FacilityID,ll_DefFacility,ll_Row

if dwo.name = 'access_rights' then
	if long(data) = 0 then
		ll_Row = dw_Roles.GetRow()
		ll_DefFacility = dw_Roles.GetItemNumber(ll_Row,'default_search_facility')
		ll_FacilityID = dw_facility.GetItemNumber(Row,'facility_id')

		if ll_FacilityID = ll_DefFacility then
			MessageBox(gnv_app.iapp_object.DisplayName,"This facility is Default Search Facility. Can't be cancel.")
			Return 2
		end if
	end if
end if
//---------------------------- APPEON END ----------------------------

end event

type cb_save from u_cb within pfc_cst_u_security_user_painter
integer x = 3703
integer y = 64
integer width = 311
integer height = 84
integer taborder = 160
string text = "&Save"
boolean default = true
end type

event clicked;//--------------------------- APPEON BEGIN ---------------------------
//$< Add  > 2008-01-04 By: Scofield
//$<Reason> if there is not any user,then Return.

long		ll_Row,ll_ReadOnly,ll_DynSearchTab
String	ls_UserId,ls_image_flag

dw_group_list.AcceptText()
ll_Row = dw_Roles.AcceptText()		//Added By Mark Lee 11/21/2014
if ll_Row < 0 then return -1		

ll_Row = dw_Select_User.GetRow()
ls_UserId = dw_Select_User.GetItemString(ll_Row,'user_id')
if IsNull(ls_UserId) or Trim(ls_UserId) = '' then Return -1

If isnull(dw_roles.GetItemNumber(1,'role_id')) or dw_roles.GetItemNumber(1,'role_id') = 0 Then
	Messagebox('Check User','Please select a Security Role.')
	dw_roles.SetColumn('role_id')
	dw_roles.SetFocus()
	Return -2
End If

//Added By Ken.Guo 2015-08-06. userid should not same as username	
Long ll_cnt
String ls_user_name,ls_use_name_login 
ls_use_name_login = gnv_data.of_getitem("icred_settings","use_name_login",false)
if isnull(ls_use_name_login) or ls_use_name_login = '' then ls_use_name_login = '0'
ls_user_name = dw_roles.GetItemString(1,'user_name')

dwItemStatus 			ldis_status

ldis_status = dw_roles.GetItemStatus(1, "user_name", Primary!)										//Added By Mark Lee 05/11/2016
if ls_use_name_login = '1' and (ldis_status =DataModified!	or ldis_status =NewModified! )  then //Added By Jay Chen 12-08-2015 for usbank: validate below when use name as login is enabled.
	If ls_user_name <> '' and not isnull(ls_user_name)  Then
		Select count(1)
		Into :ll_cnt
		From security_users
		Where  (Upper(user_name)  = Upper(:ls_user_name) or Upper(user_id)  = Upper(:ls_user_name)) and user_id <> :ls_UserId ;		
		If ll_cnt > 0 Then
			Messagebox('User~'s Fulll Name','Current User Name already exists. Please re-enter another one.')
			dw_roles.setfocus( )
			dw_roles.setcolumn( 'user_name')
			Return -3
		End If
	End If
end if


//---------------------------- APPEON END ----------------------------

//BEGIN---Modify by Scofield on 2009-05-14

ll_Row = dw_Roles.GetRow()
if ll_Row <= 0 or ll_Row > dw_Roles.RowCount() then Return -1

ll_ReadOnly = dw_Roles.GetItemNumber(ll_Row,'readonly')
if of_IsExceedMaxUsersCnt(ls_UserId,ll_ReadOnly) then Return -1

ll_DynSearchTab = dw_Roles.GetItemNumber(ll_Row,'dynamic_search_tab')
if IsNull(ll_DynSearchTab) then dw_Roles.SetItem(ll_Row,'dynamic_search_tab',0)

ls_image_flag = dw_Roles.Getitemstring(ll_Row,"image_flag")
IF IsNull(ls_image_flag) then dw_Roles.Setitem(ll_Row,"image_flag","0")

If dw_roles.GetItemNumber(ll_row,'run_date_alarm') = 0 Then
	of_check_date_alarm_user()
End If

//END---Modify by Scofield on 2009-05-14

Integer li_retval,li_retval1

li_retval = iw_win.Event pfc_save()
li_retval1 = dw_group_list.Trigger Event ue_save()  //Added by Ken.Guo on 2009-01-20
IF li_retval < 0 THEN
	Return -1
END IF
IF li_retval1 < 0 THEN
	Return -1
END IF


//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-13
//$<add> 04.21.2006 By: Cao YongWang
//$<reason> Performance tuning
//$<modification> Refresh the security_users data after updating.

SetNull(gnv_win_backcolor.il_win_backcolor) //Add by Evan 11/28/2008

gnv_appeondb.of_startqueue( )
gnv_data.of_retrieve( "security_users")
SELECT readonly Into :gi_user_readonly From security_users Where Upper(user_id) = :gs_user_id; //Added By Ken.Guo 09-10-2008
SELECT data_view.win_backcolor INTO :gnv_win_backcolor.il_win_backcolor
FROM  security_users, data_view
WHERE data_view.data_view_id = security_users.contract_default_view AND
		security_users.user_id = :gs_user_id;//Add by Evan 11/28/2008
gnv_appeondb.of_commitqueue( ) 
//---------------------------- APPEON END ----------------------------

//Added By Mark Lee 03/23/2015
if isvalid(w_custom_report) then
	w_custom_report.of_destory_ds()
	w_custom_report.of_get_filter_status() 
end if 

Return 1

end event

type cb_delete from u_cb within pfc_cst_u_security_user_painter
integer x = 850
integer y = 64
integer width = 311
integer height = 84
integer taborder = 40
string text = "&Delete User"
end type

event clicked;//--------------------------- APPEON BEGIN ---------------------------
//$<add> 04.27.2007 By: Frank.Gui
//$<reason> 
String	ls_UserId

ls_UserId = dw_select_user.GetItemString(dw_select_user.GetRow(),'user_id')

if IsNull(ls_UserId) or Trim(ls_UserId) = "" then
	MessageBox('Warning','Please select a user first!',Exclamation!)
	return
end if
//---------------------------- APPEON END ----------------------------

of_delete()
end event

type dw_select_user from u_dw within pfc_cst_u_security_user_painter
integer x = 55
integer y = 68
integer width = 475
integer height = 92
integer taborder = 10
string dataobject = "d_select_user_for_audit_trail"
boolean vscrollbar = false
boolean border = false
borderstyle borderstyle = stylebox!
end type

event constructor;This.of_SetUpdateAble( False )
This.of_SetTransObject( SQLCA )
This.InsertRow( 0 )




end event

event itemchanged;call super::itemchanged;Is_user_id = data

cb_delete.enabled = lower(data)<>'master'

//Added By chenjian 2013-09-11
if lower(data) = 'master' then
	dw_roles.modify("disabled_status.protect = '1' ")
else
	dw_roles.modify("disabled_status.protect = '0' ")
end if

datawindowchild dwchild
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-14
//$<modify> 02.06.2006 By: owen chen
//$<reason> performance tuning
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.


/*
dw_facility.Retrieve( Is_user_id )

dw_views.Retrieve( is_user_id )
dw_roles.Retrieve( is_user_id )
dw_department.Retrieve( is_user_id )
dw_roles.GetChild( "default_search_facility", dwchild )
dwchild.settransobject(sqlca)
dwchild.retrieve()
dwchild.insertrow(1)
dwchild.setitem(1,"facility_name","All")
dw_roles.GetChild( "default_view", dwchild )
dwchild.settransobject(sqlca)
dwchild.retrieve()
*/
dw_roles.GetChild( "default_search_facility", dwchild )
dwchild.settransobject(sqlca)

gnv_appeondb.of_startqueue( )

dw_facility.Retrieve( Is_user_id )

dw_views.Retrieve( is_user_id )
dw_roles.Retrieve( is_user_id )

//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 01.19.2009 By: Ken.Guo
//$<reason> Add group access
If is_user_id = '' or isnull(is_user_id) Then
	dw_group_list.Reset() 
	st_group_select.Text = 'Add the user to following Group(s):'	
Else
	dw_group_list.Retrieve(is_user_id) //Added by Ken.Guo on 2009-01-19
	st_group_select.Text = 'Add '+is_user_id+' to following Group(s):'	
End If
//---------------------------- APPEON END ----------------------------

dw_roles.enabled = true  //Start Code Change ----04.28.2008 #V8 maha
dw_department.Retrieve( is_user_id )
dwchild.retrieve()

gnv_appeondb.of_commitqueue( )

//---------------------------- APPEON END ----------------------------

dwchild.insertrow(1)
dwchild.setitem(1,"facility_name","All")
dw_roles.GetChild( "default_view", dwchild )
dwchild.settransobject(sqlca)
dwchild.retrieve()

dwchild.insertrow(1)

//--------------------------- APPEON BEGIN ---------------------------
//$<Modify> 2008-04-17 By: Scofield
//$<Reason> Change "None" to ""

//dwchild.setitem(1,"data_view_name","None")
dwchild.SetItem(1,"data_view_name","")
//---------------------------- APPEON END ----------------------------

dw_facility.AcceptText()
dw_views.AcceptText()
dw_roles.AcceptText()
end event

type cb_new from u_cb within pfc_cst_u_security_user_painter
integer x = 544
integer y = 64
integer width = 311
integer height = 84
integer taborder = 50
fontcharset fontcharset = ansi!
string text = "C&reate User"
end type

event clicked;if of_IsExceedMaxUsersCnt() then Return

of_create_user()
Parent.SetRedraw(true)

end event

type dw_views from u_dw within pfc_cst_u_security_user_painter
boolean visible = false
integer x = 1120
integer y = 2280
integer width = 974
integer height = 768
integer taborder = 80
string dataobject = "d_security_user_views_access"
end type

event constructor;This.of_SetTransObject( SQLCA )

end event

event itemchanged;call super::itemchanged;//--------------------------- APPEON BEGIN ---------------------------
//$< Add  > 2008-04-18 By: Scofield
//$<Reason> This view is Practitioner Default View. Can't be cancel.

long	ll_View,ll_DefView,ll_Row

if dwo.name = 'access_rights' then
	if long(data) = 0 then
		ll_Row = dw_Roles.GetRow()
		ll_DefView = dw_Roles.GetItemNumber(ll_Row,'default_view')
		ll_View = dw_views.GetItemNumber(Row,'view_id')

		if ll_View = ll_DefView then
			MessageBox(gnv_app.iapp_object.DisplayName,"This view is Practitioner Default View. Can't be cancel.")
			Return 2
		end if
	end if
end if
//---------------------------- APPEON END ----------------------------

end event

type st_1 from statictext within pfc_cst_u_security_user_painter
boolean visible = false
integer x = 119
integer y = 2208
integer width = 407
integer height = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Facility Access"
boolean focusrectangle = false
end type

type st_department from statictext within pfc_cst_u_security_user_painter
boolean visible = false
integer x = 2130
integer y = 2212
integer width = 521
integer height = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Department Access"
boolean focusrectangle = false
end type

type cb_close from u_cb within pfc_cst_u_security_user_painter
integer x = 4009
integer y = 64
integer width = 311
integer height = 84
integer taborder = 120
string text = "&Close"
boolean cancel = true
end type

event clicked;//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 01.20.2009 By: Ken.Guo
//$<reason> 

//Close( iw_win )

Integer li_ret
dw_group_list.AcceptText()
dw_roles.AcceptText()
If dw_roles.Modifiedcount( ) + dw_group_list.Modifiedcount( ) = 0 Then 
	Close( iw_win )
	Return 1
End If
	
li_ret = Messagebox('Save','Do you want to save the changes?',Question!,YesNoCancel!)
If li_ret = 1 Then
	If cb_save.Trigger Event Clicked() > 0 Then 
		Close( iw_win )
	Else
		Return -1
	End If
ElseIf li_ret = 2 Then
	dw_roles.ResetUpdate()
	dw_group_list.ResetUpdate()
	Close( iw_win )
Else
	//3
	Return 1
End If
Return 1
//---------------------------- APPEON END ----------------------------


end event

type cb_print from u_cb within pfc_cst_u_security_user_painter
boolean visible = false
integer x = 2862
integer y = 3148
integer width = 338
integer height = 84
integer taborder = 110
string text = "&Print"
end type

type gb_select from groupbox within pfc_cst_u_security_user_painter
integer x = 5
integer width = 4347
integer height = 196
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "Select User"
end type

type gb_main from groupbox within pfc_cst_u_security_user_painter
boolean visible = false
integer x = 55
integer y = 2140
integer width = 3136
integer height = 1048
integer taborder = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "Access Settings"
end type

type gb_1 from groupbox within pfc_cst_u_security_user_painter
integer x = 5
integer y = 192
integer width = 4347
integer height = 660
integer taborder = 70
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "Security Settings"
end type

type dw_roles from u_dw within pfc_cst_u_security_user_painter
integer x = 23
integer y = 244
integer width = 4037
integer height = 592
integer taborder = 70
boolean bringtotop = true
string dataobject = "d_security_user_roles_access_w_sets"
boolean vscrollbar = false
boolean border = false
borderstyle borderstyle = stylebox!
end type

event constructor;This.of_SetTransObject( SQLCA )
This.InsertRow( 0 )
this.enabled = false ////Start Code Change ----04.28.2008 #V8 maha

This.of_setupdateable( True)			//Added By Mark Lee 11/21/2014
end event

event pfc_preupdate;call super::pfc_preupdate;Long ll_rec_id

IF This.GetItemStatus( 1, 0, Primary! ) = NewModified! THEN
	dw_roles.SetItem( 1, "user_id", is_user_id )
END IF

RETURN 1
end event

event buttonclicked;call super::buttonclicked;String ls_user_id,ls_ldapuser
If dwo.name = 'b_ldap_user_batch' Then
	ls_user_id = Dw_roles.GetItemString(1,'user_id')
	OpenWithParm(w_security_ldap_user,ls_user_id)
	ls_ldapuser = Message.Stringparm
	If ls_ldapuser <> Dw_roles.GetItemString(1,'ic_ldap_user') Then
		dw_roles.SetItem(1,'ic_ldap_user',ls_ldapuser)
	End If	
elseif 	dwo.name = 'b_search' Then //Start Code Change ----11.15.2008 #V8 maha
	//Start Code Change ----04.02.2008 #V8 maha
	Integer li_nr
	Integer li_find
	Long ll_prac_id
	gs_search lstr_search
	integer i
	integer ic

	lstr_search.stran_transaction = SQLCA
	lstr_search.ls_open_for = "ACTIONITEMS" 
	OpenWithParm( w_extended_search_new , lstr_search )
 
	IF Message.DoubleParm = -1 THEN
		Return -1
	END If
	ll_prac_id = Long( Message.StringParm )

	this.setitem(this.getrow(),"prac_id", ll_prac_id)
	//End Code Change---04.02.2008

End If


end event

event itemchanged;call super::itemchanged;//--------------------------- APPEON BEGIN ---------------------------
//$< Add  > 2008-04-18 By: Scofield
//$<Reason> if current user have no access rights for selected view or facility,then give user a tip.

long	ll_Cycle,ll_Cnt,ll_ViewID,ll_FacilityID,ll_Right

if dwo.name = 'default_view' then
	ll_Cnt = dw_views.RowCount()
	for ll_Cycle = 1 to ll_Cnt
		ll_ViewID = dw_views.GetItemNumber(ll_Cycle,'view_id')
		if ll_ViewID = long(data) then
			ll_Right = dw_views.GetItemNumber(ll_Cycle,'access_rights')
			if ll_Right <> 1 then
				MessageBox(gnv_app.iapp_object.DisplayName,"You have no access rights to this view.  Please assign rights in the View Access list.")
				Return 2
			end if
			Return 0
		end if
	next
elseif dwo.name = 'default_search_facility' then
	ll_Cnt = dw_facility.RowCount()
	for ll_Cycle = 1 to ll_Cnt
		ll_FacilityID = dw_facility.GetItemNumber(ll_Cycle,'facility_id')
		if ll_FacilityID = long(data) then
			ll_Right = dw_facility.GetItemNumber(ll_Cycle,'access_rights')
			if ll_Right <> 1 then
				MessageBox(gnv_app.iapp_object.DisplayName,"You have no access rights to this facility.  Please assign rights in the Facility Access list.")
				Return 2
			end if
			Return 0
		end if
	next
	//Added By Mark Lee 11/21/2014
elseif dwo.name = 'email_account_day' then 
	if not isnumber(data) then 
		Messagebox(gnv_app.iapp_object.DisplayName,"Please enter a whole number that is greater than or equal to zero.")
		this.SetColumn('email_account_day')
		this.SetFocus()
		Setnull(ll_Cycle)
		this.setitem( row, 'email_account_day', ll_Cycle)
		return 2
	end if 
end if
//---------------------------- APPEON END ----------------------------

return 0 //Added By Mark Lee 11/21/2014
end event

event itemerror;call super::itemerror;
long		ll_Cycle
if row > 0 then 			//Added By Mark Lee 11/21/2014
	if dwo.name = 'email_account_day' and not isnumber(data) then 
		Messagebox(gnv_app.iapp_object.DisplayName,"Please enter a whole number that is greater than or equal to zero.")
		Setnull(ll_Cycle)
		this.setitem( row, 'email_account_day', ll_Cycle)
		return 1			//unaccepttext
	end if 
end if 

return 2
end event

type gb_2 from groupbox within pfc_cst_u_security_user_painter
integer x = 5
integer y = 852
integer width = 4347
integer height = 996
integer taborder = 80
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "Group Assignment"
end type

