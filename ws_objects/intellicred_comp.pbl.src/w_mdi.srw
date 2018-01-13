$PBExportHeader$w_mdi.srw
forward
global type w_mdi from w_frame
end type
type dw_statusbar from uo_statusbar within w_mdi
end type
type st_vsplit from statictext within w_mdi
end type
type dw_ezmenu from uo_listbar within w_mdi
end type
end forward

global type w_mdi from w_frame
boolean visible = false
integer width = 2779
integer height = 2064
string title = "IntelliCred"
string menuname = "m_pfe_cst_mdi_menu"
boolean hscrollbar = true
boolean vscrollbar = true
windowtype windowtype = mdi!
windowstate windowstate = maximized!
event pfc_cst_screen_painter ( )
event pfc_cst_lookup_painter ( )
event pfc_cst_practitioner ( )
event pfc_cst_action_items ( )
event pfc_cst_meetings_month_calendar ( )
event pfc_cst_meetings_month_list ( )
event pfc_cst_app_audit_painter ( )
event pfc_cst_export_painter ( )
event pfc_cst_reports ( )
event pfc_cst_profile_view_manager ( )
event pfc_cst_survey_painter ( )
event pfc_cst_facility_painter ( )
event pfc_cst_letter_painter ( )
event pfc_cst_letter_generator ( )
event pfc_cst_view_audit ( )
event pfc_cst_security_role_painter ( )
event pfc_cst_delete_practitioner ( )
event pfc_cst_security_user_painter ( )
event pfc_cst_image_type_painter ( )
event pfc_cst_priviledge_painter ( )
event pfc_cst_multi_app_painter ( )
event pfc_cst_prac_profile_painter ( )
event pfc_cst_case_review ( )
event pfc_cst_contract_screen_painter ( )
event pfc_cst_workflow_painter ( )
event pfc_cst_email_painter ( )
event pfc_cst_import_painter ( )
event pfc_cst_contact ( )
event pfc_cst_bidq ( )
event pfc_cst_report_painter ( )
event pfc_cst_profile_rpt ( )
event pfc_cst_contract_details_layout_setting ( )
event ue_refreshezmenu ( )
event pfc_cst_ezmenu_painter ( )
event pfc_cst_relogin ( )
event pfc_cst_request_form_painter ( )
event pfc_cst_webapi_key_painter ( )
event pfc_cst_import_salesforcepainter ( )
dw_statusbar dw_statusbar
st_vsplit st_vsplit
dw_ezmenu dw_ezmenu
end type
global w_mdi w_mdi

type prototypes
// ANSI
function long GetWindowLongA (long hWindow, integer nIndex) Library "user32.dll"
function long SetWindowLongA (long hWindow, integer nIndex, long dwNewLong) library "user32.dll"  
// Unicode
function long GetWindowLongW (long hWindow, integer nIndex) Library "user32.dll"  
function long SetWindowLongW (long hWindow, integer nIndex, long dwNewLong) library "user32.dll"

end prototypes

type variables
Window iw_prac[]
Integer iw_prac_cnt

Window iw_action_items[]
Integer iw_action_items_cnt

Integer ii_security_action_id[]
Integer ii_security_action_value[]

//>>>>>>>>>>>>>>>>>>>>>
// <RP> 8.30.2017
boolean ib_unicode
//<<<<<<<<<<<<<<<<<<<<<


n_coolmenu inv_CoolMenu

long		il_AtomID			//Added by Scofield on 2008-06-11
long		il_AtomdwStates	//Added by Scofield on 2010-04-27

Long il_time_seq //Added by Ken.Guo 08.26.2008

String is_current_window_name //Added By Ken.Guo 2010-12-15.

Boolean		ib_ShowMainToolbar //Added by gavins 20130312
Long			il_Original_EZMenuWidth

private:
Boolean		ib_EZMen_First //added by gavins 20130325
Integer		ii_offsetX, ii_LastX
Boolean		ib_Drag
Boolean		ib_ReLogin

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// <RP> 8.11.2017 Win API constants
//    Private Declare Auto Function SetWindowLong Lib "User32.Dll" (ByVal hWnd As IntPtr, ByVal nIndex As Integer, ByVal dwNewLong As Integer) As Integer
//    Private Declare Auto Function GetWindowLong Lib "User32.Dll" (ByVal hWnd As System.IntPtr, ByVal nIndex As Integer) As Integer
constant long GWL_EXSTYLE = (-20)
// HEX 0x200 = 512 = &H200 (VB)
constant long WS_EX_CLIENTEDGE = 512
//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

end variables

forward prototypes
public function integer of_security_access (integer ai_action_id)
public function integer of_setup_security ()
public function integer of_menu_security (string as_menu_name)
public function integer of_prac_folder_security (w_prac_data_1 aw_prac_folder)
public function integer of_action_items_security (w_action_items aw_action_items)
public function integer of_delete_practitioner ()
public function integer of_module_check ()
public function integer of_version_check ()
public function integer of_qa_peer_screen_security (w_reappointment_measurements_search aw_prac_folder)
public subroutine of_getcurrentobject ()
public function integer of_menu_image_security (string as_menu_image)
public subroutine of_hidemenuandtoolitems (menu am_menu)
public subroutine of_menu_security_2 (string as_menu_name)
public subroutine of_savedwstates ()
public function integer of_showezmenu (boolean ab_show)
public subroutine of_showtoolbar (boolean ab_show)
public subroutine of_refresh_ezmenu_enable ()
public subroutine of_set_ezmenu_enabled (string as_parentmenuname, string as_menuname, boolean ab_enabled)
public subroutine of_set_ezmenu_visible (string as_parentmenu, string as_menu, boolean ab_value)
public subroutine of_set_ezmenu_check (string as_parentmenu, string as_menu, boolean ab_value)
public subroutine of_set_ezmenu_text (string as_parentmenu, string as_menu, string as_text)
public subroutine of_set_ezmenu_pic (string as_parentmenu, string as_menu, string as_pic)
public subroutine of_set_spitbar_visible (boolean ab_visible)
public subroutine of_refresh_ezmenu_screen ()
public subroutine of_restore_toolbar_attr ()
public function integer wf_checkisvalidwin (boolean ab_closewin)
end prototypes

event pfc_cst_screen_painter();//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 09.26.2006 By: Liang QingShi
//$<reason> 
/*
OpenSheet( w_prac_data_design, This)
*/
OpenSheet(w_prac_data_design, w_mdi, 4, original!)
//---------------------------- APPEON END ----------------------------

end event

event pfc_cst_lookup_painter;OpenSheet(w_lookup_maint, w_mdi, 4, original!)
IF IsValid( m_pfe_cst_data_entry ) THEN
	m_pfe_cst_data_entry.m_edit.m_refreshlookupdata.Event Clicked ( )
END IF


end event

event pfc_cst_practitioner();/****************************************************************************************************************
** [PUBLIC] EVENT   w_mdui :: pfc_cst_practitioner
**--------------------------------------------------------------------------------------------------------------
** Description	:
**--------------------------------------------------------------------------------------------------------------
** Arguments	:	NONE
**--------------------------------------------------------------------------------------------------------------
** Returns		:	(none) 
**--------------------------------------------------------------------------------------------------------------
** Author		:	? 
**--------------------------------------------------------------------------------------------------------------
** ModIFication Log:	
**
** Date            Who                   Change  	
**--------------------------------------------------------------------------------------------------------------
** 15 Nov 2004     MSKINNER				Changed Layered! to ORIGINAL! Needed for the resize
**                                        to work properly
**	28 March 2005  Mskinner              added Move(0,0) to make sure it is in the upper left corner												 
**
****************************************************************************************************************/

SetPointer(hourglass!)

//OpenWithParm(w_extended_search, "DATAENTRY")

//iw_prac_cnt++
//debugbreak()
//OpenSheet( iw_prac[ iw_prac_cnt], "w_prac_data_1", w_mdi, 4, Layered!)
///setredraw(false)

IF gs_cust_type = "I" THEN
	OpenSheet( w_prac_data_intelliapp, w_mdi, 4, original!)
	w_prac_data_intelliapp.move(0,0)
	
ELSE
	OpenSheet( w_prac_data_1, w_mdi, 4, original!)
	//w_prac_data_1.move(0,0)
END IF

//setredraw(true)
end event

event pfc_cst_action_items();//iw_action_items_cnt++
//OpenSheet( iw_action_items[ iw_action_items_cnt ], "w_action_items",  w_mdi, 4)

IF gs_cust_type = "I" THEN
	OpenSheet( w_action_items_ia,  w_mdi, 4)
	If w_action_items_ia.WindowState = Minimized! Then w_action_items_ia.WindowState = Maximized! //Added by Ken.Guo on 2009-01-20
ELSE
	OpenSheet( w_action_items,  w_mdi, 4,Original! )
	If w_action_items.WindowState = Minimized! Then w_action_items.WindowState = Maximized! //Added by Ken.Guo on 2009-01-20	
END IF
end event

event pfc_cst_meetings_month_calendar;OpenSheet( w_meetings , This, 4)
end event

event pfc_cst_app_audit_painter();IF gs_cust_type = "I" THEN
	Open( w_app_audit_setup_ia )	
ELSE
	Open( w_app_audit_setup )
	
END IF
end event

event pfc_cst_export_painter();//Open( w_export_painter )
//--------------------------- APPEON BEGIN ---------------------------
//$<add> 11.01.2007 By: NOVA
//$<reason> New feature of import module.
OpenSheet(w_export_painter, w_mdi, 4, Original!)
//---------------------------- APPEON END ----------------------------
end event

event pfc_cst_reports();OpenSheet( w_report, w_mdi, 4, Original!)
end event

event pfc_cst_profile_view_manager;Open( w_profile_view_manager )
end event

event pfc_cst_survey_painter;Open(w_survey_painter)
end event

event pfc_cst_facility_painter;IF gs_cust_type = "I" THEN
	Open( w_facility_setup_intelliapp )
ELSE
	Open( w_facility_setup )
END IF
end event

event pfc_cst_letter_painter;IF gs_cust_type = "I" THEN
	Open( w_letter_painter_ia )
ELSE
	Open( w_letter_painter )
END IF
end event

event pfc_cst_letter_generator;Open( w_letter_generator )
end event

event pfc_cst_view_audit();//Open( w_view_audit )
opensheet(w_audit_painter,this,0,original!)  //jervis 05.09.2011
end event

event pfc_cst_security_role_painter;Open( w_security_roles_painter )
end event

event pfc_cst_delete_practitioner;of_delete_practitioner()
end event

event pfc_cst_security_user_painter;Open( w_security_user_painter )
end event

event pfc_cst_image_type_painter;Open(w_image_type_painter )
end event

event pfc_cst_priviledge_painter;open(w_privilege_painter)
end event

event pfc_cst_multi_app_painter;IF gs_cust_type = 'I' THEN
	Open( w_multi_app_painter_new )	
ELSE
	Open( w_multi_app_painter )
END IF
end event

event pfc_cst_prac_profile_painter;OpenSheet( w_prac_profile_design, This)
end event

event pfc_cst_case_review;OpenSheet( w_case_review, w_mdi, 1 )
w_case_review.Height = 2024
w_case_review.Width = 3301
end event

event pfc_cst_contract_screen_painter();//--------------------------- APPEON BEGIN ---------------------------
//$<add> 07.22.2006 By: LeiWei
//$<reason> Contract module modification
//Added By Mark Lee 05/03/12
SetPointer(HourGlass!)
OpenSheet( w_contract_data_design, This,4,original!)
//---------------------------- APPEON END ----------------------------
SetPointer(Arrow!)
end event

event pfc_cst_workflow_painter();//--------------------------- APPEON BEGIN ---------------------------
//$<add> 2006-10-31 By: Allen
//$<reason> open the workflow painter.
opensheet(w_workflow_painter_app,this,0,original!)
//---------------------------- APPEON END ----------------------------
end event

event pfc_cst_email_painter();//--------------------------- APPEON BEGIN ---------------------------
//$<add> 2006-10-31 By: Liu Hongxin
//$<reason> open the email painter.
open(w_email_painter)
//opensheet(w_email_painter,this,0,original!)
//---------------------------- APPEON END ----------------------------
end event

event pfc_cst_import_painter();//--------------------------- APPEON BEGIN ---------------------------
//$<add> 07.26.2007 By: Evan
//$<reason> New feature of import module.
OpenSheet(w_import_painter, w_mdi, 4, Original!)
//OpenSheetWithParm(w_import_painter, '1', w_mdi, 4, Original!) //Modified By Jay Chen 10-10-2014
//---------------------------- APPEON END ----------------------------
end event

event pfc_cst_contact();str_pass lstr_pass
lstr_pass.s_string = 'All LOCATIONS'

If isvalid(w_contract_contact) Then
	If w_contract_contact.WindowState = Minimized! Then
		w_contract_contact.WindowState = Normal!
	End If
	w_contract_contact.BringToTop = True
Else
	OpenWithParm( w_contract_contact, lstr_pass)
End If


end event

event pfc_cst_bidq();//--------------------------- APPEON BEGIN ---------------------------
//$<add> 08.19.2008 By: Evan
//$<reason> New feature of Batch Import Document Queue module.
OpenSheet(w_bidq_import_document, w_mdi, 4, Original!)
//---------------------------- APPEON END ----------------------------
end event

event pfc_cst_report_painter();//
OpenSheet(w_prac_report_design, w_mdi, 4, original!)
end event

event pfc_cst_profile_rpt();opensheet(w_profile_report,this,0,original!)  //contract profile report - jervis 05.09.2011
end event

event pfc_cst_contract_details_layout_setting();//Added By Mark Lee 01/23/2013
OpenSheet( w_contract_layout, This,4,original!)
//OpenSheet( w_contract_layout, This,0,Layered!)
end event

event ue_refreshezmenu();//

//dw_ezmenu.SetRedraw( False )			
dw_ezmenu.of_Set_Menu( This.MenuID )			
//dw_ezmenu.SetRedraw( True )	


//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// <RP> 8.10.2017
dw_ezmenu.uof_setModern()
// <RP> 8.8.2017 - set row to a filler row, so that an item doesn't appear to be selected
long ll_row
ll_row = dw_ezmenu.find("len(items) = 0", 1, dw_ezmenu.rowCount())
IF ll_row > 0 THEN
	dw_ezmenu.setRow(ll_row)
END IF
//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

end event

event pfc_cst_ezmenu_painter();//pfc_cst_ezmenu_painter

//opensheet(w_ezmenu_painter,this,0,original!)


open( w_ezmenu_painter )

// <RP> 8.25.2017
st_vsplit.event ue_lbuttonup( 0, 0 , 0 )

end event

event pfc_cst_relogin();//
app_filler		app
Integer		li_Return, li_Count, li_Return2


app = GetApplication( )

If IsValid( app ) Then
	If IsValid( gnv_Status_Info ) Then 
		If gnv_Status_Info.ib_red_process Then
			MessageBox( 'Login As', 'The system is sending/receiving emails and is in the process of exporting data, etc. ~r~n~r~nPlease switch your account after it is finished.' )
			Return
		End If
	End If
	
	//check opened window
	If wf_checkisvalidwin( false )> 0 Then
		li_Return = MessageBox( 'Login As', 'All windows will be closed when you login as another user.~r~n~r~nDo you want to continue?' , Question! , yesno!, 1 )
		If li_Return = 1 Then
			do
				wf_checkisvalidwin( true )//close
				li_Count = wf_checkisvalidwin( false )
				If li_Count > 0 Then
					li_Return2 = MessageBox( 'Login As', 'Some of the windows are not closed. ~r~n~r~nDo you want to close them?', question!, yesno!, 1  )
					If li_Return2 <> 1 Then
						Return
					End If
				End If
					
			Loop while li_Count <> 0
		Else
			Return //no operation
		End If
				
	End If	
	
	//gs_verifycode
	if not isnull(gs_verifycode) and  trim(gs_verifycode) <> "" then 
		update idp_users set  idpuser_validetime = getutcdate() , app_verifycode = "" 	
		where  app_verifycode = :gs_verifycode  using sqlca;
		
		gs_verifycode = ""
	end if 
	
	//relogin
	app.of_set_relogin_status( True )
	Open( w_logon_screen )
	IF Message.StringParm = "Cancel" Or Message.StringParm = "DB Error" Or Message.StringParm = "" THEN //the last added maha 081502 for user clicking on X on login screen
		Return
	END IF
	app.of_logout( )
	app.Event open(  app.is_commandline )
	
	Event open( )
	event pfc_postopen( )
	
	app.of_Set_relogin_status( False )
End If
end event

event pfc_cst_request_form_painter();OpenSheet(w_request_form, this, 4, original!)  				//Added By Mark Lee 03/11/2014
end event

event pfc_cst_webapi_key_painter();OpenSheet(w_webapi_key_painter, this, 4, original!)  				//Added By Mark Lee 03/11/2014
end event

event pfc_cst_import_salesforcepainter();//OpenSheetWithParm(w_import_painter, '2', w_mdi, 4, Original!) //Added By Jay Chen 10-10-2014
OpenSheet(w_import_salesforcepainter, w_mdi, 4, Original!)

end event

public function integer of_security_access (integer ai_action_id);//IF of_version_check() = 0 THEN
//	RETURN 1
//END IF

Integer i
Integer li_action_cnt


li_action_cnt = UpperBound( ii_security_action_id[] )

FOR i = 1 TO li_action_cnt
	IF ii_security_action_id[i] = ai_action_id THEN
		//--------------------------- APPEON BEGIN ---------------------------
		//$<modify> 09.10.2008 By: Ken.Guo
		//$<reason> For Readonly user.
		//Return ii_security_action_value[i]
		If ii_security_action_value[i] = 0 Then 
			Return 0
		Else
			If gi_user_readonly = 1 Then
				Return 1
			Else
				Return ii_security_action_value[ i ]
			End If
		End If
		//---------------------------- APPEON END ----------------------------		
	END IF
END FOR

Return -1
end function

public function integer of_setup_security ();IF of_version_check() = 0 THEN
	RETURN 1
END IF

Integer li_role_id
Integer i
Integer li_row_cnt
Integer li_action_cnt
n_ds lds_all_actions
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-01
//$<modify> 03.15.2006 By: Cao YongWang
//$<reason> Performance tuning.
//$<modification> Write script to retrieve data from a cache instead of from the database.

/*
SELECT security_users.role_id  
INTO :li_role_id  
FROM security_users  
WHERE ( security_users.user_id = :gs_user_id )   ;
*/
li_role_id = integer(gnv_data.of_getitem("security_users" , "role_id" , "upper(user_id)='" + upper(gs_user_id) + "'"))
//---------------------------- APPEON END ----------------------------
lds_all_actions = CREATE n_ds

//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 08.18.2006 By: LeiWei
//$<reason> Making the Contract Module a Standalone Product
/*
lds_all_actions.DataObject = "d_security_actions_all"
*/
IF gb_contract_version THEN
	lds_all_actions.DataObject = "d_security_actions_all_for_contract"
ELSE
	lds_all_actions.DataObject = "d_security_actions_all"
END IF
//---------------------------- APPEON END ----------------------------

lds_all_actions.of_SetTransObject( SQLCA )
li_row_cnt = lds_all_actions.Retrieve( li_role_id )
FOR i = 1 TO li_row_cnt
	ii_security_action_id[ i ] = lds_all_actions.GetItemNumber( i, "action_id" )
	ii_security_action_value[ i ] = lds_all_actions.GetItemNumber( i, "value_id" )
END FOR

RETURN 1
end function

public function integer of_menu_security (string as_menu_name);/******************************************************************************************************************
**  [PUBLIC]   : 
**==================================================================================================================
**  Purpose   	: 
**==================================================================================================================
**  Arguments 	: [none] 
**==================================================================================================================
**  Returns   	: [none]   
**==================================================================================================================
**  Notes     	: 	   
**==================================================================================================================
**  Created By	: 
**==================================================================================================================
**  Modification Log
**   Changed By             Change Date                                               Reason
** ------------------------------------------------------------------------------------------------------------------
**  Michael B. Skinner     28 December 2005                                      - Changed to case statement - for speed 
**                                                                               - added messasgebox to alert us when a menu
**                                                                                 has no security logic
** maha 							05 jan 2006															- recorrected upper portion to if statement because case would not work properly
** mskinner 					21 March 2005 	                                       - Added is valid for CASE  "m_pfe_cst_verif_info" portion 
**																											  of the code.
********************************************************************************************************************/


Integer 	li_intelli_cnt = 0
integer 	ncnt
long 		ll_pracid,ll_Cycle,ll_ItemCnts
String	ls_WinName
Boolean	lb_Display

Window	lw_Win, lw_currentsheet

//Added By Jay Chen 03-22-2016
string ls_user_name
select user_name into :ls_user_name from security_users where user_id = :gs_user_id;
if isnull(ls_user_name) then ls_user_name = ''

//$<add> 07.07.2008 by Andy
String ls_label
IF IsValid(m_pfe_cst_master_menu) then
	If IsNull( ls_user_name ) Or Trim( ls_user_name ) = '' Then ls_user_name = gs_user_id //modified by gavins 20160415
	m_pfe_cst_master_menu.m_file.m_loginuser.text = "Logged In User -> " + ls_user_name  //Added By Jay Chen 03-22-2016  modified by gavins 20160530 change login user  to logged In User
	//SELECT TOP 1 app_stat_facility_label INTO :ls_label FROM icred_settings;	
	if isvalid(gds_settings) then
		if gds_settings.rowcount() > 0 then
			ls_label = gds_settings.GetItemString(1,"app_stat_facility_label")
		end if
	end if
		
	if Len(trim(ls_label)) > 0 then
		m_pfe_cst_master_menu.m_system.m_painters.m_facilitypainter.text = ls_label + ' Painter~tCtrl+Alt+F'//'&' + 
		//Start code by Jervis 01-12-2008, APB Unsupport.
		if AppeonGetClientType() = 'PB' then	
//			app_filler.inv_CoolMenu.of_loadimagesfrommenu(this.menuid)
		end if
	end if
end if
//end add 07.07.2008	

//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 08.21.2006 By: LeiWei
//$<reason> Fix a defect.
/*
IF as_menu_name = "m_pfe_cst_reports" OR as_menu_name =  "m_pfe_cst_mdi_menu" OR+&
   as_menu_name = "m_pfe_cst_action_items" OR as_menu_name = "m_pfe_cst_data_entry" OR as_menu_name = "m_pfe_cst_prac_meetings" or+&
   as_menu_name = "m_pfe_cst_app_audit" OR as_menu_name = "m_pfe_cst_meetings" or as_menu_name = "m_pfe_cst_privileges" OR+&
   as_menu_name = "m_pfe_cst_prac_data_design" OR as_menu_name = "m_pfe_cst_verif_info" OR+&
   as_menu_name = "m_pfe_cst_net_dev" OR as_menu_name = "m_pfe_cst_profile" OR POS( as_menu_name, "m_pfe_cst_imaging" ) > 0 or POS( as_menu_name, "m_pfe_train_app" ) > 0 THEN
*/

//Added By Ken.Guo 2010-12-15.
lw_currentsheet = w_mdi.GetActiveSheet ( )
If isvalid(lw_currentsheet) Then
	is_current_window_name = lw_currentsheet.classname()
Else
	is_current_window_name = ''
End If

IF as_menu_name = "m_pfe_cst_reports" OR as_menu_name =  "m_pfe_cst_mdi_menu" OR+&
   as_menu_name = "m_pfe_cst_clause_painter" OR as_menu_name = "m_pfe_cst_agreement_template" OR +&	
	as_menu_name = "m_pfe_cst_mdi_menu_contract_am" OR +& 
	as_menu_name = "m_ctx_doc_painter" OR as_menu_name = "m_pfe_cst_mdi_menu_lookup" OR +&
   as_menu_name = "m_pfe_cst_action_items" OR as_menu_name = "m_pfe_cst_data_entry" OR as_menu_name = "m_pfe_cst_prac_meetings" or+&
   as_menu_name = "m_pfe_cst_app_audit" OR as_menu_name = "m_pfe_cst_meetings" or as_menu_name = "m_pfe_cst_privileges" OR+&
   as_menu_name = "m_pfe_cst_prac_data_design" OR as_menu_name = "m_pfe_cst_verif_info" OR+&
   as_menu_name = "m_pfe_cst_qa" OR as_menu_name = "m_pfe_cst_mes" OR as_menu_name = "m_pfe_cst_contract_data_design" OR+&
   as_menu_name = "m_pfe_cst_contract" OR as_menu_name = "m_pfe_cst_mdi_menu_contract" OR as_menu_name = "m_pfe_cst_net_dev_action_items" OR+&
   as_menu_name = "m_pfe_cst_net_dev" OR as_menu_name = "m_pfe_cst_profile" OR POS( as_menu_name, "m_pfe_cst_imaging" ) > 0 or POS( as_menu_name, "m_pfe_train_app" ) > 0 OR+&
	as_menu_name = "m_pfe_cst_import_painter" OR as_menu_name =  "m_pfe_cst_mdi_dashboard" or as_menu_name = 'm_pfe_cst_mail'  or  +&
	as_menu_name = "m_pfe_cst_contract_profile" &
THEN

	IF NOT ISvalid(m_pfe_cst_master_menu) OR isnull(m_pfe_cst_master_menu) THEN RETURN 0
//---------------------------- APPEON END ----------------------------
	
  	  IF gs_user_id = "SE" THEN
			m_pfe_cst_master_menu.m_system.m_painters.m_imagetypepainter.visible = False
			m_pfe_cst_master_menu.m_system.m_painters.m_multiapppainter.visible = False
			m_pfe_cst_master_menu.m_system.m_utilities.visible = False
			m_pfe_cst_master_menu.m_system.m_batchupdate.visible = False
			m_pfe_cst_master_menu.m_system.m_2.visible = False
			m_pfe_cst_master_menu.m_file.m_sitesurvey.visible = False
			m_pfe_cst_master_menu.m_help.m_iapply.visible = False
		END IF
		//IntelliApp Train

		if gi_iapp_on = 0 then//maha092302
			m_pfe_cst_master_menu.m_system.m_painters.m_applicationmapping.visible = False
			m_pfe_cst_master_menu.m_system.m_batchaddapplications.visible = False
		else
			IF of_security_access( 1460 ) = 0 THEN
				IF IsValid( m_pfe_cst_master_menu.m_system.m_painters.m_applicationmapping) THEN				
					m_pfe_cst_master_menu.m_system.m_painters.m_applicationmapping.visible = False
				END IF
				//m_pfe_cst_master_menu.m_system.m_painters.m_applicationmapping.toolbaritemvisible = False
				li_intelli_cnt++
			ELSE
				IF IsValid( m_pfe_cst_master_menu.m_system.m_painters.m_applicationmapping) THEN
					m_pfe_cst_master_menu.m_system.m_painters.m_applicationmapping.visible = True
				END IF
				//m_pfe_cst_master_menu.m_file.m_intelliapp.m_training.toolbaritemvisible = True
			END IF
		end if
		
		//IntelliApp Print
		if gi_iapp_on = 0 then //maha092302 mod 110403
			m_pfe_cst_master_menu.m_reports.m_applications.visible = False
			m_pfe_cst_master_menu.m_reports.m_applications.toolbaritemvisible = False
		else
			IF of_security_access( 1330 ) = 0 THEN
				m_pfe_cst_master_menu.m_reports.m_applications.visible = False
				m_pfe_cst_master_menu.m_reports.m_applications.toolbaritemvisible = False
				li_intelli_cnt++
			ELSE
				m_pfe_cst_master_menu.m_reports.m_applications.visible = True
				m_pfe_cst_master_menu.m_reports.m_applications.toolbaritemvisible = True
			END IF		
		end if
		IF li_intelli_cnt = 2 THEN //????
			m_pfe_cst_master_menu.m_reports.m_applications.visible = False
			m_pfe_cst_master_menu.m_reports.m_applications.toolbaritemvisible = False			
		END IF
		
		IF of_security_access( 40 ) = 0 THEN
			m_pfe_cst_master_menu.m_file.m_practitioner.Visible = False
			m_pfe_cst_master_menu.m_file.m_practitioner.toolbaritemvisible = False
		ELSE
			m_pfe_cst_master_menu.m_file.m_practitioner.Visible = True
			m_pfe_cst_master_menu.m_file.m_practitioner.toolbaritemvisible = true
		END IF
		//Begin - Added By Mark Lee 04/27/12
//		//action items
//		//Start Code Change ----02.05.2008 #V8 maha -  cleaned up code
//		IF gb_contract_version = TRUE THEN
//			IF of_security_access( 5210 ) = 0 AND gb_contract_version THEN
//				m_pfe_cst_master_menu.m_file.m_actionitems.Visible = False
//				//m_pfe_cst_master_menu.m_file.m_actionitems.toolbaritemVisible = False
//			ELSE
//				m_pfe_cst_master_menu.m_file.m_actionitems.Visible = True
//				//m_pfe_cst_master_menu.m_file.m_actionitems.toolbaritemVisible = True
//			END IF
//		ELSE
//			If of_security_access( 240 ) = 0 then 
//				m_pfe_cst_master_menu.m_file.m_actionitems.Visible = False
//				//m_pfe_cst_master_menu.m_file.m_actionitems.toolbaritemVisible = False
//			else
//				m_pfe_cst_master_menu.m_file.m_actionitems.Visible = True
//				//m_pfe_cst_master_menu.m_file.m_actionitems.toolbaritemVisible = True
//			end if
//		END IF
//		//End Code Change---02.05.2008
		//End - Added By Mark Lee 04/27/12

				
		//meetings
		IF of_security_access( 340 ) = 0 THEN
			m_pfe_cst_master_menu.m_file.m_meetings.Visible = False
			m_pfe_cst_master_menu.m_file.m_meetings.ToolBarItemVisible = False			
		ELSE
			m_pfe_cst_master_menu.m_file.m_meetings.Visible = True
		END IF		
		
		//Added By Ken.Guo 2010-12-23. Getting Started.
		IF of_security_access( 6980 ) = 0 THEN
			m_pfe_cst_master_menu.m_help.m_gettingstarted.Visible = False
			m_pfe_cst_master_menu.m_help.m_gettingstarted.ToolBarItemVisible = False			
		ELSE
			m_pfe_cst_master_menu.m_help.m_gettingstarted.Visible = True
			m_pfe_cst_master_menu.m_help.m_gettingstarted.ToolBarItemVisible = True
		END IF			
		
//		IF Upper( gs_cust_type ) = 'I' THEN  //maha 
//			m_pfe_cst_master_menu.m_file.m_meetings.Visible = False
//			m_pfe_cst_master_menu.m_file.m_meetings.ToolBarItemVisible = False						
//			IF IsValid( m_pfe_cst_data_entry ) THEN 			
//				m_pfe_cst_data_entry.m_file.m_facilitydata.visible = False
//				m_pfe_cst_data_entry.m_file.m_facilitydata.ToolBarItemVisible = False				
//			END IF
//		END IF

	
		//privileges  maha 040201  modified 110303
		if gi_priv_mod = 0 then //maha 110403
			m_pfe_cst_master_menu.m_file.m_privileging.Visible = False
			m_pfe_cst_master_menu.m_system.m_painters.m_privilegepainter.Visible = False
			m_pfe_cst_master_menu.m_reports.m_privilegelisting.Visible = False
			m_pfe_cst_master_menu.m_reports.m_privilegelisting.ToolBarItemVisible = False
		else
			IF of_security_access( 1310 ) = 0 THEN
				m_pfe_cst_master_menu.m_file.m_privileging.Visible = False
				m_pfe_cst_master_menu.m_system.m_painters.m_privilegepainter.Visible = False
			ELSE
				m_pfe_cst_master_menu.m_file.m_privileging.Visible = True
				m_pfe_cst_master_menu.m_system.m_painters.m_privilegepainter.Visible = true
			END IF
			IF of_security_access( 210 ) = 0 THEN  //maha 092705 based on security for pract folder priv tab
				m_pfe_cst_master_menu.m_reports.m_privilegelisting.Visible = False
				m_pfe_cst_master_menu.m_reports.m_privilegelisting.ToolBarItemVisible = False
			ELSE
				m_pfe_cst_master_menu.m_reports.m_privilegelisting.Visible = true
				m_pfe_cst_master_menu.m_reports.m_privilegelisting.ToolBarItemVisible = true
			END IF
		end if
		//group practice  maha 040201
		IF of_security_access( 1320 ) = 0 THEN
			m_pfe_cst_master_menu.m_file.m_grouppractices.Visible = False
		ELSE
			m_pfe_cst_master_menu.m_file.m_grouppractices.Visible = True
		END IF		
		//correspondence
		IF of_security_access( 400 ) = 0 THEN
			m_pfe_cst_master_menu.m_reports.m_letters.Visible = False
			m_pfe_cst_master_menu.m_reports.m_letters.ToolBarItemVisible = False
		ELSE
			//--------------------------- APPEON BEGIN ---------------------------
			//$<modify> 06.12.2007 By: Jack
			//$<reason> 
			/*
			m_pfe_cst_master_menu.m_reports.m_letters.Visible = True
			m_pfe_cst_master_menu.m_reports.m_letters.ToolBarItemVisible = true
			*/
			If gb_contract_version Then
				m_pfe_cst_master_menu.m_reports.m_letters.Visible = False
				m_pfe_cst_master_menu.m_reports.m_letters.ToolBarItemVisible = False
			Else
				m_pfe_cst_master_menu.m_reports.m_letters.Visible = True
				m_pfe_cst_master_menu.m_reports.m_letters.ToolBarItemVisible = true
			End If
			//---------------------------- APPEON END ----------------------------
		END IF						
		//reports
		IF of_security_access( 700 ) = 0 THEN
			m_pfe_cst_master_menu.m_reports.m_reportsgraphs.Visible = False
			m_pfe_cst_master_menu.m_reports.m_reportsgraphs.ToolBarItemVisible = False
		ELSE
			m_pfe_cst_master_menu.m_reports.m_reportsgraphs.Visible = True
			m_pfe_cst_master_menu.m_reports.m_reportsgraphs.ToolBarItemVisible = true
		END IF								
		//screen painter
		IF of_security_access( 410 ) = 0 THEN
			m_pfe_cst_master_menu.m_system.m_painters.m_screenpainter.Visible = False
		ELSE
			m_pfe_cst_master_menu.m_system.m_painters.m_screenpainter.Visible = True
		END IF										

		//--------------------------- APPEON BEGIN ---------------------------
		//$<added> 2008-08-19 By: Alan
		//report painter
		IF of_security_access( 6938 ) = 0 THEN
			m_pfe_cst_master_menu.m_system.m_painters.m_reportpainter.Visible = False
		ELSE
			m_pfe_cst_master_menu.m_system.m_painters.m_reportpainter.Visible = True
		END IF	
		//---------------------------- APPEON END ----------------------------
		
		//application audit painter
		IF of_security_access( 460 ) = 0 THEN
			m_pfe_cst_master_menu.m_system.m_painters.m_applicationauditpainter.Visible = False
		ELSE
			m_pfe_cst_master_menu.m_system.m_painters.m_applicationauditpainter.Visible = True
		END IF												
		// facility painter
		IF of_security_access( 470 ) = 0 THEN
			m_pfe_cst_master_menu.m_system.m_painters.m_facilitypainter.Visible = False
		ELSE
			m_pfe_cst_master_menu.m_system.m_painters.m_facilitypainter.Visible = True
		END IF		
		// letter painter
		IF of_security_access( 580 ) = 0 THEN
			m_pfe_cst_master_menu.m_system.m_painters.m_letterpainter.Visible = False
		ELSE
			m_pfe_cst_master_menu.m_system.m_painters.m_letterpainter.Visible = True
		END IF
		// lookup painter
		IF of_security_access( 560 ) = 0 THEN
			m_pfe_cst_master_menu.m_system.m_painters.m_lookuppainter.Visible = False
		ELSE
			m_pfe_cst_master_menu.m_system.m_painters.m_lookuppainter.Visible = True
		END IF		
		// profile painter
		IF of_security_access( 570 ) = 0 THEN
			m_pfe_cst_master_menu.m_system.m_painters.m_profilepainter.Visible = False
		ELSE
			m_pfe_cst_master_menu.m_system.m_painters.m_profilepainter.Visible = True
		END IF				
		// export painter
		IF of_security_access( 550 ) = 0 THEN
			m_pfe_cst_master_menu.m_system.m_painters.m_outputpainter.Visible = False
		ELSE
			m_pfe_cst_master_menu.m_system.m_painters.m_outputpainter.Visible = True
		END IF
//Start Code Change ---- 11.03.2005 #25 maha
//Start Code Change ----01.04.2008 #V8 maha - added tool bar items
		IF of_security_access( 2190 ) = 0 THEN
			m_pfe_cst_master_menu.m_reports.m_runexport.Visible = False
			m_pfe_cst_master_menu.m_reports.m_runexport.ToolBarItemVisible = False
		ELSE
			m_pfe_cst_master_menu.m_reports.m_runexport.Visible = True
			m_pfe_cst_master_menu.m_reports.m_runexport.ToolBarItemVisible = True
		END IF
		if gi_export_on = 0 then 
			m_pfe_cst_master_menu.m_reports.m_runexport.Visible = False
			m_pfe_cst_master_menu.m_system.m_painters.m_outputpainter.Visible = False
			m_pfe_cst_master_menu.m_reports.m_runexport.ToolBarItemVisible = False
		END IF
//End Code Change---01.04.2008		
		//--------------------------- APPEON BEGIN ---------------------------
		//$<add> 07.26.2007 By: Evan (Import)
		//$<reason> New feature of import module.
		IF of_get_app_setting("set_import","I") = 0 THEN	//Added by Scofield on 2009-03-25
			m_pfe_cst_master_menu.m_system.m_painters.m_importpainter.Visible = False
			m_pfe_cst_master_menu.m_system.m_painters.m_salesforcepainter.Visible = False //Added By Jay Chen 10-10-2014
		ELSE
			IF of_security_access( 6928 ) = 0 THEN
				m_pfe_cst_master_menu.m_system.m_painters.m_importpainter.Visible = False
			ELSE
				m_pfe_cst_master_menu.m_system.m_painters.m_importpainter.Visible = True
			END IF
			//Added By Jay Chen 10-10-2014
			IF of_security_access( 7009 ) = 0 THEN
				m_pfe_cst_master_menu.m_system.m_painters.m_salesforcepainter.Visible = False
			ELSE
				m_pfe_cst_master_menu.m_system.m_painters.m_salesforcepainter.Visible = True
			END IF
		END IF
		//---------------------------- APPEON END ----------------------------		

		//--------------------------- APPEON BEGIN ---------------------------
		//$<add> 11.13.2007 By: Evan
		//$<reason> New feature of dashboard.
		If gnv_data.of_GetItem( "icred_settings", "set_dashb", False ) = '1' Then //Added By Ken.Guo 2008-11-19
			IF of_security_access( 6942 ) = 0 THEN
				m_pfe_cst_master_menu.m_file.m_dashboard0.Visible = False
				m_pfe_cst_master_menu.m_file.m_dashboard0.toolbaritemvisible = False
			ELSE
				m_pfe_cst_master_menu.m_file.m_dashboard0.Visible = True
				m_pfe_cst_master_menu.m_file.m_dashboard0.toolbaritemvisible = True
			END IF
		Else
			m_pfe_cst_master_menu.m_file.m_dashboard0.Visible = False //Added By Ken.Guo 2008-11-19
			m_pfe_cst_master_menu.m_file.m_dashboard0.toolbaritemvisible = False
		End If
		//---------------------------- APPEON END ----------------------------
//End Code Change---11.03.2005 		

			
		// survey painter
	//Start Code Change ---- 05.11.2006 #440 maha
		if of_get_app_setting("set_site","I") = 0 then
			m_pfe_cst_master_menu.m_system.m_painters.m_surveypainter.Visible = False
		else
			IF of_security_access( 590 ) = 0 THEN
				m_pfe_cst_master_menu.m_system.m_painters.m_surveypainter.Visible = False
			ELSE
				m_pfe_cst_master_menu.m_system.m_painters.m_surveypainter.Visible = True
			END IF
		end if
	//End Code Change---05.10.2006

		// role painter
		IF of_security_access( 540 ) = 0 THEN
			if upper(gs_user_id) = 'MASTER' then //Added By Jay Chen 02-18-2014
				m_pfe_cst_master_menu.m_system.m_painters.m_rolepainter.Visible = True
			else
				m_pfe_cst_master_menu.m_system.m_painters.m_rolepainter.Visible = False
			end if
		ELSE
			m_pfe_cst_master_menu.m_system.m_painters.m_rolepainter.Visible = True
		END IF										
		// user painter
		IF of_security_access( 900 ) = 0 THEN
			if upper(gs_user_id) = 'MASTER' then //Added By Jay Chen 08-08-2014
				m_pfe_cst_master_menu.m_system.m_painters.m_userpainter.Visible = True
			else
				m_pfe_cst_master_menu.m_system.m_painters.m_userpainter.Visible = False
			end if
		ELSE
			m_pfe_cst_master_menu.m_system.m_painters.m_userpainter.Visible = True
		END IF												
//		// field audit			//Commented By Mark Lee 02/17/2014
//		IF of_security_access( 600 ) = 0 THEN
//			m_pfe_cst_master_menu.m_system.m_audittrail.Visible = False
//		ELSE
//			m_pfe_cst_master_menu.m_system.m_audittrail.Visible = True
//		END IF										
		// view painter
		IF of_security_access( 800 ) = 0 THEN
			m_pfe_cst_master_menu.m_system.m_painters.m_viewpainter.Visible = False
		ELSE
			m_pfe_cst_master_menu.m_system.m_painters.m_viewpainter.Visible = True
		END IF
		
//		// Contract Details Layout Setting				//Added By Mark Lee 01/23/2013
//		IF of_security_access( 800 ) = 0  and of_security_access( 5300 ) = 0 THEN 
//			m_pfe_cst_master_menu.m_system.m_painters.m_contractdetailslayoutsetting.Visible = FALSE
//			if IsValid(m_pfe_cst_mdi_menu_contract) then
//				m_pfe_cst_mdi_menu_contract.m_system.m_painters.m_contractdetailslayoutsetting.ToolbarItemVisible = FALSE	
//			end if	
//		Else
//			m_pfe_cst_master_menu.m_system.m_painters.m_contractdetailslayoutsetting.Visible = True
//			if IsValid(m_pfe_cst_mdi_menu_contract) then
//				m_pfe_cst_mdi_menu_contract.m_system.m_painters.m_contractdetailslayoutsetting.ToolbarItemVisible = True
//			end if	
//		End If

		IF gi_imaging = 0 THEN
			m_pfe_cst_master_menu.m_system.m_painters.m_imagetypepainter.Visible = False
		else
			IF of_security_access( 1370 ) = 0 THEN
				m_pfe_cst_master_menu.m_system.m_painters.m_imagetypepainter.Visible = False
			ELSE
				m_pfe_cst_master_menu.m_system.m_painters.m_imagetypepainter.Visible = True
			END IF
		END IF
		// multi app painter   maha112701
		IF of_security_access( 1360 ) = 0 THEN
			m_pfe_cst_master_menu.m_system.m_painters.m_multiapppainter.Visible = False
		ELSE
			m_pfe_cst_master_menu.m_system.m_painters.m_multiapppainter.Visible = True
		END IF
		// system utilities   maha112701
		IF of_security_access( 1340 ) = 0 THEN
			m_pfe_cst_master_menu.m_system.m_utilities.Visible = False
		ELSE
			m_pfe_cst_master_menu.m_system.m_utilities.Visible = True
		END IF
		// system Delete Practitioner   maha012103
		IF of_security_access( 1440 ) = 0 THEN
			m_pfe_cst_master_menu.m_system.m_deletepractitioner.Visible = False
		ELSE
			m_pfe_cst_master_menu.m_system.m_deletepractitioner.Visible = True
		END IF
		// system Audit Trail   maha012103
		IF of_security_access( 1450 ) = 0 THEN
			m_pfe_cst_master_menu.m_system.m_audittrail.Visible = False
			m_pfe_cst_master_menu.m_system.m_audittrail.ToolBarItemVisible = False 	//Added By Mark Lee 02/17/2014
		ELSE
			m_pfe_cst_master_menu.m_system.m_audittrail.Visible = True
			m_pfe_cst_master_menu.m_system.m_audittrail.ToolBarItemVisible = True 	//Added By Mark Lee 02/17/2014			
		END IF
		// system batch update   maha112701
		IF of_security_access( 1350 ) = 0 THEN
			m_pfe_cst_master_menu.m_system.m_batchupdate.Visible = False
		ELSE
			m_pfe_cst_master_menu.m_system.m_batchupdate.Visible = True
		END IF
		// intellireports maha 092302 else 020404
		if gi_ireport_on = 0 then
			m_pfe_cst_master_menu.m_reports.m_intellireport.Visible = False
			m_pfe_cst_master_menu.m_reports.m_intellireport.ToolBarItemVisible = False
		else
			IF of_security_access( 1470 ) = 0 THEN
				m_pfe_cst_master_menu.m_reports.m_intellireport.Visible = False
				m_pfe_cst_master_menu.m_reports.m_intellireport.ToolBarItemVisible = False
			ELSE
				m_pfe_cst_master_menu.m_reports.m_intellireport.Visible = true
				m_pfe_cst_master_menu.m_reports.m_intellireport.ToolBarItemVisible = true
			end if
		END IF
				
		// Group Practice maha 012103
		IF of_security_access( 1320 ) = 0 THEN
			m_pfe_cst_master_menu.m_file.m_grouppractices.Visible = False
		else
			m_pfe_cst_master_menu.m_file.m_grouppractices.Visible = true
		end if
		// Site Survey maha 102103
		IF of_security_access( 1430 ) = 0 THEN
			m_pfe_cst_master_menu.m_file.m_sitesurvey.Visible = False
		else
			m_pfe_cst_master_menu.m_file.m_sitesurvey.Visible = True
		end if
		
		// system batch add apps   maha020404
		IF of_security_access( 1590 ) = 0 THEN
			m_pfe_cst_master_menu.m_system.m_batchaddapplications.Visible = False
		ELSE
			m_pfe_cst_master_menu.m_system.m_batchaddapplications.Visible = True
		END IF
		// system intellibatch   maha020204
		IF of_security_access( 2000 ) = 0 THEN
			m_pfe_cst_master_menu.m_system.m_intellibatch.Visible = False
			m_pfe_cst_master_menu.m_system.m_painters.m_intellibatchpainter.Visible = False
		ELSE
			m_pfe_cst_master_menu.m_system.m_intellibatch.Visible = True
			m_pfe_cst_master_menu.m_system.m_painters.m_intellibatchpainter.Visible = true
		END IF
		
		
		// fax template painter   maha110904
		IF of_security_access( 2050 ) = 0 THEN
			m_pfe_cst_master_menu.m_system.m_painters.m_faxemailtemplatepainter.Visible = False
		ELSE
			m_pfe_cst_master_menu.m_system.m_painters.m_faxemailtemplatepainter.Visible = true
		END IF
		
		//---------Begin Added by Alfee 03.24.2008---------------------------------
		IF gb_contract_version THEN
			m_pfe_cst_master_menu.m_system.m_browseweb.Visible = False
			m_pfe_cst_master_menu.m_reports.m_npdbreports.visible = FALSE
			m_pfe_cst_master_menu.m_reports.m_npdbreports.toolbaritemVisible = FALSE			
		ELSE
			m_pfe_cst_master_menu.m_system.m_browseweb.Visible = TRUE
			m_pfe_cst_master_menu.m_reports.m_npdbreports.visible = TRUE
			m_pfe_cst_master_menu.m_reports.m_npdbreports.toolbaritemVisible = TRUE
		END IF
		//--------End Added -------------------------------------------------------		

		IF of_security_access( 260 ) = 0 and not gb_contract_version THEN //run action items maha 012505
			//messagebox("","")
			m_pfe_cst_master_menu.m_system.m_batchoig.Visible = False
			m_pfe_cst_master_menu.m_system.m_browseweb.Visible = False
			m_pfe_cst_master_menu.m_system.m_importoigdata.Visible = False
			m_pfe_cst_master_menu.m_reports.m_npdbreports.visible = FALSE
			m_pfe_cst_master_menu.m_reports.m_npdbreports.toolbaritemVisible = FALSE
			//Start Code Change ----07.11.2008 #V81 maha - added exceptions for non-inherited menus; isvalid did not work
			IF as_menu_name <> "m_pfe_cst_app_audit"  and  as_menu_name <> "m_pfe_cst_meetings" and  as_menu_name <> "m_pfe_cst_prac_meetings" and POS( as_menu_name, "m_pfe_cst_imaging" ) = 0  THEN 
			if isvalid(m_pfe_cst_mdi_menu) then
				m_pfe_cst_mdi_menu.m_system.m_runactionitemsquery.visible = False
			end if
			END IF
			//End Code Change---07.11.2008
			m_pfe_cst_master_menu.m_window.m_dashboard.Visible = False //'Task list'
		end if
		
		//Peer/QA/Site maha app100405
//Start Code Change ---- 11.10.2006 #1 maha	combined code from further down	
		if of_get_app_setting("set_qa","I") = 0 and of_get_app_setting("set_site","I") = 0 and of_get_app_setting("set_peer","I") = 0 then
			m_pfe_cst_master_menu.m_file.m_qualityprofilemeasurements.Visible = False
			m_pfe_cst_master_menu.m_file.m_qualityprofilemeasurements.toolbaritemVisible = False
			m_pfe_cst_master_menu.m_system.m_painters.m_reappointmentmeasurements.Visible = False
			//m_pfe_cst_master_menu.m_file.m_qualityprofilemeasurements.toolbaritemVisible = False
		else
//			m_pfe_cst_master_menu.m_file.m_qualityprofilemeasurements.Visible = true
//			m_pfe_cst_master_menu.m_file.m_qualityprofilemeasurements.toolbaritemVisible = true
//			m_pfe_cst_master_menu.m_system.m_painters.m_reappointmentmeasurements.Visible = true
			//security for each
				//QA / PEER Folder
			IF of_security_access( 2020 ) = 0  and of_security_access( 2040 ) = 0 THEN //Start Code Change ----02.29.2008 #V8 maha - added peer parameter
				m_pfe_cst_master_menu.m_file.m_qualityprofilemeasurements.Visible = FALSE
				m_pfe_cst_master_menu.m_file.m_qualityprofilemeasurements.toolbaritemVisible = FALSE
			ELSE
				m_pfe_cst_master_menu.m_file.m_qualityprofilemeasurements.Visible = TRUE
				m_pfe_cst_master_menu.m_file.m_qualityprofilemeasurements.toolbaritemVisible = TRUE
			END IF
				//QA Painter
			if of_get_app_setting("set_qa","I") = 0 then	
				m_pfe_cst_master_menu.m_system.m_painters.m_reappointmentmeasurements.Visible = FALSE
			else
				IF of_security_access( 2010 ) = 0 THEN 
					m_pfe_cst_master_menu.m_system.m_painters.m_reappointmentmeasurements.Visible = FALSE
				ELSE
					m_pfe_cst_master_menu.m_system.m_painters.m_reappointmentmeasurements.Visible = TRUE
				END IF
			end if
			
			//Start Code Change ----02.05.2008 #V8 maha moved here from below and added security access code
			//PEER Review
			if of_get_app_setting("set_peer","I") = 0 then
				m_pfe_cst_master_menu.m_file.m_casepeerreview.Visible = False
				//m_pfe_cst_master_menu.m_file.m_casepeerreview.toolbaritemVisible = FALSE
			else //if peer is valid
				IF of_security_access(2040 ) > 0  THEN 
					m_pfe_cst_master_menu.m_file.m_casepeerreview.Visible = True
				else
					m_pfe_cst_master_menu.m_file.m_casepeerreview.Visible = False
				end if
			end if
			//End Code Change---02.05.2008
		end if
//End Code Change---11.10.2006		
		
		//CONTRACTS maha app100405
		if of_get_app_setting("set_cont","I") = 0 then //app setting
			m_pfe_cst_master_menu.m_file.m_contract.Visible = False
			//--------------------------- APPEON BEGIN ---------------------------
			//$<add> 08.24.2006 By: LeiWei
			//$<reason> Fix a defect.
			m_pfe_cst_master_menu.m_file.m_contract.ToolBaritemVisible = False
			//---------------------------- APPEON END ----------------------------
			m_pfe_cst_master_menu.m_system.m_painters.m_contractrequirementprofile.Visible = False
			//
			if IsValid(m_pfe_cst_mdi_menu) then 
				m_pfe_cst_mdi_menu.m_file.m_contacts.ToolBaritemVisible = false	//Added by Scofield on 2007-12-19
				m_pfe_cst_mdi_menu.m_file.m_contacts.visible = false
			end if
		else
	//Start Code Change ----02.05.2008 #V8 maha - wiil be set visible if appropriate down in the case statement
			if IsValid(m_pfe_cst_mdi_menu) then 
				m_pfe_cst_mdi_menu.m_file.m_contacts.ToolBaritemVisible = false
				m_pfe_cst_mdi_menu.m_file.m_contacts.visible = False
			end if
			
			if of_security_access( 2070 ) = 0 THEN //user security
				m_pfe_cst_master_menu.m_file.m_contract.Visible = False
				m_pfe_cst_master_menu.m_file.m_contract.ToolBaritemVisible = False
				m_pfe_cst_master_menu.m_system.m_painters.m_contractrequirementprofile.Visible = False
			else
				m_pfe_cst_master_menu.m_file.m_contract.Visible = true
				m_pfe_cst_master_menu.m_file.m_contract.ToolBaritemVisible = True

				m_pfe_cst_master_menu.m_system.m_painters.m_contractrequirementprofile.Visible = true
			end if
			
			//maha 02.05.2008 -  logic on the m_contacts menu item visible has changed
			//It should be visible when in the contracts modile, as well as from the mdi menu when Contracts only
			//coding below in case statement area
			//--------------------------- APPEON BEGIN ---------------------------
			//$< Add  > 2007-12-19 By: Scofield
			//$<Reason> Add Contact security.
//			if IsValid(m_pfe_cst_mdi_menu) then
//				lw_Win = GetActiveSheet()
//				if IsValid(lw_Win) then ls_WinName = lw_Win.ClassName()
//				if of_security_access( 6930 ) = 0 then //or ls_WinName = 'w_prac_data_1' then		//Contact security
//					m_pfe_cst_mdi_menu.m_file.m_contacts.ToolBaritemVisible = false
//				else
//					
//					m_pfe_cst_mdi_menu.m_file.m_contacts.ToolBaritemVisible = true
//				end if
//			end if
			//---------------------------- APPEON END ----------------------------
			//End Code Change---.2008
		end if
		
		//Start Code Change ---- 12.02.2005 #158 maha
		//Question painter maha app101305
		
		if of_security_access( 2210 ) = 0 THEN 
			m_pfe_cst_master_menu.m_system.m_painters.m_questionpainter.Visible = False
		else
			m_pfe_cst_master_menu.m_system.m_painters.m_questionpainter.Visible = true
		end if
//End Code Change---12.02.2005

		//--------------------------- APPEON BEGIN ---------------------------
		//$<add> 06.07.2006 By: Rodger Wu
		//$<modification> The following script determines whether the menu item Letter Storage Area Painter appears or not.
		if gnv_data.of_getitem('icred_settings' ,'set_50' , False ) = '1' or &
			appeongetclienttype() <> 'PB' then
			if of_security_access( 5010 ) > 0 then
				m_pfe_cst_master_menu.m_system.m_painters.m_letterstorageareapainter.Visible = True
			else
				m_pfe_cst_master_menu.m_system.m_painters.m_letterstorageareapainter.Visible = False
			end if
		else
			m_pfe_cst_master_menu.m_system.m_painters.m_letterstorageareapainter.Visible = False
		end if
		//---------------------------- APPEON END ----------------------------


		//--------------------------- APPEON BEGIN ---------------------------
		//$<add> 11.06.2006 By: Jack (Contract Logix Agreement Manager Painters)
		//$<reason> The following script determines whether the menu item Clause Library Painter£¬Template Library Painter£¬Document Library Painter appears or not.
		If gb_agreement_manager And gnv_data.of_getitem('icred_settings' ,'set_cont' , False ) = '1' Then
			if of_security_access( 6800 ) = 0 and of_security_access( 6801 ) = 0 and of_security_access( 6802 ) = 0 then
				m_pfe_cst_master_menu.m_system.m_painters.m_agreement.Visible = False		//Added by Scofield on 2008-11-12
			else
				m_pfe_cst_master_menu.m_system.m_painters.m_agreement.Visible = True
				If of_security_access( 6800 ) = 0 Then
					m_pfe_cst_master_menu.m_system.m_painters.m_agreement.m_clauselibrarypainter.Visible = False
				Else
					m_pfe_cst_master_menu.m_system.m_painters.m_agreement.m_clauselibrarypainter.Visible = True
				End If
				If of_security_access( 6801 ) = 0 Then
					m_pfe_cst_master_menu.m_system.m_painters.m_agreement.m_templatelibrarypainter.Visible = False
				Else
					m_pfe_cst_master_menu.m_system.m_painters.m_agreement.m_templatelibrarypainter.Visible = True
				End If
				If of_security_access( 6802 ) = 0 Then
					m_pfe_cst_master_menu.m_system.m_painters.m_agreement.m_documentlibrarypainter.Visible = False
				Else
					m_pfe_cst_master_menu.m_system.m_painters.m_agreement.m_documentlibrarypainter.Visible = True
				End If
			end if
		Else
			m_pfe_cst_master_menu.m_system.m_painters.m_agreement.Visible = False
		End If
		
		//Only for Buy side. Rodger Wu added on Feb. 12, 2007
		//-------Begin Modified by Alfee 12.05.2007---------------------------------
		/* IF gnv_data.of_getitem('icred_settings' ,'set_cont' , False ) = '1' and &
			gnv_data.of_getitem('icred_settings' ,'set_51' , False ) = '3' THEN			*/
		IF gnv_data.of_getitem('icred_settings' ,'set_cont' , False ) = '1' and &
			gnv_data.of_getitem('icred_settings' ,'set_51' , False ) = '3' and &					
			of_security_access( 6802 ) <> 0 	THEN
		//-------End Modified ----------------------------------------------------				m_pfe_cst_master_menu.m_system.m_painters.m_documentlibrarypainter_l2.Visible = True
		ELSE
			m_pfe_cst_master_menu.m_system.m_painters.m_documentlibrarypainter_l2.Visible = False
		END IF
		//---------------------------- APPEON END ----------------------------
				
		
		//--------------------------- APPEON BEGIN ---------------------------
		//$<add> 2006-10-31 By: Allen
		//$<reason> Setup WorkFlow and Email Painter menu item.
		IF of_get_app_setting("set_47","I") = 0 THEN
			m_pfe_cst_master_menu.m_system.m_painters.m_workflowpainter.Visible = FALSE
			//--------------------------- APPEON BEGIN ---------------------------
			//$<modified> 2007-04-20 By: Wu ZhiJun
			//$<reason> Fix a bug
			//m_pfe_cst_master_menu.m_system.m_painters.m_emailpainter.Visible = FALSE
			//--------------------------- APPEON END -----------------------------
		ELSE
			IF of_security_access( 5830 ) = 0 THEN
				m_pfe_cst_master_menu.m_system.m_painters.m_workflowpainter.Visible = FALSE
			ELSE
				m_pfe_cst_master_menu.m_system.m_painters.m_workflowpainter.Visible = True
			END IF
			//Added By Ken.Guo 05/24/2012 //Need cut to buttom 
//			IF of_security_access( 5831 ) = 0 THEN
//				m_pfe_cst_master_menu.m_system.m_painters.m_emailpainter.Visible = FALSE
//			ELSE
//				m_pfe_cst_master_menu.m_system.m_painters.m_emailpainter.Visible = True
//			END IF
		END IF
		
		//Added By Ken.Guo 05/24/2012.  Paste from top
		IF of_security_access( 5831 ) = 0 THEN
			m_pfe_cst_master_menu.m_system.m_painters.m_emailpainter.Visible = FALSE
		ELSE
			m_pfe_cst_master_menu.m_system.m_painters.m_emailpainter.Visible = True
		END IF		

		//Setup To Do List Menu Item
		IF of_get_app_setting("set_49","I") = 0 THEN
			m_pfe_cst_master_menu.m_system.m_painters.m_todolistpainter.Visible = FALSE
			m_pfe_cst_master_menu.m_file.m_todolist.Visible = FALSE
			m_pfe_cst_master_menu.m_file.m_todolist.toolbaritemvisible = FALSE
		ELSE
			IF of_security_access( 5840 ) = 0 THEN
				m_pfe_cst_master_menu.m_system.m_painters.m_todolistpainter.Visible = FALSE
			ELSE
				m_pfe_cst_master_menu.m_system.m_painters.m_todolistpainter.Visible = True
			END IF
			IF of_security_access( 5850 ) = 0 THEN
				m_pfe_cst_master_menu.m_file.m_todolist.Visible = FALSE
				m_pfe_cst_master_menu.m_file.m_todolist.toolbaritemvisible = FALSE
			ELSE
				m_pfe_cst_master_menu.m_file.m_todolist.Visible = TRUE
				m_pfe_cst_master_menu.m_file.m_todolist.toolbaritemvisible = TRUE
			END IF
			
			if of_get_app_setting("set_9","I") = 2 THEN
				m_pfe_cst_master_menu.m_file.m_todolist.toolbaritemvisible = FALSE
			end if
		END IF
		//---------------------------- APPEON END ----------------------------
		
		//--------------------------- APPEON BEGIN ---------------------------
		//$<add> 08.18.2006 By: Lei Wei
		//$<reason> Making the Contract Module a Standalone Product
		IF of_get_app_setting("set_cont","I") = 0 THEN //app setting
			m_pfe_cst_master_menu.m_system.m_painters.m_contractdatascreenpainter.Visible = FALSE
			
			if IsValid(m_pfe_cst_mdi_menu_contract) then
				m_pfe_cst_mdi_menu_contract.m_system.m_painters.m_contractdatascreenpainter.ToolbarItemVisible = FALSE			//Added by Scofield on 2009-01-14
			end if
			
			if IsValid(m_pfe_cst_mdi_menu_contract_am) then
				m_pfe_cst_mdi_menu_contract_am.m_system.m_painters.m_contractdatascreenpainter.ToolbarItemVisible = FALSE		//Added by Scofield on 2009-01-14
			end if
			
			m_pfe_cst_master_menu.m_system.m_painters.m_contractviewpainter.Visible = FALSE
		ELSE
			IF of_security_access( 5300 ) = 0 THEN //user security contract screen painter
				m_pfe_cst_master_menu.m_system.m_painters.m_contractdatascreenpainter.Visible = FALSE
				
				if IsValid(m_pfe_cst_mdi_menu_contract) then
					m_pfe_cst_mdi_menu_contract.m_system.m_painters.m_contractdatascreenpainter.ToolbarItemVisible = FALSE		//Added by Scofield on 2009-01-14
				end if
				
				if IsValid(m_pfe_cst_mdi_menu_contract_am) then
					m_pfe_cst_mdi_menu_contract_am.m_system.m_painters.m_contractdatascreenpainter.ToolbarItemVisible = FALSE	//Added by Scofield on 2009-01-14
				end if
			ELSE
				m_pfe_cst_master_menu.m_system.m_painters.m_contractdatascreenpainter.Visible = TRUE
				
				if IsValid(m_pfe_cst_mdi_menu_contract) then
					m_pfe_cst_mdi_menu_contract.m_system.m_painters.m_contractdatascreenpainter.ToolbarItemVisible = TRUE			//Added by Scofield on 2009-01-14
				end if
				
				if IsValid(m_pfe_cst_mdi_menu_contract_am) then
					m_pfe_cst_mdi_menu_contract_am.m_system.m_painters.m_contractdatascreenpainter.ToolbarItemVisible = TRUE		//Added by Scofield on 2009-01-14
				end if
				
				//Added By Jay Chen 06-09-2014 Make design menu visible when open request webform window
				window	lw_activewindow
				lw_activewindow = w_mdi.GetActiveSheet( )
				if isvalid(lw_activewindow) then
					if IsValid(m_pfe_cst_mdi_menu) then
						if lw_activewindow.classname( ) = 'w_request_webform_approve' or lw_activewindow.classname( ) = 'w_contract' or lw_activewindow.classname( ) = 'w_documents_browse' then
							m_pfe_cst_mdi_menu.m_system.m_painters.m_contractdatascreenpainter.ToolbarItemVisible = TRUE
						else
							m_pfe_cst_mdi_menu.m_system.m_painters.m_contractdatascreenpainter.ToolbarItemVisible = FALSE
						end if
					end if
				end if
				//end
				
			END IF
			
			IF of_security_access( 5400 ) = 0 THEN //user security contract view painter
				m_pfe_cst_master_menu.m_system.m_painters.m_contractviewpainter.Visible = FALSE
			ELSE
				m_pfe_cst_master_menu.m_system.m_painters.m_contractviewpainter.Visible = TRUE
			END IF
		END IF

		// Action item for intelliconract
//		IF of_security_access( 5210 ) = 0 AND gb_contract_version THEN
//			m_pfe_cst_master_menu.m_file.m_actionitems.Visible = False
//			m_pfe_cst_master_menu.m_file.m_actionitems.toolbaritemVisible = False
//		ELSE
//			m_pfe_cst_master_menu.m_file.m_actionitems.Visible = True
//			m_pfe_cst_master_menu.m_file.m_actionitems.toolbaritemVisible = True
//		END IF
		
		//user security Scan OIG
		IF of_security_access( 5500 ) = 0 THEN 
			m_pfe_cst_master_menu.m_system.m_batchoig.Visible = FALSE
		ELSE
			m_pfe_cst_master_menu.m_system.m_batchoig.Visible = TRUE
		END IF
			
		//user security Import OIG
		IF of_security_access( 5510 ) = 0 THEN 
			m_pfe_cst_master_menu.m_system.m_importoigdata.Visible = FALSE
		ELSE
			m_pfe_cst_master_menu.m_system.m_importoigdata.Visible = TRUE
		END IF
		//--------------------------- APPEON BEGIN ---------------------------
		//$<add> 06.14.2007 By: Jack
		//$<reason> User ID Batch Update
		IF of_security_access( 5511 ) = 0 THEN 
			m_pfe_cst_master_menu.m_system.m_useridbatchupdate.Visible = FALSE
		ELSE
			If gnv_data.of_getitem('icred_settings' ,'set_cont' , False ) = '1' THEN
				m_pfe_cst_master_menu.m_system.m_useridbatchupdate.Visible = TRUE
			Else
				m_pfe_cst_master_menu.m_system.m_useridbatchupdate.Visible = FALSE
			End If	
		END IF		
		//---------------------------- APPEON END ----------------------------
		
		if of_security_access( 5600 ) = 0 and of_security_access( 5700 ) = 0 then		//Added by Scofield on 2008-11-12
			m_pfe_cst_master_menu.m_system.m_painters.m_contractrequirementprofile.Visible = false
		else
			m_pfe_cst_master_menu.m_system.m_painters.m_contractrequirementprofile.Visible = true
			
			//user security Contract Requirement Profile
			if of_security_access( 5600 ) = 0 then 
				m_pfe_cst_master_menu.m_system.m_painters.m_contractrequirementprofile.m_contractrequirementprofile0.Visible = false
			else
				m_pfe_cst_master_menu.m_system.m_painters.m_contractrequirementprofile.m_contractrequirementprofile0.Visible = true
			end if
		
			//user security Code Import (CPT Code)
			if of_security_access( 5700 ) = 0 then 
				m_pfe_cst_master_menu.m_system.m_painters.m_contractrequirementprofile.m_cptcode.Visible = false
			else
				m_pfe_cst_master_menu.m_system.m_painters.m_contractrequirementprofile.m_cptcode.Visible = true
			end if
		end if
		
//Start Code Change ---- 11.10.2006 #1 maha moved to further above
//		//QA Painter
//		IF of_security_access( 2010 ) = 0 THEN 
//			m_pfe_cst_master_menu.m_system.m_painters.m_reappointmentmeasurements.Visible = FALSE
//		ELSE
//			m_pfe_cst_master_menu.m_system.m_painters.m_reappointmentmeasurements.Visible = TRUE
//		END IF

//		//QA Folder
//		IF of_security_access( 2020 ) = 0 THEN 
//			m_pfe_cst_master_menu.m_file.m_qualityprofilemeasurements.Visible = FALSE
//			m_pfe_cst_master_menu.m_file.m_qualityprofilemeasurements.toolbaritemVisible = FALSE
//		ELSE
//			m_pfe_cst_master_menu.m_file.m_qualityprofilemeasurements.Visible = TRUE
//			m_pfe_cst_master_menu.m_file.m_qualityprofilemeasurements.toolbaritemVisible = TRUE
//		END IF
//End Code Change---11.10.2006	

		// system Audit Trail   maha012103
		IF (gb_contract_version OR w_mdi.of_security_access( 5800 ) = 0) AND w_mdi.of_security_access( 5810 ) = 0 THEN
			m_pfe_cst_master_menu.m_system.m_audittrail.Visible = False
			m_pfe_cst_master_menu.m_system.m_audittrail.ToolBarItemVisible = False 	//Added By Mark Lee 02/17/2014			
		END IF		

		// Fix a defect.
		IF gb_contract_version THEN
			m_pfe_cst_master_menu.m_system.m_1.Visible = FALSE
		END IF
		
		//$<modify> 09.13.2006 By: LeiWei
		// If the software setting = Contract Logix then Change File->Group Practices menu 
		// to be renamed to File->Locations
		IF gb_contract_version THEN
			m_pfe_cst_master_menu.m_file.m_grouppractices.text = "&Locations"
			m_pfe_cst_master_menu.m_file.m_exit.text = "E&xit Contract Logix~tAlt+F4"
			m_pfe_cst_master_menu.m_reports.m_letters.text = "Contract Correspondence"
			if isvalid(m_pfe_cst_mdi_menu) then //Start Code Change ---- 10.31.2006 #1 maha
				m_pfe_cst_mdi_menu.m_system.m_runactionitemsquery.text = "Run Date Email Alarm Query"
			end if
		ELSE
			m_pfe_cst_master_menu.m_file.m_grouppractices.text = "&Group Practices"
			m_pfe_cst_master_menu.m_file.m_exit.text = "E&xit IntelliCred~tAlt+F4"
			m_pfe_cst_master_menu.m_reports.m_letters.text = "Practitioner Correspondence"
			if isvalid(m_pfe_cst_mdi_menu) then //Start Code Change ---- 10.31.2006 #1 maha
				//---------Begin Modified by Alfee on 05.12.2008 ------------------------------
				IF gb_contract_module THEN 
					m_pfe_cst_mdi_menu.m_system.m_runactionitemsquery.text = "Run Email and Action Items Query"
				ELSE
					m_pfe_cst_mdi_menu.m_system.m_runactionitemsquery.text = "Run Action Items Query"
				END IF
				//m_pfe_cst_mdi_menu.m_system.m_runactionitemsquery.text = "Run Action Items Query"
				//---------End Modified --------------------------------------------------------
			end if
		END IF
		
		//$<add> 11.22.2006 By: Davis
		//$<reason> Set security of Global Search.
		//--------------------------- APPEON BEGIN ---------------------------
		//$<modify> 05.24.2007 By: Jack
		//$<reason> Fix a defect.
		/*
		IF gs_dbtype = "SQL" AND gnv_data.of_getitem('icred_settings' ,'set_48' , False ) = '1' AND w_mdi.of_security_access( 2076 ) >= 1 THEN
		*/
		IF gs_dbtype = "SQL" AND gnv_data.of_getitem('icred_settings' ,'set_48' , False ) = '1' AND w_mdi.of_security_access( 2076 ) >= 1 AND gnv_data.of_getitem('icred_settings' ,'set_cont' , False ) = '1' THEN		
		//---------------------------- APPEON END ----------------------------
			m_pfe_cst_master_menu.m_file.m_contractglobalsearch.visible = TRUE
			m_pfe_cst_master_menu.m_file.m_contractglobalsearch.toolbaritemVisible = TRUE
		ELSE
			m_pfe_cst_master_menu.m_file.m_contractglobalsearch.visible = FALSE
			m_pfe_cst_master_menu.m_file.m_contractglobalsearch.toolbaritemVisible = FALSE
		END IF

		//$<add> 01.08.2007 By: Davis //Start Code Change ----02.05.2008 #V8 maha - code moved
//		IF gb_contract_version THEN
//			m_pfe_cst_master_menu.m_reports.m_npdbreports.visible = FALSE
//			m_pfe_cst_master_menu.m_reports.m_npdbreports.toolbaritemVisible = FALSE
//			//m_pfe_cst_master_menu.m_file.m_casepeerreview.visible = FALSE ////Start Code Change ----02.05.2008 #V8 maha removed - code is above
//			//m_pfe_cst_master_menu.m_file.m_casepeerreview.toolbaritemVisible = FALSE
//		ELSE
//			m_pfe_cst_master_menu.m_reports.m_npdbreports.visible = TRUE
//			m_pfe_cst_master_menu.m_reports.m_npdbreports.toolbaritemVisible = TRUE
//			//m_pfe_cst_master_menu.m_file.m_casepeerreview.visible = TRUE //Start Code Change ----02.05.2008 #V8 maha removed
//			//m_pfe_cst_master_menu.m_file.m_casepeerreview.toolbaritemVisible = TRUE
//		END IF

//---------------------------- APPEON END ----------------------------

		//---------------------------- APPEON END ----------------------------
		
		//Start Code Change ---- 10.03.2006 #630 maha
		if of_get_app_setting("set_19","I") = 20 then 
			m_pfe_cst_master_menu.m_file.m_importdata.Visible = True
		else
			m_pfe_cst_master_menu.m_file.m_importdata.Visible = False
		end if
		//End Code Change---10.03.2006	
		
		//--------------------------- APPEON BEGIN ---------------------------
		//$<add> 05.22.2007 By: Frank.Gui
		//$<reason> 
		try
			if of_get_app_setting("set_9","I")=4 OR of_security_access( 6927 ) = 0 THEN//WebView Required Document Template Action ID=6927
				m_pfe_cst_master_menu.m_system.m_painters.m_webview.visible=false
				m_pfe_cst_master_menu.m_system.m_painters.m_webview.m_webviewtemplatepainter.visible=false
			ELSE
				m_pfe_cst_master_menu.m_system.m_painters.m_webview.visible=true
				m_pfe_cst_master_menu.m_system.m_painters.m_webview.m_webviewtemplatepainter.visible=true
			END IF
		catch(exception ex)
		end try
		//---------------------------- APPEON END ----------------------------
		
//Start Code Change ----02.05.2008 #V8 maha - Security added in version 8
		//Help - Updates
		IF of_security_access( 6933 ) = 0 THEN 
			m_pfe_cst_master_menu.m_help.m_updates.visible = false
		ELSE
			m_pfe_cst_master_menu.m_help.m_updates.visible = true
		End if
		//$<modify> 03.31.2008 by Andy
		//$Reason:  Issue from John(Hide the Net Dev Testing entry under the Help menu from all menus.)
		//dev testing
		/*
		IF of_security_access( 6934 ) = 0 THEN 
			m_pfe_cst_master_menu.m_help.m_newdevtesting.visible = false
		ELSE
			m_pfe_cst_master_menu.m_help.m_newdevtesting.visible = true
		End if
		*/
		m_pfe_cst_master_menu.m_help.m_newdevtesting.visible = false
		//end modify 03.31.2008
		
//########################## this section for items on mdi menu but not on master ##########################
//Start Code Change ----02.05.2008 #V8 maha    
		if isvalid(m_pfe_cst_mdi_menu) then
			//Change password- readded 02.05.2008		
			IF of_security_access( 2200 ) = 0 THEN
				//Modified By Mark Lee 05/02/12
//				m_pfe_cst_mdi_menu.m_system.m_changepassword.Visible = False
				m_pfe_cst_mdi_menu.m_system.m_emailsignature.m_changepassword.Visible = False
			ELSE
				//Modified By Alan on 2008-1-6  BugS120802
				if lower(gs_user_id)='master' then
					//Modified By Mark Lee 05/02/12
//					m_pfe_cst_mdi_menu.m_system.m_changepassword.Visible = False
					m_pfe_cst_mdi_menu.m_system.m_emailsignature.m_changepassword.Visible = False
				else
					//Modified By Mark Lee 05/02/12
//					m_pfe_cst_mdi_menu.m_system.m_changepassword.Visible = True
					m_pfe_cst_mdi_menu.m_system.m_emailsignature.m_changepassword.Visible = True
				end if
			END IF
		
			//Personal - new added 02.05.2008
			If gl_unread_email_cnt > 0 Then
				m_pfe_cst_mdi_menu.m_system.m_emailsignature.m_emailsentitems.ToolbarItemName = 'home_fill.gif'
			Else
				m_pfe_cst_mdi_menu.m_system.m_emailsignature.m_emailsentitems.ToolbarItemName = 'home.gif'
			End If
			
			IF of_security_access( 6931 ) = 0 THEN //email
				m_pfe_cst_mdi_menu.m_system.m_emailsignature.m_emailsignature2.visible = false
				m_pfe_cst_mdi_menu.m_system.m_emailsignature.m_personalaccount.visible = false
				//Added By Mark Lee 05/02/12
//				m_pfe_cst_mdi_menu.m_system.m_newmailmessage.visible = false
				m_pfe_cst_mdi_menu.m_file.m_new_mail_message.visible = false
				m_pfe_cst_mdi_menu.m_system.m_emailsignature.m_emailsentitems.visible = False //Added By Ken.Guo 2009-05-21.
				m_pfe_cst_mdi_menu.m_system.m_emailsignature.m_emailsentitems.ToolbarItemVisible = False //Added By Ken.Guo 2009-05-21.
				If as_menu_name = 'm_pfe_cst_mdi_menu_contract_am' Then
					m_pfe_cst_mdi_menu_contract_am.m_documentmanager.m_email0.visible = False //Added By Ken.Guo 2009-06-04.
					m_pfe_cst_mdi_menu_contract_am.m_documentmanager.m_email0.ToolbarItemVisible = False //Added By Ken.Guo 2009-06-04.
				End If
			else
				m_pfe_cst_mdi_menu.m_system.m_emailsignature.m_emailsignature2.visible = true
				m_pfe_cst_mdi_menu.m_system.m_emailsignature.m_personalaccount.visible = true
				//Added By Mark Lee 05/02/12
//				m_pfe_cst_mdi_menu.m_system.m_newmailmessage.visible = true
				m_pfe_cst_mdi_menu.m_file.m_new_mail_message.visible = true
				m_pfe_cst_mdi_menu.m_system.m_emailsignature.m_emailsentitems.visible = True //Added By Ken.Guo 2009-05-21.
				//If as_menu_name = 'm_pfe_cst_mdi_menu_contract' Then //Only for CTX menu .
				m_pfe_cst_mdi_menu.m_system.m_emailsignature.m_emailsentitems.ToolbarItemVisible = True //Added By Ken.Guo 2009-05-21.				
				//End If
				
				//Added By Ken.Guo 2009-06-04.
				If as_menu_name = 'm_pfe_cst_mdi_menu_contract_am' Then
					//m_pfe_cst_mdi_menu.m_system.m_emailsignature.m_emailsentitems.ToolbarItemVisible = False
					m_pfe_cst_mdi_menu_contract_am.m_documentmanager.m_email0.visible = True 
					m_pfe_cst_mdi_menu_contract_am.m_documentmanager.m_email0.ToolbarItemVisible = True 
				End If
			end if
			
			//Temp folders - new added 02.05.2008
			IF of_security_access( 6932 ) = 0 THEN 
				m_pfe_cst_mdi_menu.m_system.m_emailsignature.m_clientsettings.visible = false
			else
				m_pfe_cst_mdi_menu.m_system.m_emailsignature.m_clientsettings.visible = true
			end if
			
			If of_security_access( 6932 ) = 0 and of_security_access( 6931 ) = 0   THEN //if both set to off hide upper level
				m_pfe_cst_mdi_menu.m_system.m_emailsignature.visible = false
			else
				m_pfe_cst_mdi_menu.m_system.m_emailsignature.visible = true
			end if
			
			//Begin - Added By Mark Lee 02/17/2014
			IF of_security_access( 6997 ) = 0 THEN //Run Date Email Alarm Query 
				m_pfe_cst_mdi_menu.m_system.m_runactionitemsquery.visible = false
				m_pfe_cst_mdi_menu.m_system.m_runactionitemsquery_hyphen.visible	=	false
			else
				m_pfe_cst_mdi_menu.m_system.m_runactionitemsquery.visible = true
				m_pfe_cst_mdi_menu.m_system.m_runactionitemsquery_hyphen.visible	=	true				
			end if
			
			IF of_security_access( 6998 ) = 0 THEN //Refresh Document Signature Data 
				m_pfe_cst_mdi_menu.m_system.m_refresh_sertifi.visible = false
			else
				m_pfe_cst_mdi_menu.m_system.m_refresh_sertifi.visible = true
			end if
			
			IF of_security_access( 6999 ) = 0 THEN //Refresh Document Approval Data 
				m_pfe_cst_mdi_menu.m_system.m_refreshdocumentapprovaldata.visible = false
			else
				m_pfe_cst_mdi_menu.m_system.m_refreshdocumentapprovaldata.visible = true
			end if
			
			IF of_security_access( 7000 ) = 0 THEN //Refresh All Data
				m_pfe_cst_mdi_menu.m_system.m_refreshalldata.visible = false
			else
				m_pfe_cst_mdi_menu.m_system.m_refreshalldata.visible = true
			end if
			//End - Added By Mark Lee 02/17/2014
		end if
//End Code Change---02.05.2008		
		
//#################################################################################################		
		//BEGIN---Add by Evan 09/04/2008
		if of_get_app_setting("set_cont", "I") = 0 or of_security_access(6937) = 0 then
			m_pfe_cst_master_menu.m_system.m_bidq.visible = false
			
			if IsValid(m_pfe_cst_mdi_menu_contract_am) then				//Added by Scofield on 2008-11-24
				m_pfe_cst_mdi_menu_contract_am.m_documentmanager.m_add.m_fromqueue.ToolbarItemVisible = false
			end if
		else
			m_pfe_cst_master_menu.m_system.m_bidq.visible = true
			
			if IsValid(m_pfe_cst_mdi_menu_contract_am) then				//Added by Scofield on 2008-11-24
				m_pfe_cst_mdi_menu_contract_am.m_documentmanager.m_add.m_fromqueue.ToolbarItemVisible = true
			end if
		end if
		//END---Add by Evan 09/04/2008
		
		//Start Code Change ----08.21.2008 #V85 maha
		IF of_security_access( 170 ) = 0 THEN //prac folder, verifications, recred verifications
			m_pfe_cst_master_menu.m_system.m_batchupdate.m_batchrecredential.visible = false
		else
			m_pfe_cst_master_menu.m_system.m_batchupdate.m_batchrecredential.visible = true
		End if
		//End Code Change---08.21.2008
end if		

//@@@@@@@@@ end of main function @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
CHOOSE CASE AS_menu_name
		
	//--------------------------- APPEON BEGIN ---------------------------
	//$<add> 08.17.2006 By: LeiWei
	//$<reason> Making the Contract Module a Standalone Product
	CASE  "m_pfe_cst_contract_data_design"
		//user security :Screen Painter - Contract View Manager
		IF of_security_access( 5310 ) = 0 THEN
			m_pfe_cst_contract_data_design.m_view.m_viewmanager.Visible = False
			m_pfe_cst_contract_data_design.m_view.m_viewmanager.ToolBarItemVisible = False
		ELSE
			m_pfe_cst_contract_data_design.m_view.m_viewmanager.Visible = True
			m_pfe_cst_contract_data_design.m_view.m_viewmanager.ToolBarItemVisible = True
		END IF
		
		if of_security_access(5310) = 0 or of_security_access(5400) = 0 then
			m_pfe_cst_contract_data_design.m_file.m_selectview.Visible = false
			m_pfe_cst_contract_data_design.m_file.m_selectview.ToolBarItemVisible = false
		else
			m_pfe_cst_contract_data_design.m_file.m_selectview.Visible = true
			m_pfe_cst_contract_data_design.m_file.m_selectview.ToolBarItemVisible = true
		end if
		
		//user security :Screen Painter - Contract Field Properties
		IF of_security_access( 5320 ) = 0 THEN
			m_pfe_cst_contract_data_design.m_view.m_fieldproperties.Visible = False
			m_pfe_cst_contract_data_design.m_view.m_fieldproperties.ToolBarItemVisible = False
		ELSE
			m_pfe_cst_contract_data_design.m_view.m_fieldproperties.Visible = True
			m_pfe_cst_contract_data_design.m_view.m_fieldproperties.ToolBarItemVisible = True
		END IF
		
		//user security:Screen Painter - Contract Field Depend -- jervis 09.28.2009
		IF of_security_access( 5330 ) = 0 THEN
			m_pfe_cst_contract_data_design.m_view.m_fielddepend.Visible = False
			m_pfe_cst_contract_data_design.m_view.m_fielddepend.ToolBarItemVisible = False
		ELSE
			m_pfe_cst_contract_data_design.m_view.m_fielddepend.Visible = True
			m_pfe_cst_contract_data_design.m_view.m_fielddepend.ToolBarItemVisible = True
		END IF
	//---------------------------- APPEON END ----------------------------
	
	//Start Code Change ----02.05.2008 #V8 maha - menu logic for Contacts
	CASE  "m_pfe_cst_contract" , "m_pfe_cst_mdi_menu_contract", "m_pfe_cst_mdi_menu","m_pfe_cst_mdi_menu_contract_am"  //,"m_pfe_cst_mdi_dashboard"
		//Begin - Added By Mark Lee 12/18/2012
		IF as_menu_name =  'm_pfe_cst_mdi_menu_contract_am'	 and is_current_window_name ='w_contract'  Then
			if w_contract.tab_contract_details.selectedtab = 9 then	//document Manager
				m_pfe_cst_mdi_menu_contract_am.m_contract0.visible = True
				m_pfe_cst_mdi_menu_contract_am.m_contract0.enabled = True
				
				If of_security_access( 6988 ) = 0 Then 	 //New CTX //Added if statement By Ken.Guo 04/17/2013
					m_pfe_cst_mdi_menu_contract_am.m_contract0.m_new_blank_contract_record.visible =  True
					m_pfe_cst_mdi_menu_contract_am.m_contract0.m_new_blank_contract_record.enabled = False
					m_pfe_cst_mdi_menu_contract_am.m_contract0.m_new_blank_sub_contract_record.visible = True
					m_pfe_cst_mdi_menu_contract_am.m_contract0.m_new_blank_sub_contract_record.enabled = False
					m_pfe_cst_mdi_menu_contract_am.m_contract0.m_new_contract.visible =  True						//--		
					m_pfe_cst_mdi_menu_contract_am.m_edit.m_newcontract.enabled = False //Added By Ken.Guo 04/17/2013
				Else
					m_pfe_cst_mdi_menu_contract_am.m_contract0.m_new_blank_contract_record.visible =  True
					m_pfe_cst_mdi_menu_contract_am.m_contract0.m_new_blank_contract_record.enabled = True
					m_pfe_cst_mdi_menu_contract_am.m_contract0.m_new_blank_sub_contract_record.visible = True
					m_pfe_cst_mdi_menu_contract_am.m_contract0.m_new_blank_sub_contract_record.enabled = True
					m_pfe_cst_mdi_menu_contract_am.m_contract0.m_new_contract.visible =  True						//--									
					m_pfe_cst_mdi_menu_contract_am.m_edit.m_newcontract.enabled = True//Added By Ken.Guo 04/17/2013
				End If
				If of_security_access( 6989 ) = 0 Then 	 //Copy CTX //Added statement By Ken.Guo 04/17/2013
					m_pfe_cst_mdi_menu_contract_am.m_contract0.m_copy_contract_record.visible =  True
					m_pfe_cst_mdi_menu_contract_am.m_contract0.m_copy_contract_record.enabled = False
					m_pfe_cst_mdi_menu_contract_am.m_contract0.m_copy_create_sub_contract_record.visible = True
					m_pfe_cst_mdi_menu_contract_am.m_contract0.m_copy_create_sub_contract_record.enabled = False
					m_pfe_cst_mdi_menu_contract_am.m_contract0.m_copy_contract.visible = True						//--
				Else
					m_pfe_cst_mdi_menu_contract_am.m_contract0.m_copy_contract_record.visible =  True
					m_pfe_cst_mdi_menu_contract_am.m_contract0.m_copy_contract_record.enabled = True
					m_pfe_cst_mdi_menu_contract_am.m_contract0.m_copy_create_sub_contract_record.visible = True
					m_pfe_cst_mdi_menu_contract_am.m_contract0.m_copy_create_sub_contract_record.enabled = True	
					m_pfe_cst_mdi_menu_contract_am.m_contract0.m_copy_contract.visible = True						//--					
				End If
				
				m_pfe_cst_mdi_menu_contract_am.m_contract0.m_contract_templates.visible = True
				If of_security_access( 6955 ) = 0 Then 	 //use template
					m_pfe_cst_mdi_menu_contract_am.m_contract0.m_contract_templates.enabled = false
				else
					m_pfe_cst_mdi_menu_contract_am.m_contract0.m_contract_templates.enabled = True
				end if
				m_pfe_cst_mdi_menu_contract_am.m_contract0.m_template_item.visible = True 	//--
				
				
				If of_security_access( 6988 ) = 0 Then 	 //New CTX //Added By Ken.Guo 04/17/2013
					m_pfe_cst_mdi_menu_contract_am.m_contract0.m_contract_templates.enabled = false
				else
					m_pfe_cst_mdi_menu_contract_am.m_contract0.m_contract_templates.enabled = True
				end if				
				
			end if				
		End If
		//End - Added By Mark Lee 12/18/2012
		
			if of_security_access( 6930 ) = 0   then 		//Contact security
				m_pfe_cst_master_menu.m_file.m_contacts.ToolBaritemVisible = false  //m_pfe_cst_mdi_menu to m_pfe_cst_master_menu - jervis 09.26.2011
				m_pfe_cst_master_menu.m_file.m_contacts.visible = False
			else
				if as_menu_name = "m_pfe_cst_mdi_menu" and not gb_contract_version then
					m_pfe_cst_master_menu.m_file.m_contacts.visible = false
					m_pfe_cst_master_menu.m_file.m_contacts.ToolBaritemVisible = false
				else
					m_pfe_cst_master_menu.m_file.m_contacts.visible = True
					m_pfe_cst_master_menu.m_file.m_contacts.ToolBaritemVisible = true
				end if
			end if
			
			//Added By Ken.Guo 2009-08-27.
			If isvalid(m_pfe_cst_mdi_menu_contract) Then
				//Begin - Added By Mark Lee 12/18/2012
				m_pfe_cst_mdi_menu_contract.m_contract0.visible = True
				m_pfe_cst_mdi_menu_contract.m_contract0.enabled = True

				m_pfe_cst_mdi_menu_contract.m_contract0.m_new_contract.visible =  True						//--	
				If isvalid(gw_contract)  Then 
					IF gw_contract.tab_contract_details.Selectedtab = 1 &
						and  gw_contract.tab_contract_details.tabpage_search.dw_search_det1.GetSelectedRow(0) <= 0 then 
						lb_Display = False
					Else
						lb_Display = True
					End If
				Else
					lb_Display = False
				End If

				m_pfe_cst_mdi_menu_contract.m_contract0.m_new_blank_contract_record.visible =  True
//				m_pfe_cst_mdi_menu_contract.m_contract0.m_new_blank_contract_record.enabled = True				
				m_pfe_cst_mdi_menu_contract.m_contract0.m_new_blank_sub_contract_record.visible = True
//				m_pfe_cst_mdi_menu_contract.m_contract0.m_new_blank_sub_contract_record.enabled = lb_Display
				m_pfe_cst_mdi_menu_contract.m_contract0.m_copy_contract_record.visible =  True
//				m_pfe_cst_mdi_menu_contract.m_contract0.m_copy_contract_record.enabled = lb_Display
				m_pfe_cst_mdi_menu_contract.m_contract0.m_copy_create_sub_contract_record.visible = True
//				m_pfe_cst_mdi_menu_contract.m_contract0.m_copy_create_sub_contract_record.enabled = lb_Display	
				
				m_pfe_cst_mdi_menu_contract.m_contract0.m_copy_contract.visible = True						//--
				m_pfe_cst_mdi_menu_contract.m_contract0.m_contract_templates.visible = True
				m_pfe_cst_mdi_menu_contract.m_contract0.m_template_item.visible = True 	//--
				
				//Added By Ken.Guo 04/17/2013
				If of_security_access( 6988 ) = 0 Then //New CTX
					m_pfe_cst_mdi_menu_contract.m_edit.m_newcontract.m_newctx.enabled = False
					m_pfe_cst_mdi_menu_contract.m_contract0.m_new_blank_contract_record.enabled = False
					m_pfe_cst_mdi_menu_contract.m_contract0.m_new_blank_sub_contract_record.enabled = False
				Else
					m_pfe_cst_mdi_menu_contract.m_edit.m_newcontract.m_newctx .enabled = True
					m_pfe_cst_mdi_menu_contract.m_contract0.m_new_blank_contract_record.enabled = True
					m_pfe_cst_mdi_menu_contract.m_contract0.m_new_blank_sub_contract_record.enabled = lb_Display
				End If
				
				If of_security_access( 6989 ) = 0 Then //Copy CTX
					m_pfe_cst_mdi_menu_contract.m_edit.m_newcontract.m_copyctx.enabled = False
					m_pfe_cst_mdi_menu_contract.m_contract0.m_copy_contract_record.enabled = False
					m_pfe_cst_mdi_menu_contract.m_contract0.m_copy_create_sub_contract_record.enabled = False
				Else
					m_pfe_cst_mdi_menu_contract.m_edit.m_newcontract.m_copyctx .enabled = True
					m_pfe_cst_mdi_menu_contract.m_contract0.m_copy_contract_record.enabled = lb_Display
					m_pfe_cst_mdi_menu_contract.m_contract0.m_copy_create_sub_contract_record.enabled = lb_Display					
				End If	
		
				//End - Added By Mark Lee 12/18/2012				
				If of_security_access( 6955 ) = 0 Then 	 //use template
					m_pfe_cst_mdi_menu_contract.m_edit.m_newcontract.m_usetemplate.visible = False
					m_pfe_cst_mdi_menu_contract.m_edit.m_newcontract.m_usetemplate.toolbaritemvisible = False
					m_pfe_cst_mdi_menu_contract.m_contract0.m_contract_templates.enabled = false				//Added By Mark Lee 12/18/2012
				Else
					m_pfe_cst_mdi_menu_contract.m_edit.m_newcontract.m_usetemplate.visible = True
					m_pfe_cst_mdi_menu_contract.m_edit.m_newcontract.m_usetemplate.toolbaritemvisible = True
					m_pfe_cst_mdi_menu_contract.m_contract0.m_contract_templates.enabled = True			//Added By Mark Lee 12/18/2012
				End If
				
				//Added By Ken.Guo 08/28/2013
				If m_pfe_cst_mdi_menu_contract.m_edit.m_newcontract.m_newctx.enabled = False Then
					If m_pfe_cst_mdi_menu_contract.m_edit.m_newcontract.m_copyctx.enabled and m_pfe_cst_mdi_menu_contract.m_edit.m_newcontract.m_copyctx.toolbaritemvisible Then
						m_pfe_cst_mdi_menu_contract.m_edit.m_newcontract.currentitem = m_pfe_cst_mdi_menu_contract.m_edit.m_newcontract.m_copyctx
					ElseIf m_pfe_cst_mdi_menu_contract.m_edit.m_newcontract.m_usetemplate.enabled and m_pfe_cst_mdi_menu_contract.m_edit.m_newcontract.m_usetemplate.toolbaritemvisible Then
						m_pfe_cst_mdi_menu_contract.m_edit.m_newcontract.currentitem = m_pfe_cst_mdi_menu_contract.m_edit.m_newcontract.m_usetemplate
					End If
				End If
				
				If of_security_access( 6956 ) = 0  Then 	 //Save As...
					m_pfe_cst_mdi_menu_contract.m_file.m_saveas.toolbaritemvisible = False
				Else
					If isvalid(gw_contract) Then
						If gw_contract.tab_contract_details.selectedtab = 2 Then						
							m_pfe_cst_mdi_menu_contract.m_file.m_saveas.toolbaritemvisible = True
						End IF
					End If
				End If	
				
				//Added By Ken.Guo 2009-10-13. 
				If isvalid(gw_contract) Then
					//Email menu
					If gw_contract.tab_contract_details.selectedtab = 9 Then
						//
					Else
						IF w_mdi.of_security_access( 6931 ) = 0 THEN
							m_pfe_cst_mdi_menu_contract.m_edit.m_emaildd.toolbaritemvisible = False
						Else
							//m_pfe_cst_mdi_menu_contract.m_edit.m_emaildd.currentitem = m_pfe_cst_mdi_menu_contract.m_edit.m_emaildd.m_emaildd_email //Web not support.
							m_pfe_cst_mdi_menu_contract.m_edit.m_emaildd.toolbaritemvisible = True
							If gw_contract.tab_contract_details.selectedtab = 1 Then 
								m_pfe_cst_mdi_menu_contract.m_edit.m_emaildd.m_emaildd_email.toolbaritemtext = 'Email'		
								m_pfe_cst_mdi_menu_contract.m_edit.m_emaildd.m_emaildd_batch.toolbaritemvisible = True	
							Else
								//m_pfe_cst_mdi_menu_contract.m_edit.m_emaildd.m_emaildd_email.toolbaritemtext = 'New Email'
								m_pfe_cst_mdi_menu_contract.m_edit.m_emaildd.m_emaildd_email.toolbaritemtext = 'Email'
								m_pfe_cst_mdi_menu_contract.m_edit.m_emaildd.m_emaildd_batch.toolbaritemvisible = False	
							End If		
						End If					
					End If
					//Added By Ken.Guo 2010-02-23. Display Options
					If gw_contract.tab_contract_details.Selectedtab = 1 and  w_mdi.of_security_access( 6978 ) > 0 Then
						m_pfe_cst_mdi_menu_contract.m_file.m_display.toolbaritemvisible = True
					Else
						m_pfe_cst_mdi_menu_contract.m_file.m_display.toolbaritemvisible = False
					End If	
					
					//Add by jervis -- 12.16.2010
					if gw_contract.tab_contract_details.selectedtab = 8 then
						m_pfe_cst_mdi_menu_contract.m_edit.m_duplicate.toolbaritemvisible = True
					else
						m_pfe_cst_mdi_menu_contract.m_edit.m_duplicate.toolbaritemvisible = false
					end if		
				End If
			End IF
			
	//End Code Change---02.05.2008	
	Case "m_pfe_cst_mail"
		//Begin - Added By Mark Lee 02/17/2013
		IF as_menu_name =  'm_pfe_cst_mail'	 and is_current_window_name ='w_contract'  Then
			If w_contract.tab_contract_details.selectedtab = 12 then		//Email Manager
				m_pfe_cst_mail.m_email.m_new.toolbaritemvisible = True
				m_pfe_cst_mail.m_email.m_reply.toolbaritemvisible = True		
				m_pfe_cst_mail.m_email.m_replytoall.toolbaritemvisible = True				
				m_pfe_cst_mail.m_email.m_forward.toolbaritemvisible = True	
				
				//			m_pfe_cst_mail.m_email.m_options.toolbaritemvisible = True
				m_pfe_cst_mail.m_email.m_emaillog.toolbaritemvisible = True
				m_pfe_cst_mail.m_email.m_importmsg.toolbaritemvisible = True		
				m_pfe_cst_mail.m_email.m_findemail.toolbaritemvisible = True				
				m_pfe_cst_mail.m_email.m_refresh.toolbaritemvisible = True			
				
				m_pfe_cst_mail.m_email.m_checkindoc.toolbaritemvisible = False
				m_pfe_cst_mail.m_email.m_receive.toolbaritemvisible = False
				m_pfe_cst_mail.m_email.m_stopreceive.toolbaritemvisible = False
				
				If gnv_data.of_getitem('icred_settings', 'receive_email', False) = '0' Then
					m_pfe_cst_mail.m_email.m_options.toolbaritemvisible = False
				Else
					m_pfe_cst_mail.m_email.m_options.toolbaritemvisible = True
				End If
			End If
		End If
		//End - Added By Mark Lee 02/17/2013
	CASE  "m_pfe_cst_verif_info"
		//process verifications
		IF of_security_access( 150 ) = 0 THEN
			m_pfe_cst_verif_info.m_action.m_connecttoweb.Visible = False
			m_pfe_cst_verif_info.m_action.m_connecttoweb.ToolBarItemVisible = False  //maha 110804
			m_pfe_cst_verif_info.m_action.m_exportdata.Visible = False
			m_pfe_cst_verif_info.m_action.m_exportdata.ToolBarItemVisible = False
			m_pfe_cst_verif_info.m_action.m_phonedialer.Visible = False
			//m_pfe_cst_verif_info.m_action.m_phonedialer.ToolBarItemVisible = False  //Start Code Change ----07.16.2008 #V85 maha - removed
			m_pfe_cst_verif_info.m_action.m_printallletters.Visible = False
			m_pfe_cst_verif_info.m_action.m_printallletters.ToolBarItemVisible = False
			m_pfe_cst_verif_info.m_action.m_searchoig.Visible = False
			m_pfe_cst_verif_info.m_action.m_searchoig.ToolBarItemVisible = False
			m_pfe_cst_verif_info.m_action.m_deleteverification.Visible = False
			m_pfe_cst_verif_info.m_action.m_clearprintflag.Visible = False
			m_pfe_cst_verif_info.m_action.m_clearprintflag.ToolBarItemVisible = False
			//Start Code Change ----07.16.2008 #V85 maha - new items
			m_pfe_cst_verif_info.m_action.m_sendtohistory.Visible = False
			m_pfe_cst_verif_info.m_action.m_findmissingverifs.Visible = False
			m_pfe_cst_verif_info.m_action.m_findmissingverifs.ToolBarItemVisible = False
			//End Code Change---07.16.2008
		ELSE
			// mskinner 21 March 2006 -- begin
			if isvalid(m_pfe_cst_verif_info) then
				m_pfe_cst_verif_info.m_action.m_connecttoweb.Visible = True
				m_pfe_cst_verif_info.m_action.m_connecttoweb.ToolBarItemVisible = True
				m_pfe_cst_verif_info.m_action.m_exportdata.Visible = True
				m_pfe_cst_verif_info.m_action.m_exportdata.ToolBarItemVisible = True
				m_pfe_cst_verif_info.m_action.m_phonedialer.Visible = True
				//m_pfe_cst_verif_info.m_action.m_phonedialer.ToolBarItemVisible = True ////Start Code Change ----07.16.2008 #V85 maha - removed
				m_pfe_cst_verif_info.m_action.m_printallletters.Visible = True
				m_pfe_cst_verif_info.m_action.m_printallletters.ToolBarItemVisible = True	
				m_pfe_cst_verif_info.m_action.m_searchoig.Visible = True
				m_pfe_cst_verif_info.m_action.m_searchoig.ToolBarItemVisible = True
				m_pfe_cst_verif_info.m_action.m_deleteverification.Visible = True
				m_pfe_cst_verif_info.m_action.m_clearprintflag.Visible = True
				m_pfe_cst_verif_info.m_action.m_clearprintflag.ToolBarItemVisible = True
				//Start Code Change ----07.16.2008 #V85 maha - new items
				m_pfe_cst_verif_info.m_action.m_sendtohistory.Visible = True
				m_pfe_cst_verif_info.m_action.m_findmissingverifs.Visible = True
				m_pfe_cst_verif_info.m_action.m_findmissingverifs.ToolBarItemVisible = True
				//End Code Change---07.16.2008				 
			end if
			// // mskinner 21 March 2006 -- end
		END IF								
		//reverify credentials
		IF of_security_access( 170 ) = 0 THEN
			m_pfe_cst_verif_info.m_action.m_reverifydata.Visible = False
			m_pfe_cst_verif_info.m_action.m_reverifydata.ToolBarItemVisible = False
		ELSE
			m_pfe_cst_verif_info.m_action.m_reverifydata.Visible = True	
			m_pfe_cst_verif_info.m_action.m_reverifydata.ToolBarItemVisible = True
		END IF									
		//copy credentials
		IF of_security_access( 180 ) = 0 THEN
			m_pfe_cst_verif_info.m_action.m_copyverification.Visible = False
			m_pfe_cst_verif_info.m_action.m_copyverification.ToolBarItemVisible = False
		ELSE
			m_pfe_cst_verif_info.m_action.m_copyverification.Visible = True		
			m_pfe_cst_verif_info.m_action.m_copyverification.ToolBarItemVisible = True
		END IF
		//capture
		//messagebox("","of nemu sec")
//		if of_get_app_setting("set_13","I") = 1 then ////Start Code Change ---- 03.13.2007 #V7 maha no longer used
//			IF of_security_access( 150 ) = 1 THEN
//				m_pfe_cst_verif_info.m_action.m_screencapture.Visible = True
//				m_pfe_cst_verif_info.m_action.m_screencapture.ToolBarItemVisible = True
//			else
//				m_pfe_cst_verif_info.m_action.m_screencapture.Visible = False
//				m_pfe_cst_verif_info.m_action.m_screencapture.ToolBarItemVisible = False
//			end if
//		else
//			m_pfe_cst_verif_info.m_action.m_screencapture.Visible = False
//			m_pfe_cst_verif_info.m_action.m_screencapture.ToolBarItemVisible = false
//		end if
		
		//Begin add for work flow menu item. 14/11/2006 Henry
		If gb_workflow and of_get_app_setting("set_9", "I") <> 1 Then
			m_pfe_cst_verif_info.m_action.m_workflow.Visible = True
			m_pfe_cst_verif_info.m_action.m_workflow.ToolBarItemVisible = True
		End If
		//End add for work flow menu item
	
	//app audit
	CASE "m_pfe_cst_app_audit" 
		//print missing info letter
		IF of_security_access( 100 ) = 0 THEN
			m_pfe_cst_app_audit.m_action.m_faxmissinginforequest.Visible = False
			m_pfe_cst_app_audit.m_action.m_faxmissinginforequest.toolbaritemvisible = False //Add by Evan 01/14/2008
		ELSE
			m_pfe_cst_app_audit.m_action.m_faxmissinginforequest.Visible = True
			m_pfe_cst_app_audit.m_action.m_faxmissinginforequest.toolbaritemvisible = True //Add by Evan 01/16/2008
		END IF
	//complete data entry
	CASE "m_pfe_cst_data_entry" 
		//print missing info letter
		IF of_security_access( 80 ) = 0 THEN
			m_pfe_cst_data_entry.m_file.m_dataentrycomplete.Visible = False
			m_pfe_cst_data_entry.m_file.m_dataentrycomplete.ToolBarItemVisible = False
		ELSE
			m_pfe_cst_data_entry.m_file.m_dataentrycomplete.Visible = True
			m_pfe_cst_data_entry.m_file.m_dataentrycomplete.ToolBarItemVisible = True
		END IF
		
		IF of_security_access( 40 ) < 2 THEN //maha 082503 multiapp and verify credential
			m_pfe_cst_data_entry.m_file.m_multiapp.Visible = False
			m_pfe_cst_data_entry.m_file.m_multiapp.ToolBarItemVisible = False
			m_pfe_cst_data_entry.m_edit.m_addverificationentry.enabled = False
			m_pfe_cst_data_entry.m_edit.m_addverificationentry.ToolBarItemVisible = False
			m_pfe_cst_data_entry.m_file.m_save.enabled = False
			//m_pfe_cst_data_entry.m_file.m_save.ToolBarItemevisible = False
			m_pfe_cst_data_entry.m_edit.m_insert.enabled = False
			//m_pfe_cst_data_entry.m_edit.m_insert.ToolBarItemVisible = False
			m_pfe_cst_data_entry.m_edit.m_delete1.enabled = False
			//m_pfe_cst_data_entry.m_edit.m_delete1.ToolBarItemVisible = False
		ELSE
			m_pfe_cst_data_entry.m_file.m_multiapp.Visible = True
			m_pfe_cst_data_entry.m_file.m_multiapp.ToolBarItemVisible = True
			m_pfe_cst_data_entry.m_edit.m_addverificationentry.enabled = true		
			m_pfe_cst_data_entry.m_file.m_save.enabled = True
			//m_pfe_cst_data_entry.m_file.m_save.ToolBarItemVisible = True
			m_pfe_cst_data_entry.m_edit.m_insert.enabled = True
			//m_pfe_cst_data_entry.m_edit.m_insert.ToolBarItemVisible = True
			m_pfe_cst_data_entry.m_edit.m_delete1.enabled = True
			//m_pfe_cst_data_entry.m_edit.m_delete1.ToolBarItemVisible = True
		END IF
		//notes icon maha 081701
		if isvalid(w_prac_data_intelliapp) or isvalid(w_prac_data_1) then //maha 090204 trap for return from committee window in action items that changes the menu
			IF gs_cust_type = "I" THEN //maha added 032404
				ll_pracid = w_prac_data_intelliapp.il_prac_id
			ELSE
				ll_pracid = w_prac_data_1.il_prac_id
			END IF
		end if
		//--------------------------- APPEON BEGIN ---------------------------
		//$<ID> PT-02
		//$<modify> 01.24.2006 By: Cao YongWang
		//$<reason> Performance tuning
		//$<modification> Write script to retrieve data from a cache instead of from the database.
	
		//select count(record_id) into :ncnt from pd_notes where prac_id = :ll_pracid;	
		If isvalid(w_prac_data_1) Then
			ncnt = w_prac_data_1.il_pd_notes_cnt
		Elseif isvalid(w_prac_data_intelliapp) Then
			ncnt = w_prac_data_intelliapp.il_pd_notes_cnt
		Else
			select count(record_id) into :ncnt from pd_notes where prac_id = :ll_pracid;	
		End If
		//---------------------------- APPEON END ----------------------------
	
		if ncnt > 0 then 
			m_pfe_cst_data_entry.m_view.m_notes.toolbaritemname = "ScriptYes!"
		else
			m_pfe_cst_data_entry.m_view.m_notes.toolbaritemname = "ScriptNO!"
		end if
		
		//maha 022304
		//select set_35 into :ncnt from icred_settings;
		ncnt = of_get_app_setting("set_35","I")
		if ncnt = 1 then
			m_pfe_cst_data_entry.m_edit.m_practitionerinvoices.Visible = True
		else
			m_pfe_cst_data_entry.m_edit.m_practitionerinvoices.Visible = False
		end if
		
	//	integer test
	//	test = of_get_app_setting( "set_38","I" )
	//	messagebox("",test)
		
		IF of_get_app_setting( "set_38","I" ) = 1 THEN  //for this 1 is off
			m_pfe_cst_data_entry.m_file.m_facilitydata.Visible = False
			m_pfe_cst_data_entry.m_file.m_facilitydata.ToolBarItemVisible = False
		ELSE
			IF Upper( gs_cust_type ) <> 'I' THEN  	//Start Code Change ----03.25.2008 #V8 maha
				m_pfe_cst_data_entry.m_file.m_facilitydata.Visible = true
				m_pfe_cst_data_entry.m_file.m_facilitydata.ToolBarItemVisible = True
			else
				m_pfe_cst_data_entry.m_file.m_facilitydata.Visible = False
				m_pfe_cst_data_entry.m_file.m_facilitydata.ToolBarItemVisible = False	
			end if
		END IF
		
//Start Code Change ----03.25.2008 #V8 maha
		IF Upper( gs_cust_type ) = 'I' THEN  //maha 
			IF of_security_access( 1590 ) = 0 THEN //same access as batch add apps
				m_pfe_cst_data_entry.m_edit.m_batchaddfacilities.visible = False
				m_pfe_cst_data_entry.m_edit.m_batchaddfacilities.ToolBarItemVisible = False
			end if
		else
			m_pfe_cst_data_entry.m_edit.m_batchaddfacilities.visible = False
			m_pfe_cst_data_entry.m_edit.m_batchaddfacilities.ToolBarItemVisible = False		
		END IF
//End Code Change---03.25.2008
	
	CASE  "m_pfe_cst_action_items" 
		//process verifications
		IF of_security_access( 260 ) = 0 THEN
			m_pfe_cst_action_items.m_action.m_connecttoweb.Visible = False
			m_pfe_cst_action_items.m_action.m_connecttoweb.ToolBarItemVisible = False //maha 110804
			m_pfe_cst_action_items.m_action.m_exportdata.Visible = False
			m_pfe_cst_action_items.m_action.m_exportdata.ToolBarItemVisible = False
			m_pfe_cst_action_items.m_action.m_phonedialer.Visible = False
			m_pfe_cst_action_items.m_action.m_phonedialer.ToolBarItemVisible = False
			m_pfe_cst_action_items.m_action.m_printallletters.Visible = False
			m_pfe_cst_action_items.m_action.m_printallletters.ToolBarItemVisible = False
			m_pfe_cst_action_items.m_action.m_searchoig.Visible = False
			m_pfe_cst_action_items.m_action.m_searchoig.ToolBarItemVisible = False
		ELSE
			m_pfe_cst_action_items.m_action.m_connecttoweb.Visible = True
			m_pfe_cst_action_items.m_action.m_connecttoweb.ToolBarItemVisible = True
			m_pfe_cst_action_items.m_action.m_exportdata.Visible = True
			m_pfe_cst_action_items.m_action.m_exportdata.ToolBarItemVisible = True
			m_pfe_cst_action_items.m_action.m_phonedialer.Visible = True
			m_pfe_cst_action_items.m_action.m_phonedialer.ToolBarItemVisible = True
			m_pfe_cst_action_items.m_action.m_printallletters.Visible = True
			m_pfe_cst_action_items.m_action.m_printallletters.ToolBarItemVisible = True
			m_pfe_cst_action_items.m_action.m_searchoig.Visible = True
			m_pfe_cst_action_items.m_action.m_searchoig.ToolBarItemVisible = True
		END IF
		
		//--------------------------- APPEON BEGIN ---------------------------
		//$< Add  > 2008-04-15 By: Scofield
		//$<Reason> Hide Practitioner Search menu item when it is in contract version.
		if gb_contract_version = true then
			m_pfe_cst_action_items.m_action.m_41.Visible = false
			
			m_pfe_cst_action_items.m_action.m_practitionersearch.Visible = false
			m_pfe_cst_action_items.m_action.m_practitionersearch.ToolBarItemVisible = false
		end if
		//---------------------------- APPEON END ----------------------------

	//	ncnt = of_get_app_setting("set_13","I")
	//	messagebox("",ncnt)
//		if of_get_app_setting("set_13","I") = 1 then //capture function  //Start Code Change ---- 03.13.2007 #V7 maha
//			IF of_security_access( 260 ) = 1 THEN
//				m_pfe_cst_action_items.m_action.m_screencapture.Visible = true
//				m_pfe_cst_action_items.m_action.m_screencapture.ToolBarItemVisible = True
//			else
//				m_pfe_cst_action_items.m_action.m_screencapture.Visible = false
//				m_pfe_cst_action_items.m_action.m_screencapture.ToolBarItemVisible = false
//			end if
//		else
//			m_pfe_cst_action_items.m_action.m_screencapture.Visible = false
//			m_pfe_cst_action_items.m_action.m_screencapture.ToolBarItemVisible = false
//		end if
	
	
	CASE "m_pfe_cst_prac_data_design"  //maha 080902
		//select set_11 into :ncnt from icred_settings; //new screen painter
		ncnt = of_get_app_setting("set_11","I")
		//messagebox("ncnt",ncnt)
		if ncnt = 1 then
			m_pfe_cst_prac_data_design.m_file.m_newscreenpainter.Visible = True
			m_pfe_cst_prac_data_design.m_file.m_newscreenpainter.ToolBarItemVisible = True
		end if
		
		//Added by Nova on 2008-09-18
		//user security :Screen Painter - intellicred view manager
		IF of_security_access( 430 ) = 0 THEN
			m_pfe_cst_prac_data_design.m_view.m_viewmanager.Visible = False
			m_pfe_cst_prac_data_design.m_view.m_viewmanager.ToolBarItemVisible = False
		ELSE
			m_pfe_cst_prac_data_design.m_view.m_viewmanager.Visible = True
			m_pfe_cst_prac_data_design.m_view.m_viewmanager.ToolBarItemVisible = True
		END IF
		
		//user security :Screen Painter - intellicred Field Properties
		IF of_security_access( 440 ) = 0 THEN
			m_pfe_cst_prac_data_design.m_view.m_fieldproperties.Visible = False
			m_pfe_cst_prac_data_design.m_view.m_fieldproperties.ToolBarItemVisible = False
		ELSE
			m_pfe_cst_prac_data_design.m_view.m_fieldproperties.Visible = True
			m_pfe_cst_prac_data_design.m_view.m_fieldproperties.ToolBarItemVisible = True
		END IF
	//Added by Nova on 2008-09-18	
		
	//Start Code Change ----03.24.2008 #V8 maha - Hide if web version
		 If appeongetclienttype() <> 'PB' Then
			m_pfe_cst_prac_data_design.m_file.m_toggleprofile.Visible = False
			m_pfe_cst_prac_data_design.m_file.m_toggleprofile.ToolBarItemVisible = False
			m_pfe_cst_prac_data_design.m_file.m_saveasprofilescreen.Visible = False
			m_pfe_cst_prac_data_design.m_file.m_saveasprofilescreen.ToolBarItemVisible = False
		end if
	//End Code Change---03.24.2008
	
	CASE "m_pfe_cst_net_dev"  //maha 110403
		if gi_iapp_on = 0 then
			m_pfe_cst_net_dev.m_file.m_printapps.Visible = False
			m_pfe_cst_net_dev.m_file.m_printapps.ToolBarItemVisible = False
			
		end if
		
		//Begin add for work flow menu item. 14/11/2006 Henry
		If gb_workflow and of_get_app_setting("set_9", "I") = 1 Then
			m_pfe_cst_net_dev.m_action.m_workflow.Visible = True
			m_pfe_cst_net_dev.m_action.m_workflow.ToolBarItemVisible = True
		End If
		//End add for work flow menu item
		
		m_pfe_cst_net_dev.m_edit.m_batchaddfacilities.ToolBarItemVisible = False  //Start Code Change ----04.15.2008 #V8 maha - code added because upable to modify in PB 
	
	CASE "m_pfe_cst_imaging" ,"m_pfe_cst_imaging_browse", "m_pfe_cst_imaging_setup","m_pfe_cst_imaging_view" //maha 092204
		if gi_imaging = 1 then
			//--------Begin Modified by Alfee on 10.13.2008----------
			of_menu_image_security(as_menu_name)
			//IF of_security_access( 1000 ) < 2  THEN //read only
			//	 m_pfe_cst_imaging.m_edit.m_delete1.Visible = False
			//	 m_pfe_cst_imaging.m_edit.m_restorerow.Visible = False
			//END IF
			//--------End Modified ----------------------------------
		end if
	
	//Start Code Change ----04.15.2008 #V8 maha - code added because upable to modify in PB 
	CASE "m_pfe_cst_net_dev_action_items" 
		m_pfe_cst_net_dev_action_items.m_edit.m_batchaddfacilities.ToolBarItemVisible = False
	//End Code Change---04.15.2008
	
	//Start Code Change ---- 11.04.2005 #27 maha
	CASE "m_pfe_cst_privileges" 
		if of_security_access( 210 ) = 1 THEN  //maha 110405 
			m_pfe_cst_master_menu.m_edit.m_insert.enabled = False
			m_pfe_cst_master_menu.m_edit.m_delete1.enabled = False
			m_pfe_cst_master_menu.m_edit.m_insert.ToolBarItemVisible = False
			m_pfe_cst_master_menu.m_edit.m_delete1.ToolBarItemVisible = False
			m_pfe_cst_privileges.m_edit.m_batchupdate1.enabled = False
			m_pfe_cst_privileges.m_edit.m_batchupdate1.ToolBarItemVisible = False
			
		else
			m_pfe_cst_master_menu.m_edit.m_insert.enabled = true
			m_pfe_cst_master_menu.m_edit.m_delete1.enabled = true
			m_pfe_cst_master_menu.m_edit.m_insert.ToolBarItemVisible = true
			m_pfe_cst_master_menu.m_edit.m_delete1.ToolBarItemVisible = true
			m_pfe_cst_privileges.m_edit.m_batchupdate1.enabled = true
			m_pfe_cst_privileges.m_edit.m_batchupdate1.ToolBarItemVisible = true
		end if
	
	
		//change password
		//IF  as_menu_name = "m_pfe_cst_net_dev_action_items" or as_menu_name =  "m_pfe_cst_mdi_menu" OR+&
		//   as_menu_name = "m_pfe_cst_action_items" OR  as_menu_name = "m_pfe_train_app" or as_menu_name = "m_pfe_cst_data_entry" OR+&
		//    as_menu_name = "m_pfe_cst_verif_info" OR+&
		//   as_menu_name = "m_pfe_cst_net_dev" OR as_menu_name = "m_pfe_cst_profile" THEN
		////messagebox("","pass")
		//	IF of_security_access( 2200 ) = 0 THEN
		//		m_pfe_cst_mdi_menu.m_system.m_changepassword.Visible = False
		//	ELSE
		//		m_pfe_cst_mdi_menu.m_system.m_changepassword.Visible = True
		//	END IF
		//end if
		//End Code Change---11.04.2005 
		
		//IF of_version_check() = 0 THEN
		//	of_module_check()
		//	RETURN 1
		//END IF
		
		IF gb_se_version THEN
			IF IsValid( m_pfe_cst_data_entry ) THEN
				m_pfe_cst_data_entry.m_file.m_multiapp.Visible = False
				m_pfe_cst_data_entry.m_file.m_multiapp.ToolBarItemVisible = False
			END IF
		END IF
	Case "m_pfe_cst_mdi_dashboard" //This Case is Added By Ken.Guo 2008-11-20
		If of_security_access( 6943 ) = 1 THEN //Add tab
			m_pfe_cst_mdi_dashboard.m_dashboard2.m_tab.m_addtab.visible = True
		Else
			m_pfe_cst_mdi_dashboard.m_dashboard2.m_tab.m_addtab.visible = False
		End If
		
		If of_security_access( 6944 ) = 1 THEN //delete tab
			m_pfe_cst_mdi_dashboard.m_dashboard2.m_tab.m_deletetab.visible = True
		Else
			m_pfe_cst_mdi_dashboard.m_dashboard2.m_tab.m_deletetab.visible = False
		End If

		If of_security_access( 6945 ) = 1 THEN //Tab page settings
			m_pfe_cst_mdi_dashboard.m_dashboard2.m_tab.m_tabsettings.visible = True	
			m_pfe_cst_mdi_dashboard.m_dashboard2.m_tab.m_tabsettings.toolbaritemVisible = True	
		Else
			m_pfe_cst_mdi_dashboard.m_dashboard2.m_tab.m_tabsettings.visible = False
			m_pfe_cst_mdi_dashboard.m_dashboard2.m_tab.m_tabsettings.toolbaritemVisible = False
		End If		
		
		If m_pfe_cst_mdi_dashboard.m_dashboard2.m_tab.m_deletetab.visible = False And &
			m_pfe_cst_mdi_dashboard.m_dashboard2.m_tab.m_addtab.visible = False And & 
			m_pfe_cst_mdi_dashboard.m_dashboard2.m_tab.m_tabsettings.visible = False Then
			m_pfe_cst_mdi_dashboard.m_dashboard2.m_tab.visible = False
			m_pfe_cst_mdi_dashboard.m_dashboard2.m_dashboard_dash01.visible = False
		Else
			m_pfe_cst_mdi_dashboard.m_dashboard2.m_dashboard_dash01.visible = True
			m_pfe_cst_mdi_dashboard.m_dashboard2.m_tab.visible = True
		End If
		
		If of_security_access( 6946 ) = 1 THEN //save
			m_pfe_cst_mdi_dashboard.m_dashboard2.m_saveas.visible = True			
		Else
			m_pfe_cst_mdi_dashboard.m_dashboard2.m_saveas.visible = False
		End If
		
		If of_security_access( 6947 ) = 1 THEN //load
			m_pfe_cst_mdi_dashboard.m_dashboard2.m_load.visible = True			
		Else
			m_pfe_cst_mdi_dashboard.m_dashboard2.m_load.visible = False			
		End If	

		If of_security_access( 6948 ) = 1 THEN //Management
			m_pfe_cst_mdi_dashboard.m_dashboard2.m_templatesmanagement.visible = True
		Else
			m_pfe_cst_mdi_dashboard.m_dashboard2.m_templatesmanagement.visible = False		
		End If
	
		If of_security_access( 6949 ) = 1 THEN //Logo settings
			m_pfe_cst_mdi_dashboard.m_dashboard2.m_logosettings.visible = True	
			m_pfe_cst_mdi_dashboard.m_dashboard2.m_logosettings.toolbaritemVisible = True	
			m_pfe_cst_mdi_dashboard.m_dashboard2.m_dashboard_dash03.visible = True
		Else
			m_pfe_cst_mdi_dashboard.m_dashboard2.m_logosettings.visible = False	
			m_pfe_cst_mdi_dashboard.m_dashboard2.m_logosettings.toolbaritemVisible = False
			m_pfe_cst_mdi_dashboard.m_dashboard2.m_dashboard_dash03.visible = False			
		End If	
		
		//Fixed BugJ042301 -- Jervis 04.24.2009
		/*
		If of_security_access( 6950 ) = 1 THEN //Close
			m_pfe_cst_mdi_dashboard.m_dashboard2.m_close0.visible = True	
			m_pfe_cst_mdi_dashboard.m_dashboard2.m_close0.toolbaritemVisible = True	
		Else
			m_pfe_cst_mdi_dashboard.m_dashboard2.m_close0.visible = False	
			m_pfe_cst_mdi_dashboard.m_dashboard2.m_close0.toolbaritemVisible = False
		End If	
		*/
		m_pfe_cst_mdi_dashboard.m_dashboard2.m_close0.visible = False	
		m_pfe_cst_mdi_dashboard.m_dashboard2.m_close0.toolbaritemVisible = False
		

		If m_pfe_cst_mdi_dashboard.m_dashboard2.m_saveas.visible = False And & 
					m_pfe_cst_mdi_dashboard.m_dashboard2.m_load.visible = False And &
					m_pfe_cst_mdi_dashboard.m_dashboard2.m_templatesmanagement.visible = False	And &
					m_pfe_cst_mdi_dashboard.m_dashboard2.m_close0.visible = False	Then
			m_pfe_cst_mdi_dashboard.m_dashboard2.m_dashboard_dash02.visible = False			
		Else
			m_pfe_cst_mdi_dashboard.m_dashboard2.m_dashboard_dash02.visible = True			
		End If
//	case 'm_pfe_cst_mdi_menu_contract_am'	//02.12.2009 By Jervis
//
//		Choose Case is_current_window_name
//			Case 'w_contract'
//				if w_contract.tab_contract_details.selectedtab = 9 then	//document Manager
//					w_contract.tab_contract_details.tabpage_images.event ue_set_security()
//				end if				
//			Case 'w_documents_browse'
//				w_documents_browse.uo_1.event ue_set_security()
//		End Choose
			
	CASE ELSE 
	
		if handle(getapplication()) =  0 then 
		//f_system_error_handler("The Menu " + as_menu_name + " does not have any scurity applied to it!" )
		//MESSAGEBOX('Menu security',"The Menu " + as_menu_name + " does not any scurity applied to it!" )
		end if
			
END CHOOSE 

If IsValid( m_pfe_cst_mdi_menu ) Then //added by gavin 2012-01-05
	If gnv_data.of_getitem( 'icred_settings', 'esign', False) = '1' Then
	Else
		m_pfe_cst_mdi_menu.m_system.m_refresh_sertifi.Visible = false 
	End If	
End If


//m_pfe_cst_mdi_menu.m_system.m_emailsignature.m_emailsentitems.toolbaritemname = 'home_fill.gif'

of_Menu_Security_2(as_menu_name)

if gb_IsDocMode then of_HideMenuAndToolItems(This.MenuID)									//Added by Scofield on 2009-07-20


//added by gavins 20130304
dw_ezmenu.of_Refresh_toolbar( this.menuid )

If gb_show_EZMenu Then
	If ib_EZMen_First = True Then
		dw_ezmenu.SetRedraw( False )			
		dw_ezmenu.of_Set_Menu( This.MenuID )			
		dw_ezmenu.SetRedraw( True )	
	Else
		gnv_app.of_Set_ezmenu_refresh_state( TRUE )
		gnv_app.post of_refresh_ezmenu( )
	End If
End If

ib_EZMen_First = FALSE
RETURN 0

end function

public function integer of_prac_folder_security (w_prac_data_1 aw_prac_folder);IF of_version_check() = 0 THEN
	RETURN 1
END IF
//Start Code Change ---- 03.30.2006 #360 maha
aw_prac_folder.tab_1.tabpage_app_audit.visible = true
aw_prac_folder.tab_1.tabpage_image.visible = true
aw_prac_folder.tab_1.tabpage_net.visible = true
aw_prac_folder.tab_1.tabpage_meetings.visible = true
aw_prac_folder.tab_1.tabpage_privileges.visible = true
aw_prac_folder.tab_1.tabpage_profile.visible = true
aw_prac_folder.tab_1.tabpage_verif.visible = true
//End Code Change---03.30.2006
Integer i
Integer li_cnt

li_cnt = UpperBound( ii_security_action_id )

FOR i = 1 TO li_cnt
	//credentialing data
//	IF ii_security_action_id[ i ] = 1000 THEN
//		IF ii_security_action_value[ i ] = 0 THEN
//			 
//		ELSEIF ii_security_action_value[ i ] = 1 THEN
//			//aw_prac_folder.tab_1.tabpage_detail.uo_data_entry.dw_detail.Enabled = False
//		END IF
//	END IF
	//credentialing data
	IF ii_security_action_id[ i ] = 50 THEN
		IF ii_security_action_value[ i ] = 0 THEN
			aw_prac_folder.tab_1.tabpage_detail.Visible = False
		ELSEIF ii_security_action_value[ i ] = 1 THEN
			aw_prac_folder.tab_1.tabpage_detail.uo_data_entry.dw_detail.Enabled = False
			aw_prac_folder.tab_1.tabpage_detail.uo_data_entry.dw_link_list.Enabled = False
		END IF
	END IF
	//application audit
	IF ii_security_action_id[ i ] = 90 THEN
		IF ii_security_action_value[ i ] = 0 THEN
			aw_prac_folder.tab_1.tabpage_app_audit.Visible = False
		ELSEIF ii_security_action_value[ i ] = 1 THEN
			aw_prac_folder.tab_1.tabpage_app_audit.uo_app_audit.dw_detail.Enabled = False
			aw_prac_folder.tab_1.tabpage_app_audit.uo_app_audit.dw_tracker.Enabled = False			
		END IF
	END IF
	//appointment status
	IF ii_security_action_id[ i ] = 120 THEN
		IF ii_security_action_value[ i ] = 0 THEN
			aw_prac_folder.tab_1.tabpage_apptmnt_status.Visible = False
		ELSEIF ii_security_action_value[ i ] = 1 THEN
			aw_prac_folder.tab_1.tabpage_apptmnt_status.uo_affill_status.tab_view.tabpage_detail_1.dw_apptmnt_status.Enabled = False
			aw_prac_folder.tab_1.tabpage_apptmnt_status.uo_affill_status.tab_view.tabpage_detail_1.dw_comm_review.Enabled = false //maha 063004
			aw_prac_folder.tab_1.tabpage_apptmnt_status.uo_affill_status.tab_view.tabpage_detail_2.dw_staff_cat.Enabled = False			
			aw_prac_folder.tab_1.tabpage_apptmnt_status.uo_affill_status.tab_view.tabpage_detail_2.dw_departments.Enabled = False						
			aw_prac_folder.tab_1.tabpage_apptmnt_status.uo_affill_status.tab_view.tabpage_detail_2.dw_cvo.Enabled = False									
			aw_prac_folder.tab_1.tabpage_apptmnt_status.uo_affill_status.tab_view.tabpage_detail_2.dw_leave.Enabled = False												
		END IF
	END IF	
	//verification status
//Start Code Change ---- 05.11.2006 #439 maha
	if gs_cust_type = "I" then
		aw_prac_folder.tab_1.tabpage_verif.Visible = False
	else
		IF ii_security_action_id[ i ] = 140 THEN
			IF ii_security_action_value[ i ] = 0 THEN
				aw_prac_folder.tab_1.tabpage_verif.Visible = False
			ELSEIF ii_security_action_value[ i ] = 1 THEN
				aw_prac_folder.tab_1.tabpage_verif.uo_verif_summary.dw_detail.Enabled = False
			END IF
		END IF
	end if
//Start Code Change ---- 11.01.2005 #3 maha	
	IF ii_security_action_id[ i ] = 170 THEN
		IF ii_security_action_value[ i ] = 0 THEN
			aw_prac_folder.tab_1.tabpage_verif.uo_verif_summary.tab_view.tabpage_recred.cb_init_recred.Enabled = False
			aw_prac_folder.tab_1.tabpage_verif.uo_verif_summary.tab_view.tabpage_recred.cb_crednoverif.Enabled = False
			aw_prac_folder.tab_1.tabpage_verif.uo_verif_summary.tab_view.tabpage_recred.dw_recred_info.Enabled = False
		END IF
	END IF
//End Code Change---11.01.2005 


	//net development
	if gi_iapp_on = 0 then
		aw_prac_folder.tab_1.tabpage_net.Visible = False
	else
		IF ii_security_action_id[ i ] = 1400 THEN
			IF ii_security_action_value[ i ] = 0 THEN
				aw_prac_folder.tab_1.tabpage_net.Visible = False
			ELSEIF ii_security_action_value[ i ] = 1 THEN //view only
				aw_prac_folder.tab_1.tabpage_net.uo_net.tab_1.tabpage_ai.dw_net_dev.Enabled = False
				aw_prac_folder.tab_1.tabpage_net.uo_net.tab_1.tabpage_ids.dw_ids.Enabled = False
				aw_prac_folder.tab_1.tabpage_net.uo_net.tab_1.tabpage_notes.dw_notes.Enabled = False
				aw_prac_folder.tab_1.tabpage_net.uo_net.tab_1.tabpage_ai.dw_appoint_stat.Enabled = False	//maha 071604
				aw_prac_folder.tab_1.tabpage_net.uo_net.cb_1.Enabled = False	//maha 071604
					
			END IF
		END IF	
	end if
	
	//privileging	maha040201
	if gi_priv_mod = 0 then
		aw_prac_folder.tab_1.tabpage_privileges.visible = False
	else
		IF ii_security_action_id[ i ] = 210 THEN
			IF ii_security_action_value[ i ] = 0 THEN
				aw_prac_folder.tab_1.tabpage_privileges.visible = False
			ELSEIF ii_security_action_value[ i ] = 1 THEN //view only
				aw_prac_folder.tab_1.tabpage_privileges.uo_priv.tab_1.tabpage_detail.dw_detail.Enabled = False
				aw_prac_folder.tab_1.tabpage_privileges.uo_priv.tab_1.tabpage_exp_priv.dw_expired.Enabled = False
			END IF
		END IF
	end if
	//imaging	maha040201
	if gi_imaging = 0 then
		aw_prac_folder.tab_1.tabpage_image.visible = False
	else
		IF ii_security_action_id[ i ] = 1000 THEN
			IF ii_security_action_value[ i ] = 0 THEN
				aw_prac_folder.tab_1.tabpage_image.visible = False
			ELSEIF ii_security_action_value[ i ] = 1 THEN //view only
				// maha removed 092204 aw_prac_folder.tab_1.tabpage_image.uo_image.tab_view.tabpage_browse.dw_browse.object.deleteall.visible = False
				aw_prac_folder.tab_1.tabpage_image.uo_image.tab_view.tabpage_setup.visible = False
			END IF
		END IF
			//imaging page data access maha012103
		IF ii_security_action_id[ i ] = 1390 THEN
			//--------------------------- APPEON BEGIN ---------------------------
			//$<modify> 01-16-2007 By: Allen
			//$<reason> 
			/*
			IF ii_security_action_value[ i ] = 0 THEN
			*/
			IF ii_security_action_value[ i ] = 0  AND aw_prac_folder.tab_1.tabpage_image.visible and aw_prac_folder.ib_page7_selected THEN
				//---------------------------- APPEON END ----------------------------
				
				//--------------------------- APPEON BEGIN ---------------------------
				//$<modify> 06.01.2007 By: Frank.Gui; Ken.Guo 2008-02-25 added 'and aw_prac_folder.ib_page7_selected'
				//$<reason> 
				//Old Codes:
					//aw_prac_folder.tab_1.tabpage_image.uo_image.tab_view.tabpage_browse.dw_browse.object.start_page.protect = true
					//aw_prac_folder.tab_1.tabpage_image.uo_image.tab_view.tabpage_browse.dw_browse.object.num_pages.protect = true
				//New Codes:	
				aw_prac_folder.tab_1.tabpage_image.uo_image.tab_view.tabpage_browse.dw_browse.modify("start_page.protect =1")
				aw_prac_folder.tab_1.tabpage_image.uo_image.tab_view.tabpage_browse.dw_browse.modify("num_pages.protect =1")
			ELSEIF ii_security_action_value[ i ] = 1  AND aw_prac_folder.tab_1.tabpage_image.visible and aw_prac_folder.ib_page7_selected THEN
				aw_prac_folder.tab_1.tabpage_image.uo_image.tab_view.tabpage_browse.dw_browse.modify("start_page.protect =0")
				aw_prac_folder.tab_1.tabpage_image.uo_image.tab_view.tabpage_browse.dw_browse.modify("num_pages.protect =0")				
				//---------------------------- APPEON END ----------------------------
			END IF
		END IF
	end if
	
//imaging page data access maha012103 //Start Code Change ----01.04.2008 #V8 maha copied from version4.5
	//IF ii_security_action_id[ i ] = 1390 THEN
	IF ii_security_action_id[ i ] = 1390 and aw_prac_folder.ib_page7_selected THEN //Modified by Ken.Guo 2008-02-25
		IF ii_security_action_value[ i ] = 0 THEN
			aw_prac_folder.tab_1.tabpage_image.uo_image.tab_view.tabpage_browse.dw_browse.object.start_page.protect = true
			aw_prac_folder.tab_1.tabpage_image.uo_image.tab_view.tabpage_browse.dw_browse.object.num_pages.protect = true
		END IF
	END IF
	
//End Code Change---05.10.2006
	//profile printing access maha 082905
	IF ii_security_action_id[ i ] = 1580 THEN
		IF ii_security_action_value[ i ] = 0 THEN
			aw_prac_folder.tab_1.tabpage_profile.visible = False
		END IF
	END IF
	
//Start Code Change ----02.29.2008 #V8 maha	-  new button security
	//Practitioner search screen
	IF ii_security_action_id[ i ] = 20 THEN
		IF ii_security_action_value[ i ] = 0 THEN
			aw_prac_folder.tab_1.tabpage_search.uo_search.cb_new.visible = false
		END IF
	END IF
//End Code Change---02.29.2008
	
		//meetings	maha 012103
	IF ii_security_action_id[ i ] = 190 THEN
		IF ii_security_action_value[ i ] = 0 THEN
			aw_prac_folder.tab_1.tabpage_meetings.visible = False
		ELSEIF ii_security_action_value[ i ] = 1 THEN //view only
			aw_prac_folder.tab_1.tabpage_meetings.uo_meetings.tab_view.tabpage_detail.dw_detail.Enabled = False
		END IF
	END IF
END FOR

RETURN 1
end function

public function integer of_action_items_security (w_action_items aw_action_items);IF of_version_check() = 0 THEN
	RETURN 1
END IF

Integer i
Integer li_cnt

li_cnt = UpperBound( ii_security_action_id )

FOR i = 1 TO li_cnt
	//Analysis tab
	IF ii_security_action_id[ i ] = 250 THEN
		IF ii_security_action_value[ i ] = 0 THEN
			aw_action_items.tab_1.tabpage_analysis.Visible = False
		ELSEIF ii_security_action_value[ i ] = 1 THEN
			aw_action_items.tab_1.tabpage_analysis.tab_analysis.tabpage_exp_appointments.dw_expiring_appointments_graph.enabled = False
			aw_action_items.tab_1.tabpage_analysis.tab_analysis.tabpage_expiring_credentials.dw_expiring_credential_graph.enabled = False
			aw_action_items.tab_1.tabpage_analysis.tab_analysis.tabpage_last_attempt.dw_last_attemp_graph.Enabled = False
			aw_action_items.tab_1.tabpage_analysis.tab_analysis.tabpage_total_attempts.dw_total_attempts.enabled = False
		END IF
	END IF
	//Detail tab
	IF ii_security_action_id[ i ] = 255 THEN
		IF ii_security_action_value[ i ] = 0 THEN
			aw_action_items.tab_1.tabpage_detail.Visible = False
		ELSEIF ii_security_action_value[ i ] = 1 THEN
			aw_action_items.tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.enabled = False
			aw_action_items.tab_1.tabpage_detail.tab_view.tabpage_details.dw_detail.enabled = False
		END IF
	END IF	

	//network development
	IF ii_security_action_id[ i ] = 1700 THEN
		IF ii_security_action_value[ i ] = 0 THEN
			aw_action_items.tab_1.tabpage_net_dev.visible = False
		END IF
	END IF		
	
	
	//Completed Applications
	IF ii_security_action_id[ i ] = 310 THEN
		IF ii_security_action_value[ i ] = 0 THEN
			aw_action_items.tab_1.tabpage_ready.visible = False
		ELSEIF ii_security_action_value[ i ] = 1 THEN
			aw_action_items.tab_1.tabpage_ready.tab_ready.tabpage_ready_to_send.dw_ready.enabled = False
			aw_action_items.tab_1.tabpage_ready.tab_ready.tabpage_sent_to_comm.dw_sent_to_comm.enabled = False
		END IF
	END IF		
	//Send to Committee
	IF ii_security_action_id[ i ] = 320 THEN
		IF ii_security_action_value[ i ] = 0 THEN
			aw_action_items.tab_1.tabpage_ready.cb_send.enabled = False									
		END IF
	END IF			
	//Post Committee Results
	IF ii_security_action_id[ i ] = 330 THEN
		IF ii_security_action_value[ i ] = 0 THEN
			aw_action_items.tab_1.tabpage_ready.cb_post.enabled = False									
		END IF
	END IF				

	//--------------------------- APPEON BEGIN ---------------------------
	//$<add> 08.18.2006 By: LeiWei
	//$<reason> Making the Contract Module a Standalone Product
	//Application Status 
	IF ii_security_action_id[ i ] = 5200 THEN
		IF ii_security_action_value[ i ] = 0 THEN
			aw_action_items.tab_1.tabpage_net_dev.Visible = False									
		END IF
	END IF				

	//Contract tab
	IF ii_security_action_id[ i ] = 5210 THEN
		IF ii_security_action_value[ i ] = 0 THEN
			aw_action_items.tab_1.tabpage_contract.Visible = False									
		END IF
	END IF

	//---------------------------- APPEON END ----------------------------
END FOR


RETURN 0
end function

public function integer of_delete_practitioner ();//Start Code Change ----04.14.2008 #V8 maha - this functionality moved to the pfc_cst_extended_search object for v 8

//Long ll_prac_id
//Integer li_ans
gs_search lstr_search
//n_ds lds_tables
//integer t
//integer tc
//string ls_tname
//string ls_sql
//
lstr_search.stran_transaction = SQLCA
lstr_search.ls_open_for = "DELETE"
//
OpenWithParm( w_extended_search_new , lstr_search )
//
//IF Message.DoubleParm = -1 THEN
//	Return -1
//END IF
//
//ll_prac_id = gl_prac_id
//
//li_ans = MessageBox("DELETE", "This will delete all of the data associated with the practitioner.  Continue?", Information!, YesNo!, 2 )
//
//IF li_ans = 1 THEN
//	li_ans = MessageBox("DELETE", "Are you sure?", Information!, YesNo!, 2 )
//	IF li_ans = 2 THEN
//		RETURN -1
//	END IF
//ELSE
//	RETURN -1
//END IF
//
//COMMIT USING SQLCA;
//
//// code rewritten maha 061804 (4.187)to catch all pd tables including customs.
//lds_tables = create n_ds
//lds_tables.dataobject = "d_pd_tables_for_prac_delete"
//lds_tables.settransobject(sqlca)
//
////--------------------------- APPEON BEGIN ---------------------------
////$<modify> 2005-11-11 By: owen chen
////$<reason> add database option for sql excution
//
//string ls_sqlsyntax
////ls_sqlsyntax =   " SELECT systable.table_id, "+&  
////						"systable.table_name "+& 
////						"FROM systable "+& 
////						"WHERE systable.table_name like 'pd%'"  
//
//choose case gs_dbtype
//	case 'ASA'
//		ls_sqlsyntax =   " SELECT systable.table_id, "+&  
//         					"systable.table_name "+& 
//    							"FROM systable "+& 
//   							"WHERE systable.table_name like 'pd%'"  
//	case 'SQL'
//		ls_sqlsyntax =  " SELECT v_systable.table_id, "+&  
//        						"v_systable.table_name "+& 
//    							"FROM v_systable "+& 
//   							"WHERE v_systable.table_name like 'pd%' "    
//end choose
//lds_tables.setSqlSelect(ls_sqlsyntax)
//
////---------------------------- APPEON END ----------------------------
//
//
//
//
//
//tc = lds_tables.retrieve()
//
////--------------------------- APPEON BEGIN ---------------------------
////$<ID> PT-03
////$<add> 03.21.2006 By: LeiWei
////$<reason> Performance tuning
////$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.
// 
//gnv_appeondb.of_startqueue( )
////---------------------------- APPEON END ----------------------------
//
//for t = 1 to tc
//	ls_tname = lds_tables.getitemstring(t,"table_name")
//	choose case ls_tname
//		case "pd_basic", "pd_affil_stat"
//			continue
//		case else
//			ls_sql = "DELETE FROM " + ls_tname + " where prac_id = " + string(ll_prac_id) + ";"
//			execute immediate :ls_sql using sqlca;
//			commit using sqlca;
//	end choose
//next
//	
//delete from pd_affil_stat
//where prac_id = :ll_prac_id;
//IF SQLCA.SQLCODE = -1 THEN
//	MessageBox("Delete", SQLCA.SQLERRTEXT )
//	RETURN -1
//END IF
//
//delete from verif_info
//where prac_id = :ll_prac_id;
//IF SQLCA.SQLCODE = -1 THEN
//	MessageBox("Delete", SQLCA.SQLERRTEXT )
//	RETURN -1
//END IF
//
//delete from net_dev_ids
//where prac_id = :ll_prac_id;
//IF SQLCA.SQLCODE = -1 THEN
//	MessageBox("Delete", SQLCA.SQLERRTEXT )
//	RETURN -1
//END IF
//
//delete from net_dev_action_items
//where prac_id = :ll_prac_id;
//IF SQLCA.SQLCODE = -1 THEN
//	MessageBox("Delete", SQLCA.SQLERRTEXT )
//	RETURN -1
//END IF
//
//delete from pd_basic
//where prac_id = :ll_prac_id;
//IF SQLCA.SQLCODE = -1 THEN
//	MessageBox("Delete", SQLCA.SQLERRTEXT )
//	RETURN -1
//END IF
//
//COMMIT USING SQLCA;
//
////--------------------------- APPEON BEGIN ---------------------------
////$<ID> PT-04
////$<add> 03.21.2006 By: LeiWei
////$<reason> Performance tuning
////$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.
// 
//gnv_appeondb.of_commitqueue( )
////---------------------------- APPEON END ----------------------------
//
//MessageBox("DELETE", "The record has been deleted.", Information! )

RETURN 0
end function

public function integer of_module_check ();//VERSION CODES	FIRST 4 ALPHA NUMERIC OF VERSION CODE
//
//LIGHT			AA115
//GOLD			BB226
//WORKGROUP		CC337
//ENTERPRISE		EE448
//
//
//
//DIGIT		MODULE				ON VALUE		OFF VALUE
//6			SECURITY MODULE	7					0
//7			PRIVILIGING			3					0
//8			IMAGING				8					0
//9			SITE SURVEYS		5					0
//10			AUDIT TRAIL			1					0
//11			APPLICATION AUDIT	4					0
//12			ACTION ITEMS		6					0
//13			SCREEN PAINTER		2					0
//14			MEETINGS				5					0





Return 1





String ls_version

//check to see if security is installed, if it is not then give access to new view
//ls_version = ProfileString(gs_IniFilePathName, "setup", "version", "None")
ls_version = "EE448738514625"
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-05
//$<modify> 01.17.2006 By: Cao YongWang
//$<reason> No need to make sure the intellicred.ini file exists in the client on web application.
//IF NOT FileExists(gs_dir_path + gs_DefDirName + "\intellicred.ini" ) THEN
//	MessageBox("ini File Error", "No intellicred.ini file found at: " + gs_dir_path + gs_DefDirName + "\intellicred.ini" )
//	Return -1
//END IF
If appeongetclienttype() = 'PB' Then
	IF NOT FileExists(gs_IniFilePathName) THEN
		MessageBox("ini File Error", "No intellicred.ini file found at: " + gs_IniFilePathName )
		Return -1
	END IF
End If
//---------------------------- APPEON END ----------------------------

IF ls_version = "None" THEN
	MessageBox("Error", "Version number not setup.")
	RETURN -1
END IF


//security
IF MID( ls_version, 6, 1) = "7" THEN
	m_pfe_cst_master_menu.m_system.m_painters.m_rolepainter.enabled = True
ELSE
	m_pfe_cst_master_menu.m_system.m_painters.m_rolepainter.enabled = False
END IF


//site survey
IF MID( ls_version, 9, 1) = "5" THEN
	m_pfe_cst_master_menu.m_system.m_painters.m_surveypainter.visible = True
ELSE
	m_pfe_cst_master_menu.m_system.m_painters.m_surveypainter.visible = False
END IF


////audit trail			//Commented By Mark Lee 02/17/2014	don't need it
//IF MID( ls_version, 10, 1) = "1" THEN
//	m_pfe_cst_master_menu.m_system.m_audittrail.visible = True
//ELSE
//	m_pfe_cst_master_menu.m_system.m_audittrail.visible = False
//END IF


//app audit painter
IF MID( ls_version, 11, 1) = "4" THEN
	m_pfe_cst_master_menu.m_system.m_painters.m_applicationauditpainter.visible = True
ELSE
	m_pfe_cst_master_menu.m_system.m_painters.m_applicationauditpainter.visible = False	
END IF

//Begin - Added By Mark Lee 04/27/12
////action items
//IF MID( ls_version, 12, 1) = "6" THEN
//	m_pfe_cst_master_menu.m_file.m_actionitems.visible = True
//ELSE
//	m_pfe_cst_master_menu.m_file.m_actionitems.visible = False
//	m_pfe_cst_master_menu.m_file.m_actionitems.toolbaritemvisible = False
//END IF
//End - Added By Mark Lee 04/27/12

//screen painter
IF MID( ls_version, 13, 1) = "2" THEN
	m_pfe_cst_master_menu.m_system.m_painters.m_screenpainter.visible = True
ELSE
	m_pfe_cst_master_menu.m_system.m_painters.m_screenpainter.visible = False	
END IF

//meetings
IF MID( ls_version, 14, 1) = "5" THEN
	m_pfe_cst_master_menu.m_file.m_meetings.visible = True
ELSE
	m_pfe_cst_master_menu.m_file.m_meetings.visible = False
	m_pfe_cst_master_menu.m_file.m_meetings.toolbaritemvisible = False
END IF


RETURN 1


end function

public function integer of_version_check ();Return 1

String ls_version

//VERSION CODES
//
//LIGHT			AA115
//GOLD			BB226
//WORKGROUP		CC337
//ENTERPRISE		EE448
//
//SECURITY MODULE
//If the security module is installed then the 6th  digit of the version code will equel to 7 else it will be 0
//
//PRIVILIGING
//If privileging is installed then the 7th digit will equel 3
//
//IMAGING 
//IF imaging is installed then the 8th digit will equal 8
//
//SITE SURVEYS
//If site surveys is installed then the 9th digit will equal 5




//ls_version = ProfileString(gs_IniFilePathName, "setup", "version", "None")
ls_version = "EE448738514625"
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-06
//$<modify> 01.17.2006 By: Cao YongWang
//$<reason> Performance tuning. There is no need to check the INI file on local machine. The Web application
//$<reason> reads INI file from the server.
//$<modification> Make an condition to make sure when it is on the Web, the IntelliCred application
//$<modification> does not read local INI file.
//IF NOT FileExists( gs_dir_path + gs_DefDirName + "\intellicred.ini" ) THEN
//	MessageBox("ini File Error", "No intellicred.ini file found at: " + gs_dir_path + gs_DefDirName + "\intellicred.ini" )
//	Return -1
//END IF
If appeongetclienttype() = 'PB' Then
	IF NOT FileExists(gs_IniFilePathName) THEN
		MessageBox("ini File Error", "No intellicred.ini file found at: " + gs_IniFilePathName )
		Return -1
	END IF
End If
//---------------------------- APPEON END ----------------------------


IF ls_version = "None" THEN
	MessageBox("Error", "Version number not setup.")
	RETURN -1
END IF

IF MID( ls_version, 6, 1) = "7" THEN
	Return 1
ELSE
	Return 0
END IF



RETURN 1


RETURN 0
end function

public function integer of_qa_peer_screen_security (w_reappointment_measurements_search aw_prac_folder);////Start Code Change ----02.29.2008 #V8 maha - Function added for security
Integer i
Integer li_cnt

aw_prac_folder.tab_qa.tabpage_quality_profile.visible = true
aw_prac_folder.tab_qa.tabpage_site_survey.visible = true
aw_prac_folder.tab_qa.tabpage_case_review.visible = true

li_cnt = UpperBound( ii_security_action_id )

FOR i = 1 TO li_cnt
	//QA
	IF ii_security_action_id[ i ] = 2020 THEN
		IF ii_security_action_value[ i ] = 0 THEN
			aw_prac_folder.tab_qa.tabpage_quality_profile.visible = false
		ELSEIF ii_security_action_value[ i ] = 1 THEN
			aw_prac_folder.tab_qa.tabpage_quality_profile.uo_1.tab_measurements.tabpage_detail.dw_measuremt_header.enabled = false
			aw_prac_folder.tab_qa.tabpage_quality_profile.uo_1.tab_measurements.tabpage_detail.dw_measuremt_detail.enabled = false
		END IF
	end if
	//QA AI
	IF ii_security_action_id[ i ] = 2030 THEN
		IF ii_security_action_value[ i ] = 0 THEN
			aw_prac_folder.tab_qa.tabpage_quality_profile.uo_1.tab_measurements.tabpage_action_items.visible = false
		ELSEIF ii_security_action_value[ i ] = 1 THEN
			aw_prac_folder.tab_qa.tabpage_quality_profile.uo_1.tab_measurements.tabpage_action_items.dw_1.enabled = false
		END IF
	
	END IF
	//PEER
	IF ii_security_action_id[ i ] = 2040 THEN
		IF ii_security_action_value[ i ] = 0 THEN
			aw_prac_folder.tab_qa.tabpage_case_review.visible = false
		ELSEIF ii_security_action_value[ i ] = 1 THEN
			aw_prac_folder.tab_qa.tabpage_case_review.uo_1.tab_1.tabpage_detail.tab_2.tabpage_case_detail.dw_detail.enabled = false
			aw_prac_folder.tab_qa.tabpage_case_review.uo_1.tab_1.tabpage_detail.tab_2.tabpage_case_detail.dw_physicians.enabled = false
		END IF
	END IF
	//PEER AI
	IF ii_security_action_id[ i ] = 2060 THEN
		IF ii_security_action_value[ i ] = 0 THEN
			aw_prac_folder.tab_qa.tabpage_case_review.uo_1.tab_1.tabpage_detail.tab_2.tabpage_ai.visible = false
		ELSEIF ii_security_action_value[ i ] = 1 THEN
			aw_prac_folder.tab_qa.tabpage_case_review.uo_1.tab_1.tabpage_detail.tab_2.tabpage_ai.dw_action_item.enabled = false
			aw_prac_folder.tab_qa.tabpage_case_review.uo_1.tab_1.tabpage_detail.tab_2.tabpage_ai.dw_ai_report.enabled = false
		END IF
	end if
	//SITE
	IF ii_security_action_id[ i ] = 120 THEN
		IF ii_security_action_value[ i ] = 0 THEN
			//aw_prac_folder.tab_1.tabpage_apptmnt_status.Visible = False
		ELSEIF ii_security_action_value[ i ] = 1 THEN
//			aw_prac_folder.tab_1.tabpage_apptmnt_status.uo_affill_status.tab_view.tabpage_detail_1.dw_apptmnt_status.Enabled = False
//			aw_prac_folder.tab_1.tabpage_apptmnt_status.uo_affill_status.tab_view.tabpage_detail_1.dw_comm_review.Enabled = false //maha 063004
//			aw_prac_folder.tab_1.tabpage_apptmnt_status.uo_affill_status.tab_view.tabpage_detail_2.dw_staff_cat.Enabled = False			
//			aw_prac_folder.tab_1.tabpage_apptmnt_status.uo_affill_status.tab_view.tabpage_detail_2.dw_departments.Enabled = False						
//			aw_prac_folder.tab_1.tabpage_apptmnt_status.uo_affill_status.tab_view.tabpage_detail_2.dw_cvo.Enabled = False									
//			aw_prac_folder.tab_1.tabpage_apptmnt_status.uo_affill_status.tab_view.tabpage_detail_2.dw_leave.Enabled = False												
		END IF
	END IF	
	//verification status

END FOR

RETURN 1
end function

public subroutine of_getcurrentobject ();//--------------------------- APPEON BEGIN ---------------------------
//$< Add  > 2008-03-05 By: Scofield
//$<Reason> Convenience the coder to open object

long					ll_Cycle,ll_ColCnts,ll_DDDWCnts,ll_MaxColLen
String				ls_Temp,ls_DaObj,ls_DDDWList
String				ls_WinName,ls_MenuName,ls_UserObjInfo
String				ls_ColStyle,ls_ColName[],ls_DDDWName[]
Boolean				lb_IsUserObj = false
GraphicObject 		lgo_Obj,lgo_Temp,lgo_UserObj
ClassDefinition	lcd_Temp,lcd_ClassDef
picture				lpic_Obj
picturebutton		lpicb_Obj
DataWindow			ldw_Obj
Window 				lw_Win

CONSTANT STRING ARROWHEAD    = '---->'
CONSTANT STRING SINGLEENTER  = '~r~n'
CONSTANT STRING DOUBLEENTER  = SINGLEENTER + SINGLEENTER
CONSTANT STRING MESSAGETITLE = 'Object Information'

lgo_Obj = GetFocus()
if IsNull(lgo_Obj) then Return

////////////////////////////Find Parent Object/////////////////////////////////////

lgo_Temp = lgo_Obj

do while Not IsNull(lgo_Temp) and TypeOf(lgo_Temp) <> Window!
	if TypeOf(lgo_Temp) = UserObject! and Not lb_IsUserObj then
		lb_IsUserObj = true
		lgo_UserObj = lgo_Temp
	end if
	
	if TypeOf(lgo_Temp) = DataWindow! then
		ldw_Obj = lgo_Temp
		ls_DaObj = ldw_Obj.DataObject
		
		ls_Temp = lgo_Temp.ClassName() + '(' + ls_DaObj + ')'
		
		ll_ColCnts = long(ldw_Obj.Describe('DataWindow.Column.Count'))
		for ll_Cycle = 1 to ll_ColCnts
			ls_ColStyle = ldw_Obj.Describe('#' + String(ll_Cycle) + '.Edit.Style')
			if ls_ColStyle = 'dddw' then
				ll_DDDWCnts++
				ls_ColName[ll_DDDWCnts]  = ldw_Obj.Describe('#' + String(ll_Cycle) + '.Name')
				ls_DDDWName[ll_DDDWCnts] = ldw_Obj.Describe('#' + String(ll_Cycle) + '.DDDW.Name')
				
				if Len(ls_ColName[ll_DDDWCnts]) > ll_MaxColLen then ll_MaxColLen = Len(ls_ColName[ll_DDDWCnts])
			end if
		next
		
		for ll_Cycle = 1 to ll_DDDWCnts
			ls_DDDWList += SINGLEENTER + SPACE(ll_MaxColLen - Len(ls_ColName[ll_Cycle])) + ls_ColName[ll_Cycle] + '.DDDW.Name = ~'' + ls_DDDWName[ll_Cycle] + '~''
		next
		
		if ls_DDDWList <> '' then ls_DDDWList = SINGLEENTER + ls_DDDWList
		
		ls_Temp += ls_DDDWList
	elseif TypeOf(lgo_Temp) = Picture! or TypeOf(lgo_Temp) = PictureHyperLink! then
		lpic_Obj = lgo_Temp
		
		ls_Temp = lgo_Temp.ClassName() + '(' + lpic_Obj.PictureName + ')'
	elseif TypeOf(lgo_Temp) = PictureButton! then
		lpicb_Obj = lgo_Temp
		
		ls_Temp = lgo_Temp.ClassName() + '(' + lpicb_Obj.PictureName + ',' + lpicb_Obj.DisabledName + ')'
	else
		ls_Temp = lgo_Temp.ClassName() + '.' + ls_Temp
	end if
	
	lgo_Temp = lgo_Temp.GetParent()
loop

if IsNull(lgo_Temp) then
	MessageBox(MESSAGETITLE,ls_Temp)
	Return
end if

if TypeOf(lgo_Temp) = Window! then
	lw_Win = lgo_Temp
	ls_WinName = lw_Win.ClassName()
	lcd_ClassDef = FindClassDefinition(ls_WinName)
	
	if Not(IsNull(lw_Win.MenuName) or Trim(lw_Win.MenuName) = '') then
		ls_MenuName = lw_Win.ClassName() + '.MenuName: ' + lw_Win.MenuName + DOUBLEENTER
	elseif Not (IsNull(This.MenuName) or Trim(This.MenuName) = '') then
		ls_MenuName = This.ClassName() + '.MenuName: ' + This.MenuName + DOUBLEENTER
	end if
	
	ls_Temp = ls_MenuName + ls_WinName + '.' + ls_Temp
end if

if Right(ls_Temp,1) = '.' then ls_Temp = Left(ls_Temp,Len(ls_Temp) - 1)

/////////////////////////////UserObject Trace//////////////////////////////////////

if lb_IsUserObj and Not IsNull(lgo_UserObj) then
	ls_UserObjInfo += DOUBLEENTER
	lgo_Temp = lgo_UserObj
	
	ls_UserObjInfo += lgo_Temp.ClassName()
	lcd_Temp = lgo_Temp.ClassDefinition
	lcd_Temp = lcd_Temp.Ancestor
	
	do while Not IsNull(lcd_Temp) and lower(lcd_Temp.Name) <> 'userobject'
		ls_UserObjInfo += ARROWHEAD + lcd_Temp.Name
		lcd_Temp = lcd_Temp.Ancestor
	loop
	
	if Pos(ls_UserObjInfo,ARROWHEAD) > 0 then ls_Temp += ls_UserObjInfo
end if
///////////////////////////////////////////////////////////////////////////////////

MessageBox(MESSAGETITLE,ls_Temp)

end subroutine

public function integer of_menu_image_security (string as_menu_image);//Set menu security for imaging tabpages - Added by Alfee on 10.13.2008 

m_pfe_cst_imaging lm_image

IF of_security_access( 1000 ) < 2  THEN //read only
	//Get current image menu
	CHOOSE CASE Lower(as_menu_image)
		CASE 'm_pfe_cst_imaging_browse'
			lm_image = m_pfe_cst_imaging_browse
		CASE 'm_pfe_cst_imaging_view'
			lm_image = m_pfe_cst_imaging_view
		CASE 'm_pfe_cst_imaging_setup'
			lm_image = m_pfe_cst_imaging_setup
		CASE ELSE
			lm_image = m_pfe_cst_imaging
	END CHOOSE
	
	//Set menu items and toolbars accordingly
	IF IsValid(lm_image) THEN
		lm_image.m_file.m_save.Visible = False
		lm_image.m_file.m_saveimage.Visible = False		
		lm_image.m_edit.m_insert.Visible = False
		lm_image.m_edit.m_110.Visible = False
		lm_image.m_edit.m_delete1.Visible = False
		lm_image.m_edit.m_3.Visible = False
		lm_image.m_edit.m_restorerow.Visible = False		

		lm_image.m_file.m_save.ToolbarItemVisible = False
		lm_image.m_file.m_saveimage.ToolbarItemVisible = False		
		lm_image.m_edit.m_delete1.ToolbarItemVisible = False
		lm_image.m_edit.m_restorerow.ToolbarItemVisible = False				
	END IF	
END IF

RETURN 1
end function

public subroutine of_hidemenuandtoolitems (menu am_menu);//====================================================================
// Function: of_HideMenuAndToolItems()
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value    menu    am_Menu
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:	Scofield		Date: 2009-07-20
//--------------------------------------------------------------------
//	Copyright (c) 1999-2009 Contractlogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

if Not IsValid(am_Menu) then Return

long	ll_Cycle,ll_ItemCnts

ll_ItemCnts = UpperBound(am_Menu.Item)
for ll_Cycle = 1 to ll_ItemCnts
	if am_Menu.Item[ll_Cycle].Text = "&Close" then CONTINUE
	if am_Menu.Item[ll_Cycle].Text = "E&xit InteliCred" then CONTINUE
	if am_Menu.Item[ll_Cycle].Text = "Document Manager" then CONTINUE
	
	of_HideMenuAndToolItems(am_Menu.Item[ll_Cycle])
	am_Menu.Item[ll_Cycle].Enabled = false
	am_Menu.Item[ll_Cycle].ToolbarItemVisible = false
next

end subroutine

public subroutine of_menu_security_2 (string as_menu_name);//====================================================================
// Function: of_Menu_Security_2()
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:	Scofield		Date: 2010-01-13
//--------------------------------------------------------------------
//	Copyright (c) 1999-2009 ContractLogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
// Add as_menu_name parm by Ken.Guo 2010-03-26
//====================================================================

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 08.31.2006 By: Liang QingShi
//$<reason> Contract module modification 

if gb_contract_version = true then
	m_pfe_cst_master_menu.m_file.m_casepeerreview.Visible = false					//Added by Scofield on 2008-04-23
	m_pfe_cst_master_menu.m_system.m_painters.m_reportpainter.visible = False 	//Added by Alan on 2008-10-13
//	m_pfe_cst_master_menu.m_file.m_contract.toolbaritemorder = 0
	m_pfe_cst_master_menu.m_window.m_dashboard.Visible = False 						//Added by Scofield on 2008-12-31: Set 'Task list' menu item invisible
else
	//Set toolbaritemorder value to 9  ,12.12.2006 By Jervis
	//m_pfe_cst_master_menu.m_file.m_contract.toolbaritemorder = 8
	m_pfe_cst_master_menu.m_file.m_contract.toolbaritemorder = 8
end if	
//---------------------------- APPEON END ----------------------------

//BEGIN---Modify by Scofield on 2009-10-23
if IsValid(m_pfe_cst_master_menu) then
	if (of_security_access(1470) = 0 or gi_ireport_on = 0) and (of_security_access(2190) = 0 or gi_export_on = 0) and (of_security_access(700) = 0) then
		m_pfe_cst_master_menu.m_reports.Visible = false
		m_pfe_cst_master_menu.m_reports.ToolBarItemVisible = false
		
		m_pfe_cst_master_menu.m_System.Text = m_pfe_cst_master_menu.m_System.Text		//Workaround PB Bug
	else
		m_pfe_cst_master_menu.m_reports.Visible = true
		m_pfe_cst_master_menu.m_reports.ToolBarItemVisible = true
	end if
	
	//Begin - Added By Mark Lee 09/27/2013
	if of_security_access(6991) = 1 then 
		m_pfe_cst_master_menu.m_system.m_painters.m_requestformpainter.Visible = true
	else
		m_pfe_cst_master_menu.m_system.m_painters.m_requestformpainter.Visible = false		
	end if 
	
	if of_security_access(6992) = 1 then 
		m_pfe_cst_master_menu.m_file.m_requestwebformapprove.visible = true
		m_pfe_cst_master_menu.m_file.m_requestwebformapprove.ToolBarItemVisible = true		
	else
		m_pfe_cst_master_menu.m_file.m_requestwebformapprove.visible = false		
		m_pfe_cst_master_menu.m_file.m_requestwebformapprove.ToolBarItemVisible = false				
	end if 
	
	//Added By Mark Lee 03/11/2014
	if of_security_access(7003) = 1 and gnv_data.of_getitem('icred_settings', 'webapi', False) = '1'  then 
		m_pfe_cst_master_menu.m_system.m_painters.m_webapikeypainter.Visible = true
	else
		m_pfe_cst_master_menu.m_system.m_painters.m_webapikeypainter.Visible = false		
	end if 
	//End - Added By Mark Lee 09/27/2013

end if
//END---Modify by Scofield on 2009-10-23

//Begin - Added By Mark Lee 10/26/12   we  don't need it at now.
////BEGIN---Modify by Scofield on 2009-12-01
//if IsValid(gw_Contract) and IsValid(m_pfe_cst_mdi_menu_contract) then
//	if of_security_access(6957) = 1 and gw_Contract.tab_contract_details.SelectedTab = 1 then
//		m_pfe_cst_mdi_menu_contract.m_File.m_Display.m_Disp_Calendar.Visible = true
//		m_pfe_cst_mdi_menu_contract.m_File.m_Display.m_Disp_Calendar.ToolbarItemVisible = true
//	else
//		m_pfe_cst_mdi_menu_contract.m_File.m_Display.m_Disp_Calendar.Visible = false
//		m_pfe_cst_mdi_menu_contract.m_File.m_Display.m_Disp_Calendar.ToolbarItemVisible = false
//	end if
//end if
////END---Modify by Scofield on 2009-12-01
//End - Added By Mark Lee 10/26/12

//if of_security_access(6957) = 1 then //Calendar settings 
if of_security_access(6957) = 1 or of_security_access(6957) = 2 then //Calendar settings  //Modified By Jay Chen 08-10-2015 add readonly right
	m_pfe_cst_master_menu.m_file.m_Calendar.Visible = true
	m_pfe_cst_master_menu.m_file.m_Calendar.ToolbarItemVisible = true
else
	m_pfe_cst_master_menu.m_file.m_Calendar.Visible = false
	m_pfe_cst_master_menu.m_file.m_Calendar.ToolbarItemVisible = false
end if

//Added By Ken.Guo 2010-05-14.
integer i

//If isvalid(m_pfe_cst_mail) and Not isvalid(w_email_folder) Then		//Added By Mark Lee 02/17/2013
If isvalid(m_pfe_cst_mail) and Not isvalid(w_email_folder) and Not isvalid(w_contract_email_folder) Then
	For i = 1 to UpperBound(m_pfe_cst_mail.m_email.Item[])
		m_pfe_cst_mail.m_email.Item[i].toolbaritemvisible = False
	Next
End If

Choose Case as_menu_name
	Case 'm_pfe_cst_mdi_menu_contract'
		
		//Search Tab Add/Create/Queue/Auto_Refresh/Report Toolabr ICOs settings
		If isvalid(gw_contract) Then
			If gw_contract.tab_contract_details.selectedtab = 1 Then
				
				If Not isvalid(m_pfe_cst_mdi_menu_contract) Then Return 
				m_pfe_cst_mdi_menu_contract.m_file.m_options.m_autorefresh.toolbaritemvisible = True
				m_pfe_cst_mdi_menu_contract.m_file.m_select.toolbaritemvisible = True
				m_pfe_cst_mdi_menu_contract.m_file.m_refresh.toolbaritemvisible = True
				
				//Auto Refresh Toolbar Item
				If gw_contract.tab_contract_details.tabpage_search.ib_autoretrieve Then
					m_pfe_cst_mdi_menu_contract.m_file.m_options.m_autorefresh.toolbaritemdown = True
					m_pfe_cst_mdi_menu_contract.m_file.m_options.m_autorefresh.tag = 'auto'
				Else
					m_pfe_cst_mdi_menu_contract.m_file.m_options.m_autorefresh.toolbaritemdown = False
					m_pfe_cst_mdi_menu_contract.m_file.m_options.m_autorefresh.tag = 'non-auto'
				End If
				
				//Report Toolbar Item
				Long ll_Right
				ll_Right = w_mdi.of_security_access(6952)
				If ll_Right = 1 Then
					m_pfe_cst_mdi_menu_contract.m_file.m_output0.visible = True
					m_pfe_cst_mdi_menu_contract.m_file.m_output0.toolbaritemvisible = True
					m_pfe_cst_mdi_menu_contract.m_file.m_output0.m_output1.visible = True
					m_pfe_cst_mdi_menu_contract.m_file.m_output0.m_output1.toolbaritemvisible = True
					m_pfe_cst_mdi_menu_contract.m_file.m_output0.m_report.visible = True
					m_pfe_cst_mdi_menu_contract.m_file.m_output0.m_report.toolbaritemvisible = True	
				Else
					m_pfe_cst_mdi_menu_contract.m_file.m_output0.visible = False
					m_pfe_cst_mdi_menu_contract.m_file.m_output0.toolbaritemvisible = False
					m_pfe_cst_mdi_menu_contract.m_file.m_output0.m_output1.visible = False
					m_pfe_cst_mdi_menu_contract.m_file.m_output0.m_output1.toolbaritemvisible = False
					m_pfe_cst_mdi_menu_contract.m_file.m_output0.m_report.visible = False
					m_pfe_cst_mdi_menu_contract.m_file.m_output0.m_report.toolbaritemvisible = False
				End If
				
				//Batch Alarms //Added By Ken.Guo 03/28/2013
				m_pfe_cst_mdi_menu_contract.m_edit.m_7.toolbaritemvisible = True
			Else
				//Hide Output	
				m_pfe_cst_mdi_menu_contract.m_file.m_output0.visible = False
				m_pfe_cst_mdi_menu_contract.m_file.m_output0.toolbaritemvisible = False
				m_pfe_cst_mdi_menu_contract.m_file.m_output0.m_output1.visible = False
				m_pfe_cst_mdi_menu_contract.m_file.m_output0.m_output1.toolbaritemvisible = False
				m_pfe_cst_mdi_menu_contract.m_file.m_output0.m_report.visible = False
				m_pfe_cst_mdi_menu_contract.m_file.m_output0.m_report.toolbaritemvisible = False				
				//Hide AutoRefresh/Select/Refreh  	
				m_pfe_cst_mdi_menu_contract.m_file.m_options.m_autorefresh.toolbaritemvisible = False
				m_pfe_cst_mdi_menu_contract.m_file.m_select.toolbaritemvisible = False
				m_pfe_cst_mdi_menu_contract.m_file.m_refresh.toolbaritemvisible = False
				//Batch Alarms //Added By Ken.Guo 03/28/2013
				m_pfe_cst_mdi_menu_contract.m_edit.m_7.toolbaritemvisible = False
			End If
			
			If gw_contract.tab_contract_details.selectedtab = 1 or gw_contract.tab_contract_details.selectedtab = 2 Then
				//New Document Toolbar: Set by License. Document Manager Module
				Choose Case gnv_data.of_getitem( "icred_settings", "set_51", FALSE) 
					Case '3' //Off (Buy)
						m_pfe_cst_mdi_menu_contract.m_edit.m_newdocument.visible = True
						m_pfe_cst_mdi_menu_contract.m_edit.m_newdocument.toolbaritemvisible = True						
						m_pfe_cst_mdi_menu_contract.m_edit.m_newdocument.m_adddoc.visible = True
						m_pfe_cst_mdi_menu_contract.m_edit.m_newdocument.m_adddoc.toolbaritemvisible = True
						m_pfe_cst_mdi_menu_contract.m_edit.m_newdocument.m_createdoc.visible = False
						m_pfe_cst_mdi_menu_contract.m_edit.m_newdocument.m_createdoc.toolbaritemvisible = False		
						//Added By Mark Lee 05/02/12  removed from the system in the contract module
//						m_pfe_cst_mdi_menu_contract.m_edit.m_newdocument.m_fromqueue.visible = True
//						m_pfe_cst_mdi_menu_contract.m_edit.m_newdocument.m_fromqueue.toolbaritemvisible = True
					Case '1'	//On (Buy/Sell)
						m_pfe_cst_mdi_menu_contract.m_edit.m_newdocument.visible = True
						m_pfe_cst_mdi_menu_contract.m_edit.m_newdocument.toolbaritemvisible = True
						m_pfe_cst_mdi_menu_contract.m_edit.m_newdocument.m_adddoc.visible = True
						m_pfe_cst_mdi_menu_contract.m_edit.m_newdocument.m_adddoc.toolbaritemvisible = True
						m_pfe_cst_mdi_menu_contract.m_edit.m_newdocument.m_createdoc.visible = True
						m_pfe_cst_mdi_menu_contract.m_edit.m_newdocument.m_createdoc.toolbaritemvisible = True	
						//Added By Mark Lee 05/02/12  removed from the system in the contract module
//						m_pfe_cst_mdi_menu_contract.m_edit.m_newdocument.m_fromqueue.visible = True
//						m_pfe_cst_mdi_menu_contract.m_edit.m_newdocument.m_fromqueue.toolbaritemvisible = True											
					Case '0' //N/A
						m_pfe_cst_mdi_menu_contract.m_edit.m_newdocument.visible = False
						m_pfe_cst_mdi_menu_contract.m_edit.m_newdocument.toolbaritemvisible = False
						m_pfe_cst_mdi_menu_contract.m_edit.m_newdocument.m_adddoc.visible = False
						m_pfe_cst_mdi_menu_contract.m_edit.m_newdocument.m_adddoc.toolbaritemvisible = False
						m_pfe_cst_mdi_menu_contract.m_edit.m_newdocument.m_createdoc.visible = False
						m_pfe_cst_mdi_menu_contract.m_edit.m_newdocument.m_createdoc.toolbaritemvisible = False		
						//Added By Mark Lee 05/02/12	 removed from the system in the contract module
//						m_pfe_cst_mdi_menu_contract.m_edit.m_newdocument.m_fromqueue.visible = False
//						m_pfe_cst_mdi_menu_contract.m_edit.m_newdocument.m_fromqueue.toolbaritemvisible = False					
				End Choose
				
				//New Document Toolbar: Setting by Roles Painter 
				Choose Case w_mdi.of_security_access( 2150 )
					Case 0 //No Access
						m_pfe_cst_mdi_menu_contract.m_edit.m_newdocument.visible = False
						m_pfe_cst_mdi_menu_contract.m_edit.m_newdocument.toolbaritemvisible = False
						m_pfe_cst_mdi_menu_contract.m_edit.m_newdocument.m_adddoc.visible = False
						m_pfe_cst_mdi_menu_contract.m_edit.m_newdocument.m_adddoc.toolbaritemvisible = False
						m_pfe_cst_mdi_menu_contract.m_edit.m_newdocument.m_createdoc.visible = False
						m_pfe_cst_mdi_menu_contract.m_edit.m_newdocument.m_createdoc.toolbaritemvisible = False			
						//Added By Mark Lee 05/02/12  removed from the system in the contract module
//						m_pfe_cst_mdi_menu_contract.m_edit.m_newdocument.m_fromqueue.visible = False
//						m_pfe_cst_mdi_menu_contract.m_edit.m_newdocument.m_fromqueue.toolbaritemvisible = False					
					Case 1 //Read Only
						m_pfe_cst_mdi_menu_contract.m_edit.m_newdocument.enabled = False
						m_pfe_cst_mdi_menu_contract.m_edit.m_newdocument.m_adddoc.enabled = False
						m_pfe_cst_mdi_menu_contract.m_edit.m_newdocument.m_createdoc.enabled = False
						//Added By Mark Lee 05/02/12  removed from the system in the contract module
//						m_pfe_cst_mdi_menu_contract.m_edit.m_newdocument.m_fromqueue.enabled = False						
					Case 2 //Full Access
						m_pfe_cst_mdi_menu_contract.m_edit.m_newdocument.enabled = True
						m_pfe_cst_mdi_menu_contract.m_edit.m_newdocument.m_adddoc.enabled = True
						m_pfe_cst_mdi_menu_contract.m_edit.m_newdocument.m_createdoc.enabled = True
						//Added By Mark Lee 05/02/12  removed from the system in the contract module
//						m_pfe_cst_mdi_menu_contract.m_edit.m_newdocument.m_fromqueue.enabled = True
				End Choose
				
				//New Document Toolbar - Add Doc: Setting by Roles Painter 
				If w_mdi.of_security_access( 6901 ) < 2 Then
					m_pfe_cst_mdi_menu_contract.m_edit.m_newdocument.m_adddoc.enabled = False
				End If
				
				//New Document Toolbar - Create Doc: Setting by Roles Painter 
				If w_mdi.of_security_access( 6902 ) < 2 Then
					m_pfe_cst_mdi_menu_contract.m_edit.m_newdocument.m_createdoc.enabled = False
				End If
				//Added By Mark Lee 05/02/12  removed from the system in the contract module
//				//New Document Toolbar - Batch Import Queue: Setting by Roles Painter 
//				If w_mdi.of_security_access( 6937 ) < 2 Then
//					m_pfe_cst_mdi_menu_contract.m_edit.m_newdocument.m_fromqueue.enabled = False
//				End If
				
				//Disable Add/Create/Import Toolbar if Contract Main Module is readonly
				If w_mdi.of_security_access( 2070 ) < 2 Then
					m_pfe_cst_mdi_menu_contract.m_edit.m_newdocument.enabled = False
					m_pfe_cst_mdi_menu_contract.m_edit.m_newdocument.m_adddoc.enabled = False
					m_pfe_cst_mdi_menu_contract.m_edit.m_newdocument.m_createdoc.enabled = False
					//Added By Mark Lee 05/02/12  removed from the system in the contract module
//					m_pfe_cst_mdi_menu_contract.m_edit.m_newdocument.m_fromqueue.enabled = False
				End If				
			Else
				//Hide New Document
				m_pfe_cst_mdi_menu_contract.m_edit.m_newdocument.visible = False
				m_pfe_cst_mdi_menu_contract.m_edit.m_newdocument.toolbaritemvisible = False
				m_pfe_cst_mdi_menu_contract.m_edit.m_newdocument.m_adddoc.visible = False
				m_pfe_cst_mdi_menu_contract.m_edit.m_newdocument.m_adddoc.toolbaritemvisible = False
				m_pfe_cst_mdi_menu_contract.m_edit.m_newdocument.m_createdoc.visible = False
				m_pfe_cst_mdi_menu_contract.m_edit.m_newdocument.m_createdoc.toolbaritemvisible = False		
				//Added By Mark Lee 05/02/12  removed from the system in the contract module
//				m_pfe_cst_mdi_menu_contract.m_edit.m_newdocument.m_fromqueue.visible = False
//				m_pfe_cst_mdi_menu_contract.m_edit.m_newdocument.m_fromqueue.toolbaritemvisible = False					
			End If
		End If
		
End Choose

If isvalid(m_pfe_cst_master_menu) Then
	if of_security_access(6979) <> 0 then //Documents Browse
		m_pfe_cst_master_menu.m_file.m_documents.Visible = true
		m_pfe_cst_master_menu.m_file.m_documents.ToolbarItemVisible = true
	else
		m_pfe_cst_master_menu.m_file.m_documents.Visible = false
		m_pfe_cst_master_menu.m_file.m_documents.ToolbarItemVisible = false
	end if
//	If w_mdi.of_security_access( 6987 ) 	= 0 Then //Added By Ken.Guo 03/28/2013. picture painter
//		m_pfe_cst_master_menu.m_system.m_painters.m_picturepainter.visible = False
//	Else
//		m_pfe_cst_master_menu.m_system.m_painters.m_picturepainter.visible = True
//	End If	
	
	//Added By Ken.Guo 08/28/2013
	If of_security_access(6990) = 1 Then
		m_pfe_cst_master_menu.m_help.m_gettingstarted.visible = True
	Else
		m_pfe_cst_master_menu.m_help.m_gettingstarted.visible = False		
	End If
	
	//Added By Mark Lee 02/17/2014
	if of_security_access(6996) = 1 then  //environment check
		m_pfe_cst_master_menu.m_help.m_evncheck.visible = True 
	else
		m_pfe_cst_master_menu.m_help.m_evncheck.visible = False		
	end if 
	
	//Begin - Added By Mark Lee 02/17/2014
	if of_security_access(7001) = 1 then //Preload Contract Folder objects 
		m_pfe_cst_master_menu.m_window.m_preload.visible = True 
	else
		m_pfe_cst_master_menu.m_window.m_preload.visible = False		
	end if 
	
	if of_security_access(7002) = 1 then //Save Contract Folder State
		m_pfe_cst_master_menu.m_window.m_savecontractfolderstate.visible = True 
	else
		m_pfe_cst_master_menu.m_window.m_savecontractfolderstate.visible = False		
	end if 
	//End - Added By Mark Lee 02/17/2014

	//Added By Ken.Guo 03/25/2015
	if of_security_access(7012) = 1 then //Batch Update Contract
		m_pfe_cst_master_menu.m_system.m_batchupdatecontract.visible = True 
	else
		m_pfe_cst_master_menu.m_system.m_batchupdatecontract.visible = False		
	end if 


End If

//Added By Ken.Guo 2011-06-21. 
If isvalid(m_pfe_cst_mdi_menu_contract) Then
	If gnv_data.of_getitem( "icred_settings", "esign", FALSE) = '1' Then
		m_pfe_cst_mdi_menu_contract.m_system.m_refresh_sertifi.visible = True
	Else
		m_pfe_cst_mdi_menu_contract.m_system.m_refresh_sertifi.visible = False
	End If
End IF
end subroutine

public subroutine of_savedwstates ();//====================================================================
// Function: of_SavedwStates()
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  (none)
//--------------------------------------------------------------------
// Author:	Scofield		Date: 2010-04-27
//--------------------------------------------------------------------
//	Copyright (c) 1999-2010 ContractLogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
String	ls_CurDir,ls_PathName,ls_FileName
long		ll_RtnVal
n_getfilename ln_getfilename

GraphicObject	lgo_Obj

lgo_Obj = GetFocus()

if IsNull(lgo_Obj) then Return
if lgo_Obj.Typeof() <> DataWindow! and lgo_Obj.Typeof() <> DataStore! then Return

ls_FileName = lgo_Obj.ClassName()

ls_CurDir = GetCurrentDirectory()
if Right(ls_CurDir,1) <> "\" then ls_CurDir += "\"
ls_PathName = ls_CurDir + ls_FileName

//modified by gavins 20140814
//ll_RtnVal = GetFileSaveName("Save As",ls_PathName,ls_FileName)
ll_RtnVal = ln_getfilename.of_getsavefilename("Save As",ls_PathName,ls_FileName)
if ll_RtnVal = 1 then gf_SaveFullStatusToFile(ls_PathName,lgo_Obj)

ChangeDirectory(ls_CurDir)

end subroutine

public function integer of_showezmenu (boolean ab_show);long ll_width,ll_x //Added By Jay Chen 03-23-2016

If ab_Show Then
	if this.windowstate <> minimized!  then
		dw_ezmenu.Visible = True
		IF Not dw_ezmenu.ib_Dock_Prevent Then st_vsplit.visible = True
		dw_ezmenu.x = this.Workspacex( )
		dw_ezmenu.y = this.workspacey( )
		//
		dw_ezmenu.height = this.workspaceheight() - dw_statusbar.height - 8 //Added by gavins 20130510
		st_vsplit.y = dw_ezmenu.y
		st_vsplit.Height =dw_ezmenu.height
		dw_statusbar.x= dw_ezmenu.x
		dw_statusbar.y = dw_ezmenu.y+ dw_ezmenu.height + 8
		dw_statusbar.width = this.workspaceWidth()
		//
		mdi_1.move( dw_ezmenu.x + dw_ezmenu.width + 12 ,  dw_ezmenu.y )
		mdi_1.resize(this.workspaceWidth() - dw_ezmenu.width - 12, dw_ezmenu.height  + 4 )
		dw_ezmenu.height = dw_ezmenu.height  - 4
		//Added By Jay Chen 03-23-2016
		If isvalid(inv_statusbar) Then
			ll_width = dw_statusbar.width - 700
			ll_x = long(dw_statusbar.describe("Process.x"))
			inv_statusbar.of_modify("process.width=" + string(ll_width) +" ") 
			inv_statusbar.of_modify("text.x=" + string(ll_x + ll_width + 15) +" ")
		end if
		//end
	end if
Else
	if this.windowstate <> minimized!  then
		If dw_ezmenu.Visible Then
			dw_ezmenu.Visible = False
		End If	
		st_vsplit.Visible = False
		mdi_1.move(  this.Workspacex( ) , this.workspacey( )  )
		mdi_1.resize(this.workspaceWidth() ,  this.workspaceheight() - dw_statusbar.height  -  4 )//Added by gavins 20130510
		dw_statusbar.x = this.workspacex( )
		dw_statusbar.y =  mdi_1.y + mdi_1.height + 4
		dw_statusbar.width = this.workspaceWidth() 
		//Added By Jay Chen 03-23-2016
		If isvalid(inv_statusbar) Then
			ll_width = dw_statusbar.width - 700
			ll_x = long(dw_statusbar.describe("Process.x"))
			inv_statusbar.of_modify("process.width=" + string(ll_width) +" ") 
			inv_statusbar.of_modify("text.x=" + string(ll_x + ll_width + 15) +" ")
		end if
		//end
	end if
End If
If IsValid( w_dashboard ) and this.windowstate <> minimized! Then
	w_dashboard.Event  ue_resize( )
End If

Return 0
end function

public subroutine of_showtoolbar (boolean ab_show);//====================================================================
// Function: of_ShowToolbar
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	ab_show
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:	gavin		Date: 2013-03-12
//--------------------------------------------------------------------
//Copyright (c) 2008-2012 Contract Logix, Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
This.Toolbarvisible = ab_show
end subroutine

public subroutine of_refresh_ezmenu_enable ();//
If gb_show_EZMenu Then  dw_ezmenu.of_Refreshenabled( this.menuid )

end subroutine

public subroutine of_set_ezmenu_enabled (string as_parentmenuname, string as_menuname, boolean ab_enabled);//====================================================================
// Function: of_Set_Menu_enabled
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	as_menuname
// 	ab_enabled
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:	gavin		Date: 2013-03-13
//--------------------------------------------------------------------
//Copyright (c) 2008-2012 Contract Logix, Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

If gb_show_EZMenu Then dw_ezmenu.of_SetEnabled( as_parentmenuname, as_menuname, ab_enabled )
end subroutine

public subroutine of_set_ezmenu_visible (string as_parentmenu, string as_menu, boolean ab_value);//
If gb_show_EZMenu Then dw_ezmenu.of_SetVisible( as_parentmenu, as_menu, ab_value )
end subroutine

public subroutine of_set_ezmenu_check (string as_parentmenu, string as_menu, boolean ab_value);If gb_show_EZMenu Then dw_ezmenu.of_Setchecked( as_parentmenu, as_menu, ab_value )
end subroutine

public subroutine of_set_ezmenu_text (string as_parentmenu, string as_menu, string as_text);If gb_show_EZMenu Then dw_ezmenu.of_SetText( as_parentmenu, as_menu, as_text )
end subroutine

public subroutine of_set_ezmenu_pic (string as_parentmenu, string as_menu, string as_pic);If gb_show_EZMenu Then dw_ezmenu.of_Setitemname( as_parentmenu, as_menu, as_pic )
end subroutine

public subroutine of_set_spitbar_visible (boolean ab_visible);st_vsplit.visible = ab_visible
end subroutine

public subroutine of_refresh_ezmenu_screen ();dw_ezmenu.of_set_screen()
end subroutine

public subroutine of_restore_toolbar_attr ();dw_ezmenu.of_restore_toolbar_attr( this.menuid)
end subroutine

public function integer wf_checkisvalidwin (boolean ab_closewin);Window		lw_Temp2,lw_Temp
long			ll_i, ll_count



For ll_i = 1 To UpperBound(gw_popup[])
	If Isvalid(gw_popup[ll_i])  Then
		If gw_popup[ll_i].classname() <> 'w_statusbar' Then 
			ll_count++
			If ab_closewin Then close( gw_popup[ll_i] )
		End If
	End If
Next

lw_Temp = w_mdi.GetFirstSheet( )

do 
	If isvalid( lw_temp ) then	
		lw_Temp2 = w_mdi.Getnextsheet( lw_Temp )
		
		If ab_closewin Then
			close( lw_temp )
		Else
			If lw_temp.classname( ) = 'w_contract'  And Not isvalid(gw_contract) Then 
			Else
				ll_count++
			End If
		End If
		lw_Temp = lw_Temp2
	End If
loop while isvalid( lw_temp )



Return ll_count
end function

on w_mdi.create
int iCurrent
call super::create
if IsValid(this.MenuID) then destroy(this.MenuID)
if this.MenuName = "m_pfe_cst_mdi_menu" then this.MenuID = create m_pfe_cst_mdi_menu
this.dw_statusbar=create dw_statusbar
this.st_vsplit=create st_vsplit
this.dw_ezmenu=create dw_ezmenu
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_statusbar
this.Control[iCurrent+2]=this.st_vsplit
this.Control[iCurrent+3]=this.dw_ezmenu
end on

on w_mdi.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.dw_statusbar)
destroy(this.st_vsplit)
destroy(this.dw_ezmenu)
end on

event activate;call super::activate;//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-07
//$<comment> 03.15.2006 By: Cao YongWang
//$<reason> Performance tuning. 
//$<modification> Comment the following script since of_menu_security has already been  
//$<modification> called in Activate event of the ancestor w_master.
/*
of_menu_security( w_mdi.MenuName )
*/
//---------------------------- APPEON END ----------------------------

w_mdi.of_module_check()


end event

event open;call super::open;integer	i
long		ll_width
string 	ls_path
string 	ls_database
String		ls_Value
long		ll_AppHandle
String		ls_ShowToolBar
String 	ls_ShowMainToolBar
environment	 lenv_obj  //Added By Jay Chen 03-14-2016
long ll_process_width

n_cst_imaging lnv_imaging

GetEnvironment (lenv_obj) //Added By Jay Chen 03-14-2016


//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// <RP>
ib_Unicode = ( lenv_obj.CharSet = CharSetUnicode! )
//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<


ib_ReLogin = gf_get_relogin_status( )//added by gavins 20130515

ib_EZMen_First = True
//ls_Value = gnv_user_option.of_Get_Option_Value( dw_ezmenu.of_get_user( ), 'EZMENU_SHOW' ) //added by gavins 20130312
ls_Value = gnv_user_option.of_Get_Option_Value( gs_user_id, 'EZMENU_SHOW' ) //Added By Jay Chen 07-25-2014
If IsNull( ls_Value ) Then ls_Value = ''
If ls_Value = '' Then 
	gb_show_EZMenu = True
Else
	gb_show_EZMenu = ( ls_Value = '1' )
End If

w_mdi.of_Setup_Security()

w_mdi.of_menu_security( w_mdi.MenuName ) //jervis 05.07.2009

w_mdi.of_module_check()

////\/maha app101705 to allow debug mode to function (set in the inifile aprox 60)
//ls_path = ProfileString(gs_IniFilePathName, "Setup", "refreshrate", "None")
//if isnull(ls_path) or ls_path = "None" then
//	i = 1 
//else
//	i = integer(ls_path)
//end if
i = 3
//\maha


///////////////////////////////////////////////////////////////////////////////
// set the status bar
/////////////////////////////////////////////////////////////////////////////// 
// mskinner 1 aug 2005 - begin
If Not ib_ReLogin Then
	of_SetStatusBar(TRUE)
	inv_statusbar.of_Set_statusbar_dw( dw_statusbar )
//	inv_statusbar.of_Register("Process", "text", "Ready" , 1800) //Added By Ken.Guo 2010-08-19.    1600 
	//Added By Jay Chen 03-14-2016 
	ll_process_width = long(lenv_obj.screenwidth * 5500 / 1366)
	inv_statusbar.of_Register("Process", "text", "Ready" , ll_process_width)  
	//end
	inv_statusbar.of_modify("Process.Color=0" )
	//inv_statusbar.of_modify("Process.Color = ~"33554432~tIf ( Process = 'Ready' , RGB(0,0,0),RGB(255,0,0))~"")//modified by gavins 20130410
	
//	inv_statusbar.of_Register("UserID", "text", "Welcome "+gs_user_id , 700) //Ken.Guo 11/23/2007
//	inv_statusbar.of_Register("UserID", "text", "Welcome "+gs_user_id , long(lenv_obj.screenwidth * 700 / 1366))
	
//	inv_statusbar.of_SetMem(TRUE) //Modified By Jay Chen 03-14-2016
	choose case gs_dbtype
		case 'ASA'
		  ls_database = 'ASA' 
		  ll_width =  200
		case 'SQL'
			ls_database = 'MS SQL Server' 
			ll_width = 450
			
	end choose

	string ls_citrix
	
	//Start Code Change ---- 12.06.2006 #V7 maha
	if upper(appeongetclienttype())  = "WEB" then
		ls_citrix = 'IC Web'
	else
		if gi_citrix = 1 then
			ls_citrix = 'Citrix'
		else 
			ls_citrix = 'Desktop'
		end if 
	end if
	//End Code Change---12.06.2006
	
//	inv_statusbar.of_Register("Citrix", "text", ls_citrix , 200)
//	inv_statusbar.of_Register("Database", "text", space(1)+ 'DB:' + ls_database , ll_width) //Modified By Jay Chen 03-14-2016
	inv_statusbar.of_SetMemThreshold(1048576 * 60 )
	inv_statusbar.of_setrefreshrate( 3 )  // Ken.guo 2011-08-29
	inv_statusbar.of_Register("Text", "text", gnv_app.of_getversion( ) , 3500)//1500 modify by gavins 20130510
	
	//Register imaging OCX - 10.12.2006 By: Zhang XingRen
	// lnv_imaging.of_registry_ocx() //Commented By Ken.Guo 2009-11-13
	//Determine current image OCX - Alfee 05.19.2008
	lnv_imaging.of_get_imageocx() 
	
	//--------------------------- APPEON BEGIN ---------------------------
	//$< Add  > 2008-06-11 By: Scofield
	//$<Reason> Add System Hot Key.
	if AppeonGetClientType() = "PB" then
		ll_AppHandle = Handle(GetApplication())
		
		il_AtomID = GlobalAddAtom(String(ll_AppHandle + 1))
		RegisterHotKey(Handle(This),il_AtomID,0,111 + 11)					//F11
		
		il_AtomdwStates = GlobalAddAtom(String(ll_AppHandle + 2))
		RegisterHotKey(Handle(This),il_AtomdwStates,2,111 + 11)			//Ctrl + F11
	end if
	//---------------------------- APPEON END ----------------------------
End If
	
If gb_show_EZMenu Then//added by gavins 20130312
	ls_ShowToolBar = gnv_user_option.of_Get_Option_value( dw_ezmenu.of_get_user( ), 'EZMENU_SHOWTOOLBAR' )
	If IsNull( ls_ShowToolBar ) Then ls_ShowToolBar = ''
	If ls_ShowToolBar= '' Or ls_ShowToolBar = '1' Then
		of_ShowToolbar( True )
	Else
		of_ShowToolbar( False )
	End If
	ll_width = Long( gnv_user_option.of_get_option_value( gs_user_id, "EZMENU_VERTICALSPLITBAR_LOCATION"  ) )//added by gavins 20130419
	If ll_width = 0 Then ll_width = 1019
	If ll_width > 0 Then st_vsplit.event ue_restore_vsplitbar_location( ll_width )
	ls_value = gnv_user_option.of_get_option_value(gs_user_id, "EZMENU_DOCK_STATUS" )
	If ls_value = '0' Then 
		dw_ezmenu.event ue_dock( '0' )
	Else
		dw_ezmenu.event ue_dock( '1' )
	End If
Else
 	dw_ezmenu.of_set_menu_quick(  This.MenuID )
End If


If ib_ReLogin Then//added by gavins 20130515
	
	of_ShowEZMenu(  gb_show_EZMenu )
End If



//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// <RP> 7.28.2017
// 8.30.2017 - added check for Unicode
//
n_cst_numerical inv_num
this.backColor = dw_ezmenu.COLOR_FRAME_BACKGROUND
this.mdi_1.backColor = dw_ezmenu.COLOR_FRAME_BACKGROUND
// <RP> 8.11.2017 Remove MDI client area border
long ll_winStyle
IF ib_unicode THEN
	ll_winStyle= GetWindowLongW(Handle(mdi_1), GWL_EXSTYLE)
ELSE
	ll_winStyle= GetWindowLongA(Handle(mdi_1), GWL_EXSTYLE)
END IF
ll_winStyle = inv_num.of_bitwiseAND(ll_winStyle, inv_num.of_bitwiseNOT(WS_EX_CLIENTEDGE))
IF ib_unicode THEN
	SetWindowLongW(Handle(mdi_1), GWL_EXSTYLE, ll_winStyle)
ELSE
	SetWindowLongA(Handle(mdi_1), GWL_EXSTYLE, ll_winStyle)
END IF
//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

end event

event pfc_postopen;call super::pfc_postopen;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  [PUBLIC]   : w_mdi::pfc_postopen
//==================================================================================================================
//  Purpose   	: set up xp menu styes
//==================================================================================================================
//  Arguments 	: [none] 
//==================================================================================================================
//  Returns   	: [long]     
//==================================================================================================================
//  Notes     	: 	   
//==================================================================================================================
//  Created By	: Michael Skinner  Wednesday 14 December 2004
//==================================================================================================================
//  Modification Log
//   Changed By             Change Date                                               Reason
// ------------------------------------------------------------------------------------------------------------------
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

string ls_height

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 12.07.2006 By: Davis
//$<reason> The To Do List will display on the MDI Frame after the 
//$<reason> user logs into the system. 

if gb_OpenToDoList then //12/7/2007 By Jervis
	IF of_get_app_setting("set_49","I") = 1 and of_security_access( 5850 ) > 0 and gb_DocQuickView = False THEN
		OpenSheet(w_todolist, w_mdi, 4, original!)
	END IF
END IF
//---------------------------- APPEON END ----------------------------
If Not ib_ReLogin Then
	If isvalid(inv_statusbar) Then //Added if statements By Ken.Guo 2011-03-28
	//	inv_statusbar.of_modify("Process.Font.Weight='700' ")//Process.Color = ~"33554432~tIf ( Process = 'Ready' , RGB(0,0,0),RGB(255,0,0))~""  //modified by gavins 20130410
	//	inv_statusbar.of_modify("Process.Font.Weight=~"700~tIf ( Process  = 'Ready' , 400, 700)~"")
		ls_height = '58' 
	//	if upper(appeongetclienttype())  = "WEB" then ls_height = string( this.height - this.workspacey() - this.workspaceheight() - 18 )//added by gavins 20130426 modify gavins 20130510
//		inv_statusbar.of_modify("Process.Height=" + ls_height + " UserID.Height="+ls_height+" Citrix.Height="+ls_height+" Database.Height="+ls_height+"  Text.Height="+ls_height+" pfc_mem.Height="+ls_height) //add by gavin 2012-01-11
		inv_statusbar.of_modify("Process.Height=" + ls_height +"  Text.Height="+ls_height) //Modified By Jay Chen 03-14-2016 
	//	inv_statusbar.of_modify("Process.Height=56 UserID.Height=56 Citrix.Height=56 Database.Height=56  Text.Height=56 pfc_mem.Height=56 ") //add by gavin 2012-01-11
//		inv_statusbar.of_modify("Process.Border=5 UserID.Border=5 Citrix.Border=5 Database.Border=5  Text.Border=5  ")
		inv_statusbar.of_modify("Process.Border=5 Text.Border=5  ") //Modified By Jay Chen 03-14-2016
	End If
Else
//	If isvalid(inv_statusbar) Then inv_statusbar.of_modify( "UserID", "Welcome "+gs_user_id )
	
End If
Timer(1) //Added by Ken.Guo 08.26.2008 


//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// <RP> 8.10.2017 Status Bar changes
string ls_val
IF dw_statusbar.border THEN
	dw_statusbar.border = FALSE
	IF isValid(inv_statusbar) THEN
		ls_val = inv_statusbar.of_describe("Process", "process.height")
		IF isNumber(ls_val) THEN
			inv_statusbar.of_modify("process.height=" + string(Integer(ls_val) + 4))
			inv_statusbar.of_modify("text.height=" + string(Integer(ls_val) + 4))
		END IF
		inv_statusbar.of_modify("process.y=4")
		inv_statusbar.of_modify("process.Font.Face='Segoe UI'")
		inv_statusbar.of_modify("process.Font.Height=-9")
		inv_statusbar.of_modify("text.y=4")
		ls_val = inv_statusbar.of_describe("Text", "text.width")
		IF isNumber(ls_val) THEN
			inv_statusbar.of_modify("text.width=" + string(Integer(ls_val) - 36) + "")
		END IF
		inv_statusbar.of_modify("text.Font.Face='Segoe UI'")
		inv_statusbar.of_modify("text.Font.Height=-9")
		inv_statusbar.of_modify("process.color='" + string(rgb(96, 96, 96)) + "'")
		inv_statusbar.of_modify("text.color='" + string(rgb(96, 96, 96)) + "'")
		inv_statusbar.of_modify("process.border='0'")
		inv_statusbar.of_modify("text.border='0'")
		
		inv_statusbar.of_modify("datawindow.color='" + string(rgb(247, 247, 247)) + "'")
		// Transparent = 536870912
		inv_statusbar.of_modify("process.background.color='536870912'")
		inv_statusbar.of_modify("text.background.color='536870912'")
	END IF
END IF
//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

end event

event timer;call super::timer;//////////////////////////////////////////////////////////////////////
// $<event>timerw_mdi()
// $<arguments>(None)
// $<returns> long
// $<description>
// $<description>
//////////////////////////////////////////////////////////////////////
// $<add> 08.26.2008 by Ken.Guo
//////////////////////////////////////////////////////////////////////

integer li_session_refresh_time  //Unit: Minute

il_time_seq++  //Second
If il_time_seq >= 72000 Then il_time_seq = 1

//Session Update
li_session_refresh_time = gnv_session.ii_session_refresh_frequency 
If li_session_refresh_time = 0 Then li_session_refresh_time = 3
If Mod(il_time_seq,li_session_refresh_time*60) = 0 Then
	gnv_session.of_update_current_session()
End If

//Dashboard Update


Integer		li_serti, li_approve

/*****************************************************/// add by gavin 2012-01-05 modified by gavins 20130130
li_serti =  Integer( gnv_data.of_GetItem( 'security_users', 'refresh_sertifi_time', 'user_id = "' + gs_user_id + '"' ) )
li_approve = Integer(  gnv_data.of_GetItem( 'security_users', 'refresh_approve_time', 'user_id = "' + gs_user_id + '"' ) )
// Refresh Document Signature Data        
If li_serti <> 0  Then
	If Mod( il_time_seq, li_serti * 60 ) = 0 Then
		If gnv_data.of_getitem( 'icred_settings', 'esign', False) = '1' Then
//			gnv_sertifi.of_refresh_sertifi_status()
//			gnv_echosign.of_refresh_sertifi_status() //Added By Jay Chen 10-16-2013
//			gnv_docusign.ib_ping_server = false //Added By Jay Chen 07-24-2014
//			gnv_docusign.of_refresh_sertifi_status() //Added By Jay Chen 04-15-2014
//			gnv_docusign.ib_ping_server = true
			gnv_app.of_refresh_sign( true)						//Added By Mark Lee 04/03/2015
		End If	
	End If
End If
//Refresh Document Approval Data 
If li_approve <> 0 Then
	If Mod( il_time_seq, li_approve * 60 ) = 0  Then
		gnv_webapprove.of_refresh_status( )
	End If
End If
/*****************************************************/



end event

event close;call super::close;//--------------------------- APPEON BEGIN ---------------------------
//$< Add  > 2008-06-11 By: Scofield
//$<Reason> Unregister Hot Key.

if AppeonGetClientType() = "PB" then
	UnregisterHotKey(Handle(This),il_AtomID)
	GlobalDeleteAtom(il_AtomID)
	
	UnregisterHotKey(Handle(This),il_AtomdwStates)
	GlobalDeleteAtom(il_AtomdwStates)
end if
//---------------------------- APPEON END ----------------------------
gnv_user_option.of_save( )//added by gavins 20130419
end event

event other;call super::other;//--------------------------- APPEON BEGIN ---------------------------
//$< Add  > 2008-06-11 By: Scofield
//$<Reason> Process system hot key.

if il_AtomID > 0 and wParam = il_AtomID then
	if gi_test_mode = 1 or Upper(gs_user_id) = 'MASTER' then  of_GetCurrentObject() //add condition - jervis 05.03.2011
elseif il_AtomdwStates > 0 and wParam = il_AtomdwStates then
	if Upper(gs_user_id) = Upper("master") then
		of_SavedwStates()
	end if
end if
//---------------------------- APPEON END ----------------------------

end event

event resize;call super::resize;If isvalid(w_dashboard) Then
	w_dashboard.Post Event ue_resize()
End If

//added by gavins 20130304
of_ShowEZMenu(  gb_show_EZMenu )



end event

event closequery;//****************************[Not Extend Ancestor Script]****************************//

//BEGIN---Add by Evan 10/29/2008
long ll_Return
long ll_i

if IsValid(w_contract) then
	w_contract.ib_IsMDIClose = true
	Close(w_contract)
	if IsValid(w_contract) then
		w_contract.ib_IsMDIClose = false
		Return 1
	end if
end if

ll_Return = Super::Event CloseQuery()


For ll_i = 1 To UpperBound(gw_popup[])//added by gavins 20130515
	If Isvalid(gw_popup[ll_i])  Then
		If gw_popup[ll_i].classname() <> 'w_statusbar' Then 
		 close( gw_popup[ll_i] )
		End If
	End If
Next

Return ll_Return
//END---Add by Evan 10/29/2008
end event

event pfc_preopen;call super::pfc_preopen;If gb_DocQuickView Then This.Visible = False //Added By Ken.Guo 2010-09-07.


end event

type dw_statusbar from uo_statusbar within w_mdi
integer y = 1732
integer height = 80
integer taborder = 20
string dataobject = "d_mdi_statusbar_ext"
end type

type st_vsplit from statictext within w_mdi
event ue_lbuttonup pbm_lbuttonup
event ue_lbuttondown pbm_lbuttondown
event ue_mousemove pbm_mousemove
event ue_restore_vsplitbar_location ( integer ai_x )
integer x = 1019
integer width = 18
integer height = 1724
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string pointer = "SizeWE!"
long textcolor = 33554432
long backcolor = 8421504
boolean focusrectangle = false
end type

event ue_lbuttonup;Long		ll_Width, ll_TempW

ib_Drag = False
if  dw_ezmenu.Width + ii_offsetX > il_Original_EZMenuWidth then
	ll_Width = il_Original_EZMenuWidth
Else
	ll_Width =  dw_ezmenu.Width + ii_offsetX
end if	
if dw_ezmenu.Width + ii_offsetX < 120 Then
	ll_Width = 120
End If

ll_TempW = ll_Width + dw_ezmenu.x
If ll_TempW < 730 Then ll_TempW = 730

dw_ezmenu.modify( "p_titlebar.width = " + string ( ll_TempW - 8 ) +" t_title.width="+ string( ll_TempW - ( 1019 - 516 ) )+ &
	" items.width = " + string( ll_TempW - ( 1019 - 690 ) ) + " itempic.width = " + string( ll_TempW - ( 1019 - 930 ) ) + " l_split1.x2 = " + &
	string( ll_TempW - ( 1019 - 882 ) ) + " l_split2.X2 = " + string( ll_TempW - ( 1019 - 882 ) ) + " t_painter.x = " + string( ll_TempW - ( 1019 - 654 ) ) + &
	" t_refresh.x = " + string( ll_TempW - ( 1019 - 745 ) ) + " t_contract.x = " + string ( ll_TempW - ( 1019 - 846 ) ) )


//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// <RP> 8.8.2017
string ls_val, ls_ret
ls_val = dw_ezmenu.describe("itempic.width")
IF isNumber(ls_val) THEN
	ls_ret = dw_ezmenu.modify("t_items_bg.width=" + ls_val)
	ls_ret = dw_ezmenu.modify("p_titlebar.width=" + ls_val)
END IF
//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<


 dw_ezmenu.width = ll_Width
dw_ezmenu.ii_Width = ll_Width	

this.x=dw_ezmenu.x + dw_ezmenu.width

this.SetPosition(ToTop!)
this.backcolor = 78682240

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// <RP> 8.11.2017
//this.backColor = dw_ezmenu.COLOR_FRAME_BACKGROUND
//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<


dw_ezmenu.of_Resizemdi( )
//mdi_1.move( dw_ezmenu.x + dw_ezmenu.width + 12 ,  dw_ezmenu.y )
//mdi_1.resize(parent.workspaceWidth() - dw_ezmenu.width - 12, dw_ezmenu.height )

ii_LastX = This.X

gnv_user_option.of_Set_option_value(gs_user_id, "EZMENU_VERTICALSPLITBAR_LOCATION", string( ii_LastX ) )



end event

event ue_lbuttondown;//
This.backcolor = 12250607
ib_Drag = True

end event

event ue_mousemove;//
If Not KeyDown(keyLeftButton!) Then
	Return
End If

If ib_Drag Then
	
	If This.X + xpos > il_Original_EZMenuWidth Then 
		This.X = il_Original_EZMenuWidth
	Else
		This.X = This.X + xpos
	End If
	ii_offsetX =  This.X - ii_LastX
End If
end event

event ue_restore_vsplitbar_location(integer ai_x);//
Long		ll_x

ll_X = this.x

If dw_ezmenu.ib_dock_prevent then ll_x = dw_ezmenu.x + dw_ezmenu.Width 


ii_offsetX = ai_x - ll_X

event ue_lbuttonup( 0, 0 , 0 )
end event

event constructor;this.SetPosition(ToTop!)
this.backcolor = 78682240
il_Original_EZMenuWidth = dw_ezmenu.width * 3
ii_LastX = This.X

end event

event getfocus;window 	lw_parent

//Check for microhelp requirements.
If gnv_app.of_GetMicrohelp() Then
	If IsValid(w_mdi) Then
		w_mdi.Dynamic Event pfc_ControlGotFocus (this)
	End If
End If

end event

type dw_ezmenu from uo_listbar within w_mdi
integer height = 1728
integer taborder = 10
end type

