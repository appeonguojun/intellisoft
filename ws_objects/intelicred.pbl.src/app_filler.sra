$PBExportHeader$app_filler.sra
forward
global type app_filler from application
end type
global n_tr sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global variables

String gs_current_version = '150' 				//Commented By Mark Lee 09/15/2014
String gs_current_version_patch = '172'		//Modified By Harry 2017-08-30 If you changed the version, please update this comments. please update this comments.
String gs_develop_version = '17.08.01'		//Modified By Ken  08/09/2017  When publish a new version, please update this variable.
Boolean gb_upgrade_failed = FALSE 			//for DB Upgrade - Alfee 01.30.2008

String gs_app_image_path 
String gs_version = "11"
String gs_build = "1" 
String gs_names[]
n_cst_appmanager   gnv_app
String gs_cust_type ="Regular"
string gs_dir_path
string gs_user_version
string gs_word_user //Alfee 07.08.2008
string gs_sqlserver_version //Added By Ken.Guo 02/22/2012. 

datastore gds_settings
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-01
//$<add> 2006-04-10 By: owen chen
//$<reason> Define the datastore for caching the data. The application obtains data directly from the datastore instead
//$<reason> of from the database.
datastore gds_lookup
//---------------------------- APPEON END ----------------------------

CONSTANT STRING SUPER_MASTER_PASSWORD = "Sbd2tCast13"

String	gs_DefDirName //= "ContractLogix"

Boolean gb_se_version = False
Integer gi_action_item_menus

Integer gi_burn_annos = 0
Integer gi_auto_search = 0
Integer gi_intelliapp_type = 0
Integer gi_app_ids[]
Integer gi_default_h = 2152
Integer gi_default_w = 3314
Integer gi_default_x = 352
Integer gi_default_y = 0
Integer gi_parent_facility
integer gi_facil_change
integer gi_cache_set
integer gi_server_id
integer gi_test_mode
integer gi_export_on
integer gi_ireport_on
integer gi_iapp_on
integer gi_test_database = 0
integer gi_scan_format = 0
integer gi_priv_mod
integer gi_case_review
integer gi_imaging
integer gi_temp_switch = 0
integer gi_dept_security
integer gi_citrix = 0
integer gi_support_pw_on
integer gi_copy_letters //maha app100705
integer gi_yield = 0 
integer gi_imageocx = 1 //1- Imaging 360; 2- new Image OCX - Alfee 05.19.2008
integer gi_wdhlink, gi_wdhlink_f //Alfee 06.27.2008
integer gi_prod_setting //Alfee 07.14.2008
integer gi_email_type //maha 10.08.08

Long gl_prac_id
Long gl_prac_ids[]
Long gl_data_view_id = 1
Long gl_facility_id
Long gl_facility_ids[]
Long gl_committee_id 

String gs_param
String gs_password
String gs_user_id
String gs_role
string gs_fil_screen
string gs_fil_batch
string gs_fil_status
string gs_odbc
string gs_letter_path //maha app100705
string gs_merge_path //maha app100705
string gs_save_path //maha 012306
string gs_application_path // mbs 08 feb 2005
string gs_mdi_title //Alfee 01.16.2008
string gs_ssnnpi //maha added for ssn seach passing on the create of a new prac

DateTime gdt_screen_cache
DateTime gdt_lookup_cache
DateTime gdt_screen_obj_cache

//Added By Mark Lee 08/03/12		SQL
//String 	gs_dbtype = "ASA"
String 	gs_dbtype = "SQL"
integer 	gi_contract_view_id
long		gl_SearchTab_View_id					//Added by Scofield on 2009-04-29

datastore gds_contract_screen

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-02
//$<add> 01.13.2006 By: Cao YongWang
// Define the variable for storing the external functions created by Appeon
n_cst_appeondll 		gnv_appeondll
// Define the variable for storing Appeon label related functions.  Applies to Web application only.
appeon_nvo_db_update gnv_appeondb
// Define the variable for the approach of "use an object to pre-select data" 
n_cst_globaldata		gnv_data
//---------------------------- APPEON END ----------------------------


//--------------------------- APPEON BEGIN ---------------------------
//$<add> 08.17.2006 By: LeiWei
//$<reason> Making the Contract Module a Standalone Product
Boolean gb_contract_version = False
Boolean gb_contract_module = False //On or off - Alfee 05.12.2008
String gs_image_flag

Boolean gb_autoresize		//Add by Gary
Boolean gb_autozoom		//add by gavins 20130104
Boolean gb_cut_autozoom
Boolean gb_PreloadCTX = False //Add by Evan 11/12/2008
String Gs_Current_Directory

w_contract gw_contract		// Add by Davis for global search
//---------------------------- APPEON END ----------------------------

//Added for work flow. 3/11/2006 Henry
Boolean gb_workflow = False

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 11.27.2006 By: Jack (Contract Logix Agreement Manager Painters)
//$<reason> Making the Agreement Manager Module a Standalone Product
Boolean gb_agreement_manager = False
//---------------------------- APPEON END ----------------------------

//Added for To Do List 7/12/2006 Allen
Boolean gb_ToDoList = False
Boolean gb_OpenToDoList = false	//12/10/2007 By Jervis

//Added for pdf to text 12/8/2006 Henry
string gs_current_path

//Added for generating pdf 1/13/2007 Henry
String 	gs_pdf_printer = "Contract Logix PDF Writer"
String	gs_pdf_temp_path = "\PDFPrinter\temp\"
String	gs_pdf_temp_filename = "SampleOut.PDF"
//End added

//--------------------------- APPEON BEGIN ---------------------------
//$<modified> 2007-04-19 By: Wu ZhiJun
//$<reason> Fix a bug
long		gl_Company_id
//--------------------------- APPEON END -----------------------------

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 04/25/2007 By: Ken.Guo
//$<reason> Added for word version. The value is 'word2000' or 'word2003' ...
//added excel version added by gavins 20120411
//Added By Mark Lee 06/20/2013	gs_word_version_num
String gs_word_version, gs_excel_version, gs_word_version_num
//---------------------------- APPEON END ----------------------------

//--------------------------- APPEON BEGIN ---------------------------
//$< Add  > 2007-08-06 By: Scofield
//$<Reason> Add a variable to store the ini file path name
String	gs_IniFilePathName
//---------------------------- APPEON END ----------------------------

//--------------------------- APPEON BEGIN ---------------------------
//$<Add  > 2007-09-14 By: Scofield
//$<Reason> Add Web cache process
String	gs_CacheName,gs_CacheType,gs_CacheSet
//---------------------------- APPEON END ----------------------------

Int gi_seq //Ken.Guo 2007-10-26 for generate Client ID for print letter 
Boolean gb_autologin //Ken.Guo 11/19/2007

String Gs_MSFax_ServerName //Ken.Guo 05/06/2008 
Integer Gi_MSFax_Number		//Ken.Guo 05/06/2008

n_logservice gnv_logservice //Alfee 01.30.2008

Boolean gb_write_log = FALSE
long gl_cache_id
n_tr CC_tansobject

n_cst_dashboard_data gnv_dashboard_data //Added by Ken.Guo 08.06.2008

String gs_session_id //Added by Ken.Guo 08.26.2008. Current session ID.
String gs_client_ip //Added by Ken.Guo 08.26.2008.
n_cst_session gnv_session //Added by Ken.Guo 08.26.2008.

Integer gi_user_readonly //Added by Ken.Guo 09.10.2008.
Integer gi_opendashboard //Added by Ken.Guo 09.10.2008.

n_cst_reg_control gnv_reg_ocx //Added by Ken.Guo 11.06.2008.
n_cst_backcolor_settings gnv_win_backcolor //Added by Evan.Cai 11.24.2008.

n_cst_debug gnv_debug //Added by Ken.Guo 12.18.2008. Only for Debugging.

Long gl_custom_colors[],gl_custom_colors_org[] //Added by Ken.Guo on 2009-01-06

long		gl_MoveToCtxID			//Added by Scofield on 2009-03-05
String	gs_MoveToTabNo			//Added by Scofield on 2009-03-05
long 		gl_MovetoDocID    	//Added by Ken.Guo 14.17.2009  
String 	gs_select_dir_path 	//Added by Ken.Guo 03.10.2009
String	gs_CurAddresser		//Added by Scofield on 2009-05-31
Boolean	gb_IsDocMode			//Added by Scofield on 2009-07-17
Boolean	gb_open_from_template = False //Added By Ken.Guo 2009-08-27.
Boolean 	gb_restore_contract_state= false	//Add by Jervis on 2009-9-10
string	gs_IniWindowState						//Add by jervis on 2009-9-10

str_email_info gstr_email_info //Added By Ken.Guo 2009-10-13.  

//Add snap to grid feature - jervis 04.30.2010
integer gi_snaptogrid_x = 1
integer gi_snaptogrid_y = 1

Boolean	gb_AutoExport			//Added by Scofield on 2010-05-18
Boolean	gb_AutoReport 			//Added By Ken.Guo 08/15/2013
Boolean	gb_AutoImport			//Added By Mark Lee 11/12/2015	

n_cst_shell gnv_shell //Added By Ken.Guo 2010-05-24.

n_cst_workflow_prompt gnv_workflow_prompt //Added By Ken.Guo 2010-06-28.
String gs_default_group_name = 'Default Group Email Alarm Template' //Added By Ken.Guo 2010-08-19.
n_cst_statusbar_info gnv_Status_Info //Added By Ken.Guo 2010-08-19.
String gs_imageview_version = '5.0' //Added By Ken.Guo 2010-09-03.
Boolean gb_ShowFullScreenButton = True //Added By Ken.Guo 2010-09-03.
Boolean gb_DocQuickView = False //Added By Ken.Guo 2010-09-07.
Long gl_unread_email_cnt = 0
n_cst_message gnv_message //Added By Ken.Guo 2010-11-12.
Boolean gb_ShowEmailErrorMessage = True //Added By Ken.Guo 2010-11-25.
Boolean gb_openwith_showtips = True //Added By Ken.Guo 2011-04-13.
n_cst_sertifi gnv_sertifi //Added By Ken.Guo 2011-05-30. 
n_cst_echosign gnv_echosign //Added By Jay Chen 09-30-2013
n_cst_rights gnv_rights //Added By Ken.Guo 2011-07-15. 
boolean gb_use_opmode = true  //added by jervis 10.11.2011
n_cst_webapprove gnv_webapprove //Added By Ken.Guo 11/23/2011. 

n_cst_string gnv_string //Added By Ken.Guo 12/31/2011. 

n_cst_user_option			gnv_user_option //add by gavins 20120215
boolean 		gb_recordlog = false						// 03/08/12 Added By mark for no prompt message with batch import files  
string 		gs_errmsg = ''								// 03/08/12 Added By mark for no prompt message with batch import files  

OleObject gole_word_instance //Added By Ken.Guo 05/14/2012. opening a word processing to improve performance.

Boolean		gb_EnableSetPosition=true //added by gavins 20120528

window gw_popup[]  //Added By Ken.Guo 07/12/2012. to workaround APB bug.

n_cst_tracking	gnv_tracking	//Added By Mark Lee 07/20/12
n_cst_word_utility		gnv_word_utility	//Added By Mark Lee 06/20/2013

Boolean			gb_show_EZMenu=True //added by gavins 20130312
string 		gs_left_title_sign = ' >| '							//Added By Mark Lee 03/22/2013
string 		gs_right_title_sign = ' |< '						//Added By Mark Lee 03/22/2013
String 		gs_copyright	=	 '2002-2015'					//Modified By Mark Lee 09/07/2015

string 		gs_accesstoken										//Add By Jimmy Lee 09/04/2013
string          gs_esigntype   //sertifi,echosign                                         //Added By Jay Chen 10-09-2013
long gl_add_ctx_id[],gl_mod_ctx_id[] //Added By Jay Chen 11-01-2013
string gs_appdata_local_path,gs_os //Added By Jay Chen 03-27-2014

long		gl_SearchTab_document_View //Added By Jay Chen 04-02-2014	
long 		gl_SearchTab_otherwin_View //Added By Jay Chen 06-09-2014
n_cst_docusign gnv_docusign //Added By Jay Chen 04-09-2014

string gs_idpname  			//Added By Jimmy Lee 04-17-2014
string gs_verifycode			//Added By Jimmy Lee 04-17-2014
boolean 		gb_prompt_emailaddress = false			//Added By Mark Lee 03/24/2015
boolean		gb_message = false							//Added By Mark Lee 03/26/2015

n_cst_filetime gnv_filetime //Added By Ken.Guo 2015-04-29

//Added By Ken.Guo 2015-07-17
String gs_wordtype
string gs_echosign_method //Added By Jay Chen 02-04-2016
Boolean gb_ad_login, gb_ad_command_off //Added By Ken.Guo 2016-06-24

Boolean gb_rdsh = False //Added By Ken.Guo 2016-11-09
String gs_rdsh_inifile //Added By Ken.Guo 2016-11-09


end variables

global type app_filler from application
string appname = "app_filler"
boolean toolbartext = true
event open_oldcode ( )
end type
global app_filler app_filler

type prototypes
function boolean   CopyFileA (ref string cfrom, ref string cto, boolean flag) library "kernel32.dll" alias for "CopyFileA;Ansi"
FUNCTION boolean BringWindowToTop(ulong w_handle) LIBRARY "User32.dll"
FUNCTION ulong FindWindowA(ulong classname,string windowname) LIBRARY "User32.dll" alias for "FindWindowA;Ansi"
FUNCTION boolean CreateDirectoryA(ref string pathname, int sa) LIBRARY "Kernel32.dll" alias for "CreateDirectoryA;Ansi"
SUBROUTINE Sleep(ulong milli) LIBRARY "Kernel32.dll"
FUNCTION long ShellExecuteA (long hwnd, string lpOperation, string lpFile, string lpParameters,  string lpDirectory, integer nShowCmd ) LIBRARY "SHELL32" alias for "ShellExecuteA;Ansi"
FUNCTION ulong SHBrowseForFolder(ref str_browseinfo lstr_browseinfo) Library"SHELL32.DLL" alias for "SHBrowseForFolder;Ansi"
FUNCTION ulong SHGetPathFromIDList(ulong idlist,ref string ls_path) Library "SHELL32.DLL" alias for "SHGetPathFromIDList;Ansi"
FUNCTION ulong IsIconic(ulong hWnd) LIBRARY "User32.dll"
// $<Added>:   Date: Oct 25,2007       Author:Nova
//--------------------------------------------------------------------
// $<reason>   Fix a defect.
FUNCTION Ulong GetCurrentDirectoryA(ulong BufferLen, ref string Currentdir) LIBRARY "kernel32.dll" alias for "GetCurrentDirectoryA;Ansi"
//Function Boolean CreateDirectoryA( ref String PathName, int sa) Library "Kernel32.dll"
Function boolean RemoveDirectoryA (ref string directoryname) library "KERNEL32.DLL" alias for "RemoveDirectoryA;Ansi"
FUNCTION Ulong GetFileAttributesA(string lpFileName) library "Kernel32.dll" alias for "GetFileAttributesA;Ansi"
FUNCTION ulong SetFileAttributes(ref string lpFileName,ulong dwFileAttributes) LIBRARY "kernel32.dll" ALIAS FOR "SetFileAttributesA;Ansi"

//==============================APPEON END============================

//---------Begin Added by Alfee 01.16.2008----------------------------
FUNCTION ulong FindWindowExA(ulong hWnd1, ulong hWnd2, string lpsz1, string lpsz2) LIBRARY "User32.dll" alias for "FindWindowExA;Ansi" 
FUNCTION ulong GetWindowTextA(ulong hwnd, ref string lpString, ulong cch) LIBRARY "User32.dll" alias for "GetWindowTextA;Ansi" 
FUNCTION boolean IsWindowVisible (ulong hwnd) LIBRARY "User32.dll" 
//---------End Added -------------------------------------------------

//--------------------------- APPEON BEGIN ---------------------------
//$< Add  > 2008-06-11 By: Scofield
Function Long GlobalAddAtom(String as_Name) Library "kernel32" Alias for "GlobalAddAtomA;Ansi"
Function Long GlobalDeleteAtom(Long al_AtomID) Library "kernel32" Alias for "GlobalDeleteAtom"
Function Long RegisterHotKey(Long al_hwnd, Long al_AtomID, Long al_FlagKey, Long al_VirKey) Library "user32" Alias for "RegisterHotKey"
Function Long UnregisterHotKey(Long al_hwnd, Long al_AtomID) Library "user32" Alias for "UnregisterHotKey"
Function Long GetLastError() Library "kernel32" Alias for "GetLastError"
//---------------------------- APPEON END ----------------------------

Function Long SetWindowPos(Long   hwnd,Long   ord,Long   xx,Long   yy,Long   dx,Long   dy,Long   uflag)   Library  "user32.dll"   //Added by Ken.Guo on 2008-07-14

//--------------------------- APPEON BEGIN ---------------------------
//$< Add > 2008-07-30 By: Scofield
Function long GetDefaultPrinter(ref String pszPrinter,ref long nSize) library "WinSpool.drv" alias for "GetDefaultPrinterA;Ansi"
Function long SetDefaultPrinter(String pszPrinter) library "WinSpool.drv" alias for "SetDefaultPrinterA;Ansi"
//---------------------------- APPEON END ----------------------------

//---------Begin Added by Alfee 09.28.2008----------------------------
FUNCTION long AppeonReadFile(string as_file, ref blob ablb_Buffer, long al_FileSize) library "AppeonDLL.dll" alias for "AppeonReadFile;Ansi"
FUNCTION long AppeonWriteFile(string as_file, ref blob ablb_Buffer, long al_FileSize) library "AppeonDLL.dll" alias for "AppeonWriteFile;Ansi"
//---------End Added -------------------------------------------------
Function long SendMessage(long hWnd, ulong Msg, long wParam, long lParam) Library "user32.dll" Alias For "SendMessageA"
Function Long GetKeyState(Long nVirtKey) Library "user32" Alias For "GetKeyState"

//Added By Ken.Guo 2010-01-18.
Function int StopIEpopupmsg() library "appeondll.dll" //alias for "StopIEpopupmsg"
Function int ResumeIEpopupmsg() library "appeondll.dll" //alias for "ResumeIEpopupmsg"

//Add by Jervis 09.15.2010
FUNCTION ulong GetEnvironmentVariableA( string szVarName,REF string lpValue, ulong dwSize ) LIBRARY "kernel32.dll" alias for "GetEnvironmentVariableA;Ansi" 
FUNCTION boolean SetEnvironmentVariableA( string szVarName, string szValue ) LIBRARY "kernel32.dll" alias for "SetEnvironmentVariableA;Ansi" 

//Added By Mark Lee 05/15/2013
Function boolean GetTextExtentPoint32 ( ulong hdcr, string lpString, long nCount, Ref str_size_compute size ) Library "gdi32.dll" Alias For "GetTextExtentPoint32A"
Function ulong GetDC ( ulong hWnd ) Library "user32.dll"
Function ulong SelectObject ( ulong hdc, ulong hWnd ) Library "gdi32.dll"
Function long ReleaseDC ( ulong hWnd, ulong hdcr ) Library "user32.dll"

//Added By Jay Chen 12-26-2014
FUNCTION boolean ShowScrollBar(ulong hWnd, ulong wBar, boolean bShow) LIBRARY "User32.dll"
function ulong ScrollWindow( ulong hwnd, ulong xAmount, ulong yAmount, ulong rec, ulong lpClipRect ) library "user32.dll"
end prototypes

type variables
n_ds ids_address_dddw
n_ds ids_code_dddw

n_ds ids_screen_fields_cache
n_ds ids_screen_objects_cache

n_ds ids_report_fields_cache 			 //Added By Alan 08.20.2008
n_ds ids_report_objects_cache			 //Added By Alan 08.20.2008 	
n_ds ids_screen_report_objects_cache //Added By Alan 08.20.2008

n_coolmenu	inv_Coolmenu 

Boolean ib_from_halt = False //Added By Ken.Guo 07.07.2008

Boolean	ib_ReLogin //Added by gavins 20130515
String		is_CommandLine 

//Added By Ken.Guo 2015-07-13
String is_word_versionnumber 
Boolean ib_modified_safemode, ib_modified_addins
n_ds ids_word_addins 
n_cst_word_addins inv_word_addins
end variables

forward prototypes
public function integer of_run_updates (integer ai_from)
public function integer of_create_cat_tables ()
public subroutine of_cleantmpfile ()
public function integer of_set_global_var ()
public function integer of_auto_upgradedb ()
public function integer of_test_mode_from_ini (string as_path)
public function integer of_check_version ()
public function integer of_create_session ()
public function integer of_downloaddll ()
public subroutine of_clean_emailtempfile ()
public subroutine of_ini_registry ()
public subroutine of_send_email (integer ai_did_allready, integer ai_dir_right, integer ai_run_date_alarm, integer al_interval_days)
public subroutine of_getting_datacaches ()
public subroutine of_check_doc ()
public subroutine of_set_global_word (string as_value)
public function integer wf_get_sysinfo (string as_arg_sys)
public subroutine of_check_registry_right ()
public function boolean of_get_relogin_status ()
public subroutine of_set_relogin_status (boolean ab_relogin)
public function integer of_logout ()
public function integer of_run_email_notifications ()
public subroutine of_check_dbowner ()
public function string of_get_word_versionnumber ()
public function integer of_set_word_safemode (boolean ab_force, integer ai_value)
public subroutine of_convertwordversion (string as_version)
public function integer of_check_ocx ()
end prototypes

event open_oldcode();
//********************************OLD CODE    11.15.07 ************************************************************
//Integer li_set_iapps
//Integer li_set_9
//Integer li_set7 
//integer li_prac_cnt
//integer vcnt
//integer set9
//Integer set_34
//integer setprod
//Integer li_rc
//Integer li_facility_cnt
//integer li_days
//String ls_password
//string ls_app
//Integer li_logon_cnt
//Integer i
//Integer li_i_did_allready  
//Date todaysdate
//datetime ld_lastupdate
//datetime ldt_now
//date ld_password
//date dateing
//string ls_dev_head
//string ls_ver_ck
//string ls_dir_path
//
////--------------------------- APPEON BEGIN ---------------------------
////$<add> 11.15.2006 By: Davis
////$<reason> Get Current Directory.
//Gs_Current_Directory = GetCurrentDirectory()
//gs_current_path = Gs_Current_Directory
////---------------------------- APPEON END ----------------------------
//
////--------------------------- APPEON BEGIN ---------------------------
////$<add> 10/09/2007 By: Ken.Guo
////$<reason> Get LDAP user name if exist,Login User,Domain name
//String ls_LDAPUser,ls_username,ls_domainname
//inv_systeminfo = Create n_cst_systeminfo
//ls_LDAPUser = AppeonGetAppeonUserName()
//If ls_LDAPUser = '' or isnull(ls_LDAPUser) Then
//	ls_username = inv_systeminfo.of_get_username()
//	ls_domainname = inv_systeminfo.of_get_domainname()
//End If
//Destroy inv_systeminfo
////---------------------------- APPEON END ----------------------------
//
//of_get_dir_path(Gs_Current_Directory)
//
////--------------------------- APPEON BEGIN ---------------------------
////$< Add  > 2007-09-14 By: Scofield
////$<Reason> Add connect cache process
//if AppeonGetClientType() = 'WEB' then
//	if Len(Trim(CommandLine)) > 0 then
//		if Pos(CommandLine,",") > 0 then
//			gs_CacheName = Lower(Trim(Left(CommandLine,Pos(CommandLine,",") - 1)))
//			gs_CacheType = Upper(Trim(Mid(CommandLine,Pos(CommandLine,",") + 1)))
//		else
//			gs_CacheName = Lower(Trim(CommandLine))
//		end if
//		
//		if gs_CacheName <> '' then
//			gs_CacheSet = "CacheName='" + gs_CacheName + "'"
//			if gs_CacheType = '' then
//				gs_CacheType = "ODB-MSS"				//default set to SQLServer
//			end if
//		end if
//	end if
//end if
////---------------------------- APPEON END ----------------------------
//
////mskinner 1 march 2005 -- begin
//inv_CoolMenu = Create n_coolmenu
//
//inv_CoolMenu.of_Initialize()
//inv_CoolMenu.of_SetResourceFile( "resources.dll" )
////--------------------------- APPEON BEGIN ---------------------------
////$<ID> UM-01
////$<modify> 01/12/2006 By: Cao YongWang
////$<reason> The 'create using as_menu' syntax in n_coolmenu.of_setmenu(string as_menu) function 
////$<reason> is unsupported by Appeon, changed it to n_coolmenu.of_setmenu(menu amnu_menu)
////inv_CoolMenu.of_SetMenu( 'm_pfe_cst_mdi_menu' )
//menu lmnu_menu
//lmnu_menu = Create m_pfe_cst_mdi_menu
//inv_CoolMenu.of_SetMenu( lmnu_menu )
////---------------------------- APPEON END ----------------------------
////inv_CoolMenu.of_set2k3style( )
//
//inv_CoolMenu.of_setxpstyle( )
//
////inv_CoolMenu.of_setmenubarcolor( rgb(211,117,242))
////inv_CoolMenu.of_set2k3gradient(rgb(255,255,255), rgb(211,117,242))
//
////mskinner 1 march 2005 -- end
//
//todaysdate = Today()
//ldt_now = datetime(today(),now())
//
////messagebox("",string(ldt_now))
//gnv_app = CREATE n_cst_appmanager
////==============================APPEON BEGIN==========================
//// $<Deleted>:   Date: Oct 29,2007       Author:Nova
////--------------------------------------------------------------------
//// $<reason>   Fix a defect.
//
//////messagebox("version",gnv_app.of_getversion( ))
////Start Code Change ---- 10.03.2007 #V7 maha readded and modified
////if upper(appeongetclienttype())  = "WEB" then  
////	gs_user_version =  "Web 7.5x build100307"
////else
////==============================APPEON END============================
//	gs_user_version =  gnv_app.of_getversion( )
////end if
////End Code Change---10.03.2007
//
////--------------------------- APPEON BEGIN ---------------------------
////$<ID> PT-06
////$<add> 01.16.2006 By: Cao YongWang
////$<reason> Initialize the global varibal for preselect data approach.
//If not isvalid(gnv_data) Then gnv_data = create n_cst_globaldata
////---------------------------- APPEON END ----------------------------
//
//gnv_app.Event pfc_Open(commandline)
//
//
//
//
//
////If len(commandline) > 0 then 				//Commented by Scofield on 2007-09-14
//	
////	// Profile intellicrdd
////	SQLCA.DBMS = "ODBC"
////	SQLCA.AutoCommit = False
////	SQLCA.DBParm = "ConnectString='DSN=intellicred client;UID=dba;PWD=sql'"
////	connect;
////
////	str_pass lstr_pass
////	lstr_pass.s_long[1] = long(commandline)
////   n_cst_report_macro	invo_report_macro
////   invo_report_macro.of_start_report( lstr_pass)
////	DISCONNECT;
////	HALT
//	
////else
//
//	//--------------------------- APPEON BEGIN ---------------------------
//	//$<modify> 10/09/2007 By: Ken.Guo
//	//$<reason> Use LDAP user auto login
//	//Open( w_logon_screen )
//	OpenWithParm(w_logon_screen,ls_LDAPUser)
//	//---------------------------- APPEON END ----------------------------
//	IF Message.StringParm = "Cancel" OR Message.StringParm = "DB Error" or Message.StringParm = "" THEN //the last added maha 081502 for user clicking on X on login screen
//		Halt Close
//	END IF
//	//maha moved from w_login 083005 for expired password testing
//	select set_36 into :li_set7 from icred_settings; //maha 052404 again
//	
//	if upper(gs_user_id) = "MASTER" then
//		//skip
//	//--------------------------- APPEON BEGIN ---------------------------
//	//$<modify> 10/09/2007 By: Ken.Guo
//	//$<reason> If Login with LDAP user, need not Expired	
//	//else //if using expiring passwords for first time on a user it sets the expiration date for x days in the future.  Otherwise it checks the expiration date for the user and gives the appropriate message.
//	ElseIf ls_LDAPUser = '' Then  
//	//---------------------------- APPEON END ----------------------------
//		if li_set7 > 0 then
//			select last_pass_update into :ld_password from security_users where upper(user_id) = :gs_user_id;
//			li_days = DaysAfter ( today(), ld_password )
//			If isnull(ld_password) then
//				ld_password = RelativeDate ( today(),li_set7) //changed maha 031605 to theset7 value
//				//--------------------------- APPEON BEGIN ---------------------------
//				//$<ID> PT-09
//				//$<add> 01.17.2006 By: Cao YongWang
//				//$<reason> Performance tuning
//				//$<reason> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.
//				gnv_appeondb.of_autocommit()				
//				//---------------------------- APPEON END ----------------------------
//				update security_users set last_pass_update = :ld_password where upper(user_id) = :gs_user_id;
//				commit using sqlca;
//				messagebox("Password Expiration","Your password will expire in " + string(li_set7) + " days.  You can go to System->Change Password to change" )
//			elseif li_days < 0 then
//				messagebox("Password Expired","Your password has expired. Please Change.")
//				openwithparm(w_change_password,"login")
//				if upper(message.stringparm) = "CANCEL" then
//					messagebox("Expired","Your password has expired.  It will have to be changed, or you will not be able to log in.  Closing program.")
//					halt Close
//				end if
//			elseif li_days <= 10 then
//				integer passmes
//				passmes = messagebox("Password Expiring","Your password will expire in " + string(li_days) + " days.  Would you like to change it now? (You can Go to System->Change Password to change later if you wish.",question!,yesno!,2 )
//				if passmes = 1 then
//					debugbreak()
//					openwithparm(w_change_password,"login")
//				end if
//			end if
//		end if
//	end if
////end if 
//
////Get last update date from ids table
////04/05/2007 By Jervis May be APB Bug,Can't put in APB queue
//select last_update into :ld_lastupdate from ids;
//
////--------------------------- APPEON BEGIN ---------------------------
////$<ID> PT-10
////$<add> 01.17.2006 By: Cao YongWang
////$<reason> Performance tuning
////$<reason> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.
//gnv_appeondb.of_startqueue()
////---------------------------- APPEON END ----------------------------
//
////data updates moved up here maha 102904
////select last_update into :ld_lastupdate from ids; //04/05/2007 By Jervis repeat call
//select set_27 into :set9 from icred_settings; //skip auto updates
//
////--------------------------- APPEON BEGIN ---------------------------
////$<ID> PT-11
////$<add> 01.17.2006 By: Cao YongWang
////$<reason> Performance tuning
////$<reason> Integrate SQL statements into Appeon Queue labels to reduce client-server interactions for performance
////$<reason> tuning.
//string ls_dbtype
//
//gds_settings = create datastore //maha 102004
//gds_settings.dataobject = "d_icred_settings"
//i = gds_settings.settransobject(sqlca)
//if i < 1 then
//	messagebox("Database Connection Error","Error connecting to database.  Closing Program")
//	halt Close
//end if
//
//i = gds_settings.retrieve()	
//
////Check version
//select count(user_id) into :vcnt from sys_user_version where user_id = :gs_user_id;
//
////Get last update date from ids table
////select last_update into :ld_lastupdate from ids;
//
////
//SELECT Count( last_query)  
//INTO :li_i_did_allready  
//FROM ids  
//WHERE Convert(varchar(10),last_query,101) = convert(varchar(10),getdate(),101);
////
////ids_address_dddw = CREATE n_ds
////ids_address_dddw.DataObject = "d_dddw_address_lookup_cache"
////ids_address_dddw.of_SetTransObject( SQLCA )
////li_rc = ids_address_dddw.Retrieve()
//Select lookup_cache INTO :gdt_lookup_cache FROM ids;
//
//ids_screen_fields_cache = CREATE n_ds
//ids_screen_fields_cache.DataObject = "d_screen_fields_cache"
//ids_screen_fields_cache.of_SetTransObject( SQLCA )
//li_rc = ids_screen_fields_cache.Retrieve()
//Select screen_cache INTO :gdt_screen_cache FROM ids;
//
//
//ids_screen_objects_cache = CREATE n_ds
//ids_screen_objects_cache.DataObject = "d_screen_objects_cache"
//ids_screen_objects_cache.of_SetTransObject( SQLCA )
//li_rc = ids_screen_objects_cache.Retrieve()
//Select screen_obj_cache INTO :gdt_screen_obj_cache FROM ids;
//
////
//Select Count( prac_id )
//INTO :li_prac_cnt
//FROM pd_basic;
//
//select version_id into :ls_ver_ck from sys_user_version where user_id = :gs_user_id;
//
////
//SELECT Count( * )  
//   INTO :li_facility_cnt  
//   FROM committee_lookup  
//   WHERE committee_lookup.facility_id = 1   ;
//
////
//select top 1 @@version into :ls_dbtype from ids;
//
//gnv_appeondb.of_commitqueue()
//
////--------------------------- APPEON BEGIN ---------------------------
////$<edit> 2007-06-20 By: Jervis
////$<reason> Move to n_cst_dm_sql.of_update_version_7
//
////--------------------------- APPEON BEGIN ---------------------------
////$<add> 2007-01-27 By: Rodger Wu
////$<reason> Fix a defect that i equals to -1 due to a new field added to icred_settings.
////string ls_sql
////if i < 0 then
////	gnv_appeondb.of_startqueue()
////	ls_sql = "Alter table icred_settings add set_51 int; "
////	execute immediate :ls_sql using sqlca;
////	commit using sqlca;
////	
////	i = gds_settings.retrieve()
////	gnv_appeondb.of_commitqueue()
////end if
////---------------------------- APPEON END ----------------------------
////---------------------------- APPEON END ----------------------------
//
//
//If pos(upper(ls_dbtype) , 'SQL SERVER') > 0 Then
//	gs_dbType = 'SQL'
//Else
//	gs_dbType = 'ASA'
//End If
//
////---------------------------- APPEON END ----------------------------
//
////Start Code Change ---- 02.24.2006 # maha
//
//
////--------------------------- APPEON BEGIN ---------------------------
////$<ID> PT-12
////$<comment> 01.17.2006 By: Cao YongWang
////$<reason> Performance tuning.  Remove the SQL statements to Appeon Queue labels to reduce client-server interactions.
////$<reason> refer to PT-11 for details.
////gds_settings = create datastore //maha 102004
////gds_settings.dataobject = "d_icred_settings"
////i = gds_settings.settransobject(sqlca)
////if i < 1 then
////	messagebox("Database Connection Error","Error connecting to database.  Closing Program")
////	halt
////end if
////i = gds_settings.retrieve()
//i = gds_settings.rowcount()
////---------------------------- APPEON END ----------------------------
//
//if i < 1 then
//	//--------------------------- APPEON BEGIN ---------------------------
//	//$<Modify> 2007-08-01 By: Scofield
//	//$<Reason> Add the 'No' button to exit the application
//	
//	//messagebox("Settings Error","Error retrieving Settings. Running Updates.  After updates are run, restart the program")
//	//of_run_updates(1)
//	//halt
//	Integer	li_Rtn
//	li_Rtn = MessageBox("Database upgrade","To run the application, the database must be upgraded first. Would you like to upgrade it now?~r~nClick Yes to upgrade it now.~r~nClick No to exit the application.",Question!,YesNo!,2)
//	if li_Rtn = 1 then
//		of_run_updates(1)
//	end if
//	halt Close
//	//---------------------------- APPEON END ----------------------------
//end if
//
//// //==============================APPEON BEGIN==========================
//// $<Added>:   Date: Nov 12,2007       Author:Nova
////--------------------------------------------------------------------
//// $<reason>   Fix a defect.
//String ls_inifile
//Long ll_dbver,ls_update_version
//String ls_update_ver,ls_db_path_ver
//GS_SYSRUNPATH = GetCurrentDirectory ( )
//ls_inifile = GS_SYSRUNPATH + '\' + GS_INIFILE
//ls_update_version = Long(ProfileString(ls_inifile, "setup", 'version', 'error'))
//SELECT Top 1 set_18 Into :ll_dbver From icred_settings;
//IF ll_dbver < ls_update_version THEN
//	of_run_updates(0)
//ELSEIF ll_dbver = ls_update_version THEN
//	SELECT Top 1 set_patch_ver Into :ls_db_path_ver From icred_settings;
//	IF sqlca.SQLCode <> 0 THEN
//		of_run_updates(0)
//	ELSE
//		gs_patch_ver = ProfileString(ls_inifile, "updatemethod", 'patch_ver', 'error')
//		IF ls_db_path_ver < gs_patch_ver THEN
//			of_run_updates(0)
//		END IF
//	END IF
//	
//END IF
//
////==============================APPEON END============================
////==============================APPEON BEGIN==========================
//// $<Deleted>:   Date: Nov 12,2007       Author:Nova
////--------------------------------------------------------------------
//// $<reason>   Fix a defect.
//
//
////if set9 <> 1 then
////	if date(ld_lastupdate) < date("2007-08-24") then //maha added 100202to automatically run updates less then this date
////		of_run_updates(0)
////		//Start code changes - 1.4.2007 Henry. comment out the redundant scripts
////		/*
////		//--------------------------- APPEON BEGIN ---------------------------
////		//retrieve the cache data again after updating the database automacatilly
////		gnv_appeondb.of_startqueue()
////		gnv_data.of_retrieve('icred_settings') //cache data for icred_settings table
////		gnv_data.of_retrieve('security_users') //cache data for security_users table
////		gnv_data.of_retrieve('ids')				//cache data for ids table
////		gnv_data.of_retrieve('sys_tables')				//cache data for sys_tables table
////		gnv_data.of_retrieve('code_lookup')				//cache data for code_lookup table
////		gnv_data.of_retrieve('ctx_notification')				//cache data for ctx_notification table
////		gnv_data.of_retrieve('sys_fields')				//cache data for sys_fields and sys_tables table
////		gnv_data.of_retrieve('facility')				//cache data for facility table
////		gnv_data.of_retrieve('data_view_screen')				//cache data for data_view_screen table
////		//--------------------------- APPEON BEGIN ---------------------------
////		//$<add> 10.12.2006 By: Jack (Inova)
////		//$<reason> Queue Images for Scanning from Data Entry.
////		gnv_data.of_retrieve('image_type')				//cache data for image_type table	
////		//---------------------------- APPEON END ----------------------------
////		
////		gnv_data.of_retrieve('code_lookup_2') //Added 11.30.2006 henry
////		
////		//Added for work flow. 6/11/2006 Henry
////		gnv_data.of_retrieve('wf_workflow')	
////		gnv_data.of_retrieve('wf_action_types')	
////		gnv_data.of_retrieve('wf_action_status')	
////		gnv_data.of_retrieve('wf_trigger_param_data_comparison')	
////		gnv_data.of_retrieve('wf_trigger_param_action_status')	
////		
////		//End added for work flow.
////		
////		gnv_appeondb.of_commitqueue()
////		//---------------------------- APPEON END ----------------------------
////		*/
////		//End code changes - 1.4.2007 Henry
////	end if
////end if
////==============================APPEON END============================
////Start Code By Jervis 06.26.2007
//If  of_get_app_setting("set_47","I") = 1 Then gb_workflow = True
////End Code
//
////End Code Change---02.24.2006
//
////action item,  should there be just the psv or both psv and app status action items screens
////SELECT set_iapps, set_9
////INTO :li_set_iapps, :li_set_9
////FROM icred_settings;
//
//li_set_iapps = of_get_app_setting("set_iapps","I")
//gi_iapp_on = li_set_iapps
//li_set_9 = of_get_app_setting("set_9","I")
//
//
////debugbreak()
//IF ( li_set_iapps = 0 AND li_set_9 = 0 ) THEN
//	gi_action_item_menus = 1  //JUST PSV ACTION ITEMS MENU OPTION
//ELSEIF ( li_set_iapps = 1 AND li_set_9 = 0 ) THEN	
//	gi_action_item_menus = 1  //JUST PSV ACTION ITEMS MENU OPTION
//ELSEIF ( li_set_iapps = 1 AND li_set_9 = 1 ) THEN
//	gi_action_item_menus = 2  //JUST APPLICATION STATUS ACTION ITEMS MENU OPTION
//ELSEIF ( li_set_iapps = 0 AND li_set_9 = 1 ) THEN
//	gi_action_item_menus = 2  //JUST APPLICATION STATUS ACTION ITEMS MENU OPTION
//ELSEIF li_set_9 = 3  THEN	
//	gi_action_item_menus = 3  //BOTH APPLICATION STATUS ACTION ITEMS MENU OPTION AND PSV OPTION
//END IF
//
//if li_set_9 = 1 then gs_cust_type = "I"
//
//if li_set_9 = 2 then gb_se_version = True
//
////--------------------------- APPEON BEGIN ---------------------------
////$<add> 08.17.2006 By: LeiWei
////$<reason> Making the Contract Module a Standalone Product
//IF li_set_9 = 4 then gb_contract_version = True
////---------------------------- APPEON END ----------------------------
//
////Added for To Do List 7/12/2006 Allen
////Start Code Change ----11.15.2008 #V8 maha
////If of_get_app_setting("set_49","I") = 1 Then gb_ToDoList = True
//select set_tdl into :li_set7   from security_users where user_id = :gs_user_id;
//if li_set7 = 1 then gb_ToDoList = True
////End Code Change---11.15.2007
//
////--------------------------- APPEON BEGIN ---------------------------
////$<add> 11.27.2006 By: Jack (Contract Logix Agreement Manager Painters)
////$<reason> Making the Agreement Manager Module a Standalone Product
//
//IF of_get_app_setting("set_51","I") = 1 THEN
//	gb_agreement_manager = True
//END IF
////---------------------------- APPEON END ----------------------------
//
////check user version 
////--------------------------- APPEON BEGIN ---------------------------
////$<ID> PT-13
////$<comment> 01.17.2006 By: Cao YongWang
////$<reason> Performance tuning. Remove the SQL statements to Appeon Queue labels to reduce client-server interactions.
////$<reason> refer to PT-11 for details.
////select count(user_id) into :vcnt from sys_user_version where user_id = :gs_user_id;
////---------------------------- APPEON END ----------------------------
//
////--------------------------- APPEON BEGIN ---------------------------
////$<ID> PT-14
////$<add> 01.17.2006 By: Cao YongWang
////$<reason> Performance tuning.
////$<reason> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.
////$<modification> Add the Apppeon Start Queue label.
//gnv_appeondb.of_startqueue()
////---------------------------- APPEON END ----------------------------
//
//if vcnt = 0 then
//	insert into sys_user_version values (:gs_user_id,:gs_user_version,:ldt_now);
//	commit using sqlca;
//else
//	//--------------------------- APPEON BEGIN ---------------------------
//	//$<ID> PT-15
//	//$<comment> 01.17.2006 By: Cao YongWang
//	//$<reason> Performance tuning. Remove the SQL statements to Appeon Queue labels to reduce client-server interactions.
//   //$<reason> refer to PT-11 for details.
//	//select version_id into :ls_ver_ck from sys_user_version where user_id = :gs_user_id;
//	//---------------------------- APPEON END ---------------------------
//	if ls_ver_ck <> gs_user_version then
//		update sys_user_version set version_id = :gs_user_version,mod_date = :ldt_now where user_id = :gs_user_id;
//		commit using sqlca;
//	end if
//end if
//
////--------------------------- APPEON BEGIN ---------------------------
////$<ID> PT-16
////$<add> 01.17.2006 By: Cao YongWang
////$<reason> Performance tuning.
////$<reason> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.
////$<modification> Add the Appeon Commit Queue label.
//gnv_appeondb.of_commitqueue()
////---------------------------- APPEON END ----------------------------
//
////Start Code Change ---- 03.20.2006 #325 maha  duplicate code removed
//////debugbreak()	
////select last_update into :ld_lastupdate from ids;
////
////
//////select set_27 into :set9 from icred_settings;
////set9 = of_get_app_setting("set_27","I")
//////messagebox("",setprod)
////if set9 <> 1 then
////	if date(ld_lastupdate) < date("2004-09-25") then //maha added 100202to automatically run updates less then this date
////		of_run_updates(0)
////	end if
////end if
//////\maha
////End Code Change---03.20.2006
//
////\maha
//
////\/maha added 082302 to set inital product settings
////select set_product into :setprod from icred_settings;
//setprod = of_get_app_setting("set_product","I")
////messagebox("",setprod)
//if setprod = 1 then
//	open(w_install_module_update)
//	gds_settings.retrieve()
//	if message.stringparm = "Cancel" then 	
//		halt Close
//	end if
//end if
////\maha
//
////\/maha changed 061402
////select set_9 into :set9 from icred_settings;
////if set9 = 1 then gs_cust_type = "I"  //product intelliapp
//
////select set_31 into :set9 from icred_settings;
//gi_export_on = of_get_app_setting("set_iauto","I")
//gi_ireport_on = of_get_app_setting("set_ireport","I")
////gi_iapp_on = of_get_app_setting("set_iapps","I")
//gi_scan_format  = of_get_app_setting("set_29","I")
//gi_imaging = of_get_app_setting("set_img","I")
//gi_priv_mod = of_get_app_setting("set_priv","I")
//gi_case_review = of_get_app_setting("set_peer","I")
//gi_dept_security = of_get_app_setting("set_37","I")
////select set_31 into :set9 from icred_settings;
//
////start code changes - 1.4.2007 Henry.
////retrieve cache datas.  gnv_data is n_cst_globaldata in appeon_workaround
//gnv_appeondb.of_startqueue()
//gnv_data.of_retrieve('icred_settings') //cache data for icred_settings table
//gnv_data.of_retrieve('security_users') //cache data for security_users table
//gnv_data.of_retrieve('ids')				//cache data for ids table
//gnv_data.of_retrieve('sys_tables')				//cache data for sys_tables table
//gnv_data.of_retrieve('code_lookup')				//cache data for code_lookup table
//gnv_data.of_retrieve('ctx_notification')				//cache data for ctx_notification table
//gnv_data.of_retrieve('sys_fields')				//cache data for sys_fields and sys_tables table
//gnv_data.of_retrieve('facility')				//cache data for facility table
//gnv_data.of_retrieve('data_view_screen')				//cache data for data_view_screen table
////--------------------------- APPEON BEGIN ---------------------------
////$<add> 10.12.2006 By: Jack (Inova)
////$<reason> Queue Images for Scanning from Data Entry.
//gnv_data.of_retrieve('image_type')				//cache data for image_type table	
////---------------------------- APPEON END ----------------------------
//
//gnv_data.of_retrieve('code_lookup_2') //Added 11.30.2006 henry
//	
////Added for work flow. 6/11/2006 Henry
//gnv_data.of_retrieve('wf_workflow')	
//gnv_data.of_retrieve('wf_action_types')	
//gnv_data.of_retrieve('wf_action_status')	
//gnv_data.of_retrieve('wf_trigger_param_data_comparison')	
//gnv_data.of_retrieve('wf_trigger_param_action_status')	
////End added for work flow.
//	
////$<add> 10.12.2006 By: LeiWei
//IF appeongetclienttype() = 'WEB' Then
//	select image_flag into :gs_image_flag from security_users where user_id = :gs_user_id;
//END IF
////$<add> 10.12.2006 By: LeiWei
//
//gnv_appeondb.of_commitqueue()
////---------------------------- APPEON END ----------------------------
////end code changes - 1.4.2007 henry
//
//This.ToolbarText = True
//Open(w_mdi)
//
////open(w_store_image_in_db)
//
//
//
//
//IF of_get_app_setting("set_9","I")  = 1 THEN //
//	w_mdi.Title = "IntelliApp For Windows"
//	ls_app = "IntelliApp"
//elseif gb_contract_version = True then  //set_9 = 4   //Start Code Change ---- 10.06.2006 #688 maha
//	w_mdi.Title = "Contract Logix For Windows"
//	ls_app = "Contract Logix"
//ELSE
//	w_mdi.Title = "IntelliCred For Windows"
//	ls_app = "IntelliCred"
//END IF
////End Code Change---01.12.2005 
//
//gi_test_mode = of_get_app_setting("set_10","I")
//if gi_test_mode = 2 then //maha 080702 moved here 112502 from w_mdi(open) because of preceding code
//	w_mdi.Title =  ls_app + " Using Test Database"
//elseif gi_test_mode = 1 then
//	w_mdi.Title =  ls_app + " in Debug Mode"
//elseif gi_test_mode = 3 then
//	//select dev_title into :ls_dev_head from icred_settings;
//	ls_dev_head = gds_settings.getitemstring(1,"dev_title")
//	if isnull(ls_dev_head) then ls_dev_head = ""
//	w_mdi.Title = ls_app + " using " + ls_dev_head
//elseif gi_test_mode = 10 then
//	w_mdi.Title = ls_app + " using MAHA test database"
//elseif gi_test_mode = 200 then
//	w_mdi.Title = ls_app + " using Intellisoft Application Database"
//end if
//
//
//
//
//IF Upper( gs_cust_type ) = 'I' THEN
//	UPDATE facility_ver_rules
//	SET default_verif_means = 15,
//	    verifY_data = 'B'
//	WHERE ( facility_id = 1 ) AND
//			( facility_ver_rules.screen_id in (4,5,15,19,20,23) )   ;
//   commit using sqlca;
//	IF SQLCA.SQLCODE = -1 THEN
//		MessageBox("SQL Error", SQLCA.SQLERRTEXT )
//	END IF
//	//--------------------------- APPEON BEGIN ---------------------------
//	//$<ID> PT-17
//	//$<comment> 01.17.2006 By: Cao YongWang
//	//$<reason> Performance tuning. Remove the SQL statements to Appeon Queue labels to reduce client-server interactions.
//   //$<reason> refer to PT-11 for details.
//	//	SELECT Count( * )  
//	//   INTO :li_facility_cnt  
//	//   FROM committee_lookup  
//	//   WHERE committee_lookup.facility_id = 1   ;
//	//	IF SQLCA.SQLCODE = -1 THEN
//	//		MessageBox("SQL Error", SQLCA.SQLERRTEXT )
//	//	END IF
//	//---------------------------- APPEON END ----------------------------
//
//		
//	IF li_facility_cnt = 0 THEN
//		INSERT INTO committee_lookup  
//         ( committee_id,   
//           facility_id,   
//           committee_name )  
//		VALUES ( 1,   
//       			  1,   
//		           'Credentialing Committee' )  ;
//     
//		IF SQLCA.SQLCODE = -1 THEN
//			MessageBox("SQL Error", SQLCA.SQLERRTEXT )
//		END IF
//				  
//	END IF
//END IF
//
////--------------------------- APPEON BEGIN ---------------------------
////$<ID> PT-18
////$<comment> 01.17.2006 By: Cao YongWang
////$<reason> Performance tuning. Remove the SQL statements to Appeon Queue labels to reduce client-server interactions.
////$<reason> refer to PT-11 for details.
////SELECT Count( last_query)  
////INTO :li_i_did_allready  
////FROM ids  
////WHERE ids.last_query = :todaysdate   ;
////IF SQLCA.SQLCODE = -1 THEN
////	MessageBox("SQL Error", SQLCA.SQLERRTEXT )
////END IF
////---------------------------- APPEON END ----------------------------
//
//IF li_i_did_allready = 0 THEN
//	//--------------------------- APPEON BEGIN ---------------------------
//	//$<modify> 12.29.2006 By: Davis
//	//$<reason> Fix a defect.
//	/*
//	UPDATE ids  
//   SET last_query = :todaysdate  ;
//	*/
//	//--------------------------- APPEON BEGIN ---------------------------
//	//$<add> 10/31/2007 By: Ken.Guo
//	//$<reason> Delete Temp data if exist in below tables	when run app firstly every day.
//	gnv_appeondb.of_startqueue()
//	Delete From ic_array_to_db;
//	Delete From ic_client_data;
//	//---------------------------- APPEON END ----------------------------
//	UPDATE ids SET last_query = getdate()  ;	
//	commit using sqlca;
//	gnv_appeondb.of_commitqueue()
//	//---------------------------- APPEON END ----------------------------
//	IF SQLCA.SQLCODE = -1 THEN
//		MessageBox("SQL Error setting last_query date", SQLCA.SQLERRTEXT )
//	END IF
//	//maha moved below the last_query set to block near simultaneous logins from running duplicate action item querys.
//	pfc_n_cst_ai_printletters lnv_exp_cred
//	lnv_exp_cred = CREATE pfc_n_cst_ai_printletters
//	lnv_exp_cred.of_run_ai_query(1) //maha 082903
//	// MSKINNER 03 March 2006 -- begin
//	
//	long ll_contract
//	select set_cont into :ll_contract from icred_settings;
//	if ll_contract <> 0 then	
//		n_cst_notification  lnvo_notification
//		lnvo_notification =  create n_cst_notification
//		lnvo_notification.of_start_notification_process( )
//		//--------------------------- APPEON BEGIN ---------------------------
//		//$<Add> 08.23.2007 By: Evan
//		//$<Reason> Need to destroy object.
//		if IsValid(lnvo_notification) then Destroy lnvo_notification
//		//---------------------------- APPEON END ----------------------------	
//	end if
//	// MSKINNER 03 March 2006 -- end
//
////	lnv_exp_cred.of_expiring_credentials()
////	lnv_exp_cred.of_resend_letters()
////	lnv_exp_cred.of_expiring_appointments()
//	DESTROY lnv_exp_cred
//	
//	//--------------------------- APPEON BEGIN ---------------------------
//	//$<add> 11.10.2006 By: Jervis
//	//$<reason> Modify for workflow
//	//Reminder type emails should be send when the system starts up for the first tiem each day.
//	n_cst_workflow_triggers	lnv_workflow
//	lnv_workflow = create n_cst_workflow_triggers
//	lnv_workflow.of_reminder_mail_process()
//	destroy n_cst_workflow_triggers
//	//---------------------------- APPEON END ----------------------------
//END IF
//
//
////select set_2 into :gi_cache_set from icred_settings;
//
/////If gi_cache_set = 0 then //maha092701
//
////--------------------------- APPEON BEGIN ---------------------------
////$<ID> PT-19
////$<comment> 01.17.2006 By: Cao YongWang
////$<reason> Performance tuning. Remove the SQL statements to Appeon Queue labels to reduce client-server interactions.
////$<reason> refer to PT-11 for details.
////ids_address_dddw = CREATE n_ds
////ids_address_dddw.DataObject = "d_dddw_address_lookup_cache"
////ids_address_dddw.of_SetTransObject( SQLCA )
////li_rc = ids_address_dddw.Retrieve()
////Select lookup_cache INTO :gdt_lookup_cache FROM ids;
////
////ids_screen_fields_cache = CREATE n_ds
////ids_screen_fields_cache.DataObject = "d_screen_fields_cache"
////ids_screen_fields_cache.of_SetTransObject( SQLCA )
////li_rc = ids_screen_fields_cache.Retrieve()
////Select screen_cache INTO :gdt_screen_cache FROM ids;
////
////
////ids_screen_objects_cache = CREATE n_ds
////ids_screen_objects_cache.DataObject = "d_screen_objects_cache"
////ids_screen_objects_cache.of_SetTransObject( SQLCA )
////li_rc = ids_screen_objects_cache.Retrieve()
////Select screen_obj_cache INTO :gdt_screen_obj_cache FROM ids;
////---------------------------- APPEON END ----------------------------
//
////IF gs_cust_type = "I" THEN
//if	gi_iapp_on = 1 and of_get_app_setting("set_31","I") = 0 then //maha changed 101404
//	open( w_dash )
//END IF
//
////Select set_15 into :gi_intelliapp_type from icred_settings;
//gi_intelliapp_type = of_get_app_setting("set_15","I")
//
////--------------------------- APPEON BEGIN ---------------------------
////$<ID> PT-20
////$<comment> 01.17.2006 By: Cao YongWang
////$<reason> Performance tuning. Remove the SQL statements to Appeon Queue labels to reduce client-server interactions.
////$<reason> refer to PT-11 for details.
////Select Count( prac_id )
////INTO :li_prac_cnt
////FROM pd_basic;
////---------------------------- APPEON END ----------------------------
//
//IF li_prac_cnt <= 100 THEN
//	gi_auto_search = 1
//ELSE
//	gi_auto_search = 0
//END IF
//
//
////check for word path maha 073004 
////--------------------------- APPEON BEGIN ---------------------------
////$<modify> 01/12/2006 By: Cao YongWang
////$<reason> It is not necessary to determine the intellicred.ini exist in web application
//
////IF NOT FileExists( gs_dir_path + gs_DefDirName + "\intellicred.ini" ) THEN
////	MessageBox("ini File Error", "No intellicred.ini file found at: " + gs_dir_path + gs_DefDirName + "\intellicred.ini~rThis may cause errors in the program including printing letters." )
////else //check the word path
////	if fileexists( "C:\Program Files\Microsoft Office\Office12\winword.exe") then
////		SetProfileString(gs_dir_path + gs_DefDirName + "\intellicred.ini", "paths", "word", " C:\Program Files\Microsoft Office\Office12\winword.exe")
////	elseif fileexists( "C:\Program Files\Microsoft Office\Office11\winword.exe") then
////		SetProfileString(gs_dir_path + gs_DefDirName + "\intellicred.ini", "paths", "word", " C:\Program Files\Microsoft Office\Office11\winword.exe")
////	elseif fileexists( "C:\Program Files\Microsoft Office\Office10\winword.exe") then
////		SetProfileString(gs_dir_path + gs_DefDirName + "\intellicred.ini", "paths", "word", " C:\Program Files\Microsoft Office\Office10\winword.exe")
////	else
////		//leave it as is
////	end if
////END IF
//If appeongetclienttype() = 'PB' Then
//	IF NOT FileExists(gs_IniFilePathName) THEN
//		MessageBox("ini File Error", "No intellicred.ini file found at: " + gs_IniFilePathName + "~rThis may cause errors in the program including printing letters." )
//	else //check the word path
//		if fileexists( "C:\Program Files\Microsoft Office\Office12\winword.exe") then
//			SetProfileString(gs_IniFilePathName, "paths", "word", " C:\Program Files\Microsoft Office\Office12\winword.exe")
//		elseif fileexists( "C:\Program Files\Microsoft Office\Office11\winword.exe") then
//			SetProfileString(gs_IniFilePathName, "paths", "word", " C:\Program Files\Microsoft Office\Office11\winword.exe")
//		elseif fileexists( "C:\Program Files\Microsoft Office\Office10\winword.exe") then
//			SetProfileString(gs_IniFilePathName, "paths", "word", " C:\Program Files\Microsoft Office\Office10\winword.exe")
//		else
//			//leave it as is
//		end if
//	END IF
//Else
//	if fileexists( "C:\Program Files\Microsoft Office\Office12\winword.exe") then
//		SetProfileString(gs_IniFilePathName, "paths", "word", " C:\Program Files\Microsoft Office\Office12\winword.exe")
//	elseif fileexists( "C:\Program Files\Microsoft Office\Office11\winword.exe") then
//		SetProfileString(gs_IniFilePathName, "paths", "word", " C:\Program Files\Microsoft Office\Office11\winword.exe")
//	elseif fileexists( "C:\Program Files\Microsoft Office\Office10\winword.exe") then
//		SetProfileString(gs_IniFilePathName, "paths", "word", " C:\Program Files\Microsoft Office\Office10\winword.exe")
//	else
//		//leave it as is
//	end if
//End IF
////---------------------------- APPEON END ----------------------------
//
////--------------------------- APPEON BEGIN ---------------------------
////$<modify> 01.05.2007 By: Davis
////$<reason> Modfiy the function.
////gnv_app.of_setcontraccache( )
//gnv_app.of_setcontraccache_register( )
////---------------------------- APPEON END ----------------------------
//
//// END  code change --- 01.01.2005 MSKINNER
//
////--------------------------- APPEON BEGIN ---------------------------
////$<add> 09.07.2006 By: LeiWei
////$<reason> Making the Contract Module a Standalone Product
//gnv_app.of_setcontraccache_code_lookup(TRUE)
////---------------------------- APPEON END ----------------------------
//
////Start Code Change ---- 01.23.2006 #213 maha
//if gs_cust_type = "I" then //maha 030606
//	gnv_app.of_sethelpfile( gs_dir_path + gs_DefDirName + "\IntelliApp_User_Guide.chm")
//else
//	gnv_app.of_sethelpfile( gs_dir_path + gs_DefDirName + "\IntelliCred_User_Guide.chm")
//end if
//
//if gi_citrix = 1 then
//	select letter_save_path into :gs_save_path from ids;
//	if isnull(gs_save_path) or len(gs_save_path) < 3 then gs_save_path = gs_dir_path + gs_DefDirName + "\Letters\Standard\"
//	CreateDirectory ( gs_save_path )
//else
//	gs_save_path = gs_dir_path + gs_DefDirName + "\Letters\Standard\"
//end if
////End Code Change---01.23.2005 
//
//gnv_app.of_set_contract_path( )
//
////mskinner 17 fab 2005 -- begin
//if of_get_app_setting("set_44","I") = 0 then
//	n_cst_rights LNVO_RIGHTS
//	LNVO_RIGHTS = create n_cst_rights
//	ls_ver_ck = LNVO_RIGHTS.OF_start( )
//	if ls_ver_ck <> "OK" then
//		openwithparm( w_sql_msg,ls_ver_ck)
//	end if
//	destroy LNVO_RIGHTS
//end if
////mskinner 17 fab 2005 -- end 
////Added for work flow. 6/11/2006 Henry
////If  of_get_app_setting("set_47","I") = 1 Then gb_workflow = True  //Move to top by Jervis 06.26.2007
//
//
////Added for pdf to text 12/8/2006 Henry
////gs_current_path = GetCurrentDirectory()//Start Code Change ---- 08.15.2007 #V7 maha  moved further up
//
////--------------------------- APPEON BEGIN ---------------------------
////$<add> 01.24.2007 By: Davis
//Integer li_set_autoresize
//Select set_autoresize
//Into :li_set_autoresize
//From icred_settings;
//IF li_set_autoresize = 1 THEN
//	gb_autoresize = TRUE
//END IF
////---------------------------- APPEON END ----------------------------
//
////Registry dll & ocx file - by alfee 08.17.2007
//of_reg_dllocx() 
//
////--------------------------- APPEON BEGIN ---------------------------
////$<add> 23-03-2007 By: Ken.Guo
////$<reason> set doc's user name to APP login name
//f_set_doc_author(gs_user_id)
////---------------------------- APPEON END ----------------------------
//
////--------------------------- APPEON BEGIN ---------------------------
////$<  Add > 2007-10-30 By: Scofield
////$<Reason> Clean the temporary files
//
//of_CleanTmpFile()
////---------------------------- APPEON END ----------------------------
//
////Start Code Change ----11.15.2008 #V8 maha  opens selected user screen 
//of_open_at_start()
////End Code Change---.2007
//
//

end event

public function integer of_run_updates (integer ai_from);//created as function maha 102704

//--------Begin Modified by Alfee 01.30.2008---------
//<$Note>The original code lines have been removed directly
open(w_priv_update)
w_priv_update.st_update.visible = True
w_priv_update.st_update.bringtotop = true
w_priv_update.cb_update.visible = false
w_priv_update.cb_reset.visible = false
w_priv_update.cb_1.visible = false
w_priv_update.cb_3.visible = False
w_priv_update.st_1.visible = false
w_priv_update.cbx_latest.visible = false
if ai_from = 1 then
	w_priv_update.cb_reset.triggerevent(clicked!)
end if

w_priv_update.cb_update.triggerevent(clicked!)

IF IsValid(w_priv_update) THEN Close(w_priv_update)

return 1
//------End Modified --------------------------------

end function

public function integer of_create_cat_tables ();//Start Code Change ---- 03.20.2006 #326 maha
//maha created function to create the cat tables if they do not exist.  Called from the open event
string ls_sql

long ll_rowcount 
select count(*)
into :ll_rowcount
from pbcatedt;

if ll_rowcount > 0 then return 0

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-04
//$<add> 04.03.2006 By: LeiWei
//$<reason> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.
//$<modification> Add the Appeon Start Queue label.
gnv_appeondb.of_startqueue( )
//---------------------------- APPEON END ----------------------------

ls_sql = "CREATE TABLE pbcattbl (	pbt_tnam char(129),	pbt_tid float,	pbt_ownr char(129),	pbd_fhgt float,	pbd_fwgt float,	pbd_fitl char(1),	pbd_funl char(1),	pbd_fchr float,	pbd_fptc float,	pbd_ffce char(18),	pbh_fhgt float,	pbh_fwgt float,	pbh_fitl char(1),	pbh_funl char(1),	pbh_fchr float,	pbh_fptc float,	pbh_ffce char(18),	pbl_fhgt float,	pbl_fwgt float,	pbl_fitl char(1),	pbl_funl char(1),	pbl_fchr float,	pbl_fptc float,	pbl_ffce char(18),	pbt_cmnt char(254));"
execute immediate :ls_sql using sqlca;
commit using sqlca;
ls_sql = "CREATE TABLE pbcatcol (	pbc_tnam char(129),	pbc_tid float,	pbc_ownr char(129),	pbc_cnam char(129),	pbc_cid float,	pbc_labl char(254),	pbc_lpos float,	pbc_hdr char(254),	pbc_hpos float,	pbc_jtfy float,	pbc_mask char(31),	pbc_case float,	pbc_hght float,	pbc_wdth float,	pbc_ptrn char(31),	pbc_bmap char(1),	pbc_init char(254),	pbc_cmnt char(254),	pbc_edit char(31),	pbc_tag char(254));"
execute immediate :ls_sql using sqlca;
commit using sqlca;
ls_sql = "CREATE TABLE pbcatedt (pbe_name char(30) NOT NULL DEFAULT NULL, pbe_edit char(254) DEFAULT NULL, pbe_type smallint DEFAULT NULL, pbe_cntr integer DEFAULT NULL, pbe_seqn smallint NOT NULL DEFAULT NULL, pbe_flag integer DEFAULT NULL, pbe_work char(32) DEFAULT NULL) ;"
execute immediate :ls_sql using sqlca;
commit using sqlca;
ls_sql = "CREATE TABLE pbcatfmt (pbf_name char(30) NOT NULL DEFAULT NULL, pbf_frmt char(254) DEFAULT NULL, pbf_type smallint DEFAULT NULL, pbf_cntr integer DEFAULT NULL) ;"
execute immediate :ls_sql using sqlca;
commit using sqlca;
ls_sql = "CREATE TABLE pbcatvld (pbv_name char(30) NOT NULL DEFAULT NULL, pbv_vald char(254) DEFAULT NULL, pbv_type smallint DEFAULT NULL, pbv_cntr integer DEFAULT NULL, pbv_msg char(254) DEFAULT NULL) ;"
execute immediate :ls_sql using sqlca;


ls_sql = "INSERT INTO pbcatedt VALUES ('###,###.00','###,###.00',90,1,1,32,'10');"
execute immediate :ls_sql using sqlca;
commit using sqlca;
ls_sql ="INSERT INTO pbcatedt VALUES ('#####','#####',90,1,1,32,'10');"
execute immediate :ls_sql using sqlca;
commit using sqlca;

ls_sql ="INSERT INTO pbcatedt VALUES ('###-##-####','###-##-####',90,1,1,32,'00');"
execute immediate :ls_sql using sqlca;
commit using sqlca;
ls_sql ="INSERT INTO pbcatedt VALUES ('MM/DD/YY','MM/DD/YY',90,1,1,32,'20');"
execute immediate :ls_sql using sqlca;
commit using sqlca;
ls_sql ="INSERT INTO pbcatedt VALUES ('DD/MM/YY','DD/MM/YY',90,1,1,32,'20');"
execute immediate :ls_sql using sqlca;
commit using sqlca;
ls_sql ="INSERT INTO pbcatedt VALUES ('MM/DD/YYYY','MM/DD/YYYY',90,1,1,32,'20');"
execute immediate :ls_sql using sqlca;
commit using sqlca;
ls_sql ="INSERT INTO pbcatedt VALUES ('DD/MM/YYYY','DD/MM/YYYY',90,1,1,32,'20');"
execute immediate :ls_sql using sqlca;
commit using sqlca;
ls_sql ="INSERT INTO pbcatedt VALUES ('DD/MMM/YY','DD/MMM/YY',90,1,1,32,'20');"
execute immediate :ls_sql using sqlca;
commit using sqlca;
ls_sql ="INSERT INTO pbcatedt VALUES ('JJJ/YY','JJJ/YY',	90,1,1,32,'20');"
execute immediate :ls_sql using sqlca;
commit using sqlca;
ls_sql ="INSERT INTO pbcatedt VALUES ('JJJ/YYYY','JJJ/YYYY',90,1,1,32,'20');"
execute immediate :ls_sql using sqlca;
commit using sqlca;
ls_sql ="INSERT INTO pbcatedt VALUES ('HH:MM:SS','HH:MM:SS',90,1,1,32,'30');"
execute immediate :ls_sql using sqlca;
commit using sqlca;
ls_sql ="INSERT INTO pbcatedt VALUES ('HH:MM:SS:FFF','HH:MM:SS:FFF',90,1,1,32,'30');"
execute immediate :ls_sql using sqlca;
commit using sqlca;
ls_sql ="INSERT INTO pbcatedt VALUES ('HH:MM:SS:FFFFFF','HH:MM:SS:FFFFFF',90,1,1,32,'30');"
execute immediate :ls_sql using sqlca;
commit using sqlca;
ls_sql ="INSERT INTO pbcatedt VALUES ('MM/DD/YY HH:MM:SS','MM/DD/YY HH:MM:SS',90,1,1,32,	'40');"
execute immediate :ls_sql using sqlca;
commit using sqlca;
ls_sql ="INSERT INTO pbcatedt VALUES ('DD/MM/YY HH:MM:SS','DD/MM/YY HH:MM:SS',90,1,1,32,	'40');"
execute immediate :ls_sql using sqlca;
commit using sqlca;
ls_sql ="INSERT INTO pbcatedt VALUES ('MM/DD/YYYY HH:MM:SS','MM/DD/YYYY HH:MM:SS',90,1,1,32,'40');"
execute immediate :ls_sql using sqlca;
commit using sqlca;
ls_sql ="INSERT INTO pbcatedt VALUES ('DD/MM/YYYY HH:MM:SS','DD/MM/YYYY HH:MM:SS',90,1,1,32,'40');"
execute immediate :ls_sql using sqlca;
commit using sqlca;
ls_sql ="INSERT INTO pbcatedt VALUES ('DD/MMM/YY HH:MM:SS','DD/MMM/YY HH:MM:SS',90,1,1,32,'40');"
execute immediate :ls_sql using sqlca;
commit using sqlca;
ls_sql ="INSERT INTO pbcatedt VALUES ('JJJ/YY HH:MM:SS','JJJ/YY HH:MM:SS',90,1,1,32,'40');"
execute immediate :ls_sql using sqlca;
commit using sqlca;
ls_sql ="INSERT INTO pbcatedt VALUES ('JJJ/YYYY HH:MM:SS','JJJ/YYYY HH:MM:SS',90,1,1,32,	'40');"
execute immediate :ls_sql using sqlca;
commit using sqlca;
ls_sql ="INSERT INTO pbcatedt VALUES ('DD/MM/YY HH:MM:SS:FFFFFF','DD/MM/YY HH:MM:SS:FFFFFF',90,1,1,32,'40');"
execute immediate :ls_sql using sqlca;
commit using sqlca;
ls_sql =" INSERT INTO pbcatfmt VALUES ('[General]','[General]',81,0);"
execute immediate :ls_sql using sqlca;
commit using sqlca;

ls_sql =" INSERT INTO pbcatfmt VALUES ('[General]','[General]',81,0);"
execute immediate :ls_sql using sqlca;
commit using sqlca;
ls_sql =" INSERT INTO pbcatfmt VALUES ('0','0',81,0);"
execute immediate :ls_sql using sqlca;
commit using sqlca;
ls_sql =" INSERT INTO pbcatfmt VALUES ('0.00','0.00',81,0);"
execute immediate :ls_sql using sqlca;
commit using sqlca;
ls_sql =" INSERT INTO pbcatfmt VALUES ('#,##0','#,##0',81,0);"
execute immediate :ls_sql using sqlca;
commit using sqlca;
ls_sql =" INSERT INTO pbcatfmt VALUES ('#,##0.00','#,##0.00',81,0);"
execute immediate :ls_sql using sqlca;
commit using sqlca;
ls_sql =" INSERT INTO pbcatfmt VALUES ('$#,##0;($#,##0)','$#,##0;($#,##0)',81,0);"
execute immediate :ls_sql using sqlca;
commit using sqlca;
ls_sql =" INSERT INTO pbcatfmt VALUES ('$#,##0;[RED]($#,##0)','$#,##0;[RED]($#,##0)',81,0);"
execute immediate :ls_sql using sqlca;
commit using sqlca;
ls_sql =" INSERT INTO pbcatfmt VALUES ('$#,##0.00;($#,##0.00)','$#,##0.00;($#,##0.00)',81,0);"
execute immediate :ls_sql using sqlca;
commit using sqlca;
ls_sql =" INSERT INTO pbcatfmt VALUES ('$#,##0.00;[RED]($#,##0.00)','$#,##0.00;[RED]($#,##0.00)',81,0);"
ls_sql =" INSERT INTO pbcatfmt VALUES ('0%','0%',81,0);"
execute immediate :ls_sql using sqlca;
commit using sqlca;
ls_sql =" INSERT INTO pbcatfmt VALUES ('0.00%','0.00%',81,0);"
execute immediate :ls_sql using sqlca;
commit using sqlca;
ls_sql =" INSERT INTO pbcatfmt VALUES ('0.00E+00','0.00E+00',81,0);"
execute immediate :ls_sql using sqlca;
commit using sqlca;
ls_sql =" INSERT INTO pbcatfmt VALUES ('m/d/yy','m/d/yy',84,0);"
execute immediate :ls_sql using sqlca;
commit using sqlca;
ls_sql =" INSERT INTO pbcatfmt VALUES ('d-mmm-yy','d-mmm-yy',84,0);"
execute immediate :ls_sql using sqlca;
commit using sqlca;
ls_sql =" INSERT INTO pbcatfmt VALUES ('d-mmm','d-mmm',84,0);"
execute immediate :ls_sql using sqlca;
commit using sqlca;
ls_sql =" INSERT INTO pbcatfmt VALUES ('mmm-yy','mmm-yy',	84,0);"
execute immediate :ls_sql using sqlca;
commit using sqlca;
ls_sql =" INSERT INTO pbcatfmt VALUES ('h:mm AM/PM','h:mm AM/PM',84,0);"
execute immediate :ls_sql using sqlca;
commit using sqlca;
ls_sql =" INSERT INTO pbcatfmt VALUES ('h:mm:ss AM/PM','h:mm:ss AM/PM',84,0);"
execute immediate :ls_sql using sqlca;
commit using sqlca;
ls_sql =" INSERT INTO pbcatfmt VALUES ('h:mm:ss','h:mm:ss',84,0);"
execute immediate :ls_sql using sqlca;
commit using sqlca;
ls_sql =" INSERT INTO pbcatfmt VALUES ('m/d/yy h:mm','m/d/yy h:mm',84,0);"
execute immediate :ls_sql using sqlca;
commit using sqlca;

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-05
//$<add> 04.03.2006 By: LeiWei
//$<reason> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance. 
//$<modification> Add the Appeon Commit Queue label.
gnv_appeondb.of_commitqueue( )
//---------------------------- APPEON END ----------------------------


return 1
end function

public subroutine of_cleantmpfile ();//--------------------------- APPEON BEGIN ---------------------------
//$<  Add > 2007-10-30 By: Scofield
//$<Reason> Clean the temporary files

String	ls_LastClrDate
Date		ld_LastDate,ld_Today
long		ll_DiffDays,ll_IntervalDays

n_cst_filesrv inv_filesrv


f_SetFileSrv(inv_filesrv,TRUE)

ll_IntervalDays = ProfileInt(gs_IniFilePathName,"Setup","Interval_Days",30)
if ll_IntervalDays = 0 then return

ls_LastClrDate = ProfileString(gs_IniFilePathName,"Setup","Last_Clear_Date",String(Today(),"YYYY/MM/DD"))
ld_LastDate = Date(ls_LastClrDate)
ld_Today = Today()
ll_DiffDays = DaysAfter(ld_LastDate,ld_Today)

if ll_DiffDays < ll_IntervalDays then return

inv_filesrv.of_deltree(gs_dir_path + gs_DefDirName + "\Agreement")
//Start Code Change ---- 10.31.2007 #V7 maha  removed until all functionalities point to the noted temp folder
//	inv_filesrv.of_deltree(gs_dir_path + gs_DefDirName + "\temp\applications")
//	inv_filesrv.of_deltree(gs_dir_path + gs_DefDirName + "\temp\contract")
//	inv_filesrv.of_deltree(gs_dir_path + gs_DefDirName + "\temp\Letters")
//	inv_filesrv.of_deltree(gs_dir_path + gs_DefDirName + "\temp\oig")
//End Code Change---10.31.2007

Destroy inv_filesrv

ls_LastClrDate = String(Today(),"YYYY/MM/DD")
SetProfileString(gs_IniFilePathName,"Setup","Last_Clear_Date",ls_LastClrDate)
//---------------------------- APPEON END ----------------------------

end subroutine

public function integer of_set_global_var ();//Start Code Change ----11.15.2008 #V8 maha function added to clean up global variable setting
Integer li_set_autoresize
integer li_set
integer li_set_9
integer li_set_iapps
integer li_prac_cnt
integer li_set_51		//Document managerment module
integer li_set_cont //Alfee 05.12.2008
integer li_prelod_ctx //Add by Evan 11/12/2008
integer li_use_opsyntax
//string ls_dbtype
String	  ls_Option_Value

gi_intelliapp_type = of_get_app_setting("set_15","I")
gi_test_mode = of_get_app_setting("set_10","I")
//ls_dev_head = gds_settings.getitemstring(1,"dev_title")
gi_export_on = of_get_app_setting("set_iauto","I")
gi_ireport_on = of_get_app_setting("set_ireport","I")
gi_scan_format  = of_get_app_setting("set_29","I")
gi_imaging = of_get_app_setting("set_img","I")
gi_priv_mod = of_get_app_setting("set_priv","I")
gi_case_review = of_get_app_setting("set_peer","I")
gi_dept_security = of_get_app_setting("set_37","I")
If  of_get_app_setting("set_47","I") = 1 Then gb_workflow = True
//If of_get_app_setting("set_49","I") = 1 Then gb_ToDoList = True	//12.07.2007 by Jervis //Start Code Change ----12.11.2007 #V8 maha --removed; in version 8 dtl is user based 

gi_iapp_on = of_get_app_setting("set_iapps","I")
li_set_9 = of_get_app_setting("set_9","I")
gi_prod_setting = li_set_9  //Alfee 07.14.2008
if li_set_9 = 1 then gs_cust_type = "I"
if li_set_9 = 2 then gb_se_version = True
IF li_set_9 = 4 then gb_contract_version = True

IF ( gi_iapp_on = 0 AND li_set_9 = 0 ) THEN
	gi_action_item_menus = 1  //JUST PSV ACTION ITEMS MENU OPTION
ELSEIF ( gi_iapp_on = 1 AND li_set_9 = 0 ) THEN	
	gi_action_item_menus = 1  //JUST PSV ACTION ITEMS MENU OPTION
ELSEIF ( gi_iapp_on = 1 AND li_set_9 = 1 ) THEN
	gi_action_item_menus = 2  //JUST APPLICATION STATUS ACTION ITEMS MENU OPTION
ELSEIF ( gi_iapp_on = 0 AND li_set_9 = 1 ) THEN
	gi_action_item_menus = 2  //JUST APPLICATION STATUS ACTION ITEMS MENU OPTION
ELSEIF li_set_9 = 3  THEN	
	gi_action_item_menus = 3  //BOTH APPLICATION STATUS ACTION ITEMS MENU OPTION AND PSV OPTION
END IF

//---------Begin Added by Alfee on 05.12.2008----
li_set_cont = of_get_app_setting("set_cont","I")
IF li_set_cont = 1 THEN gb_contract_module = True
//---------End Added -----------------------------

//Start code by jervis 04.10.2008
//IF of_get_app_setting("set_51","I") = 1 THEN
li_set_51 = of_get_app_setting("set_51","I")
IF li_set_51 = 1 or li_set_51 = 2 THEN	//1-Sell/Buy,2-Sell,3-Buy,0-off
//End code by jervis 04.10.2008
	gb_agreement_manager = True
END IF
SetNull(gnv_win_backcolor.il_win_backcolor) //Add by Evan 11/28/2008

gnv_appeondb.of_startqueue()
	Select set_tdl into :li_set   from security_users where user_id = :gs_user_id;
	Select set_autoresize  Into :li_set_autoresize From Security_Users Where user_id = :gs_user_id;
	Select Count( prac_id ) INTO :li_prac_cnt FROM pd_basic;
	//select top 1 @@version into :ls_dbtype from ids;
	select letter_save_path into :gs_save_path from ids;
	select set_prelod_ctx into :li_prelod_ctx from security_users where user_id = :gs_user_id; //Add by Evan 11/12/2008	
	SELECT data_view.win_backcolor INTO :gnv_win_backcolor.il_win_backcolor
	FROM  security_users, data_view
	WHERE data_view.data_view_id = security_users.contract_default_view AND
			security_users.user_id = :gs_user_id;//Add by Evan 11/28/2008		
	Select use_opsyntax into :li_use_opsyntax from icred_settings;		
gnv_appeondb.of_commitqueue()

if gi_citrix = 1 then  //var set in of_get_dir_path
	if isnull(gs_save_path) or len(gs_save_path) < 3 then gs_save_path = gs_dir_path + gs_DefDirName + "\Letters\Standard\"
	CreateDirectory ( gs_save_path )
else
	gs_save_path = gs_dir_path + gs_DefDirName + "\Letters\Standard\"
end if

//database type
//If pos(upper(ls_dbtype) , 'SQL SERVER') > 0 Then
//	gs_dbType = 'SQL'
//Else
//	gs_dbType = 'ASA'
//End If

//TO DO LIST
//IF li_set = 1 then gb_ToDoList = True
//Start Code Change ----12.11.2007 #V8 maha --modified; in version 8 dtl is user based 
if li_set = 1 then
	//gb_ToDoList = true //Start Code Change ----01.23.2008 #V8 maha
	gb_OpenToDoList = true
end if
If of_get_app_setting("set_49","I") = 1 Then gb_ToDoList = True  //Start Code Change ----01.23.2008 #V8 maha

//auto resize
//IF li_set_autoresize = 1 THEN 	gb_autoresize = TRUE  //modified by gavins 20130107
gb_autoresize = TRUE
ls_Option_Value = gnv_user_option.of_Get_option_value( gs_user_id, "m_pfe_cst_master_menu.m_autoresize" ) 
If ls_Option_Value = '1' Then
	gb_autozoom = True
	gb_cut_autozoom = True
End If


if li_prelod_ctx = 1 then gb_PreloadCTX = true //Add by Evan 11/12/2008

//auto retrieve prac data
IF li_prac_cnt <= 100 THEN
	gi_auto_search = 1
ELSE
	gi_auto_search = 0
END IF

gi_email_type = of_get_app_setting("set_56","I")  //Start Code Change ----10.08.2008 #V85 maha

//if  gnv_data.of_getitem("icred_settings","use_opsyntax",false) = '1' then  //jervis 10.13.2011
If li_use_opsyntax = 1 Then //Modified By Ken.Guo 11/16/2011
	gb_use_opmode =true  
else
	gb_use_opmode =false
end if

return 1
end function

public function integer of_auto_upgradedb ();//Auto run DB Upgrade
//Used global variables:gs_dbtype,gs_dir_path,Gs_Current_Directory

integer li_db_ver
string ls_db_ver_patch
string ls_dbtype
integer li_set9

gnv_appeondb.of_startqueue( )
//Get auto dbupdate flag
SELECT set_27 Into :li_set9 From icred_settings;

//Get the number of version
SELECT Top 1 set_18 Into :li_db_ver From icred_settings;
select top 1 set_patch_ver into :ls_db_ver_patch from icred_settings;

//Get DB Type
select top 1 @@version into :ls_dbtype from ids;
gnv_appeondb.of_commitqueue( )

If pos(upper(ls_dbtype) , 'SQL SERVER') > 0 Then
	gs_dbType = 'SQL'
Else
	gs_dbType = 'ASA'
End If

IF li_db_ver < Integer(gs_current_version) THEN
	if MessageBox("Database upgrade","To run the application, the database must be upgraded first. Would you like to upgrade it now?~r~nClick Yes to upgrade it now.~r~nClick No to exit the application.",question!,yesno!,2) = 1 then
		of_run_updates(0) 
	END IF
	ib_from_halt = True //Added By Ken.Guo 07.07.2008
	HALT close
ELSEIF li_db_ver = Integer(gs_current_version) AND li_set9 <> 1 THEN
	if integer(ls_db_ver_patch) < integer(gs_current_version_patch) then
		of_run_updates(0)
	end if
END IF


return 1
end function

public function integer of_test_mode_from_ini (string as_path);//Start Code Change ----07.22.2008 #V8 maha - setting for testmode from ini file
integer i
string ls_val
string ls_path

//Start Code Change ---- 07.30.2008 #V8 maha - Added trap for bad shortcuts
If AppeonGetClientType() = 'PB' then //windows trap
	if upper(mid(as_path,1,25)) = "C:\DOCUMENTS AND SETTINGS" then //if start in for shortcut is blank
		ls_path = "C:\Program Files\ContractLogix"
	elseif upper(as_path) = "C:\" then //if start in is c:\
		ls_path = "C:\Program Files\ContractLogix"
	else
		ls_path = as_path
	end if
//end if //Moved it down by Ken.Guo 2008-08-04

	ls_path+= "\intellicred.ini"
	
	if not fileexists(ls_path) then //trap for no file at location
		i = 1 
	else
		ls_val = ProfileString(ls_path, "Setup", "Testmode", "0") 
		i = integer(ls_val)
	end if
	//End Code Change---07.30.2008
//Added by Ken.Guo 2008-08-04
Else
	ls_val = ProfileString("intellicred.ini", "Setup", "Testmode", "0") 
	i = integer(ls_val)	
End if
//End Added by Ken.Guo 2008-08-04

return i
end function

public function integer of_check_version ();//--------------------------- APPEON BEGIN ---------------------------
//$< Add  > 2008-08-14 By: Nova
//$<Reason> Fix a defect.

// var
Integer li_db_main_ver
String  ls_db_patch_ver
Boolean lb_tip_flag = False
//get value
SELECT icred_settings.set_18,
	icred_settings.set_patch_ver
	INTO :li_db_main_ver,
	:ls_db_patch_ver
	From icred_settings  ;
//process	
IF li_db_main_ver > Integer(gs_current_version) THEN
	lb_tip_flag = True
ELSEIF li_db_main_ver = Integer(gs_current_version) THEN
	IF Integer(ls_db_patch_ver) > Integer(gs_current_version_patch) THEN
		lb_tip_flag = True
	END IF
END IF

IF lb_tip_flag THEN
	RETURN 1
ELSE
	RETURN 0
END IF
//---------------------------- APPEON END ----------------------------

end function

public function integer of_create_session ();//////////////////////////////////////////////////////////////////////
// $<function>app_fillerof_create_session()
// $<arguments>(None)
// $<returns> integer
// $<description>
// $<description> Check license and Create session
//////////////////////////////////////////////////////////////////////
// $<add> 2008-08-26 by Ken.Guo
//////////////////////////////////////////////////////////////////////

Integer li_session_ret

//Create session(include license check)
li_session_ret = gnv_session.of_create_session()
If li_session_ret < 0 Then
	Messagebox('Information',gnv_session.of_get_err_msg( li_session_ret ) )
	//Invalid license
	If li_session_ret <= -100 Then
		//Open license window to input it
		Open(w_install_module_update)
		If Message.Stringparm = 'OK' Then 
			//Create it again.
			li_session_ret = gnv_session.of_create_session() 
			If li_session_ret < 0 Then
				Messagebox('Information',gnv_session.of_get_err_msg( li_session_ret ) )
				Return li_session_ret
			End If
		Else
			Return -1
		End If
	Else
		//Failed to create session 
		Return li_session_ret
	End If
End If
	
Return 1
end function

public function integer of_downloaddll ();n_appeon_download lnv_download

lnv_download.of_DownloadDll()

Return 1
end function

public subroutine of_clean_emailtempfile ();//Added By Ken.Guo 2009-08-13.
String ls_EmailDirectory,ls_FileName1,ls_FileName2,ls_FileName3,ls_FileName4

ls_EmailDirectory = gs_dir_path + gs_DefDirName + "\Email"
gnv_appeondll.of_parsepath(ls_EmailDirectory)
//ls_FileName1 = ls_EmailDirectory + "\Temp.doc"	
ls_FileName2 = ls_EmailDirectory + "\Empty.doc"	
ls_FileName3 = ls_EmailDirectory + "\Email.htm"	

//Added By Jay Chen 07-10-2014 remark:bak the email log when it's size more than 5MB
string ls_source_file,ls_target_name
int li_size
ls_source_file = gs_dir_path + gs_DefDirName + '\Email.Log'
if FileExists(ls_source_file) then
	li_size = Int(FileLength(ls_source_file) /1024)
	if li_size >= 5000 then
		ls_target_name = "Email_" + string(today(),'YYYYMMDD') + string(now(),'HHMMSS') + ".Log"
		ls_target_name = gs_dir_path + gs_DefDirName + '\' + ls_target_name
		FileMove( ls_source_file, ls_target_name )
	end if
end if
//end

//Added By Ken.Guo 2015-09-08
n_cst_filesrv lnv_filesrv
f_SetFileSrv(lnv_filesrv,TRUE)
lnv_filesrv.of_deltree(ls_EmailDirectory, False)

Long i,ll_max = 1000
For i = 1 to ll_max
	ls_FileName1 = ls_EmailDirectory + "\Temp"+String(i)+".doc"	
	If FileExists(ls_FileName1) Then
		If Not FileDelete(ls_FileName1) and i = ll_max Then
			Messagebox('Delete Temporary File','Failed to delete the temporary file "' +ls_FileName1+ '". ~r~nThis will cause your WindWord.exe process to be locked up.  Please open Windows Task Manager (Ctrl-Alt-Del to bring up option to open Task Manager).  Click on the Process tab and look for the WINWORD.exe process and right click on that entry and click End Process.',Exclamation!)
		End If
	End If
	FileDelete( ls_EmailDirectory + "\~~$Temp"+String(i)+".doc" )
Next

//for performance, don't delete it. Ken.Guo 2010-09-10
//If FileExists(ls_FileName2) Then
//	If Not FileDelete(ls_FileName2) Then
//		Messagebox('Delete Temporary File','Failed to delete the temporary file "' +ls_FileName2+ '". ~r~nThis will cause your WindWord.exe process to be locked up.  Please open Windows Task Manager (Ctrl-Alt-Del to bring up option to open Task Manager).  Click on the Process tab and look for the WINWORD.exe process and right click on that entry and click End Process.',Exclamation!)
//		Return 
//	End If
//End If
FileDelete( ls_EmailDirectory + "\~~$Empty.doc")

If FileExists(ls_FileName3) Then
	If Not FileDelete(ls_FileName3) Then
		Messagebox('Delete Temporary File','Failed to delete the temporary file "' +ls_FileName3+ '". ~r~nThis will cause your WindWord.exe process to be locked up.  Please open Windows Task Manager (Ctrl-Alt-Del to bring up option to open Task Manager).  Click on the Process tab and look for the WINWORD.exe process and right click on that entry and click End Process.',Exclamation!)
		Return 
	End If
End If


Return 
end subroutine

public subroutine of_ini_registry ();//Added By Ken.Guo 2009-12-21. In WEB, GDI count will large than 10000(widnows default), and will cause some error(flashing...) 
ULong ll_reg_value

//Use PB function to set
ll_reg_value = 0
RegistryGet( "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Windows", "GDIProcessHandleQuota", RegULong!, ll_reg_value)
If ll_reg_value <> 16000 Then
	RegistrySet( "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Windows", "GDIProcessHandleQuota", RegULong!, 16000)
End If
ll_reg_value = 0
RegistryGet( "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Windows", "USERProcessHandleQuota", RegULong!, ll_reg_value)
If ll_reg_value <> 16000 Then
	RegistrySet( "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Windows", "USERProcessHandleQuota", RegULong!, 16000)
End If

RegistrySet("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Applets\Wordpad","AllowConversion",RegULong!,1)
gnv_appeondll.of_RegistrySet("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Applets\Wordpad","AllowConversion",RegULong!,1)


//Use DLL function to Set. Sometimes PB function set failed.
ll_reg_value = 0
//gnv_appeondll.of_RegistryGet( "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Windows", "GDIProcessHandleQuota", RegULong!, ll_reg_value)
//If ll_reg_value <> 16000 Then
	gnv_appeondll.of_RegistrySet( "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Windows", "GDIProcessHandleQuota", RegULong!, 16000)
//End If
//ll_reg_value = 0
//gnv_appeondll.of_RegistryGet( "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Windows", "USERProcessHandleQuota", RegULong!, ll_reg_value)
//If ll_reg_value <> 16000 Then
	gnv_appeondll.of_RegistrySet( "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Windows", "USERProcessHandleQuota", RegULong!, 16000)
//End If


end subroutine

public subroutine of_send_email (integer ai_did_allready, integer ai_dir_right, integer ai_run_date_alarm, integer al_interval_days);//Trigger work flow when on login contractlogix system - jervis 09.02.2010
Long ll_max_id
n_cst_workflow_triggers lnv_workflow
integer	li_return

gb_ShowEmailErrorMessage = False
//Run_Email_Notifications
IF ai_did_allready = 0 and ai_dir_right > 0 and gb_DocQuickView = False THEN
	////////////////////////////////////////////////////////////added by gavins 20140617
	If ai_run_date_alarm = 1 Then
	ElseIf ai_run_date_alarm = 0 and al_interval_days >= 10 Then
		If Messagebox('Email Alarms','The system has not sent Email Alarms more than 10 days. ~r~nDo you want to send it now?', Question!,YesNo!) = 1 Then
		Else
			UPDATE ids Set last_query = getdate()  ;
//			gnv_webapprove.of_refresh_status( ) 
			gb_ShowEmailErrorMessage = True
			w_mdi.inv_statusbar.of_setrefreshrate( 3 )
			Return 			
		End If
	Else
		gb_ShowEmailErrorMessage = True
		Return
	End If
		
	If gnv_data.of_getitem( 'icred_settings', 'use_web_email', False) = '1' Then
		n_cst_webapi lnv_webapi
		
		Select Max(id) into :ll_max_id From em_mail_audit Where user_id = :gs_user_id;
		gnv_Status_Info.of_display("Start Email notification, please wait...")
		if isnull(gs_accesstoken) or trim(gs_accesstoken) = '' then gs_accesstoken = lnv_webapi.of_convert_json_token( )
		If  isnull(gs_accesstoken) or trim(gs_accesstoken) = '' then 
			gnv_Status_Info.of_display("")
			gb_ShowEmailErrorMessage = True
			w_mdi.inv_statusbar.of_setrefreshrate( 3 )
			return 
		End If
		if len(gs_accesstoken) > 0 then
			lnv_webapi.of_alarmemailandworkflow( )		
			if len( lnv_webapi.errorcode ) > 0 then 
				gnv_Status_Info.of_display("")
				gb_ShowEmailErrorMessage = True
				w_mdi.inv_statusbar.of_setrefreshrate( 3 )
				return 
			End If
		end if
			//-------Begin Modified by Alfee 12.07.2007------
		IF gb_contract_version THEN 
			//--------------------------- APPEON BEGIN ---------------------------
			//$<add> 01.05.2009 By: Ken.Guo
			//$<reason> Refresh data
			//Refresh Action Items data and Doc Action Items data in Contract Folder
			If Isvalid(gw_contract) Then
				If w_contract.tab_contract_details.ib_select10 = True Then
					w_contract.tab_contract_details.tabpage_action_items.tab_1.tabpage_detail.of_retrieve()
				End If				
			End If
			//---------------------------- APPEON END ----------------------------		
		End If
		gb_ShowEmailErrorMessage = True
		w_mdi.inv_statusbar.of_setrefreshrate( 3 )
		gnv_Status_Info.of_display("")
		f_show_email_result(ll_max_id)
		 
		return 
	end if
	
	////////////////////////////////////////////////////////////
	//Added By Ken.Guo 2011-08-30.  Workaround APB Bug
	w_mdi.inv_statusbar.of_setrefreshrate( 0 )
	Sleep(1)	
		
	gnv_appeondb.of_startqueue()
	DELETE From ic_array_to_db;
	DELETE From ic_client_data;	
	gnv_appeondb.of_commitqueue()
	
	IF sqlca.SQLCode = -1 THEN
		MessageBox("SQL Error setting last_query date", sqlca.SQLErrText )
	END IF	
	
	Select Max(id) into :ll_max_id From em_mail_audit Where user_id = :gs_user_id;
	//Must Fisrt Run Email Notifications
	If ai_run_date_alarm = 1 Then
		li_return = of_run_email_notifications()
		If li_return < 0 then 	//added by gavins 20130916
			gb_ShowEmailErrorMessage = True
			w_mdi.inv_statusbar.of_setrefreshrate( 3 )
			return
		end if
	ElseIf ai_run_date_alarm = 0 and al_interval_days >= 10 Then
		If Messagebox('Email Alarms','The system has not sent Email Alarms more than 10 days. ~r~nDo you want to send it now?', Question!,YesNo!) = 1 Then
			//lnv_workflow.post of_trigger_by_onlogin( )
			li_return = of_run_email_notifications()
			If li_return < 0 then 	//added by gavins 20130916
				gb_ShowEmailErrorMessage = True
				w_mdi.inv_statusbar.of_setrefreshrate( 3 )
				return
			end if
		Else
			//Added By Ken.Guo 2011-01-06. Prevent duplicate reminder
			UPDATE ids Set last_query = getdate()  ;
//			gnv_webapprove.of_refresh_status( ) 
			gb_ShowEmailErrorMessage = True
			w_mdi.inv_statusbar.of_setrefreshrate( 3 )
			Return 			
		End If
	Else
//		gnv_webapprove.of_refresh_status( ) 
		gb_ShowEmailErrorMessage = True
		w_mdi.inv_statusbar.of_setrefreshrate( 3 )
		Return 
	End If
	
	lnv_workflow = create n_cst_workflow_triggers
	lnv_workflow.of_set_message( false) //11.05.2010 By Jervis
	lnv_workflow.ib_trigger_on_login = true //Added By Jay Chen 05-12-2014
	lnv_workflow.of_trigger_by_onlogin( )	//jervis 09.03.2010	
	
	//--------------------------- APPEON BEGIN ---------------------------
	//$<add> 2009-04-14 By: Ken.Guo
	//$<reason> Send checkin email.
	n_cst_email_checkin lnv_email_checkin
	If ai_dir_right > 0 and gb_DocQuickView = False Then
		lnv_email_checkin = Create n_cst_email_checkin
		lnv_email_checkin.of_send_email()
		If Isvalid(lnv_email_checkin) Then Destroy lnv_email_checkin
	End If
	//---------------------------- APPEON END ----------------------------
	
	f_show_email_result(ll_max_id)

	w_mdi.inv_statusbar.of_setrefreshrate( 3 )
	
END IF 
gb_ShowEmailErrorMessage = True


If isvalid(lnv_workflow) Then destroy lnv_workflow
end subroutine

public subroutine of_getting_datacaches ();// <RP> 1.9.2017 -------------------------
// Don't refresh up front. Data caches will be populated as encountered
//gnv_data.of_refresh_systemdatacache( )
// <RP>

gnv_data.of_get_defaultdddwcache()

If isvalid(w_appeon_gifofwait) Then close(w_appeon_gifofwait)

/*
//Getting data caches - jervis 10.25.2011
//Open(w_open_message) //Start Code Change ----11.15.2008 #V8 maha
OpenWithParm(w_appeon_gifofwait,"Getting system data caches, this may take a few minutes. Please wait...")
gnv_appeondb.of_startqueue() //Restored by Alfee 11.28.2007
gnv_data.of_retrieve('icred_settings') //cache data for icred_settings table
gnv_data.of_retrieve('security_users') //cache data for security_users table
gnv_data.of_retrieve('ids') //cache data for ids table
gnv_data.of_retrieve('sys_tables') //cache data for sys_tables table
gnv_data.of_retrieve('code_lookup') //cache data for code_lookup table
gnv_data.of_retrieve('ctx_notification') //cache data for ctx_notification table
gnv_data.of_retrieve('ctx_all_notification') //cache data for ctx_all_notification table - jervis 07.04.2011
gnv_data.of_retrieve('ctx_ai_notification') //cache data for ctx_ai_notification table - Alfee 02.26.2008
gnv_data.of_retrieve('ctx_am_ai_notification') //cache data for ctx_am_ai_notification table - Alfee 02.26.2008
gnv_data.of_retrieve('sys_fields') //cache data for sys_fields and sys_tables table
gnv_data.of_retrieve('facility') //cache data for facility table
gnv_data.of_retrieve('data_view_screen') //cache data for data_view_screen table
gnv_data.of_retrieve('image_type') //cache data for image_type table	
gnv_data.of_retrieve('code_lookup_2') 
gnv_data.of_retrieve('wf_workflow')
gnv_data.of_retrieve('wf_action_types')
gnv_data.of_retrieve('wf_action_status')
gnv_data.of_retrieve('wf_trigger_param_data_comparison')
gnv_data.of_retrieve('wf_trigger_param_action_status')
gnv_data.of_retrieve('template_clause_rules') //for dynamic add clauses - by Alfee 11.12.2007	 
gnv_data.of_retrieve('question_lookup') //cache data for question_lookup table - Added by Alan 08.20.2008
gnv_data.of_retrieve('data_view') //Added By Ken.Guo 2009-07-10.
gnv_data.of_retrieve('depend_field') //Added By jervis 2009-09-27.
gnv_data.of_retrieve('depend_lookup') //Added By jervis 2009-09-27.
gnv_data.of_retrieve( 'ctx_facility')	//Added by jervis 2009-12-10
gnv_data.of_retrieve( 'em_user_msg')//Added By Ken.Guo 2010-03-26.
gnv_data.of_retrieve( 'em_user_config') //Added By Ken.Guo 2010-03-26.
gnv_data.of_retrieve( 'getting_started_data')
gnv_data.of_retrieve( 'dashboard_getting_started')
gnv_appeondb.of_commitqueue()
//CONTRACT CACHE
gnv_app.of_setcontraccache_register( )
gnv_app.of_setcontraccache_code_lookup(True)
gnv_app.of_set_contract_path( )

//Other Lookup caches
int li_use_opmode
select use_opsyntax into :li_use_opmode from icred_settings;
if li_use_opmode = 1 then
	w_appeon_gifofwait.of_settext("Getting lookup data caches, this may take a few minutes. Please wait...")
	datastore lds_cache
	long ll_i,ll_count
	string ls_name
	lds_cache = create datastore
	lds_cache.dataobject = 'd_get_cachelist'
	lds_cache.SetTransobject( sqlca)
	ll_count = lds_cache.retrieve( )
	for ll_i = 1 to ll_count
		ls_name = lds_cache.GetItemString( ll_i,'lookup_list')
		if ls_name='?' or ls_name = '' or isnull(ls_name) then continue
		if gnv_app.inv_dwcache.of_isregistered(ls_name) = 1 then continue
		gnv_app.of_setcontraccache_code_lookup( ls_name)
	next
	destroy lds_cache
end if


close(w_appeon_gifofwait)
*/
end subroutine

public subroutine of_check_doc ();//Added By Ken.Guo 12/13/2011. Check MS Word Installed

OLEObject myoleobject

//Added By Ken.Guo 01/07/2015
If gnv_user_option.of_get_option_value(gs_user_id, "check_msword" ) = '0' Then Return

myoleobject = Create oleobject
app_filler.of_set_word_safemode(false, 1) //Added By Ken.Guo 2015-07-30
IF myoleobject.Connecttonewobject("word.application") = 0 THEN 
	app_filler.of_set_word_safemode(false, 0) //Added By Ken.Guo 2015-07-30
	is_word_versionnumber = String(myoleobject.Application.Version)
	of_convertwordversion(  is_word_versionnumber )//added by gavin 2015/08/12 
	If Mid(String(myoleobject.Application.ProductCode), 21,1) = '1' Then
		gs_wordtype = '64-bit'
	else
		gs_wordtype = '32-bit'
	End If
	myoleobject.Quit(0) 
	myoleobject.DisconnectObject()	
	If isvalid(myoleobject) Then destroy myoleobject
Else
	app_filler.of_set_word_safemode(false, 0) //Added By Ken.Guo 2015-07-30
	If isvalid(myoleobject) Then destroy myoleobject
	If Messagebox('ContractLogix','The system detects that MS Word is not install on your computer. ContractLogix requires MS Word to be installed, or otherwise you will not be able to use some of the functions. ~r~n~r~nDo you want to continue? ', Exclamation!, YesNo!,2 ) = 2 Then
		Halt Close
	End If	
END IF





end subroutine

public subroutine of_set_global_word (string as_value);Choose Case as_value
	Case 'open'
		If gnv_data.of_getitem( 'icred_settings', 'preload_word', False) = '1' Then
			If Not isvalid(gole_word_instance) Then
				gole_word_instance = Create oleobject
				app_filler.of_set_word_safemode(false, 1) //Added By Ken.Guo 2015-07-30
				IF gole_word_instance.Connecttonewobject("word.application") = 0 THEN 
					gole_word_instance.Application.NormalTemplate.Saved = TRUE
				END IF		
				app_filler.of_set_word_safemode(false, 0) //Added By Ken.Guo 2015-07-30
			End If
		End If
	Case 'close'
		try
			If Isvalid(gole_word_instance) Then
				If gole_word_instance.isalive( ) Then //Added By Ken.Guo 2015-07-28 Added if statement. Otherwise it will error if user close the Winword.exe process.
					If gole_word_instance.documents.count = 0 then //Added By Ken.Guo 2015-07-28Added if statement. Otherwise it will close client's word document.
						gole_word_instance.Quit(0)
					End If		
				End If
				//gole_word_instance.Quit(0)  
				gole_word_instance.DisconnectObject()	
				destroy gole_word_instance
			End If
		catch (throwable th)
			messagebox('Contractlogix','The Word process terminated unexpectedly. ContractLogix will be closed now.')
		end try
End Choose



end subroutine

public function integer wf_get_sysinfo (string as_arg_sys);//====================================================================
// Function: wf_get_sysinfo
//--------------------------------------------------------------------
// Description: judge compatibility level equal 80
//--------------------------------------------------------------------
// Arguments:
//				as_arg_sys
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	Mark Lee		Date: 07/05/12
//--------------------------------------------------------------------
//	Copyright (c) 2008-2012 Contract Logix,Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//	//Added By Mark Lee 08/14/12 add adjuge free space for database
//====================================================================
string ls_arg_sys,  ls_level

If isnull(as_arg_sys) or trim(as_arg_sys) = '' Then
	ls_arg_sys = 'compatibility_level'
Else
	ls_arg_sys	=	as_arg_sys
End If
ls_level = ''

Declare lsp_sys_set Procedure For sp_sys_set
@arg = :ls_arg_sys, @outputs = :ls_level OUTPUT ;
Execute lsp_sys_set;
Fetch lsp_sys_set Into :ls_level ;
Close lsp_sys_set;

 If SQLCA.SQLCode < 0 Then
	ROLLBACK;
Else 
	COMMIT;
End If

CHOOSE CASE ls_arg_sys
	CASE  'compatibility_level'
		If not isnull(ls_level) and integer(ls_level) > 80 Then
			messagebox('Contractlogix',"Please set the database compatibility level to SQL Server 2000.~r~nOtherwise, some functions will not work.")	 
		End If
	CASE 'freespace'
		If not isnull(ls_level) and trim(ls_level)  <> "" Then
			messagebox('Contractlogix',ls_level)	 
		End If
	Case Else
		//		
END CHOOSE

return 1
end function

public subroutine of_check_registry_right ();//====================================================================
// Function: of_check_registry_right
//--------------------------------------------------------------------
// Description: Check Register
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:         Ken.Guo           Date: 01/14/2013
//--------------------------------------------------------------------
//Copyright (c) 2008-2012 Contract Logix, Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

Long ll_ret
String ls_test,ls_test2, ls_key,ls_key_reg
n_cst_systeminfo lnv_systeminfo

ls_test = String(now(),'HHMMSS')
ls_key = String(now(),'SS')

ll_ret = gnv_appeondll.of_registryset("HKEY_LOCAL_MACHINE\SOFTWARE\"+gs_DefDirName,ls_key, regstring!, ls_test) 
gnv_appeondll.of_registryget( "HKEY_LOCAL_MACHINE\SOFTWARE\"+gs_DefDirName,ls_key, ls_test2)
gnv_appeondll.of_registrydelete( "HKEY_LOCAL_MACHINE\SOFTWARE\"+gs_DefDirName,ls_key)

If ls_test <> ls_test2 Then
	
	//Added By Ken.Guo 05/31/2013
	lnv_systeminfo = Create n_cst_systeminfo
	If lnv_systeminfo.of_get_envvar('ProgramW6432') <> '' or lnv_systeminfo.of_get_envvar('ProgramFiles(x86)')  <> '' Then //Modified By Ken.Guo 03/22/2013
		ls_key_reg = 'HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\ContractLogix'//x86
	Else
		ls_key_reg = 'HKEY_LOCAL_MACHINE\SOFTWARE\ContractLogix'//X64	
	End If	
	Destroy lnv_systeminfo

	gnv_debug.of_output( True, 'Failed to check registry. gnv_appeondll.of_registryset(...)  = ' + String(ll_ret) )
	gnv_debug.of_output( True,'Set Registry = ' + "HKEY_LOCAL_MACHINE\SOFTWARE\"+gs_DefDirName + '; Key =' + ls_key + '; value = ' + ls_test)
	gnv_debug.of_output( True, 'Get Registry = ' + "HKEY_LOCAL_MACHINE\SOFTWARE\"+gs_DefDirName + '; Key =' + ls_key + '; Get value = ' + ls_test2)
	Messagebox('ContractLogix',"The system detected that you do not have permission to the Windows Registry key '"+ls_key_reg+"'. " +&
										"The system needs to create the registry key ‘"+ls_key_reg+"’ and its sub keys." +&
										"~r~n~r~nPlease contact your IT administrator to grant you this permission. Otherwise, the performance and some functions will be affected." )
End If

Return 
end subroutine

public function boolean of_get_relogin_status ();Return  ib_Relogin
end function

public subroutine of_set_relogin_status (boolean ab_relogin);ib_ReLogin = ab_Relogin
end subroutine

public function integer of_logout ();Long			ll_i,ll_NullArray[]
Window		lw_Temp, lw_Temp2, lw_NullArray[]

If of_get_app_setting("set_51","I") = 1 Then //Added By Ken.Guo 2015-04-20. Added If 
	IF Len(Trim(gs_word_user)) > 0 THEN f_set_doc_author(gs_word_user)
End If

//Added By Ken.Guo 07/12/2012. to workaround APB bug. when refresh IE, the popup window do not close.
For ll_i = 1 To UpperBound(gw_popup[])
	If Isvalid(gw_popup[ll_i])  Then
		If gw_popup[ll_i].classname() <> 'w_statusbar' Then Close(gw_popup[ll_i])
	End If
Next

gw_popup = lw_NullArray

lw_Temp = w_mdi.GetFirstSheet( )

do 
	If isvalid( lw_temp ) then	
		lw_Temp2 = w_mdi.Getnextsheet( lw_Temp )
//		if lw_temp.classname() = 'w_contract' then lw_temp.dynamic of_hide( )
		close( lw_Temp )
		lw_Temp = lw_Temp2
	End If

loop while isvalid( lw_temp )

of_log_off()

gnv_session.of_delete_current_session() //Added by Ken.Guo 08.26.2008

gnv_app.of_Setcontraccache( )

If IsValid( ids_screen_fields_cache ) Then Destroy ids_screen_fields_cache
If IsValid( ids_screen_objects_cache ) Then Destroy ids_screen_objects_cache
If IsValid( ids_report_fields_cache ) Then Destroy ids_report_fields_cache
If IsValid( ids_report_objects_cache ) Then Destroy ids_report_objects_cache
If IsValid( ids_screen_report_objects_cache ) Then Destroy ids_screen_report_objects_cache

gl_custom_colors = gl_custom_colors

gi_test_mode = 0

Return 0
end function

public function integer of_run_email_notifications ();//////////////////////////////////////////////////////////////////////
// $<function>app_fillerof_run_email_notifications()
// $<arguments>(None)
// $<returns> (none)
// $<description>
// $<description> Run Email Notifications
//////////////////////////////////////////////////////////////////////
// $<add> 2010-08-18 by Ken.Guo
//////////////////////////////////////////////////////////////////////
integer	li_return

UPDATE ids Set last_query = getdate()  ;

n_cst_email_alarm lnv_email_alarm
li_return = lnv_email_alarm.of_run_email_alarm( )

return li_return 

end function

public subroutine of_check_dbowner ();String ls_dbloginuser, ls_dbowner
str_pass lstr_pass
If gnv_data.of_GetItem('icred_settings','check_dbowner',False) = '1' Then
	SELECT SUSER_SNAME() ,SUSER_SNAME(owner_sid) Into :ls_dbloginuser, :ls_dbowner From sys.databases where name = db_name();
	If ls_dbowner <> ls_dbloginuser Then
		lstr_pass.s_string_array[1] = ls_dbloginuser
		lstr_pass.s_string_array[2] = ls_dbowner
		OpenwithParm(w_checkdbowner,lstr_pass )
	End If

End If


end subroutine

public function string of_get_word_versionnumber ();//====================================================================
// Function: of_get_word_versionnumber
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  string
//--------------------------------------------------------------------
// Author:         Ken.Guo 2015-07-14
//--------------------------------------------------------------------
//Copyright (c) 2008-2015 Contract Logix, Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


//OLEObject myoleobject
//myoleobject = Create oleobject
//IF myoleobject.Connecttonewobject("word.application") = 0 THEN 
//	is_word_versionnumber = String(myoleobject.Application.Version)
//	If Mid(String(myoleobject.Application.ProductCode), 21,1) = '1' Then
//		gb_word64bit = True
//	End If
//	myoleobject.Quit(0) 
//	myoleobject.DisconnectObject()	
//	If isvalid(myoleobject) Then destroy myoleobject
//END IF

//Should get the versin by Registry. 
String ls_value, ls_versin, ls_clsid
Long ll_pos

RegistryGet ( 'HKEY_CLASSES_ROOT\Word.Application\CLSID' , '', RegString!, ls_clsid )
If ls_clsid = '' Then
	gnv_debug.of_output(True, 'Failed to get the CLSID for word.application.')
	return ''
End If

RegistryGet ( 'HKEY_CLASSES_ROOT\CLSID\'+ls_clsid+'\InprocServer32' , 'Assembly', RegString!, ls_value )
If ls_value = '' Then  
	gnv_debug.of_output(True, 'Failed to get the word version. ' + "RegistryGet ( 'HKEY_CLASSES_ROOT\CLSID\{000209FF-0000-0000-C000-000000000046}\InprocServer32' , 'Assembly', RegString!, ls_value )")
	Return ''
End If
ll_pos = Pos(ls_value, 'Version=')

If ll_pos <= 0 Then
	gnv_debug.of_output(True, 'Failed to get the word version. ' + ls_value)
	Return ''
End If

ls_value = Mid(ls_value,ll_pos+Len('Version=') )

ll_pos = Pos(ls_value, '.')
ls_versin = mid(ls_value,1, ll_pos)
ls_value = mid(ls_value,ll_pos + 1 )

ll_pos = Pos(ls_value, '.')
ls_versin += mid(ls_value,1, ll_pos -1)
is_word_versionnumber = ls_versin

Return is_word_versionnumber


end function

public function integer of_set_word_safemode (boolean ab_force, integer ai_value);//====================================================================
// Function: of_set_word_safemode
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//                ai_value
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:         Ken.Guo 2015-07-14
//--------------------------------------------------------------------
//Copyright (c) 2008-2015 Contract Logix, Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

If Not ab_force Then
	If	gnv_data.of_getitem( 'icred_settings', 'set_word_safemode', False) <> '1'  Then 
		Return 0
	End If
End If

If is_word_versionnumber = '' Then
	of_get_word_versionnumber()
End If

If is_word_versionnumber <> '' Then
	If RegistrySet('HKEY_CURRENT_USER\Software\Microsoft\Office\'+is_word_versionnumber+'\Word\Resiliency','ForceSafeMode',ReguLong! , ai_value) <> 1 Then
		gnv_debug.of_output(true,'Failed to set to Safe Mode ('+String(ai_value)+'). Please make sure you have full control to modify the registry key.')
	End If
Else
	//No word or failed to get word version number.
End If

ib_modified_safemode = True

return 1

end function

public subroutine of_convertwordversion (string as_version);//added by gavins 20150811

If as_version = 'word2007' then return //default value
Choose Case as_version
		Case '9.0'
			gs_word_version = 'word2000'			
		Case '10.0'
			gs_word_version = 'wordxp'			
		Case '11.0'
			gs_word_version = 'word2003'			
		Case "12.0", "13.0", "14.0", "15.0", "16.0" //Modified By Mark Lee 04/16/2013	 13.0 = word2008, 14.0 =word2010, 15.0 =word2013, 16.0 = ?
			gs_word_version = 'word2007'					
		Case Else
			gs_word_version = 'other'
	End Choose	
end subroutine

public function integer of_check_ocx ();//====================================================================
// Function: of_check_ocx
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:         Ken.Guo 2016-03-16
//--------------------------------------------------------------------
//Copyright (c) 2008-2015 Contract Logix, Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

String ls_ret
n_cst_reg_control lnv_reg_ocx

ls_ret = lnv_reg_ocx.of_check_all_ocxs( False)
If ls_ret <> '' or lnv_reg_ocx.is_image_loss_files <> '' or lnv_reg_ocx.is_officecontrol_loss_files <> '' Then
	IF Messagebox('ActiveX Check ','The system detects OCX/DLL issue. Please go to Help -> Environment Check to find the detail information. ~r~nDo you want to open the Environment Check window now?', question!, yesno!) = 1 Then
		Open(w_environment_check)
	End If
	Return -1
End If

Return 1
end function

on app_filler.create
appname="app_filler"
message=create message
sqlca=create n_tr
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on app_filler.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;Integer 	li_set_9
Integer 	li_set7
Integer 	li_task
Integer 	li_prac_cnt
Integer 	vcnt
Integer 	set_34
Integer 	setprod
Long	  	li_rc
long		ll_Pos
Integer 	li_facility_cnt
Integer 	li_days
String 	ls_password
String 	ls_app
Integer 	li_logon_cnt
Integer 	i
Integer 	li_i_did_allready
Integer	li_Rtn
Date 		todaysdate
DateTime ld_lastupdate
DateTime ldt_now
Date 		ld_password
Date 		dateing
String 	ls_dev_head
String 	ls_ver_ck
String 	ls_dir_path
string 	ls_dbtype
string 	ls_TestMode
Integer 	li_session_ret
String 	ls_custom_colors
String	ls_RunParam,ls_CacheParam,ls_MoveToParam
//n_cst_rights LNVO_RIGHTS
integer li_dir_right,li_run_date_alarm  //Added By Ken.Guo 2010-02-26.
integer li_em_cnt,		li_https															//Added By Mark Lee 08/09/12
integer li_refresh_sertifi, li_check_email = 0
long		ll_OnlyExport,ll_refresh_interval
Long		ll_interval_days, ll_posurl //Added By Ken.Guo 2010-08-18.
n_cst_easymail_pop3 lnv_pop3
String 	ls_db_name, ls_server_name,	ls_arg_sys, ls_level,	ls_url	, ls_url_short		//Added By Mark Lee 08/09/12
String 	ls_tmp, ls_use_web_email
integer li_check_registry, li_check_trusted_sites
String ls_esigntype

PowerObject lpo_NullParm

If Not ib_ReLogin Then//added by gavins 20130515
	//of_check_doc() //Commented By Ken.Guo 01/07/2015. check it after user login
	
	gnv_win_backcolor = Create n_cst_backcolor_settings //Added by Evan.Cai 11.24.2008.
	gnv_debug = Create n_cst_debug  //Added by Ken.Guo on 2008-12-22
End If
todaysdate = Today()
ldt_now = DateTime(Today(),Now())


//$<reason> Get Current Directory.
Gs_Current_Directory = GetCurrentDirectory()
gs_current_path = Gs_Current_Directory
if of_test_mode_from_ini(Gs_Current_Directory  ) = 1 then 	gi_test_mode = 1  //Start Code Change ----07.22.2008 #V81 maha - check test mode for path function
//Added By mark 04/13/12
//of_get_dir_path(Gs_Current_Directory) //SETS THE DIRECTORY PATH BASED ON VARIOUS CRITERIA
gs_IniFilePathName = Gs_Current_Directory + "\intellicred.ini"  //Added By mark 04/13/12

SetNUll(Gs_MSFax_ServerName) //Added By Ken.Guo 05.06.2008

of_ini_registry() //Added By Ken.Guo 2009-12-21.

If Not ib_ReLogin Then//added by gavins 20130515
	gnv_session = Create n_cst_session 
	
	gnv_rights = Create n_cst_rights
	//Added By mark 04/13/12 moved the position  after logon
	//li_dir_right = gnv_rights.of_check_tempdir_right( ) //Added By Ken.Guo 2010-02-23.
	
	gnv_message = Create n_cst_message //Added By Ken.Guo 2010-11-12.

End If
//--------------------------- APPEON BEGIN ---------------------------
//$< Add  > 2007-09-14 By: Scofield
//$<Reason> Add connect cache process

if AppeonGetClientType() = 'WEB' then
	StopIEpopupmsg() //Added By Ken.Guo 2010-01-18.
	ls_RunParam = Trim(CommandLine)
	
	//Added By Ken.Guo 2016-06-24
	If pos(lower(ls_RunParam), '&ad=off') > 0 Then
		ls_RunParam = gnv_string.of_globalreplace(ls_RunParam, '&ad=off', '')
		gb_ad_command_off = True
	End If
	
	is_CommandLine = ls_RunParam
	if Not (IsNull(ls_RunParam) or ls_RunParam = "") then
		ll_Pos = Pos(ls_RunParam,"%")
		if ll_pos = 0 then ll_pos = Pos(ls_RunParam,"&")	//Fixed Bug, Change parm '%' to '&' - jervis 09.28.2010
		if ll_Pos > 0 then
			ls_CacheParam = Left(ls_RunParam,ll_Pos - 1)
			ls_MoveToParam = Mid(ls_RunParam,ll_Pos + 1)
			//Get idp server name and verify code - Jimmy.Lee 04.17.2014
				string lsa_queryArray[]
				string ls_idpname_tmp,ls_verifycode_tmp
				gnv_string.of_parsetoarray(ls_MoveToParam,"&",lsa_queryArray)
				if UpperBound(lsa_queryArray) > 0 then
					int paramindex = 0
					FOR paramindex = 1 to UpperBound(lsa_queryArray)
						ls_idpname_tmp = gnv_string.of_getkeyvalue(lsa_queryArray[paramindex],"idpname","=") 
						ls_verifycode_tmp = gnv_string.of_getkeyvalue(lsa_queryArray[paramindex],"verifycode","=")
						if ls_idpname_tmp <> "" then
							gs_idpname = ls_idpname_tmp
						end if
						if ls_verifycode_tmp <> "" then
							gs_verifycode = ls_verifycode_tmp
						end if
						i++
					NEXT
					if gs_idpname <> "" and gs_verifycode <> "" then
						//messagebox("idp and verify",gs_idpname + ";"  + gs_verifycode) //login
					end if
					
				end if
			// End Get idp server name and verify code
			If Lower(Trim(ls_MoveToParam)) = '2docquickview' Then
				gb_DocQuickView = True //Added By Ken.Guo 2010-09-07.				
			Else
				ll_Pos = Pos(ls_MoveToParam,"&")
				if ll_Pos > 0 then
					if IsNumber(Left(ls_MoveToParam,ll_Pos - 1)) then
						gl_MoveToCtxID = long(Left(ls_MoveToParam,ll_Pos - 1))
						//--------------------------- APPEON BEGIN ---------------------------
						//$<modify> 2009-04-17 By: Ken.Guo
						//$<reason> add DocID
						//gs_MoveToTabNo = Trim(Mid(ls_MoveToParam,ll_Pos + 1))
						ls_MoveToParam = Mid(ls_MoveToParam,ll_Pos + 1)
						ll_Pos = Pos(ls_MoveToParam,"&")
						If ll_Pos > 0 Then 
							gs_MoveToTabNo = Left(ls_MoveToParam,ll_Pos - 1)
							gl_MoveToDocID = Long(Trim(Mid(ls_MoveToParam,ll_Pos + 1)))
						Else
							gs_MoveToTabNo = ls_MoveToParam
						End If
						//---------------------------- APPEON END ----------------------------
					end if
				end if
			End If
		else
			ls_CacheParam = ls_RunParam
		end if
		
		ll_Pos = Pos(ls_CacheParam,",")
		if ll_Pos > 0 then
			gs_CacheName = Lower(Trim(Left(ls_CacheParam,ll_Pos - 1)))
			gs_CacheType = Upper(Trim(Mid(ls_CacheParam,ll_Pos + 1)))
		else
			gs_CacheName = Lower(Trim(ls_CacheParam))
		end if
		
		if gs_CacheName <> '' then
			gs_CacheSet = "CacheName= '" + gs_CacheName + "',DisableBind=1" //Added By Ken.Guo 04/02/2014. Added DisableBind
			if gs_CacheType = '' then
				gs_CacheType = "ODB-MSS" //default set to SQLServer
			end if
		end if
	end if
	
	if gl_MoveToCtxID > 0 and gl_MoveToDocID > 0 and gs_MoveToTabNo = "912" then
		gb_IsDocMode = true
		gb_PreloadCTX = true
	end if
end if

//Added By Ken.Guo 08/25/2014. for Web OP customer. they set the DB through AEM. 
//APB 6.8 should set the DisableBind to 1. 
If gs_CacheSet = '' Then
	gs_CacheSet = "DisableBind=1" 
End If

//---------------------------- APPEON END ----------------------------
If Not ib_ReLogin Then//added by gavins 20130515
	gs_client_ip = appeongetclientip() //Get client IP, Added by Ken.Guo 08.26.2008 
	
	//Start code by Jervis 01-12-2008, APB Unsupport.
	if AppeonGetClientType() = 'PB' then	
		inv_CoolMenu = Create n_coolmenu
		inv_CoolMenu.of_Initialize()
		inv_CoolMenu.of_SetResourceFile( "resources.dll" )
	
		//--------------------------- APPEON BEGIN ---------------------------
		//$<ID> UM-01
		//$<modify> 01/12/2006 By: Cao YongWang
		//$<reason> The 'create using as_menu' syntax in n_coolmenu.of_setmenu(string as_menu) function 
		//$<reason> is unsupported by Appeon, changed it to n_coolmenu.of_setmenu(menu amnu_menu)
		//inv_CoolMenu.of_SetMenu( 'm_pfe_cst_mdi_menu' )
		menu lmnu_menu
		lmnu_menu = Create m_pfe_cst_mdi_menu
		inv_CoolMenu.of_SetMenu( lmnu_menu )
		//---------------------------- APPEON END ----------------------------
		inv_CoolMenu.of_setxpstyle( )
	end if
	//End code by Jervis 01-12-2008
	
	gnv_app = Create n_cst_appmanager
End If

//$<reason> Initialize the global varibal for preselect data approach.
IF Not IsValid(gnv_data) THEN gnv_data = Create n_cst_globaldata
IF Not IsValid(gnv_word_utility) THEN gnv_word_utility = Create n_cst_word_utility		//Added By Mark Lee 06/20/2013


If Not ib_ReLogin Then//added by gavins 20130515
	
//	//Added By Ken.Guo 2016-09-14. copy from below //Commented By Ken.Guo 2016-09-26
//	If Not isvalid(gnv_user_option) Then //Added By Ken.Guo 09/15/2014
//		gnv_user_option = Create n_cst_user_option  //added by gavins 20130515
//	End If

	gnv_app.Event pfc_Open(CommandLine)
	gs_user_version =  gnv_app.of_getversion( )//Start Code Change ----02.05.2008 #V8 maha - moved from above as the version is set in the gnv_app.pfc_open event
	
	//Added By Mark Lee 05/14/2013 PBTrace
	ls_tmp = ProfileString(gs_IniFilePathName, "Setup", "PBTrace", "0") 
	If AppeonGetClientType() = 'PB' and not isnull(ls_tmp) and ls_tmp = '1' then			
		open(w_trace)
		w_trace.cb_startstop.triggerevent('clicked')
	End IF 
	
	Open( w_logon_screen )
	IF Message.StringParm = "Cancel" Or Message.StringParm = "DB Error" Or Message.StringParm = "" THEN //the last added maha 081502 for user clicking on X on login screen
		//Modified By Ken.Guo 10/15/2012
		If Message.StringParm = "DB Error" Then
			Halt
		Else
			Halt Close
		End If
	END IF
End If

//Added By Ken.Guo 2016-09-28
If Not isvalid(gnv_user_option) Then 
	gnv_user_option = Create n_cst_user_option  
End If

gnv_appeondb.of_startqueue()
gnv_user_option.of_Retrieve( gs_user_id )  
gnv_user_option.of_system_retrieve(  )   //Added By Ken.Guo 01/23/2013
gnv_user_option.of_viewid_retrieve( )					//Added By Mark Lee 01/15/2013

select DB_NAME(), @@SERVERNAME Into :ls_db_name, :ls_server_name from  ids ; 
//EXPIRED PASSWORD TESTING	
SELECT set_36 Into :li_set7 From icred_settings;					//Modified By Mark Lee 08/09/12 moved it
SELECT https Into :li_https From icred_settings;					//Added By Mark Lee 08/09/12
SELECT check_registry,check_trusted_sites Into :li_check_registry,:li_check_trusted_sites From icred_settings;
gnv_appeondb.of_commitqueue()

//of_check_doc() //Commented By Ken.Guo 2015-07-17。 Move to Down.
gs_word_version = 'word2007' //added by gavin 2015/08/11 default value

//Begin - Added By Mark Lee 08/09/12
if AppeonGetClientType() = 'WEB' then
	ls_url = 	appeongetieurl()
	//added by gavins 20151106
	update icred_settings set clx_weblink = :ls_url;
	If Not Isnull(li_https) And li_https = 1 Then
//		ls_url = 	appeongetieurl()
		If Upper(Left(ls_url,5)) <> 'HTTPS' Then
				MessageBox(gnv_app.iapp_object.DisplayName,"The current settings of the system only allow you to access ContractLogix using HTTPS. ~r~n Please change HTTP to HTTPS for accessing ContractLogix.")
				HALT CLOSE
		End If
	End If
	
	//trusted sites		//Added By Mark Lee 09/03/12
	If li_check_trusted_sites = 1 Then //Added By Ken.Guo 09/23/2013
		ls_tmp = gnv_user_option.of_get_option_value(gs_user_id, "trusted_sites" ) 
		If ls_tmp	= '1' or isnull(ls_tmp) or trim(ls_tmp) = '' Then
			If gf_trusted_sites(ls_url) = False Then
				
				//Added By Ken.Guo 2016-10-21
				ll_posurl = pos(ls_url, '/',9) 
				If ll_posurl > 0 Then
					ls_url_short = Left (ls_url, ll_posurl - 1)
				End If
				
				Messagebox(gnv_app.iapp_object.DisplayName,"Please add the current URL ~""+ls_url_short+"~" to IE’s trusted sites. ~r~n~r~nOtherwise, the system cannot be able to work properly.")
			End If 
		End If
	End If
End If 
//End - Added By Mark Lee 08/09/12
//do not need the intance name
If Pos(ls_server_name,'\') > 0 Then
	ls_server_name = left(ls_server_name, Pos(ls_server_name,'\') - 1)
End If 
//replace invalid format string and number 
ls_server_name = gnv_string.of_replace_invalid_format(ls_server_name,"")
ls_db_name		 = gnv_string.of_replace_invalid_format(ls_db_name,"")
gs_DefDirName = "ContractLogix" + "\DB_" + ls_server_name+"_"+ ls_db_name+ "\"+ gs_user_id
of_get_dir_path(Gs_Current_Directory) 
li_dir_right = gnv_rights.of_check_tempdir_right( ) 

//Commented By Ken.Guo 2015-04-29. 
////Added By Ken.Guo 05/31/2013
//String ls_registry
//If li_check_trusted_sites = 1 Then //Added By Ken.Guo 09/23/2013
//	ls_registry = gnv_user_option.of_get_option_value(gs_user_id, "check_registry")
//	If  ls_registry	= '1'  or isnull(ls_registry) or trim(ls_registry ) = '' Then
//		of_check_registry_right() //Added By Ken.Guo 01/14/2013
//	End If
//End If

//End--->Added By mark 04/13/12
//Added By Ken.Guo 2009-08-13.
of_clean_emailtempfile()

//Added By Mark Lee 08/09/12	moved it 
////EXPIRED PASSWORD TESTING	
//SELECT set_36 Into :li_set7 From icred_settings;

IF Upper(gs_user_id) = "MASTER" THEN

	//skip
	//$<reason> If Login with LDAP user, need not Expired	
	//else //if using expiring passwords for first time on a user it sets the expiration date for x days in the future.  Otherwise it checks the expiration date for the user and gives the appropriate message.
ELSEIF (gb_autologin = False  and gb_ad_login = False) THEN //Modified By Ken.Guo 2016-06-24
	IF li_set7 > 0 THEN
		SELECT last_pass_update Into :ld_password From security_users Where Upper(user_id) = :gs_user_id;
		li_days = DaysAfter ( Today(), ld_password )
		IF IsNull(ld_password) THEN
			ld_password = RelativeDate ( Today(),li_set7)
			
			gnv_appeondb.of_autocommit()
			UPDATE security_users Set last_pass_update = :ld_password Where Upper(user_id) = :gs_user_id;
			COMMIT Using sqlca;
			MessageBox("Password Expiration","Your password will expire in " + String(li_set7) + " days.  You can go to System->Change Password to change" )
		ELSEIF li_days < 0 THEN
			MessageBox("Password Expired","Your password has expired. Please Change.")
			OpenWithParm(w_change_password,"login")
			IF Upper(Message.StringParm) = "CANCEL" THEN
				MessageBox("Expired","Your password has expired.  It will have to be changed, or you will not be able to log in.  Closing program.")
				HALT CLOSE
			END IF
		ELSEIF li_days <= 10 THEN
			Integer passmes
			passmes = MessageBox("Password Expiring","Your password will expire in " + String(li_days) + " days.  Would you like to change it now? (You can Go to System->Change Password to change later if you wish.",question!,yesno!,2 )
			IF passmes = 1 THEN
				DebugBreak()
				OpenWithParm(w_change_password,"login")
			END IF
		END IF
	END IF
END IF
//end if 

lnv_pop3 = Create n_cst_easymail_pop3 //Added By Ken.Guo 2015-07-27
lnv_pop3.of_getunreademailcount(2, gs_user_id) //Added By Ken.Guo 2010-11-08. APB Bug, must out of Appeon queue.
If isvalid(lnv_pop3) Then Destroy lnv_pop3 //Added By Ken.Guo 2015-07-27

//Commented By mark 04/13/12 moved the position for set gs_DefDirName's value 
//gnv_user_option = Create n_cst_user_option //add by gavins 20120215 user options

gnv_appeondb.of_startqueue()

SELECT readonly,set_dashboard,refresh_sertifi,check_email Into :gi_user_readonly,:gi_opendashboard, :li_refresh_sertifi,:li_check_email
	From security_users Where Upper(user_id) = :gs_user_id;  //Added By Ken.Guo 09-18-2008
//Check version
SELECT count(user_id) Into :vcnt From sys_user_version Where user_id = :gs_user_id;
//Get last update date from ids table
SELECT Count( last_query) INTO :li_i_did_allready FROM ids Where Convert(varchar(10),last_query,101) = convert(varchar(10),getdate(),101);
Select DateDiff(Day,last_query,GetDate()) Into :ll_interval_days From  ids;
ids_screen_fields_cache = Create n_ds
ids_screen_fields_cache.DataObject = "d_screen_fields_cache"
ids_screen_fields_cache.of_SetTransObject( sqlca )
li_rc = ids_screen_fields_cache.Retrieve()

ids_screen_objects_cache = Create n_ds
ids_screen_objects_cache.DataObject = "d_screen_objects_cache"
ids_screen_objects_cache.of_SetTransObject( sqlca )
li_rc = ids_screen_objects_cache.Retrieve()

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 2008-08-19 By: Alan
ids_report_fields_cache = Create n_ds
ids_report_fields_cache.DataObject = "d_report_fields_cache"
ids_report_fields_cache.of_SetTransObject( sqlca )
//li_rc = ids_report_fields_cache.Retrieve()

ids_report_objects_cache = Create n_ds
ids_report_objects_cache.DataObject = "d_report_objects_cache"
ids_report_objects_cache.of_SetTransObject( sqlca )
//li_rc = ids_report_objects_cache.Retrieve()

ids_screen_report_objects_cache = Create n_ds
ids_screen_report_objects_cache.DataObject = "d_screen_report_objects_cache"
ids_screen_report_objects_cache.of_SetTransObject( sqlca )
//li_rc = ids_screen_report_objects_cache.Retrieve()
//---------------------------- APPEON END ----------------------------

SELECT lookup_cache,@@version Into :gdt_lookup_cache,:gs_sqlserver_version From ids;
SELECT screen_cache Into :gdt_screen_cache From ids;
SELECT screen_obj_cache Into :gdt_screen_obj_cache From ids;
SELECT version_id Into :ls_ver_ck From sys_user_version Where user_id = :gs_user_id;
SELECT Count( * )	INTO :li_facility_cnt FROM committee_lookup Where committee_lookup.facility_id = 1;	
SELECT set_task Into :li_task From security_users Where user_id = :gs_user_id;
SELECT COUNT(1) INTO :li_em_cnt From em_user_config where user_id = :gs_user_id;
SELECT DATEDIFF(day, es_last_refresh, getdate()) Into :ll_refresh_interval from ids;
//Commented By mark 04/13/12 moved the position for set gs_DefDirName's value 
//gnv_user_option.of_Retrieve( gs_user_id ) //add by gavins 20120215

gnv_appeondb.of_commitqueue()

If isnull(gi_user_readonly) Then gi_user_readonly = 0
If isnull(gi_opendashboard) Then gi_opendashboard = 0	

//Auto run DB Upgrade
of_Auto_UpgradeDB()

//Commented By Ken.Guo 10/26/2012
//Added By Mark Lee 07/05/12  judge compatibility level equal 80 for database
//wf_get_sysinfo('compatibility_level')


////Added By Mark Lee 08/14/12  add SQL adjuge free space
//If gnv_user_option.of_get_option_value(gs_user_id, "database_free_disk_space" ) = '1'  Then
//	wf_get_sysinfo('freespace')	
//End If	

//skip auto updates 
If Not ib_ReLogin Then//added by gavins 20130515
	gds_settings = Create datastore //maha 102004
	gds_settings.DataObject = "d_icred_settings"
	i = gds_settings.SetTransObject(sqlca)
	
	IF i < 1 THEN
		If ib_from_halt Then //Added By Ken.Guo 07.07.2008. Workaround for APB Bug.
			Messagebox('Database Upgrade','The system exits now. Please log in to the system again.')
		Else
			MessageBox("Database Connection Error","Error connecting to database.  Closing Program")
		End If
		halt close
	END IF
End If

gds_settings.Retrieve()

of_set_global_var( ) //Start Code Change ----11.15.2008 #V8 maha new function call
//Added by Nova on 2008-08-14
IF of_get_app_setting("set_ver_tip","I") = 1 THEN
IF of_check_version() = 1  THEN
	IF MessageBox("Warning","The application version is LESS THAN DB version. Would you like to continue now?~r~nClick Yes to continue.~r~nClick No to exit the application.",question!,yesno!,1) = 2 THEN
		HALT CLOSE
	END IF
END IF
end if

gnv_webapprove.of_initialization( )

gnv_appeondb.of_startqueue()
//--------------------------- APPEON BEGIN ---------------------------
//$<add> 01.06.2009 By: Ken.Guo
//$<reason> Get Custom colors
SELECT custom_colors,run_date_alarm Into :ls_custom_colors ,:li_run_date_alarm
	From security_users Where Upper(user_id) = :gs_user_id;  
//---------------------------- APPEON END ----------------------------
IF vcnt = 0 THEN
	INSERT Into sys_user_version Values (:gs_user_id,:gs_user_version,:ldt_now);
	COMMIT Using sqlca;
ELSE	
	IF ls_ver_ck <> gs_user_version THEN
		UPDATE sys_user_version Set version_id = :gs_user_version,mod_date = :ldt_now Where user_id = :gs_user_id;
		COMMIT Using sqlca;
	END IF
END IF
//Added By Ken.Guo 2010-03-26. set personal email config
If li_em_cnt = 0 Then
	Insert Into em_user_config(user_id,email_receive_start_date,email_receive_by_date,email_receive_by_clx,email_receive_by_subject,email_receive_all,email_log,email_delete_from_server,email_timer,auto_add_ctx)
	Select :gs_user_id,(select email_start_date from icred_settings),1,1,1,0,2,0,3,1;
End If
gnv_appeondb.of_commitqueue()

//--------------------------- APPEON BEGIN ---------------------------
n_cst_string_appeon lnv_string_appeon
lnv_string_appeon.of_parsetolangarray(ls_custom_colors,';',gl_custom_colors[])
gl_custom_colors_org[] = gl_custom_colors[]
//---------------------------- APPEON END ----------------------------

//TESTING FOR NEW INSTALL FOR MODULE SETUP
setprod = of_get_app_setting("set_product","I")
IF setprod = 1 THEN
	Open(w_install_module_update)
	gds_settings.Retrieve()
	IF Message.StringParm = "Cancel" THEN
		HALT CLOSE
	END IF
END IF

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 08.27.2008 By: Ken.Guo
//$<reason> Create session. For license console.
//$If Invalid license key, then halt app;
//$If valid license and failed to create session, then continue.
Integer li_sess_ret
li_sess_ret = of_create_session()
If li_sess_ret < 0 and li_sess_ret <> -12 Then
	gnv_session.of_delete_current_session()
	Halt Close
End If
//---------------------------- APPEON END ----------------------------

//RETRIEVE CACHE DATA
of_getting_datacaches()  //10.25.2011 by jervis

////Added By Ken.Guo 2015-07-14
//If	gnv_data.of_getitem( 'icred_settings', 'set_word_safemode', False) = '1' Then
//	This.of_set_word_safemode(1)
//	ib_modified_safemode = true
//End If
If	gnv_data.of_getitem( 'icred_settings', 'unload_word_addins', False) = '1' Then
	inv_word_addins.of_set_word_unload_addins(1)
	ib_modified_addins = true
End If

of_check_doc() //Added By Ken.Guo 2015-07-17. move here from top

IF appeongetclienttype() = 'WEB' THEN
	SELECT image_flag Into :gs_image_flag From security_users Where user_id = :gs_user_id;
END IF

Close(w_open_message) 

////Prompt license agreement of Image for Windows - Alfee 07.14.2008
//n_cst_imaging lnv_imaging
//IF lnv_imaging.of_prompt_license() = -1 THEN
//	Halt Close
//END IF
If Not ib_ReLogin Then//added by gavins 20130515
	gnv_dashboard_data = Create n_cst_dashboard_data //Added by Ken.Guo 2008-08-06
	
	This.ToolbarText = True
	if appeongetclienttype() = 'WEB' THEN this.toolbarusercontrol = false //add By Jervis:APB Bug
	Open(w_mdi)
End If

//SET PROGRAM TITLE
IF Upper( gs_cust_type ) = 'I' THEN
	w_mdi.Title = "IntelliApp For Windows"
	ls_app = "IntelliApp"
ELSEIF gb_contract_version = True THEN //set_9 = 4 //Start Code Change ---- 10.06.2006 #688 maha
	w_mdi.Title = "Contract Logix For Windows"
	ls_app = "Contract Logix"
ELSE
	w_mdi.Title = "IntelliCred For Windows"
	ls_app = "IntelliCred"
END IF

IF gi_test_mode = 2 THEN //maha 080702 moved here 112502 from w_mdi(open) because of preceding code
	w_mdi.Title =  ls_app + " Using Test Database"
ELSEIF gi_test_mode = 1 THEN
	w_mdi.Title =  ls_app + " in Debug Mode"
ELSEIF gi_test_mode = 3 THEN
	//select dev_title into :ls_dev_head from icred_settings;
	ls_dev_head = gds_settings.GetItemString(1,"dev_title")
	IF IsNull(ls_dev_head) THEN ls_dev_head = ""
	w_mdi.Title = ls_app + " using " + ls_dev_head
END IF
gs_mdi_title = w_mdi.title //for clearing out Word instances - Alfee 01.16.2008

//Start Code Change ----03.28.2008 #V8 maha - seting for testmode from ini file
ls_TestMode = ProfileString(gs_IniFilePathName, "Setup", "Testmode", "0") 
if ls_TestMode = "1" then gi_test_mode = 1
//End Code Change---03.28.2008

//Begin - Added By Mark Lee 09/04/12
//if ProfileString(gs_IniFilePathName, "Setup", "RestoreState", "0") = '1' then	//Add by jerivs 09.10.2009 
//	//Save Contract Folder State
//	gb_restore_contract_state = true
//end if
If gnv_user_option.of_Get_option_value( gs_user_id,"restore_contract_state" ) = '1' then
	//Save Contract Folder State
	gb_restore_contract_state = true
End If 
//End - Added By Mark Lee 09/04/12

//Get Snap to grid - jervis 06.11.2010
gi_snaptogrid_x = ProfileInt ( gs_IniFilePathName, "Setup", "SnapToGridX", 1 )
gi_snaptogrid_y = ProfileInt ( gs_IniFilePathName, "Setup", "SnapToGridY", 1 )

//INTELLIAPP SETTINGS
IF Upper( gs_cust_type ) = 'I' THEN
	UPDATE facility_ver_rules
		SET default_verif_means = 15,
		verifY_data = 'B'
		WHERE ( facility_id = 1 ) AND
		( facility_ver_rules.screen_id In (4,5,15,19,20,23) )   ;
	COMMIT Using sqlca;
	IF sqlca.SQLCode = -1 THEN
		MessageBox("SQL Error", sqlca.SQLErrText )
	END IF
	
	IF li_facility_cnt = 0 THEN
		INSERT INTO committee_lookup
			( committee_id,
			facility_id,
			committee_name )
			VALUES ( 1,
			1,
			'Credentialing Committee' )  ;			
		IF sqlca.SQLCode = -1 THEN
			MessageBox("SQL Error", sqlca.SQLErrText )
		END IF		
	END IF
END IF

//Registry dll & ocx files 
of_reg_dllocx()   //Move from down. Ken.Guo 2009-03-09
gnv_appeondll.of_parsepath(gs_dir_path + gs_DefDirName + "\Agreement\Manager") //Added By Ken.Guo 2010-02-04.

//SET WORD PATH
IF appeongetclienttype() = 'PB' THEN
	IF Not FileExists(gs_IniFilePathName) THEN
		MessageBox("ini File Error", "No intellicred.ini file found at: " + gs_IniFilePathName + "~rThis may cause errors in the program including printing letters." )
	ELSE //check the word path
		IF FileExists( "C:\Program Files\Microsoft Office\Office12\winword.exe") THEN
			SetProfileString(gs_IniFilePathName, "paths", "word", " C:\Program Files\Microsoft Office\Office12\winword.exe")
		ELSEIF FileExists( "C:\Program Files\Microsoft Office\Office11\winword.exe") THEN
			SetProfileString(gs_IniFilePathName, "paths", "word", " C:\Program Files\Microsoft Office\Office11\winword.exe")
		ELSEIF FileExists( "C:\Program Files\Microsoft Office\Office10\winword.exe") THEN
			SetProfileString(gs_IniFilePathName, "paths", "word", " C:\Program Files\Microsoft Office\Office10\winword.exe")
		ELSE
			//leave it as is
		END IF
	END IF
ELSE
	IF FileExists( "C:\Program Files\Microsoft Office\Office12\winword.exe") THEN
		SetProfileString(gs_IniFilePathName, "paths", "word", " C:\Program Files\Microsoft Office\Office12\winword.exe")
	ELSEIF FileExists( "C:\Program Files\Microsoft Office\Office11\winword.exe") THEN
		SetProfileString(gs_IniFilePathName, "paths", "word", " C:\Program Files\Microsoft Office\Office11\winword.exe")
	ELSEIF FileExists( "C:\Program Files\Microsoft Office\Office10\winword.exe") THEN
		SetProfileString(gs_IniFilePathName, "paths", "word", " C:\Program Files\Microsoft Office\Office10\winword.exe")
	ELSE
		//leave it as is
	END IF
END IF


This.of_check_dbowner()

//Added By Ken.Guo 11/03/2014
If gnv_user_option.of_get_option_value(gs_user_id, "modify_windows_border_padding" ) <> '0' Then
	If gf_set_windows_border_padding('-15') = 1 Then
		If gnv_user_option.of_get_option_value(gs_user_id, "modify_windows_border_padding" ) = '' Then
			gnv_user_option.of_set_option_value(gs_user_id, "modify_windows_border_padding",'1' )
		End If
	End If
End If

//Added By Ken.Guo 2015-07-31
If gnv_user_option.of_get_option_value(gs_user_id, "word_new_instance" ) = '1' Then
	inv_word_addins.of_add_word_shortcut( )
	inv_word_addins.of_set_word_new_instance(1)
End If

//SET HELP FILES
IF gs_cust_type = "I" THEN //maha 030606
	gnv_app.of_sethelpfile( gs_dir_path + gs_DefDirName + "\IntelliApp_User_Guide.chm")
ELSE
	gnv_app.of_sethelpfile( gs_dir_path + gs_DefDirName + "\IntelliCred_User_Guide.chm")
END IF

If Not ib_ReLogin Then  of_set_global_word('open') //added by gavins 20130515

//set doc's user name to APP login name- 23-03-2007 By: Ken.Guo
If of_get_app_setting("set_51","I") = 1 Then //Added By Ken.Guo 2015-04-20. Added If 
	f_set_doc_author(gs_user_id)
End if
//$<Reason> Clean the temporary files - 2007-10-30 By: Scofield
of_CleanTmpFile()
//Clear out invalid Word instances opened by the system - By Alfee 01.16.2008
of_clearout_word()

//BEGIN---Modify by Scofield on 2010-05-18
SELECT AutoExport INTO :ll_OnlyExport FROM security_users WHERE user_id = :gs_user_id;
if ll_OnlyExport = 1 and gb_DocQuickView = False then
	gb_AutoExport = true
	OpenWithParm(w_auto_export,"I")
//	Halt close									//Added By Mark Lee 11/12/2015
	return 
end if

//Added by Ken.Guo 20110801
if ll_OnlyExport = 2 and gb_DocQuickView = False then
	OpenWithParm(w_ocr_all_document,"AUTO")
	Halt close
end if

//Added By Ken.Guo 10/18/2012
if ll_OnlyExport = 3 and gb_DocQuickView = False then
	gb_AutoImport = True						//Added By Mark Lee 11/12/2015
	OpenWithParm(w_auto_import,'')
//	Halt close										//Added By Mark Lee 11/12/2015
	return 
end if

//Added By Ken.Guo 08/16/2013
if ll_OnlyExport = 4 and gb_DocQuickView = False then
	gb_AutoReport = True
	OpenWithParm(w_auto_report,'')
//	Halt close									//Added By Mark Lee 11/12/2015
	return 
end if

//END---Modify by Scofield on 2010-05-18

//OPEN TASK LIST
//Start Code Change ----11.15.2007 #V8 maha  changed to a user setting
IF gi_iapp_on = 1 And li_task = 1 and gb_DocQuickView = False THEN
	Open( w_dash )
END IF

//--------------------------- APPEON BEGIN ---------------------------
//$< Add  > 2008-11-04 By: Scofield
//$<Reason> Loading Contract Folder.
//Added 'li_dir_right > 0' By Ken.Guo 2010-03-01. If user have no right for temp dir, then disable preload Contract Folder,Otherwise error.
If Not ib_ReLogin Then//added by gavins 20130515
//	if gb_contract_version and gb_PreloadCTX and li_dir_right > 0 and gb_DocQuickView = False then 	//Added By Mark Lee 02/17/2014
	if gb_contract_version and (gb_PreloadCTX and w_mdi.of_security_access(7001) = 1) and li_dir_right > 0 and gb_DocQuickView = False then 
		if gb_IsDocMode then
			OpenWithParm(w_appeon_gifofwait,"Loading Document. Please wait...")//This may take a few minutes. ~r~nmodify by gavin 2012-01-10
		else
			OpenWithParm(w_appeon_gifofwait,"Loading Contract Folder. Please wait...")//This may take a few minutes. ~r~n
		end if
		
		Timer(0,w_appeon_gifofwait)
		
		w_appeon_gifofwait.st_1.Height = 120
		w_appeon_gifofwait.st_1.Y = 30
		w_appeon_gifofwait.SetRedraw(true)		//APB Bug - jervis 06.17.2009
		
		w_appeon_gifofwait.of_SetMaxPosition(100)
		w_appeon_gifofwait.of_SetPosition(10)
		w_appeon_gifofwait.of_SetStep(10)
		
		OpenSheet(w_contract, w_mdi, 4, original!)
		w_appeon_gifofwait.of_SkipNextPosition(20)
		w_contract.of_LoadTabpage()
	else
		If Not gb_DocQuickView Then
			w_mdi.WindowState = Maximized!
			w_mdi.Show()
		End If
	end if
End If
//---------------------------- APPEON END ----------------------------

//--------------------------- APPEON BEGIN ---------------------------
//$< Add  > 2008-07-14 By: Ken.Guo
//$<Reason> Open Dashboard window.
If gnv_data.of_GetItem( "icred_settings", "set_dashb", False ) = '1' Then
	If gi_opendashboard = 1 and w_mdi.of_security_access(6942) <> 0 and gb_DocQuickView = False Then //Modify by Evan 11/13/2008 (Add security condition)
		Opensheet(w_dashboard,w_mdi,4, Original!)
	End If
End If
//---------------------------- APPEON END ----------------------------

//OPEN PREFERED WINDOW
//Start Code Change ----11.15.2007 #V8 maha  opens selected user screen 
If gb_DocQuickView = False Then Post of_open_at_start()
//End Code Change---11.15.2007

//$<add> 04.29.2008 By: Evan
//$<reason> Email setting reminder after system startup.
//Start Code Change ----10.08.2008 #V85 maha
Integer li_run_alarm
//select set_56,run_alarm into :i,:li_run_alarm from icred_settings;				//Added By Mark Lee 08/21/2013
select set_56,run_alarm, use_web_email into :i,:li_run_alarm, :ls_use_web_email from icred_settings;
if i = 1 then
	//skip for outlook
else
	If gb_DocQuickView = False And li_check_email = 1 Then //Modified By Ken.Guo 09/29/2011. Added li_check_email
		Post f_EmailSettingRemind(True) //Add by Evan on 04/29/2008
	End If
end if
//End Code Change---10.08.2008

If gb_DocQuickView Then	OpenSheet( w_documents_browse, w_mdi, 0, Original!)

//Send all Email Alarms
If li_dir_right > 0 and gb_DocQuickView = False Then
	If li_run_alarm = 1 or isnull(li_run_alarm) Then
//		if not isnull(ls_use_web_email) and ls_use_web_email = "1" then 	//Added By Mark Lee 08/21/2013
		This.Post of_send_email( li_i_did_allready, li_dir_right, li_run_date_alarm, ll_interval_days )
	Else
		//run it after run CL. of_send_email() included this script
		//gnv_webapprove.of_refresh_status( ) 
	End If
	
	//Added By Ken.Guo 12/31/2011. 
	gnv_webapprove.of_refresh_status( ) 
	
	//Added By Ken.Guo 2011-05-30. //Refresh Sertifi when user login.
	gs_esigntype = lower(gnv_data.of_getitem( 'icred_settings', 'esign_type', False)) //Added By Jay Chen 10-09-2013
	gs_echosign_method = lower(gnv_data.of_getitem( 'icred_settings', 'echosign_method', False)) //Added By Jay Chen 02-04-2016
	gnv_sertifi = Create n_cst_sertifi  
	gnv_echosign = Create n_cst_echosign
	gnv_docusign = Create n_cst_docusign //Added By Jay Chen 04-09-2014
	If gnv_data.of_getitem( 'icred_settings', 'esign', False) ='1' and li_refresh_sertifi = 1 And &
		gnv_data.of_getitem('security_users' ,'refresh_sertifi' ,'user_id = "' + gs_user_id +'"' ) = '1' Then
		//Added By Mark Lee 03/20/2015
		//Check My Email Address.
		string 	ls_emailaddress
		long 		ll_count
		
		gnv_appeondb.of_startqueue()
		SELECT email 
		INTO :ls_emailaddress
		FROM em_smtp_accounts
		WHERE (user_id = :gs_user_id) AND (is_default = 'Y');
		
		Select count(1) Into :ll_count from ctx_am_document 
		where checkout_status = '5'  and (esign_type = 'sertifi' or esign_type = 'echosign' or esign_type = 'docusign' ) ;
		gnv_appeondb.of_commitqueue( )
	
		If (ls_emailaddress = '' or isnull(ls_emailaddress) or  Pos(ls_emailaddress,'@') <= 0) Then
			if gb_prompt_emailaddress = false then 
				gb_prompt_emailaddress = true
				Messagebox('Email Address Error',"Your account is not set up with an valid email account address. ~r~nYour email account  is needed to provide full functionality with Sertify, Echosign, and Docusign tools. ~r~n~r~nPlease enter your email account address in Personal Settings -> Email Account."    )
			end if 
		else
			if ll_count > 0 then 
//				gnv_sertifi.of_refresh_sertifi_status()
//				gnv_echosign.of_refresh_sertifi_status()
//				gnv_docusign.ib_ping_server = false 
//				gnv_docusign.of_refresh_sertifi_status()
//				gnv_docusign.ib_ping_server = true 
				gnv_app.of_refresh_sign( true)						//Added By Mark Lee 04/03/2015
//				gb_prompt_emailaddress = false					//Added By Mark Lee 03/24/2015
			end if 
		end if 
	End If
	
End If

//Added By Ken.Guo 2016-03-16
//Post of_check_ocx()//Modified by gavins 20161019  because saas upgrade apb6.5 to apb6.8 ActiveX issue.

//gb_EnableSetPosition = gf_CheckSetposition( ) //added by gavins 20120528  modify by gavins 20130515

end event

event close;long ll_i 
//select set_cont into :ll_i  from icred_settings;


//Added By Mark Lee 05/14/2013
If isvalid(w_trace) then
	Close(w_trace)
End If

//Restore the default user in Word - alfee 07.08.2008
If of_get_app_setting("set_51","I") = 1 Then //Added By Ken.Guo 2015-04-20. Added If 
	IF Len(Trim(gs_word_user)) > 0 THEN f_set_doc_author(gs_word_user)
End If

//Added By Ken.Guo 07/12/2012. to workaround APB bug. when refresh IE, the popup window do not close.
For ll_i = 1 To UpperBound(gw_popup[])
	If Isvalid(gw_popup[ll_i]) Then 
		If gw_popup[ll_i].classname()  =  'w_statusbar' Then //Added By Ken.Guo 2017-06-02 Workaround IE Crash bug when close this window.
			 gw_popup[ll_i].hide()
			 Continue
		End If
		Close(gw_popup[ll_i])
	End If
Next

//Added By Ken.Guo 2015-07-14. //restore to normal
If	ib_modified_safemode Then
	This.of_set_word_safemode(True, 0)  
End If
If	ib_modified_addins Then
	inv_word_addins.of_set_word_unload_addins(0) 
End If


of_log_off()  //Start Code Change ---- 10.05.2006 #686 maha

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 23-03-2007 By: Ken.Guo
//$<reason> set doc's user name to OS login name
//f_set_doc_author('')
//---------------------------- APPEON END ----------------------------

//Start code change ---11.29.2006 Henry. no necessary to refresh cache when close the application.
//if ll_i <> 0 then 
//		setpointer(hourglass!)
//		gnv_app.ib_ref_cache  = true
//		gnv_app.of_setcontraccache( ) 
//		setpointer(arrow!)
//end if 
//End code change -- 11.29.2006

gnv_app.of_SetDwCache ( False )
destroy gds_settings

//Start code by Jervis 01-12-2008, APB Unsupport.
if AppeonGetClientType() = 'PB' then	
	inv_Coolmenu.of_Uninitialize()
	Destroy inv_Coolmenu
end if

if IsValid(gds_contract_screen) then
	Destroy gds_contract_screen
end if

//if IsValid(gnv_data) then
//	Destroy gnv_data
//end if

If isvalid(gnv_dashboard_data) Then
	Destroy gnv_dashboard_data
End If

////Added By Mark Lee 04/18/2014
//if not isnull(gs_verifycode) and  trim(gs_verifycode) <> "" then 
//	update idp_users set  idpuser_validetime = getutcdate() , app_verifycode = "" 	
//	where  app_verifycode = :gs_verifycode  using sqlca;
//	
//	gs_verifycode = ""
//end if 
	
gnv_session.of_delete_current_session() //Added by Ken.Guo 08.26.2008

of_set_global_word('close')

Disconnect Using SQLCA;

if AppeonGetClientType() = 'WEB' then
	ResumeIEpopupmsg()
End If

//--------------------------- APPEON BEGIN ---------------------------
//$<Add> 08.23.2007 By: Evan
//$<Reason> Need to destroy object.
if IsValid(gnv_data) then Destroy gnv_data
if IsValid(gds_lookup) then Destroy gds_lookup
if IsValid(gnv_app) then Destroy gnv_app
If Isvalid(gnv_session) Then Destroy gnv_session //Added by Ken.Guo 08.26.2008
If Isvalid(gnv_debug) Then Destroy gnv_debug //Added by Ken.Guo on 2008-12-22
If isvalid(gnv_rights ) Then destroy gnv_rights
If isvalid(gnv_word_utility ) Then destroy gnv_word_utility		//Added By Mark Lee 06/20/2013
//---------------------------- APPEON END ----------------------------



end event

event systemerror;

f_system_error_handler ('')
end event

event idle;// mskinner 16 feb 2006 -- begin
gnv_app.event pfc_idle( )
// mskinner 16 feb 2006 -- end

end event

