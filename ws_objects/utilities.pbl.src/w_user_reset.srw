$PBExportHeader$w_user_reset.srw
forward
global type w_user_reset from window
end type
type cb_sall from commandbutton within w_user_reset
end type
type cb_mod_user from commandbutton within w_user_reset
end type
type cb_6 from commandbutton within w_user_reset
end type
type cb_5 from commandbutton within w_user_reset
end type
type cb_4 from commandbutton within w_user_reset
end type
type st_1 from statictext within w_user_reset
end type
type dw_from from datawindow within w_user_reset
end type
type cb_3 from commandbutton within w_user_reset
end type
type cb_1 from commandbutton within w_user_reset
end type
type cb_2 from commandbutton within w_user_reset
end type
end forward

global type w_user_reset from window
integer x = 965
integer y = 256
integer width = 1737
integer height = 1664
boolean titlebar = true
string title = "Reset Users"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 79680469
cb_sall cb_sall
cb_mod_user cb_mod_user
cb_6 cb_6
cb_5 cb_5
cb_4 cb_4
st_1 st_1
dw_from dw_from
cb_3 cb_3
cb_1 cb_1
cb_2 cb_2
end type
global w_user_reset w_user_reset

type variables
string is_from
string is_to
integer ii_facil
integer ii_set //Start Code Change ---- 11.07.2006 #1 maha
long il_dept = 0

end variables

forward prototypes
public function integer of_no_user ()
public function integer of_update_user (string as_util)
end prototypes

public function integer of_no_user ();integer i
integer ck = 0

//Start Code Change ---- 11.14.2006 #426 maha  new function
for i = 1 to dw_from.rowcount()
	if dw_from.getitemnumber(i,"selected") = 1 then
		ck = 1
		exit
	end if
next

if ck = 0 then
	messagebox("Select Error","No users are selected.")
	return -1
else
	return 1
end if

//if isnull(is_from) or is_from = "" then
//	messagebox("Select Error","You must select a user.")
//	return -1
//else
//	return 1
//end if
//End Code Change---11.14.2006
end function

public function integer of_update_user (string as_util);//Start Code Change ---- 11.14.2006 #V7 maha new function to allow multiple user functionality
//maha new 11.14.06
integer i
integer ic
datetime ldt_now
string ls_user
string ls_sql

ic  = dw_from.rowcount()

for i = 1 to ic
	if dw_from.getitemnumber(i,"selected") = 1 then
		if upper(ls_user) = "DBA" or  upper(ls_user) = "MASTER" then continue
		choose case as_util
			case "DATE"
				ldt_now = datetime(today(),Now())
				dw_from.setitem(i,"last_pass_update",ldt_now)
			case "NULL"
				setnull(ldt_now)
				dw_from.setitem(i,"last_pass_update",ldt_now)
			case "123"
				dw_from.setitem(i,"user_password","123")
			case "REPORT"
				ls_user = dw_from.getitemstring(i,"user_id")
				ls_sql =  "update conv_view set mod_user = 'All' where mod_user = :" + ls_user + ";"
				execute immediate :ls_sql using sqlca;
		end choose
	end if
next	

dw_from.update()
commit using sqlca;

return 1
end function

on w_user_reset.create
this.cb_sall=create cb_sall
this.cb_mod_user=create cb_mod_user
this.cb_6=create cb_6
this.cb_5=create cb_5
this.cb_4=create cb_4
this.st_1=create st_1
this.dw_from=create dw_from
this.cb_3=create cb_3
this.cb_1=create cb_1
this.cb_2=create cb_2
this.Control[]={this.cb_sall,&
this.cb_mod_user,&
this.cb_6,&
this.cb_5,&
this.cb_4,&
this.st_1,&
this.dw_from,&
this.cb_3,&
this.cb_1,&
this.cb_2}
end on

on w_user_reset.destroy
destroy(this.cb_sall)
destroy(this.cb_mod_user)
destroy(this.cb_6)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.st_1)
destroy(this.dw_from)
destroy(this.cb_3)
destroy(this.cb_1)
destroy(this.cb_2)
end on

event open;//SQLCA.DBMS="ODBC"
//SQLCA.DbParm="ConnectString='DSN=IntelliCred Client;UID=DBA;PWD=SQL;',DelimitIdentifier='No'"
//	
//CONNECT USING SQLCA;
//
//IF SQLCA.SQLCODE = -1 THEN
//	MessageBox("Not Logged In", "Login Failed!")
//ELSE
//	//MESSAGEBOX("","LOGIN OK")
//END if

DataWindowChild dwchild

dw_from.settransobject(sqlca)
dw_from.retrieve()
//dw_from.insertrow(1)//Start Code Change ---- 11.14.2006 #V7 maha



gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17

end event

event close;//disCONNECT USING SQLCA;
end event

type cb_sall from commandbutton within w_user_reset
integer x = 55
integer y = 1448
integer width = 402
integer height = 84
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Select All"
end type

event clicked;integer i

if this.text = "&Select All" then
	for i = 1 to dw_from.rowcount()
		dw_from.setitem(i,"selected",1)
	next
	this.text = "&Deselect All"
elseif this.text = "&Deselect All" then
	for i = 1 to dw_from.rowcount()
		dw_from.setitem(i,"selected",0)
	next
	this.text = "&Select All"
end if


end event

type cb_mod_user from commandbutton within w_user_reset
integer x = 859
integer y = 320
integer width = 800
integer height = 84
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Set IReport user to All"
end type

event clicked;//Start Code Change ---- 04.26.2006 #427 maha  //new function 
string ls_sql
integer i

i = messagebox("User Reset","This will reset the 'Can be modified by' field to All all IntelliReports where the Modifiy User is the selected user.~r~rContinue?",question!,yesno!,2)

if i = 2 then return

if of_no_user() = -1 then return
//Start Code Change ---- 11.14.2006 #V7 maha
of_update_user( "REPORT")

//maha 122205 resetting per new dba connections
//ls_sql =  "update conv_view set mod_user = 'All' where mod_user = : " + is_from + ";"
//execute immediate :ls_sql using sqlca;
//commit using sqlca;
//End Code Change---11.14.2006


end event

type cb_6 from commandbutton within w_user_reset
integer x = 859
integer y = 436
integer width = 800
integer height = 84
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Null Password Exp Dates"
end type

event clicked;//maha 031605 to reset all exp dates on passwords
integer i

i = messagebox("Null exp Date","This will clear user password expiration Dates for selected users. The expiration date for each user will be set the first time they log in.~r~rContinue?",question!,yesno!,2)

if i = 2 then return

//Start Code Change ---- 11.14.2006 #V7 maha using function
if of_no_user() = -1 then
	return
else
	of_update_user( "NULL")
end if
//update security_users set last_pass_update = null;
//
//commit using sqlca;
//End Code Change---11.14.2006
end event

type cb_5 from commandbutton within w_user_reset
integer x = 859
integer y = 544
integer width = 800
integer height = 84
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Drop Catalog tables"
end type

event clicked;string ls_sql
string ls_user
integer i


if of_no_user() = -1 then return 

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-01
//$<add> 01.17.2006 By: Wangchao
//$<reason> Performance tuning
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

gnv_appeondb.of_startqueue( )
//---------------------------- APPEON END ----------------------------

//Start Code Change ---- 11.14.2006 #1 maha chalged to allow multiple users at once
for i = 1 to dw_from.rowcount()
	ls_user = dw_from.getitemstring(i,"user_id")
	if upper(ls_user) = "DBA" or  upper(ls_user) = "MASTER" then continue
	
	ls_sql = "drop table " + ls_user  + ".pbcatcol;"
	//messagebox("ls_sql",ls_sql)
	execute immediate :ls_sql using sqlca;
	commit using sqlca;
	
	ls_sql = "drop table " + ls_user  + ".pbcatedt;"
	execute immediate :ls_sql using sqlca;
	commit using sqlca;
	
	ls_sql = "drop table " + ls_user  + ".pbcatfmt;"
	execute immediate :ls_sql using sqlca;
	commit using sqlca;
	
	ls_sql = "drop table " + ls_user  + ".pbcattbl;"
	execute immediate :ls_sql using sqlca;
	commit using sqlca;
	
	ls_sql = "drop table " + ls_user  + ".pbcatvld;"
	execute immediate :ls_sql using sqlca;
	commit using sqlca;
next

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-02
//$<add> 01.17.2006 By: Wangchao
//$<reason> Performance tuning
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

gnv_appeondb.of_commitqueue( )

//---------------------------- APPEON END ----------------------------



end event

type cb_4 from commandbutton within w_user_reset
integer x = 859
integer y = 212
integer width = 800
integer height = 84
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Reset Password to 123"
end type

event clicked;string ls_sql
string ls_pw
n_cst_encrypt ln_enc

if of_no_user() = -1 then return //Start Code Change ---- 04.26.2006 #426 maha

//Start Code Change ---- 11.14.2006 #V7 maha to use function
of_update_user( "123")
//Start Code Change ---- 11.07.2006 #1 maha
//ls_sql = "Grant connect to " + is_from  + " identified by '123';"
//maha 122205 resetting per new dba connections
//select new_change_pw into :ii_set from security_settings;
//
//if ii_set = 1 then
//	ls_pw = "123"
//else
//	ls_pw = ln_enc.of_encrypt( "123")  
//end if
//
//ls_sql =  "update security_users set user_password = '" + ls_pw +  "' where user_id = '" + is_from + "';"
////messagebox("",ls_sql)
//execute immediate :ls_sql using sqlca;
//commit using sqlca;

//End Code Change---11.14.2006

//DECLARE ChangePassword PROCEDURE FOR dbo.sp_password  
//         @caller_pswd = :gs_password,   
//         @new_pswd = :ls_password,   
//         @login_name = :gs_user_id  ;
//
//EXECUTE ChangePassword;
end event

type st_1 from statictext within w_user_reset
integer x = 69
integer y = 32
integer width = 343
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
string text = "Select User:"
boolean focusrectangle = false
end type

type dw_from from datawindow within w_user_reset
integer x = 32
integer y = 104
integer width = 791
integer height = 1328
integer taborder = 50
string dataobject = "d_user_select_list"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;is_from = data
end event

type cb_3 from commandbutton within w_user_reset
integer x = 1385
integer y = 12
integer width = 274
integer height = 84
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Close"
end type

event clicked;CLOSE(PARENT)
end event

type cb_1 from commandbutton within w_user_reset
boolean visible = false
integer x = 1554
integer y = 1356
integer width = 274
integer height = 84
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "About"
end type

event clicked;messagebox("This program:","Designed for resetting a user password to 123 or to set the password expiration date to today to allow the user to change the password.~r.")
end event

type cb_2 from commandbutton within w_user_reset
integer x = 859
integer y = 108
integer width = 800
integer height = 84
integer taborder = 10
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Reset Password Expiration"
end type

event clicked;string ls_sql
integer i


if of_no_user() = -1 then return //Start Code Change ---- 04.26.2006 #426 maha

//Start Code Change ---- 11.14.2006 #V7 maha to use function
of_update_user( "DATE")

//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 2005-11-07 By: Zhang Lingping
//$<reason> 

//update security_users set last_pass_update = today() where user_id = :is_from;
//update security_users set last_pass_update = getdate() where user_id = :is_from;
////---------------------------- APPEON END ----------------------------
//
//commit using sqlca;

//End Code Change---11.14.2006
end event

