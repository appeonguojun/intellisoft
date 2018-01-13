$PBExportHeader$w_iapp_conv_new.srw
forward
global type w_iapp_conv_new from window
end type
type sle_1 from singlelineedit within w_iapp_conv_new
end type
type cb_2 from commandbutton within w_iapp_conv_new
end type
type cb_1 from commandbutton within w_iapp_conv_new
end type
type cb_8 from commandbutton within w_iapp_conv_new
end type
type cb_7 from commandbutton within w_iapp_conv_new
end type
type cb_6 from commandbutton within w_iapp_conv_new
end type
type st_2 from statictext within w_iapp_conv_new
end type
type st_1 from statictext within w_iapp_conv_new
end type
type dw_4 from datawindow within w_iapp_conv_new
end type
type dw_3 from datawindow within w_iapp_conv_new
end type
type dw_list from datawindow within w_iapp_conv_new
end type
type dw_1 from datawindow within w_iapp_conv_new
end type
type cb_3 from commandbutton within w_iapp_conv_new
end type
end forward

global type w_iapp_conv_new from window
integer x = 357
integer y = 512
integer width = 2862
integer height = 2124
boolean titlebar = true
string title = "Create text file for IApp rows"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 79741120
sle_1 sle_1
cb_2 cb_2
cb_1 cb_1
cb_8 cb_8
cb_7 cb_7
cb_6 cb_6
st_2 st_2
st_1 st_1
dw_4 dw_4
dw_3 dw_3
dw_list dw_list
dw_1 dw_1
cb_3 cb_3
end type
global w_iapp_conv_new w_iapp_conv_new

type variables
integer ii_appid
end variables

on w_iapp_conv_new.create
this.sle_1=create sle_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.cb_8=create cb_8
this.cb_7=create cb_7
this.cb_6=create cb_6
this.st_2=create st_2
this.st_1=create st_1
this.dw_4=create dw_4
this.dw_3=create dw_3
this.dw_list=create dw_list
this.dw_1=create dw_1
this.cb_3=create cb_3
this.Control[]={this.sle_1,&
this.cb_2,&
this.cb_1,&
this.cb_8,&
this.cb_7,&
this.cb_6,&
this.st_2,&
this.st_1,&
this.dw_4,&
this.dw_3,&
this.dw_list,&
this.dw_1,&
this.cb_3}
end on

on w_iapp_conv_new.destroy
destroy(this.sle_1)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.cb_8)
destroy(this.cb_7)
destroy(this.cb_6)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.dw_4)
destroy(this.dw_3)
destroy(this.dw_list)
destroy(this.dw_1)
destroy(this.cb_3)
end on

event open;SQLCA.DBMS="ODBC"
SQLCA.DbParm="ConnectString='DSN=Iapp;UID=DBA;PWD=SQL;',DelimitIdentifier='Yes'"

//--------------------------- APPEON BEGIN ---------------------------
//$< Add  > 2007-09-14 By: Scofield
//$<Reason> Set the connection cache dynamically on Web
if AppeonGetClientType() = 'WEB' then
	SQLCA.DBMS = gs_CacheType
	SQLCA.DBParm = gs_CacheSet
end if
//---------------------------- APPEON END ----------------------------

CONNECT USING SQLCA;

IF SQLCA.SQLCODE = -1 THEN
	MessageBox("Not Logged In", "Login Failed!")
ELSE
	//MESSAGEBOX("","LOGIN OK")
END IF

dw_1.settransobject(sqlca)
dw_1.retrieve()
dw_1.insertrow(1)

dw_list.settransobject(sqlca)

gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17


end event

event close;disCONNECT USING SQLCA;
end event

type sle_1 from singlelineedit within w_iapp_conv_new
integer x = 1879
integer y = 1164
integer width = 736
integer height = 92
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type cb_2 from commandbutton within w_iapp_conv_new
integer x = 2382
integer y = 404
integer width = 416
integer height = 108
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Print App List"
end type

event clicked;dw_list.print()
end event

type cb_1 from commandbutton within w_iapp_conv_new
integer x = 2409
integer y = 276
integer width = 384
integer height = 108
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Go to Import"
end type

event clicked;

//open(w_open)
close(parent)
end event

type cb_8 from commandbutton within w_iapp_conv_new
integer x = 1591
integer y = 1156
integer width = 247
integer height = 108
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "save"
end type

event clicked;
string f
string h

f = gs_dir_path + gs_DefDirName + "\import_app_rows " + sle_1.text +".txt"
h = gs_dir_path + gs_DefDirName + "\import_hdr_rows " + sle_1.text +".txt"

dw_4.saveas(f,text!,false)
dw_list.saveas(h,text!,false)

 messagebox("Saved","Saved as " + f + " and " + h)
end event

type cb_7 from commandbutton within w_iapp_conv_new
integer x = 1586
integer y = 1028
integer width = 407
integer height = 108
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Retrieve rows"
end type

event clicked;integer i
integer rc
integer app
integer ac
dw_4.settransobject(sqlca)
dw_4.reset()

rc = dw_list.rowcount()
for i = 1 to rc
	dw_3.settransobject(sqlca)
	dw_3.reset()
	app = dw_list.getitemnumber(i,"app_id")
	ac = dw_3.retrieve(app)
	dw_3.RowsCopy (1,ac, primary!, dw_4, 10000000, primary!)
	
next
end event

type cb_6 from commandbutton within w_iapp_conv_new
integer x = 1664
integer y = 32
integer width = 494
integer height = 108
integer taborder = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Remove from list"
end type

event clicked;dw_list.deleterow(dw_list.getrow())
end event

type st_2 from statictext within w_iapp_conv_new
integer x = 1349
integer y = 24
integer width = 247
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "App List"
boolean focusrectangle = false
end type

type st_1 from statictext within w_iapp_conv_new
integer x = 571
integer y = 8
integer width = 366
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Select Apps"
boolean focusrectangle = false
end type

type dw_4 from datawindow within w_iapp_conv_new
integer x = 2039
integer y = 1032
integer width = 347
integer height = 100
integer taborder = 60
string dataobject = "d_app_prop_app"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
end event

type dw_3 from datawindow within w_iapp_conv_new
integer x = 1733
integer y = 1052
integer width = 119
integer height = 60
integer taborder = 50
string dataobject = "d_app_prop_app"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
end event

type dw_list from datawindow within w_iapp_conv_new
integer x = 1518
integer y = 1336
integer width = 1257
integer height = 492
integer taborder = 30
string dataobject = "d_app_hdr_ids"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)

end event

event clicked;integer r


r = this.getclickedrow()
this.setrow(r)
this.scrolltorow(r)
this.selectrow(0,false)
this.selectrow(r,true)
end event

type dw_1 from datawindow within w_iapp_conv_new
integer x = 64
integer y = 100
integer width = 1339
integer height = 1872
integer taborder = 10
string dataobject = "d_dddw_app_hdr_all"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;
integer r

ii_appid = integer(data)

r = dw_1.Find ( "app_id = " + string(ii_appid), 1, dw_1.rowcount() )

dw_1.RowsCopy (r,r, primary!, dw_list, 100000, primary!)
end event

type cb_3 from commandbutton within w_iapp_conv_new
integer x = 2487
integer y = 64
integer width = 274
integer height = 108
integer taborder = 20
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

