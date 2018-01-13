$PBExportHeader$w_sys_table_utility.srw
forward
global type w_sys_table_utility from window
end type
type dw_1 from datawindow within w_sys_table_utility
end type
type cb_4 from commandbutton within w_sys_table_utility
end type
type cb_3 from commandbutton within w_sys_table_utility
end type
end forward

global type w_sys_table_utility from window
integer x = 78
integer y = 64
integer width = 3557
integer height = 2120
boolean titlebar = true
string title = "sys field utility"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 79680469
dw_1 dw_1
cb_4 cb_4
cb_3 cb_3
end type
global w_sys_table_utility w_sys_table_utility

type variables
string is_field1
string is_field2
string is_field3
string is_table
string is_where
end variables

on w_sys_table_utility.create
this.dw_1=create dw_1
this.cb_4=create cb_4
this.cb_3=create cb_3
this.Control[]={this.dw_1,&
this.cb_4,&
this.cb_3}
end on

on w_sys_table_utility.destroy
destroy(this.dw_1)
destroy(this.cb_4)
destroy(this.cb_3)
end on

event open;//SQLCA.DBMS="ODBC"
//SQLCA.DbParm="ConnectString='DSN=IntelliCred Client;UID=DBA;PWD=SQL;',DelimitIdentifier='No'"
//	
//CONNECT USING SQLCA;
//
//IF SQLCA.SQLCODE = -1 THEN
//	MessageBox("Not Logged In", "Login Failed!")
//ELSE
//	MESSAGEBOX("","LOGIN OK")
//END IF
//
dw_1.settransobject(sqlca)
dw_1.retrieve()

gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17

end event

event close;//disCONNECT USING SQLCA;
end event

type dw_1 from datawindow within w_sys_table_utility
integer x = 41
integer y = 140
integer width = 3415
integer height = 1820
integer taborder = 30
string dataobject = "d_sys_table_util"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_4 from commandbutton within w_sys_table_utility
integer x = 2898
integer y = 28
integer width = 247
integer height = 88
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Save"
end type

event clicked;dw_1.update()
commit using sqlca;
end event

type cb_3 from commandbutton within w_sys_table_utility
integer x = 3186
integer y = 28
integer width = 274
integer height = 88
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Quit"
end type

event clicked;CLOSE(PARENT)
end event

