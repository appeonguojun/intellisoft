$PBExportHeader$w_checkdbowner.srw
forward
global type w_checkdbowner from w_response
end type
type cb_ok from commandbutton within w_checkdbowner
end type
type cbx_check from checkbox within w_checkdbowner
end type
type st_1 from statictext within w_checkdbowner
end type
end forward

global type w_checkdbowner from w_response
integer width = 1710
integer height = 556
string title = "Checking DB Owner "
cb_ok cb_ok
cbx_check cbx_check
st_1 st_1
end type
global w_checkdbowner w_checkdbowner

type variables

end variables

on w_checkdbowner.create
int iCurrent
call super::create
this.cb_ok=create cb_ok
this.cbx_check=create cbx_check
this.st_1=create st_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_ok
this.Control[iCurrent+2]=this.cbx_check
this.Control[iCurrent+3]=this.st_1
end on

on w_checkdbowner.destroy
call super::destroy
destroy(this.cb_ok)
destroy(this.cbx_check)
destroy(this.st_1)
end on

event open;call super::open;String ls_dblogin, ls_dbowner
str_pass lstr_pass
lstr_pass = message.powerobjectparm

If Upperbound(lstr_pass.s_string_array[]) = 2 Then
	ls_dblogin = lstr_pass.s_string_array[1]
	ls_dbowner = lstr_pass.s_string_array[2]
	st_1.text = "The system detected that the database login user ("+ls_dblogin+") does not match the Contractlogix database’s DB Owner ("+ls_dbowner+"). We suggest that you set the Contractlogix database’s DB Owner to '"+ls_dblogin+"' on the database server."
	st_1.width = 1568
Else
	//st_1.text = ''	
End If

end event

type cb_ok from commandbutton within w_checkdbowner
integer x = 1225
integer y = 332
integer width = 343
integer height = 92
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&OK"
boolean default = true
end type

event clicked;If cbx_check.checked Then
	Update icred_settings set check_dbowner = 0;
	gnv_data.of_retrieve( 'icred_settings')
End If

close(parent)
end event

type cbx_check from checkbox within w_checkdbowner
integer x = 64
integer y = 348
integer width = 809
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Don~'t Show At Startup"
end type

type st_1 from statictext within w_checkdbowner
integer x = 55
integer y = 56
integer width = 1568
integer height = 268
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "The system detected that the database login user (user1) does not match the Contractlogix database’s DB Owner (user2). We suggest that you set the Contractlogix database’s DB Owner to ‘user1’ on the database server."
boolean focusrectangle = false
end type

