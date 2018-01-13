$PBExportHeader$w_sql_select_only.srw
forward
global type w_sql_select_only from window
end type
type cb_7 from commandbutton within w_sql_select_only
end type
type cb_4 from commandbutton within w_sql_select_only
end type
type cb_sort from commandbutton within w_sql_select_only
end type
type cb_6 from commandbutton within w_sql_select_only
end type
type cb_syn10 from commandbutton within w_sql_select_only
end type
type cb_syn9 from commandbutton within w_sql_select_only
end type
type cb_syn8 from commandbutton within w_sql_select_only
end type
type cb_syn7 from commandbutton within w_sql_select_only
end type
type cb_syn6 from commandbutton within w_sql_select_only
end type
type st_4 from statictext within w_sql_select_only
end type
type cb_5 from commandbutton within w_sql_select_only
end type
type cb_syn5 from commandbutton within w_sql_select_only
end type
type cb_syn4 from commandbutton within w_sql_select_only
end type
type cb_syn3 from commandbutton within w_sql_select_only
end type
type cb_syn2 from commandbutton within w_sql_select_only
end type
type cb_syn1 from commandbutton within w_sql_select_only
end type
type st_1 from statictext within w_sql_select_only
end type
type dw_1 from datawindow within w_sql_select_only
end type
type cb_3 from commandbutton within w_sql_select_only
end type
type cb_2 from commandbutton within w_sql_select_only
end type
type mle_1 from multilineedit within w_sql_select_only
end type
type cb_1 from commandbutton within w_sql_select_only
end type
type gb_1 from groupbox within w_sql_select_only
end type
end forward

global type w_sql_select_only from window
integer x = 14
integer y = 4
integer width = 3561
integer height = 2448
boolean titlebar = true
string title = "SQL Query"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 79680469
cb_7 cb_7
cb_4 cb_4
cb_sort cb_sort
cb_6 cb_6
cb_syn10 cb_syn10
cb_syn9 cb_syn9
cb_syn8 cb_syn8
cb_syn7 cb_syn7
cb_syn6 cb_syn6
st_4 st_4
cb_5 cb_5
cb_syn5 cb_syn5
cb_syn4 cb_syn4
cb_syn3 cb_syn3
cb_syn2 cb_syn2
cb_syn1 cb_syn1
st_1 st_1
dw_1 dw_1
cb_3 cb_3
cb_2 cb_2
mle_1 mle_1
cb_1 cb_1
gb_1 gb_1
end type
global w_sql_select_only w_sql_select_only

type variables
string is_syn1
string is_syn2
string is_syn3
string is_syn4
string is_syn5
string is_syn6
string is_syn7
string is_syn8
string is_syn9
string is_syn10

integer ii_next = 1
end variables

forward prototypes
public function integer of_syn ()
public function integer of_get_syn (integer ai_button)
end prototypes

public function integer of_syn ();is_syn10 = is_syn9
is_syn9 = is_syn8
is_syn8 = is_syn7
is_syn7 = is_syn6
is_syn6 = is_syn5
is_syn5 = is_syn4
is_syn4 = is_syn3
is_syn3 = is_syn2
is_syn2 = is_syn1
is_syn1 = mle_1.text

if len(is_syn10) > 0 then
	cb_syn10.enabled = true
elseif len(is_syn9) > 0 then
	cb_syn9.enabled = true
elseif len(is_syn8) > 0 then
	cb_syn8.enabled = true
elseif len(is_syn7) > 0 then
	cb_syn7.enabled = true	
elseif len(is_syn6) > 0 then
	cb_syn6.enabled = true
elseif len(is_syn5) > 0 then
	cb_syn5.enabled = true
elseif len(is_syn4) > 0 then
	cb_syn4.enabled = true
elseif len(is_syn3) > 0 then
	cb_syn3.enabled = true
elseif len(is_syn2) > 0 then
	cb_syn2.enabled = true
elseif len(is_syn1) > 0 then
	cb_syn1.enabled = true
end if






return 1
end function

public function integer of_get_syn (integer ai_button);choose case ai_button
	case 1
		mle_1.text = is_syn1
	case 2
		mle_1.text = is_syn2
	case 3
		mle_1.text = is_syn3
	case 4
		mle_1.text = is_syn4
	case 5
		mle_1.text = is_syn5
	case 6
		mle_1.text = is_syn6
	case 7
		mle_1.text = is_syn7
	case 8
		mle_1.text = is_syn8
	case 9
		mle_1.text = is_syn9
	case 10
		mle_1.text = is_syn10
end choose

return 1
end function

on w_sql_select_only.create
this.cb_7=create cb_7
this.cb_4=create cb_4
this.cb_sort=create cb_sort
this.cb_6=create cb_6
this.cb_syn10=create cb_syn10
this.cb_syn9=create cb_syn9
this.cb_syn8=create cb_syn8
this.cb_syn7=create cb_syn7
this.cb_syn6=create cb_syn6
this.st_4=create st_4
this.cb_5=create cb_5
this.cb_syn5=create cb_syn5
this.cb_syn4=create cb_syn4
this.cb_syn3=create cb_syn3
this.cb_syn2=create cb_syn2
this.cb_syn1=create cb_syn1
this.st_1=create st_1
this.dw_1=create dw_1
this.cb_3=create cb_3
this.cb_2=create cb_2
this.mle_1=create mle_1
this.cb_1=create cb_1
this.gb_1=create gb_1
this.Control[]={this.cb_7,&
this.cb_4,&
this.cb_sort,&
this.cb_6,&
this.cb_syn10,&
this.cb_syn9,&
this.cb_syn8,&
this.cb_syn7,&
this.cb_syn6,&
this.st_4,&
this.cb_5,&
this.cb_syn5,&
this.cb_syn4,&
this.cb_syn3,&
this.cb_syn2,&
this.cb_syn1,&
this.st_1,&
this.dw_1,&
this.cb_3,&
this.cb_2,&
this.mle_1,&
this.cb_1,&
this.gb_1}
end on

on w_sql_select_only.destroy
destroy(this.cb_7)
destroy(this.cb_4)
destroy(this.cb_sort)
destroy(this.cb_6)
destroy(this.cb_syn10)
destroy(this.cb_syn9)
destroy(this.cb_syn8)
destroy(this.cb_syn7)
destroy(this.cb_syn6)
destroy(this.st_4)
destroy(this.cb_5)
destroy(this.cb_syn5)
destroy(this.cb_syn4)
destroy(this.cb_syn3)
destroy(this.cb_syn2)
destroy(this.cb_syn1)
destroy(this.st_1)
destroy(this.dw_1)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.mle_1)
destroy(this.cb_1)
destroy(this.gb_1)
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
SQLCA.AutoCommit = false

gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17

end event

event close;//disCONNECT USING SQLCA;
SQLCA.AutoCommit = True
end event

type cb_7 from commandbutton within w_sql_select_only
integer x = 361
integer y = 644
integer width = 297
integer height = 84
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "S&ave Query"
end type

event clicked;string ls_sql
string ls_presentation_str
string ls_dwsyntax_str
string ERRORS
long cnt
//u_dw ldw_export_data

ls_sql = mle_1.text

if len(ls_sql) < 10 then 
	return
else
	openwithparm(w_sql_query_select,"N@" + ls_sql)
end if





end event

type cb_4 from commandbutton within w_sql_select_only
integer x = 672
integer y = 644
integer width = 343
integer height = 84
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Select &Query"
end type

event clicked;string ls_sql

openwithparm(w_sql_query_select, "U")

ls_sql = message.stringparm

if ls_sql = "Cancel" then
	return
else
	mle_1.text = ls_sql
end if

end event

type cb_sort from commandbutton within w_sql_select_only
integer x = 1550
integer y = 644
integer width = 247
integer height = 84
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Sort"
end type

event clicked;string null_str

SetNull(null_str)
dw_1.Setsort(null_str)
dw_1.sort()
end event

type cb_6 from commandbutton within w_sql_select_only
integer x = 1289
integer y = 644
integer width = 247
integer height = 84
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Filter"
end type

event clicked;string null_str

SetNull(null_str)
dw_1.SetFilter(null_str)
dw_1.Filter()

st_1.text = string(dw_1.rowcount())
end event

type cb_syn10 from commandbutton within w_sql_select_only
integer x = 1175
integer y = 68
integer width = 119
integer height = 84
integer taborder = 190
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "10"
end type

event clicked;of_get_syn(10)
end event

type cb_syn9 from commandbutton within w_sql_select_only
integer x = 1056
integer y = 68
integer width = 96
integer height = 84
integer taborder = 180
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "9"
end type

event clicked;of_get_syn(9)
end event

type cb_syn8 from commandbutton within w_sql_select_only
integer x = 937
integer y = 68
integer width = 96
integer height = 84
integer taborder = 170
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "8"
end type

event clicked;of_get_syn(8)
end event

type cb_syn7 from commandbutton within w_sql_select_only
integer x = 818
integer y = 68
integer width = 96
integer height = 84
integer taborder = 160
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "7"
end type

event clicked;of_get_syn(7)
end event

type cb_syn6 from commandbutton within w_sql_select_only
integer x = 699
integer y = 68
integer width = 96
integer height = 84
integer taborder = 150
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "6"
end type

event clicked;of_get_syn(6)
end event

type st_4 from statictext within w_sql_select_only
integer x = 3205
integer y = 684
integer width = 233
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
string text = "Records"
boolean focusrectangle = false
end type

type cb_5 from commandbutton within w_sql_select_only
integer x = 1810
integer y = 644
integer width = 247
integer height = 84
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Export"
end type

event clicked;
//if rb_dw1.checked = true then 
	dw_1.saveas()
//elseif rb_dw2.checked = true then 
//	dw_2.saveas()
//end if

	//restore Directory  
//added by nova 2008-04-29
ChangeDirectory ( gs_dir_path )
	
	
	
	
	
	
	
end event

type cb_syn5 from commandbutton within w_sql_select_only
integer x = 581
integer y = 68
integer width = 96
integer height = 84
integer taborder = 140
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "5"
end type

event clicked;of_get_syn(5)
end event

type cb_syn4 from commandbutton within w_sql_select_only
integer x = 462
integer y = 68
integer width = 96
integer height = 84
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "4"
end type

event clicked;of_get_syn(4)
end event

type cb_syn3 from commandbutton within w_sql_select_only
integer x = 343
integer y = 68
integer width = 96
integer height = 84
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "3"
end type

event clicked;of_get_syn(3)
end event

type cb_syn2 from commandbutton within w_sql_select_only
integer x = 224
integer y = 68
integer width = 96
integer height = 84
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "2"
end type

event clicked;of_get_syn(2)
end event

type cb_syn1 from commandbutton within w_sql_select_only
integer x = 105
integer y = 68
integer width = 96
integer height = 84
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "1"
end type

event clicked;of_get_syn(1)
end event

type st_1 from statictext within w_sql_select_only
integer x = 2181
integer y = 668
integer width = 997
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "0"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_sql_select_only
integer x = 59
integer y = 744
integer width = 3401
integer height = 1416
integer taborder = 90
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
end type

type cb_3 from commandbutton within w_sql_select_only
integer x = 1029
integer y = 644
integer width = 247
integer height = 84
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "C&lear"
end type

event clicked;mle_1.text = ""
dw_1.reset()

end event

type cb_2 from commandbutton within w_sql_select_only
integer x = 3195
integer y = 64
integer width = 247
integer height = 84
integer taborder = 200
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Close"
end type

event clicked;close(parent)
end event

type mle_1 from multilineedit within w_sql_select_only
integer x = 64
integer y = 188
integer width = 3392
integer height = 440
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type cb_1 from commandbutton within w_sql_select_only
integer x = 73
integer y = 644
integer width = 274
integer height = 84
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Run"
end type

event clicked;string ls_sql
string ls_presentation_str
string ls_dwsyntax_str
string ERRORS
long cnt
//u_dw ldw_export_data

ls_sql = mle_1.text


if pos(upper(trim(ls_sql)),"SELECT",1) = 1 then
	//CREATE SYNTAX FOR export DW
	ls_presentation_str = "style(type=grid)" 
	ls_dwsyntax_str = SQLCA.SyntaxFromSQL(ls_sql, ls_presentation_str, ERRORS)
	IF Len(ERRORS) > 0 THEN //this will fail if the table has not been completed
		if pos(ERRORS,"Table or view not found",1) > 0 then
			messagebox ("syntax error","Table not found (should have  prefix)" )
			return -1
		else
			MessageBox("Caution", &
			"SyntaxFromSQL caused these errors: " + ERRORS)
			RETURN -1
		end if
	END IF
	
	//if rb_dw1.checked = true then 
		dw_1.Create( ls_dwsyntax_str, ERRORS)
		dw_1.SetTransObject( SQLCA )
		cnt = dw_1.retrieve()
		st_1.text = string(cnt)
//	elseif rb_dw2.checked = true then 
//		dw_2.Create( ls_dwsyntax_str, ERRORS)
//		dw_2.SetTransObject( SQLCA )
//		cnt = dw_2.retrieve()
//		st_2.text = string(cnt)
//	end if
//		cb_commit.enabled = false
//		cb_roll.enabled = false
else
	messagebox("Retrieve only","This function can only be used select statements.")
//	execute immediate :ls_sql using sqlca;
//	cb_commit.enabled = true
//	cb_roll.enabled = true
end if

of_syn()

end event

type gb_1 from groupbox within w_sql_select_only
integer x = 64
integer y = 8
integer width = 1271
integer height = 168
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "Last Ten Statements"
end type

