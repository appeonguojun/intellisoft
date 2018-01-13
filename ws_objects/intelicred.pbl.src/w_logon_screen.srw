$PBExportHeader$w_logon_screen.srw
forward
global type w_logon_screen from w_response
end type
type cbx_remember from checkbox within w_logon_screen
end type
type shl_website from statichyperlink within w_logon_screen
end type
type st_version from statictext within w_logon_screen
end type
type sle_pwtestdb from singlelineedit within w_logon_screen
end type
type sle_pwtest from singlelineedit within w_logon_screen
end type
type cbx_1 from checkbox within w_logon_screen
end type
type cb_1 from statictext within w_logon_screen
end type
type cb_2 from statictext within w_logon_screen
end type
type sle_user_id from singlelineedit within w_logon_screen
end type
type st_1 from statictext within w_logon_screen
end type
type sle_password from singlelineedit within w_logon_screen
end type
type st_2 from statictext within w_logon_screen
end type
type cb_11 from u_cb within w_logon_screen
end type
type cb_22 from u_cb within w_logon_screen
end type
type cb_3 from commandbutton within w_logon_screen
end type
type rb_test from radiobutton within w_logon_screen
end type
type rb_tutor from radiobutton within w_logon_screen
end type
type rb_prod from radiobutton within w_logon_screen
end type
type p_1 from picture within w_logon_screen
end type
end forward

global type w_logon_screen from w_response
integer x = 1184
integer y = 716
integer width = 3767
integer height = 2484
long backcolor = 67108864
cbx_remember cbx_remember
shl_website shl_website
st_version st_version
sle_pwtestdb sle_pwtestdb
sle_pwtest sle_pwtest
cbx_1 cbx_1
cb_1 cb_1
cb_2 cb_2
sle_user_id sle_user_id
st_1 st_1
sle_password sle_password
st_2 st_2
cb_11 cb_11
cb_22 cb_22
cb_3 cb_3
rb_test rb_test
rb_tutor rb_tutor
rb_prod rb_prod
p_1 p_1
end type
global w_logon_screen w_logon_screen

type variables
Integer il_attempts  //Start Code Change ---- 08.02.2007 #V7 maha
integer ii_lock_num
String is_version
string is_mess
//constant long INTELLI_PURPLE = RGB(51 ,0, 100)
constant long INTELLI_PURPLE = RGB(35 ,0, 105)
constant long INTELLI_ORANGE = rgb(255,153,0)
constant long INTELLI_WHITE = rgb(255, 255, 255)
constant long INTELLI_GREY = rgb(175, 175, 175)
constant long INTELLI_black = rgb(0, 0, 0)
n_cst_encrypt in_encrypt

//SSO User Login  -- Add by Jimmy 20140604 
string is_use_saml = "0"
string is_only_saml_user = "0"  

//Added By Ken.Guo 2016-06-16
String is_user_id
n_cst_ad inv_ad  
Boolean ib_ad_autologin, ib_using_ad
n_cst_systeminfo inv_systeminfo

end variables

forward prototypes
public function integer of_logon ()
public function integer of_change_password (string as_from)
public function integer of_connection ()
public function integer of_user_login (integer ai_attempt)
public function integer of_log_connection (string as_pass)
public function string of_get_autologinname ()
public function integer of_intellicontractlayout ()
public subroutine of_load_color_settings ()
public subroutine of_load_property (string as_object)
public subroutine of_encrypt_ad_pwd ()
end prototypes

public function integer of_logon ();/******************************************************************************************************************
**  [PUBLIC]   : of_logon
**==================================================================================================================
**  Purpose   	: 
**==================================================================================================================
**  Arguments 	: [none] 
**==================================================================================================================
**  Returns   	: [long] failure,success
**==================================================================================================================
**  Notes     	: 	   
**==================================================================================================================
**  Created By	: ???
**==================================================================================================================
**  Modification Log
**   Changed By               Change Date                                               Reason
** ------------------------------------------------------------------------------------------------------------------
**  Michael B. Skinner       27  December 2005  										Simplified the function for connecting to the 
**                                                                            Database.
**  Michael B. Skinner        10 January 2005                                 Changed the conect string so that bolbs bigger
**                                                                            then 32767 will be selected. This will override 
**                                                                            pbodbXX.ini file
********************************************************************************************************************/
//Start Code Change ---- 06.19.2007 #V7 maha
//changed to use new connection function
IF of_connect_to_db() = -1 THEN
	return Failure
else
	return Success
end if

//SQLCA.DBMS       = "ODBC"
//SQLCA.Lock       = "RU" // for sql server READ UNCOMMITED - PREVENT LOCKING
//SQLCA.AutoCommit = True
//SQLCA.DBParm     = "ConnectString='DSN=" + gs_odbc + ";UID=dba;PWD=sql',StaticBind=0,DisableBind=1,PBUseProcOwner='Yes',RPCReBind=1,MsgTerse='Yes', " + & 
//																	"DelimitIdentifier='No',ConnectOption='SQL_DRIVER_CONNECT,SQL_DRIVER_NOPROMPT ',"+ & 
//																	"PBTrimCharColumns='Yes',PBMaxBlobSize = '2147483647' ,PBMaxTextSize = '2147483647'"    
//												
//CONNECT USING SQLCA;
//
//IF SQLCA.SQLCODE = 0  THEN 
//	CHOOSE CASE SQLCA.SQLreturndata
//		CASE 'Adaptive Server Anywhere'
//			  gs_dbType = 'ASA'
//		CASE 'Microsoft SQL Server'
//			  gs_dbType = 'SQL'
//		CASE ELSE 
//				f_system_error_handler ('Inital Login Failed!  ' +    SQLCA.sqlerrtext)
//				//SQLCA.sqldbcode
//				Return FAILURE
//	END CHOOSE 
//ELSE 
//	// msskiner 10 March 2006 -- begin
//	// if the database is not runnning - don't tell up about it
//	if sqlca.sqldbcode = -100 then 
//	   messageBOX(title,'The database server is not running. Contact your system administrator' )		
//	else 
//	    f_system_error_handler ('Inital Login Failed!  ' +    SQLCA.sqlerrtext)
//   end if
//	// msskiner 10 March 2006 -- end 
//	//SQLCA.sqldbcode
//	Return FAILURE
//END IF
//
//RETURN SUCCESS
//End Code Change---06.19.2007
end function

public function integer of_change_password (string as_from);
if as_from = "ENCRYPT" then
	messagebox("Password update","Please change your password at this time.  Enter your Current password and then change by entering the New password and Verifying it.")
	openwithparm(w_change_password,"ENCRYPT")
else  //login
	messagebox("Password update","Please change your password at this time.  Enter your Current password and then change by entering the New password and Verifying it.")
	openwithparm(w_change_password,"login")
end if

if message.stringparm = "Cancel" then
	messagebox("Password","Your password is no longer valid.  Closing program.")
	halt
end if


return 1
end function

public function integer of_connection ();//Start Code Change ---- 11.01.2005 #0 maha
//Start Code Change ---- 06.19.2007 #V7 maha
//changed to use new connection function

//SQLCA.DBMS="ODBC"
//if gi_test_database = 1 then //maha 123102
//	SQLCA.DbParm="ConnectString='DSN=IntelliCred Test;UID=DBA;PWD=SQL',DelimitIdentifier='No', ConnectOption='SQL_DRIVER_CONNECT,SQL_DRIVER_NOPROMPT', StaticBind=1, DisableBind = 1 "
//elseif gi_test_database = 2 then //tutorial 030805
//	SQLCA.DbParm="ConnectString='DSN=IntelliCred Tutorial;UID=DBA;PWD=SQL',DelimitIdentifier='No', ConnectOption='SQL_DRIVER_CONNECT,SQL_DRIVER_NOPROMPT', StaticBind=1, DisableBind = 1 "
////else
////	SQLCA.DbParm="ConnectString='DSN=" + gs_odbc + ";UID=" + gs_user_id + ";PWD=" + gs_password + "',DelimitIdentifier='No', ConnectOption='SQL_DRIVER_CONNECT,SQL_DRIVER_NOPROMPT', StaticBind=1, DisableBind = 1 "
//end if	
//SQLCA.AutoCommit = TRUE
//	
string ls_mess
if gi_test_database = 1 then //maha 123102
	gs_odbc = "IntelliCred Test"
	ls_mess = "Login to Test Database Failed! Most likely caused by not having an IntelliCred Test ODBC to connect to the test database."
elseif gi_test_database = 2 then //tutorial 030805
	gs_odbc = "IntelliCred Tutorial"
	ls_mess = "Login to Tutorial Database Failed! Most likely caused by not having an IntelliCred Tutorial ODBC to connect to the tutorial database."
end if

IF of_connect_to_db() = -1 THEN
	MessageBox("Login", ls_mess)
	sle_user_id.setfocus()//maha 080300
	il_attempts ++
	IF il_attempts = 3 THEN
		HALT
	ELSE
		of_logon()
		Return 1
	END IF

end if

//CONNECT USING SQLCA;

//IF SQLCA.SQLCODE = -1 THEN
//	if gi_test_database = 1 then //maha 123102
//		MessageBox("Login", "Login to Test Database Failed! Most likely caused by not having an IntelliCred Test ODBC to connect to the test database.")
//	elseif gi_test_database = 2 then //maha 030805
//		MessageBox("Login", "Login to Tutorial Database Failed! Most likely caused by not having an IntelliCred Tutorial ODBC to connect to the tutorial database.")
//	//else normal
//	end if
//	sle_user_id.setfocus()//maha 080300
//	il_attempts ++
//	IF il_attempts = 3 THEN
//		HALT
//	ELSE
//		of_logon()
//		Return 1
//	END IF
//end if
//End Code Change---06.20.2007 


return 1


end function

public function integer of_user_login (integer ai_attempt);//created maha 111605 to test for user in user security.
integer cnt
string ls_pass
string ls_user
string ls_password
string ls_user_test = ""
string ls_passorg
integer li_ret
datetime ldt_locktime
string	ls_OriginalUser
Boolean	lb_Relogin
string ls_use_name_login //Added By Jay Chen 02-06-2015
String ls_ad_server, ls_ad_user, ls_ad_password, ls_error, ls_userid //Added By Ken.Guo 2016-06-16
Integer li_ad_save_pwd, li_ad_status, li_disabled_status, li_count //Added By Ken.Guo 2016-06-16

//Added By Jay Chen 02-06-2015
select use_name_login into :ls_use_name_login from icred_settings;
if isnull(ls_use_name_login) or ls_use_name_login = '' then ls_use_name_login = '0'

ls_user = trim(sle_user_id.text)
ls_password = sle_password.text
ls_passorg = ls_password
ls_password = in_encrypt.of_encrypt(ls_password)
sle_pwtest.text = ls_password

//Added By Ken.Guo 2016-06-22
String ls_ad_pc_domainname,ls_domainuser, ls_shortdomainname
ls_ad_pc_domainname = inv_systeminfo.of_get_domaindnsname( )
ls_shortdomainname = inv_systeminfo.of_get_domainname( )
//get user info
if upper(ls_user) = "MASTER" then
	//skip test
else
	//Added By Ken.Guo 2016-06-16. Use AD login
	If ib_ad_autologin Then
		gs_user_id = is_user_id
		return 1 
	End If
	ls_error = ''
	gb_ad_login = False
	If gnv_user_option.of_get_option_value('allow_ad_function') = '1'  Then
		If lastpos(ls_user,'\') > 0 Then
			ls_domainuser = Mid(ls_user, lastpos(ls_user,'\') + 1 , Len(ls_user))
		Else
			ls_domainuser = ls_user
		End If		
		select Top 1 user_id, disabled_status, ad_server, ad_user, ad_password, ad_save_pwd, ad_status  
		into :ls_userid, :li_disabled_status,:ls_ad_server, :ls_ad_user, :ls_ad_password,:li_ad_save_pwd, :li_ad_status from security_users 
		where ad_user = :ls_domainuser or ad_user = :ls_user or ad_user = :ls_ad_pc_domainname + '\' + :ls_domainuser or ad_user = :ls_shortdomainname + '\' + :ls_domainuser ;
		If sqlca.sqlcode = 0 and li_ad_status = 1  and (li_disabled_status = 0 or isnull(li_disabled_status)) Then
			If inv_ad.of_connect_ad( ls_ad_pc_domainname, ls_ad_user, ls_passorg, ref ls_error, True, True) = 0 Then
				gs_user_id = ls_userid
				//save pwd
				If cbx_remember.checked Then
					Update security_users set  ad_password = :ls_password, ad_save_pwd = 1 where  user_id = :ls_userid ;
				ElseIf cbx_remember.visible Then
					Update security_users set  ad_save_pwd = 0 where user_id = :ls_userid ;
				End If
				ib_using_ad = True
				gb_ad_login = True
				Return 1 
			Else
				Messagebox('Active Directory Login Error','Failed to login with Active Directory account.~r~n'  + ls_error) 
				Return -1
			End If
		Else
			If  sqlca.sqlcode = 0 Then
				If li_ad_status = 0 or isnull(li_ad_status) Then
					//check the user id whether exists.
					Select count(1) into :li_count from security_users where user_id = :ls_user;
					If li_count > 0 Then
						//Continue login with CL Account login
					Else
						Messagebox('Active Directory Login Error','Failed to login with Active Directory account. ~r~nThe account "' + ls_domainuser + '" is disabled in the AD User Painter.')
						Return -1
					End If
				End If
				If  li_disabled_status = 1  Then
					Messagebox('Active Directory Login Error','Failed to login with Active Directory account. ~r~nThe mapped CL user  "' + ls_userid + '" is disabled in the User Painter. ')
					Return -1					
				End If
			End If
		End If
	End If
	
//	Start Code Change ---- 08.02.2007 #V7 maha
	if ls_use_name_login = '0' then //Added By Jay Chen 02-06-2015
		select user_id, user_password,lock_until into :ls_user_test, :ls_pass, :ldt_locktime from security_users where upper(user_id) = upper(:ls_user);
	else
		select user_id, user_password,lock_until into :ls_user_test, :ls_pass, :ldt_locktime from security_users where upper(user_name) = upper(:ls_user);
		if isnull(ls_user_test) or ls_user_test = '' then
			select user_id, user_password,lock_until into :ls_user_test, :ls_pass, :ldt_locktime from security_users where upper(user_id) = upper(:ls_user);
		end if
	end if
	if ii_lock_num > 0 then
		if ldt_locktime > datetime(today(),now()) then //lockout test
			return -5
		end if
	end if
	
	if ls_use_name_login = '0' then //Added By Jay Chen 02-06-2015
		select user_id, user_password into :ls_user_test, :ls_pass from security_users where upper(user_id) = upper(:ls_user);
	else
		select user_id, user_password into :ls_user_test, :ls_pass from security_users where upper(user_name) = upper(:ls_user);
		if isnull(ls_user_test) or ls_user_test = '' then 
			select user_id, user_password into :ls_user_test, :ls_pass from security_users where upper(user_id) = upper(:ls_user);
		end if
	end if
	//End Code Change---08.02.2007
	sle_pwtestdb.text = ls_pass
	//check existance of user
	if isnull(ls_user_test) or ls_user_test = "" then 
		//Added By Mark Lee 07/31/12
//		MessageBox("Login Error","Invalid user name '" + ls_user + "'.  Please check your spelling or the user is not entered into IntelliCred.")
		If  ls_error <> ''  Then //AD Login Error //Added By Ken.Guo 2016-06-17
			MessageBox("Login Error", ls_error )
		Else
			MessageBox("Login Error","Invalid user name '" + ls_user + "'.  ~r~nPlease check your spelling or the user is not entered into Contract Logix.")
		End If
		sle_user_id.SetFocus()		//Added by Scofield on 2009-01-05
		return -1
	end if
end if

lb_ReLogin = gf_Get_ReLogin_Status( )
If  lb_ReLogin Then  ls_OriginalUser = 	gs_user_id//added by gavins 20130515
//--------------------------- APPEON BEGIN ---------------------------
//$<add> 08/21/2007 By: Ken.Guo
//$<reason> when user input 'master' in sle_user_id , the gs_user_id is set to 'master', but in DB it maybe is 'MASTER' .  
if ls_use_name_login = '0' then //Added By Jay Chen 02-06-2015
	select user_id into :gs_user_id from security_users where upper(user_id) = upper(:ls_user);
else
	select user_id into :gs_user_id from security_users where upper(user_name) = upper(:ls_user);
	
	If sqlca.sqlcode <> 0 Then //Modified By Ken.Guo 2015-08-06. Fixed login as  bug
	//if isnull(gs_user_id) or gs_user_id = '' then
		select user_id into :gs_user_id from security_users where upper(user_id) = upper(:ls_user);
	end if
end if
//---------------------------- APPEON END ----------------------------

//
//check PASSWORD
//--------------------------- APPEON BEGIN ---------------------------
//$<modified> 2005-11-23 By: Zhang Lingping
//$<reason>1. The password for user 'Master' has been encrypted. the process 
//$<reason> for check need  encrypt password too.
//$<reason>2.If the password for user 'MASTER' is invalid, the application 
//$<reason> should halt().

if upper(ls_user) = "MASTER" then

//Begin - Added By Mark Lee 12/11/2012
//	if upper(ls_passorg) <> Upper(SUPER_MASTER_PASSWORD) then
//	//maha remodified 121305 // this login always uses this password and bypasses normal security
//		MessageBox("Login Error","Invalid password for user name MASTER. ")
//		sle_password.SetFocus()		//Added by Scofield on 2009-01-05
// 		return -1
//	end if
////---------------------------- APPEON END ----------------------------
//	if appeongetclienttype() = "PB" and (gb_IsAutoExpImp or gb_AutoSchedule) then
//			//do nothing
//	else
//			if lower(ls_passorg) <> left(of_day_password(today()),6 )then					//Added By Mark Lee 09/16/2013
			if lower(ls_passorg) <> left(of_day_password(Date(f_get_server_dtm())),6 )then
				messagebox("Login Error","Invalid password for user name MASTER.  This is not today's password")
				If  lb_ReLogin Then   gs_user_id = ls_OriginalUser
				return -1
			end if
//	end if
//End - Added By Mark Lee 12/11/2012

else
	if isnull(ls_pass) or ls_pass = "" then
		li_ret = of_change_password("login")
		if li_ret = -1 then
			If  lb_ReLogin Then gs_user_id = ls_OriginalUser
			return -1
		End IF
	elseif ls_pass = "123" and ls_passorg = '123' then			//Modified by Scofield on 2007-08-21: Add condition "and ls_passorg = '123'"
		li_ret = of_change_password("login")
		if li_ret = -1 then
			If  lb_ReLogin Then gs_user_id = ls_OriginalUser
			return -1
		End If
	else
		if ls_pass <> ls_password then
			If  ls_error <> ''  Then //AD Login Error //Added By Ken.Guo 2016-06-17
				MessageBox("Login Error", ls_error + " Please check your Active Directory account or CL user's password.")
			Else
				MessageBox("Login Error","Invalid password for user name '" + ls_user + "'.  Please check your spelling.")
			End If
			sle_password.SetFocus()		//Added by Scofield on 2009-01-05
			If  lb_ReLogin Then gs_user_id = ls_OriginalUser
			return -1
		end if
	end if
end if

return 1 
end function

public function integer of_log_connection (string as_pass);//function created maha 11-21-05 to track login attempts for future development
//Start Code Change ---- 10.05.2006 #1 maha changed table name updated.
time lt_time = now()

datetime ldt_date
string ls_password

ldt_date = datetime(today(),now())
 
if as_pass = "FAIL"  or as_pass = "LOCK"  then
	if upper(gs_user_id) = "MASTER" then  //Start Code Change ---- 03.13.07.2007 #V7 maha
		ls_password = "********"  
	else
//		ls_password = gs_password
		ls_password = "********" //Modified By Jay Chen 03-14-2014
	end if
else //if pass don't log the password
	ls_password = "********"
end if
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-02
//$<add> 03.15.2006 By: Cao YongWang
//$<reason> Performance tuning.
//$<modification> Add Appeon Commit label to reduce client-server interactions to improve runtime performance.

//Added By Ken.Guo 2016-01-11
String ls_comments
ls_comments = 'Client IP = ' + gs_client_ip 
If AppeongetClientType() = 'WEB' Then
	ls_comments += '; URL = ' + appeongetieurl()
Else
	ls_comments += '; C/S'
End If

//Added By Ken.Guo 2016-06-17
string ls_pass_new, ls_comments_ext
If Left(as_pass,4) = 'PASS' Then
	ls_pass_new = 'PASS'
	ls_comments_ext = ';'+Mid(as_pass,6,Len(as_pass))
Else
	ls_pass_new = as_pass
End If

gnv_appeondb.of_autocommit()
//---------------------------- APPEON END ----------------------------
insert into security_login_tracking (user_id,user_password,log_date,pass_fail, comments) values (:gs_user_id,:ls_password,getdate(),:ls_pass_new,:ls_comments + :ls_comments_ext);
commit using sqlca;
//End Code Change---10.05.2006

return 1
end function

public function string of_get_autologinname ();//////////////////////////////////////////////////////////////////////
// $<function>w_logon_screenof_get_autologinname()
// $<arguments>(None)
// $<returns> string : Auto Login Name
// $<description>
// $<description>
//////////////////////////////////////////////////////////////////////
// $<add> 11/19/2007 by Ken.Guo
//////////////////////////////////////////////////////////////////////

String ls_LDAPUser,ls_os_username,ls_domainname,ls_computer_name
String ls_user_id
Long ll_cnt
n_cst_systeminfo lnv_systeminfo
gb_autologin = False

//Case Appeon Security User(LDAP User)
ls_LDAPUser = AppeonGetAppeonUserName()

If Len(ls_LDAPUser) > 0 Then
	//Get login user ID for IC by LDAP User
	Select user_id Into :ls_user_id From security_users Where upper(ic_ldap_user) = upper(:ls_LDAPuser);
	If ls_user_id = '' or isnull(ls_user_id) Then
		//Added By Ken.Guo 06/03/2013. map user id
		Select Count(1) Into :ll_cnt From security_users Where upper(user_id) = upper(:ls_LDAPuser);
		If ll_cnt = 0 or isnull(ll_cnt) Then
			MessageBox("Login Error","The Auto-Login user '"+ls_LDAPUser+"' does not map with any Contractlogix user ID in the User Painter.")
			Halt
		Else
			ls_user_id = ls_LDAPuser
		End If
	End If
	gb_autologin = True
	Return ls_user_id
End If

//Case Command Line User(LDAP User)
//Get login user from Command Line 
//For Interface in the future


//Case Domain & User(OS Login User)
lnv_systeminfo = Create n_cst_systeminfo
ls_os_username = lnv_systeminfo.of_get_username()
ls_domainname = lnv_systeminfo.of_get_domainname()
ls_computer_name = lnv_systeminfo.of_get_computername()

//ls_domainname = ls_computer_name means it do not login domain server.
If ls_domainname <> ls_computer_name Then
	Select user_id Into :ls_user_id From security_users Where upper(ic_ldap_user) = upper(:ls_os_username) and upper(domain_name) = upper(:ls_domainname);	
	If ls_user_id = '' or isnull(ls_user_id) Then
		Select user_id Into :ls_user_id From security_users Where upper(ic_ldap_user) = upper(:ls_os_username) and upper(domain_name) = upper(:ls_domainname) + '.COM';
		If ls_user_id = '' or isnull(ls_user_id) Then
			//Continue
		Else
			Destroy lnv_systeminfo
			gb_autologin = True
			Return ls_user_id
		End If
	Else
		Destroy lnv_systeminfo
		gb_autologin = True
		Return ls_user_id
	End If
End If
If isvalid(lnv_systeminfo) Then Destroy lnv_systeminfo
Return ''
end function

public function integer of_intellicontractlayout ();//////////////////////////////////////////////////////////////////////
// $<Function>  of_intellicontractlayout()
// $<arguments> (None)
// $<returns>   integer
// $<description> Execute Contract Logix screen layout
//////////////////////////////////////////////////////////////////////
// $<add> 11/10/2008 by Evan
//////////////////////////////////////////////////////////////////////

this.Resize(3770, 2476)
p_1.Move(0, -10)
p_1.Resize(3749, 2400)

sle_user_id.X = 1150
sle_password.X = sle_user_id.X
sle_user_id.Y = 1230
sle_password.Y = sle_user_id.Y + 168

st_1.X = sle_user_id.X
st_2.X = sle_user_id.X
st_1.Y = sle_user_id.Y - st_1.Height - 4
st_2.Y = sle_password.Y - st_2.Height - 4
st_1.Text = "Username"
st_1.TextColor = RGB(66,66,66)
st_2.TextColor = RGB(66,66,66)
st_1.BackColor = RGB(244,245,245)
st_2.BackColor = RGB(244,245,245)

cb_2.X = sle_user_id.X
cb_1.X = sle_user_id.X + cb_2.Width + 4
cb_2.Y = sle_password.Y + 150
cb_1.Y = cb_2.Y
cb_1.Text = "&Login"
cb_1.TextColor = RGB(248,251,246)
cb_2.TextColor = RGB(248,251,246)
cb_1.BackColor = RGB(134,196,64)
cb_2.BackColor = RGB(134,196,64)

rb_test.X = sle_user_id.X + sle_user_id.Width + 250
rb_test.Y = sle_user_id.Y
rb_prod.X = rb_test.X
rb_prod.Y = rb_test.Y + 100
rb_tutor.X = rb_test.X
rb_tutor.Y = rb_prod.Y + 100
rb_test.TextColor = RGB(244,245,245)
rb_prod.TextColor = RGB(244,245,245)
rb_tutor.TextColor = RGB(244,245,245)
rb_test.BackColor = RGB(42,134,199)
rb_prod.BackColor = RGB(42,134,199)
rb_tutor.BackColor = RGB(42,134,199)

st_version.X = 832
st_version.Y = 1880

//Modified By Ken.Guo 12/16/2014
//st_version.Resize(1486, 152)
st_version.Resize(1250, 90)

st_version.TextColor = RGB(198,216,229)
st_version.BackColor = RGB(42,134,199)
st_version.Alignment = Left!
st_version.Show()

shl_website.X = 841
shl_website.Y = 2068
shl_website.Resize(1330, 68)
shl_website.TextColor = RGB(18,58,87)
shl_website.BackColor = RGB(42,134,199)
//shl_website.Show() //Comment By Jay Chen 03-05-2014

Return 1
end function

public subroutine of_load_color_settings ();//Added By Ken.Guo 09/15/2014
String ls_user_color, ls_user_bk_color, ls_version_color, ls_version_bk_color,ls_btn_color,ls_btn_bk_color
string ls_font_face1,ls_font_face2,ls_font_face3,ls_font_bold1,ls_font_bold2,ls_font_bold3
string ls_font_italic1,ls_font_italic2,ls_font_italic3,ls_font_underline1,ls_font_underline2,ls_font_underline3

If Not isvalid(gnv_user_option) Then
	gnv_user_option = Create n_cst_user_option  
End If
gnv_user_option.of_system_retrieve(  ) 

ls_user_color = gnv_user_option.of_get_option_value( 'splash_user_label_color' )
ls_user_bk_color = gnv_user_option.of_get_option_value( 'splash_user_label_bk_color' )
ls_version_color = gnv_user_option.of_get_option_value( 'splash_version_label_color' )
ls_version_bk_color = gnv_user_option.of_get_option_value( 'splash_version_label_bk_color' )
If Not isnull(ls_user_color) and ls_user_color <> '' Then
	st_1.textcolor = Long(ls_user_color)
	st_2.textcolor = Long(ls_user_color)
End If

If Not isnull(ls_user_bk_color) and ls_user_bk_color <> '' Then
	st_1.backcolor = Long(ls_user_bk_color)
	st_2.backcolor = Long(ls_user_bk_color)
End If

If Not isnull(ls_version_color) and ls_version_color <> '' Then
	st_version.textcolor = Long(ls_version_color)
	rb_test.textcolor = Long(ls_version_bk_color)
	rb_prod.textcolor = Long(ls_version_bk_color)
	rb_tutor.textcolor = Long(ls_version_bk_color)
	cbx_1.textcolor = Long(ls_version_bk_color)	
End If

If Not isnull(ls_version_bk_color) and ls_version_bk_color <> '' Then
	st_version.backcolor = Long(ls_version_bk_color)
	rb_test.backcolor = Long(ls_version_bk_color)
	rb_prod.backcolor = Long(ls_version_bk_color)
	rb_tutor.backcolor = Long(ls_version_bk_color)
	cbx_1.backcolor = Long(ls_version_bk_color)
End If

//Added By Jay Chen 03-15-2016
ls_btn_color = gnv_user_option.of_get_option_value( 'splash_button_label_color' )
if not isnull(ls_btn_color) and ls_btn_color <> '' then
	cb_1.textcolor = long(ls_btn_color)
	cb_2.textcolor = long(ls_btn_color)
end if

ls_btn_bk_color = gnv_user_option.of_get_option_value( 'splash_button_label_bk_color' )
if not isnull(ls_btn_bk_color) and ls_btn_bk_color <> '' then
	cb_1.backcolor = long(ls_btn_bk_color)
	cb_2.backcolor = long(ls_btn_bk_color)
end if

ls_font_face1 = gnv_user_option.of_get_option_value( 'splash_user_font_face' )
if ls_font_face1 = '?' or ls_font_face1 = '!' then ls_font_face1 = ''
if not isnull(ls_font_face1) and ls_font_face1 <> '' then
	st_1.facename = ls_font_face1
	st_2.facename = ls_font_face1
end if

ls_font_face2 = gnv_user_option.of_get_option_value( 'splash_version_font_face' )
if ls_font_face2 = '?' or ls_font_face2 = '!' then ls_font_face2 = ''
if not isnull(ls_font_face2) and ls_font_face2 <> '' then
	st_version.facename = ls_font_face1
end if

ls_font_face3 = gnv_user_option.of_get_option_value( 'splash_button_font_face' )
if ls_font_face3 = '?' or ls_font_face3 = '!' then ls_font_face3 = ''
if not isnull(ls_font_face3) and ls_font_face3 <> '' then
	cb_1.facename = ls_font_face3
	cb_2.facename = ls_font_face3
end if

ls_font_bold1 = gnv_user_option.of_get_option_value( 'splash_user_font_bold' )
if ls_font_bold1 = '?' or ls_font_bold1 = '!' then ls_font_bold1 = ''
if not isnull(ls_font_bold1) and ls_font_bold1 <> '' then
	st_1.weight = long(ls_font_bold1)
	st_2.weight = long(ls_font_bold1)
end if

ls_font_bold2 = gnv_user_option.of_get_option_value( 'splash_version_font_bold' )
if ls_font_bold2 = '?' or ls_font_bold2 = '!' then ls_font_bold2 = ''
if not isnull(ls_font_bold2) and ls_font_bold2 <> '' then
	st_version.weight = long(ls_font_bold2)
end if

ls_font_bold3 = gnv_user_option.of_get_option_value( 'splash_button_font_bold' )
if ls_font_bold3 = '?' or ls_font_bold3 = '!' then ls_font_bold3 = ''
if not isnull(ls_font_bold3) and ls_font_bold3 <> '' then
	cb_1.weight = long(ls_font_bold3)
	cb_2.weight = long(ls_font_bold3)
end if

ls_font_italic1 = gnv_user_option.of_get_option_value( 'splash_user_font_italic' )
if ls_font_italic1 = '?' or ls_font_italic1 = '!' then ls_font_italic1 = ''
if not isnull(ls_font_italic1) and ls_font_italic1 <> '' then
	if ls_font_italic1 = '1' then
		st_1.italic = true
		st_2.italic = true
	else
		st_1.italic = false
		st_2.italic = false
	end if
end if

ls_font_italic2 = gnv_user_option.of_get_option_value( 'splash_version_font_italic' )
if ls_font_italic2 = '?' or ls_font_italic2 = '!' then ls_font_italic2 = ''
if not isnull(ls_font_italic2) and ls_font_italic2 <> '' then
	if ls_font_italic2 = '1' then
		st_version.italic = true
	else
		st_version.italic = false
	end if
end if

ls_font_italic3 = gnv_user_option.of_get_option_value( 'splash_button_font_italic' )
if ls_font_italic3 = '?' or ls_font_italic3 = '!' then ls_font_italic3 = ''
if not isnull(ls_font_italic3) and ls_font_italic3 <> '' then
	if ls_font_italic3 = '1' then
		cb_1.italic = true
		cb_2.italic = true
	else
		cb_1.italic = false
		cb_2.italic = false
	end if
end if

ls_font_underline1 = gnv_user_option.of_get_option_value( 'splash_user_font_underline' )
if ls_font_underline1 = '?' or ls_font_underline1 = '!' then ls_font_underline1 = ''
if not isnull(ls_font_underline1) and ls_font_underline1 <> '' then
	if ls_font_underline1 = '1' then
		st_1.underline = true
		st_2.underline = true
	else
		st_1.underline = false
		st_2.underline = false
	end if
end if

ls_font_underline2 = gnv_user_option.of_get_option_value( 'splash_version_font_underline' )
if ls_font_underline2 = '?' or ls_font_underline2 = '!' then ls_font_underline2 = ''
if not isnull(ls_font_underline2) and ls_font_underline2 <> '' then
	if ls_font_underline2 = '1' then
		st_version.underline = true
	else
		st_version.underline = false
	end if
end if

ls_font_underline3 = gnv_user_option.of_get_option_value( 'splash_button_font_underline' )
if ls_font_underline3 = '?' or ls_font_underline3 = '!' then ls_font_underline3 = ''
if not isnull(ls_font_underline3) and ls_font_underline3 <> '' then
	if ls_font_underline3 = '1' then
		cb_1.underline = true
		cb_2.underline = true
	else
		cb_1.underline = false
		cb_2.underline = false
	end if
end if
end subroutine

public subroutine of_load_property (string as_object);//Added By Jay Chen 03-18-2016
string ls_value,ls_parm
long ll_value

If Not isvalid(gnv_user_option) Then
	gnv_user_option = Create n_cst_user_option  
	gnv_user_option.of_system_retrieve( ) 
End If

choose case lower(as_object)
	case 'user name label'
		ls_parm = 'splash_user_label_'
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'color' )
		if not isnull(ls_value) and ls_value <> '' then st_1.textcolor = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'bk_color' )
		if not isnull(ls_value) and ls_value <> '' then st_1.backcolor = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'font_face' )
		if ls_value = '?' or ls_value = '!' then ls_value = ''
		if not isnull(ls_value) and ls_value <> '' then st_1.facename = ls_value
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'font_weight' )
		if ls_value = '?' or ls_value = '!' then ls_value = ''
		if not isnull(ls_value) and ls_value <> '' then st_1.weight = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'font_italic' )
		if ls_value = '?' or ls_value = '!' then ls_value = ''
		if not isnull(ls_value) and ls_value <> '' then 
			if ls_value = '1' then
				st_1.italic = true
			else
				st_1.italic = false
			end if
		end if
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'font_underline' )
		if ls_value = '?' or ls_value = '!' then ls_value = ''
		if not isnull(ls_value) and ls_value <> '' then 
			if ls_value = '1' then
				st_1.underline = true
			else
				st_1.underline = false
			end if
		end if
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'x' )
		if not isnull(ls_value) and ls_value <> '' then st_1.x = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'y' )
		if not isnull(ls_value) and ls_value <> '' then st_1.y = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'width' )
		if not isnull(ls_value) and ls_value <> '' then st_1.width = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'height' )
		if not isnull(ls_value) and ls_value <> '' then st_1.height = long(ls_value)
	case 'user name'
		ls_parm = 'splash_user_'
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'color' )
		if not isnull(ls_value) and ls_value <> '' then sle_user_id.textcolor = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'bk_color' )
		if not isnull(ls_value) and ls_value <> '' then sle_user_id.backcolor = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'font_face' )
		if ls_value = '?' or ls_value = '!' then ls_value = ''
		if not isnull(ls_value) and ls_value <> '' then sle_user_id.facename = ls_value
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'font_weight' )
		if ls_value = '?' or ls_value = '!' then ls_value = ''
		if not isnull(ls_value) and ls_value <> '' then sle_user_id.weight = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'font_italic' )
		if ls_value = '?' or ls_value = '!' then ls_value = ''
		if not isnull(ls_value) and ls_value <> '' then 
			if ls_value = '1' then
				sle_user_id.italic = true
			else
				sle_user_id.italic = false
			end if
		end if
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'font_underline' )
		if ls_value = '?' or ls_value = '!' then ls_value = ''
		if not isnull(ls_value) and ls_value <> '' then 
			if ls_value = '1' then
				sle_user_id.underline = true
			else
				sle_user_id.underline = false
			end if
		end if
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'x' )
		if not isnull(ls_value) and ls_value <> '' then sle_user_id.x = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'y' )
		if not isnull(ls_value) and ls_value <> '' then sle_user_id.y = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'width' )
		if not isnull(ls_value) and ls_value <> '' then sle_user_id.width = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'height' )
		if not isnull(ls_value) and ls_value <> '' then sle_user_id.height = long(ls_value)
	case 'password label'
		ls_parm = 'splash_pwd_label_'
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'color' )
		if isnull(ls_value) or ls_value = '' then ls_value = gnv_user_option.of_get_option_value('splash_user_label_color')
		if not isnull(ls_value) and ls_value <> '' then st_2.textcolor = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'bk_color' )
		if isnull(ls_value) or ls_value = '' then ls_value = gnv_user_option.of_get_option_value('splash_user_label_bk_color')
		if not isnull(ls_value) and ls_value <> '' then st_2.backcolor = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'font_face' )
		if ls_value = '?' or ls_value = '!' then ls_value = ''
		if not isnull(ls_value) and ls_value <> '' then st_2.facename = ls_value
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'font_weight' )
		if ls_value = '?' or ls_value = '!' then ls_value = ''
		if not isnull(ls_value) and ls_value <> '' then st_2.weight = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'font_italic' )
		if ls_value = '?' or ls_value = '!' then ls_value = ''
		if not isnull(ls_value) and ls_value <> '' then 
			if ls_value = '1' then
				st_2.italic = true
			else
				st_2.italic = false
			end if
		end if
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'font_underline' )
		if ls_value = '?' or ls_value = '!' then ls_value = ''
		if not isnull(ls_value) and ls_value <> '' then 
			if ls_value = '1' then
				st_2.underline = true
			else
				st_2.underline = false
			end if
		end if
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'x' )
		if not isnull(ls_value) and ls_value <> '' then st_2.x = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'y' )
		if not isnull(ls_value) and ls_value <> '' then st_2.y = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'width' )
		if not isnull(ls_value) and ls_value <> '' then st_2.width = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'height' )
		if not isnull(ls_value) and ls_value <> '' then st_2.height = long(ls_value)
	case 'password'
		ls_parm = 'splash_pwd_'
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'color' )
		if not isnull(ls_value) and ls_value <> '' then sle_password.textcolor = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'bk_color' )
		if not isnull(ls_value) and ls_value <> '' then sle_password.backcolor = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'font_face' )
		if ls_value = '?' or ls_value = '!' then ls_value = ''
		if not isnull(ls_value) and ls_value <> '' then sle_password.facename = ls_value
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'font_weight' )
		if ls_value = '?' or ls_value = '!' then ls_value = ''
		if not isnull(ls_value) and ls_value <> '' then sle_password.weight = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'font_italic' )
		if ls_value = '?' or ls_value = '!' then ls_value = ''
		if not isnull(ls_value) and ls_value <> '' then 
			if ls_value = '1' then
				sle_password.italic = true
			else
				sle_password.italic = false
			end if
		end if
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'font_underline' )
		if ls_value = '?' or ls_value = '!' then ls_value = ''
		if not isnull(ls_value) and ls_value <> '' then 
			if ls_value = '1' then
				sle_password.underline = true
			else
				sle_password.underline = false
			end if
		end if
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'x' )
		if not isnull(ls_value) and ls_value <> '' then sle_password.x = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'y' )
		if not isnull(ls_value) and ls_value <> '' then sle_password.y = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'width' )
		if not isnull(ls_value) and ls_value <> '' then sle_password.width = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'height' )
		if not isnull(ls_value) and ls_value <> '' then sle_password.height = long(ls_value)
	case 'button ok'
		ls_parm = 'splash_btn_ok_'
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'color' )
		if not isnull(ls_value) and ls_value <> '' then cb_1.textcolor = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'bk_color' )
		if not isnull(ls_value) and ls_value <> '' then cb_1.backcolor = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'font_face' )
		if ls_value = '?' or ls_value = '!' then ls_value = ''
		if not isnull(ls_value) and ls_value <> '' then cb_1.facename = ls_value
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'font_weight' )
		if ls_value = '?' or ls_value = '!' then ls_value = ''
		if not isnull(ls_value) and ls_value <> '' then cb_1.weight = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'font_italic' )
		if ls_value = '?' or ls_value = '!' then ls_value = ''
		if not isnull(ls_value) and ls_value <> '' then 
			if ls_value = '1' then
				cb_1.italic = true
			else
				cb_1.italic = false
			end if
		end if
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'font_underline' )
		if ls_value = '?' or ls_value = '!' then ls_value = ''
		if not isnull(ls_value) and ls_value <> '' then 
			if ls_value = '1' then
				cb_1.underline = true
			else
				cb_1.underline = false
			end if
		end if
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'x' )
		if not isnull(ls_value) and ls_value <> '' then cb_1.x = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'y' )
		if not isnull(ls_value) and ls_value <> '' then cb_1.y = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'width' )
		if not isnull(ls_value) and ls_value <> '' then cb_1.width = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'height' )
		if not isnull(ls_value) and ls_value <> '' then cb_1.height = long(ls_value)
	case 'button cancel'
		ls_parm = 'splash_btn_cancel_'
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'color' )
		if not isnull(ls_value) and ls_value <> '' then cb_2.textcolor = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'bk_color' )
		if not isnull(ls_value) and ls_value <> '' then cb_2.backcolor = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'font_face' )
		if ls_value = '?' or ls_value = '!' then ls_value = ''
		if not isnull(ls_value) and ls_value <> '' then cb_2.facename = ls_value
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'font_weight' )
		if ls_value = '?' or ls_value = '!' then ls_value = ''
		if not isnull(ls_value) and ls_value <> '' then cb_2.weight = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'font_italic' )
		if ls_value = '?' or ls_value = '!' then ls_value = ''
		if not isnull(ls_value) and ls_value <> '' then 
			if ls_value = '1' then
				cb_2.italic = true
			else
				cb_2.italic = false
			end if
		end if
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'font_underline' )
		if ls_value = '?' or ls_value = '!' then ls_value = ''
		if not isnull(ls_value) and ls_value <> '' then 
			if ls_value = '1' then
				cb_2.underline = true
			else
				cb_2.underline = false
			end if
		end if
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'x' )
		if not isnull(ls_value) and ls_value <> '' then cb_2.x = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'y' )
		if not isnull(ls_value) and ls_value <> '' then cb_2.y = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'width' )
		if not isnull(ls_value) and ls_value <> '' then cb_2.width = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'height' )
		if not isnull(ls_value) and ls_value <> '' then cb_2.height = long(ls_value)
	case 'version label'
		ls_parm = 'splash_version_label_'
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'color' )
		if not isnull(ls_value) and ls_value <> '' then st_version.textcolor = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'bk_color' )
		if not isnull(ls_value) and ls_value <> '' then st_version.backcolor = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'font_face' )
		if ls_value = '?' or ls_value = '!' then ls_value = ''
		if not isnull(ls_value) and ls_value <> '' then st_version.facename = ls_value
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'font_weight' )
		if ls_value = '?' or ls_value = '!' then ls_value = ''
		if not isnull(ls_value) and ls_value <> '' then st_version.weight = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'font_italic' )
		if ls_value = '?' or ls_value = '!' then ls_value = ''
		if not isnull(ls_value) and ls_value <> '' then 
			if ls_value = '1' then
				st_version.italic = true
			else
				st_version.italic = false
			end if
		end if
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'font_underline' )
		if ls_value = '?' or ls_value = '!' then ls_value = ''
		if not isnull(ls_value) and ls_value <> '' then 
			if ls_value = '1' then
				st_version.underline = true
			else
				st_version.underline = false
			end if
		end if
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'x' )
		if not isnull(ls_value) and ls_value <> '' then st_version.x = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'y' )
		if not isnull(ls_value) and ls_value <> '' then st_version.y = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'width' )
		if not isnull(ls_value) and ls_value <> '' then st_version.width = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'height' )
		if not isnull(ls_value) and ls_value <> '' then st_version.height = long(ls_value)
	case 'remember me' //Added By Ken.Guo 2016-06-22
		ls_parm = 'splash_remember_me_'
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'color' )
		if not isnull(ls_value) and ls_value <> '' then cbx_remember.textcolor = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'bk_color' )
		if not isnull(ls_value) and ls_value <> '' then cbx_remember.backcolor = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'font_face' )
		if ls_value = '?' or ls_value = '!' then ls_value = ''
		if not isnull(ls_value) and ls_value <> '' then cbx_remember.facename = ls_value
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'font_weight' )
		if ls_value = '?' or ls_value = '!' then ls_value = ''
		if not isnull(ls_value) and ls_value <> '' then cbx_remember.weight = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'font_italic' )
		if ls_value = '?' or ls_value = '!' then ls_value = ''
		if not isnull(ls_value) and ls_value <> '' then 
			if ls_value = '1' then
				cbx_remember.italic = true
			else
				cbx_remember.italic = false
			end if
		end if
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'font_underline' )
		if ls_value = '?' or ls_value = '!' then ls_value = ''
		if not isnull(ls_value) and ls_value <> '' then 
			if ls_value = '1' then
				cbx_remember.underline = true
			else
				cbx_remember.underline = false
			end if
		end if
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'x' )
		if not isnull(ls_value) and ls_value <> '' then cbx_remember.x = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'y' )
		if not isnull(ls_value) and ls_value <> '' then cbx_remember.y = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'width' )
		if not isnull(ls_value) and ls_value <> '' then cbx_remember.width = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'height' )
		if not isnull(ls_value) and ls_value <> '' then cbx_remember.height = long(ls_value)		
end choose





end subroutine

public subroutine of_encrypt_ad_pwd ();//====================================================================
// Function: of_encrypt_ad_pwd
//--------------------------------------------------------------------
// Description: Encrypt AD PWD. should add this function in this.open() event.  cannot add it in DB updating SQL script.
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:         Ken.Guo 2017-03-24
//--------------------------------------------------------------------
//Copyright (c) 2008-2016 Contract Logix, Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

String ls_pwd, ls_pwd_enc

ls_pwd = gnv_user_option.of_get_option_value('ad_verify_pwd')
If ls_pwd <> '' and not isnull(ls_pwd) Then
	ls_pwd_enc = in_encrypt.of_encrypt( ls_pwd)	
	gnv_user_option.of_set_option_value('ad_verify_pwd', '' )
	gnv_user_option.of_set_option_value('ad_verify_pwd_encrypt', ls_pwd_enc )
	gnv_user_option.of_system_save( ) 	
End If

end subroutine

on w_logon_screen.create
int iCurrent
call super::create
this.cbx_remember=create cbx_remember
this.shl_website=create shl_website
this.st_version=create st_version
this.sle_pwtestdb=create sle_pwtestdb
this.sle_pwtest=create sle_pwtest
this.cbx_1=create cbx_1
this.cb_1=create cb_1
this.cb_2=create cb_2
this.sle_user_id=create sle_user_id
this.st_1=create st_1
this.sle_password=create sle_password
this.st_2=create st_2
this.cb_11=create cb_11
this.cb_22=create cb_22
this.cb_3=create cb_3
this.rb_test=create rb_test
this.rb_tutor=create rb_tutor
this.rb_prod=create rb_prod
this.p_1=create p_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cbx_remember
this.Control[iCurrent+2]=this.shl_website
this.Control[iCurrent+3]=this.st_version
this.Control[iCurrent+4]=this.sle_pwtestdb
this.Control[iCurrent+5]=this.sle_pwtest
this.Control[iCurrent+6]=this.cbx_1
this.Control[iCurrent+7]=this.cb_1
this.Control[iCurrent+8]=this.cb_2
this.Control[iCurrent+9]=this.sle_user_id
this.Control[iCurrent+10]=this.st_1
this.Control[iCurrent+11]=this.sle_password
this.Control[iCurrent+12]=this.st_2
this.Control[iCurrent+13]=this.cb_11
this.Control[iCurrent+14]=this.cb_22
this.Control[iCurrent+15]=this.cb_3
this.Control[iCurrent+16]=this.rb_test
this.Control[iCurrent+17]=this.rb_tutor
this.Control[iCurrent+18]=this.rb_prod
this.Control[iCurrent+19]=this.p_1
end on

on w_logon_screen.destroy
call super::destroy
destroy(this.cbx_remember)
destroy(this.shl_website)
destroy(this.st_version)
destroy(this.sle_pwtestdb)
destroy(this.sle_pwtest)
destroy(this.cbx_1)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.sle_user_id)
destroy(this.st_1)
destroy(this.sle_password)
destroy(this.st_2)
destroy(this.cb_11)
destroy(this.cb_22)
destroy(this.cb_3)
destroy(this.rb_test)
destroy(this.rb_tutor)
destroy(this.rb_prod)
destroy(this.p_1)
end on

event open;call super::open;integer setprod
integer li_testbox
string pspath
String ls_dev
blob lb_splash_pic
string ls_original_dev_setting
Boolean	lb_ReLogin
string ls_control[] = {'User Name Label','User Name','Password Label','Password','Button OK','Button Cancel','Version Label', 'Remember Me'}
long ll_cnt

//in_encrypt = create n_cst_encrypt
//Added By Ken.Guo 2016-06-16
inv_ad = create n_cst_ad  
inv_systeminfo = create n_cst_systeminfo

 lb_ReLogin = gf_get_relogin_status( )//added by gavins 20130515

is_version = ProfileString(gs_IniFilePathName, "Setup", "GraphAngle", "None")
gs_odbc = ProfileString(gs_IniFilePathName, "Setup", "odbc", "None")

//Start Code Change ---- 12.21.2005 #172 maha
pspath = gs_IniFilePathName

ls_original_dev_setting = ProfileString(pspath, "setup", "development", "None")
// set the development to 2 so that it will pop up
//SetProfileString(pspath,"setup", "development", "2")
// reset to defauly
ls_dev = ProfileString(pspath, "setup", "development", "None")
// reset 
//SetProfileString(pspath,"setup", "development", ls_original_dev_setting)
//maha 122105

//--------------------------- APPEON BEGIN ---------------------------
//$<Modify> 2008-03-14 By: Scofield
//$<Reason> Init gi_support_pw_on variable.

//if integer(ls_dev) > 0 then
//	gi_support_pw_on = 1 //maha 032806
//end if

ls_dev = ProfileString(gs_IniFilePathName, "setup", "development", "None")
if Integer(ls_dev) > 0 then
	gi_support_pw_on = 0		//Turn off password protect,developer don't need password
else
	gi_support_pw_on = 1		//Turn on password protect,general user need password
end if
//---------------------------- APPEON END ----------------------------


if integer(ls_dev) = 1 or integer(ls_dev) = 3 then	
	
	//open (w_database_type)
	//gs_dbtype =  message.stringparm
	gs_dbtype = "SQL"
	
	if gs_dbtype = "ASA" then
		gs_odbc = "IntelliCred Client"
//		RegistrySet("HKEY_LOCAL_MACHINE\SOFTWARE\ODBC\ODBC.INI\ODBC Data Sources", "IntelliCred Client", RegString!, "SQL Server")
//    RegistrySet("HKEY_LOCAL_MACHINE\SOFTWARE\ODBC\ODBC.INI\IntelliCred Client", "Driver", RegString!, "C:\PROGRAM FILES\SYBASE\SQL ANYWHERE 7\WIN32\dbodbc7.dll")
//    RegistrySet("HKEY_LOCAL_MACHINE\SOFTWARE\ODBC\ODBC.INI\IntelliCred Client", "autostop", RegString!, "Y")
//		RegistrySet("HKEY_LOCAL_MACHINE\SOFTWARE\ODBC\ODBC.INI\IntelliCred Client", "CommBufferSize", RegString!, "8192")
//		RegistrySet("HKEY_LOCAL_MACHINE\SOFTWARE\ODBC\ODBC.INI\IntelliCred Client", "CommBufferSpace", RegString!, "32")
//		RegistrySet("HKEY_LOCAL_MACHINE\SOFTWARE\ODBC\ODBC.INI\IntelliCred Client", "CommLinks", RegString!, "SharedMemory,TCPIP{}")
//		RegistrySet("HKEY_LOCAL_MACHINE\SOFTWARE\ODBC\ODBC.INI\IntelliCred Client", "Debug", RegString!, "NO")
//		RegistrySet("HKEY_LOCAL_MACHINE\SOFTWARE\ODBC\ODBC.INI\IntelliCred Client", "DisableMultiRowFetch", RegString!, "NO")
//		RegistrySet("HKEY_LOCAL_MACHINE\SOFTWARE\ODBC\ODBC.INI\IntelliCred Client", "EngineName", RegString!, "appeon")
//		RegistrySet("HKEY_LOCAL_MACHINE\SOFTWARE\ODBC\ODBC.INI\IntelliCred Client", "Integrated", RegString!, "NO")
//		RegistrySet("HKEY_LOCAL_MACHINE\SOFTWARE\ODBC\ODBC.INI\IntelliCred Client", "PrefetchBuffer", RegString!, "256")
//		RegistrySet("HKEY_LOCAL_MACHINE\SOFTWARE\ODBC\ODBC.INI\IntelliCred Client", "PWD", RegString!, "sql")
//		RegistrySet("HKEY_LOCAL_MACHINE\SOFTWARE\ODBC\ODBC.INI\IntelliCred Client", "UID", RegString!, "dba")
		
	elseif gs_dbtype = "SQL" then
		// trusted connection
       // RegistrySet("HKEY_LOCAL_MACHINE\SOFTWARE\ODBC\ODBC.INI\ODBC Data Sources", "IntelliCred Client SQL", RegString!, "SQL Server")
//      RegistrySet("HKEY_LOCAL_MACHINE\SOFTWARE\ODBC\ODBC.INI\IntelliCred Client SQL", "Driver", RegString!, "C:\\WINNT\\System32\\SQLSRV32.dll")
//      RegistrySet("HKEY_LOCAL_MACHINE\SOFTWARE\ODBC\ODBC.INI\IntelliCred Client SQL", "Server", RegString!, "DELL5\INTELLISOFT")
        //RegistrySet("HKEY_LOCAL_MACHINE\SOFTWARE\ODBC\ODBC.INI\IntelliCred Client SQL", "Trusted_connection", RegString!, "Y")
			// not trusted connection
		   string ls_titlefont
         RegistryGet( "HKEY_LOCAL_MACHINE\SOFTWARE\ODBC\ODBC.INI\IntelliCred Client SQL", "Database", RegString!, ls_titlefont)
			
		   if len(ls_titlefont) < 1 then  
			  RegistrySet("HKEY_LOCAL_MACHINE\SOFTWARE\ODBC\ODBC.INI", "IntelliCred Client SQL", RegString!, "SQL Server")
			  RegistrySet("HKEY_LOCAL_MACHINE\SOFTWARE\ODBC\ODBC.INI\IntelliCred Client SQL", "Driver", RegString!, "C:\WINDOWS\system32\SQLSRV32.dll")
			  RegistrySet("HKEY_LOCAL_MACHINE\SOFTWARE\ODBC\ODBC.INI\IntelliCred Client SQL", "Server", RegString!, "DELL5\INTELLISOFT")
			  RegistrySet("HKEY_LOCAL_MACHINE\SOFTWARE\ODBC\ODBC.INI\IntelliCred Client SQL", "Database", RegString!, "Intellicred") 
			  RegistrySet("HKEY_LOCAL_MACHINE\SOFTWARE\ODBC\ODBC.INI\IntelliCred Client SQL", "LastUser", RegString!, "dba")
		end if 
	
	gs_odbc = "IntelliCred Client SQL"

	else
		gs_dbtype = ""
	end if
end if
//End Code Change---12.21.2005 

if gs_odbc = "None" then gs_odbc = "Intellicred Client"
//messagebox("gs_odbc",gs_odbc)
//If GraphAngle = 50 then its a IntelliCred SE install
IF is_version = "50" THEN
	sle_user_id.Visible = False
	st_1.Visible = False
	sle_user_id.Text = "SE"
	sle_password.SetFocus()
END IF

If Not lb_ReLogin Then //added by gavins 20130515

	IF of_logon() = -1 THEN
		is_mess = "DB Error"
		w_logon_screen.triggerevent(close! )
	//CloseWithReturn( Parent, is_mess )
	
		Return
	END IF
End If


//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 01.16.2006 By: Cao YongWang
//$<reason> Performance tuning.
//$<modification> Integrate the SQL statements that retrieve data from the database into Appeon Queue labels to reudce 
//$<modification> client-server interactions for performance tuning.
/*
select set_24 into :li_testbox from icred_settings; //maha123102
select set_9 into :setprod from icred_settings; //maha031705
*/
SetNull(setprod	)	//Added By Mark Lee 12/29/2014
gnv_appeondb.of_startqueue()
select set_24 into :li_testbox from icred_settings; //maha123102
select set_9 into :setprod from icred_settings; //maha031705
select login_lockout into :ii_lock_num from security_settings; //Start Code Change ---- 08.02.2007 #V7 maha
gnv_appeondb.of_commitqueue()
//---------------------------- APPEON END ----------------------------
if isnull(ii_lock_num) then ii_lock_num = 0  //Start Code Change ---- 08.02.2007 #V7 maha

//Begin - Modified By Mark Lee 12/29/2014 modify the intelliApp Logon And IntelliCred Logon .
//if setprod = 1 then
//	this.title = "IntelliApp Logon"
//	p_1.picturename= "IntelliApp-Splash.gif" 
//	
////--------------------------- APPEON BEGIN ---------------------------
////$<add> 2007-01-17 By: Rodger Wu
//elseif setprod = 4 then
//	this.title = "Contract Logix Logon"
//	p_1.picturename= "Contract-Splash.gif" 
////---------------------------- APPEON END ----------------------------
//	of_IntelliContractLayout() //Add by Evan 11/10/2008
//else
//	this.title = "IntelliCred Logon"
//	p_1.picturename= "IntelliCred-Splash.gif"
//end if
If isnull(setprod) or  setprod = 4 then 
	this.title = "Contract Logix Logon"
	p_1.picturename= "Contract-Splash.gif" 
	of_IntelliContractLayout() 
elseif setprod = 1 then
	this.title = "IntelliApp Logon"
	p_1.picturename= "IntelliApp-Splash.gif" 
else
	this.title = "IntelliCred Logon"
	p_1.picturename= "IntelliCred-Splash.gif"
end if
//End - Modified By Mark Lee 12/29/2014


lb_splash_pic=of_get_pic_fromdb()
if not isnull(lb_splash_pic) then
	p_1.originalsize=false
	p_1.width=3749
	p_1.height=2400
	p_1.setpicture(lb_splash_pic)
end if

Choose CASE li_testbox //maha 030805
	case 0
		rb_test.visible = false
		rb_tutor.visible = false
		rb_prod.visible = false
	case 1
		rb_test.visible = true
		rb_tutor.visible = false
		rb_prod.visible = true
	case 2
		rb_test.visible = false
		rb_tutor.visible = true
		rb_prod.visible = true
	case 3
		rb_test.visible = true
		rb_tutor.visible = true
		rb_prod.visible = true
end choose

//BEGIN---Modify by Evan 11/11/2008
//st_version.text = "Product Version " + gs_version
st_version.text = gnv_app.of_GetVersionLabel()
//END---Modify by Evan 11/11/2008


If Not lb_ReLogin Then //added by gavins 20130515
	IF ls_dev = "1" THEN
		SQLCA.DBMS="ODBC"
		if gi_test_database = 1 then
			SQLCA.DbParm="ConnectString='DSN=IntelliCred Test;UID=master;PWD=" + SUPER_MASTER_PASSWORD + ";',DelimitIdentifier='Yes'"
		else
			SQLCA.DbParm="ConnectString='DSN=" + gs_odbc + ";UID=master;PWD=" + SUPER_MASTER_PASSWORD + ";',DisableBind=1,DelimitIdentifier='Yes',ConnectOption='SQL_DRIVER_CONNECT,SQL_DRIVER_NOPROMPT'"
		end if
	
		SQLCA.AutoCommit = TRUE
		gs_user_ID = "MASTER"
		gs_password = SUPER_MASTER_PASSWORD
	
		//--------------------------- APPEON BEGIN ---------------------------
		//$< Add  > 2007-09-14 By: Scofield
		//$<Reason> Set the connection cache dynamically on Web
		if AppeonGetClientType() = 'WEB' then
			SQLCA.DBMS = gs_CacheType
			SQLCA.DBParm = gs_CacheSet
		end if
		//---------------------------- APPEON END ----------------------------
	
		CONNECT USING SQLCA;
		gnv_app.of_setuserid( "MASTER" )
		is_mess = gs_user_id
		of_log_connection('PASS')
		w_logon_screen.triggerevent(close! )
		Return //Added By Ken.Guo 06/05/2014
	elseif ls_dev = "2"  or ls_dev = "3" THEN
		sle_user_id.text = "user1"
		sle_password.text = "123"
	END IF
	
	String ls_password
	
	gs_user_id = 'MASTER'
	gnv_app.of_setuserid( gs_user_id )
	ls_password = SUPER_MASTER_PASSWORD
End If

//Added By Ken.Guo 09/15/2014. load color settings.
If sqlca.sqlcode = 0 Then
//	of_load_color_settings()	
	//Added By Jay Chen 03-18-2016
	for ll_cnt = 1 to upperbound(ls_control)
		of_load_property(ls_control[ll_cnt])
	next
End If

//Added By Ken.Guo 2016-09-26
If Not isvalid(gnv_user_option) Then 
	gnv_user_option = Create n_cst_user_option  
	gnv_user_option.of_system_retrieve( ) 
End If

//Added By Ken.Guo 2017-03-24 Task 753
of_encrypt_ad_pwd()

//Added By Ken.Guo 2016-06-17. Use AD auto Login. if open from saml, then need not AD login.
String ls_ad_pc_domainname, ls_ad_pc_username, ls_shortdomainname
String ls_ad_server, ls_ad_user, ls_ad_password,ls_passorg, ls_error
Integer li_ad_save_pwd, li_ad_status,li_disabled_status_user
If Not gb_ad_command_off and Not lb_ReLogin and gs_verifycode = '' and (gnv_user_option.of_get_option_value('allow_ad_function') = '1'  )Then
	ls_ad_pc_domainname = inv_systeminfo.of_get_domaindnsname( )
	ls_shortdomainname = inv_systeminfo.of_get_domainname( )
	gnv_debug.of_output(False, 'domaindnsname='+ls_ad_pc_domainname)
	If ls_ad_pc_domainname <> '' Then		
		ls_ad_pc_username = inv_systeminfo.of_get_username( )
		select Top 1 user_id, disabled_status, ad_server, ad_user, ad_password, ad_save_pwd, ad_status  
		into :is_user_id, :li_disabled_status_user,:ls_ad_server, :ls_ad_user, :ls_ad_password,:li_ad_save_pwd, :li_ad_status from security_users 
		where ad_user = :ls_ad_pc_username or ad_user = :ls_ad_pc_domainname + '\' + :ls_ad_pc_username or ad_user = :ls_shortdomainname + '\' + :ls_ad_pc_username ;
		If sqlca.sqlcode = 0 and li_ad_status = 1 and (li_disabled_status_user = 0 or isnull(li_disabled_status_user))  Then
			cbx_remember.visible = True
			st_1.text = 'Domain\User'
			If st_1.width < 450 then st_1.width = 450
			If li_ad_save_pwd = 1 Then
				cbx_remember.checked = True
				ls_passorg = in_encrypt.of_decrypt( ls_ad_password)
				If inv_ad.of_connect_ad( ls_ad_pc_domainname, ls_ad_pc_username, ls_passorg, ref ls_error, True, True) = 0 Then
					gs_user_id = is_user_id
					sle_user_id.text = ls_shortdomainname + '\' + ls_ad_pc_username
					sle_user_id.displayonly = True
					sle_user_id.backcolor = RGB(192,192,192)				
					sle_password.text = '******'
					ib_ad_autologin = True
					gb_ad_login = True
					Post Sleep(1)  //For displaying logo.
					cb_11.Post event clicked( )
					Return
				Else
					sle_user_id.text = ls_shortdomainname + '\' + ls_ad_pc_username
					sle_user_id.displayonly = True
					sle_user_id.backcolor = RGB(192,192,192)		
					sle_password.setfocus()
				end If
			Else
				sle_user_id.text = ls_shortdomainname + '\' + ls_ad_pc_username
				sle_user_id.displayonly = True
				sle_user_id.backcolor = RGB(192,192,192)	
				sle_password.setfocus()
			End If
		Else
		End If
	End If
End If

// SAML SSO Auto Login   -- by Jimmy Lee 04/17/2014
int li_hascolumns = 0
select  1 into :li_hascolumns 
	from syscolumns c, sysobjects t 
	where c.id=t.id and c.name='use_saml' and t.name='icred_settings' and t.type = 'U' using sqlca;
if li_hascolumns = 1 then
	select  1 into :li_hascolumns 
	from syscolumns c, sysobjects t 
	where c.id=t.id and c.name='only_saml_user' and t.name='icred_settings' and t.type = 'U' using sqlca;
end if

if li_hascolumns = 1 then
	select top 1 use_saml, only_saml_user 
	into :is_use_saml, :is_only_saml_user
		from icred_settings using sqlca;
end if

if isnull(is_use_saml) then is_use_saml = "0"
if isnull(is_only_saml_user) then is_only_saml_user = "0"

if is_use_saml <> "1" then
	return
end if

if gs_verifycode<>"" and is_use_saml <> "1" then
	MessageBox("SAML Error","SAML setting error , please enable SAML function at 'System->Painters->User Painter->SAML' ")
	return
end if

if gs_idpname<>"" and gs_verifycode<>"" and AppeonGetClientType() = 'WEB' then
	SQLCA.DBMS="ODBC"
	if gi_test_database = 1 then
		SQLCA.DbParm="ConnectString='DSN=IntelliCred Test;UID=master;PWD=" + SUPER_MASTER_PASSWORD + ";',DelimitIdentifier='Yes'"
	else
		SQLCA.DbParm="ConnectString='DSN=" + gs_odbc + ";UID=master;PWD=" + SUPER_MASTER_PASSWORD + ";',DisableBind=1,DelimitIdentifier='Yes',ConnectOption='SQL_DRIVER_CONNECT,SQL_DRIVER_NOPROMPT'"
	end if

	SQLCA.AutoCommit = TRUE
	

	//--------------------------- APPEON BEGIN ---------------------------
	//$< Add  > 2007-09-14 By: Scofield
	//$<Reason> Set the connection cache dynamically on Web
	
	SQLCA.DBMS = gs_CacheType
	SQLCA.DBParm = gs_CacheSet
	
	//---------------------------- APPEON END ----------------------------

	CONNECT USING SQLCA;
	datetime ldt_validetime, ldt_utcnow
	string ls_mapping_user = ""
	int li_disabled_status = 0;
	select top 1 getutcdate(), idpuser_validetime, map_user_id 
	into :ldt_utcnow, :ldt_validetime, :ls_mapping_user 
	from idp_users 
	where  app_verifycode = :gs_verifycode  using sqlca;
	
	if IsNull(ls_mapping_user)  or ls_mapping_user = "" then
		MessageBox("SAML Error","Can not find a mapped user to login")
		return
	else
		select 1 into :li_hascolumns 
			from syscolumns c, sysobjects t 
			where c.id=t.id and c.name='disabled_status' and t.name='security_users' and t.type = 'U' using sqlca;
		if li_hascolumns = 1 then
			select top 1 disabled_status into :li_disabled_status 
				from security_users 
				where  user_id = :ls_mapping_user  using sqlca;
		end if	
		if li_disabled_status = 1 then
			MessageBox("SAML Error","Login failure,the account '" + ls_mapping_user + "' is disabled.")
			return
		end if
		
		if ldt_utcnow > ldt_validetime then
			MessageBox("SAML Error","Verify code is not validate.")
			return
		end if
	end if
	gs_user_ID = ls_mapping_user
	//gs_password = SUPER_MASTER_PASSWORD
	gnv_app.of_setuserid(ls_mapping_user)
	is_mess = gs_user_id
	of_log_connection('PASS')
	
	gs_idpname = "" 
//	gs_verifycode = ""
	w_logon_screen.triggerevent(close! )
	Return //Added By Ken.Guo 2016-06-17
end if



end event

event closequery;call super::closequery;if is_mess = "" then is_mess = "Cancel"
end event

event close;call super::close;If isvalid(inv_ad) Then Destroy inv_ad  //Added By Ken.Guo 2016-06-16
If isvalid(inv_systeminfo) then Destroy inv_systeminfo //Added By Ken.Guo 2016-06-17
CloseWithReturn( this, is_mess )
end event

event key;call super::key;

IF KeyDown(KeyF12!) THEN
	cbx_1.visible = true
end if 
end event

event pfc_postopen;call super::pfc_postopen;//--------------------------- APPEON BEGIN ---------------------------
//$<add> 10/09/2007 By: Ken.Guo
//$<reason> Auto login if use LDAP user

String ls_user_id


If Not gf_Get_ReLogin_Status( ) and not sle_user_id.displayonly Then //added by gavins 20130515 //Modified By Ken.Guo 2016-06-22
	//Get auto login user ID if need.
	ls_user_id = of_get_autologinname()
	If ls_user_id <> '' Then
		sle_user_id.text = ls_user_id
		sle_user_id.displayonly = True
		sle_password.text = '********'
		sle_password.displayonly = True
		Post Sleep(1)  //For displaying logo.
		cb_11.post event CLICKED()	
	Else
		//Get Last login User ID
		//Modified By Ken.Guo 2016-11-17
		//ls_user_id = ProfileString(gs_IniFilePathName, "Setup", "UserID", "")
		If gb_rdsh Then
			ls_user_id = ProfileString(gs_rdsh_IniFile, "Setup", "UserID", "")
		Else
			ls_user_id = ProfileString(gs_IniFilePathName, "Setup", "UserID", "")
		End If				
		
		If ls_user_id <> '' Then
			sle_user_id.text = ls_user_id
			sle_password.Post SetFocus()
		Else
			sle_user_id.Post setfocus( )
		End If
	End If
End If
//---------------------------- APPEON END ----------------------------

//Added By Ken.Guo 2016-06-24. If AD account is disabled, then clear the user name.
String ls_user,ls_domainuser,ls_ad_pc_domainname,ls_shortdomainname
Integer li_user_cnt, li_ad_status=100
ls_ad_pc_domainname = inv_systeminfo.of_get_domaindnsname( )
ls_shortdomainname = inv_systeminfo.of_get_domainname( )
If not gb_ad_login Then
	ls_user = sle_user_id.text
	If lastpos(ls_user,'\') > 0 Then
		ls_domainuser = Mid(ls_user, lastpos(ls_user,'\') + 1 , Len(ls_user))
	Else
		ls_domainuser = ls_user
	End If		
	gnv_appeondb.of_startqueue( )
		select count(1) into :li_user_cnt from security_users where user_id = :ls_user;
		select ad_status into :li_ad_status from security_users 
			where ad_user = :ls_domainuser or ad_user = :ls_user or ad_user = :ls_ad_pc_domainname + '\' + :ls_domainuser or ad_user = :ls_shortdomainname + '\' + :ls_domainuser ;
	gnv_appeondb.of_commitqueue( )
	If li_user_cnt > 0 Then Return //It is a CL Account.
	If isvalid(gnv_user_option) Then //Added By Ken.Guo 2016-10-21
		If gnv_user_option.of_get_option_value('allow_ad_function') = '0'  or (li_ad_status = 0 or isnull(li_ad_status))  Then //It is Ad ccount, and AD status is turned off.
			sle_user_id.text = ''
			sle_user_id.post setfocus()
		End If 
	End If
End If
If gb_ad_command_off Then
	sle_user_id.text = ''
	sle_user_id.post setfocus()
End If
end event

type cbx_remember from checkbox within w_logon_screen
boolean visible = false
integer x = 1161
integer y = 1660
integer width = 475
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Remember me"
end type

type shl_website from statichyperlink within w_logon_screen
boolean visible = false
integer x = 1422
integer y = 2600
integer width = 1682
integer height = 68
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string pointer = "HyperLink!"
long backcolor = 67108864
boolean enabled = false
boolean focusrectangle = false
end type

type st_version from statictext within w_logon_screen
integer x = 55
integer y = 2304
integer width = 3579
integer height = 84
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Bodoni MT"
boolean italic = true
long backcolor = 67108864
string text = "Product Version"
alignment alignment = center!
boolean focusrectangle = false
end type

event constructor;this.backcolor = INTELLI_PURPLE
this.textcolor = INTELLI_orange

//BEGIN---Add by Evan 11/11/2008
//this.Move(64, 1240)
//this.Resize(1193, 236)
//END---Add by Evan 11/11/2008
end event

type sle_pwtestdb from singlelineedit within w_logon_screen
boolean visible = false
integer x = 3291
integer y = 2192
integer width = 343
integer height = 80
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
end type

type sle_pwtest from singlelineedit within w_logon_screen
boolean visible = false
integer x = 3296
integer y = 2088
integer width = 343
integer height = 80
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
string text = "log"
borderstyle borderstyle = stylelowered!
end type

type cbx_1 from checkbox within w_logon_screen
boolean visible = false
integer x = 1376
integer y = 2000
integer width = 754
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "ODBC Trace"
end type

event clicked;

DISCONNECT USING SQLCA;
IF THIS.CHECKed = TRUE THEN 
		SQLCA.DBMS="TRACE ODBC"
	Else 
		
		SQLCA.DBMS="ODBC"
END IF 


SQLCA.DBParm     = "ConnectString='DSN=" + gs_odbc + ";UID=dba;PWD=sql',DisableBind=1,PBUseProcOwner='Yes',RPCReBind=1,MsgTerse='Yes', " + & 
																	"DelimitIdentifier='Yes',ConnectOption='SQL_DRIVER_CONNECT,SQL_DRIVER_NOPROMPT ',"+ & 
																	"PBTrimCharColumns='Yes',PBMaxBlobSize = '2147483647' ,PBMaxTextSize = '2147483647'"    
												

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
	MessageBox("Login", "Inital Login Failed!  Check your ODBC configuration")
	Return -1
END IF

Return 1
end event

type cb_1 from statictext within w_logon_screen
event lbuttondown pbm_lbuttondown
event lbuttonup pbm_lbuttonup
integer x = 1371
integer y = 1572
integer width = 352
integer height = 92
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string pointer = "HyperLink!"
long textcolor = 33554432
long backcolor = 67108864
string text = "&OK"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

event lbuttondown;cb_1.borderstyle = StyleLowered!
end event

event lbuttonup;cb_1.borderstyle = StyleRaised!
end event

event clicked;

cb_11.TRIGGERevent( CLICKED!)
end event

event constructor;//this.backcolor = rgb(0,255,0)
//THIS.textcolor = rgb(0,0,0)

//this.backcolor = intelli_grey
//THIS.textcolor = INTELLI_black
this.backcolor = INTELLI_PURPLE
THIS.textcolor = INTELLI_ORANGE
end event

type cb_2 from statictext within w_logon_screen
event lbuttondown pbm_lbuttondown
event lbuttonup pbm_lbuttonup
integer x = 1733
integer y = 1572
integer width = 352
integer height = 92
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string pointer = "HyperLink!"
long textcolor = 33554432
long backcolor = 67108864
string text = "&Cancel"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

event lbuttondown;cb_2.borderstyle = StyleLowered!
end event

event lbuttonup;cb_2.borderstyle = StyleRaised!
end event

event clicked;is_mess = "Cancel"
w_logon_screen.triggerevent(close! )
//CloseWithReturn( Parent, is_mess )
end event

event constructor;this.backcolor = INTELLI_PURPLE
THIS.textcolor = INTELLI_ORANGE

//this.backcolor = rgb(255,0,0)
//THIS.textcolor = rgb(0,0,0)
end event

type sle_user_id from singlelineedit within w_logon_screen
integer x = 1371
integer y = 1296
integer width = 713
integer height = 84
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event modified;//gs_user_id = This.Text
//DataWindowChild dwchild
//
//dwchild.SetTransObject( SQLCA )
//dwchild.Retrieve( gs_user_id )
//
//
//
//
//
//
end event

type st_1 from statictext within w_logon_screen
integer x = 1371
integer y = 1232
integer width = 343
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "User ID"
boolean focusrectangle = false
end type

event constructor;this.backcolor = INTELLI_PURPLE
THIS.textcolor = INTELLI_orange
end event

type sle_password from singlelineedit within w_logon_screen
integer x = 1371
integer y = 1464
integer width = 709
integer height = 84
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean password = true
borderstyle borderstyle = stylelowered!
end type

event getfocus;this.text = ""
end event

type st_2 from statictext within w_logon_screen
integer x = 1371
integer y = 1400
integer width = 325
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Password"
boolean focusrectangle = false
end type

event constructor;this.backcolor = INTELLI_PURPLE
THIS.textcolor = INTELLI_orange
end event

type cb_11 from u_cb within w_logon_screen
integer x = 3831
integer y = 1412
integer height = 84
integer taborder = 30
boolean bringtotop = true
string text = "&OK"
boolean default = true
end type

event clicked;//maha 112105 major functionality change to connect via DBA.  

String ls_password
integer li_user
integer li_set7
date ld_password
datetime ldt_lock //Start Code Change ---- 08.02.2007 #V7 maha
integer li_days
integer li_res
integer li_lock //Start Code Change ---- 08.02.2007 #V7 maha
time lt_time
Boolean	lb_ReLogin

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 06/04/2014 By: Jimmy
//$<reason> Only SAML user can login

//if is_use_saml = "1" and is_only_saml_user = "1" and upper(gs_user_id) <> "MASTER" and AppeonGetClientType() = 'WEB' then//Commented By Jay 2016-05-06
if is_use_saml = "1" and is_only_saml_user = "1" and upper(sle_user_id.Text) <> "MASTER" and AppeonGetClientType() = 'WEB' then //Modified By Jay 2016-05-06
	messagebox("Login Error","Only SAML user account allow to using this program.")
	return -1
end if
//---------------------------- APPEON END ----------------------------

//maha 112105 major functionality change connection using dba for all connections

IF IsNull( sle_user_id.Text ) OR sle_user_id.Text = "" THEN
	MessageBox("Required Field", "You must enter a user name." )
	sle_user_id.setfocus()//maha 080300
	Return -1
END IF

IF IsNull( sle_password.Text ) OR sle_password.Text = "" THEN
	MessageBox("Required Field", "You must enter a password." )
	sle_password.setfocus()//maha 080300
	Return -1
END IF
lb_ReLogin = gf_Get_ReLogin_Status( )
If Not lb_ReLogin Then //added by gavins 20130515
	gs_user_id = sle_user_id.Text
	
	gnv_app.of_setuserid( gs_user_id )
End If
gs_password = sle_password.Text
ls_password = sle_password.Text

IF ls_password = "IntelliMasterSE" THEN
	sle_user_id.Visible = True
	st_1.Visible = True
	sle_password.Text = ""
	sle_user_id.Text = ""
	Return 1
END IF


If Not lb_ReLogin Then //added by gavins 20130515
	if rb_test.checked = true  then //maha 123102
		gi_test_database = 1
	elseif rb_tutor.checked = true then //maha 03085
		gi_test_database = 2
	else  //production database
		gi_test_database = 0
	end if
	
	
	if gi_test_database > 0 then
		DISCONNECT USING SQLCA;
		li_res = of_connection()
		if li_res = -1 then
			halt
		end if
	end if
End If

//Added By chenjian 2013-09-11
int li_disabled_status, 	li_role_id
string ls_user
ls_user = trim(sle_user_id.text)
If Not gb_ad_login Then //Added By Ken.Guo 2016-06-24 added if statement.
	select disabled_status, role_id into :li_disabled_status, :li_role_id from security_users where lower(user_id) = lower(:ls_user);
	if li_disabled_status = 1 then
		messagebox("Login Error","This Account is disabled. ")
	//	sle_user_id.text = ''
		sle_password.text = ''
		return
	end if
	
	//Added By Mark Lee 03/09/2015
	if li_role_id = -100 then
		messagebox("Failed to login","This is a user under Requester role and you cannot log into ContractLogix with this user. ")
	//	sle_user_id.text = ''
		sle_password.text = ''
		return
	end if 
End If


//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 11/19/2007 By: Ken.Guo
//$<reason> LDAP user need auto login
//li_res = of_user_login( il_attempts)
If ib_ad_autologin Then //Added By Ken.Guo 2016-06-17
	li_res = of_user_login( il_attempts)
ElseIf gb_autologin and lb_ReLogin Then //Modified by gavins 20160229  bug: after auto login , anyone can login.
		//Use intellicred user login
	li_res = of_user_login( il_attempts)
ElseIf gb_autologin = True Then
	//Use LDAP user login
	gs_user_id = sle_user_id.text
	li_res = 1
Else 
	//Use intellicred user login
	li_res = of_user_login( il_attempts)
End If
//---------------------------- APPEON END ----------------------------

//Start Code Change ---- 08.02.2007 #V7 maha added changes for login locking
IF li_res = -1 THEN
	of_log_connection("FAIL")
	il_attempts ++
	IF il_attempts = 3  and ii_lock_num = 0   THEN
		messagebox("Login Error","You have reached the maximum number of attempts.  Closing Program")
		HALT
	elseif il_attempts =  ii_lock_num then //08.02.2007 #V7 maha
		of_log_connection("LOCK")
		messagebox("Login Error","You have reached the maximum number of attempts and will be locked out.  Closing Program")
		select lockout_min into :li_lock from security_settings;
		lt_time = now()
		lt_time = RelativeTime ( lt_time, li_lock  * 60 )
		ldt_lock = datetime(today(),lt_time)
		update security_users set lock_until = :ldt_lock where user_id = :gs_user_id;
		commit using sqlca;
		HALT
	ELSE  
//		if gi_test_database > 0 then //maha removed 8.2.07 should not connect to prod database if test fails
//			of_logon() //reconnect to the production database
//		end if
		Return
	END IF
elseif li_res = -5 then 
	messagebox("Login Error","This login is currently locked out.  Closing Program")
	of_log_connection("LOCK")
	HALT
//End Code Change---08.02.2007	
else //login successful
	//Modified By Ken.Guo 2016-06-17
	If ib_using_ad or ib_ad_autologin Then
		of_log_connection("PASS;" + " Use AD account:"+ sle_user_id.text)
	Else
		of_log_connection("PASS")
	End If
	
END IF

If  lb_ReLogin Then
	gs_password = sle_password.Text
	gnv_app.of_setuserid( gs_user_id )
	gs_accesstoken = ""
End If

//Start code changes - 1.4.2007 Henry. move the scrips to application open event
/*
//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 01.16.2006 By: Cao YongWang
//$<reason> Performance tuning.
//$<modification> Integrate the SQL statements that retrieve data from the database into Appeon Queue labels to reudce 
//$<modification> client-server interactions for performance tuning.
gnv_appeondb.of_startqueue()
gnv_data.of_retrieve('icred_settings') //cache data for icred_settings table
gnv_data.of_retrieve('security_users') //cache data for security_users table
gnv_data.of_retrieve('ids')				//cache data for ids table
gnv_data.of_retrieve('sys_tables')				//cache data for sys_tables table
gnv_data.of_retrieve('code_lookup')				//cache data for code_lookup table
gnv_data.of_retrieve('ctx_notification')				//cache data for ctx_notification table
gnv_data.of_retrieve('sys_fields')				//cache data for sys_fields and sys_tables table
gnv_data.of_retrieve('facility')				//cache data for facility table
gnv_data.of_retrieve('data_view_screen')				//cache data for data_view_screen table
//--------------------------- APPEON BEGIN ---------------------------
//$<add> 10.12.2006 By: Jack (Inova)
//$<reason> Queue Images for Scanning from Data Entry.
gnv_data.of_retrieve('image_type')				//cache data for image_type table	
//---------------------------- APPEON END ----------------------------

gnv_data.of_retrieve('code_lookup_2') //Added 11.30.2006 henry
	
//Added for work flow. 6/11/2006 Henry
gnv_data.of_retrieve('wf_workflow')	
gnv_data.of_retrieve('wf_action_types')	
gnv_data.of_retrieve('wf_action_status')	
gnv_data.of_retrieve('wf_trigger_param_data_comparison')	
gnv_data.of_retrieve('wf_trigger_param_action_status')	
//End added for work flow.
	
//$<add> 10.12.2006 By: LeiWei
IF appeongetclienttype() = 'WEB' Then
	select image_flag into :gs_image_flag from security_users where user_id = :gs_user_id;
END IF
//$<add> 10.12.2006 By: LeiWei

gnv_appeondb.of_commitqueue()
//---------------------------- APPEON END ----------------------------
*/
//End code changes - 1.4.2007 Henry
is_mess = gs_user_id

//Modified By Ken.Guo 2016-06-16
//SetProfileString(gs_IniFilePathName, "Setup", "UserID",gs_user_id)

//Modified By Ken.Guo 2016-11-14
//SetProfileString(gs_IniFilePathName, "Setup", "UserID",sle_user_id.text)
If gb_rdsh Then
	SetProfileString(gs_rdsh_IniFile, "Setup", "UserID",sle_user_id.text)
Else
	SetProfileString(gs_IniFilePathName, "Setup", "UserID",sle_user_id.text)
End If



w_logon_screen.triggerevent(close!)

end event

type cb_22 from u_cb within w_logon_screen
integer x = 3826
integer y = 1508
integer height = 84
integer taborder = 40
boolean bringtotop = true
string pointer = "HyperLink!"
string text = "Cancel"
boolean cancel = true
end type

event clicked;is_mess = "Cancel"
w_logon_screen.triggerevent(close! )
//CloseWithReturn( Parent, is_mess )
end event

event constructor;call super::constructor;//this.  backcolor =  rgb(171, 130, 255)
end event

type cb_3 from commandbutton within w_logon_screen
boolean visible = false
integer x = 3872
integer y = 1604
integer width = 91
integer height = 68
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "U1"
end type

event clicked;sle_user_id.text = "user1"
sle_password.text = "123"
cb_1.triggerevent(clicked!)
end event

type rb_test from radiobutton within w_logon_screen
integer x = 1376
integer y = 1720
integer width = 997
integer height = 84
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Connect to Test Database "
end type

event constructor;this.backcolor = INTELLI_PURPLE
THIS.textcolor = INTELLI_ORANGE
end event

type rb_tutor from radiobutton within w_logon_screen
integer x = 1376
integer y = 1904
integer width = 1079
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Connect to Tutorial Database "
end type

event constructor;this.backcolor = INTELLI_PURPLE
THIS.textcolor = INTELLI_ORANGE
end event

type rb_prod from radiobutton within w_logon_screen
integer x = 1376
integer y = 1816
integer width = 1161
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Connect to Production Database "
boolean checked = true
end type

event constructor;this.backcolor = INTELLI_PURPLE
THIS.textcolor = INTELLI_ORANGE
end event

type p_1 from picture within w_logon_screen
event lbuttondown pbm_lbuttondown
integer width = 3753
integer height = 2408
boolean originalsize = true
string picturename = "Contract-Splash.gif"
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

