$PBExportHeader$w_sql_send.srw
forward
global type w_sql_send from window
end type
type cb_8 from commandbutton within w_sql_send
end type
type cb_7 from commandbutton within w_sql_send
end type
type cb_sort from commandbutton within w_sql_send
end type
type rb_split from radiobutton within w_sql_send
end type
type rb_2f from radiobutton within w_sql_send
end type
type rb_1f from radiobutton within w_sql_send
end type
type cb_image from commandbutton within w_sql_send
end type
type cb_verif from commandbutton within w_sql_send
end type
type cb_6 from commandbutton within w_sql_send
end type
type cb_syn10 from commandbutton within w_sql_send
end type
type cb_syn9 from commandbutton within w_sql_send
end type
type cb_syn8 from commandbutton within w_sql_send
end type
type cb_syn7 from commandbutton within w_sql_send
end type
type cb_syn6 from commandbutton within w_sql_send
end type
type st_6 from statictext within w_sql_send
end type
type st_5 from statictext within w_sql_send
end type
type st_2 from statictext within w_sql_send
end type
type st_3 from statictext within w_sql_send
end type
type dw_2 from datawindow within w_sql_send
end type
type rb_dw2 from radiobutton within w_sql_send
end type
type rb_dw1 from radiobutton within w_sql_send
end type
type st_4 from statictext within w_sql_send
end type
type cb_5 from commandbutton within w_sql_send
end type
type cb_syn5 from commandbutton within w_sql_send
end type
type cb_syn4 from commandbutton within w_sql_send
end type
type cb_syn3 from commandbutton within w_sql_send
end type
type cb_syn2 from commandbutton within w_sql_send
end type
type cb_syn1 from commandbutton within w_sql_send
end type
type cb_roll from commandbutton within w_sql_send
end type
type cb_commit from commandbutton within w_sql_send
end type
type cb_4 from commandbutton within w_sql_send
end type
type st_1 from statictext within w_sql_send
end type
type dw_1 from datawindow within w_sql_send
end type
type cb_3 from commandbutton within w_sql_send
end type
type cb_2 from commandbutton within w_sql_send
end type
type mle_1 from multilineedit within w_sql_send
end type
type cb_1 from commandbutton within w_sql_send
end type
type gb_3 from groupbox within w_sql_send
end type
type gb_2 from groupbox within w_sql_send
end type
type gb_1 from groupbox within w_sql_send
end type
end forward

global type w_sql_send from window
integer x = 14
integer y = 4
integer width = 3525
integer height = 2352
boolean titlebar = true
string title = "SQL Send"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 79680469
cb_8 cb_8
cb_7 cb_7
cb_sort cb_sort
rb_split rb_split
rb_2f rb_2f
rb_1f rb_1f
cb_image cb_image
cb_verif cb_verif
cb_6 cb_6
cb_syn10 cb_syn10
cb_syn9 cb_syn9
cb_syn8 cb_syn8
cb_syn7 cb_syn7
cb_syn6 cb_syn6
st_6 st_6
st_5 st_5
st_2 st_2
st_3 st_3
dw_2 dw_2
rb_dw2 rb_dw2
rb_dw1 rb_dw1
st_4 st_4
cb_5 cb_5
cb_syn5 cb_syn5
cb_syn4 cb_syn4
cb_syn3 cb_syn3
cb_syn2 cb_syn2
cb_syn1 cb_syn1
cb_roll cb_roll
cb_commit cb_commit
cb_4 cb_4
st_1 st_1
dw_1 dw_1
cb_3 cb_3
cb_2 cb_2
mle_1 mle_1
cb_1 cb_1
gb_3 gb_3
gb_2 gb_2
gb_1 gb_1
end type
global w_sql_send w_sql_send

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

on w_sql_send.create
this.cb_8=create cb_8
this.cb_7=create cb_7
this.cb_sort=create cb_sort
this.rb_split=create rb_split
this.rb_2f=create rb_2f
this.rb_1f=create rb_1f
this.cb_image=create cb_image
this.cb_verif=create cb_verif
this.cb_6=create cb_6
this.cb_syn10=create cb_syn10
this.cb_syn9=create cb_syn9
this.cb_syn8=create cb_syn8
this.cb_syn7=create cb_syn7
this.cb_syn6=create cb_syn6
this.st_6=create st_6
this.st_5=create st_5
this.st_2=create st_2
this.st_3=create st_3
this.dw_2=create dw_2
this.rb_dw2=create rb_dw2
this.rb_dw1=create rb_dw1
this.st_4=create st_4
this.cb_5=create cb_5
this.cb_syn5=create cb_syn5
this.cb_syn4=create cb_syn4
this.cb_syn3=create cb_syn3
this.cb_syn2=create cb_syn2
this.cb_syn1=create cb_syn1
this.cb_roll=create cb_roll
this.cb_commit=create cb_commit
this.cb_4=create cb_4
this.st_1=create st_1
this.dw_1=create dw_1
this.cb_3=create cb_3
this.cb_2=create cb_2
this.mle_1=create mle_1
this.cb_1=create cb_1
this.gb_3=create gb_3
this.gb_2=create gb_2
this.gb_1=create gb_1
this.Control[]={this.cb_8,&
this.cb_7,&
this.cb_sort,&
this.rb_split,&
this.rb_2f,&
this.rb_1f,&
this.cb_image,&
this.cb_verif,&
this.cb_6,&
this.cb_syn10,&
this.cb_syn9,&
this.cb_syn8,&
this.cb_syn7,&
this.cb_syn6,&
this.st_6,&
this.st_5,&
this.st_2,&
this.st_3,&
this.dw_2,&
this.rb_dw2,&
this.rb_dw1,&
this.st_4,&
this.cb_5,&
this.cb_syn5,&
this.cb_syn4,&
this.cb_syn3,&
this.cb_syn2,&
this.cb_syn1,&
this.cb_roll,&
this.cb_commit,&
this.cb_4,&
this.st_1,&
this.dw_1,&
this.cb_3,&
this.cb_2,&
this.mle_1,&
this.cb_1,&
this.gb_3,&
this.gb_2,&
this.gb_1}
end on

on w_sql_send.destroy
destroy(this.cb_8)
destroy(this.cb_7)
destroy(this.cb_sort)
destroy(this.rb_split)
destroy(this.rb_2f)
destroy(this.rb_1f)
destroy(this.cb_image)
destroy(this.cb_verif)
destroy(this.cb_6)
destroy(this.cb_syn10)
destroy(this.cb_syn9)
destroy(this.cb_syn8)
destroy(this.cb_syn7)
destroy(this.cb_syn6)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.dw_2)
destroy(this.rb_dw2)
destroy(this.rb_dw1)
destroy(this.st_4)
destroy(this.cb_5)
destroy(this.cb_syn5)
destroy(this.cb_syn4)
destroy(this.cb_syn3)
destroy(this.cb_syn2)
destroy(this.cb_syn1)
destroy(this.cb_roll)
destroy(this.cb_commit)
destroy(this.cb_4)
destroy(this.st_1)
destroy(this.dw_1)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.mle_1)
destroy(this.cb_1)
destroy(this.gb_3)
destroy(this.gb_2)
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

type cb_8 from commandbutton within w_sql_send
integer x = 672
integer y = 648
integer width = 325
integer height = 84
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Select Query"
end type

event clicked;string ls_sql

openwithparm(w_sql_query_select, "A")

ls_sql = message.stringparm

if ls_sql = "Cancel" then
	return
else
	mle_1.text = ls_sql
end if

end event

type cb_7 from commandbutton within w_sql_send
integer x = 361
integer y = 648
integer width = 302
integer height = 84
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Save Query"
end type

event clicked;string ls_sql
string ls_presentation_str
string ls_dwsyntax_str
string ERRORS
long cnt
//u_dw ldw_export_data

ls_sql = mle_1.text

openwithparm(w_sql_query_select,"N@" + ls_sql)

//if len(ls_sql) < 10 then 
//	return
//else
//	select max(list_id) into :cnt from sql_query_list;
//end if
//
//if isnull(cnt) then cnt = 0
//cnt++
//
//dw_save.insertrow(1)




end event

type cb_sort from commandbutton within w_sql_send
integer x = 2135
integer y = 648
integer width = 247
integer height = 84
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Sort"
end type

event clicked;string null_str

SetNull(null_str)
dw_1.SetSort(null_str)
dw_1.Sort()
end event

type rb_split from radiobutton within w_sql_send
integer x = 1385
integer y = 60
integer width = 174
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Split"
boolean checked = true
boolean lefttext = true
end type

event clicked;dw_1.y = 748
dw_1.height = 888
dw_2.y = 1660
dw_2.height = 460
dw_1.visible = true
dw_2.visible = true
end event

type rb_2f from radiobutton within w_sql_send
integer x = 1170
integer y = 60
integer width = 174
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "2 full"
boolean lefttext = true
end type

event clicked;
dw_2.y = 748
dw_2.height = 1460
dw_1.visible = false
dw_2.visible = true
end event

type rb_1f from radiobutton within w_sql_send
integer x = 951
integer y = 60
integer width = 183
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "1 full"
boolean lefttext = true
end type

event clicked;dw_1.y = 748
dw_1.height = 1460
dw_2.visible = false
dw_1.visible = true
end event

type cb_image from commandbutton within w_sql_send
integer x = 69
integer y = 100
integer width = 279
integer height = 80
integer taborder = 250
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "PD images"
end type

event clicked;//Start Code Change ---- 11.12.2007 #V7 maha added additional fields
mle_1.text = "select rec_id ,	prac_id ,	facility_id ,	seq_no ,	screen_id ,	date_scanned ,	user_name ,	date_recieved ,	active_status ,	doc_id ,	notes,	num_pages ,	reference_name, 	tif_start_page, 	image_type_id ,	file_name,modify_date,de_queue from pd_images;"


end event

type cb_verif from commandbutton within w_sql_send
integer x = 69
integer y = 16
integer width = 279
integer height = 80
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Verif info"
end type

event clicked;mle_1.text = "select distinct rec_id,	prac_id ,	facility_id ,	seq_no ,	screen_id ,	first_sent ,	last_sent ,	number_sent ,	date_recieved ,	user_name ,	source ,	response_code ,	active_status ,	verification_method,	expiration_date ,	verification_id ,	reference_value ,	address_lookup_code ,	verifying_facility ,	priority_user ,	priority ,	exp_credential_flag ,	doc_id ,	print_flag ,	direct_parent_facility_link ,	notes 	from verif_info;"
end event

type cb_6 from commandbutton within w_sql_send
integer x = 2400
integer y = 648
integer width = 247
integer height = 84
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Filter"
end type

event clicked;string null_str

SetNull(null_str)
dw_1.SetFilter(null_str)
dw_1.Filter()
end event

type cb_syn10 from commandbutton within w_sql_send
integer x = 2752
integer y = 60
integer width = 119
integer height = 84
integer taborder = 180
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

type cb_syn9 from commandbutton within w_sql_send
integer x = 2633
integer y = 60
integer width = 96
integer height = 84
integer taborder = 200
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

type cb_syn8 from commandbutton within w_sql_send
integer x = 2514
integer y = 60
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

type cb_syn7 from commandbutton within w_sql_send
integer x = 2395
integer y = 60
integer width = 96
integer height = 84
integer taborder = 210
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

type cb_syn6 from commandbutton within w_sql_send
integer x = 2277
integer y = 60
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
string text = "6"
end type

event clicked;of_get_syn(6)
end event

type st_6 from statictext within w_sql_send
integer x = 3273
integer y = 2164
integer width = 178
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
string text = "#2"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_5 from statictext within w_sql_send
integer x = 3415
integer y = 652
integer width = 87
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "#1"
boolean focusrectangle = false
end type

type st_2 from statictext within w_sql_send
integer x = 2670
integer y = 2168
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
string text = "0"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_3 from statictext within w_sql_send
integer x = 3072
integer y = 2168
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

type dw_2 from datawindow within w_sql_send
integer x = 41
integer y = 1660
integer width = 3401
integer height = 460
integer taborder = 80
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
end type

type rb_dw2 from radiobutton within w_sql_send
integer x = 699
integer y = 60
integer width = 137
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "#2"
boolean lefttext = true
end type

type rb_dw1 from radiobutton within w_sql_send
integer x = 457
integer y = 60
integer width = 133
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "#1"
boolean checked = true
boolean lefttext = true
end type

type st_4 from statictext within w_sql_send
integer x = 3205
integer y = 652
integer width = 206
integer height = 72
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

type cb_5 from commandbutton within w_sql_send
integer x = 2661
integer y = 648
integer width = 247
integer height = 84
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Export"
end type

event clicked;
if rb_dw1.checked = true then 
	dw_1.saveas()
elseif rb_dw2.checked = true then 
	dw_2.saveas()
end if
	
	//restore Directory  
//added by nova 2008-04-29
ChangeDirectory ( gs_dir_path )	
	
	
	
	
	
end event

type cb_syn5 from commandbutton within w_sql_send
integer x = 2158
integer y = 60
integer width = 96
integer height = 84
integer taborder = 220
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

type cb_syn4 from commandbutton within w_sql_send
integer x = 2039
integer y = 60
integer width = 96
integer height = 84
integer taborder = 190
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

type cb_syn3 from commandbutton within w_sql_send
integer x = 1920
integer y = 60
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
string text = "3"
end type

event clicked;of_get_syn(3)
end event

type cb_syn2 from commandbutton within w_sql_send
integer x = 1801
integer y = 60
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
string text = "2"
end type

event clicked;of_get_syn(2)
end event

type cb_syn1 from commandbutton within w_sql_send
integer x = 1682
integer y = 60
integer width = 96
integer height = 84
integer taborder = 90
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

type cb_roll from commandbutton within w_sql_send
integer x = 1870
integer y = 648
integer width = 247
integer height = 84
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Rollback"
end type

event clicked;rollback using sqlca;
end event

type cb_commit from commandbutton within w_sql_send
integer x = 1605
integer y = 648
integer width = 247
integer height = 84
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Commit"
end type

event clicked;commit using sqlca;
end event

type cb_4 from commandbutton within w_sql_send
integer x = 1344
integer y = 648
integer width = 247
integer height = 84
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Update"
end type

event clicked;
if rb_dw1.checked = true then 
	dw_1.update()
elseif rb_dw1.checked = true then 
	dw_2.update()
end if
//commit using sqlca;
cb_commit.enabled = true
cb_roll.enabled = true
end event

type st_1 from statictext within w_sql_send
integer x = 2921
integer y = 652
integer width = 279
integer height = 72
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

type dw_1 from datawindow within w_sql_send
integer x = 32
integer y = 748
integer width = 3401
integer height = 888
integer taborder = 70
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
end type

type cb_3 from commandbutton within w_sql_send
integer x = 1083
integer y = 648
integer width = 247
integer height = 84
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Clear"
end type

event clicked;mle_1.text = ""
dw_1.reset()
dw_2.reset()
end event

type cb_2 from commandbutton within w_sql_send
integer x = 3163
integer y = 72
integer width = 247
integer height = 84
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Close"
end type

event clicked;close(parent)
end event

type mle_1 from multilineedit within w_sql_send
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

type cb_1 from commandbutton within w_sql_send
integer x = 73
integer y = 648
integer width = 274
integer height = 84
integer taborder = 230
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Execute"
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
	
	if rb_dw1.checked = true then 
		dw_1.Create( ls_dwsyntax_str, ERRORS)
		dw_1.SetTransObject( SQLCA )
		cnt = dw_1.retrieve()
		st_1.text = string(cnt)
	elseif rb_dw2.checked = true then 
		dw_2.Create( ls_dwsyntax_str, ERRORS)
		dw_2.SetTransObject( SQLCA )
		cnt = dw_2.retrieve()
		st_2.text = string(cnt)
	end if
		cb_commit.enabled = false
		cb_roll.enabled = false
else
	execute immediate :ls_sql using sqlca;
	If SQLCA.sqlcode <> 0 Then
		Messagebox('Error', SQLCA.sqlerrtext )
		Rollback using sqlca;
	End If
	cb_commit.enabled = true
	cb_roll.enabled = true
end if

of_syn()

end event

type gb_3 from groupbox within w_sql_send
integer x = 923
integer width = 690
integer height = 168
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Size"
end type

type gb_2 from groupbox within w_sql_send
integer x = 407
integer width = 494
integer height = 168
integer taborder = 260
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Window"
end type

type gb_1 from groupbox within w_sql_send
integer x = 1641
integer width = 1271
integer height = 168
integer taborder = 240
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

