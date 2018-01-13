$PBExportHeader$w_get_request_form_name.srw
forward
global type w_get_request_form_name from w_get_view_name
end type
type st_msg from statictext within w_get_request_form_name
end type
end forward

global type w_get_request_form_name from w_get_view_name
integer width = 2030
integer height = 484
string title = "Request Form Template Name"
st_msg st_msg
end type
global w_get_request_form_name w_get_request_form_name

type variables
string 	is_types
end variables

on w_get_request_form_name.create
int iCurrent
call super::create
this.st_msg=create st_msg
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_msg
end on

on w_get_request_form_name.destroy
call super::destroy
destroy(this.st_msg)
end on

event open;
Integer li_rc

// Allow for pre and post open events to occur
This.Event pfc_preopen()
This.Post Event pfc_postopen()

// Default window title is application title
If Len (This.title) = 0 Then
	If IsValid (gnv_app.iapp_object) Then
		This.title = gnv_app.iapp_object.DisplayName
	End If
End If

// Allow preference service to restore settings if necessary
If IsValid(inv_preference) Then
	If gnv_app.of_IsRegistryAvailable() Then
		If Len(gnv_app.of_GetUserKey())> 0 Then 
			li_rc = inv_preference.of_Restore( &
				gnv_app.of_GetUserKey()+'\'+this.ClassName()+'\Preferences')
		ElseIf IsValid(gnv_app.inv_debug) Then				
			of_MessageBox ("pfc_master_open_preferenceregistrydebug", &
				"PowerBuilder Foundation Class Library", "The PFC User Preferences service" +&
				" has been requested but The UserRegistrykey property has not" +&
				" been Set on The application manager Object.~r~n~r~n" + &
  				"Call of_SetRegistryUserKey on The Application Manager" +&
				" to Set The property.", &
				Exclamation!, OK!, 1)
		End If
	Else
		If Len(gnv_app.of_GetUserIniFile()) > 0 Then
			li_rc = inv_preference.of_Restore (gnv_app.of_GetUserIniFile(), This.ClassName()+' Preferences')
		ElseIf IsValid(gnv_app.inv_debug) Then		
			of_MessageBox ("pfc_master_open_preferenceinidebug", &
				"PowerBuilder Class Library", "The PFC User Preferences service" +&
				" has been requested but The UserINIFile property has not" +&
				" been Set on The application manager Object.~r~n~r~n" + &
  				"Call of_SetUserIniFile on The Application Manager" +&
				" to Set The property.", &
				Exclamation!, OK!, 1)		
		End If
	End If
End If

// Allow MRU service to restore settings if necessary
If IsValid(gnv_app.inv_mru) Then
	this.event pfc_mrurestore()
End if

gnv_win_backcolor.of_ChangeWindowBackColor(this) 

if gb_contract_version then
	rb_c.Checked = true
	rb_a.Enabled = false
end if

//is_type_c = Message.StringParm
is_type_c = "C"
is_types = Message.StringParm

//Added By Mark Lee 09/10/2013
if not isnull(is_types) and is_types = "header" then 
	this.title = "Add Header "
	this.st_1.text = "Header Name "
	st_msg.visible = true
	st_msg.text = "Notes: You can double click on a header or a step in the Field Selection / Formatting List window to change its name."
elseif not isnull(is_types) and is_types = "step" then 
	this.title = "Add Step "
	this.st_1.text = "Step Name "
	st_msg.visible = true
	st_msg.text = "Notes: You can double click on a header or a step in the Field Selection / Formatting List window to change its name."
elseif pos(is_types,"header;")> 0 then 
	this.title = "Modify Header "
	this.st_1.text = "Header Name "
	sle_1.text = mid(is_types,Pos(is_types,"header;") + 7 )
elseif pos(is_types,"step;")> 0 then 
	this.title = "Modify Step "
	this.st_1.text = "Step Name "
	sle_1.text = mid(is_types,Pos(is_types,"step;") + 5 )	
end if 
end event

type st_1 from w_get_view_name`st_1 within w_get_request_form_name
integer width = 667
string text = "Request Form Template Name"
end type

type sle_1 from w_get_view_name`sle_1 within w_get_request_form_name
end type

type cb_1 from w_get_view_name`cb_1 within w_get_request_form_name
end type

event cb_1::clicked;String ls_retval
string ls_request_name

ls_retval = trim(sle_1.Text)

if not isnull(is_types) and (is_types = "header"  or pos(is_types,"header;") > 0 ) 	then 
	IF ls_retval='' THEN
		messagebox('Alert','Please enter the name for the header.')
		return
	END IF
	
elseif not isnull(is_types) and ( is_types = "step" or pos(is_types,"step;") > 0) then 
	IF ls_retval='' THEN
		messagebox('Alert','Please enter the name for the step.')
		return
	END IF
	
else
	IF ls_retval='' THEN
		messagebox('Alert','Please enter the name for the Request Form.')
		return
	END IF
	
	select request_name 
	into :ls_request_name
	from request_form   
	where request_name = :ls_retval ;
	
	if not isnull(ls_request_name) and  len (ls_request_name) > 0 THEN 
		MESSAGEBOX(PARENT.TITLE, 'The name already exists. Please enter a new name.')
	else
		CloseWithReturn(Parent, sle_1.Text )
	END IF 
	
	return 
end if 

CloseWithReturn(Parent, sle_1.Text )
end event

type gb_1 from w_get_view_name`gb_1 within w_get_request_form_name
integer y = 660
end type

type rb_a from w_get_view_name`rb_a within w_get_request_form_name
integer y = 740
end type

type rb_c from w_get_view_name`rb_c within w_get_request_form_name
integer y = 744
end type

type cb_2 from w_get_view_name`cb_2 within w_get_request_form_name
integer y = 880
end type

type cb_3 from w_get_view_name`cb_3 within w_get_request_form_name
end type

type st_msg from statictext within w_get_request_form_name
boolean visible = false
integer x = 37
integer y = 228
integer width = 1957
integer height = 128
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 67108864
boolean focusrectangle = false
end type

