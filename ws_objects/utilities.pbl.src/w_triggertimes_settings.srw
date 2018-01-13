$PBExportHeader$w_triggertimes_settings.srw
forward
global type w_triggertimes_settings from window
end type
type cb_1 from commandbutton within w_triggertimes_settings
end type
type cb_2 from commandbutton within w_triggertimes_settings
end type
type dw_1 from datawindow within w_triggertimes_settings
end type
type gb_1 from groupbox within w_triggertimes_settings
end type
end forward

global type w_triggertimes_settings from window
integer width = 2286
integer height = 1076
boolean titlebar = true
string title = "Auto Alarm Trigger Time Settings"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
boolean center = true
cb_1 cb_1
cb_2 cb_2
dw_1 dw_1
gb_1 gb_1
end type
global w_triggertimes_settings w_triggertimes_settings

type variables
String 	is_time_settings_ori  //old setting
String 	is_teme_option_ori
String 	is_user
end variables

on w_triggertimes_settings.create
this.cb_1=create cb_1
this.cb_2=create cb_2
this.dw_1=create dw_1
this.gb_1=create gb_1
this.Control[]={this.cb_1,&
this.cb_2,&
this.dw_1,&
this.gb_1}
end on

on w_triggertimes_settings.destroy
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.dw_1)
destroy(this.gb_1)
end on

event open;string 	ls_value, ls_time, ls_Message
Long 		ll_i, ll_Len, li_Pos
String 	ls_user


ls_Message = Message.StringParm
//If Len ( ls_user ) > 0 Then
//	is_user = ls_user
//End If
//added by gavins 20160729
li_Pos = Pos( ls_Message, '-' )
is_teme_option_ori = Mid (ls_message, 2, li_Pos - 2)
is_time_settings_ori = Mid( ls_message, li_Pos+1 )


//Added By Jay 2016-07-22
//$<Reason> Add an automated scheduler to trigger work flow and alarms. 
//gnv_appeondb.of_startqueue( )
If Len( is_teme_option_ori  ) = 0 Then
			
	SELECT times_setting, time_option INTO :ls_value, :is_teme_option_ori 
	FROM wf_trigger_time_settings where id = 1;
	
	If IsNull ( ls_value ) Or Trim ( ls_value ) = "" Then	
		ls_value = "000000000000000000000000000000000000000000000000"	
	End If
	
	If IsNull ( is_teme_option_ori ) Or Trim ( is_teme_option_ori ) = "" Then	
		is_teme_option_ori = ""	
	End If

	//gnv_appeondb.of_commitqueue( )
	is_time_settings_ori = ls_value
Else
	ls_value = is_time_settings_ori
End If



ll_Len = Len ( ls_value )	
If dw_1.GetRow() > 0  and ll_Len = 48 Then
	For ll_I = 1 To ll_Len
		ls_time = Mid ( ls_value, ll_I, 1 )
		dw_1.SetItem ( 1, 'time' + string ( ll_I ), ls_time )
	Next
End If

gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17

end event

event closequery;cb_2.Event Clicked( )
end event

type cb_1 from commandbutton within w_triggertimes_settings
boolean visible = false
integer x = 1577
integer y = 860
integer width = 302
integer height = 88
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "Save"
end type

event clicked;//====================================================================
// Event: clicked
//--------------------------------------------------------------------
// Description: automated scheduler to trigger work flow and alarms.
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	Jay		Date: 2016-07-21
//--------------------------------------------------------------------
//	Copyright (c) 2008-2013 Contractlogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

If Not dw_1.RowCount () > 0 Then Return

Long 		ll_I, ll_Count
String 	ls_times, ls_time_option, ls_temp
string 	ls_time_arr[] = {'00:00','00:30','01:00','01:30','02:00','02:30','03:00','03:30','04:00','04:30','05:00','05:30',&
								  '06:00','06:30','07:00','07:30','08:00','08:30','09:00','09:30','10:00','10:30','11:00','11:30',&
								  '12:00','12:30','13:00','13:30','14:00','14:30','15:00','15:30','16:00','16:30','17:00','17:30',&
								  '18:00','18:30','19:00','19:30','20:00','20:30','21:00','21:30','22:00','22:30','23:00','23:30'}
n_cst_webapi ln_api


ls_times = ''
ls_time_option = ''
For ll_I = 1 To 48
	ls_temp = dw_1.GetItemString ( 1, 'time' + string ( ll_I ) )
	If ls_temp = '1' Then
		ls_times  = ls_times + '1'
		If Len ( ls_time_option ) > 0 then
			ls_time_option = ls_time_option + "," +  ls_time_arr[ll_i]
		Else
			ls_time_option = ls_time_arr[ll_i]
		End If
	Else
		ls_times  = ls_times + '0'
	End If
Next


If ls_times = is_time_settings_ori Then Return  // no modified


//save to datebase
SELECT count(1) INTO :ll_Count FROM wf_trigger_time_settings WHERE ID = 1;

If ll_Count > 0 Then
	UPDATE wf_trigger_time_settings SET times_setting = :ls_times, time_option = :ls_time_option WHERE ID = 1;
Else
	INSERT INTO wf_trigger_time_settings ( ID, times_setting, time_option )
	VALUES ( 1, :ls_times, :ls_time_option );
End If

//set web values
If Len ( ls_time_option ) > 0 Then
	If ln_api.of_setautoalarm( true, is_user, ls_time_option )	=  0 Then
		gnv_user_option.of_set_viewid_option_value( 1001, 'WEBLINK_SETAUTOALARM_VALUE' ,'1' )
		gnv_user_option.of_set_viewid_option_value( 1001, 'WEBLINK_SETAUTOALARM_USER_VALUE' , is_user )
	End If	
Else
	gnv_user_option.of_set_viewid_option_value( 1001, 'WEBLINK_SETAUTOALARM_VALUE' ,'0' )
	ln_api.of_setautoalarm( false, is_user,ls_time_option )
End If
//
is_time_settings_ori = ls_times
is_teme_option_ori = ls_time_option






end event

type cb_2 from commandbutton within w_triggertimes_settings
integer x = 1902
integer y = 860
integer width = 302
integer height = 88
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Close"
boolean cancel = true
end type

event clicked;

//--------------------------------------------------------------------
// Author:	Jay		Date: 2016-07-21
//--------------------------------------------------------------------

Long 		ll_I, ll_Count
String 	ls_times, ls_time_option, ls_temp
string 	ls_time_arr[] = {'00:00','00:30','01:00','01:30','02:00','02:30','03:00','03:30','04:00','04:30','05:00','05:30',&
								  '06:00','06:30','07:00','07:30','08:00','08:30','09:00','09:30','10:00','10:30','11:00','11:30',&
								  '12:00','12:30','13:00','13:30','14:00','14:30','15:00','15:30','16:00','16:30','17:00','17:30',&
								  '18:00','18:30','19:00','19:30','20:00','20:30','21:00','21:30','22:00','22:30','23:00','23:30'}
n_cst_webapi ln_api

If dw_1.RowCount () > 0 Then 

	ls_times = ''
	ls_time_option = ''
	For ll_I = 1 To 48
		ls_temp = dw_1.GetItemString ( 1, 'time' + string ( ll_I ) )
		If ls_temp = '1' Then
			ls_times  = ls_times + '1'
			If Len ( ls_time_option ) > 0 then
				ls_time_option = ls_time_option + "," +  ls_time_arr[ll_i]
			Else
				ls_time_option = ls_time_arr[ll_i]
			End If
		Else
			ls_times  = ls_times + '0'
		End If
	Next
	
	is_time_settings_ori = ls_times
	is_teme_option_ori = ls_time_option
		
	If ls_times <> is_time_settings_ori Then  // no modified	
	
		//save to datebase  //modified by gavins 20160729
//		SELECT count(1) INTO :ll_Count FROM wf_trigger_time_settings WHERE ID = 1;
//		
//		If ll_Count > 0 Then
//			UPDATE wf_trigger_time_settings SET times_setting = :ls_times, time_option = :ls_time_option WHERE ID = 1;
//		Else
//			INSERT INTO wf_trigger_time_settings ( ID, times_setting, time_option )
//			VALUES ( 1, :ls_times, :ls_time_option );
//		End If
		
		//set web values
//		If Len ( ls_time_option ) > 0 Then
//			If ln_api.of_setautoalarm( true, is_user, ls_time_option )	=  0 Then
//				gnv_user_option.of_set_viewid_option_value( 1001, 'WEBLINK_SETAUTOALARM_VALUE' ,'1' )
//				gnv_user_option.of_set_viewid_option_value( 1001, 'WEBLINK_SETAUTOALARM_USER_VALUE' , is_user )
//			End If	
//		Else
//			gnv_user_option.of_set_viewid_option_value( 1001, 'WEBLINK_SETAUTOALARM_VALUE' ,'0' )
//			ln_api.of_setautoalarm( false, is_user,ls_time_option )
//		End If
		
//		is_time_settings_ori = ls_times
//		is_teme_option_ori = ls_time_option
	
	End If


End If

CloseWithReturn(Parent, "A" + is_teme_option_ori + "-" + is_time_settings_ori)
end event

type dw_1 from datawindow within w_triggertimes_settings
integer x = 82
integer y = 120
integer width = 2062
integer height = 660
integer taborder = 10
string title = "none"
string dataobject = "d_triggertime_settings"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type gb_1 from groupbox within w_triggertimes_settings
integer x = 37
integer y = 32
integer width = 2167
integer height = 780
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Trigger Time Settings"
end type

