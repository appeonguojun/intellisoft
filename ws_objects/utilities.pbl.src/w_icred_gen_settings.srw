$PBExportHeader$w_icred_gen_settings.srw
forward
global type w_icred_gen_settings from window
end type
type dw_users from datawindow within w_icred_gen_settings
end type
type dw_departments from datawindow within w_icred_gen_settings
end type
type cb_2 from commandbutton within w_icred_gen_settings
end type
type cb_1 from commandbutton within w_icred_gen_settings
end type
type dw_1 from datawindow within w_icred_gen_settings
end type
end forward

global type w_icred_gen_settings from window
integer x = 677
integer y = 48
integer width = 2629
integer height = 1916
boolean titlebar = true
string title = "Application Settings"
boolean controlmenu = true
boolean minbox = true
long backcolor = 79680469
dw_users dw_users
dw_departments dw_departments
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
end type
global w_icred_gen_settings w_icred_gen_settings

forward prototypes
public function integer of_dept_security ()
public function integer of_pre_update ()
public subroutine of_synchronize_data ()
end prototypes

public function integer of_dept_security ();Integer li_value
Integer li_ans
Integer li_access
Integer li_rec_cnt
Long ll_department
long ll_security_dept_code
long ll_ec
long ll_e
long ll_new
long ll_find
String ls_user_id
string ls_find
n_ds lds_existing
n_ds lds_new

//


		SELECT Count( user_id )
		INTO :li_rec_cnt
		FROM security_user_department;
		IF SQLCA.SQLCODE = -1 THEN
			MessageBox( "SQL Error", SQLCA.SQLERRTEXT )
			RETURN -1
		END IF
		
select max(user_depart_id) into :ll_security_dept_code from security_user_department;
if isnull(ll_security_dept_code) then ll_security_dept_code = 0
		
li_ans = MessageBox( "Department Security", "Are you sure you want to turn the department security feature on?",  question!, YesNo!, 1 )
		
//maha 012606 datastores for testing for and adding records
lds_existing = CREATE n_ds
lds_existing.dataobject = "d_dept_security_all"
lds_existing.settransobject(sqlca)

lds_new = CREATE n_ds
lds_new.dataobject = "d_dept_security_all"
lds_new.settransobject(sqlca)
//debugbreak()
		//if going to turn on then need to scan through departments and create user department security table
IF li_ans = 1 THEN
	Integer li_dept_cnt
	Integer li_user_cnt
	Integer d
	Integer u
	
	gi_dept_security = 1  //Start Code Change ----04.09.2008 #V8 maha - set variable when making this change
	
	li_ans = MessageBox("Access", "Do you want the default department access for all new created records to be turned on?", Question!, YesNo!, 1 )
		IF li_ans = 1 THEN
		li_access = 1
	ELSE
		li_access = 0
	END IF
	
	IF li_access = 0 THEN
		li_ans = MessageBox( "No Access", "When your users login they will have no access to physician data until you go to the User Painter and Grant access to specific departments for each user.", information!, OkCancel!, 1 )
		IF li_ans = 2 THEN
			RETURN -1
		END IF
	END IF
	
	dw_departments.SetTransObject( SQLCA )
	li_dept_cnt = dw_departments.Retrieve( )
	
	dw_users.SetTransObject( SQLCA )
	li_user_cnt = dw_users.Retrieve( )
	
	ll_ec = lds_existing.retrieve() 
	
	//Loop through all users and department and setup department security
	FOR u = 1 TO li_user_cnt
		ls_user_id = dw_users.GetItemString( u, "user_id" )
		FOR d = 1 TO li_dept_cnt
			//ll_security_dept_code ++
			ll_department = dw_departments.GetItemNumber( d, "lookup_code" )
			ls_find = "user_id = '" + ls_user_id + "' and department_id = " + string(ll_department)
			ll_find = lds_existing.Find ( ls_find, 1, ll_ec )
			
			if ll_find = 0 then
				ll_security_dept_code ++
				ll_new = lds_new.insertrow(0)
				lds_new.setitem(ll_new,"user_depart_id",ll_security_dept_code)
				lds_new.setitem(ll_new,"user_id",ls_user_id)
				lds_new.setitem(ll_new,"department_id",ll_department)
				lds_new.setitem(ll_new,"access_rights",li_access)
			elseif ll_find < 0 then
				messagebox("Find error",ls_find)
				return -1
			end if		
			
					
		END FOR
			
	END FOR
			//debugbreak()
	ll_find = lds_new.update()
	if ll_find < 1 then
		rollback;
	else
		COMMIT USING SQLCA;
	end if
	MessageBox( "Department Security", "Department Security data updated.  Go to System->Painters->User Painter to edit access." )  //Start Code Change ----04.09.2008 #V8 maha - moved from outside of if statement

	
else //Start Code Change ----04.09.2008 #V8 maha - reset the value is user says no.
	dw_1.setitem(1,"set_37", 0)
			
END IF
		
destroy lds_existing
destroy lds_new
		

return 1
end function

public function integer of_pre_update ();////Start Code Change ---- 03.01.2006 #303 maha
////function created maha 030106 for \\ checking of path
//string s
//integer i
//string ls_field
//
//dw_2.accepttext()
//if dw_2.getitemstatus( 1, 0, primary!) = datamodified! then
//	for i = 1 to 5
//		choose case i
//			case 1
//				ls_field = "intelliapp_app_path"
//			case 2
//				ls_field = "imaging_path"
//			case 3
//				ls_field = "picture_path"
//			case 4
//				ls_field = "letter_save_path"
//			case 5
//				ls_field = "contract_path"
//		end choose
//		//if dw_2.getitemstatus( 1, i, primary!) = datamodified! then
//			s = dw_2.getitemstring(1,ls_field)
//			//messagebox("out",s)
//			s = of_check_path(s,1)
//			//messagebox("in",s)
//			dw_2.setitem(1,ls_field,s)
//		//end if
//	next
//end if
//
return 1
////End Code Change---03.01.2006
end function

public subroutine of_synchronize_data ();//////////////////////////////////////////////////////////////////////
// $<function>w_icred_settings::of_synchronize_data()
// $<arguments>(None)
// $<returns> integer
// $<description>
// $<description> After modified data, synchronize it.
//////////////////////////////////////////////////////////////////////
// $<add> 08.27.2008 by Ken.Guo
//////////////////////////////////////////////////////////////////////

gnv_session.ii_session_refresh_frequency  = dw_1.getitemnumber(1,'session_refresh_frequency') //Added By Ken.Guo 08.27.2008

end subroutine

on w_icred_gen_settings.create
this.dw_users=create dw_users
this.dw_departments=create dw_departments
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
this.Control[]={this.dw_users,&
this.dw_departments,&
this.cb_2,&
this.cb_1,&
this.dw_1}
end on

on w_icred_gen_settings.destroy
destroy(this.dw_users)
destroy(this.dw_departments)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
end on

event open;dw_1.settransobject(sqlca)
dw_1.retrieve()


gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17

end event

type dw_users from datawindow within w_icred_gen_settings
boolean visible = false
integer x = 41
integer y = 16
integer width = 279
integer height = 108
integer taborder = 30
string dataobject = "d_user_list"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_departments from datawindow within w_icred_gen_settings
boolean visible = false
integer x = 325
integer y = 16
integer width = 224
integer height = 108
integer taborder = 20
string dataobject = "d_all_departments"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_2 from commandbutton within w_icred_gen_settings
integer x = 2272
integer y = 1720
integer width = 302
integer height = 88
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Close"
boolean cancel = true
end type

event clicked;gds_settings.retrieve()
close(parent)
end event

type cb_1 from commandbutton within w_icred_gen_settings
integer x = 1947
integer y = 1720
integer width = 302
integer height = 88
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Save"
end type

event clicked;
of_pre_update()
dw_1.update()
gds_settings.retrieve()
of_synchronize_data() //Added By Ken.Guo 08.27.2008
gnv_data.of_retrieve("icred_settings")

end event

type dw_1 from datawindow within w_icred_gen_settings
integer x = 46
integer y = 32
integer width = 2533
integer height = 1656
integer taborder = 10
string dataobject = "d_support_gen_set"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;Integer li_value
Integer li_ans
Integer li_access
Integer li_rec_cnt
Long ll_department
Integer ll_security_dept_code
String ls_user_id


//Added By Ken.Guo 2010-08-18. Popup Warning Message and Set Default Group Template.
Long ll_default_id
DatawindowChild ldwc_group_templates
dw_1.getChild('group_email_template',ldwc_group_templates)
Choose Case dwo.name
	Case 'email_alarm_type'
		If data = '2' Then //Group Email Alarm
			If Messagebox('Email Alarm Settings','If you change to Group Alarms that any Date Alarm Emails settings will not be used, but instead the Grouped Email Alarm Template message will be used. ~r~n~r~nAre you sure to make the big change?', Question!, Yesno!) = 2 Then
				This.Post SetItem(Row,'email_alarm_type',1)
			Else
				If Isnull(This.GetItemNumber(Row,'group_email_template') ) Then
					If ldwc_group_templates.RowCount() = 0 Then
						If Messagebox('Email Alarm Settings','There is no Group Email Alarm Template yet, do you want to create it now?', Question!, yesno!)  = 1 Then
							OpenWithParm(w_email_add,'Group_Add')
							If Message.Doubleparm > 0 Then
								ldwc_group_templates.SetTransObject(SQLCA)
								ldwc_group_templates.Retrieve()
								This.SetItem(Row,'group_email_template',Message.Doubleparm)
								This.Post SetColumn('group_email_template')
							End If
						End If
					Else
						Select email_id Into :ll_default_id from wf_email Where email_name = :gs_default_group_name;
						If ldwc_group_templates.Find('Email_id = ' + String(ll_default_id), 1,ldwc_group_templates.RowCount() ) > 0 Then
							This.SetItem(Row,'group_email_template',ll_default_id)
						Else
							Messagebox('Email Alarm Settings','Plase select a Group Email Alarm Template.')	
							This.Post SetColumn('group_email_template')
						End If
					End If
				End If
			End If				
		End If
	Case ''
End Choose


IF This.GetColumnName() = "set_10" THEN
	gi_test_mode = this.getitemnumber(1,'set_10')
end if

IF This.GetColumnName() = "set_29" THEN
	gi_scan_format = this.getitemnumber(1,'set_29')
end if

//Start Code Change ----10.08.2008 #V85 maha
IF This.GetColumnName() = "set_56" THEN
	gi_email_type = this.getitemnumber(1,'set_56')
end if
//End Code Change---10.08.2008

//changing to department security setting
IF This.GetColumnName() = "set_37" THEN
	li_value = Integer( data )
	IF li_value = 1 THEN
		of_dept_security( ) //maha 012606 changed to function
		
//		SELECT Count( user_id )
//		INTO :li_rec_cnt
//		FROM security_user_department;
//		IF SQLCA.SQLCODE = -1 THEN
//			MessageBox( "SQL Error", SQLCA.SQLERRTEXT )
//			RETURN -1
//		END IF
//	
//		IF li_rec_cnt > 0 THEN
//			li_ans = MessageBox( "Data Exists", "There seems to be data allready in the security_department_table.  Do you want to delete and recreate table?", StopSign!, YesNo!, 2 )
//			IF li_ans = 2 THEN
//				RETURN -1
//			END IF
//		END IF
//	
//		DELETE 
//		FROM security_user_department;
//		IF SQLCA.SQLCODE = -1 THEN
//			MessageBox( "SQL Error", SQLCA.SQLERRTEXT )
//			RETURN -1
//		END IF
//		
//		li_ans = MessageBox( "Department Security", "Are you sure you want to turn the department security feature on?",  StopSign!, YesNo!, 1 )
//		//if going to turn on then need to scan through departments and create user department security table
//		IF li_ans = 1 THEN
//			Integer li_dept_cnt
//			Integer li_user_cnt
//			Integer d
//			Integer u
//			
//			li_ans = MessageBox("Access", "Would you like the default access for all departments to be turned on?", Question!, YesNo!, 1 )
//
//			IF li_ans = 1 THEN
//				li_access = 1
//			ELSE
//				li_access = 0
//			END IF
//			
//			IF li_access = 0 THEN
//				li_ans = MessageBox( "No Access", "When your users login they will have no access to physician data until you go to the User Painter and Grant access to specific departments for each user.", StopSign!, OkCancel!, 1 )
//				IF li_ans = 2 THEN
//					RETURN -1
//				END IF
//			END IF
//			
//			dw_departments.SetTransObject( SQLCA )
//			dw_departments.Retrieve( )
//			li_dept_cnt = dw_departments.RowCount( )
//			dw_users.SetTransObject( SQLCA )
//			dw_users.Retrieve( )
//			li_user_cnt = dw_users.RowCount( )
//			
//			//Loop through all users and department and setup department security
//			FOR u = 1 TO li_user_cnt
//				ls_user_id = dw_users.GetItemString( u, "user_id" )
//				FOR d = 1 TO li_dept_cnt
//					ll_security_dept_code ++
//					ll_department = dw_departments.GetItemNumber( d, "lookup_code" )
//					
//					INSERT INTO security_user_department  
//		         ( user_depart_id,   
//      		     user_id,   
//		           department_id,   
//      		     access_rights )  
//				   VALUES ( :ll_security_dept_code,   
//				            :ls_user_id,   
//				            :ll_department,   
//					         :li_access )  ;
//					IF SQLCA.SQLCODE = -1 THEN
//						MessageBox( "SQL Error", SQLCA.SQLERRTEXT )
//						RETURN -1
//					END IF
//				END FOR
//			END FOR
//			COMMIT USING SQLCA;
//			
//		END IF
//		
//		MessageBox( "Department Security", "Department Security table created.  Go to System->Painters->User Painter to edit access." )
//		
	ELSE
		
	END IF
end if

end event

event retrieveend;//////////////////////////////////////////////////////////////////////
// $<event>  RetrieveEnd()
// $<arguments> long RowCount
// $<returns>   Long
// $<description> Refresh Download URL text
//////////////////////////////////////////////////////////////////////
// $<add> 2008-11-13 by Scofield
//////////////////////////////////////////////////////////////////////

//String	ls_DownLoadURL
//long		ll_Row
//
//ll_Row = This.RowCount()
//if ll_Row <= 0 or ll_Row > this.RowCount() then Return
//
//ls_DownLoadURL = This.GetItemString(ll_Row,"DownloadURL")
//if IsNull(ls_DownLoadURL) then Return
//
//sle_DownLoadURL.Text = ls_DownLoadURL
//
end event

event buttonclicked;If dwo.name = 'b_group_help' Then
	Messagebox('Email Alarm Output Type Help',+&
	'One per Alarm: '+&
	'~r~nIt will create a separate email for each Date Alarm. ~r~n' + &
	'~r~nGroup Alarms into Single Email: '+&
	'~r~nIt will create a single email to each user, and it will put a list of date alarms within the body of email. ')
End If
end event

