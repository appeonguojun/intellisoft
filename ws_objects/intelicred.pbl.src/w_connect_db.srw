$PBExportHeader$w_connect_db.srw
forward
global type w_connect_db from window
end type
type mle_1 from multilineedit within w_connect_db
end type
type st_3 from statictext within w_connect_db
end type
type st_2 from statictext within w_connect_db
end type
type st_1 from statictext within w_connect_db
end type
type ddlb_odbc from dropdownlistbox within w_connect_db
end type
type sle_pass from singlelineedit within w_connect_db
end type
type sle_login from singlelineedit within w_connect_db
end type
type cb_2 from commandbutton within w_connect_db
end type
type cb_1 from commandbutton within w_connect_db
end type
type gb_1 from groupbox within w_connect_db
end type
end forward

global type w_connect_db from window
integer width = 1394
integer height = 824
boolean titlebar = true
string title = "Database Connection Info"
windowtype windowtype = response!
long backcolor = 67108864
boolean center = true
mle_1 mle_1
st_3 st_3
st_2 st_2
st_1 st_1
ddlb_odbc ddlb_odbc
sle_pass sle_pass
sle_login sle_login
cb_2 cb_2
cb_1 cb_1
gb_1 gb_1
end type
global w_connect_db w_connect_db

type variables
n_cst_encrypt inv_Encrypt

end variables

forward prototypes
public subroutine of_init_odbclist ()
end prototypes

public subroutine of_init_odbclist ();String ls_drive,ls_keyarray[]
long   ll_Cnt,ll_n,ll_Ret,ll_Row

//System ODBC
RegistryKeys ('HKEY_LOCAL_MACHINE\SOFTWARE\ODBC\ODBC.INI', ls_keyarray )
ll_Cnt = upperbound(ls_keyarray)
for ll_n = 1 to ll_Cnt
	ll_Ret = RegistryGet ("HKEY_LOCAL_MACHINE\SOFTWARE\ODBC\ODBC.INI\ODBC Data Sources" , ls_keyarray[ll_n] , RegString!, ls_drive)

	if ll_Ret <> -1 and pos(lower(ls_drive),"sql server") > 0 then 
		ddlb_odbc.additem(ls_keyarray[ll_n])
	end if			
next

//User ODBC
RegistryKeys ('HKEY_CURRENT_USER\SOFTWARE\ODBC\ODBC.INI', ls_keyarray )
ll_Cnt = upperbound(ls_keyarray)
for ll_n = 1 to ll_Cnt
	ll_Ret = RegistryGet ("HKEY_LOCAL_MACHINE\SOFTWARE\ODBC\ODBC.INI\ODBC Data Sources" , ls_keyarray[ll_n] , RegString!, ls_drive)

	if ll_Ret <> -1 and pos(lower(ls_drive),"sql server") > 0 then 
		ddlb_odbc.additem(ls_keyarray[ll_n])
	end if			
next



end subroutine

on w_connect_db.create
this.mle_1=create mle_1
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.ddlb_odbc=create ddlb_odbc
this.sle_pass=create sle_pass
this.sle_login=create sle_login
this.cb_2=create cb_2
this.cb_1=create cb_1
this.gb_1=create gb_1
this.Control[]={this.mle_1,&
this.st_3,&
this.st_2,&
this.st_1,&
this.ddlb_odbc,&
this.sle_pass,&
this.sle_login,&
this.cb_2,&
this.cb_1,&
this.gb_1}
end on

on w_connect_db.destroy
destroy(this.mle_1)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.ddlb_odbc)
destroy(this.sle_pass)
destroy(this.sle_login)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.gb_1)
end on

event open;string ls_odbc
string ls_login
string ls_password

//init odbc srouce list
of_init_odbclist()


//init connect from ini
ls_odbc = ProfileString(gs_IniFilePathName, "setup", 'odbc', '')
ls_login = ProfileString(gs_IniFilePathName, "setup", 'LogIn', '')
ls_password= ProfileString(gs_IniFilePathName, "setup", 'Logpass', '')

//decrypt login and password
ls_login = inv_Encrypt.of_encrypt_ascii(ls_login)
ls_password = inv_Encrypt.of_encrypt_ascii(ls_password)


//set connect info
ddlb_odbc.text = ls_odbc
sle_login.text = ls_login

if Trim(ddlb_odbc.text) <> "" then
	sle_Login.SetFocus()
end if

end event

event close;////Andy 09/12/2007
//String ls_IniFile
//
//dw_1.accepttext( )
////ls_IniFile = gs_sysrunpath + '\'+gs_IniFile
//
//SetProfileString(ls_IniFile, "database", 'ServerName',dw_1.getitemString(1,"servername")) 
//SetProfileString(ls_IniFile, "database", 'Database',dw_1.getitemString(1,"database")) 
//SetProfileString(ls_IniFile, "database", 'LogId',dw_1.getitemString(1,"logid")) 
////SetProfileString(ls_IniFile, "database", 'LogPassword',dw_1.getitemString(1,"logpass")) 
//SetProfileString(ls_IniFile, "database", 'odbc',dw_1.getitemString(1,"datasource")) 
//SetProfileString(ls_IniFile, "setup", 'dbtype',gs_dbtype)
//
//
end event

type mle_1 from multilineedit within w_connect_db
integer x = 46
integer y = 24
integer width = 1326
integer height = 132
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Connect to databse failed,please input the correct info"
boolean border = false
end type

type st_3 from statictext within w_connect_db
integer x = 69
integer y = 468
integer width = 370
integer height = 84
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "Password"
boolean focusrectangle = false
end type

type st_2 from statictext within w_connect_db
integer x = 69
integer y = 352
integer width = 370
integer height = 84
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "Login Name"
boolean focusrectangle = false
end type

type st_1 from statictext within w_connect_db
integer x = 69
integer y = 236
integer width = 370
integer height = 84
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "ODBC Source"
boolean focusrectangle = false
end type

type ddlb_odbc from dropdownlistbox within w_connect_db
integer x = 448
integer y = 228
integer width = 869
integer height = 516
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean allowedit = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type sle_pass from singlelineedit within w_connect_db
integer x = 448
integer y = 460
integer width = 869
integer height = 84
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean password = true
borderstyle borderstyle = stylelowered!
end type

type sle_login from singlelineedit within w_connect_db
integer x = 448
integer y = 344
integer width = 869
integer height = 84
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type cb_2 from commandbutton within w_connect_db
integer x = 1015
integer y = 612
integer width = 334
integer height = 96
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Cancel"
boolean cancel = true
end type

event clicked;closewithreturn(parent,'cancel')
end event

type cb_1 from commandbutton within w_connect_db
integer x = 640
integer y = 612
integer width = 334
integer height = 96
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&OK"
boolean default = true
end type

event clicked;string ls_login
string ls_logpass
string ls_DataSource


ls_login  	 = 	sle_login.text
ls_LogPass  =  	sle_pass.text
ls_DataSource     = ddlb_odbc.text


//Connect Information
SQLCA.DBMS = "ODBC"
SQLCA.DBParm     = "ConnectString='DSN=" + ls_DataSource + ";UID=" + ls_login + ";PWD=" + ls_LogPass +"',DisableBind=1,PBUseProcOwner='Yes',RPCReBind=1,MsgTerse='Yes', " + & 
						"DelimitIdentifier='Yes',ConnectOption='SQL_DRIVER_CONNECT,SQL_DRIVER_NOPROMPT ',"+ & 
						"PBTrimCharColumns='Yes',PBMaxBlobSize = '2147483647' ,PBMaxTextSize = '2147483647'"    
	
SQLCA.AutoCommit = True
//end of add

CONNECT Using SQLCA;



//connect to databse failed,please input the correct info
IF SQLCA.SQLCode < 0 THEN
	MessageBox("Database Upgrade","Connect to databse failed,please input the correct info.~r~n~n"+SQLCA.SQLErrText)
	RETURN -1
else
	//Disconnect;
END IF

ls_login = inv_Encrypt.of_encrypt_ascii(ls_login)
ls_logpass = inv_Encrypt.of_encrypt_ascii(ls_logpass)

//Modified By Ken.Guo 2016-11-14
//SetProfileString(gs_IniFilePathName, "setup", 'odbc', ls_DataSource)
//SetProfileString(gs_IniFilePathName, "setup", 'LogIn', ls_login)
//SetProfileString(gs_IniFilePathName, "setup", 'Logpass', ls_LogPass)
If gb_rdsh  Then
	SetProfileString(gs_rdsh_IniFile, "setup", 'odbc', ls_DataSource)
	SetProfileString(gs_rdsh_IniFile, "setup", 'LogIn', ls_login)
	SetProfileString(gs_rdsh_IniFile, "setup", 'Logpass', ls_LogPass)	
Else
	SetProfileString(gs_IniFilePathName, "setup", 'odbc', ls_DataSource)
	SetProfileString(gs_IniFilePathName, "setup", 'LogIn', ls_login)
	SetProfileString(gs_IniFilePathName, "setup", 'Logpass', ls_LogPass)
End If




CloseWithReturn(parent,'ok')


end event

type gb_1 from groupbox within w_connect_db
integer x = 32
integer y = 152
integer width = 1317
integer height = 432
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "Database Connection Info"
end type

