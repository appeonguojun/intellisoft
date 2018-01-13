$PBExportHeader$w_profile_data_utility.srw
$PBExportComments$maha 091802
forward
global type w_profile_data_utility from window
end type
type dw_values from datawindow within w_profile_data_utility
end type
type cb_4 from commandbutton within w_profile_data_utility
end type
type cb_3 from commandbutton within w_profile_data_utility
end type
type cb_1 from commandbutton within w_profile_data_utility
end type
end forward

global type w_profile_data_utility from window
integer x = 5
integer y = 48
integer width = 3685
integer height = 2300
boolean titlebar = true
string title = "sys field utility"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 80269524
dw_values dw_values
cb_4 cb_4
cb_3 cb_3
cb_1 cb_1
end type
global w_profile_data_utility w_profile_data_utility

type variables
string is_field1
string is_field2
string is_field3
string is_table
string is_where
end variables

on w_profile_data_utility.create
this.dw_values=create dw_values
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_1=create cb_1
this.Control[]={this.dw_values,&
this.cb_4,&
this.cb_3,&
this.cb_1}
end on

on w_profile_data_utility.destroy
destroy(this.dw_values)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_1)
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

dw_values.settransobject(sqlca)
dw_values.retrieve()

gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17

end event

event close;//disCONNECT USING SQLCA;
end event

type dw_values from datawindow within w_profile_data_utility
integer x = 41
integer y = 132
integer width = 3557
integer height = 1832
integer taborder = 10
string dataobject = "d_utl_profile_report_edit"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_4 from commandbutton within w_profile_data_utility
integer x = 2757
integer y = 24
integer width = 247
integer height = 84
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Save"
end type

event clicked;
dw_values.update()
commit using sqlca;
end event

type cb_3 from commandbutton within w_profile_data_utility
integer x = 3314
integer y = 24
integer width = 274
integer height = 84
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Quit"
end type

event clicked;CLOSE(PARENT)
end event

type cb_1 from commandbutton within w_profile_data_utility
integer x = 3026
integer y = 24
integer width = 265
integer height = 84
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "About"
end type

event clicked;messagebox("To operate this program :","Select a Screen. Adjust field type")
end event

