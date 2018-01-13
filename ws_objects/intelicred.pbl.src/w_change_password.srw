$PBExportHeader$w_change_password.srw
forward
global type w_change_password from window
end type
type sle_password2 from singlelineedit within w_change_password
end type
type st_3 from statictext within w_change_password
end type
type cb_2 from u_cb within w_change_password
end type
type cb_1 from u_cb within w_change_password
end type
type st_2 from statictext within w_change_password
end type
type sle_password from singlelineedit within w_change_password
end type
type st_4 from statictext within w_change_password
end type
type sle_current_password from singlelineedit within w_change_password
end type
end forward

global type w_change_password from window
integer x = 1189
integer y = 556
integer width = 1477
integer height = 516
boolean titlebar = true
string title = "Change Your Password"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 79680469
boolean center = true
sle_password2 sle_password2
st_3 st_3
cb_2 cb_2
cb_1 cb_1
st_2 st_2
sle_password sle_password
st_4 st_4
sle_current_password sle_current_password
end type
global w_change_password w_change_password

type variables
integer 	ii_login
Boolean	ib_Sucess

end variables

forward prototypes
public function integer of_password_rules (string as_pw)
end prototypes

public function integer of_password_rules (string as_pw);//Start Code Change ---- 11.03.2006 #1 maha
integer li_res = 1
integer li_num
integer li_min
integer li_no_last
integer li_notsame
integer c
integer li_test = 0
string ls_mess = ""

Select opt_1, min_len, must_have_num, cant_use_last into :li_notsame, :li_min , :li_num , :li_no_last from security_settings;

if li_notsame = 1 then //test for log and password not the same
	if upper(as_pw) = upper(gs_user_id) then
		ls_mess = "The User name and password cannot be the same"
	end if
end if

if li_min > 0 then //test for minimum length
	if len(as_pw) < li_min  then
		if len(ls_mess) > 2 then ls_mess = ls_mess + ", and  "
		ls_mess = ls_mess + "The minimum password length is " + string(li_min) +""
	end if
end if

//Start Code Change ----8.01.2008 #V85 maha - trap for max length
if li_min > 0 then //test for max length
	if len(as_pw) > 12  then
		if len(ls_mess) > 2 then ls_mess = ls_mess + ", and  "
		ls_mess = ls_mess + "The maximum password length is 12 characters"
	end if
end if
//End Code Change---08.01.2008

if li_num = 1 then //test for existance of a number
	for c = 1 to len(as_pw)
		if isnumber(mid(as_pw,c,1)) then li_test = 1
	next
	if li_test = 0  then
		if len(ls_mess) > 2 then ls_mess = ls_mess + ", and  "
		ls_mess = ls_mess +  "The password must contain at least one numeric character"
	end if
end if

if li_no_last = 1 then
	if sle_current_password.text = sle_password2.text then
		if len(ls_mess) > 2 then ls_mess = ls_mess + ", and  "
		ls_mess = ls_mess +  " You have used the same new password as the original. The new password cannot be the sameas the old"
	end if
end if

if len(ls_mess) > 2 then
	ls_mess = ls_mess + ".  Please reenter the password."
	MessageBox("Password change failed",ls_mess,Exclamation!)
	li_res = - 1
end if

return li_res
end function

on w_change_password.create
this.sle_password2=create sle_password2
this.st_3=create st_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.st_2=create st_2
this.sle_password=create sle_password
this.st_4=create st_4
this.sle_current_password=create sle_current_password
this.Control[]={this.sle_password2,&
this.st_3,&
this.cb_2,&
this.cb_1,&
this.st_2,&
this.sle_password,&
this.st_4,&
this.sle_current_password}
end on

on w_change_password.destroy
destroy(this.sle_password2)
destroy(this.st_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.st_2)
destroy(this.sle_password)
destroy(this.st_4)
destroy(this.sle_current_password)
end on

event open;//maha added 083005 for changing password at login functionality
//Start Code Change ---- 11.21.2005 #98 maha
string ls_from


//--------------------------- APPEON BEGIN ---------------------------
//$<add> 10/10/2007 By: Ken.Guo
//$<reason> If login as LDAP user, Forbid modify password
If gb_autologin Then //Use LDAP user auto logon 
	Messagebox('Information','You are not allowed to change password if you login as Auto-Login user. Please call support if you need to change password.')
	Close(This)
	Return
End If

//Added By Ken.Guo 2016-06-24. AD Login
If gb_ad_login Then // AD Login
	Messagebox('Information','You are not allowed to change password if you login as AD user. Please contact Administrator if you need to change password.')
	Close(This)
	Return
End If
//---------------------------- APPEON END ----------------------------





ls_from  = message.stringparm

if ls_from = "ENCRYPT" then
	ii_login = 2
elseif ls_from = "login" then //from app open event and w_logon
	ii_login = 1 
else
	ii_login = 0
end if
//End Code Change---11.21.2005 
 
//st_name.text = "for user: " + gs_user_id
This.Title += " (" + gs_user_id + ")"			//Modified by Scofield on 2008-12-08

gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17

end event

event close;if Not ib_Sucess then Message.StringParm = "Cancel"

end event

type sle_password2 from singlelineedit within w_change_password
integer x = 453
integer y = 300
integer width = 571
integer height = 84
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean password = true
integer limit = 20
borderstyle borderstyle = stylelowered!
end type

type st_3 from statictext within w_change_password
integer x = 64
integer y = 312
integer width = 384
integer height = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Verify Password:"
boolean focusrectangle = false
end type

type cb_2 from u_cb within w_change_password
integer x = 1074
integer y = 188
integer width = 343
integer taborder = 50
boolean bringtotop = true
string text = "&Cancel"
boolean cancel = true
end type

event clicked;Closewithreturn(Parent, "Cancel")
end event

type cb_1 from u_cb within w_change_password
integer x = 1074
integer y = 60
integer width = 343
integer taborder = 40
boolean bringtotop = true
string text = "&OK"
boolean default = true
end type

event clicked;//Start Code Change ---- 11.21.2005 #97 maha
String  ls_password
String ls_password2
string ls_current
//string ls_login //Start Code Change ---- 11.03.2006 #1 maha
integer i
datetime ldt_date
date ld_date
n_cst_encrypt ln_encrypt

ls_current = sle_current_password.Text
ls_password = sle_password.Text
ls_password2 = sle_password2.Text

IF isnull(ls_current) or  ls_current = "" THEN
	MessageBox("Password not entered", "Please Enter old password.",Exclamation!)
	sle_current_password.SetFocus()
	Return
END IF

IF ls_current <> gs_password THEN
	MessageBox("Old Password", "Invalid old password.  Please Re-Enter.",Exclamation!)
	sle_current_password.SetFocus()
	Return
END IF

//if ii_login < 2 then  //when changing only  //maha 111205
	if len(ls_password) < 1 then 
		MessageBox("Change Password", "The New password was not entered.",Exclamation!)
		sle_password.SetFocus()
		return
	end if
//end if

if len(ls_password2) < 1 then //maha 111205
	MessageBox("Verify Password", "The verify password was not entered.",Exclamation!)
	sle_password2.SetFocus()
	return
end if

//if ii_login = 2 and len(ls_password)  = 0 then //encrypt no new password
//	IF ls_current <> ls_password2 THEN
//		MessageBox("Verify Password", "Current and Verify Passwords did not match,  Check password values." )
//		sle_password2.Text = ""
//		sle_password2.SetFocus()
//		return
//	end if
IF ls_password <> ls_password2 THEN
	MessageBox("New Password", "New and Verify Passwords did not match,  Re-enter passwords.",Exclamation!)
	sle_password.Text = ""
	sle_password2.Text = ""
	sle_password.SetFocus()
	Return
END IF
//Start Code Change ---- 03.16.2006 #328 maha  removed 
//if ls_current <> ls_password2 then //only if changed maha 112105
//	DECLARE ChangePassword PROCEDURE FOR dbo.sp_password  
//				@caller_pswd = :gs_password,   
//				@new_pswd = :ls_password,   
//				@login_name = :gs_user_id  ;
//	
//	EXECUTE ChangePassword;
//end if


//maha 112105 encrypt password in user table 112105
//test password rules if ok encrypt
if of_password_rules(ls_password2 ) = 1 then
	ls_password2 = ln_encrypt.of_encrypt( ls_password2)
else //failed  failed message is in the function
	sle_Password.SetFocus()				//Added by Scofield on 2008-12-08
	return
end if
//ls_login = ln_encrypt.of_encrypt( ls_login)
//End Code Change---11.07.2006
ldt_date = datetime(today(),now())  //Start Code Change ---- 03.13.2007 #V7 maha

update security_users set user_password = :ls_password2 where user_id = :gs_user_id;
insert into security_login_tracking(user_id,user_password,log_date,pass_fail) values (:gs_user_id,'*******',:ldt_date,'Change');  //Start Code Change ---- 03.13.2007 #V7 maha
commit using sqlca;

//check and set password expiration date if expiration is being used.
select set_36 into :i from icred_settings; //maha 05-04 for ver4.5
//i = of_get_app_setting("set_36","I")  //maha cannot use this function here as it will bomb when change password is run at login
//End Code Change---11.21.2005 

if i > 0 then 
	ld_date = relativedate(today(),i)
	update security_users set last_pass_update = :ld_date where user_id = :gs_user_id; //corrected 060705
	commit using sqlca;
end if

MessageBox(gnv_app.iapp_object.DisplayName,'Your password has been successfully changed.')	//Added by Scofield on 2008-12-08

ib_Sucess = true						//Added by Scofield on 2008-12-08
gs_password = ls_password			//Added by Scofield on 2008-12-08

Closewithreturn(Parent,ii_login)

end event

type st_2 from statictext within w_change_password
integer x = 64
integer y = 204
integer width = 384
integer height = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "New Password:"
boolean focusrectangle = false
end type

type sle_password from singlelineedit within w_change_password
integer x = 453
integer y = 192
integer width = 571
integer height = 84
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean password = true
integer limit = 20
borderstyle borderstyle = stylelowered!
end type

type st_4 from statictext within w_change_password
integer x = 64
integer y = 76
integer width = 384
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Old Password:"
boolean focusrectangle = false
end type

type sle_current_password from singlelineedit within w_change_password
integer x = 453
integer y = 64
integer width = 571
integer height = 84
integer taborder = 10
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean password = true
integer limit = 20
borderstyle borderstyle = stylelowered!
end type

