$PBExportHeader$w_weblink_settings.srw
forward
global type w_weblink_settings from w_response
end type
type cb_default from commandbutton within w_weblink_settings
end type
type cb_1 from commandbutton within w_weblink_settings
end type
type st_1 from statictext within w_weblink_settings
end type
type dw_weblink from u_dw within w_weblink_settings
end type
type cb_ok from commandbutton within w_weblink_settings
end type
type cb_cancel from commandbutton within w_weblink_settings
end type
end forward

global type w_weblink_settings from w_response
integer x = 214
integer y = 221
integer width = 2377
integer height = 1164
string title = "Web Link Settings"
event sys_command pbm_syscommand
cb_default cb_default
cb_1 cb_1
st_1 st_1
dw_weblink dw_weblink
cb_ok cb_ok
cb_cancel cb_cancel
end type
global w_weblink_settings w_weblink_settings

type variables
String 		is_time_option = "00:00", is_time_settings_ori = "100000000000000000000000000000000000000000000000"
end variables

event sys_command;
If message.wordparm = 61536 Then
	If ib_disableclosequery Then
		MessageBox( this.title, 'Detecting mail, please wait.' )
		Return
	End If
//	cb_cancel.Trigger Event Clicked()
End If

end event

on w_weblink_settings.create
int iCurrent
call super::create
this.cb_default=create cb_default
this.cb_1=create cb_1
this.st_1=create st_1
this.dw_weblink=create dw_weblink
this.cb_ok=create cb_ok
this.cb_cancel=create cb_cancel
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_default
this.Control[iCurrent+2]=this.cb_1
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.dw_weblink
this.Control[iCurrent+5]=this.cb_ok
this.Control[iCurrent+6]=this.cb_cancel
end on

on w_weblink_settings.destroy
call super::destroy
destroy(this.cb_default)
destroy(this.cb_1)
destroy(this.st_1)
destroy(this.dw_weblink)
destroy(this.cb_ok)
destroy(this.cb_cancel)
end on

event open;call super::open;//////////////////////////////////////////////////////////////////////
// $<event>w_weblink_settings::open()
// $<arguments>(None)
// $<returns> long
// $<description>
// $<description>
//////////////////////////////////////////////////////////////////////
// $<add> 2009-03-31 by Ken.Guo
//////////////////////////////////////////////////////////////////////

String ls_ie_url,ls_web_link, ls_autoalarm, ls_User

dw_weblink.SetTransObject(SQLCA)
dw_weblink.Retrieve()
This.of_setalwaysvalidate( True)

If dw_weblink.GetItemString(1,'web_link_name') = '' &
	Or Isnull(dw_weblink.GetItemString(1,'web_link_name')) Then
		ls_ie_url = AppeonGetIEURL()
		If left(lower(ls_ie_url),7) = 'http://' Then
			ls_ie_url = 'http://' + Mid(ls_ie_url,8,len(ls_ie_url))
		ElseIf left(lower(ls_ie_url),8) = 'https://' Then
			ls_ie_url = 'https://' + Mid(ls_ie_url,9,len(ls_ie_url))
		End If
		If ls_ie_url <> '' Then
			ls_ie_url = Mid(ls_ie_url,1,Len(ls_ie_url) - 1) //Cut last '/'
			ls_web_link = Mid(ls_ie_url,1,LastPos(ls_ie_url,'/')) //Cut application root name
			ls_web_link = ls_web_link + 'fileservice/'
			dw_weblink.SetItem(1,'web_link_name',ls_web_link)
		End If
End If

If dw_weblink.GetItemString(1,'cache_name') = '' &
	Or Isnull(dw_weblink.GetItemString(1,'cache_name')) Then
		//Added By Mark Lee 03/12/2014
		if not isnull(gs_cachename) and trim(gs_cachename) <> "" then 
			dw_weblink.SetItem(1,'cache_name',gs_cachename)
			dw_weblink.modify("cache_name.protect=1 cache_name.background.color='553648127' ")
			Update icred_settings Set cache_name = :gs_cachename Using Sqlca;
			gnv_data.of_retrieve( "icred_settings")
		else
			dw_weblink.modify("cache_name.protect=0 cache_name.background.color='1073741824' ")
		end if 
else
	dw_weblink.modify("cache_name.protect=1 cache_name.background.color='553648127' ")		
End If

ls_autoalarm = gnv_user_option.of_get_viewid_option_value( 1001, 'WEBLINK_SETAUTOALARM_VALUE' , FALSE )
If isnull( ls_autoalarm ) Or Trim( ls_autoalarm ) = '' Then ls_autoalarm = '0'
dw_weblink.SetItem( 1, 'setautoalarm', ls_autoalarm )

if ls_autoalarm = '1' Then //Added By Jay 2016-07-26
	dw_weblink.Modify ( "b_trigger_time.Enabled = true" )
Else
	dw_weblink.Modify ( "b_trigger_time.Enabled = false" )
End If

If ls_autoalarm = '1' Then
	ls_User = gnv_user_option.of_get_viewid_option_value( 1001, 'WEBLINK_SETAUTOALARM_USER_VALUE' , FALSE )
	dw_weblink.SetItem( 1, 'users', ls_User )
End If

dw_weblink.SetItemStatus(1,0,Primary!,NotModified!)

//Added By Mark Lee 04/01/2015
string 	ls_message
ls_message = Message.StringParm
if not isnull(ls_message) and ls_message = 'intelliset5saas' then 
	cb_default.event clicked( )
	cb_ok.event clicked( )
	cb_cancel.event clicked( )
end if 
end event

event close;//Override ancestor script
end event

event pfc_updateprep;call super::pfc_updateprep;string 	ls_User
n_cst_webapi ln_api
dwItemStatus ldws_Status,ldws_Status2
long ll_cnt,ll_rtn, ll_Count

dw_weblink.AcceptText( )

If dw_weblink.ModifiedCount( ) = 0  Then Return 1

ldws_Status = dw_weblink.GetItemStatus( dw_weblink.getrow( ), 'setautoalarm', primary! ) //modified by gavins 20140709
ldws_Status2 = 	dw_weblink.GetItemStatus( dw_weblink.getrow( ), 'users', primary! )
If dw_weblink.update() = 1 Then//modified by gavins 20140627
	Commit;
	gnv_data.of_retrieve( "icred_settings")
Else
	Rollback;
	Messagebox('Save Error','Failed to save data, please call support.')
	Return -1
End If

//added by gavins 20131222
If ldws_Status= DataModified! Or ldws_Status2 = DataModified! Then
	If dw_weblink.GetItemString( dw_weblink.getrow( ), 'setautoalarm' ) = '1' Then
		ls_User = dw_weblink.GetItemString( dw_weblink.GetRow( ), 'users' ) 
		If IsNull( ls_User ) Or Trim( ls_User ) = '' Then
			MessageBox( Title, 'Please enter the sender.' )
			Return -1
		End If
		n_cst_easymail_smtp   ln_smtp
		ib_disableclosequery = true
		//Added By Jay Chen 12-31-2015
		SELECT count(*) into :ll_cnt FROM em_mail_audit WHERE mail_from = :ls_User AND compute_info LIKE '%by webserver%' 
		AND send_result = 0 AND datediff(minute,mail_date,getdate()) <= 30;
		if isnull(ll_cnt) then ll_cnt = 0
		if ll_cnt = 0 then
			if MessageBox("Test Email Account","Are you sure you want to test the sender's email account? ",Question!,YesNo!,2) = 1 then 
				OpenWithParm(w_email_account_edit, "ALL|" + ls_User)
				SELECT count(*) into :ll_cnt FROM em_mail_audit WHERE mail_from = :ls_User AND compute_info LIKE '%by webserver%' 
				AND send_result = 0 AND datediff(minute,mail_date,getdate()) <= 30;
				if isnull(ll_cnt) then ll_cnt = 0
				if ll_cnt = 0 then
					ib_disableclosequery = false
					//return -1 //Commented By Ken.Guo 2016-07-28. should always run below code 'ln_api.of_setautoalarm( false, ls_User,is_time_option )'
				end if
			end if
		end if
		//end
//		If Not ln_smtp.of_pingserver( ls_User ) Then
//			ib_disableclosequery = false
//			Messagebox('Email Alarm','Failed to connect to the Email Server.~r~n Please check the Email Account of user(s) "' + ls_User + '".')
//			return -1
//		End If
		If IsNull( is_time_option ) Or Trim( is_time_option) = '' Or is_time_option = '0:00' Then is_time_option = '00:00'
		ib_disableclosequery = false
		If ln_api.of_setautoalarm( true, ls_User,is_time_option )	=  0 Then
			gnv_user_option.of_set_viewid_option_value( 1001, 'WEBLINK_SETAUTOALARM_VALUE' ,'1' )
			gnv_user_option.of_set_viewid_option_value( 1001, 'WEBLINK_SETAUTOALARM_USER_VALUE' , ls_User )
			//save to datebase  time settings  //added by gavins 20160729
			SELECT count(1) INTO :ll_Count FROM wf_trigger_time_settings WHERE ID = 1;
	
			If ll_Count > 0 Then
				UPDATE wf_trigger_time_settings SET times_setting = :is_time_settings_ori, time_option = :is_time_option WHERE ID = 1;
			Else
				INSERT INTO wf_trigger_time_settings ( ID, times_setting, time_option )
				VALUES ( 1, :is_time_settings_ori, :is_time_option );
			End If
		End If	
	Else
		
		gnv_user_option.of_set_viewid_option_value( 1001, 'WEBLINK_SETAUTOALARM_VALUE' ,'0' )
		ln_api.of_setautoalarm( false, ls_User,is_time_option )
		 
      	update wf_trigger_time_settings set time_option = '00:00' , times_setting='100000000000000000000000000000000000000000000000';//added by gavins 20160725
	End If
	gnv_user_option.of_viewid_save( )
End If

Return 1
end event

event closequery;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  closequery
//
//	Description:
//	Search for unsaved datawindows prompting the user if any
//	pending updates are found.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0   Initial version
// 6.0	Enhanced control on what objects are to be updated.
// 6.0.01 Make sure the window is not minimized and behind other windows.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

Constant Integer	ALLOW_CLOSE = 0
Constant Integer	PREVENT_CLOSE = 1

Integer	li_msg
Integer	li_rc
String	ls_msgparms[]
Powerobject lpo_updatearray[]

// Check if the CloseQuery process has been disabled
If ib_disableclosequery Then
	Return PREVENT_CLOSE
End If

// Call event to perform any pre-CloseQuery processing
If This.Event pfc_preclose ( ) <> 1 Then
	// Prevent the window from closing
	Return PREVENT_CLOSE 
End If

// Prevent validation error messages from appearing while the window is closing
// and allow others to check if the  CloseQuery process is in progress
ib_closestatus = True

// Determine the objects for which an update will be attempted.
// For the CloseQuery, the order sequence is as follows: 
//		1) Specified permananent sequence (thru of_SetUpdateObjects(...)).
//		2) None was specified, so use default window control array.
If UpperBound(ipo_updateobjects) > 0 Then
	lpo_updatearray = ipo_updateobjects
Else
	lpo_updatearray = This.Control		
End If

// Check for any pending updates
li_rc = of_UpdateChecks(lpo_updatearray)
If li_rc = 0 Then
	// Updates are NOT pending, allow the window to be closed.
	ib_closestatus = False
	Return ALLOW_CLOSE
ElseIf li_rc < 0 Then
	// Make sure the window is not minimized and behind other windows.
	If this.WindowState = Minimized! Then
		this.WindowState = Normal!
	End If
	this.BringToTop = True

	// There are Updates pending, but at least one data entry error was found.
	// Give the user an opportunity to close the window without saving changes
	If IsValid(gnv_app.inv_error) Then
		li_msg = gnv_app.inv_error.of_Message('pfc_closequery_failsvalidation', &
					 ls_msgparms, gnv_app.iapp_object.DisplayName)
	Else
		li_msg = of_MessageBox ("pfc_master_closequery_failsvalidation", &
					gnv_app.iapp_object.DisplayName, &
					"The information entered does not pass validation and "  + &
					"must be corrected before changes can be saved.~r~n~r~n" + &
					"Close without saving changes?", &
					exclamation!, YesNo!, 2)
	End If
	If li_msg = 1 Then
		ib_closestatus = False
		Return ALLOW_CLOSE
	End If
Else
	// Make sure the window is not minimized and behind other windows.
	If this.WindowState = Minimized! Then
		this.WindowState = Normal!
	End If	
	this.BringToTop = True
	
	// Changes are pending, prompt the user to determine if they should be saved
	If IsValid(gnv_app.inv_error) Then
		li_msg = gnv_app.inv_error.of_Message('pfc_closequery_savechanges',  &
					ls_msgparms, gnv_app.iapp_object.DisplayName)		
	Else
		li_msg = of_MessageBox ("pfc_master_closequery_savechanges", &
					gnv_app.iapp_object.DisplayName, &
					"Do you want to save changes?", exclamation!, YesNoCancel!, 1)
	End If
	Choose Case li_msg
		Case 1
			// YES - Update
			// If the update fails, prevent the window from closing
			If This.Event pfc_save() >= 1 Then
				// Successful update, allow the window to be closed
				ib_closestatus = False
				Return ALLOW_CLOSE
			End If
		Case 2
			// NO - Allow the window to be closed without saving changes
			ib_closestatus = False
			Return ALLOW_CLOSE
		Case 3
			// CANCEL -  Prevent the window from closing
	End Choose
End If

// Prevent the window from closing
ib_closestatus = False
Return PREVENT_CLOSE
end event

type cb_default from commandbutton within w_weblink_settings
integer x = 1230
integer y = 952
integer width = 343
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Default"
end type

event clicked;String ls_ie_url,ls_web_link, ls_ctx_web_link

ls_ie_url = AppeonGetIEURL()
If left(lower(ls_ie_url),7) = 'http://' Then
	ls_ie_url = 'http://' + Mid(ls_ie_url,8,len(ls_ie_url))
ElseIf left(lower(ls_ie_url),8) = 'https://' Then
	ls_ie_url = 'https://' + Mid(ls_ie_url,9,len(ls_ie_url))	
End If
If ls_ie_url <> '' Then
	ls_ie_url = Mid(ls_ie_url,1,Len(ls_ie_url) - 1) //Cut last '/'
	ls_web_link = Mid(ls_ie_url,1,LastPos(ls_ie_url,'/')) //Cut application root name
	ls_ctx_web_link = ls_web_link
	ls_web_link = ls_web_link + 'fileservice/'
	dw_weblink.SetItem(1,'web_link_name',ls_web_link)
End If

dw_weblink.SetItem(1,'cache_name',gs_cachename)
//Added By Mark Lee 03/12/2014
if not isnull(gs_cachename) and trim(gs_cachename) <> "" then 
	dw_weblink.modify("cache_name.protect=1 cache_name.background.color='553648127' ")
else
	dw_weblink.modify("cache_name.protect=0 cache_name.background.color='1073741824' ")
end if 

dw_weblink.SetItem( 1, 'setautoalarm', '0' )
//Replace fields in the document
if AppeonGetClientType() = "WEB" then
	ls_ctx_web_link = ls_ctx_web_link + "ContractlogixWeb/"
//	//Added By Ken.Guo 07/02/2014
//	If lower(left(ls_ctx_web_link,5)) = 'https' Then
//		ls_ctx_web_link = 'http' + Mid(ls_ctx_web_link, 6)
//	End If
	dw_weblink.SetItem(1,'ctx_web_link',ls_ctx_web_link)
end if
end event

type cb_1 from commandbutton within w_weblink_settings
boolean visible = false
integer x = 50
integer y = 960
integer width = 343
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Ping"
end type

event clicked;String ls_cachename,ls_link,ls_Null
int li_pos
n_tr TR_WEBLINK

SetNull(ls_Null)
This.enabled = False
dw_weblink.Accepttext()
TR_WEBLINK = Create n_tr

//ping database
ls_link = Trim(dw_weblink.GetItemString(1,'web_link_name'))
ls_cachename = Trim(dw_weblink.GetItemString(1,'cache_name'))
TR_WEBLINK.AutoCommit = True
TR_WEBLINK.DBMS = 'ODB-MSS'
TR_WEBLINK.DBParm = "CacheName='" + ls_cachename + "'"
Connect USING TR_WEBLINK;
IF TR_WEBLINK.SQLCODE = -1 THEN
	//Added By Mark Lee 03/12/2014
	dw_weblink.modify("cache_name.protect=0 cache_name.background.color='1073741824' ")
	MessageBox("Error", "Failed to connect the database '" +ls_cachename+ "'")
	This.enabled = True
	Destroy TR_WEBLINK
	Return -1
END IF
DisConnect USING TR_WEBLINK;

//ping web link
If Right(ls_link,1) = '/' Then
	ls_link += 'ping.htm'
Else
	ls_link += '/ping.htm'	 
End If
ShellExecuteA ( Handle( This ), "open", 'IEXPLORE', ls_link , ls_Null, 4)	

Sleep ( 3 )
//ping contractlogix link			//Added By Mark Lee 09/04/2013
ls_link = Trim(dw_weblink.GetItemString(1,'ctx_web_link'))
If Right(ls_link,1) = '/' Then
	ls_link += 'ping.htm'
Else
	ls_link += '/ping.htm'	 
End If
ShellExecuteA ( Handle( This ), "open", 'IEXPLORE', ls_link , ls_Null, 4)	

This.enabled = True
Destroy TR_WEBLINK
end event

type st_1 from statictext within w_weblink_settings
boolean visible = false
integer x = 87
integer y = 676
integer width = 1797
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Attention: Web Link Settings will use default value if it don~'t fill data."
boolean focusrectangle = false
end type

type dw_weblink from u_dw within w_weblink_settings
integer x = 14
integer y = 12
integer width = 2313
integer height = 940
integer taborder = 10
string dataobject = "d_weblink_settings"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
borderstyle borderstyle = stylebox!
end type

event constructor;call super::constructor;This.of_setupdateable( True)

end event

event pfc_validation;call super::pfc_validation;//////////////////////////////////////////////////////////////////////
// $<event>dw_weblink::pfc_validation()
// $<arguments>(None)
// $<returns> integer
// $<description>
// $<description>
//////////////////////////////////////////////////////////////////////
// $<add> 2009-03-30 by Ken.Guo
//////////////////////////////////////////////////////////////////////

String ls_weblink_name
This.AcceptText()
ls_weblink_name = dw_weblink.GetItemString(1,'web_link_name')

If ls_weblink_name =  '' Or Isnull(ls_weblink_name) Then Return 1
If Left(trim( Lower( ls_weblink_name )),4) <> 'http' Then
	Return -1
End If
Return 1
end event

event clicked;call super::clicked;String ls_cachename,ls_link,ls_Null
int li_pos
n_tr TR_WEBLINK
String  ls_user , ls_message

if row <= 0 then return 

dw_weblink.Accepttext()
			
choose case dwo.name
		case "b_ctx_web_link"
			
//			//Added By Ken.Guo 07/02/2014
//			If Lower(Left(dw_weblink.GetItemString(1,'ctx_web_link'),5 )) = 'https' Then
//				Messagebox( Parent.title,'https is not support for ContractlogixWeb link. Please change it to http.')
//				dw_weblink.Setcolumn('ctx_web_link')
//				dw_weblink.Setfocus()
//				Return 1
//			End If			
		
			SetNull(ls_Null)
			ls_link = Trim(dw_weblink.GetItemString(1,'ctx_web_link'))
			
			//ping web link
			If Right(ls_link,1) = '/' Then
			ls_link += 'ping.htm'
			Else
			ls_link += '/ping.htm'	 
			End If
			ShellExecuteA ( Handle( This ), "open", 'IEXPLORE', ls_link , ls_Null, 4)	

		case "b_web_link_name"
			SetNull(ls_Null)
			//ping contractlogix link			//Added By Mark Lee 09/04/2013
			ls_link = Trim(dw_weblink.GetItemString(1,'web_link_name'))
			If Right(ls_link,1) = '/' Then
			ls_link += 'ping.htm'
			Else
			ls_link += '/ping.htm'	 
			End If
			ShellExecuteA ( Handle( This ), "open", 'IEXPLORE', ls_link , ls_Null, 4)	
		case "b_cache_name"
			TR_WEBLINK = Create n_tr
			
			//ping database

			ls_cachename = Trim(dw_weblink.GetItemString(1,'cache_name'))
			TR_WEBLINK.AutoCommit = True
			TR_WEBLINK.DBMS = 'ODB-MSS'
			TR_WEBLINK.DBParm = "CacheName='" + ls_cachename + "'"
			Connect USING TR_WEBLINK;
			IF TR_WEBLINK.SQLCODE = -1 THEN
				//Added By Mark Lee 03/12/2014
				dw_weblink.modify("cache_name.protect=0 cache_name.background.color='1073741824' ")
				MessageBox("Error", "Failed to connect the database '" +ls_cachename+ "'")
				Destroy TR_WEBLINK
				Return -1
			else
				//Added By Mark Lee 03/12/2014
				dw_weblink.modify("cache_name.protect=1 cache_name.background.color='553648127' ")
				messagebox(gnv_app.iapp_object.DisplayName,"The ping is successful.")
			END IF
			DisConnect USING TR_WEBLINK;
			Destroy TR_WEBLINK
			
//		case 'b_trigger_time' //Added By Jay 2016-07-21   //Commented By Jay 2016-07-26  move to buttonclicked()
			
////			ls_user = GetItemString ( row, 'users' )
////			If IsNull ( ls_User ) OR Trim ( ls_User ) = '' Then
////				MessageBox( Parent.Title, 'Please enter a valid user.' )
////				Return
////			End If
//			OpenWithParm ( w_triggertimes_settings, ls_user )
//			
//			ls_message = Message.StringParm
//			If Left ( ls_message, 1 ) = "A" Then
//				is_time_option = Mid (ls_message, 2)
//				dw_weblink.SetItemStatus( dw_weblink.GetRow( ), 'setautoalarm', Primary!, DataModified! )
//
//			End If


end choose 
end event

event itemchanged;call super::itemchanged;If row > 0 And dwo.Name = 'users' Then
	datawindowchild			ldwc_child
	Integer						li_FR
	
	If getchild( 'users', ldwc_child ) = 1 Then
		li_FR = ldwc_child.find( "lower(user_id) = '" + trim(lower(data)) + "'", 1, ldwc_child.Rowcount( ) )
		If li_FR <= 0 Then
			MessageBox( Parent.Title, 'Please enter a valid user.' )
			setItem(row, 'users', '' )
			Return 2
		Else
			SetItem( row, 'users', ldwc_Child.GetItemString( li_Fr, 'user_id' ) )
			SetText(  ldwc_Child.GetItemString( li_Fr, 'user_id' ) )
			Return 2
		End If	
	End If	
End If

If row > 0 And dwo.Name = 'setautoalarm' Then //Added By Jay 2016-07-26
	if string ( data ) = '1' Then 
		dw_weblink.Modify ( "b_trigger_time.Enabled = true" )
	Else
		dw_weblink.Modify ( "b_trigger_time.Enabled = false" )
	End If
	
End If
end event

event pfc_update;call super::pfc_update;
gnv_data.of_retrieve( "icred_settings")
return 1
end event

event buttonclicked;call super::buttonclicked;
String  ls_message
Integer	li_Pos

if row <= 0 then return 

dw_weblink.Accepttext()
			
choose case dwo.name		
			
		case 'b_trigger_time' //Added By Jay 2016-07-21			
			
			If is_time_option = "00:00" Then 
				Open ( w_triggertimes_settings  )
			Else
				Openwithparm ( w_triggertimes_settings , "A" + is_time_option + "-" + is_time_settings_ori )
			End If
			
			ls_message = Message.StringParm
			If Left ( ls_message, 1 ) = "A" Then
				li_Pos = Pos( ls_Message, '-' )
				is_time_option = Mid (ls_message, 2, li_Pos - 2)
				is_time_settings_ori = Mid( ls_message, li_Pos+1 )
				dw_weblink.SetItemStatus( dw_weblink.GetRow( ), 'setautoalarm', Primary!, DataModified! )
			End If 

end choose 
end event

type cb_ok from commandbutton within w_weblink_settings
integer x = 1614
integer y = 952
integer width = 343
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&OK"
boolean default = true
end type

event clicked;
//modidfied by gavins 20131226
//If dw_weblink.update() = 1 Then
//	Commit;
//	gnv_data.of_retrieve( "icred_settings")
//Else
//	Rollback;
//	Messagebox('Save Error','Failed to save data, please call support.')
//	Return -1
//End If
//

If ib_disableclosequery Then
	MessageBox( Parent.title, 'Detecting mail, please wait.' )
	Return
End If

dw_weblink.Accepttext( )

////Added By Ken.Guo 07/02/2014					//Added By Mark Lee 02/27/2015 the system can be use the https mode.
//If Lower(Left(dw_weblink.GetItemString(1,'ctx_web_link'),5 )) = 'https' Then
//	Messagebox( Parent.title,'https is not support for ContractlogixWeb link. Please change it to http.')
//	dw_weblink.Setcolumn('ctx_web_link')
//	dw_weblink.Setfocus()
//	Return -1
//End If


if dw_weblink.Modifiedcount( ) > 0  Then
	If event pfc_save( ) <> 1 Then Return	
End If

Close(Parent)
Return 1
end event

type cb_cancel from commandbutton within w_weblink_settings
integer x = 1989
integer y = 952
integer width = 343
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Cancel"
boolean cancel = true
end type

event clicked;If ib_disableclosequery Then
	MessageBox( Parent.title, 'Detecting mail, please wait.' )
	Return
End If

Close(Parent)
end event

